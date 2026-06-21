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

# Execução MANUAL (ex.: 'sudo -iu agente bash ~/agente-soft/update.sh') costuma vir
# sem o ambiente do bus do usuário, e aí 'systemctl --user' falha com "Failed to
# connect to bus". Garantimos os dois aqui (o timer --user já os tem; isto é pro caso manual).
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
export DBUS_SESSION_BUS_ADDRESS="${DBUS_SESSION_BUS_ADDRESS:-unix:path=$XDG_RUNTIME_DIR/bus}"

BRIDGE_DIR="$HOME/lean-bridge"
SKILLS_DIR="$HOME/.claude/skills"
REPO_DIR="$HOME/agente-soft"
LOG="$BRIDGE_DIR/upgrade.log"
TS="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="$BRIDGE_DIR/backups/$TS"

say(){ echo "[$(date '+%F %H:%M:%S')] $*" | tee -a "$LOG"; }
mkdir -p "$BRIDGE_DIR" "$BRIDGE_DIR/backups"
chmod 700 "$BRIDGE_DIR/backups" 2>/dev/null || true   # estrutura de backup não fica legível por outros usuários locais

# Rotação do log: roda toda semana via timer, então sem isto o upgrade.log cresce
# pra sempre. Se passar de ~5MB, mantém só a cauda (últimos ~500KB).
if [ -f "$LOG" ] && [ "$(wc -c <"$LOG" 2>/dev/null || echo 0)" -gt 5242880 ]; then
  tail -c 500000 "$LOG" > "$LOG.tmp" 2>/dev/null && mv "$LOG.tmp" "$LOG"
fi

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
    # Loga o SHA que vai ser descartado pelo reset --hard (pra ser recuperável via reflog/cherry-pick).
    local discarded; discarded="$(git -C "$d" rev-parse HEAD 2>/dev/null || echo '?')"
    say "   $rot: descartando estado local em $discarded (recuperável: git -C $d reflog)."
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

# Units genéricos mudaram? (pra uma mudança SÓ de .service/.timer também propagar
# pra frota, e não ser pulada pelo "nada novo" abaixo.)
UNITS_CHANGED=0
for u in agente-update.service agente-update.timer agente-health.service agente-health.timer; do
  [ -f "$REPO_DIR/$u" ] || continue
  if ! cmp -s "$REPO_DIR/$u" "$HOME/.config/systemd/user/$u" 2>/dev/null; then UNITS_CHANGED=1; break; fi
done

# ---- Nada novo? Sai barato (sem chamar o claude, sem reiniciar) ------
if [ "$OLD_SHA" = "$NEW_SHA" ] && [ "$BRIDGE_CHANGED" -eq 0 ] && [ "$UNITS_CHANGED" -eq 0 ]; then
  [ "$PULL_FAIL" -eq 1 ] && { say "→ Sem mudança aplicável, mas um pull falhou (veja acima)."; exit 1; }
  say "→ Já está na última versão (nada a fazer)."; exit 0
fi
say "→ Mudança detectada (skills $OLD_SHA → $NEW_SHA; bridge=$BRIDGE_CHANGED; units=$UNITS_CHANGED). Aplicando..."

# ---- 2/5 (SEM gate de login) ----------------------------------------
# O update NÃO bloqueia por login. Aplicar (git + cp + restart) é seguro mesmo
# com a conta momentaneamente SATURADA — antes o probe falhava na saturação e o
# update abortava à toa (era a causa de "/atualiza não voltou"). A validação
# PÓS-restart (serviço ativo + node --check + skills) garante que a ponte sobe;
# se o login estiver mesmo expirado, quem avisa o dono é o healthcheck.

# ---- 3/5 Snapshot pré-mudança (sem credenciais), pro auto-rollback ---
# Em disco cheio o snapshot fica truncado mas o cp não falha "duro" — então
# checamos espaço ANTES e validamos cada cp, abortando sem aplicar nada se algo
# der errado. Assim o .last-backup só aponta pra um snapshot íntegro.
FREE_KB="$(df -Pk "$BRIDGE_DIR" 2>/dev/null | awk 'NR==2{print $4}')"
if [ -n "${FREE_KB:-}" ] && [ "$FREE_KB" -lt 204800 ]; then
  say "✗ Espaço livre insuficiente (${FREE_KB}KB < 200MB) — abortando ANTES de mexer. Libere disco e rode de novo."
  exit 1
fi
mkdir -p "$BACKUP_DIR"; chmod 700 "$BACKUP_DIR"
snap_fail() { say "✗ Snapshot falhou ($1) — abortando SEM aplicar (nada foi alterado)."; rm -rf "$BACKUP_DIR"; exit 1; }
echo "$OLD_SHA" > "$BACKUP_DIR/skills.sha" || snap_fail "skills.sha"
for f in .env topics.json sessions.json bridge.cjs; do
  [ -f "$BRIDGE_DIR/$f" ] && { cp -p "$BRIDGE_DIR/$f" "$BACKUP_DIR/$f" || snap_fail "$f"; }
done
[ -d "$BRIDGE_DIR/persona" ] && { cp -rp "$BRIDGE_DIR/persona" "$BACKUP_DIR/persona" || snap_fail "persona"; }
cp -p "$HOME/.config/systemd/user/agente.service" "$BACKUP_DIR/agente.service" 2>/dev/null || true
# Units genéricos no snapshot (pro rollback poder restaurá-los; ver sync abaixo).
for u in agente-update.service agente-update.timer agente-health.service agente-health.timer; do
  [ -f "$HOME/.config/systemd/user/$u" ] && { cp -p "$HOME/.config/systemd/user/$u" "$BACKUP_DIR/$u" || snap_fail "$u"; }
done
# .last-backup só DEPOIS do snapshot inteiro ok (senão rollback apontaria pra lixo).
echo "$BACKUP_DIR" > "$BRIDGE_DIR/.last-backup"

# Aplica bridge novo (com checagem de sintaxe antes de trocar)
if [ "$BRIDGE_CHANGED" -eq 1 ]; then
  if node --check "$REPO_DIR/bridge.cjs"; then cp -p "$REPO_DIR/bridge.cjs" "$BRIDGE_DIR/bridge.cjs"
  else say "✗ bridge.cjs novo tem erro de sintaxe — mantido o antigo."; fi
fi

# ---- Sincroniza os UNITS GENÉRICOS do repo pra frota já instalada -----
# Sem isto, mudança em .service/.timer só chega em quem reinstala. Sincronizamos
# apenas os units que NÃO têm nada interpolado na instalação (usam %h). O
# agente.service fica DE FORA de propósito: ele tem nome/saudação interpolados no
# setup (cat > ... <<EOF), copiá-lo do repo apagaria a personalização do cliente.
UNITS_DST="$HOME/.config/systemd/user"
NEED_RELOAD=0
TIMERS_CHANGED=""
mkdir -p "$UNITS_DST"
for u in agente-update.service agente-update.timer agente-health.service agente-health.timer; do
  src="$REPO_DIR/$u"
  [ -f "$src" ] || continue
  if ! cmp -s "$src" "$UNITS_DST/$u" 2>/dev/null; then
    if cp -p "$src" "$UNITS_DST/$u"; then
      say "→ unit atualizado: $u"
      NEED_RELOAD=1
      case "$u" in *.timer) TIMERS_CHANGED="$TIMERS_CHANGED $u";; esac
    else
      say "⚠️ falha ao copiar unit $u — mantido o antigo."
    fi
  fi
done
if [ "$NEED_RELOAD" -eq 1 ]; then
  systemctl --user daemon-reload 2>>"$LOG" || say "⚠️ daemon-reload falhou (veja $LOG)."
  # re-enable só os timers que mudaram (enable é idempotente; --now religa se preciso).
  for t in $TIMERS_CHANGED; do
    systemctl --user enable --now "$t" 2>>"$LOG" || say "⚠️ enable do timer $t falhou (veja $LOG)."
  done
fi

# ---- Migração idempotente: saudação de boot vira CONDICIONAL (.greet) -
# Sem isto, o "✅ No ar!" do ExecStartPost dispara a CADA reinício — inclusive
# no update agendado de fundo (acorda o dono de madrugada à toa). Patch: se o
# serviço ainda tem a saudação SEM o gate .greet, embute o gate. Resultado:
# instalação e /atualiza criam o .greet (saúdam); update agendado NÃO cria = silencioso.
SVC="$HOME/.config/systemd/user/agente.service"
if [ -f "$SVC" ] && grep -q 'No ar' "$SVC" && ! grep -q '\.greet' "$SVC"; then
  sed -i "s#/bin/sh -c 'sleep 5;#/bin/sh -c '[ -f \"$HOME/lean-bridge/.greet\" ] || exit 0; rm -f \"$HOME/lean-bridge/.greet\"; sleep 5;#" "$SVC"
  systemctl --user daemon-reload 2>>"$LOG"
  say "migração: saudação de boot agora é condicional (.greet) — update agendado fica silencioso."
fi

# ---- 4/5 Reinício -----------------------------------------------------
# NÃO cria .greet aqui de propósito: update AGENDADO = silencioso. (instalação e
# /atualiza criam o .greet antes; só esses saúdam.)
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
