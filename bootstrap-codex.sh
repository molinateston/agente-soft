#!/usr/bin/env bash
# =====================================================================
# bootstrap-codex.sh — Agente Soft rodando 100% no CODEX (conta ChatGPT).
#
# Pra quem NÃO tem conta Claude: o agente inteiro roda no Codex CLI, na
# assinatura ChatGPT do dono. Instala, configura e sobe TUDO sozinho —
# a única coisa que o dono faz no fim é logar na conta ChatGPT dele.
#
# Roda UMA vez, numa VPS Ubuntu 22+ (como root, via Browser Terminal):
#   sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/molinateston/agente-soft/main/bootstrap-codex.sh)"
# =====================================================================
set -euo pipefail

echo "============================================"
echo " BOOTSTRAP · AGENTE SOFT (motor CODEX)"
echo "============================================"
echo ""
echo "  ⏳ Isto instala node + codex e pode levar de 2 a 5 minutos."
echo "     A tela vai parecer PARADA em alguns passos — isso é NORMAL."
echo ""

if ! grep -qi ubuntu /etc/os-release 2>/dev/null; then
  echo "✗ Este instalador é pra Ubuntu 22+. Sistema não suportado." >&2; exit 1
fi
if [[ "${EUID}" -ne 0 ]]; then
  echo "✗ Rode como root:  sudo bash -c \"\$(curl -fsSL .../bootstrap-codex.sh)\"" >&2; exit 1
fi
if [ ! -t 0 ] || [ ! -t 1 ]; then
  echo "✗ Sem terminal interativo (você usou 'curl | bash'). Use a forma:" >&2
  echo "    sudo bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/molinateston/agente-soft/main/bootstrap-codex.sh)\"" >&2
  exit 1
fi

echo "→ 1/5 Pacotes base (git, curl, python3, locale UTF-8)..."
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
apt-get install -y -qq git curl ca-certificates python3 python3-venv python3-pip dbus-user-session locales >/dev/null
locale-gen C.UTF-8 2>/dev/null || true
update-locale LANG=C.UTF-8 2>/dev/null || true

echo "→ 2/5 Node 20..."
if ! command -v node >/dev/null 2>&1 || [[ "$(node -v 2>/dev/null | cut -dv -f2 | cut -d. -f1)" -lt 18 ]]; then
  curl -fsSL https://deb.nodesource.com/setup_20.x | bash - >/dev/null 2>/tmp/nodesource.err || true
  apt-get install -y -qq nodejs >/dev/null
fi
if ! command -v node >/dev/null 2>&1 || [[ "$(node -v 2>/dev/null | cut -dv -f2 | cut -d. -f1)" -lt 20 ]]; then
  echo "✗ Node 20 não instalou — sua versão de Ubuntu pode não ser suportada." >&2; exit 1
fi
[[ "$(command -v node)" != "/usr/bin/node" ]] && ln -sf "$(command -v node)" /usr/local/bin/node
echo "   node $(node -v)"

echo "→ 3/5 Codex CLI (o motor desta instalação — OBRIGATÓRIO)..."
if ! command -v codex >/dev/null 2>&1; then
  npm install -g @openai/codex >/dev/null 2>&1 || true
fi
if ! command -v codex >/dev/null 2>&1; then
  echo "✗ O Codex não instalou. Sem ele este agente não roda. Tente de novo, ou avise o suporte." >&2; exit 1
fi
echo "   codex $(codex --version 2>/dev/null | head -1)"

echo "→ 4/5 Usuário 'agente' + pacote..."
if ! id agente >/dev/null 2>&1; then
  adduser --disabled-password --gecos "" agente >/dev/null
fi
loginctl enable-linger agente >/dev/null 2>&1 || true

BASE_AGENTE="${AGENTE_SOFT_BASE:-https://raw.githubusercontent.com/molinateston/agente-soft/main}"
VERSAO_PUB="$(curl -fsSL "$BASE_AGENTE/VERSAO" 2>/dev/null | tr -d '[:space:]')" || VERSAO_PUB=""
[ -z "$VERSAO_PUB" ] && { echo "✗ Não achei a versão do agente (internet/GitHub fora?). Tente de novo." >&2; exit 1; }
TMP_PKG="$(mktemp -d)"
curl -fsSL -o "$TMP_PKG/agente-soft.tar.gz" "$BASE_AGENTE/pacote/$VERSAO_PUB/agente-soft.tar.gz" || { echo "✗ Download falhou." >&2; exit 1; }
curl -fsSL -o "$TMP_PKG/soma" "$BASE_AGENTE/pacote/$VERSAO_PUB/agente-soft.tar.gz.sha256" || { echo "✗ Versão publicada sem conferência — não instalo. Avise o suporte." >&2; exit 1; }
( cd "$TMP_PKG" && sha256sum -c soma >/dev/null 2>&1 ) || { echo "✗ Arquivo corrompido no download. Rode de novo." >&2; exit 1; }
HOME_AGENTE="$(getent passwd agente | cut -d: -f6)"
mkdir -p "$HOME_AGENTE/agente-soft" "$HOME_AGENTE/lean-bridge"
tar -xzf "$TMP_PKG/agente-soft.tar.gz" -C "$HOME_AGENTE/agente-soft"
cp -a "$HOME_AGENTE/agente-soft/." "$HOME_AGENTE/lean-bridge/"
rm -rf "$TMP_PKG"
chown -R agente:agente "$HOME_AGENTE/agente-soft" "$HOME_AGENTE/lean-bridge"
[ -s "$HOME_AGENTE/lean-bridge/bridge.cjs" ] || { echo "✗ Pacote baixou incompleto. Rode de novo." >&2; exit 1; }
echo "   agente $VERSAO_PUB pronto em $HOME_AGENTE/lean-bridge"

# Voz e leitura de documento (opcionais — iguais à instalação normal; falhar não trava nada)
apt-get install -y -qq ffmpeg >/dev/null 2>&1 || true
sudo -u agente bash -s <<'EXTRAS' || echo "   (aviso) extras de voz falharam — o agente funciona igual, só sem voz local." >&2
set -e
mkdir -p ~/.leon/edgetts-venv ~/.leon/whisper-venv
if [ ! -x ~/.leon/edgetts-venv/bin/edge-tts ]; then
  python3 -m venv ~/.leon/edgetts-venv
  ~/.leon/edgetts-venv/bin/pip install --quiet edge-tts >/dev/null
fi
if ! ~/.leon/whisper-venv/bin/python3 -c "import faster_whisper" 2>/dev/null; then
  python3 -m venv ~/.leon/whisper-venv 2>/dev/null || true
  ~/.leon/whisper-venv/bin/pip install --quiet faster-whisper >/dev/null
fi
EXTRAS
echo "   voz pronta (transcrição + resposta em áudio, custo zero)."

echo ""
echo "→ 5/5 Configuração (4 perguntas e acabou):"
echo ""
read -rp "   1) Nome do agente (Enter = Agente): " AGENT_NAME
AGENT_NAME="${AGENT_NAME:-Agente}"
read -rp "   2) Seu nome (como o agente te chama): " OWNER_NAME
OWNER_NAME="${OWNER_NAME:-Chefe}"
# só letras/espaço/hífen — apóstrofo e afins quebram o serviço
AGENT_NAME="$(echo "$AGENT_NAME" | tr -cd "[:alpha:] À-ÿ-")"
OWNER_NAME="$(echo "$OWNER_NAME" | tr -cd "[:alpha:] À-ÿ-")"
read -rp "   3) O agente fala como homem ou mulher? (m/f, Enter = m): " AGENT_GENDER
case "$(echo "${AGENT_GENDER:-m}" | tr '[:upper:]' '[:lower:]')" in
  f|fem|feminino) AGENT_GENDER=female ;;
  *) AGENT_GENDER=male ;;
esac
echo ""
echo "   4) Token do bot do Telegram."
echo "      (Não tem? No Telegram, fale com @BotFather → /newbot → ele te dá o token.)"
TG_OK=""
while [ -z "$TG_OK" ]; do
  read -rp "      Cole o token aqui: " TG_TOKEN
  TG_TOKEN="$(echo "$TG_TOKEN" | tr -d '[:space:]')"
  if curl -fsS "https://api.telegram.org/bot${TG_TOKEN}/getMe" 2>/dev/null | grep -q '"ok":true'; then
    TG_OK=1; echo "      ✓ token válido."
  else
    echo "      ✗ token não confere — copie de novo do @BotFather (formato 123456:ABC...)."
  fi
done

echo ""
echo "   Agora abre o Telegram, procura o SEU bot e manda qualquer mensagem pra ele"
echo "   (ex: \"oi\"). Fico esperando pra descobrir teu chat id..."
OWNER_CHAT_ID=""
for i in $(seq 1 60); do
  OWNER_CHAT_ID="$(curl -fsS "https://api.telegram.org/bot${TG_TOKEN}/getUpdates" 2>/dev/null | python3 -c "
import sys, json
try:
    d = json.load(sys.stdin)
    for u in reversed(d.get('result', [])):
        m = u.get('message') or {}
        c = m.get('chat') or {}
        if c.get('type') == 'private' and c.get('id'):
            print(c['id']); break
except Exception: pass
" 2>/dev/null)"
  [ -n "$OWNER_CHAT_ID" ] && break
  sleep 3
done
[ -z "$OWNER_CHAT_ID" ] && { echo "✗ Não chegou mensagem em 3 minutos. Rode o instalador de novo e mande a mensagem quando ele pedir." >&2; exit 1; }
echo "   ✓ peguei: você é o chat $OWNER_CHAT_ID."

# .env — a linha ENGINE_DEFAULT=codex é o que faz TODA sala rodar no Codex.
cat > "$HOME_AGENTE/lean-bridge/.env" <<ENVEOF
TELEGRAM_BOT_TOKEN=$TG_TOKEN
OWNER_CHAT_ID=$OWNER_CHAT_ID
AGENT_NAME="$AGENT_NAME"
OWNER_NAME="$OWNER_NAME"
AGENT_GENDER=$AGENT_GENDER
ENGINE_DEFAULT=codex
ENVEOF
chown agente:agente "$HOME_AGENTE/lean-bridge/.env"
chmod 600 "$HOME_AGENTE/lean-bridge/.env"
touch "$HOME_AGENTE/lean-bridge/.greet"; chown agente:agente "$HOME_AGENTE/lean-bridge/.greet"

# serviço (mesmo desenho da instalação normal; Codex no lugar do Claude)
NODE_BIN="$(command -v node || echo /usr/bin/node)"
sudo -u agente mkdir -p "$HOME_AGENTE/.config/systemd/user"
cat > "$HOME_AGENTE/.config/systemd/user/agente.service" <<EOF
[Unit]
Description=Agente Soft (Telegram <-> Codex)
Wants=network-online.target
After=network-online.target
StartLimitIntervalSec=300
StartLimitBurst=5
[Service]
WorkingDirectory=$HOME_AGENTE/lean-bridge
EnvironmentFile=$HOME_AGENTE/lean-bridge/.env
Environment=HOME=%h
Environment=PATH=/usr/local/bin:/usr/bin:/bin:%h/.npm-global/bin:%h/.local/bin
ExecStart=$NODE_BIN $HOME_AGENTE/lean-bridge/bridge.cjs
ExecStartPost=/bin/sh -c '[ -f "\$HOME/lean-bridge/.greet" ] || exit 0; rm -f "\$HOME/lean-bridge/.greet"; sleep 5; curl -s -X POST "https://api.telegram.org/bot\$\${TELEGRAM_BOT_TOKEN}/sendMessage" -d chat_id="\$\${OWNER_CHAT_ID}" --data-urlencode "text=✅ No ar! Sou o \$\${AGENT_NAME}, agente do \$\${OWNER_NAME}, rodando no Codex. Falta só 1 passo: o login do ChatGPT no terminal. Se você acabou de fazer, pode mandar mensagem." >/dev/null 2>&1 || true'
Restart=always
RestartSec=3
StandardOutput=append:$HOME_AGENTE/lean-bridge/bridge.log
StandardError=append:$HOME_AGENTE/lean-bridge/bridge.log
[Install]
WantedBy=default.target
EOF
chown agente:agente "$HOME_AGENTE/.config/systemd/user/agente.service"
AG_UID="$(id -u agente)"
sudo -u agente XDG_RUNTIME_DIR="/run/user/$AG_UID" systemctl --user daemon-reload
sudo -u agente XDG_RUNTIME_DIR="/run/user/$AG_UID" systemctl --user enable --now agente.service

cat <<'FIM'

============================================
 ✅ AGENTE NO AR. Falta UM passo: logar o Codex na SUA conta ChatGPT.
============================================

 Vou abrir o login agora. É assim:
   · Ele mostra um LINK e um CÓDIGO → abre o link no navegador,
     entra na SUA conta ChatGPT (a paga), autoriza.
   · Terminou? Volta no Telegram e manda "oi" pro seu bot. Pronto.

FIM
sleep 3
exec sudo -iu agente codex login || {
  echo "✗ Não abriu sozinho. Rode na mão:  sudo -iu agente codex login"
}
