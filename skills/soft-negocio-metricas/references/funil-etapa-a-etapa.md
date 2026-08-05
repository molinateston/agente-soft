# Funil Etapa a Etapa (Passo 2)

> **Quando ler:** ao calcular as conversões e comparar com a referência.
>
> **O que entrega:** as 7 etapas do funil único com fórmula, faixa baixa, faixa alta e piso de vazamento; os 4 sinais agregados; a migração do benchmark pra taxa própria.

**Origem dos números:** tabela do Benchmark Soft do método (`soft-leon/references/benchmark-soft.md`). Nenhum número aqui é de mercado externo. Onde a referência não existe, está escrito `[A DEFINIR com o dono]`.

---

## Como calcular

Uma linha por etapa, sempre mostrando a conta:

```
Etapa 4 → 5 (DM → conversa): 12 ÷ 31 = 39%  · faixa 25-50% · VERDE
Etapa 5 → 6 (conversa → reunião): 3 ÷ 12 = 25%  · faixa 25-45% · VERDE (limite)
Etapa 6 → 7 (reunião → venda): 0 ÷ 3 = 0%  · AMOSTRA INSUFICIENTE (piso 10)
```

Status: **verde** na faixa ou acima · **amarelo** 70 a 99% da faixa baixa · **vermelho** abaixo de 70% da faixa baixa.

---

## Etapa 1, Produção → Alcance qualificado

| Variável | Faixa baixa | Faixa alta | Vazamento abaixo | Onde medir |
|---|---|---|---|---|
| Alcance por Reel | 1.500 | 8.000 | 800 | Insights do Reel |
| Alcance por Carrossel | 800 | 5.000 | 400 | Insights do Carrossel |
| Alcance por Story (quente) | 30% dos seguidores | 60% | 20% | Insights da conta |
| Retenção 3s no Reel | 50% | 75% | 35% | Insights do Reel |
| Retenção 15s no Reel | 25% | 50% | 15% | Insights do Reel |

**Vazamento aqui = gancho fraco.** Capa não filtra ou os 3 primeiros segundos não prendem. Conserta o gancho antes de mexer em qualquer etapa abaixo.

## Etapa 2, Alcance → Engajamento qualificado

Engajamento qualificado = salvar + compartilhar. Like e comentário decorativo não entram.

| Variável | Faixa baixa | Faixa alta | Vazamento abaixo |
|---|---|---|---|
| Taxa de salvar (salvos ÷ alcance) | 2% | 6% | 1% |
| Taxa de compartilhar | 1,5% | 4% | 0,8% |
| Engajamento qualificado total | 3% | 8% | 2% |
| Likes (sinalético, não primário) | 4% | 10% | 2% |
| Comentários significativos | 0,5% | 2% | 0,2% |

**Vazamento aqui = peça sem ponta filtrante.** Agrada e não polariza: o leitor acha bonito e não sente urgência de salvar nem de mandar pra alguém.

## Etapa 3, Engajamento → Clique na bio/Carta

| Variável | Faixa baixa | Faixa alta | Vazamento abaixo |
|---|---|---|---|
| Cliques na bio por peça | 0,3% do alcance | 1,5% | 0,1% |
| CTR no link da Carta | 1% | 3% | 0,5% |
| Cliques em "Ver mais" do Reel | 5% dos que viram 50%+ | 15% | 2% |

**Vazamento aqui = bio fraca ou CTA inexistente.** A peça não direciona, ou direciona e a bio não vende o clique.

## Etapa 4, Clique → DM qualificado

| Variável | Faixa baixa | Faixa alta | Vazamento abaixo |
|---|---|---|---|
| Carta lida → DM | 5% | 15% | 3% |
| Peça assistida → DM (sem Carta) | 0,5% | 2% | 0,2% |
| Palavra-chave do Reel → DM | 3% | 10% | 1% |

**Vazamento aqui = Carta genérica.** O lead lê e não se reconhece.

## Etapa 5, DM → Conversa no WhatsApp

| Variável | Faixa baixa | Faixa alta | Vazamento abaixo |
|---|---|---|---|
| DM → conversa WhatsApp | 25% | 50% | 15% |
| Resposta no DM em até 1h | 70% | 95% | 50% |
| Conversa qualificada (nicho certo) | 60% | 85% | 40% |

**Vazamento aqui = primeira mensagem mal calibrada ou demora.** Lead chega quente e esfria em 24h.

## Etapa 6, Conversa → Reunião qualificada realizada

Até R$1.500 a "conversa qualificada" é o próprio WhatsApp. De R$1.500 a R$5.000 pode ser WhatsApp ou call. Acima de R$5.000 inclui reunião agendada.

| Variável | Faixa baixa | Faixa alta | Vazamento abaixo |
|---|---|---|---|
| Agendamento (conversa → marcada) | 25% | 45% | 15% |
| Comparecimento (marcada → realizada) | 70% | 90% | 50% |
| Qualificação (chegou na Conexão) | 60% | 85% | 40% |

**Vazamento aqui = lead errado, a Carta não filtrou.**

## Etapa 7, Reunião realizada → Fechamento

| Variável | Faixa baixa | Faixa alta | Vazamento abaixo |
|---|---|---|---|
| Fechamento Principal | 30% | 60% | 20% |
| Fechamento Downsell direto | 50% | 80% | 35% |
| Lead morno → Downsell passivo | 5% | 15% | 3% |
| Upsell Downsell → Principal (60d) | 10% | 25% | 5% |

**Vazamento aqui = uma das fases da conversa falhou** (Recuo, Descoberta, Implicação, Conexão, Apresentação, Isolamento, Fechamento). Vai pra `soft-vendas`.

---

## Os 4 sinais agregados (saúde geral, além das taxas)

| Sinal | Fórmula | Faixa Soft | Vazamento |
|---|---|---|---|
| Custo por DM qualificado (orgânico) | horas de produção ÷ DMs qualificados | 0,5h a 2h por DM | acima de 3h |
| Custo por DM qualificado (pago) | investimento ÷ DMs gerados | R$3 a R$15 por DM | acima de R$25 |
| Ciclo médio (DM → fechamento) | dias | 5 a 30 dias | acima de 45 dias |
| Receita por hora de produção | receita ÷ horas de produção | R$300 a R$2.000/h | abaixo de R$200/h |

**Receita por hora abaixo de R$200 significa operar como creator, não como especialista.** É o sinal mais estrutural dos quatro.

---

## Faixa baixa é o default

- **Mês 1:** aplica faixa baixa em tudo. Cliente sem histórico não tem direito a otimismo, e erro pra menos é recuperável (bate a meta antes), erro pra mais é abandono.
- **Faixa alta:** só com 60+ dias de histórico próprio consistentemente acima da baixa, em 3 meses seguidos.

## Migração pro dado próprio (o objetivo)

| Momento | O que a leitura usa |
|---|---|
| Mês 1 | benchmark cego, coleta dados |
| Mês 2 | compara real x benchmark, identifica onde está acima/na faixa/abaixo |
| Mês 3 | substitui pelas taxas próprias onde já há 8 semanas consistentes |
| Mês 4 a 6 | opera nas taxas próprias, benchmark vira só calibragem de expectativa |

**Taxa própria é confiável quando:** 8 semanas de dado, variação semana a semana menor que 30%, e volume planejado cumprido (sem semanas bizarras).

> Mercado é mapa. O perfil dele é a bússola. Quando os dois discordam, segue a bússola.

Quem opera há 6+ meses e ainda lê pelo benchmark genérico não está lendo os próprios dados: isso é vazamento de gestão, não de funil.
