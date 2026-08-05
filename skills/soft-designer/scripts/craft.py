#!/usr/bin/env python3
"""
craft.py — a camada de ENFORCEMENT do soft-designer.

Transforma a doutrina de craft (anti-órfã, contraste por pele) de PROSA em
CÓDIGO que o pipeline RODA. Antes existia só nas references e dependia do
agente lembrar de aplicar; por isso erros como "texto branco no fundo claro"
escapavam mesmo com tudo documentado. Aqui a regra é executável.

Sem dependência externa (só stdlib) — roda em qualquer ambiente onde o bot rode.

USO COMO LIB (na hora de escrever o HTML de cada slide/banner):
    from craft import nw, legible
    titulo = nw("vender todo dia")        # -> "vender todo dia" (última palavra nunca cai sozinha)
    assert legible("#FFFFFF", "#F5F2EC")  # -> False (branco no creme = ilegível)

USO COMO GATE (no pipeline, DEPOIS do build_html e ANTES do export):
    python3 scripts/craft.py audit /caminho/preview.html
    # imprime cada falha e sai com código 1 se houver qualquer uma.
    # 0 falhas = pode exportar. Falhou = corrige e roda de novo.

O gate cobre os 2 checks que dá pra verificar de forma CONFIÁVEL em código
(contraste e órfã). Os outros checks da auditoria-pre-preview.md (ritmo,
diagrama forte, anti-vazio, padding) continuam no olho do agente — esses
dependem de julgamento visual que não se automatiza sem render.
"""
import sys
import re
from html.parser import HTMLParser

NB = " "  # espaço inquebrável


# ───────────────────────── anti-órfã ─────────────────────────
def nw(s):
    """Junta as 2 últimas palavras com espaço inquebrável, de modo depth-aware
    (ignora espaços DENTRO de tags HTML). Garante que a última palavra de um
    bloco nunca renderize sozinha numa linha. `text-wrap` do CSS não basta em
    render headless; isto basta. Envolva TODO texto de peça com nw()."""
    if not s:
        return s
    depth = 0
    last = -1
    for i, c in enumerate(s):
        if c == '<':
            depth += 1
        elif c == '>':
            depth -= 1
        elif c == ' ' and depth <= 0:
            last = i
    return s[:last] + NB + s[last + 1:] if last >= 0 else s


# ───────────────────────── contraste (WCAG) ─────────────────────────
def _parse_hex(c):
    if not c:
        return None
    c = c.strip().lstrip('#')
    if len(c) == 3:
        c = ''.join(ch * 2 for ch in c)
    if len(c) != 6:
        return None
    try:
        return tuple(int(c[i:i + 2], 16) for i in (0, 2, 4))
    except ValueError:
        return None


def _lin(v):
    v = v / 255.0
    return v / 12.92 if v <= 0.03928 else ((v + 0.055) / 1.055) ** 2.4


def luminance(hexcolor):
    rgb = _parse_hex(hexcolor)
    if not rgb:
        return None
    r, g, b = (_lin(x) for x in rgb)
    return 0.2126 * r + 0.7152 * g + 0.0722 * b


def contrast_ratio(fg, bg):
    """Razão de contraste WCAG (1:1 a 21:1). None se alguma cor não for hex
    sólido (ex: rgba, gradiente) — nesse caso o gate não opina."""
    lf, lb = luminance(fg), luminance(bg)
    if lf is None or lb is None:
        return None
    hi, lo = max(lf, lb), min(lf, lb)
    return (hi + 0.05) / (lo + 0.05)


def legible(fg, bg, minimum=3.0):
    """True se o texto é legível sobre o fundo. Limiar 3.0 (abaixo disso é
    bug, não 'sutil'). Cor desconhecida (rgba/gradiente) não reprova."""
    cr = contrast_ratio(fg, bg)
    return cr is None or cr >= minimum


# ───────────────────────── gate: auditoria programática ─────────────────────────
_VOID = {'br', 'img', 'hr', 'input', 'meta', 'link', 'source', 'use', 'path',
         'circle', 'line', 'polyline', 'rect', 'polygon', 'ellipse'}


def _grab(style, prop):
    m = re.search(prop + r'\s*:\s*([^;]+)', style, re.I)
    return m.group(1).strip() if m else None


class _Auditor(HTMLParser):
    """Anda o HTML mantendo a pilha de cor/fundo herdados (inline style), pra
    saber, em cada texto, a cor efetiva contra o fundo IMEDIATO atrás dele —
    é assim que se pega o 'branco no branco' sem falso-positivo em chip/caixa
    que tem fundo próprio."""

    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.stack = []
        self.failures = []

    def handle_starttag(self, tag, attrs):
        if tag in _VOID:
            # conteúdo visual (img/svg) conta como "não-vazio" pro ancestral
            for n in self.stack:
                n['content'] = True
            return
        d = dict(attrs)
        style = d.get('style', '') or ''
        color = _grab(style, 'color')
        bg = _grab(style, 'background-color')
        if not bg:
            b = _grab(style, 'background')
            if b and b.lstrip().startswith('#'):
                bg = b.split()[0]
        self.stack.append({
            'tag': tag,
            'color': color,
            'bg': bg,
            'content': False,
        })

    def _nearest(self, key, default):
        for n in reversed(self.stack):
            if n.get(key):
                return n[key]
        return default

    def handle_data(self, data):
        txt = data.strip()
        if not txt:
            return
        for n in self.stack:
            n['content'] = True
        color = self._nearest('color', '#000000')   # default do browser = preto
        bg = self._nearest('bg', '#FFFFFF')          # default da página = branco
        cr = contrast_ratio(color, bg)
        if cr is not None and cr < 3.0:
            self.failures.append(
                f'CONTRASTE {cr:.1f}:1 (mín 3.0) — texto {color} sobre {bg}: "{txt[:48]}"'
            )

    def handle_endtag(self, tag):
        for i in range(len(self.stack) - 1, -1, -1):
            if self.stack[i]['tag'] == tag:
                self.stack.pop(i)
                break


def _orphan_warnings(html):
    """Heurística de órfã: em cada bloco com <br> manual, sinaliza segmento de
    1 palavra sem nbsp (provável palavra sozinha na linha). É WARNING — a cura
    é envolver o texto com nw()."""
    warns = []
    # blocos de texto entre tags, quebrados por <br>
    for seg in re.split(r'(?i)<br\s*/?>', html):
        # tira tags, decodifica nbsp
        plain = re.sub(r'<[^>]+>', '', seg).replace(NB, ' ').strip()
        if not plain:
            continue
        words = plain.split()
        # 1 palavra solta com 0 nbsp no segmento original = suspeita de órfã
        if len(words) == 1 and len(plain) >= 3 and NB not in seg and '|' not in plain:
            warns.append(f'ÓRFÃ provável: linha com 1 palavra "{plain[:30]}" (use nw())')
    return warns


def audit_html(html):
    """Retorna (failures, warnings). failures = bloqueia o export. warnings =
    revisar no olho."""
    a = _Auditor()
    a.feed(html)
    failures = a.failures
    # dedup preservando ordem
    seen = set()
    failures = [f for f in failures if not (f in seen or seen.add(f))]
    warnings = _orphan_warnings(html)
    seen = set()
    warnings = [w for w in warnings if not (w in seen or seen.add(w))]
    return failures, warnings


def _cli_audit(path):
    try:
        with open(path, encoding='utf-8') as fh:
            html = fh.read()
    except OSError as e:
        print(f'ERRO: não abriu {path}: {e}')
        return 2
    failures, warnings = audit_html(html)
    for w in warnings:
        print(f'  ⚠ {w}')
    if failures:
        print(f'\n✗ AUDITORIA REPROVOU ({len(failures)} falha(s) dura(s)):')
        for f in failures:
            print(f'  ✗ {f}')
        print('\nCorrija e rode de novo. Não exporte com falha dura.')
        return 1
    print(f'✓ auditoria de craft passou (0 falhas duras, {len(warnings)} aviso(s)).')
    return 0


if __name__ == '__main__':
    if len(sys.argv) >= 3 and sys.argv[1] == 'audit':
        sys.exit(_cli_audit(sys.argv[2]))
    # smoke test
    assert nw('vender todo dia') == 'vender todo' + NB + 'dia'
    assert nw('um') == 'um'
    assert legible('#1a1814', '#F5F2EC') is True       # escuro no creme = ok
    assert legible('#FFFFFF', '#F5F2EC') is False       # branco no creme = bug
    assert legible('#FFFFFF', '#060806') is True        # branco no preto = ok
    bad = '<div style="background:#F5F2EC"><span style="color:#FFFFFF">sumiu no claro</span></div>'
    f, w = audit_html(bad)
    assert f, 'deveria pegar branco-no-claro'
    good = '<div style="background:#060806"><span style="color:#FFFFFF">legível</span></div>'
    f2, w2 = audit_html(good)
    assert not f2, 'não devia reprovar branco-no-preto'
    print('craft.py smoke test OK — nw, legible, audit_html funcionando.')
    print('uso gate: python3 scripts/craft.py audit preview.html')
