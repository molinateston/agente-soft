# TikTok Ads: o cérebro da plataforma de DESCOBERTA por criativo

> **Quando consultar:** quando o Passo P0 (escolha de plataforma) apontou TikTok, ou quando o dono pediu campanha/diagnóstico de TikTok Ads.
>
> **O que entrega:** o mapa 2025-2026 da plataforma (Spark Ads, Smart+, formatos, criativo nativo lo-fi, benchmarks, compliance, erros clássicos) pra montar o PLANO PRONTO PRA COLAR no TikTok Ads Manager. Sem execução via API por enquanto: o output desta via é sempre o plano manual, no formato do Output Contract da PARTE B sem motor.
>
> **A DOUTRINA DO DONO (bloco no SKILL.md) manda aqui igual manda no Meta:** proteção do sinal, anúncio específico, ROI absoluto, tudo nasce pausado, teste antes de escalar.

---

## 1. O que o TikTok é (e pra quem)

TikTok é descoberta por entretenimento: ninguém busca nada, o feed empurra e o CRIATIVO decide tudo. É a versão mais extrema da era Andromeda: o algoritmo entrega pra quem reage ao vídeo, e a segmentação manual pesa ainda menos que no Meta. Consequência dupla:
- **Entra no plano quando o avatar está lá**: público jovem em peso (a faixa 18-34 domina), com a faixa 25-44 crescendo; alcance grande no Brasil. Avatar 45+ conservador rende mais no Meta.
- **Só entra quem tem criativo NATIVO**: vídeo vertical lo-fi de celular. Quem só tem arte estática/carrossel polido não tem munição pra TikTok; volta pro Meta até ter.

## 2. Spark Ads (a prova de que a doutrina do dono está certa)

Spark Ad = verba em cima de um **post orgânico REAL** (do perfil do dono ou de creator que autorizou via código), mantendo perfil, curtidas e comentários visíveis. É a regra-mãe "turbina a peça que JÁ provou no orgânico" institucionalizada pela própria plataforma.

**O benchmark validado (Nielsen, 780 campanhas de resposta direta):** Spark Ads fecharam **CPA médio de US$ 14,62 contra US$ 23,18** dos formatos não-Spark. O CPC do Spark é ~38% mais caro, mas o CTR sai ~2,4x maior e a conversão ~44% maior, então o CPA efetivo despenca. Recomendação de mercado: **40-60% da verba em Spark** nos nichos de consumo.

**Regra Soft:** no TikTok o default de criativo pago é Spark sobre peça orgânica validada (acima da média do perfil, o mesmo critério do Passo A2). Anúncio feito do zero (non-Spark) é a exceção, não o começo.

## 3. Smart+ (o Advantage+ deles)

Smart+ é a campanha automatizada do TikTok: entrega, público e combinação de criativos por conta do algoritmo, você entrega os insumos. Réguas práticas:
- **4-6 criativos diversos** já na criação da campanha (a variação é o combustível, igual à esteira do Meta).
- **Verba diária de pelo menos 20x o CPA-alvo** pra sair da fase de aprendizado com dado confiável; em modo Cost Cap a régua sobe (referência de mercado pra app: ~30x; Maximum Delivery: ~10x).
- Público amplo por default; restringe só idade/região necessárias. Manual detalhado só nas mesmas exceções do Passo A3 do Meta (retargeting, regulado, geografia dura).
- Igual ao Meta: conversão PROFUNDA como evento de otimização (lead qualificado/agendamento/compra via pixel do TikTok ou Events API), nunca clique/visualização, e o aprendizado pede na casa de 50 conversões/semana pra estabilizar.

## 4. Formatos (o que existe e o que importa)

| Formato | O que é | Regra Soft |
|---|---|---|
| **Spark Ad** | verba sobre post orgânico real | o DEFAULT (Seção 2) |
| **In-Feed (non-Spark)** | vídeo de anúncio comum no feed | exceção; só quando não há orgânico validado a turbinar |
| **Carrossel/imagem** | estático no feed | baixa prioridade: a plataforma é vídeo |
| **TopView / Branded** | takeover premium de abertura | fora do jogo solo (custo de marca grande) |

Especificação base: vertical 9:16, som LIGADO por desenho (o som é metade do criativo), legendas queimadas, 15-35s pro direct response.

## 5. Criativo nativo lo-fi (a lei da plataforma)

- **Hook em menos de 3 segundos** ou o resto do vídeo não existe. Hook rate é a primeira métrica de avaliação de criativo novo.
- **Lo-fi de celular vence estúdio**: o vídeo cru estilo creator segura mais os 3 primeiros segundos porque parece conteúdo, não anúncio. Anúncio polido "de marca" liga o radar de anúncio e é pulado (a mesma lei da esteira de criativos do Meta, ainda mais forte aqui).
- **Teste de hooks em série**: um vídeo-núcleo, 3-5 aberturas diferentes gravadas pros mesmos 3 segundos, cada versão como anúncio separado no mesmo grupo; o dado escolhe.
- A ordem de otimização da esteira do Meta vale inteira: formato → aberturas → ângulos primos → empilhamento; copy nova é a última mão.
- Roteiro/copy continuam vindo da soft-conteudo-reels (com o gate anti-IA); aqui só se planeja formato, hook e variação.

## 6. Benchmarks (referência geral; o comparativo interno manda)

**Globais 2026 (agregadores de benchmark, base majoritária EUA/Europa):** CPM ~US$ 13,26 · CTR ~1,77% · CVR ~2,01% · CPA médio ~US$ 32,74 · ROAS ~2,2. Tendência: CPM subindo (~16% a.a.), CVR levemente caindo; o criativo carrega cada vez mais o resultado.

**Brasil 2025-2026 (fontes BR agregadas):** CPM **R$ 10-30** (30-50% mais barato que o Meta no alcance) · CPC R$ 0,50-3,00 · CPL **R$ 15-80** conforme setor · orçamento mínimo técnico ~R$ 50/dia por grupo, recomendado R$ 80-100/dia pra dado confiável. CPM barato NÃO quer dizer lead barato: o funil do TikTok é mais frio, então o juiz continua sendo o **CPL final ponderado pela conversão em cliente e o ROI mensal absoluto**, nunca o CPM de palco.

## 7. Compliance (mais duro que o Meta, reprova rápido)

O review do TikTok derruba anúncio por padrão de copy que no Meta às vezes passa:
- **Proibido**: promessa de resultado garantido ou renda ("ganhe R$X", "resultado em Y dias" sem disclaimers), antes/depois em saúde/estética/emagrecimento, claim médico/financeiro sem habilitação, escassez falsa.
- **Atributo pessoal**: copy que afirma que o espectador TEM uma condição ("você que está endividado/acima do peso...") é reprovada; fala do problema em terceira pessoa ou da situação, não do espectador.
- **Conteúdo gerado por IA**: mídia sintética/fotorrealista gerada por IA sobe com o rótulo de conteúdo IA marcado (mesma disciplina da flag do Meta); branded content de creator exige a chave de conteúdo comercial ligada.
- Categoria regulada (saúde, finanças, educação com promessa de renda) tem política própria por país: **revisa a policy da categoria ANTES de escrever o plano**, não depois da reprovação. Reprovação repetida mancha a conta.

## 8. Erros clássicos (sintoma, correção)

| Sintoma | Correção |
|---|---|
| Subiu anúncio polido "de marca" | Lo-fi nativo de celular; polido liga o radar de anúncio |
| Ignorou o Spark e criou tudo do zero | Spark sobre orgânico validado é o default (CPA quase metade, Nielsen) |
| 1 criativo na campanha Smart+ | 4-6 criativos diversos na criação; a variação é o combustível |
| Verba de R$ 20/dia com CPA-alvo de R$ 40 | Verba diária ≥ 20x o CPA-alvo, senão o aprendizado nunca fecha |
| Otimizou pra visualização/clique | Evento profundo no pixel (lead qualificado/agendamento/compra) |
| Segmentação manual detalhada | Amplo por default; o criativo segmenta (mais ainda que no Meta) |
| Copy com "você que tem [condição]" | Atributo pessoal reprova; reescreve em terceira pessoa |
| Antes/depois ou promessa de renda | Policy derruba; refaz o ângulo com prova sem garantia |
| Leu o CPM barato e declarou vitória | CPL final + conversão em cliente + ROI absoluto decidem |
| Vídeo mudo ou com som opcional | Som ligado por desenho + legenda queimada |
| Escalou o vencedor dobrando a verba | Mesma régua do Meta: +20-50% por vez, salto reseta o aprendizado |

## 9. O que o plano pronto pra colar carrega (checklist de entrega)

Estrutura campanha → grupo de anúncio → anúncio no TikTok Ads Manager, com TODOS os campos: objetivo e evento de otimização (profundo) + como instalar/verificar o pixel do TikTok · Smart+ ou manual (e por quê) · Spark (qual post orgânico, como pegar o código de autorização) ou in-feed · público (amplo + restrições mínimas) · verba/dia (respeitando a régua 20x CPA) e duração · os 4-6 criativos com hook por variação (copy JÁ aprovada da soft-conteudo-reels) · o check de compliance da categoria · o passo a passo de onde clicar · os STOPs marcados (nada ativa sem OK do dono; tudo nasce pausado) · a régua de revisão (2 em 2 dias) e o ROI absoluto projetado.

---

## Fontes (consultadas 05/08/2026)

- Nielsen via Amra & Elma, Spark Ads statistics (CPA US$ 14,62 vs US$ 23,18; 780 campanhas): https://www.amraandelma.com/tiktok-spark-ads-statistics/
- Influee, TikTok Ads Benchmarks 2026 (CPM/CPA/CTR/CVR/ROAS): https://influee.co/blog/tiktok-ads-benchmarks
- TikAdTools, Smart Performance/Smart+ guide (réguas de verba e criativos): https://tikadtools.com/blog/tiktok-smart-performance-campaign/
- MB Advertising, creative best practices (hook, specs, UGC): https://www.mbadv.agency/tiktok-ads/creative-best-practices
- Julio Cesar VL, orçamento mínimo TikTok Ads Brasil: https://juliocesarvl.com.br/tiktok-ads/orcamento-minimo-tiktok-ads-brasil-2026/
- Everflux, quanto custa anunciar no TikTok (CPM/CPC/CPL BR): https://everflux.com.br/blog/quanto-custa-anunciar-tiktok/
