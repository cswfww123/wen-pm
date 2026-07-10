---
name: to-issues
description: Continue an authorized traceable PRD by writing local vertical-slice issue files.
---

# To Issues

Turn a ready PRD into independently verifiable tracer-bullet issues. Preserve product evidence and decisions through delivery; slicing does not rewrite the requirement.

Before acting, read all of the canonical [evidence model](../pm-intake/references/evidence-model.md). Preserve its records and the source disposition; a `Bet` remains labeled and bounded in every downstream issue.

## Admission Gate

The source must provide:

- status `Ready for delivery review`, an owner, and disposition `Build` or `Bet`
- passed alignment and delivery authorization gates
- in-scope and out-of-scope behavior
- stable `REQ-*` and `AC-*` IDs
- evidence or bounded-Bet and `D-*` references for every requirement
- the complete canonical Bet contract when disposition is `Bet`

On any failure, save only a local blocking-gap report at `docs/issues/<prd-slug>-blocked.md` or the repository's equivalent, then stop. The report names the source, missing items, owner, next canonical disposition, action, and exit condition; it contains no `ISS-*` drafts.

## Steps

### 1. Gather and trace the source

Read the PRD, its canonical records, decisions, acceptance criteria, and repository context. Preserve `EV-*`, `ST-*`, `D-*`, `A-*`, `X-*`, `REQ-*`, and `AC-*` IDs. When slice boundaries depend on existing behavior, trace the entrypoint, integration path, state changes, permissions, migrations, and test seams.

**Complete when:** the admission gate passes, every in-scope requirement and acceptance criterion is in a coverage ledger, and each repository-dependent boundary has a source.

### 2. Draft vertical tracer bullets

Create stable issue IDs (`ISS-001`, ...). Each issue delivers the thinnest complete actor or business outcome through every required layer and is verifiable on its own. Fold enabling refactoring into the first slice that needs it unless the refactor has an independently verifiable safety outcome.

For each issue record:

- end-to-end behavior and actor outcome
- covered `REQ-*` and unchanged `AC-*` IDs
- inherited evidence, assumption, experiment-result, and decision IDs
- `Build` or `Bet` authorization; Bet issues inherit cap, expiry, measurement, rollback, and kill boundaries
- explicit exclusions, repository-grounded verification seam, and necessary blockers

**Complete when:** every issue is independently verifiable, no issue is merely a UI/API/database horizontal layer, and every blocker is necessary for its dependent outcome.

### 3. Validate coverage and dependencies

Check that:

- every in-scope `REQ-*` is covered by at least one issue
- every `AC-*` appears unchanged in the issue that verifies it
- no issue introduces behavior without a requirement and decision
- shared requirements have one owning issue and named consumers
- dependencies are acyclic and blockers precede dependents
- protected, out-of-scope, and deferred behavior remain preserved

Update the PRD's issue column when it is locally editable; otherwise hold the complete mapping in the issue index.

**Complete when:** the ledger has no orphan requirement or acceptance criterion, no untraceable issue behavior, and no dependency cycle.

### 4. Save the local issue package

Follow the repository's issue convention. If none exists, write:

```text
docs/issues/<prd-slug>/index.md
docs/issues/<prd-slug>/01-<issue-slug>.md
docs/issues/<prd-slug>/02-<issue-slug>.md
```

The local index and issue files are authoritative.

**Complete when:** the index and every issue file exist locally, all links resolve, and their IDs, authorization, and traceability match the coverage ledger.

### 5. Optionally publish

Create external tracker issues only when the user explicitly asks. Publish blockers first, preserve local IDs in external bodies, then write returned URLs or identifiers back to the local index and files.

**Complete when:** either no external action was requested, or every successful publication has a local-to-external mapping and failures remain visibly unpublished.

## Blocking Report Template

```md
# Issue Slicing Blocked: <source>

| Missing gate item | Source | Owner | Canonical disposition | Required action | Exit condition |
|---|---|---|---|---|---|
```

## Issue Index Template

```md
# Issue Plan: <PRD>

## Metadata
- Source PRD / version:
- Source disposition: Build | Bet
- External tracker: Not requested | <reference>

## Coverage And Order
| Order | Issue | Outcome | Requirements | Acceptance | Evidence / Bet | Decisions | Authorization | Blocked by | External ID |
|---:|---|---|---|---|---|---|---|---|---|
```

## Issue Template

```md
# ISS-001 — <Outcome-oriented title>

## Source And Traceability
- Source PRD / version:
- Requirements:
- Acceptance criteria:
- Evidence / assumptions / experiment results:
- Decisions:
- Authorization: Build | Bet

## Bet Boundaries
Omit for Build. For Bet: cap, expiry, measurement, rollback, and kill threshold inherited from the PRD.

## Outcome
<Actor-visible or business-visible result.>

## What To Build
<Narrow end-to-end behavior, including relevant alternate and error behavior.>

## Acceptance Criteria
- [ ] AC-... — <preserve source wording>

## Verification
- seam, observable result, and guardrails

## Out Of Scope
- ...

## Blocked By
- None | ISS-... — <reason>

## External Reference
- Not requested | <URL or ID>
```
