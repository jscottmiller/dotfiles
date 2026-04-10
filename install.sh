#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Install packages
if command -v apt-get &>/dev/null; then
  sudo apt-get update -qq
  sudo apt-get install -y -qq neovim tmux ripgrep
elif command -v brew &>/dev/null; then
  brew install neovim tmux ripgrep
fi

# Symlink configs
ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES_DIR/.gitconfig.common" "$HOME/.gitconfig.common"

# Wire up git include if not already present
if ! git config --global --get-all include.path | grep -qF .gitconfig.common; then
  git config --global --add include.path "$HOME/.gitconfig.common"
fi

# AstroNvim config
mkdir -p "$HOME/.config"
rm -rf "$HOME/.config/nvim"
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# Coder-specific setup
if [ -n "${CODER:-}" ]; then
  "$DOTFILES_DIR/coder/install.sh"
fi
