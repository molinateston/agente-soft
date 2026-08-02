# Modo Mini Carta

> **Passo 0, antes de escrever a primeira linha (entrada ancorada).** Abre a fonte de fala real do cliente da vez (`shared-references/crivo/01-entrada-verbatim.md`, passo 0: identifica a fonte do usuário) e puxa 3-5 falas de dor e 3-5 de desejo do tema, literais. A primeira linha da peça nasce de uma delas, quase intacta, citando o N. Assim a peça nasce ancorada, não só é reprovada no gate do fim.


> **Quando usar:** produção completa de Mini Carta pronta pra colar em Notion (ou Google Docs como fallback). A skill entrega texto **diagramado**, não bruto.
>
> **O que entrega:** Carta completa em markdown Notion-compatível · diagramação caso a caso (sem template fixo) · pronta pra publicar em 4-7 minutos de leitura.
>
> **Pré-requisito:** Discurso Base (versão-mestre dos 7 passos) já aprovado. Ver `discurso-base-7-passos.md`.

---

## Índice

- 1. O que este modo entrega
- 2. Quando ativar este modo
- 3. Workflow de produção, 6 etapas
- 4. Diagramação Notion, caso a caso
- 5. Exemplo completo, Carta diagramada (referência)
- 6. Anti-padrões da diagramação
- 7. Checklist de auditoria final
- 8. Output esperado
- 9. Diagnóstico, sintomas comuns
- 10. Tabela de decisão, quando consultar quais refs

---

## 1. O que este modo entrega

A Mini Carta é a peça central da desejo. Substitui:
- Reunião de apresentação
- Funil complexo (5+ páginas)
- VSL longa de 30 minutos

Documento simples, lido em **4-7 minutos**, que faz o trabalho de desejo inteiro: filtra · explica · desperta desejo.

### Diferencial do modo

A maioria das skills de copy entrega **texto bruto** que o cliente precisa diagramar depois. Este modo entrega:

✅ **Texto pronto** seguindo os 4 blocos do v10
✅ **Diagramação completa** com hierarquia · espaços · callouts · separadores
✅ **Markdown Notion-compatível** (renderiza nativo)
✅ **Fallback Google Docs** (callouts viram blockquotes · resto idêntico)
✅ **IA diagrama caso a caso**, cada Carta tem visual escolhido pelo conteúdo, sem template forçado

---

## 2. Quando ativar este modo

| Situação | Ação |
|---|---|
| Discurso Base aprovado · cliente pediu Carta | ✅ Ativa este modo |
| Cliente pediu Carta direto sem briefing | Roteia primeiro pra `discurso-base-7-passos.md` (briefing) |
| Cliente pediu landing page completa com VSL | Roteia pra a skill `soft-funil-landing` |
| Cliente pediu webinar | Roteia pra skill `soft-webinar-plano` |
| Cliente quer versão em vídeo da Carta | Roteia pra a skill `soft-funil-miniwebinar` (alternativa à Carta) |
| Ticket alto · cliente quer aprofundar | Considerar Webinar (skill `soft-webinar-plano`) ou Reunião Soft (conversão) como complemento |

### Faixa de ticket, Carta basta?

| Ticket | Carta sozinha basta? |
|---|---|
| **Baixo a médio** (até R$3k) | Sim, Carta basta · pode até mostrar preço dentro |
| **Médio** (R$3-10k) | Sim, Carta + WhatsApp pré-qualificação · preço fora |
| **Alto** (R$10-30k) | Considerar Webinar (skill webinario) ou Reunião Soft (conversão) como complemento |
| **Muito alto** (R$30k+) | Carta + Webinar + Reunião Soft (3 camadas) |

---

## 3. Workflow de produção, 6 etapas

### Etapa 1, Briefing (com Especialista)

Antes de produzir, capturar 6 entradas (vide `discurso-base-7-passos.md` Etapa 1):

1. Cliente ideal específico
2. Problema Avançado nomeado (palavras do cliente)
3. Soluções comuns que ele já tentou (3-5 com efeitos)
4. Método nomeado (3-4 etapas com nome próprio)
5. Cases reais (nome + nicho + número + prazo · só verdade documentável)
6. Oferta (o que inclui · o que não inclui · ticket pra calibrar)

### Etapa 2, Discurso Base (versão-mestre)

Se ainda não tem: produz a versão-mestre dos 7 passos em texto corrido. Ver `discurso-base-7-passos.md`.

Se já tem: pula direto pra Etapa 3.

### Etapa 3, Adaptação aos 4 blocos

Mapeia os 7 passos do Discurso Base nos 4 blocos da Carta v10. Ver o corpo desta skill (SKILL.md).

Sai com a Carta em texto, dividida em 4 blocos, **ainda sem diagramação**.

### Etapa 4, Diagramação Notion (caso a caso)

Esta é a etapa que diferencia o modo. Detalhamento na Seção 4 abaixo.

### Etapa 5, Revisão de densidade

Aplica o teste único frase a frase (vide `tom-e-ritmo-desejo.md`):

> *"Se eu cortar essa frase, perco informação ou só perco palavras?"*

Expectativa: cortar 30-40% das palavras nesta etapa.

Carta sai de 1.500 → 950-1.050 palavras.

### Etapa 6, Auditoria e entrega

Aplica checklist (Seção 7 deste arquivo) e entrega via output (Seção 8).

---

## 4. Diagramação Notion, caso a caso

### Princípio raiz

> **A IA diagrama cada Carta caso a caso. Sem template fixo.**
>
> **O conteúdo decide o visual.**

Não existe "template Soft de Carta". Cada Carta tem hierarquia, callouts, separadores e elementos visuais escolhidos pelo conteúdo específico daquela Carta.

### Critérios pra escolher elementos visuais

A IA decide o que usar baseado em:

| Elemento | Usa quando |
|---|---|
| **H1 (título)** | Sempre · 1 vez · no Bloco 1 (a promessa-frase principal) |
| **H2 (seção)** | Quando o bloco precisa de "respiração" visual · Bloco 2 e Bloco 3 quase sempre |
| **H3 (sub-seção)** | Raríssimo · só se Bloco 3 for muito longo (> 500 palavras) |
| **Callout (Notion)** | Box "Pra quem é" · "2 Tipos de Pessoas" · destaques de quebra de padrão |
| **Toggle (Notion-only)** | Antecipação de objeções (Passo 6), pergunta visível, resposta colapsada |
| **Separador `---`** | Entre blocos · gera respiração visual obrigatória |
| **Pull quote (`>`)** | Frase de impacto isolada · 3-4 vezes na Carta inteira |
| **Bullets (`-`)** | Quando informação é genuinamente paralela (ex: "Pra quem é · Pra quem não é") |
| **Tabela** | Contraste "Hoje × Agora" · comparação direta |
| **Bold (`**`)** | Cirúrgico · 5-7 negritos na Carta inteira · só em palavras-chave (nome do método, dor central, frase-âncora) |
| **Itálico (`*`)** | Emoções · diálogos internos · paráfrases do cliente ("isso fala diretamente comigo") |

### Hierarquia tipográfica padrão Notion

```
# H1 ← Bloco 1 (frase-promessa principal)

## H2 ← Bloco 2 (Problema)
parágrafo...

## H2 ← Bloco 3 (Solução · Método · Proposta)
parágrafo...

## H2 ← Bloco 4 (CTA)
parágrafo...
```

### Espaço em branco, regra

- Sempre 1 linha em branco entre parágrafos
- Sempre 2 linhas em branco antes de H2 (gera "respiração")
- Sempre `---` (separador) entre os 4 blocos da Carta

### Quando usar callout (Notion-nativo)

Use callout pra:

1. **Box "Pra quem é"** (recomendado quando ticket ≥ R$2k):
```markdown
> [!info] **Pra quem é**
> - Especialista que [perfil específico]
> - [Característica 2]
> - [Característica 3]
>
> **Pra quem não é**
> - [Quem não serve]
> - [Quem não serve]
```

2. **Destaque "2 Tipos de Pessoas"** (recomendado quando ticket ≥ R$3k, antes do CTA):
```markdown
> [!note] **2 Tipos de Pessoas**
> Tipo 1: vai fechar a aba pensando "interessante, vou estudar". Daqui 6 meses ainda vai estar tentando juntar peças soltas.
>
> Tipo 2: já entendeu que arquitetura vence técnica. Vai mandar mensagem agora.
>
> Os dois tipos são legítimos. Só um avança.
```

3. **Quebra de padrão narrativa** (frase-âncora isolada):
```markdown
> [!warning] Isso é o que separa Especialista de creator.
```

> **No Google Docs (fallback):** callouts viram **blockquotes simples** (`>`). Mantém função, perde só o ícone.

### Quando usar toggle (Notion-only)

Use toggle pra antecipação de objeções (Passo 6 → Bloco 3C). Permite responder sem inflar o texto:

```markdown
<details>
<summary>"Mas isso funciona pro meu nicho?"</summary>

Funciona pra qualquer Especialista que vende conhecimento próprio. Já apliquei em [3-4 nichos diferentes]. O método trabalha o sistema do negócio, não o conteúdo do nicho.
</details>

<details>
<summary>"E se eu não conseguir aplicar?"</summary>

[Resposta]
</details>

<details>
<summary>"Por que esse Especialista e não outro?"</summary>

[Resposta]
</details>
```

> **No Google Docs (fallback):** toggles viram **H3 + parágrafo aberto**. Não colapsa, mas mantém estrutura.

### Quando usar pull quote (`>`)

Pull quote (citação destacada) pra **3-4 frases de impacto** na Carta inteira. Onde tipicamente:

| Localização | Função |
|---|---|
| Final do Bloco 2 | Frase-âncora do diagnóstico ("O nome desse sintoma é Complexidade Digital.") |
| Meio do Bloco 3A | Frase-âncora do método ("Não é técnica nova. É arquitetura.") |
| Final do Bloco 3D | Frase-âncora antes do CTA ("Quem chega ao final sabe se é ou não. Sem call de descoberta.") |
| Antes do CTA | Frase de transição ("Não é pressa. É clareza.") |

**Regra:** máximo 3-4 pull quotes na Carta. Mais que isso vira PowerPoint.

### Quando usar tabela

Use tabela pra contraste **"Hoje × Agora"** (recomendado quando ticket ≥ R$3k):

```markdown
| Hoje | Com o [Método] |
|---|---|
| Reunião gratuita queima 1h | Carta filtra antes da call |
| Posta sobre 5 assuntos | 1 dor por mês, vira referência |
| Conteúdo educativo atrai curioso | Conteúdo Soft atrai cliente |
```

> **Princípio:** máximo 4-5 linhas. Mais cansa.

### Quando usar bullets

**Use bullets apenas quando:**
- Informação é genuinamente paralela
- Contraste é a função (lista do "pra quem é"/"pra quem não é")
- Lista é de itens equivalentes (incluído na oferta)

**Não use bullets quando:**
- Ideias fluem em prosa
- Lista é de "funcionalidades" (Soft não vende funcionalidade)
- Mais de 5 itens (cansa)

---

## 5. Exemplo completo, Carta diagramada (referência)

Trecho de Carta para Especialista solo · ticket R$4.800 · método "Implementação Soft" (exemplo ilustrativo, aqui o produto vendido é o próprio método Soft; pro cliente à frente, troque pelo método e oferta DELE):

```markdown
# Sistema de aquisição que funciona quando você para

Você fatura entre 10 e 80 mil por mês como Especialista, pelo esforço bruto. Já tentou lançamento, tráfego pago, conteúdo diário, e cada solução adicionou mais coisa pra gerenciar.

Nessa Carta vou te mostrar o sistema de aquisição que funciona quando você para. Sem agência, sem time, sem postar todo dia. Em 5 minutos de leitura.

> [!info] **Pra quem é**
> - Especialista que fatura R$10-80k/mês
> - Vende conhecimento próprio (consultoria · mentoria · serviço)
> - Quer escalar sem virar agência
>
> **Pra quem não é**
> - Quem ainda não fatura · quem busca atalho sem trabalho

---

## O problema não é esforço

Você não falhou. Foi soterrado.

Lançamento puxa equipe pra rodar. Tráfego puxa gestor de anúncios. Funil puxa especialista em funil. Conteúdo diário puxa social media.

Cada uma resolve um pedaço. Nenhuma resolve o sistema.

E quanto mais você adiciona, mais refém da operação você fica.

> O nome desse sintoma é **Complexidade Digital**.

Você sente isso quando não consegue ficar uma semana fora sem que tudo desande. Quando sua agenda é mais reunião com fornecedor do que com cliente. Quando você decide cortar uma camada e o faturamento cai junto.

Familiar?

---

## A arquitetura é diferente

Existe um caminho que opera **inverso**.

Não adiciona, **subtrai**. Cada camada existe pra **eliminar** uma camada existente, não pra empilhar mais uma.

É o que chamo de **Implementação Soft**. 3 etapas:

**Posicionamento Incomum**, você sai de "mais um" pra "o único que faz X". Ticket sobe sem precisar trabalhar mais.

**Sistema de Aquisição**, Carta faz o trabalho que reunião fazia. Conteúdo qualifica antes da conversa. Você fala só com quem já decidiu.

**Operação com IA**, IA carrega o que era da equipe. Você opera solo, mas com escala de empresa.

Não é técnica nova. É arquitetura.

> Marketing deve caber dentro do negócio. Não o negócio dentro do marketing.

### Cases reais

[Nome 1], [nicho]: vinha de R$15k/mês com agência (margem 8%). Em 90 dias após implementação: R$22k/mês solo (margem 71%). Sem agência, sem postar diário.

[Nome 2], [nicho]: 6 meses tentando lançamento. Em 45 dias após implementação: 4 clientes de R$8k cada. Por Carta + WhatsApp · zero call de descoberta.

### Antecipação

<details>
<summary>"Mas isso funciona pro meu nicho?"</summary>

Funciona pra qualquer Especialista que vende conhecimento próprio. Já apliquei em consultoria de gestão, terapia, advocacia, design, engenharia. O método trabalha o sistema do negócio, não o conteúdo do nicho.
</details>

<details>
<summary>"E se eu não conseguir aplicar?"</summary>

[Resposta]
</details>

<details>
<summary>"Por que esse caminho e não os outros?"</summary>

[Resposta]
</details>

### A oferta, Implementação Soft

3 sessões individuais ao vivo + 60 dias de suporte por WhatsApp.

**Sessão 1:** Posicionamento Incomum + Discurso Base
**Sessão 2:** Sistema de Aquisição (Carta · Stories CARO · Carrossel)
**Sessão 3:** Automação + Tráfego + Script de Vendas

**Não está incluído:**
- Mentoria em grupo (é 1 a 1)
- Templates prontos (cada peça é construída pra seu negócio)
- Garantia de resultado financeiro (entrego sistema · resultado depende da execução)

> [!note] **2 Tipos de Pessoas**
> Tipo 1: vai fechar essa Carta pensando "interessante, vou estudar". Daqui 6 meses ainda vai estar tentando juntar peças soltas.
>
> Tipo 2: já entendeu que arquitetura vence técnica. Vai mandar mensagem agora.
>
> Os dois tipos são legítimos. Só um avança.

---

## Próximo passo

Se você se reconheceu até aqui, o próximo passo é único.

No WhatsApp eu pré-qualifico em 3 perguntas, mostro o investimento, e você decide.

[**Conversar no WhatsApp**](https://wa.me/...)

Se não é pra você agora, sem pressão. Volta quando fizer sentido.
```

---

## 6. Anti-padrões da diagramação

| Anti-padrão | Errado | Certo |
|---|---|---|
| **Bullets em todo lugar** | Carta vira PowerPoint | Bullets só em listas paralelas genuínas |
| **H1/H2/H3 em todo bloco** | Vira relatório · quebra fluxo | H2 só em quebras de bloco · H3 raríssimo |
| **Toggle pra todo conteúdo** | Carta colapsada vira frustrante | Toggle só em objeções (Passo 6) |
| **Múltiplos callouts coloridos** | Visual carregado · perde funcionalidade | 2-3 callouts máximo · funcional, não decorativo |
| **Bold em frase inteira** | Perde força | Bold cirúrgico · 5-7 palavras-chave |
| **Pull quote em qualquer parágrafo** | Cansa · vira diagrama | 3-4 pull quotes em momentos certos |
| **Emojis decorativos (🚀✨💎)** | Estética de vendedor | Zero emoji decorativo · só funcional se necessário |
| **Cores variadas no callout** | Estética visual fora do Soft | Cor padrão do Notion · sem customização |
| **Imagens decorativas** | Carta Soft não tem imagem | Zero imagem · só texto + elementos Notion |
| **Animações/GIFs** | Distrai · Carta não é landing page | Zero animação · Carta é leitura solitária estática |

---

## 7. Checklist de auditoria final

Antes de entregar a Carta, valida tudo:

### Estrutura

- [ ] 4 blocos identificáveis (Promessa pra quem é · Problema · Solução-Método-Proposta · CTA)?
- [ ] Tamanho final entre 800-1.300 palavras (4-7 min de leitura)?
- [ ] Separadores `---` entre os 4 blocos?

### Diagramação

- [ ] H1 único (frase-promessa do Bloco 1)?
- [ ] H2 marcando quebras (Problema · Método · CTA)?
- [ ] 2-3 callouts máximo (sempre funcionais)?
- [ ] 3-4 pull quotes em frases de impacto?
- [ ] Bold cirúrgico (5-7 palavras-chave)?
- [ ] Espaço em branco generoso (1 linha entre parágrafos · 2 antes de H2)?
- [ ] Toggle em objeções (Passo 6)?
- [ ] Tabela "Hoje × Agora" se ticket ≥ R$3k?
- [ ] Box "Pra quem é" se ticket ≥ R$2k?

### Tom e densidade (cruz com `tom-e-ritmo-desejo.md`)

- [ ] Mediana de palavras por frase ≤ 15?
- [ ] Parágrafos ≤ 3 linhas?
- [ ] Zero advérbio gratuito (realmente · basicamente · obviamente)?
- [ ] Zero transição mole (além disso · vale ressaltar)?
- [ ] Zero adjetivo vazio (incrível · transformador · poderoso)?
- [ ] Cortou ≥ 30% das palavras na revisão de densidade?

### Princípios desejo (cruz com o corpo desta skill (SKILL.md))

- [ ] Filtra · Explica · Desperta desejo (nessa ordem)?
- [ ] Faca Soft (método nomeado · sem passo executável)?
- [ ] Preço fora da Carta (exceção: ticket baixo)?
- [ ] CTA único pro WhatsApp?
- [ ] Cases reais com nome + nicho + número + prazo (zero invenção)?

Se sim em todos: pronta pra publicar.

---

## 8. Output esperado

Quando o modo termina, entrega:

1. **Carta completa em markdown Notion-compatível**, colável direto em página Notion
2. **Frase de fechamento explicando como publicar:**

```
Carta pronta. Pra publicar:

1. Cria nova página no Notion
2. Cola este markdown, Notion renderiza nativo (callouts · toggles · separadores)
3. Configura permissão "Anyone with link can view"
4. Coloca o link na bio do Instagram

No Google Docs (fallback): callouts viram blockquotes simples · toggles viram H3 abertos. Resto idêntico.

Pré-leitura recomendada antes de publicar: 1 leitura completa em silêncio cronometrando o tempo. Alvo: 4-7 minutos.
```

3. **(Se Especialista pedir variação)**: oferece 2 ângulos alternativos da mesma Carta, mesmo conteúdo, abertura diferente (Bloco 1 reescrito), pra A/B testar.

---

## 9. Diagnóstico, sintomas comuns

| Sintoma | Causa provável | Fix |
|---|---|---|
| Cliente lê e diz "interessante mas vou pensar" | Bloco 1 espelhamento fraco · Bloco 4 sem urgência interna | Refaz Bloco 1 com situação concreta · adiciona Box "2 Tipos de Pessoas" antes do CTA |
| Carta tem 1.800+ palavras | Densidade não foi aplicada | Volta pra Etapa 5 · corta 30-40% |
| Cliente quer call de descoberta antes de avançar | Faca Soft quebrada (Carta explicou execução) · OU Bloco 3A fraco | Reescreve Bloco 3A · descreve resultado e função, não passo a passo |
| Lead chega no WhatsApp sem ter lido a Carta | CTA do Bloco 4 não pré-explica processo | Reescreve Bloco 4 explicando o que vai acontecer no WhatsApp (3 perguntas + preço) |
| Bloco 2 muito longo (mais de 400 palavras) | Lista de soluções comuns muito extensa · perde leitor | Corta pra 3-4 soluções máximo · cada uma em 1-2 frases |
| Cliente acha "muito direto" | Tom Soft é estranho pra quem está acostumado com pitch | Manter tom · Carta filtra na entrada · quem acha "muito direto" não é o cliente certo |
| Visual sobrecarregado | Múltiplos callouts coloridos · bullets em todo bloco | Volta pra Seção 4 · diagramação caso a caso · máximo 2-3 elementos visuais por bloco |

---

## 10. Tabela de decisão, quando consultar quais refs

| Tarefa específica | Reference |
|---|---|
| Construir versão-mestre dos 7 passos | `discurso-base-7-passos.md` |
| Mapear 7 passos pros 4 blocos | o corpo desta skill (SKILL.md) |
| Validar tom e densidade | `tom-e-ritmo-desejo.md` |
| Validar princípios desejo | o corpo desta skill (SKILL.md) |
| Garantir Bloco 4 ↔ primeira msg WhatsApp | o corpo desta skill (SKILL.md) |
| Tom Soft amplo (qualquer formato) | `shared-references/dicionario-conversacional.md` |
| Adaptação semântica pro nicho do cliente | `shared-references/adaptacao-semantica.md` |
| Aplicação nos 7 passos | `shared-references/crivo/05-premissas-mestras.md` |
| Versão em vídeo (alternativa à Carta) | a skill `soft-funil-miniwebinar` |
| Landing page com VSL ou multimídia | a skill `soft-funil-landing` |
| Webinar ao vivo ou perpétuo | skill `soft-webinar-plano` |


## Gate de saída obrigatório, o Crivo (bloqueante)

Antes de mostrar a peça, ela passa pelo Crivo embutido em `shared-references/crivo/`, nesta ordem:
1. **Ancoragem** (`crivo/01-entrada-verbatim.md`), na entrada e na checagem: toda fala entre aspas é verbatim literal da fonte real do cliente, e o ângulo-mãe tem N. Aspa que não bate na fonte reprova.
2. **Simulação na pele do avatar** (`crivo/02-simulacao-cliente.md`): onde ele larga, onde se reconhece, o teste dos 2 segundos.
3. **Gate CUB bloqueante + as 3 perguntas do gate** (`crivo/03-gate-cub.md`): imprime a tabela, o veredito é o pior bloco, peça que falha não sai, volta pra reescrita.

O anti-IA limpa o robô; o Crivo dá a força. Limpo não é forte. Os dois, nessa ordem. **Sem a tabela do Crivo impressa junto, a peça não foi entregue.**
