---
name: identify-assumptions-new
description: Continue a classified new-idea docket by extracting its load-bearing assumptions before experiments or planning.
---

# Identify Assumptions: New Product

Turn a product idea into claims that can die. Market reports, stakeholder enthusiasm, and feature detail are inputs, not proof.

Before acting, read all of the canonical [evidence model](../pm-intake/references/evidence-model.md). Preserve its record schema, product-evidence gate, and dispositions.

## Steps

### 1. Separate facts from the pitch

Read the supplied idea, interviews, research, experiments, and constraints. Establish:

- a specific target actor and triggering situation
- the outcome they seek and how they handle it today
- the proposed behavior change or commitment
- who benefits, who pays, and who must adopt or support it
- observed constraints and the evidence already available

Preserve the canonical evidence ledger and classify every source through that model. Keep unsupported claims as assumptions.

**Complete when:** each factual claim has a source, the current alternative is named, and the remaining pitch claims are visibly labeled assumptions.

### 2. Build the assumption register

Examine eight risk areas:

- **Value**: the problem and outcome matter enough to change behavior.
- **Usability**: the target actor can understand, trust, and use the product in context.
- **Viability**: pricing, economics, support, operations, legal, and compliance can work.
- **Feasibility**: technology, data, integrations, reliability, and team capability can work.
- **Ethics**: the product avoids unacceptable harm, manipulation, exclusion, or misuse.
- **Go-to-Market**: the team can reach, persuade, onboard, and retain the target segment.
- **Strategy**: the opportunity advances the intended outcome and has a defensible reason to exist now.
- **Team**: the team has or can obtain the skills, ownership, and operating capacity required.

Use stable IDs (`A-001`, `A-002`, ...). Add each assumption to the canonical ledger, then record its risk details:

| Field | Required content |
|---|---|
| Risk area | One of the eight areas above |
| Impact if false | Concrete consequence to the product bet |
| Linked evidence | IDs that support, contradict, or leave the claim inconclusive |
| Uncertainty | High / Medium / Low, justified by evidence quality |
| Fastest disconfirming signal | Behavior, commitment, data, or technical result that would refute it |

Split compound assumptions until each row can fail independently.

**Complete when:** all eight areas were examined, every product-bet claim maps to an assumption, and every assumption has an impact, evidence state, uncertainty rationale, and disconfirming signal.

### 3. Expose the product thesis

Mark an assumption `load-bearing` when its failure would kill the idea, force a different target segment, invalidate the business model, or require a materially different solution. State the product thesis as the smallest set of load-bearing assumptions.

Return the register and route it to `prioritize-assumptions`. This step identifies risk; it does not produce a roadmap or authorize implementation.

**Complete when:** the thesis contains only load-bearing assumptions, contradictions remain visible, and the next action is evidence gathering or prioritization rather than solution expansion.

## Output

```md
# New Product Assumption Register

## Product Thesis
- A-...

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
