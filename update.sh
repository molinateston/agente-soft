#!/usr/bin/env bash
# =====================================================================
# update.sh — atualiza o Agente Soft com segurança (runtime lean).
#
# Pensado pra rodar TAMBÉM sem ninguém olhando (via timer 1x por semana):
#  - PRIMEIRO detecta mudança (git pull + compara SHA) → se nada mudou, sai
#    sem chamar o claude (não queima call paga à toa)
#  - só ENTÃO valida o login nativo e aplica
#  - faz snapshot do restaurável-NÃO-secreto antes de mexer
#  - valida ponta-a-ponta; se falhar, REVERTE SOZINHO (cliente nunca cai)
#
# NUNCA copia o ~/.claude/ inteiro (lá moram as credenciais do login nativo).
#
# Uso:  bash ~/agente-soft/update.sh
# =====================================================================
set -uo pipefail

BRIDGE_DIR="$HOME/lean-bridge"
SKILLS_DIR="$HOME/.claude/skills"
REPO_DIR="$HOME/agente-soft"
LOG="$BRIDGE_DIR/upgrade.log"
TS="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="$BRIDGE_DIR/backups/$TS"

say(){ echo "[$(date '+%F %H:%M:%S')] $*" | tee -a "$LOG"; }
mkdir -p "$BRIDGE_DIR" "$BRIDGE_DIR/backups"
chmod 700 "$BRIDGE_DIR/backups" 2>/dev/null || true   # estrutura de backup não fica legível por outros usuários locais

# claude pelo caminho ABSOLUTO (o timer --user tem PATH minúsculo; sem isso o
# 'command -v claude' / 'claude -p' falham mesmo com o CLI instalado — bug em campo).
CLAUDE_BIN="${CLAUDE_BIN:-}"
if [ -z "$CLAUDE_BIN" ] || [ ! -x "$CLAUDE_BIN" ]; then
  for p in "$HOME/.npm-global/bin/claude" "$HOME/.local/bin/claude" /usr/local/bin/claude /usr/bin/claude /snap/bin/claude; do
    [ -x "$p" ] && CLAUDE_BIN="$p" && break
  done
fi
[ -z "$CLAUDE_BIN" ] && command -v claude >/dev/null 2>&1 && CLAUDE_BIN="$(command -v claude)"

say "=== UPDATE $TS ==="

# ---- 1/5 Detectar mudança PRIMEIRO (barato; nada de claude ainda) ----
[ -n "$CLAUDE_BIN" ] || { say "✗ claude CLI ausente. Rode o bootstrap."; exit 1; }

OLD_SHA="$( [ -d "$SKILLS_DIR/.git" ] && git -C "$SKILLS_DIR" rev-parse HEAD 2>/dev/null || echo none )"

# Puxar método (skills) e ponte (repo). Falha de pull NÃO é silenciosa: avisa.
pull_safe() {  # $1 = dir, $2 = rótulo
  local d="$1" rot="$2"
  [ -d "$d/.git" ] || return 0
  # garante que está numa branch (não detached) antes do ff-only
  git -C "$d" symbolic-ref -q HEAD >/dev/null 2>&1 || git -C "$d" checkout -q main 2>>"$LOG" || true
  if ! git -C "$d" pull -q --ff-only 2>>"$LOG"; then
    say "⚠️ pull --ff-only falhou em $rot (divergência upstream?) — tentando sincronizar com origin/main..."
    if git -C "$d" fetch -q 2>>"$LOG" && git -C "$d" reset --hard origin/main 2>>"$LOG"; then
      say "   $rot ressincronizado com origin/main."
    else
      say "‼️ não consegui atualizar $rot (sem rede ou repo sem acesso). Veja: tail -40 $LOG"
      PULL_FAIL=1
    fi
  fi
}
PULL_FAIL=0
pull_safe "$SKILLS_DIR" "skills"
pull_safe "$REPO_DIR"   "repo (ponte)"
NEW_SHA="$( [ -d "$SKILLS_DIR/.git" ] && git -C "$SKILLS_DIR" rev-parse HEAD 2>/dev/null || echo none )"

# ---- Freio de emergência: se o dono colocar um arquivo HALT no repo do método,
#      o update PARA de aplicar (permite cortar a frota inteira se um push ruim/hostil vazar).
if [ -f "$REPO_DIR/HALT" ] || [ -f "$SKILLS_DIR/HALT" ]; then
  say "⛔ HALT presente no repo — update suspenso de propósito. Nada aplicado. (remova o HALT pra religar)"
  exit 0
fi

BRIDGE_CHANGED=0
if [ -f "$REPO_DIR/bridge.cjs" ] && ! cmp -s "$REPO_DIR/bridge.cjs" "$BRIDGE_DIR/bridge.cjs" 2>/dev/null; then
  BRIDGE_CHANGED=1
fi

# ---- Nada novo? Sai barato (sem chamar o claude, sem reiniciar) ------
if [ "$OLD_SHA" = "$NEW_SHA" ] && [ "$BRIDGE_CHANGED" -eq 0 ]; then
  [ "$PULL_FAIL" -eq 1 ] && { say "→ Sem mudança aplicável, mas um pull falhou (veja acima)."; exit 1; }
  say "→ Já está na última versão (nada a fazer)."; exit 0
fi
say "→ Mudança detectada (skills $OLD_SHA → $NEW_SHA; bridge alterado=$BRIDGE_CHANGED). Aplicando..."

# ---- 2/5 Agora sim: login nativo precisa estar vivo pra aplicar ------
#     (match firme: a 1ª palavra-ish da resposta tem que ser 'ok', pra não
#      casar "não está ok" como falso-positivo de login válido.)
if ! "$CLAUDE_BIN" -p "responda só OK" 2>/dev/null | head -c 40 | grep -qiE '^[^a-z]*ok'; then
  say "✗ Login nativo expirado: rode 'claude' e logue de novo. Update abortado (mudança ficou pendente)."; exit 1
fi

# ---- 3/5 Snapshot pré-mudança (sem credenciais), pro auto-rollback ---
mkdir -p "$BACKUP_DIR"; chmod 700 "$BACKUP_DIR"
echo "$OLD_SHA" > "$BACKUP_DIR/skills.sha"
for f in .env topics.json sessions.json bridge.cjs; do [ -f "$BRIDGE_DIR/$f" ] && cp -p "$BRIDGE_DIR/$f" "$BACKUP_DIR/$f"; done
[ -d "$BRIDGE_DIR/persona" ] && cp -rp "$BRIDGE_DIR/persona" "$BACKUP_DIR/persona"
cp -p "$HOME/.config/systemd/user/agente.service" "$BACKUP_DIR/agente.service" 2>/dev/null || true
echo "$BACKUP_DIR" > "$BRIDGE_DIR/.last-backup"

# Aplica bridge novo (com checagem de sintaxe antes de trocar)
if [ "$BRIDGE_CHANGED" -eq 1 ]; then
  if node --check "$REPO_DIR/bridge.cjs"; then cp -p "$REPO_DIR/bridge.cjs" "$BRIDGE_DIR/bridge.cjs"
  else say "✗ bridge.cjs novo tem erro de sintaxe — mantido o antigo."; fi
fi

# ---- 4/5 Reinício -----------------------------------------------------
systemctl --user restart agente
sleep 4

# ---- 5/5 Validação (e auto-rollback se falhar) -----------------------
FAIL=0
node --check "$BRIDGE_DIR/bridge.cjs" || FAIL=1
systemctl --user is-active --quiet agente || FAIL=1
ls "$SKILLS_DIR"/*/SKILL.md >/dev/null 2>&1 || FAIL=1
if [ "$FAIL" -eq 0 ]; then
  say "✅ UPDATE OK (skills em $NEW_SHA)."
  exit 0
fi

say "✗ Validação falhou — REVERTENDO SOZINHO pro estado anterior..."
if [ -x "$REPO_DIR/rollback.sh" ]; then
  if bash "$REPO_DIR/rollback.sh" >>"$LOG" 2>&1; then
    say "↩️  Revertido. Cliente segue no ar na versão anterior."
  else
    say "‼️  Rollback automático falhou — precisa olhar manual: tail -40 $LOG"
  fi
else
  say "‼️  rollback.sh ausente — não consegui reverter sozinho."
fi
exit 1
