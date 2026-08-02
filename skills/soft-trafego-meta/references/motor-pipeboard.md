# reference: motor de execução pipeboard (meta-ads-mcp)

> A pipeboard é o motor OPCIONAL que dá braço real pra esta skill operar a conta de anúncios da Meta. Aqui moram as duas trilhas de conexão, a auth de cada, o mapa das tools reais e a licença. É o que a skill usa QUANDO o dono tem a pipeboard; sem ela, a skill entrega o plano pra colar no Gerenciador (nunca para por falta de motor). Fonte da verdade do motor. Dirigida do bloco "MOTOR DE EXECUÇÃO" da SKILL.md.

## Índice
- 1. O que é a pipeboard (e a licença)
- 2. As duas trilhas de conexão (A remote × B self-host)
- 3. Trilha A: remote hospedado (2 min, pro teste)
- 4. Trilha B: self-host BSL (pro produto)
- 5. As tools reais expostas
- 6. Confirmação antes de cada escrita
- 7. Sem pipeboard: o plano manual pro Gerenciador

---

## 1. O que é a pipeboard (e a licença)

A pipeboard hospeda e distribui o **`meta-ads-mcp`**: um servidor MCP open source que expõe a Meta Marketing API como tools MCP. É a ponte entre o Claude e a conta de anúncios da Meta.

**Licença: Business Source License 1.1.** Na prática pro nosso uso:
- **Livre** pra uso individual ou dentro da empresa (nossa skill/produto usando pra operar a conta do dono = ok).
- **Não pode** ser revendida como serviço hospedado que concorre com a própria pipeboard (SaaS que revende o motor como serviço).
- Vira **Apache 2.0 em 2029** (a restrição cai).

Pro Soft (a skill usa o motor pra operar a conta do próprio dono, dentro do produto), a licença permite. Só não montar um "pipeboard concorrente" hospedado.

---

## 2. As duas trilhas de conexão (A remote × B self-host)

As duas rodam o MESMO motor e expõem as MESMAS tools; muda quem hospeda e como autentica.

| | Trilha A, remote hospedado | Trilha B, self-host local |
|---|---|---|
| Onde roda | servidor da pipeboard (`meta-ads.mcp.pipeboard.co`) | máquina da casa (Python local) |
| Auth | token da pipeboard (`pipeboard.co/api-tokens`) ou OAuth | Meta Developer App + token próprio da Meta |
| Setup | ~2 min (conecta e usa) | criar o app na Meta + `pip install` do repo |
| Transporte | remote MCP | streamable HTTP |
| Dono da infra | pipeboard (SaaS terceiro) | a casa (sem terceiro no meio) |
| Ideal pra | você **TESTAR já** | o **PRODUTO** (a gente dono, sem SaaS terceiro por cliente) |

Regra: **pro teste rápido, Trilha A** (2 min, você prova o valor hoje). **Pro produto de escala, Trilha B** (self-host, a casa dona, um cliente não depende de um SaaS terceiro nem de um token compartilhado).

---

## 3. Trilha A: remote hospedado (2 min, pro teste)

O caminho mais curto pra você ver a skill executando de verdade.

- **Endpoint:** o remote MCP hospedado em `https://meta-ads.mcp.pipeboard.co/`.
- **Auth:** token gerado em `pipeboard.co/api-tokens` (ou OAuth da própria pipeboard). O dono cria a conta na pipeboard, autoriza a conta de anúncios da Meta e pega o token.
- **No app (claude.ai):** o dono adiciona o **conector MCP** apontando pro endpoint remote com o token. Aí a skill opera direto pelo app, sem Bash.
- **No Code/agente:** o motor é acessado como servidor MCP (subprocess/conector) com o token no ambiente.

Vantagem: setup mínimo, nada pra instalar. Custo: depende do SaaS terceiro e do token da pipeboard, por isso é a trilha de TESTE, não a de produto por cliente.

---

## 4. Trilha B: self-host BSL (pro produto)

O caminho de produto: a casa roda o motor, sem terceiro no meio, cada cliente com o próprio app da Meta.

- **Instalação:** `pip install` do repo do `meta-ads-mcp` (Python), rodando local.
- **Auth:** precisa **criar um Meta Developer App** (no developers.facebook.com) e gerar um **token próprio da Meta** com as permissões de ads (`ads_management`, `ads_read`, e as de página/instagram pro criativo). Esse token é o do dono/cliente, não um compartilhado.
- **Transporte:** streamable HTTP (o servidor local expõe o MCP por HTTP).
- **No Code/agente:** sobe o servidor local e conecta como MCP; as tools ficam disponíveis igual à Trilha A.

Vantagem: a casa é dona da infra, licença BSL cobre o uso dentro do produto, e cada cliente opera com o app dele (sem gargalo de um SaaS terceiro por cliente). Custo: exige criar o app na Meta e gerir o token, por isso é o caminho de PRODUTO, não o de teste de 2 min.

---

## 5. As tools reais expostas

O motor expõe estas tools (nomes reais, não inventar comando fora desta lista). A skill chama pela via conectada; a semântica é a mesma nas duas trilhas.

**Descoberta / leitura:**
- `get_ad_accounts`: lista as contas de anúncios (acha o `act_<id>`, confere que está habilitada).
- `get_campaigns`: lista as campanhas da conta.
- `get_adsets`: lista os ad sets (de uma campanha ou conta).
- `get_ads`: lista os anúncios.
- `get_insights`: a leitura de métrica por nível (campaign/adset/ad), com campos, filtro, ordenação, breakdowns e janela de tempo. Pra topo E fundo, duas leituras com ordenação invertida.

**Público (monta o targeting do plano com os IDs reais da Meta):**
- `search_interests`: busca interesses (ex. "marketing digital") e devolve os IDs.
- `search_behaviors`: busca comportamentos.
- `search_demographics`: busca segmentos demográficos.
- `search_geo_locations`: busca localizações (país/estado/cidade/raio).

**Criação (tudo nasce PAUSED; ativar é call separada COM OK do dono):**
- `create_campaign`: cria a campanha com o objetivo ODAX. CBO se setar budget aqui; ABO se deixar vazio e setar no ad set.
- `create_adset`: cria o ad set (público, posicionamento, budget se ABO, `promoted_object` com pixel obrigatório pra SALES + site).
- `upload_ad_image`: sobe a arte pro criativo (o card/imagem já hospedado ou o arquivo).
- `create_ad_creative`: monta o objeto de criativo (imagem + copy + CTA + `page_id`).
- `create_ad`: liga o ad set ao criativo (`ad_set_id`, `ad_name`, `creative`).

**Edição / ativação:**
- `update_adset`: modifica o ad set (budget, público, e o `status` pra PAUSED/ACTIVE).
- `update_ad`: modifica o anúncio (o `status` pra PAUSED/ACTIVE inclusive).

Ativar a hierarquia é mudar o `status` pra ACTIVE de cima pra baixo (campanha → ad set → ad), sempre com o "pode ativar?" respondido.

---

## 6. Confirmação antes de cada escrita

O acesso é de **escrita total, sem rascunho, sem undo, sem tela de confirmação da Meta** (igual a qualquer via de execução real). A segurança inteira está no protocolo, não no motor:

1. **Toda entidade nasce PAUSED.** `create_*` não gasta; ativar (`update_*` pra ACTIVE) gasta.
2. **Confirmação explícita ANTES de cada escrita.** Toda `create_*`/`update_*` que muda a conta passa pelo "pode?" do dono. Ativar ou mudar budget mostra o total (verba/dia × dias) e só roda com o OK.
3. **Avisa 1x sobre risco** (custo, conta não habilitada, pixel morto) e, se o dono seguir, segue sem insistir.
4. **Nunca inventa métrica.** Número vem de `get_insights` real; sem leitura, marca `[LER: rodar insights]`.

---

## 7. Sem pipeboard: o plano manual pro Gerenciador

Se o dono não tem a pipeboard (nem token da casa pela Marketing API direta), a skill NÃO para. Entrega o **plano de campanha pronto pra colar no Gerenciador de Anúncios**, mesma qualidade de método:

- A estrutura **campanha → ad set → ad → criativo** com todos os campos: objetivo ODAX, público detalhado (interesses/comportamentos/lookalike, faixa etária, geo), verba/dia, duração, posicionamentos, o criativo (arte + legenda aprovada + CTA/destino), e o pixel/evento se for SALES.
- O **passo a passo de onde clicar** no Gerenciador (Criar → objetivo → nível ad set → público → criativo → revisar → publicar), marcando onde parar pro OK do dono antes de publicar.

Fecha em 1 linha, sem empurrar: *"conectar a pipeboard (Trilha A, setup ~2 min) faz a skill subir esse plano sozinha, sem você abrir o Gerenciador"*. É a escolha do dono pegar ou não.
