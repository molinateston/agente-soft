# Conectores: os 5 canais onde o agente roda (tool-adaptive)

O cérebro e os gates são os MESMOS em todo canal (é o desenho ports/adapters do `motor-de-conhecimento.md`). O que muda entre conectores: **como o webhook chega, como se envia, e de onde vem o estado do lead.** Este reference mapeia os 5 conectores suportados; o dono escolhe pelo que ele JÁ usa, não pelo que é "melhor" no papel.

## Regra de escolha (em ordem)
1. **O dono já tem CRM?** GHL → conector GHL. Outro CRM → avaliar se tem API de conversa; senão, Z-API/Evolution no número + CRM só de registro.
2. **Sem CRM, WhatsApp oficial possível?** (empresa formal, opt-in coletado) → Z-API sobre a API oficial.
3. **Sem estrutura formal / precisa ligar hoje?** Evolution API (não-oficial), COM o aviso de risco dado e aceito.
4. **O canal é rede social (direct/comentário)?** Zernio.
5. **O dono já roda o agente do ecossistema (LEON)?** Modo LEON-direto: o bridge existente é o canal.

## 1. GHL / GoHighLevel (o canal padrão, manual completo nesta skill)

O conector mais documentado: `conector-ghl.md` (as chamadas reais + achados de campo) e `setup-conexao.md` (o passo a passo de ligar).
- **Webhook:** Workflow interno "Customer Replied" → Send Webhook pro endpoint do agente (rota recomendada com Private Integration Token), ou app OAuth com `InboundMessage`.
- **Envio:** API de conversations (WhatsApp/SMS/IG/FB pelo mesmo endpoint, enum exato de `type`).
- **Estados:** o MELHOR dos 5: tags, campos custom, pipeline e calendário no mesmo lugar. A fonte de verdade do lead mora aqui.
- **Riscos:** baixos; o WhatsApp por dentro do GHL é oficial (via provedor). Rate limit documentado.
- **O que não muda:** cérebro, gates, wiki, preços em arquivo.

## 2. Z-API (WhatsApp via API gerenciada)

Provedor brasileiro que expõe WhatsApp por REST simples (instância + token).
- **Webhook:** configura a URL de "ao receber mensagem" no painel da instância; payload JSON com telefone, texto, mídia.
- **Envio:** POST `send-text` (e variantes de mídia/botões) na instância.
- **Estados:** a Z-API NÃO é CRM: não há tag/pipeline nativos. O estado do lead vive num armazenamento do agente (arquivo/DB local) ou num CRM em paralelo. O onboarding define ONDE, antes de ligar.
- **Riscos:** depende do tipo de instância: sobre a API oficial (com opt-in e template) é estável; sobre instância não-oficial, valem os riscos do item 3.
- **O que muda no fluxo:** confirmação de leitura e presença ("digitando...") disponíveis; use com parcimônia, sem teatro de humano.

## 3. Evolution API (WhatsApp não-oficial, auto-hospedado)

API open-source que conecta um número comum de WhatsApp (via WhatsApp Web multi-device).
- **Webhook:** o servidor Evolution manda eventos (mensagem recebida, status) pra URL do agente.
- **Envio:** REST no servidor próprio; sem template, sem aprovação, manda o que quiser.
- **Estados:** como na Z-API, não há CRM: o agente carrega o estado.
- **⚠️ RISCO REAL DE BANIMENTO (avisar SEMPRE, o dono decide):** número conectado por via não-oficial pode ser banido pelo WhatsApp, e número banido não volta. O risco cresce com comportamento de spam: disparo em massa, mensagens iguais, contatos que não iniciaram conversa, denúncias. Mitiga (não elimina): número dedicado (nunca o pessoal do dono), aquecimento gradual, só responder quem escreveu ou deu opt-in, cadência com teto, optout imediato. **Referência externa:** o risco vem mais do comportamento do que da conexão em si ([wapisimo](https://wapisimo.dev/blog/en/whatsapp-unofficial-api-ban-risk)), mas a via não-oficial é detectável e sem recurso ([omnichat](https://blog.omnichat.ai/unofficial-whatsapp-business-api/)). Operação séria migra pra oficial quando o volume/receita justificar.
- **Regra desta skill:** o agente NUNCA liga em Evolution sem o aviso de risco dado por escrito e aceito pelo dono. E o anti-spam do gate fica no modo mais apertado.

## 4. Zernio (API social do ecossistema)

O conector de REDES (Instagram e afins) do ecossistema do produto: directs, comentários, publicação.
- **Webhook:** eventos de mensagem/comentário chegam pela API do Zernio pro endpoint do agente.
- **Envio:** respostas de direct/comentário pela mesma API.
- **Estados:** rede social não tem pipeline; o estado vive no agente (ou espelhado no CRM do dono). O cenário típico é o TOPO do topo: responder sinal ativo (comentou, respondeu story) e levar pro WhatsApp/CRM, onde o fluxo principal roda.
- **Riscos:** limites de API da plataforma social (janelas de resposta de direct); o conector respeita as janelas, o agente não força mensagem fora delas.
- **Uso combinado:** Zernio abre (sinal ativo → 1ª resposta → puxa pro WhatsApp), GHL/Z-API conduz. Dois adapters, um cérebro.

## 5. Modo LEON-direto (o bridge do agente do usuário)

Quando o dono já roda o agente do ecossistema (LEON e frota), o próprio bridge do agente é o canal: o lead fala com o número/bot que o agente já atende.
- **Webhook:** não precisa; a mensagem já chega pelo bridge do agente.
- **Envio:** pela resposta normal do agente no canal (Telegram/WhatsApp do bridge).
- **Estados:** o agente carrega (arquivos do projeto) ou espelha no CRM se houver.
- **Quando usar:** operação enxuta do próprio dono, sem CRM; piloto antes de investir em canal dedicado; atendimento interno (objetivo B) pro time.
- **Cuidados:** o bridge é multiuso (o dono também fala ali): o roteamento separa conversa de lead de conversa de dono; o killswitch e o modo sombra valem igual.

## Tabela-resumo

| Conector | Webhook | Envio | Estado do lead | Risco-chave |
|---|---|---|---|---|
| GHL | workflow/OAuth | API conversations | CRM completo (tags/pipeline) | baixo |
| Z-API | URL da instância | REST simples | agente ou CRM paralelo | depende da instância |
| Evolution | servidor próprio | REST próprio | agente | **ban de número (avisar)** |
| Zernio | API social | API social | agente/espelho | janelas da plataforma |
| LEON-direto | bridge existente | resposta do agente | arquivos do projeto | roteamento dono x lead |

## O que NUNCA muda (em qualquer conector)
- O turno canônico e o debounce (`fluxo-sdr-autonomo.md`).
- As duas camadas do gate + killswitch + silêncio + optout (`gate-de-seguranca.md`).
- Wiki consultada antes de afirmar; dinheiro só via arquivo (`motor-de-conhecimento.md`).
- Sombra → replay → autônomo antes de qualquer lead real receber mensagem.
- A auditoria dupla e o resumo diário.
