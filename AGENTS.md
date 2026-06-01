# AGENTS.md - GitHub Profile README

## Overview

Ian Alloway's GitHub profile README. This renders as the profile page at github.com/ianalloway.

## Structure

```text
README.md           # Profile README (renders on GitHub profile)
.github/            # GitHub config
```

## Key Conventions

- Cross-repo updates: When adding new projects, also update the resume repo and portfolio website (`ian-web-forge`).
- Keep project descriptions current and accurate.
- Website: ianalloway.xyz

## Cursor Cloud Specific Instructions

This is a static Markdown repository. There is no application runtime, package manager, build step, or automated test suite.

### Lint

- `markdownlint README.md AGENTS.md CONTRIBUTING.md SECURITY.md ORGANIZE.md` may report expected warnings for inline HTML and long badge URLs.
- `bash -n scripts/apply-topics.sh` validates shell syntax.

### Preview

- `grip README.md 0.0.0.0:6419` renders the profile README with GitHub-flavored Markdown.

### Scripts

- `scripts/apply-topics.sh` requires an authenticated `gh` CLI session with write access to the owner's repos.
- In Cloud Agent sessions, treat topic updates as unsafe unless explicitly requested.
