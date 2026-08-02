# Personagens do dono — modelo

O agente monta o arquivo `config/personagens.json` no onboarding, a partir das respostas do dono.
Cada descrição deve ser **detalhada e em inglês** (o gpt-image-2 entende melhor) e SEMPRE igual pra manter consistência.

Exemplo de `config/personagens.json`:

```json
{
  "estilo": "ULTRA-REALISTIC ANIME-CINEMATIC 3D STYLE, premium movie-poster quality",
  "ambiente": "a modern futuristic studio/office at night, neon glow, holographic HUD panels, depth and bokeh",
  "paleta": "deep navy, coral red, cyan glow, gold, cream. Cinematic dramatic neon lighting, ultra detailed",
  "cor_legenda": "4ade80",
  "personagens": {
    "principal": "NAME, the host: <etnia, idade, cabelo/careca, barba, roupa, vibe — bem detalhado>",
    "mascote": "MASCOT, a <animal/cor/estilo>, <textura, olhos, roupa, proporção — bem detalhado>",
    "cohost": "NAME2, <descrição>"
  },
  "trio_sempre": ["principal", "mascote", "cohost"],
  "extras": {
    "cliente": "diverse happy customer people",
    "agente": "a young digital salesperson avatar with subtle holographic glow"
  },
  "safe_area": "CRITICAL SAFE-AREA: this becomes a 16:9 video. Keep ALL characters, faces, logos and key text inside the central 70%. Leave the top ~18% and bottom ~18% as pure environment only, so nothing is lost on crop."
}
```

Regras pra ficar bom:
- Inclua sempre os "NUNCA" de cada personagem (ex.: "NEVER an insect", "NEVER a smooth ball head") pra travar o gpt-image-2.
- Se o mascote tiver foto de referência, peça ao dono e descreva fielmente.
- `trio_sempre` = quem aparece em TODA cena.
- `cor_legenda` = a cor hex (sem `#`) que a legenda karaokê e as animações de tela acendem quando a palavra é falada. Use a cor da marca do dono (a mesma do carrossel/banner na `soft-designer`). Se ele não tiver uma, deixe o verde do produto `4ade80`. É esse campo que `07_karaoke.py` e `08_screen_fx.py` leem.
