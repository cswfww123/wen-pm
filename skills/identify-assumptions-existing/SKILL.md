---
name: identify-assumptions-existing
description: Continue a classified existing-change docket by extracting its load-bearing assumptions before prioritization.
---

# Identify Assumptions: Existing Product

Turn the proposed change into falsifiable assumptions. Current behavior is evidence of what exists, not proof that the behavior is valuable or intended.

Before acting, read all of the canonical [evidence model](../pm-intake/references/evidence-model.md). Preserve its record schema, product-evidence gate, and dispositions.

## Steps

### 1. Establish the current-state evidence

Read the supplied docket, research, product artifacts, and codebase evidence. When code is in scope, trace the relevant entrypoint, tests, state transitions, and constraints before asking questions the repository can answer.

Record:

- current behavior and its source
- proposed behavior and its source
- the explicit `Current -> Expected -> Delta`
- target actor, triggering situation, present workaround, and desired outcome
- known constraints, metrics, complaints, and prior attempts

Preserve the canonical evidence ledger and classify every source through that model. A request or decision can define intent; it does not prove value.

**Complete when:** every current-state claim has a source, the delta is explicit, and unknowns are labeled rather than inferred.

### 2. Extract load-bearing assumptions

Write assumptions as claims that can be proven wrong. Cover all four risks:

- **Value**: the target actor has the problem, the outcome matters, and the change beats the current workaround.
- **Usability**: the actor can discover, understand, and complete the changed flow in context.
- **Viability**: the change works for the business, operations, legal, support, policy, and commercial constraints.
- **Feasibility**: the team can deliver the behavior with acceptable reliability, performance, data, integration, and migration risk.

Use stable IDs (`A-001`, `A-002`, ...). Add each assumption to the canonical ledger, then record its risk details:

| Field | Required content |
|---|---|
| Risk area | Value / Usability / Viability / Feasibility |
| Impact if false | Concrete user, business, or delivery consequence |
| Linked evidence | IDs that support, contradict, or leave the claim inconclusive |
| Uncertainty | High / Medium / Low, justified by evidence quality |
| Fastest disconfirming signal | Behavior, artifact, data, or technical result that would refute the claim |

Split compound assumptions until each row can fail independently.

**Complete when:** every proposed behavior depends on at least one assumption, all four risks were examined, and every assumption has an impact, evidence state, uncertainty rationale, and disconfirming signal.

### 3. Mark the testing candidates

Mark an assumption `load-bearing` when its failure would invalidate the change, materially alter the solution, or make the current plan unsafe. Preserve unresolved contradictions beside the affected assumptions.

Return the assumption register and route it to `prioritize-assumptions`. This step identifies risk; it does not authorize implementation.

**Complete when:** each load-bearing assumption is visible, every contradiction is attached to an assumption, and no unsupported claim is presented as a product decision.

## Output

```md
# Existing Product Assumption Register

## Current -> Expected -> Delta
...

## Evidence Ledger
| ID | Type | Claim | Source | Scope | Support | Strength | Implication |
|---|---|---|---|---|---|---|---|

## Assumption Risk Details
| Assumption ID | Risk | Impact if false | Linked evidence IDs | Uncertainty | Disconfirming signal | Load-bearing? |
|---|---|---|---|---|---|---|

## Contradictions And Unknowns
- ...

## Next
`prioritize-assumptions`
```
