#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "[dotfiles] Installing from $DOTFILES_DIR"

# Install packages
if command -v apt-get &>/dev/null; then
  echo "[dotfiles] Installing packages via apt-get"
  sudo apt-get update -qq
  sudo apt-get install -y -qq neovim tmux ripgrep
elif command -v brew &>/dev/null; then
  echo "[dotfiles] Installing packages via brew"
  brew install neovim tmux ripgrep
fi

# Symlink configs
echo "[dotfiles] Symlinking configs"
ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES_DIR/.gitconfig.common" "$HOME/.gitconfig.common"

# Wire up git include if not already present
if ! git config --global --get-all include.path | grep -qF .gitconfig.common; then
  echo "[dotfiles] Adding .gitconfig.common include"
  git config --global --add include.path "$HOME/.gitconfig.common"
fi

# AstroNvim config
echo "[dotfiles] Linking AstroNvim config"
mkdir -p "$HOME/.config"
rm -rf "$HOME/.config/nvim"
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# Coder-specific setup
if [ -n "${CODER:-}" ]; then
  echo "[dotfiles] Coder detected, running coder setup"
  "$DOTFILES_DIR/coder/install.sh"
fi

echo "[dotfiles] Done"
