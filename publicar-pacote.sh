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
  bash "$CHK" >/tmp/.chk-vaz.out 2>&1 || { echo "PARE: vazamento de identidade detectado"; cat /tmp/.chk-vaz.out; exit 1; }
  echo "  · sem identidade do dono"
fi

# 3) monta o pacote a partir de uma cópia limpa (sem backup, sem git, sem segredo)
TMP=$(mktemp -d /tmp/pkg-XXXX); trap 'rm -rf "$TMP"' EXIT
rsync -a --exclude='.git' --exclude='pacote' --exclude='node_modules' \
      --exclude='*.bak*' --exclude='*.ANTES-*' --exclude='*.CHEIO-*' \
      --exclude='.env' --exclude='sessions.json*' --exclude='topics.json' \
      --exclude='brain' --exclude='promises' --exclude='missions' \
      --exclude='*.log' --exclude='.bridge.lock' --exclude='.alive' \
      ./ "$TMP/pkg/"

echo "$V" > "$TMP/pkg/VERSAO"
cat > "$TMP/pkg/.pacote.json" <<EOF
{
  "modo": "gratuito",
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
echo "PRONTO. Falta enviar pro GitHub pra frota receber:"
echo "  git add VERSAO $DEST && git commit -m 'publica $V' && git push"
