---
name: soft-conteudo-planner
description: PLANEJAMENTO do mês DE CONTEÚDO/pautas do método Soft em 2 modos, decide QUAIS temas postar (o plano de CONTEÚDO, não o roadmap do NEGÓCIO). Âncora, "planeja meu mês de conteúdo" = planner; "planeja meu negócio, meta, projeção, roadmap de 90 dias" = soft-plano-negocio. MODO MATRIZ (ideação em lote) cruza os pilares do dono por 8 formatos e devolve 30+ pautas numa matriz-calendário, cada célula uma manchete ancorada no verbatim/tese. MODO RADAR (tendências datadas) varre a web AGORA (WebSearch, senão o que o dono cola) e devolve o quente com o ângulo Soft. Cada célula vira input pra soft-conteudo-headlines. Use pra "ideias de post", "matriz de conteúdo", "planeja meu mês de conteúdo", "sobre o que eu posto", "o que tá em alta". NÃO use pra o roadmap/meta/projeção do NEGÓCIO (soft-plano-negocio), a HEADLINE de pauta escolhida (soft-conteudo-headlines), o CORPO da peça (soft-conteudo-carrossel/-reels/-stories), a fundação de mercado/dor/concorrente (soft-plano-posicionamento), arte (soft-designer), funil/venda.
---

# Planejamento de Conteúdo, o mapa de pautas (matriz + radar)

Ter posicionamento e voz não resolve o "sobre o que eu posto". Essa skill é o PLANEJAMENTO de conteúdo do método Soft, e ela decide QUAIS temas atacar em **dois modos** que respondem duas perguntas diferentes:

- **MODO MATRIZ (o mapa do mês):** "quais são os temas que EU tenho pra falar sempre?" Pega os pilares do dono (que a **soft-plano-posicionamento** já definiu) e os multiplica em **30+ pautas específicas** cruzando cada pilar por 8 formatos de ataque. É o banco de pautas estável, o calendário do mês, cada célula pronta pra virar peça. É pauta ESTRUTURAL, dura o mês.
- **MODO RADAR (a pauta viva da semana):** "tem alguma coisa quente ROLANDO essa semana que eu posso surfar antes de esfriar?" Varre a web AGORA, pega o que está em alta no nicho (assunto em discussão, formato pegando, gancho viralizando), confere a **data de cada item**, e devolve uma tabela onde a última coluna é o **ângulo Soft pronto pra postar**. É pauta PERECÍVEL e datada, descartável na semana seguinte.

**Como escolher o modo (leia o pedido):** "matriz / mapa do mês / banco de pautas / sobre o que eu posto sempre" = MODO MATRIZ. "o que tá em alta / tendências da semana / o que tá bombando / sobre o que postar ESSA semana / pauta quente" = MODO RADAR. Na dúvida entre os dois, pergunta em 1 linha: "quer o mapa de pautas do mês (fixo) ou o radar do que tá quente essa semana?". Os dois se complementam: o radar alimenta a matriz com pauta quente da semana; a matriz é o chão que não depende de tendência.

**O que os dois fazem por você:** transformam tema em pauta específica (manchete que já carrega a tese) e **decidem QUAIS temas atacar**; NENHUM escreve a headline nem o corpo. Cada célula da matriz e cada linha do radar é um input limpo pra soft-conteudo-headlines.

**A fronteira (não invada):** os PILARES e o círculo temático nascem na **soft-plano-posicionamento** (é lá que se decide o universo do que o dono tem permissão de falar). A **Super Pesquisa** (também na soft-plano-posicionamento) é a FUNDAÇÃO estrutural: mercado, força da dor, concorrente por lacuna, verbatim atemporal, feita uma vez, usada o ano. Esta skill MULTIPLICA os pilares em pautas (matriz) e capta o PULSO da semana (radar), nunca refaz a fundação. As skills de peça (carrossel/reel/stories) ESCREVEM a pauta. Se o dono não tem pilares, você não inventa: puxa do Plano ou manda fazer o Plano primeiro.

**As 6 leis (valem nos DOIS modos, detalhe em `shared-references/operacao-padrao.md` Seção 0):** (1) nunca escreve como se o cliente já soubesse o contexto, zero palavra difícil; (2) abre ensinando o que faz; (3) é consultiva, puxa os pilares (matriz) ou o nicho/janela (radar) antes de gerar; (4) contexto é rei; (5) **admite se faltar insumo, nunca inventa**: no MATRIZ, pilar/fala/número que você não tem vira `[A CONFIRMAR]`, jamais pauta plausível; no RADAR, link/data/número/tendência que você não verificou NÃO entra, item sem data cai; (6) **doc de output enxuto pros 2 leitores**: o que sai (matriz ou radar) serve o humano que planeja E a IA que recebe a célula/linha como contexto da headline.

**Este SKILL.md é o processo inteiro dos dois modos. Identifique o modo primeiro, siga os passos DELE na ordem, pare nos STOPs, e rode o gate por dentro antes de mostrar o doc.**

## Output Contract (o que você entrega, por modo)
**MODO MATRIZ:**
- Uma **matriz-calendário**: linhas = os 3-5 pilares do dono, colunas = os 8 formatos de ataque (abaixo). Cada célula = **uma manchete-pauta específica**, não um tema. Bom: "Os 3 sinais na primeira reunião de que o cliente vai pedir desconto." Ruim: "Fechamento de vendas."
- **Mínimo 30 pautas** (5 pilares × 6 formatos, ou 4 × 8). Toda célula é distinta: a mesma ideia NÃO se repete em dois pilares.
- Cada pauta **nasce de dor/desejo real do avatar** (verbatim quando existe) e **aponta pra uma lacuna que fecha no método do dono**. Pauta que qualquer creator do nicho postaria = reprovada.
- Abaixo da matriz: **as 3 pautas mais fortes** apontadas (com 1 linha de porquê cada) + a nota de qual pilar está mais raso pra pedir mais insumo.
- Você **para e espera** o dono escolher/ajustar antes de gerar volume ou passar uma célula pra headline.
- Você **nunca inventa pilar, fala nem número** e **nunca mostra pauta que falhou no gate**.

**MODO RADAR:**
- **Uma tabela-radar datada.** Primeira linha antes da tabela: `Radar de [NICHO], [DD/MM/AAAA] (janela: últimos [N] dias)`. Depois a tabela com estas colunas exatas: `| Tema quente | Onde está pegando | Fontes/comunidades | Links representativos | Sinais de calor | O que está sendo dito/debatido | Por que importa pro [NICHO] | Ângulo Soft pra postar |`
- **Mire em 10-20 temas.** Menos é aceitável se o material real for limitado; nesse caso você DIZ isso, não enche com item fraco. Melhor 8 temas quentes de verdade que 20 recheados de ruído.
- Cada tema **passou pelo corte de janela** (datado, dentro dos N dias, default 7) e pelo **filtro de saliência** (2+ sinais de calor). Item sem data verificável NÃO entra.
- A coluna **Ângulo Soft** é a que vale ouro: NÃO é gancho genérico de creator, é o tema quente já **enquadrado pela tese/mecanismo do dono**, ancorado na dor do avatar, apontando pro método. É copy embrionária, roda no gate.
- Abaixo da tabela: **as 3 pautas mais fortes** (1 linha de porquê cada) + a nota "[X] itens caíram por falta de data" e o que não deu pra varrer.
- Você **nunca inventa** link, data, número ou tendência. Sem fonte real, o item cai; furo pontual vira `[A CONFIRMAR]`.

## ⚠️ ENTREGA = UM doc MD, SEMPRE (nunca pingar o doc no chat)
Regra dura: o RESULTADO é **UM documento markdown consolidado** (a matriz-calendário, ou a tabela-radar). No **claude.ai**, um **artifact de markdown** (o dono abre, copia, planeja/escolhe a pauta); no **Claude Code**, um arquivo `.md`; no **agente/Telegram**, um ARQUIVO cujo path completo vai na resposta. A CONDUÇÃO (puxar pilares ou nicho/janela, os STOPs) acontece no chat; o DOC (matriz ou radar) mora no arquivo. Ao parar num STOP, você mostra/atualiza o DOC e pergunta "ajusto?" (matriz) ou "qual pauta puxo?" (radar); NUNCA reescreve a tabela em pedaços no corpo da conversa. Sem o doc entregue, a skill não terminou.

## Os 3 ambientes (como a entrega muda, e o alcance do radar)
- **App/chat (claude.ai, sem Bash):** o doc sai como **artifact de markdown**. Sem tabela em bloco de código (a grade vira texto monoespaçado ilegível): tabela markdown que renderiza. **No RADAR sem navegação ao vivo:** você NÃO finge varredura, CONDUZ: pede ao dono colar o que ele já viu quente (prints, links, o que os concorrentes postaram) e ORGANIZA na tabela-radar com o ângulo Soft, avisando que a varredura ao vivo roda no Code/agente.
- **Claude Code (tem Write/Edit + WebSearch/WebFetch):** salva em `matriz-conteudo-AAAA-MM-DD.md` (matriz) ou `radar-[nicho]-AAAA-MM-DD.md` (radar) na working dir + roda `scripts/lint_copy.py` no doc como cinto anti-IA. **No RADAR:** varredura AO VIVO (buscas datadas + leitura das fontes + verificação de data item a item). Confirma o path.
- **Agente/Telegram (tem Bash; WebSearch quando disponível):** grava o `.md` e devolve **o path completo na resposta**, mais um resumo curto SEM markdown pesado (as 3 pautas mais fortes em texto corrido, sem tabela nem asteriscos). **No RADAR:** igual ao Code; se o feed logado (X/Instagram) não abre, cai no fallback WebSearch datado + WebFetch e DIZ o que não deu pra varrer.

> Regra de honestidade de tooling (RADAR): se a navegação ao vivo não está disponível ou o feed não abre, você AVISA o que faltou e trabalha com o que dá (WebSearch datado, ou o que o dono colou). Nunca simula uma varredura que não aconteceu. Radar inventado é pior que radar pequeno.

# MODO MATRIZ, o mapa de pautas do mês
> Escolha este modo quando o pedido é o banco de pautas estável (mês/pilares). Passos 0 a 5 abaixo. Pro pulso da semana, pule pro **MODO RADAR** mais abaixo.

## Passo 0 (MATRIZ), puxa os pilares (NÃO PULE, é a fronteira)
Procura os pilares nesta ordem: **Plano de posicionamento colado na conversa** → **descrição do projeto** → **mensagens anteriores**. Cada pilar do Plano já traz nome, tema central, valor ancorado, anti-valor/inimigo, formato preferencial (é o que a soft-plano-posicionamento entrega).

Três estados de entrada (declara qual é o seu):
- **Tem os pilares (do Plano):** usa eles como as linhas da matriz. Caminho ideal. Puxa junto o verbatim de dor/desejo do Plano pra ancorar as células.
- **Tem nicho/fundação mas pilares não estão nomeados:** propõe **3-4 pilares** derivados da fundação (usando os 4 tipos: Método, Diagnóstico, Tese, Bastidor, em `shared-references` não; a lógica está resumida no Passo 0.1) e **PARA pra o dono confirmar** antes de montar a matriz. Não trata proposta como fato.
- **Sem nada:** pergunta numa única mensagem (nicho em 1 linha + os 3-4 assuntos que ele mais fala) e, se o pedido for maior que pauta, avisa que o Plano na **soft-plano-posicionamento** deixa a matriz muito mais cravada.

**Regra de fronteira:** você NÃO define círculo temático nem reescreve posicionamento aqui. Se o dono quer decidir o universo de temas, isso é soft-plano-posicionamento. Aqui os pilares entram como dados de entrada.

### Passo 0.1, os 4 tipos de pilar (só pra propor quando faltam)
Quando você precisa propor pilares (2º estado acima), use combinação destes 4, nunca "motivacional/notícias/vida pessoal" (esses falham pro Soft): **Método** (o sistema do trabalho, autoridade+venda) · **Diagnóstico** (o problema do cliente visto de perto, identificação) · **Tese/Opinião** (postura contraintuitiva sobre o mercado, diferenciação) · **Bastidor** (rotina/ferramenta/decisão, intimidade controlada). A maioria combina 2-3. Cada pilar proposto tem que ser **inconfundível com o de outro creator** (se o concorrente copia, é genérico, refaz).

## Passo 1 (MATRIZ), os 8 formatos de ataque (as colunas)
Cada formato é um ÂNGULO diferente de atacar o mesmo pilar. Reescritos na doutrina Soft: todo formato **filtra e atrai o cliente certo** e **aponta pro método**, nunca é jornalismo neutro nem frase de boteco. (Note: o formato "motivacional/inspiração" foi cortado de propósito, atrai estranho e não filtra.)

| # | Formato de ataque | O que a pauta faz | Camada de consciência que serve |
|---|---|---|---|
| 1 | **Acionável** | passo a passo ultra específico que ensina UMA coisa e mostra a lacuna que só o método fecha | quem já sente a dor (C2) |
| 2 | **Diagnóstico** | mostra o problema do avatar visto de perto, nomeia a dor que ele ainda não nomeou | quem não sabe que tem o problema (C1) |
| 3 | **Analítico** | destrincha POR QUE algo funciona/quebra do jeito que funciona (o mecanismo por trás) | quem desconfia mas não entende (C2) |
| 4 | **Contrário** | vira do avesso um conselho aceito do nicho e sustenta o ponto com prova. **Varie a mecânica do contraste:** nem toda célula Contrária usa a forma "não é X, é Y" (vira tique quando concentrado numa coluna só, e o lint conta a estrutura). Alterne com afirmação invertida direta, com pergunta que fura o consenso, com o custo escondido do conselho aceito | quem já tentou o caminho comum e empacou (C3) |
| 5 | **Observação** | uma tendência silenciosa/escondida que o dono notou e ninguém comenta | quem está dentro do universo (C2/C3) |
| 6 | **X vs Y** | compara dois caminhos (método antigo vs o seu, ferramenta vs ferramenta) e mostra o custo do lado errado | quem está decidindo (C3) |
| 7 | **Antes vs Depois** | o estado atual doloroso vs o estado com o método, com o número que prova a virada | quem quer o resultado (C3) |
| 8 | **Lista** | X erros/sinais/passos/itens, cada um uma pauta-semente que rende peça própria | qualquer camada, alto salvamento |

**Como escolher quantas colunas:** 5 pilares × 6 formatos = 30 pautas (corta os 2 formatos que menos servem ao nicho). 4 pilares × 8 = 32. 3 pilares × 8 = 24, então gera 2 pautas em alguns formatos pra fechar 30+. Sempre **mínimo 30**.

## ✍️ PRÉ-FLIGHT DE COPY (relê IMEDIATAMENTE antes de escrever a 1ª linha)
A copy nasce da terça-feira à noite DO LEITOR. Regra é CHECAGEM, nunca geradora: escreve a partir da CENA (a emoção dela: raiva, medo, absurdo, cobiça), com voz de mesa; a regra confere depois. Reprovou, REGENERA do zero (frase editada herda o esqueleto do defeito):
1. **Munição na mão:** verbatim/prova real do dono na frente (sem munição = pergunta, jamais inventa).
2. **Leitura única:** uma leitura em voz alta, sem re-parse; valência única (bom ou ruim na 1ª leitura); sintaxe linear; 1 operação mental por frase.
3. **Mundo do leitor, não o mapa do autor:** componentes do método viram dias, horas, lugares e falas do cliente; rótulo abstrato só entre aspas, como palavra do inimigo.
4. **Compressão gramatical: cota zero.** Verbo da relação por extenso; a força é do fato, nunca do aperto da frase.
5. **Voz de mesa, não palco:** a colocação inteira é fala real; metáfora morta entra, personificação e figura de escritor não.
6. **Prova com atribuição exata** (do banco de provas do dono, nunca fundir); conta apresentada como conta; renda do leitor só em 3ª pessoa.
7. **Anti-IA:** zero travessão, zero família banida, zero verbo genérico de transformação, zero frase-emoldura.
8. **Teto do formato conhecido ANTES** (conta durante, não conserta depois).
Depois de escrita, a auditoria roda TODOS os filtros em cada linha (régua cumulativa, checklist mecânico). Reprovou, regenera ANTES de mostrar.

## Passo 2 (MATRIZ), preenche cada célula com uma manchete-pauta específica
Pra cada cruzamento pilar × formato, escreve **uma manchete-pauta** (não um tema). Regras:
- **Ancora no verbatim** (dor/desejo real do avatar, do Plano). A pauta nasce de uma fala do cliente, quase intacta. Sem fala real: ancora em prova/mecanismo do dono e marca o número não confirmado como `[A CONFIRMAR]`.
- **Aponta pro método:** cada pauta deixa uma lacuna que fecha no que o dono vende. Pauta que resolve tudo de graça e não puxa pro método = jornalismo, reprova.
- **Específica, não tema:** ✓ "O que fazer quando o cliente some depois do orçamento (o roteiro de 2 mensagens)" · ✗ "Follow-up".
- **Distinta entre pilares:** a mesma ideia NÃO aparece em duas células. Se dois pilares puxam a mesma pauta, um dos dois muda de ângulo.
- **Vocabulário do cliente final** (nunca "lead/funil/ticket" na manchete), tom de comando, número em algarismo.
- A célula é curta (uma manchete, não um parágrafo): ela vira o INPUT da soft-conteudo-headlines, que aí escreve 2-3 headlines dentro dela.

## Passo 3 (MATRIZ), roda o GATE por dentro (auditoria interna, NÃO imprime)
Roda o gate em CADA célula internamente. Só pauta que passa em TODOS os critérios entra na matriz. Uma falha refaz a célula (não a matriz). A tabela é teu **checklist interno**, nunca a saída.

| Check | Passa se | ✓/✗ |
|---|---|---|
| **Específica (manchete, não tema)** | dá pra ver a cena/o número; NÃO é rótulo amplo ("vendas", "mindset") | |
| **Ancorada** | nasce de fala real do avatar (verbatim) OU de prova real do dono; número inventado/plausível = ✗; sem fonte, marca `[A CONFIRMAR]` | |
| **Aponta pro método** | deixa lacuna que fecha no que o dono vende; NÃO é conselho neutro que resolve tudo de graça | |
| **Distinta** | essa ideia não aparece em outra célula da matriz | |
| **Cabe no pilar** | responde "por que me seguir / por que comprar de mim" dentro do universo do dono; tema fora do círculo = ✗ (é da soft-plano-posicionamento decidir isso) | |
| **Filtra o cliente certo** | atrai quem compra, não estranho; ✗ pauta viral genérica ("5 hábitos de gente de sucesso") | |
| **Clareza (Lei 1)** | dá pra entender sem já ser de dentro; zero palavra difícil, zero figura vazia | |
| **Anti-IA (HARD)** | zero travessão · zero "travar/travado/destravar" · sem frase-emoldura ("a verdade é", "o segredo") · sem verbo-clichê ("revoluciona, destrava, transforma") | |
| **VEREDITO** | **= o PIOR item acima.** Um ✗ qualquer = REFAZ a célula. Só tudo-✓ entra na matriz. | |

**Varredura anti-IA OBRIGATÓRIA e VISÍVEL (não é checkbox implícito).** Antes de renderizar a matriz no doc, o alvo do check NÃO é só as células: é o doc INTEIRO, e o travessão mora justamente onde o modelo esquece de olhar (TÍTULO H1, HEADERS H2/H3, prosa fora da tabela). No chat/agente sem Bash (onde o `lint_copy.py` não roda), você NÃO declara "fiz CTRL+F" e segue: você **escreve no chat, como etapa do gate, o resultado literal da varredura** sobre o texto do doc, nesta forma exata:
> `Varredura anti-IA do doc: travessão U+2014 encontrados: N em [onde]; família travar encontrados: N em [onde].`

Se N maior que 0 em qualquer um, você **corrige antes de mostrar o doc** (troca travessão por ponto, dois-pontos, vírgula ou hífen comum; troca "travar/travou" por emperrar/empacar/parar/freio/amarra) e roda a varredura de novo até dar `0 em nada`. Só depois renderiza. Zona proibida de esquecer: título, headers, legendas e frases de ligação, NÃO só as células. No Claude Code/agente com Bash, `python3 scripts/lint_copy.py` no doc confirma o zero (exit 0); no app, a varredura escrita acima é o gate.

## Passo 4 (MATRIZ), monta a matriz e aponta as mais fortes
Renderiza a matriz-calendário (tabela markdown: pilares nas linhas, formatos nas colunas, célula = manchete-pauta). Abaixo dela: **as 3 pautas mais fortes de toda a matriz** com 1 linha de porquê cada (a que mais fecha no método, a mais ancorada em dor, a mais contrária), e a **nota de qual pilar ficou mais raso** (pra pedir insumo). Não narra o fluxo, entrega limpo.

**Título e subtítulo do doc também passam pelo anti-IA HARD.** O H1 e todo header (H2/H3) do documento seguem a mesma regra das células: use vírgula, ponto ou dois-pontos como separador, NUNCA travessão. Certo: "Matriz de Conteúdo, Nutrição Esportiva" ou "Matriz-Calendário: 4 pilares por 8 formatos". Errado: qualquer título com travessão entre as partes. Isso é o que a varredura visível do Passo 3 pega no título e nos headers.

**O doc carrega SÓ o conteúdo, zero bastidor da conversa (Lei 6, corta meta-narração).** Dentro do arquivo entra APENAS: a matriz + os pilares + as 3 mais fortes + os `[A CONFIRMAR]`. Fica FORA do doc, e mora só no chat: qualquer eco de fala do dono ("você respondeu...", "perfeito, pode seguir"), qualquer narração do STOP, qualquer frase de condução ("matriz montada abaixo", "conforme você pediu"). A confirmação do dono acontece no chat e não vira carimbo no documento. Se você se pegar escrevendo no doc uma frase que só faz sentido pra quem viu a conversa, ela é meta-narração: corta.

## Passo 5 (MATRIZ), mostra e PARA
Mostra a matriz **no DOC** (nunca solta no chat). Pergunta: "quais pautas te servem? quer que eu escreva a headline de alguma (passo pra soft-conteudo-headlines) ou gero mais numa linha?". **Espera a escolha** antes de gerar volume ou passar pra headline.

## Exemplo denso MATRIZ (nicho: consultor de gestão pra dono de PME), LABEL, não copiar
Pilar 2 (Diagnóstico) × Formato 2 (Diagnóstico de dor):
> **"O dono de PME que aprova cada compra de R$50 e não vê o rombo de R$8 mil por mês no processo que ninguém revisa."**
- **Ancorada:** verbatim real "eu controlo tudo mas o dinheiro some" (N=4 na super-pesquisa). Nasce quase intacta dessa fala.
- **Aponta pro método:** a lacuna (não é gastar menos, é o processo cego) fecha no "sistema mínimo de gestão" que o consultor vende.
- **Específica:** dá pra ver (R$50 aprovado, R$8 mil somem), não é "gestão financeira".
- **Filtra:** fala com dono que decide tudo sozinho (o cliente), não com quem quer dica de app de finanças.
- **Anti-IA:** zero travessão, zero "travar", zero frase-emoldura, no doc inteiro (célula, título e headers). PASSA.

Contra-exemplo (REPROVA): "5 dicas de produtividade pra empreendedor." Genérica (qualquer creator posta), não aponta pro método, não filtra, não ancora em fala real. VEREDITO = ✗.

# MODO RADAR, o pulso da semana no nicho
> Escolha este modo quando o pedido é a pauta quente da semana ("o que tá em alta", "tendências", "o que tá bombando", "sobre o que postar essa semana"). É pauta perecível e datada, o oposto do banco fixo da matriz. A profundidade da varredura (fontes, buscas datadas, verificação de data, fallback quando o feed não abre, régua de saliência item a item) está em `references/protocolo-de-busca.md`; os passos abaixo já são executáveis.

## Passo 0 (RADAR), puxa nicho + avatar + janela (NÃO PULE, é a fronteira)
Antes de pesquisar, você precisa de três coisas. Procura nesta ordem: **Plano de posicionamento colado** → **perfil/descrição do projeto** → **mensagens anteriores**. O que faltar, pergunta numa mensagem curta.
1. **Nicho + avatar** (obrigatório pra filtrar o ruído). Não é "marketing", é "consultor de gestão financeira pra dono de clínica odontológica". Do Plano você puxa junto a **tese/mecanismo do dono e o verbatim de dor** (é o que enquadra a coluna de ângulo). Sem Plano, você ainda roda, mas avisa que o ângulo sai mais bruto sem a tese cravada.
2. **Janela** (default **7 dias**). O dono pode pedir 3 (pauta muito quente) ou 14 (nicho de giro lento). Fixe o N e respeite o corte duro.
3. **Fontes prioritárias do nicho** (opcional): perfis/portais/subreddits que o dono já acompanha. Se ele não sabe, você descobre na varredura.

**Regra de fronteira:** você NÃO faz pesquisa de fundação aqui (força da dor, mapa de concorrente, verbatim atemporal). Isso é a Super Pesquisa da soft-plano-posicionamento. Aqui nicho/avatar entram como FILTRO de entrada, não como objeto de pesquisa.

## Passo 1 (RADAR), varre as fontes com data verificada
Vasculha a web como um pesquisador humano faria. **A regra-mãe: confere a data de publicação de cada item e descarta sem exceção o que passa da janela.** Detalhe em `references/protocolo-de-busca.md`; o essencial:
- **Buscas datadas (base, sempre roda):** para cada eixo, uma query filtrada pela janela. Os 5 eixos que capturam pauta quente: `[nicho] novidade/lançamento`, `[nicho] polêmica/debate`, `[nicho] dado/pesquisa`, `[nicho] mudança/regra nova`, `[nicho] o que está bombando/viralizou`. No Code/agente, WebSearch + WebFetch pra abrir e ler a data no corpo da página. Adapte as queries pro idioma e jargão real do nicho (PT-BR quando o público é BR).
- **Feed social (quando a navegação abre):** rola o feed relevante (Reddit home/r/popular + subreddits do nicho; X/Para Você; perfis de concorrente no Instagram) e abre os posts em alta. Confere o carimbo de data em cada um. O feed LOGADO (X/Instagram) é o ponto frágil: se não abre, cai no fallback e diz.
- **Verificação de data (sem atalho):** abre a página, localiza a data visível, confirma que está dentro da janela. Data faltando, confusa ou fora = item descartado. Nunca deduz data pelo "parece recente".

## Passo 2 (RADAR), filtra por saliência (o que é calor de verdade)
Junta o conjunto amplo de itens datados e agrupa os relacionados em **temas** (um tema pode combinar discussão social + cobertura de portal). Um tema só entra no radar se mostra **pelo menos 2** destes sinais de calor:
- **Volume/atenção forte** (muita gente falando, engajamento acima do normal do nicho).
- **Debate/discordância clara** (o nicho está dividido, tem os dois lados).
- **Informação nova ou virada** (dado inédito, lançamento, mudança de regra que altera como o avatar trabalha).
- **Implicação real pro avatar do dono** (mexe com a vida/o bolso/o trabalho de quem ele atende). É o sinal mais valioso pro Soft: em dúvida entre dois temas, fica com o que toca o avatar.

Tema com 1 sinal só é ruído, não entra. É o filtro que separa "assunto quente que rende peça" de "notícia qualquer". Anota QUAIS sinais o tema tem (vira a coluna "Sinais de calor"): se você não consegue nomear 2 sinais concretos, o tema não passa.

## Passo 3 (RADAR), escreve a coluna Ângulo Soft (o coração do modo)
Aqui o radar deixa de ser clipping e vira munição. Pra cada tema que passou, a coluna **Ângulo Soft** enquadra o tema quente pela lente do dono. NÃO é gancho genérico de creator ("aproveite essa tendência!"). É:
- **Ancorado na dor/desejo real do avatar** (verbatim do Plano quando existe). O ângulo nasce de como o cliente do dono vive esse assunto quente, não de como o mercado geral vê.
- **Enquadrado pela tese/mecanismo do dono.** O tema quente é a ISCA; o método do dono é a resposta. Ex.: sai uma polêmica sobre a ferramenta X → o ângulo não é "opine sobre a ferramenta X", é "por que a ferramenta X não resolve o problema real (que é [o que o método do dono ataca])".
- **Aponta pro método e filtra o cliente certo.** Deixa a lacuna que fecha no que o dono vende. Ângulo que qualquer creator do nicho postaria = reprovado.
- **Vocabulário do cliente final** (nunca "lead/funil/ticket" no ângulo), tom de comando, número em algarismo.
- **Curto:** uma manchete-ângulo, não um parágrafo. Ela vira o INPUT da soft-conteudo-headlines.

## Passo 4 (RADAR), roda o GATE por dentro (auditoria interna, NÃO imprime)
Roda o gate em CADA linha antes de ela entrar no radar. A tabela é teu **checklist interno**, nunca a saída. Uma falha refaz a linha (ou derruba o tema), não o radar inteiro.

| Check | Passa se | ✓/✗ |
|---|---|---|
| **Datado e na janela** | tem data verificada, dentro dos N dias; data faltando/fora = ✗ (item cai) | |
| **Saliente (2+ sinais)** | tem ao menos 2 sinais de calor reais; 1 só = ruído, ✗ | |
| **Link real** | link representativo existe e foi aberto; link inventado/deduzido = ✗ | |
| **Ângulo ancorado** | nasce da dor real do avatar (verbatim) OU da tese do dono; genérico de creator = ✗ | |
| **Ângulo aponta pro método** | deixa lacuna que fecha no que o dono vende; NÃO é "surfe a tendência" solto | |
| **Filtra o cliente certo** | atrai quem compra do dono, não curioso do nicho; pauta viral genérica = ✗ | |
| **Clareza (Lei 1)** | dá pra entender sem já ser de dentro; zero palavra difícil, zero figura vazia | |
| **Sem invenção (Lei 5)** | zero link/data/número/tendência inventado; furo pontual = `[A CONFIRMAR]`, não item plausível | |
| **Anti-IA (HARD)** | zero travessão · zero "travar/travado/destravar" · sem frase-emoldura ("a verdade é", "o segredo") · sem verbo-clichê ("revoluciona, destrava, transforma") | |
| **VEREDITO** | **= o PIOR item acima.** Um ✗ na data/link/invenção derruba o TEMA. Um ✗ no ângulo REFAZ o ângulo. Só tudo-✓ entra. | |

**Varredura anti-IA OBRIGATÓRIA e VISÍVEL na coluna de ângulos (a mesma do MATRIZ Passo 3):** o alvo do check é o doc INTEIRO, título e headers inclusos, não só as células. No chat/agente sem Bash, você **escreve no chat, como etapa do gate, o resultado literal da varredura**, na forma exata: `Varredura anti-IA do doc: travessão U+2014 encontrados: N em [onde]; família travar encontrados: N em [onde].` Se N maior que 0, corrige antes de mostrar e roda de novo até dar `0 em nada`. No Code/agente com Bash, `python3 scripts/lint_copy.py` no doc confirma o zero (exit 0).

## Passo 5 (RADAR), monta o radar e PARA
Renderiza a tabela-radar no DOC (tabela markdown que renderiza, nunca dentro de bloco de código, que vira grade ilegível). Abaixo dela: **as 3 pautas mais quentes** com 1 linha de porquê cada (a que mais casa com a tese, a mais debatida, a com implicação mais direta pro avatar) + a nota "isso foi o que verifiquei dentro da janela; [X] itens caíram por falta de data". Se a varredura ao vivo falhou em parte, DIZ o que não deu pra varrer.

Mostra o radar **no DOC** e PARA. Pergunta: "qual dessas pautas você quer transformar em peça? Passo pra **soft-conteudo-headlines** pra escrever a headline, ou encaixo no calendário do MODO MATRIZ." **Espera a escolha** antes de escrever qualquer peça. O radar entrega a munição; quem dispara é a skill de peça.

## Exemplo denso RADAR (nicho: nutricionista esportivo pra corredor amador), LABEL, não copiar
> Nicho/avatar (do Plano): nutri esportivo, avatar = corredor amador 35-50 que treina pra prova de rua e "come certo mas não rende". Tese do dono: o problema não é dieta restritiva, é **timing de carboidrato em torno do treino** (o mecanismo dele). Janela: 7 dias. Ambiente: Claude Code.

1. **Passo 0:** puxo nicho, avatar e tese do Plano colado. Janela 7 dias. Fontes que o dono segue: 2 perfis de treino + r/running.
2. **Passo 1:** rodo as buscas datadas (`corrida de rua novidade`, `suplemento corredor polêmica`, `nutrição esportiva pesquisa`) via WebSearch, abro os resultados com WebFetch, leio a data no corpo. Rolo r/running e os 2 perfis. Descarto 6 itens sem data clara.
3. **Passo 2 (saliência):** um tema quente sobrevive: "estudo novo dessa semana questionando o gel de carboidrato durante a prova". Sinais: debate claro (corredores divididos) + informação nova (o estudo) + implicação real pro avatar (ele usa gel e não sabe se serve). 3 sinais, passa. Um segundo tema ("tênis de placa de carbono na moda") tem só volume, 1 sinal: cai.
4. **Passo 3 (ângulo Soft):** o ângulo NÃO é "opine sobre o estudo do gel". Enquadro pela tese: **"O corredor que toma 3 géis na prova e continua quebrando no km 30, porque o problema nunca foi o gel na corrida, foi o carboidrato que faltou nas 48h antes."** Ancorado no verbatim "como certo mas não rendo", aponta pro mecanismo (timing de carbo), filtra o corredor que treina sério (o cliente), não o curioso.
5. **Passo 4 (gate):** datado ✓, 3 sinais ✓, link do estudo aberto ✓, ângulo ancorado na tese ✓, aponta pro método ✓, filtra ✓, clareza ✓, sem invenção ✓, anti-IA (rodei `lint_copy.py` na coluna, zero em-dash, zero "travar") ✓. VEREDITO ✓, entra.
6. **Passo 5:** salvo `radar-nutri-corrida-2026-07-04.md` com a tabela, aponto essa como a pauta #1, respondo com o path completo e pergunto "escrevo a headline dela? (soft-conteudo-headlines)".

Contra-exemplo RADAR (REPROVA): tema "tênis de placa de carbono está na moda" com ângulo "aproveite a hype dos tênis de carbono pra falar de performance". Um sinal só (volume), ângulo genérico que qualquer creator posta, não aponta pro mecanismo do dono, não filtra o cliente. VEREDITO = ✗, tema cai.

## When NOT to use (manda pra skill certa)
- Pediu a **HEADLINE/gancho** de uma pauta já escolhida → **soft-conteudo-headlines** (é o passo seguinte; cada célula da matriz e cada linha do radar é o input dela).
- Pediu o **CORPO** da peça → **soft-conteudo-carrossel** / **-reels** / **-stories**.
- Pediu pra **definir pilares / círculo temático / posicionamento**, ou a **fundação de mercado/dor/verbatim atemporal/concorrente** que se faz uma vez e usa o ano (Super Pesquisa) → **soft-plano-posicionamento** (é de lá que os pilares vêm; o radar é pulso perecível, não fundação estável).
- Pediu **arte/visual/PNG** → **soft-designer**.
- Pediu **carta/página/venda** → **soft-funil** / **soft-vendas-closer**.

## Anti-Patterns (sintoma → correção)
| Sintoma | Correção |
|---|---|
| Célula virou tema amplo ("Vendas", "Mindset") | Reescreve como manchete específica com cena/número que dá pra ver |
| Mesma ideia em dois pilares | Uma das células muda de ângulo; toda célula é distinta |
| Pauta genérica que qualquer creator postaria | Falha em "aponta pro método" e "filtra": reancora na dor do avatar e na lacuna do método |
| Inventou um pilar que o dono não tem | Puxa do Plano; se faltam, PROPÕE e PARA pra confirmar, nunca fixa como fato |
| Definiu círculo temático / reescreveu posicionamento | Fora do escopo: isso é soft-plano-posicionamento; aqui pilar é dado de entrada |
| Frase motivacional / viral de boteco na célula | Cortado de propósito: atrai estranho, não filtra cliente; reescreve ancorado |
| Despejou a matriz/radar solto no chat | O doc sai como MD (artifact / arquivo / path no agente); o chat é a condução |
| Jogou a tabela dentro de bloco de código | Tabela markdown que renderiza; bloco de código vira grade ilegível |
| Menos de 30 pautas (matriz) | Fecha 30+ (5×6 ou 4×8); gera 2 por formato em alguns cruzamentos se faltar |
| (RADAR) Incluiu item sem data ou fora da janela | Corte duro: data verificada dentro dos N dias, senão o item cai. Nunca deduz "parece recente" |
| (RADAR) Inventou um link, uma data ou uma tendência | Lei 5: só o que você abriu e verificou entra; furo vira `[A CONFIRMAR]`, nunca item plausível |
| (RADAR) Tema com 1 sinal de calor entrou | Filtro de saliência: mínimo 2 sinais; 1 só é ruído, não pauta |
| (RADAR) Ângulo genérico ("aproveite essa tendência!") | Enquadra pela tese/mecanismo do dono e ancora na dor do avatar; tema quente é isca, método é resposta |
| (RADAR) Simulou a varredura quando o feed não abriu | Honestidade de tooling: avisa o que não deu pra varrer, trabalha com WebSearch datado ou o que o dono colou |
| (RADAR) Virou pesquisa de fundação (dor, concorrente, verbatim atemporal) | Fora do escopo: isso é a Super Pesquisa (soft-plano-posicionamento); aqui é pauta da semana |

## References (só pra profundidade, o fluxo acima é autossuficiente)
- `references/protocolo-de-busca.md`: **fonte da verdade da varredura do MODO RADAR** (fontes por tipo, buscas datadas por eixo, rolagem de feed, verificação de data sem atalho, fallback quando o feed logado não abre, régua de saliência detalhada). Consulta no Passo 1/2 do RADAR.
- `shared-references/operacao-padrao.md`: as 6 leis (Seção 0) + regras de tom/economia/entrega. Consulta na 1ª invocação da sessão.
- `shared-references/filtro-anti-ia/`: o banco de padrões banidos + falsos-positivos que alimenta o check Anti-IA do gate.
- `shared-references/filtro-cliente-primeiro.md`: a régua de "isto atrai o cliente certo ou o curioso do nicho?", aplicada nas células (matriz) e na coluna de ângulos (radar).
- `scripts/lint_copy.py`: no Claude Code/agente, roda `python3 scripts/lint_copy.py` no doc INTEIRO como cinto extra do anti-IA (reprova em-dash e "travar" com exit 1, inclusive em título/headers). No chat não roda, por isso a varredura anti-IA escrita e visível é o gate.
