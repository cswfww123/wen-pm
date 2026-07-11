# Promote Rules

When may a combat lesson change agent behavior?

## Always allowed on first S1/S2 combat case

`activate-checklist` — add a short, scenario-gated line to `learnings/ACTIVE.md`.

Examples that qualify:

- Conditional field expansion never entered business rules or AC.
- Multi-entity create/copy/partial-submit never had edge flows.
- Complex operational form went to PRD without a named Prototype question.
- Meeting/wireframe consensus was used to claim Product Evidence Gate PASS.

## Requires second case OR explicit user authority for `patch-skill`

Edit `pm-grilling` / `pm-intake` / `pm-prototype` / `to-prd` body or branch references only when:

1. The same `gap key` appears twice with independent source cases; or
2. Severity is S1 and the user explicitly authorizes a skill patch this run; or
3. An `active` checklist was marked `ineffective` and a sharper skill-level force is needed.

## Never promote

- Pure visual taste (module background color, brand chrome) without a task-completion failure.
- One stakeholder’s preferred layout without a usability or error-rate symptom.
- Product feature ideas dressed as “process gaps”.
- Changes that redefine the canonical evidence model or invent new disposition names.
- Global mandatory questions for every product (keep ACTIVE scenario-gated).

## ACTIVE line quality bar

A good ACTIVE line is:

1. **Scenario-gated** — “When the subject is multi-entity form / asset intake / …”
2. **Observable** — names rules, AC, disposition, or prototype question to produce.
3. **Stoppable** — says what blocks Align/Build if missing.
4. **Short** — one force, not an essay.

Bad: “Make UI nicer and more organized.”  
Good: “When Expected includes multi-section asset forms: require conditional-field state matrix + multi-entity copy/partial-submit edge flows as AC, or disposition stays Align/Prototype.”

## Validation

After a promoted line is live, the next matching product case must either:

- show the force item was asked and caught a real gap → mark `validated`; or
- show the force item ran but rework still hit the same hole → mark `ineffective` and open a new `PL-*`.
```