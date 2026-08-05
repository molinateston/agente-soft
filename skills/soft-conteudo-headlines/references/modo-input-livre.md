# Modo Input Livre

> Como a skill atende clientes que NÃO têm Plano de Posicionamento empacado.

---

## Princípio raiz

Cliente em fase de teste, criador iniciante, ou especialista que quer rascunhar headline antes de fazer Plano, todos esses precisam de saída útil. Skill **não bloqueia** quem não tem fundação.

Mas a skill **avisa**: headlines geradas no modo input livre são **boas**, não cravadas. Pra cravar, precisa do Plano.

---

## Quando a skill entra em modo input livre

A skill detecta automaticamente em 3 cenários:

### Cenário 1, Cliente cola uma ideia solta

Exemplos:
- *"queria fazer um conteúdo sobre X"*
- *"tô pensando em postar sobre Y"*
- *"me ajuda a escrever um post sobre Z"*

Skill entende: cliente tem ideia, não tem fundação, quer headline.

### Cenário 2, Cliente cola conteúdo de referência pra modelar

Exemplos:
- Link de reel viral pedindo "modela isso"
- Print de carrossel de outro especialista
- Texto colado pedindo "headline parecida com essa"

Skill entende: cliente quer modelar engenharia, não tem fundação própria.

### Cenário 3, Cliente pede headline declarando que não tem Plano

Exemplos:
- *"não tenho Plano de Posicionamento ainda, só preciso de headline pra X"*
- *"tô começando, me ajuda com headline"*

Skill entende: cliente sabe que tá pulando etapa, quer headline mesmo assim.

---

## Fluxo do modo input livre

### Passo 1, Identifica o tipo de input

| Tipo | Sinal | Ação seguinte |
|---|---|---|
| Ideia solta | "queria fazer", "tô pensando em" | Pula pro Passo 2 |
| Conteúdo de referência | Link, transcript, print | Pula pro Passo 2 com nota de modelagem |
| Declaração explícita | "não tenho Plano" | Pula pro Passo 2 |

### Passo 2, 1 pergunta de nicho (única)

Skill faz **1 pergunta só**:

> *"Pra calibrar a linguagem, qual teu nicho?
>
> A) Saúde · B) Nutrição · C) Fisio/Personal · D) Estética · E) Jurídico · F) Terapia · G) Educação · H) Finanças · I) Marketing · J) Outro: descreve em 1 linha"*

Se cliente já mencionou nicho na mensagem anterior, skill **pula** essa pergunta.

### Passo 3, Decode da referência (se aplicável)

Se cliente colou conteúdo pra modelar, antes de gerar headlines a skill faz **3 leituras rápidas** internas (não mostra ao usuário, mas usa pra gerar):

1. **Objetivo da headline original:** o que ela está fazendo? Atrair? Atacar? Validar?
2. **Mecânica de persuasão:** qual gatilho dominante? Disrupção? Mistério?
3. **Padrão estrutural:** template da frase (qual dos 30 templates ela é)?

Aplica essa engenharia ao nicho do cliente.

### Passo 4, Gera headlines com 4 critérios v2

Mesma auditoria do modo Plano. Diferença: como não tem fundação empacada, a skill compensa com:

- **Tese inferida:** baseada na ideia/referência, infere uma tese provável
- **Inimigo inferido:** identifica o que a ideia/referência está atacando
- **Cliente inferido:** baseado no nicho + ideia
- **Lista do "não defendo":** vazia (sem amarra)

### Passo 5, Entrega + aviso

Output enxuto com headlines + aviso curto ao final:

```
**[Tema]**

1. [Headline]
2. [Headline]
3. [Headline]
4. [Headline]
5. [Headline]

---

*Headlines geradas em modo input livre, sem fundação empacada do Plano de Posicionamento. Pra headlines mais cravadas (com inimigo nominal real e tese central empacada), vale rodar o Plano. A skill `soft-plano-posicionamento` faz em 30-45 minutos.*
```

O aviso aparece **uma vez** por sessão. Se o cliente continuar gerando headlines no mesmo modo, skill não repete.

---

## Engenharia da modelagem (quando cliente cola referência)

Quando o cliente cola conteúdo de referência pra modelar, a skill aplica os 4 passos do princípio do método:

> *Decode the engineering. Identify what's triggered. Translate to Soft. Adapt.*

### Passo A, Decode a engenharia

Skill identifica:
- **Tipo de gatilho dominante** (qual dos 7)
- **Template estrutural** (qual dos 30)
- **Tese implícita** (o que a headline tá defendendo)
- **Tom** (clínico, polarizador, didático, narrativo)

### Passo B, Identifica o que aciona no leitor

Skill nomeia:
- O que o leitor sente em 2 segundos
- O que faz o leitor parar
- A emoção primária acionada

### Passo C, Traduz pro universo Soft

Skill converte:
- Mantém a engenharia
- Troca vocabulário pro nicho do cliente
- Filtra pelos 4 critérios v2 (target-leigo, mesa-sentado, etc.)

### Passo D, Adapta

Skill produz 3-5 versões adaptadas, todas auditadas.

### Exemplo prático de modelagem

**Cliente cola:** *"O CEO de R$50M que dorme 4h por noite e usa essa rotina."* (referência viral)

**Decode:**
- Gatilho: Autoridade B + Mistério
- Template: 7 (Por que [grupo específico] [problema])
- Tese: "Sucesso vem de rotina específica"
- Tom: Curiosidade + autoridade

**Cliente é nutricionista clínica.**

**Adaptação Soft:**

```
1. A nutri que atende 80 pacientes por semana e nunca passa de R$10k. Não é volume. É modelo.
2. A paciente que perdeu 12kg em 4 meses sem dieta restritiva. Não é genética. É leitura.
3. Por que paciente que paga R$800/consulta volta toda semana e a paciente do convênio não fideliza?
```

Cada uma audita pelos 4 critérios v2. Skill entrega só as que passam.

---

## Quando NÃO usar modo input livre

A skill **não** entra em input livre se:

- O cliente tem fundação destilada presente no projeto/conversa → vai pra modo Plano
- O cliente pede roteiro completo, copy, carta → aponta pra outra skill
- O cliente pede análise estratégica de feed → coach

---

## Limitações declaradas do modo input livre

A skill é honesta sobre as limitações:

1. **Inimigo inferido pode estar errado.** Sem Plano, skill chuta o que provavelmente é o inimigo. Pode estar fora.
2. **Sem lista "não defendo", risco de gerar headline contraditória.** Sem freio de filosofia, skill pode produzir headline tipo "como fazer X melhor" quando o cliente nem deveria defender X.
3. **Cliente final genérico.** Sem fundação, marcadores específicos podem faltar.

Por isso o aviso ao final da entrega: *"Pra cravar, vale rodar o Plano."*

---

## Princípio final do modo input livre

Atende sem bloquear. Avisa sem assustar. Direciona sem empurrar.

O modo input livre **abre porta** pro cliente conhecer o trabalho da skill. Headlines saem decentes. Quando o cliente quiser headlines cravadas, skill mostra o caminho (Plano).

Função: **conversão de uso casual em uso estruturado.**

---

> **Atender sem Plano NÃO é atender sem gate.** Mesmo no modo input livre, a peça passa pelo Crivo (`shared-references/crivo/03-gate-cub.md`) antes de sair. A falta de fundação empacada baixa a precisão da peça, nunca dispensa o gate de saída. Sem passar no Crivo, a peça não foi entregue.
