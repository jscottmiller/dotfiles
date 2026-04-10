#!/bin/bash
set -euo pipefail

CODER_DIR="$(cd "$(dirname "$0")" && pwd)"

TEMPLATE_NAME=$(coder list --output json | jq -r '.[0].template_name')

echo "[coder] Template: $TEMPLATE_NAME"

case "$TEMPLATE_NAME" in
  "coder")
    echo "[coder] Running coder template setup"
    "$CODER_DIR/coder.sh"
    ;;
  *)
    echo "[coder] No template-specific setup for '$TEMPLATE_NAME'"
    ;;
esac
