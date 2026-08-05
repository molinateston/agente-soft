# Performance

Velocidade, imagens, fontes, JavaScript. Página rápida converte mais.

---

## Por que performance importa

- Página que demora 3+ segundos perde 50% dos visitantes
- Em conexão 3G/4G fraca (típica em mobile no Brasil), página pesada = abandono
- Google penaliza páginas lentas em SEO

Não importa quão boa a copy seja se a página não carrega.

---

## Tempo de carregamento alvo

### Time to First Contentful Paint
**< 1.5s** (excelente)
**< 2.5s** (bom)
**> 4s** (perde leitores)

### Time to Interactive
**< 3.5s** (mobile)

### Métrica simples (cliente entender)
"Página tem que estar útil em 3 segundos no 4G."

Testar em **3G simulado** no DevTools (Chrome > Network > Throttling > Slow 3G).

---

## Imagens

### Formato
**WebP ou AVIF preferido.**

Por quê: tamanho 25-50% menor que JPG/PNG com qualidade equivalente.

### Quando usar cada
- **WebP:** padrão moderno, suporte amplo
- **AVIF:** ainda melhor compressão, suporte crescente
- **JPG:** fallback pra fotos
- **PNG:** só pra logos / transparência / ícones simples
- **NÃO usar:** PNG pra fotos (gigante demais), GIF pra animação (use vídeo)

### Tamanho de arquivo
- Hero image: máximo **200KB**
- Imagem normal: máximo **100KB**
- Ícone / logo: máximo **20KB**

### Dimensão
Não fazer upload de imagem 3000x3000 e mostrar em 600x600. Redimensiona antes.

Resoluções recomendadas:
- Hero: 1920x1080 (max)
- Imagem no corpo: 1200x800 (max)
- Ícone: 200x200 (max)

### Compressão
Use ferramentas:
- TinyPNG (online, simples)
- ImageOptim (Mac, lote)
- Squoosh (Google, online)
- WebP via plugin do WordPress / Framer

Comprimir até a qualidade ainda parecer boa. Geralmente entre 70-85% mantém visual e reduz arquivo em 50%+.

### Lazy loading
Imagens abaixo da dobra carregam só quando o usuário scrolla até elas.

Em HTML moderno: `<img loading="lazy">` (suportado por todos os browsers atuais).

### Responsivo
Servir imagem de tamanho diferente conforme o tamanho da tela.

`<picture>` ou `<img srcset>` resolve.

---

## Fontes

### Quantidade
**Máximo 2 famílias de fonte.**

Cada família carrega bytes. Muitas famílias = lentidão.

### Pesos
**Máximo 3 pesos por família.**

Exemplo:
- Inter Regular (400)
- Inter Medium (500)
- Inter Bold (700)

Mais que isso é desperdício.

### Subset
Se possível, carregar apenas os caracteres usados (subset Latin pra Brasil).

### font-display
**font-display: swap** em todas as fontes.

Por quê: mostra texto com fonte fallback até a custom carregar (evita "Flash of Invisible Text").

### Self-hosted vs Google Fonts
- Self-hosted (no próprio servidor): mais rápido em geral
- Google Fonts: fácil, mas adiciona request externo

Pra cliente Soft, self-hosted é o ideal.

---

## JavaScript

### Quantidade
**Menor possível.**

Cada KB de JavaScript é parsed e executed no celular. Celulares brasileiros médios são lentos pra JS pesado.

### Carregamento
- Crítico: inline ou no `<head>` (raro)
- Importante: `<script defer>` no `<head>`
- Não crítico: `<script async>` ou no final do `<body>`

### Frameworks
Páginas de venda Soft geralmente NÃO precisam de React, Vue, Next.js etc.

HTML + CSS + JavaScript mínimo (pra interações como menu, modal) é suficiente.

### Tracking pesado
Cuidado com tags de analytics, pixels de anúncio, hotjar, etc. Cada uma adiciona JS.

Mínimo necessário:
- Google Analytics 4 (leve)
- Pixel da Meta (se anúncios estão rodando)
- Cookies consent (LGPD)

Nada além disso é geralmente necessário.

---

## CSS

### Inline crítico
CSS necessário pra renderizar a primeira tela = inline no `<head>`.

Resto = arquivo externo carregado em paralelo.

### Minificação
CSS minificado é 20-30% menor. Use ferramenta de build.

### Sem CSS desnecessário
Frameworks (Tailwind, Bootstrap) trazem MUITO CSS que você não usa. Em produção, faz purge pra remover não-usado.

---

## Servidor / Hospedagem

### Hospedagem recomendada
- Framer (pra páginas simples, próprio CMS)
- Vercel (Next.js, alta performance)
- Cloudflare Pages (rápido globalmente)
- Hostinger / WordPress (cliente já existente, otimizar)

### CDN
Conteúdo servido de CDN (Cloudflare, Bunny CDN) carrega mais rápido pra brasileiro distante.

### HTTPS
**Obrigatório.** Sem exceção. Páginas HTTP em 2026 são marcadas como "inseguras" pelo Chrome.

---

## Vídeo embedado

### Pra hero
Vídeos auto-play em hero são problemáticos:
- Pesados
- Distrai do CTA
- Não convertem melhor que imagem estática

Se necessário:
- Vídeo silencioso (sem som)
- Loop curto (5-10s)
- Tamanho máximo 5MB
- Formato MP4 H.264

### Pra embed (YouTube, Vimeo)
Lazy load. Não embed direto - usa imagem de thumbnail que carrega vídeo só se o usuário clicar.

---

## Pop-ups, modals, chat widgets

### Pop-ups
**Geralmente PROIBIDOS em página de vendas Soft.**

Quando aceitos:
- Exit-intent (mouse saindo da aba)
- Após scroll de 80% da página

Tamanho do JS: mínimo. Cuidado com plugins gigantes.

### Chat widgets (Crisp, Drift, Intercom)
Cada um adiciona 100-300KB de JS. Considera necessidade real.

Se for usar, lazy load (carrega só após interação).

---

## Anti-padrões de performance

❌ Página com 50+ imagens
❌ Fontes de 6 famílias diferentes
❌ Tracking de 12 ferramentas diferentes
❌ Carrossel de hero com 10 imagens
❌ Vídeo de 30MB no hero
❌ JavaScript de 2MB
❌ Chat widget + pop-up + cookies consent + newsletter sign-up

---

## Como testar

### Ferramentas

**PageSpeed Insights** (Google)
- pagespeed.web.dev
- Mede Performance, Acessibilidade, Best Practices, SEO
- Mostra Core Web Vitals

**WebPageTest**
- webpagetest.org
- Teste em servidor real de várias localizações
- Vê filmstrip de carregamento

**Lighthouse** (no Chrome DevTools)
- DevTools > Lighthouse
- Audit completo

### Métricas-alvo (PageSpeed)
- Performance: **> 80** (mobile), > 90 (desktop)
- Acessibilidade: **> 95**
- Best Practices: **> 90**
- SEO: **> 95**

---

## Quando "bom é bom o bastante"

Performance perfeita é difícil. Foco no que importa:

1. **Carrega em 3s no 4G:** essencial
2. **Imagens otimizadas:** essencial
3. **CTA visível em < 1.5s:** essencial
4. **Fontes corretas em < 2s:** importante
5. **CSS sem código morto:** legal de ter
6. **JS minificado:** legal de ter

Os 4 primeiros são go-no-go. Os 2 últimos são otimização.

---

## Checagem de performance

1. [ ] Página carrega em < 3s no 3G simulado?
2. [ ] Imagens otimizadas (WebP/AVIF + comprimidas)?
3. [ ] Imagens com lazy loading abaixo da dobra?
4. [ ] Máximo 2 famílias de fonte?
5. [ ] font-display: swap nas fontes?
6. [ ] JavaScript mínimo, com defer/async?
7. [ ] Sem pop-up que cobre tela inteira?
8. [ ] HTTPS configurado?
9. [ ] PageSpeed Insights ≥ 80 mobile?
10. [ ] Sem vídeo pesado auto-play?

Se algum item falhar, otimiza antes de publicar.
