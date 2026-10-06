# Independent review: rank-zero and rank-one BSD, BSD.0–BSD.6a

**Verdict: needs_changes.** This is the finished independent review for `REV-RankZeroOneBSD--BSD.0`, issue #477, by Codex (GPT-6), session `codex-GIiaui`, dated 2026-10-06. The reviewed plan was written by Claude, session `claude-3O23Ua`; the reviewer did not write it. Clear fixes are applied to the [packet](../packets/RankZeroOneBSD--BSD.0.json) and [suggested Lean file](../suggested/RankZeroOneBSD--BSD.0.lean). The [reader](../readmes/RankZeroOneBSD--BSD.0.md) was inspected, but its path is excluded from this issue's deliverables. Its required corrections are listed below.

The eight-stage pass has 68 nodes: 26 corrected, 20 verified, 19 unverifiable, and three added. The original 65 nodes all have an individual verdict. There are 56 retained baseline declarations, 78 API items, 37 tests, 34 planets, 46 requests, ten gaps, seven reviewed source issues, and 15 source-version receipts. All implementation statuses remain `unchecked`. Six stages are `planned`; BSD.1 and BSD.6a are `partial`. The packet status is corrected from `complete` to `partial` because the period construction and signed arithmetic prototype are missing genuine carriers and signatures, rather than merely unproved implementations.

Acceptance is withheld because the 19 unverifiable nodes still have unsupported source/supplier identifications or incomplete arithmetic interfaces. In particular, a real-valued period placeholder and six commented BSTW API names are not the objects required by §§4 and 13. Open stages or honest recorded proof gaps alone would not require this verdict. The source endpoints are not declared false merely because the packet's proposed proofs fail.

## Scope and method

Read the binding blueprint and expansion protocols, WORKERS, UPSTREAM_GUIDE and BROWSER_AGENTS; inspected the reviewed library audit and the upstream EllipticCurves and ModularForms roadmap exemplars. This remains a target-level review: corrections of proof sketches do not produce a lemma-by-lemma decomposition. The three added nodes are indispensable key theorems, not routine proof steps.

Read pinned Lean declarations with surrounding variables and instances at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The available shared Tau Ceti checkout has a different HEAD; pinned statements were therefore inspected from the recorded commit rather than inferred from its HEAD. Read each of the 104 unique external prerequisite entries in the original packet: 84 declaration entries and 20 stage contracts. Read public paper texts at the locators cited by the nodes, including scanned BFH §9 and published JSW p.427 visually. Public-text acquisition did not succeed for Friedberg–Hoffstein 1995 Theorem B or Birch–Stephens' original dyadic computation; their existing gaps are retained with precise consequences.

Every definition/construction, API item, test, planet, requested export, coverage entry and sourceIssue was checked. The node ledger below states whether the source-backed target and its proposed proof interface survived that check; `verified` does not mean that its prerequisites have already been formalised. No upstream Tau Ceti roadmap, supplier packet, atlas file or reader document was edited.

## Corrections that change the mathematics or interface

- **Analytic continuation and completion.** Abscissa at most 3/2 does not establish nonsummability at every point below 3/2. The 11a3 junk-value example now explicitly assumes nonsummability. The completed function is an entire continuation agreeing with the Gamma product on a valid half-plane, with existence, agreement and uniqueness API; defining it by Lean's pointwise Gamma product at Gamma poles gives the wrong values. A new example at zero detects this. The pinned raw Fricke operator is not the normalized involution. The actual pinned `analyticOrderAt_mul` is added for rank additivity.
- **Quadratic arithmetic.** The dyadic Kronecker rule and splitting identification require an owner export. Both compositions of the combined restriction/trace map are [2]; `1+σ` is only the untwisted component and `1−σ` the twisted component. Exponent two alone does not prove finiteness, so a finite isogeny-Selmer comparison is requested. Abstract group cohomology cannot supply continuous Galois/Selmer maps. Unconditional finite torsion is obtained from Mordell–Weil finite generation rather than missing height instances. Skinner–Zhang's Tamagawa comparison retains the hypothesis that p splits in K. Defect comparisons retain rationality, finiteness and known-summand conditions.
- **Periods and nonvanishing.** The period prototype now records the differential-ideal norm and complex covolume normalization, but the geometric carriers are still missing. Removed the vacuous positive-real existential and unsupported universal assertion that a quadratic period differs from a squared real period. Local prescriptions require genuine primes and D≠1, with sign compatibility checked in the actual coprime range. BFH §9 uses a weighted two-vector residue cancellation and a third vector to separate the unwanted pole, not two simultaneously nonzero residue vectors and an unweighted series. Infinitude excludes each previous discriminant at its own ramified prime. Arbitrary ramified prescriptions and supersingular ordinary-support nonvanishing remain unverified.
- **Heegner and rational BSD quantities.** Corrected the double minus sign in the conjugation proof. The Heegner-index API requires non-torsion/finite index where appropriate; I/c is invariant only for positive multiples on a fixed curve. Both full and free indices scale by the positive multiplier, and height uses the square of the free index. Dropped an unsupported explicit denominator bound. The defect uses a positive rational leading coefficient and `Reg_BSD = 2^r regulator`; the two valuation inequalities have opposite signs. Isogeny API now takes an actual pinned `TauCeti.Isogeny`, not equality of coefficient sequences. Kolyvagin's inequality is converted through proved Gross–Zagier with its local errors, never through Gross's BSD-equivalent conjectural equality.
- **Kato and ordinary/multiplicative primes.** Kato 14.2(2), printed p.235, includes the CM proof in §15 and is broader than the present L4 export. The finite-level one-sided bound must not assume a main-conjecture equality. The cyclotomic specialization cancels the extra anomalous Euler factor; it needs nonzero-value and exact Selmer/Fitting control hypotheses. Good-ordinary main conjectures and Skinner's multiplicative Hida deduction have distinct owners/requests. A p∤2N Manin-constant comparison cannot be used at p∥N. Residual ramification at a multiplicative q depends on geometric discriminant multiplicity, not rational nonsplit Tamagawa number.
- **Supersingular and Castella routes.** BSTW's current twist range is narrower than old JSW 7.2.1(iii). The 37a test starts at p≥5, since a₃=−3. Added a direct BSTW 1.5 rank-one route instead of treating it as a repair of the old auxiliary-twist argument. At Castella's ramified q, the twist is additive, so Skinner C cannot be invoked at that q; current GZ.9 also has a narrower semistable range than corrected A′. Signed reciprocity is `Col_v` and `Log_v̄` in BSTW 1.14, printed p.7. In this setting the stronger residual irreducibility over the quadratic field follows locally from good supersingular p>2 (§1.2.1); integral CLW/image/control and cyclotomic nonvanishing still need discharge. The signed Proposition 9.18 proof and higher-weight integral Kolyvagin extension are new owned nodes with explicit gaps.
- **Ownership.** The ordinary two-variable construction, reciprocity and comparison are requested from proposed Kato L5; BSD owns the supersingular versions. CM families are PadicFamilies L4. Two-variable Greenberg Rankin functions and their anticyclotomic BDP projection are distinct APL exports. FW factorization is AC L2, FO local type is R21.3, and CGS projection is APL L3h, with the Σ-imprimitive comparison proved here. Removed the nonexistent FO Corollary 7.2.1 and the presumed ready-made higher-weight integral theorem.

## Baseline audit

Inspected all 56 original entries, plus three added ones: 59 distinct declarations in total. Removed three near misses and corrected six descriptions/hypothesis inventories. The remaining 47 original entries and all three additions were confirmed at the pins. The table includes removed declarations so the audit is reproducible. Module paths are repository-relative to the pinned Mathlib or Tau Ceti repository.

| Declaration | Pinned module | Result | Actual use / qualification |
| --- | --- | --- | --- |
| `mathlib:Algebra.IsQuadraticExtension` | `Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean` | confirmed | An algebra of rank two over a field. |
| `mathlib:AnalyticAt.analyticOrderAt_ne_top` | `Mathlib/Analysis/Analytic/Order.lean` | confirmed | For f analytic at z₀: analyticOrderAt f z₀ ≠ ⊤ iff f = (z − z₀)^n g near z₀ with g analytic and g z₀ ≠ 0. |
| `mathlib:ArithmeticFunction.eulerProduct` | `Mathlib/NumberTheory/ArithmeticFunction/LFunction.lean` | confirmed | The Euler product of a family of local arithmetic functions indexed by primes. |
| `mathlib:Complex.Gammaℂ` | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean` | confirmed | Deligne's archimedean factor Γ_ℂ(s) = 2(2π)^{-s}Γ(s). |
| `mathlib:Int.IsFundamentalDiscr` | `Mathlib/NumberTheory/FundamentalDiscriminant.lean` | confirmed | The predicate of being a fundamental discriminant. |
| `mathlib:IsArithFrobAt` | `Mathlib/RingTheory/Frobenius.lean` | confirmed | σ is an arithmetic Frobenius at a prime Q: σ(x) ≡ x^{#(R/Q∩R)} mod Q. |
| `mathlib:LSeries` | `Mathlib/NumberTheory/LSeries/Basic.lean` | confirmed | The L-series of a coefficient sequence ℕ → ℂ, defined as a tsum. |
| `mathlib:LSeries.abscissaOfAbsConv` | `Mathlib/NumberTheory/LSeries/Convergence.lean` | confirmed | The abscissa of absolute convergence of an L-series, in EReal. |
| `mathlib:LSeries_convolution` | `Mathlib/NumberTheory/LSeries/Convolution.lean` | confirmed | LSeries (f ⍟ g) s = LSeries f s * LSeries g s when both series are summable at s. |
| `mathlib:Module.finrank` | `Mathlib/LinearAlgebra/Dimension/Finrank.lean` | description fixed | The cardinal Module.rank truncated to ℕ; in this packet finite generation/free-quotient or rational tensor hypotheses justify its interpretation as Mordell–Weil rank. It is not zero for every module that is not finite free. |
| `mathlib:Nat.factorial` | `Mathlib/Data/Nat/Factorial/Basic.lean` | confirmed | The factorial n!. |
| `mathlib:NumberField.discr` | `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean` | confirmed | The absolute discriminant of a number field. |
| `mathlib:Submodule.torsionBy` | `Mathlib/Algebra/Module/Torsion/Basic.lean` | confirmed | The a-torsion submodule M[a]. |
| `mathlib:WeierstrassCurve.Affine.Point` | `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean` | confirmed | The group of nonsingular points of an affine Weierstrass curve with the point at infinity. |
| `mathlib:WeierstrassCurve.Affine.Point.map` | `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean` | confirmed | The map on points induced by an algebra homomorphism of the coefficient fields. |
| `mathlib:WeierstrassCurve.HasAdditiveReduction` | `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean` | confirmed | Additive reduction of a minimal Weierstrass equation over a DVR. |
| `mathlib:WeierstrassCurve.HasGoodReduction` | `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean` | confirmed | Good reduction of an (integral, minimal) Weierstrass equation over a DVR. |
| `mathlib:WeierstrassCurve.HasMultiplicativeReduction` | `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean` | confirmed | Multiplicative reduction of a minimal Weierstrass equation over a DVR. |
| `mathlib:WeierstrassCurve.HasSplitMultiplicativeReduction` | `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean` | confirmed | Split multiplicative reduction of a minimal Weierstrass equation over a DVR. |
| `mathlib:WeierstrassCurve.IsElliptic` | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | confirmed | A Weierstrass curve whose discriminant is a unit. |
| `mathlib:WeierstrassCurve.LFunction` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` | confirmed | The L-function of a Weierstrass curve over a number field as the formal Euler product (an ArithmeticFunction ℤ) of the local Euler factors at all height-one primes, computed on minimal models. |
| `mathlib:WeierstrassCurve.LSeries` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` | confirmed | The complex L-series s ↦ LSeries (↑ ∘ W.LFunction) s; a tsum, equal to 0 wherever the series is not summable. |
| `mathlib:WeierstrassCurve.baseChange` | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | confirmed | Base change of a Weierstrass curve along an algebra map. |
| `mathlib:WeierstrassCurve.localEulerFactor` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` | confirmed | The local Euler factor as an arithmetic function, from the inverse power series of the local polynomial. |
| `mathlib:WeierstrassCurve.localPolynomial` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` | confirmed | The local polynomial 1 − aT + qT² (good), 1 − T (split multiplicative), 1 + T (nonsplit multiplicative), 1 (additive) of the minimal model over a DVR. |
| `mathlib:analyticOrderAt` | `Mathlib/Analysis/Analytic/Order.lean` | confirmed | The order of vanishing of a function at a point, in ℕ∞ (⊤ for the zero germ, 0 if not analytic). |
| `mathlib:analyticOrderAt_eq_zero` | `Mathlib/Analysis/Analytic/Order.lean` | confirmed | analyticOrderAt f z₀ = 0 iff f is not analytic at z₀ or f z₀ ≠ 0. |
| `mathlib:analyticOrderAt_mul` | `Mathlib/Analysis/Analytic/Order.lean` | added, confirmed | For analytic scalar functions f and g, analyticOrderAt (f*g) z = analyticOrderAt f z + analyticOrderAt g z. Nonzero germs allow passage to natural orders. |
| `mathlib:analyticOrderNatAt` | `Mathlib/Analysis/Analytic/Order.lean` | confirmed | The natural-number truncation of analyticOrderAt. |
| `mathlib:groupCohomology` | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean` | removed | Abstract discrete group cohomology; no continuous cochains or Kummer local-condition restriction/corestriction. |
| `mathlib:groupCohomology.H1` | `Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean` | removed | Same near miss; not continuous absolute-Galois H¹. |
| `mathlib:iteratedDeriv` | `Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean` | confirmed | The n-th iterated derivative of a function of one variable. |
| `mathlib:padicValRat` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | confirmed | The p-adic valuation of a rational number. |
| `mathlib:quadraticChar` | `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean` | confirmed | The quadratic character of a finite field. |
| `tauceti:Algebra.IsQuadraticExtension.quadraticCharacter` | `TauCeti/FieldTheory/Galois/Basic.lean` | confirmed | The quadratic character (L ≃ₐ[K] L) →* ℤˣ of a quadratic extension. |
| `tauceti:CuspForm.hasEntireExtension_qExpansion_coeff` | `TauCeti/NumberTheory/ModularForms/LFunction.lean` | confirmed | The q-expansion coefficient sequence of a cusp form of positive weight on an arithmetic subgroup has an entire extension (through Mathlib's ModularForm.L). |
| `tauceti:LSeries.HasEntireExtension` | `TauCeti/NumberTheory/LSeries/EntireExtension.lean` | confirmed | a has an entire extension: the abscissa of absolute convergence is finite and some entire F agrees with LSeries a on the convergence half-plane. |
| `tauceti:LSeries.HasEntireExtension.existsUnique` | `TauCeti/NumberTheory/LSeries/EntireExtension.lean` | confirmed | HasEntireExtension a gives ∃! entire F agreeing with LSeries a on the convergence half-plane. |
| `tauceti:LSeries.HasEntireExtension.of_extension_of_eq_on_lt_re` | `TauCeti/NumberTheory/LSeries/EntireExtension.lean` | confirmed | Introduction: finite abscissa plus an entire F agreeing with LSeries a on some half-plane Re s > c gives HasEntireExtension a. |
| `tauceti:LSeries.HasEntireExtension.unique` | `TauCeti/NumberTheory/LSeries/EntireExtension.lean` | confirmed | Two entire extensions of LSeries a on the convergence half-plane are equal. |
| `tauceti:NumberField.isArithFrobAt_multiquadratic_eq_one_iff` | `TauCeti/NumberTheory/Multiquadratic/Frobenius.lean` | description fixed | For odd rational primes not dividing the radicands, an arithmetic Frobenius of the specified multiquadratic field is trivial iff the radicands are quadratic residues. This does not cover dyadic or ramified splitting. |
| `tauceti:TauCeti.Isogeny` | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean` | added, confirmed | The existing isogeny type between affine Weierstrass curves over a field, with coordinate pullback and MapsInfinity. |
| `tauceti:TauCeti.Isogeny.degree` | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean` | added, confirmed | The finite function-field degree of an isogeny, defined by Module.finrank over fieldPullback.fieldRange. |
| `tauceti:TauCeti.frickeOperator` | `TauCeti/NumberTheory/ModularForms/Fricke/Operator.lean` | removed | Raw unnormalized operator; its scalar-square law is not the normalized involution required here. |
| `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight` | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean` | confirmed | Tate's canonical height, normalised as the (O)-height (half the x-height limit). |
| `tauceti:WeierstrassCurve.Affine.Point.exists_baseChange_eq_of_map_eq` | `TauCeti/AlgebraicGeometry/EllipticCurve/GaloisDescent.lean` | confirmed | A point of W(L) fixed by the nontrivial σ ∈ Gal(L/K) of a quadratic extension is the base change of a point of W(K). |
| `tauceti:WeierstrassCurve.Affine.Point.isOfFinAddOrder_of_canonicalHeight_eq_zero` | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean` | description fixed | Height zero implies finite order under ellipticity, AdmissibleAbsValues, DecidableEq and Northcott for canonicalHeight; these instances must be supplied over the chosen number field. |
| `tauceti:WeierstrassCurve.Affine.PointModTorsion` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/PointModTorsion.lean` | confirmed | The Mordell–Weil group modulo torsion. |
| `tauceti:WeierstrassCurve.Affine.fg_point_of_numberField` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean` | confirmed | Mordell–Weil: the point group of an elliptic curve over a number field is finitely generated. |
| `tauceti:WeierstrassCurve.Affine.finite_torsion` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean` | description fixed | Finite torsion under ellipticity, AdmissibleAbsValues, DecidableEq and Northcott for logHeight₁. For an unconditional number-field use, derive finite torsion from fg_point_of_numberField instead of assuming these missing height instances. |
| `tauceti:WeierstrassCurve.Affine.neronTatePairing` | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean` | confirmed | The Néron–Tate pairing, the halved polar form of the canonical height. |
| `tauceti:WeierstrassCurve.Affine.regulator` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/Regulator.lean` | description fixed | Absolute Gram determinant on the free quotient, with height instances and Module.Finite ℤ PointModTorsion. Its self-pairing uses the (O)-height; the BSD regulator is 2^r times this value. |
| `tauceti:WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/Regulator.lean` | description fixed | Rank-zero regulator equals 1 under the same height and finite free quotient instances as regulator. |
| `tauceti:WeierstrassCurve.isElliptic_quadraticTwist` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | confirmed | The quadratic twist of an elliptic curve by a separable quadratic extension is elliptic. |
| `tauceti:WeierstrassCurve.j_quadraticTwist` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | confirmed | Twisting does not change the j-invariant. |
| `tauceti:WeierstrassCurve.quadraticTwist` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | confirmed | The quadratic twist E.quadraticTwist L of a Weierstrass curve over K by a separable quadratic extension L/K, as quadraticTwistOf by the trace and norm of a generator. |
| `tauceti:WeierstrassCurve.quadraticTwistOf` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | confirmed | The twist of a Weierstrass curve over a commutative ring by the quadratic x² − t x + n (discriminant D = t² − 4n), with Δ ↦ D⁶Δ, c₄ ↦ D²c₄, c₆ ↦ D³c₆. |
| `tauceti:WeierstrassCurve.quadraticTwistPointEquiv` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | confirmed | The isomorphism E^L(M) ≃+ E(M) on M-points, for K ⊆ L ⊆ M, induced by the change of variables over L carrying E to its twist. |
| `tauceti:WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | confirmed | Transporting σ ∈ Aut(M/K) through E^L(M) ≅ E(M) multiplies its action by the quadratic character χ(σ\|_L) = ±1. |

In particular, `Module.finrank` is cardinal rank truncated to ℕ, not zero on every non-finite-free module. Height/regulator statements retain their explicit `AdmissibleAbsValues`, Northcott, ellipticity, decidable equality and finite-free-quotient requirements. The pinned multiquadratic Frobenius theorem omits dyadic/ramified primes. These qualifications are applied at the citing nodes, rather than recorded only as bibliography notes.

## Source versions and source mistakes

All listed PDFs were independently read on 2026-10-06 at the cited locators. Hash prefixes below identify the receipts; the packet carries full SHA-256 hashes. This is not a claim of having reread every page of every paper. Published JSW and Castella were compared with their selected preprints. The currently linked author erratum was also checked. Searches for later corrections do not establish that none can exist.

| Source read | Kind | SHA-256 prefix |
| --- | --- | --- |
| [Jetchev–Skinner–Wan v1](https://arxiv.org/abs/1512.06894v1) | preprint | `908562efdddaf46b` |
| [Skinner v1](https://arxiv.org/abs/1407.1093v1) | preprint | `02d176d8fd52b015` |
| [Castella v2](https://arxiv.org/abs/1704.06608v2) | preprint | `23e3ab4e9d99ceba` |
| [Castella author erratum](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf) | author copy | `c04dff16c27bc3ca` |
| [Burungale–Skinner–Tian–Wan v2](https://arxiv.org/abs/2409.01350v2) | preprint | `18e05982cdb2ac57` |
| [Bump–Friedberg–Hoffstein, published](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf) | published | `d50ad2f11c992591` |
| [Gross–Zagier, published](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf) | published | `a9a52cb8662e03f1` |
| [Burungale–Tian v2](https://arxiv.org/abs/2506.03465v2) | preprint | `cbb8284a13ed40bd` |
| [Skinner–Zhang v1](https://arxiv.org/abs/1407.1099v1) | preprint | `50123dc1fb271f61` |
| [Kato, published](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | published | `3c6e14b11fa60262` |
| [Pollack–Weston v1](https://arxiv.org/abs/math/0610694v1) | preprint | `42962ab1de009241` |
| [JSW, published](https://archive.ymsc.tsinghua.edu.cn/pacm_download/253/8639-CJM_05_03_A02.pdf) | published | `5a6978afcb2fad9c` |
| [Castella, published](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2018/0006/0001/CJM-2018-0006-0001-a001.pdf) | published | `737d615e79aa78ce` |
| [Castella–Grossi–Skinner v2](https://arxiv.org/abs/2303.04373v2) | preprint | `5046d7571ed3a1b1` |
| [Gross on Kolyvagin, published](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf) | published | `60b310c58a349486` |

The [official FH 1995 bibliographic page](https://annals.math.princeton.edu/1995/142-2/p04) confirms the paper, but did not supply the full theorem text for this review. JSW's secondary citation is insufficient to verify arbitrary ramified local data. Likewise Burungale–Tian states the congruent-number sign table, but its Birch–Stephens footnote does not replace the missing original dyadic computation.

All seven source issues have verdict `confirmed` with this review's job id. E1/E2 existed before this review; E3–E7 are added here. Misprints are separated from failures of a stated result and proof gaps.

| Issue | Locator | Classification / reach | Finding |
| --- | --- | --- | --- |
| E1 | Theorem A and the proof of Theorem 4.4 (via Theorem 4.2), arXiv:1704.06608v2 = Cambridge J. Math. 6 (2018) 1–23 | error; a stated result | For p ∥ N the theorem holds under the corrected hypotheses of Theorem A′: E[p] irreducible, nonsplit multiplicative reduction at some q ≠ p where E[p] is ramified, and E(ℚ_p)[p] = 0 (semistability no longer needed). Author erratum §1 explicitly withdraws the Hida-specialization step and replaces the multiplicative branch by A′/Theorem1.1; compared with the public published Theorem A. |
| E2 | Theorem 7.2.1(iii) and its attribution, p. 42 ([Wan14b, Cor. 4.8]) | gap; the proof | Use BSTW1.3 and1.5 for semistable curves and only twists supported at ordinary primes as specified there. This repairs that endpoint, not all of the wider coprime-twist range in old JSW7.2.1(iii). BSTW Remark1.4 supersedes the pertinent prior announcement. Independently checked its narrower twist range; the old blanket “same statement” claim was corrected. |
| E3 | Published CJM5 (2017),p.427, sentence immediately after(7.4.c) | misprint; nothing | Use the square of the free index: ⟨z,z⟩=(m_free)² Reg. In this odd-primary application the full index has the same p-part because p-torsion vanishes. Quadratic height scales by the square of the lattice index; equation(7.4.c) on the same page already has m². This is a missing square, not evidence that the endpoint is false. |
| E4 | Author erratum,Theorem1.1,p.1 | misprint; nothing | X_ac(E[p∞]) is Λ-torsion. A characteristic ideal is an ideal in Λ, not the Selmer module; the proof states torsion of X_ac and then its characteristic-ideal equality. |
| E5 | Author erratum,proof of Theorem2.3,p.3,after the Cha05/MN19 citation | misprint; nothing | The second occurrence must be C1=0; C2=0 was established in the preceding sentence. The immediately preceding sentence identifies C1 as the restriction-kernel exponent; the argument needs both constants zero. This does not verify the cited higher-weight extension. |
| E6 | Proof of Theorem2.3,pp.3–4,(2.2),using CGS23 Theorem5.5.1(v2 6.5.1) | gap; the proof | Prove the higher-weight T_g extension, including the augmentation prime and C1=C2=0. CGS§6 is elliptic and its displayed bound is rational; it does not directly supply the higher-weight integral conclusion. The missing extension is now its own BSD.6a node and gap. |
| E7 | arXiv2409.01350v2,§9.3.2,proof of Proposition9.18,printed p.84 | gap; the proof | Write out the signed Poitou–Tate/image/rank comparison and cyclotomic specialization with(nv). The proof presented is ordinary. The supersingular analogue has different signed image corrections and is an owned proof obligation, not supplied by an ordinary proof citation. |

E3's missing square is confined to the published prose immediately after (7.4.c); the neighboring equation already contains the square. E4 and E5 are clear type/constant-label slips. E6 and E7 remain proof obligations and do not assert that the corrected endpoints are false. No author messages were sent.

## External suppliers and closure

The original packet's 104 unique external references were inspected in their actual supplier documents. Counts are unique references per owner, including stage contracts. Their statements are imported as plans; their names do not certify the exact extra hypotheses or integrality demanded here.

| Owner | References checked | Exact referenced exports |
| --- | --- | --- |
| ArithmeticGaloisDuality | 2 | `R02.4/poitou-tate`, `R02.4/restricted-product-cohomology` |
| AutomorphicCongruences | 3 | `L2`, `L2s`, `L5a` |
| AutomorphicPadicLFunctions | 2 | `L3h`, `L4e` |
| ClassicalArithmeticCompletion | 2 | `CA.1/kronecker-character`, `CA.1/kronecker-character-is-primitive` |
| DiophantineApproximationAndTranscendence | 1 | `DT.5` |
| EllipticCurveModularity | 8 | `R29.3/newform-of-E`, `R29.3/rational-coefficient-field`, `R29.4/bad-euler-factors`, `R29.4/exact-conductor`, `R29.4/tate-module-comparison`, `R29.5/modular-parametrisation`, `R29.6/l-function-continuation`, `R29.6/modularity-theorem` |
| EulerSystemsAndKolyvaginSystems | 3 | `ES.4/howard-descent-with-errors`, `ES.4/rubin-bound`, `ES.4/variant-bounds` |
| GL2AutomorphicRepresentationsAndTransfer | 2 | `R16.3`, `R17.3` |
| GeneralizedHeegnerCycles | 1 | `GH.7` |
| GrossZagierAndArithmeticHeights | 19 | `GZ.0/bsd-regulator`, `GZ.0/gram-determinant-rescaling`, `GZ.0/heegner-unit-index`, `GZ.0/height-convention-dictionary`, `GZ.0/real-period-components`, `GZ.0/x-height-canonical-height`, `GZ.3`, `GZ.5`, `GZ.8/derivative-corollaries`, `GZ.8/elliptic-curve-heegner-height-formula`, `GZ.8/explicit-gross-zagier-formula`, `GZ.9/bdp-measure-integrality`, `GZ.9/bdp-p-adic-l-function`, `GZ.9/bdp-weight-two-heegner-formula`, `GZ.9/bloch-kato-logarithm-of-heegner-class`, `GZ.9/imprimitive-function-dictionary`, `GZ.9/multiplicative-prime-formula`, `GZ.9/p-optimal-quotient-formula`, `GZ.9/quaternionic-weight-two-formula` |
| HeegnerPointEulerSystems | 12 | `HE.0/dihedral-conjugation`, `HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`, `HE.1/parameter-choice-and-degree`, `HE.4/complex-conjugation-parity`, `HE.6/primitivity-versus-nonzero`, `HE.6/sha-square-index-bound`, `HE.7/almost-all-primary-sha-vanishing`, `HE.7/classical-full-sha-finiteness`, `HE.7/dyadic-integral-conjugation-descent`, `HE.7/non-torsion-point-prime-divisibility`, `HE.8`, `HE.8b` |
| KatoEulerSystems | 7 | `L2/p-adic-zeta-elements-and-their-norm-relations`, `L3/generalised-explicit-reciprocity-law-for-zeta-elements`, `L3/zeta-class-interpolation-of-complex-L-values`, `L4/cohomological-divisibility-one-direction`, `L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`, `L4/nonvanishing-of-the-zeta-submodule-at-height-zero`, `L4/ordinary-selmer-divisibility` |
| MetaplecticAutomorphicForms | 8 | `MP.7`, `MP.8/bsd2-export`, `MP.8/fourier-residue-interchanges`, `MP.8/local-test-nonzero-f`, `MP.8/local-test-nonzero-m`, `MP.8/local-test-nonzero-tau`, `MP.8/two-variable-polar-combination`, `MP.8/two-variable-twist-series` |
| ModularIwasawaMainConjectures | 3 | `L0`, `L1`, `L4` |
| ModularSymbolsPadicLFunctions | 5 | `L1/critical-value-algebraicity`, `L1/integral-period-lattices`, `L1/period-lines`, `L4/half-logarithms`, `L4/plus-minus-decomposition` |
| NeronModelsAndSemistableAbelianVarieties | 8 | `R11.4/characters-graph-homology`, `R11.4/component-cokernel`, `R11.4/integral-monodromy-pairing`, `R11.6/character-exact-sequences`, `R11.6/degeneracy-functoriality`, `R11.6/equation-component-comparison`, `R11.6/equation-minimal-differential`, `R11.6/semistable-differential-basechange` |
| PadicFamilies | 2 | `L1/family-measure`, `L3` |
| PadicHodgeRegulators | 8 | `L3/crystalline-regulator`, `L3/explicit-reciprocity`, `L3/rubin-coleman-map`, `L4/actual-coleman-image`, `L4/integral-image-index`, `L4/regulator-coordinate-decomposition`, `L4/signed-local-condition`, `L4/split-multiplicative-augmentation` |
| RankZeroOneBSD | 1 | `BSD.7a` |
| SelmerIwasawaCohomology | 6 | `L3/iwasawa-cohomology`, `L3/iwasawa-descent`, `L3/iwasawa-shapiro`, `L3/iwasawa-torsion-criterion`, `L3/semilocal-cohomology`, `L4/greenberg-main-conjecture` |
| SerreWeightAndLevelOptimisation | 1 | `R20.2` |

The critical supplier mismatches and corrected boundaries are these:

| Supplier | What the inspected statement gives | What this packet must separately request or prove |
| --- | --- | --- |
| EC Layer 7 / abstract H¹ | Continuous Selmer/Sha is an upstream target; Mathlib group cohomology is abstract. | Continuous restriction/corestriction and local conditions; finite isogeny Selmer and locally trivial descent. |
| GZ.0 and Néron R11.6 | Height/period and differential-ideal targets with missing number-field instances. | Genuine period-lattice and ideal carriers; height instances and exact factor-of-two bookkeeping. |
| GZ.3 / Néron character exactness | Modular realization and character sequences. | Integral localized multiplicity-one/freeness and degree comparison under the actual JSW application hypotheses. |
| Kato L4 | Existing non-CM/Hyp(v) or good-ordinary statements. | Kato 14.2(2) including CM/all-prime finite-level comparison, and one-sided bound without assuming equality. |
| SIC L3 | Derived global Iwasawa descent / specialized acyclicity. | Specific Selmer augmentation control, Fitting presentations and no-finite-submodule statements. |
| Duality R02.4 | Finite-module Poitou–Tate nine-term sequence. | Compact Tate/discrete p-divisible and completed Λ-adic versions with transition and local-annihilator exactness. |
| HE.7 | Kolyvagin rank/finiteness endpoints with its own source gaps. | Exact JSW 4.4.1 Shimura-curve bound and all local/parametrisation errors; dyadic descent is a different export. |
| MI L0/L1 and proposed p∥N layer | Good-ordinary versus multiplicative input ranges. | Retain auxiliary q and residual conditions; distinct Hida-family deduction and period integrality at p∥N. |
| APL L3/L3h | Two-variable Rankin–Greenberg versus toric BDP function. | Integral lattice/period normalization, actual μ hypotheses, and squared versus square-root convention. |
| PadicFamilies L4 / PHR L4 | CM-family / signed local regulator targets. | Actual integral CM lattice and both split-prime signed image comparisons, not a rational one-variable basis statement. |
| CLW/Wan divisibility | One-sided, sometimes localized, theorem with auxiliary/local hypotheses. | Remove exceptional-prime and μ errors before claiming an integral equality. |
| GZ.9 | Ordinary/multiplicative semistable optimal BDP export. | Additive-away-from-p corrected Castella extension, and separately supersingular Gross–Zagier for BSTW 1.5. |
| AC L2 / R21.3 / APL L3h | FW factorization / FO local special type / CGS projection. | Keep distinct owners and full local factors; BSD owns Σ-imprimitive and higher-weight integral applications. |

There are 18 appended requests, as well as refinements to existing requests, for a total of 46. Each records the supplier, exact needed statement/hypotheses and consuming node ids. The missing period geometry, signed signatures, higher-weight extension, integral degree comparison, ramified/supersingular auxiliary choices, FH source and dyadic source are also gaps. These are substantive omissions; they have not been hidden behind arbitrary proposition parameters.

The three added nodes, all tagged `addedBy: REV-RankZeroOneBSD--BSD.0`, are:

| Added node | Source / role | Remaining obligation |
| --- | --- | --- |
| BSD.6a/bstw-signed-main-conjecture-comparison | BSTW v2 Proposition 9.18; signed ideal/image/rank comparison. | Write the supersingular proof left to the reader, including van_L and cyclotomic (nv). |
| BSD.6a/higher-weight-integral-kolyvagin-bound | Castella erratum Theorem 2.3 / CGS v2 §6. | Extend the elliptic rational bound to the actual higher-weight integral representation, including augmentation and C1=C2=0. |
| BSD.6/bstw-rank-one-p-part | BSTW v2 Theorem 1.5, printed p.4. | Import the supersingular Gross–Zagier and control inputs; do not conflate this endpoint with the older JSW auxiliary-twist proof. |

### Cumulative dependency check

The packet's own graph has 68 nodes and 177 direct internal edges and is acyclic. Projected packet prerequisites were then added to the existing atlas stage graph, with supplier-to-consumer orientation and duplicate edges removed. This checks the atlas plus this packet, not every unimplemented request or every other packet's internal graph.

| Graph tested | Edges | Cyclic components |
| --- | --- | --- |
| Existing atlas | 3,458 | 0 |
| Atlas plus corrected packet | 3,525 | 1: BSD.4 ↔ BSD.5 |
| Atlas plus packet and three proposed early placements | 3,544 | 0 |

The first two proposals do not remove the BSD.4/BSD.5 cycle. The cumulative acyclic placement uses all three: (1) BSD.3a definite congruence periods before HE.6; (2) signed BSD.6z zeta element, reciprocity and Proposition 9.18 before AC L5a, with ordinary construction owned by Kato L5; and (3) BSD.0a rational modular-symbol periods exporting the current BSD.5 rank-zero rationality theorem before Kato's upper bound. The rationality proof needs BSD.0/modular-symbol/parametrisation/period inputs, not rank-zero finiteness. These are proposals in the packet; none is applied to atlas data. The orchestrator must repeat the check when deciding and implementing actual stage contracts.

## API, tests, suggested Lean and planets

| Definition/construction | API items | Tests | Prototype assessment |
| --- | --- | --- | --- |
| BSD.0/actual-l-function | 10 | 4 | Named declarations and examples present; elaboration unavailable |
| BSD.0/completed-l-function | 11 | 5 | Named declarations and examples present; elaboration unavailable |
| BSD.0/analytic-rank | 10 | 5 | Named declarations and examples present; elaboration unavailable |
| BSD.1/quadratic-point-maps | 10 | 4 | Named declarations and examples present; elaboration unavailable |
| BSD.1/quadratic-period | 7 | 3 | Seven signatures use explicit owner data placeholders; geometric carrier gap |
| BSD.2/heegner-local-conditions | 9 | 4 | Named declarations and examples present; elaboration unavailable |
| BSD.5/heegner-index | 7 | 4 | Named declarations and examples present; elaboration unavailable |
| BSD.5/rational-bsd-defect | 8 | 4 | Named declarations and examples present; elaboration unavailable |
| BSD.6a/bstw-two-variable-zeta-element | 6 | 4 | Six names/four examples remain comments; actual carrier gap |

All nine constructions/definitions have at least three packet tests. The inventory has 72 named API declarations and 33 named examples present in the suggested file, plus the explicitly reported six/four BSTW comment entries, for the packet totals 78/37. Static name matching is not elaboration. Period tests now detect the fixed factor 4 and differential-ideal norm under stated data assumptions; they do not validate the absent geometric carrier. Other corrections include an actual isogeny hypothesis, local-prime validity, dyadic character behavior, non-torsion Heegner divisibility and a general local-epsilon root formula with a separate semistable trace helper.

Finite point counting independently checks `y²=x³+x+1` over F₅: 9 points, nonsquare twist 3 points, traces −3 and +3; a square twist has 9 points. For 37a over F₃ the count is 7 and a₃=−3, so p=3 fails the proposed a_p=0 supersingular test. These checks support the stated examples without numerical L-value approximations.

The 34 planets are key objects/named results, with at most six in any parent layer. Counts by parent are BSD.0:6, BSD.1:5, BSD.2:3, BSD.3:2, BSD.4:2, BSD.5:6, BSD.6:5, BSD.6a:5. The additional signed comparison, higher-weight bound and direct rank-one theorem receive mathematical names, not proof-step labels.

`lean-check` was attempted before and after correction, with 102–104 GB available. Each attempt stopped before elaboration: the shared build lacks the object for `TauCeti.NumberTheory.LSeries.EntireExtension`. The final suggested file is **not compiled**. No dependency build, cache fetch, new Lake project, language server or substitute import was used. The original handoff's scratch-stub check does not establish elaboration against the real pinned imports. This environment failure is reported separately from the mathematical/signature defects and is not the sole reason for `needs_changes`.

## Confirmed red-team findings and reader synchronization

The issue asks to check both packet and reader. Only packet/suggested/report are writable. The following is the exact remaining reader synchronization request, including all six findings.

| Finding | Corrected packet handling | Reader assessment / required change |
| --- | --- | --- |
| RT/4 | Separate multiplicative Hida deduction and good-ordinary MC; cancel anomalous factor; exact control and p∥N period export. | Cyclotomic specialization section still carries the extra anomalous factor (near line 1573); separate finite Selmer/Fitting and multiplicative period requirements. |
| RT/14 | Keep q∥N, q≠p and residual ramification for Skinner–Urban. | Preserve these hypotheses and distinguish the good-ordinary source from FW 1.6 and Skinner multiplicative deduction. |
| RT/15 | Owned higher-weight integral node, distinct FW/FO/CGS owners, Σ/local/C1,C2 gaps. | Replace presumed ready BSD.7a supply (near line 1987), FO Cor 7.2.1 attribution (near 2029), and final assertion that /15 is fixed (near 2053). |
| RT/16 | Separate central-value nonnegativity and positive height; then nonvanishing gives positivity of each term. | Core positivity argument is sound; keep explicit nonzero rational defect, factorial and 2^r regulator conventions in the synchronized API. |
| RT/17 | Manin comparison at p∤2N and separate p∥N input; exact degree/freeness hypotheses remain. | Add multiplicative period request and geometric component multiplicities; do not claim the current degree suppliers already discharge all integral hypotheses. |
| RT/30 | Ordinary Kato L5, signed BSD comparison with recorded omitted proof, source Col_v/Log_v̄ labels. | Replace ordinary/signed ownership and reversed labels, final /30-fixed claim (near 2056), and two-export-acyclic claim (near 2061). |

Additional reader edits, identified by section/name so they survive line changes:

1. **Opening counts/coverage and actual L-function.** Update 65→68 nodes, 73→78 API items, 36→37 tests, 31→34 planets, 28→46 requests, 4→10 gaps and 2→7 source issues. Mark BSD.1/BSD.6a partial. At the actual-L section (near lines 60 and 108), remove unconditional below-abscissa nonsummability and the unconditional 11a3 junk-value assertion.
2. **Completed L-function** (near line 113). Replace the global pointwise Gamma definition and raw Fricke reference with entire continuation, valid-half-plane agreement, existence/uniqueness, normalized involution and the test at zero. Synchronize the general local-epsilon product versus semistable trace helper and actual-isogeny APIs.
3. **Quadratic base change.** Correct the combined trace compositions; add continuous local-condition and finite isogeny-Selmer requirements; retain split p in the Skinner–Zhang Tamagawa application and corresponding defect comparison. Replace vacuous/false period signatures by the recorded norm/covolume API and carrier gap.
4. **BFH and field selection.** Use the weighted residue argument and per-discriminant infinitude proof. Keep FH original-text, ramified-q compatibility and supersingular ordinary-support requirements as gaps.
5. **Heegner, Kato and rationality.** Fix the Fricke/conjugation proof sign, non-torsion/full/free index conditions and scaling. Remove the unsupported denominator bound. Correct Kato's p.235/all-prime/CM statement, avoid equality-assuming one-sided specialization and request the early rationality placement.
6. **Prime-part theorems.** Remove the claim that current BSTW has the same range as old JSW 7.2.1(iii) (near line 1628); change the 37a p≥3 example to p≥5 (near 1737); add the separate direct BSTW 1.5 rank-one theorem. Record the additive ramified-q obstacle and semistable/additive GZ.9 mismatch for Castella A′.
7. **Anticyclotomic support.** Correct torsion of X_ac rather than its characteristic ideal (near 1951), preserve relaxed-v/strict-v̄, and distinguish finite Poitou–Tate, derived global descent and Selmer/Fitting control. Add signed Prop 9.18 and the higher-weight integral theorem with precise gaps.
8. **Final closure/prototype summary** (near line 2071). Remove the claim of a complete prototype/closed supplier chain. List the six API/four example comment entries, actual carrier deficiencies, cumulative three-export proposal and the final uncompiled status.

The reader mismatch is recorded in `upstreamNotes` and this report. It is an authorized-scope limitation, not a request to modify another deliverable without permission.

## Per-node review ledger

Node ids below omit the common `RankZeroOneBSD:` prefix. The packet carries the same ledger and individual `reviewNotes`. A corrected verdict identifies a clear repair; an unverifiable verdict identifies an outstanding proof/source/interface obligation, even where the source endpoint itself is correctly stated.

| Node | Verdict | Independent check / correction |
| --- | --- | --- |
| BSD.0/actual-l-function | corrected | Unique entire continuation is supported by the pinned EntireExtension API. Removed the unsupported assertion of nonsummability everywhere Re s ≤ 3/2 and made the junk-value test conditional. |
| BSD.0/completed-l-function | corrected | Corrected a false global pointwise Gamma definition; added continuation existence/agreement/uniqueness and a pole test. Removed the unnormalised pinned Fricke operator as the involution supplier. |
| BSD.0/analytic-rank | verified | Analytic order, nonzero germ and real leading coefficient follow from entire continuation, Euler-product nonvanishing and conjugation. The ℕ∞ nonzero-germ condition is explicit. |
| BSD.0/root-number-parity | verified | The functional equation forces Taylor-order parity after removing the analytic nonvanishing Gamma/conductor factor near 1. |
| BSD.0/quadratic-field-character | corrected | Kept the true character/splitting target; added the missing dyadic identification request and limited the pinned Frobenius citation to its actual hypotheses. |
| BSD.0/finite-field-twist-trace | corrected | Checked odd trace counting and the characteristic-two exceptional fibres. The F₅ test for y²=x³+x+1 has 9 points, twist 3, traces −3 and +3. |
| BSD.0/twist-local-factors | verified | Local unramified twist identities use Tate-module inertia; ramified twists of good/multiplicative curves become additive, including dyadic primes via the requested local supplier. |
| BSD.0/twist-l-series | verified | Conductor ND² and coefficient twisting are restricted to (D,N)=1; bad Euler factors and newform level are supplied by R29.4. |
| BSD.0/twist-root-number | verified | The χ_D(−N) root formula is restricted to coprime conductor/discriminant and uses the requested local epsilon-factor export. |
| BSD.0/base-change-factorization | verified | Checked split/inert/ramified grouping by ideal norm, convolution only in the summable half-plane, and product continuation. |
| BSD.0/base-change-central-identities | corrected | Added the actual pinned analytic-order product theorem rather than citing the order definition as the product formula. |
| BSD.0/rational-newform-bridge | verified | R29.3/R29.4 supplier statements include integral rational coefficients and bad Euler factors; uniqueness transports the entire continuation. |
| BSD.0/congruent-number-root-numbers | unverifiable | The global residue-class table is stated in Burungale–Tian, but the original dyadic computation has not been acquired; retained as an explicit gap. n=1 is the untwisted model, not a quadratic field. |
| BSD.1/quadratic-point-maps | verified | Checked descent, fixed/anti-fixed ranges and 2P decomposition against pinned point maps and quadratic twist equivariance. |
| BSD.1/rank-splitting | verified | Finite generation makes the 2-killed kernel/cokernel finite; rational tensoring yields rank additivity. |
| BSD.1/quadratic-regulator-comparison | verified | Checked K-relative heights, orthogonality and index-squared Gram determinant; kept the recorded missing number-field height instance. |
| BSD.1/torsion-comparison | corrected | Replaced a height-dependent finite_torsion citation by unconditional Mordell–Weil finite generation. |
| BSD.1/odd-selmer-sha-decomposition | corrected | Removed abstract Mathlib group cohomology as a continuous Galois/Selmer supplier; EC Layer 7 must export continuous restriction/corestriction preserving each Kummer local condition. |
| BSD.1/two-primary-comparison | corrected | Corrected both compositions of the combined map to 2; added finite isogeny-Selmer/local-condition export instead of deducing finiteness merely from exponent 2. |
| BSD.1/sha-finiteness-descent | corrected | Unconditional finite-generation descent is sound once EC Layer 7 supplies continuous inflation–restriction on locally trivial classes; removed the abstract H1 baseline citation. |
| BSD.1/tamagawa-base-change | corrected | Restored p split in K from Skinner–Zhang Corollary 9.2, including a valid argument at ℓ=p. |
| BSD.1/quadratic-period | unverifiable | Removed the unsupported universal Ω_K≠Ω_E² test and the vacuous existential covolume signature. The actual period-lattice/Néron-ideal carriers are still placeholders, so the construction is not fully prototyped. |
| BSD.1/odd-part-bsd-over-K | corrected | Made rationality/rank/finiteness assumptions explicit, retained split p from the Tamagawa supplier, and corrected the equivalence to use a known summand. |
| BSD.2/heegner-local-conditions | corrected | Added prime validity and D≠1 to the suggested prescription, and excluded vacuous compatibility at ramified conductor primes. Corrected the explicit dyadic Kronecker helper also at odd residues 7 mod 8, and matched the general coprime prescription formula in the signature. Added admissible_congr to make the API insensitive to behaviour values outside the prescribed prime set. |
| BSD.2/twist-series-residue | corrected | Replaced the unsupported simultaneous nonzero-vector/unweighted-series argument by the actual §9 two-vector cancellation and third-vector separation; checked pp.614–617 visually. |
| BSD.2/bfh-nonvanishing | corrected | Corrected the infinitude argument: exclude each old discriminant using its own ramified prime; BFH §9 also proves infinitude by the squareclass-pole obstruction. |
| BSD.2/prescribed-local-conditions-value-branch | unverifiable | Friedberg–Hoffstein Theorem B itself was not acquired, and the packet infers arbitrary ramified prescriptions from a narrower coprime root formula. Preserved the theorem as an unverified target with a precise source/hypothesis gap. |
| BSD.2/heegner-field-selection | verified | BFH handles all conductor primes together with any finite T; enlarging by 2 and discarding finitely many discriminants gives the stated odd/coprime field selection. |
| BSD.2/auxiliary-fields-for-prime-parts | unverifiable | The prescribed-local source, ramified Castella sign calculation and supersingular support selection are not supplied. Removed automatic coprime/sign and multiplicative-twist inferences by recording these exact obligations. |
| BSD.3/heegner-point-nontorsion | verified | The GZ supplier gives a positive explicit height factor and non-torsion criterion under the stated Heegner data; height-zero uses the recorded height instances. |
| BSD.3/heegner-point-eigenspace | corrected | Corrected the double sign in the Fricke-to-conjugation proof; the final σ(y)=−w_E y+t statement already had the right sign. |
| BSD.3/analytic-rank-one-theorem | verified | Verified the reduction to a simple-zero L(E/K,s), the appropriate eigenspace, rank splitting and Sha descent. HE.7 is an all-prime/CM proof target with separately recorded source gaps, not a completed clean odd-prime proof. |
| BSD.4/analytic-rank-zero-theorem | verified | Verified the reduction to a simple-zero L(E/K,s), the appropriate eigenspace, rank splitting and Sha descent. HE.7 is an all-prime/CM proof target with separately recorded source gaps, not a completed clean odd-prime proof. |
| BSD.4/kato-rank-zero-finiteness | unverifiable | Kato14.2(2) printed p.235 supports the endpoint, but present L4 exports are narrower and do not include the CM/local-condition comparison. Added the exact all-prime export request. |
| BSD.4/kato-p-part-upper-bound | unverifiable | Removed the circular equality-assuming specialization and the good-ordinary supplier used at every good/multiplicative prime; requested the actual finite-level one-sided bound. Stage projection exposes BSD.4↔BSD.5; added an early rationality-export proposal, rather than asserting that the existing placement is acyclic. |
| BSD.4/analytic-rank-at-most-one-theorem | verified | Case split analytic rank 0/1 gives the stated unconditional endpoint from the two requested Heegner theorem branches. |
| BSD.4/kato-heegner-comparison | corrected | Qualified the overstatement that a Heegner-index bound cannot be expressed in L(E,1); Gross–Zagier can convert it with additional auxiliary factors. |
| BSD.5/rank-zero-rationality | corrected | Removed an unsupported explicit denominator divisibility claim; the modular-symbol and Néron-period proof does justify rationality. |
| BSD.5/leading-term-positivity | verified | Verified separate central-value nonnegativity and positive Gross–Zagier height, with nonvanishing, as required by RT/16. Positivity of the product alone would not suffice. |
| BSD.5/rank-one-rationality | verified | The GZ height formula, index-squared regulator identity and auxiliary nonzero rational value give positive rational rank-one normalization. |
| BSD.5/heegner-index | corrected | Restricted I/c invariance to positive multiples on a fixed curve; added non-torsion and finite-index hypotheses to divisibility/generator signatures. |
| BSD.5/heegner-index-height-formula | corrected | Verified the free-index squared identity. Added the published JSW p.427 missing-square misprint to sourceIssues; the packet formula itself was already correct. |
| BSD.5/gross-index-formula | corrected | Added non-torsion/base-change analytic rank one to the conjecture equivalence; retained its conditional status and distinguished it from an index inequality. |
| BSD.3a/definite-congruence-period | verified | Pollack–Weston CR/surjectivity and odd definite parity retained. General Néron character exactness does not supply localised multiplicity-one/freeness; existing exact-export request remains essential. |
| BSD.5/ribet-takahashi-degree-comparison | unverifiable | Corrected rational versus geometric component factors. The stated endpoint still needs a exact multiplicity-one/freeness export with its full hypothesis discharge. |
| BSD.5/rational-bsd-defect | verified | Positive rational defect has correct torsion denominator, factorial convention and 2^r regulator normalization. Every claimed identity is restricted to analytic rank≤1. |
| BSD.5/defect-isogeny-invariance | corrected | Kept Cassels isogeny invariance as EC Layer7 import. Suggested signature now takes an actual pinned TauCeti.Isogeny; equality of L-coefficients alone is not an arithmetic isogeny hypothesis. |
| BSD.5/p-part-from-two-bounds | verified | Checked valuation signs: upper Sha bound gives nonnegative defect valuation and lower gives nonpositive; positivity/nonzero defect excludes padicValRat zero junk. |
| BSD.5/sha-bound-from-heegner-index | corrected | Removed a circular rewrite by Gross’s BSD-equivalent conjectural index equality; use the proved height formula and retain Howard’s local/parametrisation errors. |
| BSD.6/cyclotomic-specialization-formula | corrected | Cancelled the erroneous extra anomalous Euler factor; added nonzero-value/finite-order guards and exact Selmer control/Fitting requests. |
| BSD.6/rank-zero-ordinary-multiplicative-p-part | corrected | Skinner C keeps a multiplicative residually ramified q≠p. Good-ordinary MC and the Hida-family multiplicative deduction are separate requests; added p∥N Néron-period integrality rather than applying a p∤N Manin theorem. |
| BSD.6/rank-zero-supersingular-p-part | corrected | Retained the narrower correct BSTW ordinary-support twist range; removed the false assertion that it equals old JSW7.2.1(iii). |
| BSD.6/residually-ramified-prime | corrected | Restored good p/q≠p and corrected nonsplit rational Tamagawa versus geometric discriminant multiplicity. |
| BSD.6/jsw-lower-bound | unverifiable | The endpoint has the stated JSW hypotheses; the proof still needs the exact μ/height-one discharge and corrected integral degree comparison. Recorded those obligations rather than treating the supplier titles as their proofs. |
| BSD.6/jsw-upper-bound | unverifiable | The old supersingular auxiliary twist may fall outside BSTW’s ordinary-support range, and the cited dyadic/Howard suppliers do not establish the required JSW bound. A direct BSTW1.5 rank-one endpoint is separately added. |
| BSD.6/jsw-rank-one-p-part | unverifiable | The source endpoint is correctly stated. Corrected the 37a acceptance to p≥5 (a₃=−3); added the direct BSTW rank-one route. Its ordinary proof still inherits the recorded upper/lower-bound obligations. |
| BSD.6/castella-multiplicative-rank-one-p-part | unverifiable | A′ hypotheses match the erratum, but its written reduction to rank-zero Skinner C fails at the ramified q, and the GZ.9 supplier is semistable only. These are proof gaps, not a claim that A′ is false. |
| BSD.6a/anticyclotomic-selmer-control | unverifiable | Checked relaxed-at-v/strict-at-v̄ convention against JSW2.3.4. Added the missing Selmer augmentation/Fitting and compact/discrete Poitou–Tate interfaces; current generic descent is not a finite-control theorem. |
| BSD.6a/wan-anticyclotomic-divisibility | unverifiable | Ordinary and semi-ordinary suppliers have different auxiliary/local and integrality conditions; recorded the unproved μ and excluded-prime discharge rather than claiming a universal integral divisibility. |
| BSD.6a/bstw-two-variable-zeta-element | unverifiable | Restricted ownership to the supersingular element and corrected the two primes and CM-family supplier. Six API names/four tests were only comments; their actual arithmetic carrier/signatures are still missing. |
| BSD.6a/bstw-explicit-reciprocity-laws | unverifiable | Corrected Log to the conjugate prime and the page7 locator, and restored the actual two-variable analytic function owner; common integral signed normalization remains a requested proof obligation. |
| BSD.6a/bstw-signed-main-conjecture | unverifiable | Added the missing signed Proposition9.18 comparison and distinguished its van_L hypothesis from Proposition1.19’s stronger irr_L. In this supersingular setting irr_L follows from the local representation at split p (BSTW §1.2.1); the actual integral CLW, image/control and cyclotomic (nv) discharges remain unproved. |
| BSD.6a/bstw-rank-zero-p-part | unverifiable | The r=0 BSTW endpoint is correctly stated, but derived Iwasawa descent/half-logarithms are not signed Selmer control with all Tamagawa and Néron-period factors. Added the precise local-control request. |
| BSD.6a/castella-anticyclotomic-main-conjecture | unverifiable | Corrected torsion of the module rather than its characteristic ideal and retained the Hida specialization/local-type/Fitting obligations. Higher-weight integral and additive-range gaps remain. |
| BSD.6a/castella-higher-weight-input | unverifiable | Removed the false ready-made higher-weight integral CGS import and nonexistent FO corollary; restored distinct factorization, projection and local-type owners. The integral extension/local/Σ proof is not supplied. |
| BSD.6a/bstw-signed-main-conjecture-comparison | added | Added the key signed comparison, with the omitted-source-proof gap and actual van_L/(nv) conditions. |
| BSD.6a/higher-weight-integral-kolyvagin-bound | added | Added the owned higher-weight integral extension rather than importing an elliptic rational theorem; proof obligations remain explicit. |
| BSD.6/bstw-rank-one-p-part | added | Added the exact direct rank-one BSTW endpoint and its supersingular GZ/control requests; this does not repair the old wider twist proof. |

## Checks and next decisions

`python3 scripts/check_blueprint.py research/blueprint/packets/RankZeroOneBSD--BSD.0.json` reports **0 errors, 0 warnings**. The source-issue and source-version validators report zero errors. Static API/example inventory and per-node/coverage uniqueness checks pass. `git diff --check` passes. The cumulative dependency counts and cycle scope are given above. Lean elaboration is blocked at the missing import object, with no running Lean process left behind.

Questions for the orchestrator, in implementation order:

1. Apply the three early exports cumulatively, resolving the BSD.4/BSD.5 cycle and ordinary/signed ownership before downstream placement. Correct RT/30's reversed prime labels against the source.
2. Assign genuine period-lattice/differential-ideal and signed cohomology/Selmer/regulator carriers to their existing owners, then complete the corresponding suggested signatures/examples. These are the two partial stages.
3. Obtain FH Theorem B and a dyadic local-root proof, and choose a valid path for the ramified Castella and old supersingular auxiliary-field arguments. The direct BSTW rank-one endpoint is separately available.
4. Supply exact finite Selmer/Fitting/control, integral degree, p∥N period, signed Prop 9.18 and higher-weight integral exports under the hypotheses listed in the 46 requests and ten gaps; do not equate supplier titles with those exports.
5. Synchronize the reader with this packet and rerun the independent checks, including real pinned-import elaboration when the shared build supplies the missing object.

This review is complete and records its verdict in the packet. The remaining work is revision of the reviewed plan; no second job was claimed.
