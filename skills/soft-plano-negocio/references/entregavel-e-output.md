# O Entregável e o Output

O Plano de Negócio é a **vista consolidada** do que a skill produz, empacotada num entregável que o especialista recebe e reabre. Junta num só lugar o que sairia espalhado: onde está, a meta, a Conta, a projeção, o Score (quando cabe), o roadmap. Não é método novo: consolida o que já foi produzido nos passos.

---

## O esqueleto do doc consolidado (a ordem das seções)

O plano sai sempre nesta ordem (mapa-mental: macro-tópico + bullets com número):

```
PLANO DE NEGÓCIO. [Nome do especialista] · [Nicho]

1. ONDE ESTÁ
   - Faturamento médio (3 meses): R$X · Estágio: [Destravar/Escalar/...]
   - Mix atual: [oferta, ticket, vendas/mês de cada]
   - Horas reais/semana: N · Investimento em tráfego: R$X/mês

2. A META
   - Meta de caixa M6: R$X (embolsado, líquido)
   - Crescimento: [múltiplo] vs atual. Dentro do teto do estágio? [sim/ajustado]

3. A CONTA (cabe na vida?)
   - Meta ÷ ticket = N clientes/mês
   - Horas exigidas: [tabela] vs disponíveis: N → [cabe / ajuste escolhido]

4. A PROJEÇÃO (3 cenários)
   | Cenário | Premissa | Faturamento M6 | Anual |
   - Curva mês a mês do realista
   - [Realista é a meta oficial do roadmap]

5. SCORE DE NICHO (só se o nicho estava em aberto)
   - 5 critérios, soma, faixa nomeada, recomendação

6. O PRÓXIMO PASSO + ROADMAP 90 DIAS
   - Mês 1 (Montar e vender) · Mês 2 (Validar e repetir) · Mês 3 (Escalar e subir ticket)
   - Cada mês: objetivo, ações/semana, métrica, checkpoint
   - FECHAMENTO: 3 a 5 próximos passos concretos e datados pra ESSA semana

[GATE preenchido]
```

Seções 1-4 e 6 sempre. Seção 5 só quando o nicho estava em aberto. Prosa mínima, número protagonista, cabe em 1 página visual.

---

## Adaptação de output ao ambiente (a regra do autor do método)

Mesmo conteúdo, destino diferente. `chat → MD · code → site`.

- **No chat (claude.ai):** entrega em **Markdown** limpo (artifact), formato mapa-mental. Simples, sem firula. Sem Bash: você monta o conteúdo (Conta, projeção, score, roadmap) e devolve o doc consolidado. O dono abre, copia, baixa.
- **No Claude Code:** entrega o arquivo `.md`. Se o dono pedir o plano publicado/bonito, **renderiza como site** reusando o motor da `soft-proposta-comercial` (Layout Soft, link único e privado, CSS+JS inline, zero build), com a ID visual do especialista (`soft-designer`). O pipeline completo roda aqui.
- **No agente/Telegram (tem Bash):** a entrega é um **arquivo .md** consolidado; você grava e devolve o **caminho completo do arquivo** na resposta (o bridge anexa). A condução vai em mensagens de texto limpo, sem markdown pesado (sem `##`, sem tabela `|` no texto ao usuário, que ficam no doc anexado).

A CONDUÇÃO (perguntas, escolhas de ajuste, os STOPs) acontece no chat; o PLANO mora no doc. Ao parar num STOP, mostra ou atualiza o DOC e pergunta "ajusto?". Nunca reescreve o plano em pedaços no corpo da conversa.

---

## Os invioláveis do entregável

- **Marca-neutra:** cor, fontes, logo e prova são do especialista (puxa da Fundação dele). Nunca os números do autor do método, nunca de terceiro, nunca inventar.
- **Sem número real, não calcula.** O que faltou está marcado `[A CONFIRMAR]` no doc, nunca preenchido com plausível nem "média do mercado".
- **Projeção sempre em 3 cenários com premissa escrita**, e a régua de realismo aplicada antes de mostrar.
- **Roadmap fecha com 3-5 próximos passos concretos e datados** pra ESSA semana. O especialista sai com tarefa, não com teoria.
- **Não cria método novo:** consolida o que os passos produziram. Se o pedido é de uma peça que não é plano (posicionamento, conteúdo, funil, financeiro), aponta a skill certa em vez de improvisar aqui.
- **Toda copy passa pelo filtro anti-IA** (PT-BR com acentuação completa, zero travessão em frase de copy, zero família "travar/destravar"). CTRL+F com número > 0 reprova.
- **1 página visual, não relatório de 30.** Corta prosa, não corta número. Tabela e bullet acima de texto corrido.

---

## Por que o entregável importa

O plano só é útil se o especialista o reabre. Um plano que fica no chat some no scroll; um doc consolidado ele cola na parede, consulta toda segunda, leva pra recalibragem semanal. O entregável tangível é o que torna a condução real pra ele: sai com o mapa na mão, não com uma conversa que já esqueceu. É a diferença entre um plano que vira operação e um que vira teoria.
