---
name: soft-webinar-plano
description: "Q&A GUIADO que constrói o PLANO do webinário Soft (mapa mental preenchido) perguntando ao usuário UMA pergunta por vez, bloco por bloco na ordem canônica APSD (Atenção · Problema · Solução · Decisão com os 13 beats do PITCH). Retomável: salva estado em /tmp a cada resposta; se o usuário chamar de novo, oferece retomar de onde parou. Aceita resposta em texto OU áudio (o Telegram transcreve antes; a skill só recebe texto). Output final: /home/cloud/entregas/webinar-plano-<slug>.md convertido pra Google Doc via gog. É o PASSO 1 do pipeline: alimenta soft-webinar-script (roteiro/deck). Suporta 2 MODOS: canônico (fecha no checkout, ticket ate ~R$3k) e high_ticket (fecha em call/aplicação, ticket 3k+, modelo André Menezes; fonte da variação em brain/conteudo/aula-webinar-AAA-HIGH-TICKET.md). Pergunta o modo na PRIMEIRA pergunta (M0) e ramifica o roteiro. Âncora: planejar o webinar = plano (esta skill); escrever roteiro/deck = soft-webinar-script; páginas/anúncios = soft-webinar-paginas; carta/VSL = soft-funil-carta."
---

# soft-webinar-plano · Q&A guiado retomável

## O que esta skill faz
Constrói o PLANO do webinário Soft do usuário como um mapa mental preenchido, feito por CONVERSA: uma pergunta por vez, respondida por texto ou áudio (o Telegram já transcreve o áudio antes de chegar aqui, então você só lida com texto).

Segue a espinha canônica APSD + os 13 beats do PITCH (fonte: `~/agente-soft/brain/conteudo/WEBINARIOS-PERPETUOS-OFICIAL-mapa-mental.md`). Cada nó folha do mapa vira uma pergunta.

Salva estado em `/tmp/webinar-plano-<slug>-<epoch>.json` a cada resposta. Se o usuário chamar a skill de novo com o mesmo slug, DETECTA o arquivo mais recente e oferece retomar.

Output final: `/home/cloud/entregas/webinar-plano-<slug>.md` + Google Doc via `gog drive upload --convert`.

## Quando usar
- Usuário quer estruturar o webinário dele do zero.
- Ele tem os ingredientes soltos (avatar, promessa, oferta) mas não empacotou.
- É o passo 1 do pipeline. A saída alimenta `soft-webinar-script`.

## Quando NÃO usar
- Roteiro/deck do webinar -> `soft-webinar-script`.
- Páginas de cadastro/obrigado/checkout -> `soft-webinar-paginas`.
- Carta/VSL -> `soft-funil-carta`.
- Venda 1:1 -> `soft-vendas-closer`.
- Posicionamento base (se falta plano de posicionamento, aponta pra `soft-plano-posicionamento` ANTES).

## Como opera (o loop de Q&A)

1. Cumprimenta em UMA linha. Pergunta o SLUG do webinar (ex: `sio-ia`, `coach-emagrecimento`, `advogada-familia`). Slug é kebab-case curto, é o que identifica esse plano.

2. Roda `ls /tmp/webinar-plano-<slug>-*.json 2>/dev/null | sort | tail -1` pra checar se existe estado anterior.
   - Se existir: mostra a data do último salvamento e o bloco/pergunta onde parou. Pergunta: `Retomar de onde parou (R) ou começar do zero (Z)?`
   - Se não existir OU o usuário disser Z: cria novo estado com `epoch = date +%s`.

3. Cria/carrega o arquivo de estado JSON (formato abaixo).

4. Percorre o ROTEIRO DE PERGUNTAS (seção abaixo) NA ORDEM EXATA, fazendo UMA pergunta por vez. Formato do turno:

   ```
   Bloco X · <Nome do bloco>
   Pergunta N/34: <texto da pergunta>
   (dica curta se ajudar, ex: "1 frase", "3 provas", "só o nome")
   ```

5. Após cada resposta:
   - Se a resposta for `PULAR` ou `NÃO SEI`: grava como `[A CONFIRMAR]` e avança.
   - Se a resposta for rasa (menos de 3 palavras num campo que pede substância): refaz a pergunta com UM exemplo curto do nicho do usuário, pede de novo.
   - Grava no `answers` do JSON, atualiza `current_block` / `current_question`, atualiza `last_updated`.
   - AVANÇA pra próxima pergunta. Sem "vamos pra próxima" - só a próxima pergunta.

6. A cada 5 perguntas respondidas: mostra 1 linha de progresso (ex: `Progresso: 18/34`).

7. No FIM do roteiro:
   - Preenche o TEMPLATE do output (seção abaixo) com as respostas.
   - Salva em `/home/cloud/entregas/webinar-plano-<slug>.md` (cria a pasta se não existir).
   - Roda o upload pro Drive (comando pronto abaixo).
   - Devolve pro usuário: URL do Doc (crua, sem markdown) + 1 linha `pronto, plano em N perguntas, agora chama soft-webinar-script pra virar roteiro`.

## Regras duras do loop

- UMA pergunta por vez. Muro de texto = viola. Se você mandar 3 perguntas juntas, refaz.
- Sem inventar resposta pelo usuário. Se ele der resposta rasa, refaz com exemplo.
- Sem sugerir preço, garantia, "15 primeiros", stack. Tudo isso o USUÁRIO responde. No template final, se ele não deu, entra como `<< troque pelo seu >>`.
- Aceita texto E áudio (o Telegram transcreve o áudio antes; aqui já chega texto).
- Zero travessão longo. Zero jargão IA. Zero "empurra pra frente/aprofundar".
- Se o usuário mandar `SAIR` ou `PAUSAR`: salva estado, responde `salvo, chama a skill de novo com o slug <slug> pra retomar`.

## Roteiro de perguntas (ordem canônica APSD + 13 beats do D)

Fonte: `brain/conteudo/WEBINARIOS-PERPETUOS-OFICIAL-mapa-mental.md`. Cada nó folha do mapa vira uma pergunta abaixo. Total: 34 perguntas.

### Bloco 0 · MODO (a primeira pergunta) - 1 pergunta

- M0. MODO deste webinar: `canonico` (fecha venda no checkout, ticket ate ~R$3k) ou `high_ticket` (fecha em call/aplicacao com SDR/Closer, ticket 3k+)?
  (dica: canonico = webinar Soft tradicional; high_ticket = modelo Andre Menezes de vender uma "Call de Arquitetura" gratuita que qualifica pra call com Closer. Fonte: `brain/conteudo/aula-webinar-AAA-HIGH-TICKET.md`. Se a pessoa nao sabe: default canonico e segue.)

Se M0 = high_ticket, o loop ativa as perguntas extras A7, A8, S7, M5 e usa os beats D da secao "Overrides HIGH TICKET" abaixo. Se M0 = canonico, ignora as perguntas marcadas "SO se modo=high_ticket" e usa os 13 beats D como estao.

### Bloco A · ATENÇÃO (abertura) - 6 perguntas fixas + 2 se modo=high_ticket

- A1. Como você se apresenta em UMA frase curta (nome + posicionamento)?
  (dica: ex "[seu nome], gerenciei dezenas de milhões, CRO da escola de gestão")

- A2. Qual é a PROMESSA CENTRAL que você fala cedo na aula, em 1 frase concreta (número + prazo + sem o quê)?
  (dica: ex "R$100k/mês no automático, sem postar feito louco, sem aparecer")

- A3. Qual a PREMISSA CHOCANTE que quebra o padrão logo no começo?
  (dica: 1 frase que contradiz o que o mercado prega. ex "viralização não tem nada a ver com venda")

- A4. Qual o NOME da sua categoria/USP dita cedo (o nome do "melhor X do mundo")?
  (dica: ex "Funil de Aula Agendada Automática, o melhor funil do mundo")

- A5. Liste os 5 GANCHOS (o que a pessoa vai descobrir na aula), 1 por linha.
  (dica: são 5 curiosidades sem entregar a resposta)

- A6. Qual o ONE BELIEF que você planta no começo (a única crença-mãe da aula)?
  (dica: ex "para de espalhar, concentra")

- A7. (SÓ se modo=high_ticket) CONTRATO DE AUDIÊNCIA declarado cedo: quem tá na sala hoje, quem NÃO tá. 2 a 3 frases.
  (dica: ex "essa aula é pra especialista que já vende, tem método próprio e o próximo passo é escalar sem virar padaria; se você tá começando, fica pelo conteúdo, o convite do fim NÃO é pra você agora")

- A8. (SÓ se modo=high_ticket) ANTI-DIY frame plantado cedo: 1 frase que abre a porta do custo alto sem soar vendedor.
  (dica: ex "o especialista bom quebra na hora de escalar porque investe em curso, tráfego e designer, e não investe em ter alguém do lado que já fez; o DIY custa 12 meses, a estrutura com você comprime pra 90 dias")

### Bloco P · PROBLEMA (diagnóstico) - 5 perguntas

- P1. Qual o MAPA EXTERNO que ninguém mostra (a virada de percepção do mercado)?
  (dica: ex "180 padarias, conteúdo não diferencia mais")

- P2. Qual a INJUSTIÇA filosófica (a dor de quem entrega valor e não é visto)?
  (dica: ex "tem gente pior vendendo mais porque foi vista")

- P3. Qual a CENA INTERNA do refém (o dia ruim, o papel que virou)?
  (dica: ex "social media de si mesmo, editor, vendedor, atendente - emprego que não paga hora extra")

- P4. Liste 3 a 5 CANAIS/CAMINHOS que a pessoa já tentou, cada um com o ÔNUS REAL.
  (formato: nome do caminho · o ônus. ex "Lançamento · meses de conteúdo, tô rico/tô pobre, cabelo branco")

- P5. Qual a EQUAÇÃO DA CAUSA-RAIZ (a fórmula que explica por que não funciona) + quem é o INIMIGO nomeado?
  (dica: ex causa "Complexidade + Improviso = Imprevisibilidade" · inimigo "mercado que lucra te vendendo mais tática")

### Bloco S · SOLUÇÃO (mecanismo, termina no EU QUERO ou QUERO CONVERSAR se high_ticket) - 6 perguntas fixas + 1 se modo=high_ticket

- S1. Qual o PRÁTICO que já é ouro (o método/reorganização em 3-4 passos)?
  (dica: ex "Reorganização da Percepção: Atenção, Diagnóstico, Mecanismo, Ação")

- S2. Qual o NOME da nova oportunidade + a promessa dela em 1 frase?
  (dica: ex "Funil de Aula Agendada Automática - a aula que faz a RP inteira sozinha, 24h")

- S3. Qual o FUNDAMENTO (a virada conceitual, ex "educar não vende, conduzir vende")?

- S4. Qual a PROVA RACIONAL (a matriz/comparação que mostra por que teu método pega o melhor de cada mundo sem o ônus)?
  (dica: cite 2-3 dimensões concretas. ex "escassez do lançamento + automático do perpétuo + consultivo do high-ticket")

- S5. Qual a VIRADA-CHAVE que redefine quem é lead quente pra tua tese?
  (dica: ex "lead quente = quem viu a OFERTA, não quem te viu")

- S6. Quais os MÓDULOS do produto como CAMINHO (só o QUÊ e o PORQUÊ de cada, sem o COMO)?
  (formato: 1 linha por módulo. mínimo 3, máximo 7)

- S7. (SÓ se modo=high_ticket) NOME DO PRODUTO HIGH TICKET (a implementação que vem depois da call, no seu negócio). Qual nome VOCÊ dá pra ele? Escreve o nome que quer usar. Exemplos que já rodam por aí (só pra referência, não copia): Consultoria, Mentoria, Mesa de Operação, Célula, Implementação, Programa. Você escolhe.

### Bloco D · DECISÃO (13 beats do PITCH, na ordem da fala) - 13 perguntas

> IMPORTANTE: se modo=high_ticket, os 13 beats abaixo NÃO valem como estão. O canônico vende no checkout; o high_ticket vende a CALL / APLICAÇÃO. Use os beats reescritos na seção "Overrides HIGH TICKET" logo depois do Bloco D. As perguntas D1 a D13 continuam sendo feitas na mesma ordem, mas com o TEXTO reformulado indicado nos Overrides. Fonte: `brain/conteudo/aula-webinar-AAA-HIGH-TICKET.md` §1e (13 beats afiados com verbatim do André Menezes).

- D1. Beat 1 · PONTE DA SEMENTE. Qual a frase que resgata o convite plantado no A e amarra com o one belief?
  (dica: ex "lembra que eu falei que tinha um convite? é agora. e lembra do para de espalhar? é hoje que você concentra")

- D2. Beat 2 · YES-LADDER + EU QUERO. Como você recapitula o aprendizado e pede o compromisso público antes do preço?
  (dica: ex "digita EU QUERO no chat se você entendeu que...")

- D3. Beat 3 · OS 2 CAMINHOS. Descreva o caminho 1 (sozinho) e o caminho 2 (comigo), em 2 frases.

- D4. Beat 4 · REVELAÇÃO DO PRODUTO + PUV. Qual o NOME OFICIAL do produto + a PUV em 1 frase (o único X que faz Y usando Z)?

- D5. Beat 5 · URGÊNCIA HONESTA. Quais as 3 COISAS que estão acontecendo AGORA no mercado e justificam agir hoje?
  (dica: 1 linha por coisa)

- D6. Beat 6 · POR QUE SOU DIFERENTE de quem só vende curso? (2-3 frases; ex "comprei tudo que existe, sei o que falta" · "aplico em outros nichos, não é curso de vender curso")

- D7. Beat 7 · ANCORAGEM POR DEGRAUS. Liste 3 preços de referência REAIS em ordem decrescente (do contrato/mentoria alta -> o treinamento sozinho).
  (formato: R$X - o que é. ex "R$328k - contrato CRO" / "R$15k - mentoria 1:1" / "R$3.500 - o treinamento sozinho")

- D8. Beat 8 · STACK ITEM A ITEM. Liste os itens do stack com preço de referência real, marcando NÚCLEO / CURSO-PRATELEIRA / BÔNUS. Some no final.
  (formato: nome · classe · R$X. dica: bônus não tem preço, vale como "sem preço")

- D9. Beat 9 · GARANTIA. Qual a garantia? Prazo, condição, e o gatilho de "risco zero" (ex "aplica 90d, se não deu +90d de consultoria; se ainda não deu, devolvo em dobro").
  (se não tiver garantia definida, marca "<< troque pelo seu >>")

- D10. Beat 10 · QUEDA EM DEGRAUS ATÉ O PREÇO FINAL. Preço normal -> 1º corte (hoje) -> "o combinado" (2º corte) -> parcela final + bônus dos N primeiros.
  (formato: 12x R$X ou R$Y à vista. se não tiver os N primeiros ainda, marca "<< troque pelo seu >>")

- D11. Beat 11 · REDUÇÃO AO RIDÍCULO. Divide o preço à vista por 30 dias/dia = R$X/dia. Escreva a comparação (ex "menos que uma Coca, um iFood por mês").

- D12. Beat 12 · OS 3 CTAs em ordem. Escreva os 3, cada um em 1 frase.
  - CTA ganho (o que leva se entrar hoje): __
  - CTA lógica (a condição de hoje vs visão de 12 meses): __
  - CTA medo (o melhor momento nunca chega): __

- D13. Beat 13 · FECHO POR IDENTIDADE + FÉ. Qual a frase-selo do fecho e a identidade que você chama (ex "te vejo do outro lado - quem escolhe a técnica sobre a força")?

### Bloco extra · METADADOS - 4 perguntas fixas + 1 se modo=high_ticket

- M1. FORMATO: perpétuo ou ao vivo? Duração alvo (60/90/120 min)?

- M2. META de faturamento/mês desse webinar (número real): R$ __

- M3. CHECKOUT/plataforma + WhatsApp comercial: __

- M4. PROVAS externas (link da pasta de prints/depoimentos, se tiver): __

- M5. (SÓ se modo=high_ticket) NAMING DA CALL: qual nome VOCÊ vai dar pra reunião que a pessoa aplica pra ganhar? Escreve o nome que quer usar. Exemplos que já rodam por aí (só pra referência, não copia): Sessão Estratégica, Reunião de Diagnóstico, Consulta de Qualificação, Call de Arquitetura, Mapa da Rota. Você escolhe.

Total: 34 perguntas no canônico (6A + 5P + 6S + 13D + 4 metadados). No high_ticket, 38 perguntas (adiciona A7, A8, S7, M5) e os 13 beats D usam o texto reescrito da seção Overrides HIGH TICKET abaixo.

### Overrides HIGH TICKET (só ativa se M0=high_ticket)

Os 13 beats D são REESCRITOS. As perguntas continuam sendo D1..D13, mas o TEXTO da pergunta muda pro que está abaixo. Fonte-mãe: `brain/conteudo/aula-webinar-AAA-HIGH-TICKET.md` §1e.

- D1 (high_ticket). Beat 1 · PONTE DA SEMENTE + CONCENTRAÇÃO. Frase que resgata o convite plantado no A e amarra com o one belief, apontando pra call.
  (dica: ex "lembra do convite? é agora. e lembra do para de espalhar? concentra é sair do 1:1 correndo pra ter estrutura que roda")

- D2 (high_ticket). Beat 2 · YES-LADDER, "QUERO CONVERSAR" no chat. Como você recapitula o aprendizado e pede o compromisso público de INTERESSE (não de compra)?
  (dica: ex "quem aqui quer parar de operar no improviso e quer sentar comigo pra desenhar a rota do próximo patamar, escreve QUERO CONVERSAR")

- D3 (high_ticket). Beat 3 · OS 2 CAMINHOS, DIY ou com a gente. Descreva Caminho 1 (mapa sozinho, 6-12 meses de teste) e Caminho 2 (agenda a call, avaliação de encaixe, se caber a gente entra junto). Peça pra digitar "2".

- D4 (high_ticket). Beat 4 · REVELAÇÃO DO PRODUTO (a CALL) + PUV, SEM preço da mentoria aqui. Qual o NOME da call (M5) e a PUV em 1 frase?
  (dica: ex "a única call de X minutos que faz Y usando Z sem W"; NUNCA revela o preço da mentoria neste beat, fica pro Closer)

- D5 (high_ticket). Beat 5 · FRAME do que a CALL É (entregável concreto): duração, quem atende, o que a pessoa sai com.
  (dica: ex "45min comigo ou com um estrategista do time, olhando teu funil, ticket, tráfego e rotina; você sai com 3 gargalos e o próximo passo pra cada um, comprando ou não")

- D6 (high_ticket). Beat 6 · ANCORAGEM SEM PREÇO do produto principal (âncora ALTA na call, sem CTA de compra). Qual o preço-referência real da call na esteira e o argumento de "hoje é gratuita porque a gente precisa qualificar antes"?
  (dica: modelo André = R$1.497; o dono escolhe entre R$1.500 e R$2.500 recomendado)

- D7 (high_ticket). Beat 7 · ESCASSEZ HONESTA por SLOT do Closer (não desconto). Quantas calls por semana/lote você abre e por quê? Adiciona regra "preferência pra quem preencher primeiro".
  (dica: ex "abro 15 calls por semana; se abro mais eu paro de operar o negócio; todo mundo entra pra leitura, mas a fila é por ordem de chegada")

- D8 (high_ticket). Beat 8 · POR QUE VOCÊ é a pessoa (autoridade de quem OPERA, não só ensina). Frase que diferencia você de guru de curso, usando a prova de operação.
  (dica: ex "eu invisto em quem vai ao lado, invisto em ferramenta, invisto em time; é por isso que geri dezenas de milhões e a escola de gestão fez 8 dígitos em 2 anos com 12 pessoas e 1 funil")

- D9 (high_ticket). Beat 9 · FILTRO ANTI-TIME-WASTER: as N barreiras ditas EM VOZ ALTA. Liste as barreiras (mínimo 3, máximo 5) - cada uma numa linha, explícito quem NÃO deve aplicar.
  (dica: modelo o dono em 4 barreiras: (1) sem produto/serviço validado (menos de R$30k nos últimos 90d) NÃO aplica; (2) buscando "renda extra" NÃO aplica; (3) esperando mágica em 30 dias NÃO aplica; (4) sem verba pra investir no NEGÓCIO nos próximos 12 meses NÃO aplica)

- D10 (high_ticket). Beat 10 · GARANTIA da CALL, não do produto. Frase que tira o risco da call (sem cartão, sem taxa, sem letra miúda).
  (dica: ex "sem cartão, sem taxa, sem letra miúda; se não fizer sentido pra você OU pra gente, saímos amigos e você fica com o plano - é a nossa garantia de que teu tempo não é perdido")

- D11 (high_ticket). Beat 11 · A CONTA INVERTIDA (custo de NÃO agir, não redução ao ridículo). Frase que quantifica o custo do imobilismo.
  (dica: ex "cada mês que você demora custa R$X em faturamento não capturado; uma call de 45min gratuita hoje pode comprimir 12 meses de teste")

- D12 (high_ticket). Beat 12 · LIBERA O FORMULÁRIO e os 3 CTAs em ordem (ganho, lógica, medo), apontando pro formulário de APLICAÇÃO, não pro checkout.
  - CTA ganho: o que a pessoa leva se aplicar hoje (ex "a gravação da call + o plano em X pontos, tenha comprado ou não")
  - CTA lógica: hoje ou fila de espera de N semanas
  - CTA medo: quem não aplica AGORA está dizendo pra si mesmo que o próximo trimestre também vai ser igual

- D13 (high_ticket). Beat 13 · FECHO POR IDENTIDADE + FÉ, apontando pra call.
  (dica: ex "te vejo na call, quem escolhe a técnica sobre a força")

Regras do modo high_ticket (o loop respeita):
- Preço da MENTORIA não é perguntado nesta skill (fica pro Closer revelar na call). Só o preço-ÂNCORA da call é registrado (D6).
- Stack, garantia do produto, queda em degraus até o preço final e redução ao ridículo (beats 7, 8, 9, 10, 11 do canônico) NÃO valem no high_ticket. Não peça D8/D9/D10/D11 no formato canônico se M0=high_ticket - use as versões acima.
- O output final substitui a seção "Beat 8 · Stack", "Beat 10 · Queda em degraus" etc. pelos títulos high_ticket correspondentes (ver template).


## Formato do arquivo de estado

Path: `/tmp/webinar-plano-<slug>-<epoch>.json`

```json
{
  "slug": "sio-ia",
  "modo": "canonico",
  "started_at": "2026-07-21T23:00:00-03:00",
  "last_updated": "2026-07-21T23:14:22-03:00",
  "current_block": "D",
  "current_question": "D5",
  "total_questions": 34,
  "answered_count": 17,
  "answers": {
    "M0": "canonico",
    "A1": "[seu nome], gerenciei dezenas de milhões, CRO da escola de gestão",
    "A2": "...",
    "P1": "[A CONFIRMAR]",
    "D8": "..."
  }
}
```

Regras:
- CADA resposta grava no `answers` com a chave da pergunta (A1..A6, P1..P5, S1..S6, D1..D13, M1..M4).
- `last_updated` atualizado a cada gravação.
- Resposta `PULAR` ou `NÃO SEI` grava `[A CONFIRMAR]`.
- Retomada: lê o JSON mais recente do slug, pega `current_question`, faz a pergunta seguinte.
- Campo `modo` grava a resposta de M0 (`canonico` ou `high_ticket`). Todo comportamento condicional do roteiro/output lê esse campo.
- Se `modo=high_ticket`, `total_questions=38` e as chaves extras A7, A8, S7, M5 aparecem em `answers`.
- Chaves D1..D13 gravam a resposta seja qual for o modo (o TEXTO da pergunta é que muda, a chave não).

## Template do output final

Path: `/home/cloud/entregas/webinar-plano-<slug>.md`

Segue a ESPINHA do `brain/conteudo/WEBINARIOS-PERPETUOS-OFICIAL-mapa-mental.md`, preenchida com as respostas. Formato (linha 70 chars max, sem `##`, sem `**bold**`, sem pipe, sem travessão longo - segue `DOUTRINA-MD-TELEGRAM.md`):

```
====================================
PLANO WEBINAR · <slug em CAIXA ALTA>
====================================

Modo: <M0: canonico | high_ticket>
Preenchido em: <data>
Total de respostas: <N> de <34 canonico | 38 high_ticket>
Faltando: <lista de [A CONFIRMAR]>

------------------------------------
A · ATENÇÃO
------------------------------------

Apresentação
  <A1>

Promessa central
  <A2>

Premissa chocante
  <A3>

USP / categoria
  <A4>

5 Ganchos
  · <A5.1>
  · <A5.2>
  · <A5.3>
  · <A5.4>
  · <A5.5>

One belief
  <A6>

Contrato de audiência (só high_ticket)
  <A7>

Anti-DIY frame (só high_ticket)
  <A8>

------------------------------------
P · PROBLEMA
------------------------------------

Mapa externo
  <P1>

Injustiça filosófica
  <P2>

Cena interna do refém
  <P3>

Autópsia dos caminhos
  · <P4 item 1>
  · <P4 item 2>
  ...

Causa-raiz + inimigo
  Equação: <P5 equação>
  Inimigo: <P5 inimigo>

------------------------------------
S · SOLUÇÃO
------------------------------------

Prático que já é ouro
  <S1>

Nova oportunidade nomeada
  <S2>

Fundamento
  <S3>

Prova racional / matriz
  <S4>

Virada-chave
  <S5>

Módulos como caminho
  · <S6 módulo 1>
  · <S6 módulo 2>
  ...

Nome da Mesa / Célula (só high_ticket)
  <S7>

------------------------------------
D · DECISÃO (13 beats do PITCH)
------------------------------------

Beat 1 · Ponte da semente
  <D1>

Beat 2 · Yes-ladder + EU QUERO
  <D2>

Beat 3 · Os 2 caminhos
  Sozinho: <D3.1>
  Comigo:  <D3.2>

Beat 4 · Revelação do produto + PUV
  canonico:
    Nome: <D4 nome do produto>
    PUV:  <D4 puv>
  high_ticket:
    Nome da CALL (M5): <M5>
    PUV:  <D4 puv da call>
    (o preço da mentoria NÃO entra aqui, fica pro Closer)

Beat 5 · Urgência honesta (canonico)  |  Frame do entregável da call (high_ticket)
  canonico:
    · <D5.1>
    · <D5.2>
    · <D5.3>
  high_ticket:
    <D5 duração + quem atende + o que a pessoa sai com>

Beat 6 · Por que sou diferente (canonico)  |  Ancoragem sem preço (high_ticket)
  canonico:
    <D6>
  high_ticket:
    <D6 preço-âncora da call (ex R$1.500) + "hoje é gratuita porque qualificamos antes">

Beat 7 · Ancoragem por degraus (canonico)  |  Escassez honesta por slot (high_ticket)
  canonico:
    · <D7.1>
    · <D7.2>
    · <D7.3>
  high_ticket:
    <D7 N calls por lote + preferência pra quem preencher primeiro>

Beat 8 · Stack item a item  (canonico)  |  Autoridade de operação  (high_ticket)
  canonico:
    · <D8 item 1> · <classe> · R$<preço>
    · <D8 item 2> · <classe> · R$<preço>
    ...
    Soma riscada: R$<total>
    << troque pelo seu se não tiver ainda >>
  high_ticket:
    <D8 frase de autoridade de quem OPERA, não só ensina>

Beat 9 · Garantia (canonico)  |  Filtro anti-time-waster (high_ticket)
  canonico:
    <D9>
    << troque pelo seu se não tiver ainda >>
  high_ticket:
    Barreiras ditas em voz alta:
      · <D9 barreira 1>
      · <D9 barreira 2>
      · <D9 barreira 3>
      · <D9 barreira 4 (opcional)>

Beat 10 · Queda em degraus até o preço final (canonico)  |  Garantia da call (high_ticket)
  canonico:
    Preço normal: R$<x>
    1º corte (hoje): R$<y>
    O combinado (2º corte): R$<z>
    Final: 12x R$<parcela> ou R$<vista> à vista
    Bônus dos N primeiros: << troque pelo seu >>
  high_ticket:
    <D10 garantia da call (sem cartão, sem taxa, sem letra miúda)>

Beat 11 · Redução ao ridículo (canonico)  |  Conta invertida (high_ticket)
  canonico:
    <D11>
  high_ticket:
    <D11 custo de não agir, quantificado>

Beat 12 · Os 3 CTAs em ordem
  (canonico aponta pro checkout; high_ticket aponta pro FORMULÁRIO DE APLICAÇÃO)
  CTA ganho:  <D12.1>
  CTA lógica: <D12.2>
  CTA medo:   <D12.3>

Beat 13 · Fecho por identidade
  <D13>

------------------------------------
METADADOS
------------------------------------

Formato / duração
  <M1>

Meta de faturamento/mês
  <M2>

Checkout + WhatsApp
  <M3>

Prova externa (link)
  <M4>

Naming da call (só high_ticket)
  <M5>

------------------------------------
[A CONFIRMAR]
------------------------------------

<lista das perguntas que ficaram como [A CONFIRMAR]>

------------------------------------
PRÓXIMO PASSO
------------------------------------

Este plano é o insumo do roteiro/deck.
Chame: soft-webinar-script com este arquivo.
```

Regras do template:
- Preços, garantia, "N primeiros" que o usuário NÃO respondeu = `<< troque pelo seu >>`.
- NUNCA hardcode "R$1.497", "R$5,16/dia", "15 primeiros" etc. Esses são exemplos do MOLDE, não valores fixos.
- Se um bloco tem `[A CONFIRMAR]` maioria: lista no fim + aponta pra rodar `soft-plano-posicionamento` OU minerar 5-8 falas antes do roteiro.

## Upload pro Drive (após salvar o md)

Comando pronto (roda no shell, não é código dentro da skill):

```
mkdir -p /home/cloud/entregas
set -a && source ~/.openclaw/.env && set +a
~/agente-soft/workers/ensure-bom-utf8.sh /home/cloud/entregas/webinar-plano-<slug>.md
gog drive upload /home/cloud/entregas/webinar-plano-<slug>.md --convert --title "Plano Webinar · <slug>"
```

O `gog` devolve a URL do Doc. Manda pro usuário CRUA, uma URL por linha, sem `[texto](url)`:

```
Pronto, plano gerado com <N>/34 respostas.
Doc:
https://docs.google.com/document/d/<id>

Próximo passo: chama soft-webinar-script com esse plano.
```

## Regras duras (repetindo, pra não esquecer)

- UMA pergunta por vez. Muro de texto reprova.
- Sem inventar. Resposta rasa -> refaz com exemplo. `PULAR`/`NÃO SEI` -> `[A CONFIRMAR]`.
- Preço/garantia/N primeiros no output com `<< troque pelo seu >>` se o usuário não deu.
- Zero travessão longo. Zero jargão IA. Zero "empurra pra frente/aprofundar".
- Estado salvo a cada resposta em `/tmp/webinar-plano-<slug>-<epoch>.json`.
- Retomada: detecta arquivo mais recente do slug, oferece retomar OU começar do zero.
- Output final SEMPRE em `/home/cloud/entregas/webinar-plano-<slug>.md` + Google Doc via `gog`.
- Copy que vai pro público (dentro do plano) passa depois pela `soft-anti-ia`; esta skill só coleta.
- Formato do .md segue `DOUTRINA-MD-TELEGRAM.md` (moldura ====, subseção ------, bullets ·, quebra 70 chars, BOM UTF-8).

## Referências no diretório
- `references/modelo-preenchivel.md` - modo AUTOATENDIMENTO alternativo (usuário preenche sozinho num formulário só; use se o usuário pedir "manda o modelo pra eu preencher").
- `references/analise-webinario-existente.md` - modo AUDITORIA se o usuário já tem webinar e quer refinar.
- `references/estrutura-real-webinar.md` - profundidade do APSD.
- `references/desenho-e-empacotamento-da-oferta.md` - profundidade da oferta/stack (usa quando o usuário pedir aprofundar Beat 8).
- `references/ancoragem-e-fechamento.md` - profundidade dos beats 7-13 se pedir.
- `brain/conteudo/WEBINARIOS-PERPETUOS-OFICIAL-mapa-mental.md` - a ESPINHA canônica desta skill.
