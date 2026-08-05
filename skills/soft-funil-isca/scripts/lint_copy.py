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
    # Antítese-nominal telegráfica de EFEITO (fecho de slogan): a CLÁUSULA INTEIRA
    # é "Não é X, é Y." / "Não foi X, foi Y." / "(Isso) é X, não Y." com os DOIS polos
    # em UMA palavra só e nada mais — o mic-drop de IA. Clause-anchored (início de
    # linha ou depois de . ! ?) e polos de 1 palavra: por isso a fala REAL do Léo
    # escapa (ela carrega SUJEITO/VERBO antes do "não é" — "vender não é convencer,
    # é conduzir", "o vilão não é você, é a fama..." — ou uma cauda de +1 palavra —
    # "não foi convencimento, foi ensino em sequência"). Só o fecho pelado é pego.
    (re.compile(
        r'(?:(?<=[.!?])\s+|^)\s*(?:isso\s+)?'
        r'(?:n[aã]o\s+(?:é|foi)\s+[\wáéíóúâêôãõç]+\s*,\s*(?:é|foi)\s+[\wáéíóúâêôãõç]+'
        r'|é\s+[\wáéíóúâêôãõç]+\s*,\s*n[aã]o\s+[\wáéíóúâêôãõç]+)\s*[.!?]',
        re.I | re.M),
     'antitese-nominal telegrafica de efeito (fecho de slogan tipo "Isso e conta, nao sorte."; '
     'a fala real dele carrega sujeito/verbo ou cauda concreta — aqui e so o mic-drop pelado, reescreva)'),
    # Molde de coach/IA "não é sobre X, é sobre Y".
    (re.compile(r'n[aã]o\s+é\s+sobre\s+.{1,40}?[,.]?\s*é\s+sobre\b', re.I),
     'molde "nao e sobre X, e sobre Y" (fechamento generico de coach/IA)'),
]

# ── COUNT: warn quando excede o limite por peça ───────────────────────────────
COUNT = [
    (re.compile(r'\bliteralmente\b', re.I), 1, '"literalmente"'),
    (re.compile(r'\babsolutamente\b', re.I), 1, '"absolutamente"'),
    (re.compile(r'\bverdadeir[oa]s?\b', re.I), 1, '"verdadeiro/a"'),
    (re.compile(r'não é .{2,40}?[,.]\s*é\b', re.I), 2, 'estrutura "Não é X. É Y." em série'),
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

    # ── antítese-nominal telegráfica: DEVE avisar (WARN) ──────────────────────
    def _warned_antitese(txt):
        _, ww = lint(txt)
        return any('antitese-nominal' in l for l, _ in ww)
    def _warned_sobre(txt):
        _, ww = lint(txt)
        return any('nao e sobre' in l for l, _ in ww)
    fakes = [
        'Cinco pessoas, três milhões. Isso é conta, não sorte.',  # a que o Léo pegou
        'Não é sorte, é conta.',
        'Não foi sorte, foi conta.',
        'É conta, não torcida.',
        'Foi essa função. Não foi sorte, foi conta. O mesmo caminho fez outro.',
    ]
    for f in fakes:
        assert _warned_antitese(f), f'devia avisar antitese-nominal em: {f!r}'
    assert _warned_sobre('E não é sobre o preço, é sobre profundidade.'), 'devia avisar molde "nao e sobre"'

    # ── falas REAIS do Léo: NÃO podem ser pegas (nem WARN antítese) ───────────
    reais = [
        'vender não é convencer, é conduzir',
        'educar não vende',
        'eu gerenciei R$46 milhões, não faturei',
        'O vilão não é você, é a fama que o funil ganhou.',
        'Porque vender não é ensinar, é fazer decidir.',
        'Funil que só vende pra seguidor não é funil, é plateia.',
        'Prospectar 200 pessoas no direct pra marcar 1 reunião não é negócio, é desgaste no dedo.',
        'Não foi convencimento, foi ensino em sequência.',
        'Não é uma fase corrida de trabalho, é o modelo inteiro.',
        'Se a venda para no dia que você para, isso não é negócio, é plantão.',
    ]
    for r in reais:
        assert not _warned_antitese(r), f'FALSO-POSITIVO: pegou fala real do Léo: {r!r}'

    print('lint_copy.py self-test OK — HARD (em-dash + travar), WARN (dramática, '
          'antítese-nominal telegráfica, molde "não é sobre") e as falas REAIS do Léo passam limpas.')
    print('uso: python3 scripts/lint_copy.py peca.txt   |   echo "..." | python3 scripts/lint_copy.py -')


if __name__ == '__main__':
    if len(sys.argv) >= 2 and sys.argv[1] not in ('--self-test', '--selftest', '--test'):
        arg = sys.argv[1]
        txt = sys.stdin.read() if arg == '-' else open(arg, encoding='utf-8').read()
        sys.exit(_run(txt))
    _self_test()
