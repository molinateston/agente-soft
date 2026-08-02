# Análise de webinar existente - auditoria e refinamento

> **Quando consultar:** Modo B do fluxo - cliente já tem webinar rodando (ou gravado) e quer ajustar. Esta reference substitui a Etapa 1-2 do Modo A.

> **A régua-mestra da auditoria (lê isto antes de tudo):** auditar não é dar palpite. É comparar o webinar do cliente, bloco a bloco, com **como os campeões fazem aquele bloco** - usando a biblioteca `exemplos-por-bloco/` como gabarito , achar onde o webinar dele **vaza** desse gabarito, e amarrar cada vazamento à **premissa ou guarda-corpo violado**. Diagnóstico sem premissa-violada por trás é opinião; com premissa é consultoria. Antes de auditar qualquer bloco, abre o arquivo correspondente em `exemplos-por-bloco/NN-xxx.md`, lê a síntese de premissas + os trechos verbatim dos campeões, e usa aquilo como linha de chegada.

> **Tom da auditoria (guarda-corpo de voz):** clínico, de médico que dá diagnóstico preciso - nunca guru, nunca motivacional, sem exclamação em cascata. Você não usa a família "travar/travado/destravar" na sua análise; usa **prende / segura / presa / emperra / libera / abre**. (Em citação literal de webinar a palavra do dono é dele - verbatim não se toca.) E você nunca inventa nome de mecanismo/Big Idea/inimigo pra atribuir ao cliente: ou usa o que ele já tem, ou marca **"(nome a definir com o cliente)"**.

---

## Índice

- Mapa de auditoria bloco a bloco (régua → vazamento → premissa violada)
- Diagnóstico instanciado - um exemplo trabalhado de ponta a ponta
- Quando o cliente está no Modo B
- O que o cliente precisa entregar antes da auditoria
- Diagnóstico em 4 dimensões
- Dimensão 1 - ATENÇÃO (primeiros 5-7 minutos)
- Dimensão 2 - DIAGNÓSTICO (minutos 5-20)
- Dimensão 3 - MECANISMO (minutos 20-45)
- Dimensão 4 - AÇÃO (minutos 45-72)
- Auditoria de páginas (paralela)
- Auditoria de sequências (paralela)
- Auditoria de anúncios (paralela)
- Output da auditoria
- Princípios de auditoria
- Modelo de relatório de auditoria
- Checklist da auditoria
- Notas operacionais

---

## Mapa de auditoria bloco a bloco (régua → vazamento → premissa violada)

Esta é a tabela-mãe da auditoria. Cada linha: o bloco, o que o **campeão faz** ali (régua, com ponteiro pro arquivo da biblioteca), o **vazamento típico** que você vê no webinar do cliente, e a **premissa/guarda-corpo** que o vazamento está violando. Você percorre a tabela bloco a bloco contra o webinar auditado e marca onde vaza.

| Bloco | Régua (o que o campeão faz - ver biblioteca) | Vazamento típico no cliente | Premissa/guarda-corpo violado |
|-------|---------------------------------------------|------------------------------|-------------------------------|
| **Abertura** | Agenda em objetivos numerados onde o **último objetivo = a promessa do produto disfarçada** ("líder reconhecido em 90 dias") + presente-mistério pra reter (`02-abertura-atencao.md`) | Boas-vindas longas, genéricas, motivacionais; agenda que não espelha a oferta; sem razão concreta pra ficar | "Abertura e oferta são o mesmo texto em dois tempos" - quando a abertura não planta a promessa do produto, o pitch chega como quebra, não como desfecho |
| **Autoridade/história** | Cicatriz ANTES do troféu - e a cicatriz É o estado atual do avatar (`03-autoridade-historia.md`) | Origin story que abre no troféu (flex), longa demais, sem empatia | Origin story tem que aproximar ("eu fui você"), não afastar ("eu sou genial"); flex = prova de gênio, que mata identificação |
| **Problema/Diagnóstico** | Vilão EXTERNO nomeado + culpa transferida + a audiência confessa a dor no chat ("síndrome do Fantástico", "dieta burra") (`04-problema-interesse.md`) | Problema genérico que não ressoa; tom acusatório que culpa o avatar; sem dado/lastro | "Admitir a dor não pode custar o ego do lead" - culpar o avatar fecha o ouvido dele; problema sem cena concreta não dá o "é exatamente isso" |
| **Big Idea / Big Domino** | UMA crença numa frase gravável que o espectador DIGITA, com prova terceirizada (`05-big-idea-domino.md`) | Big Domino ausente ou diluída em várias ideias; sem frase única; sem comando de registro | Sem o dominó, cada objeção sobrevive de pé; "se o lead aceita a frase, o produto vira a única conclusão lógica" |
| **Viradas/conteúdo** | Ensina o "o quê" inteiro, nunca o "como" sistematizado - Faca Soft (`06-viradas-conteudo.md`) | Tutorial passo a passo de graça (sacia o lead) OU só hype sem o "o quê" (cheira a pitch) | Faca Soft: "quem sai saciado não compra"; mas esconder o entendimento faz o avatar maduro farejar pitch e sair |
| **Provas/casos** | Prova na MOEDA da promessa, em camadas (mídia → documento bruto → casos de aluno → chat ao vivo); cada case = uma objeção encarnada (`07-provas-casos.md`) | Prova de gênio (feitos do dono) e não de método; sem documento bruto; um tipo só de prova | Prova de método aproxima ("se ela conseguiu, eu consigo"); prova de gênio afasta ("você consegue porque é você") |
| **Transição pra venda** | Oferta entra A PEDIDO: recap → mundo ideal → "sim eu quero" digitado → bifurcação caminho 1/2 (`08-transicao-pra-venda.md`) | Pivot brusco ou tímido; "agora vou vender" sem alavancagem; sem consentimento público | "Ninguém escolhe a opção solitária em público"; sem a escada de sins, o pitch é interrupção e a sala esfria |
| **Oferta/Stack** | A oferta é a aula reembalada; cada item do stack mata UMA objeção nomeada; valor avulso ancorado (`09-oferta-stack.md`) | Stack sem valor ancorado; itens que não casam com objeção; bônus que já estava na sales page | Sem valor avulso o cliente não sabe que o preço é barganha; item de stack que não mata objeção é peso morto |
| **Ancoragem/preço** | Dupla ancoragem + queda em degraus com reason-why + troca de unidade ("R$5,51/dia, uma Coca") com prova do gasto banal (`10-ancoragem-preco.md`) | Preço a seco, sem âncora; desconto sem reason-why; sem trivialização | Preço sem âncora parece caro; desconto sem motivo cheira a desespero/preço inflado |
| **Garantia** | Garantia CONDICIONAL de resultado (as condições são o plano de implementação); reembolso encenado com dignidade (`11-garantia.md`) | "Satisfação ou dinheiro de volta" genérico OU garantia ausente sem o bloco 10 forte que a substitua | Garantia é cardápio (decisão de design, não praxe), 6 de 9 campeões fecham sem ela; quem não tem, **precisa** de preço trivializado forte. NÃO decidir sozinho qual garantia: registrar como pergunta pro usuário decidir |
| **Escassez/urgência/CTA** | Escassez crível e auditável (15 primeiros com confirmação na tela; sessão limitada no perpétuo); CTA repetido Gain/Logic/Fear (`12-escassez-urgencia-cta.md`) | Urgência inventada que o avatar fareja; CTA único (só 1 vez); sem CTA Fear | Urgência falsa quebra confiança do avatar maduro; um CTA só não pega quem decide por lógica nem quem decide por medo da inação |
| **Q&A/objeções** | Objeção encenada pelo host antes de nascer ("Ju, …?" / "Bruno, mas…"); objeção-mãe invertida em vantagem; responde o estado decisório, não a pergunta literal (`13-qa-objecoes.md`) | Sem perguntas plantadas; respostas curtas que não quebram objeção; Q&A que alimenta o "maybe" | O "maybe" é o inimigo do bloco; responder o detalhe da pergunta evasiva alimenta o medo em vez de mover pra sim/não |
| **Interação/chat (transversal)** | Escada de micro-compromissos do "tá me ouvindo?" ao "já me inscrevi" - no pitch a pessoa já disse sim 8x em público (`14-interacao-chat.md`) | Webinar que só transmite, sem colher confirmação; perpétuo com nome falso ("Maria de SP acabou de comprar") | Sem a escada de sins o pedido caro chega frio; nome falso no perpétuo = escassez/prova mentirosa, quebra de confiança |

> **Como usar a tabela:** percorre cada bloco do webinar do cliente, compara com a coluna "régua", e onde houver vazamento, anota o bloco + o sintoma + a premissa violada. Esse trio (bloco + sintoma + premissa) é a unidade de diagnóstico do relatório - nunca anota um sintoma sem dizer qual premissa ele fere.

---

## Diagnóstico instanciado - um exemplo trabalhado de ponta a ponta

> **EXEMPLO (nicho: mentoria de gestão pra dentistas - webinar fictício pra ilustrar o método de auditoria; não é caso real, é molde preenchido).**

**O que o cliente entregou:** vídeo de 68 min + curva de retenção da plataforma + conversão atual de 1,2% (atendentes → compra), ticket R$4.000.

**Passo 1 - leio a curva e marco os drops:** queda de 22% nos primeiros 90s; queda de 18% entre min 24-30; queda de 31% no min 49 (início do pitch).

**Passo 2 - cruzo cada drop com o bloco no timestamp e com a régua da biblioteca:**

- **Drop 22% nos primeiros 90s → bloco Abertura.** Régua (`02-abertura-atencao.md`): o campeão da escola de gestão abre com headline-benefício e agenda numerada cujo 3º objetivo já é a promessa do produto ("líder reconhecido em 90 dias"). No webinar do cliente, a abertura são 2min40 de "bom dia, que alegria ter você aqui, deixa eu contar minha trajetória…" - boas-vindas longas + flex inicial. **Vazamento:** abertura não dá razão concreta pra ficar e abre no troféu. **Premissa violada:** "abertura vende permanência, não o produto" + "cicatriz antes do troféu". **Diagnóstico:** crítico, drop nos primeiros 90s.
- **Drop 18% min 24-30 → bloco Big Idea + Mecanismo.** Régua (`05-big-idea-domino.md`): UMA frase gravável que o lead digita ("vamos grifar: gestão ágil"), prova terceirizada. No cliente: ele lista 5 "pilares de gestão" sem reduzir a uma crença, e descreve o passo a passo de como montar a agenda da clínica (tutorial). **Vazamento:** sem Big Domino (5 ideias competindo) + quebra da Faca Soft (ensinou o "como"). **Premissa violada:** "se o lead aceita UMA frase, o produto vira a única conclusão" + Faca Soft ("ensina o quê, nunca o como"). **Diagnóstico:** crítico.
- **Drop 31% no min 49 → bloco Transição pra venda.** Régua (`08-transicao-pra-venda.md`): oferta entra a pedido - recap → mundo ideal → "sim eu quero" digitado → bifurcação caminho 1/2. No cliente: ele corta o conteúdo e fala "então, eu tenho um programa pra te ajudar com isso, custa R$4.000". **Vazamento:** pivot brusco, sem escada de consentimento, sem mundo ideal. **Premissa violada:** "a oferta entra a pedido; ninguém escolhe a opção solitária em público". **Diagnóstico:** crítico - é o maior vazamento do webinar.

**Passo 3 - o que NÃO vaza (entra no relatório primeiro):** a fase de problema (min 6-24) segura 84% da sala - ele nomeia bem a dor do dentista que "trabalha 12h e não sobra nada no fim do mês". Mantém intacto.

**Passo 4 - escrevo o trio de diagnóstico (bloco + sintoma + premissa) e priorizo:**
1. CRÍTICO - Transição (min 49, drop 31%): pivot brusco viola "oferta a pedido". Maior alavanca.
2. CRÍTICO - Big Idea + Mecanismo (min 24-30): sem dominó + ensinou o "como". 
3. CRÍTICO - Abertura (90s): boas-vindas longas + flex viola "permanência" e "cicatriz antes do troféu".

**Passo 5 - reescrita do bloco mais crítico (Transição), na pele do nicho do cliente:** insiro recap-inventário ("você viu hoje por que a clínica não sobra dinheiro, viu o mecanismo X, viu o caso da Dra. fulana") → mundo ideal concreto ("imagina fechar o mês com a agenda cheia dos pacientes certos e sair às 18h") → "se isso faz sentido, escreve **sim eu quero** aqui no chat" → bifurcação ("você tem dois caminhos: seguir tentando montar isso sozinho, ou pegar o atalho comigo"). **Nome do programa/mecanismo:** mantenho o que o cliente já usa; se ele não tiver nome próprio pro método, **marco "(nome a definir com o cliente)"** - não invento.

> Repara no método: cada drop foi amarrado a uma **premissa violada** e a régua veio da **biblioteca**, não da minha cabeça. A reescrita usou o mecanismo do campeão (escada de consentimento) mas vestiu a **pele do nicho do cliente** (dentista, R$4.000, Dra. fulana). É assim que toda auditoria deste arquivo deve sair instanciada.

---

## Quando o cliente está no Modo B

- "Meu webinar não converte"
- "Tô gravando faz 3 meses, taxa de venda baixa"
- "Tenho um webinar rodando, mas quero refinar"
- "Achei o método, mas já tenho outro - adapta o meu"
- "Refizemos a oferta, preciso atualizar o webinar"

**Princípio:** **não reescreve do zero**. Audita, identifica vazamentos, reescreve **só os blocos quebrados**, mantém o que funciona.

---

## O que o cliente precisa entregar antes da auditoria

### Mínimo (caso ideal)

1. **Vídeo ou transcrição completa** do webinar
2. **Métricas dos últimos 60 dias:**
   - Cadastros totais
   - Atendentes
   - Tempo médio de retenção
   - Compras
   - ROAS (se rodou anúncio)
3. **Páginas atuais:**
   - Cadastro
   - Obrigado
   - Checkout
4. **Sequências atuais** (emails + WhatsApp se tiver)
5. **Custo médio por lead** (CPL dos anúncios, se aplicável)

### Cenário comum (cliente não tem tudo)

Quase nunca cliente tem todos os dados. Adapte:

- Sem vídeo? Pede pra contar oralmente o que faz em cada bloco
- Sem métricas? Roda 30-60 dias monitorando antes de auditar
- Sem páginas? Audita só o webinar, depois revisa páginas separado

---

## Diagnóstico em 4 dimensões

```
1. ATENÇÃO         → Quem entrou continua nos primeiros 5 minutos?
2. DIAGNÓSTICO     → Quem ficou quer ouvir até o pivot?
3. MECANISMO       → Quem ouviu a solução acreditou nela?
4. AÇÃO            → Quem acreditou comprou?
```

Cada dimensão tem **métricas observáveis** + **sintomas qualitativos**.

---

## Dimensão 1 - ATENÇÃO (primeiros 5-7 minutos)

### Métricas-alvo

| Métrica | Saudável | Vazando |
|---------|----------|---------|
| Taxa de retenção em 5 min | 85%+ | <70% |
| Drop nos primeiros 60s | <10% | >25% |

### Sintomas de vazamento

**Sintoma A: drop nos primeiros 60s (>15%)**

**Causas prováveis:**
- Boas-vindas longas e genéricas
- Sem identificação imediata ("é pra mim?")
- Tom motivacional vazio que afasta avatar maduro
- Áudio ruim ou imagem ruim (técnico)

**Reescrita prioritária:**
- Bloco 1.1 (Boas-vindas) - comprime pra 30-45 seg
- Bloco 1.2 (Premise chocante) - afia ou substitui

**Sintoma B: drop entre minuto 2 e 5 (>15%)**

**Causas prováveis:**
- Lead fraco - não prendeu
- Promessa primária não específica o suficiente
- Audiência não acredita em você (autoridade fraca ou flex)

**Reescrita prioritária:**
- Bloco 1.5 (Lead) - testa outro tipo (revelação, injustiça, descoberta)
- Bloco 1.6 (Autoridade) - refoca em resultado próprio + empatia, tira flex

### Régua de campeão pra esta dimensão (ver `exemplos-por-bloco/02-abertura-atencao.md` e `03-autoridade-historia.md`)

A linha de chegada contra a qual você audita a abertura do cliente:

> **EXEMPLO (régua, gestão/curso - 02-abertura-atencao.md):** *"o terceiro objetivo, eh eu quero que você descubra como ser um Líder melhor, admirado pela sua equipe, reconhecido pelo mercado em 90 dias. então Ó vou grifar essa palavrinha aqui ó 90 dias, e ao final da aula vou te explicar como é que você consegue isso"* - o 3º objetivo da agenda É a promessa do produto, com loop aberto. **Por que funciona:** quando a oferta chega 90 min depois, parece desfecho, não interrupção.

> **EXEMPLO (régua, retenção comprada - 02-abertura-atencao.md):** *"tem presente para quem fic até o final tá. fica aí até o final, não sai no meio da aula, porque vai ter presentes só PR os guerreiros e as guerreiras que ficam até o fim"* - razão concreta pra atravessar o pitch, plantada antes do conteúdo.

**Como auditar a abertura do cliente contra isso:** a agenda dele espelha a promessa da oferta? Existe presente-mistério / razão concreta pra ficar? Se a abertura é só "bom dia, seja bem-vindo, deixa eu me apresentar", **vaza** - viola "abertura vende permanência, não conteúdo".

**Como auditar a autoridade contra a régua (03):** o campeão põe **cicatriz antes do troféu** - e a cicatriz é o estado ATUAL do avatar. Se a origin story do cliente abre no resultado ("eu faturo X, tenho Y alunos"), é flex, afasta, e vaza no min 2-5.

> **EXEMPLO (régua de empatia, pele Soft - persona/origin):** a aluna de arquitetura do corpus abre na cicatriz: *"desligava o PC e ia chorar no chuveiro"* - antes de qualquer troféu. **Por que funciona:** prova de método ("eu fui você") aproxima; prova de gênio ("eu sou genial") afasta.

### Como auditar

1. Assista os primeiros 5 minutos do webinar inteiro
2. **Cronometra cada bloco** (boas-vindas, premise, promessa, fastpass, lead, autoridade)
3. Verifica se cada um tá dentro do tempo da reference 2
4. Verifica se cada um cumpre a função
5. Se algum bloco passa de 50% além do tempo esperado, **encurta**
6. Se algum bloco está abaixo de 50% do tempo esperado, provavelmente está raso

> **EXEMPLO de diagnóstico instanciado desta dimensão (nicho: mentoria financeira pra autônomos - molde preenchido).** Curva mostra drop de 19% em 60s. Cronometro: boas-vindas = 1min50 ("oi pessoal, que bom ter vocês, hoje vai ser especial, me acompanha nos próximos minutos…"). Comparo com a régua: zero promessa-resultado, zero presente, abertura puramente cortês. **Trio de diagnóstico:** Abertura - boas-vindas genéricas de 1min50 sem razão pra ficar - viola "abertura vende permanência". **Reescrita:** comprimo pra 35s e planto a agenda em 3 objetivos onde o 3º é a promessa do produto ("sair daqui sabendo como [resultado do nicho] em [prazo]") + presente pra quem fica. Severidade: crítico.

---

## Dimensão 2 - DIAGNÓSTICO (minutos 5-20)

### Métricas-alvo

| Métrica | Saudável | Vazando |
|---------|----------|---------|
| Retenção em 20 min | 65%+ | <50% |
| Drop entre min 8-15 | <15% | >25% |

### Sintomas de vazamento

**Sintoma A: drop entre min 8-12 (problema atual)**

**Causas prováveis:**
- Problema descrito de forma genérica (não ressoa)
- Falta concretude (não usa cenas específicas do cotidiano do avatar)
- Acusatório (faz avatar se sentir culpado em vez de aliviado)

**Reescrita prioritária:**
- Bloco 2.1 (Problema atual) - adiciona 2-3 cenas concretas
- Bloco 2.2 (Causa raiz) - verifica se está acalmando ou amplificando culpa

**Sintoma B: drop entre min 12-18 (inimigo / não é culpa sua)**

**Causas prováveis:**
- Inimigo não nomeado claramente
- Falta de absolvição explícita ("não é culpa sua")
- Tom culpabilizador

**Reescrita prioritária:**
- Bloco 2.4 (Inimigo comum) - reforça nomeação, tira pedras explícitas
- Bloco 2.6 (Não é culpa sua) - incluir se não tem

### Régua de campeão pra esta dimensão (ver `exemplos-por-bloco/04-problema-interesse.md`)

A linha de chegada: o campeão **nomeia um vilão externo**, faz a sala **confessar a dor no chat**, e dá lastro de dado - o avatar admite a dor sem perder o ego.

> **EXEMPLO (régua, vilão externo + ambiente seguro - a escola de gestão):** *"tem um monte de gente que a gente chama de gestores do passado que estão perdidos. quem é que é gestor do passado que tá perdido hoje em dia coloca nos comentários pra gente, não tem problema a sumir não tá gente, aqui nós estamos num num ambiente seguro"* - ridiculariza o vilão (imagem de IA), nunca a pessoa da sala. **Por que funciona:** culpa externa = ouvido aberto; quem confessa no chat se auto-diagnostica.

> **EXEMPLO (régua, dor com cena privada - pele Soft, persona Cláudia):** *"a primeira decisão do dia dela é o que vestir pra disfarçar a barriga"; "à noite, quando a casa dorme, ela visita o armário escondida e deita com raiva de si mesma"*. **Por que funciona:** a cena privada concreta produz o "é exatamente isso"; problema genérico ("você não está satisfeito com seus resultados") não ressoa.

> **EXEMPLO (régua, reframe de culpa):** *"Não é falta de disciplina sua, é o método errado que te ensinaram."* A culpa sai do ego do avatar e vai pro inimigo nomeado (o inimigo do nicho do usuário, marcado "(inimigo a definir com o cliente)"; exemplo de um nicho: "funil, lançamento, postar todo dia, mais uma ferramenta… some tudo e o nome é complexidade").

**Como auditar o problema do cliente contra isso:** ele nomeia um vilão EXTERNO ou culpa o avatar ("você não se esforça o suficiente")? Tem cena concreta ou é abstrato? Tem lastro de dado? Se o tom é acusatório, **vaza** - viola "admitir a dor não pode custar o ego".

### Como auditar

1. Olha curva de retenção da plataforma
2. Identifica onde a curva cai mais bruscamente entre min 5-20
3. Cruza com o roteiro pra ver qual bloco está naquele timestamp
4. Aplica lógica: bloco que perde >15% audiência precisa reescrita

### Sinal qualitativo de problema na Dimensão 2

Comentários do tipo:
- "Achei muito longa a parte de problema"
- "Senti que tava me culpando"
- "Esperei vir solução e ele continuou no problema"

Quando aparecem, **comprime esse bloco em 30-50%** e move pra solução mais cedo.

> **EXEMPLO de diagnóstico instanciado (nicho: estética avançada pra cabeleireiras - molde preenchido).** Drop de 24% no min 11. Cruzo com o roteiro: é o bloco de problema, e o trecho diz *"se você não está faturando, é porque não se dedicou o suficiente, não estudou as técnicas certas"*. Comparo com a régua: tom acusatório, vilão = a própria cabeleireira, zero ambiente seguro. **Trio:** Problema (min 11, drop 24%) - culpa jogada no avatar, sem vilão externo - viola "admitir a dor não pode custar o ego". **Reescrita:** transfiro a culpa pra um inimigo externo nomeado ("(nome do inimigo a definir com o cliente)" - provavelmente "a esteira de cursos de técnica que ninguém te ensinou a precificar") + convido a confissão no chat ("quem aqui já trabalhou o mês inteiro e no fim não sobrou nada, escreve 'eu' aqui"). Severidade: crítico.

---

## Dimensão 3 - MECANISMO (minutos 20-45)

### Métricas-alvo

| Métrica | Saudável | Vazando |
|---------|----------|---------|
| Retenção em 45 min | 50%+ | <40% |
| Pivot ao pitch (quem chega ao bloco 4.1) | 60%+ | <40% |

### Sintomas de vazamento

**Sintoma A: drop entre min 22-30 (Big Domino + Mecanismo)**

**Causas prováveis:**
- Big Domino fraca ou ausente
- Mecanismo único entrega passo-a-passo (quebra Faca Soft, parece tutorial)
- Sem provas concretas

**Reescrita prioritária:**
- Bloco 3.1 (Big Domino) - articula uma frase clara e forte
- Bloco 3.4 (Mecanismo único) - descreve resultado/função, **não execução**
- Bloco 3.3 (Provas) - adiciona 2-3 dados concretos

**Sintoma B: drop entre min 30-40 (Origin Story + Belief)**

**Causas prováveis:**
- Origin Story longa demais (>6 min)
- Origin Story focada em flex (não em empatia)
- Internal/External Belief não cobertas

**Reescrita prioritária:**
- Bloco 3.5 (Origin Story) - comprime, mantém estrutura 7 partes
- Blocos 3.6 + 3.7 (Internal + External) - incluir se ausentes

**Sintoma C: drop entre min 40-45 (Mundo ideal)**

**Causas prováveis:**
- Mundo ideal abstrato ("imagina sua vida diferente")
- Falta cenas concretas
- Aciona "encoraja sonhos" sem base lógica

**Reescrita prioritária:**
- Bloco 3.8 (Mundo ideal) - 3 cenas concretas com timestamp/data específica

### Régua de campeão pra esta dimensão (ver `exemplos-por-bloco/05-big-idea-domino.md`, `06-viradas-conteudo.md`, `07-provas-casos.md`)

A linha de chegada: UMA crença gravável (Big Domino), mecanismo nomeado, "o quê" sem o "como" (Faca Soft), e prova de MÉTODO na moeda da promessa.

> **EXEMPLO (régua, Big Domino numa frase gravável - a escola de gestão):** *"Se você quiser esquecer tudo o que eu falei até agora, e lembrar de uma única coisa, lembra disso aqui. A chave para você crescer e se manter relevante como líder no mercado, crescer na sua carreira, é aprender como resolver os problemas das empresas."* **Por que funciona:** reduz a decisão a um sim/não sobre uma frase só; aceitou a frase, o produto é a única conclusão lógica.

> **EXEMPLO (régua, equação causal dita em voz alta - a escola de gestão):** *"a equação é simples: você como profissional aprendendo a resolver os problemas das empresas vai gerar duas coisas, empresas mais produtivas e lucrativas… e para você como profissional um profissional mais valorizado."* **A régua:** a equação do webinar reduz o mecanismo a uma relação causal de uma frase, na moeda do avatar do usuário (o eixo/pilar do usuário, não um eixo importado).

> **EXEMPLO (régua, comando de registro - campeões; "escreve no chat: meio" = Webinar C/voz Bruno, dentista; "vamos grifar" = a escola de gestão):** o campeão manda o lead DIGITAR a crença ("escreve no chat: meio"; "vamos grifar"). Se o webinar do cliente declara a tese mas não manda registrar, perde o micro-compromisso.

> **EXEMPLO (régua da Faca Soft):** *"conteúdo bom não vende. Conteúdo bom sacia. E quem sai saciado não compra. Você estava com fome, comeu até encher, e agora não quer mais o prato do cara."* **Por que funciona:** entrega o "o quê" inteiro (eleva a consciência), reserva o "como" operacional pro produto. Auditoria: se o cliente ensina o passo a passo executável, ele saciou - vaza.

> **EXEMPLO (régua, prova de método ≠ gênio - 07-provas-casos.md):** o campeão mostra *"o Alessandro que saiu de 2.500 para 14.000"* (caso de aluno, replicável) e o **holerite/carteira de trabalho** como documento bruto. **Por que funciona:** prova na moeda da promessa (salário → foto da carteira); caso de aluno aproxima, feito do dono afasta.

### Como auditar

1. Verifica se Big Domino é articulada explicitamente (existe UMA frase gravável? o cliente manda registrar?)
2. Verifica se mecanismo único tem nome próprio - se NÃO tem, é slot a preencher: **"(nome do mecanismo a definir com o cliente)"**, nunca inventar e atribuir
3. Verifica se Origin Story segue 7 partes (background, tensão, fracasso, quebra, descoberta, aplicação, transformação) e abre na cicatriz, não no troféu
4. Verifica se a prova é de MÉTODO (caso de aluno + documento bruto) ou só de gênio (feitos do dono)
5. Verifica se o conteúdo ensina o "o quê" (eleva consciência) ou o "como" (sacia - vaza)
6. Cronometra cada bloco - Mecanismo é a fase mais longa, mas blocos individuais não devem passar de 5 min

### Sinal qualitativo de problema na Dimensão 3

- "Achei a explicação do método confusa"
- "Não entendi o que vocês fazem diferente"
- "Senti que era só conversa, não vi diferencial"

Solução: afia o **mecanismo único**. Se o método não tem nome próprio, **trabalha com o cliente pra nomear** (slot - não inventa sozinho).

> **EXEMPLO de diagnóstico instanciado (nicho: consultoria de tráfego pra e-commerce - molde preenchido).** Drop de 17% no min 27. É o bloco de mecanismo. Trecho: o cliente abre o gerenciador de anúncios e mostra ao vivo como criar uma campanha, passo a passo, por 9 minutos. Comparo com a régua: ensinou o "como" executável (quebra a Faca Soft) E não tem Big Domino - são 4 "dicas de tráfego" soltas, sem reduzir a uma crença. **Trio:** Mecanismo + Big Idea (min 24-30, drop 17%) - tutorial de graça + sem dominó - viola Faca Soft ("quem sai saciado não compra") e "uma crença numa frase". **Reescrita:** corto o tutorial, descrevo a FUNÇÃO/resultado do mecanismo sem a execução, e cravo a Big Domino numa frase gravável ("(frase do dominó a definir com o cliente)") que ele manda o chat registrar. Severidade: crítico.

---

## Dimensão 4 - AÇÃO (minutos 45-72)

### Métricas-alvo

| Métrica | Saudável | Vazando |
|---------|----------|---------|
| Retenção até pitch (min 50) | 50%+ | <35% |
| Conversão atendentes → compra | 5-15% (ao vivo) / 3-8% (perpétuo) | <2% |
| Q&A com perguntas reais | Variadas | 1-2 sempre repetidas |

### Sintomas de vazamento

**Sintoma A: drop ao iniciar pitch (min 47-52)**

**Causas prováveis:**
- Pivot mal feito (muito brusco ou tímido)
- Sem alavancagem ("agora vou vender")
- Sem permissão ("se não fizer sentido, sai")

**Reescrita prioritária:**
- Bloco 4.1 (Alavancagem) - texto de transição claro
- Bloco 4.2 (Permissão) - explicita

**Sintoma B: pitch chega, mas conversão é baixa**

**Causas prováveis:**
- Stack sem valor ancorado (cliente não sabe que vale)
- Garantia ausente ou fraca
- Bônus surpresa não exclusivo (já estava na sales page geral)
- CTA único (só 1 vez)

**Reescrita prioritária:**
- Bloco 4.4 (Apresentação Stack) - adiciona valor unitário ancorado
- Bloco 4.8 (Garantia) - destaque, prazo claro
- Bloco 4.9 (Bônus surpresa) - torna exclusivo de quem assistiu até ali
- Blocos 4.11 + 4.13 + 4.16 (CTAs Gain + Logic + Fear) - usa todos

**Sintoma C: Q&A fraco**

**Causas prováveis:**
- Sem perguntas plantadas
- Respostas curtas demais (não quebram objeção)
- Sem Genie inserido

**Reescrita prioritária:**
- Adiciona 5 perguntas plantadas (tempo, dinheiro, adequação, competência, timing)
- Insere Genie em 1 das respostas
- Cada objeção plantada deve ser ENCENADA na voz do espectador ("Bruno, mas eu não cobro isso ainda…") e respondida no enquadramento do host, não do cético
- A objeção-mãe do nicho ("eu faço isso sozinho" / "não é pra minha área") é invertida em vantagem, nunca só respondida
- Ver references `objection-annihilation.md` e `exemplos-por-bloco/13-qa-objecoes.md`

**Sintoma D: drop após pitch antes de fechar**

**Causas prováveis:**
- Sem CTA Fear (medo da inação)
- Despedida muito longa
- Final sem reforço final da Big Idea

**Reescrita prioritária:**
- Bloco 4.16 (CTA Fear) - incluir
- Bloco 4.17 (Despedida) - encurta pra 30-60 seg

### Régua de campeão pra esta dimensão (ver `08-transicao-pra-venda.md`, `09-oferta-stack.md`, `10-ancoragem-preco.md`, `11-garantia.md`, `12-escassez-urgencia-cta.md`, `13-qa-objecoes.md`)

> **EXEMPLO (régua, transição a pedido - 08):** o campeão sobe a escada de consentimento em 4 degraus - *"comenta aqui para mim tá curtindo a aula"* → future pacing do dinheiro → *"escreve nos comentários isso aqui para mim ó: sim eu quero"* → bifurcação *"você tem dois caminhos… você pode sair lá tentando aprender tudo isso sozinho ou você pode caminhar aqui comigo… Caminho um ou caminho dois, coloca nos comentários"*. **Por que funciona:** quando o pitch começa, a audiência já disse sim 4x em público; ninguém escolhe o caminho solitário na frente de todos.

> **EXEMPLO (régua, permissão pra vender via insuficiência - 08, a escola de gestão):** *"só pegar o conhecimento por conhecimento, a única coisa que você vai ganhar é o que eu chamo de obesidade mental… Tem que saber, cara, o que eu faço com esse conhecimento? E eu quero te ajudar nisso."* A oferta resolve a lacuna que a própria aula criou. **Exemplo de pele de um nicho:** "cada peça, sozinha, é simples. Juntas, viram um sistema inteiro do zero. E você não entrou no seu ofício pra virar engenheiro de sistema."

> **EXEMPLO (régua, garantia condicional - 11, Fladlien):** *"if you run a webinar in the next 30 days following my formula… and you don't see a massive improvement… Promptly and quietly, we'll return every penny."* As condições são o plano de implementação. **Guarda-corpo:** garantia é **cardápio**, decisão de design, 6 de 9 campeões fecham SEM garantia. Não decidir sozinho qual garantia o cliente deve usar; registrar como pergunta pro usuário decidir.

> **EXEMPLO (régua, escassez auditável - 12; exemplo de um nicho):** *"Eu tô em paz com a estratégia dos 15 primeiros porque eu ainda não tenho escala que compra mais de 15. O dia que comprar mais de 15 eu vou lá e mudo a live: pros 20 primeiros."* **Por que funciona:** escassez real (o número = capacidade de entrega), o avatar maduro fareja urgência inventada de longe.

> **EXEMPLO (régua, objeção encenada antes de nascer - 13):** o host fala na voz do espectador *"aí você pode falar pô mas eu não sou dono de empresa, que que eu tenho a ver com isso"* e responde antes da dúvida virar resistência; a objeção-mãe é INVERTIDA em vantagem (*"em terra de cego quem tem olho é rei: você seria o primeiro"*). **Por que funciona:** quem encena controla a formulação - escolhe a versão fraca da dúvida e responde com a versão forte do argumento. E o "maybe" é o inimigo: responder o detalhe da pergunta evasiva alimenta o medo; a resposta-mestra empurra pra sim/não.

### Como auditar a fase Ação contra a régua

1. O pivot entra a pedido (escada de sins) ou é brusco/tímido? Sem escada = vaza no min 47-52.
2. Cada item do stack mata UMA objeção nomeada e tem valor avulso ancorado? Item que não mata objeção é peso morto.
3. O preço tem dupla ancoragem + reason-why do desconto + trivialização ("R$X/dia")? Preço a seco parece caro.
4. A garantia (se tem) é condicional de resultado? Se NÃO tem garantia, o bloco de preço trivializado está forte o bastante pra cobrir? (decisão de cardápio, levar pro usuário decidir)
5. A escassez é auditável e real, ou inventada? Inventada quebra confiança.
6. As objeções estão encenadas antes de nascer? Tem os 3 CTAs (Gain/Logic/Fear)?

> **EXEMPLO de diagnóstico instanciado (nicho: mentoria jurídica pra advogados autônomos - molde preenchido).** Conversão atual 0,9%, drop de 28% no min 51 (pitch). Audito contra a régua: o cliente passa do conteúdo direto pro preço ("o programa custa R$5.000, link na descrição") - sem recap, sem mundo ideal, sem "sim eu quero", sem bifurcação. O stack tem 4 itens mas nenhum com valor avulso e nenhum amarrado a objeção. CTA único, sem Fear. **Trio múltiplo:** (a) Transição (min 51) - pivot brusco sem escada - viola "oferta a pedido"; (b) Stack - sem valor ancorado e itens não-objeção - viola "cada item mata uma objeção"; (c) CTA único - viola "Gain/Logic/Fear". **Reescrita priorizada:** primeiro a transição (maior alavanca) com os 4 degraus na pele do advogado, depois ancoro valor avulso em cada item do stack e reorganizo os 4 itens contra as 4 objeções reais do advogado, depois adiciono CTA Fear. Garantia: o cliente não tem, **não decido**, levo pro usuário decidir se vale adicionar do cardápio ou reforçar o bloco de preço. Severidade: crítico (a, b), médio (c).

---

## Auditoria de páginas (paralela)

Mesmo que o webinar seja o foco principal da auditoria, sempre verifica também:

### Página de cadastro

- [ ] Headline cabe em 1 linha mobile
- [ ] Bullets descrevem resultado, não execução
- [ ] Contra-filtro presente ("NÃO é pra você se...")
- [ ] Pixel da Meta instalado
- [ ] Mobile-first

### Página de obrigado

- [ ] Opt-in WhatsApp explícito (manda "OI")
- [ ] Anti-fuga (sem replay completo)
- [ ] Botão calendário .ics

### Página de checkout

- [ ] Stack visual com valor ancorado
- [ ] Garantia em destaque
- [ ] FAQ com 5-7 objeções
- [ ] Acima da dobra: formulário pagamento

> **Sintoma de vazamento de páginas:** alta taxa de cadastro mas baixa atendência (página de obrigado fraca) ou alta taxa de pitch mas baixa compra (página de checkout fraca).

---

## Auditoria de sequências (paralela)

### Pré-webinar

**Métricas:**
- Taxa abertura email pré: 35-50%
- Taxa atendência: 33-50%

**Sintomas:**
- Abertura baixa → assunto fraco ou plataforma com baixa entregabilidade
- Atendência baixa → falta opt-in WhatsApp ou falta anti-fuga

**Reescrita:** ver reference `sequencias-email-whatsapp-pre-pos.md`

### Pós-webinar

**Métricas:**
- Taxa abertura email pós: 25-40%
- Conversão pós-webinar (lead → compra): 3-12%

**Sintomas:**
- Abertura caindo a cada email → frequência alta demais
- Conversão pós zero → falta quebra de objeção e last call

**Reescrita:** padrão de 9 emails + 9 WhatsApps com janela de fechamento de 48-72h

---

## Auditoria de anúncios (paralela)

Se o cliente está rodando anúncios pra encher o webinar:

| Métrica | Saudável | Vazando |
|---------|----------|---------|
| CTR (click-through) | 1.5-3% | <1% |
| Taxa landing → cadastro | 25-50% | <15% |
| CPL (custo por lead) | Depende do nicho | Acima de R$25-50 (ticket médio Brasil) |
| ROAS | 2x-5x | <1.5x |

**Sintomas → Causas:**
- CTR baixo → criativo fraco (primeiros 3 segundos), headline genérica
- Landing → cadastro baixo → headline não bate com anúncio (mensagem desalinhada)
- CPL alto → público errado ou criativo cansado
- ROAS baixo → ou anúncio é caro demais ou conversão do funil é baixa

**Reescrita:** ver reference `anuncios-pra-encher-webinar.md`

---

## Output da auditoria

### 1. Diagnóstico

Documento com:
- Métricas atuais por dimensão
- Onde vaza (timestamps + blocos identificados)
- Severidade (crítico / médio / baixo)
- Comparação com benchmark Soft

### 2. Plano de reescrita priorizado

Lista ordenada de:
- **Críticos:** corrigir nas próximas 7 dias (vazam >15% por bloco)
- **Médios:** corrigir nos próximos 30 dias
- **Baixos:** opcional, refinamento

### 3. Blocos reescritos

Reescrita textual dos blocos críticos no padrão Soft + Brunson + Fladlien (puxa references 1, 2, 6).

### 4. Plano de implementação

Ordem de:
- Re-gravar trechos específicos OU
- Atualizar páginas/sequências/anúncios sem regravar
- Roda novamente 30 dias e remede

---

## Princípios de auditoria

### Não reescreva o que funciona

Identifique blocos com retenção saudável (>80% do tempo, >70% do bloco). Esses ficam intactos.

### Mude 1 variável por vez

Quando reescreve, troca 1 bloco. Mede 30 dias. Compara métrica antes/depois. Só então passa pro próximo bloco. Mudar tudo de uma vez te impede de saber **o que fez diferença**.

### Re-gravar é caro - quando vale a pena

**Vale re-gravar:**
- Pivot ao pitch tem drop >25%
- Mecanismo único não tem nome próprio
- Big Domino ausente
- Origin Story flex (não empatia)

**Não vale re-gravar (ajusta no entorno):**
- Páginas fracas
- Sequências fracas
- Anúncios fracos

> 70% dos casos: o webinar tá OK. **As páginas, sequências e anúncios estão vazando.** Audita o entorno antes de re-gravar.

### Cliente não quer ouvir "é tudo ruim"

Mesmo que tudo esteja ruim, o relatório de auditoria começa com **o que funciona**. Depois identifica vazamentos. Depois propõe ajustes. Cliente que se sente atacado fecha porta - e webinar permanece ruim.

---

## Modelo de relatório de auditoria

```
═══════════════════════════════════════════════════
AUDITORIA DO WEBINAR - [Nome do Webinar]
Cliente: [Nome]
Data: [Data]
═══════════════════════════════════════════════════

1. RESUMO EXECUTIVO
   - Webinar atual: [Promessa Primária]
   - Performance global: [Conversão atual] vs benchmark Soft [3-15%]
   - Diagnóstico em uma frase: [Onde está o maior vazamento]

2. O QUE FUNCIONA (manter)
   - [Bloco/elemento 1 com métrica que prova]
   - [Bloco/elemento 2]
   - [Bloco/elemento 3]

3. O QUE VAZA (consertar)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   CRÍTICO (próximos 7 dias)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   
 [Bloco X] - [problema] - drop de [%]
   Reescrita sugerida: [trecho rescrito ou referência]
   Impacto esperado: [+X% de conversão]
   
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   MÉDIO (próximos 30 dias)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   
 [Bloco Y] - [problema] - drop de [%]
   Reescrita sugerida: [...]
   
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   BAIXO (opcional)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   
 [Bloco Z] - [problema] - refinamento
   Reescrita sugerida: [...]

4. PLANO DE IMPLEMENTAÇÃO
   Semana 1: [ações específicas]
   Semana 2-4: [ações específicas]
   Semana 5+: medir, comparar, decidir próximos passos

5. EXPECTATIVA REALISTA
   - Conversão atual: [X%]
   - Conversão alvo após correções: [Y%]
   - Tempo até atingir: [60-90 dias]
═══════════════════════════════════════════════════
```

> **EXEMPLO do relatório PREENCHIDO (mentoria de gestão pra dentistas - molde do exemplo trabalhado lá em cima).**
>
> **2. O QUE FUNCIONA (manter):** a fase de problema (min 6-24) segura 84% - nomeia bem a dor do dentista que "trabalha 12h e não sobra nada". Mantém intacta.
>
> **3. O QUE VAZA:**
> CRÍTICO - Transição (min 49, drop 31%): pivot brusco "tenho um programa, custa R$4.000" sem escada de consentimento. Premissa violada: "oferta entra a pedido". Reescrita: recap → mundo ideal → "sim eu quero" → bifurcação caminho 1/2. Impacto esperado: maior alavanca do webinar.
> CRÍTICO - Big Idea + Mecanismo (min 24-30, drop 18%): 5 pilares competindo (sem dominó) + ensinou o "como" (tutorial de agenda). Premissa violada: "uma crença" + Faca Soft. Reescrita: cravar UMA frase gravável "(a definir com o cliente)" + descrever função do mecanismo sem execução.
> CRÍTICO - Abertura (90s, drop 22%): boas-vindas longas + flex. Premissa violada: "abertura vende permanência" + "cicatriz antes do troféu". Reescrita: comprimir pra 35s, agenda com 3º objetivo = promessa do produto, presente pra quem fica.
>
> **5. EXPECTATIVA REALISTA:** conversão atual 1,2% → alvo 3-5% após correções → 60-90 dias, medindo 1 variável por vez.

---

## Checklist da auditoria

- [ ] Cliente entregou vídeo/transcrição completa
- [ ] Cliente entregou métricas dos últimos 60 dias (ou rodou 30 dias se não tinha)
- [ ] Curva de retenção da plataforma analisada
- [ ] Cada bloco do webinar comparado contra a régua do campeão em `exemplos-por-bloco/` (mapa bloco a bloco)
- [ ] Cada vazamento amarrado à premissa/guarda-corpo violado (trio: bloco + sintoma + premissa)
- [ ] Cada uma das 4 dimensões foi auditada
- [ ] Páginas auditadas (cadastro, obrigado, checkout)
- [ ] Sequências auditadas (pré + pós)
- [ ] Anúncios auditados (se aplicável)
- [ ] Diagnóstico escrito com comparação a benchmark Soft
- [ ] Plano priorizado (crítico / médio / baixo)
- [ ] Reescritas dos blocos críticos prontas
- [ ] Cliente recebeu relatório + plano

---

## Notas operacionais

- **Não promete conversão exata.** "Esse webinar pode passar de X% pra Y%" é projeção, não garantia. O cliente sempre vai testar primeiro com o que você sugerir.
- **Auditoria é serviço caro.** Se o cliente não tá disposto a re-gravar nem ajustar páginas, o trabalho não vai gerar resultado. Verifica disposição antes.
- **A maior alavanca da auditoria geralmente NÃO é o webinar.** É o **anúncio** ou a **página de cadastro**. Webinar bom rodando em anúncio ruim parece "webinar ruim".
- **Re-rodar 30 dias depois da reescrita é obrigatório.** Sem dado novo, você não sabe se a reescrita funcionou.
- **Diagnóstico só vale com premissa por trás.** "Achei essa parte fraca" é palpite. "O bloco de transição vaza 31% porque o pivot é brusco e viola 'oferta entra a pedido' - a régua do campeão é a escada de 4 sins em `08-transicao-pra-venda.md`" é consultoria. Sempre cita o bloco da biblioteca como linha de chegada.
- **Reescreve com o mecanismo do campeão, mas veste a pele do cliente.** O exemplo do campeão dá o MECANISMO (escada de sins, vilão externo, dominó); o recheio sai do nicho do cliente. Colar o "gestor do futuro" ou a Cláudia no webinar de outro nicho é o erro que mata - esqueleto é lei, pele é do avatar.
- **Nome próprio (Big Idea, mecanismo, inimigo, bordão) é slot.** Se o cliente não tem, você marca "(a definir com o cliente)" e leva pra conversa. Nunca inventa e atribui.
- **Divergência metodológica nova (garantia, ordem de blocos, preço/ticket) não se decide na auditoria.** Registra pro usuário decidir.
