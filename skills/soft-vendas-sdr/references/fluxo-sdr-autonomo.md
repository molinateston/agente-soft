# Fluxo do SDR autônomo — o ciclo completo

O SDR de IA roda um loop dirigido por evento: o CRM avisa quando chega mensagem, o SDR trata, registra, e volta a esperar. Este é o passo a passo de cada ramo. O CONTEÚDO das mensagens de topo (abrir, qualificar, vender a sessão, reativar) vem das refs de técnica desta skill (`prospeccao-e-qualificacao.md`, `vender-a-sessao.md`, `modos-e-mentalidade.md`); o CONTEÚDO do fechamento (quando o lead cai no closer) vem da `soft-vendas-closer`. Aqui está o QUANDO/COMO operar.

## 0. Gatilho — o SDR acorda por evento, não por polling

O SDR é notificado pelo CRM quando chega mensagem nova do lead (webhook `InboundMessage`, ver `conector-ghl.md`). Isso é o que o torna 24/7 sem ficar varrendo o CRM de minuto em minuto (caro e lento). Se o CRM do projeto não tiver webhook, cai no fallback de polling com intervalo (a cada N minutos) — mas webhook é o padrão.

Ao acordar, o SDR tem: `contactId`, `conversationId`, o texto da mensagem, o canal (WhatsApp/SMS/IG).

**Debounce de 8s:** a 1ª mensagem chega e o SDR espera 8 segundos antes de processar. Se o mesmo lead manda mensagem nova nesse intervalo, a janela reinicia. Quando fecha sem mensagem nova, todas as mensagens da rajada viram um turno único (detalhe em `../SKILL.md` § Debounce). Isso evita responder a cada fragmento de uma ideia que o lead ainda está digitando.

## 1. Contexto antes de responder (NUNCA responde no vazio)

Antes de qualquer resposta, o SDR **lê o estado**, igual um humano abriria a conversa:
1. **O contato** — nome, telefone, tags, campos, `assignedTo`, de onde veio (source).
2. **O histórico da conversa** — as últimas mensagens (lê a conversa, não só a última linha). Sem isso, ele repete pergunta já respondida = cara de robô.
3. **O stage no pipeline** — em que fase o lead está (novo? já qualificado? já agendado?). O pipeline é a memória do SDR entre sessões.

Regra: **o que não está no CRM, não aconteceu.** O SDR não confia na "memória da conversa", ele lê o CRM toda vez. Não chuta, recupera.

## 2. Identifica intenção e temperatura

Com o histórico na mão, o SDR classifica onde o lead está no diagnóstico Soft (Descoberta → Implicação → Conexão, detalhe em `prospeccao-e-qualificacao.md`):
- **Lead novo / primeira mensagem** → abre pelo Recuo Estratégico (fase 1): consultivo, sem empurrar, pede permissão pra diagnosticar.
- **Já em conversa** → continua de onde parou (Descoberta → Implicação → Conexão → …), nunca recomeça.
- **Mensagem fora do fluxo** (dúvida de suporte, assunto aleatório, reclamação) → não força venda; responde o que dá dentro do escopo e, se for fora da alçada, passa pro humano (ver gate).

A temperatura (frio/morno/quente) sai da qualificação, não do "achismo": lead que já verbalizou a dor + tem budget/autoridade/urgência (BANT) = esquentando.

## 3. Qualifica — o diagnóstico Soft, conduzido no chat

Aqui o SDR conduz a qualificação leve (os 4 elementos de `prospeccao-e-qualificacao.md`), uma mensagem por vez, respeitando o ritmo do canal (WhatsApp é troca curta, não textão):

- **Descoberta (F2):** lead fala 70%. Desce da situação à dor. Acha o Problema Avançado (o que as tentativas antigas criaram de pior). As perguntas em escada estão em `prospeccao-e-qualificacao.md`.
- **Implicação (F3):** amplia o custo de ficar como está; qualifica intenção ("de 0 a 10, quanto quer resolver isso hoje?").
- **Conexão (F4):** espelha o que entendeu antes de apresentar qualquer coisa.
- **Qualificação por dentro (BANT):** Budget (dá pra investir no ticket?), Authority (é quem decide?), Need (a dor é real e nomeada?), Timeline (é agora ou "algum dia"?). O SDR não pergunta isso a seco, extrai pelo diagnóstico.

**Uma pergunta por mensagem.** Metralhar pergunta = interrogatório = lead foge. Ritmo de conversa humana.

## 4. O desfecho — 3 ramos

### 4a. Tem perfil + esquentou → AGENDA (o objetivo do SDR)
O SDR **vende a sessão**, não o produto (a técnica, com as jogadas de campo, em `vender-a-sessao.md`):
1. Oferece o agendamento pela dor que o lead nomeou ("pelo que você me falou, faz sentido a gente sentar 30min e eu te mostrar exatamente como resolver [a dor dele]. Tenho [dia] ou [dia], qual fica melhor?").
2. Consulta os **slots livres** do calendário (ver `conector-ghl.md`) e oferece 2 opções concretas (nunca "quando você pode?" aberto).
3. **Cria o appointment** no slot escolhido.
4. **Move o card** pra "Reunião Agendada" (ou o stage equivalente do pipeline do cliente).
5. **Taga** (`sessao-agendada`), **cria nota** com o resumo do diagnóstico (pro closer chegar sabendo tudo).
6. **Notifica o closer/dono** — o lead quente com o contexto pronto.

**Se ticket ≤ R$2.000** (venda direta pelo limiar): o SDR pode conduzir até o fechamento no mesmo atendimento (apresentação + isolamento + preço da tabela + link de checkout aprovado), puxando a condução da `soft-vendas-closer`, sem separar a etapa do closer. Acima do limiar, para no agendamento e faz o handoff.

### 4b. Tem perfil, ainda morno → FOLLOW-UP
Lead com perfil que não fechou o agendamento agora não é abandonado nem perseguido:
1. Agenda o próximo toque pela cadência do `playbook-operacao.md` (não manda 5 mensagens seguidas).
2. Registra o stage ("em qualificação" / "follow-up").
3. No toque seguinte, retoma pela dor, não com "e aí, pensou?".

### 4c. Sem perfil → ENCERRA LEVE
Filtrar é vitória (regra do método). Lead sem budget/perfil/necessidade real:
1. Encerra com respeito, sem queimar ("pelo que você me contou, acho que esse não é o momento certo pra você — mas fico à disposição se mudar").
2. Taga (`sem-perfil` / `descartado` com o motivo na nota).
3. **Para.** Não persegue, não faz follow-up de quem não tem perfil.

## 5. Registra sempre (o pipeline é a memória)

Todo desfecho vira estado no CRM: **nota** (o que rolou + o diagnóstico), **tag** (a temperatura/status), **stage** (a fase do pipeline). Sem isso, o próximo turno do SDR (ou o closer) chega cego. Registrar não é opcional — é o que torna o SDR confiável entre sessões e entre agentes.

## 6. Nunca opera calado

O SDR reporta pro dono (resumo diário, e na hora quando algo exige decisão — lead quente pra passar, gate acionado, erro de conexão). É a doutrina do respeito do LEON aplicada ao comercial: promete atender, atende; se falha (CRM caiu, token venceu), **avisa** — não deixa o lead no vácuo em silêncio.

## Erros e bordas
- **Lead manda áudio/imagem:** transcreve/lê antes de responder (não ignora).
- **Dois leads ao mesmo tempo:** cada conversa é isolada por `conversationId` — o SDR não mistura contexto.
- **CRM fora do ar / token vencido:** o SDR NÃO inventa que respondeu; registra a falha e avisa o dono (o gate de "toda falha avisa" do motor).
- **Lead já é cliente / já agendado:** lê o stage antes; não re-qualifica quem já está adiante.
