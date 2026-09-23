# PAPER-BINYAMINI-22: Point counting for foliations over number fields

Gal Binyamini, *Forum of Mathematics, Pi* 10 (2022), e6, 1–39, [DOI 10.1017/fmp.2021.20](https://doi.org/10.1017/fmp.2021.20).

**Revision required.** The independent review by Codex, session `codex-hjdg0j`, issue #1388, read the whole published article and corrected the extraction in place. The original extraction was by Claude Code `cc-fb70e5`, issue #1387. This extraction remains **partial**, with explicit proof and source obligations; the review itself is complete. See the [review report](../reviews/REV-PAPER-BINYAMINI-22.md) and [route verdicts](PAPER-BINYAMINI-22.review.json).

The revised inventory has **89 items: 5 library, 5 planned and 79 missing**, six routes, 17 definition/construction API outlines, 51 mathematical planning tests and 23 independently checked source issues. Every missing item is assigned once. A structural checker passing does not certify a mathematical proof.

## Source and main targets

The [published open-access PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/D8B743946064FC7DDE59131375AF9465/S2050508621000202a.pdf/point_counting_for_foliations_over_number_fields.pdf) was read in full on 2026-09-23, including §§1–10, Appendix A and references. The downloaded copy has SHA-256 `496daec438801763434e5ee4c5046708b3c309576e27b9c857a4250e192b379f`. Cambridge inserts a download stamp, so this hash need not match the original worker’s copy. Selected mathematical pages were checked visually. [arXiv v1](https://arxiv.org/pdf/2009.00892v1), SHA-256 `7a86ef7a34df7feac8038175c30dbd40b25f43450ad95fd691aa97445026700c`, was consulted for selected comparisons; it was not read in full in this review.

For an algebraic foliation over a number field, Theorem 1 states a polynomial bound in degree, logarithmic height, log radius and log inverse distance to the bad-intersection locus for isolated leaf intersections. Theorem 2 gives a cover of the half-sized leaf ball by halved Weierstrass polydiscs, with polynomially bounded number and degrees. Theorem 3 covers algebraic points by irreducible **Q-subvarieties** arising from nearby leaves. Its degree parameter is the **joint field degree** of the tuple. Theorem 4 gives polynomial dependence on both algebraic degree and logarithmic height for the transcendental part of an R_RE-definable set.

The applications are effective simultaneous torsion on elliptic squares (Theorem 6), polynomial bounds and a polynomial-time algorithm for André–Oort on powers of Y(1), with an ineffective Siegel constant (Theorem 7), and elliptic torsion degree bounds (Theorem 8). Appendix A proposes inhomogeneous Fuchsian growth estimates. The higher-dimensional abelian-variety argument in §10.4 is a sketch conditional on a quantitative covering announced there as work in progress.

These remain the paper’s stated targets. The review found gaps and false intermediate statements in their printed proofs; it does not infer that the main counting or Diophantine theorems are false.

## Corrections affecting construction

- The original projective-height citation was wrong. The scalar absolute height already exists as `NumberField.absLogHeight₁`; its minimal-polynomial formula and the paper’s coordinate-maximum convention are a separate DT.0 comparison.
- Definitions hidden in theorem bundles and all numbered grouped lemmas are separated. Lemmas 38 and 44–47, the CM lift degree bound, metric packing comparisons, Schwarz–Pick and Gronwall are explicit items. Some compound geometric constructions still need source-complete decomposition, as G4 records.
- Proposition 22 cannot globally contain a codimension-one variety in a pure codimension-two complete intersection. Its uses beyond the allowable codimension need a replacement on the good locus, not just an added hypothesis.
- Lemma 11 needs every sheet of the resultant fibre inside the neighbourhood on which the multiplicity-operator bound holds. A second sheet on which the last function vanishes gives an identically zero resultant despite a simple common zero at the centre.
- Lemma 19 switches from polynomial images to inverse-image equations. The shear `(u,v)↦(u,v+u²)` produces opposite parabola germs in the two formulas. The codimension proof must be repaired for the actual parameter family.
- Use the positive-dimensional weakly special locus, a sum of CM discriminants, and joint CM degree at most `2^n`. Duke’s one-coordinate theorem is applied by marginal estimates and a union bound on a suitably chosen product compact set.
- Put the extra Fuchsian normalization in the growth statements, fix the companion-vector dimension and disc radius, and retain the inhomogeneous forcing term when chaining estimates.
- Lemma 27’s monomial-count factor fails for a fifth root of unity; the corrected `(d+1)^(m+1)` bound follows from the product formula. Lemma 26 needs a nontrivial coefficient-size range.

## Library and supplier boundaries

The pinned baseline is Mathlib `082e2d3` and Tau Ceti `f790474`. The scalar absolute-height construction, Jensen inequality, metric packing-covering comparisons, disc Schwarz–Pick and real-path Gronwall bound are imported. The exact integer Siegel lemma does not provide real-matrix approximate small values. Tau Ceti’s canonical-height comparison for a fixed elliptic curve does not by itself provide Zimmer’s explicit dependence on coefficient heights.

DT.0 owns the common height normalization. RP.0 receives the explicit canonical/naive-height adapter; **ArakelovGeometryAndAbelianHeights R35.5** owns the Faltings/Legendre height comparison, including the reverse direction needed in Theorem 8. The effective counting extension must reuse the quantitative CM-height direction proposed in the accepted `PAPER-TSIMERMAN-18` extraction, rather than rebuilding its arithmetic.

The old prerequisite named the wrong Masser–Zannier paper. The relevant [2012 paper](https://doi.org/10.1007/s00208-011-0645-4), *Torsion points on families of squares of elliptic curves*, is bibliography [38]. Exact imported proof passages still need acquisition where G3 says so.

## Routes

1. **REJECT.** The functional-transcendence import is not stated precisely enough in the original extraction. The 2010 Masser–Zannier citation is wrong, and the proof needs algebraic independence over the period/base field, not the weaker original assertion. Obtain the exact 2012 Lemma 5.1 and the original modular Ax–Lindemann input; /70–71 are application lemmas.

2. **REJECT.** The ownership direction DT.0/DT.1/DT.3 is appropriate, but the exact real matrix norm, interpolation constants and Brownawell bound/source are not yet pinned. An accepted source route must supply those statements before the blueprint builds on them.

3. **ACCEPT.** After separating /89, /34 is a concrete Legendre Picard–Fuchs calculation with the moving-endpoint boundary term; the exact differential identity is independently checked. PS.8 receives the family-specific calculation and imports C5 relative Gauss–Manin comparison.

4. **ACCEPT.** Narrowed to the explicit number/function-field height-comparison adapter at RP.0, building on the existing pinned canonical-height construction. The Faltings/Legendre comparison is separately imported from R35.5 as /54.

5. **ACCEPT.** AN.4 is the owner for the analytic Siegel class-number lower bound. The revised item explicitly imports CM.3 for the orbit identification and the order conductor/class-number formula, and retains the ineffective constant.

6. **REJECT.** Do not create a design job from the current brief. E10–E12 leave essential local-resultant and general-position/complete-intersection proof obligations, /48 is only an announced-covering sketch, and /44 must reuse the quantitative CM-height direction. Main targets are retained without claiming their supplied proofs are complete.

## Source issues

All original E1–E8 were checked independently. E2 now records a proof-affecting error; E8 no longer claims that the rest of the paper is automatically unaffected. New E9–E23 record further failures. Every entry has a confirmed verdict and an explicit reason or counterexample in the JSON. Corrections were searched for on the journal page, the sole arXiv version history, the author’s publications page and Crossref metadata on 2026-09-23; none was found. This is not a claim that no correction exists anywhere.

- **E1** (misprint; affects nothing): Lemma 15 and proof, (34)–(35), p.11 (published version). S(X ∩ B², ε) ≤ (2^{2m}/c(m)) vol(X) ε^{−2m}, from vol(X ∩ B_p) ≥ c(m)(ε/2)^{2m}.
- **E2** (error; affects the proof): §4.4, p.14 and proof of Proposition 22, p.15 (published version). Restrict to the part of Σ_Ṽ lying over M ∖ Σ_V (resp. over the p with dim(V ∩ L_p) < n − k): Z := Clo π_Φ(Σ_Ṽ ∖ π_M^{-1}(Σ_V)).
- **E3** (misprint; affects nothing): Proof of Lemma 40, p.30, and §9.3, p.31 (published version). δ(V^ws) = poly_n(δ_V); "according to Proposition 39".
- **E4** (misprint; affects nothing): §8.6, (108), p.27 (published version). #A(1, h) = poly(δ_C, log R̂, h).
- **E5** (misprint; affects nothing): §8.6, p.27, and §10.3, p.34 (published version). A := Mat₂ₓ₂(ℝ) ∩ Φ(B̂² ∩ V) in §8.6 (Φ = U ∈ Mat₂ₓ₂), and A := (ℂ² × ℝ²) ∩ Φ(B̂² ∩ V) in §10.3 (Φ = (x, y, u₁, u₂) with real (u₁, u₂)).
- **E6** (misprint; affects nothing): Theorem 8, p.21 (published version). p ∈ E(K̄); n = poly([K:ℚ], h_Fal(E), [K(p):K]).
- **E7** (misprint; affects nothing): Definition 49, (153), p.36 (published version). ∠L := max_{j=1,…,n} ‖a_j(t)‖/‖a₀(t)‖.
- **E8** (error; affects a stated result): Proposition 51 and Theorem 9, Appendix A, pp.36–37 (published version). For the proposed repair assume that L and L+1 are Fuchsian, and fix the literal pullback and reduced-rational-coefficient norm. This holds for the Legendre operator (87). Complete the rational-norm comparison and use the corrected companion-jet argument E13. Retain the inhomogeneous forcing when chaining estimates (E16). No blanket assertion about Theorems 1–8 follows from this local repair.
- **E9** (misprint; affects a stated result): §2 before Proposition 7, p.9 (published version). Use multiplicity infinity at a nonisolated common zero; retain multiplicity zero outside the common zero set.
- **E10** (error; affects a stated result): Lemma 11 and proof, p.10 (published version). Require every point of the resultant fibre to lie in the local ball B′ on which Lemma 8 controls F. Replace Ω_n(s) and O_n(ρ) claims by the actual polynomial-in-k ball and exceptional-set bounds until proved. Quantitative construction of the polydiscs needed later remains a gap.
- **E11** (error; affects a stated result): Proposition 22, (50), p.15; uses in §§5.2 and 6.2 (published version). A global containment statement requires m≤codim_M V. For applications with larger m, formulate and prove a replacement on the good locus, removing components forced into the bad locus. Restore ΣF in the global bad-locus equality. The necessary dimension restriction alone is not a proved repair.
- **E12** (error; affects the proof): Proof of Lemma 19, (49), p.14, compared with (46) (published version). Use the image of the selected linear subspace under Φ(x)−Φ(0), as (46) gives. Equations of that image use the local inverse of Φ, whose coefficients are not generally degree-D polynomials. Supply a codimension proof for the actual image-parameterized family.
- **E13** (error; affects a stated result): Lemma 48, (147)–(150), p.35 (published version). Use the n-dimensional vector (f,…,f^(n−1)) for the companion system. Recover derivative n from Lf=b. State the displayed radius-free estimate on a normalized unit disc, or retain the path-length factor on general discs; use 1+A to bound the companion entries.
- **E14** (error; affects a stated result): §9.3 after (125), p.30 (published version). Choose K as a product of one-coordinate compact continuity sets with a strict measure margin, and apply Duke to each marginal with a union bound. Include the finite set of representatives for bounded coordinate discriminants. Do not assert arbitrary-product-set equidistribution.
- **E15** (misprint; affects a stated result): (127), p.30, and the choice of g on p.31 (published version). Use the joint-degree bound 2^n and g=2^n. Polynomial asymptotics with n fixed are unchanged.
- **E16** (error; affects a stated result): Appendix A after Theorem 9, (163), p.37 (published version). Carry an additive term controlled by the forcing b through the chain of discs. The homogeneous expression is available only when b=0 (or an explicit bound absorbs the forcing into the initial data).
- **E17** (misprint; affects nothing): Definition of V^ws, §9.2, p.29 (published version). Specify positive-dimensional weakly special subvarieties.
- **E18** (gap; affects the proof): Theorem 6, pp.20–21; functional-transcendence use pp.26–27 (published version). Exclude relations for all (n,m)∈Z²\{(0,0)}, as needed for independence of the two sections.
- **E19** (misprint; affects the proof): Proof of Lemma 40, (123)–(124), p.30 (published version). Use an upper bound for log^+||pσ|| (and the lower bound for log|P(pσ)|) for the gradient estimate. The absolute-height averaging argument supplies both on a suitable large subset.
- **E20** (error; affects a stated result): Proposition 17, p.12, under the §3 setup of a pure m-dimensional analytic set (published version). Require m<n for this complementary-ball assertion. Treat m=n separately when proving Corollary 18. Use 1+vol(X) in the quantitative bound unless a positive volume lower bound is assumed.
- **E21** (error; affects a stated result): Lemma 27, (69), p.19 (published version). Replace d^(m+1) by a valid bound on the monomial count, for example (d+1)^(m+1), or use the coefficient l1 norm. The product-formula proof then gives the bound in item /30.
- **E22** (misprint; affects a stated result): Lemma 26, (62), p.18 (published version). State a nontrivial parameter range N≥2 and d≥1, or insert positive cutoffs and reprove the bound. Also use max(1,||Φ||) in estimates for all monomials up to degree d.
- **E23** (error; affects a stated result): Corollary 14, (32), p.11, with the height convention of §1.1.4 (published version). Include the complexity of the chosen tuple P in the lower bound, or require a specified normalization and δP≤poly(δξ,δV). Intrinsic Chow height of V alone cannot control the size of an operator applied to arbitrary defining equations.

## Validation and remaining work

The paper and intake checkers, dependency/supplier checks and exact five-file scope check are run for submission. Exact symbolic checks cover the Legendre differential identity, the resultant Jacobian and zero sheet, the shear mismatch, the forcing/scaling examples and a degree-eight quadratic compositum. No Lean file was written or compiled; this review has no Lean deliverable.

- **G1**: Prove a quantitative local-polydisc construction with all resultant fibres in the Lemma-8 control ball; track k-dependence and radii throughout §5.1. E10 is not repaired by an unrelated smallness assertion. Include the chosen-equation heights in Corollary 14 or prove the normalization bound required by E23.
- **G2**: Repair the image/inverse incidence in Lemma 19, the good-point projections, and the over-codimension use of Proposition 22. State the replacement with all ambient and singular-locus hypotheses.
- **G3**: Acquire exact full proofs of the imported Thue–Siegel/interpolation, functional-transcendence and CM orbit inputs; pin norm conventions, constants, independent base fields and nonmaximal orders. Original extraction cites the wrong Masser–Zannier paper.
- **G4**: Finish declaration-level definitions, uses, APIs and at least three discriminating tests for every definition/construction, including definitions still hidden inside theorem bundles. This review adds concrete API/test outlines; it does not certify source-complete determinant, bundle, j-foliation or affine-chart constructions.
- **G5**: Reuse the quantitative CM-height direction of PAPER-TSIMERMAN-18 and the R35.5 height-comparison supplier; acquire the higher-genus covering merely announced in §10.4 before treating /48 as proved.
- **G6**: Decompose the mutual dimension induction and effective slope argument with explicit constant dependence. The current dependencies name mathematical inputs, not an elaborated well-founded proof.
