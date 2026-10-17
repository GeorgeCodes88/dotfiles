#!/usr/bin/env bash

set -e # Exit immediately if a command exits with a non-zero status

DOTFILES_DIR="$HOME/.dotfiles"

echo "=== Starting Linux Mint Setup ==="

# 1. Update system package manager
echo "--> Updating package repositories..."
sudo apt update -y && sudo apt upgrade -y

# 2. Add PPA repositories for tools not in default Mint repos (or outdated versions)
echo "--> Adding PPA repositories..."
# Fastfetch PPA
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch -y
# Albert PPA
sudo add-apt-repository ppa:flexiondotorg/albert -y

sudo apt update -y

# 3. Install GitHub CLI (Official Repository Setup)
if ! command -v gh &> /dev/null; then
    echo "--> Installing GitHub CLI repository..."
    sudo mkdir -p -m 755 /etc/apt/keyrings
    wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
    sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update -y
fi

# 4. Install requested packages
echo "--> Installing packages..."
sudo apt install -y \
    albert \
    btop \
    fastfetch \
    gh \
    kitty \
    neovim \
    rofi \
    zsh \
    git \
    curl

# 5. Create standard ~/.config directory structure
echo "--> Creating configuration directories..."
mkdir -p "$HOME/.config"

# 6. Create Symlinks for configuration files
echo "--> Linking configuration files..."

# Function to safely create symlinks
link_file() {
    local src="$1"
    local dest="$2"
    
    if [ -e "$src" ]; then
        mkdir -p "$(dirname "$dest")"
        ln -sf "$src" "$dest"
        echo "    Linked: $dest -> $src"
    else
        echo "    Skipped: $src (file/folder does not exist in dotfiles)"
    fi
}

# Link home directory files
link_file "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"

# Link config directories in ~/.config/
link_file "$DOTFILES_DIR/albert" "$HOME/.config/albert"
link_file "$DOTFILES_DIR/btop" "$HOME/.config/btop"
link_file "$DOTFILES_DIR/fastfetch" "$HOME/.config/fastfetch"
link_file "$DOTFILES_DIR/kitty" "$HOME/.config/kitty"
link_file "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
link_file "$DOTFILES_DIR/rofi" "$HOME/.config/rofi"
link_file "$DOTFILES_DIR/gh/config.yml" "$HOME/.config/gh/config.yml"

# 7. Optionally set Zsh as default shell
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "--> Setting Zsh as default shell..."
    chsh -s $(which zsh)
fi

echo "=== Setup Complete! Please log out and back in for shell changes to take effect. ==="
