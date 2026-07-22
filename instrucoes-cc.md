# PROJETO LEON — Instalador oficial (Claude Code)

> **Claude, este arquivo é pra VOCÊ executar do início ao fim.** Você está rodando
> DENTRO da VPS do cliente pago do Projeto LEON, autenticado na conta Claude dele.
> Sua missão: subir o motor do LEON (Telegram ⇄ Claude Code) 24/7, com as skills
> do método Soft e ligado à licença dele.
>
> Faça as perguntas UMA por vez, espere a resposta antes de seguir. É idempotente:
> se já existe algo, atualize em vez de duplicar. Se travar, explique em português
> simples o que precisa. Não invente etapas, não pule etapas.

---

## ETAPA 0 — Modo automático

Entre em **auto-accept edits** (aperte Shift+Tab até aparecer "auto-accept edits ON"
no rodapé). São dezenas de passos e travar em cada `bash`/`edit` mata a instalação.
Ao terminar, o dono volta pro modo normal.

---

## ETAPA 1 — Guard de root

Rode:

```bash
if [ "$(id -u)" = "0" ]; then echo "SOU_ROOT"; else echo "NAO_SOU_ROOT"; fi
```

### 1.a) Se saiu `NAO_SOU_ROOT`

Confirme que já está no usuário certo (deve ser `leon`, `agente` ou nome dado
pelo dono). Pule pra ETAPA 2.

### 1.b) Se saiu `SOU_ROOT`

Você não pode instalar o LEON como root — o Claude Code recusa
`--dangerously-skip-permissions` como root. Precisa criar um usuário comum,
copiar seus credenciais Claude pra ele, e pivotar. Execute:

```bash
# 1. Se já existe um leon-agente.service ANTIGO rodando errado, para
if systemctl is-active leon-agente.service >/dev/null 2>&1; then
  systemctl stop leon-agente.service 2>/dev/null || true
  systemctl disable leon-agente.service 2>/dev/null || true
  rm -f /etc/systemd/system/leon-agente.service
  systemctl daemon-reload 2>/dev/null || true
fi

# 2. Pré-reqs que exigem root
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
apt-get install -y -qq git curl ca-certificates tar python3 python3-venv python3-pip dbus-user-session locales sudo ffmpeg >/dev/null
locale-gen C.UTF-8 2>/dev/null || true

# 3. Node 20 (se faltar)
if ! command -v node >/dev/null 2>&1 || [ "$(node -v 2>/dev/null | cut -dv -f2 | cut -d. -f1)" -lt 20 ]; then
  curl -fsSL https://deb.nodesource.com/setup_20.x | bash - >/dev/null 2>&1 || true
  apt-get install -y -qq nodejs >/dev/null 2>&1 || true
fi
node -v || { echo "ERRO: Node 20 nao instalou. Aborte e chame o suporte."; exit 1; }

# 4. Cria usuário leon (sem senha, com linger pra serviço --user sobreviver a reboot)
LEON_USER="${LEON_USER:-leon}"
if ! id "$LEON_USER" >/dev/null 2>&1; then
  adduser --disabled-password --gecos "" "$LEON_USER" >/dev/null
fi
loginctl enable-linger "$LEON_USER" 2>/dev/null || true

# 5. COPIA CREDENCIAIS Claude do root pro leon (pra ele usar o CLI já autenticado)
LEON_HOME=$(getent passwd "$LEON_USER" | cut -d: -f6)
if [ -d /root/.claude ] && [ ! -d "$LEON_HOME/.claude" ]; then
  cp -a /root/.claude "$LEON_HOME/.claude"
  chown -R "$LEON_USER:$LEON_USER" "$LEON_HOME/.claude"
fi
# ~/.claude.json (config principal)
if [ -f /root/.claude.json ] && [ ! -f "$LEON_HOME/.claude.json" ]; then
  cp -a /root/.claude.json "$LEON_HOME/.claude.json"
  chown "$LEON_USER:$LEON_USER" "$LEON_HOME/.claude.json"
fi

echo "PIVOT_OK $LEON_USER $LEON_HOME"
```

Depois disso, avise o dono, em português simples:

> "Instalei os pré-requisitos como chefe da máquina e criei o usuário `leon`
> (é onde o LEON vai morar por segurança). Copiei o meu login Claude pra ele
> também. Agora eu preciso abrir um novo Claude Code JÁ como esse usuário
> `leon` pra continuar — do jeito root eu não termino. Segue esses 2 comandos
> nessa mesma tela:
>
> ```
> sudo -iu leon
> claude
> ```
>
> Quando abrir o novo Claude Code (já como leon), cole este mesmo prompt de
> instalação de novo. Eu detecto que os pré-requisitos já estão prontos e
> continuo do ponto certo."

Aborte por aqui. NÃO tente continuar como root — vai quebrar.

---

## ETAPA 2 — Pré-check do ambiente (você já está como usuário comum)

```bash
node -v            # >= 20
command -v claude  # tem que existir
whoami             # NAO pode ser root
pwd                # anota pra referência
```

Sanity do Claude:

```bash
claude -p --model sonnet "responda so OK" 2>/dev/null | head -c 40 | grep -qiE '^[^a-z]*ok' && echo LOGIN_OK || echo LOGIN_FALHOU
```

Se der `LOGIN_FALHOU`: espere 5s e tente de novo (soluço momentâneo). Se
insistir, avise o dono: *"O login do Claude não completou. Rode `claude auth
login` numa outra aba do terminal e refaça o login."* — pare e espere.

Não mostre a string `LOGIN_OK`/`LOGIN_FALHOU` pro dono. É check interno.

---

## ETAPA 3 — Coletar dados (uma pergunta por vez, no chat)

Pergunte no chat, UMA POR VEZ, esperando resposta antes de seguir:

### 3.1 Email da compra

> "Qual foi o **email que você usou pra comprar** o Projeto LEON (Cakto/Hubla)?
> É ele que destrava o download do motor."

Guarde em `LEON_EMAIL`.

### 3.2 Nome do agente

> "Qual o **nome do agente**? Padrão da casa: **LEON** (todo mundo que manteve
> LEON prosperou, dizem que dá sorte). Se preferir outro (Bia, Sofia, Alfred),
> fica à vontade."

Guarde em `AGENT_NAME`.

> **Normalize:** aceite só letras (com acento), espaço e hífen. Se tiver
> apóstrofo, aspas, `$`, crase, `\` ou `#`, remova/troque e confirme com o dono
> antes de gravar.

### 3.3 Persona masculina ou feminina

> "Essa persona é **masculina** ou **feminina**? Define a voz quando ele/ela
> responder em áudio (Antonio se masc, Francisca se fem — vozes grátis pt-BR)."

Aceite `male`/`m`/`masculino`/`masc` → `male`; `female`/`f`/`feminino`/`fem` →
`female`. Se o dono não decidir, assuma `male` e avise: *"vou deixar masculina
(Antonio); se quiser trocar depois, é só falar."*

Guarde em `AGENT_GENDER`.

### 3.4 Seu nome

> "Qual o **seu nome**? Como o agente vai te chamar (ex: *Leo*)."

Guarde em `OWNER_NAME`. Mesma normalização de 3.2.

### 3.5 Bot do Telegram

> "Vamos criar seu bot, leva 1 minuto:
>
> 1. No Telegram, procure **@BotFather** (o oficial tem selo azul ✓) e abra a
>    conversa.
> 2. Mande `/newbot`.
> 3. Ele pergunta um **nome** (o que aparece no topo da conversa) — ex:
>    *$AGENT_NAME*.
> 4. Depois pede um **username**, que **tem que terminar em `bot`** e ser
>    **único** — ex: `meu_leon_bot`. Se já existe, tente outro (acrescente número).
> 5. Ele te manda uma linha grande com o **token**, tipo
>    `123456789:AAE-xxxxxxxxxxxxxxxxxxxxxxxx`. **Copia e cola aqui pra mim.**"

Guarde em `TELEGRAM_BOT_TOKEN`.

**NÃO peça o chat_id do dono agora.** Vamos capturar sozinho na ETAPA 6.

---

## ETAPA 4 — Baixar o motor (amarrado à licença)

```bash
INSTALL_DIR="$HOME/lean-bridge"
mkdir -p "$INSTALL_DIR"

TARBALL=$(mktemp --suffix=.tar.gz)
EMAIL_ENC=$(python3 -c "import urllib.parse,sys; print(urllib.parse.quote(sys.argv[1]))" "$LEON_EMAIL")
HTTP_CODE=$(curl -sSL -w "%{http_code}" -o "$TARBALL" "https://licenca.leonardomolina.com.br/download?email=$EMAIL_ENC")

if [ "$HTTP_CODE" != "200" ]; then
  echo "ERRO download HTTP $HTTP_CODE:"
  head -c 300 "$TARBALL"
  rm -f "$TARBALL"
  exit 1
fi

STAGE=$(mktemp -d)
tar -xzf "$TARBALL" -C "$STAGE"
INNER=$(find "$STAGE" -maxdepth 1 -mindepth 1 -type d | head -1)
cp -a "$INNER"/. "$INSTALL_DIR"/
rm -rf "$STAGE" "$TARBALL"

cd "$INSTALL_DIR"
node --check bridge.cjs || { echo "ERRO: bridge.cjs invalido"; exit 1; }
echo "MOTOR_OK"
```

Se `HTTP_CODE` diferente de 200: pare e explique ao dono em português simples.
Possíveis motivos: email diferente do da compra, webhook ainda não processou
(espere 1 min), reembolso/cancelamento (licença bloqueada). Mande o suporte:
`https://wa.me/5511961562217`.

---

## ETAPA 5 — Instalar dependências

```bash
cd "$INSTALL_DIR"
npm install --no-audit --no-fund >/dev/null 2>&1
```

Voz local grátis (Edge TTS — Antonio/Francisca pt-BR, default):

```bash
mkdir -p ~/.openclaw/edgetts-venv
if [ ! -x ~/.openclaw/edgetts-venv/bin/edge-tts ]; then
  python3 -m venv ~/.openclaw/edgetts-venv
  ~/.openclaw/edgetts-venv/bin/pip install --quiet edge-tts >/dev/null 2>&1 || echo "aviso: edge-tts opcional falhou"
fi
```

Se `edge-tts` não instalar, tudo bem — o bridge cai em fallback automático. Não
pare por causa disso.

---

## ETAPA 6 — Capturar o chat_id do dono (via getUpdates)

Escreva `.env` PARCIAL (sem `OWNER_CHAT_ID` ainda) só pra rodar o probe:

```bash
cat > "$INSTALL_DIR/.env" <<EOF
TELEGRAM_BOT_TOKEN=$TELEGRAM_BOT_TOKEN
LEON_LICENSE_EMAIL=$LEON_EMAIL
LEON_LICENSE_CENTRAL=https://licenca.leonardomolina.com.br
AGENT_NAME=$AGENT_NAME
AGENT_GENDER=$AGENT_GENDER
OWNER_NAME=$OWNER_NAME
TTS_PROVIDER=edgetts
EOF
chmod 600 "$INSTALL_DIR/.env"
```

Sanity do token (getMe):

```bash
BOT_JSON=$(curl -sS "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/getMe")
echo "$BOT_JSON" | grep -q '"ok":true' || { echo "TOKEN_INVALIDO: $BOT_JSON"; exit 1; }
BOT_USER=$(echo "$BOT_JSON" | python3 -c "import json,sys; print(json.load(sys.stdin)['result']['username'])")
echo "BOT_OK @$BOT_USER"
```

Se `TOKEN_INVALIDO`: peça o token de novo (a linha inteira do BotFather, só o
token, sem texto em volta) e volte à ETAPA 3.5.

Agora peça no chat:

> "Beleza. Abre o Telegram, procura **@$BOT_USER**, clica em **Começar** e me
> manda `oi` (qualquer coisa). Assim eu descubro sozinho quem é você e ligo o
> agente ao seu Telegram — sem você precisar copiar id nenhum."

Espere a resposta (o dono confirma "mandei"). Então capture:

```bash
OWNER_CHAT_ID=""
for i in $(seq 1 20); do
  UPD=$(curl -sS "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/getUpdates?limit=5&offset=-5")
  OWNER_CHAT_ID=$(echo "$UPD" | python3 -c "
import json,sys
try:
  d=json.load(sys.stdin)
  for r in reversed(d.get('result',[])):
    m=r.get('message') or r.get('edited_message') or {}
    ch=m.get('chat',{})
    if ch.get('type')=='private':
      print(ch['id']); break
except: pass" 2>/dev/null)
  [ -n "$OWNER_CHAT_ID" ] && break
  sleep 2
done

if [ -z "$OWNER_CHAT_ID" ]; then
  echo "SEM_MSG_AINDA"
else
  echo "OWNER_CHAT_ID=$OWNER_CHAT_ID"
fi
```

Se `SEM_MSG_AINDA`: peça de novo — *"Não peguei nada. Confirma que mandou
mensagem pro bot? Manda mais uma."* e re-rode o loop. Não desista.

Grava no `.env`:

```bash
echo "OWNER_CHAT_ID=$OWNER_CHAT_ID" >> "$INSTALL_DIR/.env"
```

---

## ETAPA 7 — Serviço systemd (--user)

```bash
mkdir -p ~/.config/systemd/user
cat > ~/.config/systemd/user/leon-agente.service <<EOF
[Unit]
Description=Projeto LEON · Socio IA 24x7
After=network.target

[Service]
WorkingDirectory=$INSTALL_DIR
ExecStart=/usr/bin/node $INSTALL_DIR/bridge.cjs
Restart=always
RestartSec=5

[Install]
WantedBy=default.target
EOF

systemctl --user daemon-reload
systemctl --user enable --now leon-agente.service
sleep 4
systemctl --user is-active leon-agente.service && echo "SERVICO_OK" || echo "SERVICO_FALHOU"
```

Se `SERVICO_FALHOU`, mostre `journalctl --user -u leon-agente.service -n 30 --no-pager`
pro dono e pare. Não invente conserto.

---

## ETAPA 8 — Ativar licença no central

```bash
MAC=$(ip link show 2>/dev/null | awk '/link\/ether/{print $2;exit}' || echo "no-mac")
MACHINE_ID=$(echo -n "$MAC-$(hostname)" | sha256sum | awk '{print $1}')
echo "LEON_MACHINE_ID=$MACHINE_ID" >> "$INSTALL_DIR/.env"

RESP=$(curl -fsS -X POST "https://licenca.leonardomolina.com.br/activate" \
  -H "Content-Type: application/json" \
  -d "{\"email\":\"$LEON_EMAIL\",\"machine_id\":\"$MACHINE_ID\"}" || echo '{"ok":false}')
echo "$RESP" | grep -q '"ok":true' && echo "LICENCA_ATIVADA" || echo "LICENCA_FALHOU: $RESP"
```

Se `LICENCA_FALHOU` com código `machine_mismatch`: chave já foi ativada em
outra VPS. Avise o dono e mande o suporte.

Reinicie o serviço pra ele carregar o `MACHINE_ID`:

```bash
systemctl --user restart leon-agente.service
```

---

## ETAPA 9 — Teste final e report

Envie ping via API:

```bash
curl -sS -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
  -d "chat_id=$OWNER_CHAT_ID" \
  --data-urlencode "text=$AGENT_NAME instalado. Manda oi que eu respondo." >/dev/null
```

Avise o dono no chat, em português simples:

> "Pronto. Instalei o $AGENT_NAME e ele já mandou uma mensagem no seu
> Telegram. Vai lá, manda `oi`, e ele responde. A partir daqui tudo por
> Telegram: texto, áudio, foto, arquivo — ele responde."

Se algo falhou (LICENCA_FALHOU, SERVICO_FALHOU, SEM_MSG_AINDA persistente),
diga honestamente o que quebrou e o que precisa. Nunca invente "está tudo
funcionando" se não está.

---

## Regras invioláveis

- Uma pergunta por vez. Espere resposta.
- Não pule etapa. Não invente etapa.
- Zero jargão pro dono (`systemd` vira "serviço", `endpoint` vira "link").
- Se travar: pare, explique em português simples, peça o que precisa.
- Erro real: mostre a saída bruta que causou (2-3 linhas), não invente diagnóstico.
