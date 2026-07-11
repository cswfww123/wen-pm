# WEN Layer Boundaries (PM)

## Composition contract: standalone **or** linked

`wen-pm` · `wen-engineering` · `wen-test` are **three independent packs**.

| Mode | Meaning |
| --- | --- |
| **Standalone** | Install and run only this pack. Skills must complete their job with inputs the user actually has — do not fail because another pack is missing. |
| **Linked** | When another pack is installed and the user routes across layers, hand off with durable artifacts (paths/IDs/versions), not chat paraphrase. |

```text
# full stack (optional)
wen-pm ──handoff──► wen-engineering ──build──► wen-test
   ▲                    │                         │
   └──── product rework ┘◄── defects ─────────────┘

# any layer alone is valid
wen-pm only          discovery → PRD / kill / pause
wen-engineering only settled AC → implement
wen-test only        given build+AC → test plan / QA
```

**No pack is a runtime dependency of another.** Companion names are recommendations when the team uses that pack — never hard imports.

## This pack owns

| Owns | Does not own |
| --- | --- |
| Product/market/need discovery; evidence ledger; Build/Bet; Product Delivery Contract (`to-prd`); UI contract + delivery pin; product `SCN` via `test-scenarios` | Shipping production code; eng implementation tickets; system `/to-test-plan` / `/qa-run` |
| Only automatic product front door: `/pm-intake` | A second product-map skill competing with intake |

## Two kinds of fog

| Fog | Route |
| --- | --- |
| Product fog | This pack (`/pm-intake` …) |
| Technical multi-session fog after product settled | Optional `wen-engineering` `/wayfinder` — not a PM map |

## Standalone PM

Valid without eng or test:

- intake → discovery / experiment / alignment → Build, Bet, Kill, Pause, …
- write `to-prd` + `test-scenarios` for humans or any downstream process
- stop after PRD if the team implements elsewhere

Do not invent code or system QA results here.

## Linked handoff (when engineering is used)

Emit development handoff only for canonical `Build` or complete bounded `Bet`.

Minimum package:

1. Disposition Build | complete Bet  
2. Problem, outcome, scope / out of scope  
3. `REQ-*` / `AC-*`  
4. Evidence or Bet `A-*` + authorizing `D-*`  
5. UI when visual: field/rule structure + **pinned** delivery design  
6. Product `SCN-*` when useful  
7. Non-goals / protected behavior  

Recommended spine when all three packs are in play:

```text
pm-intake → … → Build|Bet
  → to-prd → test-scenarios
  → (optional) wen-engineering: /to-spec → /to-tickets → /implement
  → (optional) wen-test: /to-test-plan → /qa-run
```

- `to-issues` — **optional** human board only  
- System QA is **`wen-test`**, not eng `/qa-run` (that skill moved)  
- If eng/test packs are absent, the same artifacts still hand to humans or other tools  

## Handback into PM

Accept returns when:

- implementation or QA shows intent was wrong / underspecified  
- UI fidelity failure is a **contract** error  
- “bug” is product rework without Expected  

Require: repo-backed Current, statements as `ST-*`, failing IDs — then `/pm-intake` on `existing-change`.

## Hard rules

- Statements and Decisions are not product evidence.  
- Code proves Current/feasibility, not correct need.  
- Screenshots without field/rule structure are not a UI contract.  
- Learning prototypes are not delivery pins.  
- Pure coding with settled AC should go to engineering (or the team’s coding process), not full PM discovery.  
- Never invent Build to “unblock” coding when gates fail.  
