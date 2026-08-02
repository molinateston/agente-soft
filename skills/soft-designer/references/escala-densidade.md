# Escala tipográfica por densidade

Regra determinística para escolher tamanho de fonte a partir da **quantidade de palavras** no slide. Elimina improviso, maior fonte de inconsistência visual entre carrosséis diferentes.

## Como contar

- **Título**: a linha mais forte do slide (marcada com `**`, `##`, ou a primeira linha se não houver marcação). Conte palavras do título somente.
- **Corpo**: todo o resto do texto do slide, somado. Ignore pontuação. Conte cada palavra, incluindo artigos.

## Tabela de escala, Título

| Palavras no título | font-size | line-height | font-weight | letter-spacing |
|---|---|---|---|---|
| 1–4 | 140–180px | 0.92 | 700–800 | -0.03em |
| 5–8 | 110–140px | 0.95 | 700 | -0.025em |
| 9–14 | 80–100px | 1.02 | 700 | -0.02em |
| 15–20 | 60–72px | 1.10 | 600–700 | -0.015em |
| 21+ | **ERRO**, retornar aviso ao usuário: "título com 21+ palavras, reduzir na copy" | | | |

## Tabela de escala, Corpo

| Palavras no corpo | font-size | line-height | font-weight |
|---|---|---|---|
| 0–10 | 40–48px | 1.35 | 400 |
| 11–25 | 32–38px | 1.40 | 400 |
| 26–45 | 26–30px | 1.45 | 400 |
| 46–70 | 22–24px | 1.50 | 400 |
| 71+ | **ERRO**, retornar aviso: "slide denso demais, 71+ palavras no corpo, reduzir na copy" | | |

## Exceções por família

- **Manuscrito Cru** em modo "tweet/confissão": sempre usar corpo como título. Conte tudo como título e aplique a tabela de título.
- **Clínico Branco** em layout utilitário (ver `layout-utilitario.md`): título pode ser small caps com tracking **positivo** 0.1em, é a única exceção à regra de tracking negativo.
- **Editorial Preto** em layout de prova numérica: o número grande é o "título" mesmo que tecnicamente seja só 1 caractere. Aplique 180–240px, sem line-height restrição.

## Protocolo

Antes de escrever o HTML de cada slide, faça mentalmente:

1. Conte palavras do título → escolha linha da tabela
2. Conte palavras do corpo → escolha linha da tabela
3. Se caiu em ERRO, **pare e reporte ao usuário**. Não improvise fonte menor pra fazer caber.
4. Dentro da faixa (ex: 110–140px), use o **limite superior** se tiver espaço negativo sobrando, **limite inferior** se o slide estiver apertado.

## O que isto elimina

- Decisão "no olho" de tamanho de fonte
- Slide com título de 3 palavras em 60px (muito pequeno para o espaço)
- Slide com título de 18 palavras em 140px (quebra feio)
- Inconsistência entre carrosséis da mesma conta
- Dependência do meu bom senso momentâneo
