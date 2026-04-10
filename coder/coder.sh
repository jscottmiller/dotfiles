#!/bin/bash
set -euo pipefail

CODER_DIR="$(cd "$(dirname "$0")" && pwd)"

"$CODER_DIR/neovim.sh"
