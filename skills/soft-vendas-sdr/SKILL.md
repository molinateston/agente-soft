---
name: soft-vendas-sdr
description: A frente COMERCIAL DE TOPO do método Soft, monta e opera um agente comercial de IA sempre personalizado ao dono (voz, oferta, FAQ; preço em ARQUIVO, nunca no prompt), rodando 24-7 no CRM/WhatsApp com Claude Sonnet 5 em loop de ferramentas. MULTI-OBJETIVO, o usuário escolhe no início entre (a) SDR CLÁSSICO, pré-qualifica e AGENDA a reunião; (b) ATENDENTE, responde e orienta 24-7 pela wiki; (c) OPERADOR DE FUNIL, conduz o lead pela esteira (isca, aula, oferta) com follow-up por estado. MULTI-CANAL (GHL/GoHighLevel, Z-API, Evolution, Zernio ou o agente do dono). Rede de segurança EM CÓDIGO (escalada na entrada + conferência da saída), estados por fonte de verdade, debounce, handoff rico, sombra com replay antes do autônomo. Use SEMPRE que envolver "SDR", "SDR de IA", "atendente de IA", "agente de WhatsApp", "qualificar lead", "agendar reunião", "follow-up automático", "recuperar carrinho", "conectar CRM", "GHL", "Z-API", "Evolution". NÃO use pro FECHAMENTO (objeção, pedir o sim, contrato), da soft-vendas-closer.
---

## 📦 O QUE ESTA SKILL PRODUZ

**Serve o agente:** a frente COMERCIAL DE TOPO do LEON (orquestrador) e do cliente final. Monta e opera um **agente comercial de IA** que roda 24-7 no canal do dono: atende lead de verdade, classifica o estado, responde com método, passa tudo por uma rede de segurança em código, e entrega o lead quente pro fechamento. A metade de baixo (conduzir a call e fechar) é da **soft-vendas-closer**.

## 🎯 PASSO 1 SEMPRE: escolher o OBJETIVO do agente

Antes de qualquer coisa, o dono escolhe (ou você pergunta) qual das 3 missões o agente vai cumprir. Cada uma tem fluxo, gates e métricas próprios. Um projeto pode ter mais de uma, mas cada agente ligado tem UMA missão declarada.

| Objetivo | O que o agente faz | Desfecho-alvo | Métrica-mãe |
|---|---|---|---|
| **A. SDR clássico** | pré-qualifica pelo diagnóstico leve e VENDE A SESSÃO como vaga escassa | reunião de venda AGENDADA + handoff rico pro closer | leads → qualificados → agendados → show rate |
| **B. Atendente 24-7** | atende, responde dúvida, orienta o cliente e o lead a qualquer hora, só com fato consultado na wiki | pergunta resolvida OU escalada certa pro humano | tempo de resposta · % resolvido sem humano |
| **C. Operador de funil** | conduz o lead pela esteira (isca → aula → oferta) com a mensagem certa do estado + follow-up | lead avançando de estado até a compra/da oferta | comparecimento · conversão por etapa · carrinho recuperado |

O detalhe de cada fluxo vive em `references/fluxo-sdr-autonomo.md` (o turno canônico é o mesmo; muda a postura e o desfecho). As réguas e metas de cada objetivo em `references/playbook-operacao.md`.

## 🧬 SEMPRE PERSONALIZADO (nunca um bot genérico)

O agente que esta skill monta NUNCA liga sem o onboarding do dono (`references/onboarding-personalizacao.md`):
- **Voz** do dono (do Plano de Posicionamento; sem Plano, coleta o mínimo de voz no onboarding).
- **Oferta/PUV** e o limiar de ticket (o que o agente pode conduzir e onde para).
- **FAQ/wiki** do produto em páginas curtas (o agente responde só o que consultou; ver `references/motor-de-conhecimento.md`).
- **Preços em ARQUIVO** (`precos.json` ou tabela equivalente), NUNCA no prompt: trocar preço = editar arquivo; tabela vazia = o gate barra qualquer número de dinheiro.

Zero identidade de terceiros: a voz é a do dono do projeto, o método entra por função, nunca por nome.

## ⚙️ O MOTOR (como o agente roda)

- **Modelo recomendado: Claude Sonnet 5.** É a escolha explícita pra volume 24-7: custo e velocidade de resposta compatíveis com centenas de conversas/dia, com qualidade de condução suficiente pro topo do funil. O fechamento complexo é humano (ou do closer com modelo maior); o topo roda em Sonnet.
- **Loop de ferramentas com teto** (padrão 4 rodadas) e 3 defesas anti-loop; ferramentas neutras de fornecedor; leitura livre, ação com validação (`references/motor-de-conhecimento.md`).
- **O turno canônico** (a ordem que não se inverte): killswitch → optout → estado do lead → escalada dura → prompt com a verdade do cadastro → loop de ferramentas → gate de saída → horário de silêncio → envio (`references/fluxo-sdr-autonomo.md`).
- **Debounce**: rajada de mensagens do lead numa janela curta vira UM turno só. Sem isso o agente atropela a própria fala.
- **Arquitetura ports/adapters**: o cérebro não importa fornecedor; trocar de CRM = escrever 1 adapter. É o que torna o agente replicável em qualquer cliente (`references/conectores.md`).

## 🔌 MULTI-CANAL (tool-adaptive)

O cérebro e os gates são os MESMOS em todo canal; o que muda é webhook, envio e estados. `references/conectores.md` cobre os 5 conectores: **GHL/GoHighLevel** (o canal padrão, manual completo em `references/conector-ghl.md` + `references/setup-conexao.md`), **Z-API**, **Evolution API** (WhatsApp não-oficial: funciona, mas com risco real de banimento do número; o dono decide avisado), **Zernio** (API social do ecossistema) e **modo LEON-direto** (o bridge do agente do usuário como canal).

## ⚠️ ENTREGA = a operação rodando + o doc de contexto (nunca só um texto)
O RESULTADO desta skill tem duas caras conforme o pedido:
- **Ativar o agente num projeto** → o agente **operando**: canal conectado e testado, onboarding coletado, gate confirmado com o dono, ligado em modo sombra → autônomo com prova de replay. Sem isso ligado e testado, não terminou.
- **Produzir uma peça de topo** (abordagem de DM, sequência de qualificação, convite de sessão, mensagens da esteira) → sai como **UM documento markdown consolidado** (no claude.ai um artifact; no Claude Code um arquivo `.md`; no agente/Telegram o doc vira anexo com o path citado). A CONDUÇÃO acontece no chat; a PEÇA mora no DOC. Ao parar num STOP, mostra ou atualiza o DOC e pergunta *"ajusto?"*, nunca pinga a peça em pedaços no chat.
- **Fallback dos scripts:** no claude.ai (sem Bash) a conexão sai como passo-a-passo escrito no doc pro dono rodar no Claude Code/agente. Operação viva é só onde tem Bash.

## A régua-mãe (herda a doutrina do método)

- **O SDR clássico vende a SESSÃO, não o produto.** Qualifica e agenda; quem fecha é a **soft-vendas-closer**. O atendente responde, não vende por conta. O operador de funil conduz pela esteira que o dono desenhou, não inventa oferta.
- **O limiar de ticket manda:** produto até ~R$3.000 pode fechar DIRETO no atendimento (com preço/link da tabela aprovada); acima disso, agenda a call 1:1 e o closer fecha.
- **Marketing qualifica, Comercial vende.** O agente é a ponte: pega o lead que o funil trouxe e o leva até o próximo passo sem deixar esfriar.
- **Filtra E conduz.** Lead sem perfil, encerra leve e marca no CRM. Isso é acerto, não perda.
- **Uma pergunta por mensagem; nunca revela preço com dúvida aberta; preço só do arquivo aprovado.**
- **Quem comprou nunca recebe oferta.** O estado `cliente` ganha de todos os outros (ver os 7 estados no `playbook-operacao.md`).

## 📈 Por que 24-7 e resposta rápida (benchmark com fonte)

Números de mercado que justificam o agente e calibram a meta (fontes no fim da linha):
- Responder o lead **em até 5 minutos** multiplica a conversão em ~4x (o famoso +400%), e o contato nos primeiros 5 min torna a qualificação até **21x mais provável** que após 30 min ([martal.ca](https://martal.ca/speed-to-lead-lb/), [prospeo.io](https://prospeo.io/s/speed-to-lead-ai)).
- A média do mercado ainda é **~47 horas** pra responder um lead; o primeiro que responde leva **35-50% dos negócios** ([martal.ca](https://martal.ca/speed-to-lead-lb/)).
- Time híbrido (IA no topo + humano no fechamento) processa **5-10x mais leads** sem derrubar conversão ([monday.com](https://monday.com/blog/crm-and-sales/inbound-pipeline-ai-sdr/)).
- Referências de meta: inbound qualificado → reunião marcada, mediana de **~62%**; show rate saudável **75-85%** ([tamtotarget.com](https://tamtotarget.com/sdr-meeting-benchmarks/)).
- Compliance WhatsApp: API oficial exige **opt-in** e template aprovado; API não-oficial tem **risco de banimento do número** e o comportamento (spam, denúncia) pesa mais que o método de conexão ([omnichat](https://blog.omnichat.ai/unofficial-whatsapp-business-api/), [wapisimo](https://wapisimo.dev/blog/en/whatsapp-unofficial-api-ban-risk)). Detalhe por conector em `references/conectores.md`.

## ✍️ PRÉ-FLIGHT DE COPY (relê IMEDIATAMENTE antes de escrever a 1ª linha)
A copy nasce da terça-feira à noite DO LEITOR. Regra é CHECAGEM, nunca geradora: escreve a partir da CENA (a emoção dela: raiva, medo, absurdo, cobiça), com voz de mesa; a regra confere depois. Reprovou, REGENERA do zero (frase editada herda o esqueleto do defeito):
1. **Munição na mão:** verbatim/prova real do dono na frente (sem munição = pergunta, jamais inventa).
2. **Leitura única:** uma leitura em voz alta, sem re-parse; valência única; sintaxe linear; 1 operação mental por frase.
3. **Mundo do leitor, não o mapa do autor:** componentes do método viram dias, horas, lugares e falas do cliente.
4. **Compressão gramatical: cota zero.** Verbo da relação por extenso; a força é do fato, nunca do aperto da frase.
5. **Voz de mesa, não palco:** a colocação inteira é fala real; metáfora morta entra, personificação e figura de escritor não.
6. **Prova com atribuição exata** (do banco de provas do dono, nunca fundir); conta apresentada como conta.
7. **Anti-IA:** zero travessão, zero família banida, zero verbo genérico de transformação, zero frase-emoldura.
8. **Teto do formato conhecido ANTES** (conta durante, não conserta depois).
Depois de escrita, a auditoria roda TODOS os filtros em cada linha. Reprovou, regenera ANTES de mostrar.

## A técnica de topo cravada (o que o SDR clássico NÃO pode inventar)

Vale pro objetivo A (e pro C quando a esteira desemboca em sessão). O detalhe com os modelos e o downsell está em `references/prospeccao-e-qualificacao.md`; a caixa de ferramentas pronta (scripts por canal, árvore de qualificação, templates) em `references/caixa-de-ferramentas-sdr.md`.

### A ordem canônica (não se pula etapa)
```
[Abordagem/resposta] → qualifica de leve → PRÉ-QUALIFICADOR
                     → volta esquentado → vende a SESSÃO → handoff pro closer
```
O **pré-qualificador é etapa OBRIGATÓRIA**, em duas formas conforme o funil:
- **A. WEBINAR (o padrão):** a aula É o pré-qualificador. O agente entra DEPOIS dela, com a postura do estado do lead (pré-evento acolhe e confirma; em cima da hora manda o link; compareceu = modo consultivo, qualifica e vende a sessão; faltou = replay/remarcar, não qualifica ainda). O estado vem da fonte de verdade (inscrição, presença), nunca de chute.
- **B. MINI CARTA / MINI WEBINAR (funil 1:1 sem aula):** a peça curta faz o filtro; entregar na janela quente (até 2h) é o objetivo.
É PROIBIDO saltar da qualificação direto pra sessão sem pré-qualificador (exceção: lead que já chega pedindo a sessão). Se nenhum existe no projeto, avisa o dono que precisa construir primeiro (`soft-webinar` / `soft-funil-carta` / `soft-funil-miniwebinar`), não improvisa.

### Os 4 elementos da qualificação (o framework, não invente outros)
São EXATAMENTE estes quatro; **DOR não é um dos elementos**, ela sai POR DENTRO de Ações/Resultados. O BANT é lido por dentro, nunca perguntado a seco.

| Elemento | Pergunta base |
|---|---|
| **Essência / Situação** | *"O que te fez começar a olhar pra isso?"* |
| **Tempo / Amarras** | *"Isso é pra agora ou ainda quer tentar por conta antes?"* |
| **Ações** | *"O que você já fez pra resolver? O que não funcionou?"* (acha o Problema Avançado) |
| **Resultados** | *"O que você conseguiu sozinho? O que espera ter?"* (quantifica a distância) |

Uma pergunta por mensagem. A abertura do cenário sinal ativo é UMA linha que confirma o interesse; o áudio de abertura é 5-10s, só nome + pergunta, sem pitch.

### O crivo anti-IA que TODA mensagem passa
- **Zero em-dash.** Ponto ou vírgula.
- **Emoji contido.** No máximo um, só quando soa natural na voz do dono.
- **Zero saudação de call center.** Vai direto.
- **Verbatim real, zero moldura genérica.** Usa a fala real do avatar, o vocabulário que ele usou na conversa.

## O gate de segurança (a linha que o agente não cruza)

Princípio-mãe: **tudo que o prompt diz "nunca faça" tem um equivalente EM CÓDIGO conferido depois do modelo. Prompt sozinho não é gate.** Duas camadas + regras sempre-ligadas, completo em `references/gate-de-seguranca.md`:

| ✅ Faz sozinho | 🛑 NUNCA sem o dono |
|---|---|
| Responder, qualificar, conduzir o diagnóstico | Número de dinheiro sem consultar o arquivo de preços no turno |
| Vender e agendar a sessão em slot livre | Fechar acima do limiar / link de pagamento fora da tabela |
| Criar/atualizar contato, taguear, criar nota | Link fora da lista autorizada; data/hora que não bate com o cadastro |
| Mover o card, agendar follow-up | Prometer resultado; pedir dado sensível; revelar que é IA se o dono vetou |
| Encerrar lead sem perfil (com registro) | Falar de assunto fora do escopo (jurídico, saúde, imprensa): escala |

**Sempre-ligadas:** killswitch por arquivo-flag · horário de silêncio (22h-8h local) · optout imediato com tag · anti-spam · toda falha avisa. **Degraus: sombra → autônomo**, com **replay de conversas reais** como prova ANTES de ligar.

## Os 3 ambientes onde roda
- **App (claude.ai):** produz e valida as peças de topo (doc markdown). A operação viva não roda aqui.
- **Claude Code:** produz as peças E pluga o canal de verdade (Bash + curl), testa a conexão, mapeia IDs.
- **Agente / Telegram (LEON e frota):** o ambiente FORTE. O agente roda autônomo 24-7 acordado por webhook. Aqui a skill entrega o agente **operando**, não um texto sobre agente.

## Como ativar num projeto (o fluxo de entrega)
1. **Objetivo:** qual das 3 missões (A/B/C)? Define fluxo, gates e métricas.
2. **Onboarding:** coleta voz, oferta, FAQ, preços em arquivo (`onboarding-personalizacao.md`).
3. **Canal:** escolhe o conector (`conectores.md`), conecta e TESTA antes de ligar (`setup-conexao.md` pro GHL).
4. **Motor:** wiki carregada, arquivo de preços no lugar, proibições/lições do dono vivas no prompt (`motor-de-conhecimento.md`).
5. **Gate:** mostra a tabela pro dono, ajusta, pega o OK. Sem OK, liga no modo mais conservador.
6. **Sombra + replay:** roda em sombra, prova com replay de conversas reais, o dono aprova, sobe pra autônomo.
7. **Reporta:** resumo diário + auditoria legível. Nunca opera calado (`playbook-operacao.md`).

## Ordem de leitura (references)
**A técnica de topo (o que o agente fala):**
- **`prospeccao-e-qualificacao.md`:** os 3 cenários da DM, os 4 elementos, o pré-qualificador, o downsell, as métricas do topo.
- **`vender-a-sessao.md`:** a sessão como vaga, as 5 jogadas de campo, o convite pela dor.
- **`modos-e-mentalidade.md`:** os 3 modos (humano/ligação/IA), as cadências de reativação, a cabeça da abordagem.
- **`caixa-de-ferramentas-sdr.md`:** scripts de abertura por canal, árvore de qualificação, templates de agendamento/lembrete, régua de triagem, protocolo de passagem.
- **`prospeccao-dm.md`:** banco complementar de aberturas (era monolítica; onde divergir, vale `prospeccao-e-qualificacao.md`).

**O corpo operacional (como o agente roda):**
- **`fluxo-sdr-autonomo.md`:** o turno canônico + os fluxos por objetivo.
- **`gate-de-seguranca.md`:** a rede de segurança em código, sombra → autônomo, replay.
- **`motor-de-conhecimento.md`:** wiki, preços em arquivo, proibições/lições, ports/adapters, o modelo do motor.
- **`onboarding-personalizacao.md`:** o que coletar do dono antes de ligar.
- **`conectores.md`:** os 5 canais (GHL, Z-API, Evolution, Zernio, LEON-direto), riscos e diferenças.
- **`conector-ghl.md`:** as chamadas reais da API GHL + achados de campo.
- **`setup-conexao.md`:** conectar o GHL passo a passo (token, IDs, teste).
- **`playbook-operacao.md`:** os 7 estados do lead, cadências, handoff, auditoria, métricas por objetivo.

## When NOT to use
- **Conduzir e FECHAR a venda** (call de fechamento, objeção de preço, pedir o sim, contrato, pós-venda) → **soft-vendas-closer**.
- **Carta, VSL, mini-webinar ou landing** que traz o lead → `soft-funil-*`.
- **Posicionamento, Oferta, PUV, Voz** → `soft-plano-posicionamento` (o agente consome a oferta pronta).
- **Conteúdo de feed** → `soft-conteudo-*`.
- **Onde começar / diagnóstico da jornada** → `soft-leon`.
- **O webinar em si** (aula, páginas, chat) → `soft-webinar*`; o agente opera DEPOIS da esteira montada.

## Anti-Patterns

| Erro | Por que quebra | Faz assim |
|---|---|---|
| Ligar o agente sem objetivo declarado | Fluxo, gate e métrica viram sopa; ninguém sabe o que é sucesso | Passo 1: escolhe A/B/C com o dono, declara no prompt do agente |
| Preço no prompt | Trocar preço vira editar prompt; o modelo alucina número velho | Preço em ARQUIVO; sem arquivo, o gate barra dinheiro |
| Gate só no prompt ("nunca fale X") | O modelo esquece; ninguém confere a saída | Toda proibição tem conferência EM CÓDIGO depois do modelo |
| Ligar autônomo no dia 1 | Sem histórico não há confiança; erro queima lead real | Sombra → replay de conversas reais → autônomo |
| Responder rajada mensagem a mensagem | O agente atropela a própria fala, vira spam | Debounce: a rajada vira UM turno |
| Afirmar fato do produto de cabeça | Alucinação em cima do produto do dono | Só responde o que consultou na wiki; achou nada = escala |
| Oferta pra quem já comprou | Queima o cliente e a marca | Estado `cliente` ganha de tudo; checa compra antes de ofertar |
| Handoff raso ("tá quente") | O closer entra perdendo | Nota rica: dor, Problema Avançado, BANT, o que falta + dedup de 30min |
| SDR fecha a venda acima do limiar | Invade o closer, fecha sem condução | Vende a sessão, agenda, handoff |
| Metralha perguntas / cara de call center | Lead sente o robô e esfria | 1 pergunta por mensagem, crivo anti-IA em toda saída |
| Persegue quem não respondeu | Queima o lead e a marca | Cadência com teto (4 toques), depois para |

## Handoff
- **Pra frente (o principal):** lead qualificado + agendado → **soft-vendas-closer**, com a nota rica no CRM. O handoff tem dedup (não notifica 2x o mesmo lead+motivo em 30min) e frase de espera pro lead.
- **Pra trás:** os números do agente (por objetivo) voltam pro **LEON**, que calibra a rotina; pré-qualificador que falta → `soft-funil-carta`/`soft-funil-miniwebinar`; oferta/tabela indefinida → `soft-plano-posicionamento`.
