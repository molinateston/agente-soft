#!/usr/bin/env bash
# =====================================================================
# bootstrap.sh — Agente Soft (Telegram <-> Claude Code), runtime LEAN.
#
# Instala SÓ o mínimo: Node 20, git e o Claude Code CLI.
# NÃO instala tmux, Postgres, Caddy, pm2 nem túnel — a ponte é node puro.
#
# Roda UMA vez, numa VPS Ubuntu 22+ (como root, via Browser Terminal):
#   curl -fsSL https://agente-soft.pages.dev/bootstrap.sh | sudo bash
#
# Depois dele: você roda `claude`, loga na SUA conta (sem colar token),
# e cola o prompt-instalador. O Claude faz o resto lendo o SETUP-AGENTE.md.
# =====================================================================
set -euo pipefail

echo "============================================"
echo " BOOTSTRAP · AGENTE SOFT (runtime lean)"
echo "============================================"

if ! grep -qi ubuntu /etc/os-release 2>/dev/null; then
  echo "✗ Este bootstrap é pra Ubuntu 22+. SO não suportado." >&2
  exit 1
fi
if [[ "${EUID}" -ne 0 ]]; then
  echo "✗ Rode como root:  curl -fsSL .../bootstrap.sh | sudo bash" >&2
  exit 1
fi

echo "→ 1/4 Pacotes base (git, curl, ca-certificates)..."
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
apt-get install -y -qq git curl ca-certificates >/dev/null

echo "→ 2/4 Node 20 (NodeSource)..."
if ! command -v node >/dev/null 2>&1 || [[ "$(node -v 2>/dev/null | cut -dv -f2 | cut -d. -f1)" -lt 18 ]]; then
  curl -fsSL https://deb.nodesource.com/setup_20.x | bash - >/dev/null 2>&1
  apt-get install -y -qq nodejs >/dev/null
fi
echo "   node $(node -v)  ·  npm $(npm -v)"

echo "→ 3/4 Claude Code CLI..."
if ! command -v claude >/dev/null 2>&1; then
  npm install -g @anthropic-ai/claude-code >/dev/null 2>&1
fi
echo "   claude $(claude --version 2>/dev/null || echo '(instalado)')"

echo "→ 4/4 Usuário não-root 'agente' (o serviço roda sob ele)..."
if ! id agente >/dev/null 2>&1; then
  adduser --disabled-password --gecos "" agente >/dev/null
  # SEM sudo: o runtime do agente não precisa de root. Mantém o blast radius
  # pequeno mesmo que algo execute código como 'agente'.
fi
# linger ANTES de qualquer 'systemctl --user' (o serviço roda como --user):
# garante o bus do usuário e que o serviço sobreviva a logout/reboot.
loginctl enable-linger agente >/dev/null 2>&1 || true

cat <<'NEXT'

============================================
 ✅ AMBIENTE PRONTO.

 Próximos 2 passos (faça como usuário 'agente'):

   sudo -iu agente
   claude

 1) O `claude` mostra um LINK → abra no navegador →
    logue na SUA conta Claude (Pro/Max) → autorize.
    (Sem colar token. É a conta que paga o agente.)

 2) Ainda dentro do `claude`, cole EXATAMENTE este
    PROMPT-INSTALADOR (já está pronto abaixo):

----------8<---------- COPIE A PARTIR DAQUI ----------8<----------
Quero instalar meu Agente Soft (Telegram + Claude) nesta VPS.

Primeiro baixe o repo e leia o manual:
  cd ~ && git clone https://github.com/molinateston/agente-soft.git agente-soft
Depois leia e execute ~/agente-soft/SETUP-AGENTE.md com a ferramenta Read,
seguindo do início ao fim.

Vou te dar conforme você pedir: nome do agente, meu nome, token do bot
do Telegram (@BotFather) e meu user_id (@userinfobot).
Sobe a ponte, baixa as skills do método, sobe o serviço, valida, e me
confirma quando estiver no ar. Se travar, me explica em português simples.
----------8<---------- ATÉ AQUI ----------8<----------
============================================
NEXT
