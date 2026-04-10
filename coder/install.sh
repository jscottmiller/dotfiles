#!/bin/bash
set -euo pipefail

CODER_DIR="$(cd "$(dirname "$0")" && pwd)"

TEMPLATE_NAME=$(curl -s \
  -H "Coder-Session-Token: $CODER_AGENT_TOKEN" \
  "$CODER_AGENT_URL/api/v2/workspaces/$CODER_WORKSPACE_ID" | jq -r '.template_name')

case "$TEMPLATE_NAME" in
  "Write Coder on Coder")
    "$CODER_DIR/write-coder-on-coder.sh"
    ;;
esac
