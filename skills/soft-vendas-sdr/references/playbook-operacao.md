# Playbook de operação — cadência, temperatura, métricas

Como o SDR opera no dia a dia depois de ligado: quando dar follow-up, como classificar o lead, o que reportar pro dono. Regras práticas, não teoria.

## Régua de temperatura (onde o lead está)

O SDR classifica cada lead por temperatura e isso dita a ação. A temperatura sai da qualificação (BANT + dor nomeada), nunca do achismo.

| Temperatura | Sinal | Ação do SDR | Tag / stage sugerido |
|---|---|---|---|
| **Frio** | não respondeu ainda, ou respondeu monossilábico, sem dor | 1 tentativa de reengajar pela dor; se não vier, cadência lenta | `novo` / "Novo Lead" |
| **Morno** | conversa acontecendo, dor aparecendo, mas sem budget/urgência clara | conduz o diagnóstico, aprofunda a implicação | `em-qualificacao` / "Em Conversa" |
| **Quente** | dor nomeada + budget + é quem decide + quer resolver agora | oferece a sessão AGORA, agenda | `qualificado` / "Qualificado" |
| **Agendado** | sessão marcada no calendário | confirma véspera, prepara o closer | `sessao-agendada` / "Reunião Agendada" |
| **Sem perfil** | sem budget / não decide / sem dor real / fora do ICP | encerra leve, para | `sem-perfil` / "Descartado" |

**Regra de subida:** morno que revela budget+urgência vira quente na hora — o SDR não segura lead pronto esperando "a próxima etapa".

## Cadência de follow-up (o teto anti-spam)

Follow-up é pra lead COM perfil que não fechou o agendamento agora. Nunca pra quem disse não nem pra sem-perfil. Cadência padrão (o dono pode ajustar):

| Toque | Quando | Ângulo (detalhe em `modos-e-mentalidade.md`) |
|---|---|---|
| 1º | mesmo dia / poucas horas | retoma pela última dor que ele nomeou (não "e aí?") |
| 2º | +1 dia | traz um ângulo novo: uma implicação, uma prova, uma pergunta |
| 3º | +3 dias | pergunta de decisão leve ("faz sentido seguir ou prefere deixar pra frente?") |
| 4º (último) | +7 dias | encerramento com porta aberta ("vou te tirar da minha lista de agora, mas tô aqui quando quiser") |

Depois do 4º sem resposta: para, taga `follow-up-esgotado`, para de tocar. **4 toques é o teto** — perseguir além disso queima o lead e a marca. Silêncio noturno (22h–8h local) sempre respeitado nos toques proativos.

## Confirmação de sessão (reduzir no-show)

Lead agendado ≠ lead que aparece. O SDR:
- Manda **confirmação na véspera** ("amanhã às [hora] tá de pé? responde SIM que eu garanto seu horário").
- Se não confirmar até algumas horas antes, um lembrete leve.
- No-show → reagenda 1x pela dor ("aconteceu algo? bora remarcar, seu caso é do tipo que não pode esperar"); segundo no-show → volta pra follow-up morno.

## Métricas que o SDR reporta (nunca opera calado)

O SDR manda pro dono um **resumo diário** (e alerta na hora quando algo pede decisão). O resumo:

- **Leads novos** que entraram
- **Em qualificação** (morno, em conversa)
- **Qualificados/quentes** (prontos, precisam do closer)
- **Agendados** (com dia/hora e link da sessão)
- **Sem perfil** (descartados, com motivo)
- **Follow-ups pendentes** pra hoje
- **Alertas:** lead quente parado esperando closer, erro de CRM, gate acionado

Números que importam pro dono (o funil do SDR): leads → qualificados → agendados → (comparece → vira venda, do lado do closer). Taxa de qualificação e taxa de agendamento são o placar do SDR (detalhe em `prospeccao-e-qualificacao.md`). A venda em si é métrica do closer (`soft-vendas-closer`).

## Passagem pro closer (o handoff quente)

Quando o SDR passa o lead qualificado, ele entrega **contexto pronto**, não só "olha, esse tá quente":
- O **diagnóstico** (a dor nomeada, o Problema Avançado, o que já tentou).
- O **BANT** (budget confirmado?, decide?, urgência?).
- O **histórico** relevante (link da conversa no CRM).
- O que **falta** (a objeção que ainda não caiu, se houver).

Isso está na NOTA do contato + na notificação. O closer chega sabendo tudo — é o que faz a sessão converter. Handoff sem contexto joga fora o trabalho do SDR.

## Ritmo humano (o que evita "cara de robô")

- **Uma pergunta/ideia por mensagem.** WhatsApp é troca curta.
- **Não responde no milissegundo** sempre — um respiro curto parece humano (o CRM/canal pode ter delay natural; não force resposta instantânea 24/7 que denuncia o bot).
- **Lê o histórico** — nunca repete pergunta respondida.
- **Espelha o vocabulário do lead** (a Conexão do diagnóstico).
- **Sem textão, sem emoji em excesso, sem "olá! como posso ajudá-lo hoje?"** — fala como gente do método, não como script de call center. Passa pelo filtro anti-IA antes de qualquer mensagem sair.
