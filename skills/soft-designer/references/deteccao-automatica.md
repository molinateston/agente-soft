# Detecção automática de função do slide

A skill recebe copy pronta e precisa inferir a função de cada slide para escolher o layout correto. Esta tabela é autoritativa. Aplique **na ordem**, a primeira regra que casar define a função.

## Ordem de detecção

| Ordem | Condição (sinais na copy do slide) | Função | Layout |
|---|---|---|---|
| 1 | É o primeiro slide do carrossel | `hook` | `hook` |
| 2 | Verbo imperativo ("comente", "manda", "responde") + código/palavra-chave em destaque ("comente 3C", "escreva EU QUERO") | `cta` | `cta` |
| 3 | Número grande isolado + unidade (R$, %, anos, clientes, x) OU depoimento entre aspas | `prova` | `prova` |
| 4 | Estrutura "X não é Y" / "troque X por Y" / "ao invés de X, Y" OU lista com antes/depois | `lista-substitui` | `lista-substitui` |
| 5 | Lista numerada (1., 2., 3.) OU etapas nomeadas OU passo-a-passo | `metodo` | `metodo` |
| 6 | Pergunta retórica isolada OU frase única de 3-10 palavras quebrando o ritmo anterior | `virada` | `virada` |
| 7 | Primeira pessoa + confissão temporal ("eu passei X anos", "durante X tempo eu...") | `confissao` | layout Manuscrito Cru |
| 8 | Produto/oferta nomeada + verbo de disponibilidade ("disponível", "abri", "vaga para") | `oferta` | `oferta` |
| 9 | Lista de dores ("você tenta X, tenta Y, tenta Z") OU enumeração de frustrações | `problema` | `problema` |
| 10 | Nenhuma regra acima casou | `conteudo-generico` | layout mais próximo da família, padding 100px, simetria total |

## Protocolo de execução

1. Para cada slide, aplique a tabela na ordem e pare na primeira que casar.
2. **Antes de gerar HTML**, declare a lista de funções detectadas ao usuário no seguinte formato:

```
Detectei:
- Slide 1, hook
- Slide 2, problema
- Slide 3, virada
- Slide 4, metodo
- Slide 5, prova
- Slide 6, cta
Vou desenhar assim. Se alguma estiver errada, me avise antes do preview.
```

3. Se o usuário corrigir, respeite a correção sem argumentar.
4. Se o usuário não responder em 1 turno, assuma aprovado e siga.

## Quando a detecção é ambígua

Se dois slides consecutivos caem na mesma função (ex: dois `problema` seguidos), está correto, a repetição é intencional na copy. **Não force variação** escolhendo função diferente só pra diversificar. A copy manda.

Se um slide tem sinais de duas funções (ex: número grande + pergunta retórica), a ordem da tabela resolve, quem aparece primeiro ganha. Não improvise.

## O que esta tabela NÃO faz

- Não reescreve copy
- Não decide família visual (isso é do Passo 2 do SKILL.md)
- Não decide cor de accent
- Não decide tipografia
- Não julga se a copy é boa, apenas classifica
