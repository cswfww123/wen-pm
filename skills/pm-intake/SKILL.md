---
name: pm-intake
description: Use when the user brings stakeholder, customer, or user input as meeting notes, live discussion, a rough document, screenshots, chat logs, or scattered feature requests and needs PM discovery before development.
---

# PM Intake

Turn stakeholder, customer, or user fragments into a discovery docket before any PRD or build handoff.

## Steps

1. **Classify the source**
   - Meeting/live interview: route to `pm-grilling` and keep notes as the user answers.
   - Interview preparation request: route to `interview-script`.
   - Interview recording or transcript: route to `summarize-interview`.
   - Batch of feature requests: route to `analyze-feature-requests`.
   - Document/log/screenshot: read the whole artifact first, then extract the docket below.
   - Mixed source: process the durable artifact first, then route the gaps to `pm-grilling`.
   - Completion criterion: every provided source is classified as meeting, artifact, or mixed.

2. **Extract the docket**
   Create a compact table with:
   - Claim: what the stakeholder, customer, or user appears to want
   - Evidence: exact artifact line, meeting quote, observed behavior, data, or `missing`
   - User/role: who is affected
   - Current alternative: how they solve it today
   - Outcome: what changes if this succeeds
   - Risk: value, usability, feasibility, or viability
   - Question: the next PM question needed
   Completion criterion: every material claim is in the table, including contradictions.

3. **Gate the next move**
   - If the docket has missing evidence or contradictions, start `pm-grilling` with the highest-risk question.
   - If the docket has enough evidence but the opportunity space is still messy, route to `opportunity-solution-tree`.
   - If the docket is mostly solution requests, route to `identify-assumptions-existing` or `identify-assumptions-new`.
   - If the docket answers value, usability, feasibility, viability, scope, and success metrics, route to `pm-alignment-to-prd`.
   - If the input is only a solution request, ask for the real user, current alternative, and success metric before anything else.
   Completion criterion: the response ends with exactly one next route.

## Output

```md
## Intake Docket

| Claim | Evidence | User/Role | Current Alternative | Outcome | Risk | Question |
| --- | --- | --- | --- | --- | --- | --- |

## Contradictions
- ...

## Next Route
pm-grilling | interview-script | summarize-interview | analyze-feature-requests | opportunity-solution-tree | identify-assumptions-existing | identify-assumptions-new | pm-alignment-to-prd | needs source
```
