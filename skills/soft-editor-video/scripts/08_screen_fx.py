"""ANIMACOES DE TELA uteis pro reels do metodo (talking-head), FFmpeg-first.
Nao e motion-graphics de dado: sao 3 movimentos de TEXTO que seguram a retencao no gancho/na
frase-ancora, sem inflar custo (e render de texto, nao Veo).

3 modos:
  wipe:   MARCA-TEXTO animado. Uma faixa da cor da marca cresce da esquerda pra direita ATRAS de
          UMA palavra-ancora (efeito de caneta marca-texto passando). Pro gancho.
  reveal: a frase aparece PALAVRA A PALAVRA (pop-in escalonado), cada palavra entra num offset.
          Bom pra um card de frase forte no meio do reels.
  bar:    LOWER-THIRD. Uma faixa de apoio com a frase que ENTRA deslizando por baixo (wipe vertical)
          no terco inferior; some depois. Pra reforcar um ponto sem cobrir o rosto.

COR DA MARCA: puxa de config/personagens.json (cor_legenda / paleta[0]); default verde do produto.

Uso:
  python3 08_screen_fx.py wipe   base.mp4 saida.mp4 "FRASE COMPLETA" "PALAVRA" [ini_s] [dur_s] [cor_hex]
  python3 08_screen_fx.py reveal base.mp4 saida.mp4 "FRASE COMPLETA" [ini_s] [dur_s] [cor_hex]
  python3 08_screen_fx.py bar    base.mp4 saida.mp4 "FRASE DE APOIO" [ini_s] [dur_s] [cor_hex]

Ambientes: Claude Code / agente-Telegram rodam de verdade (Bash+ffmpeg; no TG o path do MP4 vai na
resposta). app/chat (sem Bash) nao renderiza: entrega o PLANO do efeito e avisa que roda no Code.
"""
import subprocess, sys, os, json
from PIL import Image, ImageDraw, ImageFont

MODE = sys.argv[1]
BASE = sys.argv[2]
OUT = sys.argv[3]

SKILL_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
W, H = 1080, 1920
FONT_SIZE = 66
STROKE_W = 5
WHITE = (255, 255, 255, 255)
BLACK = (0, 0, 0, 255)
LOWER_Y = int(H * 0.68)

FONTS = ["/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf",
         "/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf",
         "/System/Library/Fonts/Supplemental/Arial Black.ttf",
         "/System/Library/Fonts/Helvetica.ttc"]
fontpath = next((f for f in FONTS if os.path.exists(f)), None)
font = ImageFont.truetype(fontpath, FONT_SIZE) if fontpath else ImageFont.load_default()
_md = ImageDraw.Draw(Image.new("RGBA", (10, 10)))


def is_hex6(s):
    s = str(s).lstrip("#")
    return len(s) == 6 and all(c in "0123456789abcdefABCDEF" for c in s)


def hex2rgba(h):
    h = str(h).lstrip("#")
    return (int(h[0:2], 16), int(h[2:4], 16), int(h[4:6], 16), 255)


def brand_color():
    for a in sys.argv[4:]:  # cor_hex opcional em qualquer posicao apos os args fixos
        if is_hex6(a):
            return hex2rgba(a)
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
    return hex2rgba("4ade80")


BRAND = brand_color()


def wlen(t):
    return _md.textlength(t, font=font)


def run(fc, extra_inputs=None):
    inputs = ["-i", BASE]
    for e in (extra_inputs or []):
        inputs += ["-i", e]
    cmd = (["ffmpeg", "-y"] + inputs + ["-filter_complex", fc, "-map", "[v]", "-map", "0:a?",
           "-c:v", "libx264", "-preset", "medium", "-crf", "18", "-pix_fmt", "yuv420p",
           "-c:a", "copy", OUT])
    r = subprocess.run(cmd, stderr=subprocess.PIPE)
    print("OK " + OUT if r.returncode == 0 else "FAIL\n" + r.stderr.decode()[-2000:])


# ---------- MODO wipe (marca-texto animado atras da palavra-ancora) ----------
if MODE == "wipe":
    PHRASE = sys.argv[4].upper()
    ANCHOR = sys.argv[5].upper()
    # args opcionais numericos: ini, dur (a cor ja foi lida em brand_color)
    nums = [a for a in sys.argv[6:] if a.replace('.', '', 1).isdigit()]
    INI = float(nums[0]) if len(nums) > 0 else 0.6
    DUR = float(nums[1]) if len(nums) > 1 else 2.6
    WIPE = 0.5  # segundos pra faixa crescer da esquerda pra direita

    # medir posicao da palavra-ancora numa unica linha centralizada
    words = PHRASE.split()
    space = wlen(" ")
    total = sum(wlen(w) for w in words) + space * (len(words) - 1)
    x = (W - total) / 2
    y = LOWER_Y
    anchor_x = None; anchor_w = None
    for w in words:
        ww = wlen(w)
        if w == ANCHOR and anchor_x is None:
            anchor_x, anchor_w = x, ww
        x += ww + space
    if anchor_x is None:  # ancora nao bateu exato: destaca a frase inteira
        anchor_x, anchor_w = (W - total) / 2, total

    # PNG do texto (branco, contorno) e PNG da faixa cheia (cor da marca)
    txt = Image.new("RGBA", (W, H), (0, 0, 0, 0)); dt = ImageDraw.Draw(txt)
    x = (W - total) / 2
    for w in words:
        dt.text((x, y), w, font=font, fill=WHITE, stroke_width=STROKE_W, stroke_fill=BLACK)
        x += wlen(w) + space
    TXT = "/tmp/fx_wipe_txt.png"; txt.save(TXT)

    pad = 10
    bar_w = int(anchor_w + 2 * pad)
    bar_h = FONT_SIZE + 20
    bx = int(anchor_x - pad)
    by = int(y - 6)
    r, g, b = BRAND[0], BRAND[1], BRAND[2]

    # MARCA-TEXTO animado: uma faixa da cor da marca CRESCE da esquerda pra direita atras da palavra
    # (caneta marca-texto passando). drawbox aceita 't' na largura -> largura vai de 0 ate bar_w em WIPE,
    # ancorada na esquerda (x fixo). Depois o texto branco vem POR CIMA. So durante a janela do gancho.
    wexpr = f"min({bar_w}\\,{bar_w}*(t-{INI})/{WIPE})"
    fc = (
        f"[0:v]drawbox=x={bx}:y={by}:"
        f"w='if(between(t,{INI},{INI+DUR}),max(0,{wexpr}),0)':h={bar_h}:"
        f"color=0x{r:02x}{g:02x}{b:02x}@1:t=fill[withbar];"
        f"[withbar][1:v]overlay=0:0:enable='between(t,{INI},{INI+DUR})'[v]"
    )
    run(fc, extra_inputs=[TXT])

# ---------- MODO reveal (frase entra palavra a palavra) ----------
elif MODE == "reveal":
    PHRASE = sys.argv[4].upper()
    nums = [a for a in sys.argv[5:] if a.replace('.', '', 1).isdigit()]
    INI = float(nums[0]) if len(nums) > 0 else 0.4
    DUR = float(nums[1]) if len(nums) > 1 else 2.8
    STEP = 0.18  # offset entre palavras

    words = PHRASE.split()
    space = wlen(" ")
    total = sum(wlen(w) for w in words) + space * (len(words) - 1)
    x0 = (W - total) / 2
    y = LOWER_Y
    pngs = []
    parts = []
    last = "[0:v]"
    x = x0
    n = len(words)
    for i, w in enumerate(words):
        img = Image.new("RGBA", (W, H), (0, 0, 0, 0)); d = ImageDraw.Draw(img)
        fill = BRAND if i == n - 1 else WHITE  # ultima palavra na cor da marca (fecha o gancho)
        d.text((x, y), w, font=font, fill=fill, stroke_width=STROKE_W, stroke_fill=BLACK)
        p = f"/tmp/fx_reveal_{i}.png"; img.save(p); pngs.append(p)
        start = INI + i * STEP
        lbl = "[v]" if i == n - 1 else f"[r{i}]"  # o ultimo sai em [v] (o que run() mapeia)
        parts.append(f"{last}[{i+1}:v]overlay=0:0:enable='between(t,{start:.3f},{INI+DUR:.3f})'{lbl}")
        last = lbl
        x += wlen(w) + space
    fc = ";".join(parts)
    run(fc, extra_inputs=pngs)

# ---------- MODO bar (lower-third que entra deslizando) ----------
elif MODE == "bar":
    PHRASE = sys.argv[4].upper()
    nums = [a for a in sys.argv[5:] if a.replace('.', '', 1).isdigit()]
    INI = float(nums[0]) if len(nums) > 0 else 0.4
    DUR = float(nums[1]) if len(nums) > 1 else 3.0
    SLIDE = 0.4

    # quebra em ate 2 linhas
    words = PHRASE.split(); space = wlen(" ")
    lines, line, lw = [], [], 0.0
    for w in words:
        ww = wlen(w); add = ww if not line else space + ww
        if line and lw + add > 900:
            lines.append(line); line, lw = [], 0.0; add = ww
        line.append(w); lw += add
    if line:
        lines.append(line)
    lines = lines[:2]
    lh = FONT_SIZE + 16
    block_h = lh * len(lines)
    band_y = LOWER_Y
    # faixa de fundo semitransparente + texto
    band = Image.new("RGBA", (W, H), (0, 0, 0, 0)); d = ImageDraw.Draw(band)
    by0 = band_y - 18; by1 = band_y + block_h + 12
    d.rectangle([0, by0, W, by1], fill=(0, 0, 0, 150))
    d.rectangle([0, by0, 12, by1], fill=BRAND)  # barrinha da marca na lateral
    y = band_y
    for ln in lines:
        line_w = sum(wlen(w) for w in ln) + space * (len(ln) - 1)
        x = (W - line_w) / 2
        for w in ln:
            d.text((x, y), w, font=font, fill=WHITE, stroke_width=STROKE_W, stroke_fill=BLACK)
            x += wlen(w) + space
        y += lh
    BAND = "/tmp/fx_bar.png"; band.save(BAND)
    # entra deslizando de baixo: y vai de H (fora) ate 0 durante SLIDE
    yexpr = f"'if(lt(t,{INI+SLIDE}), {H}*(1-(t-{INI})/{SLIDE}), 0)'"
    fc = (
        f"[0:v][1:v]overlay=0:{yexpr}:enable='between(t,{INI},{INI+DUR})'[v]"
    )
    run(fc, extra_inputs=[BAND])

else:
    raise SystemExit("modo invalido. use: wipe | reveal | bar")
