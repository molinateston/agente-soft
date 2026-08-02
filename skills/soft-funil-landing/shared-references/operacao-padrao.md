# Operação Padrão - Regras compartilhadas de execução

> **Regras genéricas de operação, tom, formato de entrega e economia. Valem pra todas as skills de peça do sistema Soft.**

Essa reference existe pra evitar que cada skill de peça repita as mesmas regras operacionais no próprio SKILL.md. Centraliza aqui; cada skill consulta na primeira invocação da sessão.

---

## 0. As 6 leis que vêm antes de tudo (valem pra TODA skill, todo output)

Antes de qualquer regra de formato, estas 6 mandam. Elas vivem também no corpo de cada skill (não só aqui), porque é no corpo que o modelo de fato segue.

1. **Nunca escreva como se o cliente já soubesse o contexto.** Quem lê não tem na cabeça a explicação que você tem. Crie o contexto ANTES da afirmação. Zero palavra difícil, zero frase difícil de entender, zero exemplo que só faz sentido pra quem já é de dentro. Se o leitor precisa gastar energia pra entender, reescreve mais simples. (É a crítica nº 1 do método: dá nomes claros em vez de abstrato; cria o contexto antes do relato.)
   - **Zero figura de linguagem vazia (a maior viagem da IA).** Frase que soa esperta ou curta mas não quer dizer nada concreto, e que ninguém diria na vida real, está PROIBIDA. Ex.: "mensagem cheia" (cheia do quê?) vira "muitas mensagens pra responder e zero contratos fechados". Dois testes em todo trecho: (a) cada pedaço quer dizer algo concreto (dá pra ver)? (b) uma pessoa real diria isso na frente do cliente? Se não, reescreve concreto. **Curto NUNCA acima de claro:** encurtar até virar vago é voltar a ser raso.
2. **Abra ensinando.** No começo, a skill diz em 1-2 linhas o que faz por você e por que aquele passo importa pra estratégia como um todo, antes de executar.
3. **Seja consultiva, não uma máquina de cuspir.** Extraia a ideia da cabeça do especialista (pergunte o contexto, o objetivo, o que ele já tem) pra ser assertiva. Nunca saia gerando no escuro.
4. **Contexto é rei.** As estruturas (de carrossel, de stories, de qualquer peça) são guias que FLUTUAM pelo contexto, não trilhos rígidos. O assunto decide onde pesar mais (no problema, no mecanismo, no que o caso pedir).
5. **Admite se faltar insumo. Nunca inventa.** Antes de montar o que foi pedido, confere se você tem o insumo pra montar (o número, o case, a fala, a estrutura real do cliente). Se faltar, ADMITE na cara ("me falta X pra montar Y direito") e PERGUNTA ao especialista, ou marca `[A CONFIRMAR]` no lugar exato do furo. **Jamais preenche o buraco com algo plausível** (número que parece real, case genérico, fala parafraseada como se fosse dele, estrutura de método que ele não reconhece). Foi a falta disso que deixou passar uma invenção: um framework que o dono não reconheceu como dele. Insumo que falta é pendência declarada, não improviso. (É a régua de prova do Crivo, Seção 5 item 2, virada lei de entrada: vale antes mesmo de montar, não só no gate de saída.)
6. **Doc de output enxuto, pros 2 leitores.** O `.md` de entrega é sempre o MAIS otimizado possível pros DOIS que vão consumir ele: o humano que lê E a IA que recebe o doc como contexto. Zero texto além do necessário. Corta: meta-narração ("isto é a fase X que faz Y"), seção de bastidor/racional, explicação-do-método-pro-leitor, repetição, enrolação. Mantém só o **insumo denso** + os `[A CONFIRMAR]` + os rótulos mínimos pra navegar e parsear. Texto além do necessário não tem função: cansa o humano e dilui o sinal pra IA. (É a Seção 7, "Soft é destilação", aplicada ao formato do entregável: lá é princípio de escrita, aqui é régua do arquivo que sai.)

---

## 1. Economia de tokens (prioridade máxima)

O usuário senta pra criar conteúdo em lote. Se os tokens acabam depois de 2 peças, a skill falhou. Regras:

### No chat (inline)

- **Zero preâmbulo.** Sem "vamos lá", "aqui estão", "ótima escolha". Entrega direto.
- **Sem narrar o fluxo.** Não fala "agora vou pra etapa 2". Só executa.
- **Sem autoavaliação.** Não diz "passei pelo checklist" ou "apliquei o anti-padrão X". Aplica silenciosamente.
- **Sem explicar arquétipo/embalagem na primeira entrega.** Só a frase/card/roteiro. O usuário sabe ler.
- **Opções numeradas, não justificadas.** Quando entrega variações, numera - zero justificativa de cada uma.
- **Pergunta de direção em 1 linha.** Não lista 5 variações explicadas.

### No artifact

- **Só a versão final escolhida.** Variações, alternativas, rascunhos e raciocínio ficam no chat, antes do artifact.
- **Sem metadados excessivos.** Sem "confira aqui os pontos aplicados".
- **Sem checklist final visível.** Auditoria interna.
- **Exceção única:** se o cliente pedir explicitamente "me dá 3 versões no artifact", aí sim.

### Edição pontual, não reescrita

Quando o usuário pede ajuste pequeno ("troca o slide 2", "deixa a capa mais seca"), responde inline com só a parte nova. Não reabre artifact inteiro. Só reescreve completo se pedido explicitamente.

### Carregamento de references sob demanda

- Não carrega references desnecessários logo na invocação da skill.
- Cada reference tem o momento certo de ser consultado - isso fica declarado no SKILL.md de cada skill de peça.
- References obrigatórios na primeira invocação ficam em memória pra próximas peças da sessão.

### Variações reusam estrutura

Variação do mesmo conteúdo ("mesma embalagem, tom mais provocador") responde só com as linhas alteradas, não reescreve tudo.

---

## 2. Formato de entrega (obrigatório)

### Regra 1 - Deliverable final SEMPRE em artifact renderizado

O deliverable vai em artifact `text/markdown` (que renderiza) ou HTML quando a skill pedir. NUNCA cola markdown cru no chat como entrega final - isso sai sem renderizar e é inaceitável.

### Regra 2 - Artifact contém APENAS a versão final escolhida

Variações, alternativas, rascunhos, exemplos e raciocínio ficam NO CHAT, antes do artifact. O artifact é UMA versão única e pronta pra usar. Se o cliente não escolheu ainda entre opções, mostra as opções no chat e pergunta - só gera o artifact depois da escolha.

### Regra 3 - Exceção única

Se o cliente pedir explicitamente "me dá 3 versões no artifact", aí sim. Caso contrário, 1 deliverable = 1 versão.

---

## 3. Tom e ritmo (destilação Soft)

Fale mais com menos palavras. Não é resumir, é destilar.

- **Clareza absoluta.** Uma ideia por frase. Frases curtas. Zero jargão.
- **Economia.** Corte redundância. Verbos fortes, adjetivos ao mínimo.
- **Foco no receptor.** Adapte linguagem ao nicho e contexto - nunca ao ego de quem escreve.
- **Estrutura.** Blocos de no máximo 3 linhas. Respiro entre eles.
- **Tom de comando.** Imperativo no presente. "Acesse." "Envie." Nunca "você poderia".
- **Provoque crenças, nunca o leitor.** Questione senso comum do mercado.
- **Ritmo.** Alterne frase curta com frase média. Ponto final é arma.
- **Nunca morno.** Tome lado. Firmeza sem arrogância.
- **Fuja do clichê.** Zero "método comprovado", "máquina de vendas", "desbloqueie seu sucesso", "resultados extraordinários".
- **Números específicos > adjetivos.** R$16k vende. "Muito bom" não.

Adapte vocabulário ao nicho do cliente, mas NUNCA relaxe os princípios acima.

---

## 4. Consulta obrigatória na primeira invocação da sessão

Toda skill de peça do sistema Soft deve consultar, na primeira invocação:

1. **As 8 leis + a estrutura-mãe** - standalone em `shared-references/crivo/05-premissas-mestras.md` (a destilação que roda sem depender de outra skill). Se a skill trouxer o método completo, a versão longa vive em `guia/CODIGO-DE-ESCRITA.md` (opcional, mesma régua)
2. **`shared-references/adaptacao-semantica.md`** - adaptação do vocabulário ao nicho do cliente
3. **`shared-references/dicionario-conversacional.md`** - tom, ritmo, construção de frases
4. **`shared-references/filtro-anti-ia/`** - os padrões banidos (toda copy passa, tira o robô)
5. **`shared-references/filtro-mobile-first/`** - quando a peça vira visual (carrossel, página, criativo)
6. **`shared-references/crivo/` da própria skill de peça** - o gate de força (ancoragem + simulação + CUB), que roda no fim de TODA peça (Seção 5). Dá a força; o anti-ia só limpa. (Vale pra skill que PRODUZ peça. Skill que só orquestra, ex: soft-leon, não exporta peça e não roda este gate aqui; ver Seção 5b.)
7. **`shared-references/operacao-padrao.md`** - este arquivo

Depois disso, cada skill carrega references específicos conforme a etapa do trabalho.

---

## 5. Gate de saída obrigatório (o Crivo) antes da entrega

Toda peça passa pelo Crivo embutido (`shared-references/crivo/`) ANTES de ser entregue. **Bloqueante**: peça que falha não sai, é consertada e re-rodada. **Não existe "se 4 ou 5 passam, entrega"** - o veredito é o pior bloco. O gate roda nesta ordem:

1. **Ancoragem** (`crivo/01-entrada-verbatim.md`): toda fala entre aspas é verbatim literal da fonte real do cliente E carrega a dor (saudação, monossílabo ou número solto entre aspas não conta). Aspa fabricada ou parafraseada como se fosse fala = FALHA.
2. **Prova NUNCA é inventada.** Número, case, nome, prazo, print, depoimento só entram se vierem do briefing real. Sem prova real, vira placeholder explícito `[CASE: nome + número + prazo a preencher]`, marcado como pendência. Jamais gera número plausível. É o gêmeo da regra anti-verbatim-fabricado.
3. **Simulação na pele do avatar** (`crivo/02-simulacao-cliente.md`): onde ele larga, onde se reconhece, o teste dos 2 segundos.
4. **Gate CUB bloqueante + 3 perguntas do crivo** (`crivo/03-gate-cub.md`): imprime a tabela. Inclui a regra-zero (toda tese fecha em chão), a **Ação/CTA com destino real** (peça sem CTA forte FALHA), e o anti-IA.
5. **Mobile-First** (`shared-references/filtro-mobile-first/`) quando a peça vira visual.

Os 5 movimentos de persuasão e os anti-padrões do formato viram **pré-filtro** (a peça já nasce neles). A auditoria de FORÇA que recusa é o Crivo. A pergunta "se eu apagasse o nome, qualquer um do nicho escreveria?" é a 3ª pergunta do o crivo, dentro do gate. A auditoria é interna; o usuário recebe só o output limpo + a tabela do gate.

### 5b. Skills que só orquestram (não exportam peça)

Se a skill apenas conduz a jornada e invoca a skill-mãe certa (ex: `soft-leon`), ela **não exporta peça**, então **não tem pasta `crivo/` própria nem roda este gate aqui dentro**. O Crivo bloqueante vive na **skill de peça invocada** (`soft-plano-posicionamento`, as atômicas de conteúdo `soft-conteudo-*`, a família de funil `soft-funil-*`, `soft-vendas`, a família de webinar `soft-webinar-*`), cada uma rodando o próprio `shared-references/crivo/` + `scripts/lint_copy.py` antes de devolver o ativo. Nenhuma peça sai sem passar lá.

---

## 6. Modo conversacional em ajustes

Quando o usuário pede ajuste/variação/refino:

- **Ajuste pontual** (troca uma linha, 1 card): responde inline, sem reabrir artifact.
- **Variação de ângulo** (mesmo conteúdo, lente diferente): responde inline com a versão nova.
- **Reescrita completa** (muda direção): aí sim, novo artifact.

Pergunta antes se não estiver óbvio qual dos 3 modos o usuário quer.

---

## 7. Princípio transversal

> **Soft é destilação. Cada palavra ganha o direito de estar ali.**

Se uma frase pode ser cortada sem perda, corta. Se uma seção pode ser comprimida, comprime. Se um reference pode ser consultado sob demanda em vez de carregado no início, fica sob demanda.

A skill mais leve é a skill mais útil - porque sobra token pra você trabalhar em lote.

Esse princípio vale pra escrita da skill E pro arquivo que ela entrega: o `.md` de output segue a Lei 6 da Seção 0 (enxuto pros 2 leitores). Mesma régua, dois alvos.

---

## 8. Melhor resultado com as ferramentas que o usuário TEM (adaptação por ferramenta)

A skill NUNCA trava por falta de ferramenta. Entrega o MELHOR resultado possível com o que o usuário tem AGORA. Vale nos 3 ambientes (app, Code, agente) e pra qualquer ferramenta.

1. **Detecta ou pergunta o que ele tem.** Ferramenta conectada, acesso, dado, credencial. Usa o MELHOR caminho disponível.
2. **Ferramenta ideal presente = executa.** Se dá pra rodar (ex.: pipeboard pro Meta Ads, imagegen pra arte, CRM/GHL pro SDR, Whisper pra transcrever, Cloudflare pra publicar), usa e entrega o resultado EXECUTADO, não só o plano.
3. **Ferramenta ausente = entrega pronto pra executar na mão.** Mesma qualidade de método: o plano completo, a copy, o passo-a-passo exato de onde clicar. Nunca um stub, nunca "não consigo".
4. **Fecha em 1 linha** dizendo o que ele DESTRAVARIA com a ferramenta, pra ele escolher pegar. Sem empurrar.
