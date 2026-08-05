# Entrada: ancora na fala crua do cliente

> Passo 1 do Crítico. Roda ANTES de julgar ou de gerar. Sem isso, o gate da saída só reprova sem ter com o que substituir o adjetivo genérico.

## Por que isso é o passo mais importante

Um modelo de linguagem, sem matéria-prima fora-da-média, regride pro centro do corpus em que foi treinado. Ou seja: sai a frase mais provável, que é a frase que todo mundo já escreveu. Pedir "seja específico" ou "seja criativo" não conserta isso (foi testado e falha). O que conserta é colocar na entrada uma coisa que o modelo não inventaria sozinho: **a palavra literal do cliente.**

Regra-mãe: copy genérica é reflexo de input genérico, não do modelo. O método já paga por um acervo de fala real (uma wiki de VoC destilada). O erro era nunca abri-lo na hora de escrever.

## Protocolo (qualquer usuário)

0. **Lê o perfil do usuário (`00-perfil-do-usuario.md`) e pega a fonte de VoC dele.** A skill serve o usuário da vez, nunca só o autor do método: a fonte de VoC é o slot 1 do perfil dele (acervo de fala real: calls, comentários, prints de conversa, mensagens de aluno, dúvida recorrente no Direct, ou uma wiki destilada). Os caminhos do perfil de exemplo que aparecem abaixo (o acervo de fala real do autor) são UM exemplo de perfil preenchido, nunca o default. Sem nenhuma fonte de fala real no perfil, a peça sai marcada "rascunho genérico" e a skill roteia pro onboarding, não some o problema com adjetivo.

1. **Abre o acervo (exemplo, perfil de exemplo):** a camada enxuta do acervo de fala real do usuário (ex.: o índice de uma wiki de VoC destilada). É a camada enxuta, todo número foi contado, todo verbatim é frase literal ancorada na call. Serve de índice (temas por N). Pra outro usuário, o equivalente é a base de fala real dele.
2. **Acha o tema do maior N** que casa com o assunto da peça. O "Mapa de temas (por N de calls)" lista tudo rankeado: Prova social N=29, Funil e processo comercial N=23, Pressão financeira N=22, e por aí.
3. **Abre a página REAL do tema na pasta de padrões do acervo** pra pegar a frase inteira, não o slug. ATENÇÃO: os links dentro da camada enxuta às vezes estão quebrados e os nomes dos arquivos podem ser diferentes dos slugs (ex.: o tema "Pressão financeira" pode estar como `pressao-financeira.md`, não o slug longo). Não confia no link. Lista a pasta de padrões do acervo (`ls`) e escolhe o arquivo pelo nome.
4. **Puxa 3 a 5 falas de DOR + 3 a 5 de DESEJO** do tema, literais, da página real. ATENÇÃO às 2 camadas da página: a linha-padrão destilada (a dor do sub-padrão, em itálico) e as aspas cruas (fala da call, que por chunking às vezes é de outro assunto ou é ruído). A aspa que você usar tem que expressar a MESMA dor da linha-padrão dela. Se a crua não bate ou é ruído, ancora na linha-padrão destilada em texto corrido citando o N. A primeira linha da peça contém uma dessas falas quase intacta. O resto conversa com elas.
5. **Checa o ÂNGULO, não só a frase (anti-genérico-importado).** O núcleo da peça (a virada, a cena, o número central) tem verbatim com N≥2 que o sustente? Se as frases têm eco no acervo mas o ângulo-mãe tem N=0, é rascunho genérico importado de outro avatar, mesmo que afiado. Marca pro gate: a passada 0 reprova, e diz o N.
5.1. **Cruzamento de persona (o N pode ser do avatar ERRADO).** O ângulo-mãe casa com a persona, ou a CONTRADIZ? Verbatim de N alto pode vir de OUTRO avatar do acervo. Se a dor central é NEGADA pela persona (ex.: eixo "caixa apertado" N=22 × persona "não é refém de dinheiro, já fatura R$20k"), o lastro é ERRADO, não "lastro frio": atrai o avatar errado e repele o alvo. Passada 0 do gate reprova. A regra é N≥2 **E** não-contradiz-persona, as duas.
6. **Cita o verbatim e o N como prova** quando justificar o ângulo. Duas regras duras: (a) o que vai entre ASPAS é substring literal da página, palavra por palavra, nunca paráfrase do padrão remontada; (b) o N é do SUB-PADRÃO específico, nunca o N do tema emprestado. "Puxei de 'Conteúdo sem conversão' (sub-padrão N=3, dentro do tema Conteúdo e consistência), fala literal: '...'." Sub-padrão N=1 entra como cena ilustrativa, marcado "lastro fino", nunca vendido como N forte. A entrada já MONTA a tabela de ancoragem (uma linha por aspa ou eixo: aspa na peça | substring colado da fonte via grep | arquivo:linha | N do sub-padrão | a tese da peça afirma o MESMO que a fala?). O gate (`03-gate-cub.md`, barreira de ancoragem) só RE-VERIFICA essa tabela. Nascer com ela preenchida é o que evita o auto-carimbo "confere de cabeça".
7. **Dor do cliente vs prova do autor.** A DOR precisa de verbatim de cliente com N. Mas PROVA ou HISTÓRIA DO AUTOR (caso próprio, número próprio real e falsificável) é matéria-prima legítima mesmo sem verbatim de cliente, desde que seja verdade verificável e atribuída (de quem, em quanto tempo, por qual mecanismo). Não confunde os dois.
7.1. **Sem case, declara o chão de credibilidade.** Se o cliente da vez não tem case nem número próprio (o iniciante do zero), a entrada já marca qual dos cinco chãos do gate a peça vai usar (autoridade emprestada / prova-do-mecanismo ao vivo / build-in-public / reversão-de-risco / lógica falsificável, ver `03-gate-cub.md`) e desce a promessa ao tamanho dele. Sem isso, a peça serve só pra TOPO de funil, não pra CTA de venda direta. Isso evita o RASCUNHO eterno que mata o iniciante sem mentir prova.
8. **Se a página não resolver, NÃO degrada em silêncio.** Sem verificar a ancoragem na fonte real, a passada 0 do gate sai como FALHA por ancoragem não-verificada, nunca PASSA. Link morto virando carimbo de aprovação é o pior falso-negativo.
9. **Respeita o mapa de cobertura.** O corpus é forte em entrega, execução e prova social, e magro em lead frio. Não usa verbatim de cliente quente pra falar com público que ainda não te conhece. Se o tema é raso no acervo, marca a lacuna e complementa, não inventa.
10. **Colisão com o rival (insumo de bastidor, NÃO vai pro ar).** Quem é o concorrente direto que disputa o MESMO avatar, e o que ele afirma? O ângulo da peça se OPÕE de forma demonstrável a ele (a cunha), em vez de ser um "não-clichê" genérico. Isto afia o ângulo nos bastidores, mas a peça NUNCA cita o rival: ela nomeia a categoria ou o inimigo (ver a Lei do inimigo), jamais o concorrente. Sem rival claro pra esse tema, pula.

## Exemplo (nicho odonto, pra não ecoar copy Soft)

Peça pedida: carrossel sobre por que o consultório não lota.

❌ **Sem o passo (rótulo abstrato):** "Oferecer um atendimento de excelência é essencial para o sucesso do seu consultório."
Isso é a frase média. Qualquer um assina. O dentista já leu mil vezes.

✅ **Com o passo (fala crua de dentista e de paciente):** "Sua recepcionista diz 'semana que vem enche'. Faz três meses que ela diz isso."
A segunda nasceu da queixa literal. Ela não é mais bonita. Ela é mais REAL. Por isso prende. (No método Soft, a fala vem da página real do tema na pasta de padrões do acervo de VoC do usuário, com o N.)

## O freio contra o óbvio (Verbalized Sampling)

Quando for gerar ângulo ou headline a partir do verbatim, não pega a primeira que vier. A primeira é sempre a mais provável, logo a mais genérica.

> Gera 7 versões. Descarta as 2 primeiras na cara, são as óbvias. Trabalha a partir da 3ª em diante.

Isso força sair do centro do corpus de propósito.

## Protocolo (outro cliente, sem VoC pronto)

Se a skill estiver rodando pra um cliente que ainda não tem acervo VoC (caso do produto self-serve), o passo vira mineração rápida, no espírito do review mining:

1. Pede ao cliente (ou puxa de onde houver) falas reais do público dele: comentários, prints de conversa, mensagens de aluno, dúvida recorrente no Direct.
2. Separa em 3 baldes: **o que ele AMA** (desejo), **o que ele ODEIA** (inimigo, frustração), **o que ele TEME** (medo, objeção).
3. Critério de fala "que cola" (sticky): aparece repetida em fontes independentes. Uma fala que só apareceu uma vez é anedota, não padrão.
4. A peça nasce dessas falas. Mesmo princípio: palavra real na entrada, não rótulo.

Sem nenhuma fala real disponível, a peça sai marcada **"rascunho genérico, não publicar"**. Nunca "qualidade decente". Honestidade sobre o que é.
