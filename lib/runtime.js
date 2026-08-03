// =====================================================================
// lib/runtime.js — COMO este agente roda nesta máquina.
//
// Defeito de nascença que este arquivo fecha: o motor assumia que toda
// instalação tinha systemd de usuário ("systemctl --user"). Existe
// instalação real rodando como serviço de SISTEMA, sem sessão de usuário,
// onde esse comando responde "Failed to connect to bus". Lá o /atualiza
// morria em silêncio: o dono pedia, ouvia "já volto" e ninguém voltava.
//
// Aqui ninguém supõe. Pergunta-se ao detector (scripts/runtime-detect.sh),
// que é a ÚNICA fonte de verdade — o motor e os scripts do cron leem o
// mesmo arquivo, então não têm como divergir.
// =====================================================================
"use strict";
const fs = require("fs");
const { spawnSync, spawn } = require("child_process");
const HOME = process.env.HOME || "/root";

// Os scripts moram junto do motor na instalação paga e na cópia do
// repositório na gratuita. Resolve os dois, senão vira código morto.
function acharScript(nome, dir) {
  const cands = [
    `${dir}/scripts/${nome}`,
    `${HOME}/agente-soft/scripts/${nome}`,
    `${HOME}/socio-ia/scripts/${nome}`,
    `${HOME}/lean-bridge/scripts/${nome}`,
  ];
  for (const p of cands) { try { if (fs.existsSync(p)) return p; } catch {} }
  return null;
}

// ---------------------------------------------------------------------
// Onde mora o pacote desta instalação, e qual é o comando que a reinstala.
// Isto NÃO é chute: cada pacote grava a própria identidade no .pacote.json.
// Antes daqui havia caminho e comando cravados no código apontando pro pacote
// gratuito — numa instalação paga o caminho não existia e o comando de reparo
// mandava o dono buscar o produto errado. (Achado em 30/07/2026.)
// ---------------------------------------------------------------------
function casaDoPacote() {
  for (const d of [`${HOME}/lean-bridge`, `${HOME}/agente-soft`, `${HOME}/socio-ia`]) {
    try { if (fs.existsSync(`${d}/.pacote.json`)) return d; } catch {}
  }
  for (const d of [`${HOME}/agente-soft`, `${HOME}/lean-bridge`]) {
    try { if (fs.existsSync(`${d}/update.sh`) || fs.existsSync(`${d}/update-pago.sh`)) return d; } catch {}
  }
  return `${HOME}/agente-soft`;
}
function comandoDeReparo() {
  try {
    const j = JSON.parse(fs.readFileSync(`${casaDoPacote()}/.pacote.json`, "utf8"));
    if (j && j.instalador) return j.instalador;
  } catch {}
  return "rode de novo o comando de instalação que você usou da primeira vez";
}

let _cache = null, _cacheEm = 0;
const VALIDADE = 5 * 60 * 1000;

function detectar(dir, opts = {}) {
  const agora = Date.now();
  if (!opts.forcar && _cache && agora - _cacheEm < VALIDADE) return _cache;
  const det = acharScript("runtime-detect.sh", dir);
  let obj = null;
  if (det) {
    try {
      const r = spawnSync("bash", [det, "--dir", dir, "--pid", String(process.pid), "--print"],
        { encoding: "utf8", timeout: 30000 });
      if (r.stdout) obj = JSON.parse(r.stdout);
    } catch {}
  }
  if (!obj) {                                   // detector ausente: lê o que ficou da última vez
    try { obj = JSON.parse(fs.readFileSync(`${dir}/.runtime.json`, "utf8")); } catch {}
  }
  if (!obj) obj = { modo: "desconhecido", unidade: "", busUsuario: false, sudoRestart: false,
                    souRoot: false, linger: false, reiniciar: "", podeReiniciar: false, dir };
  _cache = obj; _cacheEm = agora;
  return obj;
}

// Dispara o reinício DESTACADO: quem chama morre no meio, e tem que morrer
// sem levar o comando junto.
function reiniciarAgente(dir) {
  const rt = detectar(dir, { forcar: true });
  if (!rt.podeReiniciar || !rt.reiniciar) return { ok: false, motivo: "não há como reiniciar este agente sozinho" };
  try {
    spawn("bash", ["-lc", rt.reiniciar], { detached: true, stdio: "ignore" }).unref();
    return { ok: true, comando: rt.reiniciar };
  } catch (e) { return { ok: false, motivo: (e && e.message) || "falhou ao disparar" }; }
}

// GRATUITA = tem cópia do repositório e um serviço separado que atualiza.
// PAGA = baixa um pacote da central e reinicia o serviço de sistema.
function arquiteturaGratuita() {
  // O pacote declara o que ele é. Isto é mais confiável que adivinhar pelo nome de
  // um arquivo, e não muda de resposta quando a pasta de instalação muda de lugar.
  try {
    const j = JSON.parse(fs.readFileSync(`${casaDoPacote()}/.pacote.json`, "utf8"));
    if (j && j.modo) return j.modo === "gratuito";
  } catch {}
  try { return fs.existsSync(`${HOME}/agente-soft/update.sh`); } catch { return false; }
}

// ---------------------------------------------------------------------
// A máquina de update está REALMENTE utilizável nesta instalação?
// "O arquivo existe" nunca provou nada: na máquina da cliente o arquivo
// do serviço estava lá e o systemd nunca tinha ouvido falar dele.
// Devolve { ok, via: "servico"|"direto", reparado, problema, comandoManual }
// ---------------------------------------------------------------------
function garantirMaquinaDeUpdate(dir) {
  const rt = detectar(dir);

  if (!arquiteturaGratuita()) {
    const script = `${dir}/update-pago.sh`;
    if (!fs.existsSync(script)) {
      return { ok: false, via: "direto", problema: "esta instalação é anterior ao atualizador automático",
               comandoManual: "curl -fsSL https://licenca.softbusiness.com.br/reparar.sh | sudo bash" };
    }
    return { ok: true, via: "direto" };          // processo comum: não depende de systemd
  }

  const update = `${casaDoPacote()}/update.sh`;
  const temUpdate = fs.existsSync(update);

  // Sem barramento de usuário respondendo, nem tenta serviço: vai de processo comum.
  if (!rt.busUsuario) {
    return temUpdate
      ? { ok: true, via: "direto" }
      : { ok: false, via: "direto", problema: "não encontrei o atualizador nesta máquina",
          comandoManual: comandoDeReparo() };
  }

  const registrado = () =>
    spawnSync("systemctl", ["--user", "cat", "agente-update.service"], { encoding: "utf8", timeout: 8000 }).status === 0;

  if (registrado()) return { ok: true, via: "servico" };

  // Não registrado: instala sozinho, em vez de morrer calado.
  let reparado = false;
  try {
    const destino = `${HOME}/.config/systemd/user`;
    fs.mkdirSync(destino, { recursive: true });
    for (const u of ["agente-update.service", "agente-update.timer", "agente-health.service", "agente-health.timer"]) {
      const origem = `${casaDoPacote()}/${u}`;
      if (fs.existsSync(origem)) fs.copyFileSync(origem, `${destino}/${u}`);
    }
    spawnSync("systemctl", ["--user", "daemon-reload"], { timeout: 15000 });
    reparado = registrado();
  } catch {}

  if (reparado) return { ok: true, via: "servico", reparado: true };
  return temUpdate
    ? { ok: true, via: "direto", reparado: false }   // sem serviço, mas o caminho direto salva
    : { ok: false, via: "direto", problema: "o mecanismo de atualização não está instalado",
        comandoManual: comandoDeReparo() };
}

// ---------------------------------------------------------------------
// Diagnóstico em linguagem de gente. Nada de nome de arquivo nem jargão:
// o dono precisa saber se está tudo de pé e o que fazer se não estiver.
// ---------------------------------------------------------------------
function textoDiagnostico(dir, extras = {}) {
  const rt = detectar(dir, { forcar: true });
  const maq = garantirMaquinaDeUpdate(dir);
  const L = [];
  const comoRodo = {
    "user-systemd": "como um serviço da sua conta nesta máquina",
    "system-systemd": "como um serviço do sistema nesta máquina",
    "pm2": "por um gerenciador de processos",
    "solto": "como um programa comum, sem serviço registrado",
  }[rt.modo] || "de um jeito que não consegui identificar";

  L.push(`🩺 *Diagnóstico*`);
  L.push(``);
  L.push(`· Eu rodo ${comoRodo}.`);
  L.push(rt.podeReiniciar
    ? `· Consigo me reiniciar sozinho quando precisar. ✅`
    : `· ⚠️ NÃO consigo me reiniciar sozinho aqui — uma atualização precisaria de alguém no terminal.`);
  L.push(maq.ok
    ? `· A atualização está pronta pra funcionar. ✅${maq.reparado ? " (achei uma peça faltando e já instalei)" : ""}`
    : `· ⚠️ A atualização não está funcionando: ${maq.problema}.`);
  L.push(extras.vigiaArmado
    ? `· Tem um vigia de plantão: se uma atualização travar, ele te avisa mesmo assim. ✅`
    : `· ⚠️ O vigia da atualização não está de plantão — vou tentar armar de novo agora.`);

  if (extras.reciboPendente) L.push(`· ⏳ Tem uma atualização que você pediu e ainda não fechou. O vigia responde em instantes.`);
  if (extras.metaDias != null) {
    L.push(extras.metaDias > 7
      ? `· Sua conta de anúncios está conectada (mais ${extras.metaDias} dias). ✅`
      : `· ⚠️ Sua conta de anúncios vence em ${extras.metaDias} dia(s). Me pede pra reconectar.`);
  }
  if (extras.licenca) L.push(extras.licenca === "ok" ? `· Sua licença está ativa. ✅` : `· ⚠️ Sua licença não respondeu agora.`);

  if (!maq.ok && maq.comandoManual) {
    L.push(``);
    L.push(`Pra consertar, cole isto no terminal da máquina (uma vez só):`);
    L.push(maq.comandoManual);
  }
  return L.join("\n");
}

module.exports = { detectar, reiniciarAgente, arquiteturaGratuita, garantirMaquinaDeUpdate, textoDiagnostico, acharScript };
