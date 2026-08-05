---
name: soft-conteudo-reels
description: Escreve o ROTEIRO de um reel do método Soft, o vídeo curto lo-fi que para o scroll e atrai o cliente certo. Parte da headline já escolhida, constrói o corpo pela espinha ADMA comprimida na duração da camada (topo 15-40s, fundo 60-90s), escreve nos 3 tipos quando útil (falar, mostrar, texto na tela), e passa o roteiro pelo gate (verbatim real + as 3 perguntas do Harry + C/U/B + tensão que não relaxa + CTA com destino + anti-IA) antes de mostrar. Use quando o pedido for "reel", "roteiro de reel", "vídeo curto", "vídeo lo-fi", "reels", "script de vídeo", "o que falar no vídeo". NÃO use pra HEADLINE/gancho/capa/abertura isolada (soft-conteudo-headlines, faz a headline primeiro), nem pro carrossel (soft-conteudo-carrossel), stories (soft-conteudo-stories) ou adaptação multiplataforma (soft-conteudo-multiplataforma), nem pro Plano/posicionamento (soft-posicionamento), arte/PNG/visual (soft-designer), ou carta/VSL/venda (soft-funil).
---

# Reel, o vídeo curto que atrai

Reel atrai. Carrossel vende. A função do reel é uma só: fazer o cliente certo parar de rolar e te enxergar diferente. Ele não fecha venda (isso é na carta e no WhatsApp), não entrega passo a passo, não vira aula. Reel é story: peça diária, leve, gravada em minutos. Volume é o que faz o método rodar, e produção cara mata volume. O que performa é o gancho e a ideia, nunca a câmera.

**O que esta skill faz por você:** transforma a headline escolhida no roteiro do reel que para o scroll e atrai o cliente certo (reel atrai, carrossel vende). O roteiro é o que importa; a câmera, não.

**As 6 leis (valem antes de tudo):** (1) nunca escreve como se o cliente já soubesse o contexto, zero palavra difícil, cria o contexto antes da afirmação; (2) abre ensinando o que faz; (3) é consultiva, puxa o contexto de você antes de gerar; (4) contexto é rei; (5) **admite se faltar insumo, nunca inventa**: confere se tem a fala/o número/o case antes de montar e, se faltar, marca `[DADO: confirmar]` no lugar do furo e diz o que falta, jamais preenche com algo plausível; (6) **doc de output enxuto pros 2 leitores**: o que sai é otimizado pro humano que lê E pra IA que recebe como contexto: só o roteiro limpo + `[DADO: confirmar]`, zero meta-narração. (Detalhe em `shared-references/operacao-padrao.md`, Seção 0.)

**Este SKILL.md é o processo inteiro. Siga os passos na ordem, pare nos checkpoints, e rode o gate antes de mostrar qualquer roteiro.**

## Output Contract (o que você entrega)
- Por padrão, **1 roteiro de reel completo** pro pedido: headline nos 3 primeiros segundos (nos 3 tipos quando útil) + corpo pela espinha ADMA + CTA com destino real. Escrito como fala/cena, não como ensaio literário.
- O gate roda **por dentro** (auditoria silenciosa); a tabela NÃO vai pra saída. O roteiro vem com a marcação da espinha (qual frase é qual movimento).
- Você **para e espera** o cliente aprovar/ajustar antes de gerar outro ou escalar pra lote.
- Lote (5 reels numa tarde, banco de pautas) só sob comando explícito "lote de [tema]".
- Você **nunca inventa fala nem número do cliente** e **nunca mostra roteiro que falhou no gate**.

## Passo 0, parte da headline e ancora (NÃO PULE)
O reel começa de uma **headline já escolhida**. Se o usuário ainda não tem a headline (a frase que para o scroll nos 3 primeiros segundos), você **não escreve o corpo**: manda fazer a headline antes na **soft-conteudo-headlines** e volta com ela. Corpo sem gancho é vídeo que ninguém assiste.

Com a headline na mão, procura a fonte de fala real do cliente, nesta ordem: **descrição do projeto** → **Plano colado na conversa** → **mensagens anteriores**. Puxa **3-5 falas de DOR + 3-5 de DESEJO** do tema, literais, contando o N (quantas vezes apareceu). O corpo do reel nasce dessas falas, na voz do cliente final, nunca no jargão de marketing.

Três estados de entrada (declara qual é o seu antes de escrever):
- **Tem fala real (com N):** ancora nela e cita o N. Caminho ideal.
- **Tem nicho/fundação mas ZERO fala literal:** NÃO inventa fala nem N. O roteiro ancora em **prova real do autor** (resultado, case, mecanismo); qualquer número que você não confirmou entra como `[DADO: confirmar]` e **NÃO conta como Ancorado=✓**. Avisa: minerar 5-8 falas reais (ou rodar o Plano na soft-posicionamento) deixa o roteiro muito mais cravado.
- **Sem nicho e sem nada:** pergunta numa única mensagem (nicho em 1 linha + 1 dor real que o cliente fala + a headline) e segue daí.

A fundação (quando existe, do Plano): tese central · top 3 inimigos nominais · mecanismo nomeado · cliente em uma frase.

## Passo 1, confirma o ÚNICO ponto do reel
O reel carrega **um insight, uma virada, uma frase**, nunca a tese inteira. Quem tenta cuspir tudo numa peça produz vídeo pesado que ninguém assiste. Define em uma linha qual pedaço do quebra-cabeça esta peça materializa, e o que ela reorganiza na cabeça do leitor. A peça não precisa estar completa: ela é uma pecinha que o mercado monta ao longo do tempo. Se o ponto não cabe numa frase, ainda está grande demais, corta antes de roteirizar.

**Declara a camada (atração é funil, não bloco):** C1 = reel curto com gancho que o leigo entende (alcance) · C2 = reel longo opinativo, técnica entremeada com opinião pessoal (convicção, ótimo pra dark post) · C3 = reel-visita ao cliente no contexto real dele (prova viva). A camada muda o gancho e o comprimento. (Detalhe em `references/camadas-conciencia.md`.)

## Passo 2, escreve o gancho nos 3 tipos (os 3 primeiros segundos)
A headline do Passo 0 entra nos 3 primeiros segundos, trabalhada em **até 3 frentes ao mesmo tempo**. Uma já segura. As três em conflito multiplicam (o texto contradiz a imagem, a fala abre o loop, a pessoa precisa descobrir o que vem). Escreve as que servirem ao reel:

| Tipo | O que é | Como aparece |
|---|---|---|
| **FALAR** | a frase dita na boca nos primeiros segundos | a headline falada, direta |
| **MOSTRAR** | a cena/imagem que prende: exagero, movimento, contraste | print circulado · objeto inesperado · antes/depois |
| **TEXTO NA TELA** | a frase sobreposta, grande, lida em silêncio | aparece enquanto a boca fala outra coisa relacionada |

Não força os três se um só já cria o conflito. Mas marca no roteiro qual entra em cada frente.

**Confirma qual dos 7 gatilhos a abertura aciona** (Recompensa · Mistério · Reconhecimento · Popularidade · Crença · Autoridade · Disrupção): toda abertura forte aciona ≥1. A headline já vem da `soft-conteudo-headlines` com o gatilho escolhido; aqui você confirma qual está ativo no corpo. **Disrupção exige defesa com argumento sólido logo depois**, senão vira clickbait e queima reputação. (Tabela dos 7 + os 3 tipos detalhados em `references/metodo-reel.md` 7.4.)

**Amplificador (opcional, 0-2s antes da headline falada):** uma frase curta que precede a headline e carrega 2s a mais de atenção (ex.: "Por que ninguém tá falando sobre isso?"). Os 10 canônicos + a afinidade por template em `references/amplificadores.md`. Um por peça, nunca se a headline já está cravada ou o tempo dos 3s estourou.

**Como aparecer no vídeo é só sugestão, nunca obrigação.** A pessoa grava do jeito dela; o que a skill garante e entrega é o ROTEIRO. Quando sugerir cena, gesto ou edição, deixa explícito que é opcional, um caminho possível, não uma regra.

### MODO ALCANCE vs MODO FILTRO (declara o modo ANTES de escrever o gancho)
- **Reel de TOPO (objetivo alcance): capa/gancho AMPLO**, o filtro entra do meio pro fim do reel. Motivo com número: ~50% da audiência cai nos 3 primeiros segundos; reel com hold acima de 60% nos 3s alcança 5 a 10x mais que reel com hold abaixo de 40%. Gancho que filtra cedo derruba o hold e mata a distribuição.
- **Reel de FUNDO (aquecer quem já segue): filtro cedo**, doutrina Soft normal.
- A escolha do modo é declarada antes de escrever. **Em anúncio, SEMPRE modo filtro** (regra da capa por terreno da `soft-trafego-meta`: em anúncio o criativo é a segmentação, gancho amplo entrega lead ruim).

### FORMATO YAP (talking-head cru)
Variante lo-fi levada ao limite: vídeo falado direto pra câmera, zero edição polida, cenário real (sofá, carro, rua). Benchmark 2026: especialista falando direto pra câmera supera criativo polido em alcance e engajamento; o cérebro processa rosto mais forte que qualquer outro estímulo visual; confiança em pessoa vale mais que confiança em anúncio. **REGRA-CHAVE: o yap viral é PLANEJADO com cara de improviso.** A espinha ADMA continua obrigatória por baixo; o que muda é a casca: sem corte seco, sem legenda de estúdio, fala corrida de mesa. Compatível com MODO ALCANCE.

### FORMATO REEL DE 7 SEGUNDOS (vídeo mudo, conteúdo na legenda)
Variante que inverte onde mora a informação: o vídeo (até 7s, sem fala, cena cotidiana comum, tomando café, mexendo com o cachorro, trabalhando, embalando pedido, sem olhar pra câmera) é só o gancho visual, e o conteúdo inteiro vai pra legenda (1000-1500 caracteres, escrita por esta skill e passando pelo gate normal do Passo 5, mesmo sem fala no vídeo). Por cima do vídeo entra um título de curiosidade que empurra pra legenda (modelo: "e eu que descobri o método para alcançar X objetivo"), o TEXTO NA TELA do Passo 2 fazendo esse trabalho sozinho, já que aqui não há FALAR nem MOSTRAR carregando gancho. Ritmo: 1-2 posts por dia. Compatível com MODO ALCANCE (gancho amplo, o filtro mora na legenda). **Nota de automação:** o formato é esteira: biblioteca de cenas cotidianas reaproveitável + títulos de curiosidade do banco de headlines + legenda gerada por esta skill formam um pipeline automatizável (cena + título + legenda), sem depender de roteiro falado novo a cada peça.
Lastro (benchmark 2026, tecnica conhecida como "Read Caption"): o intervalo de decisao do viewer e exatamente 5-7s; reel curto tem 68% de completion vs 48% do longo, e completion e o sinal que o algoritmo mais premia; 75% assistem no mudo. Legenda com pergunta/CTA puxa comentario e amplia distribuicao.

## Passo 3, desenvolve pela espinha ADMA (na duração da camada)
A mesma espinha do carrossel, comprimida no tempo do vídeo. Cada frase abre a próxima. **A tensão não relaxa.** Se o leitor consegue prever a próxima frase, ele pula. A tensão é o que segura, não a informação. Mostra o **diagnóstico**, nunca o passo a passo executável (passo a passo vira aula grátis e não vira venda).

| Trecho | Movimento | Função |
|---|---|---|
| **3s** | Atenção (Hook) | interrupção, a frase que para o scroll (a headline do Passo 2) |
| **Abertura** | Quebra de crença | conflito, mostra a tensão vivida, não resolve ainda |
| **Meio** | Diagnóstico + Vilão | nomeia a causa real, o culpado é o modelo velho, não o leitor |
| **Virada** | Nova oportunidade | a virada de interpretação, existe um caminho diferente |
| **Fechamento** | Mecanismo + Convite | aponta pro método (função, não execução) + CTA com destino |

Duração POR CAMADA (benchmark de retenção 2026: faixa ótima 30-60s; abaixo de 30s tem o maior engajamento): TOPO/alcance 15-40s · FUNDO/aquecer 60-90s. Passar de 90s só quando a tese exigir e cada bloco segurar sozinho. Quando for impulsionar, testa o corte 30-45s contra a versão longa antes de escalar. Polariza (toma lado, gancho que polariza exige corpo que sustenta). Carrega **moeda social** (≥2 de: valor prático, identificação, opinião forte, argumentação, notícia, história, prova, fato curioso). Sempre aponta pro método ou faz seeding da tese.

**Depois do gancho, o conteúdo precisa ser NOTÁVEL** (`references/metodo-reel.md` 7.5): (1) algo NOVO, um ângulo que quase ninguém falou (se a pessoa prevê a próxima frase, ela pula); (2) baixo carregamento cognitivo, explica como pra criança, termo técnico só com tradução fácil em seguida; (3) sem encher linguiça, curto não raso, zero introdução antes de entrar no conteúdo.

Os 6 roteiros-modelo (decisão contraintuitiva · erro que custou caro · bastidor · contraste de resultado · crença errada · caso real) estão em `references/roteiros-modelo.md`, profundidade opcional, clona e adapta, nunca copia cru.

## Passo 4, fecha com CTA de próximo passo real
O reel não fecha venda, mas aponta pra onde. O CTA convida, não empurra, e tem **destino concreto do funil**: salvar, comentar uma palavra, mandar pra alguém, ir pro carrossel que aprofunda, ir pra isca/carta. CTA sem destino é peça órfã, o leitor para e não tem pra onde ir. Escreve o CTA na voz do cliente, ligado ao ponto único do reel.

## Passo 5, roda o GATE por dentro (auditoria interna, NÃO imprime)
Roda o gate no roteiro **internamente** (auditoria silenciosa). Só roteiro com a linha VEREDITO=PASSA vai pro cliente. Um ✗ refaz o ponto que falhou (não o conceito inteiro). A tabela abaixo é o teu **checklist interno**, nunca a saída: o usuário recebe só o roteiro limpo (Passo 6), jamais a tabela.

| Check | Passa se | ✓/✗ |
|---|---|---|
| **Ancorado** | nasce de fala literal da fonte (cita N **real**) OU de prova real do autor; **N inventado/plausível = ✗ automático**; fecha em chão (número, avatar, cena, mecanismo), não em tese solta bonita | |
| **Um ponto só** | a peça carrega UMA virada, não a tese inteira; cabe numa frase | |
| **3 tipos de gancho** | usa Falar/Mostrar/Texto na tela quando útil (ao menos 1 marcado; ideal os 3 em conflito) | |
| **Tensão contínua** | a tensão NÃO relaxa no meio; em nenhum ponto o leitor prevê a próxima frase (se prevê, ele pula) | |
| **Lo-fi** | gancho + ideia carregam a peça, sem depender de câmera/edição cara; gravável em minutos | |
| **Espinha ADMA** | Atenção → Diagnóstico → Mecanismo → Ação visível e comprimida na duração da camada (topo 15-40s, fundo 60-90s); mostra função, nunca passo a passo | |
| **CTA com destino** | termina com próximo passo real do funil (salvar/comentar/manda/carrossel/isca), não solto | |
| **Harry, dá pra ver?** | fecha o olho e enxerga a cena. ✗ "tenha mais clareza" · ✓ "a recepcionista diz: semana que vem enche" | |
| **Harry, dá pra falsificar?** | é fato falsificável, não adjetivo | |
| **Harry, só você diz?** | o concorrente direto não assina igual (cena/mecanismo proprietário, não promessa banal do nicho) | |
| **C/U/B** | não é **C**onfuso (carregamento cognitivo baixo, explica como pra criança), não é inacreditável (**U**nbelievable, promessa que o leitor não compra), não é **B**oring (chato, encheção de linguiça, introdução antes do conteúdo) | |
| **Anti-IA (HARD)** | zero travessão "—" · zero "travar/travado/destravar" (exceção: aspa literal do cliente) · sem frase-emoldura ("a verdade é", "o segredo") · sem verbo-clichê ("revoluciona, destrava, transforma"). **No chat (sem o lint), faz um CTRL+F manual de "—" e da família "travar" antes de marcar ✓.** | |
| **VEREDITO** | **= o PIOR item acima.** Um ✗ qualquer = REFAZ. Só tudo-✓ = PASSA e vai pro cliente. | |

## Passo 6, mostra e PARA
Mostra **só o roteiro que passou, LIMPO** (como no Claude Chat), com a espinha marcada (qual frase é qual movimento). Sem tabela de gate, sem meta. Pergunta "esse te serve? ajusto ou faço outro?". **Espera a escolha** antes de gerar outro ou montar lote. **Não narra o fluxo** ("agora vou auditar"), só entrega limpo.

**Quando um reel performa, escala (regra do "faz mais", `references/metodo-reel.md` 7.7):** faz mais do mesmo ASSUNTO em outros ângulos, OU troca o tema mantendo a ESTRUTURA da headline que funcionou. Mede comparando com o típico do TEU perfil (skip rate · tempo médio · tempo total · interações), nunca com benchmark de fora: a métrica é diagnóstico, não troféu (`references/metodo-reel.md` 7.9).

## When NOT to use (manda pra skill certa)
- Pediu só a **headline / gancho / capa / abertura** isolada → **soft-conteudo-headlines** (e faz a headline ANTES deste reel).
- Pediu **carrossel** → **soft-conteudo-carrossel**. Pediu **stories** → **soft-conteudo-stories**. Pediu **adaptar pra LinkedIn/X/YouTube** → **soft-conteudo-multiplataforma**.
- Pediu o **Plano / posicionamento / fundação** → **soft-posicionamento**.
- Pediu **arte/visual/PNG/edição** → **soft-designer**.
- Pediu **carta / VSL / página / venda** → **soft-funil**.

## Anti-Patterns (sintoma → correção)
| Sintoma | Correção |
|---|---|
| Escreveu o corpo sem ter headline | Volta: a headline é o Passo 0; sem ela, manda pra soft-conteudo-headlines primeiro |
| Tentou meter a tese inteira no reel | Um ponto só por peça; o resto é outra peça do quebra-cabeça |
| Roteiro relaxa no meio (dá pra prever a frase) | Reescreve pra tensão contínua; cada frase abre a próxima |
| Entregou o passo a passo executável | Mostra função e diagnóstico, nunca o como; passo a passo vira aula grátis |
| Pediu câmera/edição cara | Lo-fi: gancho e ideia carregam; gravável em minutos |
| Impôs como gravar ou aparecer | Sugestão, não obrigação; a pessoa grava do jeito dela, a skill garante o roteiro |
| CTA solto ("siga pra mais") | CTA com destino real do funil (salvar/comentar/manda/carrossel/isca) |
| Inventou um número/fala "plausível" | Só número/fala REAL; sem fonte, marca `[DADO: confirmar]` e não conta como Ancorado=✓ |
| Despejou 5 reels de uma vez | 1 por vez com gate; lote só sob comando "lote de [tema]" |
| Narrou o fluxo ("agora vou pro passo X") | Não narra: executa em silêncio e entrega só o roteiro limpo, sem a tabela do gate |
| Imprimiu a tabela do gate na saída | O gate é INTERNO (auditoria silenciosa); a saída é só a peça limpa |

## References (só pra profundidade, o fluxo acima é autossuficiente)
- `references/roteiros-modelo.md`: os 6 roteiros de reel escritos por inteiro (fala + marcação de tempo + edição) pra clonar e adaptar ao nicho.
- `references/roteiros-modelo-gringos.md`: 49 estruturas de roteiro modeladas de material externo (04/08/2026, marca-neutra), rodízio de forma pra clonar a ESTRUTURA e preencher com o território do avatar; nunca copia o exemplo, todo roteiro gerado passa pelo gate do Passo 5.
- `references/producao-em-lote.md`: template de sessão, rotinas por tipo de reel, calendário por objetivo, sessão-modelo completa (pro comando "lote de [tema]").
- `references/anti-padroes.md`: os anti-padrões do reel com pares errado→certo escritos por extenso.
- `references/metodo-reel.md`: o capítulo-método completo do reel (Lo-fi vence Hi-fi, a Fórmula 7 comprimida, os 3 tipos + os 7 gatilhos da atenção 7.4, conteúdo notável 7.5, a regra do "faz mais"/escalar 7.7, e as 4 métricas como diagnóstico 7.9). É a fonte da verdade do formato. **Dirigida nos Passos 2, 3 e 6.**
- `references/amplificadores.md`: os 10 amplificadores canônicos (frase de 0-2s antes da headline falada) + a tabela de afinidade por template + as regras de uso. **Dirigida no Passo 2.**
- `references/camadas-conciencia.md`: as 3 camadas de atração (C1 reel curto · C2 reel longo opinativo · C3 reel-visita). **Dirigida no Passo 1.**
- `references/estrutura-peca.md`: a Estrutura-Mãe dos 5 papéis com as formas de aterrar Contexto/Conteúdo/CTA, pra quando o reel precisa de repertório tático no corpo.
- `references/dispositivos-de-frase.md`: o repertório de tempero (virada, antítese, evocação sensorial) que entra na revisão, depois da estrutura de pé.
- `scripts/lint_copy.py`: no Claude Code, roda `python3 scripts/lint_copy.py` no roteiro como cinto extra do anti-IA (reprova em-dash e "travar"). No chat não roda, por isso o CTRL+F manual do gate.
