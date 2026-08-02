# Geração de slides do Mini Webinar, vestir o roteiro de 12 blocos com tela

Esta reference é a profundidade do **MODO SLIDES (Passo 6 do SKILL.md)**. Ela ensina a pegar o roteiro APSD de 12 blocos já fechado e **vesti-lo de tela**, comprimido pro mini-webinar de ~10 min. O deck não é o conteúdo; é o amplificador visual de uma fala que já funciona. A fala constrói a crença, o slide só devolve o olho pra voz e ancora 1 ideia.

> **Pré-requisito-lei.** O roteiro das 4 fases tem que estar fechado e aprovado. Se não tem, PARA e fecha o roteiro primeiro (volta pro corpo do SKILL.md, Passos 2 a 5). O deck nasce do script, nunca do zero. Sem roteiro, montar slides é alucinar fala de palco.

> **Marca-neutra.** Todos os exemplos de slide aqui são de **nicho FICTÍCIO** (um estúdio de cerâmica, um nutricionista de corredores, uma escola de violão online). O slot do nome do método, dos bordões e dos polos da dicotomia fica marcado `(a definir com o usuário)`, nunca inventado nem decalcado de outra marca. Os números são ilustrativos e marcados como tal; número de verdade só sai do que o cliente confirmou.

> **Modela na irmã do degrau 2.** A engenharia vem da `soft-webinar-slides` e da ref `geracao-de-slides.md` do webinário completo. A diferença é a ESCALA: aqui o deck é enxuto (~12 a 20 slides, não 72) e SEM a maquinaria de oferta (stack/preço/queda riscada), porque o mini-webinar é degrau 1 e a Ação convida pro 1:1, não fecha no checkout.

---

## Índice

- 0. PRINCÍPIO-MÃE, copy na nota (o slide serve a fala)
- 1. MAPA dos 12 blocos APSD pras faixas de slide
- 2. CATÁLOGO ENXUTO de arquétipos (molde + slide instanciado em nicho fictício)
- 3. CALIBRAGEM MINI (deck de ~12 a 20 slides, sem stack/preço)
- 4. DOIS CAMINHOS DE SAÍDA (Code via deck_gen.py, Chat via PDF)
- 5. RE-GATE ao condensar + checklist do mini-deck

---

## 0. PRINCÍPIO-MÃE, copy na nota (o slide serve a fala)

A ordem de produção é fixa e não inverte:

1. O **roteiro já está pronto** (saída das 4 fases APSD).
2. Pega a **copy falada** de cada bloco e cola **na NOTA** (campo `nota` do JSON / Speaker Notes), invisível pra quem assiste.
3. **Só depois** cria o conteúdo visível do slide: o reforço (1 frase OU 1 número OU 1 imagem-conceito).
4. A tela recebe **só o reforço**. O parágrafo falado mora na nota.

**Por que (a premissa).** A atenção é canal único e ler vence ouvir. Um parágrafo na tela rouba a pessoa da voz que constrói a crença: ela lê em 3 segundos, conclui antes de você terminar a fala, a curiosidade satura e ela some. Tela com 1 reforço devolve o olho pra voz e funciona como dupla codificação (vê e ouve a mesma ideia).

**Pergunta-teste por slide:** "dá pra narrar este slide lendo só o que está na tela?" Se **sim, está errado** (é um slide que se lê). Joga o texto pra nota; na tela fica só o reforço.

**Ordem de montagem (nunca o contrário):** primeiro cola a fala do bloco na nota; depois, com a fala já lá, pergunta "o que mostro em cima que ajuda a pessoa a entender isso?" e constrói o visual. Copy primeiro, visual depois.

### EXEMPLO, slide RUIM × slide BOM (nicho fictício: estúdio de cerâmica)

O Bloco I.1 (Diagnóstico) do roteiro fala: *"você abre o ateliê, posta a peça nova, responde curioso no direct, e no fim do mês vendeu três vasos pra três amigas e ninguém mais. O movimento existe, a venda não."*

- **❌ Slide RUIM (teleprompter público):** a tela mostra o parágrafo inteiro digitado, *"Você abre o ateliê, posta a peça nova, responde curioso no direct, e no fim do mês vendeu três vasos pra três amigas e ninguém mais. O movimento existe, a venda não."* A pessoa lê em 3 segundos, conclui antes da fala, e a voz vira eco do que ela já leu.
- **✅ Slide BOM (reforço único):** fundo preto, uma frase só na tela, **"Movimento existe. Venda não."**. O parágrafo inteiro mora na `nota`. O olho não tem o que ler além do gancho; volta pra voz, onde a dor está sendo amplificada.

> **Calibrar densidade pela função do beat.** Slide de EMOÇÃO/virada (respiro, dor, dicotomia) tem tela quase vazia, 1 ideia. Slide de PROVA/referência (depoimento, print) pode ser denso, porque ali a densidade É a mensagem (o documento é a prova).

> **A ferramenta é o motor, nunca a bandeira.** Se o método do cliente usa alguma ferramenta (um app de agendamento, uma planilha, uma automação), ela aparece como alavanca subordinada dentro do ensino, nunca no título nem na tese. Título e big-idea = a transformação do avatar do cliente, não a tecnologia.

---

## 1. MAPA dos 12 blocos APSD pras faixas de slide

O deck é um APSD visualizado. Cada bloco do roteiro vira uma faixa de slides com arquétipos característicos. A ordem é lei: cada slide deixa a pessoa num estado que é pré-condição do próximo. Pode **expandir** um bloco em mais slides quando a fala pede respiro; **não pode suprimir nem reordenar**.

| Fase APSD | Blocos do roteiro | Faixa de slides (arquétipos) |
|---|---|---|
| **ATENÇÃO (0:00 a 1:30)** | A.1 Promessa + filtragem · A.2 Prova social ancorada | capa/big-idea → respiro → prova social ancorada (número-gigante OU depoimento empilhado) → respiro |
| **DIAGNÓSTICO (1:30 a 3:00)** | I.1 Problema geral · I.2 Problema avançado (opcional) | storytelling-de-dor (1 cena por slide) → manifesto-tese do inimigo nomeado → respiro-chave (a virada) |
| **MECANISMO (3:00 a 9:00), 60%** | D.1 a D.6 | reveal progressivo SIMPLES do método nomeado (peça a peça) → demo subordinada (se houver ferramenta) → prova/número-gigante real → manifesto-tese (o bordão) → respiros entre as viradas |
| **AÇÃO (9:00 a 10:00)** | A.1 2 caminhos · A.2 CTA + fechamento | dicotomia semafórica (2 caminhos: sozinho × comigo, medo primeiro) → CTA com destino |

**Leitura do mapa (nicho fictício: nutricionista de corredores amadores):**
- A faixa de ATENÇÃO abre com a capa *"Correr mais sem o joelho cobrar a conta"* (a transformação do avatar), respira, e mostra a prova social ancorada ("tem 40 relatos de corredores aqui embaixo, pode pausar e olhar").
- A faixa de DIAGNÓSTICO entra na dor: 1 cena por slide do corredor que treina forte, come "limpo" e mesmo assim empaca no mesmo tempo de prova; fecha com o respiro que vira a chave, *"O problema não é vontade."*.
- A faixa de MECANISMO é o coração: revela o método `(nome a definir com o usuário)` peça a peça (3 peças), mostra a prova real (quando existe) como número-gigante, e crava o bordão-tese.
- A faixa de AÇÃO põe os 2 caminhos lado a lado (sozinho × com acompanhamento) com cor semafórica e fecha no CTA com destino.

> **Primeiro o vácuo, depois o método.** Nunca ensina antes de criar a dor. A faixa de Diagnóstico abre o vazio que o Mecanismo vai preencher.

---

## 2. CATÁLOGO ENXUTO de arquétipos (molde + slide instanciado em nicho fictício)

São os arquétipos que o degrau 1 usa. É um **subset** dos 18 do webinário completo: cortamos os de oferta/stack/queda/ancoragem (Arquétipos 13 a 18 de stack/preço), porque o mini-webinar não fecha venda na tela. Cada arquétipo abaixo traz: **o quê/função · molde · slide INSTANCIADO em nicho fictício · leitura Soft**.

### Arquétipo A, RESPIRO (tela preta, 1 frase)
- **Função:** reset de atenção em toda virada de fase e em todo pico. O slide mais frequente e mais barato do deck.
- **Molde:** fundo preto, uma frase branca grande centralizada, zero ruído. Render `frase`/`secao`.
- **Slide instanciado (nicho: escola de violão online):** na virada Diagnóstico → Mecanismo, tela preta, só **"E se o problema for a ordem que você aprende?"**. A explicação inteira mora na nota.
- **Leitura Soft:** use em TODA virada de fase. Funciona em qualquer nicho sem adaptar, só troca a frase. É o que dá ritmo ao deck mini.

### Arquétipo B, CAPA / BIG-IDEA (título-promessa)
- **Função:** responde em ~3 segundos a pergunta "isto é sobre mim e sobre o que eu quero?". Abre a aula.
- **Molde:** título-promessa em display pesado + subtítulo + imagem que planta o subtexto da tese. Render `capa`.
- **Slide instanciado (nicho: estúdio de cerâmica):** título **"Viver da cerâmica sem virar loja de feira"** + sub *"o caminho pra vender peça autoral pelo valor que ela vale"*, foto de uma peça única bem iluminada.
- **Leitura Soft:** a big-idea é a transformação do avatar `(a definir com o usuário)`, nunca a ferramenta nem uma frase fixa decalcada. A promessa grande vai aqui, com imagem.

### Arquétipo C, PROVA SOCIAL ANCORADA / NÚMERO-GIGANTE (a manchete numérica)
- **Função:** baixa o ceticismo antes do ensino. O número vira a manchete; o texto vira legenda.
- **Molde:** número gigante (display) + legenda embaixo + fonte/lastro. Render `prova` (`numero` = o gigante, `fonte` = a prova).
- **Slide instanciado (nicho: nutricionista de corredores):** **"3min42"** como manchete, legenda *"o quanto a corredora `(nome a definir)` tirou da prova de 10km em 8 semanas"*, fonte *"print do relógio dela, na página"*. Número ILUSTRATIVO; o real só entra confirmado.
- **Leitura Soft:** só número REAL do cliente. Sem prova de escala, usa prova de profundidade (1 caso detalhado). Número inventado ou plausível derruba a aula inteira na primeira pessoa que questiona.

### Arquétipo D, DICOTOMIA SEMAFÓRICA (2 caminhos, medo primeiro)
- **Função:** cria a tensão de identidade que segura até a Ação. Ninguém escolhe ser "o outro tipo".
- **Molde:** divisão "2 caminhos" com cor semafórica, vermelho (medo/perda) à esquerda, verde (desejo/segurança) à direita. **Medo primeiro** (perder dói mais que ganhar agrada). Render `conteudo` (revelar item a item).
- **Slide instanciado (nicho: escola de violão online):** na fase Ação, dois caminhos, **vermelho** *"Sozinho: mais um curso na pasta de downloads, parado no acorde de Fá"* × **verde** *"Comigo: tocando a primeira música inteira em 30 dias, com correção"*.
- **Leitura Soft:** o eixo de transformação do avatar já é uma dicotomia pronta, use o semáforo. A encruzilhada "sozinho × comigo" é o slide-charneira da transição pra Ação. Polos `(a definir com o usuário)`.

### Arquétipo E, STORYTELLING DE DOR / UM DIA NA SUA VIDA (2ª pessoa, 1 cena por slide)
- **Função:** fazer sentir a dor, não ouvir sobre ela. A 2ª pessoa põe a pessoa dentro da cena.
- **Molde:** narrativa em 2ª pessoa quebrada em UMA cena por slide, cada cena 1 foto + 1 micro-dor, escalando até o clímax. Render `conteudo`/`frase` em sequência rápida.
- **Slide instanciado (nicho: estúdio de cerâmica):** s.1 foto do ateliê de manhã, na tela **"7h da manhã, você já está no torno."** · s.2 foto do post no celular, **"Posta a peça nova. 12 curtidas, 2 de amigas."** · s.3 foto da prateleira cheia, **"Fim do mês: a prateleira cheia e o boleto vazio."** A fala de cada cena mora na nota.
- **Leitura Soft:** 1 cena por slide, foto que espelha a emoção, narração na voz do cliente (respeita os termos que ele não usa). Abre o vácuo emocional que o método vai preencher.

### Arquétipo F, REVEAL PROGRESSIVO DO MECANISMO (build SIMPLES, peça por peça)
- **Função:** o coração do deck. Revela o método sem dar spoiler, sincronizado com a fala.
- **Molde:** o MESMO diagrama entra peça por peça, em slides sucessivos (1 → 1+2 → 1+2+3 → completo). Anota na nota "revelar por clique". Render `conteudo`/`mao`.
- **Slide instanciado (nicho: nutricionista de corredores), método de 3 peças `(nomes a definir com o usuário)`:** s.1 só a Peça 1 na tela *"1. Janela de carga"* · s.2 Peça 1 + Peça 2 *"2. Comida que sustenta o treino"* · s.3 as 3 peças juntas *"3. Recuperação que conta"*. Cada slide com 1 frase, a explicação na nota.
- **Leitura Soft, o RISCO é a densidade.** O Soft vende baixa complexidade. O framework aparece SIMPLES (ilusão de simplicidade: complexo o bastante pra ter valor, simples o bastante pra parecer fazível), NUNCA como mega-diagrama de consultoria com 7 fases × 7 passos. Revelar peça a peça serve à curiosidade e à robustez honesta, nunca a inflar complexidade.

### Arquétipo G, DEMO SUBORDINADA (a ferramenta como motor, se houver)
- **Função:** "show, don't tell" quando o método usa uma ferramenta. Mostra entrada e saída.
- **Molde:** print do antes → depois, ou da tela da ferramenta com seta no que importa. Render `mao`.
- **Slide instanciado (nicho: escola de violão online):** print do app de metrônomo configurado, seta apontando o BPM, **"O mesmo trecho, 10 BPM mais devagar."**. A ferramenta serve ao resultado (tocar limpo), não vira a tese.
- **Leitura Soft:** a ferramenta some do título e da tese. Aparece só como alavanca de execução dentro do ensino. Se o método não usa ferramenta nenhuma, este arquétipo não entra.

### Arquétipo H, MANIFESTO-TESE (o bordão repostável)
- **Função:** o cérebro guarda frases, não parágrafos. A frase curta vira o ponto de fixação da crença.
- **Molde:** frase curta de alto impacto, 1 palavra em cor (verde = ganho), às vezes sobre foto atmosférica. Picos conceituais. Render `frase` (`corpo`).
- **Slide instanciado (nicho: estúdio de cerâmica):** **"Quem faz peça autoral não compete por preço."** com "autoral" em verde, sobre foto de mãos no barro.
- **Leitura Soft:** os bordões-tese do cliente vão aqui, sozinhos, grandes, na voz dele. NÃO fabrica uma big-idea fixa nem decalca de outra marca. Bordões `(a definir com o usuário)`.

### Arquétipo I, CTA COM DESTINO (o fechamento leve do degrau 1)
- **Função:** mover pro Comercial 1:1 sem empurrar venda. No degrau 1 o CTA é "conversa, não compra".
- **Molde:** 1 ação específica de baixa fricção + destino concreto (palavra no Direct OU link). Render `fechamento`/`frase`.
- **Slide instanciado (nicho: nutricionista de corredores):** **"Manda CORRIDA no meu direct."** + sub *"não é compra, é conversa: eu te explico e você decide"*.
- **Leitura Soft:** o destino é sempre um canal humano que captura o indeciso pro 1:1. Nada de "saiba mais" vago. Sem stack, sem preço seco, sem checkout na tela.

> **O que o degrau 1 NÃO usa.** Os arquétipos de oferta do webinário completo (âncora externa alta, stack-nota-fiscal somado, queda em degraus riscada, redução ao ridículo do preço por dia, escassez + FAQ matador de fechamento) ficam de fora. Eles são a maquinaria de venda do degrau 2 (`soft-webinar-slides`). Aqui a Ação é leve e convida pro 1:1.

---

## 3. CALIBRAGEM MINI (deck de ~12 a 20 slides, sem stack/preço)

O deck do mini-webinar é ENXUTO. A diferença de escala em relação ao webinário completo é a regra, não um detalhe.

- **Tamanho:** ~12 a 20 slides. Não 72. O mini-webinar é ~10 min e degrau 1.
- **Sem maquinaria de oferta:** zero stack, zero preço, zero queda riscada, zero escassez fabricada. A Ação convida pro 1:1.
- **Persegue o RITMO, não a contagem.** Respiro preto em TODA virada de fase, troca frequente de estímulo (1 imagem nova por conceito). A contagem de slides é consequência do ritmo, nunca a meta. Se o deck ficou com 14 slides e o ritmo está bom, está pronto; não infla pra "encher".
- **Distribuição que espelha o roteiro:** Atenção ~15% dos slides, Diagnóstico ~15%, Mecanismo ~60% (o coração, é onde mais slides cabem), Ação ~10%. O Mecanismo é a faixa mais longa.
- **Reserva a zona da câmera:** se o cliente grava com o rosto no canto sobre o slide, anota na nota "reservar zona da câmera no canto" e monta cada slide respeitando esse retângulo.
- **Mobile/legível:** fonte grande, alto contraste, nada de bloco de texto miúdo. Se não lê no celular, não serve.

> **EXEMPLO de calibragem (nicho: escola de violão online).** Um deck mini bem calibrado fica assim: capa (1) → respiro (1) → prova social ancorada (1) → respiro (1) [Atenção, 4] · storytelling-de-dor em 2 cenas (2) → manifesto do inimigo (1) → respiro-chave (1) [Diagnóstico, 4] · reveal do método em 3 peças (3) → demo subordinada (1) → prova-número (1) → manifesto-tese (1) → respiros (2) [Mecanismo, 8] · dicotomia 2 caminhos (1) → CTA com destino (1) [Ação, 2]. Total: 18 slides, ritmo com respiro em cada virada, zero slide de oferta.

---

## 4. DOIS CAMINHOS DE SAÍDA (Code via deck_gen.py, Chat via PDF)

A skill roda no Claude **Code** e no Claude **Chat**. O deck sai dos dois, só muda o motor de render. A inteligência (mapa de arquétipos, copy na nota, ritmo) é idêntica.

### Caminho A, Claude CODE (gera `.pptx` via `deck_gen.py`)
1. Monta o **array JSON** no schema do `deck_gen.py`. Cada slide é um objeto com `tipo` (`capa`/`secao`/`frase`/`conteudo`/`prova`/`mao`/`oferta`/`investimento`/`fechamento`), o reforço visível nos campos da tela (`titulo`/`corpo`/`numero`/`itens`) e **a copy falada SEMPRE no campo `nota`** (vira Speaker Notes).
2. No mini-webinar, usa só os tipos enxutos: `capa`, `frase`, `secao`, `prova`, `conteudo`, `mao`. Os tipos `oferta`/`investimento` (que pintam os títulos de verde pra stack/preço) **não entram** no degrau 1.
3. Escreve em `deck.json` e roda o build (`python3 .../deck_gen.py deck.json saida.pptx`). Depende de `python-pptx`.
4. Entrega o `.pptx` com o ID visual Soft já aplicado. A animação clique-a-clique das listas e o quadro da câmera são passos manuais no PowerPoint/Slides depois.

> **EXEMPLO de slide em JSON (nicho: estúdio de cerâmica, arquétipo respiro):**
> ```json
> {
>   "tipo": "frase",
>   "corpo": "Movimento existe. Venda não.",
>   "nota": "Respiro de virada (fim do Bloco I.1). Fala: 'você abre o ateliê, posta a peça nova, responde curioso no direct, e no fim do mês vendeu tres vasos pra tres amigas. O movimento existe, a venda nao.' Tela preta, 1 frase. Reservar zona da camera no canto."
> }
> ```
> O parágrafo falado inteiro na `nota`; na tela, só a frase. O reforço passa pelo gate antes de exportar.

### Caminho B, Claude CHAT (descreve slide a slide e gera PDF direto)
Sem acesso a shell nem ao `deck_gen.py`. Então:
1. **Descreve cada slide** com o mesmo mapa de arquétipos e a mesma regra de ouro: o `tipo`/arquétipo, o **reforço visível** (1 frase/número/imagem) e a **copy na nota**.
2. Aplica na descrição o **ID visual Soft** (fundo preto, título display, verde = ganho, número gigante na prova) pra o player reproduzir.
3. **Gera o PDF direto** renderizando a descrição como deck.
4. Marca os mesmos slots `(a definir com o usuário)` e as notas de animação clique-a-clique.

> Os dois caminhos produzem o MESMO deck conceitual. Só muda o motor (`python-pptx` vs. PDF direto).

---

## 5. RE-GATE ao condensar + checklist do mini-deck

### RE-GATE (a regra que fecha o modo)
O roteiro já passou pelo gate quando foi escrito. Mas o texto VISÍVEL de cada slide (a 1 frase / 1 número / 1 imagem-conceito do reforço) é uma **condensação NOVA** que o lead LÊ, não a fala original. Então a copy de tela de cada slide **re-passa pelo gate** ANTES de exportar: a ancoragem (o número é real?), as 3 perguntas do gate no título de cada slide-chave (dá pra ver? dá pra falsificar? só você diz?), o C/U/B e o anti-IA do gate do SKILL.md (o item Anti-IA HARD, com o CTRL+F manual dos padrões banidos no chat; `python3 scripts/lint_copy.py` na copy de tela + nota no Code). Depois de aprovado, o render não muda palavra; se condensar ou reescrever o texto de tela, re-passa o gate antes de exportar.

### Checklist do mini-deck (roda por dentro, por fase)
- [ ] Nenhum slide passa na pergunta-teste ("dá pra narrar lendo só a tela"). Copy toda na nota.
- [ ] Slides de emoção/virada = tela quase vazia. Só os de prova podem ser densos.
- [ ] 1 ideia por slide. Número-gigante só quando o número é REAL.
- [ ] Reveal do mecanismo SIMPLES, peça a peça. Zero mega-diagrama de consultoria.
- [ ] Respiro preto em TODA virada de fase. Persegue o ritmo, não a contagem.
- [ ] Deck enxuto: ~12 a 20 slides. SEM stack/preço/queda/escassez (degrau 1).
- [ ] A Ação convida pro 1:1 (CTA com destino, "conversa, não compra"), não fecha no checkout.
- [ ] A ferramenta, se aparece, é motor subordinado no ensino, nunca o título/tese.
- [ ] Slots `(a definir com o usuário)` marcados, não inventados (big-idea, nome do método, bordões, polos da dicotomia).
- [ ] Número/prova/case reais. O que falta entra como `[DADO: confirmar]`, nunca preenchido com plausível.
- [ ] Voz do cliente; respeita os termos que ele não usa.
- [ ] Zona da câmera reservada na nota (se grava com rosto no canto). Tela legível no celular.

> **Frase-âncora do modo slides.** Um slide bom carrega 1 ideia. Um slide ruim é um parágrafo digitado que a pessoa lê em 3 segundos e abandona a voz. No mini-webinar isso vale igual, só com menos slides e sem a maquinaria de venda do degrau 2.
