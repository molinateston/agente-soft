# Cálculo do Caixa ao Conteúdo, Mecânica do Funil Reverso

A mecânica que transforma "quero embolsar R$Xk/mês em 6 meses" em "produzo Y peças/semana com Z horas de produção". Cálculo de trás pra frente, etapa por etapa, usando Benchmark Soft como referência inicial.

**Princípio raiz:** conteúdo é variável dependente da meta. Não é decisão criativa solta. Cliente que produz "o que dá" e torce pro número bater não opera Soft, opera ansiedade.

---

## Índice

- A fórmula completa
- Variáveis e benchmarks aplicados (faixa baixa por default)
- Exemplo prático, Cliente Escalar (R$25k → R$60k em 6 meses)
- Exemplo prático, Cliente Destravar (R$8k → R$25k em 6 meses)
- Como tratar mix de oferta no cálculo
- Como tratar Turbinar no cálculo
- Como tratar IA Vertical no cálculo
- Saída final do cálculo
- Princípio final do cálculo

---

## A fórmula completa

```
META DE CAIXA MENSAL (M6)
    ÷ margem de caixa (caixa/receita)
= RECEITA MENSAL NECESSÁRIA

    ÷ ticket médio do mix
= VENDAS POR MÊS

    ÷ taxa fechamento (reunião → venda)
= REUNIÕES/CONVERSAS REALIZADAS POR MÊS

    ÷ taxa comparecimento (agendada → realizada)
= REUNIÕES/CONVERSAS AGENDADAS POR MÊS

    ÷ taxa agendamento (DM → reunião agendada)
= DMs QUALIFICADOS POR MÊS

    ÷ taxa Carta → DM (cliques que viram DM)
= CLIQUES NA CARTA POR MÊS

    ÷ taxa engajamento → clique
= ENGAJAMENTO QUALIFICADO POR MÊS

    ÷ taxa alcance → engajamento qualificado
= ALCANCE QUALIFICADO POR MÊS

    ÷ alcance médio por peça
= PEÇAS POR MÊS

    ÷ 4 semanas
= PEÇAS POR SEMANA

× tempo médio por peça
= HORAS DE PRODUÇÃO POR SEMANA
```

---

## Variáveis e benchmarks aplicados (faixa baixa por default)

| Variável | Benchmark Soft (faixa baixa) | Onde vem |
|---|---|---|
| Margem de caixa | 70% | Padrão Soft (especialista solo, baixo custo direto) |
| Taxa fechamento Principal | 30% | `benchmark-soft.md` Etapa 7 |
| Taxa comparecimento | 70% | `benchmark-soft.md` Etapa 6 |
| Taxa agendamento (DM→reunião) | 25% | `benchmark-soft.md` Etapa 6 |
| Taxa Carta → DM | 5% | `benchmark-soft.md` Etapa 4 |
| Taxa engajamento → clique | 1% | `benchmark-soft.md` Etapa 3 |
| Taxa alcance → engajamento qualificado | 3% | `benchmark-soft.md` Etapa 2 |
| Alcance médio por peça | 1.500 | `benchmark-soft.md` Etapa 1 (faixa baixa Reel) |
| Tempo médio por peça | 60 min (Carrossel) / 30 min (Reel) / 15 min (Stories) | Padrão Soft com IA Vertical |

---

## Exemplo prático, Cliente Escalar (R$25k → R$60k em 6 meses)

### Inputs do diagnóstico
- Faturamento atual: R$25.000/mês
- Mix atual: 80% Principal (R$3.500) + 20% Downsell (R$497)
- Meta caixa M6: R$60.000/mês
- Horas disponíveis: 12h/semana
- Turbinar: R$1.500/mês

### Cálculo

```
Meta caixa M6: R$60.000
÷ margem 70%
= Receita necessária M6: R$85.700

Mix sugerido (Escalar): 70% Principal + 30% Downsell
- 70% × R$85.700 = R$60.000 em Principal
- 30% × R$85.700 = R$25.700 em Downsell

Vendas/mês:
- Principal: R$60.000 ÷ R$3.500 = 17 vendas
- Downsell: R$25.700 ÷ R$497 = 52 vendas

Reuniões realizadas (só Principal - Downsell é fluxo passivo):
17 ÷ 30% = 57 reuniões/mês

Reuniões agendadas:
57 ÷ 70% = 81 reuniões agendadas/mês

DMs qualificados:
81 ÷ 25% = 324 DMs/mês

Cliques na Carta:
324 ÷ 5% = 6.480 cliques/mês

Engajamento qualificado total:
6.480 ÷ 1% = 648.000 engajamentos qualificados/mês
[ALERTA: número absurdo - recalibra]
```

### Recalibragem, sinal de inviabilidade

648.000 engajamentos qualificados/mês significa que o cálculo bateu em premissa irreal. Soft tem 3 ajustes possíveis:

1. **Subir taxa engajamento → clique** de 1% pra 2-3% (peça com ponta filtrante mais forte)
2. **Subir taxa Carta → DM** de 5% pra 10% (Carta mais cirúrgica)
3. **Reduzir meta** ou estender prazo

Vamos refazer com taxas medianas (não faixa baixa cega):

```
6.480 cliques ÷ 2% (engajamento → clique mediano) = 324.000 engajamentos
324.000 ÷ 3% (alcance → engajamento) = 10.800.000 alcance
[AINDA absurdo - Posicionamento precisa de público maior ou ticket precisa subir]
```

### Diagnóstico final

A skill identifica:
> *"Pra bater R$60k caixa em 6 meses com ticket Principal R$3.500, você precisa de 17 vendas Principal/mês. Volume de alcance necessário é incompatível com Posicionamento atual em 6 meses solo. Opções:
>
> 1. Subir ticket Principal pra R$5.000+ (reduz volume necessário em 30%)
> 2. Estender prazo pra 9-12 meses
> 3. Reduzir meta pra R$45k caixa em 6 meses (12 vendas Principal)
> 4. Configurar IA Vertical pra escalar produção sem queimar humano
>
> Qual ajuste topa?"*

---

## Exemplo prático, Cliente Destravar (R$8k → R$25k em 6 meses)

### Inputs
- Faturamento atual: R$8.000/mês
- Mix atual: 100% Principal (R$2.400, mas ticket inconsistente)
- Meta caixa M6: R$25.000/mês
- Horas: 15h/semana
- Turbinar: R$0 (orgânico puro)

### Cálculo

```
Meta caixa: R$25.000
÷ margem 75% (Destravar tem custo ainda mais baixo)
= Receita: R$33.300

Mix sugerido (Destravar): 50% Principal (ticket R$2.500) + 50% Downsell (R$497)
- 50% × R$33.300 = R$16.650 em Principal
- 50% × R$33.300 = R$16.650 em Downsell

Vendas:
- Principal: R$16.650 ÷ R$2.500 = 7 vendas/mês
- Downsell: R$16.650 ÷ R$497 = 33 vendas/mês

Reuniões realizadas: 7 ÷ 30% = 23 reuniões/mês
Agendadas: 23 ÷ 70% = 33/mês
DMs qualificados: 33 ÷ 25% = 132/mês

[Lead morno pra Downsell flui em paralelo: 33 vendas Downsell × 1/15% = 220 leads mornos]

Cliques Carta: 132 ÷ 5% = 2.640/mês
Engajamento qualificado: 2.640 ÷ 1% = 264.000
[Ainda alto - recalibra com 2%]

Refaz: 132 DMs → 1.320 cliques → 132.000 engajamentos
[Ainda alto - sinal que cálculo bate em mercado de massa]

Refaz com 4% engajamento → clique (cliente Destravar tem público mais quente, taxa maior)
132 DMs → 660 cliques (com taxa Carta→DM 20% pra Destravar) → 33.000 engajamentos
33.000 ÷ 5% (alcance→engajamento, faixa alta) = 660.000 alcance qualificado/mês
÷ 1.500 alcance/peça = 440 peças/mês = 110/semana
[Inviável solo]
```

### Diagnóstico

Skill aponta que volume necessário é insustentável e oferece 3 ajustes:

> *"Pra R$25k caixa em 6 meses partindo de R$8k, com ticket atual R$2.500, volume de produção é insustentável solo (110 peças/semana).
>
> Ajustes possíveis:
>
> 1. **Subir ticket Principal** pra R$3.500 → reduz volume pra 50 peças/semana
> 2. **Adicionar Turbinar R$500/mês** desde M2 → reduz volume orgânico pra 25 peças/semana
> 3. **Estender prazo** pra 9 meses → volume cai pra 18 peças/semana
> 4. **Mix mais agressivo no Downsell** (70% Downsell), volume Downsell escala mais barato"*

Cliente escolhe combinação. Skill recalcula.

---

## Como tratar mix de oferta no cálculo

### Regra geral

Mix tem 2 ofertas: Principal + Downsell. Skill calcula funis SEPARADOS e SOMA no topo.

### Funil Principal
- Reunião realizada → fechamento (taxa Soft 30-60%)
- Lead com mais maturidade, ticket maior, ciclo mais longo

### Funil Downsell
- Geralmente sem reunião, fluxo passivo via Carta + CTA da bio
- Taxa de conversão direta da Carta: 5-15% (lead morno → compra)
- Pode ser ativado com Story de Oferta + DM qualificado convertendo direto

### Quando somar e quando separar

**Soma na Etapa Topo (alcance + engajamento):** sim. Mesma audiência alimenta os dois funis.

**Separa nas Etapas Conversão (DM → reunião → fechamento):** sim. Pra Principal, calcula reuniões. Pra Downsell, calcula vendas direto sem reunião (fluxo passivo).

---

## Como tratar Turbinar no cálculo

Turbinar não substitui orgânico. É **acelerador de peça que já validou organicamente**.

### Regra Soft
- Mês 1-2: 100% orgânico. Sem Turbinar.
- Mês 3+: começa Turbinar APENAS em peças que já tiveram engajamento qualificado acima do benchmark organicamente.

### Cálculo do impacto

Cada R$ em Turbinar adiciona alcance qualificado. Faixa Soft:

| Investimento Turbinar/mês | Alcance qualificado adicional/mês |
|---|---|
| R$500 | +5.000 a +15.000 |
| R$1.500 | +18.000 a +50.000 |
| R$3.000 | +40.000 a +100.000 |
| R$8.000+ | Estruturado em gerenciador, não só Turbinar |

Skill subtrai esse alcance adicional do volume orgânico necessário e recalcula peças/semana.

**Anti-padrão:** subir Turbinar antes de validar peça organicamente = queima dinheiro. Skill bloqueia esse cálculo no M1-M2.

---

## Como tratar IA Vertical no cálculo

IA Vertical reduz **tempo médio por peça**. Não muda taxas do funil.

### Tempo médio por peça (sem IA Vertical)

| Tipo de peça | Tempo médio |
|---|---|
| Carrossel 3C completo | 90 min |
| Reel Lo-fi | 45 min |
| Stories (1 unidade) | 8 min |
| Mini Carta (criação inicial) | 8h (uma vez) |

### Tempo médio por peça (com IA Vertical madura)

| Tipo de peça | Tempo médio |
|---|---|
| Carrossel 3C completo | 30 min (cliente revisa) |
| Reel Lo-fi | 20 min (cliente grava + IA edita) |
| Stories (1 unidade) | 3 min |
| Mini Carta (criação inicial) | 4h (IA Vertical sugere, cliente cala) |

### Impacto no cálculo

Com IA Vertical, cliente sustenta 2-3x mais peças/semana com as mesmas horas. Skill marca isso explicitamente:

> *"Plano sem IA Vertical: 12 peças/semana × 90min = 18h/semana. Você só tem 12h. Inviável.
>
> Plano com IA Vertical: 12 peças/semana × 30min = 6h/semana. Sobra 6h pra comercial e operação. Viável.
>
> IA Vertical não é opcional aqui, é parte do plano desde M1."*

---

## Saída final do cálculo

Skill entrega tabela única com todas as etapas, faixa baixa por default, e marca explicitamente:
- Volumes mensais necessários (Receita, Vendas, Reuniões, DMs, Cliques, Engajamento, Alcance)
- Volumes semanais (Peças, Horas)
- Premissa de cada taxa (qual benchmark aplicado)
- Sensibilidade: se taxa X subir 50%, quanto volume cai

Cliente sai sabendo:
1. Quanto produzir
2. Quanto alcance precisa
3. Quanto investimento necessário
4. Quanto tempo dedicar
5. O que muda se taxa subir/descer

Tudo isso em 1 página visual. Não em PDF de 30.

---

## Princípio final do cálculo

Cálculo Soft é **conservador por default**. Faixa baixa em todas as etapas. Por quê:
- Erro pra menos é recuperável (cliente bate antes da meta, bom problema)
- Erro pra mais é desastroso (cliente não bate, abandona, pior problema)
- Faixa baixa cria expectativa realista e dá margem pra surpresa boa

Cliente que reclama "tá conservador demais" responde-se: *"é. Quando você tiver 60 dias de dado próprio mostrando faixa alta, refazemos. Antes disso, vamo no conservador."*
