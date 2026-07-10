---
name: pm-intake
description: Intake product work when the user brings a rough idea, stakeholder request, meeting or transcript, document, existing product or codebase change, or dissatisfaction with an implementation and needs the next PM discovery action chosen for them.
---

# PM Intake

This is the automatic front door for product work. The user does not need to know PM terminology or choose a workflow. Inspect what already exists, classify the case, build an evidence docket, and choose exactly one next action.

Before classifying anything, read and apply the canonical [evidence model](references/evidence-model.md). Use its evidence types, fields, ID prefixes, strengths, and dispositions exactly; do not create local synonyms.

## Steps

### 1. Inspect before asking

Inventory every available source: the conversation, live-meeting context, notes or transcripts, requirements, screenshots, analytics, customer research, support records, current product, repository, diff, tests, logs, and prior decisions.

- Read every accessible source that can answer a material question before asking a person.
- For an existing implementation, trace the relevant user path and current behavior. If the repository has `.codegraph/`, use CodeGraph before text search.
- Record precise source locations. List inaccessible sources rather than guessing their contents.
- Treat a meeting quote as a `Stakeholder Statement`, even when it is exact or comes from a customer. A quote never becomes product evidence merely because it appears in minutes or a transcript.
- **Process memory:** read [`../pm-process-retro/learnings/ACTIVE.md`](../pm-process-retro/learnings/ACTIVE.md) when present. Matching scenario lines are mandatory force on later grilling/alignment; they do not invent product evidence. If this intake is itself about fixing the PM flow after rework, prefer disposition route to `pm-process-retro` before more product docs.

**Completion criterion:** every accessible relevant source has been inspected and cited; every inaccessible relevant source is named; no pending question can already be answered from those sources; ACTIVE process scenarios that match the subject are noted for the next skill.

### 2. Classify without asking the user to choose

Assign one value for each classifier:

**Discovery Track**

- `existing-change`: a current product, flow, feature, or codebase behavior must be understood, extended, corrected, or reconsidered. Rework after an unsatisfactory implementation belongs here.
- `new-idea`: there is no relevant implemented behavior yet; the work begins with a problem, opportunity, or solution idea.

**Interview Mode**

- `decision-alignment`: the next conversation must clarify intended behavior, scope, constraints, tradeoffs, ownership, or acceptance with someone authorized to decide.
- `customer-discovery`: the next conversation must learn about a target user's past behavior, context, pain, current alternative, or outcome without pitching or recommending a solution.

Also record `Primary Source` and `Sources Inspected`. If the same person is both decision-maker and target user, use canonical disposition precedence to set the order. Default to `customer-discovery -> decision-alignment`; use `decision-alignment -> customer-discovery` only when the missing authorized decision changes the target Scope or evidence to collect. Keep the two sections visibly separate.

**Completion criterion:** the docket contains exactly one Discovery Track, exactly one initial Interview Mode, a source inventory, and a one-sentence rationale. A dual-role interview records one justified order and the evidence/decision boundary between its modes.

### 3. Build the evidence docket

Create the canonical Evidence Ledger. Give every material claim its own record; split a sentence when its clauses have different sources, scopes, or support. Record contradictions rather than resolving them by interpretation.

Then add the track-specific docket:

**For `existing-change`**

- Affected user, scenario, and desired outcome
- `Current`: behavior demonstrated by the current product or repository
- `Expected`: intended behavior, still typed as a Statement, Decision, or Assumption according to its source
- `Delta`: the observable difference between Current and Expected
- `Keep / Change / Remove`
- Regression risks and scenario-level acceptance examples

**For `new-idea`**

- Proposed user and triggering situation
- Current alternative and cost of the present behavior
- Desired outcome
- Load-bearing assumptions
- Smallest evidence needed to kill or advance each load-bearing assumption

For both tracks, mark Value, Usability, Feasibility, and Viability as `green`, `yellow`, `red`, or `UNKNOWN`. A color must cite evidence IDs; absence of qualifying evidence is `UNKNOWN`, not green.

Use `Unresolved` for Expected or Delta when rejection feedback does not specify the intended observable behavior. Never invent them to complete the docket.

**Completion criterion:** every material claim and contradiction has an evidence record; every risk color cites record IDs; an existing-change docket contains Current, Expected, and Delta; a new-idea docket identifies at least one falsifiable load-bearing assumption.

### 4. Choose one disposition and one next action

Apply the disposition gates in the evidence model. Choose the first action that reduces the highest consequential unknown; do not output a menu.

Unless the canonical `Kill`, `Pivot`, or `Pause` gate already wins, a rejected `existing-change` authorizes Expected and derives Delta first when intended behavior is ambiguous, because that decision changes what evidence or solution should be investigated. Immediately after alignment, recompute the disposition; absent qualifying product evidence, the next disposition is normally `Discovery`, `Experiment`, or `Prototype`, not `Build`.

A vague `new-idea` with enthusiasm but no qualifying product evidence defaults to `Discovery`. Use `Align` first only for a named authorized strategic choice among concrete alternatives that must be settled before the evidence target can be defined.

Use these routes only after the disposition is valid:

| Disposition | Single next-action route |
| --- | --- |
| `Kill` | Record the kill decision and stop investment. |
| `Pause` | Obtain the one named missing source, access, owner, or prerequisite. |
| `Discovery` | If a qualified target user is present, start `pm-grilling` in `customer-discovery` mode; otherwise choose one participant-recruitment, observation, data, or research action instead of interviewing a proxy. |
| `Experiment` | Design or run one test for the named assumption; use the existing/new experiment skill matching the Discovery Track when design is still missing. |
| `Prototype` | Start `prototype` with one learning question and a discard boundary. |
| `Pivot` | Replace exactly one disproven core premise with a named `A-*` premise while preserving the evidence-backed opportunity. |
| `Align` | Start `pm-grilling` in `decision-alignment` mode with the first unresolved decision. |
| `Bet` | Start `pm-alignment-to-prd` and preserve the explicit bet cap, expiry, measurement, and rollback conditions. |
| `Build` | Start `pm-alignment-to-prd` with the evidence-backed scope and acceptance examples. |

When the highest consequential unknown is **our process** (missed grill altitude, false gates, skill holes) rather than the product bet, route next action to `pm-process-retro` even if the product disposition remains `Align` / `Discovery` / `Pause`. Do not use a fake product disposition to paper over a process gap.

Apply canonical disposition precedence before arranging a dual-role meeting. Within that meeting, complete neutral customer-discovery questions before exposing recommendations, unless a missing authorized decision makes the evidence target undefined; in that case record the decision, recompute the disposition, and run customer discovery afterward. Alignment can clarify intent; it cannot turn a Statement or Decision into product evidence.

**Completion criterion:** one valid disposition cites the gate and supporting record IDs, and the response ends with exactly one next action, one owner, and one checkable completion signal.

## Output

```md
## Intake Classification
- Discovery Track: existing-change | new-idea
- Interview Mode: decision-alignment | customer-discovery
- Mode Order: customer-discovery -> decision-alignment | decision-alignment -> customer-discovery | single mode
- Primary Source: ...
- Sources Inspected: ...
- Rationale: ...

## Evidence Ledger
| ID | Type | Claim | Source | Scope | Support | Strength | Implication |
| --- | --- | --- | --- | --- | --- | --- | --- |

## Product Docket
<!-- existing-change: user/scenario/outcome, Current, Expected, Delta, Keep/Change/Remove, regression risks, acceptance examples -->
<!-- new-idea: user/situation, current alternative/cost, outcome, load-bearing assumptions, kill/advance evidence -->

## Four-Risk Status
| Risk | Status | Evidence IDs | Unknown or contradiction |
| --- | --- | --- | --- |
| Value | ... | ... | ... |
| Usability | ... | ... | ... |
| Feasibility | ... | ... | ... |
| Viability | ... | ... | ... |

## Disposition
- Disposition: Kill | Pause | Discovery | Experiment | Prototype | Pivot | Align | Bet | Build
- Gate: ...
- Evidence IDs: ...

## One Next Action
- Action: ...
- Owner: ...
- Completion signal: ...
```
