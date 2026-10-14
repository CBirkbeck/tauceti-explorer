# REV-PKG-WeightZeroCrystallineAutomorphyLifting — handoff

Refs #9241. Codex, session `codex-C6AWJd`, 2026-10-14. Independent of the package author
Claude `claude-Kdsiuy` (PR #9624). One completed fixing review; no second job claimed.

## Done

Applied corrections in the package README and brought Suggested.lean into the required upstream
form. Wrote review.json with verdict **needs_changes** and the full report
[REV-PKG-WeightZeroCrystallineAutomorphyLifting.md](../reviews/REV-PKG-WeightZeroCrystallineAutomorphyLifting.md).
All 30 package targets and all accepted-plan names (21 targets, 31 API items, 30 tests) remain.
No packet or another roadmap's package was edited. Metadata remains `math.NT`.

The report records the 15-source deterministic sample, all author-flagged inputs and seven source
corrections, a mandatory adversarial row for every target, convention and denominator witnesses,
ten Lean signature comparisons, and the audit of current upstream/library work. All sources read
were public papers or Stacks; nothing from a restricted book was needed or copied.

The substantive repairs are the full-GL framing/determinant distinction; invalid prepared examples;
rank-two crystalline component hypotheses; the opposite Hodge–Tate signs of the local suppliers;
selected-block eigenspaces and Hecke normalizations; prime-to-p Iwahori kernels versus pro-v
radicals; repeated tame characters and zero resultants;
conjugation-stable excluded places without changing framings; uniform nilpotence interfaces;
adequate counts; and the common-unramified argument using repeated preparation and finite inertia.
Thorne's arXiv v1 page locators are corrected. Read the report for hypotheses and exact tests.

## Resume at the supplier contracts

The README's `Unfilled supplier contracts` and the report's G1–G4 table state the complete inputs.
They are mathematical obligations, not Lean placeholders:

1. **WeightZeroCrystallineLiftingRings** must own BCGNT Theorem 2.5.5, p. 29: generically reduced
   special fibres for arbitrary K/Q_p and rank n with p>n, including coefficient compatibility.
   There is no allocated layer/accepted plan for the designated sibling here. The accepted plan
   requires keeping this theorem in that sibling; do not replace it by a rank-two theorem.
2. **CrystallineLocalGlobalCompatibilityCM** must state the away-p twist and selected-block
   Taylor–Wiles extension of §7.5: O[Δ_Q]-linear derived Hecke images and one nilpotence exponent
   independent of the twist, coefficient depth and level. Its present V_λ statement is weaker.
3. A **torsion comparison owner** must supply ACC Theorems 2.3.5/2.3.7 and 3.1.1 for these
   coefficients/levels, with simultaneous inertial conditions and unramifiedness at S^c∖S.
   AG2.5's characteristic-zero Varma comparison does not supply this input.
4. The **local-ring supplier** must give finite-type models or directly prove geometric component
   stabilization for the required local lifting rings and their special fibres. BLGHT Lemma
   3.3(8)–(9), pp. 48–49, has finite-type hypotheses; LGDR §3.7 gives coefficient compatibility
   but does not prove stabilization.

The accepted DDPA R03.1/P8/P9, PA Part II PL.1 and PadicHodgeTheory R06.2 nodes remain named supplier
obligations. Those packages and an explicit ordering for the weight-zero siblings are delivery
prerequisites. Their absent package directories alone are not additional unsourced theorems.
When exact contracts exist, replace the conditional-input statements with layer/declaration
citations and repeat the interface checks before upstream readiness.

## Duplication and removals

Current Tau Ceti was checked at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, together with every
current upstream roadmap, the nine newer roadmaps and Completed material. The new
`AlgebraicGeometry.Scheme.Hom.maximal_base_eq_closedPoint_iff` in
`TauCeti/AlgebraicGeometry/SpecialFiber/Components.lean` provides component/codimension geometry
on an integral scheme. It does not give the possibly reducible local DVR/unique-generalization
statement or transport between two lifting rings. The boundary now cites it and distinguishes the
retained targets. **Full target removals: none.** No existing upstream objects were re-planned.

## Validation

- Final 150-line Suggested.lean: `lean-check` exit 0, fourteen warnings, all admitted-proof warnings,
  no errors or other warnings. Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174`; the file
  imports only Mathlib. Before this run 111 GB memory was available. No build/cache/LSP was used.
- `scripts/check_sorry_data.py`: no offenders; four real-bodied definitions, three theorem
  signatures, eleven examples. All README-only definitions are listed in the closing comment.
- `research/blueprint/intake.py check-files`: 0 problems on the changed deliverables and metadata.
- Inherited plan `scripts/check_blueprint.py`: 0 errors, 0 warnings; 21 nodes, 31 API items,
  30 tests. Its 28 gaps and 20 requests remain and were not declared closed.
- All plan names present; every definition/construction has at least three discriminating Check
  bullets; package has no process identifiers or private paths; `git diff --check` clean.

No scratch source file is needed for resumption. The report and package identify public source
versions and exact page locators; the run's scratch downloads and logs are deleted after submission.
