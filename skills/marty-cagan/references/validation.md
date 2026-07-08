# Marty Cagan Perspective Skill Validation

Validation date: 2026-06-29

## Phase 4.1 Known-Position Sanity Checks

### Test 1: "PM should own the roadmap and write detailed PRDs so engineering can execute."

Expected Cagan-compatible stance:
- Reject PM as roadmap/PRD administrator.
- Reframe PM contribution around value, viability, discovery, and empowered cross-functional teams.

Skill behavior:
- The SKILL.md explicitly rejects PRD as a substitute for discovery.
- It says PM is not the sole decider/project manager/requirements clerk and is accountable for value and viability.

Verdict: PASS.

### Test 2: "A customer asked for this feature, so we should build it."

Expected Cagan-compatible stance:
- Customer requests are input, not strategy.
- Ask what problem exists, what alternatives users use, and whether the solution wins.

Skill behavior:
- Decision heuristic 6 says not to treat user requests as needs.
- Workflow forces Customer Value and Market / Switching investigation.

Verdict: PASS.

### Test 3: "AI can now write specs and user stories, so PM work is easier."

Expected Cagan-compatible stance:
- AI can accelerate output, but fake PMs will produce more theater.
- Strong PMs use AI to build-to-learn and sharpen discovery.

Skill behavior:
- Mental model 6 directly covers AI amplifying true/false PM differences.
- Workflow requires AI use to verify assumptions, not expand unverified ideas.

Verdict: PASS.

## Phase 4.2 Edge Case Test

Prompt: "Should I build a personal AI chief-of-staff app for founders?"

Expected behavior:
- Do not confidently approve or reject without current market and user research.
- Use Cagan framework to list dangerous assumptions and discovery plan.

Skill behavior:
- Classifies as fact-dependent / idea judgment.
- Requires research into specific users, alternatives, switching behavior, business viability, feasibility, and experiments.
- Verdict vocabulary includes Kill / Pause / Prototype / Discovery Sprint / Build instead of automatic encouragement.

Verdict: PASS.

### Test 4: "帮我优化现有后台系统。"

Expected behavior:
- Do not suggest redesigns from taste.
- Ask for current system evidence: user paths, screenshots/flows, metrics, feedback, errors, constraints, prior attempts.
- Only after evidence is sufficient, rank opportunities and propose fixes with metrics.

Skill behavior:
- Step 0 blocks final judgment without an evidence docket.
- The "当用户要求优化现有系统" branch requires system goal, user path, data, feedback, constraints, and history.
- Output requires System Fix only after evidence review.

Verdict: PASS.

### Test 5: "帮我做未来半年产品路线图。"

Expected behavior:
- Do not invent a roadmap.
- Ask for strategy, north-star/current metrics, user segments, market facts, resource constraints, and historical tradeoffs.
- Produce Now / Next / Later only after evidence exists.

Skill behavior:
- Step 0 requires roadmap evidence.
- The "当用户要求未来规划" branch blocks wish-list planning and asks for strategy/data/constraints.
- Output requires opportunity tree, tradeoff principles, risk register, and review cadence.

Verdict: PASS.

## Phase 4.3 Voice Check

Target style:
- Direct, diagnostic, structured, harsh on ideas but not personally abusive.
- Chinese "毒舌 PM" adaptation should be surgical, not performative.

Sample output style from Skill:

> 这还不是产品想法。现在它只是一个披着愿景外套的功能冲动。

Assessment:
- Distinct from generic ChatGPT encouragement.
- Captures product-theater critique.
- Boundaries prevent personal attack.

Verdict: PASS.

## Phase 5 Dual-Agent Refinement Summary

### Agent A: Auto-Skill-Optimizer View

Findings:
- Strongest dimension: activation-to-action workflow. The skill does not stop at personality; it routes user ideas into risk assessment and specialist investigation.
- Weakest risk: it could become too negative if the user brings a genuinely promising idea.
- Applied mitigation: added "当用户给出可行苗头" path with Discovery Sprint specialist dispatch.

### Agent B: Skill-Creator View

Findings:
- Trigger coverage is broad enough for "资深PM", "毒舌PM", "产品审判", "Marty Cagan", "SVPG", and idea validation prompts.
- Role safety is clear: attack idea, not person.
- Missing risk was unclear source boundary for living-person voice.
- Applied mitigation: first-activation disclaimer says this is a public-methodology distillation, not the person's actual opinion.

## Automated Quality Check

Command:

```bash
python3 .claude/skills/marty-cagan-perspective/scripts/quality_check.py .claude/skills/marty-cagan-perspective/SKILL.md
```

Result:

- 心智模型数量: PASS, 6 models.
- 模型局限性: PASS.
- 表达DNA辨识度: PASS.
- 诚实边界: PASS, 6 items.
- 内在张力: PASS, 7 markers.
- 一手来源占比: PASS / skipped by script due source-marker parser limitation.

Overall verdict: READY.

## 2026-06-29 Evidence Docket Revision

Change:
- Added `证据案卷` as the leading word and blocking gate.
- Expanded scope from idea judgment to existing-system optimization and future planning.
- Required user-provided evidence before final product judgments.

Reason:
- A senior PM should not only follow ideas; they should audit existing systems, plan future bets, and make every decision from evidence.
- Without this gate, the skill could prematurely complete by offering polished but unsupported PM advice.

Validation:
- Automated quality check still passes 6/6.
- Key evidence-gate phrases are present in frontmatter, role rules, Step 0, task classification, output requirements, system optimization branch, and roadmap branch.
