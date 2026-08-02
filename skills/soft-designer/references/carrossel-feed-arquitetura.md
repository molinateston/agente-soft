# Carrossel de feed 1080x1350 — arquitetura visual (marca-neutra)

Molde reprodutível de carrossel de feed vertical. **Neutro por design**: nenhuma cor, handle, palavra
ou tema é fixado aqui. Tudo vem do perfil do cliente (Passo 0 e `identidade-visual-cliente.md`).
Template executável em `carrossel-feed-template.py`.

> ⚠️ **Quantidade é DECISÃO estratégica, não constante.** O intervalo saudável é **6-9 slides** (7-8 sendo o
> mais comum). O designer NÃO trava em 9 por default — recebe da skill de copy o número justificado e
> respeita. Um carrossel de 6 slides apertado converte mais que 9 arrastados.

## Quando este molde encaixa
- Formato IG/feed vertical 1080x1350 (6-9 slides).
- Autor tem UMA cor accent forte na marca (o resto é preto + branco + cinza).
- Universo do nicho tem 15-25 palavras "de dentro" que servem de textura de fundo.
- A copy pede ritmo alternado (headline forte / texto / imagem / comparação / mecanismo / prova / bifurcação / CTA).

Se o cliente for de outra família (clínico-branco, editorial-preto, manuscrito-cru), esse molde não serve
como está — usa a family reference correspondente.

## Espinha visual (sistema)
- **Fundo:** preto absoluto (`#000`).
- **Uma cor accent do cliente**, com 3 variantes: accent, dim (borda), deep (watermark). Nunca duas cores accent.
- **Watermark textural:** 12-14 palavras do nicho impressas em vertical (`writing-mode: vertical-rl`) espalhadas no fundo, opacidade 0.28-0.55, monospace 700. A palavra por si NUNCA é a mensagem; ela dá textura de universo.
- **Handle centralizado no topo** (não canto), na cor accent, peso 600, 30px.
- **Separador inferior:** seta `→` centralizada em accent nos slides intermediários, bullet `•` no slide final CTA.
- **Tipografia:** Inter 800 nos títulos (letter-spacing -0.025em), Inter 400 no corpo, JetBrains Mono no watermark.
- **Emoji:** só no corpo, e só quando reforça a frase. NUNCA emoji no título por padrão (exceção pontual, explícita).

## Padrão de destaque em accent (regra dura)
Em CADA slide, **uma e só uma** palavra/número/expressão ganha a cor accent. O que merece:
- palavra que carrega o núcleo emocional;
- ou número/unidade indivisível ("ATÉ 2030" junto, "12 pessoas" junto — nunca quebrar);
- ou nome próprio do mecanismo/oferta na primeira aparição.
Marcação `[[palavra]]` no template — o wrap troca por `<span class='g'>`.

## Papéis do arco (o designer RECEBE da skill de copy, não decide)
A skill `soft-conteudo-carrossel` decide QUANTOS slides e QUAIS papéis. O designer executa. Os 7 papéis:
capa/gancho · diagnóstico · causa-raiz · mudança de categoria · estado desejado · mecanismo+prova · bifurcação+CTA.
Um papel pode ocupar 1-2 slides; dois papéis podem compactar em 1 slide.

## Imagens IA — DECIDIDAS POR SLIDE, não por posição
- Entra onde ELIMINA texto que não precisava existir (estado, cena de prova, abstração visual).
- Não entra em slide com frase forte que perde peso com imagem.
- Não entra em dois slides seguidos (dá respiro).
- Teto: 2-3 imagens em 6-9 slides.
- Sempre `hero-img` 720x520 centrada, borda 1px branco 8%.
- Prompt no perfil do cliente (`identidade-visual-cliente.md` seção "imagens IA") — silhueta minimalista, monocromática, com traços da cor accent, fundo preto.
- Nunca texto DENTRO da imagem (o texto vive em overlay/legenda).

## Regras que salvam o slide (checklist do gate visual)
1. **Uma palavra accent por slide** (nunca duas). ✓/✗
2. **Unidade indivisível junto** (usa `&nbsp;` no HTML). ✓/✗
3. **Handle igual em todos os slides**, mesma posição, mesma cor. ✓/✗
4. **Emoji só em corpo**, e só se reforça. ✓/✗
5. **Watermark do NICHO** (não palavras genéricas). ✓/✗
6. **Slide final SEMPRE termina com palavra-chave curta filtrante** (2-6 letras), em `.cta-word`. ✓/✗
7. **Copy do slide não depende do anterior pra fazer sentido.** ✓/✗
8. **Nenhum travessão em nenhum slide** — lint passa. ✓/✗
9. **Alternância de formato**: 3-4 formatos diferentes ao longo dos 6-9 slides. ✓/✗
10. **Imagens IA justificadas por slide** (não por posição fixa). ✓/✗

## O que o cliente precisa entregar antes (checklist do Passo 0)
- cor accent oficial (hex) + duas variantes (dim e deep)
- handle público (com @)
- 15-25 palavras do universo do nicho (pro watermark)
- palavra-chave filtrante do CTA (2-6 letras)
- fontes .woff2 (Inter é bom default; se a marca tem fonte própria, ela manda)
- banco de provas (frases, números, cases) — sem isso, marca `[A CONFIRMAR]`

Sem essas 6 coisas, NÃO parte pro molde. Roda `identidade-visual-cliente.md` primeiro.

## Como executar
```
cp carrossel-feed-template.py <pasta-do-projeto>/build.py
# preenche USER_* + SLIDES_COPY com a copy aprovada (N slides = decisão da skill de copy, não fixo 9)
mkdir <pasta>/fonts <pasta>/ai-img
# baixa inter-400.woff2 + inter-700.woff2 pra fonts/
# gera imagens IA (só as decididas) e salva em ai-img/
python3 build.py
```
Saída: N HTMLs + N PNGs 2160x2700 (retina), prontos pra postar.
