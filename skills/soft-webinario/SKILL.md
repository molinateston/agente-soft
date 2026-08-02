---
name: soft-webinar-plano
description: "Sistema completo de webinario Soft Business (perpetuo ou ao vivo), degrau 2 da escada Funil Soft, Webinar Soft, Soft Launch. UMA skill mae que faz TUDO na ordem certa por Q&A guiado retomavel, do zero ao deck esbocado. Cobre ordem canonica em blocos, modo por faixa de ticket, import de pecas prontas (aula antiga, oferta, avatar, isca, deck), research de mercado e avatar, big idea, copy (ancora, promessa, ganchos), APSD com os 13 beats do pitch, metadados e geracao do pacote (plano, roteiro e deck). Atende dono do zero, dono com pecas prontas e dono retomando plano meio-feito. Sugere 2-3 opcoes por bloco, preview a cada 5 respostas, zero default. Use quando o pedido cita webinar, aula gravada, aula ao vivo, evento de vendas, roteiro de aula, deck de webinar, gravar aula que vende, montar aula. NAO entra em landing, obrigado ou checkout (soft-webinar-paginas), carta de vendas em texto (soft-funil-carta), mini-webinar de filtragem (soft-funil-miniwebinar), nem anuncio (soft-conteudo, soft-trafego-meta)."
---

============================================================
SKILL MAE UNICA DO WEBINARIO SOFT
============================================================

O que faz
---------

Conduz o dono de UM webinario Soft do zero ate o deck esbocado
por Q&A guiado retomavel. Uma pergunta por vez, bloco por bloco,
na ordem canonica APSD. Sai um pacote final com 3 pecas: plano
completo, roteiro APSD (copy falada nas notas) e deck de 140-180
slides esbocado (titulo + nota por slide, arquetipo por beat).

Absorve as 3 skills antigas (soft-webinar-plano, soft-webinar-
script, soft-webinar-slides) num loop unico. As antigas viraram
referencia interna em references/_metodo-plano.md, _metodo-
script.md, _metodo-slides.md.

Os 3 cenarios que ela atende
----------------------------

1) DO ZERO
   Dono nao tem nada. Roda o percurso completo (~40 passos).

2) COM PECAS PRONTAS
   Dono ja tem oferta, aula antiga, avatar mapeado, isca ou deck.
   No bloco P0 a skill IMPORTA o que ele traz e PULA as perguntas
   cobertas. Se trouxer 3 pecas, roda em ~15 min.

3) RETOMANDO
   Dono chamou antes e parou no meio. A skill le
   /tmp/soft-webinar-plano-<slug>-<epoch>.json e continua exatamente
   de onde parou.


============================================================
REGRAS TRANSVERSAIS DURAS (valem em TODOS os blocos)
============================================================

1) UMA PERGUNTA POR VEZ.
   Nunca despejar 5 perguntas juntas. Nunca continuar antes da
   resposta anterior. Uma pergunta = uma resposta = proxima.

2) SUGERE 2-3 OPCOES depois das perguntas cruas.
   Nunca sugestao unica (vira empurrao). As opcoes vem cruzando
   a resposta do dono com o que a research trouxe. Ele escolhe,
   edita, ou pede mais.

3) PREVIEW a cada 5 respostas.
   Mostra em bloco curto o pedaco do plano que ja nasceu:
   "olha o que ja da pra montar com o que voce me deu". Serve pra
   dono ver progresso e corrigir cedo.

4) ZERO DEFAULT DO LEO.
   Exemplo do produto do dono (Operacao SOFT, Mesa de Operacao,
   Call de Arquitetura) so entra como REFERENCIA marcada
   "(exemplo, nao copia)". Naming do dono e SEMPRE aberto: ele
   escolhe o nome do produto e o nome da call. A skill NUNCA
   impoe.

5) NAMING USER-FRIENDLY.
   Nunca dizer "modo canonico" ou "modo high_ticket" na cara do
   dono. Perguntar SEMPRE por preco: "seu produto principal
   custa ate R$3k ou acima de R$3k?". Internamente o campo se
   chama modo com valor canonico ou high_ticket, mas isso e
   invisivel pro dono.

6) RETOMABILIDADE.
   A cada resposta o state cai em
   /tmp/soft-webinar-plano-<slug>-<epoch>.json. Se o dono chamar de
   novo (ou sair e voltar), a skill le o state mais recente e
   pergunta "quer continuar de onde parou ou comecar novo?".

7) ANTI-IA em tudo que sai.
   Zero travessao longo. Zero familia da palavra que comeca com
   T-R-A-V (verbo de emperrar/parar). Zero cliche de IA (dicotomia
   forcada, staccato de 3 frases curtas, chavao dramatico do tipo
   "isso vira o jogo"). Verbatim do dono quando aplicavel
   (referencia em
   brain/conteudo/aula-webinar-AAA-gravada.md e aula-webinar-
   AAA-HIGH-TICKET.md). Antes de fechar o pacote, rodar
   python3 ~/.claude/skills/soft-critico-copy/scripts/lint_copy.py
   nos trechos copy-facing.

8) ZERO INVENTAR PRECO OU NUMERO DO DONO.
   Se ele nao respondeu, pergunta. Nao chuta valor de checkout,
   nao chuta parcelamento, nao chuta garantia em dias.

9) ACEITA TEXTO OU AUDIO em qualquer resposta.
   Se dono respondeu por audio (transcrito), trata igual texto.

10) PULAR = "[A CONFIRMAR]".
    Se o dono digitar "pula" ou "depois", a resposta vira
    [A CONFIRMAR - <bloco>] no state e o pacote final marca
    esses pontos em amarelo pra ele afinar.

11) RESPOSTA RASA = REFAZ A PERGUNTA.
    Se o dono responde em 3 palavras algo que precisa contexto,
    a skill devolve UMA pergunta especifica pra abrir mais, nao
    aceita raso.

12) SAIR/PAUSAR SALVA.
    "sai", "pausa", "amanha" -> salva state, avisa o path, encerra
    limpo.


============================================================
COMO OPERA (o loop)
============================================================

Passo 1 - CHECA state antigo
   Le /tmp/soft-webinar-plano-*.json (se existir mais de um do mesmo
   dono, pega o mais recente por epoch). Se encontrou, pergunta
   "vi um plano de {data} sobre {tese}. continua ou comeca novo?".

Passo 2 - RODA a fase atual
   Uma pergunta por vez. Salva resposta no state. Se caiu em
   bloco com research, dispara a research (Perplexity/Tavily/Exa
   se dono deu chave em API 0, senao WebSearch nativo). Devolve
   2-3 sugestoes cruzando a resposta com a research. Dono escolhe
   ou edita.

Passo 3 - PREVIEW a cada 5 respostas
   Bloco curto: "com o que voce me deu ate agora, o esqueleto do
   plano ta assim: [3-4 linhas]. seguimos?".

Passo 4 - AVANCA pra proxima fase quando fecha a atual
   Fecha uma fase quando todas as perguntas obrigatorias dela
   estao respondidas (ou marcadas [A CONFIRMAR]). Anuncia a
   proxima em uma linha: "beleza, agora vou pra {nome amigavel}".

Passo 5 - NA FASE 5 (geracao)
   Gera 3 secoes concatenadas em UM .md, converte pra Google Doc
   e entrega URL:
   a) PLANO completo (todas as respostas organizadas)
   b) ROTEIRO APSD (copy falada nas notas, pronto pra gravar)
   c) DECK ESBOCADO (140-180 slides, um por linha, formato
      "SLIDE NNN | TELA: ... | NOTA: ... | ARQUETIPO: ...")

Passo 6 - ENTREGA
   Manda 1 URL do Google Doc + resumo curto do que foi gerado +
   marca os [A CONFIRMAR] pendentes.


============================================================
ORDEM CANONICA DAS FASES
============================================================

M0. MODO
--------
UMA pergunta: "seu produto principal, o que voce vai vender ao
final da aula, custa ate R$3k ou acima de R$3k?".

- Ate R$3k -> modo canonico (venda no checkout, esqueleto
  original do dono, pitch conduz pro botao).
- Acima R$3k -> modo high_ticket (venda em call com SDR/Closer,
  pitch conduz pra aplicacao/agendamento, inversao de poder
  estilo Andre Menezes).

Grava state.modo. Nunca dizer os nomes canonico/high_ticket na
cara do dono.


P0. IMPORT DE PECAS PRONTAS
---------------------------
UMA pergunta com checklist: "antes de eu perguntar tudo do zero,
me diz o que voce ja tem pronto? marca com sim/nao:

- Oferta empacotada (preco definido, garantia, bonus)
- Aula/webinar antigo gravado (voce cola o link ou o texto/
  transcricao)
- Isca ou lead magnet ja rodando
- Avatar mapeado (voce cola a descricao que ja tem)
- Analise de concorrencia ou mercado
- Deck antigo de webinar
- Nada, comeco do zero"

Pra cada SIM: pede o input (cola link, texto, arquivo, descricao).
Salva em state.pecas_prontas.{oferta, aula, isca, avatar,
mercado, deck}. Nas fases seguintes, as perguntas cobertas por
peca pronta sao PULADAS (o dono nao responde de novo o que ja
entregou).


API 0. RESEARCH SETUP
---------------------
UMA pergunta: "voce tem chave de API de pesquisa avancada
(Perplexity, Tavily, Exa, SerpAPI)? cola aqui se sim, ou digita
'nao'.

Com chave, minha pesquisa fica mais funda (2-3 min por fase).
Sem chave, uso a busca padrao (mais rasa mas gratis)."

Salva em state.research_api. Ativa flag research_mode = deep OU
shallow.


FASE 0. BIG IDEA + MERCADO (research 1)
---------------------------------------
Se pecas_prontas.mercado existe, PULA parte da research. Se nao:

Perguntas cruas (uma por vez):
- Quem e voce (nome, credencial em 1 linha, o que voce faz)
- Qual e o produto (nome interno mesmo, o que entrega, formato)
- Qual e o nicho (verticais que voce atende hoje)
- Qual e a tese-mae que voce ja pensou ou testou (se tem)
- Qual e o "grande dominio" ou reposicionamento que voce acha
  que precisa acontecer no seu mercado

Dispara research (mercado, concorrencia, angulos que estao
saturados, gaps, palavras que aparecem em pagina de venda dos
concorrentes principais).

Devolve 2-3 SUGESTOES de tese-mae/big idea, cada uma com:
- Titulo em 1 frase
- Racional em 2 linhas
- Contra-quem se posiciona
- Por que esse angulo cabe no que voce ja disse

Dono escolhe, edita, ou pede mais. Salva em state.big_idea.


FASE 1. AVATAR (research 2)
---------------------------
Se pecas_prontas.avatar existe, PULA e usa como base.

Perguntas cruas:
- Quem e o cliente que voce ja atende (nivel, dor central, o
  que ele tentou antes)
- Onde esse cliente esta online (grupo do Facebook, subreddit,
  forum de nicho, canal do YouTube que ele consome)
- Como ele DESCREVE a dor com as palavras dele (texto que voce
  ja ouviu, mesmo que grosseiro)

Dispara research (dor real em forum/reddit, palavras exatas do
avatar, objecao mais comum, o que ele ja comprou e nao serviu).

Devolve 2-3 SUGESTOES de avatar afiado, cada uma com:
- Titulo do perfil (1 linha)
- Dor central (2-3 linhas)
- Objecoes principais
- Verbatim (frase que ele diria)

Dono escolhe/edita. Salva em state.avatar.


FASE 2. COPY (usa insights de F0 + F1)
--------------------------------------
Perguntas + geracao lado a lado:

- Ancora (o inimigo, o vilao, o "contra o que" a aula fala) ->
  a skill gera 2-3 opcoes.
- Promessa maxima (o depois-de-mim, o resultado especifico) ->
  2-3 opcoes.
- Categoria (o QUE isso e, na cabeca do avatar - "programa",
  "sistema", "metodo", "operacao") -> 2-3 opcoes.
- Ganchos de topo (frase pra virar headline de pagina/anuncio/
  gancho falado da aula) -> 3-5 opcoes.
- One belief (a UMA crenca central que a aula precisa instalar
  pra venda existir) -> 2-3 opcoes.

Salva em state.copy.{ancora, promessa, categoria, ganchos,
one_belief}.


FASE 3. APSD - ATENCAO
----------------------
6 perguntas core (A1-A6). Se modo=high_ticket, +2 (A7 contrato de
audiencia + A8 semente do convite).

A1. Abertura - qual pergunta ou frase VOCE quer dizer nos
    primeiros 30s pra parar o scroll?
A2. Categoria de aula - como voce nomeia a aula pra prometer
    (aula/masterclass/treinamento/workshop/sessao)?
A3. Promessa curta (a versao de 1 frase do que essa aula
    entrega). Skill sugere 2-3 opcoes, sendo UMA no molde
    "Como [principal beneficio] sem [maior objecao]" (formato
    classico que ancora rapido). Dono escolhe/edita.
A4. Historia pessoal curta - 2-3 linhas de credencial dramatica
    ("eu era X, virei Y"), fechada com uma bandeira no formato
    "Eu acredito que..." (uma linha que declara sua tese sobre o
    tema, ex "eu acredito que resultado sem consistencia e
    sorte"). O "Eu acredito que..." separa autoridade de
    curriculo e conecta com o problema que vem.
A5. Contrato basico (o que o avatar precisa fazer pra aula
    funcionar - "fica ate o fim, anota, faz o exercicio")
A6. Bridge pro problema (a frase que abre a proxima fase)

A7 (so high_ticket). Contrato de audiencia estendido - "esta
    aula NAO e pra todo mundo, e pra quem X e Y".
A8 (so high_ticket). Semente do convite - a primeira mencao
    (leve, ao passar) de que no final voce vai abrir uma
    conversa individual pra "poucos que se encaixarem".

Cada resposta ja preenche um beat do template. Salva em
state.apsd.a.


FASE 3. APSD - PROBLEMA (research 3)
------------------------------------
ANTES das perguntas P1/P2/P3, dispara research: "qual e o
problema EXTERNO (o que aparece), INTERNO (o que sente) e
FILOSOFICO (o que representa) do avatar {nome} no nicho {nicho}
em relacao a {big_idea}?". Devolve 3 blocos pro dono ancorar em
cima.

Perguntas:
P1. Problema externo - o que o avatar VIVE de sintoma? (skill
    devolve 2-3 opcoes com base na research)
P2. Problema interno - o que ele SENTE por dentro? (2-3 opcoes)
P3. Problema filosofico - o que isso REPRESENTA pra ele? (2-3
    opcoes)
P4. Causa raiz - qual e a causa que voce quer culpar (sistema
    velho, guru errado, metodo saturado)? Sub-pergunta: quem
    e o INIMIGO COMUM que carrega essa culpa (uma entidade
    nomeavel, tipo "site de vagas", "gerente de banco", "senso
    comum do nicho")? Nomear o inimigo desloca a culpa do
    avatar e cria alianca.
P5. Anti-tese (o que o mercado ensina errado que voce vai
    desmontar)?

Salva em state.apsd.p.


FASE 3. APSD - SOLUCAO (research 4)
-----------------------------------
Research: "o que os concorrentes de {big_idea} estao vendendo
como solucao? quais mecanismos ja existem? qual e o gap?". Pra
cada bloco, a skill cruza a resposta do dono com a research e
devolve 2-3 sugestoes.

Perguntas:
S1. Mecanismo unico - qual e o NOVO mecanismo que voce oferece?
    Nome + racional em 2 linhas. (skill sugere 2-3 nomes cruzando
    com research)
S2. Como funciona - 3-5 pilares/passos do mecanismo
S3. Por que so voce - o que voce tem que ninguem tem
S4. Prova - qual e a prova principal (case, numero, marco)
S5. Como e usar o mecanismo - a fatia GRATIS que voce entrega
    dentro da aula (a "aula dentro da aula")
S6. Ponte pra oferta - a frase que abre o pitch

S7 (so high_ticket). Nome do produto que voce vende na call.
    PERGUNTA ABERTA. So exemplos como referencia: "consultoria",
    "mentoria", "programa", "celula", "mesa" (exemplo, nao
    copia). Dono escolhe.

Salva em state.apsd.s.


FASE 3. APSD - DECISAO (13 beats)
---------------------------------
Cada beat vem com TEMPLATE PRE-PREENCHIDO usando as respostas
das fases anteriores. Dono so afina.

Se modo=canonico (venda no checkout):
D1. Ponte da solucao pra oferta
D2. Nome da oferta + o que e
D3. Entrega principal (o que vai receber)
D4. Bonus 1 (atacando objecao "e se nao der tempo")
D5. Bonus 2 (atacando objecao "e se eu nao souber onde comecar")
D6. Bonus 3 (opcional - atacando objecao secundaria)
D7. Ancoragem em stack (montagem sequencial): (a) soma dos
    entregaveis + bonus com valor de cada peca, (b) total inflado
    ("tudo isso valeria X"), (c) frase "combinado nao sai caro"
    ou equivalente Soft, (d) preco final revelado (Y), (e)
    opcional: super-bonus com escassez REAL pros primeiros que
    agirem. Tom Soft: sem urgencia falsa nem "de X por Y",
    escassez precisa ser verdadeira.
D8. Preco final (ate R$3k)
D9. Parcelamento
D10. Garantia (dias + condicao)
D11. Escassez (vagas/tempo/bonus expirando) - SO se for real
D12. Call pra acao (o link/botao aparece + o que dizer)
D13. Fechamento + P.S. (o que dizer nos ultimos 2 min)

Se modo=high_ticket (venda em call, override):
D1. Bridge da solucao pra convite (nao pra checkout)
D2. Reforco do contrato de audiencia (A7 mais forte, com a
    frase "isso nao e pra todo mundo")
D3. Nome do produto de call (S7) + o que e (uma consultoria
    guiada, uma mentoria em grupo, o formato REAL)
D4. Formato do processo (quantas sessoes, com quem, prazo)
D5. Entregavel principal (a transformacao especifica)
D6. Prova high-ticket (case, numero, marco de aluno que fez a
    call e virou cliente)
D7. Inversao de poder ("nao e voce comprando, e a gente
    escolhendo com quem trabalha")
D8. Convite pra aplicacao (link pra formulario/agenda) + o que
    dizer
D9. Criterios da aplicacao (o que voce olha - fatura hoje,
    quanto quer investir, comprometimento)
D10. Reforco de escassez REAL (quantas vagas de call por
     semana/mes)
D11. Filtragem final ("se voce nao se encaixa em X, isso nao e
     pra voce")
D12. Bridge pra call ("quem se encaixar preenche, a gente
     analisa, quem passar recebe a call")
D13. Fechamento + P.S. (reforco: nao e "compra", e "seleciona")

M5 (so high_ticket, dentro de D8). Naming da call - PERGUNTA
    ABERTA. Exemplos como referencia (nao copia): "Sessao
    Estrategica", "Reuniao de Diagnostico", "Consulta de
    Qualificacao", "Call de Arquitetura", "Mapa da Rota". Dono
    escolhe.

Salva em state.apsd.d.


FASE 4. METADADOS
-----------------
M1. Titulo publico da aula (o que aparece na landing, no
    anuncio, no lembrete)
M2. Subtitulo publico (a segunda linha)
M3. Duracao alvo (60 / 75 / 90 / 120 min)
M4. Data e formato (perpetuo/ao vivo/hibrido)

Se modo=high_ticket, M5 (naming da call) ja foi respondido em D8.

Salva em state.meta.


FASE 5. GERACAO DO PACOTE FINAL
-------------------------------
Skill nao pergunta mais nada aqui. Ela GERA.

A) PLANO COMPLETO
   Consolida state.big_idea + state.avatar + state.copy +
   state.apsd + state.meta num doc estruturado (titulo, secoes
   nomeadas, tudo o que o dono respondeu). E o "mapa mental
   preenchido".

B) ROTEIRO APSD (copy falada nas notas)
   Usa a logica antiga de soft-webinar-script (referencia em
   references/_metodo-script.md). Gera roteiro estruturado por
   beats (13 A/P/S + 13 D + 2 F). Cada beat tem:
   - Titulo do beat
   - O que dizer (copy falada, 2-3 paragrafos)
   - Transicao pro proximo beat

   Ramifica pelo state.modo (canonico usa esqueleto original,
   high_ticket usa overrides D01-D40 com inversao de poder).

C) DECK ESBOCADO (140-180 slides)
   Usa a logica antiga de soft-webinar-slides (referencia em
   references/_metodo-slides.md). Projeta o roteiro nos
   arquetipos:
   - Respiro (transicao curta)
   - Capa (abre a fase)
   - Prova (numero, print, case)
   - Dicotomia (X vs Y)
   - Storytelling (frase pessoal)
   - Reveal (a virada, o mecanismo)
   - Stack (oferta, entregaveis empilhados)

   Formato de cada linha:
   SLIDE NNN | TELA: <o que aparece na tela, uma frase ou
   numero> | NOTA: <copy falada, o dono le no presenter view> |
   ARQUETIPO: <um dos 7>

   Distribuicao base (esqueleto 82 slides ancora, expande pra
   140-180):
   - A: 10 slides
   - P: 15 slides
   - S: 15 slides
   - D: 40 slides
   - F: 2 slides
   Se high_ticket, D vira 40 slides especificos do pitch de
   call (D01-D40 em _metodo-script.md).

Concatena A + B + C num .md unico chamado
plano-webinario-<slug>-<YYYYMMDD>.md, converte pra Google Doc
via gog drive upload --convert, e entrega a URL crua do Doc pro
dono.



============================================================
FASE 6. ANUNCIO AIDA (opcional, so se dono quiser)
============================================================

Pergunta unica: "quer que eu ja gere a copy do anuncio pra
rodar trafego pro webinar? (sim/nao)". Se sim, monta na
estrutura AIDA classica de resposta direta, cruzando com o que
foi respondido nas fases anteriores:

[ATENCAO] uma linha curta. Skill sugere 3 angulos:
- pergunta direta ancorada na dor (P1)
- contraintuitiva ancorada no inimigo comum (P4)
- curiosidade que abre loop pra big idea (F0)

[INTERESSE] 2-3 linhas: detalha a dor melhor que o proprio
avatar (lista com sintomas de P1), abre pergunta pra big idea.

[DESEJO] 3-4 linhas: uma afirmacao com prova externa (research
2 do avatar ou prova S4), desenvolve o porque da nova solucao
(S1 mecanismo), fecha com uma frase que aponta pro veiculo
(webinario).

[ACAO] "Em breve vai acontecer <categoria da aula, A2>. Toque
em <botao> pra reservar sua vaga."

Passa pelo lint anti-IA antes de entregar. Salva em
state.anuncio. Concatena no Google Doc final como Anexo A.

Referencia externa que sustenta essa fase:
references/estrutura-sniper.md.


============================================================
ESTADO EM /tmp
============================================================

Arquivo: /tmp/soft-webinar-plano-<slug>-<epoch>.json

Formato:
{
  "slug": "<slug curto do produto/tese, gerado do M0/F0>",
  "epoch": <unix>,
  "criado_em": "<ISO>",
  "atualizado_em": "<ISO>",
  "fase_atual": "F0|F1|F2|F3-A|F3-P|F3-S|F3-D|F4|F5|F6",
  "modo": "canonico|high_ticket",
  "research_api": "perplexity|tavily|exa|serpapi|none",
  "research_mode": "deep|shallow",
  "pecas_prontas": {
    "oferta": null,
    "aula": null,
    "isca": null,
    "avatar": null,
    "mercado": null,
    "deck": null
  },
  "big_idea": {},
  "avatar": {},
  "copy": {},
  "apsd": {"a":{}, "p":{}, "s":{}, "d":{}},
  "meta": {},
  "pendentes_a_confirmar": []
}

Salva a cada resposta. Ao gerar o pacote (F5), tambem grava uma
copia final em
brain/webinarios/plano-<slug>-<YYYYMMDD>.json pra historico.


============================================================
CHECKLIST DE ENTREGA (antes de mandar pro dono)
============================================================

Antes de dizer que o pacote esta pronto:

[ ] Todas as fases fechadas OU marcadas [A CONFIRMAR]
[ ] state salvo em /tmp
[ ] .md gerado em /tmp/plano-webinario-<slug>-<data>.md
[ ] Google Doc criado (gog drive upload --convert)
[ ] URL do Doc capturada
[ ] Anti-IA rodado no roteiro (secao B) e nas notas do deck
    (secao C):
    python3 ~/.claude/skills/soft-critico-copy/scripts/lint_copy.py
    Se falhou (exit 1): conserta e roda de novo ate passar.
[ ] grep "canonico" no output final: 0 hits user-facing.
[ ] grep "Mesa de Operacao|Call de Arquitetura|Consultoria Soft"
    no output final: se aparecerem, so em bloco marcado
    "(exemplo, nao copia)".
[ ] Nenhum preco/parcelamento/garantia inventado (tudo veio do
    state).
[ ] Copia final gravada em brain/webinarios/plano-<slug>-<data>.json
[ ] Mensagem final pro dono: URL crua do Doc + resumo curto +
    lista de [A CONFIRMAR] pendentes.


============================================================
REFERENCIAS INTERNAS (detalhe operacional)
============================================================

Skills antigas absorvidas (nao aparecem no catalogo do usuario,
ficam como docs internos):
- references/_metodo-plano.md  (Q&A completo, era soft-webinar-plano)
- references/_metodo-script.md (esqueleto de roteiro + 82 slides
                                ancora + overrides high_ticket,
                                era soft-webinar-script)
- references/_metodo-slides.md (arquetipos + regra copy-na-nota +
                                gate anti-IA, era soft-webinar-slides)

Referencias de METODO (existiam antes):
- references/analise-webinario-existente.md
- references/ancoragem-e-fechamento.md
- references/desenho-e-empacotamento-da-oferta.md
- references/esqueleto-universal-e-discernimento.md
- references/estrutura-webinario-aida.md
- references/estrutura-sniper.md
- references/falas-prontas-por-bloco.md
- references/fladlien-modelo.md
- references/frameworks-proprietarios.md
- references/fundamentos-pre-roteiro.md
- references/gravacao-energia-ao-vivo.md
- references/motor-3-viradas.md
- references/objection-annihilation.md
- references/paginas-cadastro-obrigado-checkout.md
- references/perpetuo-mecanica.md
- references/perpetuo-vs-aovivo.md
- references/pos-webinar-tags-comercial.md
- references/premissas-e-guarda-corpos.md
- references/sequencias-email-whatsapp-pre-pos.md
- references/simulador-comentarios-ao-vivo.md
- references/template-72-slides.md

Referencias canonicas (fora da skill):
- brain/conteudo/aula-webinar-AAA-gravada.md (verbatim canonico)
- brain/conteudo/aula-webinar-AAA-HIGH-TICKET.md (variacao high)
- brain/NARRATIVA-CANONICA.md


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
