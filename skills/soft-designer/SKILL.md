---
name: soft-designer
description: "A skill ÚNICA de design VISUAL do método Soft. Recebe a tese/copy de uma skill de conteúdo (soft-conteudo) ou do usuário e produz o ARQUIVO final: carrossel PNG 1080x1350, banner estático, ou deck de slides 16:9. Escreve a copy-visual (headline do banner, texto de cada card, título de cada slide) pelo Crivo e renderiza em HTML/CSS com 3 famílias de estilo, exportando PNG que quebra padrão no feed. Use quando o pedido for design, arte, PNG, carrossel visual, banner, slides visuais, capa, diagrama, exportar imagem, 'faz o carrossel', 'cria o banner', 'desenha os slides', 'monta o visual', 'transforma essa copy em arte'. NÃO use pra escrever a headline/gancho de texto (vai pra soft-conteudo-headlines), nem o CORPO de texto longo, caption, roteiro ou carta (vai pra soft-conteudo), nem o posicionamento (vai pra soft-posicionamento), nem os slides operados dentro do webinar (vão pra soft-webinar)."
---

# Soft Designer, a única skill de visual

O design do método num lugar só: banner, carrossel e slide viram uma capacidade só, que todas as skills chamam. O valor próprio é a **engenharia visual** (3 famílias de estilo, tipografia editorial, render HTML/CSS para PNG) somada a um trabalho de copy: **a skill escreve a copy que vai NO visual** (a headline, o texto do card, o título do slide), porque texto curto de peça visual é arte própria, e a passa pelo mesmo Crivo antes de desenhar.

**O que esta skill faz por você:** é o design do método num lugar só. Gera o visual pronto, EM HTML renderizado no próprio Claude Chat, do jeito que você já monta: carrossel, banner, slides de aula/webinar e página/site. No Chat o HTML renderizado JÁ É a entrega (você vê e salva); no Code, ele ainda vira PNG.

**As 6 leis (valem antes de tudo):** (1) a copy que vai no visual nunca assume que o cliente já sabe o contexto, zero palavra difícil; (2) abre ensinando o que faz; (3) é consultiva, puxa de você a família/cor/formato antes de desenhar; (4) contexto é rei: o layout flutua pela função de cada peça; (5) **admite se faltar insumo, nunca inventa**: sem prova, número, ou fonte/cor de marca, você pergunta ou marca `[A CONFIRMAR]`, jamais chuta um valor plausível ou uma marca-padrão; (6) **output enxuto pros 2 leitores** (o humano que vê e a IA que recebe): entrega só a peça e o necessário, zero meta-narração, zero tabela de gate na saída. (Detalhe em `shared-references/operacao-padrao.md`, Seção 0.)

**Este SKILL.md é o processo inteiro. Siga os passos na ordem, pare nos STOPs, e rode o GATE VISUAL (o checklist interno do Passo 5) por dentro antes de exportar qualquer peça.** As references aprofundam, mas quem lê só o SKILL.md executa.

## Output Contract (o que você entrega)
- **Carrossel:** PNGs 1080x1350 na ordem, prontos pra postar ou impulsionar (copy-visual de cada card escrita aqui pelo Crivo + render nas 3 famílias).
- **Banner / criativo:** estático (headline + copy-curta escritas aqui + composição visual + CTA).
- **Slides:** deck 16:9 (copy-visual de cada slide + layout pela espinha de tensão; o roteiro da fala chega pronto).
- Você **mostra preview e PARA** antes de exportar. Nunca exporta sem o "pode exportar".
- **No Claude Chat a entrega É o HTML renderizado** (carrossel, banner, slides ou página visíveis na tela pra você ver e salvar). A exportação em PNG é o caminho do Code; no Chat não fica esperando um export que não existe lá.
- A copy-visual passa pelo Crivo ANTES do desenho. **O render não muda palavra** (se o layout exigir mexer, re-passa a ancoragem e a headline no gate).
- A saída é **limpa, como no Claude Chat**: só a peça (a arte renderizada ou o PNG). **O gate visual roda por dentro** (auditoria silenciosa); a tabela do Passo 5 NÃO vai pra saída.
- Você **nunca inventa prova nem número** (sem banco de provas no perfil, sai com placeholder marcado) e **nunca exporta peça que falhou no gate visual**.

## Passo 0, lê o perfil e ancora a copy-visual (NÃO PULE)
Lê o perfil do usuário (`shared-references/crivo/00-perfil-do-usuario.md`): avatar, fonte de VoC, banco de provas, voz e nicho são DELE. Usuário sem perfil vai pro onboarding antes de produzir. O designer nunca assume dados de outra pessoa, nem deixa o perfil-de-referência vazar pra peça.

Lê também a **identidade visual do cliente** (`references/identidade-visual-cliente.md`): cores, fontes e formato são DELE. A skill é marca-neutra, não tem visual próprio, cada cliente desenha na marca dele. Se a ID está no perfil, ela manda no Passo 2 (e você não pergunta cor/fonte). Se não está, o Passo 2 pergunta e oferece salvar.

O que ENTRA: a tese ou briefing da peça (de `soft-conteudo`, `soft-webinar`, `soft-lancamento-pago`, ou do usuário direto). Pode vir só o tema, pode vir copy longa de apoio. O que NÃO vem pronto é a **copy-visual** (a frase que vai dentro do desenho): isso é trabalho daqui.

A copy-visual obedece o Crivo como qualquer peça:
1. **Ancora:** puxa o verbatim real do público do usuário sobre o tema (`shared-references/crivo/01-entrada-verbatim.md`). A capa e os cards nascem de palavra real, não de rótulo.
2. **Escreve ou afia:** uma frase por card/slide, na espinha (Fórmula 7), cada um UMA ideia comprimida (`shared-references/crivo/05-premissas-mestras.md`). Copy fraca ou card faltando, REESCREVE ancorando no perfil, não terceiriza.
3. **Passa pelo gate de copy** `shared-references/crivo/03-gate-cub.md`: CUB por card, as 3 perguntas do Harry na CAPA (dá pra ver a cena? é falsificável? só este cliente diria?), passada de Consciência, prova no CTA, anti-vazamento. Nicho regulado roda também `04-gate-regulado.md`. Card que não passa, reescreve antes de desenhar.
4. **Anti-IA** `shared-references/filtro-anti-ia/`: sem travessão, sem frase de robô. No Code, roda `python3 scripts/lint_copy.py` na copy-visual (reprova em-dash e o verbo banido da anti-voz Soft).

Só com a copy-visual aprovada o desenho começa.

## Passo 1, detecta a superfície e a função de cada peça
As superfícies do método (cada uma com sua reference de processo, leia a da peça da vez):
- **Carrossel** (a frente mais madura) → `references/processo-design.md`. A copy pode vir numerada, em markdown, ou texto solto. Pra cada slide, identifica título, corpo, palavras de accent (já marcadas com negrito/aspas, RESPEITE) e CTA. Aplica `references/deteccao-automatica.md` pra inferir a **função** de cada card (hook, problema, virada, método, prova, oferta, CTA). **Declara a lista de funções detectadas ao usuário antes de seguir** (única chance dele corrigir antes de desenhar errado). Estrutura recomendada: 7 a 10 slides (Fórmula 7). Se vier fora disso, desenha o que veio mas avisa.
- **Banner / criativo** → `references/processo-banner.md`. Anatomia de 3 elementos só: a headline que para + a copy-curta de apoio (opcional, corta se não somar) + o CTA visual (em tráfego pago é obrigatório; o destino do clique decide o que o CTA promete). Banner não é carrossel comprimido, é UMA mensagem.
- **Slides de apresentação** → `references/processo-slides.md`. Espinha de tensão do deck, 1 ideia por slide / lido em 3s, dimensão 16:9. O roteiro e a oferta chegam prontos; aqui é a engenharia visual + a copy-visual de cada slide.
- **Página / site** → uma página em HTML (landing visual, página de carta, página de evento). A copy e a estrutura chegam prontas (de `soft-funil-landing` ou do usuário); aqui é a pele visual no padrão do método (fundo chapado, 1 accent, tipografia editorial, cantos retos). Renderiza no Chat pra você ver.

## Passo 2, aplica a ID do cliente OU escolhe família + cor + tipografia
**Primeiro cheque a identidade visual do cliente** (`references/identidade-visual-cliente.md`). Se ele já tem ID (no perfil, ou anexou referência, ou disse "igual ao último"): **aplica a marca DELE e pula as perguntas** (a família vira a estrutura; as cores/fontes/formato do cliente são a tinta). Só pra cliente SEM ID definida é que você escolhe/pergunta abaixo, e ao fim oferece salvar.

Toda decisão é "qual família" + "qual cor de destaque" + "qual combinação tipográfica".

| Família | Quando usar |
|---|---|
| **Editorial Preto** | Posicionamento, manifesto, oferta premium, autoridade. Vibe revista de negócios. |
| **Clínico Branco** | Listas, comparativos X/Y, ofertas diretas, prova de números. Vibe bula bem desenhada. (default mais seguro) |
| **Manuscrito Cru** | Storytelling pessoal, confissão, antes/depois, tweet com avatar. Vibe print de tweet. |

**Se o usuário já indicou família/estilo** (ou anexou referência visual, ou disse "igual ao último"): segue. **Se NÃO indicou nada, PARA e pergunta** seguindo `references/perguntas-design.md` (3 perguntas no máximo, opções nomeadas com mini-descrição, nunca exige hex). Não pergunta cor de fundo nem texto (inferidas pela família). Fallback "decide você": um default **neutro e versátil** (Clínico Branco + Inter Bruto + um accent neutro/sóbrio, ou a cor que a marca dele indicar), avisa que é neutro (nunca chama de "a marca do método") e oferece salvar como a ID dele.

> **STOP de design:** sem família definida, não gera HTML. Pergunta, espera a resposta, segue.

Antes de gerar HTML, lê os references da família escolhida (cores, tipografia, layouts), mais os obrigatórios `references/escala-densidade.md` (font-size por densidade), `references/tipografia-quebra-linhas.md` (phrase ragging + widow control) e `references/setinha-arraste.md` (carrossel). Padding 100px nos 4 lados, escala de fonte e elementos permitidos vêm dos references, não se improvisa.

## Passo 3, decide o layout e escreve o HTML com Python
Pra cada peça, pega a função detectada e escolhe o layout correspondente da família. **Sempre usa Python pra gerar o HTML** (nunca shell heredoc/echo; `$` e crase corrompem strings). Usa `scripts/build_carousel.py` como esqueleto (template `assets/template-base.html`, viewport 1080×1350, `make_symmetric_slide()`).

As 7 regras inegociáveis do desenho:
1. **Fundo chapado** (preto #0A0908 ou branco #F5F2EC/#FFFFFF). Nunca gradiente nem textura forte.
2. **Hierarquia de 2 níveis no máximo** (título + corpo).
3. **Espaço negativo brutal** (30–50% do slide vazio).
4. **UMA cor de destaque** por peça, em 2–4 palavras-chave por slide.
5. **Negrito é arma:** 2–4 palavras, weight 700/800 (nunca 600).
6. **Tipografia mista é assinatura** (serif elegante OU sans pesada, nunca as duas no mesmo título).
7. **Sem chrome do Instagram**, e seta de arraste + handle (variação C) em todos os slides de 1 a N-1 do carrossel.

**Ritmo orgânico:** a hierarquia de 2 níveis é teto, não obrigação. Se 3+ cards seguidos usam título+corpo, o carrossel vira template e cansa. Varia a forma pela função: afirmação pura na virada, **lista/chips sempre que o card enumera** (nunca prosa amassada), prosa pra dor que respira, número dominante na prova.

**Anti-órfã na origem:** no Code, envolve TODO texto de peça com `nw()` de `scripts/craft.py` (junta as 2 últimas palavras com espaço inquebrável). No chat, faz a quebra manual com `<br>` e confere a última linha de cada bloco.

## Passo 4, mostra preview e PARA
Cria o HTML em `/home/claude/<nome>/preview.html` e mostra **só a peça LIMPA** (como no Claude Chat): a arte renderizada, sem tabela de gate, sem meta. Pergunta exatamente:

> **"Quais slides precisam de ajuste antes de eu exportar os PNGs?"**

**Não exporta nada antes de aprovação explícita** ("pode exportar", "aprovado", "manda ver"). Espera a escolha do usuário. Se pedir ajuste, edita **só os slides mencionados** com `str_replace`. Nunca regenera a peça inteira por 1 ajuste.

## Passo 5, roda o GATE VISUAL por dentro antes de exportar (auditoria silenciosa, NÃO imprime)
Este é o gate que **funciona em qualquer ambiente, inclusive o Claude Chat**, espelhando o que o `craft.py` faz no Code. Roda o gate **por dentro** (auditoria silenciosa), lendo CADA peça (cada card / o banner / cada slide). Só peça com VEREDITO=PASSA é exportada/entregue. Uma falha corrige o desenho daquela peça e re-roda o gate. A tabela abaixo é o teu **checklist INTERNO**, nunca a saída: o usuário recebe só a peça LIMPA (Passo 6), jamais a tabela.

| Check | Passa se | ✓/✗ |
|---|---|---|
| **Contraste por pele** | cada bloco de texto tem contraste forte contra o fundo IMEDIATO atrás dele (mira WCAG ≥ 3:1, AA 4.5:1 no corpo). **Pele clara → texto escuro `#1a1814` + accent escuro (verde `#147a3c`, NUNCA o neon `[COR-DE-ACAO do dono via config]` que some no creme); pele escura → texto claro.** Texto claro em fundo claro = ✗ automático. Teste: se você "sabe" que o texto está lá mas mal enxerga, é bug, não "sutil" | |
| **Anti-órfã** | NENHUMA palavra sozinha na última linha de um bloco. Última linha com 1 palavra, ou 2 palavras somando < 8 caracteres ("é só", "no a") = ✗. Termo composto (marca, R$3k, "Soft Business", 48h) quebrado entre linhas = ✗. Corrige puxando 1 palavra da linha anterior | |
| **Diagrama forte** | se a peça tem diagrama/gráfico/seta: traço **5–6px** (1–2px some no thumbnail = ✗) + **marcador semântico** (✕ vermelho = errado/morto · ✓ ou `$` verde = certo/dinheiro · ↑ = cresce; linha pelada sem marcador = ✗) + **rótulo** do que cada parte é (diagrama sem contexto = adivinhação = ✗) + grande o bastante pra ocupar o espaço. Sem diagrama na peça = N/A (✓) | |
| **1 ideia por peça** | o card/slide carrega UMA ideia, fechando numa frase-conclusão. Duas mensagens competindo pelo olho = ✗. No banner: um ponto focal só (hook OU número OU imagem, nunca dois) | |
| **Legível no celular** | título lido sem esforço em 0,3s numa tela de 6cm, escala bate com `escala-densidade.md`, sem letra apertada. Imagina a peça reduzida a thumbnail no feed: a mensagem principal chega? "Talvez" = ✗ | |
| **Fundo chapado + 1 accent + sem chrome** | fundo cor sólida (sem gradiente/textura), no máximo UMA cor de accent (em ≤ 4 palavras), zero sombra/box-shadow, zero ícone colorido, cantos retos. Carrossel: seta + handle nos slides 1 a N-1 | |
| **Nada vazio/fantasma** | todo elemento estrutural (grade de feed, mockup, célula) está preenchido com conteúdo plausível ou não existe. Caixa vazia + baixa opacidade = parece bug de carregamento = ✗ | |
| **Anti-IA (HARD)** | zero travessão "—" na copy-visual · zero "travar/travado/destravar" (exceção: aspa literal do cliente) · sem frase-emoldura ("a verdade é", "o segredo"). No chat (sem o lint), faz um CTRL+F manual de "—" e da família "travar" antes de marcar ✓ | |
| **Render não mudou palavra** | o texto desenhado é exatamente o que passou no gate de copy (Passo 0). Se o layout exigiu mexer numa palavra, ela re-passou a ancoragem e a headline antes de chegar aqui | |
| **VEREDITO** | **= o PIOR item acima.** Um ✗ qualquer = CORRIGE o desenho e re-roda. Só tudo-✓ = PASSA e pode exportar | |

> **Cinto extra no Code (não substitui o checklist interno):** depois de gerar o HTML, roda `python3 scripts/craft.py audit /home/claude/<nome>/preview.html`. Ele reprova em código o "branco no branco" (contraste por luminância WCAG) e sinaliza órfã provável. O `export_pngs.py` já chama esse gate sozinho e **recusa exportar** peça com falha dura (`--force` ignora, não use). É o mesmo gate da tabela, agora em código, pros 2 checks que dá pra automatizar de forma confiável. No Claude Chat o craft.py não roda, por isso o checklist interno acima é o que segura a barra (auditoria silenciosa, nunca impresso).

## Passo 6, exporta e entrega
Com o gate PASSA e o "pode exportar" do usuário, no Code roda:

```bash
python3 scripts/export_pngs.py --html /home/claude/<nome>/preview.html --output /home/claude/<nome>/slides
```

Saída: `slide_01.png`, `slide_02.png`, … (zero-padding de 2 dígitos). Move pra `/mnt/user-data/outputs/` e apresenta **só as peças LIMPAS** na ordem, sem tabela de gate e sem meta. Pra leigo, fecha em 1 frase: "Pronto, seus 9 slides estão aí, na ordem. É só baixar e postar." A copy-visual já foi gated no Passo 0; texto longo (caption, roteiro) é das skills de conteúdo.

## When NOT to use (manda pra skill certa)
- Pediu a **headline/gancho de TEXTO** (não a arte) → **soft-conteudo-headlines**.
- Pediu o **CORPO de texto longo, caption, roteiro, carta, e-mail** → **soft-conteudo** (e sub-skills).
- Pediu o **Plano / posicionamento / fundação** → **soft-posicionamento**.
- Pediu os **slides operados DENTRO do webinar** (deck do roteiro do webinário) → **soft-webinar**.
- Pediu **anúncios de tráfego do webinar** como sistema → **soft-trafego-meta** (a arte do banner volta pra cá quando precisar renderizar).

## Anti-Patterns (sintoma → correção)
| Sintoma | Correção |
|---|---|
| Exportou sem mostrar preview | Volta: mostra preview, pergunta o ajuste, espera o "pode exportar" |
| Texto claro sobre fundo claro (branco/neon herdado do tema escuro) | Cada pele define as próprias cores; pele clara → `#1a1814` + verde `#147a3c`; re-roda o gate |
| Palavra sozinha na última linha | Aplica `nw()` (Code) ou puxa 1 palavra da linha anterior; nunca deixa órfã |
| Diagrama com linha fina sem marcador | Traço 5–6px + marcador ✕/✓/$ + rótulo; senão ninguém entende em 0,3s |
| 3+ cards seguidos com título+corpo | Quebra o ritmo: afirmação pura, lista/chips (se enumera), prosa ou número dominante |
| Inventou um número "plausível" | Só prova com lastro do banco; sem fonte, placeholder marcado, nunca inventado |
| Render reescreveu a copy às escondidas | Texto desenhado = o que passou no gate; mexeu, re-passa a ancoragem antes de exportar |
| Regenerou o carrossel inteiro por 1 ajuste | Edita só o slide mencionado com `str_replace` |
| Mais de 1 cor de accent / gradiente / sombra / cantos arredondados | Fundo chapado, 1 accent em ≤ 4 palavras, zero sombra, cantos retos |
| Imprimiu a tabela do gate na saída | O gate é INTERNO (auditoria silenciosa); a saída é só a peça limpa |

## References (só pra profundidade, o fluxo acima é autossuficiente)
- `references/processo-design.md`: o pipeline completo do carrossel (detecção de função, famílias, ritmo, geração, export).
- `references/processo-banner.md`: a anatomia do banner, a biblioteca de modelos, o checklist de saída.
- `references/processo-slides.md`: a espinha de tensão do deck, os tipos de slide, o slide de oferta, 16:9.
- `references/perguntas-design.md`: o formato exato das 3 perguntas de design + a Pergunta D (elementos extras).
- `references/identidade-visual-cliente.md`: como ler, aplicar e salvar a marca de CADA cliente (a skill é marca-neutra; cada cliente desenha na ID dele). Cheque ANTES de perguntar cor/fonte.
- `references/familia-editorial-preto.md` · `familia-clinico-branco.md` · `familia-manuscrito-cru.md`: regras autoritativas de cor/tipografia/layout por família. Lê a da família escolhida ANTES de gerar HTML.
- `references/escala-densidade.md` · `tipografia.md` · `tipografia-quebra-linhas.md`: escala de fonte por densidade, tipografia por família (9 combos prontos pra export + a fonte de marca do cliente via `<link>`), phrase ragging + widow control.
- `references/auditoria-pre-preview.md`: as 16 perguntas detalhadas do gate visual (a tabela do Passo 5 é o resumo executável; esta reference traz cada check com exemplo real de render que queimou).
- `references/layouts.md` · `layout-utilitario.md` · `layout-tweet-avatar.md` · `layout-diagrama-manuscrito.md` · `setinha-arraste.md` · `elementos-manuscritos.md` · `deteccao-automatica.md`: repertório de layouts e elementos.
- `scripts/build_carousel.py` (esqueleto de geração + `make_symmetric_slide`), `scripts/export_pngs.py` (export Playwright, chama o craft.py), `scripts/craft.py` (gate de craft em código: `nw()` anti-órfã + `legible()`/`audit` contraste WCAG), `scripts/lint_copy.py` (anti-IA na copy-visual). No Code são cinto extra; no chat, o gate do Passo 5 cobre.
