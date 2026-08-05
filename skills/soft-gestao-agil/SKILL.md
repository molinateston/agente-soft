---
name: soft-gestao-agil
description: "Skill OPERACIONAL de gestao agil pra QUALQUER negocio dentro do LEON. Cobre 7 camadas encadeadas: ESTRATEGIA (OKR), PRIORIZACAO, KANBAN, SCRUM (rituais), GTD (individual), ROTINAS e BRIEFING. Uma skill mae unica que roda o pipeline completo por Q&A guiado retomavel, do zero ao plano executavel: identifica a camada certa pela dor do dono, conduz as perguntas na ordem, mostra preview a cada 5 respostas e entrega o plano com OKR, iniciativas, kanban, roteiro de rituais e revisao semanal. Base: metodo autoral de gestao agil destilado de um curso completo, somado a GTD, Scrum classico e Kanban Lean. Use quando o dono pedir organizar rotina do time, planejar trimestre, montar OKR, priorizar backlog, definir briefing, sprint, review, retro, produtividade pessoal, planejamento agil, ou 'me ajuda a nao esquecer nada'. NAO use pra copy nem conteudo (soft-conteudo), funil ou venda (soft-funil-*, soft-vendas-*), financeiro (soft-financeiro), nem webinar (soft-webinar)."
---

# soft-gestao-agil, Gestao Agil OPERACIONAL (skill mae)

> Skill unica que roda o pipeline completo de gestao agil por Q&A guiado retomavel, servindo QUALQUER negocio (agencia, consultor solo, ecommerce, servico local, infoproduto, produto fisico). Do diagnostico da dor ate o plano executavel na mao.
>
> Base metodologica: curso Gestao Agil 2.0 do Denisson (a escola de gestão), 10 aulas destiladas nas references. As ferramentas nomeadas do curso (Canvas Divisao, OKR Canvas, Matriz Esforco x Impacto, Canva 3P, Backlog Duas Dimensoes com EDOC, Kanban 5 colunas, 3 Canvas de Briefing, Rotina de Experimento Semanal) sao a espinha; Scrum classico e GTD entram como notas de fonte pra casos fora do curso.

## O QUE ELA FAZ

Recebe o pedido do dono (ex: "quero organizar rotina do meu time", "me ajuda a nao esquecer nada", "como planejo o proximo trimestre", "meu time entrega no ultimo dia sempre") e devolve, no fim:

1. Diagnostico curto (qual camada o dono precisa)
2. Plano da camada escolhida (Visao + OKR, kanban inicial, roteiro de rituais, revisao semanal, briefing, ou combinacao)
3. Preview em Google Doc quando o plano crescer

## AS 7 CAMADAS (o mapa)

Ancorado na arquitetura de 3 camadas do Denisson (Estrategica, Tatica, Operacional):

| Camada | Dor tipica | Ferramenta nomeada do curso | Entrega |
|---|---|---|---|
| ESTRATEGICA (Visao + OKR) | "aonde a gente quer chegar em 3 meses?" | Canvas Divisao (aula 2) + OKR Canvas (aula 3) | Visao sintetizada + 1 Objetivo anual com 2 KRs + ate 3 O trimestrais |
| PRIORIZACAO | "tudo eh prioridade e nada anda" | Matriz Esforco x Impacto (aula 4) + Canva 3P (aula 5) | 4 quadrantes em ordem Z + classificacao Projeto/Processo/Produto |
| KANBAN | "nao sei quem esta fazendo o que" | Kanban 5 colunas (aula 9) | Quadro A Fazer / Fazendo / Validacao / Impedimento / Feito + limite WIP |
| ROTINAS (Sprint semanal) | "time entrega tudo no ultimo dia" | Rotina de Experimento Semanal (aula 10) | Planning segunda + Daily terca-sexta + Revisao sexta |
| BRIEFING (tatico) | "comecamos e ninguem sabia o que era pra entregar" | 3 Canvas de Briefing (aulas 6-7) + Backlog Duas Dimensoes com EDOC (aula 8) | Canvas de Projeto/Processo/Produto + narrativa horizontal + detalhamento vertical |
| SCRUM (nota de fonte) | dono quer Scrum puro (produto digital) | Fora do curso, ver `_metodo-scrum.md` | Aponta pra formacao Scrum Master |
| GTD (individual) | "esqueco coisa toda semana" | Fora do curso, ver `_metodo-gtd.md` | 5 passos + revisao semanal + regra dos 2 min |

## REGRAS TRANSVERSAIS (todas as camadas)

- UMA pergunta por vez. Nunca despeje 3 perguntas juntas.
- Sugerir 2-3 OPCOES em cada decisao (nunca uma so). Dono escolhe.
- ZERO default do Leo. Exemplos ilustrativos, nunca o produto/naming do Leo como padrao.
- Preview a cada 5 respostas: "olha o que ja da pra montar com o que voce me deu".
- Retomabilidade: estado salvo em `/tmp/soft-gestao-agil-<slug>-<epoch>.json` a cada resposta.
- Anti-IA lint no output final antes de fechar.
- Sem jargao. Nunca "OKR" solto sem explicar "Objetivos e Resultados-Chave". Nunca "Kanban" solto sem "quadro visual do trabalho".
- Regras de ouro do Denisson (transversais): toda iniciativa vinculada a UM OKR; todo numero tem UM responsavel nomeado; comeca pequeno (1 O anual, 2 KRs; ate 3 O trimestrais com 2 KRs cada); 80% da informacao chega pela visao (gestao visual bate lista de texto).

## FLUXO CANONICO

### M0 , MODO (1 pergunta)

"Voce quer que eu te ajude a organizar o QUE mais te aperta agora? Me conta em uma frase o que ta te incomodando na gestao/rotina de trabalho hoje."

Escuta a resposta livre e mapeia pra 1 das 7 camadas:
- "aonde quero chegar", "meta do trimestre", "objetivo grande", "visao" → ESTRATEGICA (Canvas Divisao + OKR Canvas)
- "tudo eh prioridade", "muita coisa ao mesmo tempo" → PRIORIZACAO (Matriz Esforco x Impacto + Canva 3P)
- "nao sei quem faz o que", "trabalho invisivel" → KANBAN (5 colunas Denisson)
- "entrega no ultimo dia", "sem ritmo", "sem review" → ROTINAS (Rotina de Experimento Semanal)
- "esqueco", "cabeca cheia", "nao durmo pensando" → GTD (fora do curso)
- "comecamos e ninguem sabia", "cliente entrou mudo" → BRIEFING (3 Canvas + Backlog Duas Dimensoes)
- dono pede Scrum puro pra time de produto digital → SCRUM (aponta formacao)

Se ambiguo, apresenta 2-3 opcoes: "Pelo que voce falou, pode ser [X] ou [Y]. Qual bate mais com a dor de hoje?"

### P0 , IMPORT (1 pergunta)

"Voce ja tem alguma peca pronta que a gente possa aproveitar? (Canvas de visao, OKR anterior, quadro no Trello/Notion/Miro, planilha, calendario de rituais). Se sim, me manda o link ou cola aqui. Se nao tem nada, tambem OK , a gente monta do zero."

Se dono trouxer peca, extrai contexto e pula perguntas cuja resposta ja esta na peca. Se nao, segue perguntando.

### F0 , CONTEXTO DO NEGOCIO (3 perguntas, uma por vez)

1. "Voce toca isso sozinho ou tem time? Se time, quantas pessoas envolvidas?"
2. "Faz quanto tempo o negocio roda? Estagio: idealizando, primeiros clientes, escalando, ja escalado?"
3. "Voce mede algum numero hoje? (faturamento mensal, leads/mes, cliente ativo, ticket medio). Se nao mede nenhum, tudo bem , a gente comeca por 1."

Preview 1: "Beleza. Voce eh [solo/time N] em [estagio], mede [X]. Vou puxar a camada [Y] pra ti."

### F1 , EXECUCAO DA CAMADA

Cada camada tem seu bloco de perguntas dentro da mae. Referencias detalhadas ficam em `references/_metodo-<camada>.md` (todas destiladas do curso Gestao Agil 2.0 do Denisson, salvo as duas notas de fonte).

#### ESTRATEGICA (Visao + OKR)

Referencias: `references/_metodo-visao.md` (Canvas Divisao, aula 2) + `references/_metodo-okr.md` (OKR Canvas, aula 3)

1. "Antes do OKR, a gente precisa da VISAO. Vou rodar o Canvas Divisao do Denisson (6 campos, uma pergunta por campo): Situacao Atual, Passado, Perspectivas e Tendencias, Futuro Desejado, Como Pretendo Chegar La, Visao Sintetizada."
2. Roda os 6 campos, um por vez.
3. Fecha Visao Sintetizada em 1 frase (o "1 bilhao de valuation em 5 anos" da escola de gestão e o exemplo, nunca o default).
4. "Agora o OKR anual. Formato Denisson: 1 Objetivo qualitativo forte + 2 Resultados-Chave numericos. Qual eh o Objetivo?"
5. Ajusta o Objetivo (qualitativo, sem numero).
6. Constroi cada KR (metrica, baseline, meta, prazo). Se dono nao mede baseline, cria um agora.
7. "OKR trimestral: ate 3 Objetivos, cada um com 2 KRs. Cascata a partir do anual. Qual eh o Objetivo do trimestre atual?"
8. "Pra cada KR, quais iniciativas sustentam?" (proximo bloco: Canva 3P classifica cada uma).
9. Entrega: Visao + OKR anual + OKR trimestral + iniciativas + proximo passo (rodar Canva 3P e Matriz).

#### PRIORIZACAO (Matriz + Canva 3P)

Referencias: `references/_metodo-priorizacao.md` (Matriz Esforco x Impacto, aula 4) + `references/_metodo-canva-3p.md` (Canva 3P, aula 5)

1. "Me lista tudo que esta na sua fila hoje, mesmo que meio-desorganizado. Uma coisa por linha."
2. Aplica o filtro do metodo: pra cada item, "esse item MOVE algum KR do trimestre?" Se nao move, sai (regra de ouro do Denisson: sem OKR, esta fora do escopo).
3. Roda a Matriz Esforco x Impacto do Denisson (4 quadrantes, ordem Z): Q1 alto impacto/baixo esforco (comeca por aqui), Q2 alto impacto/alto esforco, Q3 baixo impacto/baixo esforco, Q4 baixo impacto/alto esforco (NAO faz).
4. Roda o Canva 3P: pra cada iniciativa que sobrou, classifica como PROJETO (comeco/meio/fim), PROCESSO (rotina sem fim) ou PRODUTO (o que a empresa vende).
5. "Qual eh o UNICO que se voce so entregasse ele, ja valeria o mes?" (o Domino 1 do quadrante 1).
6. Entrega: fila reordenada em Z + tipo 3P de cada item + Domino 1 destacado + regra de que Q4 nao entra.

#### KANBAN (5 colunas Denisson)

Referencia: `references/_metodo-kanban.md` (aula 9)

1. "Onde vive o trabalho hoje? (Trello, Notion, Miro, ClickUp, planilha, cabeca, WhatsApp)"
2. Monta o quadro nas 5 colunas do curso: A Fazer / Fazendo / Validacao / Impedimento / Feito.
3. "Quantas pessoas puxam trabalho ao mesmo tempo?" → define limite WIP na coluna FAZENDO (regra dura do Denisson: FAZENDO SEMPRE tem limite).
4. "Qual sua definicao de PRONTO hoje? (se nao existe, monta agora)" → define quando o card sai de VALIDACAO pra FEITO.
5. Preview do quadro inicial com 3-5 cards de exemplo do proprio negocio do dono, puxados do Backlog Duas Dimensoes (se ja existe) ou da fila priorizada da camada PRIORIZACAO.
6. Entrega: quadro 5 colunas + limite WIP + DoD + regra de bloqueio (quando vai pra IMPEDIMENTO).

Cadencia: puxa da Planning (segunda), roda na Daily, fecha na Revisao sexta (ver `references/_metodo-rotinas.md` e `_metodo-kanban-review.md`).

#### ROTINAS (Rotina de Experimento Semanal, os 3 rituais Denisson)

Referencias: `references/_metodo-rotinas.md` (aula 10) + `references/_metodo-kanban-review.md` (Revisao sexta)

1. "Vou instalar os 3 rituais semanais do Denisson: Planning (segunda 9h, 1-2h), Daily (terca a sexta 8-9h, max 15min em pe), Revisao (sexta fim do dia, 30-60min)."
2. Pra cada ritual, define horario, participantes, duracao, agenda (o que se decide dentro).
3. Planning: puxa tarefas do Backlog Duas Dimensoes pro Sprint Backlog (coluna A Fazer).
4. Daily: 3 perguntas por pessoa (o que fiz, o que vou fazer, o que me impede). Max 15min.
5. Revisao: fecha o Kanban, o que ficou pendente vai pro proximo Sprint Backlog, o que faltou entra na retrospectiva rapida.
6. "O que o dono/time ja refaz TODO mes/trimestre? Vou documentar como rotina fixa fora da sprint (financeiro mensal, review trimestral do OKR, revisao anual da Visao)."
7. Entrega: 3 rituais semanais + calendario de rotinas mensais/trimestrais + arquivo agenda.

#### BRIEFING (3 Canvas + Backlog Duas Dimensoes)

Referencias: `references/_metodo-briefings.md` (3 Canvas de Briefing, aulas 6-7) + `references/_metodo-backlog.md` (Backlog Duas Dimensoes com EDOC, aula 8)

1. "Sobre qual entrega o briefing precisa ser feito? Antes de escrever, vou classificar: eh PROJETO (comeco/meio/fim), PROCESSO (rotina) ou PRODUTO (o que voce vende)?"
2. Puxa o Canvas certo do Denisson (Canvas de Projeto, de Processo ou de Produto) e roda os campos, um por vez.
3. Monta o briefing em 1 pagina (a "folha unica" do Denisson: "nada de Word de 300 paginas").
4. Se a entrega for PROJETO grande, quebra em Backlog Duas Dimensoes: narrativa horizontal (fases sequenciais) + detalhamento vertical (tarefas dentro de cada fase) + priorizacao EDOC (Essencial / Desejavel / Opcional / Questionavel).
5. Regra do MIT (13ms): 80% da informacao chega pela visao. Formato visual bate lista de texto.
6. Entrega: Canvas preenchido + Backlog Duas Dimensoes (se for projeto grande) + campo de aprovacao.

#### SCRUM (nota de fonte, fora do curso)

Referencia: `references/_metodo-scrum.md`

1. Se o dono pede Scrum puro (produto digital, time dedicado, ciclos claros): explica que o curso Gestao Agil 2.0 NAO ensina Scrum classico (usa apenas o conceito de Sprint semanal integrada ao Kanban).
2. Aponta pra formacao Scrum Master.
3. Se for pequeno/medio negocio, oferece rodar o pipeline do Denisson (ROTINAS + KANBAN) que resolve na maioria dos casos.

#### GTD (individual, nota de fonte, fora do curso)

Referencia: `references/_metodo-gtd.md`

1. "O curso do Denisson opera no time/empresa. Pra camada individual, o padrao aceito eh GTD do David Allen. Vou rodar os 5 passos com voce."
2. "Onde estao suas inboxes hoje? (email, WhatsApp, papel, cabeca, notificacao)"
3. Roda os 5 passos: Capturar, Esclarecer, Organizar, Refletir (revisao semanal), Executar.
4. Aplica a regra dos 2 min (acao com menos de 2 min: faz agora).
5. Monta as listas iniciais (Proximas Acoes por contexto, Projetos, Aguardando, Algum dia, Referencia) com exemplos da vida do dono.
6. Agenda a revisao semanal (dia/horario fixos, 1h).
7. Entrega: 5 listas + regra dos 2 min + agenda da revisao semanal.

### F2 , PREVIEW COMPLETO

Antes de fechar, mostra tudo montado em um bloco unico, curto, ASCII (compativel com Telegram):

```
======================================
PLANO GESTAO AGIL , [NEGOCIO]
======================================
Camada: [X]
Contexto: [solo / time N, estagio Y]

------ ENTREGAVEL PRINCIPAL ------
[Visao + OKR / Matriz + Canva 3P / Kanban 5 colunas / Rituais semanais / Canvas + Backlog / Listas GTD]

------ PROXIMOS PASSOS ------
1. ...
2. ...
3. ...
======================================
```

### F3 , GATE FINAL

"Esse plano encaixa? Se sim, salvo em Google Doc. Se quer ajustar alguma coisa, me diz o que muda."

Se aprovado: exporta em Google Doc via `gog drive upload --convert` e devolve a URL crua (nao markdown).

## ANTI-IA LINT

Antes de fechar QUALQUER output pro dono:
```
python3 /home/cloud/.claude/skills/soft-critico-copy/scripts/lint_copy.py <arquivo>
```
Se falhar hard (exit 1), reescreve e roda de novo. Vale pra .md do plano, brief exportado, tudo.

## RETOMABILIDADE

Estado em `/tmp/soft-gestao-agil-<slug>-<epoch>.json`. Estrutura:

```json
{
  "slug": "agencia-fulano-2026-07",
  "camada": "ROTINAS",
  "respostas": { "M0": "...", "F0.1": "...", ... },
  "preview_ultimo": 0,
  "criado_em": "...",
  "atualizado_em": "..."
}
```

Ao iniciar, se ha state file, pergunta: "achei um plano que voce comecou em [data] pra [slug]. Retoma daqui ou comeca de novo?"

## AUDITORIA (o Crivo antes de fechar)

Antes de entregar plano final ao dono:
- [ ] Toda iniciativa esta vinculada a UM OKR? (regra de ouro do Denisson)
- [ ] Todo numero tem UM responsavel nomeado? (regra de ouro do Denisson)
- [ ] Comecou pequeno (max 1 O anual com 2 KRs, ate 3 O trimestrais com 2 KRs)?
- [ ] Cada card/iniciativa tem DONO unico e criterio de PRONTO?
- [ ] Nenhum ritual foi criado sem decisao clara sendo tomada nele?
- [ ] O plano cabe na cabeca do dono em 1 pagina/print (folha unica)?
- [ ] Zero jargao ("stakeholder", "throughput", "definition of ready" sem explicar em portugues)?
- [ ] Nao pulou a Tatica? (erro mais comum segundo Denisson: pular briefing/backlog e ir do estrategico direto pro operacional)

Se qualquer NAO, revisa antes de entregar.

## O QUE NAO FAZER

- Nao empurrar OKR quando a dor eh individual (GTD resolve).
- Nao empurrar Scrum puro em pequeno/medio negocio (o pipeline Denisson chega).
- Nao criar quadro/ritual sem envolver o dono no desenho (senao ninguem usa).
- Nao usar naming do Leo (Mesa de Operacao, Sistema Soft, etc) como default. Sao exemplos ilustrativos apenas.
- Nao pular a Tatica (Briefing + Backlog Duas Dimensoes). Erro mais comum do empresario.
- Nao deixar FAZENDO sem limite WIP.
- Nao rodar Kanban sem Revisao sexta.
- Nao fechar plano sem passar o Crivo.
