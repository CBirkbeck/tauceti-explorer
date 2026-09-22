# REV-PAPER-COUVEIGNES-20 — independent review of the Couveignes extraction

**Verdict: accept, with two status corrections made in place.** Reviewer: Claude Code, session `cc-fb70e5`, 21 September 2026. The extraction under review is by Codex (`codex-a71f92`), continuing a checkpoint merged in #1213. This reviewer did no part of it.

**Paper.** Jean-Marc Couveignes, *Enumerating number fields*, Annals of Mathematics 192 (2020), 487–497, DOI 10.4007/annals.2020.192.2.4.

- The publisher PDF (https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf) was fetched on 21 September 2026. Its SHA-256 matches the one the extraction records (`8d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104`). All eleven pages were read.
- The arXiv source of 1907.13617 (the version arXiv serves, source dated 30 August 2019) was also read and compared. The published text (revised 10 August 2020) states Theorem 1 and Propositions 1–2 with the root discriminant δ_K where the arXiv text used d_K^{1/n}. It also expands the comparison with Schmidt and Ellenberg–Venkatesh and mentions Lemke Oliver–Thorne's later improvement. The extraction follows the published version, as it should.

**Checks run.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-COUVEIGNES-20.result.json` reports `ok` on the corrected file.
- Library claims were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Every cited stage was checked against the accepted restructures in `data/restructure/` and against `data/roadmap-retirements.json`. None is dropped or retired. ArithmeticStatistics ST.0 is narrowed by RS-07, but it keeps "discriminant/general-height orderings ... bounded-height finiteness".

## 1. Items

The inventory is complete. It covers the following:

- Theorems 1 and 2, and Propositions 1 and 2.
- Every step of §2, including the successive-minima argument and the product-span argument that uses that O_K is a domain.
- Every step of §3: double points and well-poised first jets, the Alexander–Hirschowitz input, the integer parameter choice, the relation lattice, the dual-image and Gram-determinant estimate, Minkowski's second theorem for relations, truncation of the last n − 1 relations, and one Jacobian minor at every conjugate.
- Every step of §4: the central-binomial parameter choice, the coefficient count and the isolated-point Bézout bound.

The statements match the published text, including the exact height bound of Proposition 2: ℓ^{ℓ/2n}·C(d+r,d)^{1/2}·(n²d(r+1))^d·δ_K^{2d}.

One observation was checked in detail. The published text bounds the maximal minors of the first-jet matrix by degree ≤ dn(r+1) *in each* u_{i,j}. The extraction notes that their total degree is also ≤ dn(r+1), because every entry has total degree ≤ d in the u's. That is right, so either the per-variable box lemma or the total-degree Schwartz–Zippel theorem gives the integer choice in [0, dn(r+1)]^{nr}.

## 2. Statuses

**Library (10 as submitted, all confirmed).** Every cited declaration exists under its full name at the pinned commit and provides the item:

| Area | Declarations |
|---|---|
| Discriminants | `NumberField.discr`, `discr_ne_zero`, `rootDiscr`, `discr_eq_discr_of_algEquiv` |
| Embeddings and norms | `NumberField.canonicalEmbedding` and `canonicalEmbedding.norm_le_iff`; `NumberField.mixedEmbedding`, `mixedEmbedding.finrank`, `latticeBasis`, `fundamentalDomain_integerLattice`, `norm_eq_norm` |
| Covolumes | `mixedEmbedding.covolume_integerLattice`, `volume_fundamentalDomain_latticeBasis`; `ZLattice.covolume_div_covolume_eq_relIndex`, `covolume_eq_det_mul_measureReal`, `covolume_eq_measure_fundamentalDomain` |
| Polynomials | `MvPolynomial.restrictTotalDegree`, `mem_restrictTotalDegree`, `basisRestrictSupport`, `schwartz_zippel_totalDegree` |
| Étale algebras | `Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension`, `Algebra.IsStandardSmoothOfRelativeDimension`, `Algebra.Etale.iff_exists_algEquiv_prod` (Mathlib/RingTheory/Etale/Field.lean:271) |

The extraction correctly treats Mathlib's covolume of O_K as a near miss for the canonical-measure statement. Mathlib uses unweighted complex coordinates, which differ by 2^s.

**Planned (2 as submitted, both confirmed).**

- `minkowski-second` is planned by GeometryOfNumbersAndQuadraticArithmetic GN.1, which states "Prove Blichfeldt and Minkowski first/second theorems ... export actual inequalities and existence witnesses".
- `field-count-carrier` is planned by ArithmeticStatistics ST.0, which states "height/discriminant orderings ... weighted versus unweighted counts. Prove finiteness at bounded height".

**Missing (37 as submitted).** Each was searched in pinned Mathlib and Tau Ceti. Two are in Mathlib:

- **`grid-nonvanishing`.** `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` (Mathlib/Combinatorics/Nullstellensatz.lean:67) is the combinatorial Nullstellensatz form. Over an integral domain, a polynomial with degreeOf i P < #(S i) for every variable that vanishes on the product of the finsets S i is zero. With S i = {0, …, D} in characteristic zero this is the item exactly. The extraction's note said no such declaration existed.
- **`integer-gauge-lower-bound`.** `NumberField.house α = ‖canonicalEmbedding K α‖` (House.lean:39) is the maximum of |φ(α)| over all embeddings, by `house_eq_sup'`. `NumberField.one_le_house_of_isIntegral` (line 88) proves 1 ≤ house α for nonzero integral α. The paper's gauge on K_R is the maximum over the r + s places, which is the same number.

Other near misses were checked, and the items remain missing:

- `hadamard-gram`: Mathlib's `Matrix.det_le` is a crude entrywise bound. The "Hadamard" files concern the entrywise product and Hadamard matrices, not Hadamard's determinant inequality.
- `euclidean-ball-bound`: `InnerProductSpace.volume_ball` gives the exact Gamma-function volume, not the cube-in-ball estimate.
- `bounded-polynomials`: pinned Mathlib has no homogenisation map and no dimension formula C(d+r, d) for `restrictTotalDegree`.

## 3. Corrections made in place

1. **`grid-nonvanishing`** changed from `missing` to `library`, citing `mathlib:MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`. It was removed from route 3, and the route's brief now points to that lemma instead of calling it "a small API consequence".
2. **`integer-gauge-lower-bound`** changed from `missing` to `library`, citing `mathlib:NumberField.one_le_house_of_isIntegral` and `mathlib:NumberField.house_eq_sup'`. It was removed from route 4.

The corrected file has 49 items: 12 library, 2 planned and 35 missing. Every missing item is routed exactly once.

## 4. Routes

All four routes are accepted, with reasons in `PAPER-COUVEIGNES-20.review.json`.

1. **Source of GeometryOfNumbersAndQuadraticArithmetic GN.0 and GN.1.** The four routed lattice facts are covolume and successive-minima consequences that those layers own.
2. **Source of SchemeAndStackFoundations SF.0 and SF.5.** These are the Jacobian-open component extraction and the refined Bézout bound for isolated points. Fulton, Chapter 13, is the source SF.5 already names.
3. **New roadmap, GenericDoublePointInterpolation.** It is justified: no layer mentions multivariate Hermite interpolation, fat points, Alexander–Hirschowitz or secant varieties of Veronese varieties. The brief exports only the exception-free case d ≥ 5 in characteristic zero, as used, and names the low-degree base cases the induction needs.
4. **Part II of tauceti:Completed/EffectiveBounds.** It is justified. That Tau Ceti roadmap's stated summit is "an explicit upper bound on the number of number fields of bounded discriminant", and Couveignes' Theorem 2 is a sharper theorem in exactly that direction. ArithmeticStatistics ST.0 and ST.3 are carrier and consumer, not owners of the small-model construction.
