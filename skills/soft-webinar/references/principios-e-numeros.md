# Princípios comuns, espinha do perpétuo, variante crua e números de referência

## Índice
- Passo 4, o princípio comum às 3 páginas
- Passo 5, a espinha invisível do perpétuo
- Passo 7, a variante crua (`wa.me` direto)
- Números de referência de uma máquina bem montada

## Passo 4, princípio comum às 3 páginas (carrega antes de fechar)

| Princípio | A régua |
|---|---|
| **Mobile-first** | 70-85% do tráfego é celular. Headline sem scroll · botão ~44px · form enxuto · imagens leves · vídeo com thumbnail estático (**NÃO autoplay**). Abre no SEU celular e lê como o avatar. Visual → `shared-references/filtro-mobile-first/checklist-final.md` item a item |
| **Velocidade** | <3s · imagens WebP · sem fontes externas pesadas · CSS crítico inline. **Vídeo nunca em Vimeo** (engasga em banda fraca, mata o webinar); usa o servidor da ferramenta ou YouTube com código anti-clique |
| **Pixel + tracking** (antes do tráfego) | Pixel Meta no head das 3 · PageView auto · **Lead** no submit (pág 1) · **InitiateCheckout** ao entrar no checkout (pág 3, junto com o "15 primeiros" do Bloco B) · **Purchase** no pagamento. Em redirect o pixel carrega **síncrono** (`async=false`), senão perde o evento |
| **Coerência visual** | as 3 no mesmo padrão de marca (paleta/tipografia/tom); páginas de "empresas diferentes" destroem confiança |
| **Sem designer** | marca com padrão → monta em **template** (Hotmart Pages/ClickFunnels/Cartpanda). Não para esperando designer; a página converte, não impressiona |
| **A/B no MESMO mecanismo** | prioridade = headline do cadastro · 2 variantes, 50%/50%, **mín. 200 leads/variante** · erro caro: anúncio de um mecanismo numa página de outro despenca a conversão |


## Passo 5, a espinha invisível do perpétuo (o link único por lead)

Cada inscrito recebe um link só dele (ingresso nominal, sessão compartilhada: "link só seu, sala compartilhada"). É a peça da **medição**: você sabe até onde cada um foi (não veio / saiu cedo / ficou 50% / **viu a oferta**). A variável **nome/e-mail/horário/link** viaja da plataforma de webinar pro e-mail pro WhatsApp via API; por isso o cadastro captura o horário (Passo 1.5), o obrigado embute o link no calendário (card "Sua aula", Passo 2), e a mensagem dos 5 min antes chega com o link exato da sessão daquela pessoa. A **tag "viu a oferta"** (a oferta cai num timestamp exato da aula) separa quem viu e não comprou (objeção específica, recuperação de venda no pós) de quem mal entrou. Monta a estrutura de tags **AGORA, ao configurar** (a medição não é retroativa) e **não fica mexendo nas integrações depois que o webinar está rodando**, reconfigurar à toa quebra a medição inteira. (O uso completo das tags no pós é da Etapa MENSAGENS (desta skill).) **Se o pedido for perpétuo, lê a seção "Dados dinâmicos do perpétuo" da reference e aplica a espinha do link único.**


## Passo 7, a variante crua (CTA direto pro WhatsApp, SEM formulário)

Tudo acima é o caminho padrão (form + 3 páginas). A variante crua manda o lead **direto pro WhatsApp** (`wa.me`) em vez de um formulário, e funciona em **dois cenários**: (1) **validação** (não vale montar páginas e automação ainda); (2) **ticket que pede conversa humana** (fechamento 1:1). Passo a passo:
1. **O CTA é o número/link `wa.me`, não botão de form.** O clique no `wa.me` É o cadastro E o opt-in num gesto só. Molde: "se isso é pra você, manda uma mensagem pro meu WhatsApp e minha equipe te explica como funciona."
2. **A primeira mensagem do lead é o opt-in.** Quando ele escreve, optou (você não dispara pra base fria). Responde abrindo a conversa, não despejando preço.
3. **Qualifica com curiosidade, nunca com pitch:** "Oi [nome], tô curioso: por que você quer resolver [tema] agora?"
4. **Nunca dá o preço seco.** "Quanto custa?" respondido com o número = perdeu (o único parâmetro vira o bolso). Dá um passo atrás: "antes, me conta por que você tá buscando resolver isso agora?"

**Quando NÃO usar a variante crua:** **volume alto com ticket baixo**. Conversa humana não escala num produto de R$300, aí o checkout direto é mais barato e mais rápido. Formulário e `wa.me`-direto não são rivais, são o mesmo funil em dois níveis: o form escala o low/mid-ticket, o `wa.me` pega o lead quente que precisa de mão humana. **Lê a seção "Variante crua" da reference e aplica os exemplos (incluindo o redirecionamento dos indecisos pro WhatsApp na sala secreta).**


## Números de referência de uma máquina bem montada

| Etapa | Faixa saudável |
|-------|----------------|
| Página → lead | 30-40% |
| Comparecimento (inscrito → presente) | benchmark 33-57%, **alvo Soft 50%+**; **+54% (de 31% pra 47%) quando liga o WhatsApp** |
| Compra automática no checkout (de quem compareceu) | 6-8%, antes de qualquer comercial tocar (de quem ENTRA no checkout, 60-85%) |

Se os indicadores estão muito abaixo disso, o furo quase sempre está numa **peça técnica** (a página, o horário, a hospedagem do vídeo, a mensageria), **não na copy**. Audita o encanamento (vídeo engasgando, horário mal escolhido, WhatsApp não ligado) antes de reescrever a aula no desespero.
