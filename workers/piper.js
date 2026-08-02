// workers/piper.js
// Piper TTS local (grátis, roda na VPS do cliente).
// Voz pt_BR default: pt_BR-faber-medium.
// Env:
//   PIPER_BIN    (default: ~/.openclaw/piper-venv/bin/piper)
//   PIPER_MODEL  (default: ~/.openclaw/voices/piper/pt_BR-faber-medium.onnx)
// Uso:
//   node piper.js --action tts --text "..." --out /tmp/audio.mp3 [--voice <model.onnx>] [--speed 1.0]
//   node piper.js --action check

const { spawn } = require("node:child_process");
const { existsSync, unlinkSync, statSync } = require("node:fs");
const { homedir } = require("node:os");

const HOME = homedir();
const PIPER_BIN   = process.env.PIPER_BIN   || `${HOME}/.openclaw/piper-venv/bin/piper`;
const PIPER_MODEL = process.env.PIPER_MODEL || `${HOME}/.openclaw/voices/piper/pt_BR-faber-medium.onnx`;
const FFMPEG      = process.env.FFMPEG_BIN  || "ffmpeg";

function ok(x)  { process.stdout.write(JSON.stringify({ ok: true, ...x }) + "\n"); process.exit(0); }
function fail(msg) { process.stdout.write(JSON.stringify({ ok: false, error: String(msg) }) + "\n"); process.exit(1); }

function run(cmd, args, opts = {}) {
  return new Promise((resolve, reject) => {
    const p = spawn(cmd, args, { stdio: ["pipe", "pipe", "pipe"], ...opts });
    let out = "", err = "";
    p.stdout.on("data", (c) => { out += c.toString(); });
    p.stderr.on("data", (c) => { err += c.toString(); });
    if (opts.input != null) { p.stdin.write(opts.input); p.stdin.end(); }
    p.on("error", reject);
    p.on("close", (code) => {
      if (code === 0) resolve({ out, err });
      else reject(new Error(`${cmd} exit ${code}: ${err.slice(0, 300)}`));
    });
  });
}

async function check() {
  if (!existsSync(PIPER_BIN))   throw new Error(`piper não encontrado em ${PIPER_BIN}`);
  if (!existsSync(PIPER_MODEL)) throw new Error(`modelo de voz não encontrado em ${PIPER_MODEL}`);
  await run(PIPER_BIN, ["--help"]);
  return { bin: PIPER_BIN, model: PIPER_MODEL };
}

async function tts({ text, out, voice, speed }) {
  if (!text) throw new Error("--text obrigatório");
  if (!out)  throw new Error("--out obrigatório");
  const modelPath = voice || PIPER_MODEL;
  if (!existsSync(PIPER_BIN)) throw new Error(`piper não encontrado em ${PIPER_BIN}`);
  if (!existsSync(modelPath)) throw new Error(`modelo não encontrado em ${modelPath}`);

  const wav = out.replace(/\.mp3$/i, "") + `.piper-${Date.now()}.wav`;
  const piperArgs = ["-m", modelPath, "-f", wav];
  if (speed) piperArgs.push("--length-scale", String(1 / Number(speed)));

  await run(PIPER_BIN, piperArgs, { input: String(text) });
  try {
    await run(FFMPEG, ["-y", "-i", wav, "-codec:a", "libmp3lame", "-qscale:a", "4", out]);
  } finally {
    try { unlinkSync(wav); } catch {}
  }
  const bytes = statSync(out).size;
  return { path: out, chars: String(text).length, model: modelPath, bytes };
}

function parseArgs() {
  const a = {};
  for (let i = 2; i < process.argv.length; i++) {
    const k = process.argv[i];
    if (k.startsWith("--")) a[k.slice(2)] = process.argv[++i] ?? true;
  }
  return a;
}

(async () => {
  try {
    const a = parseArgs();
    const action = a.action || "tts";
    let res;
    switch (action) {
      case "check": res = await check(); break;
      case "tts":   res = await tts({ text: a.text, out: a.out, voice: a.voice, speed: a.speed }); break;
      default: return fail(`ação desconhecida: ${action}`);
    }
    ok(res);
  } catch (e) {
    fail(e.message);
  }
})();
