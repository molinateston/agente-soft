---
name: soft-conteudo
description: "Sistema completo de CONTEUDO Soft Business. UMA skill mae que faz TUDO na ordem certa por Q&A guiado retomavel, do briefing ao artefato final. Cobre 8 formatos: headline/gancho, carrossel, reel, stories, multiplataforma, planner (matriz mensal), impulsionar (trafego pago) e designer (arte/PNG). Atende dono do zero, dono com pecas prontas (importa e pula pergunta ja coberta) e dono retomando plano meio-feito. Sugere 2-3 opcoes por bloco, preview a cada 5 respostas, zero default, e passa tudo copy-facing pelo gate anti-IA. Use quando o pedido cita post, feed, carrossel, reel, video curto, stories, gancho, headline, capa, manchete, adaptar peca, LinkedIn, YouTube, newsletter, ideias de post, matriz de conteudo, planeja meu mes, impulsionar, avalia esse post, arte, PNG, banner, thumbnail. NAO entra em posicionamento nem plano de negocio (soft-plano-*), carta, landing ou isca (soft-funil-*), aula vendedora (soft-webinar-plano), conta Meta (soft-trafego-meta), nem edicao de video (soft-editor-video)."
---

============================================================
SKILL MAE UNICA DO CONTEUDO SOFT
============================================================

O que faz
---------

Conduz o dono de UMA peca de conteudo Soft do briefing ate o
artefato final por Q&A guiado retomavel. Uma pergunta por vez,
bloco por bloco. Cobre 8 formatos como blocos de execucao dentro
da mesma mae. Sai o artefato final pronto pra publicar (copy no
Doc, arte em PNG, ou plano/matriz em Doc, dependendo do formato).

Absorve as 8 skills antigas de conteudo num loop unico:
- soft-conteudo-headlines (gancho/capa/abertura isolada)
- soft-conteudo-carrossel (corpo de feed)
- soft-conteudo-reels (roteiro de video curto)
- soft-conteudo-stories (sequencia de story)
- soft-conteudo-multiplataforma (adaptacao pra outro destino)
- soft-conteudo-planner (matriz mensal de pautas)
- soft-conteudo-impulsionar (decisao de trafego, avaliacao)
- soft-designer (arte visual, PNG, banner, deck)

As antigas viraram referencia interna em references/_metodo-*.md.

Os 3 cenarios que ela atende
----------------------------

1) DO ZERO
   Dono nao tem nada, quer uma peca. Roda o percurso completo do
   formato escolhido (~10 a 25 passos).

2) COM PECAS PRONTAS
   Dono ja tem plano de posicionamento, matriz de pauta,
   headlines aprovadas, oferta, ou peca original pra adaptar. No
   bloco P0 a skill IMPORTA o que ele traz e PULA as perguntas
   cobertas.

3) RETOMANDO
   Dono chamou antes e parou no meio. A skill le
   /tmp/soft-conteudo-<slug>-<epoch>.json e continua exatamente
   de onde parou.


============================================================
REGRAS TRANSVERSAIS DURAS (valem em TODOS os blocos)
============================================================

1) UMA PERGUNTA POR VEZ.
   Nunca despejar 5 perguntas juntas. Nunca continuar antes da
   resposta anterior.

2) SUGERE 2-3 OPCOES depois das perguntas cruas.
   Nunca sugestao unica. As opcoes cruzam a resposta do dono com
   o verbatim/tese/matriz. Ele escolhe, edita, ou pede mais.

3) PREVIEW a cada 5 respostas.
   Bloco curto: "com o que voce me deu ate agora, a peca esta
   assim: [3-4 linhas ou 3 slides amostra]. seguimos?".

4) ZERO DEFAULT DO LEO.
   Exemplo do produto do dono (Operacao SOFT, Mesa de Operacao,
   Call de Arquitetura, Consultoria Soft) so entra como
   REFERENCIA marcada "(exemplo, nao copia)". Naming e tese do
   dono sao SEMPRE abertos.

5) RETOMABILIDADE.
   A cada resposta o state cai em
   /tmp/soft-conteudo-<slug>-<epoch>.json. Se o dono chamar de
   novo, a skill le o state mais recente e pergunta "vi uma peca
   de {data} sobre {tese}. continua ou comeca novo?".

6) ANTI-IA em tudo que sai.
   Zero travessao longo. Zero familia da palavra que comeca com
   T-R-A-V (verbo de emperrar/parar). Zero cliche de IA
   (dicotomia forcada, staccato de 3 frases curtas, chavao do
   tipo "isso vira o jogo", "nao e X, e Y" repetido). Verbatim do
   o dono quando aplicavel (referencia em
   brain/conteudo/aula-webinar-AAA-gravada.md). Antes de fechar
   qualquer peca copy-facing, rodar
   python3 ~/.claude/skills/soft-critico-copy/scripts/lint_copy.py
   no trecho.

7) ZERO INVENTAR TESE, OFERTA, PRECO, NUMERO.
   Se o dono nao respondeu, pergunta. Nao chuta big idea, nao
   chuta preco, nao chuta seguidor, nao chuta metrica.

8) ACEITA TEXTO OU AUDIO em qualquer resposta.

9) PULAR = "[A CONFIRMAR]".
   Se o dono digitar "pula" ou "depois", a resposta vira
   [A CONFIRMAR - <bloco>] no state.

10) RESPOSTA RASA = REFAZ A PERGUNTA.
    Se o dono responde em 3 palavras algo que precisa contexto,
    a skill devolve UMA pergunta especifica pra abrir mais.

11) SAIR/PAUSAR SALVA.
    "sai", "pausa", "amanha" -> salva state, avisa o path,
    encerra limpo.

12) NAMING USER-FRIENDLY.
    Nunca dizer "modo carrossel_9_slides" ou "arquetipo storytelling"
    na cara do dono. Internamente e um campo do state, na conversa
    e linguagem de gente.


============================================================
COMO OPERA (o loop)
============================================================

Passo 1 - CHECA state antigo
   Le /tmp/soft-conteudo-*.json (mais recente por epoch). Se
   encontrou, pergunta "vi uma peca de {data} sobre {tese}.
   continua ou comeca novo?".

Passo 2 - M0 IDENTIFICA O FORMATO
   Se o pedido do dono nao ja disse o formato, pergunta.
   Ramifica pra F1-<formato> especifico.

Passo 3 - P0 IMPORTA PECAS PRONTAS
   Checklist de peca previa relevante (posicionamento, matriz,
   headline aprovada, peca original, verbatim).

Passo 4 - F0 CONTEXTO CURTO
   4 a 6 perguntas comuns a todos os formatos (tese, avatar,
   plataforma-alvo, oferta em jogo).

Passo 5 - F1 EXECUCAO DO FORMATO
   Fluxo especifico do formato escolhido em M0. Ver secoes
   FORMATO-* mais abaixo.

Passo 6 - F2 PREVIEW
   Mostra a peca inteira ou o esboco antes de fechar.

Passo 7 - F3 GATE + ENTREGA
   Anti-IA lint + gate CUB (Confusao, Unacreditavel, Boring) +
   as 3 perguntas do gate (se explica sozinha, palavra-senha
   entre aspas, CTA de beneficio). Se passar, entrega. Formato
   de saida depende do formato: copy em Doc/texto,
   plano/matriz em Doc, arte/PNG via soft-designer (bloco
   FORMATO-DESIGNER).


============================================================
M0. IDENTIFICACAO DO FORMATO
============================================================

Se o pedido do dono ja nomeou o formato (ex: "quero um carrossel
sobre X", "faz um reel de Y", "adapta esse post pra LinkedIn"),
a skill PULA a pergunta e vai direto pra F1 do formato.

Se veio aberto ("quero um post", "faz um conteudo pra amanha"),
UMA pergunta:

"que peca voce quer?
- carrossel (post de feed com slides)
- reel (video curto de 1-2 min)
- stories (sequencia de story do dia)
- headline solta (gancho, capa, abertura)
- adaptar peca pronta pra outra plataforma
- matriz de pautas do mes
- decisao de tra{f}ego pago ou avaliacao pre-post
- arte visual (PNG, banner, deck)"

Regra do default de feed: se ele disse "post" ou "publicacao de
feed" sem formato dito, o default e CARROSSEL (a peca que mais
converte no feed hoje).

Salva state.formato = headline|carrossel|reel|stories|multiplataforma|planner|impulsionar|designer.


============================================================
P0. IMPORT DE PECAS PRONTAS
============================================================

UMA pergunta com checklist adaptado ao formato:

"antes de eu perguntar tudo, me diz o que voce ja tem pronto
(marca sim/nao pra cada):

- Plano de posicionamento (tese-mae, avatar, mecanismo)
- Matriz/planner de pauta do mes
- Headline/gancho ja aprovado pra essa peca
- Oferta empacotada (preco, garantia, bonus)
- Verbatim do avatar (frases exatas que ele diz)
- Peca original pra adaptar (so pra multiplataforma)
- Peca antiga pra usar como molde
- Identidade visual da marca (cores, fontes, logo) - so pra
  designer
- Nada, comeco do zero"

Pra cada SIM: pede o input. Salva em state.pecas_prontas.

Nas fases seguintes as perguntas cobertas sao PULADAS.


============================================================
F0. CONTEXTO COMUM (todos os formatos)
============================================================

4 a 6 perguntas cruas, uma por vez. Se pecas_prontas cobre, pula.

F0.1 Quem e voce, em 1 linha (credencial + o que faz).
F0.2 Qual e o produto/oferta em jogo NESSA peca. Se nao vai
     vender nada direto, "nenhum, e conteudo de topo".
F0.3 Qual e a tese-mae ou angulo dessa peca (1 frase).
F0.4 Qual e o avatar-alvo (nivel, dor central em 1 linha).
F0.5 Qual e a plataforma-alvo (Instagram, LinkedIn, TikTok,
     YouTube, Threads, X, newsletter). Se ja veio implicito no
     formato, pula.
F0.6 O que voce quer que o cliente FACA depois de ver essa peca
     (salvar, comentar, chamar na DM, clicar no link, se
     inscrever).

Salva em state.contexto.


============================================================
F1. EXECUCAO DO FORMATO (ramifica)
============================================================

Cada formato tem seu bloco especifico. O detalhe operacional de
cada um esta em references/_metodo-<formato>.md. A logica
abaixo e o resumo do fluxo que a mae roda.


-------------------------------------------------------
FORMATO-HEADLINE (gancho, capa, abertura, manchete)
-------------------------------------------------------
Ver references/_metodo-headlines.md pra canone completo.

STOP antes de escrever qualquer headline: pergunta H1-H5 ao dono,
uma de cada vez. Nao assume avatar, tese nem promessa por default.
So depois das respostas comeca a gerar.

Perguntas cruas (uma por vez):
H1. Pra QUE essa headline vai servir (capa de carrossel, gancho
    falado de reel de 3s, titulo de YouTube, assunto de e-mail,
    manchete de landing, banner de anuncio).
H2. Qual e o TETO de caracteres/palavras do destino (se souber).
    Skill sabe os tetos padrao: capa carrossel 60c, gancho reel
    3s falado 8-10 palavras, titulo YouTube 60c, assunto email
    35-45c.
H3. Qual e a familia do gatilho que combina com essa peca
    (Recompensa, Misterio, Crenca, Disrupcao, Popularidade,
    Reconhecimento)? Se o dono nao sabe, skill sugere 2-3 com
    base no F0.
H4. Modo BANCO (mininimo 50 formulas, 3+ headlines cada) ou
    modo PONTUAL (5-10 opcoes afiadas)?

Gera:
- Se BANCO: matriz cruzando 6 familias x 8-10 formulas cada,
  cada celula com 3-5 headlines ancoradas no verbatim do avatar
  e no Mapa de Municao (state.contexto). Entrega como .md
  organizado por familia.
- Se PONTUAL: 5-10 opcoes com racional curto em 1 linha por
  headline. Passa cada uma pelo gate CUB + as 3 perguntas + teto
  contado. Marca as top 3.

Gate especifico de headline:
- Standalone (se explica sem contexto).
- CUB (nao confusa, nao inacreditavel, nao chata).
- Palavra-senha entre aspas se usa jargao.
- Teto de caracteres contado.
- Zero travessao, zero anti-IA.


-------------------------------------------------------
FORMATO-CARROSSEL (corpo de feed, 7-10 slides)
-------------------------------------------------------
Ver references/_metodo-carrossel.md.

STOP antes de escrever qualquer slide: pergunta C1-C5 ao dono, uma
de cada vez. Nao assume tese, avatar nem CTA por default.

TETO DURO DE SLIDES: minimo 7, maximo 10. Nao existe carrossel de
11, 12 ou 13 slides nesta skill. Se o conteudo nao couber em 10,
a peca esta com mais de uma tese: corta pra UMA tese e o resto
vira outro carrossel. Antes de entregar, CONTA os slides: passou
de 10, refaz.

Se pecas_prontas.headline nao existe, RODA formato-headline
primeiro pra capa (H1=capa carrossel). Se existe, usa.

Perguntas cruas:
C1. Qual e o UM ponto que o carrossel prova/instala (uma tese
    por peca).
C2. Ordem do arco APSD comprimida em 7-10 slides:
    A1 capa (headline), A2 abre loop.
    P3 sintoma (o que o avatar vive).
    P4 causa raiz (o inimigo comum).
    S5 virada (o mecanismo/insight).
    S6 como usar (passo, dica, exemplo).
    S7 prova (case, numero, verbatim).
    D8 pergunta ou provocacao.
    D9 CTA (o que fazer agora).

Skill sugere 2-3 versoes de cada slide, uma tese por slide, uma
frase por linha. Dono edita.

Gate:
- Densidade (nada de slide de recheio).
- As 3 perguntas do gate.
- CUB.
- CTA de beneficio, nao de acao vazia.
- Anti-IA lint.
- Sistema anti-idiota (memoria feedback-carrossel-anti-idiota):
  frase se explica sozinha, verbatim do webinar quando aplicavel,
  quebras visuais claras, sem "metodo" em carrossel aberto, sem
  literal-wrong, palavra-senha entre aspas.

Entrega:
- Texto slide por slide em .md, com linha "SLIDE N | <copy>".
- Se dono quer arte, chama FORMATO-DESIGNER com o brief pronto.


-------------------------------------------------------
FORMATO-REEL (roteiro de video curto)
-------------------------------------------------------
Ver references/_metodo-reels.md.

STOP antes de escrever qualquer linha do roteiro: pergunta R1-R5
ao dono, uma de cada vez. Nao assume duracao, formato de gravacao
nem gancho por default. So depois das respostas comeca o roteiro.

Perguntas cruas:
R1. Qual e a duracao alvo (30s, 60s, 90s, 2min)?
R2. Formato de gravacao (talking-head, walking, tela, mix)?
R3. Qual e o gancho falado nos 3 primeiros segundos (skill puxa
    da headline se existe, senao gera 3 opcoes).
R4. Qual e o arco APSD comprimido pro corpo (P sintoma, S
    virada, D CTA)?
R5. Qual e a acao/CTA final (salvar, comentar, DM, link na
    bio)?

Gera o roteiro em 3 camadas paralelas por bloco:
- FALAR (o audio, o que o apresentador diz).
- MOSTRAR (o que aparece na tela, b-roll, gestos).
- TEXTO NA TELA (overlay, se aplicavel).

Passa pelo gate:
- Verbatim (se puxou de aula gravada, indicar linha).
- As 3 perguntas do gate.
- CUB.
- CTA de beneficio.
- Anti-IA.

Entrega:
- Roteiro em .md com 3 colunas por bloco.
- Se dono quer o video editado, aponta pra soft-editor-video
  (nao entra aqui).


-------------------------------------------------------
FORMATO-STORIES (sequencia de story)
-------------------------------------------------------
Ver references/_metodo-stories.md.

STOP antes de escrever qualquer story: pergunta S1-S5 ao dono, uma
de cada vez. Nao assume quantidade de cards, formato nem CTA por
default. So depois das respostas comeca a sequencia.

Perguntas cruas:
ST1. Qual e o modo:
     - CARO (Caixinha, Alinhamento, Resultado, Oferta) - arco
       diario de 5-8 stories.
     - SEQUENCIA DE VENDA DE 5 DIAS - arco de 3-5 stories por
       dia, 5 dias, ate a oferta.
     - STORY INFILTRADO - 2-3 stories entre outros stories, sem
       parecer venda.
     - CAIXINHA ESTRATEGICA - stories que abrem caixinha de
       pergunta pra gerar prova social e insight.
ST2. Qual e a headline/abertura (skill puxa se existe).
ST3. Qual e o destino (link, DM, pergunta, salvar).

Gera frame a frame, cada story com:
- IMAGEM/VIDEO (o que aparece).
- TEXTO (overlay, curto).
- STICKER (enquete, caixinha, contagem, quiz, link).

Gate:
- Verbatim real.
- As 3 perguntas.
- CUB.
- CTA com destino.
- Anti-IA.

Entrega em .md com frame por linha.


-------------------------------------------------------
FORMATO-MULTIPLATAFORMA (adaptacao de peca pronta)
-------------------------------------------------------
Ver references/_metodo-multiplataforma.md.

STOP antes de adaptar: confirma com o dono qual e a peca de origem
e quais plataformas de destino. Nao assume lista de plataformas
por default.

Requisito: pecas_prontas.peca_original OU o dono cola.

Perguntas cruas:
MP1. Cola a peca original (link, texto, PDF).
MP2. Qual e o destino:
     - LinkedIn (formato longo, tom profissional).
     - X/Threads (formato thread curto).
     - YouTube (video longo).
     - Newsletter/e-mail.
     - Substack.
     - PDF/Notion.
     - Comentario fixado embaixo do post (humanizador, 1a
       resposta do criador).
MP3. Quer manter a mesma tese ou reangular?

Engenharia reversa: skill extrai os 5 papeis da peca original
(gancho, tese, prova, virada, CTA) e o nucleo Soft (verbatim,
mecanismo, ancora). Re-renderiza no idioma nativo do destino.

Se destino e NEWSLETTER/EMAIL sem ancora clara, ativa modo
ARQUETIPO (protocolo, historia, dica rapida, curadoria) -
detalhe em _metodo-multiplataforma.md.

Se destino e COMENTARIO FIXADO, gera 2-3 opcoes de comentario
humanizador (confissao curta que casa com a tese + brief de
imagem comica pra soft-designer).

Gate:
- Nucleo Soft preservado (a tese nao diluiu).
- Idioma nativo do destino.
- As 3 perguntas.
- CUB + anti-IA.


-------------------------------------------------------
FORMATO-PLANNER (matriz mensal de pautas)
-------------------------------------------------------
Ver references/_metodo-planner.md.

STOP antes de montar a matriz: pergunta o periodo, a frequencia e
os pilares ao dono, um de cada vez. Nao assume mes, cadencia nem
quantidade de pautas por default.

UMA pergunta: modo MATRIZ (ideacao em lote, 30+ pautas cruzando
pilares x formatos) OU modo RADAR (tendencias datadas da web
AGORA)?

Modo MATRIZ:
PL1. Quais sao os pilares de conteudo do dono (3-5 temas-mae)?
     Se ele nao sabe, skill puxa do plano-posicionamento
     importado em P0, senao gera 3-5 sugestoes cruzando com F0.
PL2. Quantos posts/semana o dono quer publicar? Skill sugere 3
     ou 5 por semana como default.
PL3. Distribuicao de formato preferida (default: 60% carrossel,
     30% reel, 10% stories).

Gera matriz-calendario: 4 semanas x N posts/semana, cada celula
uma manchete ancorada no verbatim/tese. Cada celula ja tem 1
linha de racional (por que essa pauta cabe nesse pilar nessa
semana).

Modo RADAR:
Roda WebSearch por tendencias no nicho do dono (F0.3, F0.4).
Devolve top 5-10 tendencias quentes com o ANGULO Soft (como o
dono pode entrar nessa tendencia sem virar noticia).

Cada celula da matriz vira input pra FORMATO-HEADLINE quando o
dono escolher UMA pauta pra executar.

Entrega em .md, tabela por semana.


-------------------------------------------------------
FORMATO-IMPULSIONAR (decisao de trafego, avaliacao pre-post)
-------------------------------------------------------
Ver references/_metodo-impulsionar.md.

STOP antes de recomendar verba: pergunta qual peca, qual objetivo
e qual o teto de investimento. Nao assume valor por default.

UMA pergunta: modo DECIDIR (planejar/diagnosticar) ou modo
AVALIAR (dar nota numa peca antes de publicar)?

Modo DECIDIR:
IM1. Qual e a verba mensal disponivel pra impulsionar?
IM2. Qual e o objetivo (encher webinar, gerar seguidor certo,
     vender direto)?
IM3. Qual e o publico prioritario (frio, morno, quente)?
IM4. Historico: rodou anuncio antes? Se sim, colar 2-3 metricas
     (CPM, CPC, custo por lead, ROAS).

Aplica regua 50/30/20 (50% do topo pro frio, 30% pra morno, 20%
pra quente). Devolve plano de verba por eixo + criterio de
escala/pausa por peca. Se metrica ruim, diagnostica causa
(publico errado, criativo cansado, oferta fraca).

Modo AVALIAR:
IM5. Cola a peca (link, screenshot, texto).
IM6. Cola 1-2 metricas do perfil (media de views, CTR historico
     de peca similar) se tiver.

Duplo eixo:
- Empirico (compara com o historico REAL do perfil).
- Doutrinario (gate Soft: as 3 perguntas, CUB, verbatim, CTA).

Veredito em 3 niveis (pode publicar, publica com correcao,
segura). Se segura ou corrige, lista as correcoes.

Nao cria nem sobe campanha na Meta. Se dono precisa disso,
aponta pra soft-trafego-meta.


-------------------------------------------------------
FORMATO-DESIGNER (arte visual, PNG, banner, deck)
-------------------------------------------------------
Delega inteiro pra skill soft-designer (a fabrica de visual
do metodo, standalone). Nao resume o metodo aqui.

Requisito antes de chamar: copy/tese pronta (vem de outro
formato ou o dono cola).

Chama soft-designer com o brief: artefato desejado (carrossel,
banner, deck, thumbnail, prompt de imagem-IA), a copy-visual
pronta e o nome do cliente (pra ela carregar a identidade
salva em assets/identidade-<cliente>.json, ou perguntar se
ainda nao existe).

A soft-designer cobre: deteccao de familia visual, identidade
como dado (nao pergunta repetida), as 7 regras inegociaveis de
layout, preview com STOP antes de exportar, gate visual
completo (contraste, orfa, setinha de arraste, print como
prova, tarja LGPD), lote com checkpoint e mosaico de auditoria
quando sao 3 ou mais pecas.

Entrega: PNG/deck/brief no path que a soft-designer definir
(path absoluto em linha propria pra ponte enviar).

============================================================
F2. PREVIEW
============================================================

A cada 5 respostas, e sempre antes de fechar, mostra a peca
inteira (ou o esboco) em bloco curto. Pergunta uma linha: "ta
seguindo o rumo? algum ajuste antes de eu fechar?".


============================================================
F3. GATE + ENTREGA
============================================================

Antes de dizer "pronto":

[ ] Roda o anti-IA lint no trecho copy-facing:
    python3 ~/.claude/skills/soft-critico-copy/scripts/lint_copy.py
    Se falhou (exit 1), conserta e roda de novo ate passar.

[ ] Gate CUB aplicado (Confusao, Unacreditavel, Boring):
    - Confusao: se um leigo le, entende em 1 leitura?
    - Unacreditavel: a promessa cabe na prova mostrada?
    - Boring: tem angulo, tem tensao, nao e mais um post?

[ ] As 3 perguntas do gate:
    - Se explica sozinha? (standalone)
    - Palavra-senha entre aspas? (jargao entre "")
    - CTA de BENEFICIO, nao de acao vazia?

[ ] Sistema anti-idiota (memoria feedback-carrossel-anti-idiota,
    vale pra qualquer peca publica):
    frase se explica sozinha, verbatim do webinar quando
    aplicavel (grep no SIA-*), quebras visuais claras, sem
    "metodo" em carrossel aberto, sem literal-wrong, CTA so
    beneficio, palavra-senha entre aspas, lint passa.

[ ] Nenhum default do dono (Mesa de Operacao/Call de
    Arquitetura/Consultoria Soft) fora de bloco "(exemplo, nao
    copia)".

[ ] Path de arquivo em linha propria se e artefato (PNG, deck,
    Doc).

[ ] state salvo em /tmp.

Entrega:
- Copy: cola no chat + salva .md em /tmp/soft-conteudo-<slug>/.
- Plano/matriz longo: sobe pra Google Doc via
  gog drive upload --convert e manda URL crua do Doc.
- Arte: PNG/HTML em path absoluto na resposta (linha propria).


============================================================
ESTADO EM /tmp
============================================================

Arquivo: /tmp/soft-conteudo-<slug>-<epoch>.json

Formato:
{
  "slug": "<slug curto do que ta sendo produzido>",
  "epoch": <unix>,
  "criado_em": "<ISO>",
  "atualizado_em": "<ISO>",
  "fase_atual": "M0|P0|F0|F1|F2|F3",
  "formato": "headline|carrossel|reel|stories|multiplataforma|planner|impulsionar|designer",
  "pecas_prontas": {
    "posicionamento": null,
    "matriz": null,
    "headline": null,
    "oferta": null,
    "verbatim": null,
    "peca_original": null,
    "peca_molde": null,
    "identidade": null
  },
  "contexto": {},
  "execucao": {},
  "preview_showed_at": [],
  "pendentes_a_confirmar": []
}

Salva a cada resposta.


============================================================
CHECKLIST DE ENTREGA (antes de mandar pro dono)
============================================================

[ ] Formato identificado em M0
[ ] P0 rodado, pecas importadas
[ ] F0 fechado (contexto minimo suficiente pra escrever)
[ ] F1 do formato executado ate o fim
[ ] Preview mostrado antes do fechamento final
[ ] Anti-IA lint passou (exit 0)
[ ] Gate CUB + 3 perguntas + anti-idiota aplicados
[ ] Nenhum default o dono fora de "(exemplo, nao copia)"
[ ] Nenhum preco/tese/numero inventado
[ ] state salvo em /tmp
[ ] Path do artefato em linha propria (se e arquivo)
[ ] Mensagem final pro dono: peca + o que ficou pendente
    ([A CONFIRMAR]) se algo


============================================================
REFERENCIAS INTERNAS (detalhe operacional)
============================================================

Skills antigas absorvidas (nao aparecem no catalogo, ficam como
docs internos):
- references/_metodo-headlines.md
- references/_metodo-carrossel.md
- references/_metodo-reels.md
- references/_metodo-stories.md
- references/_metodo-multiplataforma.md
- references/_metodo-planner.md
- references/_metodo-impulsionar.md
- references/_metodo-designer.md

Referencias canonicas (fora da skill):
- brain/conteudo/aula-webinar-AAA-gravada.md (verbatim canonico)
- brain/NARRATIVA-CANONICA.md
- brain/DOUTRINA-MD-TELEGRAM.md
- brain/DOUTRINA-ARQUIVOS.md
- soft-perfil.md (voz + identidade visual do dono, so pra pecas
  do proprio o dono; peca de cliente usa a identidade do cliente)

Skill irma que roda ANTES de fechar copy publica:
- soft-anti-ia (lint canonico do arsenal)

Scripts uteis:
- ~/.claude/skills/soft-critico-copy/scripts/lint_copy.py
  (mantido no path antigo pra retrocompatibilidade; migra pra
  scripts/ desta mae quando os DEPRECATED forem removidos).


============================================================
FIM DA SKILL MAE
============================================================


============================================================
GATE OBRIGATORIO · soft-critico-copy
============================================================

Antes de entregar QUALQUER linha final publica pro dono
(headline, capa, corpo, slide, script, sequencia, carta,
landing, isca, oferta, WhatsApp, e-mail, bio, CTA), esta
skill invoca o GATE UNIVERSAL soft-critico-copy passando o
texto pronto + o tipo de peca.

Como acionar:

1. Salva a copy pronta em /tmp/copy-<slug>-<epoch>.txt
2. Invoca a Skill soft-critico-copy com:
   - texto: o conteudo do arquivo
   - tipo_de_peca: um de {headline, capa, corpo, slide,
     script_reel, sequencia_stories, carta, landing_bloco,
     landing_completa, isca_copy, oferta, whatsapp, email,
     script_sdr, script_closer, pos_venda, bio, cta}
   - contexto (opcional): tese-mae, avatar, verbatim_ref

O gate retorna: passou_nos_4 (sim/nao) + falhas em 4 filtros
(CUB, Estrutura-mae, Anti-IA, Verbatim) com trecho, motivo e
sugestao de reescrita.

Se reprovou, aplica as sugestoes e re-invoca. Loop de no
maximo 3 iteracoes. Se ainda reprovar, escala pro dono com
as falhas listadas (nao insiste automatico ao infinito).

Substitui qualquer gate anti-IA anterior desta skill. O
soft-critico-copy JA roda o lint_copy.py internamente no
filtro 3 (Anti-IA), mais 3 filtros adicionais (CUB,
Estrutura-mae, Verbatim).
