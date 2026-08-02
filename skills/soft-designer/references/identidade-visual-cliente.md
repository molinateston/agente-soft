# Identidade Visual do cliente, cada cliente desenha na marca DELE

> A soft-designer é **genérica e marca-neutra**: não tem cor, fonte ou pele própria. Quem dá a cara da peça é a marca do **cliente da vez**. Esta reference é como a skill **lê**, **aplica** e **salva** a identidade visual de cada cliente, pra que ele desenhe sempre na própria ID e a skill não re-pergunte a cada peça nem invente uma marca-padrão.

A regra-mãe: **a ID do cliente vence a curadoria.** As 3 famílias (Editorial Preto · Clínico Branco · Manuscrito Cru) e as cores/fontes recomendadas são a **rampa pra quem ainda não definiu** a própria identidade, nunca uma cerca que força todo mundo no mesmo visual.

---

## Passo 1, procura a ID antes de qualquer pergunta

No Passo 0/2 do desenho, ANTES de rodar `references/perguntas-design.md`, procure a identidade visual do cliente nesta ordem:

1. **Seção `## Identidade Visual` no `soft-perfil.md`** do cliente (o formato está no fim desta reference). Achou e preenchida: **aplica e NÃO pergunta**.
2. **Referência visual anexada nesta conversa** (print de um post dele, página, manual de marca): extraia paleta dominante + estilo tipográfico + formato, **confirme em 1 linha** ("Vou na tua identidade: fundo escuro, accent verde, sans pesada. Confirma?") e ofereça salvar.
3. **"Igual ao último"** na mesma conversa: reusa o que já foi montado.
4. **Nada disso:** o cliente ainda não tem ID definida. Aí sim roda `references/perguntas-design.md` (família/cor/tipografia) e, ao fim, **oferece salvar** as escolhas como a ID dele.

> **Admite se faltar (não inventa).** Se a seção existe mas um campo está vazio ou marcado `[A CONFIRMAR]`, pergunta **só aquele campo** ("tua fonte de título é qual?"), não chuta uma. Marca de cliente nenhum é adivinhada.

---

## Passo 2, o que é a ID visual (os campos)

Uma identidade visual de cliente cabe em poucos campos. Cada um manda numa decisão de desenho:

| Campo | O que decide | Exemplos |
|---|---|---|
| **Família base** | a pele de partida (cor de fundo + clima) | Editorial Preto / Clínico Branco / Manuscrito Cru / livre |
| **Fundo** | claro, escuro, ou ambos (a peça pode alternar) | `#FFFFFF` · `#0A0A0A` · `#0A0908` |
| **Accent (1 só)** | a única cor de destaque, em ≤ 4 palavras por peça | hex da marca, ex.: `#2563EB`, `#C8741A`, `#16A34A` |
| **Negativo** | a cor de ✕/erro/"pare de fazer" | default `#E63946`, ou a da marca |
| **Fonte de título** | o display (impacto) | nome + peso, ex.: "Inter 800", "Playfair 700" |
| **Fonte de corpo** | o texto de leitura | nome + peso, ex.: "Inter 400" |
| **Fonte de label** | eyebrow/badge/rótulo (opcional) | ex.: "JetBrains Mono", ou herda do corpo |
| **Formato** | cantos e linhas | cantos retos 2–4px / arredondados Xpx · hairlines sim/não |
| **Elementos de marca** | logo, selo, marca-d'água (opcional) | caminho do arquivo, onde entra |
| **Combo de export (Code)** | como o `build_carousel.py` carrega a fonte | um dos 9 combos · ou `custom` (link + family) |

**Contraste é trava, não preferência.** Qualquer accent/fundo que o cliente declarar passa pela mesma regra dura da `auditoria-pre-preview.md` (check 14) e do `craft.py`: cada texto legível contra o fundo DELE (WCAG ≥ 3:1). Se a cor da marca do cliente some no fundo dele (ex.: accent claro em fundo claro), você **avisa e ajusta o uso** (usa o accent só em peso/área onde contrasta, ou escurece um tom pra texto), sem trair a marca. A ID escolhe a cor; o gate garante que ela seja vista.

---

## Passo 3, aplica a ID no desenho

Com a ID em mãos, ela **substitui** as 3 perguntas de design:

- **Família base** → a pele e os layouts daquela família (`references/familia-*.md`), mas com as cores/fontes do cliente por cima (a família é a estrutura; a ID é a tinta).
- **Accent** → entra no lugar de toda menção a "cor de destaque" das references. Uma só, cirúrgica.
- **Fontes** → título/corpo/label do cliente. Se a fonte de marca não é um dos 9 combos, carrega via `<link>` (Chat) ou `custom_font_links` + `custom_font_family` no `build_html()` (Code). Ver `references/tipografia.md`.
- **Formato** → cantos e hairlines do cliente. Se a marca dele usa cantos arredondados, respeita (a regra "cantos retos" das references é o default Soft pra quem não tem ID, não lei universal).
- **Elementos de marca** → logo/selo onde a marca pede, sem competir com a mensagem.

O resto do processo é idêntico: copy-visual pelo Crivo (Passo 0), detecção de função, ritmo orgânico, escala/quebra, gate visual, preview, export. **A ID muda a tinta e a fonte, não afrouxa nenhum gate.**

---

## Passo 4, salva pra não re-perguntar

Quando o cliente **não tinha** ID e você acabou de definir uma (pelas perguntas, ou extraindo de uma referência que ele aprovou), **ofereça gravar** no `soft-perfil.md` dele:

> "Quer que eu salve essa identidade (fundo escuro, accent verde `#16A34A`, Inter)? Aí toda peça nova já sai na tua marca, sem perguntar de novo."

Se ele topar, escreve/atualiza a seção `## Identidade Visual` (formato abaixo) no `soft-perfil.md`. É uma seção **própria da soft-designer**: não mexe nos 5 slots do Crivo compartilhado, só adiciona. Da próxima vez, o Passo 1 lê dela.

---

## Formato da seção no `soft-perfil.md`

```markdown
## Identidade Visual (lida pela soft-designer)
- Família base: Clínico Branco
- Fundo: escuro #0A0A0A
- Accent (1 só): #16A34A   (hover opcional: #15803D)
- Negativo (×/erro): #E63946
- Fonte de título: Inter 800
- Fonte de corpo: Inter 400
- Fonte de label: [herda do corpo]
- Formato: cantos retos 3px, hairlines não
- Elementos de marca: logo em assets/marca/logo.svg (rodapé, pequeno)
- Combo de export (Code): inter_bruto
```

Campo sem definição fica `[A CONFIRMAR]` e a skill pergunta só ele quando for usar. Nunca preenche com a marca de outro cliente nem com um default apresentado como "a marca do método".

---

## O que esta reference NÃO faz

- Não impõe nenhuma identidade (nem a do autor do método). A skill é marca-neutra.
- Não escreve copy (isso é o Crivo, Passo 0) nem decide a estrutura narrativa.
- Não dispensa o gate visual: a cor da marca ainda precisa passar no contraste.
