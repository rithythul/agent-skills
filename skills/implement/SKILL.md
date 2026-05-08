---
name: implement
author: KOOMPI
description: Implement all ready issues from the issue tracker using ralph-loop + TDD. Run after to-issues has created tickets.
triggers:
  - "implement the prd"
  - "start implementing"
  - "run the build loop"
  - "/implement"
---

Work through each `ready`-labeled issue using TDD. Requires the ralph-loop plugin — see docs/ralph-loop.md.

## Pre-flight

```bash
gh auth status          # must be authenticated
gh label list | grep ready   # label must exist
```

## Loop behavior (per iteration)

1. Find the next open issue labeled `ready`:
   ```bash
   gh issue list --label ready --state open --limit 1 --json number,title,body
   ```
2. Add label `in-progress`, remove label `ready`
3. Read the issue body. Determine issue type:
   - **Code issue** (feature, bug, refactor): apply TDD — write failing test first, implement until it passes, refactor
   - **Non-code issue** (docs, config, CI, infra): implement directly, verify the acceptance criteria are met without a test cycle
4. Commit the work with a message referencing the issue number
5. Close the issue: `gh issue close <number> --comment "Implemented in <commit>"`
6. Move to the next `ready` issue

## Completion

When `gh issue list --label ready --state open` returns empty, output exactly:
<promise>all issues implemented and tested</promise>

## How to start

```bash
/ralph-loop "implement next ready issue — code issues use TDD (failing test first), non-code issues implement and verify acceptance criteria, commit and close each, repeat until no ready issues remain" --completion-promise "all issues implemented and tested"
```

For large PRDs add `--max-iterations N`.

## Re-entry

If the PRD changes mid-loop: cancel with `/cancel-ralph`, close stale issues manually, re-run `to-prd` and `to-issues`, relabel new issues `ready`.
