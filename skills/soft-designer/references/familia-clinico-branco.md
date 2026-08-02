# Família Visual: Clínico Branco

A família default. Funciona pra 80% dos casos. Fundo branco puro, sans pesada, espaço negativo brutal.

## Índice

- Identidade
- Sistema de cores
- Tipografia
- Sistema de margens, REGRA CRÍTICA
- Layout por tipo de slide
- Elementos permitidos
- Elementos proibidos nessa família
- Exemplo de HTML de um slide Hook (variação 1, simétrico)
- Quando NÃO usar Clínico Branco

---

## Identidade

Clínico não é frio. É preciso. Como bula bem desenhada. Como receita de médico bom. Sem decoração, mas com peso.

A copy é a estrela. O design só serve.

## Sistema de cores

```
BG          = #FFFFFF        (branco puro, nunca off-white)
TEXT        = #0A0A0A        (preto quase puro, nunca #000)
TEXT_MUTED  = #6B6B6B        (cinza pra texto secundário)
ACCENT      = {cor escolhida pelo usuário, hex puro}
ACCENT_SOFT = {accent com 15% opacidade pra fundos sutis, raríssimo}
NEGATIVE    = #E63946        (vermelho-coral pra X de negação, fixo)
```

Regras:
- Nunca use cinza além de TEXT_MUTED. Nada de #888, #999, #AAA.
- ACCENT só aparece em: títulos de seção, palavras-chave (2-4 por slide), botão CTA, números grandes.
- NEGATIVE só aparece em ❌ ou X de listas de "o que parar de fazer".

## Tipografia

Sans pesada, sempre. Nunca serif nessa família.

**Combinações recomendadas (escolher 1):**

| Nome | Heading | Body |
|---|---|---|
| Inter Bruto | Inter 800 | Inter 400 |
| Jakarta Limpo | Plus Jakarta Sans 800 | Plus Jakarta Sans 400 |
| Space Direto | Space Grotesk 700 | Space Grotesk 400 |

**Escala fixa:**
- Hook (slide 1): 92px / 800 / line-height 1.05 / letter-spacing -2px
- Título de seção: 64px / 800 / line-height 1.1 / letter-spacing -1.5px
- Subtítulo: 44px / 700 / line-height 1.15
- Corpo: 36px / 400 / line-height 1.4
- Lista: 38px / 500 / line-height 1.5
- Tag/label: 22px / 600 / letter-spacing 1.5px / uppercase
- Número grande (prova): 140px / 800 / line-height 1

Tudo em px porque o canvas é fixo 1080×1350.

## Sistema de margens, REGRA CRÍTICA

O carrossel é feito pra ser **impulsionado como anúncio**, então cada slide precisa parecer profissional, equilibrado e simétrico. Margem assimétrica vira "amador" no feed.

**A regra é dura:**

```
SAFE_MARGIN = 100px
```

Esse valor vale pros 4 lados de TODO slide do Clínico Branco. Sem exceção. Sem variação entre slides do mesmo carrossel.

- `padding-top: 100px`
- `padding-right: 100px`
- `padding-bottom: 100px`
- `padding-left: 100px`

**Área útil de conteúdo:** 880×1150px (1080−200 × 1350−200).

**Vertical alignment de conteúdo:** SEMPRE `center`. Nunca `flex-start`, nunca `flex-end`. O ar acima e abaixo do bloco de conteúdo deve ser igual, isso é o que centraliza opticamente o slide.

**Horizontal alignment de conteúdo:** SEMPRE `center` no eixo do flex container, mas o **texto interno alinha à esquerda** (`text-align: left`). O bloco fica centrado, mas as linhas de texto começam na mesma vertical, criando ritmo de leitura.

**Estrutura HTML obrigatória pra todo slide:**

```html
<div class="slide" style="
  width: 1080px;
  height: 1350px;
  background: #FFFFFF;
  padding: 100px;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  justify-content: center;   /* SEMPRE center vertical */
  align-items: center;       /* SEMPRE center horizontal do bloco */
  position: relative;
  overflow: hidden;
">
  <!-- Container interno com max-width pra controlar a largura do bloco -->
  <div style="width: 100%; max-width: 880px; text-align: left;">
    <!-- conteúdo do slide aqui -->
  </div>
</div>
```

**O "bloco" do conteúdo deve ocupar entre 60% e 100% da área útil horizontal**, dependendo do tamanho do texto. **A largura do bloco é determinada pelo elemento MAIS LARGO do slide, não pelo texto médio.** Use a tabela:

| Elemento mais largo do slide | `max_width` recomendado |
|---|---|
| Título de hook 88-110px | 880px |
| Título de seção 56-72px (ex: "1C, Carrossel 3C") | 760px |
| Só texto até 44px (lista, virada, pergunta retórica) | 620-680px |
| Número gigante isolado (variação prova-A) | 880px com `text-align: center` |

**Como decidir:** olhe pra todas as linhas do slide, identifique a mais longa (em pixels visuais, não em caracteres), e escolha o `max_width` que faz essa linha caber em UMA linha sem quebrar. Se quebrar, sobe pro próximo nível. Nunca menos de 620px.

**Erro comum:** usar `max_width: 880` em todo slide independente do tamanho do título. Slides com lista de texto pequeno ficam com bloco gigante e conteúdo encostado à esquerda, perde a centralização óptica. Slides com título grande quebram o título em linhas erradas se o `max_width` for pequeno. **Sempre dimensione pelo elemento mais largo.**

**Elementos absolutos (tag no topo, imagem no canto) são proibidos no Clínico Branco simétrico.** Se precisar de tag, ela vai DENTRO do container interno, no fluxo normal acima do título.

**Simetria de listas:** quando há lista (X de negação, bullets, números), o bullet/ícone fica alinhado verticalmente com a primeira letra do texto da lista, e a lista inteira está centralizada horizontalmente como um bloco. Não use `padding-left` na lista, use `align-items: flex-start` no flex item.

## Layout por tipo de slide

### Hook, postura criativa antes de qualquer template

**O default do hook é tipografia pura.** Sem ilustração, sem ícone, sem decoração. Apenas o título gigante + espaço negativo brutal. Em 90% dos casos é o que funciona melhor, a copy ganha quando não compete com nada.

Antes de escolher uma das variações abaixo, leia a copy do slide 1 e pergunte: **qual versão tem mais chance de virar um screenshot que circula?** Não é "qual layout cabe". É "qual escolha de design **amplifica** essa frase específica".

Pista pra decidir:

- A frase tem um **número** ou **valor** (R$3k, 47%, 9 carrosséis)? → considere a variação **número-anchor**, com o número gigante isolado.
- A frase tem um **contraste óbvio** (antes/depois, com/sem, X/Y)? → considere **contraste vertical** dividindo o slide em 2 blocos.
- A frase é uma **citação que quer parecer dita**? → considere **aspas grandes** ou variação tipo manuscrito.
- A frase é **literária / reflexiva**? → considere **título centralizado vertical** com muito espaço negativo.
- A frase é **direta de comando**? → considere **rodapé esquerdo bruto**, título encostado embaixo.
- O usuário **subiu uma imagem própria** (foto, screenshot, print)? → considere **fundo de imagem** com overlay e texto sobreposto.
- O usuário **pediu explicitamente uma ilustração**? → use a variação **ilustração lateral** descrita no fim desta seção.

Não decore as variações abaixo como receita. Use como repertório. Combine. Inverta. O ponto é: cada hook merece uma decisão deliberada, não o template default.

**Regra que vale pras 8 variações:** todas usam padding 100px nos 4 lados, vertical alignment `center`, horizontal alignment `center` do bloco. O que muda entre as variações é **o conteúdo do bloco interno e seu tamanho**, não a ancoragem do bloco no slide.

#### Variação 1, Título limpo centrado (default mais seguro)
- Bloco interno: `max-width: 880px`
- Apenas o título dentro do bloco. Sem tag, sem corpo, sem botão.
- Título 96-110px / weight 800 / `text-align: left`
- Letter-spacing: -3px
- Line-height: 1.0
- **Quando usar:** quando a frase já é forte sozinha. Default mais seguro.

#### Variação 2, Título reflexivo centrado
- Bloco interno: `max-width: 760px` (mais estreito = mais respiro lateral)
- Título único, sem nada em volta
- Título 80-92px / weight 800 / `text-align: left`
- Line-height: 1.15 (mais aberto que variação 1, pra respirar)
- **Quando usar:** quando a frase é literária, paradoxal, ou pede pausa. "Quanto menos marketing, mais comercial."

#### Variação 3, Número-anchor
- Bloco interno: `max-width: 880px`, conteúdo `text-align: center` nesta variação (o número pede centralização visual)
- Estrutura vertical: número gigante em cima, label embaixo
- Número: 220-280px / weight 800 / cor ACCENT / line-height 1.0
- Label embaixo: 32-40px / weight 500 / TEXT
- Margem entre número e label: 30px
- **Quando usar:** copy gira em torno de valor concreto. "R$3k", "9 posts permanentes", "47 dias".

#### Variação 4, Contraste vertical (2 blocos)
- Bloco interno: `max-width: 880px`, conteúdo dividido em 2 sub-blocos verticais
- Sub-bloco 1 (topo): frase do "antes" em 56-64px / weight 500 / TEXT, line-height 1.15
- Linha divisória: 2px ACCENT, 80px de largura, margem 50px acima e abaixo
- Sub-bloco 2 (base): frase do "depois" em 64-72px / weight 800 / TEXT, palavra-chave em ACCENT, line-height 1.1
- Tudo `text-align: left`
- **Quando usar:** copy estruturada como contraste explícito. "Antes: pitch / Agora: 3 mensagens".

#### Variação 5, Citação grande com aspas
- Bloco interno: `max-width: 820px`
- Aspas tipográficas grandes (140-180px) em ACCENT no início do bloco, alinhadas à esquerda
- Frase em 56-72px / weight 700 / TEXT, logo abaixo das aspas (margem-top: -40px pra encostar nas aspas)
- Atribuição em 22px / weight 500 / TEXT_MUTED, abaixo da frase, margem-top: 40px
- Tudo dentro do mesmo bloco centrado, `text-align: left`
- **Quando usar:** o hook é literalmente uma fala, do especialista, de cliente, ou pensamento intrusivo do leitor.

#### Variação 6, Tag forte de provocação
- Bloco interno: `max-width: 880px`
- Estrutura vertical: tag → margem 60px → título
- Tag: 28-32px / weight 700 / italic / texto branco / fundo ACCENT sólido / padding 14px 28px / display inline-block
- Título: 88-100px / weight 800 / TEXT, line-height 1.0
- **Quando usar:** quando a tag é parte da mensagem, não decoração. `[NÃO COPIE, MODELE]`, `[VERDADE DURA]`.

#### Variação 7, Fundo de imagem (quando o usuário sobe foto/print)
- O slide inteiro tem `background-image` da imagem do usuário (embedada base64), `background-size: cover`, `background-position: center`
- Overlay semi-transparente cobrindo o slide: `<div>` com `position: absolute; inset: 0; background: rgba(255,255,255,0.6);`
- Por cima do overlay, o container interno simétrico padrão (padding 100px, center+center)
- Bloco interno do texto segue regras das variações 1, 2 ou 6
- **Quando usar:** SOMENTE quando o usuário entregar uma imagem.

#### Variação 8, Ilustração centralizada (raro, sob pedido)
- O usuário pediu explicitamente "com boneco" / "com ilustração"
- Bloco interno: `max-width: 880px`, estrutura vertical: ilustração → margem 60px → título
- Ilustração: SVG line-art, `width: 280-360px`, centralizada horizontalmente dentro do bloco
- Título embaixo: 80-96px / weight 800 / `text-align: center` nesta variação (a ilustração pede centralização)
- Tag opcional acima da ilustração, em itálico, 22px
- **NÃO usa `position: absolute`. Usa fluxo normal centralizado.** A ilustração ocupa o lugar de um sub-bloco, não compete com o título por espaço lateral.
- **Quando usar:** APENAS quando o usuário pediu ilustração ou subiu referência com ilustração.

---

### Estrutura HTML padrão pra qualquer variação de hook

```html
<div class="slide" style="
  width: 1080px; height: 1350px; background: #FFFFFF;
  padding: 100px; box-sizing: border-box;
  display: flex; flex-direction: column;
  justify-content: center; align-items: center;
  position: relative; overflow: hidden;">

  <div style="width: 100%; max-width: 880px; text-align: left;">
    <!-- conteúdo da variação escolhida aqui -->
  </div>
</div>
```

A largura `max-width` muda por variação (760-880px), mas o resto da casca é sempre essa. **Nunca use `position: absolute` no Clínico Branco simétrico.** Tudo no fluxo normal, dentro do container interno.

---

### Como decidir qual variação usar, fluxo mental

1. Leu a copy do slide 1.
2. Listou mentalmente 2-3 variações que poderiam funcionar pra essa frase específica.
3. Escolheu a que **amplifica a frase**, não a que cabe.
4. Se duas pareceram igualmente boas, **mostre as duas no preview** e deixe o usuário escolher. É barato.
5. Nunca escolheu a variação 8 (ilustração) sem que o usuário tenha pedido ou subido imagem.

Se você está em dúvida, use a variação 1 (título limpo centrado). É o default mais seguro e funciona em quase tudo.

### Problema
- Padding: 100px nos 4 lados
- Vertical alignment: `center`
- Bloco interno: `max-width: 820px`, centrado, conteúdo `text-align: left`
- Estrutura vertical dentro do bloco:
  - Título do problema em 56-64px / weight 800 / TEXT
  - Margem 40px
  - Lista de bullets pretos (•), cada item 1 linha máximo 6 palavras, 36-40px / weight 500
  - Margem 40px
  - Pergunta retórica em negrito 40-44px / weight 800
- A pergunta retórica não é obrigatória, mas quando existe vai SEMPRE na base do bloco

### Virada
- Padding: 100px nos 4 lados
- Vertical alignment: `center`
- Bloco interno: `max-width: 720px` (mais estreito que outras variações, virada precisa de respiro lateral)
- Conteúdo: APENAS uma frase, máximo 12 palavras
- Tamanho: 64-80px / weight 800 / TEXT, com palavra-chave em ACCENT
- Line-height: 1.1
- `text-align: left`
- Sem tag, sem corpo, sem nada em volta. A virada é o slide mais minimalista do carrossel.

### Método/Conteúdo
- Padding: 100px nos 4 lados
- Vertical alignment: `center`
- Bloco interno: `max-width: 880px`, centrado, `text-align: left`
- Estrutura vertical:
  - Título de seção em 56-64px / weight 800 / cor ACCENT (ex: "1C, Carrossel 3C")
  - Margem 50px
  - Bloco do método: lista numerada (01, 02, 03) ou prosa curta, 36-40px / weight 500
  - Margem 50px (se houver bloco "Substitui:")
  - Bloco "Substitui:" com lista de X vermelho, 34-38px / weight 500
  - Margem 50px
  - Frase de fechamento em 40-44px / weight 800 com palavra-chave em ACCENT
- **Bullets/X de lista alinham vertical com a primeira letra do texto.** Use `display: flex; align-items: center; gap: 22px` em cada item.

### Prova
- Padding: 100px nos 4 lados
- Vertical alignment: `center`
- Bloco interno: `max-width: 880px`, centrado
- Variação A, número único: número 140-180px / weight 800 / ACCENT, label embaixo 32px / weight 500. Tudo `text-align: center` nessa variação (números pedem centralização).
- Variação B, narrativa de evolução: lista de anos+valores, anos em ACCENT, valores em TEXT, formato `2024, R$350.000`, 38-44px / weight 500, `text-align: left`
- Variação C, depoimento: aspas tipográficas grandes em ACCENT, frase em itálico 44-52px / weight 500, atribuição embaixo 22px / weight 500 / TEXT_MUTED

### CTA
- Padding: 100px nos 4 lados
- Vertical alignment: `center`
- Bloco interno: `max-width: 880px`, centrado, `text-align: center` (CTAs pedem centralização, é onde o usuário toma ação)
- Estrutura vertical:
  - Tag opcional em itálico 28px / weight 500 / TEXT
  - Margem 30px
  - Comando direto em 56-72px / weight 800 / TEXT, palavra-chave em ACCENT
  - Margem 60px
  - Botão de CTA centralizado: padding 22px 44px, fundo ACCENT, texto branco 28-32px / weight 700, border-radius 8px, palavra-código em destaque
- O botão é centralizado horizontalmente no bloco, NÃO encostado à esquerda
- Variação alternativa, passo a passo: 1, 2, 3 com handle em ACCENT, sem botão (o passo-a-passo já é o CTA)

## Elementos permitidos

- Texto puro
- Listas com bullets pretos pequenos (•)
- Listas numeradas com números formato 01, 02, 03
- X vermelho-coral (❌ ou SVG inline) pra negação
- Botão de CTA com borda
- Tag minúscula uppercase no topo (opcional, máx 1 por slide)
- Linha divisória horizontal 2px ACCENT (raríssimo, só pra separar seções dentro do mesmo slide)

## Elementos proibidos nessa família

- Gradientes (qualquer)
- Sombras (qualquer)
- Bordas arredondadas além do botão de CTA
- Ícones de biblioteca (Material, FA, Lucide etc)
- Setas curvas manuscritas (isso é Manuscrito Cru)
- Serifs (isso é Editorial Preto)
- Cores além de TEXT, TEXT_MUTED, ACCENT, NEGATIVE
- Off-white, creme, qualquer fundo que não seja #FFFFFF puro

## Exemplo de HTML de um slide Hook (variação 1, simétrico)

```html
<div class="slide" style="
  width: 1080px;
  height: 1350px;
  background: #FFFFFF;
  padding: 100px;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: relative;
  overflow: hidden;
  font-family: 'Inter', sans-serif;
">
  <div style="width: 100%; max-width: 880px; text-align: left;">
    <h1 style="
      font-size: 100px;
      font-weight: 800;
      line-height: 1.0;
      letter-spacing: -3px;
      color: #0A0A0A;
      margin: 0;
    ">Fechei <span style="color:#FF6B1A;">R$3k</span><br>com 3 msgs<br>no WhatsApp.</h1>
  </div>
</div>
```

## Quando NÃO usar Clínico Branco

- Se o conteúdo é uma confissão pessoal/vulnerável → Manuscrito Cru combina mais
- Se o público é alto luxo / executivo C-level → Editorial Preto tem mais peso
- Se tem muito print de tela / screenshot → qualquer família funciona, mas Clínico deixa o print respirar mais
