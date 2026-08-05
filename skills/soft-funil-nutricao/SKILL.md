---
name: soft-funil-nutricao
description: "Escreve a RÉGUA DE NUTRIÇÃO do método Soft: a sequência que pega o lead depois que ele baixou a isca e o aquece até o convite (webinar, call ou oferta direta). Nutrição não vende, aquece; é ponte curta com UM destino, nunca newsletter eterna. Cobre a sequência pós-isca (arco, dias, frequência), a rota por TEMPERATURA (frio, morno, quente que foi a call e não fechou), a régua por CANAL (WhatsApp com opt-in, e-mail), a reativação de lista fria e o broadcast. Use pra nutrição, pós-isca, o que mandar depois que baixou, aquecer lead, lista parada, reativação, broadcast. Cuida do lead FORA do webinar; a régua de dentro dele (faltam 24h, link da sala, pós por % assistido) é soft-webinar."
---

# Nutrição, a ponte entre a isca e o convite

O lead baixou a isca e some. A `soft-funil-isca` produz o ativo, a `soft-funil-landing` captura o contato, e a jornada morre ali. Esta skill escreve o que vem depois.

**A lei-mãe:** nutrição **não vende, aquece até o convite**. Ponte curta, **uma isca, uma promessa, um destino**. Quem vende é o webinar, a carta ou a conversa; a nutrição entrega o lead quente lá. Newsletter sem destino envelhece a lista.

## Output Contract
**Uma régua por vez**, saída **limpa**: cada mensagem com **canal**, **timing (D+N)** e **o trabalho dela** em 1 frase. WhatsApp marca **[TEMPLATE]** fora da janela de 24h e **[livre]** dentro. **Nunca inventa fala, número ou case:** sem fonte, `[A CONFIRMAR: o quê]` no lugar exato. Gate roda **por dentro** e mensagem reprovada não aparece.

## Passo 0, ancora + crava o DESTINO (NÃO PULE)
Fonte, nesta ordem: **descrição do projeto** → **Plano de Posicionamento** → **isca produzida** → **mensagens anteriores**. Puxa: **qual isca o lead consumiu** (nome e promessa), a **crença-ponte** que ela instalou, **3-5 falas de DOR/DESEJO** com o N, a **prova real** e o **ticket**.

Depois crava, antes de escrever: **o DESTINO** (webinar · call/1:1 · oferta direta) e **a TEMPERATURA** (Passo 2). Sem destino, não escreve; captura sem destino é o erro nº1 da frente de funil. Conduta e perguntas: `intake-e-destino.md`.

## Passo 1, a SEQUÊNCIA PÓS-ISCA (o arco padrão)
O lead está mais quente no minuto do download e esfria rápido. A régua é **densa na largada**: entrega → consumo → crença → convite. Herda o arco ADMA, um trabalho por mensagem, e **toda mensagem referencia a isca que ele baixou**, pelo nome. O comprimento escala pelo ticket e pelo destino. A grade (D+0 a D+7, canal por dia, molde por toque): `sequencia-pos-isca.md`.

**Regra de frequência:** a régua **declara a cadência** no topo (dias, toques, espaçamento) e não muda no meio sem dizer. Frequência não declarada é lista queimada.

## Passo 2, roteia por TEMPERATURA
Temperatura é **comportamento observável**, não palpite. A mesma mensagem pros três perde os três.

- **Frio** (baixou a isca, nunca comprou, não consumiu mais nada): sobe consciência, crença-ponte, mecanismo do problema, prova. Convite só quando ele reage.
- **Morno** (consumiu, clicou ou respondeu): mecanismo da solução e **convida ao destino**. É onde fecha mais.
- **Quente** (foi a call ou webinar e **não** fechou): **UM motivo** por mensagem, **puxa pro 1:1**, prioridade máxima.

Sinais de subida/descida e as 3 réguas: `rotas-por-temperatura.md`. Cliente **sai de todas as sequências** (filtro "é cliente?" na entrada, sempre).

## Passo 3, calibra por CANAL
WhatsApp abre muito mais e move o número; e-mail é o piso e aguenta texto mais longo. **WhatsApp nunca é o e-mail encaminhado.**

**WhatsApp:** 50-150 palavras, até 5 linhas, conversa, cadência espaçada. Regra dura: **opt-in real** (a pessoa manda "OI"), fora da janela de 24h só **[TEMPLATE]** aprovado, **Cloud API oficial, nunca não-oficial**.
**E-mail:** assunto 4-7 palavras que abre loop + corpo 200-400, narrativa, mais toques, CTA repetido 2x.

Cadência e moldes: `canais-e-cadencia.md`.

## Passo 4, REATIVAÇÃO de lista fria (60+ dias)
Base parada não acorda com oferta. Reativa por **pergunta e utilidade**, não por pitch, e **limpa** quem não reage (protege a entrega). Arco de 3 a 4 toques, volume gradual, e a pergunta de 1 palavra que devolve a objeção na voz do lead. Régua e higiene: `reativacao-e-broadcast.md`, Seção 1.

## Passo 5, BROADCAST (mensagem única pra base)
O toque avulso fora da régua automática: novidade real, convite de turma, conteúdo que vale sozinho. Só com **motivo real** (broadcast sem notícia treina a base a ignorar), respeita o filtro "é cliente?" e checa colisão com régua ativa. Molde: `reativacao-e-broadcast.md`, Seção 2.

## Passo 6, roda o GATE por DENTRO (não imprime)
Roda em **cada mensagem** (assunto + corpo). **O veredito é o PIOR item**, um ✗ refaz a mensagem, não a régua. Os 3 checks próprios daqui, que mais reprovam:

1. **UM destino:** a régua inteira empurra pra UM destino declarado; dois destinos reprova.
2. **Referencia o ativo:** toda mensagem cita pelo nome a isca que ELE consumiu; mensagem que serviria pra qualquer lista reprova.
3. **Frequência declarada:** a cadência (dias, toques, espaçamento) está escrita na entrega.

Mais os herdados, binários: **1 trabalho só** · **temperatura certa** · **canal certo** · **não vende, aquece** · **ancorada** em fala literal com N ou prova real · **insumo em `[A CONFIRMAR]`** · **C/U/B** · **CTA com destino** · **anti-IA**. Critério: `gate-linha-a-linha.md`.

No Claude Code roda `python3 scripts/lint_copy.py`; no chat, CTRL+F do travessão e da família "travar".

## Passo 7, mostra e PARA
Mostra **só as que passaram, LIMPO**, mais o checklist de subida (tags de temperatura, filtro "é cliente?", higiene de lista, UTM, teste). Pergunta "te serve? ajusto, ou sigo?" e **espera o OK**.

## When NOT to use
Régua **dentro** do webinar (24h, link da sala, pós por % assistido) → **soft-webinar**. ATIVO da isca → **soft-funil-isca**. Páginas → **soft-funil-landing**. Carta/VSL → **soft-funil-carta**. Venda 1:1 → **soft-vendas**. Feed → **soft-conteudo-planner**. Headline → **soft-conteudo-headlines**. Posicionamento → **soft-posicionamento**.

## References
- `intake-e-destino.md`: estados de entrada, como cravar DESTINO e temperatura. **P0.**
- `sequencia-pos-isca.md`: a grade D+0 a D+7, molde de cada toque, variante por destino. **P1.**
- `rotas-por-temperatura.md`: as 3 réguas, sinais de subida/descida, o que cada estado não recebe. **P2.**
- `canais-e-cadencia.md`: WhatsApp x e-mail, regras do oficial, cadência e moldes. **P3.**
- `reativacao-e-broadcast.md`: Seção 1, lista fria e higiene. Seção 2, broadcast. **P4 e P5.**
- `gate-linha-a-linha.md`: critério de cada check + anti-patterns. **P6.**
- `shared-references/`: `crivo/01-entrada-verbatim.md` (P0) · `crivo/03-gate-cub.md` (P6) · `filtro-anti-ia/padroes-banidos.md` · `scripts/lint_copy.py`.
