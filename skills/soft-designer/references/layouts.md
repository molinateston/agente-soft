# Layouts Canônicos

Este arquivo é o **guia transversal** de layouts. As 3 famílias visuais (Editorial Preto, Clínico Branco, Manuscrito Cru) implementam esses layouts de forma ligeiramente diferente, leia o arquivo da família escolhida pra ver padding, escala e detalhes exatos.

## Princípio: a função do slide define o layout, não o conteúdo

Antes de desenhar um slide, pergunte: **qual a FUNÇÃO desse slide na narrativa?**

Função → Layout. Sempre nessa ordem. Nunca olhe a copy e improvise um layout.

## As 7 funções e seus layouts

### 1. HOOK (slide 1, sempre)

**Função:** parar o scroll em 0,3 segundo. É a vitrine.

**Princípio:** o hook é onde a postura criativa importa mais. Não trate como template, trate como **decisão deliberada de qual versão amplifica essa frase específica**. Cada família tem 5-7 variações de hook documentadas no seu próprio reference (`familia-clinico-branco.md`, `familia-editorial-preto.md`, `familia-manuscrito-cru.md`). Leia a seção "Hook, postura criativa" da família escolhida antes de desenhar o slide 1.

**O default universal de qualquer hook é tipografia gigante + espaço negativo brutal.** Sem ilustração, sem ícone, sem decoração. A copy ganha quando não compete com nada.

**Quando adicionar elementos extras ao hook:**
- **Avatar bloco** (foto+nome+@handle+selo): só na família Manuscrito Cru, e quando a copy é primeira pessoa.
- **Imagem de fundo** (foto, screenshot, print): só quando o usuário sobe a imagem. Nunca invente.
- **Ilustração line-art** (boneco, ícone): só quando o usuário pediu explicitamente "com boneco" / "com ilustração", ou subiu referência visual com ilustração. Nunca improvise.
- **Número grande**: quando a frase do hook gira em torno de um valor concreto (R$3k, 47 dias, 9 posts).

**Anatomia mínima do hook (em qualquer família):**
- Tag pequena no topo (opcional): `[Para modelar, não copiar]`, `[NÃO COPIE, MODELE]`
- Título gigante ocupando 50–70% vertical do slide
- 1–3 palavras do título em cor de destaque (ACCENT)
- Vertical alignment varia por intenção (center pra reflexivo, flex-end pra direto, flex-start pra tweet)
- Sem corpo, sem subtítulo, sem rodapé. Só título + tag opcional.

**Errado:**
- Hook com 4 linhas de texto pequeno
- Hook com 2 títulos
- Hook com botão de CTA misturado
- Hook centralizado simétrico no meio do slide com padding gigante igual em cima e embaixo (vira Canva genérico)
- Hook com ilustração que o usuário não pediu
- Hook que repete o template default sem considerar se outra variação amplificaria mais a frase

### 2. PROBLEMA

**Função:** nomear a dor que o leitor sente mas não verbaliza. Espelho.

**Anatomia (variação A, lista):**
- Título curto no topo: "Todo dia você tenta."
- Lista vertical de bullets pretos pequenos (•) ou hífens (–) com 3-4 itens, máximo 4 palavras cada
- Frase de fechamento em negrito embaixo (pergunta retórica): "Por que parece que só eu não consigo?"

**Anatomia (variação B, parágrafo):**
- 2-3 blocos de frases curtas separados por linha em branco
- Última frase em negrito ou em ACCENT
- Sem listas, só prosa

**Vertical alignment:** `flex-end` (texto encostado no rodapé) na maioria dos casos.

**Quando usar A vs B:**
- **A (lista)** quando a copy enumera ações: "Pesquisa ideia. Salva post. Testa formato."
- **B (parágrafo)** quando a copy é narrativa: "Tem uma parte que você não fala pra ninguém. Mas ela aparece à noite."

### 3. VIRADA

**Função:** quebrar o padrão do problema. Mudar o jogo. É o "porém" da narrativa.

**Anatomia:**
- **Frase única**, máximo 14 palavras
- Vertical alignment: `center`
- Espaço negativo total ao redor, esse slide é 80% vazio
- Pode ter itálico (Editorial) ou círculo desenhado em volta de 1 palavra (Manuscrito)
- Cor de destaque em 1-2 palavras-chave

**Errado:**
- Virada com bullets
- Virada com 3 linhas de explicação
- Virada que continua o problema ("e tem mais...")
- Virada que já vende (isso é o slide de Oferta, não Virada)

### 4. MÉTODO / CONTEÚDO

**Função:** entregar a estrutura nova. Mostrar o "como".

**Anatomia (variação A, lista numerada):**
- Título de seção pequeno no topo: "3C, Conversão 3 Etapas"
- Lista numerada (01, 02, 03 para Clínico, ou 1, 2, 3 para Manuscrito, ou travessões `–` para Editorial)
- Cada item: 1 linha, no máximo 8 palavras
- Palavra-chave de cada item em ACCENT

**Anatomia (variação B, comparativo X / Y):**
- Título: "1C, Carrossel 3C" ou nome do método
- Bloco superior: o que ele FAZ (em texto normal)
- Bloco inferior: lista "Substitui:" com X vermelho-coral nos itens "ruins"
- Frase final em ACCENT: "Algoritmo irrelevante." / "Zero desgaste."

**Vertical alignment:** `flex-start` (texto no topo).

### 5. PROVA

**Função:** dar evidência. Número, faturamento, antes/depois, depoimento.

**Anatomia (variação A, número grande):**
- Número gigante centralizado (140–160px) em ACCENT ou TEXT
- Label pequeno embaixo do número descrevendo o que é
- Pode ter 2-3 números lado a lado se couber (ex: "9 Carrosséis / 1 Carta / 3 Mensagens")

**Anatomia (variação B, narrativa de evolução):**
- Lista de anos + valores: "2020 - Zero vendas / 2021 - Zero vendas / 2024 - R$350.000"
- Anos em ACCENT
- Valores em TEXT
- Sem números gigantes, aqui prova é narrativa, não estatística

**Anatomia (variação C, depoimento):**
- Aspas tipográficas (" ") gigantes
- Frase do cliente em itálico (Editorial) ou peso normal (Clínico)
- Nome + cargo embaixo, pequeno

**Vertical alignment:** `center`.

### 6. OFERTA

**Função:** apresentar o produto. O que está disponível, o que tem dentro, pra quê serve.

**Anatomia:**
- Tag no topo: `[Para modelar, não copiar]` ou `[Disponível pra você hoje:]`
- Título grande: nome do produto ou benefício principal
- Lista curta (3-5 itens) do que tem dentro, com ✅ (Manuscrito) ou travessões `–` (Editorial) ou bullets pretos (Clínico)
- Linha final com palavra-código pra comentar: "Para acessar comente: 3C"

**Vertical alignment:** `flex-end` (texto encostado embaixo) ou `center`.

**Pode ter ilustração line-art** no topo direito ou rodapé direito (boneco com pasta, boneco com WhatsApp). Stroke 2px na cor TEXT, detalhes pequenos em ACCENT.

### 7. CTA

**Função:** dar instrução literal de o que fazer agora. Sempre o último slide.

**Anatomia (variação A, comando + botão):**
- Comando direto em 2 linhas: "Comente MÉTODO\nque eu te mando uma aula"
- Botão com borda 2-3px ACCENT, texto ACCENT, fundo transparente
- Border-radius: 4px (Editorial), 8px (Clínico), nenhum (Manuscrito)
- Padding interno do botão: 24px 48px
- Palavra-código em negrito dentro do botão: **3C** ou **MÉTODO** ou **AULA**

**Anatomia (variação B, passo-a-passo):**
- Título no topo: "Para liberar seu acesso você deve:"
- Lista numerada de 2-3 passos:
  - 1 - Me seguir @handle
  - 2 - Comentar "AULA"
  - 3 - Eu te envio o link no DM
- Palavras-chave em ACCENT (handle, palavra-código, "DM")
- Sem botão necessariamente

**Vertical alignment:** `center`.

**Errado:**
- CTA misturado com conteúdo (CTA é slide separado, sempre)
- Mais de 1 botão por slide
- Botão redondo / pílula gigante (vira Canva)
- "Clique no link da bio" (link na bio é fraco, sempre prefira "comente X")

## Tabela de decisão rápida

| Se a copy do slide é... | Layout |
|---|---|
| Frase de impacto + tag (slide 1) | HOOK |
| Lista de ações repetitivas | PROBLEMA-A |
| Confissão narrativa em prosa | PROBLEMA-B |
| Frase única que muda o jogo | VIRADA |
| Lista numerada de etapas | MÉTODO-A |
| Bloco com "Substitui:" | MÉTODO-B |
| Número gigante isolado | PROVA-A |
| Lista de anos + valores | PROVA-B |
| Aspas tipográficas + nome | PROVA-C |
| Lista do que tem dentro do produto | OFERTA |
| Comando + palavra-código | CTA-A |
| 1, 2, 3 passos com handle | CTA-B |

## Regra final

Se o slide não encaixa em nenhum dos 7, **escolha o mais próximo e adapte respeitando o padding e a escala da família escolhida**. Não invente um 8º layout. A consistência é parte da assinatura.
