# Padroes ESTRUTURAIS de IA (o que o lint nao pega)

O lint pega palavra e simbolo: em-dash, familia banida, cliche,
verbo generico, molde de antitese. Isso e lexical. Roda em codigo,
e barato, ja esta feito. Nao repita esse trabalho no olho.

Esta regua e a outra metade: o texto pode ter zero palavra proibida
e ainda assim cheirar a maquina, porque o problema esta na FORMA da
frase, nao nas palavras dela. Nenhum destes 12 padroes da pra pegar
em regex sem encher de falso-positivo. Todos sao pegos lendo.

Como usar: leia a peca uma vez so procurando FORMA. Ignore o
sentido. Se dois ou mais padroes aparecem na mesma peca, reprova
mesmo com lint limpo: e escrita de maquina disfarcada de copy boa.

Formato de cada padrao: nome, como reconhecer, exemplo ruim curto,
versao consertada.


## 1 · Simetria de frase

Como reconhecer: duas frases seguidas com o mesmo numero de partes
e o mesmo ritmo. Bate igual quando voce le em voz alta. Humano
escreve torto, alterna frase de 4 palavras com frase de 14.

RUIM: "O metodo organiza a rotina. O sistema sustenta o resultado."
BOM: "O metodo organiza a rotina. E ai o resultado para de depender
de voce estar inspirado naquele dia."

Teste: conte as palavras das frases vizinhas. Se as tres ultimas
frases tem tamanho parecido, quebre uma no meio ou funda duas.


## 2 · Tripla (tricolon)

Como reconhecer: item, item e item. Tres exemplos, tres adjetivos,
tres beneficios. IA adora tres porque soa completo. A terceira parte
quase sempre nao acrescenta fato nenhum, so fecha o ritmo.

RUIM: "Voce ganha clareza, previsibilidade e liberdade."
BOM: "Voce sabe quanto entra mes que vem."

Teste: corte o terceiro item. A frase perdeu informacao ou so perdeu
musica? Se so perdeu musica, ele nao devia estar la. Tripla so fica
quando os 3 sao FATOS diferentes (ex.: "3 calls, 1 grupo, 90 dias").


## 3 · Paralelismo mecanico

Como reconhecer: tres ou mais frases seguidas comecando com a mesma
palavra ou a mesma classe gramatical. Anafora de discurso politico.
Em copy vira ladainha e o leitor pula o bloco inteiro.

RUIM: "Voce tenta postar mais. Voce tenta gravar melhor. Voce tenta
aparecer todo dia."
BOM: "Voce ja tentou postar mais. Nao mudou nada, entao voce achou
que era a qualidade do video, comprou microfone e continuou igual."

Teste: leia so a primeira palavra de cada frase do paragrafo. Se
repete, quebre o padrao na segunda ocorrencia.


## 4 · Adjetivo em par

Como reconhecer: dois adjetivos ligados por "e" onde um sozinho ja
dizia tudo. IA empilha sinonimo pra soar denso.

RUIM: "Um processo simples e direto."
BOM: "Um processo de 4 passos."

Teste: em cada par de adjetivos, apague um. Se o sentido nao muda,
o par era enchimento. Melhor ainda: troque os dois por um numero ou
um substantivo concreto.


## 5 · Abertura por definicao

Como reconhecer: a peca comeca explicando o que uma coisa e, em vez
de mostrar a coisa acontecendo. Verbo "e" ou "significa" na primeira
frase. Cheiro de verbete.

RUIM: "Posicionamento e a forma como o mercado enxerga voce."
BOM: "Voce cobra 5 mil e o cliente pergunta se faz por 2. O cara ao
lado cobra 20 e ninguem discute."

Teste: a primeira frase tem sujeito humano fazendo alguma coisa? Se
tem verbo de ligacao ligando conceito a conceito, refaz com cena.


## 6 · Fechamento que resume

Como reconhecer: o ultimo paragrafo repete em outras palavras o que
o texto ja disse. Comeca com "no fim", "resumindo", "ou seja", "a
grande sacada e". Nao entrega informacao nova, so faz um lacinho.

RUIM: "No fim, tudo se resume a ter um sistema que funciona sem
voce."
BOM: "Domingo que vem voce olha o extrato e sabe de onde veio cada
entrada."

Teste: apague o ultimo paragrafo. O leitor perdeu alguma coisa? Se
nao perdeu, ele nao devia existir. Fechamento bom carrega fato novo,
consequencia ou o convite. Nunca recapitulacao.


## 7 · Transicao generica

Como reconhecer: frase-ponte que so existe pra ligar dois blocos e
nao carrega conteudo. "E aqui esta o ponto." "Mas vamos por partes."
"Antes de continuar, entenda isto." Custa 6 palavras e paga zero.

RUIM: "E e aqui que mora a diferenca."
BOM: (apaga a frase e emenda os dois blocos direto)

Teste: toda frase que nao afirma um fato e candidata a corte. Se a
frase existe pra anunciar a proxima, a proxima se anuncia sozinha.


## 8 · Escalada de tres tempos

Como reconhecer: o paragrafo sobe em degraus regulares, curto, medio,
longo, e fecha com a frase de efeito isolada na linha. E a estrutura
de post de LinkedIn que a IA aprendeu de cor.

RUIM: "Comeca pequeno. Cresce com consistencia. Vira um negocio que
sustenta a sua vida inteira sem voce estar presente. / Simples
assim."
BOM: "Ele acordava 5h30 e gravava. Fez isso 400 dias. Perdeu duas
viagens e brigou com a mulher por causa disso."

Teste: se o paragrafo termina com uma frase de 2-3 palavras sozinha
na linha, apague ela. Quase sempre o texto melhora.


## 9 · Numero redondo sem fonte

Como reconhecer: numeros que existem pra dar autoridade, nao pra
informar. 90%, 3x, 10 vezes mais, 80/20. Redondos e sem origem. O
verbatim (filtro 4) pega o numero inventado sobre o negocio; este
aqui pega o numero decorativo, que nao afirma nada sobre ninguem.

RUIM: "90% dos negocios digitais falham por falta de processo."
BOM: "Dos 12 clientes que entraram em janeiro, 9 nao tinham onde
anotar o lead que chegava."

Teste: o numero veio de uma contagem que alguem fez? Se voce nao
consegue dizer quem contou e quando, corta ou troca por um numero
seu, mesmo que menor.


## 10 · Hedge (a copy que se protege)

Como reconhecer: "pode ajudar a", "tende a", "muitas vezes", "em
geral", "de certa forma". A IA hedgea por treino. Copy que hedgea
perde a autoridade na hora, porque quem sabe afirma.

RUIM: "Esse ajuste pode ajudar a melhorar bastante seus resultados."
BOM: "Esse ajuste tira a reuniao de qualificacao da sua agenda."

Teste: procure todo adverbio de atenuacao. Ou afirma, ou nao diz.
Meio-termo nao vende e ainda soa juridico.


## 11 · Cena sem corpo

Como reconhecer: a peca fala de sentimento e de estado, mas ninguem
faz nada em lugar nenhum. Sem hora, sem objeto, sem pessoa. Texto de
IA flutua porque ele nao tem memoria de mundo fisico.

RUIM: "A sensacao de estar sempre correndo atras e exaustiva."
BOM: "Sao 22h, voce ta editando o reel de amanha e o prato do jantar
ta do lado do notebook esfriando."

Teste: da pra filmar essa frase? Se nao da pra apontar uma camera
pro que esta escrito, e abstracao. Uma cena filmavel por bloco, no
minimo.


## 12 · Densidade uniforme

Como reconhecer: todo paragrafo com o mesmo peso, o mesmo tamanho,
a mesma temperatura. Nada e mais importante que o resto. Texto
humano tem pico: uma frase carrega a peca e o resto serve ela.

RUIM: seis paragrafos de 3 linhas cada, todos explicando algo.
BOM: cinco paragrafos de apoio e um de uma linha so, que e a tese.

Teste: aponte a frase que voce quer que ele lembre amanha. Ela esta
graficamente destacada, curta e sozinha? Se voce nao consegue
apontar UMA, a peca nao tem tese, tem assunto.


## Regua de reprovacao

- 0 padroes: passa no filtro estrutural.
- 1 padrao: aponta, sugere reescrita, nao reprova sozinho.
- 2 ou mais: REPROVA a peca, mesmo com lint exit 0. Cheiro de
  maquina nunca vem de um padrao so, vem do conjunto.
- Padrao 5 (abertura por definicao) em headline ou capa: reprova
  sozinho. O primeiro segundo nao tem margem.
