#!/usr/bin/env bash
# Report diario de tokens: roda 07h30 pelo cron do usuario que instalou o agente.
# Ele mesmo cria a sala Tokens no Telegram na primeira vez que consegue falar com o grupo.
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NODE="$(command -v node || echo /usr/bin/node)"
mkdir -p "$DIR/logs"
cd "$DIR" && "$NODE" workers/report-tokens.cjs --send >> "$DIR/logs/report-tokens.log" 2>&1
