# Onboarding: o que coletar do dono ANTES de ligar (sempre personalizado)

O agente desta skill NUNCA liga genérico. Antes do primeiro lead, o onboarding coleta as 6 peças abaixo e as coloca no LUGAR certo (prompt, arquivo ou wiki; cada dado tem morada própria). Sem as peças mínimas, o agente liga no modo mais conservador ou não liga.

## As 6 peças (e onde cada uma mora)

| Peça | O que é | Onde mora | Sem ela? |
|---|---|---|---|
| **1. Objetivo** | A/B/C (SDR clássico, atendente, operador de funil) | prompt (declarado) | não liga: é o passo 1 |
| **2. Voz** | como o dono fala: tratamento (tu/você), comprimento, bordões, o que ele nunca diz | prompt (bloco de voz) | coleta o mínimo (abaixo) |
| **3. Oferta/PUV + limiar** | o que vende, pra quem, a promessa central, o ticket | prompt (resumo) + `soft-plano-posicionamento` como fonte | agente não conduz venda, só atende |
| **4. FAQ/wiki** | as 15-30 perguntas reais + respostas aprovadas, em páginas .md curtas | wiki (`motor-de-conhecimento.md`) | agente escala toda dúvida de produto |
| **5. Preços** | tabela de preço/parcela/condição aprovada | **ARQUIVO** (`precos.json`), NUNCA no prompt | gate barra qualquer número de dinheiro |
| **6. Fronteiras** | links autorizados, horário de silêncio, política de identidade, o que aperta | config + gate | liga no modo mais conservador |

## Como coletar (a entrevista mínima, 20-30 min do dono)

### Voz (peça 2)
Se o dono tem Plano de Posicionamento, a voz vem de lá (os 5 elementos). Sem Plano, o mínimo:
1. *"Me manda 3 áudios ou 10 mensagens SUAS respondendo cliente"* (o material vale mais que qualquer descrição).
2. Tratamento: tu ou você? Emoji: qual, se algum? Abertura típica? Despedida típica?
3. *"O que você NUNCA falaria pra um cliente?"* (vira PROIBIÇÃO no prompt).
O bloco de voz do prompt nasce DESSAS amostras, com 3-5 exemplos literais de resposta do dono (o modelo imita exemplo, não descrição).

### Oferta e limiar (peça 3)
1. O que vende, em 1 frase do jeito que o LEAD entende.
2. Ticket e o limiar: fecha direto (≤ ~R$3.000) ou agenda call?
3. A dor-mãe que o produto resolve (a que o agente escuta e reconhece).

### FAQ/wiki (peça 4)
1. *"Quais as 15 perguntas que mais chegam?"* (puxa do histórico real do WhatsApp/direct se o dono deixar).
2. Pra cada uma, a resposta APROVADA pelo dono, curta, na voz dele.
3. Vira páginas .md por tema (acesso, garantia, formato, agenda, suporte, pagamento...). Regra da wiki: o agente só afirma o que consultou; achou nada = escala. Tema recorrente nas escaladas = página nova na wiki (a wiki cresce da operação).

### Preços (peça 5)
1. A tabela: produto, preço cheio, parcelamento, condição aprovada (se houver).
2. **Vai pro arquivo, nunca pro prompt.** Trocar preço = editar arquivo.
3. Dono não quer o agente falando dinheiro? Arquivo fica vazio e o gate barra: toda pergunta de preço vira handoff ("te passo certinho com o time").

### Fronteiras (peça 6)
1. **Links autorizados:** os ÚNICOS que o agente pode mandar (checkout, sala, replay). Lista fechada.
2. **Identidade:** o agente se apresenta como quê? ("assistente do time do [dono]" é o padrão honesto). A política vale nas duas direções e o gate confere.
3. **Horário de silêncio** do público (padrão 22h-8h local).
4. **Apertos do dono:** tudo que ele quiser proibir a mais vira linha nas PROIBIÇÕES.

## O prompt resultante (a montagem)

O prompt do agente monta por turno, nesta ordem (o desenho do `fluxo-sdr-autonomo.md`):
1. PROIBIÇÕES + LIÇÕES do dono (inteiras, sempre).
2. Identidade + voz (o bloco com exemplos literais).
3. Objetivo + postura do estado atual do lead.
4. A verdade do cadastro do lead (nome, horário, link exclusivo; não existe = não inventa).
5. Sinais finos das tags (assistiu, clicou, ficha incompleta).

O que NÃO entra no prompt: preço (arquivo), fatos de produto (wiki), credencial (env). Prompt magro respondendo rápido ganha de prompt enciclopédia.

## Checklist "pronto pra sombra"
- [ ] Objetivo declarado (A/B/C)
- [ ] Bloco de voz com amostras literais do dono
- [ ] Oferta em 1 frase + limiar cravado
- [ ] Wiki com as perguntas reais (mínimo: as 10 mais comuns)
- [ ] Arquivo de preços preenchido OU vazio por decisão declarada
- [ ] Links autorizados listados
- [ ] Política de identidade definida
- [ ] PROIBIÇÕES iniciais do dono registradas
- [ ] Canal conectado e testado (`conectores.md` / `setup-conexao.md`)

Só com tudo marcado entra em SOMBRA. Autônomo, só depois do replay aprovado (`gate-de-seguranca.md`).
