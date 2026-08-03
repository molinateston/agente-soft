#!/usr/bin/env bash
# =====================================================================
# update-guard.sh — rede de seguranca do update da instalacao PAGA.
#
# O update valida o motor novo antes de instalar, mas nem todo defeito
# aparece na validacao: um motor pode instalar limpo e morrer no boot.
# Como o servico reinicia sozinho pra sempre, o dono ficaria com um bot
# mudo e ninguem avisaria.
#
# Contrato do marcador: o update escreve .pos-update.json ANTES de
# reiniciar; o motor novo consome ao saudar "No ar!". Logo:
#   marcador sumiu     = o motor novo subiu e saudou  -> silencio.
#   marcador envelheceu = o motor novo nunca subiu    -> restaura o backup.
#
# Roda a cada 5 min pelo cron do proprio usuario (sem root). Idempotente.
# =====================================================================
set -uo pipefail

SELF="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="${LEON_INSTALL_DIR:-$(dirname "$SELF")}"
ENV_FILE="$INSTALL_DIR/.env"
MARK="$INSTALL_DIR/.pos-update.json"
LOG="$INSTALL_DIR/upgrade.log"
SERVICE="${LEON_SERVICE:-leon-agente.service}"
SYSTEMCTL="${LEON_SYSTEMCTL:-/bin/systemctl}"
LIMITE="${LEON_GUARD_LIMITE:-240}"   # segundos ate considerar que o motor novo nao subiu

[ -f "$MARK" ] || exit 0
[ -f "$ENV_FILE" ] || exit 0

AGORA="$(date +%s)"
MT="$(stat -c %Y "$MARK" 2>/dev/null || echo "$AGORA")"
IDADE=$(( AGORA - MT ))
[ "$IDADE" -ge "$LIMITE" ] || exit 0

say() { printf '%s %s\n' "$(date '+%F %T')" "$*" >> "$LOG" 2>/dev/null || true; }

env_get() {
  grep -E "^$1=" "$ENV_FILE" 2>/dev/null | tail -1 | cut -d= -f2- \
    | sed 's/[[:space:]]*#.*$//; s/^[[:space:]]*//; s/[[:space:]]*$//; s/^"//; s/"$//'
}
TG_TOKEN="$(env_get TELEGRAM_BOT_TOKEN)"
CHAT="$(env_get OWNER_CHAT_ID)"

avisa() {
  [ -n "$TG_TOKEN" ] && [ -n "$CHAT" ] || return 0
  curl -s --max-time 20 "https://api.telegram.org/bot${TG_TOKEN}/sendMessage" \
    --data-urlencode "chat_id=${CHAT}" --data-urlencode "text=$1" >/dev/null 2>&1 || true
}

BACKUP="$(sed -n 's/.*"backup":"\([^"]*\)".*/\1/p' "$MARK" 2>/dev/null)"
[ -n "$BACKUP" ] && [ -d "$BACKUP" ] || BACKUP="$(ls -1dt "${INSTALL_DIR}".bak-* 2>/dev/null | head -1)"

# Sem backup pra restaurar: so avisa (e para de repetir).
if [ -z "$BACKUP" ] || [ ! -d "$BACKUP" ]; then
  say "guard: marcador velho ($IDADE s) e nenhum backup pra restaurar"
  rm -f "$MARK" 2>/dev/null
  avisa "⚠️ A atualização não completou e eu não achei cópia de segurança pra voltar. Se eu não estiver respondendo, fala com o suporte: https://wa.me/5511961562217"
  exit 0
fi

say "guard: marcador com $IDADE s sem saudacao -> restaurando $BACKUP"
rm -f "$MARK" 2>/dev/null

# Preserva o estado atual (o cliente pode ter conversado entre a troca e a queda).
for guardado in .env sessions.json topics.json; do
  [ -f "$INSTALL_DIR/$guardado" ] && cp -a "$INSTALL_DIR/$guardado" "$BACKUP/$guardado" 2>/dev/null
done

if cp -a "$BACKUP"/. "$INSTALL_DIR"/ 2>>"$LOG"; then
  sudo -n "$SYSTEMCTL" restart "$SERVICE" >/dev/null 2>&1
  sleep 8
  avisa "⚠️ A versão nova não subiu direito, então voltei sozinho pra versão de antes. Já estou no ar de novo e nada se perdeu. Pode falar comigo normalmente. Se quiser, tenta /atualiza mais tarde."
  say "guard: restauracao concluida"
else
  avisa "⚠️ A atualização não completou e a volta automática falhou. Fala com o suporte: https://wa.me/5511961562217"
  say "guard: restauracao FALHOU"
fi
exit 0
