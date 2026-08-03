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

# --- Aviso ao dono (best-effort) lendo token+owner do .env ---------------
GREET="$BRIDGE_DIR/.greet"
env_get(){ grep -E "^$1=" "$BRIDGE_DIR/.env" 2>/dev/null | head -1 | cut -d= -f2- | sed 's/[[:space:]]*#.*$//; s/^"//; s/"$//'; }
RECIBO="$BRIDGE_DIR/.update-pending.json"
# O recibo guarda em qual conversa (e tópico) o pedido foi feito, pra resposta voltar
# no mesmo lugar da pergunta em vez de cair sempre na conversa principal.
recibo_campo(){ sed -n "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"\{0,1\}\([^,\"}]*\)\"\{0,1\}.*/\1/p" "$RECIBO" 2>/dev/null | head -1; }
tg(){ local T O TH; T="$(env_get TELEGRAM_BOT_TOKEN)"
  O="$(recibo_campo chatId)"; [ -n "$O" ] || O="$(env_get OWNER_CHAT_ID)"
  TH="$(recibo_campo threadId)"; [ "$TH" = "null" ] && TH=""
  [ -n "$T" ] && [ -n "$O" ] && \
  curl -s --max-time 15 "https://api.telegram.org/bot${T}/sendMessage" \
  --data-urlencode "chat_id=${O}" ${TH:+--data-urlencode "message_thread_id=${TH}"} \
  --data-urlencode "text=$1" >/dev/null 2>&1 || true; }

# Se este update foi disparado por /atualiza, o bridge grava o RECIBO ANTES. Mas há 5
# saídas-precoces aqui ANTES do restart (HALT, claude ausente, "já na última", disco,
# snapshot) — nelas o dono nunca ouviria de volta. O trap responde na hora (só se foi
# /atualiza) e rasga o recibo DEPOIS de falar, pra o vigia não repetir a mesma notícia
# minutos depois. Se a mensagem não sair, o recibo fica e o vigia cobre. Desarmado logo
# antes do restart: daí quem saúda é o motor novo ao subir. Update AGENDADO não tem
# recibo → trap fica mudo.
on_exit(){
  local rc=$?
  if [ -f "$RECIBO" ]; then
    if [ "$rc" -eq 0 ]; then tg "✅ Conferi: você já estava na última versão, não precisou trocar nada. Segui no ar o tempo todo."
    else tg "⚠️ Tentei atualizar e não consegui agora — continuo no ar na versão de antes e nada da nossa conversa se perdeu. Tento de novo no automático."; fi
    rm -f "$RECIBO" 2>/dev/null || true
  fi
  rm -f "$GREET" 2>/dev/null || true
}
trap on_exit EXIT

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

# =====================================================================
# A PONTE DEIXOU DE VIR DE CLONE (30/07/2026).
# Antes daqui rodava um `pull_safe` no ~/agente-soft. Como a instalacao nova nao
# clona mais nada, aquela funcao voltava calada (`[ -d .git ] || return 0`) e a
# ponte simplesmente PARAVA de se atualizar, sem log e sem erro. Agora a ponte se
# atualiza baixando o pacote da versao publicada.
# Quem instalou ANTES desta mudanca e ainda tem clone continua atendido: se a pasta
# tiver .git e o download nao estiver disponivel, o caminho velho roda.
# =====================================================================
BASE_AGENTE="${AGENTE_SOFT_BASE:-https://raw.githubusercontent.com/molinateston/agente-soft/main}"

baixar_pacote() {
  local pub inst tmp
  pub="$(curl -fsSL --max-time 30 "$BASE_AGENTE/VERSAO" 2>>"$LOG" | tr -d '[:space:]')"
  if [ -z "$pub" ]; then
    say "⚠️ não consegui ver qual é a versão publicada (internet ou GitHub fora). Sigo na versão atual."
    PULL_FAIL=1; return 0
  fi
  inst="$(tr -d '[:space:]' < "$REPO_DIR/VERSAO" 2>/dev/null)"
  if [ "$pub" = "$inst" ]; then say "   ponte já está na versão $pub."; return 0; fi
  say "→ versão nova da ponte: ${inst:-desconhecida} → $pub. Baixando..."
  tmp="$(mktemp -d)"
  if ! curl -fsSL --max-time 180 -o "$tmp/p.tar.gz" "$BASE_AGENTE/pacote/$pub/agente-soft.tar.gz" 2>>"$LOG"; then
    say "⚠️ não consegui baixar a versão $pub. Sigo na atual."
    rm -rf "$tmp"; PULL_FAIL=1; return 0
  fi
  # A soma é obrigatória: sem ela não dá pra saber se o que chegou é o que foi
  # publicado, e atualizar às cegas é pior do que não atualizar.
  if ! curl -fsSL --max-time 30 -o "$tmp/soma" "$BASE_AGENTE/pacote/$pub/agente-soft.tar.gz.sha256" 2>>"$LOG"; then
    say "⚠️ a versão $pub foi publicada sem arquivo de conferência. NÃO apliquei. Sigo na atual."
    rm -rf "$tmp"; PULL_FAIL=1; return 0
  fi
  if ! ( cd "$tmp" && sed 's/agente-soft.tar.gz/p.tar.gz/' soma | sha256sum -c - >/dev/null 2>&1 ); then
    say "⚠️ o pacote $pub chegou corrompido. Sigo na atual."
    rm -rf "$tmp"; PULL_FAIL=1; return 0
  fi
  mkdir -p "$tmp/novo"
  if ! tar -xzf "$tmp/p.tar.gz" -C "$tmp/novo" 2>>"$LOG"; then
    say "⚠️ o pacote $pub não abriu. Sigo na atual."
    rm -rf "$tmp"; PULL_FAIL=1; return 0
  fi
  if [ ! -s "$tmp/novo/bridge.cjs" ] || ! node --check "$tmp/novo/bridge.cjs" >/dev/null 2>&1; then
    say "⚠️ o pacote $pub veio incompleto ou com motor inválido. NÃO apliquei. Sigo na atual."
    rm -rf "$tmp"; PULL_FAIL=1; return 0
  fi
  # troca a pasta inteira (assim arquivo que saiu da versao nova some de verdade),
  # guardando a anterior do lado pra dar pra voltar na mao.
  rm -rf "$REPO_DIR.anterior"
  [ -d "$REPO_DIR" ] && mv "$REPO_DIR" "$REPO_DIR.anterior"
  mv "$tmp/novo" "$REPO_DIR"
  rm -rf "$tmp"
  # Grava a versão que foi PEDIDA, não a que veio escrita dentro do pacote. Se as duas
  # divergirem (empacotamento errado), sem isto o cliente acha que continua na antiga e
  # rebaixa o mesmo pacote de hora em hora, pra sempre. Apareceu no teste de 30/07.
  printf '%s\n' "$pub" > "$REPO_DIR/VERSAO"
  say "   ponte baixada na versão $pub (a anterior ficou em $REPO_DIR.anterior)."
}

if [ -d "$REPO_DIR/.git" ]; then
  # instalacao antiga, feita por clone: mantem o caminho dela
  pull_safe "$REPO_DIR" "repo (ponte)"
else
  baixar_pacote
fi
NEW_SHA="$( [ -d "$SKILLS_DIR/.git" ] && git -C "$SKILLS_DIR" rev-parse HEAD 2>/dev/null || echo none )"

# ---- Freio de emergência: se o dono colocar um arquivo HALT no repo do método,
#      o update PARA de aplicar (permite cortar a frota inteira se um push ruim/hostil vazar).
if [ -f "$REPO_DIR/HALT" ] || [ -f "$SKILLS_DIR/HALT" ]; then
  say "⛔ HALT presente no repo — update suspenso de propósito. Nada aplicado. (remova o HALT pra religar)"
  exit 0
fi

# ---- MÉTODO: as skills do pacote alcançam ~/.claude/skills ------------
# 03/08: aqui estava o furo que congelava a frota. A instalação copia as skills UMA vez
# (`cp -an` no SETUP-AGENTE.md, que por definição não sobrescreve) e o update trocava só a
# pasta ~/agente-soft. Resultado: o cliente baixava skills novas dentro do pacote e seguia
# lendo as antigas em ~/.claude/skills PARA SEMPRE — método congelado na versão do dia da
# instalação, sem um único aviso.
# Fica DEPOIS do HALT de propósito: o freio existe pra cortar a frota se um push ruim vazar,
# e método aplicado antes do freio é exatamente o que ele precisa impedir.
# Só roda no caminho do pacote: quem tem ~/.claude/skills/.git é instalação antiga por clone
# e continua sendo servida pelo pull_safe lá em cima (mexer aqui apagaria o git dele).
if [ -d "$REPO_DIR/skills" ] && [ ! -d "$SKILLS_DIR/.git" ]; then
  mkdir -p "$SKILLS_DIR"
  # -a preserva modo/mtime; sem -n de propósito: SOBRESCREVER é o conserto.
  if cp -a "$REPO_DIR/skills/." "$SKILLS_DIR/" 2>>"$LOG"; then
    say "   método sincronizado: $(find "$SKILLS_DIR" -maxdepth 2 -name SKILL.md 2>/dev/null | wc -l) skills em $SKILLS_DIR."
  else
    say "⚠️ não consegui sincronizar as skills do método (veja $LOG). A ponte atualizou; o método não."
  fi
fi

# ---- Codex CLI (imagem grátis pela assinatura ChatGPT do dono) --------
# Quem instalou ANTES do codex entrar no bootstrap não tem o binário. Aqui a
# frota antiga alcança a capacidade nova. Roda como 'agente' (sem sudo), então
# instala no prefixo do próprio usuário — que já está no PATH do serviço.
# Fica ANTES da saída-precoce "nada novo" de propósito: senão cliente sem
# mudança de skills nunca ganharia o codex.
# O LOGIN não é feito aqui (é interativo e pessoal): quem conduz é o agente no chat.
if ! command -v codex >/dev/null 2>&1 && [ ! -x "$HOME/.npm-global/bin/codex" ]; then
  if command -v npm >/dev/null 2>&1; then
    say "→ instalando o Codex (imagem grátis pela conta ChatGPT do dono)..."
    if timeout 300 npm install -g --prefix "$HOME/.npm-global" @openai/codex >>"$LOG" 2>&1; then
      say "   codex instalado em $HOME/.npm-global/bin/codex (falta só o dono fazer o login uma vez)."
    else
      say "   ⚠️ codex não instalou agora — tento no próximo update. Imagem segue pelas chaves do .env."
    fi
  fi
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
BRIDGE_BROKEN=0
if [ "$BRIDGE_CHANGED" -eq 1 ]; then
  if node --check "$REPO_DIR/bridge.cjs"; then cp -p "$REPO_DIR/bridge.cjs" "$BRIDGE_DIR/bridge.cjs"
  else
    say "✗ bridge.cjs novo tem erro de sintaxe — mantido o antigo."
    BRIDGE_BROKEN=1
    # skills já foram aplicadas antes desta linha (git pull). O aviso ao dono
    # sai no fim do script, antes do restart — pra ele saber que atualizei mas
    # o motor novo estava quebrado (segue no antigo, sem impacto imediato).
  fi
fi


# --- Leitor de documento (markitdown) — instala pra quem já era cliente antes dele existir ---
# Idempotente e silencioso: se já está lá, não faz nada; se falhar, o motor cai no caminho antigo.
if [ ! -x "$HOME/.local/venv-markitdown/bin/markitdown" ]; then
  ( mkdir -p "$HOME/.local" \
    && python3 -m venv "$HOME/.local/venv-markitdown" \
    && "$HOME/.local/venv-markitdown/bin/pip" install --quiet markitdown mammoth openpyxl python-pptx pdfminer.six ) >/dev/null 2>&1 \
    || true
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
  # casa QUALQUER 'sleep N;' — as 2 primeiras releases gravavam 'sleep 2;' incondicional,
  # a terceira 'sleep 5;'. Sem o [0-9]+ o cliente 'sleep 2' nunca migrava e acordava o
  # dono '✅ No ar!' de madrugada pra sempre (a cada boot/restart, não só 1x/semana).
  sed -E -i "s#(/bin/sh -c ')sleep [0-9]+;#\1[ -f \"$HOME/lean-bridge/.greet\" ] || exit 0; rm -f \"$HOME/lean-bridge/.greet\"; sleep 5;#" "$SVC"
  systemctl --user daemon-reload 2>>"$LOG"
  say "migração: saudação de boot agora é condicional (.greet) — update agendado fica silencioso."
  # re-snapshota o serviço JÁ migrado, pra um rollback restaurar a versão condicional
  # (.greet) e não ressuscitar a saudação incondicional.
  cp -p "$SVC" "$BACKUP_DIR/agente.service" 2>/dev/null || true
fi

# ---- Report diario de tokens (a sala Tokens nasce junto com o agente) --
# Idempotente: so agenda se ainda nao houver linha. O worker cria a sala no
# Telegram sozinho na primeira vez que consegue falar com o grupo.
if [ -x "$BRIDGE_DIR/scripts/report-tokens.sh" ] && command -v crontab >/dev/null 2>&1; then
  CUR_CRON="$(crontab -l 2>/dev/null || true)"
  if ! printf %s "$CUR_CRON" | grep -qF "report-tokens.sh"; then
    { [ -n "$CUR_CRON" ] && printf '%s\n' "$CUR_CRON"
      printf '30 7 * * * %s >/dev/null 2>&1\n' "$BRIDGE_DIR/scripts/report-tokens.sh"; } \
      | crontab - 2>>"$LOG" && say "→ report diario de tokens agendado (07h30)."
  fi
fi

# ---- 4/5 Reinício -----------------------------------------------------
# NÃO cria recibo aqui de propósito: update AGENDADO = silencioso. (só o /atualiza
# grava recibo, e só ele é saudado.) Desarma o trap: daqui em diante quem responde é o
# motor novo ao subir (consome o recibo e saúda), e se ele não subir, o vigia entrega
# o veredito honesto de fora.
trap - EXIT

# COMO reiniciar e COMO conferir NESTA máquina. Nunca supor que existe systemd de
# usuário: há instalação sem sessão de usuário, onde "systemctl --user" não responde
# — lá o reinício não acontecia e ninguém ficava sabendo. Tenta o caminho de sempre;
# se ele não servir, pergunta ao detector qual é o jeito desta máquina. E pra saber
# se o agente está de pé sem barramento, olha o processo em vez do systemd.
BUS_OK=0
timeout 6 systemctl --user show --property=Version >/dev/null 2>&1 && BUS_OK=1

agente_reiniciar() {
  if [ "$BUS_OK" = "1" ] && systemctl --user restart agente 2>>"$LOG"; then return 0; fi
  local det="$REPO_DIR/scripts/runtime-detect.sh" cmd=""
  [ -x "$det" ] || det="$BRIDGE_DIR/scripts/runtime-detect.sh"
  if [ -x "$det" ]; then
    cmd="$("$det" --dir "$BRIDGE_DIR" --print 2>/dev/null | sed -n 's/.*"reiniciar"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | head -1)"
  fi
  if [ -n "$cmd" ]; then
    say "sem o caminho de sempre; reiniciando pelo jeito desta máquina: $cmd"
    bash -lc "$cmd" >>"$LOG" 2>&1 && return 0
  fi
  say "⚠️ não encontrei jeito de reiniciar o agente nesta máquina"
  return 1
}

agente_vivo() {
  if [ "$BUS_OK" = "1" ]; then systemctl --user is-active --quiet agente && return 0; fi
  pgrep -u "$(id -u)" -f "$BRIDGE_DIR/bridge.cjs" >/dev/null 2>&1
}

agente_reiniciar || true
sleep 4

# ---- 5/5 Validação (e auto-rollback se falhar) -----------------------
FAIL=0
node --check "$BRIDGE_DIR/bridge.cjs" || FAIL=1
agente_vivo || FAIL=1
# Skill é OPCIONAL nesta instalação: este pacote não baixa método nenhum, então a
# pasta ~/.claude/skills pode simplesmente não existir. Se ela não existir, não há
# nada a validar e o update segue. Antes isto era um FAIL seco: quem não tinha skill
# caía em rollback a cada update, pra sempre e sem aviso — nunca mais recebia versão
# nova. Só cobramos integridade QUANDO a pasta existe como repositório de verdade.
if [ -d "$SKILLS_DIR/.git" ]; then
  ls "$SKILLS_DIR"/*/SKILL.md >/dev/null 2>&1 || FAIL=1
fi
# 2ª checagem ~18s depois: pega crash-loop TARDIO (sobe, passa o is-active de 4s, e morre
# no 1º getUpdates ou batendo no StartLimitBurst). is-failed pega o systemd desistindo.
if [ "$FAIL" -eq 0 ]; then
  sleep 18
  agente_vivo || FAIL=1
  [ "$BUS_OK" = "1" ] && systemctl --user is-failed --quiet agente && FAIL=1
fi
# Timer de auto-update sobreviveu ao push? Um .timer/.service quebrado mataria o
# auto-update da frota EM SILÊNCIO — aqui isso vira FAIL e dispara o rollback.
# Só vale onde existe systemd de usuário: sem ele, não há timer nenhum pra checar.
if [ "$BUS_OK" = "1" ] && { [ "$UNITS_CHANGED" -eq 1 ] || [ "$NEED_RELOAD" -eq 1 ]; }; then
  # 03/08 — SEGUNDA CHANCE ANTES DE REPROVAR. Achado num cliente real: máquina com timer ANTIGO
  # apontando pra caminho que a estrutura nova não usa. O update instala o unit certo, mas o
  # `enable` esbarra no estado velho ainda carregado, o timer não sobe, a validação reprova e o
  # rollback desfaz justamente o conserto do timer. Cão mordendo o rabo: o cliente fica preso
  # pra sempre, e cada tentativa termina em "tentei atualizar e não consegui agora".
  # Aqui NÃO se afrouxa o critério: se depois do reload+enable o timer continuar fora, ainda é
  # FAIL e o rollback roda igual. Só se dá ao sistema a chance de recarregar o unit novo.
  if ! systemctl --user is-active --quiet agente-update.timer; then
    say "   timer não subiu de primeira; recarregando os units e tentando de novo..."
    systemctl --user daemon-reload 2>>"$LOG" || true
    systemctl --user reset-failed agente-update.timer 2>/dev/null || true
    systemctl --user enable --now agente-update.timer 2>>"$LOG" || true
    sleep 2
  fi
  systemctl --user is-active --quiet agente-update.timer || { say "⚠️ agente-update.timer não ficou ativo após o update."; FAIL=1; }
fi
if [ "$FAIL" -eq 0 ]; then
  say "✅ UPDATE OK (skills em $NEW_SHA)."
  # Se o bridge novo veio quebrado mas o resto (skills, units) foi aplicado ok,
  # o agente segue no ar na versão antiga do bridge. Avisa o dono pra ele saber.
  if [ "$BRIDGE_BROKEN" -eq 1 ]; then
    tg "⚠️ A atualização veio com defeito no motor. Deixei o motor como estava e apliquei só o resto. Você segue no ar sem quebrar. Vou tentar de novo no próximo update."
  fi
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
