#!/usr/bin/env bash
set -euo pipefail

# Verificação de privilégios de superusuário
if [ "$EUID" -ne 0 ]; then
  echo "Erro: Execute este script com sudo: sudo bash $0"
  exit 1
fi

echo "=== 1. Configurando Swapfile de 8 GB no SSD ==="
SWAPFILE="/swapfile"

if [ ! -f "$SWAPFILE" ]; then
  echo "Criando arquivo de swap de 8 GB em $SWAPFILE..."
  fallocate -l 8G "$SWAPFILE" || dd if=/dev/zero of="$SWAPFILE" bs=1M count=8192 status=progress
  chmod 600 "$SWAPFILE"
  mkswap "$SWAPFILE"
  echo "Swapfile criado com sucesso."
else
  echo "Arquivo $SWAPFILE já existe. Verificando permissões..."
  chmod 600 "$SWAPFILE"
fi

# Ativa o swap com prioridade 10 (abaixo do zRAM que tem prioridade 1000)
if ! swapon --show | grep -q "$SWAPFILE"; then
  echo "Ativando $SWAPFILE com prioridade 10..."
  swapon -p 10 "$SWAPFILE"
else
  echo "$SWAPFILE já está ativo."
fi

# Adiciona ao /etc/fstab para persistir após reinicializações
if ! grep -q "$SWAPFILE" /etc/fstab; then
  echo "Adicionando $SWAPFILE ao /etc/fstab com prioridade 10..."
  echo "$SWAPFILE none swap sw,pri=10 0 0" >> /etc/fstab
else
  echo "$SWAPFILE já configurado no /etc/fstab."
fi

echo ""
echo "=== 2. Otimizando o driver de vídeo Intel UHD 620 (i915) ==="
# Habilita Framebuffer Compression (FBC) e suporte a GuC/HuC para reduzir consumo de banda de memória
I915_CONF="/etc/modprobe.d/i915.conf"
cat <<EOF > "$I915_CONF"
# Otimizações de GPU e memória para Intel UHD Graphics 620
# enable_fbc: Framebuffer Compression (economiza largura de banda de RAM compartilhada)
# enable_guc=3: Ativa GuC e HuC para acelerar renderização e descarregar o processador
options i915 enable_fbc=1 enable_guc=3
EOF
echo "Configuração salva em $I915_CONF."

echo "Atualizando initramfs..."
update-initramfs -u

echo ""
echo "=== 3. Ajustando parâmetros de Swap e Memória (Sysctl) ==="
SYSCTL_CONF="/etc/sysctl.d/99-vram-swap.conf"
cat <<EOF > "$SYSCTL_CONF"
# Prioridade no zRAM e Swap rápido para liberar RAM física para VRAM
vm.swappiness = 180
vm.vfs_cache_pressure = 100
EOF
sysctl --system > /dev/null
echo "Parâmetros aplicados com sucesso."

echo ""
echo "=== Estado atual dos Swaps ==="
swapon --show
echo ""
echo "=== Configuração concluída com sucesso! ==="
echo "Nota: Reinicie o sistema para que as opções do módulo i915 entrem em vigor."
