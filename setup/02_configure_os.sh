#!/usr/bin/env bash
# [注意]
# 一度だけ実行すること。
# 実行後はWSLを再起動すること。

set -euo pipefail

if [ ! -d "/mnt/c/repositories" ]; then
    echo "警告: C:/repositories が存在しません"
    exit 1
fi

echo "export PS1='\w$ '" >> "$HOME/.bashrc"

sudo mkdir -p /mnt/repositories

ln -s /mnt/repositories $HOME/repositories

sudo cp /etc/wsl.conf /etc/wsl.conf.backup
# 上書きするため注意
sudo tee /etc/wsl.conf > /dev/null << 'EOF'
[automount]
enabled = false

[interop]
appendWindowsPath = false
EOF

sudo tee -a /etc/fstab > /dev/null << 'EOF'
C:/repositories /mnt/repositories drvfs metadata,notime,gid=1000,uid=1000,defaults 0 0
EOF

