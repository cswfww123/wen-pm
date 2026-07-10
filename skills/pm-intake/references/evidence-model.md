# Canonical Evidence Model

This file is the single source of truth for evidence and disposition vocabulary across WEN PM skills. Link here instead of redefining these terms elsewhere.

## Evidence records

Every record uses exactly these fields:

| Field | Meaning |
| --- | --- |
| `ID` | Stable ID using the type prefix below. |
| `Type` | One of the five canonical evidence types. |
| `Claim` | One falsifiable or auditable proposition. |
| `Source` | Traceable artifact, person, query, repository location, observation, or experiment. |
| `Scope` | The people, product, scenario, environment, and time period to which the record applies. |
| `Support` | `supports`, `contradicts`, or `inconclusive` for this Claim. |
| `Strength` | `strong`, `moderate`, `weak`, or `none` for this Claim within this Scope. |
| `Implication` | What changes in the product judgment or next action if the record is accepted. |

Split a record whenever clauses have different sources, scopes, support, or strength. Strength never transfers from one claim or scope to another.

## The five evidence types

| Prefix | Type | Definition | What it does not prove |
| --- | --- | --- | --- |
| `EV-*` | `Observed Fact` | A directly observed or measured state, event, or behavior with a traceable source. Examples include a reproduced product path, measured funnel event, observed workaround, or systematically counted behavior. | Intent, causality, future demand, or value outside its Scope. |
| `ST-*` | `Stakeholder Statement` | Something a stakeholder, customer, or user says, requests, remembers, predicts, or reports. Quotes, minutes, transcripts, tickets, and survey free text remain Statements. | That the requested solution is right, the reported behavior occurred, users broadly need it, or the business should build it. |
| `D-*` | `Decision` | An authorized choice with an owner, date, and scope, including an explicit constraint, priority, acceptance choice, or stop decision. | Customer value, usability, feasibility, viability, or observed behavior. |
| `A-*` | `Assumption` | An unverified proposition that must hold for an outcome or decision to succeed. A useful Assumption is falsifiable and states what would kill it. | Anything until tested; an Assumption has `Strength: none`. |
| `X-*` | `Experiment Result` | The result of a test tied to a predeclared hypothesis, method, cohort or fixture, and pass, fail, and inconclusive thresholds. | Claims beyond the tested hypothesis and Scope. |

An exact meeting quote is always a `Stakeholder Statement`, never an `Observed Fact`. Multiple quotes do not become an Observed Fact by accumulation. A synthesis may create an Observed Fact only for a traceable count or observed pattern, such as “7 of 10 participants completed this workaround during contextual observation”; the underlying scope must remain visible.

## Scope, support, and strength

`Scope` is a boundary, not decoration. State who or what was examined, in which scenario and environment, and when. Do not generalize beyond it.

`Support` describes the relationship to the named Claim:

- `supports`: the source makes the Claim more credible within Scope.
- `contradicts`: the source makes the Claim less credible within Scope.
- `inconclusive`: the source cannot distinguish the Claim from relevant alternatives.

Assign `Strength` relative to the Claim and Scope:

- `strong`: direct, traceable, current evidence with a suitable sample or fixture and major alternative explanations controlled.
- `moderate`: direct and relevant evidence with a disclosed limitation in sample, recency, coverage, or control.
- `weak`: self-report, proxy, anecdote, inference, or narrow observation that only slightly changes confidence.
- `none`: no observation or test supports the Claim; use this for Assumptions.

No evidence type is automatically strong. A Decision can strongly prove what was authorized while having no strength for customer value. A Statement can strongly prove what one speaker said while having no strength for broader behavior or demand.

## Product evidence gate

A record qualifies as **product evidence** for a Claim only when all are true:

1. Its Type is `Observed Fact` or `Experiment Result`.
2. Its source is traceable and its Scope matches the Claim.
3. Its Support is `supports` or `contradicts`.
4. Its Strength is `moderate` or `strong`.

`Stakeholder Statement` and `Decision` records are essential for intent and alignment, but they never satisfy this gate. A meeting consensus cannot promote them into product evidence.

Repository evidence—including code, tests, configuration, diffs, logs, and runtime traces—can prove current implemented behavior or a technical constraint within the inspected revision and environment. It cannot by itself prove intended behavior, customer value, usability, market demand, or business viability. A test proves what the suite encodes, not that the encoded expectation is the right product decision.

## Four-Risk status colors

Apply these meanings separately to Value, Usability, Feasibility, and Viability:

| Status | Canonical meaning |
| --- | --- |
| `green` | Every load-bearing claim in this risk area has qualifying in-scope product evidence and no material contradiction remains. |
| `yellow` | Some qualifying evidence exists, but at least one material limitation, contradiction, or unresolved load-bearing claim remains. This risk area cannot support `Build`. |
| `red` | Qualifying evidence strongly contradicts a load-bearing claim, or a proven hard constraint makes the current direction unsafe or nonviable. Evaluate `Kill` or `Pivot` under its strict gate. |
| `UNKNOWN` | No qualifying product evidence exists for the load-bearing claims in this risk area. Use `Discovery`, `Experiment`, or `Prototype` as appropriate. |

A `green` status cannot coexist with a failed Product Evidence Gate for the same risk area's load-bearing claims.

## Canonical dispositions and strict gates

Choose exactly one disposition. A disposition names the next investment decision, not the eventual fate of the whole product.

When more than one gate appears applicable, resolve it in this order:

1. Use `Kill` when the supported opportunity itself should stop; use `Pivot` instead when one premise failed but qualifying product evidence still supports one adjacent opportunity.
2. Use `Pause` only for its named external blocker and resume condition.
3. Use `Align` before further learning only when a named authorized choice among concrete alternatives would change the target segment, intended outcome, scope, acceptance, or the evidence that should be collected. Ordinary blanks in a vague idea remain `A-*` records under `Discovery`. After an alignment decision, recompute the disposition immediately.
4. Otherwise choose `Discovery`, `Experiment`, or `Prototype` according to the highest consequential evidence gap.
5. Consider `Bet` or `Build` only after required alignment is recorded. Their strict gates still apply.

### `Kill`

Use only when a load-bearing Assumption is contradicted by strong product evidence, a hard feasibility or viability constraint is proven, a predeclared kill threshold is met, or an authorized `Decision` explicitly stops the work. Cite the decisive IDs and record what will no longer be funded.

### `Pause`

Use only when progress depends on a named missing source, access grant, accountable owner, prerequisite, or external event. Record the blocker, owner, and observable resume condition. Uncertainty that can be investigated now is `Discovery`, not Pause.

### `Discovery`

Use when the target user, problem, past behavior, current alternative, desired outcome, or another load-bearing Value/Viability claim lacks product evidence. Name the highest consequential unknown and one direct evidence source. A Statement requesting a feature is insufficient to leave Discovery.

### `Experiment`

Use only when there is one cited load-bearing `Assumption`, a falsifiable hypothesis, the smallest suitable method, a defined scope or cohort, and predeclared pass, fail, and inconclusive thresholds. The result must be recorded as `X-*` before advancing.

### `Prototype`

Use only when the highest consequential unknown concerns usability, feasibility, or solution behavior and a disposable artifact can answer it faster than production code. State one learning question, test participants or fixture, success and kill signals, and the boundary that keeps the artifact disposable. A prototype is evidence collection, not Build approval.

### `Pivot`

Use only when product evidence contradicts one load-bearing premise of the current direction while product evidence still supports an adjacent opportunity worth investigating. Cite what remains supported, what is abandoned, and exactly one replacement `A-*` premise. Pivot returns the replacement premise to `Discovery`, `Experiment`, or `Prototype`; it is not permission to Build.

### `Align`

Use only when a concrete ambiguity in intended behavior, scope, tradeoff, ownership, or acceptance requires an authorized decision. Cite the inspected evidence and the unresolved decision. Align may occur before product evidence exists, but afterward the work returns to the disposition warranted by the evidence; agreement does not imply Build.

### `Bet`

Use only when an accountable owner explicitly authorizes bounded delivery despite a named product-evidence gap. Require a `D-*` record plus the unsupported Assumptions, investment cap, expiry date, measurement plan, rollback path, and kill threshold. Label every downstream requirement as an explicit bet; never present it as validated.

### `Build`

Use only for a bounded scope when all are true:

1. The target user, problem or desired outcome, and current alternative are supported by product evidence.
2. Every load-bearing Value, Usability, Feasibility, and Viability risk is resolved by relevant product evidence or a traceable current-system fact appropriate to that risk; none is `UNKNOWN` and no material contradiction is unresolved.
3. Intended behavior, scope, owner, success metric, and scenario-level acceptance examples are recorded as Decisions.
4. The smallest releasable slice and post-release measurement or rollback plan are explicit.

If evidence is missing but delivery is deliberately authorized, use `Bet`. If decisions are missing, use `Align`. If a load-bearing claim is still unknown, use `Discovery`, `Experiment`, or `Prototype` according to the evidence needed.
