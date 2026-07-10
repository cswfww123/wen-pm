---
name: prototype
description: Continue a canonical Prototype disposition by building one disposable artifact for one product, logic, state, or UI learning question.
---

# Prototype

Build throwaway code that answers one question before the team commits to a
PRD, issue slice, or production implementation.

## Pick A Branch

Choose the branch from the question being tested:

- Logic/state question: load [LOGIC.md](LOGIC.md).
- UI/product surface question: load [UI.md](UI.md).

If the branch is ambiguous, infer from repo evidence. Backend services,
state machines, data shapes, pricing rules, quotas, and permissions usually use
the logic branch. Pages, components, dashboards, forms, and workflows usually
use the UI branch. State the assumption before writing prototype code.

## Shared Rules

- Make the question explicit before writing code.
- Keep the prototype obviously disposable in path, filename, README, or comment.
- Use the host project's existing runtime and conventions.
- Avoid production persistence unless persistence is the question.
- Do not add a new package manager, framework, or permanent abstraction.
- Provide one command or URL that lets the user try it.
- Capture the answer in an issue, ADR, PRD note, commit message, or nearby
  `NOTES.md`.
- Delete, absorb, or promote the winning decision when the prototype has served
  its purpose.
- Read [`../pm-process-retro/learnings/ACTIVE.md`](../pm-process-retro/learnings/ACTIVE.md) when present. If ACTIVE required a Prototype for form IA / multi-entity completion risk and this run was skipped or the wrong question was tested, log a candidate `PL-*` via `pm-process-retro` after recording the product learning.
- Visual-only preferences (tint, chrome) are not learning questions unless tied to a completion or error metric.

## Done

The prototype is done when it has answered the named question and the durable
answer is recorded somewhere the next agent can find. The throwaway code should
not remain as unexplained production code.
