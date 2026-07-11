# UI Contract (Product Delivery)

Load when the change has a user-visible surface (page, form, modal, wizard,
dashboard widget, or multi-step UI). Omit only for pure API/backend/CLI work
with no presentation layer.

This contract is part of the Product Delivery Contract. Engineering must treat
it as product truth for UI; it does not authorize code changes by itself.

## When Required

**Required** if any of:

- user-visible screens or components change
- fields are added, removed, renamed, or re-validated
- visibility, enablement, or requiredness depends on other fields/state
- empty, error, loading, or permission states are product-meaningful

**Not required** for pure service, job, migration, or API contract work with no UI.

Without a required UI contract, do not mark the PRD ready for engineering
handoff; route back to grilling or a delivery-grade prototype pin.

## Delivery Prototype Pin

Learning prototypes (`pm-prototype`) are not delivery truth. Only a **pinned**
delivery source may be referenced here.

```md
## Delivery Prototype
- Status: none | pinned
- Path or URL:
- Version / commit / export id:
- Frames or screens covered: SCR-...
- Not a source of truth: <learning prototypes, expired mocks>
```

## Screens `SCR-*`

```md
## Screens
| ID | Name | Entry | Exit / next | Prototype frame | REQ / AC |
|---|---|---|---|---|---|
| SCR-001 | ... | ... | ... | ... | REQ-... / AC-... |
```

## Fields `FLD-*`

Every user-editable or user-visible data field that can drift in implementation:

```md
## Fields
| ID | Label | Control | Required | Default | Validation | Error copy | Visible when | Editable when | Source | SCR | AC |
|---|---|---|---|---|---|---|---|---|---|---|---|
| FLD-001 | ... | text/select/... | Y/N | ... | ... | ... | always / RULE-... | ... | user/api | SCR-... | AC-... |
```

## Linkage Rules `RULE-*`

Write **checkable** rules, not screenshots-as-hope:

```md
## Linkage Rules
### RULE-001 — <name>
- When: <condition on FLD-*, role, or state>
- Then: show/hide/require/disable/set <FLD-* or SCR-*>
- Else: ...
- AC: AC-...
- SCN: SCN-... (after test-scenarios)
```

## UI States

```md
## UI States
| State | SCR | Observable | AC |
|---|---|---|---|
| loading | ... | ... | ... |
| empty | ... | ... | ... |
| error | ... | ... | ... |
| forbidden | ... | ... | ... |
| partial / multi-entity | ... | ... | ... |
```

## Completeness Gate

UI contract is complete when:

- every in-scope interactive field has a `FLD-*` row
- every conditional visibility/requiredness has a `RULE-*`
- every SCR maps to at least one AC
- delivery prototype is pinned with version (or explicitly `none` with reason
  for non-visual surfaces only)
- multi-entity / multi-section forms include conditional matrix rows (not only
  outcome-level prose)
