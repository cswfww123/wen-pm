---
name: pm-grilling
description: Use when PM discovery needs Marty Cagan-style live grilling of a stakeholder, customer, or user, a follow-up interview from an intake docket, codebase-backed requirement rediscovery after rejected implementation, or one-question-at-a-time pressure before PRD.
---

# PM Grilling

Use Marty Cagan's PM judgment as the grill lens. The interview engine is inline so this skill stays self-contained.

## Steps

1. **Load Marty**
   Read `marty-cagan` before asking the first question.
   Completion criterion: you can state the evidence docket gate, the four risks, and the rule that stakeholder, customer, or user requests are not evidence.

2. **Extract current implementation first**
   If the user points to an existing repo, branch, PR, feature, screen, endpoint, or unhappy stakeholder feedback after partial implementation, inspect the current implementation before asking. Trace the relevant entrypoint, docs, tests, diff, screenshots, logs, or API behavior, then write a compact implementation docket:
   - Repo trace: use CodeGraph first when available; otherwise use local search and direct file reads
   - Implemented behavior: what the code/product currently does
   - Implied requirement: what requirement the implementation appears to assume
   - Evidence: file, test, route, UI, log, screenshot, or `missing`
   - Stakeholder mismatch: what may be wrong, unclear, or rejected
   - Question: the next PM question that code cannot answer
   Completion criterion: every question answerable from the codebase or supplied artifact is answered from evidence before the first interview question.

3. **Run the grill engine**
   Ask one question at a time. Wait for the answer before continuing. For every question, use this format:

   ```text
   Q: <one focused question>

   Recommended: <best answer from current evidence>

   Alternatives considered: <briefly, if useful>
   ```

   Completion criterion: the first question follows this format and names the evidence gap it resolves.

4. **Follow the PM ladder**
   Ask only the earliest unresolved question from this ladder:
   - User and role: who is affected, in what real situation
   - Current alternative: how they solve it today
   - Pain strength: time, money, risk, revenue, status, compliance, or frustration
   - Desired outcome: the measurable change they expect
   - Scope boundary: what is explicitly outside this request
   - Success metric: what proves the work helped
   - Value risk: why the user would choose this
   - Usability risk: where the workflow or concept may fail
   - Feasibility risk: data, integration, permission, performance, or model uncertainty
   - Viability risk: sales, ops, finance, legal, support, or business-model constraint
   - Kill criterion: what evidence would stop or reshape the idea
   Completion criterion: every answered rung is recorded as settled, contradicted, or deferred.

5. **Use evidence before questions**
   If the answer can be found in provided docs, product screenshots, metrics, tickets, code, tests, diffs, or logs, inspect that evidence before asking. If evidence and the user's answer conflict, state the contradiction and ask which direction to resolve.
   Completion criterion: no question asks for facts already available in the provided evidence.

6. **Handle artifacts during the grill**
   If the user adds a document, screenshot, chat log, SQL, metric, or existing PRD mid-session, pause the question chain and run `pm-intake` on that artifact. Then resume from the highest-risk unresolved rung.
   Completion criterion: artifact-derived claims are merged into the settled/contradicted/deferred list before the next question.

7. **Stop with a docket, not a vibe**
   End only when the user asks to stop or the docket can support alignment.
   Completion criterion: output the settled facts, contradictions, deferred questions, current implementation evidence when present, four-risk status, and exactly one next route.

## Done Output

```md
## Settled
- ...

## Contradictions
- ...

## Deferred
- ...

## Current Implementation
- ...

## Repo Evidence Checked
- ...

## Four Risks
- Value: red | yellow | green | unknown
- Usability: red | yellow | green | unknown
- Feasibility: red | yellow | green | unknown
- Viability: red | yellow | green | unknown

## Recommendation
continue grill | opportunity-solution-tree | prioritize-assumptions | brainstorm-experiments-existing | brainstorm-experiments-new | prototype | pm-alignment-to-prd
```

## Related Skills

- `pm-intake`: use when a durable artifact appears.
- `opportunity-solution-tree`: use when the problem space needs structure before solution choice.
- `prioritize-assumptions`: use when several risky assumptions compete for first test.
- `brainstorm-experiments-existing` / `brainstorm-experiments-new`: use when the next move should be validation, not PRD.
- `prototype`: use only for one named logic, state, workflow, or UI question.
- `pm-alignment-to-prd`: use when the docket is settled enough for sign-off.
