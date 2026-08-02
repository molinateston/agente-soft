# Crise em Lançamento

> **Quando consultar:** Modo D, lançamento dando errado **em tempo real**. Cliente precisa de socorro, não de aula. Esta reference é a mais cirúrgica da skill: diagnóstico em 1 linha + ação imediata + plano B.

Cobre os 5 tipos de crise mais comuns em lançamento pago, com diagnóstico estruturado e respostas de emergência.

---

## Índice

- Princípio raiz
- Pergunta inicial (sempre)
- Tipo 1: Ingresso parou de vender
- Tipo 2: Comparecimento baixo (na véspera ou no dia)
- Tipo 3: Conversão zero (durante ou após a aula)
- Tipo 4: Audiência fria não converte
- Tipo 5: Lançamento como "salvação financeira" que emperra
- Princípios não-negociáveis no Modo D
- Aplicação por modo

---

## Princípio raiz

> *Cliente em crise precisa de **resposta curta**, não de framework.*

A skill, no Modo D, abandona o tom didático. Vai direto ao diagnóstico. Vai direto à ação.

**Estrutura padrão de resposta no Modo D:**
```
Diagnóstico: [1 linha]
Ação imediata: [bloco direto]
Se não funcionar em 24h: [plano B]
Verifica em: [prazo]
```

Sem rodeio. Sem moral. Sem motivacional. Cliente já tá com pressão alta, skill resolve, não consola.

---

## Pergunta inicial (sempre)

Antes de qualquer ação, skill confirma 4 coisas em 1 mensagem:

1. **Em qual fase do lançamento você está?** (vendendo ingresso / véspera da aula / aula em andamento / carrinho aberto)
2. **Quanto tempo até o próximo marco?** (em horas/dias)
3. **Qual o sintoma específico?** (números reais, não "tá ruim")
4. **O que você já tentou fazer?**

Sem essas 4, qualquer recomendação é palpite. Skill pede em 1 mensagem. Não 4 perguntas separadas.

---

## Tipo 1: Ingresso parou de vender

### Sintoma

- Estava vendendo X ingressos/dia, caiu pra metade ou menos
- CPC subindo, CTR caindo
- ROAS na fase ingresso despencou
- Faltam dias pra fechar venda do ingresso e meta longe

### Diagnóstico em 3 perguntas

1. **Tá há quantos dias rodando os mesmos criativos?** (>14 dias = saturação esperada)
2. **Tá saturando o público de remarketing?** (frequência >3 = saturado)
3. **Mudou alguma coisa na conjuntura externa?** (concorrente lançando? evento grande? notícia ruim?)

### Diagnósticos prováveis (em ordem de probabilidade)

#### Causa 1: Saturação criativa (60% dos casos)

**Sinal:** mesmos criativos rodando há 10+ dias, CTR caindo gradativamente, CPC subindo.

**Ação imediata:**
- Pausa os 30% piores criativos (CTR mais baixo)
- Ativa 3-5 criativos novos com **ângulos diferentes**:
  - Variação de hook (problema diferente)
  - Variação de prova (depoimento UGC se faltar)
  - Variação de formato (estático→vídeo ou vice-versa)
- Roda 48h pra ver dados

**Plano B (se em 48h não recuperou):**
- Refaz oferta do ingresso (ângulo novo de promessa)
- Considera adicionar bônus pro ingresso (gravação grátis pelos próximos 3 dias)

#### Causa 2: Público saturado (25% dos casos)

**Sinal:** frequência >3 nos lookalikes, CPM disparando, mesmas pessoas vendo o anúncio.

**Ação imediata:**
- Expande público (lookalike 1-3% → 5-10%)
- Adiciona segmentações novas (interesse, comportamento)
- Open targeting paralelo (sem segmentação) com criativos performantes

**Plano B:**
- Considera baixar lance de venda do ingresso (oferta mais agressiva)
- Aciona base de e-mails / WhatsApp com sequência dedicada

#### Causa 3: Página com fricção (10% dos casos)

**Sinal:** CTR do anúncio bom (>1.5%), conversão da página despencando.

**Ação imediata:**
- Roda diagnóstico mobile (60-80% do tráfego)
- Verifica velocidade de carregamento (acima de 3s = problema)
- Confirma que pixel + CAPI estão disparando
- Testa checkout end-to-end (compra real com cartão)

**Plano B:**
- Refaz página em formato simplificado (longa→curta ou vice-versa, dependendo do match com criativo)

#### Causa 4: Match criativo×página errado (5% dos casos)

**Sinal:** estava vendendo bem, mudou criativo pra um vídeo longo mas página continuou longa.

**Ação imediata:**
- Aplica matriz de `paginas-criativos-trafego.md`:
  - Estático com preço → checkout
  - Vídeo longo → página curta
- Ajusta destino do criativo problemático

---

## Tipo 2: Comparecimento baixo (na véspera ou no dia)

### Sintoma

- Vendeu X ingressos, mas confirmação no manifesto foi <40%
- Esperava 80-90% de comparecimento, vai bater <70%
- 2h antes da aula, sala com poucas pessoas

### Diagnóstico em 3 perguntas

1. **Quantos lembretes mandou e em quais canais?** (e-mail só / WhatsApp também?)
2. **Manifesto foi enviado quanto tempo antes?** (48h é o ponto)
3. **Área de membros teve engajamento?** (>40% acessou pelo menos 1 aula = bom)

### Diagnósticos prováveis

#### Causa 1: Lembretes insuficientes (50% dos casos)

**Sinal:** só e-mail, sem WhatsApp. Ou lembretes apenas 24h antes.

**Ação imediata (se ainda há tempo antes da aula):**
- Dispara WhatsApp **agora** pra todos compradores: "Lembrete da aula HOJE às [horário]. Link: [link]. Salva esse contato."
- Manda mais 1 às 2h antes
- Manda mais 1 30 min antes
- Manda mais 1 5 min antes

**Plano B:**
- Promete gravação aos não-comparecentes (pra recuperar conversão)

#### Causa 2: Pós-venda do ingresso fraco (30% dos casos)

**Sinal:** sem manifesto, sem área de membros, sem aulas pré-evento.

**Ação imediata:**
- **Pra esse lançamento:** já era. Foca em recuperar via gravação pós-aula.
- **Próximo lançamento:** estrutura pós-venda completo (ver `pos-venda-ingresso.md`)

#### Causa 3: Tempo entre compra e aula muito longo (15% dos casos)

**Sinal:** lead comprou ingresso há 20+ dias, esfriou.

**Ação imediata:**
- Sequência de **reaquecimento intensa** nas últimas 48h:
  - Manifesto reforçado
  - Vídeo curto do expert (gravado no celular, autêntico) lembrando da aula
  - Conteúdo relâmpago de valor

**Plano B:**
- Próximo lançamento: encurta janela entre compra e aula (máximo 14 dias)

---

## Tipo 3: Conversão zero (durante ou após a aula)

### Sintoma

- Aula rolou bem (engajamento, comparecimento ok)
- Apresentou oferta, ninguém comprou
- Carrinho aberto há 1-3 dias, vendas muito abaixo do projetado
- Conversão na aula <5% (alvo Sala Secreta: 20%)

### Diagnóstico em 4 perguntas

1. **Conteúdo da aula entregou pontos cegos reais?** (revelou algo novo?)
2. **Promessa do criativo bateu com promessa da aula bateu com promessa da oferta?**
3. **Time comercial está rodando? Como?**
4. **Aplicação ou checkout direto? Qual sentou?**

### Diagnósticos prováveis

#### Causa 1: Aula sem pontos cegos (40% dos casos)

**Sinal:** lead saiu da aula achando que aprendeu coisas legais, mas nada novo.

**Ação imediata (se carrinho ainda aberto):**
- Live de **emergência** focada em revelar 1-2 pontos cegos que a aula deixou passar
- Convite por WhatsApp: "Faltou uma coisa importante na aula: vou abrir uma sessão extra de 30 min pra explicar"
- Reforça oferta no fim

**Plano B:**
- Reembolsa quem reclamar (custo baixo, preserva reputação)
- Próximo lançamento: investe pesado na construção de aula (ver `narrativa-pontos-cegos.md`)

#### Causa 2: Quebra na cadeia promessa (30% dos casos)

**Sinal:** criativo prometia X, aula entregou Y, oferta vende Z. Lead se perde.

**Ação imediata (se carrinho ainda aberto):**
- Mensagem direta a todos compradores de ingresso explicando como aula × oferta se conectam
- Reforça em vídeo curto a transformação que o produto entrega

**Plano B:**
- Próximo: alinha as 3 promessas antes de começar a rodar tráfego

#### Causa 3: Time comercial parado ou mal calibrado (20% dos casos)

**Sinal:** carrinho aberto sem ninguém ligando ou mensagem só genérica.

**Ação imediata:**
- Ativa time comercial **agora** (mesmo que improvisado, 1-2 pessoas)
- Prioriza leads do **top 20%** do lead scoring (pesquisa pós-compra)
- Script básico: "Vi que você comprou ingresso e veio à aula. O que ficou pendente pra você decidir? Posso esclarecer agora."

**Plano B:**
- Próximo lançamento: estrutura time comercial dom+seg conforme método Sala Secreta

#### Causa 4: Aplicação emperrando (10% dos casos)

**Sinal:** muitos cadastros na aplicação, ninguém aprovado / nenhuma call agendada.

**Ação imediata:**
- Reduz critério de aprovação da aplicação (só rejeita os obviamente errados)
- Acelera resposta às aplicações (até 24h)
- Agenda calls em janelas amplas (não esperar "horário ideal")

---

## Tipo 4: Audiência fria não converte

### Sintoma

- Cliente sem audiência prévia significativa
- Tráfego frio rodando, mas conversão muito baixa
- CAC bem acima do ticket do ingresso

### Diagnóstico

Audiência 100% fria em lançamento pago é cenário difícil. Skill avisa cedo (Modo A, `alertas-e-cadencia.md`). Se cliente rodou mesmo assim, opções limitadas.

### Diagnósticos prováveis

#### Causa 1: Lançamento errado pro estágio do cliente (60% dos casos)

**Sinal:** cliente sem audiência tentando lançamento de R$3-10k.

**Ação imediata:**
- **Para o tráfego pesado.** Não adianta queimar mais.
- Considera reduzir ticket do produto principal (R$3k → R$997 ou similar)
- Considera aumentar promessa pro tráfego frio funcionar

**Plano B:**
- Cancela o lançamento (perde tempo + algum tráfego, salva caixa)
- Refaz em 90-180 dias com audiência construída

#### Causa 2: Posicionamento genérico (30% dos casos)

**Sinal:** promessa do criativo poderia ser de qualquer um do nicho. Sem ângulo único.

**Ação imediata:**
- Nesse lançamento já era: não dá pra refazer posicionamento em curso
- Próximo: investe em `soft-plano-posicionamento` antes

#### Causa 3: Tráfego em canais errados (10% dos casos)

**Sinal:** rodando só Meta sem testar Google/YouTube/TikTok.

**Ação imediata:**
- Testa Google Discovery / YouTube se nicho permite
- Para mais nichos B2B, LinkedIn pode performar melhor que Meta

---

## Tipo 5: Lançamento como "salvação financeira" que emperra

### Sintoma

- Cliente tá apostando o caixa nesse lançamento
- Lançamento não tá indo bem
- Pressão alta sobre o cliente
- Possível pânico na execução

### Diagnóstico

Esse não é diagnóstico técnico, é situacional. Skill abandona modo operacional e vai pro modo direto.

### Resposta da skill

```
Para. Respira.

Lançamento pra "salvar caixa" não funciona. Pânico vaza pro lead.
O lead sente que você precisa fechar, e foge.

Antes de mais ações, responde:

1. Caixa atual em meses de operação?
2. O que você precisa MÍNIMO desse lançamento pra caixa não quebrar?
3. Existe alguma fonte de receita imediata fora do lançamento?

Sem essas 3 respostas, qualquer ação tática vai amplificar o pânico.

Se caixa <2 meses: pausa o lançamento, ativa fontes alternativas
(antigos clientes, pessoas próximas, freelas, dívida emergencial
estruturada). Lançamento volta quando emocional estabiliza.

Se caixa >2 meses: vai pro Tipo 1, 2 ou 3 com o sintoma
específico, mas com cabeça mais fria.

Toda venda perdida com pânico é venda que poderia ter fechado.
O odor da insinceridade exala do pânico.
(Princípio do Gitomer aplicado aqui.)
```

> **Esse é o único cenário em que skill recusa avançar com tática operacional sem antes endereçar o estado emocional.**

---

## Princípios não-negociáveis no Modo D

1. **Diagnóstico em 1 linha.** Sem rodeio.
2. **Ação imediata + plano B + prazo.** Sempre os 3.
3. **Sem aula em crise.** Cliente em crise precisa de resposta, não de framework.
4. **Pânico bloqueia operação.** Tipo 5 atende emocional antes de tática.
5. **Sem garantia.** Skill nunca promete que vai funcionar, só dá o melhor caminho dado o cenário.
6. **Resposta curta sempre.** Se cliente pediu socorro, não responde com 3000 palavras.

---

## Aplicação por modo

Esta reference só é puxada no **Modo D**. Para preparação que evita crise, ver as outras references.

> *Uma onça de prevenção vale uma libra de remédio.*
> Mas quando o remédio é necessário, dá o remédio direto. Sem aula sobre prevenção.
