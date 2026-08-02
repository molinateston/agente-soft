#!/usr/bin/env python3
"""
Exporta slides do Soft Carrossel como PNGs 1080x1350.

Diferente do instagram-carousel: aqui o viewport real é 1080x1350,
não 420x525 escalado. Cada slide é um <div class="slide"> independente
de 1080x1350px. O script renderiza UM slide por vez no viewport e
captura screenshot.

Uso:
    python3 export_pngs.py \
      --html /caminho/preview.html \
      --output /caminho/output_dir
"""

import argparse
import asyncio
import subprocess
import sys
from pathlib import Path

try:
    from playwright.async_api import async_playwright
except ImportError:
    print("Playwright não instalado. Rodando: pip install playwright && playwright install chromium")
    import subprocess
    subprocess.run([sys.executable, "-m", "pip", "install", "playwright", "--break-system-packages"], check=True)
    subprocess.run([sys.executable, "-m", "playwright", "install", "chromium"], check=True)
    from playwright.async_api import async_playwright


SLIDE_WIDTH = 1080
SLIDE_HEIGHT = 1350


async def export_slides(html_path: Path, output_dir: Path, width: int = SLIDE_WIDTH, height: int = SLIDE_HEIGHT):
    output_dir.mkdir(parents=True, exist_ok=True)

    html_content = html_path.read_text(encoding="utf-8")

    async with async_playwright() as p:
        try:
            browser = await p.chromium.launch()
        except Exception as e:
            # Chromium nao vem instalado por padrao (o cache e por-HOME). Instala e re-tenta uma vez.
            if "Executable doesn't exist" in str(e) or "playwright install" in str(e):
                print("Chromium nao encontrado, rodando: playwright install chromium ...")
                subprocess.run([sys.executable, "-m", "playwright", "install", "chromium"], check=True)
                browser = await p.chromium.launch()
            else:
                raise
        page = await browser.new_page(
            viewport={"width": width, "height": height},
            device_scale_factor=1,
        )

        await page.set_content(html_content, wait_until="load")
        # Aguardar fontes do Google Fonts carregarem
        await page.wait_for_timeout(3000)

        # Remover o transform: scale do preview para exportar tamanho real
        await page.evaluate("""() => {
            // Remove o body padding e gap, mostra um slide por vez
            document.body.style.cssText = 'margin:0;padding:0;background:#fff;';

            // Reseta cada slide pra dimensão real, sem scale
            document.querySelectorAll('.slide').forEach(slide => {
                slide.style.transform = 'none';
                slide.style.marginBottom = '0';
                slide.style.boxShadow = 'none';
            });

            // Esconde os labels "SLIDE 1", "SLIDE 2" etc
            document.querySelectorAll('.slide-label').forEach(label => {
                label.style.display = 'none';
            });

            // Esconde todos os wrappers exceto o primeiro
            document.querySelectorAll('.slide-wrapper').forEach((w, i) => {
                w.style.gap = '0';
                if (i > 0) w.style.display = 'none';
            });
        }""")

        slides_count = await page.evaluate("document.querySelectorAll('.slide-wrapper').length")
        print(f"Encontrados {slides_count} slides para exportar.")

        for i in range(slides_count):
            # Mostra apenas o slide i
            await page.evaluate("""(idx) => {
                document.querySelectorAll('.slide-wrapper').forEach((w, j) => {
                    w.style.display = (j === idx) ? 'flex' : 'none';
                });
            }""", i)

            await page.wait_for_timeout(300)

            output_file = output_dir / f"slide_{i+1:02d}.png"
            await page.screenshot(
                path=str(output_file),
                clip={"x": 0, "y": 0, "width": width, "height": height},
                omit_background=False,
            )
            print(f"  ✓ slide_{i+1:02d}.png")

        await browser.close()

    print(f"\nExportação concluída em: {output_dir}")
    return slides_count


def main():
    parser = argparse.ArgumentParser(description="Exporta slides do Soft Carrossel como PNGs 1080x1350")
    parser.add_argument("--html", required=True, type=Path, help="Caminho do preview.html")
    parser.add_argument("--output", required=True, type=Path, help="Diretório de saída dos PNGs")
    parser.add_argument("--width", type=int, default=SLIDE_WIDTH, help="Largura px (1080 carrossel/banner quadrado, 1920 deck 16:9, 1080 story)")
    parser.add_argument("--height", type=int, default=SLIDE_HEIGHT, help="Altura px (1350 carrossel, 1080 banner/deck 16:9, 1920 story 9:16)")
    parser.add_argument("--force", action="store_true", help="exporta mesmo com falha dura na auditoria de craft (NÃO recomendado)")
    args = parser.parse_args()

    if not args.html.exists():
        print(f"Erro: arquivo HTML não encontrado: {args.html}", file=sys.stderr)
        sys.exit(1)

    # Gate de craft (enforcement): não exporta peça com falha dura — ex: texto
    # ilegível contra o fundo (o "branco no branco"). A regra é CÓDIGO que roda,
    # não confiança no agente lembrar. Cor rgba/gradiente não é avaliada (passa).
    try:
        sys.path.insert(0, str(Path(__file__).resolve().parent))
        from craft import audit_html
        failures, warnings = audit_html(args.html.read_text(encoding="utf-8"))
        for w in warnings:
            print(f"  ⚠ {w}")
        if failures and not args.force:
            print(f"\n✗ EXPORT BLOQUEADO pela auditoria de craft ({len(failures)} falha dura):")
            for f in failures:
                print(f"  ✗ {f}")
            print("Corrija o HTML e rode de novo (ou --force pra ignorar, não recomendado).")
            sys.exit(1)
    except ImportError:
        pass

    asyncio.run(export_slides(args.html, args.output, args.width, args.height))


if __name__ == "__main__":
    main()
