# AGENTS.md - GitHub Profile README

## Overview
Ian Alloway's GitHub profile README. This renders as the profile page at github.com/ianalloway.

## Structure
```
README.md           # Profile README (renders on GitHub profile)
.github/            # GitHub config
```

## Key Conventions
- Cross-repo updates: When adding new projects, also update Resume repo and portfolio website (ian-web-forge)
- Keep project descriptions current and accurate
- ETH Donation Address: 0xAc7C093B312700614C80Ba3e0509f8dEde03515b
- Website: ianalloway.xyz

## Owner
Ian Alloway (@ianalloway) - Data Scientist, AI/ML, Alloway LLC

## Cursor Cloud specific instructions

This is a **static Markdown repository** (GitHub profile README). There is no application runtime, no package manager, no build step, and no automated test suite.

### Lint
- `markdownlint README.md AGENTS.md CONTRIBUTING.md SECURITY.md ORGANIZE.md` — many findings are expected (inline HTML for badges/layout, long lines for badge URLs). The repo does not enforce a zero-warning policy.
- `bash -n scripts/apply-topics.sh` — validates shell syntax.

### Preview
- `grip README.md 0.0.0.0:6419` renders the profile README with GitHub-flavoured Markdown at `http://localhost:6419/`. Requires `pip install grip` (included in the update script).

### Scripts
- `scripts/apply-topics.sh` requires an authenticated `gh` CLI session with write access to the owner's repos (`gh auth login`). It is **read-only safe to skip** in Cloud Agent sessions since agents only have read-only `gh` access.
