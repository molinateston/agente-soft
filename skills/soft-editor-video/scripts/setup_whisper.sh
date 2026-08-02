#!/usr/bin/env bash
# SETUP UNICO do whisper.cpp local (roda no Claude Code, uma vez por maquina do dono).
# Baixa + compila o whisper.cpp em vendor/whisper.cpp e puxa o modelo.
# Depois disso, 06_transcribe_local.py transcreve word-level SEM chave e SEM custo por minuto.
#
# Modelo: WHISPER_MODEL=small (default) da bom custo/beneficio; medium = PT-BR mais fiel, mais pesado.
#   bash scripts/setup_whisper.sh            # small
#   WHISPER_MODEL=medium bash scripts/setup_whisper.sh
set -e
MODEL="${WHISPER_MODEL:-small}"
SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
VENDOR="$SKILL_DIR/vendor"
WH="$VENDOR/whisper.cpp"

command -v git   >/dev/null || { echo "FALTA git (apt install git / brew install git)"; exit 1; }
command -v cmake >/dev/null || { echo "FALTA cmake (apt install cmake / brew install cmake)"; exit 1; }
command -v ffmpeg >/dev/null || { echo "FALTA ffmpeg (apt install ffmpeg / brew install ffmpeg)"; exit 1; }

mkdir -p "$VENDOR"
if [ ! -d "$WH/.git" ]; then
  echo "Clonando whisper.cpp ..."
  git clone --depth 1 https://github.com/ggml-org/whisper.cpp "$WH"
fi

echo "Compilando whisper.cpp (pode demorar alguns minutos) ..."
cmake -S "$WH" -B "$WH/build" -DCMAKE_BUILD_TYPE=Release >/dev/null
cmake --build "$WH/build" -j --config Release >/dev/null

echo "Baixando modelo: $MODEL ..."
bash "$WH/models/download-ggml-model.sh" "$MODEL"

# valida binario
BIN=""
for c in "build/bin/whisper-cli" "whisper-cli" "main"; do
  [ -x "$WH/$c" ] && BIN="$WH/$c" && break
done
[ -n "$BIN" ] || { echo "ERRO: binario do whisper nao encontrado apos build"; exit 1; }
[ -f "$WH/models/ggml-$MODEL.bin" ] || { echo "ERRO: modelo ggml-$MODEL.bin nao baixou"; exit 1; }

echo "OK! whisper.cpp pronto ($BIN, modelo $MODEL)."
echo "Transcreva word-level: python3 scripts/06_transcribe_local.py entrada.mp4"
