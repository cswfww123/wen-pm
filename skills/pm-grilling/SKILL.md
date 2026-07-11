---
name: pm-grilling
description: Continue a classified pm-intake docket by grilling exactly one routed evidence or decision gap at a time.
---

# PM Grilling

Turn a conversation into an evidence docket, not a more confident collection of opinions.

## 1. Load the gates

Read all of [`marty-cagan`](../marty-cagan/SKILL.md) and the canonical [`evidence model`](../pm-intake/references/evidence-model.md) before the first question. Apply Marty's evidence gate and four risks; use only the evidence fields, types, and strict disposition gates defined by the evidence model.

Also read [`../pm-process-retro/learnings/ACTIVE.md`](../pm-process-retro/learnings/ACTIVE.md) when present. Treat every **matching** scenario line as additional required branch force for this interview (extra rules, AC, or Prototype pressure). ACTIVE lines never redefine evidence types or disposition names.

Marty supplies the judgment lens. This skill supplies the interview protocol: its one-question repeat loop, Interview Mode, canonical dispositions, and Done Output take precedence over Marty's standalone question bundles, tone, and response template. In customer discovery, use the neutral behavior specified below.

Completion criterion: every existing and newly supplied claim can be classified without treating a stakeholder statement, meeting agreement, PRD, or implemented behavior as proof of user value; matching ACTIVE process force is loaded.

## 2. Fix the interview state

Set and retain:

- `Discovery Track`: `existing-change` when a current product or codebase must be extended, corrected, or rediscovered; otherwise `new-idea`.
- `Interview Mode`: `decision-alignment` when the respondent owns intent, scope, rules, or a business decision; `customer-discovery` when the respondent supplies evidence about their own behavior.
- `Subject`: the one product bet, workflow, or rejected change being examined.
- `Respondent`: role and relationship to the subject.

Load the matching branch reference completely:

- For `existing-change`, read [`references/existing-change.md`](references/existing-change.md).
- For `new-idea`, read [`references/new-idea.md`](references/new-idea.md).

Infer state from the intake docket and artifacts before asking. The Discovery Track persists through the grill; a later artifact enriches it rather than silently changing it. If evidence proves the track wrong, record that decision and restart intake under the new track. A respondent can require a different Interview Mode, but each question has exactly one mode. For a dual-role respondent, follow the intake Mode Order: default to neutral customer discovery first; use decision alignment first only when that authorized choice defines the target Scope or evidence, then recompute before customer discovery.

In `customer-discovery`, confirm the respondent is inside the target Scope and can describe their own first-hand behavior. An idea owner, salesperson, or decision-maker is not a customer-discovery proxy unless they personally qualify. When no qualified respondent is present, ask no research questions; route one recruitment or direct evidence-source action.

Completion criterion: Discovery Track, Interview Mode, Subject, and Respondent are explicit, the selected branch checklist is loaded, and any customer-discovery respondent is eligible for the target Scope.

## 3. Sweep evidence

Before interviewing, inspect every supplied artifact that can answer the branch checklist. For an existing codebase, use CodeGraph first when a `.codegraph/` directory exists; otherwise use local search and direct reads. Trace the relevant entrypoint and behavior through docs, tickets, diffs, tests, routes, schemas, configuration, feature flags, logs, screenshots, metrics, and feedback as available. Do not create an index when CodeGraph is absent.

Classify findings in the evidence ledger using IDs `EV-*`, `ST-*`, `D-*`, `A-*`, and `X-*` for the five matching canonical types. Code proves what is implemented, not why it is correct: every requirement inferred from code is an `Assumption` until independently supported or explicitly decided. Resolve contradictions or mark them unresolved; never average conflicting sources into a fake fact.

Completion criterion: every branch item answerable from available artifacts is populated before the first question, with a source locator and canonical evidence classification.

## 4. Run one repeat loop

Repeat this sequence after every answer or new artifact:

1. Ingest the response, separate compound claims, and classify each using the evidence model.
2. Update the branch dossier, evidence ledger, clarified terms, contradiction list, decision log, four-risk board, Product Evidence Gate, Alignment Gate, and canonical Build-condition checklist. A `D-*` record and decision-log entry include owner, date, scope, rationale, supporting evidence, and revisit trigger.
3. Select the highest-risk unresolved branch item that this respondent can answer.
4. Search available evidence again before asking. If evidence resolves it, update state and repeat without asking.
5. Evaluate the stop gate below. If it is closed, ask exactly one focused question in the active mode and wait.

In `decision-alignment`, precision may require labeled context before the question:

```text
Observed evidence: <sourced behavior or fact>
Candidate interpretation: <explicitly provisional reading>
Recommendation: <reasoned recommendation, when useful>
Q: <one decision or clarification>
```

In `customer-discovery`, ask one neutral question about a specific past event or observed behavior. Expose no recommendation, candidate solution, desired answer, or assessment of the respondent's reply. Prefer “Tell me about the last time…” over hypothetical willingness or future preference.

Keep customer-discovery interviewer notes internal until the interview stops; showing a live hypothesis can contaminate later answers.

Completion criterion per turn: state is updated before the next question, the question addresses one named evidence gap, no available artifact already answers it, and customer-discovery wording is neutral and past-behavior based.

## 5. Stop on evidence

Continue the loop until one condition is true:

- The respondent asks to stop.
- The canonical `Kill`, `Pause`, or `Pivot` gate is met.
- The highest-risk gap cannot be resolved by this respondent or the available artifacts, and exactly one canonical disposition gate is met with one bounded next action.
- Every required branch item is classified; every material contradiction is resolved or explicitly accepted; every remaining gap is outside this respondent's knowledge; and exactly one canonical disposition gate is met with one bounded next action.

Choose exactly one of the dispositions defined by the canonical evidence model: `Kill`, `Pause`, `Discovery`, `Experiment`, `Prototype`, `Pivot`, `Align`, `Bet`, or `Build`. Apply its strict gate verbatim. A request to end the interview stops the questions but does not relax the chosen disposition's gate. In particular, use `Pause` only for its named-blocker gate. `Build` is unavailable unless Product Evidence Gate and Alignment Gate both pass along with every other canonical Build condition. `Bet` remains bounded and visibly unvalidated; it never changes the Product Evidence Gate.

Completion criterion: a stop condition is cited, exactly one disposition is selected, and exactly one next route has an owner, input, and completion criterion. Otherwise continue the loop.

## Done Output

```md
# PM Grilling Docket

## Interview State
- Discovery Track:
- Interview Mode:
- Subject:
- Respondent:

## Clarified Terms
| Term | Agreed meaning | Status: agreed / contested / unresolved | Source IDs |
| --- | --- | --- | --- |

## Branch Dossier
<all fields from the selected branch reference>

## Evidence Ledger
| ID | Type | Claim | Source | Scope | Support | Strength | Implication |
| --- | --- | --- | --- | --- | --- | --- | --- |

## Decision Log
| ID | Decision | Owner | Date | Scope | Rationale | Evidence | Revisit trigger |
| --- | --- | --- | --- | --- | --- | --- | --- |

## Contradictions and Open Gaps
- ...

## Process Force Applied
- ACTIVE scenarios matched: none | <scenario names>
- Extra items forced by process memory: ...
- Process gap to retro (if any): none | one-line candidate for pm-process-retro

## Four Risks
- Value: red | yellow | green | UNKNOWN — evidence and gap
- Usability: red | yellow | green | UNKNOWN — evidence and gap
- Feasibility: red | yellow | green | UNKNOWN — evidence and gap
- Viability: red | yellow | green | UNKNOWN — evidence and gap

## Gates
- Product Evidence Gate: PASS | FAIL — qualifying IDs or gap
- Alignment Gate: PASS | FAIL — required `D-*` IDs or ambiguity
- Canonical Build Conditions: PASS | FAIL — condition status

## Disposition
- Decision: Kill | Pause | Discovery | Experiment | Prototype | Pivot | Align | Bet | Build
- Stop condition:
- Evidence:

## Route
- Next: <exactly one skill or concrete action>
- Owner:
- Input:
- Completion criterion:
```

## Routes

- Use `prioritize-assumptions` only when several dangerous assumptions compete for first test.
- Use `brainstorm-experiments-existing` or `brainstorm-experiments-new` when the disposition is `Experiment`.
- Use `pm-prototype` only for one named usability, logic, or feasibility question.
- Use `opportunity-solution-tree` when supported outcomes contain multiple unresolved opportunities.
- Use `pm-alignment-to-prd` for `Align`, or to turn an already authorized `Build` / `Bet` into a traceable handoff.
- After a `decision-alignment` session changes or confirms any material track-specific field—such as Current/Expected/Delta, idea thesis, target segment, outcome, scope, constraints, experiment boundary, or acceptance—use `pm-alignment-to-prd` to create and confirm the matching brief before a subsequent `Discovery`, `Experiment`, or `Prototype`. It must preserve the failed Product Evidence Gate and produce no development handoff.
- A `Kill`, `Pause`, or `Pivot` route names the one archival, unblock, or re-intake action required; it is never a menu.
- If this session exposed a **process** hole (missed altitude class, ACTIVE line would have helped but did not exist, consensus treated as evidence, skipped Prototype on complex form/state), route once to [`pm-process-retro`](../pm-process-retro/SKILL.md) to log a `PL-*` **before** or **instead of** writing more product prose—then resume the product disposition.
