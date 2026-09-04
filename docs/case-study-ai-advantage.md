# Case Study: AI Advantage Sports

*Applied AI product · sports decision systems · [Alloway LLC](https://ianalloway.xyz)*

**Primary:** [AI Advantage Sports](https://aiadvantagesports.com) — live ML predictions, Kelly sizing, Stripe entitlements  
**Secondary:** [SOLVENT](https://github.com/ianalloway/solvent-agent) — self-funding agent with a full earn → fulfil → spend loop (NVIDIA × Stripe hackathon)

---

## Problem

Most “AI betting” work dies in a notebook. Users don’t need another model dump — they need a **decision surface**: a probability they can trust enough to act on, a stake sized to bankroll risk, and a product that still works when someone looks at entitlements, odds, and line movement under real traffic.

The adjacent failure mode for agents is the opposite: systems that can *spend* (APIs, cards, tools) without an economic loop — no pricing, no margin gate, no ledger. That’s a demo of capability, not a business.

**AI Advantage** closes the product gap. **SOLVENT** (sidebar below) closes the agent-economics gap.

---

## System design

### Stack layering (intentionally separated)

```
nba-ratings (Python)     →  ratings, win-prob, calibration primitives (PyPI: nba-edge)
kelly-js (TypeScript)    →  Kelly sizing, odds math, bankroll stats
sports-betting-ml        →  training / value-bet Streamlit demo (synthetic metrics)
ai-advantage             →  live product @ aiadvantagesports.com
```

Modeling libraries stay reusable and testable. The product repo owns UX, auth, billing, and the decision UI — not a mono-repo soup.

### Product surface (AI Advantage)

| Layer | Role |
|-------|------|
| Predict | Model-driven picks across NBA / NFL / MLB workflows |
| Size | Kelly-based stake recommendations from edge + bankroll |
| Time | Live odds and line-movement views |
| Risk | Portfolio exposure by team / game / sport with stake haircut |
| Monetize | Stripe Checkout + Customer Portal; **server-truth entitlements** (`/api/entitlements/me`) — localStorage is cache only |

Frontend: React · TypeScript · Vite · Tailwind · shadcn/ui. Netlify Functions wrap shared handlers for checkout, newsletter capture, and the execution ledger so preview and production stay functional.

Design constraint I care about: **paid access is not client-spoofable**. Checkout failures do not fall back to orphan Payment Links in production.

---

## Evaluation — what “good” means

“Good” is not a single accuracy number on a slide.

For a **decision product**, good means:

1. **Calibration over hype** — probabilities that behave like probabilities (ratings / win-prob work lives in `nba-ratings`; training demos must not be mistaken for live market ROI).
2. **Actionability** — edge + bankroll → stake, with correlated exposure visible before the user overcommits.
3. **Operational truth** — billing, entitlements, and webhooks match reality; funnel events (`checkout_started` → `checkout_paid` → retention signals) are inspectable.
4. **Honest demos** — the Streamlit training repo labels synthetic holdout metrics as synthetic. I do not cite them as production performance.

For an **economic agent** (SOLVENT), good means:

1. Jobs that fail the **margin floor** never reach Stripe.
2. Spend is screened (allowlist, caps, reserve, no-negative-ROI) before money moves.
3. Earn → fulfil → spend is booked on a ledger with an audit trail — including offline stubs so the loop is demonstrable without keys.

Eval tooling I ship separately ([juryrig](https://github.com/ianalloway/juryrig)) is the same instinct: make judgment and bias inspectable instead of assumed.

---

## Result (honest)

**What shipped**

- A **live commercial surface** at [aiadvantagesports.com](https://aiadvantagesports.com): predictions, Kelly sizing, live odds, portfolio risk views, Stripe Pro (trial + portal), newsletter capture into Substack.
- An open product repo for portfolio transparency (MIT), with modeling factored into adjacent libraries rather than locked inside the UI.
- Clear separation between **demo / synthetic training metrics** (`sports-betting-ml`) and **product behavior under real Stripe and entitlements**.

**What I’m not claiming**

- No fabricated hit rates, ROI, or Sharpe from live books.
- Training-demo accuracy / backtest figures in `sports-betting-ml` are **synthetic** — they illustrate the evaluation workflow, not market edge.
- SOLVENT demo dollar figures (~revenue / spend on a simulated batch) are **illustrative of the loop**, not production revenue.

**What this shows an employer**

I can take applied ML from libraries → decision math → a deployed product with real billing and server-side access control — and I can talk about evaluation without inflating numbers.

---

## Links

| | |
|---|---|
| **Live product** | [aiadvantagesports.com](https://aiadvantagesports.com) |
| **Product repo** | [ianalloway/ai-advantage](https://github.com/ianalloway/ai-advantage) |
| Ratings / win-prob | [nba-ratings](https://github.com/ianalloway/nba-ratings) (`nba-edge` on PyPI) |
| Kelly / odds (TS) | [kelly-js](https://github.com/ianalloway/kelly-js) |
| Training demo | [sports-betting-ml](https://github.com/ianalloway/sports-betting-ml) |
| Portfolio | [ianalloway.xyz](https://ianalloway.xyz) |

---

## Sidebar: SOLVENT

*[solvent-agent](https://github.com/ianalloway/solvent-agent) — NVIDIA × Stripe × Nous Research hackathon*

**Problem.** Agents that can spend money without pricing, margin gates, or a balance sheet.

**Design.** Inbound job → margin gate (decline if below floor) → Stripe earn (Payment Links / Checkout) → Nemotron fulfil → NemoClaw-style guardrails → Stripe Issuing (or simulated) spend → P&L booked on SQLite treasury. Offline-first stubs; live keys unlock real inference and test-mode payments.

**What “good” means.** Structural profitability (unit cost before quote), policy-screened spend, ledger IDs (`cs_…`, `pi_…`) before fulfilment, demo that runs without API keys.

**Result.** A complete business loop you can run locally in ~30s; treasury dashboard and finance report (runway, forecast) for inspectability. Demo P&L numbers are simulated — the artifact is the **loop and controls**, not a revenue claim.

```
Client pays → Agent earns → Agent fulfils → Agent pays vendors → P&L booked
```

---

*Ian Alloway — applied AI / eval / agent systems · [ianalloway.xyz](https://ianalloway.xyz)*
