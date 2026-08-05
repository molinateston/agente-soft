# Espaçamento e Layout

Line-height, margens, padding, hierarquia visual. O respiro que torna a peça legível no mobile.

---

## Line-height (entrelinhamento)

### Corpo de texto
**1.5 a 1.7**

Linha colada cansa. Linha muito espaçada quebra fluxo de leitura.

### Títulos
**1.1 a 1.3**

Títulos pedem entrelinhamento mais compacto pra terem "peso" visual.

### CTAs (botões)
**1.2**

Sem espaço excessivo no botão.

### Caption / texto pequeno
**1.4 a 1.5**

---

## Margem entre elementos

### Parágrafo pra parágrafo
**16-24px**

Espaço claro mas sem buraco.

### Bloco pra bloco
**64px mínimo no mobile**

Cada bloco (cada seção da página) precisa ser claramente separado do próximo.

### Seção pra seção
**80-120px**

Páginas precisam de respiração entre grandes blocos temáticos.

### Imagem pra texto
**32-48px**

Foto, gráfico ou ícone tem espaço claro com o texto que o cerca.

---

## Margens laterais

### Mobile
**24px mínimo das bordas**

Nunca texto colado na borda da tela.

### Desktop
**Max-width 720-800px centralizado**

Largura máxima do conteúdo. Em telas grandes, texto não estica até as bordas (vira ilegível).

---

## Padding em elementos

### Botões CTAs
**16-24px vertical + 32-48px horizontal**

Botão precisa "respirar" pra parecer clicável.

### Cards
**24-32px de padding interno**

Card sem padding gruda conteúdo nas bordas.

### Bullets
Espaço entre cada bullet: **8-12px**

Bullets colados viram parede de texto.

### Inputs (formulário)
**12-16px de padding interno**

Campo apertado parece amador.

---

## Densidade de texto

### Parágrafos
- Mobile: **1 a 3 frases por parágrafo**, raramente 4
- Quebra clara entre parágrafos
- Nenhum bloco excede 5 linhas seguidas sem respiro
- Bullets sempre com espaço entre eles

### Largura de linha
- Desktop: **máximo 65 caracteres por linha**
- Mobile: **quebra natural em 6-10 palavras por linha**

Se em mobile uma linha tem 12+ palavras seguidas, fonte tá pequena ou viewport errada.

---

## Hierarquia visual

Uma página tem 4 camadas claras:

1. **Hero** (acima da dobra)
2. **Blocos de conteúdo** (com H2 + texto)
3. **Bloco final** (CTA + fechamento)
4. **Rodapé** (links, copyright)

Cada camada com peso visual diferente:
- Hero: maior tipografia, mais espaço, CTA visível
- Blocos: tipografia média, alternância clara
- Final: CTA destacado, fechamento limpo
- Rodapé: pequeno mas legível (16px+)

---

## Alinhamento

### Regra geral
**Left-aligned (alinhamento à esquerda)** funciona pra 95% dos casos.

### Quando usar center
- H1 do hero (opcional)
- CTA único centralizado
- Quote / frase isolada que pede peso

### Quando usar right
Praticamente nunca em corpo. Só em metadata (ex: "data" em coluna direita de notícia).

### Justified
**EVITAR.** Cria buracos brancos entre palavras. Cansa leitura.

---

## Layout em colunas

### Mobile
**1 coluna sempre.**

Nunca tentar layout em 2 colunas no mobile. Vira ilegível.

### Desktop
2 colunas pode funcionar quando:
- Comparação ("pra você se" / "não é pra você")
- Antes vs depois
- Bullets curtos pareados

NUNCA 3+ colunas em página de venda. Vira tabela visual confusa.

---

## Imagens

### Tamanhos relativos
Imagens dentro de texto = no máximo **60-70% da largura do bloco**.

Imagens "hero" no topo de página = **100% da largura** (full-bleed) ou **80%** com margem.

### Proporção
- 16:9 pra vídeo
- 4:5 pra Instagram (post)
- 1:1 pra grid de Instagram
- 9:16 pra story / reel
- 3:2 ou 4:3 pra foto pessoal

### Alt text
Sempre. Imagem sem alt text = acessibilidade ruim + SEO ruim.

---

## Espaço em branco (negativo)

### Princípio fundador
Espaço em branco NÃO é desperdício. É design.

Página com bloco-bloco-bloco-bloco sem respiro cansa antes de ler.

Página com respiro generoso parece premium e dá tempo da mensagem assentar.

### Quanto espaço
Regra: pelo menos **30% da página é espaço em branco**.

Se a sua arte tem texto e elementos cobrindo 80%+ da tela, ajusta.

---

## Hierarquia por escala (ratio)

Princípio: cada nível hierárquico tem tamanho proporcional ao próximo.

Exemplo:
- H1: 48px
- H2: 32px (48 × 0.67)
- H3: 24px (32 × 0.75)
- Corpo: 18px (24 × 0.75)

Manter ratios consistentes faz a hierarquia ser "sentida" mesmo sem ler.

Escalas comuns:
- 1.25 (suave, elegante)
- 1.333 (clássica)
- 1.5 (impactante)
- 1.618 (golden ratio)

Escolher uma e aplicar consistente.

---

## Grid e estrutura

### Container
Largura máxima definida (geralmente 1200px ou 1440px no desktop).

### Padding lateral
24px mobile, 48-80px desktop.

### Gutter (espaço entre colunas)
16-32px no desktop. No mobile (1 coluna) não se aplica.

### Vertical rhythm
Manter espaçamentos múltiplos de uma unidade base (8px ou 16px).

Exemplo:
- Bloco pra bloco: 64px (8 × 8)
- Parágrafo pra parágrafo: 24px (8 × 3)
- Texto pra imagem: 32px (8 × 4)

Consistência cria sensação de design pensado.

---

## Sticky elements (elementos fixos)

### CTAs sticky
Pode funcionar bem (botão fixo no rodapé que segue o scroll).

### Headers sticky
Funcionam mas ocupam espaço. No mobile, manter no máximo 56px de altura.

### Pop-ups
**Geralmente PROIBIDOS em página de vendas Soft.**

Pop-up que cobre tela inteira = abandono garantido.

Exceções:
- Exit-intent (quando o usuário move o mouse pra fechar a aba)
- Confirmação de inscrição
- Modal funcional (calendário, formulário)

---

## Elementos PROIBIDOS no mobile

### Estruturalmente
- Tabelas complexas (substitui por listas)
- Carrosséis dentro da página (atrapalham scroll)
- Sidebars (não funcionam no mobile)
- Multi-coluna que vira ilegível

### Visualmente
- Imagens com texto embutido pequeno
- Fontes decorativas pra corpo de texto
- Texto sobre imagens com baixo contraste
- Cores neon ou saturadas demais

### Comportamento
- Pop-ups que cobrem tela inteira
- Autoplay de vídeo com som
- Fixed nav que ocupa 30%+ da tela
- Botões que reposicionam ao scrollar

---

## Checagem de espaçamento e layout

1. [ ] Line-height do corpo entre 1.5 e 1.7?
2. [ ] Margens laterais ≥ 24px no mobile?
3. [ ] Bloco pra bloco ≥ 64px de espaço?
4. [ ] Largura de linha ≤ 65 caracteres no desktop?
5. [ ] Parágrafos ≤ 5 linhas sem respiro?
6. [ ] Espaço em branco ≥ 30% da página?
7. [ ] Alinhamento à esquerda (95% dos casos)?
8. [ ] 1 coluna no mobile?
9. [ ] Vertical rhythm consistente?
10. [ ] Pop-ups proibidos ausentes?

Se falhar, ajusta.
