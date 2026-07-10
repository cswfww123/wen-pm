---
name: prioritize-assumptions
description: Continue a canonical A-* register by choosing the first evidence gap using impact-if-false, uncertainty, and ease of testing.
---

# Prioritize Assumptions

Prioritize learning, not features. A low-uncertainty assumption may need no immediate test, but this skill never converts it directly into permission to build.

Before acting, read all of the canonical [evidence model](../pm-intake/references/evidence-model.md). Preserve its record schema, product-evidence gate, and disposition criteria.

## Scoring

Score each dimension from 1 to 5:

- **Impact if false**: `1` is a local inconvenience; `5` kills the product thesis, invalidates the outcome, or creates unacceptable harm.
- **Uncertainty**: `1` has strong relevant product evidence with a clear result; `2` has moderate product evidence; `3` has weak or proxy evidence; `4` has only Statements or Decisions; `5` has no relevant evidence or unresolved conflicting evidence.
- **Ease of testing**: `1` is slow, costly, unsafe, or hard to interpret; `5` is fast, cheap, safe, and behaviorally decisive.

Calculate:

```text
Risk exposure = Impact if false x Uncertainty
Test priority = Risk exposure x Ease of testing
```

`Ease of testing` orders learning work; it does not reduce the underlying risk. Put any assumption with impact `5` or risk exposure `20-25` in the critical lane even when its test is difficult.

## Steps

### 1. Normalize the register

Preserve each assumption ID, evidence reference, contradiction, and load-bearing flag. Split compound claims before scoring. Derive uncertainty from evidence quality, not confidence language supplied by an advocate. Evaluate assumptions already resolved by strong contradictory evidence against the canonical `Kill` or `Pivot` criteria before ranking unresolved tests.

**Complete when:** every row is one falsifiable claim, every uncertainty score cites its evidence state, and already-resolved contradictions are separated from the unresolved test queue.

### 2. Score and challenge

Score all three dimensions and add one sentence of rationale for each score. If a score depends on missing information, use the more uncertain score and name the missing evidence.

**Complete when:** every assumption has three scores, both calculated values, and rationales that another reviewer can reproduce.

### 3. Choose the next evidence action and disposition

For each assumption, name one next evidence action: inspect an existing source, run an experiment, test a disposable prototype, obtain an authorized decision, wait for a named blocker, revisit on a trigger, or remove the premise from the bet.

Then choose exactly one overall canonical disposition. Use `Discovery`, `Experiment`, `Prototype`, `Align`, or `Pause` according to the canonical criteria. Use `Kill` or `Pivot` only when their evidence thresholds are already met. Route any proposed `Bet` or `Build` authorization back through product alignment after evidence work; prioritization itself does not grant either disposition.

For `Experiment`, name the smallest behaviorally decisive test and route to the matching experiment skill. A result updates the canonical ledger and uncertainty before the next decision.

**Complete when:** every assumption has one owned next evidence action, every deferred item has a review trigger, one canonical disposition is named with its supporting IDs, and the output contains no direct Bet or Build authorization.

## Output

```md
# Assumption Priority Register

| Lane | Rank | A ID | Assumption | Load-bearing? | Linked evidence IDs | Contradictions | Impact | Uncertainty | Risk exposure | Ease | Test priority | Evidence rationale | Next evidence action | Owner / trigger |
|---|---:|---|---|---|---|---|---:|---:|---:|---:|---:|---|---|---|

## First Learning Move
- Assumption ID:
- Why first:
- Existing evidence to inspect:
- Experiment skill: `brainstorm-experiments-existing` or `brainstorm-experiments-new`

## Recommended Disposition
- Disposition: Discovery | Experiment | Prototype | Align | Pause | Kill | Pivot
- Supporting IDs:
- Exit condition:

## Deferred And Removed Bets
- ...
```
