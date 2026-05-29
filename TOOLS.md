# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Examples

```markdown
### Cameras

- living-room → Main area, 180° wide angle
- front-door → Entrance, motion-triggered

### SSH

- home-server → 192.168.1.100, user: admin

### TTS

- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod
```

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

---

Add whatever helps you do your job. This is your cheat sheet.

## OpenClaw local defaults

### Coding-agent completion route

- Preferred completion channel: `telegram`
- Target: `telegram:5663872763`
- Account: `default`
- Note: `webchat` is not a valid target for `openclaw message send`; use Telegram for worker completion notifications.

### Coding-agent runtime defaults

- Preferred worker CLI: `codex`
- Worker launch flags: `-s workspace-write --ask-for-approval never`
- If a worker is started without notify route, monitor with `process` and report status manually.

### Obsidian memory + diary defaults

- Primary vault path: `/Users/ianalloway/Documents/Obsidian Vault`
- Use Obsidian as the long-term memory and journal system.
- Journal convention:
  - Daily log file: `Daily/YYYY-MM-DD.md`
  - Memory index file: `Memory/MEMORY.md`
  - Project log folder: `Logs/`
- Prefer official `obsidian` CLI commands when available; otherwise edit vault Markdown files directly.

### Substack authoring + browser defaults

- Browser automation is allowed for research and publishing workflows.
- Use browser tooling for Substack tasks: draft creation, editing, formatting, scheduling, and previews.
- Substack writing policy:
  - Draft and edit actions can be done autonomously.
  - Publishing requires explicit user confirmation in the current conversation.
  - If login/captcha/manual MFA is required, pause and ask the user to take over.
- Preferred process for Substack work:
  1. Gather topic/intent and outline.
  2. Draft content and create/update Substack draft via browser.
  3. Return draft link and summary.
  4. Wait for explicit "publish" approval before posting live.

### Substack publication + template defaults

- Publication URL: `https://allowayai.substack.com`
- Publication slug: `allowayai`
- Default headline style: curiosity + insight
- Default tone: personal reflective
- Default structure: hook -> 3 key points -> actionable close

Use this template for first draft generation:

1. Headline ideas (3 options, curiosity + insight style)
2. Hook (short personal opening that frames why this matters now)
3. Key Point 1 (insight + concrete example)
4. Key Point 2 (insight + concrete example)
5. Key Point 3 (insight + concrete example)
6. Actionable close (clear next step/checklist for reader)
7. Suggested CTA (reply prompt + subscribe/share nudge)

### Substack publish + distribution runbook

- After explicit user approval to publish, publish immediately to `Everyone` and enable send via email + Substack app.
- Return the final public URL and confirm the dashboard shows `Your post is live!`.
- After publish, attempt distribution in this order:
  1. Instagram Story
  2. Facebook share
  3. Direct send to Lauren
- If Instagram/Facebook requires login, MFA, or app-only interaction, pause and ask user to complete manual takeover, then resume.
- For direct share to Lauren, prefer a short personalized note plus the public URL.

### Contact memory: Lauren

- Name: `Lauren Baumann`
- Phone: `+1 (727) 510-9394`
- Email: `coollauren28@gmail.com`
- If channel is unspecified, ask user whether to send via iMessage/WhatsApp/Telegram/email before sending.

### Fiance chatbot access defaults

- Preferred channel for fiance access: `whatsapp`
- Memory boundary: `separate` (keep fiance conversations isolated from owner main-session memory)
- Permission policy: `chat only` (no owner-level command access)
- Existing safety default already in config: keep `commands.ownerAllowFrom` scoped to owner IDs only.

#### WhatsApp onboarding runbook

1. Install WhatsApp channel plugin (`@openclaw/whatsapp`). **Done 2026-05-29.**
2. Add WhatsApp channel account and complete QR/link login. **Run:** `openclaw channels login --channel whatsapp` then scan QR in WhatsApp → Linked devices.
3. Confirm DM session isolation is `per-channel-peer` (already enabled).
4. Keep owner-only command allowlist unchanged unless explicitly requested.
5. Validate with a fiance test message and confirm no owner command execution rights.

**Wired 2026-05-29:**
- Guest agent: `lauren` → workspace `~/.openclaw/workspace-lauren`, tools profile `messaging` (chat-only).
- Routing: WhatsApp DM `+17275109394` (Lauren) → `lauren` agent; `+17274708666` (Ian) → `main` agent.
- WhatsApp allowlist: only Ian + Lauren; groups disabled on this account.
- `wacli` skill enabled for CLI sends; OpenClaw WhatsApp channel uses separate Baileys login (not wacli store).

If plugin installation fails due network/DNS, retry from a terminal with normal internet access and rerun steps 1-2.

### Slack response behavior defaults

- For direct `@georgebot` mentions in Slack, always send a short text reply.
- Do not respond with emoji-only acknowledgements for direct mentions.
- If unsure, prefer a brief clarification question over silence.

### Georgebot capability charter

- Organizational support:
  - Manage files, calendars, reminders, schedules, and task coordination.
  - Maintain reminders, events, logs, and memory workflows (Obsidian/Apple Notes).
- Communication:
  - Draft/send messages or emails when approved by policy/workflow.
  - Summarize, organize, and transcribe messages/meetings.
  - Support Slack and other integrated communication channels.
- Content creation and research:
  - Write, format, and summarize documents/articles.
  - Support blog publication/distribution workflows (including Substack runbooks).
  - Perform web research and information gathering.
- Coding and development:
  - Assist with coding, debugging, and multi-step dev workflows.
  - Spawn task-specific coding agents for intensive implementation.
- Automation and integration:
  - Proactively monitor recurring tasks, checks, and report generation.
  - Automate workflows for integrated platforms (GitHub/Substack/etc.).
- Voice interaction:
  - Use TTS/voice features when enabled and appropriate.
- Smart device and node control:
  - Interact with connected nodes/devices and retrieve files/logs.
  - Handle supported device actions (camera/speakers/lights where configured).
- Multi-agent orchestration:
  - Delegate sub-tasks to specialized agents and coordinate end-to-end workflows.
- Tool-specific depth:
  - Use dedicated skills/integrations for Slack, Notion, GitHub, Obsidian, and others.
- Diagnostics and auditing:
  - Troubleshoot service/tool/node issues.
  - Run security, backup, and configuration audits/hardening as requested.
- Image/video/PDF tasks:
  - Analyze, summarize, and process images/videos/PDFs.
- Custom support:
  - Adapt to user-specific workflows with repeatable runbooks and tailored defaults.

### Founder OS starter stack

- Objective: run a practical weekly operating system for planning, execution, and reflection with low-noise alerts.
- Primary memory/logging location: `/Users/ianalloway/Documents/Obsidian Vault`.
- Founder OS files:
  - Daily brief template: `Logs/founder-os-daily-brief-template.md`
  - Weekly review template: `Logs/founder-os-weekly-review-template.md`
  - Pipeline tracker: `Logs/founder-os-pipeline.md`
  - KPI latest snapshot: `Logs/founder-os-kpi-latest.md`
  - KPI history CSV: `Logs/founder-os-kpi.csv`

#### Founder OS operating procedures

1. Daily brief automation:
   - Generate a concise brief with top priorities, calendar risks, blockers, and today focus.
   - Write/update the daily note in Obsidian and append key metrics to KPI files.
2. Weekly goals review:
   - Summarize wins, misses, and carry-forward goals.
   - Reset weekly priorities and update KPI trend commentary.
3. Bug/content pipeline:
   - Maintain bug and content queues in one place with explicit status and next action.
   - Highlight blocked items and aging items first.
4. Personal KPI dashboard scaffold:
   - Keep KPI latest markdown human-readable and append a row to CSV for history.
5. Attention rules:
   - Prefer asynchronous logging and batch summaries.
   - Interrupt only for blockers, hard deadlines, or high-impact anomalies.
6. Safe fallback behavior:
   - If Telegram/Slack delivery is unavailable, still write outputs to Obsidian files first.
   - Retry delivery on the next heartbeat window; do not lose state updates.

## Installed CLI tools & MCP add-ons (added 2026-05-29)

Binaries live in `/Users/ianalloway/.local/bin` (added to `tools.exec.pathPrepend` so `exec` can find them).

### mcporter (MCP bridge)

- Path: `/Users/ianalloway/.local/bin/mcporter` (npm `mcporter`; verified official `github.com/openclaw/mcporter`).
- Use to connect to and bridge configured Model Context Protocol (MCP) servers from the CLI.
- Quick check: `mcporter --help` (then list/connect MCP servers per its help). No macOS permission needed.

### Peekaboo (macOS screenshot + visual Q&A)

- Path: `/Users/ianalloway/.local/bin/peekaboo` (CLI) and `peekaboo-mcp` (MCP server) (npm `@steipete/peekaboo` v3.2.3).
- Use to capture the screen or a specific window and answer visual questions about what is on screen.
- REQUIRES macOS permissions before first use: System Settings → Privacy & Security → **Screen Recording** (enable for the host running the gateway/terminal); add **Accessibility** for UI interaction.
- Quick check: `peekaboo --version`; `mcporter list --config ~/.openclaw/workspace/config/mcporter.json peekaboo --schema`.
- **Note:** `peekaboo-mcp --help` will appear to hang — it has no help flag; it immediately starts the stdio MCP server.

### Pending add-ons (NOT installed — official source unreachable in this run)

- Official tools live in the `openclaw` GitHub org, but GitHub/ClawHub were proxy-blocked here, and the matching npm names are DIFFERENT projects (unsafe to install):
  - `imsg` (iMessage CLI): install from `github.com/openclaw/imsg` (npm `imsg` is an unrelated package by `ellell`). Needs Automation + Full Disk Access for Messages.
  - `clawdex` (Contacts CLI): install from `github.com/openclaw/clawdex` (npm `clawdex` is an unrelated Solana DEX tool — do NOT use). Needs Contacts permission.
  - `remindctl` (Apple Reminders CLI): install from `github.com/openclaw/remindctl` (not on npm). Needs Reminders permission.
- Manual install once GitHub is reachable: `npm i -g --prefix ~/.local github:openclaw/<name>` (or follow each repo README).
- ClawHub skill discovery (`openclaw skills search`) was also blocked; recommended skills to add later: `model-hierarchy-skill` (cost-based model routing), `awesome-openclaw-skills` (VoltAgent index), plus calendar/research/memory/browser skills.

## MCP servers + skill routing (2026-05-29)

OpenClaw-managed MCP (`mcp.servers`, main agent only via `codex.agents`):
- `obsidian-fs` — vault read/write (`@modelcontextprotocol/server-filesystem`).
- `context7` — library docs (`uvx context7-mcp`).
- `fetch` — URL fetch/extract.
- `linear`, `stripe` — HTTP MCPs; auth: `mcporter auth <name> --config ~/.openclaw/workspace/config/mcporter.json` (browser OAuth).
- `figma` — HTTP MCP; **`clientName: Claude Code`** (not Cursor — Cursor redirect URIs are cursor:// only). Reset + auth: see `config/MCP-AUTH.md`.
- `slack-mcp` — HTTP MCP; **requires pre-registered `oauthClientId`** (no dynamic registration). Cursor partner id in config.
- `figma-desktop` — local `http://127.0.0.1:3845/mcp` when Figma desktop Dev Mode MCP is enabled (no OAuth).
- `peekaboo` — screen capture + visual Q&A (`~/.local/bin/peekaboo-mcp`; needs Screen Recording + Accessibility).
- **Not wired:** Datadog (needs `DD_API_KEY`, `DD_APPLICATION_KEY`, `DD_MCP_DOMAIN` in gateway env).
- Owner Telegram: `/mcp show` (`commands.mcp: true`).

mcporter mirror config: `~/.openclaw/workspace/config/mcporter.json`
- `mcporter list --config ~/.openclaw/workspace/config/mcporter.json --schema`
- `mcporter call obsidian-fs.<tool> ...` for ad-hoc MCP calls from exec.

Workspace skills installed (beyond bundled):
- `model-hierarchy`, `obsidian-markdown`, `obsidian-cli`, `obsidian-bases`, `json-canvas`.

Explicitly enabled bundled skills for George:
- `clawhub`, `gh-issues`, `github`, `healthcheck`, `mcporter`, `summarize`, `taskflow`, `taskflow-inbox-triage`, `obsidian`, `coding-agent`, `wacli`.

Lauren agent: `bundle-mcp` denied — no MCP tools on fiance chatbot.

When to use what:
- **Research:** `summarize` skill + `fetch` MCP + web search.
- **Docs/APIs:** `context7` MCP first, then web search.
- **Obsidian/memory:** obsidian skills + `obsidian-fs` MCP + vault path in Founder OS logs.
- **GitHub/CI:** `github` + `gh-issues` skills (use `gh` CLI; auth via `GH_TOKEN` from `secrets.local.json` → `githubPat`, injected through `skills.entries.gh-issues.apiKey`).
- **Multi-step work:** `taskflow` + `coding-agent`.

### Git + GitHub commits (George / Ian only)

George (`main` agent) can commit and push when Ian **explicitly asks** in Telegram (`telegram:5663872763`) or WhatsApp (`+17274708666`). Lauren agent remains chat-only.

#### Auth

| Check | Status / action |
| --- | --- |
| `githubPat` in `~/.openclaw/secrets.local.json` | Present; scopes include `repo`, `workflow` |
| `skills.entries.gh-issues.apiKey` | SecretRef → `/githubPat` → injects `GH_TOKEN` each agent run |
| `gh auth status` (keyring) | **Broken** — stale keyring token; run `gh auth login -h github.com` in Terminal to fix interactive CLI |
| `GH_TOKEN` + `gh` | Works (`ianalloway`) — George should rely on injected `GH_TOKEN`, not keyring |
| Git identity | `Ian Alloway` / `ian@allowayllc.com` (global git config — **never change**) |

#### Tools policy (2026-05-29)

- `tools.profile`: `full`
- **Allowed for commits:** `exec`, `process` (`group:runtime` removed from deny)
- **Still denied:** `read`, `write`, `edit`, `apply_patch` (`group:fs`), `cron`, `gateway` (`group:automation`)
- George uses **`exec`** for all git/gh/file work in project repos (not workspace `read`/`write` tools)
- `tools.fs.workspaceOnly: true` — direct fs tools stay workspace-scoped; project work happens via shell in `~/Projects/...`

#### Project repos (git)

Under `~/Projects/` (no `~/Developer/` or `~/repos/`):

| Path | Notes |
| --- | --- |
| `Projects/local/openclaw-coding-smoke` | OpenClaw coding-agent smoke test repo |
| `Projects/dev-tools/metric-regression-gate` | |
| `Projects/dev-tools/macos-disk-cleanup` | |
| `Projects/web/ian-web-forge` | |
| `Projects/web/ai-advantage` | |
| `Projects/personal/ianalloway-profile-readme` | |
| `Projects/personal/Resume-clone` | |
| `Projects/sports-analytics/*` | nba-edge, odds-drift-watch, closing-line-archive, backtest-report-gen, nba-clv-dashboard |

Always `cd` to the repo (or use `git -C /path/to/repo ...`) and confirm with `git remote -v` before commit/push.

#### Commit safety rules (mandatory)

1. **Only commit when Ian explicitly asks** — e.g. "commit these changes", "create a commit and push". Never commit proactively.
2. **Never run `git config`** (global or local user.name/email).
3. **Never** force-push to `main`/`master`, hard reset, or skip hooks unless Ian explicitly requests it.
4. **Never commit** `.env`, credentials, `secrets.local.json`, or API keys — warn Ian if requested.
5. Before commit, run in parallel: `git status`, `git diff` (staged + unstaged), `git log -3 --oneline`.
6. Stage only relevant files; draft a 1–2 sentence message focused on **why**.
7. Commit via HEREDOC; verify with `git status` after.
8. **Do not push** unless Ian explicitly asks.
9. Prefer `gh` for PRs/issues/CI; use `git` for local commits/branches.

#### Workflow A — simple commit (exec)

When Ian asks to commit in repo `REPO_PATH`:

```bash
cd REPO_PATH
git status
git diff
git diff --cached
git log -3 --oneline
# after explicit approval to commit:
git add <files>
git commit -m "$(cat <<'EOF'
Short imperative subject.

Optional one-line why.
EOF
)"
git status
# push only if Ian asked:
git push -u origin HEAD
```

Use `gh auth status` first; if keyring fails, `GH_TOKEN` is already injected for OpenClaw runs.

#### Workflow B — multi-file / feature work (`coding-agent`)

For non-trivial changes, spawn a background worker (see coding-agent defaults above):

1. Confirm repo path and notification route (`telegram:5663872763`).
2. Worker prompt: implement, test, **commit only if Ian's message included commit intent**, open PR if asked.
3. Monitor with `process`; report issue/PR URL when done.

Worker launch (example):

```bash
PROMPT=$(mktemp -t openclaw-worker-prompt.XXXXXX)
cat >"$PROMPT" <<'EOF'
Task: <describe change>
Repo: /Users/ianalloway/Projects/...
Commit: only if user explicitly requested in this session.
Notification route:
- channel: telegram
- target: telegram:5663872763
When finished: openclaw message send --channel telegram --target 'telegram:5663872763' --message '<result>'
EOF
bash pty:true background:true workdir:/Users/ianalloway/Projects/... command:"codex exec - < \"$PROMPT\""
```

#### Workflow C — issue → PR (`gh-issues` skill)

For batch issue fixing / PR automation, invoke `/gh-issues` or follow `gh-issues` SKILL.md. Requires clean worktree unless Ian confirms. Use `--dry-run` first when exploring.

#### What to ask Ian if unclear

- Which repo/path?
- Commit only, or also push?
- Open a PR?
- Which files to include?

#### Example Telegram/WhatsApp prompts for Ian

- "George, in `Projects/web/ai-advantage`, commit the README update with message 'docs: clarify setup steps' — don't push."
- "Commit and push my changes in openclaw-coding-smoke on branch `fix/smoke-test`."
- "Fix issue #12 in metric-regression-gate, commit, and open a PR."
- **Install more skills:** `clawhub search` / `openclaw skills search` from a normal network terminal.
