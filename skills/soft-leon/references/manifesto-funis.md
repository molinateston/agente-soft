# Manifesto de Funil, o trilho de invocação do LEON

> A certeza de invocação. O LEON não "lembra" qual skill chamar nem em que ordem: ele segue o trilho. Pra cada funil, o pipeline explícito, em ordem, com o gate de cada passo. Sem gate cumprido, o passo não libera o seguinte.

O LEON orquestra e avalia; **não escreve peça e não exporta peça**. Cada passo abaixo é uma skill ATÔMICA (1 tarefa) que produz o ativo e roda o **próprio gate embutido** (o checklist no corpo do SKILL.md: ancoragem no verbatim + 3 perguntas do Harry + CUB + anti-IA, com a linha VEREDITO) antes de devolver. O papel do LEON é conferir que o gate rodou e que o ativo está de pé (segunda barreira: os 6 filtros do Crivo do LEON), e só então liberar a próxima etapa.

> **Nota de arquitetura (atômicas):** as antigas skills largas (soft-conteudo, soft-funil, soft-vendas, soft-webinar) foram separadas em skills de UMA tarefa cada, porque no Claude Chat a skill larga não era seguida. Cada atômica tem o processo INTEIRO no corpo + o gate como checklist embutido. O trilho abaixo invoca as atômicas na ordem.

---

## FUNIL SOFT (degrau 1, o default)

Atração filtra e aquece → o lead cai no Comercial 1:1. Pipeline:

```
soft-posicionamento            (gate: Crivo do Plano de Posicionamento)
        ↓
soft-conteudo-headlines        (gate embutido: Harry + CUB + anti-IA; a headline ANTES do corpo)
        ↓
soft-conteudo-carrossel        (corpo do carrossel; OU -reels OU -stories conforme a peça)
soft-conteudo-reels            (roteiro de reel)
soft-conteudo-stories          (arco de stories)
        ↓
soft-conteudo-multiplataforma  (opcional: repurpose da peça-âncora pra LinkedIn/X/YouTube/email)
        ↓
soft-designer                  (gate: craft.py no visual/PNG)
        ↓
soft-funil-isca / -landing / -carta / -miniwebinar   (gate embutido por peça)
        ↓
soft-vendas → -script → -objecao → -copiloto → -posvenda   (gate embutido; o fechamento 1:1 é AQUI)
```

Gates, um por linha:
- **soft-posicionamento**: o Plano (NMO) passa no Crivo do Plano antes de virar a fundação. Sem Plano de pé, nada depois tem destinatário.
- **soft-conteudo-headlines**: a headline nasce do verbatim, passa o gate embutido (5 critérios + Harry + anti-IA, com VEREDITO). **Headline antes do corpo, sempre.**
- **soft-conteudo-{carrossel,reels,stories}**: o corpo parte da headline escolhida; cada um tem o gate embutido (densidade/tensão/CARO + CUB + anti-IA).
- **soft-conteudo-multiplataforma**: re-renderiza a peça-âncora preservando a tese; mantém o gate.
- **soft-designer**: o visual passa no `soft-designer/scripts/craft.py` (contraste + anti-órfã) antes de exportar PNG. O LEON só confere que rodou.
- **soft-funil-***: Isca (captura), Landing (página/VSL), Carta (mini-carta ADMA), Mini-webinar (micro-aula ADMA). A peça qualifica; não fecha a venda.
- **soft-vendas-***: o **fechamento comercial 1:1 é sempre aqui**: prospecção (abre), script (conduz), objeção (isola), copiloto (tempo real), pós-venda (indicação/onboarding). Cada um com gate embutido.

---

## FUNIL WEBINAR (degrau 2)

Igual ao FUNIL SOFT na fundação e na atração; o miolo troca a Carta pela `soft-webinar` UNIFICADA (as 6 etapas num POP só), com um aviso de maturidade na entrada (consultivo, sem porteiro).

```
aviso de maturidade   (1 linha: validar barato antes costuma render mais; dá pra seguir mesmo assim)
        ↓
soft-plano-posicionamento  → soft-conteudo-headlines → -carrossel/-reels/-stories → soft-designer   (atração, idêntica)
        ↓
soft-webinar   Etapa CONSULTIVA (entrevista de 11 blocos + pesquisa de mercado; perpétuo vs ao vivo = parâmetro)
        ↓
soft-webinar   Etapa OFERTA (stack tripartida, bônus-âncora, 15-primeiros, régua de preço por faixa)
        ↓
soft-webinar   Etapa AULA (roteiro SLIDE A SLIDE: título + objetivo + conteúdo; passe adversarial; emite o timestamp da oferta; render fino do deck = soft-designer)
        ↓
soft-webinar   Etapa PÁGINAS (cadastro/obrigado/checkout)
        ↓
soft-webinar   Etapas MENSAGENS (réguas + máquina de tags) e CHAT (consome o timestamp) → soft-vendas-*   (fechamento 1:1)

(banner pra encher a sala = soft-conteudo-headlines + soft-designer, igual qualquer criativo · a gravação do perpétuo vive DENTRO da Etapa AULA)
```

- **aviso de maturidade**: quando audiência/faturamento/produto ainda não validaram, o LEON dá o aviso consultivo de 1 linha e segue com a decisão do dono (SEM porteiro).
- **a oferta vem antes do roteiro** (dentro da soft-webinar: Etapa OFERTA antes da Etapa AULA). O gate vem embutido em cada etapa; nicho regulado (saúde/jurídico/finanças) também passa o gate-regulado do crivo.
- **fechamento**: high-ticket (3k+) fecha no Comercial 1:1 (soft-vendas-*), nunca no checkout.

> **Material privado do autor do método:** o webinar REAL dele (case proprietário, calls, frameworks proprietários) NÃO está na skill genérica `soft-webinar` (client-safe). Ele vive na skill privada do autor (rica, restrita, fonte+bot, nunca em plugin público).

---

## GESTÃO & VIDA (não é funil, o LEON carrega)

CEO, produtividade, rotina/A Conta, finanças do fundador, treino, princípios: o LEON **carrega** essas competências nas próprias references (`ceo.md`, `produtividade.md`, `rotina.md`, `dinheiro-financeiro.md`, `treino.md`, `principios-*.md`). Não são skills atômicas que ele invoca; são o repertório do Consultor Vivo e da Rotina. Quando o dilema é de empresa/vida (não de peça), o LEON consulta essas references direto.

---

## Degrau 3, FORA DE ESCOPO

O **Soft Launch / lançamento pago** (`soft-lancamento-pago`) é o degrau 3. **Parqueado: fora desta orquestração autoguiada.** Quando o caso pedir lançamento pago, é outra condução, com skill própria.

---

## A lei do trilho

Não libera a etapa seguinte sem a anterior concluída e com o gate cumprido. A ordem é a engenharia: pular um passo não acelera, desalinha tudo que vem depois. O LEON alerta o risco uma vez, respeita a decisão de quem insiste em pular, mas registra o que fica torto.
