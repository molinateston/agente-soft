#!/usr/bin/env bash
# =====================================================================
# update-watchdog.sh — rede de segurança do /atualiza.
#
# O /atualiza dispara o agente-update.service e responde "já volto com o
# ✅ No ar!". Se QUALQUER elo dessa corrente falhar (o unit não existe, o
# oneshot morre, o update.sh é morto antes do trap, o restart não acontece),
# o dono fica esperando pra sempre uma mensagem que nunca vem. Este script
# fecha esse buraco: roda DESTACADO do bridge, sobrevive ao restart, e
# garante que o dono SEMPRE recebe um veredito.
#
# Contrato do .greet: o bridge cria antes de disparar o update; o
# ExecStartPost do agente.service consome ao saudar. Logo:
#   .greet sumiu  = a saudação saiu, deu certo → silêncio aqui.
#   .greet ficou  = ninguém saudou → alguma coisa não fechou → falamos.
#
# Uso: update-watchdog.sh <fase:curto|longo> [chatId] [threadId]
#   curto (~25s): só fala se o update nem chegou a arrancar.
#   longo (~4min): fala sempre que o .greet ainda estiver lá.
# =====================================================================
set -uo pipefail

FASE="${1:-longo}"
CHAT="${2:-}"
THREAD="${3:-}"

# Duas instalações, dois lugares. Na gratuita o motor mora em ~/lean-bridge e este
# script vem da cópia do repositório (~/agente-soft). Na paga tudo mora no mesmo
# diretório (~/socio-ia). Descobre em vez de cravar, senão vira código morto.
SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if   [ -n "${LEON_BRIDGE_DIR:-}" ];   then BRIDGE_DIR="$LEON_BRIDGE_DIR"
elif [ -f "$HOME/lean-bridge/.env" ]; then BRIDGE_DIR="$HOME/lean-bridge"
elif [ -f "$SELF_DIR/.env" ];         then BRIDGE_DIR="$SELF_DIR"
elif [ -f "$HOME/socio-ia/.env" ];    then BRIDGE_DIR="$HOME/socio-ia"
else BRIDGE_DIR="$HOME/lean-bridge"; fi
GREET="$BRIDGE_DIR/.greet"
LOG="$BRIDGE_DIR/upgrade.log"

# Saudação já consumida = update fechou e o dono já foi avisado. Nada a dizer.
[ -f "$GREET" ] || exit 0

env_get(){ grep -E "^$1=" "$BRIDGE_DIR/.env" 2>/dev/null | head -1 | cut -d= -f2- | sed 's/[[:space:]]*#.*$//; s/^"//; s/"$//'; }
T="$(env_get TELEGRAM_BOT_TOKEN)"
[ -n "$CHAT" ] || CHAT="$(env_get OWNER_CHAT_ID)"
[ -n "$T" ] && [ -n "$CHAT" ] || exit 0

# Quem está fazendo o trabalho depende da instalação: na gratuita é um serviço
# separado; na paga é o update-pago.sh rodando como processo comum.
EST="$(systemctl --user is-active agente-update.service 2>/dev/null || true)"
if [ -z "$EST" ] || [ "$EST" = "inactive" ]; then
  if pgrep -f "update-pago.sh" >/dev/null 2>&1; then EST="active"; fi
fi
[ -n "$EST" ] || EST="desconhecido"

# Na fase curta só interessa o caso "nem arrancou". Se está rodando, deixa rodar.
if [ "$FASE" = "curto" ]; then
  case "$EST" in
    activating|active) exit 0 ;;
  esac
fi

case "$EST" in
  activating|active)
    MSG="⏳ A atualização ainda tá rodando, já faz alguns minutos. Não travei, é só demora mesmo. Te aviso assim que terminar."
    ;;
  failed)
    MSG="⚠️ A atualização não completou. Continuo no ar na versão de antes, nada quebrou nem se perdeu. Manda /atualiza de novo daqui a pouco. Se repetir, me fala que eu vejo o que houve."
    ;;
  *)
    MSG="⚠️ Não consegui nem começar a atualização. Continuo no ar na versão de antes, nada quebrou nem se perdeu. Manda /atualiza de novo daqui a pouco. Se repetir, me fala que eu vejo o que houve."
    ;;
esac

# Uma pista concreta do log, quando existir — melhor que erro genérico.
CAUSA="$(grep -E '✗|‼️|⚠️' "$LOG" 2>/dev/null | tail -1 | cut -c1-200)"
[ -n "$CAUSA" ] && MSG="$MSG"$'\n\n'"Última pista do meu log: $CAUSA"

curl -s --max-time 15 "https://api.telegram.org/bot${T}/sendMessage" \
  --data-urlencode "chat_id=${CHAT}" \
  ${THREAD:+--data-urlencode "message_thread_id=${THREAD}"} \
  --data-urlencode "text=$MSG" >/dev/null 2>&1 || true

# Se ainda está rodando, o .greet continua reservado pro ExecStartPost saudar.
# Se morreu, limpa pra não virar saudação fantasma no próximo boot.
case "$EST" in
  activating|active) : ;;
  *) rm -f "$GREET" 2>/dev/null || true ;;
esac
