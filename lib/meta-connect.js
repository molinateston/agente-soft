// meta-connect.js — conexão do Meta (Facebook/Instagram Ads) pelo MCP OFICIAL da Meta.
//
// POR QUE ESTE CAMINHO: o cliente NÃO precisa de app de desenvolvedor, nem Business Manager,
// nem App Review. Ele faz login no Facebook dele, cola um endereço de volta, e pronto.
// O caminho antigo (app Meta + System User) está MORTO por decisão do dono (24/07/2026).
//
// SEGURANÇA: o token nunca é ecoado — nem em resposta, nem em log, nem em erro. Nem mascarado.
// O token é MCP-only: o Graph normal rejeita ele de propósito.

"use strict";

const fs = require("fs");
const os = require("os");
const path = require("path");
const https = require("https");
const crypto = require("crypto");

const REGISTRATION_ENDPOINT = "https://mcp.facebook.com/.well-known/register/ads";
const AUTH_ENDPOINT = "https://www.facebook.com/v25.0/dialog/oauth";
const TOKEN_ENDPOINT = "https://graph.facebook.com/v25.0/oauth/access_token";
const MCP_URL = "https://mcp.facebook.com/ads";

// client_id já registrado por DCR e reutilizável. Se um dia deixar de valer, o módulo
// registra outro sozinho (o endpoint de registro é público, sem segredo).
const DEFAULT_CLIENT_ID = "4510005499318155";

// O registro só aceita estes dois endereços de volta. Domínio próprio é REJEITADO.
const REDIRECT_PRIMARY = "http://localhost:3000/callback";
const REDIRECT_FALLBACK = "http://127.0.0.1:3000/callback";

// ads_mcp_management é o escopo que destrava o MCP. Sem ele, toda chamada dá 401.
const SCOPES = [
  "ads_management", "ads_read", "catalog_management", "business_management",
  "pages_show_list", "instagram_basic", "ads_mcp_management",
].join(",");

const STATE_FILE = ".meta-connect.json";
const TOKEN_FILE = ".meta-token.json";
const WARN_FILE = ".meta-token-warned";

// ---------- http helpers ----------

function httpsRequest(urlStr, { method = "GET", headers = {}, body = null, timeout = 30000 } = {}) {
  return new Promise((resolve, reject) => {
    const u = new URL(urlStr);
    const req = https.request({
      hostname: u.hostname,
      port: u.port || 443,
      path: u.pathname + u.search,
      method,
      headers,
      timeout,
    }, (res) => {
      const chunks = [];
      res.on("data", (c) => chunks.push(c));
      res.on("end", () => resolve({
        status: res.statusCode,
        headers: res.headers,
        body: Buffer.concat(chunks).toString("utf8"),
      }));
    });
    req.on("timeout", () => { req.destroy(new Error("tempo esgotado")); });
    req.on("error", reject);
    if (body) req.write(body);
    req.end();
  });
}

function postJson(url, obj, extraHeaders = {}) {
  const body = JSON.stringify(obj);
  return httpsRequest(url, {
    method: "POST",
    headers: { "Content-Type": "application/json", "Content-Length": Buffer.byteLength(body), ...extraHeaders },
    body,
  });
}

function postForm(url, params) {
  const body = new URLSearchParams(params).toString();
  return httpsRequest(url, {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded", "Content-Length": Buffer.byteLength(body) },
    body,
  });
}

// O MCP responde em text/event-stream mesmo pra uma chamada só. Pega o primeiro `data:`.
function parseSse(raw) {
  const line = String(raw || "").split("\n").find((l) => l.startsWith("data:"));
  if (!line) { try { return JSON.parse(raw); } catch { return null; } }
  try { return JSON.parse(line.slice(5).trim()); } catch { return null; }
}

// ---------- arquivos de estado ----------

function statePath(workdir) { return path.join(workdir, STATE_FILE); }
function tokenPath(workdir) { return path.join(workdir, TOKEN_FILE); }

function writePrivate(file, obj) {
  const tmp = `${file}.tmp-${process.pid}`;
  fs.writeFileSync(tmp, JSON.stringify(obj, null, 2), { mode: 0o600 });
  fs.renameSync(tmp, file);
  try { fs.chmodSync(file, 0o600); } catch {}
}

function readJson(file) {
  try { return JSON.parse(fs.readFileSync(file, "utf8")); } catch { return null; }
}

// ---------- registro dinâmico (só se o client_id padrão falhar) ----------

async function registerClient() {
  const r = await postJson(REGISTRATION_ENDPOINT, {
    client_name: "LEON",
    redirect_uris: [REDIRECT_PRIMARY],
    grant_types: ["authorization_code"],
    response_types: ["code"],
    token_endpoint_auth_method: "none",
  });
  let j = null;
  try { j = JSON.parse(r.body); } catch {}
  if (!j || !j.client_id) throw new Error("o Meta não devolveu um cadastro válido");
  return String(j.client_id);
}

// ---------- passo 1: começar a conexão ----------

async function startMetaConnect(workdir) {
  const prev = readJson(statePath(workdir));
  let clientId = (prev && prev.clientId) || DEFAULT_CLIENT_ID;
  if (!clientId) clientId = await registerClient();

  const verifier = crypto.randomBytes(32).toString("base64url");
  const challenge = crypto.createHash("sha256").update(verifier).digest("base64url");
  const state = crypto.randomBytes(16).toString("hex");

  writePrivate(statePath(workdir), { clientId, verifier, state, createdAt: Date.now() });

  const url = `${AUTH_ENDPOINT}?` + new URLSearchParams({
    client_id: clientId,
    redirect_uri: REDIRECT_PRIMARY,
    response_type: "code",
    scope: SCOPES,
    state,
    code_challenge: challenge,
    code_challenge_method: "S256",
  }).toString();

  return { url, state, clientId };
}

// ---------- passo 2: detectar o endereço colado de volta ----------

function isMetaCallback(text) {
  const t = String(text || "");
  if (!/[?&]code=/.test(t)) return false;
  return /(localhost|127\.0\.0\.1):3000\/callback/.test(t);
}

function extractCallback(text) {
  const m = String(text || "").match(/https?:\/\/(?:localhost|127\.0\.0\.1):3000\/callback[^\s<>"']*/);
  if (!m) return null;
  let u;
  try { u = new URL(m[0]); } catch { return null; }
  return { code: u.searchParams.get("code"), state: u.searchParams.get("state") };
}

// ---------- passo 3: fechar a conexão ----------

async function finishMetaConnect(workdir, pastedUrl) {
  const st = readJson(statePath(workdir));
  if (!st || !st.verifier) return { ok: false, reason: "sem_pedido", msg: "Não achei um pedido de conexão aberto. Me pede pra conectar o Meta de novo." };

  const cb = extractCallback(pastedUrl);
  if (!cb || !cb.code) return { ok: false, reason: "sem_codigo", msg: "Nesse endereço não veio o código. Copia o endereço inteiro da barra do navegador e cola aqui." };
  if (cb.state && st.state && cb.state !== st.state) {
    return { ok: false, reason: "estado_divergente", msg: "Esse endereço é de um pedido antigo. Vou te mandar um link novo." };
  }

  // PEGADINHA: o navegador mostra 127.0.0.1 na barra, mas a troca só fecha com o MESMO
  // endereço que foi enviado na autorização (localhost). Tenta localhost primeiro.
  let lastErr = null;
  for (const redirect of [REDIRECT_PRIMARY, REDIRECT_FALLBACK]) {
    let r;
    try {
      r = await postForm(TOKEN_ENDPOINT, {
        client_id: st.clientId,
        redirect_uri: redirect,
        code: cb.code,
        code_verifier: st.verifier,
        grant_type: "authorization_code",
      });
    } catch (e) { lastErr = e.message; continue; }

    let j = null;
    try { j = JSON.parse(r.body); } catch {}
    if (j && j.access_token) {
      const expiresIn = Number(j.expires_in || 0) || 5183000;
      const tok = { access_token: j.access_token, expires_at: Date.now() + expiresIn * 1000, connected_at: Date.now() };
      writePrivate(tokenPath(workdir), tok);
      try { fs.unlinkSync(path.join(workdir, WARN_FILE)); } catch {}

      const wrote = writeMcpConfig(j.access_token);
      const check = await validateToken(j.access_token);
      try { fs.unlinkSync(statePath(workdir)); } catch {}

      if (!check.ok) return { ok: false, reason: "sem_escopo", msg: `Consegui entrar, mas o Meta não liberou as ferramentas de anúncio. Motivo: ${check.msg}` };
      return { ok: true, accounts: check.accounts, days: Math.round(expiresIn / 86400), mcpConfigured: wrote };
    }

    const err = (j && j.error) || {};
    // código expirado / já usado — vale pros dois redirects, não adianta tentar o outro
    if (err.code === 100 && String(err.error_subcode) === "36007") {
      return { ok: false, reason: "codigo_expirado", msg: "Esse código já venceu (ele dura poucos minutos). Vou te mandar um link novo — dessa vez cola aqui logo depois de entrar." };
    }
    lastErr = err.message || r.body.slice(0, 200);
  }
  return { ok: false, reason: "falhou", msg: `Não consegui fechar a conexão. O Meta respondeu: ${lastErr}` };
}

// ---------- escrita no arquivo de configuração das ferramentas ----------

// Escrita ATÔMICA (arquivo temporário + rename), preservando TODO o resto do arquivo.
function writeMcpConfig(token) {
  const file = path.join(os.homedir(), ".claude.json");
  let j = {};
  try { j = JSON.parse(fs.readFileSync(file, "utf8")); } catch { j = {}; }
  try {
    if (fs.existsSync(file)) {
      const stamp = new Date().toISOString().replace(/[-:T]/g, "").slice(0, 15);
      fs.copyFileSync(file, `${file}.bak-meta-${stamp}`);
    }
  } catch {}
  j.mcpServers = j.mcpServers || {};
  j.mcpServers["meta-ads"] = { type: "http", url: MCP_URL, headers: { Authorization: `Bearer ${token}` } };
  try {
    const tmp = `${file}.tmp-${process.pid}`;
    fs.writeFileSync(tmp, JSON.stringify(j, null, 2));
    fs.renameSync(tmp, file);
    return true;
  } catch { return false; }
}

// ---------- validação real: fala com o Meta e lista as contas ----------

async function validateToken(token) {
  const auth = { Authorization: `Bearer ${token}` , Accept: "application/json, text/event-stream" };
  let init;
  try {
    init = await postJson(MCP_URL, {
      jsonrpc: "2.0", id: 1, method: "initialize",
      params: { protocolVersion: "2025-06-18", capabilities: {}, clientInfo: { name: "LEON", version: "1.0" } },
    }, auth);
  } catch (e) { return { ok: false, msg: `não consegui falar com o Meta (${e.message})` }; }

  if (init.status === 401) return { ok: false, msg: "faltou a permissão das ferramentas de anúncio" };
  const sid = init.headers["mcp-session-id"];
  if (!sid) return { ok: false, msg: "o Meta não abriu a sessão" };

  let call;
  try {
    call = await postJson(MCP_URL, {
      jsonrpc: "2.0", id: 2, method: "tools/call",
      params: { name: "ads_get_ad_accounts", arguments: {} },
    }, { ...auth, "mcp-session-id": sid });
  } catch (e) { return { ok: false, msg: `não consegui listar as contas (${e.message})` }; }

  const j = parseSse(call.body);
  const txt = j && j.result && j.result.content && j.result.content[0] && j.result.content[0].text;
  if (!txt) return { ok: false, msg: "o Meta não devolveu as contas" };
  let parsed = null;
  try { parsed = JSON.parse(txt); } catch {}
  const list = (parsed && parsed.ad_accounts) || [];
  return { ok: true, accounts: list.map((a) => ({ id: a.ad_account_id, name: a.ad_account_name, status: a.account_status })) };
}

// ---------- status / aviso de vencimento ----------

function metaTokenStatus(workdir) {
  const t = readJson(tokenPath(workdir));
  if (!t || !t.access_token) return { connected: false };
  const days = Math.floor((t.expires_at - Date.now()) / 86400000);
  return { connected: true, daysLeft: days, expired: days < 0 };
}

// Devolve true UMA vez por dia quando faltam 7 dias ou menos. Barato: só lê 2 arquivos pequenos.
function shouldWarnExpiry(workdir) {
  const st = metaTokenStatus(workdir);
  if (!st.connected) return false;
  if (st.daysLeft > 7) return false;
  const warnFile = path.join(workdir, WARN_FILE);
  const today = new Date().toISOString().slice(0, 10);
  let last = "";
  try { last = fs.readFileSync(warnFile, "utf8").trim(); } catch {}
  if (last === today) return false;
  try { fs.writeFileSync(warnFile, today); } catch {}
  return true;
}

// ---------- gatilho por linguagem natural ----------

function _deaccent(s) {
  return String(s || "").normalize("NFD").replace(/[̀-ͯ]/g, "").toLowerCase();
}

// verbo de ligar + artigo/possessivo opcional + o que se liga. Cobre as variações naturais
// ("conecta o Meta Ads pra mim", "quero ligar meu Instagram") sem listar frase por frase.
const CONNECT_VERB = "(?:conect(?:ar|a|e)|lig(?:ar|a|ue)|vincul(?:ar|a|e)|plug(?:ar|a))";
const CONNECT_DET = "(?:\\s+(?:o|a|os|as|meu|minha|meus|minhas))*";
const CONNECT_OBJ = "(?:meta|facebook|face|instagram|insta|conta\\s+de\\s+anuncios?|conta\\s+do\\s+meta|contas?\\s+de\\s+anuncios?)";
const CONNECT_RE = new RegExp(`(^|[^\\p{L}\\p{N}])${CONNECT_VERB}${CONNECT_DET}\\s+${CONNECT_OBJ}([^\\p{L}\\p{N}]|$)`, "u");

function detectMetaConnectIntent(text) {
  const t = String(text || "").trim();
  if (!t) return false;
  if (/^\/conectarmeta\b/i.test(t)) return true;
  return CONNECT_RE.test(_deaccent(t));
}

// ---------- texto pro dono (linguagem de gente, sem jargão) ----------

function instructions(url) {
  return `Pra ligar teu Meta aqui, são 3 passos:

*1.* Abre este endereço e faz login no Facebook, como faz em qualquer site:

${url}

*2.* Depois de aceitar, o navegador vai mostrar uma página de erro tipo "não foi possível acessar". *Isso é normal e é o certo.*

*3.* Copia o endereço inteiro que ficou na barra do navegador e cola aqui pra mim.

Faz isso rápido, sem deixar pra depois: o código dura poucos minutos e vence.`;
}

module.exports = {
  startMetaConnect,
  finishMetaConnect,
  isMetaCallback,
  detectMetaConnectIntent,
  metaTokenStatus,
  shouldWarnExpiry,
  validateToken,
  writeMcpConfig,
  instructions,
  MCP_URL,
};
