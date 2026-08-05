# Diagnóstico por Etapa (Passo 3)

> **Quando ler:** depois de calcular as taxas, pra nomear o gargalo.
>
> **O que entrega:** a regra da primeira vermelha, a tabela sintoma → causa provável → o que medir pra confirmar, e o vazamento típico por estágio de faturamento.

---

## A regra da PRIMEIRA vermelha (não a pior)

O instinto é atacar a pior taxa. Está errado. Vazamento numa etapa **contamina todas as etapas abaixo dela**: se o alcance está furado, o número de DMs cai por consequência, e a taxa de DM parece ruim sem ter problema nenhum.

**Ordem obrigatória:** varre de cima pra baixo (etapa 1 → 7) e para na **primeira vermelha**. É ela.

### Exceção única

Se a primeira vermelha reprovou no teste de amostra (`confiabilidade-do-dado.md`), a skill não pula pra próxima como se nada fosse: declara que a etapa 1 está sem leitura confiável **e** diagnostica a próxima vermelha com leitura válida, deixando claro que o veredito pode mudar quando a primeira tiver volume.

### Semáforo

| Status | Critério | O que fazer |
|---|---|---|
| Verde | na faixa ou acima | mantém, não mexe |
| Amarelo | 70 a 99% da faixa baixa | monitora, **não mexe** |
| Vermelho | abaixo de 70% da faixa baixa | ataca, é o gargalo |

**Amarelo não é ação.** Mexer em amarelo gasta a semana e não move ponteiro, e ainda contamina a leitura do vermelho real.

---

## Tabela sintoma → causa → o que medir

| Etapa vermelha | Causa provável | O que medir pra confirmar | Destino |
|---|---|---|---|
| **1. Peças publicadas** | cadência, não está publicando o volume | peças planejadas x publicadas | `soft-leon` (rotina) |
| **2. Alcance** | gancho fraco, capa/3s não filtram | retenção 3s por peça; alcance das 3 piores x 3 melhores | `soft-conteudo-headlines` |
| **3. Engajamento qualificado** | peça agrada e não polariza, sem ponta filtrante | taxa de salvar isolada da de like | `soft-conteudo-carrossel`/`-reels` |
| **4. Cliques na bio/Carta** | bio fraca ou CTA ausente na peça | quantas peças tinham CTA explícito; cliques na bio por peça | `soft-posicionamento` (perfil) |
| **5. DMs qualificados** | Carta genérica, longa ou sem filtro | tempo de leitura da Carta; % que lê até o fim | `soft-funil-carta` |
| **6. Conversas WhatsApp** | primeira mensagem fria ou demora na resposta | tempo médio de resposta; % respondida em 1h | `soft-vendas` |
| **7. Reuniões realizadas** | lead não qualificado, a Carta não filtrou | no-show rate x taxa de qualificação | `soft-funil-carta` + `soft-vendas` |
| **8. Vendas** | uma fase da conversa quebrou | gravação da última reunião contra as fases | `soft-vendas` |

**Nunca entrega duas causas.** Se duas parecem plausíveis, a skill diz qual é a mais provável e **o que medir pra desempatar** na semana seguinte.

---

## Vazamento típico por estágio de faturamento

O mesmo número vermelho significa coisas diferentes conforme o tamanho da operação.

| Estágio | Onde mais vaza | Por quê | Ataca primeiro |
|---|---|---|---|
| **Destravar** (R$0 a 15k/mês) | Etapa 1 (gancho) e Etapa 7 (fechamento) | gancho não calibrado, comercial não treinado | gancho + script básico |
| **Escalar** (R$15k a 50k) | Etapa 2 (engajamento) e Etapa 4 (DM) | volume existe, filtro é fraco | embalagem da peça + Carta |
| **Estabilizar** (R$50k a 80k) | Etapa 5 (DM → conversa) e Etapa 6 | volume e filtro firmes, conversão escapa | primeira mensagem + qualificação |
| **Verticalizar** (R$80k+) | Etapa 7 (fechamento Principal) | ticket subiu, maturidade comercial não acompanhou | refino das fases + Isolamento |

**Uso:** quando duas etapas empatam em gravidade, o estágio desempata. Cliente Destravar com etapa 2 e etapa 7 vermelhas ataca o gancho, não o closer.

---

## Como nomear o gargalo (uma frase, sem rodeio)

Molde:

> **Gargalo: [etapa], [taxa real] contra [faixa].** [Causa provável em meia linha]. Tudo abaixo dessa etapa parece ruim por consequência dela.

Exemplos:

> **Gargalo: clique na Carta, 0,3% contra faixa de 1 a 3%.** O CTA não aparece nas peças e a bio não vende o clique. Os DMs baixos são consequência disso, não problema separado.

> **Gargalo: alcance dos Reels, 620 contra faixa de 1.500 a 8.000.** Os 3 primeiros segundos não prendem. Não adianta mexer na Carta enquanto quase ninguém chega nela.

---

## Anti-padrões do diagnóstico

- **"O funil todo está mal."** Não existe. Existe uma etapa quebrada e o resto sofrendo por consequência.
- **Atacar a pior taxa em vez da primeira vermelha.** Remendo abaixo do furo.
- **Mexer em amarelo.** Gasta a semana, não move nada.
- **Diagnosticar a etapa 7 com 3 reuniões.** Amostra abaixo do piso, ver `confiabilidade-do-dado.md`.
- **Culpar o closer quando o gargalo é a Carta.** Reunião com lead errado não fecha por melhor que seja o script.
- **Dar 3 causas.** Se é ambíguo, diz o que medir pra desempatar.
