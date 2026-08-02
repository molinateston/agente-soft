# Frente PRODUTO

O app que o **cliente do dono entrega pros clientes DELE**. Não é o painel de apresentação (isso é `frente-war-room.md`): é o software que roda no dia a dia, com muitos usuários, dados de verdade e as contas dos clientes finais separadas umas das outras. Toda tela segue `padrao-visual-default.md`. Deploy na VPS do dono (ver `entrega-e-infra.md`).

## O que a frente entrega

Um app **multi-tenant** com banco próprio (Supabase), IA atrás de proxy, LMS, onboarding guiado e dados demo semeados. Deploy: Node na VPS → Caddy → serviço em porta alta, systemd `Restart=always`, bind `127.0.0.1`, subdomínio no domínio do dono.

## Multi-tenant com RLS por tenant

Vários clientes (tenants) no mesmo app e no mesmo banco, **sem** que um enxergue o dado do outro. A separação é no banco, por **Row Level Security**, não só no código da aplicação, porque um bug de query não pode vazar dado entre clientes.

- Toda tabela de dado de cliente tem `tenant_id`.
- **Policy RLS** filtra por `tenant_id` a partir do JWT do usuário (o tenant vai no claim). O app **nunca** decide sozinho "só mostra os desta empresa" no `WHERE` da aplicação e confia nisso: a policy é o piso.
- O `tenant_id` do usuário logado vem do token verificado no servidor, nunca de um parâmetro que o client manda (senão o cliente troca o id e lê o dado alheio).

```sql
alter table protocols enable row level security;
create policy tenant_isolation on protocols
  using (tenant_id = (auth.jwt() ->> 'tenant_id')::uuid);
```

**Verificação obrigatória na Entrega** (Fase 5): logar como o tenant A e provar por query que ele **não** enxerga a linha do tenant B. RLS "de pé" só depois desse teste, não depois de ler a policy.

## IA atrás de proxy server-side com JWT (chave NUNCA no client)

Se o produto usa IA (chat, geração, classificação), a chave do modelo **nunca** vai pro browser. O client chama **um endpoint do próprio backend**; o backend valida o JWT do usuário, aplica rate-limit por tenant, e só então chama o provedor com a chave que mora no servidor (cofre, `entrega-e-infra.md`).

- Client → `POST /api/ai/chat` (com o cookie/JWT de sessão) → backend valida → backend chama o provedor com a chave server-side → devolve a resposta.
- Motivo: chave no client é chave vazada (qualquer um abre o devtools e copia); e sem o proxy não há como limitar custo por tenant nem logar uso.
- O proxy também é onde entra o **rate-limit** e o **log de uso** por tenant (pra custo não explodir e pra faturar por consumo se for o caso).

## LMS

Área de conteúdo em módulos/aulas (protocolos, treinamentos, o que o cliente ensina pros clientes dele):
- **Módulo → aulas**, progresso por usuário (o que já completou), renderizado de array de dados (`padrao-visual-default.md`).
- Aula = vídeo (com capítulos, igual `frente-war-room.md`) + material; conteúdo longo abre em **modal**, não estoura o card.
- Progresso e conclusão gravados por `(user_id, lesson_id)`, respeitando o tenant.

## Onboarding guiado

No 1º acesso, o usuário não cai numa tela vazia. Um fluxo guiado (passos numerados, um por vez) leva ele a fazer a primeira ação que dá valor (abrir o primeiro protocolo, completar o perfil, convidar a equipe). Motivo: app multi-tenant que entrega tela vazia no dia 1 perde o cliente antes de ele ver o valor.

## Dados demo semeados

O tenant nasce com **dados de exemplo** já dentro (um protocolo modelo, um aluno-exemplo, uma métrica preenchida), semeados no provisionamento. Assim o cliente vê o app "vivo" no primeiro login, entende o formato, e não encara uma base zerada. Os dados demo são marcados (flag `is_demo`) pra poderem ser limpos quando o cliente colocar os dados reais.

## Segurança (o piso, não o extra)

- **Auth**: sessão/JWT httpOnly; senha com hash forte; nunca token no localStorage exposto.
- **RLS por tenant**: o isolamento é no banco (acima), testado na Entrega.
- **IA por proxy**: chave só no servidor (acima).
- **Rate-limit**: por tenant/usuário nos endpoints caros (IA, upload, export).
- **Logs**: quem fez o quê, quando; erro logado sem vazar segredo.
- **Segredos no cofre**: `.env` cifrado na VPS; caça segredo antes de cada push (`entrega-e-infra.md`).
- **Bind `127.0.0.1`**: o serviço não escuta na internet direto; só o Caddy fala com ele.

## Síncrono vs assíncrono (o lento vai pra fila)

O que responde rápido, responde na hora. O que é **lento** (transcodar vídeo de aula, processar upload grande, rodar IA em lote, gerar relatório pesado) **não segura a request**: entra numa **fila + worker**. O usuário recebe "processando" e o resultado aparece quando fica pronto (polling ou notificação). Request que fica presa 40s no transcode derruba a experiência e estoura timeout do proxy.

## O que o produto NÃO é

- Não é o **painel de apresentação**: isso é `frente-war-room.md` (outro deploy, Cloudflare Pages).
- Não é a **copy** das telas de venda/upsell: o texto persuasivo vem das `soft-*`. O produto **implementa** as telas.
