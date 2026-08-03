#!/usr/bin/env bash
# =====================================================================
# aviso-manha.sh — entrega de manha o recado da madrugada.
#
# Por que existe: a busca automatica de atualizacao roda de madrugada.
# Falar no Telegram as 4h acorda o dono a toa; nao falar nunca esconde
# problema (foi assim que a gente ja se queimou). Entao o recado fica
# guardado em .aviso-manha.txt e sai as 9h da manha, horario de Brasilia.
#
# Sem recado guardado, este script nao faz absolutamente nada.
# =====================================================================
set -uo pipefail

SELF="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="${LEON_INSTALL_DIR:-$(dirname "$SELF")}"
ENV_FILE="$INSTALL_DIR/.env"
AVISO="$INSTALL_DIR/.aviso-manha.txt"

[ -s "$AVISO" ] || exit 0

HORA="$(TZ=America/Sao_Paulo date +%H 2>/dev/null || date +%H)"
[ $(( 10#$HORA )) -eq 9 ] || exit 0

env_get() {
  grep -E "^$1=" "$ENV_FILE" 2>/dev/null | tail -1 | cut -d= -f2- \
    | sed 's/[[:space:]]*#.*$//; s/^[[:space:]]*//; s/[[:space:]]*$//; s/^"//; s/"$//'
}
TG_TOKEN="$(env_get TELEGRAM_BOT_TOKEN)"
CHAT="$(env_get OWNER_CHAT_ID)"
[ -n "$TG_TOKEN" ] && [ -n "$CHAT" ] || exit 0

TEXTO="$(cat "$AVISO" 2>/dev/null)"
[ -n "$TEXTO" ] || { rm -f "$AVISO"; exit 0; }

# So apaga o recado se ele REALMENTE saiu. Telegram fora do ar de manha
# nao pode virar recado perdido: fica guardado e tenta amanha.
RESP="$(curl -s --max-time 20 "https://api.telegram.org/bot${TG_TOKEN}/sendMessage" \
  --data-urlencode "chat_id=${CHAT}" \
  --data-urlencode "text=$TEXTO" 2>/dev/null)"
printf %s "$RESP" | grep -q '"ok":true' && rm -f "$AVISO" 2>/dev/null
exit 0
