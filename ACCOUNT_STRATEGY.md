# GitHub Account Strategy

A living plan for how this account is curated. Goal: a profile that reads as
**one focused ML/data engineer with shipped products**, not a pile of experiments.

## Narrative

> Ian Alloway — ML Engineer / Data Scientist building applied analytics and
> decision systems, with a strong line in sports modeling.

Everything public should support that sentence or get archived.

## Tiers

### Tier 1 — Flagships (pinned, polished, maintained)
| Repo | Role |
|------|------|
| ai-advantage | Shipped product: ML picks + Kelly sizing + live odds |
| sports-betting-ml | Applied modeling (logreg, XGBoost, ensembles) |
| kelly-js | Reusable TS package: Kelly / odds / bankroll math |
| nba-ratings | Ratings + win-probability library |
| ian-web-forge | Portfolio site (ianalloway.xyz) |
| allowayai | R analytics toolkit |

These six are the pinned set (GitHub allows max 6 pins).

### Tier 2 — Supporting (keep public, light maintenance)
- `ianalloway` (this profile repo)
- `Resume`
- `oss-archive` (index of retired work)

### Tier 3 — Archived (read-only, off the main story)
Everything else: old course repos, one-off CLIs, demos, OpenClaw-era work,
job-search tooling. Preserved, not promoted.

## Pinned repos (set in the GitHub web UI)

GitHub only lets the account owner set pins via the web UI, in this order:

1. ai-advantage
2. sports-betting-ml
3. kelly-js
4. nba-ratings
5. ian-web-forge
6. allowayai

How: github.com/ianalloway → "Customize your pins" → select the six above.

## Consolidation backlog

- **Sports stack** — confirm `nba-ratings` and `sports-betting-ml` stay
  distinct (ratings library vs. modeling repo); merge if they drift.
- **Job-search tools** — keep `job-search-toolkit` as the umbrella; the
  individual scanners stay archived.
- **OpenClaw/agent era** — keep archived; surface only via `oss-archive`.

## README standard for flagships

Every Tier 1 repo README should answer, in order:
1. What is this and who is it for (one line)
2. Why it exists / what it shows
3. Feature or API tour
4. How to run it
5. How it connects to the rest of the stack

## Maintenance cadence

- Monthly: re-check topics, descriptions, and stale links on Tier 1.
- Quarterly: re-evaluate the tiering — promote or archive as work evolves.
- On any new project: decide its tier on day one. No orphans.
