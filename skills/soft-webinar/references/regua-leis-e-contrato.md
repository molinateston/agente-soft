# A régua, as 6 leis e o output contract das páginas do webinar

## Índice
- As 6 leis
- A régua que governa as 3 páginas
- Output Contract
- When NOT to use (manda pra skill certa)

## As 6 leis (valem antes de tudo)

**As 6 leis (valem antes de tudo):** (1) nunca escreve como se o cliente já soubesse o contexto, zero palavra difícil, zero figura de linguagem vazia, só o que uma pessoa real diria, cria o contexto ANTES da afirmação; (2) abre ensinando o que faz e por que aquele passo importa; (3) é consultiva, puxa o contexto de você antes de gerar, nunca cospe no escuro; (4) contexto é rei, a estrutura flutua pelo assunto, não é trilho rígido; (5) **admite se faltar insumo, nunca inventa**, marca `[A CONFIRMAR]` no lugar exato do furo (número/case/fala/oferta que falta é pendência declarada, jamais buraco preenchido com algo plausível); (6) **doc de output enxuto pros 2 leitores** (o humano que cola a página + a IA que a recebe como contexto), zero texto além do necessário, corta meta-narração e bastidor. (Detalhe em `shared-references/operacao-padrao.md`, Seção 0; as leis 5 e 6 também estão embutidas no gate do Passo 6.)

## A régua que governa as 3 páginas

A frase que abre o tema: a ferramenta não vende, a ferramenta protege. Quem cria desejo é a aula; a página só faz o desejo não vazar. Todo elemento existe por um de três motivos. Na dúvida se inclui algo, pergunta:
1. **Protege a atenção?** (impede a pessoa de pausar, sair, se distrair)
2. **Protege a venda?** (deixa o botão no instante exato em que a pessoa decide)
3. **Mede?** (te diz depois quem está quente e quem está frio)

Se não faz nenhuma das três, descarta. Enfeite que não protege nem mede é fricção.

**Página "feia" que roda ganha de página linda que enfeita.** Cada animação, cada enfeite é uma distração que tira a pessoa do único trabalho da página; página bonita demais converte menos. Não segura a operação esperando design polido. E o filtro Soft vale nas três: **filtra, não convence.** Lead errado não comparece, não compra, suja a métrica e queima a verba; "quanto mais lead" é mentira.

| # | Página | Função única | A pergunta que ela responde |
|---|--------|--------------|------------------------------|
| 1 | **Cadastro** | capturar e qualificar quem assiste | "isso é pra mim?" |
| 2 | **Obrigado/Lembrete** | garantir comparecimento + capturar o WhatsApp | "como eu não perco?" |
| 3 | **Checkout** | abrir a venda de quem já decidiu | "por que agora?" |

Quando o cadastro tenta vender, falha nas duas. Quando o checkout precisa convencer do zero, é a aula que não fez o trabalho.

## Output Contract (o que você entrega)

- **Uma página por vez** (Cadastro → Obrigado → Checkout), na ordem. A saída é **limpa, como no Claude Chat**: só a página, o texto bloco a bloco pronto pra colar na ferramenta. Nada de briefing genérico.
- **Doc enxuto pros 2 leitores (Lei 6):** o que sai serve o humano que cola E a IA que recebe a página como contexto. Só os blocos da página + os `[A CONFIRMAR]` + os rótulos mínimos pra navegar. Zero meta-narração ("isto é o bloco que faz X"), zero bastidor, zero explicação-do-método-pro-leitor.
- O gate roda **por dentro** (auditoria silenciosa); a tabela do gate NUNCA vai pra saída.
- Você **para e espera OK** depois de cada página antes de seguir pra próxima. Não despeja as 3 de uma vez.
- Você **nunca inventa fala, número, prova ou case do cliente** (Lei 5); sem fonte, marca `[A CONFIRMAR]` no lugar exato do furo e não conta como ancorado. Insumo que falta é pendência declarada, jamais buraco preenchido com algo plausível.
- Você **nunca mostra página que falhou no gate**.

## When NOT to use (manda pra skill certa)

- Pediu **oferta / stack / garantia / ancoragem do webinar** → **Etapa PLANO/OFERTA (desta skill)** (esta skill só monta as 3 páginas; a oferta nasce lá).
- Pediu **roteiro / estrutura ADMA** → **Etapa AULA (desta skill)**. **Deck/slides** → **Etapa AULA (desta skill; render fino = soft-designer)**. **Gravação/perpetuação** → **Etapa PLANO/OFERTA (desta skill)**. **E-mails/WhatsApp** → **Etapa MENSAGENS (desta skill)**. **Anúncios** → **soft-trafego-meta**. **Pós-webinar/esteira** → **Etapa MENSAGENS (desta skill)**. **Plano/diagnóstico do webinar** → **Etapa PLANO/OFERTA (desta skill)**.
- Pediu **página de vendas / VSL / landing** fora do contexto de webinar → **soft-funil**.
- Pediu **só a headline** (isolada, banco de ganchos) → **soft-conteudo-headlines**.
- Pediu o **CORPO de conteúdo de feed** (carrossel, reel, stories) → **soft-conteudo**.
- Pediu **posicionamento / oferta-mãe / mecanismo nomeado** → **soft-plano-posicionamento**.
- Pediu **arte / PNG / visual** da página → **soft-designer**.
- Pediu **script de venda / objeção no 1:1** → **soft-vendas-closer**.
