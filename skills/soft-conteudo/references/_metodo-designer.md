METODO DESIGNER (absorvido de soft-designer)
=============================================

Skill UNICA de design VISUAL do metodo Soft. Entra quando o
pedido e o ARTEFATO VISUAL (o arquivo/PNG/imagem em si), nao o
texto.

FRONTEIRA
---------
- Arte/PNG/capa renderizada (1080x1350, banner, deck) = aqui.
- HEADLINE/capa-TEXTO = formato-headlines.
- CORPO/copy do carrossel = formato-carrossel.

ARTEFATOS SUPORTADOS
--------------------
1. Carrossel PNG (10 slides 1080x1350 pra feed IG).
2. Banner/capa unica (LinkedIn, YouTube capa, blog).
3. Deck HTML animado ao vivo (Reveal.js + GSAP), single-file.
4. Thumbnail de video (YouTube 1280x720, Shorts 1080x1920).
5. Prompt de imagem-IA (gpt-image, DALL-E, Midjourney).

3 FAMILIAS VISUAIS
------------------

CLINICO BRANCO
- Fundo branco, muito respiro (60%+ do quadro).
- Tipografia sober (Inter, Helvetica, IBM Plex Sans).
- Hairlines 1px cinza claro.
- Sem sombras dramaticas.
- Tom autoridade clinica, respeito ao leitor.

EDITORIAL PRETO (ID VISUAL LEO)
- Fundo preto absoluto (#000).
- Accent verde-neon #4ade80 (NUNCA dourado, NUNCA azul).
- Bebas Neue (H1 grande) + Inter (corpo) + JetBrains Mono
  (numero, codigo, destaque).
- Hairlines 1px verde ou branco.
- Cantos retos (border-radius 0).
- Tom editorial autoral (Wall Street Journal preto).

MANUSCRITO CRU
- Fundo off-white (creme).
- Escrita a mao (Kalam, Caveat, Amatic).
- Layout jornal (colunas, hierarquia tipografica antiga).
- Tom intimo, artesanal.

Se peca e do proprio o dono: ID VISUAL LEO obrigatorio (leia
soft-perfil.md secao 6). Se e cliente: puxa a identidade dele
via pergunta ou pecas_prontas.identidade.

BANCO DE LAYOUTS
----------------
- Diagrama (setas, boxes, relacao entre elementos).
- Manuscrito (frase a mao + rabisco).
- Tweet-avatar (post estilo social + foto avatar redonda).
- Utilitario (lista, tabela, checklist).

Cada layout tem regra de: hierarquia, respiro, alinhamento,
peso tipografico.

COPY-VISUAL vs COPY-CONTEUDO
----------------------------
- Copy-conteudo = o que o dono escreveu, texto completo.
- Copy-visual = o que aparece na ARTE, com hierarquia
  (H1 titulo, H2 subtitulo, H3 apoio). Skill destila
  copy-conteudo em copy-visual.

AUDITORIA PRE-PREVIEW
---------------------
Antes de renderizar, verifica:
- Contraste WCAG AA (texto legivel em fundo).
- Hierarquia clara (o olho sabe onde comecar).
- Alinhamento consistente (grid).
- Respiro suficiente (nao vira poster de propaganda).
- Uma tese por peca (nao empilhar 3 ideias no mesmo quadro).

GATE ESPECIFICO
---------------
- Texto SEMPRE por overlay, NUNCA dentro da imagem gerada por
  IA (IA erra letra, quebra credibilidade).
- Uma tese por peca.
- Contraste WCAG AA.
- Identidade do dono (nao do dono, se for cliente).
- Se e ID o dono, respeitar preto + verde-neon + fontes canonicas.

PROMPT DE IMAGEM-IA
-------------------
Se dono pede foto/cena por IA:
- Prompt em ingles curto e especifico.
- Estilo (photorealistic, editorial, cinematic).
- Mood (calm, tense, warm).
- Framing (close-up, wide, medium).
- Lens/luz (natural light, softbox, backlit).
- SEM TEXTO na imagem.
- Texto entra depois como overlay.

Regra memoria feedback-cursor-generateimage-forcar: pra foto 3D
fotorrealista via cursor-agent, prompt comeca com "You MUST use
GenerateImage tool. Do NOT use HTML/CSS/Python/Pillow".

Regra memoria feedback-referencia-visual-e-molde-nao-conteudo:
se dono cola ref visual, ela e MOLDE (estetica/paleta/layout),
NUNCA conteudo (nao copiar textos/precos/numeros da ref).

DECK HTML ANIMADO
-----------------
Reveal.js single-file + GSAP nos beats de virada.
- Cada slide e uma secao <section>.
- Notas do apresentador em <aside class="notes">.
- Animacao GSAP so nos beats de reveal/virada.
- Preto + verde-neon default (ID o dono) ou identidade do cliente.

REFERENCIAS DA SKILL ORIGINAL
-----------------------------
- ~/.claude/skills/soft-designer/references/processo-design.md
- ~/.claude/skills/soft-designer/references/auditoria-pre-preview.md
- ~/.claude/skills/soft-designer/references/carrossel-embalagens.md
- ~/.claude/skills/soft-designer/references/carrossel-feed-arquitetura.md
- ~/.claude/skills/soft-designer/references/carrossel-feed-template.py
- ~/.claude/skills/soft-designer/references/formato-deck-animado.md
- ~/.claude/skills/soft-designer/references/familia-clinico-branco.md
- ~/.claude/skills/soft-designer/references/familia-editorial-preto.md
- ~/.claude/skills/soft-designer/references/familia-manuscrito-cru.md
- ~/.claude/skills/soft-designer/references/layouts.md
- ~/.claude/skills/soft-designer/references/layout-diagrama-manuscrito.md
- ~/.claude/skills/soft-designer/references/layout-tweet-avatar.md
- ~/.claude/skills/soft-designer/references/layout-utilitario.md
- ~/.claude/skills/soft-designer/references/escala-densidade.md
- ~/.claude/skills/soft-designer/references/deteccao-automatica.md
- ~/.claude/skills/soft-designer/references/elementos-manuscritos.md
- ~/.claude/skills/soft-designer/references/identidade-visual-cliente.md
- ~/.claude/skills/soft-designer/references/perguntas-design.md
- ~/.claude/skills/soft-designer/references/processo-banner.md

ENTREGA
-------
- PNG: /tmp/soft-conteudo-<slug>/<nome>.png (path absoluto em
  linha propria pra ponte enviar).
- Deck HTML: /tmp/soft-conteudo-<slug>/<nome>.html single-file.
- Prompt: bloco texto pro dono usar em outra ferramenta.
- Brief: .md com hierarquia + layout + familia se dono vai
  renderizar por fora.
