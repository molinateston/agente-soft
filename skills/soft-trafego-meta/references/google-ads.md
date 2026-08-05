# Google Ads: o cérebro da plataforma de DEMANDA ATIVA

> **Quando consultar:** quando o Passo P0 (escolha de plataforma) apontou Google, ou quando o dono pediu campanha/diagnóstico de Google Ads.
>
> **O que entrega:** o mapa 2025-2026 da plataforma (qual campanha, estrutura enxuta, lances, públicos-sinal, criativos, benchmarks, erros clássicos) pra montar o PLANO PRONTO PRA COLAR no Google Ads. Sem execução via API por enquanto: o output desta via é sempre o plano manual, no formato do Output Contract da PARTE B sem motor.
>
> **A DOUTRINA DO DONO (bloco no SKILL.md) manda aqui igual manda no Meta:** proteção do sinal de conversão, anúncio específico, ROI absoluto, tudo nasce pausado, teste antes de escalar.

---

## 1. O que o Google é (e o que ele não é)

Meta e TikTok interrompem quem não pediu; o Google Search captura quem JÁ está procurando. Essa é a diferença que decide a plataforma: **Google entra quando existe demanda ativa**, gente digitando o problema ou a solução na busca. Se ninguém busca o que o especialista vende (mecanismo novo, categoria que o público não sabe nomear), Search rende pouco e o dinheiro fica melhor no Meta; nesse caso só Demand Gen/PMax competem, e aí o Meta costuma ganhar no custo (ver a régua do Passo P0).

**Teste rápido antes de propor Google:** existe volume de busca pro problema/nicho? (Planejador de palavras-chave ou a própria barra de sugestão do Google). Sem volume de busca, sem Search.

## 2. Qual campanha: Search vs PMax vs Demand Gen

| Campanha | Onde roda | Quando usar | Quando NÃO usar |
|---|---|---|---|
| **Search** | rede de busca | demanda ativa de alta intenção; serviço/lead com busca existente; quando a mensagem precisa de controle palavra a palavra | público que não busca o tema; topo de funil |
| **Performance Max (PMax)** | TODO o inventário (Search, YouTube, Display, Discover, Gmail, Maps) | volume de conversão com sinal forte (conversão profunda importada, lista de clientes); e-commerce | conta nova sem histórico de conversão; rastreio frouxo (a IA otimiza pra ruído) |
| **Demand Gen** | YouTube, Discover, Gmail | gerar demanda visual em quem não busca (o "modo Meta" do Google); topo/meio com controle de público | quando o mesmo público sai mais barato no Meta (checa CPL relativo antes) |

**Régua de entrada pro perfil Soft (especialista, lead pra DM/Carta/agendamento):** começa por **Search** com a demanda que já existe; PMax só depois que o Search acumulou conversões (30+ /mês) pra alimentar o sinal; Demand Gen é a última fatia, e só se o custo bater o Meta no mesmo público. A recomendação oficial do Google pra 2026 ("Power Pack") distribui PMax 30-60% + Search 30-40% + Demand Gen 10-20%, mas ela assume conta madura; conta iniciando inverte: Search primeiro.

## 3. Estrutura de conta ENXUTA (a era da consolidação, espelho do Andromeda)

O mesmo movimento do Meta aconteceu no Google: o Smart Bidding recompensa consolidação, não engenharia de conta. Regras:

1. **Poucas campanhas, separadas por OBJETIVO de negócio**, nunca por dispositivo nem por match type. Objetivo de lead e objetivo de venda nunca dividem a mesma campanha (PMax inclusive: 2 objetivos = 2 campanhas).
2. **Grupos de anúncio TEMÁTICOS** (um tema de intenção por grupo), não um grupo por palavra-chave. A estrutura de 1 keyword por grupo morreu: fragmenta o dado e prende o algoritmo no aprendizado.
3. **Broad match + Smart Bidding + rastreio confiável** é o trio que escala (orientação oficial do Google Ads Help): com lance inteligente, não há ganho em manter 3 match types da mesma palavra; broad é o único que usa todos os sinais de intenção. **Condição dura:** broad match SÓ com Smart Bidding ligado e conversão verificada; broad com lance manual é queimar verba. Lista de **negativas** revisada toda semana no início (broad puxa lixo até aprender).
4. Over-segmentar é o erro número 1 da plataforma, igual fragmentar ad sets no Meta: divide o sinal.

## 4. Lances (a escada tCPA/tROAS)

| Fase | Lance | Régua de entrada |
|---|---|---|
| Início (sem histórico) | Max Conversions (volume, sem alvo) | rastreio verificado, verba estável |
| Meio | **tCPA** (custo-alvo por conversão) | 30+ conversões/30 dias no mínimo oficial; na prática 50-80 antes de confiar |
| Escala com valor | **tROAS** (retorno-alvo) | 50+ conversões no mínimo oficial; na prática 100+; exige valor de conversão rastreado |

- **Alvo inicial conservador:** tCPA 15-20% ACIMA do teu CPA real atual, apertando aos poucos; tROAS no teu ROAS médio de 30 dias, apertando 10-15% por vez.
- **Nenhuma mudança (alvo ou verba) acima de 20% por vez**; mudança grande reseta o aprendizado (a mesma regra do "escala devagar, R$50 pra R$70" do Meta).
- **Armadilha do tCPA:** ele otimiza VOLUME no custo-alvo e não distingue lead lixo de negócio fechado. A defesa é a Seção 6 (sinal profundo).

## 5. Públicos-sinal (PMax e Demand Gen)

Sinal de público é ponto de PARTIDA do algoritmo, não cerca. Ordem de força:
1. **Lista de clientes** (Customer Match): quem já comprou.
2. **Convertidos** e visitantes do site 30-90 dias.
3. Segmento personalizado por intenção (o que o avatar busca) só na falta dos dois primeiros.

Sinal estreito demais repete o erro do targeting manual no Meta: limita a descoberta. Alimenta com o 1st-party mais forte e deixa a máquina expandir. Sem NENHUM dado próprio (conta zero), roda Search primeiro e volta pro PMax quando houver lista.

## 6. Proteção do SINAL de conversão (o "pixel" do Google, gate duro)

A conversão importada é o equivalente exato do pixel do Meta, e a doutrina do dono vale inteira:
- **Rastreio verificado ANTES de ligar qualquer campanha.** Campanha com rastreio quebrado = a IA otimizando pra ruído. Sem tag disparando testada, o plano é REPROVADO.
- **UMA ação de conversão primária, e ela é PROFUNDA** (agendamento, lead qualificado, compra), nunca clique nem pageview. As outras ações viram secundárias (observação). Empilhar ações primárias conflitantes é o erro mais comum de PMax.
- **Enhanced Conversions / conversão offline importada** quando a venda fecha fora do site (DM, call): devolve pro Google quem VIROU cliente, e o tCPA passa a caçar comprador, não curioso. É o antídoto da armadilha do lead barato.
- Léxico da capa por terreno traduzido: no Google, "capa" = keyword + headline do anúncio. **Anúncio de Search nasce com keyword e headline ESPECÍFICAS do terreno**; termo amplo genérico com headline genérica atrai o clique curioso e suja o sinal igual capa ampla no Meta.

## 7. Criativos por formato

| Formato | O que precisa | Regra Soft |
|---|---|---|
| **RSA (Search)** | até 15 headlines + 4 descrições; o Google combina | headlines da soft-conteudo-headlines, cada uma autossuficiente; densidade máxima nos 30 caracteres |
| **PMax assets** | textos + imagens (1.1, 1.91:1, 4:5) + logo + **VÍDEO** | sem vídeo próprio o Google AUTO-GERA um a partir das imagens, e o auto-gerado performa pior; YouTube é dos placements que mais convertem no PMax, então vídeo próprio é obrigatório no plano |
| **Demand Gen** | vídeo vertical 9:16 + imagens | vale a esteira de criativos da PARTE B: mesmo criativo validado do Meta transposto, hook específico |

Copy e arte continuam vindo das skills soft-conteudo-* e soft-designer; aqui só se monta o plano de assets.

## 8. Benchmarks (referência geral; o comparativo interno do perfil manda, como sempre)

- **EUA (WordStream/LocaliQ 2025, 16.000+ campanhas de Search):** CPL médio geral **US$ 70,11**; extremos de US$ 28,50 (auto/reparo) a US$ 131,63 (advogados). Serve de teto mental, não de meta.
- **Brasil 2025-2026 (fontes BR agregadas: Veezy, witu.digital, Babi Tonhela):** CPL de **R$ 15-80** em consumo/serviço local/e-commerce; **R$ 80-250** em B2B; jurídico/saúde/educação premium chegam a R$ 300+. CPC médio BR entre **R$ 2,50 e R$ 18-25** conforme setor.
- Comparativo de plataforma pro Passo P0: no perfil Soft típico (lead de DM/agendamento, consumo), o Meta costuma entregar o lead na faixa de 2 a 3x mais barato que o Search; o Search compensa quando a intenção da busca encurta o funil (lead que chega pronto). CPL barato não é o juiz: **CPL ponderado pela conversão em cliente** é (a mesma lei do ROAS de palco vs ROI real).

## 9. Erros clássicos (sintoma, correção)

| Sintoma | Correção |
|---|---|
| Ligou campanha sem rastreio verificado | Gate duro: conversão testada ANTES; senão a IA aprende ruído |
| Otimizou pra clique/pageview | Conversão primária = evento profundo; clique nunca é conversão |
| Várias ações primárias conflitantes | UMA primária, resto secundária |
| PMax na conta zero, sem sinal nem lista | Search primeiro; PMax quando houver 30+ conversões/mês de histórico |
| SKAG / um grupo por keyword / campanha por dispositivo | Consolida: poucos grupos temáticos, o Smart Bidding precisa do dado junto |
| Broad match com lance manual | Broad só com Smart Bidding + negativas semanais |
| tCPA ligado com 10 conversões no histórico | Espera as 30+ (ideal 50-80); antes disso Max Conversions |
| Alvo de tCPA agressivo de largada | 15-20% acima do CPA real, aperta depois |
| Mudou alvo e verba 50% de uma vez | Máximo 20% por mudança; grande = reset de aprendizado |
| PMax sem vídeo próprio | O auto-gerado performa pior; vídeo entra no plano de assets |
| Headline genérica em keyword ampla | Capa por terreno: keyword + headline específicas filtram o curioso |
| Leu só o CPL e escalou | ROI mensal absoluto + qualidade do lead (conversão em cliente) decidem |

## 10. O que o plano pronto pra colar carrega (checklist de entrega)

Estrutura campanha → grupo de anúncio → anúncio, com TODOS os campos: tipo de campanha e por quê · objetivo/conversão primária (profunda) e como verificar o rastreio · lance (fase da escada + alvo) · verba/dia e duração · keywords (tema por grupo) + negativas iniciais · públicos-sinal (se PMax/Demand Gen) · assets por formato (com a copy JÁ aprovada da soft-conteudo-*) · o passo a passo de onde clicar no Google Ads · os STOPs marcados (nada ativa sem OK do dono; tudo nasce pausado) · a régua de revisão (2 em 2 dias, mesma lógica do A5) e o ROI absoluto projetado.

---

## Fontes (consultadas 05/08/2026)

- WordStream/LocaliQ, Google Ads Benchmarks 2025: https://www.wordstream.com/blog/2025-google-ads-benchmarks
- Google Ads Help, broad match + Smart Bidding: https://support.google.com/google-ads/answer/10195720
- Google Ads Help, ABCs of Account Structure: https://support.google.com/google-ads/answer/14752782
- Groas, Smart Bidding 2026 (tCPA/tROAS, limiares práticos): https://www.groas.com/post/google-ads-smart-bidding-strategy-guide-2026-target-cpa-vs-target-roas
- Groas, Demand Gen vs PMax 2026: https://www.groas.com/post/demand-gen-vs-performance-max-2026-honest-comparison-google-ads
- TrafficGuard, erros comuns de PMax: https://www.trafficguard.ai/blog/common-mistakes-marketers-make-in-pmax-campaigns
- Veezy, custo por lead Google Ads BR: https://veezymedia.com.br/marketing-digital/custo-por-lead-google-ads/
- witu.digital, CPL benchmarks B2B Brasil: https://witu.digital/custo-por-lead-cpl-benchmarks-b2b/
