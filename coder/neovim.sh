#!/bin/bash
set -euo pipefail

# Ensure neovim >= 0.11
if nvim --version 2>/dev/null | grep -q 'v0\.11'; then
  echo "[coder:neovim] neovim 0.11 already installed"
else
  echo "[coder:neovim] Installing neovim v0.11.7"
  curl -fLo /tmp/nvim-linux-x86_64.tar.gz https://github.com/neovim/neovim/releases/download/v0.11.7/nvim-linux-x86_64.tar.gz
  mkdir -p "$HOME/.local"
  tar -C "$HOME/.local" -xzf /tmp/nvim-linux-x86_64.tar.gz --strip-components=1
  rm /tmp/nvim-linux-x86_64.tar.gz
  echo "[coder:neovim] Installed: $(nvim --version | head -1)"
fi
