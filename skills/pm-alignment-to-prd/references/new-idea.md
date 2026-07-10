# New Idea Alignment

Use this branch when the team does not yet operate the proposed product or capability and must decide whether the idea deserves investment.

## Investment Alignment Brief

Include:

1. **Idea thesis** — the proposed solution, labeled as an Assumption until evidence supports it.
2. **Target segment and situation** — the precise people, role, trigger, and context.
3. **Problem evidence** — observed past behavior, frequency, pain cost, and consequences.
4. **Current alternative** — what people use now and why they tolerate it.
5. **Switching or commitment evidence** — search, workaround, migration, payment, pre-order, time, reputation, or another skin-in-the-game signal.
6. **Desired product and business outcome**.
7. **Alternatives considered** — multiple solution shapes, including doing nothing.
8. **Load-bearing assumptions** — value, usability, feasibility, viability, ethics, go-to-market, strategy, and team when relevant.
9. **Experiment record** — when an experiment ran or `X-*` is used, include hypothesis, method, sample, result, caveats, success threshold, kill threshold, and inconclusive rule. Otherwise record `Not run — EV-* basis`.
10. **Four Risks board**, scope, out of scope, constraints, and decision owner.

## Readiness

This branch is ready for `Build` only when:

- the target segment and current alternative are evidenced;
- at least one meaningful past behavior or skin-in-the-game signal supports the problem and value claim;
- every load-bearing assumption required by the canonical `Build` gate has qualifying product evidence within the claim scope it supports;
- when an experiment supplied `X-*`, its success, kill, and inconclusive thresholds were declared before interpreting results;
- every canonical Value, Usability, Feasibility, and Viability condition for `Build` passes without a material contradiction;
- the Product Evidence Gate and Alignment Gate both pass.

The authorized handoff also preserves stable `REQ-*` and `AC-*` IDs, the smallest releasable slice, post-release measurement, and rollback.

If those conditions fail, choose `Kill`, `Pause`, `Discovery`, `Experiment`, `Prototype`, or `Pivot`. `Bet` is allowed only when every field in the canonical Bet gate is present; it remains visibly non-evidence-backed.
