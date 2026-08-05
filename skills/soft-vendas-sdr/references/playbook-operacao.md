# Playbook de operação: estados, cadência, handoff, auditoria, métricas

Como o agente opera no dia a dia depois de ligado. Regras práticas, provadas em motor rodando com lead real.

## Os 7 estados do lead (a fonte de verdade decide, nunca o chute)

Todo lead está em UM estado, classificado por dados do CRM (tags, campos, compra) + o relógio contra o horário que ELE escolheu. O estado dita a postura do prompt.

| Estado | Como se detecta | Postura do agente |
|---|---|---|
| **novo** | sem tag de evento/compra | abre consultivo, qualifica de leve |
| **pré-evento** | inscrito, horário ainda não chegou | acolhe, confirma data/hora/link. NÃO vende |
| **ao vivo / em cima da hora** | a janela do evento é agora | urgência real, manda o link, mensagens curtas |
| **compareceu** | tag de presença positiva | modo consultivo: escuta, valida a dor, qualifica, vende a sessão |
| **faltou** | tag negativa OU horário passou sem presença | acolhe sem culpa, replay/remarcar. Não qualifica ainda |
| **carrinho abandonado** | iniciou checkout/ficha e não terminou | retoma pelo que faltou; PRIORIDADE sobre "compareceu" |
| **cliente** | compra confirmada | **ganha de TODOS: quem comprou NUNCA recebe oferta.** Vira atendimento/entrega |

**Regras de precedência (a ordem em que se confere):**
1. `cliente` primeiro, sempre (checa compra antes de qualquer coisa).
2. `carrinho abandonado` antes de `compareceu` (o sinal mais quente manda).
3. A tag NEGATIVA se confere antes da positiva (quem tem as duas por defeito de automação é tratado como faltou, o caso conservador).
4. Sem tag nenhuma, decide o relógio contra o horário escolhido no cadastro (com parser tolerante de data em português; ver os achados do `conector-ghl.md`).

**Sinais finos das tags entram DIRETO no prompt** (usa, não pergunta de novo): assistiu até o fim · clicou na oferta e não comprou · ficha iniciada e não terminada. Cada sinal muda a mensagem certa.

## Régua de temperatura (dentro do estado, pro objetivo A)

| Temperatura | Sinal | Ação |
|---|---|---|
| **Frio** | monossilábico, sem dor | 1 tentativa pela dor; senão cadência lenta |
| **Morno** | conversa andando, dor aparecendo, sem BANT claro | conduz o diagnóstico, aprofunda |
| **Quente** | dor nomeada + budget + decide + agora | oferece a sessão AGORA, agenda |
| **Agendado** | sessão marcada | confirma véspera, prepara o closer |
| **Sem perfil** | sem budget/dor/decisão | encerra leve, taga, PARA |

Morno que revela budget+urgência vira quente NA HORA. Não se segura lead pronto.

## Cadência de follow-up (o teto anti-spam)

Só pra lead COM perfil que não fechou o passo. Nunca pra quem disse não.

| Toque | Quando | Ângulo |
|---|---|---|
| 1º | mesmo dia / poucas horas | retoma pela última dor que ele nomeou |
| 2º | +1 dia | ângulo novo: uma implicação, uma prova, uma pergunta |
| 3º | +3 dias | pergunta de decisão leve ("faz sentido seguir ou deixa pra frente?") |
| 4º (último) | +7 dias | encerramento com porta aberta |

**4 toques é o teto.** Depois: `follow-up-esgotado`, para. Silêncio noturno sempre respeitado no proativo. Na esteira (objetivo C), a cadência de topo é mais curta: 10min / +24h / +24h com encerramento que fecha o loop (`modos-e-mentalidade.md`).

## Confirmação de sessão (no-show é dinheiro no chão)

- Confirmação na véspera ("amanhã às [hora] tá de pé? responde SIM que eu garanto teu horário").
- Lembrete leve em cima da hora se não confirmou.
- No-show → reagenda 1x pela dor; segundo no-show → volta pra morno.
- Benchmark de mercado: show rate saudável de reunião bem qualificada fica em **75-85%** ([tamtotarget.com](https://tamtotarget.com/sdr-meeting-benchmarks/)). Abaixo de 70%, o problema é peso da sessão (ver `vender-a-sessao.md`), não agenda.

## O handoff rico (a passagem que não queima o trabalho)

Quando o agente escala (lead quente pro closer, dúvida fora do escopo, gate acionado):
1. **Frase pronta pro lead, por motivo** (ele nunca fica no vácuo): *"boa! vou te passar com [nome/time] pra fechar isso direitinho, já te chamam aqui."*
2. **Briefing rico pro humano:** nome, fone, estado, temperatura, a dor nomeada, o Problema Avançado, BANT, objeções ditas, o que falta cair, link direto do CRM.
3. **Dedup de 30 min por lead+motivo:** o mesmo lead pelo mesmo motivo não notifica o dono 2x na mesma meia hora.
4. **Depois do handoff o agente NÃO retoma sozinho.** A conversa é do humano até ele devolver.

Handoff raso ("tá quente") joga fora o trabalho inteiro do topo: o closer entra perdendo e faz o lead repetir tudo.

## Auditoria dupla (nunca opera calado)

- **`turnos.jsonl`** (máquina): cada turno com entrada, estado, ferramentas, saída, veredito do gate. Alimenta o replay.
- **Diário legível por dia** (dono): a conversa como aconteceu + o que o agente decidiu e por quê. É o que o dono lê no modo sombra pra aprovar, e no autônomo pra auditar.
- **Resumo diário** no canal do dono: novos, em conversa, qualificados, agendados, sem perfil, follow-ups de hoje, escaladas, erros.
- **Alerta na hora** quando algo pede decisão: lead quente parado, gate barrando saída, conexão caída.

## Métricas por objetivo (o placar de cada missão)

### A. SDR clássico
- Funil: leads → qualificados → **agendados** → show rate → (venda: métrica do closer).
- Velocidade: tempo até a 1ª resposta. Meta: **minutos**. Referência de mercado: responder em até 5 min multiplica a conversão (~4x) e deixa a qualificação até 21x mais provável que após 30 min ([martal.ca](https://martal.ca/speed-to-lead-lb/), [prospeo.io](https://prospeo.io/s/speed-to-lead-ai)); a média do mercado é ~47h, e é por isso que o 24-7 ganha.
- Qualidade: % de agendados que o closer aceitou como qualificados (handoff devolvido = defeito do topo).

### B. Atendente 24-7
- Tempo de resposta (meta: minutos, madrugada inclusa via fila da manhã).
- % resolvido sem humano · escaladas por motivo · temas recorrentes (viram página de wiki).
- Reclamação/optout: o alarme de tom errado.

### C. Operador de funil
- Comparecimento (inscrito → presente) · conversão por etapa da esteira · carrinho recuperado.
- Optout por campanha: subiu, a cadência tá agressiva.
- Janela quente: % de pós-evento tocado na 1ª hora.

## Ritmo humano (o que evita cara de robô)
- Uma pergunta/ideia por mensagem; WhatsApp é troca curta.
- Não responde no milissegundo sempre; um respiro curto parece gente.
- Lê o histórico; nunca repete pergunta respondida.
- Espelha o vocabulário do lead.
- Sem textão, sem emoji em excesso, sem saudação de call center. Toda saída passa pelo crivo anti-IA.
