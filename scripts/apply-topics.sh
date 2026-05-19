#!/usr/bin/env bash
# Apply GitHub topics for the active public repos only (archived repos skip).
# Usage: ./scripts/apply-topics.sh
set -euo pipefail

edit_topics() {
  local repo="$1"
  shift
  local args=()
  for t in "$@"; do
    args+=(--add-topic "$t")
  done
  echo "→ ianalloway/$repo"
  gh repo edit "ianalloway/$repo" "${args[@]}"
}

# Active public (non-archived) — as of consolidation
edit_topics ianalloway github-profile readme portfolio open-source
edit_topics ian-web-forge portfolio react typescript vite sports-analytics
edit_topics Resume cv resume career latex python
edit_topics ai-advantage sports-analytics machine-learning react typescript vite kelly-criterion
edit_topics ai-sports-monorepo monorepo sports-analytics machine-learning python typescript
edit_topics sports-betting-ml machine-learning xgboost python sports-analytics nba
edit_topics allowayai r sports-analytics machine-learning open-source
edit_topics kelly-js kelly-criterion sports-betting typescript npm statistics
edit_topics nba-ratings sports-analytics python nba kelly-criterion pypi
edit_topics oss-archive archive monorepo snapshot open-source

echo "Done. Active repos only. Browse: https://github.com/ianalloway?tab=repositories&q=&sort=updated&type=source"
