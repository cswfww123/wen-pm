# Active Process Force List

Agents running `pm-intake`, `pm-grilling`, `pm-alignment-to-prd`, `prototype`, or `to-prd` **must** read this file and apply every matching scenario line before claiming Align / Build readiness.

Lines are process force, not product requirements. They expire only via `pm-process-retro` (`supersede` / `ineffective` / prune).

---

## Scenario: multi-entity or multi-section asset forms

**When subject matches any of:** supplier/partner submits structured assets; BM/WABA/account trees; parent record + N heavy children; long forms with conditional sections; operational “fill once, few errors” tools.

**Force (from PL-20260710-01):**

1. **Conditional field matrix** — For every “select X then expand Y” rule, record: trigger, revealed fields, required-when-visible, cascade-on-change (clear / keep / revalidate). Missing matrix → Alignment Gate FAIL; stay on `Align` or `Prototype`.
2. **Multi-entity ops** — N children: add / remove / reorder / copy scope (all vs modules vs base-only) / draft vs submit / partial-submit legality. Each needs at least one business-readable AC. Missing → cannot claim grilling branch complete.
3. **Usability altitude** — If the main risk is “can an operator complete without missing modules”, disposition must consider `Prototype` with **one** named learning question (e.g. reference pane + scroll vs single long form). Pure color/module-tint preferences stay `A-*` until a task-failure symptom exists; do not lock them as REQ.
4. **Consensus ≠ evidence** — Wireframe or PRD “everyone agreed” is `D-*` / `ST-*` only. Product Evidence Gate still needs `EV-*` / `X-*` or an explicit `Bet`. Do not treat full-signoff on PRD+flow+wireframe as Build authorization by itself.

**Blocks:** `Build` (and unlabelled “ready for eng”) until items 1–2 have `D-*`+`AC-*` or an explicit Bet covering the gaps; item 3 answered or consciously deferred with owner.

---

## Scenario: title-level Expected only

**When:** Expected / scope is described only as “collect asset / support WABA / improve form” without rules or scenario AC.

**Force:**

1. Refuse to advance past grilling until at least main path + one material edge AC exist, or disposition is explicitly `Align` with the missing decision named.
2. Prefer one more grill question over drafting PRD prose.

---

## How to add lines

Only via `pm-process-retro` (`activate-checklist` or `patch-skill`). Do not hand-edit product opinions into this file mid-feature without a `PL-*` ledger row.
```