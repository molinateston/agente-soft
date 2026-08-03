#!/usr/bin/env bash
# =====================================================================
# update-auto.sh — busca automatica de atualizacao, de madrugada.
#
# Por que existe: a instalacao PAGA so atualizava quando o dono digitava
# /atualiza. Quem nunca digitava ficava pra tras pra sempre, sem saber.
# (A instalacao gratuita nao precisa disto: la o systemd ja checa de
# hora em hora. Este script so existe no pacote pago.)
#
# Como roda: o cron chama de hora em hora. O trabalho de verdade so
# acontece na hora sorteada pra ESTA maquina (entre 3h e 5h da manha,
# horario de Brasilia), uma vez por noite. Fora disso ele sai calado.
#
# Barulho zero de madrugada: em modo automatico o atualizador nao fala
# no Telegram, escreve o recado em .aviso-manha.txt e o aviso-manha.sh
# entrega de manha. Se nada mudou, ninguem e avisado de nada.
# =====================================================================
set -uo pipefail

SELF="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="${LEON_INSTALL_DIR:-$(dirname "$SELF")}"
LOG="$INSTALL_DIR/upgrade.log"
MARCA="$INSTALL_DIR/.update-auto-ultima"

say() { printf '%s [auto] %s\n' "$(date '+%F %T')" "$*" >> "$LOG" 2>/dev/null || true; }

[ -f "$INSTALL_DIR/update-pago.sh" ] || exit 0

# --- 1. e a hora desta maquina? ---------------------------------------
# Slot sorteado por maquina (3h, 4h ou 5h) pra nao cair todo cliente no
# mesmo minuto em cima do servidor central. Deterministico: a mesma
# maquina cai sempre no mesmo horario.
SEMENTE="$(hostname 2>/dev/null || echo leon)$(id -u)"
SOMA=0
for (( i=0; i<${#SEMENTE}; i++ )); do
  SOMA=$(( SOMA + $(printf '%d' "'${SEMENTE:$i:1}") ))
done
SLOT=$(( 3 + (SOMA % 3) ))

HORA="$(TZ=America/Sao_Paulo date +%H 2>/dev/null || date +%H)"
HORA=$(( 10#$HORA ))
[ "$HORA" -eq "$SLOT" ] || exit 0

# --- 2. ja rodei esta noite? ------------------------------------------
HOJE="$(TZ=America/Sao_Paulo date +%F 2>/dev/null || date +%F)"
[ "$(cat "$MARCA" 2>/dev/null)" = "$HOJE" ] && exit 0

# --- 3. o agente esta no meio de um trabalho? -------------------------
# Atualizar reinicia o motor. Se ele esta respondendo alguem agora, a
# resposta morreria. Melhor pular e tentar na noite seguinte.
BPID="$(pgrep -u "$(id -u)" -f "bridge.cjs" 2>/dev/null | head -1)"
if [ -n "$BPID" ] && pgrep -P "$BPID" >/dev/null 2>&1; then
  say "agente ocupado, pulei esta noite"
  exit 0
fi

# --- 4. atualizacao ja em andamento? ----------------------------------
[ -f "$INSTALL_DIR/.update-pending.json" ] && exit 0
[ -f "$INSTALL_DIR/.pos-update.json" ] && exit 0

echo "$HOJE" > "$MARCA" 2>/dev/null || true

# --- 5. espalha a carga dentro da hora --------------------------------
sleep $(( RANDOM % 900 )) 2>/dev/null || true

say "iniciando busca automatica (slot ${SLOT}h)"
LEON_UPDATE_AUTO=1 bash "$INSTALL_DIR/update-pago.sh"
say "busca automatica terminou (codigo $?)"
exit 0
