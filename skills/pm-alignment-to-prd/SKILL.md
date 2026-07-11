---
name: pm-alignment-to-prd
description: Continue a settled decision-alignment docket through a track-specific confirmation brief and disposition; emit a PRD-ready handoff only for canonical Build or a complete bounded Bet.
---

# PM Alignment To PRD

Turn a discovery docket into an explicit product decision. Agreement proves what the team chose; evidence proves whether the choice deserves investment. Keep those judgments separate.

## Steps

1. **Load the decision model**
   - Read `../pm-intake/references/evidence-model.md`.
   - Require `Discovery Track: existing-change | new-idea`.
   - For `existing-change`, read `references/existing-change.md`.
   - For `new-idea`, read `references/new-idea.md`.
   - Read `../pm-process-retro/learnings/ACTIVE.md` when present; matching scenario force must appear in the gate matrix (usually as Alignment FAIL or explicit Bet) until satisfied.
   - If the track is missing, route to `pm-intake` instead of guessing.
   - Completion criterion: the track, evidence types, evidence scope, and allowed dispositions are explicit; matching ACTIVE process force is listed.

2. **Run two independent gates**

   **Product Evidence Gate**
   - Apply the canonical Product Evidence Gate verbatim to every load-bearing Value, Usability, Feasibility, and Viability claim.
   - Any unresolved load-bearing Assumption makes this gate `FAIL`. Declared success, kill, and inconclusive thresholds make an `Experiment` eligible; they are not evidence and cannot make this gate pass.
   - Use the canonical `Support` field and evidence qualification rules without local exceptions or synonyms.

   **Alignment Gate**
   - Target user or role, problem, desired outcome, intended behavior, scope, out of scope, workflow, business rules, constraints, success metric, scenario-level acceptance examples, and decision owner are explicit.
   - Every authorizable alignment item is backed by a traceable `D-*` record from the correct owner. Any unresolved or disputed material item makes this gate `FAIL`.
   - Every track-specific requirement in the selected reference is present.

   Completion criterion: both gates are shown as `PASS | FAIL`, and every failed row names its evidence or decision owner and one next action.

3. **Write the track-specific alignment brief**
   - Preserve the Evidence Ledger, Terms Clarified, and Decision Log from discovery.
   - Link every material claim to an evidence item, decision, or explicit assumption.
   - Use the selected track reference as the stakeholder-facing brief and readiness checklist.
   - Completion criterion: no material statement appears without a type, source, and supported claim scope.

4. **Collect role-correct confirmation**
   - Customers and users confirm their observed experience and correct factual misunderstandings.
   - The accountable decision owner confirms intent, scope, trade-offs, success criteria, and any bounded bet.
   - Engineering or technical owners confirm feasibility claims.
   - Sales, operations, finance, legal, support, or other owners confirm the viability claims they own.
   - Mark every authorizable section `Approved | Changed — re-confirmation required | Disputed`. Merge a change back into the ledger, then read the revised wording back; only final `Approved` wording or an exact replacement `D-*` can pass Alignment.
   - Record confirmations as `ST-*` or authorized `D-*`. Confirmation changes only the Alignment Gate; the Product Evidence Gate changes only when the confirmation points to a qualifying existing `EV-*` or `X-*` record under the canonical scope and strength rules.
   - Mark evidence-only sections `Validated | Unvalidated | Contradicted` from the canonical gate. They need an evidence owner and next action, not customer approval, and may remain Unvalidated while the disposition routes to Discovery.
   - Completion criterion: every authorizable section is finally Approved by the correct role, every evidence gap has a status, owner, and action, silence and generic approval remain unresolved, and no confirmation has been promoted into product evidence.

5. **Red-team and decide**
   - When load-bearing assumptions remain, mark the Product Evidence Gate `FAIL` and run `strategy-red-team` only to select `Discovery`, `Experiment`, `Prototype`, or a canonical `Bet`; the work is not a proposed `Build`.
   - Choose exactly one disposition from the canonical model.
   - `Build` requires both gates to pass and every canonical `Build` condition to pass.
   - Apply the canonical `Bet` gate verbatim. A partial Bet contract is not authorization; label a complete Bet as not evidence-backed.
   - Completion criterion: exactly one disposition is justified by ledger item IDs and no failed gate is hidden inside `Build`.

6. **Generate the development handoff only when authorized**
   - For `Build` or `Bet`, assign or preserve stable `REQ-*` and `AC-*` IDs, produce acceptance criteria, workflow notes or a Mermaid flowchart, a source-to-test traceability table, the smallest releasable slice, post-release measurement and rollback, and flag whether a **UI contract** will be required (user-visible surface).
   - Choose exactly one next skill among:
     - `to-prd` — **default** when the Product Delivery Contract is not yet written (includes UI contract + delivery prototype pin when visual)
     - `test-scenarios` — when the PRD already exists; produce `SCN-*` before engineering (default next after `to-prd`)
     - `pm-prototype` — only while disposition still needs a **learning** prototype; not a Build substitute and not a delivery pin
     - `to-issues` — **optional** human planning board only; never agent execution truth
     - **engineering handoff** — only when PRD (+ UI contract if visual) and preferably `SCN-*` already exist: companion `wen-engineering` `/to-spec` → `/to-tickets` → `/implement`
   - Prefer spine: `to-prd` → `test-scenarios` → engineering. Do not skip UI contract for visual work.
   - For `Bet`, preserve the complete canonical Bet contract and link every downstream `REQ-*` and `AC-*` to its Bet `D-*` and unsupported `A-*` IDs.
   - For `Kill`, `Pause`, `Discovery`, `Experiment`, `Prototype`, `Pivot`, or `Align`, produce the named next learning or decision action and no implementation handoff.
   - If alignment failed because a **class of inquiry** was never forced by the skills (not merely one missing answer), add a secondary note to run `pm-process-retro` after the product gap is named—so the flow evolves. Do not block the product route on retro completion unless the user asked only for process work.
   - Completion criterion: every acceptance criterion traces through `EV/X -> D -> REQ -> AC -> Test` for Build, or `A + Bet D -> REQ -> AC -> Test` for Bet; coding execution is never claimed inside this skill.

## Output

```md
## Alignment Decision

- Discovery Track: existing-change | new-idea
- Product Evidence Gate: PASS | FAIL
- Alignment Gate: PASS | FAIL
- Disposition: Kill | Pause | Discovery | Experiment | Prototype | Pivot | Align | Bet | Build
- Decision Owner: ...
- Rationale: EV-... / ST-... / D-... / A-... / X-...

## Gate Matrix
| Gate | Required claim or decision | PASS / FAIL | Qualifying IDs | Owner | One next action / exit condition |
| --- | --- | --- | --- | --- | --- |

## Track-Specific Alignment Brief
...

## Evidence Ledger
...

## Terms Clarified
...

## Decision Log
...

## Confirmation Matrix
| Section | Section Type: authorizable / evidence | Correct Owner | Status | Evidence/Decision | Re-confirmed? / Next action |
| --- | --- | --- | --- | --- | --- |

## Bet Contract
Present only for Bet: unsupported A-* IDs, authorizing D-*, investment cap, expiry date, measurement plan, rollback path, and kill threshold.

## Development Handoff
Present only for Build or Bet.

### Acceptance Criteria
- AC-... — ...

### Release Slice
- Smallest releasable scope: ...
- Post-release measurement: ...
- Rollback: ...

### Flow
...

### Traceability
| Evidence / Assumption / Result | Decision | Requirement ID | Acceptance ID | Authorization | Test |
| --- | --- | --- | --- | --- | --- |

### Next Skill
to-prd (default) | test-scenarios | pm-prototype | to-issues (optional board) | engineering-handoff
### UI Contract Required
yes | no — reason
```

Include the [handoff package checklist](../../docs/boundaries.md#handoff-to-engineering-when-authorized) when next skill is engineering-handoff.

