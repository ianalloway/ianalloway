#!/usr/bin/env bash
# Apply GitHub topics for cleaner filtering (requires: gh auth login)
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

# Sports / odds
edit_topics nba-clv-dashboard sports-analytics fastapi python calibration nba
edit_topics nba-ratings sports-analytics python nba kelly-criterion elo
edit_topics line-shop-cli sports-analytics python cli odds kelly-criterion
edit_topics closing-line-archive sports-analytics python sqlite odds data
edit_topics odds-drift-watch sports-analytics python fastapi webhooks odds
edit_topics odds-cli sports-analytics python cli odds
edit_topics backtest-report-gen sports-analytics python ml-evaluation html
edit_topics metric-regression-gate mlops python github-actions ci metrics
edit_topics nba-edge sports-analytics python legacy

# MLOps / agents
edit_topics model-cardgen mlops python cli documentation
edit_topics agent-trace-kit python agents observability llm
edit_topics fraud-anomaly-bench python machine-learning benchmark sklearn
edit_topics substack-rag-local python rag nlp streamlit

# Dev
edit_topics macos-disk-cleanup bash macos cli devops
edit_topics dev-setup-macos bash macos homebrew

# Web / product
edit_topics ian-web-forge portfolio react typescript vite
edit_topics ai-advantage sports-analytics python react machine-learning

echo "Done. Browse: https://github.com/ianalloway?tab=repositories"
