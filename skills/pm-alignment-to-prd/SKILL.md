---
name: pm-alignment-to-prd
description: Use when PM discovery has a settled docket and the user needs stakeholder, customer, or user alignment, a PRD, flow notes, acceptance criteria, or a handoff into Matt Pocock engineering skills.
---

# PM Alignment To PRD

Convert a settled PM docket into explicit agreement and then into development input.

## Readiness Gate

Proceed only when the docket states:

- target user or role
- source evidence for material claims
- current alternative
- pain strength
- desired outcome
- scope and out of scope
- success metric
- value, usability, feasibility, and viability risks
- kill criterion or explicit reason no kill criterion applies

If an item is missing, route back to `pm-grilling` with the highest-risk missing question.

## Steps

1. **Write the stakeholder alignment brief**
   Create a stakeholder-facing brief that can be read back for confirmation:
   - Original input/source evidence
   - PM interpretation
   - Requirement restatement
   - Problem
   - Target user/role
   - Current alternative
   - Desired outcome
   - Confirmed decisions
   - Pending confirmation
   - Proposed solution shape
   - Scope
   - Out of scope
   - Business workflow: actors, trigger, main flow, exception flow, boundaries
   - Success metric
   - Open risks
   - Kill criterion
   - Confirmation status
   Completion criterion: every readiness-gate item appears exactly once, and every material stakeholder-facing claim links to source evidence or is marked as an assumption.

2. **Ask for explicit agreement**
   Ask the relevant stakeholder, customer, or user to confirm, correct, or mark disputed sections. Treat silence or vague approval as unresolved for disputed/high-risk items.
   Completion criterion: each section is marked approved, changed, or disputed.

3. **Red-team risky agreement**
   If approved sections still contain load-bearing assumptions, route to `strategy-red-team` before generating a development handoff.
   Completion criterion: every load-bearing assumption is either backed by evidence, assigned a cheap test, or explicitly accepted as a risk.

4. **Generate development input**
   After approval, produce:
   - PRD-ready summary
   - Flow notes or a mermaid flowchart when a workflow exists
   - Acceptance criteria
   - Prototype question, if one uncertainty should be tested before build
   - Matt handoff: `to-prd`, `to-issues`, `prototype`, or `test-scenarios`
   Completion criterion: the output names exactly one next Matt skill unless the recommendation is to continue PM discovery.

## Output

```md
## Stakeholder Alignment Brief

### Original Input / Source Evidence

### PM Interpretation

### Requirement Restatement

### Problem

### Target User

### Current Alternative

### Desired Outcome

### Confirmed Decisions

### Pending Confirmation

### Solution Shape

### Scope

### Out Of Scope

### Business Workflow

#### Actors

#### Trigger

#### Main Flow

#### Exception Flow

#### Boundaries

### Success Metric

### Open Risks

### Kill Criterion

### Confirmation Status
- Confirmed
- Needs Changes
- Still Disputed

## Development Input

### Acceptance Criteria

### Flow

### Prototype Question

### Matt Handoff
to-prd | to-issues | prototype | test-scenarios | strategy-red-team | continue pm-grilling
```
