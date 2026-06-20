#!/usr/bin/env bash
# =====================================================================
# rollback.sh — desfaz o último update, restaurando o estado salvo.
#
# Restore REAL (não é só restart): volta o método (git checkout do SHA
# salvo), restaura .env/persona/topics do backup, revalida e reinicia.
# Usa o ponteiro ~/lean-bridge/.last-backup deixado pelo update.sh.
#
# Uso (como usuário 'agente'):  bash ~/agente-soft/rollback.sh
# =====================================================================
set -euo pipefail

BRIDGE_DIR="$HOME/lean-bridge"
SKILLS_DIR="$HOME/.claude/skills"
LOG="$BRIDGE_DIR/upgrade.log"
say(){ echo "[$(date '+%H:%M:%S')] [rollback] $*" | tee -a "$LOG"; }

BACKUP_DIR="$(cat "$BRIDGE_DIR/.last-backup" 2>/dev/null || true)"
if [ -z "$BACKUP_DIR" ] || [ ! -d "$BACKUP_DIR" ]; then
  say "✗ Nenhum backup encontrado em ~/lean-bridge/.last-backup"; exit 1
fi
say "=== ROLLBACK a partir de $BACKUP_DIR ==="

# 1) Para o serviço
say "→ 1/5 Parando serviço..."
systemctl --user stop agente || true

# 2) Volta o método pro SHA salvo — SEM ficar detached (senão o próximo
#    'pull --ff-only' do auto-update falha pra sempre). Volta pra branch e
#    reset --hard no SHA salvo (funciona mesmo com histórico raso/shallow).
say "→ 2/5 Revertendo skills pro SHA salvo..."
SHA="$(cat "$BACKUP_DIR/skills.sha" 2>/dev/null || echo none)"
if [ "$SHA" != "none" ] && [ -d "$SKILLS_DIR/.git" ]; then
  BR="$(git -C "$SKILLS_DIR" symbolic-ref -q --short HEAD 2>/dev/null || echo main)"
  git -C "$SKILLS_DIR" checkout -q "$BR" 2>/dev/null || git -C "$SKILLS_DIR" checkout -q main 2>/dev/null || true
  if git -C "$SKILLS_DIR" reset --hard "$SHA" 2>/dev/null; then
    say "   skills revertidas pra $SHA (na branch $BR)"
  else
    say "  (não consegui resetar pro $SHA — verifique manualmente)"
  fi
else
  say "   (sem SHA salvo — pulando reversão de skills)"
fi

# 3) Restaura config (não-secreta) do backup. sessions.json volta também
#    (se foi salvo no snapshot) pra preservar o --resume das conversas.
say "→ 3/5 Restaurando bridge.cjs/.env/persona/topics/sessions..."
for f in .env topics.json sessions.json bridge.cjs; do
  [ -f "$BACKUP_DIR/$f" ] && cp -p "$BACKUP_DIR/$f" "$BRIDGE_DIR/$f"
done
[ -d "$BACKUP_DIR/persona" ] && { rm -rf "$BRIDGE_DIR/persona"; cp -rp "$BACKUP_DIR/persona" "$BRIDGE_DIR/persona"; }
[ -f "$BACKUP_DIR/agente.service" ] && { cp -p "$BACKUP_DIR/agente.service" "$HOME/.config/systemd/user/agente.service"; systemctl --user daemon-reload; }

# 4) Revalida o bridge
say "→ 4/5 Checando bridge.cjs..."
node --check "$BRIDGE_DIR/bridge.cjs" || { say "✗ bridge.cjs inválido após restore"; exit 1; }

# 5) Sobe e confirma. set -e NÃO pode matar o script aqui: deixa o is-active
#    decidir o status (senão um restart com código != 0 aborta sem diagnóstico).
say "→ 5/5 Reiniciando serviço..."
systemctl --user restart agente || true
sleep 4
if systemctl --user is-active --quiet agente; then
  say "✅ ROLLBACK OK. Estado anterior restaurado. Manda um 'oi' pro bot."
else
  say "✗ Serviço não subiu após rollback. Veja: tail -40 $BRIDGE_DIR/bridge.log"; exit 1
fi
