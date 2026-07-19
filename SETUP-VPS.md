# /vps — sensor de saúde da sua VPS Hostinger

O seu agente agora sabe olhar a sua VPS na Hostinger (uso de CPU/RAM/disco, backups semanais, uptime) e responde no Telegram.

## O que você ganha

- `/vps` ou `/vps status` — retrato agora (RAM, disco, CPU, backup, bots do serviço).
- `/vps backup list` — os últimos 5 backups automáticos que a Hostinger faz sozinha.
- `/vps snapshot <motivo>` — cria um snapshot on-demand antes de mexer em algo arriscado.
- `/vps restart` — reinicia a VPS (a Hostinger reinicia por baixo). Pede confirmação com hash de 6 dígitos.

## Como ligar (2 minutos)

1. Entra no painel Hostinger → **Developer API** → **Generate token** (marca as permissões de VPS: read + actions).
2. Pega o ID da tua VPS: abre o teu VPS no hpanel, a URL termina em `.../virtual-machines/<ID>/...`. O `<ID>` é o número.
3. No teu servidor, edita o `.env` do agente (mesma pasta do `bridge.cjs`) e cola no fim:

```
HOSTINGER_API_TOKEN=<o token que você gerou>
HOSTINGER_VM_ID=<o id da tua VPS>
```

4. O agente re-lê o `.env` a cada mensagem — **não precisa reiniciar**. Manda `/vps` e o retrato aparece.

## Se não configurar

O `/vps` responde uma linha explicando o que falta. Enquanto isso, o resto do agente segue igual.

## Segurança

- O token **nunca aparece no chat, no log ou em arquivo além do `.env`**.
- O `/vps restart` exige um código `CONFIRMA-VPS-RESTART-<hash>` de volta (válido por 5min), pra ninguém reiniciar sua VPS por acidente ou de brincadeira num grupo.
