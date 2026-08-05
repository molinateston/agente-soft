# Comandos Rápidos, Reconhecimento e Fluxo

> Quando há fundação empacada, a skill reconhece 3 comandos e vai DIRETO pra geração, sem pergunta nova.
> Exceção: `banco de [tema]` sem qtd especificada → pergunta volume com 4 opções (ver seção "Volume do banco").

---

## Princípio raiz

Comandos rápidos existem porque o especialista que tem fundação empacada não pode esperar 4 perguntas pra cada headline. Ele tem ideia, manda comando, recebe headlines em ~30s.

**Regra absoluta:** comando rápido nunca pergunta nada se a fundação está completa **e** o pedido tem volume claro. Se faltar fundação, dispara as 4 perguntas padronizadas. Se faltar volume num pedido de banco, dispara a pergunta de volume.

---

## Os 3 comandos canônicos

### Comando 1, `manda X headlines sobre [ideia]`

**Variações reconhecidas:**
- *"manda 5 headlines sobre [ideia]"*
- *"5 headlines de [tema]"*
- *"me dá 7 headlines pra [contexto]"*
- *"headlines sobre [tema]"* → default 10

**Output:** inline no chat. Sem artifact (até 15 headlines). Acima disso, vira artifact.

**Fluxo interno:**
1. Lê fundação (4 itens) do projeto Claude / conversa atual
2. Pra cada headline, escolhe 1 dos 30 templates do curso (rotação)
3. Acopla pelo menos 1 assunto viral (Categoria 1, 2 ou 3, ver Cap 5.2 (guia))
4. Aplica os 5 critérios v2 em cada headline gerada
5. Itera internamente até ter X headlines que passam
6. Marca template usado em cada headline (`**T9 (TODA PESSOA QUE TEM):**`)
7. Se o destino é reel/anúncio em vídeo → entrega 3 tipos por headline (FALAR · MOSTRAR · TEXTO NA TELA)
8. Entrega lista enxuta

---

### Comando 2, `banco de [tema]`

**Variações reconhecidas:**
- *"banco de headlines sobre [tema]"*
- *"banco de [tema]"*
- *"me dá um banco pra [contexto]"*
- *"várias/muitas headlines sobre [tema]"* (sem qtd numérica)

**Output:** artifact `text/markdown`.

**Fluxo interno:**

#### Passo 1, Pergunta de volume (se não especificado)

Se o cliente NÃO disse quantidade numérica e o pedido tem palavra "banco" ou "muitas/várias/um monte", a skill pergunta em 1 mensagem:

```
Quantas headlines? Tenho 4 níveis:

• 50, primeira leva. Testa se a Fundação tá afiada antes de investir tempo (1 mês de produção)
• 100, banco padrão. Equilíbrio entre profundidade e fadiga de escolha (2-3 meses de produção)
• 200, banco robusto. Cliente já validou método e vai escalar (6 meses de produção)
• 300, biblioteca anual. Entrega em 3 lotes por ASSUNTO (9-12 meses de produção)

Manda só o número.
```

#### Passo 2, Geração

| Volume | Cobertura | Por template | Como entrega |
|---|---|---|---|
| **50** | 30 templates (cobertura larga) ou 5-10 templates (foco vertical) | ~1-2 ou 5-10 | 1 artifact |
| **100** | 30 templates × ~3-4 headlines | ~3-4 | 1 artifact |
| **200** | 30 templates × ~6-7 headlines | ~6-7 | 1 artifact |
| **300** | 30 templates × 10 headlines | **10** | **3 artifacts em 3 lotes (ver Passo 3)** |

#### Passo 3, Lotes pra 300 headlines

300 headlines em 1 artifact estoura tokens e cansa olho. Skill divide em **3 lotes por ASSUNTO**, frame do curso de Reels (Capítulo 6, "Escalar um ASSUNTO viral").

**Pergunta antes da geração:**

```
300 headlines vou entregar em 3 lotes de 100, cada um atacando 1 assunto central com os 30 templates.

Quer escalar por ASSUNTO ou por ESTRUTURA?

A, ASSUNTO (recomendado pra cliente novo): escolhe 3 assuntos centrais, cada lote ataca 1 com os 30 templates × 3 ângulos.
   Default: usa os 3 inimigos da Fundação como assuntos.

B, ESTRUTURA (só se já tem dados): escolhe 3 templates que já performaram pra ti, cada lote modela esse template em vários temas.

Manda A ou B.
```

**Se A:**
- Lote 1 (100): assunto central = inimigo 1 da Fundação · 30 templates × ~3 ângulos
- Lote 2 (100): assunto central = inimigo 2 da Fundação · 30 templates × ~3 ângulos
- Lote 3 (100): assunto central = inimigo 3 da Fundação OU tese central · 30 templates × ~3 ângulos

**Se B:**
- Cliente envia 3 templates que performaram (ex: T9, T13, T26)
- Cada lote = 1 template em ~33 temas variados
- Cliente decide os temas OU skill puxa da Fundação

#### Passo 4, Estrutura do artifact

```markdown
# Banco de headlines, [tema] · [Volume]

## Fundação destilada
[Tese · Inimigos · Não defendo · Cliente final]

## Assuntos virais identificados
[Universais aplicáveis · nicho · momento]

## BANCO

### T1, FAÇA ALGO ESPECÍFICO

**1.1** [headline 1]
**1.2** [headline 2]
[...]

### T2, COISAS QUE EU FAÇO DEPOIS DE
[...]

[continua até T30]

## Auditoria de cobertura
- Templates usados: 30/30
- Distribuição de gatilhos: [tabela]
- Combinação de 2 assuntos virais: X% das headlines
```

---

### Comando 3, `headline pra [cena]`

**Variações reconhecidas:**
- *"headline pra reel sobre [cena]"*
- *"headline pra anúncio de [oferta]"*
- *"headline pra carrossel sobre [tema]"*
- *"abertura pra story sobre [contexto]"*
- *"gancho pra [vídeo/post]"*
- *"capa pra carrossel sobre [tema]"*

**Output:** inline no chat. 3-5 opções pontuais.

**Fluxo interno:**
1. Identifica o **formato de destino** (reel, anúncio, carrossel, story, etc.)
2. Lê fundação
3. Gera 3-5 headlines aplicando o Critério 5 (comprimento por formato):
   - **Reel** → FALAR ≤7 palavras + MOSTRAR + TEXTO NA TELA
   - **Carrossel** → CAPA 8-15 palavras + sugestão visual
   - **Anúncio em vídeo** → versão extra-curta (≤5 palavras nos primeiros 1.7s) + 3 tipos completos
   - **Story** → 5-10 palavras + sugestão visual
4. Marca template usado em cada
5. Entrega as 3-5 opções

---

## Quando perguntar volume vs quando NÃO perguntar

| Pedido do cliente | Skill | Por quê |
|---|---|---|
| *"manda 5 headlines sobre X"* | Gera 5, não pergunta | Volume já especificado |
| *"manda 30 headlines sobre Y"* | Gera 30, não pergunta | Volume já especificado |
| *"headline pra esse reel"* (Comando 3) | Gera 3-5 opções, não pergunta | Modo cena, não banco |
| *"headlines sobre [tema]"* (Comando 1, sem qtd) | Default 10, não pergunta | Pedido neutro, entrega o útil |
| *"banco de [tema]"* | **Pergunta** as 4 opções (50/100/200/300) | "Banco" significa volume, mas qual nível? |
| *"banco de 100 sobre [tema]"* | Gera 100, não pergunta | Volume já especificado |
| *"várias/muitas/um monte sobre [tema]"* | **Pergunta** as 4 opções | Volume sem número = ambíguo |
| *"300 headlines sobre [tema]"* | Pergunta SÓ se quer ASSUNTO ou ESTRUTURA | Volume empacado, mas precisa do frame |

---

## Comandos compostos (variações reconhecidas)

| Variação do usuário | Comando equivalente |
|---|---|
| "headline" (solto) | Pergunta: tema, formato, quantidade |
| "mais 5" / "outras 5" | Reusa fundação atual + tema da última geração |
| "diferentes" / "outros ângulos" | Gera 5 templates novos sobre mesmo tema |
| "audita essa: [headline]" | Aplica 5 critérios + entrega veredito |
| "reescreve essa: [headline]" | Audita + reescreve a falha + mantém intenção |
| "explora o template T9" | Gera 10 headlines no T9 sobre temas variados |
| "qual template essa headline usa? [headline]" | Identifica + explica |

---

## Regras de ouro dos comandos rápidos

1. **Comando rápido com fundação completa + volume claro: zero pergunta.** Vai direto pra geração.
2. **Comando rápido com fundação incompleta: dispara as 4 perguntas padronizadas.** Não pergunta de novo nas próximas gerações da mesma sessão.
3. **Comando "banco" sem volume especificado: dispara pergunta de volume.** 4 opções com critério.
4. **Comando 300 sem frame especificado: dispara pergunta ASSUNTO ou ESTRUTURA.** Default ASSUNTO se cliente novo.
5. **Comando rápido sem fundação alguma: cai em modo input livre.** Pergunta nicho, gera, avisa sobre Plano.
6. **Reuso na sessão:** uma vez carregada na conversa, fundação é reutilizada automaticamente.
7. **Auditoria invisível:** usuário vê só as headlines que passam nos 5 critérios. Headlines que falham são refeitas internamente.
8. **Marcação de template visível:** toda headline mostra o template usado.
9. **3 tipos de headline em reel/anúncio em vídeo:** FALAR · MOSTRAR · TEXTO NA TELA, sempre.
10. **Tom de entrega: clínico.** Sem "que tal essas?", "espero que goste", entrega e fim.

---

## Quando NÃO disparar comando rápido

A skill **não** processa como comando rápido se:

- Cliente pede roteiro completo, copy de carta, ou conteúdo além de headline → aponta pra outra frente (`processo-feed.md`) ou skill (`soft-funil`)
- Cliente pede análise estratégica de feed inteiro → aponta pro coach
- Cliente cola texto longo pra "transformar em headline" → entra em modo input livre com aviso

---

## Diagnóstico rápido (anti-erro do operador)

Antes de gerar, a skill internamente confere:

1. ✓ Tem fundação empacada? Se não → Modo Input Livre ou perguntas
2. ✓ Tem tema específico no comando? Se não → pede tema em 1 linha
3. ✓ Tem formato (reel/carrossel/anúncio) implícito ou explícito?
4. ✓ Quantidade especificada (se Comando 2)? Se não → pergunta volume
5. ✓ Frame de escala especificado (se Comando 2 = 300)? Se não → pergunta ASSUNTO ou ESTRUTURA

Se algum dos 5 falha, pergunta SÓ o que falta, em 1 mensagem curta.

---

> **Os critérios aqui NÃO substituem o Crivo.** Comando rápido entrega rápido, mas toda peça passa pelo gate bloqueante (`shared-references/crivo/03-gate-cub.md`) antes de sair. A auditoria dos comandos é o filtro de geração; o Crivo é o gate de saída. Sem passar no Crivo, a peça não foi entregue.
