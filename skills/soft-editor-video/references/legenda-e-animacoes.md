# Legenda karaokê + transcrição local + animações de tela (referência técnica)

Receita completa da camada de TEXTO da skill: legenda word-level que acende na cor da marca,
transcrição 100% local (sem chave paga) e 3 animações de tela úteis pro reels do método.
Tudo FFmpeg-first, sem render headless nem framework pesado de front-end. O miolo executável está
aqui; a `SKILL.md` traz a versão
curta no corpo pra rodar sem abrir esta referência.

## Índice
- [1. Transcrição local (whisper.cpp), mata a chamada paga](#1-transcricao-local-whispercpp)
- [2. Formato word-level (o insumo comum)](#2-formato-word-level)
- [3. Legenda karaokê word-level (acende na cor da marca)](#3-legenda-karaoke-word-level)
- [4. Animações de tela (wipe, reveal, bar)](#4-animacoes-de-tela)
- [5. Cor da marca (de onde vem)](#5-cor-da-marca)
- [6. Ramo dos 3 ambientes](#6-ramo-dos-3-ambientes)
- [7. Gotchas](#7-gotchas)

---

## 1. Transcrição local (whisper.cpp)

Antes a transcrição chamava a API paga da OpenAI (Whisper) e só servia pra cortar silêncio/roteiro.
Agora a transcrição roda LOCAL com whisper.cpp: um tiro, dois coelhos. Mata o custo por minuto E
entrega o timestamp POR PALAVRA, que é exatamente o que a legenda karaokê precisa.

### Setup (passo ÚNICO do Code, roda uma vez por máquina do dono)
```bash
bash scripts/setup_whisper.sh
# modelo maior, PT-BR mais fiel:
WHISPER_MODEL=medium bash scripts/setup_whisper.sh
```
O `setup_whisper.sh` clona e compila o whisper.cpp em `vendor/whisper.cpp` (cmake, Release) e baixa
o modelo GGML. `small` é o default (bom custo/benefício); `medium` transcreve PT-BR mais fiel e pesa
mais. Sem chave, sem custo por minuto. Dependências: `git`, `cmake`, `ffmpeg`.

### Transcrever
```bash
python3 scripts/06_transcribe_local.py entrada.mp4 [saida.words.json]
# variáveis: WHISPER_MODEL (small|medium|...) e WHISPER_LANG (default pt)
```
Por dentro: extrai áudio 16kHz mono wav (o que o whisper.cpp espera), roda o binário com `-ml 1`
(uma palavra por segmento = timestamp por palavra) e `-ocsv`, parseia o CSV e cospe o JSON word-level.

Isso substitui a transcrição paga em DOIS lugares:
1. **Corte de roteiro/silêncio:** a mesma transcrição alimenta a leitura pra decidir os cortes.
2. **Legenda karaokê:** os `startMs`/`endMs` por palavra são o insumo direto do `07_karaoke.py`.

## 2. Formato word-level

O JSON que o `06_transcribe_local.py` gera e que `07_karaoke.py` consome:
```json
{
  "language": "pt",
  "words": [
    {"text": "voce",    "startMs": 200,  "endMs": 600},
    {"text": "nao",     "startMs": 650,  "endMs": 950},
    {"text": "precisa", "startMs": 1000, "endMs": 1500}
  ]
}
```
Uma palavra por item, com início e fim em milissegundos. É o contrato entre a transcrição e a
legenda. Se um dia entrar outra fonte de transcrição, basta ela cuspir esse mesmo formato.

## 3. Legenda karaokê word-level

A palavra falada ACENDE na cor da marca no instante exato. Substitui a legenda paga (era
terceirizada): agora fica 100% no nosso controle de fonte, cor, tamanho e marca. É o elemento
visual mais presente num reels, então controlar isso é controle de marca.

### Mecânica (o que o `07_karaoke.py` faz)
1. **Pagina** as palavras em blocos de N por vez (default 4). Menos palavras por página deixa o
   efeito mais "palavra-a-palavra". Também quebra a página quando o intervalo entre duas palavras
   passa de 700ms (pausa natural da fala).
2. Pra cada página, **mede a largura de cada palavra** com PIL e monta as linhas centralizadas
   (mesma família de fonte do gancho: DejaVuSans-Bold no Linux/VPS, cai pra Liberation/Arial).
3. Renderiza **um PNG por estado-de-palavra-ativa**: a página inteira em branco, com UMA palavra na
   cor da marca (a que está sendo falada). Contorno preto grosso pra ler em cima de qualquer fundo.
4. **Queima com FFmpeg**: cada PNG entra como `overlay` com `enable='between(t, ini, fim)'` no
   intervalo exato daquela palavra. O encadeamento dos overlays produz a palavra acendendo na cor
   da marca no timing do áudio.

### Uso
```bash
python3 scripts/07_karaoke.py video_base.mp4 words.json saida.mp4 [palavras_por_pagina] [cor_hex]
# ex: python3 scripts/07_karaoke.py corpo.mp4 corpo.words.json corpo_legendado.mp4 4 4ade80
```
`palavras_por_pagina` default 4. `cor_hex` sem `#` (ex `4ade80`); se omitir, puxa a cor da marca do
dono (ver seção 5).

### Por que FFmpeg e não render headless
O efeito é overlay de PNG por intervalo de tempo. Não precisa de motor de render por navegador
headless (Node + Chromium) nem de framework de front-end. A skill continua FFmpeg-first e leve. O
trade-off: não temos o easing suave de mola; a troca de palavra é um corte limpo no `between()`. Pra
reels lo-fi do método isso basta e é o padrão que domina reels/shorts. Se um dia quisermos o efeito
de mola/wipe suave numa camada específica, aí sim caberia uma composição mínima à parte, sem trazer
uma stack pesada inteira.

## 4. Animações de tela

Três movimentos de TEXTO que seguram retenção no gancho e na frase-âncora, sem inflar custo (é
render de texto, não Veo). NÃO são motion-graphics de dado (chart/waveform): esses ficam fora do
escopo desta skill (é talking-head + b-roll). Todos em `scripts/08_screen_fx.py`.

### wipe (marca-texto animado, pro gancho)
Uma faixa da cor da marca CRESCE da esquerda pra direita atrás de UMA palavra-âncora (caneta
marca-texto passando). Feito com `drawbox` de largura dirigida por `t` (a largura vai de 0 até o
tamanho da palavra durante ~0,5s, ancorada na esquerda), com o texto branco por cima.
```bash
python3 scripts/08_screen_fx.py wipe base.mp4 saida.mp4 "FRASE COMPLETA" "PALAVRA" [ini_s] [dur_s] [cor_hex]
```
Serve pra acender a palavra-âncora do gancho v4. Casa com o `05_hook.py` (a faixa do gancho).

### reveal (a frase entra palavra a palavra)
Cada palavra da frase entra num offset escalonado (pop-in). A última palavra entra na cor da marca
(fecha o gancho num ponto forte). Bom pra um card de frase forte no meio do reels.
```bash
python3 scripts/08_screen_fx.py reveal base.mp4 saida.mp4 "FRASE COMPLETA" [ini_s] [dur_s] [cor_hex]
```

### bar (lower-third que entra deslizando)
Uma faixa de apoio no terço inferior ENTRA deslizando de baixo (wipe vertical, via `overlay` com `y`
dirigido por `t`), fundo escuro semitransparente + barrinha da marca na lateral, some depois. Reforça
um ponto sem cobrir o rosto.
```bash
python3 scripts/08_screen_fx.py bar base.mp4 saida.mp4 "FRASE DE APOIO" [ini_s] [dur_s] [cor_hex]
```

### Quando usar cada uma
- **wipe:** UMA palavra-âncora a destacar (gancho, virada). Uma por reels, no comecinho.
- **reveal:** uma frase curta e forte que você quer "montando" na frente do espectador.
- **bar:** um dado ou reforço textual enquanto o apresentador fala, sem tirar ele da tela.
Não empilhe as três ao mesmo tempo (polui). Uma por momento.

## 5. Cor da marca

`07_karaoke.py` e `08_screen_fx.py` puxam a cor nesta ordem:
1. `cor_hex` passada no comando (ganha de tudo).
2. `config/personagens.json` → campo `cor_legenda`, ou o primeiro item de `paleta`.
3. Fallback: verde do produto (`4ade80`).

Assim a legenda e as animações usam a MESMA cara do dono que o carrossel/banner da `soft-designer`.
Se o dono tem identidade visual definida lá (`identidade-visual-cliente`), copie a cor pro
`personagens.json` (campo `cor_legenda`) no onboarding pra manter a marca consistente entre as peças.

## 6. Ramo dos 3 ambientes

- **Claude Code:** roda o pipeline inteiro (setup do whisper uma vez, transcrição local, karaokê,
  animações), FFmpeg de verdade. Entrega o MP4.
- **agente / Telegram (tem Bash):** roda igual ao Code. A entrega é o ARQUIVO; o path COMPLETO do MP4
  gerado vai na resposta, e as mensagens vão sem markdown pesado.
- **app / chat (claude.ai, sem Bash):** NÃO renderiza. A entrega possível é o PLANO em doc: a
  paginação da legenda (quantas palavras por vez, qual acende), a cor da marca, e qual animação de
  tela usar em qual momento, avisando que a transcrição, o karaokê e o render rodam no Code.

## 7. Gotchas

- **whisper.cpp binário:** o build novo gera `build/bin/whisper-cli`; versões antigas geram `main`.
  O `06_transcribe_local.py` procura os dois. Se o build mudar de nome de novo, ajuste a lista.
- **PT-BR:** `small` erra acento/palavra às vezes; `medium` é mais fiel. Rode `WHISPER_MODEL=medium`
  no setup se a legenda vier com erro. A copy que aparece na tela passa pelo guardrail anti-IA do
  produto (sem travessão, sem frase de robô, PT-BR completo) antes de queimar.
- **drawtext/drawbox e acento:** a fonte DejaVuSans-Bold cobre acentuação PT-BR. Confira que o texto
  chega em UTF-8.
- **crop com `t` NÃO funciona** neste FFmpeg pra largura animada (avalia só na config). Por isso o
  wipe usa `drawbox` (que aceita `t` na largura) e o bar usa `overlay` com `y` dirigido por `t`.
- **muitos overlays na legenda:** um reels longo gera muitos PNGs/estados. É barato (render de PNG),
  mas processe o CORPO já cortado (silêncio/roteiro) pra não legendar trecho que vai sair.
- **ordem no pipeline:** legende o CORPO depois do corte e da montagem do b-roll, antes do gancho e
  do CTA, pra a legenda andar junto com o vídeo final.
