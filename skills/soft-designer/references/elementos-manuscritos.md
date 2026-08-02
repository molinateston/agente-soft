# Elementos Manuscritos

SVGs inline pra setas, sublinhados, círculos e marcas que parecem desenhadas à mão. Use principalmente na família **Manuscrito Cru**, mas também em casos específicos das outras famílias (raro).

Cada SVG abaixo recebe `{ACCENT}` como placeholder de cor, substitua pelo hex real antes de inserir no HTML.

## 1. Sublinhado curvo (sob palavra-chave)

Coloque dentro de um `<span>` posicionado relativo, com o SVG absoluto embaixo:

```html
<span style="position: relative; display: inline-block;">
  PALAVRA
  <svg style="position: absolute; left: 0; bottom: -12px; width: 100%; height: 18px;"
       viewBox="0 0 300 18" preserveAspectRatio="none">
    <path d="M2 9 Q 75 2, 150 9 T 298 9"
          stroke="{ACCENT}" stroke-width="6" fill="none" stroke-linecap="round"/>
  </svg>
</span>
```

**Variação mais reta (menos curva):**
```html
<svg style="position: absolute; left: 0; bottom: -10px; width: 100%; height: 12px;"
     viewBox="0 0 300 12" preserveAspectRatio="none">
  <path d="M5 6 Q 80 3, 160 7 T 295 6"
        stroke="{ACCENT}" stroke-width="5" fill="none" stroke-linecap="round"/>
</svg>
```

**Variação dupla (linha embaixo + linha menor):**
```html
<svg style="position: absolute; left: 0; bottom: -16px; width: 100%; height: 22px;"
     viewBox="0 0 300 22" preserveAspectRatio="none">
  <path d="M2 8 Q 75 2, 150 8 T 298 8"
        stroke="{ACCENT}" stroke-width="5" fill="none" stroke-linecap="round"/>
  <path d="M40 18 Q 100 14, 180 18 T 260 18"
        stroke="{ACCENT}" stroke-width="3" fill="none" stroke-linecap="round"/>
</svg>
```

## 2. Círculo desenhado (em volta de palavra)

```html
<span style="position: relative; display: inline-block; padding: 8px 20px;">
  PALAVRA
  <svg style="position: absolute; left: 0; top: 0; width: 100%; height: 100%;"
       viewBox="0 0 200 80" preserveAspectRatio="none">
    <path d="M 100 8 Q 180 8, 192 40 Q 192 72, 100 72 Q 8 72, 8 40 Q 8 12, 100 8 Z"
          stroke="{ACCENT}" stroke-width="5" fill="none" stroke-linecap="round"/>
  </svg>
</span>
```

## 3. Seta curva (de A pra B)

Apontando da esquerda pra direita, suavemente curvada pra baixo:

```html
<svg width="280" height="100" viewBox="0 0 280 100" style="position: absolute;">
  <path d="M 20 20 Q 140 90, 250 50"
        stroke="{ACCENT}" stroke-width="5" fill="none" stroke-linecap="round"/>
  <!-- Cabeça da seta -->
  <path d="M 240 38 L 252 50 L 238 60"
        stroke="{ACCENT}" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
```

**Seta curta apontando pra direita (estilo "↗"):**
```html
<svg width="120" height="60" viewBox="0 0 120 60">
  <path d="M 10 30 Q 60 10, 105 30"
        stroke="{ACCENT}" stroke-width="5" fill="none" stroke-linecap="round"/>
  <path d="M 95 18 L 108 30 L 92 38"
        stroke="{ACCENT}" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
```

**Seta apontando pra baixo:**
```html
<svg width="60" height="120" viewBox="0 0 60 120">
  <path d="M 30 10 Q 50 60, 30 100"
        stroke="{ACCENT}" stroke-width="5" fill="none" stroke-linecap="round"/>
  <path d="M 18 88 L 30 105 L 42 88"
        stroke="{ACCENT}" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
```

## 4. Asterisco / marca de destaque

```html
<svg width="40" height="40" viewBox="0 0 40 40">
  <path d="M 20 5 L 20 35 M 5 20 L 35 20 M 9 9 L 31 31 M 31 9 L 9 31"
        stroke="{ACCENT}" stroke-width="3" stroke-linecap="round"/>
</svg>
```

## 5. Selo verificado azul (para avatar do Manuscrito Cru)

Cor fixa, NÃO usa `{ACCENT}`:

```html
<svg width="32" height="32" viewBox="0 0 24 24" fill="#1DA1F2">
  <path d="M22.5 12.5c0-1.58-.875-2.95-2.148-3.6.154-.435.238-.905.238-1.4 0-2.21-1.71-3.998-3.818-3.998-.47 0-.92.084-1.336.25C14.818 2.415 13.51 1.5 12 1.5s-2.816.917-3.437 2.25c-.415-.165-.866-.25-1.336-.25-2.11 0-3.818 1.79-3.818 4 0 .494.083.964.237 1.4-1.272.65-2.147 2.018-2.147 3.6 0 1.495.782 2.798 1.942 3.486-.02.17-.032.34-.032.514 0 2.21 1.708 4 3.818 4 .47 0 .92-.086 1.335-.25.62 1.334 1.926 2.25 3.437 2.25 1.512 0 2.818-.916 3.437-2.25.415.163.865.248 1.336.248 2.11 0 3.818-1.79 3.818-4 0-.174-.012-.344-.033-.513 1.158-.687 1.943-1.99 1.943-3.484zm-6.616-3.334l-4.334 6.5c-.145.217-.382.334-.625.334-.143 0-.288-.04-.416-.126l-.115-.094-2.415-2.415c-.293-.293-.293-.768 0-1.06s.768-.294 1.06 0l1.77 1.767 3.825-5.74c.23-.345.696-.436 1.04-.207.346.23.44.696.21 1.04z"/>
</svg>
```

## 6. X de negação (lista de "o que parar de fazer")

Cor fixa #E63946, NÃO usa `{ACCENT}`:

```html
<svg width="36" height="36" viewBox="0 0 36 36">
  <circle cx="18" cy="18" r="16" fill="none" stroke="#E63946" stroke-width="3"/>
  <path d="M 11 11 L 25 25 M 25 11 L 11 25"
        stroke="#E63946" stroke-width="4" stroke-linecap="round"/>
</svg>
```

## 7. Check verde (lista de "o que fazer")

```html
<svg width="36" height="36" viewBox="0 0 36 36">
  <path d="M 6 18 L 14 26 L 30 10"
        stroke="#22C55E" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
```

## Regras de uso

1. **Máximo 1 elemento manuscrito por slide.** Mais que isso vira poluição.
2. **Substitua `{ACCENT}` pelo hex real antes de inserir** no HTML. Nunca deixe placeholder.
3. **Sublinhados sempre embaixo de 1-2 palavras**, nunca embaixo de uma frase inteira.
4. **Setas precisam ter destino claro**, não use seta apontando pro nada.
5. **Círculo desenhado é a marca mais forte**, use só na palavra mais crítica de todo o carrossel, ideal no slide de virada ou hook.
