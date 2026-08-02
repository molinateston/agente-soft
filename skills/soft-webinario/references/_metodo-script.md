---
name: soft-webinar-script
description: "Gera o ROTEIRO APSD (copy FALADA nas NOTAS de cada slide) + o DECK VARIÁVEL de 140-180 slides do webinário Soft, a partir do PLANO já preenchido pela skill soft-webinar-plano. LÊ o campo `modo` do plano e ramifica em 2 caminhos: `canonico` (vende no checkout, esqueleto original) ou `high_ticket` (vende a CALL/APLICAÇÃO com SDR/Closer, os 13 beats D reescritos pra ancoragem sem preço, filtro anti-time-waster e formulário no lugar do checkout; fonte da variação em brain/conteudo/aula-webinar-AAA-HIGH-TICKET.md §1e). Esqueleto FIXO de 82 slides âncora (na ordem APSD); o deck real cresce pra 140-180 porque os blocos PROBLEMA e SOLUÇÃO expandem conforme o número de crenças, peças do mecanismo, provas e depoimentos que o dono definiu no plano, cada compra tem deck diferente. Dependência DURA: se /home/cloud/entregas/webinar-plano-<slug>.md não existir, aborta e manda rodar soft-webinar-plano primeiro. Output: /home/cloud/entregas/webinar-script-<slug>.md no formato UMA-TELA-POR-BLOCO (TELA/IMAGEM/NOTA/RITMO), seguindo a DOUTRINA-MD-TELEGRAM. Use quando o pedido for roteiro, script, aula, deck, slides, conteúdo, notas, oferta dentro da aula do webinar; NÃO use pro pptx (soft-webinar-slides), páginas (soft-webinar-paginas), mensagens (soft-webinar-mensagens), arte (soft-designer), carta/VSL/landing (soft-funil-carta/-landing), headline (soft-conteudo-headlines)."
---

# soft-webinar-script · Roteiro APSD + Deck variável 140-180

Esta skill gera DUAS coisas ao mesmo tempo, num único doc:

1. O ROTEIRO: a copy FALADA (vai na NOTA de cada slide, cadência de fala real, sem travessão).
2. O DECK: o visual (TELA + IMAGEM), 1 ideia / 1 número / 1 frase por slide.

Ela NÃO é começo. É o SEGUNDO passo do webinário. Vem DEPOIS que a skill soft-webinar-plano já perguntou tudo pro dono e gerou o mapa mental preenchido do webinário.

O deck é VARIÁVEL: cada compra sai com um número diferente de slides, entre 140 e 180. O esqueleto de 82 slides âncora é FIXO (a espinha do framework), mas os blocos Problema e Solução expandem conforme a densidade do plano (quantas crenças, quantas peças do mecanismo, quantas provas, quantos depoimentos).

---

## Pré-requisito duro (aborta se não passar)

Antes de qualquer coisa, roda:

    test -f /home/cloud/entregas/webinar-plano-<slug>.md

Se o arquivo NÃO existe, para tudo e responde exatamente:

    "Preciso do plano do webinário antes de escrever o roteiro.
     Roda a skill soft-webinar-plano primeiro, ela te faz o Q&A
     guiado bloco a bloco (Atenção · Problema · Solução · Decisão)
     e salva em /home/cloud/entregas/webinar-plano-<slug>.md.
     Quando esse arquivo existir, volta aqui."

Sem plano, sem roteiro. Não improvisa, não pergunta o conteúdo, não inventa crença/peça/prova.

---

## Como opera (fluxo interno)

1. Pergunta o SLUG do webinário (ou detecta o mais recente em /home/cloud/entregas/webinar-plano-*.md por mtime).
2. Lê o plano preenchido inteiro E extrai o campo `modo` (canonico ou high_ticket). Se `modo=high_ticket`, aplica os overrides da seção MODO HIGH TICKET abaixo.
3. Aplica o esqueleto de 82 slides âncora (a espinha, na ordem APSD).
4. Expande o bloco P (Problema) conforme o número de crenças a quebrar no plano (regra abaixo).
5. Expande o bloco S (Solução) conforme o número de peças do mecanismo no plano (regra abaixo).
6. Expande o bloco D (13 beats do PITCH) conforme a densidade de cada beat (número de depoimentos, tamanho do stack, etc).
7. Numera todos os slides em ordem final (SLIDE 001 até SLIDE NNN).
8. Escreve o output em /home/cloud/entregas/webinar-script-<slug>.md no formato UMA-TELA-POR-BLOCO.
9. Reporta contagem final de slides. Se cair fora do range 140-180, expande ou comprime P/S (nunca corta o esqueleto 82).
10. Roda ensure-bom-utf8.sh no arquivo final.
11. Opcional: gera Google Doc via gog drive upload --convert e devolve URL crua.

---

## O ESQUELETO 82 (marcos-âncora, sempre presentes, sempre nessa ordem)

Derivado de /home/cloud/.openclaw/brain/conteudo/WEBINARIOS-PERPETUOS-OFICIAL-mapa-mental.md (o mapa canônico APSD com os 13 beats do PITCH dentro do D).

Distribuição: A=10 · P=15 · S=15 · D=40 · Fecho=2 · Total=82.

━━━━━━━━━━━━━━━━━━━━━━━━━━
A · ATENÇÃO (esqueleto: 10 slides · slides 001-010 no deck real)
━━━━━━━━━━━━━━━━━━━━━━━━━━

- A01 · Boas-vindas + posicionamento curto (nome, quem é, credencial 1-linha)
- A02 · Anti-persona (o "engomadinho" que ele NÃO é; sinceridade radical)
- A03 · Promessa central falada cedo (o resultado grande, sem prazo mencionado)
- A04 · Premissa chocante que quebra o padrão (frase-tese que reprograma)
- A05 · USP dita cedo (nome da categoria própria)
- A06 · Micro-compromisso 1 ("posso jogar a real?")
- A07 · Micro-compromisso 2 ("melhor aula que você já viu, pode me cobrar")
- A08 · Os 5 ganchos (o que ele vai descobrir na aula, lista revelada)
- A09 · Presente pra quem fica até o fim (retenção plantada, SEM mencionar duração)
- A10 · One belief semeada (a frase-âncora que vai reaparecer no D)

━━━━━━━━━━━━━━━━━━━━━━━━━━
P · PROBLEMA (esqueleto: 15 slides · expande pra 30-40 no deck real)
━━━━━━━━━━━━━━━━━━━━━━━━━━

Marcos fixos (sempre presentes):

- P01 · O mapa externo que ninguém mostra (o cenário do mercado hoje)
- P02 · A filosofia da injustiça (tem gente pior vendendo mais)
- P03 · A cena do refém (o que o avatar vive na pele hoje)
- P04 · Autópsia canal 1 (o ônus real do primeiro caminho comum)
- P05 · Autópsia canal 2 (o ônus real do segundo)
- P06 · Autópsia canal 3 (o ônus real do terceiro)
- P07 · Autópsia canal 4 (o ônus real do quarto)
- P08 · Autópsia canal 5 (o ônus real do quinto)
- P09 · Slot de crença 1 (situação + quebra + prova), EXPANDE 3-5 slides
- P10 · Slot de crença 2, EXPANDE 3-5 slides
- P11 · Slot de crença 3, EXPANDE 3-5 slides
- P12 · Causa-raiz nomeada (a equação/fórmula do problema real)
- P13 · Inimigo nomeado (quem LUCRA com o problema)
- P14 · Absolvição (tira a culpa do avatar; "não é você, é o mapa")
- P15 · Dobradiça (arma o mecanismo sem nomear ainda)

Os slots P09-P11 são MARCOS ELÁSTICOS: viram tantos slides quantas crenças o plano listar.

━━━━━━━━━━━━━━━━━━━━━━━━━━
S · SOLUÇÃO (esqueleto: 15 slides · expande pra 40-60 no deck real)
━━━━━━━━━━━━━━━━━━━━━━━━━━

Marcos fixos:

- S01 · O prático (1 aperitivo real que já entrega valor)
- S02 · A nova oportunidade nomeada (o veículo que vai apresentar)
- S03 · Estreia do nome do mecanismo (com orgulho, tela quase vazia)
- S04 · Fundamento 1 (a condição/lei que sustenta o mecanismo)
- S05 · Fundamento 2 (a segunda condição)
- S06 · Slot peça 1 do mecanismo, EXPANDE 4-6 slides
- S07 · Slot peça 2 do mecanismo, EXPANDE 4-6 slides
- S08 · Slot peça 3 do mecanismo, EXPANDE 4-6 slides
- S09 · Slot peça 4 do mecanismo (se houver), EXPANDE 4-6 slides
- S10 · Prova racional (a tabela/matriz de superioridade)
- S11 · Prova-meta ("você é a prova, tá sentindo agora")
- S12 · Virada-chave (a redefinição que troca o eixo)
- S13 · Os módulos como caminho (só o QUÊ e o PORQUÊ, não o COMO)
- S14 · Recap yes-ladder (cadeia de SIM até "EU QUERO no chat")
- S15 · "Digita EU QUERO no chat" (o compromisso público antes do preço)

Slots S06-S09 são MARCOS ELÁSTICOS: viram tantos blocos quantas peças o plano definir.

━━━━━━━━━━━━━━━━━━━━━━━━━━
D · DECISÃO (esqueleto: 40 slides · expande pra 50-70 no deck real)
━━━━━━━━━━━━━━━━━━━━━━━━━━

Os 13 beats do PITCH na ordem canônica, cada um com seus slides âncora.

Beat 1 · Ponte da semente + concentração (3 slides)
- D01 · Resgata a semente do A ("tem um convite no fim")
- D02 · Fecha o loop com a one belief plantada em A10
- D03 · "A hora é agora, e o assunto muda"

Beat 2 · Yes-ladder + EU QUERO (3 slides)
- D04 · Recapitulação do que ele aprendeu (bullets do recap)
- D05 · Cadeia de SIM (3-5 perguntas retóricas)
- D06 · "Digita EU QUERO no chat" (pausa pública)

Beat 3 · Os 2 caminhos (3 slides)
- D07 · Caminho 1 · você monta sozinho com o que aprendeu
- D08 · Caminho 2 · você monta comigo (a sala digita "2")
- D09 · A escolha racional (por que o 2 economiza tempo/erro)

Beat 4 · Revelação do produto + PUV (3 slides)
- D10 · O nome do produto (revelação, tela quase vazia)
- D11 · A PUV em 1 frase (o que ele é, pra quem, com que resultado)
- D12 · O que o torna único (a única coisa que ninguém mais faz)

Beat 5 · Urgência honesta (3 slides)
- D13 · O que está acontecendo no mercado agora (item 1)
- D14 · O que está acontecendo no mercado agora (item 2)
- D15 · O que está acontecendo no mercado agora (item 3)

Beat 6 · Por que sou diferente de quem vende curso (2 slides)
- D16 · "Comprei tudo que existe, sei o que falta"
- D17 · "Não é curso de vender curso, aplico em outros nichos"

Beat 7 · Ancoragem por degraus (3 slides · FIXO)
- D18 · Degrau alto (o que a mesma solução custa em 1:1/consultoria)
- D19 · Degrau médio (o que custa em mentoria/grupo)
- D20 · Degrau baixo (o que vai custar aqui, ainda sem revelar)

Beat 8 · Stack item a item + cadeia de SIM (esqueleto de 6 slides · EXPANDE conforme stack)
- D21 · Núcleo do produto (o módulo principal, com preço)
- D22 · Módulo/curso prateleira 1 (com preço, cadeia "vale ou não vale?")
- D23 · Módulo/curso prateleira 2 (com preço)
- D24 · Módulo/curso prateleira 3 (com preço), EXPANDE se plano tiver mais
- D25 · Bônus Mastercard (SEM preço, o item "bônus" verdadeiro)
- D26 · Soma riscada na tela (o valor total real do stack)

Beat 9 · Garantia 90+90 (2 slides · FIXO)
- D27 · O que é a garantia (aplique 90, se não deu +90 comigo)
- D28 · Como acionar (o frame de risco zero, "pago o dobro")

Beat 10 · Queda em degraus até o preço final (4 slides · FIXO)
- D29 · Preço cheio (o valor total riscado)
- D30 · Preço de hoje (12x ou à vista, revelação)
- D31 · "O combinado" (+desconto em troca do resultado)
- D32 · Bônus dos 15 primeiros (fast-action, camada separada do desconto)

Beat 11 · Redução ao ridículo (2 slides · FIXO)
- D33 · O valor por dia (R$/dia)
- D34 · A comparação concreta ("menos que uma Coca", "um iFood por mês")

Beat 12 · Libera o link + 3 CTAs (4 slides · FIXO)
- D35 · Link liberado (tela do link + energia)
- D36 · CTA GANHO (o que ele leva se entrar hoje)
- D37 · CTA LÓGICA (a condição de hoje contra a visão de 12 meses)
- D38 · CTA MEDO (o melhor momento nunca chega)

Beat 13 · Fecho por identidade + fé (2 slides · FIXO)
- D39 · Identidade (quem escolhe a técnica sobre a força)
- D40 · "Te vejo do outro lado" (despedida no auge)

━━━━━━━━━━━━━━━━━━━━━━━━━━
FECHAMENTO (2 slides · FIXO)
━━━━━━━━━━━━━━━━━━━━━━━━━━

- F01 · Recap final do stack (tudo na tela, preço embaixo)
- F02 · Cronômetro/tela de agradecimento (link ainda visível)

Total esqueleto: 10 + 15 + 15 + 40 + 2 = 82.

---

## MODO HIGH TICKET (só ativa se `modo=high_ticket` no plano)

Se o plano trouxer `modo: high_ticket`, o esqueleto 82 MUDA nos blocos A, S e D. Fonte-mãe: `/home/cloud/.openclaw/brain/conteudo/aula-webinar-AAA-HIGH-TICKET.md` §1b, §1d, §1e.

### Deltas do bloco A (2 slides extras)

Adiciona DOIS slides no bloco A após A02 (anti-persona) e antes de A03 (promessa):

- A02b · CONTRATO DE AUDIÊNCIA (2 a 3 frases declarando quem tá na sala hoje, quem NÃO tá; puxa do campo A7 do plano)
- A02c · ANTI-DIY frame (1 frase abrindo a porta do custo alto sem soar vendedor; puxa do campo A8)

A pergunta A02b/A02c são MARCOS FIXOS no modo high_ticket; o bloco A vira 12 slides (10 fixos + 2).

### Delta do bloco S (1 slide extra)

Depois de S02 (nova oportunidade nomeada) e antes de S03 (nome do mecanismo), insere:

- S02b · Nome da Mesa / Célula (o produto high ticket como IMPLEMENTAÇÃO, não conteúdo; puxa do campo S7 do plano)

Bloco S vira 16 slides.

### Bloco D REESCRITO no high_ticket (mesma contagem 40, contéudo diferente)

Os 13 beats continuam sendo 13, mas o conteúdo dos slides D01-D40 muda pra vender a CALL, não o checkout. Fonte: doc HIGH TICKET §1e.

Beat 1 · Ponte da semente + concentração (3 slides)
- D01 · Resgata a semente do A ("lembra do convite? é agora")
- D02 · Fecha o loop com a one belief plantada em A10 apontando pra call
- D03 · "A hora é agora, o convite é uma CALL, não uma compra"

Beat 2 · Yes-ladder + QUERO CONVERSAR (3 slides)
- D04 · Recapitulação do que ele aprendeu (bullets do recap)
- D05 · Cadeia de SIM (3-5 perguntas retóricas)
- D06 · "Digita QUERO CONVERSAR no chat" (pausa pública, compromisso de INTERESSE, não de compra)

Beat 3 · Os 2 caminhos, DIY ou com você (3 slides)
- D07 · Caminho 1 · pega o mapa e monta sozinho (6-12 meses de teste)
- D08 · Caminho 2 · agenda a call, a gente avalia encaixe, se caber entramos juntos
- D09 · A sala digita "2"

Beat 4 · Revelação da CALL + PUV, SEM preço da mentoria (3 slides)
- D10 · O NOME DA CALL (do campo M5 do plano, tela quase vazia)
- D11 · A PUV da call em 1 frase (a única call que faz X usando Y sem Z)
- D12 · O que a call NÃO é (não é pitch, é diagnóstico com plano)

Beat 5 · FRAME do que a CALL É (entregável concreto, 3 slides)
- D13 · Duração + quem atende (ex 45min comigo ou com estrategista do time)
- D14 · O que a gente olha (funil, ticket, tráfego, rotina)
- D15 · O que a pessoa sai com (3 gargalos claros + próximo passo pra cada, comprando ou não)

Beat 6 · Ancoragem SEM PREÇO do produto principal (3 slides)
- D16 · Preço-referência real da call na esteira (ex R$1.500 a R$2.500)
- D17 · "Hoje é gratuita porque qualificamos antes de sentar por R$X"
- D18 · Inversão psicológica ("você não está sendo empurrado, está sendo avaliado")

Beat 7 · Escassez honesta por SLOT do Closer (2 slides)
- D19 · N calls por semana/lote (ex "abro 15 calls por semana; se abro mais, paro de operar o negócio")
- D20 · Preferência pra quem preencher primeiro (fila por ordem de chegada)

Beat 8 · Autoridade de OPERAÇÃO, não só ensino (3 slides)
- D21 · Você INVESTE em quem vai ao lado (frase-âncora da autoridade)
- D22 · Provas de operação (dezenas de milhões, a escola de gestão, faturamento de 8 dígitos, 1 funil, 12 pessoas)
- D23 · Contraste com guru de curso ("aplico em outros negócios, não é curso de vender curso")

Beat 9 · FILTRO ANTI-TIME-WASTER: as N barreiras (4 a 6 slides · EXPANDE conforme número de barreiras)
- D24 · "Vou dizer em voz alta quem NÃO deve aplicar"
- D25 · Barreira 1 (do campo D9 do plano)
- D26 · Barreira 2
- D27 · Barreira 3
- D28 · Barreira 4 (opcional)
- D29 · Barreira 5 (opcional)

Beat 10 · Garantia da CALL (2 slides)
- D30 · "Sem cartão, sem taxa, sem letra miúda"
- D31 · "Se não fizer sentido pra você OU pra gente, saímos amigos e você fica com o plano"

Beat 11 · A CONTA INVERTIDA (custo de NÃO agir, 2 slides)
- D32 · "Cada mês que você demora custa R$X em faturamento não capturado"
- D33 · "Uma call de 45min gratuita hoje comprime 12 meses de teste"

Beat 12 · LIBERA O FORMULÁRIO + 3 CTAs (4 slides)
- D34 · Link do formulário liberado (URL do formulário de APLICAÇÃO, não checkout)
- D35 · CTA GANHO (o que a pessoa leva se aplicar hoje, ex gravação da call + plano em X pontos)
- D36 · CTA LÓGICA (hoje ou fila de espera de N semanas)
- D37 · CTA MEDO (quem não aplica AGORA está dizendo pra si mesmo que o próximo trimestre também vai ser igual)

Beat 13 · Fecho por identidade + fé, apontando pra CALL (3 slides)
- D38 · "Eu quero me comprometer com quem tá comprometido"
- D39 · Identidade (quem escolhe a técnica sobre a força)
- D40 · "Te vejo na call" (despedida no auge)

### Fechamento no high_ticket (2 slides)

- F01 · Recap final do que a call é + N vagas + link do formulário
- F02 · Tela de agradecimento (link do formulário ainda visível)

### Regras de expansão no high_ticket

- Beat 9 · Filtro: cada barreira listada no D9 do plano vira 1 slide. Mínimo 3 barreiras, máximo 5. Total do beat 9: 4 a 6 slides (1 de abertura + N barreiras).
- Beat 5 · Frame: se o plano listar mais de 3 pontos do que a pessoa sai com, cada extra vira 1 slide adicional.
- Prova social: se o plano tiver depoimentos de clientes que passaram pela call, insere 1 depoimento antes de D19 (escassez) e 1 antes de D34 (libera formulário).

### Alvo de contagem no high_ticket (mesmo range global)

- Bloco A: 12 slides (10 fixos + 2 do modo)
- Bloco P: 30-40 slides (regra igual ao canônico)
- Bloco S: 41-61 slides (S02b + regra igual)
- Bloco D: 40 fixos + expansões de filtro/frame/prova = 45-60 slides
- Fecho: 2 slides
- Total: 129-175 slides (o range global 140-180 continua valendo; abaixo de 140 = pede pra reforçar barreiras ou peças)

### Regras duras extras (só valem no high_ticket)

- NUNCA revela o preço da mentoria/produto principal em NENHUMA NOTA do bloco D. Preço da mentoria fica pro Closer na call.
- NUNCA usa "checkout", "cakto", "carrinho", "12x", "à vista", "bônus dos 15 primeiros", "preço cheio riscado" nas NOTAS do bloco D. Substitui por "formulário", "aplicação", "call", "N vagas por semana".
- NUNCA usa "compra hoje", "leva agora" nos CTAs. Substitui por "aplica hoje", "preenche agora", "fila abre agora".
- Garantia é da CALL (tempo do lead), NÃO do produto (dinheiro).
- Escassez é SLOT do Closer, NÃO fast-action de bônus.

---



---

## REGRA DE EXPANSÃO P · Problema

Cada crença listada no plano vira 3-5 slides no deck real:

- Slide N+0 · Situação real do avatar (uma cena ou pergunta que ele reconhece)
- Slide N+1 · A crença que ele tem (a frase verbatim entre aspas, tipo "eu preciso de mais tempo pra começar")
- Slide N+2 · A prova de que a crença é falsa (dado, exemplo, contra-caso)
- Slide N+3 (opcional) · "Então o que fica na mesa é..." (a implicação)
- Slide N+4 (opcional) · Transição pra próxima crença

Ponto de expansão: os marcos P09/P10/P11 do esqueleto. Se o plano listar 4 crenças, adiciona P12-crença como novo bloco antes de P12-causa-raiz. Se listar 6 crenças, adiciona P12/P13/P14-crença.

Contagem esperada do bloco P no deck real: 30-40 slides.

---

## REGRA DE EXPANSÃO S · Solução

Cada peça do mecanismo listada no plano vira 4-6 slides no deck real:

- Slide N+0 · Nome da peça (tela quase vazia, só o nome)
- Slide N+1 · O que é (definição curta, 1 frase)
- Slide N+2 · Como funciona (diagrama, passo a passo, fluxo)
- Slide N+3 · Prova (case real, número, screenshot)
- Slide N+4 · O que essa peça gera (resultado tangível, o antes/depois)
- Slide N+5 (opcional) · Contra-exemplo (o que acontece SEM ela)

Ponto de expansão: os marcos S06/S07/S08/S09 do esqueleto. Se o plano listar 5 peças, adiciona S10-peça antes de S10-prova-racional.

Contagem esperada do bloco S no deck real: 40-60 slides.

---

## REGRA DE EXPANSÃO D · Decisão

Os 13 beats têm slides ÂNCORA fixos (listados no esqueleto). A expansão acontece em 2 lugares:

- Beat 8 · Stack: cada curso/módulo extra da prateleira listado no plano vira +1 slide (D24-extra). Se o plano tem 5 cursos na prateleira, o beat 8 tem 8 slides (D21-D28-stack) em vez de 6.
- Beat 5 · Urgência: se o plano lista mais de 3 fatos de mercado, cada um extra vira +1 slide.
- Prova social distribuída: se o plano tiver depoimentos por objeção, cada depoimento pode virar 1 slide inserido entre beats (ex: 1 depoimento antes de D18-ancoragem, 1 antes de D29-preço).

Contagem esperada do bloco D no deck real: 50-70 slides.

---

## Alvo de contagem final

- Bloco A: 10 slides (fixo)
- Bloco P: 30-40 slides
- Bloco S: 40-60 slides
- Bloco D: 50-70 slides
- Fecho: 2 slides
- Total: 140-180 slides

Se a contagem final ficar fora do range:

- < 140: o plano tem poucos ativos (poucas crenças, poucas peças). Não infla artificialmente. Reporta ao dono: "seu plano rendeu X slides, abaixo do mínimo 140; pra chegar lá, adiciona mais crenças a quebrar ou mais peças do mecanismo no plano; rodo de novo depois".
- > 180: o plano é muito denso. Reporta: "seu plano rendeu X slides, acima do máximo 180; posso comprimir cortando slides opcionais N+3/N+4 dos slots P e S; confirma?".

O esqueleto 82 é intocável. Compressão/expansão só nos slots elásticos.

---

## Formato de cada slide no output (padrão UMA-TELA-POR-BLOCO)

Cada slide sai no output assim, sem exceção:

    ==================================
    SLIDE 042 · [Bloco: S · Solução · Mecanismo peça 3 · slide N+2]
    ==================================

    TELA
      Título curto (1 frase, ≤7 palavras)
      Subtítulo/bullet único (opcional)

    IMAGEM
      Descrição do visual (ex: diagrama do funil AAA, foto do avatar,
      screenshot do WhatsApp com depoimento)

    NOTA (o que o dono FALA aqui, ~30-60s)
      Texto corrido da fala, cadência de fala real. Sem travessão.
      Sem clichê de palco (nada de "quem tá comigo", "toca aí"). Se a peça for do plano do
      dono, USA o verbatim dele; se for slot de fórmula, escreve a
      copy modelada pela persona Soft.

    RITMO
      Duração estimada: 45s
      Transição: [rápida / pausa / pergunta retórica / clique]

Regras da TELA:

- Carrega CONTEÚDO, nunca rótulo fino. Errado: "Introdução". Certo: os 4 itens da lista, o número, a frase-tese.
- 1 ideia por slide. Se tem lista, mostra a lista inteira (item por clique = animação DENTRO do slide, NÃO slide novo por item).
- Slide de virada/emoção: tela quase vazia, 1 frase de impacto.
- Slide de prova: tela densa, a densidade É a mensagem.

Regras da NOTA:

- É onde mora a COPY. Nunca deixa vazia.
- Fala real, não texto escrito. Frases curtas, ritmo humano.
- Passa pela soft-anti-ia: zero travessão, zero "trave", zero verbo genérico de transformação, zero frase-emoldura.
- Se a peça vem do plano do dono, cita o verbatim entre aspas quando fizer sentido.
- NÃO menciona duração da aula em nenhuma NOTA. Proibido "90 minutos", "1 hora", "nos próximos 60 min". Substitui por "até o fim" ou "hoje aqui".
- Preço, garantia, "15 primeiros" saem no output usando o VALOR REAL do plano do dono, nunca placeholder.

---

## Regras duras (checklist antes de entregar)

Se `modo=high_ticket`, todas as regras abaixo VALEM, MAIS as "Regras duras extras" da seção MODO HIGH TICKET (nada de preço da mentoria, nada de checkout, escassez é slot). O canônico segue como sempre.

- Contagem final entre 140 e 180 slides. Fora disso: reporta e para.
- Esqueleto 82 presente e na ordem. Nenhum marco pulado.
- Toda NOTA passou pelo anti-IA (sem travessão, sem clichê).
- Nenhuma menção a duração da aula em nenhuma NOTA.
- Preço/garantia/bônus usam VALOR REAL do plano do dono.
- Nomes próprios (do mecanismo, do produto, dos módulos) vêm do plano, nunca inventados.
- Cada slot elástico P/S tem 3-5 (P) ou 4-6 (S) slides conforme regra.
- Output tem BOM UTF-8 (rodou ensure-bom-utf8.sh no final).
- Output segue DOUTRINA-MD-TELEGRAM: sem ##, sem **bold**, sem tabela pipe, bullets com · ou -, moldura ==== ou ━━━.

---

## Output final (o que sai no disco)

Arquivo: /home/cloud/entregas/webinar-script-<slug>.md

Estrutura interna:

    ━━━━━━━━━━━━━━━━━━━━━━━━━━
    WEBINÁRIO · <NOME DO PRODUTO>
    Roteiro APSD + Deck · gerado <data>
    Slug: <slug> · Slides: <N total>
    ━━━━━━━━━━━━━━━━━━━━━━━━━━

    ▸ SUMÁRIO
      A · Atenção: slides 001-010 (10 slides)
      P · Problema: slides 011-<x> (<x-10> slides)
      S · Solução: slides <x+1>-<y> (<y-x> slides)
      D · Decisão: slides <y+1>-<z> (<z-y> slides)
      F · Fechamento: slides <z+1>-<z+2> (2 slides)
      TOTAL: <N> slides

    ━━━━━━━━━━━━━━━━━━━━━━━━━━
    A · ATENÇÃO
    ━━━━━━━━━━━━━━━━━━━━━━━━━━

    ==================================
    SLIDE 001 · [Bloco: A · Atenção · Boas-vindas]
    ==================================

    TELA
      ...

    IMAGEM
      ...

    NOTA
      ...

    RITMO
      ...

    (repete pra todos os 82+ slides)

---

## Próximos passos (o que vem DEPOIS desta skill)

Esta skill entrega ROTEIRO + DECK em .md. Pra fechar o pacote do webinário:

- Renderizar o .pptx/Keynote real (com layout, cor, tipografia): chama a skill soft-webinar-slides.
- Escrever as páginas orbitais (cadastro, obrigado, checkout): chama soft-webinar-paginas.
- Escrever a sequência de WhatsApp/e-mail (antes/durante/depois): chama soft-webinar-mensagens.
- Simular o chat do webinar (perpétuo ou ao vivo): chama soft-webinar-chat.

Nenhuma dessas foi tocada por esta skill; continuam funcionando como estavam.

---

## Fontes que esta skill lê antes de gerar

- /home/cloud/entregas/webinar-plano-<slug>.md (o plano do dono, obrigatório; contem o campo `modo`)
- /home/cloud/.openclaw/brain/conteudo/aula-webinar-AAA-HIGH-TICKET.md (variação high_ticket - §1e reescreve os 13 D beats; carregar SÓ se `modo=high_ticket`)
- /home/cloud/.openclaw/brain/conteudo/WEBINARIOS-PERPETUOS-OFICIAL-mapa-mental.md (mapa canônico APSD + 13 beats)
- /home/cloud/.openclaw/brain/DOUTRINA-MD-TELEGRAM.md (formato do output)
- references/SLIDE-MODELO-SCRIPT.md (o slide-modelo do autor, o "slide cru")
- references/slides-estrategicos-canonicos.md (os 4 deltas: re-ancoragem, condição×visão, armadilha 1-por-slide, contas em projeção)
- references/estrutura-real-webinar.md (fonte fundo da estrutura, quando precisar de detalhe de beat)
