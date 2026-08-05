# Método de edição — referência

Detalhamento do pipeline da `SKILL.md`. O processo é **b-roll image-first**: a IA gera a IMAGEM da cena, depois ANIMA a imagem. Nunca gera vídeo direto do texto (sai ruim e fora de padrão).

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
- **Submagic (legenda):** POST `api.submagic.co/v1/projects` header `x-api-key`, `templateName:"Ella"`, poll até `completed`, baixar `directUrl`.

## Ordem dos scripts
1. `00_silence_cut.py entrada.mp4 saida.mp4`
2. (agente escreve `scenes.json`) → `01_gen_images.py scenes.json pasta_img` → **aprovar com o dono**
3. `02_animate.py pasta_img pasta_video`
4. `03_assemble.py base.mp4 pasta_video montado.mp4 [overlay|crop]`
5. `04_build_final.py montado.mp4 final_4k.mp4 [config/cta_take.mp4] [musica.mp3]`
