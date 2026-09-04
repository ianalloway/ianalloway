<img src="https://raw.githubusercontent.com/ianalloway/ianalloway/main/banner.svg" width="100%" alt="IAN ALLOWAY — Applied AI · Agent Systems · Data Products" />

<div align="center">

[![Portfolio](https://img.shields.io/badge/Portfolio-ianalloway.xyz-00d9ff?style=for-the-badge&logo=vercel&logoColor=white&labelColor=0a0e27)](https://ianalloway.xyz)
[![Live Product](https://img.shields.io/badge/AI_Advantage_Sports-Live-16c784?style=for-the-badge&logo=rocket&logoColor=white&labelColor=0a0e27)](https://aiadvantagesports.com)
[![Resume](https://img.shields.io/badge/Resume-PDF-16c784?style=for-the-badge&logo=googledrive&logoColor=white&labelColor=0a0e27)](https://github.com/ianalloway/ianalloway/raw/main/Ian_Alloway_Resume_CV.pdf)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin&logoColor=white&labelColor=0a0e27)](https://www.linkedin.com/in/ianit)
[![Email](https://img.shields.io/badge/Email-ian%40allowayllc.com-FF6B6B?style=for-the-badge&logo=gmail&logoColor=white&labelColor=0a0e27)](mailto:ian@allowayllc.com)
[![Substack](https://img.shields.io/badge/Writing-Alloway_AI-FF6719?style=for-the-badge&logo=substack&logoColor=white&labelColor=0a0e27)](https://allowayai.substack.com)

</div>

---

## About

**Applied AI / eval / agent systems** · sports decision products · Alloway LLC.

I build and evaluate systems at the intersection of AI products, agent tooling, and decision software that has to hold up under scrutiny.

- **Contract @ Handshake AI** — evaluating ChatGPT app development and agent-built software across engineering, logic, design, and product quality
- **Founder, Alloway LLC** — applied ML products, analytics tooling, and autonomous agent systems (including [AI Advantage Sports](https://aiadvantagesports.com))
- B.S. Information Science, magna cum laude · M.S. Artificial Intelligence candidate — University of South Florida

I care about things that still hold up when someone looks closely & over time.

---

## 🧭 Recent Work

Living checklist of what I've been shipping lately (not archived demos):

| Area | What landed |
|---|---|
| **[ai-advantage](https://github.com/ianalloway/ai-advantage)** | TypeScript 7 upgrade on the live sports product; smoke/CI hardening for [aiadvantagesports.com](https://aiadvantagesports.com) |
| **[sports-betting-ml](https://github.com/ianalloway/sports-betting-ml)** | Odds/Kelly math guards, shared h2h odds helper, Docker CI on PRs |
| **[juryrig](https://github.com/ianalloway/juryrig)** | Zero-dep LLM-as-judge audits (position / verbosity / injection / calibration) |
| **[solvent-agent](https://github.com/ianalloway/solvent-agent)** | Self-funding agent loop — earn → fulfil → spend → book P&L (hackathon demo) |
| **[deathcon-api](https://github.com/ianalloway/deathcon-api)** | FastAPI AI chat + webhook handler (YAML/env-driven ops surface) |

Eval notes that still matter (repo archived, write-up lives on): browser automation remains a hard agent benchmark — [Substack](https://allowayai.substack.com/p/the-browser-is-the-real-agent-benchmark) · [checklist](https://github.com/ianalloway/browser-agent-benchmark).

---

## 🛠 Tech Stack

<div align="center">

**Languages**

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)

**AI / ML**

![NVIDIA](https://img.shields.io/badge/NVIDIA_Nemotron-76B900?style=for-the-badge&logo=nvidia&logoColor=white)
![OpenAI](https://img.shields.io/badge/OpenAI-412991?style=for-the-badge&logo=openai&logoColor=white)
![LangChain](https://img.shields.io/badge/LangChain-1C3C3C?style=for-the-badge&logo=langchain&logoColor=white)
![scikit-learn](https://img.shields.io/badge/scikit--learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)

**Backend & APIs**

![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white)
![Stripe](https://img.shields.io/badge/Stripe-635BFF?style=for-the-badge&logo=stripe&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)

**Frontend**

![React](https://img.shields.io/badge/React-61DAFB?style=for-the-badge&logo=react&logoColor=black)
![Next.js](https://img.shields.io/badge/Next.js-000000?style=for-the-badge&logo=next.js&logoColor=white)
![Vite](https://img.shields.io/badge/Vite-646CFF?style=for-the-badge&logo=vite&logoColor=white)

**Tooling**

![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![pytest](https://img.shields.io/badge/pytest-0A9EDC?style=for-the-badge&logo=pytest&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)

</div>

---

## 🚀 Featured Projects

### 🪙 [SOLVENT](https://github.com/ianalloway/solvent-agent) — Self-Funding AI Agent
> *Built for the NVIDIA × Stripe × Nous Research Hackathon*

An AI agent that **runs as a business loop**: sells research briefs, collects payment via Stripe, provisions compute from its own revenue, and refuses jobs that don't clear a margin. Demo runs book a full P&amp;L (earn → fulfil → spend); dollar figures in the demo are illustrative of the loop, not production revenue.

```
 Client pays Stripe → Agent earns → Agent fulfils → Agent pays vendors → P&L booked
```

Sponsor stack: NVIDIA Nemotron · Stripe Issuing · NemoClaw-style guardrails.

[![View SOLVENT →](https://img.shields.io/badge/View_SOLVENT-0a0e27?style=for-the-badge&logo=github&logoColor=00d9ff)](https://github.com/ianalloway/solvent-agent)

---

### ⚖️ [juryrig](https://github.com/ianalloway/juryrig)
Zero-dependency Python toolkit for auditing LLM-as-judge pipelines — position-bias and verbosity-bias detection, judge panels with agreement scoring, and calibration (Brier, ECE) against human labels.

[![View juryrig →](https://img.shields.io/badge/View_juryrig-0a0e27?style=for-the-badge&logo=github&logoColor=16c784)](https://github.com/ianalloway/juryrig)

---

### 🏈 [AI Advantage Sports](https://github.com/ianalloway/ai-advantage)
Full-stack sports analytics product with live ML predictions, Kelly-based sizing, and a real deployed surface at [aiadvantagesports.com](https://aiadvantagesports.com).

**Stack layering:** [nba-ratings](https://github.com/ianalloway/nba-ratings) (Python) → [kelly-js](https://github.com/ianalloway/kelly-js) (TS) → [sports-betting-ml](https://github.com/ianalloway/sports-betting-ml) (training demo) → [ai-advantage](https://github.com/ianalloway/ai-advantage) (product).

[![View AI Advantage →](https://img.shields.io/badge/View_AI_Advantage-0a0e27?style=for-the-badge&logo=github&logoColor=16c784)](https://github.com/ianalloway/ai-advantage)

---

### 📐 [nba-ratings](https://github.com/ianalloway/nba-ratings) · [kelly-js](https://github.com/ianalloway/kelly-js) · [sports-betting-ml](https://github.com/ianalloway/sports-betting-ml)
Libraries and demos behind the sports stack (featured pins — not archived awesome-lists).

| Repo | One-liner |
|---|---|
| [nba-ratings](https://github.com/ianalloway/nba-ratings) | Elo, win probability, calibration — published on PyPI as **nba-edge** |
| [kelly-js](https://github.com/ianalloway/kelly-js) | Kelly sizing, CLV, bankroll stats — TypeScript, zero deps (npm publish pending) |
| [sports-betting-ml](https://github.com/ianalloway/sports-betting-ml) | Streamlit training / value-bet demo (synthetic demo metrics) |

More projects and demos: **[ianalloway.xyz](https://ianalloway.xyz)**

---

## 📡 What I'm Building Now

- Autonomous agent systems with real economic loops (earn, spend, book P&L)
- Evaluation tooling that makes model and app behavior inspectable and trustworthy
- Applied ML products where the evaluation layer is part of the system, not an afterthought
- Sports decision systems — ratings → edge → Kelly → live product ([AI Advantage](https://aiadvantagesports.com))

---

## 😂 Mandatory Meme

<div align="center">

<img src="https://raw.githubusercontent.com/ianalloway/ianalloway/main/solvent_meme.png" width="480" alt="Other agents vs SOLVENT meme" />

*other agents can spend money · SOLVENT gates spend on margin*

</div>

---

## 📊 GitHub Stats

<div align="center">

<img src="https://streak-stats.demolab.com?user=ianalloway&theme=transparent&hide_border=true&ring=00d9ff&fire=16c784&currStreakLabel=16c784&sideNums=cdd2c5&sideLabels=cdd2c5&dates=cdd2c5" height="170" alt="GitHub Streak" />

<img src="https://github-readme-activity-graph.vercel.app/graph?username=ianalloway&theme=react-dark&hide_border=true&bg_color=0a0e27&color=16c784&line=00d9ff&point=16c784" width="95%" alt="Contribution Graph" />

</div>

---

<img src="https://raw.githubusercontent.com/ianalloway/ianalloway/main/banner-footer.svg" width="100%" alt="" />
