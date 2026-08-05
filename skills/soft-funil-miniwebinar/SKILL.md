---
name: soft-funil-miniwebinar
description: "Fecha o PACOTE do MINI WEBINAR Soft (degrau 1, Funil Soft): o vídeo de ~10min que filtra, instala UMA virada de percepção e move pro 1:1, MAIS os SLIDES (1 ideia por slide, copy na nota) e a PÁGINA DE HOSPEDAGEM RICA (player + provas + bio + FAQ + argumento estilo carta abaixo dele). É a Carta com câmera, arco ADMA comprimido, mecanismo nomeado no centro. Ancora no verbatim real, entrega UMA peça por vez com STOP, gate por dentro (ADMA-micro + 1-ideia-por-slide + página protege-ou-mede + anti-IA). Use pra \"mini webinar\", \"mini-webinar\", \"webinar curto\", \"aula de vendas curta\", \"webinar do funil\", \"mini aula em vídeo\", \"versão em vídeo da carta\", \"slides do mini webinar\", \"deck do mini webinar\", \"página do mini webinar\", \"página de hospedagem do vídeo\". NÃO use pro WEBINÁRIO COMPLETO/perpétuo nem seu DECK ou 3 PÁGINAS (degrau 2: soft-webinar), carta/VSL/landing/isca (soft-funil-*), nem a venda (soft-vendas)."
---

# Mini Webinar, a Carta com câmera

Vídeo de ~10 minutos que faz UMA coisa: filtra quem não é cliente, instala UMA virada de percepção e move quem ficou pro Comercial 1:1. Mesma engenharia da carta, mídia diferente. Não é aula-tutorial nem webinário completo: roda o arco ADMA comprimido, com o mecanismo nomeado no centro. O Webinar Soft completo (degrau 2, com a oferta fechando metade do tempo) é a `soft-webinar`. Aqui é o degrau 1.

**O que esta skill faz por você:** fecha o PACOTE do mini-webinar do funil, três entregáveis encadeados do mesmo trabalho (não viram outra skill): (1) o **roteiro ADMA de 12 blocos** (a micro-aula de ~10 min que aquece e qualifica o lead), (2) os **slides do mini-webinar** que vestem esse roteiro de tela (copy falada na nota, 1 ideia por slide), (3) a **página de hospedagem rica** que emoldura o player E carrega o argumento estilo carta abaixo dele. O roteiro é a espinha; os slides vestem o roteiro de tela; a página emoldura o player e leva provas, bio, FAQ e o argumento dos 7 passos. **Slides e página são opcionais sob demanda:** entram quando o cliente pede, depois do roteiro fechado, dentro do mesmo mini-webinar. Continua a Carta com câmera, só que agora o pacote inteiro do degrau 1.

**As 6 leis (valem antes de tudo):** (1) nunca escreve como se o cliente já soubesse o contexto, zero palavra difícil, cria o contexto antes da afirmação; (2) abre ensinando o que faz; (3) é consultiva, puxa o contexto de você antes de gerar; (4) contexto é rei; (5) **admite se faltar insumo, nunca inventa** (confere se tem o número/case/fala; se falta, admite e pergunta ou marca `[A CONFIRMAR]`, jamais preenche com algo plausível); (6) **doc de output enxuto pros 2 leitores** (o .md de entrega é o mais otimizado possível pro humano que lê E pra IA que recebe como contexto: zero meta-narração, zero bastidor, zero explicação-do-método-pro-leitor; só o insumo denso e os `[A CONFIRMAR]`). (Detalhe em `shared-references/operacao-padrao.md`, Seção 0.)

**Este SKILL.md é o processo inteiro. Siga os passos na ordem, pare nos checkpoints, e rode o gate antes de mostrar qualquer bloco.**

## Output Contract (o que você entrega)
São **3 saídas em sequência** (roteiro → slides → página), cada uma **uma por vez, com STOP e gate por dentro**. Slides (B) e página (C) são opcionais sob demanda; só entram depois do roteiro (A) fechado e aprovado.
- **(A) ROTEIRO por FASE ADMA:** um roteiro de Mini Webinar de **9 a 11 minutos**, em **12 blocos** dentro das 4 fases ADMA, com timestamps. Entregue **uma FASE por vez** (Atenção → Diagnóstico → Mecanismo → Ação), nunca o roteiro inteiro de uma vez.
- **(B) DECK por FASE ADMA** (Passo 6, sob demanda): por slide, o **arquétipo** + o **reforço visível** (1 frase OU 1 número OU 1 imagem-conceito) + a **copy falada na NOTA**. Entregue por fase, nunca o deck inteiro de uma vez.
- **(C) PÁGINA bloco a bloco** (Passo 7, sob demanda): player + provas + bio na última dobra + FAQ + o argumento-carta de 7 passos abaixo do player, na ordem dos blocos. Entregue bloco a bloco, nunca a página inteira de uma vez.
- O gate roda **por dentro** (auditoria silenciosa); a tabela NÃO vai pra saída. Cada peça/fase mostrada sai LIMPA (como no Claude Chat), sem tabela e sem meta, antes de seguir pra próxima.
- Você **para e espera o OK** depois de cada fase/peça.
- Você **nunca inventa fala nem número do cliente** e **nunca mostra peça que falhou no gate**.
- **RE-GATE ao condensar:** o texto de TELA de cada slide e os blocos NOVOS de copy da página são condensações novas que o lead LÊ (não a fala original do roteiro). Elas re-passam pelo gate antes de exportar, do mesmo jeito que o roteiro passou.

## Passo 0, ancora antes de escrever (NÃO PULE)
Procura a fonte de fala real do cliente, nesta ordem: **descrição do projeto** → **Plano colado na conversa** → **mensagens anteriores**. Puxa **3-5 falas de DOR + 3-5 de DESEJO** do tema, literais, contando o N (quantas vezes apareceu). A primeira linha da Atenção e a dor do Diagnóstico nascem delas, quase intactas.

Três estados de entrada (declara qual é o seu antes de escrever):
- **Tem fala real (com N):** ancora nela e cita o N. Caminho ideal.
- **Tem Plano/fundação mas ZERO fala literal:** NÃO inventa fala nem N. Ancora em **prova real do autor** (resultado, case, mecanismo); qualquer número não confirmado entra como `[DADO: confirmar]` e **NÃO conta como Ancorado=✓**. Avisa: minerar 5-8 falas reais (ou rodar o Plano na soft-posicionamento) deixa o roteiro muito mais cravado.
- **Sem nada:** pergunta numa única mensagem as 6 entradas do briefing (cliente ideal · problema avançado · soluções comuns que falham · método nomeado · cases/prova · oferta) e segue daí.

A fundação (quando existe, do Plano): tese central · mecanismo nomeado · top inimigos nominais · cliente em uma frase · oferta com PUV.

**Antes de quebrar nos 12 blocos, produz a versão-mestre dos 7 passos do Discurso Base** (`references/discurso-base-7-passos.md`): a narrativa de venda em texto corrido neutro (Gancho · Diagnóstico sem culpa · por que as soluções comuns falham · Método nomeado · Prova específica · objeções · Oferta+CTA). É o andaime que alimenta os 12 blocos, cada passo do Discurso Base se distribui nas 4 fases ADMA conforme o mapeamento da `references/modo-mini-webinar.md`. Sem essa espinha, os 12 blocos saem soltos e o vídeo perde a costura.

## Passo 1, confirma 2 perguntas de oferta (antes de escrever)
Numa mensagem só, confirma com o cliente:
- **Oferta secundária estruturada** (programa pra implementador, certificação, coprodução)? Se sim, entra no Bloco D.6. Se não, omite.
- **Garantia**? Se sim, entra em 1 frase no Bloco da Ação. Se não, omite.

Não force nenhuma das duas. Ausência some, não vira recheio.

## Passo 2, escreve a fase ATENÇÃO (0:00-1:30) e PARA
Função: prende quem é avatar e expulsa quem não é, em 90 segundos.
- **A.1 Promessa direta + filtragem (45-60s):** promessa quantificada em 1 frase + lista de 5+ perfis específicos do nicho. Abre amplo, nicha do meio pro fim.
- **A.2 Prova social ancorada (30s):** aponta pra prova externa visível (depoimentos, prints), "pode pausar e olhar agora". Prova ANTES do problema antecipa autoridade.

Roda o gate por dentro. Entrega SÓ a fase LIMPA (como no Claude Chat), sem tabela e sem meta. PARA e espera o OK.

## Passo 3, escreve a fase DIAGNÓSTICO (1:30-3:00) e PARA
Função: amplifica a dor, tira a culpa do lead, nomeia o inimigo (que nunca é o próprio lead).
- **I.1 Problema geral (45-60s):** dor óbvia do nicho em 2ª pessoa, 3-4 sintomas concretos, e "mesmo assim [resultado insuficiente]". Quanto mais específico o sintoma, mais o lead pensa "é isso".
- **I.2 Problema avançado (30-45s, opcional):** só se o cliente tem problema avançado nomeado no Plano. "O problema não é [culpa aparente]. É que [soluções comuns] adicionaram complexidade." Nomeia o vilão, tira culpa, joga a raiva pra fora.

Roda o gate por dentro. Entrega SÓ a fase LIMPA (como no Claude Chat), sem tabela e sem meta. PARA e espera o OK.

## Passo 4, escreve a fase MECANISMO (3:00-9:00), o coração, e PARA
Função: instala a crença única, entrega o **mecanismo nomeado**, prova, faz querer. É 60% do vídeo. Sem o mecanismo nomeado no centro, não é Mini Webinar, é palestra.
- **D.1 Promessa expandida + método nomeado + projeção (3:00-4:30):** resultado primário + 2 amplificadores, **diz o nome do método**, camada opcional de "sem" como filtro, projeta o estado desejado.
- **D.2 Mecanismo demonstrado (4:30-6:00):** compromisso pessoal + as 3 peças nomeadas + jornada do lead dentro do método + peça de redenção pra quem já tentou + grau de automação.
- **D.3 Demonstração prática (6:00-6:30):** passo a passo do trabalho DO CLIENTE em 2ª pessoa ("você vai..."), com tempo de execução. Reduz abstração.
- **D.4 Prova + estado final (6:30-7:30):** número agregado + variedade de ofertas vendidas pelo método + onde ver + rotina simplificada pós-método.
- **D.5 Validação + métrica + insight (7:30-8:30):** ancora em categoria em alta + métrica de saúde concreta + 1 insight que filtra o lead inteligente.
- **D.6 Amplitude dupla + oferta secundária opcional (8:30-9:00):** benefício pra quem já fatura + pra quem não fatura + (só se confirmado no Passo 1) a porta do implementador.

Roda o gate por dentro. Entrega SÓ a fase LIMPA (como no Claude Chat), sem tabela e sem meta. PARA e espera o OK.

## Passo 5, escreve a fase AÇÃO (9:00-10:00) e PARA
Função: move pro Comercial 1:1 sem empurrar venda. No degrau 1 a Ação é LEVE: convida pra conversa, não fecha no checkout (fechar no checkout é degrau 2/3).
- **A.1 2 caminhos + prazo + garantia opcional (9:00-9:30):** caminho 1 sozinho (com pré-requisito honesto) · caminho 2 comigo (com ressalva humanizadora + prazo de implantação, não de resultado) · garantia em 1 frase se confirmada.
- **A.2 CTA + fechamento afetivo (9:30-10:00):** ação CTA específica e de baixa fricção com **destino claro** (palavra no Direct OU link), "não é compra, é conversa", compromisso pessoal repetido, despedida curta.

Roda o gate por dentro. Entrega SÓ a fase LIMPA (como no Claude Chat), sem tabela e sem meta. PARA e espera a escolha. Com o roteiro fechado, oferece o menu de continuação: **"Roteiro fechado. Quer que eu monte os SLIDES (Passo 6) e/ou a PÁGINA RICA (Passo 7)? Os dois são parte do mesmo mini-webinar."** Não despeja os dois sem pedido; cada um entra sob demanda, depois do roteiro aprovado.

## Passo 6, MODO SLIDES (veste o roteiro de tela, sob demanda)
Entra DEPOIS do roteiro fechado e aprovado, quando o cliente pede o deck. **Pré-requisito-lei:** o roteiro ADMA das 4 fases já está OK. Sem roteiro fechado, PARA e fecha o roteiro primeiro (não inventa fala de palco). **Lê `references/geracao-slides-miniwebinar.md` antes de montar o primeiro slide.**

- **Projeta os 12 blocos nos beats do deck, na ordem-lei.** Não reordena os blocos; pode **expandir** um bloco em mais de um slide quando a fala pede respiro. A ordem das fases é a mesma do roteiro (Atenção → Diagnóstico → Mecanismo → Ação).
- **REGRA DE OURO (a espinha do deck):** a copy falada mora na NOTA; a tela recebe só o reforço (1 frase OU 1 número OU 1 imagem-conceito). **Pergunta-teste por slide:** "dá pra narrar lendo só a tela?" Se sim, está errado, joga o texto pra nota.
- **Arquétipo pela função do beat:** respiro (tela preta, 1 frase) em toda virada de fase · capa/big-idea na abertura · número-gigante só com número real · dicotomia semafórica (vermelho=medo primeiro, verde=desejo) · storytelling-de-dor (1 cena por slide) · reveal progressivo SIMPLES do mecanismo (peça a peça) · manifesto-tese · CTA com destino. A ref traz o catálogo enxuto com molde e exemplo de nicho fictício.
- **CALIBRAGEM MINI:** deck ENXUTO de **~12 a 20 slides** (não 72), porque o mini-webinar é ~10 min e degrau 1. **Sem a maquinaria de stack/preço de oferta** (a Ação CONVIDA pro 1:1, não fecha no checkout). Persegue o RITMO (respiro preto em toda virada), não uma contagem-alvo. Reserva a zona da câmera na nota. Tela legível no celular.
- **Dois caminhos de saída:** no Claude **Code**, monta o array JSON no schema do `deck_gen.py` (campo `nota` = copy falada) e gera o `.pptx`; no Claude **Chat**, descreve slide a slide com o ID visual e gera o PDF direto. Mesmo deck conceitual, só muda o motor de render.

Entrega o deck POR FASE, roda o gate por dentro (com o RE-GATE da copy de tela), PARA e espera o OK antes da próxima fase.

## Passo 7, MODO PÁGINA RICA (emoldura o player E carrega o argumento, sob demanda)
Entra quando o cliente pede a página de hospedagem do mini-webinar. **Lê `references/pagina-hospedagem-rica.md` antes de montar o primeiro bloco.** A régua-mãe governa: cada bloco **protege a atenção OU protege a venda OU mede**; se não faz nenhuma das três, corta. Mobile-first é a régua, o player nunca é Vimeo (sem preview/CDN ruim no mobile), o CTA fica sempre ABAIXO do player.

**Ordem dos blocos da página:**
1. **Headline:** espelho da Promessa direta do Bloco A.1 do roteiro.
2. **Subheadline:** o "sem" ou o filtro de avatar, em 1 linha.
3. **Pra-quem-é:** 4 a 6 perfis específicos, a mesma filtragem do Bloco A.1.
4. **PLAYER do mini-webinar:** centro da página, CTA logo ABAIXO (nunca acima), thumbnail com rosto, sem autoplay no mobile.
5. **ARGUMENTO ESTILO CARTA** abaixo do player: os 7 passos do Discurso Base já existente, condensados (gancho → diagnóstico sem culpa → por que as soluções comuns falham → método nomeado como arquitetura → prova específica → 3 objeções universais → CTA único). Faca Soft: resultado e função, nunca o passo a passo executável.
6. **PROVAS SOCIAIS:** muitas, na moeda da promessa (nome + nicho + número + prazo), prints, documento bruto vale mais que slide bonito.
7. **FAQ:** mata as objeções reais do avatar, tom de conversa, sem urgência fabricada (a página é evergreen, nada de timer que reseta).
8. **BIO/AUTORIDADE detalhada na ÚLTIMA dobra:** empatia/cicatriz ANTES do feito, número com ressalva honesta, anti-milagre no fecho (molde de 5 parágrafos, foto P&B). Nunca o currículo no topo.
9. **CTA final único** com destino concreto: "conversa, não compra" (palavra no Direct OU link).

**Decisão de negócio pelo ticket:** ticket ≤~3k pode levar pro checkout/link; high-ticket fecha no 1:1 (botão `wa.me`, nunca o preço seco na página).

Entrega a página bloco a bloco, limpa, roda o gate por dentro (com o RE-GATE dos blocos novos de copy), PARA e espera o OK.

## O GATE (roda por DENTRO, por FASE e por PEÇA)
Roda o gate por DENTRO de cada fase (auditoria silenciosa, NÃO imprime). Só fase com VEREDITO=PASSA vai pro cliente. Um ✗ refaz **só a peça/fase que falhou**, não o pacote inteiro. A tabela abaixo é o teu checklist INTERNO, nunca a saída: o cliente recebe só a fase limpa. No chat (sem o lint) faz um CTRL+F manual de "—" e da família "travar". Os checks do roteiro valem sempre; os marcados **(modo SLIDES)** só ativam no Passo 6 e os **(modo PÁGINA)** só no Passo 7.

| Check | Passa se | ✓/✗ |
|---|---|---|
| **Ancorado** | a dor/promessa nasce de fala literal da fonte (cita N **real**) OU de prova real do autor; **N inventado/plausível = ✗ automático** | |
| **ADMA-micro** | a fase cumpre SÓ a função dela e cabe no tempo; nenhuma fase rouba a função de outra; Atenção filtra, Diagnóstico dói, Mecanismo prova, Ação move | |
| **Mecanismo é o coração** | o **nome do método** aparece e ocupa o centro (60% do vídeo é Mecanismo); a peça vende uma virada de percepção, não ensina um tutorial executável | |
| **Degrau 1, não degrau 2** | é o Mini Webinar ~10min do Funil Soft; a Ação CONVIDA pro 1:1, NÃO fecha no checkout nem vira o Webinar Soft completo (isso é soft-webinar) | |
| **Uma virada, não aula** | o lead sai com UMA percepção nova, não com um passo a passo que dispensa o cliente (faca Soft: resultado e função, não receita) | |
| **C/U/B** | não é **C**onfuso (uma ideia por frase) · não é **U**nbelievable/inacreditável (prova sustenta) · não é **B**oring (zero padding, zero motivacional) | |
| **Harry, dá pra ver?** | fecha o olho e enxerga a cena. ✗ "tenha mais clareza" · ✓ "a recepcionista diz: semana que vem enche" | |
| **Harry, dá pra falsificar?** | é fato falsificável, não adjetivo bonito | |
| **Harry, só você diz?** | o concorrente direto não assina igual (cena/mecanismo proprietário, não promessa banal do nicho) | |
| **CTA com destino** | a Ação tem destino concreto (palavra no Direct OU link nomeado) e é "conversa, não compra" | |
| **Anti-IA (HARD)** | zero travessão "—" · zero "travar/travado/destravar" (exceção: aspa literal do cliente) · sem frase-emoldura ("a verdade é", "o segredo") · sem verbo-clichê ("revoluciona, destrava, transforma") · zero advérbio gratuito (realmente, basicamente, obviamente) · zero hedge (talvez, pode ser, em geral) · zero auto-elogio (Especialista experiente, 10 anos de mercado) · zero paráfrase (não repete a ideia em outras palavras) · zero transição mole (além disso, vale ressaltar, em outras palavras). As 7 categorias de corte detalhadas em `references/tom-e-ritmo-desejo.md`. **CTRL+F manual de "—" e "travar" antes de marcar ✓.** | |
| **(modo SLIDES) 1 ideia por slide** | passa a pergunta-teste (não dá pra narrar lendo só a tela); a copy falada está na nota, a tela tem só o reforço | |
| **(modo SLIDES) Densidade baixa** | framework SIMPLES, sem mega-diagrama de consultoria; só o slide de prova pode ser denso | |
| **(modo SLIDES) Respiro em toda virada** | tela preta com 1 frase em cada virada de fase; persegue o ritmo, não a contagem | |
| **(modo SLIDES) Deck mini, não webinar completo** | sem stack/preço de oferta; ~12 a 20 slides; a Ação convida pro 1:1, não fecha no checkout | |
| **(modo SLIDES) Número-gigante só real** | o número que vira manchete é dado real do cliente; inventado/plausível = ✗ automático | |
| **(modo PÁGINA) Cada bloco protege ou mede** | cada bloco protege a atenção OU protege a venda OU mede; enfeite que não faz nenhuma das três é cortado | |
| **(modo PÁGINA) CTA abaixo do player** | o CTA fica ABAIXO do player, nunca acima; mobile-first; player nunca Vimeo | |
| **(modo PÁGINA) Bio na última dobra** | bio detalhada na última dobra, empatia/cicatriz ANTES do feito, nunca o currículo no topo | |
| **(modo PÁGINA) Provas na moeda da promessa** | provas trazem nome + nicho + número + prazo na moeda do que foi prometido; documento bruto vale mais que slide bonito | |
| **(modo PÁGINA) FAQ mata objeção real, sem urgência fake** | o FAQ responde as objeções reais do avatar; zero timer/escassez fabricada numa página evergreen | |
| **(modo PÁGINA) Argumento-carta sem o COMO** | o argumento dos 7 passos vende a virada, não entrega o passo a passo executável (faca Soft: resultado e função) | |
| **VEREDITO** | **= o PIOR item acima.** Um ✗ qualquer = REFAZ só a peça/fase que falhou. Só tudo-✓ = PASSA e vai pro cliente. | |

## When NOT to use (manda pra skill certa)
- Pediu **webinário completo / perpétuo / evergreen** (degrau 2, a oferta fecha metade do tempo) → **soft-webinar**.
- Pediu o **DECK de um WEBINÁRIO COMPLETO/perpétuo** (com stack/preço, 50+ slides) → **soft-webinar** (degrau 2). Aqui é só o deck ENXUTO do mini-webinar (~12 a 20 slides, sem maquinaria de oferta).
- Pediu as **3 PÁGINAS do webinar completo** (cadastro/obrigado/checkout, ficha wizard, automação de comparecimento) → **soft-webinar**. Aqui é UMA página de hospedagem do mini-webinar do funil.
- Pediu **lançamento pago / carrinho / evento com tráfego** (degrau 3) → **soft-lancamento-pago**.
- Pediu **carta / VSL / landing / isca** → **soft-funil-carta · soft-funil-landing · soft-funil-isca**.
- Pediu **headline isolada** → **soft-conteudo-headlines**. Pediu **conteúdo de feed** → **soft-conteudo** (e variantes).
- Pediu **a venda em si** (script, objeção, fechamento) → **soft-vendas** (e variantes).
- Pediu **arte/visual** → **soft-designer**. Pediu **posicionamento/Plano** → **soft-posicionamento**.

## Anti-Patterns (sintoma → correção)
| Sintoma | Correção |
|---|---|
| Despejou o roteiro inteiro de uma vez | Volta: uma FASE por vez, com gate, e PARA pra o OK |
| Virou aula-tutorial (passo a passo executável) | Faca Soft: mostra resultado e função, entrega UMA virada, não a receita |
| O mecanismo não tem nome ou é coadjuvante | Nomeia o método e põe no centro; Mecanismo é 60% do vídeo |
| A Ação fechou no checkout | Degrau 1 CONVIDA pro 1:1; "conversa, não compra"; checkout é degrau 2/3 |
| Inventou número/fala "plausível" | Só dado REAL; sem fonte, marca `[DADO: confirmar]` e não conta como Ancorado=✓ |
| Inimigo virou o próprio lead | Tira a culpa do lead, joga a raiva pra fora (soluções comuns que o mercado vendeu) |
| Oferta secundária ou garantia forçada | Só entra se confirmada no Passo 1; ausência some, não vira recheio |
| Narrou o fluxo ("agora vou escrever a Atenção") | Não narra: executa em silêncio e entrega só a fase limpa |
| Imprimiu a tabela do gate na saída | O gate é INTERNO (auditoria silenciosa); a saída é só a peça limpa |
| Pôs o parágrafo da fala na tela do slide | Joga pra nota; na tela só o reforço (1 ideia) |
| Montou slides sem roteiro fechado | PARA, fecha o roteiro primeiro; o deck nasce do script, nunca do zero |
| Deck inflado com stack/preço de oferta | É mini-webinar degrau 1, sem maquinaria de venda; a Ação convida pro 1:1 |
| Mega-diagrama no mecanismo | Reveal SIMPLES peça a peça; densidade baixa (ilusão de simplicidade) |
| Página virou vitrine pelada, sem argumento | A página rica leva provas + bio + FAQ + argumento-carta abaixo do player |
| Argumento-carta entregou o passo a passo executável | Faca Soft: resultado e função, nunca a receita |
| CTA acima do player | CTA sempre ABAIXO do player |
| Bio no topo da página | Última dobra, empatia/cicatriz ANTES do feito |
| Urgência fabricada em página evergreen | Fecha com convicção, sem timer que reseta |

## Gate de saída obrigatório, o Crivo (bloqueante)
O gate-checklist acima é o Crivo embutido. Ele puxa de `shared-references/crivo/`: ancoragem no verbatim real (`01-entrada-verbatim.md`) → simulação na pele do avatar (`02-simulacao-cliente.md`, o teste dos 2 segundos: onde ele larga, onde se reconhece) → gate C/U/B + 3 perguntas do Harry (`03-gate-cub.md`). O anti-IA limpa o robô; o Crivo dá a força. Os dois, nessa ordem. O Crivo roda por dentro (auditoria silenciosa); a tabela NÃO vai pra saída, a peça entregue sai limpa.

## References (o corpo acima é autossuficiente; cada ref tem hora de ler)
- `references/discurso-base-7-passos.md`: **lê no Passo 0**, antes de quebrar nos 12 blocos. Define os 7 passos (objetivo · conteúdo · tom · erros · exemplo de cada), as 3 objeções universais (adequação · execução · comparação), os anti-padrões e o template da versão-mestre neutra. É o andaime que alimenta os 12 blocos.
- `references/tom-e-ritmo-desejo.md`: **lê quando roda o gate anti-IA** (item Anti-IA). Traz as 7 categorias de corte (advérbio gratuito · transição mole · frase de respiro · adjetivo decorativo · paráfrase · hedge · auto-elogio), a tabela tom falado × escrito e os anti-padrões de tom. Vídeo tem tom falado: as regras de ritmo de LEITURA não valem aqui (a nota de escopo no topo da ref explica).
- `references/conducao-na-pratica.md`: **lê antes de fechar o roteiro**, pra checar congruência, o vídeo repete a MESMA tese e o MESMO mecanismo do feed e da carta, na mesma voz (lead incongruente esfria). Traz os reframes "vender sem call é posicionamento, não funil" e "se o funil está difícil, falta Plano".
- `references/modo-mini-webinar.md`: os 12 blocos detalhados com modelo + exemplo por bloco, mapeamento do Discurso Base, métricas e diagnóstico por sintoma. **Também traz as indicações técnicas de gravação (câmera · áudio · B-roll), o checklist antes de gravar e as 5 camadas de revisão**, consulta antes de fechar e mandar gravar. É o mesmo processo acima, com mais exemplo, não um segundo sistema.
- `references/geracao-slides-miniwebinar.md`: **lê no Passo 6** (modo SLIDES), antes de montar o primeiro slide. Ensina a vestir o roteiro de 12 blocos com tela comprimida pro mini-webinar: princípio copy-na-nota, o mapa dos 12 blocos pras faixas de slide, o catálogo enxuto de arquétipos (com molde + exemplo de nicho fictício), a calibragem mini (~12 a 20 slides, sem stack/preço), os dois caminhos de saída (JSON do `deck_gen.py` no Code, PDF no Chat) e o re-gate da copy de tela.
- `references/pagina-hospedagem-rica.md`: **lê no Passo 7** (modo PÁGINA), antes de montar o primeiro bloco. Traz a régua-mãe (protege ou mede), a ordem dos blocos com molde de cada (headline → subheadline → pra-quem-é → player → argumento-carta de 7 passos → provas → FAQ → bio na última dobra → CTA), a decisão de negócio pelo ticket, o que NÃO entra (urgência fake, currículo no topo, pop-up) e por que a página rica substitui a vitrine antiga.
- `scripts/lint_copy.py`: no Claude Code, roda `python3 scripts/lint_copy.py` no roteiro, na copy de tela dos slides e nos blocos da página como cinto extra do anti-IA (reprova em-dash e "travar"). No chat não roda, por isso o CTRL+F manual do gate.
