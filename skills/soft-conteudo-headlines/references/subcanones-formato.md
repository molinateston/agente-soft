# Renderização por formato (o mesmo cânone, comprimido pro teto)

> **Doutrina (do dono):** gancho é gancho, headline é headline. **A plataforma NÃO é família de gatilho, é camada de RENDERIZAÇÃO.** A mesma fórmula do cânone (`templates.md`, 6 famílias por gatilho) serve pra qualquer formato: o que muda é o **teto físico** (quantas palavras/caracteres cabem), e a headline é **comprimida** pra caber. **Zero fórmula exclusiva de plataforma.** Os antigos moldes "de reel / de YouTube / de e-mail" foram absorvidos no cânone (ver "Onde foram parar os antigos moldes" abaixo): os que eram estrutura própria viraram fórmulas T; os que eram jeito de comprimir um T viraram nota de compressão aqui.

## Índice
- [Os tetos por formato](#os-tetos-por-formato)
- [Uma fórmula, quatro renderizações (o exemplo que ensina a compressão)](#uma-formula-quatro-renderizacoes-o-exemplo-que-ensina-a-compressao)
- [O protocolo de compressão (o teto vira validação DURA)](#o-protocolo-de-compressao-o-teto-vira-validacao-dura)
- [Onde foram parar os antigos moldes H/Y/E](#onde-foram-parar-os-antigos-moldes-hye)

---

## Os tetos por formato
É a mesma tabela do gate (Passo 4 do SKILL.md), aqui com a evidência que justifica cada teto. Onde há **dois eixos** (palavras E caracteres), os DOIS têm que passar.

| Formato-destino | Teto em palavras | Teto em caracteres (com espaço) | Evidência do teto |
|---|---|---|---|
| Reel, 3s falados | ≤ 7 | n/a (falado) | 71% decidem ficar/pular nos 3s; retenção 70-85% puxa ~2,2x views, 85%+ ~2,8x; o gancho falado decide a curva |
| Reel, texto na tela | ≤ 5 | ≤ 40 por linha | leitura em tela pequena, a linha estoura o quadro acima disso |
| **Carrossel, capa** | **8 a 15** | **≤ 65 na linha-título** | acima disso vira parágrafo e não lê como capa |
| Stories, abertura | 5 a 10 | ≤ 50 na linha de topo | a barra de topo do story corta o resto |
| Anúncio, 1.7s falados | ≤ 5 | n/a (falado) | o 1º frame do vídeo-anúncio decide o skip |
| Anúncio, 5s falados | ≤ 10 | n/a (falado) | a janela antes do "pular anúncio" |
| Email/Substack, assunto | 8 a 12 | ≤ 45 no assunto | pergunta puxa ~46% de abertura, 2-4 palavras ~46%; valor monetário 29% vs 13%; mobile corta acima de ~45c |
| Título de YouTube | n/a | 50 a 70 (hook nos ~40 primeiros) | sweet spot 50-60c (base grande de títulos); 40-60c rende +8,9% CTR; mobile mostra só ~40c, o hook vai na frente |

**Contagem:** número em algarismo conta 1 palavra ("40 anos" = 2); caractere = letra + espaço + pontuação. Número sempre em algarismo (ocupa menos, lê mais rápido). Lastro das faixas: bases de estudo externas distantes (retenção de vídeo curto, títulos de YouTube, assunto de e-mail B2B); fontes completas em `mineracao-benchmark.md`.

## Uma fórmula, quatro renderizações (o exemplo que ensina a compressão)
Pega **UMA** fórmula, **T40 · De [PROBLEMA/DOR] a [DESEJO]** (família Recompensa), com a mesma munição (nicho fictício: consultor que quer o funil rodando sozinho). Veja a MESMA ideia comprimida pro teto de cada formato, sem perder o gatilho:

| Formato | Renderização | Conta |
|---|---|---|
| **Reel, 3s falados** (≤7 palavras) | "De agenda vazia a aula vendendo sozinha." | 7 palavras ✓ |
| **Título de YouTube** (50-70c) | "De agenda vazia pra uma aula que vende no automático" | ~52 caracteres ✓ |
| **Assunto de e-mail** (≤45c) | "De agenda vazia a venda automática" | ~35 caracteres ✓ |
| **Capa de carrossel** (8-15 palavras, ≤65c) | "Saí da agenda vazia pra uma aula que vende todo dia sozinha" | 11 palavras / ~59c ✓ |

O **gatilho** (a transformação de-para) sobrevive nas quatro; o que muda é quanto texto cabe. É isso que a renderização por formato faz: **não troca a fórmula, aperta o texto**. A mesma lógica vale pra qualquer T do cânone.

## O protocolo de compressão (o teto vira validação DURA)
1. Escolhe a fórmula T pela **família de gatilho** (não pela plataforma) em `templates.md`.
2. Preenche os slots com a munição real (Passo 0) e escreve a headline **densa**.
3. **CONTA** (não estima) contra o teto do formato-destino: palavras faladas (`| wc -w` no Code), caracteres com espaço (`| wc -m` no Code; à mão com folga no app/chat).
4. Estourou por 1 unidade em qualquer eixo: **comprime** (corta palavra que não muda o sentido) ou **corta** a oração secundária. **Nunca corta o gatilho.**
5. **PROIBIDO** marcar como aprovada alegando "dentro do teto" sem ter contado. Essa alegação sem contagem é a fraude que o gate endurecido do SKILL.md (Passo 4) mata.

O teto contado é o que torna a renderização confiável e não palpite: a base diz o número, e a peça só sai se respeita o número de fato.

## Onde foram parar os antigos moldes H/Y/E
A skill separava por plataforma (H = reel falado, Y = YouTube, E = e-mail). Isso era organização errada. Cada antigo molde foi reclassificado (veredito completo em `mineracao-benchmark.md`, Rodada 2):

**Viraram fórmula T (eram estrutura própria, universal):**
- **In media res** (abrir no meio da cena) → **T62** (família Mistério).
- **Prova crua / proof-first** ("Fiz [X] fazendo isso") → **T42** (família Recompensa).
- **Confissão de erro** ("eu errei nisso por [tempo]") → **T64** (família Crença).
- **Tom de colega** ("uma coisa rápida") → **T63** (família Mistério).
- **Negação / reverse-psych** ("não abre esse [X]") → **T71** (família Disrupção).

**Viraram nota de compressão (eram só um T comprimido pro teto de um formato):**
- Comando de proibição "Para de [ação]" = **T1** (face de proibição), comprimido ≤7 palavras.
- Callout ultraespecífico "Se você [X], escuta" = **T9/T15/T20/T81**, comprimido pra reel.
- Declaração contrária = **T5/T28/T64**, comprimida.
- Pergunta com lacuna "Por que [X] e não [Y]?" = **T61**, comprimida.
- Alerta de dano invisível "Teu [X] tá te fazendo perder [Y]" = **T56**, comprimido.
- Número+resultado+tensão / curiosity-gap / contraste / mito / resultado-sem-obstáculo de título = **T25/T30 · T12/T21 · T13/T40 · T5/T26 · T36**, renderizados no teto 50-70c.
- Curiosity-gap curto / auto-diagnóstico / benefício direto / número-lista / valor específico de assunto = **T16 · T27 · T33 · T25 · T42**, renderizados no teto ≤45c.

**Hoje no banco único (`templates.md`, lastro EXTERNO):** o "experimento documentado" (**T116**, ex-C11, o antigo Y4) e a "credencial que abre a frase" (**T204**, ex-C12, o antigo Y5) rendem bem no teto de YouTube; saem sempre marcados com a origem EXTERNO até baterem baseline em 2 peças reais do dono. O irmão do T116 que **emula personagem conhecido** é CASA: **T75** (família Popularidade/Reputação).
