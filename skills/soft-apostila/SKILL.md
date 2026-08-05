---
name: soft-apostila
description: "Transforma uma aula/live gravada (Zoom, YouTube, MP4) em MATERIAL navegável — uma apostila/handout. Pipeline Whisper + Claude: extrai áudio → transcreve → limpa muletas → segmenta em capítulos → enriquece cada um (vira texto corrido, não transcrição crua). Output adapta ao ambiente: no chat entrega o material em Markdown; no Code renderiza a apostila HTML single-file (sidebar com índice, navegação por teclado, scroll-spy, mobile) e publica. Marca-neutra: tema/cor/ID vêm do dono. Use quando o dono quiser virar conteúdo gravado em material — bônus de webinar, isca/lead magnet, micro-aula do funil, módulo de mentoria, material de comunidade, ou repurpose de uma masterclass/imersão. NÃO use para roteiro/ideia de conteúdo de feed (soft-conteudo), página de captura/venda (soft-funil-landing), proposta comercial (soft-vendas-proposta), nem edição de vídeo (soft-editor-video)."
---

**Papel:** skill operacional de **materialização de conteúdo**. Pega algo que o dono já gravou (aula, live, webinar, call) e devolve um material indexável — sem plataforma de EAD travada, versionável, com link próprio. Suporte de ENTREGA e de ISCA; não está no pipeline de copy dos funis. **É marca-neutra como a `soft-designer`**: não embute a cara de ninguém — tema, cor e identidade vêm do dono (puxe da `soft-designer`). Método completo e autossuficiente: `references/reference.md` (LER antes de executar).

## 📦 O QUE ESTA SKILL PRODUZ

Uma **apostila** (material navegável) a partir de uma gravação, via pipeline Whisper + Claude:

- **Áudio → transcrição** (ffmpeg → Whisper, `--language pt`).
- **Limpeza** das muletas de fala (pré-pass sed + prompt Claude que preserva a voz e os exemplos do dono — não resume, não inventa).
- **Segmentação em capítulos** (8–15) com índice.
- **Enriquecimento** de cada capítulo: vira texto corrido com intro e fechamento, mantendo as falas e exemplos reais do dono.
- **Material final** — com **índice clicável, navegação por teclado, scroll-spy, capítulo de Resumo** e variações (player de áudio sincronizado, embed do YouTube, quiz por capítulo, export PDF).

**Output — adapta ao ambiente (regra do Léo):**
- **No chat (Claude.ai):** entrega o material em **Markdown** limpo (capítulos enriquecidos, formato mapa-mental). Simples.
- **No Claude Code:** **renderiza** a apostila HTML single-file (sidebar + nav por teclado + tema escuro/responsivo) e **publica** no Cloudflare Pages (padrão Soft), com a ID visual do dono.
- Regra: `chat → MD · code → site`. Mesmo conteúdo, destino diferente.

**Onde se aplica no método Soft:**
- **Isca / lead magnet** (`soft-funil-isca`) — uma masterclass gravada vira a isca navegável no lugar do PDF travado.
- **Bônus do webinar/oferta** (`soft-webinar`) — material complementar gerado da própria gravação do webinar.
- **Micro-aula do funil** (`soft-funil`) — o micro-treinamento entregue como apostila.
- **Entrega da mentoria/produto** — cada call/aula vira material indexado pra comunidade (menos churn).

**Invioláveis:** mantém a VOZ e os exemplos reais do dono (nunca inventa conteúdo); a copy do material passa pelo filtro `soft-anti-ia` (PT-BR completo, sem travessão); o visual segue a ID do dono na `soft-designer`.

**Serve o agente:** equipa o LEON/cliente a transformar acervo gravado em entregável (isca, bônus, material de mentoria) sem editor nem plataforma de EAD.
