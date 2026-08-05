---
name: soft-negocio-metricas
description: "LÊ e INTERPRETA o número do negócio Soft, a skill que responde \"meu anúncio não converteu, por quê?\". Acha em QUAL etapa do funil o número quebrou (alcance, clique, DM, conversa, reunião, venda), compara PROJETADO x REALIZADO, separa número que decide de número de vaidade, barra a recomendação quando a amostra é pequena ou o rastreio quebrou, e devolve UM gargalo com UMA ação e a skill que conserta. Use pra \"por que não converteu\", \"diagnostica meu funil\", \"os números da semana\", \"caiu o resultado\", \"bati a meta?\", \"vale escalar?\". Esta skill LÊ o número; soft-leon CONSTRÓI a projeção e a rotina, soft-financeiro PUXA o dado de dinheiro, soft-trafego-meta DECIDE a verba."
---

# Ler o número e dizer o que fazer

O funil não quebra inteiro. Quebra em **UMA etapa**, e todas depois dela parecem ruins por consequência. Quem diz "o funil todo está mal" ainda não leu o número. Esta skill pega os números crus, acha a etapa que vaza, prova com a conta na tela e devolve **uma ação só** com a skill que executa.

## Output Contract
Saída **curta**: a conta na tela, o gargalo em 1 frase, 1 ação, 1 skill de destino. **Todo número com FONTE e DATA** (`Insights do Reel, 12 a 18/03`). **Nenhuma recomendação sem o delta projetado x real explícito.** **Amostra que não sustenta, a skill DIZ isso e não recomenda.** Sem referência do dono, `[A DEFINIR com o dono]`, nunca inventa benchmark.

## Passo 0, coleta os números (numa pergunta só)
Começa pelos **8 números da semana** (peças, alcance, engajamento qualificado, cliques, DMs, conversas, reuniões, vendas+receita) e pela **fonte de cada um**. Faltando número, pede o que falta **numa única mensagem**, nunca um por um. Sem número não existe diagnóstico: é palpite, e a skill usa essa palavra. Ancora também na meta, no ticket, na projeção e no histórico; sem eles sobra só o benchmark genérico, declarado em 1 linha: `coleta-e-fontes.md`.

## Passo 1, confiabilidade ANTES da leitura (NÃO PULE, bloqueante)
Chutar em cima de dado ruim é pior que não medir: gera decisão errada com cara de fato. Antes de ler qualquer taxa, roda os 4 testes: **amostra** (teve volume pra taxa significar algo?), **janela** (cobre o ciclo de venda inteiro?), **rastreio** (clique, tag e origem batem entre si?), **atribuição** (a venda da semana veio do lead da semana?). **Teste reprovado, a saída é como medir direito, não a recomendação:** escreve `AMOSTRA INSUFICIENTE` ou `RASTREIO QUEBRADO`, diz quanto falta, e para: `confiabilidade-do-dado.md`.

## Passo 2, calcula a conversão de CADA etapa e mostra a conta
Não descreve, calcula: `etapa N+1 ÷ etapa N`, uma linha por etapa, real ao lado da referência. **Faixa baixa é o default**, faixa alta só com 60+ dias de histórico próprio acima dela. **Do mês 3 em diante o benchmark sai e entram as taxas próprias:** quando mercado e histórico discordam, vence o histórico. As faixas e o piso de vazamento: `funil-etapa-a-etapa.md`.

## Passo 3, nomeia UM gargalo (a PRIMEIRA etapa vermelha)
A regra não é "a pior taxa", é **a primeira etapa vermelha de cima pra baixo**: mexer na etapa 6 com a 2 furada é remendo em cano que segue vazando. Vermelho é abaixo de 70% da referência, amarelo 70 a 99% (monitora, não mexe), verde na faixa ou acima. Nomeia em **uma frase**: `diagnostico-por-etapa.md`.

## Passo 4, fecha o loop PROJETADO x REALIZADO
Diagnóstico sem a meta é conserto sem destino. Compara com a projeção que gerou o plano em **três deltas**: **volume** (entrou menos gente), **taxa** (entrou o volume mas converteu menos), **receita** (volume e taxa bateram, o ticket caiu). Cada um pede conserto diferente, e confundi-los é o erro mais caro. **Nenhuma recomendação sai sem o delta na tela** (`projetado 40 DMs · real 23 · delta -42%`): `projetado-x-realizado.md`.

## Passo 5, separa o número que decide do de vaidade
Dois filtros na mesma peça: **algorítmico** (ficou acima do típico do próprio perfil?) e **financeiro** (tem chance de virar cheque?). **Divergiu, o financeiro vence:** peça abaixo da média que trouxe venda fica; acima da média que não move nada manda reavaliar segmentação, não replicar. Vaidade é like absoluto, seguidor total, impressão inflada, emoji. ROAS isolado entra na lista: **ROAS de palco não é ROI que paga conta**, e ROAS muito alto costuma sinalizar subinvestimento: `numeros-que-decidem.md`.

## Passo 6, responde "por que não converteu"
Pergunta aberta não se responde com opinião. Desce a escada: **sintoma → etapa onde o número parou → causa candidata → o que medir pra confirmar → ação**. O mesmo anúncio quebra em lugar diferente conforme onde parou: não viu (entrega e público), viu e não clicou (criativo e promessa), clicou e não virou lead (página e mensagem), virou lead e não comprou (oferta, preço ou conversa): `roteiro-por-que-nao-converteu.md`.

## Passo 7, entrega UMA ação e a skill que executa
Uma ação por ciclo, medida no ciclo seguinte, com o alvo declarado antes ("mede X; se subir pra Y, confirmou"). Cinco ações juntas destroem o aprendizado: nada fica atribuível. Cada causa tem dono: copy fraca → `soft-conteudo-*` · público errado → `soft-posicionamento` · oferta ou preço → `soft-posicionamento` (Bloco 3) · objeção → `soft-vendas`. Mapa completo: `causa-para-skill.md`.

## Passo 8, roda o gate por dentro e PARA
Confere em silêncio (nunca vai pra saída): fonte e data em toda métrica · confiabilidade aprovada ou saída virou "medir melhor" · a conta na tela · o delta escrito · UM gargalo, a primeira vermelha · UMA ação com número-alvo · zero benchmark inventado · zero travessão. Item reprovado refaz o passo, não a análise: `gate-linha-a-linha.md`. Mostra a leitura limpa e **para**.

## When NOT to use
Dashboard, rotina, projeção, plano de guerra → **soft-leon**. DRE, margem, preço, caixa → **soft-financeiro**. Quanto investir e pra qual público → **soft-trafego-meta**. Reescrever peça → **soft-conteudo-***. Carta ou página → **soft-funil-***. Objeção e closer → **soft-vendas**. Oferta e ticket → **soft-posicionamento**.

## References
- `coleta-e-fontes.md` (P0): os 8 números, onde medir, a pergunta única.
- `confiabilidade-do-dado.md` (P1, bloqueante): os 4 testes, pisos, prazo por ticket, recusa.
- `funil-etapa-a-etapa.md` (P2): as 7 etapas, fórmulas, faixas, vazamento, migração pra taxa própria.
- `diagnostico-por-etapa.md` (P3): sintoma → causa → o que medir; vazamento por estágio.
- `projetado-x-realizado.md` (P4): molde da comparação, os 3 deltas, revisão semanal/mensal/M3/M6.
- `numeros-que-decidem.md` (P5): duplo filtro, vaidade, ROAS x ROI, métrica por formato.
- `roteiro-por-que-nao-converteu.md` (P6): a escada para anúncio, página, webinar e conversa.
- `causa-para-skill.md` (P7): mapa causa → skill + molde da ação única.
- `gate-linha-a-linha.md` (P8): os checks e os anti-padrões da leitura.
