---
name: soft-conteudo-carrossel
description: Escreve o CORPO de um carrossel de feed do método Soft, da capa ao CTA, a peça que mais converte no feed. Parte da headline já escolhida, abre o loop, conduz pela Fórmula 7 (arco ADMA) em 7 a 10 slides com uma tese por slide, e passa o carrossel inteiro pelo gate (densidade + as 3 perguntas do Harry + C/U/B + CTA + anti-IA) antes de mostrar. Use quando o pedido for "carrossel", "post de feed", "slides do carrossel", "corpo do carrossel", "escreve um carrossel", "monta um carrossel". NÃO use pra HEADLINE/gancho/capa/abertura isolada (soft-conteudo-headlines), nem pra arte/PNG/visual/design dos slides (soft-designer), nem pra reel (soft-conteudo-reels), stories (soft-conteudo-stories) ou multiplataforma (soft-conteudo-multiplataforma), nem pro Plano/posicionamento (soft-posicionamento), nem pra carta/VSL/venda (soft-funil).
---

# Carrossel, a peça que move a decisão

Reel atrai, carrossel vende. Quem desliza o primeiro slide já decidiu que vai aprofundar. O carrossel não fecha a venda (isso é a carta e o WhatsApp). Ele instala a crença que faz o leitor chegar na carta já tendo comprado a ideia. A peça não convence, ela reorganiza a percepção: o leitor chega sozinho na conclusão e a venda vira consequência. Carrossel que vira mini-aula falhou, o leitor já tem informação demais.

**O que esta skill faz por você:** pega a headline escolhida e monta o carrossel que instala a crença e move a decisão (reel atrai, carrossel vende). É o passo que esquenta o leitor antes da carta.

**As 6 leis (valem antes de tudo):** (1) nunca escreve como se o cliente já soubesse o contexto, zero palavra difícil, cria o contexto antes da afirmação; (2) abre ensinando o que faz; (3) é consultiva, puxa o contexto de você antes de gerar; (4) contexto é rei: a estrutura abaixo é guia, não trilho (ver Passo 2); (5) **admite se faltar insumo, nunca inventa**: confere se tem a fala/o número/o case antes de montar e, se faltar, marca `[DADO: confirmar]` no lugar do furo e diz o que falta, jamais preenche com algo plausível; (6) **doc de output enxuto pros 2 leitores**: o que sai é otimizado pro humano que lê E pra IA que recebe como contexto: só o carrossel limpo + `[DADO: confirmar]`, zero meta-narração. (Detalhe em `shared-references/operacao-padrao.md`, Seção 0.)

**Este SKILL.md é o processo inteiro. Siga os passos na ordem, pare nos checkpoints, e rode o gate antes de mostrar o carrossel.**

## Output Contract (o que você entrega)
- **A capa + 7 a 10 slides na Fórmula 7**, copy slide a slide, uma ideia por slide, na voz do cliente final do especialista.
- **O mapa de densidade** (a tese de cada slide em 1 frase). O gate roda **por dentro** (auditoria silenciosa); a tabela NÃO vai pra saída.
- Você entrega **um carrossel por vez** e **para** pra ajuste antes de gerar outro ou passar pro design.
- Você **nunca inventa fala nem número do cliente** e **nunca mostra um carrossel que falhou no gate**.
- A copy sai daqui. **A arte/PNG e a embalagem visual da capa são da `soft-designer`**, você define a tese e o texto e aciona ela.

## Passo 0, exige a headline e ancora (NÃO PULE)
O fluxo assume que a **headline/capa já foi escolhida** (veio da `soft-conteudo-headlines`). **Regra dura, vem antes de tudo:** se não tiver headline definida, **não comece o corpo** em hipótese nenhuma. Manda fazer a capa na `soft-conteudo-headlines` primeiro e para. A capa é 90% do jogo, o corpo se constrói a partir dela. (Os três estados de entrada abaixo só valem DEPOIS que a headline existe, eles tratam da fonte de fala, não da headline.)

Com a headline na mão, procura a fonte de fala real do cliente, nesta ordem: **descrição do projeto** → **Plano colado na conversa** → **mensagens anteriores**. Puxa **3-5 falas de DOR + 3-5 de DESEJO** do tema, literais, contando o N (quantas vezes apareceu). O diagnóstico e a prova do carrossel nascem dessas falas, quase intactas.

Três estados de entrada (já com a headline na mão, declara qual é o seu antes de escrever):
- **Tem fala real (com N):** ancora nela e cita o N. Caminho ideal.
- **Tem nicho/fundação mas ZERO fala literal:** NÃO inventa fala nem N. O diagnóstico ancora em **prova real do autor** (resultado, case, mecanismo); qualquer número que você não confirmou entra como `[DADO: confirmar]` e **NÃO conta como Ancorado=✓**. Avisa: minerar 5-8 falas reais deixa o carrossel muito mais cravado.
- **Sem nenhuma fonte de fala:** pergunta numa única mensagem (nicho em 1 linha + 1 dor real que o cliente fala) e segue daí.

A fundação (quando existe, do Plano): tese central · top 3 inimigos nominais · mecanismo nomeado · lista do "não defendo" · cliente em uma frase. A base não se inventa aqui, vem do Plano. Sem ela, a peça vira jornalismo que atrai estranho.

## Passo 0.1, escolhe o FORMATO (os 7 canônicos)

Antes de montar o mapa de densidade (Passo 1), decide o FORMATO do carrossel. São **7 formatos canônicos**, cada um serve um tipo de tema/objetivo diferente. O arco APSD (Fórmula 7) continua sendo o esqueleto conceitual, mas cada formato DISTRIBUI o arco de um jeito.

**Como escolher (router):** olha o TEMA + a INTENÇÃO da peça e recomenda **2 formatos** que encaixam, com 1 linha de razão cada. O dono decide. Nunca cravar 1 sozinho, sempre 2 pra ele escolher (formato é decisão editorial que muda a peça inteira).

**Duas regras duras que valem em TODOS os formatos:**
1. **CTA canônico obrigatório.** O slide final segue uma das 7 formas de CTA do Passo 3 (Direct com palavra-senha, Comentário, Siga com razão, Batida Emocional, Filtro Duro, Convite Específico, P.S. que vira CTA). Nunca CTA improvisado, nunca sem destino.
2. **Slides livres.** Número de slides varia por formato (2 no Promessa+CTA, 5-10 nos outros). NÃO forçar 10 slides quando o formato pede menos.

### Formato 1, Problema Solução
**Quando escolher:** tema pesado, dor real do avatar, você tem prova/case pra sustentar. É o "faz-tudo" que mais vende. Default quando o pedido é vago.
**Espinha (7-10 slides):** capa (hook confronta crença) · slide 2 abre loop mais fundo · diagnóstico (2 slides, a cena do leitor) · vilão nomeado · nova oportunidade · mecanismo função (2 slides) · prova + CTA.
**Exemplo de capa (SIA):** *"Você não precisa de mais um ChatGPT. Precisa de um sócio que abre a agenda sem você pedir."*
**Erro clássico:** slide 2 responde a capa em vez de aprofundar; mecanismo vira tutorial.
**Base:** o Passo 2 (Fórmula 7 APSD completa) desta skill é ESTE formato.

### Formato 2, Lista
**Quando escolher:** tema que naturalmente se organiza em itens ("N sinais de", "N erros que", "N coisas que"). Ótimo pra alcance e salvar.
**Espinha (6-9 slides):** capa (headline lista: "5 sinais de que...") · 1 item por slide (cada item é micro-diagnóstico ancorado em cena) · penúltimo slide vira a chave (o padrão que os itens revelam) · último slide CTA canônico.
**Exemplo de capa (SIA):** *"5 sinais de que o teu 'sócio IA' é só um ChatGPT com prompt bonito."*
**Erro clássico:** itens virarem lista genérica de conselho ("seja mais consistente"); vira "listículo" sem tese.
**Regra do formato:** cada item se explica sozinho E aponta pra mesma tese-mãe. Nunca listar 5 coisas desconexas.

### Formato 3, Problema Solução Rápido
**Quando escolher:** mesmo tema do formato 1 mas você quer postar mais na semana; tema simples que não pede 10 slides pra maturar.
**Espinha (5-6 slides):** capa · slide 2 aprofunda · diagnóstico em 1 slide (não 2) · nova oportunidade · mecanismo função + CTA no mesmo slide OU CTA separado.
**Exemplo de capa (SIA):** *"O motivo do teu ChatGPT esquecer tudo toda vez que você abre uma conversa nova."*
**Erro clássico:** achar que "rápido" é raso; o corte é de REDUNDÂNCIA, não de tese. Densidade continua a mesma.
**Regra do formato:** mantém ≥5 teses distintas em 5-6 slides.

### Formato 4, Dualidade (isso versus aquilo)
**Quando escolher:** quer FILTRAR forte, posicionar contra o mercado, mostrar categoria nova. Cara a cara.
**Espinha (6-8 slides):** capa (dualidade nomeada: "Agente X Sócio") · slide 2 abre a tensão · slides do meio alternam: "como todo mundo faz / como você faz" (3-4 pares) · slide de virada nomeia por que a diferença muda o jogo · CTA filtrante.
**Exemplo de capa (SIA):** *"Agente responde. Sócio abre a agenda."*
**Erro clássico:** comparações cosméticas ("mais rápido" vs "mais lento"); dualidade precisa ser categórica, não gradual.
**Regra do formato:** cada par tem que sustentar a MESMA fratura (o mesmo eixo de decisão), não misturar critérios.

### Formato 5, Promessa + CTA (dois slides)
**Quando escolher:** manter presença sem produzir demais; tema que morre esticado; capa forte que já entrega a virada.
**Espinha (2 slides):** slide 1 = promessa/virada completa (não é capa que abre loop, é capa que ENTREGA a tese) · slide 2 = CTA canônico com palavra-senha + o que a pessoa recebe.
**Exemplo de capa (SIA):** *"Sábado 14h, parque com a Alice, LEON operando. Comenta LEON e te mando como funciona."*
**Erro clássico:** slide 1 curto demais que não entrega nada; sem contexto do resultado, vira frase de motivação.
**Regra do formato:** o slide 1 tem que sustentar a peça INTEIRA sozinho. Se depende do slide 2 pra fazer sentido, virou capa órfã.

### Formato 6, Oportunidade Amplificada
**Quando escolher:** tema é uma janela de MERCADO/MOMENTO/TECNOLOGIA que tá aberta agora e 99% ignora. Bom pra tese ampla (categoria nova).
**Espinha (7-9 slides):** capa (nomeia a oportunidade + o custo de ignorar) · slide 2 mostra que a janela existe AGORA (fato/dado/sinal) · 2-3 slides amplificam: por que 99% não vê, o que os poucos que veem já colhem, o tamanho da diferença · slide de mecanismo (como capturar a oportunidade) · caso/prova · CTA convite específico.
**Exemplo de capa (SIA):** *"A janela pra virar Sócio IA da tua empresa fecha quando todo mundo perceber que dá. Hoje ainda não é todo mundo."*
**Erro clássico:** "oportunidade" vaga (hype geral de IA); precisa ser janela ESPECÍFICA com custo de ignorar nomeado.
**Regra do formato:** amplifica com FATO/DADO/SINAL, não com adjetivo ("gigante", "histórico", "único").

### Formato 7, Utilidade Viral
**Quando escolher:** planta autoridade sem vender direto; gera share alto; tema é "como fazer X" prático.
**Espinha (6-9 slides):** capa (utilidade nomeada: "Como fazer X sem Y") · slides do meio entregam o passo/dica com CENA real · penúltimo slide conecta a utilidade à tese-mãe (por que quem domina isso escala) · último slide CTA canônico (comentário/direct).
**Exemplo de capa (SIA):** *"Como instalar um segundo cérebro pro teu negócio em 1 tarde."*
**Erro clássico:** virar tutorial completo executável (a Faca Soft reprova: dá o tijolo, não a planta); OU utilidade solta sem conexão com o método.
**Regra do formato:** a utilidade é REAL (o leitor sai com algo aplicável), mas a **profundidade fica no método**. Ensina o QUE, sugere o COMO, guarda o PORQUÊ COMPLETO.

---

**Depois de escolher o formato:** volta pro Passo 1 (mapa de densidade), mas o número de teses/slides e a distribuição do arco APSD **seguem a espinha do formato escolhido**, não o default 7-10 da Fórmula 7 pura.


## Passo 1, declara a camada e monta o mapa de densidade (ANTES de escrever frase)
**Primeiro a camada (atração é funil, não bloco).** Decide a que camada este carrossel serve: muda a capa e o nível de filtro:
- **C1 Alcance:** capa que o leigo entende em 1s, não filtra; o técnico densifica nos cards 4-7. Volume (3-5/sem).
- **C2 Convicção:** capa que FILTRA (o cliente certo para, o resto passa); abre lacuna que só fecha no método. É o carrossel que mais vende (2-4/sem).
- **C3 Prova viva:** capa sobre o ALUNO transformado (nome + contexto + número + prazo); você é o mediador, não o herói (1-2/sem).

Declara a camada em 1 linha no topo do mapa. Detalhe + a **regra do "fragmento do produto"** (cada módulo do método vira 3-5 carrosséis C2 que abrem lacuna que só fecha no produto) em `references/camadas-conciencia.md`.

**Depois o mapa de densidade.** Densidade vence comprimento. Antes de redigir, lista **a tese de cada slide em 1 frase**, da capa ao CTA. Regra dura: **carrossel de ~10 slides exige ≥6 teses DISTINTAS.** Duas teses iguais com roupa nova se fundem (corta um slide). Cada slide AVANÇA a espinha, nunca repete o anterior com outras palavras.

Esse mapa é o esqueleto que o gate vai conferir. Se não fecha 6 teses distintas, o tema não tem corpo pra carrossel: ou aprofunda o ângulo, ou vira reel.

## Passo 2, distribui pela Fórmula 7 (arco ADMA, alta polaridade)
A Fórmula 7 são **7 movimentos** distribuídos nos **7 a 10 slides**. Movimento não é slide: alguns ocupam um card, outros se esticam por dois. A espinha é o arco ADMA (Atenção · Diagnóstico · Mecanismo · Ação). Começa em **alta polaridade** (a capa já confronta uma crença real do mercado) e termina instalando a crença nova. Sem tensão não há movimento, sem crença nova não há ação.

| # | Movimento | Slide | Função |
|---|---|---|---|
| 1 | **Hook** | 1 (a capa escolhida) | Confronta o status quo. Alta polaridade. Para o scroll. |
| 2 | **Quebra de Crença** | 2 | **Abre o loop**, vai MAIS FUNDO que a capa ("tem uma coisa pior"). Nunca responde nem reembala a capa. |
| 3 | **Diagnóstico** | 3 e 4 | Nomeia o problema com a cena que o leitor vive. Ele se reconhece. |
| 4 | **Vilão** | 5 | Nomeia o inimigo (o sistema/a prática), nunca o leitor. Tira a culpa dele. |
| 5 | **Nova Oportunidade** | 6 | Mostra que existe um caminho diferente. A virada. |
| 6 | **Mecanismo** | 7 e 8 | O método como veículo. Mostra a **FUNÇÃO**, nunca o passo a passo executável. |
| 7 | **Convite** | 9 e 10 | Caso/prova concreta + CTA que convida, não empurra. |

Os dois pontos onde o carrossel morre:
- **Slide 2 que responde a capa.** Não responde. O slide 2 aprofunda o loop, é onde a maioria mata a peça reembalando a capa com sinônimo. Vai mais fundo.
- **Slides 7-8 que ensinam o passo a passo.** Mostra a função (o que o método faz, que resultado entrega, por que muda o jogo), nunca o procedimento executável. O leitor sai sabendo que existe um caminho e quem o domina, não sabendo andar nele sozinho.

Menos de 7 slides não desenvolve a tensão. Mais de 10 cansa e derruba o CTA.

**Contexto é rei (a estrutura flutua).** A Fórmula 7 é o guia, não um trilho rígido. O assunto manda: um carrossel pode pesar mais no Mecanismo (2-3 slides só pra ele) e enxugar o Diagnóstico; outro pode ser quase inteiro sobre o Problema, quando a dor ainda não doeu o suficiente; outro corta a Nova Oportunidade porque a virada já está na capa. Mantém os 7 a 10 slides e o arco ADMA de pé, mas distribui o peso pelo que ESTE assunto pede. Decide o peso no mapa de densidade (Passo 1) e justifica em 1 linha.

## Passo 3, escreve slide a slide (na voz do cliente)
Escreve cada slide, **uma ideia por slide**, muito espaço, cada slide fechando numa frase-conclusão ancorada (nunca um slide que só prepara o próximo). Estilo Soft: uma ideia por frase, número no lugar de adjetivo, vocabulário do cliente final (nunca "lead/funil/ticket"), toma lado, nunca morno. Trabalha dor e desejo (o estado preso × o estado solto) e, quando der, ancora o contraste num número.

**Repertório tático por papel (puxa de `references/estrutura-peca.md`).** O arco da Fórmula 7 dá a ordem; a `estrutura-peca` dá as FORMAS de aterrar cada papel: escolhe **1 por papel**, nunca despeja todas:
- **Contexto (slide 3):** 1 das 7 formas: Cena Filmada · Dia Padrão · Conselho Falido · Número Próprio · Diálogo Interno · Paradoxo Observável · Contraste com Personagem. Nunca preâmbulo didático ("antes de entrar no método...") nem currículo.
- **Conteúdo (slides 7-8):** 1 das 7 formas: Contraste Emparelhado · Reframe · Casos Empilhados · Linha do Tempo Numérica · Nome-Número-Condição · Bastidor Crítico · Declaração+Sustentação. Sempre em contraste mercado×método.
- **CTA (slide final):** 1 das 7 formas: Direct com palavra-senha · Comentário · Siga com razão · Batida Emocional · Filtro Duro · Convite Específico · P.S. Ticket R$3k+ pede Filtro Duro.

**Faca Soft (teste antes de fechar cada slide de método):** *"se eu publicar isso, aumenta ou diminui o motivo de comprar o produto?"* Aumenta → fica. Diminui → corta. Dá o tijolo, nunca a planta da casa. (O exemplo card-a-card completo está em `references/06-carrossel.md` 6.7; modela, não copia.)

**Tempero, só na revisão (`references/dispositivos-de-frase.md`).** Com a estrutura de pé, pergunta "tá chapado?" e injeta 1-2 dispositivos (preparação+virada, antítese, evocação sensorial, dizer o não-dito) onde a peça está morna, nunca os 6 de uma vez, nunca no lugar da estrutura.

A **capa abre largo** (palavra do imaginário coletivo, pra não expulsar) e o corpo **nicha do meio pro fim** (onde aprofunda e filtra). O slide do CTA é **obrigatório e muito bem feito** (é o que vira o carrossel em mensagem no direct): de preferência uma **palavra-chave pra comentar** que entrega algo concreto, com os bullets do que a pessoa recebe. Ex.: comenta TRÁFEGO que eu te mando (1) o modelo de anúncio, (2) o passo do atendimento, (3) o painel. Liga a palavra-chave ao próximo passo real do funil (direct → carta/isca). Nunca termina só na consequência. Nunca CTA cafona. **Não narra o fluxo** ("agora vou o slide 5"), só entrega a copy limpa.

> Se existe skill de voz destilada do cliente (ex.: `soft-voz-leo-molina`), consulta ela antes de escrever: pilares, bordões e anti-valores são a fonte do tom.

## Passo 4, roda o GATE por dentro (auditoria silenciosa, NÃO imprime)
Roda o gate no carrossel inteiro **internamente** (auditoria silenciosa). Só carrossel com a linha VEREDITO=PASSA vai pro cliente. Uma falha refaz o ponto (não a peça inteira). A tabela abaixo é o teu **checklist interno**, nunca a saída: o usuário recebe só o carrossel limpo (Passo 5), jamais a tabela.

| Check | Passa se | ✓/✗ |
|---|---|---|
| **Ancorado** | diagnóstico/prova nascem de fala literal da fonte (cita N **real**) OU de prova real do autor; **N inventado/plausível = ✗ automático**; aspas só pra substring literal da fonte | |
| **Densidade** | o mapa do Passo 1 fecha **≥6 teses DISTINTAS** em ~10 slides; duas teses iguais com roupa nova = ✗ (funde e corta) | |
| **Slide 2 abre loop** | o slide 2 vai MAIS FUNDO que a capa ("tem uma coisa pior"); **não responde nem reembala a capa = ✗** | |
| **Mecanismo = função** | slides 7-8 mostram a FUNÇÃO do método; **qualquer passo a passo executável = ✗** | |
| **Espinha Fórmula 7 / ADMA** | os 7 movimentos estão na ordem; começa em alta polaridade; cada slide fecha numa conclusão ancorada (nenhum só prepara o próximo) | |
| **Confuso (C)** | dá pra ler cada slide sem reler; uma ideia por slide; zero abstração que não vira imagem | |
| **Inacreditável (U)** | nenhuma promessa que o leitor não engole; prova ancorada onde afirma resultado | |
| **Chato (B)** | nenhum slide morno/educativo neutro; polariza, mexe na crença ou na cena, não só informa | |
| **Harry, dá pra ver?** | o diagnóstico fecha o olho e vira cena. ✗ "tenha mais clareza" · ✓ "a call de 1h vira 40 min de desabafo e um 'vou pensar'" | |
| **Harry, dá pra falsificar?** | as afirmações são fatos falsificáveis, não adjetivos | |
| **Harry, só você diz?** | o concorrente direto não assina igual (cena/mecanismo proprietário, não promessa banal do nicho) | |
| **CTA forte com palavra-chave** | slide final tem CTA único e muito bem feito: palavra-chave pra comentar + o que a pessoa recebe (bullets/benefício) + próximo passo real do funil (direct/carta/isca); CTA fraco ou **sem destino = ✗** | |
| **Aponta pro método** | a peça aponta pro método ou faz seeding da tese; **jornalismo neutro ("5 fatos sobre X") = ✗** | |
| **Anti-IA (HARD)** | zero travessão "—" · zero "travar/travado/destravar" (exceção: aspa literal do cliente) · sem frase-emoldura ("a verdade é", "o segredo") · sem verbo-clichê ("revoluciona, destrava, transforma") · sem tricolon nem contraste "não é X, é Y" repetido. **No chat (sem o lint), faz um CTRL+F manual de "—" e da família "travar" em TODOS os slides antes de marcar ✓.** | |
| **VEREDITO** | **= o PIOR item acima.** Um ✗ qualquer = REFAZ. Só tudo-✓ = PASSA e vai pro cliente. | |

## Passo 5, mostra e PARA
Mostra **só o carrossel LIMPO** (como no Claude Chat), slide a slide: a copy de cada slide, sem tabela de gate, sem meta. Pergunta "esse carrossel te serve? ajusto algum slide ou parto pro design?". **Espera a escolha** antes de gerar outro carrossel ou acionar a `soft-designer` pra arte.

## When NOT to use (manda pra skill certa)
- Pediu **headline / capa / gancho / abertura** isolada → **soft-conteudo-headlines**.
- Pediu **arte / visual / PNG / design dos slides** → **soft-designer**.
- Pediu **reel** → **soft-conteudo-reels** · **stories** → **soft-conteudo-stories** · **adaptação multiplataforma** → **soft-conteudo-multiplataforma**.
- Pediu **Plano / posicionamento / fundação / mecanismo** → **soft-posicionamento**.
- Pediu **carta / VSL / página / a venda em si** → **soft-funil**.

## Anti-Patterns (sintoma → correção)
| Sintoma | Correção |
|---|---|
| Começou o corpo sem headline definida | Para: manda escolher a capa na `soft-conteudo-headlines` primeiro |
| Slide 2 reembala a capa com sinônimo | Reescreve aprofundando o loop ("tem uma coisa pior"/paradoxo), nunca responde a capa |
| 10 slides mas 3 teses repetidas | Funde as iguais e corta slide; carrossel é densidade, não comprimento |
| Mecanismo virou tutorial executável | Mostra resultado e função do método, esconde o procedimento |
| Slide que só prepara o próximo | Cada slide fecha numa frase-conclusão ancorada |
| Carrossel jornalístico ("5 fatos sobre X") | Costura o final apontando pro método ou faz seeding da tese |
| Terminou sem CTA ou com CTA cafona | Slide final: CTA único, firme, palavra-chave + próximo passo real do funil |
| Inventou um número/fala "plausível" | Só número/fala REAL; sem fonte, marca `[DADO: confirmar]` e não conta como Ancorado=✓ |
| Despejou a peça inteira sem mapa nem gate | Volta: mapa de densidade + gate impressos, e PARA pra escolha |
| Narrou o fluxo ("agora o slide 5") | Não narra: produz a copy em silêncio e entrega só o carrossel limpo, sem as tabelas do gate |
| Engessou a Fórmula 7 ignorando o assunto | Contexto é rei (Lei 4): redistribui o peso, mais no problema OU no mecanismo, mantendo o arco ADMA e os 7-10 slides |
| Imprimiu a tabela do gate na saída | O gate é INTERNO (auditoria silenciosa); a saída é só a peça limpa |

## References (só pra profundidade, o fluxo acima é autossuficiente)
- `references/06-carrossel.md`: a engenharia completa do carrossel (Alta Polaridade, a Fórmula 7 nos 10 slides, Embalagem A+B da capa, exemplo card a card, métricas e diagnóstico por sintoma). É a fonte da verdade do formato.
- `references/conducao-na-pratica.md`: os reframes da condução (palatável não raso, cada peça é um cheque, estourar a bolha, polarizar, dar o ouro). O porquê e o como por trás da peça.
- `references/modo-construcao.md`: o loop de escrever-e-auto-criticar (ancoragem antes da pele, gera 7 ângulos e descarta os 2 óbvios, teste de densidade, auto-gate). É o mesmo gate do Passo 4, com mais detalhe.
- `references/camadas-conciencia.md`: as 3 camadas de atração (C1 Alcance · C2 Convicção · C3 Prova viva), o critério de capa por camada e a regra do "fragmento do produto". **Dirigida no Passo 1.**
- `references/estrutura-peca.md`: a Estrutura-Mãe dos 5 papéis com as 21 formas nomeadas (7 de Contexto + 7 de Conteúdo + 7 de CTA), tabelas de decisão por papel, a Faca Soft e os anti-padrões de cada papel. **Dirigida no Passo 3.**
- `references/dispositivos-de-frase.md`: o repertório de tempero (preparação+virada, âncora do cotidiano, dizer o não-dito, evocação sensorial, antítese) que entra na revisão, depois da estrutura de pé. **Dirigida no Passo 3.**
- `scripts/lint_copy.py`: no Claude Code, roda `python3 scripts/lint_copy.py` no carrossel como cinto extra do anti-IA (reprova em-dash e "travar"). No chat não roda, por isso o CTRL+F manual do gate.
