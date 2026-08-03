#!/usr/bin/env bash
# publicar-pacote.sh — empacota o agente e publica a versão que a frota vai baixar.
#
# Sem isto, melhoria fica presa no git: o update.sh do cliente compara o arquivo VERSAO,
# não o commit. Foi o que aconteceu em 02/ago — 5 commits de paridade e zero clientes servidos.
#
# Uso:  bash publicar-pacote.sh [versao]     (sem argumento, gera vAAAA.MM.DD-N)
set -uo pipefail
cd "$(dirname "$0")"

V="${1:-}"
if [ -z "$V" ]; then
  BASE="v$(date +%Y.%m.%d)"
  N=1; while [ -d "pacote/${BASE}-${N}" ]; do N=$((N+1)); done
  V="${BASE}-${N}"
fi
DEST="pacote/$V"
[ -d "$DEST" ] && { echo "PARE: $DEST já existe"; exit 1; }

echo "== Publicando $V =="

# 1) o código tem que estar são antes de virar pacote
node --check bridge.cjs || { echo "PARE: bridge.cjs não passa no node --check"; exit 1; }
echo "  · bridge.cjs válido"

# 2) trava de identidade — regra dura da casa: nada do dono vai pro cliente
CHK=/home/cloud/.claude/skills/scripts/check-vazamento-cliente.sh
if [ -x "$CHK" ]; then
  # 03/08: o caminho fixo /tmp/.chk-vaz.out era compartilhado entre usuários. Bastou o dono rodar
  # o checker como root uma vez pra o arquivo virar root:root e TODA publicação como 'cloud'
  # abortar com "PARE: vazamento" — sendo que o checker passava. Falso positivo que travou o
  # release inteiro. Agora cada rodada usa arquivo próprio, e a saída do checker vale por si.
  SAIDA_CHK=$(mktemp -t chk-vaz-XXXXXX) || { echo "PARE: não consegui criar arquivo temporário"; exit 1; }
  if ! bash "$CHK" >"$SAIDA_CHK" 2>&1; then
    echo "PARE: vazamento de identidade detectado"; cat "$SAIDA_CHK"; rm -f "$SAIDA_CHK"; exit 1
  fi
  rm -f "$SAIDA_CHK"
  echo "  · sem identidade do dono"
fi

# 2.5) GUARDA CONTRA DIVERGÊNCIA GIT ↔ PACOTE (03/08).
# Aconteceu duas vezes em dois dias, com dois arquivos diferentes (update.sh e update-pago.sh):
# o arquivo entra no tarball pelo rsync, mas fica UNTRACKED no git. Quem instala por pacote
# recebe; quem atualiza por CLONE (git pull) nunca recebe — e a fonte passa a mentir sobre o
# próprio produto. Os dois casos eram justamente a rede de segurança do update.
# Aqui a publicação PARA se um arquivo que vai viajar não estiver versionado. Estado de runtime
# (.pacote.json, .gender-asked, .claude/) é esperado fora do git e está na lista de ignorados.
# A allowlist é ANCORADA nos dois lados de propósito. Na 1ª versão ela casava por prefixo, e
# `.gender-asked-backup` (ou `.pacote.json.old`) passava pela guarda E pelo rsync — untracked,
# direto pro cliente. E `.claude/` estava aqui como "runtime" sendo que guarda os 5 braços, que
# são PRODUTO: iam no tarball do gratuito e nunca no do pago (que baixa do git). A guarda estava
# legitimando exatamente a divergência que existe pra matar. Agora os braços são versionados e
# só entra aqui o que é mesmo estado desta máquina.
IGNORAR_UNTRACKED='^(\.pacote\.json|\.gender-asked|\.onboarding-state\.json|\.pos-update\.json|\.update-auto-ultima|VERSAO)$|^data/'
NOVOS="$(git status --porcelain 2>/dev/null | grep '^??' | awk '{print $2}' \
         | grep -vE '\.bak|\.ANTES-|\.CHEIO-|^pacote/' | grep -vE "$IGNORAR_UNTRACKED" || true)"
if [ -n "$NOVOS" ]; then
  echo "PARE: estes arquivos entrariam no pacote mas NÃO estão no git:"
  echo "$NOVOS" | sed 's/^/    /'
  echo
  echo "  Quem instala por pacote receberia; quem atualiza por clone (git pull) NÃO."
  echo "  Versione antes de publicar:  git add <arquivo>"
  echo "  Se for estado local desta máquina, some na lista de excluídos do rsync abaixo."
  exit 1
fi
echo "  · nada fora do git"

# 3) monta o pacote a partir de uma cópia limpa (sem backup, sem git, sem segredo)
TMP=$(mktemp -d /tmp/pkg-XXXX); trap 'rm -rf "$TMP"' EXIT
rsync -a --exclude='.git' --exclude='pacote' --exclude='node_modules' \
      --exclude='*.bak*' --exclude='*.ANTES-*' --exclude='*.CHEIO-*' \
      --exclude='.env' --exclude='sessions.json*' --exclude='topics.json' \
      --exclude='publicar-pacote.sh' \
      --exclude='brain' --exclude='promises' --exclude='missions' \
      --exclude='*.log' --exclude='.bridge.lock' --exclude='.alive' \
      --exclude='.gender-asked' --exclude='.pos-update.json' --exclude='.update-auto-ultima' \
      --exclude='.onboarding-state.json' --exclude='.root-blocked' --exclude='data' \
      ./ "$TMP/pkg/"

echo "$V" > "$TMP/pkg/VERSAO"
# O "modo" NAO e rotulo comercial: e a CHAVE que o motor le pra escolher como se atualizar
# (bridge.cjs, const PACOTE). O parser so aceita "pago" ou "gratuito", e valor fora disso cai
# no catch e volta pro padrao em silencio. Este pacote se atualiza pelo agente-update.service
# baixando o pacote publicado, que e exatamente a arquitetura "gratuito" — logo, "gratuito".
# O fato de o produto ser unico e trazer as skills do metodo e OUTRA coisa, e mora no campo
# "skills" abaixo. Ja custou caro misturar os dois: em 02/ago o publicador gravava
# "modo": "completo" com um comentario # dentro do JSON, e os DOIS JSON.parse do bridge
# falhavam calados — o pacote inteiro perdia instalador e usuario.
cat > "$TMP/pkg/.pacote.json" <<EOF
{
  "modo": "gratuito",
  "skills": "completo",
  "versao": "$V",
  "instalador": "sudo bash -c \\"\$(curl -fsSL https://raw.githubusercontent.com/molinateston/agente-soft/main/bootstrap.sh)\\"",
  "usuario": "agente",
  "suporte": "https://github.com/molinateston/agente-soft/issues"
}
EOF

# 4) segredo NUNCA vai no pacote — confere antes de fechar
if grep -rlE "sk-ant-[A-Za-z0-9_-]{20,}|ghp_[A-Za-z0-9]{20,}|BEGIN [A-Z ]*PRIVATE KEY" "$TMP/pkg" 2>/dev/null | head -1 | grep -q .; then
  echo "PARE: credencial encontrada no pacote"; exit 1
fi
echo "  · sem credencial"

mkdir -p "$DEST"
tar czf "$DEST/agente-soft.tar.gz" -C "$TMP/pkg" .
(cd "$DEST" && sha256sum agente-soft.tar.gz > agente-soft.tar.gz.sha256)
echo "$V" > VERSAO

echo "  · pacote: $(du -h "$DEST/agente-soft.tar.gz" | cut -f1) · $(tar tzf "$DEST/agente-soft.tar.gz" | wc -l) arquivos"
echo

# 03/08 — O DEGRAU QUE FALTAVA. Publicar sem push aconteceu 3x em 2 dias: o pacote fica pronto no
# disco, a VERSAO local sobe, e o GitHub continua anunciando a antiga. O cliente pergunta "tem
# versao nova?", ouve "nao", e a melhoria nunca sai daqui. Pior: nada avisa — o publicador
# imprimia a instrucao e dava por encerrado, entao a frota parecia atualizada.
# Aqui o script CONFERE o que o GitHub esta anunciando e grita se estiver atrasado. Nao dá push
# sozinho de proposito (decisao do dono: o push é dele), mas a partir de agora ninguem descobre
# a divergencia por acaso, dias depois.
PUB_REMOTA="$(curl -s --max-time 20 https://raw.githubusercontent.com/molinateston/agente-soft/main/VERSAO 2>/dev/null | tr -d '[:space:]')"
if [ "$PUB_REMOTA" = "$V" ]; then
  echo "✅ O GitHub já anuncia $V — a frota recebe no próximo ciclo (de hora em hora)."
else
  echo "⚠️  ATENÇÃO: o GitHub ainda anuncia ${PUB_REMOTA:-<não consegui ler>}, e você acabou de gerar $V."
  echo "   ENQUANTO O PUSH NÃO SAIR, NENHUM CLIENTE RECEBE ESTA VERSÃO — o update deles compara"
  echo "   a VERSAO do GitHub e conclui que já estão atualizados."
  echo
  echo "   Rode:"
  echo "     git add VERSAO $DEST && git commit -m 'publica $V' && git push"
  echo
  echo "   E confira depois com:"
  echo "     curl -s https://raw.githubusercontent.com/molinateston/agente-soft/main/VERSAO"
fi
