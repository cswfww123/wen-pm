# Process Learning Schema

## ID

`PL-YYYYMMDD-NN` (local day of capture, two-digit sequence) or `PL-YYYYMMDD-<short-slug>` when a slug aids search.

## Status lifecycle

```text
observed → active → applied → validated
                ↘ rejected
                ↘ superseded
                ↘ ineffective
```

| Status | Meaning |
| --- | --- |
| `observed` | Logged; not yet forced on every run |
| `active` | Present in `ACTIVE.md`; agents must apply matching scenarios |
| `applied` | Core skill or branch reference was patched |
| `validated` | A later real case showed the patch would have caught the gap |
| `ineffective` | Later case showed the patch did not help; revise or supersede |
| `rejected` | Not a process gap |
| `superseded` | Replaced by a newer `PL-*` |

## Ledger columns

| Column | Content |
| --- | --- |
| ID | `PL-*` |
| Date | ISO date |
| Severity | S1 / S2 / S3 |
| Status | lifecycle value |
| Gap key | kebab-case stable key for dedup, e.g. `form-conditional-fields` |
| One-line gap | process failure, not product wish |
| Skill surface | comma-separated skill names |
| Source case | product + scenario |
| Patch summary | what changed in ACTIVE or skills |
| Validate on | what future signal marks validated/ineffective |

## Gap keys (starter taxonomy)

Reuse keys when the same process hole reappears:

- `form-conditional-fields` — progressive disclosure / field linkage never grilled
- `multi-entity-copy` — N child entities, copy, partial submit
- `form-ia-reference-pane` — reference context vs scroll density untested
- `visual-as-requirement` — color/layout locked without usability test
- `consensus-as-evidence` — sign-off treated as Product Evidence Gate
- `skipped-prototype` — complex UI/state shipped without disposable test
- `title-level-expected` — Expected stayed macro; rules/AC missing
- `wrong-interview-mode` — decision-maker used as customer proxy or reverse
- `code-as-intent` — implementation treated as correct Expected

Add new keys sparingly; prefer extending an existing key with a sharper patch.

## Card template (optional)

`learnings/cards/PL-YYYYMMDD-<slug>.md`:

```md
# PL-...

## Combat story
What happened in product work.

## Process failure
Which skill step was silent.

## Forced next time
Checklist / question / disposition.

## Non-goals
What this lesson must not become (e.g. a product feature list).
```
```