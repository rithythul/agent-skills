---
name: to-issues
author: KOOMPI
description: Break a plan, spec, or PRD into independently-grabbable issues on the project issue tracker using tracer-bullet vertical slices. Use when user wants to convert a plan into issues, create implementation tickets, or break down work into issues.
---

Break a plan into independently-grabbable issues using vertical slices (tracer bullets).

## Setup

Uses GitHub Issues via `gh` CLI. Run `gh auth status` to confirm authentication.

Required labels — create them if missing:
```bash
gh label create "needs-triage" --color "#ededed" --force
gh label create "ready" --color "#0075ca" --force
gh label create "in-progress" --color "#e4e669" --force
```

## Process

### 1. Gather context

Work from the current conversation. If the user passes an issue number or URL, fetch it:
```bash
gh issue view <number> --json title,body,comments
```

### 2. Explore the codebase

If not already done, explore relevant areas. Issue titles and descriptions must use the project's domain vocabulary.

### 3. Draft vertical slices

Each issue is a thin end-to-end cut through ALL layers — not a horizontal layer slice.

Rules:
- Each slice delivers a narrow but complete path (schema → API → UI → tests)
- A completed slice is demoable or verifiable on its own
- Prefer many thin slices over few thick ones
- Mark each slice HITL (requires human) or AFK (fully autonomous)

### 4. Review with user

Show the proposed breakdown:
- **Title**, **Type** (HITL/AFK), **Blocked by**, **User stories covered**

Ask: Is granularity right? Dependencies correct? HITL/AFK accurate?

Iterate until approved.

### 5. Publish issues

Publish in dependency order (blockers first). Apply `needs-triage` label to each.

Use this issue body:

```
## What to build

[End-to-end behavior of this slice. Not layer-by-layer.]

## Acceptance criteria

- [ ] Criterion 1
- [ ] Criterion 2

## Blocked by

[Issue reference, or "None — can start immediately"]

## Type

[HITL / AFK]
```

Do NOT close or modify any parent issue.

## After publishing

Tell the user: "Issues created with `needs-triage`. Review them, then label the ones you want built as `ready` to start the implement loop."
