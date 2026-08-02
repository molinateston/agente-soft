# Método de Criação de Propostas Comerciais

> Documento operacional autossuficiente para reproduzir o padrão de propostas comerciais premium do método Soft.
> Versão: 1.0. Atualizado em abril de 2026.
> Idioma: português brasileiro com acentuação completa, sem travessões.

---

## Índice

- [1. VISÃO GERAL](#1-visão-geral)
- [2. STACK NECESSÁRIA](#2-stack-necessária)
- [3. PIPELINE](#3-pipeline)
- [4. LAYOUT SOFT (TEMPLATE PREMIUM)](#4-layout-soft-template-premium)
- [5. ESTRUTURA DE CONTEÚDO](#5-estrutura-de-conteúdo)
- [6. REGRAS DE PRECIFICAÇÃO](#6-regras-de-precificação)
- [7. REGRAS INVIOLÁVEIS](#7-regras-invioláveis)
- [8. EXEMPLO ILUSTRATIVO (fictício)](#8-exemplo-ilustrativo-fictício)
- [9. CHECKLIST DE QUALIDADE](#9-checklist-de-qualidade)
- [10. CREDENCIAIS / CONFIG (do dono)](#10-credenciais-config-do-dono)
- [ANEXO A. FLUXO RESUMIDO EM 1 PÁGINA](#anexo-a-fluxo-resumido-em-1-página)
- [ANEXO B. ERROS HISTÓRICOS QUE NÃO PODEM REPETIR](#anexo-b-erros-históricos-que-não-podem-repetir)
- [ANEXO C. PROVA / CREDIBILIDADE (por dono)](#anexo-c-prova-credibilidade-por-dono)
- [ANEXO D. INSIGHTS ESTRATÉGICOS](#anexo-d-insights-estratégicos)

---


## 1. VISÃO GERAL

### O que é uma proposta no nosso padrão

Uma proposta comercial no padrão do dono não é PDF nem slide. É um SITE DEDICADO em HTML estático, publicado num link próprio e privado por cliente.

Cada cliente recebe um endereço próprio no formato `https://nomedocliente.<dominio-do-dono>`. Ao abrir o link, o prospect vê uma experiência interativa, premium, com layout escuro ou claro, animações sutis, abas de navegação, gráficos, simuladores, checkboxes persistentes e tudo o que foi discutido na call de venda materializado em conteúdo.

A proposta é um vendedor silencioso. Funciona 24 horas por dia. Substitui a apresentação cara a cara. Permite que o cliente abra no celular, no tablet, no notebook, mostre para sócios, leia com calma e decida com clareza. Cada parágrafo é estratégico. Cada métrica é credibilidade. Cada CTA é convite à decisão.

### Quando criar

A proposta é gerada após uma call de vendas conclusiva, geralmente em três cenários principais.

| Cenário | Quem fecha | Tipo de proposta |
|---------|------------|------------------|
| Mentoria individual | o dono ou closer | Mentoria 6 meses |
| Consultoria estratégica | o dono ou closer | Consultoria entregue pelo time |
| Implementação de IA / SaaS | o dono | Projeto técnico |
| Mentoria + Consultoria combinada | o dono | Dois pacotes na mesma proposta |
| Sócio ou parceria de equity | o dono | Documento estratégico interno |
| Plano de ação para mentorado já ativo | o dono | Plano sem investimento |
| Briefing pré-call | Uso interno | Pesquisa estratégica |

### Tempo médio de produção

Com o método rodando bem, o ciclo completo (transcrição até link entregue) leva de 1 a 3 horas. A maior parte do tempo é a etapa 2 (geração do HTML personalizado). O resto da pipeline (publicar o link) é mecânico e leva poucos minutos.

### Output final

Site no ar em `https://nomedocliente.<dominio-do-dono>` com:
- URL única e memorável.
- Layout premium dark ou light.
- Conteúdo 100% personalizado com nome, números e dores reais do cliente.
- Tabs interativas, checkboxes persistentes, progress bar, gráfico Gantt.
- Toggle dark/light (quando aplicável).
- Responsivo no mobile.

---

## 2. STACK NECESSÁRIA

Tudo single-file e estático, sem framework. O deploy usa o mesmo fluxo de publicação que o dono já tem (Cloudflare Pages no padrão Soft) — nada de Vercel nem dashboard externo.

| Camada | Ferramenta | Uso |
|--------|------------|-----|
| Frontend | HTML5 + CSS inline + JS inline | Single-file, zero build |
| Hospedagem | Cloudflare Pages (mesmo fluxo dos sites do dono) | Link privado por proposta |
| Fontes | Google Fonts | Tipografia premium (default Cormorant + DM Sans; o dono pode trocar pela ID dele — ver `soft-designer`) |
| Persistência | localStorage do navegador | Checkboxes do cliente, tema escolhido |

### Pré-requisitos
- Transcrição da call (Whisper/OpenAI ou ferramenta de reunião).
- Token de publicação do dono (Cloudflare Pages) — coletado no onboarding, guardado na config do dono, **nunca hardcoded** (ver seção 10).
- `git`, `curl` e o CLI de publicação que o dono usa (ex.: `wrangler`) disponíveis.

### Marca-neutra
Esta skill NÃO embute a marca de ninguém. Cor accent, fontes, logo e prova social vêm do DONO (puxe da `soft-plano-posicionamento` e da `soft-designer`). A skill formata; o conteúdo e a identidade são do dono.

## 3. PIPELINE

### ETAPA 1. TRANSCRIÇÃO DA REUNIÃO/CALL

Toda proposta começa pela call de vendas gravada. Sem call, sem proposta. Sem transcrição, sem proposta.

#### Como obter a transcrição

1. A call é gravada (Google Meet, Zoom, ou qualquer ferramenta de reunião).
2. O arquivo de áudio ou vídeo é baixado.
3. A transcrição é feita por uma das ferramentas abaixo (em ordem de preferência):
   - Whisper (OpenAI) localmente ou via API.
   - Tactiq, Fathom ou Otter (transcrição automática durante a call).
   - Modal de transcrição interna do Premium.
4. A transcrição bruta é salva como input para a etapa 2.

#### O que validar antes de avançar

- A transcrição cobriu a call inteira (sem cortes no início ou fim).
- Os falantes estão identificados (o dono, cliente, closer).
- Não há trechos com áudio inaudível bloqueando o entendimento.

Se a transcrição vier confusa, é melhor pedir refinamento manual antes de seguir. Proposta gerada em cima de transcrição ruim sai com erros graves de atribuição.

---

### ETAPA 2. EXTRAÇÃO DE INFORMAÇÕES-CHAVE

Esta é a etapa mais importante de todas. A diferença entre uma proposta excelente e uma proposta medíocre está na qualidade da extração feita aqui.

#### O que extrair da transcrição

Ler do começo ao fim, palavra por palavra, e identificar:

1. **Nome do cliente e da empresa.** Confirmar grafia exata.
2. **Nicho ou segmento.** O cliente atua em qual mercado, com qual público.
3. **Produtos e serviços atuais.** O que ele já vende, ticket médio, volumes.
4. **Faturamento atual ou potencial.** Números mencionados na call.
5. **Time atual e estrutura.** Quantas pessoas, quem faz o quê.
6. **Dor central.** O que o cliente disse que precisa resolver.
7. **Objetivo de 12 meses.** Onde ele quer estar no fim do contrato.
8. **Sugestões dadas pelo dono.** O que foi proposto como solução.
9. **Preço oferecido.** Mentoria, consultoria ou os dois, com valores.
10. **Reação do cliente.** Interessado, com objeção, fechou na hora, pediu prazo.
11. **Próximos passos.** Combinados ao final da call.
12. **Personalizações específicas.** Cor preferida, paleta da marca, tom de comunicação.

#### Regras críticas de atribuição

NUNCA atribuir falas do dono ao cliente. Esse erro já aconteceu antes. Se o dono disse "eu faturei 96k em fevereiro", isso é do dono, não do cliente. A proposta com atribuição errada quebra confiança imediatamente.

SEPARAR o que o cliente quer DE FATO do que foi sugerido como possibilidade. São coisas diferentes. A proposta precisa refletir essa distinção. Se o cliente disse que quer um app de oráculos e o dono sugeriu também uma comunidade paga, a proposta apresenta o app como entrega central e a comunidade como upsell sugerido.

TANGIBILIZAR tudo o que foi discutido. Se a call mencionou app, a proposta detalha o app (telas, funcionalidades, valor de mercado). Se mencionou agente de IA, a proposta detalha o agente (papel, ferramentas, integrações). Se mencionou evento presencial, a proposta detalha o evento (local sugerido, formato, ticket).

PRECIFICAR valor de mercado sempre que o escopo incluir software, app ou SaaS. Adicionar uma seção mostrando quanto custaria contratar uma empresa de desenvolvimento separadamente para fazer o mesmo. Isso justifica o investimento de mentoria/consultoria pela ótica do "se fosse contratar separado custaria X".

#### Formato do diagnóstico de extração

Antes de partir para o HTML, montar um documento curto neste formato e validar com o dono:

```
NOME DO CLIENTE | Nicho

Quem é: descrição em uma frase

Situação atual:
| Item | Status |
|------|--------|
| Produto 1 | Descrição + ticket |
| Produto 2 | Descrição + ticket |

Dor principal: o que o cliente disse com as palavras dele.

O que quer: lista do que ele pediu.

O que foi sugerido: lista do que o dono propôs.

Preços: Mentoria R$X / Consultoria R$Y

Reação: interessado, com objeção, fechou, pediu prazo.

Personalização: cor da marca, tom desejado, observações.
```

Esse documento é a fundação. A partir dele a proposta inteira é montada.

---

### ETAPA 3. GERAÇÃO DO HTML PERSONALIZADO

Aqui o template Layout Soft entra em ação. É um arquivo HTML único, autocontido, com CSS inline e JavaScript inline. Sem build, sem dependências externas além das fontes do Google Fonts.

#### Estrutura do arquivo

O `index.html` segue exatamente esta ordem:

```
<!DOCTYPE html>
<html lang="pt-br" data-theme="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Proposta NOME DO CLIENTE | o dono</title>

  Fontes Google: Cormorant Garamond + DM Sans
  CSS Variables (paleta dark + override light)
  Estilos globais
  Componentes (header, tabs, cards, callouts, ladder, gantt)
  Animações
  Responsivo
</head>
<body>
  Header (badge, título, subtítulo, métricas)
  Sticky navbar (aparece ao scroll)
  Tabs container
    Tab 1: Visão Geral
    Tab 2 a N: Personalizadas
    Tab final: Investimento (ou Parceria)
  Toggle dark/light (canto inferior esquerdo)
  Back to top (canto inferior direito)
  Footer
  JavaScript inline:
    Tab switching
    Header scroll
    Back to top
    Checkboxes persistentes (localStorage)
    Toggle tema (localStorage)
</body>
</html>
```

#### Sections obrigatórias

Toda proposta tem 8 sections principais. Algumas viram tabs separadas, outras se combinam.

1. **Hero (header).** Nome do cliente em destaque, badge identificador, subtítulo com posicionamento, métricas-âncora (3 a 5 números). Ocupa 100vh ou similar. Gradient navy ou cor da marca.

2. **Diagnóstico.** Two-column. Esquerda: o que funciona hoje (border-left verde). Direita: o que precisa mudar (border-left vermelho). Bullets com bolinhas coloridas. Mostra que a proposta entende o negócio.

3. **Proposta de solução.** 3 a 5 pilares. Cada pilar é um card com ícone, título, descrição e tag colorida.

4. **Entregáveis.** Lista detalhada com checkboxes interativos. O cliente marca conforme lê e a marcação persiste no localStorage. Progress bar no topo conta o percentual marcado.

5. **Cronograma.** Fases mensais com gráfico Gantt. Cada fase tem número circular, título, lista de entregas, período. Fases podem ser colapsáveis com chevron.

6. **Investimento.** Two-column. Card de mentoria à esquerda, card de consultoria à direita. Preços em destaque, lista de inclusos, badge "MAIS COMPLETO" no plano premium. Validade da proposta (7 dias). Forma de pagamento.

7. **Prova social.** Cards com números reais do DONO (puxe da `soft-plano-posicionamento`/banco de provas — nunca invente). Equipe que entrega, se houver. Casos de sucesso quando aplicável.

8. **CTA final + FAQ.** Convite à decisão (próximos passos, contato direto). FAQ com 4 a 6 perguntas frequentes (formato accordion ou simples).

#### Design geral

- Paleta dark: bg `#0a0a0a` ou `#080b14`, cards `#0d1117` ou `#131a27`, dourado/âmbar `#c49a4c` ou cor da marca, off-white `#e2e8f0`.
- Paleta light alternativa: bg `#ffffff`, cards `#f1f3f8`, navy `#1a3a6b` como primária, texto `#0f1d3a`.
- Tipografia: Cormorant Garamond para títulos e números grandes, DM Sans para corpo (17px, line-height 1.7).
- Animações sutis: fade-in entrance via IntersectionObserver, transições 0.3s ease.
- Layout responsivo: max-width 1200 a 1280px, padding lateral 24px, mobile 1 coluna.
- Hero ocupa 100vh com nome do cliente em destaque.
- Sections com max-width 1280px e padding generoso.

#### Personalização por nicho

A cor accent secundária muda conforme o nicho:
- Espiritualidade: roxo (#7c3aed) ou tons místicos.
- Arte: dourado dominante (#c49a4c).
- Saúde: verde (#16a34a) ou teal.
- Tech/SaaS: azul (#2563eb) ou cyan.
- Vinícola/luxo: tons vinho (#722F37) com gold.
- Marketing político: navy + cores institucionais.
- Imobiliário: teal + gold em dark mode.

O gradient do header também muda. Espiritualidade tem gradient roxo, arte tem gradient gold, tech tem gradient azul.

#### Salvar o arquivo

```bash
mkdir -p /tmp/proposta-NOMECLIENTE
# Salvar o HTML gerado em /tmp/proposta-NOMECLIENTE/index.html
```

---

### ETAPA 4. PUBLICAR A PROPOSTA (link privado)

A proposta é um único `index.html`. Publicar no **Cloudflare Pages**, o mesmo fluxo de deploy que o dono já usa nos sites dele (token na config do dono — ver seção 10). Sem Vercel, sem dashboard externo.

Cada proposta é **PRIVADA**: o projeto recebe um nome único com um **sufixo aleatório** no slug, pra o link não ser adivinhável. Quem tem o link abre; quem não tem, não acha.

#### Passos

1. Salvar o HTML em `propostas/<cliente>/index.html`.
2. Publicar com nome de projeto único:
   ```bash
   # Cloudflare Pages (exemplo com wrangler) — token do dono no ambiente, nunca no código
   npx wrangler pages deploy propostas/<cliente> \
     --project-name "prop-<cliente>-<sufixo-aleatorio>" \
     --commit-dirty=true
   ```
   O `<sufixo-aleatorio>` (ex.: 6 chars) é o que torna o link privado.
3. *(Opcional)* Se o dono quiser um endereço bonito, mapear `<cliente>.<dominio-do-dono>` no Cloudflare do dono. Sem isso, o `*.pages.dev` já sobe com SSL.
4. **Validar:** abrir o link, conferir o cadeado (SSL), testar no celular, e checar que abas, checkboxes persistentes e toggle de tema funcionam.

> Deploy é a parte mecânica. Se o dono já tem um fluxo de publicação próprio, use o dele — o que importa é o resultado: **link único + privado + SSL + mobile ok**. Se quiser acompanhar pipeline/conversão, registre no CRM ou Notion do dono; não existe dashboard hardcoded nesta skill.

#### Entregar o link

Sempre com `https://`. Mensagem de envio (adaptar ao tom da relação, e passar pelo `soft-anti-ia`):

```
Olá NOME, sua proposta tá pronta.

Acesse: <link>

Vale por 7 dias. Qualquer dúvida me chama por aqui.
```

---

## 4. LAYOUT SOFT (TEMPLATE PREMIUM)

O Layout Soft é o template padrão desta skill: um único HTML premium, autocontido, com duas gerações (Dark Premium e Light Corporate).

Existem duas gerações do template em uso. A escolha depende do nicho do cliente.

### Geração 1: Dark Premium

Usado em propostas de luxo, arte, tech, espiritualidade, ou qualquer nicho que pede sofisticação visual.

```css
/* Variáveis CSS - Dark Premium */
:root {
  --bg: #080b14;
  --bg2: #0d1117;
  --bg3: #131a27;
  --bg4: #1a2235;
  --gold: #c49a4c;
  --gold2: #d4aa5c;
  --accent: #0891b2;
  --accent2: #06b6d4;
  --text: #e2e8f0;
  --text2: #94a3b8;
  --text3: #64748b;
  --border: #1e293b;
}

[data-theme="light"] {
  --bg: #ffffff;
  --bg2: #f8fafc;
  --bg3: #f1f5f9;
  --text: #0f172a;
  --text2: #475569;
  --border: #e2e8f0;
}
```

Características:
- Fundo escuro principal `#080b14`.
- Toggle dark/light no canto inferior esquerdo.
- Glassmorphism nos cards (backdrop-filter blur).
- Gold (`#c49a4c`) como accent de destaque.
- Cor secundária variável por nicho (cyan, teal, vinho).

### Geração 2: Light Corporate

Usado em propostas B2B, médicas, corporativas, ou para clientes mais conservadores. Eric (agência supermercados) e Cris (FuturiHealth) são exemplos.

```css
/* Variáveis CSS - Light Corporate */
:root {
  --navy: #1a3a6b;
  --navy-light: #244d8a;
  --bg: #ffffff;
  --bg-card: #f1f3f8;
  --bg-hover: #e8ebf2;
  --text: #0f1d3a;
  --text-sec: #4a5578;
  --text-muted: #8891a8;
  --border: #dfe3ed;
  --green: #16a34a;
  --blue: #2563eb;
  --purple: #7c3aed;
  --orange: #ea580c;
  --gold: #b8860b;
  --teal: #0d9488;
  --red: #dc2626;
  --cyan: #0891b2;
}
```

Características:
- Fundo branco principal.
- Sem toggle dark/light (fica light fixo).
- Sem glassmorphism, mais limpo.
- Navy (`#1a3a6b`) como cor primária.
- Sistema de 8+ cores para tags e callouts.

### Tipografia (ambas as gerações)

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;500;600;700&family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
  body {
    font-family: 'DM Sans', sans-serif;
    font-size: 17px;
    line-height: 1.7;
  }

  h1, h2, h3, .price, .stat-number {
    font-family: 'Cormorant Garamond', serif;
    font-weight: 700;
  }

  /* Responsivo via clamp */
  h1 {
    font-size: clamp(36px, 6vw, 56px);
  }
  h2 {
    font-size: clamp(28px, 4vw, 42px);
  }
  .price {
    font-size: clamp(36px, 6vw, 52px);
  }
</style>
```

### Componentes obrigatórios

Toda proposta no Layout Soft contém os 15 componentes abaixo. Cada um tem padrão visual fechado.

#### 1. Header com Badge e Métricas

```css
.header {
  background: linear-gradient(135deg, #0f1d3a, #1a3a6b, #244d8a);
  padding: 80px 24px 60px;
  text-align: center;
  position: relative;
}
.badge {
  display: inline-block;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2px;
  background: rgba(255,255,255,0.1);
  padding: 6px 14px;
  border-radius: 6px;
  margin-bottom: 20px;
}
.metrics {
  display: flex;
  gap: 40px;
  justify-content: center;
  margin-top: 30px;
}
.metric-number {
  font-family: 'Cormorant Garamond';
  font-size: 36px;
  font-weight: 700;
}
```

#### 2. Sistema de Tabs

```css
.tab-btn {
  padding: 10px 20px;
  border-radius: 8px 8px 0 0;
  background: transparent;
  border: none;
  cursor: pointer;
}
.tab-btn.active {
  background: white;
  color: var(--navy);
}
.sticky-nav {
  position: fixed;
  top: 0;
  z-index: 1000;
  width: 100%;
  background: white;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  display: none;
}
.sticky-nav.visible {
  display: flex;
}
```

JavaScript:
```javascript
const tabs = document.querySelectorAll('.tab-btn');
tabs.forEach(tab => {
  tab.addEventListener('click', () => {
    tabs.forEach(t => t.classList.remove('active'));
    tab.classList.add('active');
    const target = document.querySelector(tab.dataset.tab);
    document.querySelectorAll('.tab-content').forEach(c => c.style.display = 'none');
    target.style.display = 'block';
    target.style.animation = 'fadeUp 0.4s ease';
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
});
```

#### 3. Cards Padrão

```css
.card {
  background: var(--bg-card);
  border: 1px solid var(--border);
  border-radius: 14px;
  padding: 20px;
  transition: all 0.3s ease;
}
.card:hover {
  transform: translateY(-2px);
  background: var(--bg-hover);
}
```

#### 4. Card Grids (3 variantes)

```css
.card-grid-2 {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 20px;
}
.card-grid-3 {
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
}
.card-grid-4 {
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
}
```

#### 5. Callout Boxes (6 cores)

```css
.callout {
  padding: 16px 20px;
  border-radius: 14px;
  display: flex;
  gap: 12px;
  align-items: flex-start;
}
.callout-green { background: rgba(22,163,74,0.08); border-left: 3px solid #16a34a; }
.callout-blue { background: rgba(37,99,235,0.08); border-left: 3px solid #2563eb; }
.callout-orange { background: rgba(234,88,12,0.08); border-left: 3px solid #ea580c; }
.callout-purple { background: rgba(124,58,237,0.08); border-left: 3px solid #7c3aed; }
.callout-teal { background: rgba(13,148,136,0.08); border-left: 3px solid #0d9488; }
.callout-red { background: rgba(220,38,38,0.08); border-left: 3px solid #dc2626; }
```

#### 6. Tags Coloridas (8 cores)

```css
.tag {
  display: inline-block;
  font-size: 11px;
  text-transform: uppercase;
  font-weight: 700;
  padding: 3px 10px;
  border-radius: 6px;
}
.tag-navy { background: rgba(26,58,107,0.08); color: #1a3a6b; }
.tag-green { background: rgba(22,163,74,0.08); color: #16a34a; }
.tag-blue { background: rgba(37,99,235,0.08); color: #2563eb; }
.tag-purple { background: rgba(124,58,237,0.08); color: #7c3aed; }
.tag-orange { background: rgba(234,88,12,0.08); color: #ea580c; }
.tag-gold { background: rgba(184,134,11,0.08); color: #b8860b; }
.tag-teal { background: rgba(13,148,136,0.08); color: #0d9488; }
.tag-red { background: rgba(220,38,38,0.08); color: #dc2626; }
```

#### 7. Escada de Valor (Ladder)

```css
.ladder {
  display: flex;
  flex-direction: column;
  gap: 0;
}
.ladder-step {
  display: flex;
  align-items: stretch;
  border: 1px solid var(--border);
  border-radius: 12px;
  margin-bottom: 8px;
  overflow: hidden;
}
.ladder-num {
  width: 56px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(26,58,107,0.1);
  font-family: 'Cormorant Garamond';
  font-size: 24px;
  font-weight: 700;
}
.ladder-info {
  flex: 1;
  padding: 16px 20px;
}
.ladder-step.gold {
  background: linear-gradient(135deg, #0f1d3a, #1a3a6b);
  color: white;
}
```

#### 8. Offer Boxes (Investimento)

```css
.offer-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 24px;
  margin: 40px 0;
}
.offer {
  background: linear-gradient(135deg, #0f1d3a, #1a3a6b);
  color: white;
  padding: 40px 32px;
  border-radius: 16px;
  position: relative;
}
.offer.featured {
  border: 2px solid var(--gold);
  box-shadow: 0 0 40px rgba(196,154,76,0.3);
}
.offer .price {
  font-family: 'Cormorant Garamond';
  font-size: clamp(36px, 6vw, 52px);
  margin: 16px 0;
}
.offer .badge-featured {
  position: absolute;
  top: -12px;
  right: 20px;
  background: var(--gold);
  color: #0f1d3a;
  font-size: 10px;
  font-weight: 700;
  padding: 4px 10px;
  border-radius: 4px;
}

@media (max-width: 700px) {
  .offer-grid { grid-template-columns: 1fr; }
}
```

#### 9. Diagnóstico Two-Column

```css
.diagnostic-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 24px;
}
.diagnostic-card {
  padding: 24px;
  border-radius: 12px;
  background: var(--bg-card);
}
.diagnostic-card.works { border-left: 3px solid #16a34a; }
.diagnostic-card.change { border-left: 3px solid #dc2626; }
.diagnostic-bullet {
  display: flex;
  gap: 12px;
  align-items: flex-start;
  margin: 12px 0;
}
.diagnostic-bullet::before {
  content: '';
  display: block;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  margin-top: 8px;
  flex-shrink: 0;
}
.works .diagnostic-bullet::before { background: #16a34a; }
.change .diagnostic-bullet::before { background: #dc2626; }
```

#### 10. Fases (Timeline)

```css
.phase {
  position: relative;
  padding: 24px;
  padding-left: 80px;
  background: var(--bg-card);
  border-radius: 12px;
  margin-bottom: 16px;
}
.phase-num {
  position: absolute;
  left: 20px;
  top: 24px;
  width: 36px;
  height: 36px;
  border-radius: 50%;
  background: var(--navy);
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: 'Cormorant Garamond';
  font-size: 18px;
  font-weight: 700;
}
.phase-period {
  color: var(--text-muted);
  font-size: 13px;
  margin-top: 8px;
}
.phase-toggle {
  cursor: pointer;
  position: absolute;
  right: 20px;
  top: 24px;
}
```

#### 11. Progress Bar

```css
.progress-container {
  background: var(--bg-card);
  border: 1px solid var(--border);
  border-radius: 6px;
  height: 12px;
  overflow: hidden;
  margin: 16px 0;
}
.progress-fill {
  height: 100%;
  background: linear-gradient(90deg, var(--navy), var(--navy-light));
  width: 0%;
  transition: width 0.6s ease;
}
.progress-text {
  font-size: 13px;
  color: var(--text-sec);
}
```

JavaScript:
```javascript
function updateProgress() {
  const checkboxes = document.querySelectorAll('.entrega-check');
  const checked = Array.from(checkboxes).filter(c => c.checked).length;
  const total = checkboxes.length;
  const pct = total > 0 ? Math.round((checked / total) * 100) : 0;
  document.querySelector('.progress-fill').style.width = pct + '%';
  document.querySelector('.progress-text').textContent =
    `${checked} de ${total} tarefas (${pct}%)`;
}

document.querySelectorAll('.entrega-check').forEach(cb => {
  cb.addEventListener('change', () => {
    localStorage.setItem(`prop-NOMECLIENTE-${cb.id}`, cb.checked);
    updateProgress();
  });
  // Restaurar estado salvo
  const saved = localStorage.getItem(`prop-NOMECLIENTE-${cb.id}`);
  if (saved === 'true') cb.checked = true;
});
updateProgress();
```

#### 12. Gantt Chart

```css
.gantt {
  overflow-x: auto;
  margin: 24px 0;
}
.gantt-table {
  min-width: 600px;
  width: 100%;
  border-collapse: collapse;
}
.gantt-bar {
  height: 24px;
  border-radius: 5px;
  font-size: 11px;
  color: white;
  display: flex;
  align-items: center;
  padding: 0 10px;
  position: relative;
}
.gantt-bar.fase-1 { background: linear-gradient(90deg, #1a3a6b, #244d8a); }
.gantt-bar.fase-2 { background: linear-gradient(90deg, #0d9488, #14b8a6); }
.gantt-bar.fase-3 { background: linear-gradient(90deg, #c49a4c, #d4aa5c); }
```

#### 13. Checkboxes Persistentes

```html
<label class="check-row">
  <input type="checkbox" class="entrega-check" id="entrega-1">
  <span>Configuração da arquitetura de IA</span>
</label>
```

```css
.entrega-check {
  accent-color: var(--navy);
  width: 18px;
  height: 18px;
  margin-right: 12px;
}
```

#### 14. Stat Cards

```css
.stat-card {
  text-align: center;
  padding: 20px;
}
.stat-number {
  font-family: 'Cormorant Garamond';
  font-size: 28px;
  font-weight: 700;
  color: var(--navy);
}
.stat-label {
  font-size: 13px;
  color: var(--text-sec);
}
```

#### 15. Back to Top

```css
.back-to-top {
  position: fixed;
  bottom: 24px;
  right: 24px;
  width: 44px;
  height: 44px;
  border-radius: 50%;
  background: var(--navy);
  color: white;
  display: none;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  z-index: 999;
  border: none;
}
.back-to-top.visible {
  display: flex;
}
```

JavaScript:
```javascript
window.addEventListener('scroll', () => {
  const btn = document.querySelector('.back-to-top');
  if (window.scrollY > 400) {
    btn.classList.add('visible');
  } else {
    btn.classList.remove('visible');
  }
});

document.querySelector('.back-to-top').addEventListener('click', () => {
  window.scrollTo({ top: 0, behavior: 'smooth' });
});
```

### Animações

```css
@keyframes fadeUp {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

.animate-on-scroll {
  opacity: 0;
  transform: translateY(20px);
  transition: all 0.6s ease;
}
.animate-on-scroll.visible {
  opacity: 1;
  transform: translateY(0);
}
```

JavaScript com IntersectionObserver:
```javascript
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
    }
  });
}, { threshold: 0.1 });

document.querySelectorAll('.animate-on-scroll').forEach(el => {
  observer.observe(el);
});
```

### Responsividade

```css
@media (max-width: 1024px) {
  .container { padding: 0 20px; }
}

@media (max-width: 768px) {
  .header { padding: 60px 20px 40px; }
  .metrics { gap: 20px; flex-wrap: wrap; }
  .diagnostic-grid,
  .offer-grid,
  .card-grid-2,
  .card-grid-3,
  .card-grid-4 {
    grid-template-columns: 1fr;
  }
}

@media (max-width: 480px) {
  body { font-size: 15px; }
  h1 { font-size: 32px; }
  .price { font-size: 36px; }
}
```

---

## 5. ESTRUTURA DE CONTEÚDO

A proposta padrão tem 6 a 9 tabs, dependendo da complexidade. A média é 6 tabs. A primeira é sempre Visão Geral e a última é sempre Investimento ou Parceria.

### Tab 1. Visão Geral (obrigatória, sempre primeira)

Conteúdo:
- Quem é o cliente (descrição da empresa, contexto, números atuais).
- Diagnóstico two-column (o que funciona, o que precisa mudar).
- Solução proposta em 3 a 5 pilares.
- Callout com a tese central da proposta.

### Tabs intermediárias (personalizadas por cliente)

A quantidade e o nome variam. Exemplos reais:
- Ecossistema (escada de valor + esteira de produtos).
- Automação com IA (agentes propostos, papéis, integrações).
- Concorrência (análise comparativa).
- Frentes de Receita (modelos de monetização).
- Calculadora Interativa (simulador de ROI).
- Esteira de Produtos (escada de produtos).
- Rota de Vendas (funis, cartas, criativos).
- Estudos de Caso (proof points).
- Pesquisa de Mercado (validação externa).

### Tab Entregáveis (obrigatória)

Conteúdo:
- Lista detalhada com checkboxes interativos.
- Progress bar no topo.
- Agrupamento por categoria (estratégia, IA, vendas, suporte, infra).
- Cada item com descrição clara do que será entregue.

### Tab Plano de Ação (obrigatória)

Conteúdo:
- Fases mensais ou bimestrais (média de 7 a 9 fases).
- Cada fase é colapsável (chevron expand/collapse).
- Gráfico Gantt no final mostrando todas as fases em paralelo.
- Período de cada fase (datas reais ou semanas).

### Tab Investimento (obrigatória, sempre última, exceto variações)

Conteúdo:
- Stats no topo (duração, encontros, produtos entregues).
- Two-column com mentoria à esquerda e consultoria à direita.
- Card mentoria: preço, lista de inclusos.
- Card consultoria: preço, lista de inclusos, badge MAIS COMPLETO.
- Seção "Quem Entrega" com cards do time (o dono, o agente, o agente, dev quando aplicável).
- Projeção de ROI explícita.
- Validade da proposta (7 dias).
- Referências de credibilidade do dono.
- Próximos passos (CTA).

### Variações da última tab

| Cenário | Nome da última tab |
|---------|--------------------|
| Proposta padrão com preço | Investimento |
| Sem preço definido (parceria pendente) | Parceria |
| Plano de mentorado (já comprou) | Sem tab de investimento |
| Briefing pré-call (interno) | Sem tab de investimento |
| Projeto de sócio (equity) | Sem tab de investimento |

---

## 6. REGRAS DE PRECIFICAÇÃO

A precificação segue uma matriz por perfil de cliente. Os valores são referência. Sempre validar com o dono antes de gerar.

### Matriz de preços (exemplo de estrutura)

> Faixas só de referência pra mostrar a LÓGICA (perfil do cliente → ticket). O dono define os próprios números conforme a oferta dele (`soft-plano-posicionamento`). NÃO trate estes valores como tabela oficial do método Soft.

| Perfil do cliente | Mentoria (6 meses) | Consultoria (entrega completa) |
|-------------------|--------------------|--------------------------------|
| Solo / iniciante (faturamento até 50k/mês) | R$20.000 | R$50.000 |
| Estabelecido (faturamento 50k a 200k/mês) | R$30.000 | R$60.000 |
| Premium (alta exigência, ticket alto) | R$60.000 | R$70.000 a R$95.000 |
| Enterprise (faturamento 1M+/mês) | Sob consulta | R$95.000 a R$250.000 |

### Variações comuns de empacotamento

Formatos que a proposta pode apresentar (os VALORES são do dono — puxe a oferta e a PUV da `soft-plano-posicionamento`; esta skill formata a apresentação, não define preço):

- À vista (com desconto) vs parcelado em 3 a 12x.
- Mentoria (acompanhamento) vs consultoria (feito-com / feito-pra-você) vs as duas.
- Setup único + retainer mensal, quando há manutenção contínua.
- Projeto em fases (ex.: 50% / 25% / 25%), quando o escopo é grande.
- Sociedade / equity (entrada + mensal + %), em casos específicos.

### Regras invioláveis

1. **Sempre apresentar 2 a 3 opções.** Mentoria, consultoria, ou ambas. Nunca apresentar opção única (cliente perde poder de decisão e a sensação de escolha).
2. **Escassez via prazo de validade.** Toda proposta tem validade de 7 dias. Após esse prazo, valores podem ser revistos. Comunicar de forma sutil.
3. **Forma de pagamento clara.** À vista (com desconto) ou parcelado em 3 a 12 vezes via PIX, cartão ou boleto.
4. **Setup + mensalidade quando aplicável.** Para projetos com manutenção contínua, separar valor de implementação do retainer mensal.
5. **Parcelas nunca vinculadas a entregas.** Parcela é parcela, não milestone. Não condicionar pagamento a fases do projeto.
6. **Valor de mercado em projetos técnicos.** Quando inclui app, SaaS ou software, mostrar quanto custaria contratar separadamente. Geralmente 3 a 5x o valor da consultoria.
7. **Pixel Meta opcional.** Geralmente NÃO em proposta privada (só em landing pública). Tracking, se quiser, no CRM/Notion do dono.

### Ancoragem psicológica

Sempre ancorar o valor antes de mostrar o preço:
- Comparar com custo de equipe (12 meses de funcionário CLT custaria R$X).
- Comparar com agência (uma agência cobraria R$X só pelo setup).
- Mostrar projeção de retorno (ROI de 5x em 6 meses, payback em 2 a 4 meses).
- Listar o que está incluso para reforçar percepção de valor.

---

## 7. REGRAS INVIOLÁVEIS

### Técnicas

1. **Single-file.** Um único `index.html` com CSS e JS inline. Sem build, sem framework, sem dependência além das fontes do Google.
2. **Link privado.** Cada proposta tem um link único e não-adivinhável (slug com sufixo aleatório). Nunca reutilizar link entre clientes.
3. **SSL obrigatório.** Só entregar com `https://` e cadeado funcionando.
4. **Sem segredo no código.** Token de publicação fica na config do dono, nunca no HTML nem na skill.
5. **Mobile-first.** Testar no celular antes de entregar.
6. **Resiliente.** localStorage pros checkboxes/tema; o resto funciona sem backend.
7. Pixel Meta não usar em proposta privada (a menos que pedido explícito).

### De conteúdo

1. **Português brasileiro CORRETO com ACENTUAÇÃO COMPLETA.** Sem exceções. Toda palavra que leva acento deve ter acento. "Ação", "Visão", "Operação", "Decisão", "Não", "Você", "Está", "Será". Erro de acentuação em proposta enviada é inaceitável.
2. **ZERO travessões.** Substituir por vírgula, ponto, ou quebra de linha. Travessão é sinal de IA mal calibrada.
3. **Tom profissional mas acessível.** Como um amigo que manja muito. Não robótico. Não bajulador.
4. **Nunca atribuir falas do dono ao cliente.** Erro grave de credibilidade.
5. **Tangibilizar tudo o que foi discutido.** App? Detalhar telas. Agente? Detalhar papel. Evento? Detalhar formato.
6. **Valor de mercado em projetos técnicos.** Comparativo obrigatório quando inclui software.
7. **Nunca expor preços sem contexto.** Preço sempre acompanhado de inclusos, ROI, validade, ancoragem.
8. **Informações sensíveis fora.** Negócios paralelos do cliente que não vieram à tona, dados pessoais não relacionados, fofoca de call. Tudo isso fica fora.
9. **Modalidades pedidas apenas.** Se o dono pediu só mentoria, não incluir consultoria. Se pediu sem preço, não inventar preço.
10. **Validade de 7 dias visível.** Ancoragem de urgência.

### De entrega

1. Entregar link com `https://` na frente sempre.
2. Testar o link antes de mandar (conferir SSL/cadeado, abrir no celular).
3. Se usar subdomínio próprio do dono e ele não resolver na hora, o link `*.pages.dev` serve de fallback.
4. Se o dono acompanha pipeline, registrar a proposta no CRM/Notion dele (sem dashboard hardcoded).
5. Nunca prometer alterações que demandem refazer estrutura. Pequenos ajustes sim, refatoração não.

---

## 8. EXEMPLO ILUSTRATIVO (fictício)

Caso genérico só pra mostrar a pipeline fim-a-fim. Troque por um caso real do dono quando tiver.

### Contexto

- **Cliente:** consultor de tráfego que hoje vende mentoria em grupo e quer subir pra consultoria 1:1 + um app próprio pros alunos.
- **Nicho:** marketing de performance pra infoprodutores.
- **Dor central (fala dele):** "vendo barato e atendo demais gente, não escala e não sobra tempo".
- **Objetivo 12 meses:** menos clientes, ticket maior, entrega com produto digital próprio.

### Pipeline

1. **Transcrição** da call de venda.
2. **Extração:** entrega central = consultoria 1:1; upsell sugerido = app de acompanhamento; separar o que ele PEDIU do que foi SUGERIDO; precificar o valor de mercado do app (quanto custaria contratar dev separado).
3. **HTML** no Layout Soft (dark premium), accent na cor da marca dele; abas: Visão Geral, Diagnóstico, Solução, Entregáveis, Plano de Ação, Investimento.
4. **Publicação** no Cloudflare Pages com slug privado `prop-consultor-a8f3k2`, SSL ok, testado no mobile, link enviado com validade de 7 dias.

### O que esse exemplo ensina

- Atribuição correta: o faturamento citado na call é DELE, nunca do agente.
- Distinguir entrega central (consultoria) de upsell (app).
- Tangibilizar o app (telas, função) e ancorar pelo custo evitado.
- 2–3 opções de investimento, nunca uma só.

## 9. CHECKLIST DE QUALIDADE

Antes de mandar o link para o cliente, conferir item a item:

### Conteúdo

- [ ] Texto 100% com acentuação PT-BR completa.
- [ ] Zero travessões em todo o documento.
- [ ] Nome do cliente aparece em pelo menos 5 lugares (header, copy, footer, localStorage key, título do navegador).
- [ ] Nenhuma fala do dono atribuída ao cliente.
- [ ] Tudo que foi discutido na call está tangibilizado.
- [ ] Modalidades corretas (mentoria, consultoria, ambas, ou nenhuma conforme pedido).
- [ ] Preços com escassez (validade 7 dias visível).
- [ ] Forma de pagamento explícita.
- [ ] Se tem software/app, tem precificação de mercado comparativa.
- [ ] Nenhuma informação pessoal sensível do cliente.
- [ ] Tom profissional, sem robótica de IA.

### Visual

- [ ] Layout Soft respeitado (paleta, fontes, estrutura).
- [ ] Cor accent ajustada conforme nicho.
- [ ] Toggle dark/light funcionando (quando aplicável).
- [ ] Sticky navbar aparece ao scroll.
- [ ] Checkboxes persistindo no localStorage.
- [ ] Progress bar calculando corretamente.
- [ ] Phases colapsáveis funcionando.
- [ ] Gantt chart visível e correto.
- [ ] Animações fade-in ativando.
- [ ] Back to top aparecendo após 400px de scroll.
- [ ] Responsivo testado em mobile (max-width 480px).
- [ ] Tabs centralizadas.
- [ ] Fontes Google Fonts carregando.

### Técnico

- [ ] Publicado em link único e privado (slug com sufixo aleatório).
- [ ] HTTPS funcionando (SSL/cadeado ok).
- [ ] Abre normalmente em browser e mobile.
- [ ] Nenhum segredo/token dentro do HTML.
- [ ] Checkboxes persistentes e toggle de tema funcionando.

### Entrega

- [ ] Link enviado com `https://` na frente.
- [ ] Mensagem de envio adaptada ao tom da relação.
- [ ] Validade de 7 dias mencionada na mensagem ou na proposta.

---

## 10. CREDENCIAIS / CONFIG (do dono)

Coletadas no onboarding e guardadas na config do dono. **Nunca versionar, nunca hardcodar segredo no HTML nem na skill.**

| Item | Uso | Observação |
|------|-----|------------|
| Token Cloudflare Pages | Publicar a proposta | Do dono; no `.env`/config dele |
| Domínio do dono *(opcional)* | Mapear subdomínio bonito | Só se quiser endereço próprio |
| OpenAI/Whisper key *(opcional)* | Transcrever a call | Ou usar transcrição da ferramenta de reunião |

### Validar antes de começar

Publicar um Pages de teste com o token do dono. Se falhar, parar e pedir renovação do token antes de seguir. Se o dono já publica sites por outro caminho, usar o caminho dele — o requisito é só: link privado + SSL + mobile ok.

## ANEXO A. FLUXO RESUMIDO EM 1 PÁGINA

```
1. Receber transcrição da call.
2. Extrair: cliente, nicho, dor, números, sugestões, preços, reação.
3. Validar diagnóstico com o dono.
4. Gerar HTML personalizado com Layout Soft.
   - Escolher geração (Dark Premium ou Light Corporate).
   - Ajustar paleta accent ao nicho.
   - Construir 6 a 9 tabs.
   - Personalizar copy com nome e dores reais.
5. Salvar o index.html em `propostas/<cliente>/`.
6. Publicar no Cloudflare Pages com nome `prop-<cliente>-<sufixo>` (token do dono).
7. (Opcional) Mapear um subdomínio do dono, se ele quiser endereço próprio.
8. Conferir SSL/cadeado e testar no mobile.
9. Enviar o link ao cliente com a mensagem padrão (validade 7 dias).
```

## ANEXO B. ERROS HISTÓRICOS QUE NÃO PODEM REPETIR

1. **Atribuição de fala.** Já atribuímos um faturamento ao cliente quando, na verdade, era o dono falando de outro projeto. Lição: sempre identificar o falante na transcrição antes de extrair números.

2. **Falta de tangibilização.** Já deixamos de detalhar um app discutido na call. Lição: tangibilizar TUDO. Se mencionou, detalha.

3. **Múltiplas propostas iniciais.** Texto sem acentuação completa. Lição: revisar caractere por caractere antes de subir. Não confiar em geração automática.

4. **Informação pessoal irrelevante.** Já incluímos referência a um negócio paralelo do cliente sem relação com o tema. Lição: filtrar informação pessoal sensível.

5. **Múltiplas propostas.** Tabs desalinhadas no centro. Lição: testar centralização em diferentes resoluções.

6. **Plano de ação.** Linguagem de "teste antes de comprar" em plano pós-venda. Lição: se é plano de mentorado, tudo começa após definição da parceria, sem condicionantes.

7. **Deploy quebrado.** Publicação rejeitada por config errada do fluxo de deploy. Lição: validar o token/fluxo de publicação ANTES de subir.

8. **SSL quebrado.** Link entregue sem cadeado. Lição: conferir HTTPS antes de entregar; nunca mandar link sem `https://`.

## ANEXO C. PROVA / CREDIBILIDADE (por dono)

A prova social da proposta é **do dono**, não fica fixa nesta skill. Puxe os números reais e verificáveis do dono da `soft-plano-posicionamento` (Fundação) ou do banco de provas dele. Regras:

- Nunca inventar número. Nunca usar número de terceiro como se fosse do dono.
- Se o dono ainda não tem número grande, usar **prova qualitativa** (caso, antes/depois, print de resultado) — nunca inflar.
- Equipe que entrega: se houver, cards com nome/foto reais; se for solo, não fingir time.

## ANEXO D. INSIGHTS ESTRATÉGICOS

Padrões que funcionam bem em propostas e merecem ser reforçados:

1. **Escada de valor personalizada.** Cada proposta desenha escada específica para o nicho do cliente. Nunca usar escada genérica.

2. **Diagnóstico honesto.** Mostrar que conhece o negócio do cliente. Two-column funciona vs precisa mudar gera identificação.

3. **ROI explícito.** "Investimento se paga em X meses". Sempre projeção numérica clara.

4. **App ou SaaS próprio como diferencial.** Quando o projeto inclui produto digital próprio do cliente, isso vira diferencial forte versus mentoria genérica.

5. **Comparativo com mercado.** "Se fosse contratar separado custaria R$X". Ancoragem de valor pelo custo evitado.

6. **Validade de 7 dias.** Urgência sutil, sem ser agressiva.

7. **Checkboxes persistentes.** Cliente interage e se engaja. Cria sensação de progresso ao ler.

8. **Tipografia Cormorant + DM Sans.** Padrão visual que transmite premium sem cansar.

9. **Personagens em cards (quando aplicável).** Time real com fotos e nomes humaniza a entrega.

10. **Numeração de fases clara.** Cliente enxerga o caminho dos próximos 6 meses ao bater o olho.

---

Documento operacional do método Soft. Atualizar conforme novas propostas consolidam novas práticas.

Versão Soft: 1.0 (modelada a partir de um método externo, des-marcada e alinhada ao Soft).
