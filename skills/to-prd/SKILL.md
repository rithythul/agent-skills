---
name: to-prd
author: Matt Pocock
source: https://github.com/mattpocock/skills
description: Turn the current conversation context into a PRD and publish it to the project issue tracker. Use when user wants to create a PRD from the current context.
---

Synthesize the current conversation and codebase into a PRD. Do NOT interview the user — use what you already know.

## Setup

This skill uses GitHub Issues via the `gh` CLI. Ensure `gh` is authenticated (`gh auth status`) and you are inside a GitHub-backed repo.

Labels used:
- `needs-triage` — applied to new PRD issues; a human must promote to `ready` before implement runs

## Process

1. Explore the repo to understand current state. Use the project's domain vocabulary throughout. Respect any ADRs in the area you are touching.

2. Sketch the major modules to build or modify. Look for deep modules: high functionality behind a simple, stable, testable interface. Check with the user that the module breakdown matches their expectations.

3. Write the PRD using the template below, then publish it to GitHub Issues with label `needs-triage`.

<prd-template>

## Problem Statement

The problem the user faces, from the user's perspective.

## Solution

The solution, from the user's perspective.

## User Stories

A numbered list. Each story: `As a <actor>, I want <feature>, so that <benefit>`. Cover all aspects of the feature.

## Implementation Decisions

- Modules to build or modify
- Interface changes
- Architectural decisions
- Schema changes
- API contracts

Do NOT include file paths or code snippets — they go stale.

## Testing Decisions

- What makes a good test for this feature (test behavior, not implementation)
- Which modules get tests
- Prior art in the codebase

## Out of Scope

What this PRD does not cover.

## Further Notes

Anything else relevant.

</prd-template>

## After publishing

Tell the user: "PRD published. Label issues `ready` to start the implement loop."
