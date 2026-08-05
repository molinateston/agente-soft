# Geração de slides, como a skill monta o deck quase perfeito

> **CONTRATO VIGENTE (manda sobre este arquivo):** o output da Etapa AULA é o roteiro SLIDE A SLIDE, cada slide com TÍTULO + OBJETIVO + CONTEÚDO. A skill NÃO renderiza slides e NÃO entrega roteiro falado corrido. Onde este arquivo falar em "NOTA"/"copy falada", leia como material do apresentador/renderizador (fora do contrato de entrega); o que ele ensina sobre a TELA vale pro campo CONTEÚDO.

Esta reference é a **última etapa de produção** do Webinar Soft: pega o roteiro ADMA já pronto (`estrutura-webinario-aida.md`) e o transforma num **deck que constrói crença slide a slide**. Não reescreve copy nem reordena o roteiro, só *amplifica visualmente* o que já está escrito. A skill aqui aprende a (1) obedecer a **regra de ouro** (copy nas notas, slide visível mínimo, com slide bom×ruim instanciado na Seção 0), (2) montar o deck como **JSON no schema exato do `deck_gen.py`** (Seção 1), (3) escolher entre os **18 arquétipos de slide catalogados** com molde e exemplo (Seção 2), (4) mapear cada bloco do roteiro aos arquétipos por fase (Seção 3), e (5) sair por **dois caminhos portáveis** (Claude Code → `.pptx`; Claude Chat → PDF direto) passando no **checklist "quase perfeito"**.

> Destilada do slide-craft de um deck-referência de alto faturamento (325 slides reconstruídos) mais o capítulo didático de montagem de deck (voz autoral, exemplos por nicho) e o gerador `scripts/deck_gen.py`. Todos os exemplos de slide são por **NICHO** (webinar de gestão, webinar de emprego, etc.), **nunca nome próprio de pessoa, aluno ou marca**. Os slots `(nome a definir com o usuário)` ficam marcados, não inventados.

**Coerência com as outras references (a costura):** o `estrutura-webinario-aida.md` diz **o que falar e em que ordem**; o `template-72-slides.md` diz **em quantos/quais slides essa fala se projeta** (os 72 beats na ordem-lei); **esta reference diz COMO renderizar** cada beat (arquétipo + JSON + copy-na-nota). Gere o roteiro, projete nos 72 beats, renderize com os arquétipos daqui.

**Pré-requisito inegociável:** o **roteiro ADMA (Parte 3) tem que estar pronto.** O deck nasce do script, nunca do zero.

---

## Índice

- 0. O PRINCÍPIO-MÃE, o slide serve a fala, nunca a substitui
- 1. O SCHEMA EXATO DO `deck_gen.py`
- 2. O CATÁLOGO DOS 18 ARQUÉTIPOS DE SLIDE (cada um com molde + slide instanciado)
- 3. MAPA, cada bloco do roteiro → arquétipo(s) de slide
- 4. DECK COMO JSON, um exemplo de cada tipo
- 5. A REGRA DE OURO (a copy vai na nota, o slide é mínimo)
- 6. DOIS CAMINHOS DE SAÍDA (portabilidade)
- 7. CHECKLIST "QUASE PERFEITO"

---

## 0. O PRINCÍPIO-MÃE, o slide serve a fala, nunca a substitui

O deck **não é o conteúdo**, é o amplificador visual de uma copy que já funciona. A ordem de produção é fixa:

1. O **script já está pronto** (saída da estrutura ADMA).
2. Pega-se a **copy falada** e cola-se **nas notas** (campo `nota` do JSON / Speaker Notes), invisível à plateia.
3. **Só depois** cria-se o conteúdo visível do slide, o reforço (1 frase, 1 número, 1 imagem-conceito).
4. O slide visível recebe **só o reforço**. O parágrafo falado mora na nota.

**Por quê (a premissa):** a atenção é **canal único** e **ler vence ouvir**. Texto-parágrafo na tela *rouba* a plateia da voz que constrói a crença, o lead lê, conclui antes, a curiosidade satura e ele desliga. Tela com só um reforço (1 ideia) devolve o olhar pra voz e age como **dupla codificação** (vê + ouve).

**Pergunta-teste pra cada slide:** *"Este slide pode ser narrado em voz alta lendo o que está nele?"* Se **sim → está errado** (é um slide que se lê). A copy vai pra `nota`; na tela fica só o reforço.

> **Por que (fala do método):** *"a pessoa lê mais rápido do que você fala. Quando você bota um parágrafo na tela, ela termina de ler antes de você terminar de falar, e naquele segundo ela desligou de você. Você virou repetição do que ela já leu. Virou ruído de fundo da sua própria aula."* Ler vence ouvir; texto-parágrafo na tela rouba a plateia da voz que constrói a crença.

**EXEMPLO de outro nicho, slide RUIM × slide BOM (nicho: webinar de gestão de equipe).** O bloco fala "no mundo de hoje, o gestor que só apaga incêndio vira sufocado pela operação; quem aprende a enxergar o todo vira indispensável, e é disso que essa aula trata".
- **❌ Slide RUIM (teleprompter público):** a tela mostra o parágrafo inteiro digitado, "No mundo de hoje, o gestor que só apaga incêndio vira sufocado pela operação. Quem aprende a enxergar o todo vira indispensável. É disso que essa aula trata." A plateia lê em 3 segundos, conclui antes da fala, e a voz vira eco do que já leram.
- **✅ Slide BOM (reforço único):** na tela, fundo preto, uma frase só, **"Sufocado pela operação?"**. O parágrafo inteiro mora na `nota` (Speaker Notes). O olho não tem o que ler além do gancho; volta pra voz, onde a crença está sendo instalada.

> **EXEMPLO (deck-referência de alto faturamento).** Os slides de maior carga persuasiva têm uma frase só na tela, *"Em terra de cego quem tem olho é rei"*. É isso, mais nada. "Um slide bom carrega uma ideia. Um slide ruim é um parágrafo inteiro digitado que a pessoa lê em três segundos e te abandona".

**Ordem de montagem (nunca o contrário):** primeiro cola a copy do trecho na `nota`; depois, com a copy já lá, pergunta *"o que mostro em cima que ajuda a pessoa a entender isso?"* e constrói o visual. Copy primeiro, visual depois: o slide serve a fala, não a fala serve o slide.

**Calibrar densidade pela função emocional:** slide de **EMOÇÃO/virada → tela quase vazia** (1 ideia); slide de **PROVA/referência → pode ser denso** (documento, dado, matéria) porque ali a densidade *É* a mensagem.

> **"1 ideia por slide" NÃO é "1 item de lista por slide".** A "ideia" é o ASSUNTO/objetivo do slide. Uma lista de um assunto (ex.: "sem A / sem B / sem C", ou os 3 passos do método) é UMA ideia → fica num slide SÓ, e cada item entra por CLIQUE (animação, mesma tela). Picotar "sem A" num slide, "sem B" no outro, "sem C" no outro está ❌ ERRADO. Slide novo só quando muda o assunto. Detalhe e exemplo na regra de ouro 7 (Seção 5).

**O quadro cinza, reservar o espaço do rosto (detalhe de acabamento que separa amador de profissional).** No ao vivo, a câmera do apresentador (o "videozinho no canto") fica **sobreposta** ao slide. Quem monta sem pensar nisso deixa o rosto em cima do texto/imagem que importava. A solução é mecânica: desenha **um retângulo cinza** no canto, copia e cola em TODOS os slides desde o início, monta cada slide respeitando essa zona (se um elemento invade, diminui até liberar), e **no fim apaga os retângulos um por um**. No JSON/descrição, anote na `nota` *"reservar zona da câmera no canto"*.
> **Fala do método:** *"Eu coloco esse quadro cinza aqui, porque isso é onde vai aparecer o vídeo do apresentador na hora do slide… você desenha um, copia, e cola nos cem slides de uma vez."*

> **A ferramenta é o motor, nunca a bandeira.** Em decks de nicho de tecnologia, a ferramenta é o gancho do título porque *aquele* público a teme/cobiça. **No Soft, a ferramenta não é o produto**, é, no máximo, uma alavanca de execução dentro do método. Título e tese = **transformação do avatar do usuário**, nunca a tecnologia. Se aparecer um slide de demo, a ferramenta serve ao resultado do avatar e some do título.

---

## 1. O SCHEMA EXATO DO `deck_gen.py`

O gerador vive em `scripts/deck_gen.py` desta skill. Ele lê um **array JSON de slides** e renderiza um `.pptx` **marca-neutro**: cores, fontes e marca do rodapé são CONFIG DO DONO via variáveis de ambiente (DECK_BG, DECK_INK, DECK_ACCENT = cor de ganho/comprar, DECK_ALERT = cor de medo/perda, DECK_TITLEFONT, DECK_BODYFONT, DECK_BRAND); os defaults são neutros, sem cor nem tipografia de marca nenhuma. O ID visual do dono entra por essa config, nunca hardcoded. **A copy falada vai sempre no campo `nota`** (vira Speaker Notes). Os números de exemplo abaixo são ilustrativos, troque pelos números reais do usuário.

Cada slide é um objeto com estes campos (todos opcionais conforme o `tipo`):

```
{
  "tipo":   "capa | secao | frase | conteudo | prova | mao | oferta | investimento | fechamento",
  "rotulo": "kicker em CAPS (ex.: 'PROVA', 'A OFERTA')",
  "titulo": "título do slide",
  "sub":    "subtítulo / linha de apoio",
  "itens":  [ { "titulo": "...", "texto": "..." } ],   // listas: conteudo / mao / oferta / investimento / fechamento
  "numero": "R$ 13.575.195",                            // SÓ no tipo 'prova', vira o número-gigante verde
  "fonte":  "fonte do número",                          // SÓ no tipo 'prova'
  "corpo":  "frase grande centralizada",                // tipos 'frase' / 'secao' (e cauda opcional de 'conteudo')
  "nota":   "TODA a copy falada deste slide (Speaker Notes)"
}
```

**Como cada `tipo` renderiza (o que aparece na tela):**

| `tipo` | Renderização | Mapeia o(s) arquétipo(s) |
|---|---|---|
| `capa` | kicker verde + título display 64pt + `sub`, centralizado, sem rodapé numerado | 2 (Capa/Big-Idea) |
| `frase` | `corpo` 46pt branco centralizado (+ `rotulo` verde acima), tela quase vazia | 1 (Respiro) · 16 (Manifesto) |
| `secao` | igual `frase`, 40pt, vira de seção | 1 (Respiro de seção) |
| `prova` | `numero` 96pt **verde gigante** + `titulo` legenda + `fonte` | 8 (Número-gigante) · 3/9/12 (prova) |
| `conteudo` | kicker + título + `sub` + `itens` (bullets brancos) ou `corpo` | 5·6·10·11·14·15 (ensino/dor/dicotomia) |
| `mao` | igual `conteudo` (layout de "na prática"/passos) | 4·6·13·15 |
| `oferta` | igual `conteudo`, mas `itens[].titulo` em **verde** (stack que cresce) | 13·17 (stack/recap) |
| `investimento` | igual `oferta`, verde nos títulos (preço/ancoragem) | 17 (ancoragem/queda) |
| `fechamento` | igual `conteudo` (FAQ / CTA / escassez) | 18 (escassez+FAQ+CTA) |

**Regras do renderer que a skill precisa respeitar:**
- `frase`/`secao`/`capa`/`prova` são **centralizados e de tela limpa** → use-os nas viradas e nos picos. Não tente enfiar lista neles (o campo `itens` é ignorado nesses tipos).
- Em `oferta`/`investimento` os títulos dos `itens` saem **verdes** automaticamente → é o "luz verde pra comprar". Use pra stack e preço.
- O rodapé "{DECK_BRAND} · {rotulo}" e o número da página são automáticos (a `capa` não numera). **A marca do rodapé vem da env `DECK_BRAND`** (default vazio = sem marca); nada de marca literal no código.
- **Listas longas:** uma lista = UM objeto de slide com o array `itens` completo (NÃO um objeto por item). O `.pptx` mostra os itens estáticos numa tela só. A **animação clique-a-clique** (regra de ouro 7 da Seção 5, a dopamina) é aplicada *depois*, no PowerPoint/Slides (entrada item a item, na MESMA tela). No JSON, basta ter os `itens` na ordem da fala num único slide; anote na `nota` *"revelar item a item por clique (mesma tela)"*. Item por clique é animação, nunca slide novo.

### Comando de build (Claude Code)

```bash
python3 scripts/deck_gen.py deck.json saida.pptx
# saída: "OK {N} slides -> saida.pptx"
```

Dependência: `python-pptx` (`pip install python-pptx` se faltar).

---

## 2. O CATÁLOGO DOS 18 ARQUÉTIPOS DE SLIDE (cada um com molde + slide instanciado)

São **18 peças de Lego persuasivas**, cada uma com função fixa, identificadas num deck campeão (webinar de gestão, 325 slides). A skill mapeia cada bloco do roteiro a um ou mais arquétipos (Seção 3) e os renderiza pelos `tipo`s do `deck_gen.py` (Seção 1). Para cada arquétipo abaixo: **o quê/mecanismo · slide INSTANCIADO (texto-tela real, marcado EXEMPLO com origem) · o porquê · a leitura Soft**. Nenhum texto de slide foi inventado, os verbatim vêm da destilação do deck-referência.

> ⚠️ Os textos de slide dos nichos de gestão/emprego são **EXEMPLO didático de outro nicho** (mostram o molde preenchido), recheio a substituir pela realidade do avatar do usuário, nunca a decalcar. Nomes próprios (Big Idea, framework, bordão) = SLOTS `(nome a definir com o usuário)`.

### Arquétipo 1, RESPIRO / TELA-PRETA-1-FRASE (reset de atenção)
Fundo preto + uma frase branca centralizada, fonte grande, zero ruído. 1 ideia. É o slide mais **frequente** do deck, vive em toda virada e em todo pico persuasivo. Frequentemente termina em reticência (abre open loop). Render: `frase`/`secao`.
- **EXEMPLO (gestão):** s.54 `corpo`: *"No mundo BANI, uma Gestão Ágil é mais NECESSÁRIA DO QUE NUNCA!"* · s.274 *"Antes de eu liberar o link…"*
- **Porquê:** a atenção decai sob estímulo constante (habituação); a quebra de padrão mais barata é o **esvaziamento**, não há pra onde o olho fugir, o peso recai 100% na frase narrada.
- **Soft:** o mais transferível e barato. Use em **TODA virada de fase**. Funciona em qualquer nicho sem adaptar, só troca a frase.

### Arquétipo 2, CAPA / BIG-IDEA (título-promessa)
Título-promessa em display pesado + subtítulo + ilustração que planta o subtexto da tese. Slide 1 e abertura de cada grande seção/produto. Render: `capa`.
- **EXEMPLO de outro nicho (gestão):** s.1 *"Gestão Ágil na Era da IA / Como se tornar um gestor indispensável…"*, com estrutura-azul (legado) colidindo com cometa-laranja (a tecnologia chegando). A tecnologia é o gancho **porque aquele público a teme/cobiça**.
- **Porquê:** a decisão de ficar é tomada em ~3 s, por uma pergunta inconsciente *"isto é sobre mim e sobre o que eu quero?"*, a capa responde com a **transformação do avatar**, não com a ferramenta.
- **Soft:** a Big Idea é um **SLOT construído por webinário** (transformação-mãe do avatar do usuário), nunca frase fixa. A promessa grande de transformação do avatar vai aqui, com imagem. A ferramenta, quando aparecer, é subtexto visual, **nunca o título**. *(nome do título/Big Idea: a definir com o usuário)*. Ver `exemplos-por-bloco/05-big-idea-domino.md`.

### Arquétipo 3, AUTORIDADE / PROVA EMPILHADA (números da empresa + bio + logos)
Grade de métricas-gigantes + logos de marcas-prova (halo effect). Empilha a EMPRESA primeiro, depois a PESSOA. Logo após a abertura, pra baixar o ceticismo antes do ensino. Render: `prova`/`conteudo`.
- **EXEMPLO de outro nicho (gestão):** s.4 `prova` numero *"+19.236"* titulo *"Alunos · +500k leitores · Uma das maiores escolas de gestão do Brasil"* · s.6 *"27 anos de experiência… já treinei mais de 16 mil pessoas"* + grade de logos (montadora japonesa, grandes bancos, auditoria, cervejaria).
- **Porquê:** ceticismo é o estado-padrão; prova por **escala** ("milhares já confiaram") + prova por **associação** (halo das marcas) baixam a guarda. Instituição primeiro (impessoal, difícil de invejar), pessoa depois.
- **Soft:** mesma estrutura, conteúdo é a prova real do usuário (resultados, faturamento, casos). Falta de escala → **prova de profundidade** (1 caso detalhado, Arquétipo 12). ⚠️ só prova real. Ver `exemplos-por-bloco/03-autoridade-historia.md`.

### Arquétipo 4, STORYTELLING / ORIGEM (jornada do herói, fracasso primeiro)
Timeline serpenteante (ou foto + texto) começando pela DERROTA → virada → autoridade ganha na dor. Logo após as credenciais frias, como cola emocional. Render: `conteudo`/`frase`.
- **EXEMPLO de outro nicho (gestão):** s.7 timeline *"1999 Início de carreira → 2008 Aprendi Lean na [montadora] → 2014 Fundei a [escola] → DIAS ATUAIS Esta aula :)"*. Fala: *"perdemos um bom técnico e ganhamos um péssimo líder, esse era eu"*.
- **Porquê:** **identificação precede aspiração**. Credencial fria cria distância e inveja; contar o fracasso primeiro fecha a distância ("ele já esteve onde eu estou").
- **Soft:** a história real do usuário (fracasso → virada → método) na **voz dele**. Ordem obrigatória: fracasso → virada → autoridade. A cicatriz É o estado atual do avatar (ver `exemplos-por-bloco/03-autoridade-historia.md`).

### Arquétipo 5, DICOTOMIA SEMAFÓRICA (2 tipos / 2 caminhos: medo vs. desejo)
Divisão "2 tipos de pessoas" / "2 caminhos" com **cor semafórica**: vermelho (medo/perda) vs. verde (desejo/segurança). **Medo primeiro** (aversão à perda). Cria a tensão de identidade que segura até a oferta. Render: `conteudo` (revelar item a item).
- **EXEMPLO de outro nicho (gestão):** s.9-10 *"Os que se tornarão INDISPENSÁVEIS (verde) × os que vão ficar PARA TRÁS (vermelho)"* · s.203 a encruzilhada *"1-Sozinho (paisagem árida) × 2-Comigo (campo verde)"*.
- **EXEMPLO de outro nicho (emprego):** par errado×certo *"soldado (atira pra todo lado) × sniper (mira a vaga certa)"*, duas imagens contrastantes.
- **Porquê:** identidade é o motor de decisão mais forte; ninguém escolhe ser "o outro tipo". A cor faz o trabalho persuasivo **sem argumento** (pré-verbal). Perder dói ~2x mais que ganhar agrada → medo primeiro.
- **Soft:** o eixo de transformação do avatar do usuário já é uma dicotomia pronta, use o semáforo. A encruzilhada "sozinho × comigo" é o slide-charneira da transição pro pitch. *(nome dos dois polos: a definir com o usuário)*. Ver `exemplos-por-bloco/08-transicao-pra-venda.md`.

### Arquétipo 6, CONTRATO / AGENDA COM LOOPS ABERTOS (o que você ganha se ficar)
Lista numerada de objetivos/marcos, cada um um loop aberto de curiosidade que prende até o fim; já embute o desejo final. Render: `conteudo` (revelar por clique).
- **EXEMPLO de outro nicho (gestão):** s.11 *"3 OBJETIVOS DESTA AULA"* · s.16 *"Após esta aula você saberá exatamente: por que o mundo mudou… um passo a passo prático pra aplicar AMANHÃ…"*.
- **Porquê:** loop aberto é tensão; o cérebro odeia loop sem resposta. Promessas-ainda-não-cumpridas plantadas cedo reduzem o abandono. "Aplicar amanhã" adiciona recompensa próxima.
- **Soft:** os passos do método do usuário podem virar a agenda (revelados item a item por clique), embutindo o desejo-fim. *(nome do framework: a definir com o usuário)*.

### Arquétipo 7, RETENÇÃO / "PRESENTE PRA QUEM FICAR" (loop de recompensa)
Promessa explícita de uma recompensa no fim, pra reduzir abandono no momento crítico. Render: `frase`/`conteudo`.
- **EXEMPLO de outro nicho (gestão):** s.17 *"Tem presente pra quem ficar até o final"* (foto de presente embrulhado) · repetido na boca do pitch (s.184).
- **Porquê:** a venda inteira depende de uma variável, o lead chegar ao fim (onde está o CTA). O presente é loop de recompensa + reciprocidade antecipada.
- **Soft:** obrigatório. O presente tem que ser **real e entregue** dentro do bloco de bônus/escassez.

### Arquétipo 8, NÚMERO-GIGANTE / ESTATÍSTICA (a manchete numérica)
O número vira a manchete tipográfica (display gigante); o texto vira legenda. Quantifica ROI, prova tendência, ancora valor. Render: `prova` (`numero` = o gigante verde, `fonte` = lastro).
- **EXEMPLO de outro nicho (gestão):** s.15 *"3-5x Multiplicação Salarial / R$20k+ Faixa Executiva"* · s.24 *"Mais de 70% das empresas já adotavam Gestão Ágil no Brasil em 2025!"* com seta vermelha · s.107 *"O 4% que gera 64% do resultado"*.
- **Porquê:** o abstrato não move, o concreto move. Número grande = ROI mensurável / tendência esmagadora + FOMO numérico ("você é a minoria atrasada").
- **Soft:** números reais do usuário (resultados de alunos, faturamento, % de mercado) viram manchete. ⚠️ **sem inventar número**, só o que tem prova.

### Arquétipo 9, PRINT DE MÍDIA / AUTORIDADE EXTERNA EMPILHADA (stacking de manchetes)
Colagem de screenshots reais de veículos reconhecidos, escalonados ("vários grandes dizendo o mesmo"). Prova por VOLUME + grifo + seta no trecho que importa. Render: `prova`/`conteudo` (imagem).
- **EXEMPLO de outro nicho (gestão):** s.21-25 prints de grande portal + revistas de negócios + a **capa física** da revista (materialidade: "isso é tão real que virou revista").
- **Porquê:** "não sou eu dizendo, é a maior mídia do país", terceiriza a credibilidade da categoria; a força é proporcional ao volume e diversidade de fontes.
- **Soft:** empilhar prints reais sobre a dor/tendência do avatar (mercado, demanda, casos públicos). Grifar **SÓ o trecho que será lido**. Ver `exemplos-por-bloco/07-provas-casos.md`.

### Arquétipo 10, ENSINO / FRAMEWORK / DIAGRAMA (o mecanismo visualizado)
Comparação 2-colunas (antes/depois), gráfico "taco de hóquei", acrônimo desdobrado, matriz 2x2, templo de pilares, fluxograma. Jargão + ícone line-art = sensação de método sério. Render: `conteudo`/`mao`.
- **EXEMPLO de outro nicho (gestão, VENDE complexidade):** s.27 *"Antigamente VS Hoje em Dia"* · s.29 acrônimo em 4 colunas · s.53 matriz 2x2 dos 4 pilares · s.123 templo da Cultura Lean.
- **EXEMPLO de outro nicho (emprego, baixa complexidade):** *"currículo é como o trailer de um filme"* materializado numa imagem, diagrama mínimo, coerente com o posicionamento.
- **Porquê:** o diagrama "prova" pela razão (halo de ciência: "é método, não opinião") e dá um modelo mental que o lead leva pra casa.
- **Soft, ⚠️ DENSIDADE É O RISCO.** Gestão empilha siglas porque **vende complexidade**. O **Soft vende baixa complexidade**, o framework do usuário aparece SIMPLES, **nunca** como mega-diagrama de consultoria. Use a **ilusão de simplicidade** (complexo o bastante pra ter valor, simples o bastante pra parecer fazível).

### Arquétipo 11, STORYTELLING DE DOR / "UM DIA NA SUA VIDA" (2ª pessoa, 1 cena por slide)
Narrativa em 2ª pessoa ("imagine SEU dia…") **quebrada em uma cena por slide**, cada cena 1 foto + 1 micro-dor, escalando até o clímax. Render: `conteudo`/`frase` (sequência rápida). **Atenção à granularidade:** aqui cada CENA é um ASSUNTO emocional próprio (uma imagem + uma micro-dor distinta), por isso são slides distintos: é o assunto que muda, não um item de lista picotado. Não confundir com lista: se uma cena tiver uma lista interna, essa lista é por clique DENTRO da cena, não vira mais slides.
- **EXEMPLO de outro nicho (gestão):** s.34-37 *"Imagine seu dia como gestor no mundo BANI: você chega e o relatório que passou a noite preparando já está desatualizado… sua equipe está ansiosa… os dados são contraditórios… um concorrente lança um produto que parecia impossível"* (clímax: mão movendo peça de xadrez).
- **Porquê:** sentir a dor move mais que ouvir sobre ela; a 2ª pessoa põe o lead dentro da cena. Abre o **vácuo emocional** que o método vai preencher, primeiro o vazio, depois o preenchimento.
- **Soft:** trocar "gestor no mundo BANI" pela dor real do avatar do usuário. 1 cena por slide, foto que espelha a emoção, narração na **voz do usuário** (respeitar a anti-voz: termos que ele não usa). Ver `exemplos-por-bloco/04-problema-interesse.md`.

### Arquétipo 12, PROVA / DEPOIMENTO / DOCUMENTO (credibilidade crescente)
Card de depoimento (foto + nome + 5 estrelas + quote) com a MANCHETE DO NÚMERO gigante; ou, mais forte, print de DOCUMENTO oficial com seta apontando o valor. Escala: depoimento editável < print de sistema oficial. Render: `prova` (empilhado).
- **EXEMPLO de outro nicho (gestão):** s.197 carteira de trabalho física *"R$17.856,72"* · s.198 print do portal do Ministério *"Salário alterado para R$23.583,25 / DIRETOR"* (prova governamental irrefutável) · s.199-202 série *"ganhou 60%… 70%… saiu de 9.500 e hoje ganha 19.000… aumento de 460%"* (cobre quem ganhava bem E quem ganhava pouco).
- **EXEMPLO de outro nicho (verbatim de fala, ver `exemplos-por-bloco/07-provas-casos.md`):** *"a meu último registro em carteira eu ganhava 17.000 CLT… eu trouxe aqui o print da minha carteira profissional pra vocês, é uma foto"*, documento bruto e levemente feio > slide bonito.
- **Porquê:** a força da prova é proporcional a quão difícil é falsificá-la; documento irrefutável vence o ceticismo que o depoimento sozinho não vence. Empilhar 4-6 casos converte "pode ser sorte" em "é regra".
- **Soft:** prova é onde o usuário ganha o jogo da credibilidade. ⚠️ a prova do avatar dono-de-negócio não é carteira CLT, é o **espelho de negócio** (extrato, agenda lotada, contrato assinado, cliente high-ticket falando). Em depoimento, ler **só a frase grifada**. Falta de escala → profundidade.

### Arquétipo 13, MOCKUP / TOUR DO PRODUTO (a prova de que existe)
Render 3D de telas empilhadas, print real da área de membros com contadores ("148 aulas", "33% concluído"), mockup de box, certificado com **"Seu Nome Aqui"**. Render: `mao`/`oferta`.
- **EXEMPLO de outro nicho (gestão):** s.235 print real *"50 de 148 aulas"* · s.250 certificado *"Seu Nome Aqui"* · s.287 box 3D de bônus.
- **Porquê:** a objeção silenciosa "será que é vaporware?" prende a compra; mostrar o produto funcionando reduz o risco. O "Seu Nome Aqui" dispara **posse antecipada** (o que a mente já possui dói recusar).
- **Soft:** mostrar a área de membros / módulos reais do produto do usuário. "Seu Nome Aqui" no certificado é barato e potente. ⚠️ nada de mockup de produto que não existe (a fraude vaza na entrega).

### Arquétipo 14, DEMO DE FERRAMENTA / PROMPT+RESULTADO (a ferramenta é o motor, NUNCA a bandeira)
Print de chat com setas "Prompt:" → "Resultado:": mostra o copy-paste exato + a saída rica. Render: `mao`.
- **EXEMPLO de outro nicho (gestão), reframe verbatim:** s.74 *"Imagine a IA como um estagiário de QI 160"* → s.75-76 prompt literal *"Tenho as seguintes tarefas… organize e priorize"* + resultado com justificativa de negócio. Fala (ver `exemplos-por-bloco/06-viradas-conteudo.md`): *"imagina a IA como um estagiário de QI 160… Ele é um garoto inexperiente, mas tem uma inteligência absurda… é uma pedra bruta pra você. Quem é esse estagiário? É a IA."*
- **Porquê:** "show, don't tell", a ferramenta vira "resolve meu problema concreto" quando se mostra entrada → saída. O reframe de subordinação ("você comanda, ela executa") desarma o medo de substituição e mantém o humano protagonista.
- **Soft, ⚠️ A REGRA-OURO: "A ferramenta é o motor, nunca a bandeira."** Em nichos de tecnologia a ferramenta é o GANCHO do título porque aquele público a teme/cobiça. **No Soft a ferramenta não é o produto**, é, no máximo, alavanca de execução dentro do método. Se aparecer um slide de demo, a ferramenta serve ao resultado do avatar e **some do título/tese**. Título = transformação do avatar, nunca a tecnologia.

### Arquétipo 15, REVELAÇÃO PROGRESSIVA DO MECANISMO (build animado, peça por peça)
O MESMO diagrama entra coluna por coluna / passo por passo, por CLIQUES dentro de UM slide (o build de animação). É a aplicação do clique-a-clique. **Um único slide do deck, vários cliques, NÃO um slide por passo.** Render: `conteudo`/`mao` (anotar o build na `nota`: *"revelar passo a passo por clique, mesma tela"*).
- **EXEMPLO de outro nicho (gestão):** o slide dos *"4 PASSOS"* revelado por clique 1 → 1+2 → 1+2+3 → completo (a numeração s.66-69 do PDF-referência são os ESTADOS de animação do mesmo slide ao longo dos cliques, não 4 slides distintos) · o mega-mapa "Jornada Gestão Ágil 2.0" entrando fase por fase no mesmo quadro. **(O mega-blueprint de 7 fases × 7 passos é o oposto de baixa complexidade, referência do que NÃO copiar no Soft.)**
- **Porquê:** revelar tudo de uma vez é spoiler e mata a curiosidade; peça por peça sincroniza com a fala, mantém open loop a cada item e faz o método parecer engenheirado (justifica preço premium).
- **Soft:** revelar os passos do método do usuário, **SIMPLES**. O build serve à curiosidade e à robustez honesta, **nunca** a inflar complexidade artificialmente.

### Arquétipo 16, SLIDE-MANIFESTO / FRASE-TESE (o bordão repostável)
Frase curta de alto impacto, 1 palavra em cor (amarelo = a tese; verde = ganho), às vezes sobre foto atmosférica. Picos conceituais. Render: `frase` (`corpo`).
- **EXEMPLO de outro nicho (gestão):** s.52 *"Não tente resolver problemas do século XXI com ferramentas do século XIX."* · s.95 *"O gestor que prospera é aquele que enxerga a floresta além das árvores"* · s.157 *"QI contrata, QE promove"*.
- **Porquê:** o cérebro guarda **frases, não parágrafos**, a frase curta vira o ponto de fixação da crença e o ativo de marca que o lead repete. A cor isola o gatilho.
- **Soft:** os bordões-tese do usuário vão aqui, sozinhos, grandes, 1 palavra em cor, na voz do usuário. ⚠️ **NÃO fabricar uma Big Idea fixa**; o bordão-tese é construído com o usuário, nunca decalcado de outra marca. *(bordões-tese por tema: a definir com o usuário)*. Ver `exemplos-por-bloco/05-big-idea-domino.md`.

### Arquétipo 17, ANCORAGEM / STACK / QUEDA (a maquinaria da oferta, 4 sub-movimentos)
1. **Âncora externa alta:** s.294 *"Se quiser aprender isso na [escola de elite] vai desembolsar R$70mil"* (com print real do site).
2. **Stack-nota-fiscal (somado):** item + bônus com valor avulso de CADA → "Total" alto. **EXEMPLO de outro nicho (verbatim):** stack somado linha a linha, *Formação R$3.000 + Mentoria R$9.100 + módulo R$2.000 + módulo R$1.497 + R$997 = total R$16.594*. "Se aparecesse tudo de uma vez, era só uma conta. Empilhado ao vivo, é uma escada".
3. **Queda em degraus, valores RISCADOS na tela:** s.253-255 risca R$20k → risca R$10k → *"R$3.500"* → R$2.497 (riscado) → *"1.997 à vista"*.
4. **Redução ao ridículo (cost-per-day):** s.320 *"R$199 / 30 dias = R$6,63 por dia"* · s.321 *"R$6,63/dia ≈ um refrigerante (R$5,20)"*.
Render: `investimento`/`oferta` (títulos verdes automáticos = luz verde pra comprar) + `prova` (número-gigante do cost-per-day).
- **Porquê:** o preço não tem valor absoluto, é julgado por **contraste**. Âncora externa recalibra a régua; o stack vira a nova âncora; riscar AO VIVO dramatiza a economia; a redução ao ridículo pulveriza a última objeção financeira.
- **Soft:** estrutura universal, qualquer ticket usa exatamente isso. ⚠️ **stack REAL** (bônus de verdade, valores defensáveis, a primeira pessoa que questiona um valor inventado derruba a oferta inteira). Reduzir ao ridículo funciona em qualquer ticket (R$3k ÷ 365 ≈ R$8/dia). Slide-mestre da oferta **fixo na tela** durante o fechamento. Ver `exemplos-por-bloco/09-oferta-stack.md` e `10-ancoragem-preco.md`.

### Arquétipo 18, ESCASSEZ / URGÊNCIA + FAQ + CTA (o fechamento)
Escassez por TEMPO ("só HOJE / só quem ficou") + por QUANTIDADE ("15 primeiros recebem bônus") com mecanismo verificável → FAQ matador-de-objeções → CTA/contato → retorno ao slide-oferta. Render: `fechamento`/`secao`/`frase`.
- **EXEMPLO de outro nicho (gestão):** s.256-257 *"OFERTA EXCLUSIVA disponível somente HOJE / só pra quem ficou até o final"* · s.265 *"15 PRIMEIROS… AGORA / NESTA AULA"* · s.323 FAQ *"Tem pré-requisito? Não. Suporte? Sim. Acesso? 12 meses. Pagamento? Cartão, PIX, Boleto"*.
- **Porquê:** escassez/urgência → aversão à perda → FOMO, que vira "depois eu decido" em "agora ou nunca". Cada objeção racional não respondida é um freio no clique; o FAQ remove uma a uma e libera a decisão emocional já tomada.
- **Soft:** FAQ mata as objeções REAIS do avatar. Escassez **honesta** (turma real, prazo real, mecanismo verificável, escassez falsa funciona uma vez e queima a marca). O canal de contato humano captura indecisos pro **comercial 1:1 da esteira** (faz-sozinho → faço-com → faço-por). Ver `exemplos-por-bloco/11-garantia.md`, `12-escassez-urgencia-cta.md`, `13-qa-objecoes.md`.

---

## 3. MAPA, cada bloco do roteiro → arquétipo(s) de slide

O deck é um **ADMA visualizado**: cada bloco do roteiro vira uma faixa de slides com arquétipos característicos. Sem percentual fixo: **o peso ensino/oferta segue a consciência do público, cravada na entrevista** (baixa consciência = mais diagnóstico; altíssima = mais mecanismo); o fechamento pesa quase tanto quanto o conteúdo, nunca encurtar. Esta seção mapeia em granularidade de FASE; o **`template-72-slides.md` dá a granularidade beat-a-beat** (os 72 slides na ordem-lei), gere o roteiro, projete nos 72 beats, renderize com os arquétipos abaixo.

### Pré-início / boas-vindas → **Capa(2) + Respiro(1) + a pergunta fixa**
Slide 1 = boas-vindas com **a pergunta da dor fixa** (segura quem chega atrasado). Promessa grande + imagem logo depois. Tipos: `capa`, `frase`.

### ATENÇÃO (abertura + posicionamento) → arquétipos **2 · 1 · 3 · 4 · 16 · 5 · 6 · 7 · 8**
Capa/Big-Idea → Respiro → **Autoridade empilhada(3)** (empresa antes da pessoa, só prova real) → **Origem(4)** (fracasso → virada → autoridade) → **Manifesto-tese(16)** (bordão-tese do usuário) → **Dicotomia semafórica(5)** (vermelho=medo, verde=desejo; medo primeiro) → **Contrato com loops(6)** → **Retenção "presente pra quem ficar"(7)**. **Semear o preço cedo.** Tipos: `capa`, `frase`, `prova`, `conteudo`, `mao`.

### DIAGNÓSTICO (prova da tendência + dor) → arquétipos **9 · 8 · 10 · 1 · 11 · 16 · 5**
**Print-de-mídia empilhado(9)** (grifo + seta no trecho que importa) → **Número-gigante de tendência(8)** → **Ensino/diagrama do problema(10)** → **Storytelling de dor(11)** (2ª pessoa, **1 cena por slide**, escala até o clímax) → **Respiro preto(1)** que vira a chave. **Primeiro o vácuo (dor), depois o método.** Tipos: `prova`, `conteudo`, `frase`. Nota de voz: respeitar a anti-voz do usuário (termos que ele não usa).

### DIAGNÓSTICO→MECANISMO (ensino / mecanismo único) → arquétipos **15 · 10 · 14 · 13 · 16 · 1**
**Reveal progressivo do framework(15)**, peça por peça, mas **SIMPLES** (ilusão de simplicidade, não mega-diagrama de consultoria) → **Ensino visual(10)** → **Demo-de-ferramenta(14)** = *motor subordinado, nunca bandeira* → **Mockup(13)** → Manifesto → Respiros. Fase mais longa. Tipos: `conteudo`, `mao`, `frase`, `prova`.

### MECANISMO (clímax + recap + pivô + prova + objeção #1) → arquétipos **15 · 16 · 12 · 5 · reframe**
Selo "vale ouro" → **Recap cumulativo (yes-ladder)** → future-pacing de identidade → 1º frame da oferta (virada de paleta pra premium) → micro-compromisso "Sim, eu quero" → **Prova/documento empilhada(12)** (sobe na escala de credibilidade: print de sistema oficial > depoimento; grifar só a frase lida) → **reframe da objeção #1** do avatar do usuário. Tipos: `frase`, `oferta`, `prova`, `conteudo`.

### MECANISMO (tour do produto / value stack) → arquétipos **10 · 13**
Jornada/escada do produto → **Mockup-de-módulo(13)** → print real da plataforma → certificado **"Seu Nome Aqui"** (posse antecipada). Tipos: `mao`, `oferta`.

### AÇÃO (ancoragem + stack + queda + bônus + FAQ + CTA) → arquétipos **17 · 18**
Pergunta-de-preço (respiro) → **Ancoragem externa alta(17)** → **Stack-nota-fiscal(17)** (soma item+bônus → total alto) → **Queda em degraus RISCADA(17)** → bônus com escassez condicional → **Redução ao ridículo(17)** (preço ÷ dias ≈ objeto trivial) → **FAQ matador(18)** → **CTA/contato(18)** → **slide-oferta fixo na tela**. Tipos: `investimento`, `oferta`, `fechamento`, `prova`, `frase`.

> **Calibragem Soft (baixa complexidade):** modela as fases (peso pela consciência do público; fechamento nunca encurta), mas **não persegue 325 slides**, persegue o **RITMO** (troca frequente + respiro preto em TODA virada de fase), com deck mais enxuto. A contagem alta é *consequência* do ritmo, nunca meta.

---

## 4. DECK COMO JSON, um exemplo de cada tipo

Esqueleto mínimo de um webinário (nicho genérico, anonimizado). A copy completa de cada slide está na `nota`; a tela é mínima.

```json
[
  {
    "tipo": "capa",
    "rotulo": "WEBINAR AO VIVO",
    "titulo": "[Big Idea / transformação-mãe do avatar]",
    "sub": "Como [transformação-mãe do avatar] sem [a complexidade que ele teme]",
    "nota": "Boas-vindas. Pergunta da dor fixa enquanto a sala enche: 'Você sente que faz tudo certo e mesmo assim continua [dor]?' Apresento a promessa grande. [TODA a copy de abertura aqui, invisível à plateia.]"
  },
  {
    "tipo": "prova",
    "rotulo": "QUEM FALA",
    "numero": "+1.200",
    "titulo": "pessoas que aplicaram o método",
    "fonte": "resultados reais de alunos · [ano]",
    "nota": "Autoridade empilhada (arquétipo 3): primeiro a instituição, depois eu. SÓ PROVA REAL, nunca inventar número. Se falta escala, compenso com profundidade (1 caso detalhado). [copy de autoridade aqui.]"
  },
  {
    "tipo": "frase",
    "rotulo": "A TESE",
    "corpo": "[bordão-tese do usuário]…",
    "nota": "RESPIRO + MANIFESTO (arquétipos 1 e 16). Tela quase vazia, 1 frase, reticência abre open loop. Bordão na VOZ DO USUÁRIO. [copy da virada aqui.] OBS: usar o bordão-tese construído com o usuário, nunca fabricar nem decalcar de outra marca."
  },
  {
    "tipo": "conteudo",
    "rotulo": "DUAS ESTRADAS",
    "titulo": "Existem dois tipos de [avatar]",
    "itens": [
      { "titulo": "Os que ficam para trás", "texto": "[medo/perda, código vermelho]" },
      { "titulo": "Os que se tornam procurados", "texto": "[desejo/segurança, código verde]" }
    ],
    "nota": "Dicotomia semafórica (arquétipo 5). MEDO PRIMEIRO (aversão à perda). Revelar item a item por clique. Cor: vermelho=risco, verde=ganho. [copy da dicotomia aqui.]"
  },
  {
    "tipo": "conteudo",
    "rotulo": "O MÉTODO",
    "titulo": "3 passos + o motor",
    "itens": [
      { "titulo": "Passo 1, [nome]", "texto": "[o quê, sem o COMO executável]" },
      { "titulo": "Passo 2, [nome]", "texto": "[idem]" },
      { "titulo": "Passo 3, [nome]", "texto": "[idem]" }
    ],
    "nota": "MECANISMO ÚNICO via reveal progressivo (arquétipo 15), peça por peça, SIMPLES (ilusão de simplicidade), NÃO mega-diagrama. Revelar por clique. (nome do framework: a definir com o usuário.) [copy de ensino aqui, filtra, não convence: mostra o quê e o porquê, nunca o passo-a-passo executável.]"
  },
  {
    "tipo": "mao",
    "rotulo": "NA PRÁTICA",
    "titulo": "A ferramenta é o seu estagiário",
    "sub": "Você comanda. Ela executa.",
    "itens": [
      { "titulo": "Prompt", "texto": "[o que você pede]" },
      { "titulo": "Resultado", "texto": "[a saída rica e contextual]" }
    ],
    "nota": "Demo-de-ferramenta (arquétipo 14). REGRA-OURO: a ferramenta é o MOTOR, nunca a bandeira. Ela serve ao resultado do avatar, não vira o herói do deck. Reframe 'estagiário de QI alto, VOCÊ comanda'. [copy da demo aqui.]"
  },
  {
    "tipo": "prova",
    "rotulo": "PROVA",
    "numero": "+460%",
    "titulo": "de aumento, documento oficial",
    "fonte": "print de sistema verificável (grifo + seta)",
    "nota": "Prova/documento (arquétipo 12). Sobe na escala: print de sistema oficial > depoimento. Empilhar 4-6 casos (quem tinha muito E quem tinha pouco). Em depoimento, ler SÓ a frase grifada. [copy da prova aqui.]"
  },
  {
    "tipo": "oferta",
    "rotulo": "O QUE VOCÊ LEVA",
    "titulo": "Vamos recapitular",
    "itens": [
      { "titulo": "Método completo", "texto": "valor R$ 3.000" },
      { "titulo": "Bônus 1, [entregável]", "texto": "valor R$ 1.500" },
      { "titulo": "Bônus 2, [entregável]", "texto": "valor R$ 900" }
    ],
    "nota": "RECAP/STACK (arquétipos 13 e 17, mockup/tour + ancoragem/stack), slide EXTREMAMENTE importante. Revelar UM componente por clique, nomeando o valor de cada, ANTES do preço. Stack REAL (bônus de verdade, valores defensáveis). [copy do recap aqui.]"
  },
  {
    "tipo": "investimento",
    "rotulo": "O INVESTIMENTO",
    "titulo": "De R$ 17.288 por…",
    "itens": [
      { "titulo": "Valor total do stack", "texto": "R$ 17.288 (riscado)" },
      { "titulo": "Hoje, nesta aula", "texto": "12x de R$ 199, ou R$ 1.997 à vista" }
    ],
    "nota": "ANCORAGEM + QUEDA EM DEGRAUS (arquétipo 17). Âncora externa alta primeiro, stack vira nova âncora, riscar AO VIVO (degraus). Verde = luz verde pra comprar. Manter slide-mestre da oferta FIXO durante o fechamento. [copy de preço aqui.]"
  },
  {
    "tipo": "prova",
    "rotulo": "FAZ AS CONTAS",
    "numero": "R$ 6,63",
    "titulo": "por dia, menos que um refrigerante",
    "fonte": "R$ 199 ÷ 30 dias",
    "nota": "REDUÇÃO AO RIDÍCULO (arquétipo 17). Preço ÷ dias vs. objeto trivial, pulveriza a última objeção financeira. Funciona em qualquer ticket. [copy aqui.]"
  },
  {
    "tipo": "secao",
    "rotulo": "ATENÇÃO",
    "corpo": "Só para quem ficou até agora…",
    "nota": "ESCASSEZ HONESTA (arquétipo 18). Tempo (somente hoje) + quantidade (15 primeiros) com mecanismo VERIFICÁVEL. Escassez falsa queima a marca, turma real, prazo real. [copy de escassez aqui.]"
  },
  {
    "tipo": "fechamento",
    "rotulo": "PERGUNTAS FREQUENTES",
    "titulo": "Antes de você decidir",
    "itens": [
      { "titulo": "Tem pré-requisito?", "texto": "Não." },
      { "titulo": "Tenho suporte?", "texto": "Sim, [como]." },
      { "titulo": "E se não for pra mim?", "texto": "[garantia / reversão de risco]" }
    ],
    "nota": "FAQ MATADOR + CTA (arquétipo 18). Matar as objeções REAIS do avatar. O canal de contato humano captura indecisos para o COMERCIAL 1:1 da esteira (faz-sozinho → faço-com → faço-por). Slide-oferta volta fixo na tela. [copy do fechamento + CTA aqui.]"
  }
]
```

---

## 5. A REGRA DE OURO (a copy vai na nota, o slide é mínimo)

1. **A copy falada mora no campo `nota`.** Sempre. O slide visível recebe só o reforço (1 frase / 1 número / 1 imagem-conceito).
2. **Pergunta-teste:** se o slide pode ser narrado lendo o que está nele → está errado. Mova o texto pra `nota`.
3. **1 ideia por slide.** Emoção/virada → tela quase vazia (`frase`/`secao`). Prova/referência → pode ser densa (`prova`, print).
4. **Respiro preto em TODA virada de fase** (`frase`/`secao`), impede o webinário de 90-120 min de virar parede de informação.
5. **A ferramenta é o motor, nunca a bandeira.** Nunca no título/tese. Aparece só como alavanca subordinada na fase de ensino.
6. **Imagem literal do conceito:** ao dizer uma palavra concreta ou metáfora, mostra a imagem dela, uma por ideia (dupla codificação). No JSON, anote a imagem pretendida na `nota`.
   > **EXEMPLO de outro nicho (emprego):** o apresentador diz *"você precisa ser como um sniper que mira a vaga certa"* e bota na tela a foto de um sniper; mais à frente *"seu currículo é o trailer do filme da sua carreira"* e mostra uma imagem de cinema. Uma imagem por conceito, a frase entra pelos olhos, não só pelo ouvido.
7. **Toda lista/framework/recap → animação clique-a-clique DENTRO DO MESMO SLIDE** (revelar item a item conforme a fala, a pilha crescendo na MESMA tela; nunca a lista aberta de cara, e **nunca um item por slide**). Anotar na `nota`. Por isso, **organize todo conteúdo em listas ou passos**, só a lista te dá o gancho pra revelar item a item; parágrafo corrido não anima.
   > **⚠️ A confusão a NÃO cometer: 1 SLIDE = 1 ASSUNTO, não 1 item.** A lista de um assunto vive num slide SÓ; cada item é um CLIQUE (entrada de animação), não um slide novo. ❌ ERRADO: a stack "sem A / sem B / sem C" virar 3 slides (um "sem" em cada). ✅ CERTO: **1 slide** (`tipo: conteudo`) com os 3 itens na ordem da fala + nota *"revelar item a item por clique (mesma tela)"*, e o player aplica a entrada item a item. No JSON isso é UM objeto de slide com o array `itens` completo, NUNCA um objeto por item. Slide novo só na próxima IDEIA/assunto da aula. Quando esta reference fala "1 cena por slide" ou mostra um build "1 → 1+2 → 1+2+3", isso é o MESMO slide animando por cliques (ou, no muito macro, a mesma cena), não o roteiro picotado em um item por arquivo de slide.
   > **Por que (dopamina):** *"quando o cérebro humano cria expectativa sobre algo, ele se encharca de dopamina."* Se você mostra "essa parte tem cinco benefícios" com os cinco já visíveis, a pessoa lê em 3 segundos, "acabou a expectativa, ela JÁ LEU o final, você se matou sozinho". Revelando por clique, cada item fecha uma curiosidade e abre a próxima.
   > **EXEMPLO de outro nicho (comportamento animal):** a jornada "passo 1, passo 2, passo 3" pra transformar o gato bagunçado no gato dos sonhos: fala do passo 1, clica, aparece; fala do passo 2, clica, aparece. Mesmo princípio do recap da oferta, só muda o nicho.
8. **O recap da oferta é o slide mais importante do deck, empilha por clique.** Cada componente aparece nomeando o valor de cada um, ANTES do preço, e a pessoa vê o valor CRESCENDO ("e tem mais… e ainda isso…"). Se o stack aparecesse inteiro, achatava; empilhado ao vivo, vira uma escada. Ver Arquétipo 17 e `exemplos-por-bloco/09-oferta-stack.md`.

9. **Regra de ouro do render (re-gate ao condensar).** Esta reference crava que o deck "não reescreve copy", só amplifica. Mas o texto VISÍVEL do slide (a 1 frase / 1 número / 1 imagem-conceito do reforço) é uma **condensação NOVA** que o lead LÊ, não a fala original. Então: a copy-visual de cada slide passa pelo gate do Crivo ANTES de desenhar (`shared-references/crivo/03-gate-cub.md`: CUB, as 3 perguntas do Harry no título de cada slide-chave, anti-vazamento, prova no CTA) + `python3 scripts/lint_copy.py`. Depois de aprovada, o render **não muda palavra**; se condensar/reescrever o texto de tela ou o layout exigir mexer, **re-passa a ancoragem e a headline pelo `03-gate-cub.md` antes de exportar** (o render não muda palavra sem re-gate). Sem prova real no perfil, número sai como placeholder marcado, nunca inventado.

> **Sobre energia de ao vivo (gravado ou não):** o ritmo de troca de slide É a energia de evento. *"Se você abrir a aula e ficar falando, falando, e não parar pra trocar de slide como se estivesse ao vivo, ferrou, você perde a sala"*. Slide parado = tela morta = aba fechada = não-compra. (Mecânica de gravação detalhada em `gravacao-energia-ao-vivo.md`.)

---

## 6. DOIS CAMINHOS DE SAÍDA (portabilidade)

A skill roda tanto no Claude **Code** quanto no Claude **Chat**. O deck sai dos dois, só muda o motor.

### Caminho A, Claude CODE (gera `.pptx` via `deck_gen.py`)
1. Monta o **array JSON** no schema da Seção 1 (copy na `nota`, tela mínima).
2. Escreve em `deck.json`.
3. Roda o build:
   ```bash
   python3 scripts/deck_gen.py deck.json saida.pptx
   ```
4. Entrega o `.pptx` (ID visual Soft já aplicado). O player abre no PowerPoint/Google Slides e adiciona a **animação clique-a-clique** nas listas e o **quadro da câmera** (reservar a zona do vídeo do apresentador, apagar no fim), passos manuais que o `.pptx` não automatiza.

### Caminho B, Claude CHAT (descreve os slides e gera o PDF direto)
Não há acesso a `deck_gen.py` nem a shell. Então:
1. **Descreve cada slide** seguindo o mesmo mapa de arquétipos e a mesma regra de ouro, para cada slide: `tipo`/arquétipo, o **reforço visível** (1 frase/número/imagem) e a **copy nas notas**.
2. Aplica na descrição o **ID visual Soft** (fundo preto, título display, verde=ganho/comprar, vermelho=medo, números gigantes na prova) para o player conseguir reproduzir.
3. **Gera o PDF direto** (renderizando a descrição como deck), entregando o documento pronto, sem passar por `deck_gen.py`.
4. Marca os mesmos slots `(nome a definir com o usuário)` e as mesmas notas de animação clique-a-clique.

> Os dois caminhos produzem o **mesmo deck conceitual**. A única diferença é o motor de render (`python-pptx` vs. PDF direto). A inteligência (mapa de arquétipos, copy-na-nota, ritmo, ancoragem na oferta) é idêntica.

---

## 7. CHECKLIST "QUASE PERFEITO"

**Densidade**
- [ ] Nenhum slide passa na pergunta-teste ("dá pra narrar lendo a tela"). Copy toda na `nota`.
- [ ] Slides de emoção/virada = tela quase vazia (`frase`/`secao`). Slides densos só os de prova.
- [ ] Calibragem **baixa complexidade**: framework SIMPLES, sem mega-diagrama de consultoria (ilusão de simplicidade).

**Hierarquia**
- [ ] 1 ideia por slide. Número-gigante quando o número é a manchete (`prova`).
- [ ] Cor com significado fixo: preto=respiro · verde=ganho/comprar · vermelho=medo/perda · (amarelo=tese · laranja=urgência onde o render permitir).
- [ ] Listas com `itens` na ordem da fala + nota "revelar por clique" → **1 objeto de slide por lista** (NÃO um slide por item). 1 slide = 1 assunto; item da mesma lista = clique, nunca slide novo.

**Ancoragem visual na oferta**
- [ ] Stack e preço nos tipos `oferta`/`investimento` (títulos verdes automáticos).
- [ ] Sequência de preço completa: âncora externa → stack-nota-fiscal → queda riscada em degraus → redução ao ridículo (÷ dias vs. objeto trivial).
- [ ] Slide-mestre da oferta **fixo na tela** durante FAQ/fechamento.
- [ ] Stack/bônus/números/escassez **REAIS**, nada inventado.

**Ritmo**
- [ ] Respiro preto (`frase`/`secao`) em **TODA virada de fase**.
- [ ] Troca frequente de estímulo (1 imagem nova por conceito), ritmo Netflix, não contagem-alvo.
- [ ] Distribuição das fases coerente com a consciência do público (entrevista); fechamento NÃO encurtado.
- [ ] Primeiro o vácuo (dor) → depois o método. Nunca ensinar antes de criar a dor.

**Guarda-corpos (inegociáveis)**
- [ ] Ferramenta nunca como bandeira/título; número/prova/bônus nunca inventados; escassez nunca falsa; Big Idea fixa nunca fabricada (o bordão-tese é construído com o usuário, nunca decalcado de outra marca).
- [ ] Voz do usuário; bordões-tese do usuário; respeitar a anti-voz (termos que ele não usa).
- [ ] Slots `(nome a definir com o usuário)` marcados, não inventados (título/Big-Idea por webinário; polos da encruzilhada "sozinho × comigo"; nome do framework do método; bordões-tese).
- [ ] Lançar **funcional primeiro**; o "bonito" é hipótese a testar com dado, nunca segura o webinário.
