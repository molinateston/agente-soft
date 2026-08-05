---
name: soft-vendas-proposta
description: "Transforma uma call de venda gravada numa PROPOSTA COMERCIAL premium: um site HTML estático single-file (abas, diagnóstico, entregáveis com checkbox persistente, cronograma/Gantt, investimento, prova social, CTA), publicado num link único e privado por cliente. Pipeline em 4 etapas (transcrição → extração das informações-chave → geração do HTML no Layout Soft → publicação no Cloudflare Pages). Marca-neutra: cor, fontes, logo e prova social vêm do DONO. Use quando o dono fechar/conduzir uma call e precisar ENTREGAR a proposta em formato premium, pedir 'monta a proposta', 'proposta comercial', 'proposta de venda em HTML', 'site de proposta', 'orçamento premium', 'plano pro cliente', ou quiser fugir do PDF engessado com um link próprio. NÃO use para página de vendas PÚBLICA / landing / VSL (soft-funil-landing), nem para o script/objeção/fechamento da venda em si (soft-vendas-closer), nem para contrato (soft-vendas-contratos)."
---

**Papel:** skill operacional de pós-call do método Soft. Entra DEPOIS que a venda foi conduzida (o script, a objeção e o fechamento são da `soft-vendas-closer`) e DEPOIS que a oferta existe (a oferta, a PUV e a prova vêm da `soft-plano-posicionamento`). Pega a call gravada e devolve a proposta materializada num site premium com link próprio e privado por cliente — o "vendedor silencioso" que o prospect reabre quando vai decidir. **É marca-neutra como a `soft-designer`**: não embute a cara de ninguém; cor accent, fontes, logo e prova social são do DONO (puxados da Fundação dele). Método completo e autossuficiente: `references/reference.md` (LER antes de executar).

## 📦 O QUE ESTA SKILL PRODUZ

Uma proposta comercial premium, entregue como **site HTML estático single-file** (zero build, CSS+JS inline, funciona offline), com link **único e privado** por cliente:

- **Diagnóstico extraído da call** — 12 campos-chave (nicho, produtos/ticket, dor central, objetivo de 12 meses, o que o cliente pediu × o que foi sugerido, preço, reação, próximos passos…), validado com o dono ANTES do HTML. Regra de ouro: **nunca atribuir fala/número do dono ao cliente**; separar o que o cliente quer do que foi só sugerido (upsell); tangibilizar tudo; precificar o valor de mercado de qualquer app/SaaS no escopo.
- **Layout Soft** — template premium em 2 gerações (Dark Premium / Light Corporate), dirigido por variáveis de CSS (cada cliente escolhe a própria paleta/ID), com ~15 componentes prontos: hero com métricas-âncora, diagnóstico two-column, pilares, **entregáveis com checkbox persistente + barra de progresso**, cronograma/Gantt, investimento two-column, prova social, CTA + FAQ.
- **Estrutura de conteúdo** — abas obrigatórias (Visão Geral → personalizadas → Entregáveis → Plano de Ação → Investimento) + variações da última aba por tipo de proposta.
- **Apresentação da oferta** — 2 a 3 opções (nunca uma só), validade de 7 dias, ancoragem por custo evitado/ROI. Os VALORES são do dono (`soft-plano-posicionamento`); a skill formata, não define preço.
- **Publicação** — Cloudflare Pages (o mesmo fluxo de deploy que o dono já usa), com slug privado não-adivinhável, SSL e teste mobile.
- **Checklist de qualidade + erros históricos** — guardrails de conteúdo, visual, técnico e entrega.

**Filtros obrigatórios:** toda a copy passa pela `soft-anti-ia` (PT-BR com acentuação completa, **zero travessões** — sinal de IA mal calibrada); o visual segue a ID do dono na `soft-designer`; a prova social usa só números REAIS e verificáveis do dono (nunca inventar, nunca usar número de terceiro).

**Serve o agente:** equipa o LEON/cliente a fechar high-ticket com uma proposta que parece feita à mão, sem designer humano. A condução da venda é da `soft-vendas-closer`; aqui é só a materialização da proposta.

## COMO RODAR (resumo)

1. **Onboarding (1ª vez):** confirmar o token de publicação do dono (Cloudflare Pages) e a ID visual dele (puxar da `soft-designer`/`soft-plano-posicionamento`). Guardar na config do dono — nunca hardcodar.
2. **Pipeline (4 etapas)** — seguir `references/reference.md`: transcrever a call → extrair os 12 campos e validar com o dono → gerar o HTML no Layout Soft com a ID/oferta do dono → publicar no link privado.
3. **Antes de entregar:** rodar o checklist de qualidade (seção 9) e o filtro `soft-anti-ia`.

> Regra-mãe: a proposta só é boa se a EXTRAÇÃO for boa. A maior parte do tempo é entender a call, não montar o HTML.
