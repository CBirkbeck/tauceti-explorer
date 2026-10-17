# Effective imaginary quadratic class numbers

This Part II extends `AnalyticNumberTheory`, rather than replacing its zeta-function, prime-distribution or quadratic-character layers. Its endpoints are the two independently certified elliptic curves of arithmetic and analytic rank three, Oesterlé’s quantitative form of Goldfeld’s method, a uniform effective logarithmic lower bound for imaginary quadratic class numbers, the explicit constant depending on the number of ramified primes, and the complete class-number-three list. They realise items 39–42 and 44–45 of `PAPER-GROSS-ZAGIER-86`. Generic modularity, Gross–Zagier theory, quadratic-form reduction and validated arithmetic belong to their existing owners.

The target-level pass is complete: every endpoint has a statement and a backward prerequisite chain. All six layers are **planned**, with two recorded certificate gaps and twelve supplier interface requests; none is closed. This is a mathematical plan. Every implementation status is unchecked. The suggested file gives elaborating forms for native objects, APIs, examples and theorem statements; where a supplier’s future objects cannot yet be typed, its comments identify the portion represented by the signature. The statements and acceptance criteria in this document are definitive.

## Conventions and existing inputs

Throughout, K is a number field of degree two over ℚ, with negative **field** discriminant D. Write d=|D| and h=classNumber K. Class number is the cardinality of the ideal class group of the maximal order, using `NumberField.classNumber`; it is not the class number of an arbitrary quadratic order. The discriminant uses `NumberField.discr`, rather than the discriminant of a polynomial or an arbitrarily chosen integral equation. Negative fundamental discriminants have d≥3. The associated primitive quadratic character is χ_D, extended by zero at integers sharing a factor with d. At 2 its value uses the discriminant modulo 8, including zero for even discriminants. A Legendre symbol at the prime 2 cannot substitute for that convention.

The pinned native fundamental-discriminant predicate includes positive 1. Every use here retains the negative hypothesis. The pinned genus theorem is also narrower than the informal assertion that the number of ramified primes controls the class group: its statement assumes a squarefree radicand less than −1, an integral generator whose minimal polynomial is X² minus that radicand, and generation of K over ℚ. The GN.3 request supplies this bridge from a general imaginary quadratic field; the exceptional radicand −1 is checked directly. The existing divisibility theorem then gives 2^(t−1)|h, where t counts **distinct** primes dividing d. This result is imported, not planned as a fresh genus-theory proof.

The current `IntegralLattices` roadmap already owns the binary-form/ideal-class dictionary and finite form-side reduction in Layer B, milestones B1, B2 and B5. Its number-field orders and Picard groups are imported from `GlobalNumberFields`, rather than constructed a second time. `GeometryOfNumbersAndQuadraticArithmetic:GN.3` imports that work and supplies the maximal-order Picard-to-native-ClassGroup bridge and the explicit counting adapters required here. A unique reduced representative satisfies |b|≤a≤c, with b≥0 on the boundary |b|=a or a=c. Its discriminant is b²−4ac=−d, and a≤√(d/3). Both completeness and the boundary convention matter for counting classes. The same owner supplies the integrated nonaxial lattice-count estimate; `AnalyticNumberTheory:AN.4` supplies the normalized partial-zeta identity and primitive character. These exact exports are requests, because the audited stage descriptions alone do not prove them.

Elliptic curves use the native generalized Weierstrass carrier and its affine point group. Arithmetic rank is the ℤ-finrank of `WeierstrassCurve.Affine.PointModTorsion`. Analytic rank is the finite analytic order at s=1 of the unique entire continuation of the curve’s **intrinsic** Euler coefficients. `WeierstrassCurve.LSeries` is a raw sum; evaluating that sum at s=1 does not construct an analytic continuation. The BSD.0 actual-L-function and uniqueness interface is used throughout. General explicit two-descent already belongs to Tau Ceti’s elliptic Layer 6; ED.3 owns the finite local-image and saturation refinements, integrated by CN.3. These foundations are imported. The natural-valued analytic order sends an infinite order to zero, so the finite-order assertion is retained explicitly.

The canonical height already in Tau Ceti has the (O) normalization, namely the limit of the naive x-height divided by 2·4ⁿ along multiplication by 2ⁿ. BGZ’s numerical height and Gram matrix use the 2(O) normalization. Divide their entries by two before using the native pairing or a lower gap for the native height. This conversion leaves rank and positivity unchanged, but changes a numerical height constant. Current upstream elliptic Layer-6 prose uses the doubled height convention, whereas the actual native declaration uses (O); this discrepancy is recorded for the maintainer in upstreamNotes. This continuation follows the native definition. A regulator estimate or a nonsingular height matrix proves a lower rank bound; the arithmetic rank theorem additionally needs complete descent and, for a basis, saturation.

The elliptic completion is Λ_E(s)=N^(s/2)(2π)^(-s)Γ(s)L(E,s), centered at 1. The degree-four function in the analytic argument is F(s)=d^(s−1)M^sΓ(s)²Ψ(s)G(s). If ΨG=L(E)L(E^χ) and M=√(NN_χ)/(4π²d), then F=Λ_EΛ_Eχ/d. The positive factor 1/d does not affect the zero order or reflection, but it is essential in residue and tail constants. All complex powers use positive real bases and the principal complex power.

The baseline was read at Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. The current read-only upstream documents and current Tau Ceti library were also checked. `Completed/EffectiveBounds`, `Completed/ContourIntegration`, `Completed/Multiquadratic`, the elliptic roadmap and the nine roadmaps newer than the atlas snapshot already own general effective bounds, contour residues, genus theory, canonical heights and lattice APIs. This plan imports those interfaces. It does not create another class-group, canonical-height or residue carrier.

## Dependency route

The six layers are ECN.0 through ECN.5. ECN.0 establishes the discriminant weight and the obstruction to small split primes. ECN.1 turns the obstruction into the uniform C1–C4 analytic principle. ECN.2 independently certifies the two curves supplying central zeros of order three. ECN.3 inserts their modular L-functions, all bad-prime corrections and numerical constants into that principle. ECN.4 converts the weighted estimate into explicit constants and effective finiteness. ECN.5 combines the analytic cutoff with two complete exclusion computations and exact reduced-form enumeration.

Cross-roadmap inputs are `AnalyticNumberTheory:AN.2` and `AN.4`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `RankZeroOneBSD:BSD.0`, `GrossZagierAndArithmeticHeights:GZ.8`, `EllipticCurveModularity:R29.4` and `R29.5`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, and `ComputationalNumberTheory:CN.1`–`CN.4`, together with `EffectiveDiophantineMethods:ED.3` and the existing elliptic Layers 4 and 6. Accepted supplier nodes are cited by node ID in the packet. A stage citation accompanied by a request means that the needed exact export was not found in the audited plan; it is not evidence that the export already exists.

The sources below are used for their mathematical results and proof mechanisms, with edition, section and printed page locators. Their statements and proofs are expressed here in our own words. Historical decimals and tables become targets for finite certificates, never axioms justified by a source’s numerical report.
## AnalyticNumberTheoryPartII:ECN.0 — Quadratic class numbers and ramified weights

The split-prime obstruction comes directly from the ideal class group. For a split prime p, the h-th power of a prime ideal above p is principal. A generator has norm p^h and can be written (a+b√−d)/2 with the correct parity. Distinct conjugate prime ideals force b≠0; hence 4p^h=a²+db²≥d. If n is coprime to d and below (d/4)^(1/h), each prime divisor is inert. Complete multiplicativity then gives χ_D(n)=λ(n). Omitting coprimality would make the assertion false at a ramified prime.

The weight θ(d) uses the distinct discriminant primes with the **largest** removed. It is not a product over conductor primes, nor a product with prime multiplicities. Small d=3,4 are outside the split-prime proof and must be discharged wherever the analytic argument is extended to every imaginary quadratic field. The direct boundary tests for θ are deliberately sensitive to removing the wrong prime and to multiplying an extra factor.

This layer imports GN.3 reduction/class-group equivalence and AN.4 character conventions. Its acceptance requires the native genus hypotheses to be discharged, not simply an informal reference to genus theory. The mathematical proof route is Oesterlé, Bourbaki §1.4, printed p. 312, and the weighted statement is his Theorem 1, pp. 310–311.

Dependencies: `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `AnalyticNumberTheory:AN.4`.

### The ramified-prime weight

Target `AnalyticNumberTheoryPartII:ECN.0/ramified-weight` (definition).

For d∈ℕ let P(d) be d.primeFactors with its largest element removed (empty when d=0 or 1). Define θ(d)=∏_{p∈P(d)}(1−⌊2√p⌋/(p+1)) in ℝ. Here floor is the nonnegative integer floor, and an empty product is 1.

Proof route:

1. Use the existing finite set of distinct natural prime factors; erase its maximum, taking 0 as the maximum of the empty set.
2. Form each real factor using the natural floor of 2√p. No multiplicities, conductor primes, or signed discriminants enter this definition.

Proposed API:

- `TauCeti.EffectiveClassNumber.ramifiedWeight_pos` (structure): For every d, 0<θ(d).
- `TauCeti.EffectiveClassNumber.ramifiedWeight_le_one` (structure): For every d, θ(d)≤1.
- `TauCeti.EffectiveClassNumber.ramifiedWeight_prime` (simp): If p is prime and k≥1 then θ(p^k)=1.
- `TauCeti.EffectiveClassNumber.ramifiedWeight_support` (extensionality): If d and e have the same distinct prime factors, θ(d)=θ(e).
- `TauCeti.EffectiveClassNumber.ramifiedWeight_odd_class_number` (compatibility): For an imaginary quadratic field with odd class number, θ(|discr K|)=1, using existing genus divisibility.

Unit tests:

- `TauCeti.EffectiveClassNumber.ramifiedWeight_zero_test` (degenerate): θ(0)=1.
- `TauCeti.EffectiveClassNumber.ramifiedWeight_prime_test` (computation): θ(907)=1.
- `TauCeti.EffectiveClassNumber.ramifiedWeight_15_test` (computation): θ(15)=1/4.
- `TauCeti.EffectiveClassNumber.ramifiedWeight_84_test` (computation): θ(84)=1/12.

Prerequisite chain: `tauceti:NumberField.mem_ramifiedPrimes_iff_dvd_discr`, `tauceti:TauCeti.Multiquadratic.ncard_ramifiedPrimes_sub_one_le_twoRank`, `tauceti:NumberField.two_pow_classGroupTwoRank_dvd_classNumber`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

Source: O85, Theorem 1 and genus consequences, pp. 310–311. The bound omits the largest discriminant prime and uses these integral Hasse factors.

Acceptance: θ(84)=1/12 while θ(15)=1/4; erasing a prime other than the largest changes these values.

### Split-prime size bound

Target `AnalyticNumberTheoryPartII:ECN.0/split-prime-size` (theorem).

Let K be imaginary quadratic with fundamental discriminant −d, d>4, and h=classNumber K. If the natural prime p splits in K, then p^h≥d/4.

Hypotheses and conventions: [Field K], [NumberField K], [Algebra ℚ K], finrank ℚ K=2, discr K=−d. p is a natural prime and the associated quadratic character has χ(p)=1.

Proof route:

1. A prime ideal 𝔭 of norm p has 𝔭^h principal because its class has order dividing the cardinality h.
2. Write a generator as (a+b√(−d))/2 with integers a,b of the appropriate parity. Its norm is p^h.
3. The distinct conjugate prime ideals force b≠0; therefore 4p^h=a²+db²≥d. Handle d=3,4 separately wherever an application needs them.

Prerequisite chain: `mathlib:NumberField.classNumber`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

Source: O85, §1.4(a), p. 312. The ideal-class order bound gives the quantitative obstruction to a small split prime.

Acceptance: For h=3, every prime p with 4p³<d is inert or ramified.

### Quadratic character and Liouville agreement

Target `AnalyticNumberTheoryPartII:ECN.0/liouville-agreement` (theorem).

For K as in split-prime-size, if 1≤n<(d/4)^(1/h) and gcd(n,d)=1, then χ_K(n)=λ(n), with λ the existing Liouville arithmetic function. Every prime divisor of n is inert, so the equality also holds on all products of primes below the same split-prime threshold.

Hypotheses and conventions: d>4; h=classNumber K; n positive; gcd(n,d)=1.

Proof route:

1. Apply split-prime-size to each prime divisor of n. The size hypothesis rules out χ(p)=1 and coprimality rules out χ(p)=0.
2. Use complete multiplicativity of the quadratic character and existing Liouville function, including prime powers and n=1.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.0/split-prime-size`, `mathlib:ArithmeticFunction.liouville`, `AnalyticNumberTheory:AN.4`.

Source: O85, §1.4, p. 312; §3.5, p. 318. A small class group makes the quadratic character imitate Liouville on a controlled range.

Acceptance: The coprimality hypothesis is necessary: a ramified prime has χ(p)=0 but λ(p)=−1.

Layer status: **planned**. Discharge GN.3/AN.4 requests; check the squarefree-radicand bridge and d=3,4 exception against the pinned genus hypotheses.

## AnalyticNumberTheoryPartII:ECN.1 — Goldfeld’s effective analytic principle

The analytic engine works with a fixed positive scale M and fixed Ψ, while K and G vary. Oesterlé’s C1 is **coefficient-wise** domination. If ≪ denotes domination of the absolute Dirichlet coefficients, it is Ψ≪ζ(2s−1)² and G≪(ζ_K(s−1/2)/ζ(2s−1))². Absolute convergence is required on Re(s)>1 and Re(s)>3/2 respectively. A numerical bound for |Ψ(s)| or |G(s)| on one line does not replace C1. The nonnegative coefficients of ζ_K(s)/ζ(2s) come from primitive form representations. The suggested C1–C4 signature ties these coefficients to the native Dedekind zeta function in its convergence region.

C2 specifies G_p(s) as the ratio of (1+αp^−s)(1+βp^−s) to (1+α′p^−s)(1+β′p^−s), with all four root norms at most √p, and G as the Euler product on its absolute-convergence half-plane. C3 says that F is entire, rapidly decreasing on bounded vertical strips, invariant under s↦2−s, and has order at least three at 1. Reflection makes its central order even, hence at least four. C4 gives Ψ a simple zero at 1, analyticity on a neighborhood of the closed half-plane Re(s)≥1, and rapid strip decrease for M^sΓ(s)²Ψ(s). These are the hypotheses of Oesterlé’s Theorem 2, §3, pp. 314–319.

The first contour integral is zero: division of F by (s−1)³ leaves an entire function, a symmetric rectangle has zero integral, its horizontal sides vanish by strip decay, and reflection identifies the two vertical contributions with the sign imposed by the odd denominator. This imports Tau Ceti’s residue theorem with its actual open-domain, null-homology, pole-avoidance and meromorphicity hypotheses.

For the truncated Euler product G_U, the remaining central pole is second order. Set H to the analytic removable extension of M^sΓ(s)²Ψ(s)/(s−1). Its first Taylor coefficient gives the residue displayed in the target below. The value H(1) is not obtained by evaluating the raw totalized quotient at 1. Indent the contour into the C4 neighborhood, avoiding every local denominator zero. The indented contribution is bounded by an integral depending only on Ψ,M times the supremum of |G_U| there.

The Mellin kernel is nonnegative, decreasing and convex when a≥0 and m≥2. For measures the relevant transform is μ̂(s)=∫t^−s dμ(t); multiplicative convolution gives the kernel integral ∫I_{a,m}(x∏t_j)∏dμ_j(t_j). Oesterlé’s Lemma 3 assumes integrated cumulative domination ∫₀ᵀμ_j((0,t])dt≤∫₀ᵀν_j((0,t])dt for every T≥0. Representing the convex kernel by positive hinges proves the comparison one measure at a time; pointwise cumulative domination is a sufficient special case. Each measure is supported on positive reals and has finite mass on every (0,t]. Mellin transforms converge on the common line; absolute line integrability is imposed on the completed products (s−a)^−m∏μ̂_j, rather than each individual transform. Inversion and Fubini retain their stated hypotheses. These are the conditions used in Oesterlé’s §3.3, pp. 315–316.

The three tails come from the axial/axial, axial/nonaxial and nonaxial/nonaxial parts of the primitive form decomposition. Their exact bounds are listed below. Keep the absolute value in |log(dM/U)| and the factor 2π⁴/3 in the middle bound. Substituting M=N/(4π²) converts the latter coefficient to πN^(3/2)/12, a useful normalization check.

Choose U=(√d/2)^(1/m), with m the least positive integer satisfying m²+m≥h/2, except that h=4 uses m=3/2. The small-split-prime and genus estimates control G_U and its logarithmic derivative. Oesterlé’s remaining error ratio tends to one when the cutoff parameter λ grows. His explicit construction permits C=max(λ,c₅(1+c₇(λ))/|c₁|), after checking the denominator positivity and λ threshold; c₇(λ) tends to zero. The smaller-discriminant branch is covered directly by log d<λh. Effectivity requires certified bounds and a computable modulus for this choice. Analyticity given as an arbitrary function oracle is insufficient to extract a constant algorithmically.

Dependencies: `AnalyticNumberTheoryPartII:ECN.0`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

### The degree four completion

Target `AnalyticNumberTheoryPartII:ECN.1/degree-four-completion` (definition).

For natural d, positive real M and complex functions Ψ,G, put F(s)=d^(s−1)M^sΓ(s)^2Ψ(s)G(s), using the principal complex powers of the positive real bases. Statements about it assume d>0; the source center is s=1 and reflection s↦2−s.

Proof route:

1. Use Complex.cpow and Complex.Gamma, with no new gamma-factor or L-function carriers.
2. Record the distinction from the product of two elliptic completions: when M=√(NNχ)/(4π²d), F=d^−1 Λ_EΛ_Eχ.

Proposed API:

- `TauCeti.EffectiveClassNumber.goldfeldCompletion_one` (simp): For d>0, F(1)=MΨ(1)G(1).
- `TauCeti.EffectiveClassNumber.goldfeldCompletion_two` (simp): For d>0, F(2)=dM²Ψ(2)G(2).
- `TauCeti.EffectiveClassNumber.goldfeldCompletion_congr` (extensionality): Pointwise equal Ψ and G give equal completions.
- `TauCeti.EffectiveClassNumber.goldfeldCompletion_product` (compatibility): For ΨG=L_EL_Eχ and M=√(NNχ)/(4π²d), F(s)=Λ_E(s)Λ_Eχ(s)/d.
- `TauCeti.EffectiveClassNumber.goldfeldCompletion_order` (compatibility): At 1, multiplication by the nonzero factor d^(s−1)M^sΓ(s)^2 preserves finite analytic order of ΨG.

Unit tests:

- `TauCeti.EffectiveClassNumber.goldfeldCompletion_center_test` (computation): With d=2,M=3,Ψ≡2,G≡5, F(1)=30.
- `TauCeti.EffectiveClassNumber.goldfeldCompletion_two_test` (computation): With d=2,M=3,Ψ≡1,G≡1, F(2)=18.
- `TauCeti.EffectiveClassNumber.goldfeldCompletion_zero_test` (degenerate): If Ψ≡0 then F≡0.

Prerequisite chain: `mathlib:WeierstrassCurve.LSeries`, `RankZeroOneBSD:BSD.0/actual-l-function`.

Source: O85, C3, p. 314; §4.2, p. 320. The source uses d^(s−1), so the elliptic product carries the extra factor d^−1.

Acceptance: At s=1 the value is MΨ(1)G(1); at s=2 it is dM²Ψ(2)G(2).

### The positive inverse Mellin kernel

Target `AnalyticNumberTheoryPartII:ECN.1/inverse-mellin-kernel` (definition).

For a∈ℝ and integer m≥2 define I_{a,m}(x)=x^(−a)(log(1/x))^(m−1)/(m−1)! for 0<x≤1, and 0 otherwise. Boundary conventions give I(1)=0 and I(0)=0.

Proof route:

1. Use Real.rpow, Real.log and the existing Lebesgue integral; the function is explicitly zero off its positive support.
2. Evaluate its Mellin transform for Re(s)>a, obtaining (s−a)^−m; justify inversion by the existing convergence and vertical-integrability hypotheses.

Proposed API:

- `TauCeti.EffectiveClassNumber.inverseMellinKernel_of_pos_le_one` (characterisation): For 0<x≤1 and m≥2, the kernel equals the displayed real expression.
- `TauCeti.EffectiveClassNumber.inverseMellinKernel_eq_zero` (simp): For x≤0 or x≥1 and m≥2, the kernel is 0.
- `TauCeti.EffectiveClassNumber.inverseMellinKernel_nonneg` (structure): For m≥2 the kernel is nonnegative.
- `TauCeti.EffectiveClassNumber.inverseMellinKernel_antitone` (structure): For a≥0 and m≥2 it is decreasing on (0,∞).
- `TauCeti.EffectiveClassNumber.inverseMellinKernel_convex` (structure): For a≥0 and m≥2 it is convex on (0,∞).
- `TauCeti.EffectiveClassNumber.inverseMellinKernel_transform` (compatibility): For Re(s)>a and m≥2 its Mellin transform is (s−a)^−m, with absolute convergence and vertical integrability for inversion.

Unit tests:

- `TauCeti.EffectiveClassNumber.inverseMellinKernel_half_test` (computation): I_{0,2}(1/2)=log 2.
- `TauCeti.EffectiveClassNumber.inverseMellinKernel_one_test` (degenerate): I_{0,3}(1)=0.
- `TauCeti.EffectiveClassNumber.inverseMellinKernel_two_test` (computation): I_{0,2}(2)=0.
- `TauCeti.EffectiveClassNumber.inverseMellinKernel_twisted_half_test` (computation): I_{1,2}(1/2)=2 log 2.

Prerequisite chain: `mathlib:mellinInv_mellin_eq`.

Source: O85, §3.3, Lemmas 1–2, pp. 315–316. The elementary inverse transform gives a nonnegative kernel; convexity and monotonicity require a≥0.

Acceptance: For a=0,m=2 it equals −log x on (0,1), and is zero at and above 1.

### Positive Mellin comparison

Target `AnalyticNumberTheoryPartII:ECN.1/positive-mellin-comparison` (theorem).

Let a≥0,m≥2 and let μ_j,ν_j be positive measures supported on (0,∞), with finite mass on every (0,t]. Their Mellin transforms converge on a common line Re(s)=σ>a, and each product (s−a)^−m∏_j μ̂_j(s), respectively (s−a)^−m∏_j ν̂_j(s), is absolutely integrable on that line. Suppose ∫₀ᵀ μ_j((0,t])dt≤∫₀ᵀ ν_j((0,t])dt for every T≥0 and each j. Then the inverse Mellin transforms of (s−a)^−m∏_j μ̂_j(s) and (s−a)^−m∏_j ν̂_j(s) are nonnegative and ordered in the same direction. All multiplicative-convolution/Fubini integrals must be absolutely integrable. The assertion includes the single-measure comparison; pointwise cumulative-mass domination is a sufficient special case.

Hypotheses and conventions: Finite number of positive measures; finite mass on every (0,t], integrated cumulative-mass domination, Mellin-transform convergence and absolute integrability of the completed products on the displayed line, and multiplicative-convolution/Fubini integrability. a≥0 for the decreasing convex comparison; m≥2; x>0.

Proof route:

1. Express the inverse transform as the integral of I_{a,m}(x∏t_j) against the product of the measures. Justify Fubini from the stated absolute-integrability bounds.
2. For fixed positive x, the kernel is nonnegative, decreasing and convex on (0,∞), with compact support towards infinity. Its distributional second derivative is a positive measure; include the boundary atom when m=2. Represent the kernel by positive hinge functions (u−t)₊. Tonelli identifies each hinge integral against μ with ∫₀ᵘ μ((0,t])dt and gives the single-factor inequality from the integrated hypothesis.
3. Apply that comparison one factor at a time in a finite multiplicative convolution. Integrating a pointwise cumulative inequality first gives its corollary.
4. Apply the integrated form to the nonaxial lattice-counting measure and its area majorant; do not assume a pointwise lattice-counting estimate. Gamma and discrete coefficient comparisons retain all normalization factors.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.1/inverse-mellin-kernel`, `mathlib:mellinInv_mellin_eq`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

Source: O85, §3.3, Lemmas 1–3 and Examples 1–2, pp. 315–316. O85 Lemma 3 uses integrated cumulative-mass domination and convex positive kernels; this is the hypothesis supplied by the nonaxial area estimate.

Acceptance: A nonpositive signed coefficient measure cannot be substituted; the ζ(2s) discrete measure comparison uses the square-map pushforward. The example μ=δ₁ and ν=(δ₁/₂+δ₃/₂)/2 satisfies integrated domination for every T but fails pointwise cumulative domination at t=1. For a=0,m=2,x=1 its kernel integrals are 0 and (log 2)/2; the general statement must cover this example.

### Goldfeld reflection contour identity

Target `AnalyticNumberTheoryPartII:ECN.1/fundamental-contour` (theorem).

Suppose F is entire, F(s)=F(2−s), F has a zero of order at least three at 1, and F decreases faster than every inverse power of |Im s| on each bounded vertical strip. For σ>3/2, (2πi)^−1∫_{Re s=σ} F(s)/(s−1)^3 ds=0, the line being oriented upwards. With F=d^(s−1)M^sΓ(s)^2Ψ(s)G(s), this is Oesterlé’s fundamental identity.

Hypotheses and conventions: The entire function has the stated vertical-strip bounds; its vanishing assertion is about the actual analytic function. d>0,M>0 in the factored form.

Proof route:

1. Reflection about 1 makes the vanishing order even, hence at least four, so division by (s−1)^3 leaves an entire function.
2. Integrate on a finite rectangle symmetric about Re s=1. The existing cycle residue/Cauchy theorem gives zero; vertical-strip decay sends the horizontal sides to zero.
3. Reflect the left side onto the right side and check the sign from the odd denominator; their equality forces the right line integral to vanish.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.1/degree-four-completion`, `tauceti:TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous`, `mathlib:analyticOrderNatAt`.

Source: O85, §3.1, identity (3.1.1), p. 314. The plus functional equation and central vanishing annihilate this contour integral.

Acceptance: A minus-sign functional equation does not yield this same zero integral; the plus sign is explicitly required.

### The truncated Euler-product residue

Target `AnalyticNumberTheoryPartII:ECN.1/truncated-residue` (theorem).

Assume C4: Ψ is holomorphic on an open neighborhood of Re(s)≥1 with Ψ(1)=0 and Ψ′(1)≠0. Let G_U=∏_{p≤U}G_p with the C2 local roots, U≥1. Set γ(s)=M^sΓ(s)^2 and H(s)=γ(s)Ψ(s)/(s−1), with its removable value at 1; c₁=H(1)≠0,c₂=H′(1)/H(1). The residue at 1 of d^(s−1)γ(s)Ψ(s)G_U(s)/(s−1)^3 is c₁G_U(1)[log d+G_U′(1)/G_U(1)+c₂]. A contour Δ making the source indentation just to the left of 1 gives J(U) equal to this residue plus the Δ integral; the latter has absolute value at most c₃ sup_Δ |G_U|, where c₃ depends only on Ψ,M and the fixed indentation.

Hypotheses and conventions: d>4,M>0,U≥1; all roots of each C2 numerator and denominator have norm at most √p. Choose the indentation in the holomorphy neighborhood and avoid all local-factor poles; its near-center half-width is at most 1/4.

Proof route:

1. At 1 each denominator is nonzero since √p/p<1. Expand the product of d^(s−1), H and G_U to first order to compute the second-order pole residue.
2. Apply the existing residue theorem to the truncated rectangle, then pass to the limit with the gamma/Ψ strip decay.
3. Bound the remaining contour integral by the integral of |γΨ(s)(s−1)^−3| on Δ times sup|G_U|.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.1/fundamental-contour`, `tauceti:TauCeti.Contour.residue`, `tauceti:TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous`.

Source: O85, §3.2, formulas (3.2.1)–(3.2.2), p. 315. The source separates the central residue from a bounded indented contour integral.

Acceptance: The residue is unchanged if H is supplied by any analytic removable extension; c₁,c₂ cannot be replaced by values of the raw quotient at 1.

### The three positive remainder estimates

Target `AnalyticNumberTheoryPartII:ECN.1/tail-three-pieces` (theorem).

Under C1–C2, with d>4,U≥1 and γ=M^sΓ(s)^2, let G*=G−G_U and J* be the fundamental contour with G*. Then |J*|≤J₁+J₂+J₃ with the nonnegative integrals in O85 (3.4.4)–(3.4.6). Writing h=classNumber K and summing over all reduced positive-definite forms of discriminant −d, J₁≤(M/96)h²U^−1/2(|log(dM/U)|+3)^4, J₂≤(2π⁴/3)M^(3/2)h∑_q a(q)^−1, and J₃≤4π²e M^(3/2)max(2,log(4M))h²d^−1/2.

Hypotheses and conventions: C1 means coefficient-wise absolute domination, with absolute convergence on the specified half-planes; a bound on numerical function values is insufficient. K imaginary quadratic, fundamental discriminant −d; reduced forms and their normalized partial-zeta decomposition are imported.

Proof route:

1. Shift s by 1/2 and dominate the remaining Euler coefficients by the square of ζ_K(s)/ζ(2s), discarding the pairs a(q)a(q′)<U removed by the truncation.
2. Use the integrated positive Mellin comparison to replace nonaxial lattice measures by their area majorant and ζ(2s) by its square-pushforward comparison. This produces exactly the three terms.
3. Evaluate the gamma kernel/residue for J₁; use the elementary vertical integrals (3.4.8) and (3.4.9) for J₂ and J₃. The absolute value around log(dM/U) is required.
4. For the nonaxial measure use support t≥A₀=√d/2 and ν=(π/2)δ_A₀+(π/√d)·volume restricted to [A₀,∞). Its cumulative mass is (πt/√d)1_[A₀,∞)(t), so the imported integrated area bound is precisely the comparison hypothesis; its Mellin transform is (π/2)·s/(s−1)·A₀^−s for Re(s)>1.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.1/positive-mellin-comparison`, `AnalyticNumberTheoryPartII:ECN.1/truncated-residue`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `AnalyticNumberTheory:AN.4`.

Source: O85, §3.4, equations (3.4.2)–(3.4.9) and Proposition 1, pp. 316–318. The coefficient and positive-measure comparisons give these explicit, uniform remainder estimates.

Acceptance: Check the factor 2π⁴/3 in J₂; with M=N/(4π²) it becomes πN^(3/2)/12.

### Oesterlé’s effective technical theorem

Target `AnalyticNumberTheoryPartII:ECN.1/oesterle-technical-bound` (theorem).

Fix M>0 and Ψ satisfying C1 for Ψ and C4. For every imaginary quadratic K of fundamental discriminant −d, d>4, and Euler quotient G satisfying C1 for G, C2 and C3, there exists a uniform C>0, depending only on Ψ and M, such that C h(K)≥min(1,∏_{p∈P(d)} |G_p(1)|/(1+p^−1)) log d. C is effectively obtained from certified presentations of M, the C4 simple-zero coefficient and neighborhood, and all strip/integral bounds used in the proof. It is independent of G, K and h.

Hypotheses and conventions: C1: Ψ≪ζ(2s−1)^2, G≪(ζ_K(s−1/2)/ζ(2s−1))², with absolute convergence for Re(s)>1 and >3/2 respectively. C2: G_p(s)=(1+αp^−s)(1+βp^−s)/((1+α′p^−s)(1+β′p^−s)), all four root norms ≤√p. C3: F=d^(s−1)M^sΓ(s)^2ΨG is entire, rapidly decreasing on vertical strips, F(s)=F(2−s), and ord₁F≥3. C4: Ψ is holomorphic on a neighborhood of the closed right half-plane, has a simple zero at 1, and γΨ decreases rapidly on its bounded vertical strips.

Proof route:

1. Choose U=(√d/2)^(1/m), where m is the least positive integer satisfying m²+m≥h/2 except h=4 uses m=3/2. The split-prime bound implies at most one split prime ≤U; genus theory puts the largest ramified prime above U.
2. Apply the four estimates (3.5.1)–(3.5.4) to the form sum, |G_U(1)|, Re(G_U′/G_U)(1) and sup_Δ|G_U|. Combine the residue identity with J(U)=−J*.
3. For d≥exp(λh), bound α₅/α₆≤1+c₇(λ) with α₆>0 and c₇(λ)→0. The source formulas provide C=max(λ,c₅(1+c₇(λ))/|c₁|). For d<exp(λh), use log d<λh directly.
4. Retain a computable modulus and enclosure for every constant in this choice; bare analyticity does not constitute an algorithm to recover C from an arbitrary function oracle.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.1/tail-three-pieces`, `AnalyticNumberTheoryPartII:ECN.0/split-prime-size`, `tauceti:TauCeti.Multiquadratic.ncard_ramifiedPrimes_sub_one_le_twoRank`, `tauceti:NumberField.two_pow_classGroupTwoRank_dvd_classNumber`, `ComputationalNumberTheory:CN.4`.

Source: O85, §3.5, Theorem 2 and equations (3.5.1)–(3.5.6), pp. 318–319; §3.6, p. 319. A fixed Ψ and scale M control every discriminant and varying Euler quotient.

Acceptance: The constant carries no dependence on d,G or the varying class number; h=4 uses the stated nonintegral m.

Layer status: **planned**. Discharge the normalized form-counting and validated-numerical inputs; refine the uniform computable C1–C4 parameter bounds into certificate checking statements.

## AnalyticNumberTheoryPartII:ECN.2 — Two certified rank three curves

The first curve is the native integral equation Y²+Y=X³−X²−64403X−6220110. Its coordinate comparison with Gross–Zagier I Proposition (7.4), printed p. 231, is explicit. Its discriminant is 37·139⁶ and its conductor is 37·139². The curve printed in Oesterlé 1988, p. 66, has coefficients (0,−1,1,−450823,112971139) and discriminant 37³·139⁶; it belongs to the same isogeny class. Those coefficients are not a coordinate model for the first equation. A proof transports the newform and rank through a certified isogeny, rather than calling one model a source misprint.

The second curve is y²+y=x³−7x+6, with discriminant and conductor 5077. The map y↦−y gives the minus-y equation used in Gross–Zagier I §8. The three proposed generators (0,2),(1,0),(2,0) belong to the plus-y equation. At its bad prime the reduction is nonsplit multiplicative, yielding (1+5077^−s)^−1. The local sign includes the archimedean factor. Each conductor is certified from intrinsic reduction data; an integral discriminant alone is not a conductor computation.

The arithmetic proofs are separate from the analytic proofs. For 5077, the good reductions at 3 and 5 have 7 and 10 points, which exclude rational torsion. A certified positive-definite height matrix proves independence of the three points. Import general explicit two-descent from Tau Ceti’s existing elliptic Layer 6 and finite local-image/saturation checks from ED.3. A complete descent upper bound proves rank at most three, and the BGZ height enumeration and generation test establish saturation. BGZ §§1–2, pp. 473–476, provide this route. The source’s height matrix is converted to the native normalization first. For 139, the inspected Proposition (7.4) states rank three but does not print the required complete descent and independent-point witnesses. Reconstructing those exact witnesses is a recorded gap; analytic rank cannot fill it.

For the analytic certificate, BGZ §4, equations (12)–(14), printed pp. 478–479, gives the positive kernels G_r. They produce L^(r)(1)=2r!Σ(a_n/n)G_r(2πn/√N) for odd r once all derivatives of lower order vanish. The divisor bound |a_n|≤τ(n)√n and G_r(x)≤e^−x/x^r bound the tail. A truncation, explicit geometric majorant and outward interval evaluation then certify the central derivative. The summand a_n/n must be retained. For r=3 the displayed uncompleted derivative formula requires exact vanishing of L′ first.

A tiny first-derivative enclosure does not prove an exact zero. The height-gap target applies the imported Gross–Zagier equality with a specified admissible twist whose central L-value has a certificate excluding zero. Every non-torsion rational Heegner trace has a proved positive lower height δ, and an enclosure strictly below cδ forces its height to vanish. The twisted central value then forces L′=0. Root-number parity raises the order to at least three. For E₅₀₇₇ choose χ_{−7}. Since 5077≡2 mod7 and 2 is a square mod7, χ_{−7}(5077)=1; the primitive twist has conductor 5077·7²=248773 and root number +1. Certify 4<L(E^χ,1)<5 by the exponential central-value sum 2Σ(a_nχ(n)/n)e^(−2πn/√248773) through n=2048. The divisor bound gives a tail at most 4e^(−α·2049)/(1−e^−α)<10^−8, using α>1/80. Outward finite-sum evaluation can use the interval (4.47,4.49). These are reproducible certificate targets, not a claim that the floating sum is a proof. BGZ’s complete height-below-one enumeration and certified generator heights greater than 1/2 in its 2(O) normalization give the native gap δ=1/4. The Gross–Zagier constant and exact local conditions must still be validated through GZ.8 and CN.4.

For the conductor-37 route to E₁₃₉, Gross–Zagier’s 1983 Corollary 6, p. 87, uses u=η²/η(37z)² with divisor 3(0)−3(∞). The field of discriminant −139 has class number three and 37 splits. The exact CM relation places u(x) in the Hilbert class field H and gives u(x)^12=λ^12, where λ=(3+√−139)/2 has norm 37. Since [H:K]=3, neither of the quadratic extensions K(i) and K(ζ₃) can lie in H. Its twelfth roots of unity are therefore ±1, so u(x)=±λ belongs to K. Galois equivariance makes the three CM values equal, and the exact divisor multiplicities make the trace divisor principal. The relevant f-isotypic trace therefore vanishes. This is projected through the normalized modular parametrisation and combined with a certified nonzero L(f,1). The modular-unit and CM computations are supplier requests, not numerical coincidences between approximate CM values.

A third-derivative interval excluding zero gives exact analytic order three, with finite order verified independently on the convergence half-plane. For 5077, BGZ’s leading-coefficient interval is 1.73<L‴(1)/3!<1.74, so 10.38<L‴(1)<10.44. The equality of the two ranks here does not assert the full rank-three BSD leading-term formula or a conjectural order of the Tate–Shafarevich group.

Dependencies: `AnalyticNumberTheoryPartII:ECN.0`, `RankZeroOneBSD:BSD.0`, `GrossZagierAndArithmeticHeights:GZ.8`, `EllipticCurveModularity:R29.4`, `EllipticCurveModularity:R29.5`, `ComputationalNumberTheory:CN.3`, `ComputationalNumberTheory:CN.4`, `EffectiveDiophantineMethods:ED.3`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`.

### The Gross–Zagier curve

Target `AnalyticNumberTheoryPartII:ECN.2/curve-139` (definition).

Define E₁₃₉ over ℚ by generalized Weierstrass coefficients (a₁,a₂,a₃,a₄,a₆)=(0,−1,1,−64403,−6220110). Thus Y²+Y=X³−X²−64403X−6220110. The change x=(4X+462)/(−139), y=(8Y+4)/139² identifies it with −139y²=x³+10x²−20x+8.

Proof route:

1. Use the native WeierstrassCurve ℚ carrier. Obtain the displayed coefficients by twisting the source equation and completing the square with scale 2.
2. Verify the coordinate identity in both directions over ℚ, including the point at infinity; the curve in O88 p. 66 is an isogenous model, not this identical integral model.

Proposed API:

- `TauCeti.EffectiveClassNumber.curve139_coefficients` (data): The five coefficients are exactly (0,−1,1,−64403,−6220110).
- `TauCeti.EffectiveClassNumber.curve139_discriminant` (simp): E₁₃₉.Δ=37·139^6 in ℚ.
- `TauCeti.EffectiveClassNumber.curve139_isElliptic` (instance): E₁₃₉ is elliptic because its nonzero rational discriminant is a unit.
- `TauCeti.EffectiveClassNumber.curve139_source_equation` (compatibility): For all X,Y∈ℚ, the native affine equation holds iff the displayed x,y satisfy −139y²=x³+10x²−20x+8.
- `TauCeti.EffectiveClassNumber.curve139_coordinate_inverse` (equivalence): The affine inverse is X=(−139x−462)/4, Y=(139²y−4)/8; these maps extend to an isomorphism preserving infinity.

Unit tests:

- `TauCeti.EffectiveClassNumber.curve139_a2_test` (computation): E₁₃₉.a₂=−1.
- `TauCeti.EffectiveClassNumber.curve139_a4_test` (computation): E₁₃₉.a₄=−64403.
- `TauCeti.EffectiveClassNumber.curve139_a6_test` (computation): E₁₃₉.a₆=−6220110.
- `TauCeti.EffectiveClassNumber.curve139_origin_test` (non-example): (0,0) does not lie on E₁₃₉.

Prerequisite chain: `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Affine.Equation`.

Source: GZ86, I Proposition (7.4), p. 231. The source curve is transported by the explicit rational coordinate change.; O85, §4.3, p. 320. The isogenous conductor-37 curve is twisted by −139 to supply the same newform.

Acceptance: The Weierstrass discriminant is 37·139^6, and the affine equation is equivalent to the source cubic under the displayed map.

### The Buhler–Gross–Zagier curve

Target `AnalyticNumberTheoryPartII:ECN.2/curve-5077` (definition).

Define E₅₀₇₇ over ℚ by coefficients (0,0,1,−7,6), hence y²+y=x³−7x+6. Use the native point at infinity and native addition. Changing y to −y gives the source endpoint y²−y=x³−7x+6.

Proof route:

1. Construct the native Weierstrass curve and compute Δ=5077.
2. Record the affine sign-change isomorphism to the minus-y model; no second definition of the endpoint curve or its canonical height is introduced.

Proposed API:

- `TauCeti.EffectiveClassNumber.curve5077_coefficients` (data): The five coefficients are exactly (0,0,1,−7,6).
- `TauCeti.EffectiveClassNumber.curve5077_discriminant` (simp): E₅₀₇₇.Δ=5077.
- `TauCeti.EffectiveClassNumber.curve5077_isElliptic` (instance): E₅₀₇₇ is elliptic.
- `TauCeti.EffectiveClassNumber.curve5077_equation` (characterisation): Its native affine equation is y²+y=x³−7x+6.
- `TauCeti.EffectiveClassNumber.curve5077_minus_y_equation` (compatibility): Its native affine equation at (x,y) is equivalent to (−y)²−(−y)=x³−7x+6.
- `TauCeti.EffectiveClassNumber.curve5077_generator_coordinates` (example): The three affine pairs (0,2),(1,0),(2,0) lie on E₅₀₇₇.

Unit tests:

- `TauCeti.EffectiveClassNumber.curve5077_P0_test` (computation): (0,2) lies on E₅₀₇₇.
- `TauCeti.EffectiveClassNumber.curve5077_P1_test` (computation): (1,0) lies on E₅₀₇₇.
- `TauCeti.EffectiveClassNumber.curve5077_P2_test` (computation): (2,0) lies on E₅₀₇₇.
- `TauCeti.EffectiveClassNumber.curve5077_wrong_sign_test` (non-example): (0,−2) does not lie on the plus-y model.

Prerequisite chain: `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Affine.Equation`.

Source: BGZ85, Equation (2), p. 473; §2, pp. 475–476. The plus-y model has the three indicated independent rational points.; GZ86, I §8, p. 232. The minus-y model is the same ℚ-isomorphism class.

Acceptance: (0,2),(1,0),(2,0) satisfy the plus-y equation; under y↦−y they satisfy the minus-y equation.

### The BGZ derivative kernel

Target `AnalyticNumberTheoryPartII:ECN.2/bgz-kernel` (definition).

For integer r≥0 and real x>0, define G₀(x)=exp(−x) and, for r≥1, Gᵣ(x)=1/(r−1)! ∫₁^∞ exp(−xy)(log y)^(r−1) dy/y. Define its value to be 0 when x≤0. These kernels evaluate odd central derivatives of weight-two L-functions.

Proof route:

1. Use the native real set integral on [1,∞) and prove integrability for x>0.
2. Use domination on compact positive x-intervals to differentiate the integral and derive Gᵣ′(x)=−Gᵣ₋₁(x)/x for r≥1.
3. Compare log y with y−1 to obtain the explicit majorant Gᵣ(x)≤exp(−x)/x^r; use positive integrands for strict positivity.

Proposed API:

- `TauCeti.EffectiveClassNumber.bgzKernel_zero` (simp): For x>0, G₀(x)=exp(−x).
- `TauCeti.EffectiveClassNumber.bgzKernel_nonpositive` (simp): For x≤0 and every r, Gᵣ(x)=0.
- `TauCeti.EffectiveClassNumber.bgzKernel_pos` (structure): For x>0, Gᵣ(x)>0 for every r.
- `TauCeti.EffectiveClassNumber.bgzKernel_derivative` (structure): For r≥1 and x>0, HasDerivAt Gᵣ (−Gᵣ₋₁(x)/x) x.
- `TauCeti.EffectiveClassNumber.bgzKernel_exp_bound` (relation): For every r and x>0, Gᵣ(x)≤exp(−x)/x^r.
- `TauCeti.EffectiveClassNumber.bgzKernel_mellin` (compatibility): For r≥1,x>0,σ>0 the inverse Mellin transform of Γ(s)/s^r at x equals Gᵣ(x), with its vertical-integrability hypotheses proved.

Unit tests:

- `TauCeti.EffectiveClassNumber.bgzKernel_zero_at_one_test` (computation): G₀(1)=exp(−1).
- `TauCeti.EffectiveClassNumber.bgzKernel_boundary_test` (degenerate): G₃(0)=0.
- `TauCeti.EffectiveClassNumber.bgzKernel_one_positive_test` (characterisation): 0<G₁(1)<exp(−1).
- `TauCeti.EffectiveClassNumber.bgzKernel_three_tail_test` (characterisation): G₃(2)≤exp(−2)/8.

Prerequisite chain: `mathlib:mellinInv_mellin_eq`.

Source: BGZ85, §4, formulas (12)–(14), pp. 478–479. The derivative series contains a_n/n, and its tail is controlled by these positive kernels.

Acceptance: G₁(1) is positive and strictly less than exp(−1); the x≤0 convention is isolated from analytic statements.

### Conductors and root numbers of the two curves

Target `AnalyticNumberTheoryPartII:ECN.2/curve-local-data` (theorem).

E₁₃₉ has conductor 37·139²=714877 and root number −1; E₅₀₇₇ has conductor 5077 and root number −1. E₁₃₉ is the −139 twist of the conductor-37 isogeny class containing y²+y=x³+x²−3x+1. E₅₀₇₇ has nonsplit multiplicative reduction at 5077, good reduction elsewhere, and local bad Euler factor (1+5077^−s)^−1.

Hypotheses and conventions: Use minimal integral models and intrinsic conductors; Δ and conductor are different invariants.

Proof route:

1. Certify primality of 37,139,5077 and run the imported local reduction/Tate computations at each discriminant prime.
2. For E₁₃₉ compare to the −139 twist of the native conductor-37 curve and import the coprime twist conductor and root-number laws.
3. For E₅₀₇₇ use Δ=5077, c₄=336 and the node tangent test to establish nonsplit multiplicative reduction. Include the archimedean sign in the product.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.2/curve-139`, `AnalyticNumberTheoryPartII:ECN.2/curve-5077`, `tauceti:WeierstrassCurve.quadraticTwistOf`, `RankZeroOneBSD:BSD.0/twist-l-series`, `RankZeroOneBSD:BSD.0/twist-root-number`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `EllipticCurveModularity:R29.4/exact-conductor`, `EllipticCurveModularity:R29.4/bad-euler-factors`, `ComputationalNumberTheory:CN.3`, `ComputationalNumberTheory:CN.1`.

Source: O85, §4.3, p. 320. The first example is the −139 twist of the conductor-37 class.; BGZ85, §2 and §4, pp. 475, 477–478. The prime conductor and plus bad Euler factor fix the second example’s sign.; GZ86, I §§7–8, pp. 231–232. Both endpoint conductors are explicitly stated.

Acceptance: 714877=37·139²; no prime outside the stated conductor can acquire an Euler correction.

### Independent arithmetic rank certificates

Target `AnalyticNumberTheoryPartII:ECN.2/arithmetic-rank-certificates` (theorem).

The ℤ-finrank of E₁₃₉(ℚ)/tors is 3. For E₅₀₇₇, the affine points P₀=(0,2),P₁=(1,0),P₂=(2,0) form a ℤ-basis of E₅₀₇₇(ℚ); the torsion is trivial and the rank is 3. Each assertion uses a complete descent upper bound and a proven independence lower bound, not analytic-rank equality or a BSD leading-term conjecture.

Hypotheses and conventions: Arithmetic rank is Module.finrank ℤ of the existing PointModTorsion carrier. All finite Selmer/local-solubility checks have certified completeness, rather than found generators alone.

Proof route:

1. For E₅₀₇₇ use #E(𝔽₃)=7 and #E(𝔽₅)=10 to rule out rational torsion. Enclose its height Gram matrix and certify positive definiteness for P₀,P₁,P₂. BGZ’s height and Gram matrix use twice the pinned (O)-canonical height; divide by 2 before invoking the native pairing API.
2. Import the existing elliptic Layer-6 two-descent and the ED.3 finite local-image/saturation algorithms and certify that its complete rank upper bound is 3. The BGZ height enumeration and the mod-2 generation test prove saturation and a full basis.
3. For E₁₃₉ construct a complete two-descent certificate and three independent rational points, transporting rank through the source-model isomorphism or the proven isogeny; the missing explicit source data are recorded in the gap.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.2/curve-local-data`, `tauceti:WeierstrassCurve.Affine.PointModTorsion`, `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`, `EffectiveDiophantineMethods:ED.3`, `ComputationalNumberTheory:CN.3`, `ComputationalNumberTheory:CN.4`.

Source: BGZ85, §§1–2, pp. 473–476, especially p. 476. Height bounds and the complete 2-descent support the three-point basis.; GZ86, I Proposition (7.4), p. 231. The first curve’s arithmetic rank is asserted together with its analytic order; its finite descent data still need reconstruction.

Acceptance: A nonsingular 3×3 height matrix proves only rank≥3 unless the descent upper bound is also supplied.

### Certified odd central derivatives

Target `AnalyticNumberTheoryPartII:ECN.2/central-derivative-enclosures` (theorem).

Let f be a normalized weight-two newform of level N with real coefficients a_n, Fricke sign giving root number −1, and |a_n|≤τ(n)√n. Let L be its actual entire L-function. For odd r≥1 with ord₁L≥r, L^(r)(1)=2r!∑_{n≥1}(a_n/n)G_r(2πn/√N). For truncation B the absolute tail is at most 2r!∑_{n>B}τ(n)n^−1/2 exp(−αn)/(αn)^r, α=2π/√N; bound this tail by an explicit geometric bound after a verified monotonicity threshold. Rational enclosures of each finite term give certified central derivative boxes. For root number +1, the central-value formula is L(1)=2Σ(a_n/n)exp(−2πn/√N), with the same coefficient tail at r=0; this supplies the explicit −7 auxiliary twist certificate.

Hypotheses and conventions: L is the modular entire continuation agreeing with the intrinsic Euler series on Re(s)>3/2. The formula for L^(r) requires all lower derivatives to vanish; applying it to r=3 before L′(1)=0 would compute a completed-derivative expression instead.

Proof route:

1. Split the Mellin integral at y=1 using the Fricke reflection, differentiate under an integrable majorant, and integrate by parts to obtain the exact coefficient a_n/n.
2. Apply the BGZ kernel bound to the coefficient-wise tail, with divisor estimates and an explicit threshold for geometric comparison.
3. Evaluate exp/log/π and G_r by the imported validated-numerics interface. For 5077, first evaluate r=1; after exact vanishing, use r=3 and enclose L‴(1)/3! in (173/100,174/100).

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.2/bgz-kernel`, `RankZeroOneBSD:BSD.0/actual-l-function`, `EllipticCurveModularity:R29.4/bad-euler-factors`, `ComputationalNumberTheory:CN.4`, `ComputationalNumberTheory:CN.4/rational-interval-product-sound`, `ComputationalNumberTheory:CN.4/rational-interval-inverse-sound`.

Source: BGZ85, §4, formulas (10)–(14), pp. 478–479. Mellin splitting supplies the derivative series and the coefficient/kernel tail bound.

Acceptance: The leading coefficient for 5077 is certified between 1.73 and 1.74; a mere asymptotic G₃(x)∼x^−3exp(−x) is replaced by an actual inequality.

### Exact vanishing from a Heegner height gap

Target `AnalyticNumberTheoryPartII:ECN.2/heegner-height-gap` (theorem).

Suppose a Gross–Zagier specialization gives L′(E,1)L(E^χ,1)=c·ĥ(P), where c>0, P lies in the specified rational Mordell–Weil group, the twisted central value is nonzero, and every non-torsion point has ĥ(P)≥δ>0. If a certified enclosure gives |L′(E,1)L(E^χ,1)|<cδ, then P is torsion and L′(E,1)=0. If rootNumber E=−1 this raises ord₁L(E) from at least one to at least three.

Hypotheses and conventions: χ satisfies the precise classical/GZ.8 Heegner, conductor and local sign conditions; an explicit such twist with a certified nonzero value is required. Use the trace, not the averaged Heegner point; ĥ_K for 2(O) equals twice the existing canonicalHeight under the stated field-relative normalization. All inequalities are about the actual continued L-functions; δ is a proved gap, not a floating estimate of a regulator. For E₅₀₇₇ use χ_{−7}, conductor 248773 for the twist, certify 4<L(E^χ,1)<5 using a 2048-term exponential central-value sum with tail <10^−8, and prove the native height gap δ=1/4 from BGZ’s complete height-below-one enumeration and its three generator height enclosures.

Proof route:

1. Apply the imported elliptic Heegner height formula and its normalization comparisons. A lower enclosure for c and δ and an upper enclosure for the product prove the strict gap inequality.
2. A non-torsion P would contradict that inequality; torsion has exactly zero canonical height by the existing height API.
3. Since the twisted value is nonzero, deduce L′=0. Root-number parity then gives central order≥3.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.2/arithmetic-rank-certificates`, `AnalyticNumberTheoryPartII:ECN.2/central-derivative-enclosures`, `GrossZagierAndArithmeticHeights:GZ.8/elliptic-curve-heegner-height-formula`, `GrossZagierAndArithmeticHeights:GZ.8/petersson-norm-and-parametrisation-degree`, `RankZeroOneBSD:BSD.0/root-number-parity`, `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight`, `tauceti:WeierstrassCurve.quadraticTwistOf`, `ComputationalNumberTheory:CN.4`.

Source: BGZ85, §4, p. 479. The numerical first derivative becomes exact zero only after the nonzero-height lower bound.; O88, §8, p. 66. An explicit nonvanishing auxiliary twist and quantitative height gap justify the same deduction.

Acceptance: An interval containing 0 for L′ alone cannot conclude vanishing; both the twist nonvanishing and the height gap are checked.

### The conductor 37 Heegner trace vanishes

Target `AnalyticNumberTheoryPartII:ECN.2/heegner-trace-139` (theorem).

For the unique weight-two newform f in the relevant conductor-37 negative-Fricke eigenspace (root number +1), K=ℚ(√−139), and the normalized Heegner divisor on X₀(37), its f-isotypic trace is zero. The η quotient u(z)=η(z)^2/η(37z)^2 has divisor 3(0)−3(∞); the principal divisor of u−u(x) is the sum of the three Heegner points minus 3(∞). Consequently Gross–Zagier gives L′(1,f⊗χ_{−139})=0 after a certified L(f,1)≠0.

Hypotheses and conventions: The Heegner field has discriminant −139 and class number 3; 37 splits in K. The modular-unit/CM supplier proves u(x)∈H, u(x)^12=λ^12 for λ=(3+√−139)/2∈K of norm 37, Galois equivariance and exact divisor multiplicities. Here H is the Hilbert class field, [H:K]=3; control roots of unity in H rather than only units of K.

Proof route:

1. Import the modular η quotient, its cusp divisor and the CM twelfth-power relation. Since K=ℚ(√−139) contains neither i nor a primitive cube root of unity, adjoining either has degree 2 over K and cannot lie in the degree-3 extension H/K. Thus the twelfth roots of unity in H are ±1 and every CM value lies in {λ,−λ}. Galois equivariance and the orbit of size 3 force a single common value fixed by Gal(H/K), hence in K.
2. Subtract that common value and prove the divisor has exactly the three CM points and the order-three pole at infinity, including multiplicities. This makes the trace divisor principal in J₀(37).
3. Apply the classical Gross–Zagier formula to the trivial trace and divide by the nonzero conductor-37 value; transfer to the −139 twist.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.2/curve-local-data`, `GrossZagierAndArithmeticHeights:GZ.8/classical-gross-zagier-formula`, `ComputationalNumberTheory:CN.3`, `ComputationalNumberTheory:CN.4`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `EllipticCurveModularity:R29.5`.

Source: GZ83, Corollary 6 and its proof, p. 87. The modular-unit divisor makes the Heegner trace exactly zero; GZ86, I Proposition (7.4), p. 231. This is the referenced proof of the first curve’s vanishing Heegner point.

Acceptance: Class number 3 for −139 is certified directly by reduced forms in this layer’s inputs, not imported from the final enumeration. The unit group of K alone does not bound the quotient u(x)/λ, which initially belongs to H; the degree argument in H is required.

### Gross–Zagier’s rank three example

Target `AnalyticNumberTheoryPartII:ECN.2/rank-three-139` (theorem).

For E₁₃₉, ord_{s=1} L(E₁₃₉,s)=Module.finrank ℤ(E₁₃₉(ℚ)/tors)=3, with intrinsic conductor 714877. The analytic order is finite and is computed using the unique entire continuation of the native Euler coefficients.

Hypotheses and conventions: The exact central first derivative vanishes; the third derivative has a certified enclosure excluding 0. The arithmetic descent certificate is independent of these analytic assertions.

Proof route:

1. Use the vanishing conductor-37 Heegner trace, root number −1 and twist comparisons to prove order≥3.
2. Certify nonzero third derivative using the same general weight-two derivative enclosure at N=714877, increasing truncation and precision until 0 is excluded.
3. Combine with the independent arithmetic rank certificate; finite analytic order follows from a nonzero Euler value in the convergence half-plane.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.2/heegner-trace-139`, `AnalyticNumberTheoryPartII:ECN.2/central-derivative-enclosures`, `AnalyticNumberTheoryPartII:ECN.2/arithmetic-rank-certificates`, `RankZeroOneBSD:BSD.0/analytic-rank`.

Source: GZ86, I Proposition (7.4), p. 231. The two separately established ranks equal three for this exact curve.

Acceptance: No finite Sha or full rank-three BSD leading-term formula is inferred.

### Buhler–Gross–Zagier’s rank three example

Target `AnalyticNumberTheoryPartII:ECN.2/rank-three-5077` (theorem).

For E₅₀₇₇, ord_{s=1} L(E₅₀₇₇,s)=Module.finrank ℤ(E₅₀₇₇(ℚ)/tors)=3, with intrinsic conductor 5077. In particular L′(1)=0 and 173/100<L‴(1)/3!<174/100. The same result holds for the isomorphic minus-y source model.

Hypotheses and conventions: Use exact arithmetic and analytic certificates rather than equality to the conjectural regulator formula.

Proof route:

1. Apply the Heegner height-gap theorem to the r=1 enclosure, with a certified admissible nonvanishing twist and the rational-point height gap.
2. Root-number parity gives order≥3; the positive r=3 enclosure proves it is exactly 3.
3. Use the independent complete descent and point-basis theorem for the arithmetic rank and the y-sign isomorphism for the routed source equation.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.2/heegner-height-gap`, `AnalyticNumberTheoryPartII:ECN.2/central-derivative-enclosures`, `AnalyticNumberTheoryPartII:ECN.2/arithmetic-rank-certificates`, `AnalyticNumberTheoryPartII:ECN.2/curve-local-data`, `RankZeroOneBSD:BSD.0/analytic-rank`.

Source: BGZ85, §§2,4–5, pp. 476,478–481. The arithmetic basis and derivative computation support rank three; the Sha prediction is separate.; GZ86, I §8, p. 232. The second rank-three example supplies the improved class-number estimate.

Acceptance: L‴(1) lies between 10.38 and 10.44; the interval is for the uncompleted L-function after exact vanishing.

Layer status: **planned**. Reconstruct the recorded E₁₃₉ arithmetic descent witnesses; discharge ED.3, CN.3/CN.4 and R29.5 requests; certify the explicit nonvanishing twist and height gap for E₅₀₇₇.

## AnalyticNumberTheoryPartII:ECN.3 — Uniform logarithmic class-number bounds

For a rational weight-two newform f, start on the common convergence half-plane with Ψ=L(f)L(f⊗λ) and G=L(f⊗χ_D)/L(f⊗λ). The Liouville twist is a coefficient series, not a primitive Dirichlet twist. The symmetric-square identity identifies Ψ, with every bad factor and the motivic weight shift included. In particular, L(Sym²f,2s)=ζ(2s−1)∏_{p|N}(1−p^(1−2s))Ψ(s). The nonzero Petersson value at motivic s=2 and the zeta pole make Ψ have a **simple** zero at 1, independently of the analytic rank of L(f). A fixed assertion that the Liouville series has pole order two would fail for a higher central rank; the product is the stable statement.

The accepted AL.3 Rankin–Selberg pole criterion uses unitary normalization and does not by itself provide this motivic formula, the finite bad factors, or all strip bounds. The precise export is requested. For coprime d,N the scale is M=N/(4π²), and the product completion has plus sign when χ_D(−N)=1. A curve with order at least three does not automatically supply that sign for every negative discriminant.

When d overlaps N, use the actual primitive twist and its conductor N_χ. The scale becomes √(NN_χ)/(4π²d). The coprime formula a_nχ_D(n) cannot supply the bad factors at shared conductor primes. Oesterlé’s §4.2, pp. 319–320, replaces the affected factors of Ψ by those of the genuine twist before applying C1–C4.

For E₁₃₉ the finite scales are 37^α139^β/(4π²), with α=1 when 37 does not divide d and α=1/2 otherwise, and β=2 when 139 does not divide d and β=0 otherwise. The corrected 139 factor in Oesterlé §4.3, pp. 320–321, is (1+4ε·139^−s+139^(1−2s))^−1 when 139 divides d, with ε the primitive product character value at 139. It is 1 when 139 does not divide d. The trace a₁₃₉ of the conductor-37 base curve is −4, so both ε=+1 and ε=−1 cases are retained. Here the character obtained from χ_Dχ_−139 is the **associated primitive character after removing the common ramification**, whose conductor can drop. Its value at 139 is not the zero value of the naive pointwise product of the two imprimitive functions. A complete local table must account for both signs and every common conductor type.

The sign branch χ_D(37)=1 is handled by the split-prime estimate log(d/4)≤h log37. The other branch, including ramified 37, uses the corrected analytic systems. The maximum of the finite technical constants, together with the exact tiny-discriminant checks, gives θ(d)log d≤7000h. With E₅₀₇₇ and d coprime to 5077, the inert branch uses the analytic system and the split branch uses log(d/4)≤h log5077. These give the improved 55 bound. For a prime discriminant the required strict endpoint log d<55h retains a numerical margin; a non-strict certificate alone is not its proof.

Oesterlé’s Bourbaki §5.1, printed p. 321, reports 7000 and 55; his 1988 §9, pp. 66–67, states their consequences. Neither inspected passage prints a complete rational enclosure dataset at these exact constants. The plan specifies the residue/tail comparison and all local cases, but reconstruction of that dataset is the second recorded gap. It must certify c₁,c₂,c₃, the Petersson and scale factors, λ inequalities and the small-discriminant cutoffs. A reported decimal or integer is not an interval certificate.

The coprime theorem excludes divisibility of d by 5077. In the prime-discriminant class-number-three application, the only possible failure is d=5077, which is impossible: −5077≡3 mod4 and is odd, hence not fundamental. This argument excludes that absolute field discriminant for every imaginary quadratic field, independently of its class number. The improved constant therefore applies to every prime class-three discriminant.

Dependencies: `AnalyticNumberTheoryPartII:ECN.1`, `AnalyticNumberTheoryPartII:ECN.2`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `ComputationalNumberTheory:CN.4`.

### Goldfeld’s modular analytic system

Target `AnalyticNumberTheoryPartII:ECN.3/liouville-system` (theorem).

Let f be a normalized rational weight-two newform of conductor N with ord₁L(f)≥3. For imaginary quadratic K of discriminant −d, gcd(d,N)=1 and χ_K(−N)=1, set M=N/(4π²), Ψ=L(f)L(f⊗λ), G=L(f⊗χ_K)/L(f⊗λ). Interpret the Liouville series and quotients first on their common convergence half-plane and then meromorphically, with the ramified factors retained. These data satisfy C1–C4. In particular Ψ has a simple zero at 1 because its symmetric-square factor is nonzero there and ζ(2s−1)^−1 has a simple zero; this remains true if ord₁L(f)>3.

Hypotheses and conventions: The symmetric-square continuation, finite bad factors, Petersson-value identity and strip estimates are imported from AL.3. The product completion has plus sign because χ_K(−N)=1; a rank-three curve alone does not remove this local-sign hypothesis.

Proof route:

1. Use L(Sym² f,2s)=∏_{p|N}(1−p^(1−2s))·ζ(2s−1)·Ψ(s), the O85 (2.3.1) normalization. Confirm every p|N correction before solving for Ψ.
2. Use Hasse bounds and multiplicativity for C1; compare the local ratio with quadratic-character Euler factors for C2.
3. The completed product is d^−1Λ(f)Λ(f⊗χ), hence entire with plus reflection and order≥3. The symmetric-square quotient yields C4 and the certified positive c₁.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.1/oesterle-technical-bound`, `AnalyticNumberTheoryPartII:ECN.2/rank-three-139`, `RankZeroOneBSD:BSD.0/actual-l-function`, `RankZeroOneBSD:BSD.0/twist-l-series`, `RankZeroOneBSD:BSD.0/twist-root-number`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles`, `GrossZagierAndArithmeticHeights:GZ.8/petersson-norm-and-parametrisation-degree`, `mathlib:ArithmeticFunction.liouville`.

Source: O85, §2.3, formulas (2.3.1)–(2.3.3), p. 313; §4.1, Proposition 2, pp. 319–320. The Liouville quotient and symmetric square put the newform into the technical theorem’s hypotheses.

Acceptance: At a prime ramified in K but prime to N, G_p(1)=1+a_p/p+1/p≥1+1/p−floor(2√p)/p.

### All ramified quadratic-twist corrections

Target `AnalyticNumberTheoryPartII:ECN.3/ramified-twist-systems` (theorem).

When d and N overlap and the twist has the matching root sign, replace Ψ’s Euler factor at each p with p²|gcd(N,d²) by L_p(f⊗χ); put G=L(f)L(f⊗χ)/Ψ and M=√(NNχ)/(4π²d). The C1–C4 proof uses these actual bad factors. For fixed f the possible local conductor types and scales M form a finite list, so a common maximum of the technical constants controls every such K.

Hypotheses and conventions: Use the full bad-prime twist law, not the coprime coefficient identity a_nχ(n) at primes dividing both conductors. Retain the sign condition and the actual newform twist conductor Nχ.

Proof route:

1. Import local twist factors and conductor exponents from BSD.0/CN.3. Check C1 and C2 for each bad local case.
2. Identify the corrected degree-four completion with d^−1Λ(f)Λ(f⊗χ), preserving C3 and its central order.
3. Check C4 for each corrected Ψ using the fixed finite Euler factors and symmetric-square value; enumerate all possible M and take a certified common constant.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.3/liouville-system`, `RankZeroOneBSD:BSD.0/twist-local-factors`, `EllipticCurveModularity:R29.4/bad-euler-factors`, `ComputationalNumberTheory:CN.3`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

Source: O85, §4.2, p. 320. The common-divisor cases change both the auxiliary series and the completion scale.

Acceptance: For E₁₃₉ the scales are 37^a139^b/(4π²), a∈{1,1/2}, b∈{2,0}; whether 37 and 139 divide d determines the case.

### Oesterlé’s universal logarithmic bound

Target `AnalyticNumberTheoryPartII:ECN.3/global-7000` (theorem).

For every imaginary quadratic field K of fundamental discriminant −d, θ(d)log d≤7000h(K). The statement includes d=3,4 and all common factors with 37·139. The number 7000 is a certified rational output of the Oesterlé comparison, not an unspecified effectively computable constant.

Hypotheses and conventions: K is quadratic over ℚ with negative field discriminant; h is the native ideal class number.

Proof route:

1. Use the rank-three conductor-37 twist f₁ and the local systems from §4.3. For χ_K(−37)=−1, 37 splits and log(d/4)≤h log37 supplies the elementary branch.
2. For χ_K(−37)≠−1, apply the corrected C1–C4 system with all four scales and the conditional factor at 139 specified in the reader.
3. Generate rational certificates for the c₁/Petersson, strip, contour and λ inequalities guaranteeing C≤7000; verify d=3,4 and the finite small-discriminant thresholds by exact class-number bounds. The numerical certificate reconstruction is the recorded gap.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.3/ramified-twist-systems`, `AnalyticNumberTheoryPartII:ECN.2/rank-three-139`, `AnalyticNumberTheoryPartII:ECN.0/ramified-weight`, `AnalyticNumberTheoryPartII:ECN.0/split-prime-size`, `ComputationalNumberTheory:CN.4`, `ComputationalNumberTheory:CN.4/rational-interval-product-sound`, `ComputationalNumberTheory:CN.4/rational-interval-inverse-sound`.

Source: O85, Theorem 1, p. 310; §§4.3,5.1, pp. 320–321. The specialized rank-three curve yields the uniform constant 7000.

Acceptance: For odd h, θ(d)=1 and log d≤7000h; d sharing 37 or 139 is explicitly covered.

### The improved conductor 5077 bound

Target `AnalyticNumberTheoryPartII:ECN.3/coprime-55` (theorem).

For every imaginary quadratic K of fundamental discriminant −d with gcd(d,5077)=1, θ(d)log d≤55h(K). For a prime discriminant in this family the sharpened endpoint is log d<55h(K), as in GZ86 (8.2); the numerical certificate must retain a strict margin below 55. No 55 bound is asserted here when 5077 divides d.

Hypotheses and conventions: The conductor-5077 analytic order is exactly three; its arithmetic rank certificate supplies the height-gap proof of vanishing. Both χ_K(5077)=−1 analytic and χ_K(5077)=1 split-prime branches are treated.

Proof route:

1. For χ_K(5077)=−1, apply the Liouville system of E₅₀₇₇, with M=5077/(4π²), the actual nonsplit factor and a certified Petersson coefficient.
2. For χ_K(5077)=1 use log(d/4)≤h log5077 and check this implies the requested 55 inequality, since θ≤1 and h≥1.
3. Reconstruct the explicit analytic comparison certificates yielding 55, rather than using the reported constant as a proof. O88 §9 confirms the statement but does not print a complete numerical certificate.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.3/liouville-system`, `AnalyticNumberTheoryPartII:ECN.2/rank-three-5077`, `AnalyticNumberTheoryPartII:ECN.0/split-prime-size`, `ComputationalNumberTheory:CN.4`, `ComputationalNumberTheory:CN.4/rational-interval-product-sound`, `ComputationalNumberTheory:CN.4/rational-interval-inverse-sound`.

Source: O85, §5.1, p. 321. The improved constant is reported for the family coprime to 5077.; O88, §9, p. 67. The resulting class-number-three cutoff is log d≤165.; GZ86, I §8, p. 232. The second curve gives C(1)=55 on prime discriminants away from its conductor.

Acceptance: At h=3 and prime d≠5077, log d≤165. The coprimality restriction remains in the public signature.

### The exceptional prime discriminant is impossible

Target `AnalyticNumberTheoryPartII:ECN.3/exceptional-5077` (theorem).

For every imaginary quadratic field K, |discr K|≠5077. Negativity would give discr K=−5077, but −5077≡3 modulo 4 and is odd, so it is not a fundamental discriminant. No class-number hypothesis is required.

Hypotheses and conventions: K is a number field of degree two over ℚ with negative field discriminant; import the bridge to the native fundamental-discriminant predicate.

Proof route:

1. Use the quadratic field/fundamental-discriminant bridge to obtain IsFundamentalDiscriminant(discr K).
2. If |discr K|=5077, negativity gives discr K=−5077. Compute (−5077)%4=3 and 4∤−5077. Neither branch of the native fundamental-discriminant predicate holds.

Prerequisite chain: `tauceti:TauCeti.Multiquadratic.IsFundamentalDiscriminant`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

Source: O85, §1.1, p. 311; §5.1, p. 321. The fundamental-discriminant classification excludes −5077; the resulting coprimality is used in the class-number-three application of the improved constant.

Acceptance: This excludes 5077 before applying the coprime 55 theorem. The arithmetic is (−5077)%4=3 and (−5077)%8=3; a splitting argument at 2 cannot apply to this nonfundamental integer.

Layer status: **planned**. Reconstruct the recorded numerical comparison certificates for 7000 and 55 in every local-conductor case; discharge the symmetric-square and interval requests.

## AnalyticNumberTheoryPartII:ECN.4 — Explicit constants and effective finiteness

The explicit majorant is C_c(t)=c∏_{j<t−1}(p_j+1)/(p_j+1−2√p_j), with p₀=2 and empty product for t=0 or 1. The smooth reciprocal factor decreases with p>1, allowing an ordered prime list to be compared to the first primes. The floor-based factor is not monotone across primes: floor(2√2)/3=2/3, whereas floor(2√3)/4=3/4. Its monotonicity must not be used. Instead bound it by the smooth factor first. This gives θ(d)C_c(t)≥c and converts the two weighted inequalities into C_7000(t)h≥log d and, on the coprime family, C_55(t)h≥log d.

For the asymptotic, the logarithm of each smooth factor is 2/√p+O(1/p), and the prime number theorem with partial summation gives Σ_{j<t}p_j^−1/2∼2√(t/log t). The logarithmic error is lower order. Thus log C_c(t)∼4√(t/log t) for any fixed c>0. Current Tau Ceti already provides `TauCeti.primeNumberTheoremTransfer` (prime-boundary data to ψ, θ and π asymptotics) and `TauCeti.LSeries.wienerIkehara` (nonnegative coefficients and continuous boundary remainder to partial-sum asymptotics). AN.2 consumes those analytic inputs and supplies the nth-prime and weighted-sum consequences. The parent AN.2 export must handle zero-based indexing and the weighted prime sum; neither a mere assertion that primes have density 1/log x nor an unquantified numerical extrapolation suffices.

Effectivity can be established without waiting for an explicit PNT error term. The generous elementary estimates p_j≥j+2 and log((p+1)/(p+1−2√p))≤8/√p yield log C_7000(t)≤log7000+16√t. Genus theory bounds t≤1+log h/log2. Writing u=log h and δ=q/(1−q), for 0<q<1 the inequality 16√(u/log2)≤δu+64/(δlog2)≤δu+128/δ gives C_7000(t)<2^(45+ceil(256/δ))h^δ. Combining with log d≤C_7000(t)h gives h greater than the deliberately smaller κ(q)(log d)^(1−q), where κ(q)=2^−(46+ceil(256(1−q)/q)). The extra factor two keeps the final inequality strict. For q≥1 take κ=1/2 and use h≥1 and log d>1.

This rational witness is computable by comparisons, ceiling and integer exponentiation. For an arbitrary real ε>0, a rational 0<q≤min(ε,1) supplied as lower information gives the same result with ε, because log d>1. The theorem does not assert an algorithm which reads an arbitrary unrepresented real as if it were an exact rational.

At q=1/2 the witness is 2^−302. Hence h=H implies log d<2^604H² and d<exp(2^604H²). Since e<4, the integer B(H)=2^(2^605H²) is a complete computable cutoff. It is extremely large; efficiency is not the assertion. Exact reduced-form enumeration below B(H), with the fundamental-discriminant filter, determines the finite class-number-H list.

Siegel’s lower bound is imported from AN.4 as an existential comparison: for every η>0 a positive c_η gives h≥c_ηd^(1/2−η), without a procedure for its constant in that proof. The stronger power of d does not turn that witness into an effective one. The native real Dedekind-zeta residue formula is already available, but its right-hand limit alone is not a meromorphic continuation or the entire proof of Siegel’s theorem.

Dependencies: `AnalyticNumberTheoryPartII:ECN.3`, `AnalyticNumberTheory:AN.2`, `AnalyticNumberTheory:AN.4`.

### The explicit prime-product majorant

Target `AnalyticNumberTheoryPartII:ECN.4/prime-majorant` (definition).

For real c and natural t define C_c(t)=c ∏_{j=0}^{t−2}(p_j+1)/(p_j+1−2√p_j), where p_j=Nat.nth Nat.Prime j and the product is empty for t=0 or 1. This smooth majorant dominates 1/θ(d) for fields with t distinct discriminant primes and has a controlled asymptotic.

Proof route:

1. Use Finset.range (t−1), with natural subtraction and zero-based prime indexing.
2. The denominator is (√p_j−1)²>0. Compare an arbitrary ordered list of distinct primes to p_j using the decreasing smooth factor; do not assume the floor-based factors themselves are decreasing.

Proposed API:

- `TauCeti.EffectiveClassNumber.primeMajorant_zero` (simp): C_c(0)=c.
- `TauCeti.EffectiveClassNumber.primeMajorant_one` (simp): C_c(1)=c.
- `TauCeti.EffectiveClassNumber.primeMajorant_succ` (simp): For t≥1, C_c(t+1)=C_c(t)(p_{t−1}+1)/(p_{t−1}+1−2√p_{t−1}).
- `TauCeti.EffectiveClassNumber.primeMajorant_pos` (structure): If c>0 then C_c(t)>0.
- `TauCeti.EffectiveClassNumber.primeMajorant_monotone` (structure): If c≥0 then t↦C_c(t) is nondecreasing.
- `TauCeti.EffectiveClassNumber.primeMajorant_weight` (compatibility): For d>1 and t=d.primeFactors.card, θ(d)·C_c(t)≥c when c≥0.

Unit tests:

- `TauCeti.EffectiveClassNumber.primeMajorant_zero_test` (degenerate): C_7000(0)=7000.
- `TauCeti.EffectiveClassNumber.primeMajorant_one_test` (computation): C_55(1)=55.
- `TauCeti.EffectiveClassNumber.primeMajorant_two_test` (computation): C_55(2)=165/(3−2√2).
- `TauCeti.EffectiveClassNumber.primeMajorant_three_test` (computation): C_55(3)=660/((3−2√2)(4−2√3)).

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.0/ramified-weight`, `mathlib:Nat.prime_nth_prime`, `mathlib:Nat.add_two_le_nth_prime`.

Source: GZ86, I §8, bound (8.2) and the sentence following it, p. 232. The source requires an explicit t-dependent majorant with logarithm asymptotic 4√(t/log t).; O85, Theorem 1, pp. 310–311. The prime factors with the largest one removed determine the weight being majorized.

Acceptance: C_c(1)=c and C_c(2)=3c/(3−2√2); replacing t−1 by t violates the prime-discriminant endpoint.

### A computable rational lower-bound constant

Target `AnalyticNumberTheoryPartII:ECN.4/effective-kappa` (definition).

For rational q define κ(q)=0 if q≤0, κ(q)=1/2 if q≥1, and κ(q)=2^−(46+ceil(256(1−q)/q)) if 0<q<1. This explicit rational function is a deliberately generous effective witness for the universal logarithmic lower bound.

Proof route:

1. Use exact rational comparison, ceiling and natural exponentiation; this does not depend on a noncomputable choice of an analytic limit threshold.
2. Obtain the exponent from log C_7000(t)≤log 7000+16√t and genus divisibility; square-complete with δ=q/(1−q) and keep one extra factor 2 for the strict inequality.

Proposed API:

- `TauCeti.EffectiveClassNumber.effectiveKappa_nonpositive` (simp): If q≤0 then κ(q)=0.
- `TauCeti.EffectiveClassNumber.effectiveKappa_ge_one` (simp): If q≥1 then κ(q)=1/2.
- `TauCeti.EffectiveClassNumber.effectiveKappa_pos` (structure): For q>0, κ(q)>0.
- `TauCeti.EffectiveClassNumber.effectiveKappa_small` (characterisation): For 0<q<1 the exact rational value is 1/2^(46+ceil(256(1−q)/q)).
- `TauCeti.EffectiveClassNumber.effectiveKappa_computable` (data): κ on rational inputs is computed by exact comparisons, ceiling, and integer powers; no real-number oracle is used.
- `TauCeti.EffectiveClassNumber.effectiveKappa_lower_bound` (compatibility): For an imaginary quadratic field K and positive rational q, κ(q)(log |discr K|)^(1−q)<classNumber K after the universal logarithmic bound.

Unit tests:

- `TauCeti.EffectiveClassNumber.effectiveKappa_zero_test` (degenerate): κ(0)=0.
- `TauCeti.EffectiveClassNumber.effectiveKappa_one_test` (computation): κ(1)=1/2.
- `TauCeti.EffectiveClassNumber.effectiveKappa_half_test` (computation): κ(1/2)=1/2^302.
- `TauCeti.EffectiveClassNumber.effectiveKappa_quarter_test` (computation): κ(1/4)=1/2^814.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.4/prime-majorant`, `tauceti:NumberField.two_pow_classGroupTwoRank_dvd_classNumber`, `mathlib:Nat.add_two_le_nth_prime`.

Source: GZ86, Theorem (8.1), p. 232. The source requires an effectively computable positive constant for every positive exponent loss.; O85, Theorem 1 and genus consequences, pp. 310–311. The logarithmic inequality and genus divisibility provide an elementary route to this explicit witness; the precise rational formula is derived here.

Acceptance: κ(1/2)=2^−302 and κ(1/4)=2^−814; κ remains positive for every positive rational q.

### Prime-product domination of the ramified weight

Target `AnalyticNumberTheoryPartII:ECN.4/prime-product-bound` (theorem).

For d>1 with t distinct prime factors and c≥0, θ(d)C_c(t)≥c. For c>0, log C_c(t)≤log c+16√t. The floor-based factor is bounded below by 1−2√p/(p+1); the reciprocal smooth factor is decreasing for p>1 and its logarithm is at most 8/√p.

Hypotheses and conventions: Distinct primes are ordered increasingly, with the largest omitted in θ; no monotonicity of floor(2√p)/(p+1) is claimed.

Proof route:

1. Compare each floor-based factor to the smooth factor and each remaining prime to the corresponding p_j.
2. Write the smooth inverse as (p+1)/(√p−1)²; elementary calculus gives monotonicity and the uniform bound log of this ratio≤8/√p for p≥2.
3. Use p_j≥j+2 and ∑_{j<t−1}1/√(j+2)≤2√t.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.4/prime-majorant`, `AnalyticNumberTheoryPartII:ECN.0/ramified-weight`, `mathlib:Nat.add_two_le_nth_prime`.

Source: O85, Theorem 1 and displayed local factors, pp. 310–311. The ramified product is converted into a t-only majorant.; GZ86, I §8, p. 232. An explicit prime-product constant is required; the smooth majorant and generous elementary estimate are derived here.

Acceptance: At p=2 the factor has logarithm below 8/√2; the bound works without a PNT error term.

### Explicit t-dependent logarithmic bounds

Target `AnalyticNumberTheoryPartII:ECN.4/explicit-t-bound` (theorem).

Let t be the number of distinct prime factors of |discr K| for an imaginary quadratic field K. Then C_7000(t)h(K)≥log|discr K|. If gcd(|discr K|,5077)=1, then C_55(t)h(K)≥log|discr K|; in particular C_55(1)=55.

Hypotheses and conventions: The global and coprime constants have separate domains; for every imaginary quadratic field t≥1.

Proof route:

1. Multiply the θ-weighted bound by the prime-product majorant and cancel the positive θ.
2. Use the empty product convention at t=1; this is the correct prime-discriminant endpoint.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.3/global-7000`, `AnalyticNumberTheoryPartII:ECN.3/coprime-55`, `AnalyticNumberTheoryPartII:ECN.4/prime-product-bound`.

Source: GZ86, I bound (8.2), p. 232. The source logarithmic class-number bound is parametrized by distinct discriminant primes.

Acceptance: C_55(1)=55 is restricted to the coprime family; C_7000 is defined uniformly for all fields.

### The prime-product constant asymptotic

Target `AnalyticNumberTheoryPartII:ECN.4/asymptotic-constant` (theorem).

For every fixed real c>0, log C_c(t)/(4√(t/log t))→1 as t→∞ through natural numbers. Equivalently log C_c(t)∼4√(t/log t); use the natural logarithm and disregard the finitely many t≤1 in the quotient.

Hypotheses and conventions: PNT is imported from AN.2 with the nth-prime/weighted-prime-sum consequence stated precisely in the request.

Proof route:

1. Expand log((p+1)/(p+1−2√p))=2/√p+O(1/p), uniformly beyond a fixed small-prime threshold.
2. Use PNT and partial summation to obtain ∑_{p≤p_n}p^−1/2∼2√(n/log n). Bound ∑1/p as a lower-order term.
3. The fixed log c and deletion of one endpoint factor are negligible.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.4/prime-majorant`, `AnalyticNumberTheory:AN.2`.

Source: GZ86, I §8, sentence after (8.2), p. 232. The logarithm of an explicit constant has the stated asymptotic.

Acceptance: This asymptotic is independent of choosing c=55 or 7000, and is not used as an ineffective shortcut to compute κ.

### The effective logarithmic class-number theorem

Target `AnalyticNumberTheoryPartII:ECN.4/effective-logarithmic-bound` (theorem).

For every imaginary quadratic field K and every ε>0, there is an effectively computable κ(ε)>0, independent of K, such that h(K)>κ(ε)(log|discr K|)^(1−ε). For a positive rational loss q, the displayed exact rational effectiveKappa(q) is a uniform witness. For an arbitrary real ε, choose and supply a rational 0<q≤min(ε,1); κ(q) works because log|discr K|>1.

Hypotheses and conventions: Effectivity for a real parameter is presented by rational lower information q≤ε, rather than asserting a computable procedure on an arbitrary unrepresented real. Genus divisibility gives 2^(t−1)|h, including the direct exceptional radicand −1 check.

Proof route:

1. Put u=log h and δ=q/(1−q) for q<1. Genus theory gives t≤1+u/log2, and prime-product-bound gives C_7000(t)≤7000 exp(16)exp(16√(u/log2)).
2. Use 16√(u/log2)≤δu+64/(δlog2), log2≥1/2, exp(x)≤2^(2x) for x≥0, and 7000<2^13. Thus C_7000(t)<2^(45+ceil(256/δ))h^δ.
3. Combine log d≤C_7000(t)h and raise to the positive power 1−q; the extra exponent in κ yields the strict inequality. For q≥1 use h≥1 and log d>1.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.4/effective-kappa`, `AnalyticNumberTheoryPartII:ECN.4/explicit-t-bound`, `AnalyticNumberTheoryPartII:ECN.4/prime-product-bound`, `tauceti:TauCeti.Multiquadratic.ncard_ramifiedPrimes_sub_one_le_twoRank`, `tauceti:NumberField.two_pow_classGroupTwoRank_dvd_classNumber`, `mathlib:NumberField.classNumber_pos`.

Source: GZ86, I Theorem (8.1), p. 232. The source’s effective logarithmic bound is realized with an explicit rational witness derived from the ramified product.

Acceptance: At ε=1/2, h>2^−302√(log d); no Siegel zero or GRH hypothesis occurs.

### Effective fixed-class-number finiteness

Target `AnalyticNumberTheoryPartII:ECN.4/effective-cutoff` (theorem).

For every prescribed integer H≥1, an imaginary quadratic field of class number H satisfies |discr K|<exp(2^604 H²), by applying q=1/2. A computable integer bound is B(H)=2^(2^605 H²), so |discr K|<B(H). Consequently a complete reduced-form/class-group enumeration over the finite fundamental discriminant range below B(H) decides the class-number-H list.

Hypotheses and conventions: H≥1; the integer bound is deliberately very large and expresses effectivity rather than computational practicality.

Proof route:

1. Square the strict q=1/2 lower bound to get log d<2^604H².
2. Use exp(x)≤2^(2x) to replace the real exponential cutoff by an exact natural number.
3. Apply the imported complete binary-form/class-group algorithm over negative fundamental discriminants only.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.4/effective-logarithmic-bound`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `ComputationalNumberTheory:CN.2/certified-class-unit-completeness`.

Source: O85, §3.6, p. 319. A uniform analytic comparison makes the fixed-class-number range effectively finite.; GZ86, I §8, p. 232. The logarithmic bound permits explicit complete class-number determination.

Acceptance: Finite termination is unconditional; the bound does not purport to be efficient.

### Effective logarithmic and ineffective power bounds

Target `AnalyticNumberTheoryPartII:ECN.4/siegel-comparison` (theorem).

The effective κ theorem and the analytic class-number formula coexist with Siegel’s statement: for every η>0 there exists c_η>0 with h(K)≥c_η|discr K|^(1/2−η), where no algorithm for c_η is supplied by Siegel’s proof. Export the distinction between a constructive rational logarithmic witness and a stronger existential power bound; neither theorem silently changes the other’s quantifiers.

Hypotheses and conventions: The Siegel theorem is requested from the parent analytic interface, since the audited AN.3–AN.4 descriptions do not already name an exact export.

Proof route:

1. Import Siegel’s existential lower bound and the native class-number formula from AN.4.
2. Compare the domains, exponent parameters and witnesses; make no deduction of an effective Siegel constant from the weaker logarithmic estimate.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.4/effective-logarithmic-bound`, `AnalyticNumberTheory:AN.4`, `mathlib:NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`.

Source: G77, §1, p. 219. The older ineffective power lower bound motivates the effective logarithmic problem.; O85, Introduction, pp. 309–310. The new argument establishes effective finiteness rather than an effective Siegel constant.

Acceptance: This is a comparison target; Siegel theory is not replanned as a new proof here.

Layer status: **planned**. Discharge the PNT and parent Siegel comparison requests; verify the explicit rational κ proof after the numerical bound gap is resolved.

## AnalyticNumberTheoryPartII:ECN.5 — The class number three discriminants

Odd class number and genus divisibility first force one distinct discriminant prime. For h=3 the only even one-prime field discriminants, −4 and −8, are excluded by their exact class numbers. Thus D=−p with p an odd prime congruent to 3 modulo 4, and θ(p)=1. This reduction is essential both for the sieves and for the constant 55.

The historical exclusion has two ranges, and the formal plan keeps them separate. Montgomery–Weinberger’s actual theorem, printed p. 530, excludes 10^12≤d≤10^2500. Their introduction cites the earlier smaller-range computation. Oesterlé’s compressed account in Bourbaki §5.1, p. 321, discusses the full range above 907 while attributing the exclusion to Montgomery–Weinberger; this must not replace the two underlying proofs. The interval 907<d<10^12 is supplied by the Lehmer–Lehmer–Shanks character sieve and exact finite enumeration.

For the large range, use primitive real odd characters χ_{−17923}, χ_{−115147} and χ_{−123204}, with positive conductors k=17923,115147,123204. Certify the negative fundamental discriminants, their factorizations and primitivity. Character values use the signed discriminant D=−k, including the 2-adic values −1,−1,0; the completion has gamma factor Γ((s+1)/2). Rational outward signs for the real Hardy function bracket a critical-line zero for each character; continuity and the intermediate value theorem give existence. Neither GRH nor a claim that the zero is the least positive one is needed. Table I, p. 537, supplies starting approximations only. The broad brackets below must be refined enough to validate every phase inequality.

MW’s reduced-form decomposition gives a positive amplitude, a phase and an error bound at each chosen zero. Retain its log-gamma terms and use its Lemmas 1–9, printed pp. 532–539, and §5’s numerical error control, pp. 539–542. The character 17923 excludes 10^12 through 10^52. The character 115147 covers the larger interval through 10^2500 except the windows 10^850–10^860 and 10^1705–10^1735. The 123204 phase excludes both windows. Endpoint overlap and monotonicity must be certified; point samples cannot establish a phase bound over an interval.

For the smaller range, primitive reduced forms enumerate every negative fundamental discriminant up to 318028. Above that threshold, h=3 forces every prime q≤43 to be inert because d>4·43³. A complete residue/primality sieve gives the least allowed prime at least 1333963. Since 4·67³<1333963, the 67-pattern is required and its certified least bound is 51599563. Since 4·163³<51599563, the 163-pattern is required and its bound is 1432817816347>10^12. Lehmer–Lehmer–Shanks, Table III, p. 440, gives these least-prime thresholds; pp. 445–447 apply the patterns to class number three. Every residue segment must be covered. Historical approximate L-values and a list of candidates alone do not certify exclusion. The more extensive 7079-pattern iteration is unnecessary for this interval.

For h=3, exclude d=5077 first and apply the prime-discriminant 55 bound, obtaining log d≤165. A certified elementary log inequality gives d<10^72<10^2500. Split all d>907 at 10^12 and apply the two exclusions. The resulting d≤907 makes the final enumeration tiny. Enumerate every primitive reduced form, including the sign convention on its boundary, and filter to field discriminants. Exactly sixteen fields have three classes. The three representatives for −907 are (1,1,227),(13,9,19),(13,−9,19). The discriminant −243 is a quadratic-order discriminant and must fail the fundamental-discriminant filter.

This layer’s acceptance requires sound certificate checkers, complete finite coverage and the analytic cutoff together. A numerical upper bound on log d alone does not prove the maximum 907, and a successful search below 907 does not exclude larger fields.

Dependencies: `AnalyticNumberTheoryPartII:ECN.3`, `AnalyticNumberTheoryPartII:ECN.4`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `ComputationalNumberTheory:CN.1`, `ComputationalNumberTheory:CN.2`, `ComputationalNumberTheory:CN.4`.

### Class number three forces a prime discriminant

Target `AnalyticNumberTheoryPartII:ECN.5/class-three-prime` (theorem).

If K is imaginary quadratic and h(K)=3, then discr K=−p where p is an odd prime with p≡3 mod4. In particular t=1 and θ(p)=1.

Hypotheses and conventions: Use the existing genus lower bound and class-number divisibility, not a new genus theory development.

Proof route:

1. Since h is odd, 2^(t−1)|h forces t=1. Classify negative fundamental discriminants with one distinct prime factor.
2. The only even one-prime cases are −4 and −8 and have class number 1 by a complete tiny reduced-form computation; discard them.
3. The remaining fundamental discriminant is a negative prime −p with p≡3 mod4.

Prerequisite chain: `tauceti:TauCeti.Multiquadratic.ncard_ramifiedPrimes_sub_one_le_twoRank`, `tauceti:NumberField.two_pow_classGroupTwoRank_dvd_classNumber`, `tauceti:TauCeti.Multiquadratic.IsFundamentalDiscriminant`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `AnalyticNumberTheoryPartII:ECN.0/ramified-weight`.

Source: GZ86, I §8, genus divisibility, p. 232. The prime-count restriction follows from the existing genus factor.; LLS70, Class number three discussion, pp. 445–446. The class number three sieve concerns prime discriminants.

Acceptance: −3 is fundamental but has h=1; −243 is a nonmaximal order discriminant and is outside the theorem.

### Certified Montgomery–Weinberger zero brackets

Target `AnalyticNumberTheoryPartII:ECN.5/mw-zero-brackets` (theorem).

For the primitive real odd quadratic characters χ_D of negative fundamental discriminants D=−k, k=17923,115147,123204, certify the existence of a critical-line zero 1/2+iγ in the rational brackets [30985/10^6,30987/10^6], [3157/10^6,3159/10^6], [10649/10^6,10651/10^6] respectively, after validating outward endpoint signs of the real completed Hardy function. The broader brackets may be tightened to recover every source phase inequality. The theorem asserts an existing zero, not that it is the first zero.

Hypotheses and conventions: 17923 is prime, 115147=113·1019, and 123204=4·3·10267. Prove that −17923, −115147 and −123204 are fundamental discriminants; their primitive characters have conductor k and χ_D(−1)=−1. At odd primes p use (D/p), and at 2 use χ₈(D mod8), including the value 0 for even D. The zero bracket is obtained from a real Hardy-function sign change; no assertion of GRH or simplicity is needed.

Proof route:

1. Use the source Lavrik approximate functional equation, or the exact imported primitive-character L evaluator plus certified gamma and phase factors, to enclose the real completed Hardy function at rational endpoints. Use the odd-character gamma factor Γ((s+1)/2) and conductor k=|D|, with D=−k throughout the character evaluations.
2. Refine endpoint intervals until their signs are strictly opposite; prove continuity and apply the intermediate value theorem.
3. Re-evaluate every phase bound with the resulting rational γ enclosure, rather than copying a six-digit zero as an exact real constant.

Prerequisite chain: `ComputationalNumberTheory:CN.4/dirichlet-l-value-enclosure`, `ComputationalNumberTheory:CN.4`, `ComputationalNumberTheory:CN.1`, `AnalyticNumberTheory:AN.4`, `mathlib:DirichletCharacter.LFunction`, `mathlib:legendreSym`, `mathlib:ZMod.χ₈`.

Source: MW74, Table I, p. 537; §5, pp. 539–542, especially odd parity and gamma factor on p. 540. The three primitive real odd characters with conductors k and their small-height zeros drive the class-number-three exclusion.

Acceptance: A sign certificate must exclude 0 at each endpoint; an enclosure containing 0 alone does not certify a zero. χ_{−17923}(−1)=−1 and χ_{−17923}(3)=−1. Replacing −k by +k would give (17923/3)=+1 and fails this normalization check. The 2-adic values for the three signed discriminants are −1,−1,0.

### The Montgomery–Weinberger exclusion interval

Target `AnalyticNumberTheoryPartII:ECN.5/mw-phase-exclusion` (theorem).

No imaginary quadratic field of fundamental discriminant −d with 10^12≤d≤10^2500 has class number 3. For a prime class-three discriminant, MW’s phase identity at the three certified critical-line zeros yields incompatible phase intervals on the complete stated range.

Hypotheses and conventions: Use class-three-prime to reduce to odd prime d; then gcd(d,k)=1 for all three auxiliary k. Only the existence of the three certified critical-line zeros is used; no GRH or unproved least-zero statement is imported. Every auxiliary character is χ_{−k} for k=17923,115147,123204, primitive and odd; retain the odd-character gamma phase.

Proof route:

1. Develop the source’s positive amplitude M(t), phase φ(t) and error E(t) from the reduced-form zeta decomposition; use Lemmas 1–9 to bound them at the chosen zero γ, retaining all real/log-gamma terms.
2. For k=17923 exclude 10^12≤d≤10^52. For k=115147 exclude 10^52≤d≤10^2500 except the explicit windows 10^850–10^860 and 10^1705–10^1735.
3. For k=123204 exclude both windows with its independent phase inequalities. Use outward rational interval certificates for all endpoints and the proved monotonicity on each interval, including boundary overlaps.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.5/mw-zero-brackets`, `AnalyticNumberTheoryPartII:ECN.5/class-three-prime`, `AnalyticNumberTheoryPartII:ECN.0/split-prime-size`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `AnalyticNumberTheory:AN.4`, `ComputationalNumberTheory:CN.4`, `ComputationalNumberTheory:CN.4/rational-interval-product-sound`, `ComputationalNumberTheory:CN.4/rational-interval-inverse-sound`.

Source: MW74, Theorem, p. 530; §§3–4, equations and Lemmas 1–9, pp. 532–539. The actual theorem covers 10^12 to 10^2500, with three auxiliary phases covering the exceptional windows.

Acceptance: All interval boundaries are covered by closed intervals; no conclusion for 907<d<10^12 is attributed to this theorem.

### The class number three small-range sieve

Target `AnalyticNumberTheoryPartII:ECN.5/small-range-sieve` (theorem).

No negative fundamental discriminant −d with 907<d<10^12 has class number 3. Prove this by exact reduced-form enumeration up to 318028 and complete quadratic-character pattern certificates beyond that point. For a hypothetical prime d of class number 3, the split-prime bound forces χ_{−d}(q)=−1 for all primes q≤43 when d>4·43³=318028. The least prime with the required all-inert pattern is at least 1333963; successively the 67 and 163 patterns force d≥51599563 and d≥1432817816347>10^12.

Hypotheses and conventions: Character-pattern sieves cover all integers in the stated bounded search range, not only a list of found candidates. Use exact prime/modular residue certificates; historical approximate L-values and unproved class-group tables are not stopping criteria.

Proof route:

1. Certify every negative fundamental discriminant with 907<d≤318028 by the finite reduced-form completeness theorem. For p≡7 mod8, 2 splits and 4·2³≥p rules out p>32.
2. Construct a complete segmented CRT/residue sieve for primes p≡3 mod8 whose characters at every prime q≤43 are −1, and prove its least candidate is ≥1333963.
3. Because 4·67³<1333963, require the 67 pattern and certify no candidate below 51599563; because 4·163³<51599563 require the 163 pattern and certify no candidate below 1432817816347. This final bound contradicts d<10^12. The stronger 7079 iteration mentioned by LLS is not required.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.5/class-three-prime`, `AnalyticNumberTheoryPartII:ECN.0/split-prime-size`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `ComputationalNumberTheory:CN.1`, `ComputationalNumberTheory:CN.2`, `AnalyticNumberTheory:AN.4`.

Source: LLS70, Class number three application, pp. 445–447; Table III, p. 440; sieve construction and tables, pp. 438–444,448–451. Successive complete least-pattern bounds rule out the small range; the finite certificates must be regenerated.

Acceptance: The numeric equalities 4·43³=318028 and 1432817816347>10^12 are exact; the sieve covers every residue segment. Table III’s least prime solutions for the 43,67,163 patterns are 1333963,51599563,1432817816347. Preserve the distinction between least integer and least prime solutions; candidate sign checks alone do not certify minimality.

### The complete class number three cutoff

Target `AnalyticNumberTheoryPartII:ECN.5/class-three-cutoff` (theorem).

If K is imaginary quadratic with h(K)=3, then |discr K|≤907. The coprime prime-discriminant bound first gives log|discr K|≤165, hence |discr K|<10^72<10^2500; the small-range and Montgomery–Weinberger exclusions remove every remaining d>907.

Hypotheses and conventions: The excluded prime 5077 is handled by exceptional-5077 before applying the 55 estimate.

Proof route:

1. Use class-three-prime to get θ=1, then exceptional-5077 to discharge coprimality. Apply coprime-55 with h=3.
2. Certify 165<72 log10, yielding exp165<10^72. The upper endpoint lies far below MW’s upper range.
3. Split d>907 into d<10^12 and d≥10^12 and apply the respective complete exclusions.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.3/coprime-55`, `AnalyticNumberTheoryPartII:ECN.3/exceptional-5077`, `AnalyticNumberTheoryPartII:ECN.5/class-three-prime`, `AnalyticNumberTheoryPartII:ECN.5/small-range-sieve`, `AnalyticNumberTheoryPartII:ECN.5/mw-phase-exclusion`, `ComputationalNumberTheory:CN.4`.

Source: GZ86, I §8, p. 232. The effective bound and the prior exclusion computations yield the maximum 907.; O88, §9, p. 67. The improved cutoff log d≤165 is sufficient for the complete class number three determination.

Acceptance: The analytic cutoff does not by itself imply d≤907; both independent exclusion intervals are necessary.

### The sixteen class number three discriminants

Target `AnalyticNumberTheoryPartII:ECN.5/class-three-enumeration` (theorem).

For every imaginary quadratic field K, h(K)=3 iff discr K belongs to {−23,−31,−59,−83,−107,−139,−211,−283,−307,−331,−379,−499,−547,−643,−883,−907}. All sixteen are negative fundamental discriminants. Therefore the largest absolute discriminant is 907, attained by ℚ(√−907).

Hypotheses and conventions: Class number means the maximal-order ideal class number, with proper oriented binary-form equivalence as the enumeration bridge.

Proof route:

1. Apply class-three-cutoff to reduce to d≤907. Enumerate primitive reduced positive-definite forms with |b|≤a≤c, b≥0 when |b|=a or a=c, discriminant b²−4ac=−d and a≤√(d/3).
2. Use the imported form/ideal-class bijection to equate the exact count with classNumber K; filter to negative fundamental discriminants and count exactly three classes.
3. Certify all sixteen counts, exclude every other fundamental d≤907 and identify ℚ(√−907) via the existing fundamental-discriminant API.

Prerequisite chain: `AnalyticNumberTheoryPartII:ECN.5/class-three-cutoff`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `tauceti:TauCeti.Multiquadratic.IsFundamentalDiscriminant`, `mathlib:NumberField.classNumber`.

Source: GZ86, I §8, final paragraph, p. 232. The source concludes that exactly sixteen imaginary quadratic fields have class number three and the maximum is 907.; LLS70, Class number three application, pp. 445–447. The two 7 mod8 primes and fourteen 3 mod8 primes give the candidate list, checked here by exact reduced forms.

Acceptance: For −907 the reduced representatives are (1,1,227),(13,9,19),(13,−9,19); −243 is rejected as nonfundamental.

Layer status: **planned**. Generate the MW Hardy-sign/phase interval certificates and LLS complete residue-sieve certificates; discharge form/character requests and the inherited 55 gap.

## Certificate gaps and supplier acceptance

### Reconstruct the explicit arithmetic descent certificate for E₁₃₉

GZ86 Proposition (7.4) states arithmetic rank 3 and GZ83 Corollary 6 proves the Heegner vanishing, but neither inspected passage prints a complete two-descent upper-bound certificate and three independent rational points for this model. The existing elliptic Layer 6 owns general two-descent; ED.3 owns finite local-image and saturation refinements, integrated through CN.3. A follow-up must produce and validate the actual finite descent/independence witnesses, or read a primary proof with those data, then transport through the explicitly checked source isomorphism/isogeny. Analytic rank 3 is not a replacement.

Affected targets: `AnalyticNumberTheoryPartII:ECN.2/arithmetic-rank-certificates`, `AnalyticNumberTheoryPartII:ECN.2/rank-three-139`.

### Reconstruct certified numerical constants 7000 and 55

O85 §3 provides the residue/tail/λ comparison, §5.1 reports 7000 and 55, and O88 §9 reports their consequences. The inspected publications do not print a complete rational interval dataset verifying all c₁,c₂,c₃, corrected Ψ factors, scales, λ and small-discriminant cutoffs at these exact constants, including the strict prime-discriminant margin below 55. The target statement and comparison construction are specified, but the numerical inequalities have not been independently established in this design run. A follow-up must regenerate and validate them for every finite ramified case before these stages can be closed.

Affected targets: `AnalyticNumberTheoryPartII:ECN.3/global-7000`, `AnalyticNumberTheoryPartII:ECN.3/coprime-55`.

### Request to `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`

Import the existing Layer-4 minimal-equation reduction and Tate-algorithm correctness interfaces: invariance under integral model changes, split/nonsplit tests, local minimal discriminant and algorithmic Ogg exponents. The actual ramification-theoretic conductor and Euler-factor bridge comes from R29.4. This is an existing upstream prerequisite, not a request to plan or modify Tau Ceti’s roadmap; CN.3 checks the two concrete curves using these exports.

Consumers: `AnalyticNumberTheoryPartII:ECN.2/curve-local-data`.

### Request to `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`

Import the existing Layer-6 explicit étale-algebra two-descent, complete local conditions, finite two-Selmer group and its Mordell–Weil rank bound; also import the independent-point/height and good-odd-prime torsion-reduction interfaces. ED.3 supplies finite computational refinements and CN.3 integrates their verification. This records an existing upstream prerequisite without re-planning it; preserve the native canonical-height normalization discussed in upstreamNotes.

Consumers: `AnalyticNumberTheoryPartII:ECN.2/arithmetic-rank-certificates`.

### Request to `GeometryOfNumbersAndQuadraticArithmetic:GN.3`

For negative fundamental D, consume the current TauCetiRoadmap IntegralLattices Layer B, B1/B2/B5: quadratic orders, the proper primitive positive-definite binary-form/Picard-class dictionary and finite reduced-form enumeration are already owned there, not new GN.3 targets. Supply only the maximal-order Picard-to-native-ClassGroup bridge, the boundary convention |b|≤a≤c with b≥0 on boundary, cardinality h(D) and the explicit a≤√(|D|/3) enumeration adapter, the bridge from degree-two field discriminants to the native fundamental-discriminant predicate and the squarefree-radicand/integral-generator bridge used by the pinned genus theorem, and the nonaxial measure estimate ∫₀ᴬN_q(t)dt≤∫₀ᴬ(πt/√d)·1_[√d/2,∞)(t)dt for every A≥0, with nonaxial support t≥√d/2 for reduced forms as in O85 §1.3. Existing upstream owner: tauceti:TauCetiRoadmap/IntegralLattices#layer-b-binary-lattices-and-quadratic-orders.

Consumers: `AnalyticNumberTheoryPartII:ECN.0/split-prime-size`, `AnalyticNumberTheoryPartII:ECN.1/positive-mellin-comparison`, `AnalyticNumberTheoryPartII:ECN.1/tail-three-pieces`, `AnalyticNumberTheoryPartII:ECN.2/arithmetic-rank-certificates`, `AnalyticNumberTheoryPartII:ECN.2/heegner-trace-139`, `AnalyticNumberTheoryPartII:ECN.4/effective-cutoff`, `AnalyticNumberTheoryPartII:ECN.5/class-three-prime`, `AnalyticNumberTheoryPartII:ECN.5/mw-phase-exclusion`, `AnalyticNumberTheoryPartII:ECN.5/small-range-sieve`, `AnalyticNumberTheoryPartII:ECN.5/class-three-enumeration`, `AnalyticNumberTheoryPartII:ECN.3/exceptional-5077`.

### Request to `AnalyticNumberTheory:AN.4`

Export the primitive quadratic Dirichlet character χ_D with all ramified and 2-adic evaluations; the normalized partial-zeta identities O85 (1.3.1)–(1.3.2), especially ζ_K(s)/ζ(2s)=Σ_q(a(q)^−s+Σ_{m∈ℤ,n>0,gcd(m,n)=1}q(m,n)^−s), and its nonnegative coefficients. Supply Siegel’s ineffective h(D)≥c_η|D|^(1/2−η) as a parent comparison theorem. The pinned real residue theorem is already imported and is not a new target here.

Consumers: `AnalyticNumberTheoryPartII:ECN.0/liouville-agreement`, `AnalyticNumberTheoryPartII:ECN.1/tail-three-pieces`, `AnalyticNumberTheoryPartII:ECN.4/siegel-comparison`, `AnalyticNumberTheoryPartII:ECN.5/mw-zero-brackets`, `AnalyticNumberTheoryPartII:ECN.5/mw-phase-exclusion`, `AnalyticNumberTheoryPartII:ECN.5/small-range-sieve`.

### Request to `AutomorphicLFunctionsAndLocalFactors:AL.3`

For a rational weight-two newform, identify its Liouville coefficient series with the motivic symmetric-square Euler product via O85 (2.3.1)–(2.3.3), including ∏_{p|N}(1−p^(1−2s)), gamma factors, continuation, nonzero Petersson value at motivic s=2 and quantified vertical-strip bounds. The accepted rs-global-poles node alone states a unitary Rankin–Selberg pole criterion and does not supply these finite-prime/weight shifts.

Consumers: `AnalyticNumberTheoryPartII:ECN.3/liouville-system`, `AnalyticNumberTheoryPartII:ECN.3/ramified-twist-systems`.

### Request to `ComputationalNumberTheory:CN.3`

Supply verification adapters for the two explicit curves’ intrinsic local reduction/conductor/root-number computations, importing EllipticCurves Layer 4 and R29.4, and integrate EllipticCurves Layer 6/ED.3 descent and point verification certificates. Do not re-plan general two-descent or saturation, which already have those owners. Export modular η-quotient divisor and exact CM-value/Galois comparisons for GZ83 Corollary 6 on X₀(37), through the modular-form and modular-curve owners. For K=ℚ(√−139) and its degree-3 Hilbert class field H, the CM comparison must export u(x)∈H and u(x)^12=((3+√−139)/2)^12, with Galois equivariance and exact divisor multiplicities. The exclusion of order-3/4 roots of unity inside H and the common-value argument are proved in this roadmap. Exact curve-specific witnesses and computations remain in this roadmap.

Consumers: `AnalyticNumberTheoryPartII:ECN.2/curve-local-data`, `AnalyticNumberTheoryPartII:ECN.2/arithmetic-rank-certificates`, `AnalyticNumberTheoryPartII:ECN.2/heegner-trace-139`, `AnalyticNumberTheoryPartII:ECN.3/ramified-twist-systems`.

### Request to `ComputationalNumberTheory:CN.4`

Extend the accepted level-one cuspLBox export to arbitrary-level normalized weight-two newforms with Fricke sign and all bad factors, supporting first/third derivatives of their actual entire L-functions. Supply rational enclosures for exp, log, π, Γ/logΓ and the positive BGZ integral kernels, with rigorous truncation and rounding bounds, and certified canonical-height/Petersson/local-scale enclosures. For MW supply real Hardy-function endpoint signs for primitive odd quadratic characters χ_{−k}, k=17923,115147,123204, via continued L-values and the Γ((s+1)/2) gamma phase. The existing Dirichlet-L boxes and interval soundness nodes are imported; general interval arithmetic is not replanned here.

Consumers: `AnalyticNumberTheoryPartII:ECN.1/oesterle-technical-bound`, `AnalyticNumberTheoryPartII:ECN.2/arithmetic-rank-certificates`, `AnalyticNumberTheoryPartII:ECN.2/central-derivative-enclosures`, `AnalyticNumberTheoryPartII:ECN.2/heegner-height-gap`, `AnalyticNumberTheoryPartII:ECN.2/heegner-trace-139`, `AnalyticNumberTheoryPartII:ECN.3/global-7000`, `AnalyticNumberTheoryPartII:ECN.3/coprime-55`, `AnalyticNumberTheoryPartII:ECN.5/mw-zero-brackets`, `AnalyticNumberTheoryPartII:ECN.5/mw-phase-exclusion`, `AnalyticNumberTheoryPartII:ECN.5/class-three-cutoff`.

### Request to `EffectiveDiophantineMethods:ED.3`

Export complete finite local-image checks with certified precision and saturation verification for the existing elliptic Layer-6 two-descent. Preserve both a certified rank upper bound and an independent-point lower bound; this roadmap supplies the actual two curve-specific witnesses, while ED.3 owns the general finite refinement.

Consumers: `AnalyticNumberTheoryPartII:ECN.2/arithmetic-rank-certificates`, `AnalyticNumberTheoryPartII:ECN.2/heegner-height-gap`, `AnalyticNumberTheoryPartII:ECN.2/rank-three-139`, `AnalyticNumberTheoryPartII:ECN.2/rank-three-5077`.

### Request to `ComputationalNumberTheory:CN.1`

Export complete primality/factorization certificates for 37,139,5077 and the MW discriminants, and a complete finite segmented residue/primality sieve whose coverage certificate proves no omitted candidate below a bound. No probable-prime filter may be used as a proof of exclusion.

Consumers: `AnalyticNumberTheoryPartII:ECN.2/curve-local-data`, `AnalyticNumberTheoryPartII:ECN.5/mw-zero-brackets`, `AnalyticNumberTheoryPartII:ECN.5/small-range-sieve`.

### Request to `ComputationalNumberTheory:CN.2`

Supply complete bounded integer/quadratic-character pattern enumeration with exact residue certificates, or reuse its exact number-field class-group presentation machinery together with the GN.3 reduced-form completeness bridge. The LLS-specific pattern thresholds and character signs are owned by this roadmap.

Consumers: `AnalyticNumberTheoryPartII:ECN.5/small-range-sieve`.

### Request to `AnalyticNumberTheory:AN.2`

Export PNT in the form p_n∼n log n and partial summation ∑_{j<n}p_j^−1/2∼2√(n/log n), with indices converted to the pinned Nat.nth Nat.Prime convention.

Consumers: `AnalyticNumberTheoryPartII:ECN.4/asymptotic-constant`.

### Request to `EllipticCurveModularity:R29.5`

Supply the intrinsic cusp-normalized conductor-37 modular parametrisation/Jacobian quotient used to transport the exact principal Heegner trace to the relevant elliptic isogeny class. The f-isotypic projection and height formula are imported from GZ.8.

Consumers: `AnalyticNumberTheoryPartII:ECN.2/heegner-trace-139`.

## Sources and versions read

- **GZ86**: Benedict H. Gross and Don B. Zagier, [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf). Inventiones mathematicae 84 (1986), 225–320. Read I §§7–8, pp. 230–232. Accessed 2026-10-11. File SHA-256: `a9a52cb8662e03f19ace81dcfbf24bf873bf9c46ba89a8c890727b9541abdbf5`.
- **GZ83**: Benedict H. Gross and Don B. Zagier, [Points de Heegner et dérivées de fonctions L](https://people.mpim-bonn.mpg.de/zagier/files/scanned/PointsHeegner/fulltext.pdf). C. R. Acad. Sci. Paris, Série I 297 (1983), 85–87. Read Theorem 1 and Corollaries 2–6, pp. 85–87. Accessed 2026-10-17. File SHA-256: `a0d495baef3f708204bdcb2b20818793096f348be7a09635ef8062ebb57d83de`.
- **O85**: Joseph Oesterlé, [Nombres de classes des corps quadratiques imaginaires](https://numdam.org/item/SB_1983-1984__26__309_0.pdf). Séminaire Bourbaki, exposé 631 (1983–1984); Astérisque 121–122 (1985), 309–323. Read Introduction and Theorem 1, pp. 309–311; §§1–2, pp. 311–314; §3, conditions C1–C4 and Theorem 2, pp. 314–319; §§4–5, pp. 319–323. Accessed 2026-10-17. File SHA-256: `556a398ca414d73eebee2e2d5320e5a1aebf53b9b9497985e48ab8ecf2bd1e0b`.
- **O88**: Joseph Oesterlé, [Le problème de Gauss sur le nombre de classes](https://doi.org/10.5169/seals-56588). L’Enseignement Mathématique 34 (1988), 43–67. Read II §§3–9, pp. 56–67, publisher page images; §9, pp. 66–67, reported constants and class-number-three consequence. Accessed 2026-10-11. Read the publisher’s page images through the DOI viewer; no successful PDF download. The article reports the improved constants and refers back to the Bourbaki argument.
- **BGZ85**: Joe P. Buhler, Benedict H. Gross and Don B. Zagier, [On the conjecture of Birch and Swinnerton-Dyer for an elliptic curve of rank 3](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.2307/2007967/fulltext.pdf). Mathematics of Computation 44 (1985), 473–481. Read §§1–2, pp. 473–476; §§3–4, pp. 477–480, formulas (10)–(14); §5 and note added in proof, pp. 480–481. Accessed 2026-10-11. File SHA-256: `27a48bdef3824f0d225793ec19575f59fc0617d2800f761639e67b0df807c628`.
- **MW74**: Hugh L. Montgomery and Peter J. Weinberger, [Notes on small class numbers](https://www.impan.pl/shop/en/publication/transaction/download/product/100121?download.pdf). Acta Arithmetica 24 (1974), 529–542. Read Theorem, p. 530; §§2–4, Lemmas 1–9 and Table I, pp. 530–539; §5, approximate functional equation and numerical error bounds, pp. 539–542. Accessed 2026-10-17. File SHA-256: `9deaeda1c1ee6e668ad6393996dc363ff684b94269abf6b808d5ba9b4bf71eda`.
- **LLS70**: D. H. Lehmer, Emma Lehmer and Daniel Shanks, [Integer sequences having prescribed quadratic character](https://oeis.org/A002189/a002189.pdf). Mathematics of Computation 24 (1970), 433–451. Read Introduction, pp. 433–434; Sieve construction and tables, pp. 438–444; Class number three application, pp. 445–447; Table I continuation, pp. 448–451. Accessed 2026-10-17. File SHA-256: `2e35401eecf25293190f7a62f1225fc2e098dbbf76f48a97c2d064ca333f2c83`.
- **G77**: Dorian M. Goldfeld, [The conjectures of Birch and Swinnerton-Dyer and the class numbers of quadratic fields](https://www.numdam.org/item/AST_1977__41-42__219_0.pdf). Astérisque 41–42 (1977), 219–227. Read §§1–5, Theorems 1–3, pp. 219–225. Accessed 2026-10-11. File SHA-256: `111ed5640155028e6fc09c058945b0c1d4bef3a939f88f456950469f0ddc357d`.

No verbatim source passage is included. No source erratum is asserted: the distinct isogenous 139 models and the compressed historical range attribution are treated through explicit model and proof comparisons. The two recorded certificate gaps concern what this pass could not independently establish.
