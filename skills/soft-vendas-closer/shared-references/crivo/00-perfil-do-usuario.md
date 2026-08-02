# Perfil do usuário: o que é POR-USUÁRIO (e o que é universal)

> Pré-requisito de tudo no Crivo. Roda ANTES do `01-entrada-verbatim.md`. Existe porque a skill serve QUALQUER usuário (o autor do método e os clientes self-serve), nunca só o autor. O processo (gate, leis, passadas, anti-IA, Schwartz, compliance) é UNIVERSAL: melhora uma vez na fonte e o sync propaga pra todos. Os DADOS são por-usuário: cada um preenche o seu perfil, e o processo lê dele. Assim, melhorar o processo melhora pra todos, sem misturar os dados de ninguém.

## Por que isso existe

Um gerador de copy só é tão bom quanto a matéria-prima do usuário. Se o processo tiver os dados de UM usuário embutidos (o VoC do autor, o avatar de exemplo, o nicho de exemplo), ele só serve esse usuário, e qualquer outro recebe peça com a cara errada. A separação resolve: o processo não conhece nenhum usuário, ele LÊ o perfil do usuário da vez.

## Os 5 slots do perfil (cada usuário preenche o seu)

1. **Fonte de VoC.** Onde está a fala REAL do público do usuário (a matéria-prima da ancoragem): calls, comentários, prints de conversa, mensagens de aluno, dúvida recorrente no Direct, ou uma wiki destilada. *Exemplo, perfil de exemplo:* o acervo de fala real do usuário (ex.: uma wiki de VoC destilada, com páginas por tema). *Cliente self-serve:* o acervo dele, ou a mineração rápida do `01-entrada-verbatim.md` (protocolo sem-VoC) quando ainda não tem acervo.
2. **Plano de Posicionamento + Biblioteca de Assinatura.** O avatar, os inimigos nominais, a tese central, os bordões e cenas-assinatura. Gerado pela skill `soft-plano-posicionamento` (Blocos 1-5). Cada usuário tem o SEU. *Exemplo (outro nicho, ilustra o formato):* avatar "a dentista que atende bem e tem buraco na agenda", mecanismo nomeado "o Filtro de Caso", nicho odontologia. *Cada usuário:* o Plano dele.
3. **Banco de provas.** Os cases REAIS do usuário (nome + número + prazo, falsificáveis) e os canais de conversão (WhatsApp, link de checkout, página). É o que preenche os `[CASE: ...]` e `[LINK]` das peças. **Cada prova precisa de LASTRO** - uma fonte verificável (print, página, contrato, gravação), não só o número. O banco mora materializado no slot 3 do `soft-perfil.md` do usuário, com a lista de **números a-NÃO-regredir** ao lado, pra copy nenhuma reinventar valor (mesmo número sempre, mesmo recorte). Sem banco, ou citando número sem lastro, a peça para em `RASCUNHO-COM-PENDÊNCIA` (estrutura pronta, falta o insumo do usuário). Ninguém inventa prova por ninguém.
4. **Voz.** Como o usuário fala (termos que usa, termos que evita). *Exemplo, perfil de exemplo:* a skill de voz pessoal do autor (autor-only, que não viaja em bundle de cliente). *Cliente:* declara a voz dele, ou a skill infere do VoC e confirma.
5. **Nicho + estágio.** O nicho do usuário e o estágio de consciência/sofisticação do mercado dele (Schwartz, ver `05-premissas-mestras.md`). Decide o REGISTRO da abertura (passada 0.5 do gate). *Exemplo, perfil de exemplo:* nicho saturado E4-E5. *Cliente:* o estágio do mercado dele, que pode ser outro.

## A regra

- O processo universal SEMPRE lê o perfil do usuário da vez pra esses 5 slots. Nunca assume os valores do perfil de exemplo: eles são um exemplo de perfil preenchido, não o default.
- Slot vazio não para a skill, mas marca o limite: sem VoC, a peça sai "rascunho genérico"; sem banco de provas, sai `RASCUNHO-COM-PENDÊNCIA` (a estrutura converte, falta o insumo). Honestidade sobre o que falta, no nome do usuário.
- Usuário novo, sem perfil (cold start): a skill ROTEIA pro onboarding (gera o Plano via `soft-plano-posicionamento` e minera o VoC inicial via `01-entrada-verbatim.md`), em vez de empacar ou de assumir os dados do perfil de exemplo.
- Melhoria do processo (qualquer arquivo de `shared-references/`) entra na FONTE canônica (`_fonte/shared-references/`, na raiz do repo de skills) e o `scripts/sync-crivo.py` propaga pra todas as skills de todos os usuários. Melhora uma vez, vale pra todos. O perfil de cada um fica intacto. Editar a cópia dentro de uma skill não adianta: o próximo sync reverte.

## Onde o perfil mora (self-serve)

O usuário instala as skills no Claude Code dele, e o perfil vive no ambiente DELE. Convenção: o arquivo `soft-perfil.md` na raiz do projeto do usuário (ou onde ele apontar). Todo Passo 0 procura esse arquivo. Achou: lê os 5 slots. Não achou: roda o onboarding antes de produzir qualquer peça. Nunca cai nos dados do perfil de exemplo por falta de perfil.

## Onboarding (primeira vez, usuário sem perfil)

Quando não existe `soft-perfil.md`, a skill NÃO assume os dados do perfil de exemplo nem empaca. Conduz o usuário a montar o dele, nesta ordem:

1. **Plano + Biblioteca de Assinatura (slot 2):** roda a `soft-plano-posicionamento` (Blocos 1-5). Sai o avatar, os inimigos nominais, a tese, os bordões e cenas-assinatura. É o coração do perfil.
2. **Fonte de VoC (slot 1):** pergunta onde está a fala real do público dele (calls, comentários, prints, DMs). Sem acervo ainda, roda a mineração rápida do `01-entrada-verbatim.md` (protocolo sem-VoC: 3 baldes ama/odeia/teme, fala sticky). Aponta o caminho no perfil.
3. **Voz (slot 4):** infere do VoC como o usuário fala e confirma com ele (termos que usa, termos que evita), sem clonar o autor do método.
4. **Nicho + estágio (slot 5):** pergunta o nicho e estima o estágio de consciência e sofisticação do mercado (Schwartz).
5. **Banco de provas (slot 3):** pergunta os cases reais (nome + número + prazo + **lastro verificável**) e os canais (WhatsApp, link). Cada prova precisa de fonte, não só o número. Vazio no começo é normal: marca, e as peças saem em `RASCUNHO-COM-PENDÊNCIA` até ele preencher.
6. **Escreve o `soft-perfil.md`** com os 5 slots preenchidos ou marcados pendentes. Daí em diante, todo Passo 0 lê dele.

Onboarding parcial é válido: com o Plano e um pouco de VoC já dá pra produzir peça de topo. Cada slot que enche depois sobe a qualidade. O perfil é vivo, do mesmo jeito que a Biblioteca de Assinatura cresce com o uso.

## Template do `soft-perfil.md` (o que o onboarding escreve no projeto do usuário)

```markdown
# Perfil Soft, [nome do usuário]

## 1. Fonte de VoC
[caminho ou pasta do acervo de fala real, ou "minerado em soft-perfil-voc.md"]

## 2. Plano + Biblioteca de Assinatura
[referência ao Plano gerado pela soft-plano-posicionamento, ou colado: avatar, inimigos, tese, bordões, cenas-assinatura]

## 3. Banco de provas
- Cases reais (nome + número + prazo + LASTRO): [preencher conforme chegam - cada prova com fonte verificável (print/página/contrato/gravação); número sem lastro não entra]
- Números a NÃO usar (drift / não-lastreado): [preencher se algum número circular sem fonte, com o recorte certo do número que o substitui]
- WhatsApp / link de conversão: [preencher]

## 4. Voz
[termos que uso, termos que evito]

## 5. Nicho + estágio
[nicho] / [estágio de consciência e sofisticação do mercado]
```
