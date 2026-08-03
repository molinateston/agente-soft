---
name: soft-proposta-comercial
description: "Transforma uma call de venda gravada numa PROPOSTA COMERCIAL premium: um site HTML estático single-file (abas, diagnóstico, entregáveis com checkbox persistente, cronograma/Gantt, investimento, prova social, CTA), publicado num link único e privado por cliente. Pipeline em 4 etapas (transcrição → extração das informações-chave → geração do HTML no Layout Soft → publicação no Cloudflare Pages). Marca-neutra: cor, fontes, logo e prova social vêm do DONO. Use quando o dono fechar/conduzir uma call e precisar ENTREGAR a proposta em formato premium, pedir 'monta a proposta', 'proposta comercial', 'proposta de venda em HTML', 'site de proposta', 'orçamento premium', 'plano pro cliente', ou quiser fugir do PDF empacado com um link próprio. NÃO use para página de vendas PÚBLICA / landing / VSL (soft-funil-landing), nem para o script/objeção/fechamento da venda em si (soft-vendas-closer), nem para contrato (soft-contratos-consultoria)."
---

> 🔴 **REGRA DURA DE FRASE , "TODA FRASE SE EXPLICA SOZINHA"** (vale em TUDO que esta skill escrever pro público)
>
> Copy Soft é **frase que gera IMAGEM na cabeça de quem lê frio**. Não pode assumir que o leitor já sabe o assunto, o produto, a categoria, o método, o mecanismo ou o antes/depois. Toda frase que você escrever precisa se sustentar sozinha, sem depender do slide anterior, da bio, do título, ou do que "obviamente é". Frase curta que "soa punchy" e deixa o entendimento pro contexto é reprovada.
>
> **Teste antes de aprovar CADA frase:** "se essa frase caísse solta no scroll de uma pessoa que nunca ouviu falar do produto, ela entenderia O QUÊ + PRA QUEM + O RESULTADO CONCRETO?" Se não, REESCREVE nomeando explícito: qual é o objeto ("dieta", "calorias", "conta de calorias", não só "conta"), qual é o público ("mulher que já tentou emagrecer de todas as formas", não só "mulher que já tentou de tudo"), qual é o resultado concreto ("para de recomeçar a dieta", não só "para de recomeçar").
>
> **Ex reprovado →** *"Você come o que ama, um agente faz a conta do seu dia e você para de recomeçar."*
> **Ex aprovado →** *"Você passa a comer o que ama, um agente faz a conta de calorias do seu dia inteiro e não te deixa escorregar, e você para de recomeçar a dieta toda vez do zero."*
>
> Adicionar as 3-5 palavras que ancoram o contexto é MELHOR que a frase curta ambígua. Copy boa não é curta, é **inequívoca e imagética**. Frase que precisa de contexto pra ser entendida = frase quebrada, refaz.

> **REGRA-IRMÃ · "NENHUM VERBO ÓRFÃO" (cérebro preguiçoso do leitor):** o leitor tem cérebro preguiçoso e NÃO vai completar sua frase pra você. Todo verbo precisa vir com seu OBJETO NOMEADO na mesma frase, senão vira frase média. Verbos-armadilha que exigem complemento explícito: cortar (**cortar o quê?**), recomeçar (**recomeçar o quê?**), parar (**parar de quê?**), mudar, melhorar, escapar, largar, controlar, ajustar, resolver, virar, transformar. Sempre nomeia o objeto concreto (arroz, pão, doce, dieta, treino, agenda, cliente, valor), NUNCA deixa aberto.
>
> **Ex ✅ BOA (verbos ancorados + objetos nomeados):** *"Você come arroz, pão e o que ama, e uma ferramenta minha conta as calorias de tudo por você todo dia, pra você emagrecer sem viver de dieta."* , "come" tem objeto (arroz, pão), "conta" tem objeto (calorias), "emagrecer" tem contexto ("sem viver de dieta").
>
> **Ex ⚠️ MÉDIA (verbo órfão no fim):** *"…pra você emagrecer comendo o que gosta em vez de cortar."* , "cortar O QUÊ?" ficou pro leitor completar. Cérebro preguiçoso não completa, desiste. Correto: *"…em vez de cortar arroz, pão e doce."*
>
> Antes de aprovar a frase, sublinha mentalmente cada verbo e confere: cada um tem OBJETO nomeado? Não? Nomeia agora.

**Papel:** skill operacional de pós-call do método Soft. Entra DEPOIS que a venda foi conduzida (o script, a objeção e o fechamento são da `soft-vendas-closer`) e DEPOIS que a oferta existe (a oferta, a PUV e a prova vêm da `soft-plano-posicionamento`). Pega a call gravada e devolve a proposta materializada num site premium com link próprio e privado por cliente, o "vendedor silencioso" que o prospect reabre quando vai decidir. **É marca-neutra como a `soft-designer`**: não embute a cara de ninguém; cor accent, fontes, logo e prova social são do DONO (puxados da Fundação dele). Método completo e autossuficiente: `references/reference.md` (LER antes de executar).

## OUTPUT CONTRACT

- **Entrega principal:** um site HTML estático single-file (CSS+JS inline, zero build, funciona offline), publicado num link único e privado por cliente. É ISSO que o cliente recebe.
- **Extração validada:** um doc MD curto com os 12 campos, entregue ao dono ANTES do HTML pra ele conferir e liberar.
- **Mensagem de envio:** o texto curto que acompanha o link (validade de 7 dias), passado pelo filtro anti-IA embutido (as REGRAS INVIOLÁVEIS de conteúdo em `references/reference.md`, seção 7) antes de mandar.
- **Filtros obrigatórios em cima de toda a copy:** PT-BR com acentuação completa; zero travessões (sinal de IA mal calibrada); só números REAIS e verificáveis do dono na prova social.

### ⛔ SCRUB DE TRAVESSÃO (obrigatório, vale pra TODA peça)

Zero travessão não é rótulo, é passo. O travessão (o em-dash "," e o traço-longo "–") é o marcador nº1 de texto de IA e sai até no doc de extração se você não caçar. **ANTES de mostrar qualquer peça (extração, HTML, mensagem de envio, comentário CSS), rode um find de "," e de "–" no texto inteiro e troque cada um.** Nenhuma peça sai com travessão. Como reescrever, caso a caso:

- Aposto vira vírgula: `Dra. Priscila Andrade , OdontoVita` vira `Dra. Priscila Andrade, da OdontoVita`.
- Explicação vira ponto ou vírgula: `números da Camila , nunca atribuir ao cliente` vira `números da Camila. Nunca atribuir ao cliente`.
- Contagem vira "de" ou parênteses: `14 pessoas , 6 dentistas` vira `14 pessoas, sendo 6 dentistas`.
- Tag/etiqueta vira parênteses ou dois-pontos: `[UPSELL , ideia da Camila]` vira `[UPSELL (ideia da Camila)]`.
- Comentário de código vira dois-pontos: `/* azul-petróleo , cor da marca */` vira `/* azul-petróleo: cor da marca */`.

Se o find achar QUALQUER travessão, corrigir e rodar o find de novo até dar zero. Só então a peça sai.

## OS 12 CAMPOS DE EXTRAÇÃO

A proposta só é boa se a extração for boa. Ler a transcrição do começo ao fim, palavra por palavra, e preencher:

1. **Nome do cliente e da empresa** (grafia exata confirmada).
2. **Nicho ou segmento** (mercado e público).
3. **Produtos e serviços atuais** (o que já vende, ticket médio, volumes).
4. **Faturamento atual ou potencial** (números mencionados na call).
5. **Time atual e estrutura** (quantas pessoas, quem faz o quê).
6. **Dor central** (o que o cliente disse que precisa resolver, nas palavras dele).
7. **Objetivo de 12 meses** (onde ele quer estar no fim do contrato).
8. **Sugestões dadas pelo dono** (o que foi proposto como solução).
9. **Preço oferecido** (mentoria, consultoria ou os dois, com valores).
10. **Reação do cliente** (interessado, com objeção, fechou na hora, pediu prazo).
11. **Próximos passos** (combinados ao final da call).
12. **Personalizações específicas** (cor preferida, paleta da marca, tom de comunicação).

### Formato do doc de extração (é ESTE layout que sai pro dono, não a lista crua 1-12)

Os 12 campos acima são o que COLETAR. O que o dono VALIDA é um doc MD apresentado neste esqueleto (fonte: `references/reference.md`, seção 3-ETAPA2). Não devolver a lista numerada crua; devolver assim:

```
NOME DO CLIENTE | Nicho

Quem é: descrição em uma frase.

Situação atual:
| Item | Status |
|------|--------|
| Produto 1 | Descrição + ticket |
| Produto 2 | Descrição + ticket |

Dor principal: o que o cliente disse, com as palavras dele.

O que quer: lista do que ELE pediu de fato.
O que foi sugerido: lista do que o DONO propôs (upsell), separado.

Preços: Mentoria R$X / Consultoria R$Y.

Reação: interessado, com objeção, fechou, pediu prazo.

Personalização: cor da marca, tom desejado, observações.
```

### Regras de atribuição (não violar)

- **Nunca atribuir fala ou número do dono ao cliente.** Se o dono disse "faturei 96k em fevereiro", isso é do dono, não do cliente. Atribuição errada quebra confiança na hora. Identificar o falante na transcrição antes de extrair qualquer número.
- **Separar o que o cliente quer DE FATO do que foi só sugerido (upsell).** Se o cliente pediu o app e o dono sugeriu também uma comunidade paga, o app é entrega central e a comunidade é upsell sugerido, não entrega prometida.
- **Tangibilizar tudo o que foi discutido.** App vira telas e funções; agente de IA vira papel, ferramentas e integrações; evento vira local, formato e ticket. Se foi mencionado, é detalhado. E precificar o valor de mercado de qualquer software/app/SaaS no escopo (quanto custaria contratar dev separado), pra ancorar o investimento.

## ESTRUTURA DE ABAS (obrigatória)

Ordem fixa: **Visão Geral → abas personalizadas → Entregáveis → Plano de Ação → Investimento.** Média de 6 abas.

- **Visão Geral** (sempre 1ª): quem é o cliente, diagnóstico two-column (o que funciona × o que precisa mudar), solução em 3 a 5 pilares, callout com a tese central.
- **Personalizadas** (variam por cliente): ecossistema/escada de valor, automação com IA, concorrência, frentes de receita, calculadora de ROI, estudos de caso, pesquisa de mercado.
- **Entregáveis**: lista com checkboxes persistentes agrupada por categoria, progress bar no topo.
- **Plano de Ação**: fases mensais colapsáveis + gráfico Gantt no final.
- **Investimento** (sempre última, salvo variação): 2 a 3 opções, quem entrega, projeção de ROI, validade de 7 dias, próximos passos. Vira "Parceria" quando não há preço; some quando é plano de mentorado já ativo, briefing interno ou projeto de sócio.

### Componentes-âncora do Layout Soft

Template premium single-file, em 2 gerações (Dark Premium / Light Corporate), dirigido por variáveis de CSS pra cada dono usar a própria paleta. Componentes que não podem faltar:

- **Hero**: nome do cliente em destaque, badge, subtítulo com posicionamento, 3 a 5 métricas-âncora, gradient por nicho.
- **Entregáveis com checkbox persistente**: marcação salva no localStorage + progress bar que conta o percentual lido.
- **Cronograma**: fases com número circular, entregas, período, e Gantt.
- **Investimento com 2 a 3 opções**: two-column (mentoria × consultoria), badge "MAIS COMPLETO" no premium, nunca opção única.
- **Prova social**: cards com números REAIS do dono (da `soft-plano-posicionamento`/banco de provas, nunca inventar, nunca número de terceiro).
- **CTA + FAQ**: convite à decisão com contato direto + 4 a 6 perguntas frequentes.

Cor accent e gradient mudam por nicho (espiritualidade roxo, arte gold, saúde verde, tech azul, vinícola/luxo vinho). Tipografia default Cormorant Garamond + DM Sans; o dono pode trocar pela ID dele (`soft-designer`).

## ⛔ STOP OBRIGATÓRIO

**Validar os 12 campos com o dono ANTES de gerar o HTML.** Montar o doc MD da extração no esqueleto acima, mostrar pro dono, e só seguir pro Layout Soft depois que ele confirmar. Proposta gerada em cima de extração não validada sai com erro de atribuição e quebra a venda.

**O STOP encerra o turno.** NÃO gere o HTML no mesmo turno da extração. NÃO simule, invente nem assuma o OK do dono ("pode seguir", "gera o site") pra continuar sozinho: fabricar a confirmação anula o gate. Entregue SÓ o doc de extração e devolva o turno esperando a confirmação REAL dele. O HTML é o próximo turno, depois que ele responder de verdade.

## APP-FALLBACK (sem Bash)

No app, sem acesso a shell: receber a transcrição ou o resumo da call colado pelo dono, rodar a extração dos 12 campos no esqueleto validável, e entregar SÓ o doc de extração. **Aqui vale o STOP: entregue a extração e devolva o turno; não gere o HTML no mesmo turno, não simule o OK do dono.** O HTML é o próximo turno, depois da confirmação real dele.

Quando ele confirmar, entregar o site como **artifact HTML**, em UMA peça só, via ferramenta de artifact de uma vez. Nunca colar o HTML em pedaços no chat nem pingar por partes: é um arquivo único, entregue pronto pra visualizar.

**Fontes no app (artifact tem CSP estrita):** o artifact BLOQUEIA host externo, então `<link>` pro `fonts.googleapis.com` NÃO funciona e a tipografia premium quebra no fallback genérico. No app/artifact, ou embutir as fontes (Cormorant Garamond + DM Sans) como `data:` URI no CSS, ou declarar uma stack de sistema como fallback explícito (ex.: `Cormorant Garamond, Georgia, "Times New Roman", serif` pros títulos e `DM Sans, -apple-system, "Segoe UI", Roboto, sans-serif` pro corpo). O `<link>` pro Google Fonts só vale no fluxo Claude Code / Cloudflare Pages, nunca no artifact.

A publicação no Cloudflare Pages é passo do Claude Code (com o token do dono no ambiente); no app, entrega-se o HTML e o dono publica pelo fluxo dele.

**A proposta nunca fica presa por falta de deploy.** Com o token de publicação do dono no ambiente, você PUBLICA e devolve o link privado pronto pra mandar. Sem o token (ou no app), entrega o HTML final pronto pra publicar e o passo-a-passo curto (arrastar o arquivo em pages.cloudflare.com > Create > Upload, ou o comando `wrangler pages deploy`), mesma proposta, só sem o link automático. Fecha em 1 linha o que ele passa a ganhar: "com seu token do Cloudflare salvo, eu já te devolvo o link privado publicado, sem você subir nada" (pra ele escolher, sem empurrar).

## 📦 O QUE ESTA SKILL PRODUZ

Uma proposta comercial premium, entregue como **site HTML estático single-file** (zero build, CSS+JS inline, funciona offline), com link **único e privado** por cliente:

- **Diagnóstico extraído da call** , 12 campos-chave (nicho, produtos/ticket, dor central, objetivo de 12 meses, o que o cliente pediu × o que foi sugerido, preço, reação, próximos passos…), validado com o dono ANTES do HTML. Regra de ouro: **nunca atribuir fala/número do dono ao cliente**; separar o que o cliente quer do que foi só sugerido (upsell); tangibilizar tudo; precificar o valor de mercado de qualquer app/SaaS no escopo.
- **Layout Soft** , template premium em 2 gerações (Dark Premium / Light Corporate), dirigido por variáveis de CSS (cada cliente escolhe a própria paleta/ID), com ~15 componentes prontos: hero com métricas-âncora, diagnóstico two-column, pilares, **entregáveis com checkbox persistente + barra de progresso**, cronograma/Gantt, investimento two-column, prova social, CTA + FAQ.
- **Estrutura de conteúdo** , abas obrigatórias (Visão Geral → personalizadas → Entregáveis → Plano de Ação → Investimento) + variações da última aba por tipo de proposta.
- **Apresentação da oferta** , 2 a 3 opções (nunca uma só), validade de 7 dias, ancoragem por custo evitado/ROI. Os VALORES são do dono (`soft-plano-posicionamento`); a skill formata, não define preço.
- **Publicação** , Cloudflare Pages (o mesmo fluxo de deploy que o dono já usa), com slug privado não-adivinhável, SSL e teste mobile.
- **Checklist de qualidade + erros históricos** , guardrails de conteúdo, visual, técnico e entrega.

**Filtros obrigatórios:** toda a copy passa pelo filtro anti-IA embutido (as REGRAS INVIOLÁVEIS de conteúdo em `references/reference.md`, seção 7): PT-BR com acentuação completa, **zero travessões**, sinal de IA mal calibrada; o visual segue a ID do dono na `soft-designer`; a prova social usa só números REAIS e verificáveis do dono (nunca inventar, nunca usar número de terceiro).

**Serve o agente:** equipa o LEON/cliente a fechar high-ticket com uma proposta que parece feita à mão, sem designer humano. A condução da venda é da `soft-vendas-closer`; aqui é só a materialização da proposta.

## COMO RODAR (resumo)

1. **Onboarding (1ª vez):** confirmar o token de publicação do dono (Cloudflare Pages) e a ID visual dele (puxar da `soft-designer`/`soft-plano-posicionamento`). Guardar na config do dono , nunca hardcodar.
2. **Pipeline (4 etapas)** , seguir `references/reference.md`: transcrever a call → extrair os 12 campos e validar com o dono → gerar o HTML no Layout Soft com a ID/oferta do dono → publicar no link privado.
3. **Antes de entregar:** rodar o checklist de qualidade (seção 9) e o filtro anti-IA embutido (as REGRAS INVIOLÁVEIS de conteúdo em `references/reference.md`, seção 7).

> Regra-mãe: a proposta só é boa se a EXTRAÇÃO for boa. A maior parte do tempo é entender a call, não montar o HTML.

## NOTA DE ENTREGA

A entrega É o site (artifact HTML no app, ou link privado publicado no Cloudflare Pages via Claude Code). O doc MD consolidado desta skill é a **extração validada** dos 12 campos, que sai ANTES do HTML pra o dono conferir; não se despeja a extração no chat solto, entrega-se como doc. A mensagem de envio do link também passa pelo filtro anti-IA embutido (as REGRAS INVIOLÁVEIS de conteúdo em `references/reference.md`, seção 7).

No agente/Telegram: tem Bash, então roda o pipeline e publica igual ao Claude Code; salva o HTML e o doc MD da extração em disco e cita o path completo de cada um na resposta (o bridge anexa o arquivo). Condução em mensagens curtas, sem markdown pesado (nada de ##, nem tabela). Se o token de publicação do dono não estiver no ambiente, entrega só o arquivo HTML pelo path e o dono publica pelo fluxo dele.

## When NOT to use

- Página de vendas PÚBLICA, landing ou VSL: é `soft-funil-landing`.
- Script, objeção ou fechamento da venda em si: é `soft-vendas-closer`.
- Contrato de prestação de serviço pra assinar: é `soft-contratos-consultoria`.
- Definir a oferta, a PUV, o preço ou a prova do zero: é `soft-plano-posicionamento`. Aqui a skill só formata o que já existe.
- Definir a identidade visual do dono do zero: é `soft-designer`. Aqui a skill só aplica a ID dele.

## Anti-Patterns

- Gerar o HTML sem validar os 12 campos com o dono antes (pula o STOP).
- Atribuir fala ou número do dono ao cliente, ou misturar o que o cliente pediu com o que foi só sugerido.
- Inventar número de prova social, ou usar número de terceiro como se fosse do dono.
- Apresentar opção única de investimento (sempre 2 a 3).
- Meter travessão, deixar palavra sem acento, ou copiar o exemplo ilustrativo em vez de modelar a qualidade dele.
- Hardcodar o token de publicação do dono no HTML ou na skill; entregar link sem HTTPS/cadeado.


---

## RÉGUA DE DIAGRAMAÇÃO obrigatória (18/07/2026)

Todo doc/entregável que essa skill produz DEVE seguir `skills/shared-references/REGUA-DIAGRAMACAO-DOCS.md`:

- Topo: rótulo pequeno + título grande + subtítulo + metadata `chave: valor`
- Números ANTES da narrativa (seção "0" com tabela/KPI ancora tudo)
- Numeração hierárquica (1, 2, 3.1, 3.2), divisa entre seções
- Bloco padronizado que se repete em TODAS as seções
- Bullet > parágrafo, com palavra-âncora em **negrito**
- Callouts (azul/verde/amarelo/vermelho) 1 por seção no máximo
- Comparação = 2 colunas paralelas · Fluxo = seta ↓ · KPI = cards
- Aspas literais pra citação · badges pra marcar novidade
- Fecha com checklist acionável (dono/prazo quando existe)
- Zero gordura: NUNCA "vale destacar", "importante notar", "além disso", "por outro lado", "em suma", "conforme mencionado", "neste documento", "vamos explorar"
- **Zero changelog** dentro do doc (não escreva "atualizei X, antes era Y")
- **Zero meta-processo** ("pesquisei X, cruzei com Y")
- 1 bloco = 1 tela de celular (o dono lê no Telegram)

**Teste antes de entregar:** (1) topo bate no padrão? (2) número ancora antes da narrativa? (3) bloco padronizado repete? (4) callout ≤1 por seção? (5) checklist acionável no fim? (6) zero das palavras proibidas? Se sim nos 6 → entrega. Se não → reescreve.

## GATE OBRIGATORIO soft-critico-copy

Antes de entregar QUALQUER linha de copy publica que sai desta skill (headline, hook, corpo, CTA, script, roteiro, legenda, e-mail, mensagem, pagina), a copy passa por soft-critico-copy: 4 filtros na ordem (CUB, Estrutura-mae, Anti-IA, Verbatim). Se reprova em qualquer um, reescreve e reroda ate zero falha dura.

Rodar: `python3 ~/.claude/skills/soft-critico-copy/scripts/lint_copy.py <arquivo>`


============================================================
MODO PIPELINE Q&A GUIADO RETOMÁVEL (mold soft-webinar-plano), 2026-07-23
============================================================

Esta skill agora OPERA em Q&A guiado retomável, no mesmo molde da
soft-webinar-plano. O corpo acima é a FONTE DE MÉTODO (os frameworks,
as tabelas, as fórmulas, os anti-patterns, os checks do gate). O
pipeline abaixo é a EXPERIÊNCIA que conduz o dono pelo método,
uma pergunta por vez, com preview e retomabilidade.

Ordem sempre: (a) chega pedido, (b) roda M0 pra identificar sub-caso,
(c) roda P0 pra importar o que já existe e pular perguntas cobertas,
(d) roda as Fases numeradas, cada uma UMA pergunta por vez com 2-3
opções cruzando com o método do corpo, (e) preview a cada 5 respostas,
(f) fecha com o gate.


REGRAS TRANSVERSAIS DURAS (valem em TODOS os blocos)

1) UMA PERGUNTA POR VEZ. Nunca despejar 5 perguntas juntas. Nunca
   continuar antes da resposta anterior.

2) SUGERE 2-3 OPÇÕES depois das perguntas cruas. Nunca sugestão única
   (vira empurrão). As opções vêm cruzando a resposta do dono com o
   método do corpo acima. Ele escolhe, edita, ou pede mais.

3) PREVIEW a cada 5 respostas. Bloco curto: "com o que você me deu
   até agora, o esqueleto ta assim: [3-4 linhas]. seguimos?".

4) ZERO DEFAULT DO DONO DO MÉTODO (o dono). Exemplos do produto do dono
   (Operação SOFT, Mesa de Operação, Call de Arquitetura) só entram
   como REFERÊNCIA marcada "(exemplo, não copia)". Naming do dono da
   skill é SEMPRE aberto: ele escolhe o nome. A skill NUNCA impõe.

5) RETOMABILIDADE. A cada resposta o state cai em
   /tmp/<skill>-<slug>-<epoch>.json. Se o dono chamar de novo (ou
   sair e voltar), a skill lê o state mais recente e pergunta
   "quer continuar de onde parou ou começar novo?".

6) SAIR/PAUSAR SALVA. "sai", "pausa", "amanhã" → salva state, avisa
   o path, encerra limpo.

7) PULAR = "[A CONFIRMAR]". Se o dono digitar "pula" ou "depois", a
   resposta vira [A CONFIRMAR - <bloco>] no state e o pacote final
   marca esses pontos pra ele afinar.

8) RESPOSTA RASA = REFAZ A PERGUNTA. Se o dono responde em 3 palavras
   algo que precisa contexto, devolve UMA pergunta específica pra
   abrir mais.

9) ZERO INVENTAR DADO DO DONO. Preço, número, case, nome de cliente,
   fala do avatar: se não respondeu, pergunta. Nunca chuta.

10) NAMING USER-FRIENDLY. Nomes internos (canonico/high_ticket, tipo
    A/B/C) nunca aparecem na cara do dono. Perguntar sempre pelo
    resultado que ele quer.


COMO OPERA (o loop)

Passo 1 - CHECA state antigo
   Lê /tmp/<skill>-*.json. Se encontrou, pergunta "vi um trabalho
   de {data} sobre {tese}. continua ou começa novo?".

Passo 2 - RODA a fase atual
   Uma pergunta por vez. Salva resposta no state. Cruza com o método
   do corpo. Devolve 2-3 sugestões. Dono escolhe ou edita.

Passo 3 - PREVIEW a cada 5 respostas
   Bloco curto de progresso.

Passo 4 - AVANÇA pra próxima fase quando fecha a atual
   Anuncia em uma linha: "beleza, agora vou pra {nome amigável}".

Passo 5 - NA FASE DE GERAÇÃO
   Monta o entregável usando o método do corpo (as fórmulas dos
   blocos, o gate, os anti-patterns).

Passo 6 - ENTREGA
   Google Doc (via gog drive upload --convert) OU artefato específico
   da skill + resumo curto + lista de [A CONFIRMAR] pendentes.


ESTADO EM /tmp

Arquivo: /tmp/<skill>-<slug>-<epoch>.json

Formato mínimo:
{
  "skill": "<nome>",
  "slug": "<slug curto>",
  "epoch": <unix>,
  "criado_em": "<ISO>",
  "atualizado_em": "<ISO>",
  "fase_atual": "M0|P0|F1|F2|...|Fn|entrega",
  "sub_caso": "<valor de M0>",
  "pecas_prontas": {},
  "respostas": {},
  "pendentes_a_confirmar": []
}



============================================================
M0 / P0 / FASES, soft-proposta-comercial
============================================================

M0. MODO, UMA pergunta abre o sub-caso:
"que proposta você quer montar agora?
 (a) proposta 1:1 pra cliente específico (personalizada)
 (b) template reutilizável (padrão pro time usar)
 (c) reengenhar proposta antiga que não fechou
 (d) só a parte de precificação/escopo (a proposta em si já
     existe, falta cravar valor)
 (e) proposta de continuidade/renovação de cliente atual"

Grava state.sub_caso.


P0. IMPORT DE PEÇAS PRONTAS, UMA pergunta com checklist:
"marca com sim/não:

- Plano de posicionamento (Oferta, PUV, Mecanismo, Voz)
- Diagnóstico do cliente (dor nomeada, contexto, restrições)
- Cases reais em nicho parecido
- Ticket + garantia + escopo canônico
- Proposta anterior rodando (pra modelar)
- Reunião de diagnóstico já feita (áudio/transcrição/notas)
- Verbatim do cliente (o que ELE falou)
- Nada, começo do zero"

Salva em state.pecas_prontas.


FASES

F1. BRIEFING, quem é o cliente, qual o problema em 1 linha,
    canal de entrega da proposta (Doc/PDF/reunião), prazo.

F2. LEITURA DO PROBLEMA, devolve em 3-5 bullets o que ouviu
    do cliente na LINGUAGEM DELE (verbatim). Cliente se sente
    lido antes de ver preço.

F3. DIAGNÓSTICO EM 1 FRASE, a causa-raiz que só você enxerga.
    Mecanismo do problema.

F4. CAMINHO PROPOSTO, o mecanismo da solução (não o método
    técnico, o mecanismo do resultado). 3-5 etapas nomeadas.

F5. ESCOPO, o que entrega, com que ritmo, o que NÃO entrega
    (recorte explícito).

F6. INVESTIMENTO, âncora → valor → forma de pagamento →
    garantia → prazo de validade da proposta.

F7. PRÓXIMO PASSO, 1 ação clara (assinar, marcar call, Pix).

F8. GATE INTERNO + soft-critico-copy nas partes de venda
    (leitura, diagnóstico, caminho, investimento).

F9. ENTREGA Google Doc com proposta bloco a bloco em tom Soft
    (clínico, sem convencer, sem enfeite).

State: /tmp/soft-proposta-comercial-<slug>-<epoch>.json

