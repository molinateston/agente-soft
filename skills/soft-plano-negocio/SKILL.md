---
name: soft-plano-negocio
description: "Monta o PLANO DE NEGÓCIO do especialista do método Soft, a meta, A Conta, a projeção e o roadmap de 90 dias do NEGÓCIO (não a pauta de conteúdo): diagnóstico por número real, A Conta (cabe na vida?), projeção em 3 cenários com premissa escrita, Score de Nicho quando o nicho está em aberto. Âncora, 'planeja meu negócio' = plano-negocio; 'planeja meu mês de conteúdo/pauta' = soft-conteudo-planner. Consolida num só entregável, do que o negócio já produz, nada inventado. Use quando o pedido for 'meu plano de negócio', 'minha projeção', 'por onde começo', 'que meta é realista', 'faz a Conta', 'quantos clientes preciso', 'roadmap', 'plano de 90 dias', 'que nicho escolho', 'quanto vou faturar'. NÃO use para o planejamento do mês de CONTEÚDO/pautas/calendário editorial (soft-conteudo-planner), posicionamento/marca/oferta/PUV/nomear mecanismo (soft-plano-posicionamento), conteúdo/carta/funil/venda (soft-conteudo-*, soft-funil-*, soft-vendas-*), nem o financeiro de back-office (DRE, dívida: soft-financeiro)."
---

**Papel:** skill de negócio do método Soft. Sai de dentro do LEON pra virar peça de primeira: produz o **PLANO DE NEGÓCIO** do especialista, o entregável que ele recebe, reabre e usa como bússola. Junta num só lugar o que hoje sairia espalhado: onde ele está (diagnóstico), a meta, A Conta (cabe na vida?), a projeção em 3 cenários, o Score de Nicho quando o nicho está em aberto, e o roadmap de 90 dias. **Não cria método novo, não inventa número: consolida e projeta a partir do que o negócio do especialista JÁ tem, e onde falta insumo, pergunta ou marca `[A CONFIRMAR]`.** É a etapa "quanto e por onde", a irmã de negócio do posicionamento (que é a alma/marca): quando o pedido é *plano de negócio / projeção / por onde começo*, é aqui; quando é *quem eu sou pro mercado / minha oferta / meu mecanismo*, é a `soft-plano-posicionamento`.

## 📦 O QUE ESTA SKILL PRODUZ

Um **Plano de Negócio** consolidado (um doc MD, ver bloco de ENTREGA abaixo), montado das competências de negócio do método. A espinha do entregável, sempre nesta ordem:

1. **Onde está.** Diagnóstico de partida por número real (faturamento dos últimos 3 meses, mix + ticket de cada oferta, horas reais, investimento em tráfego), estágio nomeado (Destravar, Escalar, Estabilizar, Verticalizar).
2. **A meta.** Meta de CAIXA em 6 meses (o que embolsa, não o que fatura), calibrada contra o teto de crescimento realista do estágio.
3. **A Conta (cabe na vida?).** Meta ÷ ticket = clientes/mês; clientes × horas + produção + venda = horas/semana; se não cabe, **sobe o ticket, nunca o volume**.
4. **A projeção em 3 cenários.** O funil reverso rodado três vezes (conservador 60% de execução, realista 80%, agressivo 100%), cada um com premissa escrita, passado pela régua de realismo antes de mostrar. O realista vira a meta oficial do roadmap.
5. **Score de Nicho** (quando o nicho está em aberto): 5 critérios de 0 a 10, faixa nomeada, a regra do afunilamento. Dá número defensável à decisão de sub-nicho, em vez de decidir no olho.
6. **O próximo passo + o roadmap de 90 dias.** Três meses (Montar e vender, Validar e repetir, Escalar e subir ticket), com objetivo, ações por semana, métrica e **checkpoint** de cada mês, fechando em **3 a 5 próximos passos concretos e datados pra ESSA semana**.

**O que NÃO produz:** posicionamento, oferta, PUV, mecanismo, nome de marca (é `soft-plano-posicionamento`). Peça de conteúdo, carta, funil, script de venda (skills irmãs). Preço/markup, DRE, defesa de dívida (é `soft-financeiro`). A prova é sempre REAL do especialista; nunca número do autor do método, nunca de terceiro, nunca inventado.

---

# SOFT-PLANO-NEGÓCIO: onde está, a meta, a Conta, o próximo passo, o roadmap

## ⚠️ ENTREGA = UM doc MD, SEMPRE (nunca pingar o plano no chat)

Regra dura, vale mesmo pra plano curto: o RESULTADO desta skill sai como **UM documento markdown consolidado**, formato mapa-mental (macro-tópico + bullets com número). No **claude.ai**, um **artifact de markdown** (o dono abre, copia, baixa). No **Claude Code**, um arquivo `.md`; se o dono pedir o plano "bonito" ou publicado, **renderiza como site** reusando o motor da `soft-vendas-proposta` (Layout Soft, link único e privado), com a ID visual do especialista (`soft-designer`). No **agente/Telegram (tem Bash)**, gera o doc como **arquivo .md** e **cita o path completo dele na resposta** (o bridge anexa); a condução vai em mensagens curtas, sem markdown pesado (sem `##`, sem tabela `|` no texto ao usuário, que ficam no doc anexado).

> Regra: `chat → MD · code → site`. Mesmo conteúdo, destino diferente.

A CONDUÇÃO (as perguntas do diagnóstico, as escolhas de ajuste, os STOPs) acontece no chat; o PLANO em si mora no DOC. Ao parar num STOP, você mostra ou atualiza o DOC e pergunta "ajusto?"; você **nunca** reescreve o plano em pedaços no corpo da conversa. Sem o doc entregue, a skill não terminou.

## Duas leis que vêm antes de tudo

1. **Sem número real, não existe plano. Nunca inventa.** Falta o faturamento, o ticket, as horas, o investimento? Pergunta (uma por vez) ou marca `[A CONFIRMAR]`: **jamais calcula com número plausível, jamais usa "média do mercado".** Dado vago vira cálculo vago. Cliente que dá faixa ("uns 8k a 12k"), você pede o número exato: "soma os 3 meses, divide por 3, me dá o número." Vale antes de montar, não só no gate.
2. **Projeção sempre em 3 cenários com premissa escrita.** Nenhum cenário sem premissa (quanto executa, se liga tráfego, se a bola de neve das provas já roda). Sem premissa, projeção é chute com casa decimal. A régua de realismo é obrigatória antes de mostrar (Passo 4).

**Este SKILL.md é o processo inteiro. Siga os passos na ordem, pare nos STOP, e rode o GATE EMBUTIDO (Passo 6) antes de liberar o plano. Quem lê o SKILL.md executa: as references são profundidade, não pré-requisito.**

## Fluxo de operação (siga na ordem)

### Passo 1. GATE dos números (não roda nada sem isso)

Antes de qualquer conta, colete os 5 números do diagnóstico de partida. No mínimo os 4 primeiros antes de projetar. Detalhe e anti-padrões em `references/diagnostico-partida.md`.

1. **Faturamento médio dos últimos 3 meses.** Número exato, não faixa. "Pega os 3 últimos meses fechados, soma o que entrou de cliente pagante, divide por 3."
2. **Mix de oferta atual + ticket de cada.** Cada oferta vendida nos últimos 3 meses, ticket e quantas por mês. Mais de 3 ofertas → corta pra 1 ou 2 (Soft opera Principal + Downsell no máximo).
3. **Meta de CAIXA em 6 meses.** Caixa = o que sobra depois de custo direto e impostos, não receita. "Quanto quer embolsar no mês 6, líquido?"
4. **Horas reais por semana.** Não ideal, real. Já descontando a entrega do cliente atual, a vida, a operação base.
5. **Investimento mensal em tráfego/Turbinar.** Pode ser R$0 (orgânico puro) até qualquer valor.

Com os 5, identifique o **estágio** (é o que calibra o resto):

| Faturamento médio | Estágio | Crescimento máximo realista M6 |
|---|---|---|
| R$0 a R$5k/mês | Pré-Destravar | 5x a 10x (salto sai da inexistência) |
| R$5k a R$15k/mês | Destravar | 3x a 5x |
| R$15k a R$50k/mês | Escalar | 2x a 3x |
| R$50k a R$150k/mês | Estabilizar | 1,5x a 2x |
| R$150k+/mês | Verticalizar | 1,3x a 1,8x |

> **STOP 1:** faltou número essencial (faturamento, ticket, meta, horas)? PARE e colete, uma pergunta por vez, antes de projetar. Não estime, não use média do mercado. Cliente que se recusa a dar os números não está pronto pro plano: respeita, oferece de novo em 2-4 semanas.

**Fronteira do posicionamento:** se o especialista não tem posicionamento cravado (nicho, oferta, mecanismo), o plano projeta em cima do vazio. Avise: *"O plano precisa de posicionamento cravado pra número não virar chute. Roda a `soft-plano-posicionamento` antes, ou seguimos com o ticket-base do que o método sustenta no seu nicho e recalibramos depois."* Se o nicho está em aberto, rode o Score de Nicho (Passo 5) antes de projetar.

### Passo 2. A Conta (cabe na vida? o freio antes da projeção)

Antes de projetar o funil inteiro, a conta mais simples e mais importante: a meta cabe na semana real do especialista?

```
Meta de caixa ÷ ticket médio        = clientes necessários por mês
clientes × horas por cliente
  + horas de produção de conteúdo
  + horas de operação (venda, follow-up, admin)
  + horas de aprendizado
                                     = TOTAL de horas/semana exigidas
```

Compara o total exigido com as horas disponíveis (Passo 1, pergunta 4):

- **Exigido ≤ disponível → cabe.** Segue pra projeção.
- **Exigido > disponível → não cabe.** Aplica um ajuste, **nesta ordem de preferência**:
  1. **Subir o ticket** (preferido: mantém a meta, reduz o volume, melhora o cliente).
  2. **Refazer a esteira** (concentra em 1-2 ofertas premium, o ticket médio sobe; ver `references/esteira-e-conta.md`).
  3. **Baixar a meta** (calibragem, não desistência: "R$35k em 6 meses, R$50k em 12").
  4. **Subir as horas** (último recurso, só por janela ≤ 90 dias, com revisão marcada).

**Não é ajuste aceitável:** trabalhar de madrugada, cortar tempo com família, sacrificar saúde, "vai apertado mas dou conta". Isso é auto-engano; o plano não aceita. Detalhe e faixas de horas por tipo de atendimento em `references/a-conta.md`.

> **STOP 2:** a Conta não fechou? Mostre as 4 opções de ajuste e deixe o especialista escolher, antes de rodar a projeção. Pergunte também, quando a meta exige uma operação pesada: *"olhando esse total de horas e essa meta, você ainda quer isso?"* Às vezes a resposta madura é baixar a meta por escolha.

### Passo 3. A projeção em 3 cenários (o funil reverso, três vezes)

A projeção é o funil reverso: a meta de caixa puxa vendas, conversas, leads, peças, horas, de trás pra frente. O plano roda esse funil **três vezes**, com premissa escrita em cada, pra o especialista ver o piso, o alvo e o teto. A mecânica completa, as taxas-âncora e os exemplos densos por estágio estão em `references/projecao-funil-reverso.md`; a espinha do cálculo:

```
META DE CAIXA (M6) ÷ margem (caixa/receita, ~70%) = RECEITA NECESSÁRIA
  ÷ ticket médio do mix        = VENDAS/mês
  ÷ taxa de fechamento         = CONVERSAS/REUNIÕES realizadas/mês
  ÷ taxa de comparecimento     = CONVERSAS agendadas/mês
  ÷ taxa DM → conversa         = DMs qualificados/mês
  ÷ taxa clique → DM           = CLIQUES na Carta/mês
  ÷ taxa engajamento → clique  = ENGAJAMENTO qualificado/mês
  ÷ taxa alcance → engajamento = ALCANCE qualificado/mês
  ÷ alcance médio por peça     = PEÇAS/mês  ÷ 4 = PEÇAS/semana
  × tempo médio por peça       = HORAS de produção/semana
```

As taxas-âncora saem do Benchmark Soft (`references/projecao-funil-reverso.md`), **faixa baixa por default**. Nunca invente taxa. Se um número intermediário estourar (ex.: "648.000 engajamentos qualificados/mês"), é sinal de premissa irreal: o problema é ticket baixo demais ou nicho pequeno demais, e você volta pra Conta (subir ticket) ou pro Score de Nicho, não força o número.

Os três cenários (as premissas completas em `references/projecao-funil-reverso.md`):

| Cenário | Premissa-chave | O que é |
|---|---|---|
| **Conservador** (piso) | ~60% de execução, orgânico puro, faixa baixa do benchmark, sem alavanca externa | O número que bate mesmo num mês ruim. Dá segurança pra começar. |
| **Realista** (alvo) | ~80% de execução, tráfego crescente, dentro do benchmark, alguma bola de neve | **A meta oficial do roadmap.** Costura com a Conta. |
| **Agressivo** (teto) | execução plena + IA Vertical, tráfego no teto, acima do benchmark, 1 premium/mês | O teto quando tudo dá certo. **Não é promessa.** |

### Passo 4. A régua de realismo (o freio anti-número-inflado, obrigatório)

Depois de rodar os três, confira contra a realidade do especialista ANTES de mostrar:

- **Piso ancorado no atual.** O agressivo não multiplica o faturamento num salto que o nicho não sustenta. Referência: quem faz ~R$15k/mês tem teto realista no agressivo em ~R$80k a R$150k em 12 meses, **não R$500k**. Múltiplo grande demais quebra a credibilidade do plano inteiro.
- **Sem base, sem número.** Projeção que não amarra num benchmark real nem no histórico do próprio especialista é marcada como estimativa e puxada pra baixo.
- **Virou fantasia, corta.** Qualquer cenário que passou a régua do bom senso: corta 30% a 50% e revisa as premissas. Se cortado continua irreal, o problema é ticket baixo demais ou nicho errado → volta pra Conta ou pro Score de Nicho.
- **Casa com o estágio.** O teto de crescimento da tabela do Passo 1 (Destravar 5x, Escalar 3x, Estabilizar 2x, Verticalizar ~1,5-2x) é o limite de cima. Agressivo que estoura o teto é cortado, com o aviso: *"esse patamar o método não cobre em 6 meses; realista é X agora + Y nos 6 seguintes."*

Saída: uma tabela com os três cenários (faturamento M6 + anual) + a curva mês a mês do realista. Prosa mínima, número protagonista.

### Passo 5. Score de Nicho (só quando o nicho está em aberto)

Rode quando o especialista está em cima do muro entre nichos, ou o nicho atual parece raso. **Não substitui a pesquisa profunda da `soft-plano-posicionamento`** (essa é a fundação); dá um número defensável à decisão de sub-nicho que hoje se faz no olho. Detalhe e exemplo denso em `references/score-de-nicho.md`. Cada critério de 0 a 10, soma de 0 a 50:

1. **Dor Latente:** quão aguda é a dor. (8-10: busca solução ativa, paga rápido.)
2. **Disposição a Pagar:** o mercado paga bem, tem caso de ticket alto? (8-10: premium é regra.)
3. **Recorrência:** compra de novo, cabe assinatura/continuado? (8-10: fica meses/anos.)
4. **Conexão Pessoal:** história, vivência, expertise real no nicho? (8-10: vive o nicho.)
5. **Tamanho e Concorrência:** grande o bastante, tem brecha pra entrar? (8-10: espaço aberto.)

**Faixas:** 0-20 ruim (repensar) · 21-30 fraco (só com argumento forte) · 31-40 bom (seguir com confiança) · 41-50 ouro (foco total).

**A regra do afunilamento:** nicho macro quase sempre pontua fraco ou bom (por saturação). Pra chegar em ouro, **estreita**: sai do macro genérico pro sub-nicho específico, dor mais aguda, disposição a pagar maior. **Trava do Critério 4:** nota alta com conexão pessoal baixa (0-3) volta pra mesa, não vira posicionamento fictício. Sem conexão real, sem nicho.

### Passo 6. GATE EMBUTIDO (preencha, imprima e só então libere o plano)

Antes de entregar o plano, preencha a tabela abaixo **no próprio output** (é o artefato visível obrigatório) e leia o VEREDITO. Qualquer ✗ reprova: corrija e repreencha.

| Check | Passa se (✓) | ✓/✗ |
|---|---|---|
| **Número real, não inventado** | Todo cálculo parte de número que o especialista deu; o que faltou está marcado `[A CONFIRMAR]`, nunca preenchido com plausível nem "média do mercado" | |
| **3 cenários com premissa** | A projeção tem os três (conservador/realista/agressivo), cada um com a premissa escrita do que muda entre eles | |
| **Régua de realismo aplicada** | O agressivo está ancorado no atual e no teto do estágio; nada quebrando credibilidade (sem 30x, sem R$500k pra quem faz R$15k). Fantasia foi cortada 30-50% | |
| **A Conta fecha (ou tem ajuste)** | Meta ÷ ticket → clientes → horas confere com as horas disponíveis; se não coube, tem o ajuste escolhido (ticket primeiro, nunca volume) | |
| **Nicho com conexão** (se rodou Score) | Nenhum nicho recomendado com Critério 4 (conexão) baixo. Score alto + conexão baixa volta pra mesa | |
| **Roadmap fecha com próximos passos** | O plano fecha com 3 a 5 ações concretas e datadas pra ESSA semana. Nunca "estudar mais" ou "pensar melhor" | |
| **Marca-neutra** | Cor, fontes, logo e prova são do especialista (da Fundação dele). Zero número do autor do método, zero de terceiro, zero inventado | |
| **Anti-IA (HARD, com PROVA)** | Rode o CTRL+F e cole o RESULTADO COMO NÚMERO na célula, não um "ok". Ex.: `—: 0 em prosa · travar/destravar (e flexões destrava/destravam/destravou): 0`. Zero travessão "—" em frase de copy; zero da família "travar/travado/destravar" incluindo flexões, título incluso; sem frase-emoldura ("a verdade é", "o segredo"); sem verbo-clichê ("revoluciona, transforma"). **Número em prosa > 0 = VEREDITO ✗ automático, sem exceção nem justificativa qualitativa.** | |
| **VEREDITO** | **= o PIOR item acima.** Um ✗ qualquer = REFAZ. Só tudo-✓ = LIBERA o plano | |

> **STOP 3:** mostre o plano com a tabela do gate preenchida e pergunte se serve ou se quer ajuste, antes de dar por encerrado. Produz → mostra → espera OK.

---

## Como o LEON aponta pra cá (a fronteira)

O LEON (o Sócio IA) **aponta pra esta skill** quando o pedido é de negócio:

- "meu plano de negócio", "consolida tudo num plano", "monta o plano fechado" → é aqui.
- "minha projeção", "quanto vou faturar", "faz a Conta", "quantos clientes preciso" → é aqui.
- "por onde começo", "que meta é realista", "roadmap", "plano de 90 dias", "onde estou na jornada" → é aqui.
- "que nicho escolho", "meu nicho vale a pena", "vale estreitar?" → é aqui (Score de Nicho).

**O que NÃO é desta skill** (o LEON aponta pro lugar certo):

- Quem eu sou pro mercado, minha marca, minha oferta, minha PUV, nomear meu mecanismo, meu tom de voz → **`soft-plano-posicionamento`** (a fundação/alma; esta skill é a irmã de negócio, o "quanto e por onde").
- Conteúdo (carrossel, reel, stories, headline), carta/VSL, landing, funil, script de venda/objeção → skills irmãs **`soft-conteudo-*` / `soft-funil-*` / `soft-vendas-*`**.
- Preço/markup/margem, DRE, fluxo de caixa, capital de giro, defesa de dívida/banco, MEI/Simples → **`soft-financeiro`** (back-office; esta skill projeta o negócio, não faz a contabilidade dele).
- A proposta comercial materializada em site pós-call → **`soft-vendas-proposta`** (esta skill reusa o motor de site dela quando o dono pede o plano publicado, mas não é a proposta de venda).

---

## Regras inegociáveis

1. **Sem número real, não existe plano.** Não inventa, não estima, não usa média do mercado. Falta → pergunta ou `[A CONFIRMAR]`.
2. **Projeção sempre em 3 cenários com premissa escrita**, e a régua de realismo antes de mostrar. Sem premissa, é fantasia.
3. **A Conta antes da projeção detalhada.** Se não cabe na vida, sobe o ticket primeiro, nunca o volume. Não aceita ajuste que sacrifica vida/saúde/família.
4. **Nicho sem conexão real não vira posicionamento.** Score alto com Critério 4 baixo volta pra mesa.
5. **Roadmap fecha com 3-5 próximos passos concretos e datados** pra ESSA semana. Cliente sai com tarefa, não com teoria.
6. **Marca-neutra.** Cor, fontes, logo e prova são do especialista. Nunca os números do autor do método, nunca de terceiro, nunca inventar.
7. **Não cria método novo.** Consolida e projeta o que o negócio já tem, e entrega como UM doc MD (não pinga no chat).
8. **Português, tom clínico e direto, sem motivacional.** Tabela e número acima de prosa. O plano é bússola, não relatório de 30 páginas: cabe em 1 página visual.

---

## When NOT to Use (manda pro caminho certo)

- Pediu **posicionamento, marca, oferta, PUV, mecanismo, tom de voz** → `soft-plano-posicionamento`. Esta skill projeta o negócio; não define quem ele é pro mercado.
- Pediu **conteúdo, headline, carta, VSL, landing, funil, script de venda** → `soft-conteudo-*` / `soft-funil-*` / `soft-vendas-*`.
- Pediu **preço/markup, DRE, fluxo de caixa, capital de giro, dívida, regime tributário** → `soft-financeiro`. Esta skill projeta o faturamento; não faz a contabilidade nem a defesa financeira.
- Pediu a **proposta comercial em site pós-call** (o vendedor silencioso do prospect) → `soft-vendas-proposta`.
- Pediu **estratégia de 12+ meses / planejamento de 3 anos** → o método opera em 6 meses; explique e ofereça o plano de 90 dias + a curva de 6 meses no lugar.
- **Não tem os números** (faturamento, ticket, meta, horas) → não projeta: coleta primeiro, uma pergunta por vez. Sem número, sem plano.

## Anti-Patterns (sintoma → correção)

| Sintoma | Correção |
|---|---|
| Projetou com "média do mercado" ou número plausível pra faltante | Volta pro real: pergunta o número exato ou marca `[A CONFIRMAR]`. Sem número real, não calcula |
| Deu um cenário único ("você vai faturar R$X") | Roda os 3 cenários com premissa escrita em cada; o realista vira a meta do roadmap |
| Agressivo inflado (30x, R$500k pra quem faz R$15k) | Aplica a régua de realismo: ancora no atual + teto do estágio, corta 30-50%, revisa premissa |
| Meta não cabe na vida e mandou "trabalhar mais" | Aplica a Conta: sobe o ticket primeiro, nunca o volume; nunca sacrifica vida/saúde/família |
| Recomendou nicho com Score alto mas conexão pessoal baixa | Trava do Critério 4: volta pra mesa. Sem conexão real, sem nicho |
| Roadmap fechou com "estudar mais", "pensar melhor" | Fecha com 3-5 ações concretas e datadas pra ESSA semana |
| Usou número do autor do método / de terceiro / inventado como prova | Marca-neutra: só número REAL do especialista, da Fundação dele |
| Pingou o plano em pedaços no chat | Um doc MD consolidado (artifact no claude.ai, arquivo no Code, arquivo + path no agente). A condução no chat, o plano no doc |
| Virou plano de estratégia de 3 anos | O método opera em 6 meses: 90 dias cravados + curva de 6 meses. Não projeta horizonte que o método não cobre |
| Travessão "—" em frase de copy, ou "travar/destravar" e flexões em qualquer lugar, título incluso | Reprova no gate Anti-IA (HARD): reescreve sem "—" e sem a família "travar". CTRL+F com número > 0 = ✗ automático |

## References (profundidade; o fluxo acima é autossuficiente)

- `references/diagnostico-partida.md`: as 5 perguntas duras, como tratar resposta vaga, como identificar o estágio, os 3 casos de plano inviável.
- `references/a-conta.md`: A Conta em 4 etapas, os 4 ajustes em ordem, as faixas de horas por tipo de atendimento, calibragem por estágio, quando refazer.
- `references/projecao-funil-reverso.md`: a mecânica completa do funil reverso, o Benchmark Soft (taxas por etapa, faixa baixa/alta, sinal de vazamento), as premissas dos 3 cenários, exemplos densos por estágio (Escalar e Destravar), como tratar mix/Turbinar/IA Vertical.
- `references/score-de-nicho.md`: os 5 critérios detalhados com as faixas de nota, as faixas do score, a regra do afunilamento, a trava do Critério 4, exemplo denso (dentistas → clínica de implante).
- `references/roadmap-90-dias.md`: os 3 meses (Montar e vender · Validar e repetir · Escalar e subir ticket) semana a semana, com objetivo, ações, métricas e checkpoint; o fechamento com 3-5 próximos passos; o que muda por estágio; a ponte pros meses 4-6.
- `references/esteira-e-conta.md`: a esteira mínima viável (1-2 ofertas), os 2 formatos, os tickets recomendados, como a esteira se calibra pela meta (o ajuste 2 da Conta).
- `references/entregavel-e-output.md`: o esqueleto do doc consolidado (a ordem das seções), a adaptação de output ao ambiente (chat MD / code site / agente arquivo+path), os invioláveis do entregável.
