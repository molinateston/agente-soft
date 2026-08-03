// Projeto LEON · client-side license verification
// Estrategia: enforcement so na janela de 15 dias pos primeiro activate.
// Depois disso, licenca vira permanente (o cliente nao depende mais do central).

const fs = require('fs');
const path = require('path');
const https = require('https');
const http = require('http');
const { URL } = require('url');

const CACHE_FILE = process.env.LEON_LICENSE_CACHE || path.join(process.env.HOME || '/root', '.leon-license.json');
const CENTRAL = (process.env.LEON_LICENSE_CENTRAL || 'https://licenca.leonardomolina.com.br').replace(/\/$/, '');
const KEY = process.env.LEON_LICENSE_KEY || '';
const EMAIL = process.env.LEON_LICENSE_EMAIL || '';
const MACHINE_ID = process.env.LEON_MACHINE_ID || '';

function idQuery() {
  if (EMAIL) return `email=${encodeURIComponent(EMAIL)}`;
  if (KEY) return `key=${encodeURIComponent(KEY)}`;
  return '';
}
function idBody() {
  if (EMAIL) return { email: EMAIL, machine_id: MACHINE_ID };
  return { key: KEY, machine_id: MACHINE_ID };
}
const REFUND_WINDOW_MS = 15 * 24 * 60 * 60 * 1000;
const OFFLINE_TOLERANCE_MS = 24 * 60 * 60 * 1000; // 24h sem central e ainda dentro dos 15d = bloqueia

let state = {
  first_activated_at: null,
  refund_window_ends_at: null,
  last_success_at: null,
  last_check_at: null,
  blocked: false,
  blocked_reason: null
};

function loadState() {
  try {
    if (fs.existsSync(CACHE_FILE)) {
      state = { ...state, ...JSON.parse(fs.readFileSync(CACHE_FILE, 'utf8')) };
    }
  } catch (e) { /* ignora */ }
}
function saveState() {
  try {
    fs.writeFileSync(CACHE_FILE, JSON.stringify(state, null, 2));
    fs.chmodSync(CACHE_FILE, 0o600);
  } catch (e) { console.error('[license] falha ao salvar cache:', e.message); }
}

function fetchJson(url, { method = 'GET', body } = {}, timeoutMs = 8000) {
  return new Promise((resolve, reject) => {
    const u = new URL(url);
    const lib = u.protocol === 'https:' ? https : http;
    const opts = {
      method,
      hostname: u.hostname,
      port: u.port || (u.protocol === 'https:' ? 443 : 80),
      path: u.pathname + u.search,
      headers: { 'Accept': 'application/json' }
    };
    if (body) {
      opts.headers['Content-Type'] = 'application/json';
      opts.headers['Content-Length'] = Buffer.byteLength(body);
    }
    const req = lib.request(opts, res => {
      let chunks = '';
      res.on('data', c => chunks += c);
      res.on('end', () => {
        try { resolve({ status: res.statusCode, body: JSON.parse(chunks || '{}') }); }
        catch { resolve({ status: res.statusCode, body: {} }); }
      });
    });
    req.on('error', reject);
    req.setTimeout(timeoutMs, () => { req.destroy(new Error('timeout')); });
    if (body) req.write(body);
    req.end();
  });
}

async function activate() {
  loadState();
  if ((!KEY && !EMAIL) || !MACHINE_ID) {
    return { ok: false, reason: 'faltam LEON_LICENSE_EMAIL/KEY ou LEON_MACHINE_ID no .env' };
  }
  // Ja ativada localmente? nao precisa
  if (state.first_activated_at) return { ok: true, already: true };
  try {
    const r = await fetchJson(`${CENTRAL}/activate`, {
      method: 'POST',
      body: JSON.stringify(idBody())
    });
    if (r.status === 200 && r.body.ok) {
      state.first_activated_at = r.body.first_activated_at;
      state.refund_window_ends_at = r.body.refund_window_ends_at;
      state.last_success_at = Date.now();
      state.last_check_at = Date.now();
      state.blocked = false;
      state.blocked_reason = null;
      saveState();
      return { ok: true };
    }
    return { ok: false, reason: r.body.code || 'ativacao_falhou', detail: r.body };
  } catch (e) {
    return { ok: false, reason: 'central_inatingivel', detail: e.message };
  }
}

async function check() {
  loadState();
  const now = Date.now();
  const inRefundWindow = state.refund_window_ends_at ? now < state.refund_window_ends_at : true;
  // 03/08 — O BLOQUEIO EXPIRA, A VISIBILIDADE NAO DEVIA.
  // Antes, passados os 15 dias, esta funcao retornava aqui e NUNCA MAIS batia no central. Fazia
  // sentido pro que ela nasceu pra decidir (a licenca ja e permanente, nao ha o que bloquear) —
  // mas como e o mesmo caminho que reporta o sinal de vida, o cliente sumia do painel pra sempre.
  // Com 6 instalados e a primeira janela fechando em 12/08, o dono ia ficar cego pela frota
  // inteira sem nada quebrar visivelmente.
  // Agora: continua devolvendo permanent:true na hora (nada bloqueia, nada espera rede), mas
  // dispara o ping em segundo plano so pra dizer "estou vivo, nesta versao". Falha de rede e
  // ignorada de proposito: reportar presenca nunca pode atrapalhar quem ja pagou.
  if (state.first_activated_at && !inRefundWindow) {
    fetchJson(`${CENTRAL}/status?${idQuery()}`).catch(() => {});
    return { ativo: true, permanent: true, refund_window_ends_at: state.refund_window_ends_at };
  }
  // Ainda em periodo de reembolso — bate no central
  try {
    const r = await fetchJson(`${CENTRAL}/status?${idQuery()}`);
    state.last_check_at = now;
    if (r.status === 200 && r.body.ok !== false) {
      const ativo = r.body.ativo === true;
      state.last_success_at = now;
      if (r.body.refund_window_ends_at) state.refund_window_ends_at = r.body.refund_window_ends_at;
      if (r.body.first_activated_at && !state.first_activated_at) state.first_activated_at = r.body.first_activated_at;
      state.blocked = !ativo;
      state.blocked_reason = ativo ? null : (r.body.motivo || 'bloqueado_pelo_central');
      saveState();
      return { ativo, permanent: false, motivo: r.body.motivo, refund_window_ends_at: state.refund_window_ends_at };
    }
    if (r.status === 404) {
      state.blocked = true;
      state.blocked_reason = 'licenca_nao_reconhecida';
      saveState();
      return { ativo: false, motivo: 'licenca_nao_reconhecida' };
    }
    saveState();
    // Erro nao-fatal: falhou consulta mas ainda tem margem offline
    if (state.last_success_at && (now - state.last_success_at) < OFFLINE_TOLERANCE_MS) {
      return { ativo: true, permanent: false, degraded: true };
    }
    return { ativo: false, motivo: 'sem_conexao_com_central_24h' };
  } catch (e) {
    state.last_check_at = now;
    saveState();
    if (state.last_success_at && (now - state.last_success_at) < OFFLINE_TOLERANCE_MS) {
      return { ativo: true, permanent: false, degraded: true, warn: e.message };
    }
    return { ativo: false, motivo: 'sem_conexao_com_central_24h', warn: e.message };
  }
}

function startHeartbeat(intervalMs = 15 * 60 * 1000) {
  // roda uma vez ja no arranque + intervalo
  setTimeout(() => { check().catch(() => {}); }, 60_000);
  setInterval(() => { check().catch(() => {}); }, intervalMs);
}

function isBlocked() { loadState(); return !!state.blocked; }
function blockedReason() { loadState(); return state.blocked_reason || 'licenca_bloqueada'; }
function getState() { loadState(); return { ...state }; }

// A mensagem que o cliente ve quando a licenca cai. Mora AQUI, e nao no motor, porque o
// motor e o mesmo arquivo nos dois pacotes: texto de produto pago escrito la dentro
// viajaria junto pro pacote publico. Este arquivo nunca sai do pacote pago.
function blockedMessage() {
  return `Sua licenca do Projeto LEON foi encerrada (motivo: ${blockedReason()}).\n\nPra reativar, fale com o suporte: https://wa.me/5511961562217`;
}

module.exports = {
  activate,
  check,
  startHeartbeat,
  isBlocked,
  blockedReason,
  blockedMessage,
  getState,
  CENTRAL,
  KEY_PRESENT: !!KEY,
  EMAIL_PRESENT: !!EMAIL
};
