# Gate CUB: reprova o que não tem força

> Passo 3 do Crítico. Bloqueante. Espelha o gate do design (`soft-designer/references/auditoria-pre-preview.md`), que já provou funcionar: o modelo é OBRIGADO a preencher um artefato visível antes de mostrar a peça, e peça que falha não sai.

## Por que é bloqueante e não "uma dica"

O design do método tem rigor: 12 perguntas por slide, qualquer NÃO corrige antes, "não mostre slide que falhou". A copy tinha só "escreve, mostra, entrega". O modelo se autoaprovava. Resultado: o rigor estava no visual e frouxo no texto.

Este gate cabea pra copy o mesmo aperto. A teoria mora aqui no Crivo embutido (CUB em camadas e as 3 perguntas do crivo aqui mesmo, as 8 leis em `05-premissas-mestras.md`), pra rodar standalone sem depender de arquivo de outra skill. Se a skill da vez tiver o `guia/GUIA-COPY-APLICACAO.md` local (CUB em camadas no §5, as 3 perguntas no §3, as 8 leis no §2), é a mesma régua e pode ser lida pra ecoar a redação. O gate NÃO reescreve essa teoria. Ele FORÇA a aplicação dela e recusa a peça que não passa.

## A regra de agregação (binária, sem meio-termo)

Isto vem antes da tabela porque é o que faz o gate ser gate:

> **O veredito da peça é o pior bloco dela.** UMA passada em FALHA, em QUALQUER bloco, REPROVA a peça inteira. Não existe "passou com ressalva" como veredito final. Volta pra reescrita, re-roda o gate do zero. Veredito = a pior nota de todas as passadas de todos os blocos. "Ressalva" só descreve uma passada que passou raspando, nunca uma peça aprovada com furo dentro.

Sem isso, a peça com uma linha fraca passa, e um gate que aprova furo não é gate.

**Portão de prova (teto de nota).** Ausência de prova nominal (caso com dono e número) OU mecanismo só-rotulado (não batizado) no bloco do CTA, para avatar cético-de-guru em tráfego pago ou venda direta, NÃO é desconto de nota: é veredito `RASCUNHO-COM-PENDÊNCIA`, idêntico a placeholder aberto. A nota numérica não passa de 7 enquanto o portão de prova estiver vazio. Isso impede o "converte: 8" bonzinho sobre peça sem chão de credibilidade no ponto da decisão, que foi o viés sistemático da Camada 1 justo nas peças de maior alavancagem comercial (anúncio, topo de funil).

## A barreira de ancoragem (roda ANTES de simular a pele)

A copy pode sair bonita e MENTIR no rodapé. O furo mais grave de todos: inventar a prova de ancoragem. Esta barreira roda primeiro, cega na fonte, antes da simulação. Qualquer item NÃO-VERIFICADO reprova, por melhor que esteja a frase.

- **Aspas = cópia literal da fonte do usuário da vez.** Toda fala entre aspas atribuída ao cliente tem que ser substring literal, palavra por palavra, do acervo de fala real DELE (ver Passo 0 de `01-entrada-verbatim.md`; no perfil de exemplo, é a pasta de padrões do acervo de VoC do autor). Re-abre a fonte e confere. Não bateu caractere a caractere, FALHA.
- **Correspondência (a aspa é do sub-padrão CERTO).** A aspa tem que expressar a MESMA dor ou cena do sub-padrão de onde foi puxada (a linha-padrão destilada da página). Não basta ser substring literal com carga, se for de outro assunto. Aspa gramatical mas de tema diferente é descartada, e ancora na linha-padrão em texto corrido citando o N (mesmo tratamento da aspa-lixo).
- **DIREÇÃO (a peça afirma o MESMO que a fala, ou o oposto?).** A tese da peça afirma na MESMA direção do verbatim, não só contém a palavra. "preço não doeu" e "já gastei muito, não posso mais" são substrings de temas OPOSTOS. Negar o verbatim que você diz usar de âncora é fraude de DIREÇÃO, FALHA bloqueante, igual à aspa fabricada. (Foi o furo do anúncio no teste: cravou "você não tem medo de gastar" sobre um avatar cujo verbatim real é o contrário.)
- **Remontar fala é fraude.** Juntar pedaços de calls diferentes, ou parafrasear o padrão e botar entre aspas como se fosse fala dele, é fraude de ancoragem, FALHA bloqueante. Paráfrase do padrão vai em texto normal ("o que se repete nas calls é..."), nunca entre aspas como verbatim.
- **N é do sub-padrão, não do tema.** Todo N citado precisa de dois números: o N do TEMA e o N do SUB-PADRÃO específico que sustenta o ângulo. Só o segundo aprova. Usar "N=17 do tema" pra dar lastro a um sub-ângulo de N=1 é N inflado, FALHA. Sub-padrão N=1 pode entrar como cena ilustrativa, marcado "lastro fino (N=1)", nunca vendido como "N forte". Quando a fonte não tem N contado (caso self-serve, fala solta de prints e DMs), o critério deixa de ser o N e vira fala STICKY: repetida em fontes independentes (`01-entrada-verbatim.md`, passo 3).
- **A aspa carrega carga.** A fala literal tem que conter, ela mesma, a dor/desejo/cena, lida isolada. Saudação, monossílabo, número solto ou confirmação ("Uhum", "5000, ta?", "Beleza") FALHA mesmo sendo substring literal. Se o verbatim literal é só ruído de transcrição, ancora na linha-padrão (a paráfrase já destilada da call) em texto corrido citando o N, nunca força a aspa-lixo só pra cumprir a regra.
- **Prova NUNCA é inventada.** Número, case, nome, prazo, print, depoimento só entram se vierem do briefing real. Sem prova real, vira placeholder explícito `[CASE: nome + número + prazo a preencher]`, marcado pendência. Jamais gera número plausível. É o gêmeo da regra anti-verbatim-fabricado.
- **A barreira é um ARTEFATO PREENCHIDO, não leitura de cabeça.** Imprime uma tabela, uma linha por aspa ou eixo da peça, com as colunas: `aspa/eixo na peça | substring colado da fonte (caractere a caractere) | arquivo:linha | N do sub-padrão | DIREÇÃO bate?`. A coluna do substring é o resultado do grep na fonte VISÍVEL na tela, não "confere de cabeça". Sem a tabela preenchida com o grep à mostra, a passada 0 sai NÃO-VERIFICADO. Qualquer linha NÃO-VERIFICADO ou DIREÇÃO-não-bate reprova a passada 0. É o que separa a regra LIDA da regra EXECUTADA (o gate do design força o mesmo: artefato preenchido por slide, nunca "eu checei").

Por que primeiro: se a simulação de pele roda antes, ela se empolga com a frase boa e deixa a ancoragem frouxa no fim. Ancoragem é fato binário (bate na fonte ou não), e fato vem antes de gosto.

## Anti-vazamento: o perfil de REFERÊNCIA nunca entra na peça de outro usuário (bloqueante)

As skills trazem exemplos de um perfil de REFERÊNCIA pra ensinar o modelo a escrever (o avatar de exemplo, o pilar/Big Idea de exemplo, a fonte de VoC de exemplo, a voz do autor do método). São de OUTRO usuário, nunca do usuário da vez. Regra bloqueante:

- Nenhum nome próprio, case, número, avatar, pilar, inimigo ou fonte que apareça na PEÇA pode vir desses exemplos. Tudo na peça sai do PERFIL do usuário da vez (`00-perfil-do-usuario.md`), não dos exemplos embutidos na skill.
- Se o avatar de exemplo, o pilar/Big Idea de exemplo, a fonte de VoC de exemplo, ou qualquer dado do perfil-de-referência aparecer na peça de outro usuário, é VAZAMENTO. FALHA bloqueante, reescreve a partir do perfil certo.
- É a mesma lógica da barreira de ancoragem (aspa = substring da fonte DO USUÁRIO), estendida a TODOS os dados: avatar, pilar, case, inimigo, número. O perfil-de-referência ensina COMO escrever, nunca é matéria-prima do QUE escrever.
- Pro autor do método, o perfil-de-referência é o dele, então não há vazamento. Pra qualquer outro usuário, esta passada protege os dados dele de saírem contaminados com os de outra pessoa.

## O protocolo

Para **cada bloco da peça** (cada slide do carrossel, cada parágrafo da carta, cada linha do reel, a headline isolada), preenche a tabela abaixo. Resposta esperada: PASSA em todas. Qualquer FALHA aciona reescrita antes de mostrar.

**A natureza do bloco muda a régua (igual o CTA muda por tipo de peça).** Bloco que carrega copy de leitor roda a tabela cheia. Mas **fala-mecânica de venda** (descoberta, isolamento de objeção, termômetro, transição de um script ao vivo, tipo "antes de eu te passar o investimento, deixa eu confirmar uma coisa") NÃO é aspa-de-cliente nem prova-do-autor, então as passadas 0, 2, 3 e 5 não se aplicam a ela. Pra fala-mecânica vale: soa natural na boca (lê em voz alta), não pomposa, não vaza framework. A tabela CUB cheia só no bloco que carrega prova ou promessa (o case, a oferta).

| Passada | Pergunta | Falha quando |
|---|---|---|
| **0. Ancorado** | Passou na barreira de ancoragem acima E o ÂNGULO existe no acervo? | Aspa não-literal ou N inflado (ver a barreira acima). Ou o ângulo-mãe (a cena, a virada, o número central) tem N=0 no tema. Ou é rótulo abstrato inventado. **Exceção:** prova ou história DO AUTOR (caso próprio, número próprio real e falsificável) NÃO falha aqui mesmo sem verbatim de cliente. Dor do cliente precisa de verbatim literal; prova do autor precisa ser verdade verificável |
| **0.5. Consciência (Schwartz)** | A peça declara o nível de consciência do leitor-alvo E a ABERTURA casa com ele? | Não declara o nível. Ou abre pela solução/oferta pro INCONSCIENTE (devia abrir pela CENA do problema). Ou abre pela promessa direta pro CONSCIENTE-DO-PROBLEMA (devia abrir pelo MECANISMO nomeado). Em nicho saturado (E4-E5, o caso do perfil de exemplo), abrir por promessa gasta FALHA, abre por mecanismo + identidade |
| **1. C, Confuso** | Dá pra entender numa lida, sem reler? | Exige reler, tem 2 ideias na frase, jargão solto, abstração que não vira imagem |
| **2. U, Inacreditável** | Toda afirmação grande tem chão verificável do lado? | **Número órfão FALHA:** dono genérico ("meus clientes faturam 50k em 60 dias") ou número redondo sem ninguém atribuído cheira print de venda. **MAS caso próprio com DONO NOMINAL e número atribuído PASSA** ("a Joana ficou 14 meses comigo"), mesmo com o mecanismo resumido numa frase. Mecanismo abstrato aí vira NOTA de conserto (afia o COMO), não FALHA bloqueante. O corte: tem nome e é falsificável? passa. É genérico e redondo? reprova. Razão redonda retórica (metade, o dobro, 3x) sem dono nem verbatim também é órfã: abaixa pro qualitativo ("fechando mais que você") |
| **3. B, Boring** | Avança a tensão e traz algo que ele nunca ouviu assim? | Repete o óbvio que ele já sabe, martela o problema, frase que ele já leu mil vezes |
| **4. Problema antes da solução** | Mostra problema, custo e causa antes de entregar a saída? | Joga a solução cedo demais, sem o leitor sentir o peso do problema |
| **5. Contraste** | Vira a chave do que ele pensa, em vez de confirmar? | Diz o que ele já acha. Sem antes e depois, erro e acerto, sintoma e causa |
| **6. Puxa a próxima** | Esta linha faz a próxima ser lida? | Linha que fecha o assunto, que dá pra parar ali sem perder nada |

E para **cada headline ou capa**, as 3 perguntas do crivo (gate extra, todas têm que dar SIM):

- **Dá pra ver?** Fecha o olho e enxerga a cena? (concreto, não abstrato)
- **Dá pra falsificar?** É um fato que dá pra provar certo ou errado, não um adjetivo?
- **Só eu posso dizer?** O concorrente consegue assinar a mesma frase? Se consegue, é genérica. Não basta não ser frase de guru gritante: se esse gancho já rodou em anúncio de marketing-pra-especialista nos últimos 12 meses (inveja do concorrente, "você é bom demais", "o segredo que ninguém conta", "metade fechando o dobro"), é banal no nicho, reprova. Exige gancho ancorado numa cena específica e falsificável do avatar. **O paradoxo do avatar:** o SENTIMENTO dele ("ser mais um", "bom e ninguém sabe", "não cobro o que valho") é o INSIGHT interno, nunca a headline literal, porque virou trope do nicho. A headline é a CENA que produz esse sentimento (a pergunta da esposa, a planilha guardada na gaveta, o print do tráfego que fechou pouco). Critério aberto: qualquer promessa-mãe que já rodou 12 meses no nicho é banal; a salvação vem sempre da cena específica, nunca do ângulo.

**A passada 0.5 (Consciência) em concreto, nicho IA-pra-especialista.** Errar o nível do leitor é o erro de 1ª ordem: a melhor frase, na abertura errada pro leitor errado, perde antes de começar. As réguas por nível:
- **Inconsciente** (nem sabe que tem o problema): abre pela CENA ("a recepcionista diz 'semana que vem enche', faz três meses que ela diz isso"), nunca por "automatize seu consultório".
- **Consciente do problema** (sente a dor, não conhece a saída): abre pelo MECANISMO nomeado ("o que prende teu caixa é Posicionamento, não esforço"), nunca por "fature mais".
- **Consciente da solução / do produto** (já conhece o caminho): abre pela DIFERENÇA do teu mecanismo e pela PROVA, não pela existência dele.
- **Mercado saturado (E4-E5, o nicho do perfil de exemplo):** promessa direta soa igual a todo concorrente. Abre por mecanismo nomeado + identificação ("isso explica o que eu vivo"), nunca por promessa gasta. O default "mecanismo sempre" só vale aqui; pro leitor inconsciente ele mata a abertura.

**Passada 3-bis, Proprietário (headline, capa, CTA).** Teste de substituição-de-autor: troca o nome do cliente pelo do concorrente direto na frase. Se a frase sobrevive (o rival podia assinar igual), é genérica, NOTA de conserto. A frase de assinatura é a que SÓ sobrevive na boca DESTE cliente, porque carrega um bordão, uma cena-assinatura ou o mecanismo nomeado da Biblioteca de Assinatura (`soft-plano-posicionamento/references/bloco-5-fundacao-headlines.md`, item 5). Aprofunda o "só eu posso dizer" do o crivo: não basta não ser frase de guru, tem que ser inconfundivelmente do cliente.

3 sins, passa. 1 não, reescreve. Standalone, este bloco JÁ É o teste construtivo completo (as 3 perguntas do crivo são o corte anti-genérico). Se a skill da vez tiver o `shared-references/filtro-anti-ia/teste-construtivo.md` local (toda skill que produz peça tem, é cópia sincronizada da fonte), abre lá pra mais detalhe e exemplos; o resultado é o mesmo.

## O CTA e o último bloco (onde a peça cai de tom)

O fim da peça quase sempre amolece. O gate trata o último bloco com o mesmo rigor do primeiro. **Mas o CTA muda por tipo de peça** (não aplica a régua de feed na carta):
- **Feed / anúncio:** CTA obrigatório com próximo passo claro. Ausente reprova.
- **Carta / VSL:** UM convite firme pela consequência, levando pro WhatsApp ou conversa. O rabo deferente do Soft ("se não é pra você agora, sem pressão, volta quando fizer sentido") é VÁLIDO, não conta como queda de tom, desde que o convite principal ANTES dele seja firme.
- **Script / DM / follow-up consultivo:** "pede o sim ou o não, sem empurrão" É o fechamento. "Sem CTA de marketing no final" aqui não conta como CTA-ausente, é a venda consultiva Soft.

Duas passadas a mais no CTA, que o gate não rodava:
- **Combustível (antes do comando).** Existe UMA linha de tensão de identidade ou micro-promessa concreta do que o clique destrava, logo antes do CTA? CTA que vem só de concordância intelectual ("faz sentido né? então comenta") FALHA por ponte-fraca, mesmo com destino real. O leitor concorda e segue rolando.
- **Coerência CTA × pilar.** O mecanismo do CTA contradiz o pilar declarado da peça? Um pilar de filtro/seleção (ex.: "qualidade contra volume") não fecha em mecânica que infla volume de DM. Quando o pilar é filtro, o CTA pede auto-qualificação ("comenta X + há quanto tempo você..."), não engajamento de massa. O fim não trai o começo.

As regras abaixo valem dentro do tipo certo:
- **CTA AUSENTE reprova** (no feed/anúncio). Toda peça tem a Ação do APSD, com um próximo passo claro e real (o mecanismo do funil do cliente: comenta uma palavra → puxa no direct, link → carta ou isca, manda no direct, cadastra numa página). Peça que termina só na consequência, sem dizer o que fazer, FALHA. A Ação não é opcional. Anúncio sem CTA é falha grave (é tráfego pago).
- **Caça-comentário cafona reprova** ("comenta EU QUERO 🔥" puro, engajamento vazio). O "comenta PALAVRA" do Soft passa quando leva a um próximo passo real (dá em público, pede em privado), não quando é só isca de algoritmo.
- **Frase de afago reprova** por anti-IA ("é disso que eu cuido com você", "me chama", "tô aqui pra te ajudar"). É afago de coach, não convite.
- **Queda de tom reprova.** Corpo lâmina com CTA morno é falha. O CTA tem a mesma temperatura clínica do bloco mais forte. CTA forte do Soft convida pela CONSEQUÊNCIA ("resolve a posição primeiro, aí todo esforço que você já faz vira cliente"), não pela oferta de carinho.
- **CTA genérico reprova.** A mecânica pode repetir (comenta → direct tá ok), mas a palavra-gatilho e a promessa do clique saem da CENA, não do "EU QUERO" genérico. O CTA é falsificável ("te mostro QUAL porta tá fechando o teu caixa"), não "te ajudo".
- **Separa registro de conversão (calibragem).** O CTA "comenta PALAVRA que leva a um próximo passo real" CONVERTE muito no nicho (dá em público, pede em privado). Se for penalizar, é por REGISTRO (soou cafona ou guru), nunca por "risco de conversão". Não infla a penalidade de um CTA que comprovadamente converte só porque o registro incomoda.

## Passadas de PEÇA e de formato (não só de bloco)

O gate bloco-a-bloco não pega o que só aparece no conjunto. Roda também:

- **Densidade (peça inteira).** Lista a tese de cada bloco ou slide em 1 frase. Duas iguais com roupa nova = FALHA, funde ou corta. Carrossel de 10 slides exige 6 ou mais teses distintas, senão corta slide.
- **Carrossel, os 2 pontos onde ele morre:** (1) o slide 2 ABRE O LOOP (promete algo pior ou mais fundo que a capa), nunca repete a capa reembalada. FALHA se a tese do slide 2 for a da capa reembalada. (2) Os slides finais mostram a FUNÇÃO do método, nunca o passo a passo executável.
- **Coerência de avatar.** Os sub-padrões que sustentam o ângulo vêm plausivelmente do MESMO avatar, não um Frankenstein de dores de avatares vizinhos pra inflar o N. E o ângulo-mãe canônico que o avatar já viu mil vezes só conta como fresco se a cena ou a virada for nova.
- **Prova no momento da decisão (bloqueante).** A peça planta ALGUM grão de credibilidade (caso real com dono nominal e prazo, ou resíduo de resultado do autor) antes ou no CTA? Diagnóstico afiado que chega no CTA com ZERO autoridade perde o cético-de-guru exatamente onde ele decide. FALHA. Placeholder de prova (`[CASE: ...]`, `SEUNUMERO`, `[LINK]`) deixa a peça não-publicável, nunca "pronta". (Foi a fraqueza nº 1, em 3 de 4 peças do teste.) **Número plausível não é número lastreado:** um "90 dias", um "parou de pegar trampo de fora", um "-8kg" que NÃO foi verificado na fonte (grep no acervo) nem é caso-próprio-com-dono sai marcado NÃO-VERIFICADO e força veredito `RASCUNHO-COM-PENDÊNCIA`, igual ao placeholder. A barreira de ancoragem pega a aspa fabricada; esta pega o desfecho ou prazo plausível porém sem lastro, que é por onde o "converte" bonzinho escapava.
- **Mecanismo nomeado na espinha.** O M do APSD é um artefato ou método BATIZADO (propriedade do cliente), não uma ideia genérica. Diagnóstico proprietário com solução genérica fica no nível de insight, FALHA, porque o concorrente repete a frase amanhã. O CTA promete o artefato nomeado, não uma direção vaga ("por onde começa").
- **Insight vira imagem.** Insight aprovado SÓ se traz UMA imagem concreta de como funciona na prática (o tipo de frase, a cena). Concordância intelectual sem farelo concreto não converte quem já comprou curso que não andou. Reforço das passadas Confuso e Boring.
- **Coerência de assinatura.** A peça TOCA a Biblioteca de Assinatura (`soft-plano-posicionamento/references/bloco-5-fundacao-headlines.md`, item 5)? Reusa ao menos um bordão proprietário, uma cena-assinatura ou um inimigo canônico? Peça que não toca a biblioteca não constrói marca, regride pro centro do nicho (vira "mais um"), NOTA de conserto. E o que colou de novo nesta peça (bordão que pegou, cena nova ancorada no VoC) VOLTA pra biblioteca, que é viva. É assim que o conjunto vira marca inconfundível, não peças soltas competentes.

## Quando não há case: o chão de credibilidade (destrava o iniciante)

A regra "prova no momento da decisão" + a barreira de ancoragem, sozinhas, condenam quem está do zero: a nutricionista, o fisio, o médico sem case ainda recebem RASCUNHO em TODA peça que vende. Tecnicamente correto (não inventa prova), inútil na prática. A saída NÃO é afrouxar a regra (prova nunca é inventada, isso fica de pé). A saída é uma TAXONOMIA de chãos de credibilidade legítimos, nenhum deles um case-com-número:

- **(a) Autoridade emprestada verificável.** Ancora num terceiro real e citável (um estudo, um protocolo do conselho, um dado público): "o protocolo do CFN recomenda X", não "meus pacientes". Empresta credibilidade, não inventa resultado próprio.
- **(b) Prova-do-mecanismo ao vivo.** A própria peça ENTREGA um pedaço do método e o leitor sente funcionar ali ("se o que ele dá de graça é isso, o pago..."). A demonstração é a prova, não o depoimento.
- **(c) Build-in-public honesto.** "Tô construindo isso, aqui está o que já aprendi" assume o estágio sem mentir resultado. Honestidade sobre onde está vende mais que case falso.
- **(d) Reversão-de-risco real.** Garantia que tira o downside ("se não acontecer X, devolvo / continuo até sair"). Credibilidade por assumir o risco, não por exibir passado.
- **(e) Lógica falsificável.** O argumento se sustenta na razão que o leitor confere sozinho, não em "confia em mim".

**Regra:** sem case, a peça USA um desses chãos E abaixa a promessa ao tamanho do que o chão sustenta (promessa-menor + risco-zero, regra Soft). E o gate AUTORIZA explicitamente a **peça-de-topo publicável** (ancorada em verbatim-de-dor + mecanismo nomeado, marcada `VÁLIDA PRA TOPO DE FUNIL, não pra CTA de venda direta`) em vez de rascunho eterno. O que continua FALHA: vender direto, no CTA de compra, sem case e sem nenhum dos cinco chãos. Aí é promessa solta, e reprova.

## Fraca não é a mesma coisa que público errado

Antes de carimbar REPROVA, separa (vem da simulação, passo 2):

- **FRACA:** falhou por força (confusa, sem prova, morna, óbvia). REPROVA bloqueante, reescreve.
- **FORA DE PÚBLICO:** forte, mas falando com o avatar errado. Não reprova a força, alerta o público. O conserto é trocar o alvo ou o ângulo, não enfraquecer. Isto protege candura radical e prova autoral de serem mortas à toa.

## A regra de re-checagem (uma falha de cada vez)

Revisa uma passada por vez, na ordem (Ancorado, C, U, B, ...). Tentar ver tudo de uma vez é como editar com três pessoas falando no ouvido. Depois de consertar uma passada, relê as anteriores: o conserto da B não pode ter quebrado a C. Só fecha o gate quando uma volta inteira passa sem novo conserto.

## O artefato visível (obrigatório)

Antes de mostrar a peça, o Crítico IMPRIME a tabela preenchida. Sem a tabela na tela, a peça não sai. **E qualquer placeholder aberto (`[CASE: ...]`, `[...]`, lacuna não-resolvida) faz a peça sair marcada RASCUNHO-COM-PENDÊNCIA, nunca "pronta pra publicar"**, uma carta cujo motor é o case não vai pro ar com um branco no lugar da prova. Exemplo (nicho odonto, pra não ecoar copy Soft):

**Dois vereditos quando há placeholder (não colapsa esqueleto com peça pronta).** Peça com campo-de-template aberto (`[CASE]`, `SEUNUMERO`) recebe DOIS vereditos separados: **ESTRUTURA** (o esqueleto converte, dado o lastro entrar? sim/não) e **PRONTA-PRO-AR** (todos os campos preenchidos com lastro real? sim/não). `RASCUNHO-COM-PENDÊNCIA` descreve o segundo SEM rebaixar o primeiro: não pune o esqueleto bom por ser rascunho, nem libera o rascunho como pronto. O que falta pra ficar pronta é o INSUMO do cliente (case real, número, WhatsApp), não craft. Diz exatamente qual insumo falta.

```
BLOCO: Slide 2, "No cenário odontológico atual, atendimento de excelência é fundamental."
0. Ancorado ........ FALHA (rótulo, ângulo N=0)
1. Confuso ......... PASSA
2. Inacreditável ... FALHA (afirmação genérica, zero prova)
3. Boring .......... FALHA (frase de IA, ele já leu mil vezes)
4. Prob>solução .... n/a
5. Contraste ....... FALHA (confirma o óbvio)
6. Puxa próxima .... FALHA (dá pra parar aqui)
=> VEREDITO DA PEÇA: REPROVADO (pior bloco manda).
   Conserto: "O paciente some porque esqueceu que você existe no dia que a dor passou."
```

E um exemplo que PASSA (caso próprio, mecanismo resumido), pra o gate NÃO matar prova autoral por zelo:

```
BLOCO: "A Joana ficou 14 meses comigo porque eu tirei a decisão das costas dela."
0. Ancorado ........ PASSA (caso próprio falsificável, exceção prova-do-autor)
1. Confuso ......... PASSA
2. Inacreditável ... PASSA (dono nominal "Joana" + número atribuído "14 meses")
3. Boring .......... PASSA (vira a chave: não é resultado, é decisão de menos)
=> VEREDITO DA PEÇA: PASSA.
   Nota (não bloqueante): afiar o COMO de "tirei a decisão das costas dela" fortalece, mas a peça já sustenta. Nota não reprova.
```

A diferença entre este e o "50k em 60 dias" do exemplo de cima não é o tamanho do número. É que aqui tem um nome falsificável (Joana) e lá tem "meus clientes" no vácuo.

## O teste de resistência (fecha o gate)

Depois das passadas, uma pergunta final (o teste de resistência do §5 do GUIA-COPY-APLICACAO, embutida aqui pra rodar standalone):

> Parece escrito por quem entende, ou por quem tenta parecer que entende?

Se ainda cheira a esforço, a alguém querendo soar inteligente, voltou a Confusão ou o Tédio. Mais uma passada. Só então a peça sai.

## O que o gate NÃO faz

Ele não suaviza promessa por covardia, nem enche de prova falsa. Se falta prova real, o conserto é ABAIXAR a promessa até o tamanho do que dá pra provar (premissa do método: promessa menor com risco zero converte mais que promessa grande sem chão). Reprovar em U não é "promete menos", é "promete o que você consegue sustentar, e sustenta na frente do leitor".

E o limite honesto do gate: ele aprova a FORMA (a frase é falsificável?), não a VERACIDADE. Se o caso "João, 3 pra 11" for inventado, isso é fraude, não copy fraca, e o Crítico não pega. Por isso toda NOTA de prova-do-autor lembra: o número tem que ser real. Forma falsificável com número falso é o único jeito de furar este gate, e a responsabilidade aí é do autor, não da régua.

**Aterramento do mecanismo (nicho regulado).** A prova já-acontecida o gate cuida. Mas o MECANISMO, a PROJEÇÃO e o DIAGNÓSTICO gerados também precisam de chão, principalmente em saúde, jurídico e finanças. Afirmação causal vendida como diagnóstico ("descobre seu bloqueio metabólico, a resistência à insulina") sem ressalva = FALHA. Projeção de resultado vira faixa com "pode" ("alguns casos pedem 120 dias"), nunca promessa de prazo certo. Em nicho regulado o gate cobra a ressalva (não é garantia, varia por pessoa), senão é risco de compliance, não só copy fraca.

**Nicho regulado dispara o gate-regulado (`04-gate-regulado.md`), bloqueante.** Quando o cliente é de profissão regulada por conselho (saúde, jurídico, finanças e afins), roda o `04-gate-regulado.md` ANTES de entregar, junto com o CUB, e ele entra como linha `04. Regulado` na tabela. Ele veta o que o conselho proíbe (promessa de cura, antes/depois de paciente, prazo cravado de resultado, depoimento de tratamento, disputa por preço) e troca pelo eixo que converte sem infringir (educação > promessa, mecanismo > resultado, processo > garantia). Qualquer FALHA ali reprova a peça inteira, por melhor que esteja a conversão. É piso conservador: a peça sai com "confirma a regra atual no teu conselho antes de publicar".
