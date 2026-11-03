#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# Script: configurar_servicos_wayland.sh
# Objetivo: Evitar que Waybar e Mako iniciem automaticamente no boot/login de
#           outros ambientes Wayland (como COSMIC ou GNOME).
#           No Sway, o Waybar continua iniciando diretamente via 'swaybar_command'.
# ==============================================================================

# Não executar como root (systemctl --user deve ser rodado pelo seu usuário normal)
if [ "${EUID}" -eq 0 ]; then
  echo "❌ Erro: Não execute este script com sudo. Execute como seu usuário normal:"
  echo "   bash $0"
  exit 1
fi

echo "=========================================================="
echo " Configuração de Serviços Wayland (Sway vs COSMIC/Outros) "
echo "=========================================================="

if [ "${1:-}" = "--reverter" ] || [ "${1:-}" = "--unmask" ]; then
  echo "🔄 Revertendo máscaras do systemd..."
  systemctl --user unmask waybar.service 2>/dev/null || true
  systemctl --user unmask mako.service 2>/dev/null || true
  echo "✅ Serviços desmascarados com sucesso."
  exit 0
fi

echo "1. Mascarando serviços no systemd --user para evitar autostart indesejado..."
systemctl --user mask waybar.service
systemctl --user mask mako.service

echo "2. Parando instâncias ativas do Waybar e Mako gerenciadas pelo systemd..."
systemctl --user stop waybar.service 2>/dev/null || true
systemctl --user stop mako.service 2>/dev/null || true

# Caso haja processos órfãos soltos
if pgrep -x waybar >/dev/null 2>&1; then
  echo "3. Finalizando processo waybar órfão..."
  killall -q waybar || true
fi

echo ""
echo "✅ Pronto!"
echo "   - Waybar e Mako não irão mais autoiniciar no COSMIC/GNOME."
echo "   - No Sway, o Waybar continuará abrindo normalmente via swaybar_command."
echo "   - Para desfazer no futuro, execute: bash $0 --reverter"
