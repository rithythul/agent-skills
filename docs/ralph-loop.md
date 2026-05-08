# ralph-loop

`implement` requires the ralph-loop plugin. It is maintained separately.

## Install

Inside Claude Code:
```
/plugins install ralph-loop@claude-plugins-official
```

Or via the Claude Code plugin marketplace UI.

## What it does

ralph-loop keeps Claude in a self-referential loop: when Claude tries to exit, the same prompt is fed back with the previous output in context. Claude iterates until it outputs a specific `<promise>` tag.

`implement` uses this to work through issues one by one without human re-prompting.

## Commands

- `/ralph-loop <prompt> [--max-iterations N] [--completion-promise TEXT]` — start loop
- `/cancel-ralph` — stop active loop

## Troubleshooting

If `implement` exits without closing all issues: check `gh issue list --label ready` — any remaining issues were not picked up. Re-run `/implement`.
