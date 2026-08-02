#!/usr/bin/env python3
"""
ocr_check.py -- regra dura "print ilegivel nao vira prova" (metodo do
Augusto) em codigo. Roda o tesseract (OCR) numa imagem de print/prova
e recusa se nao conseguir ler numero nenhum -- se o OCR nao le, a
frase que promete "olha o numero" nao sustenta.

Uso:
    python3 ocr_check.py /caminho/print-da-prova.png
    -> imprime o texto lido e sai 0 se achou pelo menos 1 numero de
       2+ digitos, sai 1 (REPROVADO) se nao achou nenhum.
"""
import re
import subprocess
import sys
from pathlib import Path


def ler_texto(caminho_imagem):
    """Chama o binario tesseract direto (sem pytesseract, que nao esta
    instalado). Devolve o texto lido, string vazia se falhar."""
    try:
        r = subprocess.run(
            ["tesseract", str(caminho_imagem), "stdout", "--psm", "6"],
            capture_output=True, text=True, timeout=30,
        )
        return r.stdout.strip()
    except (FileNotFoundError, subprocess.TimeoutExpired):
        return ""


def tem_numero_legivel(texto, minimo_digitos=2):
    """Pelo menos um numero de 2+ digitos no texto lido conta como
    'numero legivel'. Serve pra R$, %, quantidade -- qualquer prova
    numerica que a peca vai exibir."""
    return bool(re.search(rf"\d{{{minimo_digitos},}}", texto))


def _cli(caminho):
    p = Path(caminho)
    if not p.exists():
        print(f"ERRO: arquivo nao existe: {caminho}")
        return 2
    texto = ler_texto(p)
    print(f"Texto lido pelo OCR:\n---\n{texto}\n---")
    if tem_numero_legivel(texto):
        print("OK -- pelo menos um numero de 2+ digitos legivel. Prova pode entrar.")
        return 0
    print("REPROVADO -- OCR nao leu nenhum numero de 2+ digitos. Print ilegivel nao vira prova.")
    return 1


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("uso: python3 ocr_check.py <caminho-da-imagem>")
        sys.exit(2)
    sys.exit(_cli(sys.argv[1]))
