# Caixa de ferramentas do SDR: scripts, árvore, templates, réguas, protocolo

Material pronto pra operar (humano ou IA). Tudo aqui é ESQUELETO com lacunas `[...]`: a voz vem do dono (onboarding), o verbatim vem da fonte real dele, e toda peça que vai pro lead passa pelo crivo anti-IA antes de sair.

## 1. Scripts de abertura por canal e cenário

### WhatsApp, sinal ativo (se inscreveu / baixou / respondeu): a janela é 2h
```
Oi [Nome]! Vi que você [se inscreveu na aula / baixou o material / respondeu o story].
O que mais te chamou atenção em [tema]?
```
+ áudio de 5-10s: só o nome dele e a pergunta. SEM pitch no áudio.

### WhatsApp, morno (já segue, já interagiu, nunca conversou)
```
[Nome], vi teu comentário em [post/tema]. Posso te perguntar uma coisa rápida sobre [contexto do comentário]?
```

### WhatsApp, frio (lista antiga / indicação): só com opt-in real
```
[Nome], aqui é [agente/time] do [dono]. Você deixou teu contato em [origem verdadeira].
Ainda faz sentido falar de [tema], ou arquivo aqui?
```
(Frio sem origem verdadeira não se aborda. Inventar origem é proibido.)

### Direct (Zernio), comentário vira conversa
```
[resposta pública curta no comentário]
+ direct: "te respondi lá, mas o detalhe que importa pro teu caso não cabe em comentário. Posso te mandar aqui?"
```

### Pós-webinar, compareceu (a abertura consultiva)
```
[Nome], vi que você ficou até [ponto da aula]. Do que o [dono] mostrou, o que mais bateu com o teu momento?
```

### Pós-webinar, faltou (sem culpa)
```
[Nome], não te vi na aula de ontem. Aconteceu algo? Se quiser, tenho o replay valendo até [prazo real], ou te encaixo na próxima [data].
```

## 2. Árvore de qualificação (os 4 elementos em sequência de decisão)

```
ABERTURA respondida?
├── NÃO → cadência de topo (10min/24h/24h), depois para
└── SIM → E1 Essência/Situação: "o que te fez começar a olhar pra isso?"
    ├── resposta vaga → 1 recava ("me conta como isso aparece no teu dia") → segue
    └── resposta real → E2 Tempo/Amarras: "isso é pra agora ou quer tentar por conta antes?"
        ├── "mais pra frente" → MORNO: entrega conteúdo/pré-qualificador, cadência
        └── "é pra agora" → E3 Ações: "o que você já tentou? o que não funcionou?"
            └── (aqui nasce o Problema Avançado; anota a frase LITERAL dele)
                → E4 Resultados: "o que você conseguiu sozinho? o que espera ter?"
                ├── distância pequena / sem dor real → SEM PERFIL: encerra leve, taga
                └── distância clara + dor nomeada → checa por dentro:
                    Budget? Decide? Agora? (lido nas respostas, NUNCA perguntado a seco)
                    ├── falta pré-qualificador → entrega (aula / mini carta), volta esquentado
                    └── passou → VENDE A SESSÃO (vender-a-sessao.md)
```

Regras da árvore: uma pergunta por mensagem · a resposta de cada elemento abre o próximo · dor não se afirma, se escuta · lead que só quer preço sem abrir o cenário = devolve 1x pela lógica do diagnóstico; insistiu = sem perfil.

## 3. Templates de agendamento e lembrete

### Oferta de horário (sempre 2 opções concretas, nunca "quando você pode?")
```
Pelo que você me contou de [dor nomeada], faz sentido a gente sentar [30min] e te mostrar
exatamente como resolver isso. Tenho [dia às hh] ou [dia às hh]. Qual fica melhor?
```

### Confirmação imediata (na hora do agendamento)
```
Fechado: [dia], às [hora], com [closer/dono]. Vou te mandar o link aqui.
Anota na agenda que essa conversa vale a pena chegar inteiro.
```

### Véspera
```
[Nome], amanhã às [hora] tá de pé? Responde SIM que eu garanto teu horário.
```

### Em cima da hora (1h antes)
```
[Nome], daqui a pouco, às [hora]: [link]. Te esperamos lá.
```

### No-show (reagenda 1x, pela dor)
```
[Nome], aconteceu algo? Seu caso ([dor nomeada]) é do tipo que não melhora esperando.
Tenho [dia] ou [dia] pra remarcar. Qual?
```

## 4. Régua de triagem (quente / morno / frio em 30 segundos)

| Leitura | Sinais (2+ = classifica) | Próximo passo |
|---|---|---|
| **QUENTE** | dor nomeada com palavra própria · pergunta de compra ("como funciona pra entrar?") · urgência declarada · respondeu rápido e completo | vende a sessão AGORA (ou fecha direto se ≤ limiar) |
| **MORNO** | responde mas curto · dor genérica ("preciso organizar") · "tô vendo ainda" · pediu material | pré-qualificador + cadência |
| **FRIO** | monossílabo · só quer preço · não abre o cenário · sumiu após 1ª pergunta | 1 tentativa pela dor, depois cadência lenta ou arquivo |
| **SEM PERFIL** | sem dor real · não decide · budget incompatível declarado · fora do avatar | encerra leve, taga com motivo, PARA |

Empate entre duas leituras = escolhe a mais fria (agenda cheia de curioso custa mais que lead esperando 1 dia).

## 5. Protocolo de passagem pro closer (o handoff que chega ganhando)

**Quando:** dor nomeada + BANT lido + pré-qualificador consumido + sessão agendada (ou pedida).

**A nota no CRM (formato fixo, todo campo preenchido ou marcado "não colhido"):**
```
LEAD: [nome] · [fone] · [origem]
ESTADO: [dos 7] · TEMPERATURA: [quente/morno]
DOR (palavra dele, literal): "[verbatim]"
PROBLEMA AVANÇADO: [o que as tentativas antigas criaram de pior]
JÁ TENTOU: [lista curta]
BANT: budget [lido de onde] · decide [sozinho/com quem] · urgência [o que ele disse]
OBJEÇÕES JÁ DITAS: [quais]
O QUE FALTA CAIR: [a dúvida viva]
SESSÃO: [dia/hora/link] · CRM: [link do contato]
```

**A notificação pro closer** (com dedup de 30min): a mesma nota, resumida em 5 linhas, + *"abre lendo isso e ecoa; não faz ele repetir"* (o recebimento do bastão vive na soft-vendas-closer).

**A frase pro lead** (nunca no vácuo): *"boa, [Nome]! Na [dia às hora] o [closer/dono] te atende já sabendo do teu caso, você não vai precisar contar tudo de novo."*

**Devolução:** se o closer devolver o lead ("não tava qualificado"), isso é DEFEITO DO TOPO e vira LIÇÃO no prompt do agente: registra o que faltou colher e ajusta a árvore.

## 6. Mensagens de fronteira (as situações chatas, prontas)

- **Pediu preço cedo (acima do limiar):** *"valor a gente crava na conversa com [closer/dono], igual restaurante: primeiro o teu caso, depois a conta. Me adianta: hoje, qual a maior dificuldade com [tema]?"*
- **"Manda tudo por mensagem":** *"te mando o essencial, mas o que muda teu caso é conversa, não texto. [pré-qualificador]. Depois me diz o que bateu."*
- **Optout ("para de mandar"):** *"feito, [Nome], não te mando mais nada. Se um dia fizer sentido, é só chamar."* (taga, avisa, encerra)
- **Grosseria:** responde 1x com calma, sem espelhar; repetiu = encerra leve e taga.
- **Fora do escopo (jurídico, saúde, imprensa):** *"isso aqui eu não resolvo por mensagem, vou te passar com [humano] agora."* (escalada dura)
