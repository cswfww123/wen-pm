---
name: to-prd
description: Write a Build/Bet Product Delivery Contract with REQ/AC and UI contract when needed.
---

# To PRD

Turn an authorized product decision into a **Product Delivery Contract** — a
durable, ID-stable package engineering can admit without re-discovering intent.
Synthesize what is known and investigate repository-owned facts; do not reopen
discovery as an interview.

Before acting, read all of the canonical
[evidence model](../pm-intake/references/evidence-model.md). Use its product-evidence
gate, dispositions, and complete `Bet` contract. See
[docs/boundaries.md](../../docs/boundaries.md) for the engineering handoff spine.

## Admission Gates

Both gates must pass before any solution or requirement is written.

### Alignment gate

- target actor, problem, desired outcome, and current alternative are explicit
- current and expected behavior are distinguished for an existing product
- scope, non-scope, flows, business rules, edge cases, and constraints are settled
- intended behavior and acceptance examples are authorized `D-*` records
- decision owners and remaining non-blocking follow-ups are explicit

### Delivery authorization gate

The upstream disposition is exactly one of:

- **Build**: every canonical `Build` criterion is satisfied and the Product Evidence Gate passes.
- **Bet**: an accountable owner supplied the required `D-*`, unsupported `A-*`, investment cap, expiry date, measurement plan, rollback path, and kill threshold. Every downstream requirement will remain labeled `Bet`.

If either gate fails, produce only a local blocking-gap report and route to the canonical next disposition. A blocking report contains no solution, `REQ-*`, or `AC-*` sections.

Before drafting, read [`../pm-process-retro/learnings/ACTIVE.md`](../pm-process-retro/learnings/ACTIVE.md) when present. If a matching scenario still lacks forced rules/AC (e.g. conditional-field matrix, multi-entity ops), fail admission and route back to grilling/alignment—not into solution prose.

When a PRD is blocked or a later rework shows the PRD altitude was wrong, recommend one `pm-process-retro` capture so ACTIVE/skills gain the missing force.

## Steps

### 1. Gather the source record

Read the alignment brief, canonical Evidence Ledger, experiment results, Decision Log, and relevant repository artifacts. Preserve `EV-*`, `ST-*`, `D-*`, `A-*`, and `X-*` records. Assign IDs through the canonical model when a source lacks them; keep contradictions separate.

When a requirement depends on current code behavior, trace the relevant entrypoint, rules, state transitions, permissions, data changes, integrations, and test seams before describing the delta.

**Complete when:** every input has a durable locator, current-state technical claims have repository sources, and all contradictions and unsupported assumptions remain visible.

### 2. Run the admission gates

Record `PASS` or `FAIL` for every gate row with supporting IDs. On any failure, save `docs/prd/YYYY-MM-DD-<slug>-blocked.md` or the repository's equivalent, using the blocking-report template below, then stop this skill.

**Complete when:** either both gates pass, or a local blocking report exists with one canonical disposition, owner, action, and observable exit condition for every gap.

### 3. Draft requirements and acceptance

Write user-visible behavior and business rules with stable IDs (`REQ-001`, ...). Write business-readable scenario acceptance with stable IDs (`AC-001`, ...). Preserve `Current -> Expected -> Delta` for existing-product changes.

Each requirement cites:

- the `D-*` that authorizes it
- the product-evidence IDs that support it, or the unsupported `A-*` and `D-*` Bet authorization
- the `AC-*` that verifies it
- `Build` or `Bet` as its authorization

Record implementation and testing decisions only to the level supported by repository evidence. Keep technical options separate from settled product behavior.

**Complete when:** every in-scope behavior has a requirement, every requirement has acceptance, and every requirement traces to evidence or a fully bounded Bet plus a decision.

### 4. Draft the UI contract when the surface is visual

If the change has a user-visible surface, load [UI-CONTRACT.md](UI-CONTRACT.md)
and write screens `SCR-*`, fields `FLD-*`, linkage `RULE-*`, UI states, and a
**pinned delivery prototype** (versioned path/URL). Learning-only prototypes are
not delivery truth.

If the surface is visual and the UI contract is incomplete (missing field rows,
conditional rules, or prototype pin), fail this step: save a blocking gap or
keep the PRD out of `Ready for delivery review` until fixed. Do not hand off
prose-only UI to engineering.

**Complete when:** either `UI Contract: none — no user-visible surface`, or the
UI completeness gate in `UI-CONTRACT.md` passes.

### 5. Validate traceability

Check forward and backward:

- every source decision is represented or explicitly out of scope
- every `REQ-*` maps to `EV-*` or `X-*` for Build, or to explicit `A-*` plus the Bet `D-*`
- every `REQ-*` maps to `D-*` and at least one `AC-*`
- every `AC-*` maps to at least one requirement
- every UI `FLD-*` / `RULE-*` maps to at least one `AC-*` when a UI contract exists
- success, rollback, and kill criteria map to the outcome or bounded Bet
- contradictions, protected behavior, deferred behavior, and non-goals remain visible

**Complete when:** the traceability matrix has no orphan requirement, acceptance criterion, authorization, UI rule, or source decision.

### 6. Save locally, then recommend the handoff spine

Follow the repository's PRD convention. If none exists, save to `docs/prd/YYYY-MM-DD-<slug>.md`. The local PRD is authoritative.

Create an external tracker item only when the user explicitly asks. After successful publication, write the returned URL or identifier into the local PRD.

**Complete when:** the local PRD exists with gate results, source locators, canonical records, authorization, UI disposition, and complete traceability; any requested external reference is recorded.

## Blocking Report Template

```md
# PRD Blocked: <product / change>

## Sources Inspected
- ...

## Admission Gates
| Gate item | PASS / FAIL | Supporting IDs | Gap owner | Required action | Exit condition |
|---|---|---|---|---|---|

## Routed Disposition
- Disposition: Kill | Pause | Discovery | Experiment | Prototype | Pivot | Align
- Supporting IDs:
- Next action:
```

## PRD Template

```md
# <Product / Change> PRD

## Metadata
- Status: Ready for delivery review | Blocked — UI contract incomplete
- Owner:
- Date / version:
- Source artifacts:
- Source disposition: Bet | Build
- Product Evidence Gate: PASS | FAIL because this is an authorized Bet
- UI Contract: none — no user-visible surface | present — see section
- External reference: None | <URL or ID>

## Admission Gates
| Gate item | PASS | Supporting IDs |
|---|---|---|

## Problem And Outcome
- Target actor and situation:
- Problem and consequence:
- Current alternative:
- Desired user and business outcome:

## Evidence Ledger
| ID | Type | Claim | Source | Scope | Support | Strength | Implication |
|---|---|---|---|---|---|---|---|

## Decision Log
| Decision ID | Decision | Owner | Date | Scope | Evidence / assumptions | Revisit trigger |
|---|---|---|---|---|---|---|

## Bounded Bet Contract
Omit for Build. For Bet: unsupported assumptions, investment cap, expiry, measurement, rollback, and kill threshold.

## Current -> Expected -> Delta
Omit only for a genuinely new product.

## Scope
### In Scope
### Out Of Scope

## Flows And Business Rules
- actors and triggers
- main, alternate, and error flows
- permissions, boundaries, and constraints

## Requirements
| ID | Required behavior / rule | Evidence or Bet IDs | Decision IDs | Acceptance IDs | Authorization |
|---|---|---|---|---|---|

## Acceptance Criteria
- [ ] AC-001 — Given ... when ... then ...

## UI Contract
Omit only when Metadata says none. Otherwise include Delivery Prototype pin,
Screens, Fields, Linkage Rules, and UI States per [UI-CONTRACT.md](UI-CONTRACT.md).

## Success, Rollback, And Kill Criteria
- ...

## Implementation And Testing Decisions
- repository-grounded modules, interfaces, migrations, contracts, and test seams
- do not invent UI beyond the UI Contract

## Non-Blocking Follow-ups
- owner, action, and review trigger

## Traceability Matrix
| Requirement | Evidence / assumption / result | Decision | Acceptance | UI (SCR/FLD/RULE) | Authorization |
|---|---|---|---|---|---|
```

## After The PRD Exists

Default agent handoff spine (in order):

1. **`test-scenarios`** — produce `SCN-*` that exercise every material `AC-*`
   and every `RULE-*` / UI state when a UI contract exists.
2. **Companion `wen-engineering`**: `/to-spec` → `/to-tickets` → `/implement`
   using this PRD (+ scenarios + UI contract) as settled product input.
3. **`to-issues`** — **optional**, only for human planning boards; never the
   agent execution source of truth.

Do not reopen product discovery inside engineering unless gates fail.
Technical multi-session fog after settlement is engineering's slim `/wayfinder`.
See [docs/boundaries.md](../../docs/boundaries.md).
