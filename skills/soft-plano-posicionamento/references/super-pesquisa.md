
# Soft Research - a Super Pesquisa do nicho (Passo 0.5)

Antes de cravar a posição, o LEON sai a campo. Esta skill conduz a **Super Pesquisa** do nicho dentro do próprio Code - e é o que **substitui e supera o "deep research do chat"**. Não devolve relatório bonito pra ler uma vez e perder: devolve um arquivo estruturado, salvo e reaproveitável, com as **palavras reais do mercado** prontas pra alimentar todas as peças.

## A fonte é o guia - leia primeiro

O passo vive no guia, não esta reference. **Na primeira invocação da sessão, leia:**
- **`guia/GUIA-APLICACAO-AUTOGUIADA.md`** - o **Passo 0.5 (A Super Pesquisa)**: o que o LEON faz, o ativo de saída (Dossiê de Nicho), por que supera o chat. **É a fonte da verdade.** Alinhe esta reference ao que está descrito lá.
- `guia/02-plano-marca-pessoal.md` (Cap 2) - pra saber o que o Plano vai consumir (Problema de 3ª Camada, território, lacuna). A `soft-plano-posicionamento` roda a própria pesquisa interna; **a Super Pesquisa a alimenta e aprofunda, não a substitui.**

Esta skill é o **processo de execução** - como conduzir a pesquisa e salvar o insumo. As definições do método estão no guia; não as duplique, consulte-as.

## A lei de escrita (todo output obedece)

O que sai daqui (a síntese e o arquivo) é regido por `guia/CODIGO-DE-ESCRITA.md` da o guia + shared-references: as **7 leis** (revele não ensine · cada frase é conclusão · deixe respirar · polarize · nomeie o fenômeno · repita a tese · ancore) e a **regra-zero** (*"que percepção estou reorganizando?"* + *"onde está o chão?"*). Aqui o chão é literal: cada achado carrega **fonte** e, quando é fala do público, **verbatim** - a frase crua, nunca paráfrase. Vocabulário de marketing ("lead", "funil", "ticket") fica de fora do arquivo: o que se cataloga é a voz do **cliente-final**, não a do vendedor.

## O que entrega

**esta pesquisa** - salvo no diretório do cliente (mesma pasta onde moram os outros ativos dele; se não houver, cria `clientes/[nome-do-cliente]/`). É o **Dossiê de Nicho**: insumo estruturado, não prosa corrida, que **alimenta** `soft-plano-posicionamento`, a skill de voz do usuário, `soft-funil-*` e `soft-conteudo-*`. Faz uma vez, usa o ano inteiro.

## As 4 frentes da pesquisa (o que tem que cobrir)

1. **Mercado e tamanho da dor.** Quão grande e quão aguda é a dor do nicho - o público sofre disso de verdade, ou é dor de vitamina? Faixas de preço que o nicho pratica, volume de busca, sinais de demanda. Classifica a dor: **forte / média / fraca**.
2. **Concorrentes.** Quem aparece quando o cliente-final procura, **o que prometem**, e **onde são genéricos** - o vazio que ninguém ocupa (é ali que o cliente vai plantar a bandeira). Não é lista de nomes: é o mapa de onde todos dizem a mesma coisa.
3. **A LINGUAGEM REAL do público.** As **palavras exatas** que o cliente-final daquele nicho usa pra descrever a **dor** e o **desejo** - a matéria-prima das headlines e da copy. Voz do mercado, não jargão. Verbatim cru das **fontes públicas do nicho**: reviews, depoimentos, comentários (YouTube, Instagram, posts), fóruns, Reddit BR, grupos, perguntas frequentes, threads de redes sociais. E/OU do material que o **próprio especialista** trouxe (call, depoimento, print de conversa de venda). (Essa é a frente que mais separa esta reference do chat.)
4. **Objeções e crenças comuns.** O que o público já acredita, o que ele desconfia, o que ele responde quando ouve a oferta ("já tentei de tudo", "isso não funciona pra mim", "é caro"). Alimenta o quebra-objeção da Carta e do script.
5. **O que o nicho já COMPRA (a fonte mais validada de todas).** A melhor pista do que o público quer não é a IA cuspindo dores: é a OFERTA que já escala no nicho exato. Humanos são previsíveis; pra saber o que eles querem, olha no que já gastam dinheiro. Onde garimpar: **ferramentas de espionagem de anúncios** (as que mostram, por nicho, os anúncios que estão rodando agora) e a **biblioteca pública de anúncios da plataforma** (quando o mesmo anunciante mantém MUITOS anúncios ativos há semanas, a oferta está escalando: é dinheiro real validando promessa, mecanismo e preço). A promessa, o mecanismo e o preço que mais aparecem escalando são os que o mercado já pagou pra provar. O **swipe file** (o teu arquivo das melhores peças que já viste) nasce daqui: guarda o que escala, copia o RACIOCÍNIO, nunca a peça. E se o especialista JÁ tem clientes, o melhor avatar sai do próprio caixa: ranqueia os clientes por **RFM** (recência, frequência, valor), sendo a **recência a variável mais forte** de quem é o melhor cliente. O padrão de quem comprou de novo há pouco é o que você quer clonar.

## Processo (rodadas encadeadas - silencioso até a síntese)

### 1. Anuncia e parte
Avisa em 1 linha que vai pesquisar o mercado (não pra entregar relatório - pra pegar as palavras reais do público e o que os concorrentes prometem). Se o especialista já deu **1-2 concorrentes** ou o **@ dele**, usa pra começar a busca mais quente. O resto a skill faz sozinha.

> **Se não houver WebSearch/WebFetch no ambiente, não para:** usa o material que o próprio cliente trouxe (etapa 3) e, faltando isso, infere do briefing e marca no arquivo o que ficou sem confirmação web.

### 2. Rodadas de web (teto ~10 queries · silencioso)
**WebSearch** em rodadas encadeadas - mapeia, aprofunda, caça a lacuna, mede a dor:
- **R1 - Mercado + concorrentes (2-3 queries):** quem ocupa o espaço, vocabulário do nicho, faixas de preço. Extrai nomes pra aprofundar.
- **R2 - Aprofundar nos tops (2-3 queries + WebFetch):** entra nas páginas/perfis-chave com **WebFetch** e lê o que está lá - o que o concorrente promete e onde todos repetem o mesmo (o genérico = a lacuna).
- **R3 - Linguagem crua do público (2-3 queries + WebFetch):** caça as fontes públicas do nicho onde o cliente-final fala solto - reviews, depoimentos, comentários, fóruns, Reddit BR, grupos, FAQs, threads de redes sociais. Pega **5-10 expressões reais** da dor e do desejo, verbatim. Prioriza `WebFetch` em 2-3 URLs ricas em vez de muitas buscas rasas. **Garimpo rápido e barato:** o autocomplete do buscador - digita "[nicho] como", "[problema] por que", "[avatar] pode" e colhe as sugestões; são as perguntas que o público de fato digita, com as palavras dele (urgências ocultas que ninguém verbaliza em review).
- **R4 - Força da dor + objeções (2 queries):** "[nicho] me arrependi", "[nicho] já tentei de tudo", "[nicho] vale a pena" → classifica a dor (forte/média/fraca) e colhe as objeções recorrentes.

### 3. Integra a voz que o próprio cliente trouxe (quando existe)
A pesquisa não assume **nenhuma** base interna pré-existente - funciona do zero pra qualquer especialista. A fonte mais quente da linguagem é a que o **próprio especialista** já tem na mão sobre o **público dele**: transcrições de call de venda ou atendimento, depoimentos crus de cliente, prints de conversa de WhatsApp, respostas de formulário, áudios transcritos. É o que vira "o que o cliente-final DISSE, com as palavras dele", não "o que a internet diz".

- **Pergunta uma vez**, sem emperrar: *"Você tem algum material onde seu público fala com as palavras dele? Transcrição de call, depoimento, print de conversa de venda? Se tiver, cola ou me aponta o arquivo - é ouro pra linguagem. Se não tiver, eu pego na web mesmo."*
- Se o especialista entrega o material (cola no chat, aponta um arquivo no diretório dele, ou já está numa pasta `material-do-cliente/`), lê e extrai **verbatim** a dor e o desejo na fala real - mesma régua da etapa 2: frase crua, nunca paráfrase.
- **Cruza** o que a web trouxe com o que o material do cliente revela e **separa o vocabulário que repete nas duas fontes** - esse é o de maior confiança. Marca no arquivo a origem de cada termo (web / material-do-cliente / ambos).

Se o especialista não tem material próprio, segue só com a web (etapa 2 cobre tudo) e registra isso no arquivo. A web, sozinha, já entrega a linguagem do nicho.

### 4. Salva o arquivo (o ativo)
Escreve **esta pesquisa** no diretório do cliente, nesta estrutura:

```
# Research do Nicho - [nicho] · [cliente]
> Super Pesquisa (Passo 0.5). Data. Fontes: web pública do nicho + material do cliente (ou só web).

## 1. Mercado e tamanho da dor
- Quão grande / quão aguda - dor classificada: forte/média/fraca (+ por quê)
- Faixas de preço do nicho · sinais de demanda · fonte de cada um

## 2. Concorrentes - o que prometem, onde são genéricos
| Concorrente | O que promete | Onde é genérico (a lacuna) | fonte |
- A lacuna em 1 frase: o vazio que ninguém ocupa = onde o cliente planta a bandeira.

## 3. Linguagem real do público (a voz do mercado)
### Dor - palavras exatas (verbatim)
- "frase crua" - fonte (web: review/fórum/comentário · ou material-do-cliente: call/depoimento)
### Desejo - palavras exatas (verbatim)
- "frase crua" - fonte
> 5-15 termos. Os que repetem em web + material-do-cliente vêm marcados [forte].

## 4. Objeções e crenças comuns
- "objeção/crença" - fonte · onde aparece

## 5. Para as peças (destilação pronta pra usar)
- 3 ganchos de linguagem-cliente pra headline (da seção 3)
- Inimigos/conselhos do mercado pra quebrar (posicionamento)
- O vão de mercado em 1 frase (posicionamento)
- Objeções-chave pra Carta e script
```

### 5. Devolve a síntese (curta)
Mostra ao especialista uma síntese de **até 8 linhas** (sem despejar o arquivo): a lacuna em 1 frase, 3-5 termos crus que o público usa, a força da dor, e a confirmação de onde salvou. Fecha apontando o próximo passo: *"Isso já vai pronto pra `soft-plano-posicionamento` aprofundar - não vai repetir a pesquisa do zero."*

## O ganho sobre o chat (deixe explícito)

No chat, a pesquisa profunda é um relatório que some quando a conversa fecha. Aqui é **estruturada** (insumo organizado, não texto corrido), **salva em arquivo** (fica no Code) e **reaproveitável** (a mesma pesquisa alimenta Posicionamento, Voz, Carta e headlines). E carrega o que o chat não tem: **as palavras reais do mercado** colhidas nas fontes públicas do nicho e cruzadas com o material que o próprio cliente já tem (call, depoimento, conversa de venda). O especialista para de adivinhar como o público fala - passa a usar o que o público já disse.

## O que esta reference nunca faz
- Nunca constrói o Plano (delega à `soft-plano-posicionamento`) nem escreve peça.
- Nunca cataloga paráfrase no lugar de verbatim - a fala do público é literal ou não entra.
- Nunca usa jargão de marketing no arquivo - só a voz do cliente-final.
- Nunca inventa concorrente, preço ou estatística sem fonte. Sem fonte, marca como inferido.
- Nunca assume base interna pré-existente - funciona do zero pra qualquer especialista de qualquer nicho.
- Nunca para por falta de web ou de material do cliente - degrada e registra a lacuna no arquivo.
