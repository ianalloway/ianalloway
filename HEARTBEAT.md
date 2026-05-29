# HEARTBEAT.md

Run this checklist when heartbeat is triggered (gateway poll or `founder-attention-guard` cron).

**Hard limits:** finish in ≤4 minutes. Use `exec` for file/shell work. If nothing actionable, reply `HEARTBEAT_OK` only — no filler.

## Decision tree (fix → notify → ask)

For each finding, pick **one** path:

| Signal | Path | Action |
| --- | --- | --- |
| Safe auto-fix (see below) | **FIX** | Fix silently; log to Obsidian `Logs/openclaw-log.md` |
| Blocker, deadline <2h, security/auth failure, gateway down | **NOTIFY** | Short alert to Ian (Telegram `5663872763` or WhatsApp `+17274708666`) |
| Destructive, external/public, git commit/push, publish, spend money | **ASK** | Prepare draft/steps; wait for explicit approval |
| Routine / low urgency | **BATCH** | Append to `memory/YYYY-MM-DD.md` or next scheduled brief |
| All clear | **OK** | Reply `HEARTBEAT_OK` |

### Safe auto-fix (FIX path)

- Restart or health-check **local** OpenClaw gateway when unreachable (`openclaw gateway status`; suggest `openclaw gateway restart --safe` — do **not** force-kill without asking if jobs are running)
- Re-run failed cron with obvious transient error (timeout once) via `openclaw cron run <id>` — max 1 retry per job per heartbeat
- Refresh `memory/heartbeat-state.json` timestamps
- Append terse ops lines to Obsidian `Logs/openclaw-log.md`
- Organize workspace memory files (`memory/*.md`, curate `MEMORY.md` from recent dailies)
- Update `TOOLS.md` / `config/MCP-AUTH.md` **status tables only** when auth state changes (no secret values)
- Triage Founder OS pipeline/KPI files when stale >24h (update markdown only)

### Never auto-fix (ASK path)

- Git commit, push, force-push, branch delete, hard reset
- Publish Substack or any public post
- Send email/DM to anyone except Ian on configured owner channels
- Change `openclaw.json`, secrets, git config, or Lauren agent isolation
- Install global packages or disable security denials (`elevated`, `group:fs` outside policy)
- Exfiltrate vault/workspace content to external services

## Proactive checklist (rotate 2–4 items per run)

Track last run in `memory/heartbeat-state.json`. Skip checks done <30m ago unless NOTIFY-worthy.

1. **Gateway & channels** — `openclaw gateway status`; `openclaw channels status` (WhatsApp/Telegram/Slack connected?)
2. **Cron health** — `openclaw cron list`; flag `error` jobs; note consecutive failures
3. **Security / MCP auth** — read `config/MCP-AUTH.md`; spot-check `mcporter list --config ~/.openclaw/workspace/config/mcporter.json` (no token output in messages)
4. **Coding workers** — active `process` / coding-agent sessions; stalled >30m → NOTIFY
5. **Founder OS** — `Logs/founder-os-pipeline.md`, `Logs/founder-os-kpi-latest.md` (Obsidian vault); aging blockers → BATCH or NOTIFY
6. **Sessions** — recent main-session follow-ups unanswered >24h → BATCH into brief
7. **Self-improvement** (weekly rotation) — skill/MCP gaps vs `TOOLS.md`; one-line suggestion in memory, not interrupt

## Initiative rules

- Proactive, low-noise: interrupt only for NOTIFY path items.
- **Quiet hours:** 22:00–08:00 America/New_York — NOTIFY only for urgent/security/gateway-down.
- **Delivery:** prefer Telegram for ops; use WhatsApp `+17274708666` for Founder OS summaries when cron doesn't deliver.
- Batch non-urgent KPI/pipeline nudges into `founder-daily-brief` / `founder-evening-recap` cron output.

## Research routing

When research/docs needed: `summarize` skill → `context7` MCP → `fetch` MCP → web search. Obsidian: skills + `obsidian-fs` MCP.

## Output contract

- **HEARTBEAT_OK** — nothing needs attention (default).
- **Short alert** — only for NOTIFY (≤8 lines, concrete next action).
- **Never** send "all clear" essays on heartbeat.
