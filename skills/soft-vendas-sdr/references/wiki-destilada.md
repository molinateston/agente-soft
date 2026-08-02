# Wiki destilada — o que o SDR consulta em vez de ler PDF cru

O SDR nunca lê o material bruto do dono (PDF, prompt gigante, transcrição inteira) toda vez que responde. Fonte crua enche o contexto de lixo e faz o bot citar coisa errada ou desatualizada. Em vez disso, um processo separado (cron/rotina) destila as fontes numa wiki curta, e o SDR consulta só essa wiki através de uma ferramenta de busca (`buscar_conhecimento`).

## As duas camadas da wiki

**Conhecimento geral** — fatos do produto: preço, formato, garantia, prazo, o que está incluso, escassez real (vaga/turma/prazo). Curto, direto, sempre a versão vigente (nunca duas versões de preço coexistindo).

**Conhecimento de venda** — como o time trata cada objeção, destilado de conversas reais que já converteram. No modo pós-webinar, o SDR busca o padrão do tema ("objeção de preço", "objeção de tempo", "já tentei outros métodos") e imita o ESTILO de resposta do time, mantendo a própria voz — não copia frase pronta robótica, aprende o padrão.

## Como se monta

1. Junta as fontes: PUV da oferta, tabela de preço aprovada, FAQ, objeções mais comuns e a resposta que funcionou (de calls/DMs reais).
2. Um processo (pode ser manual no início) resume cada fonte num bloco curto de markdown, sem redundância, sem contradição entre blocos.
3. Guarda em arquivo/tabela simples que a ferramenta `buscar_conhecimento` consulta por palavra-chave/tema.
4. **Lint semanal**: revisa se algum bloco ficou contraditório (preço mudou? garantia mudou?) ou desatualizado (produto saiu de linha, bônus trocou).

## Regra de ouro
Sem wiki destilada, o SDR ou (a) não sabe responder objeção fina e trava, ou (b) alucina um dado que não está atualizado. A wiki é o que dá precisão barata: poucas linhas, sempre certas, em vez de contexto gigante e impreciso.
