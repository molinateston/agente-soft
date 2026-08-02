# PF vs PJ · Ajustes Quando o Contratante é Pessoa Jurídica

A maior parte do contrato é igual para PF e PJ. Mas há diferenças jurídicas importantes que mudam a redação de cláusulas específicas.

---

## Diferença 1 · Não se aplica o Código de Defesa do Consumidor (CDC)

Quando o Contratante é **PJ que contrata o serviço como insumo do próprio
negócio** (não como destinatário final), não se aplica o CDC. Isso muda:

### Direito de arrependimento (Cláusula 7ª)

Para PJ, **não há direito legal de arrependimento de 7 dias** mesmo em
infoproduto. Garantia, se existir, é apenas a contratualmente oferecida.

Redação adaptada para infoproduto + PJ:

```
7.1. As partes acordam expressamente que, por se tratar de contratação
entre pessoas jurídicas no exercício de suas atividades empresariais, não
se aplica o direito de arrependimento previsto no art. 49 do Código de
Defesa do Consumidor, dada a inaplicabilidade do regime consumerista à
relação.

7.2. [Se a Contratada oferece garantia comercial independente:] A
CONTRATADA oferece, em caráter de cortesia comercial, prazo de [X] dias
contados da liberação do acesso para solicitação de devolução, [com as
mesmas condições do regime PF].
```

### Foro de eleição (Cláusula 13ª)

Para PF consumidora, o foro é o domicílio do CONTRATANTE (art. 101 CDC). Para
PJ, vale o foro de eleição contratual:

```
13.1. As partes elegem o foro da Comarca de [CIDADE DA CONTRATADA], Estado
de [UF], para dirimir quaisquer questões oriundas do presente contrato, com
renúncia expressa a qualquer outro foro, por mais privilegiado que seja.
```

Em PJ a Contratada pode definir o foro mais conveniente pra si.

### Multa moratória

Pode ir até 10% em B2B, mas recomenda-se manter em 2% por padrão pra evitar
discussão sobre abusividade. Quando o ticket é alto (acima de R$ 50.000), é
razoável aumentar para 5%.

---

## Diferença 2 · Tributação e Nota Fiscal

Quando o Contratante é PJ, há possibilidade de retenções tributárias na
fonte (IR, INSS, CSLL, PIS, COFINS, ISS) dependendo do regime tributário
das partes e do município.

Cláusula a incluir:

```
5.8. Tributos e retenções. A CONTRATADA emitirá Nota Fiscal de Serviço
Eletrônica (NFSe) referente a cada pagamento recebido. Eventuais retenções
tributárias na fonte (Imposto de Renda, INSS, CSLL, PIS, COFINS, ISS),
quando legalmente devidas em razão do regime tributário do CONTRATANTE,
serão de responsabilidade do CONTRATANTE, com correspondente dedução do
valor bruto pago e fornecimento dos comprovantes de retenção à CONTRATADA
no prazo legal.

5.9. As partes declaram seus respectivos regimes tributários no ato da
contratação:

a) CONTRATADA: [Simples Nacional / Lucro Presumido / Lucro Real / MEI];
b) CONTRATANTE: [Simples Nacional / Lucro Presumido / Lucro Real / MEI].
```

Quando o CONTRATANTE é PF, esse item 5.8/5.9 não se aplica.

---

## Diferença 3 · Qualificação e representação

### PF Contratante
- Pede dados pessoais completos (estado civil, profissão)
- Assinatura individual ou com cônjuge se outorga uxória for relevante (em
  contratos de grande valor, recomendar)

### PJ Contratante
- Pede dados da empresa (CNPJ, sede)
- Pede dados do **representante legal** que assina (sócio administrador,
  procurador com poderes específicos, etc.)
- Sempre **anexar procuração** quando quem assina não é sócio administrador
  com poderes estatutários para tanto.

Cláusula de declaração de poderes:

```
[na qualificação, após dados do representante:]
... cujos poderes para assinatura deste instrumento decorrem [do Contrato
Social da empresa / da Procuração datada de DD/MM/AAAA, anexa ao presente
instrumento como parte integrante].
```

---

## Diferença 4 · Confidencialidade reforçada (Cláusula 9ª)

Em B2B, geralmente o nível de informação sensível trocada é maior (números
financeiros, estratégias comerciais, dados de clientes do CONTRATANTE). A
confidencialidade pode ser ampliada:

```
9.5. Em razão da natureza empresarial da relação, considera-se
particularmente sensível qualquer informação relativa a:

a) Dados financeiros e contábeis do CONTRATANTE;
b) Lista de clientes, fornecedores e parceiros do CONTRATANTE;
c) Estratégias comerciais, planos de expansão e projetos em desenvolvimento;
d) Tecnologias proprietárias, processos internos e know-how;
e) Quaisquer outras informações expressamente marcadas como confidenciais
   no momento de seu compartilhamento.

9.6. As obrigações desta cláusula vinculam não apenas as partes, mas
também seus respectivos sócios, administradores, empregados, prestadores
de serviço e parceiros que tenham acesso às informações em razão do
contrato, cabendo a cada parte assegurar-se de que tais pessoas observem
as mesmas obrigações de sigilo.
```

---

## Diferença 5 · Limitação de responsabilidade

Em PJ, é prática comum limitar a responsabilidade financeira de cada parte
ao valor do contrato. Em PF consumidora, esse tipo de limitação pode ser
considerado abusivo.

Para PJ, incluir:

```
12.7. Limitação de responsabilidade. A responsabilidade total de cada parte
perante a outra, por quaisquer reivindicações decorrentes deste contrato
(contratuais ou extracontratuais), fica limitada ao valor total
efetivamente pago ou devido sob este contrato, excluindo-se danos
indiretos, lucros cessantes e danos consequenciais, salvo em hipóteses de
dolo, fraude ou violação de propriedade intelectual e confidencialidade.
```

Em PF, **não incluir** essa cláusula. É juridicamente mais frágil.

---

## Diferença 6 · Compliance e LGPD

Em B2B, especialmente quando há tratamento de dados de terceiros (ex.:
consultoria que toca em base de clientes do Contratante), expandir a
Cláusula 11ª:

```
11.5. Quando, em razão da execução do contrato, a CONTRATADA tiver acesso
a dados pessoais de titulares vinculados ao CONTRATANTE (clientes,
empregados, fornecedores), as partes reconhecem que:

a) O CONTRATANTE atua como CONTROLADOR dos dados, conforme art. 5º, VI da
   LGPD;
b) A CONTRATADA atua como OPERADORA, conforme art. 5º, VII da LGPD;
c) A CONTRATADA tratará tais dados exclusivamente para finalidade da
   execução do contrato, segundo instruções do CONTRATANTE, e adotará
   medidas técnicas e administrativas de segurança razoáveis;
d) A CONTRATADA não fará uso secundário dos dados nem os compartilhará com
   terceiros sem autorização do CONTRATANTE, salvo obrigação legal;
e) Encerrado o contrato, a CONTRATADA devolverá ou eliminará os dados em
   sua posse, mantendo apenas o necessário para cumprir obrigações legais
   subsistentes.
```

Em PF Contratante sem essa especificidade, a cláusula 11ª padrão é
suficiente.

---

## Resumo de decisão

| Aspecto | PF (consumidor) | PJ (B2B) |
|---|---|---|
| CDC se aplica | Sim | Não, salvo se PJ for destinatária final |
| Garantia 7 dias infoproduto | Obrigatória | Não obrigatória |
| Foro | Domicílio do consumidor | Eleição contratual |
| Multa moratória máxima | 2% | Até 10% (recomendar 2%) |
| Retenções tributárias | Não | Possíveis — incluir cláusula |
| Limitação de responsabilidade | Não incluir | Incluir |
| LGPD operador/controlador | Cláusula simples | Cláusula expandida |
| Confidencialidade ampliada | Padrão | Reforçada |
| Documentação adicional | RG/CPF | Contrato Social + procuração se aplicável |

---

## Quando o Contratante é Microempreendedor Individual (MEI)

MEI é PJ, mas com perfil de risco e capacidade econômica próximos ao de PF.
Recomendação:

- Usar template PJ
- **Não** elevar multa moratória além de 2%
- **Não** incluir limitação de responsabilidade
- Manter retenções tributárias (item 5.8/5.9)
- Foro pode ser contratual (PJ)
