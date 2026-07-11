# PM vs Engineering Boundaries

本仓库负责 **需求层 / 市场层 / 需求提出者真实意图** 的证据驱动 discovery。  
生产写码、工程切片与实现门禁属于 companion engineering 工作区（`wen-engineering`）。

## Ownership

| Layer | Owns | Does not own |
| --- | --- | --- |
| **PM** (this repo) | Product/market/need discovery; interviews; evidence ledger; dispositions; Build/Bet authorization; Product Delivery Contract (`to-prd`); UI contract + delivery prototype pin; `SCN` scenarios | Shipping production code; CI; implementation-frontier tickets; inventing technical migrations as product evidence |
| **Engineering** (`wen-engineering`) | Engineering specs, technical multi-session fog, implement, review, code QA, UI **fidelity** against the pin | Inventing user value, market bets, or “what they really meant” without PM discovery |

## Two kinds of fog

| Fog | Examples | Route |
| --- | --- | --- |
| **Product fog** | Worth doing? Who? What outcome? Inner need after rejection? Opportunity vs solution | `/pm-intake` and this pack |
| **Technical fog** | Migration path, invariant ownership, API contract, dual-write, test seam | Engineering lifecycle after product is settled — do **not** open a second generic “wayfinder” here that competes with `pm-intake` |

## One front door

Keep **`/pm-intake`** as the only automatic product entry. Do not add a parallel
map skill that re-plans product discovery outside the evidence model.

## Handoff to engineering (when authorized)

Emit a development handoff **only** for canonical `Build` or a complete
bounded `Bet`.

### Product Delivery Contract (minimum package)

1. Disposition: `Build` or complete `Bet` (cap, expiry, measurement, rollback, kill)
2. Problem, outcome, scope, out of scope
3. Intended behavior: stable `REQ-*` and `AC-*`
4. Traceability: evidence or Bet `A-*` + authorizing `D-*`
5. **UI when visual:** `SCR-*` / `FLD-*` / `RULE-*` / UI states + **pinned** delivery prototype version (see `to-prd` / `UI-CONTRACT.md`)
6. **`SCN-*` scenarios** via `test-scenarios` (default before agent coding)
7. Known feasibility notes already confirmed by engineering owners (if any)
8. Explicit non-goals and protected current behavior

### Default agent spine

```text
Build | complete Bet
  -> to-prd          # Product Delivery Contract (+ UI contract if visual)
  -> test-scenarios  # SCN-* (default; cover RULE-* / UI states)
  -> wen-engineering: /to-spec -> /to-tickets -> /implement
  -> eng /qa-run     # behavior + UI fidelity gates
```

### Optional only

- `to-issues` — human planning boards; **not** the agent execution source of truth
- `pm-prototype` — learning prototypes; not delivery truth unless re-exported and pinned

If product is settled but **implementation route** is still multi-session
technical fog, engineering may use its slim technical `/wayfinder`.

## Handoff back from engineering

Accept returns when:

- implementation feedback shows intended behavior was wrong or underspecified
- UI fidelity failure is a **contract** error (missing/wrong FLD/RULE/pin), not a coding miss
- “bug” is really product rework without authorized Expected
- value/usability/viability claims need new evidence

Require engineering to send: repo-backed Current, stakeholder statements as
`ST-*` only, failing AC/SCN/FLD/RULE IDs, and the open product question — then
re-enter `/pm-intake` on the `existing-change` track.

## Hard rules

- Statements and Decisions are not product evidence.
- Code proves Current and some feasibility; it does not prove correct need.
- Screenshots without FLD/RULE are not a UI contract.
- Learning prototypes are not delivery pins.
- Do not route pure coding tasks into this pack; send them to engineering.
- Do not invent a Build disposition to “unblock” coding when gates fail.

## Optional test layer

System test design and acceptance QA may live in companion **`wen-test`**
(`/to-test-plan`, `/qa-run`). Product `test-scenarios` (`SCN-*`) remain PM
artifacts; they feed test plans but are not a substitute for QA execution.
