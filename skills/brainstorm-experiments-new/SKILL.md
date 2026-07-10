---
name: brainstorm-experiments-new
description: Continue a new-idea Experiment disposition by pre-registering behavioral or commitment evidence for one A-* assumption.
---

# Design Experiments: New Product

Collect your own behavioral data before expanding the idea. Interest is a weak signal; time, money, reputation, switching, and repeated use are stronger commitments.

Before acting, read all of the canonical [evidence model](../pm-intake/references/evidence-model.md). Apply its `Experiment` contract and result-record schema.

## Steps

### 1. Select one load-bearing assumption

Read the prioritized assumption register and preserve its IDs, evidence, and contradictions. Choose the highest-priority assumption that can be tested safely. State what decision becomes possible if uncertainty changes.

Use an XYZ hypothesis when it fits:

```text
At least X% of a specific Y segment will do observable Z under stated conditions by a stated date.
```

For feasibility, ethics, or viability assumptions, use a falsifiable technical, harm, cost, policy, or operational claim instead of forcing a conversion hypothesis.

**Complete when:** the test targets one assumption, names a specific segment and behavior or result, and cannot pass through an opinion-only response.

### 2. Choose the cheapest credible commitment

Select a method that produces evidence proportional to the risk:

- fake door or landing page with a consequential follow-through action
- targeted outreach with a real booking, deposit, data import, or workflow commitment
- pre-order, paid pilot, letter of intent with concrete obligations, or cancellation test
- concierge or Wizard-of-Oz delivery that observes repeated use and outcome
- prototype task test for comprehension and usability
- technical spike, cost simulation, policy review, or misuse test

Prefer your own data from the intended segment. Market reports and analogies can shape the hypothesis; they cannot pass the experiment.

**Complete when:** the method can refute the assumption before full product construction and the measured action has a real cost or consequence for the participant when value risk is being tested.

### 3. Pre-register all outcomes

Create a stable protocol ID (`EXP-001`, `EXP-002`, ...). Reserve `X-*` for the observed Experiment Result after the protocol runs. Specify:

| Field | Required content |
|---|---|
| Assumption | ID and exact claim |
| Segment and recruitment | Who qualifies and how they are reached |
| Procedure | Exact promise, exposure, task, or delivery |
| Metric and instrumentation | Observable behavior and capture method |
| Sample and timebox | Minimum interpretable sample and stop date |
| Success threshold | Result that materially reduces uncertainty |
| Failure / kill threshold | Result that refutes the assumption or stops the bet |
| Inconclusive threshold | Numeric band or validity condition requiring more evidence |
| Guardrails | Consent, truthfulness, privacy, refund, brand, harm, and cost limits |
| Owner | Person accountable for running and reading the result |

Make success, failure, and inconclusive conditions mutually exclusive and collectively exhaustive. Define the next decision for each:

- **Success** -> record an `X-* Experiment Result`, lower uncertainty only within its Scope, then choose the next canonical disposition from the remaining risks.
- **Failure** -> apply `Kill` only when the predeclared kill threshold and canonical criteria are met; use `Pivot` only when product evidence still supports an adjacent opportunity; otherwise return to `Discovery`.
- **Inconclusive** -> use `Discovery` to repair sample, recruitment, instrumentation, or hypothesis quality; use `Pause` only for a named external blocker.

**Complete when:** every experiment has all three thresholds, all three next decisions, a safe stopping rule, and no outcome defaults directly to Build.

### 4. Return the learning sequence

Recommend the first experiment and show which later experiments are conditional on its result. Avoid a generic menu of landing pages, surveys, and videos that do not attack the selected risk.

**Complete when:** every load-bearing assumption is covered by a conditional experiment or explicit blocker, and the first experiment can run without inventing metrics, thresholds, participants, safeguards, or ownership.

## Output

```md
# New Product Experiment Plan

## First Experiment
- Disposition: Experiment | Prototype | Discovery | Pause
- Protocol ID:
- Assumption ID:
- Hypothesis:
- Decision unlocked:

## EXP-001 — <name>
- Assumption ID:
- Hypothesis:
- Segment / recruitment:
- Procedure:
- Metric / instrumentation:
- Sample / timebox:
- Success threshold:
- Success disposition:
- Failure / kill threshold:
- Failure disposition:
- Inconclusive rule:
- Inconclusive disposition:
- Guardrails:
- Owner:

## Result Record After Execution
- Protocol ID: EXP-...
- Assumption ID: A-...

| ID | Type | Claim | Source | Scope | Support | Strength | Implication |
|---|---|---|---|---|---|---|---|

## Conditional Learning Sequence
- If ... then EXP-002 ...

## Blocked Assumptions
- ...
```
