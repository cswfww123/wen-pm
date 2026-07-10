# Existing Change Alignment

Use this branch when a product, workflow, or codebase already exists and the team is extending it, correcting it, or recovering from rejected implementation.

## Change Alignment Brief

Include:

1. **Outcome and actors** — the user or business result and every affected role.
2. **Current behavior** — observable behavior with repo, runtime, data, or screenshot evidence. Code-derived intent remains an Assumption.
3. **Rejected scenario** — the concrete trigger, actions, observed result, expected result, and sourced feedback.
4. **Expected behavior** — an approved Decision with its owner and date.
5. **Delta matrix**:

   | Scenario | Gap Type | Current | Expected | Keep / Change / Remove | Evidence / Decision | REQ ID | AC ID / Acceptance Example |
   | --- | --- | --- | --- | --- | --- | --- | --- |

6. **Protected behavior** — what must remain unchanged.
7. **Affected surface** — UI, API, data, roles, permissions, integrations, reporting, and operational process.
8. **Workflow and rules** — trigger, main flow, exception and error flows, boundaries, business rules, and domain terms.
9. **Constraints and dependencies** — technical, organizational, legal, commercial, and sequencing constraints.
10. **Compatibility and regression** — migration, backward compatibility, existing-data handling, and protected tests or metrics.
11. **Scope, out of scope, success metric, and kill criteria**.

## Readiness

This branch is ready for `Build` only when:

- every Current statement is backed by current-behavior evidence;
- every Expected statement is an approved Decision rather than an inferred requirement;
- each rejected scenario preserves exactly one gap type from the grilling branch: `defect`, `misunderstood-intent`, `changed-requirement`, `usability-failure`, `value-failure`, `viability-constraint`, `feasibility-constraint`, or `evidence-gap`;
- Keep, Change, and Remove boundaries are exhaustive for affected behavior;
- every change has stable `REQ-*` and `AC-*` IDs, at least one concrete acceptance example, and relevant regression protection;
- migration and compatibility are resolved or explicitly out of scope with an owner;
- the Product Evidence Gate and Alignment Gate both pass, and every remaining canonical `Build` condition—including the smallest releasable slice, post-release measurement, and rollback—also passes.

## Handoff Trace

Trace each delivery item as:

`Current evidence -> approved delta decision -> REQ-* -> AC-* -> automated or manual test`
