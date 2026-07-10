# Existing Change Branch

Use this branch when a current product or implementation must be extended, corrected, or rediscovered after rejection. Codebase evidence establishes `Current`; it never establishes user value or intended behavior by itself.

## Evidence Sweep

When `.codegraph/` exists, start with `codegraph explore` for the behavior or symbols in question, then use `codegraph node` for exact symbols or files. Otherwise use local search and direct reads. Follow the behavior across UI/API entrypoints, domain rules, persistence, integrations, jobs, permissions, flags, configuration, tests, and observability. Compare the active branch or PR with its base when a partial implementation is in scope.

Then inspect product evidence: the original request, PRD, tickets, designs, decision records, screenshots, recordings, metrics, support reports, and the exact rejection feedback. Prefer runtime behavior and tests over names or comments when sources conflict.

## Dossier Fields

Populate every field with canonical record IDs or `Unresolved`:

1. **Rejection scenario**: respondent, exact moment or workflow, observed behavior, objection in their words, expected consequence, and impact. A rejection statement proves dissatisfaction, not user value.
2. **Current**: observable behavior today, including actor, trigger, preconditions, states, outputs, side effects, and source locators.
3. **Expected**: desired observable behavior and outcome, with the authority or evidence behind it. Label preference and intent as statements or decisions, not facts.
4. **Delta**: the smallest behavior, state, rule, and outcome differences between Current and Expected.
5. **Gap type**: choose one primary type: `defect`, `misunderstood-intent`, `changed-requirement`, `usability-failure`, `value-failure`, `viability-constraint`, `feasibility-constraint`, or `evidence-gap`.
6. **Keep / Change / Remove**: place every in-scope behavior and rule in exactly one bucket; identify untouched dependencies explicitly.
7. **Constraints**: technical, data, permission, legal, commercial, operational, time, rollout, and compatibility limits.
8. **Business rules**: actor, condition, rule, result, precedence, exception, and owner. Clarify overloaded terms.
9. **Main, edge, and error flows**: happy path plus empty, invalid, unauthorized, duplicate, concurrent, partial-failure, retry, cancellation, and recovery states that are material to this change.
10. **Dependencies**: upstream/downstream systems, consumers, contracts, data, flags, jobs, teams, and decisions.
11. **Migration and regression**: existing records/users, backfill, compatibility, rollout/rollback, monitoring, known behavior to preserve, and regression surface.
12. **Acceptance examples**: business-readable `Given / When / Then` examples covering the main flow and each material edge, error, permission, migration, and regression risk.

Every requirement inferred from source code, tests, route names, schema, or current UI is always an `Assumption`. Its corresponding Current behavior may be an observed fact; the reason it should remain is not.

Give each intended downstream requirement a stable `REQ-*` ID and each scenario-level acceptance example an `AC-*` ID. Link both to the supporting `EV-*` / `X-*`, authorizing `D-*`, and any unresolved `A-*`; requirement and acceptance IDs are not evidence records.

## Question Priority

Ask in this order unless a higher four-risk item can kill the change sooner:

1. The exact rejection scenario and impact.
2. Current / Expected / Delta.
3. Primary gap type and Keep / Change / Remove.
4. Business rules, constraints, and clarified terms.
5. Main, edge, and error flows.
6. Dependencies, migration, rollout, and regression.
7. Acceptance examples and success/kill measures.

In decision-alignment, show sourced Current behavior and a provisional Delta when that helps the decision owner correct the interpretation. In customer-discovery, ask about the last real encounter with the current behavior: what happened, what they did next, the consequence, and any workaround. Keep proposed fixes and Expected behavior out of the question.

## Branch Gate

The branch is ready to stop grilling only when:

- Current and Expected are separately stated and every Delta is traceable to both.
- Every in-scope behavior is in exactly one Keep / Change / Remove bucket.
- The primary gap type is explicit.
- Business rules have owners and precedence; material edge/error flows are accounted for.
- Dependencies and migration/regression risks have an owner or bounded follow-up.
- Acceptance examples cover the main path and every material risk; `Build` requires them to be accepted by traceable `D-*` records, otherwise use `Align`.
- Value and viability are supported independently of implementation and stakeholder preference, or their gaps meet the canonical `Bet` gate.

If any item fails and the respondent can answer it, continue grilling. If the respondent cannot, route the highest-risk gap to exactly one experiment, prototype, evidence retrieval, or decision owner.
