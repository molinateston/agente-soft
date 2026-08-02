# Processo: slides de apresentação (deck)

> A superfície mais longa e a mais traiçoeira. Carrossel para o scroll sozinho; banner vende sozinho; **slide nunca trabalha sozinho, ele apoia uma fala ao vivo**. O deck existe pra sustentar a voz de quem apresenta (aula, webinário, palco, reunião de venda), nunca pra substituí-la. Aqui o designer escreve a copy-visual de cada slide pelo Crivo e compõe o deck. Roda o Passo 0 (perfil do usuário) antes. Niche-neutral: os exemplos são de outros nichos de propósito, nunca decalque.

## Onde o deck entra

- **Aula / webinário (perpétuo ou ao vivo):** o briefing (a tese, a estrutura da fala, a oferta) vem da skill de funil/webinário ou do usuário direto. A copy-visual de cada slide é escrita aqui.
- **Palco / talk / pitch:** o briefing vem do usuário. Uma fala apoiada por deck, não um documento pra ler.
- **Reunião de venda / diagnóstico 1:1:** deck curto que conduz a conversa, slide de oferta no fim.

> **A tese, a estrutura da fala e a oferta NÃO nascem aqui.** Vêm da skill que produz o roteiro. Aqui é a engenharia visual + a copy curta que vai NO slide. Se chegar só o tema sem roteiro, reporte e oriente a voltar pra skill de funil/webinário antes de desenhar.

---

## A lei mãe do slide de elite: 1 ideia por slide, lido em 3 segundos

Tudo neste processo deriva de duas regras inegociáveis:

1. **Uma ideia por slide.** Se o slide carrega duas ideias, são dois slides. Um slide = uma frase que o apresentador está dizendo NAQUELE momento. Bullet-point empilhado (o vício de PowerPoint) está proibido: lista de 6 bullets é a plateia lendo em vez de ouvir, e quem lê não escuta.
2. **A regra dos 3 segundos.** A plateia lê o slide em 3 segundos e volta o olho pro apresentador. Se levar mais que isso, o slide roubou a atenção da fala. Teste duro: cubra o slide depois de 3 segundos e veja se a pessoa consegue repetir a ideia. Não conseguiu = denso demais, corte.

**Corolário do teto de palavras.** Slide de apresentação é MAIS enxuto que card de carrossel, porque concorre com uma voz ao vivo. Teto: **título até 8 palavras; corpo até 20 palavras; um slide de bullets até 3 itens, cada um até 5 palavras.** Acima disso, ou vira dois slides ou a copy volta pra ser cortada. (No carrossel o leitor controla o ritmo e relê; no deck quem controla o ritmo é o apresentador, o slide tem que caber num respiro de fala.)

---

## A diferença estrutural pro carrossel (não trate deck como carrossel comprido)

| Dimensão | Carrossel | Slide de apresentação |
|---|---|---|
| Quem controla o ritmo | o leitor (arrasta) | o apresentador (fala) |
| Quantidade | 7 a 10 cards | 15 a 60 slides (a fala manda) |
| Função do texto | conta a história sozinho | apoia a voz, nunca a duplica |
| Densidade | até 70 palavras de corpo | até 20 palavras de corpo |
| Formato | 1080×1350 (vertical, feed) | **1920×1080 (16:9, horizontal)** ou 1080×1080 se a sala for quadrada |
| Navegação | setinha de arraste | sem setinha; transição é a fala |
| Slide repetido | nunca | **slides-respiro repetidos são bons** (segmento, pausa, ancoragem visual) |

**Consequência prática:** o deck NÃO usa a setinha de arraste (`setinha-arraste.md`), NÃO usa o handle `@` da conta em todo slide, e NÃO se prende ao teto de 10. Reaproveita as 3 famílias visuais, a tipografia e o render, mas com layout e dimensão próprios.

---

## A dimensão (furo de engenharia que o deck obriga a fechar)

O `build_carousel.py` e o `export_pngs.py` estão cravados em **1080×1350**. Slide de apresentação é **16:9 (1920×1080)**. Antes de renderizar deck:

- O template e o export precisam aceitar dimensão parametrizável (`SLIDE_WIDTH`/`SLIDE_HEIGHT`). Enquanto o script não aceitar, **gere o deck com width/height inline no `<div class="slide">` e passe `--width 1920 --height 1080` ao exportador** (ver "Gaps de engenharia" no fim).
- A tabela de escala (`escala-densidade.md`) é calibrada pra 1080px de largura. Em 1920px de largura e MENOS altura, os tamanhos mudam: ver a tabela de escala-deck abaixo.
- Padding: o carrossel usa 100px em 1080. Em 1920×1080 o padding-padrão do deck é **120px nas laterais, 90px topo/base** (a tela é mais larga que alta, a margem horizontal pesa mais).

### Tabela de escala-deck (16:9, 1920×1080)

| Elemento | Palavras | font-size | line-height | weight |
|---|---|---|---|---|
| Título-impacto (1 ideia, slide-respiro) | 1–4 | 180–260px | 0.95 | 700–900 |
| Título normal | 5–8 | 110–150px | 1.0 | 700 |
| Subtítulo / lead | – | 44–56px | 1.3 | 400–500 |
| Corpo | até 20 | 36–44px | 1.4 | 400 |
| Item de lista (máx 3) | até 5 cada | 48–60px | 1.25 | 500–700 |
| Número-prova (o número é o slide) | 1 | 320–480px | 1.0 | 800–900 |
| Rótulo/tag de seção | – | 24–30px | – | 600, tracking +0.1em |

Regra do "ERRO": título com mais de 8 palavras OU corpo com mais de 20 → **pare e reporte**, não encolha a fonte pra caber. Slide denso demais é falha de copy, conserta-se na copy.

---

## A espinha dorsal do deck (a sequência de tensão)

Um deck de elite não é "slides bonitos em sequência", é uma **curva de tensão** que a fala percorre. Os tipos de slide existem pra marcar onde a curva está. Toda apresentação que vende segue, em ordem, esta espinha (a quantidade de slides de cada tipo varia com a fala):

1. **Abertura / Título** - o nome da fala + a promessa. Um slide. Quebra padrão já aqui: nada de "Bem-vindo" + logo gigante.
2. **Gancho / Ruptura** - a frase que invalida o que a plateia acha que sabe. Slide-respiro tipográfico.
3. **Diagnóstico** - a dor nomeada, a cena que a pessoa reconhece. 2 a 5 slides, um sintoma por slide.
4. **Divisor de seção** - slide-respiro que anuncia o próximo bloco ("Parte 1: o que te trava de verdade"). Repetível, é o que dá fôlego à fala.
5. **Mecanismo / Conteúdo** - o ensino, o método nomeado, os passos. O maior bloco. **Um conceito por slide**, nunca a lista inteira de uma vez (revele item a item em slides separados se a fala precisa).
6. **Prova** - número, antes/depois, caso real. Número grande é o slide.
7. **Transição pra oferta** - o slide-ponte que move de "ensinar" pra "oferecer". Marca a virada de tom.
8. **Oferta** - o slide mais desenhado do deck. Ver "O slide de oferta" abaixo.
9. **CTA / próximo passo** - a ação única e clara. Um slide.
10. **Encerramento** - fecha o loop aberto na abertura (volta ao gancho). Um slide.

**Transições de tensão (o que liga um bloco ao outro):** entre Diagnóstico e Mecanismo entra sempre uma frase-virada ("e se o problema não fosse X, fosse Y?"); antes da Oferta entra sempre o slide-ponte. Sem ponte, a oferta soa abrupta e a plateia se fecha. A tensão sobe no diagnóstico, alivia no mecanismo, sobe de novo na transição-oferta. O deck plano (mesma intensidade do início ao fim) é o deck que adormece a sala.

---

## Os tipos de slide e seus layouts (15 tipos, niche-neutral)

Cada tipo herda a família visual escolhida (Editorial Preto / Clínico Branco / Manuscrito Cru). Os exemplos abaixo são de **outros nichos** (odontologia, contabilidade, nutrição, advocacia) de propósito, pra forçar modelar e nunca decalcar.

### 1. ABERTURA (título da fala)
**Função:** nomear a fala e plantar a promessa em 3s.
**Layout:** título grande centrado opticamente, tag de seção pequena no topo, sem corpo.
**Exemplo (odontologia):**
> tag: `MASTERCLASS · IMPLANTES`
> título: **O paciente que diz "vou pensar"** já decidiu não fechar
> (sem mais nada no slide)

### 2. GANCHO / RUPTURA
**Função:** invalidar a crença. Slide-respiro tipográfico, máxima polaridade.
**Layout:** título-impacto 1–4 palavras OU frase curta, espaço negativo brutal, accent em 2 palavras.
**Exemplo (contabilidade):**
> **Seu cliente não te paga pouco.** Ele te paga o que você cobra de você mesmo.

### 3. DIAGNÓSTICO (um sintoma por slide)
**Função:** a plateia se reconhece. Cada slide = uma cena de dor.
**Layout:** frase única, segunda pessoa, sem lista. Repete o tipo 3 ou 4 vezes, uma dor por slide.
**Exemplo (nutrição):**
> Slide A: **Você fecha o consultório** e a agenda do mês que vem está vazia.
> Slide B: **A indicação parou.** E você não sabe dizer por quê.
(dois slides, não um slide com dois bullets)

### 4. DIVISOR DE SEÇÃO (respiro)
**Função:** anunciar o próximo bloco, dar fôlego. Repetível.
**Layout:** rótulo + número de parte + título de seção. Fundo invertido da família (preto vira branco) pra marcar a quebra visual.
**Exemplo:**
> `PARTE 2` **Onde o dinheiro realmente vaza**

### 5. CONCEITO (ensino, um por slide)
**Função:** entregar UMA ideia do método.
**Layout:** título do conceito + 1 linha de corpo (até 20 palavras). Nunca a lista toda.
**Exemplo (advocacia):**
> **Honorário por êxito** afasta o cliente certo. Quem tem caso bom não divide o prêmio.

### 6. LISTA-REVELADA (no máximo 3, item a item)
**Função:** uma sequência de passos/pilares.
**Layout:** se a fala revela um por vez, faça **3 slides** com o item ativo em accent e os outros em cinza (build incremental). Se a fala mostra os 3 juntos, 1 slide com 3 itens grandes, nunca 6.
**Exemplo (nutrição, 3 pilares):** Slide 1 destaca "1. Adesão" e deixa "2. Treino / 3. Sono" apagados; slide 2 acende o "2"; slide 3 acende o "3".

### 7. COMPARATIVO X vs Y
**Função:** contrastar o jeito velho e o novo.
**Layout:** duas colunas, divisória vertical fina, o lado "novo" em accent. Família Clínico Branco é a natural aqui (`layout-utilitario.md`).
**Exemplo (odontologia):** "Vender procedimento" | "Vender o resultado na vida do paciente".

### 8. MECANISMO NOMEADO
**Função:** mostrar o método com nome próprio (o ativo da marca).
**Layout:** o nome do mecanismo gigante, uma linha de definição embaixo.
**Exemplo:** **Método Agenda Cheia** - o consultório lota sem depender de indicação.

### 9. DIAGRAMA / FLUXO
**Função:** mostrar uma relação ou sequência (3–4 nós no máximo).
**Layout:** usa `layout-diagrama-manuscrito.md`. Nós conectados por seta manuscrita. Nunca um fluxograma corporativo de 9 caixas.

### 10. PROVA NUMÉRICA
**Função:** o número carrega o slide.
**Layout:** número 320–480px, uma legenda curta embaixo. Sem prova real no perfil, **placeholder marcado** (`[número - preencher com prova real]`), nunca inventado.
**Exemplo:** **312** consultórios aplicaram · em 8 meses.

### 11. PROVA-CASO / DEPOIMENTO
**Função:** uma história curta de resultado.
**Layout:** Manuscrito Cru, bloco-avatar (`layout-tweet-avatar.md`) se houver foto+nome; sem foto, frase entre aspas grande + atribuição pequena.

### 12. PERGUNTA-RETÓRICA (transição de tensão)
**Função:** virar a chave de um bloco pro outro.
**Layout:** uma pergunta única, centrada, espaço negativo.
**Exemplo:** **E se o problema nunca foi o preço?**

### 13. PONTE PRA OFERTA
**Função:** mover de "ensinei" pra "tenho algo pra você". Marca a virada de tom.
**Layout:** frase de permissão + nome do que vem ("Eu montei isso num lugar só:").

### 14. OFERTA (o slide mais importante do deck)
Ver seção dedicada abaixo.

### 15. CTA / ENCERRAMENTO
**Função:** uma ação única OU fechar o loop da abertura.
**Layout:** verbo de comando + destino claro. Um CTA só, nunca dois.
**Exemplo:** **Chame "AGENDA" no direct** e eu te mando o primeiro passo.

---

## O slide de oferta (o que mais erra e o que mais decide)

O slide de oferta é onde o deck ganha ou perde dinheiro. Regras duras:

1. **A oferta vem antes do roteiro, não do designer.** O que está NA oferta (o quê, o preço, o bônus, a garantia) chega pronto da skill de funil/webinário. Aqui se desenha, não se inventa item nem número.
2. **Um slide-empilhamento, não seis bullets soltos.** A estrutura visual da oferta: nome da oferta no topo (grande) → 3 a 5 entregas em lista vertical limpa (cada uma uma linha, accent no substantivo) → a transformação (não a feature) → o preço/condição → a garantia → o CTA. Se não couber em um slide respirável, quebra em "o que você recebe" (slide A) + "condição + garantia + CTA" (slide B). Nunca espreme.
3. **Ancoragem de valor é visual.** O preço antigo riscado e o novo em accent, ou o "valor total X, hoje Y". A hierarquia leva o olho pro número final, não pra lista.
4. **A garantia tem peso visual próprio.** Risco zero é argumento de venda; desenhe a garantia como um selo/bloco, não como rodapé apagado.
5. **Um CTA só no slide de oferta.** "Clique no link" OU "Chame no direct", nunca os dois. Dois caminhos = nenhum.
6. **Sem stock-art de oferta.** Nada de foguete, cifrão dourado, fita de "OFERTA" diagonal. A oferta quebra padrão pela hierarquia e pelo accent, igual ao resto do deck.

**Exemplo de empilhamento (contabilidade, niche-neutral):**
> **Programa Caixa Previsível** (título grande)
> → As **3 planilhas** de fluxo que eu uso com cliente
> → **6 encontros** ao vivo de revisão
> → O **mapa de cobrança** que recupera inadimplente
> _De cliente que paga atrasado a caixa que sobra todo mês._
> ~~R$ 4.800~~ → **R$ 2.400** em até 12x
> **Garantia de 15 dias** - não serviu, devolvo tudo
> **[CTA: chame "CAIXA" no direct]**

---

## A lei do render (igual carrossel e banner)

A copy-visual de cada slide passa pelo gate do Crivo ANTES de desenhar (`shared-references/crivo/03-gate-cub.md`: CUB, as 3 perguntas do gate no título de cada slide-chave, anti-vazamento, prova no CTA). Depois de aprovada, o render **não muda palavra**; se o layout exigir mexer, re-passa a ancoragem e a headline do gate antes de exportar. Anti-IA (sem travessão, sem frase de robô) e mobile-first quando o deck também roda no celular (webinário assistido no telefone). Sem prova real no perfil, número sai como placeholder marcado, nunca inventado.

---

## Fluxo de execução (siga sempre nesta ordem)

1. **Passo 0** - leia o perfil do usuário (`shared-references/crivo/00-perfil-do-usuario.md`). Sem perfil, roteia pro onboarding.
2. **Receba o roteiro/tese** da skill de funil/webinário ou do usuário. Se vier só o tema, reporte que a estrutura da fala precisa vir pronta.
3. **Marque a espinha** - mapeie cada bloco da fala num tipo de slide (abertura, gancho, diagnóstico, divisor, conceito, prova, ponte, oferta, CTA, encerramento). **Declare a lista de tipos ao usuário antes de desenhar** (mesma disciplina do carrossel).
4. **Escolha família + cor + tipografia** (`perguntas-design.md`, `tipografia.md`). Um deck usa UMA família e UMA cor de accent do começo ao fim, igual carrossel. Divisores de seção podem inverter o fundo da família.
5. **Aplique a copy pelo Crivo** (gate, anti-IA, mobile-first) ANTES de renderizar.
6. **Conte palavras por slide** contra a tabela de escala-deck. Caiu em ERRO, pare e reporte.
7. **Renderize** em 16:9 (1920×1080) com Python (`build_carousel.py` adaptado, ver gaps). Quebra de linha manual (`tipografia-quebra-linhas.md`), nunca o browser quebrando.
8. **Audite** com `auditoria-pre-preview.md` + os checks específicos de deck (abaixo). Interna, não reporta.
9. **Preview** antes de exportar. Pergunte: "Quais slides precisam de ajuste antes de eu exportar?". Não exporte sem aprovação explícita.
10. **Exporte** os PNGs 16:9 e entregue na ordem.

---

## Auditoria específica de deck (além da `auditoria-pre-preview.md`)

Antes do preview, rode em cada slide (interna):

1. **1 ideia?** O slide carrega uma única ideia. Se carrega duas, vira dois slides.
2. **Teste dos 3 segundos?** Dá pra ler e voltar pro apresentador em 3s.
3. **Teto de palavras?** Título ≤ 8, corpo ≤ 20, lista ≤ 3 itens de ≤ 5 palavras.
4. **Não duplica a fala?** O slide apoia, não transcreve o que o apresentador vai dizer.
5. **Dimensão 16:9?** Width 1920, height 1080 (ou quadrado se a sala pedir), nunca 1080×1350.
6. **Sem setinha de arraste / sem handle em todo slide?** Deck não é carrossel.
7. **Uma família, um accent, do começo ao fim?**
8. **Slide de oferta:** um CTA só, garantia com peso, valor ancorado, sem stock-art.
9. **Curva de tensão:** existe ponte antes da oferta e virada entre diagnóstico e mecanismo.
10. **Divisores de seção** marcam os blocos (deck longo sem divisor cansa).

Qualquer NÃO → corrige o slide específico e re-audita. Slide que não cabe na copy → pare, reporte, sugira corte na copy (não encolha fonte).

---

## Gaps de engenharia que o deck obriga a fechar (estado da arte)

Estes itens são pré-requisito pra esta superfície sair do estado "rascunho processual" e virar render real. Enquanto não fechados, o deck é gerado com workaround inline:

1. **Dimensão parametrizável nos scripts.** `export_pngs.py` cra `SLIDE_WIDTH=1080`/`SLIDE_HEIGHT=1350`. Adicionar `--width`/`--height` (default mantém o carrossel). O `clip` e o `viewport` passam a ler os args. Sem isso, o export corta o deck 16:9.
2. **Template de deck no `build_carousel.py`.** O `HTML_TEMPLATE` e os helpers (`make_symmetric_slide`) assumem 1080×1350 e o preview com `scale(0.4)` calibrado pra esse tamanho (os margins negativos `-810px`/`-324px`). Um `make_deck_slide(width=1920, height=1080, ...)` + um preview scale próprio (16:9 escala melhor em ~0.3) são necessários.
3. **Tabela de escala-deck** (acima) precisa virar reference dedicada ou seção do `escala-densidade.md`, hoje a tabela de densidade é só pra 1080px de largura.
4. **Famílias visuais em 16:9.** As 3 famílias documentam layout slide-a-slide pra 1080×1350 vertical. Layout horizontal (mais largura, menos altura) muda alinhamento e padding: as famílias precisam de uma nota de "modo deck" ou um override de padding (120/90).

Até esses gaps fecharem, gere o deck com `width:1920px;height:1080px` inline em cada `<div class="slide">` e exporte com clip manual de 1920×1080; deixe registrado pro usuário que o render de deck ainda é semi-manual.

---

## O que entrega

O deck final em PNG 16:9 (1920×1080), na ordem, cada slide com uma ideia, com a copy-visual aprovada no Crivo, pronto pra rodar atrás de uma fala ao vivo ou gravada. Mais a nota de qual família, cor e quantos slides por bloco foram usados.

## Handoff

PNGs do deck exportados e aprovados → o usuário apresenta (ao vivo, grava o webinário, sobe no software de webinário). Se a copy/estrutura da fala precisar mudar, o caminho é a skill de funil/webinário, este processo desenha o que recebe, não escreve o roteiro.
