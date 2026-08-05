---
name: soft-critico-copy
description: "GATE UNIVERSAL de critica de copy do metodo Soft, invocado por TODA skill prestes a entregar linha publica pro dono (headline, capa, corpo de carrossel, script de reel, stories, carta, landing, isca, sequencia de WhatsApp ou e-mail, script de SDR e closer, bio, oferta). NAO gera copy, CRITICA copy pronta em 5 filtros na ordem: (1) CUB (Confusao, Unacreditavel, Boring), (2) Estrutura-mae (diagnostico, nomeacao, polaridade, nova interpretacao, consequencia, movimento), (3) Anti-IA lexical rodando o lint bundled (falha dura em travessao longo e palavra proibida, aviso em conectivo formal, verbo generico e clichê), (3-B) Anti-IA estrutural no olho, os 12 padroes mecanicos que denunciam maquina e nenhum regex pega (simetria de frase, tripla, paralelismo, adjetivo em par, abertura por definicao, fechamento que resume, transicao generica, escalada de tres tempos, numero redondo sem fonte, hedge, cena sem corpo, densidade uniforme), (4) Verbatim (a linha tem lastro no material canonico e nao inventa fato do negocio). Output: falhas por filtro OU passou nos 4, sempre com sugestao de reescrita curta. A skill chamadora corrige e re-invoca ate passar. Use SEMPRE que uma skill de copy Soft for entregar linha final pro dono. NAO substitui julgamento editorial, NAO roda em brief interno, NAO gera copy nova."
---

============================================================
SOFT-CRITICO-COPY · GATE UNIVERSAL DE COPY DO ARSENAL SOFT
============================================================

O que faz
---------

Recebe UMA peca de copy pronta + o tipo de peca, e devolve
feedback estruturado em 5 filtros na ordem fixa (o 3 tem duas
camadas, a lexical em codigo e a estrutural no olho). Skill
chamadora usa o feedback pra corrigir e re-invocar ate passar.

A chave de saida continua passou_nos_4 por compatibilidade:
10 skills chamadoras grepam esse nome. Ela significa passou em
TODOS os filtros, incluindo o 3-B. Nao renomeie sem atualizar
as chamadoras juntas.

NAO gera copy nova. NAO substitui o dono. E o gate que segura
a saida da copy fraca pro dono ler.

Quem invoca
-----------

Toda skill de arsenal Soft que produz linha publica pro dono:

- soft-conteudo (headline, carrossel, reel, stories, planner,
  multiplataforma, impulsionar, designer legendas)
- soft-funil-carta (mini-carta, carta longa)
- soft-funil-landing (todos os 12 objetivos de landing)
- soft-funil-isca (copy da isca + landing dela)
- soft-funil-miniwebinar (roteiro + slides + pagina)
- soft-webinar (aula + oferta + pitch + páginas cadastro/obrigado/checkout + WhatsApp/e-mail + chat)
- soft-vendas-sdr (scripts DM, follow-up, qualificacao)
- soft-vendas-closer (fechamento, objecao, pos-venda)
- soft-plano-posicionamento (dominio, tese, headlines)
- soft-voz-leo-molina (peca canonica sob voz do dono)
- soft-apostila (headline de capitulo, gancho de secao)

Como e invocada
---------------

Assinatura funcional (o que a chamadora passa):

- texto: string com a copy pronta (a linha, o slide, o
  paragrafo, a peca inteira)
- tipo_de_peca: um de {headline, capa, corpo, slide,
  script_reel, sequencia_stories, carta, landing_bloco,
  landing_completa, isca_copy, oferta, whatsapp, email,
  script_sdr, script_closer, pos_venda, bio, cta}
- contexto (opcional): tese-mae, avatar, verbatim_ref (path do
  arquivo canonico usado como lastro)

Como o Claude na skill chamadora aciona: invoca o Skill
soft-critico-copy passando o texto e o tipo. Salva a copy num
arquivo temporario em /tmp/copy-<slug>-<epoch>.txt antes de
invocar (pra rodar o lint por arquivo).

Output padronizado
------------------

Uma de duas formas:

FORMATO 1, PASSOU:
  passou_nos_4: sim
  resumo: 1 linha em que a peca acerta

FORMATO 2, REPROVADA:
  passou_nos_4: nao
  falhas:
    - filtro: CUB | Estrutura-mae | Anti-IA | Anti-IA
              estrutural | Verbatim
      dimensao: (ex: C de Confusao, U de Unacreditavel, B de
                 Boring, Diagnostico ausente, HARD em-dash,
                 WARN cliche, tripla, hedge, cena sem corpo,
                 sem lastro)
      trecho: "a frase exata que falhou"
      motivo: 1 linha do porque
      sugestao: reescrita curta ja aplicavel (nao generico)

Skill chamadora le, aplica sugestoes, re-invoca. Loop ate
passar.


============================================================
OS 4 FILTROS (ORDEM FIXA)
============================================================

Ordem e fixa. Confusao primeiro (se o dono nao entende, nao
adianta ser cri­vel). Depois Unacreditavel (se nao acredita,
nao adianta ser interessante). Depois Boring (se enjoa,
morreu). Depois Anti-IA em duas camadas, a lexical do lint e
a estrutural no olho (o cheiro de robo). Depois Verbatim (o
lastro na fonte).

------------------------------------------------------------
FILTRO 1 · CUB (Confusao / Unacreditavel / Boring)
------------------------------------------------------------

Destilacao Halbert+Sabri+Harry Dry aplicada no metodo Soft.
Toda copy morre por um destes 3 motivos. Nao tem 4o.

C · Confusao. Exige reler? Tem 2 ideias na mesma frase?
Jargao/rotulo solto? Abstracao que nao vira imagem?

U · Unacreditavel. Promessa grande sem chao ao lado?
Cheira infoproduto? Um estranho acreditaria?

B · Boring. Ja ouviu mil vezes? Amplifica problema obvio no
lugar da virada? Frase-ponte no lugar de tensao?

Referencia detalhada, exemplos fraco vs forte, teste das 3
perguntas (visualizo/provo/so eu diria): references/_regua-cub.md

------------------------------------------------------------
FILTRO 2 · Estrutura-mae
------------------------------------------------------------

A espinha de toda peca Soft, do reel de 30s a carta de 3
paginas. O que muda entre formatos e o tamanho de cada
parte, nunca a ordem.

  Diagnostico > Nomeacao > Polaridade > Nova interpretacao
  > Consequencia > Movimento

Diagnostico: olha de cima e nomeia o que o leitor vive.
Nomeacao: batiza o que ele sente e nunca soube dizer.
Polaridade: dois lados, uma tensao.
Nova interpretacao: renomeia a causa, derruba o que ele
tentou.
Consequencia: ficar como esta custa caro.
Movimento: convite como continuacao logica, nao pedido.

Filtro checa se a peca tem os 6 movimentos ou tem furo. Peca
curta comprime, nao pula. Furo mais comum: pular Nomeacao
(vira aula) ou pular Polaridade (vira monologo).

Referencia detalhada, exemplo comprimido reel, exemplo
carrossel, exemplo carta: references/_estrutura-mae.md

------------------------------------------------------------
FILTRO 3 · Anti-IA
------------------------------------------------------------

Roda o script Python bundled na propria skill:

  python3 ~/.claude/skills/soft-critico-copy/scripts/lint_copy.py <arquivo>

O script tem 3 camadas:

HARD (exit 1, zero tolerancia): em-dash U+2014 e a familia
palavra da familia T-word (use empacar/emperrar) (regra dura do Leo, memory
feedback-doc-ascii-diagramacao).

WARN (nao bloqueia, avisa): conectivo formal de IA
(outrossim/ademais/vale ressaltar), frase-emoldura de
revelacao (a verdade e/o segredo/o que ninguem te conta),
verbo generico (alavancar/potencializar/transcender), cliche
(pulo do gato/muda o jogo/game changer), abertura banida
(imagine so/ja se perguntou), fechamento que implora
engajamento (comenta ai/marca aquele amigo), emoji
decorativo, antitese-nominal telegrafica (Isso e X, nao Y),
molde de negacao-sobre (nega um tema e troca por outro
na mesma frase).

COUNT (warn se excede): literalmente (1x/peca),
absolutamente (1x), verdadeiro/a (1x), antitese em espelho
(nega um polo e afirma o outro) em serie (2x).

Zero HARD e obrigatorio pra passar no filtro. WARN e log pro
dono revisar no olho, nao bloqueia sozinho, mas se acumula 3+
WARN diferentes, o filtro considera reprovado (sinal de
copy-de-IA disfarcada).

Referencia detalhada dos padroes banidos, exemplos que
escapam falso-positivo (fala real do dono com negacao-sobre
carregando sujeito+verbo): o proprio codigo em
scripts/lint_copy.py comentado.

------------------------------------------------------------
FILTRO 3-B · Anti-IA ESTRUTURAL (no olho, o lint nao pega)
------------------------------------------------------------

O filtro 3 e lexical: pega palavra e simbolo, roda em codigo,
ja esta feito. Nao refaca no olho o que o script ja fez.

Este aqui e a outra metade. A peca pode ter lint exit 0 e
mesmo assim cheirar a maquina, porque o problema esta na FORMA
da frase e nao nas palavras dela. Nenhum destes 12 padroes da
pra pegar em regex sem encher de falso-positivo, entao e
leitura mesmo, uma passada so olhando forma e ignorando
sentido.

Os 12 padroes:

 1. Simetria de frase (frases vizinhas do mesmo tamanho e
    mesmo ritmo)
 2. Tripla (item, item e item, com o terceiro sem fato novo)
 3. Paralelismo mecanico (3+ frases abrindo com a mesma
    palavra)
 4. Adjetivo em par (dois sinonimos onde um bastava)
 5. Abertura por definicao (comeca explicando o conceito em
    vez de mostrar a cena)
 6. Fechamento que resume (ultimo paragrafo repete o texto e
    nao entrega fato novo)
 7. Transicao generica (frase-ponte que so anuncia a proxima)
 8. Escalada de tres tempos (curto, medio, longo, mais frase
    de efeito sozinha na linha)
 9. Numero redondo sem fonte (90%, 3x, decorativo, ninguem
    contou)
10. Hedge (pode ajudar a, tende a, em geral: copy que se
    protege perde autoridade)
11. Cena sem corpo (sentimento e estado, sem hora, objeto ou
    pessoa; nada filmavel)
12. Densidade uniforme (todo paragrafo com o mesmo peso, sem
    uma frase que carrega a peca)

Regua de reprovacao: 1 padrao aponta e sugere, nao reprova
sozinho. 2 ou mais REPROVA mesmo com lint exit 0, porque
cheiro de maquina vem do conjunto e nao de um padrao so.
Excecao: padrao 5 em headline ou capa reprova sozinho, o
primeiro segundo nao tem margem.

Cada padrao com exemplo ruim curto, versao consertada e o
teste de reconhecimento:
references/_padroes-estruturais-ia.md

------------------------------------------------------------
FILTRO 4 · Verbatim
------------------------------------------------------------

A copy Soft NAO inventa fato do negocio. Toda tese, prova,
nome de mecanismo, numero, historia tem lastro em fonte
canonica do dono. Sem lastro, e chute que evapora.

Fontes canonicas obrigatorias, na ordem:

1. aula-webinar-AAA-gravada.md (verbatim real do dono na
   aula do webinar, ~1h49, com transcricao literal). Path:
   /home/cloud/.openclaw/brain/conteudo/aula-webinar-AAA-gravada.md
   (ou o path equivalente no cliente)
2. NARRATIVA-CANONICA.md (a fonte da verdade da tese-mae).
   Path: /home/cloud/.openclaw/brain/NARRATIVA-CANONICA.md
3. CANONICO.md, ARSENAL-DE-DESEJOS.md, PROMESSA-MAXIMA.md,
   BANCO-DE-MATERIA-PRIMA.md (camadas)
4. plano-de-posicionamento do dono (se ja existe, path
   informado pela skill chamadora)

Filtro checa: cada afirmacao grande da copy (numero,
mecanismo, historia, promessa) tem grep positivo em pelo
menos uma das fontes? Se nao, aponta como falta de lastro e
sugere: (a) trocar por afirmacao ancorada, ou (b) buscar
lastro na fonte antes de manter.

Executivo: em vez de rodar grep de toda palavra, o filtro
extrai os 2-3 termos-chave carregados da peca (nome de
mecanismo, numero, prova) e grepa esses. Se algum falha,
reprova.

Referencia detalhada, lista canonica das provas validadas do
dono padrao (dezenas de milhoes geridos, 8 digitos em 2 anos
com time enxuto, 1 ano sem postar) e como outros donos
declaram as suas: references/_verbatim-fontes.md


============================================================
EXECUCAO INTERNA (COMO O CLAUDE OPERA A SKILL)
============================================================

Passo 1. Salva o texto num arquivo /tmp/copy-critica-<epoch>.txt

Passo 2. Roda o lint (filtro 3) em background:

  python3 ~/.claude/skills/soft-critico-copy/scripts/lint_copy.py \
    /tmp/copy-critica-<epoch>.txt 2>&1

Guarda a saida. HARD > exit 1. WARN > exit 0 mas anota.

Passo 3. Le o texto (o Claude, no olho, com references/ como
regua) e aplica os filtros 1 (CUB), 2 (Estrutura-mae), 3-B
(Anti-IA estrutural) e 4 (Verbatim).

Passo 3-B. A passada do filtro 3-B e separada das outras: le
de novo olhando so FORMA de frase, ignorando o sentido, com
references/_padroes-estruturais-ia.md do lado. Conta quantos
dos 12 padroes aparecem. 2 ou mais reprova mesmo que o lint
do passo 2 tenha dado exit 0.

Passo 4. Para o filtro 4, se contexto trouxer path de verbatim
alternativo (cliente do LEON tem plano-de-posicionamento
proprio), usa esse. Se nao trouxer, usa o verbatim padrao
de references/_verbatim-fontes.md como default (dono padrao).

Passo 5. Monta o output no formato padronizado. Se passou nos
4, retorna FORMATO 1. Se falhou em qualquer, retorna FORMATO 2
com falhas listadas e sugestoes especificas.

Passo 6. Skill chamadora corrige e re-invoca com o texto
atualizado. Loop ate passar. Se depois de 3 iteracoes ainda
reprova, escala pro dono ("copy nao esta passando no gate, veja
as falhas e ajuste voce ou peca ajuste especifico").


============================================================
INTEGRACAO POR TIPO DE PECA (QUAL FILTRO PESA MAIS)
============================================================

Todas as pecas passam em todos os filtros. Estes sao os pesos
diferenciados por tipo, pra o Claude focar onde a peca mais
falha na pratica:

- headline / capa: CUB (B de Boring pesa dobrado, e o teste
  do dedo no feed) + Verbatim (afirmacao grande sem chao ao
  lado morre no 1o segundo).
- corpo carrossel: Estrutura-mae (tem que ter arco de 7-10
  slides com os 6 movimentos) + Anti-IA (WARN em cliche
  destroi peca curta).
- script reel: CUB (C de Confusao, ele nao pausa pra reler)
  + Estrutura-mae comprimida.
- sequencia stories: Estrutura-mae (cada sequencia:
  observacao > interpretacao > tese) + CUB (B de Boring, ele
  fura em 1 tap).
- carta / landing: Estrutura-mae COMPLETA (arco de identifica-
  cao > dor > falha das solucoes > nova visao > mecanismo >
  transformacao > prova > entrada) + CUB (U de Unacreditavel
  vale dobrado, toda promessa grande com prova ao lado) +
  Verbatim (todas as provas ancoradas).
- oferta: CUB (U de Unacreditavel, cada entregavel mata uma
  objecao) + Verbatim (garantia real, precificacao ancorada
  em referencia).
- WhatsApp / e-mail: CUB (C de Confusao, mensagem se le em 3s
  no celular) + Anti-IA (WARN em frase-ponte destroi
  intimidade).
- script SDR: CUB (C de Confusao, ele responde em 30s ou nao
  responde) + Estrutura-mae (Diagnostico > Nova interpretacao
  > Movimento na primeira mensagem).
- script closer: Estrutura-mae (Diagnostico > Consequencia >
  Movimento no fechamento) + CUB (U de Unacreditavel na
  garantia).


============================================================
CONTRA-EXEMPLOS (O QUE A SKILL NAO FAZ)
============================================================

- NAO gera copy nova. Se receber texto vazio, retorna erro
  "sem texto pra criticar".
- NAO roda em brief interno, sistema, doc de estudo, plano
  de acao, doc do brain. Roda so em linha publica pro dono.
- NAO substitui judgment editorial do dono (ele pode
  aprovar copy que warn como cliche se for uma escolha de
  voz, mas HARD do lint sempre bloqueia).
- NAO faz research nem consulta external. Todo o lastro vem
  de arquivo do brain do dono.
- NAO altera o texto entregue. So devolve feedback. Aplicar
  a sugestao e trabalho da skill chamadora ou do dono.


============================================================
REGRAS TRANSVERSAIS
============================================================

1) ZERO DEFAULT DO LEO. Naming do produto do Leo (Operacao
   SOFT, Mesa de Operacao, Call de Arquitetura, Consultoria
   Soft) so entra como REFERENCIA marcada "(exemplo, nao
   copia)" nas references/. Skill e generica pra qualquer
   cliente do LEON.

2) FONTE VERBATIM CONFIGURAVEL. Skill chamadora passa
   verbatim_ref no contexto. Default e o brain do Leo, mas
   se o cliente tem brain proprio, esse e o path.

3) OUTPUT ESTRUTURADO E CURTO. Feedback nao vira ensaio.
   Cada falha em 4 linhas: filtro, dimensao, trecho, motivo,
   sugestao. Skill chamadora precisa parsear rapido.

4) ANTI-IA EM DOBRO. Este SKILL.md tambem passa no proprio
   lint (o gate passa no gate). Zero HARD, zero travessao,
   zero T-word, zero cliche.

5) LOOP LIMITADO. 3 iteracoes maximas. Depois escala pro
   dono, nao insiste automatico ao infinito.


============================================================
FONTES CANONICAS DO METODO SOFT (REFERENCIAS DA SKILL)
============================================================

- /home/cloud/.claude/skills/_plugin/guia/GUIA-COPY-APLICACAO.md
  (fonte da verdade do metodo de copy Soft, CUB + estrutura-
  mae + 8 leis + revisao em camadas + peca por peca +
  checklist final)
- /home/cloud/.claude/skills/_plugin/guia/CODIGO-DE-ESCRITA.md
  (a lei, o codigo por tras do guia)
- /home/cloud/.claude/skills/_plugin/guia/03-identidade-voz.md
  (elementos de voz Soft)
- /home/cloud/.openclaw/brain/conteudo/aula-webinar-AAA-gravada.md
  (verbatim canonico do Leo, fonte 1 do Verbatim filtro)
- /home/cloud/.openclaw/brain/NARRATIVA-CANONICA.md
  (fonte da tese-mae)

Este SKILL.md sintetiza. Detalhe operacional dos filtros em
references/_regua-cub.md, _estrutura-mae.md,
_padroes-estruturais-ia.md, _verbatim-fontes.md.

------------------------------------------------------------
GATE DE FRASE (embutido no gate universal, aplicar sempre)
------------------------------------------------------------

> 🔴 **REGRA DURA DE FRASE , "TODA FRASE SE EXPLICA SOZINHA"** (vale em TUDO que esta skill escrever pro público)
>
> Copy Soft é **frase que gera IMAGEM na cabeça de quem lê frio**. Não pode assumir que o leitor já sabe o assunto, o produto, a categoria, o método, o mecanismo ou o antes/depois. Toda frase que você escrever precisa se sustentar sozinha, sem depender do slide anterior, da bio, do título, ou do que "obviamente é". Frase curta que "soa punchy" e deixa o entendimento pro contexto é reprovada.
>
> **Teste antes de aprovar CADA frase:** "se essa frase caísse solta no scroll de uma pessoa que nunca ouviu falar do produto, ela entenderia O QUÊ + PRA QUEM + O RESULTADO CONCRETO?" Se não, REESCREVE nomeando explícito: qual é o objeto ("dieta", "calorias", "conta de calorias", não só "conta"), qual é o público ("mulher que já tentou emagrecer de todas as formas", não só "mulher que já tentou de tudo"), qual é o resultado concreto ("para de recomeçar a dieta", não só "para de recomeçar).
>
> **Ex reprovado →** *"Você come o que ama, um agente faz a conta do seu dia e você para de recomeçar."*
> **Ex aprovado →** *"Você passa a comer o que ama, um agente faz a conta de calorias do seu dia inteiro e não te deixa escorregar, e você para de recomeçar a dieta toda vez do zero."*
>
> Adicionar as 3-5 palavras que ancoram o contexto é MELHOR que a frase curta ambígua. Copy boa não é curta , é **inequívoca e imagética**. Frase que precisa de contexto pra ser entendida = frase quebrada, refaz.

> **REGRA-IRMÃ · "NENHUM VERBO ÓRFÃO" (cérebro preguiçoso do leitor):** o leitor tem cérebro preguiçoso e NÃO vai completar sua frase pra você. Todo verbo precisa vir com seu OBJETO NOMEADO na mesma frase, senão vira frase média. Verbos-armadilha que exigem complemento explícito: cortar (**cortar o quê?**), recomeçar (**recomeçar o quê?**), parar (**parar de quê?**), mudar, melhorar, escapar, largar, controlar, ajustar, resolver, virar, transformar. Sempre nomeia o objeto concreto (arroz, pão, doce, dieta, treino, agenda, cliente, valor), NUNCA deixa aberto.
>
> **Ex ✅ BOA (verbos ancorados + objetos nomeados):** *"Você come arroz, pão e o que ama, e uma ferramenta minha conta as calorias de tudo por você todo dia, pra você emagrecer sem viver de dieta."* , "come" tem objeto (arroz, pão), "conta" tem objeto (calorias), "emagrecer" tem contexto ("sem viver de dieta").
>
> **Ex ⚠️ MÉDIA (verbo órfão no fim):** *"…pra você emagrecer comendo o que gosta em vez de cortar."* , "cortar O QUÊ?" ficou pro leitor completar. Cérebro preguiçoso não completa, desiste. Correto: *"…em vez de cortar arroz, pão e doce."*
>
> Antes de aprovar a frase, sublinha mentalmente cada verbo e confere: cada um tem OBJETO nomeado? Não? Nomeia agora.
