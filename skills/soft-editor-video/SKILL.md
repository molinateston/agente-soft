---
name: soft-editor-video
description: "Editor de vídeo do método Soft: transforma um talking-head cru (9:16) num reels com b-roll de IA (imagem no gpt-image-2, animação no Veo 3.1 fast) na faixa de baixo e o apresentador em cima, mais corte de roteiro/silêncio, gancho (cold open), legenda karaokê que acende palavra a palavra na cor da marca (transcrição local, sem ferramenta paga), animações de tela (marca-texto, frase palavra a palavra, lower-third), CTA fixo no fim e música discreta. Marca-neutra: na PRIMEIRA vez roda o ONBOARDING (pede as chaves do dono e entrevista os personagens dele em config/). Use quando o dono mandar um vídeo pra editar, pedir b-roll, 'cobre o vídeo com cenas', gerar reels de uma gravação, cortar um vídeo, criar gancho/cold open, legendar, pôr legenda karaokê, animar texto na tela, CTA ou música. NÃO use para roteiro/ideia (soft-conteudo-reels), carrossel/slide/banner estático (soft-designer), nem para a copy da legenda em si (passa pelo guardrail anti-IA do produto: sem travessão, sem frase de robô, PT-BR completo)."
---

> 🔴 **REGRA DURA DE FRASE , "TODA FRASE SE EXPLICA SOZINHA"** (vale em TUDO que esta skill escrever pro público)
>
> Copy Soft é **frase que gera IMAGEM na cabeça de quem lê frio**. Não pode assumir que o leitor já sabe o assunto, o produto, a categoria, o método, o mecanismo ou o antes/depois. Toda frase que você escrever precisa se sustentar sozinha, sem depender do slide anterior, da bio, do título, ou do que "obviamente é". Frase curta que "soa punchy" e deixa o entendimento pro contexto é reprovada.
>
> **Teste antes de aprovar CADA frase:** "se essa frase caísse solta no scroll de uma pessoa que nunca ouviu falar do produto, ela entenderia O QUÊ + PRA QUEM + O RESULTADO CONCRETO?" Se não, REESCREVE nomeando explícito: qual é o objeto ("dieta", "calorias", "conta de calorias", não só "conta"), qual é o público ("mulher que já tentou emagrecer de todas as formas", não só "mulher que já tentou de tudo"), qual é o resultado concreto ("para de recomeçar a dieta", não só "para de recomeçar).
>
> **Ex reprovado →** *"Você come o que ama, um agente faz a conta do seu dia e você para de recomeçar."*
> **Ex aprovado →** *"Você passa a comer o que ama, um agente faz a conta de calorias do seu dia inteiro e não te deixa escorregar, e você para de recomeçar a dieta toda vez do zero."*
>
> Adicionar as 3-5 palavras que ancoram o contexto é MELHOR que a frase curta ambígua. Copy boa não é curta , é **inequívoca e imagética**. Frase que precisa de contexto pra ser entendida = frase quebrada, refaz.

> **REGRA-IRMÃ · "NENHUM VERBO ÓRFÃO" (cérebro preguiçoso do leitor):** o leitor tem cérebro preguiçoso e NÃO vai completar sua frase pra você. Todo verbo precisa vir com seu OBJETO NOMEADO na mesma frase, senão vira frase média. Verbos-armadilha que exigem complemento explícito: cortar (**cortar o quê?**), recomeçar (**recomeçar o quê?**), parar (**parar de quê?**), mudar, melhorar, escapar, largar, controlar, ajustar, resolver, virar, transformar. Sempre nomeia o objeto concreto (arroz, pão, doce, dieta, treino, agenda, cliente, valor), NUNCA deixa aberto.
>
> **Ex ✅ BOA (verbos ancorados + objetos nomeados):** *"Você come arroz, pão e o que ama, e uma ferramenta minha conta as calorias de tudo por você todo dia, pra você emagrecer sem viver de dieta."* , "come" tem objeto (arroz, pão), "conta" tem objeto (calorias), "emagrecer" tem contexto ("sem viver de dieta").
>
> **Ex ⚠️ MÉDIA (verbo órfão no fim):** *"…pra você emagrecer comendo o que gosta em vez de cortar."* , "cortar O QUÊ?" ficou pro leitor completar. Cérebro preguiçoso não completa, desiste. Correto: *"…em vez de cortar arroz, pão e doce."*
>
> Antes de aprovar a frase, sublinha mentalmente cada verbo e confere: cada um tem OBJETO nomeado? Não? Nomeia agora.

**Papel:** skill de domínio (operador de produção audiovisual). Suporte/infra, FORA do pipeline de copy dos funis: entra DEPOIS que o roteiro/ideia já existe (isso é da `soft-conteudo-reels`). Pega uma gravação talking-head e devolve um reels editado. **É marca-neutra como a `soft-designer`**: não embute a cara de ninguém , no onboarding entrevista o dono e salva o elenco/identidade dele em `config/personagens.json`, e cada cliente roda com a própria marca. As chaves de API são do dono (ele paga OpenAI/Google direto). Método detalhado: `references/metodo.md`.

## ⚙️ AMBIENTES (onde roda o quê)
Esta skill tem pipeline com Bash + FFmpeg + APIs. O ramo por ambiente:
- **Claude Code:** roda o pipeline INTEIRO de verdade (Bash, FFmpeg de corte/silêncio/montagem/música, karaokê e animações, transcrição local com whisper.cpp, chamadas de imagem/vídeo). Entrega o **MP4 4K final** salvo na pasta de saída do dono e aberto pra ele ver.
- **agente / Telegram (tem Bash):** roda igual ao Code. A entrega é o **ARQUIVO**: o path COMPLETO do MP4 gerado vai na resposta, e as mensagens saem sem markdown pesado.
- **app / chat (claude.ai, sem Bash):** NÃO renderiza vídeo. A entrega possível é um **doc MD** com o **PLANO DE CENAS** (`scenes.json`: cada cena com personagens, pose e elementos, mapeada à fala), a **paginação da legenda karaokê** (quantas palavras por vez, qual acende, cor da marca), qual **animação de tela** usar em qual momento, e a **copy do gancho/cold open e do CTA**, deixando anotado que a transcrição, a geração de imagem, a animação e o render rodam no Code. Duas regras do app-mode: (1) a **aprovação do elenco por imagem NÃO acontece** aqui (sem Bash pra gerar imagem) , marque o elenco `[PENDENTE: aprovar elenco com 1 imagem de teste no Code antes de produzir]` em vez de fingir o OK do dono (ver 0.2); (2) toda copy de tela roda o **micro-gate anti-IA** do passo 8b antes de entrar no doc, porque a `soft-anti-ia` não está carregada aqui.

## 📄 OUTPUT CONTRACT
No **Code** e no **agente/Telegram** a entrega é o **MP4 final** (gancho, corpo com b-roll no rodapé + legenda karaokê, CTA, música). No app a entrega é o **doc MD** de plano descrito acima. Um artefato por vez, com checkpoint: imagens aprovadas antes de animar.

## 📦 O QUE ESTA SKILL PRODUZ

Um reels vertical (9:16) finalizado a partir de um talking-head cru, com:

- **B-roll IA image-first** , gera a IMAGEM da cena (gpt-image-2) e depois ANIMA a imagem (Veo 3.1 fast, câmera empacada + `negativePrompt`). Nunca texto→vídeo direto. B-roll SEMPRE na faixa de baixo; apresentador inteiro em cima.
- **Corte de roteiro + silêncio:** transcrição word-level LOCAL (whisper.cpp, sem chave paga: `scripts/06_transcribe_local.py`), enxuga o que não muda a mensagem (aprovado pelo dono) e tira os silêncios. Mais barato e mais ritmado. A mesma transcrição serve pra legenda karaokê.
- **Gancho / cold open (padrão v4)** , copia a frase mais forte pro comecinho, só o apresentador, com efeito + a mesma frase numa faixa, e transição pro corpo (`scripts/05_hook.py`).
- **Legenda karaokê word-level (padrão da casa):** a palavra falada ACENDE na cor da marca do dono no instante exato (`scripts/07_karaoke.py`, FFmpeg-first). Substitui a legenda paga: fica 100% no nosso controle de fonte/cor/tamanho/marca. Alternativas: reusar a que já veio no vídeo, ou Submagic (se configurado).
- **Animações de tela** (`scripts/08_screen_fx.py`): 3 movimentos de texto pra retenção, sem inflar custo (render de texto, não Veo): **wipe** (marca-texto animado atrás da palavra-âncora do gancho), **reveal** (a frase entra palavra a palavra) e **bar** (lower-third que entra deslizando). Uma por momento, não empilhar.
- **CTA fixo no final** (opcional) , card de encerramento do dono colado com transição suave.
- **Música de fundo discreta** , nivelada pra nunca cobrir a fala.
- **Export 4K** na pasta de saída do dono.

**Identidade visual (marca-neutra):** os `personagens.json` SÃO a identidade do dono nas cenas (etnia/look do apresentador, mascote, sócio, ambiente, paleta, logo). Se o dono já tem ID visual definida na `soft-designer` (`identidade-visual-cliente`), puxe dela pra manter a mesma cara entre carrossel/banner e vídeo. Texto que aparece na tela (gancho, CTA) passa pelo guardrail anti-IA do produto (sem travessão, sem frase de robô, PT-BR completo) antes de queimar.

**Serve o agente:** equipa o LEON/cliente a produzir reels de atração sem editor humano. A IDEIA e o ROTEIRO vêm da `soft-conteudo-reels`; aqui é só a produção/edição.

---

## PASSO 0 , ONBOARDING (rodar SÓ se ainda não estiver configurado)

Antes de editar qualquer vídeo, verifique a configuração. **Se já existir, NÃO pergunte de novo** , siga direto pro pipeline.

### 0.1 Chaves de API
1. Verifique se existe `config/keys.env` (ou as variáveis no ambiente). Campos necessários:
   - `OPENAI_API_KEY`: gera as imagens (gpt-image-2). **Obrigatória.** (A transcrição NÃO usa mais essa chave: roda local no whisper.cpp, ver 0.4.)
   - `GEMINI_API_KEYS` , uma ou mais chaves Google AI (Veo 3.1 fast), separadas por vírgula. **Obrigatória.**
   - `SUBMAGIC_API_KEY`: legenda automática paga. **Opcional e secundária:** o padrão da casa é a legenda karaokê própria (0.4 + `07_karaoke.py`); Submagic só se o dono já paga e prefere.
2. Se faltar alguma, **PERGUNTE ao dono** de forma simples, ex.:
   > "Pra editar seus vídeos eu preciso de 2 chaves (e 1 opcional): **OpenAI** (imagens), **Google AI/Gemini** (vídeo) e, se quiser legenda automática, **Submagic**. Me passa elas aqui."
   Diga onde pegar: OpenAI em platform.openai.com/api-keys · Gemini em aistudio.google.com/apikey · Submagic em app.submagic.co/account (precisa plano com API).
3. Salve em `config/keys.env` (formato `CHAVE=valor`, uma por linha). **NUNCA** comite esse arquivo (já está no .gitignore).

### 0.2 Personagens do dono (a "marca" dele nas cenas)
1. Verifique se existe `config/personagens.json`. Se não existir, **entreviste o dono** pra montar o elenco que vai aparecer no b-roll dos vídeos dele. Pergunte, um de cada vez:
   - "Quem é o **apresentador principal** (você)? Descreve aparência: etnia, cabelo/careca, barba, roupa, vibe."
   - "Quer um **mascote**? Como ele é? (animal, cor, estilo, roupa)"
   - "Tem mais alguém fixo na marca? (sócio, co-host, assistente de IA)"
   - "Qual o **ambiente/cenário** padrão? (ex: escritório futurista, estúdio clean, loja...)"
   - "Qual a **paleta de cores** da marca? E qual cor a **legenda** deve acender quando a palavra é falada?" (vira o campo `cor_legenda` no `personagens.json`, em hex; é a cor da legenda karaokê e das animações de tela.)
   - "Tem um **logo** que aparece nas cenas?"
   (Se o dono já tem identidade visual na `soft-designer`, reaproveite ela aqui, inclusive a cor da marca pra `cor_legenda`, em vez de perguntar do zero.)
2. Monte `config/personagens.json` no ESQUELETO REAL abaixo (é o que `01_gen_images.py` e `07_karaoke.py` de fato leem; o `config/personagens.example.md` não é lido em app-mode, por isso o esqueleto vive aqui no corpo). Campos EXATOS, sem inventar nem aninhar:
   - `estilo`: STRING única (ex.: `"ULTRA-REALISTIC ANIME-CINEMATIC 3D STYLE, premium movie-poster quality"`). **Obrigatório.**
   - `ambiente`: STRING única do cenário padrão (ex.: `"a modern futuristic studio at night, neon glow, HUD panels, bokeh"`). **Obrigatório.**
   - `paleta`: **STRING** de prosa (NÃO array). Ex.: `"deep navy, coral red, cyan glow, gold, cream. Cinematic neon lighting, ultra detailed"`.
   - `cor_legenda`: hex SEM `#` (ex.: `"4ade80"`) , cor que a legenda karaokê e as animações acendem. Default verde `4ade80` se o dono não tiver marca.
   - `personagens`: mapa **PLANO** `{ "chave": "descrição detalhada em inglês pro gpt-image-2" }` (NÃO aninhe `papel`/`prompt_en`; a descrição inteira é a string). Inclua os **"NUNCA"** de cada um DENTRO da string (ex.: `"...NEVER an insect, NEVER a smooth ball head"`) pra segurar o gpt-image-2 no personagem certo.
   - `trio_sempre`: array das chaves que aparecem em TODA cena (ex.: `["principal","mascote","cohost"]`).
   - `extras` (opcional): mapa plano de personagens que só entram conforme a fala.
   - `safe_area`: STRING com o bloco CRITICAL SAFE-AREA dos 70% centrais (ex.: `"CRITICAL SAFE-AREA: this becomes a 16:9 video. Keep ALL characters, faces, logos and key text inside the central 70%. Leave top ~18% and bottom ~18% as pure environment only."`). **Obrigatório** , sem ele o crop 16:9 come cabeças/logos.
   NÃO invente campos fora dessa lista (ex.: `cta_take` não é campo daqui; o CTA é `config/cta_take.mp4`, ver 0.3). Cada descrição em inglês e SEMPRE igual pra manter consistência entre vídeos.
3. **Aprovação do elenco por imagem de teste , depende do ambiente:**
   - **No Code / agente-Telegram (tem Bash):** gere 1 imagem de teste de cada personagem com `scripts/01_gen_images.py` (a partir de um `scenes.json` de teste) e abra pro dono aprovar ANTES de produzir vídeo.
   - **No app (sem Bash):** NÃO há como gerar imagem, então esta aprovação NÃO acontece aqui. **Nunca simule o "OK" do dono.** Entregue o plano com o elenco marcado `[PENDENTE: aprovar elenco com 1 imagem de teste no Code antes de produzir]` e siga montando o resto do plano; a aprovação real fica pro Code.

### 0.3 CTA final (opcional)
Pergunte se o dono quer um **card de encerramento fixo** (aparece no fim de todo vídeo). Se sim, ajude a criar: gere a imagem 9:16 no gpt-image-2 com os personagens + o texto/oferta dele → anime no Veo → salve em `config/cta_take.mp4`. Reuse em todos os vídeos. (A copy do CTA passa pelo guardrail anti-IA do produto: sem travessão, sem frase de robô, PT-BR completo.)

### 0.4 Transcrição local (whisper.cpp): SETUP ÚNICO do Code
A transcrição roda LOCAL (sem chave paga) e cospe timestamps por palavra, que a legenda karaokê usa. Rode UMA vez por máquina (só no Code/agente, precisa de Bash + `git` + `cmake` + `ffmpeg`):
```bash
bash scripts/setup_whisper.sh                      # modelo small (default)
WHISPER_MODEL=medium bash scripts/setup_whisper.sh # PT-BR mais fiel, mais pesado
```
Clona e compila o whisper.cpp em `vendor/whisper.cpp` e baixa o modelo. Depois disso, `scripts/06_transcribe_local.py entrada.mp4` transcreve word-level de graça. **STOP:** se o setup falhar (falta cmake/git), avise o dono o que instalar antes de seguir. No **app (sem Bash)** este passo não roda: a transcrição fica pro Code. Detalhe técnico em `references/legenda-e-animacoes.md`.

---

## PIPELINE (depois do onboarding)
1. **Ingestão:** ffprobe; extrair áudio; conferir se o vídeo já tem legenda (printar frames) e onde está.
2. **Corte de roteiro (ligado):** transcrever LOCAL word-level (`scripts/06_transcribe_local.py`, whisper.cpp, sem chave paga), reler, cortar partes que não mudam a mensagem. **Mostrar os cortes pro dono aprovar.** Cortar em pausas limpas. **Guarde o `words.json`:** ele volta no passo 7 (legenda karaokê). **Na mesma leitura, escolher a FRASE COMPLETA do GANCHO** pelos critérios viralização/expectativa/forte-polêmica (ver passo 8b).
3. **Corte de silêncio (ligado):** `scripts/00_silence_cut.py`. Legenda queimada anda junto.
4. **Planejar b-roll:** nº takes = ceil(dur/8); janelas contíguas; mapear fala→cena. Escrever `scenes.json` (cada cena: id, quais personagens, pose, elementos) usando os personagens do dono.
5. **Gerar imagens** (`scripts/01_gen_images.py`): gpt-image-2 1536x1024 high + crop 16:9 `crop=1536:864:0:80` (safe-area no prompt). **Abrir no computador do dono e esperar ele aprovar.**
6. **Animar** (`scripts/02_animate.py`): Veo 3.1 fast image-to-video 16:9, **câmera empacada + `negativePrompt`** (proíbe deturpar corpo/membros/look/cenário/texto). Pool de chaves Gemini (429 = pular).
7. **Legenda karaokê (padrão da casa)** (`scripts/07_karaoke.py video_base.mp4 words.json saida.mp4 [palavras_por_pagina] [cor_hex]`): a palavra falada acende na `cor_legenda` da marca no instante exato, a partir do `words.json` do passo 2. FFmpeg-first: pagina as palavras (default 4/página), renderiza um estado por palavra ativa e queima com `overlay + enable`. Legende o **CORPO já cortado** (não legende trecho que vai sair). **Alternativas:** B) usar a legenda que já veio no vídeo; C) Submagic, só se o dono preferir a paga. Receita completa em `references/legenda-e-animacoes.md`.
7b. **Animações de tela (opcional, pra retenção)** (`scripts/08_screen_fx.py MODO ...`): **wipe** (marca-texto crescendo atrás da palavra-âncora do gancho), **reveal** (frase palavra a palavra), **bar** (lower-third deslizando). Uma por momento, não empilhar. Puxam a `cor_legenda`. O texto passa pelo guardrail anti-IA do produto antes de queimar.
8. **Montar** (`scripts/03_assemble.py`): b-roll SEMPRE no RODAPÉ (16:9, full width, alt 608, borda fina no topo) + apresentador em cima. Se o vídeo já tem legenda baixa, cortar o teto morto (`crop=1080:1312:0:~400`) e `vstack`. → gera o CORPO.
8b. **GANCHO / cold open , PADRÃO v4 (ligado)** (`scripts/05_hook.py`): copiar a **FRASE COMPLETA mais forte** pro comecinho , **só o apresentador, SEM b-roll** , com um **efeito** (`pb` preto-e-branco / `vhs` / `fantasma` / `tv_velha`) E a **mesma frase numa faixa** na tela (gancho sonoro + visual). Depois **transição** (`xfade=fadeblack`) pro corpo. A frase continua no lugar original. Ordem final: **gancho, corpo, CTA, música**.
   - **FRASE COMPLETA, nunca cortada na metade** (A/B pegam a frase inteira, mesmo passando um pouco de 5s).
   - **Faixa: MÁX 2 LINHAS**, fonte ~50% menor (range 66→28px), posição centro+15% (terço inferior). Já está no `05_hook.py`.
   - **O agente escolhe a frase sozinho** pelos critérios: viralização · gera expectativa · forte/polêmica.
   - **MICRO-GATE ANTI-IA (rode ANTES de imprimir a frase, sempre, mesmo em app):** varra o texto do gancho, da faixa e do CTA atrás dos caracteres/padrões PROIBIDOS abaixo. Se achar qualquer um, REESCREVA e só então mostre. NÃO se autodeclare limpo sem varrer.
     1. **Travessão `,` (em-dash) e `–` (en-dash): PROIBIDOS.** Se a frase tiver um, reescreva trocando por ponto final, dois pontos ou vírgula. Ex.: "Você não está gorda , está inflamada" vira "Você não está gorda. Está inflamada." O traço de menos `-` de palavra composta pode ficar; o que some é o traço longo que separa oração.
     2. Sem frase de robô / abertura genérica de IA (nada de "descubra como", "a verdade que ninguém conta", "isso vai mudar tudo").
     3. PT-BR completo: sem palavra em inglês solta, sem reticências decorativas, sem emoji na faixa.
     Só depois de a frase passar nos 3 itens é que ela pode ir pra tela. Detalhe do protocolo na `soft-anti-ia`; o micro-gate acima é a versão executável que roda mesmo sem essa skill carregada (app-mode).
9. **CTA no final** (se configurado): anexar `config/cta_take.mp4` com transição `xfade=fade:0.7` (sem corte seco). (`scripts/04_build_final.py` faz CTA + música.)
10. **Música de fundo discreta:** `loudnorm=I=-34:TP=-6:LRA=6` + `volume=0.38`, `amix normalize=0`, fade in/out. NUNCA sobrepõe a fala.
11. **Export 4K** + salvar na pasta de saída do dono. Abrir pra ele ver.

## SUB-TÁTICAS DE RETENÇÃO (opções de formato/edição, marca-neutra, ligar conforme a peça)
Alavancas genéricas de edição que puxam retenção. Cada uma é OPCIONAL e escolhida pela peça; não empilha todas de uma vez (mesma lógica de "uma animação por momento"). Qualquer texto que apareça na tela passa antes pelo micro-gate anti-IA (passo 8b).
- **Vídeo satisfatório ao lado da fala:** em vez de (ou junto com) o b-roll de cena, a faixa de baixo roda um clipe visualmente satisfatório e sem relação direta com o assunto (algo repetitivo e agradável de ver) que segura o olho enquanto o apresentador fala. É uma variação do b-roll do rodapé, entra no lugar da cena de IA quando o objetivo é só reter, não ilustrar. Mantém a regra do rodapé (nunca cobre o apresentador em cima).
- **Som de corte no 1º segundo do gancho:** um efeito sonoro curto e seco (buzina, apito, "whoosh") logo no primeiro segundo do gancho, junto do cold open. Quebra o silêncio do feed e fisga o ouvido antes da 1ª palavra. Entra no passo do gancho (8b), nivelado pra nunca estourar a fala (mesma régua da música do passo 10).
- **Formato REACT:** o vídeo principal aparece numa janela e um segundo plano (o apresentador ou outra pessoa) reage a ele ("olha o que esse cara está falando"). A reação empresta contexto e curiosidade a um material que sozinho não seguraria. É um formato de montagem alternativo ao talking-head puro.
- **UGC / conteúdo caseiro (GC):** depoimento ou fala gravada com cara de caseiro (celular na mão, luz de casa, sem produção), que passa como conteúdo real de pessoa comum e não como anúncio. Serve de gancho ou de prova. Aqui a edição é mínima de propósito: o "mal acabado" é o que faz parecer autêntico, então não pule polindo demais.

## REGRAS INVIOLÁVEIS
- B-roll **image-first** (gpt-image-2 → Veo). Nunca texto→vídeo direto.
- B-roll **sempre no rodapé**, nunca no meio. Apresentador inteiro em cima.
- **Imagem aprovada = verdade absoluta.** O Veo só ANIMA, não recria. `negativePrompt` obrigatório.
- **Personagens sempre consistentes** com `config/personagens.json`. Trio (ou elenco fixo) presente em toda cena; extras conforme a fala.
- Checkpoint: **aprovar as imagens antes de animar.**
- **Texto na tela roda o MICRO-GATE ANTI-IA (passo 8b) antes de queimar** (gancho, faixa, CTA). É acionável, não decorativo: varra os caracteres proibidos com o travessão `,` explícito no topo, e SE achar travessão, reescreva com ponto/vírgula e só então mostre. Proibido imprimir a frase e se autodeclarar "anti-IA: passou" sem ter varrido. Em app-mode (sem a `soft-anti-ia` carregada) este micro-gate É o guardrail.

## CUSTO (referência)
Veo 720p ~$0,10/s → take de 8s = $0,80. Imagem gpt-image-2 ~$0,165. Vídeo de 60s ≈ 8 takes ≈ **~$8**. As chaves são do dono (paga OpenAI/Google direto). **Transcrição e legenda karaokê custam $0** (rodam local no whisper.cpp + FFmpeg): matam a legenda paga e a chamada de transcrição da OpenAI.

## GOTCHAS
- Corte do topo do b-roll = crop + zoom do Veo → safe-area no prompt + Veo empacado (sem zoom).
- `xfade` exige timebase igual: `settb=AVTB` nos dois lados.
- Rodar gerações como `.py` em background; baixar vídeo do Veo com `curl -L` + `&key=`.
- Fontes de legenda/faixa/animação: os scripts tentam DejaVu/Liberation (Linux/VPS) primeiro e caem pra Arial/Helvetica no Mac. A DejaVuSans-Bold cobre acentuação PT-BR; garanta que o texto chega em UTF-8.
- **whisper.cpp:** setup é passo ÚNICO (`setup_whisper.sh`, precisa git+cmake). Binário novo = `build/bin/whisper-cli`, antigo = `main`; `06_transcribe_local.py` acha os dois. PT-BR errando acento? Use `WHISPER_MODEL=medium`.
- **Legenda/animação:** `crop` com `t` NÃO anima largura neste FFmpeg (avalia na config); por isso o wipe usa `drawbox` (aceita `t` na largura) e o bar usa `overlay` com `y` dirigido por `t`. Já resolvido nos scripts.

## When NOT to use
- Pediram a IDEIA ou o ROTEIRO do vídeo (o que falar): isso é `soft-conteudo-reels`, aqui o roteiro já tem que existir.
- Pediram carrossel, slide, banner ou arte estática: `soft-designer`.
- Pediram só a copy da legenda, do gancho ou do CTA sem produzir o vídeo: escreva a copy e passe pelo guardrail anti-IA do produto (sem travessão, sem frase de robô, PT-BR completo).
- Estão no app (claude.ai) e querem o MP4 pronto: não renderiza fora do Code. Entregue o plano de cenas + paginação da legenda + copy em doc e avise que o render roda no Code.
- Não existe gravação talking-head crua pra editar: sem material de entrada não há o que cobrir com b-roll.
- Pediram gráfico animado, chart de dado ou audiograma: fora do escopo (esta skill é talking-head + b-roll + legenda/animação de texto). As animações de tela daqui são só de TEXTO.

## Anti-Patterns
- Gerar vídeo direto do texto no Veo: o b-roll é image-first (gpt-image-2 depois anima), nunca texto→vídeo.
- Animar sem o dono aprovar as imagens: aprovação da imagem é checkpoint obrigatório antes do Veo.
- Deixar o Veo recriar a cena: ele só ANIMA a imagem aprovada, sempre com `negativePrompt`.
- Pôr b-roll no meio da tela ou cobrindo o apresentador: b-roll fica no rodapé, apresentador inteiro em cima.
- Música que sobe e cobre a fala: sempre discreta (`loudnorm` + `volume=0.38`, `amix normalize=0`).
- Queimar texto na tela sem passar pelo filtro anti-IA: gancho, faixa, legenda, animações e CTA passam antes.
- Cortar a frase do gancho na metade pra caber em 5s: pega a frase COMPLETA mesmo passando um pouco.
- Voltar a pagar legenda/transcrição quando a da casa resolve: o padrão é whisper.cpp local + karaokê próprio (custo $0); Submagic só se o dono pedir.
- Legenda numa cor fora da marca: a legenda karaokê acende na `cor_legenda` do `personagens.json` (a mesma cara do carrossel/banner), não numa cor aleatória.
- Empilhar as 3 animações de tela ao mesmo tempo: polui. Uma por momento.


## GATE OBRIGATORIO soft-critico-copy

Antes de entregar QUALQUER linha de copy publica que sai desta skill (headline, hook, corpo, CTA, script, roteiro, legenda, e-mail, mensagem, pagina), a copy passa por soft-critico-copy: 4 filtros na ordem (CUB, Estrutura-mae, Anti-IA, Verbatim). Se reprova em qualquer um, reescreve e reroda ate zero falha dura.

Rodar: `python3 ~/.claude/skills/soft-critico-copy/scripts/lint_copy.py <arquivo>`
