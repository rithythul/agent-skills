<img src="assets/koompi-logo.svg" alt="KOOMPI" height="40" />

# agent-skills

Workflow skills for Claude Code. By KOOMPI.

## Pipeline

```
grill-me → to-prd → to-issues → triage → implement
```

| Skill | What it does |
|---|---|
| `grill-me` | Relentless one-at-a-time interview to stress-test your plan |
| `to-prd` | Synthesizes conversation into a structured PRD, publishes to GitHub Issues |
| `to-issues` | Breaks PRD into vertical slice issues with acceptance criteria |
| `triage` | Reviews each `needs-triage` issue with you one by one — approve, edit, skip, or close before any code runs |
| `implement` | Ralph-loop that works through `ready` issues using TDD, closes each on completion |

## Requirements

- [Claude Code](https://claude.ai/code) with `gh` CLI authenticated
- [ralph-loop plugin](docs/ralph-loop.md) — required for `implement`
- GitHub-backed repo (skills use `gh` to read/write issues)

## Install

```bash
git clone https://github.com/rithythul/agent-skills
cd agent-skills
./install.sh
```

Run `./install.sh` from inside your project directory to also create the required GitHub labels (`needs-triage`, `ready`, `in-progress`).

## Usage

```
1. /grill-me    — stress-test your idea
2. /to-prd      — write and publish PRD
3. /to-issues   — break PRD into issues (labeled needs-triage)
4. /triage      — review each issue with you, label approved ones ready
5. /implement   — ralph-loop builds everything, closes issues as it goes
```

## Docs

- [Pipeline walkthrough](docs/pipeline.md)
- [ralph-loop setup](docs/ralph-loop.md)

## Statusline

`install.sh` also installs a colored statusline (skip with `--no-statusline`):

```
➜ repo:branch✗ │ Sonnet 4.6 v2.0.31 │ 3m12s │ ctx:130k/200k 65% │ +42/-12 │ ⚡xhigh │ 🧠think
```

Shows: repo + branch (red if dirty), model + Claude Code version, session duration, context usage (yellow ≥50%, red ≥65%), lines added/removed, and reasoning-effort / thinking / vim / rate-limit indicators when relevant.

The `ctx` color flips red at 65% — matches the `CLAUDE_AUTOCOMPACT_PCT_OVERRIDE=65` setting (compact at ~130k on 200k models, ~650k on 1M). Set that env var separately if you want auto-compact too.

If you already have a `statusLine` configured, install will print a snippet instead of overwriting it.

## Token efficiency

`install.sh` automatically adds a `directives.md` include to your `~/.claude/CLAUDE.md`. This ships a caveman mode directive — prefix any message with `!c` to compress Claude's output ~75% for the session.

```
!c /grill-me    — terse questions, no padding
!c /to-prd      — lean PRD, no filler prose
!c /to-issues   — issue list only, no explanation
!c /triage      — one-line per issue, approve/skip/close
!c /implement   — status updates only, no narration
```

Say `normal mode` to restore full output. Directives stay current with `git pull` — no re-install needed.

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
