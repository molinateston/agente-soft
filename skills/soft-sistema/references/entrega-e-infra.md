# Entrega e infra

Como o sistema sai do código pro ar, com prova. A infra é a do **dono** (autoria própria, nada de terceiro): GitHub `<org-do-dono>`, Cloudflare Pages pro war room, VPS do dono pro produto, imagegen local pras imagens, cofre do dono pras credenciais. Doutrina **tool-adaptive**: com essa infra, executa e entrega no ar; sem ela (ambiente sem Bash/tokens), entrega a spec + arquitetura + o plano de build e diz o que a infra somaria.

## GitHub SEMPRE (repo = produção)

Antes da 1ª linha de código (Fase 2, Arquitetura):

```bash
cd <workdir>
git init
gh repo create <org-do-dono>/<nome> --private --source=. --remote=origin
```

- Repos **privados**, um por cliente, sob `<org-do-dono>`.
- **Commit por agente**: cada subagente do Build commita seu escopo (mensagem clara do que fez). Facilita o review e o rollback por peça.
- **Repo = produção**: a sincronização final (Fase 5) garante que o que está no ar é o que está no `main`. Nada de "ajuste rápido direto no servidor" que o repo não vê.
- **Editando sistema existente sem repo?** Cria o repo na hora e **commita o estado atual ANTES de mexer** (Pergunta Zero, SKILL.md). É o ponto de retorno.
- Token: `GITHUB_PAT` no cofre do dono (`/home/cloud/.openclaw/.env`). `gh` autentica por ele.

## Deploy do WAR ROOM → Cloudflare Pages

O war room é SPA + backend enxuto (Express/sessão ou Functions/Worker). Publica no Cloudflare Pages:
- Token `CLOUDFLARE_API_TOKEN` e `CLOUDFLARE_ACCOUNT_ID` no cofre do dono.
- Deploy via `wrangler` (Pages). Projeto por cliente.
- A parte de sessão/login vai como Pages Functions ou Worker (o segredo de sessão no ambiente do Cloudflare, nunca no repo).

## Deploy do PRODUTO → VPS do dono (Caddy + systemd)

O produto roda na **VPS do dono**, não em PaaS de terceiro:
- Serviço Node numa **porta alta**, bind **`127.0.0.1`** (não escuta a internet direto).
- **Caddy** faz o reverse-proxy do subdomínio → `127.0.0.1:<porta>`, com TLS automático.
- **systemd** com `Restart=always` (sobe sozinho após queda/reboot).

```
# /etc/systemd/system/<nome>.service
[Service]
ExecStart=/usr/bin/node /srv/<nome>/server.js
Environment=NODE_ENV=production
EnvironmentFile=/srv/<nome>/.env      # cofre cifrado, fora do repo
Restart=always
User=<serviço>
[Install]
WantedBy=multi-user.target
```
```
# Caddyfile (bloco do subdomínio)
<sub>.seudominio.com.br {
    reverse_proxy 127.0.0.1:<porta>
}
```

## Subdomínio

Default `cliente.seudominio.com.br` (subdomínio no domínio do dono, via Cloudflare: DNS A/CNAME apontando pra VPS, TLS pelo Caddy). Quando o cliente tem domínio próprio e quer usar, aponta o DNS dele pro mesmo destino; o padrão é o subdomínio do dono pra subir rápido.

## Imagens e infográficos → imagegen local

Todo infográfico/imagem rica é gerado pelo **pipeline imagegen local (gpt-image) do dono**, não por serviço de terceiro. Gráfico simples (barra/linha) pode ser SVG inline com os tokens de cor. Motivo: mantém a imagem dentro da infra do dono, com a paleta da marca, sem dependência externa que quebre o gate visual.

## Cofre de credenciais

- Segredo **nunca** em texto puro no repo. Por ora, o cofre é o **`.env` cifrado na VPS** (`/home/cloud/.openclaw/.env` pro operador; `/srv/<nome>/.env` fora do repo pro serviço). Upgrade pra gerenciador de senha depois.
- **Caça segredo antes de CADA push** (ação obrigatória, não opcional):

```bash
# antes de git push: procura chave/segredo que possa ter vazado pro diff
git diff --cached | grep -niE "sk-[a-z0-9]{20,}|ghp_[a-z0-9]{30,}|api[_-]?key|secret|password|token" && echo "PARA: revisa antes de commitar"
```

Achou algo que não seja referência a `process.env` → remove do diff, move pro `.env`, e só então commita.

## Banco do produto → Supabase

- Supabase (hospedado, free-tier pra começar; self-host depois). RLS por tenant é feature nativa (ver `frente-produto.md`).
- URL/keys do projeto no cofre; a `service_role` **só** no servidor, nunca no client (a `anon` vai pro client, e a RLS protege).

## Checklist de PRONTO (Fase 5, com prova)

Não marca "no ar" sem colar a prova de cada item:

| Item | Prova |
|---|---|
| Repo criado e sincronizado | `git remote -v` aponta pra `<org-do-dono>/<nome>`; `main` = o que está no ar |
| Sem segredo no repo | grep de segredo no histórico do último push = limpo |
| War room no ar | URL do Pages responde; login split carrega |
| Produto no ar | `curl -I https://<sub>.seudominio.com.br` = 200, TLS de pé |
| Serviço resiliente | `systemctl status <nome>` ativo; `Restart=always` no unit |
| Login real feito | logou com credencial de teste, screenshot da tela pós-login |
| Navegação | screenshots das telas principais (as seções da spec) |
| Banco confere | query mostra que o dado da UI existe na tabela |
| RLS isolando (produto) | logado como tenant A, query prova que NÃO vê dado do tenant B |
| IA sem chave no client (produto) | a chave só aparece no servidor; o client chama o proxy |
| Gate visual | grep gradiente/emoji/travessão = 0 nas telas |
| Pacote entregue | link + repo + screenshots citados por path na resposta |

Qualquer item sem prova = a Entrega não terminou (Lei 2 do SKILL.md).

## Sem a infra (tool-adaptive)

No APP/chat sem Bash, ou num ambiente sem os tokens: entrega o **doc consolidado** (spec + arquitetura + plano visual + o plano de build com os comandos prontos), na mesma qualidade, e nomeia em uma linha o que a infra somaria ("com GitHub/Cloudflare/VPS eu subo isso no ar e entrego o link + a prova"). Nunca finge deploy que não fez.
