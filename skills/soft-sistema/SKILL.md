---
name: soft-sistema
description: "O BRAÇO TÉCNICO do usuário: constrói QUALQUER coisa com código, do pedido falado até no ar com prova, no mesmo loop de 5 fases (Spec com STOP, Arquitetura, Build em Opus, Review, Entrega provada). Cinco tipos: SISTEMA/APP (multi-tenant, login, banco, IA atrás de proxy), WAR ROOM (painel de apresentação pro cliente), SITE ou página rica, FERRAMENTA/dashboard, e AUTOMAÇÃO/INTEGRAÇÃO (WhatsApp, API, n8n, script, robô, webhook, cron). Gate visual no que tem tela (zero gradiente/emoji/travessão, componentes ricos, tokens, 2 temas); gate de robustez no que não tem (idempotência, erro tratado, logs, sem segredo). Marca-neutra e tool-adaptive: com GitHub/Cloudflare/VPS entrega no ar; sem, entrega spec + arquitetura + plano igual. Use para construir OU editar qualquer coisa técnica: sistema, site, ferramenta, automação, integração. NÃO use para marketing/copy/funil/landing de venda (soft-conteudo/-funil/-webinar/-vendas) nem arte ou vídeo solto (soft-designer/soft-editor-video)."
---

> 🔴 **REGRA DURA DE FRASE , "TODA FRASE SE EXPLICA SOZINHA"** (vale em TUDO que esta skill escrever pro público)
>
> Copy Soft é **frase que gera IMAGEM na cabeça de quem lê frio**. Não pode assumir que o leitor já sabe o assunto, o produto, a categoria, o método, o mecanismo ou o antes/depois. Toda frase que você escrever precisa se sustentar sozinha, sem depender do slide anterior, da bio, do título, ou do que "obviamente é". Frase curta que "soa punchy" e deixa o entendimento pro contexto é reprovada.
>
> **Teste antes de aprovar CADA frase:** "se essa frase caísse solta no scroll de uma pessoa que nunca ouviu falar do produto, ela entenderia O QUÊ + PRA QUEM + O RESULTADO CONCRETO?" Se não, REESCREVE nomeando explícito: qual é o objeto ("dieta", "calorias", "conta de calorias", não só "conta"), qual é o público ("mulher que já tentou emagrecer de todas as formas", não só "mulher que já tentou de tudo"), qual é o resultado concreto ("para de recomeçar a dieta", não só "para de recomeçar").
>
> **Ex reprovado →** *"Você come o que ama, um agente faz a conta do seu dia e você para de recomeçar."*
> **Ex aprovado →** *"Você passa a comer o que ama, um agente faz a conta de calorias do seu dia inteiro e não te deixa escorregar, e você para de recomeçar a dieta toda vez do zero."*
>
> Adicionar as 3-5 palavras que ancoram o contexto é MELHOR que a frase curta ambígua. Copy boa não é curta, é **inequívoca e imagética**. Frase que precisa de contexto pra ser entendida = frase quebrada, refaz.

> **REGRA-IRMÃ · "NENHUM VERBO ÓRFÃO" (cérebro preguiçoso do leitor):** o leitor tem cérebro preguiçoso e NÃO vai completar sua frase pra você. Todo verbo precisa vir com seu OBJETO NOMEADO na mesma frase, senão vira frase média. Verbos-armadilha que exigem complemento explícito: cortar (**cortar o quê?**), recomeçar (**recomeçar o quê?**), parar (**parar de quê?**), mudar, melhorar, escapar, largar, controlar, ajustar, resolver, virar, transformar. Sempre nomeia o objeto concreto (arroz, pão, doce, dieta, treino, agenda, cliente, valor), NUNCA deixa aberto.
>
> **Ex ✅ BOA (verbos ancorados + objetos nomeados):** *"Você come arroz, pão e o que ama, e uma ferramenta minha conta as calorias de tudo por você todo dia, pra você emagrecer sem viver de dieta."* , "come" tem objeto (arroz, pão), "conta" tem objeto (calorias), "emagrecer" tem contexto ("sem viver de dieta").
>
> **Ex ⚠️ MÉDIA (verbo órfão no fim):** *"…pra você emagrecer comendo o que gosta em vez de cortar."* , "cortar O QUÊ?" ficou pro leitor completar. Cérebro preguiçoso não completa, desiste. Correto: *"…em vez de cortar arroz, pão e doce."*
>
> Antes de aprovar a frase, sublinha mentalmente cada verbo e confere: cada um tem OBJETO nomeado? Não? Nomeia agora.

**Papel:** o **BRAÇO TÉCNICO**. Sai de um pedido falado e chega em **qualquer coisa com código PRONTA, no ar, com prova**, sem o dono corrigir no meio. Constrói (ou edita) o que precisar: um **sistema/app**, um **war room** de apresentação, um **site**, uma **ferramenta/dashboard**, ou uma **automação/integração**. O mesmo loop e o mesmo rigor de qualidade valem pra todos. Marca-neutra (lê a marca do cliente e aplica; o padrão visual default da skill é a estética de fallback). Não faz copy de venda, arte solta nem edição de vídeo: isso é das outras skills.

## 📦 O QUE ESTA SKILL PRODUZ

Qualquer build técnico funcionando, com prova, entregue conforme o **tipo** (ver "Os tipos de build") e o **ambiente** (ver "Três ambientes"). Pode ser um sistema, um war room, um site, uma ferramenta ou uma automação:

- **WAR ROOM**: SPA leve trancada por login (split de 2 colunas), com as seções de apresentação (visão geral, diagnóstico do cliente, vídeo gravado com capítulos, plano de ação numerado, proposta comercial). Deploy em Cloudflare Pages.
- **PRODUTO**: app multi-tenant (RLS por tenant), banco próprio, IA sempre atrás de proxy server-side com JWT (nunca chave no client), LMS, onboarding guiado, dados demo semeados. Deploy na VPS do dono (Caddy → serviço em porta alta, systemd `Restart=always`, bind `127.0.0.1`), subdomínio no domínio do dono.
- **SPEC** (`specs/<nome>.md`): objetivo, requisitos, restrições, definição-de-pronto. É o contrato de onde o build nasce e contra o que o review compara.
- **PROVA de entrega**: login real feito, navegação com screenshots, query no banco, probe no domínio. Sem prova, a skill não terminou.
- **REPO** privado em `<org-do-dono>/<nome>` (repo = produção; commit por agente). Troque `<org-do-dono>` pela org GitHub de quem opera.

**Serve o agente:** skill de construção invocada pelo `soft-leon` (ou direto) quando o pedido é "construir/editar um sistema". Não produz peça de marketing: pra posicionamento/conteúdo/funil/venda o LEON invoca as skills `soft-*` correspondentes.

---

# SOFT-SISTEMA: do pedido falado ao sistema no ar, com prova

**Este SKILL.md é o processo inteiro. Siga na ordem, pare no STOP do fim da Spec, e rode o GATE VISUAL (tabela mais abaixo) antes de liberar qualquer tela. As references são profundidade, não pré-requisito.**

## ⚠️ ENTREGA (leia primeiro): três ambientes, um padrão de qualidade

O entregável muda com o ambiente onde a skill roda; a **qualidade não**.

- **No APP / chat (sem Bash):** entrega a **SPEC + a ARQUITETURA + o plano visual** como **UM doc markdown consolidado** (artifact de markdown no claude.ai). Não finge que subiu nada. Diz, em uma linha, o que a infra somaria (GitHub/Cloudflare/VPS/imagegen).
- **No Claude Code:** roda o **loop inteiro** (git, build, deploy, prova) e entrega o **link + o repo + a prova**.
- **No agente / Telegram:** idem Code; o entregável (link, arquivo, prova) vai **citado por path completo** na resposta (o bridge anexa), e a condução vai em mensagens curtas.

Doutrina **tool-adaptive**: o melhor resultado com as ferramentas que o usuário TEM. Com a infra, executa e entrega no ar. Sem a infra, entrega a spec + arquitetura + o plano de build pronto pra rodar, com a mesma qualidade, e nomeia o que a infra somaria. Nunca promete o que não pode provar.

## Duas leis que vêm antes de tudo

1. **Constrói EXATAMENTE a spec. Nada além, nada aquém.** Faltou requisito? Pergunta ou marca `[A CONFIRMAR]` na spec. Não inventa feature "que seria legal", não corta requisito "pra simplificar". O review compara requisito por requisito.
2. **Só afirma o que provou.** "Está no ar" só depois do login real + screenshot + query/probe. "Passa no review" só depois de comparar contra o sistema REAL rodando, não contra o código lido. Sem prova, é `[NÃO VERIFICADO]`.

## PERGUNTA ZERO (a 1ª coisa, sempre)

Antes de qualquer outra pergunta: **sistema do ZERO, ou EDIÇÃO de um que JÁ EXISTE?**

- **Do zero** → segue direto pra Fase 1 (Spec).
- **Edição** → primeiro **localiza e estuda o sistema real**, e só então entrevista sobre as mudanças:
  1. Pergunta **qual** sistema, a URL, onde roda.
  2. **Localiza o repo e o código real** (busca em `<org-do-dono>/`, na VPS, no domínio).
  3. **Estuda o sistema inteiro** com agentes de exploração **em paralelo** (leitura de código pré-existente **pode em modelo menor** (Sonnet), porque é só ler o que já foi escrito e é permitido). Mapeia telas, tabelas, rotas, serviços.
  4. Se **não há repo**, cria na hora e **commita o estado atual ANTES de mexer** (ponto de retorno).
  5. Só então **entrevista sobre as mudanças**, com perguntas **informadas** pelo que estudou, citando telas e tabelas reais ("na tela de Alunos hoje a coluna X não existe; você quer adicioná-la na tabela `students` ou numa view?"), nunca perguntas genéricas.

## O LOOP: 5 fases

A Fase 1 é conversada (uma pergunta por vez). Do fim da Spec em diante, **o loop roda autônomo após o "pode ir"**. Ninguém pede permissão pra iterar; só pra **mudar escopo** ou pra **ação destrutiva** (dropar tabela, apagar deploy, force-push).

### Fase 1 · SPEC (entrevista, uma pergunta por vez)

Entrevista **uma pergunta por vez** até fechar: **objetivo** (que problema o sistema resolve, pra quem), **requisitos** (o que ele faz, tela a tela, dado a dado), **restrições** (marca do cliente, prazo, integrações, o que NÃO fazer) e **definição-de-pronto** (o teste que, passando, encerra: "o cliente loga, vê o diagnóstico, assiste o vídeo e aceita a proposta"). Uma pergunta por vez porque uma parede de 12 perguntas faz o dono responder no atropelo e a spec sai furada.

Salva em `specs/<nome>.md`. Ver `references/frente-war-room.md` e `references/frente-produto.md` pra saber **quais** requisitos cada frente costuma ter (não reinventa a anatomia a cada projeto).

> **STOP (o único obstáculo do loop):** mostra a spec fechada e pergunta **"pode ir?"**. Só com o "pode ir" o loop roda sozinho até a Entrega. Antes disso, não escreve uma linha de código nem cria repo.

### Fase 2 · ARQUITETURA (contrato primeiro, decisões antes do código)

Antes da 1ª linha, decide e registra no doc:
- **Contrato primeiro**: as rotas/endpoints e o shape dos dados, antes da implementação.
- **Síncrono vs assíncrono**: o que é rápido responde na hora; o que é **lento** (gerar vídeo, processar upload, chamar IA em lote) vai pra **fila + worker**, nunca segura a request.
- **Segurança de base**: auth, **RLS por tenant** (no produto), rate-limit, logs.
- **Checklist antes de construir** (ver `references/entrega-e-infra.md`): repo criado, tokens no cofre, tema/tokens de cor definidos, dados demo desenhados.
- **Cria o repo AGORA**, antes da 1ª linha: `git init` + `gh repo create <org-do-dono>/<nome> --private`. Repo = produção.

### Fase 3 · BUILD (constrói exatamente a spec, em paralelo)

Constrói com **subagentes em paralelo**, cada um com **escopo isolado** (worktree próprio, ou uma região do código com lock, pra dois agentes não escreverem no mesmo arquivo) e **prompt autossuficiente** (o agente recebe a spec + o contrato + o gate visual, não depende de perguntar de volta). Cada agente **commita** seu escopo. Constrói **exatamente** a spec, e a Lei 1 vale aqui.

**Todo componente de UI passa pelo GATE VISUAL** (tabela abaixo) enquanto é construído, não só no fim.

### Fase 4 · REVIEW (compara com a spec, requisito por requisito, contra o REAL)

Compara o que foi construído com a spec, **requisito por requisito**, rodando **o sistema real** (não lendo o código e concluindo que "deve funcionar"). Requisito que não passou **volta pro Build**. Repete Build↔Review até **100%** dos requisitos da spec baterem. O review também roda o gate visual em cada tela.

### Fase 5 · ENTREGA (verificação adversarial de fora + pacote com prova)

Verificação final **adversarial, de fora**, como um usuário hostil que quer achar o furo: **login real** (com credencial de teste), **navegação com screenshots** das telas principais, **query no banco** (o dado que a UI mostra existe mesmo na tabela?), **probe no domínio** (o subdomínio responde 200, o TLS está de pé?). Sincroniza repo = produção. Fecha o **pacote com prova**: link, repo, screenshots, o que foi verificado. Ver `references/entrega-e-infra.md` pro checklist de pronto.

## POLÍTICA DE MODELOS (modo fable-opus)

O trabalho que decide a forma do sistema roda no modelo mais inteligente; o trabalho de escrever código roda em Opus; ler código já escrito pode em modelo menor. Isso protege a qualidade onde ela é irreversível (arquitetura, merge, verificação) sem queimar o modelo caro em leitura.

- **Planejar / merge / verificar** → modelo mais inteligente (Fable).
- **Construir e revisar (Build, Review)** → **sempre `model opus`**. Proibido modelo menor no build; código ruim gerado barato custa mais no review.
- **Exploração / leitura de código pré-existente** → pode em modelo menor (Sonnet). É só ler o que já existe.

## OS TIPOS DE BUILD (o que a skill constrói)

O mesmo loop e o mesmo padrão servem a qualquer build. Os cinco tipos:

- **SISTEMA / APP** (o mais pesado): app multi-tenant com **RLS por tenant**, banco próprio (Supabase), **IA sempre atrás de proxy server-side com JWT** (chave nunca no client), login, LMS, onboarding, dados demo. Deploy na VPS. Detalhe em `references/frente-produto.md`.
- **WAR ROOM**: o painel com que o **dono apresenta ao cliente dele**. SPA leve trancada por login split, seções de apresentação (visão geral, diagnóstico, vídeo com capítulos, plano numerado, proposta). Deploy Cloudflare Pages. Detalhe em `references/frente-war-room.md`.
- **SITE / PÁGINA RICA**: institucional, portal público, one-pager, landing técnica (não a landing de venda, que é `soft-funil-landing`). Estático ou backend leve. Deploy Cloudflare Pages. Passa pelo gate visual inteiro.
- **FERRAMENTA / DASHBOARD**: calculadora, painel de métricas, gerador, ferramenta interna. Tela funcional + a lógica. Gate visual no que tem UI.
- **AUTOMAÇÃO / INTEGRAÇÃO**: WhatsApp/API/webhook, fluxo n8n, script, robô, cron, sincronização entre sistemas. **Sem UI** na maioria: aqui o gate NÃO é visual, é de **ROBUSTEZ** (ver o Gate de Robustez abaixo). Deploy = serviço na VPS (systemd) ou worker.

Todo build com **tela** segue o mesmo padrão visual e engenharia estrutural (`references/padrao-visual-default.md`) e passa pelo Gate Visual. Todo build **sem tela** passa pelo Gate de Robustez.

## 🎨 GATE VISUAL (preencha, imprima e só então libere a tela)

Toda tela/componente passa por aqui, no Build e no Review. Qualquer ✗ reprova a tela inteira: corrige e repreenche. As três primeiras linhas exigem o **resultado do grep colado como número**, não um "ok" qualitativo, igual ao anti-IA da copy, prova por CTRL+F.

| Check | Passa se (✓) | Prova / ✓✗ |
|---|---|---|
| **Zero gradiente decorativo** | `grep -rniE "linear-gradient|radial-gradient|conic-gradient" <dir>` = **0** (a riqueza vem de 2 tons SÓLIDOS em blocos, não de degradê). Exceção única: glow do CTA e backdrop-blur de nav, contados à parte | `gradiente: N` |
| **Zero emoji na UI** | Nenhum emoji renderizado na interface; todo ícone é **SVG de linha**. Rode o grep de emoji (bloco abaixo) = **0** | `emoji: N` |
| **Zero travessão** | `grep -rn "," <dir de UI e docs>` = **0** (usa vírgula, parênteses ou `·`). Vale pra UI E docs novos | `travessão: N` |
| **Componentes ricos** | Nenhuma "caixinha título+descrição". Usa os componentes ricos (hero 2 colunas, KPI número gigante + label mono, escada de valor, acordeão numerado, vídeo com capítulos, mockup device, vitrine, timeline, card kicker+título+chips, modal pra conteúdo longo, lightbox). Ver `padrao-visual-default.md` | ✓/✗ |
| **Tokens de cor + 2 temas** | Toda cor é `var(--token)`; 2 temas (claro/escuro) aplicados **antes do paint, sem flash** (o tema é setado no `<head>`, não depois de renderizar) | ✓/✗ |
| **Login split** | Entrada por login split de 2 colunas (narrativa da marca + card do form ~392px); o resto atrás do gate | ✓/✗ |
| **Nav numerada + menus de dados** | Nav numerada, grupos colapsáveis **persistidos**, menus renderizados de **array de dados** (não hard-coded item a item) | ✓/✗ |
| **i18n motor próprio** | pt/en/es com chaves **namespaced**, motor próprio (sem string solta no meio do JSX) | ✓/✗ |
| **Marca do cliente aplicada** | A paleta/tipo é a do CLIENTE (leu a marca dele); na ausência, o **default é o padrão visual da skill** (preto, Bebas/Inter/JetBrains Mono, acento `#4ade80`, hairlines, cantos retos) | ✓/✗ |
| **VEREDITO** | **= o PIOR item acima.** Um ✗ = REFAZ a tela. Só tudo-✓ = LIBERA | |

**Grep de prova (rode e cole o número):**
```bash
# gradiente decorativo
grep -rniE "linear-gradient|radial-gradient|conic-gradient" <dir> | wc -l
# travessão em UI/docs
grep -rn "," <dir> | wc -l
# emoji na UI (faixas comuns de emoji)
grep -rnP "[\x{1F300}-\x{1FAFF}\x{2600}-\x{27BF}\x{2190}-\x{21FF}\x{2B00}-\x{2BFF}]" <dir> | wc -l
```

Por que inegociável: o dono vai **apresentar isso na frente do cliente dele**. Gradiente, emoji e travessão são a assinatura de "saiu de IA barata"; caixinha de título+descrição é a de "template genérico". A tela tem que parecer construída por alguém que se importa. Detalhe de cada componente e do CSS/HTML em `references/padrao-visual-default.md`.

## 🔧 GATE DE ROBUSTEZ (pro que NÃO tem tela: automação, integração, script, robô)

Build sem UI não passa no Gate Visual, passa aqui. Todo ✗ reprova: corrige e re-roda.

| Check | Passa se (✓) |
|---|---|
| **Idempotente** | rodar 2x não duplica nem corrompe (mesma entrada → mesmo estado final); usa chave de deduplicação onde precisa |
| **Erro tratado + retry** | toda chamada externa (API, banco, webhook) tem timeout, trata a falha e re-tenta com backoff; nunca engole erro em silêncio |
| **Log observável** | loga início, fim e erro de cada execução (o dono vê por que falhou sem abrir o código) |
| **Sem segredo no código** | credencial em `.env`/cofre, nunca hard-coded; caçado antes do push |
| **Provado nos 2 caminhos** | testado no caminho feliz E em 1 de falha (a API caiu, o dado veio torto). Lei 2 vale igual: sem prova é `[NÃO VERIFICADO]` |
| **VEREDITO** | o pior item acima. Um ✗ = corrige e re-roda |

---

## EXEMPLO DENSO (do pedido até as seções)

**Pedido (falado):** "Fechei uma consultoria com uma rede de 3 clínicas veterinárias. Preciso levar na reunião de segunda um painel que mostre o diagnóstico que fiz e a proposta. E depois quero entregar pra eles um portalzinho onde a equipe acompanha os protocolos."

**Pergunta Zero:** do zero. → Fase 1.

**Fase 1 (Spec, uma pergunta por vez, resumida):**
- Objetivo: um WAR ROOM pra reunião de segunda + um PRODUTO (portal de protocolos) pra entregar depois.
- Requisitos WAR ROOM: visão geral da rede (3 unidades, KPI de faturamento/unidade), diagnóstico (3 gargalos achados, cada um com o dado que prova), vídeo de 8 min gravado com capítulos por gargalo, plano de ação em 4 fases numeradas, proposta (3 níveis de investimento).
- Requisitos PRODUTO: multi-tenant (cada clínica é um tenant, RLS separando os dados), login por equipe, LMS com os protocolos em módulos, onboarding guiado no 1º acesso, dados demo de uma clínica-exemplo.
- Restrições: a marca da rede é azul-petróleo e branco (não o preto do default); prazo do war room = segunda.
- Definição-de-pronto: (war room) o dono loga, apresenta as 5 seções e mostra a proposta; (produto) uma clínica loga, vê só os dados dela, e a equipe abre um protocolo no LMS.

→ **STOP: "pode ir?"** → "pode ir".

**Fase 2 (Arquitetura):** repo `<org-do-dono>/vet-rede-painel` criado. War room = SPA + Express/sessão no Cloudflare Pages. Produto = Node na VPS (Caddy → `127.0.0.1:8412`, systemd), Supabase com RLS por `tenant_id`, subdomínio `vetrede.seudominio.com.br`. Vídeo (lento) → o upload/transcode vai pra fila + worker. Tokens de cor da marca azul-petróleo definidos; tema claro/escuro.

**Fase 3 (Build, paralelo):** um agente no war room (as 5 seções como componentes ricos: hero 2 colunas, KPIs número-gigante, acordeão numerado do plano, player com capítulos, escada de 3 níveis na proposta), outro no schema + RLS do produto, outro no LMS + onboarding. Cada tela passa pelo gate visual (grep de gradiente/emoji/travessão = 0).

**Fase 4 (Review):** roda os dois sistemas, confere requisito por requisito. Faltou o KPI por unidade no war room → volta pro build → refaz → 100%.

**Fase 5 (Entrega):** login real nos dois; screenshots das 5 seções e do LMS; query confirmando que a clínica A não enxerga o dado da clínica B (RLS de pé); probe no subdomínio (200 + TLS). Pacote: link do war room, link do produto, repo, screenshots. Entregue.

---

## When NOT to Use (manda pro caminho certo)

- Pediu **copy / headline / carrossel / reel / stories / conteúdo** → `soft-conteudo-*` (esta skill constrói o sistema, não escreve a copy dele).
- Pediu **carta / VSL / landing de venda / isca / funil** → `soft-funil-*`.
- Pediu **webinar** (roteiro, páginas, oferta, chat) → `soft-webinar-*`.
- Pediu **script de venda / objeção / fechamento** → `soft-vendas-*`.
- Pediu **arte / PNG / carrossel visual / banner solto** (imagem, não sistema) → `soft-designer`.
- Pediu **edição de vídeo / corte / legenda** solta → `soft-editor-video`.
- Pediu **posicionamento / plano de marca / mecanismo** → `soft-plano-posicionamento`.
- Pediu **proposta comercial** em documento (não como seção de um war room) → `soft-proposta-comercial`.

A régua: se o entregável é **código que roda** (sistema, site, ferramenta, automação, integração, script, robô), é aqui. Se é **peça de comunicação** (texto, arte, vídeo), é das `soft-*` acima.

## Anti-Patterns (sintoma → correção)

| Sintoma | Correção |
|---|---|
| Fez "caixinha título+descrição" em vez de componente rico | Reprova no gate visual: troca por hero 2 colunas / KPI número-gigante / acordeão numerado / vídeo com capítulos (ver `padrao-visual-default.md`) |
| Usou gradiente decorativo | Grep > 0 = ✗ automático. Riqueza vem de 2 tons sólidos em blocos, não de degradê |
| Emoji na UI ou travessão na UI/doc | Grep > 0 = ✗ automático. Ícone = SVG de linha; travessão vira vírgula/parênteses/`·` |
| Fez deploy sem repo | Cria o repo na Fase 2, ANTES da 1ª linha. Repo = produção; sem repo não há ponto de retorno |
| Editou sistema existente sem estudar antes | Pergunta Zero: localiza o código real, estuda inteiro em paralelo, commita o estado atual ANTES de mexer, e só então entrevista com perguntas informadas |
| Começou a codar antes do "pode ir" | O STOP do fim da Spec é o único obstáculo. Sem "pode ir", não escreve código nem cria repo |
| Inventou feature fora da spec, ou cortou requisito | Lei 1: constrói exatamente a spec. Falta virou `[A CONFIRMAR]`, não invenção nem corte |
| Disse "está no ar" sem provar | Lei 2: login real + screenshot + query/probe. Sem prova é `[NÃO VERIFICADO]` |
| Review leu o código e concluiu que "deve funcionar" | Review roda o sistema REAL e compara requisito por requisito. Ler ≠ verificar |
| Chave de IA no client | IA sempre atrás de proxy server-side com JWT. Chave nunca vai pro browser (ver `frente-produto.md`) |
| Colocou tudo síncrono e a request emperrou no vídeo/IA | O lento vai pra fila + worker; o síncrono responde na hora (ver `frente-produto.md`) |
| Construiu em Sonnet pra economizar | Build e Review são `model opus` sempre. Leitura de código pré-existente pode em Sonnet; escrever código, não |
| Pediu permissão a cada passo do loop | Após "pode ir", itera sozinho. Só para pra mudar escopo ou pra ação destrutiva |
| Segredo em texto puro commitado | Cofre do dono (`.env` cifrado na VPS); caça segredo antes de cada push (ver `entrega-e-infra.md`) |

## References (profundidade; o fluxo acima é autossuficiente)

- `references/padrao-visual-default.md`: o design system (paleta, 3 fontes, forma) + a engenharia estrutural (componentes ricos, tokens, 2 temas sem flash, login split, nav numerada, i18n) com exemplos de CSS/HTML. Leia antes de construir qualquer tela.
- `references/frente-war-room.md`: anatomia dos menus do war room, vídeo com capítulos, infográficos, backend Express + sessão. Leia na Fase 1/3 do war room.
- `references/frente-produto.md`: multi-tenant com RLS, IA atrás de proxy com JWT, LMS, onboarding, dados demo, segurança. Leia na Fase 1/3 do produto.
- `references/entrega-e-infra.md`: GitHub sempre, Cloudflare Pages (war room) / VPS Caddy + systemd (produto), subdomínio, cofre de credenciais, checklist de pronto. Leia nas Fases 2 e 5.
