---
name: grill-for-me
description: Autonomously stress-test a plan using two parallel subagents — Architect and Critic — that debate each decision before asking you only what they cannot resolve. Use when user wants the system to do the grilling (not just ask questions), mentions "/grill-for-me", or wants a two-agent design review.
---

# Grill For Me

Two subagents — **Architect** and **Critic** — run in parallel per question. They debate each decision independently, then you're asked only what they can't settle between them.

## Loop (repeat until tree is resolved)

### 1. Explore the codebase
Before spawning agents, read any directly relevant files. If the question can be resolved from the code, record the answer and skip to the next decision — don't ask.

### 2. Spawn Architect + Critic in parallel

Fire both Agent calls in the **same message** (parallel execution):

**Architect agent prompt:**
```
You are the Architect. Context: [paste full plan + any codebase findings].

Identify the single most important UNRESOLVED decision right now — the one that constrains the most others.

Return exactly:
QUESTION: <the decision to resolve>
RECOMMENDATION: <your preferred answer>
RATIONALE: <one sentence why>
```

**Critic agent prompt:**
```
You are the Critic. Context: [paste full plan + any codebase findings].

Identify the strongest objection to the most likely path forward on the current key decision.

Return exactly:
CHALLENGE: <the risk, gap, or alternative worth surfacing>
```

### 3. Synthesise and ask

Combine both outputs into one question for the user:

```
**Decision:** <QUESTION from Architect>

**Architect recommends:** <RECOMMENDATION> — <RATIONALE>

**Critic challenges:** <CHALLENGE>

Your call (enter to accept recommendation):
```

### 4. Record and continue

Mark the decision resolved. Move to the next highest-leverage open decision.

## End condition

When every branch of the decision tree is resolved, output a numbered summary of all decisions made.

## Notes

- The Architect and Critic run with **separate context** — the Critic cannot see how the Architect framed its question, keeping the challenge genuine.
- Start with architecture before implementation; data models before APIs; interfaces before internals.
- If the plan is vague, the Architect's first question should be: "What is the core problem this solves?"
