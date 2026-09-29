# RT-AUDIT-07: fixes

Fixer: Claude Code, session `cc-f805bf`, 29 September 2026 (issue #4002, job FIX-RT-AUDIT-07).
- **Findings and verdicts.** `RT-AUDIT-07.result.json` and `RT-AUDIT-07.review.json`. The red team made 20 findings, and the review confirmed all 20.
- **Scope.** This job covers the 7 confirmed findings of high or medium severity: /1 and /2 (high), /3–/7 (medium). The 13 confirmed low-severity findings (/8–/20) are outside the fix job (PROTOCOL.md section 17).
- **Where the changes are.** Everything is in `research/blueprint/audit/AUDIT-07.result.json`; no other file changes. The audit's `review` object is unchanged.
- **Verdicts and library values.** One layer verdict changes: ArithmeticStatistics:ST.0 goes from `partly built` to `not built` (/1). Library values change only where a finding says so: ST.0 Northcott `both` → `partial`, DT.0 Weil heights `mathlib` → `partial`, ST.4 Mordell–Weil/Selmer finiteness `tauceti` → `partial`, SV.0 level of distribution `partial` → `absent`, SV.2 duality `absent` → `partial`.

**Verification.**
- I read every added declaration at Mathlib 082e2d3 / Tau Ceti f790474, at the stated file and line, and each one resolves in the pinned `declarations.tsv` under the stated full name. All lines given in the findings were correct; no line needed correcting.
- Every target has at most five declarations. Where a finding adds more, the displaced citations are named in the note with file and line.
- No `duplicates` entry is added: the one duplicate finding (/6) names a stage that is not in the atlas (see below).

## RT-AUDIT-07/1 (high, library-claim): Northcott for the stage's families is absent (ST.0)

**Target "Finiteness at bounded height (Northcott property) before forming densities".**
- **Library value.** `both` → `partial`.
- **Fits.** `NumberField.finite_setOfPred_mulHeight₁_le` (Height/NumberField.lean:411) and `NumberField.finite_of_discr_bdd` (Discriminant/Basic.lean:496) go from `exact` to `special case`, as the finding asks. For consistency I also changed Tau Ceti's explicit Hermite count `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le` (HermiteCount/Basic.lean:172) from `exact` to `special case`: the finding's reason (it counts number fields, not curves or forms) applies to it equally.
- **Note.** Replaced by the finding's text, with the review's correction: the quartic-form statement is restricted to forms with (I,J) ≠ (0,0), and the note says why the restriction is needed (the forms nX⁴ all have I = J = 0 and lie in infinitely many GL₂(ℤ)-classes). As the review asks, curve finiteness stays with the existing owner, Tau Ceti's EllipticCurves Layer 8, on the minimal-pair model.

**Layer verdict.** ST.0 goes from `partly built` to `not built`. I checked that this was ST.0's only target with a present library value; the other five are `partial` or `absent`.

## RT-AUDIT-07/2 (high, library-claim): only relative Weil heights exist (DT.0, summary)

**Target "Weil heights of algebraic numbers and points…".**
- **Library value.** `mathlib` → `partial`.
- **Fit changed.** `NumberField.absMulHeight₁` (Height/NumberField.lean:137) goes from `exact` to `related`.
- **Citations added.** `NumberField.finite_setOfPred_mulHeight₁_le` (Height/NumberField.lean:411) and `Projectivization.mulHeight` (Height/Projectivization.lean:46), both special case.
- **Citations displaced into the note.** The finding adds three citations to a target that already had five. To stay within five, I kept `Height.mulHeight₁`, `absMulHeight₁`, `Rat.mulHeight₁_eq_max` and the two new special-case citations. These are named in the note with file and line:
  - `Height.mulHeight` (Height/Basic.lean:233), the tuple height that `Projectivization.mulHeight` descends;
  - `NumberField.instAdmissibleAbsValues` (Height/NumberField.lean:78);
  - the finding's third addition, `Polynomial.finite_mahlerMeasure_le` (MahlerMeasure.lean:107). It is only `related`, and the note already discusses it.
- **Note.** Replaced by the finding's text. Following the review, the note keeps the product-formula instance and the rational formula, and it separates relative projective heights from absolute heights and their extension invariance.

**Summary.** "Weil heights with the product formula and Northcott" becomes "relative Weil heights over a number field with the product formula and fixed-field Northcott". "Extension-invariance of the absolute height and absolute heights of points" is added at the head of the missing list.

**Layer verdict.** DT.0 stays `partly built`, because three other DT.0 targets are still `mathlib`.

## RT-AUDIT-07/3 (medium, library-claim): finiteness of Sel₂ is not proved (ST.4, summary)

- **Target "Weak Mordell-Weil and Mordell-Weil over number fields; finiteness of the Selmer-type groups".** The library value goes from `tauceti` to `partial`. The finding's sentence is appended to the note: finiteness of Sel₂ is absent, and Tau Ceti's EllipticCurves Layer 7 owns it. Following the review, nothing is planned for it in ArithmeticStatistics.
- **Target "Rank bound from the Selmer group…".** The note is replaced by the finding's text. The bound is proved for every finite S that contains im μ, and it reaches Sel₂ only once `Finite (selmerGroup₂ R Loc)` is proved. The library value stays `tauceti`.
- **Summary.** "and the rank bound 2^r * #E(K)[2] <= #Sel" is replaced by the finding's text, with the rank bound stated for any finite S that contains the descent image. It adds that finiteness of Sel₂ itself is not proved.
- **Layer verdict.** ST.4 stays `partly built`, because its 2-Selmer-group definition target is still `tauceti`.

## RT-AUDIT-07/4 (medium, library-claim): SelbergSieve's level is unused (SV.0)

In the target "Level of distribution: control of sum_{d <= D} |R_d|":
- **Library value.** `partial` → `absent`.
- **Citations.** `SelbergSieve` stays, as `related`. `BoundingSieve.errSum` (SelbergSieve.lean:177) is added as `related`. As the review says, it is the weighted divisor remainder sum, not a level-of-distribution hypothesis.
- **Note.** Replaced by the finding's text.
- **Layer verdict.** SV.0 stays `partly built` (its sieve-data target is `mathlib`).

## RT-AUDIT-07/5 (medium, library-claim): the duality principle in operator form (SV.2)

In the target "Duality principle for bilinear forms":
- **Library value.** `absent` → `partial`.
- **Fit changed.** `Matrix.l2_opNorm_conjTranspose` (CStarAlgebra/Matrix.lean:204) goes from `related` to `more general`.
- **Citations added.** `ContinuousLinearMap.adjoint` (InnerProductSpace/Adjoint.lean:114, more general) and `Matrix.l2_opNorm_mulVec` (CStarAlgebra/Matrix.lean:222, related).
- **Note.** Replaced by the finding's text, with the review's additions:
  - the norm is the scoped `Matrix.Norms.L2Operator` norm;
  - the missing adapter should state an explicit nonnegative constant D, with the Euclidean norm and the conjugate transpose, not an entrywise matrix norm;
  - the large-sieve matrix and its inequalities remain to be instantiated.
- **Layer verdict.** SV.2 stays `partly built`.

## RT-AUDIT-07/6 (medium, duplicate): the LV.6 S-unit theorem (DT.2); no `duplicates` entry

The review confirms the overlap and asks for the LV.6 cross-reference. I did not add it as a `duplicates` entry:
- **The entry would be dropped.** MordellLawrenceVenkatesh is a draft roadmap (`research/blueprint/roadmaps/MordellLawrenceVenkatesh.json`, `status: draft`, review `needs_changes`). Neither `data/atlas.json` nor `research/blueprint/atlas/roadmaps/` has it. `scripts/merge_library_audit.py` keeps a `duplicates` entry only if its layer is an atlas stage (`d.get("layer") in stage_ids`). This is the same situation as RT-AUDIT-09/5, /7 and /8.

**What I changed instead.** The cross-reference is recorded in the note of DT.2's target "S-unit equations: finiteness of solutions of x + y = 1…", which does reach the merged coverage. The note says three things:
- the draft LV roadmap plans the two-variable case at LV.6 (Lawrence–Venkatesh Theorem 4.1) by the p-adic period-map method;
- the statement should be shared;
- as the review cautions, the shared statement is not the higher-variable nondegenerate case.

The library value (`partial`) and the verdict (`not built`) are unchanged.

**For the maintainer.** When MordellLawrenceVenkatesh is promoted into the atlas, add `{"layer": "MordellLawrenceVenkatesh:LV.6"}` to DT.2's duplicates. Its note should say that LV.6 proves the two-variable S-unit theorem by an independent proof, and that the statement should be shared. Alternatively, the LV revision can have LV.6 import DT.2's statement of the two-variable unit equation (PROTOCOL.md section 15).

## RT-AUDIT-07/7 (medium, library-claim): Tau Ceti's empirical measures (PM.2, PM.0)

**PM.2 target "Weyl's criterion for uniform distribution modulo 1".**
- **Citation added.** `TauCeti.Probability.empiricalMeasure` (Probability/Process/EmpiricalMeasure.lean:128, related).
- **Note.** Replaced by the finding's text, with the review's qualifications:
  - it keeps that no equidistribution predicate exists;
  - it notes that `empiricalMeasure x n` uses the first n + 1 terms;
  - it says the conditionally i.i.d. theorem does not give deterministic arithmetic equidistribution.
- **Named in the note.** That theorem, `TauCeti.Probability.ConditionallyIIDWith.tendsto_empiricalMeasure_ae` (ConditionallyIID/WeakConvergence.lean:75), is named by file and line. The finding cites it only in its evidence.
- **Library value and verdict.** Stays `absent`; PM.2 stays `not built`.

**PM.0 target "Weak convergence and the link from counting limits…".**
- **Citation added.** `TauCeti.Probability.empiricalMeasureOfFintype_eq_map_uniformOn` (EmpiricalMeasure.lean:80, related).
- **Note.** The finding's sentence is appended.
- **Library value.** Stays `partial`.

## Checks

- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-07.result.json research/blueprint/redteam/RT-AUDIT-07.fixes.md`: 0 problems.
- Every declaration cited in the file, including the six added, resolves in the pinned `declarations.tsv` as (library, name, file, line).
- Every text substitution was asserted to match exactly once, and every edited target was located by a unique prefix. Every target has at most five declarations, and the `review` object is byte-identical. The diff touches only the nine targets, the two roadmap summaries and the ST.0 verdict named above.
- No Lean file is involved, so nothing was compiled.
