# PM vs Engineering Boundaries

本仓库负责 **需求层 / 市场层 / 需求提出者真实意图** 的证据驱动 discovery。  
生产写码、工程切片与实现门禁属于 companion engineering 工作区（`wen-engineering`）。

## Ownership

| Layer | Owns | Does not own |
| --- | --- | --- |
| **PM** (this repo) | Product/market/need discovery; interviews; evidence ledger; dispositions; Build/Bet authorization; PRD-level product decisions | Shipping production code; CI; implementation-frontier tickets; inventing technical migrations as product evidence |
| **Engineering** (`wen-engineering`) | Engineering specs, technical multi-session fog, implement, review, code QA | Inventing user value, market bets, or “what they really meant” without PM discovery |

## Two kinds of fog

| Fog | Examples | Route |
| --- | --- | --- |
| **Product fog** | Worth doing? Who? What outcome? Inner need after rejection? Opportunity vs solution | `/pm-intake` and this pack |
| **Technical fog** | Migration path, invariant ownership, API contract, dual-write, test seam | Engineering lifecycle after product is settled — do **not** open a second generic “wayfinder” here that competes with `pm-intake` |

## One front door

Keep **`/pm-intake`** as the only automatic product entry. Do not add a parallel
map skill that re-plans product discovery outside the evidence model.

Multi-session product work already lives in:

- Evidence Docket + Ledger
- dispositions (`Discovery` / `Experiment` / `Prototype` / `Align` / `Bet` / `Build` / …)
- track-specific grilling and alignment skills

## Handoff to engineering (when authorized)

Emit a development handoff **only** for canonical `Build` or a complete
bounded `Bet` (see `pm-alignment-to-prd` / `to-prd`).

Minimum package for engineering:

1. Disposition: `Build` or complete `Bet` (cap, expiry, measurement, rollback, kill)
2. Problem, outcome, scope, out of scope
3. Intended behavior and acceptance examples (`REQ-*` / `AC-*`)
4. Traceability: evidence or Bet `A-*` + authorizing `D-*`
5. Known feasibility notes already confirmed by technical owners (if any)
6. Explicit non-goals and protected current behavior

Recommended engineering next steps (outside this repo’s ownership of code):

```text
PM handoff
  -> engineering /to-spec   (or /implement if one-context)
  -> /to-tickets when multi-slice
  -> /implement per frontier ticket
```

If product is settled but **implementation route** is still multi-session
technical fog, engineering may use its slim technical `/wayfinder`. That is not
a PM skill and must not re-open product discovery.

Local PM delivery helpers:

- `to-prd` — durable product PRD with IDs
- `to-issues` — optional local vertical-slice issue package for planning boards
- `test-scenarios` — behavior/regression scenarios for handoff quality

These do **not** replace engineering `/to-spec` / `/to-tickets` / `/implement`
in a real production coding agent workflow.

## Handoff back from engineering

Accept returns when:

- implementation feedback shows intended behavior was wrong or underspecified
- “bug” is really product rework without authorized Expected
- value/usability/viability claims need new evidence

Require engineering to send: repo-backed Current, stakeholder statements as
`ST-*` only, and the open product question — then re-enter `/pm-intake` on the
`existing-change` track.

## Hard rules

- Statements and Decisions are not product evidence.
- Code proves Current and some feasibility; it does not prove correct need.
- Do not route pure coding tasks into this pack; send them to engineering.
- Do not invent a Build disposition to “unblock” coding when gates fail.
