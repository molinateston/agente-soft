# Formato: Deck HTML animado ao vivo (Reveal.js + GSAP)

> O 5º formato do designer. Os outros 4 (carrossel PNG, banner, deck 16:9 estático, página) entregam **imagem parada**. Este entrega um **deck navegável, animado e hospedado**, que se apresenta AO VIVO controlado pelo teclado: aula, webinário ao vivo, palco, reunião de venda com tela compartilhada. É o mesmo conteúdo que `processo-slides.md` decide (a espinha de tensão, 1 ideia por slide, copy-visual pelo Crivo), mas com um MOTOR de render diferente: single-file HTML com Reveal.js 5.x + GSAP 3.x, fundo de imagem, transições cinematográficas, navegação por seta/espaço/F/ESC. Reference longa; use o Índice.

## Índice
- [1. Quando o deck animado, e quando o PNG estático](#1-quando-o-deck-animado-e-quando-o-png-estatico)
- [2. A fronteira dos 3 ambientes (leia antes de prometer entrega)](#2-a-fronteira-dos-3-ambientes-leia-antes-de-prometer-entrega)
- [3. Pipeline em 6 etapas, na ordem-lei (STOP entre cada uma)](#3-pipeline-em-6-etapas-na-ordem-lei-stop-entre-cada-uma)
- [4. A lei de arquitetura: texto por overlay, NUNCA dentro da imagem](#4-a-lei-de-arquitetura-texto-por-overlay-nunca-dentro-da-imagem)
- [5. Geração da imagem de fundo pelo nosso imagegen](#5-geracao-da-imagem-de-fundo-pelo-nosso-imagegen)
- [6. Biblioteca de componentes CSS (o design system do deck)](#6-biblioteca-de-componentes-css-o-design-system-do-deck)
- [7. O slide-âncora (quebra de ritmo, mapa visual da aula)](#7-o-slide-ancora-quebra-de-ritmo-mapa-visual-da-aula)
- [8. Esqueleto single-file (Reveal + GSAP, na marca do cliente)](#8-esqueleto-single-file-reveal--gsap-na-marca-do-cliente)
- [9. Código GSAP de animação (copiável)](#9-codigo-gsap-de-animacao-copiavel)
- [10. As regras invioláveis de legibilidade ao vivo](#10-as-regras-inviolaveis-de-legibilidade-ao-vivo)
- [11. Deploy em Cloudflare Pages (NUNCA Vercel)](#11-deploy-em-cloudflare-pages-nunca-vercel)
- [12. Gate do deck animado (roda por dentro antes de publicar)](#12-gate-do-deck-animado-roda-por-dentro-antes-de-publicar)
- [13. Exemplo denso (deck de aula, nicho fictício)](#13-exemplo-denso-deck-de-aula-nicho-ficticio)

---

## 1. Quando o deck animado, e quando o PNG estático

O designer tem dois caminhos de deck. A escolha é pela **finalidade de uso**, não pelo gosto:

| Você entrega o deck animado quando | Você fica no PNG estático (`processo-slides.md`) quando |
|---|---|
| O cliente vai **apresentar ao vivo** (aula, webinário ao vivo, palco, call de venda com tela compartilhada) | O cliente vai **postar imagens** (carrossel de feed, slides pra baixar, deck que vira PDF) |
| O ritmo é controlado pela **fala + teclado** (a animação sustenta a fala, revela item a item) | O ritmo é controlado pelo **leitor** que arrasta ou passa página |
| Vale ter **movimento** (fade, zoom lento, cascata de entrada) pra prender a sala | O destino final é imagem parada (Instagram, WhatsApp, impressão) |
| O deck fica **hospedado num link** que o cliente abre em fullscreen | O deck vira arquivo (PNG/PDF) que o cliente anexa ou sobe |

Regra de decisão curta: **se abre num navegador e navega com seta, é deck animado. Se vira imagem que se posta, é PNG estático.** Na dúvida entre os dois, pergunta ao cliente "você vai apresentar isso ao vivo compartilhando a tela, ou vai postar como imagem?" e roteia pela resposta.

A **inteligência de conteúdo é a mesma** dos dois lados: a espinha de tensão do deck, a decisão de 1 ideia por slide, os arquétipos por função APSD e a copy-visual pelo Crivo vêm todos de `processo-slides.md` (e, quando é webinário, o conteúdo já chega decidido por `soft-webinar-slides`). O que muda aqui é só o motor de render: de imagem parada pra HTML animado hospedado.

---

## 2. A fronteira dos 3 ambientes (leia antes de prometer entrega)

O deck animado usa Reveal.js e GSAP carregados por CDN, e o produto final é um site hospedado. Isso cria fronteiras diferentes por ambiente. **Prometa só o que o ambiente entrega:**

- **App / chat (claude.ai, sem Bash):** o artifact do claude.ai **bloqueia CDN externo** (a CSP não deixa carregar Reveal/GSAP de fora). Então aqui você **NÃO renderiza o deck animado no chat**. O que você entrega é o **arquivo `.html` single-file pronto pra hospedar** (como artifact de código ou bloco pra copiar), avisando com clareza: *"este é o deck completo; a animação e a navegação só ligam quando ele estiver hospedado. A publicação num link é o passo do Claude Code."* Você entrega o HTML certo e honesto sobre a fronteira, nunca finge que animou na tela.
- **Claude Code (tem Bash, tem imagegen, tem wrangler):** pipeline completo. Gera as imagens de fundo pelo `imagegen`, monta o `index.html`, testa local, **publica em Cloudflare Pages** e devolve a URL no ar. É o ambiente onde o deck vira link de verdade.
- **Agente / Telegram (tem Bash):** roda o pipeline do Code, mas a entrega é **ARQUIVO** cujo **path completo vai na resposta** (ex: `/home/cloud/decks/aula-1/index.html`) mais a **URL publicada**, e as mensagens saem **sem markdown pesado** (sem tabela, sem bloco de código gigante no chat do Telegram; manda o link e o caminho, o conteúdo mora no arquivo).

---

## 3. Pipeline em 6 etapas, na ordem-lei (STOP entre cada uma)

A ordem existe porque inverter custa retrabalho: imagem gerada antes do roteiro aprovado é imagem jogada fora; HTML codado antes da imagem aprovada é layout refeito. **Pare e peça OK explícito no fim de cada etapa marcada com STOP.**

1. **Roteiro card a card** (vem de `processo-slides.md` / `soft-webinar-slides`). Cada slide: função na espinha, eyebrow, título, corpo/componente, frase de força. Copy-visual já passada pelo Crivo (ancoragem + gate + anti-IA). **STOP:** leva o roteiro em texto ao cliente e espera o OK antes de gerar imagem.
2. **Imagens de fundo** (Etapa 5 desta reference). Uma por slide (ou reaproveita fundos entre slides do mesmo bloco). **STOP:** mostra as imagens e espera o OK antes de codar.
3. **Copy de overlay por slide.** A copy-visual gated entra por cima da imagem, nunca dentro dela. Teto de palavras do deck (título ≤8, corpo ≤20, ver `processo-slides.md`).
4. **Montagem HTML** single-file (Etapa 8) com os componentes CSS (Etapa 6) na marca do cliente + o GSAP (Etapa 9).
5. **Deploy** em Cloudflare Pages (Etapa 11). No app, esta etapa é só a entrega do arquivo com o aviso da fronteira.
6. **Validação pós-deploy** (Etapa 12): abre o link, confere legibilidade ao vivo, navegação, zero flash branco, mobile.

---

## 4. A lei de arquitetura: texto por overlay, NUNCA dentro da imagem

Esta é a regra de engenharia mais importante do formato, e vale pra **qualquer peça imagem-IA nossa** (o branch de imagem-IA do `processo-design.md`, o Infográfico-Lousa da família Manuscrito Cru, a thumbnail de vídeo):

**A imagem gerada é só o FUNDO/cenário. Todo texto (título, bullets, números, CTA) entra por cima via overlay HTML/CSS.** O prompt de geração NUNCA pede palavra escrita dentro da imagem.

Por que é lei, não preferência:
- **Copy editável depois.** Se o texto está dentro da imagem, mudar uma palavra obriga regenerar a imagem inteira (e a nova sai diferente). Texto por overlay se edita com um `str_replace`, sem tocar no fundo.
- **Gate de contraste funciona.** O overlay HTML tem cor de texto controlada contra um gradiente que a gente controla; texto "queimado" na imagem some no fundo e não dá pra consertar.
- **Modelo de imagem erra letra.** Gerador de imagem escreve texto torto, com erro de acento, cortado. O overlay HTML escreve certo, na fonte do cliente, com acentuação PT-BR correta.
- **Anti-órfã e tipografia.** Só o overlay HTML respeita o `nw()`, o phrase ragging e a escala de densidade. Texto na imagem ignora tudo isso.

No prompt de imagem, feche sempre com: **"sem texto, sem palavras escritas, sem legendas, sem logos grandes na imagem; deixe a metade [direita/inferior] escurecida e limpa para receber o texto por cima."**

---

## 5. Geração da imagem de fundo pelo nosso imagegen

O motor default é o **`imagegen` local do Code** (gpt-image-1.5), não um gerador externo. No app, você entrega o **prompt pronto** pro cliente colar no gerador dele.

**Comando no Code (VPS):**
```bash
export OPENAI_API_KEY="$OPENAI_API_KEY"   # já no ambiente do LEON
/home/cloud/.venvs/imagegen/bin/python \
  /home/cloud/.codex/skills/.system/imagegen/scripts/image_gen.py generate \
  --prompt "$(cat prompts/slide-01.txt)" \
  --size 1536x1024 --quality high \
  --out assets/slide-01.png
```
- **Tamanho:** `1536x1024` é o mais próximo de 16:9 que o gpt-image-1.5 entrega (os tamanhos válidos são 1024x1024, 1536x1024, 1024x1536). Não peça 1920x1080 no CLI, ele não existe; gere 1536x1024 e o CSS `background-size: cover` preenche a tela.
- **Imagem de referência** (quando o cliente quer um personagem/rosto consistente entre slides): use o subcomando `edit` do mesmo CLI passando a foto de referência. Serve pra deck com o rosto do dono recorrente.
- **Estilo:** na marca do cliente, não numa paleta fixa. O prompt descreve cenário + iluminação + paleta DO CLIENTE (as cores da ID visual dele, `identidade-visual-cliente.md`), com a metade que vai receber texto escurecida e limpa.

**Molde de prompt (portátil: funciona no imagegen, no gpt-image e no Gemini):**
```
Ilustração premium, iluminação cinematográfica, proporção 16:9.

METADE ESQUERDA: [cenário/elemento visual do tema; se houver personagem, descreva pose e ação]

METADE DIREITA: tela/superfície escurecida, gradiente que vai do transparente ao [cor de fundo escura da marca], espaço limpo preparado para receber texto por cima, SEM nada escrito

PALETA: [cores da marca do cliente, ex: preto #0A0908, accent verde #147a3c]

AMBIENTE: [cenário detalhado, iluminação, atmosfera]

CÂMERA: plano médio, altura dos olhos, profundidade de campo rasa

SEM TEXTO, SEM PALAVRAS ESCRITAS, SEM LEGENDAS, SEM LOGOS GRANDES.
```
O prompt é **neutro por construção**: o cliente cola no gerador dele e funciona; no Code, a gente roda o `imagegen`. Não amarra em nenhum gerador específico.

---

## 6. Biblioteca de componentes CSS (o design system do deck)

Cada slide usa 1 ou mais destes componentes dentro da `.text-zone`. Todos herdam as **cores e fontes do cliente** (variáveis CSS `--accent`, `--bg`, `--text`), nunca uma paleta fixa. Cada `.anim-el` começa com `opacity:0` e o GSAP (Etapa 9) anima a entrada.

| Componente | Classe | Quando usar |
|---|---|---|
| Bullets verticais | `.bullet-list` | 3 a 5 itens curtos (respeita o teto de 3 do deck quando é lista-revelada) |
| Comparativo 3 cards | `.compare-grid` + `.compare-card` | "não é A / não é B / é C" (o mecanismo por contraste) |
| 2 cards lado a lado | `.two-col-grid` + `.col-card` | comparar 2 caminhos ou 2 opções |
| Lista numerada | `.flow-numbered` | passo a passo em ordem |
| Cards numerados em grade | `.action-grid` + `.item` + `.num` | 4 a 6 elementos com hierarquia de número |
| Bloco de exemplo | `.example-block` | destacar um exemplo real (callout com barra de accent) |
| Frase de força | `.force-line` | frase de impacto com barra de accent à esquerda |
| Frase de fecho | `.closing-line` | última linha do slide, destaque em accent |
| Estrutura orbital | `.orbit-box` + `.orbit-center` + `.orbit-layer` + `.chip` | slide-âncora: elemento central + camadas orbitando |

**Como adaptar à marca do cliente (obrigatório):** o esqueleto abaixo define `--accent`, `--accent-deep`, `--bg`, `--text` no `:root`. Todos os componentes leem essas variáveis. Trocar a marca = trocar 4 linhas de `:root`, o resto herda. Nunca deixe cor fixa cravada num componente.

CSS pronto dos componentes (cole no `<style>` do esqueleto, cores vêm das variáveis):
```css
.bullet-list { list-style:none; padding:0; margin:0 0 2rem; }
.bullet-list li { font-size:1.6rem; font-weight:500; line-height:1.45; color:var(--text);
  padding:.55rem 0 .55rem 1.6rem; position:relative; opacity:0; }
.bullet-list li::before { content:''; position:absolute; left:0; top:1.05rem; width:.7rem; height:.7rem;
  background:var(--accent); }   /* quadrado, cantos retos */

.compare-grid { display:grid; grid-template-columns:1fr 1fr 1fr; gap:1rem; margin:0 0 1.5rem; }
.compare-card { border:1px solid var(--accent); background:rgba(0,0,0,.35); padding:1rem; opacity:0; }
.compare-card .tag { font-family:var(--mono); font-size:.8rem; letter-spacing:.2em;
  text-transform:uppercase; color:var(--accent); margin-bottom:.6rem; display:block; }
.compare-card.is .tag { color:var(--accent-deep); }   /* o "é C" ganha o tom de fecho */
.compare-card p { font-size:1.15rem; line-height:1.4; color:var(--text); margin:0; }

.two-col-grid { display:grid; grid-template-columns:1fr 1fr; gap:1.2rem; margin:0 0 1.5rem; }
.col-card { border:1px solid var(--accent); background:rgba(0,0,0,.4); padding:1.2rem; opacity:0; }
.col-card h4 { font-family:var(--head); font-size:1.2rem; color:var(--accent);
  margin:0 0 .8rem; text-transform:uppercase; }

.flow-numbered { list-style:none; padding:0; margin:0 0 1.5rem; counter-reset:step; }
.flow-numbered li { counter-increment:step; padding:.5rem 0 .5rem 2.5rem; position:relative;
  font-size:1.5rem; line-height:1.4; color:var(--text); opacity:0; }
.flow-numbered li::before { content:counter(step); position:absolute; left:0; top:.45rem;
  font-family:var(--mono); font-size:.9rem; font-weight:700; color:var(--accent);
  border:1px solid var(--accent); padding:.2rem .55rem; }

.action-grid { display:grid; grid-template-columns:1fr 1fr; gap:.6rem 1rem; margin:.5rem 0 1.2rem; }
.action-grid .item { display:flex; align-items:flex-start; gap:.7rem; font-size:1.35rem;
  line-height:1.4; opacity:0; color:var(--text); }
.action-grid .num { font-family:var(--mono); font-weight:700; color:var(--accent);
  border:1px solid var(--accent); padding:.15rem .5rem; min-width:1.7rem; text-align:center; }

.example-block { border-left:3px solid var(--accent); padding:.7rem 1rem;
  background:rgba(0,0,0,.25); margin-top:.8rem; font-size:1.35rem; line-height:1.5;
  color:var(--text); opacity:0; }
.example-block .label { font-family:var(--mono); font-size:.75rem; letter-spacing:.2em;
  color:var(--accent); text-transform:uppercase; display:block; margin-bottom:.4rem; }

.force-line { font-family:var(--head); font-size:1.6rem; font-weight:600; color:var(--text);
  line-height:1.4; border-left:3px solid var(--accent); padding-left:1rem; margin-top:1rem; opacity:0; }
.closing-line { font-family:var(--head); font-size:1.9rem; font-weight:700; color:var(--accent);
  margin-top:1rem; opacity:0; }
```

---

## 7. O slide-âncora (quebra de ritmo, mapa visual da aula)

Um slide central (tipicamente o 4º de ~10) **quebra o padrão** e vira um infográfico rico: um elemento central com camadas orbitando (`.orbit-box`), um diagrama de fluxo, ou uma pilha vertical de camadas. Ele prende a atenção porque rompe o ritmo dos slides de texto e funciona como **mapa visual** de toda a aula.

Casa com o que `soft-webinar-slides` já chama de **reveal progressivo / mecanismo em slide próprio**: o slide-âncora é onde o mecanismo nomeado aparece inteiro, como estrutura visual, antes de ser destrinchado nos slides seguintes.

Regra: **1 slide-âncora por deck** (dois viram ruído; o poder está em ser a exceção). Os chips orbitando entram com a cascata de bounce do GSAP (`.chip` + `back.out`).

```css
.orbit-box { margin:.5rem 0 1.5rem; }
.orbit-center { display:inline-block; font-family:var(--head); font-size:1.8rem; font-weight:700;
  color:var(--bg); background:var(--accent); padding:.6rem 1.4rem; opacity:0; margin-bottom:1rem; }
.orbit-layer { margin-top:.7rem; opacity:0; }
.orbit-layer .layer-label { font-family:var(--mono); font-size:.9rem; letter-spacing:.2em;
  color:var(--accent-deep); text-transform:uppercase; margin-bottom:.5rem; display:block; }
.orbit-layer .chips { display:flex; flex-wrap:wrap; gap:.5rem; }
.orbit-layer .chip { font-size:1.15rem; font-weight:600; padding:.4rem .85rem;
  border:1px solid var(--accent); color:var(--text); opacity:0; }
```

---

## 8. Esqueleto single-file (Reveal + GSAP, na marca do cliente)

Um único `index.html`, todo CSS e JS inline, sem build, sem `package.json`. As 4 variáveis do `:root` carregam a marca do cliente; troque essas 4 linhas por cliente e o deck inteiro re-veste. As fontes são as da ID do cliente (via `<link>` da fonte dele, igual `tipografia.md`); o exemplo usa placeholders.

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>NOME DO EVENTO</title>
<meta property="og:image" content="https://SEU-PROJETO.pages.dev/assets/og.png" />

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reveal.js@5.1.0/dist/reset.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reveal.js@5.1.0/dist/reveal.css">
<!-- fontes da marca do cliente aqui (link da fonte dele) -->

<style>
:root {
  /* === MARCA DO CLIENTE: troque estas 4 linhas === */
  --accent: #147a3c;        /* cor de destaque do cliente */
  --accent-deep: #0e5a2c;   /* tom de fecho */
  --bg: #0A0908;            /* fundo (escuro na maioria dos casos ao vivo) */
  --text: #F5F2EC;          /* texto sobre o fundo */
  --head: 'FonteHeadDoCliente', sans-serif;
  --body: 'FonteBodyDoCliente', sans-serif;
  --mono: 'JetBrains Mono', monospace;
}
/* forçar bg em 6 layers = zero flash branco na transição */
html, body { background:var(--bg); color:var(--text); font-family:var(--body); }
.reveal, .reveal-viewport, .reveal .slides, .reveal .slides section, .reveal .backgrounds { background:var(--bg); }
.reveal section { padding:0; height:100vh; width:100vw; }

.slide-bg { position:absolute; inset:0; background-size:cover; background-position:center;
  z-index:0; will-change:transform,opacity; }
.slide-overlay { position:absolute; inset:0; z-index:1;
  background:linear-gradient(90deg, transparent 0%, transparent 45%,
    rgba(0,0,0,.55) 60%, rgba(0,0,0,.82) 100%); }   /* escurece a metade direita pro texto */
.text-zone { position:absolute; top:0; right:0; bottom:0; width:50%;
  padding:4vh 5vw 8vh 3vw; display:flex; flex-direction:column; justify-content:center; z-index:2; }

.eyebrow { font-family:var(--mono); font-size:1.1rem; color:var(--accent);
  letter-spacing:.3em; text-transform:uppercase; margin-bottom:1.2rem; opacity:0; }
.headline { font-family:var(--head); font-weight:700; font-size:4.4rem; line-height:1.05;
  color:var(--text); margin:0 0 1.5rem; opacity:0; }
.subhead { font-size:1.7rem; font-weight:500; color:var(--text); line-height:1.4;
  margin:0 0 2rem; opacity:0; }
/* ... componentes da Etapa 6 entram aqui ... */

.reveal .controls { display:none !important; }
.custom-nav { position:fixed; top:50%; transform:translateY(-50%); width:76px; height:76px;
  border-radius:50%; background:rgba(0,0,0,.45); backdrop-filter:blur(10px);
  border:1px solid var(--accent); color:var(--accent); font-size:28px; display:flex;
  align-items:center; justify-content:center; cursor:pointer; z-index:100; }
.custom-nav.left { left:28px; } .custom-nav.right { right:28px; }

footer.site-footer { position:fixed; bottom:1.2rem; left:2rem; right:2rem; display:flex;
  justify-content:space-between; font-family:var(--mono); font-size:.8rem; letter-spacing:.15em;
  color:rgba(255,255,255,.55); text-transform:uppercase; z-index:50; pointer-events:none; }
footer.site-footer .right { color:var(--accent); font-weight:700; }

@media (max-width:768px) {
  .text-zone { width:100%; padding:4vh 6vw; }
  .slide-overlay { background:linear-gradient(180deg, rgba(0,0,0,.4) 0%,
    rgba(0,0,0,.88) 60%, rgba(0,0,0,.95) 100%); }   /* gradiente vira vertical */
  .custom-nav { display:none; }
  .headline { font-size:2.6rem; }
  .compare-grid, .two-col-grid, .action-grid { grid-template-columns:1fr; }
}
</style>
</head>
<body>
<div class="reveal"><div class="slides">
  <section data-slide="1">
    <div class="slide-bg" style="background-image:url('assets/slide-01.png');"></div>
    <div class="slide-overlay"></div>
    <div class="text-zone">
      <span class="eyebrow anim-el">Aula 1 · Semana 1</span>
      <h1 class="headline anim-el">Título<br/>da abertura</h1>
      <p class="subhead anim-el">Uma linha de contexto da fala.</p>
    </div>
  </section>
  <!-- demais sections, mesmo padrão -->
</div></div>

<button class="custom-nav left" id="navPrev" aria-label="Anterior">‹</button>
<button class="custom-nav right" id="navNext" aria-label="Próximo">›</button>
<footer class="site-footer"><span class="left">Aula 1</span><span class="right" id="counter">01 / 10</span></footer>

<script src="https://cdn.jsdelivr.net/npm/reveal.js@5.1.0/dist/reveal.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"></script>
<script>/* config Reveal + animateSlide da Etapa 9 */</script>
</body>
</html>
```

---

## 9. Código GSAP de animação (copiável)

A config do Reveal desliga os controles default, liga a transição `fade` (zero flash branco), mapeia espaço=avança e F=fullscreen. O `animateSlide` roda a cada troca: fundo entra com fade + zoom lento de 8s, os `.anim-el` entram em cascata, os `.chip` do slide-âncora entram com bounce.

```html
<script>
const deck = new Reveal({
  hash:true, controls:false, progress:true, center:false,
  width:'100%', height:'100%', margin:0, minScale:1, maxScale:1,
  transition:'fade', backgroundTransition:'fade',
  keyboard:{ 32:'next', 70:()=>{ document.fullscreenElement
    ? document.exitFullscreen() : document.documentElement.requestFullscreen(); } }
});
deck.initialize().then(()=>{ animateSlide(deck.getCurrentSlide()); updateCounter(); });
deck.on('slidechanged', e=>{ animateSlide(e.currentSlide); updateCounter(); });
document.getElementById('navPrev').addEventListener('click', ()=>deck.prev());
document.getElementById('navNext').addEventListener('click', ()=>deck.next());

function updateCounter(){
  const i=deck.getIndices(), t=deck.getTotalSlides();
  const el=document.getElementById('counter');
  if(el) el.textContent = `${String(i.h+1).padStart(2,'0')} / ${String(t).padStart(2,'0')}`;
}
function animateSlide(slide){
  if(!slide) return;
  const bg=slide.querySelector('.slide-bg');
  if(bg){
    gsap.fromTo(bg,{opacity:0,scale:1.0},{opacity:1,scale:1.025,duration:8,ease:'power1.out'});
    gsap.fromTo(bg,{opacity:0},{opacity:1,duration:.9,ease:'power2.out'});
  }
  const els=slide.querySelectorAll('.anim-el');
  if(els.length) gsap.fromTo(els,{opacity:0,y:30},
    {opacity:1,y:0,duration:.7,ease:'power2.out',stagger:.13,delay:.25});
  const chips=slide.querySelectorAll('.anim-chip');
  if(chips.length) gsap.fromTo(chips,{opacity:0,x:-20,scale:.92},
    {opacity:1,x:0,scale:1,duration:.45,ease:'back.out(1.4)',stagger:.08,delay:.6});
}
</script>
```
Convenção: ponha `.anim-el` em cada eyebrow, headline, subhead, bullet (`<li>`), card, force-line e closing-line. Ponha `.anim-chip` nos chips do slide-âncora (`.chip`).

---

## 10. As regras invioláveis de legibilidade ao vivo

O deck é lido em TV, projetor ou tela compartilhada, não num monitor a 40cm. A régua de legibilidade é outra:

1. **Texto 2 a 3x maior que o "normal web".** Título 80 a 120px, subtítulo 48 a 72px, bullets/cards 32 a 48px. Em dúvida, aumenta. (No CSS acima, os `rem` já estão calibrados pra isso; não encolha.)
2. **Zero flash branco entre slides.** Forçar `--bg` em 6 layers (`html`, `body`, `.reveal`, `.reveal-viewport`, `.reveal .slides section`, `.reveal .backgrounds`) + `transition:'fade'`. Um flash branco no meio da fala quebra o clima.
3. **Texto só na metade escura.** Quando há imagem com elemento à esquerda, o texto fica na metade direita escurecida pelo gradiente, com margem interna de 5%. Nunca sobre o elemento visual.
4. **Elementos múltiplos em coluna vertical.** 3+ cards/bullets empilham na vertical na metade direita; nunca em linha horizontal espremida.
5. **Setas grandes nas laterais**, glassmorphism com borda de accent, centralizadas na vertical. Controles default do Reveal desligados.
6. **OG image obrigatória.** Sem `og:image`, o link no WhatsApp/Telegram vai sem preview.
7. **Mobile responsivo.** Abaixo de 768px: texto ocupa 100%, gradiente vira vertical, setas somem, grids viram 1 coluna.
8. **Contraste por dentro do gate** (Etapa 12): mesmo com fundo de imagem, cada bloco de texto tem contraste forte contra o gradiente atrás dele.

---

## 11. Deploy em Cloudflare Pages (NUNCA Vercel)

O nosso padrão de hospedagem é **Cloudflare Pages** (`reference_site-deploy`). Não use Vercel: o pipeline Vercel (repo GitHub privado + CNAME proxied=false + deploy por API) não é o nosso stack. A publicação nossa é uma linha de `wrangler`.

**No Claude Code (VPS):**
```bash
cd /home/cloud/decks/<nome-do-deck>              # pasta com index.html + assets/
set -a; source /home/cloud/.openclaw/.env; set +a  # CLOUDFLARE_API_TOKEN + ACCOUNT_ID
npx --yes wrangler@4 pages deploy . \
  --project-name=<nome-do-projeto> --branch=main --commit-dirty=true
```
- O token fica no `/home/cloud/.openclaw/.env` (chaves `CLOUDFLARE_API_TOKEN`, `CLOUDFLARE_ACCOUNT_ID`), nunca hard-coded no HTML.
- A URL sai como `<nome-do-projeto>.pages.dev`. Se o cliente tem domínio próprio, o custom domain se aponta no painel Pages (fora do escopo desta skill; entrega o `.pages.dev` e sinaliza que o domínio é passo do cliente).
- **Reveal/GSAP por CDN funcionam no Pages** (só o artifact do claude.ai é que bloqueia CDN; o Pages serve tudo normalmente).

**No agente/Telegram:** roda o mesmo comando; a resposta traz a **URL no ar** + o **path do `index.html`**, em mensagem sem markdown pesado.

**No app/chat:** esta etapa não roda; você entrega o `.html` e avisa que a publicação é passo do Code.

---

## 12. Gate do deck animado (roda por dentro antes de publicar)

Além do GATE VISUAL geral do Passo 5 do SKILL.md (contraste, anti-órfã, anti-IA na copy-visual, 1 ideia por slide), o deck animado tem checks próprios. Roda por dentro (auditoria silenciosa), nunca imprime a tabela. Um ✗ corrige antes de publicar.

| Check | Passa se | ✓/✗ |
|---|---|---|
| **Texto por overlay** | nenhuma palavra está queimada dentro da imagem de fundo; todo texto é HTML editável por cima | |
| **Legível ao vivo** | título ≥80px, contraste forte contra o gradiente, lê a 2 metros de uma TV | |
| **Zero flash branco** | `--bg` forçado nos 6 layers + `transition:'fade'` configurado | |
| **Navegação completa** | seta ‹ ›, espaço avança, F fullscreen, ESC overview, contador atualiza | |
| **Marca do cliente** | as 4 variáveis do `:root` são a cor/fonte DELE, não uma paleta fixa herdada | |
| **1 slide-âncora só** | no máximo um slide quebra o padrão; o resto segue a espinha | |
| **OG + mobile** | `og:image` presente; abaixo de 768px texto 100%, gradiente vertical, setas somem | |
| **Copy pelo Crivo** | a copy-visual de cada slide passou ancoragem + gate + anti-IA (Passo 0) antes de virar overlay | |
| **VEREDITO** | **= o pior item.** Um ✗ corrige e re-roda. Só tudo-✓ publica | |

---

## 13. Exemplo denso (deck de aula, nicho fictício)

**Exemplo ilustrativo, nicho fictício; modela a qualidade, nunca copia.** Cliente: consultora de gestão de estoque pra pequeno varejo. Marca dela: fundo grafite `#141414`, accent âmbar `#e0a020`, head em sans pesada, body em Inter. Aula ao vivo de abertura de um programa, 8 slides, apresentada no Zoom com tela compartilhada.

Roteiro card a card (Etapa 1, já com copy pelo Crivo):
- **Slide 1 · Abertura** (`.eyebrow` + `.headline` + `.subhead`). Eyebrow: `Aula 1 · Semana 1 de 4`. Headline: `A loja lucra, o caixa não sobra`. Subhead: `Por que a conta fecha no papel e some no fim do mês`. Fundo: prateleira de varejo desfocada à esquerda, metade direita escurecida em âmbar-para-grafite.
- **Slide 2 · Diagnóstico** (`.bullet-list`, 3 itens). Título `Onde o dinheiro some sem você ver` + 3 bullets: `estoque parado que virou dívida na prateleira`, `compra no susto quando falta o item que vende`, `desconto pra girar o que nunca devia ter entrado`. Cada bullet é uma dor real do avatar, ancorada em verbatim, não um rótulo.
- **Slide 3 · Ruptura** (`.force-line`, frase única). `Seu problema não é vender mais. É comprar melhor.` Muito espaço vazio, a frase respira, quebra o ritmo depois da lista do slide 2.
- **Slide 4 · Slide-âncora** (`.orbit-box`). Centro: `Giro Consciente` (o mecanismo nomeado). Layer 1 (o que entra): chips `Curva ABC`, `Ponto de recompra`, `Prazo do fornecedor`. Layer 2 (o que sai): chips `Caixa que sobra`, `Prateleira que gira`, `Compra sem susto`. É o mapa visual da aula inteira; os chips entram com bounce.
- **Slide 5-7 · Os 3 passos** (`.flow-numbered` num, `.action-grid` noutro, `.example-block` no terceiro), um passo do mecanismo por slide.
- **Slide 8 · Próximo passo** (`.bullet-list` de deveres + `.closing-line`). Closing em âmbar: `Semana que vem: a curva ABC da sua loja, ao vivo.`

Etapa 2 (imagem): 5 fundos gerados pelo `imagegen` (slides 1, 2, 3, 5, 8 reaproveitam 3 fundos; o slide-âncora 4 é fullscreen sem 50/50; os 6 e 7 herdam o fundo do 5). Prompt sempre fechando com "sem texto, metade direita escurecida e limpa".

Etapa 3-4: copy de overlay entra por cima, `:root` recebe `--accent:#e0a020; --bg:#141414`, componentes da Etapa 6 renderizam na marca dela.

Etapa 5 (deploy no Code): `wrangler pages deploy` → `giro-consciente-aula1.pages.dev`. No app teria parado no `.html` entregue, avisando que a publicação é passo do Code.

Fecho pro cliente (1 frase, sem jargão): "Pronto, sua aula está no ar neste link, é só abrir em tela cheia e apresentar; as setas do teclado passam os slides."
