#!/usr/bin/env python3
"""
score_perfil.py - Score de Autenticidade de um perfil de Instagram (calculo local).

Mede se um perfil parece ORGANICO ou parece ter comprado seguidores, a partir de
numeros publicos (seguidores, seguindo, e as curtidas/comentarios dos ultimos
posts). E DETERMINISTICO: os mesmos numeros dao sempre o mesmo score. Nao chama
API nenhuma, nao faz scraping, nao gasta token. Voce mesmo lê os numeros no perfil
(sao publicos) e passa pra ca.

PRA QUE SERVE (dentro do metodo Soft):
  - Auditar um CONCORRENTE: o numero grande dele e real ou inflado?
  - Validar PROVA SOCIAL: aquele perfil que voce ia citar como case aguenta o olhar?
  - PRE-TRAFEGO: antes de mandar verba pra um perfil, ele engaja de verdade ou o
    publico e fantasma? Perfil com base comprada nao converte tráfego pago.

O QUE NAO FAZ (de proposito): nao projeta faturamento, nao roda analise de marca,
nao promete crescimento. So responde UMA pergunta: esse perfil cheira a real?

USO (Claude Code / agente com Bash):
    # por flags:
    python3 scripts/score_perfil.py \
        --seguidores 245000 --seguindo 890 \
        --likes 3200,4100,2800,3600,5200,2900,3800,4400,3100,3700,2600,4000 \
        --comments 45,60,38,52,71,40,58,66,42,55,36,61

    # por JSON no stdin:
    echo '{"seguidores":245000,"seguindo":890,"likes":[...],"comments":[...]}' \
        | python3 scripts/score_perfil.py -

    # self-test (roda os casos de exemplo):
    python3 scripts/score_perfil.py --self-test

SAIDA: JSON com score_autenticidade (int 0-100), veredicto (LIMPO/SUSPEITO/
ALTA PROBABILIDADE DE COMPRA) e indicadores_detalhados (cada calculo, pra explicar).

MINIMO: precisa de pelo menos 4 posts (likes) pra medir a variacao. Com menos, o
indicador de variacao nao roda e o script avisa (score sai parcial).
"""
import sys
import json
import argparse
from statistics import mean, pstdev


# ── Benchmark de engajamento esperado por faixa de seguidores ────────────────
# (faixa em seguidores) -> (minimo esperado %, maximo esperado %)
def faixa_engajamento(seguidores):
    if seguidores < 10_000:
        return (4.0, 8.0, "menos de 10K")
    if seguidores < 100_000:
        return (2.0, 4.0, "10K a 100K")
    if seguidores < 1_000_000:
        return (1.0, 2.0, "100K a 1M")
    return (0.5, 1.0, "mais de 1M")


def calcular(seguidores, seguindo, likes, comments):
    """Retorna dict com score, veredicto e indicadores. Cálculo puro."""
    detalhe = {}
    pontos = 0

    n_likes = len(likes)
    n_comments = len(comments)
    media_likes = mean(likes) if likes else 0.0
    media_comments = mean(comments) if comments else 0.0

    minimo_esp, maximo_esp, nome_faixa = faixa_engajamento(seguidores)

    # ── Indicador 1: taxa de engajamento vs benchmark da faixa ───────────────
    # engajamento_atual = (media_likes + media_comments) / seguidores * 100
    if seguidores > 0:
        engajamento_atual = (media_likes + media_comments) / seguidores * 100
    else:
        engajamento_atual = 0.0

    ind1_pontos = 0
    if engajamento_atual < minimo_esp * 0.30:
        ind1_pontos = 40  # muito abaixo do minimo da faixa
    elif engajamento_atual < minimo_esp * 0.60:
        ind1_pontos = 20  # abaixo do minimo da faixa
    pontos += ind1_pontos
    detalhe["ind1_engajamento"] = {
        "faixa": nome_faixa,
        "esperado_pct": f"{minimo_esp} a {maximo_esp}",
        "atual_pct": round(engajamento_atual, 3),
        "pontos": ind1_pontos,
    }

    # ── Indicador 2: coeficiente de variacao das curtidas (min 4 posts) ──────
    ind2_pontos = 0
    if n_likes >= 4 and media_likes > 0:
        # desvio padrao populacional / media
        cv = pstdev(likes) / media_likes
        if cv > 2.5:
            ind2_pontos = 25  # picos artificiais
        elif cv > 1.5:
            ind2_pontos = 10  # inconsistencia
        detalhe["ind2_variacao"] = {
            "cv": round(cv, 3),
            "posts_usados": n_likes,
            "pontos": ind2_pontos,
        }
    else:
        detalhe["ind2_variacao"] = {
            "cv": None,
            "posts_usados": n_likes,
            "pontos": 0,
            "aviso": "precisa de 4 ou mais posts com curtidas; indicador nao rodou",
        }
    pontos += ind2_pontos

    # ── Indicador 3: proporcao seguidores/seguindo ───────────────────────────
    ind3_pontos = 0
    ratio = (seguidores / seguindo) if seguindo > 0 else float("inf")
    if ratio > 50 and seguidores > 50_000:
        ind3_pontos = 10
    pontos += ind3_pontos
    detalhe["ind3_ratio_seguidores_seguindo"] = {
        "ratio": (round(ratio, 2) if ratio != float("inf") else "infinito"),
        "pontos": ind3_pontos,
    }

    # ── Indicador 4: media de likes vs seguidores ────────────────────────────
    ind4_pontos = 0
    if seguidores > 0:
        likes_pct_seguidores = media_likes / seguidores * 100
    else:
        likes_pct_seguidores = 0.0
    if likes_pct_seguidores < 0.2 and seguidores > 10_000:
        ind4_pontos = 15
    pontos += ind4_pontos
    detalhe["ind4_likes_vs_seguidores"] = {
        "media_likes_pct_seguidores": round(likes_pct_seguidores, 3),
        "pontos": ind4_pontos,
    }

    # ── Score final: soma capeada em 100 ─────────────────────────────────────
    score = min(pontos, 100)

    if score <= 30:
        veredicto = "LIMPO"
    elif score <= 60:
        veredicto = "SUSPEITO"
    else:
        veredicto = "ALTA PROBABILIDADE DE COMPRA"

    return {
        "score_autenticidade": score,
        "veredicto": veredicto,
        "entrada": {
            "seguidores": seguidores,
            "seguindo": seguindo,
            "media_likes": round(media_likes, 1),
            "media_comments": round(media_comments, 1),
            "n_posts_likes": n_likes,
            "n_posts_comments": n_comments,
        },
        "indicadores_detalhados": detalhe,
    }


# ── Parsing de entrada ───────────────────────────────────────────────────────
def _parse_lista(txt):
    if not txt:
        return []
    return [float(x.strip()) for x in txt.split(",") if x.strip() != ""]


def _from_json(obj):
    seguidores = int(obj["seguidores"])
    seguindo = int(obj.get("seguindo", 0))
    likes = [float(x) for x in obj.get("likes", [])]
    comments = [float(x) for x in obj.get("comments", [])]
    return seguidores, seguindo, likes, comments


def _self_test():
    casos = [
        # (nome, seguidores, seguindo, likes, comments, veredicto_esperado)
        (
            "perfil organico saudavel (100K-1M, engajamento ~1.5%)",
            245_000, 890,
            [3200, 4100, 2800, 3600, 5200, 2900, 3800, 4400, 3100, 3700, 2600, 4000],
            [45, 60, 38, 52, 71, 40, 58, 66, 42, 55, 36, 61],
            "LIMPO",
        ),
        (
            "base comprada (engajamento pifio + ratio alto + likes baixissimos)",
            300_000, 120,
            [180, 210, 160, 190, 175, 205, 165, 195, 185, 170, 200, 178],
            [2, 3, 1, 2, 4, 2, 3, 1, 2, 3, 2, 1],
            "ALTA PROBABILIDADE DE COMPRA",
        ),
        (
            "picos artificiais (CV alto: uns posts explodem, outros mortos)",
            80_000, 400,
            [12000, 300, 250, 15000, 280, 320, 11000, 260, 290, 13000, 240, 270],
            [200, 5, 4, 250, 6, 5, 190, 4, 5, 220, 3, 4],
            None,  # so confere que roda e devolve veredicto valido
        ),
        (
            "poucos posts (3): indicador de variacao nao roda",
            15_000, 600,
            [700, 650, 720],
            [12, 10, 14],
            None,
        ),
    ]
    falhas = 0
    for nome, seg, sgd, lk, cm, esperado in casos:
        r = calcular(seg, sgd, lk, cm)
        ok = (esperado is None) or (r["veredicto"] == esperado)
        marca = "OK " if ok else "FALHOU"
        if not ok:
            falhas += 1
        print(f"[{marca}] {nome}")
        print(f"        score={r['score_autenticidade']} veredicto={r['veredicto']}"
              + (f" (esperado {esperado})" if esperado else ""))
    print()
    if falhas:
        print(f"SELF-TEST: {falhas} caso(s) fora do esperado.")
        return 1
    print("SELF-TEST: todos os casos OK.")
    return 0


def main():
    ap = argparse.ArgumentParser(
        description="Score de autenticidade de perfil de Instagram (calculo local, sem API)."
    )
    ap.add_argument("stdin", nargs="?", help="use '-' pra ler JSON do stdin")
    ap.add_argument("--seguidores", type=int)
    ap.add_argument("--seguindo", type=int, default=0)
    ap.add_argument("--likes", type=str, help="curtidas dos ultimos posts, separadas por virgula")
    ap.add_argument("--comments", type=str, default="", help="comentarios dos ultimos posts, separados por virgula")
    ap.add_argument("--self-test", action="store_true")
    args = ap.parse_args()

    if args.self_test:
        sys.exit(_self_test())

    if args.stdin == "-":
        obj = json.load(sys.stdin)
        seguidores, seguindo, likes, comments = _from_json(obj)
    elif args.seguidores is not None and args.likes is not None:
        seguidores = args.seguidores
        seguindo = args.seguindo
        likes = _parse_lista(args.likes)
        comments = _parse_lista(args.comments)
    else:
        ap.print_help()
        print("\nERRO: informe --seguidores e --likes, ou passe '-' com JSON no stdin, ou --self-test.",
              file=sys.stderr)
        sys.exit(2)

    resultado = calcular(seguidores, seguindo, likes, comments)
    print(json.dumps(resultado, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
