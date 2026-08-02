
# Design de Carrossel (reference da soft-designer)

Designer dos carrosséis do método Soft Business. **Escreve a copy-visual de cada card pelo Crivo embutido E desenha os slides**, entregando PNGs 1080×1350 que param o scroll e quebram padrão visual no feed.

**Lugar no método:** o Carrossel inteiro sai daqui, a copy-visual de cada card e o visual. A TESE e a copy-de-apoio chegam do usuário ou da skill de conteúdo; a copy-VISUAL (a frase de cada card) é escrita aqui, passa pelo Crivo, e aí vira imagem. Dois trabalhos num: escrever a copy-visual gated e desenhar.

**O que esta reference é (e o que não é):** o método do Carrossel (estrutura, Fórmula 7, quantidade de cards, função de cada slide) vive no **Cap 6 do guia**, esta reference não o duplica, aponta pra ele. O que vive aqui é a **engenharia visual**, as 3 famílias de estilo, tipografia, escala, render HTML/CSS e export PNG. Isso não está no guia, é o valor próprio desta reference.

---

## Índice
- A fonte do método é o guia, leia primeiro
- O que entrega
- 1. Princípio fundador
- 2. As 3 famílias visuais
- 3. Fluxo de execução (a ordem certa)
- 4. Filtro Mobile-First, obrigatório antes de aprovar
- 5. Quando o usuário é leigo
- 6. Erros que esta reference nunca comete
- 7. Princípio final
- 8. O branch de imagem-IA (HTML→PNG vs ilustração por IA); a capa/thumbnail de vídeo (modo desta soft-designer) mora aqui
- Handoff

---

## A fonte do método é o guia, leia primeiro

A estrutura do Carrossel não mora aqui. Na primeira invocação da sessão, leia:

- A **Fórmula 7** (os 7 movimentos: Hook · Quebra de Crença · Diagnóstico · Vilão · Nova Oportunidade · Mecanismo · Convite) e a regra de **7 a 10 slides** vêm da tese que chega da skill de conteúdo, ou de `soft-conteudo-carrossel` (Cap 6 do guia). **É a fonte da estrutura**, pra estruturar e reconhecer a função de cada card.

A copy-visual obedece a **lei de escrita do Crivo** (`shared-references/crivo/05-premissas-mestras.md`): a estrutura-mãe afiada (**Diagnóstico, Nomeação, Polaridade, Nova visão, Consequência, Movimento**, que espelha a Fórmula 7) e a lente da **percepção**, cada slide carrega **uma ideia**, fechando numa frase-conclusão. Depois que a copy passou no gate, o layout **amplifica** a frase (espaço negativo brutal, accent cirúrgico nas 2 a 4 palavras de mais peso), sem mudar palavra.

Você **escreve a copy-visual** (a frase de cada card, no Passo 0 abaixo), mas **não reinventa a tese nem a estrutura narrativa**: a Fórmula 7 e o ângulo-mãe vêm da skill de conteúdo ou do perfil do usuário. Reconhece a função de cada slide (hook, problema, virada, método, prova, oferta, CTA) e desenha o layout certo pra cada uma. Movimento não é slide: um movimento pode ocupar dois cards, respeite a contagem da espinha.

Se a copy chegar com menos de 7 ou mais de 10 slides, **desenhe o que veio** (a contagem é decisão de quem escreveu), mas avise em uma linha que o Cap 6 recomenda 7 a 10, caso o usuário queira ajustar antes.

---

## O que entrega

Os **slides do Carrossel em PNG 1080×1350** (artifact final), na ordem, prontos pra postar ou impulsionar. O caminho até eles: detectar a função de cada slide → escolher família visual + cor + tipografia → renderizar HTML/CSS → auditar → preview pra aprovação → exportar PNG.

---

## 1. Princípio fundador

Carrossel bom não é carrossel "bonito". É carrossel que **quebra padrão visual** no feed.

O feed do Instagram é dominado por: gradientes coloridos · templates Canva genéricos · ícones Material Design coloridos · sans-serif média centralizada · frames com bordas arredondadas. Você faz o oposto. Sempre.

**As 7 regras inegociáveis:**

1. **Fundo chapado.** Preto (#0A0908 ou #0A0A0A) ou branco (#FFFFFF / #F5F2EC). Nunca gradiente. Nunca textura forte.
2. **Hierarquia de 2 níveis no máximo.** Título grande + corpo. Subtítulo é exceção rara.
3. **Espaço negativo brutal.** 30–50% do slide vazio. Conteúdo num bloco centrado com `max-width` controlado. Nunca centralizado simétrico burro, nunca apinhado.
4. **Cor de destaque cirúrgica.** UMA cor por carrossel. Aparece em 2–4 palavras-chave por slide. Nunca em parágrafos inteiros.
5. **Negrito é arma.** Aparece em 2–4 palavras por slide. Nunca em frases inteiras. Negrito é 700 ou 800, nunca 600.
6. **Tipografia mista é assinatura.** Serif elegante pra títulos editoriais OU sans pesada pra títulos de comando. Nunca mistura serif e sans no mesmo título.
7. **Sem chrome do Instagram.** Sem progress bar, sem frame de IG, sem watermark (exceto se pedido). **Seta de arraste e handle são padrão global**, aparecem em todos os slides de 1 a N-1 na variação C (`references/setinha-arraste.md`): seta SVG manuscrita centralizada no rodapé (bottom 80px) + handle `@` da conta acima (bottom 140px). O handle aparece também no topo do slide 1, criando consistência de identidade ao longo do carrossel. Seta `›` no canto e seta-template-Canva colorida: proibidas.

Se um slide está bonito demais, está errado.

---

## 2. As 3 famílias visuais

Toda decisão de design é "qual família" + "qual cor de destaque" + "qual combinação tipográfica dentro dela".

| Família | Quando usar | Reference |
|---|---|---|
| **Editorial Preto** | Posicionamento, manifesto, oferta premium, narrativa pessoal reflexiva, autoridade. Vibe revista de negócios. | `references/familia-editorial-preto.md` |
| **Clínico Branco** | Listas comparativas, "X substitui Y", ofertas funcionais diretas, prova de números, checkmarks. Vibe bula bem desenhada. | `references/familia-clinico-branco.md` |
| **Manuscrito Cru** | Storytelling pessoal, confissão, antes/depois honesto, slides tipo tweet com avatar, vulnerabilidade. Vibe print de tweet emocional. | `references/familia-manuscrito-cru.md` |

Cada arquivo de família é **autoritativo** pras suas próprias regras de cor, tipografia, padding, layout slide-a-slide e elementos permitidos/proibidos. Leia o arquivo da família escolhida ANTES de gerar qualquer linha de HTML.

---

## 3. Fluxo de execução (siga sempre nesta ordem)

### Passo 0, Escreva a copy-visual pelo Crivo (antes de qualquer desenho)

O carrossel só vira imagem DEPOIS que a copy-visual passou no Crivo. Esta é a parte de copy do trabalho, e roda primeiro:

1. **Perfil:** roda `shared-references/crivo/00-perfil-do-usuario.md`. Sem perfil, vai pro onboarding antes de produzir. Avatar, VoC, banco de provas, voz e nicho são do usuário da vez, nunca de outra pessoa.
2. **Ancora:** `shared-references/crivo/01-entrada-verbatim.md`, puxa a fala real do público do usuário sobre o tema. A capa e os cards nascem de palavra real, não de rótulo.
3. **Escreve ou afia a copy-visual:** uma frase por card, na espinha (Fórmula 7), cada card UMA ideia comprimida (`shared-references/crivo/05-premissas-mestras.md`, as 8 leis). Se a copy-de-apoio que chegou é fraca ou falta um card, a skill ESCREVE o que falta, ancorada no perfil.
4. **Passa pelo gate** `shared-references/crivo/03-gate-cub.md`: CUB por card, as 3 perguntas do gate na CAPA (dá pra ver a cena? é falsificável? só este cliente diria?), a passada de Consciência, prova no CTA, e o anti-vazamento (nada do perfil-de-referência entra). Nicho regulado roda também `04-gate-regulado.md`. Card que não passa, reescreve antes de desenhar.
5. **Anti-IA** `shared-references/filtro-anti-ia/`: sem travessão, sem frase de robô. Roda `python3 scripts/lint_copy.py` na copy-visual (ele reprova em-dash e o verbo banido da anti-voz Soft, ver `shared-references/filtro-anti-ia/padroes-banidos.md`, falha dura re-roda).

Só com a copy-visual aprovada o desenho começa. Daqui pra frente, a regra de ouro: o render não muda palavra (se o layout exigir mexer, re-passa a ancoragem e a capa no gate).

### Passo 1, Estruture os cards e detecte a função de cada slide

A copy pode vir numerada (`Slide 1:`), em markdown (`## Slide 1`), ou em texto solto separado por linha em branco dupla. Detecte o formato automaticamente. Pra cada slide, identifique título (linha mais forte), corpo, palavras-chave (já marcadas com `**negrito**` ou aspas, RESPEITE, são pista de onde vai o accent) e CTA (último slide ou com palavra de comando + código).

Depois, aplique a tabela de `references/deteccao-automatica.md` pra inferir a **função** de cada slide (hook, problema, virada, método, prova, oferta, CTA, confissão, lista-substitui, conteúdo-genérico), isso espelha os 7 movimentos do Cap 6. **Declare a lista de funções detectadas ao usuário antes de seguir**, é a única chance dele corrigir antes de você desenhar errado. Se a estrutura não estiver clara, pergunte. Nunca adivinhe número de slides.

### Passo 2, Aplica a ID do cliente, ou escolhe família e pergunta

**Antes de tudo, cheque a identidade visual do cliente** (`references/identidade-visual-cliente.md`). Se ele já tem ID (no `soft-perfil.md`, ou anexou referência, ou disse "igual ao último"): **aplica a marca DELE e pula pro Passo 3** (família = estrutura; cores/fontes/formato do cliente = tinta). A skill é marca-neutra: cada cliente desenha na própria ID, nunca numa marca-padrão.

**Se o usuário já indicou família/estilo** ("editorial", "manuscrito", "igual ao último", anexou referência visual): pule pro Passo 3.

**Se NÃO indicou nada e não tem ID salva**, pare e pergunte. Use a tool de pergunta interativa quando disponível (senão, markdown). Leia `references/perguntas-design.md` ANTES de perguntar. Ao fim, ofereça salvar as escolhas como a ID do cliente. A pergunta tem 4 partes: (1) família visual; (2) cor de destaque, opções nomeadas + "outra"; (3) combinação tipográfica dentro da família (leia `references/tipografia.md`); (4) elementos visuais extras (só tipografia / line-art / tweet-avatar no slide 1 / diagrama manuscrito, as opções 2–4 combinam entre si).

Não pergunte cor de fundo nem de texto, são inferidas pela família (Editorial = preto; Clínico = branco; Manuscrito = pode ser preto ou branco, pergunte só nesse caso).

### Passo 3, Carregue os references da família escolhida

Antes de gerar HTML, leia obrigatoriamente:

1. `references/familia-{escolhida}.md`, cores, tipografia, layouts por tipo de slide, elementos permitidos/proibidos
2. `references/tipografia.md`, combinações tipográficas e Google Fonts URLs
3. `references/escala-densidade.md`, **obrigatório**, tabela determinística de font-size por número de palavras. Elimina improviso de escala.
4. `references/tipografia-quebra-linhas.md`, **obrigatório**, phrase ragging, widow control, proibição de quebra de termos compostos. Aplicar depois de escala e antes de renderizar.
5. `references/layouts.md`, layouts canônicos por função de slide (guia transversal)
6. `references/deteccao-automatica.md`, tabela de detecção de função (já usada no Passo 1; releia se tiver dúvida)
7. `references/setinha-arraste.md`, **sempre**, spec da setinha de arraste de todos os slides de 1 a N-1
8. `references/layout-utilitario.md`, só se família Clínico Branco E copy técnica/listada/comparativa fria
9. `references/layout-tweet-avatar.md`, só se a pergunta D incluiu "Tweet-Avatar"
10. `references/layout-diagrama-manuscrito.md`, só se a pergunta D incluiu "Diagrama Manuscrito"
11. `references/elementos-manuscritos.md`, só se for usar setas/sublinhados/círculos (Manuscrito Cru sempre, outras famílias só em casos pontuais)

Não pule isso. Padding, escala de fonte e elementos permitidos não são improvisados, vêm dos references.

### Passo 4, Decida o layout slide a slide

Pra cada slide, pegue a função detectada no Passo 1 e escolha o layout correspondente. Cada arquivo de família tem sua tabela "Layout por tipo de slide", use como guia primário; `references/layouts.md` é o transversal.

| Função (movimento do Cap 6) | Exemplo de slide | Layout |
|---|---|---|
| **Hook** | Slide 1, frase de alta polaridade | `hook` (estilo varia por família) |
| **Problema** | Lista de dores, "todo dia você tenta..." | `problema` |
| **Virada** | Frase única que muda o jogo | `virada` |
| **Método/Conteúdo** | Lista, etapas, comparativo X/Y | `metodo` ou `lista-substitui` |
| **Prova** | Anos + faturamento, número grande, depoimento | `prova` |
| **Oferta** | "Disponível pra você hoje", produto específico | `oferta` |
| **CTA** | Comente MÉTODO, palavras-código, comando final | `cta` |

Não invente layout novo. Se o slide não encaixa em nenhum, escolha o mais próximo e adapte respeitando padding/escala da família.

**Ritmo orgânico, não force título+corpo em todo card.** A hierarquia de 2 níveis (Regra 2) é **teto, não obrigação**: muitos cards ficam mais fortes SEM título. Se 3+ cards seguidos usam o mesmo molde (título grande + corpo), o carrossel vira template e cansa, quebre o padrão. Varie a forma pela função do card:

- **Afirmação pura** (uma frase grande sozinha, sem corpo) na virada e no soco.
- **Lista / chips** sempre que o card **enumera** coisas. Enumeração nunca vira prosa amassada: "posta story, posta no feed, manda direct" vira três itens de lista (ou chips), não uma frase corrida. Lista é mais escaneável e quebra o padrão visual do bloco de texto.
- **Prosa** (parágrafo fluido sem título, com 1–2 palavras em accent no meio) pra dor que precisa respirar.
- **Número dominante** (o dado gigante ocupando o card) na prova.
- **Título + corpo** só quando os dois realmente somam, não por inércia.

Regra prática no Passo 1: ao detectar a função de cada card, decida também a **forma** (afirmação / lista / prosa / número / título+corpo) e garanta variação ao longo do carrossel. Card que enumera → lista, sempre.

### Passo 5, Gere o HTML com Python

**Sempre use Python pra gerar o HTML.** Nunca shell heredoc, nunca echo, `$` e crase corrompem strings. Use `scripts/build_carousel.py` como esqueleto base: já tem o template `assets/template-base.html` (viewport 1080×1350), o sistema de slot `{{FONT_LINKS}}` / `{{SLIDES}}`, e o wrapping `.slide-wrapper > .slide-label + .slide` (necessário pra exportação).

Cada slide é um `<div class="slide">` independente de 1080×1350px. O preview no chat mostra em escala reduzida (`transform: scale(0.4)`); a exportação remove o scale e captura tamanho real.

**Quebra de linhas obrigatória.** Antes de inserir qualquer título ou corpo, aplique as 6 regras de `references/tipografia-quebra-linhas.md`. Nunca deixe o browser quebrar via `word-wrap`. Toda quebra é explícita via `<br>` manual; termos compostos (marcas, valores, unidades) vão em `<span style="white-space:nowrap">`. É o que separa carrossel editorial de amador, widow, rag ruim e quebra de marca no meio são os erros mais visíveis.

**Widow check obrigatório, ANTES de escrever o HTML de cada slide.** Pra cada bloco com quebra manual: (1) separe o texto nas quebras planejadas; (2) leia a última linha isolada; (3) se tiver 1 palavra só, ou 2 palavras com menos de 8 caracteres no total → reajuste a quebra antes de escrever o `<br>`; (4) só escreva o HTML depois que todas as últimas linhas passarem. É check pré-geração, não pós.

**Modo de fontes (`embed_fonts`):** `build_html()` aceita `embed_fonts=True/False`. Default `False` (carrega Inter, Fraunces etc do CDN do Google Fonts via `<link>`). Use `True` quando o ambiente bloqueia `fonts.googleapis.com` (sandboxes corporativos, airgapped), o builder lê os `.woff2` de `assets/fonts/` e injeta como `@font-face` base64 inline. Em ambiente normal, deixe `False` (HTML 14k vs 176k chars).

### Passo 5.5, Auditoria obrigatória antes do preview

**Nunca mostre preview sem auditar.** Leia `references/auditoria-pre-preview.md` e rode o checklist de 16 perguntas em cada slide. Qualquer NÃO aciona correção via `str_replace` no slide específico e re-auditoria antes de seguir. A auditoria é **interna**, não reporte ao usuário; ele vê só o preview limpo. Garante que todo carrossel passa nas regras duras (fundo chapado, 1 accent, padding 100px, simetria, hierarquia 2 níveis, negrito cirúrgico, zero sombra, escala correta) sem depender do bom senso momentâneo.

Slide que falhou e não pode ser corrigido (ex.: copy impossível de acomodar em 71+ palavras de corpo) → pare, reporte o problema específico, sugira redução na copy.

### Passo 6, Mostre preview ANTES de exportar

Crie o HTML em `/home/claude/<nome-do-trabalho>/preview.html` e mostre com `present_files`. Diga exatamente:

> **"Quais slides precisam de ajuste antes de eu exportar os PNGs?"**

Não exporte nada antes de aprovação explícita ("pode exportar", "aprovado", "manda ver", "ok exporta"). Se pedir ajuste, edite **só os slides mencionados** com `str_replace`. Nunca regenere o carrossel inteiro a menos que a direção mude por completo.

### Passo 7, Exporte com Playwright

Use `scripts/export_pngs.py`:

```bash
python3 scripts/export_pngs.py \
  --html /home/claude/<nome>/preview.html \
  --output /home/claude/<nome>/slides
```

O `export_pngs.py` roda o **gate de craft em código** (`scripts/craft.py`) antes de capturar: reprova peça com texto ilegível contra o fundo (contraste WCAG, o "branco no branco") e sinaliza órfã provável. Falha dura = **não exporta** (corrige e roda de novo; `--force` ignora, não use). É o que garante que os checks 14 e 10 da auditoria aconteçam SEMPRE, em código, não só quando o agente lembra. Na escrita de cada bloco de texto, use `nw()` de `scripts/craft.py` pra travar a anti-órfã na origem.

Saída: `slide_01.png`, `slide_02.png`, … com zero-padding de 2 dígitos. Mova os PNGs pra `/mnt/user-data/outputs/` e use `present_files` com **todos os slides**, na ordem (o primeiro é o slide 1).

---

## 4. Filtro Mobile-First, obrigatório antes de aprovar

O Carrossel é peça visual lida quase toda no celular. Antes do preview final, ele atravessa o **filtro Mobile-First** da `shared-references` (`shared-references/filtro-mobile-first/`, consolidado no `checklist-final.md`): corpo legível em tela pequena, contraste WCAG AA (4.5:1), título lido sem esforço em 0,3s, sem letra apertada. As regras duras desta reference (fundo chapado, escala determinística por densidade, padding 100px, simetria total) já implementam quase tudo, a auditoria do Passo 5.5 é onde o filtro se materializa. **Peça que não passa no celular não sai.**

> O filtro **Anti-IA roda na escrita da copy-visual** (Passo 0), antes do desenho. Aqui no visual, o que materializa o filtro é a legibilidade mobile da auditoria do Passo 5.5.

---

## 5. Quando o usuário é leigo

A skill funciona pra leigo no chat tão bem quanto pra power user no terminal. Sinais de leigo: não menciona "PNG", "1080", "viewport", "Playwright"; cola copy sem markdown; pede "faz um carrossel pra mim com isso"; não sabe hex de cor.

**Adaptações:** nunca mostre código, só o resultado · não explique Playwright nem Google Fonts · na pergunta de design, ofereça opções nomeadas (Preto Editorial, Laranja queimado, Inter Pesado), nunca exija hex · se não souber escolher tipografia, pergunte a sensação ("mais editorial e reflexivo, mais clínico e direto, ou mais cru e manuscrito tipo tweet?") · após exportar, diga em uma frase: "Pronto, seus 9 slides estão aí, na ordem. É só baixar e postar."

Não terceirize decisão técnica pro leigo. Decida você e mostre o resultado.

---

## 6. Erros que esta reference nunca comete

1. **Nunca mais de 1 cor de destaque por carrossel.** Roxo + azul + amarelo = Canva.
2. **Nunca ícones Material/Font Awesome coloridos.** Só line-art SVG mono.
3. **Nunca `text-shadow` nem `box-shadow` em conteúdo.** Sombra é marca de amador.
4. **Nunca arredonda cantos do slide.** O slide é retângulo sólido.
5. **Sempre padding 100px nos 4 lados.** Sem variação, sem exceção.
6. **Nunca `letter-spacing` positivo em título grande.** Sempre negativo.
7. **Nunca weight 600 chamando de "negrito".** Negrito é 700 ou 800.
8. **Nunca exporta sem mostrar preview e pedir aprovação.** Sempre passo intermediário.
9. **Nunca regenera o carrossel inteiro por 1 ajuste.** Edita só o slide mencionado com `str_replace`.
10. **A fonte da MARCA do cliente sempre vence; a curadoria é a rampa de quem não tem.** Pro export embutido offline, o `build_carousel.py` traz 9 combos prontos (a chave `font_combo`): `playfair_classico` · `fraunces_premium` · `caslon_autoridade` · `inter_bruto` · `jakarta_limpo` · `space_tecnico` · `inter_pesado` · `bricolage_honesto` · `jakarta_confessional`. Qual usar por família visual vive em `references/tipografia.md`. **Mas se o cliente tem fonte de marca própria (a ID visual dele, ver `references/identidade-visual-cliente.md`), usa ELA**, mesmo fora da curadoria: no Chat, adiciona o `<link>` do Google Fonts + o `font-family`; no Code, passa `custom_font_links` + `custom_font_family` pro `build_html()` (a fonte da marca ignora os 9 combos). Os 9 são o conjunto pronto-offline pra quem ainda não definiu tipografia, não uma cerca.
11. **Nunca preto puro #000 nem branco puro #FFF no fundo se a família for Editorial.** Editorial usa #0A0908 e #F5F2EC.
12. **Nunca adiciona ilustração no hook por iniciativa própria.** Hook default é tipografia pura + espaço negativo. Ilustração só entra se o usuário (a) subir imagem, (b) pedir explicitamente, ou (c) entregar referência visual com ilustração.
13. **SEMPRE simetria total nos slides.** A regra mais importante depois de "fundo chapado", o carrossel é feito pra ser impulsionado como anúncio, cada slide precisa parecer profissional e equilibrado. Padding 100px nos 4 lados, igual entre slides · `justify-content: center` + `align-items: center` no `.slide`, sempre · conteúdo num container interno com `max-width` 720–880px e `text-align: left` (ou `center` em CTA e prova-numérica) · use `make_symmetric_slide()` do `build_carousel.py` (`make_slide()` é deprecated) · proibido `position: absolute` pra conteúdo · proibido `flex-end`/`flex-start` · o bloco ocupa entre 60% e 100% da área útil horizontal.
14. **Nunca trata layout canônico como receita.** Os layouts dos references são repertório, não checklist. Antes de escolher, leia a copy do slide e pergunte "qual versão amplifica essa frase?". Se duas pareceram igualmente boas, mostre as duas no preview, é barato.
15. **A copy-visual é escrita aqui, pelo Crivo (Passo 0).** Se a copy-de-apoio que chegou é fraca ou falta um card, REESCREVE ancorando no perfil e passando pelo gate, não terceiriza. O que NÃO faz aqui é texto longo (caption, roteiro), isso é das skills de conteúdo.

---

## 7. Princípio final

Cada slide é uma página de revista, não uma página de Canva.

O leitor vê o slide em 0,3 segundo. Se nesse tempo ele sente que é diferente do feed, lê o título inteiro sem esforço, e quer arrastar pro próximo, você acertou. Se ele rola sem registrar, todo o resto não importa. Quebra padrão. Sempre.

---

## 8. O branch de imagem-IA (quando renderizar HTML→PNG vs quando gerar ILUSTRAÇÃO por IA)

Quase toda peça do designer é **HTML→PNG determinístico**: é o nosso diferencial (contraste em código, anti-órfã, marca do cliente, copy editável). Mas há um caminho paralelo, o **branch de imagem-IA**, pra quando a peça pede uma ILUSTRAÇÃO/cena/textura que o HTML tipográfico não entrega. Este branch é o lar canônico da regra; o Infográfico-Lousa da Manuscrito Cru, o fundo do deck animado (`formato-deck-animado.md`) e a capa/thumbnail de vídeo (§8.5) todos herdam daqui.

### 8.1 O roteamento (HTML estruturado vs ilustração livre)

A decisão é pela NATUREZA do conteúdo, não pelo gosto:

| Vai por HTML→PNG (o default) quando o conteúdo é | Vai pelo branch de imagem-IA quando o conteúdo é |
|---|---|
| passos numerados, framework, comparação X/Y, tabela, prova de números | um resumo visual, um fluxo, uma cena, uma ilustração conceitual, uma textura fotográfica (caderno, cenário) |
| grade rígida, tipografia editorial, copy que muda em A/B | escaneável e livre, onde a "cara feita à mão" ou a cena É a mensagem |
| a marca do cliente precisa ser exata (fonte própria, hex de cor) | o fundo/atmosfera importa mais que a precisão tipográfica |

Além do conteúdo, o **ambiente força a mão**: se o ambiente **não renderiza PNG** (app puro, sem Playwright) e o cliente quer um visual ilustrado, o branch de imagem-IA é o caminho, entregando o **prompt pronto** em vez do PNG.

### 8.2 A regra dura: texto por overlay HTML/CSS, NUNCA dentro da imagem gerada

Vale pra TODO uso de imagem-IA nossa. O gerador de imagem **só produz o fundo/cena**; todo texto que precisa ser editável (título, bullets, números, CTA) entra por cima via overlay HTML/CSS. Por quê é lei: copy editável depois sem regenerar · gate de contraste funciona · o modelo não erra letra/acento · anti-órfã e escala de densidade só valem no HTML. (Detalhe completo em `formato-deck-animado.md` §4.)

Exceção única: o **Infográfico-Lousa em modo imagem-IA**, onde o traço manuscrito É o ponto e a peça não vai pra A/B, pode ter o texto dentro da imagem gerada, com o custo declarado ao cliente de que não fica editável (mudar palavra = regenerar). Em qualquer peça que precise de copy editável, o texto entra por overlay, sem exceção.

### 8.3 O prompt portátil (funciona em imagegen, gpt-image e Gemini)

A copy-visual passa pelo **Crivo ANTES** (ancoragem + gate + anti-IA do Passo 0), igual a qualquer peça. Só o render final vira "prompt fechado que o cliente cola no gerador dele". O prompt é neutro por construção: não amarra em gerador nenhum. Molde:

```
[Estilo: fotográfico / ilustração premium / lousa manuscrita, conforme a peça]

CENA: [descrição do fundo/cena/textura, sem nenhuma palavra escrita]

PALETA: [cores da marca do cliente, ex: preto #0A0908, accent verde #147a3c]

COMPOSIÇÃO: [onde fica o elemento visual; qual área fica limpa/escurecida pra receber texto por cima]

SEM TEXTO, SEM PALAVRAS ESCRITAS, SEM LEGENDAS, SEM LOGOS GRANDES.
```

### 8.4 O ramo dos 3 ambientes

- **App / chat (sem Bash):** o designer **entrega o prompt pronto** (bloco pra copiar), a copy-visual já gated dentro dele, com o aviso "cole no seu gerador de imagem; o texto editável entra por cima depois, no HTML". Não roda gerador nem exporta PNG.
- **Claude Code (tem Bash + imagegen):** o motor default é o **`imagegen` local** (gpt-image-1.5). Roda:
  ```bash
  export OPENAI_API_KEY="$OPENAI_API_KEY"
  /home/cloud/.venvs/imagegen/bin/python \
    /home/cloud/.codex/skills/.system/imagegen/scripts/image_gen.py generate \
    --prompt "$(cat prompt.txt)" --size 1024x1536 --quality high --out out.png
  ```
  (tamanhos válidos: 1024x1024, 1536x1024, 1024x1536; use `edit` quando houver foto de referência). Depois compõe o texto por overlay em HTML e exporta.
- **Agente / Telegram (tem Bash):** roda o pipeline do Code; a entrega é **ARQUIVO** cujo **path completo vai na resposta** (ex: `/home/cloud/pecas/lousa-estoque/final.png`), mensagens sem markdown pesado.

Dependência anotada: não temos Gemini/nano-banana acoplado ao ecossistema; temos o `imagegen`. O branch emite prompt neutro (o cliente cola no gerador dele) e, no Code, chama o nosso `imagegen`. Nunca amarrar em Gemini.

**A regra que atravessa tudo:** o designer nunca para por falta de gerador. Com o `imagegen` (ou outro gerador) na mão, ele GERA a imagem e entrega o PNG composto; sem ele, entrega o prompt fechado e gated pronto pra colar no gerador do cliente, mesma qualidade de copy-visual. Fecha em 1 linha o que o cliente passa a ganhar: "com um gerador conectado eu já te devolvo a imagem pronta, sem você colar em lugar nenhum" (pra ele escolher pegar, sem empurrar).

### 8.5 A capa / thumbnail de vídeo (o 6º formato, herda deste branch)

A thumbnail é a **headline do vídeo**: a pessoa decide clicar em menos de 1 segundo, olhando a capa entre dezenas de miniaturas. Por isso vem ANTES do roteiro (thumbnail-first): você desenha o clique, e o vídeo entrega a promessa da capa. A capa é imagem-IA (rosto real do dono + cena), então segue a lei-mãe do §8.2: **o gancho de 3-5 palavras entra por overlay HTML/CSS por cima, NUNCA dentro da imagem gerada** (editável sem regenerar, legível na fonte da marca, teto de palavras controlado).

**Os 2 insumos antes de desenhar (bloqueia se faltar):**
1. **Foto de referência do dono** (rosto nítido, luz frontal, expressão neutra-forte). Uma foto boa rende dezenas de capas com expressões variadas: reuse a MESMA entre vídeos, variando só a expressão pedida no prompt (é o que mantém a marca do canal). A foto vai ANEXADA no gerador (no Code, o `imagegen` em modo `edit`); NUNCA coloque o caminho da foto dentro do texto do prompt. Sem foto, o prompt sai genérico (rosto inventado) e perde o canal: pede a foto numa linha antes de gerar.
2. **Ancoragem do gancho:** 2-4 falas de DOR + 2-4 de DESEJO do avatar sobre o tema, com o N. O gancho nasce de uma fala real, nunca de choque inventado. Sem fala literal, ancora em prova real do dono (case, resultado, mecanismo); número não confirmado vira `[A CONFIRMAR]` e NÃO pode virar elemento focal nem número-atrás-do-ombro até ter fonte.

**As 8 regras de CTR (o coração da capa):** (1) rosto 30-50% do quadro, legível em miniatura mobile; (2) texto 3-5 palavras (ideal 3, teto 5), estilingue de curiosidade, nunca sentença; (3) 2 cores dominam (marca + 1 destaque de alto contraste: amarelo/vermelho/ciano); (4) 1 elemento focal além do rosto (objeto/número/logo/seta) que dá o assunto num relance; (5) alto contraste testável (aperta os olhos: tudo ainda se separa); (6) zona-limpa do selo de duração (canto inferior direito livre); (7) legível a 320px; (8) consistência de canal (mesma fonte, cor, enquadramento entre vídeos).

**O gancho é COPY:** passa pelo gate do Passo 0 igual a uma headline (ancorado, curiosidade real que o vídeo entrega, teto CONTADO, complementa o título sem repetir trecho literal, anti-IA). No gate visual do Passo 5, o check "Gancho de capa" fecha a barra. Título do vídeo (a linha longa do YouTube) e gancho (as 3-5 palavras GRANDES na imagem) são coisas diferentes que se somam, não se repetem.

**Tom emocional (a expressão do rosto casa com a dor/desejo, não com estética).** Peça em termos FÍSICOS concretos, nunca rótulo abstrato ("pareça surpreso" sai fraco; "olhos arregalados, boca entreaberta, sobrancelhas levantadas" sai forte):

| Tom | Descrição física pro prompt | Olhar | Serve pra |
|---|---|---|---|
| **Choque** | olhos arregalados, boca entreaberta, sobrancelhas levantadas, mão perto do rosto | direto na câmera | revelação que quebra crença |
| **Curioso** | uma sobrancelha erguida, meio sorriso de canto, queixo pra cima | fora do quadro, na direção do texto | loop aberto ("por que isso acontece") |
| **Confiante** | queixo firme, meio sorriso fechado, ombros pra trás, braços cruzados | direto na câmera | autoridade e método |
| **Tensão** | testa levemente franzida, olhar intenso, gesto de mão apontando | direto na câmera | tese contrária ("para de fazer isso") |

**Proporção:** 1280x720 (16:9) pro YouTube long-form / aula / VSL. Shorts / reel de capa é 1080x1920 (9:16): rosto e texto na METADE DE CIMA (o terço de baixo some atrás da UI de título/botões/legenda); rosto pode ocupar mais (40-55%); texto empilhado em 2-3 linhas curtas cabe melhor no vertical; reserve o topo pro texto e nada importante nos últimos ~25% de baixo.

**O molde do prompt (só o CENÁRIO, texto vem por overlay depois):**
```
Usando a foto de referência do dono em anexo, gere uma imagem de FUNDO de thumbnail em [1280x720 16:9 / 1080x1920 9:16].
Composição: dono [à esquerda/direita/centro] ocupando ~[30-50]% do quadro; expressão [descrição física do tom]; olhar [direção].
Cenário: fundo [hex] tratamento [chapado/gradiente/cena desfocada]; elemento focal [objeto/número/seta], secundário e menor que o rosto.
Paleta: primária [hex marca], destaque [cor de alto contraste].
Restrições: NÃO escreva NENHUM texto na imagem, nem uma letra (o texto entra por overlay depois); deixe o [terço/lado onde o texto vai] completamente limpo; rosto nítido, mantendo os traços da foto em anexo; alto contraste entre rosto e fundo; canto inferior direito limpo (selo de duração); sem UI do YouTube, sem marca d'água.
```

**Erros de gerador e correção no prompt:** texto torto/inventado na imagem → reforça "NÃO escreva NENHUM texto, nem uma letra" · rosto não parece o dono → foto mais nítida/frontal + "mantenha os traços da foto em anexo" · rosto pequeno → "% do quadro explícito (35-50%), close no rosto e ombros" · fundo poluído → "apenas 2 cores dominantes, fundo simples" · baixo contraste → "borda/glow sutil separando o rosto do fundo" · elemento focal roubou a cena → "desfocado, secundário, menor que o rosto" · área do texto não ficou limpa → "deixe o [lado] completamente limpo, sem elementos".

**Fronteira / fluxo:** esta capa era a antiga skill `soft-conteudo-thumbnail`, agora dobrada aqui. O designer DECIDE a capa, escreve o gancho gated e RENDERIZA (chama o `imagegen` em modo `edit` com a foto anexada, aplica o gancho por overlay HTML/CSS na fonte da marca, exporta o PNG e devolve o path). Quem escreve o ROTEIRO do vídeo é a `soft-conteudo-reels` (depois da capa, thumbnail-first). No app/chat sem Bash, entrega o prompt pronto pro dono colar no gerador dele (o dono anexa a foto lá) + avisa que aplica o gancho por cima no HTML.

---

## Handoff

PNGs exportados e aprovados → o usuário posta ou impulsiona. A copy-visual já foi escrita e gated no Passo 0; texto longo (caption, roteiro) é das skills de conteúdo. Derivar pra outras plataformas fica fora do core.
