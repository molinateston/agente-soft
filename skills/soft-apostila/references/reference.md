# Método: Criação de Apostila a partir de Transcrição

## Índice

- [Resumo executivo](#resumo-executivo)
- [Quando usar](#quando-usar)
- [O que entrega](#o-que-entrega)
- [Pipeline (7 etapas)](#pipeline-7-etapas)
- [Pré-requisitos](#pré-requisitos)
- [Passo a passo](#passo-a-passo)
- [Boas práticas](#boas-práticas)
- [Variações](#variações)
- [Erros comuns](#erros-comuns)
- [Resumo](#resumo)

---


## Resumo executivo

Pipeline para transformar uma aula gravada (Zoom, YouTube, lives) em uma apostila navegável em HTML estático, dark theme, com sidebar de capítulos, navegação por teclado e anchors. Baseado em transcrição automática (Whisper) + pós-processamento estrutural com Claude.

---

## Quando usar

- Você dá aulas, mentorias, lives, e quer transformar cada uma em material de estudo.
- Precisa entregar apostila pra alunos da comunidade.
- Quer um material indexável (sidebar, busca, anchors) e não um PDF travado.
- Não quer pagar plataforma EAD pra hospedar o conteúdo.

---

## O que entrega

- Site HTML estático single-file (sem build, sem framework).
- Sidebar fixa esquerda com índice clicável.
- Área de leitura central com tipografia confortável (Inter ou similar).
- Navegação: setas teclado, scroll spy, botões "Anterior / Próximo".
- Dark theme (terminal/matrix), responsivo, drawer mobile.
- Cada capítulo com âncora própria (`#capitulo-1`, `#capitulo-2`, ...).
- Pronto pra publicar em Cloudflare Pages (padrão Soft) ou qualquer host estático.

---

## Pipeline (7 etapas)

```
[Vídeo MP4]
   │
   ▼
[1] Whisper → transcript.txt (cru, sem capítulos)
   │
   ▼
[2] Limpeza: remover muletas (ahn, hum, então...) com regex e modelo
   │
   ▼
[3] Segmentação em capítulos (Claude detecta mudança de tópico)
   │
   ▼
[4] Enriquecimento: cada capítulo recebe título, intro, conclusão, exemplos
   │
   ▼
[5] Render Markdown estruturado (apostila.md)
   │
   ▼
[6] Build HTML single-file (template + injeção de markdown rendered)
   │
   ▼
[7] Deploy Cloudflare Pages / domínio customizado
```

---

## Pré-requisitos

| Item | Versão | Instalação |
|---|---|---|
| Python 3.10+ | runtime | `apt install python3` |
| ffmpeg | extrair áudio | `apt install ffmpeg` |
| Whisper | transcrição | `pip install openai-whisper` |
| Claude Code | pós-processamento | seguir instalação oficial |
| Node 18+ (opcional) | build se quiser pipeline JS | `nvm install 18` |

---

## Passo a passo

### 1) Extrair áudio do vídeo

```bash
ffmpeg -i aula.mp4 -vn -acodec libmp3lame -ar 16000 -ac 1 aula.mp3
```

`-vn` remove vídeo. `-ar 16000` é a sample rate ideal pro Whisper. `-ac 1` força mono.

### 2) Transcrever com Whisper

```bash
whisper aula.mp3 \
  --language pt \
  --model medium \
  --output_format txt \
  --output_dir ./out
```

Modelos:
- `tiny` / `base`: rápidos, qualidade ruim em PT-BR.
- `small`: bom custo-benefício.
- `medium`: padrão recomendado pra apostila.
- `large-v3`: melhor qualidade, mais lento.

Saída: `out/aula.txt`.

### 3) Limpar muletas

Use Claude Code via CLI ou um script com regex inicial e LLM como passo final:

```bash
# Pré-limpeza com sed (regex)
sed -E 's/\b(ahn|hum|tipo assim|né|então)\b//gi' out/aula.txt > out/aula-clean.txt
```

Depois passe pro Claude:

```
Tarefa: limpar a transcrição de uma aula. Remover muletas (ahn, hum, sabe, tipo, etc), repetições óbvias, mas PRESERVAR todo o conteúdo técnico, exemplos e nuances.

Manter: voz original, primeira pessoa, exemplos.
Remover: pausas verbalizadas, repetição "eu eu eu", autocorreções.

Devolva apenas o texto limpo, sem comentários.

[cole transcrição aqui]
```

### 4) Segmentar em capítulos

Prompt pro Claude:

```
A partir desta transcrição limpa, identifique mudanças naturais de tópico e proponha uma divisão em 8-15 capítulos. Cada capítulo deve ter:

- Título descritivo (5-9 palavras).
- Inicia em uma frase específica do texto (cite o trecho).
- Resumo de 1 frase do que ensina.

Devolva no formato JSON:
[
  {"n": 1, "titulo": "...", "inicio": "frase de início...", "resumo": "..."},
  ...
]

[cole texto limpo aqui]
```

Salve em `chapters.json`.

### 5) Enriquecer cada capítulo

Pra cada capítulo, prompt:

```
Capítulo {n}: {titulo}
Conteúdo bruto: {trecho}

Tarefas:
1. Reescrever em prosa fluida, mantendo o tom didático original.
2. Adicionar uma intro de 2-3 frases.
3. Inserir exemplos práticos quando for natural.
4. Concluir com 1 parágrafo de fechamento.
5. Se houver lista, comando, código, formatar em markdown.

Devolva markdown puro, sem comentários.
```

Concatene todos em `apostila.md`.

### 6) Template HTML single-file

Estrutura mínima:

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Apostila — {titulo}</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&family=JetBrains+Mono:wght@400;700&display=swap" rel="stylesheet">
<style>
  :root{
    --bg:#0a0a0a; --fg:#e5e5e5; --muted:#737373; --accent:#00ff88;
    --border:#1f1f1f; --side:280px;
  }
  *{box-sizing:border-box;margin:0;padding:0}
  body{background:var(--bg);color:var(--fg);font-family:'Inter',sans-serif;line-height:1.7}
  aside{
    position:fixed;left:0;top:0;width:var(--side);height:100vh;
    border-right:1px solid var(--border);overflow-y:auto;padding:24px 16px;
    background:#050505;
  }
  aside h1{font-family:'JetBrains Mono',monospace;font-size:14px;color:var(--accent);margin-bottom:24px}
  aside ol{list-style:none}
  aside li{padding:8px 0;border-bottom:1px solid var(--border)}
  aside a{color:var(--fg);text-decoration:none;font-size:14px;display:block}
  aside a:hover,aside a.active{color:var(--accent)}
  main{margin-left:var(--side);padding:48px 64px;max-width:880px}
  main section{margin-bottom:64px;padding-bottom:48px;border-bottom:1px solid var(--border)}
  main h2{font-family:'JetBrains Mono',monospace;color:var(--accent);font-size:24px;margin-bottom:24px}
  main p{margin-bottom:16px;color:var(--fg)}
  main code{font-family:'JetBrains Mono',monospace;background:#1a1a1a;padding:2px 6px;border-radius:3px;color:var(--accent);font-size:13px}
  main pre{background:#050505;border:1px solid var(--border);padding:16px;border-radius:6px;overflow-x:auto;margin:16px 0}
  main pre code{background:none;padding:0}
  .nav-buttons{display:flex;justify-content:space-between;margin-top:32px}
  .nav-buttons button{background:transparent;border:1px solid var(--border);color:var(--fg);padding:8px 16px;cursor:pointer;font-family:'JetBrains Mono',monospace}
  .nav-buttons button:hover{border-color:var(--accent);color:var(--accent)}
  .menu-toggle{display:none}
  @media (max-width:768px){
    aside{transform:translateX(-100%);transition:transform .3s;z-index:100}
    aside.open{transform:translateX(0)}
    main{margin-left:0;padding:24px}
    .menu-toggle{display:block;position:fixed;top:16px;right:16px;z-index:101;background:var(--accent);border:none;padding:8px 12px;cursor:pointer;font-weight:bold}
  }
</style>
</head>
<body>
<button class="menu-toggle" id="toggle">menu</button>
<aside id="side">
  <h1>{TITULO_APOSTILA}</h1>
  <ol id="toc"></ol>
</aside>
<main id="content"></main>
<script>
  // Apostila inline como Markdown (gerada na pipeline)
  const APOSTILA_MD = `{INJETAR_AQUI}`;

  // Parser markdown mínimo (só o necessário)
  function md2html(md){
    return md
      .replace(/^### (.+)$/gm,'<h3>$1</h3>')
      .replace(/^## (.+)$/gm,'<h2>$1</h2>')
      .replace(/^# (.+)$/gm,'<h2>$1</h2>')
      .replace(/```(\w*)\n([\s\S]+?)```/g,'<pre><code>$2</code></pre>')
      .replace(/`([^`]+)`/g,'<code>$1</code>')
      .replace(/\*\*([^*]+)\*\*/g,'<strong>$1</strong>')
      .replace(/^- (.+)$/gm,'<li>$1</li>')
      .replace(/(<li>.+<\/li>\n?)+/g,m=>'<ul>'+m+'</ul>')
      .split(/\n\n+/).map(p=>p.startsWith('<')?p:'<p>'+p+'</p>').join('\n');
  }

  // Split por ## (cada h2 vira capítulo)
  const sections = APOSTILA_MD.split(/(?=^## )/m).filter(Boolean);
  const toc = document.getElementById('toc');
  const content = document.getElementById('content');
  sections.forEach((s, i) => {
    const titulo = s.match(/^## (.+)$/m)?.[1] || 'Capítulo '+ (i+1);
    const id = 'cap-' + (i+1);
    const html = md2html(s);
    content.insertAdjacentHTML('beforeend', `<section id="${id}"><h2>${titulo}</h2>${html.replace(/<h2>.+?<\/h2>/,'')}</section>`);
    toc.insertAdjacentHTML('beforeend', `<li><a href="#${id}" data-cap="${i+1}">${(i+1).toString().padStart(2,'0')}. ${titulo}</a></li>`);
  });

  // Navegação ativa por scroll
  const links = toc.querySelectorAll('a');
  const obs = new IntersectionObserver(es=>{
    es.forEach(e=>{
      if(e.isIntersecting){
        links.forEach(l=>l.classList.remove('active'));
        const a = toc.querySelector(`a[href="#${e.target.id}"]`);
        if(a) a.classList.add('active');
      }
    })
  }, {rootMargin: '-30% 0px -50% 0px'});
  document.querySelectorAll('main section').forEach(s=>obs.observe(s));

  // Setas do teclado
  let cur = 0;
  document.addEventListener('keydown', e=>{
    if(e.key === 'ArrowDown' || e.key === 'PageDown'){ cur = Math.min(sections.length-1, cur+1); }
    else if(e.key === 'ArrowUp' || e.key === 'PageUp'){ cur = Math.max(0, cur-1); }
    else return;
    document.getElementById('cap-'+(cur+1))?.scrollIntoView({behavior:'smooth'});
    e.preventDefault();
  });

  // Drawer mobile
  document.getElementById('toggle').addEventListener('click', ()=>{
    document.getElementById('side').classList.toggle('open');
  });
</script>
</body>
</html>
```

### 7) Injetar markdown no template

Script de build em Bash:

```bash
#!/bin/bash
TEMPLATE=template.html
APOSTILA=apostila.md
TITULO="Apostila Aula 1"

# Escapa backticks e barras invertidas pra inline em template literal
ESCAPED=$(sed -e 's/\\/\\\\/g' -e 's/`/\\`/g' "$APOSTILA")

# Substitui placeholders
sed -e "s|{TITULO_APOSTILA}|$TITULO|g" "$TEMPLATE" > index.html

# Injeta o conteúdo no placeholder {INJETAR_AQUI}
python3 -c "
import sys
template = open('index.html').read()
content = open('$APOSTILA').read()
out = template.replace('{INJETAR_AQUI}', content.replace('\\\\', '\\\\\\\\').replace('\`', '\\\\\`').replace('\${','\\\\\${'))
open('index.html', 'w').write(out)
"

echo 'index.html gerado.'
```

### 8) Deploy

Cloudflare Pages (CLI):

```bash
npm install -g wrangler
wrangler pages publish . --project-name apostila-aula1
```

Configurar domínio customizado:
```bash
wrangler pages project list
# pegar URL .pages.dev
# adicionar CNAME no DNS: apostila → apostila-aula1.pages.dev
```

---

## Boas práticas

- Numerar capítulos no título: facilita navegação e referência cruzada.
- Manter cada capítulo entre 800-2000 palavras: não cansa, não fica raso.
- Sempre incluir um capítulo "Resumo" no final com bullets do que foi visto.
- Adicionar exemplos práticos a cada conceito teórico.
- Versionar a apostila no Git: histórico mostra quando alunos pediram correção.
- Antes de publicar, rodar `grep -c 'palavra-mancha'` pra detectar conteúdo sensível.

---

## Variações

- **Apostila com player de áudio**: incluir `<audio controls src="aula.mp3">` no topo, sincronizado por timestamp da transcrição original.
- **Apostila com vídeo**: embed YouTube no topo da home.
- **Apostila com quiz**: ao final de cada capítulo, 3 perguntas (gerar via Claude).
- **Apostila com PDF de download**: `wkhtmltopdf index.html apostila.pdf`.

---

## Erros comuns

| Erro | Causa | Solução |
|---|---|---|
| Whisper trava em vídeo longo | sem `--model small/medium` ou GPU | usar `--device cuda` ou modelo menor |
| HTML quebra no markdown | backticks dentro de code blocks | escapar com `\\`` antes de injetar |
| Sidebar não atualiza scroll | `IntersectionObserver` não suportado | adicionar polyfill ou simplificar |
| Mobile drawer não abre | `transform` em pai com `overflow:hidden` | verificar CSS pai |

---

## Resumo

1. ffmpeg → mp3.
2. Whisper → transcript.txt.
3. Claude → limpa muletas.
4. Claude → segmenta capítulos.
5. Claude → enriquece e gera apostila.md.
6. Template HTML + injeção do markdown.
7. Deploy Cloudflare Pages + DNS.

Tempo total: 30-90 min por aula, dependendo da duração e do modelo Whisper.
