# Perpétuo vs ao vivo - os 2 modos, multi-horário, escassez por sessão e o que muda na mensageria

> **Quando consultar (dentro da skill soft-webinar-mensagens):** no **Passo 1**, depois de o especialista dizer se a régua é AO VIVO ou PERPÉTUO. É aqui que mora a diferença de TIMING entre os dois modos (datas absolutas vs relativas ao cadastro), a **escassez por SESSÃO** que o perpétuo usa no lugar da escassez de evento, o **multi-horário** (que muda a cadência das mensagens), o **link individual por lead** (o que faz o perpétuo parecer ao vivo) e as **métricas do perpétuo já no ar** (pra diagnosticar antes de culpar a copy).

> **Fronteiras (o que NÃO mora aqui — manda pra skill certa):**
> - **A mecânica crua de referência** (validar ao vivo, 150-200 valida / 8-15 grava, ~10% de sinal verde, sala = sessão estratégica, ROAS-rei, otimizar tráfego pra venda, escala horizontal, zerar ROAS, high ticket não fecha sozinho): `perpetuo-mecanica.md` (a reference irmã, copiada junto nesta skill). As falas literais de referência vivem lá.
> - **Gravar/editar o vídeo, conduta de sala, chat semeado, setup técnico, plataforma (EverWebinar × WebinarKit) e edição** → **soft-webinar-script** / **soft-webinar-plano** (pacote). Esta skill só escreve a COPY das mensagens; não grava, não edita, não configura player.
> - **Oferta/escassez/Q&A na AULA** → **soft-webinar-plano** e **soft-webinar-script**. Aqui a escassez aparece só como o que a MENSAGEM pode dizer (eco da escassez da sessão, nunca uma nova).
> - **Páginas de cadastro/obrigado/checkout** → **soft-funil-landing**.
> - **Montagem da máquina de pós** (tags, marcos de %, roteamento de CRM) → **soft-webinar-mensagens**.

> Destilado de: MANUAL-COMPLETO cap 00 e cap 13; MANUAL-WEBINAR-SOFT Cap 13 ("Perpetuar"). Falas literais marcadas com origem. Exemplos de nicho alheio marcados EXEMPLO, didáticos, nunca pra decalcar.

---

## Índice

- A decisão central: 3 modos, e o porquê do perpétuo Soft
- O que MUDA na mensageria entre AO VIVO e PERPÉTUO (a tabela-mãe da skill)
- A escassez do perpétuo é por SESSÃO, não por calendário
- O link individual por lead (o que faz o perpétuo parecer ao vivo)
- Multi-horário - a frequência que muda a cadência das mensagens
- Métricas do perpétuo já no ar (diagnóstico antes de culpar a copy)
- A regra dos 90% (o guarda-corpo que a mensageria não cobre)
- Quando o perpétuo NÃO funciona (fica no ao vivo recorrente)

---

## A decisão central: 3 modos, e o porquê do perpétuo Soft

Webinar roda em três modos. A diferença não é técnica, é o que cada um ganha e o que cada um perde:

| Modo | Quando usar | O que prende | O que abre |
|------|-------------|--------------|-----------|
| **Ao vivo único** | Validação, lançamento de evento | Energia toda concentrada num dia; precisa de você | FOMO real, presença alta, Q&A genuíno |
| **Ao vivo recorrente** | Audiência média, ticket alto, capacidade limitada | Cansa, não escala, depende de você toda vez | Toque humano, conversão alta |
| **Perpétuo** | Pós-validação, escala | Sem você na sala; converte um pouco menos por sessão | Roda 24/7 sem você, vende enquanto você dorme |

**O workflow Soft é sempre o mesmo:** ao vivo de validação → sessão de gravação → perpétuo. Nunca o contrário. (Números e falas dessa sequência vivem em `perpetuo-mecanica.md`.)

**Por que perpétuo, e não VSL.** O perpétuo Soft não é "clica e assiste já". É o gravado desenhado como **sessão estratégica marcada** (horário escolhido, escassez de sala real, sensação de reunião 1:1 em escala). É isso que faz ele converter mais que VSL — e é exatamente o que a mensageria do perpétuo sustenta: as mensagens é que criam a sensação de "marquei com ele". O instant-watch/VSL puro não tem compromisso, não tem escassez, não tem o "marquei", e por isso converte menos (1-3%) e não serve a ticket alto.

> **A altitude antes da operação (cap 00).** "Webinário é uma aula online, feita de uma forma específica, que roda todo dia e vende no final. Não é live, não é vídeo de YouTube, não é lançamento." A diferença é o **ambiente**: dentro da ferramenta a pessoa só tem o vídeo, o chat e, na hora certa, a oferta vira botão. A mensageria existe pra **levar a pessoa pra dentro desse ambiente** (régua de antes), **segurar lá** (toques de durante) e **trazer de volta** (régua de pós).

---

## O que MUDA na mensageria entre AO VIVO e PERPÉTUO (a tabela-mãe da skill)

A **estrutura** das mensagens é a mesma (antes / durante / pós, em `sequencias-email-whatsapp-pre-pos.md`). O que muda é o **timing**, a **escassez** e a **forma do link**. Esta é a tabela que a skill aplica depois de saber o modo:

| Eixo | AO VIVO | PERPÉTUO |
|---|---|---|
| **Timing dos disparos** | **Datas absolutas** (a régua inteira ancora numa data/hora única do evento: "quarta, 19h"). Todo mundo recebe no mesmo relógio. | **Datas relativas ao cadastro de CADA lead** (faltam 24h / 1h / 5 min contadas a partir da sessão que aquele lead escolheu). Cada um na sua linha do tempo. |
| **Reconvite de quem faltou** | Pra a **próxima edição do evento** (nova data marcada). | Pra **outra sessão** do mesmo perpétuo (o lead remarca um novo horário). Nunca "assista a gravação" — não existe replay. |
| **Escassez que a mensagem cita** | Escassez **real de evento**: vaga limitada da sala, "é hoje, não tem outra essa semana", o bônus que sai quando o evento acaba. | Escassez **por condição da sessão / por timer da oferta**: "se essa aula acabar, acabou essa oferta", o bônus que vale só nessa sessão. NUNCA um timer de calendário fake ("só até sexta") — isso queima a máquina no perpétuo. |
| **Link da sala (5 min antes)** | Link **único do evento** (todos entram na mesma sala). | Link **individual por lead** (modelo cinema: cada um na sua sessão). É esse link que faz o perpétuo parecer ao vivo. |
| **Toques de DURANTE** | Disparados no relógio do evento (min ~25 e min ~50 reais). | Disparados em **offset relativo** ao início da sessão daquele lead (a plataforma agenda min 25 / min 50 a partir do horário que ele marcou). |
| **Régua de pós** | Janela de fechamento ancorada no fim do evento (1h / 12h / 24h / 48h / 72h depois do horário único). | Mesma janela, mas relativa ao fim da SESSÃO de cada lead; + a **esteira semanal sincronizada** (represa todos até segunda 9h) é o que cria um "último dia" coletivo real mesmo sem evento — é onde a maioria das vendas perpétuas acontece. |
| **Conversão-alvo do pós** | 10%+ (lead → compra) — o calor do evento ajuda. | 5%+ (lead → compra) — converte um pouco menos por sessão, compensa no volume 24/7. |

**Regra de ouro do modo:** no perpétuo, **nada na mensagem pode DATAR** (sem "hoje é sexta", sem "essa semana", sem nome de mês). Uma mensagem que data denuncia que é automático e inverte a confiança na 3ª semana. No ao vivo, datar é exatamente o que cria a urgência — pode e deve.

---

## A escassez do perpétuo é por SESSÃO, não por calendário (desenho canônico)

O único desenho honesto de escassez que roda em loop infinito: a oferta acaba quando a AULA acaba, e o produto continua comprável depois por mais caro — não se mente estoque nem se finge um timer de calendário.

> **EXEMPLO (verbatim, pele de referência / nutrição — ver `exemplos-por-bloco/12-escassez-urgencia-cta.md`):** "se acabar essa aula, bicho, acabou tua chance, você não vai mais conseguir essa oferta […] você até consegue comprar ele depois mas você vai comprar no mínimo por 997, tô te dando R$200 de desconto aqui." A urgência é atrelada à SESSÃO ("se essa aula acabar, acabou") — perfeita pra evergreen, porque a condição é da sessão e não do calendário.

**O que isso significa pra a COPY das mensagens (o que a skill escreve):**
- O WhatsApp do **min 50** (oferta abriu) diz "vale só nessa sessão", não "vale só hoje".
- O e-mail/WhatsApp de **1h depois** diz "o bônus de ação rápida ainda vale por mais X horas" contadas da sessão daquele lead, não de um relógio global.
- O **last call** e o **fechamento** recaem nos **bônus** ("o método continua à venda, mas sem os extras"), nunca num prazo de calendário inventado.
- **Anti-padrão nomeado:** timer de calendário fake em perpétuo é o erro que queima a máquina. (Desenho completo no bloco 12.)

---

## O link individual por lead (o que faz o perpétuo parecer ao vivo)

No perpétuo, o link da sala que vai no WhatsApp 5 min antes é **individual** — modelo cinema, cada um na sua sessão. A plataforma passa nome/horário/link-único pra automação, que entrega no WhatsApp via API. A mensagem chega com o link exato da sessão que aquela pessoa escolheu. É isso, mais a escassez por sessão e a sensação de "marquei com ele", que faz o gravado parecer ao vivo.

> Implicação pra a skill: o molde do **WhatsApp 4** (5 min antes) e dos **toques de durante** usam `[link individual do lead]` no perpétuo, e `[link da sala do evento]` no ao vivo. A voz "já tem gente na sala, só falta você, vem" funciona nos dois.

---

## Multi-horário - a frequência que muda a cadência das mensagens

A frequência mexe em três alavancas: **volume** (mais horários, mais audiência), **exclusividade percebida** (mais frequente, menos especial) e **custo de anúncio** (multi-horário melhora a entrega). **No que importa pra a mensageria:** a frequência decide quão CURTA é a janela entre cadastro e sessão — e isso governa a régua de antes (quantos lembretes cabem e a que distância).

### O padrão Soft, da fala de referência: 4 horários por dia

"Rodam quatro horários por dia. Já testamos rodar dois, já testamos rodar um, já fizemos uma vez na semana." **4/dia foi o que ficou em pé** — volume suficiente sem matar a sensação de evento. EXEMPLO instanciado (pele Soft): **9h / 11h / 14h / 19h**. Ancore os horários em quando o **seu** avatar decide comprar, não em preferência.

### As opções (e o que cada uma faz com a régua de antes)

| Frequência | Quando | Janela cadastro→sessão | O que muda na mensageria |
|---|---|---|---|
| **1x/semana** | validação sem volume, ticket muito alto | até 6 dias | régua de antes LONGA (cabe reaquecimento extra; o lead esfria, precisa de mais toques) |
| **Diário** | volume médio (50-200/sem) | ~1 dia | régua padrão (24h / 1h / 5 min encaixa redondo) |
| **Just-in-time (15/30/60 min)** | volume alto (200+/sem), tráfego frio | < 60 min | régua COMPRIMIDA: quase só "faltam X min" + link; não há tempo pra e-mail de 24h. O WhatsApp carrega tudo |
| **VSL/instant-watch puro** | ultra-frio, ticket baixo | zero | sem régua de antes (assiste na hora); perde o frame de evento, converte menos, não serve a ticket alto |

> **Regra de bom senso (Cap 13):** just-in-time agressivo (a cada 15 min) só com volume real (300+/sem). E **mesmo no multi-horário, o lead ESCOLHE o horário** — é a escolha que cria o compromisso e derruba o no-show. As mensagens de confirmação reforçam essa escolha ("você marcou pra [horário que ele escolheu]"). Multi-horário sem a escolha vira VSL com mais aviso.

---

## Métricas do perpétuo já no ar (diagnóstico antes de culpar a copy)

Quando os números desabam, o furo quase sempre é técnico (encanamento), não a copy. Faixas do perpétuo no ar:

| Métrica | Faixa saudável (perpétuo) | Sinal de alerta | O que olhar |
|---------|---------------------------|-----------------|-------------|
| Cadastrados → compareceram | **30-40%** (fala de referência, varia com a época) | Abaixo de 30% | sequência PRÉ fraca: revisar e-mail/WhatsApp e a promessa da captura — **e conferir se o WhatsApp está ligado** (é a maior alavanca de comparecimento) |
| Tempo médio de retenção | 50-70% | Abaixo de 45% | algum bloco da AULA vaza (não é a mensagem) → soft-webinar-script |
| Comparece → compra | **~6% piso de saúde** (médio ticket) | Abaixo disso | "ou o COP está errado, ou o ticket não fecha a conta" (o autor do método) → oferta/aula |
| ROAS dos anúncios | **2,2-4** | Abaixo de 1,5x | anúncio/público/pixel → soft-conteudo-impulsionar |

> **A leitura que importa pra a mensageria:** comparecimento abaixo da faixa = primeiro suspeito é o **WhatsApp não ligado** ou a régua de antes fraca (são o que esta skill resolve). Conversão de pós abaixo = checar se a tag por % assistido está roteando certo (quem viu a oferta recebe fechamento; quem saiu antes recebe nutrição). Retenção e conversão-na-sala baixas NÃO são problema de mensagem — são da aula/oferta; não reescreva mensagem pra consertar a aula.

---

## A regra dos 90% (o guarda-corpo que a mensageria não cobre)

Webinar perpétuo gravado **sem validar ao vivo antes** tem ~90% de chance de não converter. A mensageria mais cravada do mundo não salva um webinar não validado. Antes de montar a régua do perpétuo, confirme que o webinar foi **validado ao vivo** (a fase 1/2 do `perpetuo-mecanica.md` aconteceu). Se o especialista está montando a régua pra um perpétuo nunca testado ao vivo, **avise**: a régua sobe, mas o risco mora na aula não validada, não nas mensagens. (Não é cautela, é o número.)

---

## Quando o perpétuo NÃO funciona (fica no ao vivo recorrente)

Casos em que perpetuar é o erro — e a skill entrega a régua AO VIVO no lugar:

1. **Audiência sofisticada que detecta gravação** (executivos, mercado financeiro maduro) — o perpétuo soa falso e o sinal inverte.
2. **Produto que evolui rápido** (preço/oferta/garantia mudando todo mês) — o perpétuo desatualiza e a regra de atemporalidade não segura.
3. **Vendedor que converte muito melhor ao vivo** — não force o gravado por escala se a energia dele só existe ao vivo.
4. **Volume baixo** (menos de ~30 leads/sem) — perpétuo desperdiça anúncio numa sala vazia. Faz ao vivo, ganha 1-a-1.
5. **High ticket sem comercial montado** — o perpétuo high ticket QUALIFICA, não fecha; sem CRM + comercial pra receber a aplicação, não abra.

> **EXEMPLO (não perpetuar ainda, nicho de mercado financeiro/executivos).** Player com audiência C-level, ticket R$50k, vende consultoria 1:1, volume baixo, audiência que detecta gravação, vendedor que fecha melhor ao vivo. Régua = **ao vivo recorrente 1x/mês** + comercial 1:1, NÃO perpétuo. O perpétuo aqui queimaria a credibilidade que o ticket exige.
