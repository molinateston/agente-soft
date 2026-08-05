# Contraste e Cor

Paleta segura, cores banidas e como garantir legibilidade no mobile.

---

## Padrão WCAG AA (mínimo obrigatório)

Contraste mínimo entre texto e fundo:
- **Corpo de texto:** 4.5:1
- **Títulos grandes (24px+):** 3:1
- **Texto desabilitado/inativo:** pode ser menor, mas evitar usar

Validar em ferramenta antes de aprovar:
- WebAIM Contrast Checker (webaim.org/resources/contrastchecker)
- Coolors Contrast Checker
- Chrome DevTools accessibility tab

---

## Combinações seguras (sempre passam WCAG AA)

### Sobre fundo branco (#FFFFFF)
- Preto puro (#000000) ✅ contraste 21:1
- Near-black (#0A0908, #111111, #1A1A1A) ✅ contraste 18:1+
- Cinza escuro (#222, #333) ✅ contraste 12:1+

### Sobre fundo preto (#000000)
- Branco puro (#FFFFFF) ✅
- Off-white (#F5F5F5, #FAFAFA) ✅
- Cinza claro pra elementos secundários (#CCCCCC, #DDDDDD) ✅

### Sobre fundo creme (#F8F4ED, #FAF5EC)
- Preto (#0A0908) ✅
- Marrom escuro (#3A2E26) ✅
- Verde escuro (#1F3D2B) ✅

---

## Combinações PROIBIDAS

### Sobre branco
- Cinza claro (#999, #BBB) ❌ contraste 2.8:1
- Cinza médio (#666) ❌ contraste 5.7:1 - limite, mas evitar pra corpo
- Bege, tons pastel ❌
- Amarelo claro (#FFFF00 etc) ❌

### Sobre preto
- Cinza escuro (#333, #444) ❌ - contraste insuficiente
- Texto com ruído / cinza reticulado ❌
- Cinza médio (#888) ❌ contraste 3.5:1 - limite

### Sobre fundo com gradiente
- Texto sem caixa de contraste ❌ - uma parte fica ilegível
- Texto branco sobre gradiente claro ❌

### Sobre foto/imagem
- Texto direto sem overlay escuro ❌
- Texto branco sobre céu azul-claro ❌

---

## Acento de cor (cor singular)

Quando usar acento (laranja queimado #D4541C, verde esmeralda, etc):

### Usar pra
- Botão CTA primário
- Link em texto
- Bullet point destacado
- Ícone funcional
- Bordas decorativas

### Não usar pra
- Corpo de texto longo (cansa)
- Título inteiro em cor (perde hierarquia)
- Fundo de bloco grande (esmaga conteúdo)

### Regra
Acento aparece em 5-15% do design. Mais que isso, vira ruído.

Garantir contraste 4.5:1 do acento com o fundo onde aparece.

---

## Paleta Soft padrão (sugerida)

### Esquema 1 - Editorial branco (limpo)
- Background: #FFFFFF
- Texto principal: #0A0908
- Texto secundário: #555555
- Acento: #D4541C (laranja queimado)

### Esquema 2 - Preto absoluto (contundente)
- Background: #000000
- Texto principal: #FFFFFF
- Texto secundário: #AAAAAA
- Sem acento (contraste por peso/tamanho)

### Esquema 3 - Creme + escuro (warm)
- Background: #F8F4ED
- Texto principal: #0A0908
- Texto secundário: #5A5048
- Acento: #1F3D2B (verde escuro)

---

## Cores BANIDAS pra cliente Soft

Cores que comunicam "creator genérico":

- Neon (verde-limão fluo, rosa choque, azul piscina)
- Gradientes complexos (3+ cores se misturando)
- Cor por cima de imagem sem overlay
- Tons pastel infantis (rosa bebê, lilás claro, amarelo banana)
- Branco com tons saturados em alto contraste decorativo

Excessões raras: quando faz parte da identidade declarada do cliente (mas verificar se não destoa).

---

## Modo claro vs modo escuro

A maioria das landing pages funciona em modo claro.

Modo escuro funciona pra:
- Tema técnico (dev, dados, tecnologia)
- Estética minimalista contundente
- Vibe noturna proposital

Decidir cedo. Não misturar - página dividida (parte clara, parte escura) cansa o olho.

---

## Cor pra estado de elementos interativos

Botões precisam de 3 estados visíveis:

1. **Default** - cor base
2. **Hover** (desktop) - cor levemente diferente (mais escura ou clara)
3. **Active** - cor da pressão (geralmente mais escura)

Link em texto:
- Default: cor de acento
- Hover: underline ou cor mais escura
- Visited: opcional, geralmente cor levemente esmaecida

---

## Acessibilidade além de contraste

Considerar também:

### Daltonismo
~8% dos homens têm daltonismo (geralmente vermelho/verde).

Não confiar SÓ na cor pra comunicar:
- "Verde = sucesso, vermelho = erro" → adicionar ícone (✓ vs ✗)
- "Botão verde = comprar" → texto claro no botão ("COMPRAR")

### Baixa visão
Mesmo com contraste OK, texto muito pequeno cansa visão diminuída. Manter mínimos tipográficos.

---

## Cores que comunicam algo (semântica)

### Vermelho
Urgência, erro, atenção, paixão. Cuidado com excesso - vira agressivo.

### Verde
Sucesso, finanças, natureza, "go". Cuidado com tom (verde-limão fluo é diferente de verde-floresta).

### Azul
Confiança, tecnologia, distância profissional. Cor mais usada no mundo corporativo - pode soar genérica.

### Amarelo
Energia, alerta, otimismo. Difícil de ler sobre branco (precisa de fundo escuro).

### Laranja
Energia controlada, ação. Forte em CTAs. D4541C é um vermelho queimado (tom de exemplo).

### Preto e Branco
Contraste máximo, elegância, autoridade. Padrão Soft.

---

## Quando o cliente tem identidade visual prévia

Se o cliente já tem cores da marca:
1. Validar contraste das cores existentes
2. Se algo falha WCAG, ajustar (escurecer texto, clarear fundo)
3. Manter a paleta mas com legibilidade garantida
4. Documentar versão "ajustada pra mobile" pra cliente saber

---

## Checagem de contraste e cor

1. [ ] Contraste texto/fundo passa WCAG AA (4.5:1 pra corpo)?
2. [ ] Cinza claro ou cinza médio sobre branco está PROIBIDO?
3. [ ] Cinza escuro sobre preto está PROIBIDO?
4. [ ] Acento de cor aparece em 5-15% do design (não mais)?
5. [ ] Botões têm 3 estados visíveis (default, hover, active)?
6. [ ] Nenhuma cor neon ou pastel infantil?
7. [ ] Nenhum gradiente complexo que atrapalha leitura?
8. [ ] Validado em ferramenta (WebAIM Contrast Checker)?

Se falhar, ajusta antes de aprovar.
