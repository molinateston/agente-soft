# Fluxo do agente autônomo: o turno canônico + os fluxos por objetivo

O agente roda um loop dirigido por evento: o canal avisa quando chega mensagem, o agente trata o TURNO na ordem canônica abaixo, registra, e volta a esperar. Esta ordem vem de motor rodado em produção com lead de verdade; cada passo existe porque um defeito real o exigiu. **A ordem não se inverte.**

## O turno canônico (a ordem que vale pra qualquer objetivo)

```
mensagem chega (webhook)
  │
  0. DEBOUNCE   → junta a rajada do lead numa janela curta (padrão 8s): vira UM turno
  1. KILLSWITCH → arquivo-flag ligado? PARA TUDO, antes de gastar modelo
  2. OPTOUT     → lead pediu pra sair? taga, avisa o time, NUNCA mais fala com ele
  3. ESTADO     → classifica o lead pela fonte de verdade (tags, cadastro, relógio)
  4. ESCALADA DURA → regex na ENTRADA (antes do modelo): jurídico, pediu humano,
                     sinal de compra, conversa de dinheiro, injeção de prompt → handoff direto
  5. PROMPT     → identidade + postura do estado + a VERDADE do cadastro
                  + PROIBIÇÕES e LIÇÕES do dono (arquivos vivos, sempre inteiros)
  6. LOOP       → modelo em loop de ferramentas (teto 4 rodadas + 3 defesas anti-loop)
  7. GATE DE SAÍDA → conferência EM CÓDIGO de cada mensagem (ver gate-de-seguranca.md)
  8. SILÊNCIO   → madrugada (22h-8h local)? mensagem proativa fica pra manhã
  9. ENVIO      → manda, registra na auditoria dupla, atualiza o CRM
```

### Por que cada passo existe (os defeitos que eles matam)
- **Debounce (0):** lead de WhatsApp manda 3-5 mensagens picadas em segundos. Sem janela, o agente responde a primeira enquanto a terceira chega, e atropela a própria fala. A rajada inteira vira UM turno com o contexto completo.
- **Killswitch antes de tudo (1):** desligar tem que ser instantâneo e barato. Um arquivo-flag que o passo 1 confere mata o motor sem deploy, sem restart, sem gastar um token.
- **Optout antes do estado (2):** quem pediu pra sair não é lead, é obrigação legal e de respeito. Taga `optout`, avisa o time, e o motor nunca mais o processa.
- **Estado pela fonte de verdade (3):** o estado NUNCA vem da conversa ("acho que ele já comprou"), vem do CRM: tags de compra/presença, campos do cadastro, e o relógio contra o horário que o lead escolheu. A taxonomia dos 7 estados e as regras de precedência vivem no `playbook-operacao.md`.
- **Escalada dura antes do modelo (4):** os casos que NUNCA deviam depender do modelo acertar (assunto jurídico, "quero falar com uma pessoa", "como eu pago?", tentativa de "ignore suas instruções") são pegos por regex na entrada e viram `solicitar_humano` direto. O modelo nem opina.
- **Prompt com a verdade do cadastro (5):** nome, o horário que a pessoa escolheu, o link exclusivo dela. Se o dado não existe no cadastro, a instrução explícita é NÃO inventar. E as PROIBIÇÕES/LIÇÕES do dono (a memória de correção que não regride) entram inteiras em todo turno.
- **Loop com teto e defesas (6):** ver "As 3 defesas anti-loop" abaixo.
- **Gate de saída (7):** barrou UMA mensagem, o turno INTEIRO não sai, e o dono recebe o porquê. Prompt não é gate; código é.
- **Silêncio (8):** resposta a lead que ESCREVEU agora pode sair (ele iniciou); disparo proativo respeita a madrugada.

### As 3 defesas anti-loop (o pior defeito é o lead esperando calado)
1. **Dedup de chamada:** a mesma ferramenta com os mesmos argumentos não roda 2x no mesmo turno.
2. **Última rodada restrita:** na rodada-teto, só `solicitar_humano` fica na mesa; ou o agente escreve a resposta com o que já tem, ou escala.
3. **Ordem explícita de concluir:** o prompt manda escrever a mensagem com a informação disponível em vez de buscar "só mais uma coisa". Lead esperando em silêncio é defeito pior que resposta imperfeita.

## Contexto antes de responder (NUNCA responde no vazio)

Antes de qualquer resposta, o agente lê o estado como um humano abriria a conversa:
1. **O contato:** nome, telefone, tags, campos custom, de onde veio.
2. **O histórico da conversa:** as últimas mensagens (a conversa, não só a última linha). Sem isso, repete pergunta respondida = cara de robô.
3. **O stage/pipeline:** onde o lead está. O pipeline é a memória entre turnos.

Regra: **o que não está no CRM, não aconteceu.** O agente não confia na "memória da conversa", lê o CRM toda vez.

## Fluxo do objetivo A: SDR clássico (pré-qualifica e AGENDA)

O turno canônico + a técnica de topo desta skill:
1. **Lead novo** → abre pelo Recuo Estratégico: consultivo, sem empurrar.
2. **Qualifica de leve** (os 4 elementos, uma pergunta por mensagem; BANT lido por dentro).
3. **Pré-qualificador** (a aula do webinar OU a Mini Carta/Mini Webinar) antes da sessão. Sem pular.
4. **Desfecho em 3 ramos:**
   - **Quente (dor nomeada + BANT)** → VENDE A SESSÃO como vaga (`vender-a-sessao.md`), consulta slots livres, oferece 2 opções concretas, cria o appointment, move o card, taga, **handoff rico** pro closer (nota + notificação com dedup).
   - **Morno** → pré-qualificador OU follow-up pela cadência (teto de 4 toques).
   - **Sem perfil** → encerra leve, taga com o motivo, PARA.
5. **Ticket ≤ ~R$3.000:** pode conduzir até o fechamento no mesmo atendimento (preço/link SÓ da tabela aprovada, via ferramenta de preço). Acima: para no agendamento.

## Fluxo do objetivo B: Atendente 24-7 (atende, responde, orienta)

A missão é resolver, não vender. O turno canônico vale inteiro; muda a postura:
1. **Classifica a pergunta:** dúvida de produto/acesso/agenda/entrega → responde; assunto fora do escopo (jurídico, financeiro do dono, reclamação grave, imprensa) → escala com contexto.
2. **Responde SÓ com fato consultado:** toda afirmação sobre o produto vem de `buscar_conhecimento` na wiki (`motor-de-conhecimento.md`). Achou nada = diz que vai confirmar e escala. NUNCA inventa.
3. **Dinheiro só via arquivo:** qualquer pergunta de preço/condição passa pela ferramenta de preço; tabela vazia = "te passo já com o time" + handoff.
4. **Resolve e fecha o ciclo:** confirma que a dúvida foi resolvida; registra o tema na nota (vira insumo de FAQ pro dono).
5. **Sinal comercial no meio do atendimento** (lead pergunta "como faço pra entrar?", "quanto custa?") → escalada dura: vira handoff comercial (ou fluxo A, se o dono ligou os dois).
- **Métricas:** tempo de resposta (meta: minutos, não horas), % resolvido sem humano, escaladas por motivo, temas recorrentes.

## Fluxo do objetivo C: Operador de funil (conduz pela esteira)

A missão é levar o lead de estado em estado (isca → aula → oferta) com a mensagem certa do momento:
1. **Estado primeiro:** os 7 estados do `playbook-operacao.md` (novo / pré-evento / ao vivo / compareceu / faltou / carrinho abandonado / cliente). A postura de cada estado dita a mensagem.
2. **Sinais finos das tags direto no prompt:** assistiu até o fim, clicou na oferta e não comprou, ficha iniciada e não terminada. USA o sinal, não pergunta de novo.
3. **Follow-up por estado, não genérico:** faltou → replay/remarcar; compareceu e não agiu → consultivo pela dor da aula; carrinho abandonado → retoma pelo que faltou (prioridade sobre "compareceu"); cliente → NUNCA recebe oferta.
4. **Janelas de tempo:** confirmação de véspera, lembrete em cima da hora com link, pós-evento na janela quente (a primeira hora depois do fim vale mais que o dia seguinte).
5. **Desemboca em:** compra no checkout (funil de aula), OU sessão agendada (vira fluxo A no fim da esteira).
- **Métricas:** comparecimento (agendado → presente), conversão por etapa da esteira, carrinho recuperado, optouts (o alarme de cadência ruim).

## Erros e bordas (valem pros 3 objetivos)
- **Lead manda áudio/imagem:** transcreve/lê antes de responder (não ignora).
- **Duas conversas ao mesmo tempo:** cada uma isolada por conversa/contato; contexto nunca vaza entre leads.
- **CRM fora do ar / token vencido:** NÃO inventa que respondeu; registra a falha e avisa o dono ("toda falha avisa").
- **Handoff feito:** depois que escalou pro humano, o agente NÃO retoma a conversa sozinho. Só volta quando o humano devolver.
- **Lead já é cliente:** checa compra ANTES de qualquer oferta, em qualquer objetivo.

## Nunca opera calado

Resumo diário pro dono + alerta na hora quando algo pede decisão (lead quente parado, gate acionado, erro de conexão). Cada turno gravado 2x: um log de máquina (jsonl) e um diário legível pro dono ler e aprovar (a auditoria dupla do `playbook-operacao.md`). Promete atender, atende; se falha, avisa.
