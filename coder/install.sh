#!/bin/bash
set -euo pipefail

CODER_DIR="$(cd "$(dirname "$0")" && pwd)"

TEMPLATE_NAME=$(curl -s \
  -H "Coder-Session-Token: $CODER_AGENT_TOKEN" \
  "$CODER_AGENT_URL/api/v2/workspaces/$CODER_WORKSPACE_ID" | jq -r '.template_name')

echo "[coder] Template: $TEMPLATE_NAME"

case "$TEMPLATE_NAME" in
  "Write Coder on Coder")
    echo "[coder] Running write-coder-on-coder setup"
    "$CODER_DIR/write-coder-on-coder.sh"
    ;;
  *)
    echo "[coder] No template-specific setup for '$TEMPLATE_NAME'"
    ;;
esac
