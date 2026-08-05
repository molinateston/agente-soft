# Projetado x Realizado (Passo 4)

> **Quando ler:** sempre que houver meta ou projeção. Fecha o loop com a Conta e o plano.
>
> **O que entrega:** o molde da comparação, os 3 deltas, a leitura de cada combinação e os ritmos de revisão (semanal, mensal, M3/M6).

**Princípio:** a projeção existe pra ser confrontada. Plano que ninguém compara com o realizado é planilha bonita, e recalibragem sem plano é apagar incêndio. O valor está no encontro dos dois.

---

## A Conta, em uma linha (a origem da projeção)

```
meta ÷ ticket = clientes/mês
clientes/mês ÷ taxa de fechamento = reuniões
reuniões ÷ taxa de agendamento = conversas
conversas ÷ taxa DM → conversa = DMs
DMs ÷ taxa clique → DM = cliques ... e assim até o volume de peças
```

Esse é o funil reverso que gerou o plano. **O realizado se compara etapa por etapa contra ele**, não só no número final de receita. Quem só compara receita descobre que errou, e não descobre onde.

---

## O molde da comparação (vai na tela, sempre)

```
Período: 01 a 31/03 · fonte: Insights + CRM

Etapa            Projetado   Real    Delta     Status
Peças              20          18     -10%      🟡
Alcance total      30.000      31.200  +4%      🟢
Cliques            300         96     -68%      🔴
DMs                45          14     -69%      🔴
Conversas          18          6      -67%      🔴
Reuniões           7           3      -57%      🔴
Vendas             2           1      -50%      🔴
Receita            R$5.000     R$2.500 -50%     🔴
```

**Nenhuma recomendação sai sem essa tabela ou pelo menos a linha do delta da etapa diagnosticada.**

Na tabela acima, tudo abaixo de "Cliques" é consequência: a primeira vermelha é o clique, e os -69% de DM não são um segundo problema.

---

## Os 3 deltas (confundi-los é o erro mais caro)

Bateu menos receita que o projetado. **Por qual dos três caminhos?**

### Delta de VOLUME
Entrou menos gente no topo. As taxas estão normais, o funil funciona, faltou combustível.
**Sinal:** conversões dentro da faixa, números absolutos baixos em todas as etapas proporcionalmente.
**Conserto:** cadência de publicação ou verba. Não mexe em copy nem em oferta, elas não são o problema.

### Delta de TAXA
Entrou o volume previsto e converteu menos. O funil vaza.
**Sinal:** número absoluto de topo bate ou supera o projetado, e a conversão de uma etapa está abaixo da faixa.
**Conserto:** a etapa vermelha, pelo `diagnostico-por-etapa.md`.

### Delta de RECEITA
Volume bateu, taxa bateu, o dinheiro não veio.
**Sinal:** clientes novos no número previsto, receita abaixo.
**Conserto:** ticket. Desconto concedido, venda do nível de entrada em vez do principal, parcelamento contado como receita cheia, ou estorno. Vai pra oferta e preço, e o dado de dinheiro vem do `soft-financeiro`.

### Tabela de leitura combinada

| Volume | Taxa | Receita | Leitura | Conserto |
|---|---|---|---|---|
| 🔴 | 🟢 | 🔴 | faltou combustível, o funil está sadio | cadência ou verba |
| 🟢 | 🔴 | 🔴 | funil vaza numa etapa | a etapa vermelha |
| 🟢 | 🟢 | 🔴 | vendeu barato | ticket, desconto, mix de oferta |
| 🔴 | 🔴 | 🔴 | plano irreal ou execução não aconteceu | volta pra Conta |
| 🟢 | 🟢 | 🟢 | bateu | escala o que já funciona |
| 🔴 | 🟢 | 🟢 | bateu com menos volume | taxa própria é melhor que o benchmark: refaz a projeção pra cima |

**A última linha é a boa notícia que costuma passar batida.** Bater a meta com menos volume que o projetado significa que as taxas reais superam o benchmark, e a projeção seguinte deve ser refeita com as taxas próprias.

---

## Quando o delta NÃO significa problema

- **Mês 1 de operação.** M1 é configuração. Cobrar resultado financeiro de peça publicada essa semana é irreal. Resultado vem de M3 em diante.
- **Delta dentro de 10%.** É ruído de execução, não desvio. Não vira ação.
- **Janela menor que o ciclo de venda.** Ver `confiabilidade-do-dado.md`, teste 2.
- **Meta que mudou no meio do caminho.** Meta só muda em ponto de revisão marcado. Comparar realizado com meta nova reescrita depois do fato não é leitura, é narrativa.

---

## Os 3 ritmos de revisão

| Ritmo | Quando | Duração | O que faz |
|---|---|---|---|
| **Semanal** | sexta ou domingo | 15 a 20 min | os 8 números, acha a primeira vermelha, UMA ação pra semana |
| **Mensal** | fim do mês | 30 min | média das 4 semanas, tendência (subindo/estável/caindo), KPI do mês cumprido, ajusta o mês seguinte |
| **M3 e M6** | pontos de revisão do plano | mais fundo | diagnóstico expandido se ficou abaixo de 70% da meta |

### Diagnóstico expandido de M3/M6

Quando fica abaixo de 70% da meta no ponto de revisão, separa a natureza do problema:

- **Vazamento estrutural** (posicionamento errado, Carta fraca, cliente ideal confuso) → volta pra fundação: `soft-posicionamento` ou `soft-funil-carta`. Não adianta ajustar volume.
- **Vazamento operacional** (cadência ruim, comercial despreparado, faltou tempo) → recalibra o plano dos meses seguintes com `soft-leon`.

Fechamento de M6:
- bateu (±10%) → refaz o plano dos próximos 6 meses com as taxas próprias
- 50 a 90% da meta → identifica o que empacou, redefine M7-M12
- abaixo de 50% → diagnóstico expandido; provável retrabalho de posicionamento, Carta ou maturidade comercial, com meta nova mais conservadora

---

## A pergunta que fecha o loop

Depois da comparação, quando o delta é grande e persistente, a pergunta não é só operacional:

> A meta continua de pé, ou a operação que ela exige não cabe na vida que você quer?

Baixar meta por escolha, com a conta na mesa, é calibragem. Não é desistência. Essa conversa vai pra `soft-leon`.
