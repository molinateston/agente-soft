# Render e Deploy, do .md de copy à página no ar

A skill inteira acima **escreve a copy** e a entrega como um `.md` bloco a bloco. Este arquivo é a **camada seguinte, opcional**: transformar aquela copy aprovada em uma **página HTML de arquivo único**, no **tema do cliente**, e publicá-la em **Cloudflare Pages**, devolvendo o link no ar.

É consequência, não substituição. O `.md` de copy continua sendo a entrega principal (Output Contract da skill). O render só entra quando o cliente pede a página pronta, e SÓ depois de a copy passar no gate.

> **Regra-mãe da camada:** o render veste a copy no **tema-marca do CLIENTE da vez** (lido do perfil dele), nunca num tema fixo de terceiro nem na identidade pessoal do dono da skill. A skill é marca-neutra: ela renderiza tokens, não impõe cor. Quem escolhe a paleta é o perfil do cliente (`soft-perfil.md`, §Identidade Visual), igual a `soft-designer` faz. Sem perfil de marca, PERGUNTA a paleta e as 3 fontes antes de renderizar; não chuta uma identidade.

---

## Índice

- Passo R0 · quando renderizar (e quando NÃO)
- Passo R1 · escolher o TEMA pela marca do cliente (mapa dos arquétipos)
- A regra do tema que inverte pela fase do funil
- Passo R2 · o `base.css` único (design system em tokens)
- Passo R3 · montar o HTML de arquivo único (esqueleto + componentes)
- Componentes de render prontos (accordion nativo, player VSL, reveal-on-scroll)
- Passo R4 · publicar em Cloudflare Pages (runbook, NUNCA Vercel)
- Passo R5 · validar no ar
- Os 3 ambientes (app/chat · Claude Code · agente/Telegram)
- Anti-patterns de design (o que dá cara de IA)
- Exemplo denso inline (squeeze renderizado ponta a ponta)
- Checklist de entrega da camada render

---

## Passo R0 · quando renderizar (e quando NÃO)

Depois que a copy da página passou no gate e o cliente aprovou o `.md`, pergunta uma vez: **"quer essa página no ar, ou só a copy?"**. Só renderiza com OK explícito.

RENDERIZA quando:
- O cliente pediu a página pronta / no ar / com link.
- A página é de arquivo único e estática (captura, isca, obrigado, replay, pricing, OTO, link-in-bio, venda no texto, aplicação). Todas cabem em HTML estático.

NÃO renderiza (entrega só o `.md`, ou manda pra skill certa) quando:
- A copy ainda não passou no gate. Render de copy ruim é página ruim mais rápido.
- Falta o **destino do CTA** real (checkout, WhatsApp, formulário). Sem destino não sobe pra produção; usa o botão pendente (abaixo) e avisa.
- Falta a **prova real** (número/case/depoimento). Não renderiza prova fabricada; marca `[A CONFIRMAR]` e não sobe até confirmar.
- É página com back-end de verdade (área de membros, login, carrinho). Fora do escopo desta camada, que é estática.

**STOP R0.** Copy aprovada + destino do CTA + prova real + OK pra subir. Faltou um, resolve antes. Não pula pro HTML.

---

## Passo R1 · escolher o TEMA pela marca do cliente (mapa dos arquétipos)

O tema NÃO é escolhido no olho nem "porque fica bonito". Nasce da **identidade visual do cliente** (perfil dele). O que existe é um punhado de **arquétipos de tema marca-neutros**, cada um só um jeito de setar os tokens do `base.css`. O cliente escolhe UM (ou o perfil já define), e todo o resto sai igual.

Os arquétipos abaixo cobrem o espectro. NENHUM é o padrão: o padrão é o que o perfil do cliente disser. São só famílias pra conversar com o cliente ("teu visual puxa mais pra qual?") e pra saber quais tokens mexer.

| Arquétipo de tema | Feel em 1 frase | Fundo · acento · tipografia (tokens a setar) | Encaixa em |
|---|---|---|---|
| **Editorial claro** | Papel/revista, leve, convidativo, texto navy | fundo claro quente · 1 acento único · display sem-serifa + mono nas labels | topo de funil, captura, VSL, conteúdo longo, marca sóbria |
| **Editorial escuro** | Mesmo editorial invertido, foco e gravidade | fundo quase-preto · 1 acento único · mesma tipografia | pós-compra, autoridade, high-ticket, quem já é dark-brand |
| **Técnico/terminal** | Autoridade dev, monospace, alto contraste | preto · 1 neon único · display mono | produto de IA/dev/automação, público técnico |
| **Minimalista** | Whitespace, tipografia protagonista, zero distração | off-white · 1 acento discreto · sem-serifa | B2B, consultoria, marca pessoal sóbria |
| **Cinematográfico** | Foto full-bleed, título grande sobre imagem | preto · 1 acento vibrante · display forte | lançamento emocional, evento, quem tem material visual forte |
| **Impresso/magazine** | Capa de revista, manchete gigante, sub editorial | 1 foto dominante · acento · display serifado só no título | manifesto, artigo longo, história de marca |

O que **não** se importa: a paleta pronta de um tema de qualquer outra casa como se fosse a nossa. Aquela cor é a marca de quem a criou. Nós temos arquétipos e um `base.css` em tokens; a **cor** vem sempre do cliente da vez.

Declara em 1 linha, sem meta-narração: *"Tema: Editorial claro no acento [cor do perfil] · pós-compra inverte pra escuro."* Se o perfil não tem identidade visual, PERGUNTA (paleta + 3 papéis de fonte) antes de seguir.

### A regra do tema que inverte pela fase do funil

Uma assinatura forte e barata: **antes da compra = tema base; depois da compra = tema invertido**. Mesma marca, mesmos tokens, só o fundo e o texto trocam de papel (o fundo claro vira escuro, o texto escuro vira claro; o acento fica igual). A troca sinaliza pro lead "mudou a fase" sem ele registrar que é a mesma identidade.

| Fase do funil | Tema | Por quê |
|---|---|---|
| Captura / opt-in | base | primeiro contato, leve e convidativo |
| VSL / carta / venda no texto | base | tom de conteúdo, não de promoção agressiva |
| Página de isca / entrega | base | ainda topo, sem peso |
| Aplicação / qualificação | base | leitura longa de decisão |
| Obrigado / avanço (pós-compra) | invertido | marca a virada, muda o cenário |
| OTO / upsell / downsell | invertido | mesmo momento pós-compra, foco e urgência |
| Replay pós-evento | invertido | fecha o ciclo no mesmo ambiente |

No `base.css` a inversão é uma classe no `<body>` (ex.: `class="theme-invert"`). Uma página inteira é base OU invertida, nunca as duas no meio. Painéis que já eram escuros no tema base (CTA final, coluna de preço, player) permanecem escuros no invertido; o `base.css` já força isso, não se mexe à mão.

---

## Passo R2 · o `base.css` único (design system em tokens)

Um só arquivo de CSS, compartilhado por todas as páginas do funil daquele cliente, com **toda a identidade em CSS vars no `:root`**. Montar página nova é linkar o `base.css` e usar as classes; nunca inventar cor solta, sempre a var.

**Por que um `base.css` único, e não CSS por página:** o funil tem várias páginas (captura, obrigado, upsell, replay). Um arquivo de tokens garante que todas batem 100% na marca e que ajustar a identidade é mexer em um lugar. Regra dura: **não editar o `base.css` compartilhado por causa de uma página só** (quebra as outras); variação pontual vai num `<style>` escopado no `<head>` daquela página.

Estrutura mínima de tokens que todo `base.css` de cliente tem (os valores saem do perfil do cliente; abaixo estão os **papéis**, não cores fixas):

```css
:root{
  /* superfícies */
  --paper:      /* fundo principal */;
  --paper-warm: /* fundo alternado de seção */;
  --surface:    /* fundo de cards e inputs, 1 tom acima do fundo */;
  /* texto */
  --ink:      /* texto principal */;
  --ink-soft: /* texto secundário */;
  --ink-mute: /* apoio / muted */;
  --ink-faint:/* labels fracas, captions */;
  /* acento único da marca (do perfil) */
  --accent:      /* CTA, links, bordas de destaque, números */;
  --accent-soft: /* hover do acento */;
  --danger:      /* × / "não é pra você" / negativo */;
  /* linhas */
  --line:      /* bordas */;
  --line-soft: /* bordas fracas */;
  /* tipografia, 3 papéis fixos (do perfil) */
  --font-display: /* títulos + botões + labels */;
  --font-body:    /* parágrafos, inputs */;
  --font-mono:    /* labels, chips, captions, contador */;
  --container: 1200px; /* 1360px em layout mais largo */
}
/* inversão de fase: mesma marca, fundo e texto trocam de papel */
body.theme-invert{
  --paper:  /* era o texto */;
  --ink:    /* era o fundo */;
  --line:   /* bordas claras pra aparecer no escuro */;
  /* acento/danger ficam iguais */
}
```

Escala tipográfica e ritmo (regra de legibilidade, vale em qualquer tema, calibrada com o `filtro-mobile-first`):
- H1 hero grande de verdade (`clamp` que sobe até 46-72px conforme o arquétipo). Título é pra ler em celular e em projetor, nunca miúdo.
- Corpo 16-18px, line-height 1.55-1.7, largura de leitura confortável (`max-width` ~54-64ch).
- Bullets e cards 2 a 3x maiores que o "normal" de um site genérico; em dúvida, aumenta.
- `section` com respiro vertical generoso (80px no mobile, ~120-130px no desktop).
- Container central com padding lateral que encolhe no mobile (64 → 44 → 32 → 24).
- Raios quase retos (a forma vem do perfil; alguns clientes usam pílula só no CTA, outros radius 2-4px). Sombras suaves e longas, nunca duras; nunca `border-radius` arredondado + borda-esquerda colorida genérica (cara de template de IA).

O `base.css` já traz **hardening anti-overflow horizontal**: `overflow-x:clip` no html/body/wrap, `max-width:100%` em img/video/svg/iframe, `min-width:0` nos filhos de grid/flex, e `overflow-wrap:anywhere` em números e títulos grandes. Isso resolve a causa-raiz do scroll lateral no mobile sem matar sticky/position. Não se mexe nisso ao montar página.

---

## Passo R3 · montar o HTML de arquivo único (esqueleto + componentes)

Uma página = um `index.html` com o `<head>` (fontes + `base.css`) e o corpo empilhando componentes. Só troca o texto; não recria CSS. Cor sempre via var. Variação pontual em `style="…"` inline curto, não classe nova.

Esqueleto:

```html
<!doctype html>
<html lang="pt-BR"><head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>…</title>
<meta name="description" content="…">
<!-- OG obrigatória em página comercial (senão o link no WhatsApp perde preview) -->
<meta property="og:title" content="…">
<meta property="og:description" content="…">
<meta property="og:image" content="/og.jpg">
<!-- fontes do perfil do cliente (3 papéis) + base.css, nesta ordem -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="[URL Google Fonts das 3 famílias do perfil]" rel="stylesheet">
<link rel="stylesheet" href="/base.css">
</head>
<body>            <!-- pós-compra: <body class="theme-invert"> -->
<div class="wrap">
  <main id="top">
    <!-- seções empilhadas: hero → prova → método → oferta → CTA final → footer -->
  </main>
</div>
<!-- só os scripts que a página usa: reveal-on-scroll, player VSL (abaixo) -->
</body></html>
```

Regras do `<head>`: fontes ANTES do `base.css`, senão o layout carrega sem tipografia. OG e pixel obrigatórios em página comercial (o pixel do cliente, não o do dono da skill). Sem `package.json`, sem framework, sem build; Cloudflare Pages serve estático direto.

### Componentes de render prontos

Padrões técnicos corretos e sem marca (só herdam os tokens do tema). Copiar, trocar texto.

**Accordion nativo `<details>`/`<summary>` (abre sem JS, acessível).** Usado em página de aula/FAQ longo. Toggle de 1 clique, chevron que gira via CSS, zero dependência:

```html
<details class="acc">
  <summary>
    <span class="acchev" aria-hidden="true">▾</span>
    <div class="achead">
      <div class="stag">Etapa 1</div>
      <h3>Título da etapa</h3>
    </div>
    <p class="acteaser">Uma frase de teaser, visível só com a caixa fechada.</p>
  </summary>
  <div class="acbody">
    <!-- conteúdo da etapa -->
  </div>
</details>
```

O `.acbody` fica escondido quando fechado e aparece no `[open]` por CSS nativo; sem JS ele ainda funciona (só não anima). NUNCA construir accordion com JS de mostrar/esconder quando `<details>` resolve.

**Player de VSL vertical, autoplay mudo + botão "ativar som".** O vídeo começa mudo sozinho (política de autoplay dos navegadores) e o clique liga o som e reinicia do zero:

```html
<div class="vstage" id="vstage">
  <span class="vlive"><span class="pulse"></span> AO VIVO</span>
  <video id="vsl" playsinline muted autoplay preload="auto" poster="/poster.jpg" src="URL.mp4"></video>
  <button type="button" class="vsound" id="vsl-sound" aria-label="Ativar o som do vídeo">
    <span class="vs-ico">🔊</span>
    <span class="vs-txt">Toque para ativar o som</span>
    <span class="vs-sub">O vídeo já começou · clique para ouvir</span>
  </button>
</div>
<script>
(function(){
  var stage=document.getElementById('vstage'),
      video=document.getElementById('vsl'),
      btn=document.getElementById('vsl-sound');
  if(!video) return;
  function kick(){ video.muted=true; var p=video.play(); if(p&&p.catch) p.catch(function(){}); }
  if(video.readyState>=2){ kick(); } else { video.addEventListener('loadeddata',kick,{once:true}); }
  document.addEventListener('DOMContentLoaded',kick,{once:true});
  function enableSound(e){
    if(e){ e.preventDefault(); }
    try{ video.currentTime=0; }catch(_){}
    video.muted=false; video.volume=1.0;
    var p=video.play(); if(p&&p.catch) p.catch(function(){});
    if(stage){ stage.classList.add('is-unmuted'); }
  }
  if(btn){ btn.addEventListener('click',enableSound); }
  video.addEventListener('click',function(){ enableSound(); });
})();
</script>
```

**Reveal-on-scroll (fade + slide up).** Marca `.reveal` nos blocos que animam ao entrar na tela e cola o script no fim do `<body>`:

```html
<script>
(function(){
  var io=new IntersectionObserver(function(es){
    es.forEach(function(e){ if(e.isIntersecting) e.target.classList.add('in'); });
  },{threshold:.12});
  document.querySelectorAll('.reveal').forEach(function(el){ io.observe(el); });
})();
</script>
```

O `base.css` deve deixar `.reveal` visível por padrão e só esconder quando há JS (classe `js` no `<html>`), pra quem tem JS desligado não ver página em branco. `prefers-reduced-motion` desliga a animação.

**Botão de checkout pendente.** Enquanto não há link de pagamento, o botão fica inerte com aviso, nunca aponta pra `#` mudo:

```html
<a class="btn btn-checkout" data-checkout="pendente" onclick="return false;">Quero começar →</a>
<span class="checkout-soon">Checkout em breve</span>
```

Troca pelo link real (Cakto/checkout) antes de subir pra produção de verdade.

---

## Passo R4 · publicar em Cloudflare Pages (runbook, NUNCA Vercel)

O deploy é **Cloudflare Pages via wrangler**. Não usamos Vercel: o token, a conta e todas as páginas do ecossistema já vivem em Cloudflare. As credenciais estão no `.env` principal (`/home/cloud/.openclaw/.env`: `CLOUDFLARE_API_TOKEN`, `CLOUDFLARE_ACCOUNT_ID`).

Estrutura mínima da pasta da página:

```
pasta-da-landing/
├── index.html      (arquivo único, todo o corpo)
├── base.css        (design system em tokens do cliente)
├── og.jpg          (1200x630, preview de link)
└── favicon.ico     (opcional)
```

Sem `package.json`, sem `wrangler.toml` obrigatório, sem build. Cloudflare Pages serve estático direto.

Comando de deploy (produção):

```bash
set -a; source /home/cloud/.openclaw/.env; set +a   # carrega CLOUDFLARE_API_TOKEN + ACCOUNT_ID
cd /caminho/da/pasta-da-landing
npx --yes wrangler@latest pages deploy . \
  --project-name=NOME-DO-PROJETO \
  --branch=main \
  --commit-message="publica landing X" \
  --commit-dirty=true
```

Notas do runbook (economizam o debug):
- `--project-name` é o projeto Pages. Primeira vez, o wrangler cria; depois, republica no mesmo (mesma URL `NOME.pages.dev`). Um projeto por página/funil.
- O deploy devolve a **URL no ar** (`https://NOME.pages.dev` e a de preview do branch). É essa URL que volta pro cliente.
- Domínio próprio (`sub.dominio.com.br`) se liga depois no painel/Custom Domains do projeto Pages; o `.pages.dev` já funciona de imediato.
- Cloudflare Pages emite o SSL sozinho; não há passo de "proxied=false" nem de deploy manual forçado (isso era coisa do fluxo Vercel, que a gente não usa).
- Não versiona `.env`. As chaves ficam só no `.env` principal.

---

## Passo R5 · validar no ar

Depois de subir, confere antes de declarar pronto:

```bash
curl -I https://NOME.pages.dev/        # espera HTTP/2 200, content-type text/html
```

Checagem visual (screenshot ou abrir): fontes carregando (não caiu em fonte de sistema), acento da marca nos CTAs, `.reveal` aparecendo ao rolar, no tema invertido os painéis de destaque não ficaram claros, mobile sem scroll lateral, OG com preview (testa colando o link no WhatsApp). Se o `curl` der 404 ou 3xx em loop, a pasta ou o `--project-name` estão errados; ajusta e re-deploya.

---

## Os 3 ambientes (o render muda de forma conforme onde a skill roda)

A **copy** é igual nos três; muda o que a camada render **entrega**.

- **App / chat (claude.ai, sem Bash):** não há como deployar. A entrega é o **HTML de arquivo único pronto** (com o `base.css` inline no `<style>` do `<head>`, pra ser um arquivo só que o cliente baixa e sobe onde quiser), como artifact/código. Diz numa linha: "aqui está a página em HTML; pra publicar, é só subir num Cloudflare Pages (ou pedir pro seu Claude Code fazer o deploy)". Não promete link no ar.
- **Claude Code (tem Bash, pipeline completo):** roda tudo. Cria a pasta, escreve `index.html` + `base.css`, deploya via wrangler (Passo R4), valida com `curl` (Passo R5) e **devolve o link no ar** mais o caminho local dos arquivos.
- **Agente / Telegram (LEON, tem Bash):** mesmo pipeline do Claude Code. A entrega é o **ARQUIVO** (o `index.html` gerado, caminho completo na resposta) + o **link no ar** depois do deploy. Mensagem sem markdown pesado (sem tabela gigante, sem bloco de código longo no corpo do Telegram): manda o link e o path, o conteúdo denso fica no arquivo.

Em todos: a copy sai no `.md` (Output Contract da skill); o render é a etapa a mais que veste e publica.

---

## Anti-patterns de design (o que dá cara de IA na página)

Reforço visual do filtro anti-IA (que é textual). Estes tornam a página "feita por template genérico":

| Sintoma visual | Correção |
|---|---|
| Inventou paleta nova (roxo, gradiente arco-íris, azul-tech aleatório) | Usa só as vars do `base.css`, que vêm do perfil do cliente. O acento é UM, definido pela marca |
| Trocou as fontes no meio / usou fonte de sistema solta | As 3 famílias do perfil (display, corpo, mono), carregadas no `<head>`. Serifa só em detalhe, nunca em corpo de parágrafo |
| Serifa em parágrafo ou mono em texto corrido | Mono é só label/chip/caption; corpo é sempre a fonte de corpo |
| `border-radius` arredondado + borda-esquerda colorida genérica | Padrão de template de IA. Segue a forma do perfil (radius quase reto, callout com border-left fino e fundo, sem o combo genérico) |
| Card com sombra dura/preta | Sombra longa e suave, ou nenhuma; a estrutura vem da hairline de 1px, não do drop-shadow pesado |
| Emoji fora da marca espalhado como decoração | Emoji só onde a marca usa; a hierarquia é tipográfica |
| Recriou um componente que já existe no `base.css` | Usa a classe e troca o texto. Card, accordion, oferta, footer já estão prontos |
| Editou o `base.css` compartilhado por causa de uma página | Variação pontual vai num `<style>` escopado no `<head>` da página; o `base.css` é de todas |
| Trocou o tema no meio da mesma página | Uma página é base OU invertida (classe no `<body>`), nunca as duas |
| Título hero pequeno / bullets do tamanho de um site comum | Título grande de verdade, bullets 2-3x maiores; é pra ler em celular e projetor |
| Travessão em-dash "—" em qualquer texto da página | Regra de copy da casa: vírgula, ponto ou quebra de linha. Zero em-dash |

---

## Exemplo denso inline (squeeze renderizado ponta a ponta)

Nicho fictício (costureira de alta-costura), marca-neutra, só pra ilustrar a FORMA do render. O conteúdo real nasce do verbatim do cliente da vez; a paleta real vem do perfil dele. Aqui o `base.css` está inline no `<style>` pra o exemplo ser um arquivo só e legível.

Suponha o tema base "Editorial claro", acento fictício `#c0603a`, fontes fictícias (display "Inter Tight", corpo "Inter", mono "JetBrains Mono").

```html
<!doctype html>
<html lang="pt-BR"><head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>O molde que faz o vestido cair perfeito</title>
<meta name="description" content="Receba o gabarito de medidas que uso há 9 anos, no seu WhatsApp.">
<meta property="og:title" content="O molde que faz o vestido cair perfeito">
<meta property="og:image" content="/og.jpg">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter+Tight:wght@600;800&family=Inter:wght@400;500&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
  :root{
    --paper:#f4ede0; --surface:#faf5ea; --ink:#1a1712; --ink-mute:#5a5348; --ink-faint:#8b8474;
    --accent:#c0603a; --accent-soft:#d3764f; --line:rgba(26,23,18,.14);
    --font-display:"Inter Tight",system-ui,sans-serif; --font-body:"Inter",system-ui,sans-serif;
    --font-mono:"JetBrains Mono",ui-monospace,monospace; --container:1100px;
  }
  *{box-sizing:border-box;} html,body{overflow-x:clip;max-width:100%;}
  body{margin:0;background:var(--paper);color:var(--ink);font-family:var(--font-body);font-size:17px;line-height:1.6;}
  .container{max-width:var(--container);margin-inline:auto;padding-inline:24px;}
  section{padding-block:64px;}
  h1{font-family:var(--font-display);font-weight:800;line-height:1.05;letter-spacing:-.02em;font-size:clamp(30px,5vw,46px);margin:0 0 18px;overflow-wrap:anywhere;}
  .eyebrow{font-family:var(--font-mono);font-size:11px;letter-spacing:.2em;text-transform:uppercase;color:var(--accent);display:block;margin-bottom:16px;}
  .lead{color:var(--ink-mute);font-size:18px;max-width:54ch;margin:0 0 28px;}
  .card{background:var(--surface);border:1px solid var(--line);border-radius:4px;padding:28px 24px;max-width:520px;box-shadow:0 30px 60px -30px rgba(26,23,18,.15);}
  label{display:block;font-family:var(--font-mono);font-size:12px;text-transform:uppercase;letter-spacing:.06em;color:var(--ink-mute);margin-bottom:7px;}
  input{width:100%;max-width:100%;padding:14px;border:1px solid var(--line);border-radius:4px;background:var(--paper);font-family:var(--font-body);font-size:16px;color:var(--ink);}
  input:focus{outline:none;border-color:var(--accent);}
  .btn{display:block;width:100%;text-align:center;margin-top:16px;background:var(--accent);color:#fff;font-family:var(--font-display);font-weight:800;font-size:16px;padding:15px;border:0;border-radius:4px;cursor:pointer;}
  .btn:hover{background:var(--accent-soft);}
  .note{font-family:var(--font-mono);font-size:12px;color:var(--ink-faint);text-align:center;margin-top:12px;}
  ul.gains{list-style:none;padding:0;margin:32px 0;max-width:560px;}
  ul.gains li{display:flex;gap:12px;padding:10px 0;border-bottom:1px solid var(--line);}
  ul.gains li b{color:var(--accent);font-family:var(--font-mono);}
  .proof{font-family:var(--font-mono);font-size:13px;color:var(--ink-mute);letter-spacing:.02em;}
</style>
</head>
<body>
<div class="wrap">
<section>
  <div class="container">
    <span class="eyebrow">Gabarito de medidas · alta-costura</span>
    <h1>O molde que faz vestido de festa cair perfeito sem 3 provas.</h1>
    <p class="lead">Receba o gabarito de medidas que uso há 9 anos, direto no seu WhatsApp.</p>
    <div class="card">
      <form onsubmit="return false;">
        <label for="wpp">Seu melhor WhatsApp</label>
        <input id="wpp" name="wpp" type="tel" required placeholder="(11) 90000-0000">
        <button class="btn" type="submit">Quero o molde</button>
        <p class="note">É grátis. Chega no seu WhatsApp em 1 minuto.</p>
      </form>
    </div>
    <ul class="gains">
      <li><b>+</b> O gabarito em PDF, medida por medida.</li>
      <li><b>+</b> A tabela de ajuste por tipo de corpo.</li>
      <li><b>+</b> O áudio de 4 minutos com os 3 erros de medida que estragam o caimento.</li>
    </ul>
    <p class="proof">1.200 costureiras já usam esse gabarito no ateliê.</p>
  </div>
</section>
</div>
</body></html>
```

Note: um acento só, hairline de 1px como estrutura, radius quase reto, título grande, mono nas labels, mobile-first com `overflow-x:clip`, botão com destino declarado, prova real embaixo (número), zero em-dash. É a copy do squeeze (que já passou no gate) vestida no tema, pronta pra `wrangler pages deploy`.

---

## Checklist de entrega da camada render

Antes de declarar a página pronta (Claude Code / agente):

- [ ] Copy passou no gate ANTES de renderizar.
- [ ] Tema escolhido pela marca do cliente (perfil), não no olho nem de terceiro.
- [ ] `base.css` em tokens; cor sempre via var; nenhuma paleta inventada.
- [ ] 3 fontes do perfil carregadas no `<head>` antes do `base.css`.
- [ ] Fase pós-compra usa `body.theme-invert` (se aplica).
- [ ] Componentes reusados do `base.css`, nada recriado; accordion nativo, não JS.
- [ ] OG image + pixel do cliente presentes em página comercial.
- [ ] CTA com destino real; se pendente, botão inerte + aviso, e NÃO subiu como final.
- [ ] Mobile sem scroll lateral; título grande; bullets grandes.
- [ ] Zero em-dash, zero família "travar" em qualquer texto renderizado.
- [ ] Deploy por `wrangler pages deploy` (Cloudflare Pages), nunca Vercel.
- [ ] `curl -I` deu 200; link no ar devolvido; caminho local dos arquivos na resposta (agente/Code).
