#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# ZRAM Setup Script (Also serves as a README-style documentation)
# Purpose: Configure systemd-zram-generator with compression and memory tuning
# Works on: Arch Linux (or other distros using systemd-zram-generator)
# -----------------------------------------------------------------------------

set -euo pipefail

echo "🔧 Installing zram-generator..."
# Make sure the package is installed
if ! command -v zramctl &>/dev/null; then
    echo "❌ zramctl not found. Please install 'zram-generator' package first."
	echo -e "\tInstall it with: \`sudo pacman -Syy zram-generator\`\n"
    exit 1
fi

ZRAM_CONF="/etc/systemd/zram-generator.conf"

echo "📄 Writing ZRAM configuration to $ZRAM_CONF"
sudo tee "$ZRAM_CONF" > /dev/null <<EOF
[zram0]
# Optional: Only create zram if total RAM <= 8192 MiB (8 GiB)
#host-memory-limit = 8192

# Allocate 6 GiB of zram (6144 MiB) regardless of compression
zram-size = 6144

# No limit on real RAM used for compressed pages — kernel decides
#zram-resident-limit = 0

# Use zstd compression for better compression ratio
# not sure but even example shows the level, but its
# highly doubtable its actually using level params as
# kernel zstd version is not compiled with that

# compression-algorithm = zstd(level=9)  # Example from docs, but might not work
compression-algorithm = zstd
swap-priority = 100
fs-type = swap

# No mount options or discard behavior
options =
EOF

echo "✅ ZRAM configuration written."

# -------------------------------------------------------------------

echo "🧠 Tuning system to prevent memory-related freezes..."

SYSCTL_CONF="/etc/sysctl.d/99-sysctl.conf"

echo "🔍 Current value of vm.min_free_kbytes:"
sysctl vm.min_free_kbytes

if ! grep -q "vm.min_free_kbytes" "$SYSCTL_CONF" 2>/dev/null; then
    echo "vm.min_free_kbytes = 100000" | sudo tee -a "$SYSCTL_CONF"
    echo "✅ Set vm.min_free_kbytes to 100000"
else
    echo "ℹ️  vm.min_free_kbytes is already set in $SYSCTL_CONF"
fi

echo "🔍 After Modified value of vm.min_free_kbytes:"
sysctl vm.min_free_kbytes

# -------------------------------------------------------------------

echo "🚫 Disabling zswap (if enabled)..."

# Check if kernel supports zswap
if zgrep CONFIG_ZSWAP=y /proc/config.gz &>/dev/null; then
    echo "✅ ZSWAP support found in kernel config."
else
    echo "⚠️  ZSWAP not supported in kernel config."
fi

if [[ -f /sys/module/zswap/parameters/enabled ]]; then
    CURRENT_ZSWAP=$(cat /sys/module/zswap/parameters/enabled)
    echo "🔍 Current ZSWAP status: $CURRENT_ZSWAP"

    if [[ "$CURRENT_ZSWAP" != "N" ]]; then
        echo "🛠️  Disabling ZSWAP in GRUB..."
        sudo sed -i 's/^\(GRUB_CMDLINE_LINUX_DEFAULT=".*\)"/\1 zswap.enabled=0"/' /etc/default/grub
        sudo grub-mkconfig -o /boot/grub/grub.cfg
        echo "✅ zswap.enabled=0 appended to GRUB_CMDLINE_LINUX_DEFAULT"
    else
        echo "✅ ZSWAP is already disabled."
    fi
else
    echo "⚠️  ZSWAP module not present — nothing to disable."
fi

# -------------------------------------------------------------------

echo "🔁 Reloading systemd and updating ZRAM state..."
sudo systemctl daemon-reload

# -------------------------------------------------------------------

echo "📊 Runtime Diagnostics:"
echo "Compression algorithm used:"
cat /sys/block/zram0/comp_algorithm

echo "🧾 ZRAM block info:"
cat /sys/block/zram0/*

echo "📋 Memory Info:"
cat /proc/meminfo

echo "📋 Memory Summary:"
free -ht

echo "📋 ZRAM Status:"
zramctl --output-all

echo "✅ All done. Reboot to fully apply changes if necessary."

