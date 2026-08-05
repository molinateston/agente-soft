---
name: soft-vendas-estrategias
description: "O PLAYBOOK de COMO e QUANDO vender do metodo Soft: escolhe a JOGADA de campanha certa pro momento (audiencia + oferta + objetivo) e monta a estrategia de lancamento. Contem as 10 jogadas (Levantada de Mao, Caixinha, Oferta Direta, Storytelling, Reuniao de R$100, Pre-venda, Pix de Compromisso, Destaques, Vendas Automaticas, Lembrei de Voce) + o LANCAMENTO da oferta high-ticket (vender antes de montar, founding alternados, gate de consumo, micro-oferta, DM sem call). Diagnostica o momento e devolve a jogada de menor custo + a ordem no mes. Use quando o pedido for como/quando/o que vender agora, plano do mes, campanha, jogada, lancar/relancar oferta, gerar caixa, reativar base, validar produto, subir preco, sem caixa esse mes. NAO use pra ABRIR/qualificar/agendar lead (soft-vendas-sdr) nem CONDUZIR/fechar/objecao (soft-vendas-closer); desenhar a mentoria (soft-plano-ofertas); posicionamento (soft-plano-posicionamento); trafego pago (soft-trafego-meta); a copy da peca (soft-conteudo/soft-funil)."
---

# Estratégias de venda, as jogadas de COMO e QUANDO vender

Caixa não entra de "postar mais". Entra de **rodar a jogada certa pro momento**: a audiência que ele tem, a oferta que ele quer mover, o objetivo do mês. Esta skill é o cardápio das jogadas de campanha do método Soft e o lado lançamento da oferta. Recebe o momento do especialista e devolve **qual jogada rodar, em que ordem no mês, e qual mãe executa cada parte**, tudo no menor custo de aquisição possível.

> **A doutrina-mãe (rege tudo):** nenhuma jogada vende sozinha. Toda jogada Soft **filtra E convence**, revela a dor real e confirma o próximo passo, nunca empurra. O script bruto de cada jogada é **esqueleto**: passa pela voz do dono e pelo filtro anti-ia antes de ir pra rua. Tom de robô educado ("espero que esteja bem", "agradeço a confiança") **mata** a jogada.

**A fronteira (leia antes de tudo):** esta skill decide **COMO e QUANDO vender** (a jogada, a campanha, o plano do mês, a estratégia de lançamento). Ela **NÃO** abre/qualifica/agenda o lead (isso é **soft-vendas-sdr**) nem **conduz/fecha/responde objeção** (isso é **soft-vendas-closer**). A jogada gera a conversa e aponta pra ponta comercial: quando o lead esquenta, o SDR abre e o closer fecha. Esta skill entrega a estratégia; as irmãs executam a venda.

**Como o método trata número e exemplo:** a mecânica abaixo é a regra do caminho, em voz própria. Onde aparece exemplo, vem em **nicho fictício rotulado** (mostra o formato, nunca é molde pra copiar). Nenhum número de resultado (ticket, quantidade de vendas, taxa de subida) é afirmação universal: ou vira **princípio sem número**, ou vira **SLOT do dono** preenchido COM ele e falsificável, marcado `[A CONFIRMAR]` até validar. Números de MECÂNICA (R$100 de filtro, 10% do Pix, 2 founding, 6-7 pessoas, 3 a 7 perguntas/dia) ficam, porque são parâmetro do processo, não prova emprestada.

**Este SKILL.md é o processo inteiro.** O miolo executável (as 10 jogadas, o lançamento, o diagnóstico) mora aqui no corpo. As references guardam a profundidade dirigida (lidas no passo indicado). Roda o **gate por dentro** antes de mostrar.

**Modo A (Consultor do mês, default):** o dono chega com um momento ("sem caixa esse mês", "vou lançar", "como vendo isso") → diagnostica e devolve a jogada/combinação certa. **Modo B (Uma jogada específica):** o dono já sabe qual quer ("monta minha Reunião de R$100") → vai direto pra ela, roda o esqueleto na voz dele. Detecta o modo na 1ª mensagem.

## O que esta skill PRODUZ

- **O Plano de Jogadas do mês:** a combinação de jogadas que fecha o volume de conversa que a meta exige, na ordem certa, com a frequência certa.
- **A jogada montada:** o esqueleto de UMA jogada (sequência de stories, automação, roteiro, oferta) pronto pra passar na voz do dono.
- **A estratégia de lançamento da oferta:** vender antes de montar com data futura, os 2 founding alternados, o gate de consumo, a micro-oferta como porta, o caminho DM sem call.
- **O handoff comercial:** o ponto onde a jogada gera lead quente e passa pro SDR abrir / closer fechar.

**Serve o agente:** equipa o LEON/cliente a não mandar "produzir mais conteúdo solto". Depois do funil reverso (a Conta diz QUANTO), esta skill diz COMO encher esse funil com a jogada de menor custo pro momento.

## Output Contract (o doc que sai, e como ele sai)

- **Entregável:** UM doc consolidado. No Modo A é o **Plano de Jogadas** (diagnóstico do momento · jogada(s) escolhida(s) + porquê · ordem no mês + frequência · mãe que executa cada parte · onde entra o handoff comercial). No Modo B é **A Jogada Montada** (o que é · quem pode rodar · resultado esperado como SLOT · o passo-a-passo na voz do dono · onde encaixa · quem executa · ajuste Soft).
- **Forma:** DENSO, tabelas e listas, nunca paredão de prosa. Cada seção é a matéria, não a explicação dela.
- **Fidelidade:** só o que vem do método e do que o dono confirmou. Furo vira `[A CONFIRMAR]` no lugar exato, nunca inventa número/meta/case/fala. Todo resultado de jogada é SLOT do dono, nunca promessa cravada.
- **STOP obrigatório:** para a cada Passo, mostra ou atualiza o doc e pergunta "ajusto?". Espera OK antes de avançar.

## ⚠️ ENTREGA = UM doc MD, SEMPRE (nunca pingar a peça no chat)

Regra dura: o RESULTADO desta skill sai como **UM documento markdown consolidado**. No **claude.ai**, um **artifact de markdown** (o dono abre, copia, baixa); no **Claude Code**, um arquivo `.md`. No **agente/Telegram**, gera o doc como arquivo e cita o path completo na resposta (o bridge anexa); a condução vai em mensagens curtas, sem markdown pesado (sem `##`, sem tabela `|` no texto ao usuário). A CONDUÇÃO (perguntas de contexto, escolhas, os STOPs de aprovação) acontece no chat; a PEÇA (o Plano de Jogadas, a Jogada Montada) mora no DOC. Ao parar num STOP, você mostra ou atualiza o DOC e pergunta "ajusto?"; NUNCA reescreve a peça em pedaços soltos no corpo da conversa. Sem o doc entregue, a skill não terminou.

**No app sem artifact nativo:** o doc vai num único bloco de código markdown fechado (uma cerca ``` que abre e fecha), separado da condução. O texto de bastidor (que Passo detectou, que modo está ativo, o que o OK autoriza) NUNCA entra no doc nem no chat: o usuário quer o doc limpo e a próxima pergunta. Condução curta fora do bloco; peça inteira dentro do bloco.

---

# O PROCESSO (P0 a P3, um STOP por passo)

**Regra dura anti-corrida (uma resposta = no máximo UM Passo novo):** proibido rodar 2 Passos no mesmo turno, mesmo com OK. O OK do P(n) libera SÓ o P(n+1). NUNCA execute o Passo N+1 antes do OK explícito do Passo N. Um único STOP por resposta.

**Regra dura contra bastidor (o raciocínio de processo é interno):** NUNCA narre qual Passo ou Modo detectou, nem explique o que o OK autoriza, nem anuncie "li o SKILL, agora vou executar". Conduz com a próxima pergunta, entrega o doc, ponto.

## P0: Ancoragem + diagnóstico do momento (de onde a jogada nasce)

Antes de escolher a jogada, ancora no dono e lê o momento. Puxe o perfil/posicionamento (cliente ideal, problema que resolve, oferta e PUV vindas da **soft-plano-posicionamento**) e **leia o perfil do usuário + o banco de provas** (`shared-references/crivo/00-perfil-do-usuario.md`; é de lá que sai todo número canônico). **Regra dura: nenhum número vira prova no doc se não estiver no banco de provas do dono**; número sem fonte entra como `[A CONFIRMAR]`.

- **Sem posicionamento nenhum** (não sabe cliente ideal nem a oferta) → PARA e manda pra **soft-plano-posicionamento** antes. Jogada sem oferta clara vende nada.
- **Sem a Conta / meta do mês** (não sabe QUANTO precisa) → aponta o **soft-leon** (Plano de Guerra) pra rodar o funil reverso; a Conta diz quantas jogadas e com que frequência.

**O diagnóstico do momento (as 5 perguntas que escolhem a jogada):**

| Sinal | Se SIM, a jogada de menor custo |
|---|---|
| **Tem base de clientes/ex-clientes?** | **Lembrei de Você** (#10), o caixa mais barato, sempre a 1ª ao abrir produto novo |
| **Tem audiência ativa (mesmo pequena, lista quente)?** | **Levantada de Mão** (#1) + **Caixinha** (#2) rodando em fundo |
| **Tem produto novo pra testar antes de criar?** | **Pré-venda** (#6), valida com dinheiro na mesa |
| **Vai subir preço / tem demanda represada?** | **Pix de Compromisso** (#7), congela quem quer mas não tem o valor cheio |
| **Tem volume de DM cansando o manual?** | **Vendas Automáticas** (#9) + **Destaques** (#8), piloto automático |

**Regra do menor custo:** sempre começa pela jogada de menor custo de aquisição disponível no momento (base quente antes de audiência; audiência antes de tráfego). A Reunião de R$100 (#5) entra como **pico** do mês quando ele tem audiência semente (~200 views qualificados já sustenta).

**STOP.** Confirma cliente ideal + oferta + meta do mês (ou aponta a mãe que falta) + o momento (as 5 respostas). Espera OK.

## P1: Escolher a(s) jogada(s) e a ordem no mês

Com o momento na mão, escolhe a combinação. Não é "uma jogada": é a **ordem** que fecha o volume que a Conta exige.

**Ordem típica num mês de partida:** Lembrei de Você (base quente primeiro) → Levantada de Mão + Caixinha em fundo (semana/dia) → Oferta Direta 1x/semana → Reunião de R$100 como pico → Pré-venda quando for testar produto novo → Pix de Compromisso pra fechar o quente que empacou só no preço. Destaques e Automáticas entram quando o fluxo de seguidor novo e o volume de DM crescem.

**Como as jogadas se encadeiam (o funil):**
1. **Motor diário sempre ligado:** Caixinha (#2) e Oferta Direta (#3) rodam todo dia/toda semana, subindo autoridade OU carregando oferta, sem depender de evento.
2. **Entrada de lead quente:** Levantada de Mão (#1) enche o direct e qualifica 1 a 1.
3. **Vender com história:** Storytelling + Oferta (#4), ideal pra lançar/relançar.
4. **Micro-lançamento com caixa:** Reunião de R$100 (#5), filtra curioso, entrega valor, oferta high-ticket no fim.
5. **Validar antes de criar:** Pré-venda (#6), vende o produto antes de existir.
6. **Fechar quem empacou só no preço:** Pix de Compromisso (#7).
7. **Escalar sem repetir esforço:** Destaques (#8) deixam as ofertas organizadas no perfil.
8. **Piloto automático:** Vendas Automáticas (#9) plugam bot no DM.
9. **Reativar a base:** Lembrei de Você (#10), o caixa mais barato.
10. **A esteira que costura tudo:** entrada barata sobe pra grupo e mentoria high-ticket. Quem estrutura a mentoria high-ticket (oferta, ticket, formato) → **soft-plano-ofertas**.

Profundidade das 10 jogadas em `references/jogadas-de-campanha.md` (cada uma: o que é · quem pode rodar · resultado esperado · como funciona passo-a-passo · onde encaixa · quem executa · ajuste Soft).

**STOP.** A(s) jogada(s) escolhida(s) + o porquê + a ordem no mês + a frequência. Espera OK.

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

## P2: Montar a jogada (o esqueleto na voz do dono)

Monta o esqueleto da(s) jogada(s) escolhida(s). Cada jogada tem seu passo-a-passo; o esqueleto passa na voz do dono e no anti-ia ANTES de ir pra rua. As 10, em resumo executável:

**#1 Levantada de Mão (funil de stories).** Story com os 5 elementos (escassez real · público nomeado · resultado · urgência · UM CTA). Fala-âncora: *"Procuro [2-3] [público] que querem [resultado] nos próximos [X dias]. Vou te mostrar como [mecanismo]. Se você quer [resultado], responde [palavra]."* Posta como 1º story do dia. 24h qualificando (3 perguntas de diagnóstico, não qualifica demais). Oferta na DM (vídeo curto personalizado; fecha ali até ~R$3.000, acima do limiar agenda a call 1:1). Follow-up: 24h "viu?" / 48h só o nome.

**#2 Caixinha de Perguntas (coringa diário).** 3-7 perguntas/dia + 1-2 ofertas no meio. Reformula pergunta mal feita, manda pergunta a si mesmo (ativa o comprador silencioso). Tipo autoridade (resposta printável com camada de método) intercalado com tipo oferta (direta e indireta). Layout com padrão visual. Não responde caixinha "besta".

**#3 Oferta Direta (comunicar claro, por público).** Escolhe 1 público específico ("é pra você que..."). Escolhe o modelo de copy (power offer / oferta estruturada / consultoria premium / checkout). Escolhe a rota: **com preço** (DM/checkout) se validada ou pra ancorar; **sem preço, só DM** se ainda valida demanda; **checkout direto** se validada. Ancoragem: oferta cara, depois barata.

**#4 Storytelling + Oferta.** Base quente (close friends/lista). Sequência: chamada → micro-história real de transformação → ponte pra oferta → oferta → ação rápida + condição de quem é de casa. [2h] caixinha de dúvidas. Depois replica pro público aberto mudando o contexto final.

**#5 Reunião de R$100 (micro-lançamento, o pico).** O R$100 é **filtro** (reembolsável, quase ninguém pede de volta), não o produto. Dois formatos: turma pequena (10-15, sabatina) ou temática (20+, sem sabatina, tema que a audiência já deseja). Sequência de stories (gancho que qualifica · power offer · urgência · [2h] prova social · [2h] quebra de objeção). Automação (Pix R$100 → grupo do wpp → link da sala). Roteiro (1h-1h30): agenda → conteúdo útil (não seja mesquinho) → oferta do próximo passo (5-10min, vantagem exclusiva, não desconto) → oferta ativa 24h → feedback individual no dia seguinte (vira depoimento).

**#6 Pré-venda (validar antes de criar).** Descobre a demanda (caixinha/enquete/DM, não inventa). Sequência: curiosidade → segredo → apresentação → conteúdo + pra quem é → preço cheio + prova → **condição especial** (preço de pré-venda) → bônus que a pessoa já consome na hora. Link direto → libera conteúdo/bônus + grupo. Vira destaque, repete mudando só o prazo ("15 dias" → "7" → "3").

**#7 Pix de Compromisso (congela o preço com 10%).** Modo stories (ancorado em aumento de preço): mostra o grupo e o nº de membros → "preço sobe quando bater [N]" → "quer entrar e não tem o valor? me chama" → [1h30] prova social → qualificação explícita ("só pra quem já decidiu") → oferta (10% agora, congela por 6 meses, entra pagando a diferença parcelável) → bônus que ajudam a juntar o resto. Modo 1:1 (objeção "não tenho dinheiro"): só no DM. NUNCA esconde o valor cheio.

**#8 Vendas com Destaques (esteira no perfil).** Ordem: primeiro os destaques de prova/quebra de dúvida. 1 destaque por produto. Dentro: o que é → como funciona → mostra por dentro → cases → CTA (checkout ou "me chama"). Onde subiu preço e o story novo não foi feito: "me chama e a gente fecha". Mantém atualizado (número mentiroso reprova).

**#9 Vendas Automáticas (bot no DM + downsell).** Stories + take-away (afastamento: "é pago, se não vai executar não envie"). Bot dispara com a palavra: msg 1 assume que é bot e **revela o preço cedo**. Se não: opções mais acessíveis. Se sim: detalhes + botão único → pagamento. Downsell: quem não se qualifica pro principal pega a consultoria/sessão menor como 1º passo. A operação do bot no CRM/WhatsApp = **soft-vendas-sdr**.

**#10 Lembrei de Você (reativar a base).** Segmenta (regulares · ex-clientes · alto valor). Conexão inicial de verdade (não abre com pitch). Apresenta a novidade como evolução natural (ele se sente parte, não alvo). Convite leve. **Atenção:** o esqueleto padrão engana com tom de robô ("espero que esteja bem", "agradeço a confiança") e isso NÃO passa no anti-ia. Reescreve na voz do dono e apresenta pelo **teto que aquele cliente sente**, não por "estou lançando".

Profundidade e roteiros completos em `references/jogadas-de-campanha.md`.

**STOP.** A jogada montada (esqueleto na voz do dono, resultado como SLOT). Espera OK.

## P3: Estratégia de lançamento da oferta (vender antes de montar)

Quando a jogada é um **lançamento** de oferta high-ticket (nova mentoria, novo programa), a estratégia de COMO lançar segue a regra-mãe: **não monta a estrutura inteira antes de vender.** A pessoa compra pelo fim, não pelo meio.

- **Vende ANTES, com data futura.** Lança com uma data lá na frente pra começar, vende a proposta, organiza enquanto os primeiros entram. Não precisa de estrutura pronta pra vender.
- **2 mentorados founding em dias/semanas ALTERNADOS.** Não faz a sessão dos dois no mesmo dia: mentorado 1 na segunda, vê a evolução na semana, leva o aprendizado pro mentorado 2 na quinta. Itera o método de um pro outro, ganha velocidade.
- **Founding em troca de caso documentado:** os primeiros entram por condição especial em troca do caso (formulário de saída cruzado + depoimento). Sem caso, não escala.
- **Gate de consumo:** só libera o próximo nível quem consumiu o atual (assistir as aulas base, cumprir a fase). Puxa quem estava parado.
- **Individual até 6-7 pessoas.** Passou disso, é hora de pensar em grupo (isso é desenho de produto → **soft-plano-ofertas**).
- **A micro-oferta como PORTA de entrada** (consultoria paga, call única de 60-90min sobre UM problema): capta quem quer só um direcionamento. Vira grupo via **cashback** (paga só a diferença) OU vira downsell de quem não fechou o principal. NÃO dá acesso ao grupo na consultoria (senão mata o upsell).

**O canal de fechamento (o limiar unificado da família vendas):** a esteira comercial 1:1 (mentoria, jogadas de campanha) fecha **na DM/WhatsApp até ~R$3.000** (o doc de oferta + áudio/vídeo curto fecham ali); **acima de ~R$3.000 o chat qualifica e agenda a call 1:1**, e é na call que o high-ticket fecha (a call também entra quando o lead pede a condução ao vivo ou a decisão é a vários). O **Funil de Aula Agendada** fecha one-step no checkout, na própria aula. Quem conduz o fechamento (DM ou call) = **soft-vendas-closer** (modo `dm-sem-call` até o limiar); quem abre/agenda quando há equipe e volume = **soft-vendas-sdr**.

> **Fronteira dura:** aqui a skill decide QUE estratégia de lançamento usar e COMO a jogada gera o lead. **Desenhar/precificar a mentoria** (regra 10x, as 4 etapas, a Ficha Técnica) é da **soft-plano-ofertas**. **Conduzir a conversa e responder objeção** é da **soft-vendas-closer**. Não faz o trabalho das irmãs; aponta pra elas.

Profundidade em `references/lancamento-e-esteira.md` (vender antes com data, founding alternados, gate de consumo, micro-oferta/porta/downsell com cashback, a esteira de 3 públicos e a matemática da meta).

**STOP.** A estratégia de lançamento: data futura, 2 founding alternados, gate de consumo, teto individual, porta (micro-oferta), canal de fechamento. Espera OK.

## Funil micro-ondas (aquece o lead frio antes do contato humano, pra quem vende serviço)

Uma jogada de arquitetura de funil pra quem vende **procedimento ou serviço** (quem atende, consultor, mentor): esquenta o lead frio em minutos, antes de qualquer contato humano. É **tática**: convive com a escada de 3 funis (Funil Soft, Webinar, Launch), o webinário-perpétuo segue como funil-mãe. A regra do menor custo continua: base quente e audiência antes de tráfego frio.

- **Funil micro-ondas:** reel/anúncio que fisga a dor, automação de comentário/DM ("digita [palavra]"), página de aula de ~15 min que AQUECE (o especialista tira a dúvida do pré/durante/pós do serviço), botão de WhatsApp só no fim. Quem chega no WhatsApp já assistiu à aula e chega quente pro fechamento de serviço 1:1, nunca frio.

Profundidade e handoffs em `references/lancamento-e-esteira.md` (seção "Funil micro-ondas").

---

## O GATE (roda por dentro, silencioso, NÃO imprime)

Só doc com **VEREDITO=PASSA** vai pro usuário. Um ✗ refaz **o item**, não o doc inteiro:

| Check | Passa se |
|---|---|
| **Ancoragem** | herdou cliente ideal + oferta do dono; sem posicionamento → mandou pra soft-plano-posicionamento; sem meta → apontou o soft-leon |
| **Momento diagnosticado** | rodou as 5 perguntas (base? audiência? produto pra validar? vai subir preço? volume de DM?) antes de escolher a jogada |
| **Menor custo primeiro** | escolheu a jogada de menor custo de aquisição disponível (base quente antes de audiência antes de tráfego) |
| **Ordem no mês** | não entregou "uma jogada solta"; deu a combinação + a ordem + a frequência que fecha o volume da Conta |
| **Jogada filtra E convence** | cada jogada afasta quem não é cliente e convence quem se reconhece; nada de empurrar ou prometer milagre pra todo mundo |
| **Prova é real** | toda prova social é verdadeira (coletada por design, não fabricada); número de membros/case atualizado |
| **Take-away/afastamento honesto** | onde a jogada usa afastamento (#3, #9), é filtro honesto, não manipulação |
| **Lançamento na ordem certa** | vende antes com data; 2 founding alternados; individual até 6-7; gate de consumo; founding = caso documentado; micro-oferta não dá acesso ao grupo |
| **Canal de fechamento certo** | até ~R$3.000 fecha na DM; acima de ~R$3.000 qualifica e agenda a call 1:1; aula = one-step no checkout; não confundiu |
| **Fronteira respeitada** | NÃO abriu/qualificou lead (é da soft-vendas-sdr), NÃO conduziu/respondeu objeção (é da soft-vendas-closer), NÃO desenhou/precificou a mentoria (é da soft-plano-ofertas); apontou a mãe certa |
| **Esqueleto vai na voz do dono** | todo script bruto sai marcado como esqueleto pra passar na voz do dono + anti-ia antes da rua; tom de robô educado reprova |
| **Números são do dono (Lei da fidelidade)** | todo resultado/ticket/taxa é do dono ou `[A CONFIRMAR]`; número de exemplo nunca virou promessa; números de mecânica ficam |
| **Output DENSO** | tabelas/listas, não prosa; zero meta-narração/bastidor; sem tabela de gate na saída |
| **Anti-IA (HARD)** | zero em-dash (o travessão longo, código U+2014) · zero família "travar/travado/destravar" (exceto aspa literal) · sem frase-emoldura · sem verbo-clichê de hype · PT-BR com acentuação correta. Ver o bloco de reescrita logo abaixo. |
| **VEREDITO** | **= o PIOR item.** Um ✗ = REFAZ o item. Só tudo-✓ = PASSA. |

**Reescrita obrigatória do em-dash (o furo mais provável, o modelo usa por reflexo na prosa PT-BR densa):** o em-dash é o travessão longo, U+2014. **Não basta "buscar e refazer": REESCREVA de fato cada ocorrência.** Regra imperativa: substitua o travessão por **vírgula, dois-pontos ou ponto** conforme o sentido; travessão de aposto no meio da frase vira **vírgula**; travessão que anuncia consequência ou lista vira **dois-pontos**; travessão que separa duas ideias inteiras vira **ponto**. Faça isto ANTES de marcar o item ✓.

- **ANTES:** `o R$100 nao e o produto [travessao] e o filtro` · **DEPOIS:** `o R$100 não é o produto: é o filtro`
- **ANTES:** `base quente rende [travessao] e o caixa mais barato` · **DEPOIS:** `base quente rende, é o caixa mais barato`
- **ANTES:** `a jogada gera o lead [travessao] o closer fecha` · **DEPOIS:** `a jogada gera o lead. O closer fecha`

**Verificação real antes do ✓ (declarar ✓ sem buscar é gate falso, o erro mais grave):** no Code roda `grep -oaP "\xe2\x80\x94" no-doc-final | wc -l` (tem que dar 0) e o mesmo pra família "travar"; no chat/app varre o texto inteiro procurando o travessão longo caractere a caractere. Achou um travessão, reescreve pela regra acima e varre de novo.

O filtro anti-IA completo (12 padrões banidos, teste em voz alta) mora na `soft-anti-ia`: invoque-a na última checagem da copy da jogada.

---

## EXEMPLO DENSO (Plano de Jogadas, nicho fictício, MODELA nunca copia)

> Nicho de exemplo: **consultor de gestão pra donos de restaurante** (fictício, só pra mostrar o formato). Momento: já tem ~15 clientes de consultoria avulsa, audiência de ~1.200 no Instagram com ~250 views qualificados, quer abrir uma mentoria em grupo e nunca lançou. Meta do mês `[A CONFIRMAR com a Conta dele]`.

| Bloco | Preenchido |
|---|---|
| **Momento (5 perguntas)** | Base? SIM (15 clientes) · Audiência ativa? SIM (250 views qualificados) · Produto pra validar? SIM (a mentoria nova) · Vai subir preço? não agora · Volume de DM? baixo |
| **Jogada 1 (menor custo)** | **Lembrei de Você** com os 15 clientes: apresenta a mentoria como evolução natural do que aprendeu atendendo restaurantes, convite leve pra conhecer. Na voz dele, pelo teto de cada um (o dono que trabalha 14h e não tira o negócio das costas) |
| **Jogada 2 (fundo)** | **Caixinha** diária (3-5 perguntas, 1 oferta) + **Levantada de Mão** 2x/semana pra encher o direct |
| **Jogada 3 (pico)** | **Reunião de R$100** temática sobre "a escala que empaca" (tema que a caixinha acusou), 20+ pessoas, oferta da mentoria no fim |
| **Lançamento** | Vende a mentoria com data futura ("turma começa em 30 dias"); 2 founding alternados em troca de caso documentado; individual até 6-7 antes do grupo; ticket acima de ~R$3.000, então a DM qualifica e agenda a call 1:1 de fechamento |
| **Ordem no mês** | Lembrei de Você (semana 1) → Caixinha+Levantada em fundo (todo mês) → Reunião de R$100 (semana 3, o pico) → founding fechando em call agendada ao longo do mês |
| **Handoff comercial** | lead quente da Levantada/Reunião → **soft-vendas-sdr** abre/agenda (se houver volume) → **soft-vendas-closer** conduz e fecha (DM até ~R$3.000, call acima). Desenho/preço da mentoria → **soft-plano-ofertas** |

Repare: começa pela base quente (menor custo), motor diário em fundo, pico com evento, lançamento vendido antes de montar, e cada ponta comercial apontada pra mãe certa. Números do dono ficam `[A CONFIRMAR]`.

---

## When NOT to use
- **ABRIR / qualificar / agendar o lead / prospecção na DM / SDR / CRM** → **soft-vendas-sdr**.
- **CONDUZIR / fechar / responder objeção / pedir o Pix / follow-up de venda / copiloto / analisar conversa / pós-venda** → **soft-vendas-closer**.
- **Desenhar / estruturar / precificar a mentoria em si (regra 10x, as 4 etapas, Ficha Técnica, esteira de 3 públicos como produto)** → **soft-plano-ofertas**.
- **Posicionamento / nomear método / PUV / oferta do zero** → **soft-plano-posicionamento**.
- **Tráfego pago / impulsionar / quanto investir / ROAS** → **soft-trafego-meta**.
- **A COPY da peça** (a headline, o carrossel, o reel, os stories, a carta, a landing) → **soft-conteudo-*** / **soft-funil-***.
- **Webinar / oferta de palco / o perpétuo** → **soft-webinar** e irmãs.
- "Por onde começo / próximo passo / que fase tô / plano do mês com a Conta / valida isso" → **soft-leon** (que puxa esta skill pra jogada certa).

## Anti-Patterns (sintoma → correção)

| Sintoma | Correção |
|---|---|
| Mandou "postar mais / produzir mais conteúdo" | Escolhe a JOGADA certa pro momento, na ordem certa; conteúdo solto não é estratégia |
| Escolheu a jogada sem diagnosticar o momento | Roda as 5 perguntas (base? audiência? produto? preço? DM?) antes de escolher |
| Começou por tráfego/audiência fria com base quente parada | Menor custo primeiro: Lembrei de Você e a base quente ANTES de qualquer coisa |
| Entregou "uma jogada solta" | Dá a combinação + a ordem no mês + a frequência que fecha o volume da Conta |
| Montou a estrutura da mentoria inteira antes de vender | Vende antes com data futura; monta com os founding |
| Começou o lançamento com 1 founding só | 2 founding em dias alternados: itera de um pro outro |
| Deu acesso ao grupo dentro da micro-oferta | NÃO dá acesso na consultoria, senão mata o upsell/cashback |
| Fabricou escassez/prova pra apressar | Prova é real, coletada por design; escassez só com gatilho real (aumento de preço, demanda represada) |
| Escondeu o valor cheio no Pix de Compromisso | Fala o preço desde o começo; 10% congela, não esconde |
| Escreveu o Lembrei de Você com tom de robô educado | Reescreve na voz do dono, pelo teto que aquele cliente sente |
| Foi conduzir a conversa / responder objeção aqui | Isso é soft-vendas-closer; esta skill entrega a estratégia e aponta |
| Foi desenhar/precificar a mentoria aqui | Isso é soft-plano-ofertas; aqui é COMO/QUANDO lançar, não o desenho do produto |
| Usou um número de exemplo como promessa do dono | Número de exemplo é só formato; o do dono é SLOT `[A CONFIRMAR]` |
| Doc com prosa/meta-narração | Tabelas e listas; corta bastidor e "isto serve para" |

## Handoff
Plano de Jogadas aprovado alimenta: **soft-conteudo-stories** (a sequência de stories da jogada) · **soft-conteudo-headlines** (a chamada da oferta) · **soft-conteudo-carrossel**/**-reels** (o corpo da peça) · **soft-funil-miniwebinar**/**soft-webinar** (o conteúdo da Reunião de R$100 se virar aula/webinar) · **soft-vendas-sdr** (abrir/qualificar/agendar o lead que a jogada gerou) · **soft-vendas-closer** (conduzir e fechar: DM até ~R$3.000, call acima; follow-up de 24h) · **soft-plano-ofertas** (desenhar/precificar a oferta high-ticket que a jogada lança). Posicionamento/PUV pendente → **soft-plano-posicionamento**. Meta do mês / funil reverso → **soft-leon**.

## References (o corpo carrega o método; estas guardam a profundidade dirigida)
- `references/jogadas-de-campanha.md`: as 10 jogadas de campanha, cada uma no formato completo (o que é · quem pode rodar · resultado esperado como SLOT · como funciona passo-a-passo com as falas-âncora · onde encaixa no mês · quem executa · ajuste Soft), o cardápio rápido e os fios que costuram as jogadas. Lida nos P1 e P2.
- `references/lancamento-e-esteira.md`: o lado lançamento da oferta (vender antes com data futura, os 2 founding alternados, o gate de consumo, o teto individual, a micro-oferta como porta e o downsell com cashback, a esteira de 3 públicos e a matemática da meta) + os **funis de entrada de baixa fricção** (tripwire/ganho por lead, grupo de WhatsApp "lead eterno", funil micro-ondas), a camada tática que enche o topo da esteira. Lida no P3.
