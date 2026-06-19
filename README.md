# Agente Soft — seu sócio IA no Telegram, em ~15 min

Sobe um agente autônomo (**Claude Code + Telegram**) numa VPS, **sem entender de código**.
Runtime **lean**: node puro, login nativo do Claude (sem colar token), sem tmux/Postgres/Caddy.

## Como instalar (sem código)

1. **Alugue a VPS** — Hostinger → VPS KVM1 → Ubuntu.
2. **Abra o Browser Terminal** no hPanel (sem SSH, sem senha decoreba).
3. **Instale o ambiente** (1 comando):
   ```bash
   curl -fsSL https://raw.githubusercontent.com/molinateston/agente-soft/main/bootstrap.sh | sudo bash
   ```
4. **Logue o Claude na sua conta:**
   ```bash
   sudo -iu agente
   claude
   ```
   Abra o link que aparecer → logue na sua conta Claude (Pro/Max) → autorize.
5. **Cole o prompt-instalador** dentro do `claude`. O `bootstrap.sh` **imprime ele pronto no terminal**
   ao terminar (é só copiar entre as linhas `----8<----`). Ele também está em
   [`prompt-instalador.txt`](prompt-instalador.txt). O prompt já clona o repo e lê o
   [`SETUP-AGENTE.md`](SETUP-AGENTE.md) sozinho.
6. **Dê os dados** que ele pedir (nome do agente, token do @BotFather, seu id do @userinfobot).
7. **No ar** ✅ — mande "oi" pro bot no Telegram.

> Travou? Copie o erro do terminal e cole de volta no `claude`. Ele continua de onde parou.

## Atualização automática (você publica → cai em todos os clientes)
O método vive num repo só (`molinateston/agente-soft-skills`). Cada agente instalado
**checa esse repo a cada 6h** e, se você publicou habilidade nova, **puxa, revalida
e reinicia sozinho** — sem ninguém tocar na VPS do cliente. Se uma atualização vier
quebrada, o agente **se reverte sozinho** e segue no ar na versão anterior.
- Liga-se sozinho na instalação (timer `agente-update`).
- Cadência ajustável (padrão 6h + atraso aleatório pra não baterem juntos no GitHub).

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
| `agente-update.timer/.service` | Atualização **automática** a cada 6h (você publica → clientes pegam sozinhos) |
| `healthcheck.sh` + `agente-health.timer/.service` | Vigia a cada 15min: se o agente cair, reinicia e **te avisa no Telegram** |
| `prompt-instalador.txt` | O único prompt que você cola |
| `bridge.cjs` | A ponte fina Telegram ⇄ Claude Code |
| `.env.example` | Variáveis (sem token Claude — login nativo) |

As skills do método vêm de [`molinateston/agente-soft-skills`](https://github.com/molinateston/agente-soft-skills).
