# MCP OAuth — George / mcporter

Last updated: 2026-05-29

## Auth status

| Server | mcporter OAuth | Notes |
| --- | --- | --- |
| **figma** | ✅ Complete | `clientName: Claude Code` |
| **linear** | ✅ Complete | Standard OAuth |
| **stripe** | ✅ Complete | Standard OAuth |
| **slack-mcp** | ⏳ Optional | Cursor partner client id configured; George has native Slack via OpenClaw |
| **figma-desktop** | N/A | Local Dev Mode, no OAuth |

Verify anytime:

```bash
CFG=~/.openclaw/workspace/config/mcporter.json
mcporter list --config "$CFG" linear --schema | head -25
mcporter list --config "$CFG" stripe --schema | head -25
```

## Quick auth (run in Terminal)

```bash
CFG=~/.openclaw/workspace/config/mcporter.json

# One-shot script (Linear then Stripe):
~/.openclaw/workspace/config/auth-mcps.sh

# Or individually:
mcporter auth linear --config "$CFG"
mcporter auth stripe --config "$CFG"

# Figma — fixed: must use allowlisted client name (see mcporter.json clientName)
mcporter auth figma --config "$CFG"

# Slack — fixed: uses Cursor partner client id (no dynamic registration)
mcporter auth slack-mcp --config "$CFG"
```

Verify:

```bash
mcporter list --config "$CFG" --schema
```

## Why auth failed before

### Figma → HTTP 403 Forbidden (or redirect_uri mismatch)

Figma's MCP OAuth server **allowlists client names** (Cursor, Claude Code, Codex, VS Code, etc.). mcporter defaults to registering as `mcporter (figma)`, which Figma rejects with a raw `403 Forbidden`.

**Do NOT use `clientName: "Cursor"` with mcporter.** Cursor's OAuth app only accepts `cursor://…` redirect URIs. mcporter uses `http://127.0.0.1:<port>/callback`, which causes:

> redirect_uri did not match any configured URIs. Passed URI: http://127.0.0.1:54539/callback

**Fix:** `clientName: "Claude Code"` in `mcporter.json` (already applied). Claude Code allows dynamic client registration with localhost callbacks.

Clear stale OAuth cache, then re-auth:

```bash
CFG=~/.openclaw/workspace/config/mcporter.json
mcporter auth figma --config "$CFG" --reset
```

If Claude Code fails, try `"Codex"`.

**Easiest alternative:** Figma **desktop** MCP (no OAuth) — see below.

### Linear & Stripe ✅

Standard OAuth — no special `clientName` needed. Browser opens, approve access, mcporter caches tokens in `~/.mcporter/credentials.json` (entries keyed as `linear|<hash>` and `stripe|<hash>`).

**Done 2026-05-29** — Ian completed OAuth for both. George can call issue/payment tools via mcporter.

**Stripe fallback (no OAuth):** restricted API key as bearer header in mcporter.json:

```json
"stripe": {
  "baseUrl": "https://mcp.stripe.com",
  "headers": { "Authorization": "Bearer rk_live_..." }
}
```

Use a [restricted key](https://docs.stripe.com/mcp) with only the permissions your agent needs.

### Slack → "does not support dynamic client registration"

Slack's official MCP at `https://mcp.slack.com/mcp` **does not implement RFC 7591 DCR**. mcporter must use a pre-registered `oauthClientId`.

**Fix:** Cursor's partner client id is in config: `3660753192626.8903469228982`.

If Slack auth still fails at token exchange, your workspace may require a **custom Slack app**:

1. Create app at https://api.slack.com/apps
2. Enable **Agents & AI Apps → MCP**
3. Add Bot Token Scopes you need (see Slack MCP docs)
4. Set redirect URL to `http://127.0.0.1:<port>/callback` (mcporter prints the port)
5. Update mcporter.json:

```json
"slack-mcp": {
  "baseUrl": "https://mcp.slack.com/mcp",
  "auth": "oauth",
  "oauthClientId": "YOUR_APP_CLIENT_ID",
  "oauthClientSecretEnv": "SLACK_MCP_CLIENT_SECRET"
}
```

6. `export SLACK_MCP_CLIENT_SECRET='...'` then re-run `mcporter auth slack-mcp`

**Note:** George already has native Slack messaging via OpenClaw (`channels.slack`). slack-mcp adds search/history/canvas tools — optional if georgebot covers your needs.

## Figma desktop (no OAuth)

If remote Figma MCP is finicky, use the local desktop server:

1. Open **Figma desktop app**
2. Dev Mode → enable **Desktop MCP server**
3. Auth is automatic against `http://127.0.0.1:3845/mcp`:

```bash
mcporter list --config "$CFG" figma-desktop --schema
```

## George / OpenClaw vs mcporter

- **mcporter** stores OAuth tokens in its token cache (used by `mcporter call` and the mcporter skill).
- **OpenClaw `mcp.servers`** projects HTTP MCPs into Codex threads; OAuth may need a separate pass inside the agent runtime.
- For design work in **Cursor**, Figma MCP auth via Cursor Settings → MCP is often easiest (same OAuth ecosystem).

## Datadog

Not wired — needs `DD_API_KEY`, `DD_APPLICATION_KEY`, and `DD_MCP_DOMAIN` in gateway env before adding to mcporter.json.

## Peekaboo (stdio — no OAuth)

- **CLI:** `peekaboo --version` (works)
- **MCP server:** `~/.local/bin/peekaboo-mcp` — **do not run `peekaboo-mcp --help`**; it has no help flag and starts the Swift MCP server on stdio (appears to hang). That is normal.
- **Verify:** `mcporter list --config "$CFG" peekaboo --schema`
- **Permissions:** System Settings → Privacy & Security → **Screen Recording** + **Accessibility** for Terminal (or the gateway host).
- **Package:** `@steipete/peekaboo` v3.2.3 — bins: `peekaboo`, `peekaboo-mcp`

## OAuth status (check vault)

Tokens live in `~/.mcporter/credentials.json`. Quick check:

```bash
CFG=~/.openclaw/workspace/config/mcporter.json
mcporter list --config "$CFG" figma linear stripe --schema
```

| Server | Status |
|---|---|
| figma | ✅ authed (Claude Code client) |
| linear | ⏳ run `mcporter auth linear --config "$CFG"` |
| stripe | ⏳ run `mcporter auth stripe --config "$CFG"` |
| slack-mcp | ⚠️ partial/incomplete — retry or use custom Slack app |
| peekaboo | ✅ stdio, no auth |
