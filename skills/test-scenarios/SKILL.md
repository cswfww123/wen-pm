---
name: test-scenarios
description: Turn a canonical Build or complete bounded Bet handoff into local traceable behavior and regression scenarios.
---

# Test Scenarios

Create observable scenarios that preserve the approved product decision. Tests prove implementation matches the contract; they do not validate user value by themselves.

Before acting, read the canonical [evidence model](../pm-intake/references/evidence-model.md).

## Readiness

Require:

- a source PRD or alignment artifact with version and `Discovery Track`;
- canonical disposition `Build` with every Build condition satisfied, or `Bet` with the complete canonical Bet contract;
- stable `D-*`, `REQ-*`, and `AC-*` IDs;
- for Build, qualifying `EV-*` / `X-*`; for Bet, unsupported `A-*` plus the authorizing Bet `D-*`;
- stable protected-behavior and regression locators—such as `REQ-*`, `AC-*`, or source-artifact section anchors—when the track is `existing-change`.

If readiness fails, route to `pm-alignment-to-prd` and create no scenarios.

## Steps

1. **Build the trace map**
   - For Build, map `EV/X -> D -> REQ -> AC`.
   - For Bet, map `A + Bet D -> REQ -> AC` and preserve the cap, expiry, measurement, rollback, and kill threshold.
   - Completion criterion: every acceptance criterion has one complete authorization-specific source chain and no Bet assumption appears as validated evidence.

2. **Create behavior scenarios**
   - Assign stable IDs (`SCN-001`, ...).
   - For each acceptance criterion, specify objective, actor, starting state, trigger, actions, and observable outcomes.
   - Cover main, exception, error, permission, boundary, empty, and recovery states when relevant.
   - Completion criterion: every `AC-*` is exercised by at least one `SCN-*`, and every scenario cites its source artifact/version and authorization.

3. **Protect existing behavior**
   - For `existing-change`, add regression scenarios for every Keep item and affected integration, migration, or compatibility boundary.
   - Completion criterion: every protected-behavior and regression locator maps to a scenario or an explicit test deferral with owner and review point.

4. **Choose the test seam**
   - Prefer the highest stable seam that observes the agreed behavior; use lower-level tests only for logic that cannot be verified there.
   - Completion criterion: every scenario names an observable seam and expected result without inventing implementation details.

5. **Save locally**
   - Follow the repository's test-plan convention; otherwise save `docs/test-plans/<source-slug>.md`.
   - Completion criterion: the local file exists, all `SCN-*` and source links resolve, and the trace map has no orphan `REQ-*`, `AC-*`, protected behavior, or scenario.

## Output

```md
## Metadata
- Source artifact / version:
- Discovery Track:
- Authorization: Build | Bet
- Bet Contract: None | D-... / A-... / cap / expiry / measurement / rollback / kill

## Traceability
| Evidence or Bet Assumption | Authorization Decision | Requirement | Acceptance Criterion | Protected / Regression Locator | Scenario |
| --- | --- | --- | --- | --- | --- |

## SCN-001 — <name>
- Source artifact / version:
- Authorization: Build | Bet
- Objective:
- Actor:
- Starting State:
- Trigger:
- Steps And Observable Outcomes:
  1. ...
- Edge / Error / Recovery Coverage:
- Test Seam:
- Source IDs: EV/X or A + Bet D; REQ; AC

## Deferred Coverage
| Risk | Reason | Owner | Review Point |
| --- | --- | --- | --- |
```
