#!/usr/bin/env bash
# =====================================================================
# healthcheck.sh — vigia o agente e AVISA o dono no Telegram se cair.
#
# Roda via timer --user (a cada 15min). Barato: a checagem de serviço é
# de graça; a checagem do login nativo (call paga minúscula) é limitada a
# ~1x a cada 3h. Só MANDA mensagem quando há problema — zero spam.
#
# Lê SÓ TELEGRAM_BOT_TOKEN e OWNER_CHAT_ID do .env (grep, sem 'source',
# pra não executar o arquivo).
# =====================================================================
set -uo pipefail

BRIDGE_DIR="$HOME/lean-bridge"
LOG="$BRIDGE_DIR/health.log"
STAMP="$BRIDGE_DIR/.health-login-stamp"
say(){ echo "[$(date '+%F %H:%M:%S')] $*" >> "$LOG"; }

env_get(){ grep -E "^$1=" "$BRIDGE_DIR/.env" 2>/dev/null | head -1 | cut -d= -f2- | sed 's/[[:space:]]*#.*$//; s/^"//; s/"$//'; }
TG="$(env_get TELEGRAM_BOT_TOKEN)"; OWNER="$(env_get OWNER_CHAT_ID)"
alert(){ [ -n "$TG" ] && [ -n "$OWNER" ] && curl -s --max-time 15 \
  "https://api.telegram.org/bot${TG}/sendMessage" \
  --data-urlencode "chat_id=${OWNER}" --data-urlencode "text=$1" >/dev/null 2>&1 || true; }

# claude por caminho absoluto (timer --user tem PATH minúsculo)
CB="${CLAUDE_BIN:-}"
if [ -z "$CB" ] || [ ! -x "$CB" ]; then
  for p in "$HOME/.npm-global/bin/claude" "$HOME/.local/bin/claude" /usr/local/bin/claude /usr/bin/claude /snap/bin/claude; do
    [ -x "$p" ] && CB="$p" && break
  done
fi

# ---- 1) serviço de pé? (de graça) -----------------------------------
if ! systemctl --user is-active --quiet agente; then
  say "serviço CAÍDO — reiniciando"
  systemctl --user restart agente; sleep 4
  if systemctl --user is-active --quiet agente; then
    say "reiniciado OK"; alert "⚠️ Seu agente caiu — eu reiniciei sozinho e já está no ar de novo."
  else
    say "restart FALHOU"; alert "‼️ Seu agente caiu e não subiu no restart. Precisa olhar a VPS (logs em ~/lean-bridge/bridge.log)."
  fi
  exit 0
fi

# ---- 2) login nativo vivo? (call paga → no máx ~1x/3h) --------------
NOW=$(date +%s); LAST=$(cat "$STAMP" 2>/dev/null || echo 0)
if [ -n "$CB" ] && [ $((NOW - LAST)) -ge 10800 ]; then
  echo "$NOW" > "$STAMP"
  if ! "$CB" -p "responda só OK" 2>/dev/null | head -c 40 | grep -qiE '^[^a-z]*ok'; then
    say "login EXPIRADO"; alert "🔑 O login do seu agente expirou. Entre na VPS, rode 'claude' e logue de novo — senão ele para de responder."
  fi
fi
