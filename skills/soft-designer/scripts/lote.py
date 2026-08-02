#!/usr/bin/env python3
"""
lote.py -- render de carrossel/lote em PNG, uma peca por vez, com
checkpoint. Se cair no meio (falha de rede, timeout, kill), retoma
de onde parou em vez de recomecar do zero. E o que permite lote de
80+ pecas sem medo (o metodo do Augusto).

Formato de entrada: um JSON com uma lista de pecas, cada uma ja com
o HTML completo do slide (a skill monta o HTML antes de chamar isto,
ver build_carousel.py pra costurar o template com a identidade):

    [
      {"id": "01", "html": "<html>...</html>"},
      {"id": "02", "html": "<html>...</html>"}
    ]

Uso:
    python3 lote.py --spec pecas.json --output /caminho/saida \
        --checkpoint /caminho/saida/.checkpoint.json

Rodar de novo com o MESMO --checkpoint pula as pecas ja feitas.
"""
import argparse
import asyncio
import json
import sys
from pathlib import Path

try:
    from playwright.async_api import async_playwright
except ImportError:
    import subprocess
    subprocess.run([sys.executable, "-m", "pip", "install", "playwright", "--break-system-packages"], check=True)
    subprocess.run([sys.executable, "-m", "playwright", "install", "chromium"], check=True)
    from playwright.async_api import async_playwright

WIDTH = 1080
HEIGHT = 1350


def _ler_checkpoint(caminho):
    p = Path(caminho)
    if p.exists():
        return json.loads(p.read_text(encoding="utf-8"))
    return {"feitas": []}


def _gravar_checkpoint(caminho, estado):
    Path(caminho).write_text(json.dumps(estado, ensure_ascii=False, indent=2), encoding="utf-8")


async def renderiza_lote(pecas, output_dir, checkpoint_path, width=WIDTH, height=HEIGHT):
    output_dir.mkdir(parents=True, exist_ok=True)
    estado = _ler_checkpoint(checkpoint_path)
    feitas = set(estado["feitas"])

    pendentes = [p for p in pecas if p["id"] not in feitas]
    if not pendentes:
        print(f"Nada pendente -- {len(feitas)} peca(s) ja renderizada(s) no checkpoint.")
        return len(feitas), 0

    print(f"{len(feitas)} ja prontas, {len(pendentes)} pendente(s). Renderizando...")

    async with async_playwright() as p:
        browser = await p.chromium.launch()
        page = await browser.new_page(viewport={"width": width, "height": height}, device_scale_factor=1)

        for peca in pendentes:
            await page.set_content(peca["html"], wait_until="load")
            await page.wait_for_timeout(600)
            out = output_dir / f"slide_{peca['id']}.png"
            await page.screenshot(path=str(out), clip={"x": 0, "y": 0, "width": width, "height": height})
            feitas.add(peca["id"])
            estado["feitas"] = sorted(feitas)
            _gravar_checkpoint(checkpoint_path, estado)
            print(f"  ok slide_{peca['id']}.png (checkpoint gravado)")

        await browser.close()

    return len(feitas), len(pendentes)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--spec", required=True, type=Path)
    ap.add_argument("--output", required=True, type=Path)
    ap.add_argument("--checkpoint", required=True, type=Path)
    ap.add_argument("--width", type=int, default=WIDTH)
    ap.add_argument("--height", type=int, default=HEIGHT)
    args = ap.parse_args()

    pecas = json.loads(args.spec.read_text(encoding="utf-8"))
    total, novas = asyncio.run(renderiza_lote(pecas, args.output, args.checkpoint, args.width, args.height))
    print(f"\nLote concluido: {total} peca(s) no total, {novas} renderizada(s) agora.")


if __name__ == "__main__":
    main()
