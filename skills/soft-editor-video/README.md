# soft-editor-video — Editor de Vídeo Reels com IA

Skill do método **Soft** para **Claude Code** que transforma um vídeo talking-head cru num **reels vertical** com b-roll gerado por IA (imagem no `gpt-image-2` → animação no **Veo 3.1 fast**), legenda, corte de roteiro e de silêncio, gancho/cold open, CTA no final e música de fundo discreta.

O b-roll fica sempre na **faixa de baixo** da tela e o apresentador aparece inteiro em cima. É **marca-neutra**: cada dono entrevista os próprios personagens no onboarding e usa a própria cara.

---

## Como usar

Abra o Claude Code e mande um vídeo pra editar, ex.:
> "edita esse vídeo aqui pra mim: /caminho/do/video.mp4"

**Na primeira vez**, o agente vai:
1. **Pedir suas chaves de API** (só uma vez — ele salva localmente em `config/keys.env`):
   - **OpenAI** → gera as imagens e transcreve. Pegue em https://platform.openai.com/api-keys
   - **Google AI / Gemini** → anima os vídeos (Veo). Pegue em https://aistudio.google.com/apikey
   - **Submagic** *(opcional)* → legenda automática. Pegue em https://app.submagic.co/account
2. **Entrevistar você sobre seus personagens** — quem aparece nas cenas dos seus vídeos (você, mascote, sócio, ambiente, cores, logo). Ele monta seu "elenco" e usa em todos os vídeos. Se você já tem identidade visual na `soft-designer`, ele reaproveita.
3. *(Opcional)* Ajudar a criar seu **card de CTA** fixo pro final dos vídeos.

Depois disso, é só mandar vídeos que ele edita sozinho seguindo o processo.

## Requisitos
- Claude Code
- `ffmpeg` e `python3` instalados
- Chaves de API (OpenAI + Gemini obrigatórias; Submagic opcional)

## Custo aproximado
~**US$ 8** por vídeo de 1 minuto (Veo + imagens). As chaves são suas — você paga direto OpenAI/Google.

## Privacidade
Suas chaves ficam só na sua máquina (`config/keys.env`, que **não** é versionado). Seus personagens ficam em `config/personagens.json`.
