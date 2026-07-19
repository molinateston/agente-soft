#!/usr/bin/env node
// Sensor de saúde da VPS Hostinger + processos locais.
// Uso:
//   node hostinger-health.cjs            -> imprime JSON
//   node hostinger-health.cjs --markdown -> imprime bloco humano
//   node hostinger-health.cjs --alert    -> compara com estado anterior e avisa no Telegram só quando muda semáforo

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');
const https = require('https');

function loadEnv() {
  // Cliente: .env fica na raiz do bridge (../ do workers). LEON: /home/cloud/.openclaw/.env.
  const candidates = [
    path.join(__dirname, '..', '.env'),
    '/home/cloud/.openclaw/.env'
  ];
  for (const p of candidates) {
    if (!fs.existsSync(p)) continue;
    const raw = fs.readFileSync(p, 'utf8');
    for (const line of raw.split('\n')) {
      const m = line.match(/^\s*([A-Z0-9_]+)\s*=\s*(.*)\s*$/);
      if (!m) continue;
      if (process.env[m[1]] === undefined) {
        let v = m[2];
        if ((v.startsWith('"') && v.endsWith('"')) || (v.startsWith("'") && v.endsWith("'"))) v = v.slice(1, -1);
        process.env[m[1]] = v;
      }
    }
  }
}
loadEnv();

const TOKEN = process.env.HOSTINGER_API_TOKEN;
const VM_ID = process.env.HOSTINGER_VM_ID;
const BOT_TOKEN = process.env.TELEGRAM_BOT_TOKEN;
const OWNER = process.env.OWNER_CHAT_ID;

function apiGet(pathQ) {
  return new Promise((resolve, reject) => {
    const req = https.request({
      host: 'developers.hostinger.com',
      path: `/api/vps/v1${pathQ}`,
      method: 'GET',
      headers: { Authorization: `Bearer ${TOKEN}`, Accept: 'application/json' }
    }, res => {
      let data = '';
      res.on('data', c => data += c);
      res.on('end', () => {
        if (res.statusCode >= 200 && res.statusCode < 300) {
          try { resolve(JSON.parse(data)); } catch (e) { reject(new Error(`parse ${res.statusCode}: ${data.slice(0,200)}`)); }
        } else {
          reject(new Error(`HTTP ${res.statusCode}: ${data.slice(0,200)}`));
        }
      });
    });
    req.on('error', reject);
    req.setTimeout(15000, () => { req.destroy(new Error('timeout')); });
    req.end();
  });
}

function sh(cmd) { try { return execSync(cmd, { encoding: 'utf8', timeout: 8000 }).trim(); } catch (e) { return ''; } }

function iso(d) { return d.toISOString().replace(/\.\d+Z$/, 'Z'); }

function lastPoint(usage) {
  if (!usage || typeof usage !== 'object') return null;
  const ks = Object.keys(usage).map(Number).filter(n => !isNaN(n)).sort((a,b) => b - a);
  return ks.length ? usage[ks[0]] : null;
}

async function collect() {
  const now = new Date();
  const from = new Date(now.getTime() - 2 * 60 * 60 * 1000);
  const [vm, metrics, backups] = await Promise.all([
    apiGet(`/virtual-machines/${VM_ID}`),
    apiGet(`/virtual-machines/${VM_ID}/metrics?date_from=${iso(from)}&date_to=${iso(now)}`),
    apiGet(`/virtual-machines/${VM_ID}/backups?per_page=5`).catch(() => ({ data: [] }))
  ]);

  const memTotal = (vm.memory || 8192) * 1024 * 1024;
  const diskTotal = (vm.disk || 102400) * 1024 * 1024;
  const cpuUsage = lastPoint(metrics?.cpu_usage?.usage);
  const ramBytes = lastPoint(metrics?.ram_usage?.usage);
  const diskBytes = lastPoint(metrics?.disk_space?.usage);

  const localMem = sh("free -m | awk '/^Mem:/ {printf \"%d %d\", $2, $3}'");
  const [localTotal, localUsed] = localMem.split(' ').map(Number);
  const localDisk = sh("df -BM --output=size,used / | tail -1 | awk '{gsub(\"M\",\"\"); printf \"%d %d\", $1, $2}'");
  const [dTotalMB, dUsedMB] = localDisk.split(' ').map(Number);
  const uptime = sh('uptime -p');

  // Detecta serviços do usuário automaticamente (LEON: lean-*; cliente: agente).
  // Só entra no radar o que EXISTE no systemd — evita false-alarm "bot caído" quando o serviço nem foi criado.
  const bots = {};
  const known = ['lean-leon', 'lean-levin', 'lean-mamoca', 'agente'];
  for (const svc of known) {
    const loaded = sh(`systemctl --user show -p LoadState --value ${svc}`);
    if (loaded !== 'loaded') continue;
    const st = sh(`systemctl --user is-active ${svc}`);
    bots[svc] = st || 'unknown';
  }

  let backupAge = null;
  const lastBackup = backups?.data?.[0];
  if (lastBackup?.created_at) {
    backupAge = Math.floor((now.getTime() - new Date(lastBackup.created_at).getTime()) / 86400000);
  }

  const ramPct = ramBytes != null
    ? Math.round((ramBytes / memTotal) * 100)
    : (localTotal ? Math.round((localUsed / localTotal) * 100) : null);
  const diskPct = diskBytes != null
    ? Math.round((diskBytes / diskTotal) * 100)
    : (dTotalMB ? Math.round((dUsedMB / dTotalMB) * 100) : null);
  const cpuPct = cpuUsage != null ? Math.round(cpuUsage) : null;

  const alerts = [];
  let level = 0; // 0 verde, 1 amarelo, 2 vermelho
  const bump = (l, msg) => { if (l > level) level = l; alerts.push(msg); };

  if (ramPct != null) {
    if (ramPct > 85) bump(2, `RAM ${ramPct}%`);
    else if (ramPct > 70) bump(1, `RAM ${ramPct}%`);
  }
  if (diskPct != null) {
    if (diskPct > 85) bump(2, `disco ${diskPct}%`);
    else if (diskPct > 70) bump(1, `disco ${diskPct}%`);
  }
  if (cpuPct != null) {
    if (cpuPct > 85) bump(2, `CPU ${cpuPct}%`);
    else if (cpuPct > 70) bump(1, `CPU ${cpuPct}%`);
  }
  if (backupAge != null) {
    if (backupAge > 14) bump(2, `backup ${backupAge}d`);
    else if (backupAge > 8) bump(1, `backup ${backupAge}d`);
  } else {
    bump(1, 'sem backup registrado');
  }
  const inactive = Object.entries(bots).filter(([, s]) => s !== 'active').map(([n]) => n);
  if (inactive.length >= 2) bump(2, `bots caídos: ${inactive.join(', ')}`);
  else if (inactive.length === 1) bump(1, `bot caído: ${inactive[0]}`);

  const semaforo = level === 0 ? 'verde' : level === 1 ? 'amarelo' : 'vermelho';
  const emoji = level === 0 ? '🟢' : level === 1 ? '🟡' : '🔴';

  return {
    ts: now.toISOString(),
    semaforo,
    emoji,
    ram_pct: ramPct,
    disk_pct: diskPct,
    cpu_pct: cpuPct,
    backup_age_days: backupAge,
    bots,
    uptime,
    vm: { hostname: vm.hostname, plan: vm.plan, state: vm.state, cpus: vm.cpus, memory_mb: vm.memory, disk_mb: vm.disk },
    last_backup: lastBackup ? { created_at: lastBackup.created_at, size_mb: Math.round((lastBackup.size||0)/1024/1024) } : null,
    alerts
  };
}

function toMarkdown(h) {
  const lines = [];
  lines.push(`${h.emoji} VPS ${h.vm.hostname || ''} · ${h.semaforo}`);
  const parts = [];
  if (h.ram_pct != null) parts.push(`RAM ${h.ram_pct}%`);
  if (h.disk_pct != null) parts.push(`disco ${h.disk_pct}%`);
  if (h.cpu_pct != null) parts.push(`CPU ${h.cpu_pct}%`);
  if (h.backup_age_days != null) parts.push(`backup ${h.backup_age_days}d`);
  if (parts.length) lines.push(parts.join(' · '));
  const botLine = Object.entries(h.bots).map(([n, s]) => `${n.replace('lean-','')}:${s === 'active' ? 'ok' : s}`).join(' · ');
  lines.push(`bots · ${botLine}`);
  if (h.uptime) lines.push(h.uptime);
  if (h.alerts.length) lines.push(`atenção · ${h.alerts.join(' · ')}`);
  return lines.join('\n');
}

function sendTelegram(text) {
  if (!BOT_TOKEN || !OWNER) return Promise.resolve();
  const body = JSON.stringify({ chat_id: Number(OWNER), text });
  return new Promise((resolve) => {
    const req = https.request({
      host: 'api.telegram.org',
      path: `/bot${BOT_TOKEN}/sendMessage`,
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'Content-Length': Buffer.byteLength(body) }
    }, res => { res.on('data', () => {}); res.on('end', resolve); });
    req.on('error', () => resolve());
    req.setTimeout(10000, () => { req.destroy(); resolve(); });
    req.write(body); req.end();
  });
}

async function main() {
  if (!TOKEN) { console.error('HOSTINGER_API_TOKEN ausente no .env'); process.exit(1); }
  if (!VM_ID) { console.error('HOSTINGER_VM_ID ausente no .env (id da sua VPS na Hostinger)'); process.exit(1); }
  const args = process.argv.slice(2);
  const h = await collect();

  if (args.includes('--markdown')) {
    console.log(toMarkdown(h));
    return;
  }

  if (args.includes('--alert')) {
    // Estado do alert: no LEON vai em ~/.openclaw/state; no cliente vai em ./state ao lado do bridge.
    const stateDir = fs.existsSync('/home/cloud/.openclaw')
      ? '/home/cloud/.openclaw/state'
      : path.join(__dirname, '..', 'state');
    fs.mkdirSync(stateDir, { recursive: true });
    const statePath = path.join(stateDir, 'hostinger-health-last.json');
    let prev = null;
    if (fs.existsSync(statePath)) {
      try { prev = JSON.parse(fs.readFileSync(statePath, 'utf8')); } catch {}
    }
    const prevSem = prev?.semaforo || null;
    const changed = prevSem !== null && prevSem !== h.semaforo;
    fs.writeFileSync(statePath, JSON.stringify(h, null, 2));

    if (changed) {
      let msg;
      if (h.semaforo === 'verde') {
        msg = `🟢 VPS voltou ao verde. Estava ${prevSem}.`;
      } else {
        msg = `${h.emoji} VPS · ${h.alerts.join(' · ') || h.semaforo}. Aviso de novo se piorar.`;
      }
      await sendTelegram(msg);
      console.log(`[alert enviado] ${prevSem} -> ${h.semaforo}`);
    } else {
      console.log(`[sem mudança] ${h.semaforo}`);
    }
    return;
  }

  console.log(JSON.stringify(h, null, 2));
}

main().catch(err => { console.error(err.message); process.exit(1); });
