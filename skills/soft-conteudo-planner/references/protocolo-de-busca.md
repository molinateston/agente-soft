# Protocolo de Busca, a varredura do radar por dentro

> Profundidade da varredura ao vivo do **MODO RADAR** da soft-conteudo-planner. O corpo do SKILL.md já é executável; esta reference existe pra quando você precisa da mecânica fina: quais fontes, quais buscas datadas, como verificar data sem atalho, o que fazer quando o feed logado não abre, e a régua de saliência item a item. Dirigida no **Passo 1 (RADAR)** e no **Passo 2 (RADAR)** do SKILL.md.

## Índice
- [1. Princípios da varredura (o que nunca muda)](#1-principios-da-varredura-o-que-nunca-muda)
- [2. A ordem de preferência das ferramentas](#2-a-ordem-de-preferencia-das-ferramentas)
- [3. Buscas datadas (a base, sempre roda)](#3-buscas-datadas-a-base-sempre-roda)
- [4. Varredura de feed social (quando a navegação abre)](#4-varredura-de-feed-social-quando-a-navegacao-abre)
- [5. Verificação de data (sem atalho)](#5-verificacao-de-data-sem-atalho)
- [6. Régua de saliência (o filtro de calor)](#6-regua-de-saliencia-o-filtro-de-calor)
- [7. Agrupamento em temas](#7-agrupamento-em-temas)
- [8. Fallback quando o feed não abre](#8-fallback-quando-o-feed-nao-abre)
- [9. O que enche as colunas da tabela](#9-o-que-enche-as-colunas-da-tabela)
- [10. Erros comuns da varredura](#10-erros-comuns-da-varredura)

---

## 1. Princípios da varredura (o que nunca muda)

Três regras mandam em tudo abaixo. Elas vêm antes de qualquer fonte ou query:

1. **Data verificada, corte duro.** Cada item que entra no radar tem uma data de publicação que você LEU na página, dentro da janela (default 7 dias). Item com data faltando, confusa ou fora da janela é descartado sem exceção, mesmo que o engajamento esteja altíssimo. Pauta que já esfriou não é pauta viva.
2. **Zero invenção.** Você nunca cria um link, uma data, uma métrica ou uma tendência. Só entra o que você abriu e verificou. Se um número aparece mas você não confirmou a fonte, ele vira `[A CONFIRMAR]` na coluna, nunca é dado como fato. Radar inventado é pior que radar pequeno: quebra a confiança do dono na semana seguinte quando ele publica algo que não existia.
3. **Honestidade de tooling.** Se uma fonte não abre (o feed logado do X, um perfil privado do Instagram), você NÃO finge que varreu. Registra o que ficou de fora e trabalha com o que deu. O dono precisa saber que o radar de hoje viu o Reddit e as buscas mas não o X, por exemplo, pra calibrar quanto confiar.

Essas três regras são o que separa o radar de um "clipping genérico de IA". Sem elas, a skill vira invenção plausível, que é exatamente o que o método proíbe.

---

## 2. A ordem de preferência das ferramentas

A varredura ao vivo depende do ambiente. Use a melhor via disponível, nesta ordem:

1. **WebSearch + WebFetch** (base, quase sempre disponível no Claude Code e no agente). WebSearch roda as buscas datadas; WebFetch abre cada resultado promissor pra você ler a data no corpo e o conteúdo real. É o núcleo confiável da varredura e nunca depende de login.
2. **Chrome MCP / navegador com IA** (quando disponível): serve pra rolar feed social que não aparece bem em busca (Reddit home, r/popular, timeline do X, grade de um perfil do Instagram). Mais rico pra "o que está pegando no feed", mais frágil (login, bloqueio de scraper).
3. **Só o que o dono colou** (fallback do app/chat sem navegação): quando não há como pesquisar ao vivo, você CONDUZ. Pede ao dono colar o que ele já viu quente essa semana (prints, links de posts de concorrente, manchetes que ele notou) e ORGANIZA isso na tabela-radar, aplicando o filtro de saliência e escrevendo o ângulo Soft. Você não inventa varredura; você estrutura o que ele trouxe.

Escolha o melhor caminho disponível e siga. Na dúvida entre dois, WebSearch datado é sempre o chão firme.

---

## 3. Buscas datadas (a base, sempre roda)

Cinco eixos capturam pauta quente sem virar clipping de notícia geral. Para cada eixo, uma busca filtrada pela janela. Troque `[nicho]` pelo nicho real e específico do dono, no idioma e jargão do público (PT-BR quando o público é BR):

| Eixo | Query (adapte ao nicho) | O que procura |
|---|---|---|
| **Novidade/lançamento** | `[nicho] novidade` / `[nicho] lançamento` / `[nicho] novo` | produto, ferramenta, feature, estudo recém-saído que mexe com o nicho |
| **Polêmica/debate** | `[nicho] polêmica` / `[nicho] debate` / `[nicho] discussão` | assunto que dividiu o nicho, os dois lados, briga pública |
| **Dado/pesquisa** | `[nicho] pesquisa` / `[nicho] estudo` / `[nicho] dados` | número novo, levantamento, descoberta que muda a conversa |
| **Mudança/regra** | `[nicho] regra nova` / `[nicho] mudança` / `[nicho] regulação` | mudança de plataforma, lei, norma, algoritmo que afeta o avatar |
| **Viral/em alta** | `[nicho] viralizou` / `[nicho] bombando` / `[nicho] em alta` | formato/gancho/tema que está pegando fogo no feed agora |

**Como rodar:**
1. Roda a busca de cada eixo, uma a uma. No WebSearch, prefira restringir por tempo quando a ferramenta permite (última semana). Quando não permite, você filtra pela data lida no corpo (Seção 5 desta reference, Verificação de data).
2. Abre os primeiros resultados promissores de cada eixo com WebFetch.
3. Lê a data de publicação no corpo da página. Fora da janela = descarta na hora.
4. Guarda o link real (o que você abriu), a data, e uma frase do que a página diz.

Não precisa esgotar os 5 eixos se um nicho não tem material em algum (um nicho de nicho pode não ter "regulação" na semana). Roda os que fazem sentido; melhor 3 eixos bem varridos que 5 preenchidos com ruído.

---

## 4. Varredura de feed social (quando a navegação abre)

O feed pega o que a busca não pega: o formato que está viralizando, o gancho que os concorrentes estão repetindo, a discussão que ainda não virou artigo. Quando você tem Chrome MCP / navegador:

**Reddit (o mais aberto, funciona sem login):**
1. Navega até a home (`https://www.reddit.com/`) e rola, carregando mais posts.
2. Abre os posts relevantes ao nicho. Em cada um, confere o carimbo "postado há X" (dias/horas).
3. Descarta o que passa da janela.
4. Repete em `r/popular` e nos subreddits específicos do nicho que aparecerem enquanto rola.

**X/Twitter (frágil, exige login pra timeline personalizada):**
1. Se o feed "Para Você" (`https://x.com/home`) abre, rola várias telas.
2. Abre as threads inteiras dos tweets relevantes ao nicho.
3. Confere a data em cada thread; descarta o que passa da janela, mesmo com engajamento alto.
4. Se o feed logado NÃO abre (o ponto frágil), vai pro fallback (Seção 8) e registra que o X ficou de fora.

**Instagram (perfis de concorrente):**
1. Se dá pra ver a grade pública de perfis do nicho, olha os últimos posts dentro da janela.
2. Nota o formato e o gancho que estão pegando (não copia a copy: nota o ÂNGULO que está quente).
3. Perfil privado ou que não abre = registra que ficou de fora, não força.

O feed é bônus de riqueza, não obrigação. Se só as buscas datadas rodaram, o radar ainda é válido; você só anota que a varredura de feed não aconteceu.

---

## 5. Verificação de data (sem atalho)

É a etapa que a IA mais tende a pular, e é a que sustenta o radar inteiro. Pra CADA item candidato:

1. **Abre a página** (WebFetch ou o navegador). Não confia no snippet da busca: o snippet mente sobre data com frequência.
2. **Localiza a data visível** no corpo: carimbo do post, linha "publicado em", meta-data do artigo, "há X dias" do feed.
3. **Confirma que está dentro da janela** (hoje menos N dias). Formato de referência: DD/MM/AAAA.
4. **Se a data está faltando, confusa ou fora da janela: descarta.** Não deduz "parece recente" pelo visual da página nem pela URL. Sem data verificável, o item não existe pro radar.

Caso especial: um artigo antigo que voltou a circular essa semana (reviveu numa discussão nova). O ITEM antigo não entra pela data dele; mas a DISCUSSÃO nova em torno dele (os posts desta semana) entra, com a data dos posts. O tema é "o debate reacendeu", datado pelos posts de agora.

---

## 6. Régua de saliência (o filtro de calor)

Depois de juntar os itens datados, separa calor de ruído. Um tema só entra no radar com **2 ou mais** destes sinais:

| Sinal | Como reconhecer | Exemplo |
|---|---|---|
| **Volume/atenção forte** | muita gente falando, engajamento acima do normal do nicho, aparece em várias fontes | 4 perfis diferentes postaram sobre o mesmo estudo em 3 dias |
| **Debate/discordância clara** | o nicho está dividido, dá pra ver os dois lados defendidos | metade dos comentários a favor, metade contra a nova recomendação |
| **Informação nova/virada** | dado inédito, lançamento, mudança de regra que altera como o avatar trabalha | plataforma anunciou fim de um recurso que o avatar usa |
| **Implicação real pro avatar** | mexe com a vida/o bolso/o trabalho de quem o dono atende | a mudança encarece o custo do serviço que o cliente do dono contrata |

**Regras da régua:**
- **1 sinal só = ruído**, não entra. "Está viralizando" sozinho (volume sem debate, sem novidade, sem implicação) é hype vazio, atrai curioso, não pauta que rende peça.
- O sinal mais valioso pro Soft é **implicação real pro avatar**: um tema com volume médio mas que mexe direto no bolso do cliente do dono vale mais que um viral genérico. Quando em dúvida entre dois temas, fica com o que toca o avatar.
- Anota QUAIS sinais o tema tem (vai virar a coluna "Sinais de calor" da tabela). Isso força a honestidade: se você não consegue nomear 2 sinais concretos, o tema não passa.

---

## 7. Agrupamento em temas

Itens soltos não são pauta; TEMAS são. Depois de datar e filtrar:

1. **Agrupa itens relacionados.** Um estudo novo + 3 threads discutindo ele + um artigo de portal cobrindo = UM tema ("o debate sobre X reacendeu"), não 5 linhas.
2. **Um tema pode cruzar fontes:** discussão social (Reddit/X) + cobertura de portal + post de concorrente, tudo no mesmo tema. A coluna "Onde está pegando" lista as plataformas; a "Fontes/comunidades" lista as origens.
3. **Nomeia o tema pelo que está em jogo**, não pelo item: "recomendação nova sobre carboidrato divide corredores", não "artigo do site X".
4. **Mira 10-20 temas.** Menos é aceitável e honesto se o material real for limitado. Nunca quebra um tema em vários pra inflar a contagem, nem funde temas distintos pra parecer mais organizado.

---

## 8. Fallback quando o feed não abre

O X logado e o Instagram privado são os pontos que mais falham. Quando um deles (ou a navegação inteira) não está disponível:

1. **Cai no WebSearch datado + WebFetch.** As buscas dos 5 eixos capturam a maior parte da pauta quente sem depender de feed logado. Reddit costuma abrir sem login e cobre a discussão social.
2. **Registra o que ficou de fora.** Na nota abaixo da tabela: "varredura via buscas datadas + Reddit; X e Instagram não abriram nesta rodada." O dono calibra a confiança sabendo o que o radar viu.
3. **No app/chat sem navegação nenhuma:** conduz. Pede ao dono colar o que ele viu quente (prints, links, manchetes) e monta o radar do que ele trouxe, aplicando saliência e ângulo. Deixa claro que a varredura ampla roda no Code/agente.
4. **Nunca simula.** Um feed que você não abriu não vira linha no radar. A tentação de "provavelmente estava pegando no X também" é exatamente o que a Lei 5 proíbe.

---

## 9. O que enche as colunas da tabela

Mapa de cada coluna do Output Contract, pra não deixar campo vago:

| Coluna | O que vai nela | Cuidado |
|---|---|---|
| **Tema quente** | o assunto nomeado pelo que está em jogo | não o título do artigo; o tema |
| **Onde está pegando** | plataformas onde apareceu (Reddit, X, portais, Instagram) | só onde você de fato viu |
| **Fontes/comunidades** | subreddits, perfis, portais, contas que puxaram | reais, não "vários perfis" |
| **Links representativos** | 1-2 links que você abriu e verificou | nunca link deduzido; se não abriu, não põe |
| **Sinais de calor** | quais dos 4 sinais o tema tem (mín. 2) | nomeia os sinais, não "está bombando" |
| **O que está sendo dito/debatido** | resumo de 1 linha da discussão real | o que as fontes dizem, não o que você acha |
| **Por que importa pro [NICHO]** | a implicação concreta pro avatar do dono | conecta ao cliente, não ao nicho abstrato |
| **Ângulo Soft pra postar** | a manchete-ângulo enquadrada pela tese do dono | o coração; roda no gate anti-IA + cliente-primeiro (ver SKILL.md Passo 3 RADAR) |

Nada fora da tabela além da primeira linha datada e das 3 pautas quentes apontadas embaixo.

---

## 10. Erros comuns da varredura

| Erro | Correção |
|---|---|
| Confiou na data do snippet da busca | Abre a página e lê a data no corpo; o snippet mente |
| Incluiu artigo antigo que "voltou a circular" pela data dele | O item antigo não entra; a discussão NOVA em torno dele entra, datada pelos posts de agora |
| Tema com volume alto mas sem outro sinal entrou | 1 sinal é ruído; hype sem debate/novidade/implicação não vira pauta |
| Quebrou um tema em 5 linhas pra bater 20 | Agrupa itens relacionados num tema; contagem inflada é ruído |
| Fundiu dois temas distintos pra "organizar" | Temas distintos ficam distintos; fundir esconde pauta |
| Simulou o X porque "provavelmente estava pegando lá" | Só o que você abriu entra; o que não abriu vira nota de "ficou de fora" |
| Ângulo virou opinião sobre a notícia | O ângulo enquadra pela tese do dono e aponta pro método; ver SKILL.md Passo 3 RADAR |
| Radar sem a nota do que ficou de fora | Sempre registra o que a varredura viu e o que não viu; é a honestidade de tooling |
