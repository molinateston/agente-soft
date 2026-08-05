# Família Visual: Manuscrito Cru

A família mais íntima. Para confissão, vulnerabilidade, "eu já estive aí". Sans pesada com elementos manuscritos: setas curvas, sublinhados desenhados, círculos em volta de palavras. Fundo pode ser preto OU branco.

## Identidade

Manuscrito Cru parece um print de tweet emocional misturado com bloco de anotações. É o estilo que diz "isso aqui é real, não é marketing".

Funciona melhor pra: storytelling pessoal, confissão de erro, antes/depois honesto, conteúdo de vulnerabilidade, slides com avatar de "@usuário" simulando print de rede social.

## Sistema de cores

```
BG          = #FFFFFF (versão clara) OU #0A0A0A (versão escura)
TEXT        = #0A0A0A (na clara) OU #F5F5F5 (na escura)
ACCENT      = {cor escolhida pelo usuário, padrões abaixo}
HANDDRAWN   = ACCENT (mesmo tom dos elementos manuscritos)
```

**Cores de destaque típicas dessa família:**
- Vermelho coral #E63946 (sublinhado de ênfase)
- Magenta #C026D3 (estilo Instagram nativo)
- Verde lime #84CC16 (positivo, prova social)
- Azul forte #2563EB (autoridade calma)

A cor escolhida vira tanto a cor de destaque das palavras quanto a cor dos elementos manuscritos (sublinhados, setas, círculos).

## Tipografia

Sans pesada, igual Clínico Branco. NUNCA serif aqui, quebra o tom de "anotação rápida".

**Combinações recomendadas:**

| Nome | Heading | Body |
|---|---|---|
| Inter Pesado | Inter 800 | Inter 500 |
| SF Style | Plus Jakarta Sans 800 | Plus Jakarta Sans 500 |
| Anotação | Bricolage Grotesque 800 | Bricolage Grotesque 500 |

**Escala fixa:**
- Hook (slide 1): 84px / 800 / line-height 1.1
- Título de seção: 60px / 800 / line-height 1.15
- Corpo principal: 42px / 500 / line-height 1.4 (mais pesado que Clínico)
- Subtexto: 36px / 500 / line-height 1.45
- Avatar handle: 32px / 700 (nome) + 26px / 500 (@handle)

**Importante: o corpo aqui é 500 (medium), não 400.** Isso dá peso de "frase escrita com convicção" ao invés de "texto corporativo".

## Elementos manuscritos (assinatura dessa família)

Esses elementos são o que define a Manuscrito Cru. Sempre presentes em pelo menos 30% dos slides.

Carregue `references/elementos-manuscritos.md` pra pegar os SVGs. Os 4 mais usados:

1. **Sublinhado curvo**, embaixo de 1-2 palavras-chave por slide. Stroke 6px, ACCENT.
2. **Círculo desenhado**, em volta de uma palavra crítica. Stroke 5px, ACCENT.
3. **Seta curva**, apontando de um ponto a outro do slide. Stroke 5px, ACCENT.
4. **Asterisco/destaque**, marca pequena ao lado de uma frase. Stroke 4px, ACCENT.

Use no MÁXIMO 1 elemento manuscrito por slide. Mais que isso vira poluição.

## Sistema de margens, REGRA CRÍTICA

Aplica a MESMA regra das outras 2 famílias. O carrossel é feito pra ser **impulsionado como anúncio**, então simetria total é obrigatória.

```
SAFE_MARGIN = 100px (4 lados, sem variação)
```

- `padding: 100px` nos 4 lados de TODO slide. Sem variação entre slides do mesmo carrossel.
- `justify-content: center` (vertical) + `align-items: center` (horizontal). Sempre.
- Use `make_symmetric_slide()` do `build_carousel.py`.
- **`max_width` dimensionado pelo elemento mais largo:**

| Elemento mais largo | `max_width` |
|---|---|
| Hook 80-92px com avatar | 820px |
| Título de seção 60-72px | 760px |
| Só texto até 44px | 640-700px |
| Lista de anos+valores (prova) | 720px |

- **Proibido `position: absolute` pra elementos de conteúdo.** Tudo no fluxo normal centralizado.
- **Proibido `flex-end` ou `flex-start`.** Sempre `center` nos dois eixos.
- O avatar bloco é parte do fluxo normal: vai ACIMA do título, dentro do mesmo container interno, alinhado à esquerda do bloco.

## Layout por tipo de slide

### Hook, postura criativa antes de qualquer template

**O default do hook Manuscrito Cru é avatar bloco + título.** Diferente das outras 2 famílias, aqui o avatar (foto+nome+@handle+selo verificado) **é parte da assinatura visual**, ele simula um print de tweet emocional, e isso É o estilo. Sem o avatar, vira só um Clínico Branco com bullets.

Mas mesmo aqui o default não é regra. Variações possíveis:

- **Avatar tweet padrão**, círculo 90px + nome bold + @handle + selo + título embaixo. Default. Quando a copy é primeira pessoa.
- **Avatar com sublinhado manuscrito**, igual ao padrão, mas com SVG curvo embaixo de 1-2 palavras-chave do título. Quando uma palavra precisa puxar atenção extra.
- **Tipografia pura sem avatar**, quando a frase é universal e impessoal ("Esses são meus resultados no digital"), pode ficar só o título grande sem avatar. Mais raro.
- **Avatar + número grande**, quando o hook é "2024, R$350.000": avatar acima, número gigante abaixo em ACCENT.
- **Imagem de fundo (raro)**, quando o usuário sobe screenshot de conversa ou print de notificação real, a imagem cobre o slide com overlay leve, e o título fica por cima.

**Ilustração line-art no hook Manuscrito é exceção.** Manuscrito tem o avatar como sua "ilustração", adicionar boneco line-art em cima compete e polui. Só use ilustração se o usuário pediu, e mesmo assim mantém estrutura simétrica (ilustração centralizada acima do título, dentro do container interno, sem `position: absolute`).

#### Anatomia do default (avatar tweet padrão)
- `make_symmetric_slide(bg_color="#FFFFFF" ou "#0A0A0A", max_width=820, text_align="left")`
- Estrutura vertical dentro do bloco: avatar → margem 60px → título → opcional sublinhado manuscrito
- **Avatar bloco** (no topo do bloco interno):
  - Círculo 90px com foto do usuário OU iniciais
  - Nome em bold 32px + @handle 26px abaixo
  - Selo de verificado opcional (SVG check azul)
  - Layout horizontal: `display: flex; align-items: center; gap: 24px;`
- **Título** 80-92px / 800 / line-height 1.1
- Opcional: 1 elemento manuscrito (sublinhado, círculo, seta) em palavra-chave do título

### Problema
- `make_symmetric_slide(bg_color, max_width=720, text_align="left")`
- Vertical: SEMPRE center (já vem do helper)
- Lista com bullets pretos pequenos (•)
- Frase final em negrito 800
- Aspas tipográficas se for citação interna ("Por que parece que só eu não consigo?")

### Virada
- `make_symmetric_slide(bg_color, max_width=720, text_align="left")`
- Frase única
- Tamanho: 60-76px / 800 / line-height 1.1
- Círculo desenhado em volta de 1 palavra OU seta apontando pra ela (1 elemento manuscrito só)

### Método/Conteúdo
- `make_symmetric_slide(bg_color, max_width=760, text_align="left")`
- Lista numerada simples (1, 2, 3 ou 1 -, 2 -, 3 -)
- Palavra-chave de cada item em ACCENT
- Tamanho: 36-42px / 500

### Prova
- `make_symmetric_slide(bg_color, max_width=720, text_align="left")`
- Lista de anos + valores (igual ao exemplo "2020 - Zero vendas / 2024 - R$350.000")
- Anos em ACCENT, valores em TEXT
- Cada linha 38-44px / 700
- Sem números gigantes nessa família, aqui prova é narrativa, não estatística

### CTA
- `make_symmetric_slide(bg_color, max_width=820, text_align="left")`
- Título no topo do bloco: "Para liberar seu acesso você deve:" 44-52px / 800
- Margem 50px
- Lista numerada de passos (1 - Me seguir / 2 - Comentar / 3 - Eu envio o link)
- Cada passo: 40-48px / 700
- Palavras-chave em ACCENT (handle, palavra-código, "DM")
- Sem botão necessariamente, o passo-a-passo já é o CTA

## Elementos permitidos

- Avatar bloco no topo (foto + nome + @handle + selo verificado)
- Sublinhados manuscritos
- Círculos desenhados
- Setas curvas
- Asteriscos manuscritos
- Listas numeradas com hífen
- Aspas tipográficas curvas (" ")
- Negrito agressivo

## Elementos proibidos

- Serif (qualquer)
- Tag editorial em colchetes (isso é Editorial Preto)
- Botões com borda fina (isso é Editorial/Clínico)
- Travessões en-dash (isso é Editorial Preto)
- Mais de 1 elemento manuscrito por slide

## Exemplo de HTML de um slide Hook com avatar

```html
<div class="slide" style="
  width: 1080px;
  height: 1350px;
  background: #FFFFFF;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 100px;
  font-family: 'Inter', sans-serif;
  box-sizing: border-box;
">
  <!-- Avatar bloco -->
  <div style="display: flex; align-items: center; gap: 24px; margin-bottom: 80px;">
    <div style="
      width: 90px; height: 90px; border-radius: 50%;
      background: #E63946;
      display: flex; align-items: center; justify-content: center;
      color: #FFF; font-size: 36px; font-weight: 800;
    ">E</div>
    <div>
      <div style="font-size: 32px; font-weight: 700; color: #0A0A0A; display: flex; align-items: center; gap: 12px;">
        Nome do Especialista
        <!-- selo verificado azul -->
        <svg width="28" height="28" viewBox="0 0 24 24" fill="#1DA1F2"><path d="M22.5 12.5c0-1.58-.875-2.95-2.148-3.6.154-.435.238-.905.238-1.4 0-2.21-1.71-3.998-3.818-3.998-.47 0-.92.084-1.336.25C14.818 2.415 13.51 1.5 12 1.5s-2.816.917-3.437 2.25c-.415-.165-.866-.25-1.336-.25-2.11 0-3.818 1.79-3.818 4 0 .494.083.964.237 1.4-1.272.65-2.147 2.018-2.147 3.6 0 1.495.782 2.798 1.942 3.486-.02.17-.032.34-.032.514 0 2.21 1.708 4 3.818 4 .47 0 .92-.086 1.335-.25.62 1.334 1.926 2.25 3.437 2.25 1.512 0 2.818-.916 3.437-2.25.415.163.865.248 1.336.248 2.11 0 3.818-1.79 3.818-4 0-.174-.012-.344-.033-.513 1.158-.687 1.943-1.99 1.943-3.484zm-6.616-3.334l-4.334 6.5c-.145.217-.382.334-.625.334-.143 0-.288-.04-.416-.126l-.115-.094-2.415-2.415c-.293-.293-.293-.768 0-1.06s.768-.294 1.06 0l1.77 1.767 3.825-5.74c.23-.345.696-.436 1.04-.207.346.23.44.696.21 1.04z"/></svg>
      </div>
      <div style="font-size: 26px; font-weight: 500; color: #6B6B6B;">@especialista</div>
    </div>
  </div>

  <h1 style="
    font-size: 84px;
    font-weight: 800;
    line-height: 1.1;
    color: #0A0A0A;
    margin: 0;
  ">Todo dia <span style="position: relative; display: inline-block;">você tenta.<svg style="position: absolute; left: 0; bottom: -10px; width: 100%; height: 18px;" viewBox="0 0 300 18" preserveAspectRatio="none"><path d="M2 9 Q 75 2, 150 9 T 298 9" stroke="#E63946" stroke-width="6" fill="none" stroke-linecap="round"/></svg></span></h1>
</div>
```

## Quando NÃO usar Manuscrito Cru

- Conteúdo muito técnico / passo-a-passo longo → Clínico Branco organiza melhor
- Posicionamento premium / oferta cara → Editorial Preto tem mais autoridade
- Quando não tem elemento humano (foto/avatar/história pessoal), perde a alma
