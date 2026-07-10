---
name: summarize-interview
description: Continue a pm-intake transcript route by separating observed behavior, reported history, opinions, and authorized decisions.
---

# Summarize Product Interview

Produce a source-traceable summary. A transcript proves what was said. Only directly observed or measured facts and scoped experiment results can qualify as product evidence; reported past behavior remains a Statement.

Before acting, read all of the canonical [evidence model](../pm-intake/references/evidence-model.md). Use its record schema and promotion rules without inventing stronger evidence types.

## Steps

### 1. Read and classify the interview

Read the full transcript and any demonstrated artifacts. Record whether this was:

- **User research**: learn past behavior, context, alternatives, outcomes, and constraints.
- **Stakeholder alignment**: clarify intent, constraints, authority, and decisions.
- **Mixed**: keep the two evidence streams separate.

Record date, participants, roles, research question, and source location. Use timestamps, line references, or section markers for every material finding.

**Complete when:** the full source has been read, interview mode is named, and every participant's role and decision authority are explicit or marked unknown.

### 2. Separate the evidence streams

Classify each material statement into exactly one primary stream:

- **Direct observation**: an action or artifact demonstrated during the session.
- **Reported past behavior**: a specific event the participant says already happened; preserve when, context, action, and consequence. It remains a `Stakeholder Statement`, not an observed fact.
- **Opinion or request**: preference, prediction, proposed solution, generalization, or desired future behavior.
- **Decision or constraint**: an explicit choice or boundary stated by someone with authority. If authority or commitment is unclear, keep it as a stakeholder statement.

Preserve supplied IDs. Otherwise assign `EV-*` only to directly observed or measured facts, `ST-*` to reported past behavior, opinions, and requests, and `D-*` to authorized decisions or constraints. Every record keeps `ID | Type | Claim | Source | Scope | Support | Strength | Implication`.

Preserve contradictions and negative evidence. Paraphrase faithfully; use short quotes only when wording itself matters.

**Complete when:** every substantive finding has one class and source reference, past behavior is distinct from opinion, and no request has been promoted into observed evidence.

### 3. Synthesize without inventing consensus

Extract:

- trigger, job, desired outcome, and current alternative
- behavior sequence and frequency where stated
- time, money, risk, effort, or emotional consequence
- satisfaction and workaround evidence
- decisions, their owner, date, scope, and status
- contradictions, unknowns, and assumptions affected

Use `Not stated` for missing information. For each affected assumption, link the source records and state whether the canonical Product Evidence Gate changed. A Statement can redirect discovery; it cannot pass that gate.

**Complete when:** every synthesis claim traces to a classified finding, decisions retain owner and scope, and unavailable facts remain unavailable.

### 4. Write the durable summary

Save the summary as Markdown in the user's workspace. Follow an existing research-doc convention; otherwise use `docs/research/interviews/YYYY-MM-DD-<participant-or-topic>.md`.

**Complete when:** the file exists locally, contains the source locator, and another reviewer can trace every finding, decision, and assumption update back to the transcript.

## Output Template

```md
# Interview Summary: <topic>

## Metadata
- Date:
- Mode: User research | Stakeholder alignment | Mixed
- Participants and roles:
- Decision authority:
- Research question:
- Source:

## Direct Observations
| ID | Type | Claim | Source | Scope | Support | Strength | Implication |
|---|---|---|---|---|---|---|---|

## Reported Past Behavior
| ID | Type | Claim | Source | Scope | Support | Strength | Implication |
|---|---|---|---|---|---|---|---|

## Opinions And Requests
| ID | Type | Claim | Source | Scope | Support | Strength | Implication |
|---|---|---|---|---|---|---|---|

## Decisions And Constraints
| ID | Type | Claim | Source | Scope | Support | Strength | Implication |
|---|---|---|---|---|---|---|---|

### Decision Details
| Decision ID | Owner | Date | Scope / status | Revisit trigger |
|---|---|---|---|---|

## Jobs, Outcomes, And Friction
- ...

## Contradictions And Unknowns
- ...

## Assumption Updates
| Assumption ID | Linked record IDs | Support / contradiction | Product Evidence Gate changed? | Next evidence needed |
|---|---|---|---|---|

## Follow-ups
- Owner — action — due date or trigger
```
