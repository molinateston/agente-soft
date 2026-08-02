# reference: execução Meta Ads (Marketing API direta)

> Memória operacional de quem opera a conta de anúncios de verdade pela Marketing API direta (via por token da casa). É um dos caminhos de execução real, equivalente à pipeboard self-host. Aqui mora a estrutura oficial da campanha, os endpoints, os workflows canônicos e os anti-patterns da API. O motor MCP (pipeboard) e suas duas trilhas de conexão estão em `motor-pipeboard.md`. O corpo da SKILL.md já é executável; aqui mora a profundidade que o app não abre.

## Índice
- 0. Onde esta via entra (× o motor pipeboard)
- 1. Estrutura oficial de uma campanha
- 2. Endpoints da Marketing API direta (+ credenciais da casa)
- 3. Otimizar pra VENDA, não pra lead
- 4. Workflows canônicos
- 5. Anti-patterns técnicos da API
- 6. Regra de ouro de segurança

---

## 0. Onde esta via entra (× o motor pipeboard)

A skill tem dois caminhos de execução REAL, além do plano manual quando não há nenhum:

- **Motor pipeboard (MCP):** a `meta-ads-mcp` expõe as tools reais (`create_campaign`, `create_adset`, `upload_ad_image`, `create_ad_creative`, `create_ad`, `update_adset`, `update_ad`, `get_insights`, `search_*`). Duas trilhas de conexão (remote 2-min × self-host BSL). Detalhe em `motor-pipeboard.md`. É o caminho principal do produto.
- **Marketing API direta (esta reference):** a casa fala com o Graph por token próprio (`META_ACCESS_TOKEN`), sem MCP no meio. Equivale à pipeboard self-host em capacidade; é o que a casa já usa por token hoje.

As duas mexem na mesma conta, escrita total sem undo. A segurança está na regra de ouro (Seção 6), não na plataforma. Quando NENHUMA está disponível, a skill entrega o plano pronto pra colar no Gerenciador (nunca para por falta de motor).

---

## 1. Estrutura oficial de uma campanha

Hierarquia: **Campanha → Conjunto de anúncios (ad set) → Anúncio (ad) → Criativo.**

- **Campanha:** define o objetivo (ODAX) e, se CBO, o orçamento. Objetivos ODAX válidos: `OUTCOME_AWARENESS`, `OUTCOME_TRAFFIC`, `OUTCOME_ENGAGEMENT`, `OUTCOME_LEADS`, `OUTCOME_SALES`, `OUTCOME_APP_PROMOTION`. Nunca objetivo legado (`LINK_CLICKS`, `BRAND_AWARENESS`, `CONVERSIONS` antigo, etc.).
- **Ad set:** público (targeting), posicionamentos, agenda e o orçamento se ABO. O `promoted_object` com `pixel_id` (+ evento, ex. `PURCHASE`) é OBRIGATÓRIO pra `OUTCOME_SALES` + site. **CBO (budget na campanha) e budget no ad set são mutuamente exclusivos**: escolhe um.
- **Ad:** liga o ad set ao criativo. Campos obrigatórios: `ad_set_id`, `ad_name`, `creative`.
- **Criativo:** a peça (imagem/vídeo + copy + CTA). Precisa de `page_id` (a Página do Facebook/Instagram). A COPY vem da soft-conteudo-*; a ARTE da soft-designer; aqui só se monta o objeto.
- **IDs envolvidos:** conta de anúncios (`act_<id>`), Página (`page_id` / `META_PAGE_ID`), Pixel/Dataset (`META_PIXEL_ID` e afins). Descobertos pelos tools/endpoints de descoberta.

**Todo nível nasce PAUSED.** A entrega só acontece com a hierarquia inteira ativa; ativa de cima pra baixo (campanha → ad set → ad), sempre com OK do dono.

---

## 2. Endpoints da Marketing API direta (+ credenciais da casa)

> Pra rodar o motor MCP (pipeboard) e o mapa das tools reais, ver `motor-pipeboard.md`. Esta seção é a via por token, falando com o Graph direto.

Base: `https://graph.facebook.com/<versão>/`. Credenciais no ambiente:
- `META_ACCESS_TOKEN`: o token.
- `META_AD_ACCOUNT_ID` (`act_<id>`): a conta de anúncios (use um sufixo por conta se tiver várias).
- `META_PAGE_ID`: a Página.
- `META_PIXEL_ID` (+ `META_CAPI_TOKEN`): pixel/dataset e o CAPI (conversões server-side). Se tiver mais de uma marca, um pixel por marca com sufixo próprio.

Endpoints principais (o `<versão>` segue a atual da conta):
- **Descoberta:** `GET /me/adaccounts`, `GET /<ad_account_id>/` (campos `name,account_status`), `GET /<business_id>/owned_pages` ou `GET /me/accounts` (pega `page_id`).
- **Campanha:** `POST /act_<id>/campaigns`: body: `name`, `objective` (ODAX), `status=PAUSED`, `special_ad_categories=[]` (ou a categoria se for regulado), e `daily_budget` só se CBO.
- **Ad set:** `POST /act_<id>/adsets`: `name`, `campaign_id`, `daily_budget` (se ABO), `billing_event`, `optimization_goal` (ex. `OFFSITE_CONVERSIONS` pra SALES), `promoted_object` (`{pixel_id, custom_event_type:"PURCHASE"}` pra SALES+site), `targeting`, `status=PAUSED`.
- **Criativo:** `POST /act_<id>/adcreatives`: `name`, `object_story_spec` (com `page_id`, `instagram_actor_id`/`instagram_user_id`, e o `link_data`/`video_data` com imagem+copy+CTA).
- **Ad:** `POST /act_<id>/ads`: `name`, `adset_id`, `creative={creative_id}`, `status=PAUSED`.
- **Ativar/pausar:** `POST /<entity_id>` com `status=ACTIVE` ou `PAUSED`.
- **Insights:** `GET /<entity_id>/insights`: `level`, `fields` (`spend,impressions,clicks,cpc,cpm,ctr,actions,cost_per_action_type,purchase_roas`), `time_range`, `breakdowns`, `filtering`.

CAPI (conversão server-side, opcional mas melhora a otimização): `POST /<pixel_id>/events` com o `META_CAPI_TOKEN`, enviando o evento `Purchase` com os dados hasheados do comprador.

---

## 3. Otimizar pra VENDA, não pra lead

Princípio herdado: uma campanha de venda otimiza pra **conversão de compra**, não pra volume de lead barato.
- Objetivo `OUTCOME_SALES`, `optimization_goal=OFFSITE_CONVERSIONS`, `promoted_object` com o pixel e `custom_event_type="PURCHASE"`.
- Lead barato enche a base de curioso que nunca compra; o algoritmo entrega pra quem clica fácil, não pra quem paga. A campanha de venda tem que ver o evento de compra pra aprender quem é comprador.
- Exceção legítima: a função **Lead** do plano (captura de DM/mensagem) usa `OUTCOME_LEADS` de propósito, porque ali o objetivo REAL é a conversa, não a compra imediata: mas isso é decisão da impulsionar, não default seu.
- A função **Atração** (story ad) usa tráfego/alcance; a métrica é custo por visita ao perfil (R$0,15-0,25), não conversão.

---

## 4. Workflows canônicos

Os nomes de tool abaixo são os reais do motor pipeboard (`get_ad_accounts`/`create_campaign`/`create_adset`/`create_ad`/`get_insights`/`update_adset`/`update_ad`/`search_*`); pela Marketing API direta os passos equivalem aos endpoints da Seção 2 (`GET /me/adaccounts`, `POST .../campaigns`, `.../insights`, etc.).

**Auditoria de conta** (antes de criar qualquer coisa):
`get_ad_accounts` (confere a conta habilitada) → `get_insights` no nível conta pra opportunity score / anomalia / benchmarks → checa erros de entrega. Se aparecer hard-stop de entrega ou pixel morto, PARA e reporta antes de criar campanha.

**Criar campanha SALES com pixel:**
`get_ad_accounts` → `search_interests`/`search_geo_locations` (monta o público) → `create_campaign` (ABO, sem budget na campanha) → `create_adset` (`promoted_object` com pixel + `PURCHASE`) → `upload_ad_image` → `create_ad_creative` → `create_ad` → revisar → **STOP, pede OK** → `update_adset`/`update_ad` pra ACTIVE (campanha → ad set → ad, em ordem).

**Campanha não entrega:**
`get_ads`/`get_adsets` (acha os filhos com 0 impressões) → checa erros de entrega → benchmarks de leilão → se for conversão, confere o pixel (disparando? EMQ ok?). Reporta o gargalo; a DECISÃO de fix (trocar público, refrescar criativo) volta pra impulsionar.

---

## 5. Anti-patterns técnicos da API

- Ativar/mudar budget sem confirmação do dono (gasta dinheiro real, sem undo).
- Objetivo legado (só ODAX).
- CBO + budget no ad set ao mesmo tempo (mutuamente exclusivo).
- `OUTCOME_SALES` + site sem pixel no `promoted_object` (não otimiza pra compra).
- Otimizar campanha de venda pra lead/clique barato (enche de curioso).
- Atribuir Opportunity Score a campaign/ad set/ad (é nível de CONTA).
- Lookback grande demais na leitura de dataset; timestamp em formato errado.
- Usar uma conta de anúncios não habilitada (confere no `get_ad_accounts`; usa outra ou habilita no Business Manager).
- Inventar nome de tool fora da lista real do motor (`motor-pipeboard.md`).

---

## 6. Regra de ouro de segurança

O acesso (por qualquer via, pipeboard ou token direto) é de **escrita total, sem rascunho, sem undo, sem tela de confirmação da Meta**. A segurança inteira está no protocolo, não na plataforma:

1. **Toda entidade nasce PAUSED.** Criar não gasta; ativar gasta.
2. **Ativar ou mudar budget é sempre uma call separada, COM o "pode ativar?" respondido pelo dono.** Mostra o plano (verba/dia × dias = total), pede o OK, só então ativa.
3. **Avisa 1x sobre risco** (custo, conta não habilitada, pixel morto) e, se o dono decidir seguir, segue sem insistir.
4. **Nunca inventa métrica.** Número vem da leitura real; sem leitura, marca `[LER: rodar insights]`.
