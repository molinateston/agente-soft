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

# rotação: se o log passar de ~2MB, trunca mantendo só a cauda (não cresce sem fim)
if [ -f "$LOG" ] && [ "$(wc -c < "$LOG" 2>/dev/null || echo 0)" -gt 2000000 ]; then
  tail -c 500000 "$LOG" > "$LOG.tmp" 2>/dev/null && mv "$LOG.tmp" "$LOG"
fi

env_get(){ grep -E "^$1=" "$BRIDGE_DIR/.env" 2>/dev/null | head -1 | cut -d= -f2- | sed 's/[[:space:]]*#.*$//; s/^"//; s/"$//'; }
TG="$(env_get TELEGRAM_BOT_TOKEN)"; OWNER="$(env_get OWNER_CHAT_ID)"
# Se .env corrompeu e OWNER sumiu, healthcheck vira mudo (sem canal pra avisar).
# Grava sentinel bem visível pra próxima instância recuperada mandar aviso de volta,
# e loga alto no health.log. Sem isso o dono achava que estava tudo bem.
if [ -z "$OWNER" ] || [ -z "$TG" ]; then
  echo "$(date +%s)" > "$BRIDGE_DIR/.owner-lost"
  say "‼️ .env sem TELEGRAM_BOT_TOKEN ou OWNER_CHAT_ID. Healthcheck ficou mudo (sem canal pra avisar o dono). Restaura o .env pra voltar a alertar."
fi
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

# ---- 1b) ZUMBI? serviço active mas parou de pollar (ACHADO 13) -------
# A ponte toca ${BRIDGE_DIR}/.alive a cada poll bem-sucedido. Se o serviço
# está active mas .alive não muda há >180s, o event-loop travou (zumbi):
# reinicia. Só checa se o arquivo existe (versão antiga da ponte não toca).
ALIVE="$BRIDGE_DIR/.alive"
if [ -f "$ALIVE" ]; then
  AGE=$(( $(date +%s) - $(stat -c %Y "$ALIVE" 2>/dev/null || echo 0) ))
  if [ "$AGE" -gt 180 ]; then
    say "ZUMBI — active mas .alive parado ha ${AGE}s — reiniciando"
    systemctl --user restart agente; sleep 4
    if systemctl --user is-active --quiet agente; then
      say "zumbi reiniciado OK"; alert "⚠️ Seu agente tinha travado (estava de pé mas parou de responder) — eu reiniciei sozinho e já voltou."
    else
      say "restart de zumbi FALHOU"; alert "‼️ Seu agente travou e não voltou no restart. Precisa olhar a VPS (logs em ~/lean-bridge/bridge.log)."
    fi
    exit 0
  fi
fi

# ---- 2) login nativo vivo? ------------------------------------------
# O probe `claude -p` falha por DOIS motivos bem diferentes: (a) login
# expirado DE VERDADE, ou (b) limite/saturação momentânea da conta (rate
# limit / overload) — comum quando a mesma conta é usada em mais de um lugar.
# SÓ (a) merece alarme. Distinguimos pelo TEXTO do erro: saturação/rede =
# silêncio TOTAL; auth-fail exige 2 checagens seguidas antes de alarmar; e
# mesmo aí, alerta no MÁX 1x por dia. Resultado: zero alarme por saturação.
NOW=$(date +%s); LAST=$(cat "$STAMP" 2>/dev/null || echo 0)
ASTAMP="$BRIDGE_DIR/.health-alert-stamp"; AUTHFAIL="$BRIDGE_DIR/.health-authfail"
if [ -n "$CB" ] && [ $((NOW - LAST)) -ge 10800 ]; then
  echo "$NOW" > "$STAMP"
  out="$(timeout 30 "$CB" --model sonnet -p "responda só OK" 2>&1)"
  if printf '%s' "$out" | head -c 40 | grep -qiE '^[^a-z]*ok'; then
    rm -f "$ASTAMP" "$AUTHFAIL"        # respondeu → tudo normal, zera tudo
  elif printf '%s' "$out" | grep -qiE 'rate.?limit|usage limit|quota|429|503|529|overload|capacity|too many|try again|temporar|limit reached|esgot|network|timeout|ECONN|fetch failed|socket'; then
    rm -f "$AUTHFAIL"                  # saturação/rede → NÃO é login → silêncio
    say "probe falhou por limite/rede (nao e login) — silenciando"
  elif printf '%s' "$out" | grep -qiE 'oauth|unauthor|401|invalid.*(api|key|credential|token)|expired|please (log|sign) ?in|authenticat|not logged|log ?in to|sign ?in to'; then
    n=$(( $(cat "$AUTHFAIL" 2>/dev/null || echo 0) + 1 )); echo "$n" > "$AUTHFAIL"
    if [ "$n" -ge 2 ]; then
      AL=$(cat "$ASTAMP" 2>/dev/null || echo 0)
      if [ $((NOW - AL)) -ge 86400 ]; then
        echo "$NOW" > "$ASTAMP"; say "AUTH falhou ${n}x — alertando (1x/dia)"
        alert "🔑 O login do Claude venceu (confirmado 2x). Vou ficar mudo até você entrar de novo: abre o terminal da VPS e roda 'claude' pra fazer login. Assim que voltar, mando um oi aqui."
      fi
    else
      say "AUTH falhou 1x — espero confirmar na proxima checagem antes de alarmar"
    fi
  else
    say "probe falhou (erro nao reconhecido) — nao alarma (conservador)"
  fi
fi
