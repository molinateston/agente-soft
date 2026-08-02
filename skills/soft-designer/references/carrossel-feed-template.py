#!/usr/bin/env python3
"""Molde parametrizado: carrossel de feed 1080x1350, fundo preto, watermark textural, uma cor accent.

COMO USAR:
1. Preencha o bloco USER_* embaixo (cor accent do cliente, handle, palavra-chave do CTA, lista de palavras
   do nicho pra virar watermark, textos de cada slide).
2. Ponha as fontes .woff2 do cliente em ./fonts/ (Inter 400+700 é um bom default) e, se usar imagens IA,
   em ./ai-img/.
3. python3 build.py  ->  gera slide_01..09.html + PNGs 2160x2700 (device_scale_factor=2).

NADA neste arquivo é específico de nenhum autor. Toda referência (cor, handle, palavra, tema, prova)
vem do bloco USER_* abaixo. Se o cliente for nicho regulado, roda o gate regulado ANTES de escrever.
"""
import base64, pathlib, random, re

# ============ USER PARAMS (o único bloco que muda por cliente) ============
USER_ACCENT       = "#22c55e"       # cor accent do cliente (destaque em palavra/número)
USER_ACCENT_DIM   = "#16a34a"       # variante escura pra borda de chip
USER_ACCENT_DEEP  = "#14532d"       # variante bem escura pro watermark textural
USER_HANDLE       = "@seuhandle"    # centralizado no topo de todo slide
USER_KEYWORD      = "PALAVRA"       # palavra-chave filtrante do CTA final
USER_WATERMARK_WORDS = [            # 15-25 palavras do nicho (viram matrix no fundo)
    "PALAVRA1","PALAVRA2","PALAVRA3","PALAVRA4","PALAVRA5",
]

# Textos de cada slide (copy-visual aprovada no gate ANTES).
# Envolve palavra em [[ ]] pra ela receber cor accent.
SLIDES_COPY = [
    {"kind":"capa4",   "h":["LINHA 1","[[LINHA 2 ACCENT]]","LINHA 3","LINHA 4."],
                        "sub":"subtítulo em cinza claro, uma linha."},
    {"kind":"texto",   "h":"HEADLINE COM [[PALAVRA]] EM ACCENT",
                        "body":["<strong>parágrafo curto forte</strong>","parágrafo secundário."]},
    {"kind":"img",     "h":"HEADLINE CURTA COM [[ACCENT]].",
                        "img":"ai-img/imagem1.png","caption":"microlegenda de uma linha."},
    {"kind":"chips",   "h":"HEADLINE DE [[CATEGORIA]]",
                        "chips":[("A","g"),("=","sep"),("B","")],
                        "body":["explicação em uma linha.","<strong>reforço.</strong>"]},
    {"kind":"img",     "h":"PERGUNTA COM [[ACCENT]]",
                        "img":"ai-img/imagem2.png","caption":"pergunta direta ao leitor."},
    {"kind":"bullets", "h_top":"CONTEXTO CURTO.","h":"CHAMA [[NOME]].",
                        "body":["descrição em 2-3 linhas."],
                        "bullets":[("sq","item 1"),("sq","item 2"),("sq","item 3")]},
    {"kind":"img",     "h":"PROVA [[EM ACCENT]].",
                        "img":"ai-img/imagem3.png","caption":"prova concreta, sem exagero."},
    {"kind":"vsx",     "h":"HEADLINE DA [[BIFURCAÇÃO]]",
                        "items":[("v","quem faz hoje ganha isso"),
                                 ("x","quem deixa pra depois perde aquilo")],
                        "body":["fecho de urgência."]},
    {"kind":"cta",     "h":"A AULA/OFERTA QUE MOSTRA [[COMO]]","body":"comenta",
                        "keyword":USER_KEYWORD,"sub":"aqui embaixo. te mando no direct."},
]
# ============ FIM USER PARAMS ============

OUT = pathlib.Path(__file__).parent
FONTS = OUT / "fonts"

def b64(p, mime): return f"data:{mime};base64,{base64.b64encode((FONTS/p).read_bytes()).decode()}"
def imgb64(p):     return base64.b64encode((OUT/p).read_bytes()).decode()

INTER400 = b64("inter-400.woff2", "font/woff2")
INTER700 = b64("inter-700.woff2", "font/woff2")
G, G_DIM, G_WM = USER_ACCENT, USER_ACCENT_DIM, USER_ACCENT_DEEP

def matrix_bg():
    random.seed(42)
    spans = []
    for x in range(-40, 1120, 88):
        y = random.randint(-80, 400)
        w = random.choice(USER_WATERMARK_WORDS)
        opacity = random.uniform(0.28, 0.55)
        fs = random.randint(28, 42)
        spans.append(
            f'<div style="position:absolute;left:{x}px;top:{y}px;color:{G_WM};'
            f'opacity:{opacity:.2f};font-family:JetBrains Mono,monospace;font-weight:700;'
            f'font-size:{fs}px;letter-spacing:0.05em;writing-mode:vertical-rl;'
            f'text-orientation:upright;line-height:1.05;">{w}</div>')
    return '<div class="matrix">' + "".join(spans) + '</div>'

BASE_CSS = f"""
@font-face {{ font-family:'Inter'; src:url({INTER400}) format('woff2'); font-weight:400; font-display:block; }}
@font-face {{ font-family:'Inter'; src:url({INTER700}) format('woff2'); font-weight:700; font-display:block; }}
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&family=JetBrains+Mono:wght@400;500;700&display=swap');
* {{ box-sizing:border-box; margin:0; padding:0; }}
html,body {{ width:1080px; height:1350px; background:#000; color:#fff;
  font-family:'Inter','Noto Color Emoji',sans-serif; -webkit-font-smoothing:antialiased; overflow:hidden; }}
.slide {{ width:1080px; height:1350px; background:#000; color:#fff; padding:80px 72px;
  display:flex; flex-direction:column; position:relative; overflow:hidden; }}
.matrix {{ position:absolute; inset:0; pointer-events:none; z-index:0; }}
.head {{ position:relative; z-index:2; display:flex; justify-content:center; padding-top:8px; }}
.head .handle {{ color:{G}; font-weight:600; font-size:30px; letter-spacing:-0.01em; }}
.mid {{ position:relative; z-index:2; flex:1; display:flex; flex-direction:column;
  justify-content:center; gap:32px; padding:40px 0; }}
.mid.top {{ justify-content:flex-start; padding-top:80px; }}
h1 {{ font-weight:800; font-size:78px; line-height:1.05; letter-spacing:-0.025em; color:#fff; }}
h1.big {{ font-size:96px; }}
h1.small {{ font-size:66px; }}
h1 .g {{ color:{G}; }}
p.body {{ font-weight:400; font-size:36px; line-height:1.35; color:#e6e6e6; }}
p.body strong {{ color:#fff; font-weight:700; }}
p.body .g {{ color:{G}; font-weight:700; }}
p.sub {{ font-weight:400; font-size:32px; line-height:1.4; color:#b8b8b8; }}
ul.list {{ list-style:none; display:flex; flex-direction:column; gap:24px; }}
ul.list li {{ font-size:34px; font-weight:600; line-height:1.3; color:#fff;
  padding-left:56px; position:relative; }}
ul.list li .ic {{ position:absolute; left:0; top:4px; width:36px; height:36px;
  display:flex; align-items:center; justify-content:center; font-weight:700; font-size:26px; }}
ul.list li .ic.x {{ color:#ef4444; }}
ul.list li .ic.v {{ color:{G}; }}
ul.list li .ic.sq {{ background:{G}; width:22px; height:22px; top:14px; }}
.chips {{ display:flex; flex-wrap:wrap; gap:18px; align-items:center; }}
.chip {{ border:1.5px solid {G_DIM}; border-radius:999px; padding:16px 28px;
  font-weight:600; font-size:28px; color:#fff; background:rgba(0,0,0,0.04); }}
.chip.g {{ color:{G}; }}
.arrow-sep {{ color:{G}; font-size:32px; font-weight:700; }}
.hero-img {{ width:100%; max-width:720px; height:520px; background-size:cover;
  background-position:center; border-radius:12px; margin:8px auto;
  border:1px solid rgba(255,255,255,0.08); }}
.footer {{ position:relative; z-index:2; display:flex; justify-content:center; padding-bottom:24px; }}
.footer .arrow {{ color:{G}; font-weight:700; font-size:44px; }}
.cta-word {{ font-weight:800; font-size:64px; color:{G}; letter-spacing:0.02em;
  text-shadow:0 0 24px rgba(255,255,255,0.15); }}
.emoji {{ font-size:1em; }}
"""

MX = matrix_bg()

def accent(t): return re.sub(r'\[\[(.+?)\]\]', r"<span class='g'>\1</span>", t)

def wrap(mid, arrow=True, mid_class=""):
    a = '→' if arrow else '•'
    return f"""<!doctype html><html><head><meta charset="utf-8"><style>{BASE_CSS}</style></head>
<body><div class="slide">{MX}
  <div class="head"><div class="handle">{USER_HANDLE}</div></div>
  <div class="mid {mid_class}">{mid}</div>
  <div class="footer"><div class="arrow">{a}</div></div>
</div></body></html>"""

def render(cfg):
    k = cfg["kind"]
    if k == "capa4":
        lines = "".join(f'<h1 class="big"{" style=\"margin-top:-4px;\"" if i else ""}>{accent(l)}</h1>'
                        for i,l in enumerate(cfg["h"]))
        return wrap(lines + f'<p class="sub" style="margin-top:24px;">{cfg.get("sub","")}</p>')
    if k == "texto":
        body = "".join(f'<p class="body">{accent(b)}</p>' for b in cfg["body"])
        return wrap(f'<h1>{accent(cfg["h"])}</h1>{body}')
    if k == "img":
        img = imgb64(cfg["img"])
        return wrap(f'<h1 class="small">{accent(cfg["h"])}</h1>'
                    f'<div class="hero-img" style="background-image:url(data:image/png;base64,{img});"></div>'
                    f'<p class="body">{accent(cfg["caption"])}</p>', mid_class="top")
    if k == "chips":
        cs = "".join(('<div class="arrow-sep">'+c+'</div>' if v=="sep"
                      else f'<div class="chip {v}">{c}</div>') for c,v in cfg["chips"])
        body = "".join(f'<p class="body">{accent(b)}</p>' for b in cfg["body"])
        return wrap(f'<h1>{accent(cfg["h"])}</h1><div class="chips" style="margin-top:8px;">{cs}</div>{body}')
    if k == "bullets":
        bl = "".join(f'<li><span class="ic {t}"></span>{accent(x)}</li>' for t,x in cfg["bullets"])
        body = "".join(f'<p class="body">{accent(b)}</p>' for b in cfg["body"])
        top = f'<h1 class="small">{accent(cfg["h_top"])}</h1>' if cfg.get("h_top") else ""
        return wrap(f'{top}<h1 class="big" style="margin-top:-8px;">{accent(cfg["h"])}</h1>{body}'
                    f'<ul class="list" style="margin-top:8px;">{bl}</ul>', mid_class="top")
    if k == "vsx":
        items = "".join(f'<li><span class="ic {t}">{"✓" if t=="v" else "✗"}</span>{accent(x)}</li>'
                        for t,x in cfg["items"])
        body = "".join(f'<p class="body">{accent(b)}</p>' for b in cfg["body"])
        return wrap(f'<h1 class="small">{accent(cfg["h"])}</h1>'
                    f'<ul class="list" style="margin-top:16px;">{items}</ul>{body}')
    if k == "cta":
        return wrap(f'<h1 class="small">{accent(cfg["h"])}</h1>'
                    f'<p class="body" style="margin-top:16px;">{cfg["body"]} '
                    f'<span class="cta-word">{cfg["keyword"]}</span></p>'
                    f'<p class="sub">{cfg["sub"]}</p>', arrow=False)
    raise ValueError(k)

for i, cfg in enumerate(SLIDES_COPY, 1):
    (OUT / f"slide_{i:02d}.html").write_text(render(cfg), encoding="utf-8")
print(f"Wrote {len(SLIDES_COPY)} HTMLs")

from playwright.sync_api import sync_playwright
with sync_playwright() as p:
    b = p.chromium.launch()
    ctx = b.new_context(viewport={"width":1080,"height":1350}, device_scale_factor=2)
    page = ctx.new_page()
    for i in range(1, len(SLIDES_COPY)+1):
        page.goto(f"file://{OUT}/slide_{i:02d}.html")
        page.wait_for_load_state("networkidle")
        page.screenshot(path=str(OUT/f"slide_{i:02d}.png"),
                        full_page=False, clip={"x":0,"y":0,"width":1080,"height":1350})
        print(f"OK slide_{i:02d}.png")
    b.close()
print("DONE")
