# Método de edição — referência

Detalhamento do pipeline da `SKILL.md`. O processo é **b-roll image-first**: a IA gera a IMAGEM da cena, depois ANIMA a imagem. Nunca gera vídeo direto do texto (sai ruim e fora de padrão).

## Produção como alavanca de crença (o que mirar antes de editar)

A edição não é enfeite. A produção é o que faz o público ACREDITAR antes de qualquer argumento. Duas peças com a mesma copy convertem diferente pelo nível de produção. Alguns princípios que orientam COMO cobrir e montar o vídeo:

- **Rosto/expert na peça virou obrigação, não luxo.** O público confia no que vê uma pessoa real dizendo e demonstrando. Peça só de texto ou só de b-roll, sem rosto, parte atrás. Sempre que der, o especialista aparece (é por isso que o pipeline mantém o apresentador inteiro em cima e o b-roll no rodapé, nunca cobre a cara dele).
- **Formatos de Lead que sofisticam a abertura.** A abertura (a "Lead" do vídeo, o que o passo 8b escolhe) pode vestir formatos que carregam mais crença que o talking-head puro: o **Expert-paciente** (o especialista conversando com quem viveu o problema), o **podcast** (dois falando, clima de conversa honesta), a **reportagem** (formato de matéria), o **programa de saúde-e-bem-estar** (formato de programa de TV). Cada um empresta a credibilidade que o público já associa àquele formato. O gancho e o plano de cenas se moldam ao formato escolhido.
- **Traz alguém pra reafirmar o ápice emocional.** No pico da história, uma segunda pessoa que confirma (o cônjuge, um familiar, um cliente) multiplica a crença: deixa de ser só o especialista falando de si. Vale planejar uma cena de b-roll ou um take pra esse reforço no `scenes.json`.
- **Demonstração produzida vale mais que argumento.** Mostrar o mecanismo funcionando (uma cena de laboratório, um antes-e-depois, o objeto agindo) prova sem precisar convencer. Ao planejar o b-roll (passo 4), priorize cenas que DEMONSTRAM, não só ilustram.

### Orçamento é princípio, não tabela

Sobe o nível de produção conforme a mensagem se prova: começa com 1 rosto (o especialista) + 1 demonstração caseira, valida, e só depois investe em formatos sofisticados (programa, reportagem), elenco extra e estúdio. Nunca gasta pesado numa copy que ainda não vendeu.

## Por que cada passo
- **Corte de roteiro + silêncio:** deixa o vídeo enxuto e mais barato (cada take de Veo de 8s ≈ $0,80). Sempre aprovar os cortes de roteiro com o dono.
- **gpt-image-2 (1536x1024) → crop 16:9 (`crop=1536:864:0:80`):** a imagem nasce 3:2; o crop tira só topo/base. Por isso o prompt manda manter o conteúdo no centro 70% (safe-area) — nada importante nas bordas de cima/baixo.
- **Veo 3.1 fast image-to-video, câmera travada + `negativePrompt`:** o Veo só ANIMA a imagem aprovada. O `negativePrompt` impede ele de deturpar o personagem no meio do take (trocar membros, virar outra coisa, mexer no texto). Sem zoom, senão come as bordas.
- **B-roll no rodapé:** faixa 16:9 (1080x608) embaixo, com uma borda fina no topo separando. O apresentador fica em cima inteiro.
  - Se o vídeo do dono **já tem legenda** (geralmente embaixo), corta o teto morto acima da cabeça (`crop=1080:1312:0:~400`) e empilha (`vstack`) — assim cabe apresentador+legenda em cima e b-roll embaixo, sem cobrir nada.
- **CTA no final:** um card fixo (personagens + oferta do dono), colado com transição `xfade=fade:0.7` (sem corte seco).
- **Música de fundo:** SEMPRE discreta — `loudnorm=I=-34` (achata o crescendo pra não ir subindo) + `volume=0.38`, mixada com `amix normalize=0` (mantém a fala cheia e a música baixa). Nunca sobrepõe a voz.

## Parâmetros de API
- **gpt-image-2:** POST `api.openai.com/v1/images/generations`, size 1536x1024 (ou 1024x1536 vertical pro CTA), quality high, divisível por 16. Resposta `data[0].b64_json`.
- **Veo:** POST `generativelanguage.googleapis.com/v1beta/models/veo-3.1-fast-generate-preview:predictLongRunning?key=`, body image-to-video + `parameters:{aspectRatio, negativePrompt}`. Poll a operation; baixar o `uri` com `curl -L` + `&key=`. Saída 720p, 8s. Cada chave Gemini tem quota diária baixa de Veo → use VÁRIAS e rotacione no erro 429.
- **Transcrição local (whisper.cpp):** roda em `vendor/whisper.cpp` depois do setup único (`setup_whisper.sh`). Sem chave, sem custo por minuto. Cospe word-level. Substitui a transcrição paga da OpenAI.
- **Submagic (legenda paga, opcional):** POST `api.submagic.co/v1/projects` header `x-api-key`, `templateName:"Ella"`, poll até `completed`, baixar `directUrl`. Só se o dono preferir a paga; o padrão é a legenda karaokê da casa.

## Legenda karaokê + animações (a camada de texto)
Receita técnica completa em `references/legenda-e-animacoes.md`. Resumo:
- **Transcrição local** cospe timestamps por palavra; **legenda karaokê** (`07_karaoke.py`) acende a palavra falada na `cor_legenda` da marca, FFmpeg-first (overlay de PNG por intervalo, sem render headless).
- **Animações de tela** (`08_screen_fx.py`): `wipe` (marca-texto crescendo com `drawbox` dirigido por `t`), `reveal` (frase palavra a palavra) e `bar` (lower-third deslizando com `overlay` `y` por `t`). São só de TEXTO, pra retenção; nada de chart/dado (fora do escopo).
- A cor vem de `config/personagens.json` (`cor_legenda`, ou hex no comando), com fallback verde `4ade80`.

## Ordem dos scripts
1. `06_transcribe_local.py entrada.mp4 palavras.json` (setup único antes: `bash setup_whisper.sh`)
2. `00_silence_cut.py entrada.mp4 saida.mp4`
3. (agente escreve `scenes.json`) → `01_gen_images.py scenes.json pasta_img` → **aprovar com o dono**
4. `02_animate.py pasta_img pasta_video`
5. `03_assemble.py base.mp4 pasta_video montado.mp4 [overlay|crop]` → gera o CORPO
6. `07_karaoke.py corpo.mp4 palavras.json corpo_legendado.mp4 [palavras_por_pagina] [cor_hex]`
7. (opcional) `08_screen_fx.py wipe|reveal|bar base.mp4 saida.mp4 "FRASE" [...]`
8. `05_hook.py talking_head.mp4 A B efeito "FRASE" corpo_legendado.mp4 com_gancho.mp4`
9. `04_build_final.py com_gancho.mp4 final_4k.mp4 [config/cta_take.mp4] [musica.mp3]`
