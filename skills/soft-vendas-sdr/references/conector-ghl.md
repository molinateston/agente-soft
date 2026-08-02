# Conector GHL — o manual de operação da API

As chamadas REAIS que o SDR usa pra operar dentro do GoHighLevel (GHL / LeadConnector). Endpoints confirmados no repositório OpenAPI oficial (`GoHighLevel/highlevel-api-docs`) — não são chute. GHL é o primeiro conector; a arquitetura da skill aceita outros (o fluxo do `fluxo-sdr-autonomo.md` é o mesmo, só troca a camada de API).

## Base e autenticação (toda chamada)

```
Base URL:  https://services.leadconnectorhq.com
Headers:   Authorization: Bearer {{GHL_API_KEY}}
           Version: 2021-07-28
           Content-Type: application/json
```

`{{GHL_API_KEY}}` = o Private Integration Token da location (ver `setup-conexao.md`). `{{GHL_LOCATION_ID}}` = o ID da sub-conta. Ambos vêm do `.env` do projeto — **o SDR NUNCA ecoa esses valores em nenhuma mensagem.**

O agente faz as chamadas via `Bash` (`curl`). Todo `curl` abaixo é modelo — o SDR adapta os valores.

## 1. Contatos

**Buscar por telefone/email** (o primeiro passo quando chega mensagem):
```bash
curl -s "https://services.leadconnectorhq.com/contacts/?locationId={{LOC}}&query={{TELEFONE_OU_EMAIL}}&limit=20" \
  -H "Authorization: Bearer {{KEY}}" -H "Version: 2021-07-28"
```

**Criar ou atualizar sem duplicar** (preferir o upsert):
```bash
curl -s -X POST "https://services.leadconnectorhq.com/contacts/upsert" \
  -H "Authorization: Bearer {{KEY}}" -H "Version: 2021-07-28" -H "Content-Type: application/json" \
  -d '{"locationId":"{{LOC}}","phone":"+55...","firstName":"...","source":"SDR IA","tags":["lead-novo"]}'
```
Campos: `firstName`, `lastName`, `name`, `email`, `phone`, `tags[]`, `customFields[]`, `source`, `assignedTo`.

**Atualizar / reatribuir vendedor** (`assignedTo` é campo do update, NÃO existe endpoint "assign" separado):
```bash
curl -s -X PUT "https://services.leadconnectorhq.com/contacts/{{CONTACT_ID}}" \
  -H "Authorization: Bearer {{KEY}}" -H "Version: 2021-07-28" -H "Content-Type: application/json" \
  -d '{"assignedTo":"{{USER_ID}}","tags":["qualificado"]}'
```

**Tag** — adicionar `POST /contacts/{id}/tags` · remover `DELETE /contacts/{id}/tags` (mesmo path, verbo DELETE, body `{"tags":["..."]}`).

**Nota** (registrar o diagnóstico pro closer): `POST /contacts/{id}/notes` body `{"body":"resumo do diagnóstico...","userId":"..."}`.

**Task** (lembrete de follow-up): `POST /contacts/{id}/tasks` body `{"title":"...","dueDate":"ISO","completed":false,"assignedTo":"..."}`.

## 2. Conversas / Mensagens

**Buscar a conversa do contato:**
```bash
curl -s "https://services.leadconnectorhq.com/conversations/search?locationId={{LOC}}&contactId={{CONTACT_ID}}" \
  -H "Authorization: Bearer {{KEY}}" -H "Version: 2021-07-28"
```

**Ler o histórico** (contexto antes de responder — NUNCA responde sem ler): `GET /conversations/{conversationId}/messages` (`limit` default 20, `lastMessageId` pagina).

**Enviar mensagem** (a resposta do SDR ao lead):
```bash
curl -s -X POST "https://services.leadconnectorhq.com/conversations/messages" \
  -H "Authorization: Bearer {{KEY}}" -H "Version: 2021-07-28" -H "Content-Type: application/json" \
  -d '{"type":"WhatsApp","contactId":"{{CONTACT_ID}}","message":"..."}'
```
⚠️ **`type` é enum exato** (respeitar maiúsculas): `SMS`, `RCS`, `Email`, `WhatsApp`, `IG`, `FB`, `Custom`, `Live_Chat`, `TIKTOK`. Email usa `html`; SMS/WhatsApp podem precisar de `fromNumber`/`toNumber`; canal `Custom` exige `conversationProviderId`.

**Marcar como lida:** `PUT /conversations/{conversationId}` body `{"locationId":"{{LOC}}","unreadCount":0}`.

## 3. Calendário / Agendamento

**Listar calendários:** `GET /calendars/?locationId={{LOC}}`.

**Buscar slots livres** (⚠️ range máximo **31 dias**; `startDate`/`endDate` em epoch ms ou ISO conforme a doc da location; passe `timezone`):
```bash
curl -s "https://services.leadconnectorhq.com/calendars/{{CALENDAR_ID}}/free-slots?startDate={{INI}}&endDate={{FIM}}&timezone=America/Sao_Paulo" \
  -H "Authorization: Bearer {{KEY}}" -H "Version: 2021-07-28"
```

**Criar o appointment** (agendar a sessão — o objetivo do SDR):
```bash
curl -s -X POST "https://services.leadconnectorhq.com/calendars/events/appointments" \
  -H "Authorization: Bearer {{KEY}}" -H "Version: 2021-07-28" -H "Content-Type: application/json" \
  -d '{"calendarId":"{{CAL}}","locationId":"{{LOC}}","contactId":"{{CONTACT_ID}}","startTime":"2026-07-10T14:00:00-03:00","title":"Sessão de diagnóstico","appointmentStatus":"confirmed","meetingLocationType":"zoom","assignedUserId":"{{CLOSER_ID}}"}'
```
Enums: `appointmentStatus` = `new`/`confirmed`/`cancelled`/`showed`/`noshow`/`invalid`; `meetingLocationType` = `custom`/`zoom`/`gmeet`/`phone`/`address`/`ms_teams`/`google`.

**Reagendar:** `PUT /calendars/events/appointments/{eventId}` (mesmos campos). **Cancelar:** o mesmo PUT com `appointmentStatus:"cancelled"`, ou `DELETE /calendars/events/{eventId}`.

## 4. Pipeline / Oportunidades

**Listar pipelines + stages** (pra saber os IDs dos stages do cliente): `GET /opportunities/pipelines?locationId={{LOC}}` → array com `stages[]` (`id`, `name`).

**Criar oportunidade:**
```bash
curl -s -X POST "https://services.leadconnectorhq.com/opportunities/" \
  -H "Authorization: Bearer {{KEY}}" -H "Version: 2021-07-28" -H "Content-Type: application/json" \
  -d '{"pipelineId":"{{PIPE}}","locationId":"{{LOC}}","name":"...","contactId":"{{CONTACT_ID}}","status":"open","pipelineStageId":"{{STAGE_NOVO}}","monetaryValue":3000,"assignedTo":"{{USER_ID}}"}'
```

**Mover de stage** (avançar o card conforme a qualificação — NÃO há endpoint dedicado, é o update geral): `PUT /opportunities/{id}` body `{"pipelineStageId":"{{NOVO_STAGE}}"}`.

**Mudar status** (endpoint DEDICADO, separado): `PUT /opportunities/{id}/status` body `{"status":"won"}` (enum: `open`/`won`/`lost`/`abandoned`; se `lost`, passe `lostReasonId`).

## Notificação de mensagem nova (o gatilho do SDR)

O que faz o SDR acordar quando o lead escreve. **Duas rotas** (detalhe operacional no `setup-conexao.md`):

1. **Recomendada pra quem tem só o Private Integration Token:** um **Workflow interno da GHL** com trigger "Customer Replied" + ação **"Send Webhook"** (Custom Webhook outbound) que faz POST pra uma URL do nosso agente. Não exige app OAuth. O workflow empurra o evento; a PIT é usada pra responder.
2. **App OAuth Marketplace** (mesmo privado) com Webhooks configurados → evento nativo `InboundMessage` (dispara em qualquer canal). Payload: `{type, locationId, contactId, conversationId, messageType, body, direction, dateAdded, ...}`. Só compensa se já houver app OAuth.

Sem webhook, o fallback é **polling** (`GET /conversations/search?status=unread` a cada N minutos) — funciona, mas é mais lento e gasta chamada. Webhook é o padrão.

## Rate limits (respeitar — o SDR não faz tempestade de chamadas)
- **Burst:** 100 req / 10s por location.
- **Diário:** 200.000 req/dia por location.
- Headers de resposta pra monitorar: `X-RateLimit-Daily-Remaining`, `X-RateLimit-Remaining`. Se bater no limite, o SDR espaça (backoff), não martela.

## O que NÃO tem API (não prometer ao cliente)
Sem endpoint: Blogs, Social Planner/postagem, Companies. **Só leitura:** Workflows/automações (não cria/edita por API — só interface). **Só interface visual:** builder de funnels/sites, templates de WhatsApp. Se o cliente pedir algo daqui, o SDR/agente orienta a fazer pela interface — não finge que faz por API.

## Regra de ouro do conector
Toda chamada pode falhar (token vencido, rate limit, location errada). O SDR **confere a resposta** e, se falhou, **NÃO finge que respondeu/agendou** — registra e avisa o dono (a doutrina "toda falha avisa"). Um agendamento que não gravou de verdade e o SDR diz "agendei" é a pior quebra de confiança possível.
