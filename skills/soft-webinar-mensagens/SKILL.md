---
name: soft-webinar-mensagens
description: "Escreve a SEQUÊNCIA de WhatsApp (canal primário, API oficial) e e-mail (secundário) do webinar Soft que enche a sala e fecha a venda, SEM replay. Cobre a régua de ANTES (cadastro com opt-in, faltam 24h, faltam 1h, link da sala 5 min antes), os 2 toques DURANTE (reativa quem se distraiu, avisa que a oferta abriu) e o PÓS pra quem NÃO comprou (resumo, prova, quebra de objeção, last call, fechamento, downsell ou pergunta de 1 palavra) roteado pela tag de percentual assistido, mais a esteira semanal e o repasse do lead quente pro Comercial 1:1. Use quando o pedido for WhatsApp, e-mails, sequência, lembrete ou follow-up do webinar, faltam 30 minutos, estou ao vivo, link da sala, reconvite, pós-webinar. A MÁQUINA de pós (timestamp, tags no CRM, marcos de %, roteamento) é escopo DESTA skill, no Passo 4. NAO use pro ROTEIRO/falas (soft-webinar-script); OFERTA/preço/bônus (soft-webinar-plano); página de cadastro/checkout (soft-funil-landing); pacote inteiro (soft-webinar-plano)."
---

> 🔴 **REGRA DURA DE FRASE , "TODA FRASE SE EXPLICA SOZINHA"** (vale em TUDO que esta skill escrever pro público)
>
> Copy Soft é **frase que gera IMAGEM na cabeça de quem lê frio**. Não pode assumir que o leitor já sabe o assunto, o produto, a categoria, o método, o mecanismo ou o antes/depois. Toda frase que você escrever precisa se sustentar sozinha, sem depender do slide anterior, da bio, do título, ou do que "obviamente é". Frase curta que "soa punchy" e deixa o entendimento pro contexto é reprovada.
>
> **Teste antes de aprovar CADA frase:** "se essa frase caísse solta no scroll de uma pessoa que nunca ouviu falar do produto, ela entenderia O QUÊ + PRA QUEM + O RESULTADO CONCRETO?" Se não, REESCREVE nomeando explícito: qual é o objeto ("dieta", "calorias", "conta de calorias", não só "conta"), qual é o público ("mulher que já tentou emagrecer de todas as formas", não só "mulher que já tentou de tudo"), qual é o resultado concreto ("para de recomeçar a dieta", não só "para de recomeçar").
>
> **Ex reprovado →** *"Você come o que ama, um agente faz a conta do seu dia e você para de recomeçar."*
> **Ex aprovado →** *"Você passa a comer o que ama, um agente faz a conta de calorias do seu dia inteiro e não te deixa escorregar, e você para de recomeçar a dieta toda vez do zero."*
>
> Adicionar as 3-5 palavras que ancoram o contexto é MELHOR que a frase curta ambígua. Copy boa não é curta, é **inequívoca e imagética**. Frase que precisa de contexto pra ser entendida = frase quebrada, refaz.

> **REGRA-IRMÃ · "NENHUM VERBO ÓRFÃO" (cérebro preguiçoso do leitor):** o leitor tem cérebro preguiçoso e NÃO vai completar sua frase pra você. Todo verbo precisa vir com seu OBJETO NOMEADO na mesma frase, senão vira frase média. Verbos-armadilha que exigem complemento explícito: cortar (**cortar o quê?**), recomeçar (**recomeçar o quê?**), parar (**parar de quê?**), mudar, melhorar, escapar, largar, controlar, ajustar, resolver, virar, transformar. Sempre nomeia o objeto concreto (arroz, pão, doce, dieta, treino, agenda, cliente, valor), NUNCA deixa aberto.
>
> **Ex ✅ BOA (verbos ancorados + objetos nomeados):** *"Você come arroz, pão e o que ama, e uma ferramenta minha conta as calorias de tudo por você todo dia, pra você emagrecer sem viver de dieta."* , "come" tem objeto (arroz, pão), "conta" tem objeto (calorias), "emagrecer" tem contexto ("sem viver de dieta").
>
> **Ex ⚠️ MÉDIA (verbo órfão no fim):** *"…pra você emagrecer comendo o que gosta em vez de cortar."* , "cortar O QUÊ?" ficou pro leitor completar. Cérebro preguiçoso não completa, desiste. Correto: *"…em vez de cortar arroz, pão e doce."*
>
> Antes de aprovar a frase, sublinha mentalmente cada verbo e confere: cada um tem OBJETO nomeado? Não? Nomeia agora.

# Mensagens do webinar, a régua que enche a sala e fecha a venda

A aula é metade do jogo; as mensagens são a outra metade. Sem régua de antes a sala fica vazia (tirar o WhatsApp divide o comparecimento por dois). Sem régua de depois a maior parte do dinheiro fica na mesa (quase ninguém compra no minuto da oferta; a maioria das vendas vem de quem ficou até o fim). Esta skill escreve três réguas: antes, durante, depois.

**O que faz por você:** escreve as mensagens de WhatsApp e e-mail (antes, toques de durante, reconvite de depois) que fazem a pessoa aparecer, ficar até a oferta e voltar pra comprar.

## Canal: WhatsApp oficial primeiro, e-mail secundário (a herança)

A régua **nasce no WhatsApp**, não é opcional. O e-mail é backup.

| Eixo | WhatsApp (PRIMÁRIO) | E-mail (SECUNDÁRIO) |
|---|---|---|
| Abertura | ~95% | ~25-40% |
| Lastro | A/B documentado: só e-mail = ~31% comparecimento; e-mail+WhatsApp = ~47% (+54%, mesmo tráfego, sem mexer em copy/mídia) | piso quando o WhatsApp não está ligado |
| Papel | enche a sala, segura, fecha; **o link da sala só vai por aqui** | reforço/redundância; nunca o link da sala |
| Stack | **Cloud API oficial** (ManyChat/Make/Take Blip/Twilio + API oficial) | plataforma com DKIM/SPF/DMARC (ActiveCampaign, RD, Brevo, Mailchimp) |

**Stack do WhatsApp (regra dura):** **Cloud API oficial da Meta, NUNCA API não-oficial** (Z-API e afins). Número banido no meio do funil mata a sequência e deixa leads órfãos na semana da oferta. O A/B de 2022 que provou o +54% rodava em API não-oficial frágil - fica o PRINCÍPIO (notificação dupla na mesma régua + captura sem fricção), morre o encanamento.

**Regras nativas do WhatsApp oficial (valem antes de escrever):**

| Regra | O que é |
|---|---|
| **Opt-in real** | a pessoa MANDA "OI" primeiro (botão pré-preenchido na página de obrigado); você não dispara pra base. Sem opt-in = bloqueio + multa. |
| **Janela de 24h** | depois da última mensagem do lead, há 24h de mensagem livre. Fora da janela, **só template aprovado**. Cada toque do lead (responder, mandar OI) reabre a janela. |
| **Template aprovável** | toda mensagem **iniciada por você fora da janela** (24h, 1h, link 5 min) é template e precisa de aprovação Meta: utilitário/marketing, sem promessa duvidosa, com variável `{{nome}}` etc. Toques DENTRO da janela (resposta a quem respondeu) são livres. |
| **Formato** | 50-150 palavras, até 5 linhas, 1-2 emojis contextuais, link encurtado e rastreável; nunca encaminha o e-mail. |

**Captura sem fricção (protege a taxa de cadastro):** NÃO peça telefone no formulário (derruba o cadastro). Inverta: botão na página de obrigado abre o WhatsApp com a mensagem já escrita ("Quero confirmar minha vaga no [Webinar]"); a pessoa só toca enviar. O sistema captura o número do remetente e responde na hora. Ganha em dobro: zero campo extra (cadastro intacto) + opt-in real por comportamento (janela ativa, sem risco de spam).

## As 6 leis (valem antes de tudo)

1. nunca escreve como se o cliente já soubesse o contexto; zero palavra difícil, zero figura de linguagem vazia; cria o contexto antes da afirmação.
2. abre ensinando o que vai fazer (1-2 linhas).
3. consultiva: puxa o contexto antes de gerar.
4. contexto é rei.
5. **admite se faltar insumo e nunca inventa** - sem número, case, fala, timestamp da oferta ou modo, marca `[A CONFIRMAR: o quê]` no lugar exato; jamais preenche com plausível.
6. **doc de output enxuto pros 2 leitores** (humano + IA): só as mensagens + `[A CONFIRMAR]` + rótulo mínimo (canal/timing/trabalho). Zero meta-narração, zero bastidor, zero explicação-do-método pro leitor.

(Detalhe em `shared-references/operacao-padrao.md`, Seção 0.)

**Este SKILL.md é o processo inteiro. Siga na ordem, pare nos checkpoints, rode o gate por dentro antes de mostrar qualquer mensagem.** A reference `references/sequencias-email-whatsapp-pre-pos.md` tem o molde de CADA peça preenchido por nicho; cada passo diz quando abri-la.

## ⛔ REGRA DE GERAÇÃO nº 1: NUNCA digite o travessão (em-dash)

Vale em TODA mensagem que você escrever, do cadastro ao pós. **Nunca gere o caractere travessão longo (Unicode U+2014, o "em-dash") nem o travessão médio (U+2013, o "en-dash").** Ao escrever, no lugar dele use **ponto final**, **vírgula** ou **hífen comum ` - `** (o hífen do teclado, com espaço dos dois lados). Exemplo: onde você seria tentado a pôr um travessão longo entre "o link vai por aqui" e "5 min antes", escreva `o link vai por aqui, 5 min antes` ou `o link vai por aqui. 5 min antes`. Isto NÃO é um passo de find-replace que roda depois: é como você digita cada frase desde o primeiro token. Um único travessão longo no doc entregue = REPROVA de zero-tolerância (Passo 6), independente do resto estar perfeito. A mesma regra dura vale pra família **emperrar/empacado/desemperrar** (só entra se for aspa literal do cliente); no lugar use emperrar, empacar, parar, freio ou amarra.

## Antes de tudo: PERGUNTA o MODO (ao vivo ou perpétuo)

Pergunta numa linha: "essa régua é pra um webinar AO VIVO (data marcada) ou PERPÉTUO (gravado, 24/7, cada lead escolhe horário)?" Sem resposta: marca `[A CONFIRMAR: ao vivo ou perpétuo]`, segue no ao vivo, avisa que o timing muda. Default por estágio: validação/sem volume = ao vivo; pós-validação/escala = perpétuo.

A **estrutura** (antes/durante/pós) é idêntica nos dois. O que MUDA é timing, escassez e link:

| Eixo | AO VIVO | PERPÉTUO |
|---|---|---|
| Datas | absolutas (régua ancora numa data/hora única) | relativas ao cadastro de cada lead (24h/1h/5 min da sessão que ELE escolheu) |
| Escassez | real de evento (vaga, "é hoje", bônus que sai no fim) | por sessão/timer da oferta ("se essa aula acabar, acabou"); NUNCA timer de calendário fake |
| Link da sala | único (todos na mesma) | individual por lead (modelo cinema; é o que faz parecer ao vivo) |
| Reconvite | próxima edição | outra sessão do mesmo perpétuo |
| Datar | permitido, cria urgência | PROIBIDO (sem "hoje", "sexta", nome de mês) - datar denuncia o automático |
| Conversão pós | 10%+ | 5%+ (+ esteira semanal sincronizada cria "último dia" coletivo sem evento) |

Tabela-mãe completa em `references/perpetuo-vs-aovivo.md` (abre no Passo 1).

> **Guarda-corpo (regra dos 90%):** régua de perpétuo só pra webinar **validado ao vivo** antes. Perpétuo nunca testado = risco mora na aula não validada, não nas mensagens; avisa. (`references/perpetuo-mecanica.md` e `perpetuo-vs-aovivo.md`.)

## A régua correta do método (a espinha, decore)

Esta sequência, e só esta, **nos dois modos**. **Não existe replay** - nada de "trecho de 15 min", "assista a gravação". Quem não veio é reconvidado pra próxima sessão (perpétuo) ou próxima edição (ao vivo).

1. **ANTES** - enche a sala: cadastro, faltam 24h, faltam 1h, link 5 min antes.
2. **DURANTE** - segura quem está na sala: toque no meio (reativa), toque na oferta (avisa que abriu).
3. **DEPOIS** - reconvite só pra quem NÃO comprou: resumo, prova, quebra de objeção, last call, fechamento, downsell/pergunta. Cada mensagem ataca UM motivo de não ter comprado; quem responde vira lead quente pro Comercial 1:1.

## Output Contract (o que você entrega)

- Mensagens **uma por vez** ou em bloco curto por régua (antes inteira → toques de durante → pós); nunca despejo de tudo sem checkpoint.
- Cada mensagem com: **canal**, **timing** e **o trabalho dela** (1 frase). No WhatsApp fora da janela, marca **[TEMPLATE]** (precisa aprovação Meta); dentro da janela, **[livre]**.
- WhatsApp = corpo curto. E-mail = assunto + corpo.
- **Para e espera o OK** ao fim de cada régua.
- **Nunca inventa fala/número**, **nunca menciona replay**, **nunca mostra mensagem reprovada no gate**.
- Insumo que falta = `[A CONFIRMAR: o quê]` no lugar exato (Lei 5).
- Saída = só as mensagens (canal+timing+trabalho+corpo). Zero meta, zero bastidor (Lei 6).

## ⚠️ ENTREGA = UM doc MD, SEMPRE (nunca pingar a peça no chat)
Regra dura, vale mesmo pra copy curta: o RESULTADO desta skill sai como **UM documento markdown consolidado**. No **claude.ai**, um **artifact de markdown** (o dono abre, copia, baixa); no **Claude Code**, um arquivo `.md`; no **agente/Telegram**, gera o doc como arquivo `.md` e cita o path completo na resposta (o bridge anexa), com a condução em mensagens curtas, sem markdown pesado (sem `##`, sem tabela `|` no texto ao usuário). A CONDUÇÃO (perguntas de contexto, escolhas, os STOPs de aprovação) acontece no chat; a PEÇA/COPY em si mora no DOC. Ao parar num STOP, você mostra ou atualiza o DOC e pergunta "ajusto?"; você NUNCA reescreve a peça em pedaços no corpo da conversa. Sem o doc entregue, a skill não terminou.

## Passo 0, ancora antes de escrever (NÃO PULE)

Reúne nesta ordem: **descrição do projeto** → **plano de posicionamento** → **roteiro** → **oferta** → **mensagens anteriores**. Precisa de:

- **promessa primária** em 1 linha (resultado central).
- **mecanismo nomeado** + **inimigo nominal**.
- 3-5 **falas literais de DOR/DESEJO** do avatar (com o N).
- **oferta**: nome do produto, ticket, bônus de ação rápida, prazo real.
- **timestamp da oferta** (minuto:segundo em que a oferta abre na aula) - separa quem viu a oferta de quem saiu antes; governa todo o pós.
- **bônus de retenção** (gancho que segura até a oferta) e o ponto em que é anunciado.

Três estados de entrada (declara qual é o seu):

| Estado | Conduta |
|---|---|
| Tem fala real (com N) | ancora nela. Caminho ideal. |
| Tem fundação, ZERO fala literal | NÃO inventa fala/N; ancora em prova real; número não confirmado = `[DADO: confirmar]` e não conta como ancorado; avisa que minerar 5-8 falas crava a régua. (`shared-references/crivo/01-entrada-verbatim.md`.) |
| Sem nada | pergunta numa única mensagem: promessa em 1 linha + 1 dor real + nome do produto + ticket. |

## Passo 1, decide o escopo da régua pelo ticket e pelo modo

Régua escala com o ticket. Confirma antes de escrever:

| Ticket | Régua | Janela de pós | Ajuste |
|---|---|---|---|
| Baixo (~300-1,5k) | enxuta: 5 WhatsApps + 5 e-mails | 48-72h | pula e-mail dedicado de objeção (incorpora no resumo) |
| Médio (~1,5k-5k) | padrão: 9 WhatsApps + 9 e-mails | padrão | - |
| Alto (5k+) | padrão + 1 convite pra **call de qualificação** antes do checkout (entre 24h-48h do pós) | até 14 dias com nutrição extra | WhatsApp pode ter áudio curto (>90s, transcreve junto); **fecha no 1:1, nunca no checkout** |

**Aplica o MODO** (já perguntado): abre `references/perpetuo-vs-aovivo.md` na tabela-mãe e calibra timing/escassez/link pelo modo. No perpétuo, a **frequência (multi-horário)** decide a janela cadastro→sessão e quantos lembretes cabem:

| Frequência | Janela | Régua |
|---|---|---|
| 1x/semana | até 6 dias | longa (cabe reaquecimento extra) |
| Diário | ~1 dia | padrão (24h/1h/5 min encaixa) |
| Just-in-time (15/30/60 min) | <60 min | comprimida (quase só "faltam X min" + link; o WhatsApp carrega tudo) |

## ✍️ PRÉ-FLIGHT DE COPY (relê IMEDIATAMENTE antes de escrever a 1ª linha)
A copy nasce da terça-feira à noite DO LEITOR. Regra é CHECAGEM, nunca geradora: escreve a partir da CENA (a emoção dela: raiva, medo, absurdo, cobiça), com voz de mesa; a regra confere depois. Reprovou, REGENERA do zero (frase editada herda o esqueleto do defeito):
1. **Munição na mão:** verbatim/prova real do dono na frente (sem munição = pergunta, jamais inventa).
2. **Leitura única:** uma leitura em voz alta, sem re-parse; valência única (bom ou ruim na 1ª leitura); sintaxe linear; 1 operação mental por frase.
3. **Mundo do leitor, não o mapa do autor:** componentes do método viram dias, horas, lugares e falas do cliente; rótulo abstrato só entre aspas, como palavra do inimigo.
4. **Compressão gramatical: cota zero.** Verbo da relação por extenso; a força é do fato, nunca do aperto da frase.
5. **Voz de mesa, não palco:** a colocação inteira é fala real; metáfora morta entra, personificação e figura de escritor não.
6. **Prova com atribuição exata** (do banco de provas do dono, nunca fundir); conta apresentada como conta; renda do leitor só em 3ª pessoa.
7. **Anti-IA:** zero travessão, zero família banida, zero verbo genérico de transformação, zero frase-emoldura.
8. **Teto do formato conhecido ANTES** (conta durante, não conserta depois).
Depois de escrita, a auditoria roda TODOS os filtros em cada linha (régua cumulativa, checklist mecânico). Reprovou, regenera ANTES de mostrar.

## Passo 2, escreve a régua de ANTES (cada mensagem com 1 trabalho)

Canais em paralelo na mesma régua de horários. O WhatsApp **não repete** o e-mail: comprime na promessa e pede o compromisso. Pra cada linha, abre `references/sequencias-email-whatsapp-pre-pos.md` na seção PRÉ-WEBINAR (Mensagem 1 a 4) e troca só o recheio pelo nicho.

| Quando | Canal | Janela WhatsApp | O trabalho (1 só) |
|---|---|---|---|
| No cadastro (imediato) | **WhatsApp** + e-mail | livre (lead acabou de mandar OI) | Confirma a vaga + ativa o opt-in (a pessoa mandou "OI" pelo botão) + dá as 3 tarefas que sobem o comparecimento (salvar contato, calendário, vir com um objeto do nicho). Antecipa confusão de horário/fuso (ferramenta mostra "7pm" = 19h Brasília; "é no Rio?" é fuso, não lugar). **E-mail fecha com P.S. da vaga limitada:** "se não puder vir, me responde, prefiro liberar pra fila de espera". WhatsApp reforça "tem coisa que só vai por aqui, quem ficar só no e-mail não pega" (opt-in se vendendo; o exclusivo tem que ser real). |
| Faltam 24h | **WhatsApp** + e-mail | **[TEMPLATE]** (fora da janela) | Reativa quem esqueceu: entrega 1 insight real (pedaço do conteúdo, não teaser oco), repete os bullets da página de cadastro pra reacender o desejo, lista a preparação (dispositivo carregado, 60 min sem interrupção, objeto do nicho). Reforça anti-fuga (sem replay). WhatsApp comprime: 1 linha de promessa + "bloqueia 60 min, sem celular paralelo, sem reunião em cima". |
| Faltam 1h | **WhatsApp** + e-mail | **[TEMPLATE]** | Urgência de entrar + arma o **gancho de retenção** (quem ficar até o fim pega um bônus revelado perto do fim, no timestamp da oferta). Diz que a sala abre 10 min antes e o link vai pelo WhatsApp 5 min antes. WhatsApp: a sala abre em X, link em 5 min, avisa em casa que some 60 min. |
| Faltam 5 min | **só WhatsApp** | **[TEMPLATE]** | Entrega o link da sala. **Nunca por e-mail** (atrasa, cai em spam). Voz: "já tem gente na sala, só falta você, vem" (prova social + puxão). Perpétuo = link individual do lead. Oferece socorro técnico ("qualquer problema, me responde aqui" - a resposta reabre a janela de 24h). |

**Regra do assunto de e-mail:** não pode ser óbvio. "Confira os dados da sua inscrição" abre mais que "Sua inscrição está confirmada" (abre loop de curiosidade). Vale pra todos os assuntos.

## Passo 3, escreve os 2 toques DURANTE (segura quem está na sala)

Dois WhatsApps durante a aula, **só pra quem confirmou WhatsApp**. **Nenhum e-mail durante** (quebra a atenção). São respostas dentro da janela do lead = **livres**, não template. Abre a reference na seção DURANTE.

| Quando | Canal | O trabalho (1 só) |
|---|---|---|
| ~min 25 (meio do mecanismo) | só WhatsApp [livre] | **Reativa quem se distraiu** e segura quem pensa em sair: "tá no webinar? daqui uns X min eu mostro o método inteiro, a parte que vira o jogo, não sai antes". Reanexa o link pra quem caiu. |
| ~min 50 (oferta abre na aula) | só WhatsApp [livre] | **Avisa que a oferta abriu**, com link direto do checkout e prazo do bônus de ação rápida. Perpétuo: "vale só nessa sessão". Ao vivo: "vale só nesse evento". Fica mais 10-15 min de Q&A. Eco da escassez da sala, nunca uma nova. Perpétuo: offset relativo ao início da sessão do lead. |

**Cartão na mão ANTES do link:** os campeões mandam a sala "já pega o cartão" antes de o link existir, pra que no pico da decisão não haja janela pra racionalizar. O WhatsApp do min 50 chega com o cartão já na mão - só leva link e prazo, sem reabrir argumento.

## Passo 4, escreve a sequência de PÓS (aqui está a maior parte do dinheiro)

Pouca gente compra no minuto da oferta. O pós recupera quem ficou em cima do muro. **Cada mensagem ataca UM motivo de não ter comprado.** Sem replay: quem não veio é chamado pra outra sessão; quem viu e não comprou é reconvidado a fechar.

### 4a. O gatilho que governa o pós: a tag por % assistido

A regra que muda tudo: **"lead quente é quem viu a sua OFERTA, não quem viu você".** A aula é gravada, a oferta abre sempre no mesmo segundo, e a plataforma (EverWebinar/WebinarKit/WebinarJam) tagueia cada lead ao cruzar o marco. **Cerca de 10% chegam ao fim, e é de onde vem a maioria das vendas** - sem a tag, esses 10% recebem o mesmo e-mail de quem saiu aos 5 min, e você perde os dois.

| Faixa assistida | Estado | O que recebe |
|---|---|---|
| Não compareceu | frio | Reconvite pra próxima sessão. Sem oferta ainda. |
| Entrou e saiu cedo (0-25%) | baixo | Reconvite + "o que você perdeu", pra voltar e assistir. |
| Pegou o problema, saiu antes da oferta (25-75%) | médio | **Nutrição** primeiro (entrega o "o quê" que faltou, sobe a consciência ANTES de vender). Só entra no fechamento quando reage. |
| Passou do timestamp da oferta | **alto** | A **régua de fechamento (4b)**. |
| Ficou até o fim | **máximo** | Lead mais quente sem ter comprado: **contato humano direto, prioridade máxima.** |
| Comprou | cliente | **Sai de TODAS as sequências** e vai pro onboarding. |

(A montagem da máquina - marcos, tags, roteamento de CRM - é escopo DESTA skill: você a monta no checklist técnico do Passo 8; aqui você usa a tag pra decidir QUAL mensagem cada faixa recebe.)

### 4b. A régua de fechamento (pra quem viu a oferta ou ficou até o fim)

Abre a reference na seção PÓS-WEBINAR (Mensagem 5 a 10) e troca o recheio pelo nicho.

| Quando | Canal | O trabalho (1 só) |
|---|---|---|
| ~1h depois | **WhatsApp** + e-mail | Pega o impulso quente: recapitula 3 ideias-chave (ideia-mãe + mecanismo + erro mais comum, reformulados), confirma a oferta aberta e o prazo do bônus. Faixa médio (25-75%) recebe no lugar a versão nutrição. |
| ~12h depois | **WhatsApp** + e-mail | Prova por caso real: situação inicial (= estado atual do lead) → o que aplicou → resultado em número → citação crua. Prova na **moeda da promessa** (promete recolocação, mostra carteira assinada, não print de elogio). Documento bruto vale mais que slide bonito. |
| ~24h depois | **WhatsApp** + e-mail | Quebra a objeção nº 1 do chat (a real: quase sempre "não tenho tempo" ou "achei caro"). Nomeia, **inverte** (o jeito errado é o que custa caro; o método foi desenhado pra esse caso), responde o estado de quem decide, não a frase literal. |
| ~48h depois | **WhatsApp** + e-mail | Last call com escassez **real e auditável**: o bônus de ação rápida sai do ar. Escassez recai nos **bônus, não no produto** ("o método continua, mas sem os extras"). Ao vivo: pode datar ("amanhã às X"). Perpétuo: escassez da sessão/condição, nunca prazo de calendário fake (o "último dia" coletivo é a esteira semanal). |
| ~72h depois | **WhatsApp** + e-mail | Fechamento com a razão **verdadeira** (turma cheia, foco no grupo, suporte limitado). Se você não fecha de verdade, não diga que fecha. |
| ~5-7 dias (só quem NÃO comprou) | E-mail | Downsell (versão menor, **deixa claro o que NÃO tem**) OU re-engajamento (pergunta de 1 palavra: "Preço / Tempo / Não era pra mim"). Melhor pesquisa de mercado: baixo atrito, entrega a objeção real na voz do lead. |

### 4c. A esteira semanal (recuperação de médio prazo, roda em paralelo)

Quem não fecha nas primeiras 72h cai numa cadência semanal sincronizada - cria um "último dia" coletivo real e captura quem precisa de mais tempo. É onde a maioria das vendas perpétuas acontece. Em ordem:

1. **Espera 1 dia** (chance de comparecer à sessão marcada).
2. **D+1, reciprocidade:** manda o **melhor material grátis** (escasso, deletado das redes), anexado num bloco simples. O presente abre a venda, não a substitui.
3. **Represa até segunda 9h:** sincroniza todos na mesma cadência → "último dia" coletivo de verdade na sexta.
4. **Segunda 9h, split por quem viu a oferta:** (A) viu, não comprou → **oferta direta** → página de vendas; (B) não viu → **reconvite** com headline nova + botão de um clique.
5. **Quarta, novo ângulo:** mesmo webinar, **troca o TEMA do mecanismo, não o mecanismo** (a indiferença pode ser ao ângulo).
6. **Sexta, escassez real:** "hoje é o último dia, a oferta está encerrando" → página de vendas.
7. **Saída:** comprou → encerra (a tag de cliente tira de tudo).

**Filtro de entrada obrigatório:** "é cliente?" antes de mandar oferta. **Limpeza de lista:** quem fica 1 mês sem abrir sai (proteção de entrega). **Dê um nome próprio à esteira** (ex: "AutoAll" no nicho do especialista) - faz a máquina existir como ativo.

### 4d. O reconvite puxa pro Comercial 1:1

Quem responde o WhatsApp vira lead quente: abre conversa humana, **nunca resposta automática** (e a resposta reabre a janela de 24h). Quem ficou até o fim sem comprar = lead mais quente, contato direto, prioridade máxima. Alto ticket fecha no 1:1, nunca no checkout. (A venda em si é da **soft-vendas-closer**.)

## 3 mensagens-modelo (o molde na mão; a fonte cheia é a reference)

Modelos condensados de `references/sequencias-email-whatsapp-pre-pos.md`. Troca só o recheio pelo nicho, mantém o esqueleto. Cada exemplo instanciado leva o rótulo *(exemplo ilustrativo, nicho fictício; modela a qualidade, nunca copia)*.

**A. WhatsApp, link da sala (Passo 2, faltam ~5 min) [TEMPLATE]** - só WhatsApp, nunca e-mail:
```
Ei [nome], a [aula] vai começar!
Já tem gente na sala, só falta você. Vem:
LINK DA SALA: [URL individual do lead]
Começa em 5 min. Entra agora que eu já vou ao ar.
Qualquer problema, me responde aqui que eu te ajudo.
```
*(exemplo: "Ei Marina, a Aula Sniper vai começar! Já tem gente na sala, só falta você...")*

**B. E-mail do ANTES (Passo 2, faltam 24h)** - assunto-curiosidade + insight real + bullets reaquecidos:
```
Assunto: Amanhã, [hora] - [ângulo curioso, nunca "sua inscrição confirmada"]
[nome], amanhã às [hora] a gente se vê. Antes, um pedaço do método
pra você chegar com contexto:
[insight real de 3-4 frases: um pedaço do conteúdo que abre um loop]
3 coisas que separei pra amanhã:
✓ [bullet 1 da página] ✓ [bullet 2] ✓ [bullet 3]
Prepara: dispositivo carregado, 60 min sem interrupção, [objeto do nicho].
Não vou liberar replay. Quem ficou pra trás esse mês perdeu mesmo.
[assinatura]
P.S.: confirma teu WhatsApp - o link da sala vai por lá 5 min antes.
```
*(exemplo: assunto "Amanhã, 19h - o número que muda como você procura emprego"; insight = "recrutador olha um currículo por 6 segundos antes de decidir")*

**C. E-mail do PÓS por objeção (Passo 4, ~24h depois)** - nomeia a objeção nº 1 do chat e a inverte:
```
Assunto: "[objeção nº 1 literal do chat]"
[nome], a objeção que mais apareceu no chat ontem: "[objeção]".
Eu entendo. Mas olha a armadilha: [inversão - o jeito ERRADO é o que
custa caro; responde o estado de quem decide, não a frase literal].
Por isso o método foi desenhado pra esse caso:
- [recurso 1 que resolve] - [recurso 2] - [recurso 3]
Se essa era a tua, agora você sabe que não é.
Checkout: [URL] · [bônus de ação rápida] vale até [hora].
[assinatura]
```
*(exemplo: objeção "não tenho tempo"; inversão = "o método que você usa hoje É o que consome seu tempo, não a mudança")*

Regra dura dos 3: a objeção vem do chat REAL (sem dado, `[A CONFIRMAR]`), o insight é conteúdo de verdade, o número é real. Nunca inventa.

## Passo 5, princípios de copy por canal (aplica em toda mensagem)

| Canal | Regras |
|---|---|
| **WhatsApp (primário)** | 50-150 palavras, até 5 linhas; **nunca encaminha o e-mail**, reescreve no formato; áudio só se a pessoa esperar, >90s transcreve; 1-2 emojis contextuais; link encurtado e rastreável; quem responde é lead quente, abre conversa 1:1; **template aprovado fora da janela, livre dentro**. |
| **E-mail (secundário)** | assunto 4-7 palavras, sem caixa alta, pré-header complementa (não repete); abertura = nome + 1 frase de contexto; 1 ideia + insight + CTA; corpo 200-400 palavras; **CTA com link claro, repetido 2x**. |
| **Tom Soft** | sem motivacional vazio, sem urgência falsa, sem caps lock, sem "AMIGO/MEU CONSAGRADO", sem GIF. Direto, curto, útil. |

## Passo 6, roda o GATE por DENTRO (auditoria silenciosa, NÃO imprime)

Roda em **cada mensagem** (assunto + corpo) por dentro. Só VEREDITO = PASSA vai pro cliente. Uma falha refaz a frase, não o conceito. A tabela é checklist interno, jamais saída.

| Check | Passa se |
|---|---|
| **Ancorada na fala real** | nasce de fala literal (N real) OU prova real; N inventado reprova |
| **1 trabalho só** | faz UMA coisa (a da tabela do Passo 2/3/4) |
| **WhatsApp primeiro** | régua nasce no WhatsApp; e-mail é reforço; o link da sala só por WhatsApp |
| **Canal certo** | WhatsApp = curto, humano, NÃO é cópia do e-mail; e-mail = narrativa, assunto-curiosidade; nenhum e-mail durante a aula |
| **WhatsApp oficial conforme** | opt-in real; mensagem iniciada fora da janela marcada [TEMPLATE] (aprovável Meta); dentro da janela [livre]; stack = Cloud API oficial, nunca não-oficial |
| **Régua de antes completa** | cadastro + 24h + 1h + link 5 min; falta um, reprova |
| **Durante certo** | só WhatsApp, só pra quem confirmou; meio reativa, oferta avisa que abriu (checkout+prazo); nenhum e-mail |
| **Pós completo** | resumo + prova + objeção + last call + fechamento + downsell/pergunta; roteado pela tag de % assistido |
| **Zero replay** | nada de gravação/"trecho"/"assista de novo"; quem faltou vai pra próxima sessão |
| **Puxa pro 1:1** | quem responde = lead quente, venda vai pro 1:1; não força checkout em alto ticket |
| **Escassez auditável** | prazo/lotação/bônus = verdade; escassez nos bônus, não no produto |
| **Modo certo** | modo declarado; timing/escassez/link batem. Perpétuo: datas relativas, escassez por sessão, link individual, **nada que DATE**, zero timer fake. Ao vivo: datas absolutas, escassez de evento, link único. Mistura reprova |
| **Insumo declarado** | tudo que falta marcado `[A CONFIRMAR]`, não preenchido com plausível (Lei 5) |
| **Doc enxuto** | só as mensagens; zero meta/bastidor (Lei 6) |
| **C/U/B** | Clara, Útil, do mundo do cliente (nunca "lead"/"funil"/"ticket" pro leitor) |
| **CTA com destino** | todo CTA tem link e destino (checkout/página/sala); e-mail repete 2x |
| **Dá pra ver / falsificar?** | enxerga a cena ou o número; fato falsificável, não adjetivo |
| **Só você diz?** | concorrente direto não assina igual (mecanismo/caso próprio) |
| **Anti-IA** | zero travessão longo (nenhum U+2014 nem U+2013, ver REGRA DE GERAÇÃO nº 1) · zero "emperrar/empacado/desemperrar" (exceto aspa do cliente) · sem frase-emoldura · sem verbo-clichê. A auto-revisão visível do Passo 7b prova que isto passou; sem ela, "zero em-dash" é decorativo. |
| **VEREDITO** | **= o pior item acima.** Qualquer reprovação = REFAZ. Só tudo-aprovado = PASSA. |

No Claude Code, roda `python3 scripts/lint_copy.py mensagem.txt` em cada peça (reprova em-dash e "emperrar"). No app/chat NÃO existe execução de script: a garantia é o Passo 7b, a auto-revisão visível e obrigatória, feita ANTES do STOP do Passo 8. (`shared-references/crivo/03-gate-cub.md`; `shared-references/filtro-anti-ia/padroes-banidos.md`.)

## Passo 7, métricas-alvo e diagnóstico (lê antes de culpar a copy)

| Métrica | Faixa esperada |
|---|---|
| Abertura de e-mail (pré) | 35-50% |
| Clique de e-mail (pré) | 8-15% |
| Comparecimento ao webinar | 30-50% (alvo alto pressupõe WhatsApp no funil) |
| Abertura de e-mail (pós) | 25-40% |
| Compra automática no checkout (de quem comparece) | 6-8%, antes de qualquer comercial |
| Conversão do pós (lead → compra) | 3-12% (5%+ perpétuo, 10%+ ao vivo) |
| Resposta à pergunta de 1 palavra | 5-15% |

**Diagnóstico:** indicadores muito abaixo = quase sempre furo **técnico do encanamento** (página, horário, hospedagem do vídeo, mensageria, **WhatsApp não ligado**), não a copy da aula. Audita o encanamento antes de reescrever a aula no desespero.

## Passo 7b, auto-revisão VISÍVEL anti-IA (obrigatória ANTES do STOP)

O gate do Passo 6 roda por dentro, mas no app/chat ninguém executa script, então os 3 checks mecânicos abaixo você MOSTRA que fez, por escrito, antes de mostrar a régua. Sem esta linha visível, a nota "zero em-dash" não vale. Releia CADA mensagem do doc, palavra por palavra, e confirme por escrito ao dono, numa linha curta:

> ✅ Auto-revisão anti-IA: 0 travessão longo (nenhum U+2014/U+2013, reescritos como ponto/vírgula/hífen comum), 0 "emperrar/empacado/desemperrar" (fora de aspa do cliente), 0 e-mail durante a aula.

Se ao reler você achar QUALQUER travessão longo, reescreve na hora (ponto, vírgula ou ` - `) ANTES de escrever essa linha; a confirmação só existe depois que o doc está limpo de verdade. Achou família "emperrar" fora de aspa, mesma coisa. Só então segue pro Passo 8.

## Passo 8, mostra e PARA

Só chega aqui depois de escrever a linha de auto-revisão do Passo 7b. Mostra **só as que passaram, LIMPO**: cada mensagem com canal + timing + trabalho + (no WhatsApp) [TEMPLATE]/[livre], e o corpo embaixo. Sem tabela de gate, sem meta. Pergunta "essa régua te serve? ajusto ou sigo?". **Espera o OK.**

No fim, entrega o **checklist técnico de subida** (encanamento; o gate do Passo 6 é a COPY):

- timestamp da oferta definido; marcos de % assistido (0-25 / 25-75 / passou-da-oferta / 100%);
- tags criadas e roteamento por tag ligado (viu-oferta → fechamento; saiu antes → nutrição; não-compareceu → reconvite; comprou → sai de tudo);
- filtro "é cliente?" na entrada da esteira; limpeza de lista (1 mês sem abrir sai);
- **opt-in de WhatsApp por "manda OI"** com botão pré-preenchido na página de obrigado; **evento de cadastro registra no pixel ANTES de redirecionar pro WhatsApp** (redirect rápido pode disparar o pixel tarde e o gestor perde conversões);
- **WhatsApp na Cloud API oficial** (ManyChat/Take Blip/Twilio + API oficial), **templates aprovados pela Meta** pros toques fora da janela de 24h, **nunca API não-oficial** (número banido no meio do funil mata a sequência);
- e-mail (secundário) com DKIM/SPF/DMARC numa plataforma de automação (ActiveCampaign, RD Station, Brevo, Mailchimp), trigger por evento de cadastro;
- **manual até ~100 cadastros/semana** (copy-paste no WhatsApp business, sente o que o cliente responde); **acima disso, automatiza**;
- links rastreados (UTM em tudo) + disparo de teste pra você mesmo antes de subir.

## When NOT to use (manda pra skill certa)

| Pediu | Vai pra |
|---|---|
| ROTEIRO ou falas do webinar | soft-webinar-script |
| OFERTA, preço, bônus, garantia | soft-webinar-plano |
| Página de cadastro/obrigado/checkout/VSL | soft-funil-landing (ou soft-funil-carta) |
| PLANO ou esqueleto APSD | soft-webinar-plano |
| Conversa de venda 1:1 (script, objeção ao vivo, fechamento) | soft-vendas-closer |
| Anúncio do webinar / headline de feed | soft-conteudo-impulsionar / soft-conteudo-headlines |
| Pacote inteiro do webinar | soft-webinar-plano |

**A MÁQUINA de pós (timestamp da oferta, tags no CRM, marcos de %, roteamento por tag) FICA AQUI**, é escopo desta skill: a régua usa a tag no Passo 4 e você monta o encanamento no checklist do Passo 8. Não roteia pra lugar nenhum.

## Anti-Patterns (sintoma → correção)

| Sintoma | Correção |
|---|---|
| Tratou e-mail como canal principal / régua sem WhatsApp | WhatsApp é o primário; e-mail reforça. Régua nasce no WhatsApp. |
| Usou API não-oficial de WhatsApp (Z-API e afins) | Só Cloud API oficial. Não-oficial = número banido no meio do funil = sequência morta. |
| Iniciou mensagem fora da janela de 24h sem template aprovado | Fora da janela só template aprovado pela Meta; dentro da janela, livre. |
| Disparou pra base sem opt-in | Sem opt-in = bloqueio + multa. A pessoa manda "OI" primeiro (botão pré-preenchido). |
| Pediu o telefone num campo do formulário | Inverte: botão "manda OI" pré-preenchido; captura por comportamento. |
| Mandou o link da sala por e-mail | Link da sala só por WhatsApp (e-mail atrasa, cai em spam). |
| Ofereceu replay, gravação ou "trecho de 15 min" | Tira. Sem replay. Quem faltou vai pra próxima sessão. |
| Despejou todas as mensagens sem checkpoint | Régua de antes, PARA pro OK, depois durante, depois pós; cada uma com gate. |
| WhatsApp é cópia/encaminhamento do e-mail | Reescreve no formato: 1 linha de promessa + 1 pedido, até 5 linhas. |
| Uma mensagem faz três trabalhos | Separa: 1 trabalho por mensagem. |
| Mandou e-mail durante o webinar | Tira. Durante a aula só WhatsApp. |
| Reconvite igual pra todo mundo | Roteia pela tag de % assistido: quente fecha, morno nutre, frio reconvida. |
| Tratou quem saiu cedo como lead quente | Lead quente é quem viu a OFERTA; quem não passou do timestamp é morno no máximo. |
| Inventou a objeção do reconvite | Vem do chat real; sem dado, `[DADO: confirmar]`. |
| Escassez fabricada ("só hoje" sem ser) | Só escassez auditável; recai nos bônus, não no produto. |
| Forçou checkout em alto ticket | Puxa pro 1:1; checkout direto só em ticket que comporta. |
| Inventou número de caso/resultado | Só número REAL; sem fonte, não conta como ancorado. |
| Esqueceu o gancho de retenção | Anuncia no de 1h que quem fica até o fim pega um bônus revelado no timestamp da oferta. |
| Datou uma mensagem do perpétuo | No perpétuo nada pode datar; escassez por sessão, datas relativas ao cadastro. |
| Usou timer de calendário fake no perpétuo | Escassez por sessão; o "último dia" coletivo é a esteira semanal. |
| Mandou link único de sala no perpétuo | Perpétuo = link individual por lead (modelo cinema). |
| Narrou o fluxo / imprimiu a tabela do gate | Não narra; gate é interno; saída é só a peça limpa. |
| Inventou número/case/timestamp pra não deixar buraco | `[A CONFIRMAR: o quê]` no lugar exato (Lei 5). |

## References (o fluxo acima é autossuficiente; abra pra a profundidade que cada passo manda)

- `references/sequencias-email-whatsapp-pre-pos.md`: a fonte rica, **molde + exemplo preenchido por nicho de CADA mensagem** (pré, durante, pós), a mecânica da tag por % assistido, a esteira semanal, a captura sem fricção e a config técnica (incl. WhatsApp Cloud API oficial, templates, opt-in). Passos 2, 3, 4.
- `references/perpetuo-vs-aovivo.md`: **a tabela-mãe do que muda na mensageria entre AO VIVO e PERPÉTUO** (timing, escassez, link), escassez por sessão, link individual por lead, multi-horário, métricas do perpétuo. Passo 1.
- `references/perpetuo-mecanica.md`: a mecânica crua de referência no perpétuo (sessão estratégica, escassez de sala, escolha de horário, regra dos 90%). Passo 1, modo perpétuo.
- `shared-references/crivo/03-gate-cub.md`: detalhamento do gate (C/U/B + 3 perguntas).
- `shared-references/crivo/01-entrada-verbatim.md`: como minerar e contar a fala real do Passo 0.
- `shared-references/filtro-anti-ia/padroes-banidos.md`: os padrões que o anti-IA reprova.
- `shared-references/filtro-cliente-primeiro.md`: a lente de filtrar e atrair o cliente certo.
- `scripts/lint_copy.py`: no Claude Code, o cinto extra do anti-IA (reprova em-dash e "emperrar").


---

## 📧 AUTOMAÇÃO 7 DIAS PÓS-WEBINAR (Marco Enes aula 19, injetado 16/07/2026)

Maioria não compra no webinar. Quem entrou na lista e não é cliente entra NESSA automação (tag `AutoAll`, exclui quem tem tag de cliente). Sequência:

- **D+1 · Melhor material de graça (reciprocidade).** Anexa PDF curto do teu melhor conteúdo (até 1MB) DIRETO no e-mail , não link pra baixar. Encanta antes de vender de novo.
- **Espera até segunda-feira 9h** (represa todo mundo da semana no mesmo pulso).
- **Seg 9h · Ramo A (já viu oferta no webinar e não comprou):** oferta direta por e-mail → link pra página de vendas. **Ramo B (não viu a oferta):** re-convite pro webinar HOJE 20h com botão pro link One-Click Registration (`https://event.webinarjam.com/register/<id>/<hash>?first_name={{first_name}}&email={{email}}&schedule_id=3`) , botão inscreve sozinho, muda o jogo em participação e compra.
- **Qua · Re-convite headline B.** Mesmo webinar, MECANISMO ÚNICO com tema trocado (ex: "robô LinkedIn" → "nova IA pra fazer LinkedIn"). Copy do mecanismo a mesma, embalagem nova.
- **Sex · Oferta direta last-call.** "Hoje é o último dia, inscreve aqui" → página de vendas. Fecha a semana.
- **Goal:** comprou em qualquer ponto → pula pro fim da automação (não recebe o resto).

**Broadcast semanal** pra base com tag `AutoAll` (passou pela automação e não comprou) testando e-mail novo, do mesmo jeito que testa criativo de ad. **Rotina de limpeza:** 30 dias sem abrir → unsubscribe automático (regra padrão do ActiveCampaign serve).


---

## RÉGUA DE DIAGRAMAÇÃO obrigatória (18/07/2026)

Todo doc/entregável que essa skill produz DEVE seguir `/home/cloud/.openclaw/brain/REGUA-DIAGRAMACAO-DOCS.md`:

- Topo: rótulo pequeno + título grande + subtítulo + metadata `chave: valor`
- Números ANTES da narrativa (seção "0" com tabela/KPI ancora tudo)
- Numeração hierárquica (1, 2, 3.1, 3.2), divisa entre seções
- Bloco padronizado que se repete em TODAS as seções
- Bullet > parágrafo, com palavra-âncora em **negrito**
- Callouts (azul/verde/amarelo/vermelho) 1 por seção no máximo
- Comparação = 2 colunas paralelas · Fluxo = seta ↓ · KPI = cards
- Aspas literais pra citação · badges pra marcar novidade
- Fecha com checklist acionável (dono/prazo quando existe)
- Zero gordura: NUNCA "vale destacar", "importante notar", "além disso", "por outro lado", "em suma", "conforme mencionado", "neste documento", "vamos explorar"
- **Zero changelog** dentro do doc (não escreva "atualizei X, antes era Y")
- **Zero meta-processo** ("pesquisei X, cruzei com Y")
- 1 bloco = 1 tela de celular (o dono lê no Telegram)

**Teste antes de entregar:** (1) topo bate no padrão? (2) número ancora antes da narrativa? (3) bloco padronizado repete? (4) callout ≤1 por seção? (5) checklist acionável no fim? (6) zero das palavras proibidas? Se sim nos 6 → entrega. Se não → reescreve.

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


============================================================
MODO PIPELINE Q&A GUIADO RETOMÁVEL (mold soft-webinar-plano), 2026-07-23
============================================================

Esta skill agora OPERA em Q&A guiado retomável, no mesmo molde da
soft-webinar-plano. O corpo acima é a FONTE DE MÉTODO (os frameworks,
as tabelas, as fórmulas, os anti-patterns, os checks do gate). O
pipeline abaixo é a EXPERIÊNCIA que conduz o dono pelo método,
uma pergunta por vez, com preview e retomabilidade.

Ordem sempre: (a) chega pedido, (b) roda M0 pra identificar sub-caso,
(c) roda P0 pra importar o que já existe e pular perguntas cobertas,
(d) roda as Fases numeradas, cada uma UMA pergunta por vez com 2-3
opções cruzando com o método do corpo, (e) preview a cada 5 respostas,
(f) fecha com o gate.


REGRAS TRANSVERSAIS DURAS (valem em TODOS os blocos)

1) UMA PERGUNTA POR VEZ. Nunca despejar 5 perguntas juntas. Nunca
   continuar antes da resposta anterior.

2) SUGERE 2-3 OPÇÕES depois das perguntas cruas. Nunca sugestão única
   (vira empurrão). As opções vêm cruzando a resposta do dono com o
   método do corpo acima. Ele escolhe, edita, ou pede mais.

3) PREVIEW a cada 5 respostas. Bloco curto: "com o que você me deu
   até agora, o esqueleto ta assim: [3-4 linhas]. seguimos?".

4) ZERO DEFAULT DO DONO DO MÉTODO (o dono). Exemplos do produto do dono
   (Operação SOFT, Mesa de Operação, Call de Arquitetura) só entram
   como REFERÊNCIA marcada "(exemplo, não copia)". Naming do dono da
   skill é SEMPRE aberto: ele escolhe o nome. A skill NUNCA impõe.

5) RETOMABILIDADE. A cada resposta o state cai em
   /tmp/<skill>-<slug>-<epoch>.json. Se o dono chamar de novo (ou
   sair e voltar), a skill lê o state mais recente e pergunta
   "quer continuar de onde parou ou começar novo?".

6) SAIR/PAUSAR SALVA. "sai", "pausa", "amanhã" → salva state, avisa
   o path, encerra limpo.

7) PULAR = "[A CONFIRMAR]". Se o dono digitar "pula" ou "depois", a
   resposta vira [A CONFIRMAR - <bloco>] no state e o pacote final
   marca esses pontos pra ele afinar.

8) RESPOSTA RASA = REFAZ A PERGUNTA. Se o dono responde em 3 palavras
   algo que precisa contexto, devolve UMA pergunta específica pra
   abrir mais.

9) ZERO INVENTAR DADO DO DONO. Preço, número, case, nome de cliente,
   fala do avatar: se não respondeu, pergunta. Nunca chuta.

10) NAMING USER-FRIENDLY. Nomes internos (canonico/high_ticket, tipo
    A/B/C) nunca aparecem na cara do dono. Perguntar sempre pelo
    resultado que ele quer.


COMO OPERA (o loop)

Passo 1 - CHECA state antigo
   Lê /tmp/<skill>-*.json. Se encontrou, pergunta "vi um trabalho
   de {data} sobre {tese}. continua ou começa novo?".

Passo 2 - RODA a fase atual
   Uma pergunta por vez. Salva resposta no state. Cruza com o método
   do corpo. Devolve 2-3 sugestões. Dono escolhe ou edita.

Passo 3 - PREVIEW a cada 5 respostas
   Bloco curto de progresso.

Passo 4 - AVANÇA pra próxima fase quando fecha a atual
   Anuncia em uma linha: "beleza, agora vou pra {nome amigável}".

Passo 5 - NA FASE DE GERAÇÃO
   Monta o entregável usando o método do corpo (as fórmulas dos
   blocos, o gate, os anti-patterns).

Passo 6 - ENTREGA
   Google Doc (via gog drive upload --convert) OU artefato específico
   da skill + resumo curto + lista de [A CONFIRMAR] pendentes.


ESTADO EM /tmp

Arquivo: /tmp/<skill>-<slug>-<epoch>.json

Formato mínimo:
{
  "skill": "<nome>",
  "slug": "<slug curto>",
  "epoch": <unix>,
  "criado_em": "<ISO>",
  "atualizado_em": "<ISO>",
  "fase_atual": "M0|P0|F1|F2|...|Fn|entrega",
  "sub_caso": "<valor de M0>",
  "pecas_prontas": {},
  "respostas": {},
  "pendentes_a_confirmar": []
}



============================================================
M0 / P0 / FASES, soft-webinar-mensagens
============================================================

M0. MODO, UMA pergunta abre o sub-caso:
"que sequência você quer agora?
 (a) pré-webinar (do lead se inscrever até entrar na aula)
 (b) durante (lembrete e call-in pra aumentar show-up)
 (c) pós-aula (janela quente de venda)
 (d) recuperação (quem viu e não comprou, replay, downsell)
 (e) tudo (sequência completa ponta a ponta)"

Grava state.sequencia. (e) roda as 4 em ordem, preservando
consistência de promessa e voz.


P0. IMPORT DE PEÇAS PRONTAS, UMA pergunta com checklist:
"marca com sim/não:

- Plano de posicionamento (Oferta, PUV, Mecanismo, Voz)
- Roteiro do webinar pronto (soft-webinar-plano)
- Páginas do funil prontas (soft-webinar-paginas)
- Canal principal (e-mail/WhatsApp/SMS/mix)
- Ferramenta de envio (GHL/MailerLite/Zapi)
- Ticket + garantia + urgência (data-limite real)
- Sequência antiga rodando (pra modelar)
- Nada, começo do zero"

Salva em state.pecas_prontas.


FASES

F1. BRIEFING, canal, ferramenta, janela de envio (data do
    webinar), temperatura de quem entra.

F2. MAPA DA SEQUÊNCIA, quantos toques em que canal, em que
    dia/hora, com que gatilho. Preview do mapa antes de escrever.

F3. ESCRITA MENSAGEM A MENSAGEM, UMA pergunta por mensagem
    quando precisa de insumo. 2-3 opções por mensagem cruzando
    com verbatim + tese-mãe. Preview a cada 5.

F4. GATILHOS + CONDIÇÕES, abriu/não abriu, clicou/não clicou,
    assistiu/não assistiu. Ramo por comportamento.

F5. GATE INTERNO + soft-critico-copy nas mensagens de venda.

F6. ENTREGA Google Doc com cada mensagem no formato pronta-pra-
    colar + tabela de gatilhos + observação de setup no CRM.

State: /tmp/soft-webinar-mensagens-<slug>-<epoch>.json

