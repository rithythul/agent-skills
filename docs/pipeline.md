# Pipeline Walkthrough

## Full flow

### 1. grill-me
Invoke: `/grill-me`

One-at-a-time interview. Each question comes with a recommended answer. Explores the codebase instead of asking when answers are derivable from code. Run until you have no more unresolved decisions.

### 2. to-prd
Invoke: `/to-prd`

Synthesizes the conversation into a structured PRD and publishes it to GitHub Issues with label `needs-triage`. No interview — it uses what is already in context.

### 3. to-issues
Invoke: `/to-issues` or `/to-issues <issue-number>`

Breaks the PRD into tracer-bullet vertical slices. Each slice is end-to-end (schema → API → UI → tests), demoable on its own, and marked HITL or AFK. Published to GitHub Issues with label `needs-triage`.

**After this step:** review the issues. Label the ones you want built `ready`. This is the human gate.

### 4. implement
Invoke: `/implement`

Starts a ralph-loop. Each iteration picks the next `ready` issue, implements it (TDD for code issues, direct for non-code), commits, closes the issue, and moves on. Stops when no `ready` issues remain.

## Re-entry

If requirements change mid-loop:
1. `/cancel-ralph` — stop the current loop
2. Close stale issues manually on GitHub
3. `/to-prd` — rewrite PRD with updated context
4. `/to-issues` — regenerate issues
5. Label new issues `ready`, restart `/implement`
