#!/usr/bin/env python3
"""
mosaico.py -- junta todos os PNGs de um lote numa unica folha de
contato, em grade. Erro de layout nao se enxerga peca a peca, se
enxerga quando uma destoa no meio das outras (metodo do Augusto).

Uso:
    python3 mosaico.py --dir /caminho/com/slides --output /caminho/mosaico.png
"""
import argparse
from pathlib import Path
from PIL import Image


def monta_mosaico(pasta, saida, colunas=None, largura_col=270):
    arquivos = sorted(Path(pasta).glob("slide_*.png"))
    if not arquivos:
        raise FileNotFoundError(f"nenhum slide_*.png em {pasta}")

    n = len(arquivos)
    if colunas is None:
        colunas = min(5, n)
    linhas = (n + colunas - 1) // colunas

    primeira = Image.open(arquivos[0])
    prop = primeira.height / primeira.width
    altura_col = int(largura_col * prop)
    margem = 8
    legenda_h = 28

    cel_w = largura_col + margem * 2
    cel_h = altura_col + margem * 2 + legenda_h

    folha = Image.new("RGB", (cel_w * colunas, cel_h * linhas), "#333333")

    from PIL import ImageDraw
    draw = ImageDraw.Draw(folha)

    for i, arq in enumerate(arquivos):
        col = i % colunas
        lin = i // colunas
        img = Image.open(arq).convert("RGB").resize((largura_col, altura_col))
        x = col * cel_w + margem
        y = lin * cel_h + margem
        folha.paste(img, (x, y))
        draw.text((x, y + altura_col + 4), arq.stem, fill="#FFFFFF")

    Path(saida).parent.mkdir(parents=True, exist_ok=True)
    folha.save(saida)
    return str(saida), n


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dir", required=True, type=Path)
    ap.add_argument("--output", required=True, type=Path)
    ap.add_argument("--colunas", type=int, default=None)
    args = ap.parse_args()
    caminho, n = monta_mosaico(args.dir, args.output, args.colunas)
    print(f"Mosaico com {n} peca(s) salvo em: {caminho}")


if __name__ == "__main__":
    main()
