# REV-RT-AUDIT-07

Independent verifier: Codex — codex-hjdg0j. Issue: [#1563](https://github.com/CBirkbeck/tauceti-explorer/issues/1563). Read date: 2026-09-24. Repository snapshot: `6a4f4d394943d83e1cda8b4b3a582ca8522c5c15`.

All 20 findings are confirmed: two high, five medium and thirteen low. Several proposed fixes need qualifications, which are binding parts of the reasons below. In particular, bounded-height quartic finiteness must exclude the nullcone, and the overlap notes must respect already accepted supplier assignments. These are findings about the accepted audit’s labels, notes and cross-references; confirmation of an overlap note does not mean that the assembled atlas still has two owners.

The verifier did none of AUDIT-07, REV-AUDIT-07 or RT-AUDIT-07. The red-team report identifies its author as Claude Code, session cc-38267a. This verification does not repeat its entire 141-target audit or certify all 193 citations; it checks every finding and the evidence on which that finding rests.

## Findings and corrections

### RT-AUDIT-07/1 — confirmed (high)

Confirmed. NumberField.finite_setOfPred_mulHeight₁_le (Height/NumberField.lean:411) fixes one number field; finite_of_discr_bdd (Discriminant/Basic.lean:496) counts number fields, and Affine.finite_naiveHeight_le (NaiveHeight.lean:186) counts points on a fixed curve. None proves the curve/form-family target. The audit marks only this ST.0 target fully present, so its own stated aggregation convention gives not built after changing it to partial. Correct the proposed fix to retain the intended nondegenerate/irreducible quartic family, or at least (I,J)≠(0,0): all nX⁴ have I=J=0 and distinct contents, hence distinct GL₂(Z)-orbits of height zero. Bhargava–Shankar v3 p.4 expressly excludes (0,0) in the cited finiteness statement. Keep minimal-pair curve finiteness with the existing EllipticCurves Layer 8 owner.

### RT-AUDIT-07/2 — confirmed (high)

Confirmed. At the pin, NumberField.absMulHeight₁ and absLogHeight₁ occur only in their two definitions (NumberField.lean:137,146–147); there is no extension-invariance API. Projectivization.mulHeight (Projectivization.lean:46) uses a fixed field and AdmissibleAbsValues instance. Northcott at NumberField.lean:411 fixes K; Polynomial.finite_mahlerMeasure_le (MahlerMeasure.lean:107) concerns integer polynomials, with no height comparison supplied. The audit’s full-presence label therefore exceeds its evidence. Apply partial, qualify the summary and distinguish relative projective heights from absolute heights and their extension invariance; preserve the existing rational formula and product-formula results.

### RT-AUDIT-07/3 — confirmed (medium)

Confirmed. SelmerGroup.lean:104 defines the explicit local-condition subgroup and :120 contains the descent image in it. The bound at :142 requires [Finite S]; no occurrence elsewhere in either pinned tree supplies Finite selmerGroup₂. The module docstring also explicitly leaves that theorem open. The audit’s compound Mordell–Weil/Selmer-finiteness target is only partial, even though its Mordell–Weil component is proved. Qualify the summary and the rank-bound note exactly as proposed. EllipticCurves Layer 7 already owns the missing finiteness/comparison work; do not duplicate it in ArithmeticStatistics.

### RT-AUDIT-07/4 — confirmed (medium)

Confirmed. SelbergSieve.lean:77–82 adds only level and one_le_level; :105 merely reexports the lower bound. Neither lambdaSquared (:236) nor upperMoebius_lambdaSquared (:250) has a support cutoff. Searches found no external SelbergSieve consumer supplying the missing use of level. The level-of-distribution target should be absent and SelbergSieve related. BoundingSieve.errSum (:177) is the weighted divisor remainder sum, not a distribution-level hypothesis. Keep the genuinely built sieve-data and upper-bound targets.

### RT-AUDIT-07/5 — confirmed (medium)

Confirmed. Under the scoped Matrix.Norms.L2Operator norm, Matrix.l2_opNorm_conjTranspose (Matrix.lean:204) gives the adjoint norm identity, and l2_opNorm_mulVec (:222) bounds multiplication on EuclideanSpace. ContinuousLinearMap.adjoint (Adjoint.lean:114), with the Hilbert-space completeness assumptions, is a conjugate-linear isometric equivalence. This proves the operator form of the duality mechanism, so absent is too strong. Use partial/more general as proposed; the large-sieve matrix and its inequalities remain to be instantiated. In the squared-inequality adapter state the nonnegative bound D explicitly, with the Euclidean norm and conjugate transpose, not an entrywise matrix norm.

### RT-AUDIT-07/6 — confirmed (medium)

Confirmed. The roadmap file’s LV.6 explicitly plans Lawrence–Venkatesh Theorem 4.1. In arXiv:1807.02721v3 p.20 this is finiteness of t with t and 1−t both S-units, exactly the two-variable part of DT.2’s target. DT.2 currently lists only ED.2 and RP.4. The file exists at f66d8b51, before the accepted audit’s 2026-09-16T22:29:53Z commit. Add the LV.6 cross-reference and share the theorem statement while allowing the distinct proof route; do not identify this special equation with all higher-variable nondegenerate S-unit equations.

### RT-AUDIT-07/7 — confirmed (medium)

Confirmed as an omitted reusable carrier/API, not as a completed equidistribution theorem. EmpiricalMeasure.lean:54,80,128 provides finite-population and sequence probability measures, including the uniform-pushforward identity; the sequence uses n+1 terms. WeakConvergence.lean:75 proves almost-sure convergence for a conditionally i.i.d. process under its second-countability/measurability assumptions. Add the related citations to PM.0 and PM.2 as proposed. Keep Weyl’s criterion absent and retain that no dedicated equidistribution predicate was found; the stochastic theorem does not prove deterministic arithmetic equidistribution.

### RT-AUDIT-07/8 — confirmed (low)

Confirmed. NumberField.Set.HasDirichletDensity (DirichletDensity.lean:82) and dirichletDensity (:90) are defined for sets of nonzero prime ideals of a number field. The audit’s only clause omits this available notion. Add the related citation and amend the note. This remains a different ordering/limiting process from height densities of curves or forms, so the target’s partial status should not be upgraded.

### RT-AUDIT-07/9 — confirmed (low)

Confirmed, with the coefficient and nonsingularity boundaries retained. WeierstrassCurve.shortCurve (ShortWeierstrass.lean:81) supplies the parameterized equation; exists_variableChange_isShortNF (NormalForms.lean:274) requires 2 and 3 invertible. It does not produce an integral minimal pair by itself. quadraticTwist (QuadraticTwist.lean:451) takes a separable quadratic field extension, and its ellipticity instance (:470) requires the original curve elliptic. Add these as related carriers. Keep minimal-pair existence/uniqueness, integral orbit normalization and Selmer statistics as additional obligations, rather than claiming all arithmetic-family work follows from a short equation.

### RT-AUDIT-07/10 — confirmed (low)

Confirmed. The cited finite_setOfPred_mulHeight_nat_le fixes a nonzero natural denominator and bounds integral numerators (NumberField.lean:374). The stronger :411 is the appropriate related element-height theorem. Height/Northcott.lean explicitly leaves projective-space instances as TODOs, and searches found no replacement at either pin. Replace the misleading general points phrasing by fixed-field elements and the separately available elliptic-curve point result; keep general projective/variety counting absent. The proposed change does not assert that the missing projective Northcott theorem is mathematically false.

### RT-AUDIT-07/11 — confirmed (low)

Confirmed for the overbroad no-random-matrix-models note. wishartGramMeasure (Wishart/Basic.lean:160) is a real matrix-valued probability law, with the probability instance at :172. It does not supply Cohen–Lenstra or arithmetic matrix statistics. Qualify the note and cite this related construction. Do not adopt the stronger assertion that this is the only possible random-matrix law, or that Haar measure itself is absent: Mathlib has the general Haar construction. SU2/Weyl/Orthogonality.lean:33–38 leaves the group-to-Weyl-density integration formula open, a distinct issue from existence of Haar measure. The arithmetic-statistics target remains absent.

### RT-AUDIT-07/12 — confirmed (low)

Confirmed. Nat.filter_coprime_Ico_eq_totient (Totient.lean:80) counts a full interval of length a exactly, and Ico_filter_coprime_le (:85) bounds an arbitrary interval when a≠0. These supply concrete elementary sieve special cases absent from the note. Add the two related citations without claiming a general lower-bound sieve or fundamental lemma. An exact full-period identity is not the general lower-bound counterpart of BoundingSieve’s weighted upper bound.

### RT-AUDIT-07/13 — confirmed (low)

Confirmed. Complex.exp_eq_one_iff (Log.lean:142), exp_eq_exp_iff_exists_int (:172), log_exp_exists (:180), and log_mul_eq_add_log_iff (:94) provide the elementary branch arithmetic omitted from the note. In the corrected description retain x≠0 and y≠0 for logarithm additivity, and the principal-argument interval (−π,π]. They do not supply the height/degree estimates of Baker applications or a p-adic logarithm. The target remains partial.

### RT-AUDIT-07/14 — confirmed (low)

Confirmed under this audit’s target-level convention. AlgebraicIndependent (Defs.lean:54), hausdorffMeasure (Hausdorff.lean:535), and dimH (HausdorffDimension.lean:97) define the language, not the named transcendence or metric-approximation theorems. The audit already labels similarly unsupported arithmetic independence and Gauss-map ergodicity absent despite citing their generic definitions. Searches for the named missing results found no such theorem. Mark both theorem targets absent, retain the definitions as related, and leave the layer verdicts unchanged.

### RT-AUDIT-07/15 — confirmed (low)

Confirmed as missing audit overlap metadata, with a narrower note. ES.1 lists AC.0 but not FF.1; FF.1’s character normalization is relevant, and AddChar.sum_eq_ite (AddChar.lean:329) already gives finite additive-character orthogonality. Accepted RS-03 assigns generic finite-abelian Fourier interfaces to AC.0 and makes FF.1 import them, retaining field-specific comparisons. Add FF.1 as a specialization/import cross-reference, explicitly citing that resolution. Do not imply a second generic orthogonality construction or that finite-field characters cover every composite-modulus adapter.

### RT-AUDIT-07/16 — confirmed (low)

Confirmed as an omitted consumer cross-reference, not an unresolved second owner. The original CA.1 and ES.0 descriptions both use Gauss/Jacobi interfaces, and gaussSum/JacobiSum are already in Mathlib (GaussSum.lean:72; JacobiSum/Basic.lean:47). Accepted RS-03 narrows CA.1 to import FF.1 and the built arithmetic baseline; its FF.1→CA.1 link is in the assembled graph. Add a note recording that shared import, rather than the proposed unqualified wording that CA.1 independently plans these constructions. No ownership or graph change is needed.

### RT-AUDIT-07/17 — confirmed (low)

Confirmed for the shared local-count/measure interface. ES.3’s normalized local densities and LD.2’s Poincaré/Igusa series both consume counts of congruence solutions, with different endpoint theorems. Add the LD.2 cross-reference, retaining normalization and convergence restrictions and distinguishing a generating series from existence or positivity of a density limit. Do not repeat the blanket claim that Haar measure on Z_p^n is unavailable: Measure.addHaarMeasure and PadicInt.compactSpace provide general infrastructure at the pin. The arithmetic cylinder-count comparison and definable integration remain separate obligations.

### RT-AUDIT-07/18 — confirmed (low)

Confirmed only as a scoped, conditional overlap note. QT.6 explicitly offers a controlled stationary-phase OR q-asymptotic route for a selected state integral/sum; ES.0 plans stationary-phase estimates. Record the common analytic-estimate interface when the stationary-phase route is chosen. Keep contour, branch, convergence, critical-point and remainder hypotheses visible; no evidence establishes that ES.0’s real-variable estimate directly proves the complex state-integral result, or that a formal q-asymptotic expansion is the same theorem. The correction is an audit cross-reference, not a new dependency or a whole-layer merger.

### RT-AUDIT-07/19 — confirmed (low)

Confirmed. GZ.1 explicitly includes finite-extension normalization and missing projective-height lemmas, while DT.0’s duplicate list omits GZ.1. Add the cross-reference. Respect GZ.1’s own import boundary to ArithmeticHeights and EllipticCurves: the common general height/extension-invariance API should be supplied once by its existing owner, and GZ.1 should retain its abelian-variety/Poincaré specialization. This corroborates finding 2 without authorizing a second public height definition.

### RT-AUDIT-07/20 — confirmed (low)

Confirmed as an audit cross-reference, with the existing resolution recorded. SV.1’s duplicate list is empty, while AUDIT-16 AC.4 and AUDIT-07 SV.4 both identify the Selberg/truncated-divisor-weight overlap. Accepted RS-07 already installs SV.1→AC.4 for that machinery and leaves pseudorandomness, linear-forms conditions and transference in AC.4; the edge is present in the assembled graph. Add the symmetric audit note explicitly as this supplier/consumer relationship, not as a request to rebuild the weights or rerun restructuring.

## Evidence read

Read the complete red-team JSON/report; the cited AUDIT-07 targets, summaries, duplicate lists and review note; related reviewed coverage; the two decomposition passages about quartic finiteness and unverified height normalization; the named original stage contracts and EllipticCurves Layers 7–8. Read LV.6, the AUDIT-16 AC.4 overlap, and accepted RS-03/RS-07 owner records, narrowings and links. A read-only `scripts.build.assemble(require_distances=False)` run confirmed the three relevant supplier edges. The original description strings remain in the assembled stages alongside their `restructured` records, so reading description strings alone would miss those boundaries.

Pinned libraries: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every source file read was checked against its pinned Git blob hash. Searches covered both full pinned Lean trees for absolute-height API and extension/Mahler comparisons, Selmer-group consumers, actual sieve-level consumers, family heights/forms, and the named independence/metric-approximation results. A prior same-session full-tree verification covers the same unchanged local files; no current-main library declaration is substituted for the pins.

The following links identify the actual files/ranges read, including section assumptions. Ranges are reading extents, not claims that every declaration in each file was audited.

| Pinned source | Lines read |
|---|---|
| [Mathlib/Algebra/Group/AddChar.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/AddChar.lean) | 298–339 |
| [Mathlib/AlgebraicGeometry/EllipticCurve/NormalForms.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/NormalForms.lean) | 251–285 |
| [Mathlib/Analysis/CStarAlgebra/Matrix.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/CStarAlgebra/Matrix.lean) | 88–110, 188–228 |
| [Mathlib/Analysis/InnerProductSpace/Adjoint.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/InnerProductSpace/Adjoint.lean) | 42–66, 68–85, 86–96, 103–133 |
| [Mathlib/Analysis/SpecialFunctions/Complex/Log.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Complex/Log.lean) | 85–103, 136–183 |
| [Mathlib/Data/Nat/Totient.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Totient.lean) | 67–106 |
| [Mathlib/Dynamics/Ergodic/Ergodic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Dynamics/Ergodic/Ergodic.lean) | 28–60 |
| [Mathlib/MeasureTheory/Measure/Haar/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Measure/Haar/Basic.lean) | 494–532, 568–580 |
| [Mathlib/MeasureTheory/Measure/Hausdorff.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Measure/Hausdorff.lean) | 501–540 |
| [Mathlib/NumberTheory/GaussSum.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/GaussSum.lean) | 57–79 |
| [Mathlib/NumberTheory/Height/Northcott.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Height/Northcott.lean) | 1–56 |
| [Mathlib/NumberTheory/Height/NumberField.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Height/NumberField.lean) | 61–90, 109–151, 368–424, 524–538 |
| [Mathlib/NumberTheory/Height/Projectivization.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Height/Projectivization.lean) | 1–110 |
| [Mathlib/NumberTheory/JacobiSum/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/JacobiSum/Basic.lean) | 32–56 |
| [Mathlib/NumberTheory/MahlerMeasure.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/MahlerMeasure.lean) | 82–121 |
| [Mathlib/NumberTheory/NumberField/DirichletDensity.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/DirichletDensity.lean) | 40–94 |
| [Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean) | 481–510 |
| [Mathlib/NumberTheory/Padics/ProperSpace.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/ProperSpace.lean) | 32–65 |
| [Mathlib/NumberTheory/SelbergSieve.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/SelbergSieve.lean) | 42–110, 158–191, 228–262 |
| [Mathlib/Probability/Independence/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Probability/Independence/Basic.lean) | 128–146 |
| [Mathlib/RingTheory/AlgebraicIndependent/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AlgebraicIndependent/Defs.lean) | 42–66 |
| [Mathlib/Topology/MetricSpace/HausdorffDimension.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/MetricSpace/HausdorffDimension.lean) | 76–108 |
| [TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/NaiveHeight.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/NaiveHeight.lean) | 28–58, 150–197 |
| [TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean) | 10–52, 69–152 |
| [TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean) | 398–411, 438–479 |
| [TauCeti/AlgebraicGeometry/EllipticCurve/ShortWeierstrass.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/ShortWeierstrass.lean) | 72–107 |
| [TauCeti/Probability/Distributions/Wishart/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/Distributions/Wishart/Basic.lean) | 90–113, 139–176 |
| [TauCeti/Probability/Exchangeability/ConditionallyIID/WeakConvergence.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/Exchangeability/ConditionallyIID/WeakConvergence.lean) | 35–90 |
| [TauCeti/Probability/Process/EmpiricalMeasure.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/Process/EmpiricalMeasure.lean) | 25–92, 115–146 |
| [TauCeti/RepresentationTheory/SU2/Weyl/Orthogonality.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/SU2/Weyl/Orthogonality.lean) | 9–46 |

Two additional primary-source locators were opened publicly on 2026-09-24:

- [Bhargava–Shankar, arXiv:1006.1002v3](https://arxiv.org/pdf/1006.1002v3), pp.1 and 4: the minimal-pair height convention and the fixed-invariant orbit-finiteness statement with (I,J)≠(0,0). This verifies what the decomposition attributes to Borel–Harish-Chandra; this review does not claim to have checked the full Borel–Harish-Chandra proof.
- [Lawrence–Venkatesh, arXiv:1807.02721v3](https://arxiv.org/pdf/1807.02721v3), p.20, Theorem 4.1: the two-variable S-unit finiteness statement. No claim of having reverified that theorem’s full proof is made.

## Application boundaries

The five medium and two high findings should become the usual fix work. The low findings refine notes and cross-references, not library implementation status beyond their expressly identified target-label changes. Reuse the pinned general Haar/linear-algebra machinery with its assumptions; do not infer arithmetic comparison theorems from generic carriers.

For findings 15, 16 and 20, the audit’s duplicate field is used elsewhere for shared imports as well as competing construction plans. The corrected notes should say that RS-03 or RS-07 has already settled ownership. For finding 18, record only the conditional common interface; neither the q-asymptotic alternative nor a complex-contour adaptation is supplied merely by citing ES.0.

## Validation

`scripts/check_redteam.py` and the intake file check passed for the two deliverables. The review has one verdict for each of the 20 input finding IDs, in order. Only the authorized review JSON and this report change. No Lean deliverable is part of this job, and no Lean compilation is claimed.
