---
name: opportunity-solution-tree
description: Continue an evidenced pm-intake docket by mapping one outcome to opportunities, alternative solutions, and falsifiable experiments.
---

# Opportunity Solution Tree

Map one outcome to evidenced opportunities, multiple solutions, and tests. A tree organizes discovery; it does not turn weak evidence into permission to build.

## Steps

1. **Load the evidence model**
   - Read `../pm-intake/references/evidence-model.md` and the current Evidence Ledger.
   - Completion criterion: evidence type, strength, and supported claim scope are known for every input used below.

2. **Set one desired outcome**
   - Use one measurable product or business result, baseline, target, and time horizon.
   - Completion criterion: exactly one outcome anchors the tree; competing outcomes are deferred explicitly.

3. **Map evidenced opportunities**
   - Derive 3-7 needs, pains, or desired outcomes from research and observed behavior, not requested features.
   - Attach evidence IDs, segment, current alternative, frequency, pain strength, and contradictions.
   - Completion criterion: every opportunity cites in-scope evidence; unsupported opportunities are labeled Assumptions.

4. **Prioritize opportunities**
   - Compare user impact, business impact, reach, evidence strength, and satisfaction with the current alternative.
   - Select at most three opportunities for solution exploration.
   - Completion criterion: priority reflects both opportunity size and evidence quality.

5. **Generate alternatives and assumptions**
   - Generate at least three materially different solutions per selected opportunity, including doing nothing or changing the process.
   - Identify each solution's load-bearing value, usability, feasibility, and viability assumptions.
   - Completion criterion: no opportunity advances with only the first proposed solution.

6. **Design falsifiable experiments**
   - For the riskiest assumption, invoke `brainstorm-experiments-existing` or `brainstorm-experiments-new` for the current Discovery Track. Preserve the returned complete `EXP-*` protocol; the tree itself only links the `A-*` branch to that protocol.
   - Apply the canonical disposition gates: use `Discovery` when evidence is not yet test-ready, `Prototype` for a disposable usability/feasibility question, `Pause` only for a named blocker, and `Kill` or `Pivot` only when their evidence gate already passes.
   - Completion criterion: every selected branch ends in exactly one gated `Discovery`, `Experiment`, `Prototype`, `Pause`, `Kill`, or `Pivot` action, never direct implementation.

## Output

```md
## Desired Outcome
...

## Opportunity Register
| Opportunity | Segment | Current alternative | Frequency / reach | Pain strength | Evidence IDs / strength | Contradictions | Priority |
| --- | --- | --- | --- | --- | --- | --- | --- |

## Opportunity Solution Tree
Outcome
└── Opportunity [Evidence IDs]
    ├── Solution A [Assumption IDs]
    │   └── EXP-* [A-*; success / kill / inconclusive]
    ├── Solution B
    └── Do nothing / process alternative

## Experiment Protocol
For an `Experiment` disposition, embed the complete output of the matching brainstorm-experiments skill, including hypothesis, method, metric, sample, all three thresholds, all three next dispositions, guardrails, owner, and EXP/A linkage.

## Evidence Gaps And Contradictions
...

## Disposition
Discovery | Experiment | Prototype | Pause | Kill | Pivot

## One Next Action
- Supporting IDs:
- Owner:
- Completion signal:
```
