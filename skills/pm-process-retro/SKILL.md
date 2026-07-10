---
name: pm-process-retro
description: Capture real PM-flow failures as process lessons and promote proven gaps into skill checklist patches.
---

# PM Process Retro

Turn combat failures into process patches. Product discovery learns about users; this skill learns about **our discovery process**.

Paper debate does not upgrade the flow. Only a named gap from real intake, grilling, prototype, PRD, delivery, or rework may enter the ledger. One lesson per run unless the user explicitly batches a retro.

## When to run

Trigger after any of:

- Rework: implementation or PRD was rejected because a class of detail was never grilled (fields, multi-entity, progressive disclosure, drafts, cascade rules).
- Wrong altitude: the flow stayed at titles while the real risk was form IA, state machine, or copy/partial-submit behavior.
- False gate: consensus, wireframe sign-off, or PRD polish was treated as product evidence.
- Missed route: disposition should have been `Prototype` / `Experiment` / `Discovery` but jumped to PRD or Build.
- User says: 流程要进化、补流程、process retro、吸取教训、完善 skill.

Do **not** use this skill to invent product requirements. It only changes how agents inquire, classify, and gate.

## Steps

### 1. Load the process memory

Read, in order:

1. [`learnings/ACTIVE.md`](learnings/ACTIVE.md) — mandatory checklists already promoted.
2. [`learnings/ledger.md`](learnings/ledger.md) — open and recently applied lessons.
3. [`references/learning-schema.md`](references/learning-schema.md) — record shape and statuses.
4. [`references/promote-rules.md`](references/promote-rules.md) — when a lesson may patch a skill.

If the working product repo is not `wen-pm`, still write lessons into the **wen-pm** skill tree (this skill’s `learnings/`), then remind the user to run `./scripts/sync-skills.sh` so other agents pick up the patch.

**Completion criterion:** ACTIVE and ledger are in context; no duplicate open lesson for the same gap key.

### 2. Capture exactly one combat gap

From the conversation, docket, rejection, or diff, write one `PL-*` record (see schema). Required fields:

| Field | Rule |
| --- | --- |
| `Gap` | What the process failed to force (not what the product should do). |
| `Symptom` | Observable failure: rework, wrong build, missed grill, false confidence. |
| `Source case` | Concrete case (product/path/date). No anonymous “we feel”. |
| `Missed altitude` | Which layer was skipped: value / rules / flow / form-IA / visual / delivery. |
| `Should have forced` | The question, checklist item, disposition, or gate that was missing. |
| `Skill surface` | Which skill(s) should change: `pm-intake`, `pm-grilling`, `prototype`, … |
| `Proposed patch` | Smallest durable fix: ACTIVE checklist line, branch item, or SKILL.md edit. |
| `Promotion bar` | What would justify editing a core skill vs staying on ACTIVE only. |

Classify severity:

- `S1` — caused or nearly caused Build/PRD of wrong behavior.
- `S2` — caused rework or long Align loops; no ship yet.
- `S3` — friction or taste; keep as note unless it repeats.

**Completion criterion:** one complete `PL-*` with severity and a falsifiable “process would have caught this if…”.

### 3. Decide the evolution action

Choose exactly one:

| Action | When | Effect |
| --- | --- | --- |
| `record-only` | Weak single anecdote or unclear skill surface | Append ledger; status `observed` |
| `activate-checklist` | Clear recurring pattern or S1/S2 with crisp checklist | Update `ACTIVE.md`; status `active` |
| `patch-skill` | Promote rules pass | Edit target skill/reference; status `applied`; link commit or diff |
| `supersede` | Newer lesson replaces an old one | Old → `superseded`; new → `active` or `applied` |
| `reject` | Not a process gap (product preference, one-off noise) | status `rejected` with reason |

Never auto-patch core skills on first sight of a taste issue (colors, pure layout preference). Form **behavior** gaps (conditional fields, multi-entity, draft/submit) may `activate-checklist` on first S1/S2 combat case.

**Completion criterion:** one action chosen with promotion-rules citation.

### 4. Write durable artifacts

1. Append or update the row in [`learnings/ledger.md`](learnings/ledger.md).
2. If `activate-checklist` or `patch-skill`, edit [`learnings/ACTIVE.md`](learnings/ACTIVE.md) so the next `pm-intake` / `pm-grilling` loads the new force item.
3. If `patch-skill`, apply the smallest edit to the named skill or branch reference; keep evidence-model vocabulary intact.
4. Optionally write a full card under `learnings/cards/PL-YYYYMMDD-<slug>.md` when the case needs narrative.

**Completion criterion:** ledger and (if needed) ACTIVE/skill files on disk; user told to `./scripts/sync-skills.sh` after skill patches.

### 5. Close the loop back to product work

End with exactly one product-flow next action (not a menu):

- Resume the interrupted skill (`pm-grilling`, `prototype`, `pm-alignment-to-prd`, …) **with** the new ACTIVE item applied; or
- Open a new intake if the process gap invalidates the previous disposition.

**Completion criterion:** process memory updated **and** product work has one owner + completion signal.

## Done Output

```md
## Process Retro

### Lesson
| Field | Value |
| --- | --- |
| ID | PL-... |
| Severity | S1 \| S2 \| S3 |
| Gap | ... |
| Symptom | ... |
| Source case | ... |
| Missed altitude | ... |
| Should have forced | ... |
| Skill surface | ... |

### Evolution
- Action: record-only | activate-checklist | patch-skill | supersede | reject
- Files touched: ...
- Promotion rule: ...

### ACTIVE delta
- Added / changed checklist lines: ...

### Product route (one next action)
- Action: ...
- Owner: ...
- Completion signal: ...
```

## Hard rules

1. **Combat before theory.** No lesson without a named case or rejection artifact.
2. **Process ≠ product.** Do not smuggle feature requests into ACTIVE as if they were evidence.
3. **Smallest patch.** Prefer one checklist line over rewriting a skill.
4. **Evidence model is frozen.** Retros may add inquiry force; they must not redefine `EV/ST/D/A/X` or disposition gates.
5. **Validate later.** After a patch is used on a later case, mark the lesson `validated` or `ineffective` in the ledger.
```