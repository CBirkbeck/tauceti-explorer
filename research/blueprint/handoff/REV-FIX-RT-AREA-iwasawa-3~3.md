# Handoff: REV-FIX-RT-AREA-iwasawa-3~3

Refs #5869. Codex (GPT-6), session `codex-dM5x45`, 11 October 2026.
Claim confirmed for comment 6106645781. Input revision:
`94ef4d10337ec4e58f86ed4804996b862b039b10`.
Branch: `codex-dM5x45-review-5869`. Exactly one job claimed.

**Blocked checkpoint: align the live issue and queue before reassigning.**
The live issue permits the review report and Motives packet/Lean pair.
The queue also requires the GH.0 and Kato packet/Lean pairs.
[WORKERS.md](../WORKERS.md) says: “Edit only the files the issue names,
plus your own scratch space.” I requested an explicit four-file scope
extension while completing the permitted review; none has been received.
Arithmetic owner files and their attributed reviews remain unchanged.
This repeats the dispatch obstruction of the previous checkpoint, but
makes two new, source-checked mathematical corrections in the allowed files.

## Completed permitted work

The [report](../reviews/REV-FIX-RT-AREA-iwasawa-3~3.md) independently records
all eight finding dispositions with fresh public source reads and locators,
checks the six affected Motives suppliers and their suggested forms, and
specifies the two arithmetic repairs. It distinguishes this bounded fix
review from the earlier exhaustive blueprint/reconstruction audits.

`PairDiagram.ProductCompatible` now agrees with MC.5's established HMS
B.14 degree convention: both inverse Künneth maps carry (-1)^(ij).
The de Rham wedge and singular product evaluation use the same sign;
their two factors cancel in the comparison coefficient. The formal-period
product and the supplied exterior/cross products remain unchanged.
The packet hypotheses/proof sketch agree with the typed contract.
`signs_cancel` and an odd-degree 2-by-3 example are proved, with the
latter distinguishing both an unsigned inverse map and a one-sided sign.
The existing E29 convention and boundary-product supplier gap remain.

The period-point statement now calls the complex map an evaluation,
explicitly leaving injectivity conjectural. One inherited future source
action that requested verbatim copying now requires exact own-word
conditions with theorem/page locators; its mathematical gap is retained.
No source passage or source excerpt field was added.

The canonical coefficient-map repair from the previous checkpoint is
retained: finite endomorphism restriction, the specified degree-zero
identification, the dual-colimit map fixed on every coefficient, induced
product/representation structures and the localization theorem using
that canonical ring map. Its proved compatibility/inverse/already-unit
examples and the noncanonical polynomial-to-Laurent counterexample remain.
The typed comparison, Tate rank-one/nonzero conditions, localization and
unique MC.6/PS.2 ownership boundaries also remain.

Top-level Motives verdict: `needs_changes`, with marker
`independent-review-REV-FIX-RT-AREA-iwasawa-3~3`. The complete preceding
algebraic-geometry review is appended unchanged to `reviewHistory`.
The relative Beck preservation adapter, typed reconstruction carriers,
fifteen API contracts and four theorem signatures remain separate revision
obligations. No implementation, accepted whole blueprint, closed stage
or completed source proof is claimed.

## Exact resumption work

1. Authorize these four additional deliverables, or align dispatch with the
   intended Motives-only scope before another worker claims this job:
   `research/blueprint/packets/GeneralizedHeegnerCycles--GH.0.json`,
   `research/blueprint/suggested/GeneralizedHeegnerCycles--GH.0.lean`,
   `research/blueprint/packets/KatoEulerSystems.json`,
   `research/blueprint/suggested/KatoEulerSystems.lean`.
2. With that scope, finish the arithmetic-owner independent review and
   archive their preceding reviews unchanged. Kato's
   `L1/hecke-and-diamond-equivariance-of-the-moment-map` must use r′−1,
   not r−1, in its Hecke statement and acceptance item 0. Lemma 8.8,
   p.185 has the prime. Keep central-diamond exponent k−2−2r.
   Add the source-specific transport check:
   −(r′−1)+(r′−1−r)=−r. At k=4,r=1,r′=2,ell=2 the correct coefficient
   is 1/2 and the incorrect one is 1. The current `chernHeckeDiamond`
   generic scalar parameter does not check this source instantiation.
   The following scalar tests were independently checked in scratch with
   `lean-check`, exit 0 and no warnings; they can be added under authorized
   scope (imports `Mathlib.Tactic.Ring` and `Mathlib.Tactic.NormNum`):

   ```lean
   example (r r' : ℤ) : -(r' - 1) + (r' - 1 - r) = -r := by ring
   example :
       (2 : ℚ) ^ (-(2 - 1) : ℤ) * (2 : ℚ) ^ (2 - 1 - 1 : ℤ) = 1 / 2 ∧
       (2 : ℚ) ^ (-(1 - 1) : ℤ) * (2 : ℚ) ^ (2 - 1 - 1 : ℤ) = 1 := by
     norm_num
   ```

3. In GH.1/p-adic-abel-jacobi-map, hypothesis 0 must independently require
   finite unramified F/Q_p and supplied smooth proper models of C and X_m.
   Record p∤cNd_K separately for BDP's canonical conductor application;
   it does not imply good reduction for arbitrary CM twists. The product
   supplier and Lean comments already distinguish the inputs; preserve
   positive and bad-twist tests. Read BDP §2.2, p.1060, §3.2, p.1067
   and Conrad appendix, pp.1139–1140.
4. Check the repaired owner packets and full suggested files, record this
   job's genuine independent verdicts, and run
   `issues.py:deliverables_complete`. A `needs_changes` verdict can
   finish a review. Do not change unreviewed markers to satisfy dispatch,
   drop outputs or claim that unrelated proofs were closed.
5. Separate authorized work must address the surviving reconstruction
   obligations. The reader refresh is also outside this live issue:
   synchronize canonical localization-map signatures, period-torsor
   witnesses, Tate rank-one/nonzero conditions, both Künneth signs,
   evaluation wording and the retained reconstruction verdict.

The report carries source URLs, hashes, exact locators and all needed
resumption details. No later worker needs this run's disposable scratch.

## Verification receipts

- `python3 scripts/check_blueprint.py
  research/blueprint/packets/MotivesAndAlgebraicCycles.json` with the pinned
  declaration index: exit 0; zero errors and warnings. 182 nodes,
  462 counted definition/construction API items, 259 tests, 47 planets,
  111 baseline declarations, 23 gaps and 16 requests; eight stages in scope,
  none closed. The new comparison-theorem API is also a typed declaration.
- `lean-check research/blueprint/suggested/MotivesAndAlgebraicCycles.lean`:
  exit 0; 816 warnings, all `declaration uses sorry`; no other diagnostics.
  Shared Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  Pinned Tau Ceti source tree: `f790474821cf4256814db967cb154e7af3d0c369`.
  Suggested SHA-256:
  `525a8746e61517959e489c459326ed40e4ea4256e1485f45dc522306c5520827`.
  The file imports individual Mathlib modules; this is elaboration of
  admitted signatures, not formalisation of the source results.
- Parsed preservation passes: only two named MC.6 node objects changed;
  every node id/prerequisite and all other nodes/fields remain. Only one
  gap's obsolete copying instruction changes; its obligation remains.
  Every old history entry and the immediately preceding review are retained.
  No source `excerpt`/`quote` field exists in the packet.
- Dispatch predicate remains false: GH.0 still names
  `independent-review-REV-GeneralizedHeegnerCycles--GH.0~2`; Kato names
  `independent-review-REV-KatoEulerSystems~2`.
- `git diff --check` and `intake.py check-files` pass for the four permitted
  changed paths (including this required handoff).

Current upstream ReductiveGroups and Completed/HodgeStructures READMEs,
relevant Suggested forms and the current known-Hopf Tannaka statement were
read without modification or builds. No restricted source was needed.
No manual merge, label change, issue closure or promotion was performed.
All Lean processes finish before submission. Scratch is deleted after
opening the PR; only these persistent source/validation/resumption notes
are required by the next worker.
