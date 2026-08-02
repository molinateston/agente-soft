# Quebra de linhas, phrase ragging, widow control, good rag

Regras determinísticas para como cada linha de texto quebra dentro de um slide. Aplicar **depois** de `escala-densidade.md` (que define font-size) e **antes** de renderizar o HTML.

A skill **nunca** deixa o browser quebrar sozinho via `word-wrap` natural. Toda quebra é explícita via `<br>` ou via `max-width` do container calculado para forçar a quebra no lugar certo.

---

## As 6 regras duras

### Regra 1, Zero widows

Nenhuma linha do título ou corpo termina com **1 palavra sozinha**. Se a última linha tem só 1 palavra, reescreva a quebra da linha anterior para puxar palavra pra cá, ou puxar a palavra sozinha pra linha anterior.

**Errado:**
```
Fechei R$3k com 3 msgs no
WhatsApp
```

**Certo:**
```
Fechei R$3k com 3 msgs
no WhatsApp
```

### Regra 2, Mínimo 2 palavras substantivas na última linha, com ≥ 8 caracteres

Duas palavras curtas ("é só", "no a") também parecem widow. A regra real:

> Última linha precisa ter **≥ 2 palavras** E soma dos caracteres das palavras ≥ **8**.

**Errado:**
```
Você não está
empacado. Você só
é
```

**Certo:**
```
Você não está empacado.
Você só está cansado
```

### Regra 3, Phrase ragging obrigatório em títulos

Quebra de linha segue **unidade semântica**, não limite do container. Pense: "qual o pedaço da frase que lê como um bloco?". Quebre entre pedaços, nunca no meio.

**Errado (quebra no meio do pedaço):**
```
Fechei R$3k com
3 msgs no
WhatsApp
```

**Certo (cada linha é um pedaço que lê inteiro):**
```
Fechei R$3k
com 3 msgs
no WhatsApp
```

Heurística: após a quebra, a próxima linha deveria fazer sentido lida isoladamente. Se lida isoladamente a linha parece "cortada no meio", a quebra está errada.

### Regra 4, Good rag (variação entre linhas ≤ 40%)

Se a linha mais longa do bloco tem N caracteres, nenhuma outra linha pode ter menos que **60% de N**. Evita "dente de serra".

Fórmula: `min(linhas) / max(linhas) ≥ 0.6`

**Errado** (12/4 = 33%, dente de serra):
```
Pare de postar
todo dia
```

**Certo** (14/12 = 85%, rag equilibrado):
```
Pare de postar
todo dia venda
```

Exceção: títulos de 2 linhas onde a segunda é intencionalmente curta por phrase ragging (ex: "Fechei R$3k / com 3 msgs / no WhatsApp", 3 linhas de 11/10/11 chars). Aí o rag é bom porque cada linha é uma unidade semântica. Neste caso, a Regra 3 prevalece sobre a Regra 4.

### Regra 5, Proibido quebrar termos compostos, marcas e valores

Palavras que formam unidade atômica **nunca** quebram entre linhas:

- Marcas: "WhatsApp", "ChatGPT", "Instagram"
- Valores monetários: "R$3k", "R$ 3.000", "$50"
- Números com unidade: "3 msgs", "48h", "10x"
- Nomes próprios compostos: "Soft Business", "Carrossel 3C"
- Siglas: "CMV", "ROI", "ICP"

Implementação: envolva em `<span style="white-space:nowrap">WhatsApp</span>` ou use `&nbsp;` entre as partes.

### Regra 6, Proibido hifenizar palavras no título

Título **nunca** tem palavra cortada com hífen entre linhas. Em PT-BR, palavras longas ("posicionamento", "compreensão", "especialista") ficam piores hifenizadas que mantidas inteiras criando rag irregular.

Se uma palavra longa estoura a largura do container:
1. Primeira tentativa, reescreva a quebra pra puxar palavra curta pra antes dela
2. Segunda tentativa, reduza o font-size em 1 degrau da tabela de `escala-densidade.md`
3. Terceira tentativa, retorne ERRO "palavra X não cabe na largura do container no tamanho atual, reduza a copy ou aceite tamanho menor"

---

## Como implementar no HTML

**Sempre use `<br>` explícito no título.** Não confie em `word-wrap` do browser. Isso vale **também** pra `text-wrap: balance` e `text-wrap: pretty`: em render headless (Playwright/Chromium) eles **não seguram widow de forma confiável**, principalmente em bullet e span inline (já vazou palavra órfã por confiar neles). A lei é `<br>` manual + widow-check, sempre; o CSS de wrap é no máximo um reforço, nunca a garantia.

```html
<h1 class="titulo">
  Fechei R$3k<br>
  com 3 msgs<br>
  no <span style="white-space:nowrap">WhatsApp</span>
</h1>
```

**Container com `max-width` controlado** pra corpo de texto mais corrido. Calcule o `max-width` para forçar quebra no lugar certo, ou use `<br>` manual também.

```css
.corpo {
  max-width: 720px; /* força quebra por largura no lugar desejado */
}
```

**Nunca** use `text-align: justify`, produz rivers, rags piores, e é proibido em display type.

---

## Protocolo de aplicação

Pra cada bloco de texto (título e corpo) do slide, siga nessa ordem:

1. **Identifique os "pedaços semânticos"** da frase (sujeitos, verbos, complementos, unidades).
2. **Conte palavras e caracteres** de cada pedaço.
3. **Agrupe pedaços em linhas** respeitando a largura aproximada do container (função de font-size + container width).
4. **Cheque Regra 1** (widow), última linha tem 1 palavra? Se sim, reagrupe.
5. **Cheque Regra 2** (última linha curta), última linha tem < 2 palavras ou < 8 chars? Se sim, reagrupe.
6. **Cheque Regra 4** (good rag), linha mais curta < 60% da mais longa? Se sim E não for exceção phrase ragging, reagrupe.
7. **Cheque Regra 5** (termos compostos), alguma unidade atômica quebrou? Envolva em `nowrap`.
8. **Insira os `<br>`** finais no HTML.

## Exemplos resolvidos

**Copy original:** "Você não está empacado. Você só está cansado de fazer tudo certo no seu perfil e mesmo assim não crescer."

Pedaços semânticos: `Você não está empacado.` / `Você só está cansado` / `de fazer tudo certo` / `no seu perfil` / `e mesmo assim` / `não crescer.`

Agrupamento em slide com font grande (120px, container 880px):

```html
<h1>
  Você não está<br>
  <span class="accent">empacado.</span><br>
  Você só tá cansado<br>
  de fazer tudo certo<br>
  no seu perfil e mesmo<br>
  assim não <span class="accent">crescer.</span>
</h1>
```

Checks: nenhuma linha com 1 palavra ✅, phrase ragging respeitado ✅, rag 14/13/17/18/21/20 = 13/21 = 62% ✅, sem termo composto quebrado ✅.

---

## O que este reference NÃO faz

- Não reescreve copy, só reorganiza como ela quebra em linhas
- Não decide font-size (isso é `escala-densidade.md`)
- Não decide cor de accent (isso é a família visual)
- Não se aplica a caption/rodapé/metadata (só título e corpo principal do slide)
