# UPGRADE-AGENTE.md — atualizar/reverter o Agente Soft (runtime lean)

> **Claude, este arquivo é pra VOCÊ executar**, dentro da VPS, como usuário `agente`.
> Atualizar o agente = puxar a versão nova do método (skills) e da ponte, com
> snapshot pra reverter se der ruim. É idempotente e tem **pontos de PARADA**
> onde você confirma com o dono antes de seguir.

## Quando usar
- O dono pediu "atualiza meu agente" / "pega as skills novas".
- Saiu versão nova das skills do método (`molinateston/agente-soft-skills`) ou da ponte.

## ETAPA 1 — Conferir o estado (não age ainda)
```bash
command -v claude && claude -p "responda só OK"     # login nativo vivo?
systemctl --user is-active agente                    # serviço no ar?
git -C ~/.claude/skills rev-parse --short HEAD       # versão atual do método
```
**⏸ PARADA:** mostre ao dono a versão atual e diga "vou fazer um snapshot e atualizar.
Se algo quebrar, eu reverto com 1 comando. Posso seguir?" Só siga com o "sim".

## ETAPA 2 — Atualizar (snapshot + pull + validar)
Rode o script — ele faz tudo com segurança (backup do não-secreto, `git pull`,
revalida o bridge, reinicia e valida ponta a ponta):
```bash
bash ~/agente-soft/update.sh
```
Se terminar com **✅ UPDATE OK**, peça pro dono mandar **"oi"** pro bot. Confirmado = pronto.

## ETAPA 3 — Se quebrou: reverter
```bash
bash ~/agente-soft/rollback.sh
```
Restaura o método no SHA anterior + `.env`/persona/topics/`sessions.json` do snapshot,
reinicia e valida. Diga ao dono que o estado anterior voltou (as conversas seguem com
o `--resume` preservado; a memória de longo prazo no `brain/` nunca é tocada).

---

## TROUBLESHOOTING de bolso (sintoma → diagnóstico → solução)

| Sintoma | Diagnóstico | Solução |
|---|---|---|
| `claude -p` não responde OK | login nativo expirou | dono roda `claude` e loga no link; depois `update.sh` de novo |
| `update.sh` para em "bridge.cjs novo tem erro" | a ponte nova veio quebrada | o antigo foi mantido; reporte o erro, não reinicie na mão |
| `git pull` "sem fast-forward" / preso na versão antiga | upstream sofreu force-push/rebase, ou alguém editou as skills na VPS | o `update.sh` já tenta `fetch && reset --hard origin/main` sozinho; se quiser na mão: `git -C ~/.claude/skills fetch && git -C ~/.claude/skills reset --hard origin/main`, OU rollback |
| serviço não fica `active` após reboot | falta linger | `loginctl enable-linger agente` (1x, como root) |
| skill nova "não ativa" | o agente não releu `~/.claude/skills` | `systemctl --user restart agente` (Claude Code lê os `SKILL.md` no start) |
| skill exige chave externa (ex: provider de IA secundário) | a chave não está no `.env` | só roda com a chave preenchida no `.env` — não é bug do install |

**Logs:** `~/lean-bridge/upgrade.log` (update/rollback) · `~/lean-bridge/bridge.log` (agente).
**Nunca** copie o `~/.claude/` inteiro pra backup: lá moram as credenciais do login (a conta que paga).
