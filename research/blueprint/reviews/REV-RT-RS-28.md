# REV-RT-RS-28 — verification of the red-team findings on RS-28

**Verdict: four findings confirmed, one rejected.**

- **Confirmed:** /2 (high), /3 and /4 (medium), /5 (low).
- **Rejected:** /1. What it calls a cycle is a mutual dependency between two roadmaps. The protocol does not forbid that,
  and the atlas already has 73 such pairs.
- **The fixes** of the confirmed findings are right, with one precision on /4.

- **Verifier:** Claude Code, session `cc-2aeb03`, 24 September 2026 (issue #1624).
- **Independence:** this verifier took no part in any of the three jobs:
  - the red team, RT-RS-28 (Claude Code, `cc-7b31c4`, #2777);
  - the proposal RS-28 (Codex, `codex-c83e7a`);
  - its review, REV-RS-28 (Codex, `codex-a71f92`).
- **What was checked:**
  - `research/blueprint/restructure/RS-28.json`, `RS-28.result.json` and `RS-28.md`;
  - RS-04, whose family contains FunctionFieldArithmetic;
  - the stage texts in `data/atlas.json`;
  - the duplicate records in `data/library-coverage.json`;
  - `scripts/restructure.py` and `scripts/blueprints.py`.

  Reachability was computed over the atlas stage edges together with RS-28's 59 links, for each cycle question.

`python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-28.review.json` reports `ok`.

## /1 (error, high): rejected

- **The protocol's rule is about stages and nodes.** PROTOCOL §3 and §10 require the node graph and the stage links to be
  acyclic. The finding itself says RS-28 keeps the stage graph acyclic, and the reachability check confirms it.
- **What RS-28 creates is a mutual dependency at roadmap level.** FunctionFieldArithmetic and
  HigherLocalFieldsAndHigherClassFieldTheory each list the other. The atlas already has 73 such pairs, for example
  AInfCohomology ↔ CrystallineCohomology and ArithmeticGaloisDuality ↔ SelmerIwasawaCohomology.
- **The finding's consequence does not follow.** It says "neither can be built before the other", but roadmaps are built
  stage by stage.
- **The substance is handled under /2.** The questionable link, HL.3 → FA.4, comes from the ownership transfer in owners
  row 16. /2's fix removes that link, and with it the mutual listing.

## /2 (duplicate, high): confirmed

- **FunctionFieldArithmetic is outside the family.** RS-28's members are HigherLocalFieldsAndHigherClassFieldTheory alone,
  and its anchor is Tau Ceti's ClassFieldTheory.
- **Yet RS-28 reassigns FA.4's mathematics.** It names FA.4 under "formerly" in owners rows 13–15. In row 16 it moves
  equal-characteristic p-primary local existence from FA.4 to HL.3.
- **Nothing applies the move.** RS-28 has no layer entry for FA.4, and §15 says an unlisted layer keeps its place. Also,
  `scripts/restructure.py` never reads `owners`. So FA.4's description still plans the local theory, and that mathematics
  ends with two owners.
- **RS-04 conflicts with it.** RS-04's family does contain FunctionFieldArithmetic, and it assigns full equal-characteristic
  p-primary reciprocity to FA.4. RS-04 is not yet reviewed, so this is a conflict with a pending proposal.
- **The fix is right.** Keep rows 13–15 as records of overlap only; drop row 16 and the link HL.3 → FA.4; and add a link
  FA.4 → HL.3. That link creates no cycle.

## /3 (duplicate, medium): confirmed

- **The audit records the overlap from both sides.** HL.2's wild coefficients overlap KTheoryFiniteLocalFields:L.5, which,
  by its own stage text, "own[s] the logarithmic/DVR comparison".
- **RS-28 never mentions L.5.** It mentions only L.3, in links to HL.4 and HL.7. Meanwhile HL.2 still keeps the
  logarithmic coefficient interfaces.
- **The fix is right.** Add an owners row, L.5 in HL.2's `suppliedBy`, and a link L.5 → HL.2, which is acyclic. Then narrow
  HL.2's `keeps`.

## /4 (error, medium): confirmed, with one precision

- **M.5d excludes the theorem.** It reads: "Keep the residue-characteristic Bloch–Gabber–Kato differential theorem separate".
  M.5 calls it a separate statement too.
- **No stage owns it.** Bloch–Gabber–Kato occurs only in M.5 and M.5d. So the theorem RS-28 attaches to M.5d has no
  supplier.
- **The fix is right:** narrow owners row 12 to what M.5d owns, and name a supplier.
- **The precision.** L.5 owns the logarithmic/DVR de Rham–Witt comparison, which is an input to the Bloch–Gabber–Kato
  identification K^M_n(F)/p^r ≅ W_rΩ^n_{F,log}, not the identification itself. So the theorem should be a request against
  the layer chosen to own it: L.5 widened, or a new layer. L.5 should not be treated as already owning it.

## /5 (other, low): confirmed

- **The build sorts prerequisites.** `scripts/blueprints.py` (line 57) sorts them alphabetically, so the base cannot come
  "first".
- **RS-28 does record the base correctly,** through `extends`.
- **The fix is right:** restate the claim as the declared base.

## For the orchestrator

- **One fix job.** The confirmed high and medium findings /2, /3 and /4 become FIX-RT-RS-28.
- **Reconcile before RS-04 is applied.** /2's fix leaves equal-characteristic p-primary local existence with FA.4, which
  agrees with RS-04. RS-04 should still be reconciled with RS-28's owners rows 13–15 before it is applied.
