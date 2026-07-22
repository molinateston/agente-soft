#!/usr/bin/env bash
# health-check.sh — vigia se o bridge tá vivo (via mtime do bridge.log).
# Roda a cada 5min via cron. Se log parou de crescer > 10min: avisa o DONO
# via Telegram (usa TG_TOKEN + OWNER_CHAT_ID do .env do bridge). Anti-spam
# via flag ~/.health-alerted. Se voltou: apaga flag + avisa recuperação.
# Silencioso quando tudo OK.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BRIDGE_DIR="$(dirname "$SCRIPT_DIR")"
LOG_FILE="${BRIDGE_DIR}/bridge.log"
FLAG="${HOME}/.health-alerted"
ENV_FILE="${BRIDGE_DIR}/.env"

[[ -f "$ENV_FILE" ]] || exit 0

# Extrai vars sem eval (evita executar código malicioso do .env)
TG_TOKEN="$(grep -E '^TELEGRAM_BOT_TOKEN=' "$ENV_FILE" | tail -1 | cut -d= -f2- | tr -d '"'"'"'')"
OWNER="$(grep -E '^OWNER_CHAT_ID=' "$ENV_FILE" | tail -1 | cut -d= -f2- | tr -d '"'"'"'')"

[[ -n "$TG_TOKEN" && -n "$OWNER" ]] || exit 0

notify() {
  local msg="$1"
  curl -s --max-time 10 -X POST "https://api.telegram.org/bot${TG_TOKEN}/sendMessage" \
    --data-urlencode "chat_id=${OWNER}" \
    --data-urlencode "text=${msg}" >/dev/null 2>&1 || true
}

NOW="$(date +%s)"

# Se não existe log ainda (agente recém instalado, sem tráfego): silêncio
[[ -f "$LOG_FILE" ]] || exit 0

LOG_MTIME="$(stat -c %Y "$LOG_FILE" 2>/dev/null || echo 0)"
AGE=$(( NOW - LOG_MTIME ))
AGE_MIN=$(( AGE / 60 ))

if (( AGE > 600 )); then
  # bridge silencioso há > 10min
  if [[ ! -f "$FLAG" ]]; then
    notify "⚠️ LEON parou de responder há ${AGE_MIN}min (bridge.log sem escrita). Ver: journalctl --user -n 100 --since '30 min ago'"
    touch "$FLAG"
  fi
elif [[ -f "$FLAG" ]]; then
  # voltou
  notify "✅ LEON voltou (log ativo). Última pausa: ${AGE_MIN}min atrás."
  rm -f "$FLAG"
fi

# Recovery silencioso: flag esquecida há > 6h e agente vivo agora → limpa
if [[ -f "$FLAG" ]]; then
  FLAG_AGE=$(( NOW - $(stat -c %Y "$FLAG" 2>/dev/null || echo "$NOW") ))
  if (( FLAG_AGE > 21600 && AGE < 600 )); then
    rm -f "$FLAG"
  fi
fi
