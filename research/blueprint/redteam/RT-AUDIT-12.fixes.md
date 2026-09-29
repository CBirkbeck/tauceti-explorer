# RT-AUDIT-12: fixes

Fixer: Claude Code, session `cc-39fac3`, 29 September 2026 (issue #4007, job FIX-RT-AUDIT-12).
- Findings: `RT-AUDIT-12.result.json`.
- Verdicts: `RT-AUDIT-12.review.json`.
- 35 findings: 31 confirmed, 4 rejected (/4, /5, /29, /32).

The only edited deliverable is `research/blueprint/audit/AUDIT-12.result.json`. The orchestrator merges audit fixes into the library audit (PROTOCOL.md §17).

**How the fixes were applied.**
- Where a review amended the red team's fix, the amended form was applied; each case is marked below.
- Every added declaration was checked against the pinned trees (Mathlib `082e2d3`, Tau Ceti `f790474`, via the local baseline copies and their declaration index): name, file and line.
- Auto-generated instance names are the red team's, confirmed by the instance at the cited line (for example `instHasLimitsOfShapeGrp`, GrpLimits.lean:52; `Proj.instIsProper…`, Proper.lean:372).
- Only two target statuses changed, both as confirmed findings require (/3 and /12, absent → partial). No layer verdict changed. Two targets were added (/2, /26).

## Confirmed findings

**/1 (0B kernels).** Cited `instHasLimitsOfShapeGrp`, `instCartesianMonoidalCategoryOverScheme`, `Over.instBraidedPullback`, `baseChangePointMulEquiv` and `baseChangePointMulEquiv_pointMap`, all as related, per the review.
- The note now says kernels over any base exist as pullbacks along the unit in Grp (Over S), and that none of this makes a kernel finite locally free. What is missing is a named kernel with a stated base-change isomorphism.
- In the Layer 0 "0B" summary, the stale "non-affine base" item is replaced by the precise missing list.

**/2 (0B, new target).** The cancellation lemma for local finite presentation is added as a partial target. Following the review:
- it cites `RingHom.FinitePresentation.of_comp_finiteType` and Mathlib's monomorphism postcomposition instance (MorphismProperty/Limits.lean:277);
- it does not cite `locallyOfFiniteType_of_comp`, which proves a different property;
- it records that the roadmap's attribution to "Mathlib's cancellation lemma" needs a maintainer correction.

**/3 (0D transport).** The status goes from absent to partial, citing `Equivalence.mapGrp`, `Equivalence.mapCommGrp` and `Functor.Monoidal.ofChosenFiniteProducts`. The concrete equivalence and the transport of pairings stay missing.

**/6.** ReductiveGroups Layer 0 is added to the 0B and Layer 0 duplicates, as shared completed work.

**/7.** `sigmaSpec` and its finite-index isomorphism instance are cited. The note separates the affine coproduct identification, obtainable by composition, from the general-base construction that is still missing.

**/8.** The affine spreading-out ingredients are cited: `tensorModelOfHasCoeffsEquiv`, and `Smooth`/`Etale.exists_subalgebra_fg`. Per the review, the note says these hold relative to the ground ring, with ℤ by specialisation. The 0E summary is corrected.

**/9.** `IsFiniteSplit.exists_tensorProduct_of_etale` and `algHomEquivPrimeSpectrum` are added to the fibre-count target, and the first also to the descent target. The note records the review's caveat that the rank comparison is still needed.

**/10.** Tau Ceti's `InvertibleSheaf` and `SheafOfModules.isInvertible` are cited. The note names the missing bridge from ideal sheaves to that carrier. The target stays absent.

**/11.** The Galois-descent lemmas (`span_invariants_eq_top`, `liftBaseChange_injective_of_invariant`) are added as related, not "special case", per the review. The note says they are not general fpqc descent of affine schemes.

**/12 (1C).** The status goes from absent to partial, citing the equation, nonsingularity and point-equivalence declarations with their scope: any commutative ring for the equations; over a field, and in the stated direction, for points. The invariant-differential law and the projective classification stay missing.

**/13 (2D).** The target stays absent. `CommRing.Pic`, `Pic.mapAlgebra` and `Pic.functor` are cited, and "no absolute Picard functor" is corrected. Per the review:
- Tau Ceti's existing non-affine `LineBundleClass` statement is kept, so the fix's phrase "neither library has Pic of a non-affine scheme" is not used;
- the note warns that Mathlib's `relPic` is not the relative quotient.

**/14 (2A).** The isogeny intermediate-ring theorems (finiteness, rank, projectivity, Σ e·f) and Dedekind torsion-free flatness are cited. Per the review, the note keeps their hypotheses and denies both unconditional projectivity and the full curve theorem.

**/15.** EllipticCurves Layers 5 and 1 are added as duplicates of 1C and of the Layer 1 umbrella, restricted to the shared field case, per the review.

**/16.** PELModuli:M2 and R09.5 are added as 2F duplicates, scoped to the full-level rigidity assertion; the semi-Borel threshold is excluded.

**/17.** Per the review's chosen alternative, the JacobianChallenge C duplicate entries are removed from 1C and the Layer 1 umbrella. The supplier dependency is recorded in 1C's cohomology target note.

**/18 (2E).** `Divisor.eval` and the disjoint-support moving lemma are cited. The note says three of the five inputs exist, at the function-field level, and states their admissibility hypotheses. Reciprocity and the pairing stay absent.

**/19 (2F).** `frobeniusTrace`, `degree_frobeniusIsogeny` and `degree_oneSubFrobeniusIsogeny_eq_pointCount` are cited. The note credits only the finite-field Frobenius case, not a general trace API.

**/20 (2F).** The rigidity note now states the integral-domain scope of `autGroupMulEquiv` and the dichotomy lemma (newly cited), and keeps the missing torsion rigidity and exceptional j.

**/21 (1C).** `Place.exists_poles_eq_natCast_zsmul_ofPoint` is cited. The note says the coordinates x and y exist over a field, with the IsIntegrallyClosedIn and n ≥ 2g hypotheses, but the pole-order-six relation does not. The target stays absent.

**/22 (1B).**
- The local-ring target cites `CommRing.Pic` and `Pic.mk_eq_one_iff_free`, and mentions the local and semilocal triviality instances.
- The field target cites `pointCount` and the singular-point comparison. The note distinguishes pointCount from Affine.Point, per the review.

**/23 (2B).** `ClassGroup.relNorm` and `ClassGroup.equivPic` are cited. Per the review, the "tower/base-change law" overstatement is omitted. The target stays absent.

**/24 (4D).** The tangent-space coheight theorem and polynomial regularity are cited. The scheme-level gaps are kept.

**/25 (4B).** `Universal.specialize` and `map_specialize` are cited. The discriminant inversion and its universal property stay missing.

**/26 (Layer 10, new target).** The projective j-line ℙ¹_j with its chart and infinity section is added as a partial target, citing `MvPolynomial.gradedAlgebra`, `Proj.awayι`, `Proj.affineOpenCover`, the properness instance and `AffineSpace`. The missing identifications are named.

**/27.** ModularCurvesPartII:R14.1 is added as a duplicate of Layer 10 and of 9B, for the diamond action only. Per the review, the speculative w_N clause is dropped and RS-06's ownership boundaries are kept.

**/28 (7C).**
- `formalPointHom` and `range_formalPointHomAdicCompletion` are cited on the 7C and Layer 7 targets. Per the review, the notes keep all hypotheses and call the E₁ reading an interpretation.
- The p-series target cites `FormalGroup.Point`. It now says the [p]-series exists implicitly as p • X, with no name or lemmas, and that Verschiebung and Frobenius are absent.

**/30.** `Representation.isProj_averageMap` is cited on 9A (targets 3 and 5) and 9D (target 3). The stale "searched: Reynolds" sentence is corrected. The notes add the review's caveat that the invariant-ring base change itself still needs proof.

**/31.** `card_ker_mulByIntIsogeny` is cited on 8A and 5B. The notes say that cardinality alone does not give (ℤ/N)², per the review.

**/33.** The two AlgebraicCurves supplier entries are removed from the Layer 10 duplicates, and R03.2 from the 7B duplicates. The wild-break note records AlgebraicCurves Layers 7–8 as declared suppliers.

**/34.** The 9E note now says "over any integral domain (in particular any field, in every characteristic)". `card_stabilizer_ρ` is added next to `card_stabilizer_I` in the 9E and Layer 10 targets. The analytic, characteristic-zero framing is kept.

**/35 (9E).** `AffineSpace.homOverEquiv` is cited. The gluing, the moduli morphism and the descent stay missing.

## Rejected findings (no change)

- **/4.** The BelyiMaps Layer 12 duplicate is not established. The review says to import 0D's machinery into Belyi instead.
- **/5.** AdicCoefficients L2 is a supplier, not a duplicate of 0E.
- **/29.** The 5C note is not wrong. The review also notes that the proposed text would contradict /3.
- **/32.** The partial grading of the 8D index targets stays.

## Checks

- `python3 research/blueprint/intake.py check-files` on both deliverables: 0 problems.
- The unit suite passes.
- The JSON keeps its one-space indentation.
- No other roadmap in the file changed, and no layer verdict changed.

## Correction (29 September 2026, same session)

The audit job specification allows up to five `declarations` per target. The first submission of this fix left four targets over that limit:

| Target | Declarations |
|---|---|
| 0B kernel | 9 |
| 2A finite morphism | 8 |
| 0B constant group scheme | 6 |
| 0E spreading out | 6 |

Each now lists five, keeping the most direct evidence. The remaining declarations are named in the target's note with their files and lines, so no evidence is lost:
- 0B kernel: `quotientKernelHopfIdealAlgEquiv`, `instCartesianMonoidalCategoryOverScheme`, `Over.instBraidedPullback` and `baseChangePointMulEquiv_pointMap`;
- 2A: `Ideal.finrank_fiber_eq_finrank`, the separable `Place` formula and `moduleFinite_intermediateRing_of_isElliptic`;
- 0B constant group scheme: `isFinite_groupScheme`;
- 0E: `preservesColimit_yoneda`.

No status, verdict or other note changed.
