# O GATE do plano de webinar + os Anti-Patterns + a auditoria do Modo B

## Índice
- Passo A, AUDITORIA de webinar existente (Modo B)
- O GATE, linha a linha
- Anti-Patterns (sintoma → correção)

## Passo A, AUDITORIA de webinar existente (Modo B)

"Meu webinar não converte / gravando há meses, venda baixa / quero refinar": **NÃO reescreve do zero.** Audita, acha vazamentos, reescreve **só os blocos quebrados**, mantém o que funciona. Pede: vídeo/transcrição + métricas (cadastros, atendentes, retenção, compras, ROAS). Percorre o mapa bloco a bloco (abertura, autoridade/história, diagnóstico, big domino, mecanismo, provas, transição, oferta/stack, ancoragem, garantia, escassez/CTA, Q&A, chat): pra cada, régua do campeão → vazamento típico → premissa violada. Cruza cada drop da retenção com o bloco no timestamp. Saída = o trio (bloco + sintoma + premissa) priorizado + os blocos reescritos na pele do nicho. (`references/analise-webinario-existente.md`.)


## O GATE (roda por dentro, silencioso, NÃO imprime)
Só doc com **VEREDITO=PASSA** vai pro usuário. Um ✗ refaz **o item**, não o doc:

| Check | Passa se |
|---|---|
| **É hora de webinar** | régua rodada; faltou um = recomendou voltar pro funil |
| **HERANÇA inteira** | Seção 0 absorve o posicionamento INTEIRO inline, na voz do dono; só apontar = ✗ |
| **OFERTA = STACK rica na tripartição** | módulos (pelo que VIRA) × cursos (nome próprio + preço real) × UM bônus sem preço; VÁRIOS itens desejáveis; ≥1 vale mais que o principal; objeção de mecanismo foi PRA DENTRO; cada componente mata UMA objeção nomeada; equação coberta (1 TEMPO + 1 ESFORÇO) |
| **15-primeiros + 2 moedas + rede + soma riscada** | bônus de 15-primeiros em camadas (turma/15/10); desconto e bônus SEPARADOS; N = capacidade real; rede pro 16º; soma riscada na tela com cada parcela checável |
| **PUV + jornada em passos** | PUV no template puxando o mecanismo NOMEADO; passos pelo que VIRA (escada de identidade), cada um headline + prova; clímax = TIRA mais trabalho |
| **Garantia + frame** | prato do cardápio pelo ticket; frame "período de experiência"; maior que a objeção e não mais |
| **Diagnóstico + Mecanismo na estrutura REAL** | Diagnóstico (externo→filosófico→interno→causa→implicação→armadilhas→inimigo→absolvição→dobradiça) E Mecanismo como sequência, em LISTAS, da Herança; 4 tempos por afirmação; Faca Soft. **ZERO "3 viradas"** = ✗ |
| **Big Domino na fórmula + 3 momentos** | fórmula fixa (nova oportunidade nunca melhoria); frase LITERAL nos 3 momentos |
| **UMA promessa** | uma transformação; desejo+mecanismo−objeção |
| **Mecanismo nomeado (anti-rótulo)** | fenômeno concreto ANTES do nome; passa no "apaga o nome, sobra fenômeno?" |
| **Abertura completa** | título "Como [resultado] sem [medo]" + 5 ganchos · premise · USP falada S10 · Mundo Ideal (cena+número+pergunta do ROI) |
| **Persona + crenças rotuladas** | nome+cena+mentira+desejo de baixo, herdada; cada crença INTERNA ou EXTERNA |
| **Nível de consciência** | qual dos 6; se 6º, soluções-que-viraram-peso somadas num inimigo |
| **Provas + PROVA EXTERNA reais** | cases reais (nome+nº+prazo); 5 slots (vazios `[A CONFIRMAR]`); inventado = ✗ (Lei 5) |
| **Modo pelo estágio** | perpétuo vs ao vivo pela régua + estágio; ao vivo valida → grava → perpetua |
| **A conta fecha** | meta ÷ ticket → ÷ conversão → ÷ comparecimento; exemplo "(NÃO é dado seu)" |
| **Canal pela regra + CTA com destino** | ≤~3k checkout / >3k 1:1; Seção 8 adaptada ao canal |
| **Pitch completo** | semeadura, ancoragem certa, stack visível, cadeia de SINs, queda com reason-why+lastro, reduzir ao ridículo com objeto real, escassez+rede, identidade+inação, 3 CTAs, botão no 1º |
| **INSUMOS ORGANIZADOS** | Seção 9 no fim, peças soltas reutilizáveis, não resumo |
| **Não inventa (Lei 5)** | furo = `[A CONFIRMAR]` no lugar exato; zero plausível |
| **Output DENSO (Lei 6)** | tabelas/listas, não prosa; zero meta-narração/bastidor/"isto serve para"; sem tabela de gate na saída |
| **3 perguntas do Harry + C/U/B** | dá pra VER a cena · dá pra FALSIFICAR · SÓ ele assina; Clareza · Único · Benefício |
| **Naming honesto** | todo nome é do dono ou "(nome Soft: a definir)" |
| **Nicho regulado** | SAÚDE/JURÍDICO: prova com ALUNO nunca paciente; mecanismo no lugar de cura; gate regulado (`shared-references/crivo/`); N/A se não-regulado |
| **Anti-IA (HARD)** | zero em-dash · zero "travar/travado/destravar" (exceto aspa literal) · sem frase-emoldura · sem verbo-clichê de hype · sem jargão "jornada/mindset" na copy. **No chat: CTRL+F do em-dash e da família "travar".** No Code: `python3 scripts/lint_copy.py` na copy do pitch. |
| **VEREDITO** | **= o PIOR item.** Um ✗ = REFAZ o item. Só tudo-✓ = PASSA. |

## Anti-Patterns (sintoma → correção)
| Sintoma | Correção |
|---|---|
| Despejou os blocos numa mensagem só | Um bloco por vez, com exemplos, PARA (cold start é exceção) |
| Recomendou webinar sem checar a régua | Roda a régua; faltou um = aviso consultivo de 1 linha e segue (SEM porteiro) |
| **Plano virou RESUMO que aponta pro posicionamento** | HERDA inteiro inline (Seção 0) |
| **Oferta magra / um curso só / tudo virou "bônus"** | STACK rica: VÁRIOS itens desejáveis; módulos × cursos (preço real) × UM bônus sem preço |
| **Faltou bônus-âncora maior que o produto** | ≥1 item que sozinho vale mais que o núcleo (vira o motivo da compra) |
| **Misturou desconto com bônus de 15-primeiros** | 2 moedas separadas: desconto pra todos / bônus pros que correm |
| **Esqueceu a rede pra quem perde a corrida** | "não se preocupe se não ficar entre os 15, o desconto já é gritante" |
| **Soma não aparece riscada / número inflado** | soma riscada na tela, cada parcela CHECÁVEL; número grande nunca acima de crível |
| **Módulo/curso numerado "Módulo 1/Curso 2"** | Nomeia pelo resultado; cursos por NOME próprio |
| **Faltou PROVA EXTERNA** | 5 slots; vazios `[A CONFIRMAR]`, nunca inventa |
| **Ensino em "3 viradas"** | Diagnóstico (externo→filosófico→interno) + Mecanismo como SEQUÊNCIA; 4 tempos é só o jeito de ensinar |
| **Entregou sem INSUMOS ORGANIZADOS** | Seção 9 no fim, peças soltas |
| Chutou narrativa/mundo/fascinations | Bloco 3c arranca com pergunta dirigida |
| Duas promessas | UMA transformação; o resto vira conteúdo dentro do mecanismo |
| Nomeou o mecanismo antes do fenômeno | Crava o fenômeno por escrito primeiro |
| Mecanismo como "melhoria" | Reescreve como nova oportunidade |
| Mundo Ideal abstrato | Cena + número + a pergunta do ROI; objeto, lugar, reação |
| Crenças sem rótulo | Rotula INTERNA × EXTERNA |
| Perpétuo "porque escala" sem validar | ao vivo valida → grava → perpetua |
| 3k+ no checkout | Acima de ~3k qualifica, fecha no 1:1 |
| Clímax = a aula que ensina mais | Clímax = o passo que TIRA mais trabalho |
| Stack inflado "pra parecer mais" | Cada item mata objeção nomeada OU ancora com preço real |
| Bônus pra consertar objeção de mecanismo | Vai PRA DENTRO da aula |
| Chamou de "garantia" | Frame "período de experiência" |
| Verbalizou o total parcelado | A parcela é o preço |
| Botão cedo na tela | Botão só no 1º CTA |
| **Inventou número/fala "plausível"** | Só real; sem fonte, `[A CONFIRMAR]` |
| **Doc com prosa/meta-narração (fere Lei 6)** | Tabelas e listas; corta "isto serve para", bastidor, racional |
| Pediu refino e reescreveu do zero | Modo B: audita, reescreve só o quebrado (Passo A) |
