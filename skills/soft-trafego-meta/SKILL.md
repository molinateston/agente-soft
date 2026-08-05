---
name: soft-trafego-meta
description: 'DECIDE e EXECUTA o tráfego pago em 3 plataformas. Primeiro a CABEÇA: escolhe a plataforma (onde o avatar está + CPL relativo, Meta ~2,5x mais barato no Brasil como default; Google pra demanda ativa de busca; TikTok pra alcance jovem com criativo nativo), o que turbinar (peça que JÁ provou no orgânico), verba, dias, público, o 50/30/20, ROAS vs ROI real e o diagnóstico do que não retorna. Depois a MÃO: no Meta, a via completa, cria campanha ODAX na conta do dono, sobe criativo, publica post, liga o comment-to-DM, lê a métrica, escala ou pausa (nasce PAUSED); no Google Ads (Search, PMax, Demand Gen, tCPA/tROAS) e no TikTok Ads (Spark, Smart+) entrega o PLANO PRONTO PRA COLAR no gerenciador. Use quando o pedido for "impulsionar", "turbinar", "verba", "ROAS", "tráfego pago", "qual plataforma anunciar", "Google Ads", "PMax", "TikTok Ads", "Spark", "sobe/pausa/escala a campanha", "comment-to-DM", "métricas da conta". NÃO use pra COPY/CTA do anúncio (soft-conteudo-*), ARTE (soft-designer), lançamento (soft-launch).'
---

# Tráfego Meta: primeiro DECIDE, depois EXECUTA

Tráfego pago não substitui posicionamento, acelera o que já funciona organicamente. Ligar antes do orgânico validar é pagar pra acelerar erro. Esta skill é o ciclo inteiro do tráfego Meta em duas metades na ordem obrigatória: a **PARTE A (a cabeça)** decide o que turbinar, com quanta verba, por quantos dias, pra qual público, e diagnostica a campanha que não retorna; a **PARTE B (a mão)** pega o plano APROVADO e executa na conta do dono: cria a campanha, sobe o criativo, publica o post, liga a automação, lê a métrica, escala ou pausa. A PARTE A roda no chat sem credencial nenhuma; a PARTE B precisa de credencial/motor, e toda operação gasta ou pode gastar dinheiro real, então a regra-mãe é uma: **nada entra no ar sem OK explícito do dono, toda campanha nasce PAUSED.**

**O que esta skill NÃO faz:** não escreve a copy/CTA da peça (soft-conteudo-headlines/-carrossel/-reels) nem faz a arte (soft-designer). Ela parte de uma peça que já existe e performou.

**As 6 leis (valem antes de tudo):** (1) nunca escreve como se o cliente já soubesse o contexto, zero palavra difícil, cria o contexto antes da afirmação; (2) abre ensinando o que faz; (3) é consultiva, puxa de você os números reais do perfil antes de decidir; (4) contexto é rei; (5) **admite se faltar insumo, nunca inventa**: confere se tem os números reais (engajamento das peças, custo, verba) antes de montar o plano e, se faltar, marca `[DADO: confirmar]` e diz o que falta, jamais inventa métrica plausível; (6) **doc de output enxuto pros 2 leitores**: o que sai é o plano acionável (o que turbinar · verba · dias · público · régua), zero meta-narração. (Detalhe em `shared-references/operacao-padrao.md`, Seção 0.)

**Este SKILL.md é o processo inteiro. Siga os passos na ordem (A antes de B, sempre), pare nos checkpoints, e confira os pré-requisitos antes de qualquer plano ou operação.**

## Output Contract (o que você entrega)
**Da PARTE A (decisão):**
- **Um plano de impulsionamento acionável:** lista de peças candidatas (priorizadas por engajamento orgânico real) + por peça o objetivo · público · verba/dia · duração · métrica-chave.
- **A distribuição mensal da verba** no 50/30/20 (Distribuição Pura · Lead · Remarketing).
- **A régua de decisão** (continuar · trocar público · pausar) por custo por seguidor, e o **ROI mensal absoluto**, não só o ROAS.
- Quando o tráfego já roda, **o diagnóstico** (sintoma → causa → fix), um gargalo + um ajuste por vez.
- Você **nunca inventa número do perfil nem do criativo** e **nunca monta plano sem os pré-requisitos cumpridos**.

**Da PARTE B (execução):**
- **No Claude Code / agente (tem Bash + credencial):** a operação EXECUTADA na conta: IDs criados (campaign_id, adset_id, ad_id, creative_id), o post publicado (media_id + permalink), a automação ligada (id + status), as métricas lidas (tabela). Tudo nasce PAUSED; a ativação é uma call separada COM OK do dono. A entrega final é um **arquivo `.md`** (o runbook do que foi feito + IDs + próximos passos) cujo **path completo vai na resposta**.
- **No app/chat (sem Bash):** se o dono adicionou o **conector MCP da pipeboard**, você opera por ele (com o "pode ativar?" antes de cada escrita). Sem o conector, você NÃO opera a plataforma e entrega o **plano de campanha pronto pra colar no Gerenciador** (a estrutura campanha → ad set → ad → criativo com todos os campos + o passo a passo de onde clicar) + as **copys/legendas finais** (= a copy JÁ APROVADA da `soft-conteudo-*` transcrita no campo exato do anúncio (`link_data`/`caption`), NÃO copy nova escrita aqui) + o mapa de campos da automação, tudo num doc MD, fechando em 1 linha que conectar a pipeboard executa isso sozinho. Quando não há conector, os STOPs NÃO são perguntas de aprovação ao vivo: não há o que ativar, o doc é o deliverable inteiro pro dono da credencial; o plano só MARCA onde quem executa precisa parar e obter o OK do dono antes de ativar/publicar.
- Você **nunca ativa campanha nem muda budget sem OK explícito**. Você **nunca inventa uma métrica**: número vem da API real; sem leitura, marca `[LER: rodar insights]`.

## ⚠️ ENTREGA = UM doc MD, SEMPRE
O RESULTADO desta skill sai como **UM documento markdown consolidado**. No **claude.ai**, um **artifact de markdown** (o dono abre, copia, baixa); no **Claude Code / agente**, um **arquivo `.md`** salvo no disco cujo **path completo vai na resposta**. A CONDUÇÃO (perguntas, os STOPs de aprovação, "pode ativar?") acontece no chat; o RUNBOOK/checklist/IDs moram no DOC. No agente/Telegram, a resposta ao dono é sem markdown pesado (sem tabela crua, sem bloco de código gigante): frase curta + o path do arquivo. Sem o doc entregue, a skill não terminou.

---

# PASSO P0: ESCOLHE A PLATAFORMA (antes da PARTE A)

Esta skill cobre 3 plataformas. **Meta é a via completa** (decide E executa na conta, todo o corpo abaixo, nada do que segue muda); **Google Ads e TikTok Ads entregam o PLANO PRONTO PRA COLAR** no gerenciador de cada uma (sem execução via API por enquanto), com o cérebro de cada plataforma em `references/google-ads.md` e `references/tiktok-ads.md`. A PARTE A (pré-requisitos, funções, régua, ROI) roda igual pra qualquer plataforma; o que muda é a mão da PARTE B.

**A régua de escolha (aplica na ordem):**
1. **Onde o avatar está.** Plataforma sem o avatar não entra no plano, por mais barata que seja. Demanda ativa (gente JÁ buscando o problema no Google) = Google Search entra; público jovem + munição de vídeo nativo lo-fi = TikTok entra; todo o resto (e o avatar 45+ conservador em particular) = Meta.
2. **CPL relativo.** Default Brasil: o Meta entrega o lead do perfil Soft na casa de 2,5x mais barato, então ele é o ponto de partida. Sai do Meta só com motivo declarado no plano: **Google** pra CAPTURAR demanda ativa de busca (o lead chega pronto e encurta o funil, o que paga o CPL maior); **TikTok** pra alcance jovem com criativo nativo (CPM 30-50% mais barato que o Meta, mas funil mais frio: o juiz é o CPL final, não o CPM).
3. **Uma plataforma por vez.** Solo iniciando valida no Meta primeiro (é onde o método roda inteiro); a segunda plataforma só entra com a primeira dando ROI absoluto positivo e verba sobrando. Nunca dilui verba mínima em 3 frentes.

## DOUTRINA DO DONO (camada comum, as 3 plataformas obedecem)
Vale IGUAL em Meta, Google e TikTok; nenhum plano de nenhuma plataforma sai sem os 5:
1. **Proteção do pixel/sinal:** otimiza SEMPRE por conversão PROFUNDA (agendamento, lead qualificado, compra), nunca clique/visualização/engajamento; rastreio verificado ANTES de ligar; o curioso não entra no sinal.
2. **Capa por terreno:** anúncio nasce ESPECÍFICO (capa/gancho no Meta e no TikTok, keyword + headline no Google); o criativo é a segmentação, amplo genérico atrai curioso e suja o sinal.
3. **ROI absoluto:** a decisão é o ROI mensal ABSOLUTO, nunca só ROAS/CPL/CPM de palco.
4. **PAUSED por padrão:** tudo nasce pausado; ativar, escalar ou mudar verba é call separada com OK explícito do dono, em qualquer plataforma.
5. **Teste antes de escalar:** só recebe verba o que JÁ provou (peça orgânica validada, Spark sobre post real, Search sobre demanda que existe); escala devagar (+20-50% por vez), salto reseta o aprendizado.

---

# PARTE A: DECIDE (a cabeça, roda antes de qualquer operação na conta)

A função do impulsionar é uma: pegar a peça que JÁ provou ROI no orgânico e multiplicar o alcance dela pro público certo, medindo cada real.

## Passo A0, confere os PRÉ-REQUISITOS (gate bloqueante, NÃO PULE)
Tráfego acelera o que já funciona. Ligar antes destes 5 itens é pagar pra acelerar erro. **Se algum falta, PARA e diz o que falta, não monta plano de verba:**

| Pré-requisito | Por quê |
|---|---|
| Posicionamento empacado (Plano de pé) | Sem isso, tráfego atrai público errado |
| Perfil convertendo (visita → seguir) | Sem isso, o lead chega e vaza |
| Destino no ar (Mini Carta / isca / DM com palavra) | Sem isso, o lead clica e não tem pra onde ir |
| ≥1 peça orgânica acima da média do perfil | É o que diz O QUE turbinar com confiança |
| Primeira venda do método já fechada | Confirma que a oferta converte antes de escalar |

Com os pré-requisitos ok, **ancora nos números REAIS do perfil** (engajamento das últimas peças, custo atual se já roda). Sem os números, pergunta numa mensagem e marca `[DADO: confirmar]`, nunca assume.

## Passo A1, escolhe o nível
- **Turbinar (botão nativo):** amplifica peça orgânica que já provou ROI (40+ curtidas orgânicas naturais). R$10-15/dia por peça, 3-7 dias. Simples, custo baixo, menos controle de público. É onde o solo começa. **Só vale pra peça de gancho específico**: peça de capa ampla NUNCA entra pelo botão nativo (regra da capa por terreno, abaixo).
- **Gerenciador de Anúncios:** campanhas estruturadas (públicos custom, lookalike, remarketing, pixel de conversão). R$50+/dia sustentado. Entra quando o turbinar atinge teto e o especialista quer escalar.

## Passo A2, identifica os candidatos e a função de cada um
Olha as peças orgânicas dos últimos 30 dias (números reais). Candidato = top 3 carrosséis (swipe + saves acima da média) + top 3 reels (watch time + sends acima da média). Cada peça serve uma das **3 funções**, cada uma com criativo e métrica próprios:

| Função | O que faz | Criativo | Métrica-chave |
|---|---|---|---|
| **Atração** (público frio) | traz quem não te conhece | vídeo/carrossel longo que filtra (quem vê 90% É o cliente) | custo por visita ao perfil / por seguidor |
| **Lead** (DM ou Carta) | captura mensagem/clique | carrossel 3C com CTA forte ou reel curto com hook + CTA | custo por mensagem no DM (alvo < R$3) |
| **Remarketing** (já se envolveu) | reapresenta a quem interagiu 30-90 dias | depoimento, caso, seeding, oferta direta | conversão (3-5x a do frio) |

(A métrica-chave por formato e o duplo filtro algorítmico × financeiro, o Modo Avaliar de duplo eixo da peça antes de publicar, estão em `references/metricas.md`.)

## Passo A3, define público, verba e duração (era Advantage+: amplo é o default)
- **Público, o default é AMPLO (Advantage+).** Desde o motor Andromeda, o leilão da Meta entrega melhor com targeting amplo e o CRIATIVO fazendo a segmentação: o algoritmo acha quem reage à peça, e a capa/gancho específico filtra o lead (a regra da capa por terreno, abaixo, é a outra metade disso). Restringe só o necessário (idade, região/idioma quando o serviço exige) e deixa o resto com o Advantage+. Fonte: guias Andromeda/Advantage+ 2026 (Meta Business News, Jon Loomer, Segwise).
- **Targeting manual é EXCEÇÃO DOCUMENTADA, não a via principal.** Só sai do amplo em 3 casos, e o plano registra qual: (a) **remarketing/custom**, quem visitou o perfil ou interagiu 30-90 dias (a fatia dos 20%), e lookalike de compradores quando já há 1.000+ qualificados; (b) **nicho regulado ou geografia dura** (serviço local); (c) **conta nova sem sinal**, que roda 1 ciclo de interesse do nicho só pra gerar os primeiros dados. No manual, mantém o público entre 100k-500k (estreito demais o algoritmo não escala).
- **Verba/duração (solo iniciando):** R$10-15/dia por peça, 3-7 dias (R$30-105 por peça).

## Passo A4, distribui a verba (50/30/20)
Metade da verba é **Distribuição Pura**, não captação: aparecer com vídeo longo pra construir público customizado de qualidade (quem assiste 90% vira base de remarketing futuro muito superior).

| Função | % da verba |
|---|---|
| Distribuição Pura (atração via vídeo longo) | 50% |
| Lead (DM ou Carta) | 30% |
| Remarketing (quente, 30-90 dias) | 20% |

## Passo A5, a régua de decisão e o ROI (revê a cada 2 dias)
**Custo por seguidor (proxy de criativo + segmentação):**

| Custo por seguidor | Decisão |
|---|---|
| até R$0,80 | bom, aumenta a verba 50% por +7 dias |
| R$0,80 a R$0,99 | troca o público (fadiga ou segmentação errada) |
| R$1,00 ou mais | cara, pausa essa peça e sobe a próxima da lista |

**ROAS de palco × ROI de empresa:** ROAS muito alto sinaliza SUBINVESTIMENTO. Escalar é aceitar ROAS menor com verba maior, porque o ROI absoluto cresce (retorno de R$5.000 com ROAS 10x perde, em ROI, pra R$25.000 com ROAS 5x). **Sempre calcula o ROI mensal absoluto, não só o ROAS.**

Quando o tráfego já roda e não retorna, diagnostica **UM gargalo + UM fix por vez** (tabela completa em `references/modo-impulsionar.md` §10): custo por DM alto → CTA fraco (reescreve na `soft-conteudo-headlines`) · DMs chegam sem fechar → Carta ou público errado · tráfego roda mas o perfil não cresce → bio/destaques (volta pra `soft-posicionamento`).

## ERA ANDROMEDA: ESTRUTURA ENXUTA, O CRIATIVO É A SEGMENTAÇÃO (atualizado 05/08/2026)

Desde o motor Andromeda e o pacote Advantage+, o leilão recompensa consolidação e volume de criativo, não engenharia de público. Três consequências práticas no plano:
1. **Menos campanhas, menos ad sets, mais criativos.** Consolida a verba em POUCOS ad sets amplos e concentra a variação nos criativos: a régua de mercado é 15-25 criativos diversos por ad set. Fragmentar em muitos ad sets divide o sinal e prende tudo no aprendizado.
2. **O criativo segmenta, o público não.** O targeting amplo do Passo A3 só funciona porque a capa/gancho específico faz o filtro (regra da capa por terreno, abaixo). Amplo + criativo genérico é pagar pra atrair curioso.
3. **Volume de teste paga.** Quem testa 20+ anúncios novos por mês opera com ROAS na casa de 65% acima de quem testa menos de 10 (Segwise, 2026). A ESTEIRA DE CRIATIVOS da PARTE B é o combustível disso: a esteira produz a variação, a estrutura enxuta consome.

## REGRA DA CAPA POR TERRENO E PROTECAO DO PIXEL (validada por benchmark, 04/08/2026)

**Anúncio nasce com capa/gancho ESPECÍFICO, sempre.** No Meta atual o criativo É a segmentação: o algoritmo entrega a peça pra quem reage a ela. Gancho amplo em anúncio atrai o curioso e entrega lead ruim; em anúncio, o filtro entra na capa, não depois.

**Viral orgânico de capa ampla + final específico PODE receber verba**, mas só com as 3 condições duras cumpridas AO MESMO TEMPO:
1. **Objetivo de CONVERSÃO com evento profundo** (agendamento, lead qualificado), nunca clique nem visualização.
2. **NUNCA pelo botão Impulsionar do app nem com objetivo de engajamento/ThruPlay.** É exatamente isso que degrada o sinal do pixel.
3. **Volume mínimo pra sair do aprendizado:** ~50 conversões/semana como régua.

**PROIBIDO: verba de engajamento em viral de capa ampla.** Sem exceção.

**Por quê:** o pixel em campanha de conversão aprende só com quem dispara o evento; o curioso que entra pela capa ampla e sai cedo NÃO entra no sinal, então a capa ampla não contamina o aprendizado. Já em campanha de engajamento/ThruPlay o algoritmo otimiza justamente pro curioso, e o sinal do pixel apodrece. Benchmark: post orgânico validado + objetivo de conversão fechou CPA de $14,62 contra $23,18 do criativo feito do zero (Nielsen, 780 campanhas, TikTok Spark Ads; o mecanismo é análogo no Meta).

## Passo A6, confere o plano (gate interno) e PARA
Antes de entregar o plano, confere internamente (a tabela NÃO vai pra saída):

| Check | Passa se |
|---|---|
| **Pré-requisitos** | os 5 do Passo A0 cumpridos; algum faltando = PARA, não entrega plano |
| **Números reais** | toda métrica vem do perfil real; número inventado/plausível = refaz e marca `[DADO: confirmar]` |
| **Distribuição** | a verba respeita o 50/30/20 (ou justifica o desvio em 1 linha) |
| **Régua definida** | cada peça tem objetivo · público · verba/dia · duração · métrica-chave + a decisão por custo |
| **ROI calculado** | o plano mostra o ROI mensal absoluto, não só o ROAS |
| **Capa por terreno** | nenhuma peça de capa ampla com verba fora das 3 condições; zero verba de engajamento em viral amplo; nada de capa ampla pelo botão nativo |
| **Público na era certa** | default amplo Advantage+ com o criativo segmentando; targeting manual só com a exceção (a/b/c do A3) registrada no plano; estrutura enxuta (poucos ad sets, variação nos criativos) |
| **Acionável** | o especialista sai sabendo o que turbinar, com quanto, por quanto tempo, pra qual público |

Mostra **só o plano LIMPO** e PARA pro dono aprovar antes de ligar a verba ou diagnosticar outra campanha. Não narra o fluxo. **Só depois do plano aprovado a PARTE B toca na conta.**

---

# PARTE B: EXECUTA (a mão, só com o plano da PARTE A aprovado)

## GATE DE ENTRADA (bloqueante, não pule)
Só executa se as duas condições abaixo estiverem cumpridas. Se qualquer uma falha, PARA e diz o que falta, não toca na conta:

1. **Os 5 pré-requisitos do Passo A0** (inteiros): (a) posicionamento de pé (Plano); (b) perfil convertendo (visita → seguir); (c) destino no ar: Mini Carta / isca / DM com palavra, **exceção**: o ad de ATRAÇÃO/story ad é CTA-less por desenho, o filtro de destino vale só pro ad de CONVERSÃO; (d) ≥1 peça orgânica acima da média do perfil; (e) primeira venda do método já fechada.
2. **Plano de tráfego aprovado**, saído da PARTE A: cada peça com objetivo · público · verba/dia · duração · métrica-chave, e a distribuição no 50/30/20. Sem plano, não há o que executar.

> Se o dono chegou pedindo "sobe a campanha" sem plano, você NÃO pula pra conta: roda a PARTE A primeiro (o que turbinar, quanto, quanto tempo, qual público), mostra o plano, e só com o OK dele executa.

## Os 3 ambientes (a mesma skill, entrega diferente)
| Ambiente | Tem Bash? | O que a PARTE B faz | Entrega |
|---|---|---|---|
| **app / chat (claude.ai)** | Não | Se o dono adicionou o **conector MCP da pipeboard**, opera por ele; senão prepara tudo: o **plano de campanha pronto pra colar no Gerenciador**, as copys/legendas prontas, o mapa de campos da automação | Operação feita (se conector) OU doc MD com o plano manual + copys, avisando que conectar a pipeboard executa isso sozinho |
| **Claude Code** | Sim | Executa via pipeboard (subprocess/MCP) ou Marketing API com as credenciais do ambiente: cria campanha/adset/ad, publica post, liga automação, lê métrica | Operação feita + arquivo `.md` (runbook + IDs + permalink) com o path na resposta |
| **agente / Telegram** | Sim | Igual ao Code, com a pipeboard/credenciais do dono no ambiente | Operação feita; resposta ao dono = frase curta sem markdown pesado + **path completo do arquivo** |

**Os STOPs em app/chat (sem conector):** sem credencial nem conector nada pode ser ativado nem publicado, então "pode ativar?" e "publico e ligo?" NÃO são perguntas de aprovação ao vivo. O plano apenas MARCA no doc, no ponto exato, onde quem executa precisa parar e obter o OK do dono antes de ativar/publicar. Nunca simule um "pode, pode ativar" do dono nem finja que ativou: o doc é o deliverable inteiro. Se o dono tem o **conector MCP da pipeboard** no app, aí sim os STOPs voltam a ser perguntas ao vivo (você opera).

**Pedido que junta as duas trilhas:** se a mensagem combina campanha paga (Passo B2/B4) E publicação + automação comment-to-DM (Passo B3) numa coisa só, o doc carrega AS DUAS trilhas (ou executa em sequência no Code/agente). Nunca dropa uma metade em silêncio: atendeu a campanha, atende também a publicação, e vice-versa.

## MOTOR DE EXECUÇÃO (o fork tool-adaptive: entrega o melhor com o que o dono tem AGORA)
Esta skill NUNCA para por falta de ferramenta. Ela detecta o que o dono tem conectado e usa o melhor caminho; o que muda é COMO a operação sai, não SE sai. Roda o GATE DE ENTRADA acima ANTES de qualquer coisa; só depois escolhe o motor.

**COM a pipeboard conectada (remote OU self-host) = EXECUTA de verdade.** A `pipeboard` (motor `meta-ads-mcp`, open source sob BSL 1.1, livre pro nosso uso dentro da skill/produto) expõe as tools reais da Meta Ads via MCP. Você opera a conta chamando os tools reais, com o "pode ativar?" respondido pelo dono antes de CADA escrita:
- Descoberta/leitura: `get_ad_accounts`, `get_campaigns`, `get_adsets`, `get_ads`, `get_insights`.
- Público: `search_interests`, `search_behaviors`, `search_demographics`, `search_geo_locations` (só pra EXCEÇÃO documentada do plano; o default amplo Advantage+ não precisa de ID de interesse).
- Criação (tudo nasce PAUSED): `create_campaign`, `create_adset`, `upload_ad_image`, `create_ad_creative`, `create_ad`.
- Edição/ativação: `update_adset`, `update_ad` (pra pausar/ativar/mudar budget, sempre call separada COM OK).

**SEM a pipeboard (nem outro motor Meta) = ENTREGA O PLANO PRONTO PRA EXECUTAR NA MÃO.** Nunca um "não consigo". Você monta o **plano de campanha completo pronto pra colar no Gerenciador de Anúncios**: a estrutura campanha → ad set → ad → criativo com todos os campos (objetivo ODAX, público detalhado, verba/dia, duração, criativo, legenda aprovada, CTA/destino) e o **passo a passo exato de onde clicar** no Gerenciador. Mesma qualidade de método, só a execução fica na mão do dono. Fecha em 1 linha: *"conectar a pipeboard (setup ~2 min) faz a skill subir isso sozinha, sem você tocar no Gerenciador"*, sem empurrar.

Se a casa opera por **Marketing API direta** (token próprio no ambiente), esse é um terceiro caminho de execução real, equivalente à pipeboard self-host; detalhe em `references/meta-api.md`.

**Credenciais / conexão (Code/agente):**
- pipeboard remote: token da `pipeboard.co/api-tokens` (setup ~2 min, ideal pra você TESTAR já).
- pipeboard self-host: Meta Developer App + token próprio da Meta (ideal pro PRODUTO, a casa dona, sem SaaS terceiro por cliente).
- Marketing API direta: `META_ACCESS_TOKEN`, `META_AD_ACCOUNT_*` (`act_<id>`), `META_PAGE_ID` (Página, obrigatória pro criativo), `META_PIXEL_ID` (+ CAPI token, obrigatório pra SALES + site).
- Publicação de post no IG (Passo B3): token do tipo Instagram Login em `graph.instagram.com`, independente do motor de ads.

No **app/chat** não há credencial nem Bash: você não opera. Ou o dono **adiciona o conector MCP da pipeboard** (aí a operação roda pelo próprio app), ou você entrega o **plano manual pronto pra colar**. No **Code/agente**, confere quais variáveis/conexões existem antes de operar; se faltar a que a operação precisa, PARA e pede ao dono (sem inventar).

> As duas trilhas de conexão da pipeboard (A remote 2-min pro teste × B self-host BSL pro produto), o setup, a auth e o mapa das tools estão em `references/motor-pipeboard.md`. Os endpoints da Marketing API direta ficam em `references/meta-api.md`. **O corpo abaixo já é executável; as references são só profundidade.**

## PASSO B1: Auditoria da conta (antes de criar nada)
Antes de subir campanha nova, diagnostica a conta na sequência canônica (nunca pule pra "criar" numa conta que já queima verba):

1. Lista contas (descobre `act_<id>`, confere que a conta está habilitada).
2. Opportunity score (0-100, **nível de CONTA**, nunca atribua a uma campanha).
3. Sinal de anomalia (desvio, é observação não causa).
4. Benchmarks de leilão + de indústria (competitividade, audiência sobreposta).
5. Erros de entrega (só hard-stops, não performance).

**No Code/agente (ou app com conector):** roda as leituras (`get_ad_accounts` → insights → benchmarks) e lê. **No app sem conector:** entrega a sequência de diagnóstico como plano manual (onde clicar no Gerenciador pra ver score/anomalia/erros). Se a conta tiver problema estrutural (erro de entrega, pixel morto), PARA e reporta antes de criar campanha.

## PASSO B2: Cria a estrutura (tudo nasce PAUSED)
Hierarquia da Meta: **Campanha → Conjunto de anúncios (ad set) → Anúncio (ad) → Criativo.**

1. **Campanha** (`create_campaign`): objetivo ODAX (`OUTCOME_AWARENESS/TRAFFIC/ENGAGEMENT/LEADS/SALES/APP_PROMOTION`). Nunca objetivo legado. O objetivo vem do plano da PARTE A (a função Atração/Lead/Remarketing mapeia pro objetivo). **Otimize pra VENDA, não pra lead**: quando o destino é venda, o objetivo é `OUTCOME_SALES` e a otimização é conversão de compra, não volume de lead barato. **Proteção do pixel na execução:** viral de capa ampla só sobe com objetivo de CONVERSÃO e evento profundo (agendamento/lead qualificado); NUNCA suba capa ampla com `OUTCOME_ENGAGEMENT`/ThruPlay nem pelo botão Impulsionar do app (regra da capa por terreno, PARTE A). Budget na campanha = CBO; deixe vazio pra ABO (budget no ad set). CBO e ABO são mutuamente exclusivos.
2. **Ad set** (`create_adset`): público do plano. **Default = AMPLO (Advantage+)**: só idade/região necessárias, sem caixinha de interesse; os `search_interests`/`search_behaviors`/`search_demographics`/`search_geo_locations` entram SÓ quando o plano registrou a exceção do Passo A3 (remarketing/custom, regulado, conta sem sinal). Estrutura enxuta: poucos ad sets, a variação vai nos criativos (15-25 por ad set). Posicionamentos, agenda, e o budget se ABO. Pra `OUTCOME_SALES` + site, o `promoted_object` com o **pixel** é OBRIGATÓRIO (sem ele a campanha não otimiza pra compra).
3. **Criativo** (`upload_ad_image` → `create_ad_creative`): a peça (imagem/vídeo + copy). A COPY e o CTA vêm da `soft-conteudo-headlines/-carrossel/-reels`; a ARTE vem da `soft-designer`. Aqui você sobe a arte e monta o creative object (precisa do `page_id`).
4. **Ad** (`create_ad`): liga o ad set ao criativo. Precisa de `ad_set_id`, `ad_name`, `creative`.

**Story ad em 2 camadas (decisão da PARTE A, respeite na execução):**
| Camada | CTA no criativo | Objetivo típico |
|---|---|---|
| **ATRAÇÃO** (story ad) | **SEM CTA** (a segmentação faz o trabalho; não force botão) | tráfego/alcance qualificado, métrica = custo por visita ao perfil R$0,15-0,25 |
| **CONVERSÃO** (carrossel 3C, reel com hook, oferta) | **CTA com destino, sem exceção** | LEADS ou SALES, leva a destino no ar (Mini Carta, isca, DM, checkout) |

Cobrar CTA/destino de um story ad de atração quebra a camuflagem que o faz funcionar. Não faça.

**Os 10 elementos do bom anúncio (checagem antes de subir o creative):** o criativo que vai pro ar tenta carregar, de forma natural, os 10: curiosidade, promessa, segmentação, problema, spoiler do mecanismo, autoridade, benefício, prova social, urgência, CTA. A estrutura solta é AIDA. Régua: se falta um, ainda pode vender, mas você tenta pôr todos sem forçar. Isto é CHECAGEM, não escrita: o roteiro/copy vem pronto da `soft-conteudo-headlines/-carrossel/-reels` (já passou no anti-ia); se o criativo entregue não carrega os essenciais, bounce de volta pra lá, nunca reescreve a copy aqui.

**Compliance de conteúdo IA (Meta, obrigatório desde março/2026):** anúncio com mídia GERADA ou MODIFICADA por IA sobe com a flag de conteúdo IA marcada. MARCA quando o criativo carrega: pessoa, voz ou cenário fotorrealista gerado por IA, avatar sintético, voz clonada, ou edição que muda o que a mídia mostra (rosto, fundo ou produto trocado). NÃO precisa marcar: copy escrita com IA, corte/cor/upscale leve, arte gráfica que não simula registro real. Na dúvida, marca: IA não declarada é motivo comum de reprovação desde março/2026 e mancha o histórico da conta. Fonte: política de transparência de conteúdo IA da Meta (mar/2026).

**STOP**, mostra a estrutura montada (ainda PAUSED) e pergunta "pode ativar?". Não ativa por conta própria. **Em app/chat sem conector** esse STOP não é pergunta ao vivo (não há o que ativar): o plano só MARCA no doc onde quem executa precisa obter o OK do dono antes de ativar; nunca simule o OK nem finja que ativou. Com o conector MCP da pipeboard no app, o STOP é ao vivo.

## PASSO B3: Publica o post + liga o comment-to-DM (publicação; pode vir JUNTO da campanha)
Quando o pedido é publicar um post orgânico e ligar a automação, o fluxo é o abaixo. Este passo NÃO é alternativa ao Passo B2: se a mensagem pede campanha paga E publicação/automação, o doc carrega as duas trilhas (Passo B2/B4 + Passo B3), nunca só a primeira metade.

**Publicação (Instagram, `graph.instagram.com`, NÃO facebook):**
1. Cada card do carrossel numa **URL pública própria** (Cloudflare Pages / hospedagem estática do negócio, `CLOUDFLARE_API_TOKEN` no ambiente). **NUNCA** Litterbox/Catbox/Imgur: o scraper da Meta bloqueia (erro 9004). Valida que respondem 200 antes de publicar; se a Meta rejeitar o JPEG (erro 36001), recompress `quality=92, optimize=True` e adiciona `?v=$(date +%s)` pra furar o cache.
2. Cria N containers `is_carousel_item=true` → espera cada `status_code=FINISHED` → cria container `media_type=CAROUSEL` com `children` + `caption` → `media_publish` com `creation_id`. Salva o `media_id` e pega o `permalink`.

**Automação comment-to-DM** (liga o comentário com a palavra-chave ao DM, entregando o lead pro fluxo de vendas):
- Campos: `media_id` do post · `keywords` (a palavra-chave do CTA, ex. "QUERO") · `reply_public_variants` (5 variações da resposta pública, pra não soar bot) · `dm_text` (no tom do dono, sem link cru) · `dm_buttons` com **`quick_reply`** (payload único e descritivo) · `delay_seconds: 3`.
- **Regra dura:** o botão é `quick_reply`, NÃO `web_url`. `quick_reply` entrega o lead pro fluxo do SDR (a conversa chega no DM e o vendedor assume); `web_url` abre link externo mas NÃO entrega pro fluxo. Pra handover, sempre `quick_reply`.
- A Private Reply leva o botão anexado JUNTO no mesmo payload, nunca numa 2ª chamada.

A legenda que vai no `caption` = a copy JÁ APROVADA da `soft-conteudo-*` transcrita, nunca copy nova escrita aqui; se veio crua da conversa, PARA e volta pra soft-conteudo antes de publicar.

**STOP**, publicação e automação também são ações no ar. Mostra a legenda + os campos da automação e pergunta "publico e ligo?". **Em app/chat sem conector** esse STOP não é pergunta ao vivo: entrega tudo como plano manual (você não tem como publicar sem credencial) e MARCA no doc onde parar pro OK do dono; nunca simule o OK nem finja que publicou.

## PASSO B4: Ativa (só com OK) e depois lê as métricas
- **Ativar:** a hierarquia inteira precisa estar ativa pra entregar; ativa de cima pra baixo (campanha → ad set → ad), via `update_adset`/`update_ad` (mudar `status` pra ACTIVE). É uma call separada, SEMPRE com o "pode ativar?" respondido pelo dono.
- **Ler métrica** (`get_insights`): puxa por nível (`campaign/adset/ad`), com os campos (inclui id+name), filtro, ordenação, breakdowns e janela de tempo. Pra ver topo E fundo, duas leituras com ordenação invertida.
- A DECISÃO sobre o que a métrica significa (continuar/trocar público/pausar/escalar, ROI absoluto) é da **PARTE A**: a PARTE B LÊ e ENTREGA o número; a leitura da régua (Passo A5) decide. Você executa o que a régua mandar (pausar a peça cara, escalar a vencedora devagar: R$50→R$70, não pula de 30 pra 300).

## REGRAS AUTOMATIZADAS DE PROTEÇÃO (a régua do A5 rodando agendada)

A régua "revê a cada 2 dias" da PARTE A não fica só na mão: vira regra condição → ação agendada, no modelo das ferramentas de automação do mercado (Revealbot: checagem de 15 em 15 min até diária). No Code/agente, agenda a checagem (cron + `get_insights`); no app sem motor, o doc entrega as 3 regras prontas pro dono criar nas Regras Automatizadas nativas do Gerenciador.

| Regra | Condição (checa no mínimo 1x/dia) | Ação |
|---|---|---|
| **Stop-loss (CPA estourado)** | custo por resultado acima do teto da régua (seguidor R$1,00+, DM R$3+, ou o CPA-teto do plano) por 2 dias seguidos | PAUSA a peça. É a única escrita que roda sem pergunta ao vivo, e SÓ se o dono pré-autorizou o teto no plano aprovado |
| **Escalar o vencedor** | custo por resultado no alvo (ou abaixo) por 3+ dias com volume estável | PROPÕE +20-50% de verba e espera o OK; escala devagar (R$50 → R$70), nunca salto. Essa escrita jamais roda automática |
| **Fadiga (frequência alta)** | frequência acima de ~3-4 em 7 dias, ou CTR caindo com CPM subindo | ALERTA pra trocar o criativo (puxa a próxima variação da esteira); não mexe em verba sozinha |

O freio é o mesmo da skill inteira: **regra automatizada nunca ganha poder que o dono não deu.** Pausar por stop-loss é proteção de dinheiro que o dono autorizou uma vez (o teto está no plano aprovado); ativar, escalar e mudar budget continuam call separada com o "pode ativar?" respondido.

## A ESTEIRA DE CRIATIVOS (o que variar pra testar, e em que ordem)
A PARTE A decide SE produz mais criativo e quanto testar; a PARTE B sabe COMO nasce a variação e em que ordem gastar a alavanca barata antes da cara. O roteiro/copy sai da `soft-conteudo-reels`; aqui você mexe no FORMATO, na ABERTURA e na MODELAGEM da mesma mensagem que JÁ funciona, nunca reescreve o roteiro. Princípio: só processualiza depois de achar o que funciona (itera primeiro, monta a esteira depois).

**Ordem de otimização (exaure o barato antes de escrever copy nova):**
1. **Formato.** Com um criativo validado, a troca que mais move o resultado é o FORMATO, mais que um hook novo. Grava a MESMA copy validada em muitos formatos (falando pra câmera, dentro do carro, no mercado com o produto na mão, andando, fundo verde infinito) até um estourar. Fundo verde vira criativo infinito: regrava a mesma copy sem depender de cenário.
2. **Aberturas segmentadas.** Mesma copy, varia só os primeiros segundos por público ("se você é X..."). Acha o público de menor custo por resultado sem tocar no miolo. É a alavanca mais barata pra baixar o custo por resultado.
3. **Ângulos primos (adjacentes).** Só depois de esgotar formato e abertura, testa ângulos vizinhos do que venceu (mesma dor, causa-raiz ou promessa ligeiramente diferente). Ângulo que já venceu vira ativo de swipe: guarda e reusa com mais prova por cima.
4. **Empilhamento de ganchos.** Empilha 3 ou mais aberturas diferentes antes de entregar a mensagem (chama, chama, chama, e só então entrega). Parece estranho, o teste valida, não briga com o número.

**As 3 modelagens (como nasce cada variação):**
- **Preguiçosa** (o pão de cada dia, a maior parte do que sobe): pega um anúncio validado, troca o gancho e o formato, mantém a mensagem intacta.
- **Estudiosa** (pra bater o controle): a estrutura invisível. Transcreve o anúncio que mais vende no nicho, marca frase por frase qual ELEMENTO ela é (curiosidade, promessa, problema, prova, mecanismo, CTA), e reescreve cada ponto melhor NA MESMA ORDEM. O que vende é a ordem em que a informação aparece, não as palavras exatas.
- **Crazy** (quando o nicho secou de referência): modela um anúncio de OUTRO nicho com IA e adapta a mecânica pro seu.

**Anúncio não pode parecer anúncio.** A pessoa cria radar de anúncio: foge dos hooks que todo mundo usa e disfarça a venda no formato (o formato "conteúdo" derruba o radar). Trocar o formato é o que impede o cérebro de etiquetar "vão me vender" e pular o criativo.

**Onde minerar a variação (orgânico é a melhor fonte de pesquisa).** O que já viralizou no orgânico provou puxar atenção, transpõe pro pago com potência. Fontes: as ferramentas de espionagem de anúncios (muito anúncio ativo do mesmo anunciante = está escalando, vale modelar), os livros mais vendidos revelam o mecanismo da vez, buscas em alta e vídeos de muitas views revelam ângulo e formato. Não inventa dor no vácuo: olha o que a audiência JÁ consome e no que JÁ gasta dinheiro. E lembra a regra da capa por terreno: viral de capa ampla que vai receber verba só entra por conversão com evento profundo, nunca por engajamento.

Cada variação que sai daqui sobe pelo PASSO B2 (executada com a pipeboard, ou listada no plano pro Gerenciador sem ela): a esteira alimenta o teste, o motor decide só COMO a variação entra no ar.

## PASSO B5: Gate interno e PARA
Antes de entregar, confere (a tabela NÃO vai pra saída):

| Check | Passa se |
|---|---|
| **Gate de entrada** | os 5 pré-requisitos (Passo A0) + plano aprovado da PARTE A; algum faltando = PARA, não toca na conta |
| **Nasce PAUSED** | nada foi ativado sem o "pode ativar?" respondido pelo dono |
| **Objetivo certo** | ODAX (nunca legado); SALES+site tem pixel no `promoted_object`; otimiza pra venda não pra lead barato |
| **Pixel protegido** | nenhuma capa ampla subiu com engajamento/ThruPlay nem pelo botão Impulsionar; viral amplo com verba = conversão + evento profundo + ~50 conversões/semana |
| **Métrica real** | todo número vem da API; sem leitura, marca `[LER: rodar insights]`, nunca inventa |
| **IA declarada** | mídia gerada/modificada por IA subiu com a flag de conteúdo IA marcada (política Meta mar/2026); na dúvida, marcou |
| **Proteção agendada** | as 3 regras (stop-loss, escalar, fadiga) entraram agendadas ou no doc pro Gerenciador; nenhuma regra com poder que o dono não deu |
| **quick_reply** | a automação usa `quick_reply` (entrega o lead), não `web_url` |
| **Legenda vetada** | a legenda/copy = a aprovada da `soft-conteudo-*` (já passou anti-ia), nunca reescrita aqui; se veio crua/não-vetada, PARA e volta pra soft-conteudo antes de montar o creative |
| **10 elementos** | o criativo que sobe carrega os essenciais (curiosidade/promessa/segmentação/problema/mecanismo/autoridade/benefício/prova/urgência/CTA); faltando os essenciais, bounce pra soft-conteudo, não reescreve aqui |
| **Ordem da esteira** | ao produzir variação, exaure formato → aberturas → ângulos primos → empilhamento antes de pedir copy nova; não trocou a copy pulando o formato |
| **Trilha completa** | se o pedido juntou campanha E publicação/automação, o doc carrega as DUAS; nenhuma metade foi dropada |
| **Não parou por ferramenta** | com pipeboard/motor = executou; sem = entregou o plano pronto pro Gerenciador + 1 linha do que a pipeboard liberaria; nunca "não consigo" |
| **Doc + path** | a entrega é UM doc MD; no Code/agente o path completo do arquivo vai na resposta |

Mostra só o resultado LIMPO (IDs, permalink, métricas ou checklist) e PARA. Não narra o fluxo.

## Exemplo denso (inline): subir uma campanha SALES de conversão pela pipeboard
> Plano aprovado na PARTE A: turbinar o carrossel "3 erros que enterram a agenda" (28 saves orgânicos, acima da média), função LEAD→venda, R$40/dia, 7 dias, público amplo Advantage+ (o gancho específico do carrossel segmenta), destino = Mini Carta no ar. Gate de entrada: 5 pré-requisitos ok, plano aprovado. Ambiente: Claude Code, pipeboard conectada (remote).

1. **Auditoria** (Passo B1): `get_ad_accounts` acha a conta (`act_...`), leio insights/benchmarks pra opportunity score, anomalia, erros. Conta limpa, sem hard-stop. Sigo.
2. **Campanha** (Passo B2, `create_campaign`): `OUTCOME_SALES`, ABO (budget vazio na campanha), status `PAUSED`. Nome: `SALES · carrossel-agenda · lookalike1 · 2026-07`.
3. **Ad set** (`create_adset`): budget R$40/dia, público AMPLO com Advantage+ (só 25-55 Brasil, sem caixinha de interesse: o criativo segmenta; os `search_*` ficariam pra uma exceção documentada do plano), posicionamento Instagram feed+stories, `promoted_object` com o pixel e evento `PURCHASE` (obrigatório pra SALES+site). Otimização = conversão de compra, **não** cliques nem leads.
4. **Criativo** (`upload_ad_image` → `create_ad_creative`): subo os cards já hospedados no Cloudflare Pages (respondendo 200), monto o creative com o `page_id`, a legenda aprovada (veio da soft-conteudo-carrossel, passou no anti-ia), CTA "Saiba mais" → link da Mini Carta. Cards são arte gráfica, sem mídia simulando registro real: a flag de conteúdo IA não se aplica (se levasse avatar ou voz sintética, subia com a flag marcada).
5. **Ad** (`create_ad`): ligo ad set + creative. Tudo `PAUSED`.
6. **STOP**: mostro os IDs criados (campaign/adset/ad) e a estrutura, pergunto "pode ativar? Vai gastar R$40/dia por 7 dias (R$280)."
7. Com o OK: ativo de cima pra baixo (`update_adset`/`update_ad` → ACTIVE, campanha → ad set → ad).
8. **Entrega**: salvo `runbook-campanha-agenda-2026-07-04.md` com os IDs, a verba, a janela e "revisar métrica em 2 dias (`get_insights`) e voltar pra régua da PARTE A decidir continuar/pausar". Respondo com o path completo do arquivo.
>
> **Sem a pipeboard** (nem token da casa): o mesmo Passo B2 a B5 sai como plano pronto pra colar no Gerenciador (objetivo, público, verba, criativo, onde clicar), e fecho: "conectar a pipeboard (2 min) faz a skill subir isso sozinha".

## When NOT to use (manda pra skill certa)
- Pediu a **COPY/CTA** do anúncio ou da legenda, ou o **CORPO** da peça a ser turbinada → **soft-conteudo-headlines / -carrossel / -reels**.
- Pediu a **ARTE/PNG/visual** do criativo ou dos cards → **soft-designer**.
- Pediu **lançamento pago tático** (evento, ingresso, congresso, pico de data) → **soft-launch**.
- Pediu o **Plano / posicionamento / perfil** → **soft-plano-posicionamento**.
- Pediu **diagnóstico de Story pago / infiltrado** → **soft-conteudo-stories**.

## GATE DURO ANTES DE EXECUTAR (checklist bloqueante, confere item a item)
1. Algum viral de capa ampla recebendo verba? SO com objetivo de CONVERSAO profunda. OUTCOME_TRAFFIC, engajamento ou ThruPlay em viral amplo = plano REPROVADO, refaz.
2. A distribuicao 50/30/20 esta integra? Sumir com a fatia de remarketing sem justificativa escrita = REPROVADO.
3. O plano imprime o ROI mensal ABSOLUTO (nao so ROAS)? Sem ele o Output Contract nao foi cumprido: nao entrega.

## Anti-Patterns (sintoma → correção)
| Sintoma | Correção |
|---|---|
| Montou plano sem os pré-requisitos | Passo A0 é bloqueante: para e diz o que falta antes de qualquer verba |
| Turbinou peça sem teste orgânico | Só turbina peça com 40+ curtidas orgânicas naturais (acelerar erro queima dinheiro) |
| Verba de R$5/dia | Mínimo R$10-15/dia, senão o algoritmo não aprende |
| Tudo em Lead, nada em Distribuição Pura | Aplica os 50% de Distribuição: é o público de remarketing futuro |
| Olhou só o ROAS | Calcula o ROI mensal absoluto; ROAS alto pode ser subinvestimento |
| Montou targeting manual (interesse/lookalike) como via principal | Era Andromeda: o default é amplo Advantage+ com o criativo segmentando; manual só na exceção documentada do A3 (e aí mantém 100k-500k) |
| Público amplo com criativo genérico | Amplo só funciona com capa/gancho específico filtrando; amplo + peça genérica enche a conta de curioso |
| Fragmentou a verba em muitos ad sets | Estrutura enxuta: consolida em poucos ad sets amplos e varia nos criativos (15-25 por ad set); fragmentar divide o sinal |
| Inventou um número do perfil | Só número real; sem fonte, marca `[DADO: confirmar]` e pergunta |
| Mesmo criativo 30+ dias | Refresca a cada 14 dias (a fadiga sobe o custo) |
| Entregou o plano sem o que falta declarado | Lei 5: admite o furo, marca `[DADO: confirmar]`, nunca inventa o número |
| Subiu anúncio com gancho amplo | Anúncio nasce com capa/gancho específico; o criativo é a segmentação, gancho amplo entrega lead ruim |
| Pôs verba de engajamento num viral de capa ampla | PROIBIDO; viral amplo só recebe verba por conversão com evento profundo, fora do botão Impulsionar, com ~50 conversões/semana |
| Impulsionou viral pelo botão do app | Botão Impulsionar/engajamento degrada o sinal do pixel; sobe pelo Gerenciador com objetivo de conversão |
| Ativou campanha ou mudou budget sem OK | Regra de ouro: nasce PAUSED, ativar é call separada COM o "pode ativar?" respondido |
| Subiu mídia gerada por IA sem declarar | Política Meta desde mar/2026: sobe com a flag de conteúdo IA marcada; na dúvida, marca (reprovação suja a conta) |
| Deixou a régua rodando só na mão | As 3 regras de proteção (stop-loss, escalar, fadiga) entram agendadas ou no doc pro Gerenciador; pausa pré-autorizada no plano, escala sempre com OK |
| Parou porque não tinha pipeboard conectada | Tool-adaptive: sem motor, entrega o plano de campanha pronto pra colar no Gerenciador (nunca "não consigo") e fecha dizendo que conectar a pipeboard executa sozinho |
| Executou sem o plano da PARTE A | Gate de entrada: sem plano aprovado, PARA e roda a PARTE A primeiro |
| Objetivo legado (LINK_CLICKS, BRAND_AWARENESS) | Só ODAX (`OUTCOME_*`) |
| Otimizou pra lead barato numa campanha de venda | Otimiza pra VENDA (conversão de compra); lead barato enche de curioso, não de comprador |
| CBO + budget no ad set ao mesmo tempo | Mutuamente exclusivo: escolhe um |
| SALES + site sem pixel no `promoted_object` | Pixel obrigatório, senão não otimiza pra compra |
| Atribuiu opportunity score a uma campanha | É nível de CONTA, nunca de campaign/adset/ad |
| Automação com botão `web_url` | Usa `quick_reply` (entrega o lead pro fluxo); `web_url` não entrega |
| Hospedou os cards em Litterbox/Catbox/Imgur | O scraper da Meta bloqueia (9004); usa Cloudflare Pages / hospedagem própria, valida 200 |
| Publicou post pelo `graph.facebook.com` | Post IG roda em `graph.instagram.com`, token Instagram Login |
| Inventou uma métrica de campanha | Só número da API; sem leitura, marca `[LER: rodar insights]` |
| Forçou CTA num story ad de atração | Atração é CTA-less por desenho; CTA quebra a camuflagem, vale só no ad de conversão |
| Escalou a peça vencedora de 30 pra 300 | Escala devagar (R$50→R$70); salto queima o aprendizado do algoritmo |
| Trocou a copy antes de esgotar o formato | Ordem da esteira: formato → aberturas → ângulos primos → empilhamento; copy nova é a última alavanca, não a primeira |
| Reescreveu o roteiro/copy do anúncio aqui | A copy é da soft-conteudo; nesta skill você varia FORMATO/ABERTURA/MODELAGEM da mesma mensagem validada, não escreve roteiro novo |
| Criativo com hook manjado que grita "anúncio" | Foge do hook que todo mundo usa e disfarça a venda no formato; a pessoa tem radar de anúncio |
| Gerou variação inventando dor no vácuo | Minera o que JÁ viralizou no orgânico e o que o concorrente JÁ escala; o validado prova puxar atenção antes de virar pago |

## References (só pra profundidade, o corpo acima é autossuficiente)
- `references/modo-impulsionar.md`: a engenharia completa da metade que DECIDE (pré-requisitos, 2 níveis, 3 funções, ROAS×ROI, Distribuição Pura, régua de custo por seguidor, workflow de turbinar em 6 passos, anti-padrões e a tabela de diagnóstico §10). É a fonte da verdade da PARTE A. **Dirigida em todos os passos A.**
- `references/metricas.md`: as métricas que importam por formato + o duplo filtro (algorítmico × financeiro, "cada post é cheque", o Modo Avaliar de duplo eixo) + o princípio do comparativo interno (teu perfil é a bússola, não o benchmark de fora). **Dirigida nos Passos A2 e A5.**
- `references/ads-de-webinar.md`: a COPY do anúncio de tráfego frio que enche o WEBINAR (promessa do webinar em ADMA <15s, bateria ângulos×temperos, legenda, gate próprio). **Dirigida quando o tráfego pago for pra encher um webinar** (a verba/régua é a PARTE A; a arte é da soft-designer).
- `references/motor-pipeboard.md`: as duas trilhas de conexão da pipeboard (A remote `meta-ads.mcp.pipeboard.co` com token, setup 2-min pro teste × B self-host BSL com Meta Developer App próprio pro produto), a auth de cada, o mapa das tools reais expostas (`create_campaign`/`create_adset`/`upload_ad_image`/`create_ad_creative`/`create_ad`/`get_insights`/`search_*`) e a licença BSL 1.1. **Fonte da verdade do motor de execução.**
- `references/meta-api.md`: a Marketing API direta (endpoints + credenciais da casa) como caminho de execução real equivalente ao self-host, a estrutura oficial da campanha, os workflows canônicos (auditoria, criar SALES, não-entrega) e os anti-patterns técnicos da API. **Profundidade da via por token.**
- `references/google-ads.md`: o cérebro do Google Ads 2025-2026 (Search vs PMax vs Demand Gen e quando cada um, estrutura de conta enxuta, a escada de lances tCPA/tROAS, públicos-sinal, criativos por formato, benchmarks EUA e Brasil com fonte, erros clássicos, e o checklist do plano pronto pra colar). **Dirigida quando o Passo P0 apontar Google.** Sem execução via API: a entrega é o plano manual.
- `references/tiktok-ads.md`: o cérebro do TikTok Ads 2025-2026 (Spark Ads com o benchmark Nielsen, Smart+, formatos, a lei do criativo nativo lo-fi, benchmarks globais e Brasil com fonte, compliance, erros clássicos, e o checklist do plano pronto pra colar). **Dirigida quando o Passo P0 apontar TikTok.** Sem execução via API: a entrega é o plano manual.
- `references/publicacao-e-automacao.md`: a publicação de post no `graph.instagram.com` (containers → carrossel → publish) e a automação comment-to-DM (campos, `quick_reply` vs `web_url`, Private Reply, os gotchas de hospedagem/cache/token). **Dirigida no Passo B3.**
- `scripts/lint_copy.py`: no Claude Code, roda `python3 scripts/lint_copy.py` em qualquer CTA/copy que passar pela tua mão (reprova em-dash e a família proibida). No chat não roda.
