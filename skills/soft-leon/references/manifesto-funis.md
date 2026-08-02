# Manifesto de Funil, o trilho de invocação do LEON

> A certeza de invocação. O LEON não "lembra" qual skill chamar nem em que ordem: ele segue o trilho. Pra cada funil, o pipeline explícito, em ordem, com o gate de cada passo. Sem gate cumprido, o passo não libera o seguinte.

O LEON orquestra e avalia; **não escreve peça e não exporta peça**. Cada passo abaixo é uma skill ATÔMICA (1 tarefa) que produz o ativo e roda o **próprio gate embutido** (o checklist no corpo do SKILL.md: ancoragem no verbatim + 3 perguntas do gate + CUB + anti-IA, com a linha VEREDITO) antes de devolver. O papel do LEON é conferir que o gate rodou e que o ativo está de pé (segunda barreira: os 6 filtros do Crivo do LEON), e só então liberar a próxima etapa.

> **Nota de arquitetura (atômicas):** as antigas skills largas (soft-conteudo, soft-funil, soft-vendas, soft-webinar-plano) foram separadas em skills de UMA tarefa cada, porque no Claude Chat a skill larga não era seguida. A frente de vendas virou DUAS: `soft-vendas-sdr` (abre/qualifica/agenda) e `soft-vendas-closer` (conduz/fecha). Cada atômica tem o processo INTEIRO no corpo + o gate como checklist embutido. O trilho abaixo é a ORDEM de APONTAR as atômicas: cada passo roda numa **CONVERSA NOVA** dedicada (o LEON aponta e manda o especialista abrir a conversa da skill, NÃO executa a skill na conversa dele), e o ativo volta pra ESTA conversa pro Crivo. Ver o **Handoff** no `soft-leon`.

> **As 10 categorias (o mapa do dono):** (1) LEON · (2) Plano de Negócio (`soft-plano-negocio`) · (3) Plano de Posicionamento (`soft-plano-posicionamento`) · (4) Plano de Ofertas (`soft-plano-ofertas`, mentoria é um tipo aqui) · (5) Financeiro e Contratos (`soft-financeiro` + `soft-contratos-consultoria`) · (6) Conteúdo (`soft-conteudo-*` + `soft-designer` + `soft-editor-video` + `soft-trafego-meta` + `soft-apostila`) · (7) **Funil Soft** (`soft-funil-*`) · (8) **Soft Webinário** (`soft-webinar-*`) · (9) **Soft Launch** (`soft-launch`) · (10) Soft Vendas (`soft-vendas-estrategias` + `soft-vendas-sdr` + `soft-vendas-closer` + `soft-proposta-comercial`). Os **3 funis completos** são o 7, o 8 e o 9. `soft-treino-dieta` é vertical opcional, fora do núcleo.

---

## FUNDAÇÃO (antes de qualquer funil)

Os 3 funis nascem de uma fundação. Antes de atração/funil, o LEON garante que estas peças estão de pé (cada uma na conversa nova da sua skill, com Crivo):

```
soft-plano-negocio            (onde está por número + a meta + A Conta + projeção 3 cenários + roadmap 90 dias)
        ↓
soft-plano-posicionamento     (a marca: avatar, mecanismo nomeado, narrativa, voz, PUV embrionária)
        ↓
soft-plano-ofertas            (a Oferta como stack; mentoria/consultoria/curso/comunidade/serviço/entrada = os 6 tipos)
```

- **soft-plano-negocio**: consolida diagnóstico + Conta + projeção + roadmap do que o negócio JÁ produz; nada inventado, furo vira `[A CONFIRMAR]`. É a bússola de "quanto e por onde".
- **soft-plano-posicionamento**: a alma/marca (o quem-eu-sou-pro-mercado), o Plano NMO que passa no Crivo do Plano. Sem ele, nada depois tem destinatário.
- **soft-plano-ofertas**: a Oferta que o cliente vai VENDER, desenhada como stack (PUV → equação → entregáveis → entregável-tese → prateleira → Mapa → garantia → preço 10x → ancoragem). Mentoria é UM dos 6 tipos (operacional em `soft-plano-ofertas/references/mentoria-operacional.md`); a estratégia de COMO/QUANDO lançar é da `soft-vendas-estrategias`.

---

## FUNIL SOFT (degrau 1, o default)

Atração filtra e aquece → o lead cai no Comercial 1:1. Pipeline:

```
soft-plano-posicionamento            (gate: Crivo do Plano de Posicionamento)
        ↓
soft-conteudo-planner           (a pauta ANTES da headline: matriz do mês / radar de tendências)
        ↓
soft-conteudo-headlines        (gate embutido: 3 perguntas + CUB + anti-IA; a headline ANTES do corpo)
        ↓
soft-conteudo-carrossel        (corpo do carrossel; OU -reels OU -stories conforme a peça)
soft-conteudo-reels            (roteiro de reel)
soft-conteudo-stories          (arco de stories)
        ↓
soft-conteudo-multiplataforma  (opcional: repurpose da peça-âncora pra LinkedIn/X/YouTube/email + comentário fixado)
        ↓
soft-designer                  (gate: craft.py no visual/PNG; inclui a capa/thumbnail de vídeo)
        ↓
soft-conteudo-impulsionar      (opcional: avalia a peça antes de publicar + decide o impulsionar/verba)
        ↓
soft-funil-isca / -landing / -carta / -miniwebinar   (gate embutido por peça)
        ↓
soft-vendas-sdr → soft-vendas-closer   (gate embutido; o SDR abre/qualifica/agenda, o closer conduz/objeção/copiloto/fecha/pós-venda; o fechamento 1:1 é AQUI)
```

Gates, um por linha:
- **soft-plano-posicionamento**: o Plano (NMO) passa no Crivo do Plano antes de virar a fundação. Sem Plano de pé, nada depois tem destinatário.
- **soft-conteudo-planner**: decide QUAIS temas atacar antes de escrever (matriz do mês em lote / radar de tendências datado); cada célula vira input pra headline. É o passo de pauta, não produz a peça.
- **soft-conteudo-headlines**: a headline nasce do verbatim, passa o gate embutido (5 critérios + 3 perguntas + anti-IA, com VEREDITO). **Headline antes do corpo, sempre.**
- **soft-conteudo-{carrossel,reels,stories}**: o corpo parte da headline escolhida; cada um tem o gate embutido (densidade/tensão/CARO + CUB + anti-IA).
- **soft-conteudo-multiplataforma**: re-renderiza a peça-âncora preservando a tese (LinkedIn/X/YouTube/email) e escreve o comentário fixado da peça; mantém o gate.
- **soft-designer**: o visual passa no `soft-designer/scripts/craft.py` (contraste + anti-órfã) antes de exportar PNG, incluindo a capa/thumbnail de vídeo. O LEON só confere que rodou.
- **soft-conteudo-impulsionar**: avalia/pontua a peça antes de publicar (Modo Avaliar) e decide o impulsionar (o que turbinar, verba, público); só entra com peças que já provaram engajamento real.
- **soft-funil-***: Isca (captura), Landing (página/VSL), Carta (mini-carta APSD), Mini-webinar (micro-aula APSD). A peça qualifica; não fecha a venda.
- **soft-vendas-sdr / soft-vendas-closer**: o **Comercial 1:1 é sempre aqui**, em duas frentes. `soft-vendas-sdr` = a metade de cima: prospecção (abre), qualificação (BANT), agenda a sessão como vaga escassa, follow-up, autônomo no CRM/GHL; só entra com equipe e volume. `soft-vendas-closer` = a metade de baixo: script (conduz as 7 fases), objeção (isola), copiloto (tempo real), fechamento, coleta de sinal/Pix, pós-venda (indicação/onboarding). Cada um com gate embutido. **Canal padrão do 1:1 = DM/WhatsApp** (fecha no chat com áudio/doc/vídeo); call é exceção de contexto, o SDR+Closer separado só com equipe e volume.

---

## SOFT WEBINÁRIO (degrau 2)

Igual ao FUNIL SOFT na fundação e na atração; o miolo troca a Carta pelo webinário (as 6 atômicas de webinar: plano, script, slides, páginas, mensagens, chat), com um gate de maturidade na entrada.

```
gate de maturidade   (audiência + faturamento + produto + habilidade aguentam o degrau 2? se não, fica no FUNIL SOFT)
        ↓
soft-plano-posicionamento  → soft-conteudo-planner → -headlines → -carrossel/-reels/-stories → soft-designer   (atração, idêntica)
        ↓
soft-webinar-plano      (desenha a oferta ANTES da aula; o resto do webinar nasce dela)
        ↓
soft-webinar-script      (a AULA: roteiro + slides numa coisa só, APSD + motor de 3 viradas + objeções aniquiladas + perpétuo vs ao vivo; o visual fino do deck = soft-designer)
        ↓
soft-webinar-slides      (o deck da aula, quando o especialista quer os slides como peça separada)
        ↓
soft-webinar-paginas     (cadastro/obrigado/checkout)
        ↓
soft-webinar-mensagens   (e-mails + WhatsApp pré/pós)
        ↓
soft-webinar-mensagens  (tags/CRM + chat simulado) → soft-vendas-*   (fechamento 1:1)

(banner pra encher a sala = soft-conteudo-headlines + soft-designer, igual qualquer criativo · a gravação do perpétuo vive DENTRO da aula soft-webinar-script)
```

- **gate de maturidade**: o LEON só sobe pro degrau 2 quando audiência, faturamento, produto e habilidade pedem. Não cabe? Fica no degrau 1.
- **a oferta vem antes do roteiro** (soft-webinar-plano antes de soft-webinar-script). Cada atômica de webinar tem o gate embutido; nicho regulado (saúde/jurídico/finanças) também passa o gate-regulado do crivo.
- **fechamento (o canal é do FUNIL)**: o **Funil de Aula Agendada fecha DE UMA VEZ no checkout, na própria aula** (one-step), para o produto que cabe no checkout; a oferta cara acima (>~3k) NÃO é o produto da aula, é degrau de esteira fechado no Comercial 1:1 (soft-vendas-*) como ascensão DEPOIS.

> **Material privado do autor do método:** o webinar REAL dele (case proprietário, calls, frameworks proprietários) NÃO está nas atômicas genéricas de webinar (são client-safe). Ele vive na `soft-webinar-plano` (rica, privada, restrita ao autor, fonte+bot, nunca em plugin público).

---

## GESTÃO & VIDA (não é funil, o LEON carrega)

CEO, produtividade, rotina/A Conta, finanças do fundador, treino, princípios: o LEON **carrega** essas competências nas próprias references (`ceo.md`, `produtividade.md`, `rotina.md`, `dinheiro-financeiro.md`, `treino.md`, `principios-*.md`). Não são skills atômicas que ele invoca; são o repertório do Consultor Vivo e da Rotina. Quando o dilema é de empresa/vida (não de peça), o LEON consulta essas references direto.

---

## Degrau 3, FUNIL DE LANÇAMENTO

O **Soft Launch** (`soft-launch`) é o degrau 3, o funil de lançamento completo: evento com sequência, carrinho que abre e fecha, escassez honesta, tráfego e Comercial 1:1. O tipo de entrada é parâmetro (pago com ingresso OU gratuito com aula/CPL OU híbrido); a engenharia é a mesma. É **injeção pontual sobre o sistema, máximo 1-2 lançamentos/ano**, e só entra depois dos degraus 1 e 2 de pé (audiência, caixa e repertório de venda). O LEON roda o Modo A (diagnóstico de viabilidade) primeiro, sempre, e segura o lançamento se falta base. A condução fina mora na skill `soft-launch`.

---

## A lei do trilho

Não libera a etapa seguinte sem a anterior concluída e com o gate cumprido. A ordem é a engenharia: pular um passo não acelera, desalinha tudo que vem depois. O LEON alerta o risco uma vez, respeita a decisão de quem insiste em pular, mas registra o que fica torto.
