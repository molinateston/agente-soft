#!/usr/bin/env bash
# =====================================================================
# update-verdict.sh — o VIGIA do /atualiza. Garante que o dono SEMPRE
# recebe um veredito, mesmo quando a atualizacao morre no meio.
#
# POR QUE EXISTE (o defeito de nascenca que ele fecha):
#   Todo caminho que prometia "✅ No ar!" rodava DENTRO da coisa que
#   estava sendo substituida (o proprio motor, ou um despertador armado
#   pelo processo prestes a ser morto). Quando ela morria, a promessa
#   morria junto e o dono ficava exatamente no escuro que a mensagem
#   dizia que ele nao ficaria. Caso real: /atualiza as 17h24, silencio
#   pra sempre.
#
# O DESENHO:
#   1. RECIBO — antes de disparar o update, o motor grava
#      .update-pending.json (quem pediu, onde, quando, assinatura do
#      motor de antes, prazos). Enquanto o recibo existir, ALGUEM esta
#      esperando resposta. E a unica fonte de verdade disso.
#   2. VIGIA — este script, no cron de MINUTO EM MINUTO, FORA do motor
#      e fora do update. Nao depende do bot estar de pe: fala direto
#      com o Telegram por curl, lendo o token do .env.
#   3. Quando o motor novo sobe e ve o recibo, ele mesmo sauda e apaga
#      o recibo — o vigia fica calado. Se ninguem saudou, o vigia
#      entrega o veredito honesto e apaga o recibo.
#
# Idempotente: trava de diretorio + o recibo so e apagado DEPOIS da
# mensagem sair. Uma mensagem por recibo, nunca duas.
#
# Uso: update-verdict.sh   (sem argumentos; o recibo carrega tudo)
# =====================================================================
set -uo pipefail

SUPORTE="https://wa.me/5511961562217"

# --- onde mora o motor -----------------------------------------------
# Duas instalacoes, dois lugares. Na gratuita o motor mora em ~/lean-bridge
# e este script vem da copia do repositorio (~/agente-soft). Na paga tudo
# mora no mesmo diretorio. Descobre em vez de cravar.
SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PAI_DIR="$(dirname "$SELF_DIR")"
if   [ -n "${LEON_BRIDGE_DIR:-}" ];    then BRIDGE_DIR="$LEON_BRIDGE_DIR"
elif [ -f "$PAI_DIR/.env" ] && [ -f "$PAI_DIR/bridge.cjs" ]; then BRIDGE_DIR="$PAI_DIR"
elif [ -f "$HOME/lean-bridge/.env" ];  then BRIDGE_DIR="$HOME/lean-bridge"
elif [ -f "$HOME/socio-ia/.env" ];     then BRIDGE_DIR="$HOME/socio-ia"
else BRIDGE_DIR="$HOME/lean-bridge"; fi

RECIBO="$BRIDGE_DIR/.update-pending.json"
[ -f "$RECIBO" ] || exit 0                      # ninguem esperando = nada a fazer

ENV_FILE="$BRIDGE_DIR/.env"
LOG="$BRIDGE_DIR/upgrade.log"
ALIVE="$BRIDGE_DIR/.alive"
BRIDGE="$BRIDGE_DIR/bridge.cjs"
TRAVA="$BRIDGE_DIR/.update-verdict.lock"

# --- trava: uma execucao por vez (mkdir e atomico) -------------------
mkdir "$TRAVA" 2>/dev/null || exit 0
trap 'rmdir "$TRAVA" 2>/dev/null || true' EXIT

campo() {  # campo <nome> — le string ou numero do recibo, sem depender de jq
  sed -n "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"\{0,1\}\([^,\"}]*\)\"\{0,1\}.*/\1/p" "$RECIBO" 2>/dev/null | head -1
}

CHAT="$(campo chatId)"
THREAD="$(campo threadId)"
PEDIDO="$(campo pedidoEm)"
SIG_ANTES="$(campo assinaturaAntes)"
CURTO="$(campo prazoCurto)"
LONGO="$(campo prazoLongo)"
[ "$THREAD" = "null" ] && THREAD=""

AGORA_MS="$(( $(date +%s) * 1000 ))"

# Recibo corrompido ou sem prazos: usa a idade do arquivo como relogio.
if [ -z "$CURTO" ] || [ -z "$LONGO" ]; then
  MT="$(stat -c %Y "$RECIBO" 2>/dev/null || echo 0)"
  CURTO=$(( MT * 1000 + 90000 ))
  LONGO=$(( MT * 1000 + 360000 ))
fi

# Ainda dentro do prazo curto: da tempo do caminho feliz acontecer sozinho.
[ "$AGORA_MS" -ge "$CURTO" ] || exit 0

env_get() {
  grep -E "^$1=" "$ENV_FILE" 2>/dev/null | tail -1 | cut -d= -f2- \
    | sed 's/[[:space:]]*#.*$//; s/^[[:space:]]*//; s/[[:space:]]*$//; s/^"//; s/"$//; s/^'"'"'//; s/'"'"'$//'
}
TOKEN="$(env_get TELEGRAM_BOT_TOKEN)"
[ -n "$CHAT" ] || CHAT="$(env_get OWNER_CHAT_ID)"

fala() {
  [ -n "$TOKEN" ] && [ -n "$CHAT" ] || return 0
  curl -s --max-time 20 "https://api.telegram.org/bot${TOKEN}/sendMessage" \
    --data-urlencode "chat_id=${CHAT}" \
    ${THREAD:+--data-urlencode "message_thread_id=${THREAD}"} \
    --data-urlencode "text=$1" >/dev/null 2>&1 || true
}
anota() { printf '%s [vigia] %s\n' "$(date '+%F %T')" "$*" >> "$LOG" 2>/dev/null || true; }

# Fecha o ciclo: apaga o recibo E os marcadores antigos de saudacao, pra que
# ninguem mais saude depois de nos (senao o dono recebe a mesma coisa duas vezes).
encerra() {
  rm -f "$RECIBO" "$BRIDGE_DIR/.pos-update.json" "$BRIDGE_DIR/.greet" 2>/dev/null || true
}

# --- estado real da maquina ------------------------------------------
SIG_AGORA="$(md5sum "$BRIDGE" 2>/dev/null | cut -d' ' -f1)"
TROCOU=0
[ -n "$SIG_ANTES" ] && [ -n "$SIG_AGORA" ] && [ "$SIG_ANTES" != "$SIG_AGORA" ] && TROCOU=1

# Vivo = o motor tocou o batimento nos ultimos 2 minutos. Vale nas duas
# instalacoes (nome de servico muda, o batimento nao).
VIVO=0
if [ -f "$ALIVE" ]; then
  IDADE=$(( $(date +%s) - $(stat -c %Y "$ALIVE" 2>/dev/null || echo 0) ))
  [ "$IDADE" -le 120 ] && VIVO=1
fi

# --- VEREDITO 1: deu certo -------------------------------------------
if [ "$TROCOU" -eq 1 ] && [ "$VIVO" -eq 1 ]; then
  anota "sucesso (assinatura mudou e o motor esta batendo)"
  fala "✅ No ar! Já estou na última versão. Nada da nossa conversa se perdeu."
  encerra
  exit 0
fi

# Antes do prazo longo, o resto ainda pode se resolver sozinho. Espera.
[ "$AGORA_MS" -ge "$LONGO" ] || exit 0

# --- VEREDITO 2: instalou mas nao subiu ------------------------------
if [ "$TROCOU" -eq 1 ] && [ "$VIVO" -eq 0 ]; then
  GUARD="$SELF_DIR/update-guard.sh"
  [ -x "$GUARD" ] || GUARD="$BRIDGE_DIR/scripts/update-guard.sh"
  anota "versao nova instalada mas o motor nao subiu"
  if [ -x "$GUARD" ]; then
    fala "⚠️ A versão nova não subiu direito. Já estou voltando sozinho pra versão de antes — em poucos minutos volto a responder aqui e nada se perdeu. Se eu não voltar, me chama no suporte: $SUPORTE"
    encerra
    LEON_GUARD_LIMITE=1 "$GUARD" >/dev/null 2>&1 &
  else
    fala "⚠️ A versão nova não subiu direito e eu não consigo voltar sozinho daqui. Nada da nossa conversa se perdeu. Chama o suporte pra me levantar: $SUPORTE"
    encerra
  fi
  exit 0
fi

# --- VEREDITO 3: nao mudou nada porque ja estava atual ----------------
# Reconhece as duas frases que as duas instalacoes escrevem no proprio log,
# e so aceita se o log foi escrito DEPOIS do pedido (senao e sobra antiga).
LOG_RECENTE=0
if [ -f "$LOG" ]; then
  LOG_MT_MS=$(( $(stat -c %Y "$LOG" 2>/dev/null || echo 0) * 1000 ))
  [ -n "$PEDIDO" ] && [ "$LOG_MT_MS" -ge "$PEDIDO" ] && LOG_RECENTE=1
fi
JA_ATUAL=0
if [ "$LOG_RECENTE" -eq 1 ] && tail -20 "$LOG" 2>/dev/null | grep -qiE 'ltima vers'; then
  JA_ATUAL=1
fi

if [ "$VIVO" -eq 1 ] && [ "$JA_ATUAL" -eq 1 ]; then
  anota "nada a trocar: ja estava na ultima versao"
  fala "✅ Conferi: você já estava na última versão, não precisou trocar nada. Segui no ar o tempo todo."
  encerra
  exit 0
fi

# --- VEREDITO 4: falhou ----------------------------------------------
# Pega uma pista real do log e traduz pra linguagem de gente. Sem caminho de
# arquivo, sem jargao: o dono precisa saber O QUE fazer, nao onde eu errei.
PISTA=""
if [ "$LOG_RECENTE" -eq 1 ]; then
  BRUTA="$(grep -E '✗|‼️|⚠️|erro|falh|FALH' "$LOG" 2>/dev/null | tail -1)"
  case "$BRUTA" in
    *spa[çc]o*|*disco*|*space*)        PISTA="Faltou espaço em disco na máquina." ;;
    *licen[çc]a*|*403*|*401*)          PISTA="Minha licença não foi reconhecida na hora de baixar a versão nova." ;;
    *rede*|*curl*|*download*|*000*|*timeout*|*conex*) PISTA="A internet da máquina falhou na hora de baixar a versão nova." ;;
    *sintaxe*|*node*)                  PISTA="A versão nova veio com defeito e eu barrei a troca de propósito." ;;
    *snapshot*|*backup*|*c[óo]pia*)    PISTA="Não consegui guardar uma cópia de segurança, então nem comecei a troca." ;;
    *HALT*|*suspenso*)                 PISTA="A atualização está suspensa de propósito pelo suporte." ;;
    "")                                PISTA="" ;;
    *)                                 PISTA="Alguma coisa no meio do caminho não fechou." ;;
  esac
fi
[ -n "$PISTA" ] || PISTA="A atualização não chegou a acontecer."

anota "falhou (assinatura igual, sem sinal de conclusao)"
fala "⚠️ A atualização não completou. $PISTA

Boa notícia: continuo no ar na versão de antes e nada da nossa conversa se perdeu. Pode falar comigo normalmente. Tenta /atualiza de novo daqui a pouco; se repetir, chama o suporte: $SUPORTE"
encerra
exit 0
