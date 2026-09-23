# REV-PAPER-BINYAMINI-22

**Verdict: revise.** Independent reviewer: Codex, session `codex-hjdg0j`, issue #1388, 2026-09-23. Original worker: Claude Code `cc-fb70e5`. The bot confirmed this session’s claim before work began. This is a finished review, not a checkpoint or acceptance of the main proposed extension.

The four named deliverables are corrected in place; the only additional repository file is this job’s handoff. The extraction has 89 items, six routes, 17 API outlines and 51 planning tests. Routes 3–5 are accepted after narrowing their ownership; routes 1, 2 and 6 are rejected. G1–G6 identify what revision must establish.

## Evidence read

The full [published article](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/D8B743946064FC7DDE59131375AF9465/S2050508621000202a.pdf/point_counting_for_foliations_over_number_fields.pdf), pp.1–39, was read, including all proofs and references. Mathematical page images were inspected at pp.4,9–11,14–15,19,30,35–37. Its timestamped SHA-256 is `496daec438801763434e5ee4c5046708b3c309576e27b9c857a4250e192b379f`. Selected arXiv-v1 passages were compared; the [version history](https://arxiv.org/abs/2009.00892) lists no later version. The [author page](https://binyamini.wordpress.com/publications/), journal correction search and [Crossref record](https://api.crossref.org/works/10.1017/fmp.2021.20) showed no correction notice. No private or paywalled source was used.

Every original item received an independent query across both pinned Lean trees, current atlas layer descriptions and new-roadmap documents. Candidate hits were inspected for relevance: “Fuchsian” group geometry does not provide Fuchsian differential-operator slopes; Morse gradient Łojasiewicz is not Brownawell’s arithmetic estimate; Weierstrass elliptic equations and nonarchimedean division are not complex Weierstrass polydiscs. The related reviewed library-coverage entries and each cited supplier description were read. No theorem was classified as built from a name alone.

## Pinned declaration checks

- `mathlib:Projectivization.logHeight` — `Mathlib/NumberTheory/Height/Projectivization.lean:51`: **near miss**. Relative projective height; not absolute scalar height or the coordinate-maximum tuple convention.
- `mathlib:NumberField.absLogHeight₁` — `Mathlib/NumberTheory/Height/NumberField.lean:146`: **exact scalar construction**. Defined via NumberField.absMulHeight₁ at line 137, normalized over Q(x); comparison API is separate.
- `mathlib:AnalyticOnNhd.sum_divisor_le` — `Mathlib/Analysis/Complex/JensenFormula.lean:390`: **exact with item /24 hypotheses**. Requires M≥1, nonzero centre value and analyticity near the closed disc.
- `mathlib:Int.Matrix.exists_ne_zero_int_vec_norm_le` — `Mathlib/NumberTheory/SiegelsLemma.lean:155`: **near miss**. An integer matrix with more columns than rows and an exact kernel vector; not real approximate small values.
- `mathlib:Metric.packingNumber_two_mul_le_externalCoveringNumber` — `Mathlib/Topology/MetricSpace/CoveringNumbers.lean:330`: **exact component**. Combine with externalCoveringNumber_le_coveringNumber (128) and coveringNumber_le_packingNumber (354).
- `tauceti:TauCeti.PoincareDisc.dist_map_le` — `TauCeti/Analysis/Complex/Conformal/Poincare/SchwarzPick.lean:132`: **exact disc metric contraction**. The period-ratio application also needs coordinate changes and the selected branch.
- `mathlib:norm_le_gronwallBound_of_norm_deriv_right_le` — `Mathlib/Analysis/ODE/Gronwall.lean:134`: **exact real-path bound**. The complex radial path and companion-system adapter are still /49.
- `tauceti:WeierstrassCurve.Affine.Point.abs_canonicalHeight_sub_naiveHeight_le` — `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean:196`: **near miss for explicit Zimmer dependence**. Exists a bound for the fixed curve, comparing canonical height with half the naive x-height. Does not state the required coefficient-height bound.

The five library items are /3, /24 and /63–65. The planned items /45, /53–54 and /76–77 import GN.4, DT.0, R35.5 and LD.6. The source routes read LD.6, DT.0/DT.1/DT.3, PS.8, RP.0 and AN.4; PS.8’s shared relative comparison is imported from C5. Generic field, scheme, abelian-variety and CM ring-class-field objects are not reconstructed in the counting extension.

## Original item-by-item review

| Item | Result of source/status check |
|---|---|
| 1 | The definitions on p.2 match. Add regular-locus and shrinking APIs; affine localization of rational fields is still part of the construction gap. |
| 2 | Separate Lemma 21 as /66; do not conflate scalar coefficient height and Chow height. |
| 3 | Wrong declaration replaced by the existing NumberField absolute scalar construction; formula/tuple comparison is /53. |
| 4 | Keep expected-dimension and isolated-intersection variants distinct; tests detect a tangent invariant leaf. |
| 5 | Finite proper projection and ramification degree are preserved; tests include w²=z. |
| 6 | Main statement retained as a target with explicit local-resultant/general-position proof gaps. |
| 7 | The arbitrary-codimension reduction cannot use unrestricted Proposition 22 after E11. |
| 8 | The source covers B² by the halved polydiscs, not merely B∩V; main proof remains conditional on repaired induction inputs. |
| 9 | Correct Qbar to Q, joint degree and ξ-radius; split Definitions 4 and (10) as /55–56. |
| 10 | No-positive-dimensional-block specialization matches p.5; it depends on Theorem 3. |
| 11 | Separate R_RE and algebraic part as /76–77. The imported logarithmic-height estimate is weaker in degree than Theorem 4. |
| 12 | The proof on p.5 uses Proposition 28 and the earlier Wilkie paper directly; do not introduce a false dependence on Theorems 1–3. |
| 13 | Split Proposition 7 and Lemma 12; fix infinite multiplicity and record determinant-level construction gap. |
| 14 | Split Lemmas 8 and 9 (/85); preserve polynomial k-dependence and exceptional-set total radius. |
| 15 | Counterexample to the printed arbitrary-polydisc statement; add fibre-containment hypothesis, separate resultant /69, and retain G1. |
| 16 | Matches Theorem 5 on regular proper-intersection points; not a library theorem. |
| 17 | Separate Corollary 14 as /86; equations are on the regular chart and singular points must be restored. |
| 18 | No Diophantine Brownawell theorem found. Tau Ceti’s Morse gradient inequality is a different statement. Retain DT.3 route for revision with exact bound and source. |
| 19 | Split circle covering /87; import baseline metric counts /63; retain the corrected Lelong packing constant. |
| 20 | Split Corollary 18 as /88; require m<n for the complementary ball, add a positive size cutoff. |
| 21 | Split polynomial reparametrization /78; full-rank matrices require a quasi-affine/affine-chart treatment. |
| 22 | Separate /79 and /80; E2 alone does not repair the image/inverse error. |
| 23 | Dimension counterexample establishes a false published quantifier; repaired good-locus statement is not established. |
| 24 | The pinned Jensen declaration is read; add 0<r<R, M≥1, analytic-neighbourhood hypothesis and multiplicities. |
| 25 | Require f not identically zero; maximum-ratio Jensen adapter remains missing. |
| 26 | Preserve the complex radial Crofton formula for analytic sets in the unit ball as cited, rather than substituting real affine Crofton. No library match found; obtain Chirka’s full proof. |
| 27 | Matches Proposition 24; this is analytic division with bounded transverse monomials, not polynomial division or nonarchimedean Weierstrass preparation. |
| 28 | Real small-value approximation is not the pinned integer exact-kernel theorem. Add positive dimensions/parameter and record matrix-norm/source check. |
| 29 | Normalize small parameters and norm. The interpolation exponent/tail constants need a full source check before route acceptance. |
| 30 | The printed d^(m+1) constant fails for P=1+y1 and a fifth root of unity (E21). Replace it by (d+1)^(m+1), proved by the product formula; keep joint degree and maximum scalar height. |
| 31 | Specify upper bounds and positive cutoffs; relies on the unresolved interpolation constants, not a library theorem. |
| 32 | Correct Q-blocks; its use of Proposition 22 with codimension n−m+1 needs G2. |
| 33 | Make the relation an all-integer relation; no claims that the proof is already repaired. |
| 34 | Separate the principal bundle as /89, spell out the boundary term, verify the exact differential identity; PS.8 with C5 import. |
| 35 | Split Lemmas 30–33 into /35,/82–84 and correct the Masser–Zannier reference. |
| 36 | Do not rebuild the existing canonical height. Explicit dependence is an RP.0 adapter; Faltings comparison is /54 at R35.5. |
| 37 | Separate baseline Schwarz–Pick /64; the period/logarithm growth remains the application, with normalized ODE and paths. |
| 38 | Separate local consequences /70–71; an algebraic-independence input is needed, not merely nonalgebraicity. Exact original lemma still required. |
| 39 | Preserve fixed n and the ineffective Siegel constant. It depends on corrected joint CM degree, weakly special locus and Duke adapter. |
| 40 | The Schwarzian construction is on the regular locus f′ f(f−1728)≠0 and local domains where the transformed argument lies in H; no Schwarzian/j-equation library match found. |
| 41 | Use a complex algebraic branch in H^n, with irreducibility and positive dimension for the block consequence; original Pila proof must be imported. |
| 42 | Specify positive-dimensional weakly special locus /75; the effective auxiliary-variety bound is not supplied by qualitative LD.6 alone. |
| 43 | Split Proposition 39 and Lemma 40 (/81); include precompactness and sufficiently small perturbation. |
| 44 | Δ is a sum in (120), not the extraction’s product. Quantitative CM-height ownership must agree with the accepted PAPER-TSIMERMAN-18 route. |
| 45 | GN.4 plans one-coordinate Duke, not arbitrary product-orbit equidistribution. Repair by marginal union bounds with a strict compact-volume margin. |
| 46 | Separate analytic class-number lower bound from CM.3 orbit identification and the nonmaximal-order formula; retain ineffective constant. |
| 47 | Add omitted Lemmas 44–47 and the reverse Faltings/Legendre comparison. Counting arguments alone do not supply that height comparison. |
| 48 | An announced higher-genus covering is not a theorem proved in this paper; mark conditional. |
| 49 | Correct companion jet and radius normalization; import pinned Gronwall /65. |
| 50 | Split definition /72 and leading-coefficient bound /73; normalization and rational-norm comparison must remain explicit. |
| 51 | Fix the unit/double-disc convention and reduced coefficient norm; no direct library result found. |
| 52 | Put L+1 Fuchsian in the statement and retain forcing in chains. The printed unrestricted theorem is false; do not claim the added assumptions complete the whole source audit. |

## Additional coverage and decomposition

| Items | Added or separated content |
|---|---|
| 53–56 | Height formula and tuple convention; Faltings comparison; block bad locus; bounded joint degree |
| 57–62 | Lemmas 38 and 44–47; CM representatives and degree |
| 63–65 | Existing metric packing comparisons, Schwarz–Pick and Gronwall |
| 66–69 | Lemma 21; Lemma 12; Proposition 7; analytic resultant definition |
| 70–74 | Lemmas 36–37; slopes; normalized leading coefficient; companion jets |
| 75–78 | Positive-dimensional weakly special locus; R_RE; algebraic part; polynomial reparametrization |
| 79–84 | Lemmas 20,19,40,31,32,33 |
| 85–89 | Lemma 9; Corollary 14; Lemma 16; Corollary 18; Picard–Fuchs principal bundle |

This does not certify every source dependency as decomposed: determinant-level multiplicity operators, the localized affine presentations, bounded interpolation constants and the mutual induction still require the work listed below.

## Route decisions

**Route 1: reject.** The functional-transcendence import is not stated precisely enough in the original extraction. The 2010 Masser–Zannier citation is wrong, and the proof needs algebraic independence over the period/base field, not the weaker original assertion. Obtain the exact 2012 Lemma 5.1 and the original modular Ax–Lindemann input; /70–71 are application lemmas.

**Route 2: reject.** The ownership direction DT.0/DT.1/DT.3 is appropriate, but the exact real matrix norm, interpolation constants and Brownawell bound/source are not yet pinned. An accepted source route must supply those statements before the blueprint builds on them.

**Route 3: accept.** After separating /89, /34 is a concrete Legendre Picard–Fuchs calculation with the moving-endpoint boundary term; the exact differential identity is independently checked. PS.8 receives the family-specific calculation and imports C5 relative Gauss–Manin comparison.

**Route 4: accept.** Narrowed to the explicit number/function-field height-comparison adapter at RP.0, building on the existing pinned canonical-height construction. The Faltings/Legendre comparison is separately imported from R35.5 as /54.

**Route 5: accept.** AN.4 is the owner for the analytic Siegel class-number lower bound. The revised item explicitly imports CM.3 for the orbit identification and the order conductor/class-number formula, and retains the ineffective constant.

**Route 6: reject.** Do not create a design job from the current brief. E10–E12 leave essential local-resultant and general-position/complete-intersection proof obligations, /48 is only an announced-covering sketch, and /44 must reuse the quantitative CM-height direction. Main targets are retained without claiming their supplied proofs are complete.

## Source-issue verdicts

### E1 — confirmed

Lemma 15 and proof, (34)–(35), p.11 (published version). **misprint; affects nothing.**

X has dimension m, so the Lelong bound involves c(m), the volume of the unit ball of ℂ^m. Dividing vol(X) by c(m)(ε/2)^{2m} gives the factor 2^{2m}. Only O_n-constants change.

Correction: S(X ∩ B², ε) ≤ (2^{2m}/c(m)) vol(X) ε^{−2m}, from vol(X ∩ B_p) ≥ c(m)(ε/2)^{2m}.

### E2 — confirmed

§4.4, p.14 and proof of Proposition 22, p.15 (published version). **error; affects the proof.**

Over points p ∈ Σ_V every Φ lies in Σ_Ṽ, so π_Φ(Σ_Ṽ) is all of M_D whenever Σ_V ≠ ∅. Lemma 19 and the target condition (44) concern only p ∉ Σ_V.

Correction: Restrict to the part of Σ_Ṽ lying over M ∖ Σ_V (resp. over the p with dim(V ∩ L_p) < n − k): Z := Clo π_Φ(Σ_Ṽ ∖ π_M^{-1}(Σ_V)).

### E3 — confirmed

Proof of Lemma 40, p.30, and §9.3, p.31 (published version). **misprint; affects nothing.**

There is no W in Lemma 40, and §9.2 gives δ(V^ws) = poly_n(δ_V). The cited statement is Proposition 39.

Correction: δ(V^ws) = poly_n(δ_V); "according to Proposition 39".

### E4 — confirmed

§8.6, (108), p.27 (published version). **misprint; affects nothing.**

Theorem 3 depends on log R. Lemma 38 then takes R̂ = e^{poly(δ_C)}, and only log R̂ = poly(δ_C) gives the polynomial bound used in (112).

Correction: #A(1, h) = poly(δ_C, log R̂, h).

### E5 — confirmed

§8.6, p.27, and §10.3, p.34 (published version). **misprint; affects nothing.**

In both places Φ has four complex coordinates. The realness condition applies to the four entries of U, resp. to (u₁, u₂) only.

Correction: A := Mat₂ₓ₂(ℝ) ∩ Φ(B̂² ∩ V) in §8.6 (Φ = U ∈ Mat₂ₓ₂), and A := (ℂ² × ℝ²) ∩ Φ(B̂² ∩ V) in §10.3 (Φ = (x, y, u₁, u₂) with real (u₁, u₂)).

### E6 — confirmed

Theorem 8, p.21 (published version). **misprint; affects nothing.**

A and g belong to the abelian-variety version (143) of §10.4; for an elliptic curve g = 1.

Correction: p ∈ E(K̄); n = poly([K:ℚ], h_Fal(E), [K(p):K]).

### E7 — confirmed

Definition 49, (153), p.36 (published version). **misprint; affects nothing.**

The maximum index is j.

Correction: ∠L := max_{j=1,…,n} ‖a_j(t)‖/‖a₀(t)‖.

### E8 — confirmed

Proposition 51 and Theorem 9, Appendix A, pp.36–37 (published version). **error; affects a stated result.**

For a general Fuchsian operator, L + 1 need not be Fuchsian, and both statements fail. Take L = ∂_t, which is Fuchsian: its only singular point ∞ is regular singular (∂_t = −z(z∂_z), z = 1/t). Then φ(s) = κs gives φ*L = κ^{-1}∂_s and inf_φ ‖a₀(φ*L)‖ = 0. In Theorem 9 take b(t) = (t − t₀)/(2r) (|b| ≤ 1 on D^{1/2}) and f = (t − t₀)²/(4r), so j_z f(t₀) = 0 while |∂_z f(t₀ + r/2)| = r/4, unbounded in r. Here L + 1 = ∂ + 1 has an irregular singularity at ∞.

Correction: For the proposed repair assume that L and L+1 are Fuchsian, and fix the literal pullback and reduced-rational-coefficient norm. This holds for the Legendre operator (87). Complete the rational-norm comparison and use the corrected companion-jet argument E13. Retain the inhomogeneous forcing when chaining estimates (E16). No blanket assertion about Theorems 1–8 follows from this local repair.

### E9 — confirmed

§2 before Proposition 7, p.9 (published version). **misprint; affects a stated result.**

For the zero tuple all basic multiplicity operators vanish, so Proposition 7 would require 0>k for k≥0 under the printed convention. The local-algebra length is infinite.

Correction: Use multiplicity infinity at a nonisolated common zero; retain multiplicity zero outside the common zero set.

### E10 — confirmed

Lemma 11 and proof, p.10 (published version). **error; affects a stated result.**

Take n=2, a=1/4, F1(z,w)=w(w−a)/4, F2(z,w)=z(w−a)/4 on the Euclidean unit ball. Both norms are <1. At (0,0) the Jacobian determinant is −a²/16≠0, so multiplicity is 1 and some order-1 basic operator is nonzero by Proposition 7. The polydisc |z|<1/4, |w|<1/2 has closure in the ball and is Weierstrass for Γ={w=0 or w=a}, of degree 2. F2 is identically zero on the second sheet, hence the full resultant is identically zero. A finite exceptional union with total radius tending to zero cannot produce the claimed lower bound on a nonempty disc.

Correction: Require every point of the resultant fibre to lie in the local ball B′ on which Lemma 8 controls F. Replace Ω_n(s) and O_n(ρ) claims by the actual polynomial-in-k ball and exceptional-set bounds until proved. Quantitative construction of the polydiscs needed later remains a gap.

### E11 — confirmed

Proposition 22, (50), p.15; uses in §§5.2 and 6.2 (published version). **error; affects a stated result.**

Take M=A², its full-dimensional regular foliation, V={y=0}, and m=2. A pure codimension-2 closed subvariety of A² is zero-dimensional and cannot contain the line V. The published quantifier allows these data. This counterexample does not disprove Theorems 1–3, but prevents accepting their supplied unrestricted reduction.

Correction: A global containment statement requires m≤codim_M V. For applications with larger m, formulate and prove a replacement on the good locus, removing components forced into the bad locus. Restore ΣF in the global bad-locus equality. The necessary dimension restriction alone is not a proved repair.

### E12 — confirmed

Proof of Lemma 19, (49), p.14, compared with (46) (published version). **error; affects the proof.**

For n=2, k=1, a=p=0, coordinate vector fields, and Φ(u,v)=(u,v+u²), (46) maps the first coordinate line to (u,u²), whereas (49) cuts out y+x²=0. The two germs are different. The Jacobian determinant is 1, so the example lies in the permitted parameter locus. Merely replacing Φ by its inverse in (49) does not justify the subsequent degree-D linear-condition argument.

Correction: Use the image of the selected linear subspace under Φ(x)−Φ(0), as (46) gives. Equations of that image use the local inverse of Φ, whose coefficients are not generally degree-D polynomials. Supply a codimension proof for the actual image-parameterized family.

### E13 — confirmed

Lemma 48, (147)–(150), p.35 (published version). **error; affects a stated result.**

The matrix in (150) cannot act on the n+1 entries in (147). Differentiating the last entry of the latter would require b′ and coefficient derivatives. Also f(t)=e^t solves f′−f=0 on arbitrary discs, with A=1, B=0 and fixed initial full jet, while its value at r/2 is unbounded as r→∞. The printed introduction permits an arbitrary disc D.

Correction: Use the n-dimensional vector (f,…,f^(n−1)) for the companion system. Recover derivative n from Lf=b. State the displayed radius-free estimate on a normalized unit disc, or retain the path-length factor on general discs; use 1+A to bound the companion entries.

### E14 — confirmed

§9.3 after (125), p.30 (published version). **error; affects a stated result.**

For n=2, a tuple (j(τ),j(τ)) has every joint conjugate on the diagonal. That diagonal has zero product hyperbolic measure. There exists a compact subset of Ω² of product measure greater than 2/3 disjoint from a neighbourhood of the diagonal, so its orbit contributes no points there, at arbitrarily large discriminants. Marginal equidistribution gives no such assertion for arbitrary K.

Correction: Choose K as a product of one-coordinate compact continuity sets with a strict measure margin, and apply Duke to each marginal with a union bound. Include the finite set of representatives for bounded coordinate discriminants. Do not assert arbitrary-product-set equidistribution.

### E15 — confirmed

(127), p.30, and the choice of g on p.31 (published version). **misprint; affects a stated result.**

A tuple of n quadratic elements can generate a degree-2^n compositum. For n=3, τ=(i,i√2,i√3) lies in Ω³ and generates Q(i,√2,√3) of degree 8, exceeding 2n=6. The square classes −1,−2,−3 are independent; the bound in (10) is joint field degree.

Correction: Use the joint-degree bound 2^n and g=2^n. Polynomial asymptotics with n fixed are unchanged.

### E16 — confirmed

Appendix A after Theorem 9, (163), p.37 (published version). **error; affects a stated result.**

Even with L+1 Fuchsian, take L=t∂t, f=(t−1)² and b=2t(t−1). At t0=1 the full order-1 jet is zero, but f(t1)≠0 for t1≠1. Work in any compact simply connected domain away from 0; b is bounded there. Thus the forcing cannot disappear from the right-hand side.

Correction: Carry an additive term controlled by the forcing b through the chain of discs. The homogeneous expression is available only when b=0 (or an explicit bound absorbs the forcing into the initial data).

### E17 — confirmed

Definition of V^ws, §9.2, p.29 (published version). **misprint; affects nothing.**

Points are weakly special in a power of Y(1): all coordinates may be fixed. The literal union therefore equals V. The reduction to isolated special points outside V^ws and Proposition 39 require the positive-dimensional convention.

Correction: Specify positive-dimensional weakly special subvarieties.

### E18 — confirmed

Theorem 6, pp.20–21; functional-transcendence use pp.26–27 (published version). **gap; affects the proof.**

The printed nonnegative-sign condition fails to exclude P=−Q with P non-torsion. Then z+w is a period combination, so the two logarithms cannot satisfy the algebraic-independence input used in Lemma 37. The issue confirmed here is this failure to supply the proof hypothesis; no independent claim about all simultaneous-torsion specializations is needed.

Correction: Exclude relations for all (n,m)∈Z²\{(0,0)}, as needed for independence of the two sections.

### E19 — confirmed

Proof of Lemma 40, (123)–(124), p.30 (published version). **misprint; affects the proof.**

A bound on −log||pσ|| prevents pσ from being too small and gives no upper bound on ||pσ||. For a polynomial such as P(X)=X², its derivative 2X grows without bound as X→∞ although −log|X| is bounded above. The upper-size inequality is the direction needed in (124).

Correction: Use an upper bound for log^+||pσ|| (and the lower bound for log|P(pσ)|) for the gradient estimate. The absolute-height averaging argument supplies both on a suitable large subset.

### E20 — confirmed

Proposition 17, p.12, under the §3 setup of a pure m-dimensional analytic set (published version). **error; affects a stated result.**

The setup allows X=B with m=n. Then S¹·X=B, so no positive-radius ball B′⊂B is disjoint. The comparison of packing exponents in the proof also requires 2n>2m+1. Even with m<n the positive cutoff is needed: in the unit ball of C² the affine slice X={z2=a}, 0<a<1, has area π(1−a²)→0, whereas any contained ball has radius at most 1. Hence 1/ε cannot be O(vol X) uniformly as the printed α=1 formula states.

Correction: Require m<n for this complementary-ball assertion. Treat m=n separately when proving Corollary 18. Use 1+vol(X) in the quantitative bound unless a positive volume lower bound is assumed.

### E21 — confirmed

Lemma 27, (69), p.19 (published version). **error; affects a stated result.**

Take m=1, P(y1,y2)=1+y1, d=N=1, and y=(ζ5²,0), where ζ5=exp(2πi/5). Every coordinate has multiplicative height 1, so the printed right side is 1. But |1+ζ5²|=(√5−1)/2<1 and is nonzero. The corrected coefficient-count factor fixes this failure and leaves the polynomial interpolation asymptotics unchanged.

Correction: Replace d^(m+1) by a valid bound on the monomial count, for example (d+1)^(m+1), or use the coefficient l1 norm. The product-formula proof then gives the bound in item /30.

### E22 — confirmed

Lemma 26, (62), p.18 (published version). **misprint; affects a stated result.**

At N=1, the displayed bound is zero. On a one-dimensional analytic disc take Φ(z)=(z,e^z) and d=1. No nonzero polynomial of total degree ≤1 annihilates Φ: a+bz+ce^z≡0 forces c=0 by two derivatives, then a=b=0. The lemma would force such a polynomial by a zero norm bound.

Correction: State a nontrivial parameter range N≥2 and d≥1, or insert positive cutoffs and reprove the bound. Also use max(1,||Φ||) in estimates for all monomials up to degree d.

### E23 — confirmed

Corollary 14, (32), p.11, with the height convention of §1.1.4 (published version). **error; affects a stated result.**

Let M=A¹, ξ=x∂x, V={x=1}, and P_N=(x−1)/N. The ambient, foliation and variety complexities are fixed, ΣV={0}, and p=1 stays a fixed positive distance from ΣV. Every positive-order jet coordinate of P_N along ξ at p is a fixed coefficient times 1/N; the zero-order value is zero. For each fixed k, every basic multiplicity determinant tends to zero as N→∞, while the proposed order bound and right-hand side are independent of N. The tuple height grows like log N even though V is unchanged.

Correction: Include the complexity of the chosen tuple P in the lower bound, or require a specified normalization and δP≤poly(δξ,δV). Intrinsic Chow height of V alone cannot control the size of an operator applied to arbitrary defining equations.

## Required revision

- **G1** (15, 6, 8, 9): Prove a quantitative local-polydisc construction with all resultant fibres in the Lemma-8 control ball; track k-dependence and radii throughout §5.1. E10 is not repaired by an unrelated smallness assertion. Include the chosen-equation heights in Corollary 14 or prove the normalization bound required by E23.
- **G2** (22, 23, 80, 7, 32): Repair the image/inverse incidence in Lemma 19, the good-point projections, and the over-codimension use of Proposition 22. State the replacement with all ambient and singular-locus hypotheses.
- **G3** (28, 29, 31, 38, 41, 46): Acquire exact full proofs of the imported Thue–Siegel/interpolation, functional-transcendence and CM orbit inputs; pin norm conventions, constants, independent base fields and nonmaximal orders. Original extraction cites the wrong Masser–Zannier paper.
- **G4** (1, 2, 4, 5, 13, 21, 34, 40, 55, 69, 72, 75, 78): Finish declaration-level definitions, uses, APIs and at least three discriminating tests for every definition/construction, including definitions still hidden inside theorem bundles. This review adds concrete API/test outlines; it does not certify source-complete determinant, bundle, j-foliation or affine-chart constructions.
- **G5** (44, 48, 54): Reuse the quantitative CM-height direction of PAPER-TSIMERMAN-18 and the R35.5 height-comparison supplier; acquire the higher-genus covering merely announced in §10.4 before treating /48 as proved.
- **G6** (6, 8, 9, 33, 39, 47, 50, 52): Decompose the mutual dimension induction and effective slope argument with explicit constant dependence. The current dependencies name mathematical inputs, not an elaborated well-founded proof.

## Validation

- `scripts/check_paper.py` checks the revised extraction.
- `research/blueprint/intake.py check-files` checks exactly the four deliverables and own handoff.
- Additional checks verify preserved original IDs, acyclic item dependencies, current supplier IDs, exactly one route per missing item, six route verdicts, one independent verdict per source issue, APIs and three tests for every definition/construction, and exact five-file scope against the downloaded base archive.
- Independent symbolic computations check the Legendre identity, the resultant counterexample, polynomial-image mismatch, inhomogeneous growth examples and the joint-degree example. The fifth-root counterexample is the exact identity `2 cos(2π/5)=(√5−1)/2<1`.
- No Lean compilation was performed or claimed. No upstream paper proof or imported arithmetic result is certified by the structural checks.
