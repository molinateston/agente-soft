#!/usr/bin/env python3
"""
Builder do Soft Carrossel Designer.

Monta o preview.html a partir de:
- Lista de slides (cada um já desenhado como string HTML)
- Família visual escolhida (editorial / clinico / manuscrito)
- Combinação tipográfica
- Cor de destaque

Uso típico (dentro do código que gera o carrossel):

    from build_carousel import build_html

    slides_html = [
        '<div class="slide" style="...">slide 1</div>',
        '<div class="slide" style="...">slide 2</div>',
        ...
    ]

    html = build_html(
        slides_html=slides_html,
        font_combo="inter_bruto",
        embed_fonts=True,  # use False pra carregar do Google Fonts CDN
    )

    Path("/home/claude/trabalho/preview.html").write_text(html, encoding="utf-8")

Esse script NÃO desenha slides individuais. Ele apenas costura o template.
A skill (Claude) é quem decide a estrutura interna de cada slide com base
nos references das famílias.

MODO FONTES:
- embed_fonts=False (default): usa <link> do Google Fonts CDN. Funciona em
  qualquer ambiente com internet livre. Recomendado pro usuário final.
- embed_fonts=True: lê arquivos .woff2 de assets/fonts/ e embeda como base64
  no HTML. Necessário em ambientes sandboxed que bloqueiam fonts.googleapis.com.
"""

import base64
from pathlib import Path

# Pasta de fontes locais (relativa a este arquivo)
FONTS_DIR = Path(__file__).resolve().parent.parent / "assets" / "fonts"

# Mapeamento: combinação tipográfica → famílias que ela precisa carregar
# Usado pelo modo embed_fonts pra saber quais .woff2 servir.
COMBO_TO_FAMILIES = {
    "playfair_classico": ["PlayfairDisplay", "Inter"],
    "fraunces_premium": ["Fraunces", "DMSans"],
    "caslon_autoridade": ["LibreCaslonDisplay", "WorkSans"],
    "inter_bruto": ["Inter"],
    "jakarta_limpo": ["PlusJakartaSans"],
    "space_tecnico": ["SpaceGrotesk"],
    "inter_pesado": ["Inter", "Caveat"],
    "bricolage_honesto": ["BricolageGrotesque", "Caveat"],
    "jakarta_confessional": ["PlusJakartaSans", "Caveat"],
}

# Pesos a embedar por família (tudo o que os 3 famílias visuais usam)
WEIGHTS_PER_FAMILY = {
    "Inter": [400, 500, 600, 700, 800],
    "InterTight": [700, 800, 900],
    "PlusJakartaSans": [400, 500, 600, 700, 800],
    "SpaceGrotesk": [400, 500, 600, 700],
    "BricolageGrotesque": [400, 500, 600, 700, 800],
    "PlayfairDisplay": [400, 600, 700, 800],
    "Fraunces": [400, 600, 700, 900],
    "LibreCaslonDisplay": [400],
    "DMSans": [400, 500, 700],
    "WorkSans": [400, 500, 700],
    "Caveat": [600, 700],
}

# Nome de arquivo no padrão fontsource: "<family>-latin-<weight>-normal.woff2"
# Family no fontsource é minúsculo + hyphen (ex: "plus-jakarta-sans")
FONTSOURCE_NAME = {
    "Inter": "inter",
    "InterTight": "inter-tight",
    "PlusJakartaSans": "plus-jakarta-sans",
    "SpaceGrotesk": "space-grotesk",
    "BricolageGrotesque": "bricolage-grotesque",
    "PlayfairDisplay": "playfair-display",
    "Fraunces": "fraunces",
    "LibreCaslonDisplay": "libre-caslon-display",
    "DMSans": "dm-sans",
    "WorkSans": "work-sans",
    "Caveat": "caveat",
}

# Nome CSS (font-family) usado no @font-face
CSS_FAMILY_NAME = {
    "Inter": "Inter",
    "InterTight": "Inter Tight",
    "PlusJakartaSans": "Plus Jakarta Sans",
    "SpaceGrotesk": "Space Grotesk",
    "BricolageGrotesque": "Bricolage Grotesque",
    "PlayfairDisplay": "Playfair Display",
    "Fraunces": "Fraunces",
    "LibreCaslonDisplay": "Libre Caslon Display",
    "DMSans": "DM Sans",
    "WorkSans": "Work Sans",
    "Caveat": "Caveat",
}


def build_embedded_fonts(font_combo):
    """
    Lê arquivos .woff2 de assets/fonts/ e gera blocos @font-face embedados
    como base64 data URIs. Retorna uma string <style>...</style>.

    Se um arquivo de fonte estiver faltando, ele AVISA (print) e pula (cai no
    fallback do sistema), em vez de gerar PNG em fonte errada em silêncio.
    As 10 famílias dos 9 combos estão em assets/fonts/.
    """
    if font_combo not in COMBO_TO_FAMILIES:
        raise ValueError(f"Combinação tipográfica desconhecida: {font_combo}")

    families = COMBO_TO_FAMILIES[font_combo]
    face_blocks = []

    for fam in families:
        weights = WEIGHTS_PER_FAMILY.get(fam, [400, 700])
        fs_name = FONTSOURCE_NAME[fam]
        css_name = CSS_FAMILY_NAME[fam]

        for w in weights:
            font_path = FONTS_DIR / f"{fs_name}-latin-{w}-normal.woff2"
            if not font_path.exists():
                print(f"AVISO: fonte ausente {font_path.name}, o combo '{font_combo}' vai cair em fonte de sistema. Baixe as fontes (assets/fonts/) ou use embed_fonts=False com rede.")
                continue
            data = font_path.read_bytes()
            b64 = base64.b64encode(data).decode("ascii")
            face_blocks.append(
                f"@font-face {{\n"
                f"  font-family: '{css_name}';\n"
                f"  font-style: normal;\n"
                f"  font-weight: {w};\n"
                f"  font-display: block;\n"
                f"  src: url(data:font/woff2;base64,{b64}) format('woff2');\n"
                f"}}"
            )

    if not face_blocks:
        return ""

    return "<style>\n" + "\n".join(face_blocks) + "\n</style>"


# Google Fonts URL por combinação tipográfica.
# Usa nomes coerentes com references/tipografia.md.
FONT_LINKS = {
    # Editorial Preto
    "playfair_classico": (
        '<link href="https://fonts.googleapis.com/css2?'
        'family=Playfair+Display:wght@400;600;700;800&'
        'family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">'
    ),
    "fraunces_premium": (
        '<link href="https://fonts.googleapis.com/css2?'
        'family=Fraunces:opsz,wght@9..144,400;9..144,600;9..144,700;9..144,900&'
        'family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">'
    ),
    "caslon_autoridade": (
        '<link href="https://fonts.googleapis.com/css2?'
        'family=Libre+Caslon+Display&'
        'family=Work+Sans:wght@400;500;700&display=swap" rel="stylesheet">'
    ),
    # Clínico Branco
    "inter_bruto": (
        '<link href="https://fonts.googleapis.com/css2?'
        'family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">'
    ),
    "jakarta_limpo": (
        '<link href="https://fonts.googleapis.com/css2?'
        'family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">'
    ),
    "space_tecnico": (
        '<link href="https://fonts.googleapis.com/css2?'
        'family=Space+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet">'
    ),
    # Manuscrito Cru
    "inter_pesado": (
        '<link href="https://fonts.googleapis.com/css2?'
        'family=Inter:wght@400;500;600;700;800&'
        'family=Caveat:wght@600;700&display=swap" rel="stylesheet">'
    ),
    "bricolage_honesto": (
        '<link href="https://fonts.googleapis.com/css2?'
        'family=Bricolage+Grotesque:wght@400;500;600;700;800&'
        'family=Caveat:wght@600;700&display=swap" rel="stylesheet">'
    ),
    "jakarta_confessional": (
        '<link href="https://fonts.googleapis.com/css2?'
        'family=Plus+Jakarta+Sans:wght@400;500;600;700;800&'
        'family=Caveat:wght@600;700&display=swap" rel="stylesheet">'
    ),
}


# Mapeia combinação → família de fontes pra usar no font-family default
FONT_FAMILY_DEFAULT = {
    "playfair_classico": "'Inter', sans-serif",
    "fraunces_premium": "'DM Sans', sans-serif",
    "caslon_autoridade": "'Work Sans', sans-serif",
    "inter_bruto": "'Inter', sans-serif",
    "jakarta_limpo": "'Plus Jakarta Sans', sans-serif",
    "space_tecnico": "'Space Grotesk', sans-serif",
    "inter_pesado": "'Inter', sans-serif",
    "bricolage_honesto": "'Bricolage Grotesque', sans-serif",
    "jakarta_confessional": "'Plus Jakarta Sans', sans-serif",
}


HTML_TEMPLATE = """<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<title>Soft Carrossel Preview</title>
{font_links}
<style>
  * {{ box-sizing: border-box; margin: 0; padding: 0; }}

  body {{
    background: #1a1a1a;
    padding: 40px 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 60px;
    font-family: {default_font};
  }}

  .slide-wrapper {{
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 12px;
  }}

  .slide-label {{
    color: #888;
    font-size: 14px;
    font-weight: 500;
    letter-spacing: 1px;
    text-transform: uppercase;
    font-family: -apple-system, sans-serif;
  }}

  /*
   * Truque crítico: o .slide tem dimensões REAIS 1080x1350 (necessário pro export).
   * Pra mostrar no preview do chat sem ocupar a tela inteira, fazemos scale(0.4)
   * com transform-origin top center, e compensamos o espaço com margin negativo.
   *
   * 1080 * 0.4 = 432px de largura visível
   * 1350 * 0.4 = 540px de altura visível
   * Margin compensatório: 1350 - 540 = 810px que precisamos "tirar" do flow
   */
  .slide {{
    width: 1080px;
    height: 1350px;
    transform-origin: top center;
    transform: scale(0.4);
    margin-bottom: -810px;
    margin-left: -324px;  /* (1080 - 432) / 2 */
    margin-right: -324px;
    overflow: hidden;
    position: relative;
    box-shadow: 0 20px 60px rgba(0,0,0,0.3);
  }}

  /* Tipografia base inherited pelos slides individuais via inline style */
  .slide h1, .slide h2, .slide h3, .slide p, .slide span, .slide div {{
    font-family: inherit;
  }}
</style>
</head>

<body>

{slides_html}

</body>
</html>
"""


def build_html(slides_html, font_combo="inter_bruto", embed_fonts=False,
               custom_font_links=None, custom_font_family=None):
    """
    Monta o preview.html final.

    Args:
        slides_html: lista de strings, cada uma é o HTML completo de UM slide
                     (já um <div class="slide" style="...">...</div>)
        font_combo: chave de FONT_LINKS, qual combinação tipográfica usar
        embed_fonts: se True, embeda fontes locais (.woff2 em assets/fonts/)
                     como base64. Use em ambientes sem acesso ao Google Fonts CDN.
                     Se False (default), usa <link> do Google Fonts.
        custom_font_links: a(s) fonte(s) da MARCA do cliente (a ID visual própria
                     dele) como string de `<link>`/`<style>`. Quando passado, a
                     fonte da marca VENCE a curadoria: ignora font_combo e usa
                     esta. É como "cada cliente escolhe a sua ID" vira código:
                     a curadoria dos 9 combos é a rampa pra quem não tem fonte
                     de marca, nunca uma cerca.
        custom_font_family: o `font-family` default quando se usa
                     custom_font_links (ex: "'Aktiv Grotesk', sans-serif").

    Returns:
        String HTML pronta pra escrever em preview.html
    """
    if custom_font_links is not None:
        # Fonte da marca do cliente: não passa pela curadoria nem pelo embed.
        font_links = custom_font_links
        default_font = custom_font_family or "system-ui, -apple-system, sans-serif"
    else:
        if font_combo not in FONT_LINKS:
            raise ValueError(
                f"Combinação tipográfica desconhecida: {font_combo}. "
                f"Opções válidas: {', '.join(FONT_LINKS.keys())}. "
                f"Pra fonte de marca fora da curadoria, use "
                f"custom_font_links + custom_font_family."
            )

        if embed_fonts:
            font_links = build_embedded_fonts(font_combo)
        else:
            font_links = FONT_LINKS[font_combo]

        default_font = FONT_FAMILY_DEFAULT[font_combo]

    # Cada slide vai dentro de um wrapper com label "SLIDE 1", "SLIDE 2"...
    wrapped_slides = []
    for idx, slide_html in enumerate(slides_html, start=1):
        wrapped_slides.append(
            f'<div class="slide-wrapper">\n'
            f'  <div class="slide-label">SLIDE {idx:02d}</div>\n'
            f'  {slide_html}\n'
            f'</div>'
        )

    slides_combined = "\n\n".join(wrapped_slides)

    return HTML_TEMPLATE.format(
        font_links=font_links,
        default_font=default_font,
        slides_html=slides_combined,
    )


def make_slide(content_html, bg_color, padding="100px", justify="center", extra_style=""):
    """
    Helper pra gerar a casca de um slide com as propriedades comuns.

    DEPRECATED: prefira make_symmetric_slide() pra carrosséis novos.
    Este helper aceita qualquer justify e padding, mas slides assimétricos
    têm risco de parecer mal-acabados quando o carrossel é impulsionado.

    Args:
        content_html: o conteúdo interno do slide (texto, listas, ilustrações)
        bg_color: hex do fundo (ex: "#0A0908", "#FFFFFF")
        padding: padding interno (ex: "100px", "110px 100px")
        justify: "flex-start" | "center" | "flex-end"
        extra_style: CSS adicional pra colar no style do slide

    Returns:
        String com o <div class="slide"> completo.
    """
    return (
        f'<div class="slide" style="'
        f'width: 1080px;'
        f'height: 1350px;'
        f'background: {bg_color};'
        f'display: flex;'
        f'flex-direction: column;'
        f'justify-content: {justify};'
        f'padding: {padding};'
        f'box-sizing: border-box;'
        f'overflow: hidden;'
        f'position: relative;'
        f'{extra_style}'
        f'">\n'
        f'{content_html}\n'
        f'</div>'
    )


def make_symmetric_slide(content_html, bg_color, max_width=880, text_align="left", extra_style=""):
    """
    Gera um slide com SIMETRIA TOTAL, margens iguais nos 4 lados (100px),
    conteúdo centralizado opticamente vertical e horizontal, container interno
    com largura controlada pra evitar texto colado nas bordas.

    Esta é a forma RECOMENDADA pra criar slides do Soft Carrossel quando o
    carrossel vai ser impulsionado como anúncio. Margens simétricas + bloco
    centralizado = aspecto profissional, equilibrado, sem parecer mal-acabado.

    Args:
        content_html: o conteúdo interno do slide (HTML do bloco central)
        bg_color: hex do fundo (ex: "#FFFFFF", "#0A0908")
        max_width: largura máxima do bloco interno em px (default 880)
                   Use 720-760 pra slides minimalistas (virada, hook reflexivo)
                   Use 880 pra slides com lista, método, oferta
        text_align: alinhamento do TEXTO dentro do bloco ("left" default,
                    "center" para CTAs e provas com número)
        extra_style: CSS adicional pra colar no style do .slide externo

    Returns:
        String com o <div class="slide"> completo, simétrico.

    Estrutura gerada:
        <div class="slide" padding=100px center+center>
          <div max-width=880 text-align=left>
            {content_html}
          </div>
        </div>
    """
    return (
        f'<div class="slide" style="'
        f'width: 1080px;'
        f'height: 1350px;'
        f'background: {bg_color};'
        f'padding: 100px;'
        f'box-sizing: border-box;'
        f'display: flex;'
        f'flex-direction: column;'
        f'justify-content: center;'
        f'align-items: center;'
        f'position: relative;'
        f'overflow: hidden;'
        f'{extra_style}'
        f'">\n'
        f'  <div style="width: 100%; max-width: {max_width}px; text-align: {text_align};">\n'
        f'    {content_html}\n'
        f'  </div>\n'
        f'</div>'
    )


if __name__ == "__main__":
    # Smoke test: gera um preview minúsculo só pra validar o template
    test_slides = [
        make_slide(
            '<h1 style="font-family: Inter, sans-serif; font-size: 92px; '
            'font-weight: 800; line-height: 1.05; letter-spacing: -2px; color: #0A0A0A;">'
            'Teste de<br>build<br><span style="color: #FF6B1A;">funcionando</span></h1>',
            bg_color="#FFFFFF",
            padding="100px",
            justify="flex-end",
        ),
        make_slide(
            '<h1 style="font-family: Inter, sans-serif; font-size: 64px; '
            'font-weight: 800; color: #0A0A0A;">Slide 2</h1>',
            bg_color="#FFFFFF",
            justify="center",
        ),
    ]

    html = build_html(test_slides, font_combo="inter_bruto")

    output = Path("/tmp/test_carousel_preview.html")
    output.write_text(html, encoding="utf-8")
    print(f"Smoke test ok. Preview gerado em: {output}")
    print(f"Tamanho: {len(html)} chars, {len(test_slides)} slides")
