"""TRANSCRICAO LOCAL word-level com whisper.cpp (mata a chamada paga da OpenAI).
Cospe um JSON com timestamp POR PALAVRA: insumo do corte de roteiro/silencio E da legenda karaoke.

Setup (roda UMA vez, passo do Code; ver PASSO 0.4 da SKILL):
  bash scripts/setup_whisper.sh
Isso baixa e compila o whisper.cpp em ./vendor/whisper.cpp e puxa um modelo (default: small,
ou WHISPER_MODEL=medium pra PT-BR mais fiel). Sem chave, sem custo por minuto.

Uso: python3 06_transcribe_local.py entrada.mp4 [saida_words.json]
Saida: JSON no formato { "words": [ {"text","startMs","endMs"} ... ], "language": "pt" }

Ambientes:
  - Claude Code: roda de verdade (tem Bash + ffmpeg + binario compilado).
  - agente/Telegram: idem; o path completo do JSON gerado vai na resposta.
  - app/chat (sem Bash): nao roda. La a entrega e o PLANO (quais falas cortar / quais palavras
    acender), com o aviso de que a transcricao roda no Code.
"""
import subprocess, sys, os, json, re

SKILL_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WH_DIR = os.path.join(SKILL_DIR, "vendor", "whisper.cpp")
MODEL = os.environ.get("WHISPER_MODEL", "small")
LANG = os.environ.get("WHISPER_LANG", "pt")

SRC = sys.argv[1]
OUT = sys.argv[2] if len(sys.argv) > 2 else os.path.splitext(SRC)[0] + ".words.json"

# binario (o build novo do whisper.cpp chama de whisper-cli; o antigo, main)
BIN = None
for cand in ("build/bin/whisper-cli", "whisper-cli", "main"):
    p = os.path.join(WH_DIR, cand)
    if os.path.exists(p):
        BIN = p
        break
MODEL_BIN = os.path.join(WH_DIR, "models", f"ggml-{MODEL}.bin")
if not BIN or not os.path.exists(MODEL_BIN):
    raise SystemExit(
        "whisper.cpp nao instalado. Rode UMA vez: bash scripts/setup_whisper.sh "
        "(baixa+compila em vendor/whisper.cpp e puxa o modelo). Ver PASSO 0.4 da SKILL."
    )

# 1) extrair audio 16kHz mono wav (o que o whisper.cpp espera)
WAV = os.path.splitext(SRC)[0] + ".16k.wav"
subprocess.run(
    ["ffmpeg", "-y", "-i", SRC, "-ar", "16000", "-ac", "1", "-c:a", "pcm_s16le", WAV],
    stderr=subprocess.DEVNULL, check=True,
)

# 2) transcrever com timestamps POR PALAVRA (-ml 1 = uma palavra por segmento) em CSV
CSV = os.path.splitext(SRC)[0] + ".words.csv"
r = subprocess.run(
    [BIN, "-m", MODEL_BIN, "-f", WAV, "-l", LANG, "-ml", "1", "-ocsv", "-of",
     os.path.splitext(CSV)[0]],
    stderr=subprocess.PIPE,
)
if r.returncode != 0:
    raise SystemExit("FALHOU whisper.cpp:\n" + r.stderr.decode()[-1500:])

# 3) parsear CSV (colunas: start_ms,end_ms,"text")
words = []
for line in open(CSV, encoding="utf-8"):
    line = line.strip()
    if not line or line.lower().startswith("start"):
        continue
    m = re.match(r'^\s*(\d+)\s*,\s*(\d+)\s*,\s*"?(.*?)"?\s*$', line)
    if not m:
        continue
    start, end, text = int(m.group(1)), int(m.group(2)), m.group(3).strip()
    if not text:
        continue
    words.append({"text": text, "startMs": start, "endMs": end})

json.dump({"language": LANG, "words": words}, open(OUT, "w", encoding="utf-8"),
          ensure_ascii=False, indent=2)
try:
    os.remove(WAV); os.remove(CSV)
except OSError:
    pass
print(f"OK {OUT}  ({len(words)} palavras, modelo={MODEL}, idioma={LANG})", flush=True)
