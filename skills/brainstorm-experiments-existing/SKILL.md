---
name: brainstorm-experiments-existing
description: Continue an existing-change Experiment disposition by pre-registering the smallest decisive test for one A-* assumption.
---

# Design Experiments: Existing Product

Design the smallest safe test that changes the evidence state of a prioritized assumption.

Before acting, read all of the canonical [evidence model](../pm-intake/references/evidence-model.md). Apply its `Experiment` contract and result-record schema.

## Steps

### 1. Anchor the experiment in current behavior

Read the prioritized assumption register and the available product, codebase, analytics, support, and research evidence. Preserve assumption IDs. Establish the relevant segment, current behavior, baseline metric, and `Current -> Expected -> Delta`.

If existing evidence can answer the assumption, gather it before proposing a new experiment.

**Complete when:** each experiment candidate maps to one assumption ID, its current-state claim has a source, and a usable baseline exists or its absence is explicit.

### 2. Choose the smallest decisive method

Match the method to the risk:

- value or adoption: fake door, concierge flow, reversible feature stub, behavior replay
- usability: task-based prototype or first-click test
- feasibility: technical spike, data replay, integration probe, load or failure test
- viability: operational simulation, policy review, pricing or support-cost test
- comparative behavior: guarded A/B test when traffic and instrumentation support it

Interviews can discover past behavior and refine an assumption; opinions alone do not validate it. Production experiments require exposure limits, guardrails, monitoring, rollback, and an owner.

**Complete when:** the chosen method can disconfirm the assumption with less cost or risk than full implementation and its instrumentation can produce the required metric.

### 3. Pre-register all outcomes

Create a stable protocol ID (`EXP-001`, `EXP-002`, ...). Reserve `X-*` for the observed Experiment Result after the protocol runs. For each experiment specify:

| Field | Required content |
|---|---|
| Assumption | ID and exact claim |
| Segment and context | Who, when, and eligibility rules |
| Baseline | Current value and source, or explicit missing-baseline action |
| Procedure | Exact exposure, task, or probe |
| Metric and instrumentation | What records the behavior and where |
| Sample and timebox | Minimum interpretable sample and stop date |
| Success threshold | Result that materially reduces uncertainty |
| Failure / kill threshold | Result that refutes the assumption or stops the proposed bet |
| Inconclusive threshold | The numeric band or validity condition that triggers more evidence |
| Guardrails | Harm, quality, operational, privacy, and rollback limits |
| Owner | Person accountable for running and reading the result |

Make success, failure, and inconclusive conditions mutually exclusive and collectively exhaustive. Define the next decision for each:

- **Success** -> record an `X-* Experiment Result`, lower uncertainty only within its Scope, then choose the next canonical disposition from the remaining risks.
- **Failure** -> apply `Kill` only when the predeclared kill threshold and canonical criteria are met; use `Pivot` only when product evidence still supports an adjacent opportunity; otherwise return to `Discovery`.
- **Inconclusive** -> use `Discovery` to repair power, instrumentation, segment, or hypothesis quality; use `Pause` only for a named external blocker.

**Complete when:** every experiment has all three thresholds, all three next decisions, a safe stopping rule, and no outcome defaults directly to Build.

### 4. Return an executable experiment plan

Rank experiments by the priority register. Include the one experiment to run first and explain what decision it unlocks. Mark load-bearing assumptions without a valid experiment and state what evidence or safeguard is missing.

**Complete when:** every load-bearing assumption is covered by an experiment or an explicit blocker, and the first experiment can be run without inventing metrics, thresholds, instrumentation, or ownership.

## Output

```md
# Existing Product Experiment Plan

## First Experiment
- Disposition: Experiment | Prototype | Discovery | Pause
- Protocol ID:
- Assumption ID:
- Decision unlocked:

## Experiments
### EXP-001 — <name>
- Assumption ID:
- Hypothesis:
- Segment / baseline:
- Procedure:
- Metric / instrumentation:
- Sample / timebox:
- Success threshold:
- Success disposition:
- Failure / kill threshold:
- Failure disposition:
- Inconclusive rule:
- Inconclusive disposition:
- Guardrails / rollback:
- Owner:

## Result Record After Execution
- Protocol ID: EXP-...
- Assumption ID: A-...

| ID | Type | Claim | Source | Scope | Support | Strength | Implication |
|---|---|---|---|---|---|---|---|

## Blocked Assumptions
- ...
```
