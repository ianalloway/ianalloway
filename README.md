<img src="https://raw.githubusercontent.com/ianalloway/ianalloway/main/banner.svg" width="100%" alt="IAN ALLOWAY — Applied AI · Agent Systems · Data Products" />

<div align="center">

[![Portfolio](https://img.shields.io/badge/Portfolio-ianalloway.xyz-00d9ff?style=for-the-badge&logo=vercel&logoColor=white&labelColor=0a0e27)](https://ianalloway.xyz)
[![Live Product](https://img.shields.io/badge/AI_Advantage_Sports-Live-16c784?style=for-the-badge&logo=rocket&logoColor=white&labelColor=0a0e27)](https://aiadvantagesports.com)
[![Resume](https://img.shields.io/badge/Resume-PDF-16c784?style=for-the-badge&logo=googledrive&logoColor=white&labelColor=0a0e27)](https://github.com/ianalloway/ianalloway/raw/main/Ian_Alloway_Resume_CV.pdf)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin&logoColor=white&labelColor=0a0e27)](https://www.linkedin.com/in/ianit)
[![Email](https://img.shields.io/badge/Email-ian%40allowayllc.com-FF6B6B?style=for-the-badge&logo=gmail&logoColor=white&labelColor=0a0e27)](mailto:ian@allowayllc.com)

</div>

[Featured projects](#featured-projects) · [Libraries and tools](#libraries-and-tools) · [Interactive demos](#interactive-demos) · [Tech stack](#tech-stack)

---

## About

**Applied AI / eval / agent systems** · sports decision products · [Alloway LLC](https://ianalloway.xyz).

**Website:** [ianalloway.xyz](https://ianalloway.xyz) · Writing: [Alloway AI](https://allowayai.substack.com)

I build and evaluate systems where AI products, agent tooling, and decision software have to hold up under scrutiny.

- **Contract @ Handshake AI** — evaluating ChatGPT app development and agent-built software across engineering, logic, design, and product quality
- **Contract @ Mercor & Turing** — building agent eval environments, golden answers, and grader rubrics (audit/accounting, spreadsheet automation)
- **Founder, Alloway LLC** — applied ML products, analytics tooling, and autonomous agent systems (including [AI Advantage Sports](https://aiadvantagesports.com))
- B.S. Information Science, cum laude · M.S. Artificial Intelligence candidate — University of South Florida

My projects emphasize inspectable behavior, reproducible demos, and tests that check the decisions a system makes.

---

## Featured projects

### [SOLVENT](https://github.com/ianalloway/solvent-agent) — agent economics

**Problem:** an agent that can spend needs pricing, a margin gate, and an auditable ledger.

**Design:** a Python business loop with SQLite treasury, policy-screened spend, and optional Stripe test-mode payments and NVIDIA Nemotron inference.

[![PyPI](https://img.shields.io/pypi/v/solvent-agent?label=pypi&color=16c784&labelColor=0a0e27)](https://pypi.org/project/solvent-agent/)
[![CI](https://github.com/ianalloway/solvent-agent/actions/workflows/ci.yml/badge.svg)](https://github.com/ianalloway/solvent-agent/actions/workflows/ci.yml)
[![CodeQL](https://github.com/ianalloway/solvent-agent/actions/workflows/codeql.yml/badge.svg)](https://github.com/ianalloway/solvent-agent/actions/workflows/codeql.yml)
[![HF Space](https://img.shields.io/badge/%F0%9F%A4%97%20Space-try%20in%20browser-ffcc4d?labelColor=0a0e27)](https://huggingface.co/spaces/ianalloway/solvent-agent-demo)
[![Python](https://img.shields.io/pypi/pyversions/solvent-agent?labelColor=0a0e27)](https://pypi.org/project/solvent-agent/)

**What you can inspect:** the offline demo runs earn → fulfil → spend → P&L with no API keys. Its dollar figures are simulated, not production revenue. Stripe test mode is the default earn rail. An optional Nano settle rail runs in sim or live verify-only mode: it checks public ledger blocks before fulfilling and never holds a hot wallet. Guardrails include per-job budget envelopes and a human-approval hook.

`pip install solvent-agent && solvent` · [Try it in the browser](https://huggingface.co/spaces/ianalloway/solvent-agent-demo) · [Run the demo](https://github.com/ianalloway/solvent-agent#-quick-start) · [Dashboard preview](https://github.com/ianalloway/solvent-agent/blob/main/docs/dashboard.png) · [Security model](https://github.com/ianalloway/solvent-agent/blob/main/SECURITY.md)

### [juryrig](https://github.com/ianalloway/juryrig) — audit the judge

**Problem:** LLM evaluation scores can hide position, verbosity, and prompt-injection bias.

**Design:** zero-dependency Python audits, judge panels, pairwise agreement, and calibration against human labels. Protocol-based adapters keep the judge provider replaceable.

**What you can inspect:** a network-free demo compares fair and deliberately rigged mock judges. Agreement matrices and the disagreement atlas ship in PyPI 0.3.1.

[![PyPI](https://img.shields.io/pypi/v/juryrig?label=pypi&color=16c784&labelColor=0a0e27)](https://pypi.org/project/juryrig/)
[![CI](https://github.com/ianalloway/juryrig/actions/workflows/ci.yml/badge.svg)](https://github.com/ianalloway/juryrig/actions/workflows/ci.yml)
[![HF Space](https://img.shields.io/badge/%F0%9F%A4%97%20Space-judge%20audit-ffcc4d?labelColor=0a0e27)](https://huggingface.co/spaces/ianalloway/juryrig-judge-audit)

[Demo source](https://github.com/ianalloway/juryrig/blob/main/examples/audit_demo.py) · [Try it in the browser](https://huggingface.co/spaces/ianalloway/juryrig-judge-audit) · [PyPI](https://pypi.org/project/juryrig/) · [Tests](https://github.com/ianalloway/juryrig/tree/main/tests)

### [AI Advantage Sports](https://github.com/ianalloway/ai-advantage) — sports decision product

**Problem:** model output needs a usable workflow for odds, stake sizing, and portfolio risk.

**Design:** React / TypeScript UI with Kelly-based sizing, calibration views, and server-side Stripe entitlement handlers.

**What you can inspect:** a deployed product and open source implementation. The related training demo uses synthetic data; its metrics are not evidence of live betting returns.

[Live product](https://aiadvantagesports.com) · [Case study](docs/case-study-ai-advantage.md) · [Product screenshot](https://github.com/ianalloway/ai-advantage/blob/main/screenshot.png)

---

## Libraries and tools

| Area | Projects |
|---|---|
| Sports libraries & experiments | [nba-ratings / nba-edge](https://github.com/ianalloway/nba-ratings) — ratings and probability · [kelly-js](https://github.com/ianalloway/kelly-js) — odds and stake math · [sports-betting-ml](https://github.com/ianalloway/sports-betting-ml) — synthetic training demo |
| Agent extensions | [openclaw-skills](https://github.com/ianalloway/openclaw-skills) — reusable skills · [openclaw-theme-neon](https://github.com/ianalloway/openclaw-theme-neon) — theme with a [preview](https://ianalloway.github.io/openclaw-theme-neon/) |
| Web & experiments | [ian-web-forge](https://github.com/ianalloway/ian-web-forge) — portfolio · [matrix-rain](https://github.com/ianalloway/matrix-rain) — React animation · [evm-sentry](https://github.com/ianalloway/evm-sentry) — on-chain scanner |
| Archive | [oss-archive](https://github.com/ianalloway/oss-archive) — completed project snapshots |

Writing: [The browser is the real agent benchmark](https://allowayai.substack.com/p/the-browser-is-the-real-agent-benchmark) · [Archived benchmark checklist](https://github.com/ianalloway/browser-agent-benchmark).

---

## Interactive demos

| Project | What to try | Links |
|---|---|---|
| **Ballpark** | A multiplayer estimation game: closest guess wins. | [Play](https://ianalloway.github.io/ballpark-game/) · [Source](https://github.com/ianalloway/ballpark-game) |
| **Beat the Close** | A shared market game with private scouting reads and closing-line value. | [Play](https://ianalloway.github.io/beat-the-close/) · [Source](https://github.com/ianalloway/beat-the-close) |
| **Neon theme** | Switch palettes, tune CSS variables, and preview the rain effect. | [Preview](https://ianalloway.github.io/openclaw-theme-neon/) · [Source](https://github.com/ianalloway/openclaw-theme-neon) |
| **ASCII portfolio** | An experimental monogram landing page built with Three.js and GSAP. | [Source and local setup](https://github.com/ianalloway/ascii-portfolio) |

---

## Tech stack

**Languages:** Python · TypeScript · SQL · JavaScript  
**AI / ML:** OpenAI · NVIDIA Nemotron · LangChain · scikit-learn · Pandas  
**Product:** FastAPI · Next.js / React · Stripe · PostgreSQL · Docker · GitHub Actions

---

<details>
<summary>GitHub activity</summary>

<div align="center">

<img src="https://streak-stats.demolab.com?user=ianalloway&theme=transparent&hide_border=true&ring=00d9ff&fire=16c784&currStreakLabel=16c784&sideNums=cdd2c5&sideLabels=cdd2c5&dates=cdd2c5" height="170" alt="GitHub Streak" />


</div>

</details>

<details>
<summary>One more thing: the SOLVENT meme</summary>

<div align="center">

<img src="https://raw.githubusercontent.com/ianalloway/ianalloway/main/solvent_meme.png" width="480" alt="Other agents vs SOLVENT meme" />

*other agents can spend money · SOLVENT gates spend on margin*

</div>

</details>

---

<img src="https://raw.githubusercontent.com/ianalloway/ianalloway/main/banner-footer.svg" width="100%" alt="" />
