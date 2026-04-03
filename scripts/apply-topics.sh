#!/usr/bin/env bash
# Apply GitHub topics for discoverability (requires: gh auth login).
# Idempotent: gh repo edit --add-topic skips topics already present.
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

# Profile
edit_topics ianalloway github-profile readme portfolio open-source

# Portfolio site & CV
edit_topics ian-web-forge portfolio react typescript vite sports-analytics
edit_topics Resume cv resume career latex python

# Flagship — sports ML & evaluation
edit_topics ai-advantage sports-analytics machine-learning react typescript vite kelly-criterion
edit_topics sports-betting-ml machine-learning xgboost python sports-analytics nba
edit_topics nba-clv-dashboard sports-analytics fastapi python calibration chartjs
edit_topics nba-ratings sports-analytics python nba kelly-criterion pypi
edit_topics nba-edge sports-analytics python nba legacy
edit_topics backtest-report-gen sports-analytics python metrics html ml-evaluation
edit_topics metric-regression-gate mlops python github-actions ci metrics

# Odds & data
edit_topics closing-line-archive sports-analytics python sqlite odds data
edit_topics odds-drift-watch sports-analytics python fastapi webhooks odds
edit_topics odds-cli sports-analytics python cli odds
edit_topics kelly-js kelly-criterion sports-betting typescript npm statistics

# MLOps / agents / OSS tooling
edit_topics repo-health python cli github developer-tools code-quality
edit_topics code-stash python cli sqlite snippets developer-tools
edit_topics openclaw-skills openclaw agents mcp skills
edit_topics openclaw-patches openclaw typescript patches

# Dev & Mac
edit_topics macos-disk-cleanup bash macos shell disk-space devops

# Demos / education / misc public
edit_topics snake-game javascript game canvas open-source
edit_topics allowayai r rstats sports-analytics machine-learning
edit_topics allowayai-demo r shiny demo html
edit_topics assignment12-rmarkdown r rmarkdown education
edit_topics lis4805 r education programming
edit_topics friedman r statistics hypothesis-testing
edit_topics awesome-sports-betting awesome-list sports-betting resources
edit_topics portfolio-ship-week career portfolio documentation
edit_topics stock-sentiment-analyzer python nlp finance sentiment-analysis
edit_topics taskmaster python cli productivity
edit_topics weather-dashboard-cli python cli weather open-source
edit_topics deathcon-api python fastapi webhooks api

echo "Done. Browse: https://github.com/ianalloway?tab=repositories"
