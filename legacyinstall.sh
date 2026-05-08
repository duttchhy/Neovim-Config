#!/bin/bash

set -e

RC='\e[0m'
RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[32m'

# Initial Setup file for new systems
gitpath=$(pwd)
nvimpath="$HOME/.config/nvim"
#-----------
# Branding
#-----------
cat << "EOF"
      :::::::::  :::    ::: ::::::::::: ::::::::::: ::::::::  :::    ::: :::    ::: :::   :::
     :+:    :+: :+:    :+:     :+:         :+:    :+:    :+: :+:    :+: :+:    :+: :+:   :+:
    +:+    +:+ +:+    +:+     +:+         +:+    +:+        +:+    +:+ +:+    +:+  +:+ +:+
   +#+    +:+ +#+    +:+     +#+         +#+    +#+        +#++:++#++ +#++:++#++   +#++:
  +#+    +#+ +#+    +#+     +#+         +#+    +#+        +#+    +#+ +#+    +#+    +#+
 #+#    #+# #+#    #+#     #+#         #+#    #+#    #+# #+#    #+# #+#    #+#    #+#
#########   ########      ###         ###     ########  ###    ### ###    ###    ###
                                                                                     
▄▄▄                                      ▄▄▄▄  ▄▄▄▄                                  
███                                      ▀███  ███▀                  ▀▀              
███      ▄█▀█▄ ▄████  ▀▀█▄ ▄████ ██ ██    ███  ███ ▄█▀█▄ ████▄ ▄█▀▀▀ ██  ▄███▄ ████▄ 
███      ██▄█▀ ██ ██ ▄█▀██ ██    ██▄██    ███▄▄███ ██▄█▀ ██ ▀▀ ▀███▄ ██  ██ ██ ██ ██ 
████████ ▀█▄▄▄ ▀████ ▀█▄██ ▀████  ▀██▀     ▀████▀  ▀█▄▄▄ ██    ▄▄▄█▀ ██▄ ▀███▀ ██ ██ 
                  ██               ██                                                
                ▀▀▀              ▀▀▀                                                 
🌟 Duttchhy Neovim Setup!
🔗 Project: https://git.duttchhy.com/bram/nvim.git
EOF

#--------------------------------
# Confirm installation
#--------------------------------
read -r -p "⚠ Proceed with Neovim install? (y/n): " CONFIRM < /dev/tty
CONFIRM="${CONFIRM,,}" && CONFIRM="${CONFIRM//[[:space:]]/}"
if [[ "$CONFIRM" != "y" ]]; then
    echo "❌ Installation aborted by user."
    exit 1
fi

#-----------
# Clear Old
#-----------
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.cache/nvim
rm -fr /opt/nvim

#-----------
# Clear Old
#-----------
echo -e "${YELLOW}🧹 Clearing old Neovim config and data...${RC}"
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.cache/nvim
sudo rm -rf /opt/nvim
sudo rm -f /usr/local/bin/nvim
 
#--------------------------------
# Install base dependencies
#--------------------------------
echo -e "${YELLOW}📦 Installing base dependencies...${RC}"
if [ -f /etc/os-release ]; then
    . /etc/os-release
 
    # Determine clipboard package based on session type
    if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
        CLIPBOARD_PKG="wl-clipboard"
    else
        CLIPBOARD_PKG="xclip"
    fi
 
    case "${ID_LIKE:-$ID}" in
        debian|ubuntu)
            sudo apt update -y
            sudo apt upgrade -y
            sudo apt install -y \
                curl wget git unzip tar make cmake git \
                ripgrep fd-find fzf fontconfig \
                cargo luarocks \
                python3 python3-venv \
                golang-go nodejs npm \
                shellcheck webp \
                "$CLIPBOARD_PKG"
            sudo apt install -y markdownlint-cli2 || sudo apt install -y node-markdownlint-cli2 || true
            ;;
        fedora)
            echo -e "${GREEN}Newer version available natively, legacy install not needed.${RC}"
            exit 0
            ;;
        arch|manjaro|cachy)
            echo -e "${GREEN}Newer version available natively, legacy install not needed.${RC}"
            exit 0
            ;;
        opensuse)
            echo -e "${GREEN}Newer version available natively, legacy install not needed.${RC}"
            exit 0
            ;;
        *)
            echo -e "${YELLOW}Unsupported OS. Please install the following packages manually:${RC}"
            echo "ripgrep, fd, fzf, $CLIPBOARD_PKG, python3-virtualenv (or equivalent), luarocks, go, shellcheck, webp (cwebp), nodejs, npm, make, cmake, cargo"
            exit 1
            ;;
    esac
else
    echo -e "${RED}Unable to determine OS. Please install required packages manually.${RC}"
    exit 1
fi
 
# markdownlint-cli2 fallback via npm
if ! command -v markdownlint-cli2 >/dev/null 2>&1; then
    if command -v npm >/dev/null 2>&1; then
        echo -e "${YELLOW}Installing markdownlint-cli2 via npm...${RC}"
        sudo npm install -g markdownlint-cli2
    else
        echo -e "${YELLOW}npm not found. Install markdownlint-cli2 manually to enable Markdown linting.${RC}"
    fi
fi
echo -e "${GREEN}✅ Dependency check complete.${RC}"
 
#--------------------------------
# Install Neovim (AppImage)
#--------------------------------
echo -e "${YELLOW}🚀 Installing latest Neovim...${RC}"
NVIM_APPIMAGE="nvim-linux-x86_64.appimage"
wget -q --show-progress "https://github.com/neovim/neovim/releases/latest/download/${NVIM_APPIMAGE}" -O "/tmp/${NVIM_APPIMAGE}"
chmod u+x "/tmp/${NVIM_APPIMAGE}"
 
# Use --appimage-extract (avoids FUSE requirement on older systems)
cd /tmp
./"${NVIM_APPIMAGE}" --appimage-extract > /dev/null 2>&1
sudo mv /tmp/squashfs-root /opt/nvim
sudo ln -sf /opt/nvim/AppRun /usr/local/bin/nvim
rm -f "/tmp/${NVIM_APPIMAGE}"
 
# Verify install
if nvim --version > /dev/null 2>&1; then
    NVIM_VER=$(nvim --version | head -1)
    echo -e "${GREEN}✅ Neovim installed: ${NVIM_VER}${RC}"
else
    echo -e "${RED}❌ Neovim installation failed.${RC}"
    exit 1
fi
 
#--------------------------------
# Install tree-sitter CLI
#--------------------------------
echo -e "${YELLOW}🌳 Installing tree-sitter-cli via cargo...${RC}"
cargo install --locked tree-sitter-cli
echo -e "${GREEN}✅ tree-sitter-cli installed.${RC}"
 
#--------------------------------
# Setup Neovim config
#--------------------------------
echo -e "${YELLOW}📁 Setting up Neovim config...${RC}"
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.vim/undodir"
git clone https://git.duttchhy.com/bram/nvim.git "$nvimpath"
echo -e "${GREEN}✅ Neovim config cloned.${RC}"
 
#--------------------------------
# Install Lazygit
#--------------------------------
echo -e "${YELLOW}🔀 Installing Lazygit...${RC}"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf /tmp/lazygit.tar.gz -C /tmp lazygit
sudo install /tmp/lazygit -D -t /usr/local/bin/
rm -f /tmp/lazygit.tar.gz /tmp/lazygit
echo -e "${GREEN}✅ Lazygit ${LAZYGIT_VERSION} installed.${RC}"
 
#--------------------------------
# Install Nerd Font (Ubuntu)
#--------------------------------
echo -e "${YELLOW}🔠 Installing Ubuntu Nerd Font...${RC}"
FONT_DIR="$HOME/.local/share/fonts/Ubuntu"
mkdir -p "$FONT_DIR"
wget -q --show-progress "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Ubuntu.zip" -O /tmp/Ubuntu.zip
unzip -q /tmp/Ubuntu.zip -d "$FONT_DIR"
fc-cache -fv > /dev/null 2>&1
rm -f /tmp/Ubuntu.zip
echo -e "${GREEN}✅ Ubuntu Nerd Font installed.${RC}"
 
#--------------------------------
# Cleanup
#--------------------------------
echo -e "${YELLOW}🧼 Cleaning up...${RC}"
sudo apt autoremove -y && sudo apt autoclean -y
echo -e "${GREEN}✅ Cleanup complete.${RC}"
 
#--------------------------------
# Done
#--------------------------------
echo ""
echo -e "${GREEN}🎉 Setup complete! Launch Neovim with: nvim${RC}"
echo -e "${YELLOW}   Plugins will auto-install on first launch via lazy.nvim.${RC}"
