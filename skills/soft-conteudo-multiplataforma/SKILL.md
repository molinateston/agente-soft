---
name: soft-conteudo-multiplataforma
description: Adapta uma peça Soft que já existe pra OUTRA plataforma (LinkedIn, X/Threads, Substack, YouTube, newsletter, email, PDF/Notion) sem diluir a tese. Não traduz tom, faz engenharia reversa, extrai os 5 papéis e o núcleo da peça-âncora e re-renderiza no idioma nativo do destino, mantendo o gate da peça original. Use quando o pedido for "repurpose", "adaptar pra LinkedIn", "pra X", "pra Threads", "pra YouTube", "pra newsletter", "pra email", "multiplataforma", "republicar a peça", "transformar esse carrossel em [outro formato]". NÃO use pra escrever a HEADLINE/gancho/capa/abertura do zero (soft-conteudo-headlines), nem pra arte/PNG/visual (soft-designer), nem pro Plano/posicionamento (soft-posicionamento), nem pra carta/página/venda (soft-funil). Pra criar o CORPO original de carrossel/reel/stories no Instagram, são as skills irmãs soft-conteudo-carrossel/-reels/-stories.
---

# Multiplataforma, a mesma peça em idioma nativo

Adaptar não é traduzir tom. É engenharia reversa. Você pega uma peça Soft que já funcionou, extrai os 5 papéis e o núcleo dela, e re-renderiza no formato do destino preservando a função de cada parte. Se a versão adaptada parece igual a qualquer post daquela plataforma, falhou: perdeu o filtro. O que viaja entre plataformas é a TESE e os 5 papéis; o que muda é só o tempo de exposição e a unidade de entrega.

**O que esta skill faz por você:** pega uma peça que já funcionou e a leva pra outra plataforma (LinkedIn, X, YouTube, email, newsletter) sem perder a tese, falando o idioma nativo de cada uma. É como você multiplica uma ideia boa sem reescrever do zero.

**As 6 leis (valem antes de tudo):** (1) nunca escreve como se o cliente já soubesse o contexto, zero palavra difícil, cria o contexto antes da afirmação; (2) abre ensinando o que faz; (3) é consultiva, puxa de você a preferência (duração, formato, tom) antes de gerar; (4) contexto é rei; (5) **admite se faltar insumo, nunca inventa**: confere se tem a peça-âncora/o número/o case antes de adaptar e, se faltar, marca `[DADO: confirmar]` no lugar do furo e diz o que falta, jamais preenche com algo plausível; (6) **doc de output enxuto pros 2 leitores**: o que sai é otimizado pro humano que lê E pra IA que recebe como contexto: só a versão adaptada limpa + `[DADO: confirmar]`, zero meta-narração. (Detalhe em `shared-references/operacao-padrao.md`, Seção 0.)

**Este SKILL.md é o processo inteiro. Siga os passos na ordem, pare nos checkpoints, e rode o gate antes de mostrar a versão adaptada.**

## Output Contract (o que você entrega)
- **Uma versão adaptada por vez**, da peça-âncora pro destino pedido, com o **mapa dos 5 papéis no original** (o que vira o quê) impresso antes da peça.
- A versão sai no **formato e idioma nativos do destino** (subject+pre-header no email, thread numerada no X, primeira-linha-antes-do-ver-mais no LinkedIn, título+capítulos no YouTube).
- O gate roda **por dentro** (auditoria silenciosa); a tabela NÃO vai pra saída. Versão que falha no gate não sai.
- Você **para e espera** o OK antes de adaptar pra um segundo destino ou gerar variação.
- Você **nunca inventa fala nem número do cliente** e **nunca dilui a tese pra caber no formato**.

## Passo 0, ancora antes de adaptar (NÃO PULE)
O fluxo assume que a peça-âncora já passou pelo gate dela. Confirma duas coisas antes de mexer:
- **A headline/abertura já está escolhida?** Se a âncora ainda não tem headline aprovada, manda fazer na **soft-conteudo-headlines** primeiro e para. Você adapta a partir de uma peça pronta, não cria do zero.
- **Onde está o verbatim real?** Procura a fonte de fala do cliente nesta ordem: descrição do projeto → Plano colado → mensagens anteriores. A peça adaptada herda a mesma âncora; nenhuma fala ou número novo aparece sem fonte.

Três estados de entrada (declara qual é o seu antes de adaptar):
- **Peça-âncora colada + verbatim com N:** caminho ideal. Adapta preservando a fala literal e o N real.
- **Peça-âncora colada, mas sem a fala literal por trás:** mantém o que a âncora já tinha; qualquer número que você não confirmou entra como `[DADO: confirmar]` e **NÃO conta como Ancorada=✓**.
- **Nada colado:** pergunta numa única mensagem ("qual peça você quer adaptar, e pra qual plataforma?") e para. Sem peça-âncora não há o que adaptar.

## Passo 1, identifica a peça-âncora e o destino
- **Âncora:** o que foi colado? Carrossel, reel, story, carta, post pronto. Anota o tipo.
- **Destino:** se não disseram, pergunta UMA vez: "Pra qual plataforma? LinkedIn, X/Threads, Substack/email, YouTube, newsletter, PDF/Notion?" e para.
- **Preferência do especialista (Lei 3, consultiva):** puxa como ELE quer a peça no destino antes de gerar. Ex.: YouTube, que duração e formato (corte curto, aula longa)? Email, mais pessoal ou mais direto? Não sai gerando sem extrair a ideia que está na cabeça dele.
- Regra de fundo: o formato não muda a arquitetura. Muda o **tempo de exposição** (3s de capa vira primeira linha do LinkedIn) e a **unidade de entrega** (slide vira parágrafo, vira tweet, vira minuto de vídeo).

## Passo 2, extrai o núcleo Soft da âncora (interno, antes de re-renderizar)
Antes de traduzir, escreve internamente os **6 componentes do núcleo** que viajam inalterados (detalhe + checklist pós-extração em `references/nucleo-soft-extracao.md`):
- **Problema Sofisticado (3ª Camada):** a dor real nomeada como inimigo-categoria, nunca defeito do cliente.
- **Método com nome próprio:** sempre nomeado, mesmo em 280 caracteres.
- **Vilão-categoria:** a prática/sistema/crença atacada, nunca pessoa ou marca.
- **CTA filtrante:** pra onde o lead vai (Direct com palavra, comentário, reply do email); nunca "curte e compartilha".
- **≥3 dos 5 movimentos Blair Warren:** incentiva sonho · justifica falha · aplaca medo · confirma desconfiança · atira pedra no inimigo. Princípio de fundo, nunca lista citada na peça.
- **Campo semântico do cliente:** vocabulário do nicho, nunca "lead/funil/conversão"; monta a tabela de tradução antes de adaptar.

A **prova específica** real da âncora (número/cena) viaja junto. Se algum dos 6 sumiu na âncora, pergunta antes de adaptar. Adaptar com núcleo incompleto produz peça fraca.

## Passo 3, mapeia os 5 papéis da Estrutura-Mãe no original
Identifica qual trecho da âncora faz cada papel. Isso é o mapa que você imprime no Passo 5.

1. **Capa** (o que parou o leitor)
2. **Capa Reserva** (o que aprofundou o loop)
3. **Contexto** (como o leitor foi aterrado)
4. **Conteúdo** (a virada + o método via contraste)
5. **CTA** (a ação filtrante)

Anti-padrão: traduzir cada slide em 1 parágrafo/tweet sem repensar os papéis. O carrossel tem N slides, mas os 5 papéis não são N unidades: alguns papéis ocupam vários slides (Conteúdo), outros colapsam (Capa + Capa Reserva num formato curto). Adaptação fiel preserva os **papéis**, não o número de unidades.

## Passo 4, re-renderiza no idioma nativo do destino
Usa a tabela como ponto de partida. Cada papel migra preservando a função, no formato do destino.

| Destino | Capa | Capa Reserva | Contexto | Conteúdo | CTA |
|---|---|---|---|---|---|
| **LinkedIn** | 1ª linha (antes do "ver mais") | parágrafo 2 | parágrafo 3 | corpo 3-5 parágrafos | última linha + P.S. |
| **X / Threads** | 1º tweet | 2º tweet | 3º tweet | tweets 4-8 | último tweet |
| **Substack / newsletter / email** | subject (≤50 char) + pre-header | 1ª linha | parágrafo 1 | parágrafos 2-4 | P.S. ou botão |
| **YouTube longo** | título + thumb | primeiros 15s | 1º minuto | corpo 3-8min | chamada de inscrição |
| **PDF / Notion** | capa do doc + título | intro de 1 parágrafo | cena/dado concreto | seções principais | CTA de fechamento |
| **TikTok / Shorts** | 0-3s | 3-6s | 6-12s | 12-40s | 40-50s |
| **Mini Webinar** | abertura 0-30s | 30s-1min | 1-2min | corpo 2-8min | fechamento com convite |

**Abre a reference da plataforma e segue as regras nativas dela** (formato, limites, exemplos, SEO/UTM). Não adapta de cabeça: a reference tem as regras que mudam a peça:
- LinkedIn → `references/plataforma-linkedin.md` · X/Threads → `references/plataforma-x-threads.md` · Substack/Email → `references/plataforma-substack-email.md`
- TikTok/Shorts → `references/plataforma-tiktok-shorts.md` · YouTube longo → `references/plataforma-youtube-longo.md` (traz o **pacote completo de publicação**: título, descrição, tags, capítulos, thumbnail, SEO, UTM)
- PDF/Notion → `references/plataforma-pdf-notion.md` · Mini Webinar → `references/plataforma-mini-webinar.md` (distribuição/hospedagem; a construção do roteiro é da `soft-funil`)

**Idioma nativo, não copia-cola do Instagram.** LinkedIn e email são armadilha pra jargão de marketing: zero "lead/funil/ticket/conversão", sempre o campo semântico do cliente final. No formato curto (tweet único, email brevíssimo), papéis podem colapsar de propósito (Manifesto = Capa+CTA · Sentença = só Capa · Único = 1 unidade faz tudo). Colapso consciente não é traição da estrutura; perder um papel sem querer, sim.

**Se o destino for YouTube longo**, entrega também o pacote de publicação: título, descrição, capítulos, tags, sugestão de thumbnail.

## Passo 5, roda o GATE por dentro (auditoria silenciosa, NÃO imprime)
Roda o gate na versão adaptada **internamente** (auditoria silenciosa). Só versão com VEREDITO=PASSA vai pro cliente. Um ✗ refaz. A tabela abaixo é o teu **checklist interno**, nunca a saída: o usuário recebe só a versão limpa (Passo 6), jamais a tabela. A âncora já passou no gate dela; a adaptação passa de novo no idioma novo.

| Check | Passa se | ✓/✗ |
|---|---|---|
| **Ancorada** | herda fala literal/N **real** da âncora OU prova real do autor; **N inventado/plausível = ✗ automático**; fecha em chão/número/cena, não em tese solta bonita | |
| **Tese preservada** | a percepção central da âncora chegou inteira; **não foi diluída pra caber no formato** (encurtar ≠ esvaziar) | |
| **Nativo do destino** | formato e vocabulário são da plataforma alvo (subject/thread/1ª-linha/capítulos certos), **não um copia-cola do post do Instagram** | |
| **5 papéis re-renderizados** | os 5 papéis aparecem (ou colapsam de propósito, declarado); **nenhum papel sumiu por acidente** | |
| **CTA com destino** | filtrante e direcional no idioma do destino (Direct/comentário/reply/botão), **nunca "curte e compartilha"** | |
| **Confuso? (C)** | leigo do nicho entende na 1ª passada, sem reler | |
| **Inacreditável? (U)** | promessa/número soa crível, não exagero de guru | |
| **Chato? (B)** | tem cena/tensão/opinião; não é parágrafo morno informativo | |
| **Harry, dá pra ver?** | fecha o olho e enxerga a cena. ✗ "tenha mais clareza" · ✓ "a recepcionista diz: semana que vem enche" | |
| **Harry, dá pra falsificar?** | é fato falsificável, não adjetivo | |
| **Harry, só você diz?** | o concorrente direto não assina igual (cena/mecanismo proprietário, não promessa banal do nicho) | |
| **Anti-IA (HARD)** | zero travessão "—" · zero "travar/travado/destravar" (exceção: aspa literal do cliente) · sem frase-emoldura ("a verdade é", "o segredo") · sem verbo-clichê ("revoluciona, destrava, transforma"). **No chat (sem o lint), faz um CTRL+F manual de "—" e da família "travar" antes de marcar ✓.** | |
| **VEREDITO** | **= o PIOR item acima.** Um ✗ qualquer = REFAZ. Só tudo-✓ = PASSA e vai pro cliente. | |

## Passo 6, mostra e PARA
Mostra **só a versão que passou, LIMPO** (como no Claude Chat): a peça adaptada no formato e idioma nativos do destino. Sem tabela de gate, sem meta. Pergunta "essa serve? ajusto, ou adapto pra outra plataforma?". **Espera o OK** antes de adaptar pro próximo destino ou gerar variação. Uma plataforma por vez, nunca despeja todas de uma vez.

## When NOT to use (manda pra skill certa)
- Pediu a **HEADLINE/gancho/capa/abertura** do zero → **soft-conteudo-headlines**.
- Pediu **arte/visual/PNG** da versão adaptada → **soft-designer**.
- Pediu o **Plano / posicionamento / fundação** → **soft-posicionamento**.
- Pediu o **CORPO original** de carrossel/reel/stories no Instagram → **soft-conteudo-carrossel / -reels / -stories**.
- Pediu **carta / página de vendas / VSL / micro-aula** → **soft-funil**.

## Anti-Patterns (sintoma → correção)
| Sintoma | Correção |
|---|---|
| Traduziu cada slide em 1 parágrafo/tweet sem repensar os papéis | Mapeia os 5 papéis primeiro; re-renderiza por função, não por unidade |
| Encurtou pra caber e a tese virou frase morna | Tese preservada = ✗; reescreve mantendo a percepção central inteira |
| Versão de LinkedIn/email com cara de post do Instagram | Idioma nativo do destino (subject, 1ª linha, thread); zero copia-cola |
| Vazou "lead/funil/conversão" no LinkedIn ou no email | Volta pro campo semântico do cliente final |
| CTA virou "curte e compartilha" | CTA filtrante com destino (Direct/comentário/reply/botão) |
| Sumiu um papel sem querer (Contexto evaporou) | 5 papéis re-renderizados = ✗; recoloca o papel ou declara o colapso |
| Inventou um número/fala "plausível" na adaptação | Só herda número/fala REAL da âncora; sem fonte, `[DADO: confirmar]` e não conta como Ancorada=✓ |
| Despejou LinkedIn + X + email de uma vez | Uma plataforma por vez, com gate, e PARA pro OK |
| Narrou o fluxo ("agora vou extrair o núcleo") | Não narra: executa em silêncio e entrega só o mapa + a versão limpa, sem a tabela do gate |
| Gerou a adaptação sem perguntar a preferência do especialista | Consultiva (Lei 3): extrai duração, formato e tom desejado antes de re-renderizar |
| Imprimiu a tabela do gate na saída | O gate é INTERNO (auditoria silenciosa); a saída é só a peça limpa |

## References (só pra profundidade, o fluxo acima é autossuficiente)
- `references/processo-multiplataforma.md`: a engenharia reversa completa, a tabela de mapeamento com TikTok/Shorts e Mini Webinar, e os colapsos conscientes detalhados. É o mesmo processo, com mais formato e exemplo.
- `references/nucleo-soft-extracao.md`: o protocolo de extração do núcleo do Passo 2, com os 6 componentes e o checklist pós-extração.
- `references/conducao-na-pratica.md`: o porquê por trás (conteúdo reorganiza percepção, não dá passo a passo; estoura a bolha; polariza; aponta sempre pro método). Lê quando a adaptação está tecnicamente certa mas sem alma.
- `references/estrutura-peca.md`: a Estrutura-Mãe dos 5 papéis (Capa · Capa Reserva · Contexto · Conteúdo · CTA) com as formas de cada um. É a base da engenharia reversa do Passo 3.
- **Uma reference por plataforma (dirigidas no Passo 4):** `references/plataforma-linkedin.md` · `plataforma-x-threads.md` · `plataforma-substack-email.md` · `plataforma-tiktok-shorts.md` · `plataforma-youtube-longo.md` (com o pacote de publicação) · `plataforma-pdf-notion.md` · `plataforma-mini-webinar.md`. Cada uma traz regras de formato, exemplos e checklist nativos do destino.
