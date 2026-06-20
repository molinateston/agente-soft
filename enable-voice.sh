#!/usr/bin/env bash
# =====================================================================
# enable-voice.sh — liga a TRANSCRIÇÃO de áudio no agente.
# SEM root, SEM chave: cria um venv e instala faster-whisper (pip). O modelo
# roda local na VPS. O agente pode rodar isto sozinho (o user 'agente' não
# precisa de sudo). Leva uns minutos (baixa o modelo ~500MB) na 1ª vez.
# Rode preferencialmente num cgroup separado pra sobreviver ao restart:
#   systemd-run --user --collect bash ~/agente-soft/enable-voice.sh
# =====================================================================
set -uo pipefail
BRIDGE_DIR="$HOME/lean-bridge"
VENV="$BRIDGE_DIR/venv-voice"
REPO_DIR="$HOME/agente-soft"
LOG="$BRIDGE_DIR/voice-install.log"
say(){ echo "[$(date '+%F %H:%M:%S')] $*" >> "$LOG"; }

# avisa o dono no Telegram (lê só as 2 chaves do .env, sem 'source')
env_get(){ grep -E "^$1=" "$BRIDGE_DIR/.env" 2>/dev/null | head -1 | cut -d= -f2- | sed 's/[[:space:]]*#.*$//; s/^"//; s/"$//'; }
tg(){ local T O; T="$(env_get TELEGRAM_BOT_TOKEN)"; O="$(env_get OWNER_CHAT_ID)"; [ -n "$T" ] && [ -n "$O" ] && \
  curl -s --max-time 15 "https://api.telegram.org/bot${T}/sendMessage" \
  --data-urlencode "chat_id=${O}" --data-urlencode "text=$1" >/dev/null 2>&1 || true; }

say "=== enable-voice ==="
command -v python3 >/dev/null 2>&1 || { say "python3 ausente"; tg "🎤 Não consegui ligar o áudio: falta python3 na VPS."; exit 1; }

# fast-path idempotente: se já estiver tudo no lugar (venv importa faster_whisper,
# handler copiado e VOICE_PY no .env), não refaz venv+download (~500MB). Só reinicia.
if [ -x "$VENV/bin/python" ] \
   && "$VENV/bin/python" -c "import faster_whisper" >/dev/null 2>&1 \
   && [ -f "$BRIDGE_DIR/workers/voice-handler.py" ] \
   && grep -q '^VOICE_PY=' "$BRIDGE_DIR/.env" 2>/dev/null; then
  say "áudio já estava ligado, só reiniciando o agente..."
  export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
  systemctl --user restart agente >>"$LOG" 2>&1 || pkill -f bridge.cjs >>"$LOG" 2>&1 || true
  say "✅ áudio já estava ligado."
  tg "🎤 Áudio já estava ligado. Reiniciei o agente, tá tudo certo."
  exit 0
fi

say "criando venv + instalando faster-whisper (uns minutos)..."
python3 -m venv "$VENV" >>"$LOG" 2>&1 || { say "venv falhou"; tg "🎤 Falha ao criar o ambiente do áudio (python3-venv?)."; exit 1; }
"$VENV/bin/pip" install -q --upgrade pip >>"$LOG" 2>&1
"$VENV/bin/pip" install -q faster-whisper >>"$LOG" 2>&1 || { say "pip faster-whisper falhou"; tg "🎤 Falha ao instalar o transcritor (faster-whisper)."; exit 1; }

mkdir -p "$BRIDGE_DIR/workers"
cp "$REPO_DIR/workers/voice-handler.py" "$BRIDGE_DIR/workers/voice-handler.py" || { say "copia do handler falhou"; tg "🎤 Falha ao copiar o handler de voz."; exit 1; }

# aponta o bridge pro python do venv (onde o faster-whisper está)
if grep -q '^VOICE_PY=' "$BRIDGE_DIR/.env" 2>/dev/null; then
  sed -i "s|^VOICE_PY=.*|VOICE_PY=$VENV/bin/python|" "$BRIDGE_DIR/.env"
else
  echo "VOICE_PY=$VENV/bin/python" >> "$BRIDGE_DIR/.env"
fi

# escolhe o modelo conforme a RAM disponível. Pouca RAM (< ~1.2GB) usa 'tiny'
# em vez de 'small' pra não derrubar a VPS. O voice-handler respeita WHISPER_MODEL.
MODEL="small"
MEM_KB="$(grep -E '^MemAvailable:' /proc/meminfo 2>/dev/null | awk '{print $2}')"
if [ -n "$MEM_KB" ] && [ "$MEM_KB" -lt 1200000 ]; then
  MODEL="tiny"
  say "RAM baixa (${MEM_KB}kB disponível), usando o modelo leve 'tiny'."
  if grep -q '^WHISPER_MODEL=' "$BRIDGE_DIR/.env" 2>/dev/null; then
    sed -i "s|^WHISPER_MODEL=.*|WHISPER_MODEL=tiny|" "$BRIDGE_DIR/.env"
  else
    echo "WHISPER_MODEL=tiny" >> "$BRIDGE_DIR/.env"
  fi
  tg "🎤 Áudio: usei o modelo leve (tiny) por causa da pouca RAM da VPS. A transcrição fica um pouco menos precisa, mas roda tranquilo."
fi

say "baixando o modelo ($MODEL)..."
"$VENV/bin/python" -c "from faster_whisper import WhisperModel; WhisperModel('$MODEL', device='cpu', compute_type='int8')" >>"$LOG" 2>&1 \
  || { say "download do modelo falhou"; tg "🎤 Falha ao baixar o modelo de voz."; exit 1; }

say "tudo pronto, reiniciando o agente pra ligar o áudio..."
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
systemctl --user restart agente >>"$LOG" 2>&1 || pkill -f bridge.cjs >>"$LOG" 2>&1 || true
say "✅ áudio ligado."
