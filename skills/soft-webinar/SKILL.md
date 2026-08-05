---
name: soft-webinar
description: "Skill UNIFICADA do webinar Soft: o POP inteiro numa esteira só. Etapas: (1) CONSULTIVA, entende o negócio, pesquisa o mercado, entrevista de 11 blocos (perpétuo vs ao vivo é parâmetro); (2) OFERTA, stack tripartida, bônus-âncora maior que o produto, 15-primeiros em camadas, 2 moedas, soma riscada, garantia, régua de preço por faixa, até 3k checkout e acima call 1:1 com inversão de poder; (3) AULA, roteiro SLIDE A SLIDE (título + objetivo + conteúdo por slide, nunca texto corrido), peso das fases pela consciência do público, passe adversarial, timestamp da oferta; (4) PÁGINAS cadastro/obrigado/checkout; (5) MENSAGENS + máquina de tags por % assistido; (6) CHAT simulado ou moderação ao vivo. Qualquer pessoa usa, sem pré-requisito. Use quando o pedido for webinar, webinário, masterclass, aula que vende, plano, oferta, roteiro, slides, páginas, mensagens ou chat de webinar. NÃO use pra renderizar deck/arte (soft-designer), carta/VSL/landing (soft-funil), venda 1:1 (soft-vendas-closer)."
---

# O webinar inteiro, numa esteira só

Webinar que converte é um SISTEMA: plano consultivo, oferta desenhada, aula que ensina e vende, páginas que enchem a sala, mensagens que trazem de volta, chat que faz a sala existir. Esta skill conduz as 6 etapas num POP único; cada etapa entrega uma peça pronta e alimenta a seguinte.

**SEM PORTEIRO (lei do dono).** Qualquer pessoa usa, em qualquer estágio; nada aqui exige nascer de outro processo. A régua de maturidade é no máximo um **aviso consultivo de 1 linha** ("validar barato antes costuma render mais; dá pra seguir mesmo assim"), NUNCA um bloqueio. **Perpétuo vs ao vivo é PARÂMETRO**, não decisão dramática: pergunta, anota, calibra o que muda (pré-início, link, escassez, chat), segue.

**As 6 leis** (`shared-references/operacao-padrao.md` Seção 0), as duras: (5) **marca `[A CONFIRMAR]`, JAMAIS inventa** número, case, fala ou nome; (6) **tabelas e listas, nunca paredão de prosa**. **Processo:** etapas na ordem (pode entrar no meio se o insumo da anterior já existe), **uma peça por vez, STOP pro OK**, gate da etapa **por dentro** (a tabela nunca sai), saída limpa em `.md`. Anti-IA HARD em tudo: no Code, `python3 scripts/lint_copy.py`; no chat, CTRL+F do travessão e do verbo-freio banido (a família que a régua anti-voz proíbe).

## Etapa 1 · CONSULTIVA (o plano nasce COM o dono)

Traça o plano JUNTO: entende o negócio, herda o Plano de Posicionamento inteiro (inline, nunca ponteiro; furo = `[A CONFIRMAR]` e `soft-plano-posicionamento` crava), e **ajuda com pesquisa de mercado** (WebSearch quando disponível: concorrentes, promessas do nicho, preço praticado, linguagem real do público). Conduz a **ENTREVISTA de 11 blocos** (`entrevista-intake.md`, leia antes de perguntar qualquer coisa): FILTRO (promessa=título, Grande Dominó, desejo/medo nº1) · avatar+CONSCIÊNCIA+formato · autoridade · problema/armadilhas · mecanismo com origem · as contas · módulos · oferta · prova · modelagem · logística. Um bloco por vez, ecoa, confirma. **A resposta de consciência do bloco 2 é a que decide o PESO das fases da aula.**

Fecha montando o **doc-mãe** (Seções 0-9, forma em `montagem-secoes-0-9.md`; regras de intake em `intake-consultivo.md`; arsenal pro especialista que duvida em `arsenal-vantagens-webinar.md`; decisória Carta×MT×Webinar CONSULTIVA em `escolha-carta-mt-webinario.md`). **Modo B** ("meu webinar não converte"): audita sem reescrever do zero, `analise-webinario-existente.md`. **STOP.**

## Etapa 2 · OFERTA (o desenho, antes da encenação)

Abre `oferta-mapa.md` (o índice-mestre) e monta: **stack na TRIPARTIÇÃO** (módulos × cursos-prateleira com preço checável × bônus) · **bônus-âncora MAIOR que o produto** · **15-primeiros em CAMADAS** (turma/15/10, com a REDE) · **2 moedas separadas** (desconto × bônus dos primeiros) · **soma riscada** · **garantia pelo cardápio** · **ancoragem com re-ancoragem progressiva** · **régua de preço por faixa (497/997/1997/2997+)** · **canal: até ~3k fecha no checkout, acima de ~3k fecha na call 1:1 com INVERSÃO DE PODER** (o lead é quem está sendo avaliado). Profundidade: `stack-de-oferta-e-bonus.md` + `desenho-e-empacotamento-da-oferta.md` + `ancoragem-e-fechamento.md`. Gate da etapa: `gate-plano.md`. **STOP.**

## Etapa 3 · AULA (o roteiro slide a slide)

> **CONTRATO DURO DO OUTPUT: a aula sai SLIDE A SLIDE, e cada slide tem exatamente TÍTULO + OBJETIVO (qual beat do arco cumpre) + CONTEÚDO (o que o slide carrega: a lista, o número, a frase, a cena).** Nunca roteiro falado corrido, nunca texto pra ler em voz alta, nunca parágrafo-teleprompter. **Esta skill NÃO renderiza slides** (isso é de outra skill): ela entrega o roteiro slide-a-slide pronto pra QUALQUER renderizador agir em cima. Onde as references falarem em "NOTA/copy falada", leia como material do apresentador/renderizador, fora do contrato desta entrega.

Constrói de trás pra frente a partir da oferta, no arco **atenção → problema (diagnóstico) → solução (mecanismo) → decisão (ação)**, com pré-início obrigatório de prova. **SEM PROPORÇÃO FIXA: o peso de cada fase segue a CONSCIÊNCIA do público cravada na entrevista** (baixa = mais diagnóstico/problema; altíssima = mais solução/mecanismo); a ordem é lei, o fechamento nunca encurta. Fontes na ordem: `estrutura-real-webinar.md` (fonte-da-verdade, INTEIRA) · `arco-adma-e-reguas.md` · `tela-granularidade-e-bloco.md` (1 slide = 1 assunto; conteúdo que ensina, nunca rótulo fino) · `padroes-de-profundidade.md` (**os 12 não-negociáveis**) · Mecanismo na sequência real + objeções nos 4 níveis + Q&A que força decisão: `mecanismo-objecoes-e-qea.md` + `motor-3-viradas.md` + `frameworks-proprietarios.md` + `objection-annihilation.md` · beats e esqueleto: `beats-e-arquetipos.md` + `template-72-slides.md` · oferta encenada: `oferta-stack.md` + `falas-prontas-por-bloco.md` · gravação: `gravacao-energia-ao-vivo.md` + `gravacao-do-perpetuo.md`.

Antes de entregar: **PASSE ADVERSARIAL obrigatório** (`passe-adversarial.md`): o crivo do FILTRO slide a slide + o leigo cético + checklist duro. No fim do doc, **EMITE O TIMESTAMP DA OFERTA** (minuto do roteiro em que o link/carrinho abre + marcos de retenção): é o elo que as Etapas 5 e 6 consomem. Gate: `gate-aula.md`. **STOP.** Handoff do render fino (deck, arte, animação): **soft-designer**; apoio pro renderizador em `geracao-de-slides.md` + `SLIDE-MODELO-SCRIPT.md` + `scripts/deck_gen.py` (marca-neutro: cor/fonte/marca via config do dono, env DECK_*).

## Etapa 4 · PÁGINAS (cadastro · obrigado · checkout)

Uma página por vez, cada uma com UMA função: **Cadastro** captura e qualifica · **Obrigado** faz aparecer (WhatsApp +54% comparecimento; ficha que fecha no WhatsApp) · **Checkout ENXUTO** (cronômetro 5min + 15-primeiros + garantia + provas + bônus, NADA mais; acima de ~3k o CTA vira call 1:1, nunca preço seco). Passos e blocos: `regua-leis-e-contrato.md` (1ª invocação) → `intake-e-extracao.md` (P0/P0.5) → `blocos-das-3-paginas.md` (P1 cadastro · P1.B bio na última dobra · P2 obrigado · P3 checkout) → `principios-e-numeros.md` (P4 princípios · P5 espinha do perpétuo · P6 variante crua wa.me) → gate `gate-linha-a-linha.md` (P7) → mostra e PARA (P8). Bench real: `_PAGINAS-BENCH.md` (marca-neutro: modela a premissa, nunca a paleta). Moldes verbatim: `paginas-cadastro-obrigado-checkout.md`. **STOP por página.**

## Etapa 5 · MENSAGENS + a máquina de tags

Escreve as 3 réguas (WhatsApp primário na Cloud API oficial, e-mail secundário): **ANTES** (cadastro · 24h · 1h · link 5min) · **DURANTE** (2 toques, só WhatsApp) · **PÓS** (resumo · prova · objeção · last call · fechamento · downsell/pergunta de 1 palavra + esteira semanal). Molde de cada peça: `sequencias-email-whatsapp-pre-pos.md`; o que muda por modo: `perpetuo-vs-aovivo.md` + `perpetuo-mecanica.md`.

**A MÁQUINA DE TAGS é DESTA etapa** (nada de skill externa): consome o **timestamp da oferta emitido na Etapa 3**, define os marcos de % assistido (não veio · 0-25 · 25-75 · viu a oferta · ficou até o fim · comprou), cria as tags e o roteamento (quente fecha, morno nutre, frio reconvida, cliente sai de tudo) e entrega o **checklist técnico de subida** no fim. **SEM replay é o padrão** (quem faltou vai pra próxima sessão). Nota consultiva de 1 linha: abrir replay 24-48h é opção consciente, +40% de views a 60-70% da conversão. Lead que responde = quente, vai pro 1:1 (**soft-vendas-closer**). **STOP por régua.**

## Etapa 6 · CHAT (a sala viva)

Consome **o roteiro e o timestamp da oferta da Etapa 3** (o elo fecha aqui: eco↔respaldo, comando↔rajada, compra só DEPOIS do link). **PERPÉTUO:** planilha de import no formato da plataforma (default `username,message,minutes,seconds`; tempo do vídeo = roteiro + offset da sala de espera), regra-mãe "simula a SALA, nunca a PROVA". Spec canônica: `_CHAT-MODELO.md` (INTEIRO antes de gerar); doutrina longa: `simulador-comentarios-ao-vivo.md`. **AO VIVO:** guia de moderação (escada de micro-compromissos, eco nominal, reason-why, perguntas-isca, placar de vendas): `interacao-chat-ao-vivo.md`. Gate do Crivo por dentro (todo comentário é copy que o lead LÊ). **STOP.**

## When NOT to use

Render fino do deck / arte / PNG / paleta → **soft-designer**. Carta / VSL / landing fora do webinar → **soft-funil-carta** / **soft-funil-landing**. Micro-aula / mini-webinar de funil → **soft-funil-miniwebinar**. Posicionamento / nomear método → **soft-plano-posicionamento**. Venda 1:1 / objeção ao vivo / fechamento → **soft-vendas-closer** (prospecção: **soft-vendas-sdr**). Anúncios → **soft-trafego-meta**. Headline isolada → **soft-conteudo-headlines**. Conteúdo de feed → **soft-conteudo-***. "Por onde começo" → **soft-leon**.

## References (mapa por etapa)

- **E1:** `entrevista-intake.md` · `intake-consultivo.md` · `montagem-secoes-0-9.md` · `arsenal-vantagens-webinar.md` · `escolha-carta-mt-webinario.md` · `analise-webinario-existente.md` · `fundamentos-pre-roteiro.md` · `premissas-e-guarda-corpos.md` · `esqueleto-universal-e-discernimento.md`.
- **E2:** `oferta-mapa.md` · `stack-de-oferta-e-bonus.md` · `desenho-e-empacotamento-da-oferta.md` · `ancoragem-e-fechamento.md` · `gate-plano.md` · `exemplos-por-bloco/09-11-12`.
- **E3:** `estrutura-real-webinar.md` · `arco-adma-e-reguas.md` · `tela-granularidade-e-bloco.md` · `padroes-de-profundidade.md` · `passe-adversarial.md` · `mecanismo-objecoes-e-qea.md` · `motor-3-viradas.md` · `frameworks-proprietarios.md` · `objection-annihilation.md` · `beats-e-arquetipos.md` · `template-72-slides.md` · `oferta-stack.md` · `falas-prontas-por-bloco.md` · `estrutura-webinario-aida.md` · `fladlien-modelo.md` · `gravacao-energia-ao-vivo.md` · `gravacao-do-perpetuo.md` · `gate-aula.md` · `exemplos-por-bloco/` (00-14) · apoio ao renderizador: `geracao-de-slides.md` + `SLIDE-MODELO-SCRIPT.md` + `scripts/deck_gen.py`.
- **E4:** `regua-leis-e-contrato.md` · `intake-e-extracao.md` · `blocos-das-3-paginas.md` · `principios-e-numeros.md` · `gate-linha-a-linha.md` · `anti-patterns.md` · `_PAGINAS-BENCH.md` · `paginas-cadastro-obrigado-checkout.md`.
- **E5:** `sequencias-email-whatsapp-pre-pos.md` · `perpetuo-vs-aovivo.md` · `perpetuo-mecanica.md`.
- **E6:** `_CHAT-MODELO.md` · `simulador-comentarios-ao-vivo.md` · `interacao-chat-ao-vivo.md`.
- **Transversais:** `shared-references/` (operação-padrão, crivo/, filtro-anti-ia/, filtro-mobile-first/, adaptação semântica, dicionário conversacional) · `scripts/lint_copy.py`.
