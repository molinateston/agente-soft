
# Soft Contratos · Consultoria

Gera contrato de prestação de serviço de consultoria/mentoria pronto pra assinar.

## Dois modos, saiba qual usar

### Modo SOFT ENXUTO (DEFAULT)

Quando aplicar: **por padrão, em todo pedido**, salvo quando o usuário explicitamente pedir versão robusta ou o caso indicar necessidade clara de blindagem reforçada.

Características:
- **11 cláusulas** (modelo validado em vendas reais)
- Linguagem direta, sem juridiquês excessivo
- Tom flexível em pagamento, sem multa, sem juros, sem suspensão automática agressiva. Cláusula de atraso prevê **conversa primeiro, pausa só se sumir**.
- Sem citações ao CDC, LGPD, Código Civil no corpo do contrato
- Tamanho típico: 3 a 5 páginas

Estrutura das 11 cláusulas:
1. Objeto do contrato
2. Escopo dos serviços (com subitens por sessão e suporte)
3. Prazo
4. Investimento (forma de pagamento)
5. Obrigações do Contratante
6. Obrigações do Contratado
7. Não garantia de resultados
8. Cancelamento e reembolso
9. Atraso no pagamento (sem multa)
10. Confidencialidade
11. Foro

Use sempre que:
- Cliente é uma pessoa de confiança que o usuário já validou
- Ticket entre R$ 1k e R$ 15k
- Programa no modelo Soft padrão (consultoria de implementação, micro treinamento, etc.)
- Contratante é PF ou MEI/PJ pequena

Ver `references/modo-soft-enxuto.md` para o template completo.

### Modo ROBUSTO

Quando aplicar: **apenas quando**:
- Usuário pedir explicitamente versão robusta, blindada, ou completa
- Ticket acima de R$ 15k
- Contratante é PJ de médio/grande porte ou desconhecida do usuário
- Há histórico de risco específico (cliente conhecido por calote, briga, etc.)
- Há tratamento de dados pessoais de terceiros (consultoria que toca em base do cliente)
- Há entregáveis com propriedade intelectual relevante

Características:
- **13 cláusulas** com proteção anti-calote completa
- Multa moratória 2% + juros 1% + correção + protesto + título executivo
- Vencimento antecipado, cláusula penal, limitação de responsabilidade
- Cláusulas de LGPD operador/controlador quando aplicável
- Tamanho típico: 8 a 12 páginas

Ver `references/estrutura-base.md` e `references/clausulas-anti-calote.md` para o template completo.

### Antes de gerar, confirmar o modo

Se o pedido não deixar claro qual modo usar, perguntar ao usuário. Default: Soft Enxuto. Pergunta sugerida:

> "Você quer no modelo Soft Enxuto (mais flexível, sem multa, baseado no que já funcionou) ou Robusto (com proteção anti-calote completa)? Default é Soft Enxuto."

Não perguntar de novo se o usuário já indicou claramente no pedido inicial.

---

## Quando ativar esta reference

Sempre que o pedido envolver **gerar, revisar ou adaptar contrato de prestação de serviço de consultoria/mentoria**. Inclui pedidos diretos ("preciso de um contrato") e indiretos ("fechei cliente, como protejo o recebimento?").

**Não ativar pra:**
- NDA isolado ou termo de confidencialidade puro
- Cessão de direitos autorais
- Contrato internacional (cliente fora do Brasil)
- Contrato societário, M&A, vesting
- Contrato CLT ou PJ com vínculo empregatício
- Termo de uso de plataforma SaaS

Nesses casos, avisar o usuário que precisa de advogado especializado, não improvisar.

---

## Workflow

### Etapa 1 · Definir modo (se ambíguo)

Se o pedido não deixou claro, perguntar Soft Enxuto vs Robusto. Default: Soft Enxuto.

### Etapa 2 · Entrevista de escopo

Coletar variáveis. Se o usuário já trouxe parte das informações, extrair do texto e confirmar, não perguntar de novo.

**Bloco A · Partes**
1. Nome / Razão social da **Contratada**
2. CPF/CNPJ, endereço da Contratada
3. Tipo de Contratante: PF ou PJ
4. Nome / Razão social do **Contratante**
5. CPF/CNPJ, endereço, email do Contratante

**Bloco B · Serviço**
6. Formato (escolher um ou combinar):
   - Mentoria/Consultoria 1:1 ao vivo
   - Mentoria em grupo ao vivo
   - Infoproduto gravado
   - Feito-pra-você (consultoria implementada)
7. Nome comercial do programa
8. Descrição objetiva do escopo
9. Quantidade de sessões / período de acompanhamento

**Bloco C · Valor e pagamento**
10. Valor total
11. Modalidade:
    - À vista
    - Parcelado (cartão ou boleto)
    - Entrada + meta (com 3 variantes, ver Modalidade Entrada+Meta abaixo)
    - Recorrência mensal
12. Datas / cronograma

**Bloco D · Casos específicos**
13. Tem garantia? Prazo e condição?
14. Foro preferencial (default: cidade da Contratada)
15. Modo: Soft Enxuto (default) ou Robusto

**Regra de ouro:** se faltar informação crítica, perguntar. Nunca inventar CPF, CNPJ, endereço, email ou valor.

### Etapa 3 · Montagem

**Para modo Soft Enxuto:**
1. Abrir `references/modo-soft-enxuto.md` como template base
2. Preencher variáveis nos campos marcados
3. Aplicar variantes de pagamento conforme escolha
4. Aplicar tom de atraso flexível (cláusula 9 sem multa)

**Para modo Robusto:**
1. Abrir `references/estrutura-base.md` (13 cláusulas)
2. Aplicar `references/clausulas-por-formato.md` na Cláusula 1ª
3. Aplicar `references/clausulas-pagamento.md` na Cláusula 5ª
4. Aplicar `references/clausulas-anti-calote.md` na Cláusula 6ª
5. Aplicar `references/clausulas-pf-vs-pj.md` se Contratante for PJ

### Etapa 4 · Entrega

Entregar em **dois formatos**:

1. **No chat**, markdown estruturado pra revisão rápida
2. **Arquivo .docx**, pronto pra D4Sign/Clicksign/Autentique

Salvar em `/mnt/user-data/outputs/contrato-[nome]-[data].docx` e apresentar com `present_files`.

**Fallback (ambiente sem `/mnt/user-data/outputs`):** se o diretório de saída não existir (rodando fora do Claude Chat, ex. CLI/bot), não tenta gravar `.docx` nem chamar `present_files`, entrega o contrato como **markdown estruturado inline no chat**, pronto pra copiar pro D4Sign/Clicksign/Autentique. O conteúdo das cláusulas é o mesmo; muda só o formato de entrega.

Após entregar, **avisar o usuário**:

> Este contrato é um modelo testado, mas não substitui revisão jurídica em casos específicos. Para ticket alto, cliente PJ de médio/grande porte, ou risco específico, vale passar por um advogado antes de assinar.

Aviso obrigatório em todo contrato gerado.

---

## Modalidade Entrada + Meta, 3 variantes

Quando o pagamento é fracionado em entrada + saldo condicionado a meta, perguntar qual variante:

### Variante A · Meta mensal
"Saldo devido quando o Contratante atingir R$ X de faturamento **em um único mês**."
Default antigo. Mais restritivo. Usar quando o usuário pedir explicitamente.

### Variante B · Meta acumulada (DEFAULT)
"Saldo devido quando o Contratante atingir R$ X de faturamento **em valor acumulado**, podendo ser composto por um ou mais contratos/vendas geradas com aplicação da estratégia, sem exigência de mês único."
Mais flexível. Mais comum em vendas Soft reais. Default quando não houver indicação contrária.

### Variante C · Meta por evento específico
"Saldo devido quando o Contratante fechar o primeiro cliente do programa Soft com pagamento confirmado de valor igual ou superior a R$ Y."
Quando a meta é um marco binário, não financeiro.

### Cláusulas de proteção da meta (sempre incluir em todas as variantes)

```
4.X. O atingimento da meta é condição de timing de pagamento, não condição
de existência da obrigação. Decorrido o prazo de 12 (doze) meses contados
da assinatura deste contrato sem o atingimento da meta, o saldo torna-se
exigível independentemente da ocorrência da meta.

4.X. A omissão do CONTRATANTE em comunicar o atingimento da meta não o
exime da obrigação. Verificado o atingimento por qualquer meio (declaração
pública, post, conteúdo publicado), a parcela torna-se imediatamente
exigível.
```

Essas duas cláusulas são **obrigatórias em qualquer variante de entrada+meta**. Sem elas, o saldo fica nebuloso.

---

## Cláusula 9 (Atraso), 3 tons

A cláusula de atraso é o ponto onde Soft Enxuto e Robusto mais divergem.

### Tom A · Soft Flexível (DEFAULT no modo Soft Enxuto)

```
9. ATRASO NO PAGAMENTO

Em caso de atraso no pagamento de qualquer parcela, as partes buscarão
alinhamento sobre nova data de vencimento. Permanecendo o atraso por
período superior a 15 (quinze) dias sem comunicação ou repactuação, o
CONTRATADO poderá pausar a execução dos serviços e do suporte até a
regularização.
```

Sem multa. Sem juros. Sem suspensão automática agressiva. Conversa primeiro.

### Tom B · Padrão (no modo Robusto)

Multa 2% + juros 1% ao mês + suspensão 5 dias + vencimento antecipado 15 dias. Ver `references/clausulas-anti-calote.md`.

### Tom C · Reforçado

Tom B + cláusula penal compensatória + autorização de protesto + título executivo. Usar quando ticket muito alto ou cliente de risco. Ver variações em `references/clausulas-anti-calote.md`.

---

## Princípios de escrita

### Linguagem
- Português brasileiro
- Modo Soft Enxuto: direto, frases curtas, sem juridiquês. Nada de "ad cautelam", "ex vi", "data venia"
- Modo Robusto: técnico mas legível
- Nunca usar linguagem de marketing Soft no corpo do contrato. nome de método/programa só aparece como nome próprio do programa do dono, não como conceito

### Estrutura visual
- Modo Soft: cláusulas numeradas em decimais (1, 2, 3...) com subitens 1.1, 1.2
- Modo Robusto: ordinais (1ª, 2ª, 3ª...) com subitens decimais
- Negrito nas palavras-chave
- Espaço entre cláusulas

### Não garantia de resultado, obrigatória em ambos os modos
**Nunca** prometer resultado financeiro específico no contrato. Cláusula deve deixar claro que é obrigação de meio, não de fim.

Exceção: se o usuário **explicitamente** quiser garantia de resultado, alertar sobre risco jurídico antes de redigir.

---

## Regras duras

1. **Nunca inventar dados das partes**, se faltar CPF, endereço, etc.  perguntar ou deixar `[a preencher]`.
2. **Soft Enxuto é o default**, só ir pra Robusto se o caso ou o usuário indicar.
3. **Em entrada+meta, sempre incluir as cláusulas de timing vs existência e de comunicação**, protegem o usuário sem precisar de blindagem agressiva.
4. **Nunca prometer "blindagem total"**, contrato bem feito reduz risco, não elimina.
5. **Sempre incluir o aviso pós-entrega** sobre revisão por advogado.
6. **Proteção da Contratada como default**, se invertido, avisar e confirmar.
7. **Nunca incluir cláusulas abusivas claras**, retenção integral em rescisão imotivada na primeira semana, por exemplo.
8. **Nunca gerar contrato sem foro definido**, default: comarca da cidade da Contratada.
9. **Linguagem de marketing fica fora do contrato**, peça jurídica é peça jurídica.

---

## Casos especiais

### Cliente já tem modelo próprio que funcionou
Se o usuário compartilhar um modelo que já usou em vendas reais, **seguir esse modelo** como base, não substituir pela estrutura da skill. Aplicar apenas ajustes pontuais necessários ao caso novo (modalidade de pagamento diferente, formato diferente). Modelos validados em vendas reais valem mais que template teórico.

### Cliente quer contrato pra serviço já em andamento
Incluir cláusula de ratificação retroativa, o contrato passa a reger relação que já existia desde data X.

### Cliente quer adicionar cláusula específica
Avaliar se é juridicamente válida e se não cria contradição. Se for válida, incluir. Se for de risco (cláusula penal acima de 10% do total em PF consumidora, por exemplo), explicar antes.

### Cliente é estrangeiro ou serviço fora do Brasil
Recusar e orientar advogado de direito internacional.

### Cliente PJ de grande porte ou ticket acima de R$ 15k
**Default vira Robusto.** Avisar o usuário e explicar por quê.

---

## Referências

### Para modo Soft Enxuto (DEFAULT)
- `references/modo-soft-enxuto.md`, template completo das 11 cláusulas

### Para modo Robusto
- `references/estrutura-base.md`, esqueleto das 13 cláusulas
- `references/clausulas-por-formato.md`, por formato de serviço
- `references/clausulas-pagamento.md`, por modalidade
- `references/clausulas-anti-calote.md`, proteção contra inadimplência
- `references/clausulas-pf-vs-pj.md`, diferenças PJ
- `references/glossario-juridico.md`, termos técnicos
