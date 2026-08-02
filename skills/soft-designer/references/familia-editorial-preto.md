# Família Visual: Editorial Preto

A família mais sofisticada. Para conteúdo que precisa de peso, autoridade, ar de revista. Fundo preto puro, serif elegante em títulos, sans no corpo, laranja queimado como única cor de destaque.

## Identidade

Editorial é o tom de revista de negócios bem feita. Não é preto gótico, não é dark mode. É preto-revista. Sério sem ser pesado.

Funciona melhor pra: posicionamento, manifesto, oferta premium, prova social cara, conteúdo de autoridade.

## Sistema de cores

```
BG          = #0A0908        (preto com leve calor, NUNCA #000)
TEXT        = #F5F2EC        (creme suave, NUNCA #FFF)
TEXT_MUTED  = #8A8580        (bege acinzentado pra texto secundário)
ACCENT      = {cor escolhida pelo usuário, padrão #C8741A laranja queimado}
ACCENT_SOFT = {accent com 20% opacidade}
```

Regras:
- Fundo NUNCA é preto puro #000. Sempre #0A0908 (preto com leve calor) pra dar sensação de papel impresso bom.
- Texto NUNCA é branco puro #FFF. Sempre #F5F2EC (creme) pra reduzir contraste agressivo.
- Default ACCENT é #C8741A (laranja queimado). Outras cores quentes (vermelho coral, dourado) também combinam.
- **Cores frias funcionam se forem escurecidas o suficiente.** Verde petróleo (#0F766E) e azul-marinho profundo (#1E3A8A) funcionam bem porque a escuridão neutraliza o "frio" e cria sensação institucional/financeira. Verdes claros (#84CC16, #22C55E) e azuis puros (#3B82F6) NÃO funcionam, brigam com o calor do preto.
- Cor de destaque deve aparecer em palavras-chave do título, divisores finos (1-2px de altura, 80px de largura), itálico de ênfase, e ícones pequenos. Nunca em parágrafos inteiros nem em fundo de bloco.

## Tipografia

Serif elegante no heading + sans clean no corpo. Sempre.

**Combinações recomendadas (escolher 1):**

| Nome | Heading (serif) | Body (sans) |
|---|---|---|
| Playfair Clássico | Playfair Display 700 | Inter 400 |
| Fraunces Editorial | Fraunces 600 | DM Sans 400 |
| Libre Premium | Libre Caslon Display 600 | Work Sans 400 |

A serif faz o trabalho de impacto. A sans só serve o corpo.

**Escala fixa:**
- Hook (slide 1): 110px / 700 / serif / line-height 1.0 / letter-spacing -1px
- Título de seção: 78px / 700 / serif / line-height 1.05
- Subtítulo: 42px / 600 / serif / line-height 1.15
- Tag editorial em itálico: 28px / 400 italic / serif (ex: `[Para modelar, não copiar]`)
- Corpo: 34px / 400 / sans / line-height 1.45
- Lista: 36px / 400 / sans / line-height 1.5
- Número grande: 160px / 700 / serif / line-height 1

## Sistema de margens, REGRA CRÍTICA

Aplica a MESMA regra do Clínico Branco. O carrossel é feito pra ser **impulsionado como anúncio**, então simetria total é obrigatória.

```
SAFE_MARGIN = 100px (4 lados, sem variação)
```

- `padding: 100px` nos 4 lados de TODO slide. Sem variação entre slides do mesmo carrossel.
- `justify-content: center` (vertical) + `align-items: center` (horizontal). Sempre.
- Conteúdo dentro de container interno com `max-width` controlado, dimensionado pelo elemento mais largo:

| Elemento mais largo | `max_width` |
|---|---|
| Hook serif 100-130px | 880px |
| Título de seção serif 64-78px | 780px |
| Só texto até 44px (lista, virada) | 640-700px |
| Número gigante serif (140-220px) | 880px com `text-align: center` |

- Use `make_symmetric_slide()` do `build_carousel.py`.
- **Proibido `position: absolute` pra elementos de conteúdo.** Tudo no fluxo normal centralizado.
- **Proibido `flex-end` ou `flex-start`.** Sempre `center` nos dois eixos.

## Layout por tipo de slide

### Hook, postura criativa antes de qualquer template

**O default do hook Editorial é tipografia serif pura.** Sem ilustração, sem ícone, sem decoração. Apenas o título serif gigante + espaço negativo brutal. Editorial pesa por si, qualquer adição compete com a serif e diminui o impacto.

Antes de escolher o layout do slide 1, leia a copy e pergunte: **qual versão amplifica essa frase específica?** Editorial tem repertório próprio:

- **Padrão centralizado**, frase serif gigante centralizada, tag em itálico acima. O default pra 80% dos casos. Vibe revista impressa.
- **Citação literária com aspas**, aspas tipográficas grandes em ACCENT antes da frase. Quando o hook é literalmente uma fala ou pensamento.
- **Número-anchor serif**, número gigante (160-220px) em serif com label embaixo. Quando o hook gira em torno de um valor: "R$16.400 em 9 dias".
- **Citação atribuída**, frase em itálico + linha divisória 1px ACCENT + nome em sans pequena embaixo. Quando o hook é depoimento real.
- **Imagem de fundo (raro)**, quando o usuário sobe foto/print, a imagem cobre o slide com overlay creme `rgba(245,242,236,0.6)` e texto serif por cima.

**Ilustração no hook Editorial é exceção.** A serif gigante e a ilustração competem por gravidade. Só use se o usuário pediu explicitamente. Mesmo nesse caso, mantém estrutura simétrica: ilustração centralizada acima do título, dentro do mesmo container interno (não use `position: absolute`).

#### Anatomia do default (centralizado simétrico)
- `make_symmetric_slide(bg_color="#0A0908", max_width=880, text_align="left")`
- Estrutura vertical dentro do bloco: tag → margem 50px → título
- Tag em itálico 28px / serif / TEXT
- Título serif 100-130px / 700 / line-height 1.0 / letter-spacing -1px
- Cor de destaque em 2-3 palavras-chave do título
- Nada além de tag + título. Sem corpo. Sem botão.

### Problema
- `make_symmetric_slide(bg_color="#0A0908", max_width=780, text_align="left")`
- Vertical: SEMPRE `center` (já vem do helper)
- Texto serif em 2 blocos curtos separados por linha em branco
- Pode ter ilustração line-art creme acima do texto, dentro do bloco, centralizada
- Tamanho do texto: 38-44px / serif / 400 / line-height 1.4

### Virada
- `make_symmetric_slide(bg_color="#0A0908", max_width=720, text_align="left")`
- Frase única em serif, máximo 14 palavras
- 60-78px / 700 / serif / line-height 1.1
- Itálico permitido pra tom literário
- Sem nada em volta. Slide minimalista.

### Método/Conteúdo
- `make_symmetric_slide(bg_color="#0A0908", max_width=780, text_align="left")`
- Estrutura vertical: título de seção → margem 50px → lista
- Título de seção: 56-72px / serif / 700 / cor ACCENT
- Lista com travessões `–` (não bullets) em ACCENT, 36-40px / sans / 400
- Cada item alinhado verticalmente com o travessão
- Frase de fechamento opcional embaixo, em ACCENT

### Prova
- `make_symmetric_slide(bg_color="#0A0908", max_width=880, text_align="center")`
- Número gigante serif 160-220px em TEXT (creme)
- Label embaixo em sans pequena 28-32px / 500 / ACCENT
- Linha fina divisória 1px ACCENT, 80px de largura, entre número e label
- Tudo centralizado horizontal porque é número (variação centralizada)

### CTA
- `make_symmetric_slide(bg_color="#0A0908", max_width=820, text_align="center")`
- Comando em serif 60-80px / 700 / TEXT
- Margem 60px
- Botão centralizado com borda 2px ACCENT, texto ACCENT, fundo transparente
- Padding interno do botão: 22px 44px
- Border-radius do botão: 4px (mais quadrado que Clínico)
- Tipografia DENTRO do botão é sans bold 28px

## Elementos permitidos

- Texto serif + sans
- Tags em itálico no topo (entre colchetes)
- Listas com travessões `–` (en-dash, não hífen, não em-dash)
- Ilustrações line-art em creme (#F5F2EC) com detalhes ACCENT
- Botão de CTA com borda fina
- Linha divisória 1px ACCENT
- Sublinhado fino abaixo de palavras-chave (1.5px ACCENT)

## Elementos proibidos

- Sans no heading (sempre serif no heading)
- Bullets pretos ou ●
- X vermelho-coral (NEGATIVE), não pertence a essa família
- Cores frias se possível
- Setas manuscritas (vai pra Manuscrito Cru)
- Sombras
- Gradientes

## Ilustrações nessa família

Quando o usuário escolhe "gerar ilustração", aqui as regras são:
- Stroke creme (#F5F2EC), 2px
- Sem preenchimento
- Detalhes pequenos em ACCENT (ex: pasta laranja, telefone laranja)
- Tamanho: nunca mais que 35% da altura do slide
- Posição: topo direito ou rodapé direito
- Personagem: sempre estilizado, nunca realista

## Exemplo de HTML de um slide Hook

```html
<div class="slide" style="
  width: 1080px;
  height: 1350px;
  background: #0A0908;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 100px;
  font-family: 'Inter', sans-serif;
  box-sizing: border-box;
">
  <span style="
    font-family: 'Playfair Display', serif;
    font-size: 28px;
    font-style: italic;
    color: #F5F2EC;
    margin-bottom: 40px;
  ">[Para modelar, não copiar]</span>

  <h1 style="
    font-family: 'Playfair Display', serif;
    font-size: 110px;
    font-weight: 700;
    line-height: 1.0;
    letter-spacing: -1px;
    color: #F5F2EC;
    margin: 0;
  ">Guia<br><span style="color:#C8741A;">disponível</span></h1>
</div>
```

## Quando NÃO usar Editorial Preto

- Conteúdo casual ou divertido → Manuscrito Cru combina mais
- Listas longas e estruturadas → Clínico Branco respira melhor
- Quando o usuário quer "leveza" → preto pesa demais
