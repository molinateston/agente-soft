# Processo: banner / criativo estático

> A superfície mais simples e mais implacável. Um banner tem 1 a 2 segundos pra parar o dedo e dizer UMA coisa. Aqui o designer escreve a copy-visual (a headline e a copy-curta) pelo Crivo e compõe o visual. Roda o Passo 0 (perfil do usuário) antes.

## Onde o banner entra

- **Tráfego pago (ingresso de webinar, isca, oferta):** o briefing vem da `soft-launch` (a tese, o público, o destino do clique). A copy-visual é escrita aqui.
- **Orgânico (capa de post único, anúncio de evento):** o briefing vem da skill `soft-conteudo-*` do formato da peça ou do usuário direto.

## A anatomia (3 elementos, nada mais)

Banner não é carrossel comprimido. É UMA mensagem. A regra é subtração:

1. **A headline que para.** Uma frase, a cena ou o número que invalida o frame do leitor. Sai do verbatim do perfil (`shared-references/crivo/01-entrada-verbatim.md`), no ângulo de ponto cego, e passa as 3 perguntas do gate (`shared-references/crivo/03-gate-cub.md`): dá pra ver a cena? é falsificável (fato, não adjetivo)? só este cliente diria? Headline de banner que o concorrente assina igual está reprovada.
2. **A copy-curta de apoio (opcional).** No máximo uma linha que ancora a headline (um número com lastro do banco de provas, uma sub-cena). Se não somar, corta. Banner com parágrafo é banner morto.
3. **O CTA visual.** O próximo passo, claro, com o destino certo (ver tabela abaixo). Em tráfego pago o CTA é obrigatório.

## O destino do clique decide o CTA (tráfego pago)

| Destino | O que o CTA promete |
|---|---|
| Checkout direto | a oferta nomeada (não "saiba mais") |
| Página de captura / isca | a troca clara (o que ele recebe por se cadastrar) |
| Aplicação / formulário | o filtro ("se você é X, aplique") |
| Webinar / aula | a promessa da aula + a data |

## O craft visual (os 3 segundos)

- **Quebra padrão:** fundo chapado, tipografia editorial ou pesada, espaço negativo brutal. O oposto do feed (gradiente, ícone colorido, sans média centralizada). Reusa as famílias visuais das references de carrossel (`familia-editorial-preto`, `clinico-branco`, `manuscrito-cru` quando existirem; ou as 3 famílias do `processo-design.md`).
- **Uma hierarquia só:** o olho cai na headline primeiro, sempre. Accent cirúrgico nas 2 a 4 palavras que a copy já marcou como o peso.
- **Mobile-first (`shared-references/filtro-mobile-first/`):** o banner vai ser visto em 6cm. Se a headline não é legível no celular em meio segundo, não é banner.

## A lei do render (igual carrossel)

A copy-visual passa pelo gate ANTES de desenhar. Roda `python3 scripts/lint_copy.py` na copy-visual (ele reprova em-dash e o verbo banido da anti-voz Soft, ver `shared-references/filtro-anti-ia/padroes-banidos.md`, falha dura re-roda). Depois de aprovada, o render não muda palavra; se o layout exigir mexer, re-passa a ancoragem e a headline do gate antes de exportar. Sem prova real no perfil, o número sai como placeholder marcado, nunca inventado.

**Gate de craft em código (enforcement, não confiança):** envolva todo texto com `nw()` de `scripts/craft.py` (anti-órfã) e rode `python3 scripts/craft.py audit <arquivo>.html` antes de exportar, ele reprova em código o "branco no branco" (contraste por luminância WCAG) e sinaliza órfã. O `export_pngs.py` já chama esse gate sozinho e **recusa exportar** peça com falha dura. É o que garante que os checks 14 e 10 da `auditoria-pre-preview.md` aconteçam sempre, não só quando o agente lembra.

## Os modelos de banner (a mesma anatomia, em formatos diferentes)

Banner não é UM layout, é uma **biblioteca de modelos**. A anatomia (hook + apoio + CTA) é a mesma; o que muda é a FORMA, escolhida pela angulação e pelo nível de consciência. Não repita sempre o mesmo molde, o feed cansa. Modelos que funcionam:

- **Herói + bullets** - promessa grande + 3 bullets de prova/benefício. Oferta/manifesto direto.
- **Comparação** - 2 colunas (o jeito velho × o novo); o leitor faz a conta sozinho.
- **Texto puro / quebra de crença** - só a tese gigante por negação ("não é X, nem Y, é Z"), fundo chapado, zero imagem.
- **Nota / comunicado** - fundo claro sóbrio, cara de comunicado oficial; anti-tell que fura a guarda de quem ignora anúncio. Título "NOTA..." em destaque, CTA discreto em frase.
- **"Você nunca vai X se:"** - a consequência + a lista das condições erradas que prendem (marcadas com ✕).
- **Diagrama** - desenha o mecanismo: funil, fluxo de etapas, equação ("A + B = resultado"), comparação visual (espalhado × na ordem), ciclo, termômetro (frio→quente), mapa (errado × certo).
- **Prova / número gigante** - o dado real domina a arte (só com lastro do banco de provas; nunca inventado).
- **Isca + mockup** - pergunta-dor no topo + mostra o entregável (mockup do produto/aula) + "pega/assiste agora".
- **Meme contraintuitivo** - nega uma verdade sagrada, estética crua/nativa, número contraditório.
- **Auto-qualificação** - "se você é X e sente Y..." filtra o público logo no topo (repele o curioso).
- **Caixinha / nativo** - imita print orgânico (caixinha de pergunta, screenshot, notificação); fura a cegueira de banner por não parecer anúncio.
- **Checklist / diagnóstico** - caixinhas que o leitor mentalmente marca e se auto-diagnostica.
- **Imperativo** - comando direto ("Pare de X") + o que fazer no lugar.

**Como escolher:** pela consciência e ângulo. Dor/problema → nota, checklist, "você nunca vai", caixinha. Solução/mecanismo → diagrama, comparação, equação, isca. Prova → número gigante, meme. Teste vários modelos pra a mesma tese; o tráfego diz qual vence.

## Guardrail do card de citação (peça de frase): checa o descompasso de voz ANTES de desenhar

O card de frase (uma frase forte sozinha, fundo chapado, cara de pôster) tem engajamento fácil e esforço baixo, e por isso é tentador. Mas ele carrega uma armadilha: **frase motivacional genérica descasa da voz do cliente e queima o posicionamento.** Antes de produzir qualquer card de citação, passe por 3 verificações:

1. **Descompasso de voz (a verificação-mãe).** Se a voz do cliente é analítica, contrária ou seca (não motivacional), um card de frase inspiracional soa como outra pessoa. **Aponte o descompasso e pergunte se card de frase combina com o posicionamento dele** antes de desenhar. Card de frase só passa quando a voz do cliente já é de frase-tese/afirmação, não colada por cima.
2. **A frase é do cliente, ancorada, não inventada.** A frase sai do verbatim e da tese do perfil (Passo 0), passa as 3 perguntas do gate (dá pra ver a cena? é falsificável? só este cliente diria?) e o anti-IA. Frase motivacional de banco ("você não acha tempo, você faz tempo") é reprovada: é a voz de ninguém. Sem atribuição inventada a terceiro.
3. **Expectativa honesta de alcance.** Card de frase engaja, mas alcança menos que carrossel ou reel; não é o formato mais potente. Se o cliente vier só de card de frase, sinalize e recomende o formato que carrega a tese com corpo (carrossel, reel), sem recusar o card quando ele encaixa na voz.

## Contexto é rei (autossuficiência)

Tampe a legenda mentalmente. Se a arte sozinha não diz **o que é, por que importa e o que fazer**, o banner falhou. Todo modelo (principalmente os visuais: diagrama, meme, mockup) carrega uma linha que orienta o estranho que nunca te viu, senão ele vê o desenho bonito e não entende a oferta. Sem contexto, não sobe.

## Anti-órfã (filtro duro)

Headline e copy do banner seguem o widow control de `tipografia-quebra-linhas.md`: NENHUMA palavra sozinha numa linha. `text-wrap` do CSS não basta em render headless; junte as 2 últimas palavras com espaço inquebrável ou quebre manual, e confira no render antes de subir.

## O que NUNCA pode faltar (checklist de saída)

1. HOOK que para o dedo em 1 segundo.
2. Mensagem legível no mobile em meio segundo.
3. UM ponto focal só (hook OU número OU imagem), nunca dois competindo.
4. Contexto: a arte é autossuficiente (cubra a legenda, ainda faz sentido).
5. PROVA com lastro quando usa número (senão placeholder marcado).
6. Zero palavra órfã. Zero travessão (anti-IA).
7. CONTRASTE por pele: cada texto legível contra o fundo DELE. Pele clara → todo texto escuro; nada de branco ou neon herdado do tema escuro (some no claro). É o erro "branco no branco".
8. DIAGRAMA forte (quando usa): traço grosso 5–6px + marcador semântico (✕ vermelho / ✓ ou `$` verde) + rótulo do que é. Linha fina pelada = ninguém entende.
9. NADA vazio/fantasma: nenhuma célula, grade ou mockup renderiza vazia ou em baixa opacidade (parece bug de carregamento). Preenche com conteúdo plausível ou remove.

> Os itens 7–9 são os 3 erros de craft que já queimaram render real; os **checks universais 14–16 da `auditoria-pre-preview.md`** cobrem cada um em detalhe, com exemplo. Rode-os no banner também, não só no carrossel.

## Como crescer a biblioteca de modelos (reuso)

A biblioteca nasce de **engenharia reversa do swipe do nicho**: colete anúncios que rodaram em escala, agrupe por família (preço-âncora, mockup, isca, texto-puro, story-print, comparativo, meme, evento), extraia o esqueleto de cada um e adapte ao perfil do usuário. Modelo novo = mais um molde testável, nunca um decalque do exemplo.

## O que entrega

O banner final (imagem pronta pra subir), com a copy-visual aprovada no Crivo e a nota de qual família e destino foram usados.
