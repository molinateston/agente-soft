# Template dos 72 slides: o ESQUELETO-LEI do deck

Esta reference é o **esqueleto slide a slide** do webinário: os **72 beats, na ordem, com a função de cada um, o que entra na TELA vs na NOTA, e um exemplo instanciado de cada beat**, destilados do template real (com as direções de palco embutidas no próprio texto dos slides), agora cruzados com o corpus de 9 webinars que venderam. É a ponte física entre o roteiro e a tela: o `estrutura-webinario-aida.md` diz **o que falar e em que ordem** (blocos, falas, tempos); esta reference diz **em quantos e quais slides essa fala se projeta e o que vai escrito onde**; o `geracao-de-slides.md` diz **como renderizar** cada beat (arquétipos, JSON do `deck_gen.py`, copy na nota).

> **A ordem dos 72 beats segue o SLIDE-MODELO.** A espinha canônica, bloco a bloco e com os templates de fala, é o `_webinar-corpus/slide-modelo/SLIDE-MODELO-SCRIPT.md`. Estes 72 beats são esse slide-modelo expandido em granularidade de TELA. Quando um beat aqui divergir do slide-modelo, **o slide-modelo ganha**.
>
> **Cada beat carrega TEMPLATE DE FALA + EXEMPLO (correção 10/jun).** A **NOTA** de cada beat É o template básico da fala (a copy falada, com slots `[ ]`, FIEL ao template do slide-modelo); o campo **EXEMPLO** é esse template já instanciado num nicho-modelo. **Não duplique a biblioteca**: cada beat APONTA pra `exemplos-por-bloco/NN` (ponteiro no início de cada bloco) e traz só a nota-template + um exemplo curto.
>
> Destilada de `guia/_webinar-corpus/templates/webinario-pro-MODELO-slides-72.md` (o modelo cru, slide a slide) + Anexo "72 slides" do `MANUAL-COMPLETO.md` (linha 2112+) + cap08 (montagem/dopamina) + a biblioteca `exemplos-por-bloco/` (falas verbatim de 9 campeões). Frases entre aspas marcadas **EXEMPLO** são **literais de webinars reais** (origem citada): premissa a extrair, NUNCA forma a decalcar (G2). Frases entre aspas SEM origem são **direções de palco literais do template**. Os preços, contagens e nomes do template (R$1.497 → R$497, "10 primeiras vagas", Cursos A/B/C, "gestor do futuro", "visão de floresta", "síndrome do Fantástico") são **EXEMPLO**: recheio a substituir pela realidade do nicho do usuário, nunca atribuídos como verdade.

---

## Índice

- 0. A LEI: esqueleto fixo, recheio do nicho
- 1. PRÉ-INÍCIO: slides 1–4 (a sala "começa" antes de começar)
- 2. ABERTURA: slides 5–13 (atenção + contrato + promessa sem o COMO)
- 3. PROBLEMA: slides 14–19 (primeiro o vácuo)
- 4. SOLUÇÃO: slides 20–26 (crença antes da prescrição)
- 5. TRANSIÇÃO DE VENDA: slides 27–34 (a plateia pede a oferta)
- 6. OFERTA: slides 35–65 (quase metade do deck, e é proposital)
- 7. FECHAMENTO: slides 66–72 (o pico emocional coincide com o botão)
- MAPA 72 BEATS ↔ ROTEIRO APSD ↔ BIBLIOTECA (a costura)
- CHECKLIST ao gerar um deck sobre este esqueleto

---

## 0. A LEI: esqueleto fixo, recheio do nicho

**Isto é o ESQUELETO-LEI.** A skill gera decks novos **mapeando o conteúdo do nicho sobre estes 72 beats, nesta ordem**. O recheio muda em TUDO (a promessa, a dor, o inimigo, o mecanismo, os números, os bônus, o preço); o esqueleto **não muda nunca**, nem a ordem, nem a presença dos beats. É a mesma régua-mãe do `premissas-e-guarda-corpos.md` e do `esqueleto-universal-e-discernimento.md`: **a peça é lei e universal; a fala é do avatar e sai de pesquisa real.**

Por que a ordem é lei (M4): cada beat deixa o lead num estado de consciência que é **pré-condição física** do beat seguinte, o micro-sim do slide 3 prepara o "EU QUERO" do 29, que prepara a permissão do 30, que prepara a oferta do 35+. Pular ou reordenar beats não "enxuga" o webinário: quebra a cadeia causal e a oferta chega num lead frio (G6).

> Prova de que o esqueleto é máquina, não improviso: no corpus, **o pré-início, a abertura e a transição da escola de gestão aparecem VERBATIM em edições diferentes, com hosts diferentes** (13M e 5 Níveis abrem lendo os MESMOS nomes, "Lilian, Caroline, Rodrigo, Ligia, Michel, Evelyn"). O beat é escrito UMA vez, bem, e roda em escala. É exatamente o que esta reference permite: gerar o esqueleto certo e preencher só o recheio.

### Como ler cada beat (a anatomia que se repete nos 72)

Cada beat abaixo traz quatro coisas, e é a presença das quatro que separa um deck bom de um genérico:

1. **Função**, o trabalho psicológico que o slide faz na cadeia (por que ele existe ali).
2. **TELA**, o reforço mínimo que a plateia VÊ (1 frase grande, 1 número, 1 imagem, 1 print). cap08: "dá pra eu simplesmente ler em voz alta o que está nesse slide? Se der, está errado." A tela não é o roteiro.
3. **NOTA**, a copy FALADA, que mora nas notas do apresentador (Presenter View), invisível pra plateia. É onde vai o exemplo instanciado.
4. **EXEMPLO**, um molde preenchido de um nicho real (com origem), pra a IA ver o beat instanciado e não inventar genérico. Onde o beat casa com a biblioteca, há um ponteiro `→ exemplos-por-bloco/NN-xxx.md`.

**Regras de uso ao gerar um deck novo:**
1. Percorra os 72 beats **na ordem**, preenchendo cada um com o recheio do nicho (pesquisa real do avatar, dor, inimigo, números, provas dele).
2. Um beat pode **expandir em mais de um slide físico** quando o conteúdo pede (o próprio template manda: jornada do programa = "quantos slides precisar"; provas em rajada). Pode-se *expandir* um beat; não se pode *suprimir* nem *reordenar*.
3. Toda lista na tela entra **animada, um item por clique, sincronizada com a fala** (cap08, regra da dopamina), NUNCA a lista aberta de uma vez. Isso vale pros bullets de fascination (S6), pros aprendizados (S26), pro stack (S52/S65). Por isso todo conteúdo vira lista ou passos.
4. Nomes de mecanismo, big idea, bordões, inimigo = **SLOTS** `(nome Soft: a definir com a mentoria)`, nunca fabricados e atribuídos como verdade. Os nomes dos exemplos (visão de floresta, síndrome do Fantástico, dieta burra) têm dono e ficam no exemplo.
5. Saída final: cada beat vira slide(s) no pipeline do `geracao-de-slides.md`, copy falada na `nota`, tela mínima, arquétipo certo por função.
6. **Regra de ouro do render (re-gate ao condensar).** A TELA de cada beat (1 frase / 1 número) não é a fala, é uma **condensação NOVA** que o lead LÊ. Não é "reescrever copy" inventando promessa, mas é texto de leitor. Então: SE condensar/reescrever o texto de tela (a frase grande, a dor batizada, o título de prova), **re-passa a ancoragem e a headline pelo `shared-references/crivo/03-gate-cub.md` antes de exportar** + `python3 scripts/lint_copy.py` (o render não muda palavra sem re-gate). Detalhe operacional em `geracao-de-slides.md` §5.

---

## 1. PRÉ-INÍCIO: slides 1–4 (a sala "começa" antes de começar)

**Premissa do bloco:** compliance progressiva (M4/M6). Ninguém dá um "sim" grande sem antes dar dois pequenos, então os primeiros minutos extraem micro-ações triviais (comentar o nome, responder a dor, autorizar o início) que treinam a plateia a obedecer ao apresentador. E quem chega não pode cair numa sala morta: depoimento rodando é prova social passiva trabalhando de graça. **O primeiro comportamento que a sala executa é digitar no chat**, é o hábito que será cobrado lá no "EU QUERO" (S29) e no link (S70).

→ Falas verbatim e anti-padrões: **`exemplos-por-bloco/01-pre-inicio.md`** (presente em 6/9 campeões; ausente nas gravações sem operador). Render: `capa`/`frase` (arquétipos 1–2). Roteiro: BLOCO 0 do `estrutura-webinario-aida.md`.

- **S1: Cronômetro de 5 min + depoimentos rodando em loop.**
  - *Função:* prova social passiva enquanto a sala enche; tempo morto vira pré-venda.
  - *TELA:* contador "Começamos em 4:32" + vídeos de depoimento em loop. *NOTA:* (vazia ou cumprimento solto, o apresentador ainda não entrou).
  - *EXEMPLO (gestão/curso ed.2.0, → bloco 01):* o loop roda dois alunos ANTES do host aparecer, uma designer ("eu conhecia Scrum, mas não sabia como começar… por meio de um webinar conheci a escola de gestão… não deixe pra depois") e um agrônomo ("estava desempregado na pandemia… em uma semana sete empresas do exterior me contataram"). Escolha depoimentos que JÁ CONTAM a tese: dor → método → resultado nomeado. *Porquê:* quem entra cedo marina em prova antes de ouvir uma palavra de venda.
  - *Slot Soft:* se o nicho NÃO tem banco de depoimentos em vídeo, não force, use cronômetro + capa da promessa; o loop é decisão de design, não obrigatório.

- **S2: "Sejam todos(as) bem-vindos(as)".**
  - *Função:* recepção humana, sinaliza que é ao vivo (ou "online, que legal" se gravado, cap08, o efeito de presença vem da condução, não da palavra "ao vivo").
  - *TELA:* "Bem-vindos!" + nome do evento. *NOTA:* saudação + check técnico como primeiro micro-compromisso.
  - *EXEMPLO (gestão/5 Níveis, → bloco 01):* "Coloca nos comentários aqui pra eu saber se está tudo bem, se está tudo funcionando. **Se ninguém colocar, eu não vou saber.** Ah, Lilian, perfeitamente. Caroline, Rodrigo, ouvindo." *Porquê:* o check de áudio é o "sim" mais barato da noite (custa zero responder "tá funcionando") e instala o padrão de que o chat responde ao host.

- **S3: "Comente seu nome e de onde está falando".**
  - *Função:* 1º micro-compromisso + sensação de sala cheia; o slide fica FIXO (cap08: quem chega atrasado bate o olho e já interage).
  - *TELA:* "Comente seu nome e de onde você fala 👇" (fixo). *NOTA:* o apresentador LÊ nomes em voz alta como recompensa instantânea.
  - *EXEMPLO (gestão/curso, → bloco 01):* "Tô vendo aqui que a galera tá entrando… tem bastante gente, muito bom." Ler nomes nos primeiros 60s ensina que comentar gera reconhecimento. *Porquê:* quem digitou uma vez digita de novo, inclusive na hora do "sim eu quero".

- **S4: "Como está hoje em relação ao seu problema?" + "quem sair não volta mais" + "posso começar?".**
  - *Função:* dor declarada pelo próprio lead (o "é exatamente isso" começa aqui), 1ª escassez de sala e o 2º micro-sim (autorização pra começar).
  - *TELA:* a pergunta de dor, grande. *NOTA:* eco das dores que aparecem no chat + pedido de permissão.
  - *EXEMPLO (emprego/LinkedIn, citado em cap08):* "o que você acha que está te impedindo de conseguir emprego? [bebe uma água] o Cláudio disse oportunidade, a Andrea disse a idade… eu já passei dos 40, sei bem o que vocês estão passando." *Porquê:* a dor confessada no chat é auto-diagnóstico, o apresentador não precisa convencer ninguém de que tem problema; e o eco + identificação ("sei bem o que vocês passam") humaniza antes de uma linha de venda.

## 2. ABERTURA: slides 5–13 (atenção + contrato + promessa sem o COMO)

**Premissa do bloco:** a atenção é canal único e a promessa vem ANTES da autoridade (M2/M3/M5). O lead só concede 60 minutos se a aula for posicionada como **nova oportunidade** com benefício explícito e sem a maior objeção dele, e fica até o fim porque há presente anunciado. "Quem sou eu" só entra DEPOIS da promessa: autoridade serve à promessa, nunca a abre. Achado-mãe do corpus: **o último objetivo da agenda é sempre a promessa do PRODUTO disfarçada de objetivo da aula**, abertura e oferta são o mesmo texto em dois tempos.

→ Falas verbatim: **`exemplos-por-bloco/02-abertura-atencao.md`** (9/9). Roteiro: blocos 1.1–1.8 (ATENÇÃO). Render: `capa`, `conteudo`, `prova`, `frase`.

- **S5: Título da aula: "Como ter [PRINCIPAL BENEFÍCIO] em [X tempo] sem [MAIOR OBJEÇÃO]".**
  - *Função:* a promessa-mãe (slot por nicho); o destino. cap08: vai GRANDE, com imagem forte, domina a tela.
  - *TELA:* o título, enorme, sobre imagem do estado-depois. *NOTA:* o apresentador anuncia o tema e jura cumprir.
  - *EXEMPLO (gestão/curso):* "Como organizar seus projetos com gestão ágil e se tornar uma referência em gestão na sua área… essa é a grande promessa da aula de hoje e **eu vou cumpri-la com certeza**." O juramento cria critério de sucesso que ele dá baixa no recap (S26).
  - *Molde Soft preenchido (EXEMPLO de nicho, odontologia/dentista, didático):* "Como lotar a agenda do seu consultório em 90 dias sem depender de convênio." → benefício = agenda cheia; tempo = 90 dias; objeção = "preciso aceitar convênio". *Slot:* o título real sai da pesquisa de avatar do nicho do usuário.

- **S6: Fascinations: 3–5 bullets do que será visto.**
  - *Função:* open loops de curiosidade, NUNCA a lista que entrega tudo (G8). Entram um por clique (dopamina).
  - *TELA:* 3–5 bullets de curiosidade (animados). *NOTA:* o apresentador abre cada loop sem fechá-lo.
  - *EXEMPLO (molde, nicho gato/comportamento animal, citado em cap08):* "Você vai descobrir: (1) o erro de carinho que faz seu gato te arranhar; (2) os 3 passos pra transformar o gato bagunceiro no gato dos sonhos; (3) por que punir piora tudo." *Porquê:* bullet é promessa de descoberta, não a descoberta, se entregar a resposta no bullet, mata a expectativa que segura a sala.

- **S7: "Pra quem serve": 3–5 avatares identificados PELA DIFICULDADE.**
  - *Função:* o lead se reconhece e baixa a guarda.
  - *TELA:* 3–5 perfis ("Pra você que…"). *NOTA:* descreve cada perfil pela dor, não pela demografia.
  - *EXEMPLO (molde, nutrição, pele Soft/Vítor, → blocos 02/04):* "Pra você que já fez 5 dietas e recuperou tudo; pra você que treina e não muda; pra você que vive de segunda a segunda começando 'na segunda'." *Porquê:* identificação pela dificuldade ("eu já fiz 5 dietas") é mais forte que por categoria ("mulheres de 30-40"), o lead se vê no espelho.

- **S8: Presentes pra quem ficar até o final (3–5 + presente-surpresa).**
  - *Função:* gancho de retenção concreto, razão racional pra atravessar o pitch inteiro. O loop fecha em S64/escassez.
  - *TELA:* lista de presentes, com o último marcado "SURPRESA". *NOTA:* promete sem revelar.
  - *EXEMPLO (gestão/5 Níveis):* "Vai ter presente só para os guerreiros e as guerreiras que ficam até o fim… **eu não vou falar o que é**, porque eu quero realmente que vocês fiquem até o final." *Porquê:* o presente-mistério cria custo de saída crescente, quem investiu 1h não sai a 10 min do prêmio, e o "final" é exatamente onde mora o pitch.

- **S9: "Nos próximos 60 minutos preciso da sua atenção total. Posso contar?".**
  - *Função:* contrato explícito de tempo e foco; mais um micro-sim.
  - *TELA:* "Posso contar com sua atenção pelos próximos 60 min?". *NOTA:* pede o compromisso e (se houver) avisa que não responde 1:1.
  - *EXEMPLO (gestão/GA 2.0):* "Vamos todo mundo interagir junto. Beleza?" + a regra honesta: "tem muita gente, eu não vou conseguir responder individualmente… mas a equipe está monitorando." *Porquê:* libera o host de responder todos SEM esfriar a sala (a equipe cobre) e formaliza o contrato de interação.

- **S10: PROPOSIÇÃO ÚNICA: "te ensinar por que ___ é a oportunidade para conseguir ___ sem precisar ___ mesmo que ___".**
  - *Função:* a oferta inteira em UMA frase, a big idea operacionalizada (slot). É o gancho que o conteúdo vai provar.
  - *TELA:* a frase única, grifada. *NOTA:* o apresentador a declara devagar e manda registrar.
 - *EXEMPLO (gestão/curso, → bloco 05):* "tudo isso é possível aprendendo gestão ágil - **vamos grifar aqui: gestão ágil**." (a oportunidade = gestão ágil; o conseguir = ser valorizado; o sem = sem trocar de empresa; o mesmo que = mesmo sendo CLT). *Porquê:* a decisão de compra vira um sim/não sobre UMA frase só. *Slot:* o "por que ___" é o nome do mecanismo/big idea, `(nome Soft: a definir com a mentoria)`.

- **S11: Mundo ideal: 4–5 "benefício sem objeção".**
  - *Função:* future pacing inicial, incentiva o sonho; cada cenário pede confirmação no chat.
  - *TELA:* 4–5 cenários do estado-depois (animados). *NOTA:* "Imagina você…" em série, com micro-isca de dor.
  - *EXEMPLO (gestão/curso, → bloco 05):* "Imagina você ter domínio total do seu tempo… **quem aqui tem problema com gestão de tempo coloca aqui pra eu saber**… Imagina você liderar uma equipe engajada e autônoma… Imagine ter metas superadas." *Porquê:* o desejo é ensaiado ANTES da tese, e cada "imagina" confirmado no chat vira compromisso público, o querer fica auditado.

- **S12: Depoimento-relâmpago em print.**
  - *Função:* a transformação EXISTE, antes mesmo da autoridade. cap08: prova entra como IMAGEM (print real), grifa só a frase de impacto.
  - *TELA:* print real (WhatsApp/portal) com a frase grifada e seta. *NOTA:* lê SÓ a frase grifada, não o depoimento todo.
  - *EXEMPLO (emagrecimento, citado em cap08):* print do WhatsApp da aluna, balão inteiro visível, mas o apresentador lê só o trecho grifado: "perdi 8kg". *Porquê:* o print inteiro prova que é real; o grifo foca o olho no ponto que sustenta o argumento.

- **S13: "Quem sou eu": autoridade por resultados e credenciais, DEPOIS da promessa.**
  - *Função:* autoridade a serviço da promessa; ordem empresa→pessoa→cicatriz. cap08/corpus: **cicatriz antes do troféu**, e a cicatriz É o estado atual do avatar.
  - *TELA:* números (alunos, anos, mídia) + foto. *NOTA:* credenciais → cicatriz que espelha a dor da sala.
  - *EXEMPLO (gestão/curso, → bloco 03):* "minha primeira posição de gestão foi em 2006 no Santander… deu tudo errado, quase perdi o emprego… eu era aquela frase: **perdemos um bom técnico e ganhamos um péssimo líder**. esse era eu." *Porquê:* a cicatriz idêntica ao perfil da sala (técnico promovido sem saber liderar) faz a autoridade dizer "eu fui você" em vez de distanciar.
  - *Nota de máquina (→ bloco 03):* a escola de gestão ainda **planta a âncora de preço aqui** ("o curso vale R$3.000, o MBA R$12.000") como fato neutro de catálogo, 90 min antes da oferta, assim a ancoragem do pitch parece informação, não manobra. *Slot Soft:* a cicatriz tem que ser de DONO de negócio, não de empregado.

## 3. PROBLEMA: slides 14–19 (primeiro o vácuo)

**Premissa do bloco:** sem dor reconhecida não há canal pra solução (M4), e a dor só pode crescer **sem culpar o lead** (M7). A sequência é cirúrgica: diagnóstico → causa raiz → demolição das soluções velhas → consequência que dói → e o pivô-mãe: "não é culpa sua, é culpa DELES" (inimigo concreto e nomeável). A guarda baixa no exato momento em que a culpa sai do lead. O diagnóstico nunca é afirmado na palavra do vendedor: vem com lastro (pesquisa, dado, print de terceiro).

→ Falas verbatim: **`exemplos-por-bloco/04-problema-interesse.md`** (9/9, o melhor achado: transferência de culpa completa, nome + mecanismo + motivo econômico do vilão). Roteiro: blocos 2.1–2.6 (DIAGNÓSTICO). Render: `conteudo`, `prova`, `frase`.

- **S14: O problema do mundo atual e suas consequências.**
  - *Função:* diagnóstico, em 3ª pessoa e concreto, com lastro.
  - *TELA:* a dor batizada (1 frase) + dado/pesquisa. *NOTA:* nomeia a dor com âncora memorável e pede confissão.
  - *EXEMPLO (gestão/curso, → bloco 04):* "o que é síndrome do Fantástico? é quando começa a musiquinha do Fantástico… quem que tem é quem não gosta do trabalho, quem se sente mal na segunda-feira." + lastro: "a gente tem umas 880.000 respostas nessa pesquisa." *Porquê:* a dor com nome memorável gruda, e a pesquisa gigante transforma "papo de vendedor" em estatística. *Slot:* cada nicho batiza a própria dor (a "síndrome do Fantástico" é da escola de gestão).

- **S15: "E por que isso acontece?": causa raiz.**
  - *Função:* o modelo causal que torna a dor inteligível, e desloca a culpa pro mundo, não pro lead.
  - *TELA:* o vilão estrutural nomeado (sigla/gráfico). *NOTA:* explica a causa como força externa.
  - *EXEMPLO (gestão/GA 2.0, → bloco 04):* "Por que todo mundo está adotando gestão ágil? Por causa de um negocinho chamado **VUCA**… volátil, incerto, complexo e ambíguo" + gráfico de Fogel. *Porquê:* nomear o vilão de sigla externaliza a culpa ("quem discorda, discorda da história da humanidade"); o gráfico tira a tese da boca do vendedor.

- **S16: Como as pessoas tentam resolver (as armadilhas) e por que acham que devem fazer assim.**
  - *Função:* demolição EMPÁTICA das alternativas, valida a tentativa antes de matá-la.
  - *TELA:* as 2–3 saídas falsas listadas. *NOTA:* "faz sentido você ter tentado isso, mas…".
 - *EXEMPLO (molde, nutrição, pele Soft/Vítor):* "todo mundo te mandou cortar carboidrato e malhar mais - e faz sentido, é o que ensinam. te venderam a **dieta burra**: restrição que joga seu corpo no modo sobrevivência." *Porquê:* a culpa vai pro método ("dieta burra"), não pra disciplina do lead, admitir a dor não custa ego. (nomes "dieta burra"/"modo sobrevivência" = Vítor Abrão.)

- **S17: Por que isso não funciona.**
  - *Função:* fecha a porta das soluções velhas (sem isso, o lead sai achando que "só falta esforço").
  - *TELA:* 1 frase de sentença. *NOTA:* o mecanismo do fracasso da alternativa.
  - *EXEMPLO (gestão/5 Níveis, → bloco 04):* "se você aprendeu métodos do passado, **joga fora. Não funciona.** Tem muitos gestores do passado perdidos hoje" + imagem de IA de um homem das cavernas usando Kanban. *Porquê:* ridiculariza o MÉTODO, nunca a pessoa da sala (a figura é de IA), fecha a porta sem humilhar.

- **S18: O que pode piorar se o problema não for resolvido.**
  - *Função:* a consequência que dói, custo da inação plantado cedo.
  - *TELA:* a cena do futuro ruim. *NOTA:* binariza o tempo (aprende ou fica pra trás).
  - *EXEMPLO (gestão/GAIA, → bloco 04):* "Dois tipos de profissionais: os que se tornarão indispensáveis e os que vão ficar pra trás… nós estamos vivendo uma era que não tem meio termo. Ou você se atualiza, ou você fica pra trás." *Porquê:* a falsa dicotomia temporal converte a inação num custo concreto e iminente.

- **S19: "Por que isso nem é culpa delas" + inimigo em comum.**
  - *Função:* reposicionamento de culpa, o gatilho-mãe, alívio, gratidão e aliança "nós contra eles".
  - *TELA:* "A culpa não é sua." + o inimigo nomeado. *NOTA:* o pivô explícito de culpa, em ambiente seguro.
  - *EXEMPLO (gestão/curso, → bloco 04):* "às vezes você tá ali porque não tem opção… tem boleto pra pagar, às vezes tem filhos… **o mundo mudou e vai continuar mudando**… quem é gestor do passado que tá perdido coloca nos comentários, não tem problema assumir não, **aqui é um ambiente seguro**." *Porquê:* validar o motivo de continuar preso (boleto, filhos) sem julgar + culpa no vilão externo = o lead admite a dor sem se sentir incapaz. *Slot:* o inimigo é nome próprio do nicho `(a definir com a mentoria)`.

## 4. SOLUÇÃO: slides 20–26 (crença antes da prescrição)

**Premissa do bloco:** o cérebro rejeita instrução solta e aceita modelo causal (M6): primeiro o **porquê** a nova solução funciona (contexto), depois a **prova** externa, só então o **o quê** (mecanismo único nomeado, M9). E a regra de ouro do conteúdo (M5): ensina o O QUÊ inteiro e verdadeiro, **nunca o COMO operacional**, o gap é o que sustenta o desejo. O bloco termina em recap (yes-ladder) que consolida a crença antes da transição. O teste de qualidade (corpus): a pessoa sai dizendo "aprendi mais aqui do que em curso pago" E sentindo com clareza o que ainda falta, as duas coisas juntas.

→ Falas verbatim: **`exemplos-por-bloco/05-big-idea-domino.md`** (a crença) + **`exemplos-por-bloco/06-viradas-conteudo.md`** (o ensino que prova sem esgotar). Roteiro: blocos 3.1–3.6 + doutrina do MECANISMO (`motor-3-viradas.md`). Render: `conteudo`, `mao`, `prova`, `frase` (reveal progressivo; quando o mecanismo é uma ferramenta/IA, ela entra como **motor, nunca bandeira**).

- **S20: O PORQUÊ da outra solução (contexto/fundamento).**
  - *Função:* a informação que torna a solução inteligível antes de qualquer prescrição.
  - *TELA:* a tese-contexto em 1 frase. *NOTA:* o fundamento, com promessa de prova aberta.
 - *EXEMPLO (gestão/GA 2.0, → bloco 05):* "Existe hoje uma clara oportunidade pra quem conhece gestão ágil… pra alguns é crise, pra você é oportunidade - **e eu vou provar aqui pra você**." *Porquê:* a promessa de prova ("vou provar") abre o loop que o bloco vai fechar, a aula inteira vira evidência.

- **S21: Provas do contexto.**
  - *Função:* evidência EXTERNA que valida o fundamento (não a sua opinião, fatos). cap08: prova = print real grifado.
  - *TELA:* colagem de prints de mídia/dado, frase grifada. *NOTA:* "não sou só eu falando isso".
  - *EXEMPLO (gestão/GA 2.0, → bloco 05):* "se fala em gestão ágil no G1, na globo.com… notícia na Você S/A, no Valor Econômico, na Exame… olha essa capa da Você S/A." *Porquê:* manchete de mídia de massa terceiriza a prova, não é o vendedor dizendo que o mercado quer, é a Globo.

- **S22: O QUÊ deve ser feito = MECANISMO ÚNICO (o que é / por que importa / me prova).**
  - *Função:* o mecanismo nomeado na voz do dono (M9), mata a comparação. O nome é SLOT.
  - *TELA:* o nome do mecanismo + 1 linha. *NOTA:* o que é, por que importa, a prova.
  - *EXEMPLO (gestão/curso, → bloco 06):* o filtro 80/20 batizado de "**visão de floresta**": "qual é o Pareto dos métodos de gestão? esse 80/20 é o que eu chamo de visão de floresta… como já estou há muitos anos no mercado, eu sei qual é esse 80/20." *Porquê:* batizar o mecanismo o torna proprietário, vira ativo do dono, não commodity. *Slot crítico:* `(nome Soft: a definir com a mentoria)`, NUNCA inventar e atribuir como verdade. "Visão de floresta" é da escola de gestão.

- **S23: Exemplo conectado à solução.**
  - *Função:* o mecanismo aterrissado no mundo do avatar.
  - *TELA:* imagem que ilustra LITERALMENTE o conceito (cap08: 1 imagem por conceito). *NOTA:* o caso concreto.
  - *EXEMPLO (emprego/LinkedIn, citado em cap08):* "você precisa ser como um **sniper** que mira a vaga certa" + foto de um sniper na tela; depois "seu currículo é o **trailer** do filme da sua carreira" + imagem de cinema. *Porquê:* a pessoa não só ouve a analogia, ela vê; o que vê, guarda.

- **S24: Como será a vida com o problema resolvido (argumento ou depoimento).**
  - *Função:* future pacing COM prova.
  - *TELA:* cena do estado-depois ou print de resultado. *NOTA:* projeta o depois e ancora numa prova.
  - *EXEMPLO (gestão/curso, → bloco 07):* prova na MOEDA da promessa, não um número digitado, mas a **foto da carteira de trabalho** com zoom no salário (R$17.856,72) e o print do portal do governo (cargo de diretor, R$23.583,25). *Porquê:* prova na moeda do desejo (salário → carteira) é incontestável; documento bruto e feio > slide bonito.

- **S25: "Estão curtindo a aula de hoje?".**
  - *Função:* pulso de engajamento, micro-sim que mede e aquece; dá tempo do chat encher.
  - *TELA:* a pergunta. *NOTA:* colhe elogios e bebe uma água enquanto o chat responde.
  - *EXEMPLO (gestão/curso, → bloco 08):* "eu fico falando falando, nem sei se vocês estão gostando… comenta aqui pra mim se tá curtindo a aula, **enquanto isso deixa eu tomar uma aguinha aqui**." *Porquê:* a colheita de elogios públicos aquece a sala e o "aguinha" é pausa natural de ao vivo que enche o chat.

- **S26: "O que aprendemos hoje": recap em lista.**
  - *Função:* yes-ladder que faz o lead confirmar que recebeu valor, reativa a sensação de dívida e fecha os loops abertos. Entra animado, item a item.
  - *TELA:* lista de aprendizados (1 por clique). *NOTA:* empilha o valor entregue.
  - *EXEMPLO (gestão/curso, → bloco 06):* "olha só o que a gente já viu: quem é o executivo do futuro, que a gestão do passado não funciona, a importância da visão de floresta, vimos BSC, Scrum, Kanban, inteligência emocional… **vimos muita coisa hoje**." *Porquê:* o recap acumulativo cria a dívida ("recebi muito de graça") que faz a transição (S27+) parecer justa.

## 5. TRANSIÇÃO DE VENDA: slides 27–34 (a plateia pede a oferta)

**Premissa do bloco:** a oferta nunca cai de paraquedas, ela é **pedida** (M4/M6). Uma cadeia de micro-sins públicos ("poderia ter sucesso?", "busca nova oportunidade?", "EU QUERO") + o pedido de permissão pra vender invertem o frame: não é o apresentador empurrando, é a plateia puxando. Ninguém escolhe a opção solitária em público. O takeaway ("não compre ainda") e o anti-fuga (super-bônus no fim) garantem que a sala fica inteira durante o pitch.

→ Falas verbatim: **`exemplos-por-bloco/08-transicao-pra-venda.md`** (9/9, escada de 4 degraus: recap → mundo ideal → "sim eu quero" → bifurcação caminho 1/2). Roteiro: blocos 3.7–3.9 e 4.1–4.2. Render: `frase`/`secao`, `conteudo`.

- **S27: "Com o que vimos até agora, você poderia ter sucesso em ___?".**
  - *Função:* micro-sim de capacidade ("agora eu consigo").
  - *TELA:* a pergunta de capacidade. *NOTA:* pede o sim no chat.
  - *EXEMPLO (molde, nutrição):* "Com o que você viu hoje, você já entende por que as dietas anteriores falharam, certo? Digite SIM se faz sentido." *Porquê:* confirmar capacidade prepara a permissão, o lead aceita que "agora dá", abrindo espaço pro "mas falta o como".

- **S28: "Você realmente busca uma nova oportunidade para ___?".**
  - *Função:* micro-sim de desejo, reafirma NOVA oportunidade, não melhoria (M3).
  - *TELA:* a pergunta de desejo. *NOTA:* future pacing curto do que ele vai fazer com o resultado.
  - *EXEMPLO (gestão/curso, → bloco 08):* "se você colocar em prática você vai ganhar mais… **o que você vai fazer com esse dinheiro a mais?** vai trocar de carro, ajudar a família? eu não sei, mas você vai ganhar mais." *Porquê:* o future pacing financeiro com perguntas concretas (carro/família) faz o lead ensaiar a vitória antes do veículo (produto) aparecer.

- **S29: "Digite EU QUERO no chat".**
  - *Função:* compromisso público em massa, a plateia declara que quer mudar.
  - *TELA:* "EU QUERO" gigante. *NOTA:* bateria de "sim eu quero" em aspectos diferentes do desejo + leitura do consenso.
  - *EXEMPLO (gestão/curso, → bloco 08):* "escreve nos comentários: **sim eu quero**… quem quer aumentar seu reconhecimento profissional e conquistar uma posição executiva, escreve sim eu quero… tá vendo, todo mundo quer." *Porquê:* o lead se compromete por escrito várias vezes, recuar depois custa dissonância.

- **S30: "Mais importante que saber O QUÊ é saber COMO colocar isso na sua vida" + "tudo bem se eu passar 10 minutos…?".**
  - *Função:* permissão explícita pra vender, o COMO mora no produto (M5).
  - *TELA:* "Saber ≠ Aplicar". *NOTA:* o argumento (não o pedido) de que conhecimento sem implementação não basta.
  - *EXEMPLO (gestão/5 Níveis, → bloco 08):* "só pegar conhecimento por conhecimento, a única coisa que você ganha é o que eu chamo de **obesidade mental**. Não adianta ficar só aprendendo. Tem que saber o que eu faço com isso. E eu quero te ajudar nisso." *Porquê:* a venda vira favor, a oferta resolve a lacuna que a própria aula criou. *Slot:* cada nicho tem sua "obesidade mental" (variação possível: "saber ≠ aplicar"); "obesidade mental" é nome do Denison/a escola de gestão.

- **S31: "Quero te ajudar a…": desejos declarados intercalados com desejos ocultos.**
  - *Função:* fala ao que ele admite querer E ao que ele não admite querer.
  - *TELA:* lista de "Quero te ajudar a…" (animada). *NOTA:* intercala desejo confessável e desejo oculto.
 - *EXEMPLO (gestão/GA 2.0, → bloco 08):* "Quero te ajudar a ser mais reconhecido, a ser um líder admirado - **não só admirado pela equipe, mas cobiçado pelo mercado. Tem empresa disputando você a tapa.**" *Porquê:* "cobiçado/disputado a tapa" toca o desejo de status que o lead não verbaliza, mas sente.

- **S32: Alavancagem pra oferta: por que o que ele realmente precisa está dentro de um produto.**
  - *Função:* a ponte lógica conteúdo→oferta.
  - *TELA:* "O caminho completo está aqui dentro." *NOTA:* conecta a lacuna (S30) ao produto.
  - *EXEMPLO (gestão/GA 2.0, → bloco 08):* "essa semana a gente está com inscrições abertas pra uma nova turma do nosso curso Gestão Ágil 2.0", dito SÓ depois de "pra todo mundo que digitou sim eu quero". *Porquê:* o anúncio é endereçado a quem já se declarou comprador no chat; a oferta é consequência do sim, não interrupção.

- **S33: "Inscrições abertas essa semana… não compre ainda".**
  - *Função:* takeaway que inverte a pressão e dispara reatância a favor.
  - *TELA:* "NÃO compre ainda." *NOTA:* segura a compra de propósito pra criar reatância.
  - *EXEMPLO (template, direção de palco):* "essa semana estamos com inscrições abertas para os programas… **não compre ainda**", antes de mostrar o stack inteiro. *Porquê:* mandar não comprar agora desarma a defesa e faz o lead querer ver o que ele "ainda não pode" comprar.

- **S34: Anti-fuga: super bônus pra quem ficar até o fim.**
  - *Função:* segura a sala durante todo o fechamento (material exclusivo de dentro do produto).
  - *TELA:* "Tem um SUPER bônus no final." *NOTA:* mostra a oferta mas adia o super-bônus pro fim.
 - *EXEMPLO (template):* "vou mostrar a oferta, mas logo depois mostro esse material exclusivo de quem está dentro do curso - fica até o fim." *Porquê:* o lead não fecha a aba durante o pitch porque o prêmio maior está no fim, o mesmo mecanismo do presente da abertura (S8), recarregado.

## 6. OFERTA: slides 35–65 (quase metade do deck, e é proposital)

**Premissa do bloco:** todo valor é relativo (M8), só existe "barato" depois de âncora alta com motivo crível pra cada queda; e a decisão se defende por identidade, não por capacidade (M2): concede que ele conseguiria sozinho e move a conversa pra escolha inteligente. **31 dos 72 slides são oferta (~43%)**, a proporção ~55/45 ensino/oferta do `geracao-de-slides.md` está cravada no próprio template: fechamento NUNCA se encurta (G6). Achado-mãe do corpus: **a oferta é a aula reembalada**, os módulos espelham 1:1 o que foi ensinado, e cada item do stack mata UMA objeção nomeada.

→ Falas verbatim: **`exemplos-por-bloco/09-oferta-stack.md`** (stack/bônus) + **`exemplos-por-bloco/10-ancoragem-preco.md`** (âncora, queda, redução ao ridículo) + **`exemplos-por-bloco/11-garantia.md`** (garantia). Roteiro: blocos 4.3–4.12 + `ancoragem-e-fechamento.md`. Render: `oferta`/`investimento` (títulos verdes = luz verde pra comprar), `prova`, `mao`.

### 6a. Produto & pertencimento: slides 35–43

- **S35: Proposição única de VALOR do produto (o que é, em uma frase).**
 - *EXEMPLO (gestão/curso, → bloco 09):* "qual é a grande promessa desse curso: **domine a gestão ágil 2.0 e se torne um líder valioso em qualquer área, em 90 dias** - esse é o meu compromisso." *Porquê:* o "90 dias" grifado lá na abertura (S5) reaparece literal aqui, a oferta fecha o loop, parece desfecho.

- **S36: História do produto (plausibilidade).**
  - *EXEMPLO (gestão/curso, → bloco 03):* a fundação como consequência de paixão: "foi nessas consultorias que conheci o Denis, meu sócio… a gente fundou a escola de gestão em 2014, e o resto é história." *Porquê:* origem por paixão (não por marketing) explica por que o produto existe e funciona.

- **S37: "Por que isso é diferente de tudo que eu já vi?": mecanismo único DO PRODUTO.**
  - *Função:* mata a comparação e a commodity (M9). cap08/corpus: diferenciar contra a alternativa pelo DEFEITO dela.
 - *EXEMPLO (gestão/curso, → bloco 09):* "MBAs têm em média 360 horas… o pessoal por não saber o que fazer fica **enchendo de linguiça** - a gente fez uma formação de 3 meses, 64 horas, direto ao ponto." *Porquê:* a compressão é vendida como benefício, não como falta.

- **S38: Os 2 caminhos, sozinho ou atalho.**
  - *Função:* a objeção-mãe ("eu conseguiria sozinho") tratada por ESCOLHA, concedendo a competência (M2).
  - *EXEMPLO (gestão/curso, → bloco 08):* "você tem dois caminhos: sair tentando aprender tudo sozinho, ou pegar um atalho com a minha experiência. **nada contra quem quer ir sozinho**, mas… eu quero ser seu mentor." *Porquê:* concede a competência ("você conseguiria") e move pra escolha inteligente, ninguém escolhe o caminho solitário em público.

- **S39: Pra quem NÃO é: exclusão que qualifica.**
  - *EXEMPLO (molde, nutrição):* "isso NÃO é pra quem quer pílula mágica, NÃO é pra quem não vai abrir o app uma vez por dia." *Porquê:* a exclusão quebra objeções por contraste e qualifica, quem fica se sente escolhido.

- **S40: PRA QUEM É (com imagens): o lead se vê dentro do grupo.**
  - *EXEMPLO (template + cap08):* perfis com FOTO de pessoas como o avatar (não ícones). *Porquê:* a pessoa se vê literalmente dentro do grupo; imagem > texto.

- **S41: "Você será capaz de…": capacidades que o produto instala.**
  - *EXEMPLO (gestão/GA 2.0, → bloco 08):* "você vai ser capaz de aumentar a produtividade sem sobrecarregar as pessoas, promover cultura ágil sem mudar radicalmente a empresa." *Porquê:* cada capacidade é "benefício sem objeção", entrega o sonho já desarmando a resistência.

- **S42: Problemas que o produto já resolveu: anos de estrada.**
  - *EXEMPLO (template):* "com tantos anos nesse meio, conheço todos os caminhos, os riscos que você deve evitar e os atalhos." *Porquê:* riscos mapeados + atalhos prontos = valor da experiência, não só do conteúdo.

- **S43: Tempo e dinheiro que o produto economiza, em cheque com os outros caminhos.**
  - *EXEMPLO (template):* "colocar em cheque com os outros caminhos possíveis", quanto custaria/demoraria sozinho vs. com o atalho. *Porquê:* custo de oportunidade explícito prepara a ancoragem.

### 6b. Ancoragem & stack: slides 44–56

- **S44: "Quanto vale?": o preço normal, a 1ª âncora, SEMPRE antes de qualquer desconto (M8).**
 - *EXEMPLO (gestão/curso, → bloco 10):* "MBAs custam em média 15-20 mil… o Gestão Ágil não vai custar nem 20 nem mil reais. **o valor dele é R$3.000** - eu já tinha falado lá no começo." *Porquê:* a âncora externa (MBA) desqualificada + o valor próprio já plantado na autoridade fazem o preço chegar como fato, não manobra. (R$3.000 é EXEMPLO do template.)

- **S45: Benefícios comuns (acesso, suporte, certificado, fórum…): o chão da entrega.**
  - *EXEMPLO (template):* "30 horas de aulas, início imediato, 100% online, assista quantas vezes quiser, fórum de dúvidas, certificado, equipe de atendimento." *Porquê:* lista o que QUALQUER um esperaria, pra depois ser superado, é o chão que faz o resto parecer extra.

- **S46: Jornada do programa: entregável + por que importa + print de prova (beat expansível).**
  - *EXEMPLO (gestão/curso, → bloco 09):* cada módulo apresentado como "**um curso dentro do curso**", "é um curso de liderança dentro do Gestão Ágil 2.0." *Porquê:* multiplica o valor percebido; cada entregável fecha um buraco que a aula abriu. *Beat expansível:* "quantos slides precisar".

- **S47: Módulos por PROMESSA + transformação + prova social, nunca por horas.**
  - *EXEMPLO (gestão/curso, → bloco 09):* "o módulo 2 é onde eu entro a fundo em tudo que a gente viu nessa aula dos 5 níveis." *Porquê:* o módulo espelha 1:1 a aula, comprar parece continuar o que já começou, não iniciar algo desconhecido.

- **S48: Como você será acompanhado: o suporte (o que é / por que importa).**
  - *EXEMPLO (molde, nutrição/Vítor, → bloco 11):* "você vai ter consultoria individual de acompanhamento", o suporte como item de valor próprio, mata a objeção "vou ficar sozinho". *Porquê:* nomear o suporte mata o medo de abandono.

- **S49–S51, Produtos 2, 3 e 4 da prateleira: transformação + preço que custaria (beat ajustável).**
  - *EXEMPLO (gestão/curso, → bloco 09):* "tem o OKR que a gente vende por R$1.497, o Design F por R$2.000…" cada um com preço declarado. *Porquê:* o stack empilha item a item, cada um com valor próprio, construindo a âncora interna. *Ajustável ao tamanho real da prateleira.*

- **S52: Prateleira somada: "tudo isso custaria R$ X", o stack-nota-fiscal (entra animado, item a item).**
 - *EXEMPLO (gestão/curso, → bloco 10):* "Gestão Ágil R$3.000, acompanhamento R$9.000, OKR R$2.000, Design F R$2.000, OKR R$1.497 - **somando tudo daria mais de R$15.000**." cap08: o valor cresce na frente da pessoa, clique a clique. *Porquê:* empilhado ao vivo, vira uma escada de valor; mostrado de uma vez, era só uma conta.

- **S53–S55, "10x esse valor valeria a pena pela transformação A / B / C?": três micro-sins de valor.**
  - *EXEMPLO (template):* "X10 valeria a pena pra você ter essa transformação A?" repetido pra B e C. *Porquê:* o lead confirma que vale ANTES de ver o preço real, quando o número cai, já está pré-aceito como bom negócio.

- **S56: 1ª queda: "tudo de R$X por R$Y", primeiro degrau do desconto (nunca o último).**
  - *Função:* primeiro degrau com reason-why próprio (M8/G7).
 - *EXEMPLO (gestão/curso, → bloco 10):* "vai ter uma oferta exclusiva **pra quem ficou até o final** - de R$3.000 por R$1.997, R$1.000 de desconto." *Porquê:* o reason-why ("ficou até o final") preserva o valor do produto, só o acesso de quem está na sala fica privilegiado.

### 6c. Bônus, garantia & queda final: slides 57–65

- **S57: Bônus 1, "não tem preço": escapa da régua numérica (M8).**
  - *EXEMPLO (gestão/curso, → bloco 09):* a mentoria quinzenal com reason-why de custo ANTES de ser doada: "a gente cobra essas mentorias R$9.100… custo do professor, custo de estar ali a cada 15 dias… **e pra essa turma vai ser bônus, de graça**." *Porquê:* o bônus precificado vira contabilidade (não retórica) e constrói a âncora que a queda final vai derrubar. (Fladlien: bônus convertem mais que a oferta, merecem tempo de palco.)

- **S58: Bônus 2, "não tem preço": segundo empilhamento.**
 - *EXEMPLO (template):* "Bônus 2 - não tem preço." *Porquê:* "não tem preço" escapa da régua numérica, a palavra enquadra o valor (M8) onde o número limitaria.

- **S59: Acesso estendido (opcional): mais entrega no mesmo preço.**
  - *EXEMPLO (template):* "6 meses de acesso ao curso + 6 meses ao curso bônus." *Porquê:* o stack continua crescendo sem mexer no preço, mais valor pela mesma âncora.

- **S60: SUPER GARANTIA (inversão de risco, "experimente por 7-15-30 dias").**
  - *Função:* inversão de risco; "experimente" sugere ganho, não defeito. **Decisão Soft: garantia = cardápio** (escolher a camada por nicho).
  - *EXEMPLO (Fladlien #2, → bloco 11):* dupla camada, "**any reason or no reason** in the first 30 days, no questions asked" + "**double your money back** em 60 dias se você seguir um método e não dobrar o investimento." com reason-why atuarial: "I know the numbers." *Porquê:* a camada incondicional cobre o cético raso; a condicional de resultado cala o cético profundo, "remove every possibility for you to fail, then what is left? Only success."
  - *EXEMPLO (nutrição, pele Soft, → bloco 11; verbatim, contém anti-voz dentro da citação):* "90 dias botando o método em prática… se não teve resultado, vou te dar uma consultoria individual que custa R$3.000, de graça, **para você conseguir destravar teus resultados**… [se ainda não tiver resultado] eu devolvo teu dinheiro e te dou o dobro." *Porquê:* as condições da garantia SÃO o protocolo de implementação, a garantia é um mecanismo de sucesso disfarçado. *Slot:* a unidade de aplicação muda por nicho.

- **S61: "O que eu mais amo é receber os resultados de vocês": ponte emocional.**
 - *EXEMPLO (template):* "esse é o nosso resultado - o que eu mais amo é receber os resultados de vocês." *Porquê:* a ponte emocional prepara a condição especial (S62), o desconto vem de afeto, não de desespero.

- **S62: "Combinado não sai caro": o MOTIVO crível do desconto final (G7).**
  - *EXEMPLO (gestão/curso, → bloco 09):* "o bônus do **combinado não sai caro**: eu te dou um desconto, e quando você atingir o resultado, você me manda seu depoimento, pode ser? o compromisso é a nossa palavra." *Porquê:* desconto sem motivo é desconto queimado; aqui o desconto é uma TROCA recíproca (preço menor ↔ depoimento futuro), vira privilégio, não liquidação. ("combinado não sai caro" = nome da escola de gestão.)

- **S63: Queda final em degraus, riscada: "temos um combinado?".**
  - *EXEMPLO (gestão/curso, → bloco 10):* "com esse bônus do combinado, não vai ser R$1.997, acaba ficando R$1.697, ou **R$165 por mês**… eu fiz isso pra ter um valor que cabe no orçamento de qualquer pessoa." (a parcela vira o preço oficial; o total parcelado nem é verbalizado.) *Porquê:* o desconto é JUSTIFICADO pelo acordo, nunca seco. (R$1.497→R$497, 12x69 são EXEMPLO do template.)

- **S64: SURPRESA: bônus exclusivo pros N primeiros, escassez honesta de velocidade.**
 - *EXEMPLO (gestão/curso, → bloco 12):* "vai ter bônus só pros **15 primeiros** que se inscreverem agora - quando você clicar no link, vai aparecer 'parabéns, você está entre os 15 primeiros'." *Porquê:* escassez mecânica e auditável (o sistema decide quem é o 15º) desarma o ceticismo de "escassez falsa". ("10 primeiras vagas" do template = o que realmente cabe entregar, G7.)

- **S65: RESUMO DA OFERTA: stack completo + preço final + "clique no botão", o slide-mestre (animado, fica fixo).**
 - *EXEMPLO (template):* "Curso A + B + C + Pacote A + Bônus 1 + Bônus 2 + Experimente 7D + Acesso estendido + Bônus individualizado - TUDO DE R$1.497 POR R$497 (12x69). Clique no botão >>>". cap08: cada componente aparece por clique, o valor cresce na frente da pessoa. *Porquê:* é o slide-mestre que vai ficar na tela durante o Q&A, o stack revelado item a item parece maior do que a soma.

## 7. FECHAMENTO: slides 66–72 (o pico emocional coincide com o botão)

**Premissa do bloco:** emoção decide, razão justifica, medo move, nessa ordem (M6). As vagas abrem no pico de energia, o pitch emocional projeta identidade ("quem vai ter orgulho de você?"), a prova final reaparece no momento exato da decisão, e o Q&A não é apêndice: é **10 minutos de demolição de objeções** com a oferta fixa na tela e compras sendo celebradas ao vivo (prova social em tempo real). Encurtar este bloco "pra não cansar" é o erro clássico (G6).

→ Falas verbatim: **`exemplos-por-bloco/12-escassez-urgencia-cta.md`** (CTA, cartão na mão) + **`exemplos-por-bloco/13-qa-objecoes.md`** (Q&A) + `objection-annihilation.md`. Roteiro: blocos 4.10–4.18 + `pos-webinar-tags-comercial.md`. Render: `fechamento`, `frase`, `prova`.

- **S66: "Abre as vagas!" com muita energia: o botão nasce no pico, nunca num vale.**
  - *Função:* CTA físico no pico emocional; cartão na mão ANTES do link (elimina o atrito que mata o impulso).
 - *EXEMPLO (gestão/curso, → bloco 12):* "enquanto eu tô abrindo aqui, **já vai pegando o seu cartão**, já vai abrindo o cartão virtual no celular - porque se você perde tempo digitando número de cartão, você perde os 15 primeiros." *Porquê:* fazer a sala abrir o cartão antes do link existir converte intenção em ação motora, quando o link cai, o corpo já está no meio da compra, sem janela pra racionalizar.

- **S67: PITCH EMOCIONAL: future pacing de identidade (M2).**
  - *EXEMPLO (template):* "imagine como será… **quem vai ter orgulho de você?** o que isso muda na sua vida? imagine… imagine…" *Porquê:* a decisão vira projeção de identidade ("quem eu me torno"), não cálculo de capacidade.

- **S68: Depoimento forte em print de que valeu a pena: a última prova, na hora da decisão.**
  - *EXEMPLO (cap08):* print real grifado, lido só na frase de impacto, a prova reaparece no momento exato da decisão. *Porquê:* a última coisa que o lead vê antes de decidir é alguém como ele que decidiu e venceu.

- **S69: "O trem está partindo - o que você escolhe?": urgência + decisão como identidade.**
  - *EXEMPLO (template):* "o trem está partindo, o que você escolhe?" *Porquê:* enquadra a indecisão como escolha ativa (ficar pra trás é uma decisão), não como adiamento neutro.

- **S70: Q&A + quebra de objeções (~10 min): a oferta fixa na tela, compras celebradas ao vivo.**
  - *Função:* objection annihilation distribuída + redução ao ridículo do preço (valor por dia vs. gasto trivial) + prova social em tempo real.
  - *EXEMPLO de redução ao ridículo (gestão/curso, → bloco 10):* "peguei R$165 e dividi por 30 dias: dá **R$5,51 por dia**… vi uma Coca de 600ml a R$5,29 no mercado [foto real]… você troca uma Coca por dia por transformar sua carreira?" *Porquê:* a pergunta deixa de ser "vale R$1.697?" e vira "eu troco uma Coca por dia pela minha carreira?".
 - *EXEMPLO de objeção invertida (gestão/curso, → bloco 13):* "'gestão ágil não é demandada na minha área' - **e aí que está a grande oportunidade: em terra de cego quem tem olho é rei.**" *Porquê:* a objeção-mãe é invertida em USP no enquadramento do apresentador, antes do cético formular.
  - *EXEMPLO de placar de vendas (gestão/5 Níveis, → bloco 12):* "quem for se inscrevendo, pode colocar nos comentários, até pra outros irem sabendo como está a inscrição." *Porquê:* o chat vira placar de vendas ao vivo, efeito manada. *Slot:* mapear as 3–5 objeções recorrentes do nicho e escrever as respostas como peça fixa.

- **S71: "Te vejo do outro lado": fechamento de pertencimento.**
  - *EXEMPLO (template):* "te vejo do outro lado." *Porquê:* quem compra cruza pra dentro do grupo, a frase já posiciona a compra como mudança de pertencimento.

- **S72: Resumo da oferta FIXO + depoimentos + cronômetro encerrando + WhatsApp.**
  - *Função:* a tela de fundo até o último segundo, oferta visível, prazo visível, canal humano visível (captura indecisos pro comercial 1:1 da esteira, M10).
 - *EXEMPLO (template):* "Resumo da oferta + DEPOIMENTOS + cronômetro finalizando + WhatsApp." + rota de resgate (gestão/curso, → bloco 13): "se sobrou dúvida, manda e-mail pro comercial, a equipe está de plantão - inclusive se deu erro no cartão." *Porquê:* venda morre em atrito operacional tanto quanto em dúvida; o WhatsApp/comercial tapa esse ralo e leva o indeciso pra esteira 1:1.

---

## MAPA 72 BEATS ↔ ROTEIRO APSD ↔ BIBLIOTECA (a costura)

| Bloco do template | Slides | Fase APSD (`estrutura-webinario-aida.md`) | Biblioteca (`exemplos-por-bloco/`) | Render (`geracao-de-slides.md`) |
|---|---|---|---|---|
| Pré-início | 1–4 | BLOCO 0 (0.1–0.4, compliance progressiva) | 01-pre-inicio | `capa`, `frase` |
| Abertura | 5–13 | ATENÇÃO (1.1–1.8) | 02-abertura-atencao + 03-autoridade-historia (S13) | `capa`, `conteudo`, `prova` |
| Problema | 14–19 | DIAGNÓSTICO (2.1–2.6) | 04-problema-interesse | `conteudo`, `prova`, `frase` |
| Solução | 20–26 | MECANISMO-ensino (3.1–3.6 + regra O QUÊ/COMO) | 05-big-idea-domino + 06-viradas-conteudo + 07-provas-casos (S24) | `conteudo`, `mao`, `prova` |
| Transição de venda | 27–34 | MECANISMO→AÇÃO (3.7–3.9, 4.1–4.2) | 08-transicao-pra-venda | `frase`, `secao`, `conteudo` |
| Oferta | 35–65 | AÇÃO (4.3–4.12) | 09-oferta-stack + 10-ancoragem-preco + 11-garantia | `oferta`, `investimento`, `prova` |
| Fechamento | 66–72 | AÇÃO (4.10–4.18, Q&A, despedida) | 12-escassez-urgencia-cta + 13-qa-objecoes | `fechamento`, `frase`, `prova` |
| (transversal a TODOS) |, | micro-compromissos S3/S4/S25/S27-29/S70 | 14-interacao-chat (leia ANTES de tudo) |, |

O roteiro APSD tem granularidade de FALA (blocos com tempos e copy); o template 72 tem granularidade de TELA (beats visuais); a biblioteca tem granularidade de EXEMPLO (verbatim de campeões). São o mesmo esqueleto em três resoluções, gere o roteiro primeiro, projete nos 72 beats puxando exemplos da biblioteca, renderize por último.

---

## CHECKLIST ao gerar um deck sobre este esqueleto

- [ ] Os 72 beats estão presentes, **na ordem** (expandir pode; suprimir/reordenar não).
- [ ] **Cada beat tem TELA mínima + NOTA com a copy falada**, a tela passa o teste "dá pra eu só ler isso em voz alta?" (se dá, está errado, joga texto pra nota).
- [ ] **Toda lista entra animada, item por clique** (S6, S26, S52, S65), nunca aberta de uma vez (regra da dopamina, cap08).
- [ ] Antes de escrever cada bloco, **a biblioteca `exemplos-por-bloco/NN` correspondente foi lida**, exemplo extraído como PREMISSA, reconstruído na voz do usuário, NUNCA decalcado (G2).
- [ ] Todo recheio é do nicho (dor, inimigo, números, provas, preços). Os R$1.497/R$497/12x69, "gestor do futuro", "visão de floresta", "síndrome do Fantástico" são EXEMPLO, não entram no deck do usuário.
- [ ] Nomes (big idea, mecanismo S22, bordões, inimigo S19) marcados como SLOT `(nome Soft: a definir com a mentoria)`, nunca fabricados.
- [ ] S20–S22 entregam o O QUÊ e o PORQUÊ; o COMO operacional fica no produto (M5/G3).
- [ ] Cada item do stack (S46–S59) mata UMA objeção nomeada; cada bônus tem preço + reason-why ANTES de ser doado.
- [ ] Toda queda de preço (S56, S63) tem motivo crível; escassez (S4, S64, S72) é honesta e verificável (G7).
- [ ] Garantia (S60) escolhida do CARDÁPIO Soft conforme o nicho (incondicional / condicional de resultado / dupla camada), decisão registrada, não inventada.
- [ ] O bloco de oferta+fechamento mantém o peso (~45% do deck), não encurtar (G6).
- [ ] Checklist G1–G11 do `premissas-e-guarda-corpos.md` rodado antes de entregar.

---

*O esqueleto é LEI; o recheio é do nicho. Este template é a ordem física dos 72 beats que o roteiro APSD preenche de fala, a biblioteca instancia em exemplo e o gerador de slides veste de tela. Quando a forma de um beat ferir a premissa num nicho, a premissa ganha, adapta-se a forma do beat, nunca sua posição na cadeia.*
