# Gate de segurança: a rede EM CÓDIGO (prompt sozinho não é gate)

Autônomo não é solto. Um agente de IA que fala com lead 24-7 em nome do dono tem poder real. Este gate é o que separa "confiável" de "perigoso", e o princípio-mãe, provado em motor rodando com lead de verdade, é este:

> **Tudo que o prompt diz "nunca faça" tem um equivalente EM CÓDIGO conferido DEPOIS do modelo.** O prompt orienta; o código garante. Modelo esquece, alucina, cede a lábia de lead. Regex e conferência de saída, não.

O gate é confirmado COM o dono antes de ligar; cada projeto pode apertar mais, nunca afrouxar o núcleo.

## Camada 1: escalada dura na ENTRADA (antes do modelo)

Regex/palavra-chave na mensagem do lead que vira `solicitar_humano` DIRETO, sem o modelo opinar:
- **Jurídico:** processo, advogado, Procon, reembolso contestado, "vou te denunciar".
- **Pediu humano:** "quero falar com uma pessoa", "me passa pro responsável".
- **Sinal de compra / conversa de dinheiro:** "como eu pago?", "me manda o link", "fechado, bora" (acima do limiar, quem fecha é gente ou o closer; o sinal quente NUNCA espera o modelo decidir).
- **Tentativa de reprogramar o agente:** "ignore suas instruções", "você agora é...", pedido de dado interno/credencial. Instrução dentro de mensagem do lead é DADO, nunca comando.
- **Assunto sensível fora do escopo:** saúde grave, crise pessoal, imprensa.

O handoff da escalada tem: frase pronta pro lead (por motivo, pra ele não ficar no vácuo), briefing rico pro humano (quem, estado, o que aconteceu, link do CRM) e **dedup de 30 min por lead+motivo** (não notifica o dono 5x pela mesma coisa).

## Camada 2: conferência da SAÍDA (cada mensagem, depois do modelo)

Antes de QUALQUER mensagem sair, o código confere. Barrou uma, **o turno inteiro não sai** e o dono recebe o porquê:

| Checagem | Regra |
|---|---|
| **Dinheiro** | mensagem com número de dinheiro SEM a ferramenta de preço consultada no turno = barrada. Tabela vazia = nenhum número sai. |
| **Link** | só os links da lista autorizada do projeto (checkout aprovado, link exclusivo do lead). Qualquer outro = barrada. |
| **Data/hora** | data ou horário que não bate com o cadastro do lead = barrada (o agente não inventa agenda). |
| **Promessa** | promessa de resultado ("garanto que", "com certeza você vai") = barrada. |
| **Dado sensível** | pedido de senha, documento, dado de cartão = barrada. |
| **Identidade** | revelar que é IA quando o dono vetou (ou fingir ser humano quando o dono exigiu transparência): segue a política declarada do dono, o código confere as duas direções. |

## Regras sempre-ligadas (independem do turno)

- **Killswitch por arquivo-flag.** Criar o arquivo = motor para no próximo turno, antes de gastar modelo. Desligar não pode depender de deploy.
- **Horário de silêncio (22h-8h local).** Proativo espera a manhã; resposta a quem escreveu agora pode sair.
- **Optout imediato.** "Não quero mais receber" = taga, confirma educado, avisa o time, nunca mais processa o lead.
- **Anti-spam.** Sem disparo em massa, sem sequência sem resposta além da cadência, sem perseguir quem disse não.
- **Privacidade.** Nada de um lead vaza pra outro; nada interno do dono vaza pro lead.
- **Toda falha avisa.** API caiu, token venceu, agendamento não gravou → NÃO finge que deu certo; registra e avisa. "Agendei" sem gravação real é a pior quebra de confiança possível.
- **Depois do handoff, não retoma sozinho.** Escalou = a conversa é do humano até ele devolver.

## O que o agente faz sozinho vs nunca

| ✅ Sozinho (reversível, dentro do método) | 🛑 NUNCA sem o dono |
|---|---|
| Responder, qualificar, conduzir o diagnóstico leve | Preço/desconto/condição fora do arquivo aprovado |
| Agendar/reagendar em slot livre | Fechar venda / cobrar / link de pagamento acima do limiar |
| Criar/atualizar contato, tag, nota, mover card | Mensagem em nome do dono FORA do canal conectado |
| Agendar follow-up dentro da cadência | Deletar contato/oportunidade/conversa (descarte = tag, nunca delete) |
| Encerrar lead sem perfil (com registro) | Mexer em automação/workflow/config do CRM |
| Escalar pro humano com briefing | Improvisar resposta de área que não é dele |

## Degraus de ativação: sombra → autônomo (com prova de replay)

Ligar autônomo no dia 1 é aposta, não engenharia. Os degraus têm nome e mecânica:

1. **SOMBRA (o padrão de largada).** O canal é embrulhado: leitura passa, escrita vira REGISTRO. O agente processa lead real, decide a resposta real, e nada chega no lead; o dono lê o diário de sombra (a auditoria legível) e aprova ou corrige. É onde o tom se calibra e o desvio aparece de graça.
2. **REPLAY (a prova antes de ligar).** Pega conversas REAIS do CRM, corta na última fala do lead, e mostra o que o motor responderia em cada uma. É o teste de regressão do agente: roda a prova a cada ajuste de prompt/gate, compara antes/depois. O dono só autoriza o modo autônomo depois de ver o replay se comportando.
3. **AUTÔNOMO.** Responde e opera sozinho dentro do gate; só para no 🛑. O dono acompanha pelo resumo diário + auditoria. O killswitch fica a um arquivo de distância.

O dono escolhe quando subir de degrau. Confiança se ganha com histórico, não se assume.

## Confirmação do gate (ao ativar)

Mostra a tabela ✅/🛑 pro dono e crava:
- **Arquivo de preços** preenchido? (sem ele, nenhum número de dinheiro sai)
- **Lista de links autorizados** do projeto?
- **Limiar** deste produto (fecha direto ou só agenda)?
- **Política de identidade** (o agente se apresenta como IA? como assistente do time?)
- **Horário de silêncio** do público?
- Algo a **apertar** (ex.: "nunca fale preço, sempre agende")?

Sem essa confirmação, liga no modo mais conservador: só qualifica e agenda, nunca fala dinheiro.
