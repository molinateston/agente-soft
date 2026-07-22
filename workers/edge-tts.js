// workers/edge-tts.js
// Shim node pro Edge TTS (Microsoft, grátis). Chama o venv Python via spawn.
// Uso: node edge-tts.js --action tts --text "..." --out /tmp/x.mp3 [--voice pt-BR-AntonioNeural]
//      node edge-tts.js --action check

import { spawn } from "node:child_process";
import { existsSync, statSync } from "node:fs";
import { homedir } from "node:os";

const HOME = homedir();
const EDGE_PY  = process.env.EDGE_TTS_PY     || `${HOME}/.openclaw/edgetts-venv/bin/python3`;
const EDGE_SCR = process.env.EDGE_TTS_SCRIPT || `${HOME}/.openclaw/workers/edge-tts.py`;

function parseArgs() {
  const a = process.argv.slice(2), o = {};
  for (let i = 0; i < a.length; i++) {
    if (a[i].startsWith("--")) o[a[i].slice(2)] = a[i+1] && !a[i+1].startsWith("--") ? a[++i] : true;
  }
  return o;
}

function run(cmd, args, opts = {}) {
  return new Promise((resolve, reject) => {
    const p = spawn(cmd, args, { stdio: ["ignore", "pipe", "pipe"], ...opts });
    let out = "", err = "";
    p.stdout.on("data", (c) => { out += c.toString(); });
    p.stderr.on("data", (c) => { err += c.toString(); });
    p.on("error", reject);
    p.on("close", (code) => code === 0 ? resolve({ out, err }) : reject(new Error(`exit ${code}: ${err.slice(0, 300)}`)));
  });
}

async function check() {
  if (!existsSync(EDGE_PY))  throw new Error(`edge-tts venv python nao encontrado em ${EDGE_PY}`);
  if (!existsSync(EDGE_SCR)) throw new Error(`edge-tts.py nao encontrado em ${EDGE_SCR}`);
  return { py: EDGE_PY, script: EDGE_SCR, ok: true };
}

async function tts({ text, out, voice }) {
  if (!text) throw new Error("--text obrigatorio");
  if (!out)  throw new Error("--out obrigatorio");
  const args = [EDGE_SCR, "--text", String(text), "--out", out];
  if (voice) args.push("--voice", voice);
  await run(EDGE_PY, args, { timeout: 60000 });
  if (!existsSync(out) || statSync(out).size < 500) throw new Error("saida vazia");
  return { out, bytes: statSync(out).size };
}

(async () => {
  const args = parseArgs();
  try {
    if (args.action === "check") { console.log(JSON.stringify(await check())); return; }
    if (args.action === "tts")   { console.log(JSON.stringify(await tts(args))); return; }
    throw new Error("--action tts|check");
  } catch (e) {
    console.error(String(e.message || e));
    process.exit(1);
  }
})();
