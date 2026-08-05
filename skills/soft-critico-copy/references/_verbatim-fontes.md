# Verbatim · toda copy Soft ancora em fonte canonica do dono

A copy Soft NAO inventa fato do negocio. Tese, prova, nome de mecanismo, numero, historia, transformacao tem lastro em fonte canonica.

## Fontes na ordem

1. aula-webinar-AAA-gravada.md (verbatim real da aula do webinar do dono, ~1h49 com transcricao literal). Path default: /home/cloud/.openclaw/brain/conteudo/aula-webinar-AAA-gravada.md

2. NARRATIVA-CANONICA.md (a fonte da verdade da tese-mae). Path: /home/cloud/.openclaw/brain/NARRATIVA-CANONICA.md

3. Camadas: CANONICO.md, ARSENAL-DE-DESEJOS.md, PROMESSA-MAXIMA.md, BANCO-DE-MATERIA-PRIMA.md, DESEJOS-QUE-ESCALAM.md

4. plano-de-posicionamento do dono (se ja existe, path informado pela skill chamadora)

## Como grepar

Para cada afirmacao grande da copy, extrai 2-3 termos-chave (nome de mecanismo, numero, prova, historia) e grepa nas fontes:

  grep -i -l "TERMO" /home/cloud/.openclaw/brain/**/*.md

Se nenhum arquivo retorna, e chute. Reprova.

## Provas canonicas validadas do Leo (exemplo, nao copia)

Estes sao os fatos verbatim que aparecem na aula do webinar dele. Ilustram o padrao "afirmacao grande + prova ao lado":

- dezenas de milhoes gerados em dez anos (na agencia).
- Escola de gestao: 8 digitos em 2 anos, com 5 pessoas, 1 funil so.
- 1 ano sem postar e seguiu vendendo.

Nao use estes numeros pra cliente que nao e o Leo. Cada dono tem os seus. Estao aqui so como MODELO da estrutura "numero + contexto + peso".

## Como o dono novo declara as provas dele

A skill chamadora, quando trabalha pra outro dono, precisa do path do brain dele. Padrao esperado:

- <brain-do-dono>/conteudo/aula-webinar-AAA-gravada.md (se ja tem aula gravada)
- <brain-do-dono>/NARRATIVA-CANONICA.md (a tese-mae dele)
- <brain-do-dono>/plano-de-posicionamento.md (se ja rodou soft-plano-posicionamento)

Se o dono nao tem nada disso ainda, o filtro Verbatim reprova qualquer promessa grande e sugere: "roda soft-plano-posicionamento antes, precisa da tese-mae ancorada."

## O criterio duro

- Numero solto sem prova ao lado: reprova.
- Nome de mecanismo que nao existe na fonte: reprova.
- Historia inventada: reprova.
- Promessa generica sem dono: reprova.

O que passa: afirmacao com nome, numero, mecanismo ou historia que a fonte confirma.
