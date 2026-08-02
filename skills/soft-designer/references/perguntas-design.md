# Pergunta de Design, formato exato

> **Antes de perguntar QUALQUER coisa, cheque a ID visual do cliente** (`references/identidade-visual-cliente.md`). Se o cliente já tem identidade declarada (cores, fontes, formato), **aplica e NÃO pergunta**: cada cliente desenha na marca dele, não numa marca-padrão. As perguntas abaixo só rodam pra cliente **sem** ID definida; e quando rodarem, ofereça salvar as escolhas como a ID dele pra não re-perguntar na próxima.

Quando o usuário não der referência visual, não indicar família **e não tiver ID salva**, **pare e pergunte** antes de gerar qualquer HTML. Esta é a pergunta mais importante da skill, se você errar aqui, o carrossel inteiro vira ruído.

## Princípios da pergunta

1. **3 perguntas no máximo.** Mais que isso vira interrogatório.
2. **Sempre opções nomeadas, nunca hex livre.** Hex é fallback se o usuário insistir.
3. **Sempre com mini-descrição** do que cada opção transmite. O usuário não conhece os termos técnicos da skill, você precisa ensinar em 1 linha.
4. **Nunca pergunte cor de texto.** É inferida pelo fundo (que é inferido pela família).
5. **Use a tool `ask_user_input_v0`** quando disponível (chat mobile/web). Se não estiver, faça em texto markdown estruturado.

## Estrutura das 3 perguntas

### Pergunta 1, Família visual

```
Qual o tom desse carrossel?

- Editorial Preto, Fundo preto, serif elegante, vibe revista premium.
                   Pra posicionamento, manifesto, oferta cara.
- Clínico Branco, Fundo branco, sans pesada, espaço negativo brutal.
                   Pra listas, comparativos X/Y, ofertas diretas. (default mais seguro)
- Manuscrito Cru, Pode ser preto ou branco, sans pesada com elementos
                   manuscritos. Pra storytelling pessoal, tweet com avatar,
                   antes/depois honesto.
```

### Pergunta 2, Cor de destaque (UMA só)

Mostre as 7 cores nomeadas + opção "outra (me passa o hex)":

```
Qual a cor de destaque? (vai aparecer só em palavras-chave, nunca em fundo)

- Laranja queimado (#C8741A), Premium, atemporal, livro caro.
                                 Combina com Editorial Preto.
- Laranja vibrante (#FF6B1A), Moderno, urgente, ação.
                                 Combina com Clínico Branco.
- Magenta (#D946EF), Ousado, jovem, disruptivo.
                       Combina com Manuscrito Cru.
- Verde lime (#84CC16), Tech, novo método, automação.
                          Combina com Clínico Branco e Manuscrito Cru.
- Verde petróleo (#0F766E), Financeiro institucional, conservador, premium.
                              Combina com Editorial Preto (validado em finanças/jurídico).
- Dourado fosco (#B8860B), Luxo discreto, atemporal, exclusivo.
                             Combina com Editorial Preto.
- Vermelho coral (#EF4444), Alerta, virada brusca, "pare de fazer X".
                               Combina com qualquer família.
- Outra cor, me passa o hex (#XXXXXX)
```

**Combinações válidas (use como recomendação ao usuário se ele estiver perdido):**

| Família | Cor mais natural | Por quê |
|---|---|---|
| Editorial Preto | Laranja queimado | Default. Vibe revista premium. |
| Editorial Preto | Verde petróleo | Quando o tema é financeiro/jurídico/conservador. |
| Editorial Preto | Dourado fosco | Quando o tema é luxo discreto, exclusividade. |
| Clínico Branco | Laranja vibrante | Default. Mais moderno e direto. |
| Clínico Branco | Verde lime | Tech, automação, "novo método". |
| Manuscrito Cru | Magenta | Storytelling pessoal, virada brusca. |
| Manuscrito Cru | Vermelho coral | Confissão, "pare de fazer X". |

**Combinações que você deve evitar (avise ao usuário se ele pedir):**

| Combinação ruim | Por quê |
|---|---|
| Editorial Preto + Magenta | Vibra demais, parece Halloween |
| Editorial Preto + Verde lime | Quebra a vibe premium |
| Clínico Branco + Laranja queimado | Perde contraste, fica "marrom velho" |

### Pergunta 3, Combinação tipográfica

Esta pergunta depende da família escolhida. Mostre **apenas** as 3 opções da família. Carregue `references/tipografia.md` antes pra ter as URLs e nomes corretos.

**Se família = Editorial Preto:**
```
Qual a vibe da tipografia?

- Editorial Clássico, Playfair Display + Inter. Revista de negócios.
                        Default, mais reconhecível.
- Fraunces Premium , Fraunces + DM Sans. Mais moderno, com personalidade.
- Caslon Autoridade, Libre Caslon Display + Work Sans. Tradicional,
                       jurídico, financeiro.
```

**Se família = Clínico Branco:**
```
Qual a vibe da tipografia?

- Inter Bruto   , Inter 800 + Inter 400. Default. Funciona em tudo.
- Jakarta Limpo , Plus Jakarta Sans 800 + 400. Mais B2B / corporativo.
- Space Técnico , Space Grotesk 700 + 400. Conteúdo tech, IA, automação.
```

**Se família = Manuscrito Cru:**
```
Qual a vibe da tipografia?

- Inter Pesado  , Inter 800 + Inter 500. Default. Anotação direta.
- Bricolage Honesto, Bricolage Grotesque 800 + 500. Mais artesanal.
- Jakarta Confessional, Plus Jakarta Sans 800 + 500. Storytelling polido.
```

## Quando NÃO perguntar

Pule a pergunta inteira nestes casos:

1. **Usuário disse explicitamente** "Editorial Preto", "Clínico Branco", "Manuscrito Cru", "estilo X" → use o preset.
2. **Usuário anexou imagem de referência** → leia a imagem, extraia paleta dominante e estilo tipográfico, **confirme em 1 linha**: "Vou usar família Editorial Preto com laranja queimado e Playfair, igual o exemplo. Confirma?" Se ele disser sim, gere.
3. **Usuário disse "igual ao último carrossel"** → reuse o que foi feito antes na conversa.
4. **Usuário deu hex e fonte explicitamente** → respeite, mas valide contraste mínimo (4.5:1).
5. **Usuário disse "decide você"** → use um default **neutro e versátil**: Clínico Branco + um accent à escolha + Inter Bruto. Avise sem chamar de "marca": "Vou de Clínico Branco com Inter pesado, é o mais versátil. Que cor de destaque combina com a tua marca? Se não tiver preferência, escolho um azul sóbrio. Dá pra trocar depois." A cor NÃO é fixada numa cor de marca de ninguém: ou o cliente passa a dele, ou você usa uma neutra e avisa.

## Como apresentar via `ask_user_input_v0`

Use 3 perguntas separadas (single_select cada). Coloque a mini-descrição **dentro do texto da pergunta**, não como opção, porque opções de tool são curtas.

Exemplo:
```python
ask_user_input_v0(questions=[
  {
    "question": "Família visual? (Editorial = revista premium / Clínico = bula direta / Manuscrito = tweet pessoal)",
    "options": ["Editorial Preto", "Clínico Branco", "Manuscrito Cru"],
    "type": "single_select"
  },
  {
    "question": "Cor de destaque? (uma só, vai aparecer cirurgicamente)",
    "options": ["Laranja queimado #C8741A", "Laranja vibrante #FF6B1A", "Verde petróleo #0F766E", "Dourado fosco #B8860B", "Magenta #D946EF", "Verde lime #84CC16", "Vermelho coral #EF4444"],
    "type": "single_select"
  },
  {
    "question": "Tipografia? (depende da família, opções abaixo são pra Clínico Branco)",
    "options": ["Inter Bruto (default)", "Jakarta Limpo", "Space Técnico"],
    "type": "single_select"
  }
])
```

**Importante:** se você não souber a família ainda, **só faça a primeira pergunta**, espere a resposta, e ENTÃO faça a segunda + terceira já com as opções tipográficas certas pra família escolhida. Não jogue tipografia errada na pergunta.

## Modo texto (sem tool)

Se a tool `ask_user_input_v0` não estiver disponível (Claude Code, terminal), faça em markdown:

```markdown
Antes de gerar, preciso de 3 escolhas rápidas:

**1. Família visual:**
- [ ] Editorial Preto, revista premium
- [ ] Clínico Branco, bula direta (default seguro)
- [ ] Manuscrito Cru, tweet pessoal

**2. Cor de destaque (uma só):**
- [ ] Laranja queimado #C8741A, Editorial Preto, premium
- [ ] Laranja vibrante #FF6B1A, Clínico Branco, moderno
- [ ] Verde petróleo #0F766E, Editorial, financeiro/conservador
- [ ] Dourado fosco #B8860B, Editorial, luxo discreto
- [ ] Magenta #D946EF, Manuscrito, ousado
- [ ] Verde lime #84CC16, Clínico, tech
- [ ] Vermelho coral #EF4444, Alerta, virada
- [ ] Outra: me passa o hex

**3. Tipografia** (te mostro as 3 opções depois que você escolher a família)

Me responde em 1 mensagem que eu já sigo.
```

## Fallback se o usuário não responder

Se o usuário disser "tanto faz", "decide você", "qualquer um", use um default **neutro** (não a marca de ninguém):

- **Família:** Clínico Branco
- **Cor:** uma neutra sóbria (ex.: azul #2563EB ou o próprio preto/cinza-escuro como único "accent"), **nunca** uma cor fixa apresentada como "a cor do método"
- **Tipografia:** Inter Bruto

E avise no final do preview, sem rótulo de marca: "Usei um default neutro e versátil (Clínico Branco + Inter). Se a tua marca tem cor e fonte próprias, me passa que eu refaço com a tua identidade, e a gente salva pra próxima." Esse aviso é a porta pra capturar a ID visual do cliente (ver `references/identidade-visual-cliente.md`).

---

## Pergunta D, Elementos visuais extras (nova)

**Faça esta pergunta SEMPRE**, depois de família/cor/tipografia, mesmo que o usuário já tenha declarado as 3 primeiras escolhas. O default dela é "só tipografia pura", mas perguntar abre a porta pra variações que mudam muito o resultado.

Use `ask_user_input_v0`:

**Pergunta:** "Quer algum elemento visual extra no carrossel?"

**Opções:**

1. **Só tipografia pura**, texto, espaço negativo, zero ilustração. Default Soft.
2. **Ilustração line-art**, boneco ou objeto desenhado em line-art mono, geralmente no canto direito de 1-2 slides. Estilo da ref Editorial Preto com boneco.
3. **Tweet-Avatar no slide 1**, hook em formato print-de-tweet com avatar real do especialista + nome + @handle + destaque manuscrito. Requer upload da foto. Ver `layout-tweet-avatar.md`.
4. **Diagrama Manuscrito**, fluxo visual com nós numerados e setas curvas manuscritas. Disponível apenas em slides de método. Ver `layout-diagrama-manuscrito.md`.

**Combinações permitidas:**

- Opções 2, 3 e 4 **podem combinar**: pode ter tweet-avatar no hook (opção 3) + diagrama manuscrito no slide 4 (opção 4) + ilustração line-art no slide 6 (opção 2). Use `multi_select`.
- Opção 1 é **exclusiva**: se escolhida, bloqueia 2, 3 e 4.

**Input extras conforme a escolha:**

- Se escolheu **2 (ilustração)**: pergunte "Em qual slide específico?" e "Tem referência ou quer que eu escolha um boneco padrão?"
- Se escolheu **3 (tweet-avatar)**: pare e peça upload da foto do especialista + nome + @handle antes de continuar. Sem isso, volte e remova a opção.
- Se escolheu **4 (diagrama manuscrito)**: confirme qual slide do método vira diagrama, e pergunte se tem screenshots reais pra usar como nós.

**Setinha de arraste:**

Independente da escolha de D, a skill **sempre** aplica a setinha de arraste (variação C, ver `setinha-arraste.md`) nos slides 1 a N-1. Não pergunte sobre isso, é regra global. No diagrama manuscrito, a mesma variação C aparece maior, integrada ao rodapé.
