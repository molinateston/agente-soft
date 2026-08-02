METODO HEADLINES (absorvido de soft-conteudo-headlines)
========================================================

Escreve a HEADLINE/gancho/abertura/capa/manchete/titulo isolada.

CANONE POR GATILHO (6 familias)
-------------------------------
1. RECOMPENSA - beneficio direto ("Como X sem Y", "O jeito de Z
   em N dias").
2. MISTERIO - abre loop ("O que ninguem te contou sobre X",
   "Por que N% falha em Y").
3. CRENCA - subverte doutrina ("Voce nao precisa de X pra
   conseguir Y", "Metodo N esta morto").
4. DISRUPCAO - anti-consenso ("O oposto de X funciona melhor",
   "Pare de fazer Y").
5. POPULARIDADE - prova social/tendencia ("O que N faz e voce
   ainda nao", "A briga do momento entre X e Y").
6. RECONHECIMENTO - avatar se ve ("Se voce X, isso e pra voce",
   "Voce nao esta sozinho no Y").

GRAMATICA DE SLOTS
------------------
Cada familia tem 8-10 formulas base. Cada formula tem SLOTS
{beneficio} {objecao} {avatar} {numero} {periodo} {inimigo}.
Slots sao preenchidos com Mapa de Municao (verbatim + tese +
oferta em jogo).

TETO POR DESTINO
----------------
- Capa de carrossel: 60 caracteres, 6-8 palavras.
- Gancho falado de reel 3s: 8-10 palavras.
- Titulo YouTube: 60 caracteres.
- Assunto de e-mail: 35-45 caracteres.
- Manchete de landing: 90 caracteres, 2 linhas.
- Banner de anuncio: 40 caracteres, 1 linha.

MODO BANCO vs MODO PONTUAL
--------------------------
BANCO: matriz 6 familias x 8 formulas x 3-5 headlines cada =
minimo 144 headlines. Entrega .md organizado por familia,
marcada por destino.

PONTUAL: 5-10 headlines afiadas pra UMA peca especifica. Cada
uma com 1 linha de racional (por que ancora). Marca top 3.

GATE ESPECIFICO (soma do gate universal + estes)
------------------------------------------------
- Standalone: se explica sem contexto do post.
- Verbo transitivo com objeto nomeado na mesma frase (nao
  "aprenda a escalar" solto, e "aprenda a escalar seu ticket
  medio").
- Palavra-senha entre aspas se usa jargao proprio.
- Teto de caracteres CONTADO (rodar wc -m).
- CTA de beneficio, nao de acao vazia.

REFERENCIAS DA SKILL ORIGINAL (preservadas)
-------------------------------------------
- ~/.claude/skills/soft-conteudo-headlines/references/templates.md
- ~/.claude/skills/soft-conteudo-headlines/references/mineracao-benchmark.md
- ~/.claude/skills/soft-conteudo-headlines/references/subcanones-formato.md
- ~/.claude/skills/soft-conteudo-headlines/references/regua-final.md
- ~/.claude/skills/soft-conteudo-headlines/references/destaque-em-accent.md
- ~/.claude/skills/soft-conteudo-headlines/references/dispositivos-de-frase.md
- ~/.claude/skills/soft-conteudo-headlines/references/multiplicacao-por-tipo-de-lista.md
- ~/.claude/skills/soft-conteudo-headlines/references/modo-input-livre.md
- ~/.claude/skills/soft-conteudo-headlines/references/amplificadores.md
- ~/.claude/skills/soft-conteudo-headlines/references/criterios-v2.md
- ~/.claude/skills/soft-conteudo-headlines/references/comandos-rapidos.md

SCRIPT DE LINT (mantido no path antigo)
---------------------------------------
python3 ~/.claude/skills/soft-critico-copy/scripts/lint_copy.py <arquivo>
