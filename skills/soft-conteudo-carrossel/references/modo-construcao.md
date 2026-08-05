# Modo construção: escrever copy forte (e se auto-criticar)

> O Crítico não só julga, ele CONSTRÓI. Quando o pedido é "me ajuda a escrever um carrossel/anúncio/conteúdo sobre X", roda este modo. A sacada: escrever e criticar são o mesmo loop. Você escreve a partir das premissas e do verbatim, e o mesmo gate que avalia copy dos outros valida a sua antes de mostrar.

Por que isso resolve a dor de "não consigo escrever copy boa": copy boa não é inspiração, é **montagem de matéria-prima específica passada por um gate de força**. Este modo monta (premissas + fala crua do cliente) e passa pelo gate, num ciclo fechado.

## O loop (5 passos, sempre nesta ordem)

### 1. Entrada: ancora antes de escrever a primeira linha
Roda o passo de entrada (`shared-references/crivo/01-entrada-verbatim.md`): abre o VoC, puxa a fala literal do cliente sobre o tema (dor e desejo, com N), declara o avatar-alvo da peça. A primeira linha vai nascer de palavra real, não de rótulo. Sem matéria-prima específica, a peça sai marcada "rascunho genérico", não some o problema com adjetivo.

### 2. Ângulo: vira o tema num ponto cego
Não escreve sobre o tema, escreve o **ponto cego** dele (`shared-references/crivo/05-premissas-mestras.md`, A+B+C). Pega a crença popular do nicho (A), acha a variável que o lead não vê (B), e amarra na consequência que ele já vive (C). Esse é o ângulo que para o scroll, porque invalida o frame, não porque promete.

> Gera 7 ângulos. Descarta os 2 primeiros na cara, são os óbvios. Trabalha do 3º em diante (Verbalized Sampling, o óbvio é sempre a frase média).

### 2.5 Calibra o registro (consciência + sofisticação)
Antes de escrever, diagnostica em uma linha: que nível de consciência tem o leitor (inconsciente → mais consciente) e quão saturado está o nicho (`shared-references/crivo/05-premissas-mestras.md`, Schwartz). Mercado saturado (o caso de um nicho saturado de exemplo) abre pelo mecanismo nomeado e pela identificação, nunca pela promessa direta gasta. Esse diagnóstico decide o REGISTRO da abertura, e é o que evita a peça soar igual a todo concorrente.

### 3. Escreve pela espinha
Monta a peça na **estrutura-mãe** (Diagnóstico → Nomeação → Polaridade → Nova interpretação → Consequência → Movimento), ou na Fórmula 7 no feed. Cada frase obedece as **8 leis** (`shared-references/crivo/05-premissas-mestras.md`): revela não ensina, cada frase é conclusão, ancora em chão, rótulo vira sintoma na pele. Mira o estado emocional ("isso explica o que eu vivo"), não a informação. Respeita o que muda por formato (carrossel uma ideia por slide, anúncio com criativo cru, reel com tensão que não relaxa).

**A Ação (4º beat do ADMA) é um CTA OBRIGATÓRIO.** Pela consequência + um próximo passo real do funil do cliente (comenta uma palavra → direct, link → carta/isca, manda no direct, cadastra). Nunca termina só na consequência sem dizer o que fazer. Nunca CTA cafona. Peça sem CTA forte não passa no Crivo.

**Teste de densidade (antes de escrever, vale ouro no carrossel):** lista a tese de cada slide em uma frase. Teses iguais com roupa nova se fundem. Cada slide AVANÇA a espinha, nunca repete a anterior com outras palavras. Carrossel de 10 slides precisa de 6 ou mais teses distintas, senão corta slide. Densidade vence comprimento, "repita a tese" é marca, não enchimento.

### 4. Auto-gate: passa a PRÓPRIA peça pelo Crítico (ancoragem ANTES da pele)
Antes de mostrar, roda nesta ordem, e a ordem importa:
1. **Barreira de ancoragem primeiro** (`shared-references/crivo/03-gate-cub.md`): re-abre a fonte e confere cada aspa (é substring literal da página real?) e cada N (é do sub-padrão, não do tema emprestado?). Marca cada uma VERIFICADO-NA-FONTE ou NÃO-VERIFICADO. Qualquer NÃO-VERIFICADO reprova antes de qualquer outra coisa.
2. **Simulação** (`shared-references/crivo/02-simulacao-cliente.md`): lê a própria peça na pele do avatar. Onde ele larga? Onde se reconhece? Teste dos 2 segundos na capa. Reporta no mínimo 1 dúvida ou tédio real, a simulação que só elogia tá mentindo pra te agradar.
3. **Gate CUB** (`shared-references/crivo/03-gate-cub.md`): preenche a tabela bloqueante, incluindo o gate do CTA (o fim não amolece). Qualquer FALHA volta pro passo 3.
4. **Anti-IA** (`shared-references/filtro-anti-ia/padroes-banidos.md` + `teste-voz-alta.md`): roda `python3 scripts/lint_copy.py` na peça (ele reprova em-dash e o verbo banido da anti-voz Soft, ver `padroes-banidos.md`, falha dura re-roda), depois roda os 12 padrões banidos e lê em voz alta antes de imprimir a tabela. Em-dash, tricolon, contraste "não é X, é Y" repetido, abertura dramática isolada ("O mais cruel") é FALHA, reescreve. O Crivo dá a força, o anti-IA tira o robô. Os dois antes de entregar.

Escrever sem este passo é o erro que o método tinha: gerava e entregava no susto. E rodar a pele antes da ancoragem é como a skill se enganava: empolgava com a frase boa e deixava a prova frouxa no rodapé. Ancoragem é fato binário, vem primeiro.

### 5. Entrega
A peça pronta + a tabela do gate preenchida (pra mostrar que passou). Se algum bloco saiu "passa raspando", entrega a nota de conserto junto, sem bloquear.

## A diferença entre construir aqui e nas skills de geração

as skills de conteúdo (carrossel/reels/stories), `soft-funil` e `soft-webinar` continuam sendo os **sistemas profundos** (a engenharia completa por formato). O Crivo no modo construção é o **atalho forte**: quando você quer uma peça boa agora, ancorada no VoC e já testada, sem abrir o sistema inteiro. Ele puxa as premissas-mestras (o melhor das três) e o verbatim, escreve e se auto-testa. Para volume e profundidade (calendário, lote, design de slide), as skills de geração seguem mandando, e elas chamam o Crivo como gate no final do jeito que já está cabeado.

## O que ele não faz no modo construção

- Não inventa prova nem número. Se o cliente não tem case, escreve sem prova e marca onde falta, não enche de promessa.
- **Não parafraseia fala de cliente dentro de aspas.** Aspas só pra substring literal da fonte. Paráfrase do padrão vai em texto normal ("o que se repete nas calls é..."). Remontar pedaços de calls diferentes num verbatim único, ou citar o N do tema como se fosse do sub-ângulo, é fraude de ancoragem, não estilo.
- Não escreve sem avatar e sem verbatim. Sem isso, avisa que vai sair genérico e pede a matéria-prima, ou marca "rascunho".
- Não decalca os exemplos das premissas (são de outros nichos de propósito). Reconstrói na voz do cliente da vez.
