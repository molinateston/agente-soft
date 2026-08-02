# Simulador de comentários ao vivo (o chat injetado do perpétuo gravado)

Esta reference define UMA capacidade operacional da skill: **gerar o cronograma de comentários que a plataforma de webinar injeta num perpétuo gravado, simulando uma sala viva de N pessoas, e auditar um webinar pronto pra fechar os buracos de consistência.** O webinar gravado não tem chat ao vivo; sem nada, ele nasce vazio, e "ninguém quer ser o primeiro" a comentar. A plataforma (EverWebinar, WebinarKit) tem um campo de chat simulado que dispara mensagens por timestamp; o que faltava era a skill produzir o conteúdo desse campo com método: volume certo, colocação estratégica, falas naturais brasileiras, e zero contradição com o roteiro.

> **A decisão que abre esta reference (fonte de referência, 10/jun):** no perpétuo, a **simulação de comentários É padrão.** Isto SUPERA a nota mais conservadora do `gravacao-energia-ao-vivo.md` (que tratava só comentários reais como padrão e a simulação como variante a validar). A fonte de referência decidiu: a sala simulada é o desenho operacional do perpétuo Soft. A nota de honestidade fica LEVE e precisa: a **escassez/vagas declaradas continuam REAIS** (guarda-corpo G7, sessão de lugares limitados de verdade, contador honesto); os **comentários reproduzem a energia típica que uma sala real daquele tamanho teria** naquele momento da aula. Não se inventa resultado de cliente, não se inventa número de vagas, não se mente estoque. Simula-se a CONVERSA de uma sala, não a PROVA do produto.

> **Fronteiras (o que NÃO mora aqui, pra não duplicar):**
> - **Como GRAVAR com energia** (3 formas de gravar, conduta de sala, eco de chat real, setup): roteiro/gravação = território da **soft-webinar-plano**. Aqui é o que entra no chat DEPOIS de a gravação existir.
> - **A engenharia de interação do host** (escada de micro-compromissos, eco nominal, perguntas-isca, falas literais dos campeões): bundlada aqui em `interacao-chat-ao-vivo.md`. Eu uso a PREMISSA daqueles padrões pra saber o que a sala responde a cada comando do host; não recopio as falas do host.
> - **Subir/operar o perpétuo, scheduling, contador de presença, config, tags, CRM, ROAS, pós-webinar**: território da **soft-webinar-plano** / **soft-vendas-closer**. Aqui só o campo de chat simulado.
> - **A ordem dos blocos e ONDE ficam o "EU QUERO", o carrinho aberto, o pitch**: a espinha canônica do roteiro é da **soft-webinar-script**. Eu mapeio a CURVA de comentários sobre essa ordem; quando o roteiro foi colado na conversa, ancoro nele.

> Voz dos comentários = **participante brasileiro real**, não o tom clínico do host. O participante fala torto, abrevia, erra acento, usa gíria leve. O host é frio e mede; o público é quente e desorganizado. Exemplos marcados como EXEMPLO. Nomes próprios do método (Big Idea, mecanismo, bônus, produto) entram como SLOT `[…]`. Zero travessão de prosa.

---

## Índice

- 1. O problema e a decisão (por que esta capacidade existe)
- 2. O formato Excel (a skill aprende o modelo de referência)
- 3. A matemática de cadência (volume e curva de densidade)
- 4. Tipos de comentário + colocação estratégica (com falas prontas)
- 5. Realismo (anti-robótico)
- 6. A checagem de consistência (a parte crítica, bidirecional)
- 7. Os 2 modos de uso
- 8. Checklist final (antes de subir o Excel na plataforma)
- Anti-padrões (o que quebra a simulação)
- Gate de saída obrigatório, o Crivo (bloqueante)

---

## 1. O problema e a decisão (por que esta capacidade existe)

**O problema.** Um perpétuo é uma aula gravada uma vez e rodada todo dia, em 4 horários (`perpetuo-mecanica.md`). O vídeo é o mesmo sempre; o que muda a cada sessão é a sala que entra. Mas a sala que entra não pode digitar pro vídeo (ele já aconteceu), e o host gravado não pode responder de verdade. Restam duas opções: deixar o chat morto (a aula respira como cinema vazio, a tela parada perde a sala) ou **injetar um chat roteirizado** que reproduz o movimento de uma sala viva. A plataforma serve o campo técnico (mensagens por timestamp); a skill serve o conteúdo.

**A decisão (fonte de referência, 10/jun).** No perpétuo, **simular comentários É o padrão Soft.** Não é o último recurso, é o desenho. A razão é a mesma tese da energia do `gravacao-energia-ao-vivo.md`: o que converte não é só o que o host fala, é o ambiente de sala viva que faz o lead ficar imerso. Uma sala silenciosa denuncia o gravado e inverte o sinal de confiança; uma sala que conversa sustenta o frame de evento. O caminho "duplicar a melhor sessão real com comentários reais" continua válido e é o ideal quando existe (`gravacao-energia-ao-vivo.md` §2 e §5.1); mas a maioria dos perpétuos não nasce de uma sessão ao vivo gravada com chat, e pra esses a simulação roteirizada é o padrão.

**A nota de honestidade (leve, mas inegociável):**

| O que é REAL e nunca se simula | O que a simulação REPRODUZ |
|---|---|
| Vagas/lugares da sessão (escassez por sessão, G7) | A energia típica de conversa de uma sala daquele tamanho |
| Contador de presença na faixa honesta (`perpetuo-vs-aovivo.md`) | O movimento do chat: reações, "EU QUERO", dúvidas, compras |
| Resultados/depoimentos de clientes (são reais, do banco do player) | A naturalidade de quem comenta (nomes, cidades, timing humano) |
| Preço, oferta, garantia, bônus | O FOMO e o social proof de uma sala convertendo |

A régua, em uma frase: **simula-se a sala, nunca a prova.** Um comentário simulado pode dizer "acabei de garantir, tava esperando isso"; não pode dizer "fiz o método e perdi 18kg" (isso seria depoimento inventado, anti-padrão nomeado no `gravacao-energia-ao-vivo.md` §5.1). O resultado vem do banco real do player ou não vem.

---

## 2. O formato Excel (a skill aprende o modelo de referência)

A plataforma importa o chat simulado de uma planilha. **A skill NÃO impõe um formato: ela lê o modelo que o autor do método (ou o player) sobe e gera NAQUELE formato.** Aprende as colunas dele, os nomes das colunas, a ordem, e devolve a planilha pronta pra importar sem retrabalho.

**Regra de operação (vale nos dois ambientes):**
- **SEMPRE perguntar/pedir o modelo primeiro.** "Você tem o modelo de planilha que a sua plataforma importa? Sobe pra mim que eu gero nesse formato." Plataformas diferentes (EverWebinar × WebinarKit) e contas diferentes têm colunas diferentes; gerar no formato errado é obrigar o especialista a remapear coluna a coluna.
- **No Claude CHAT:** o autor do método sobe o `.xlsx`/`.csv` no chat; a skill lê as colunas, gera o conteúdo e devolve uma tabela markdown pronta pra colar OU um CSV pra baixar. (Chat não roda script, então o entregável é a tabela/CSV.)
- **No Claude CODE:** a skill lê o arquivo do disco, gera e grava o `.csv`/`.xlsx` no formato exato do modelo (mesmas colunas, mesma ordem, mesmo cabeçalho). Se a plataforma exige timestamp em formato específico (mm:ss, segundos absolutos, hh:mm:ss), respeitar o que o modelo mostra.

**FORMATO CANÔNICO da plataforma de referência (confirmado 10/jun).** É ESTE o CSV de import:

```
username,message,minutes,seconds
phil,I like pizza,0,10
Joe,I LOVE pizza,0,15
```

| Coluna | O que é |
|---|---|
| **username** | quem comenta. Primeiro nome BR (ver §5). Quando o host vai ECOAR a origem, embute aqui ("Camila RJ") ou no `message`. |
| **message** | a fala, voz de participante. |
| **minutes** | o minuto da sessão em que a mensagem dispara. |
| **seconds** | o segundo (0-59) dentro daquele minuto. |

**Regras DESTE formato (inegociáveis):**
- São **só 4 colunas**: `username,message,minutes,seconds`. NÃO existe coluna de cidade nem de tipo no arquivo. A cidade vai no `username` ("Camila RJ") ou dentro do `message` ("oi gente, de Salvador!"), e só quando o host pede "de onde você é" (senão polui).
- O **tipo** de comentário (abertura, reação, eu-quero, prova, compra, objeção, fomo, hater, fechamento) é **planejamento INTERNO** da skill pra montar a curva e auditar. Fica num rascunho à parte, **nunca entra no CSV**.
- O timestamp é **minuto + segundo da SESSÃO**, em duas colunas separadas (não um campo só). Ordenar o arquivo final por (`minutes`, `seconds`) crescente.
- Disparos **escalonados**: nunca dois comentários no mesmo `minutes,seconds`; espalhe alguns segundos entre eles (sala real não fala em uníssono).
- **PROIBIDO saudação por hora do dia** - nada de "bom dia", "boa tarde", "boa noite". O perpétuo roda o MESMO vídeo em 4 horários por dia (`perpetuo-mecanica.md`): quem assiste às 21h vendo um chat que diz "boa tarde" percebe na hora que é gravado, e o frame de evento ao vivo cai. Usar saudação NEUTRA de chegada: "oi gente", "cheguei!", "opa", "presente", "tô aqui", "primeira vez aqui". Vale pra TODA mensagem do chat, especialmente as de entrada/abertura.

> **EXEMPLO (formato real).** O eco do host "muito legal, Camila do Rio de Janeiro" no minuto 6 exige uma linha tipo `Camila RJ,oi gente! de Niterói aqui,5,40` ANTES (5min40s < 6min). O host ecoa no 6:05; a Camila apareceu no 5:40.

> **Outras plataformas:** se um player usa EverWebinar/WebinarKit com colunas diferentes, vale a régra geral (pedir o modelo, gerar naquele formato). Mas `username,message,minutes,seconds` é o formato de referência e o **default da skill**.

---

## 3. A matemática de cadência (volume e curva de densidade)

Dado **N = pessoas-alvo "ao vivo"** (o número que a sessão simula ter na sala; coerente com o contador de presença do `perpetuo-vs-aovivo.md`, não maior), calcular o VOLUME total de comentários e a DISTRIBUIÇÃO ao longo da aula.

### A régua concreta

- **% da sala que comenta:** uma sala real tem maioria silenciosa. Trabalhe com **~10-15% da sala produzindo comentários ao longo de toda a aula**, e cada um desses comenta de 2 a 4 vezes (a escada de micro-compromissos faz o mesmo dedo voltar ao chat). Pra N=200 isso dá ~20-30 pessoas ativas × ~3 comentários = **~60 a 90 comentários no total** numa aula de 60-90 min. Régua de bolso: **~1 comentário por minuto de média**, mas a média mente, porque a distribuição é em ondas (ver curva).
- **Teto de poluição (herdado do `gravacao-energia-ao-vivo.md` §5.1):** mesmo simulado, não estourar. Acima de ~150-200 mensagens visíveis "ninguém presta atenção na aula, presta no chat". A simulação dá energia, não ruído.
- **Comentários/minuto por fase:** ZERO a baixo no meio do ensino (pra não competir com o conteúdo), picos nos momentos de comando e prova, MÁXIMO no carrinho aberto.

### A curva de densidade (onde concentrar, mapeada sobre a espinha do roteiro, da soft-webinar-plano ou colado na conversa)

```
densidade
 ALTA  │              ▂▂                                    ████ ← CARRINHO ABERTO
       │   ▆▆        ▆██▆           ▅▅                      ████   + FECHAMENTO
 MÉDIA │  ▆██▆      ▆████▆   ▃▃    ▆██▆    ▃▃               ████
       │ ▆████▆    ▆██████▆ ▆██▆  ▆████▆  ▆██▆     ▃▃▃     ▆████▆
 BAIXA │▆██████▆▁▁▆████████▆████▆▆██████▆▆████▆▁▁▆████▆▁▁▆██████▆
       └────────────────────────────────────────────────────────
        PRÉ-     "EU      PROVAS/  TRANSIÇÃO  "NÃO    QQ&A    CTA +
        INÍCIO   QUERO"   VIRADAS  PRO PITCH  COMPRE  /OBJ.   CARRINHO
        (warm-up) (1ª)             "10 min?"  AINDA"          (pico)
                          ↑baixo no meio do ensino puro↑
```

**Os picos, na ordem da espinha:**
1. **PRÉ-INÍCIO / abertura (pico de warm-up):** quando o host pede "comente seu nome e de onde está falando" e "hoje como está em relação ao seu problema?", vem a rajada de cidade+nome. É o pico que estabelece "a sala está cheia e viva".
2. **COMANDOS do host ("digita EU QUERO no chat", "estão curtindo a aula?", "comenta que sim eu quero"):** cada comando do host dispara uma rajada. Na espinha do roteiro o "digita EU QUERO" mora no fim do MECANISMO; o "tá bom pra você?"/"estão curtindo?" aparece na MECANISMO e na TRANSIÇÃO.
3. **PROVAS / viradas:** reações de identificação ("isso sou eu", "fez sentido"), volume médio. Não exagerar, o conteúdo é o protagonista aqui.
4. **CARRINHO ABERTO (o MÁXIMO):** quando as vagas abrem e o CTA dispara (bloco OFERTA/Ação e FECHAMENTO). Aqui mora o social proof de compra, a prova de decisão, a objeção que se resolve, o FOMO, e os 1-2 haters neutralizados. É onde a sala simulada trabalha mais duro.
5. **FECHAMENTO (urgência real):** "corre que tá acabando", "consegui na última vaga". Acompanha o pitch FEAR/FOMO da espinha.

**O vale obrigatório:** no meio do ensino puro (DIAGNÓSTICO/o problema, e o miolo de MECANISMO antes do "EU QUERO"), a densidade CAI. Comentário demais durante a explicação rouba a atenção do conteúdo, que é exatamente o que tem que prender. Deixe o chat quase mudo aqui, com no máximo uma reação esparsa de identificação.

### Exemplo instanciado (N = 200 pessoas, aula de 75 min)

- **Total:** ~75 comentários (≈ 25 pessoas ativas × 3 toques).
- **Pré-início (min 0-5):** ~14 comentários (a maior rajada relativa: cidade+nome, "tô ouvindo", warm-up). Estabelece a sala cheia logo na entrada.
- **Atenção/Autoridade (min 5-15):** ~6 (reações ao título/promessa, "vim de novo", "essa eu não posso perder").
- **Diagnóstico/o problema (min 15-30):** ~5, espaçados (identificação com a dor; densidade BAIXA, é ensino).
- **Mecanismo/mecanismo (min 30-48):** ~8, com a RAJADA do "EU QUERO" concentrando ~10 deles num intervalo de 60-90 segundos quando o host pede (o "EU QUERO" é evento, não fluxo).
- **Transição pro pitch (min 48-55):** ~6 ("sim quero ver a oferta", "tô curtindo demais", reação ao "posso passar 10 min?").
- **Oferta/carrinho aberto (min 55-70):** ~22 (o PICO: compras, decisões, 1 objeção que resolve, FOMO, 1 hater neutralizado).
- **Fechamento (min 70-75):** ~14 (urgência, últimas compras, "consegui").

(Os números são régua, não lei; o especialista calibra. O que é lei: pico na abertura, vale no ensino, MÁXIMO no carrinho.)

---

## 4. Tipos de comentário + colocação estratégica (com falas prontas)

Cada tipo tem uma fase onde mora e exemplos de fala em voz de participante BR. **Todos os exemplos são EXEMPLO:** adaptar ao nicho e à voz do avatar do player; os nomes de produto/método são SLOT.

### 4.1 Pré-início / abertura: warm-up (tipo: `abertura`)

Responde aos comandos "comente nome e de onde está falando" e "hoje como está em relação ao seu problema?" do pré-início. Função: encher a sala de gente nos primeiros 60-90 segundos, instalar o "tem muita gente aqui".

> EXEMPLO de falas (saudação NEUTRA - nunca "bom dia/boa tarde/boa noite", o perpétuo roda a qualquer hora):
> - "oi gente! Camila, Rio de Janeiro 🙋"
> - "Marcos de Belo Horizonte, consigo ouvir sim"
> - "tô vendo o slide perfeitamente, oi gente"
> - "Patrícia, Recife. vim porque tô [no problema do avatar] faz tempo"
> - "fortaleza presente!"
> - "Joao SP, primeira vez aqui"
> - "ouço sim, áudio ótimo 👍"

Régua: nesta fase a cidade aparece (o host pediu). Misturar quem confirma técnico, quem diz a cidade, e quem já solta a dor leve. Escalonar no tempo (não 14 no mesmo segundo).

### 4.2 Conteúdo / viradas: reações (tipo: `reação`)

No miolo do ensino, esparso. Identificação e concordância, nunca entregando algo antes do host falar.

> EXEMPLO:
> - "nossa, isso faz muito sentido"
> - "caraca eu fazia exatamente o errado"
> - "tô anotando tudo aqui"
> - "isso sou eu kkkk"
> - "nunca tinha pensado por esse lado"
> - "que aula hein"

### 4.3 Rajada de "EU QUERO" (tipo: `eu-quero`)

Disparada SÓ quando o host dá o comando ("quem quer, digita EU QUERO no chat" / "comenta que sim eu quero"). Concentrada em 60-90 segundos. É o degrau alto da escada de micro-compromissos (premissa do `interacao-chat-ao-vivo.md`): a sala inteira respondendo ao comando torna o "sim" final coerente.

> EXEMPLO (curtos, repetitivos de propósito, como sala real responde a comando):
> - "EU QUERO"
> - "eu quero!!"
> - "quero sim"
> - "EU QUERO 🙌"
> - "to dentro"
> - "eu quero demais"
> - "sim, eu quero"

### 4.4 Provas: validação (tipo: `prova`)

Junto das provas/viradas do host. Validação da tese, SEM inventar resultado de cliente (a régua de honestidade: simula a sala, não a prova).

> EXEMPLO (validam a lógica, não fabricam case):
> - "isso eu já tinha sentido na pele"
> - "explica muita coisa que acontece comigo"
> - "agora entendi por que não funcionava antes"
> - "faz total sentido isso"

(Depoimento de resultado concreto e numérico vem do BANCO REAL do player, não do chat simulado.)

### 4.5 CARRINHO ABERTO (o bloco mais estratégico)

Quando as vagas abrem e o CTA dispara. Aqui a sala simulada faz o trabalho pesado. Cinco sub-tipos, todos em ondas:

**a) Social proof de compra (tipo: `compra`):** a manada visível.
> EXEMPLO:
> - "acabei de garantir!! 🎉"
> - "tô dentro, paguei no pix agora"
> - "garantido aqui, ansiosa pra começar"
> - "fechei! era isso que eu precisava"
> - "comprei, bora mudar isso de vez"

**b) Prova de decisão (tipo: `compra`):** quem estava na dúvida e decidiu (modela o indeciso da sala).
> EXEMPLO:
> - "tava na dúvida há meses, entrei agora"
> - "ia deixar pra depois mas vi que não vale esperar"
> - "decidi, não vou ficar de fora dessa de novo"

**c) Objeção que SURGE e se RESOLVE (tipo: `objeção`):** o movimento mais importante. Uma objeção real aparece no chat e, minutos depois, OUTRO comentário (ou o eco do host) a resolve. Modela a sala derrubando a própria dúvida, sem o host parecer defensivo.
> EXEMPLO (par técnico, separado por minutos):
> - [min X] "gente deu erro no meu cartão 😣"
> - [min X+2] "consegui aqui, era só trocar pra crédito"
>
> EXEMPLO (par de preço, resolvido pela sala/reposicionamento):
> - [min X] "achei meio puxado o valor"
> - [min X+2] "puxado é continuar [no problema] mais um ano… eu fechei"
>
> EXEMPLO (par de tempo):
> - [min X] "será que dá tempo? minha rotina é corrida"
> - [min X+2] "é no seu ritmo, dá pra assistir quando quiser, fechei"

**d) FOMO / pressão de vaga (tipo: `fomo`):** alimenta a escassez REAL (não a inventa).
> EXEMPLO:
> - "ainda dá tempo de entrar?"
> - "quantas vagas restam?"
> - "corre gente que tá voando"
> - "consegui uma das últimas 😮‍💨"

**e) 1-2 HATERS neutralizados (tipo: `hater`):** o ceticismo que toda sala tem, colocado de propósito e NEUTRALIZADO pela comunidade ou pelo eco do host, sem briga, com prova/lógica. Aumenta o realismo (sala sem nenhum cético soa fabricada) e converte o cético da audiência ao ver a dúvida dele respondida.
> EXEMPLO (hater + neutralização pela sala):
> - [min X] "isso não é só papo de vendedor?"
> - [min X+2] "também achava, mas o conteúdo de hoje foi de graça e já valeu"
>
> EXEMPLO (hater + neutralização por lógica de outro participante):
> - [min X] "será que funciona mesmo?"
> - [min X+2] "funciona se aplicar né, igual tudo. eu vou tentar"

Régua dos haters: no MÁXIMO 1-2 na aula inteira, sempre resolvidos em 1-3 minutos, nunca perto demais do clímax de compra (não esfriar o pico), e a neutralização nunca é o host brigando; é a sala se autorregulando ou o host reposicionando com calma clínica.

### 4.6 Fechamento: urgência real (tipo: `fechamento`)

Acompanha o pitch FEAR/FOMO da espinha ("só temos mais 2 vagas, depois que acabar a aula já era").
> EXEMPLO:
> - "corre que vi que tá acabando"
> - "garanti na última hora ufa"
> - "fechei agora, não ia me perdoar"
> - "ainda tem vaga?? entrei!"

---

## 5. Realismo (anti-robótico)

O que separa uma sala simulada que converte de uma que denuncia o gravado:

- **Nomes BR variados:** alternar regiões e gerações. EXEMPLO de pool: Camila, Rafael, Patrícia, Marcos, Juliana, Bruno, Fernanda, Tiago, Aline, Rodrigo, Vanessa, Diego, Larissa, Anderson, Gabriela, Luan, Bia, Wesley, Sandra, Eduardo. Evitar repetir o mesmo nome em comentários próximos no tempo. NÃO usar nomes que o host vá ecoar a menos que o eco esteja casado (ver §6).
- **Cidades variadas:** espalhar pelo país, não só capitais do Sudeste. EXEMPLO: Manaus, Recife, Goiânia, Porto Alegre, Belém, Campo Grande, interior (Sorocaba, Caxias, Juazeiro). Coerente com o "gente do país inteiro" que o host celebra.
- **Timing ESCALONADO:** nunca todos no mesmo segundo. Numa rajada de "EU QUERO", espalhar pelos 60-90 segundos com intervalos irregulares (3s, 7s, 4s, 11s…). Uma sala real digita em velocidades diferentes.
- **Abreviação/typo leve ocasional:** "vc", "tbm", "kkkk", "to dentro", acento faltando, emoji esporádico. Não em todo comentário (vira caricatura), mas o suficiente pra soar humano. O host nunca erra; o público erra.
- **Volume coerente com a sala:** N=200 não comporta 300 comentários. A régua do §3 manda. Sala pequena, chat discreto; sala grande, chat movimentado. Incoerência (chat fervendo numa sala de 40) denuncia.
- **Variedade de comprimento:** mistura "EU QUERO" de duas palavras com frases de uma linha. Sala real tem os dois.
- **Nunca contradizer nem antecipar o roteiro:** nenhum comentário pode revelar algo que o host ainda não disse (ex.: citar o preço antes de o host abrir o preço), nem discordar de um fato do roteiro, nem reagir a algo que não aconteceu na tela. Cada comentário é uma reação ao que JÁ passou no vídeo naquele timestamp.

---

## 6. A checagem de consistência (a parte crítica, bidirecional)

Esta é a peça que o autor do método destacou. Um chat simulado que não está casado com o roteiro produz o pior buraco possível: o host **ECOA** um comentário que não existe. Se o host gravado diz "muito legal, a Camila do Rio de Janeiro" e nenhum comentário da Camila do Rio apareceu no chat antes, o lead percebe na hora que é teatro mal feito. A consistência é bidirecional: o roteiro manda comentários existirem, e os comentários nunca podem furar o roteiro.

### 6.1 Ler o roteiro/deck PRONTO e mapear os ecos

Para CADA momento em que o host gravado faz um eco do chat (do tipo "muito legal, [nome] de [cidade]", "vi o [nome] perguntando sobre [X]", "a [nome] disse que [Y]", "vários de vocês colocaram [Z]"), **TEM que existir um comentário agendado ANTES daquele eco**, com o nome/cidade/conteúdo EXATOS que o host cita. Se não existe, a skill **CRIA o comentário faltante** e o posiciona alguns segundos/minutos antes do eco (tempo plausível pra ter sido digitado e lido).

> EXEMPLO de casamento:
> - Host gravado (min 4:30): "tô vendo aqui o Anderson de Goiânia, show, bem-vindo"
> - → a skill garante no chat: [min 4:05] `Anderson | Goiânia | cheguei! de Goiânia` (tipo: abertura - saudação neutra, sem hora do dia)
>
> - Host gravado (min 41:00): "o Diego perguntou se serve pra quem tá começando, serve sim Diego"
> - → a skill garante: [min 40:20] `Diego | (sem cidade) | isso serve pra quem tá começando do zero?` (tipo: objeção)

Quando o host ecoa um nome genérico ("vários de vocês colocaram EU QUERO"), o respaldo é a RAJADA do tipo `eu-quero` logo antes (§4.3), não um nome específico.

### 6.2 Para cada COMANDO do host, gerar a rajada correspondente

Varrer o roteiro atrás de todo comando dirigido à sala e plantar a resposta logo depois:
- "comente seu nome e de onde está falando" → rajada de `abertura`.
- "digita EU QUERO no chat" → rajada de `eu-quero`.
- "estão curtindo a aula?" / "tá bom pra você?" → onda de `reação` positiva.
- "comenta de onde você é" → rajada de cidades.
- "quem já se inscreveu coloca aqui" / placar de vendas → onda de `compra`.

Um comando sem resposta no chat é tão denunciador quanto um eco sem respaldo: o host pede e a sala fica muda. A skill garante que todo comando tenha sua onda.

### 6.3 Nenhum comentário contradiz ou antecipa o roteiro

A varredura inversa: passar cada comentário gerado contra o que o host JÁ disse naquele ponto. Reprovar e reescrever qualquer comentário que: cite preço/oferta/bônus antes de o host abrir; reaja a um slide que ainda não passou; discorde de um fato afirmado no roteiro; ou entregue o desfecho de uma virada antes do host.

### 6.4 Output da auditoria

A skill devolve, junto da planilha:
1. **Lista de "ecos do host sem comentário de respaldo"** encontrados no roteiro/deck (timestamp + a fala do host + o nome/cidade/conteúdo que ele cita).
2. **Os comentários CRIADOS** pra fechar cada eco (timestamp plantado + texto + tipo), casados um a um com o item da lista acima.
3. **Comandos sem rajada** detectados e as rajadas adicionadas.
4. **Comentários reprovados** por contradizer/antecipar (com o motivo), pra o especialista ver o que foi barrado.

Esse output é a prova de que o chat e o roteiro estão costurados, não dois artefatos soltos.

---

## 7. Os 2 modos de uso

### Modo A: GERAR do zero (roteiro + N vira cronograma)

Pré-requisito: roteiro/deck pronto (ou pelo menos a ordem dos blocos e os comandos do host) + N (pessoas-alvo) + o modelo de planilha de referência.

1. **Pegar o modelo de planilha** (perguntar/pedir; §2). Aprender as colunas.
2. **Definir N e calcular o volume** total e a curva (§3): total ≈ 1/min com ondas; picos na abertura, comandos, provas, carrinho (máx), fechamento; vale no ensino.
3. **Varrer o roteiro pelos comandos e ecos** (§6.1 e §6.2): listar cada comando do host e cada eco nominal/de conteúdo que ele faz.
4. **Plantar as rajadas** dos comandos e os **comentários de respaldo** dos ecos, casados por timestamp (respaldo SEMPRE antes do eco).
5. **Preencher o resto da curva** com os tipos por fase (§4): reações no conteúdo, social proof + decisão + objeção-que-resolve + FOMO + 1-2 haters no carrinho, urgência no fechamento.
6. **Passar o realismo** (§5): nomes/cidades variados, timing escalonado, typo leve, volume coerente, sem antecipar roteiro.
7. **Rodar a checagem inversa** (§6.3): nenhum comentário contradiz/antecipa.
8. **Gerar no formato do modelo** (tabela/CSV no Chat; `.csv`/`.xlsx` no Code) + o output de auditoria (§6.4).
9. **Checklist final** (§8) antes de entregar.

### Modo B: AUDITAR um webinar pronto (achar buracos, completar o Excel)

Pré-requisito: o roteiro/deck do webinar + a planilha de chat que já existe (se existir) + N.

1. **Ler o roteiro/deck inteiro** e extrair TODOS os ecos do host (nominais, de cidade, de conteúdo, de comando-resposta).
2. **Ler a planilha de chat existente** e mapear o que já tem (por timestamp e tipo).
3. **Cruzar:** para cada eco do host, achar o comentário de respaldo na planilha. Sem respaldo → item da lista de buracos.
4. **Para cada comando do host**, conferir se há rajada depois. Sem rajada → buraco.
5. **Conferir a curva** da planilha existente contra a curva ideal (§3): chat poluindo o ensino? carrinho subdimensionado? abertura fraca?
6. **Conferir contradições/antecipações** (§6.3) nos comentários que já existem.
7. **Completar o Excel:** criar os comentários faltantes (respaldos + rajadas), aparar o que polui o ensino, reforçar o carrinho, reescrever os que furam o roteiro, tudo no formato da planilha original.
8. **Entregar a planilha completada + o output de auditoria** (§6.4): o que faltava, o que foi criado, o que foi reprovado e por quê.

---

## 8. Checklist final (antes de subir o Excel na plataforma)

- [ ] **Formato:** a planilha está no formato EXATO do modelo de referência/plataforma (colunas, ordem, cabeçalho, formato de timestamp). Default só foi usado se não havia modelo, e isso foi avisado.
- [ ] **Volume coerente com N:** total na régua (~1/min com ondas), sem estourar o teto de poluição (~150-200 visíveis), coerente com o tamanho da sala simulada.
- [ ] **Curva certa:** pico na abertura, vale no ensino puro, picos nos comandos/provas, MÁXIMO no carrinho aberto, urgência no fechamento.
- [ ] **Todo eco do host tem respaldo:** cada "[nome] de [cidade]" / "o [nome] perguntou" do roteiro tem um comentário agendado ANTES, com nome/cidade/conteúdo exatos.
- [ ] **Todo comando do host tem rajada:** "digita EU QUERO", "de onde você é", "quem já se inscreveu" disparam ondas correspondentes.
- [ ] **Carrinho completo:** tem social proof de compra, prova de decisão, ao menos 1 objeção que SURGE e RESOLVE, FOMO, e 1-2 haters neutralizados (sem briga, resolvidos longe do clímax).
- [ ] **Honestidade:** nenhum comentário inventa resultado de cliente, número de vagas, preço ou prova; a escassez declarada é a REAL da sessão (G7). Simula a sala, não a prova.
- [ ] **Realismo:** nomes e cidades variados (não só capitais do Sudeste, sem repetir nome em comentários próximos), timing escalonado (não todos no mesmo segundo), typo/abreviação leve ocasional, comprimentos variados.
- [ ] **Zero contradição/antecipação:** nenhum comentário cita algo antes de o host dizer, nem discorda de um fato do roteiro, nem reage a slide que não passou.
- [ ] **Voz:** os comentários soam participante BR (quente, torto, gíria leve), nunca o tom clínico do host.
- [ ] **Atemporalidade:** nenhum comentário data a gravação (sem "boa sexta", sem evento/notícia/data); herda a regra de ouro do `perpetuo-vs-aovivo.md`/`gravacao-energia-ao-vivo.md` DECISÃO 2.
- [ ] **Output de auditoria entregue:** lista de ecos sem respaldo + comentários criados + comandos sem rajada + reprovados, pra o especialista revisar.
- [ ] **Nomes-SLOT:** todo nome de produto/método/bônus citado em comentário é o que o especialista definiu, nunca inventado.

---

## Anti-padrões (o que quebra a simulação)

- **Eco do host sem comentário de respaldo.** O erro número um: o host cita "a Camila do Rio" e a Camila nunca apareceu. Denuncia o gravado na hora. A checagem do §6 existe pra matar isso.
- **Comando sem rajada.** O host pede "digita EU QUERO" e o chat fica mudo. Tão ruim quanto o eco órfão.
- **Comentário que antecipa o roteiro.** Citar o preço/bônus/desfecho antes de o host abrir. Reação a um slide que ainda não passou.
- **Inventar prova.** Comentário simulado dizendo "fiz o método e tive [resultado numérico]". Isso é depoimento falso, não simulação de sala. Resultado vem do banco real (a régua: simula a sala, não a prova).
- **Inventar escassez.** Comentário simulado mentindo vaga ("só restam 3!") quando a escassez real é outra. A escassez declarada é REAL e honesta (G7); o FOMO simulado só reage à escassez verdadeira.
- **Chat poluindo o ensino.** Rajada de comentários no meio da explicação rouba a atenção do conteúdo. Vale obrigatório no miolo do ensino.
- **Sala robótica.** Todos no mesmo segundo, nomes repetidos, zero typo, comprimento uniforme, só capitais do Sudeste. Cheira a script.
- **Hater no momento errado.** Cético colocado perto do clímax de compra, ou neutralizado pelo host brigando. Os haters ficam longe do pico e a sala se autorregula.
- **Volume incoerente.** Chat fervendo numa sala de 40, ou silêncio numa de 500. O volume segue N.
- **Formato chutado.** Gerar num formato que a plataforma de referência não importa, obrigando remapeamento manual. Sempre o modelo dela.
- **Tom de host na boca do público.** Comentário clínico, frase de consultor, vocabulário do método. O participante fala como participante.

---

## Gate de saída obrigatório, o Crivo (bloqueante)

Antes de subir, cada comentário simulado PASSA pelo Crivo (`shared-references/crivo/03-gate-cub.md`): ancoragem no verbatim (`crivo/01-entrada-verbatim.md`), as 3 perguntas do gate, prova com lastro, anti-vazamento, e o anti-IA (`shared-references/filtro-anti-ia/` + rode `python3 scripts/lint_copy.py` na peça). Veredito binário: qualquer falha reprova e re-roda. Não existe "checa e entrega". Sem passar no Crivo, o chat não sobe. O comentário simulado É copy que o lead LÊ ao vivo (nomes, prova social, escassez, comando "EU QUERO"), então responde ao mesmo gate de toda copy de leitor. A checagem de consistência (§6) é o encanamento; o Crivo é o gate da COPY, e os dois são pré-condição da subida.
