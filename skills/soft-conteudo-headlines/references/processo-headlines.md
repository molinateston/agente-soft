
# Headlines, Pilar 2 · Feed (a abertura que para o scroll)

A decisão de ficar ou pular acontece em menos de 2 segundos. A abertura é 90% do jogo. Esta skill gera headlines auditadas em segundos quando há fundação empacada, e gera mesmo sem ela, em modo input livre. Não inventa teoria: executa o método do guia.

## A fonte é o guia, leia primeiro

O método vive no guia, não nesta reference. **Na primeira invocação da sessão, leia:**
- **`guia/07-reel.md`** (Cap 7), onde mora o **banco de 30 templates de headline** (7.11, tabela completa com gatilho dominante), os **3 tipos** Falar/Mostrar/Texto na tela (7.4), os **7 gatilhos da atenção** (7.4) e a régua mesa-sentado (7.12). **É o repositório operacional de headlines do guia.**
- **`guia/05-feed-conteudo.md`** (Cap 5), as **3 fontes de assunto** (universal · nicho · momento) e a regra de combinar dois assuntos (5.2), as três frentes da abertura (5.3), e a régua de tudo: *o cliente entende e confia mais rápido.*

Esta skill é o **processo de execução**, como combinar assunto + gatilho + tipo e como auditar. Os 30 templates, os 7 gatilhos e os 3 tipos **não se duplicam aqui**: consulte o guia. Os exemplos do banco são ilustração de outros nichos, **adapte ao nicho do especialista, nunca copie a frase pronta.**

## O que a headline tem que fazer (premissa honesta)

A headline **filtra E atrai**. Ela não fecha venda, para o scroll do público qualificado e instala a percepção que faz quem chega na conversa já estar mais quente. Atrai e qualifica ao mesmo tempo; a venda acontece depois, na Carta e no WhatsApp. Headline que só viraliza (atrai estranho que nunca compra) falhou tanto quanto a que ninguém para.

**Teste único:** se a pessoa lesse só a headline, sem mais nada, ela pararia o scroll? Se não, refaz.

## A fundação (input padrão)

A headline puxa de uma fundação empacada que o especialista defende **falando**, não escrevendo. Ela sai do **Bloco 5 (Fundação de Headlines) do Plano de Marca Pessoal** (Cap 2), produzido pela `soft-plano-posicionamento`. Os 4 itens:

| Item | O que é | De onde vem |
|---|---|---|
| **Tese central** | Frase falada com imagem mental clara, sem palavra-container vazia | Promessa + Problema Avançado |
| **Inimigos nominais (top 3)** | O que o especialista ATACA frontalmente | Soluções comuns que falham |
| **Lista do "não defendo"** | O que não discute, nem como "fazer melhor" | Filosofia do método |
| **Cliente em uma frase** | O que o cliente JÁ TEM (não o que falta) | Cliente Ideal + Público de Problema Avançado |

A skill carrega esses itens, nesta ordem de fonte: (1) descrição do projeto Claude (campo "Fundação de Headlines"), (2) mensagem anterior da conversa, (3) Bloco 5 colado na invocação. **Se faltar item**, faz só as perguntas correspondentes, todas numa mensagem só, nunca um ritual de 4 mensagens, e nunca pergunta o que dá pra destilar do que já tem.

> Sem fundação empacada **e** sem input livre, não gera headline, pergunta primeiro.

## Processo de geração (o que esta reference faz, passo a passo)

Pra cada headline, a skill combina três camadas e audita. Em silêncio, não narra o fluxo.

1. **Assunto**, escolhe a fonte que carrega a tese pra fora (universal · nicho · momento, Cap 5.2). Quando der, cruza dois assuntos pra multiplicar público. A tese vai sempre por dentro; assunto sem tese vira jornalismo que atrai estranho. A headline é o primeiro movimento da estrutura-mãe (Diagnóstico/Nomeação/Polaridade): **reorganiza percepção**, não anuncia, abre uma tensão (invisível × procurado, volume × percepção) ou nomeia o fenômeno que o cliente sente e nunca soube dizer.
2. **Gatilho**, decide qual dos 7 gatilhos (Cap 7.4) quer ativar e vai ao banco de 30 templates buscar a fórmula que encaixa. O inimigo nominal entra como "atacar", nunca como "ensinar a fazer melhor".
3. **Tipo de entrega**, pra reel/anúncio em vídeo, escreve nos **3 tipos** (Falar · Mostrar · Texto na tela), buscando o conflito entre eles que prende (Cap 7.4). Pra carrossel/story, a manchete da capa + uma sugestão visual.
4. **Auditoria (invisível, antes de entregar)**, roda a régua abaixo. Headline que falha é refeita, não entregue como "passa fraco".

### Régua de auditoria

| Checa | Passa se |
|---|---|
| **Para o scroll** | Tem benefício concreto · curiosidade real · ou identificação dolorosa específica. Lendo só ela, a pessoa pararia. |
| **Encaixa num template** | Cabe em 1 dos 30 do Cap 7.11. Marca qual. |
| **Aciona gatilho** | Pelo menos 1 dos 7 gatilhos rastreável na frase final (não "no espírito", na frase). |
| **Carrega assunto** | Acopla ao menos 1 dos 3 tipos de assunto. Idealmente cruza dois. |
| **Target e leigo entendem** | Zero palavra-container sem adjetivo concreto ("sistema" sozinho falha; "sistema de aquisição" passa). |
| **Comprimento por formato** | Reel ~7 palavras nos 3s · capa de carrossel 8–15 · story 5–10 · anúncio ≤5 nos 1.7s. |
| **Mesa-sentado** | Eu falaria isso pro cliente na frente dele, sem soar copy de Instagram? |
| **Ancorada (regra-zero)** | Fecha em chão, número, avatar ou mecanismo, ou nomeia o fenômeno. Tese solta e bonita ("o mercado paga o mais percebido", sozinha) é vazia; com chão vira lâmina. |
| **Não viola o "não defendo"** | Nunca ensina a fazer melhor uma prática da lista. |

> **Todo output obedece a lei de escrita da `shared-references`** (`guia/CODIGO-DE-ESCRITA.md`: as **8 leis** + **estrutura-mãe** Diagnóstico → Nomeação → Polaridade → Nova visão → Consequência → Movimento + **regra-zero**). A headline é o primeiro movimento desse arco. Depois, antes de entregar ao leitor, passa pelos filtros da `shared-references`, **Anti-IA** (toda copy) e **Mobile-First** (se for arte). Headline que não passa não sai.

## Modo input livre (sem Plano empacado)

Se o cliente cola uma ideia solta, manda um reel/post viral pra modelar, ou pede headline sem ter Plano: a skill **não bloqueia**. Lê o input, pergunta o nicho em 1 linha, gera aplicando o processo acima adaptado ao nicho, e avisa ao final: *"Pra headlines mais cravadas, vale rodar o Plano de Marca Pessoal, aí cada headline puxa do teu inimigo nominal real."* Atende criador em validação ou iniciante sem Plano, com qualidade decente e sinalizando o ganho do Plano.

## Comandos curtos (com fundação empacada, vai direto)

| Comando | Ação | Saída |
|---|---|---|
| *"manda X headlines sobre [ideia]"* | Aplica fundação + audita | Inline no chat, lista enxuta. Só as que passam aparecem. |
| *"headline pra [cena]"* | 3 headlines pontuais pro contexto | Inline. |
| *"audita essa headline"* | Roda a régua | Inline: veredito + o que passou/falhou + reescrita se falhou. |
| *"banco de [tema]"* | Escala um ASSUNTO por múltiplos templates | Artifact `text/markdown`, agrupado por ângulo/template. **Pergunta o volume antes** (50/100/200/300) se não foi dito. |

Volume alto entrega em lotes **por assunto** (frame de escalar um assunto viral, Cap 5.5 / 7.7): cada lote = 1 assunto central rodado pelos templates. "Mais 5 do mesmo tema" reusa a fundação já carregada, sem perguntar nada de novo.

## Regras de entrega

- **Destilação Soft:** uma ideia por frase, zero jargão, números > adjetivos, tom de comando. Adapta ao vocabulário do cliente final (nunca "lead", "funil", "ticket"). Nunca morno.
- **Marca o template** usado em cada headline.
- **9 nichos diversificados** nos exemplos (saúde · nutrição · fisio/personal · estética · jurídico · terapia · educação · finanças · marketing), marketing é 1 entre 9, não o default.
- **Não narra o fluxo** ("agora vou auditar"). Só executa e entrega o resultado limpo.

## Referências operacionais (complementam o guia)
Os 30 templates, os 7 gatilhos e os 3 tipos vivem no Cap 7. Estes references trazem **execução não absorvida no guia**:
- `references/comandos-rapidos.md`, lógica de volumes (50/100/200/300), protocolo de lotes pra banco grande, estrutura do artifact, variantes de comando.
- `references/criterios-v2.md`, rastreabilidade física dos 7 gatilhos, exemplos passa/falha por nicho, tabela de comprimento por 8 formatos.
- `references/modo-input-livre.md`, os 3 cenários de detecção e o decode de referência em 4 passos (modelar viral de outro nicho).

## Handoff

Headlines abrem a peça, o corpo (Carrossel, Reel, Story) é das outras frentes (`processo-feed.md`, `processo-stories.md`). A headline é só os primeiros 3 segundos; a Fórmula 7 conduz o resto. Repetir a mesma tese em ângulos diferentes é o que constrói a percepção: cada post é cheque, repetição insuportável é o trabalho.
