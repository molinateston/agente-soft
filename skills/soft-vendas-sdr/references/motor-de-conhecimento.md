# O motor: modelo, ferramentas, conhecimento e arquitetura

Como o agente pensa e de onde ele tira o que afirma. Este reference é o desenho do MOTOR que a skill monta; o fluxo do turno vive em `fluxo-sdr-autonomo.md`, a rede de segurança em `gate-de-seguranca.md`.

## O modelo: Claude Sonnet 5 (a recomendação explícita)

O agente roda com **Claude Sonnet 5** em loop de ferramentas. É a escolha certa pro topo do funil e não é por acaso:
- **Custo por conversa** compatível com volume 24-7 (centenas de turnos/dia sem estourar a conta do dono).
- **Velocidade de resposta** que sustenta a meta de minutos (o benchmark de speed-to-lead da SKILL.md).
- **Qualidade suficiente** pra conduzir diagnóstico leve, seguir postura de estado e respeitar gate. O raciocínio pesado (fechamento complexo, exceção estranha) não é dele: escala pro humano ou pro closer.

Regra de bolso: o TOPO roda barato e rápido; a decisão cara é humana. Subir o modelo do motor é decisão do dono com número na mão (custo x taxa de escalada), não default.

## As ferramentas (leitura livre, ação com validação)

O agente opera com um conjunto pequeno de ferramentas neutras de fornecedor (o adapter traduz pro CRM da vez). O desenho de referência, provado em produção:

| Ferramenta | O que faz | Tipo |
|---|---|---|
| `buscar_conhecimento` | busca na wiki do produto e devolve SÓ o trecho | leitura |
| `consultar_inscricao` | a verdade do cadastro do lead (horário, evento, link exclusivo) | leitura |
| `verificar_compra` | o lead já comprou? (o estado `cliente` ganha de tudo) | leitura |
| `consultar_sessoes` | os horários/slots disponíveis | leitura |
| `consultar_preco` | o preço/condição DO ARQUIVO (única fonte de dinheiro) | leitura |
| `reagendar_inscricao` | muda o horário do lead (com validação e idempotência) | ação |
| `solicitar_humano` | escala com briefing rico + frase de espera pro lead | ação |

**Três ferramentas NÃO existem de propósito:** processar pagamento, enviar e-mail em nome do dono, busca na web. O que o agente não tem, ele não faz nem alucinando: a ausência da ferramenta é parte do gate.

## A wiki destilada (o agente nunca lê PDF cru)

O conhecimento do produto entra como **páginas .md curtas** (uma por tema: acesso, garantia, formato, bônus, suporte...), destiladas do material do dono no onboarding. O motor busca por pontuação de palavra, sem embedding, sem vector DB: simples, auditável, e suficiente pra FAQ de produto.

Regras duras:
- **Proibido afirmar fato do produto sem consultar.** Toda afirmação nasce de `buscar_conhecimento` no turno.
- **Achou nada = handoff, nunca invenção.** "Deixa eu confirmar isso com o time e já te volto" + escalada.
- **A ferramenta devolve o trecho, não o arquivo.** Contexto limpo, resposta curta.
- **Wiki desatualizada é defeito do dono, não do agente:** o playbook manda revisar a wiki quando um tema recorrente aparece nas escaladas.

## Preço mora em ARQUIVO, nunca no prompt (o padrão que não se negocia)

- A tabela de preço/condição vive num arquivo do projeto (`precos.json` ou equivalente). **Trocar preço = editar o arquivo.** Sem deploy, sem reescrever prompt, sem risco de número velho decorado pelo modelo.
- `consultar_preco` é a ÚNICA porta: o gate de saída barra qualquer número de dinheiro que não passou por ela no turno.
- **Arquivo vazio = agente mudo sobre dinheiro.** Preencher a tabela é decisão do dono, tomada no onboarding, nunca do agente.

## PROIBIÇÕES e LIÇÕES do dono (a memória que não regride)

Dois arquivos vivos entram INTEIROS no prompt de todo turno:
- **PROIBIÇÕES:** o que o dono cravou que nunca sai ("não prometa vaga", "não cite concorrente", "não use emoji").
- **LIÇÕES:** as correções acumuladas da operação ("quando perguntarem X, a resposta certa é Y").

Toda correção do dono na auditoria vira linha num desses arquivos. É assim que o agente melhora sem regredir: a lição de ontem não depende da memória do modelo, está no prompt de amanhã.

## Ports & adapters (o desenho que torna o agente replicável)

O motor separa o CÉREBRO dos FORNECEDORES:
- **Ports (contratos):** canal (ler/enviar mensagem), CRM (contato/tag/nota/card), LLM (o modelo). O cérebro só conhece os contratos.
- **Adapters:** a implementação de cada fornecedor (GHL, Z-API, Evolution, Zernio, LEON-direto...). **Trocar de CRM = escrever 1 adapter**, o cérebro não muda uma linha.
- **Config única:** um só lugar sabe qual adapter usar, onde mora o killswitch e o arquivo de preços.
- **Mocks:** adapters falsos provam o motor inteiro sem credencial nenhuma. É o que permite testar a lógica (estados, gates, loop) antes de conectar a conta real do cliente, e o que faz o replay funcionar.

Consequência de produto: o MESMO cérebro atende qualquer cliente do dono; o custo de um cliente novo é 1 adapter (se o canal for novo) + 1 onboarding (sempre).

## Auditoria dupla (por que o dono confia no motor)

Cada turno é gravado 2x:
- **`turnos.jsonl`** (máquina): entrada, estado, ferramentas chamadas, saída, gate. É o que o replay consome.
- **Diário legível** (dono): a conversa como aconteceu, com o que o agente decidiu e por quê, num .md por dia.

Sem responder "por que ele respondeu isso?", o dono não confia no motor, e motor sem confiança fica preso no modo sombra pra sempre. A auditoria é entregável padrão, não luxo.
