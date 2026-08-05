---
name: soft-funil-isca
description: "Constrói a ISCA do método Soft: o material gratuito que captura o lead certo, entrega valor real e aponta pro método (a isca é fração, o sistema é o produto). Cria QUALQUER formato (guia, checklist, diagnóstico, mini-aula, template, script, swipe, quiz, calculadora, planilha, mini-curso, desafio, audit, Artigo-Isca) e tem MODO IDEAÇÃO que ajuda a PENSAR e ESCOLHER a isca perfeita pro avatar antes de produzir. Ancora no verbatim real, conduz por etapas com STOP, passa por gate-checklist embutido. Use quando o pedido for \"isca\", \"lead magnet\", \"material gratuito\", \"PDF/ebook de captura\", \"o que oferecer de graça\", \"que isca eu faço\", \"quiz\", \"checklist\", \"template\", \"artigo isca\". NÃO use pra conteúdo de feed/carrossel/reel/stories (→ soft-conteudo). NÃO use pra carta/VSL/página de vendas (→ soft-funil-carta). NÃO use pra mini webinar (→ soft-funil-miniwebinar) nem webinário (→ soft-webinar). NÃO use pra venda/script/objeção (→ soft-vendas), posicionamento (→ soft-posicionamento) nem arte (→ soft-designer)."
---

# Isca, a amostra que prova a tese e captura o lead certo

A isca não é "conteúdo de graça". É a PUV em formato gratuito: um material que entrega um pedaço de verdade real E faz o leitor reposicionar o que ele acha que precisa. A isca certa FILTRA. Quem não é cliente desiste no meio. Quem é, se reconhece linha a linha e pede a continuação. Isca genérica atrai curioso. Isca-tese atrai cliente.

A isca pode sair em QUALQUER formato (artigo, passo-a-passo, conteúdo, script, template, swipe, ferramenta, calculadora, quiz, diagnóstico, planilha, mini-curso, desafio, audit, e por aí vai). O formato muda, a lei não: toda isca é a PUV em formato gratuito, entrega o quê e o porquê, e guarda o como. Ela entrega o quê e o porquê; o como é o produto. Quem dá o como de graça não tem o que vender.

**O que esta skill faz por você:** ajuda a PENSAR a isca perfeita pro avatar (Modo Ideação, Passo 1) E produz no formato certo, qualquer que seja, a partir do verbatim real, trocando um problema resolvido pelo contato do cliente certo.

**As 6 leis (valem antes de tudo):** (1) nunca escreve como se o cliente já soubesse o contexto, zero palavra difícil, cria o contexto antes da afirmação; (2) abre ensinando o que faz; (3) é consultiva, puxa o contexto de você antes de gerar; (4) contexto é rei; (5) **Admite se faltar insumo, nunca inventa**, confere número, case e fala na fonte; se falta, admite e pergunta ou marca `[A CONFIRMAR]`, jamais preenche com o que soa plausível; (6) **Doc de output enxuto pros 2 leitores**, o `.md` entregue é o mais otimizado pro humano E pra IA: zero meta-narração, zero bastidor, só insumo denso mais `[A CONFIRMAR]` onde falta. (Detalhe em `shared-references/operacao-padrao.md`, Seção 0.)

**Este SKILL.md é o processo inteiro. Siga os passos na ordem, pare nos checkpoints, e rode o gate antes de mostrar qualquer peça.**

## Output Contract (o que você entrega)
- **Uma isca por vez**, no formato escolhido (qualquer um do catálogo de famílias, ver Passo 2), com a promessa única e o destino marcado.
- **Quando o usuário não sabe qual isca criar**, a skill ENTRA pelo Modo Ideação (Passo 1) e só produz depois que a isca-alvo foi escolhida: uma só, com promessa única, formato único e destino marcado.
- A saída é **limpa, como no Claude Chat**: a peça com a promessa única, o destino marcado e a fonte do verbatim citada. O gate roda **por dentro** (auditoria silenciosa); a tabela NÃO vai pra saída.
- Você **produz, mostra e PARA**. Espera o OK antes de avançar de etapa ou gerar a próxima parte. Não despeja o material inteiro de uma vez.
- Você **nunca inventa fala nem número do cliente** e **nunca mostra peça que falhou no gate**.

## Passo 0, ancora antes de escrever (NÃO PULE)
Abre a fonte de fala real do cliente da vez, nesta ordem: **descrição do projeto** → **Plano colado na conversa** → **mensagens anteriores** (detalhe em `references/entrada-verbatim.md`). Puxa **3-5 falas de DOR + 3-5 de DESEJO** do tema, literais, contando o N (quantas vezes apareceu). A primeira linha da isca nasce de uma delas, quase intacta. Citações entre aspas são substring literal da fonte. Prova ou número que não vier do briefing entra como `[DADO: confirmar]` e não conta como ancorado.

Sem nenhuma fala real: NÃO inventa. Ancora em prova real do autor (resultado, case, mecanismo) e avisa que minerar 5-8 falas reais (ou rodar o Plano na soft-posicionamento) deixa a isca muito mais cravada. **PARA e confirma a fonte antes de seguir.**

A fundação (quando existe, do Plano): tese central · mecanismo nomeado · inimigo nominal · cliente em uma frase. A isca é uma amostra desse mecanismo, nunca um tema solto.

As mesmas 3-5 falas de DOR + 3-5 de DESEJO alimentam o Modo Ideação do Passo 1 (a isca certa resolve a dor TOP-3, não a #7) e a produção do Passo 3.

## Passo 1, MODO IDEAÇÃO (só roda se o usuário NÃO trouxe a isca já decidida)
**Gatilho:** roda quando o usuário pediu ajuda pra escolher ("que isca eu faço?", "não sei o que oferecer de graça", "o que oferecer"), OU não trouxe a isca pronta, OU o Passo 0 revelou mais de uma dor TOP-3 candidata. Se o usuário já chegou com a isca decidida, PULA pro Passo 2. A engenharia completa está em `references/ideacao-isca.md` (leia ao entrar neste passo): os 4 critérios-núcleo, as 3 perguntas profit-driven, os prompts de brainstorm e a lógica de next-dollar.

Conduz por pergunta, em poucas mensagens, na ordem profit-driven (destino primeiro, isca por último):
1. **O que você vende / vai vender?** Define o destino ANTES da isca. Sem oferta não há next-dollar; marca `[A CONFIRMAR]` e a ideação não fecha enquanto isso falta.
2. **O que o avatar precisa ACREDITAR pra querer isso?** A crença-ponte que a isca vai instalar (do estado atual pro estado que faz o produto virar o passo óbvio).
3. **Brainstorm do tópico** a partir das falas do Passo 0 + dos prompts de ideação (a pergunta #1 que ele recebe, o que deixaria o avatar de queixo caído, qual o quick-win possível em menos de 20 minutos).

Gera **5-8 ideias-de-isca candidatas**. Cada uma traz: a dor TOP-3 que ataca · o quick-win em <5-20min · o formato sugerido · o próximo-dólar pra onde leva. Pontua cada uma pelo crivo de seleção (Específico>Amplo · ataca a TOP-3 · traz informação Nova · prova a SUA autoridade · não satura o produto) e **RECOMENDA 1-2 com convicção** (postura consultor, não menu neutro).

**Peso pró-interativo na ordem de recomendação (benchmark 2026):** formato interativo (quiz, template, calculadora) converte 5,2% ou mais de visitante em lead; ebook gateado fica abaixo de 0,9%, uma distância de ~6x. Na recomendação, o interativo é o default sugerido; ebook só quando o avatar pede profundidade de leitura.

**STOP:** mostra as candidatas + a recomendação e PARA pro usuário escolher.

## Passo 2, escolhe o formato pelo catálogo (uma isca, uma promessa, um destino)
Com a isca-alvo escolhida, decide o FORMATO pela matriz de seleção. O universo de formatos por função e a matriz por estágio de consciência estão em `references/catalogo-iscas.md` (consulte aqui). As 5 famílias por função psicológica:
- **A, Execução/Ferramenta** (checklist, cheat sheet, template, script, swipe, planner, worksheet, planilha, toolkit): faz AGIR e vencer agora, melhor conversão lá na frente.
- **B, Interativo/Diagnóstico** (quiz, assessment, calculadora, gerador): maior conversor absoluto E segmenta o lead no mesmo movimento (a segmentação É qualificação).
- **C, Educação/Autoridade** (mini-curso ou email-course, vídeo-treino, tutorial passo-a-passo, guia/ebook SÓ quando não cabe quick-win, workshop de 1h, Artigo-Isca).
- **D, Prova/Fundo de funil** (case study, audit ou análise grátis, trial/amostra, sessão/consultoria, desafio, livro+frete).
- **E, Curadoria** (resource list, vault, template de Notion, mind map, relatório de indústria).

Heurística rápida: converter+segmentar no topo → quiz/assessment; agir já → checklist/template/script; high-ticket ou serviço → audit/sessão/case; pré-venda de produto → mini-curso/desafio/workshop; B2B/decisor → relatório/calculadora/template. Casa o formato com o ESTÁGIO DE CONSCIÊNCIA do avatar (a matriz inconsciente→mais-consciente está na ref). Regra dura: **uma isca, uma promessa específica, um destino.** Não acumula iscas; a promessa nomeia o pedaço que ela resolve, não "tudo sobre X". Quando o formato é Artigo-Isca, segue os 13 movimentos de `references/artigo-isca.md`. Antes de produzir, puxa o porquê da condução em `references/conducao-na-pratica.md` (o funil é o fácil e a posição é o difícil; congruência repete a tese; minimalismo), usa os §1-4; o §5 (lançamento pago) fica fora de escopo da isca. **Mostra o formato + a promessa e PARA pro OK.**

## Passo 3, produz a isca ancorada (com seeding do método)
Produz a isca no formato escolhido a partir do verbatim do Passo 0. Estilo Soft: uma ideia por frase, número no lugar de adjetivo, vocabulário do cliente final (nunca "lead/funil/ticket"). Dois eixos não-negociáveis:
- **Entrega valor real.** Resolve de verdade um pedaço do problema. O leitor sai com uma coisa que dá pra usar hoje, não com um anúncio disfarçado.
- **Aponta pro método (seeding).** Deixa claro, sem pressão, que isso é uma fração: o quê e o porquê estão aqui, o como (o sistema completo) é o produto. O curiosity gap mora no como, nunca no resultado.

Nota de formato. Pra formatos interativos (quiz/assessment/calculadora) o output é a ARQUITETURA da peça (as perguntas, os ramos de resultado, a lógica de segmentação e a copy de cada resultado), não um PDF, e cada resultado já roteia pro destino certo (a segmentação É qualificação). Pra script/template/swipe, o output é o preenchível pronto com os `[campos]` marcados. Faca aparada: a peça qualifica, não executa o método inteiro.

A isca FILTRA: quem não é o avatar certo larga no meio, e tudo bem. Atrai todo mundo significa genérica demais. **Não narra o fluxo** ("agora vou auditar"). Entrega limpo. Se a peça é longa (Artigo-Isca), produz em blocos e PARA entre blocos.

## Passo 4, desenha a captura (fricção mínima) e o destino
- **Captura.** Troca a isca por e-mail ou WhatsApp. Promessa específica, uma só. Sem formulário longo, sem campo que não serve a nada. Cada campo a mais derruba conversão sem pagar por si. Formato interativo (quiz/calculadora) captura o contato no resultado (gate de e-mail antes de revelar o resultado personalizado): fricção baixa porque a pessoa JÁ quer o resultado. Se a isca tem página própria (ex.: Artigo-Isca ou um vídeo-isca), os 6 elementos da página de hospedagem estão em `references/pagina-hospedagem.md`.
- **Destino.** Pegou o contato, tem pra onde levar: a Carta (`soft-funil-carta`), o mini webinar (`soft-funil-miniwebinar`) ou a conversa (`soft-vendas`). Captura sem destino é lead morto. Next-dollar manda: o destino é o problema que a isca ABRE, não o que ela fecha; quem amou a isca quer naturalmente o próximo degrau (a Carta/conversa).
- **Nutrição.** Ponte curta (não newsletter eterna) da isca pro destino. **Mostra a estrutura de captura + destino e PARA pro OK.**

## Passo 4b, a ponte do feed pra isca (Filtro Soft)
Quando o cliente perguntar como o feed entrega a isca, esta é a ponte. É ferramenta operacional, não pilar do método, não complica com sequência longa.

- **A ponte (Filtro Soft).** A pessoa comenta a palavra-chave no post, o ManyChat (ou o GHL/GoHighLevel) envia automaticamente a isca ou o link dela, e o bot faz um follow-up simples 24-48h depois ("Conseguiu ver? Alguma dúvida?") apontando pro destino marcado no Passo 3.
- **Config mínima.** 1 palavra-chave → 1 disparo (a mensagem com o link) → 1 follow-up. Só isso. Sequência complexa só infla.
- **Filtro Soft × Isca Soft.** O Filtro Soft é a ponte genérica do feed pro ativo. A Isca Soft é o entregável complementar acionado por comentário, com 2 modos: (a) **isca-tutorial**, conteúdo de alto valor (PDF, checklist, mini-guia, vídeo curto) que resolve uma dúvida específica e atrai seguidor qualificado; (b) **atalho-pro-funil**, em vez de só entregar o material, leva direto pra Carta, o Vídeo ou a conversa. O comentário vira ponto de entrada no funil.

## Passo 5, roda o GATE por dentro (auditoria silenciosa, NÃO imprime)
Roda o gate em CADA peça (isca, página de captura, sequência de nutrição) **internamente** (auditoria silenciosa). Só peça com a linha VEREDITO=PASSA vai pro cliente. Uma falha refaz a peça e re-roda o gate do zero. A tabela abaixo é o teu **checklist interno**, nunca a saída: o usuário recebe só a peça limpa (Passo 6), jamais a tabela.

| Check | Passa se | ✓/✗ |
|---|---|---|
| **Ancorada na dor real** | nasce de fala literal da fonte (cita N **real**) OU de prova real do autor; **N inventado/plausível = ✗ automático**; a aspa é substring literal e afirma a MESMA dor do avatar | |
| **Entrega valor real** | resolve um pedaço de verdade, dá pra usar hoje. ✗ "anúncio disfarçado de guia" · ✓ "o leitor sai sabendo fazer UMA coisa concreta" | |
| **Aponta pro método (seeding)** | deixa claro que isso é fração; o COMO completo é o produto. ✗ entrega o como inteiro (não sobra produto) · ✗ não conecta com o método (vira só dica) | |
| **Top-3 do avatar** | ataca a prioridade #1 a #3 do avatar, não a #7. ✗ isca brilhante sobre um problema que ninguém prioriza · ✓ resolve a dor que ele já citou primeiro | |
| **Valor óbvio no título** | o benefício fica claro só pelo NOME, sem ler o conteúdo (teste Brodie). ✗ "Guia definitivo sobre vendas" · ✓ "Os 3 e-mails que reativam cliente parado há 6 meses" | |
| **Next-dollar / não-satura** | resolve um sub-problema que LEVA ao produto e NÃO mata o problema central (se já satisfaz tudo, satura o lead = ✗); existe um degrau intermediário entre a isca grátis e o high-ticket (sem value-cliff) | |
| **Filtra o avatar certo** | repele quem não é cliente; o avatar errado larga no meio. ✗ "7 dicas que qualquer concorrente daria" · ✓ tese-isca que só o cliente certo termina | |
| **Captura com fricção mínima** | uma promessa, e-mail OU WhatsApp, zero campo supérfluo, destino real marcado | |
| **C/U/B** | não é Confuso (entende em 1 leitura), não é Inacreditável (promessa do tamanho da prova), não é Boring (tem tensão/dor real, não morno) | |
| **CTA com destino** | a ação é clara e leva a um destino que existe (Carta/mini webinar/conversa), não "saiba mais" no vácuo | |
| **Harry, dá pra ver?** | fecha o olho e enxerga a cena/o resultado concreto, não "tenha mais clareza" | |
| **Harry, dá pra falsificar?** | a promessa é um fato falsificável, não um adjetivo bonito | |
| **Harry, só você diz?** | o concorrente direto não assina igual (mecanismo/cena proprietária, não promessa banal do nicho) | |
| **Anti-IA (HARD)** | zero travessão "—" · zero "travar/travado/destravar" (exceção: aspa literal do cliente) · sem frase-emoldura ("a verdade é", "o segredo") · sem verbo-clichê ("revoluciona, destrava, transforma"). **No chat (sem o lint), faz um CTRL+F manual de "—" e da família "travar" antes de marcar ✓.** | |
| **VEREDITO** | **= o PIOR item acima.** Um ✗ qualquer = REFAZ. Só tudo-✓ = PASSA e vai pro cliente. | |

## Passo 6, mostra e PARA
Mostra **só o que passou, LIMPO** (como no Claude Chat): a peça e a fonte do verbatim citada. Sem tabela de gate, sem meta. Pergunta "essa isca te serve? ajusto o formato, troco a isca, ou sigo pro destino?". **Espera a escolha** antes de avançar pra Carta/mini webinar/conversa. A isca capturou o lead → entra no destino marcado no Passo 4.

## When NOT to use (manda pra skill certa)
- Pediu **carrossel, reel, stories, headline ou texto de feed** → **soft-conteudo**.
- Pediu **peça de FEED** (carrossel/reel/stories/post solto pra alcance, sem captura de contato) → **soft-conteudo**. A isca é material de CAPTURA (troca por contato) com destino marcado; se não captura contato nem leva a destino, não é isca.
- Pediu **carta de vendas / VSL / página de vendas** → **soft-funil-carta**.
- Pediu **webinário/mini-webinar como ISCA de topo** → **soft-webinar** / **soft-funil-miniwebinar**. Esta skill desenha a isca que LEVA a eles, não o evento em si.
- Pediu **mini webinar** → **soft-funil-miniwebinar**.
- Pediu **webinário perpétuo / ao vivo** → **soft-webinar**.
- Pediu **a venda em si** (script, objeção, fechamento, prospecção) → **soft-vendas**.
- Pediu **Plano / posicionamento / nomear mecanismo** → **soft-posicionamento**.
- Pediu **arte / visual / PNG** → **soft-designer**.

## Anti-Patterns (sintoma → correção)
| Sintoma | Correção |
|---|---|
| Despejou a isca inteira de uma vez | Volta: produz → mostra → PARA pro OK a cada etapa |
| Isca genérica ("7 dicas de...") | Reescreve como tese-isca: amostra do mecanismo que filtra, não dica que qualquer um daria |
| Entregou o COMO de graça | Guarda o como (é o produto). Dá o quê e o porquê, abre curiosity gap no como |
| Ebook de 80 páginas que ninguém consome | Encolhe pro mínimo consumível; valor real é o que dá pra usar, não o volume |
| Captura com formulário longo | Corta pro essencial: uma promessa, um campo de contato, um destino |
| Pegou o contato e não tem destino | Marca o destino real (Carta/mini webinar/conversa) antes de publicar a captura |
| Inventou número/fala "plausível" | Só número/fala REAL; sem fonte, marca `[DADO: confirmar]` e não conta como Ancorada=✓ |
| Atrai todo mundo (não filtra) | Aperta a tese-isca até o avatar errado largar no meio |
| Narrou o fluxo ("agora vou auditar") | Não narra: executa em silêncio e entrega só o resultado + a tabela |
| Imprimiu a tabela do gate na saída | O gate é INTERNO (auditoria silenciosa); a saída é só a peça limpa |
| Inflou o formato em vez de mudar o tópico | Se o tópico não cabe num quick-win de menos de 20min, troca o TÓPICO, não engorda o ebook |
| Isca que mata o problema central (satura o lead, não sobra produto) | Reduz pra um sub-problema que ABRE a porta do next-dollar |
| Value-cliff: pulou da isca grátis direto pro high-ticket | Garante o degrau intermediário (Carta/conversa) antes |
| Escolheu formato pelo que é fácil de produzir | Decide pela matriz consciência×função (Passo 2), não pela preguiça |
| Começou pela isca, não pela oferta | Ordem profit-driven: destino primeiro, crença-ponte depois, isca por último |

## References (só pra profundidade, o fluxo acima é autossuficiente)
- `references/ideacao-isca.md`: o método de IDEAÇÃO (4 critérios-núcleo, 3 perguntas profit-driven, prompts de brainstorm, next-dollar logic). **Leia quando o usuário não sabe qual isca criar** (Modo Ideação, Passo 1).
- `references/catalogo-iscas.md`: o universo de formatos por função + a matriz por estágio de consciência + a heurística de decisão. **Leia ao escolher o formato** (Passo 2).
- `references/processo-isca.md`: a mecânica dos 4 passos (Isca · Captura · Nutrição · Filtro) e os princípios da frente de funil. Os 4 passos convivem com o catálogo ampliado: a mecânica Isca·Captura·Nutrição·Filtro é a mesma, o universo de formatos é maior.
- `references/artigo-isca.md`: a engenharia completa do Artigo-Isca (os 13 movimentos + 5 princípios). Use quando o formato escolhido for a carta-tese longa.
- `references/conducao-na-pratica.md`: o jeito de conduzir o funil (congruência, minimalismo, o funil é o fácil e o posicionamento é o difícil). O porquê por trás das decisões.
- `references/pagina-hospedagem.md`: os 6 elementos da página de hospedagem da isca. Use só quando a isca tem página própria (Artigo-Isca ou vídeo-isca).
- `references/entrada-verbatim.md`: o protocolo de ancoragem do Passo 0 (como abrir a fonte de fala real e puxar dor/desejo com N).
- `scripts/lint_copy.py`: no Claude Code, roda `python3 scripts/lint_copy.py` na peça como cinto extra do anti-IA (reprova em-dash e "travar"). No chat não roda, por isso o CTRL+F manual do gate.
