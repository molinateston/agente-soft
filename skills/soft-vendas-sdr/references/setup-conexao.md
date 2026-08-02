# Setup de conexão — plugar o CRM do cliente no SDR

Como ligar o SDR num projeto. Leia PRIMEIRO ao ativar. Regra dura: **conexão testada ANTES de ligar o SDR.** CRM não-conectado ou token quebrado = não liga (SDR que acha que está operando e não está é pior que SDR desligado).

## Passo 1 — Gerar o Private Integration Token (PIT) da location

O PIT é o caminho mais simples pro cliente conectar (não precisa de app OAuth). Dentro da conta/location do cliente no GHL (ou no white-label dele):

1. **Settings → Private Integrations → Create New Integration** (se não aparecer, ativar em Labs/Settings).
2. Dá um nome ("SDR IA") e descrição.
3. Seleciona os **scopes** que o SDR precisa (mínimo):
   - `contacts.readonly` + `contacts.write`
   - `conversations.readonly` + `conversations.write` + `conversations/message.write`
   - `calendars.readonly` + `calendars/events.write`
   - `opportunities.readonly` + `opportunities.write`
4. Gera → **copia o token na hora** (só aparece uma vez). Se perder, gera outro (o antigo vale mais 7 dias em paralelo na rotação).

Características: token **estático** (não expira, não precisa refresh), **por location** (uma PIT por sub-conta — não é multi-tenant; cada cliente/projeto tem a sua).

## Passo 2 — Pegar o Location ID

O `locationId` é o ID da sub-conta. Acha em Settings → Business Profile (ou na URL do painel da location: `.../location/{ESSE_ID}/...`). É esse valor que vai em toda chamada.

## Passo 3 — Guardar no .env do projeto (NUNCA no chat)

No `.env` do agente daquele projeto:
```
GHL_API_KEY=<o PIT>
GHL_LOCATION_ID=<o location id>
```
⚠️ **O SDR NUNCA ecoa esses valores** — nem parcial, nem mascarado, em nenhuma mensagem. Ao configurar, confirma só o NOME ("token do CRM salvo ✅"). Se o dono mandar o token pelo chat, sugere apagar a mensagem depois. (No LEON/frota, o `.env` é re-lido ao vivo — vale sem restart.)

## Passo 4 — Testar a conexão (OBRIGATÓRIO antes de ligar)

Rodar 2 chamadas de leitura e confirmar que voltam 200:
1. **Ler 1 contato** — `GET /contacts/?locationId={{LOC}}&limit=1` → tem que voltar contato (ou lista vazia, mas 200).
2. **Listar calendários** — `GET /calendars/?locationId={{LOC}}` → tem que voltar os calendários (o SDR precisa saber o `calendarId` da sessão).
3. **Listar pipelines** — `GET /opportunities/pipelines?locationId={{LOC}}` → guarda os IDs dos stages (o SDR move o card por ID, não por nome).

Se qualquer uma der 401/403 → token/scope errado, **não liga o SDR**, resolve primeiro. Se der 200 → conexão OK, segue.

## Passo 5 — Descobrir os IDs que o SDR usa

Da resposta das chamadas de teste, anota (numa nota do projeto):
- `calendarId` do calendário da sessão (qual calendário o SDR agenda).
- `pipelineId` + os `pipelineStageId` de cada fase ("Novo", "Em Conversa", "Qualificado", "Reunião Agendada", "Descartado") — o SDR move o card por esses IDs.
- `userId` do closer/dono (pra `assignedTo` e notificação do handoff).

Sem esses IDs mapeados, o SDR não sabe onde agendar nem pra onde mover o card.

## Passo 6 — Ligar o gatilho (mensagem nova → SDR acorda)

Escolher UMA rota (detalhe técnico no `conector-ghl.md`):

**Rota A — Workflow "Send Webhook" (recomendada pra quem só tem PIT):**
1. Na location, criar um **Workflow** com trigger "Customer Replied" (ou "Inbound Message").
2. Ação final: **Webhook** (Custom Webhook / outbound), método POST, URL = o endpoint do nosso agente que recebe o evento.
3. O workflow empurra `{contactId, conversationId, mensagem}` pro agente; o agente responde usando a PIT.
- Vantagem: não precisa montar app OAuth. Funciona só com o PIT.

**Rota B — App OAuth Marketplace + Webhooks** (só se já existir app OAuth): evento nativo `InboundMessage`, dispara em qualquer canal. Mais robusto, mais setup.

**Fallback — Polling:** se nenhuma rota de webhook estiver disponível, o SDR faz `GET /conversations/search?status=unread` a cada N minutos. Funciona, mas é mais lento (o lead espera até o próximo ciclo) e gasta chamada. Usar só como ponte.

## Passo 7 — Carregar o método + confirmar o gate

Antes de soltar o SDR:
- **Método:** a técnica de topo (abordagem, qualificação, vender a sessão) já vive nesta skill; o **fechamento** (pra quando o lead cai no closer) vem da `soft-vendas-closer`. Confirma que a Oferta/PUV do cliente está de pé. Sem oferta clara, o SDR vira robô genérico, volta e monta primeiro.
- **Oferta:** puxa a tabela de preço/condição da `soft-plano-posicionamento` (o SDR só fala números aprovados — ver `gate-de-seguranca.md`).
- **Gate:** mostra a tabela ✅/🛑 pro dono, pega o OK, anota o que ele quer apertar.

## Passo 8 — Ligar em modo shadow → autônomo

Liga primeiro em **shadow** (o SDR mostra o que vai responder, o dono aprova) pros primeiros leads, calibra o tom, e sobe pra autônomo quando o dono confia (`gate-de-seguranca.md` → Modo de rodagem).

## Checklist de "pronto pra ligar"
- [ ] PIT gerado com os scopes certos, no `.env` (nunca ecoado)
- [ ] Location ID no `.env`
- [ ] Teste de conexão passou (contatos + calendários + pipelines = 200)
- [ ] `calendarId`, `pipelineStageId`s e `userId` do closer mapeados
- [ ] Gatilho de mensagem nova ligado (Workflow webhook / OAuth / polling)
- [ ] soft-vendas-closer disponível pro fechamento (a técnica de topo já vive aqui)
- [ ] Oferta/tabela de preço definida (o que o SDR pode falar)
- [ ] Gate confirmado com o dono
- [ ] Modo shadow ligado pros primeiros leads

Só com tudo marcado o SDR entra em autônomo.
