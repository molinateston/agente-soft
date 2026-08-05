#!/usr/bin/env python3
"""
lint_copy.py — gate de COPY em código (anti-IA / anti-voz Soft).

Automatiza o "CTRL+F cada padrão" do filtro-anti-ia/padroes-banidos.md: escaneia
um texto e sinaliza o que cheira a IA. Antes era prosa que o agente varria no
olho (e esquecia); aqui é código que roda igual em toda execução. Sem dependência
externa — roda em qualquer ambiente onde o bot rode.

USO:
    python3 scripts/lint_copy.py peca.txt          # linta um arquivo, exit 1 se HARD
    echo "texto..." | python3 scripts/lint_copy.py - # linta stdin
    python3 scripts/lint_copy.py                    # self-test

HARD (exit 1, zero tolerância): em-dash e a família "travar".
WARN (não bloqueia): padrões que valem no máximo 1x/peça — o agente decide
reescrever. A lista vem fiel do padroes-banidos.md; o que não dá pra detectar
em código sem falso-positivo (tricolon, simetria, abstrato-virando-promessa)
continua no olho, via teste-voz-alta.md e teste-construtivo.md.
"""
import sys
import re

# ── HARD: bloqueia o export/entrega ──────────────────────────────────────────
HARD = [
    (re.compile(r'—'),
     'EM-DASH (U+2014) banido zero-tolerancia; troque por ponto ou hifen comum. En-dash de faixa numerica (10-20) nao conta.'),
    (re.compile(
        r'\b(trava|travar|travas|travam|travou|travaram|travando|travado|'
        r'travada|travados|travadas|travamento|destrava|destravar|destravam|'
        r'destravou|destravado|destravando)\b', re.I),
     'familia "travar" (anti-voz Soft; use emperrar/empacar/parar/freio/amarra; '
     'excecao so em citacao literal do cliente entre aspas)'),
    # Dupla negação paralela de IA: "Não é X. Não é Y." / "Não é falta de A. Não é falta de B."
    (re.compile(
        r'n[aã]o\s+(?:é|foi|era)\s+[^.!?\n]{1,90}[.!?]\s+'
        r'n[aã]o\s+(?:é|foi|era)\b',
        re.I),
     'dupla "Nao e X. Nao e Y." (antitese paralela classica de IA; diga o que E, sem empilhar negacao)'),
    # "Não é." pelado + virada ("Não é. Falta…" / "Não é. É…")
    (re.compile(r'n[aã]o\s+é\.\s+(?:É|Falta|Faltou|Sobrou)\b', re.I),
     '"Nao e." pelado + virada (molde de IA; complete a frase sem o truque)'),
    # Antítese-nominal telegráfica → HARD (antes era WARN). Mesma régua: polos de 1 palavra,
    # clause-anchored. Fala real do Léo com sujeito/verbo ou cauda de +1 palavra escapa.
    (re.compile(
        r'(?:(?<=[.!?])\s+|^)\s*(?:isso\s+)?'
        r'(?:n[aã]o\s+(?:é|foi)\s+[\wáéíóúâêôãõç]+\s*,\s*(?:é|foi)\s+[\wáéíóúâêôãõç]+'
        r'|é\s+[\wáéíóúâêôãõç]+\s*,\s*n[aã]o\s+[\wáéíóúâêôãõç]+)\s*[.!?]',
        re.I | re.M),
     'antitese-nominal telegrafica ("Nao e X, e Y" / "Isso e conta, nao sorte") — banida; '
     'reescreva com sujeito/cena (ex.: "vender nao e convencer, e conduzir" passa)'),
    # "não é X. É Y." com polos curtos (1–3 palavras) colados
    (re.compile(
        r'n[aã]o\s+(?:é|foi)\s+[\wáéíóúâêôãõç]+(?:\s+[\wáéíóúâêôãõç]+){0,2}\s*[.]\s*'
        r'(?:É|Foi)\s+[\wáéíóúâêôãõç]+(?:\s+[\wáéíóúâêôãõç]+){0,2}\s*[.!?]',
        re.I),
     'molde "Nao e X. E Y." (nao e isso, e aquilo) — banido; afirme o que e sem o espelho'),
    (re.compile(r'n[aã]o\s+é\s+sobre\s+.{1,40}?[,.]?\s*é\s+sobre\b', re.I),
     'molde "nao e sobre X, e sobre Y" (fechamento generico de coach/IA)'),
    # Muleta de carrossel: empurra o sentido pro "próximo slide" (a seta já existe)
    (re.compile(
        r'(?:'
        r'(?:aparece|continua|segue|vem|explica|revela|mostra|entende|descobre)'
        r'\s+(?:no|na|o|a)\s+pr[oó]xim[oa]\b'
        r'|pr[oó]xim[oa]\s+slide\b'
        r'|no\s+pr[oó]ximo\s*(?:[.]|$)'
        r'|veja\s+(?:a\s+seguir|mais\s+abaixo|o\s+pr[oó]ximo)'
        r'|arrasta(?:r)?\s+(?:pro|para\s+o|pro)\s+lado'
        r'|desliza(?:r)?\s+(?:pro|para\s+o)'
        r'|\bswipe\b'
        r'|o\s+motivo\s+n[aã]o\s+é\s+o\s+que\s+parece'
        r'|n[aã]o\s+é\s+o\s+que\s+parece'
        r')',
        re.I),
     'muleta de swipe/proximo-slide (contexto fora do slide; a seta ja basta — feche a tensao AQUI)'),
    # Personificação Soft Soft (Léo 13/jul): caixa/renda/algoritmo/mês/janela com verbo de humano
    (re.compile(
        r'(?:'
        r'(?:o\s+)?caixa\s+(?:ainda\s+)?'
        r'(?:pergunta|pede|sente|exige|seca|errou)'
        r'|(?:o\s+)?caixa\s+(?:voltar\s+a\s+andar|some\s+com\s+voc[eê]|anda\s+sozinho)'
        r'|\brenda\s+pede\b'
        r'|\balgoritmo\s+come\b'
        r'|\bfeed\s+(?:come|comem)\b'
        r'|\bm[eê]s\s+(?:errou|erra)\b'
        r'|\bjanela\s+(?:errou|erra)\b'
        r')',
        re.I),
     'personificacao Soft Soft (caixa/renda/algoritmo/feed/mes/janela com verbo de humano; '
     'troque por entrada/extrato/alcance/voce)'),
    (re.compile(
        r'(?:influencer|personagem)\s+d[ae]\s+(?:sua\s+|minha\s+|tua\s+)?pr[oó]pria\s+vida',
        re.I),
     'figura-muleta "influencer/personagem da propria vida" (banida pelo dono 15/jul: abstracao '
     'que nao vira cena + reciclada no lote; use a CENA concreta: "gravar story todo dia", '
     '"aparecer o tempo inteiro", "misturar familia e trabalho no feed")'),
]

# ── WARN: revisar (cada um vale no máx 1x/peça) ───────────────────────────────
WARN = [
    (re.compile(r'\b(outrossim|ademais|por conseguinte|vale ressaltar|'
                r'convém notar|sem mais delongas|em suma)\b', re.I),
     'conectivo formal de IA'),
    (re.compile(r'(a verdade é que|o segredo está em|o que ninguém te conta|'
                r'a questão é a seguinte|vou te contar uma coisa|aqui vai o detalhe)', re.I),
     'frase-emoldura de revelação'),
    (re.compile(r'\b(revolucion\w+|redefin\w+|desbloqu\w+|potencializ\w+|'
                r'alavanc\w+|amplific\w+|maximiz\w+|transcend\w+)\b', re.I),
     'verbo de transformação genérico (use concreto: resolve/tira/muda/faz)'),
    (re.compile(r'(pulo do gato|muda o jogo|aqui mora o segredo|isso muda tudo|'
                r'game ?changer)', re.I),
     'frase dramática clichê'),
    (re.compile(r'(imagine só|você já parou pra pensar|já se perguntou|'
                r'e se eu te dissesse)', re.I),
     'abertura banida'),
    (re.compile(r'(espero que tenha ajudado|compartilhe se concorda|comenta aí|'
                r'marca aquele amigo|bora pra cima)', re.I),
     'fechamento que implora engajamento'),
    (re.compile(r'[✨\U0001F680\U0001F4AF\U0001F3AF\U0001F525]'),
     'emoji decorativo (✨🚀💯🎯🔥)'),
]

# ── COUNT: warn quando excede o limite por peça ───────────────────────────────
COUNT = [
    (re.compile(r'\bliteralmente\b', re.I), 1, '"literalmente"'),
    (re.compile(r'\babsolutamente\b', re.I), 1, '"absolutamente"'),
    (re.compile(r'\bverdadeir[oa]s?\b', re.I), 1, '"verdadeiro/a"'),
]


def lint(text):
    """Retorna (hard, warn): listas de (label, trecho)."""
    hard, warn = [], []
    for rx, label in HARD:
        hits = rx.findall(text)
        if hits:
            ex = hits[0] if isinstance(hits[0], str) else hits[0][0]
            hard.append((label, f'{len(hits)}x (ex: "{ex}")'))
    for rx, label in WARN:
        seen = set()
        for m in rx.finditer(text):
            g = m.group(0).lower()
            if g not in seen:
                seen.add(g)
                warn.append((label, m.group(0)))
    for rx, lim, label in COUNT:
        n = len(rx.findall(text))
        if n > lim:
            warn.append((label, f'{n}x (máx {lim})'))
    return hard, warn


def _run(text):
    hard, warn = lint(text)
    for label, ex in warn:
        print(f'  ⚠ {label}: {ex}')
    if hard:
        print(f'\n✗ COPY REPROVADA ({len(hard)} falha dura):')
        for label, ex in hard:
            print(f'  ✗ {label}: {ex}')
        print('\nReescreva e rode de novo.')
        return 1
    print(f'✓ copy passou no anti-IA em código (0 falhas duras, {len(warn)} aviso(s) pra revisar no olho).')
    return 0


def _self_test():
    dirty = 'O método destrava tudo — literalmente. Isso muda o jogo. ✨'
    h, w = lint(dirty)
    assert any('EM-DASH' in l for l, _ in h), 'devia pegar em-dash'
    assert any('travar' in l for l, _ in h), 'devia pegar destrava'
    assert any('dramática' in l for l, _ in w), 'devia avisar "muda o jogo"'
    clean = 'O lead certo chega já querendo. Você mostra numa aula e ele compra.'
    h2, w2 = lint(clean)
    assert not h2, 'copy limpa não devia ter falha dura'

    def _hard(txt, needle):
        hh, _ = lint(txt)
        return any(needle in l for l, _ in hh)

    # ── antítese / dupla negação: HARD ─────────────────────────────────────────
    assert _hard('Não é falta de talento. Não é falta de esforço.', 'dupla'), 'dupla nao-e'
    assert _hard('Não é. Falta a venda acontecer.', 'pelado'), 'Nao e. pelado'
    assert _hard('Cinco pessoas, três milhões. Isso é conta, não sorte.', 'antitese-nominal'), 'telegráfica'
    assert _hard('Não é sorte, é conta.', 'antitese-nominal'), 'Nao e X, e Y'
    assert _hard('A boa notícia: conduzir não é dom. É estrutura.', 'Nao e X. E Y'), 'Nao e X. E Y'
    assert _hard('E não é sobre o preço, é sobre profundidade.', 'nao e sobre'), 'sobre X/Y'
    assert _hard('Tem colega pior. O motivo aparece no próximo.', 'muleta'), 'proximo-slide'
    assert _hard('O motivo não é o que parece.', 'muleta'), 'nao e o que parece'
    assert _hard('Veja a seguir o mecanismo.', 'muleta'), 'veja a seguir'
    assert _hard('Em julho o caixa ainda pergunta se você vai aparecer.', 'personificacao'), 'caixa pergunta'
    assert _hard('Enquanto a renda pede câmera todo dia, você não tem folga.', 'personificacao'), 'renda pede'
    assert _hard('O algoritmo come. O mês não fecha.', 'personificacao'), 'algoritmo come'

    # ── falas REAIS do Léo: NÃO podem ser HARD de antítese ────────────────────
    reais = [
        'vender não é convencer, é conduzir',
        'educar não vende',
        'eu gerenciei dezenas de milhões, não faturei',
        'O vilão não é você, é a fama que o funil ganhou.',
        'Porque vender não é ensinar, é fazer decidir.',
        'Funil que só vende pra seguidor não é funil, é plateia.',
        'Prospectar 200 pessoas no direct pra marcar 1 reunião não é negócio, é desgaste no dedo.',
        'Não foi convencimento, foi ensino em sequência.',
        'Não é uma fase corrida de trabalho, é o modelo inteiro.',
        'Se a venda para no dia que você para, isso não é negócio, é plantão.',
    ]
    for r in reais:
        hh, _ = lint(r)
        ant = [l for l, _ in hh if 'antitese' in l or 'dupla' in l or 'pelado' in l
               or 'Nao e X' in l or 'nao e sobre' in l]
        assert not ant, f'FALSO-POSITIVO HARD em fala real: {r!r} -> {ant}'

    print('lint_copy.py self-test OK — HARD (em-dash, travar, dupla nao-e, antitese, '
          'nao-e-sobre, muleta, personificacao) + falas REAIS do Léo passam limpas.')
    print('uso: python3 scripts/lint_copy.py peca.txt   |   echo "..." | python3 scripts/lint_copy.py -')


if __name__ == '__main__':
    if len(sys.argv) >= 2 and sys.argv[1] not in ('--self-test', '--selftest', '--test'):
        arg = sys.argv[1]
        txt = sys.stdin.read() if arg == '-' else open(arg, encoding='utf-8').read()
        sys.exit(_run(txt))
    _self_test()
