#!/usr/bin/env bash
# =====================================================================
# update-pago.sh — atualizador da instalacao PAGA (Projeto LEON).
#
# Por que existe: a instalacao paga nao tem clone git, nao tem
# agente-update.service e nao tem sessao systemd --user. O caminho de
# update do agente gratuito nao funciona aqui. Este script e o caminho
# real: baixa o motor novo do proprio central de licencas (usando o
# e-mail da licenca que ja mora no .env do cliente), valida, faz backup,
# troca e reinicia. Sem root, sem token do GitHub.
#
# Roda como FILHO do bridge e TERMINA no restart (ultimo comando).
# Todo caminho de erro avisa o dono no Telegram: ninguem fica no escuro.
#
# Uso: update-pago.sh [chatId] [threadId]
# =====================================================================
set -uo pipefail

SELF="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="${LEON_INSTALL_DIR:-$SELF}"
ENV_FILE="$INSTALL_DIR/.env"
LOG="$INSTALL_DIR/upgrade.log"
MARK="$INSTALL_DIR/.pos-update.json"
SERVICE="${LEON_SERVICE:-leon-agente.service}"
SYSTEMCTL="${LEON_SYSTEMCTL:-/bin/systemctl}"

# Blindagem contra auto-sobrescrita: o passo da troca copia o pacote novo por
# cima da instalacao, e ESTE arquivo esta dentro dela. O bash le o script por
# posicao de byte, entao trocar o arquivo no meio da execucao faz ele continuar
# lendo do arquivo novo na posicao velha, executando pedaco errado ou comando
# cortado ao meio. Por isso rodamos sempre de uma copia intocavel.
if [ -z "${LEON_UPDATE_BLINDADO:-}" ]; then
  COPIA="$(mktemp 2>/dev/null || true)"
  if [ -n "$COPIA" ] && cat "${BASH_SOURCE[0]}" > "$COPIA" 2>/dev/null; then
    export LEON_UPDATE_BLINDADO=1
    export LEON_INSTALL_DIR="$INSTALL_DIR"
    export LEON_UPDATE_COPIA="$COPIA"
    exec bash "$COPIA" "$@"
  fi
  [ -n "$COPIA" ] && rm -f "$COPIA" 2>/dev/null
fi

CHAT_ARG="${1:-}"
THREAD_ARG="${2:-}"

say() { printf '%s %s\n' "$(date '+%F %T')" "$*" >> "$LOG" 2>/dev/null || true; }

env_get() {
  grep -E "^$1=" "$ENV_FILE" 2>/dev/null | tail -1 | cut -d= -f2- \
    | sed 's/[[:space:]]*#.*$//; s/^[[:space:]]*//; s/[[:space:]]*$//; s/^"//; s/"$//; s/^'"'"'//; s/'"'"'$//'
}

TG_TOKEN="$(env_get TELEGRAM_BOT_TOKEN)"
CHAT="${CHAT_ARG:-$(env_get OWNER_CHAT_ID)}"
EMAIL="$(env_get LEON_LICENSE_EMAIL)"
CENTRAL="$(env_get LEON_LICENSE_CENTRAL)"

avisa() {
  local msg="$1"
  say "aviso: $(printf %s "$msg" | head -c 200)"
  [ -n "$TG_TOKEN" ] && [ -n "$CHAT" ] || return 0
  curl -s --max-time 20 "https://api.telegram.org/bot${TG_TOKEN}/sendMessage" \
    --data-urlencode "chat_id=${CHAT}" \
    ${THREAD_ARG:+--data-urlencode "message_thread_id=${THREAD_ARG}"} \
    --data-urlencode "text=$msg" >/dev/null 2>&1 || true
  # Todo aviso daqui e um VEREDITO final (nao deu, ou ja estava na ultima versao).
  # O dono acabou de ser respondido, entao a espera acabou: rasga o recibo, senao o
  # vigia repete a mesma noticia daqui a alguns minutos. So rasga DEPOIS de falar:
  # se a mensagem nao sair, o recibo fica e o vigia cobre.
  rm -f "$INSTALL_DIR/.update-pending.json" 2>/dev/null || true
}

# Aviso avulso: informa sem mexer no recibo (o veredito do /atualiza continua vindo
# depois, normalmente). Usado so pro aviso de seguranca abaixo.
avisa_extra() {
  [ -n "$TG_TOKEN" ] && [ -n "$CHAT" ] || return 0
  curl -s --max-time 20 "https://api.telegram.org/bot${TG_TOKEN}/sendMessage" \
    --data-urlencode "chat_id=${CHAT}" \
    ${THREAD_ARG:+--data-urlencode "message_thread_id=${THREAD_ARG}"} \
    --data-urlencode "text=$1" >/dev/null 2>&1 || true
}

# ---------------------------------------------------------------
# Permissao de sudo antiga aberta demais (coringa no journalctl,
# fechada em 25/jul/2026). Este script roda SEM privilegio pra
# consertar isso sozinho (a propria brecha era o unico jeito de
# escalar) — entao so avisa, com o comando pronto pra rodar UMA
# vez como dono da maquina. No maximo 1x por dia, pra nao repetir
# o mesmo recado toda vez que alguem pede /atualiza.
# ---------------------------------------------------------------
SUDOERS_WARN_MARK="$INSTALL_DIR/.sudoers-aviso-ts"
if sudo -n -l 2>/dev/null | grep -qE 'journalctl[^,]*\.service[[:space:]]+\*'; then
  AGORA_TS="$(date +%s)"
  ULTIMO_TS="$(cat "$SUDOERS_WARN_MARK" 2>/dev/null || echo 0)"
  if [ $(( AGORA_TS - ULTIMO_TS )) -ge 86400 ]; then
    say "sudoers antigo detectado, avisando o dono"
    avisa_extra "⚠️ Achei uma permissão de segurança antiga nesta máquina (de antes de 25/07), pequena mas real. Eu sozinho não posso trocar, precisa rodar uma vez como administrador da máquina: curl -fsSL https://licenca.leonardomolina.com.br/reparar.sh | sudo bash"
    echo "$AGORA_TS" > "$SUDOERS_WARN_MARK" 2>/dev/null || true
  fi
fi

limpa() {
  [ -n "${STAGE:-}" ] && rm -rf "$STAGE" 2>/dev/null
  [ -n "${TARBALL:-}" ] && rm -f "$TARBALL" 2>/dev/null
  [ -n "${LEON_UPDATE_COPIA:-}" ] && rm -f "$LEON_UPDATE_COPIA" 2>/dev/null
  return 0
}
trap limpa EXIT

say "=== update pago iniciado (dir=$INSTALL_DIR) ==="

# ---------------------------------------------------------------
# 0a. habilidades do metodo (skills) — repo TRANCADO (so leitura, via
# chave propria do cliente pago). Roda SEMPRE, independente do motor ter
# mudado ou nao: senao o cliente pago nunca recebe skill nova.
# ---------------------------------------------------------------
SKILLS_DIR="${LEON_SKILLS_DIR:-$HOME/.claude/skills}"
SKILLS_KEY="$HOME/.ssh/soft-skills-deploy"
# garante a chave de leitura instalada (idempotente; a chave viaja dentro do pacote pago)
if [ -f "$SELF/keys/agente-soft-skills-deploy" ]; then
  mkdir -p "$HOME/.ssh" && chmod 700 "$HOME/.ssh"
  if [ ! -f "$SKILLS_KEY" ] || ! cmp -s "$SELF/keys/agente-soft-skills-deploy" "$SKILLS_KEY"; then
    cp "$SELF/keys/agente-soft-skills-deploy" "$SKILLS_KEY" && chmod 600 "$SKILLS_KEY"
  fi
fi
SKILLS_SSH="ssh -i $SKILLS_KEY -o IdentitiesOnly=yes -o StrictHostKeyChecking=accept-new"
SKILLS_ANTES="none"
SKILLS_DEPOIS="none"
SKILLS_MUDOU=0
if [ -d "$SKILLS_DIR/.git" ]; then
  # migra remoto antigo (https anonimo) pro novo (ssh + chave) sem exigir reclone
  CUR_URL="$(git -C "$SKILLS_DIR" remote get-url origin 2>/dev/null || echo '')"
  case "$CUR_URL" in
    https://github.com/molinateston/agente-soft-skills*|http://github.com/molinateston/agente-soft-skills*)
      git -C "$SKILLS_DIR" remote set-url origin git@github.com:molinateston/agente-soft-skills.git 2>>"$LOG" || true ;;
  esac
  SKILLS_ANTES="$(git -C "$SKILLS_DIR" rev-parse HEAD 2>/dev/null || echo none)"
  git -C "$SKILLS_DIR" symbolic-ref -q HEAD >/dev/null 2>&1 || GIT_SSH_COMMAND="$SKILLS_SSH" git -C "$SKILLS_DIR" checkout -q main 2>>"$LOG" || true
  if ! GIT_SSH_COMMAND="$SKILLS_SSH" git -C "$SKILLS_DIR" pull -q --ff-only 2>>"$LOG"; then
    say "skills: pull --ff-only falhou, ressincronizando com origin/main"
    GIT_SSH_COMMAND="$SKILLS_SSH" git -C "$SKILLS_DIR" fetch -q 2>>"$LOG" && git -C "$SKILLS_DIR" reset --hard origin/main 2>>"$LOG" \
      || say "skills: nao consegui ressincronizar (sem rede ou repo indisponivel)"
  fi
  SKILLS_DEPOIS="$(git -C "$SKILLS_DIR" rev-parse HEAD 2>/dev/null || echo none)"
elif command -v git >/dev/null 2>&1; then
  if GIT_SSH_COMMAND="$SKILLS_SSH" git clone -q git@github.com:molinateston/agente-soft-skills.git "$SKILLS_DIR" 2>>"$LOG"; then
    SKILLS_DEPOIS="$(git -C "$SKILLS_DIR" rev-parse HEAD 2>/dev/null || echo none)"
    SKILLS_ANTES="none-instalando-agora"
    say "skills: instaladas pela primeira vez"
  else
    say "skills: clone inicial falhou (sem rede ou chave ausente?)"
  fi
fi

# 03/08 — AS SKILLS VIAJAM NO PACOTE E MORRIAM NA PASTA DE INSTALAÇÃO.
# O pacote pago traz skills/ (769 arquivos), mas nenhuma linha copiava isso pra ~/.claude/skills,
# que é de onde o agente lê. O caminho antigo dependia de `git clone` com chave SSH — e a chave
# parou de viajar no pacote (o repo deixou de versionar keys/ em 02/08, por segurança). Resultado:
# cliente pago com o método congelado no dia da instalação, sem erro visível.
# Este bloco não depende de chave nem de rede: as skills já chegaram dentro do pacote.
# Só roda quando NÃO há .git — quem tem clone continua sendo servido pelo pull acima, intocado.
if [ -d "$SELF/skills" ] && [ ! -d "$SKILLS_DIR/.git" ]; then
  mkdir -p "$SKILLS_DIR"
  if cp -a "$SELF/skills/." "$SKILLS_DIR/" 2>>"$LOG"; then
    QUANTAS="$(find "$SKILLS_DIR" -maxdepth 2 -name SKILL.md 2>/dev/null | wc -l)"
    say "skills: $QUANTAS habilidades do método sincronizadas do pacote pra $SKILLS_DIR"
    SKILLS_DEPOIS="pacote-$(date +%Y%m%d%H%M)"
  else
    say "skills: NAO consegui copiar do pacote pra $SKILLS_DIR (veja o log). O motor atualizou; o método nao."
  fi
fi

[ "$SKILLS_ANTES" != "$SKILLS_DEPOIS" ] && SKILLS_MUDOU=1

# ---------------------------------------------------------------
# 0b. Codex CLI (imagem gratis pela assinatura ChatGPT do dono).
# Roda SEMPRE, como a secao 0a: quem instalou antes do codex entrar
# no bootstrap so alcanca a capacidade nova por aqui. Sem sudo, entao
# instala no prefixo do proprio usuario (ja esta no PATH do servico).
# O LOGIN nao e feito aqui (e interativo e pessoal): quem conduz o dono
# e o proprio agente no chat.
# ---------------------------------------------------------------
if ! command -v codex >/dev/null 2>&1 && [ ! -x "$HOME/.npm-global/bin/codex" ]; then
  if command -v npm >/dev/null 2>&1; then
    say "codex: instalando (imagem gratis pela conta ChatGPT do dono)"
    if timeout 300 npm install -g --prefix "$HOME/.npm-global" @openai/codex >>"$LOG" 2>&1; then
      say "codex: instalado (falta so o dono fazer o login uma vez)"
    else
      say "codex: instalacao falhou agora, tento no proximo update"
    fi
  fi
fi

# ---------------------------------------------------------------
# 0. pre-requisitos
# ---------------------------------------------------------------
if [ ! -f "$ENV_FILE" ]; then
  avisa "⚠️ Não consegui atualizar: não achei minhas configurações no servidor. Continuo no ar na versão de antes, nada se perdeu."
  exit 1
fi
if [ -z "$EMAIL" ] || [ -z "$CENTRAL" ]; then
  avisa "⚠️ Não consegui atualizar: falta o e-mail da licença na minha configuração. Continuo no ar na versão de antes, nada se perdeu. Fala com o suporte: https://wa.me/5511961562217"
  exit 1
fi
command -v curl >/dev/null 2>&1 || { avisa "⚠️ Não consegui atualizar: falta o programa de download nesta máquina. Continuo no ar na versão de antes."; exit 1; }
command -v tar  >/dev/null 2>&1 || { avisa "⚠️ Não consegui atualizar: falta o programa de descompactação nesta máquina. Continuo no ar na versão de antes."; exit 1; }

# ---------------------------------------------------------------
# 1. baixa o motor novo do central (valida licenca no mesmo passo)
# ---------------------------------------------------------------
EMAIL_ENC="$(printf %s "$EMAIL" | python3 -c "import urllib.parse,sys; print(urllib.parse.quote(sys.stdin.read().strip()))" 2>/dev/null || printf %s "$EMAIL")"
TARBALL="$(mktemp --suffix=.tar.gz 2>/dev/null || mktemp)"
say "baixando de $CENTRAL/download"
HTTP="$(curl -sSL --max-time 180 -w '%{http_code}' -o "$TARBALL" "$CENTRAL/download?email=$EMAIL_ENC" 2>>"$LOG" || echo "000")"
say "http=$HTTP tamanho=$(wc -c < "$TARBALL" 2>/dev/null || echo 0)"

case "$HTTP" in
  200) : ;;
  404)
    avisa "⚠️ Não consegui atualizar: o servidor não reconheceu a licença deste e-mail. Continuo no ar na versão de antes, nada se perdeu. Fala com o suporte: https://wa.me/5511961562217"
    exit 1 ;;
  403)
    avisa "⚠️ Não consegui atualizar: a licença está bloqueada. Continuo no ar na versão de antes, nada se perdeu. Fala com o suporte: https://wa.me/5511961562217"
    exit 1 ;;
  000)
    avisa "⚠️ Não consegui atualizar: a internet falhou no meio do download. Continuo no ar na versão de antes, nada se perdeu. Manda /atualiza de novo daqui a pouco."
    exit 1 ;;
  *)
    avisa "⚠️ Não consegui atualizar: o servidor respondeu de um jeito que eu não esperava. Continuo no ar na versão de antes, nada se perdeu. Manda /atualiza de novo daqui a pouco."
    exit 1 ;;
esac

if [ ! -s "$TARBALL" ]; then
  avisa "⚠️ Não consegui atualizar: o download veio vazio. Continuo no ar na versão de antes, nada se perdeu. Manda /atualiza de novo daqui a pouco."
  exit 1
fi

# ---------------------------------------------------------------
# 2. extrai num canto separado (nao encosta na instalacao ainda)
# ---------------------------------------------------------------
STAGE="$(mktemp -d)"
if ! tar -xzf "$TARBALL" -C "$STAGE" 2>>"$LOG"; then
  avisa "⚠️ Não consegui atualizar: o pacote veio corrompido. Continuo no ar na versão de antes, nada se perdeu. Manda /atualiza de novo daqui a pouco."
  exit 1
fi
INNER="$(find "$STAGE" -maxdepth 1 -mindepth 1 -type d | head -1)"
if [ -z "$INNER" ] || [ ! -f "$INNER/bridge.cjs" ]; then
  avisa "⚠️ Não consegui atualizar: o pacote veio sem o meu motor dentro. Continuo no ar na versão de antes, nada se perdeu."
  exit 1
fi

# ---------------------------------------------------------------
# 3. prova que o motor novo ao menos e valido ANTES de instalar
# ---------------------------------------------------------------
if command -v node >/dev/null 2>&1; then
  if ! node --check "$INNER/bridge.cjs" 2>>"$LOG"; then
    avisa "⚠️ Não consegui atualizar: a versão nova veio com defeito e eu barrei antes de instalar. Continuo no ar na versão de antes, nada se perdeu. Já fui avisado, tenta de novo mais tarde."
    exit 1
  fi
fi

# ---------------------------------------------------------------
# 4. ja esta na ultima versao?
# ---------------------------------------------------------------
IGUAL=1
while IFS= read -r rel; do
  [ -n "$rel" ] || continue
  if ! cmp -s "$INNER/$rel" "$INSTALL_DIR/$rel"; then IGUAL=0; break; fi
done <<EOF
$(cd "$INNER" && find . -type f | sed 's|^\./||')
EOF

if [ "$IGUAL" = "1" ]; then
  say "motor ja na ultima versao (skills mudou=$SKILLS_MUDOU)"
  if [ "$SKILLS_MUDOU" = "1" ]; then
    avisa "✅ Meu motor já estava atualizado, mas atualizei as habilidades do método (novos materiais e técnicas). Não precisei reiniciar."
  else
    avisa "✅ Conferi: já estou na última versão. Não mudei nada e não precisei reiniciar."
  fi
  exit 0
fi

# ---------------------------------------------------------------
# 5. backup da instalacao atual (guarda os 2 ultimos)
# ---------------------------------------------------------------
BACKUP="${INSTALL_DIR}.bak-$(date +%Y%m%d-%H%M%S)"
if ! cp -a "$INSTALL_DIR" "$BACKUP" 2>>"$LOG"; then
  avisa "⚠️ Não consegui atualizar: falhei em guardar a cópia de segurança antes de trocar, então nem comecei. Continuo no ar na versão de antes, nada se perdeu."
  rm -rf "$BACKUP" 2>/dev/null
  exit 1
fi
say "backup em $BACKUP"
# shellcheck disable=SC2012
ls -1dt "${INSTALL_DIR}".bak-* 2>/dev/null | tail -n +3 | while IFS= read -r velho; do rm -rf "$velho" 2>/dev/null; done

# ---------------------------------------------------------------
# 6. troca (o pacote nao traz .env/sessions/topics: estado sobrevive)
# ---------------------------------------------------------------
if ! cp -a "$INNER"/. "$INSTALL_DIR"/ 2>>"$LOG"; then
  say "copia falhou, restaurando"
  cp -a "$BACKUP"/. "$INSTALL_DIR"/ 2>>"$LOG"
  avisa "⚠️ Não consegui atualizar: falhou na hora de trocar os arquivos e eu voltei tudo como estava. Continuo no ar na versão de antes, nada se perdeu."
  exit 1
fi
chmod +x "$INSTALL_DIR"/*.sh 2>/dev/null
chmod +x "$INSTALL_DIR"/scripts/*.sh 2>/dev/null
say "troca concluida"


# ---------------------------------------------------------------
# 6b. leitor de documento (markitdown) — PDF/Word/Excel/PowerPoint viram texto limpo
#     Instala pra quem ja era cliente antes dele existir. Idempotente e silencioso:
#     se ja esta la nao faz nada; se falhar, o motor cai sozinho no caminho antigo.
# ---------------------------------------------------------------
if [ ! -x "$HOME/.local/venv-markitdown/bin/markitdown" ]; then
  ( mkdir -p "$HOME/.local" \
    && python3 -m venv "$HOME/.local/venv-markitdown" \
    && "$HOME/.local/venv-markitdown/bin/pip" install --quiet markitdown mammoth openpyxl python-pptx pdfminer.six ) >/dev/null 2>&1 \
    && say "leitor de documento instalado" || say "leitor de documento nao instalou (segue no caminho antigo)"
fi

# ---------------------------------------------------------------
# 7. rede de seguranca: verificador periodico (sem root, cron do user)
#    idempotente: nunca duplica a linha
# ---------------------------------------------------------------
agendar() {  # $1 = script, $2 = periodicidade cron, $3 = rotulo
  local alvo="$1" quando="$2" rot="$3" cur
  [ -f "$alvo" ] || { say "$rot ausente, nao agendei"; return 0; }
  command -v crontab >/dev/null 2>&1 || { say "sem crontab, nao agendei $rot"; return 0; }
  cur="$(crontab -l 2>/dev/null || true)"
  printf %s "$cur" | grep -qF "$alvo" && return 0
  { [ -n "$cur" ] && printf '%s\n' "$cur"; printf '%s %s >/dev/null 2>&1\n' "$quando" "$alvo"; } \
    | crontab - 2>>"$LOG" && say "$rot agendado" || say "$rot falhou ao agendar"
}
# guard: se o motor novo nao subir, restaura o backup (de 5 em 5 min basta).
agendar "$INSTALL_DIR/scripts/update-guard.sh"   "*/5 * * * *" "verificador periodico"
# verdict: garante que quem pediu /atualiza SEMPRE recebe resposta. De minuto em
# minuto, porque a espera do dono e curta. Sem ele o recibo fica orfao.
agendar "$INSTALL_DIR/scripts/update-verdict.sh" "* * * * *"   "vigia do veredito"
# report diario de tokens: a sala Tokens nasce junto com o agente. O worker cria a
# sala no Telegram sozinho na primeira vez que consegue falar com o grupo.
agendar "$INSTALL_DIR/scripts/report-tokens.sh" "30 7 * * *"   "report diario de tokens"

# ---------------------------------------------------------------
# 8. marcador: quem sauda e o proprio motor ao subir
# ---------------------------------------------------------------
printf '{"ts":%s,"chatId":"%s","threadId":"%s","backup":"%s"}\n' \
  "$(date +%s)" "${CHAT:-}" "${THREAD_ARG:-}" "$BACKUP" > "$MARK" 2>/dev/null || true

# ---------------------------------------------------------------
# 9. reinicia (ultimo comando: este script morre aqui, e tudo bem)
# ---------------------------------------------------------------
# Tenta o caminho conhecido; se ele nao existir nesta maquina, PERGUNTA ao detector
# como este agente roda e usa o que houver (servico de sistema, servico de usuario,
# gerenciador de processos ou relancamento comum). Antes, quando o caminho conhecido
# nao servia, nao se reiniciava nada e ninguem ficava sabendo.
say "reiniciando $SERVICE"
if sudo -n "$SYSTEMCTL" restart "$SERVICE" 2>>"$LOG"; then exit 0; fi

DETECTOR="$INSTALL_DIR/scripts/runtime-detect.sh"
if [ -x "$DETECTOR" ]; then
  CMD="$("$DETECTOR" --dir "$INSTALL_DIR" --print 2>/dev/null | sed -n 's/.*"reiniciar"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | head -1)"
  if [ -n "$CMD" ]; then
    say "caminho conhecido falhou; reiniciando pelo jeito detectado: $CMD"
    if bash -lc "$CMD" >>"$LOG" 2>&1; then exit 0; fi
  fi
fi

rm -f "$MARK" 2>/dev/null
avisa "⚠️ Instalei a versão nova mas não consegui me reiniciar sozinho. Nada se perdeu. Reinicia a máquina do painel da Hostinger, ou fala com o suporte: https://wa.me/5511961562217"
exit 1
