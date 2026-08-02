---
name: soft-designer
description: "A skill UNICA de design VISUAL do metodo Soft: entra quando o pedido e o ARTEFATO renderizado (o arquivo, PNG ou imagem em si), nao o texto. Ancora, arte/PNG/capa renderizada (1080x1350, banner, deck) = designer; a HEADLINE e o CORPO/copy = soft-conteudo. Recebe a tese/copy pronta e produz o ARQUIVO final: carrossel PNG, banner, deck HTML animado, capa de video ou prompt de imagem-IA. Opera como FABRICA: a identidade do cliente vem de um JSON (nunca pergunta cor nem fonte de quem ja tem arquivo salvo), o lote roda com checkpoint (cai no meio, retoma sozinho), o lote inteiro vira um mosaico pra auditoria em conjunto, e as regras duras (setinha de arraste, print ilegivel, tarja LGPD) sao codigo que RECUSA a peca, nao conselho escrito. Use pra design, arte, PNG, carrossel visual, banner, deck animado, thumbnail, prompt de imagem, lote de pecas. NAO use pra texto de headline, roteiro ou carta (soft-conteudo, soft-funil-carta), nem posicionamento (soft-plano-posicionamento)."
---

> REGRA DURA DE FRASE, TODA FRASE SE EXPLICA SOZINHA (vale em tudo que
> esta skill escreve pro publico). Copy Soft e frase que gera imagem na
> cabeca de quem le frio, sem depender do slide anterior nem do titulo.
> Teste antes de aprovar: "se essa frase caisse solta no scroll de quem
> nunca ouviu falar do produto, ela entenderia O QUE + PRA QUEM + O
> RESULTADO?" Nao? Reescreve nomeando o objeto explicito.
>
> REGRA-IRMA, NENHUM VERBO ORFAO. Todo verbo vem com objeto nomeado na
> mesma frase (cortar O QUE, parar de QUE, mudar O QUE). O leitor tem
> cerebro preguicoso e nao completa a frase por voce.

# Soft Designer, a fabrica de visual do metodo

Esta skill e a UNICA responsavel pelo artefato visual do metodo Soft:
carrossel, banner, slide, deck animado, thumbnail, prompt de imagem. Ela
NAO e artesa (uma peca de cada vez, cor perguntada toda vez): ela e
FABRICA, identidade do cliente e DADO carregado de um arquivo, lote
inteiro roda com retomada automatica, e o proprio lote se audita junto
numa folha so, e as regras duras sao codigo que recusa a peca errada
antes dela sair.

Zero default fixo de qualquer pessoa dentro desta skill. Todo dado de marca (cor,
fonte, tag do topo, texto de botao) entra pelo arquivo de identidade do
CLIENTE em `assets/identidade-<cliente>.json`. Cliente novo = arquivo
novo, o motor da skill e o mesmo pra todo mundo.

## Output Contract (o que voce entrega)
- **Carrossel:** PNGs 1080x1350 na ordem, prontos pra postar.
- **Banner/criativo:** estatico (headline + copy-curta + CTA visual).
- **Slides estaticos:** deck 16:9 em PNG.
- **Deck HTML animado ao vivo:** Reveal.js + GSAP, hospedado, pra
  apresentar com tela compartilhada. Processo em
  `references/formato-deck-animado.md`.
- **Prompt de imagem-IA:** quando a peca pede ilustracao/cena (nao
  tipografico-editorial). Texto SEMPRE por overlay, nunca dentro da
  imagem gerada. `references/processo-design.md` secao 8.
- **Capa/thumbnail de video:** rosto real + gancho de 3-5 palavras +
  alto contraste. `references/processo-design.md` secao 8.5.
- **Mosaico do lote:** UMA imagem de contato com todas as pecas lado a
  lado, pra auditoria em conjunto antes da entrega final.
- Voce mostra preview e PARA antes de exportar. Nunca exporta sem o
  "pode exportar" explicito do dono.

---

## M0, identifica o artefato antes de qualquer pergunta

Antes de perguntar qualquer coisa, decide 3 coisas pelo que ja chegou
no pedido:

1. **Que formato?** Carrossel / banner / slides estaticos / deck
   animado / thumbnail / prompt de imagem, se nao estiver claro,
   pergunta com 2-3 opcoes nomeadas, nunca em aberto.
2. **Quantas pecas?** Uma peca avulsa segue o fluxo normal (Passo 0 a
   6). **A partir de 3 pecas na mesma leva, e um LOTE**: entra o
   Passo 4-B (checkpoint + mosaico) depois do preview.
3. **Tem identidade de cliente salva?** Confere se existe
   `assets/identidade-<cliente>.json`. Achou: aplica sem perguntar cor
   nem fonte. Nao achou: seguem as perguntas do Passo 2, e ao fim
   OFERECE salvar como arquivo novo pra nunca mais perguntar.

## P0, checklist do que ja chegou pronto

Antes de comecar, confere o que o pedido ja trouxe, pra nao perguntar
o que ja foi dado:
- [ ] Copy/tese de cada card ja veio (de soft-conteudo-* ou do dono)?
- [ ] Identidade visual do cliente ja existe em arquivo?
- [ ] Referencia visual (print, link, "igual ao ultimo") foi anexada?
- [ ] E lote (3+ pecas) ou peca avulsa?
- [ ] Formato final: postar como imagem, ou apresentar ao vivo?

Marca o que falta e pergunta SO isso, uma pergunta de cada vez, com
2-3 opcoes quando fizer sentido.

## Retomabilidade

Todo lote grava estado em `/tmp/soft-designer-<slug>-<epoch>.json`
(slug = tema curto do pedido). Se a conversa cair no meio, a skill
retoma de onde parou lendo esse arquivo, nunca recomeca do zero. O
checkpoint do RENDER em si (pecas ja exportadas) e outro arquivo,
separado, em `<pasta-de-saida>/.checkpoint.json` (ver Passo 4-B).

---

## Passo 0, le o perfil e ancora a copy-visual (NAO PULE)

Le o perfil do usuario (`shared-references/crivo/00-perfil-do-usuario.md`):
avatar, banco de provas, voz e nicho sao DELE. Sem perfil, vai pro
onboarding antes de produzir.

Le tambem a identidade visual do CLIENTE da peca (ver M0 acima ,
`assets/identidade-<cliente>.json`, esquema em
`assets/identidade.schema.json`). Cores, fontes e formato sao dele; a
skill e marca-neutra.

O que entra: a tese ou briefing da peca. O que NAO vem pronto e a
**copy-visual** (a frase que vai dentro do desenho), isso e trabalho
daqui, sempre passando pelo Crivo:
1. **Ancora** no verbatim real do publico (`shared-references/crivo/01-entrada-verbatim.md`).
2. **Escreve/afia** uma frase por card, na espinha (Formula 7).
3. **Passa pelo gate de copy** `shared-references/crivo/03-gate-cub.md`.
4. **Anti-IA**: roda `python3 scripts/lint_copy.py` na copy-visual.

> STOP de nicho regulado (BLOQUEANTE): nicho de conselho de classe
> (medico, dentista, fisio, nutri, psicologo, advogado, contador,
> financas) roda tambem `shared-references/crivo/04-gate-regulado.md`.
> Na duvida, trata como regulado. Sem promessa de cura, sem prazo
> cravado, sem antes/depois de paciente; ressalva obrigatoria no texto.

Antes de gerar QUALQUER pixel: **STOP.** Copy-visual precisa estar
aprovada pelo Crivo antes do desenho comecar.

## Passo 1, detecta a superficie e a funcao de cada peca

As superficies do metodo, cada uma com sua reference:
- **Carrossel** → `references/processo-design.md`. Aplica
  `references/deteccao-automatica.md` pra inferir a funcao de cada
  card (hook, problema, virada, metodo, prova, oferta, CTA). Declara
  a lista ao usuario antes de seguir.
- **Banner/criativo** → `references/processo-banner.md`.
- **Slides estaticos (PNG)** → `references/processo-slides.md`.
- **Deck HTML animado** → `references/formato-deck-animado.md`.
- **Pagina/site** → HTML no padrao do metodo (fundo chapado, 1
  accent, tipografia editorial, cantos retos).
- **Capa/thumbnail** → `references/processo-design.md` secao 8.5.
  Precisa de 2 insumos antes de desenhar: foto de referencia do dono +
  ancoragem do gancho (falas reais de dor/desejo do avatar).

> Branch de imagem-IA (corta transversal): quando a peca pede
> ilustracao em vez de tipografia editorial, o render vira prompt de
> imagem-IA. Texto SEMPRE por overlay, nunca dentro da imagem. Detalhe
> em `references/processo-design.md` secao 8.

## Passo 2, aplica a identidade OU pergunta (2-3 opcoes por vez)

**Primeiro confere se existe `assets/identidade-<cliente>.json`.**
Existe: carrega com `scripts/identidade.py` e aplica sem perguntar
nada de cor/fonte. Nao existe: pergunta, UMA pergunta de cada vez,
sempre com 2-3 opcoes nomeadas (nunca pede hex cru):

| Familia | Quando usar |
|---|---|
| Editorial Preto | Posicionamento, manifesto, oferta premium |
| Clinico Branco | Listas, comparativo, prova de numero (default mais seguro) |
| Manuscrito Cru | Storytelling pessoal, confissao, antes/depois |

Depois da familia: qual cor de destaque, qual combinacao tipografica
(ver `references/tipografia.md` pra opcoes prontas). Ao final das 3
perguntas, **oferece salvar como `assets/identidade-<cliente>.json`**
usando `assets/identidade.schema.json` como molde, assim a proxima
peca desse cliente nao pergunta de novo.

> STOP de design: sem identidade aplicada (arquivo OU respostas), nao
> gera HTML.

Antes de gerar HTML, le tambem os references obrigatorios:
`references/escala-densidade.md`, `references/tipografia-quebra-linhas.md`,
`references/setinha-arraste.md` (carrossel).

## Passo 3, decide o layout e escreve o HTML com Python

Pra cada peca, pega a funcao detectada (Passo 1) e o layout
correspondente da familia (Passo 2). Sempre Python pra gerar HTML
(nunca shell heredoc, `$` e crase corrompem string). Esqueleto:
`scripts/build_carousel.py` + `assets/template-base.html`.

As 7 regras inegociaveis do desenho:
1. Fundo chapado (preto `#0A0908` ou branco `#F5F2EC`/`#FFFFFF`).
2. Hierarquia de 2 niveis no maximo (titulo + corpo).
3. Espaco negativo brutal (30-50% do slide vazio).
4. UMA cor de destaque por peca, em 2-4 palavras-chave.
5. Negrito e arma: 2-4 palavras, weight 700/800.
6. Tipografia mista e assinatura (serif OU sans pesada, nunca as duas).
7. Sem chrome do Instagram; seta de arraste + handle nos slides 1 a
   N-1 do carrossel (nunca no ultimo, ver Passo 5 pra checagem em
   codigo).

Anti-orfa na origem: envolve TODO texto com `nw()` de `scripts/craft.py`.

## Passo 4, mostra preview e PARA

Cria o HTML e mostra so a peca LIMPA. Pergunta exatamente:

> "Quais slides precisam de ajuste antes de eu exportar os PNGs?"

Nao exporta nada antes de aprovacao explicita. Ajuste pedido: edita
so o slide mencionado, nunca regenera o lote inteiro por 1 ajuste.

## Passo 4-B, LOTE: checkpoint + mosaico (so quando sao 3+ pecas)

Esta e a diferenca entre artesa e fabrica. Depois do preview aprovado
no Passo 4, ANTES do export final:

1. **Renderiza com checkpoint**, usa `scripts/lote.py`, que grava o
   progresso peca a peca em `<saida>/.checkpoint.json`. Se cair no
   meio (rede, timeout, kill), roda `lote.py` de novo com o MESMO
   `--checkpoint` e ele pula o que ja esta pronto, nunca recomeca do
   zero.
   ```
   python3 scripts/lote.py --spec pecas.json --output <pasta> \
       --checkpoint <pasta>/.checkpoint.json
   ```
2. **Monta o mosaico**, junta todas as pecas do lote numa folha de
   contato so, com `scripts/mosaico.py`:
   ```
   python3 scripts/mosaico.py --dir <pasta> --output <pasta>/mosaico.png
   ```
   Erro de layout raramente se ve peca a peca, se ve quando uma
   destoa das outras no meio do conjunto. **Olhe o mosaico antes de
   entregar o lote**, e se algo destoar, corrige so aquela peca e
   remonta o mosaico.
3. **Roda o gate da setinha no lote inteiro** (nao peca a peca) ,
   `scripts/craft.py` tem `audit_lote_setinha()`: recebe a lista de
   HTML de todas as pecas na ordem e recusa se a numeracao "N/total"
   aparecer solta, se a seta faltar em alguma peca de 1..N-1, ou se a
   ultima peca tiver seta.

Sem o mosaico visto e sem o gate da setinha passando, o lote nao esta
pronto pra exportar.

## Passo 5, roda o GATE VISUAL por dentro antes de exportar

Auditoria silenciosa (checklist interno, nunca sai na entrega). Cada
falha corrige o desenho daquela peca e re-roda o gate.

| Check | Passa se |
|---|---|
| Contraste por pele | cada bloco de texto contrasta forte contra o fundo IMEDIATO atras dele (WCAG >= 3:1). Pele clara -> texto escuro; pele escura -> texto claro |
| Anti-orfa | nenhuma palavra sozinha na ultima linha de um bloco |
| Diagrama forte | traco 5-6px + marcador semantico + rotulo, se houver diagrama |
| 1 ideia por peca | card/slide carrega UMA ideia so |
| Legivel no celular | titulo lido sem esforco em 0.3s numa tela pequena |
| Fundo chapado + 1 accent + sem chrome | sem gradiente/textura/sombra; seta+handle no carrossel |
| Nada vazio/fantasma | todo elemento estrutural preenchido de verdade |
| Anti-IA (HARD) | zero travessao, zero verbo proibido (ver soft-critico-copy), zero frase-emoldura |
| Render nao mudou palavra | texto desenhado = o que passou no Crivo (Passo 0) |
| Numero tem lastro | todo numero desenhado veio do briefing/banco de provas |
| Gancho de capa (so thumbnail) | 3-5 palavras contadas, estilingue de curiosidade real |
| Regulado (so nicho de conselho) | sem promessa de cura/prazo/antes-depois; ressalva presente |
| **Print vira prova?** | se a peca usa print/screenshot como prova, rodou `scripts/ocr_check.py` na imagem e o OCR leu pelo menos 1 numero de 2+ digitos. Nao leu = print ilegivel nao vira prova, recusa |
| **Tarja LGPD** | print de conversa/DM/dado pessoal tem nome e foto de terceiro tarjados antes de virar peca |
| **Thumbnail nao virou fundo** | miniatura/preview de video nunca foi esticada como imagem de fundo de peca |
| **Crop nao cortou a cabeca** | qualquer recorte de rosto reserva espaco acima do cabelo, nunca corta topo da cabeca |
| **VEREDITO** | = o pior item acima. Um X qualquer = corrige e re-roda |

Cinto extra em codigo: `python3 scripts/craft.py audit <preview.html>`
(contraste + orfa) e `scripts/ocr_check.py <print.png>` (legibilidade
de prova). O `export_pngs.py` ja chama `craft.py` sozinho e recusa
exportar peca com falha dura.

## Passo 6, exporta e entrega

Com o gate PASSA e o "pode exportar" do usuario:
```
python3 scripts/export_pngs.py --html <preview.html> --output <pasta>
```
Saida: `slide_01.png`, `slide_02.png`, … Se foi lote (Passo 4-B), o
mosaico ja foi conferido antes deste passo. Apresenta so as pecas
limpas na ordem, sem tabela de gate, sem meta. Fecha em 1 frase: "Pronto,
suas N pecas estao ai, na ordem. E so baixar e postar."

---

## When NOT to use (manda pra skill certa)
- Headline/gancho de TEXTO (nao a arte) → soft-conteudo-headlines.
- Corpo de texto longo, caption, roteiro, carta → soft-conteudo-carrossel/-reels/-stories.
- Plano/posicionamento/fundacao → soft-plano-posicionamento.
- Slides operados DENTRO do webinar (conteudo) → soft-webinar-slides.
- Copy publica antes de virar arte → gate obrigatorio em soft-critico-copy.

## Anti-Patterns
| Sintoma | Correcao |
|---|---|
| Exportou sem mostrar preview | Volta: mostra, pergunta ajuste, espera "pode exportar" |
| Perguntou cor/fonte de cliente que ja tem identidade salva | Confere `assets/identidade-<cliente>.json` ANTES de perguntar |
| Lote grande sem checkpoint, caiu e recomecou do zero | Sempre `lote.py` com `--checkpoint` em lote de 3+ pecas |
| Entregou lote sem ver o mosaico | Roda `mosaico.py`, olha a folha inteira antes de exportar |
| Print borrado virou prova | `ocr_check.py` reprova, so entra print onde o OCR le numero |
| Setinha faltando no meio ou sobrando no ultimo slide | `audit_lote_setinha()` recusa, corrige e re-roda |
| Regra dura ficou so no texto, ninguem checou | Rode o script de codigo correspondente, nao confie so no olho |

## References (pra profundidade, o fluxo acima e autossuficiente)
- `references/processo-design.md`, `processo-banner.md`,
  `processo-slides.md`, `formato-deck-animado.md`: pipelines completos
  por formato.
- `references/identidade-visual-cliente.md`: a versao em prosa de como
  ler/aplicar identidade (o JSON em `assets/` e a versao em dado).
- `references/familia-editorial-preto.md`, `familia-clinico-branco.md`,
  `familia-manuscrito-cru.md`: regras de cor/tipografia/layout.
- `references/escala-densidade.md`, `tipografia.md`,
  `tipografia-quebra-linhas.md`: escala e tipografia.
- `references/auditoria-pre-preview.md`: as perguntas detalhadas do
  gate visual (Passo 5 e o resumo executavel).
- `references/setinha-arraste.md`: espec exata do SVG por familia
  (a mesma que `audit_lote_setinha()` checa em codigo).
- `references/layouts.md`, `layout-utilitario.md`,
  `layout-tweet-avatar.md`, `layout-diagrama-manuscrito.md`,
  `elementos-manuscritos.md`, `deteccao-automatica.md`: repertorio.
- `assets/identidade.schema.json`: esquema do JSON de identidade.
- `assets/identidade-exemplo.json`: exemplo preenchido de uma marca ficticia.
- `scripts/identidade.py`: carrega o JSON de identidade, valida campo
  obrigatorio faltando.
- `scripts/lote.py`: render em lote com checkpoint (retoma sozinho).
- `scripts/mosaico.py`: junta o lote inteiro numa folha de contato.
- `scripts/craft.py`: `nw()` anti-orfa, `legible()`/`audit()` contraste
  WCAG, `audit_lote_setinha()` regra da seta em codigo.
- `scripts/ocr_check.py`: recusa print ilegivel como prova (via
  tesseract).
- `scripts/build_carousel.py`: esqueleto de geracao de HTML.
- `scripts/export_pngs.py`: export Playwright, ja chama `craft.py`.
- `scripts/lint_copy.py`: anti-IA na copy-visual.
