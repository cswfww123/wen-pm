# New Idea Branch

Use this branch when there is no current product behavior to preserve or change. The goal is to find the cheapest evidence that kills, reshapes, or earns further investment in the idea.

## Dossier Fields

Populate every field with canonical record IDs or `Unresolved`:

1. **Target segment**: a specific role or group, context, trigger, frequency, constraints, access path, and excluded segments. “Everyone” is unresolved.
2. **Past behavior**: the last real occurrence, actions taken, sequence, frequency, and observable consequence. Future intention is not past behavior. Self-reported behavior remains a `Stakeholder Statement`; direct observation or measurement may qualify as an `Observed Fact` under the canonical gate.
3. **Current alternative**: tool, workaround, manual service, competitor, avoidance, or doing nothing; include why it is tolerated.
4. **Pain evidence**: observed loss of time, money, revenue, safety, compliance, status, trust, or opportunity; include frequency and severity.
5. **Switching evidence**: prior search, trial, migration, workaround, approval, workflow change, or abandonment; include switching cost and inertia.
6. **Payment or commitment evidence**: money, signed approval, reserved budget, time, data, reputation, access, or another costly action already committed. A self-report remains `ST-*`; a traceable transaction or directly observed commitment may qualify as `EV-*`. Compliments and stated willingness are not commitment.
7. **Desired outcome**: measurable behavior or result, not a feature description.
8. **Assumptions**: segment, problem, value, usability, feasibility, viability, channel, and switching claims; identify the single most dangerous unsupported assumption.
9. **Constraints and four risks**: user environment, trust, behavior change, data/technology, operations, sales, finance, legal, support, and strategic fit.
10. **Success and kill measures**: observable outcomes and thresholds that distinguish continuation from stopping.

## Customer Discovery

Customer discovery seeks behavior, not approval. Ask one neutral question about one past event:

- “Tell me about the last time this happened.”
- “What did you do next?”
- “What did that cost or prevent?”
- “What alternatives did you try before settling on this?”
- “What did you commit to changing or paying for?”

Do not reveal the proposed product, recommendation, preferred answer, experiment threshold, or assessment while collecting behavior. Treat hypotheticals, feature requests, compliments, and willingness claims as assumptions unless accompanied by a costly past action.

Decision-alignment may instead expose the evidence, candidate interpretation, and recommendation to settle target strategy, constraints, or an authorized bet; record those outcomes as decisions, not customer evidence.

## Experiment Contract

Before routing to an experiment, specify all of:

- Assumption `A-*` and risk it addresses.
- Target segment and recruiting/traffic source.
- Method and exact behavior observed.
- Sample or exposure target.
- `Success` (canonical pass): a numeric or otherwise unambiguous threshold that earns the next investment.
- `Kill` (canonical fail): a non-overlapping threshold that stops or materially changes the bet.
- `Inconclusive`: the band between them, plus the one follow-up action allowed.
- Timebox, owner, cost cap, source artifact, and the planned `X-*` evidence-record update.

Thresholds must be declared before results are seen. Success updates the ledger; it does not automatically authorize Build. A result outside the sample, segment, or method contract is inconclusive rather than convenient evidence.

## Question Priority

Ask in this order unless a higher four-risk item can kill the idea sooner:

1. Target segment and last real occurrence.
2. Current alternative and why it persists.
3. Pain frequency, severity, and consequence.
4. Search, switching, payment, or other costly commitment behavior.
5. Desired outcome and dangerous assumptions.
6. Usability, feasibility, and viability constraints.
7. Success, kill, and inconclusive thresholds for the cheapest next test.

## Branch Gate

The branch is ready to stop grilling only when:

- The target segment and excluded segments are explicit.
- Past behavior, alternative, and pain records are source-located and not future claims.
- Switching and payment/commitment evidence are present, explicitly absent, or assigned to one bounded experiment.
- The most dangerous assumption is named and linked to a four-risk item.
- Any experiment route has complete, predeclared success, kill, and inconclusive thresholds.
- Every material unknown is either capable of killing the bet, owned by one next action, or accepted through the canonical `Bet` gate.

If a kill threshold is met, choose `Kill`. Use `Pause` only for a named dependency with an owner and observable resume condition. Use `Discovery` for an unknown that can be investigated now, and `Experiment` only after its complete contract is predeclared. Otherwise route exactly one highest-risk gap under the canonical gate it satisfies.
