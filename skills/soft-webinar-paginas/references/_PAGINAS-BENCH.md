# Páginas de Webinar — BENCHMARK das páginas reais de referência

> **Pra que serve:** modelo reutilizável das 3 páginas que orbitam o webinar (CAPTURA → OBRIGADO → CHECKOUT), extraído das páginas REAIS de referência que estão no ar, não da teoria. Use como régua quando montar as páginas de qualquer cliente.
>
> **As fontes lidas (todas de referência, todas no ar ou versionadas):**
> - Captura (perpétuo, modelo web-v1): página de captura de referência no ar
> - Obrigado (perpétuo, modelo web-v1): página de obrigado de referência
> - Ficha (modelo web-v1): wizard de ficha de referência
> - Home/landing webinar: bloco "Bastidor" (bio detalhada)
> - Obrigado imersão (ao vivo): página de obrigado de evento ao vivo de referência
> - Reference da skill: `references/paginas-cadastro-obrigado-checkout.md`
>
> **Nota de achado:** o CHECKOUT enxuto NÃO existe como HTML deployado — o checkout de referência é a tela do gateway (Cakto/WebinarKit). O que está abaixo no item 3 é o spec do que entra na tela de checkout, extraído da reference + do mecanismo de link-controlado/presente de referência. As páginas de captura e obrigado, sim, existem como HTML real e foram lidas verbatim.

---

## A régua que governa as 3 páginas (direto da fonte de referência)

> *"A ferramenta não vende, a ferramenta protege."* Quem cria desejo é a aula. As páginas só fazem o desejo não vazar.

Cada elemento entra por UM de três motivos. Se não faz nenhum, **corta** (é fricção):
1. **Protege a atenção?** (impede pausar/sair/distrair)
2. **Protege a venda?** (põe o botão no instante em que a pessoa decide)
3. **Mede?** (te diz depois quem está quente)

> **Mito que o bench desfaz:** *"já testei páginas lindas, não converteu."* A página de referência é "feia" e converte 30%. Cada animação é uma fricção. **Página feia que roda ganha de página linda que enfeita.**

**ID visual fixa em todas (extraído do CSS real):** fundo preto `#000`, verde-neon `#4ade80` como única cor de ação, Bebas Neue (títulos) + Inter (corpo) + JetBrains Mono (labels/eyebrows), cantos retos ou raio pequeno, hairlines `#1e1e1e`. Eyebrow = label mono verde com tracinho antes. Mobile-first é a régua (70-85% do tráfego é celular).

---

# 1. A BIO DETALHADA na ÚLTIMA DOBRA

**Onde fica:** na penúltima/última dobra, DEPOIS do conteúdo da aula/oferta e ANTES do fecho final. Nunca no topo. A pessoa só precisa de "quem é esse cara" depois de já querer o que ele oferece.

**Função:** validar a autoridade SEM currículo. A ordem é **empatia ANTES do feito** — cicatriz antes do troféu. A pessoa precisa ver "ele já passou pelo que eu vivo" antes de "ele tem números".

O autor do método usa a bio detalhada em **dois formatos** — escolha pelo tipo de página:

## Formato A — Bio em PROSA (1ª pessoa) · usado na web-v1 (captura)

Foto em P&B (grayscale + contraste) numa coluna, texto na outra. Eyebrow "Quem vai te ensinar" + nome em Bebas gigante + 5-6 parágrafos curtos em 1ª pessoa. Tom: cara normal, anti-engomadinho, números com ressalva honesta.

**Texto real de referência (verbatim, modelo web-v1):**

```
[eyebrow] Quem vai te ensinar
[nome grande] [nome do dono]

Eu não sou engomadinho de bairro chique, sou um cara normal. Passei 10 anos no
bastidor do digital, montando a estratégia de quem vende de verdade.

Eu falo que gerenciei uma cifra de 8 dígitos, não que faturei. Quem fala que
faturou geralmente não viu esse dinheiro entrar no bolso. Eu vi de perto, em
mais de 40 nichos e mais de 150 lançamentos.

Já quebrei devendo uma cifra de 6 dígitos. Voltei pro sofá da casa da minha mãe
e recomecei do zero. Foi caindo que eu descobri o que funciona de verdade.

Depois disso, à frente da receita de uma operação de 8 dígitos, eu fiz esse
número em 2 anos. Com 5 pessoas e um funil só.

Eu não vim te vender milagre. Vim te mostrar que vender pode ser simples e
acontecer todo dia. E te provar por A mais B.
```

**A estrutura desse texto, parágrafo por parágrafo (o molde reutilizável):**
1. **Quebra de imagem / empatia:** "não sou [estereótipo de guru], sou um cara normal" + o que faz (a credencial-mãe em uma linha).
2. **Número-âncora com ressalva honesta:** o feito grande + a distinção que o concorrente não faz ("gerenciei, não faturei" → prova que é honesto). É a assinatura de referência: o número vem com a nuance que o torna falsificável.
3. **A cicatriz (fundo do poço):** quebrou / recomeçou do zero / "foi caindo que descobri". É o que cria empatia e licença pra falar.
4. **O feito-prova depois da cicatriz:** o resultado grande nomeado e específico (8 dígitos, 2 anos, 5 pessoas, 1 funil), pequeno, calculável, não "milhões genéricos".
5. **Anti-milagre + promessa:** "não vim te vender milagre. Vim mostrar que [a promessa]. E provar por A mais B." Fecha desarmando o cético.

## Formato B — Bio com GRADE DE CREDENCIAIS · usado na home/landing

Mesma coluna foto + texto, mas o texto é UM parágrafo denso de 1ª pessoa + uma **grade de 4 cards numéricos** (número grande em verde + label mono em 2 linhas). É o formato pra landing mais "vendedora".

**Texto real (verbatim, bloco "Bastidor"):**

```
[section-label] Bastidor
[título] 10 anos vendo o que funciona.

10 anos no digital. Gerenciei uma cifra de 8 dígitos, não faturei, e faço
questão da distinção. Quebrei devendo uma cifra de 6 dígitos. Na
operação-referência (8 dígitos, que rodei como CRO), fiz esse número em 2 anos
com 5 pessoas e 1 funil só, sem post diário, e a empresa ficou quase um ano sem
postar com o perpétuo vendendo todo dia. Não inventei isso na teoria. Achei na
unha.

[grade de 4 cards]
  8 díg.  → Gerenciados em 10 anos · não faturados
  150+    → Lançamentos em 40+ nichos diferentes
  8 díg.  → 2 anos, 5 pessoas, 1 funil · feito-âncora
  6 díg.  → Quebrei e voltei do zero
```

**A grade reutilizável (cada card = número + contexto-que-prova):** cada número vem com o contexto que o torna verificável e impede leitura inflada. Nunca número solto. Os 4 cards de referência cobrem: **escala** (cifra de 8 dígitos gerenciada), **amplitude** (150+ lançamentos / 40 nichos), **o feito-âncora** (8 dígitos, 5 pessoas, 1 funil), **a cicatriz** (6 dígitos de dívida). Replique essa lógica de 4 ângulos no número do cliente.

## Regras da bio (valem pros dois formatos)

- **1ª pessoa, voz de boteco.** Frase curta. Nada de "profissional com vasta experiência".
- **Empatia/cicatriz ANTES do feito.** Sempre. É a ordem que o autor do método bate.
- **Número com lastro/ressalva.** "Gerenciei, não faturei." O número que vem cru e redondo soa falso; o que vem com a nuance soa real.
- **Anti-milagre explícito** no fecho da prosa ("não vim vender milagre").
- **Foto em P&B**, grayscale + contraste, vertical (aspect 4/5), com tag discreta (nome + cidade).
- **Sem currículo, sem títulos.** Foco em resultado e empatia.
- Onde falta dado do cliente, entra `[A CONFIRMAR]` no lugar exato — nunca número plausível inventado.

---

# 2. A PÁGINA DE OBRIGADO (modelo web-v1/obrigado)

**Função única:** **fazer a pessoa aparecer.** Maximizar comparecimento (cadastrado → presente). Benchmark 33-57%; alvo Soft 50%+. O que move esse número é o WhatsApp (+54%: de 31% pra 47% só por ligar o canal). É "idiota de tão simples" de propósito — mas faz 3 trabalhos que valem dinheiro: lembrete (presença), ficha (inteligência), opt-in WhatsApp (comparecimento).

**Os blocos exatos da web-v1/obrigado, na ordem em que aparecem (verbatim da página real):**

### Bloco 1 — Confirmação enfática (com nome dinâmico)
- Eyebrow com check verde: `✓ Inscrição confirmada`
- H1 Bebas gigante: **"Informações importantes"**
- Linha-lead com nome dinâmico: *"Tá garantida, **[nome]**. O acesso é **gratuito e limitado**. Leia com atenção pra não ficar de fora."*
- O nome vem da URL (`?first_name=`) com fallback pro `localStorage` capturado na captura — funciona em qualquer aparelho.

### Bloco 2 — Badges de anti-fuga (3 cards vermelhos)
Três cards com X vermelho, lado a lado, que justificam por que NÃO dá pra deixar pra depois:
```
✗ Ao vivo, sem replay
✗ Sem material depois
✗ Só quem fica até o fim
```
> Isto é o anti-fuga, transformado em 3 selos visuais logo no topo. Mata o "depois eu vejo a gravação".

### Bloco 3 — Card "Sua aula" (data + horário + timer + acesso + agenda)
Um card escuro com cabeçalho verde "SUA AULA", contendo:
- **Data + Horário** lado a lado (puxados do horário que o lead escolheu na captura — via `localStorage`/`?t=`). No perpétuo a data NUNCA é fixa: cada lead vê a SUA sessão.
- **Timer oficial da ferramenta** (WebinarKit) restilizado na cara da marca: *"Sua aula começa em: [dias/horas/min/seg]"*. Quando zera, a própria página vira a sala e leva pra dentro automaticamente.
- **Linha de acesso (dashed):** *"**Deixe esta página aberta.** Na hora, ela vira a sua sala e te leva pra dentro automaticamente. O link também chega no teu **e-mail** e **WhatsApp**."*
- **Adicione na agenda:** 3 botões — Google · Outlook · .ICS (Apple/outros) — com o evento na data/hora exatas e link individual embutido. Atrito zero.

### Bloco 4 — Gate "Passo decisivo" → a FICHA (a mina de ouro)
Card verde destacado que empurra pra ficha:
- Selo: `Passo decisivo`
- H2: **"Garanta sua vaga na sala"**
- Texto: *"Os assentos de cada sessão são limitados. Preenche a ficha rápida (3 min) pra travar teu lugar. Eu uso tuas respostas pra preparar a sala pro teu caso."*
- Botão verde largo: **"Garantir minha vaga →"** → leva pra `/ficha/`

> **A ficha é o que transforma o obrigado de "fim de funil" em "começo da inteligência".** ~30% respondem sem incentivo. Ela alimenta Lead Score (verde/vermelho pro tráfego), entrega o lead high-ticket pro comercial, e dá a dor na voz do próprio lead. Ver estrutura da ficha abaixo.

### Bloco 5 — Presente de retenção (fecho)
Card discreto: *"🎁 Tem um **presente pra quem ficar até o fim**. Entra no horário e fica até o final, vale a pena."*

## A FICHA (web-v1/ficha) — o que ela pede, em detalhe

É um wizard de 1 pergunta por tela, barra de progresso, salva sozinha (retoma se fechar a aba), prefill do que veio da captura (não repergunta nome/email/whats se já tem). Tela final = **WhatsApp**.

- **Identificação** (só aparece se NÃO veio da captura): e-mail, nome completo, WhatsApp.
- **Segmentação (não pontua):** tipo de especialista · nicho específico · tempo de mercado · ticket médio · uso de IA · dor principal.
- **Score (pontua, define HOT):** urgência (escala 0-10) · quando quer resolver · faturamento mensal · **quanto toparia investir** (piso HOT = topa 3k+).
- **Insight (opcional):** "O que mais te trava hoje?" (campo aberto, na voz do lead).
- **Tela final:** *"Pronto, [nome]. Vaga garantida."* + **único próximo passo = botão WhatsApp** com mensagem pré-pronta: *"Oi, [nome do dono]! Acabei de preencher minha ficha da masterclass. Quero garantir minha vaga na sala."* + nota: *"A sala abre no horário que você escolheu · não falta, tem presente no fim."*

## O fluxo de obrigado, resumido
CONFIRMA (nome) → ANTI-FUGA (3 badges) → SUA AULA (data/hora + timer + agenda) → FICHA (gate verde) → opt-in WhatsApp (na tela final da ficha) → PRESENTE. O WhatsApp é o destino final, não o formulário.

## Variante AO VIVO (obrigado da imersão) — quando o evento tem data fixa
Quando NÃO é perpétuo (turma/imersão ao vivo), a estrutura muda um pouco (verbatim do `imersao/gt/obrigado`):
- H1: *"Tá dentro. Sua vaga gratuita tá reservada."*
- Stepper de 3 passos (Agora · No grupo · No dia): **Agora — responde a ficha** (libera o grupo no fim) → **Grupo de WhatsApp** (sai o link do Zoom, lembretes, materiais) → **Sábado 9h ao vivo**.
- Gate honesto: *"Antes de liberar o grupo: eu leio cada ficha pra calibrar a aula. Sem a ficha, o grupo não abre."*
- CTA: **"Responder a ficha agora"** + nota "leva 5 min · libera o grupo no fim".
> Diferença-chave: no ao vivo o WhatsApp é um **grupo** (link do Zoom + lembretes); no perpétuo é **conversa 1:1** + a página que vira sala sozinha.

---

# 3. O CHECKOUT ENXUTO

**Função:** abrir a venda de quem JÁ decidiu. A aula vendeu; o checkout não convence do zero — tira a última hesitação e dá o caminho mais curto pro cartão. **Se o checkout precisa convencer, o furo está na aula, não na página.** Conversão de quem ENTRA no checkout: 60-85%.

> **O pedido de referência (a régua deste item):** checkout só com **cronômetro de 5 min + "você está entre os 15 primeiros" + garantia + provas + bônus. NADA mais.** Sem FAQ longo, sem re-explicar o método, sem dobra de vendas. Quem chegou aqui já está com o cartão na mão. Cada bloco extra é fricção que faz a pessoa pensar de novo.

**Achado:** não há HTML de checkout deployado — o checkout de referência é a tela do gateway (Cakto/WebinarKit). Os blocos abaixo são o que entra NA tela / no topo dela.

### Bloco A — Cronômetro de 5 minutos (escassez de tempo, no topo)
- Barra/contagem no topo: **"Sua condição vale por: [04:59 → 00:00]"** contando pra baixo.
- Some quando zera (ou volta o preço cheio). É escassez de **condição auditável** (o desconto/bônus por chegar pelo link da aula), nunca mentira de estoque.
- Visual: faixa verde fina no topo, número grande em Bebas, mono no label. Acima da dobra, sempre visível.

### Bloco B — "Você está entre os 15 primeiros" (escassez de vaga + prêmio do link)
- Selo/linha logo abaixo do timer: **"Você está entre os 15 primeiros — bônus liberado."**
- Vem do mecanismo de **link controlado** de referência: o checkout é um link próprio, recompensado, desviado do site sem oferta. *"Quem usar o link que eu vou disponibilizar AQUI ganha [vantagem]."* O checkout vira **prêmio** (a "telinha que confirma os 15 primeiros"), não uma página passiva.
- Dá razão pra comprar AGORA e por ESTE canal. Dispara o evento InitiateCheckout (o pós-webinar passa a saber quem chegou aqui).

### Bloco C — Garantia em destaque
- Bloco visual com escudo: a garantia escolhida do cardápio (não dogma — escolhe pelo ticket).
- Função: **inverte o risco** — tira do bolso do cliente, põe no seu.
- Molde (garantia incondicional, um item do cardápio): *"🛡️ Garantia incondicional de [X] dias. Se decidir que não é pra você, devolvemos 100%. Sem perguntas, sem fricção. Você clica em 'quero sair' e recebe o reembolso."*
- (O perpétuo de referência trava 90+90; a operação-referência fecha sem garantia. O desenho é `[A CONFIRMAR]` por cliente.)

### Bloco D — Provas (na moeda da promessa)
- 3-5 provas fortes, mais pesadas que na captura (aqui a pessoa quer a última confirmação).
- **Regra de ouro: prova na MOEDA da promessa.** Prometeu salário → foto da carteira. Prometeu venda no automático → print do dashboard. Documento bruto e feio > slide bonito.
- Tipos: depoimento em vídeo (sem autoplay) · print de WhatsApp real · tabela antes/depois · logo discreto · estatística de uso. Depoimento na boca do cliente, não do vendedor.

### Bloco E — Bônus (stack empilhado, cada um mata uma objeção)
- O stack da oferta empilhado, cada item ancorado pelo valor avulso, soma riscada acima do preço real.
- Cada bônus mata UMA objeção nomeada. O bônus de ação rápida ("15 primeiros") amarra com o Bloco B.
- Molde visual:
```
VOCÊ ESTÁ ADQUIRINDO:
✓ [Componente principal]        .... R$ X
✓ [Bônus 1: nome]               .... R$ Y
✓ [Bônus 2: nome]               .... R$ Z
✓ [Bônus ação rápida · 15 primeiros] R$ W
                                  ──────────
VALOR TOTAL                       ~~R$ soma~~
HOJE VOCÊ INVESTE                   R$ [preço]   (ou 12x de R$ ...)
```
> Preço é slot do espectro Soft — instancia pelo produto real do cliente, não decalca o número.

### O que NÃO entra no checkout enxuto (corte explícito)
- ❌ FAQ longo de 5-7 perguntas (isso é checkout "completo" da reference; a régua de referência pede enxuto).
- ❌ Re-explicação do método / nova dobra de vendas.
- ❌ Upsell agressivo (mata conversão).
- ❌ Bio detalhada (já foi na aula/captura).
- ❌ Qualquer enfeite que faça a pessoa parar e reconsiderar.

**A ordem na tela:** TIMER 5min (topo) → "15 primeiros" → STACK/BÔNUS com preço → PROVAS → GARANTIA → botão de pagar (cartão primeiro, PIX visível) + selo de segurança discreto. Tudo acima/perto da dobra.

---

## Números de referência de máquina bem montada
| Etapa | Faixa saudável |
|-------|----------------|
| Página → lead | 30-40% |
| Comparecimento (inscrito → presente) | 33-57%; alvo Soft 50%+; **+54% quando liga o WhatsApp** |
| Compra no checkout (de quem ENTRA) | 60-85% (de quem compareceu: 6-8% automático antes do comercial) |

> Se os números estão muito abaixo, o furo quase sempre é **técnico** (página, horário, vídeo engasgando, WhatsApp não ligado) — não a copy. Audita o encanamento antes de reescrever a aula.

## Gate de saída (Crivo) — bloqueante antes de publicar qualquer página
Toda página passa pelo Crivo: ancoragem no verbatim, as 3 perguntas do gate, prova com lastro, anti-vazamento, anti-IA (`scripts/lint_copy.py`) e mobile-first. Veredito binário: falhou, re-roda. Furo de insumo (número/case/preço/vagas) entra como `[A CONFIRMAR]` no lugar exato — nunca preenchido com algo plausível. Sem passar no Crivo, a página não vai pro ar.
