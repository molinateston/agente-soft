#!/usr/bin/env bash
# =====================================================================
# runtime-detect.sh — DESCOBRE como este agente roda. Nunca supoe.
#
# Buraco de nascenca que este arquivo fecha: o motor assumia systemd de
# usuario ("systemctl --user") em toda instalacao. Existe instalacao
# paga real rodando como servico de SISTEMA, sem sessao de usuario, onde
# "systemctl --user" responde "Failed to connect to bus" e o /atualiza
# morria em silencio. Agora ninguem supoe: pergunta-se aqui.
#
# Uso:
#   runtime-detect.sh [--dir <workdir>] [--pid <pid>] [--print] [--quiet]
#
# Escreve <workdir>/.runtime.json e (com --print) imprime o JSON.
# Nao reinicia nada, nao muda nada: so observa.
#
# Campos do JSON:
#   modo          user-systemd | system-systemd | pm2 | solto
#   unidade       nome REAL da unit que contem o processo (ou "")
#   busUsuario    true se "systemctl --user" responde de verdade
#   sudoRestart   true se da pra reiniciar a unit com sudo sem senha
#   souRoot       true se rodando como root
#   linger        true se o systemd de usuario tem lingering
#   reiniciar     comando pronto pra reiniciar o agente ("" se nao ha)
#   podeReiniciar true se existe algum jeito de se reiniciar sozinho
#   pm2Nome       nome no pm2 (ou "")
#   pid, usuario, dir, em
# =====================================================================
set -uo pipefail

DIR=""; PID=""; PRINT=0; QUIET=0
while [ $# -gt 0 ]; do
  case "$1" in
    --dir)   DIR="${2:-}"; shift 2 ;;
    --pid)   PID="${2:-}"; shift 2 ;;
    --print) PRINT=1; shift ;;
    --quiet) QUIET=1; shift ;;
    *) shift ;;
  esac
done

SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
[ -n "$DIR" ] || DIR="${LEON_INSTALL_DIR:-$(dirname "$SELF_DIR")}"
OUT="$DIR/.runtime.json"

# ---------------------------------------------------------------
# 1. Qual processo e o agente? (na ordem: o que pediram, o pidfile,
#    um bridge.cjs deste mesmo diretorio, eu mesmo)
# ---------------------------------------------------------------
if [ -z "$PID" ] && [ -f "$DIR/.agent.pid" ]; then
  CAND="$(cat "$DIR/.agent.pid" 2>/dev/null | tr -dc '0-9')"
  [ -n "$CAND" ] && [ -d "/proc/$CAND" ] && PID="$CAND"
fi
if [ -z "$PID" ]; then
  # so aceita se o comando apontar pro bridge DESTE diretorio (numa maquina com
  # mais de um agente, mirar largo pegava o bot do vizinho)
  for p in $(pgrep -u "$(id -u)" -f "bridge\.cjs" 2>/dev/null); do
    cmd="$(tr '\0' ' ' < "/proc/$p/cmdline" 2>/dev/null || true)"
    case "$cmd" in *"$DIR/bridge.cjs"*) PID="$p"; break ;; esac
  done
fi
[ -n "$PID" ] || PID=$$
[ -d "/proc/$PID" ] || PID=$$

USUARIO="$(id -un)"
SOU_ROOT=false; [ "$(id -u)" = "0" ] && SOU_ROOT=true

# ---------------------------------------------------------------
# 2. Em que caixa do sistema esse processo vive? (cgroup nao mente)
# ---------------------------------------------------------------
CG="$(cat "/proc/$PID/cgroup" 2>/dev/null | head -1 | sed 's/^[0-9]*:[^:]*://')"
UNIDADE=""
ULTIMA_SERVICE=""
GERENTE_USUARIO=0
IFS='/' read -r -a PARTES <<< "$CG"
for parte in "${PARTES[@]}"; do
  case "$parte" in
    user@*.service) GERENTE_USUARIO=1 ;;
    *.service)      ULTIMA_SERVICE="$parte" ;;
  esac
done
UNIDADE="$ULTIMA_SERVICE"

MODO="solto"
if [ -n "$UNIDADE" ]; then
  if [ "$GERENTE_USUARIO" = "1" ]; then MODO="user-systemd"; else MODO="system-systemd"; fi
fi

# pm2 deixa marca no ambiente do processo
PM2_NOME=""
if [ -r "/proc/$PID/environ" ]; then
  PM2_NOME="$(tr '\0' '\n' < "/proc/$PID/environ" 2>/dev/null | sed -n 's/^name=//p' | head -1)"
  if tr '\0' '\n' < "/proc/$PID/environ" 2>/dev/null | grep -q '^pm_id='; then
    MODO="pm2"; UNIDADE=""
  fi
fi
[ "$MODO" = "pm2" ] || PM2_NOME=""

# ---------------------------------------------------------------
# 3. O barramento do systemd de usuario responde MESMO? (o teste que
#    faltava: "o arquivo existe" nunca provou que a unit esta viva)
# ---------------------------------------------------------------
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
export DBUS_SESSION_BUS_ADDRESS="${DBUS_SESSION_BUS_ADDRESS:-unix:path=$XDG_RUNTIME_DIR/bus}"
BUS=false
if command -v systemctl >/dev/null 2>&1; then
  if timeout 6 systemctl --user show --property=Version >/dev/null 2>&1; then BUS=true; fi
fi

LINGER=false
if [ -f "/var/lib/systemd/linger/$USUARIO" ]; then LINGER=true
elif command -v loginctl >/dev/null 2>&1; then
  timeout 6 loginctl show-user "$USUARIO" -p Linger 2>/dev/null | grep -qi 'Linger=yes' && LINGER=true
fi

# ---------------------------------------------------------------
# 4. Da pra reiniciar essa unit com sudo sem senha? (pergunta, nao supoe)
# ---------------------------------------------------------------
SUDO_RESTART=false
SYSTEMCTL_BIN="$(command -v systemctl 2>/dev/null || echo /bin/systemctl)"
if [ "$MODO" = "system-systemd" ] && [ "$SOU_ROOT" != "true" ] && [ -n "$UNIDADE" ]; then
  # is-active esta na mesma lista de permissoes do restart e nao mexe em nada
  if timeout 8 sudo -n "$SYSTEMCTL_BIN" is-active "$UNIDADE" >/dev/null 2>&1; then SUDO_RESTART=true
  else
    saida="$(timeout 8 sudo -n "$SYSTEMCTL_BIN" is-active "$UNIDADE" 2>&1 || true)"
    # "inactive"/"failed" = permissao ok, servico parado. Senha/negado = sem permissao.
    case "$saida" in
      *"a password is required"*|*"not allowed"*|*"may not run"*|*"no tty"*) SUDO_RESTART=false ;;
      inactive*|failed*|activating*|deactivating*|unknown*) SUDO_RESTART=true ;;
      *) SUDO_RESTART=false ;;
    esac
  fi
fi

# ---------------------------------------------------------------
# 5. Entao: COMO eu me reinicio nesta maquina?
# ---------------------------------------------------------------
REINICIAR=""
case "$MODO" in
  user-systemd)
    [ "$BUS" = "true" ] && REINICIAR="systemctl --user restart $UNIDADE"
    ;;
  system-systemd)
    if [ "$SOU_ROOT" = "true" ]; then REINICIAR="$SYSTEMCTL_BIN restart $UNIDADE"
    elif [ "$SUDO_RESTART" = "true" ]; then REINICIAR="sudo -n $SYSTEMCTL_BIN restart $UNIDADE"
    fi
    ;;
  pm2)
    command -v pm2 >/dev/null 2>&1 && [ -n "$PM2_NOME" ] && REINICIAR="pm2 restart $PM2_NOME"
    ;;
esac

# Ultimo recurso universal: relancar na mao. So vale se existir o script
# de relancamento ao lado (ele mata o processo antigo e sobe outro solto).
RELANCAR="$SELF_DIR/restart-solto.sh"
if [ -z "$REINICIAR" ] && [ -x "$RELANCAR" ]; then
  REINICIAR="$RELANCAR --dir $DIR"
fi

PODE=false; [ -n "$REINICIAR" ] && PODE=true

# ---------------------------------------------------------------
# 6. Grava (atomico) e imprime
# ---------------------------------------------------------------
json() {
  cat <<JSON
{
  "modo": "$MODO",
  "unidade": "$UNIDADE",
  "busUsuario": $BUS,
  "sudoRestart": $SUDO_RESTART,
  "souRoot": $SOU_ROOT,
  "linger": $LINGER,
  "reiniciar": "$REINICIAR",
  "podeReiniciar": $PODE,
  "pm2Nome": "$PM2_NOME",
  "pid": $PID,
  "usuario": "$USUARIO",
  "dir": "$DIR",
  "em": $(date +%s)
}
JSON
}

if [ "$QUIET" != "1" ] && [ -d "$DIR" ] && [ -w "$DIR" ]; then
  json > "$OUT.tmp" 2>/dev/null && mv -f "$OUT.tmp" "$OUT" 2>/dev/null || rm -f "$OUT.tmp" 2>/dev/null
fi
[ "$PRINT" = "1" ] && json
exit 0
