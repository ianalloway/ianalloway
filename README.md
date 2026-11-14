<img src="https://raw.githubusercontent.com/ianalloway/ianalloway/main/banner.svg" width="100%" alt="IAN ALLOWAY — LLM Evaluation · Agent Tooling · Applied ML" />

<div align="center">

[![Portfolio](https://img.shields.io/badge/Portfolio-ianalloway.xyz-00d9ff?style=for-the-badge&logo=vercel&logoColor=white&labelColor=0a0e27)](https://ianalloway.xyz)
[![Live Product](https://img.shields.io/badge/AI_Advantage_Sports-Live-16c784?style=for-the-badge&logo=rocket&logoColor=white&labelColor=0a0e27)](https://aiadvantagesports.com)
[![Resume](https://img.shields.io/badge/Resume-PDF-16c784?style=for-the-badge&logo=googledrive&logoColor=white&labelColor=0a0e27)](https://github.com/ianalloway/ianalloway/raw/main/Ian_Alloway_Resume_CV.pdf)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin&logoColor=white&labelColor=0a0e27)](https://www.linkedin.com/in/ianit)
[![Email](https://img.shields.io/badge/Email-ian%40allowayllc.com-FF6B6B?style=for-the-badge&logo=gmail&logoColor=white&labelColor=0a0e27)](mailto:ian@allowayllc.com)

</div>

[Featured work](#featured-work) · [Also building](#also-building) · [Experience](#experience) · [Libraries and tools](#libraries-and-tools) · [Interactive demos](#interactive-demos) · [Tech stack](#tech-stack)

---

## About

**AI / data engineer. I run Alloway LLC**, where I build LLM evaluation tooling, agent systems, and the data pipelines behind them, and I contract on frontier-model evaluation programs for AI labs.

What I ship is meant to be checked: open-source packages on PyPI, browser demos that run with no API keys, a working paper whose tables recompute from the repo with one command, and tests that assert on the decisions a system makes.

- **Now:** Founder, Alloway LLC ([details](#experience))
- **Education:** University of South Florida, M.S. Artificial Intelligence (expected Dec 2027) · B.S. Information Science, cum laude
- **Contact:** [ian@allowayllc.com](mailto:ian@allowayllc.com) · [LinkedIn](https://www.linkedin.com/in/ianit) · [Résumé (PDF)](https://github.com/ianalloway/ianalloway/raw/main/Ian_Alloway_Resume_CV.pdf) · [ianalloway.xyz](https://ianalloway.xyz) · Writing: [Alloway AI](https://allowayai.substack.com)

---

## Featured work

Start with the project that matches what you want to evaluate:

- **LLM evaluation:** [juryrig](https://github.com/ianalloway/juryrig), with a network-free audit demo.
- **Agent spending controls:** [SOLVENT](https://github.com/ianalloway/solvent-agent), with an offline business-loop simulation.
- **Reproducible research:** [SpendAudit](https://github.com/ianalloway/spendaudit), with data, model responses, and a table-reproduction command.

### [SOLVENT](https://github.com/ianalloway/solvent-agent): an agent that has to stay solvent

**Problem:** an agent that can spend money needs pricing, a margin gate, and an auditable ledger.

**Design:** a Python business loop with a SQLite treasury, policy-screened spend, and optional Stripe test-mode payments and NVIDIA Nemotron inference. The core runs on the standard library alone.

[![PyPI](https://img.shields.io/pypi/v/solvent-agent?label=pypi&color=16c784&labelColor=0a0e27)](https://pypi.org/project/solvent-agent/)
[![CI](https://github.com/ianalloway/solvent-agent/actions/workflows/ci.yml/badge.svg)](https://github.com/ianalloway/solvent-agent/actions/workflows/ci.yml)
[![CodeQL](https://github.com/ianalloway/solvent-agent/actions/workflows/codeql.yml/badge.svg)](https://github.com/ianalloway/solvent-agent/actions/workflows/codeql.yml)
[![HF Space](https://img.shields.io/badge/%F0%9F%A4%97%20Space-try%20in%20browser-ffcc4d?labelColor=0a0e27)](https://huggingface.co/spaces/ianalloway/solvent-agent-demo)
[![Python](https://img.shields.io/pypi/pyversions/solvent-agent?labelColor=0a0e27)](https://pypi.org/project/solvent-agent/)

**What you can inspect:** the offline demo runs earn → fulfil → spend → P&L with no API keys. Its dollar figures are simulated, not production revenue. Stripe test mode is the default earn rail. Guardrails include per-job budget envelopes and a human-approval hook.

`pip install solvent-agent && solvent --no-onboard` · [Try it in the browser](https://huggingface.co/spaces/ianalloway/solvent-agent-demo) · [Run the demo](https://github.com/ianalloway/solvent-agent#-quick-start) · [Dashboard preview](https://github.com/ianalloway/solvent-agent/blob/main/docs/dashboard.png) · [Security model](https://github.com/ianalloway/solvent-agent/blob/main/SECURITY.md)

### [juryrig](https://github.com/ianalloway/juryrig): audit the LLM judge before you trust it

**Problem:** LLM-as-judge scores can hide position, verbosity, and prompt-injection bias.

**Design:** zero-dependency Python audits, judge panels, pairwise agreement, and calibration against human labels. Protocol-based adapters keep the judge provider replaceable.

[![PyPI](https://img.shields.io/pypi/v/juryrig?label=pypi&color=16c784&labelColor=0a0e27)](https://pypi.org/project/juryrig/)
[![CI](https://github.com/ianalloway/juryrig/actions/workflows/ci.yml/badge.svg)](https://github.com/ianalloway/juryrig/actions/workflows/ci.yml)
[![HF Space](https://img.shields.io/badge/%F0%9F%A4%97%20Space-judge%20audit-ffcc4d?labelColor=0a0e27)](https://huggingface.co/spaces/ianalloway/juryrig-judge-audit)

**What you can inspect:** a network-free demo compares fair and deliberately rigged mock judges. Agreement matrices and the disagreement atlas ship in PyPI 0.3.1.

`pip install juryrig` · [Try it in the browser](https://huggingface.co/spaces/ianalloway/juryrig-judge-audit) · [Demo source](https://github.com/ianalloway/juryrig/blob/main/examples/audit_demo.py) · [Evaluation lab](https://github.com/ianalloway/juryrig/blob/main/examples/EVALUATION.md) · [Tests](https://github.com/ianalloway/juryrig/tree/main/tests)

### [SpendAudit](https://github.com/ianalloway/spendaudit): can an LLM auditor match an executable payment policy?

**Question:** when an LLM reviews an agent's payments against a written policy, does its verdict match what the policy actually computes, and does an instruction planted in a payment memo change it?

**Design:** 160 synthetic payment histories, each labeled by SOLVENT's deterministic spend policy and paired with a copy whose memo argues for the wrong verdict (320 items). Three models were tested under a verdict-only protocol and under one that requires rule-by-rule evidence and arithmetic, and results are compared on the scenarios each model answered in every condition.

**Findings:** requiring evidence cut false approvals on clean traces from 34 to 6 and from 47 to 18 (exact McNemar p < 10⁻⁷) with zero false rejections in the models’ respective matched subsets, but injected memos still got violating payments approved for every model.

**What you can inspect:** a working paper, the dataset (CC BY 4.0), every model response, and a one-command recount of each table.

[Working paper (PDF)](https://github.com/ianalloway/spendaudit/blob/main/paper/spendaudit.pdf) · [Benchmark and data](https://github.com/ianalloway/spendaudit) · [Reproduce the tables](https://github.com/ianalloway/spendaudit#reproducing) · [Cite](https://github.com/ianalloway/spendaudit/blob/main/CITATION.cff)

---

## Also building

**[AI Advantage Sports](https://github.com/ianalloway/ai-advantage)**: a deployed React / TypeScript product for odds, Kelly-based stake sizing, calibration views, and portfolio risk, with server-side Stripe entitlement handlers. The related training demo uses synthetic data; its metrics are not evidence of live betting returns. [Live product](https://aiadvantagesports.com) · [Case study](docs/case-study-ai-advantage.md) · [Screenshot](https://github.com/ianalloway/ai-advantage/blob/main/screenshot.png)

**[openclaw-skills](https://github.com/ianalloway/openclaw-skills)**: 17 tested, installable skills for the [OpenClaw](https://github.com/openclaw/openclaw) assistant covering sports analytics, market data, and LLM-judge auditing with juryrig. Published skills include [judge-audit on ClawHub](https://clawhub.ai/ianalloway/skills/judge-audit).

---

## Experience

- **Founder, Alloway LLC**: applied ML products, analytics tooling, and autonomous agent systems (including [AI Advantage Sports](https://aiadvantagesports.com))
- **Contract @ Handshake AI** (Jun–Oct 2026): graded frontier-model output on software-engineering and agent tasks; side-by-side preference evals and reviews of agent-built apps
- **Contract @ Mercor & Turing**: building agent eval environments, golden answers, and grader rubrics (audit/accounting, spreadsheet automation)

---

## Libraries and tools

| Area | Projects |
|---|---|
| Sports libraries & experiments | [nba-ratings / nba-edge](https://github.com/ianalloway/nba-ratings) — ratings and probability · [kelly-js](https://github.com/ianalloway/kelly-js) — odds and stake math · [sports-betting-ml](https://github.com/ianalloway/sports-betting-ml) — synthetic training demo |
| Agent extensions | [openclaw-theme-neon](https://github.com/ianalloway/openclaw-theme-neon) — theme with a [preview](https://ianalloway.github.io/openclaw-theme-neon/) |
| Web & experiments | [ian-web-forge](https://github.com/ianalloway/ian-web-forge) — portfolio · [matrix-rain](https://github.com/ianalloway/matrix-rain) — React animation · [evm-sentry](https://github.com/ianalloway/evm-sentry) — on-chain scanner |
| Upstream | LiteLLM (open): [#48895](https://github.com/BerriAI/litellm/pull/48895) reap the killed Prisma engine so it no longer lingers as a zombie process · [#49448](https://github.com/BerriAI/litellm/pull/49448) run the Docker images under tini so orphaned Prisma processes are reaped |
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

**Evaluation:** LLM-as-judge auditing · rubric & preference evals · agent evals · calibration · benchmark design  
**Data:** SQL · SQLite · PostgreSQL · Pandas · reproducible analysis in CI  
**Languages:** Python · TypeScript · SQL · JavaScript  
**AI / ML:** OpenAI · NVIDIA Nemotron · LangChain · scikit-learn · XGBoost  
**Product & infra:** FastAPI · Next.js / React · Stripe · Docker · GitHub Actions · PyPI packaging · Hugging Face Spaces

---

<img src="https://raw.githubusercontent.com/ianalloway/ianalloway/main/banner-footer.svg" width="100%" alt="" />
