# CTAs

Botões, área de clique, posicionamento. O CTA é o coração da página.

---

## Tamanho mínimo

### Largura
**80% da tela no mobile.**

CTA que ocupa só uma fração estreita da tela é difícil de clicar com polegar.

### Altura
**56px mínimo.**

Apple recomenda 44px. Material Design recomenda 48px. Para CTAs Soft, 56px+. Polegar conforta.

### Padding interno
- Vertical: **16-24px**
- Horizontal: **32-48px**

Botão precisa "respirar" pra parecer importante.

---

## Visual

### Cor
- Background: contraste alto com a página (preto sólido, laranja queimado, ou cor primária forte)
- Texto: branco ou cor com contraste 4.5:1+ com o fundo

### Borda
Arredondamento: **4-8px** (sem ser pílula extrema)

Pílula extrema (border-radius infinito) só funciona em design específico - pode parecer datado.

### Sombras
Box-shadow leve é OK pra dar profundidade. Sombra exagerada parece amador.

---

## Estados

CTA precisa de 3 estados visíveis:

### Default
Estado base. Como aparece naturalmente.

### Hover (desktop)
Cor levemente diferente (mais escura ou mais clara). Pode adicionar transform: translateY(-2px) pra "elevação".

### Active (pressionado)
Geralmente mais escuro. Pode reduzir sombra.

### Disabled (raramente usado)
Quando aplicável: opacidade 0.5, cursor: not-allowed.

---

## Espaçamento ao redor

**32px+ de respiro acima e abaixo do botão.**

CTA colado em outro elemento perde força.

Em mobile, espaço claro de cada lado também.

---

## Texto do CTA

### Estrutura
**Imperativo, claro, curto.**

### Exemplos que funcionam
- "QUERO MINHA VAGA · R$27"
- "RESERVAR AGORA"
- "ENVIAR MENSAGEM"
- "BAIXAR GUIA GRÁTIS"
- "AGENDAR DIAGNÓSTICO"

### Exemplos que NÃO funcionam
- "Clique aqui" (genérico, sem contexto)
- "Saiba mais" (vago)
- "Inscreva-se" (sem dar contexto do que vai receber)
- "Continue" (sem destino)
- "Enviar" (vago, sem objeto)

### All caps no CTA
**OK no CTA.** É a única exceção da regra anti-CAPS.

Maiúsculas comunicam ação importante.

### Comprimento
Idealmente 2-5 palavras. Máximo 7.

Mais que isso vira frase, não chamada.

---

## Posicionamento na página

### Hero (acima da dobra)
**CTA primário visível no primeiro scroll.**

Quem chega na página deve ver o CTA imediatamente, sem precisar rolar.

### Meio da página
**CTAs secundários a cada 2-3 seções importantes.**

Quem está convencido na metade da página não precisa rolar até o fim. Coloca CTA pronto.

### Fim da página
**CTA final claro.**

Quem leu tudo e está pronto pra agir tem CTA imediato.

### Total na página
**3 a 5 CTAs em uma página de vendas.**

Menos = leitor convencido tem que rolar muito pra agir.
Mais = leitor cansa de ver "compre, compre, compre".

---

## Hierarquia de CTAs

### CTA primário
A ação principal da página. Cor forte. Tamanho máximo. Centralizado ou destacado.

### CTA secundário
Ação alternativa (ex: "baixar guia grátis" em vez de "comprar"). Cor secundária (outlined / ghost button). Menor que o primário.

### Link secundário
Texto sublinhado pra ação leve (ex: "ver depoimentos"). Sem botão.

**Regra:** em página de vendas, **NUNCA** mais que 1 CTA primário simultâneo. O resto deve ser claramente secundário.

---

## Áreas de clique no mobile

### Tap target
Mínimo recomendado: **44x44px** (Apple). **48x48px** (Material).

Pra CTAs Soft: **56x56px+**.

### Espaço entre tap targets
**8px mínimo.**

Botões colados causam click errado.

### Links em texto
Aumentar área clicável invisível ao redor do link (line-height + padding). Polegar é impreciso.

---

## CTA "Sticky" (fixo)

Quando usar:
- Página longa (5000+ palavras)
- Mobile, especialmente
- CTA principal queixa "some" durante scroll

Como fazer:
- Fixed no rodapé do viewport
- Altura 56-72px
- Largura 100% da tela
- Background com contraste claro
- Não cobre conteúdo importante

Quando NÃO usar:
- Página curta (cabe em 1-2 scrolls)
- Quando já tem CTA visível em toda parte da página

---

## CTA dentro de formulário

Se o CTA é dentro de um formulário (ex: "ENVIAR MENSAGEM"):

- Botão deve estar visualmente conectado aos campos
- Após o último campo, sem distância grande
- Texto do botão diz o que VAI ACONTECER (não só "enviar")

Exemplos:
- ✅ "ENVIAR MEU PEDIDO"
- ✅ "AGENDAR REUNIÃO"
- ❌ "Submit"
- ❌ "OK"

---

## CTA com indicador de progresso

Pra fluxos com múltiplas etapas (ex: checkout, formulário longo):

- Mostrar progresso visualmente (1 de 3, 2 de 3, etc)
- Botão "VOLTAR" disponível em todas as etapas exceto a primeira
- Botão de avançar com texto que indica etapa

---

## CTAs que cheiram a "creator vazio"

Anti-padrões pra evitar:

❌ "QUERO TRANSFORMAR MINHA VIDA AGORA"
❌ "CLIQUE AQUI PRA MUDAR TUDO"
❌ "SIM, QUERO O SEGREDO"
❌ "DESBLOQUEAR ACESSO EXCLUSIVO"
❌ "EU MERECO ISSO"

Esses são frases de coach de Instagram. O cliente certo fecha quando vê.

---

## CTAs Soft autorais

✅ "QUERO MINHA VAGA · R$27"
✅ "AGENDAR DIAGNÓSTICO"
✅ "MANDAR MENSAGEM NO WHATSAPP"
✅ "BAIXAR GUIA"
✅ "VER PRODUTO COMPLETO"
✅ "ENTRAR PRA TURMA"

Frase direta. Indica o que vai acontecer. Sem urgência fake. Sem cringe.

---

## Checagem de CTAs

1. [ ] Largura ≥ 80% da tela no mobile?
2. [ ] Altura ≥ 56px?
3. [ ] Padding interno generoso (16-24px vertical + 32-48px horizontal)?
4. [ ] Contraste cor/fundo passa WCAG?
5. [ ] 3 estados visíveis (default, hover, active)?
6. [ ] Espaço ao redor ≥ 32px?
7. [ ] Texto imperativo, claro, 2-5 palavras?
8. [ ] All caps OK no botão?
9. [ ] 3-5 CTAs na página, sendo 1 primário claro?
10. [ ] CTA primário visível acima da dobra?
11. [ ] Sem cringe ou frase de coach?

Se falhar, ajusta.
