# Setinha de arraste

Elemento visual fixo, obrigatório em todos os slides **exceto o último**. Indica continuação do carrossel de forma minimalista, sem quebrar a limpeza das 3 famílias.

## Regra dura

- Aparece em **todos os slides de 1 a N-1**
- **Nunca** aparece no último slide (CTA final)
- Posição fixa: canto inferior direito
- Distância: 60px da borda direita, 60px da borda inferior
- Cor: mesma cor do texto principal da família (Editorial Preto → `#F5F2EC`, Clínico Branco → `#0A0908`, Manuscrito Cru → depende do fundo)
- **Não usa accent color**, setinha é estrutural, não decorativa

## Padrão global (variação C), seta SVG manuscrita centralizada

**Esta é a única variação válida a partir de agora.** A setinha `›` no canto inferior direito está deprecated.

O padrão aplica em todos os slides 1 a N-1, em todas as famílias:

1. **Handle `@`**, centralizado, bottom 140px, Inter 500, 22px, cor do texto principal do slide
2. **Seta SVG variação C**, centralizada, bottom 80px, 160px de largura

```html
<!-- Handle -->
<div style="position: absolute; bottom: 140px; left: 50%; transform: translateX(-50%);
  font-family: 'Inter', sans-serif; font-size: 22px; font-weight: 500;
  color: #0A0A0A; white-space: nowrap;">@handle</div>

<!-- Seta variação C -->
<svg style="position: absolute; bottom: 80px; left: 50%; transform: translateX(-50%);
  width: 160px; color: #0A0A0A;" viewBox="0 0 180 40" xmlns="http://www.w3.org/2000/svg">
  <path d="M5 20 L165 20 M150 8 L170 20 L150 32"
        stroke="currentColor" stroke-width="3"
        fill="none" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
```

**Slide 1 (hook):** o handle aparece também no topo do bloco de conteúdo, acima do título, em substituição à tag de contexto. Cor `#6B6B6B`, peso 500, sem uppercase, sem letter-spacing.

```html
<!-- Handle no topo do slide 1, dentro do container interno -->
<p style="font-size: 22px; font-weight: 500; color: #6B6B6B; margin-bottom: 52px;">@handle</p>
```

**Último slide (CTA):** sem seta, sem handle no rodapé. O CTA fala por si.

## Exceção ao `position: absolute`

Esta é a **única exceção permitida** à regra 13 do SKILL.md que proíbe `position: absolute` para elementos de conteúdo. A setinha é **elemento estrutural**, não conteúdo, por isso escapa. Nenhum outro elemento do slide pode usar absolute.

## Cor por família

| Família | Cor da seta e handle |
|---|---|
| Editorial Preto | branco `#F5F2EC` |
| Clínico Branco | preto `#0A0908` |
| Manuscrito Cru (fundo preto) | branco `#F5F2EC` |
| Manuscrito Cru (fundo branco) | preto `#0A0908` |
| Layout Utilitário | preto `#0A0908` |

## Auditoria

Item 9 do `auditoria-pre-preview.md`:

> Slides 1 a N-1: seta SVG variação C no rodapé (bottom 80px) + handle centralizado (bottom 140px) + handle no topo do slide 1. Último slide: sem seta, sem handle no rodapé. Qualquer `›` no canto = falha.

## Nota histórica

A regra original proibia "seta swipe", o alvo era seta genérica colorida de template Canva no meio do slide. Esta seta SVG estrutural, centralizada, tipográfica, não contradiz esse espírito. A proibição continua valendo para setas decorativas.
