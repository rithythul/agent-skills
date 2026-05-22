<img src="assets/koompi-logo.svg" alt="KOOMPI" height="40" />

# agent-skills

A curated collection of Claude Code skills we use daily. Pulled from the best open-source skill authors and extended with our own.

## Skills

### Planning pipeline

The core workflow — takes an idea from rough thought to shipped issues.

```
grill-me → to-prd → to-issues → triage → implement
```

| Skill | What it does |
|---|---|
| `grill-me` | Relentless one-at-a-time interview to stress-test your plan |
| `grill-for-me` | Two parallel subagents (Architect + Critic) debate each decision; you only answer what they can't settle |
| `to-prd` | Synthesizes conversation into a structured PRD, publishes to GitHub Issues |
| `to-issues` | Breaks PRD into vertical slice issues with acceptance criteria |
| `triage` | Reviews each `needs-triage` issue with you one by one — approve, edit, skip, or close before any code runs |
| `implement` | Ralph-loop that works through `ready` issues using TDD, closes each on completion |

### Engineering

| Skill | What it does |
|---|---|
| `diagnose` | Disciplined debugging loop: reproduce → minimise → hypothesise → instrument → fix → regression-test |
| `tdd` | Red-green-refactor TDD loop with full reference docs on deep modules, mocking, and refactoring |
| `improve-codebase-architecture` | Surfaces architectural friction and deepening opportunities informed by CONTEXT.md and ADRs |
| `grill-with-docs` | Grilling session that sharpens plan against the domain model and updates CONTEXT.md / ADRs inline |
| `prototype` | Throwaway prototype to answer a design question — terminal app or multi-variant UI route |

### Design

| Skill | What it does |
|---|---|
| `impeccable` | Full frontend design lifecycle: audit, shape, craft, polish, live variant mode, design system extraction |

### Writing

| Skill | What it does |
|---|---|
| `humanize` | Rewrites AI-generated text to read as naturally human — targets template phrases, uniform cadence, passive voice, hedging, and 14 other structural AI tells |

### Productivity

| Skill | What it does |
|---|---|
| `handoff` | Compacts the current conversation into a doc so a fresh agent can continue |
| `write-a-skill` | Guided authoring of new skills with proper structure and bundled reference files |
| `zoom-out` | Reorients the agent to a module's broader context using domain glossary vocabulary |
| `caveman` | Cuts output tokens ~75% without losing technical precision — prefix any message with `!c` |

## Requirements

- [Claude Code](https://claude.ai/code) with `gh` CLI authenticated
- [ralph-loop plugin](docs/ralph-loop.md) — required for `implement`
- GitHub-backed repo (pipeline skills use `gh` to read/write issues)

## Install

```bash
git clone https://github.com/rithythul/agent-skills
cd agent-skills
./install.sh
```

Run `./install.sh` from inside your project directory to also create the required GitHub labels (`needs-triage`, `ready`, `in-progress`).

## Statusline

`install.sh` also installs a colored statusline (skip with `--no-statusline`):

```
➜ repo:branch✗ │ Sonnet 4.6 v2.0.31 │ 3m12s │ ctx:130k/200k 65% │ +42/-12 │ ⚡xhigh │ 🧠think
```

Shows: repo + branch (red if dirty), model + Claude Code version, session duration, context usage (yellow ≥50%, red ≥65%), lines added/removed, and reasoning-effort / thinking / vim / rate-limit indicators when relevant.

## Security

Audited May 2026. All skills are safe to use with the following notes:

- **`implement` / `triage` / `to-issues`** interact with GitHub Issues. Issue body content is treated as data, not instructions — the skills include explicit guards against prompt injection. Standard caution applies when working with public or untrusted repos.
- **`impeccable`** runs `npx impeccable *` (wildcard scoped to that package) and starts a local HTTP server for live variant mode. Token-validated; no external data sent.
- All other skills are read/write local only with no network access.

## Credits

**[Matt Pocock](https://github.com/mattpocock)** — [`mattpocock/skills`](https://github.com/mattpocock/skills), MIT licensed.
`grill-me`, `to-prd`, `to-issues`, `tdd`, `diagnose`, `zoom-out`, `prototype`, `handoff`, `write-a-skill`, `grill-with-docs`, `improve-codebase-architecture`

**[Paul Bakaus](https://github.com/pbakaus)** — [`pbakaus/impeccable`](https://github.com/pbakaus/impeccable), Apache 2.0 licensed.
`impeccable`

**[Julius Brussee](https://github.com/JuliusBrussee)** — [`JuliusBrussee/caveman`](https://github.com/JuliusBrussee/caveman).
`caveman`

`implement`, `triage`, and `grill-for-me` were built on top of Matt Pocock's foundation, with the ralph-loop integration, human-gate pattern, and dual-subagent design review added.

## License

MIT © KOOMPI · [koompi.com](https://koompi.com)
