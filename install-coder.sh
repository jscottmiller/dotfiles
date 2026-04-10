#!/bin/bash
set -euo pipefail

# Ensure neovim >= 0.12
if ! nvim --version 2>/dev/null | grep -q 'v0\.12'; then
  curl -fLo /tmp/nvim-linux-x86_64.tar.gz https://github.com/neovim/neovim/releases/download/v0.12.1/nvim-linux-x86_64.tar.gz
  mkdir -p "$HOME/.local"
  tar -C "$HOME/.local" -xzf /tmp/nvim-linux-x86_64.tar.gz --strip-components=1
  rm /tmp/nvim-linux-x86_64.tar.gz
fi
