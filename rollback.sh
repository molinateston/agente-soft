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

# Garante o barramento de usuário pro systemctl --user funcionar em rollback
# manual ('sudo -iu agente; bash rollback.sh'), senão dá 'Failed to connect to bus'.
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
export DBUS_SESSION_BUS_ADDRESS="${DBUS_SESSION_BUS_ADDRESS:-unix:path=${XDG_RUNTIME_DIR}/bus}"

BRIDGE_DIR="$HOME/lean-bridge"
SKILLS_DIR="$HOME/.claude/skills"
LOG="$BRIDGE_DIR/upgrade.log"
say(){ echo "[$(date '+%H:%M:%S')] [rollback] $*" | tee -a "$LOG"; }

BACKUP_DIR="$(cat "$BRIDGE_DIR/.last-backup" 2>/dev/null || true)"
if [ -z "$BACKUP_DIR" ] || [ ! -d "$BACKUP_DIR" ]; then
  say "✗ Nenhum backup encontrado em ~/lean-bridge/.last-backup"; exit 1
fi
say "=== ROLLBACK a partir de $BACKUP_DIR ==="

# 1) Para o serviço. A partir daqui o bot está DOWN — armamos uma rede de segurança:
#    se QUALQUER passo abaixo abortar (set -e, cp falho, disco), o trap religa o
#    serviço antes de sair. Nunca deixa o cliente com o bot morto. Desarmado só no
#    restart controlado do passo 5.
say "→ 1/5 Parando serviço..."
trap 'systemctl --user restart agente >/dev/null 2>&1 || true' EXIT
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
    say "‼️  FALHA REAL: não revertí as skills pro $SHA — método pode estar inconsistente. Olhe: git -C $SKILLS_DIR log --oneline -5"
  fi
else
  say "   (sem SHA salvo — pulando reversão de skills)"
fi

# 3) Restaura config (não-secreta) do backup. sessions.json volta também
#    (se foi salvo no snapshot) pra preservar o --resume das conversas.
say "→ 3/5 Restaurando bridge.cjs/.env/persona/topics/sessions..."
for f in .env topics.json sessions.json bridge.cjs; do
  [ -f "$BACKUP_DIR/$f" ] && { cp -p "$BACKUP_DIR/$f" "$BRIDGE_DIR/$f" || say "⚠️ cp de $f falhou — segui (não abortei o rollback)."; }
done
# Persona ATÔMICA: copia pra .new e só ENTÃO troca. Nunca apaga a persona viva antes de
# garantir a cópia — senão um cp truncado (disco/backup) deixaria o bot SEM ALMA (Claude
# genérico), justo o que a doutrina evita.
if [ -d "$BACKUP_DIR/persona" ]; then
  rm -rf "$BRIDGE_DIR/persona.new" 2>/dev/null || true
  if cp -rp "$BACKUP_DIR/persona" "$BRIDGE_DIR/persona.new"; then
    rm -rf "$BRIDGE_DIR/persona" && mv "$BRIDGE_DIR/persona.new" "$BRIDGE_DIR/persona"
  else
    say "⚠️ cp da persona falhou — MANTIDA a persona atual (não apaguei nada)."; rm -rf "$BRIDGE_DIR/persona.new" 2>/dev/null || true
  fi
fi
# Restaura os units do backup: agente.service + os 4 genéricos (update/health .service/.timer),
# senão um rollback deixa units quebrados de um push ruim no lugar.
[ -f "$BACKUP_DIR/agente.service" ] && { cp -p "$BACKUP_DIR/agente.service" "$HOME/.config/systemd/user/agente.service" || say "⚠️ restore do agente.service falhou."; }
UNITS_RESTORED=0
for u in agente-update.service agente-update.timer agente-health.service agente-health.timer; do
  [ -f "$BACKUP_DIR/$u" ] && { cp -p "$BACKUP_DIR/$u" "$HOME/.config/systemd/user/$u" && UNITS_RESTORED=1 || say "⚠️ restore do unit $u falhou."; }
done
systemctl --user daemon-reload 2>>"$LOG" || true
if [ "$UNITS_RESTORED" -eq 1 ]; then
  for t in agente-update.timer agente-health.timer; do
    [ -f "$HOME/.config/systemd/user/$t" ] && { systemctl --user enable --now "$t" 2>>"$LOG" || true; }
  done
fi

# 4) Revalida o bridge
say "→ 4/5 Checando bridge.cjs..."
node --check "$BRIDGE_DIR/bridge.cjs" || { say "✗ bridge.cjs inválido após restore"; exit 1; }

# 5) Sobe e confirma. set -e NÃO pode matar o script aqui: deixa o is-active
#    decidir o status (senão um restart com código != 0 aborta sem diagnóstico).
say "→ 5/5 Reiniciando serviço..."
trap - EXIT   # daqui em diante o restart é controlado; desarma a rede de segurança
systemctl --user restart agente || true
sleep 4
if systemctl --user is-active --quiet agente; then
  say "✅ ROLLBACK OK. Estado anterior restaurado. Manda um 'oi' pro bot."
else
  say "✗ Serviço não subiu na 1ª — tentando mais uma vez..."; systemctl --user restart agente >/dev/null 2>&1 || true; sleep 3
  if systemctl --user is-active --quiet agente; then say "✅ subiu na 2ª tentativa."
  else say "✗ Serviço não subiu após rollback. Veja: tail -40 $BRIDGE_DIR/bridge.log"; exit 1; fi
fi
