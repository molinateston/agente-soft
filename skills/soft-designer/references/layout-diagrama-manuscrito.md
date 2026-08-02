# Layout Diagrama Manuscrito

Variação de layout `metodo` inspirada em fluxos manuscritos, numeração circulada, setas pretas desenhadas à mão, screenshots reais como nós do fluxo, handle no rodapé. Referência visual: posts de @pszucks e similares que usam Instagram como "whiteboard de método".

## Quando usar

- Slide de **método** ou **fluxo de processo** (etapas numeradas conectadas)
- Quando a copy descreve 3-5 etapas que **conectam** umas nas outras (não lista independente)
- Quando o usuário escolheu "Diagrama Manuscrito" na pergunta D
- Especialmente forte para explicar sistemas, funis, arquiteturas

## Quando NÃO usar

- Lista de itens independentes (usa `lista-substitui` ou `metodo` padrão)
- Slides de hook, problema, virada, prova, oferta, CTA
- Quando você tem mais de 5 etapas (diagrama fica ilegível em 1080×1350)

## Anatomia

```
┌─────────────────────────────────────┐
│                                     │
│  Título do Método                   │ ← sans pesada, aplica escala
│  Subtítulo explicativo              │
│                                     │
│                                     │
│  (01)────→(02)────→(03)────→ $      │ ← nós + setas SVG manuscritas
│            │                        │
│            ↓                        │
│           (04)                      │
│                                     │
│                                     │
│                                     │
│                                     │
│         @handle                     │ ← handle no rodapé central
│         ══════════════→             │ ← seta grande variação C
└─────────────────────────────────────┘
```

## Especificação técnica

**Fundo:** branco `#FFFFFF` (diagrama exige fundo claro, aceita também `#F5F2EC` se a família escolhida for Editorial Preto invertida, mas o default é branco puro).

**Título:**
- Inter Tight 700 ou Inter 800
- Aplica `escala-densidade.md`
- Alinhamento: left
- Padding top: 100px

**Subtítulo (opcional):**
- Inter 400
- 32-38px
- Cor `#666666`
- Margin top: 16px do título

**Nós do diagrama:**

Cada nó é um círculo numerado ou um mini-card de imagem:

```css
.no-diagrama {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  background: #0A0908;
  color: #FFFFFF;
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: 'Inter', sans-serif;
  font-weight: 600;
  font-size: 20px;
}
```

Numeração sempre em formato `01`, `02`, `03` (zero-padding 2 dígitos).

**Screenshots reais como nós:**
- Aceitos como alternativa ao círculo numerado
- Vem via upload do especialista no briefing, inseridos como base64
- Formato: 140x200px ou 160x160px, sem border-radius, com sombra sutil `box-shadow: 0 2px 8px rgba(0,0,0,0.15)` (exceção documentada à regra "sem sombra")

**Setas manuscritas entre nós:**

SVG path com estilo imperfeito, não linha reta perfeita. Exemplo:

```html
<svg viewBox="0 0 120 40" xmlns="http://www.w3.org/2000/svg">
  <path d="M5 22 Q 40 18, 80 21 T 110 20 M95 12 L112 20 L95 28" 
        stroke="#0A0908" stroke-width="3" 
        fill="none" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
```

A curva `Q` + `T` dá leve irregularidade manuscrita. Nunca use linhas retas `M...L` sem curva, parece diagrama de software, não manuscrito.

**Handle no rodapé:**
- Centralizado
- Inter 500, 22px
- Cor `#0A0908`
- Posição: bottom 140px (acima da seta grande)

**Seta grande de arraste:**
- Usa a **variação C** da `setinha-arraste.md` automaticamente
- SVG 160-180px de largura, centralizado no rodapé
- Bottom: 80px

Este é o **único** layout que usa a variação C por default, nos outros layouts o padrão é a setinha de arraste (variação C).

## Exceções documentadas ao SKILL.md

Este layout abre **3 exceções** às regras duras da skill, todas justificadas:

1. **Sombra em elementos** (regra do SKILL.md): permitida nos screenshots usados como nós, porque sem sombra sutil eles se dissolvem no fundo branco.
2. **Seta visível**: o layout inteiro é construído sobre setas. A proibição original de "seta swipe" era sobre seta-template-Canva, não sobre diagrama manuscrito.
3. **Position absolute**: permitido para posicionar os nós e setas do diagrama, porque o diagrama é o conteúdo, não dá pra montar fluxo com flex/grid normal.

Estas exceções valem **exclusivamente** neste layout. Fora dele, as regras continuam duras.

## Auditoria adicional

Na `auditoria-pre-preview.md`, este layout substitui os checks 7 e setinha por:

- Setas são curvas irregulares (Q/T), não retas?
- Numeração é 01, 02, 03 (zero-padding)?
- Screenshots (se houver) vieram do upload do especialista?
- Handle no rodapé tem o arroba correto?
- Seta grande variação C está no lugar da setinha padrão?

## Limite de complexidade

Máximo **5 nós** no diagrama. Se a copy tem 6+ etapas, a skill retorna aviso: "Diagrama com 6+ etapas não cabe legível em 1080×1350. Reduza a copy ou escolha layout `metodo` padrão."
