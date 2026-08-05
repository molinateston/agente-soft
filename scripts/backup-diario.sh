#!/usr/bin/env bash
# backup-diario.sh — snapshot local do state do LEON.
# Roda 3h AM via cron. Tudo em ~/backups/. Rotação: 14 dias.
# LOCAL ONLY (sem Drive, sem S3). Se a VPS morrer, o backup morre junto —
# é uma rede pra corrupção de sessions.json / promises / .env, não pra desastre.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BRIDGE_DIR="$(dirname "$SCRIPT_DIR")"
BACKUP_DIR="${HOME}/backups"
LOG="${BACKUP_DIR}/backup.log"

mkdir -p "$BACKUP_DIR"

DATE="$(date +%Y-%m-%d)"
STAMP="$(date +%Y-%m-%d_%H-%M-%S)"
OUT="${BACKUP_DIR}/lean-bridge-state-${DATE}.tar.gz"

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >>"$LOG"; }

log "início — bridge=$BRIDGE_DIR out=$OUT"

cd "$BRIDGE_DIR"

INCLUIDOS=()
for alvo in .env sessions.json topics.json recent-senders.json promises missions; do
  [[ -e "$alvo" ]] && INCLUIDOS+=("$alvo")
done

if [[ ${#INCLUIDOS[@]} -eq 0 ]]; then
  log "nada pra backupar (nenhum arquivo de state encontrado em $BRIDGE_DIR)"
  exit 0
fi

tar -czf "$OUT" "${INCLUIDOS[@]}" 2>>"$LOG" || { log "ERRO no tar"; exit 1; }
SIZE="$(du -h "$OUT" | awk '{print $1}')"
log "ok — $SIZE · ${#INCLUIDOS[@]} alvos: ${INCLUIDOS[*]}"

find "$BACKUP_DIR" -maxdepth 1 -name 'lean-bridge-state-*.tar.gz' -mtime +14 -print -delete 2>>"$LOG" | \
  while read -r removido; do log "rotação: removido $removido"; done

log "fim"
