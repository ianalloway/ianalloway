#!/usr/bin/env bash
# One-time OAuth for Linear + Stripe MCP (George / mcporter)
set -euo pipefail

CFG="${MCPORTER_CONFIG:-$HOME/.openclaw/workspace/config/mcporter.json}"

echo "=== Linear MCP ==="
echo "Browser will open — log in to Linear and approve."
mcporter auth linear --config "$CFG"

echo ""
echo "=== Stripe MCP ==="
echo "Browser will open — log in to Stripe and approve."
mcporter auth stripe --config "$CFG"

echo ""
echo "=== Verify ==="
mcporter list --config "$CFG" linear --schema | head -20
echo "---"
mcporter list --config "$CFG" stripe --schema | head -20
echo ""
echo "Done. Linear + Stripe MCP ready for George."
