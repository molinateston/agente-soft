#!/usr/bin/env bash
# =====================================================================
# restart-solto.sh — reinicia o agente SEM systemd, SEM pm2, sem nada.
#
# Ultimo recurso universal: existe instalacao onde nao ha servico
# registrado, nao ha sessao de usuario e nao ha permissao de sudo.
# Antes, nesse cenario, o update simplesmente nao reiniciava e ninguem
# avisava. Aqui a gente mata o processo antigo e sobe outro destacado,
# que sobrevive ao fim deste script e ao fechamento do terminal.
#
# CUIDADO DE PROJETO: so encosta em processo cujo comando aponta pro
# bridge.cjs DESTE diretorio. Numa maquina com mais de um agente, mirar
# largo mataria o vizinho — ja quase aconteceu em teste.
#
# Uso: restart-solto.sh [--dir <workdir>]
# =====================================================================
set -uo pipefail

SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIR="${LEON_INSTALL_DIR:-$(dirname "$SELF_DIR")}"
[ "${1:-}" = "--dir" ] && [ -n "${2:-}" ] && DIR="$2"
DIR="$(cd "$DIR" 2>/dev/null && pwd || echo "$DIR")"

LOG="$DIR/upgrade.log"
PIDFILE="$DIR/.agent.pid"
SAIDA="$DIR/agente.out"
say() { printf '%s %s\n' "$(date '+%F %T')" "$*" >> "$LOG" 2>/dev/null || true; }

[ -f "$DIR/bridge.cjs" ] || { say "relancar: nao achei o motor em $DIR"; exit 1; }

NODE_BIN="${LEON_NODE:-}"
if [ -z "$NODE_BIN" ] || [ ! -x "$NODE_BIN" ]; then
  for p in "$(command -v node 2>/dev/null)" /usr/bin/node /usr/local/bin/node "$HOME/.nvm/versions/node"/*/bin/node; do
    [ -n "$p" ] && [ -x "$p" ] && NODE_BIN="$p" && break
  done
fi
[ -n "$NODE_BIN" ] || { say "relancar: nao achei o node nesta maquina"; exit 1; }

# ---- quem sao os alvos: SO o bridge deste diretorio -------------------
ALVOS=""
EU=$$
for p in $(pgrep -u "$(id -u)" -f "bridge\.cjs" 2>/dev/null || true); do
  [ "$p" = "$EU" ] && continue
  cmd="$(tr '\0' ' ' < "/proc/$p/cmdline" 2>/dev/null || true)"
  case "$cmd" in
    *"$DIR/bridge.cjs"*) ALVOS="$ALVOS $p" ;;
  esac
done

for p in $ALVOS; do
  kill "$p" 2>/dev/null && say "relancar: pedi pro processo $p encerrar"
done

# espera ate 10s pela saida limpa, so entao insiste
for _ in $(seq 1 10); do
  VIVO=0
  for p in $ALVOS; do [ -d "/proc/$p" ] && VIVO=1; done
  [ "$VIVO" = "0" ] && break
  sleep 1
done
for p in $ALVOS; do
  [ -d "/proc/$p" ] && kill -9 "$p" 2>/dev/null && say "relancar: precisei forcar o $p"
done

# ---- sobe o novo, destacado ------------------------------------------
cd "$DIR" || exit 1
if command -v setsid >/dev/null 2>&1; then
  setsid nohup "$NODE_BIN" "$DIR/bridge.cjs" >> "$SAIDA" 2>&1 < /dev/null &
else
  nohup "$NODE_BIN" "$DIR/bridge.cjs" >> "$SAIDA" 2>&1 < /dev/null &
fi
NOVO=$!
echo "$NOVO" > "$PIDFILE" 2>/dev/null || true
disown "$NOVO" 2>/dev/null || true
sleep 3

if [ -d "/proc/$NOVO" ]; then
  say "relancar: agente no ar de novo (processo $NOVO)"
  exit 0
fi
say "relancar: o agente nao ficou de pe"
exit 1
