#!/usr/bin/env python3
"""
identidade.py -- le a identidade visual de um cliente a partir de um JSON,
em vez da skill perguntar cor/fonte toda vez ou ter cor chumbada no codigo.

Uso como lib:
    from identidade import carregar_identidade
    id_ = carregar_identidade("/tmp/designer-fabrica/assets/identidade-exemplo.json")
    id_["accent"]  # "#4ade80"

Uso como CLI (valida um JSON e lista campos faltando):
    python3 identidade.py /caminho/identidade-cliente.json
"""
import json
import sys
from pathlib import Path

CAMPOS_OBRIGATORIOS = [
    "familia_base", "fundo", "accent", "fonte_titulo", "fonte_corpo", "cantos",
]

DEFAULT_NEGATIVO = "#E63946"


def carregar_identidade(caminho):
    """Le o JSON e devolve um dict. Campo obrigatorio ausente ou null vira
    excecao com o NOME do campo que falta -- a skill pergunta so aquele,
    nunca inventa um valor plausivel."""
    p = Path(caminho)
    if not p.exists():
        raise FileNotFoundError(f"identidade nao encontrada: {caminho}")
    dados = json.loads(p.read_text(encoding="utf-8"))
    faltando = [c for c in CAMPOS_OBRIGATORIOS if not dados.get(c)]
    if faltando:
        raise ValueError(f"identidade incompleta, faltam: {', '.join(faltando)}")
    dados.setdefault("negativo", DEFAULT_NEGATIVO)
    dados.setdefault("accent_hover", dados["accent"])
    dados.setdefault("fonte_label", dados["fonte_corpo"])
    dados.setdefault("hairlines", False)
    dados.setdefault("logo_path", None)
    dados.setdefault("tag_topo", "")
    dados.setdefault("texto_botao_padrao", "Saiba mais")
    dados.setdefault("combo_export", "inter_bruto")
    return dados


def _cli(caminho):
    try:
        id_ = carregar_identidade(caminho)
    except (FileNotFoundError, ValueError) as e:
        print(f"REPROVADO: {e}")
        return 1
    print(f"OK -- identidade de {id_.get('cliente', '(sem nome)')} carregada:")
    for k, v in id_.items():
        print(f"  {k}: {v}")
    return 0


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("uso: python3 identidade.py <caminho-do-json>")
        sys.exit(2)
    sys.exit(_cli(sys.argv[1]))
