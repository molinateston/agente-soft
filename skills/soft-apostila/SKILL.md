---
name: soft-apostila
description: "Transforma uma aula/live gravada (Zoom, YouTube, MP4) em MATERIAL navegável, uma apostila/handout. Pipeline Whisper + Claude: extrai áudio → transcreve → limpa muletas → segmenta em capítulos → enriquece cada um (vira texto corrido, não transcrição crua). Output adapta ao ambiente: no chat entrega o material em Markdown; no Code renderiza a apostila HTML single-file (sidebar com índice, navegação por teclado, scroll-spy, mobile) e publica. Marca-neutra: tema/cor/ID vêm do dono. Use quando o dono quiser virar conteúdo gravado em material: bônus de webinar, isca/lead magnet, micro-aula do funil, módulo de mentoria, material de comunidade, ou repurpose de uma masterclass/imersão. NÃO use para roteiro/ideia de conteúdo de feed (soft-conteudo-carrossel/-reels/-stories), página de captura/venda (soft-funil-landing), proposta comercial (soft-proposta-comercial), nem edição de vídeo (soft-editor-video)."
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

**Papel:** skill operacional de **materialização de conteúdo**. Pega algo que o dono já gravou (aula, live, webinar, call) e devolve um material indexável, sem plataforma de EAD amarrada, versionável, com link próprio. Suporte de ENTREGA e de ISCA; não está no pipeline de copy dos funis. **É marca-neutra como a `soft-designer`**: não embute a cara de ninguém. Tema, cor e identidade vêm do dono (puxe da `soft-designer`). Método completo e autossuficiente: `references/reference.md` (LER antes de executar).

## 📦 O QUE ESTA SKILL PRODUZ

Uma **apostila** (material navegável) a partir de uma gravação, via pipeline Whisper + Claude:

- **Áudio → transcrição** (ffmpeg → Whisper, `--language pt`).
- **Limpeza** das muletas de fala (pré-pass sed + prompt Claude que preserva a voz e os exemplos do dono; não resume, não inventa).
- **Segmentação em capítulos** (8–15) com índice.
- **Enriquecimento** de cada capítulo: vira texto corrido com intro e fechamento, mantendo as falas e exemplos reais do dono.
- **Material final** com **índice clicável, navegação por teclado, scroll-spy, capítulo de Resumo** e variações (player de áudio sincronizado, embed do YouTube, quiz por capítulo, export PDF).

**Output, adapta ao ambiente (regra do autor do método):**
- **No chat (Claude.ai):** entrega o material em **Markdown** limpo (capítulos enriquecidos, formato mapa-mental). Simples.
- **No Claude Code:** **renderiza** a apostila HTML single-file (sidebar + nav por teclado + tema escuro/responsivo) e **publica** no Cloudflare Pages (padrão Soft), com a ID visual do dono.
- Regra: `chat → MD · code → site`. Mesmo conteúdo, destino diferente.

**Onde se aplica no método Soft:**
- **Isca / lead magnet** (`soft-funil-isca`): uma masterclass gravada vira a isca navegável no lugar do PDF antigo.
- **Bônus do webinar/oferta** (`soft-webinar-plano`): material complementar gerado da própria gravação do webinar.
- **Micro-aula do funil** (`soft-funil-miniwebinar`): o micro-treinamento entregue como apostila.
- **Entrega da mentoria/produto**: cada call/aula vira material indexado pra comunidade (menos churn).

**Invioláveis:** mantém a VOZ e os exemplos reais do dono (nunca inventa conteúdo); a copy do material passa pela **varredura anti-IA** do passo 5 (padrões banidos inline abaixo, PT-BR completo, sem travessão em-dash, sem frase-emoldura); o visual segue a ID do dono na `soft-designer`.

**Serve o agente:** equipa o LEON/cliente a transformar acervo gravado em entregável (isca, bônus, material de mentoria) sem editor nem plataforma de EAD.

## Output Contract

- **Entregável:** UMA apostila enriquecida (8 a 15 capítulos), texto corrido com índice.
- **Formato:** MD consolidado no chat; no Code, também o HTML single-file navegável publicado.
- **Fidelidade:** só o que o dono disse na gravação, na voz dele. Nada inventado.
- **STOP obrigatório:** mostra o índice de capítulos proposto e PARA antes de escrever o material inteiro.

## ⚠️ ENTREGA = UM doc MD

O resultado é UM documento só: a apostila consolidada em Markdown, entregue de uma vez no fim (artifact no chat, arquivo no Code), nunca despejada capítulo a capítulo solto no meio da conversa. No chat o destino é o MD limpo em formato mapa-mental; no Code o mesmo conteúdo vira o site. Regra: `chat → MD · code → site`.

**No agente/Telegram:** tem Bash (roda o pipeline Whisper igual ao Code), mas gera a apostila como ARQUIVO (`apostila.md`, ou o HTML se pedido) e cita o path completo na resposta (o bridge anexa). A condução vai em mensagens curtas, sem markdown pesado (sem `##`, sem tabela `|` no texto ao dono); o material vai no arquivo, não no corpo da mensagem.

## Como executar

Método completo em `references/reference.md` (LER antes). O miolo condensado:

### 1) Preparar a fonte (Code, com Whisper/Bash)

Só quando houver terminal. Extrai áudio e transcreve:

```bash
ffmpeg -i aula.mp4 -vn -acodec libmp3lame -ar 16000 -ac 1 aula.mp3
whisper aula.mp3 --language pt --model medium --output_format txt --output_dir ./out
```

`-ar 16000 -ac 1` é a taxa ideal pro Whisper. Modelo `medium` é o padrão pra apostila (`small` se o áudio for longo e faltar GPU, `large-v3` pra máxima qualidade). Saída: `out/aula.txt`.

**APP-FALLBACK (sem Whisper/Bash):** no app (Claude.ai), você NÃO transcreve nem publica, mas a apostila sai igual. Receba a transcrição pronta ou o texto colado pelo dono, siga direto pra segmentação e enriquecimento, e entregue a apostila como artifact MD, mesma fidelidade e mesma estrutura de capítulos. O HTML navegável e o deploy no Cloudflare Pages ficam como passo do Claude Code. Fecha em 1 linha o que ele passa a ganhar: "no Claude Code, com o Whisper, você me manda só o MP4 e eu transcrevo, monto e publico o site sozinho" (pra ele escolher, sem empurrar).

### 2) Limpar sem virar resumo

Tira as muletas de fala e PRESERVA a voz, a primeira pessoa e TODOS os exemplos do dono. Limpeza não é síntese: o conteúdo técnico, as nuances e os casos concretos ficam inteiros. Pré-pass opcional com regex, depois o modelo:

```bash
sed -E 's/\b(ahn|hum|tipo assim|né|então)\b//gi' out/aula.txt > out/aula-clean.txt
```

- **Remove:** pausas verbalizadas (ahn, hum), repetição "eu eu eu", autocorreções, "tipo", "sabe".
- **Mantém:** voz original, exemplos, listas, comandos, números que o dono citou.
- Se cair a densidade ou sumir um exemplo, você resumiu de mais: refaça.

### 3) Segmentar em 8 a 15 capítulos

Corta nas mudanças naturais de tópico do próprio material, não em fatias iguais de tempo. Cada capítulo:

- Título descritivo de 5 a 9 palavras, numerado. **Conte as palavras de cada título antes do STOP**: menos de 5 ou mais de 9 refaz (ex.: "Por que o tutor de gato foge da clínica comum" tem 10, corta pra "Por que o tutor de gato foge"; "Precificando o atendimento especializado" tem 4, abre pra "Como precificar o atendimento especializado sem medo").
- Começa numa frase específica do texto (marque o trecho de início).
- Resumo de 1 frase do que aquele capítulo ensina.

Alvo de 800 a 2000 palavras por capítulo: menos que isso fica raso, mais que isso cansa. Junte tópicos curtos, quebre os longos. Fecha sempre com um capítulo "Resumo" em bullets do que foi visto.

> **⛔ STOP.** Monte a lista de capítulos (número, título, resumo de 1 frase) e mostre ao dono ANTES de escrever o material. Só siga pro enriquecimento depois do OK. Não escreva a apostila inteira de uma vez sem esse aval.

### 4) Enriquecer cada capítulo

Vira texto corrido, não transcrição crua. Por capítulo:

- **Intro de 2 a 3 frases** que situa o tema do capítulo. Abre DIRETO no conteúdo, nunca com moldura meta: proibido "Este capítulo é sobre...", "Neste capítulo você vai...", "A verdade é que...". Zero travessão em-dash `,` (usa ponto ou hífen). Zero verbo de transformação vazio (transformar, desemperrar, potencializar); usa concreto (funciona, resolve, tira, muda).
- **Corpo em prosa fluida**, mantendo o tom didático e as falas reais do dono; exemplos práticos onde forem naturais (os que ele deu, ou variações fiéis do que ele ensinou).
- **Fechamento** de 1 parágrafo que amarra a ideia.
- Listas, comandos e código, quando existirem na fala, viram Markdown formatado.

Exemplo ilustrativo de recorte de capítulo (nicho fictício; modela a qualidade, nunca copia): de uma aula de confeitaria, o trecho onde o dono explica ponto de calda vira o capítulo "3. O ponto de calda que não empedra", com intro do porquê a calda falha, o passo dele em prosa e o fechamento com o teste do fio. Nada de fórmula nova: só o que ele disse, arrumado.

### 5) Varrer anti-IA, consolidar e (no Code) publicar

**Antes de fechar, varra o material inteiro pelo filtro anti-IA e reescreva o que acusar.** É passo acionável, não decoração do gate: o enriquecimento é o que mais planta esses tells. Padrões banidos (inline, porque no app roda só o corpo):

- **Travessão em-dash `,`** (zero-tolerância): todo `,` sai, vira ponto ou hífen. Inclui título e `<title>` do HTML. No Code, `grep -n ',' apostila.md` tem que voltar vazio antes de publicar.
- **Frase-emoldura** que promete revelação: "Este capítulo é sobre...", "Neste capítulo...", "A verdade é que...", "O segredo está em...". Reescreve abrindo direto no conteúdo.
- **Verbo de transformação vazio**: transformar, revolucionar, desemperrar, potencializar, alavancar, elevar. Troca por concreto (funciona, resolve, ataca, tira, muda). Família "emperrar/empacado/desemperrar" banida sempre, exceto fala literal do dono entre aspas.
- **Tricolon performático** (a, b e c com mesma cadência): quebra em frases próprias.

Detalhes e exemplos de reescrita em `references/reference.md` (seção "Checklist anti-IA"). Só depois de varrer: concatene os capítulos em UM `apostila.md`. No chat, esse MD é a entrega. No Code, injeta no template HTML single-file (sidebar com índice, navegação por teclado, scroll-spy, drawer mobile, âncora por capítulo) e publica no Cloudflare Pages com a ID visual do dono (puxada da `soft-designer`). Detalhes de template, build e deploy: `references/reference.md`.

## Gate (antes de entregar)

- **Fidelidade:** cada afirmação sai da gravação. Zero método, número ou fala inventados.
- **Voz preservada:** soa como o dono, não como resumo neutro de IA.
- **Exemplos intactos:** os casos concretos que ele deu continuam no material.
- **Segmentação:** 8 a 15 capítulos, cortados por tópico, com "Resumo" no fim.
- **Anti-IA:** a varredura do passo 5 rodou de fato: zero travessão em-dash `,` (checou `grep -n ','` no Code), zero frase-emoldura ("Este capítulo é sobre..."), zero verbo de transformação vazio, PT-BR com acentuação correta. Padrões inline no passo 5 e em `references/reference.md`.
- **Entrega:** UM doc MD consolidado (não capítulos soltos no chat).

## When NOT to use

- Roteiro/ideia de conteúdo de feed: `soft-conteudo-carrossel` / `-reels` / `-stories`.
- Headline/gancho isolado: `soft-conteudo-headlines`.
- Página de captura ou venda: `soft-funil-landing`.
- Ativo de isca do zero (não a partir de gravação): `soft-funil-isca`.
- Proposta comercial: `soft-proposta-comercial`.
- Edição/corte do vídeo em si: `soft-editor-video`.
- Arte/visual/tema da apostila: `soft-designer`.

## Anti-Patterns

- Resumir a aula em vez de materializar: some a voz e os exemplos do dono.
- Inventar exemplo, número ou etapa que o dono não disse na gravação.
- Fatiar por tempo igual em vez de cortar por mudança de tópico.
- Despejar capítulo por capítulo no chat em vez de UM doc MD no fim.
- Escrever a apostila inteira sem o STOP do índice aprovado.
- Publicar o HTML no app sem Whisper/Bash: deploy é passo do Claude Code.


---

## RÉGUA DE DIAGRAMAÇÃO obrigatória (18/07/2026)

Todo doc/entregável que essa skill produz DEVE seguir `skills/shared-references/REGUA-DIAGRAMACAO-DOCS.md`:

- Topo: rótulo pequeno + título grande + subtítulo + metadata `chave: valor`
- Números ANTES da narrativa (seção "0" com tabela/KPI ancora tudo)
- Numeração hierárquica (1, 2, 3.1, 3.2), divisa entre seções
- Bloco padronizado que se repete em TODAS as seções
- Bullet > parágrafo, com palavra-âncora em **negrito**
- Callouts (azul/verde/amarelo/vermelho) 1 por seção no máximo
- Comparação = 2 colunas paralelas · Fluxo = seta ↓ · KPI = cards
- Aspas literais pra citação · badges pra marcar novidade
- Fecha com checklist acionável (dono/prazo quando existe)
- Zero gordura: NUNCA "vale destacar", "importante notar", "além disso", "por outro lado", "em suma", "conforme mencionado", "neste documento", "vamos explorar"
- **Zero changelog** dentro do doc (não escreva "atualizei X, antes era Y")
- **Zero meta-processo** ("pesquisei X, cruzei com Y")
- 1 bloco = 1 tela de celular (o dono lê no Telegram)

**Teste antes de entregar:** (1) topo bate no padrão? (2) número ancora antes da narrativa? (3) bloco padronizado repete? (4) callout ≤1 por seção? (5) checklist acionável no fim? (6) zero das palavras proibidas? Se sim nos 6 → entrega. Se não → reescreve.

============================================================
GATE OBRIGATORIO · soft-critico-copy
============================================================

Antes de entregar QUALQUER linha final publica pro dono
(headline, capa, corpo, slide, script, sequencia, carta,
landing, isca, oferta, WhatsApp, e-mail, bio, CTA), esta
skill invoca o GATE UNIVERSAL soft-critico-copy passando o
texto pronto + o tipo de peca.

Como acionar:

1. Salva a copy pronta em /tmp/copy-<slug>-<epoch>.txt
2. Invoca a Skill soft-critico-copy com:
   - texto: o conteudo do arquivo
   - tipo_de_peca: um de {headline, capa, corpo, slide,
     script_reel, sequencia_stories, carta, landing_bloco,
     landing_completa, isca_copy, oferta, whatsapp, email,
     script_sdr, script_closer, pos_venda, bio, cta}
   - contexto (opcional): tese-mae, avatar, verbatim_ref

O gate retorna: passou_nos_4 (sim/nao) + falhas em 4 filtros
(CUB, Estrutura-mae, Anti-IA, Verbatim) com trecho, motivo e
sugestao de reescrita.

Se reprovou, aplica as sugestoes e re-invoca. Loop de no
maximo 3 iteracoes. Se ainda reprovar, escala pro dono com
as falhas listadas (nao insiste automatico ao infinito).

Substitui qualquer gate anti-IA anterior desta skill. O
soft-critico-copy JA roda o lint_copy.py internamente no
filtro 3 (Anti-IA), mais 3 filtros adicionais (CUB,
Estrutura-mae, Verbatim).
