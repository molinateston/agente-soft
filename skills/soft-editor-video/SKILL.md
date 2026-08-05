---
name: soft-editor-video
description: "Editor de vídeo do método Soft: transforma um talking-head cru (9:16) num reels com b-roll gerado por IA (imagem no gpt-image-2 → animação no Veo 3.1 fast) na faixa de baixo e o apresentador inteiro em cima, mais corte de roteiro/silêncio, gancho (cold open), legenda, CTA fixo no final e música de fundo discreta. Marca-neutra: na PRIMEIRA vez roda o ONBOARDING (pede as chaves de API do dono e entrevista os personagens/identidade dele em config/), e cada cliente usa a própria cara. Use quando o dono mandar um vídeo pra editar, pedir b-roll, 'cobre o vídeo com cenas', gerar reels a partir de uma gravação, enxugar/cortar um vídeo, criar gancho/cold open, ou pôr CTA/música. NÃO use para roteiro/ideia de conteúdo (soft-conteudo / soft-conteudo-reels), nem para carrossel/slide/banner estático (soft-designer), nem para a copy da legenda em si (essa passa por soft-anti-ia)."
---

**Papel:** skill de domínio (operador de produção audiovisual). Suporte/infra, FORA do pipeline de copy dos funis — entra DEPOIS que o roteiro/ideia já existe (isso é da `soft-conteudo`/`soft-conteudo-reels`). Pega uma gravação talking-head e devolve um reels editado. **É marca-neutra como a `soft-designer`**: não embute a cara de ninguém — no onboarding entrevista o dono e salva o elenco/identidade dele em `config/personagens.json`, e cada cliente roda com a própria marca. As chaves de API são do dono (ele paga OpenAI/Google direto). Método detalhado: `references/metodo.md`.

## 📦 O QUE ESTA SKILL PRODUZ

Um reels vertical (9:16) finalizado a partir de um talking-head cru, com:

- **B-roll IA image-first** — gera a IMAGEM da cena (gpt-image-2) e depois ANIMA a imagem (Veo 3.1 fast, câmera travada + `negativePrompt`). Nunca texto→vídeo direto. B-roll SEMPRE na faixa de baixo; apresentador inteiro em cima.
- **Corte de roteiro + silêncio** — transcrição word-level (Whisper), enxuga o que não muda a mensagem (aprovado pelo dono) e tira os silêncios. Mais barato e mais ritmado.
- **Gancho / cold open (padrão v4)** — copia a frase mais forte pro comecinho, só o apresentador, com efeito + a mesma frase numa faixa, e transição pro corpo (`scripts/05_hook.py`).
- **Legenda** — Submagic automático, ou reusa a que já veio no vídeo.
- **CTA fixo no final** (opcional) — card de encerramento do dono colado com transição suave.
- **Música de fundo discreta** — nivelada pra nunca cobrir a fala.
- **Export 4K** na pasta de saída do dono.

**Identidade visual (marca-neutra):** os `personagens.json` SÃO a identidade do dono nas cenas (etnia/look do apresentador, mascote, sócio, ambiente, paleta, logo). Se o dono já tem ID visual definida na `soft-designer` (`identidade-visual-cliente`), puxe dela pra manter a mesma cara entre carrossel/banner e vídeo. Texto que aparece na tela (gancho, CTA) passa pelo filtro `soft-anti-ia` antes de queimar.

**Serve o agente:** equipa o LEON/cliente a produzir reels de atração sem editor humano. A IDEIA e o ROTEIRO vêm da `soft-conteudo`/`soft-conteudo-reels`; aqui é só a produção/edição.

---

## PASSO 0 — ONBOARDING (rodar SÓ se ainda não estiver configurado)

Antes de editar qualquer vídeo, verifique a configuração. **Se já existir, NÃO pergunte de novo** — siga direto pro pipeline.

### 0.1 Chaves de API
1. Verifique se existe `config/keys.env` (ou as variáveis no ambiente). Campos necessários:
   - `OPENAI_API_KEY` — gera as imagens (gpt-image-2) e transcreve (Whisper). **Obrigatória.**
   - `GEMINI_API_KEYS` — uma ou mais chaves Google AI (Veo 3.1 fast), separadas por vírgula. **Obrigatória.**
   - `SUBMAGIC_API_KEY` — legenda automática. **Opcional** (só se o vídeo não vier legendado).
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
   - "Qual a **paleta de cores** da marca?"
   - "Tem um **logo** que aparece nas cenas?"
   (Se o dono já tem identidade visual na `soft-designer`, reaproveite ela aqui em vez de perguntar do zero.)
2. Monte `config/personagens.json` no formato do `config/personagens.example.md` (cada personagem com uma descrição detalhada em inglês pro gpt-image-2; mantenha consistência). Defina `trio_sempre` = quem aparece em TODA cena.
3. Confirme com o dono mostrando 1 imagem de teste de cada personagem antes de produzir vídeo (gere com `scripts/01_gen_images.py` a partir de um `scenes.json` de teste e abra pra ele aprovar).

### 0.3 CTA final (opcional)
Pergunte se o dono quer um **card de encerramento fixo** (aparece no fim de todo vídeo). Se sim, ajude a criar: gere a imagem 9:16 no gpt-image-2 com os personagens + o texto/oferta dele → anime no Veo → salve em `config/cta_take.mp4`. Reuse em todos os vídeos. (A copy do CTA passa pelo `soft-anti-ia`.)

---

## PIPELINE (depois do onboarding)
1. **Ingestão:** ffprobe; extrair áudio; conferir se o vídeo já tem legenda (printar frames) e onde está.
2. **Corte de roteiro (ligado):** transcrever (Whisper word-level), reler, cortar partes que não mudam a mensagem. **Mostrar os cortes pro dono aprovar.** Cortar em pausas limpas. **Na mesma leitura, escolher a FRASE COMPLETA do GANCHO** pelos critérios viralização/expectativa/forte-polêmica (ver passo 8b).
3. **Corte de silêncio (ligado):** `scripts/00_silence_cut.py`. Legenda queimada anda junto.
4. **Planejar b-roll:** nº takes = ceil(dur/8); janelas contíguas; mapear fala→cena. Escrever `scenes.json` (cada cena: id, quais personagens, pose, elementos) usando os personagens do dono.
5. **Gerar imagens** (`scripts/01_gen_images.py`): gpt-image-2 1536x1024 high + crop 16:9 `crop=1536:864:0:80` (safe-area no prompt). **Abrir no computador do dono e esperar ele aprovar.**
6. **Animar** (`scripts/02_animate.py`): Veo 3.1 fast image-to-video 16:9, **câmera travada + `negativePrompt`** (proíbe deturpar corpo/membros/look/cenário/texto). Pool de chaves Gemini (429 = pular).
7. **Legenda:** A) Submagic (vídeo sem legenda) ou B) usar a que já veio.
8. **Montar** (`scripts/03_assemble.py`): b-roll SEMPRE no RODAPÉ (16:9, full width, alt 608, borda fina no topo) + apresentador em cima. Se o vídeo já tem legenda baixa, cortar o teto morto (`crop=1080:1312:0:~400`) e `vstack`. → gera o CORPO.
8b. **GANCHO / cold open — PADRÃO v4 (ligado)** (`scripts/05_hook.py`): copiar a **FRASE COMPLETA mais forte** pro comecinho — **só o apresentador, SEM b-roll** — com um **efeito** (`pb` preto-e-branco / `vhs` / `fantasma` / `tv_velha`) E a **mesma frase numa faixa** na tela (gancho sonoro + visual). Depois **transição** (`xfade=fadeblack`) pro corpo. A frase continua no lugar original. Ordem final: **gancho → corpo → CTA → música**.
   - **FRASE COMPLETA, nunca cortada na metade** (A/B pegam a frase inteira, mesmo passando um pouco de 5s).
   - **Faixa: MÁX 2 LINHAS**, fonte ~50% menor (range 66→28px), posição centro+15% (terço inferior). Já está no `05_hook.py`.
   - **O agente escolhe a frase sozinho** pelos critérios: viralização · gera expectativa · forte/polêmica. A frase passa pelo `soft-anti-ia` (nada que soe de IA na faixa).
9. **CTA no final** (se configurado): anexar `config/cta_take.mp4` com transição `xfade=fade:0.7` (sem corte seco). (`scripts/04_build_final.py` faz CTA + música.)
10. **Música de fundo discreta:** `loudnorm=I=-34:TP=-6:LRA=6` + `volume=0.38`, `amix normalize=0`, fade in/out. NUNCA sobrepõe a fala.
11. **Export 4K** + salvar na pasta de saída do dono. Abrir pra ele ver.

## REGRAS INVIOLÁVEIS
- B-roll **image-first** (gpt-image-2 → Veo). Nunca texto→vídeo direto.
- B-roll **sempre no rodapé**, nunca no meio. Apresentador inteiro em cima.
- **Imagem aprovada = verdade absoluta.** O Veo só ANIMA, não recria. `negativePrompt` obrigatório.
- **Personagens sempre consistentes** com `config/personagens.json`. Trio (ou elenco fixo) presente em toda cena; extras conforme a fala.
- Checkpoint: **aprovar as imagens antes de animar.**
- **Texto na tela passa pelo `soft-anti-ia`** antes de queimar (gancho, faixa, CTA).

## CUSTO (referência)
Veo 720p ~$0,10/s → take de 8s = $0,80. Imagem gpt-image-2 ~$0,165. Vídeo de 60s ≈ 8 takes ≈ **~$8**. As chaves são do dono (paga OpenAI/Google direto).

## GOTCHAS
- Corte do topo do b-roll = crop + zoom do Veo → safe-area no prompt + Veo travado (sem zoom).
- `xfade` exige timebase igual: `settb=AVTB` nos dois lados.
- Rodar gerações como `.py` em background; baixar vídeo do Veo com `curl -L` + `&key=`.
- Fontes da faixa do gancho: o `05_hook.py` tenta DejaVu/Liberation (Linux/VPS) primeiro e cai pra Arial/Helvetica no Mac.
