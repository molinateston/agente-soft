#!/usr/bin/env node
// Report diario de tokens do agente (e dos irmaos que morarem no mesmo HOME).
// Le os transcripts em ~/.claude/projects/<dir>/*.jsonl, soma tokens por dia,
// separa cabeca x bracos, atribui sala pelo sid e monta o texto pro Telegram.
//
//   node workers/report-tokens.cjs              -> imprime o report de ontem
//   node workers/report-tokens.cjs --send       -> imprime e manda pra sala Tokens
//   node workers/report-tokens.cjs --dia 2026-07-30
"use strict";
const fs = require("fs");
const path = require("path");
const readline = require("readline");

const TZ = "America/Sao_Paulo";
const HOME = process.env.HOME || "/home/cloud";
const BRIDGE = path.resolve(__dirname, "..");
const PROJ = `${HOME}/.claude/projects`;
const PRECOS = JSON.parse(fs.readFileSync(`${BRIDGE}/lib/precos-tokens.json`, "utf8"));

// ---------- descoberta dos agentes ----------
// Nada e fixo: o worker se acha ao lado do proprio bridge.cjs e varre o HOME atras de
// irmaos (outro motor com topics.json). Numa instalacao de cliente ele encontra um so,
// que e o dono da casa. Numa VPS com varios (LEON/LEVIN/MAMOCA) encontra todos.
const projSlug = (p) => p.replace(/[/.]/g, "-");
function lerEnv(dir) {
  const env = {};
  try {
    for (const l of fs.readFileSync(`${dir}/.env`, "utf8").split("\n")) {
      const m = l.match(/^\s*([A-Z0-9_]+)\s*=\s*(.*)$/); if (m) env[m[1]] = m[2].trim().replace(/^["']|["']$/g, "");
    }
  } catch {}
  return env;
}
function nomeDe(dir) {
  const e = lerEnv(dir);
  if (e.AGENT_NAME) return e.AGENT_NAME.toUpperCase();
  const b = path.basename(dir).replace(/^lean-bridge-?/, "").replace(/^agente-?/, "");
  return (b || "AGENTE").toUpperCase();
}
function descobreAgentes() {
  const dirs = new Set([BRIDGE]);
  try {
    for (const f of fs.readdirSync(HOME)) {
      const d = `${HOME}/${f}`;
      if (!fs.existsSync(`${d}/bridge.cjs`) || !fs.existsSync(`${d}/topics.json`)) continue;
      if (fs.existsSync(`${PROJ}/${projSlug(d)}`)) dirs.add(d);
    }
  } catch {}
  return [...dirs].map((d) => ({ nome: nomeDe(d), dir: `${PROJ}/${projSlug(d)}`, base: d }))
    .filter((a) => fs.existsSync(a.dir))
    .sort((a, b) => (a.base === BRIDGE ? -1 : b.base === BRIDGE ? 1 : a.nome.localeCompare(b.nome)));
}
const AGENTES = descobreAgentes();

const arg = (k, d) => { const i = process.argv.indexOf(k); return i > 0 ? process.argv[i + 1] : d; };
const tem = (k) => process.argv.includes(k);

const dia = (ts) => new Intl.DateTimeFormat("en-CA", { timeZone: TZ, year: "numeric", month: "2-digit", day: "2-digit" }).format(new Date(ts));
const hojeStr = dia(Date.now());
const ontemStr = dia(Date.now() - 864e5);
const ALVO = arg("--dia", ontemStr);
const JANELA = 31; // dias que o scan cobre

const familia = (m = "") => (/opus/i.test(m) ? "opus" : /sonnet/i.test(m) ? "sonnet" : /haiku/i.test(m) ? "haiku" : null);

function custo(fam, u) {
  const p = PRECOS.familias[fam];
  if (!p) return 0;
  return (u.in * p.entrada + u.out * p.saida + u.cw * p.cache_grava + u.cr * p.cache_le) / 1e6;
}
const zero = () => ({ in: 0, out: 0, cw: 0, cr: 0, usd: 0, msgs: 0 });
function soma(a, b) { a.in += b.in; a.out += b.out; a.cw += b.cw; a.cr += b.cr; a.usd += b.usd; a.msgs += b.msgs; return a; }

// ---------- mapa sid -> sala ----------
function mapaSalas() {
  const map = {};       // sid -> label
  const labels = {};    // "chat:thread" -> label
  for (const ag of AGENTES) {
    try {
      const t = JSON.parse(fs.readFileSync(`${ag.base}/topics.json`, "utf8"));
      for (const [k, v] of Object.entries(t)) labels[`${ag.nome}:${k}`] = v.label || k;
    } catch {}
    try {
      const s = JSON.parse(fs.readFileSync(`${ag.base}/sessions.json`, "utf8"));
      for (const [k, v] of Object.entries(s)) if (v && v.sid) map[v.sid] = labels[`${ag.nome}:${k}`] || (k === "general" ? "DM" : k);
    } catch {}
    try {
      for (const f of fs.readdirSync(`${ag.base}/missions`)) {
        if (!f.endsWith(".json")) continue;
        const m = JSON.parse(fs.readFileSync(`${ag.base}/missions/${f}`, "utf8"));
        const lab = labels[`${ag.nome}:${m.chatId}:${m.threadId}`] || labels[`${ag.nome}:general`] || "DM";
        if (m.sid) map[m.sid] = `${lab} (missao)`;
      }
    } catch {}
  }
  return map;
}

// ---------- scan ----------
async function scan() {
  const corte = Date.now() - JANELA * 864e5;
  const porDia = {};   // data -> { agente -> acc }
  const detalhe = {};  // data -> { modelo, sala, cabeca/braco }
  for (const ag of AGENTES) {
    let arquivos = [];
    try { arquivos = fs.readdirSync(ag.dir).filter((f) => f.endsWith(".jsonl")); } catch { continue; }
    for (const f of arquivos) {
      const fp = `${ag.dir}/${f}`;
      let st; try { st = fs.statSync(fp); } catch { continue; }
      if (st.mtimeMs < corte) continue;
      const rl = readline.createInterface({ input: fs.createReadStream(fp), crlfDelay: Infinity });
      for await (const linha of rl) {
        if (!linha || linha.indexOf('"usage"') < 0) continue;
        let d; try { d = JSON.parse(linha); } catch { continue; }
        const m = d.message; if (!m || m.role !== "assistant" || !m.usage) continue;
        const u = m.usage;
        const reg = {
          in: u.input_tokens || 0,
          out: u.output_tokens || 0,
          cw: u.cache_creation_input_tokens || 0,
          cr: u.cache_read_input_tokens || 0,
          msgs: 1, usd: 0,
        };
        const fam = familia(m.model);
        reg.usd = custo(fam, reg);
        const dt = dia(d.timestamp || st.mtimeMs);
        if (dt > hojeStr) continue;
        porDia[dt] = porDia[dt] || {};
        porDia[dt][ag.nome] = soma(porDia[dt][ag.nome] || zero(), reg);
        const det = (detalhe[dt] = detalhe[dt] || { modelo: {}, sala: {}, braco: zero(), cabeca: zero(), semPreco: 0 });
        const fk = fam || "desconhecido";
        det.modelo[fk] = soma(det.modelo[fk] || zero(), reg);
        if (!fam) det.semPreco += reg.in + reg.out;
        const chave = d.isSidechain ? "braco" : "cabeca";
        det[chave] = soma(det[chave], reg);
        if (!d.isSidechain) {
          const sid = d.sessionId || "?";
          det.sala[sid] = soma(det.sala[sid] || zero(), reg);
        }
      }
    }
  }
  return { porDia, detalhe };
}

// ---------- feitos ----------
function feitos(dataAlvo) {
  const out = [];
  const [Y, M, D] = dataAlvo.split("-");
  for (const ag of AGENTES) {
    try {
      for (const f of fs.readdirSync(`${ag.base}/missions`)) {
        if (!f.endsWith(".json")) continue;
        const m = JSON.parse(fs.readFileSync(`${ag.base}/missions/${f}`, "utf8"));
        const t = Number(m.lastHeartbeat || m.startedAt || m.createdAt || 0);
        if (!t || dia(t) !== dataAlvo) continue;
        const txt = String(m.prompt || m.desc || "").replace(/\s+/g, " ").slice(0, 90);
        out.push(`${ag.nome} · ${m.status === "running" ? "rodando" : "fechada"} · ${txt}`);
      }
    } catch {}
  }
  const marcas = [];
  try {
    const av = fs.readFileSync(`${lerEnv(BRIDGE).BRAIN || HOME + "/.openclaw/brain"}/ASSUNTOS-VIVOS.md`, "utf8").split("\n");
    const pad = [`${D}/${M}`, `${Y}-${M}-${D}`];
    for (const l of av) if (l.startsWith("- ") && pad.some((p) => l.includes(p))) marcas.push(l.replace(/^- /, "").slice(0, 110));
  } catch {}
  return { missoes: out.slice(0, 8), marcas: marcas.slice(0, 8) };
}

// ---------- formatacao ----------
const nf = (n) => Math.round(n).toLocaleString("pt-BR");
const mtok = (n) => (n >= 1e9 ? (n / 1e9).toFixed(2) + " bilhoes" : n >= 1e6 ? (n / 1e6).toFixed(1) + " milhoes" : n >= 1e3 ? (n / 1e3).toFixed(0) + " mil" : String(Math.round(n))).replace(".", ",");
const dinheiro = (n, s) => s + " " + n.toLocaleString("pt-BR", { minimumFractionDigits: 2, maximumFractionDigits: 2 });
const usd = (n) => dinheiro(n, "US$");
const brl = (n) => dinheiro(n * (PRECOS.usd_por_dolar || 5.45), "R$");
const total = (a) => a.in + a.out + a.cw + a.cr;
const REGUA = "━━━━━━━━━━━━━━━━━━━━━";
const barra = (v, max, n = 10) => (max > 0 ? "█".repeat(Math.max(1, Math.round((v / max) * n))) : "▏");
const pad = (s, n) => (s.length >= n ? s.slice(0, n) : s + " ".repeat(n - s.length));
const MEDALHA = ["🥇", "🥈", "🥉", "▫️", "▫️", "▫️"];
const diaSemana = (d) => new Intl.DateTimeFormat("pt-BR", { timeZone: TZ, weekday: "long" })
  .format(new Date(d + "T12:00:00Z")).replace("-feira", "");

function janela(porDia, dias, ate) {
  const fim = new Date(ate + "T12:00:00Z").getTime();
  const acc = {};
  for (let i = 0; i < dias; i++) {
    const d = dia(fim - i * 864e5);
    for (const [ag, v] of Object.entries(porDia[d] || {})) acc[ag] = soma(acc[ag] || zero(), v);
  }
  return acc;
}
const somaTudo = (obj) => Object.values(obj).reduce((a, b) => soma(a, b), zero());

function monta({ porDia, detalhe }) {
  const L = [];
  const d1 = porDia[ALVO] || {};
  const t1 = somaTudo(d1);
  const det = detalhe[ALVO] || { modelo: {}, sala: {}, braco: zero(), cabeca: zero(), semPreco: 0 };
  const [Y, M, D] = ALVO.split("-");

  L.push(`📊 TOKENS · ${diaSemana(ALVO)} ${D}/${M}/${Y}`);
  L.push(REGUA);
  if (!t1.msgs) {
    L.push("Nenhuma mensagem registrada nesse dia.");
    return L.join("\n");
  }

  const aproveita = total(t1) ? (t1.cr / total(t1)) * 100 : 0;
  L.push("");
  L.push(`1️⃣  O DIA`);
  L.push("");
  L.push(`💰  ${brl(t1.usd)}   (${usd(t1.usd)})`);
  L.push(`🔢  ${mtok(total(t1))} tokens · ${nf(t1.msgs)} respostas`);
  L.push(`♻️  ${aproveita.toFixed(0)}% veio do cache (10x mais barato)`);
  L.push("");
  L.push(`Voce paga assinatura: isso e o que voce`);
  L.push(`DEIXOU de gastar, nao o que gastou.`);
  L.push("");
  const ordAg = Object.entries(d1).sort((a, b) => b[1].usd - a[1].usd);
  const maxAg = Math.max(...ordAg.map(([, v]) => v.usd));
  ordAg.forEach(([ag, v], i) => {
    L.push(`${MEDALHA[i] || "▫️"} ${pad(ag, 7)} ${pad(barra(v.usd, maxAg), 11)} ${brl(v.usd)}`);
  });
  L.push("");
  L.push(`entrada ${mtok(t1.in)} · saida ${mtok(t1.out)}`);
  L.push(`cache gravado ${mtok(t1.cw)} · lido ${mtok(t1.cr)}`);
  L.push("");
  L.push(REGUA);

  const p7 = janela(porDia, 7, ALVO), p30 = janela(porDia, 30, ALVO);
  const j7 = somaTudo(p7), j30 = somaTudo(p30);
  const media7 = j7.usd / 7;
  L.push("");
  L.push(`2️⃣  A SEMANA E O MES`);
  L.push("");
  L.push(`📅 7 dias    ${brl(j7.usd)}`);
  L.push(`   media/dia ${brl(media7)}`);
  L.push(`🗓️ 30 dias   ${brl(j30.usd)}`);
  L.push(`   media/dia ${brl(j30.usd / 30)}`);
  if (media7 > 0) {
    const dif = ((t1.usd - media7) / media7) * 100;
    const seta = dif >= 15 ? "🔺" : dif <= -15 ? "🔻" : "➖";
    L.push("");
    L.push(`${seta} O dia ficou ${dif >= 0 ? "+" : ""}${dif.toFixed(0)}% ante a media da semana.`);
  }
  L.push("");
  const ord30 = AGENTES.map((a) => [a.nome, p30[a.nome]]).filter(([, v]) => v && v.msgs).sort((a, b) => b[1].usd - a[1].usd);
  const max30 = ord30.length ? Math.max(...ord30.map(([, v]) => v.usd)) : 0;
  L.push(`Em 30 dias, por agente:`);
  for (const [ag, v] of ord30) L.push(`   ${pad(ag, 7)} ${pad(barra(v.usd, max30), 11)} ${brl(v.usd)}`);
  for (const a of AGENTES) if (!p30[a.nome] || !p30[a.nome].msgs) L.push(`   ${pad(a.nome, 7)} sem uso no periodo`);
  L.push("");
  L.push(REGUA);

  L.push("");
  L.push(`3️⃣  ONDE O CUSTO FOI`);
  L.push("");
  const mods = Object.entries(det.modelo).filter(([, v]) => total(v) > 0).sort((a, b) => b[1].usd - a[1].usd);
  const maxMod = mods.length ? mods[0][1].usd : 0;
  for (const [k, v] of mods) {
    const fatia = t1.usd ? (v.usd / t1.usd) * 100 : 0;
    L.push(`   ${pad(k, 7)} ${pad(barra(v.usd, maxMod), 11)} ${brl(v.usd)}  ${fatia.toFixed(0)}%`);
  }
  const caro = (det.modelo.opus || zero()).usd;
  if (t1.usd > 0) {
    const fc = (caro / t1.usd) * 100;
    L.push("");
    L.push(`${fc > 45 ? "🚨" : "✅"} Modelo caro: ${fc.toFixed(0)}% do custo (meta 30%).`);
    if (fc > 45) L.push(`   A cabeca executou o que era pra ter delegado.`);
  }
  if (det.semPreco) L.push(`⚠️ ${mtok(det.semPreco)} em modelo fora da tabela (fora da conta).`);
  L.push("");
  L.push(REGUA);

  const salas = mapaSalas();
  const rank = Object.entries(det.sala)
    .map(([sid, v]) => [salas[sid] || "sessoes ja rotacionadas", v])
    .reduce((acc, [lab, v]) => { acc[lab] = soma(acc[lab] || zero(), v); return acc; }, {});
  const top = Object.entries(rank).sort((a, b) => b[1].usd - a[1].usd).slice(0, 6);
  if (top.length) {
    const maxSala = top[0][1].usd;
    L.push("");
    L.push(`4️⃣  SALAS QUE MAIS PESARAM`);
    L.push("");
    for (const [lab, v] of top) L.push(`   ${pad(lab, 16)} ${pad(barra(v.usd, maxSala, 8), 9)} ${brl(v.usd)}`);
    L.push("");
    L.push(REGUA);
  }

  const f = feitos(ALVO);
  L.push("");
  L.push(`5️⃣  O QUE SAIU DISSO`);
  L.push("");
  if (f.marcas.length) for (const m of f.marcas) L.push(`✅ ${m}`);
  if (f.missoes.length) for (const m of f.missoes) L.push(`🔧 ${m}`);
  if (!f.marcas.length && !f.missoes.length) L.push("   Nada registrado no diario do dia.");

  return L.join("\n");
}

// ---------- envio ----------
const tg = async (env, metodo, body) => {
  const r = await fetch(`https://api.telegram.org/bot${env.TELEGRAM_BOT_TOKEN}/${metodo}`, {
    method: "POST", headers: { "content-type": "application/json" }, body: JSON.stringify(body),
  });
  return r.json();
};

// Acha a sala Tokens no topics.json; se nao existir, CRIA no Telegram, grava no topics.json
// e escreve a persona. E o que faz a sala nascer junto com o agente, sem ninguem mexer.
async function garanteSala(env) {
  const tf = `${BRIDGE}/topics.json`;
  let t = {}; try { t = JSON.parse(fs.readFileSync(tf, "utf8")); } catch {}
  for (const [k, v] of Object.entries(t)) if ((v.label || "").toLowerCase() === "tokens") return k.split(":")[1];
  if (!env.GROUP_CHAT_ID) { console.error("[tokens] sem GROUP_CHAT_ID: nao da pra criar a sala"); return null; }
  const j = await tg(env, "createForumTopic", { chat_id: env.GROUP_CHAT_ID, name: "📊 Tokens" });
  if (!j.ok) { console.error("[tokens] nao criou a sala: " + JSON.stringify(j).slice(0, 200)); return null; }
  const thread = String(j.result.message_thread_id);
  t[`${env.GROUP_CHAT_ID}:${thread}`] = { model: env.CLAUDE_MODEL || undefined, persona: "tokens.md", label: "Tokens", effort: "medium" };
  fs.writeFileSync(tf, JSON.stringify(t, null, 2));
  const pdir = env.PERSONA_DIR || `${BRIDGE}/persona`;
  try {
    fs.mkdirSync(pdir, { recursive: true });
    const alvo = `${pdir}/tokens.md`;
    if (!fs.existsSync(alvo)) fs.copyFileSync(`${BRIDGE}/lib/persona-tokens.md`, alvo);
  } catch (e) { console.error("[tokens] persona nao instalada: " + e.message); }
  console.error(`[tokens] sala criada (thread ${thread}) e persona instalada`);
  return thread;
}

// Garante o cron das 07h30. Idempotente: se a linha ja existe, nao duplica.
function instalaCron() {
  const linha = `30 7 * * * cd ${BRIDGE} && ${process.execPath} workers/report-tokens.cjs --send >> ${BRIDGE}/logs/report-tokens.log 2>&1`;
  const cp = require("child_process");
  let atual = ""; try { atual = cp.execSync("crontab -l 2>/dev/null").toString(); } catch {}
  if (atual.includes("report-tokens.cjs")) { console.error("[tokens] cron ja instalado"); return; }
  try { fs.mkdirSync(`${BRIDGE}/logs`, { recursive: true }); } catch {}
  cp.execSync("crontab -", { input: atual.replace(/\n*$/, "\n") + linha + "\n" });
  console.error("[tokens] cron das 07h30 instalado");
}

async function enviar(texto) {
  const env = lerEnv(BRIDGE);
  const thread = arg("--thread", null) || (await garanteSala(env));
  if (!thread) { console.error("[tokens] sem sala de destino"); process.exit(2); }
  const j = await tg(env, "sendMessage", { chat_id: env.GROUP_CHAT_ID, message_thread_id: Number(thread), text: texto });
  console.error(j.ok ? "[tokens] enviado" : "[tokens] falhou: " + JSON.stringify(j).slice(0, 300));
}

(async () => {
  if (tem("--instala")) { instalaCron(); await garanteSala(lerEnv(BRIDGE)); return; }
  const dados = await scan();
  const texto = monta(dados);
  console.log(texto);
  if (tem("--send")) await enviar(texto);
})();
