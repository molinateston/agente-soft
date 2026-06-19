# SETUP-AGENTE.md — Agente Soft (Telegram ⇄ Claude Code), runtime lean

> **Claude, este arquivo é pra VOCÊ executar.** Você está rodando DENTRO da VPS,
> como usuário `agente`, já logado na conta Claude do dono (login nativo — não existe
> token Claude pra colar). Sua missão: subir a ponte fina (node puro) que liga o
> Telegram ao Claude Code, com as skills do método, e deixar no ar 24/7.
>
> Faça as perguntas UMA POR VEZ, espere a resposta, e só então siga. Se travar em
> qualquer passo, explique em português simples o que precisa. É idempotente: se já
> existir, atualize em vez de duplicar.

---

## ETAPA 0 — Pré-checagem do ambiente
Confirme (o `bootstrap.sh` já deixou pronto):
```bash
node -v            # precisa ser >= 18
command -v claude  # precisa existir
claude -p "responda só OK" | head -c 40 | grep -qiE '^[^a-z]*ok' && echo LOGIN_OK || echo LOGIN_FALHOU
# (o match é firme: a resposta tem que COMEÇAR com 'ok' — pra não casar "não está ok")
```
Se o `claude -p` não responder, o dono ainda não logou: peça pra ele rodar `claude` e
fazer login no link antes de continuar.

## ETAPA 1 — Coletar os dados (uma pergunta por vez)
1. "Qual o **nome do agente**? (ex: Bia, Léo, Sofia)" → `AGENT_NAME`
2. "Qual o **seu nome**? (como o agente vai te chamar)" → `OWNER_NAME`
3. "Crie um bot no **@BotFather**, me mande o **token**." → `TELEGRAM_BOT_TOKEN`
4. "Mande **/start** pro **@userinfobot** e me passe o **número** que ele responder." → `OWNER_CHAT_ID`
5. (Opcional, só se ele for **publicar páginas/landing**) "Tem token do **Cloudflare** (Pages:Edit) e o **Account ID**? Se não for publicar site, pode pular." → `CLOUDFLARE_API_TOKEN`, `CLOUDFLARE_ACCOUNT_ID`

(Modelo padrão = `sonnet`. Só use `opus[1m]` se o dono pedir explicitamente.)

## ETAPA 2 — Baixar o agente (este repo) + skills do método
> **Sem `--depth 1`** (clone COMPLETO de propósito): o rollback faz `git reset --hard <SHA_anterior>`,
> e num clone raso o commit anterior não existe → o rollback não reverte. O histórico do método é
> pequeno; o clone completo não pesa.
```bash
cd ~
[ -d agente-soft/.git ] && (cd agente-soft && git pull -q) || \
  git clone https://github.com/molinateston/agente-soft.git agente-soft

mkdir -p ~/lean-bridge/persona ~/lean-bridge/brain
cp ~/agente-soft/bridge.cjs ~/lean-bridge/bridge.cjs
node --check ~/lean-bridge/bridge.cjs

# Skills do método (o cérebro). Repo público de fonte-da-verdade:
mkdir -p ~/.claude
[ -d ~/.claude/skills/.git ] && (cd ~/.claude/skills && git pull -q) || \
  git clone https://github.com/molinateston/agente-soft-skills.git ~/.claude/skills
```

## ETAPA 3 — Configurar (.env, persona, roteamento)
> Note: **NÃO existe token Claude no .env.** O runtime usa o login nativo que está
> em `~/.claude/`. Isso é o coração do modelo lean.
```bash
cat > ~/lean-bridge/.env <<EOF
TELEGRAM_BOT_TOKEN=$TELEGRAM_BOT_TOKEN
OWNER_CHAT_ID=$OWNER_CHAT_ID
CLAUDE_MODEL=sonnet
WORK_DIR=$HOME/lean-bridge
PERSONA_DIR=$HOME/lean-bridge/persona
BRAIN_DIR=$HOME/lean-bridge/brain
EOF
# Cloudflare (SÓ se o dono deu na ETAPA 1 — pra publicar páginas):
[ -n "${CLOUDFLARE_API_TOKEN:-}" ]  && echo "CLOUDFLARE_API_TOKEN=$CLOUDFLARE_API_TOKEN"   >> ~/lean-bridge/.env
[ -n "${CLOUDFLARE_ACCOUNT_ID:-}" ] && echo "CLOUDFLARE_ACCOUNT_ID=$CLOUDFLARE_ACCOUNT_ID" >> ~/lean-bridge/.env
chmod 600 ~/lean-bridge/.env

echo "{\"general\":{\"model\":\"sonnet\",\"persona\":\"main.md\",\"label\":\"Geral\"}}" > ~/lean-bridge/topics.json

cat > ~/lean-bridge/persona/main.md <<EOF
# $AGENT_NAME — agente do $OWNER_NAME
Você é $AGENT_NAME, sócio-operador do $OWNER_NAME. Fala como gente, direto, sem enrolação.
Use as skills do método (em ~/.claude/skills) quando o assunto pedir.
EOF
```

## ETAPA 4 — Subir o serviço (systemd do usuário, auto-restart)
> **HOME e PATH são obrigatórios no service.** O `claude` lê o login nativo de `~/.claude/`;
> sem `HOME`/`PATH` o spawn não acha o login → toda resposta vira "⚠️ Deu erro" com o serviço
> "active". É a causa nº1 de "bot no ar mas mudo".
```bash
# linger ANTES de qualquer 'systemctl --user' (garante o bus do usuário; sem isso
# o 'enable --now' pode dar "Failed to connect to bus" numa VPS enxuta):
loginctl enable-linger "$(id -un)" 2>/dev/null || true
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

mkdir -p ~/.config/systemd/user
cat > ~/.config/systemd/user/agente.service <<EOF
[Unit]
Description=Agente Soft (Telegram <-> Claude Code)
After=network.target
[Service]
WorkingDirectory=$HOME/lean-bridge
Environment=HOME=%h
Environment=PATH=/usr/local/bin:/usr/bin:/bin:%h/.npm-global/bin:%h/.local/bin
ExecStart=/usr/bin/node $HOME/lean-bridge/bridge.cjs
Restart=always
RestartSec=3
StandardOutput=append:$HOME/lean-bridge/bridge.log
StandardError=append:$HOME/lean-bridge/bridge.log
[Install]
WantedBy=default.target
EOF
systemctl --user daemon-reload
systemctl --user enable --now agente
systemctl --user is-enabled agente   # confirma que ficou habilitado (deve imprimir "enabled")
```

## ETAPA 4.5 — Ligar a atualização automática (o método cai sozinho aqui)
Instala o agendador que, a cada 6h, puxa as habilidades novas que o dono publicar
no repo do método e se revalida (revertendo sozinho se algo vier quebrado):
```bash
cp ~/agente-soft/agente-update.service ~/.config/systemd/user/agente-update.service
cp ~/agente-soft/agente-update.timer   ~/.config/systemd/user/agente-update.timer
# Vigia de queda: avisa o dono no Telegram se o agente cair (e reinicia sozinho).
cp ~/agente-soft/agente-health.service ~/.config/systemd/user/agente-health.service
cp ~/agente-soft/agente-health.timer   ~/.config/systemd/user/agente-health.timer
systemctl --user daemon-reload
systemctl --user enable --now agente-update.timer agente-health.timer
systemctl --user list-timers --no-pager   # confirma que os dois estão agendados
```

## ETAPA 5 — Validar ponta a ponta
```bash
sleep 4
systemctl --user is-active agente && echo "serviço ATIVO" || tail -20 ~/lean-bridge/bridge.log
```
Peça ao dono pra mandar **"oi"** pro bot no Telegram. Quando ele confirmar que o
agente respondeu, está no ar. Diga o caminho dos logs (`~/lean-bridge/bridge.log`)
e da persona (`~/lean-bridge/persona/main.md`, dá pra editar o tom depois).

---

## Se travar (rollback rápido)
```bash
systemctl --user stop agente        # para
tail -40 ~/lean-bridge/bridge.log   # vê o erro
systemctl --user restart agente     # tenta de novo
```
Cole o erro de volta no `claude` que ele continua de onde parou.

## Depois de instalado — manutenção
Pra atualizar o método/skills no futuro, o dono pede "atualiza meu agente" e você
segue o **[UPGRADE-AGENTE.md](UPGRADE-AGENTE.md)** (snapshot → `git pull` → validar → reiniciar, com rollback real se quebrar).
