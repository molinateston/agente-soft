METODO CARROSSEL (absorvido de soft-conteudo-carrossel)
========================================================

Escreve o CORPO de um carrossel de feed do metodo Soft, da capa
ao CTA, a peca que mais converte no feed.

DEFAULT DE FEED
---------------
"post/publicacao de feed" SEM formato dito = carrossel. So sai
daqui se o pedido nomear reel, stories, ou outra plataforma.

FORMULA 7 (arco APSD comprimido em 7 slides base)
-------------------------------------------------
Slide 1 - CAPA (headline, para o scroll)
Slide 2 - ABRE O LOOP (uma pergunta, uma provocacao, uma
          confissao curta - so pra ele continuar arrastando)
Slide 3 - SINTOMA (o que o avatar VIVE, com verbatim)
Slide 4 - CAUSA/INIMIGO (o que causa esse sintoma, nomear o
          inimigo comum quando cabe)
Slide 5 - VIRADA (o mecanismo, a nova interpretacao)
Slide 6 - COMO (passo, exemplo, prova em 1-2 linhas)
Slide 7 - CTA (o que fazer agora, com beneficio)

Se peca precisa de mais respiro, expande pra 10 slides:
- Sintoma pode virar 2 slides (sintoma + agravamento).
- Como pode virar 2-3 slides (passo 1, passo 2, passo 3).
- Antes do CTA, um slide de prova (case, numero).

UMA TESE POR SLIDE
------------------
Cada slide prova UMA coisa. Nao empilhar 3 ideias no mesmo
slide. Uma frase por linha, no maximo 3 linhas por slide.

GATE ESPECIFICO
---------------
- Densidade: se um slide sai sem perder o arco, esse slide era
  gordura. Corta.
- Standalone: ler o carrossel salteado ainda faz sentido (o
  avatar pula slide).
- Palavra-senha entre aspas.
- Sem "metodo" em carrossel aberto (aparece so no ultimo se o
  CTA e pra saber mais).
- Sem literal-wrong (afirmacao que se ela for testada em
  Google, o dono se envergonha).
- CTA de beneficio explicito (nao "clica no link", e "veja
  como {beneficio} no link da bio").

SISTEMA ANTI-IDIOTA (memoria feedback-carrossel-anti-idiota)
------------------------------------------------------------
8 checkpoints ANTES de entregar carrossel publico:
1. Frase se explica sozinha (leigo entende sem contexto).
2. Verbatim do webinar quando aplicavel (grep no SIA-*, aula
   gravada).
3. Quebras visuais claras (nao 3 slides seguidos com mesma
   estrutura).
4. Sem "metodo" em carrossel aberto (so no ultimo se pertinente).
5. Sem literal-wrong (Google-check).
6. CTA so beneficio.
7. Palavra-senha entre aspas.
8. Lint anti-IA passa (exit 0).

Se 1 dos 8 falha, refaz. Nao entrega meio-torto.

REFERENCIAS DA SKILL ORIGINAL
-----------------------------
- ~/.claude/skills/soft-conteudo-carrossel/references/estrutura-9-slides-feed.md
- ~/.claude/skills/soft-conteudo-carrossel/references/06-carrossel.md
- ~/.claude/skills/soft-conteudo-carrossel/references/estrutura-peca.md
- ~/.claude/skills/soft-conteudo-carrossel/references/camadas-conciencia.md
- ~/.claude/skills/soft-conteudo-carrossel/references/dispositivos-de-frase.md
- ~/.claude/skills/soft-conteudo-carrossel/references/conducao-na-pratica.md
- ~/.claude/skills/soft-conteudo-carrossel/references/modo-construcao.md

ENTREGA
-------
- .md com linha "SLIDE N | <copy do slide>".
- Se dono quer arte, formato-designer com brief pronto (H1 do
  slide, H2 se tem, apoio se tem).


5 REGRAS DE OURO DO CARROSSEL (destiladas 24/07 de ref externa)
================================================================

Origem: carrossel viral do rafaelaraujocn (Sistema de Carrossel
que fura a bolha, 7 passos). Destilado como REFORCO e ADICAO ao
metodo. Duas regras sao BEATS NOVOS obrigatorios, tres reforcam
checkpoints que ja existem.

REGRA 1 (reforco) - A CAPA TEM 1 FUNCAO SO: PARAR O DEDO
--------------------------------------------------------
Nao explica tudo. So faz parar. Tipografia grande, alto
contraste, e UM de tres elementos (nao mistura):
  (a) uma PROMESSA nomeada, ou
  (b) um NUMERO concreto, ou
  (c) uma TENSAO (contradicao, provocacao, dor).

Se a capa nao segura, o resto nem comeca. Capa sem UM desses
tres = capa fraca, refaz.

REGRA 2 (BEAT NOVO OBRIGATORIO) - SLIDE 2 = MOTIVO PRA FICAR
------------------------------------------------------------
Slide 2 nao continua a capa. Slide 2 RESPONDE "por que ficar".
Entrega clareza do que vem: mostra o problema NOMEADO, a
transformacao prometida OU o que esta em jogo se o avatar sair.

Sem esse beat, a curiosidade da capa evapora no slide 3 e o
avatar sai. Slide 2 = contrato de atencao pro resto.

Substitui na Formula 7 o "Slide 2 - ABRE O LOOP" quando o
avatar e MENOS CONSCIENTE (Schwartz 1-2, precisa clareza mais
que provocacao). Loop segue valendo pra avatar MAIS CONSCIENTE
(Schwartz 3-5, ja sabe do problema, aceita provocacao).

Como escolher: se a capa e PROMESSA/NUMERO, slide 2 = motivo.
Se a capa e TENSAO/PROVOCACAO, slide 2 = loop ou motivo (testa).

REGRA 3 (reforco + teste pratico) - CADA SLIDE FUNCIONA SOZINHO
---------------------------------------------------------------
Ja temos "standalone" no gate. O teste pratico agora e:

  TESTE DO PRINT SOLTO: pega qualquer slide do meio, printa
  isolado, mostra pra alguem que nao viu o resto. Se faz
  sentido, passa. Se nao faz, refatora esse slide.

Rodar esse teste em pelo menos 2 slides do meio antes de
entregar. Se um falha, o carrossel inteiro fica fragilizado
(o avatar salta slide, sempre).

REGRA 4 (BEAT NOVO OBRIGATORIO) - UM SLIDE QUE VALE SALVAR
----------------------------------------------------------
Todo carrossel precisa de UM slide que a pessoa quer GUARDAR.
Um de quatro tipos:
  (a) FRAMEWORK visual (fluxo, matriz, arvore)
  (b) CHECKLIST enumerada
  (c) PROMPT pronto pra copiar
  (d) FRASE-ANCORA (aforismo, regra em uma linha)

Esse slide transforma alcance em SALVAMENTO. Salvamento e o
sinal mais forte que o algoritmo le como "vale distribuir mais".
Sem slide-ancora, o carrossel roda menos, mesmo com copy boa.

Onde vai: um dos slides do meio (nao a capa, nao o CTA). Marca
visualmente diferente (borda, box, cor) pra sinalizar "salva".

REGRA 5 (reforco + refinamento) - CTA DA EMOCAO
-----------------------------------------------
Ja temos "CTA de beneficio explicito". Refinamento novo:

  O CTA pedido casa com a EMOCAO que o carrossel gerou.
  Se o conteudo fez o avatar sentir "quero guardar isso",
  pede SALVA. Se fez sentir "conheco alguem que precisa
  disso", pede COMPARTILHA. Se fez sentir "quero opinar",
  pede COMENTA.

Regras firmes:
- UM pedido so. CTA empilhado mata a acao.
- Legenda CONTINUA o post (reforca ideia, da contexto).
  Nao termina com "segue pra mais".
- "Comenta X que te mando no direct" e liberado com a manobra
  meta: confessa a brincadeira na propria copy ("tipo, ta
  tudo aqui no carrossel, mas comenta que empurra"). Sem essa
  confissao, evita, porque promessa nao cumprida queima.

COMO APLICAR NO GATE
--------------------
Adiciona ao SISTEMA ANTI-IDIOTA (os 8 checkpoints):
9. Capa tem UM de (promessa/numero/tensao)? sim/nao.
10. Slide 2 responde "por que ficar"? sim/nao.
11. Teste do print solto em 2 slides do meio? passou/nao.
12. Slide-ancora presente (framework/checklist/prompt/frase)?
    sim/nao.
13. CTA casa com a emocao dominante gerada? sim/nao.

Vira gate 13 checkpoints. Se 1 falha, refaz. Nao entrega
meio-torto.


REGRA CANONICA DE CTA (cravada 24/07 pelo o dono)
===============================================

Divisao dura do CTA em DUAS pecas com funcoes diferentes:

LEGENDA DO POST (curta, so 2 frases)
  Frase 1: a promessa da CAPA do carrossel (repete a headline).
  Frase 2: o CTA comenta (Comenta PALAVRA-SENHA que te mando
           no direct).
  Nada mais. Sem bullets, sem contexto, sem explicacao.

CARD 7 DO CARROSSEL (a promessa em bullets)
  Titulo: nome da oferta/aula.
  Bullets (3-5): o que a aula/oferta ENTREGA (nao o que a
           dor causa; o que o leitor VAI RECEBER).
  CTA: Comenta PALAVRA-SENHA que te mando no direct.

Por que dividido:
  Legenda no feed e vista em 3 seg, so segura scroll com a
  capa+CTA. Bullets da oferta nao cabem la, competem com o
  primeiro slide. Bullets moram no CARD 7, que e onde o leitor
  ja arrastou o carrossel inteiro e ta aberto pra ver "o que
  eu ganho se acessar".

Erro classico (nao repita):
  Enfiar bullets + promessa + confissao meta na legenda. Fica
  denso, mata o clique. Legenda respira, card fecha.
