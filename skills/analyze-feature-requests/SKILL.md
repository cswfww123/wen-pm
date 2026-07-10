---
name: analyze-feature-requests
description: Continue a pm-intake batch-request route by converting requests into evidence-backed opportunity themes and one next discovery action.
---

# Analyze Feature Requests

Treat requests as solution statements. Find the repeated problem and evidence underneath them before ranking work.

## Steps

1. **Load the evidence model**
   - Read `../pm-intake/references/evidence-model.md`.
   - Record the product outcome that prioritization is meant to improve.
   - Completion criterion: the outcome is measurable, or the only next action is to clarify it.

2. **Normalize every request**
   - Record source, affected role or segment, requested solution, stated reason, current alternative, observed past behavior, frequency or reach, and outcome.
   - Classify the request itself as a Stakeholder Statement. Create separate Observed Fact or Experiment Result items only when the source supports them.
   - Completion criterion: every input request has one source ID and no requested feature is mislabeled as user-value evidence.

3. **Cluster opportunities, not features**
   - Group requests by the underlying user problem or desired outcome.
   - Preserve contradictory requests and segment differences instead of averaging them away.
   - Completion criterion: every request maps to one opportunity or an explicit `unclassified` bucket.

4. **Assess evidence and risk**
   - For each opportunity, show reach, evidence strength and scope, current alternative, value signal, strategic fit, four-risk unknowns, and estimated delivery cost.
   - Rank evidence-backed opportunities. Rank weakly evidenced themes as research priorities, not build priorities.
   - Completion criterion: every ranked opportunity cites evidence IDs and names its most load-bearing unknown.

5. **Choose one next action**
   - Use `opportunity-solution-tree` for a broad, evidenced opportunity space.
   - Use `identify-assumptions-existing` or `identify-assumptions-new` for a proposed solution.
   - Apply the canonical disposition gates verbatim: missing product evidence normally means `Discovery`; use `Experiment` only with a cited `A-*` and complete protocol, `Pause` only with a named blocker, and `Kill` or `Pivot` only with their qualifying evidence.
   - Completion criterion: the output names exactly one canonical disposition and next action with supporting IDs, and never routes directly to implementation.

## Output

```md
## Outcome
...

## Evidence Ledger
| ID | Type | Claim | Source | Scope | Support | Strength | Implication |
| --- | --- | --- | --- | --- | --- | --- | --- |

## Normalized Requests
| ST ID | Source locator | Segment / role | Requested solution | Stated reason | Current alternative | Reported past behavior ST IDs | Frequency / reach | Desired outcome |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |

## Opportunity Themes
| Opportunity | ST IDs | Segment | Qualifying evidence IDs | Evidence Strength | Current Alternative | Risk | Priority |
| --- | --- | --- | --- | --- | --- | --- | --- |

## Contradictions And Gaps
...

## Disposition
Kill | Pause | Discovery | Experiment | Prototype | Pivot | Align

## Next Action
...
```
