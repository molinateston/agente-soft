# Layout Utilitário (Família Clínico Branco)

Layout novo inspirado em industrial graphics, wayfinding, e tipografia de part-number. Pertence **exclusivamente** à Família Clínico Branco. É alternativa ao layout `metodo` padrão quando a copy é técnica, listada, ou comparativa fria.

## Quando usar

- Slides de método com etapas numeradas que pedem tom de manual/especificação
- Slides comparativos X vs Y onde a frieza vende
- Slides de prova com métrica + contexto técnico
- Quando a Família escolhida é Clínico Branco E a copy tem vibe "bula bem desenhada"

## Quando NÃO usar

- Nunca em hook (o hook precisa de peso emocional, não frieza)
- Nunca em confissão, virada, oferta, todas pedem calor ou tensão
- Nunca nas Famílias Editorial Preto ou Manuscrito Cru, briga com a identidade delas

## Anatomia do layout

```
┌─────────────────────────────────────┐
│ N° 03 / 09            SOFT MARKETING│ ← header (small caps, tracking +0.12em, 14px)
│                                     │
│ ─────────────────────               │ ← divisor 1px #0A0908
│                                     │
│                                     │
│   Título principal                  │ ← aplica tabela de escala-densidade
│   em duas linhas                    │
│                                     │
│                                     │
│ ─────────────────────               │ ← divisor 1px #0A0908
│                                     │
│ Corpo do slide explicando           │ ← corpo normal, aplica escala
│ com precisão a etapa ou métrica     │
│                                     │
│ ─────────────────────               │ ← divisor 1px #0A0908 (opcional)
│                                     │
│ REF. M-03  ·  CARROSSEL 3C          │ ← footer metadata, small caps 12px
└─────────────────────────────────────┘
```

## Regras duras

1. **Padding 100px nos 4 lados**, como todo slide da skill. Sem exceção.
2. **Fundo** sempre `#F5F2EC` (off-white Clínico Branco), texto `#0A0908`.
3. **Header e footer** em small caps com `letter-spacing: 0.12em`, exceção explícita à regra de tracking negativo, documentada em `escala-densidade.md`.
4. **Numeração** no formato `N° 03 / 09` (com o `°` sobrescrito real, não º). Font mono ou sans pesada.
5. **Divisores** são linhas 1px sólidas, cor `#0A0908`, largura máxima 280px, alinhadas à esquerda do bloco de conteúdo.
6. **Accent color** entra só no título ou numeração, nunca em divisores, nunca em footer.
7. **Zero ícones**. Zero ilustrações. Só tipografia e linhas.

## Combinação tipográfica recomendada

- **Header/footer**: Inter Tight 600, small caps, tracking +0.12em
- **Título**: Inter Tight 700 ou Space Grotesk 700, tracking negativo conforme escala
- **Corpo**: Inter 400, tracking neutro

Alternativa editorial: trocar Inter Tight do título por **Fraunces** 700 com `font-variation-settings: "SOFT" 0, "WONK" 1`, traz os ink traps amplificados sem quebrar a frieza do resto.

## Exemplo de CSS base

```css
.slide-utilitario {
  background: #F5F2EC;
  color: #0A0908;
  padding: 100px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  font-family: 'Inter', sans-serif;
}
.slide-utilitario .header,
.slide-utilitario .footer {
  font-family: 'Inter Tight', sans-serif;
  font-size: 14px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.12em;
  display: flex;
  justify-content: space-between;
}
.slide-utilitario .divisor {
  width: 280px;
  height: 1px;
  background: #0A0908;
  margin: 40px 0;
}
.slide-utilitario .titulo {
  font-family: 'Inter Tight', sans-serif;
  font-weight: 700;
  /* font-size vem da tabela escala-densidade.md */
}
```

## O que este layout quebra no padrão do feed

O feed está saturado de: gradientes, ícones coloridos, emojis, fotos stock. Este layout entrega: linhas geométricas, numeração técnica, tipografia funcional, off-white. É o oposto visual. Quem está cansado de carrossel colorido para em cima dele.
