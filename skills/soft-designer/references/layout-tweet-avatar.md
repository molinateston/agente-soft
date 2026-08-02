# Layout Tweet-Avatar (hook screenshot-de-tweet)

Variação de **hook** inspirada no formato "print de tweet" que circula no feed. Avatar circular do especialista + nome + @handle no topo, frase grande em sans pesada no corpo, destaques manuscritos em 1-2 palavras-chave.

Referência visual: posts de Christian Prado (@ochrisprado) e Renato Duran (@renatoduran07) que usam esse formato para hook de carrossel.

## Quando usar

- **Exclusivamente no slide 1 (hook)** do carrossel
- Quando a escolha da pergunta D for "Tweet-Avatar"
- A mensagem do hook precisa de **peso pessoal**, não funciona para hook genérico
- Funciona melhor com frase confessional, provocativa, ou contra-intuitiva

## Quando NÃO usar

- Nos slides 2 em diante (vira repetitivo e cansa)
- Quando o especialista não tem foto profissional disponível
- Em hook de tom frio ou técnico (quebra a expectativa do formato)

## Input obrigatório

**A skill PARA e pede upload da foto do especialista antes de gerar este slide.** Sem placeholder. Sem iniciais em círculo cinza. Sem gerar e prometer trocar depois.

Pergunta padrão ao usuário:

> "Pra usar o formato Tweet-Avatar preciso da foto do especialista. Me manda a foto (jpg ou png, quadrada idealmente). Sem isso, eu troco pra outro formato de hook."

Também pergunte:
- Nome de exibição (ex: "Christian Prado")
- Handle (ex: "@ochrisprado")

## Anatomia

```
┌─────────────────────────────────────┐
│                                     │
│  ⊙ Nome do Especialista             │ ← avatar 80px + nome + @handle
│    @handle                          │
│                                     │
│                                     │
│   Você não está                     │
│   (empacado).                        │ ← frase grande, palavra-chave com
│                                     │    destaque manuscrito
│   Você só tá cansado                │
│   de fazer tudo certo               │
│   e não crescer.                    │ ← palavra final sublinhada manuscrito
│                                     │
│                                     │
│                                 v   │ ← setinha de arraste (variação C)
└─────────────────────────────────────┘
```

## Especificação técnica

**Fundo:** branco puro `#FFFFFF` (não o off-white das famílias). Este layout imita print de tweet, então usa o branco do Twitter/X.

**Avatar:**
- `width: 80px; height: 80px`
- `border-radius: 50%`
- `object-fit: cover`
- Imagem vem via base64 inline (ver `SKILL.md` sobre embed de imagem do usuário)

**Nome + handle:**
- Fonte: Inter 600 pro nome, Inter 400 pro handle
- Nome: 28px, cor `#0F1419` (preto do Twitter/X)
- Handle: 22px, cor `#536471` (cinza do Twitter/X)
- Alinhamento: vertical ao lado do avatar, gap 16px

**Frase principal:**
- Fonte: Inter 800 ou Inter 900 (extra-bold ou black)
- Escala: aplica `escala-densidade.md` normalmente
- Cor: `#0F1419`
- `text-align: left`
- Padding superior: 80px desde o bloco avatar+nome

**Destaques manuscritos (1-2 palavras no máximo):**

Três estilos de destaque permitidos, **escolha 1 por carrossel**:

1. **Círculo vermelho**, SVG ellipse sobre a palavra, `stroke: #E53E3E; stroke-width: 4; fill: none`, forma oval imperfeita. Cor única dessa variação: vermelho.

2. **Sublinhado ondulado vermelho**, SVG path abaixo da palavra, `stroke: #E53E3E; stroke-width: 4; stroke-linecap: round`, desenho manuscrito irregular.

3. **Pill amarelo**, `background: #FFB020; border-radius: 40px; padding: 4px 20px` aplicado na palavra/expressão. Cor única dessa variação: amarelo queimado. (Ver imagem 5 - referência Renato Duran.)

**Só uma cor de destaque no carrossel inteiro.** Escolhida no briefing.

## Combinação com os outros slides

O hook tweet-avatar é **apenas o slide 1**. Os slides 2 em diante voltam para a família escolhida (Editorial Preto, Clínico Branco ou Manuscrito Cru) normalmente. A skill trata isso assim:

- Se o usuário escolheu "Tweet-Avatar" na pergunta D → slide 1 usa este layout, slides 2+ usam família selecionada
- A cor de destaque escolhida no tweet-avatar **mantém-se** nos slides seguintes (continuidade visual)

## Exemplo CSS mínimo

```css
.slide-tweet-avatar {
  background: #FFFFFF;
  color: #0F1419;
  padding: 100px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  font-family: 'Inter', sans-serif;
  position: relative;
}
.slide-tweet-avatar .autor {
  display: flex;
  align-items: center;
  gap: 16px;
  margin-bottom: 80px;
}
.slide-tweet-avatar .avatar {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  object-fit: cover;
}
.slide-tweet-avatar .nome {
  font-size: 28px;
  font-weight: 600;
  color: #0F1419;
  line-height: 1.2;
}
.slide-tweet-avatar .handle {
  font-size: 22px;
  font-weight: 400;
  color: #536471;
  line-height: 1.3;
}
.slide-tweet-avatar .frase {
  font-weight: 800;
  text-align: left;
  /* font-size vem de escala-densidade.md */
}
```

## Auditoria adicional

Na `auditoria-pre-preview.md`, este layout tem 2 checks extras:

- Avatar é imagem real do especialista (não placeholder)?
- Destaque manuscrito está em **no máximo** 2 palavras?
