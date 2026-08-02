# Frente WAR ROOM

O painel com que o **dono conduz a apresentação ao cliente dele**. Não é um site institucional nem uma landing de venda: é a sala de guerra de uma reunião. Uma SPA leve, trancada por login, onde cada seção é um passo da conversa. O dono abre, loga na frente do cliente, e caminha da visão geral até a proposta. Toda tela segue `padrao-visual-default.md` (componentes ricos, tokens, zero gradiente/emoji/travessão).

## O que a frente entrega

Uma SPA + um backend enxuto (Express + sessão), deploy em **Cloudflare Pages** (ver `entrega-e-infra.md`). O acesso é trancado: o cliente não acha por acaso, o dono abre com login.

## Anatomia dos menus (as seções canônicas)

A nav é numerada e renderizada de array (`padrao-visual-default.md`). As seções abaixo são o esqueleto; adapta ao caso, mas a ordem serve à narrativa da reunião (do panorama à decisão):

1. **Visão geral**: o panorama do negócio do cliente em KPIs número-gigante (faturamento, unidades, o número que importa). Hero de 2 colunas: à esquerda o kicker + a frase do diagnóstico; à direita os KPIs. É a abertura, tem que impactar em 5 segundos.
2. **Diagnóstico**: os gargalos que o dono achou, cada um como **card rico** (kicker "Gargalo 0N", título, o dado que prova, chips de área/impacto). Um número por gargalo, sempre com a fonte do número. Nunca opinião solta: cada gargalo tem prova.
3. **Vídeo**: a gravação do dono explicando o diagnóstico, com **capítulos** (abaixo). O cliente pode rever depois; os capítulos deixam ele pular pro gargalo dele.
4. **Plano de ação**: as fases da solução em **acordeão numerado** ou **timeline**. Cada fase: o que se faz, o resultado esperado, o prazo. Numerada porque é sequência.
5. **Proposta**: a **escada de valor** (2 a 3 níveis de investimento), o do meio destacado. Aqui não se escreve a copy de venda (isso é `soft-proposta-comercial`); aqui se **apresenta** a proposta como seção do painel. Se o dono já tem a proposta redigida, ela entra; se não, o painel abre o espaço e o dono pede a copy à skill certa.

## Vídeo com capítulos

O player central da war room. Requisitos:
- Player HTML5 (`<video>`) com a fonte servida do próprio deploy (ou de storage do dono), nunca embed de terceiro que quebre o gate visual.
- **Lista de capítulos** à direita, renderizada de array `[{ label, start }]`. Clicar no capítulo dá `video.currentTime = start` (seek). O capítulo ativo destaca conforme o vídeo roda (`timeupdate`).
- Capítulo = um marco da narrativa (um gargalo, uma fase). O dono pula direto pro trecho que o cliente quer rever.

```js
const chapters = [
  { label: 'Panorama da rede', start: 0 },
  { label: 'Gargalo 01 · Agendamento', start: 92 },
  { label: 'Gargalo 02 · Retorno de vacina', start: 210 },
  { label: 'O plano em 4 fases', start: 348 },
];
// clique: video.currentTime = ch.start; play()
// timeupdate: marca ativo o último capítulo com start <= currentTime
```

Processar/transcodar o vídeo é **lento**, e não segura a request: sobe pro storage e, se precisa transcode/thumbnail, vai pra fila + worker (padrão em `frente-produto.md`). A war room só referencia a URL final.

## Infográficos

Quando o diagnóstico pede um gráfico (evolução, comparação, participação), gere-o com o **pipeline de imagem local do dono (imagegen / gpt-image)**, não com serviço de terceiro (ver a doutrina de infra em `entrega-e-infra.md`). O infográfico entra num **lightbox** (amplia ao clicar) e segue a paleta da marca. Gráfico simples (barra, linha) pode ser SVG inline com os tokens de cor; imagem rica (ilustração, mapa de calor estilizado) vem do imagegen.

## Backend (Express + sessão)

Enxuto de propósito: a war room é read-mostly (o cliente consome, não edita).
- **Auth por sessão**: login split (`padrao-visual-default.md`) → sessão em cookie httpOnly. Uma conta por apresentação basta; se o dono quer que o cliente acesse depois, um login por cliente.
- **Servir a SPA** + endpoints só de leitura (dados do painel, URL do vídeo). Nada sensível no client.
- **Sem banco pesado**: os dados do painel podem morar em JSON versionado no repo ou numa tabela simples. A war room não é multi-tenant como o produto; é um painel por cliente.
- Deploy Cloudflare Pages: a SPA é estática + Functions pro backend de sessão, ou um Worker. Ver `entrega-e-infra.md`.

## O que a war room NÃO é

- Não é a **copy** da proposta nem do diagnóstico escrito: o texto persuasivo é `soft-proposta-comercial` / `soft-conteudo-*`. A war room **apresenta** o conteúdo em componentes ricos.
- Não é o **produto**: a war room vende/apresenta; o produto (`frente-produto.md`) é o que o cliente usa depois de fechar. Costumam vir no mesmo pedido, mas são dois deploys.
