#!/usr/bin/env bash
# =====================================================================
# bootstrap.sh — Agente Soft (Telegram <-> Claude Code), runtime LEAN.
#
# Instala SÓ o mínimo: Node 20, git, Claude Code CLI e python3 (+venv/pip, pré-req
# do áudio — o agente não tem sudo, então isto PRECISA entrar aqui, como root).
# NÃO instala tmux, Postgres, Caddy, pm2 nem túnel — a ponte é node puro.
#
# Roda UMA vez, numa VPS Ubuntu 22+ (como root, via Browser Terminal):
#   sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/molinateston/agente-soft/main/bootstrap.sh)"
# (esta forma — e NÃO 'curl | sudo bash' — preserva o terminal pra eu ABRIR o Claude sozinho no fim.)
#
# Ele instala tudo e ABRE o Claude pra você. Aí é só: logar na SUA conta (cola o CÓDIGO
# de login que a Anthropic mostra — NÃO o token da API) e colar o prompt-instalador.
# O Claude faz o resto lendo o SETUP-AGENTE.md.
# =====================================================================
set -euo pipefail

echo "============================================"
echo " BOOTSTRAP · AGENTE SOFT (runtime lean)"
echo "============================================"

echo ""
echo "  ⏳ Isto instala node + git + claude e pode levar de 2 a 5 minutos."
echo "     A tela vai parecer PARADA em alguns passos — isso é NORMAL."
echo "     NÃO feche o terminal. Espere até aparecer '✅ AMBIENTE PRONTO'."
echo ""

if ! grep -qi ubuntu /etc/os-release 2>/dev/null; then
  echo "✗ Este bootstrap é pra Ubuntu 22+. SO não suportado." >&2
  exit 1
fi
if [[ "${EUID}" -ne 0 ]]; then
  echo "✗ Rode como root:  sudo bash -c \"\$(curl -fsSL .../bootstrap.sh)\"" >&2
  exit 1
fi

echo "→ 1/4 Pacotes base (git, curl, ca-certificates, python3 +venv/pip p/ áudio)..."
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
# python3-venv + python3-pip: pré-requisitos do áudio (faster-whisper roda num venv
# nível-usuário). Precisam vir AQUI porque o user 'agente' não tem sudo pra instalá-los.
# dbus-user-session: pré-req do bus do 'systemctl --user'. Sem ele, em imagem Ubuntu
# minimizada toda instalação morre com 'Failed to connect to bus'.
# locales: garante locale UTF-8 (nomes com acento e transcrição PT dependem disso).
apt-get install -y -qq git curl ca-certificates python3 python3-venv python3-pip dbus-user-session locales >/dev/null
# Garante locale UTF-8 (nomes com acento e transcrição PT dependem disso).
locale-gen C.UTF-8 2>/dev/null || true
update-locale LANG=C.UTF-8 2>/dev/null || true

echo "→ 2/4 Node 20 (NodeSource)..."
if ! command -v node >/dev/null 2>&1 || [[ "$(node -v 2>/dev/null | cut -dv -f2 | cut -d. -f1)" -lt 18 ]]; then
  # Mantém um log mínimo do erro do NodeSource (não joga o stderr todo no /dev/null).
  curl -fsSL https://deb.nodesource.com/setup_20.x | bash - >/dev/null 2>/tmp/nodesource.err || true
  apt-get install -y -qq nodejs >/dev/null
fi
# Valida de verdade: o node aceito precisa ser >= 20.
if ! command -v node >/dev/null 2>&1 || [[ "$(node -v 2>/dev/null | cut -dv -f2 | cut -d. -f1)" -lt 20 ]]; then
  echo "✗ Node 20 não instalou — sua versão de Ubuntu pode não ser suportada." >&2
  [[ -s /tmp/nodesource.err ]] && echo "   Detalhe do erro (NodeSource): $(tail -n 3 /tmp/nodesource.err)" >&2
  exit 1
fi
# Garante SEMPRE um node em caminho fixo pro .service (roda como root, é trivial).
if [[ "$(command -v node)" != "/usr/bin/node" ]]; then
  ln -sf "$(command -v node)" /usr/local/bin/node
fi
echo "   node $(node -v)  ·  npm $(npm -v)"

echo "→ 3/4 Claude Code CLI..."
if ! command -v claude >/dev/null 2>&1; then
  npm install -g @anthropic-ai/claude-code >/dev/null 2>&1
fi
if ! claude --version >/dev/null 2>&1; then
  echo "✗ claude instalou mas não roda — refaça o bootstrap." >&2
  exit 1
fi
echo "   claude $(claude --version 2>/dev/null)"

echo "→ 4/4 Usuário não-root 'agente' (o serviço roda sob ele)..."
if ! id agente >/dev/null 2>&1; then
  adduser --disabled-password --gecos "" agente >/dev/null
  # SEM sudo: o runtime do agente não precisa de root. Mantém o blast radius
  # pequeno mesmo que algo execute código como 'agente'.
fi
# linger ANTES de qualquer 'systemctl --user' (o serviço roda como --user):
# garante o bus do usuário e que o serviço sobreviva a logout/reboot.
loginctl enable-linger agente >/dev/null 2>&1 || true

# ffmpeg — pré-req do TTS local (Piper gera wav; conversão pra mp3).
apt-get install -y -qq ffmpeg >/dev/null 2>&1 || true

# --- Piper TTS local (voz grátis pt_BR — default do LEON) ---
# Instala como user 'agente' num venv próprio (usuário sem sudo).
echo "→ Voz local grátis (Piper TTS · pt_BR)..."
sudo -u agente bash -s <<'PIPER_SETUP' || echo "   (aviso) Piper opcional falhou — LEON cai em nuvem se você ativar voz." >&2
set -e
mkdir -p ~/.openclaw/piper-venv ~/.openclaw/voices/piper
if [ ! -x ~/.openclaw/piper-venv/bin/piper ]; then
  python3 -m venv ~/.openclaw/piper-venv
  ~/.openclaw/piper-venv/bin/pip install --quiet piper-tts >/dev/null
fi
if [ ! -s ~/.openclaw/voices/piper/pt_BR-faber-medium.onnx ]; then
  curl -sfL -o ~/.openclaw/voices/piper/pt_BR-faber-medium.onnx      https://huggingface.co/rhasspy/piper-voices/resolve/main/pt/pt_BR/faber/medium/pt_BR-faber-medium.onnx
  curl -sfL -o ~/.openclaw/voices/piper/pt_BR-faber-medium.onnx.json https://huggingface.co/rhasspy/piper-voices/resolve/main/pt/pt_BR/faber/medium/pt_BR-faber-medium.onnx.json
fi
PIPER_SETUP
echo "   Piper pronto (roda offline, custa 0)."

# --- Edge TTS (voz nuvem grátis Microsoft, Antonio/Francisca pt-BR — default do LEON desde 22/07) ---
# Piper vira fallback. Roda no user 'agente', venv próprio, só requer conexão pra Microsoft (grátis, sem cadastro).
echo "→ Voz nuvem grátis (Edge TTS · Antonio/Francisca pt-BR)..."
sudo -u agente bash -s <<'EDGE_SETUP' || echo "   (aviso) Edge TTS opcional falhou — cai em Piper." >&2
set -e
mkdir -p ~/.openclaw/edgetts-venv
if [ ! -x ~/.openclaw/edgetts-venv/bin/edge-tts ]; then
  python3 -m venv ~/.openclaw/edgetts-venv
  ~/.openclaw/edgetts-venv/bin/pip install --quiet edge-tts >/dev/null
fi
EDGE_SETUP
echo "   Edge TTS pronto (Antonio masc / Francisca fem, escolhido por AGENT_GENDER)."

cat <<'NEXT'

============================================
 ✅ AMBIENTE PRONTO.
============================================

 Vou ABRIR O CLAUDE pra você agora — você NÃO precisa digitar mais nada
 de comando. Quando ele abrir, é só:

 1) LOGIN na SUA conta Claude (Pro/Max — a conta que paga o agente):
     • Tema (cor): setas ↑↓ + Enter.
     • Método de login: "Conta Claude / Sign in with Claude account" (setas + Enter).
       NUNCA "API key".
     • Confiar nesta pasta? → Yes / Enter.
     • Abre o LINK no navegador → loga → autoriza → a Anthropic mostra um
       CÓDIGO → cola o código aqui e Enter. (Esse código NÃO é o token da API.)

 2) Cole o PROMPT abaixo (ou copie da página /squad) e dê Enter UMA vez.
    (Colar: botão direito → Colar, ou Ctrl+Shift+V.)

----------8<---------- COPIE A PARTIR DAQUI ----------8<----------
Quero instalar meu Agente Soft (Telegram + Claude) nesta VPS.

Primeiro baixe o repo e leia o manual:
  cd ~ && git clone https://github.com/molinateston/agente-soft.git agente-soft
  Se a pasta já existir: cd ~/agente-soft && git pull -q
Depois leia e execute ~/agente-soft/SETUP-AGENTE.md com a ferramenta Read,
seguindo do início ao fim.

Vou te dar conforme você pedir: nome do agente, meu nome e o token do bot
do Telegram (@BotFather). Meu id você captura sozinho (eu mando uma mensagem
no próprio bot, sem @userinfobot).
Sobe a ponte, baixa as skills do método, sobe o serviço, valida, e me
confirma quando estiver no ar. Se travar, me explica em português simples.
----------8<---------- ATÉ AQUI ----------8<----------

 💾 O mesmo prompt também está em:
    https://raw.githubusercontent.com/molinateston/agente-soft/main/prompt-instalador.txt
============================================
NEXT

# Abre o Claude JÁ como usuário 'agente' — o dono não digita 'sudo -iu agente' nem 'claude'.
# Precisa de TTY (terminal de verdade): por isso o comando de instalação é
#   sudo bash -c "$(curl -fsSL .../bootstrap.sh)"   — NÃO  'curl ... | sudo bash'  (esse não tem TTY).
if [ -t 0 ] && [ -t 1 ]; then
  echo ""
  echo "   (abrindo o Claude em 3s — faça o login e cole o prompt acima...)"
  sleep 3
  exec sudo -iu agente claude || echo "   ✗ Não abriu sozinho. Rode na mão:  sudo -iu agente claude"
else
  echo ""
  echo "   ⚠️ Sem terminal interativo (você usou 'curl | bash'). Rode na mão:"
  echo "        sudo -iu agente claude"
  echo "      Da próxima vez use o comando que abre o Claude sozinho:"
  echo "        sudo bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/molinateston/agente-soft/main/bootstrap.sh)\""
fi
