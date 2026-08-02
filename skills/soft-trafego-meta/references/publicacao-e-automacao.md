# reference: publicação de post + automação comment-to-DM

> Como esta skill PUBLICA um post no Instagram e LIGA a automação comentário-para-DM que entrega o lead pro fluxo de vendas. Fluxo verificado ponta a ponta, com os gotchas que economizam meio dia de debug. Dirigida no Passo 3 da SKILL.md.

## Índice
- 1. Quando este fluxo entra
- 2. Hospedagem dos assets (URL pública própria)
- 3. Publicação do carrossel (graph.instagram.com)
- 4. Automação comment-to-DM (os campos)
- 5. quick_reply vs web_url (a regra que entrega o lead)
- 6. Validar o disparo real
- 7. Gotchas (não repetir)

---

## 1. Quando este fluxo entra

Quando o pedido é **publicar um post orgânico e ligar a automação** (não subir uma campanha paga). Ex.: "publica o carrossel e ativa o comment-to-DM com a palavra QUERO". A COPY/legenda vem da soft-conteudo-*; a ARTE dos cards vem da soft-designer; aqui é só a operação de publicar e automatizar.

No **app/chat** você não publica (sem credencial): entrega a legenda + os campos da automação como checklist. No **Code/agente** você executa.

---

## 2. Hospedagem dos assets (URL pública própria)

A Meta baixa a imagem pela URL pública na hora de criar o container. A URL tem que ser de uma **hospedagem estática própria**, Cloudflare Pages servindo de um repositório de assets do negócio (`CLOUDFLARE_API_TOKEN` + `CLOUDFLARE_ACCOUNT_ID` no ambiente).

- ⚠️ **NUNCA** Litterbox / Catbox / Imgur: o scraper da Meta bloqueia (erro **9004**).
- Sobe os cards numa pasta dedicada, **valida que respondem 200** (`curl -I`) antes de publicar.
- O autor do commit precisa ser um email vinculado à conta de deploy.
- Espera o CDN propagar (~30 a 60s) antes de apontar a Meta pra URL.
- Se a Meta rejeitar o JPEG (erro **36001**): recompress via Pillow (`quality=92, optimize=True`) e adiciona `?v=$(date +%s)` na URL pra furar o cache do CDN.

---

## 3. Publicação do carrossel (graph.instagram.com)

⚠️ **Usa `graph.instagram.com`, NÃO `graph.facebook.com`.** Token do tipo Instagram Login. Sintoma de token errado: "Cannot parse access token". O token fica no ambiente (variável + segredo no banco), nunca em texto na skill.

Fluxo (carrossel):
1. Pra cada card, cria um container item: `POST /<ig_user_id>/media` com `image_url=<url pública>`, `is_carousel_item=true`. Guarda o `creation_id` de cada.
2. Espera cada container ficar `status_code=FINISHED` (poll em `GET /<container_id>?fields=status_code`).
3. Cria o container do carrossel: `POST /<ig_user_id>/media` com `media_type=CAROUSEL`, `children=[creation_id_1, ...]`, `caption=<legenda aprovada>`.
4. Publica: `POST /<ig_user_id>/media_publish` com `creation_id=<container do carrossel>`.
5. Salva o `media_id` retornado e pega o `permalink` (`GET /<media_id>?fields=permalink`).

Post de imagem única ou reel seguem o mesmo esqueleto (sem `is_carousel_item`; reel usa `media_type=REELS` com `video_url`).

**STOP antes de publicar:** publicação é ação no ar. Mostra a legenda final + confirma "publico?".

---

## 4. Automação comment-to-DM (os campos)

Liga o comentário que contém a palavra-chave ao envio de um DM (Private Reply) com botão, entregando o lead pro fluxo do vendedor. Configura na ferramenta de automação do negócio (ManyChat ou o painel de automações do CRM, as credenciais ManyChat estão no ambiente). Campos:

| Campo | O que é |
|---|---|
| `media_id` | o post recém-publicado (o do Passo 3) |
| `keywords` | a palavra-chave do CTA da legenda (ex. "QUERO", "ACESSO"). Casa exatamente com o que a legenda pede |
| `reply_public_variants` | 5 variações da resposta pública ao comentário, pra não soar bot repetindo a mesma frase |
| `dm_text` | a mensagem privada, no tom do dono, **sem link cru** (o link vai atrás do botão) |
| `dm_buttons` | 1 botão `quick_reply` com `payload` único e descritivo (ver Seção 5) |
| `delay_seconds` | `3` (responde com um respiro, não instantâneo-robô) |

A Private Reply leva o botão anexado **JUNTO** no mesmo payload da mensagem, **nunca** numa 2ª chamada (Private Reply ≠ DM padrão).

---

## 5. quick_reply vs web_url (a regra que entrega o lead)

Esta é a decisão que faz ou quebra o handover pro vendedor:

| Tipo de botão | O que faz | Entrega o lead pro fluxo? |
|---|---|---|
| **`quick_reply`** | ao clicar, manda uma mensagem (o `payload`) de volta pra conversa no DM | **SIM**, a conversa chega no DM, o webhook grava, o vendedor/SDR assume |
| `web_url` | abre um link externo no navegador | **NÃO**, sai da conversa, o vendedor não recebe nada |

**Regra dura: pra handover pro vendedor, SEMPRE `quick_reply`.** O `payload` tem que ser único e descritivo (ex. `lead_carrossel_agenda_2026-07`) pra rastrear de onde o lead veio. `web_url` só se o objetivo for genuinamente mandar pra uma página e não capturar a conversa, o que raramente é o caso no funil Soft (o lead quente tem que cair no DM pro Comercial 1:1).

**Handover:** lead clica → o `payload` chega como mensagem na conversa do Instagram → o webhook do CRM grava → o vendedor lê o DM e qualifica/vende. Não precisa configurar nada do lado do vendedor além de garantir que ele lê os DMs do IG pelo CRM. O que você garante aqui é o `payload` único e o botão certo.

---

## 6. Validar o disparo real

A automação só se prova com um comentário REAL contendo a palavra-chave, comentário fake não fecha o fluxo de forma confiável. Depois de ligar:
- Aguarda (ou pede pro dono comentar a palavra num teste) o 1º comentário real.
- Acompanha os logs/runs da automação.
- Confere que saíram **as duas coisas**: a resposta pública ao comentário E a Private Reply com o botão.
- Confirma que o clique no botão gerou a mensagem no DM (o handover funcionou).

Só marca "entregue" com esse disparo confirmado.

---

## 7. Gotchas (não repetir)

1. **Token IG ≠ Facebook**: publicação roda em `graph.instagram.com`. Sintoma: "Cannot parse access token".
2. **Litterbox / Catbox / Imgur** bloqueiam o scraper da Meta (erro 9004). Solução: hospedagem estática própria (Cloudflare Pages).
3. **Cache de CDN** serve versão antiga da imagem. Solução: `?v=$(date +%s)` na URL.
4. **JPEG rejeitado** pela Meta (erro 36001). Solução: recompress Pillow `quality=92, optimize=True`.
5. **Logo via prompt de IA nunca é pixel-perfect**: se precisar de logo oficial no card, overlay do PNG via Pillow, não confia na geração.
6. **Private Reply ≠ DM padrão**: o botão vai anexado JUNTO no payload da Private Reply, nunca em 2ª chamada.
7. **`web_url` não entrega o lead**: pra handover pro vendedor, sempre `quick_reply` com payload único.
8. **Publicar antes do CDN propagar**: a Meta baixa a imagem na hora; se a URL ainda não respondeu 200, o container falha. Valida com `curl -I` antes.
