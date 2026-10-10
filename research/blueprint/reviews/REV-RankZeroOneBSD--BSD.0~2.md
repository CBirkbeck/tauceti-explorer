# Independent review: rank-zero and rank-one BSD, revision 2

**Verdict: accepted at target level.** Completed job `REV-RankZeroOneBSD--BSD.0~2`, issue #7085, by Codex (GPT-6), session `codex-jMCNko`, on 2026-10-10. This reviewer wrote neither the original plan nor its revision. The [corrected packet](../packets/RankZeroOneBSD--BSD.0.json), [reader](../readmes/RankZeroOneBSD--BSD.0.md) and [suggested Lean file](../suggested/RankZeroOneBSD--BSD.0.lean) agree.

The finished planning pass has 68 targets: **57 verified, 11 corrected, zero added and zero unverifiable**. All 68 baseline declarations are confirmed at the pins. There are 78 API items, 37 tests, 34 planets, 49 exact supplier requests, eight recorded gaps and seven independently confirmed source issues. All eight layers are `planned`; none is `closed`. Every implementation status remains `unchecked`.

Acceptance uses PROTOCOL §0 and the issue's explicit allowance for recorded gaps: every target has an actual carrier or statement and a prerequisite chain ending in a library, another owner's export/request or a named gap. It does not certify implementation or complete every proposed proof. In particular, the unread original FH and Birch–Stephens arguments, integral comparison discharges and unapplied stage placements are explicit obligations. There is no unresolved contradiction between a claimed completed proof and those obligations. A future claim of closure must discharge them.

## Method and the previous review

Read the previous independent report, the revision handoff, both binding protocols, WORKERS and UPSTREAM_GUIDE. Checked every node's hypotheses, source locators, direct prerequisites, proof outline, API, tests and reader statement. Read each baseline declaration with its surrounding variables and instances at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Read the exact statements of 115 unique external references, including requested stages and upstream layer contracts. Source texts were public versions; no licensed book was needed. Statements and assessments here are paraphrases.

The previous review withheld acceptance for 19 unsupported targets, principally absent period geometry, signed API names existing only as comments and unqualified supplier identifications. Revision 2 fixes the interfaces: the period has an integration lattice, differential-ideal carrier and native covolume; signed classes have continuous finite-level H¹, compact geometric Tate coefficients, corestriction-compatible inverse limits, signed submodules and actual maps. All six signed API names and four examples now occur as Lean declarations. The residual proof limitations are attached to requests/gaps rather than presented as theorems already supplied. This removes the interface reasons for rejection without inventing proofs of those gaps.

The original review's other corrections remain in place: continued rather than raw-tsum central values; entire completion at gamma poles; normalized Fricke signs; integral quadratic trace compositions; finite rather than merely exponent-two kernels; split-p/geometric Tamagawa comparisons; free versus full Heegner indices; positive rational defect with Reg_BSD=2ʳReg; one-sided Kato bounds; corrected Castella hypotheses; ordinary-support supersingular twist range; and separate ownership of higher-weight and signed comparisons. The ledger below records the fresh assessment of every target, including the earlier three additions. No node is newly added in this review.

## Corrections applied

1. **Inert local factor notation.** In base change over 𝔽_(ℓ²), the point-count trace is t_(ℓ²)=a_ℓ²−2ℓ. The Dirichlet coefficient a_(ℓ²)=a_ℓ²−ℓ is a different quantity. Corrected the proof and the finite-field supplier request; the reader has the same distinction.
2. **Regulator comparison.** Removed the stale assertion that native number-field height/Northcott instances are missing, and the reference to a nonexistent GZ Gram-rescaling export. The proof uses native `Matrix.det_mul`, `Matrix.det_transpose` and `AddSubgroup.index_eq_natAbs_det` after GZ's genuine height-normalization comparison. Removed the duplicate finite-generation prerequisite from rank splitting.
3. **Infinitely many twists.** BFH's direct infinitude statement in §9, printed pp.616–617, is now cited explicitly. Its finite-exclusion alternative first discards D=1; otherwise there need not be a ramified prime at which to exclude a previous discriminant. The FH ramified-prescription branch no longer claims infinitude by BFH's splitting-only enlargement argument. Its exact local-template compatibility and original theorem remain a recorded source obligation.
4. **Heegner rationality.** The proof uses the square of the free index, (I_K^free)². Torsion is retained when relating it to the full index. The synchronized reader preserves the relative-height factor2 and the period/Manin factors.
5. **Locators and native names.** BSTW §6.6.2 has *Proposition*6.25, not Theorem6.25. Theorem1.5 is on printed p.4, including its rank-zero uses. Corrected the period introduction's nonexistent `ZLattice.covolumeL` to the actual `ZLattice.covolume` with `MeasureTheory.volume`.
6. **Signed coefficient action.** Added a pin-compatible unramified coefficient inclusion and its coefficientwise power-series map. The signed logarithm and signed localization are now Λ_K-linear into Λ_K^ur through that map, rather than only ℤ_p-linear with an arbitrary module action. Synchronized the construction statement and exact PHR request. The integral image and cohomological/geometric lattice-index obligations remain explicit.
7. **Baseline/review records.** Corrected `TauCeti.ContCohomology.H1`'s kind to `abbrev` and retained only its actual bare additive-quotient/topology use. Updated all 68 independent pin receipts, all 17 source-version reading dates and all seven source-issue verdicts to this job. Replaced the old review with the complete fresh 68-node ledger.

These changes touch only the four named deliverables and this job's handoff. No supplier packet, upstream roadmap, atlas data or issue label is changed. No baseline declaration is removed or newly added; the retained inventory is 43 Mathlib and 25 Tau Ceti declarations.

## Pinned baseline ledger

Every row below is confirmed by its actual declaration at the recorded commit. The qualification column states the use being approved, rather than promising a stronger theorem. Modules are paths relative to their own library repositories.

| Declaration | Pinned module | Approved use / qualification |
| --- | --- | --- |
| `mathlib:Algebra.IsQuadraticExtension` | `Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean` | An algebra of rank two over a field. |
| `mathlib:AnalyticAt.analyticOrderAt_ne_top` | `Mathlib/Analysis/Analytic/Order.lean` | For f analytic at z₀: analyticOrderAt f z₀ ≠ ⊤ iff f = (z − z₀)^n g near z₀ with g analytic and g z₀ ≠ 0. |
| `mathlib:ArithmeticFunction.eulerProduct` | `Mathlib/NumberTheory/ArithmeticFunction/LFunction.lean` | The Euler product of a family of local arithmetic functions indexed by primes. |
| `mathlib:Complex.Gammaℂ` | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean` | Deligne's archimedean factor Γ_ℂ(s) = 2(2π)^{-s}Γ(s). |
| `mathlib:Int.IsFundamentalDiscr` | `Mathlib/NumberTheory/FundamentalDiscriminant.lean` | The predicate of being a fundamental discriminant. |
| `mathlib:IsArithFrobAt` | `Mathlib/RingTheory/Frobenius.lean` | σ is an arithmetic Frobenius at a prime Q: σ(x) ≡ x^{#(R/Q∩R)} mod Q. |
| `mathlib:LSeries` | `Mathlib/NumberTheory/LSeries/Basic.lean` | The L-series of a coefficient sequence ℕ → ℂ, defined as a tsum. |
| `mathlib:LSeries.abscissaOfAbsConv` | `Mathlib/NumberTheory/LSeries/Convergence.lean` | The abscissa of absolute convergence of an L-series, in EReal. |
| `mathlib:LSeries_convolution` | `Mathlib/NumberTheory/LSeries/Convolution.lean` | LSeries (f ⍟ g) s = LSeries f s * LSeries g s when both series are summable at s. |
| `mathlib:Module.finrank` | `Mathlib/LinearAlgebra/Dimension/Finrank.lean` | The cardinal Module.rank truncated to ℕ; in this packet finite generation/free-quotient or rational tensor hypotheses justify its interpretation as Mordell–Weil rank. It is not zero for every module that is not finite free. |
| `mathlib:Nat.factorial` | `Mathlib/Data/Nat/Factorial/Basic.lean` | The factorial n!. |
| `mathlib:NumberField.discr` | `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean` | The absolute discriminant of a number field. |
| `mathlib:Submodule.torsionBy` | `Mathlib/Algebra/Module/Torsion/Basic.lean` | The a-torsion submodule M[a]. |
| `mathlib:WeierstrassCurve.Affine.Point` | `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean` | The group of nonsingular points of an affine Weierstrass curve with the point at infinity. |
| `mathlib:WeierstrassCurve.Affine.Point.map` | `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean` | The map on points induced by an algebra homomorphism of the coefficient fields. |
| `mathlib:WeierstrassCurve.HasAdditiveReduction` | `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean` | Additive reduction of a minimal Weierstrass equation over a DVR. |
| `mathlib:WeierstrassCurve.HasGoodReduction` | `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean` | Good reduction of an (integral, minimal) Weierstrass equation over a DVR. |
| `mathlib:WeierstrassCurve.HasMultiplicativeReduction` | `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean` | Multiplicative reduction of a minimal Weierstrass equation over a DVR. |
| `mathlib:WeierstrassCurve.HasSplitMultiplicativeReduction` | `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean` | Split multiplicative reduction of a minimal Weierstrass equation over a DVR. |
| `mathlib:WeierstrassCurve.IsElliptic` | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | A Weierstrass curve whose discriminant is a unit. |
| `mathlib:WeierstrassCurve.LFunction` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` | The L-function of a Weierstrass curve over a number field as the formal Euler product (an ArithmeticFunction ℤ) of the local Euler factors at all height-one primes, computed on minimal models. |
| `mathlib:WeierstrassCurve.LSeries` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` | The complex L-series s ↦ LSeries (↑ ∘ W.LFunction) s; a tsum, equal to 0 wherever the series is not summable. |
| `mathlib:WeierstrassCurve.baseChange` | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | Base change of a Weierstrass curve along an algebra map. |
| `mathlib:WeierstrassCurve.localEulerFactor` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` | The local Euler factor as an arithmetic function, from the inverse power series of the local polynomial. |
| `mathlib:WeierstrassCurve.localPolynomial` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` | The local polynomial 1 − aT + qT² (good), 1 − T (split multiplicative), 1 + T (nonsplit multiplicative), 1 (additive) of the minimal model over a DVR. |
| `mathlib:analyticOrderAt` | `Mathlib/Analysis/Analytic/Order.lean` | The order of vanishing of a function at a point, in ℕ∞ (⊤ for the zero germ, 0 if not analytic). |
| `mathlib:analyticOrderAt_eq_zero` | `Mathlib/Analysis/Analytic/Order.lean` | analyticOrderAt f z₀ = 0 iff f is not analytic at z₀ or f z₀ ≠ 0. |
| `mathlib:analyticOrderNatAt` | `Mathlib/Analysis/Analytic/Order.lean` | The natural-number truncation of analyticOrderAt. |
| `mathlib:iteratedDeriv` | `Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean` | The n-th iterated derivative of a function of one variable. |
| `mathlib:padicValRat` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | The p-adic valuation of a rational number. |
| `mathlib:quadraticChar` | `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean` | The quadratic character of a finite field. |
| `tauceti:Algebra.IsQuadraticExtension.quadraticCharacter` | `TauCeti/FieldTheory/Galois/Basic.lean` | The quadratic character (L ≃ₐ[K] L) →* ℤˣ of a quadratic extension. |
| `tauceti:CuspForm.hasEntireExtension_qExpansion_coeff` | `TauCeti/NumberTheory/ModularForms/LFunction.lean` | The q-expansion coefficient sequence of a cusp form of positive weight on an arithmetic subgroup has an entire extension (through Mathlib's ModularForm.L). |
| `tauceti:LSeries.HasEntireExtension` | `TauCeti/NumberTheory/LSeries/EntireExtension.lean` | a has an entire extension: the abscissa of absolute convergence is finite and some entire F agrees with LSeries a on the convergence half-plane. |
| `tauceti:LSeries.HasEntireExtension.existsUnique` | `TauCeti/NumberTheory/LSeries/EntireExtension.lean` | HasEntireExtension a gives ∃! entire F agreeing with LSeries a on the convergence half-plane. |
| `tauceti:LSeries.HasEntireExtension.of_extension_of_eq_on_lt_re` | `TauCeti/NumberTheory/LSeries/EntireExtension.lean` | Introduction: finite abscissa plus an entire F agreeing with LSeries a on some half-plane Re s > c gives HasEntireExtension a. |
| `tauceti:LSeries.HasEntireExtension.unique` | `TauCeti/NumberTheory/LSeries/EntireExtension.lean` | Two entire extensions of LSeries a on the convergence half-plane are equal. |
| `tauceti:NumberField.isArithFrobAt_multiquadratic_eq_one_iff` | `TauCeti/NumberTheory/Multiquadratic/Frobenius.lean` | For odd rational primes not dividing the radicands, an arithmetic Frobenius of the specified multiquadratic field is trivial iff the radicands are quadratic residues. This does not cover dyadic or ramified splitting. |
| `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight` | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean` | Tate's canonical height, normalised as the (O)-height (half the x-height limit). |
| `tauceti:WeierstrassCurve.Affine.Point.exists_baseChange_eq_of_map_eq` | `TauCeti/AlgebraicGeometry/EllipticCurve/GaloisDescent.lean` | A point of W(L) fixed by the nontrivial σ ∈ Gal(L/K) of a quadratic extension is the base change of a point of W(K). |
| `tauceti:WeierstrassCurve.Affine.Point.isOfFinAddOrder_of_canonicalHeight_eq_zero` | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean` | Height zero implies finite order under ellipticity, AdmissibleAbsValues, DecidableEq and Northcott for canonicalHeight; these instances must be supplied over the chosen number field. |
| `tauceti:WeierstrassCurve.Affine.PointModTorsion` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/PointModTorsion.lean` | The Mordell–Weil group modulo torsion. |
| `tauceti:WeierstrassCurve.Affine.fg_point_of_numberField` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean` | Mordell–Weil: the point group of an elliptic curve over a number field is finitely generated. |
| `tauceti:WeierstrassCurve.Affine.finite_torsion` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean` | Finite torsion under ellipticity, AdmissibleAbsValues, DecidableEq and Northcott for logHeight₁. Mathlib supplies these number-field height instances at the pin; fg_point_of_numberField also yields finite torsion for a number field. |
| `tauceti:WeierstrassCurve.Affine.neronTatePairing` | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean` | The Néron–Tate pairing, the halved polar form of the canonical height. |
| `tauceti:WeierstrassCurve.Affine.regulator` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/Regulator.lean` | Absolute Gram determinant on the free quotient, with height instances and Module.Finite ℤ PointModTorsion. Its self-pairing uses the (O)-height; the BSD regulator is 2^r times this value. |
| `tauceti:WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/Regulator.lean` | Rank-zero regulator equals 1 under the same height and finite free quotient instances as regulator. |
| `tauceti:WeierstrassCurve.isElliptic_quadraticTwist` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | The quadratic twist of an elliptic curve by a separable quadratic extension is elliptic. |
| `tauceti:WeierstrassCurve.j_quadraticTwist` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | Twisting does not change the j-invariant. |
| `tauceti:WeierstrassCurve.quadraticTwist` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | The quadratic twist E.quadraticTwist L of a Weierstrass curve over K by a separable quadratic extension L/K, as quadraticTwistOf by the trace and norm of a generator. |
| `tauceti:WeierstrassCurve.quadraticTwistOf` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | The twist of a Weierstrass curve over a commutative ring by the quadratic x² − t x + n (discriminant D = t² − 4n), with Δ ↦ D⁶Δ, c₄ ↦ D²c₄, c₆ ↦ D³c₆. |
| `tauceti:WeierstrassCurve.quadraticTwistPointEquiv` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | The isomorphism E^L(M) ≃+ E(M) on M-points, for K ⊆ L ⊆ M, induced by the change of variables over L carrying E to its twist. |
| `tauceti:WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | Transporting σ ∈ Aut(M/K) through E^L(M) ≅ E(M) multiplies its action by the quadratic character χ(σ\|_L) = ±1. |
| `mathlib:analyticOrderAt_mul` | `Mathlib/Analysis/Analytic/Order.lean` | For analytic scalar functions f and g, analyticOrderAt (f*g) z = analyticOrderAt f z + analyticOrderAt g z. Nonzero germs allow passage to natural orders. |
| `tauceti:TauCeti.Isogeny` | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean` | The existing isogeny type between affine Weierstrass curves over a field, with coordinate pullback and MapsInfinity. |
| `tauceti:TauCeti.Isogeny.degree` | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean` | The finite function-field degree of an isogeny, defined by Module.finrank over fieldPullback.fieldRange. |
| `mathlib:NumberField.instAdmissibleAbsValues` | `Mathlib/NumberTheory/Height/NumberField.lean` | Finite/infinite normalized absolute values of a number field, with the product formula. |
| `mathlib:NumberField.totalWeight_eq_finrank` | `Mathlib/NumberTheory/Height/NumberField.lean` | The height total weight is the degree over ℚ; relative heights divide by this weight to obtain absolute heights. |
| `mathlib:NumberField.finite_setOfPred_logHeight₁_le` | `Mathlib/NumberTheory/Height/NumberField.lean` | Northcott over a fixed number field for logarithmic affine height; the same file supplies multiplicative-height Northcott and its logarithmic instance. |
| `mathlib:Matrix.det_mul` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | For finite square matrices over a commutative ring, det(AB)=det(A)det(B). |
| `mathlib:Matrix.det_transpose` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | Transposition preserves the determinant. |
| `mathlib:AddSubgroup.index_eq_natAbs_det` | `Mathlib/LinearAlgebra/FreeModule/Finite/CardQuotient.lean` | For ℤ-bases of the ambient free group and subgroup with the same finite index set, subgroup index is the absolute basis-change determinant. |
| `mathlib:IsZLattice` | `Mathlib/Algebra/Module/ZLattice/Basic.lean` | A ℤ-submodule spanning its real vector space; discreteness is a separate instance. |
| `mathlib:ZLattice.covolume` | `Mathlib/Algebra/Module/ZLattice/Covolume.lean` | Real-valued Haar covolume of an actual discrete full ℤ-lattice. |
| `mathlib:ZLattice.covolume_pos` | `Mathlib/Algebra/Module/ZLattice/Covolume.lean` | Positive covolume for a discrete full lattice with Haar measure. |
| `mathlib:FractionalIdeal.absNorm` | `Mathlib/RingTheory/FractionalIdeal/Norm.lean` | Multiplicative rational-valued norm including denominators for fractional ideals over a Dedekind domain finite free over ℤ. |
| `mathlib:FractionalIdeal.absNorm_eq_zero_iff` | `Mathlib/RingTheory/FractionalIdeal/Norm.lean` | The fractional norm vanishes exactly for the zero ideal; invertible differential ideals have positive norm. |
| `tauceti:TauCeti.ContCohomology.H1` | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean` | Continuous one-cocycles modulo continuous coboundaries, as a bare additive quotient, for a topological group with continuous additive action. Use compact coefficient topology for T_pE and discrete coefficient topology for E[p∞]; this does not assert that the inherited topology on H1 is the canonical cohomology topology. |

`Algebra.IsQuadraticExtension` expresses rank2 over more general coefficient rings; its field specialization suffices here. `Module.finrank` is truncated cardinal rank, so finite-generation/free-quotient conditions are essential to its arithmetic interpretation. Native Mordell–Weil, admissible-height and Northcott statements are already at this pin. `IsArithFrobAt` and the multiquadratic Frobenius result supply neither dyadic nor ramified character identifications without the requested comparisons. Abstract `groupCohomology.H1` and its generic topology are not substituted for Tau Ceti's continuous Galois cohomology. Determinant/index identities give the lattice arithmetic, while normalization transport remains GZ's job.

## Source checks and limitations

Seventeen public PDF receipts were independently checked against their full SHA-256 values and the cited statements on 2026-10-10. These are checks at the needed locators, not a claim to have reread every page. Scanned BFH, Gross and Gross–Zagier pages were inspected as images. Published JSW/Castella were compared with their preprints and the author erratum. The packet records full hashes and URLs.

| Public version | Checked locator | SHA-256 prefix |
| --- | --- | --- |
| [jsw](https://arxiv.org/abs/1512.06894v1) | §§1,7; Theorems7.2.1,7.4.1–7.4.2; preprint pp.40–48. | `908562efdddaf46b` |
| [skinner-mult](https://arxiv.org/abs/1407.1093v1) | Theorems A–C, pp.1–3; §3.1 pp.19–20; §3.2 pp.20–24. | `02d176d8fd52b015` |
| [castella-cjm](https://arxiv.org/abs/1704.06608v2) | Theorem A and the multiplicative argument, checked against the erratum. | `23e3ab4e9d99ceba` |
| [castella-erratum](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf) | Theorem1.1 p.1; Lemmas2.1–2.2 and Theorem2.3 pp.2–4; A′ p.5. | `c04dff16c27bc3ca` |
| [bstw](https://arxiv.org/abs/2409.01350v2) | Theorems1.3,1.5 pp.3–4; 1.14–1.15 p.7; §2.2.4–2.2.5 pp.13–14; Proposition6.25/Theorem6.26 p.68; Proposition9.18 pp.83–84. | `18e05982cdb2ac57` |
| [bfh90](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf) | Introduction pp.543–544 and §9 pp.614–617, including the infinitude argument. | `d50ad2f11c992591` |
| [burungale-tian](https://arxiv.org/abs/2506.03465v2) | §1 Theorems1.1–1.2 and footnote2, printed pp.1–3. | `cbb8284a13ed40bd` |
| [skinner-zhang](https://arxiv.org/abs/1407.1099v1) | §9.1 Lemma9.1/Corollary9.2; §9.2 Lemmas9.5–9.6. | `50123dc1fb271f61` |
| [kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | 14.1–14.3 pp.234–236; 15.19–15.21 pp.266–267. | `3c6e14b11fa60262` |
| [pollack-weston](https://arxiv.org/abs/math/0610694v1) | Definite CR hypotheses, §1; character modules and Theorem6.2/Propositions6.3–6.5, §6. | `42962ab1de009241` |
| [gross-zagier-86](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf) | V.§2 Theorem2.1 and Conjecture2.2, pp.310–312. | `a9a52cb8662e03f1` |
| [gross-kolyvagin](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf) | §1 Theorem1.3 pp.235–237; §5 Proposition5.3 p.243. | `60b310c58a349486` |
| [jsw-published](https://archive.ymsc.tsinghua.edu.cn/pacm_download/253/8639-CJM_05_03_A02.pdf) | §§7.1–7.4 pp.420–428; period equation(7.1.b) p.421; index-square prose after(7.4.c) p.427. | `5a6978afcb2fad9c` |
| [castella-published](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2018/0006/0001/CJM-2018-0006-0001-a001.pdf) | Theorem A and §5, compared with corrected A′. | `737d615e79aa78ce` |
| [cgs-v2](https://arxiv.org/abs/2303.04373v2) | Proposition2.4.5; §6 opening and Theorems6.1.1,6.5.1. | `5046d7571ed3a1b1` |
| [fouquet-ochiai](https://www.math.titech.ac.jp/top/~ochiai/ControlF-O.pdf) | §2.1.4 Lemma2.14, pp.12–13 of the author copy. | `ed908e9b9c5facbf` |
| [fouquet-wan-v3](https://arxiv.org/abs/2107.13726v3) | Theorem1.6 pp.6–7; Theorem4.41 p.58; Corollary7.21/Lemma7.22 p.89. | `39cee6cec8a5d56b` |

The [primary FH bibliographic page](https://annals.math.princeton.edu/1995/142-2/p04) confirms the reference, but the original Theorem B text was not acquired in this run. Its proposed prescribed-local-data endpoint is assessed as a clearly owned target ending in that recorded gap, not as a source theorem independently verified here. Likewise Burungale–Tian footnote2 supports the congruent-number sign table, but does not replace the unread original Birch–Stephens dyadic calculation. No claim that either source is unavailable online is made.

BSTW1.3/1.5 applies to semistable curves, p>2, with the stated supersingular/ordinary-support conditions; it does not silently restore the full twist range of withdrawn Wan/old JSW. Its direct rank-one endpoint is separate from the older auxiliary-twist upper-bound route. GZ V.§2's index formula is a conjectural equivalence with BSD, not an available proof of BSD. Gross Proposition5.3 uses the opposite sign for the Fricke eigenvalue and functional equation; the eigenspace target agrees with it.

### Seven source issues

All existing issues were independently confirmed under this review's job id; none was added or rejected. Reasons below are mathematical assessments in our own words.

| Issue | Locator | Independent assessment |
| --- | --- | --- |
| E1 | Theorem A and the proof of Theorem 4.4 (via Theorem 4.2), arXiv:1704.06608v2 = Cambridge J. Math. 6 (2018) 1–23 | Compared published Theorem A with the author erratum §1 and A′, pp.1,5: the unsupported Hida specialization is withdrawn and the corrected local/residual hypotheses replace it. |
| E2 | Theorem 7.2.1(iii) and its attribution, p. 42 ([Wan14b, Cor. 4.8]) | Checked the arXiv withdrawal notice and BSTW Remark1.4 p.4 against JSW7.2.1(iii). BSTW1.3/1.5 repairs only the semistable and ordinary-support twist range, not every old coprime twist. |
| E3 | Published CJM5 (2017),p.427, sentence immediately after(7.4.c) | Independently compared published p.427 after(7.4.c) with its m² equation and the rank-one Gram calculation. The prose loses a square; odd-primary torsion vanishing explains its full-index usage. |
| E4 | Author erratum,Theorem1.1,p.1 | Erratum1.1 p.1 applies torsion terminology to the characteristic ideal; the proof and definition require torsion of X before forming that ideal. |
| E5 | Author erratum,proof of Theorem2.3,p.3,after the Cha05/MN19 citation | Erratum2.3 proof p.3 first sets C2=0 and then identifies C1 as the restriction-kernel constant. Its second C2 must be C1; this notation repair does not prove the higher-weight extension. |
| E6 | Proof of Theorem2.3,pp.3–4,(2.2),using CGS23 Theorem5.5.1(v2 6.5.1) | Compared erratum2.3 proof pp.3–4 with CGS v2 §6/6.5.1. The cited elliptic rational result alone does not supply the self-dual higher-weight integral bound at augmentation with C1=C2=0. |
| E7 | arXiv2409.01350v2,§9.3.2,proof of Proposition9.18,printed p.84 | BSTW9.3.2 pp.83–84 prints the ordinary comparison argument and delegates the supersingular case. The signed image/rank and cyclotomic non-torsion proof remains a separate target. |

E3–E5 are notation/type slips; they do not show the arithmetic endpoints false. E6–E7 are missing proof extensions. The [withdrawal notice for Wan's old supersingular preprint](https://arxiv.org/abs/1411.6352) and BSTW Remark1.4 were checked for E2. No source author was contacted.

## Supplier ownership, current upstream and dependency graph

The current read-only TauCetiRoadmap checkout was inspected at `8c72a04753b11cab07fa593cc38ceaa7c0515380`; the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These are different commits and neither replaces the packet's fixed baseline. Read the current EllipticCurves/ModularForms layers and checked the newer roadmaps, particularly IntegralLattices, LocalGaloisGroups and Completed/RestrictedProducts, against this plan's carriers and prerequisites. Read the reviewed BSD library audit and Caraiani–Newton upstream tier order. This packet is the existing EllipticCurves direction's Part II, as the accepted restructuring requires; it does not create a second generic elliptic-curve roadmap.

Current elliptic Tate-module topology/Galois action and native analytic continuation, analytic orders, heights and lattice arithmetic are imports. The pinned-file presentation of the newer Tate module is an imported signature fixture, not an additional planned library target. Restricted-product topology and local Galois groups remain their existing owners' work. No new generic target duplicates the nine newer roadmaps or the completed roadmaps. BSD is outside the 94-roadmap Caraiani–Newton order; its request to an early ordinary Kato L5 is a proposed lower export, not authorization to make a higher-tier package citation.

All 115 unique external reference statements/contracts and all 49 requests were checked. A supplier node's broad name was not accepted as proof of a stronger integral assertion. The critical distinctions are:

| Supplier | Actual boundary retained |
| --- | --- |
| ArithmeticGaloisDuality R02.4 | Finite-module Poitou–Tate is separate from compact/discrete and completed Λ-adic exactness; the latter are exact requests. |
| SelmerIwasawaCohomology L3 | Derived global base change does not prove finite Selmer/Fitting control or signed image hypotheses. |
| PadicHodgeRegulators L4 | Rational one-variable coordinates are separate from integral two-variable signed Coleman/logarithm image comparisons. Both maps require Λ-linearity and compatible coefficient extension. |
| AutomorphicPadicLFunctions L3/L3h | Greenberg Rankin functions, BDP projection, square/square-root convention and Σ-imprimitive comparison have separate contracts. |
| KatoEulerSystems L4/proposed L5 | All-prime/CM rank-zero and one-sided bound exports are precisely requested; ordinary BSTW construction/laws/comparison belong to the early proposed L5. |
| PadicFamilies L4 | CM-family integral measure/lattice input is imported, not reconstructed as BSD theory. |
| AutomorphicCongruences L2; R21.3; APL L3h | FW factorization, FO local special type and CGS projection have distinct owners. FW stronger ramification and exceptional-prime hypotheses remain explicit. |
| HeegnerPointEulerSystems HE.6/HE.7 | The exact Shimura-curve bound retains Howard local/parametrization errors; generic rank/finiteness alone does not supply it. |
| GZ.0/GZ.3/GZ.9 and Néron R11.4/R11.6 | Generic height/differential/character sequences do not discharge precise JSW multiplicity-one, degree or additive-away-from-p formulas. Supersingular p-adic GZ is separately requested. |
| ModularIwasawaMainConjectures L0/L1; PadicFamilies L3 | Good ordinary, multiplicative Hida deduction, Greenberg–Stevens and transcendence/period inputs retain their actual distinct hypotheses. |

The internal packet graph has 68 nodes and 177 distinct direct edges and is acyclic. The cumulative stage test includes every direct packet prerequisite and every request's supplier-to-consumer edge, expanding node ids through supplier packets and deduplicating edges. Counts below count incident vertices, not isolated atlas stages. The current atlas includes changes absent from the static snapshot.

| Graph | Vertices | Edges | Cyclic components |
| --- | --- | --- | --- |
| Snapshot stage-edges.json | 1365 | 3458 | 0 |
| Snapshot plus packet/requests | 1371 | 3539 | BSD.4 ↔ BSD.5 |
| Snapshot plus proposed placements | 1375 | 3562 | 0 |
| Current data/atlas.json | 1371 | 3508 | 0 |
| Current atlas plus packet/requests | 1377 | 3589 | BSD.4 ↔ BSD.5 |
| Current atlas plus proposed placements | 1381 | 3612 | 0 |

These counts include six canonical upstream stages that have no incident edges in the base graph. They therefore differ from earlier reports' narrower projections. This tests this packet against the stage graph; it does not certify all other packets' internal proofs or all future supplier refinements.

The maintainer must apply the early exports together: **BSD.0a** for modular-symbol rank-zero rationality before Kato's finite-level bound; **BSD.3a** for definite congruence periods before HE.6; **BSD.6z** for the signed zeta construction, laws and Proposition9.18 before AC L5a; and **ordinary Kato L5** before signed/AC consumers. Keep the signed producer independent of AC L5a and Castella endpoints. The unchanged restructuring proposals describe the moves and BSD.6/BSD.6a scope distinction. The cumulative cycle is an explicitly pending placement obligation, not a claim that today's atlas graph already contains these exports. No atlas edits are made by this review.

### Confirmed red-team findings

| Finding | Review result |
| --- | --- |
| RT-AREA-iwasawa-1/4 | Skinner Theorem A at p∥N is requested separately from the good-ordinary MC, with Greenberg–Stevens and Tate-period transcendence. Corrected §3.2 specialization cancels the anomalous Euler factor; exact Selmer/Fitting control and multiplicative Manin-period input remain requested. |
| RT-AREA-iwasawa-1/14 | Keep the Skinner–Urban auxiliary multiplicative q∥N, q≠p with residual ramification; do not replace it by the differently scoped FW1.6 statement. Good-ordinary MC and Skinner multiplicative Hida deduction have distinct requests. |
| RT-AREA-iwasawa-1/15 | Use corrected Castella A′/Theorem1.1. Added an owned higher-weight integral Kolyvagin-bound node: CGS v2 6.5.1 is elliptic and rational. FW4.41/Cor7.21 factorization belongs AC L2, FO Lemma2.14 local type R21.3, CGS2.4.5 Greenberg-to-BDP projection APL L3h with a separate Σ-imprimitive BSD comparison. Removed presumed BSD.7a supply and nonexistent FO Cor7.2.1. Full local and C1/C2 hypotheses remain gaps. |
| RT-AREA-iwasawa-1/16 | Separate central-value nonnegativity (GZ.5) from the positive Gross–Zagier height, then use nonvanishing to prove each leading term and defect positive. Positivity of a product alone does not prove either summand positive. Packet keeps the rational nonzero defect and Reg_BSD=2^r regulator conventions. |
| RT-AREA-iwasawa-1/17 | Retain requested p-integrality and isogeny/twist transport of the optimal Manin constant for p∤2N. Added a separate semistable p∥N export request for the multiplicative branch, where the good-prime theorem does not apply. Exact Ribet–Takahashi freeness/degree discharge remains unverified. |
| RT-AREA-iwasawa-1/30 | Ordinary BSTW element/reciprocity/Proposition9.18 are requested from proposed KatoEulerSystems L5; BSD owns only the supersingular construction/reciprocity and the added signed Proposition9.18 comparison. Source Theorem1.14 printed p.7 uses Col_v and Log_v̄; record the reversed red-team labels in upstreamNotes. Signed proof is left to the reader in the source and is a recorded gap. Proposed early signed BSD.6z is not a claim that cumulative stage edges are already acyclic. |

The actual BSTW1.14 notation is Col_v and Log_vbar; the reversed labels in RT/30 are recorded as an upstream note, not propagated into the plan.

## Definition APIs, tests and planets

Every definition/construction has an explicit API and at least three tests. All 78 API items correspond to actual named declarations, structures or instances in the suggested file, and all 37 tests to actual `example` blocks. Test names in comments identify those blocks; comments do not replace them. Elaboration checks the signatures and their type-class assumptions, while admitted bodies do not verify the mathematical claims.

| Definition/construction | API items | Tests | Assessment |
| --- | --- | --- | --- |
| actual-l-function | 10 | 4 | Actual signatures and examples; pin elaboration passes |
| completed-l-function | 11 | 5 | Actual signatures and examples; pin elaboration passes |
| analytic-rank | 10 | 5 | Actual signatures and examples; pin elaboration passes |
| quadratic-point-maps | 10 | 4 | Actual signatures and examples; pin elaboration passes |
| quadratic-period | 7 | 3 | Actual signatures and examples; pin elaboration passes |
| heegner-local-conditions | 9 | 4 | Actual signatures and examples; pin elaboration passes |
| heegner-index | 7 | 4 | Actual signatures and examples; pin elaboration passes |
| rational-bsd-defect | 8 | 4 | Actual signatures and examples; pin elaboration passes |
| bstw-two-variable-zeta-element | 6 | 4 | Actual signatures and examples; pin elaboration passes |

The tests exercise agreement of entire extensions, gamma-pole continuation, factorial/centre conventions, factor2 trace compositions, the complex period's factor4 and ideal norm, dyadic/local-character constraints, free/full indices, actual isogeny transport and distinct split-prime signed laws. The nonsummability hypothesis in the raw-series junk-value example is explicit. The congruent-number and 37a tests retain their source ranges; p=3 is not included in the a_p=0 supersingular 37a example.

There are 34 planets, all key definitions or named results, with counts BSD.0:6, BSD.1:5, BSD.2:3, BSD.3:2, BSD.4:2, BSD.5:6, BSD.6:5, BSD.6a:5. No layer exceeds six. A conjectural equivalence is named as such, rather than promoted to a proved endpoint.

## Complete node ledger

Here `verified` means a sound source-backed or explicitly gap-bounded target-level plan, not a formalized result or an assertion that an unread original was checked. `corrected` includes an in-place statement, proof, dependency, source or interface correction. The full ids and identical verdicts are in the packet's `review.checked` array.

| Stage / node | Verdict | Independent assessment |
| --- | --- | --- |
| BSD.0/actual-l-function | verified | The entire extension is transported from R29.6 and native cusp-form continuation; raw tsum agreement is restricted to its convergence domain. |
| BSD.0/completed-l-function | verified | Checked the Deligne gamma factor and normalized Fricke sign. Gamma-pole values use entire continuation, with no pointwise division at a zero factor. |
| BSD.0/analytic-rank | verified | The native analytic order is finite only after nonzero-germ verification; the factorial and leading-coefficient convention agree. |
| BSD.0/root-number-parity | verified | Expansion of the completed functional equation at the centre gives the stated parity; completion is nonvanishing near the centre. |
| BSD.0/quadratic-field-character | verified | The primitive Kronecker/Galois dictionary is precisely requested. The pinned Frobenius theorem supplies only its odd unramified portion. |
| BSD.0/finite-field-twist-trace | verified | Checked point counting, square twists, and characteristic-two exceptional fibres; existing twist and finite-field owners remain imports. |
| BSD.0/twist-local-factors | verified | Good, multiplicative, additive, dyadic and ramified factors use the actual local representation/reduction suppliers, with their exact missing exports requested. |
| BSD.0/twist-l-series | verified | The coprime conductor formula and coefficient identity are used only in their stated range; no ramified extension follows by assumption. |
| BSD.0/twist-root-number | verified | The coprime global formula is separate from the general local epsilon product; normalized Fricke and elliptic root-number signs agree. |
| BSD.0/base-change-factorization | corrected | Corrected the finite-field extension trace t_(ell²), which differs from the Dirichlet coefficient a_(ell²). Checked all splitting cases and summability before convolution. |
| BSD.0/base-change-central-identities | verified | Native analytic product orders and the product rule give the central formulas, with nonzero factors and the Heegner sign restrictions. |
| BSD.0/rational-newform-bridge | verified | R29.3–R29.6 already own newform, coefficient field, conductor and every bad Euler factor; this is an imported comparison. |
| BSD.0/congruent-number-root-numbers | verified | BT footnote2 supports the residue-class target. Original Birch–Stephens dyadic computation remains an explicitly bounded source obligation, not a completed proof. |
| BSD.1/quadratic-point-maps | verified | Native twist/descent gives the two maps; the combined trace compositions are multiplication by2, retaining integral kernels and cokernels. |
| BSD.1/rank-splitting | corrected | Checked rational eigenspace decomposition and native number-field finite generation; removed a duplicated prerequisite, not a mathematical input. |
| BSD.1/quadratic-regulator-comparison | corrected | Removed the stale missing-height-instance claim and nonexistent Gram export; native determinant and finite-index identities give the squared-index factor, after GZ normalization transport. |
| BSD.1/torsion-comparison | verified | Odd-primary rational/twist decomposition follows after inverting2; dyadic corrections remain integral and are not discarded. |
| BSD.1/odd-selmer-sha-decomposition | verified | Continuous local conditions and restriction/corestriction are required at odd p, with exact compact/discrete suppliers rather than abstract group cohomology. |
| BSD.1/two-primary-comparison | verified | No division by2 is permitted here; the integral restriction/corestriction and finite isogeny-Selmer inputs are separately requested. |
| BSD.1/sha-finiteness-descent | verified | The finite restriction kernel is supplied through finite isogeny Selmer and local compatibility; finite Sha upstairs alone is not the entire argument. |
| BSD.1/tamagawa-base-change | verified | Checked the odd valuation range and split-p hypothesis against Skinner–Zhang9.2; geometric multiplicities are distinguished from rational nonsplit component counts. |
| BSD.1/quadratic-period | corrected | The prototype now uses the integration lattice, native covolume and fractional differential-ideal norm. Published JSW7.1.b gives four covolumes at unit norm; exact dyadic comparison remains a gap. Corrected the reader’s nonexistent covolumeL identifier to the pinned ZLattice.covolume with volume. |
| BSD.1/odd-part-bsd-over-K | verified | The sum-of-valuations conclusion requires rational nonzero quotients and matching ranks; a known summand is needed to deduce the other p-part. |
| BSD.2/heegner-local-conditions | verified | Tests retain D≠1, valid prime data, the dyadic Kronecker rule, sign and ramification. Coarse prescriptions do not themselves prove root-number compatibility. |
| BSD.2/twist-series-residue | verified | MP.8 supplies the exact weighted two-series polar combination and finite test vectors. BFH §9 supplies residue cancellation and squareclass obstruction; no unweighted residue shortcut is used. |
| BSD.2/bfh-nonvanishing | corrected | Read pp.543–544 and614–617 visually. Made D≠1 explicit in the auxiliary exclusion proof and added the primary infinitude locator. |
| BSD.2/prescribed-local-conditions-value-branch | corrected | Retained the full FH theorem as a target with an explicit unread-source/local-template obligation. Removed the invalid splitting-only infinitude shortcut for ramified prescriptions. |
| BSD.2/heegner-field-selection | verified | BFH signs select derivative or nonzero-value twists with odd discriminant and required splitting; finite exclusions handle exceptional imaginary fields. |
| BSD.2/auxiliary-fields-for-prime-parts | verified | Ramified Castella q and supersingular ordinary-support restrictions are honestly separate selection obligations. The direct BSTW endpoint does not prove the old auxiliary-twist argument. |
| BSD.3/heegner-point-nontorsion | verified | The exact GZ.8 height formula and native positivity/height-zero criterion detect infinite order, retaining the relative x-height normalization. |
| BSD.3/heegner-point-eigenspace | verified | Checked Gross Proposition5.3: the Fricke eigenvalue is opposite the functional-equation sign; the selected rational/twist eigenspace is correct. |
| BSD.3/analytic-rank-one-theorem | verified | Nonzero Heegner height plus HE.7 rank-one/full-Sha endpoints, including CM/dyadic branches, yields the rational conclusion by descent. |
| BSD.4/analytic-rank-zero-theorem | verified | The derivative auxiliary twist and rank splitting prove the original curve has rank0; full finiteness descends through the supplied finite kernel. |
| BSD.4/kato-rank-zero-finiteness | verified | Kato14.2(2), p.235, includes every coefficient prime, with §15 supplying CM. The exact Selmer/local-condition extension remains requested from Kato L4. |
| BSD.4/kato-p-part-upper-bound | verified | The bound is one-sided and retains integral large-image/local corrections; it does not assume main-conjecture equality or infer the full formula. |
| BSD.4/analytic-rank-at-most-one-theorem | verified | This is the union of the two distinct rank/finiteness routes, not a leading-term equality. |
| BSD.4/kato-heegner-comparison | verified | The two routes yield the same rank/finiteness statement but their lattices, local inputs and p-primary estimates are not conflated. |
| BSD.5/rank-zero-rationality | verified | MSPL critical-value algebraicity and explicit period/Manin comparison yield rationality; the early BSD.0a placement prevents a finiteness/rationality stage cycle. |
| BSD.5/leading-term-positivity | verified | Central nonnegativity and nonvanishing are separate inputs; the rank-one case uses positive GZ height and a positive nonzero auxiliary value. |
| BSD.5/rank-one-rationality | corrected | Corrected the proof to use (I_K^free)², retaining the factor2 from K-relative height and all period/Manin/unit factors. |
| BSD.5/heegner-index | verified | Full and free indices differ by torsion. Scaling invariance concerns positive multiples on a fixed curve, with non-torsion/finite-index hypotheses in the signatures. |
| BSD.5/heegner-index-height-formula | verified | The free index enters squared; rank-one quadratic regulator transport gives the factor2/4^a. Published JSW misprint does not alter its squared equation. |
| BSD.5/gross-index-formula | verified | Read GZ V.§2 pp.310–312. This is the conjectural index equality expressed as an equivalence with BSD, not an available theorem proving the endpoint. |
| BSD.3a/definite-congruence-period | verified | PW definite CR/surjectivity hypotheses are retained; early BSD.3a provides HE.6 without invoking downstream BSD or an indefinite freeness assertion. |
| BSD.5/ribet-takahashi-degree-comparison | verified | The exact integral character-module freeness/multiplicity-one discharge is still a precise gap/request. Generic Néron exactness or PW definite CR is insufficient. |
| BSD.5/rational-bsd-defect | verified | The definition uses positive rational nonzero data, total real period and Reg_BSD=2^r times the pinned regulator; zero default valuation cannot establish BSD. |
| BSD.5/defect-isogeny-invariance | verified | An actual isogeny, every L-factor and the Cassels arithmetic quotient comparison are required; isogenous-model examples do not assume equal individual invariants. |
| BSD.5/p-part-from-two-bounds | verified | Checked valuation directions: lower Sha bound gives nonpositive defect valuation and upper Sha bound gives nonnegative valuation. |
| BSD.5/sha-bound-from-heegner-index | verified | The index bound stays one-sided with Howard local/parametrization errors; the proved GZ height identity replaces a circular use of the conjectural index equality. |
| BSD.6/cyclotomic-specialization-formula | verified | Skinner §3.2 cancels the anomalous Euler term through the exact finite-control factor. Finite presentations and multiplicative Hida deduction are distinct requests. |
| BSD.6/rank-zero-ordinary-multiplicative-p-part | verified | Skinner C retains p≥3, q≠p, q∥N and residual ramification. Good and multiplicative period comparisons and exceptional-zero input are separate. |
| BSD.6/rank-zero-supersingular-p-part | corrected | BSTW1.5, p.4, gives the stated semistable rank0 endpoint; its twist extension is restricted to ordinary support as in1.3. |
| BSD.6/residually-ramified-prime | verified | Checked the transvection/inertia argument and index2 quadratic restriction at odd p; an everywhere-unramified quotient cannot give the required residual representation. |
| BSD.6/jsw-lower-bound | verified | JSW7.4.1 has the recorded direction. Exact μ, Selmer control, degree and local factors remain explicit rather than silently supplied by rational divisibility. |
| BSD.6/jsw-upper-bound | verified | JSW7.4.2 remains a planned integral bound with Howard errors and the wider supersingular auxiliary-twist proof gap; BSTW1.5 does not repair that range. |
| BSD.6/jsw-rank-one-p-part | verified | The statement retains semistability, good odd p, residual irreducibility and the extra p=3 trace condition; the two inequalities remain separately planned. |
| BSD.6/castella-multiplicative-rank-one-p-part | verified | Read corrected A′: p>3, nonsplit residually ramified q≠p and E(Q_p)[p]=0, allowing additive primes away from p. Auxiliary ramified-twist/control extensions remain gaps. |
| BSD.6a/anticyclotomic-selmer-control | verified | JSW3.3.1 uses the specified relaxed/strict places. Compact/discrete duality, finite Selmer/Fitting and augmentation inputs are precise requests; global derived descent alone is insufficient. |
| BSD.6a/wan-anticyclotomic-divisibility | verified | Rational divisibility, integral μ discharge and excluded height-one primes are distinguished; one-sided inclusions retain the analytic/local normalization. |
| BSD.6a/bstw-two-variable-zeta-element | corrected | All six names/four examples are actual declarations on continuous inverse limits. Corrected source kind and strengthened Lambda-linearity through coefficientwise unramified extension; rational two-class projection and integral lattice obligations remain distinct. |
| BSD.6a/bstw-explicit-reciprocity-laws | corrected | Source Col_v and Log_vbar have distinct domains and analytic targets. Both local maps now retain Lambda-linearity and the same coefficient/period normalization. |
| BSD.6a/bstw-signed-main-conjecture | verified | BSTW1.3 retains its semistable/ordinary-support twist range and p=3 condition. Signed9.18, image indices, excluded primes and both cyclotomic non-torsion inputs remain planned obligations. |
| BSD.6a/bstw-rank-zero-p-part | corrected | BSTW1.5 p.4 is the rank0 endpoint; signed finite-control/Tamagawa/period factors are separately requested rather than inferred from half-logarithms. |
| BSD.6a/castella-anticyclotomic-main-conjecture | verified | Erratum1.1 asserts torsion of X, with ramified Heegner ideal, 2-clause, all nonsplit multiplicative primes and local p-torsion hypotheses retained. |
| BSD.6a/castella-higher-weight-input | verified | Erratum2.1–2.3 retains even weight, level/local-special hypotheses and Σ. FO local type, FW factorization, CGS projection and integral higher-weight extension have distinct owners. |
| BSD.6a/bstw-signed-main-conjecture-comparison | verified | Read BSTW9.18 pp.83–84. Rational comparison is distinct from integral comparison under van_L; the omitted signed proof and cyclotomic (nv) remain explicitly owned. |
| BSD.6a/higher-weight-integral-kolyvagin-bound | verified | The augmentation-prime and C1=C2=0 higher-weight integral extension is an owned target; CGS v2’s elliptic rational theorem is not falsely cited as its proof. |
| BSD.6/bstw-rank-one-p-part | verified | The direct semistable rank1 endpoint is BSTW1.5 p.4, with the separate supersingular p-adic GZ request; no residual irreducibility is added to the source range. |

## Verification and follow-up obligations

- `python3 scripts/check_blueprint.py research/blueprint/packets/RankZeroOneBSD--BSD.0.json`: **0 errors, 0 warnings**. This includes source-issue schema validation.
- `lean-check research/blueprint/suggested/RankZeroOneBSD--BSD.0.lean`: **exit0**, 175 warnings, each a declaration using `sorry`; no errors or other warnings. The final check includes the strengthened signed Λ-linear maps. No subsequent Lean edit was made.
- Reader-to-packet statement matching: all 68 statements match; all API/test names occur in both reader and suggested file. The nine definition inventories total 78/37, and 37 actual example blocks occur.
- All 17 downloaded PDF digests match the recorded full source-version hashes. All seven source issues have this job's independent verdict.
- Internal and both cumulative graph checks give the results above. `git diff --check` passes.

The eight gap titles remain explicit:

1. **Friedberg–Hoffstein Theorem B not read** — Friedberg–Hoffstein, Nonvanishing theorems for automorphic L-functions on GL(2), Annals of Math. 142 (1995), Theorem B, is used through JSW's citation only; the public full text was not acquired for this plan. Its statement (arbitrary prescribed local conditions compatible with sign +1) and the double-cover construction must be read and checked before RankZeroOneBSD:BSD.2/prescribed-local-conditions-value-branch is proved.
2. **Exact powers of 2 in the quadratic period and Tamagawa comparisons** — BSD.1/quadratic-period states Ω_E·Ω_{E^K}·|D|^{1/2} = 2^e·Ω_{E/K} with e determined by c∞(E), c∞(E^K) and the dyadic Néron-lattice change, and BSD.1/tamagawa-base-change is proved for odd p only. The explicit e and the 2-part of ∏_w c_w(E/K) versus c_ℓ(E)c_ℓ(E^K) at dyadic and ramified places are not established; they are needed only for statements at p = 2 (BSD.8/BSD.9).
3. **Birch–Stephens dyadic root numbers not read** — The values w_2(E^(n)) for E : y² = x³ − x and n mod 8 are taken from Birch–Stephens (Topology 5, 1966) through Burungale–Tian's footnote 2; the public full text was not acquired for this plan, and the local computation (or Rohrlich's formula for dyadic potentially good reduction) must be read before RankZeroOneBSD:BSD.0/congruent-number-root-numbers is proved.
4. **Auxiliary ramified twists and supersingular support** — Acquire Friedberg–Hoffstein Theorem B and prove compatible local signs, nonempty prescriptions and the ramified Heegner-ideal conditions. In the Castella choice q|D_K, E^K is additive at q; Skinner C does not follow at that q. In the supersingular JSW upper-bound choice, (D_K,Np)=1 alone does not imply the ordinary-support hypothesis of BSTW1.3/1.5. A direct semistable rank-one BSTW1.5 route is available, but does not validate that old auxiliary-twist proof.
5. **Integral modular-degree comparison hypotheses** — BSD.5/ribet-takahashi-degree-comparison must state and discharge the precise localised character-module freeness/multiplicity-one hypotheses of JSW7.3.2/Ribet–Takahashi. PW’s surjective CR definite theorem and a general character exact sequence are not automatically the irreducible indefinite application. Use geometric ord_ℓ Δ or split-over-K′ Tamagawa numbers, not rational nonsplit c_ℓ.
6. **Castella higher-weight integral extension and Σ comparison** — Prove the extension of CGS v2 6.5.1 from elliptic T_pE to self-dual ordinary T_g, including the augmentation prime and C1=C2=0 under residual irreducibility. Acquire/verify Cha05 Theorem2/Matar–Nekovář0.9 for C1 and CGLS Remark3.3.5 for C2. Separately prove the Σ-imprimitive APL projection and FW/BCK/local-type hypotheses. Do not infer this from the elliptic rational theorem or from the words “in the same way”. Discharge FWv3 4.41’s all-nonsplit ramified-special and absolute residual hypotheses explicitly; its unrestricted version excludes pullbacks of cyclotomic height-one primes.
7. **Signed Proposition9.18 proof not printed** — BSTW v2 pp.83–84 prints the ordinary proof and leaves the supersingular case to the reader. BSD owns the full signed Poitou–Tate/rank/image argument and cyclotomic (nv) specialization. Record this as a source proof gap until written, as RT/30 requires.
8. **Integral signed Selmer/image and cyclotomic control hypotheses** — The signed cohomology and local-map signatures are supplied. Discharge the exact integral Coleman/logarithm image indices, CLW/Wan excluded height-one primes, μ hypotheses and both cyclotomic local non-torsion conditions (nv) in the BSD.6a proof. Continuous H¹ and derived Iwasawa descent supply carriers/global base change; they do not by themselves prove these Selmer control results. Requests to PHR L4, SIC L3, APL L3/L3h and duality R02.4 identify the missing exports. The R29.4 comparison must also match BSTW’s cohomological T_g(1) with geometric T_pE, including the integral lattice index; rational representation comparison alone is insufficient.

These are follow-up mathematical/source obligations, not unfinished review work. The orchestrator should apply the coordinated early placements, preserve the ownership requests and stage `remaining` lists, and create the follow-ups before any stage is declared closed. Packaging must replace bookkeeping/upstream references with the actual lower-layer/import declarations and retain honest scope. No additional question or permission is needed to complete this review. The [handoff](../handoff/REV-RankZeroOneBSD--BSD.0~2.md) records where the next job starts.
