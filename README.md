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

## License

MIT © KOOMPI · [koompi.com](https://koompi.com)
