# Agente Soft — seu sócio IA no Telegram, em ~15 min

Sobe um agente autônomo (**Claude Code + Telegram**) numa VPS, **sem entender de código**.
Runtime **lean**: node puro, login nativo do Claude (na conta Pro/Max, não na API), sem tmux/Postgres/Caddy.

## Como instalar (sem código)

1. **Alugue a VPS** — Hostinger → VPS KVM1 → Ubuntu.

> 🎙️ **Vai mandar ÁUDIO pro agente?** A transcrição de áudio carrega um modelo que precisa de **~1GB de RAM**. Numa VPS de 1GB isso pode estourar a memória (OOM) e derrubar o agente. Se for usar áudio, **recomendado VPS com 2GB de RAM ou mais**.
2. **Abra o Browser Terminal** no hPanel (sem SSH, sem senha decoreba).

> 💡 **Como colar no Browser Terminal:** clique com o **botão direito** dentro do terminal e escolha **Colar** (jeito mais garantido). Se preferir teclado, use **Ctrl+Shift+V** — o Ctrl+V comum às vezes não cola em terminal. Vale pra todos os comandos abaixo, inclusive o prompt do passo 5.

3. **Instale e abra o Claude** (1 comando — leva ~2-5 min; é normal a tela ficar parada, NÃO feche). Ele instala tudo e **abre o Claude sozinho** no fim — você não digita mais nada de comando:
   ```bash
   sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/molinateston/agente-soft/main/bootstrap.sh || echo 'echo "✗ Não consegui baixar o instalador. Confere sua internet e roda de novo. Se continuar, o GitHub pode estar fora do ar."; exit 1')"
   ```
4. **Logue na sua conta Claude** (o Claude já abriu sozinho). Na **primeira vez**, antes do link, ele faz umas perguntas rápidas — responda assim:
   - **Tema** (cor da tela): escolha qualquer um com as **SETAS** ↑↓ e aperte **Enter**.
   - **Método de login**: escolha **"Conta Claude" / "Sign in with Claude account"** (use as SETAS + Enter). **NUNCA** escolha a opção de **API key** — não é por aí.
   - **Confiar na pasta**: ele pergunta se confia neste diretório → confirme (geralmente "Yes, proceed" / "Sim").

   Depois disso aparece um **LINK** (pode levar alguns segundos pra surgir):
   1. **Abra o link no navegador** → **logue na sua conta Claude** (Pro/Max) → **autorize**.
   2. A Anthropic vai te mostrar um **CÓDIGO** na tela do navegador → **COPIE esse código**.
   3. Volte ao terminal, **COLE o código** (botão direito → **Colar**) e aperte **Enter**.

   ⚠️ Esse código **NÃO é o token da API** — é o **código de login** que aparece **DEPOIS** que você autoriza no navegador. Você precisa copiar e colar ele de volta no terminal pra finalizar.
5. **Cole o prompt-instalador** dentro do `claude` — **cole o bloco inteiro de uma vez e aperte Enter só uma vez** (é normal aparecer várias linhas antes de enviar; se enviar pela metade, é só mandar o resto na mensagem seguinte que ele continua). O `bootstrap.sh` **imprime ele pronto no terminal**
   ao terminar (é só copiar entre as linhas `----8<----`). Ele também está em
   [`prompt-instalador.txt`](prompt-instalador.txt). O prompt já clona o repo e lê o
   [`SETUP-AGENTE.md`](SETUP-AGENTE.md) sozinho.
6. **Dê os dados** que ele pedir: nome do agente, seu nome e o **token do bot**. Pra criar o bot: no Telegram, procure **@BotFather**, mande **/newbot**, dê um nome e um **username terminado em `bot`** (se "já existe", tente outro) — ele te devolve o **token** (a linha grande tipo `123456789:AAE...`), que você cola no chat. Seu id é capturado sozinho: você manda uma mensagem no próprio bot (sem @userinfobot), com prova de identidade.
7. **No ar** ✅ — o bot te manda **"✅ No ar!"** sozinho. Responda "oi" pra testar a conversa.

> Travou? Copie o erro do terminal e cole de volta no `claude`. Ele continua de onde parou.

> 👥 **Quer usar o bot DENTRO de um grupo?** Adicione o bot ao grupo e **torne ele ADMIN** do grupo. O admin é o que garante que o bot **recebe as mensagens** — sem isso, com o modo privacidade (privacy mode) que o BotFather deixa **ligado por padrão**, o bot **não enxerga as mensagens** que você manda no grupo.

> ⚠️ Encaminhar pro agente um arquivo/imagem/PDF que VEIO de terceiro é como rodar na sua VPS algo que um terceiro escreveu. O agente trata anexo como dado e tem regra pra não obedecer comando escondido dentro dele, mas anexo de origem confiável é sempre mais seguro.

## Atualização automática (você publica → cai em todos os clientes)
O método vive num repo só (`molinateston/agente-soft-skills`). Cada agente instalado
**checa esse repo 1x por semana** e, se você publicou habilidade nova, **puxa, revalida
e reinicia sozinho** — sem ninguém tocar na VPS do cliente. Se uma atualização vier
quebrada, o agente **se reverte sozinho** e segue no ar na versão anterior.
- Liga-se sozinho na instalação (timer `agente-update`).
- Cadência ajustável (padrão 1x por semana + atraso aleatório pra não baterem juntos no GitHub).

### Atualizar/reverter na mão (quando quiser)
- `bash ~/agente-soft/update.sh` — atualiza agora (idempotente; só age se mudou).
- `bash ~/agente-soft/rollback.sh` — desfaz o último update (restore real).
- Ou, dentro do `claude`, peça **"atualiza meu agente"** → ele segue o [`UPGRADE-AGENTE.md`](UPGRADE-AGENTE.md).

## O que tem aqui
| Arquivo | Pra quê |
|---|---|
| `bootstrap.sh` | Instala node 20 + git + claude CLI (runtime lean) |
| `SETUP-AGENTE.md` | Manual de **instalação** que o Claude executa |
| `UPGRADE-AGENTE.md` | Manual de **atualização/rollback** que o Claude executa |
| `update.sh` / `rollback.sh` | Ciclo de vida: atualiza com snapshot+auto-rollback · reverte de verdade |
| `agente-update.timer/.service` | Atualização **automática** 1x por semana (você publica → clientes pegam sozinhos) |
| `healthcheck.sh` + `agente-health.timer/.service` | Vigia a cada 15min: se o agente cair, reinicia e **te avisa no Telegram** |
| `prompt-instalador.txt` | O único prompt que você cola |
| `bridge.cjs` | A ponte fina Telegram ⇄ Claude Code |
| `.env.example` | Variáveis (sem token Claude — login nativo) |

As skills do método vêm de [`molinateston/agente-soft-skills`](https://github.com/molinateston/agente-soft-skills).
