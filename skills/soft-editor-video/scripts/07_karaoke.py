"""LEGENDA KARAOKE word-level (a palavra falada ACENDE na cor da marca no instante exato).
Substitui a legenda paga (Submagic): fica 100% no nosso controle de fonte/cor/tamanho/marca.
FFmpeg-first, sem render headless, sem stack pesada. Insumo = o JSON word-level do 06_transcribe_local.py.

COMO FUNCIONA (mecanica):
  1) Agrupa as palavras em PAGINAS (blocos de N palavras por janela de tempo; controla quantas
     palavras aparecem de uma vez). Poucas palavras/pagina = efeito mais "palavra-a-palavra".
  2) Pra cada pagina, mede a largura de cada palavra (PIL) e monta as linhas centralizadas.
  3) Renderiza UM PNG por ESTADO-DE-PALAVRA-ATIVA: a pagina inteira em branco com UMA palavra
     na cor da marca (a que esta sendo falada). Contorno preto pra ler em cima de qualquer fundo.
  4) Queima com FFmpeg: cada PNG entra com overlay + enable='between(t, ini, fim)' no intervalo
     exato daquela palavra. O resultado e a palavra acendendo na cor da marca no timing do audio.

COR DA MARCA: puxa de config/personagens.json (campo "cor_legenda" ou "paleta"[0]); default verde
do produto. Assim a legenda usa a cara do dono, igual carrossel/banner.

Uso: python3 07_karaoke.py video_base.mp4 words.json saida.mp4 [palavras_por_pagina] [cor_hex]
  palavras_por_pagina default = 4   |   cor_hex ex: 4ade80 (sem #); default puxa da marca.

Ambientes:
  - Claude Code / agente-Telegram: roda de verdade (Bash+ffmpeg). No Telegram, o path do MP4 vai na resposta.
  - app/chat (sem Bash): nao queima. La entrega o PLANO (paginacao + qual cor acende) e avisa que roda no Code.
"""
import subprocess, sys, os, json
from PIL import Image, ImageDraw, ImageFont

VIDEO = sys.argv[1]
WORDS_JSON = sys.argv[2]
OUT = sys.argv[3]
PER_PAGE = int(sys.argv[4]) if len(sys.argv) > 4 else 4
COLOR_ARG = sys.argv[5] if len(sys.argv) > 5 else None

SKILL_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORKDIR = "/tmp/karaoke_frames"
os.makedirs(WORKDIR, exist_ok=True)

W, H = 1080, 1920
FONT_SIZE = 64
LINE_GAP = 22
MAX_TEXT_W = 940            # largura util (margem lateral)
BASELINE_Y = int(H * 0.72)  # legenda no terco inferior (nao cobre o rosto)
STROKE_W = 6
WHITE = (255, 255, 255, 255)
BLACK = (0, 0, 0, 255)


def is_hex6(s):
    s = str(s).lstrip("#")
    return len(s) == 6 and all(c in "0123456789abcdefABCDEF" for c in s)


def hex2rgba(h):
    h = str(h).lstrip("#")
    return (int(h[0:2], 16), int(h[2:4], 16), int(h[4:6], 16), 255)


def brand_color():
    if COLOR_ARG and is_hex6(COLOR_ARG):
        return hex2rgba(COLOR_ARG)
    p = os.path.join(SKILL_DIR, "config", "personagens.json")
    if os.path.exists(p):
        try:
            cfg = json.load(open(p, encoding="utf-8"))
            c = cfg.get("cor_legenda")
            if not is_hex6(c or ""):
                pal = cfg.get("paleta")
                c = pal[0] if isinstance(pal, list) and pal else None  # paleta como string prosa nao serve
            if c and is_hex6(c):
                return hex2rgba(c)
        except Exception:
            pass
    return hex2rgba("4ade80")  # verde do produto (fallback)


HIGHLIGHT = brand_color()

FONTS = ["/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf",
         "/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf",
         "/System/Library/Fonts/Supplemental/Arial Black.ttf",
         "/System/Library/Fonts/Helvetica.ttc"]
fontpath = next((f for f in FONTS if os.path.exists(f)), None)
font = ImageFont.truetype(fontpath, FONT_SIZE) if fontpath else ImageFont.load_default()

data = json.load(open(WORDS_JSON, encoding="utf-8"))
words = data["words"] if isinstance(data, dict) else data
if not words:
    raise SystemExit("words.json vazio. Rode 06_transcribe_local.py antes.")

_scratch = Image.new("RGBA", (10, 10)); _md = ImageDraw.Draw(_scratch)


def wlen(t):
    return _md.textlength(t, font=font)


# 1) paginar: no maximo PER_PAGE palavras, e quebra quando o gap entre palavras e grande (>700ms)
pages = []
cur = []
for i, w in enumerate(words):
    if cur:
        gap = w["startMs"] - cur[-1]["endMs"]
        if len(cur) >= PER_PAGE or gap > 700:
            pages.append(cur); cur = []
    cur.append(w)
if cur:
    pages.append(cur)


def layout(page_words):
    """Quebra as palavras da pagina em linhas que cabem em MAX_TEXT_W; devolve posicoes (x,y) por palavra."""
    space = wlen(" ")
    lines, line, lw = [], [], 0.0
    for w in page_words:
        ww = wlen(w["text"])
        add = ww if not line else space + ww
        if line and lw + add > MAX_TEXT_W:
            lines.append(line); line, lw = [], 0.0
            add = ww
        line.append((w, ww)); lw += add
    if line:
        lines.append(line)
    total_h = len(lines) * (FONT_SIZE + LINE_GAP) - LINE_GAP
    y0 = BASELINE_Y - total_h
    pos = {}
    y = y0
    for ln in lines:
        line_w = sum(ww for _, ww in ln) + space * (len(ln) - 1)
        x = (W - line_w) / 2
        for w, ww in ln:
            pos[id(w)] = (x, y)
            x += ww + space
        y += FONT_SIZE + LINE_GAP
    return pos


def render_state(page_words, pos, active_word):
    """PNG da pagina inteira; a palavra 'active_word' na cor da marca, o resto branco."""
    img = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    for w in page_words:
        x, y = pos[id(w)]
        fill = HIGHLIGHT if w is active_word else WHITE
        d.text((x, y), w["text"], font=font, fill=fill,
               stroke_width=STROKE_W, stroke_fill=BLACK)
    return img


# 2) gerar os PNGs (um por palavra ativa) e a lista de overlays com seus intervalos
overlays = []  # (png_path, iniMs, fimMs)
idx = 0
for page_words in pages:
    pos = layout(page_words)
    page_start = page_words[0]["startMs"]
    page_end = page_words[-1]["endMs"]
    for j, w in enumerate(page_words):
        img = render_state(page_words, pos, w)
        png = os.path.join(WORKDIR, f"k{idx:04d}.png")
        img.save(png)
        # a pagina fica na tela do inicio dela ao fim; troca a palavra acesa a cada intervalo de palavra
        ini = w["startMs"] if j > 0 else page_start
        fim = page_words[j + 1]["startMs"] if j + 1 < len(page_words) else page_end
        overlays.append((png, ini, fim))
        idx += 1

print(f"paginas={len(pages)}  estados={len(overlays)}  cor={HIGHLIGHT[:3]}", flush=True)

# 3) montar o filtro FFmpeg: encadeia os overlays, cada um com enable no seu intervalo (em segundos)
inputs = ["-i", VIDEO]
for png, _, _ in overlays:
    inputs += ["-i", png]

parts = []
last = "[0:v]"
for k, (png, ini, fim) in enumerate(overlays):
    a, b = ini / 1000.0, fim / 1000.0
    lbl = f"[v{k}]"
    parts.append(f"{last}[{k+1}:v]overlay=0:0:enable='between(t,{a:.3f},{b:.3f})'{lbl}")
    last = lbl
fc = ";".join(parts)
mapv = last

cmd = ["ffmpeg", "-y"] + inputs + ["-filter_complex", fc, "-map", mapv, "-map", "0:a?",
       "-c:v", "libx264", "-preset", "medium", "-crf", "18", "-pix_fmt", "yuv420p",
       "-c:a", "copy", OUT]
r = subprocess.run(cmd, stderr=subprocess.PIPE)
print("OK " + OUT if r.returncode == 0 else "FAIL\n" + r.stderr.decode()[-2000:])
