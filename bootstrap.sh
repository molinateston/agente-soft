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

# --- Codex CLI (geração de imagem grátis pela assinatura ChatGPT do dono) ---
# Instalado como root (vai pra /usr/local/bin, visível pro user 'agente').
# O LOGIN é interativo e pessoal — NÃO dá pra automatizar aqui. Só instalamos;
# a mensagem final ensina o dono a rodar o login uma única vez.
echo "→ Codex CLI (imagem grátis pela conta ChatGPT do dono)..."
if ! command -v codex >/dev/null 2>&1; then
  npm install -g @openai/codex >/dev/null 2>&1 || true
fi
if command -v codex >/dev/null 2>&1; then
  echo "   codex $(codex --version 2>/dev/null | head -1)"
else
  echo "   (aviso) codex não instalou — o agente cai em chave do Google/OpenAI pra gerar imagem." >&2
fi

echo "→ 4/4 Usuário não-root 'agente' (o serviço roda sob ele)..."
if ! id agente >/dev/null 2>&1; then
  adduser --disabled-password --gecos "" agente >/dev/null
  # SEM sudo: o runtime do agente não precisa de root. Mantém o blast radius
  # pequeno mesmo que algo execute código como 'agente'.
fi
# linger ANTES de qualquer 'systemctl --user' (o serviço roda como --user):
# garante o bus do usuário e que o serviço sobreviva a logout/reboot.
loginctl enable-linger agente >/dev/null 2>&1 || true

# =====================================================================
# O PACOTE DO AGENTE (30/07/2026 — antes disto, aqui se clonava o repositório).
#
# Por que mudou: clonar trazia o repositório inteiro com todo o histórico (7 MB pra
# 450 KB de sistema) e obrigava o repositório público a carregar o sistema todo, o
# que é justamente a superfície onde os vazamentos de julho nasceram. Agora baixa
# UM arquivo compactado, da versão que o arquivo VERSAO aponta.
#
# O comando que o dono cola NÃO mudou uma letra, e os dois endereços que a página
# aponta continuam existindo. Isto aqui é o miolo, e o dono não vê diferença.
#
# Os dois endereços aceitam ser trocados por variável de ambiente. Isso existe SÓ
# pra permitir provar a instalação limpa sem publicar nada; instalação de verdade
# nunca define essas variáveis e cai no padrão do GitHub.
# =====================================================================
BASE_AGENTE="${AGENTE_SOFT_BASE:-https://raw.githubusercontent.com/molinateston/agente-soft/main}"

echo "→ Baixando o agente (pacote pronto, sem histórico)..."
VERSAO_PUB="$(curl -fsSL "$BASE_AGENTE/VERSAO" 2>/dev/null | tr -d '[:space:]')" || VERSAO_PUB=""
if [ -z "$VERSAO_PUB" ]; then
  echo "✗ Não consegui descobrir qual é a versão do agente." >&2
  echo "  Isso quase sempre é internet ou GitHub fora do ar. Tente de novo em alguns minutos." >&2
  exit 1
fi
TMP_PKG="$(mktemp -d)"
if ! curl -fsSL -o "$TMP_PKG/agente-soft.tar.gz" "$BASE_AGENTE/pacote/$VERSAO_PUB/agente-soft.tar.gz"; then
  echo "✗ Não consegui baixar o agente na versão $VERSAO_PUB." >&2
  echo "  O arquivo da versão pode ainda não ter sido publicado. Avise o suporte." >&2
  rm -rf "$TMP_PKG"; exit 1
fi
# Confere a soma antes de descompactar: download pela metade vira agente quebrado.
# A soma é OBRIGATÓRIA de propósito. A primeira versão disto pulava a conferência
# quando o arquivo de soma faltava — ou seja, bastava a soma sumir pra ninguém mais
# conferir nada, e em silêncio. O gerador sempre produz a soma junto do pacote; se
# ela não estiver lá, a publicação está incompleta e a instalação PARA.
if ! curl -fsSL -o "$TMP_PKG/soma" "$BASE_AGENTE/pacote/$VERSAO_PUB/agente-soft.tar.gz.sha256"; then
  echo "✗ A versão $VERSAO_PUB foi publicada sem o arquivo de conferência." >&2
  echo "  Não vou instalar sem poder conferir o que baixei. Avise o suporte." >&2
  rm -rf "$TMP_PKG"; exit 1
fi
if ! ( cd "$TMP_PKG" && sha256sum -c soma >/dev/null 2>&1 ); then
  echo "✗ O arquivo baixado chegou corrompido. Rode o comando de instalação de novo." >&2
  rm -rf "$TMP_PKG"; exit 1
fi
if ! tar -tzf "$TMP_PKG/agente-soft.tar.gz" >/dev/null 2>&1; then
  echo "✗ O arquivo baixado não abre. Rode o comando de instalação de novo." >&2
  rm -rf "$TMP_PKG"; exit 1
fi
DESTINO_PKG="$(getent passwd agente | cut -d: -f6)/agente-soft"
mkdir -p "$DESTINO_PKG"
tar -xzf "$TMP_PKG/agente-soft.tar.gz" -C "$DESTINO_PKG"
rm -rf "$TMP_PKG"
chown -R agente:agente "$DESTINO_PKG"
if [ ! -s "$DESTINO_PKG/bridge.cjs" ] || [ ! -s "$DESTINO_PKG/SETUP-AGENTE.md" ]; then
  echo "✗ O agente baixou incompleto. Rode o comando de instalação de novo." >&2
  exit 1
fi
echo "   agente $VERSAO_PUB baixado em $DESTINO_PKG"

# ffmpeg — pré-req do TTS local (Piper gera wav; conversão pra mp3).
apt-get install -y -qq ffmpeg >/dev/null 2>&1 || true

# --- Piper TTS local (voz grátis pt_BR — default do agente) ---
# Instala como user 'agente' num venv próprio (usuário sem sudo).
echo "→ Voz local grátis (Piper TTS · pt_BR)..."
sudo -u agente bash -s <<'PIPER_SETUP' || echo "   (aviso) Piper opcional falhou — o agente cai em nuvem se você ativar voz." >&2
set -e
# COMPATIBILIDADE (02/ago/2026): o diretorio do agente passou a se chamar ~/.leon.
# Instalacao ANTIGA (que ja tem ~/.openclaw com os venvs de voz) continua funcionando:
# em vez de baixar tudo de novo, renomeia e deixa um link no nome velho.
if [ -d "$HOME/.openclaw" ] && [ ! -e "$HOME/.leon" ]; then
  mv "$HOME/.openclaw" "$HOME/.leon" && ln -s "$HOME/.leon" "$HOME/.openclaw"
  echo "  · diretorio migrado: ~/.openclaw -> ~/.leon (link antigo mantido)"
fi
mkdir -p "$HOME/.leon"
[ -e "$HOME/.openclaw" ] || ln -s "$HOME/.leon" "$HOME/.openclaw"
mkdir -p ~/.leon/piper-venv ~/.leon/voices/piper
if [ ! -x ~/.leon/piper-venv/bin/piper ]; then
  python3 -m venv ~/.leon/piper-venv
  ~/.leon/piper-venv/bin/pip install --quiet piper-tts >/dev/null
fi
if [ ! -s ~/.leon/voices/piper/pt_BR-faber-medium.onnx ]; then
  curl -sfL -o ~/.leon/voices/piper/pt_BR-faber-medium.onnx      https://huggingface.co/rhasspy/piper-voices/resolve/main/pt/pt_BR/faber/medium/pt_BR-faber-medium.onnx
  curl -sfL -o ~/.leon/voices/piper/pt_BR-faber-medium.onnx.json https://huggingface.co/rhasspy/piper-voices/resolve/main/pt/pt_BR/faber/medium/pt_BR-faber-medium.onnx.json
fi
PIPER_SETUP
echo "   Piper pronto (roda offline, custa 0)."

# --- Edge TTS (voz nuvem grátis Microsoft, Antonio/Francisca pt-BR — default do agente desde 22/07) ---
# Piper vira fallback. Roda no user 'agente', venv próprio, só requer conexão pra Microsoft (grátis, sem cadastro).
echo "→ Voz nuvem grátis (Edge TTS · Antonio/Francisca pt-BR)..."
sudo -u agente bash -s <<'EDGE_SETUP' || echo "   (aviso) Edge TTS opcional falhou — cai em Piper." >&2
set -e
mkdir -p ~/.leon/edgetts-venv
if [ ! -x ~/.leon/edgetts-venv/bin/edge-tts ]; then
  python3 -m venv ~/.leon/edgetts-venv
  ~/.leon/edgetts-venv/bin/pip install --quiet edge-tts >/dev/null
fi
EDGE_SETUP
echo "   Edge TTS pronto (Antonio masc / Francisca fem, escolhido por AGENT_GENDER)."


# --- Leitor de documento (markitdown) — PDF/Word/Excel/PowerPoint viram texto limpo ---
# Sem isso o agente lê o arquivo cru, gasta muito mais e entende pior planilha e apresentação.
# É OPCIONAL por desenho: se falhar, o motor cai sozinho no caminho antigo e nada quebra.
echo "→ Leitor de documento (PDF/Word/Excel/PowerPoint)..."
sudo -u agente bash -s <<'MKD_SETUP' || echo "   (aviso) leitor de documento opcional falhou — o agente segue lendo o arquivo original." >&2
set -e
mkdir -p ~/.local
if [ ! -x ~/.local/venv-markitdown/bin/markitdown ]; then
  python3 -m venv ~/.local/venv-markitdown
  ~/.local/venv-markitdown/bin/pip install --quiet markitdown mammoth openpyxl python-pptx pdfminer.six >/dev/null
fi
MKD_SETUP
echo "   Leitor de documento pronto (converte antes de ler, custa 0)."

# --- faster-whisper (transcrição local grátis, pt-BR) ---
# Usado pra transcrever mensagens de áudio que o dono manda. Roda em venv próprio
# do user 'agente', modelo puxado sob demanda no 1º áudio. Sem isso, áudio-in cai
# em fallback ou falha silenciosa.
echo "→ Transcrição local grátis (faster-whisper · pt-BR)..."
sudo -u agente bash -s <<'WHISPER_SETUP' || echo "   (aviso) faster-whisper opcional falhou — áudio-in pode não funcionar." >&2
set -e
mkdir -p ~/.leon/whisper-venv
if [ ! -x ~/.leon/whisper-venv/bin/python3 ]; then
  python3 -m venv ~/.leon/whisper-venv
fi
if ! ~/.leon/whisper-venv/bin/python3 -c "import faster_whisper" 2>/dev/null; then
  ~/.leon/whisper-venv/bin/pip install --quiet faster-whisper >/dev/null
fi
WHISPER_SETUP
echo "   faster-whisper pronto (roda offline, custa 0)."

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

O agente já foi baixado em ~/agente-soft (pacote pronto, versão em ~/agente-soft/VERSAO).
Leia e execute ~/agente-soft/SETUP-AGENTE.md com a ferramenta Read, do início ao fim.
Se por algum motivo a pasta não existir, baixe assim antes de continuar:
  V=$(curl -fsSL https://raw.githubusercontent.com/molinateston/agente-soft/main/VERSAO | tr -d '[:space:]')
  mkdir -p ~/agente-soft && curl -fsSL "https://raw.githubusercontent.com/molinateston/agente-soft/main/pacote/$V/agente-soft.tar.gz" | tar -xz -C ~/agente-soft

Vou te dar conforme você pedir: nome do agente, meu nome e o token do bot
do Telegram (@BotFather). Meu id você captura sozinho (eu mando uma mensagem
no próprio bot, sem @userinfobot).
Sobe a ponte, sobe o serviço, valida, e me confirma quando estiver no ar.
As skills do método vêm no próprio pacote (pasta skills/). Não precisa clonar nada.
Se travar, me explica em português simples.
----------8<---------- ATÉ AQUI ----------8<----------

 🖼️ IMAGEM DE GRAÇA (faça UMA vez, depois do agente estar no ar):
    Seu agente já sabe criar imagem (arte de post, criativo, capa). Se você
    tem ChatGPT PAGO, isso sai sem custo nenhum por imagem — mas você precisa
    ligar sua conta do ChatGPT nele uma única vez.
    É simples: quando o agente estiver respondendo no Telegram, mande
    "quero gerar imagem" e ele te guia. Vai aparecer um CÓDIGO de 8
    caracteres; você abre o endereço que ele mandar, entra na SUA conta
    ChatGPT, digita o código e pronto — nunca mais precisa fazer isso.
    Não tem ChatGPT pago? Sem problema: ele também gera por uma chave do
    Google (tem faixa gratuita) ou da OpenAI (aí é centavo por imagem).
    É só dizer a ele qual você prefere.

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
