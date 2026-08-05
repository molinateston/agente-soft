# Mineração de benchmark, registro das rodadas

> Este arquivo é o **diário da mineração de fórmulas de headline**: como se garimpa fórmula nova de fora, com que fontes, e o que a Rodada 1 produziu (metodologia, dedup, limitações, próxima rodada). É a memória que impede repetir garimpo já feito e importar fórmula fraca. Toda fórmula que entra na skill (cânone ou incubadora) passa por aqui primeiro. O comando `minera benchmark de [tema]` roda uma rodada nova com dedup e devolve veredito ANTES de propor candidato.

## Índice
- [Metodologia](#metodologia)
- [Fontes por Tier](#fontes-por-tier)
- [Rodada 1, tabela de dedup](#rodada-1-tabela-de-dedup)
- [Limitação da Ads Library](#limitacao-da-ads-library)
- [Rodada 2, o cânone reorganizado por gatilho](#rodada-2-o-canone-reorganizado-por-gatilho)
- [Regra de autoria e neutralização](#regra-de-autoria-e-neutralizacao)

## Metodologia

A mineração busca **fórmula de headline com proxy de performance** (não só "headline bonita"), destila a estrutura, checa se já existe no cânone (dedup) e classifica o que sobra em: **redundante** (funde no T/C existente), **refinamento** (vira nota sob um T existente), **fora de escopo** (não é headline) ou **fórmula nova** (entra no banco único `templates.md` como EXTERNO, no fim da numeração T, marcada com a origem, e só vira CASA depois de bater baseline em 2 peças reais do dono).

O **dedup é obrigatório**: antes de nomear qualquer candidato novo, a fórmula minerada é confrontada com os 30 templates T e os candidatos C existentes. Se colide, não vira C novo. Esse passo é o que impede o cânone de inchar com sinônimos.

## Fontes por Tier

**Tier 1 (com proxy de performance medido):**
- **Hormozi:** 25 Video Hooks, os top-10 posts medidos, o material $100M Hooks. Proxy = engajamento/retenção real.
- **Retenção de vídeo curto (TikTok/Reels):** 71% decidem nos 3s; 85%+ de retenção = ~2,8x views; limiar prático de retenção 65-70%; 70-85% = ~2,2x.
- **Títulos de YouTube:** base SubSub de 120.703 títulos (mediana de top performers ~8 palavras, sweet spot 50-60 caracteres); Backlinko sobre ~4M de resultados (40-60 caracteres = +8,9% CTR; pronomes eu/você elevam CTR); doutrina MrBeast de título/thumb.
- **Assunto de e-mail:** Belkins sobre 5,5M de e-mails (pergunta 46% abertura, 2-4 palavras 46%); Klenty sobre 255k+ (interrogação 20% vs 12%, valor monetário 29% vs 13%; "coisa rápida" de colega +8pts; jargão/urgência genérica derruba a abertura pra baixo de 36%).

**Tier 2 (referência de estrutura, sem proxy medido, citável):**
- Copyblogger, Caples (Tested Advertising Methods), fórmula das 4U's, swipe files clássicos de estrutura (Brunson e afins como coletânea de estrutura).

**Fontes BR do insumo:** os criadores BR citados no material de origem foram **neutralizados** no produto (viram "criadores BR" sem nome). O lastro que aparece nas references é sempre o distante e citável (Hormozi, Caples, Copyblogger, Backlinko, Belkins, Klenty, SubSub, bases de estudo). Ver [regra de autoria](#regra-de-autoria-e-neutralizacao).

## Rodada 1, tabela de dedup

Confronto das fórmulas mineradas na Rodada 1 contra o cânone existente.

**Redundantes (fundem no T/C existente, NÃO viram fórmula nova):**

| Fórmula minerada | Funde em |
|---|---|
| "everyone-talks-X" (todo mundo fala de X) | T5 / T28 |
| "difference-X-Y" (a diferença entre X e Y) | T13 |
| "X-vs-Y" | T13 |
| "how-to-without" (como fazer X sem Y) | C1 |
| "MBA-em-X" | T10 |
| "how-x-used-y" (como X usou Y) | C6 |
| "one-word-changed" (mudei uma palavra) | C2 / T21 |
| "easier-than-you-think" (mais fácil do que parece) | C3 |
| "still-time" (ainda dá tempo) | T24 |
| "making-these-mistakes" (você comete estes erros) | C5 / T30 |
| "who-else-wants" (quem mais quer) | T16 / C1 |
| "warning" (alerta/aviso) | T15 |

**Refinamentos (viram nota sob um T existente, ver `templates.md` Seção de notas):**

| Fórmula minerada | Vira refinamento de |
|---|---|
| "stop-doing-X" (imperativo-negativo) | T1 (segunda face: proibição) |
| callout "isso é pra você" falado | T9 / T15 / T20 (ultraespecífico ≤7 palavras) |
| reveal-first (número cru primeiro) | C6 / C7 |
| "mudei UMA coisa e [resultado]" 1ª pessoa | C2 / T21 |
| "é mais fácil do que você imagina" | C3 (obstáculo mental) |
| urgência de janela só com deadline real | T24 |
| "quem mais quer [resultado]?" (3ª pessoa) | T16 |

**Fora de escopo (não é headline):**

| Item | Por quê fora |
|---|---|
| escada de stakes ($1 vs $1B) | é técnica de **retenção** ao longo do vídeo, não de headline de abertura |

**Novos candidatos da rodada (hoje absorvidos no banco único `templates.md` como fórmulas EXTERNO, T87+):**

| Candidato | Padrão |
|---|---|
| **C9** | promessa com prazo crível |
| **C10** | espia meu ativo privado |
| **C11** | experimento documentado |
| **C12** | credencial emprestada na frente |

> Nota de numeração: os candidatos novos começam em **C9** porque **C1-C6** já estão ocupados pelo cânone de ângulos ortogonais (Número, Contrária, Transformação, Autoridade, Confissão, Futuro), documentado no `templates.md`. C7 e C8 ficam reservados a refinamentos de ângulo da Rodada 1 (reveal-first e obstáculo-mental) que ainda vivem como nota sob T, não como ângulo nomeado autônomo.

## Limitação da Ads Library

A **Meta Ads Library não é raspável** de forma confiável (sem export estruturado, sem proxy de performance direto no anúncio). O proxy usado no lugar: um anúncio **ativo há 30+ dias com variações** é sinal de que está performando (ninguém queima verba 30 dias num criativo que não retorna). A leitura fina disso fica pra Rodada 2, por **browse manual**.

## Rodada 2, o cânone reorganizado por gatilho

**Insumo:** material do dono, "Fórmulas por GATILHO" (~91 fórmulas mineradas por ele) + o Mapa de Munição da Audiência. **Doutrina que a Rodada 2 instala:** gancho é gancho, headline é headline; **não se organiza por plataforma**, se organiza por **GATILHO** (6 famílias). A plataforma vira camada de renderização (`subcanones-formato.md`). Cada fórmula do insumo foi confrontada com T1-T30 + os antigos moldes de formato (H/Y/E) + os candidatos C9-C12. Resultado abaixo.

### Fórmulas NOVAS (viraram T31+ no cânone, `templates.md`)
56 fórmulas do insumo sobreviveram ao dedup e ganharam T-número novo, distribuídas nas 6 famílias:
- **Recompensa (T31-T42):** Como [DESEJO] · Como eu [DESEJO] com [CONHECIDO] em [TEMPO] sem [OBJEÇÃO] · [DESEJO] e [DESEJO] em [TEMPO] · [FERRAMENTA] faz [DESEJO] · [PROBLEMA]? Faça isso · [X] que substitui [OBJEÇÃO] · Chega de [DOR]: é assim que você [DESEJO] · Melhor que [TÉCNICA] · Isso obrigou [CONHECIDO] a [DESEJO] · De [DOR] a [DESEJO] · [X] é o suficiente para [DESEJO] · Fiz [X] fazendo isso (prova crua, ex-molde de reel).
- **Mistério (T43-T63):** piores do que [CONHECIDO] · a última coisa que falta · o [CONHECIDO] que ajudou [X] a [DESEJO] · [X] motivos pra fazer [TÉCNICA] · o perigo de [HÁBITO] · [DOR] acontecia até eu fazer isso · como saber se [X] · como [CONHECIDO] afeta [CONHECIDO] · [X] coisas que você faz com [CONHECIDO] · o [CONHECIDO] de [DESEJO GRANDE] · a ciência por trás de [PROBLEMA] · [X] coisas que você não sabia · só quem tem [DESEJO] faz isso · [X] coisas que lentamente causam [PROBLEMA] · [X] [CONHECIDO] que vão deixar de existir · [X] coisas que [INSTITUIÇÃO] esconde · pense 2x antes de [CONHECIDO] · [X] coisas proibidas para [AVATAR] · [PERGUNTA LITERAL] · [AÇÃO JÁ ACONTECENDO] (in media res, ex-reel) · uma coisa rápida (tom de colega, ex-e-mail).
- **Crença (T64-T69):** eu estava errado sobre [CONHECIDO] (confissão, ex-reel) · porque eu [contra/a favor da crença] · como eu [DESEJO] fazendo [contra a crença] · [CONHECIDO], você faz errado · [X] [CONHECIDO] que geram o efeito contrário · porque estão usando [ALGO INESPERADO] para [DESEJO].
- **Disrupção (T70-T71):** fazendo [ALGO TABU] pela primeira vez · não abre esse [X] (negação, ex-e-mail).
- **Popularidade/Reputação (T72-T79):** [PERSONAGEM] fazia isso em [MOMENTO] · o conselho de [PERSONAGEM] · reagindo a [CONHECIDO] · vivi como [PERSONAGEM] por [TEMPO] · [X] coisas pra copiar de [CONHECIDO] · [X] pra ter [RESULTADO] de [PERSONAGEM] · a [TÉCNICA] de [CULTURA] · [PERSONAGEM] revela como [CONHECIDO] bloqueia [DESEJO].
- **Reconhecimento (T80-T86):** como [DESEJO] se você é [AVATAR] · [X] coisas que só quem é [AVATAR] entende · guia de [X] para [AVATAR] · [X] coisas que todo [AVATAR] deveria fazer · você não pode se chamar [AVATAR] se não [AÇÃO] · [X] ideias fáceis para [AVATAR] · se [SITUAÇÃO], faça isso imediatamente.

### Fórmulas que viraram VARIAÇÃO (a estrutura já existia, fundidas sob o T host)
~25 fórmulas do insumo colidiram com um T1-T30 e viraram variação anotada embaixo dele (lista completa nas seções "Variações e compressões" de cada família em `templates.md`):

| Fórmula minerada | Vira variação de |
|---|---|
| Faça isso e obtenha [DESEJO] em [TEMPO] | T1 |
| [X] [CONHECIDO] que geram [DESEJO/MEDO] · Como [DESEJO], [X] que geram [DESEJO] | T25 |
| Como um único [CONHECIDO] me trouxe [DESEJO] | T21 |
| O real segredo para [DESEJO] ⚠️anti-IA | T16 |
| [DESEJO], a verdade ⚠️anti-IA | T26 |
| Nunca mais tenha [DOR] · O que fazer quando [DOR] · Quando [DOR], faça isso · Como escapar de [DOR] · [PROBLEMA] aconteceu, o que fazer · O que fazer quando [AVATAR/SITUAÇÃO] | T14 |
| O que acontece quando [HÁBITO] | T21 |
| [X] diferenças entre [CONHECIDO] e [CONHECIDO] | T13 |
| Quando [SITUAÇÃO] acontecer, faça [X] | T14 |
| [X] erros fáceis · Não cometa esse erro · Nunca faça [CONHECIDO] desse jeito · [X] coisas que o [AVATAR] faz errado | T30 |
| Razões que fazem [PROBLEMA] · Porque [PROBLEMA] acontece | T4 |
| [X] sinais que [PROBLEMA] acontece | T22 |
| [CONHECIDO/CRENÇA] não é como você pensa | T28 |
| O guia completo para [DESEJO] | T82 |
| Se você faz [HÁBITO], então [CONSEQUÊNCIA] | T86 (host novo) |
| [X] coisas que só existem em [CONHECIDO] | T55 (host novo) |

### Os antigos moldes de FORMATO (H/Y/E) reclassificados
A separação por plataforma foi desfeita. Os que eram estrutura própria viraram T (in media res → T62 · prova crua → T42 · confissão → T64 · tom de colega → T63 · negação → T71); os demais (15 moldes) viraram **nota de compressão** (um T renderizado no teto de um formato), mapeados em `subcanones-formato.md`. Os candidatos **C11** (experimento) e **C12** (credencial na frente), que rendiam como Y4/Y5, seguem em incubadora; o irmão do C11 que emula personagem conhecido virou cânone (**T75**).

### Contagem do cânone após a Rodada 2
- **T1-T30** (Rodada 0-1) + **T31-T86** (Rodada 2) = **86 fórmulas T validadas**, distribuídas: Recompensa 19 · Mistério 28 · Crença 11 · Disrupção 5 · Popularidade/Reputação 8 · Reconhecimento 15. (Bem acima do piso de 50 do banco completo.)
- **+ C1-C6** ângulos ortogonais (camada de variação) · **C9-C12** candidatos (incubadora, fora do cânone).

### Mapa de Munição da Audiência (a fonte dos slots)
A Rodada 2 amarra cada slot das fórmulas a um dos **12 campos** do Mapa de Munição da Audiência, coletado pela `soft-plano-posicionamento` (Super Pesquisa + entrevista) e salvo no Plano. A gramática de slots no topo de `templates.md` diz de qual campo cada slot puxa. Sem o Mapa, a skill pergunta os 3-4 campos mais críticos pro tema (Passo 0 do SKILL.md).

### Como rodar rodadas futuras
No app **sem web** (Claude no chat, sem browse): `minera benchmark de [tema]` conduz com **o que o dono colar** (headlines de concorrente, prints de anúncio, títulos que ele viu performar), roda o dedup contra o cânone (T + C) e devolve o **veredito** (fórmula nova / variação / compressão de formato / fora de escopo / candidato) antes de propor qualquer T ou C novo. Nunca inventa dado de benchmark que não veio de fonte. Escopo ainda aberto: browse manual da Meta Ads Library BR (anúncios ativos 30+ dias com variações como proxy).

## Regra de autoria e neutralização

**Autoria Opção C:** o lastro citável nas references é **distante** (Hormozi, Caples, Copyblogger, Backlinko, Belkins, Klenty, SubSub, bases de estudo). Os **mentores e criadores BR** do material de origem **não aparecem** na skill: são neutralizados como "criadores BR" sem nome. A skill não credita o método a ninguém do insumo; credita o lastro externo distante que qualquer um pode conferir.
