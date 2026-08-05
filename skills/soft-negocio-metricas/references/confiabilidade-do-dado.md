# Confiabilidade do Dado (Passo 1, bloqueante)

> **Quando ler:** sempre, antes de interpretar qualquer taxa. Este passo bloqueia.
>
> **O que entrega:** os 4 testes, os pisos de volume, o prazo de janela por ticket, os sintomas de rastreio quebrado e os moldes de recusa.

**Princípio:** chutar em cima de dado ruim é pior que não medir. Sem dado, o especialista sabe que não sabe. Com dado ruim, ele decide errado achando que decidiu com fato, e ainda gasta a semana executando o conserto errado.

---

## Teste 1, AMOSTRA (o volume sustenta a taxa?)

Taxa calculada em cima de número pequeno oscila sozinha. 1 venda em 3 reuniões não é 33% de fechamento, é 1 venda.

### Pisos mínimos por etapa

| Etapa | Piso pra ler a taxa | Abaixo disso |
|---|---|---|
| Alcance por peça | 3 peças no período | lê peça a peça, não taxa média |
| Engajamento qualificado | 1.000 de alcance somado | só direção, não decisão |
| Cliques na bio/Carta | 30 cliques | não compara com faixa |
| DMs qualificados | 10 DMs | não calcula taxa de DM → conversa |
| Conversas → reunião | 10 conversas | não calcula agendamento |
| Reunião → fechamento | 10 reuniões realizadas | **nunca** conclui sobre o closer |
| Teste A/B de criativo | 1.000 impressões por variante | não declara vencedor |

**A regra do fechamento é a mais violada.** Com 4 reuniões e 1 venda, ninguém sabe se o script está ruim: a diferença entre 25% e 50% de fechamento nesse volume é uma reunião. A skill diz isso em vez de mandar treinar o closer.

### Molde de recusa

> `AMOSTRA INSUFICIENTE na etapa [X].` Você teve [N] [unidade] no período, e abaixo de [piso] a taxa oscila sozinha. Com esse volume eu não consigo separar problema real de variação normal. O que dá pra fazer: acumula até [piso] (estimo [N] semanas no ritmo atual) e a gente lê. Enquanto isso, o gargalo confiável é [etapa que passou no teste].

---

## Teste 2, JANELA (o período cobre o ciclo inteiro?)

Ler venda numa janela menor que o ciclo de venda subestima o resultado: o lead que entrou ainda não teve tempo de comprar.

### Prazo mínimo de janela por ticket

| Ticket | Ciclo típico Soft | Janela mínima pra julgar venda |
|---|---|---|
| até R$1.500 | 5 a 10 dias | 2 semanas |
| R$1.500 a R$5.000 | 10 a 20 dias | 4 semanas |
| R$5.000 a R$20.000 | 20 a 45 dias | 6 a 8 semanas |
| acima de R$20.000 | 30 a 60+ dias | 8 a 12 semanas |

**Ciclo acima de 45 dias já é sinal de vazamento** (lead esfriando ou ticket alto sem maturidade comercial), não só de janela curta.

### O erro clássico

Campanha ligada há 6 dias, ticket de R$5.000, zero venda, e o especialista quer pausar. A skill responde: a janela não cobre nem metade do ciclo. O que dá pra ler com 6 dias é **topo** (alcance, clique, custo por lead), não fundo. Julgar venda agora é pausar campanha sadia.

### Molde de recusa

> `JANELA CURTA pra essa pergunta.` Seu ciclo é de ~[N] dias e a campanha tem [M] dias. Venda ainda não deu tempo de acontecer. O que JÁ dá pra ler agora: [métricas de topo com números]. O que espera até [data]: fechamento e ROI.

---

## Teste 3, RASTREIO (os números batem entre si?)

Rastreio quebrado produz número que parece bom e não é.

### Sintomas de rastreio furado

| Sintoma | O que provavelmente é |
|---|---|
| Plataforma mostra mais vendas que o financeiro recebeu | dupla contagem, ou conta view-through como venda |
| Cliques no anúncio >> sessões na página | pixel não dispara, ou página lenta derruba antes de carregar |
| Vendas no extrato sem origem nenhuma no relatório | UTM ausente ou perdida em redirect |
| Lead chega e ninguém sabe de onde | sem UTM, sem pergunta de origem, sem tag |
| Números caíram todos no mesmo dia | quebrou a medição, não caiu o negócio |
| Receita da plataforma ≠ receita do extrato | estorno, taxa, ou parcelamento contado como à vista |

**Regra de ouro:** quando o número da plataforma e o número do dinheiro discordam, **vence o dinheiro** (ver `soft-financeiro` pra puxar o dado). Plataforma otimiza pra parecer que funcionou.

### Molde de recusa

> `RASTREIO QUEBRADO.` [Número A] e [número B] não fecham entre si ([evidência]). Enquanto isso não bate, qualquer diagnóstico meu vai estar em cima de dado torto. Conserta primeiro: [ação de rastreio]. Depois disso a leitura vale.

---

## Teste 4, ATRIBUIÇÃO (a venda dessa semana veio do lead dessa semana?)

Em funil com ciclo, a venda de hoje vem do lead de semanas atrás. Dividir venda da semana por lead da semana produz taxa fantasma, que sobe quando o volume cai e cai quando o volume sobe.

**A leitura certa é por coorte:** acompanha o grupo de leads que entrou na semana N e mede quanto dele fechou até o fim do ciclo. Se o especialista não tem como montar coorte, a skill usa a taxa da janela inteira (mês), nunca a razão semanal, e declara isso.

**Sinal de atribuição furada:** taxa de fechamento que oscila 3x semana a semana sem nada ter mudado na operação.

---

## Depois dos 4 testes

- **Passou nos 4** → segue pro Passo 2 normalmente.
- **Reprovou em qualquer um** → a saída daquela etapa vira o molde de recusa. **Isso não trava a leitura inteira:** as etapas que passaram continuam sendo lidas e diagnosticadas normalmente. Trava só a conclusão sobre a etapa contaminada.
- **Reprovou em tudo** → a saída é o plano de medição, e mais nada. Nenhuma recomendação de operação.

---

## O que NUNCA fazer com dado ruim

- Estimar o número que falta "pra poder seguir"
- Usar benchmark de mercado no lugar do dado ausente e tratar como se fosse real
- Concluir sobre o closer, o criativo ou a oferta com amostra abaixo do piso
- Declarar vencedor de teste A/B antes do volume
- Comparar semana parcial com semana fechada
