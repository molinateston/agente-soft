# Escaneabilidade do Texto (post/legenda que a pessoa lê no celular)

O resto do filtro-mobile-first cuida do VISUAL da peça (tamanho de fonte, contraste, layout, px). Este arquivo cuida do TEXTO cru como ele chega no feed: a legenda do post, o corpo do carrossel em texto, o copy que a pessoa lê rolando o dedão. Régua de escaneabilidade, com contagem de verdade.

Aviso de escopo: aqui não tem framework de estrutura de argumento. O método Soft usa a espinha APSD (Atenção, Problema, Solução, Decisão), e ela mora nas skills de conteúdo. Este arquivo é só a FORMA no celular: quantas linhas, quanto respiro, que tamanho de frase. Não decide o que dizer, decide como o texto se apresenta na tela pequena.

---

## Índice

- O problema que a régua resolve
- A régua de escaneabilidade (com números)
- Conta de verdade, não estima
- Erros de formatação que matam a leitura no mobile
- Onde entra no fluxo

---

## O problema que a régua resolve

No celular a tela é estreita e a pessoa rola rápido. Bloco de texto denso, parágrafo de 6 linhas grudadas, frase de 40 palavras sem respiro: o dedão passa direto. A régua abaixo é o que faz o olho parar e conseguir ler sem esforço.

Isso NÃO substitui a copy boa (ancorada, concreta, na voz do cliente). É a camada de cima: mesmo a melhor frase morre se vier num paredão de texto.

---

## A régua de escaneabilidade (com números)

Pra legenda de post e corpo de texto que a pessoa lê no feed:

- **Uma frase por linha, na maioria das linhas.** A linha respira sozinha.
- **A maioria das linhas com ~55 caracteres ou menos.** Frase curta lê fácil no polegar.
- **Poucas linhas podem ser mini-bloco** (2 a 3 frases, até ~110 caracteres), pra variar o ritmo. Não mais que isso seguidas.
- **Linha em branco separando os blocos.** O respiro entre linhas é o que deixa escaneável. Texto sem linha em branco vira parede.
- **Peça curta de feed: fica na casa das ~20 linhas / 200-250 palavras.** Passou muito disso, provavelmente dá pra cortar sem perder o ponto. (Carrossel, carta e legenda longa têm régua própria nas skills; aqui é a referência da peça curta.)
- **Palavra simples, leitura fácil.** Se dá pra trocar a palavra difícil por uma que a mãe do cliente entenderia, troca.
- **Varia o começo das frases.** Se três linhas seguidas começam com "Eu", reescreve. Começo repetido cansa e denuncia texto automático.

Essa parte da densidade dialoga com o `espacamento-e-layout.md` (que trata do respiro no LAYOUT). Aqui é o respiro no TEXTO antes de virar arte.

---

## Conta de verdade, não estima

A régua só funciona se você contar de fato, não no olho.

- **Conta as linhas.** Bateu muito acima de ~20 numa peça curta? Corta.
- **Conta os caracteres da frase-chave.** Headline e primeira linha têm teto físico (o feed corta o que passa). Não confia no "parece curto": conta.
- **Prefere o algarismo ao número por extenso** no texto que a pessoa escaneia. "3 clientes" para o olho melhor que "três clientes", e economiza caractere.

Contar parece pedante. É o que separa a peça que a pessoa lê da peça que ela rola por cima. O olho perdoa pouco no celular.

---

## Erros de formatação que matam a leitura no mobile

- **Paredão de texto** (parágrafo de 5+ linhas sem linha em branco). O maior assassino de leitura no feed.
- **Frase longa demais** que dá duas ou três voltas antes do ponto. No mobile ela vira quatro linhas de olho perdido. Quebra em duas frases.
- **Linha em branco a cada palavra** (o oposto do paredão). Uma palavra por linha em oito linhas seguidas é tique de IA e cansa igual. Respiro é entre blocos, não entre cada palavra. (Ver os padrões visuais em `../filtro-anti-ia/padroes-banidos.md`.)
- **Começar tudo igual.** Toda linha abrindo com "Eu" / "E" / "Mas". Varia.
- **Emoji tapando buraco.** Emoji decorativo pra "dar cor" a um texto fraco não conserta o texto, só polui. (Emoji funcional pontual é outra conversa.)

---

## Onde entra no fluxo

- **Depois da copy pronta, antes de virar arte ou de publicar.** A skill de conteúdo escreve o texto; esta régua confere se ele lê fácil no celular.
- **Junto do `checklist-final.md`:** o checklist cobre o visual da peça diagramada; esta régua cobre o texto cru da legenda/corpo antes disso.
- **Cruza com o filtro-anti-ia:** primeiro o texto não pode cheirar a IA, depois tem que escanear fácil no mobile. Os dois juntos. Passou nos dois, tá pronto pro feed.
