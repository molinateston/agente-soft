# O gate das páginas do webinar, linha a linha (P7)

Roda por dentro, auditoria silenciosa. A tabela NUNCA vai pra saída: o cliente recebe só a página limpa.

Roda o gate em CADA página **internamente**. Só página com VEREDITO=PASSA vai pro cliente. Uma falha refaz o bloco que falhou (não a página inteira). A tabela abaixo é o teu **checklist INTERNO**, nunca a saída: o cliente recebe só a página limpa (Passo 8), jamais a tabela.

| Check | Passa se | ✓/✗ |
|---|---|---|
| **Ancorada no verbatim** | promessa/bullets/prova nascem de fala ou prova REAL do cliente (cita N real); número/case/fala inventado = ✗ automático (vira `[A CONFIRMAR]`) | |
| **Uma função só** | cadastro qualifica (não vende), obrigado faz aparecer (não vende), checkout abre venda decidida; nenhuma página invade a função da outra | |
| **Cadastro = 1 promessa + 1 CTA** | um hook claro (1 das 4 variações pela temperatura), um único caminho de ação, form só com os campos que o MODELO justifica, contra-filtro com a linha anti-milagre | |
| **Obrigado com "como não perco" respondido** | a pessoa sai sabendo data/hora, como acessa, tem o opt-in/lembrete e a ficha; aparecer ficou fácil | |
| **Checkout ENXUTO (5 blocos, nada mais)** | só: cronômetro 5min + "15 primeiros" + garantia (cardápio) + provas (na moeda) + bônus/stack (cada item mata 1 objeção + soma riscada) + pagamento. SEM FAQ, SEM re-explicar método, SEM upsell, SEM bio. Qualquer bloco extra = ✗ | |
| **Bio detalhada na última dobra** | cadastro E obrigado terminam com a bio DETALHADA (empatia/cicatriz ANTES do feito, número com ressalva, anti-milagre no fecho); checkout NÃO tem bio. Bio no topo ou ausente nas 2 primeiras = ✗ | |
| **Mobile-first** | headline sem scroll, botão ≥44px, form enxuto, sem autoplay, carrega leve; testado como avatar no celular | |
| **C / U / B** | Clareza (entende em 2s) · Utilidade (sabe o que ganha) · Boa-vontade (sem hype, sem promessa fácil). Os três de pé | |
| **Sem promessa fabricada** | nenhuma promessa de resultado, número de prova ou garantia que o cliente não confirmou de fato | |
| **CTA com destino** | todo botão diz o que acontece ao clicar e tem destino real (form / wa.me / calendário / gateway), nunca "Saiba mais" vago | |
| **3 perguntas do Harry** | Dá pra VER? (cena/chão, não tese) · Dá pra FALSIFICAR? (fato, não adjetivo) · SÓ você diz? (o concorrente não assina igual) | |
| **Anti-IA (HARD)** | zero travessão "," · zero "travar/travado/destravar" (exceção: aspa literal do cliente) · sem frase-emoldura ("a verdade é", "o segredo") · sem verbo-clichê ("revoluciona, transforma"). **No chat (sem o lint), faz CTRL+F manual de "," e da família "travar" antes de marcar ✓.** No Code, roda `python3 scripts/lint_copy.py`. | |
| **Coerência de formato** | página de **ao vivo** tem data fixa real + contagem real até a data; página de **perpétuo** NÃO tem data fixa, usa horário relativo/recurring + link único. Misturou (data fixa no perpétuo, "12 min" num evento de 3 dias) = ✗ | |
| **Lei 5, admite-não-inventa** | todo furo de insumo (número, case, fala, oferta, vagas, preço) está marcado `[A CONFIRMAR]` no lugar exato, NUNCA preenchido com algo plausível; nenhum dado parece real sem fonte | |
| **Lei 6, doc enxuto pros 2 leitores** | a saída é só a página colável: blocos + `[A CONFIRMAR]` + rótulos mínimos. Zero meta-narração, zero bastidor/racional, zero explicação-do-método-pro-leitor, zero repetição. Serve humano que cola E IA que recebe como contexto | |
| **VEREDITO** | **= o PIOR item acima.** Um ✗ qualquer = REFAZ. Só tudo-✓ = PASSA e vai pro cliente. | |

(O detalhamento de C/U/B + as 3 perguntas do Harry: `shared-references/crivo/03-gate-cub.md`. Padrões banidos + reescrita do anti-IA: `shared-references/filtro-anti-ia/`.)
