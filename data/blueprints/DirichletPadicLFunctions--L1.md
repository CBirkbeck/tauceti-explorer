# The smoothed measure and Kubota–Leopoldt

This layer plans the integral smoothing construction, its arithmetic pseudomeasure and its positive interpolation values, together with qualified Kummer congruences and the comparisons used by the character and logarithmic applications. The planning pass is complete at 134 declarations. L1 is planned, with five explicit supplier gaps; it is neither closed nor implemented.

## Objects and conventions

Fix any prime p, including 2. Write Z=ℤ_p, K=ℚ_p and U=Zˣ with their native topologies. D(X,R) is the existing continuous-linear-functional measure carrier. The unit-domain algebra M=D(U,Z) uses multiplicative convolution; the ambient measure space D(Z,Z) uses the additive group when convolution is mentioned. Unit inclusion is a linear pushforward, not a homomorphism between those two convolution algebras.

For a natural a prime to p, put q_a(T)=Σ_n binomial(a,n+1)T^n and b_a(T)=Σ_n binomial(a,n+2)T^n. The constant of q_a is the unit a. The integral series F_a=b_a/q_a satisfies Tq_aF_a=q_a−a. Native multiplication-by-T injectivity proves the cleared identities even over coefficient rings with zero divisors. No inverse of T is used. At a=2, F_a=1/(2+T), with constant 1/2; this fixes the source's incorrect sign in its geometric expansion.

The native inverse Amice transform gives μ_a. Its kth ordinary moment is (1−a^(k+1))B_(k+1)/(k+1), using B_1=−1/2. The supplied psi operator fixes μ_a. Unit restriction therefore has moments multiplied by 1−p^k. Inverse weighting by the existing p-adic inverse, zero outside the units, gives the unit-supported numerator ν_a; intrinsic restriction gives λ_a on U. For k≥1 its moment is (1−p^(k−1))(1−a^k)B_k/k. Its degree-one value is zero because of the Euler factor, although ζ(0)=−1/2.

The binomial-ring construction extends these objects to every u∈U, with coefficientwise and weak continuity as stated in the catalogue. The boundary measures are μ_1=0 and μ_−1=−δ_0, but both intrinsic numerators λ_1 and λ_−1 are zero. Inverse weighting removes the scalar from the raw smoothing cocycle, giving λ_(uv)=λ_u+δ_uλ_v. Thus (δ_v−1)λ_u=(δ_u−1)λ_v. All these are integral identities, also at p=2.

Let Q=FractionRing M be the native localization at non-zero-divisors; it is not assumed to be a field. The actual unit of value p+1 has a regular Dirac difference by PMIA. It need not generate the full unit group. The fraction ζ_p=λ_(p+1)/(δ_(p+1)−1) clears every unit difference to the integral numerator λ_g. This proves membership in the existing pseudomeasure submodule and independence of every regular smoothing denominator. A torsion difference such as δ_−1−1 is not regular, although it remains a valid index of a cleared numerator.

The positive pseudomoments are −(1−p^(k−1))B_k/k, k≥1. The comparison with the complex zeta value uses a shared rational number with separate embeddings; it does not posit a map from ℂ to K. Every positive degree is needed for the uniqueness theorem. The growing Bernoulli norms show that these values cannot be the moments of any bounded K-valued measure.

## Characters and precision

A character is the existing native ContinuousMonoidHom U Z. The evaluator is PMIA's additive map on the pseudomeasure module and is used only at a nontrivial character. For every g, λ_g(κ)=d_κ(g)E_κ(ζ_p), where d_κ(g)=κ(g)−1. If this scalar is nonzero, division in K gives the arithmetic ratio. Regularity of δ_g−1 is not needed for scalar evaluation. At κ(−1)=−1, using λ_−1=0 proves vanishing, including in ℚ₂.

At a common natural smoothing parameter, a finite linear combination of character values is evaluation of the single bounded measure μ_a=extendIntegralUnitCoefficients λ_a at the function Σ_i(c_i/d_i)κ_i. Its operator norm is at most one. A pointwise bound B≥0 for this normalized test therefore bounds the arithmetic combination by B.

For two characters that differ pointwise by at most ε, the difference of their arithmetic values is bounded by ε/(‖d_κ‖‖d_η‖). To see the loss, the numerator of κ/d_κ−η/d_η is d_η(κ−η)+(d_η−d_κ)η. Character values have norm one, and the two terms have norm at most ε. Removing both denominator norms requires that both denominators be units of Z.

At p=3,a=2, degrees 2 and 4 have smoothed difference 15/4 of norm 1/3. Their unsmoothed arithmetic difference is 23/60 of norm 3, attaining the denominator-loss bound. At p=5,a=2, degrees 2 and 6 have unit denominators and difference −760/63 of norm 1/5. At p=2 every integral character value is a unit congruent to 1 modulo 2, so the unit-denominator corollary has no instances; the smoothed bounds still apply.

Fixing an integral character α and comparing α(u)u^k with α(u)u^l gives a precise component statement. For k,l≥1 and r≥1, congruence modulo p^(r−1)(p−1) makes the unit powers agree modulo p^r by the finite Euler theorem. Multiplication by α preserves the norm. The arithmetic congruence follows with the same two denominator-unit hypotheses. Teichmüller components are instances through their existing owner; no analytic branch or coefficient field is constructed here.

## Comparison boundaries

The completed algebra is the existing ProfiniteProPGroups Layer 9 object. PMIA must supply its actual measure-algebra equivalence, finite-quotient compatibility and localization extension. Transporting the arithmetic clearing equations then characterizes the same ζ in this carrier. An abstract ring with a field asserting the desired comparison would not supply this missing construction.

For odd p, the transported arithmetic element and its numerators lie in the plus corner. Its identity is e⁺=(1+[−1])/2. Under the actual sign quotient, e⁺[g] maps to [q(g)], whereas [g]+[−g] maps to twice that basis vector. PMIA must construct the corner decomposition and the induced total-quotient maps. Surjectivity of the quotient gives all-unit numerator witnesses; the integral cocycle identifies the two sign-related lifts. Even nontrivial character evaluations then agree through the same numerator ratio. Integral parity alone does not give a dyadic idempotent splitting.

Finite valued coefficient extensions use the actual bounded measure algebras and continuous compatible scalar maps. The PMIA requests specify preservation of the required regular denominators, actual localization and pseudomeasure maps, and admissible evaluation naturality. The arithmetic image is obtained by mapping its defining fraction and its integral numerators. The target is not the unrestricted inverse limit of field-valued finite measures. Existing ℚ_p descent and intrinsic inclusion squares are retained; L2 and L3 consume this arithmetic comparison and are not new reverse suppliers.

## Target map

### Integral cancellation and the actual smoothing measure

The native binomial denominator has unit constant a. Its inverse constructs F_a without inverting T; native Amice inversion constructs μ_a and the Bernoulli moments.

DirichletPadicLFunctions:L1/smoothing-denominator, DirichletPadicLFunctions:L1/denominator-coefficients, DirichletPadicLFunctions:L1/denominator-constant, DirichletPadicLFunctions:L1/denominator-factorization, DirichletPadicLFunctions:L1/denominator-unit, DirichletPadicLFunctions:L1/denominator-coefficient-map, DirichletPadicLFunctions:L1/smoothed-series, DirichletPadicLFunctions:L1/series-cancellation, DirichletPadicLFunctions:L1/series-cleared-equation, DirichletPadicLFunctions:L1/series-uniqueness, DirichletPadicLFunctions:L1/series-constant, DirichletPadicLFunctions:L1/series-coefficient-recurrence, DirichletPadicLFunctions:L1/series-coefficient-map, DirichletPadicLFunctions:L1/series-fraction-comparison, DirichletPadicLFunctions:L1/smoothed-measure, DirichletPadicLFunctions:L1/measure-amice, DirichletPadicLFunctions:L1/measure-mahler, DirichletPadicLFunctions:L1/measure-uniqueness, DirichletPadicLFunctions:L1/denominator-exp-factorization, DirichletPadicLFunctions:L1/bernoulli-denominator-comparison, DirichletPadicLFunctions:L1/series-exp-bernoulli, DirichletPadicLFunctions:L1/series-exp-coefficients, DirichletPadicLFunctions:L1/measure-ordinary-moment, DirichletPadicLFunctions:L1/smoothed-value-integral.

### Restriction, inverse weighting and integral numerators

The exact PMIA operators supply restriction, Frobenius, psi, inverse weighting and intrinsic extension/restriction. L1 proves the arithmetic identities and coefficient comparisons.

DirichletPadicLFunctions:L1/smoothing-root-average, DirichletPadicLFunctions:L1/series-phi-psi-fixed, DirichletPadicLFunctions:L1/series-psi-fixed, DirichletPadicLFunctions:L1/measure-psi-fixed, DirichletPadicLFunctions:L1/measure-one, DirichletPadicLFunctions:L1/unit-smoothed-measure, DirichletPadicLFunctions:L1/unit-smoothed-support, DirichletPadicLFunctions:L1/unit-smoothed-difference, DirichletPadicLFunctions:L1/unit-smoothed-euler, DirichletPadicLFunctions:L1/unit-smoothed-moment, DirichletPadicLFunctions:L1/unit-smoothed-mass, DirichletPadicLFunctions:L1/unit-smoothed-integral, DirichletPadicLFunctions:L1/smoothed-numerator, DirichletPadicLFunctions:L1/numerator-support, DirichletPadicLFunctions:L1/numerator-weight, DirichletPadicLFunctions:L1/numerator-unique, DirichletPadicLFunctions:L1/numerator-moment-shift, DirichletPadicLFunctions:L1/numerator-moment, DirichletPadicLFunctions:L1/numerator-integral, DirichletPadicLFunctions:L1/numerator-amice, DirichletPadicLFunctions:L1/measure-smoothing-cocycle, DirichletPadicLFunctions:L1/measure-cross-smoothing, DirichletPadicLFunctions:L1/measure-reflection, DirichletPadicLFunctions:L1/numerator-smoothing-cocycle, DirichletPadicLFunctions:L1/numerator-cross-smoothing, DirichletPadicLFunctions:L1/numerator-even, DirichletPadicLFunctions:L1/smoothed-series-euler-values, DirichletPadicLFunctions:L1/smoothed-measure-formal-values, DirichletPadicLFunctions:L1/smoothed-extension-amice, DirichletPadicLFunctions:L1/smoothed-extension-unique, DirichletPadicLFunctions:L1/smoothed-extension-integral-descent, DirichletPadicLFunctions:L1/smoothed-extension-moments, DirichletPadicLFunctions:L1/unit-smoothed-extension-moments, DirichletPadicLFunctions:L1/smoothed-numerator-extension-moments, DirichletPadicLFunctions:L1/intrinsic-numerator, DirichletPadicLFunctions:L1/intrinsic-numerator-inclusion, DirichletPadicLFunctions:L1/intrinsic-numerator-moment, DirichletPadicLFunctions:L1/intrinsic-numerator-dirac, DirichletPadicLFunctions:L1/intrinsic-numerator-cocycle, DirichletPadicLFunctions:L1/intrinsic-numerator-cross, DirichletPadicLFunctions:L1/intrinsic-numerator-even, DirichletPadicLFunctions:L1/intrinsic-numerator-extension-inclusion, DirichletPadicLFunctions:L1/intrinsic-numerator-extension-moment.

### All-unit construction and the arithmetic pseudomeasure

Binomial-ring coefficients extend smoothing to every p-adic unit. Cross numerators and the actual regular denominator at p+1 construct ζ_p, with positive interpolation and uniqueness. Integral parity includes 2.

DirichletPadicLFunctions:L1/padic-smoothing-series, DirichletPadicLFunctions:L1/padic-smoothing-series-natural, DirichletPadicLFunctions:L1/padic-smoothing-coefficients-continuous, DirichletPadicLFunctions:L1/padic-smoothed-measure, DirichletPadicLFunctions:L1/padic-smoothed-measure-natural, DirichletPadicLFunctions:L1/padic-smoothed-measure-weak-continuity, DirichletPadicLFunctions:L1/padic-smoothed-ordinary-moments, DirichletPadicLFunctions:L1/padic-measure-psi-fixed, DirichletPadicLFunctions:L1/padic-smoothed-numerator, DirichletPadicLFunctions:L1/padic-numerator-natural, DirichletPadicLFunctions:L1/padic-numerator-moments, DirichletPadicLFunctions:L1/padic-intrinsic-numerator, DirichletPadicLFunctions:L1/padic-intrinsic-inclusion, DirichletPadicLFunctions:L1/padic-intrinsic-natural, DirichletPadicLFunctions:L1/padic-intrinsic-moments, DirichletPadicLFunctions:L1/padic-intrinsic-continuity, DirichletPadicLFunctions:L1/padic-measure-cocycle, DirichletPadicLFunctions:L1/padic-measure-reflection, DirichletPadicLFunctions:L1/padic-numerator-cocycle, DirichletPadicLFunctions:L1/padic-numerator-even, DirichletPadicLFunctions:L1/padic-intrinsic-dirac, DirichletPadicLFunctions:L1/padic-intrinsic-cocycle, DirichletPadicLFunctions:L1/padic-intrinsic-cross, DirichletPadicLFunctions:L1/padic-intrinsic-even, DirichletPadicLFunctions:L1/arithmetic-fraction-clearing, DirichletPadicLFunctions:L1/arithmetic-pseudomeasure, DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-clearing, DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-numerator, DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-regular-parameter, DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-unique, DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-even, DirichletPadicLFunctions:L1/arithmetic-positive-bernoulli, DirichletPadicLFunctions:L1/arithmetic-euler-zeta-comparison, DirichletPadicLFunctions:L1/arithmetic-positive-interpolation, DirichletPadicLFunctions:L1/arithmetic-interpolation-unique, DirichletPadicLFunctions:L1/arithmetic-odd-moments.

### Qualified Kummer congruences

The new continuous-character arithmetic evaluations reuse PMIA. Finite combinations and the two-denominator estimate expose exactly when an unsmoothed congruence is valid.

DirichletPadicLFunctions:L1/intrinsic-numerator-norm, DirichletPadicLFunctions:L1/finite-smoothed-moments, DirichletPadicLFunctions:L1/generalized-smoothed-kummer, DirichletPadicLFunctions:L1/weight-period-smoothed-kummer, DirichletPadicLFunctions:L1/unit-denominator-kummer, DirichletPadicLFunctions:L1/arithmetic-character-clearing, DirichletPadicLFunctions:L1/arithmetic-character-ratio, DirichletPadicLFunctions:L1/arithmetic-character-positive, DirichletPadicLFunctions:L1/arithmetic-character-odd, DirichletPadicLFunctions:L1/arithmetic-character-combination, DirichletPadicLFunctions:L1/arithmetic-character-kummer, DirichletPadicLFunctions:L1/arithmetic-character-difference, DirichletPadicLFunctions:L1/arithmetic-character-unit-denominators, DirichletPadicLFunctions:L1/arithmetic-fixed-character-weight-period.

### Nonintegrality, unboundedness and finite residue masses

Bernoulli valuations exclude every bounded field-valued measure with these pseudomoments. The actual finite projections retain their carry counts and integral bounds.

DirichletPadicLFunctions:L1/arithmetic-euler-value-norm, DirichletPadicLFunctions:L1/arithmetic-positive-moment-norm, DirichletPadicLFunctions:L1/arithmetic-not-integral, DirichletPadicLFunctions:L1/arithmetic-growing-moments, DirichletPadicLFunctions:L1/arithmetic-unbounded-moments, DirichletPadicLFunctions:L1/arithmetic-no-field-measure, DirichletPadicLFunctions:L1/smoothing-geometric-denominator, DirichletPadicLFunctions:L1/smoothing-geometric-cancellation, DirichletPadicLFunctions:L1/padic-intrinsic-identity, DirichletPadicLFunctions:L1/padic-intrinsic-negative-identity, DirichletPadicLFunctions:L1/smoothed-translation-difference, DirichletPadicLFunctions:L1/smoothed-residue-recurrence, DirichletPadicLFunctions:L1/smoothed-residue-coefficients.

### Completed algebra, sign quotient and coefficients

Four arithmetic comparisons state the remaining targets through five precise generic supplier requests. Odd-prime corners use identity e⁺ and normalized orbit sums; finite coefficient extension uses bounded measures.

DirichletPadicLFunctions:L1/arithmetic-completed-transport, DirichletPadicLFunctions:L1/arithmetic-plus-corner, DirichletPadicLFunctions:L1/arithmetic-sign-quotient, DirichletPadicLFunctions:L1/arithmetic-coefficient-naturality.

## Exact supplier requests

### Actual completed-algebra comparison

Owner: PadicMeasuresIwasawaAlgebras:L1.

Supply the actual Z_p-algebra homeomorphism E:D(Z_pˣ,Z_p)≃completedGroupAlgebra p Z_pˣ over the native upstream ProfiniteProPGroups Layer 9 carrier. Match all finite quotient coefficients through the cofinal unit-reduction kernels; E(δ_g)=[g], E(1)=1, and E preserves the existing multiplicative convolution. Supply inverse and quotient-pushforward naturality. Current PMIA finite unit coordinates and their topology are inputs, not already this comparison.

Consumers: DirichletPadicLFunctions:L1/arithmetic-completed-transport.

### Localization and quotient evaluation transport

Owner: PadicMeasuresIwasawaAlgebras:L3.

Extend the actual measure/completed-algebra isomorphism to the native localizations at nonZeroDivisors and to the existing pseudomeasure submodules, with integral-inclusion and numerator naturality. For the odd-prime product decomposition A≃A⁺×A⁻, supply the genuine projection FractionRing A→FractionRing A⁺ and the extension of A⁺≃completedGroupAlgebra p (U/{±1}); prove preservation of regular denominators via the product decomposition, all-unit numerator membership, and admissible even-character evaluation compatibility. No ring evaluator on the whole total quotient is assumed.

Consumers: DirichletPadicLFunctions:L1/arithmetic-completed-transport, DirichletPadicLFunctions:L1/arithmetic-sign-quotient.

### Normalized odd-prime sign quotient

Owner: PadicMeasuresIwasawaAlgebras:L1.

For p≠2, supply the native closed sign quotient U/{±1}, the actual completed-algebra quotient map, corners A⁺=e⁺A and A⁻=e⁻A with their own identities e⁺,e⁻, the product decomposition, and the normalized isomorphism A⁺≃completedGroupAlgebra p (U/{±1}) sending e⁺[g] to [q(g)]. Derive this on compatible finite quotients before passage to the limit. The unscaled orbit sum maps to twice the quotient basis vector; make that normalization explicit. This generic source Lemma 11.2 interface is owned by PMIA, not duplicated in L1.

Consumers: DirichletPadicLFunctions:L1/arithmetic-plus-corner, DirichletPadicLFunctions:L1/arithmetic-sign-quotient.

### Finite-extension bounded measure coefficients

Owner: PadicMeasuresIwasawaAlgebras:L2.

Extend the existing actual integral coefficient-extension maps to compatible finite complete valued extensions K⊂L of Q_p on bounded continuous-dual measures over U and Z_p. Supply identity/composition, integral-test evaluation, convolution/Dirac compatibility, and commuting squares for intrinsic restriction, unit inclusion, psi, Frobenius and inverse weighting on their stated domains. Preserve bounded scalar hypotheses. This is the finite-extension measure carrier, not the unrestricted inverse limit of field-valued finite measures.

Consumers: DirichletPadicLFunctions:L1/arithmetic-coefficient-naturality.

### Finite-extension admissible pseudomeasure evaluation

Owner: PadicMeasuresIwasawaAlgebras:L3.

For those actual bounded finite-extension coefficient maps, prove preservation of regular elements needed for localization (in particular θ_(p+1)), construct the corresponding native total-quotient and pseudomeasure maps, and the admissible continuous K-valued character evaluator with its numerator ratio and base-change law. Prove nonzero scalar denominators persist under the injective coefficient embedding. The current Q_p-valued integral-character evaluator is reused in its scope; a finite-extension evaluator or entire-total-quotient ring evaluator is not silently inferred.

Consumers: DirichletPadicLFunctions:L1/arithmetic-coefficient-naturality.

## Sources and validation scope

The primary source is Rodrigues Jacinto–Williams, [*An introduction to p-adic L-functions*](https://msp.org/ent/2025/4-1/p03.xhtml), especially §4, the evaluation construction in §3.6, Remark 2.18, and §11.1. This pass freshly read the complete published physical pages 16–18, 22–24, 30–33, 37–40, 71–73 and 75–76, and preprint v2 pages 26–28 and 55. Published page 175 / physical 76 was also checked as an image. The source acquisition receipt records hashes and this bounded scope, not a whole-paper reading claim.

The five inherited L1 source findings retain their original evidence. E34–E36 adopt the already independently confirmed paper findings E64–E66: the odd-moment proof needs the minus component; the parity corollary needs the zero degree-one Euler factor and a measure-level application to cleared numerators; and the augmentation paragraph has an inconsistent bound variable. The adoption is not a new independent review or discovery claim.

All 121 inherited mathematical nodes, APIs and tests remain unchanged. Historical combined-roadmap compilation and source-read records remain history. The current pass authenticates all 50 source files for the 139 cited native declarations. The fresh exact controls make 30,692 rational and finite-group assertions, including the normalized sign quotient and the unsmoothed negative control. They do not prove the infinite-level comparison requests.

The current full suggested file was not compiled: no authenticated compiled module matching the current PMIA supplier is available in the configured existing build, and building library dependencies is prohibited. Nine new character signatures and eighteen examples are written against the actual supplier objects. Four comparison signatures are explicitly omitted until their owned carriers and maps exist. These omissions are tied to the five supplier gaps, not replaced by invented structures or assertion fields. No current compiler error or warning count is claimed.

## Declaration catalogue

### Binomial smoothing denominator

DirichletPadicLFunctions:L1/smoothing-denominator

Declaration: DirichletPadic.smoothingDenominator

Kind: definition. Implementation: unchecked.

Define q_a in R[[T]] by coefficient_n(q_a)=choose(a,n+1). It is the integral quotient of (1+T)^a−1 by T. The definition is coefficient-wise and does not invert T.

**Hypotheses**

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.

**Construction or proof outline**

- Apply the existing PowerSeries.mk to the indicated natural binomial coefficients.
- The coefficient API follows from coeff_mk; n=0 gives the constant coefficient a.
- The polynomial binomial formula gives Tq_a=(1+T)^a−1; coefficient maps preserve the natural coefficients.

**Prerequisites**

- mathlib:PowerSeries.mk
- mathlib:PowerSeries.coeff_mk
- mathlib:Polynomial.coeff_one_add_X_pow

**Acceptance**

- The coefficient definition gives a polynomial of degree at most a−1 for a>0; it gives zero when a=0. The tests distinguish the quotient by T from the unshifted binomial polynomial.

**API**

- DirichletPadic.coeff_smoothingDenominator: The nth coefficient is choose(a,n+1); promoted.
- DirichletPadic.constantCoeff_smoothingDenominator: The constant coefficient is a; promoted.
- DirichletPadic.X_mul_smoothingDenominator: Tq_a=(1+T)^a−1; promoted.
- DirichletPadic.smoothingDenominator_isUnit: If a is a unit, q_a is a unit; promoted.
- DirichletPadic.smoothingDenominator_map: Every coefficient ring homomorphism sends q_a to q_a over its target; promoted.
- DirichletPadic.exp_sub_one_mul_smoothingDenominator_subst: Over a commutative ℚ-algebra, (E−1)q_a(E−1)=E^a−1; promoted.
- DirichletPadic.bernoulli_mul_smoothingDenominator_subst: B_a q_a(E−1)=C(a)B over a commutative ℚ-algebra; promoted.

**Tests**

- SuggestedTests.denominator_zero: q₀=0 over ℤ.
- SuggestedTests.denominator_one: q₁=1 over ℤ.
- SuggestedTests.denominator_two: q₂=2+T over ℤ.

**Uses**

- RJW Proposition 4.4 and Definition 4.5: Construct the integral power series before applying the existing Amice inverse; coefficient tests detect a sign error in the printed expansion.
- RJW Proposition 4.6 and DirichletPadicLFunctions:L1: The specific measure and its exact normalization are the input to polynomial moments, restriction to units and the zeta pseudomeasure.
- ColemanPowerSeries:L2; RJW Proposition 10.4: The Coleman logarithmic derivative compares with this same arithmetic smoothing series, so the sign and coefficient-map laws must be fixed before that comparison.
- RJW Lemmas 4.2–4.3 and Proposition 4.6; this checkpoint's formal Bernoulli and moment comparisons: Evaluate the same arithmetic object against ordinary polynomial functions; retain the rational scalar and factorial/sign normalization before using complex or p-adic embeddings.

**Sources**

- RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following.. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Denominator coefficients

DirichletPadicLFunctions:L1/denominator-coefficients

Declaration: DirichletPadic.coeff_smoothingDenominator

Kind: lemma. Implementation: unchecked.

For every n≥0, coefficient_n(q_a)=choose(a,n+1).

**Hypotheses**

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.

**Construction or proof outline**

- Unfold smoothing-denominator and apply PowerSeries.coeff_mk.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothing-denominator
- mathlib:PowerSeries.coeff_mk

**Acceptance**

- Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

**Sources**

- RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following.. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Denominator constant coefficient

DirichletPadicLFunctions:L1/denominator-constant

Declaration: DirichletPadic.constantCoeff_smoothingDenominator

Kind: lemma. Implementation: unchecked.

The constant coefficient of q_a is a.

**Hypotheses**

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.

**Construction or proof outline**

- Use denominator-coefficients at n=0 and the natural identity choose(a,1)=a.

**Prerequisites**

- DirichletPadicLFunctions:L1/denominator-coefficients
- mathlib:PowerSeries.coeff_zero_eq_constantCoeff_apply

**Acceptance**

- Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

**Sources**

- RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following.. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Binomial denominator factorization

DirichletPadicLFunctions:L1/denominator-factorization

Declaration: DirichletPadic.X_mul_smoothingDenominator

Kind: lemma. Implementation: unchecked.

Tq_a=(1+T)^a−1 in R[[T]], including a=0.

**Hypotheses**

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.

**Construction or proof outline**

- Compare the constant coefficients: both sides are zero.
- For degree n+1, coeff_succ_X_mul and denominator-coefficients give choose(a,n+1).
- Transfer Polynomial.coeff_one_add_X_pow through the polynomial-to-series ring homomorphism, using coeff_coe, coe_X and coe_pow. These are the coefficients on the right; extensionality finishes.

**Prerequisites**

- DirichletPadicLFunctions:L1/denominator-coefficients
- mathlib:PowerSeries.coeff_succ_X_mul
- mathlib:Polynomial.coeff_one_add_X_pow
- mathlib:Polynomial.coeff_coe
- mathlib:Polynomial.coeToPowerSeries.ringHom
- mathlib:Polynomial.coe_X
- mathlib:Polynomial.coe_pow

**Acceptance**

- Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

**Sources**

- RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following.. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Unit smoothing denominator

DirichletPadicLFunctions:L1/denominator-unit

Declaration: DirichletPadic.smoothingDenominator_isUnit

Kind: lemma. Implementation: unchecked.

If a is a unit in R, then q_a is a unit in R[[T]].

**Hypotheses**

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

**Construction or proof outline**

- Use denominator-constant and the existing PowerSeries.isUnit_iff_constantCoeff.

**Prerequisites**

- DirichletPadicLFunctions:L1/denominator-constant
- mathlib:PowerSeries.isUnit_iff_constantCoeff

**Acceptance**

- Over ℤ₂ the parameter a=3 gives a unit q₃, but a=2 does not. No division by 2 is introduced.

**Sources**

- RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following.. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Denominator under coefficient change

DirichletPadicLFunctions:L1/denominator-coefficient-map

Declaration: DirichletPadic.smoothingDenominator_map

Kind: lemma. Implementation: unchecked.

For f:R→S a homomorphism of commutative rings, coefficient-wise f sends q_a over R to q_a over S.

**Hypotheses**

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- S is a commutative ring and f:R→S is a ring homomorphism.

**Construction or proof outline**

- Use PowerSeries.coeff_map and denominator-coefficients.
- The ring map preserves natural casts. Coefficient extensionality gives the equality.

**Prerequisites**

- DirichletPadicLFunctions:L1/denominator-coefficients
- mathlib:PowerSeries.map
- mathlib:PowerSeries.coeff_map

**Acceptance**

- The map ℤ→ℤ₂ sends 2+T to 2+T; identity and composite maps give the same q_a without choosing coordinates.

**Sources**

- RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following.. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Integral smoothed power series

DirichletPadicLFunctions:L1/smoothed-series

Declaration: DirichletPadic.smoothedSeries

Kind: construction. Implementation: unchecked.

For a with unit image u in R, define F_a=b_a·q_a⁻¹ in R[[T]], using the existing inverse-of-a-series construction with constant unit u. Here b_a has coefficient choose(a,n+2). This constructs the pole cancellation integrally before any rational comparison.

**Hypotheses**

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

**Construction or proof outline**

- Use denominator-constant to identify the constant coefficient of q_a with the unit supplied by a.
- Apply PowerSeries.invOfUnit to q_a and that unit. Multiply by the series b_a constructed with PowerSeries.mk.
- The equality q_a F_a=b_a follows from mul_invOfUnit. No inverse of T appears. Proof irrelevance or the uniqueness theorem removes dependence on the unit certificate.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothing-denominator
- DirichletPadicLFunctions:L1/denominator-constant
- mathlib:PowerSeries.mk
- mathlib:PowerSeries.invOfUnit
- mathlib:PowerSeries.mul_invOfUnit

**Acceptance**

- Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

**API**

- DirichletPadic.smoothingDenominator_mul_smoothedSeries: q_a F_a=b_a; promoted.
- DirichletPadic.X_mul_smoothingDenominator_mul_smoothedSeries: Tq_a F_a=q_a−a; promoted.
- DirichletPadic.smoothedSeries_unique: This cancellation equation uniquely characterizes F_a; promoted.
- DirichletPadic.constantCoeff_smoothedSeries: The constant coefficient is choose(a,2)u⁻¹; promoted.
- DirichletPadic.coeff_smoothedSeries_recurrence: a F_{a,n}=choose(a,n+2)−∑_{i<n}choose(a,n−i+1)F_{a,i}; promoted.
- DirichletPadic.smoothedSeries_map: Coefficient ring maps preserve F_a, with the transported unit hypothesis; promoted.
- DirichletPadic.smoothedSeries_one: For the unit parameter a=1, F₁=0.
- DirichletPadic.smoothedSeries_fraction_formula: In a receiving field in which the image of T is nonzero, F_a equals 1/T−a/((1+T)^a−1); promoted.
- DirichletPadic.X_mul_smoothedSeries_subst_exp: Over a commutative ℚ-algebra with unit a, X F_a(E−1)=B−B_a; promoted.
- DirichletPadic.factorial_mul_coeff_smoothedSeries_subst_exp: The factorial-normalized coefficient is the rational smoothed Bernoulli value, including k=0; promoted.
- constantCoeff_iterate_mahler_smoothedSeries: Every iterated Mahler-derivation constant is the rational smoothed Bernoulli value in any commutative ℚ-algebra; promoted.

**Tests**

- SuggestedTests.series_one: F₁=0 over ℚ.
- SuggestedTests.series_two_sign: Over ℚ, F₂ has constant coefficient 1/2 and linear coefficient −1/4.
- SuggestedTests.series_three_dyadic: Over ℤ₂, the unit parameter 3 gives constant coefficient 1. This needs no inverse of 2.
- SuggestedTests.series_exp_one: Over ℚ, F₁(exp−1)=0.
- SuggestedTests.series_exp_two: Over ℚ, F₂(exp−1) has coefficients 1/2,−1/4,0 in degrees 0–2.
- SuggestedTests.series_exp_factorial: Over ℚ, coefficient₃(F₂(exp−1))=1/48; its factorial-normalized value is 1/8.

**Uses**

- RJW Proposition 4.4 and Definition 4.5: Construct the integral power series before applying the existing Amice inverse; coefficient tests detect a sign error in the printed expansion.
- RJW Proposition 4.6 and DirichletPadicLFunctions:L1: The specific measure and its exact normalization are the input to polynomial moments, restriction to units and the zeta pseudomeasure.
- ColemanPowerSeries:L2; RJW Proposition 10.4: The Coleman logarithmic derivative compares with this same arithmetic smoothing series, so the sign and coefficient-map laws must be fixed before that comparison.
- RJW Lemmas 4.2–4.3 and Proposition 4.6; this checkpoint's formal Bernoulli and moment comparisons: Evaluate the same arithmetic object against ordinary polynomial functions; retain the rational scalar and factorial/sign normalization before using complex or p-adic embeddings.
- RJW equation(4-1) and Proposition4.6, printed136–137: Use one rational iterated-formal-derivative constant for the independently constructed real kernel, complex Mellin continuation and integral arithmetic measure.

**Sources**

- RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following.. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Integral cancellation equation

DirichletPadicLFunctions:L1/series-cancellation

Declaration: DirichletPadic.smoothingDenominator_mul_smoothedSeries

Kind: lemma. Implementation: unchecked.

q_a F_a=b_a in R[[T]].

**Hypotheses**

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

**Construction or proof outline**

- Unfold smoothed-series. Commute factors and apply PowerSeries.mul_invOfUnit with denominator-constant.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-series
- DirichletPadicLFunctions:L1/denominator-constant
- mathlib:PowerSeries.mul_invOfUnit

**Acceptance**

- Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

**Sources**

- RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following.. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Cancellation after multiplication by T

DirichletPadicLFunctions:L1/series-cleared-equation

Declaration: DirichletPadic.X_mul_smoothingDenominator_mul_smoothedSeries

Kind: lemma. Implementation: unchecked.

Tq_a F_a=q_a−a in R[[T]].

**Hypotheses**

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

**Construction or proof outline**

- Multiply series-cancellation by T.
- PowerSeries.sub_const_eq_X_mul_shift identifies q_a−a with T times the shifted q_a. Denominator-coefficients and denominator-constant identify that shifted series with b_a.

**Prerequisites**

- DirichletPadicLFunctions:L1/series-cancellation
- DirichletPadicLFunctions:L1/denominator-coefficients
- DirichletPadicLFunctions:L1/denominator-constant
- mathlib:PowerSeries.sub_const_eq_X_mul_shift

**Acceptance**

- Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

**Sources**

- RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following.. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Uniqueness of the smoothed series

DirichletPadicLFunctions:L1/series-uniqueness

Declaration: DirichletPadic.smoothedSeries_unique

Kind: theorem. Implementation: unchecked.

For F∈R[[T]], if Tq_a F=q_a−a then F=F_a.

**Hypotheses**

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

**Construction or proof outline**

- Compare the assumed equation with series-cleared-equation.
- Cancel T using PowerSeries.X_mul_cancel, which does not assume a domain.
- Cancel the unit q_a using denominator-unit and IsUnit.mul_left_cancel.

**Prerequisites**

- DirichletPadicLFunctions:L1/series-cleared-equation
- DirichletPadicLFunctions:L1/denominator-unit
- mathlib:PowerSeries.X_mul_cancel
- mathlib:IsUnit.mul_left_cancel

**Acceptance**

- At a=2 over ℚ, the equation forces the constant coefficient 1/2; the sign-reversed geometric series cannot satisfy it. The proof remains valid over rings with zero divisors.

**Sources**

- RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following.. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Smoothed constant coefficient

DirichletPadicLFunctions:L1/series-constant

Declaration: DirichletPadic.constantCoeff_smoothedSeries

Kind: lemma. Implementation: unchecked.

The constant coefficient of F_a is choose(a,2)u⁻¹, where u is the unit equal to a.

**Hypotheses**

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

**Construction or proof outline**

- Use the definition of smoothed-series, multiplicativity of the constant-coefficient ring map, and coeff_mk for b_a.
- PowerSeries.constantCoeff_invOfUnit supplies u⁻¹.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-series
- mathlib:PowerSeries.coeff_mk
- mathlib:PowerSeries.coeff_zero_eq_constantCoeff_apply
- mathlib:PowerSeries.constantCoeff_invOfUnit

**Acceptance**

- Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

**Sources**

- RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following.. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Smoothed coefficient recurrence

DirichletPadicLFunctions:L1/series-coefficient-recurrence

Declaration: DirichletPadic.coeff_smoothedSeries_recurrence

Kind: lemma. Implementation: unchecked.

For n≥0, a F_{a,n}=choose(a,n+2)−∑_{i=0}^{n−1} choose(a,n−i+1) F_{a,i}.

**Hypotheses**

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

**Construction or proof outline**

- Apply coefficient_n to series-cancellation and use PowerSeries.coeff_mul.
- Use denominator-coefficients for q_a, then separate the convolution summand containing F_{a,n}; its other factor is q_{a,0}=a.
- Move the remaining finite sum to the other side. The case n=0 has an empty sum.

**Prerequisites**

- DirichletPadicLFunctions:L1/series-cancellation
- DirichletPadicLFunctions:L1/denominator-coefficients
- DirichletPadicLFunctions:L1/denominator-constant
- mathlib:PowerSeries.coeff_mul
- mathlib:PowerSeries.coeff_mk

**Acceptance**

- For a=2 over ℚ the recurrence gives F_{2,n}=(-1)^n/2^(n+1). At n=0 it gives a F_{a,0}=choose(a,2), with no missing endpoint term.

**Sources**

- RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following.. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Smoothed series under coefficient change

DirichletPadicLFunctions:L1/series-coefficient-map

Declaration: DirichletPadic.smoothedSeries_map

Kind: lemma. Implementation: unchecked.

For a ring map f:R→S, the coefficient-wise image of F_a over R equals F_a over S. A unit a maps to a unit, and any certificate of that fact gives the same series.

**Hypotheses**

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.
- S is a commutative ring and f:R→S is a ring homomorphism.

**Construction or proof outline**

- Map series-cleared-equation coefficient-wise through f.
- Use denominator-coefficient-map, PowerSeries.map_C and map_X to identify the target equation.
- Apply series-uniqueness over S. IsUnit.map supplies admissibility, and the ring-homomorphism laws imply identity and composition compatibility.

**Prerequisites**

- DirichletPadicLFunctions:L1/series-cleared-equation
- DirichletPadicLFunctions:L1/denominator-coefficient-map
- DirichletPadicLFunctions:L1/series-uniqueness
- mathlib:PowerSeries.map
- mathlib:PowerSeries.map_C
- mathlib:PowerSeries.map_X
- mathlib:IsUnit.map

**Acceptance**

- The integral series over ℤ_p maps to the same rational expression over ℚ_p after coefficient extension. Iterated coefficient maps and their composite give identical series.

**Sources**

- RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following.. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Rational formula for the smoothed series

DirichletPadicLFunctions:L1/series-fraction-comparison

Declaration: DirichletPadic.smoothedSeries_fraction_formula

Kind: theorem. Implementation: unchecked.

Let f:R[[T]]→K be a ring homomorphism to a field, with f(T)≠0. Then f(F_a)=1/f(T)−a/((1+f(T))^a−1). In particular this is a comparison after cancellation, not a definition in R[[T]].

**Hypotheses**

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.
- K is a field, f:R[[T]]→K is a ring homomorphism, and f(T)≠0.

**Construction or proof outline**

- Denominator-unit and IsUnit.map show that f(q_a) is a unit, hence nonzero in K.
- Map denominator-factorization to get (1+f(T))^a−1=f(T)f(q_a), which is nonzero.
- Map series-cleared-equation and divide by that nonzero product. Field algebra gives the stated difference.

**Prerequisites**

- DirichletPadicLFunctions:L1/denominator-factorization
- DirichletPadicLFunctions:L1/denominator-unit
- DirichletPadicLFunctions:L1/series-cleared-equation
- mathlib:IsUnit.map

**Acceptance**

- At a=2 the rational expression simplifies to 1/(2+f(T)). The hypothesis f(T)≠0 excludes using totalized division at the origin to compute the constant coefficient.

**Sources**

- RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following.. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Arithmetic smoothing measure

DirichletPadicLFunctions:L1/smoothed-measure

Declaration: DirichletPadic.smoothedMeasure

Kind: construction. Implementation: unchecked.

For p prime and p∤a, define μ_a in the existing measure carrier D(ℤ_p,ℤ_p) as the inverse Amice transform of F_a over ℤ_p. This is the particular arithmetic measure, not a second definition of the Amice transform.

**Hypotheses**

- p is a prime natural number, a is a natural number, and p does not divide a.
- Use the existing carrier D(ℤ_p,ℤ_p) of abstract ℤ_p-valued measures and its existing Amice equivalence.

**Construction or proof outline**

- Use Nat.Prime.coprime_iff_not_dvd, PadicInt.norm_natCast_eq_one_iff and PadicInt.isUnit_iff to turn p∤a into the unit hypothesis for smoothed-series.
- Apply the inverse of AbstractMeasure.amiceTransformEquiv to that integral series. The existing equivalence includes continuity and boundedness of the resulting measure.
- The forward-transform equation and Mahler values follow from the existing equivalence laws. Injectivity of the existing transform gives uniqueness.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-series
- mathlib:Nat.Prime.coprime_iff_not_dvd
- mathlib:PadicInt.norm_natCast_eq_one_iff
- mathlib:PadicInt.isUnit_iff
- mathlib:AbstractMeasure.amiceTransformEquiv

**Acceptance**

- The construction lands in the existing continuous integral measure carrier at p=2 as well as odd primes. It does not construct the dyadic unit-group pseudomeasure.

**API**

- DirichletPadic.amice_smoothedMeasure: The Amice transform of μ_a is F_a for any unit certificate for a; promoted.
- DirichletPadic.smoothedMeasure_mahler: The nth Mahler value of μ_a is coefficient_n(F_a); promoted.
- DirichletPadic.smoothedMeasure_unique: A measure with Amice transform F_a equals μ_a; promoted.
- DirichletPadic.smoothedMeasure_moment: The kth ordinary moment, embedded in ℚ_p, is (1−a^(k+1))B_(k+1)/(k+1); promoted with the exact PadicMeasuresIwasawaAlgebras:L2/ordinary-moment-exp supplier.
- DirichletPadic.smoothedBernoulli_mem_padicInt: The smoothed rational Bernoulli value lies in the image of ℤ_p in ℚ_p; promoted and using the exact generic moment supplier.
- DirichletPadic.smoothedMeasure_mul: For natural a,b with p∤a and p∤b, μ_(ab)=μ_a+a·σ_a(μ_b) as actual elements of D(Z,Z). The scalar a multiplies the raw pushforward; it is essential. Promoted to measure-smoothing-cocycle.
- DirichletPadic.smoothedMeasure_cross: For natural a,b prime to p, b·σ_b(μ_a)−μ_a=a·σ_a(μ_b)−μ_b in D(Z,Z). Promoted to measure-cross-smoothing.
- DirichletPadic.smoothedMeasure_reflection: For every natural a prime to p, μ_a+AbstractMeasure.map ε μ_a=(a−1)·δ₀ in D(Z,Z), with ε(z)=−z and δ₀ the existing Dirac measure at zero. Promoted to measure-reflection.
- smoothedMeasure_moment_eq_formal: For p∤a, the embedded integral ordinary moment is the p-adic image of c_(a,k); promoted.
- amice_extend_smoothedMeasure: In every eligible coefficient ring, the actual extended measure has Amice series F_a; promoted.
- smoothedMeasure_extension_unique: An eligible-coefficient measure with Amice series F_a is the actual extension of μ_a; promoted.
- smoothedMeasure_extension_integral_descent: A Q_p-valued measure with Amice series F_a has exactly the integral lift μ_a; promoted.
- extend_smoothedMeasure_moment: The actual Q_p-valued extension has the same rational Bernoulli ordinary moments; promoted.

**Tests**

- SuggestedTests.measure_one: Over ℤ₃ the a=1 measure is zero.
- SuggestedTests.measure_two_mass: Over ℤ₃ the a=2 measure has twice its zeroth Mahler value equal to 1.
- SuggestedTests.measure_dyadic_mass: Over ℤ₂ the a=3 measure has zeroth Mahler value 1.
- SuggestedTests.moment_zero_sign: At p=3,a=2 the embedded ordinary degree-zero moment is 1/2.
- SuggestedTests.moment_one_dyadic: At p=2,a=3 the embedded degree-one moment is −2/3.
- SuggestedTests.moment_two_not_mahler: At p=3,a=2 the embedded degree-two ordinary moment is zero, unlike the degree-two Mahler value 1/8.
- SuggestedTests.moment_three_factorial: At p=3,a=2 the embedded degree-three ordinary moment is 1/8, not the exponential coefficient 1/48.
- SuggestedSmoothingTests.measure_product_odd: At p=3, μ₄=μ₂+2σ₂μ₂.
- SuggestedSmoothingTests.measure_product_dyadic: At p=2, μ₁₅=μ₃+3σ₃μ₅.
- SuggestedSmoothingTests.reflection_zero_atom: At p=3, μ₂+map(−id)μ₂=δ₀; omitting the zero atom fails.
- SuggestedSmoothingTests.reflection_dyadic: At p=2, μ₃+map(−id)μ₃=2δ₀, with no division by 2.

**Uses**

- RJW Proposition 4.4 and Definition 4.5: Construct the integral power series before applying the existing Amice inverse; coefficient tests detect a sign error in the printed expansion.
- RJW Proposition 4.6 and DirichletPadicLFunctions:L1: The specific measure and its exact normalization are the input to polynomial moments, restriction to units and the zeta pseudomeasure.
- ColemanPowerSeries:L2; RJW Proposition 10.4: The Coleman logarithmic derivative compares with this same arithmetic smoothing series, so the sign and coefficient-map laws must be fixed before that comparison.
- RJW Lemmas 4.2–4.3 and Proposition 4.6; this checkpoint's formal Bernoulli and moment comparisons: Evaluate the same arithmetic object against ordinary polynomial functions; retain the rational scalar and factorial/sign normalization before using complex or p-adic embeddings.
- RJW Proposition 4.11; DirichletPadicLFunctions:L1 arithmetic smoothing compatibility and parity: Compare actual smoothing parameters before localization. The unweighted cocycle has scalar a; inverse weighting cancels it. Reflection has a zero-atom correction, killed by the inverse weight. These provide arithmetic identities for the denominator-qualified independence and parity/descent comparisons.
- RJW equation(4-1) and Proposition4.6, printed136–137: Use one rational iterated-formal-derivative constant for the independently constructed real kernel, complex Mellin continuation and integral arithmetic measure.
- RJW§4.1 arithmetic measures; coefficient-field comparisons consumed by DirichletPadicLFunctions:L2–L3 and ColemanIntegration:L3: Apply the existing actual coefficient-extension map before evaluating coefficient-valued tests. Keep the ambient domain, bounded-scalar hypotheses and the distinction between Q_p integral descent and other coefficient-field descent.

**Sources**

- RJW-published, Definition 4.5 and Proposition 4.6, printed p. 137 / PDF 38.. The specific arithmetic measure is defined exactly as the source prescribes; the pinned library already supplies the requisite ℤ_p-coefficient Amice inverse.

### Amice transform of the smoothing measure

DirichletPadicLFunctions:L1/measure-amice

Declaration: DirichletPadic.amice_smoothedMeasure

Kind: lemma. Implementation: unchecked.

The Amice transform of μ_a equals F_a over ℤ_p, independently of the chosen proof that a is a unit.

**Hypotheses**

- p is a prime natural number, a is a natural number, and p does not divide a.
- Use the existing carrier D(ℤ_p,ℤ_p) of abstract ℤ_p-valued measures and its existing Amice equivalence.

**Construction or proof outline**

- Unfold smoothed-measure and use the inverse/forward laws of AbstractMeasure.amiceTransformEquiv.
- Use amiceTransformEquiv_apply to identify the forward map with amiceTransform; unit-certificate proof irrelevance identifies the series.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-measure
- mathlib:AbstractMeasure.amiceTransformEquiv
- mathlib:AbstractMeasure.amiceTransformEquiv_apply

**Acceptance**

- This equality fixes the sign: at a=2 and p=3 its constant coefficient is +1/2.

**Sources**

- RJW-published, Definition 4.5, printed p. 137 / PDF 38.. Defining property of the source measure, transported through the existing equivalence.

### Mahler values of the smoothing measure

DirichletPadicLFunctions:L1/measure-mahler

Declaration: DirichletPadic.smoothedMeasure_mahler

Kind: lemma. Implementation: unchecked.

For each n≥0, μ_a applied to the continuous nth Mahler basis function equals coefficient_n(F_a).

**Hypotheses**

- p is a prime natural number, a is a natural number, and p does not divide a.
- Use the existing carrier D(ℤ_p,ℤ_p) of abstract ℤ_p-valued measures and its existing Amice equivalence.

**Construction or proof outline**

- Apply coefficient_n to measure-amice.
- Use AbstractMeasure.coeff_amiceTransformEquiv and amiceTransformEquiv_apply.

**Prerequisites**

- DirichletPadicLFunctions:L1/measure-amice
- mathlib:AbstractMeasure.coeff_amiceTransformEquiv
- mathlib:AbstractMeasure.amiceTransformEquiv_apply

**Acceptance**

- At p=3,a=2,n=0 the value is 1/2; at p=2,a=3,n=0 it is 1. Ordinary powers x^k require an additional moment calculation and are not identified with Mahler functions.

**Sources**

- RJW-published, Definition 4.5 and the reference to Corollary 3.30 before Proposition 4.4, printed p. 137 / PDF 38.. Coefficient-level consequence of the defining Amice transform; the equivalence with Mahler values is the pinned baseline.

### Uniqueness of the smoothing measure

DirichletPadicLFunctions:L1/measure-uniqueness

Declaration: DirichletPadic.smoothedMeasure_unique

Kind: lemma. Implementation: unchecked.

Every ℤ_p-valued measure on ℤ_p whose Amice transform is F_a equals μ_a.

**Hypotheses**

- p is a prime natural number, a is a natural number, and p does not divide a.
- Use the existing carrier D(ℤ_p,ℤ_p) of abstract ℤ_p-valued measures and its existing Amice equivalence.

**Construction or proof outline**

- Compare its assumed transform with measure-amice.
- Apply the existing AbstractMeasure.injective_amiceTransform in the coefficient ring ℤ_p.

**Prerequisites**

- DirichletPadicLFunctions:L1/measure-amice
- mathlib:AbstractMeasure.injective_amiceTransform

**Acceptance**

- The zero transform forces μ₁=0. No independent measure-space carrier or new general uniqueness theorem is introduced.

**Sources**

- RJW-published, Definition 4.5, printed p. 137 / PDF 38.. Uniqueness of this particular arithmetic measure uses the existing general Amice injectivity theorem.

### Exponential denominator factorization

DirichletPadicLFunctions:L1/denominator-exp-factorization

Declaration: DirichletPadic.exp_sub_one_mul_smoothingDenominator_subst

Kind: lemma. Implementation: unchecked.

(E−1) q_a(E−1)=E^a−1 in R[[X]], for every natural a (including a=0).

**Hypotheses**

- R is a commutative ℚ-algebra and a is a natural number. E=PowerSeries.exp R, h=E−1, B=bernoulliPowerSeries R and B_a=rescale(a) B. All of these are the existing Mathlib series; q_a is this packet's integral smoothing denominator.

**Construction or proof outline**

- constantCoeff_exp implies constantCoeff(h)=0. HasSubst.of_constantCoeff_zero' therefore licenses substAlgHom h; no analytic exponential on ℤ_p is invoked.
- Apply this algebra homomorphism to denominator-factorization. Its X and constant rules identify the two sides with h q_a(h) and (1+h)^a−1=E^a−1.

**Prerequisites**

- DirichletPadicLFunctions:L1/denominator-factorization
- mathlib:PowerSeries.exp
- mathlib:PowerSeries.constantCoeff_exp
- mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'
- mathlib:PowerSeries.substAlgHom
- mathlib:PowerSeries.coe_substAlgHom
- mathlib:PowerSeries.substAlgHom_X
- mathlib:PowerSeries.subst_C

**Acceptance**

- At a=0 both sides vanish; at a=1 the equation is h=h. No inverse of a or X is required.

**Sources**

- RJW-published, Lemma 4.3 and equation (4-1), printed p. 136 / PDF 37; Proposition 4.4, printed p. 137 / PDF 38.. Formal-series implementation of the source's change T=exp(t)−1, not an assertion of analytic convergence. The algebraic Bernoulli identity is already baseline; only its arithmetic smoothing specialization is new. The ℚ-algebra generality is an explicit extension of the source's scalar calculation.

### Bernoulli denominator comparison

DirichletPadicLFunctions:L1/bernoulli-denominator-comparison

Declaration: DirichletPadic.bernoulli_mul_smoothingDenominator_subst

Kind: lemma. Implementation: unchecked.

B_a q_a(E−1)=C(a) B in R[[X]], for every natural a.

**Hypotheses**

- R is a commutative ℚ-algebra and a is a natural number. E=PowerSeries.exp R, h=E−1, B=bernoulliPowerSeries R and B_a=rescale(a) B. All of these are the existing Mathlib series; q_a is this packet's integral smoothing denominator.

**Construction or proof outline**

- Rescale the baseline identity B(E−1)=X by a. The ring-map laws, exp_pow_eq_rescale_exp and rescale_X give B_a(E^a−1)=C(a)X.
- Use denominator-exp-factorization to replace E^a−1 by h q_a(h). The unscaled Bernoulli identity also gives C(a) B h=C(a)X.
- Thus h times the two proposed sides agrees. Multiply that equality by B and use Bh=X; cancel X with PowerSeries.X_mul_cancel. This avoids a domain hypothesis and does not divide by h.

**Prerequisites**

- DirichletPadicLFunctions:L1/denominator-exp-factorization
- mathlib:bernoulliPowerSeries
- mathlib:bernoulliPowerSeries_mul_exp_sub_one
- mathlib:PowerSeries.rescale
- mathlib:PowerSeries.exp_pow_eq_rescale_exp
- mathlib:PowerSeries.rescale_X
- mathlib:PowerSeries.X_mul_cancel

**Acceptance**

- At a=1 the equation is B=B; at a=0 both sides are zero. It holds over commutative ℚ-algebras with zero divisors.

**Sources**

- RJW-published, Lemma 4.3 and equation (4-1), printed p. 136 / PDF 37; Proposition 4.4, printed p. 137 / PDF 38.. Formal-series implementation of the source's change T=exp(t)−1, not an assertion of analytic convergence. The algebraic Bernoulli identity is already baseline; only its arithmetic smoothing specialization is new. The ℚ-algebra generality is an explicit extension of the source's scalar calculation.

### Smoothed Bernoulli generating series

DirichletPadicLFunctions:L1/series-exp-bernoulli

Declaration: DirichletPadic.X_mul_smoothedSeries_subst_exp

Kind: theorem. Implementation: unchecked.

For a with unit image in R, X F_a(E−1)=B−B_a in R[[X]].

**Hypotheses**

- R is a commutative ℚ-algebra and a is a natural number. E=PowerSeries.exp R, h=E−1, B=bernoulliPowerSeries R and B_a=rescale(a) B. All of these are the existing Mathlib series; q_a is this packet's integral smoothing denominator.
- The image of a in R is a unit; use the same smoothedSeries and its unit certificate as in the integral construction.

**Construction or proof outline**

- Apply substAlgHom h to series-cleared-equation to get h q_a(h) F_a(h)=q_a(h)−C(a). Formal substitutability follows as in denominator-exp-factorization.
- Multiply by B and use B h=X. Replace C(a) B by B_a q_a(h), using bernoulli-denominator-comparison.
- Both sides now have the factor q_a(h). It is a unit: denominator-unit followed by IsUnit.map under substAlgHom h. Cancel this unit to obtain the equality.
- All steps are formal algebra. This is a coefficient-level route to the Bernoulli application, not a replacement for the retained real Mellin continuation, decay or differentiation proof.

**Prerequisites**

- DirichletPadicLFunctions:L1/series-cleared-equation
- DirichletPadicLFunctions:L1/denominator-unit
- DirichletPadicLFunctions:L1/denominator-exp-factorization
- DirichletPadicLFunctions:L1/bernoulli-denominator-comparison
- mathlib:bernoulliPowerSeries_mul_exp_sub_one
- mathlib:IsUnit.map
- mathlib:IsUnit.mul_left_cancel
- mathlib:PowerSeries.exp
- mathlib:PowerSeries.constantCoeff_exp
- mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'
- mathlib:PowerSeries.substAlgHom
- mathlib:PowerSeries.coe_substAlgHom
- mathlib:PowerSeries.substAlgHom_X
- mathlib:PowerSeries.subst_C

**Acceptance**

- Over ℚ at a=2, F₂(E−1)=1/(1+E) has coefficients 1/2, −1/4, 0, 1/48 in degrees 0–3. At a=1 the series is zero.

**Sources**

- RJW-published, Lemma 4.3 and equation (4-1), printed p. 136 / PDF 37; Proposition 4.4, printed p. 137 / PDF 38.. Formal-series implementation of the source's change T=exp(t)−1, not an assertion of analytic convergence. The algebraic Bernoulli identity is already baseline; only its arithmetic smoothing specialization is new. The ℚ-algebra generality is an explicit extension of the source's scalar calculation.

### Factorial-normalized smoothing coefficients

DirichletPadicLFunctions:L1/series-exp-coefficients

Declaration: DirichletPadic.factorial_mul_coeff_smoothedSeries_subst_exp

Kind: lemma. Implementation: unchecked.

For every k≥0, k!·coefficient_k(F_a(E−1))=algebraMap ℚ R ((1−a^(k+1)) B_(k+1)/(k+1)), with Mathlib's bernoulli and B₁=−1/2.

**Hypotheses**

- R is a commutative ℚ-algebra and a is a natural number. E=PowerSeries.exp R, h=E−1, B=bernoulliPowerSeries R and B_a=rescale(a) B. All of these are the existing Mathlib series; q_a is this packet's integral smoothing denominator.
- The image of a in R is a unit; k is a natural number. Rational denominators are formed in ℚ before applying algebraMap, never in ℤ_p.

**Construction or proof outline**

- Take coefficient k+1 of series-exp-bernoulli. coeff_succ_X_mul identifies the left side as coefficient k of F_a(h).
- Unfold the existing bernoulliPowerSeries and use coeff_mk and coeff_rescale. The right side is the image of (1−a^(k+1)) B_(k+1)/(k+1)!.
- Multiply by k! and use (k+1)!=(k+1)k! in ℚ, where factorials are nonzero. Ring-map laws transport the resulting equality to R. In particular k=0 is retained.

**Prerequisites**

- DirichletPadicLFunctions:L1/series-exp-bernoulli
- mathlib:PowerSeries.coeff_succ_X_mul
- mathlib:bernoulliPowerSeries
- mathlib:PowerSeries.coeff_mk
- mathlib:PowerSeries.coeff_rescale

**Acceptance**

- At k=0 the value is (a−1)/2, not its negative. For a=2,k=3 the coefficient is 1/48 but the factorial-normalized value is 1/8.

**Sources**

- RJW-published, Lemma 4.2, printed p. 136 / PDF 37, together with Lemma 4.3 and Proposition 4.6.. Formal-series implementation of the source's change T=exp(t)−1, not an assertion of analytic convergence. The algebraic Bernoulli identity is already baseline; only its arithmetic smoothing specialization is new. The ℚ-algebra generality is an explicit extension of the source's scalar calculation.

### Ordinary moments of the smoothing measure

DirichletPadicLFunctions:L1/measure-ordinary-moment

Declaration: DirichletPadic.smoothedMeasure_moment

Kind: theorem. Implementation: unchecked.

For p prime, p∤a and every k≥0, the image in ℚ_p of μ_a(x↦x^k) equals algebraMap ℚ ℚ_p ((1−a^(k+1)) B_(k+1)/(k+1)).

**Hypotheses**

- p is prime; a,k are natural numbers; p does not divide a. μ_a is the already planned ℤ_p-valued smoothedMeasure and x↦x^k is (ContinuousMap.id ℤ_p)^k.
- The measure is evaluated before the value is embedded into ℚ_p. No scalar-extension construction of measures and no ℤ_p-coefficient exponential series is assumed.

**Construction or proof outline**

- Apply the generic formal-exponential/Amice moment comparison supplied by PadicMeasuresIwasawaAlgebras:L2/ordinary-moment-exp to μ_a. That comparison identifies its embedded ordinary moment with k! times coefficient k of its coefficient-extended Amice series after substituting exp−1.
- Use measure-amice and series-coefficient-map for ℤ_p→ℚ_p to identify that coefficient-extended Amice series with F_a over ℚ_p. The norm/unit criteria already used in smoothed-measure supply the ℤ_p unit certificate; IsUnit.map supplies its image in ℚ_p.
- Apply series-exp-coefficients with R=ℚ_p. No factor (−1)^k remains in the Bernoulli expression. The separate smoothed-value-complex node recovers the source's complex notation via the same rational number.
- The generic comparison is supplied by the exact L2 node, whose weighting/Mahler/formal-calculus prerequisites end in the pinned baseline. This fills the supplier boundary in the proof plan, not an implementation claim.

**Prerequisites**

- DirichletPadicLFunctions:L1/measure-amice
- DirichletPadicLFunctions:L1/series-coefficient-map
- DirichletPadicLFunctions:L1/series-exp-coefficients
- PadicMeasuresIwasawaAlgebras:L2/ordinary-moment-exp
- mathlib:Nat.Prime.coprime_iff_not_dvd
- mathlib:PadicInt.norm_natCast_eq_one_iff
- mathlib:PadicInt.isUnit_iff
- mathlib:IsUnit.map

**Acceptance**

- For p=3,a=2 the moments of degrees 0,1,2,3 are 1/2,−1/4,0,1/8. The degree-two Mahler value is instead 1/8, so these test functions must not be conflated.
- For p=2,a=3 the degree-one ordinary moment is −2/3 in ℚ₂ and is integral. No inverse of 2 in ℤ₂ is required.

**Sources**

- RJW-published, Proposition 4.6, printed p. 137 / PDF 38, using Corollary 3.30, printed p. 126 / PDF 27.. The source's ordinary-moment theorem, expressed through its rational Bernoulli value. The formal coefficient proof route complements, but does not discharge, L0's mandated Mellin argument; the generic moment comparison remains with its accepted RS-14 owner.

### Integrality of smoothed Bernoulli values

DirichletPadicLFunctions:L1/smoothed-value-integral

Declaration: DirichletPadic.smoothedBernoulli_mem_padicInt

Kind: theorem. Implementation: unchecked.

For p prime and p∤a, for each k≥0 there exists z∈ℤ_p whose image in ℚ_p is (1−a^(k+1)) B_(k+1)/(k+1).

**Hypotheses**

- p is prime; a,k are natural numbers; p does not divide a. The rational expression is embedded in ℚ_p using algebraMap.

**Construction or proof outline**

- Choose z=μ_a((ContinuousMap.id ℤ_p)^k), which is in ℤ_p because the existing carrier is an integral measure on integral continuous functions.
- Use measure-ordinary-moment for the required equality in ℚ_p. This is smoothed integrality, not unsmoothed Bernoulli integrality, Kummer congruences or a dyadic pseudomeasure splitting.

**Prerequisites**

- DirichletPadicLFunctions:L1/measure-ordinary-moment

**Acceptance**

- For p=2,a=3,k=1 the value is −2/3, which is 2-adically integral although B₂/2=1/12 is not. The nonunit parameter p=2,a=2 remains excluded.

**Sources**

- RJW-published, Proposition 4.4, Definition 4.5 and Proposition 4.6, printed p. 137 / PDF 38.. Immediate arithmetic integrality consequence of the source's integral measure and moment theorem; the claim is explicitly smoothed.

### Cyclotomic average of the smoothing fractions

DirichletPadicLFunctions:L1/smoothing-root-average

Declaration: DirichletPadic.smoothed_rational_average

Kind: lemma. Implementation: unchecked.

For a characteristic-zero field K, a primitive p-th root ζ∈K, y∈K with y^p≠1 and y^(pa)≠1, and p∤a, the sum over 0≤i<p of [1/(ζ^i y−1)−a/((ζ^i y)^a−1)] equals p[1/(y^p−1)−a/(y^(pa)−1)].

**Hypotheses**

- p is prime, K is a field of characteristic zero, ζ is a primitive p-th root, a∈ℕ and p∤a, y^p≠1 and y^(pa)≠1.

**Construction or proof outline**

- Import the exact supplier root-partial-fractions identity: Σ_i 1/(ζ^i y−1)=p/(y^p−1). This is a finite identity in K, not an application of ψ to a pole.
- From p∤a and primality obtain gcd(a,p)=1. IsPrimitiveRoot.pow_of_coprime makes ζ^a primitive of order p. Apply the same imported identity to ζ^a and y^a. Its denominator is y^(pa)−1 by commutation of natural powers.
- Distribute the finite sum across subtraction and the scalar a, and combine the two identities. The displayed nonvanishing hypotheses ensure all denominators at roots are nonzero; no analytic substitution is used.

**Prerequisites**

- PadicMeasuresIwasawaAlgebras:L2/root-partial-fractions
- mathlib:IsPrimitiveRoot.pow_of_coprime
- mathlib:Nat.Prime.coprime_iff_not_dvd

**Acceptance**

- At p=2,a=3,ζ=−1,y=2 the two summands are 4/7 and 0, agreeing with 2(1/3−3/63)=4/7. At a=1 both sides vanish.
- The assumption p∤a is essential: at p=2,a=2,y=2 the two sides are −2/3 and 2/5, respectively.

**Sources**

- RJW-published, Lemma 4.7 and its partial-fraction calculation, printed p.137 / PDF38; arXiv v2 p.27.. The source computes the unsmoothed partial fractions and then smooths. This node gives only the arithmetic two-term consequence, leaving the generic identity to its owner.

### Frobenius comparison for the smoothed series

DirichletPadicLFunctions:L1/series-phi-psi-fixed

Declaration: DirichletPadic.phi_psi_smoothedSeries

Kind: lemma. Implementation: unchecked.

On B=ℤ_p[[T]], with b=(1+T)^p−1, φ(ψ_B(F_a))=φ(F_a), where φ(F)=F(b) and ψ_B is the exact bounded integral Amice-transported operator.

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Use the exact rational-root-average-descent in the supplier’s cyclotomic subfield K of ℂ_p, with its inclusion and canonical ℤ_p coefficient map. Write F_a=P/Q, where P=Σ_{j<a} choose(a,j+2)T^j and Q=Σ_{j<a} choose(a,j+1)T^j. Their series images are b_a and q_a; Q(0)=a is a unit. The existing cancellation equation supplies QF_a=P.
- In Frac(K[[T]]) put Y=1+T. The supplier comparison gives p·j(φψ_B F_a)=Σ_i P(ζ^iY−1)/Q(ζ^iY−1). Here polynomial evaluation is finite. It is never PowerSeries.subst at the nonnilpotent constant ζ^i−1.
- The binomial identities TQ=Y^a−1 and TP=Q−a turn each quotient into 1/(ζ^iY−1)−a/((ζ^iY)^a−1). All divisors are nonzero: for i=0 the linear coefficient detects nonzero T and aT, while for i≠0 the primitive-root/coprimality conditions give nonzero constants. Equivalently this follows from the nonzero polynomials in the field.
- Apply smoothing-root-average with y=Y. Its hypotheses hold because Y^p−1 and Y^(pa)−1 are nonzero polynomials in characteristic zero (p,a>0). The resulting right side is p·j(φF_a), by series-fraction-comparison for the receiving map j∘φ; this map sends T to the nonzero b.
- Cancel nonzero p in the field and use the injectivity of the coefficient/series embedding j to descend equality to B. The exact supplier nodes rational-root-average-descent and translated-polynomial-descent-nonzero now supply the operator comparison and nonvanishing. Their statements use the original bounded psiSeries and topological root evaluation, not an action on individual poles.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothing-root-average
- DirichletPadicLFunctions:L1/series-cancellation
- DirichletPadicLFunctions:L1/denominator-factorization
- DirichletPadicLFunctions:L1/series-cleared-equation
- DirichletPadicLFunctions:L1/series-fraction-comparison
- PadicMeasuresIwasawaAlgebras:L2/psi-series
- PadicMeasuresIwasawaAlgebras:L2/rational-root-average-descent
- PadicMeasuresIwasawaAlgebras:L2/translated-polynomial-descent-nonzero

**Acceptance**

- Both sides are integral series although individual fractions have poles. At a=1 both are zero; no Laurent-series extension of ψ is assumed.

**Sources**

- RJW-published, Lemma 4.7 and its partial-fraction calculation, printed p.137 / PDF38; arXiv v2 p.27.. Domain-correct version of the source’s intermediate equality; E6 records the missing domain justification.

### Psi invariance of the smoothing series

DirichletPadicLFunctions:L1/series-psi-fixed

Declaration: DirichletPadic.psi_smoothedSeries

Kind: theorem. Implementation: unchecked.

ψ_B(F_a)=F_a in ℤ_p[[T]].

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Apply the existing planned ψ_B to both sides of series-phi-psi-fixed. Use the exact psi-series-phi law twice: ψ_Bφ=id.
- This removes φ without introducing a localization action or an invariance hypothesis. The averaging input now follows from the exact supplier nodes imported by series-phi-psi-fixed.

**Prerequisites**

- DirichletPadicLFunctions:L1/series-phi-psi-fixed
- PadicMeasuresIwasawaAlgebras:L2/psi-series-phi

**Acceptance**

- Works at p=2 for odd a as well as odd p. For a=1 it agrees with ψ_B(0)=0.

**Sources**

- RJW-published, Lemma 4.7 and its partial-fraction calculation, printed p.137 / PDF38; arXiv v2 p.27.. The exact arithmetic fixed-point statement on the bounded carrier. Generic root averaging is supplied by the exact L2 rational-root-average-descent node.

### Psi invariance of the smoothing measure

DirichletPadicLFunctions:L1/measure-psi-fixed

Declaration: DirichletPadic.psi_smoothedMeasure

Kind: theorem. Implementation: unchecked.

ψ(μ_a)=μ_a in D(ℤ_p,ℤ_p).

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Apply injective_amiceTransform. Rewrite A(ψμ_a) using psi-series-intertwining and Aμ_a=F_a using measure-amice.
- Apply series-psi-fixed, then measure-amice in reverse. The p-adic unit certificate is the same norm/unit criterion as in smoothed-measure.

**Prerequisites**

- DirichletPadicLFunctions:L1/series-psi-fixed
- DirichletPadicLFunctions:L1/measure-amice
- PadicMeasuresIwasawaAlgebras:L2/psi-series-intertwining
- mathlib:AbstractMeasure.injective_amiceTransform
- DirichletPadicLFunctions:L1/smoothed-measure

**Acceptance**

- This is ψ-invariance of μ_a, not unit support: ψμ_a=μ_a, whereas a unit-supported measure has ψμ=0. For p=3,a=2 the nonzero total mass 1/2 rules out that confusion.

**Sources**

- RJW-published, Lemma 4.7 and its partial-fraction calculation, printed p.137 / PDF38; arXiv v2 p.27.. Lemma 4.7 itself, transported through the exact integral Amice comparison.

### Trivial smoothing measure

DirichletPadicLFunctions:L1/measure-one

Declaration: DirichletPadic.smoothedMeasure_one

Kind: lemma. Implementation: unchecked.

For every prime p, the admissible boundary parameter a=1 gives μ_1=0.

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- At a=1 every numerator coefficient choose(1,n+2) vanishes. Unfold the smoothed-series definition and use coefficient extensionality to get F_1=0.
- Use measure-amice and injective_amiceTransform to conclude μ_1=0. This boundary test is independent of root averaging.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-series
- DirichletPadicLFunctions:L1/measure-amice
- mathlib:AbstractMeasure.injective_amiceTransform

**Acceptance**

- The denominator θ_1=[1]−[1] is also zero; the zero measure test does not allow division by θ_1.

**Sources**

- RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28.. Boundary extension of the source’s arithmetic measure definition, used to test the restriction and numerator constructions.

### Unit restriction of the smoothing measure

DirichletPadicLFunctions:L1/unit-smoothed-measure

Declaration: DirichletPadic.unitSmoothedMeasure

Kind: construction. Implementation: unchecked.

Construct ρ_a=unitSmoothedMeasure p a := Eμ_a in D(ℤ_p,ℤ_p). It is the unit restriction on the ambient carrier.

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Apply the existing unitRestriction linear map to the already constructed μ_a. No subtype measure, coefficient extension or new restriction operator is constructed.
- The definition requires no ψ-invariance. The separate support, difference and moment nodes prove the arithmetic API; the difference and numerical moments use the exact averaging supplier through series-phi-psi-fixed.
- The a=1 API uses measure-one and linearity of E; it does not use averaging.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-measure
- DirichletPadicLFunctions:L1/measure-one
- PadicMeasuresIwasawaAlgebras:L2/unit-restriction

**Acceptance**

- The integral ambient carrier is retained at p=2. The mass and moment tests depend on the Euler-factor proof; they are typed target tests, not independently implemented evidence.

**API**

- DirichletPadic.unitSmoothedMeasure_eq: ρ_a=Eμ_a.
- DirichletPadic.unitSmoothedMeasure_supported: Eρ_a=ρ_a; promoted to unit-smoothed-support.
- DirichletPadic.unitSmoothedMeasure_eq_sub_phi: ρ_a=μ_a−φμ_a; promoted to unit-smoothed-difference.
- DirichletPadic.unitSmoothedMeasure_euler: ρ_a(x^k)=(1−p^k)μ_a(x^k); promoted to unit-smoothed-euler.
- DirichletPadic.unitSmoothedMeasure_moment: Its embedded moment is (1−p^k)(1−a^(k+1))B_(k+1)/(k+1); promoted to unit-smoothed-moment.
- DirichletPadic.unitSmoothedMeasure_mass: ρ_a(1)=0; promoted to unit-smoothed-mass.
- DirichletPadic.unitSmoothedMeasure_one: At a=1 the measure ρ_1 is zero.
- extend_unitSmoothedMeasure_moment: The actual Q_p-valued extension of the ambient unit restriction has the Euler-smoothed moments; promoted.

**Tests**

- SuggestedTests.unit_smoothing_mass: For p=3,a=2, ρ_a(1)=0.
- SuggestedTests.unit_smoothing_first_moment: For p=3,a=2, the image of ρ_a(x) in ℚ₃ is 1/2.
- SuggestedTests.unit_smoothing_dyadic: For p=2,a=3, the image of ρ_a(x) in ℚ₂ is 2/3.
- SuggestedTests.unit_smoothing_one: For p=3,a=1, ρ_a=0.

**Uses**

- RJW Proposition 4.8: The restriction removes the Euler factor.
- RJW equation (4-3) and Definition 4.10: The numerator is its inverse weighting before any pseudomeasure denominator is inverted.
- RJW§4.1 arithmetic measures; coefficient-field comparisons consumed by DirichletPadicLFunctions:L2–L3 and ColemanIntegration:L3: Apply the existing actual coefficient-extension map before evaluating coefficient-valued tests. Keep the ambient domain, bounded-scalar hypotheses and the distinction between Q_p integral descent and other coefficient-field descent.

**Sources**

- RJW-published, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.28.. Arithmetic application of the generic unit restriction already owned by L2.

### Unit support of the restricted smoothing measure

DirichletPadicLFunctions:L1/unit-smoothed-support

Declaration: DirichletPadic.unitSmoothedMeasure_supported

Kind: lemma. Implementation: unchecked.

Eρ_a=ρ_a.

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Unfold unit-smoothed-measure. At each continuous test function f, apply the exact unit-restriction-evaluation supplier twice: E(Eμ_a)(f)=μ_a((1−χ)((1−χ)f)), where χ is the existing clopen characteristic function of pZ.
- By the pinned LocallyConstant.coe_charFn, χ has value zero or one at each point. Split on membership in pZ; (1−χ)²=1−χ in both cases. Hence the value is μ_a((1−χ)f)=Eμ_a(f). Extensionality concludes, independently of root averaging. No unpromoted foreign idempotence API is used.

**Prerequisites**

- DirichletPadicLFunctions:L1/unit-smoothed-measure
- PadicMeasuresIwasawaAlgebras:L2/unit-restriction-evaluation
- mathlib:LocallyConstant.coe_charFn

**Acceptance**

- Equivalent to ψρ_a=0 by the supplier’s unit-support criterion; this statement does not say ψμ_a=0.

**Sources**

- RJW-published, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.28.. The source restricts to units; the ambient formulation records that support exactly.

### Euler projector on the arithmetic measure

DirichletPadicLFunctions:L1/unit-smoothed-difference

Declaration: DirichletPadic.unitSmoothedMeasure_eq_sub_phi

Kind: lemma. Implementation: unchecked.

ρ_a=μ_a−φμ_a.

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Use E=id−P from unit-restriction and Pμ=φψμ from phi-psi.
- Apply measure-psi-fixed to μ_a. Thus Eμ_a=μ_a−φμ_a. This is where the source’s ψ-invariance is required.

**Prerequisites**

- DirichletPadicLFunctions:L1/unit-smoothed-measure
- DirichletPadicLFunctions:L1/measure-psi-fixed
- PadicMeasuresIwasawaAlgebras:L2/unit-restriction
- PadicMeasuresIwasawaAlgebras:L2/phi-psi

**Acceptance**

- Taking total mass gives zero since φ preserves constant test functions. The equality holds on all continuous test functions.

**Sources**

- RJW-published, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.28.. The second equality in the proof of Proposition 4.8.

### Euler factor for unit moments

DirichletPadicLFunctions:L1/unit-smoothed-euler

Declaration: DirichletPadic.unitSmoothedMeasure_euler

Kind: lemma. Implementation: unchecked.

For every k≥0, ρ_a(x↦x^k)=(1−p^k)μ_a(x↦x^k) in ℤ_p.

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Evaluate unit-smoothed-difference on the continuous polynomial x^k.
- Use phi-evaluation to replace (φμ_a)(x^k) by μ_a((px)^k). Pointwise (px)^k=p^k x^k; integral measure linearity extracts p^k. This also holds for k=0, including at x=0.

**Prerequisites**

- DirichletPadicLFunctions:L1/unit-smoothed-difference
- PadicMeasuresIwasawaAlgebras:L2/phi-evaluation

**Acceptance**

- At k=0 the factor is zero. At p=2,k=1 it is −1, not an inverse of 2.

**Sources**

- RJW-published, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.28.. The source’s last equality in the proof of Proposition 4.8.

### Smoothed Bernoulli values on units

DirichletPadicLFunctions:L1/unit-smoothed-moment

Declaration: DirichletPadic.unitSmoothedMeasure_moment

Kind: theorem. Implementation: unchecked.

For k≥0, the image of ρ_a(x^k) in ℚ_p is (1−p^k)(1−a^(k+1))B_(k+1)/(k+1), with rational Bernoulli numbers B₁=−1/2.

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Embed unit-smoothed-euler into ℚ_p. Apply measure-ordinary-moment and preservation of rational/natural scalars by the canonical maps.
- The result is stated as an equality of two images in ℚ_p, after evaluating the integral measure. It never casts a complex zeta value into a p-adic field.

**Prerequisites**

- DirichletPadicLFunctions:L1/unit-smoothed-euler
- DirichletPadicLFunctions:L1/measure-ordinary-moment

**Acceptance**

- For p=3,a=2 the moments of degrees 0,1,2,3 are 0,1/2,0,−13/4. For p=2,a=3 the first moment is 2/3.

**Sources**

- RJW-published, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.28.. Bernoulli normalization of Proposition 4.8, using the earlier exact rational/complex comparison.

### Zero mass of the unit smoothing measure

DirichletPadicLFunctions:L1/unit-smoothed-mass

Declaration: DirichletPadic.unitSmoothedMeasure_mass

Kind: lemma. Implementation: unchecked.

ρ_a(1)=0 in ℤ_p.

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Specialize unit-smoothed-euler to k=0. The continuous function x^0 is 1 everywhere and 1−p^0=0.

**Prerequisites**

- DirichletPadicLFunctions:L1/unit-smoothed-euler

**Acceptance**

- The full μ_a has mass (a−1)/2 in ℚ_p, so zero unit mass is a meaningful restriction test.

**Sources**

- RJW-published, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.28.. Weight-zero consequence of Proposition 4.8, required at the k=1 numerator endpoint.

### Integrality of Euler-smoothed Bernoulli values

DirichletPadicLFunctions:L1/unit-smoothed-integral

Declaration: DirichletPadic.unitSmoothedBernoulli_mem_padicInt

Kind: theorem. Implementation: unchecked.

For every k≥0, (1−p^k)(1−a^(k+1))B_(k+1)/(k+1) in ℚ_p lies in the image of ℤ_p.

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Take the integral witness ρ_a(x^k). Apply unit-smoothed-moment. This does not assert integrality after cancelling either factor.

**Prerequisites**

- DirichletPadicLFunctions:L1/unit-smoothed-moment

**Acceptance**

- At p=2,a=3,k=1 the value 2/3 is integral. No assertion is made that B₂/2 is integral.

**Sources**

- RJW-published, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.28.. Integral consequence of the actual measure; a Kummer theorem still needs its own denominator and congruence hypotheses.

### Arithmetic numerator measure

DirichletPadicLFunctions:L1/smoothed-numerator

Declaration: DirichletPadic.smoothedNumerator

Kind: construction. Implementation: unchecked.

Construct ν_a=smoothedNumerator p a := Jμ_a in D(ℤ_p,ℤ_p), where J is the exact imported inverseWeight. Since J(Eμ)=Jμ, this is x⁻¹ times the unit-restricted smoothing measure.

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Apply the existing inverseWeight to μ_a. Its multiplier is the already existing PadicInt.inv, continuous by the supplier’s proof plan and zero at every nonunit. No new inverse function or generic measure operator is defined.
- Use inverse-weight-support to identify Jμ_a with Jρ_a. The inverse-weight-evaluation node supplies the evaluation API. Its support and primitive characterization are proved in the promoted nodes below, independently of ψ-invariance.
- The a=1 API follows from measure-one and linearity of J. Numerical moments are proved through the moment-shift and Euler-factor nodes, not assumed by the construction.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-measure
- DirichletPadicLFunctions:L1/unit-smoothed-measure
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight-support
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight-evaluation
- DirichletPadicLFunctions:L1/measure-one

**Acceptance**

- The definition is meaningful for every prime, including p=2. It constructs the integral numerator only; no completed-group-ring denominator has been inverted.

**API**

- DirichletPadic.smoothedNumerator_eq_inverse_restriction: ν_a=Jρ_a.
- DirichletPadic.smoothedNumerator_apply: ν_a(f)=μ_a(ιf), with ι the continuous existing unit inverse extended by zero.
- DirichletPadic.smoothedNumerator_supported: Eν_a=ν_a; promoted to numerator-support.
- DirichletPadic.weight_smoothedNumerator: Wν_a=ρ_a, where W is weighting by x; promoted to numerator-weight.
- DirichletPadic.smoothedNumerator_unique: A unit-supported ν with Wν=ρ_a equals ν_a; promoted to numerator-unique.
- DirichletPadic.smoothedNumerator_moment_shift: ν_a(x^(k+1))=ρ_a(x^k) for k≥0; promoted to numerator-moment-shift.
- DirichletPadic.smoothedNumerator_moment: For k≥1 its embedded moment is (1−p^(k−1))(1−a^k)B_k/k; promoted to numerator-moment.
- DirichletPadic.amice_smoothedNumerator: Aν_a=inverseMahler(F_a); promoted to numerator-amice.
- DirichletPadic.smoothedNumerator_one: ν_1=0.
- DirichletPadic.smoothedNumerator_mul: For natural a,b prime to p, ν_(ab)=ν_a+σ_a(ν_b), where ν_c=Jμ_c. There is no extra scalar a after inverse weighting. Promoted to numerator-smoothing-cocycle.
- DirichletPadic.smoothedNumerator_cross: For natural a,b prime to p, σ_b(ν_a)−ν_a=σ_a(ν_b)−ν_b in D(Z,Z). This is the explicit numerator compatibility for the eventual denominators [a]−[1], expressed solely by existing pushforwards. Promoted to numerator-cross-smoothing.
- DirichletPadic.smoothedNumerator_even: For every natural a prime to p, AbstractMeasure.map ε ν_a=ν_a, with ε(z)=−z and ν_a=Jμ_a. The equality holds integrally also at p=2. Promoted to numerator-even.
- extend_smoothedNumerator_moment: The actual Q_p-valued extension has the shifted numerator moments for k≥1; promoted.

**Tests**

- SuggestedTests.numerator_endpoint: For p=3,a=2, ν_a(x)=0.
- SuggestedTests.numerator_second_moment: For p=3,a=2, the image of ν_a(x²) in ℚ₃ is 1/2.
- SuggestedTests.numerator_dyadic: For p=2,a=3, the image of ν_a(x²) in ℚ₂ is 2/3.
- SuggestedTests.numerator_one: For p=3,a=1, ν_a=0.
- SuggestedTests.numerator_not_unit_measure: For p=3,a=2, ν_a≠ρ_a; their first moments are 0 and 1/2.
- SuggestedSmoothingTests.numerator_product_scalar: At p=3, Jμ₄=Jμ₂+σ₂Jμ₂, without an extra 2.
- SuggestedSmoothingTests.cross_smoothing_second_moment: At p=3, 15·(Jμ₂)(x²)=3·(Jμ₄)(x²), detecting the exponent k in the normalized factors.
- SuggestedSmoothingTests.even_dyadic_numerator: At p=2, map(−id)(Jμ₃)=Jμ₃.

**Uses**

- RJW equation (4-3): Shifts the exponent so the smoothing factor is a^k−1.
- RJW Definition 4.10 and Proposition 4.11: Supplies the arithmetic numerator whose regularity and division by θ_a remain separate proof obligations.
- ColemanPowerSeries:L2 comparison: Gives an exact arithmetic Amice target; the Coleman owner still proves its normalization and sign comparison.
- RJW Proposition 4.11; DirichletPadicLFunctions:L1 arithmetic smoothing compatibility and parity: Compare actual smoothing parameters before localization. The unweighted cocycle has scalar a; inverse weighting cancels it. Reflection has a zero-atom correction, killed by the inverse weight. These provide arithmetic identities for the denominator-qualified independence and parity/descent comparisons.
- RJW§4.1 arithmetic measures; coefficient-field comparisons consumed by DirichletPadicLFunctions:L2–L3 and ColemanIntegration:L3: Apply the existing actual coefficient-extension map before evaluating coefficient-valued tests. Keep the ambient domain, bounded-scalar hypotheses and the distinction between Q_p integral descent and other coefficient-field descent.

**Sources**

- RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28.. The arithmetic specialization of equation (4-3), using the owner’s now explicit generic operator.

### Unit support of the arithmetic numerator

DirichletPadicLFunctions:L1/numerator-support

Declaration: DirichletPadic.smoothedNumerator_supported

Kind: lemma. Implementation: unchecked.

Eν_a=ν_a.

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Apply inverse-weight-support to μ_a and unfold smoothed-numerator. The result is independent of root averaging.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-numerator
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight-support

**Acceptance**

- The equivalent criterion is ψν_a=0. This follows because J vanishes on every nonunit, not by treating all nonzero p-adic integers as units.

**Sources**

- RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28.. The source constructs the numerator on units; the shared ambient formulation makes this support explicit.

### Primitive equation for the numerator

DirichletPadicLFunctions:L1/numerator-weight

Declaration: DirichletPadic.weight_smoothedNumerator

Kind: lemma. Implementation: unchecked.

Wν_a=ρ_a, where W is weighting by the identity continuous function x.

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Apply the exact generic weight-inverse-weight identity WJμ=Eμ to μ_a. Unfold the two arithmetic constructions.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-numerator
- DirichletPadicLFunctions:L1/unit-smoothed-measure
- PadicMeasuresIwasawaAlgebras:L2/weight-inverse-weight

**Acceptance**

- The identity is on every continuous test function, including weight zero; it does not invert x at a nonunit.

**Sources**

- RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28.. Defining cancellation of multiplication by x and by x⁻¹ on the unit-supported component.

### Unique unit-supported arithmetic primitive

DirichletPadicLFunctions:L1/numerator-unique

Declaration: DirichletPadic.smoothedNumerator_unique

Kind: theorem. Implementation: unchecked.

For ν∈D, if Eν=ν and Wν=ρ_a, then ν=ν_a.

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Apply J to Wν=ρ_a. The generic inverse-weight-weight identity gives JWν=Eν=ν.
- On the right, inverse-weight-support gives Jρ_a=Jμ_a=ν_a. Thus equality follows. Support is essential, since W kills the mass at zero.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-numerator
- DirichletPadicLFunctions:L1/unit-smoothed-measure
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight-weight
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight-support

**Acceptance**

- Without unit support, ν_a+cδ₀ has the same W-image for any c. The uniqueness statement therefore tests both required properties.

**Sources**

- RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28.. Uniqueness API derived from the source’s inverse weighting, without claiming pseudomeasure independence.

### Moment shift under inverse weighting

DirichletPadicLFunctions:L1/numerator-moment-shift

Declaration: DirichletPadic.smoothedNumerator_moment_shift

Kind: lemma. Implementation: unchecked.

For k≥0, ν_a(x^(k+1))=ρ_a(x^k) in ℤ_p.

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Evaluate numerator-weight on x^k. The exact weight-evaluation theorem gives (Wν_a)(x^k)=ν_a(x·x^k). Rewrite pointwise x·x^k=x^(k+1).

**Prerequisites**

- DirichletPadicLFunctions:L1/numerator-weight
- PadicMeasuresIwasawaAlgebras:L2/weight-evaluation

**Acceptance**

- At k=0 it says ν_a(x)=ρ_a(1); it supplies no formula for the total mass ν_a(1).

**Sources**

- RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28.. The exponent shift immediately after equation (4-3).

### Bernoulli moments of the arithmetic numerator

DirichletPadicLFunctions:L1/numerator-moment

Declaration: DirichletPadic.smoothedNumerator_moment

Kind: theorem. Implementation: unchecked.

For every integer k≥1, the image of ν_a(x^k) in ℚ_p equals (1−p^(k−1))(1−a^k)B_k/k.

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Write k=(k−1)+1 using k≥1. Apply numerator-moment-shift and unit-smoothed-moment at degree k−1.
- Normalize natural exponents and the rational denominator. At k=1 the factor 1−p^0 is zero. Do not cancel it or invoke the false assertion ζ(0)=0; E4 already records the source’s endpoint error.

**Prerequisites**

- DirichletPadicLFunctions:L1/numerator-moment-shift
- DirichletPadicLFunctions:L1/unit-smoothed-moment

**Acceptance**

- At k=1 the moment is zero for every p,a. At p=3,a=2,k=2 it is 1/2; at p=2,a=3,k=2 it is 2/3. The theorem makes no claim at k=0.

**Sources**

- RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28.. Rational Bernoulli form of the source’s numerator interpolation identity; it is not yet a theorem about the pseudomeasure ζ_p.

### Integrality of numerator Bernoulli moments

DirichletPadicLFunctions:L1/numerator-integral

Declaration: DirichletPadic.smoothedNumeratorBernoulli_mem_padicInt

Kind: theorem. Implementation: unchecked.

For k≥1, the rational value (1−p^(k−1))(1−a^k)B_k/k has integral image in ℚ_p.

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Take z=ν_a(x^k) in ℤ_p and use numerator-moment. No division by the smoothing factor or Euler factor is licensed.

**Prerequisites**

- DirichletPadicLFunctions:L1/numerator-moment

**Acceptance**

- The k=1 witness is zero. Dyadic p=2,a=3,k=2 gives 2/3, and is integral without an odd-prime hypothesis.

**Sources**

- RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28.. Integrality from the concrete arithmetic numerator; congruences and pseudomeasure division remain separate.

### Amice transform of the arithmetic numerator

DirichletPadicLFunctions:L1/numerator-amice

Declaration: DirichletPadic.amice_smoothedNumerator

Kind: comparison. Implementation: unchecked.

Aν_a=inverseMahler(F_a) in ℤ_p[[T]], using the exact integral inverseMahler supplied by L2.

**Hypotheses**

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the nondegenerate pseudomeasure construction.

**Construction or proof outline**

- Apply inverse-mahler-intertwining to μ_a: A(Jμ_a)=inverseMahler(Aμ_a). Substitute measure-amice and unfold smoothed-numerator.
- This comparison is independent of the missing root-average bridge. It connects the arithmetic numerator to the existing generic primitive operator, rather than rebuilding that operator in Dirichlet or Coleman.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-numerator
- DirichletPadicLFunctions:L1/measure-amice
- PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-intertwining

**Acceptance**

- At a=1 both sides vanish. The comparison uses integral series and the existing inverseMahler, not a field-valued Amice inverse.

**Sources**

- RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28.. Amice expression of the source’s inverse-weighted numerator, with generic construction imported.

### Multiplication of smoothing parameters

DirichletPadicLFunctions:L1/measure-smoothing-cocycle

Declaration: DirichletPadic.smoothedMeasure_mul

Kind: lemma. Implementation: unchecked.

For natural a,b with p∤a and p∤b, μ_(ab)=μ_a+a·σ_a(μ_b) as actual elements of D(Z,Z). The scalar a multiplies the raw pushforward; it is essential.

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p, D=D(Z,Z) is the existing integral abstract-measure carrier. μ_a is the existing arithmetic smoothedMeasure for a∈ℕ with p∤a. Natural a=1 is included as the existing degenerate zero case.
- Write d_c:C(Z,Z) for z↦cz and σ_c=AbstractMeasure.map d_c for the existing raw pushforward. Write ε:C(Z,Z) for z↦−z. This notation introduces no new action, carrier or formal-substitution comparison.

**Construction or proof outline**

- Primality implies p∤ab, so all three already defined arithmetic measures exist. Any proof certificate gives the same measure.
- Evaluate the difference against x^k for every k≥0. The existing pushforward evaluation gives (σ_a μ_b)(x^k)=a^k μ_b(x^k); pull the constant through the linear functional.
- Embed the evaluated values in ℚ_p and use measure-ordinary-moment. With B=B_(k+1)/(k+1), the rational identity (1−(ab)^(k+1))B=(1−a^(k+1))B+a^(k+1)(1−b^(k+1))B cancels every moment. Ring-map laws and PadicInt.ext return the equality to Z.
- For the difference λ of the two displayed sides, apply the existing AbstractMeasure.ext_mahler. Pointwise, n!·mahler_n is the descending Pochhammer polynomial by mahler_apply and Ring.descPochhammer_eq_factorial_smul_choose. Expand it as the finite sum of integral coefficients times x^k using Polynomial.smeval_eq_sum and Polynomial.sum. Linearity and the just-computed zero ordinary moments give n!·λ(mahler_n)=0. Cancel the nonzero integer n! in the domain Z, then apply ext_mahler. This is a direct finite polynomial expansion inside the arithmetic proof, not a newly asserted generic moment theorem or division by n! in Z.

**Prerequisites**

- DirichletPadicLFunctions:L1/measure-ordinary-moment
- mathlib:AbstractMeasure.map
- mathlib:AbstractMeasure.map_apply
- mathlib:AbstractMeasure.ext_mahler
- mathlib:mahler_apply
- mathlib:Ring.descPochhammer_eq_factorial_smul_choose
- mathlib:Polynomial.smeval_eq_sum
- mathlib:Polynomial.sum
- mathlib:Polynomial.smul_pow
- mathlib:PadicInt.ext

**Acceptance**

- At p=3,a=b=2, μ₄=μ₂+2σ₂μ₂. The total masses are 3/2=1/2+2·1/2, detecting omission of a.
- At p=2,a=3,b=5, μ₁₅=μ₃+3σ₃μ₅; all coefficients remain integral. No odd-prime hypothesis or inverse of 2 is used.

**Sources**

- RJW-published, Proposition 4.6, printed p.137 / PDF38; equation (4-3), Definition 4.10 and Proposition 4.11, printed pp.138–139 / PDF39–40. Moment-determination method: Lemma 3.36(i), printed p.130 / PDF31. §4 collated with arXiv v2 PDF27–28.. These arithmetic cocycle/reflection identities are explicit consequences of the source’s smoothed moments and inverse weighting, decomposed here as the compatibility input for its claimed independence. The source does not state these exact formulas as separate lemmas. The proof works in the pinned ambient integral carrier and retains the actual completed-group-algebra and regularity comparisons as gaps. All-prime validity, including the integral dyadic reflection identity without averaging by 1/2, is checked by this argument.

### Cross-smoothing before inverse weighting

DirichletPadicLFunctions:L1/measure-cross-smoothing

Declaration: DirichletPadic.smoothedMeasure_cross

Kind: lemma. Implementation: unchecked.

For natural a,b prime to p, b·σ_b(μ_a)−μ_a=a·σ_a(μ_b)−μ_b in D(Z,Z).

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p, D=D(Z,Z) is the existing integral abstract-measure carrier. μ_a is the existing arithmetic smoothedMeasure for a∈ℕ with p∤a. Natural a=1 is included as the existing degenerate zero case.
- Write d_c:C(Z,Z) for z↦cz and σ_c=AbstractMeasure.map d_c for the existing raw pushforward. Write ε:C(Z,Z) for z↦−z. This notation introduces no new action, carrier or formal-substitution comparison.

**Construction or proof outline**

- Apply measure-smoothing-cocycle to (a,b) and to (b,a). Natural multiplication commutes, and proof irrelevance identifies the same μ_(ab).
- Equate the right sides and rearrange in the additive group. The factors a and b belong to the unweighted arithmetic measures and must remain.

**Prerequisites**

- DirichletPadicLFunctions:L1/measure-smoothing-cocycle

**Acceptance**

- The equality holds for a=1 or b=1 using the already constructed zero measure; it does not license division by [1]−[1].

**Sources**

- RJW-published, Proposition 4.6, printed p.137 / PDF38; equation (4-3), Definition 4.10 and Proposition 4.11, printed pp.138–139 / PDF39–40. Moment-determination method: Lemma 3.36(i), printed p.130 / PDF31. §4 collated with arXiv v2 PDF27–28.. These arithmetic cocycle/reflection identities are explicit consequences of the source’s smoothed moments and inverse weighting, decomposed here as the compatibility input for its claimed independence. The source does not state these exact formulas as separate lemmas. The proof works in the pinned ambient integral carrier and retains the actual completed-group-algebra and regularity comparisons as gaps. All-prime validity, including the integral dyadic reflection identity without averaging by 1/2, is checked by this argument.

### Reflection with the zero-atom correction

DirichletPadicLFunctions:L1/measure-reflection

Declaration: DirichletPadic.smoothedMeasure_reflection

Kind: lemma. Implementation: unchecked.

For every natural a prime to p, μ_a+AbstractMeasure.map ε μ_a=(a−1)·δ₀ in D(Z,Z), with ε(z)=−z and δ₀ the existing Dirac measure at zero.

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p, D=D(Z,Z) is the existing integral abstract-measure carrier. μ_a is the existing arithmetic smoothedMeasure for a∈ℕ with p∤a. Natural a=1 is included as the existing degenerate zero case.
- Write d_c:C(Z,Z) for z↦cz and σ_c=AbstractMeasure.map d_c for the existing raw pushforward. Write ε:C(Z,Z) for z↦−z. This notation introduces no new action, carrier or formal-substitution comparison.

**Construction or proof outline**

- For λ equal to the left side minus the right, pushforward and Dirac evaluation give its kth moment as (1+(−1)^k)μ_a(x^k)−(a−1)0^k.
- At k=0, 0^0=1 and the existing bernoulli_one gives 2μ_a(1)=a−1 after embedding the evaluated scalar in ℚ_p; return via PadicInt.ext. No inverse of 2 in Z is used.
- For odd positive k, 1+(−1)^k=0. For even k>0, k+1 is odd and exceeds 1, so bernoulli_eq_zero_of_odd makes the moment vanish. The Dirac term vanishes whenever k>0.
- For the difference λ of the two displayed sides, apply the existing AbstractMeasure.ext_mahler. Pointwise, n!·mahler_n is the descending Pochhammer polynomial by mahler_apply and Ring.descPochhammer_eq_factorial_smul_choose. Expand it as the finite sum of integral coefficients times x^k using Polynomial.smeval_eq_sum and Polynomial.sum. Linearity and the just-computed zero ordinary moments give n!·λ(mahler_n)=0. Cancel the nonzero integer n! in the domain Z, then apply ext_mahler. This is a direct finite polynomial expansion inside the arithmetic proof, not a newly asserted generic moment theorem or division by n! in Z.

**Prerequisites**

- DirichletPadicLFunctions:L1/measure-ordinary-moment
- mathlib:AbstractMeasure.map
- mathlib:AbstractMeasure.map_apply
- mathlib:AbstractMeasure.ext_mahler
- mathlib:mahler_apply
- mathlib:Ring.descPochhammer_eq_factorial_smul_choose
- mathlib:Polynomial.smeval_eq_sum
- mathlib:Polynomial.sum
- mathlib:Polynomial.smul_pow
- mathlib:PadicInt.ext
- mathlib:AbstractMeasure.dirac
- mathlib:AbstractMeasure.dirac_apply
- mathlib:bernoulli_one
- mathlib:bernoulli_eq_zero_of_odd

**Acceptance**

- At p=3,a=2, the correction is exactly δ₀, not zero. At p=2,a=3 it is 2δ₀, which is nonzero in ℤ₂. Reflection alone therefore does not make μ_a odd on the ambient space.

**Sources**

- RJW-published, Proposition 4.6, printed p.137 / PDF38; equation (4-3), Definition 4.10 and Proposition 4.11, printed pp.138–139 / PDF39–40. Moment-determination method: Lemma 3.36(i), printed p.130 / PDF31. §4 collated with arXiv v2 PDF27–28.. These arithmetic cocycle/reflection identities are explicit consequences of the source’s smoothed moments and inverse weighting, decomposed here as the compatibility input for its claimed independence. The source does not state these exact formulas as separate lemmas. The proof works in the pinned ambient integral carrier and retains the actual completed-group-algebra and regularity comparisons as gaps. All-prime validity, including the integral dyadic reflection identity without averaging by 1/2, is checked by this argument.

### Smoothing cocycle for the unit numerator

DirichletPadicLFunctions:L1/numerator-smoothing-cocycle

Declaration: DirichletPadic.smoothedNumerator_mul

Kind: lemma. Implementation: unchecked.

For natural a,b prime to p, ν_(ab)=ν_a+σ_a(ν_b), where ν_c=Jμ_c. There is no extra scalar a after inverse weighting.

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p, D=D(Z,Z) is the existing integral abstract-measure carrier. μ_a is the existing arithmetic smoothedMeasure for a∈ℕ with p∤a. Natural a=1 is included as the existing degenerate zero case.
- Write d_c:C(Z,Z) for z↦cz and σ_c=AbstractMeasure.map d_c for the existing raw pushforward. Write ε:C(Z,Z) for z↦−z. This notation introduces no new action, carrier or formal-substitution comparison.
- J is the exact supplier inverseWeight p; ν_a is the existing DirichletPadic.smoothedNumerator, defined by ν_a=Jμ_a. The supplier inverse-weight-support gives ν_a=J(unitRestriction μ_a) and its unit support. No intrinsic unit-group measure, completed Iwasawa algebra, denominator regularity or localization is inferred.

**Construction or proof outline**

- Apply the supplier linear map J to measure-smoothing-cocycle. Linearity gives Jμ_a+a·J(σ_a μ_b).
- The existing prime/coprimality and norm/unit criteria make a a unit of Z. Apply the exact inverse-weight-dilation supplier to this unit: J(σ_a μ_b)=a⁻¹·σ_a(Jμ_b). The forward pushforward direction is unchanged.
- Cancel a·a⁻¹=1 in Z to obtain the formula. The inverse-weight-support supplier identifies each Jμ_c with the inverse-weighted restriction used by the arithmetic numerator. No ψ-invariance or root-averaging theorem is needed for this compatibility identity.

**Prerequisites**

- DirichletPadicLFunctions:L1/measure-smoothing-cocycle
- DirichletPadicLFunctions:L1/smoothed-numerator
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight-dilation
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight-support
- mathlib:Nat.Prime.coprime_iff_not_dvd
- mathlib:PadicInt.norm_natCast_eq_one_iff
- mathlib:PadicInt.isUnit_iff

**Acceptance**

- At p=3,a=b=2 the formula is ν₄=ν₂+σ₂ν₂. The scalar 2 from the unweighted formula is cancelled by the supplier’s inverse scalar 1/2.

**Sources**

- RJW-published, Proposition 4.6, printed p.137 / PDF38; equation (4-3), Definition 4.10 and Proposition 4.11, printed pp.138–139 / PDF39–40. Moment-determination method: Lemma 3.36(i), printed p.130 / PDF31. §4 collated with arXiv v2 PDF27–28.. These arithmetic cocycle/reflection identities are explicit consequences of the source’s smoothed moments and inverse weighting, decomposed here as the compatibility input for its claimed independence. The source does not state these exact formulas as separate lemmas. The proof works in the pinned ambient integral carrier and retains the actual completed-group-algebra and regularity comparisons as gaps. All-prime validity, including the integral dyadic reflection identity without averaging by 1/2, is checked by this argument.

### Cross-smoothing for the unit numerator

DirichletPadicLFunctions:L1/numerator-cross-smoothing

Declaration: DirichletPadic.smoothedNumerator_cross

Kind: lemma. Implementation: unchecked.

For natural a,b prime to p, σ_b(ν_a)−ν_a=σ_a(ν_b)−ν_b in D(Z,Z). This is the explicit numerator compatibility for the eventual denominators [a]−[1], expressed solely by existing pushforwards.

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p, D=D(Z,Z) is the existing integral abstract-measure carrier. μ_a is the existing arithmetic smoothedMeasure for a∈ℕ with p∤a. Natural a=1 is included as the existing degenerate zero case.
- Write d_c:C(Z,Z) for z↦cz and σ_c=AbstractMeasure.map d_c for the existing raw pushforward. Write ε:C(Z,Z) for z↦−z. This notation introduces no new action, carrier or formal-substitution comparison.
- J is the exact supplier inverseWeight p; ν_a is the existing DirichletPadic.smoothedNumerator, defined by ν_a=Jμ_a. The supplier inverse-weight-support gives ν_a=J(unitRestriction μ_a) and its unit support. No intrinsic unit-group measure, completed Iwasawa algebra, denominator regularity or localization is inferred.

**Construction or proof outline**

- Apply numerator-smoothing-cocycle in both orders. Both left sides are ν_(ab) by commutativity and proof irrelevance.
- Rearrange the equality ν_a+σ_aν_b=ν_b+σ_bν_a.
- Keep this equality in the actual ambient integral carrier. To use it as equality of fractions, the intrinsic unit-support comparison, multiplicative Dirac/convolution interpretation, actual completed-group-ring comparison and denominator regularity remain required. This node neither assumes nor concludes those missing comparisons.

**Prerequisites**

- DirichletPadicLFunctions:L1/numerator-smoothing-cocycle

**Acceptance**

- Evaluation at x^k gives (b^k−1)ν_a(x^k)=(a^k−1)ν_b(x^k). At a=2,b=4,k=2 the coefficients are 15 and 3; using k+1 would give the wrong normalization.

**Sources**

- RJW-published, Proposition 4.6, printed p.137 / PDF38; equation (4-3), Definition 4.10 and Proposition 4.11, printed pp.138–139 / PDF39–40. Moment-determination method: Lemma 3.36(i), printed p.130 / PDF31. §4 collated with arXiv v2 PDF27–28.. These arithmetic cocycle/reflection identities are explicit consequences of the source’s smoothed moments and inverse weighting, decomposed here as the compatibility input for its claimed independence. The source does not state these exact formulas as separate lemmas. The proof works in the pinned ambient integral carrier and retains the actual completed-group-algebra and regularity comparisons as gaps. All-prime validity, including the integral dyadic reflection identity without averaging by 1/2, is checked by this argument.

### Evenness of the unit numerator

DirichletPadicLFunctions:L1/numerator-even

Declaration: DirichletPadic.smoothedNumerator_even

Kind: lemma. Implementation: unchecked.

For every natural a prime to p, AbstractMeasure.map ε ν_a=ν_a, with ε(z)=−z and ν_a=Jμ_a. The equality holds integrally also at p=2.

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p, D=D(Z,Z) is the existing integral abstract-measure carrier. μ_a is the existing arithmetic smoothedMeasure for a∈ℕ with p∤a. Natural a=1 is included as the existing degenerate zero case.
- Write d_c:C(Z,Z) for z↦cz and σ_c=AbstractMeasure.map d_c for the existing raw pushforward. Write ε:C(Z,Z) for z↦−z. This notation introduces no new action, carrier or formal-substitution comparison.
- J is the exact supplier inverseWeight p; ν_a is the existing DirichletPadic.smoothedNumerator, defined by ν_a=Jμ_a. The supplier inverse-weight-support gives ν_a=J(unitRestriction μ_a) and its unit support. No intrinsic unit-group measure, completed Iwasawa algebra, denominator regularity or localization is inferred.

**Construction or proof outline**

- Apply the linear J to measure-reflection. Use inverse-weight-dilation at the actual unit −1 to identify J(map ε μ_a)=−map ε(Jμ_a).
- The zero-atom term is killed directly: for any f, inverse-weight-evaluation and baseline Dirac evaluation give (Jδ₀)(f)=PadicInt.inv(0)f(0)=0. Use padic-unit-inverse-identification and the baseline Ring.inverse_zero for that last equality; extensionality gives Jδ₀=0 without consuming an unpromoted supplier API item.
- Thus ν_a−map ε ν_a=0, giving the claimed equality. No division by 2, projection (1+ε)/2 or splitting of the dyadic unit group is used. The resulting even numerator is an arithmetic parity input, not already descent in the completed Iwasawa algebra.

**Prerequisites**

- DirichletPadicLFunctions:L1/measure-reflection
- DirichletPadicLFunctions:L1/smoothed-numerator
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight-dilation
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight-evaluation
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight-support
- PadicMeasuresIwasawaAlgebras:L2/padic-unit-inverse-identification
- mathlib:AbstractMeasure.dirac_apply
- mathlib:Ring.inverse_zero

**Acceptance**

- At p=2,a=3 the unweighted reflection retains 2δ₀, but inverse weighting kills precisely that correction and gives an even numerator. Integral C₂-idempotents or dyadic pseudomeasure normalization are not asserted.

**Sources**

- RJW-published, Proposition 4.6, printed p.137 / PDF38; equation (4-3), Definition 4.10 and Proposition 4.11, printed pp.138–139 / PDF39–40. Moment-determination method: Lemma 3.36(i), printed p.130 / PDF31. §4 collated with arXiv v2 PDF27–28.. These arithmetic cocycle/reflection identities are explicit consequences of the source’s smoothed moments and inverse weighting, decomposed here as the compatibility input for its claimed independence. The source does not state these exact formulas as separate lemmas. The proof works in the pinned ambient integral carrier and retains the actual completed-group-algebra and regularity comparisons as gaps. All-prime validity, including the integral dyadic reflection identity without averaging by 1/2, is checked by this argument.

### Formal smoothed derivative values

DirichletPadicLFunctions:L1/smoothed-series-euler-values

Declaration: DirichletPadic.constantCoeff_iterate_mahler_smoothedSeries

Kind: lemma. Implementation: unchecked.

For a natural a with unit image in a commutative ℚ-algebra R and every k≥0, constantCoeff(∂^[k] F_a)=algebraMap ℚ R ((1−a^(k+1))B_(k+1)/(k+1)).

**Hypotheses**

- F_a is the existing smoothedSeries, with its specified unit certificate. The operator ∂ is the imported PowerSeries.mahlerDerivation=(1+T)d/dT, not ordinary formal differentiation. Write c_(a,k)=constantCoeff(∂^[k]F_a) over ℚ; this is notation for an expression, not a new scalar or series carrier. The actual real kernel is h_a=smoothedMellinKernel(a), g_a is its complex inclusion, and L_a is the existing normalizedMellinContinuation(g_a).
- R is a commutative ring with a specified ℚ-algebra structure; its image of a is a unit.

**Construction or proof outline**

- Apply PadicMeasuresIwasawaAlgebras:L2/exp-coefficient to the actual smoothedSeries. It identifies its iterated Mahler-derivation constant with k! times coefficient k after the formal substitution exp−1.
- Substitute the existing Dirichlet series-exp-coefficients identity. Both sides use the same smoothedSeries and unit certificate. The proof is valid for commutative ℚ-algebras with zero divisors and includes k=0.
- At R=ℚ the algebra map is the identity, giving c_(a,k) as the displayed rational Bernoulli value. No new formal chain rule or Bernoulli generating series is planned.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-series
- DirichletPadicLFunctions:L1/series-exp-coefficients
- PadicMeasuresIwasawaAlgebras:L2/exp-coefficient

**Acceptance**

- Keep the k! normalization in the imported coefficient formula and the ordinary convention B_1=−1/2. The expression ∂^[k] means repeated application, not the kth power of a series.

**Tests**

- SuggestedSmoothedJetTests.one_parameter: For a=1 and every k, c_(1,k)=0.
- SuggestedSmoothedJetTests.two_third: c_(2,3)=1/8, whereas coefficient3(F_2(exp−1))=1/48.
- SuggestedSmoothedJetTests.three_first: c_(3,1)=−2/3; its image in ℚ₂ is integral.

**Sources**

- RJW-published, Lemma4.3 and equation(4-1), printed136/PDF37, together with Proposition4.6, printed137/PDF38; full surrounding134–139 read27 September2026.. This compares actual real origin derivatives, the formal smoothed-series operator and the arithmetic moment through the same rational value. The generic formal exponential conjugacy and moment theorem are imported from their PMIA owner. Equality of all origin derivatives realizes the displayed analytic/formal comparison without asserting global convergence of a formal series or an embedding from real/complex numbers into a p-adic field. Existing E1–E3 normalization/domain corrections remain in force.

### Arithmetic and formal smoothing moments

DirichletPadicLFunctions:L1/smoothed-measure-formal-values

Declaration: DirichletPadic.smoothedMeasure_moment_eq_formal

Kind: comparison. Implementation: unchecked.

For prime p, natural a with p∤a and rational unit certificate, and every k≥0, the image in ℚ_p of μ_a(x↦x^k) equals algebraMap ℚ ℚ_p c_(a,k).

**Hypotheses**

- F_a is the existing smoothedSeries, with its specified unit certificate. The operator ∂ is the imported PowerSeries.mahlerDerivation=(1+T)d/dT, not ordinary formal differentiation. Write c_(a,k)=constantCoeff(∂^[k]F_a) over ℚ; this is notation for an expression, not a new scalar or series carrier. The actual real kernel is h_a=smoothedMellinKernel(a), g_a is its complex inclusion, and L_a is the existing normalizedMellinContinuation(g_a).
- p is prime, including2; a,k are natural; p does not divide a. The measure μ_a remains the actual integral ℤ_p-valued smoothedMeasure. A rational unit certificate is supplied for F_a over ℚ.

**Construction or proof outline**

- The existing measure-ordinary-moment theorem expresses the embedded evaluated moment as the image of the rational smoothed Bernoulli value.
- Specialize smoothed-series-euler-values to R=ℚ and replace that rational value by c_(a,k). The rational-to-p-adic algebra map is the only scalar map used here.
- Together with the two preceding comparisons, the same rational formal constant now gives actual real derivatives, signed complex continued values and integral measure moments. No map ℝ→ℚ_p or ℂ→ℚ_p and no scalar-extension construction for the measure is used.

**Prerequisites**

- DirichletPadicLFunctions:L1/measure-ordinary-moment
- DirichletPadicLFunctions:L1/smoothed-series-euler-values

**Acceptance**

- The evaluated integral value is embedded after evaluation; the measure itself stays integral. The p=2,a=3,k=1 example gives−2/3 without inverting2 in ℤ₂.

**Tests**

- SuggestedSmoothedJetTests.dyadic_common_value: At p=2,a=3,k=1 the embedded ordinary moment and the image of c_(3,1) both equal−2/3 in ℚ₂.

**Sources**

- RJW-published, Lemma4.3 and equation(4-1), printed136/PDF37, together with Proposition4.6, printed137/PDF38; full surrounding134–139 read27 September2026.. This compares actual real origin derivatives, the formal smoothed-series operator and the arithmetic moment through the same rational value. The generic formal exponential conjugacy and moment theorem are imported from their PMIA owner. Equality of all origin derivatives realizes the displayed analytic/formal comparison without asserting global convergence of a formal series or an embedding from real/complex numbers into a p-adic field. Existing E1–E3 normalization/domain corrections remain in force.

### The extended smoothing Amice series

DirichletPadicLFunctions:L1/smoothed-extension-amice

Declaration: DirichletPadic.amice_extend_smoothedMeasure

Kind: lemma. Implementation: unchecked.

For an eligible coefficient ring R, the Amice transform of E_R(μ_a) is the actual smoothedSeries F_a over R.

**Hypotheses**

- p is prime, including2; a is a natural number with p not dividing a. Let Z=ℤ_p, Q=ℚ_p, μ_a be smoothedMeasure, ρ_a be the ambient unitSmoothedMeasure and ν_a be smoothedNumerator. These are the existing integral measures on Z. E_R denotes the exact imported AbstractMeasure.extendIntegralCoefficients into D(Z,R), not a newly defined measure or operator.
- R is a complete ultrametric normed commutative ring with an algebra structure over Z and bounded Z-scalar multiplication. A unit certificate for the image of a in R is supplied. The hypotheses are exactly those of the imported extension and general Amice injectivity.

**Construction or proof outline**

- Apply the imported coefficient-extension-amice theorem to the actual μ_a. It gives the coefficient image of its integral Amice series.
- Use measure-amice over Z, obtaining the required integral unit certificate from p∤a through the native norm/unit criteria. Its integral Amice series is the actual F_a over Z.
- Apply series-coefficient-map for the algebra map Z→R. The transported unit certificate and the supplied certificate give the same series by proof irrelevance. No R-valued inverse Amice equivalence is assumed.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-measure
- DirichletPadicLFunctions:L1/measure-amice
- DirichletPadicLFunctions:L1/series-coefficient-map
- PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-amice
- mathlib:Nat.Prime.coprime_iff_not_dvd
- mathlib:PadicInt.norm_natCast_eq_one_iff
- mathlib:PadicInt.isUnit_iff
- mathlib:IsUnit.map

**Acceptance**

- This is the Amice series of the actual coefficient-extended measure. The coefficientwise series identity alone was not previously a construction of that measure.

**Tests**

- SuggestedArithmeticExtensionTests.one_parameter: At p=3,a=1, E_Q(μ_1)=0.
- SuggestedArithmeticExtensionTests.two_amice_coefficients: At p=3,a=2, the extended Amice series has constant coefficient1/2 and linear coefficient−1/4 in ℚ₃.

**Sources**

- RJW-published, Proposition4.4, Definition4.5 and Proposition4.6, printed137/PDF38; Proposition4.8 and equation(4-3), printed138/PDF39. Full surrounding134–139 previously read27 September2026.. Worker coefficient-compatibility specialization of the source integral arithmetic series, measure and moment formulas. The analytic coefficient-extension construction and its norm/topology assumptions are imported through exact PMIA supplier nodes. The paper does not separately state these transport/descent declarations. Integral evaluation and actual extended-measure evaluation are distinguished; the receiver-ring and Q_p-only descent boundaries are explicit.

### Uniqueness of the extended smoothing measure

DirichletPadicLFunctions:L1/smoothed-extension-unique

Declaration: DirichletPadic.smoothedMeasure_extension_unique

Kind: lemma. Implementation: unchecked.

If η∈D(Z,R) has Amice transform F_a over an eligible R, then η=E_R(μ_a).

**Hypotheses**

- p is prime, including2; a is a natural number with p not dividing a. Let Z=ℤ_p, Q=ℚ_p, μ_a be smoothedMeasure, ρ_a be the ambient unitSmoothedMeasure and ν_a be smoothedNumerator. These are the existing integral measures on Z. E_R denotes the exact imported AbstractMeasure.extendIntegralCoefficients into D(Z,R), not a newly defined measure or operator.
- R is a complete ultrametric normed commutative ring with an algebra structure over Z and bounded Z-scalar multiplication. A unit certificate for the image of a in R is supplied. The hypotheses are exactly those of the imported extension and general Amice injectivity.

**Construction or proof outline**

- The hypothesis and smoothed-extension-amice identify the Amice transforms of η and E_R(μ_a).
- Apply pinned AbstractMeasure.injective_amiceTransform under the same complete ultrametric ring and bounded-scalar hypotheses. This uses injectivity, not surjectivity onto arbitrary R[[T]].

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-extension-amice
- mathlib:AbstractMeasure.injective_amiceTransform

**Acceptance**

- All receiver hypotheses are retained. No boundedness assertion for arbitrary R-valued formal series is inferred.

**Sources**

- RJW-published, Proposition4.4, Definition4.5 and Proposition4.6, printed137/PDF38; Proposition4.8 and equation(4-3), printed138/PDF39. Full surrounding134–139 previously read27 September2026.. Worker coefficient-compatibility specialization of the source integral arithmetic series, measure and moment formulas. The analytic coefficient-extension construction and its norm/topology assumptions are imported through exact PMIA supplier nodes. The paper does not separately state these transport/descent declarations. Integral evaluation and actual extended-measure evaluation are distinguished; the receiver-ring and Q_p-only descent boundaries are explicit.

### Integral descent of the extended smoothing measure

DirichletPadicLFunctions:L1/smoothed-extension-integral-descent

Declaration: DirichletPadic.smoothedMeasure_extension_integral_descent

Kind: theorem. Implementation: unchecked.

For η∈D(Z,Q) with Amice transform F_a over Q, there exists exactly one integral measure λ∈D(Z,Z) with E_Q(λ)=η; it is μ_a.

**Hypotheses**

- p is prime, including2; a is a natural number with p not dividing a. Let Z=ℤ_p, Q=ℚ_p, μ_a be smoothedMeasure, ρ_a be the ambient unitSmoothedMeasure and ν_a be smoothedNumerator. These are the existing integral measures on Z. E_R denotes the exact imported AbstractMeasure.extendIntegralCoefficients into D(Z,R), not a newly defined measure or operator.
- The target is specifically Q=ℚ_p with its canonical Z-algebra structure and bounded scalar action; a unit certificate in Q is supplied.

**Construction or proof outline**

- Specialize smoothed-extension-unique to Q. It identifies η with the extension of the actual integral μ_a, supplying existence with that explicit witness.
- Apply the imported rational-integral-extension-injective theorem to any two integral lifts. This proves uniqueness in the actual integral carrier.
- The result descends the whole arithmetic measure, not only its listed moments or formal coefficients. It introduces no norm or topology on the integral carrier.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-extension-unique
- PadicMeasuresIwasawaAlgebras:L2/rational-integral-extension-injective

**Acceptance**

- This is Q_p descent of the particular arithmetic smoothing measure. Descent from an arbitrary coefficient field and scalar extension on an arbitrary profinite domain are not asserted.

**Sources**

- RJW-published, Proposition4.4, Definition4.5 and Proposition4.6, printed137/PDF38; Proposition4.8 and equation(4-3), printed138/PDF39. Full surrounding134–139 previously read27 September2026.. Worker coefficient-compatibility specialization of the source integral arithmetic series, measure and moment formulas. The analytic coefficient-extension construction and its norm/topology assumptions are imported through exact PMIA supplier nodes. The paper does not separately state these transport/descent declarations. Integral evaluation and actual extended-measure evaluation are distinguished; the receiver-ring and Q_p-only descent boundaries are explicit.

### Moments of the extended smoothing measure

DirichletPadicLFunctions:L1/smoothed-extension-moments

Declaration: DirichletPadic.extend_smoothedMeasure_moment

Kind: theorem. Implementation: unchecked.

For every k≥0, E_Q(μ_a) applied to x↦(x:Q)^k equals algebraMap ℚ Q ((1−a^(k+1))B_(k+1)/(k+1)).

**Hypotheses**

- p is prime, including2; a is a natural number with p not dividing a. Let Z=ℤ_p, Q=ℚ_p, μ_a be smoothedMeasure, ρ_a be the ambient unitSmoothedMeasure and ν_a be smoothedNumerator. These are the existing integral measures on Z. E_R denotes the exact imported AbstractMeasure.extendIntegralCoefficients into D(Z,R), not a newly defined measure or operator.
- The target is Q=ℚ_p with canonical Z-algebra structure and bounded scalar action.

**Construction or proof outline**

- Write the Q-valued monomial as the integral continuous monomial (id_Z)^k acting on the constant function1 by scalar multiplication. Its pointwise value is exactly the kth power of the included input.
- Apply the exact coefficient-extension-test-function supplier. This identifies the actual extended measure value with the canonical image of the integral μ_a moment.
- Use native PadicInt.algebraMap_apply to identify that image with the existing subtype inclusion, then substitute measure-ordinary-moment.

**Prerequisites**

- DirichletPadicLFunctions:L1/measure-ordinary-moment
- PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-test-function
- mathlib:PadicInt.algebraMap_apply

**Acceptance**

- The left side is evaluation of the actual Q_p-valued measure on a Q_p-valued continuous test, not just a renamed integral value. The integral formula includes k=0 and p=2.

**Tests**

- SuggestedArithmeticExtensionTests.dyadic_first: At p=2,a=3, E_Q(μ_3)(x)=−2/3 in ℚ₂.

**Sources**

- RJW-published, Proposition4.4, Definition4.5 and Proposition4.6, printed137/PDF38; Proposition4.8 and equation(4-3), printed138/PDF39. Full surrounding134–139 previously read27 September2026.. Worker coefficient-compatibility specialization of the source integral arithmetic series, measure and moment formulas. The analytic coefficient-extension construction and its norm/topology assumptions are imported through exact PMIA supplier nodes. The paper does not separately state these transport/descent declarations. Integral evaluation and actual extended-measure evaluation are distinguished; the receiver-ring and Q_p-only descent boundaries are explicit.

### Moments of the extended unit smoothing measure

DirichletPadicLFunctions:L1/unit-smoothed-extension-moments

Declaration: DirichletPadic.extend_unitSmoothedMeasure_moment

Kind: theorem. Implementation: unchecked.

For every k≥0, E_Q(ρ_a)(x↦(x:Q)^k)=algebraMap ℚ Q ((1−p^k)(1−a^(k+1))B_(k+1)/(k+1)).

**Hypotheses**

- p is prime, including2; a is a natural number with p not dividing a. Let Z=ℤ_p, Q=ℚ_p, μ_a be smoothedMeasure, ρ_a be the ambient unitSmoothedMeasure and ν_a be smoothedNumerator. These are the existing integral measures on Z. E_R denotes the exact imported AbstractMeasure.extendIntegralCoefficients into D(Z,R), not a newly defined measure or operator.
- The target is Q=ℚ_p with canonical Z-algebra structure and bounded scalar action. The input ρ_a is the existing unit-supported measure on the ambient domain Z, not a measure whose domain has been silently changed to Z units.

**Construction or proof outline**

- Apply coefficient-extension-test-function to the actual ambient unitSmoothedMeasure and the same integral monomial image.
- Rewrite the canonical coefficient map as inclusion and apply unit-smoothed-moment. At k=0 the Euler factor is zero, so the extended measure still has zero mass.

**Prerequisites**

- DirichletPadicLFunctions:L1/unit-smoothed-measure
- DirichletPadicLFunctions:L1/unit-smoothed-moment
- PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-test-function
- mathlib:PadicInt.algebraMap_apply

**Acceptance**

- The Euler exponent is k. Intrinsic unit-domain/completed-algebra comparisons remain separate; this statement keeps the existing ambient carrier.

**Tests**

- SuggestedArithmeticExtensionTests.dyadic_unit_first: At p=2,a=3, E_Q(ρ_3)(x)=+2/3 in ℚ₂.

**Sources**

- RJW-published, Proposition4.4, Definition4.5 and Proposition4.6, printed137/PDF38; Proposition4.8 and equation(4-3), printed138/PDF39. Full surrounding134–139 previously read27 September2026.. Worker coefficient-compatibility specialization of the source integral arithmetic series, measure and moment formulas. The analytic coefficient-extension construction and its norm/topology assumptions are imported through exact PMIA supplier nodes. The paper does not separately state these transport/descent declarations. Integral evaluation and actual extended-measure evaluation are distinguished; the receiver-ring and Q_p-only descent boundaries are explicit.

### Moments of the extended arithmetic numerator

DirichletPadicLFunctions:L1/smoothed-numerator-extension-moments

Declaration: DirichletPadic.extend_smoothedNumerator_moment

Kind: theorem. Implementation: unchecked.

For every k≥1, E_Q(ν_a)(x↦(x:Q)^k)=algebraMap ℚ Q ((1−p^(k−1))(1−a^k)B_k/k).

**Hypotheses**

- p is prime, including2; a is a natural number with p not dividing a. Let Z=ℤ_p, Q=ℚ_p, μ_a be smoothedMeasure, ρ_a be the ambient unitSmoothedMeasure and ν_a be smoothedNumerator. These are the existing integral measures on Z. E_R denotes the exact imported AbstractMeasure.extendIntegralCoefficients into D(Z,R), not a newly defined measure or operator.
- The target is Q=ℚ_p with canonical Z-algebra structure and bounded scalar action. The moment exponent k is a natural number at least1.

**Construction or proof outline**

- Apply coefficient-extension-test-function to the actual smoothedNumerator and the integral kth monomial. Identify its coefficient map with inclusion.
- Apply numerator-moment with the retained hypothesis k≥1. The shifted Euler and smoothing factors remain p^(k−1) and a^k.
- At k=1 the zero Euler factor gives zero. This boundary is included without dividing by a vanished Euler factor and without extending the formula to k=0.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-numerator
- DirichletPadicLFunctions:L1/numerator-moment
- PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-test-function
- mathlib:PadicInt.algebraMap_apply

**Acceptance**

- The k≥1 restriction is essential. The p=2,a=3,k=2 value is+2/3; no inverse of2 in the integral coefficient ring is used.

**Tests**

- SuggestedArithmeticExtensionTests.numerator_endpoint: At p=3,a=2, E_Q(ν_2)(x)=0.
- SuggestedArithmeticExtensionTests.dyadic_numerator_second: At p=2,a=3, E_Q(ν_3)(x²)=+2/3 in ℚ₂.

**Sources**

- RJW-published, Proposition4.4, Definition4.5 and Proposition4.6, printed137/PDF38; Proposition4.8 and equation(4-3), printed138/PDF39. Full surrounding134–139 previously read27 September2026.. Worker coefficient-compatibility specialization of the source integral arithmetic series, measure and moment formulas. The analytic coefficient-extension construction and its norm/topology assumptions are imported through exact PMIA supplier nodes. The paper does not separately state these transport/descent declarations. Integral evaluation and actual extended-measure evaluation are distinguished; the receiver-ring and Q_p-only descent boundaries are explicit.

### Arithmetic numerator on the unit group

DirichletPadicLFunctions:L1/intrinsic-numerator

Declaration: DirichletPadic.intrinsicSmoothedNumerator

Kind: construction. Implementation: unchecked.

Construct λ_a=intrinsicSmoothedNumerator p a := r_Z(ν_a) in D(U,Z). This is the actual intrinsic restriction of the inverse-weighted arithmetic measure.

**Hypotheses**

- p is any prime, including 2. Put Z=ℤ_p and U=Zˣ with its native topology; D(X,R) is the existing AbstractMeasure continuous dual. The natural smoothing parameter a satisfies p∤a, with a=1 retained. Let ν_a be the existing ambient smoothedNumerator, r_R the imported intrinsic restriction, j_R native pushforward along Units.val and E_R the imported ambient unit projector.
- On U, ∗ is the exact PMIA multiplicative convolution: (α∗β)(f)=α(u↦β(v↦f(uv))), with δ_1 as identity. No additive-ambient convolution, completed-algebra comparison, localization or regularity is inferred. The native unit group is compact and locally compact by the pinned instances.

**Construction or proof outline**

- Apply the existing PMIA intrinsic-unit-restriction linear map to the actual ν_a. The resulting carrier is the native units type U, with no new measure, topology or inverse-weight operator.
- The zero case a=1 follows from the existing ν_1=0 API and linearity of r_Z. The inclusion comparison and moment formulas are proved in the promoted nodes below.
- For the uniqueness API, apply r_Z to j_Zη=ν_a and use the exact supplier retraction r_Zj_Z=id. Its right side is the defining λ_a. This characterizes the actual unit measure without assuming an inverse for every ambient measure.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-numerator
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-section

**Acceptance**

- λ_a is on U, while ν_a is on Z. The two are compared by j_Z, not treated as definitionally equal.

**API**

- DirichletPadic.intrinsicSmoothedNumerator_eq_restrict: λ_a=r_Zν_a.
- DirichletPadic.map_val_intrinsicSmoothedNumerator: j_Zλ_a=ν_a; promoted to intrinsic-numerator-inclusion.
- DirichletPadic.intrinsicSmoothedNumerator_unique: If η∈D(U,Z) satisfies j_Zη=ν_a, then η=λ_a.
- DirichletPadic.intrinsicSmoothedNumerator_one: λ_1=0.
- DirichletPadic.intrinsicSmoothedNumerator_moment: For k≥1 the image of λ_a(u↦u^k) in ℚ_p is (1−p^(k−1))(1−a^k)B_k/k; promoted.
- DirichletPadic.map_val_dirac_mul_intrinsicSmoothedNumerator: j_Z(δ_u∗λ_a)=σ_uν_a for every u∈U, with σ_u the ambient multiplicative dilation pushforward; promoted.
- DirichletPadic.intrinsicSmoothedNumerator_mul: λ_(ab)=λ_a+δ_a∗λ_b for natural a,b prime to p, with their actual unit lifts; promoted.
- DirichletPadic.intrinsicSmoothedNumerator_cross: (δ_b−δ_1)∗λ_a=(δ_a−δ_1)∗λ_b with the actual unit lifts; promoted.
- DirichletPadic.intrinsicSmoothedNumerator_even: δ_(−1)∗λ_a=λ_a, including p=2; promoted.
- DirichletPadic.map_val_extend_intrinsicSmoothedNumerator: For eligible R, j_R(I_U,Rλ_a)=I_Rν_a; promoted.
- DirichletPadic.extend_intrinsicSmoothedNumerator_moment: The actual ℚ_p-valued extension of λ_a has the same Bernoulli moments on coefficient-valued tests for k≥1; promoted.

**Tests**

- SuggestedIntrinsicNumeratorTests.zero_parameter: At p=3, λ_1=0.
- SuggestedIntrinsicNumeratorTests.first_moment: At p=3,a=2, λ_2(u↦u)=0.
- SuggestedIntrinsicNumeratorTests.second_moment: At p=3,a=2, the image of λ_2(u↦u²) in ℚ₃ is 1/2.
- SuggestedIntrinsicNumeratorTests.dyadic_second: At p=2,a=3, the image of λ_3(u↦u²) in ℚ₂ is 2/3.
- SuggestedIntrinsicNumeratorTests.product_without_scalar: At p=3, λ_4=λ_2+δ_2∗λ_2. There is no additional scalar 2.
- SuggestedIntrinsicNumeratorTests.cross_denominator_orientation: At p=3, (δ_4−δ_1)∗λ_2=(δ_2−δ_1)∗λ_4. Their second moments are respectively 15·(1/2) and 3·(5/2).
- SuggestedIntrinsicNumeratorTests.dyadic_even: At p=2,a=3, δ_(−1)∗λ_3=λ_3 integrally.
- SuggestedIntrinsicNumeratorTests.dyadic_extended_second: At p=2,a=3, the actual ℚ₂-valued unit-domain extension evaluated on u↦(u:ℚ₂)² is 2/3, with the supplier bounded-scalar hypothesis retained.

**Uses**

- RJW equation (4-3) and Definitions 4.9–4.10: Places the actual inverse-weighted arithmetic numerator on the multiplicative unit-group measure carrier used before division by θ_a.
- RJW Proposition 4.11; DirichletPadicLFunctions:L1 smoothing independence and parity: Supplies the integral convolution numerator identities needed when the actual completed-algebra comparison and regularity become available.
- DirichletPadicLFunctions:L2–L3 and ColemanPowerSeries:L2 coefficient comparisons: Compares the actual intrinsic arithmetic measure and its coefficient extension with the ambient numerator without changing carriers implicitly.

**Sources**

- RJW-published, Remarks 3.31 and 3.33, §3.5.5 and equation (3-10), printed 127–129 / PDF28–30; equations (4-2)–(4-3), Definitions 4.9–4.10 and Proposition 4.11 with proof, printed 138–139 / PDF39–40.. Worker decomposition of the source intrinsic/ambient identification and multiplicative unit action, applied to the existing arithmetic numerator. The cocycle and cross-smoothing identities are transported from the already planned ambient arithmetic identities; the source does not state these exact adapters separately. All-prime integral statements retain p=2 without averaging by 1/2. The source completed-algebra and denominator assertions remain separate obligations.

### Inclusion of the intrinsic arithmetic numerator

DirichletPadicLFunctions:L1/intrinsic-numerator-inclusion

Declaration: DirichletPadic.map_val_intrinsicSmoothedNumerator

Kind: comparison. Implementation: unchecked.

j_Zλ_a=ν_a in D(Z,Z).

**Hypotheses**

- p is any prime, including 2. Put Z=ℤ_p and U=Zˣ with its native topology; D(X,R) is the existing AbstractMeasure continuous dual. The natural smoothing parameter a satisfies p∤a, with a=1 retained. Let ν_a be the existing ambient smoothedNumerator, r_R the imported intrinsic restriction, j_R native pushforward along Units.val and E_R the imported ambient unit projector.
- On U, ∗ is the exact PMIA multiplicative convolution: (α∗β)(f)=α(u↦β(v↦f(uv))), with δ_1 as identity. No additive-ambient convolution, completed-algebra comparison, localization or regularity is inferred. The native unit group is compact and locally compact by the pinned instances.

**Construction or proof outline**

- Unfold λ_a=r_Zν_a and use the exact imported intrinsic-unit-extension-projector identity j_Zr_Z=E_Z.
- Apply the existing numerator-support theorem E_Zν_a=ν_a. This proves the equality of actual ambient measures, hence equality on every continuous test.

**Prerequisites**

- DirichletPadicLFunctions:L1/intrinsic-numerator
- DirichletPadicLFunctions:L1/numerator-support
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-extension-projector

**Acceptance**

- The support theorem is necessary: for an arbitrary ambient measure j_Zr_Z recovers its unit projector, not the whole measure.

**Sources**

- RJW-published, Remarks 3.31 and 3.33, §3.5.5 and equation (3-10), printed 127–129 / PDF28–30; equations (4-2)–(4-3), Definitions 4.9–4.10 and Proposition 4.11 with proof, printed 138–139 / PDF39–40.. Worker decomposition of the source intrinsic/ambient identification and multiplicative unit action, applied to the existing arithmetic numerator. The cocycle and cross-smoothing identities are transported from the already planned ambient arithmetic identities; the source does not state these exact adapters separately. All-prime integral statements retain p=2 without averaging by 1/2. The source completed-algebra and denominator assertions remain separate obligations.

### Bernoulli moments on the unit group

DirichletPadicLFunctions:L1/intrinsic-numerator-moment

Declaration: DirichletPadic.intrinsicSmoothedNumerator_moment

Kind: theorem. Implementation: unchecked.

For every natural k≥1, the image of λ_a(u↦(u:Z)^k) in ℚ_p is (1−p^(k−1))(1−a^k)B_k/k.

**Hypotheses**

- p is any prime, including 2. Put Z=ℤ_p and U=Zˣ with its native topology; D(X,R) is the existing AbstractMeasure continuous dual. The natural smoothing parameter a satisfies p∤a, with a=1 retained. Let ν_a be the existing ambient smoothedNumerator, r_R the imported intrinsic restriction, j_R native pushforward along Units.val and E_R the imported ambient unit projector.
- On U, ∗ is the exact PMIA multiplicative convolution: (α∗β)(f)=α(u↦β(v↦f(uv))), with δ_1 as identity. No additive-ambient convolution, completed-algebra comparison, localization or regularity is inferred. The native unit group is compact and locally compact by the pinned instances.

**Construction or proof outline**

- Evaluate intrinsic-numerator-inclusion on the ambient monomial x↦x^k. Native map_apply identifies the included left side with λ_a evaluated on the restriction u↦(u:Z)^k.
- Apply the existing numerator-moment theorem at k≥1. The natural-power continuous test is formed from the native continuous units value map.
- Keep the k=1 endpoint: its Euler factor is 1−p^0=0. No denominator is cancelled there, and the theorem does not extend to k=0.

**Prerequisites**

- DirichletPadicLFunctions:L1/intrinsic-numerator-inclusion
- DirichletPadicLFunctions:L1/numerator-moment
- mathlib:AbstractMeasure.map_apply
- mathlib:Units.continuous_val

**Acceptance**

- At p=3,a=2,k=2 the value is 1/2; at p=2,a=3,k=2 it is 2/3. The first moment vanishes for every admissible parameter.

**Sources**

- RJW-published, Remarks 3.31 and 3.33, §3.5.5 and equation (3-10), printed 127–129 / PDF28–30; equations (4-2)–(4-3), Definitions 4.9–4.10 and Proposition 4.11 with proof, printed 138–139 / PDF39–40.. Worker decomposition of the source intrinsic/ambient identification and multiplicative unit action, applied to the existing arithmetic numerator. The cocycle and cross-smoothing identities are transported from the already planned ambient arithmetic identities; the source does not state these exact adapters separately. All-prime integral statements retain p=2 without averaging by 1/2. The source completed-algebra and denominator assertions remain separate obligations.

### Dirac action on the arithmetic numerator

DirichletPadicLFunctions:L1/intrinsic-numerator-dirac

Declaration: DirichletPadic.map_val_dirac_mul_intrinsicSmoothedNumerator

Kind: lemma. Implementation: unchecked.

For every u∈U, j_Z(δ_u∗λ_a)=σ_uν_a, where σ_u is native ambient pushforward along z↦(u:Z)z.

**Hypotheses**

- p is any prime, including 2. Put Z=ℤ_p and U=Zˣ with its native topology; D(X,R) is the existing AbstractMeasure continuous dual. The natural smoothing parameter a satisfies p∤a, with a=1 retained. Let ν_a be the existing ambient smoothedNumerator, r_R the imported intrinsic restriction, j_R native pushforward along Units.val and E_R the imported ambient unit projector.
- On U, ∗ is the exact PMIA multiplicative convolution: (α∗β)(f)=α(u↦β(v↦f(uv))), with δ_1 as identity. No additive-ambient convolution, completed-algebra comparison, localization or regularity is inferred. The native unit group is compact and locally compact by the pinned instances.

**Construction or proof outline**

- Use the exact supplier convolution evaluation and right-convolution evaluation at a Dirac mass. On a unit-domain test f the result is λ_a(v↦f(uv)); native Dirac evaluation performs the outer integral.
- Apply native map_apply for j_Z. Since the value of uv is (u:Z)(v:Z), this test equals the pullback of the ambient dilation. Extensionality of continuous maps identifies these functions.
- Native map_map identifies the two composed pushforwards. Replace j_Zλ_a with ν_a using intrinsic-numerator-inclusion. The direction is multiplication by u, not its inverse.

**Prerequisites**

- DirichletPadicLFunctions:L1/intrinsic-numerator-inclusion
- PadicMeasuresIwasawaAlgebras:L1/convolution-evaluation
- PadicMeasuresIwasawaAlgebras:L1/right-convolution-evaluation
- mathlib:AbstractMeasure.dirac_apply
- mathlib:AbstractMeasure.map_apply
- mathlib:AbstractMeasure.map_map
- mathlib:Units.continuous_val
- mathlib:PadicInt.compactSpace

**Acceptance**

- On the kth monomial this action contributes u^k, not u^(k+1) or u^(−k). It compares one actual arithmetic action; it does not assert that j_Z preserves additive convolution.

**Sources**

- RJW-published, Remarks 3.31 and 3.33, §3.5.5 and equation (3-10), printed 127–129 / PDF28–30; equations (4-2)–(4-3), Definitions 4.9–4.10 and Proposition 4.11 with proof, printed 138–139 / PDF39–40.. Worker decomposition of the source intrinsic/ambient identification and multiplicative unit action, applied to the existing arithmetic numerator. The cocycle and cross-smoothing identities are transported from the already planned ambient arithmetic identities; the source does not state these exact adapters separately. All-prime integral statements retain p=2 without averaging by 1/2. The source completed-algebra and denominator assertions remain separate obligations.

### Multiplicative smoothing cocycle on units

DirichletPadicLFunctions:L1/intrinsic-numerator-cocycle

Declaration: DirichletPadic.intrinsicSmoothedNumerator_mul

Kind: lemma. Implementation: unchecked.

For natural a,b prime to p, λ_(ab)=λ_a+δ_u∗λ_b, where u∈U has value a in Z.

**Hypotheses**

- p is any prime, including 2. Put Z=ℤ_p and U=Zˣ with its native topology; D(X,R) is the existing AbstractMeasure continuous dual. The natural smoothing parameter a satisfies p∤a, with a=1 retained. Let ν_a be the existing ambient smoothedNumerator, r_R the imported intrinsic restriction, j_R native pushforward along Units.val and E_R the imported ambient unit projector.
- On U, ∗ is the exact PMIA multiplicative convolution: (α∗β)(f)=α(u↦β(v↦f(uv))), with δ_1 as identity. No additive-ambient convolution, completed-algebra comparison, localization or regularity is inferred. The native unit group is compact and locally compact by the pinned instances.
- b is natural with p∤b and p∤ab; u∈U has value (a:Z). Such a unit exists by the previously recorded native p-adic unit criteria; its value specifies it uniquely.

**Construction or proof outline**

- Apply the injectivity of j_Z from the imported intrinsic-unit-restriction-section. Use its native linear-map structure to carry the sum through inclusion.
- Use intrinsic-numerator-inclusion for λ_(ab) and λ_a, and intrinsic-numerator-dirac for δ_u∗λ_b. The specified value u=a identifies the dilation map.
- The resulting equality is exactly the existing ambient numerator-smoothing-cocycle. Its inverse weighting has already cancelled the scalar a, so none is introduced here.

**Prerequisites**

- DirichletPadicLFunctions:L1/intrinsic-numerator-inclusion
- DirichletPadicLFunctions:L1/intrinsic-numerator-dirac
- DirichletPadicLFunctions:L1/numerator-smoothing-cocycle
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-section

**Acceptance**

- The suggested signature retains explicit p∤ab and the bundled unit/value equality. Native prime/unit criteria already recorded in the packet supply these from p∤a and p∤b. At p=3,a=b=2 the missing scalar is detected by the second moment.

**Sources**

- RJW-published, Remarks 3.31 and 3.33, §3.5.5 and equation (3-10), printed 127–129 / PDF28–30; equations (4-2)–(4-3), Definitions 4.9–4.10 and Proposition 4.11 with proof, printed 138–139 / PDF39–40.. Worker decomposition of the source intrinsic/ambient identification and multiplicative unit action, applied to the existing arithmetic numerator. The cocycle and cross-smoothing identities are transported from the already planned ambient arithmetic identities; the source does not state these exact adapters separately. All-prime integral statements retain p=2 without averaging by 1/2. The source completed-algebra and denominator assertions remain separate obligations.

### Cross-smoothing in the unit measure algebra

DirichletPadicLFunctions:L1/intrinsic-numerator-cross

Declaration: DirichletPadic.intrinsicSmoothedNumerator_cross

Kind: lemma. Implementation: unchecked.

For natural a,b prime to p and their unit lifts u,v, (δ_v−δ_1)∗λ_a=(δ_u−δ_1)∗λ_b.

**Hypotheses**

- p is any prime, including 2. Put Z=ℤ_p and U=Zˣ with its native topology; D(X,R) is the existing AbstractMeasure continuous dual. The natural smoothing parameter a satisfies p∤a, with a=1 retained. Let ν_a be the existing ambient smoothedNumerator, r_R the imported intrinsic restriction, j_R native pushforward along Units.val and E_R the imported ambient unit projector.
- On U, ∗ is the exact PMIA multiplicative convolution: (α∗β)(f)=α(u↦β(v↦f(uv))), with δ_1 as identity. No additive-ambient convolution, completed-algebra comparison, localization or regularity is inferred. The native unit group is compact and locally compact by the pinned instances.
- b is natural with p∤b; u,v∈U have values a,b in Z.

**Construction or proof outline**

- Use the supplier convolution ring to distribute the products and identify δ_1 as the multiplicative identity.
- Apply injectivity of j_Z. Its linearity and intrinsic-numerator-dirac/inclusion turn the assertion into σ_bν_a−ν_a=σ_aν_b−ν_b.
- Invoke the existing ambient numerator-cross-smoothing theorem. This is an equality before any localization; it does not permit cancellation of δ_a−δ_1.

**Prerequisites**

- DirichletPadicLFunctions:L1/intrinsic-numerator-inclusion
- DirichletPadicLFunctions:L1/intrinsic-numerator-dirac
- DirichletPadicLFunctions:L1/numerator-cross-smoothing
- PadicMeasuresIwasawaAlgebras:L1/convolution-algebra
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-section

**Acceptance**

- For p=3,a=2,b=4, second moments give 15·(1/2)=3·(5/2). The denominator orientation is b acting on λ_a and a acting on λ_b.

**Sources**

- RJW-published, Remarks 3.31 and 3.33, §3.5.5 and equation (3-10), printed 127–129 / PDF28–30; equations (4-2)–(4-3), Definitions 4.9–4.10 and Proposition 4.11 with proof, printed 138–139 / PDF39–40.. Worker decomposition of the source intrinsic/ambient identification and multiplicative unit action, applied to the existing arithmetic numerator. The cocycle and cross-smoothing identities are transported from the already planned ambient arithmetic identities; the source does not state these exact adapters separately. All-prime integral statements retain p=2 without averaging by 1/2. The source completed-algebra and denominator assertions remain separate obligations.

### Even intrinsic arithmetic numerator

DirichletPadicLFunctions:L1/intrinsic-numerator-even

Declaration: DirichletPadic.intrinsicSmoothedNumerator_even

Kind: lemma. Implementation: unchecked.

δ_(−1)∗λ_a=λ_a in D(U,Z), for every prime p including 2.

**Hypotheses**

- p is any prime, including 2. Put Z=ℤ_p and U=Zˣ with its native topology; D(X,R) is the existing AbstractMeasure continuous dual. The natural smoothing parameter a satisfies p∤a, with a=1 retained. Let ν_a be the existing ambient smoothedNumerator, r_R the imported intrinsic restriction, j_R native pushforward along Units.val and E_R the imported ambient unit projector.
- On U, ∗ is the exact PMIA multiplicative convolution: (α∗β)(f)=α(u↦β(v↦f(uv))), with δ_1 as identity. No additive-ambient convolution, completed-algebra comparison, localization or regularity is inferred. The native unit group is compact and locally compact by the pinned instances.

**Construction or proof outline**

- Apply the same inclusion injectivity. Use intrinsic-numerator-dirac with the native unit −1 and intrinsic-numerator-inclusion.
- Multiplication by −1 on Z is negation. The resulting assertion is the existing ambient numerator-even theorem.
- This argument uses only integral pushforwards and convolution. It neither divides by 2 nor constructs the idempotent (1+δ_(−1))/2.

**Prerequisites**

- DirichletPadicLFunctions:L1/intrinsic-numerator-inclusion
- DirichletPadicLFunctions:L1/intrinsic-numerator-dirac
- DirichletPadicLFunctions:L1/numerator-even
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-section

**Acceptance**

- The p=2,a=3 test retains the integral unit group and its nontrivial sign element. Descent and splitting in the actual completed algebra remain separate.

**Sources**

- RJW-published, Remarks 3.31 and 3.33, §3.5.5 and equation (3-10), printed 127–129 / PDF28–30; equations (4-2)–(4-3), Definitions 4.9–4.10 and Proposition 4.11 with proof, printed 138–139 / PDF39–40.. Worker decomposition of the source intrinsic/ambient identification and multiplicative unit action, applied to the existing arithmetic numerator. The cocycle and cross-smoothing identities are transported from the already planned ambient arithmetic identities; the source does not state these exact adapters separately. All-prime integral statements retain p=2 without averaging by 1/2. The source completed-algebra and denominator assertions remain separate obligations.

### Coefficient extension of the intrinsic numerator

DirichletPadicLFunctions:L1/intrinsic-numerator-extension-inclusion

Declaration: DirichletPadic.map_val_extend_intrinsicSmoothedNumerator

Kind: comparison. Implementation: unchecked.

For every eligible R, j_R(I_U,Rλ_a)=I_Rν_a.

**Hypotheses**

- p is any prime, including 2. Put Z=ℤ_p and U=Zˣ with its native topology; D(X,R) is the existing AbstractMeasure continuous dual. The natural smoothing parameter a satisfies p∤a, with a=1 retained. Let ν_a be the existing ambient smoothedNumerator, r_R the imported intrinsic restriction, j_R native pushforward along Units.val and E_R the imported ambient unit projector.
- On U, ∗ is the exact PMIA multiplicative convolution: (α∗β)(f)=α(u↦β(v↦f(uv))), with δ_1 as identity. No additive-ambient convolution, completed-algebra comparison, localization or regularity is inferred. The native unit group is compact and locally compact by the pinned instances.
- R is a complete ultrametric normed commutative Z-algebra with bounded Z-scalar action. I_R and I_U,R are the exact imported ambient and unit-domain integral coefficient-extension maps.

**Construction or proof outline**

- Apply the exact PMIA integral-unit-extension-inclusion theorem to λ_a. Its right side is I_R(j_Zλ_a).
- Substitute intrinsic-numerator-inclusion. The result identifies actual R-valued measures on Z and retains every receiver hypothesis of the coefficient-extension supplier.

**Prerequisites**

- DirichletPadicLFunctions:L1/intrinsic-numerator-inclusion
- PadicMeasuresIwasawaAlgebras:L2/integral-unit-extension-inclusion

**Acceptance**

- This is a coefficient/inclusion square, not an algebra homomorphism into additive-ambient convolution or a completed-algebra comparison.

**Sources**

- RJW-published, Remarks 3.31 and 3.33, §3.5.5 and equation (3-10), printed 127–129 / PDF28–30; equations (4-2)–(4-3), Definitions 4.9–4.10 and Proposition 4.11 with proof, printed 138–139 / PDF39–40.. Worker decomposition of the source intrinsic/ambient identification and multiplicative unit action, applied to the existing arithmetic numerator. The cocycle and cross-smoothing identities are transported from the already planned ambient arithmetic identities; the source does not state these exact adapters separately. All-prime integral statements retain p=2 without averaging by 1/2. The source completed-algebra and denominator assertions remain separate obligations.

### Coefficient-valued numerator moments on units

DirichletPadicLFunctions:L1/intrinsic-numerator-extension-moment

Declaration: DirichletPadic.extend_intrinsicSmoothedNumerator_moment

Kind: theorem. Implementation: unchecked.

For k≥1, I_U,ℚ_p(λ_a)(u↦(u:ℚ_p)^k)=(1−p^(k−1))(1−a^k)B_k/k.

**Hypotheses**

- p is any prime, including 2. Put Z=ℤ_p and U=Zˣ with its native topology; D(X,R) is the existing AbstractMeasure continuous dual. The natural smoothing parameter a satisfies p∤a, with a=1 retained. Let ν_a be the existing ambient smoothedNumerator, r_R the imported intrinsic restriction, j_R native pushforward along Units.val and E_R the imported ambient unit projector.
- On U, ∗ is the exact PMIA multiplicative convolution: (α∗β)(f)=α(u↦β(v↦f(uv))), with δ_1 as identity. No additive-ambient convolution, completed-algebra comparison, localization or regularity is inferred. The native unit group is compact and locally compact by the pinned instances.
- Use R=ℚ_p with its canonical Z-algebra structure and bounded Z-scalar action. The exponent k is natural and at least 1.

**Construction or proof outline**

- Take the integral continuous test f(u)=(u:Z)^k. Its pointwise coefficient image is the scalar multiple f·1 of the constant ℚ_p-valued one.
- Apply the exact integral-unit-extension-test-function supplier to λ_a and f. It gives the canonical coefficient image of λ_a(f).
- Identify the canonical algebra map with the native inclusion by PadicInt.algebraMap_apply and apply intrinsic-numerator-moment. The result is evaluation of the actual extended unit-domain measure.

**Prerequisites**

- DirichletPadicLFunctions:L1/intrinsic-numerator-moment
- PadicMeasuresIwasawaAlgebras:L2/integral-unit-extension-test-function
- mathlib:PadicInt.algebraMap_apply

**Acceptance**

- At p=2,a=3,k=2 the actual ℚ₂-valued evaluation is 2/3. The k=1 value is zero and k=0 is excluded.

**Sources**

- RJW-published, Remarks 3.31 and 3.33, §3.5.5 and equation (3-10), printed 127–129 / PDF28–30; equations (4-2)–(4-3), Definitions 4.9–4.10 and Proposition 4.11 with proof, printed 138–139 / PDF39–40.. Worker decomposition of the source intrinsic/ambient identification and multiplicative unit action, applied to the existing arithmetic numerator. The cocycle and cross-smoothing identities are transported from the already planned ambient arithmetic identities; the source does not state these exact adapters separately. All-prime integral statements retain p=2 without averaging by 1/2. The source completed-algebra and denominator assertions remain separate obligations.

### Integral norm bound for the arithmetic numerator

DirichletPadicLFunctions:L1/intrinsic-numerator-norm

Declaration: DirichletPadic.norm_extend_intrinsicSmoothedNumerator

Kind: lemma. Implementation: unchecked.

The operator norm of μ_a^U is at most one.

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p, Q=ℚ_p and U=Zˣ have their native structures. The natural smoothing parameter a satisfies p∤a, with a=1 allowed. The canonical bounded Z-scalar action on Q is retained explicitly in the suggested signatures.
- λ_a is the actual intrinsicSmoothedNumerator in D(U,Z), and μ_a^U=I_U,Q(λ_a) is its imported Q-valued integral coefficient extension. For k≥1 abbreviate C_a(k)=(1−p^(k−1))(1−a^k)B_k/k and V(k)=(1−p^(k−1))B_k/k, in Q via the canonical rational embedding. These are prose abbreviations, not new carriers or a complex-to-p-adic map.

**Construction or proof outline**

- Apply the exact imported rational-unit-extension-norm identity to the actual integral λ_a. It identifies the operator norm with the supremum norm of the Q-images of the Amice coefficients of j_Zλ_a.
- The imported integral-coefficient-sequence construction produces this sequence with uniform bound ‖1_Q‖. Its construction output, including this bound, is the dependency; no unstated foreign API assumption is used.
- Use ‖1_Q‖=1. This bound is on the actual continuous dual and therefore applies to every continuous Q-valued test on U.

**Prerequisites**

- DirichletPadicLFunctions:L1/intrinsic-numerator
- PadicMeasuresIwasawaAlgebras:L2/rational-unit-extension-norm
- PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-sequence

**Acceptance**

- No norm bound for an unsmoothed pseudomeasure is asserted. At a=1 the actual measure is zero and its norm is zero.

**Tests**

- SuggestedKummerTests.zero_parameter_bound: At p=3,a=1 the operator norm is zero.

**Sources**

- RJW-published, Remark 2.18 with preceding discussion, printed 115–117 / PDF16–18; numerator and interpolation normalization in §4, printed 138–139 / PDF39–40.. Worker arithmetic repair and decomposition using the actual integral smoothed numerator. The blanket unsmoothed trivial-character congruence in Remark 2.18 fails; see consumer finding E10 and prior PMIA/E13. The norm and finite-combination statements are derived adapters, not separate source-numbered results.

### Finite combinations of Bernoulli moments

DirichletPadicLFunctions:L1/finite-smoothed-moments

Declaration: DirichletPadic.extend_intrinsicSmoothedNumerator_sum

Kind: lemma. Implementation: unchecked.

For a finite set I, coefficients c_i∈Q and natural k_i≥1 on I, μ_a^U(Σ_{i∈I} c_i u^k_i)=Σ_{i∈I} c_i C_a(k_i).

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p, Q=ℚ_p and U=Zˣ have their native structures. The natural smoothing parameter a satisfies p∤a, with a=1 allowed. The canonical bounded Z-scalar action on Q is retained explicitly in the suggested signatures.
- λ_a is the actual intrinsicSmoothedNumerator in D(U,Z), and μ_a^U=I_U,Q(λ_a) is its imported Q-valued integral coefficient extension. For k≥1 abbreviate C_a(k)=(1−p^(k−1))(1−a^k)B_k/k and V(k)=(1−p^(k−1))B_k/k, in Q via the canonical rational embedding. These are prose abbreviations, not new carriers or a complex-to-p-adic map.

**Construction or proof outline**

- Form the continuous Q-valued monomial by multiplying the integral test j^k_i by the constant one, where j is the native units value map. Its value at u is the canonical Q-image of u raised to k_i.
- Use linearity of the native AbstractMeasure continuous dual for the finite sum and scalar multiples. There is no infinite series or interchange of limits.
- Apply intrinsic-numerator-extension-moment for each i in I. The bound k_i≥1 is needed only on I; the empty sum is zero. At k_i=1 the Euler factor gives zero.

**Prerequisites**

- DirichletPadicLFunctions:L1/intrinsic-numerator-extension-moment
- mathlib:Units.continuous_val
- mathlib:AbstractMeasure

**Acceptance**

- The coefficients can be arbitrary elements of Q; they need not be integral. The first-weight and empty-set cases are explicit.

**Tests**

- SuggestedKummerTests.empty_combination: An empty finite combination evaluates to zero at p=3,a=2.
- SuggestedKummerTests.first_weight_boundary: The actual p=3,a=2 extended numerator has first moment zero.

**Sources**

- RJW-published, Remark 2.18 with preceding discussion, printed 115–117 / PDF16–18; numerator and interpolation normalization in §4, printed 138–139 / PDF39–40.. Worker arithmetic repair and decomposition using the actual integral smoothed numerator. The blanket unsmoothed trivial-character congruence in Remark 2.18 fails; see consumer finding E10 and prior PMIA/E13. The norm and finite-combination statements are derived adapters, not separate source-numbered results.

### Generalized smoothed Kummer bound

DirichletPadicLFunctions:L1/generalized-smoothed-kummer

Declaration: DirichletPadic.smoothed_kummer_sum

Kind: theorem. Implementation: unchecked.

For r≥0 and the finite data of finite-smoothed-moments, if ‖Σ_{i∈I} c_i u^k_i‖≤p^(−r) for every u∈U, then ‖Σ_{i∈I} c_i C_a(k_i)‖≤p^(−r).

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p, Q=ℚ_p and U=Zˣ have their native structures. The natural smoothing parameter a satisfies p∤a, with a=1 allowed. The canonical bounded Z-scalar action on Q is retained explicitly in the suggested signatures.
- λ_a is the actual intrinsicSmoothedNumerator in D(U,Z), and μ_a^U=I_U,Q(λ_a) is its imported Q-valued integral coefficient extension. For k≥1 abbreviate C_a(k)=(1−p^(k−1))(1−a^k)B_k/k and V(k)=(1−p^(k−1))B_k/k, in Q via the canonical rational embedding. These are prose abbreviations, not new carriers or a complex-to-p-adic map.

**Construction or proof outline**

- Let f be the continuous finite combination from finite-smoothed-moments. Its values are exactly the pointwise expression in the hypothesis.
- Since U is compact and p^(−r) is nonnegative, native ContinuousMap.norm_le gives ‖f‖≤p^(−r).
- Native ContinuousLinearMap.le_opNorm and intrinsic-numerator-norm give ‖μ_a^U(f)‖≤‖μ_a^U‖‖f‖≤‖f‖. Substitute the exact finite-moment equality.

**Prerequisites**

- DirichletPadicLFunctions:L1/finite-smoothed-moments
- DirichletPadicLFunctions:L1/intrinsic-numerator-norm
- mathlib:ContinuousMap.norm_le
- mathlib:ContinuousLinearMap.le_opNorm
- mathlib:PadicInt.compactSpace

**Acceptance**

- This is an arithmetic consequence of the actual integral measure. It does not create a second generic measure-congruence supplier. Rational coefficients may cancel pointwise; no coefficientwise integrality assumption is added.

**Sources**

- RJW-published, Remark 2.18 with preceding discussion, printed 115–117 / PDF16–18; numerator and interpolation normalization in §4, printed 138–139 / PDF39–40.. Worker arithmetic repair and decomposition using the actual integral smoothed numerator. The blanket unsmoothed trivial-character congruence in Remark 2.18 fails; see consumer finding E10 and prior PMIA/E13. The norm and finite-combination statements are derived adapters, not separate source-numbered results.

### Weight-period congruence for smoothed Bernoulli values

DirichletPadicLFunctions:L1/weight-period-smoothed-kummer

Declaration: DirichletPadic.smoothed_kummer_weight_period

Kind: theorem. Implementation: unchecked.

If r≥1, k,l≥1 and k≡l modulo p^(r−1)(p−1), then ‖C_a(k)−C_a(l)‖≤p^(−r).

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p, Q=ℚ_p and U=Zˣ have their native structures. The natural smoothing parameter a satisfies p∤a, with a=1 allowed. The canonical bounded Z-scalar action on Q is retained explicitly in the suggested signatures.
- λ_a is the actual intrinsicSmoothedNumerator in D(U,Z), and μ_a^U=I_U,Q(λ_a) is its imported Q-valued integral coefficient extension. For k≥1 abbreviate C_a(k)=(1−p^(k−1))(1−a^k)B_k/k and V(k)=(1−p^(k−1))B_k/k, in Q via the canonical rational embedding. These are prose abbreviations, not new carriers or a complex-to-p-adic map.
- The precision r is at least one; the exponents are positive naturals.

**Construction or proof outline**

- For u∈U map its unit structure by the native ring hom Z→ZMod(p^r). Euler gives the finite unit raised to φ(p^r) equal to one. Native totient_prime_pow identifies that exponent with p^(r−1)(p−1).
- Native pow_eq_pow_of_modEq shows equal kth and lth powers in the finite residue ring. Thus u^k−u^l lies in the reduction kernel, which ker_toZModPow identifies with (p^r). The native ideal/norm-ball comparison gives ‖u^k−u^l‖≤p^(−r). The inclusion in Q preserves this norm.
- Apply generalized-smoothed-kummer to the two terms with coefficients 1 and −1. This finite-unit argument includes p=2; it does not choose a topological generator of U or use logarithms.

**Prerequisites**

- DirichletPadicLFunctions:L1/generalized-smoothed-kummer
- mathlib:PadicInt.toZModPow
- mathlib:PadicInt.ker_toZModPow
- mathlib:PadicInt.norm_le_pow_iff_mem_span_pow
- mathlib:ZMod.pow_totient
- mathlib:Nat.totient_prime_pow
- mathlib:pow_eq_pow_of_modEq
- mathlib:PadicInt.norm_def

**Acceptance**

- For p=3,a=2,k=2,l=4,r=1 the difference is 15/4 and has norm 1/3. For p=2,a=3,k=2,l=4,r=2 the difference is 16/3 and has norm 1/16≤1/4.

**Tests**

- SuggestedKummerTests.smoothed_precision: At p=3,a=2,k=2,l=4 the smoothed difference is 15/4, with 3-adic norm 1/3.
- SuggestedKummerTests.dyadic_precision: At p=2,a=3,k=2,l=4 the smoothed difference is 16/3, satisfying the r=2 norm bound.

**Sources**

- RJW-published, Remark 2.18 with preceding discussion, printed 115–117 / PDF16–18; numerator and interpolation normalization in §4, printed 138–139 / PDF39–40.. Worker arithmetic repair and decomposition using the actual integral smoothed numerator. The blanket unsmoothed trivial-character congruence in Remark 2.18 fails; see consumer finding E10 and prior PMIA/E13. The norm and finite-combination statements are derived adapters, not separate source-numbered results.

### Kummer congruence with unit smoothing denominators

DirichletPadicLFunctions:L1/unit-denominator-kummer

Declaration: DirichletPadic.kummer_of_unit_smoothing

Kind: theorem. Implementation: unchecked.

Under the weight-period hypotheses, if both 1−a^k and 1−a^l are units in Z, then ‖V(k)−V(l)‖≤p^(−r).

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p, Q=ℚ_p and U=Zˣ have their native structures. The natural smoothing parameter a satisfies p∤a, with a=1 allowed. The canonical bounded Z-scalar action on Q is retained explicitly in the suggested signatures.
- λ_a is the actual intrinsicSmoothedNumerator in D(U,Z), and μ_a^U=I_U,Q(λ_a) is its imported Q-valued integral coefficient extension. For k≥1 abbreviate C_a(k)=(1−p^(k−1))(1−a^k)B_k/k and V(k)=(1−p^(k−1))B_k/k, in Q via the canonical rational embedding. These are prose abbreviations, not new carriers or a complex-to-p-adic map.
- In addition to r≥1,k,l≥1 and the period congruence, require IsUnit(1−a^k) and IsUnit(1−a^l) in Z, not merely nonzero elements of Q.

**Construction or proof outline**

- Put d=1−a^k, e=1−a^l, x=V(k), y=V(l) in Q. Their integral-unit hypotheses give ‖d‖=‖e‖=1. By commutative ring arithmetic dx=C_a(k) and ey=C_a(l), so weight-period-smoothed-kummer bounds ‖dx−ey‖.
- Apply the same finite-unit power calculation to the unique integral unit with value a, supplied by p∤a and the existing native unit criterion. It bounds ‖d−e‖ by p^(−r). Native unit monomials have norm one; evaluating the actual norm-at-most-one measure on u^l gives ‖C_a(l)‖≤1. Hence ‖y‖≤1 because ‖e‖=1.
- The exact identity d(x−y)=(dx−ey)+(e−d)y and the nonarchimedean triangle inequality bound its norm by max(p^(−r),p^(−r)·1). Dividing by d preserves the norm since d is an integral unit.
- Keep both denominator-unit assumptions in the signature. They exclude the trivial exceptional branch in the displayed counterexample. At p=2 every admissible natural a is odd, so these denominators are not units; the preceding smoothed theorem remains valid there. No blanket unsmoothed dyadic statement follows.

**Prerequisites**

- DirichletPadicLFunctions:L1/weight-period-smoothed-kummer
- DirichletPadicLFunctions:L1/intrinsic-numerator-norm
- DirichletPadicLFunctions:L1/intrinsic-numerator-extension-moment
- mathlib:PadicInt.isUnit_iff
- mathlib:PadicInt.norm_natCast_eq_one_iff
- mathlib:IsUnit.unit
- mathlib:IsUnit.unit_spec
- mathlib:PadicInt.norm_units
- mathlib:PadicInt.norm_def
- mathlib:ContinuousMap.norm_le
- mathlib:ContinuousLinearMap.le_opNorm
- mathlib:Padic.nonarchimedean
- mathlib:Padic.norm_natCast_eq_one_iff
- mathlib:Padic.norm_p

**Acceptance**

- For p=5,a=2,k=2,l=6,r=1 the denominators −3 and −63 are units; V(2)−V(6)=760/63 has norm 1/5. For p=3,k=2,l=4 the unsmoothed difference has norm 3, so the unqualified r=1 conclusion fails. These are numerical Bernoulli values, not a construction of an unsmoothed pseudomeasure.

**Tests**

- SuggestedKummerTests.unit_denominator_odd_prime: At p=5,a=2,k=2,l=6 both integral smoothing denominators are units and the unsmoothed difference has norm 1/5.
- SuggestedKummerTests.unsmoothed_negative_control: At p=3,k=2,l=4 the unsmoothed Bernoulli difference has norm 3, contradicting the unqualified bound 1/3.

**Sources**

- RJW-published, Remark 2.18 with preceding discussion, printed 115–117 / PDF16–18; numerator and interpolation normalization in §4, printed 138–139 / PDF39–40.. Worker arithmetic repair and decomposition using the actual integral smoothed numerator. The blanket unsmoothed trivial-character congruence in Remark 2.18 fails; see consumer finding E10 and prior PMIA/E13. The norm and finite-combination statements are derived adapters, not separate source-numbered results.

### Smoothing series at a p-adic unit

DirichletPadicLFunctions:L1/padic-smoothing-series

Declaration: DirichletPadic.padicSmoothedSeries

Kind: construction. Implementation: unchecked.

Define F_u=b_u·PowerSeries.invOfUnit(q_u,u) in Z[[T]] for every u∈U.

**Hypotheses**

- p is any prime, including2; Z=Z_p and U=Z^× with their native topologies. All series have integral coefficients in the existing PowerSeries Z. For u∈U, write q_u=mk(n↦Ring.choose(u,n+1)) and b_u=mk(n↦Ring.choose(u,n+2)) as local notation. These are shifted coefficients of the native binomialSeries Z u, not new series carriers or a new exponentiation operation.

**Construction or proof outline**

- The native BinomialRing instance on Z makes every coefficient integral. Ring.choose_one_right gives constantCoeff(q_u)=u, so native invOfUnit is its actual multiplicative inverse. No factorial or T is inverted in Z.
- Multiplying by q_u gives b_u; multiplying this equation by T also gives Tq_u F_u=q_u−C(u). Multiplication by the same inverse proves uniqueness among solutions of q_u F=b_u.
- The constant coefficient is choose(u,2)u⁻¹. At u=1 the numerator b_u is zero. At u=−1 native choose_neg and multichoose_one give choose(−1,n)=(−1)^n, hence b_(−1)=−q_(−1) and F_(−1)=−1.

**Prerequisites**

- mathlib:PadicInt.instBinomialRing
- mathlib:PowerSeries.binomialSeries
- mathlib:PowerSeries.binomialSeries_coeff
- mathlib:PowerSeries.mk
- mathlib:PowerSeries.coeff_mk
- mathlib:Ring.choose_one_right
- mathlib:PowerSeries.invOfUnit
- mathlib:PowerSeries.mul_invOfUnit
- mathlib:PowerSeries.constantCoeff_invOfUnit
- mathlib:Ring.choose_neg'
- mathlib:Ring.multichoose_one
- mathlib:Ring.choose_natCast

**Acceptance**

- There is no choice of a natural representative of u. The construction includes negative and nonintegral rational p-adic units and retains integral coefficients at p=2.

**API**

- DirichletPadic.padicSmoothedSeries_def: The series is exactly b_u·invOfUnit(q_u,u).
- DirichletPadic.padicSmoothedSeries_mul_denominator: q_u F_u=b_u in the native integral series ring.
- DirichletPadic.padicSmoothedSeries_constantCoeff: constantCoeff(F_u)=choose(u,2)u⁻¹ in Z.
- DirichletPadic.padicSmoothedSeries_unique: Any integral series F satisfying q_u F=b_u equals F_u.
- DirichletPadic.padicSmoothedSeries_one: F_1=0.
- DirichletPadic.padicSmoothedSeries_neg_one: F_(−1)=−1.

**Tests**

- SuggestedPadicSmoothingTests.series_identity_parameter: F_1=0 at p=2.
- SuggestedPadicSmoothingTests.series_negative_parameter: F_(−1)=−1 at p=2; it is not zero.
- SuggestedPadicSmoothingTests.dyadic_three_coefficients: At p=2 and u=3, the first two coefficients, included in Q_2, are1 and−2/3.
- SuggestedPadicSmoothingTests.inverse_two_coefficients: At p=3 and u=1/2, the first two coefficients in Q_3 are−1/4 and1/16.

**Uses**

- Definition4.5 and the following arbitrary-unit measure: Provide its actual integral Amice series.
- Theorem4.1 and PMIA L3 pseudomeasure membership: Supply smoothing parameters for every group element, needed before an all-unit numerator condition can be proved.

**Sources**

- RJW-published, Section4.1, Proposition4.4, Definition4.5 and Proposition4.6, published136–137/PDF37–38, read with4.2–4.3 and Theorem4.1 on complete published136–139/PDF37–40.. Worker extension from natural parameters prime to p to every u in Z_p^×, using the native binomial-ring structure and coefficientwise continuity. It constructs an actual integral arithmetic series and measure on existing carriers. The source complex smoothing argument still requires a positive natural parameter, as preserved in E3; the negative unit is a valid formal and p-adic parameter.

### Agreement with natural smoothing series

DirichletPadicLFunctions:L1/padic-smoothing-series-natural

Declaration: DirichletPadic.padicSmoothedSeries_nat

Kind: comparison. Implementation: unchecked.

If u∈U has value a∈N, then F_u=smoothedSeries Z a ha for any certificate ha that a is a unit.

**Hypotheses**

- p is any prime, including2; Z=Z_p and U=Z^× with their native topologies. All series have integral coefficients in the existing PowerSeries Z. For u∈U, write q_u=mk(n↦Ring.choose(u,n+1)) and b_u=mk(n↦Ring.choose(u,n+2)) as local notation. These are shifted coefficients of the native binomialSeries Z u, not new series carriers or a new exponentiation operation.
- a is natural and the equality (u:Z)=a is explicit.

**Construction or proof outline**

- Native Ring.choose_natCast identifies both shifted coefficient sequences with the natural binomial sequences of the existing smoothed-series constructor.
- Both series satisfy q_a F=b_a. Cancel the unit q_a, or use the preceding uniqueness API, to obtain equality independently of the unit certificate.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-smoothing-series
- DirichletPadicLFunctions:L1/smoothed-series
- DirichletPadicLFunctions:L1/series-cancellation
- mathlib:Ring.choose_natCast

**Acceptance**

- This is an equality in the existing integral series ring, not only an equality after a field extension.

**Tests**

- SuggestedPadicSmoothingTests.natural_two_comparison: At p=3,u=2 the new series equals the original smoothedSeries at2.
- SuggestedPadicSmoothingTests.natural_three_comparison: At p=2,u=3 the new series equals the original smoothedSeries at3.

**Sources**

- RJW-published, Section4.1, Proposition4.4, Definition4.5 and Proposition4.6, published136–137/PDF37–38, read with4.2–4.3 and Theorem4.1 on complete published136–139/PDF37–40.. Worker extension from natural parameters prime to p to every u in Z_p^×, using the native binomial-ring structure and coefficientwise continuity. It constructs an actual integral arithmetic series and measure on existing carriers. The source complex smoothing argument still requires a positive natural parameter, as preserved in E3; the negative unit is a valid formal and p-adic parameter.

### Continuous smoothing coefficients

DirichletPadicLFunctions:L1/padic-smoothing-coefficients-continuous

Declaration: DirichletPadic.padicSmoothedSeries_coeff_continuous

Kind: lemma. Implementation: unchecked.

For every n≥0, u↦coeff_n(F_u) is continuous U→Z.

**Hypotheses**

- p is any prime, including2; Z=Z_p and U=Z^× with their native topologies. All series have integral coefficients in the existing PowerSeries Z. For u∈U, write q_u=mk(n↦Ring.choose(u,n+1)) and b_u=mk(n↦Ring.choose(u,n+2)) as local notation. These are shifted coefficients of the native binomialSeries Z u, not new series carriers or a new exponentiation operation.

**Construction or proof outline**

- Native continuous_choose makes each coefficient of q_u and b_u continuous after composition with the continuous unit inclusion.
- Induct strongly on n in the exact native coeff_invOfUnit recurrence. Its degree-zero term is the continuous unit inverse. At positive degree, each summand uses a lower inverse coefficient multiplied by a continuous coefficient of q_u; the finite sum and the factor−u⁻¹ preserve continuity.
- Native coeff_mul expresses coeff_n(F_u) as a finite convolution of those continuous coefficients. The native coefficientwise convergence criterion then gives continuity of the entire series-valued map for WithPiTopology.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-smoothing-series
- mathlib:PadicInt.continuous_choose
- mathlib:Units.continuous_val
- mathlib:Units.continuous_coe_inv
- mathlib:PowerSeries.coeff_invOfUnit
- mathlib:PowerSeries.coeff_mul
- mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto

**Acceptance**

- This asserts coefficientwise continuity; it does not assert uniform convergence of all coefficients or convergence in their sup norm.

**API**

- DirichletPadic.padicSmoothedSeries_continuous: u↦F_u is continuous for the native coefficientwise p-adic topology on Z[[T]].

**Tests**

- SuggestedPadicSmoothingTests.coefficient_limit_at_negative_one: At p=3, for the units with values3^(n+1)−1, the first coefficient tends to0.
- SuggestedPadicSmoothingTests.constant_limit_at_negative_one: At p=2, for units with values2^(n+1)−1, the constant coefficient tends to−1.

**Sources**

- RJW-published, Section4.1, Proposition4.4, Definition4.5 and Proposition4.6, published136–137/PDF37–38, read with4.2–4.3 and Theorem4.1 on complete published136–139/PDF37–40.. Worker extension from natural parameters prime to p to every u in Z_p^×, using the native binomial-ring structure and coefficientwise continuity. It constructs an actual integral arithmetic series and measure on existing carriers. The source complex smoothing argument still requires a positive natural parameter, as preserved in E3; the negative unit is a valid formal and p-adic parameter.

### Integral smoothing measures at p-adic units

DirichletPadicLFunctions:L1/padic-smoothed-measure

Declaration: DirichletPadic.padicSmoothedMeasure

Kind: construction. Implementation: unchecked.

Define μ_u=(AbstractMeasure.amiceTransformEquiv)⁻¹(F_u) in the existing D(Z,Z).

**Hypotheses**

- p is any prime, including2; Z=Z_p and U=Z^× with their native topologies. All series have integral coefficients in the existing PowerSeries Z. For u∈U, write q_u=mk(n↦Ring.choose(u,n+1)) and b_u=mk(n↦Ring.choose(u,n+2)) as local notation. These are shifted coefficients of the native binomialSeries Z u, not new series carriers or a new exponentiation operation.

**Construction or proof outline**

- Apply the pinned integral Amice inverse to the preceding series. The existing carrier and equivalence already supply a bounded continuous Z-linear functional; no replacement measure object is defined.
- The inverse laws give its exact Amice series. Coeff_amiceTransformEquiv gives its values at the native Mahler basis. Injectivity of the equivalence gives uniqueness.
- At u=1 the zero series has zero inverse. At u=−1, evaluating native Dirac at0 on each Mahler function gives Amice(δ_0)=1; linearity and injectivity therefore identify μ_(−1)=−δ_0.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-smoothing-series
- mathlib:AbstractMeasure.amiceTransformEquiv
- mathlib:AbstractMeasure.amiceTransformEquiv_apply
- mathlib:AbstractMeasure.coeff_amiceTransformEquiv
- mathlib:AbstractMeasure.dirac
- mathlib:AbstractMeasure.dirac_apply
- mathlib:mahler_natCast_eq

**Acceptance**

- The formal and p-adic construction at−1 does not repair the rapid-decay failure of the complex kernel recorded in E3.

**API**

- DirichletPadic.padicSmoothedMeasure_def: μ_u is the inverse native Amice transform of F_u.
- DirichletPadic.amice_padicSmoothedMeasure: Amice(μ_u)=F_u.
- DirichletPadic.padicSmoothedMeasure_mahler: μ_u(mahler n)=coeff_n(F_u).
- DirichletPadic.padicSmoothedMeasure_unique: Any measure in D(Z,Z) with Amice series F_u equals μ_u.
- DirichletPadic.padicSmoothedMeasure_one: μ_1=0.
- DirichletPadic.padicSmoothedMeasure_neg_one: μ_(−1)=−δ_0 as an actual integral measure.

**Tests**

- SuggestedPadicSmoothingTests.measure_identity_parameter: μ_1=0 at p=2.
- SuggestedPadicSmoothingTests.measure_negative_parameter: μ_(−1)=−δ_0 at p=2.
- SuggestedPadicSmoothingTests.inverse_two_mass: At p=3,u=1/2 the total mass included in Q_3 is−1/4.
- SuggestedPadicSmoothingTests.negative_parameter_positive_moment: At p=3, μ_(−1)(x²)=0.

**Uses**

- Theorem4.1 arithmetic pseudomeasure construction: Supply arithmetic measures at every p-adic unit, before applying unit restriction and inverse weighting.
- Proposition4.6 and subsequent moment extension: Interpolate the existing natural smoothing measures in a weakly continuous family.

**Sources**

- RJW-published, Section4.1, Proposition4.4, Definition4.5 and Proposition4.6, published136–137/PDF37–38, read with4.2–4.3 and Theorem4.1 on complete published136–139/PDF37–40.. Worker extension from natural parameters prime to p to every u in Z_p^×, using the native binomial-ring structure and coefficientwise continuity. It constructs an actual integral arithmetic series and measure on existing carriers. The source complex smoothing argument still requires a positive natural parameter, as preserved in E3; the negative unit is a valid formal and p-adic parameter.

### Agreement with natural smoothing measures

DirichletPadicLFunctions:L1/padic-smoothed-measure-natural

Declaration: DirichletPadic.padicSmoothedMeasure_nat

Kind: comparison. Implementation: unchecked.

For a∈N with p∤a and u∈U of value a, μ_u=smoothedMeasure p a ha.

**Hypotheses**

- p is any prime, including2; Z=Z_p and U=Z^× with their native topologies. All series have integral coefficients in the existing PowerSeries Z. For u∈U, write q_u=mk(n↦Ring.choose(u,n+1)) and b_u=mk(n↦Ring.choose(u,n+2)) as local notation. These are shifted coefficients of the native binomialSeries Z u, not new series carriers or a new exponentiation operation.
- a is natural, p∤a, and (u:Z)=a.

**Construction or proof outline**

- Use the old norm/unit criteria to produce a unit certificate for a. The natural series comparison identifies F_u with the old Amice series.
- Apply the exact new and old Amice characterizations. Injectivity of the same native equivalence gives equality of the actual integral measures.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-smoothed-measure
- DirichletPadicLFunctions:L1/padic-smoothing-series-natural
- DirichletPadicLFunctions:L1/smoothed-measure
- DirichletPadicLFunctions:L1/measure-amice
- mathlib:AbstractMeasure.amiceTransformEquiv

**Acceptance**

- All prior natural-parameter nodes remain unchanged and their exact arithmetic measure is recovered.

**Tests**

- SuggestedPadicSmoothingTests.natural_measure_two: At p=3,u=2, μ_u equals the old smoothedMeasure at2.
- SuggestedPadicSmoothingTests.natural_measure_three: At p=2,u=3, μ_u equals the old smoothedMeasure at3.

**Sources**

- RJW-published, Section4.1, Proposition4.4, Definition4.5 and Proposition4.6, published136–137/PDF37–38, read with4.2–4.3 and Theorem4.1 on complete published136–139/PDF37–40.. Worker extension from natural parameters prime to p to every u in Z_p^×, using the native binomial-ring structure and coefficientwise continuity. It constructs an actual integral arithmetic series and measure on existing carriers. The source complex smoothing argument still requires a positive natural parameter, as preserved in E3; the negative unit is a valid formal and p-adic parameter.

### Weak continuity in the smoothing parameter

DirichletPadicLFunctions:L1/padic-smoothed-measure-weak-continuity

Declaration: DirichletPadic.padicSmoothedMeasure_continuous_weak

Kind: lemma. Implementation: unchecked.

The map u↦μ_u is continuous U→D(Z,Z) for the native WeakTopology.

**Hypotheses**

- p is any prime, including2; Z=Z_p and U=Z^× with their native topologies. All series have integral coefficients in the existing PowerSeries Z. For u∈U, write q_u=mk(n↦Ring.choose(u,n+1)) and b_u=mk(n↦Ring.choose(u,n+2)) as local notation. These are shifted coefficients of the native binomialSeries Z u, not new series carriers or a new exponentiation operation.

**Construction or proof outline**

- The preceding series continuity uses WithPiTopology. Import the supplied integral-Amice homeomorphism, whose inverse has precisely the required continuity from that topology to the native weak measure topology.
- Compose with the actual inverse Amice map defining μ_u. For each fixed f∈C(Z,Z), the weak topology is induced by the evaluation family, so u↦μ_u(f) is continuous.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-smoothed-measure
- DirichletPadicLFunctions:L1/padic-smoothing-coefficients-continuous
- PadicMeasuresIwasawaAlgebras:L2/integral-amice-weak-homeomorphism
- mathlib:AbstractMeasure.WeakTopology
- mathlib:continuous_induced_dom
- mathlib:continuous_apply

**Acceptance**

- The imported inverse continuity uses bounded integral coefficients. This does not assert operator-norm continuity or unrestricted field-valued series convergence.

**API**

- DirichletPadic.padicSmoothedMeasure_apply_continuous: For every fixed continuous integral test f, u↦μ_u(f) is continuous U→Z.

**Tests**

- SuggestedPadicSmoothingTests.weak_limit_negative_parameter: At p=2, units2^(n+1)−1 give μ_u converging weakly to−δ_0.
- SuggestedPadicSmoothingTests.fixed_test_limit: At p=3, the same negative-unit approximation gives μ_u(f)→−f(0) for every fixed integral continuous test.

**Sources**

- RJW-published, Section4.1, Proposition4.4, Definition4.5 and Proposition4.6, published136–137/PDF37–38, read with4.2–4.3 and Theorem4.1 on complete published136–139/PDF37–40.. Worker extension from natural parameters prime to p to every u in Z_p^×, using the native binomial-ring structure and coefficientwise continuity. It constructs an actual integral arithmetic series and measure on existing carriers. The source complex smoothing argument still requires a positive natural parameter, as preserved in E3; the negative unit is a valid formal and p-adic parameter.

### Ordinary moments for every smoothing unit

DirichletPadicLFunctions:L1/padic-smoothed-ordinary-moments

Declaration: DirichletPadic.padicSmoothedMeasure_moment

Kind: theorem. Implementation: unchecked.

For every k≥0, μ_u(x^k), included in Q_p, equals (1−u^(k+1))·algebraMap_Q,Q_p(B_(k+1)/(k+1)).

**Hypotheses**

- p is any prime, including2; Z=Z_p and U=Z^× with their native topologies. All series have integral coefficients in the existing PowerSeries Z. For u∈U, write q_u=mk(n↦Ring.choose(u,n+1)) and b_u=mk(n↦Ring.choose(u,n+2)) as local notation. These are shifted coefficients of the native binomialSeries Z u, not new series carriers or a new exponentiation operation.
- The variable u is included Z→Q_p only on the right. B_j is the existing rational bernoulli with B_1=−1/2. The actual integral measure is evaluated before its value is included into Q_p.

**Construction or proof outline**

- Native natural-number density in Z and the open map U→Z imply that units with natural-number values are dense in U, by Dense.preimage. A natural value of a unit is prime to p by the native norm/unit criteria. This uses no topological generator and includes p=2.
- For fixed k, the left side is continuous by fixed-test continuity and continuity of Z→Q_p. The right side is a polynomial in u multiplied by a fixed rational constant, hence continuous.
- At each natural unit, the preceding measure comparison and the old measure-ordinary-moment formula give equality, with the rational factor split by the algebra map. Apply Continuous.ext_on for the dense natural-unit set to extend the equality to all u.
- The statement includes k=0. At u=−1 it gives total mass−1 and every strictly positive moment0, agreeing with−δ_0. No common complex embedding of u is needed.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-smoothed-measure-natural
- DirichletPadicLFunctions:L1/padic-smoothed-measure-weak-continuity
- DirichletPadicLFunctions:L1/measure-ordinary-moment
- mathlib:PadicInt.denseRange_natCast
- mathlib:Units.isOpenMap_val
- mathlib:Topology.Dense.preimage
- mathlib:PadicInt.norm_units
- mathlib:PadicInt.norm_natCast_lt_one_iff
- mathlib:Continuous.ext_on

**Acceptance**

- This extends the integral smoothing measure and its ordinary moments. All-unit intrinsic numerators, their compatibility and pseudomeasure membership still require the remaining steps.

**Tests**

- SuggestedPadicSmoothingTests.inverse_two_first_moment: At p=3,u=1/2, μ_u(x)=1/16 in Q_3.
- SuggestedPadicSmoothingTests.inverse_two_second_moment: At p=3,u=1/2, μ_u(x²)=0.

**Sources**

- RJW-published, Section4.1, Proposition4.4, Definition4.5 and Proposition4.6, published136–137/PDF37–38, read with4.2–4.3 and Theorem4.1 on complete published136–139/PDF37–40.. Worker extension from natural parameters prime to p to every u in Z_p^×, using the native binomial-ring structure and coefficientwise continuity. It constructs an actual integral arithmetic series and measure on existing carriers. The source complex smoothing argument still requires a positive natural parameter, as preserved in E3; the negative unit is a valid formal and p-adic parameter.

### Psi invariance at every smoothing unit

DirichletPadicLFunctions:L1/padic-measure-psi-fixed

Declaration: DirichletPadic.psi_padicSmoothedMeasure

Kind: theorem. Implementation: unchecked.

For every u∈U, ψμ_u=μ_u. Consequently Eμ_u=μ_u−φμ_u.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p and U=Z^× with the existing topologies, and μ_u=padicSmoothedMeasure p u for u∈U. All measures use the native AbstractMeasure carrier. Write E, φ, ψ, J and r for the exact supplier unitRestriction, phiMeasure, psiMeasure, inverseWeight and restrictUnits; j is native pushforward along Units.val. The inverse test ι is the existing PadicInt.inv, continuous by the supplier and zero on every nonunit.

**Construction or proof outline**

- Fix an arbitrary integral continuous test f. The exact psi evaluation is (ψμ_u)(f)=μ_u(χ_pZ·(f∘divideByP)). The transformed test is fixed as u varies. Both sides of the asserted equality are continuous in u by the preceding fixed-test continuity; this argument requires no unstated operator-norm topology.
- Units whose values are natural numbers form a dense subset: pull back native natural-number density in Z along the open unit-value map. A natural number equal to a unit has norm1, hence p does not divide it, by the native unit and natural norm criteria.
- On that dense set, exact natural compatibility reduces the assertion to the existing psi_smoothedMeasure. Apply Continuous.ext_on to each fixed test and then native functional extensionality. The argument includes u=−1 and p=2.
- The supplier gives E=id−P and φψ=P. Substituting ψμ_u=μ_u gives the displayed unit-restriction API.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-smoothed-measure-weak-continuity
- DirichletPadicLFunctions:L1/padic-smoothed-measure-natural
- DirichletPadicLFunctions:L1/measure-psi-fixed
- PadicMeasuresIwasawaAlgebras:L2/psi-evaluation
- PadicMeasuresIwasawaAlgebras:L2/unit-restriction
- PadicMeasuresIwasawaAlgebras:L2/phi-psi
- mathlib:PadicInt.denseRange_natCast
- mathlib:Units.isOpenMap_val
- mathlib:Topology.Dense.preimage
- mathlib:PadicInt.norm_units
- mathlib:PadicInt.norm_natCast_lt_one_iff
- mathlib:Continuous.ext_on
- mathlib:AbstractMeasure.toCLMEquiv

**Acceptance**

- The existing E3 restriction on the complex rapidly decreasing kernel is unchanged. This proof concerns integral p-adic measures only.

**API**

- DirichletPadic.unitRestriction_padicSmoothedMeasure: Eμ_u=μ_u−φμ_u for every smoothing unit.

**Tests**

- SuggestedPadicNumeratorTests.psi_negative_parameter: At p=2, ψμ_(−1)=−δ_0.
- SuggestedPadicNumeratorTests.psi_is_not_unit_support: At p=3,u=2, ψμ_u is nonzero; psi invariance does not mean unit support.

**Sources**

- RJW-published, Lemma4.7 and Proposition4.8, equation4-3, Definitions4.9–4.10 and Proposition4.11 with proof, published137–139/PDF38–40; complete published136–139 freshly read28September2026.. Worker extension of the arithmetic numerator to every unit of Z_p using the preceding integral smoothing family, the existing psi/inverse-weight operators and the exact intrinsic restriction. Generic operators and topologies remain with PMIA and Mathlib. The k=1 Euler factor is retained as zero; E4 and all predecessor findings remain unchanged. No complex kernel for negative parameters is asserted.

### Ambient arithmetic numerator at a p-adic unit

DirichletPadicLFunctions:L1/padic-smoothed-numerator

Declaration: DirichletPadic.padicSmoothedNumerator

Kind: construction. Implementation: unchecked.

Define ν_u=Jμ_u in D(Z,Z), for every u∈U.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p and U=Z^× with the existing topologies, and μ_u=padicSmoothedMeasure p u for u∈U. All measures use the native AbstractMeasure carrier. Write E, φ, ψ, J and r for the exact supplier unitRestriction, phiMeasure, psiMeasure, inverseWeight and restrictUnits; j is native pushforward along Units.val. The inverse test ι is the existing PadicInt.inv, continuous by the supplier and zero on every nonunit.

**Construction or proof outline**

- Apply the actual supplier inverseWeight to the existing μ_u. Its evaluation is μ_u(ιf), its output satisfies Eν_u=ν_u, and multiplication by x gives Eμ_u. These follow directly from the exact supplier evaluation, support and two weight-composition laws.
- For uniqueness, if Eν=ν and Wν=Eμ_u, apply J. The identity JW=E gives ν=J(Eμ_u)=Jμ_u. This uses support rather than cancellation at x=0.
- At u=1, μ_u=0 and linearity gives ν_u=0. At u=−1, μ_u=−δ_0 and the supplier inverse-weight Dirac law, together with native PadicInt.inv(0)=0, gives ν_u=0.
- For a fixed test f, the transformed test ιf is independent of u. The preceding continuity of μ_u at that fixed test gives continuity of ν_u(f). No new generic weighting operator or topology is defined.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-smoothed-measure
- DirichletPadicLFunctions:L1/padic-smoothed-measure-weak-continuity
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight-evaluation
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight-support
- PadicMeasuresIwasawaAlgebras:L2/weight-inverse-weight
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight-weight
- mathlib:PadicInt.inv

**Acceptance**

- Both boundary parameters vanish after inverse weighting, although μ_(−1) does not vanish. The actual numerator is integral at p=2.

**API**

- DirichletPadic.padicSmoothedNumerator_def: ν_u=Jμ_u.
- DirichletPadic.padicSmoothedNumerator_apply: ν_u(f)=μ_u(ιf).
- DirichletPadic.padicSmoothedNumerator_supported: Eν_u=ν_u.
- DirichletPadic.weight_padicSmoothedNumerator: Wν_u=Eμ_u.
- DirichletPadic.padicSmoothedNumerator_unique: Eν=ν and Wν=Eμ_u imply ν=ν_u.
- DirichletPadic.padicSmoothedNumerator_one: ν_1=0.
- DirichletPadic.padicSmoothedNumerator_neg_one: ν_(−1)=0.
- DirichletPadic.padicSmoothedNumerator_apply_continuous: For each fixed integral continuous test f, u↦ν_u(f) is continuous.

**Tests**

- SuggestedPadicNumeratorTests.ambient_identity_parameter: At p=2, ν_1=0.
- SuggestedPadicNumeratorTests.ambient_negative_parameter: At p=2, ν_(−1)=0.
- SuggestedPadicNumeratorTests.ambient_inverse_two_second: At p=3,u=1/2, the second moment of ν_u in Q_3 is−1/8.
- SuggestedPadicNumeratorTests.weighting_removes_zero_atom: At p=3, μ_(−1) is nonzero but ν_(−1)=0.

**Uses**

- Equation4-3 and Definition4.10: Supply the actual inverse-weighted numerator for every group element before denominator clearing.
- Intrinsic arithmetic numerator and all-unit cross identities: Provide the unit-supported ambient measure whose actual restriction is used in the multiplicative measure ring.

**Sources**

- RJW-published, Lemma4.7 and Proposition4.8, equation4-3, Definitions4.9–4.10 and Proposition4.11 with proof, published137–139/PDF38–40; complete published136–139 freshly read28September2026.. Worker extension of the arithmetic numerator to every unit of Z_p using the preceding integral smoothing family, the existing psi/inverse-weight operators and the exact intrinsic restriction. Generic operators and topologies remain with PMIA and Mathlib. The k=1 Euler factor is retained as zero; E4 and all predecessor findings remain unchanged. No complex kernel for negative parameters is asserted.

### Natural compatibility of ambient numerators

DirichletPadicLFunctions:L1/padic-numerator-natural

Declaration: DirichletPadic.padicSmoothedNumerator_nat

Kind: comparison. Implementation: unchecked.

If a∈N, p∤a and (u:Z)=a, then ν_u=smoothedNumerator p a.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p and U=Z^× with the existing topologies, and μ_u=padicSmoothedMeasure p u for u∈U. All measures use the native AbstractMeasure carrier. Write E, φ, ψ, J and r for the exact supplier unitRestriction, phiMeasure, psiMeasure, inverseWeight and restrictUnits; j is native pushforward along Units.val. The inverse test ι is the existing PadicInt.inv, continuous by the supplier and zero on every nonunit.
- The equality of the unit value with the natural number is explicit.

**Construction or proof outline**

- Apply J to the exact natural-parameter comparison μ_u=smoothedMeasure p a. Both numerators are defined by this same linear map, so their values agree in the existing integral measure carrier.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-smoothed-numerator
- DirichletPadicLFunctions:L1/padic-smoothed-measure-natural
- DirichletPadicLFunctions:L1/smoothed-numerator

**Acceptance**

- No choice of a natural representative is part of the new construction.

**Tests**

- SuggestedPadicNumeratorTests.ambient_natural_three: At p=2,u=3 the new and old ambient numerators coincide.
- SuggestedPadicNumeratorTests.ambient_natural_identity: At p=3,u=1 the zero new numerator agrees with the old natural one.

**Sources**

- RJW-published, Lemma4.7 and Proposition4.8, equation4-3, Definitions4.9–4.10 and Proposition4.11 with proof, published137–139/PDF38–40; complete published136–139 freshly read28September2026.. Worker extension of the arithmetic numerator to every unit of Z_p using the preceding integral smoothing family, the existing psi/inverse-weight operators and the exact intrinsic restriction. Generic operators and topologies remain with PMIA and Mathlib. The k=1 Euler factor is retained as zero; E4 and all predecessor findings remain unchanged. No complex kernel for negative parameters is asserted.

### Positive moments of all-unit ambient numerators

DirichletPadicLFunctions:L1/padic-numerator-moments

Declaration: DirichletPadic.padicSmoothedNumerator_moment

Kind: theorem. Implementation: unchecked.

For k≥1, the image of ν_u(x^k) in Q_p is (1−p^(k−1))(1−u^k)·algebraMap_Q,Q_p(B_k/k).

**Hypotheses**

- p is any prime, including2. Put Z=Z_p and U=Z^× with the existing topologies, and μ_u=padicSmoothedMeasure p u for u∈U. All measures use the native AbstractMeasure carrier. Write E, φ, ψ, J and r for the exact supplier unitRestriction, phiMeasure, psiMeasure, inverseWeight and restrictUnits; j is native pushforward along Units.val. The inverse test ι is the existing PadicInt.inv, continuous by the supplier and zero on every nonunit.
- k is a positive natural number. B_k is the native rational bernoulli with B_1=−1/2; u and p are included in Q_p on the right.

**Construction or proof outline**

- Write k=(k−1)+1. Evaluate the constructor API Wν_u=Eμ_u at x^(k−1). The supplier weight evaluation identifies its left side with ν_u(x^k).
- Use the preceding Eμ_u=μ_u−φμ_u. The exact Frobenius evaluation is raw pushforward by x↦px; the monomial test pulls back to p^(k−1) times itself. Native linearity therefore gives ν_u(x^k)=(1−p^(k−1))μ_u(x^(k−1)) in Z.
- Include this scalar identity into Q_p and substitute the all-unit ordinary moment formula for μ_u. Normalize (k−1)+1=k and the algebra map of the rational Bernoulli value. All divisions by k take place in Q before inclusion.
- At k=1 the Euler factor is zero, so the first moment vanishes for every u, including p=2. At u=−1 all positive moments vanish: even k have 1−u^k=0, odd k>1 have B_k=0, and k=1 has the Euler factor.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-smoothed-numerator
- DirichletPadicLFunctions:L1/padic-measure-psi-fixed
- DirichletPadicLFunctions:L1/padic-smoothed-ordinary-moments
- PadicMeasuresIwasawaAlgebras:L2/weight-evaluation
- PadicMeasuresIwasawaAlgebras:L2/phi-evaluation
- mathlib:AbstractMeasure.map_apply
- mathlib:bernoulli_eq_zero_of_odd

**Acceptance**

- No k=0 interpolation formula is claimed. In particular the total mass of ν_u is not set to zero by totalized division at k=0.

**Tests**

- SuggestedPadicNumeratorTests.ambient_first_moment_zero: At p=2 every ν_u has first moment0.
- SuggestedPadicNumeratorTests.ambient_dyadic_third_parameter: At p=2,u=3 the second moment is2/3 in Q_2.

**Sources**

- RJW-published, Lemma4.7 and Proposition4.8, equation4-3, Definitions4.9–4.10 and Proposition4.11 with proof, published137–139/PDF38–40; complete published136–139 freshly read28September2026.. Worker extension of the arithmetic numerator to every unit of Z_p using the preceding integral smoothing family, the existing psi/inverse-weight operators and the exact intrinsic restriction. Generic operators and topologies remain with PMIA and Mathlib. The k=1 Euler factor is retained as zero; E4 and all predecessor findings remain unchanged. No complex kernel for negative parameters is asserted.

### Integral numerator on units for every smoothing unit

DirichletPadicLFunctions:L1/padic-intrinsic-numerator

Declaration: DirichletPadic.padicIntrinsicNumerator

Kind: construction. Implementation: unchecked.

Define λ_u=rν_u in D(U,Z).

**Hypotheses**

- p is any prime, including2. Put Z=Z_p and U=Z^× with the existing topologies, and μ_u=padicSmoothedMeasure p u for u∈U. All measures use the native AbstractMeasure carrier. Write E, φ, ψ, J and r for the exact supplier unitRestriction, phiMeasure, psiMeasure, inverseWeight and restrictUnits; j is native pushforward along Units.val. The inverse test ι is the existing PadicInt.inv, continuous by the supplier and zero on every nonunit.

**Construction or proof outline**

- Apply the exact supplier restrictUnits to the actual ambient ν_u. The codomain is the native group U with its existing topology. This does not identify ambient and intrinsic measures definitionally.
- The boundary values λ_1=λ_(−1)=0 follow from the corresponding ambient values and linearity of restriction.
- If an intrinsic η has jη=ν_u, apply r and use the supplier retraction rj=id. It follows that η=rν_u=λ_u. The inclusion identity is promoted below.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-smoothed-numerator
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-section

**Acceptance**

- This constructs integral elements of the actual unit-measure ring, with no fraction or completed-algebra identification.

**API**

- DirichletPadic.padicIntrinsicNumerator_def: λ_u=rν_u.
- DirichletPadic.padicIntrinsicNumerator_unique: If jη=ν_u then η=λ_u.
- DirichletPadic.padicIntrinsicNumerator_one: λ_1=0.
- DirichletPadic.padicIntrinsicNumerator_neg_one: λ_(−1)=0.
- DirichletPadic.map_val_padicIntrinsicNumerator: jλ_u=ν_u; promoted to the inclusion node.
- DirichletPadic.padicIntrinsicNumerator_moment: Positive moments have the exact Euler and smoothing factors; promoted to the intrinsic moment node.

**Tests**

- SuggestedPadicNumeratorTests.intrinsic_identity_parameter: At p=2, λ_1=0.
- SuggestedPadicNumeratorTests.intrinsic_negative_parameter: At p=2, λ_(−1)=0.
- SuggestedPadicNumeratorTests.intrinsic_inverse_two_second: At p=3,u=1/2, λ_u has second moment−1/8 in Q_3.

**Uses**

- Definition4.10 and Proposition4.11: Supply integral numerators indexed by every unit, as required by actual pseudomeasure membership.
- All-unit cocycle and cross-numerator identity: Make both numerator parameters elements of the same native multiplicative unit group.

**Sources**

- RJW-published, Lemma4.7 and Proposition4.8, equation4-3, Definitions4.9–4.10 and Proposition4.11 with proof, published137–139/PDF38–40; complete published136–139 freshly read28September2026.. Worker extension of the arithmetic numerator to every unit of Z_p using the preceding integral smoothing family, the existing psi/inverse-weight operators and the exact intrinsic restriction. Generic operators and topologies remain with PMIA and Mathlib. The k=1 Euler factor is retained as zero; E4 and all predecessor findings remain unchanged. No complex kernel for negative parameters is asserted.

### Inclusion of the all-unit intrinsic numerator

DirichletPadicLFunctions:L1/padic-intrinsic-inclusion

Declaration: DirichletPadic.map_val_padicIntrinsicNumerator

Kind: comparison. Implementation: unchecked.

For every u∈U, jλ_u=ν_u as actual ambient integral measures.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p and U=Z^× with the existing topologies, and μ_u=padicSmoothedMeasure p u for u∈U. All measures use the native AbstractMeasure carrier. Write E, φ, ψ, J and r for the exact supplier unitRestriction, phiMeasure, psiMeasure, inverseWeight and restrictUnits; j is native pushforward along Units.val. The inverse test ι is the existing PadicInt.inv, continuous by the supplier and zero on every nonunit.

**Construction or proof outline**

- Substitute λ_u=rν_u and apply the exact supplier projector identity jr=E. The ambient numerator support API gives Eν_u=ν_u.
- Native map_apply makes this equality available on every continuous ambient test, not just monomials.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-intrinsic-numerator
- DirichletPadicLFunctions:L1/padic-smoothed-numerator
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-extension-projector
- mathlib:AbstractMeasure.map_apply

**Acceptance**

- The support identity is essential; jr is not the identity on arbitrary ambient measures.

**Tests**

- SuggestedPadicNumeratorTests.intrinsic_inclusion_test: At p=2, evaluating λ_u on the restriction of any ambient continuous test equals evaluating ν_u on that test.

**Sources**

- RJW-published, Lemma4.7 and Proposition4.8, equation4-3, Definitions4.9–4.10 and Proposition4.11 with proof, published137–139/PDF38–40; complete published136–139 freshly read28September2026.. Worker extension of the arithmetic numerator to every unit of Z_p using the preceding integral smoothing family, the existing psi/inverse-weight operators and the exact intrinsic restriction. Generic operators and topologies remain with PMIA and Mathlib. The k=1 Euler factor is retained as zero; E4 and all predecessor findings remain unchanged. No complex kernel for negative parameters is asserted.

### Natural compatibility of intrinsic numerators

DirichletPadicLFunctions:L1/padic-intrinsic-natural

Declaration: DirichletPadic.padicIntrinsicNumerator_nat

Kind: comparison. Implementation: unchecked.

If a∈N, p∤a and (u:Z)=a, then λ_u=intrinsicSmoothedNumerator p a.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p and U=Z^× with the existing topologies, and μ_u=padicSmoothedMeasure p u for u∈U. All measures use the native AbstractMeasure carrier. Write E, φ, ψ, J and r for the exact supplier unitRestriction, phiMeasure, psiMeasure, inverseWeight and restrictUnits; j is native pushforward along Units.val. The inverse test ι is the existing PadicInt.inv, continuous by the supplier and zero on every nonunit.
- The equality of the unit value with the natural number is explicit.

**Construction or proof outline**

- Apply the same intrinsic restriction map r to the ambient natural comparison. The old intrinsic numerator is exactly r applied to the old ambient numerator.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-intrinsic-numerator
- DirichletPadicLFunctions:L1/padic-numerator-natural
- DirichletPadicLFunctions:L1/intrinsic-numerator

**Acceptance**

- All existing natural-parameter statements retain their original objects and proof certificates.

**Tests**

- SuggestedPadicNumeratorTests.intrinsic_natural_three: At p=2,u=3 the new and old intrinsic numerators coincide.
- SuggestedPadicNumeratorTests.intrinsic_natural_two: At p=3,u=2 the new and old intrinsic numerators coincide.

**Sources**

- RJW-published, Lemma4.7 and Proposition4.8, equation4-3, Definitions4.9–4.10 and Proposition4.11 with proof, published137–139/PDF38–40; complete published136–139 freshly read28September2026.. Worker extension of the arithmetic numerator to every unit of Z_p using the preceding integral smoothing family, the existing psi/inverse-weight operators and the exact intrinsic restriction. Generic operators and topologies remain with PMIA and Mathlib. The k=1 Euler factor is retained as zero; E4 and all predecessor findings remain unchanged. No complex kernel for negative parameters is asserted.

### Positive moments of intrinsic all-unit numerators

DirichletPadicLFunctions:L1/padic-intrinsic-moments

Declaration: DirichletPadic.padicIntrinsicNumerator_moment

Kind: theorem. Implementation: unchecked.

For every k≥1, the image of λ_u(v↦v^k) in Q_p is (1−p^(k−1))(1−u^k)·algebraMap_Q,Q_p(B_k/k).

**Hypotheses**

- p is any prime, including2. Put Z=Z_p and U=Z^× with the existing topologies, and μ_u=padicSmoothedMeasure p u for u∈U. All measures use the native AbstractMeasure carrier. Write E, φ, ψ, J and r for the exact supplier unitRestriction, phiMeasure, psiMeasure, inverseWeight and restrictUnits; j is native pushforward along Units.val. The inverse test ι is the existing PadicInt.inv, continuous by the supplier and zero on every nonunit.
- k is a positive natural number; all scalar inclusions and Bernoulli conventions are those of the ambient moment theorem.

**Construction or proof outline**

- Evaluate jλ_u=ν_u on the ambient monomial x^k. Native map_apply identifies the pulled-back test with the kth power of the continuous unit-value map.
- Apply the ambient numerator moment theorem with the same positive k. No coefficient-extension measure is required: evaluate the integral measure first, then include its scalar value into Q_p.
- In particular k=1 gives zero by the Euler factor. This assertion makes no claim at degree0.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-intrinsic-inclusion
- DirichletPadicLFunctions:L1/padic-numerator-moments
- mathlib:AbstractMeasure.map_apply
- mathlib:Units.continuous_val

**Acceptance**

- The denominator k is a rational scalar included in Q_p. No inverse of k or2 in Z_p is assumed.

**Tests**

- SuggestedPadicNumeratorTests.intrinsic_first_moment_zero: At p=2 every λ_u has first moment0.
- SuggestedPadicNumeratorTests.intrinsic_second_integral: At p=2,u=3 the second moment is2/3 in Q_2.

**Sources**

- RJW-published, Lemma4.7 and Proposition4.8, equation4-3, Definitions4.9–4.10 and Proposition4.11 with proof, published137–139/PDF38–40; complete published136–139 freshly read28September2026.. Worker extension of the arithmetic numerator to every unit of Z_p using the preceding integral smoothing family, the existing psi/inverse-weight operators and the exact intrinsic restriction. Generic operators and topologies remain with PMIA and Mathlib. The k=1 Euler factor is retained as zero; E4 and all predecessor findings remain unchanged. No complex kernel for negative parameters is asserted.

### Weak continuity of intrinsic arithmetic numerators

DirichletPadicLFunctions:L1/padic-intrinsic-continuity

Declaration: DirichletPadic.padicIntrinsicNumerator_apply_continuous

Kind: lemma. Implementation: unchecked.

For every fixed f∈C(U,Z), u↦λ_u(f) is continuous. Thus u↦λ_u is continuous for native AbstractMeasure.WeakTopology.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p and U=Z^× with the existing topologies, and μ_u=padicSmoothedMeasure p u for u∈U. All measures use the native AbstractMeasure carrier. Write E, φ, ψ, J and r for the exact supplier unitRestriction, phiMeasure, psiMeasure, inverseWeight and restrictUnits; j is native pushforward along Units.val. The inverse test ι is the existing PadicInt.inv, continuous by the supplier and zero on every nonunit.

**Construction or proof outline**

- The exact supplier restriction evaluation gives λ_u(f)=ν_u(z_V(f∘h⁻¹)), where h:U≃the clopen unit locus and z_V is its existing continuous extension by zero. This transformed ambient test is fixed as u varies.
- Apply the ambient numerator fixed-test continuity to that test. Its proof ultimately evaluates the original smoothing measure at ι times a fixed continuous test.
- The native weak topology is induced by the map taking a measure to all its test evaluations. The preceding continuity for every f gives continuity into the product and therefore the stated weak continuity. No topology on a pseudomeasure module or operator-norm continuity is asserted.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-intrinsic-numerator
- DirichletPadicLFunctions:L1/padic-smoothed-numerator
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-evaluation
- mathlib:AbstractMeasure.WeakTopology

**Acceptance**

- This is a parameter-continuity theorem for the specific arithmetic family. No generic measure operator is replanned.

**API**

- DirichletPadic.padicIntrinsicNumerator_continuous_weak: The actual intrinsic numerator family is continuous into the native weak measure topology.

**Tests**

- SuggestedPadicNumeratorTests.fixed_test_negative_limit: At p=2, λ_u(f) tends to0 as u tends to−1, for every fixed integral unit test.
- SuggestedPadicNumeratorTests.fixed_test_identity_limit: At p=3, λ_u(f) tends to0 as u tends to1, for every fixed integral unit test.

**Sources**

- RJW-published, Lemma4.7 and Proposition4.8, equation4-3, Definitions4.9–4.10 and Proposition4.11 with proof, published137–139/PDF38–40; complete published136–139 freshly read28September2026.. Worker extension of the arithmetic numerator to every unit of Z_p using the preceding integral smoothing family, the existing psi/inverse-weight operators and the exact intrinsic restriction. Generic operators and topologies remain with PMIA and Mathlib. The k=1 Euler factor is retained as zero; E4 and all predecessor findings remain unchanged. No complex kernel for negative parameters is asserted.

### The smoothing cocycle for every unit

DirichletPadicLFunctions:L1/padic-measure-cocycle

Declaration: DirichletPadic.padicSmoothedMeasure_mul

Kind: lemma. Implementation: unchecked.

For every u,v∈U, μ_(uv)=μ_u+u·σ_uμ_v.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p and U=Z^×. For u∈U let μ_u, ν_u and λ_u be the preceding actual padicSmoothedMeasure, padicSmoothedNumerator and padicIntrinsicNumerator. These are on D(Z,Z), D(Z,Z) and D(U,Z), respectively. Let σ_u be native raw pushforward by z↦uz, and j the native pushforward U→Z. On D(U,Z), multiplication is the exact supplier multiplicative convolution and δ_u is native Dirac. No completed-algebra or localization identification is assumed.

**Construction or proof outline**

- Evaluate the difference on x^k for every k≥0. Native map_apply and linearity identify the dilated moment as u^k μ_v(x^k); the outside scalar supplies the further factor u.
- Include the integral scalar values into Q_p and use the all-unit ordinary-moment formula. With B=B_(k+1)/(k+1), the required equality is (1−(uv)^(k+1))B=(1−u^(k+1))B+u^(k+1)(1−v^(k+1))B. Ring identities prove it, and injectivity of Z→Q_p returns zero ordinary moments to Z.
- To determine the actual integral measure from these moments, apply native AbstractMeasure.ext_mahler to the difference. For each n, the native factorial identity writes n! times the nth Mahler test as the descending Pochhammer polynomial evaluated at the identity test. Polynomial.smeval_eq_sum and Polynomial.sum express this as a finite sum of integral multiples of ordinary monomials. Measure linearity makes its value zero.
- Cancel the nonzero scalar n! in the integral domain Z to conclude that the nth Mahler value is zero. This uses all degrees including0 and never inverts n! in Z. The complete native scratch proof verifies exactly this moment-determination argument; no new generic separation node is introduced.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-smoothed-ordinary-moments
- mathlib:AbstractMeasure.map
- mathlib:AbstractMeasure.map_apply
- mathlib:AbstractMeasure.ext_mahler
- mathlib:mahler_apply
- mathlib:Ring.descPochhammer_eq_factorial_smul_choose
- mathlib:Polynomial.smeval_eq_sum
- mathlib:Polynomial.sum
- mathlib:Polynomial.smul_pow
- mathlib:PadicInt.ext

**Acceptance**

- The outside scalar is essential. This statement is for every pair of actual units; a natural-parameter identity alone would not suffice for pseudomeasure membership.

**Tests**

- SuggestedPadicRelationTests.raw_cocycle_scalar: At p=3,u=v=2 the raw formula has scalar2: its total mass is3/2=1/2+2·1/2.
- SuggestedPadicRelationTests.raw_cocycle_negative: At p=2, μ_(−u)=μ_u−uδ_0 for every u∈U.

**Sources**

- RJW-published, Remark3.33 and equation3-10, Definition3.34 and Lemma3.36, published129–131/PDF30–32; Proposition4.6, equation4-3 and Proposition4.11, published137–139/PDF38–40. Complete cited pages read28September2026.. Worker decomposition of the all-unit compatibility identities needed before the arithmetic pseudomeasure can be formed. The source does not state these cocycle/reflection adapters separately. The raw cocycle has scalar u, which inverse weighting cancels. Negative-unit boundary values give parity without averaging by2. All generic measure, dilation, inverse-weight and convolution operations are imported from their existing owners.

### Reflection with its zero-atom correction

DirichletPadicLFunctions:L1/padic-measure-reflection

Declaration: DirichletPadic.padicSmoothedMeasure_reflection

Kind: lemma. Implementation: unchecked.

For every u∈U, μ_u+σ_(−1)μ_u=(u−1)δ_0.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p and U=Z^×. For u∈U let μ_u, ν_u and λ_u be the preceding actual padicSmoothedMeasure, padicSmoothedNumerator and padicIntrinsicNumerator. These are on D(Z,Z), D(Z,Z) and D(U,Z), respectively. Let σ_u be native raw pushforward by z↦uz, and j the native pushforward U→Z. On D(U,Z), multiplication is the exact supplier multiplicative convolution and δ_u is native Dirac. No completed-algebra or localization identification is assumed.

**Construction or proof outline**

- Apply the all-unit cocycle first to (u,−1). The existing μ_(−1)=−δ_0 and native map_dirac at0 give μ_(−u)=μ_u−uδ_0.
- Apply the same cocycle to (−1,u). It gives μ_(−u)=−δ_0−σ_(−1)μ_u. The native unit group is commutative, so these are values at the same parameter.
- Equate the two expressions and rearrange in the native Z-module. The result keeps the zero-atom correction; no Bernoulli parity shortcut or inverse of2 is required.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-measure-cocycle
- DirichletPadicLFunctions:L1/padic-smoothed-measure
- mathlib:AbstractMeasure.map_dirac

**Acceptance**

- The zero-atom correction is an equality in the integral ambient carrier, including p=2.

**Tests**

- SuggestedPadicRelationTests.reflection_negative_boundary: At p=3,u=−1 both sides are−2δ_0.
- SuggestedPadicRelationTests.reflection_dyadic_correction: At p=2,u=3 the correction is2δ_0, which is nonzero; the raw measure is not odd.

**Sources**

- RJW-published, Remark3.33 and equation3-10, Definition3.34 and Lemma3.36, published129–131/PDF30–32; Proposition4.6, equation4-3 and Proposition4.11, published137–139/PDF38–40. Complete cited pages read28September2026.. Worker decomposition of the all-unit compatibility identities needed before the arithmetic pseudomeasure can be formed. The source does not state these cocycle/reflection adapters separately. The raw cocycle has scalar u, which inverse weighting cancels. Negative-unit boundary values give parity without averaging by2. All generic measure, dilation, inverse-weight and convolution operations are imported from their existing owners.

### The scalar-free numerator cocycle

DirichletPadicLFunctions:L1/padic-numerator-cocycle

Declaration: DirichletPadic.padicSmoothedNumerator_mul

Kind: lemma. Implementation: unchecked.

For every u,v∈U, ν_(uv)=ν_u+σ_uν_v.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p and U=Z^×. For u∈U let μ_u, ν_u and λ_u be the preceding actual padicSmoothedMeasure, padicSmoothedNumerator and padicIntrinsicNumerator. These are on D(Z,Z), D(Z,Z) and D(U,Z), respectively. Let σ_u be native raw pushforward by z↦uz, and j the native pushforward U→Z. On D(U,Z), multiplication is the exact supplier multiplicative convolution and δ_u is native Dirac. No completed-algebra or localization identification is assumed.

**Construction or proof outline**

- Apply the exact supplier inverseWeight J to the raw smoothing cocycle. Its native Z-linearity carries the sum and the scalar u through J.
- The supplier inverse-weight-dilation identity gives Jσ_u=u⁻¹σ_uJ for the same actual unit u. The outside u therefore cancels with u⁻¹ in the existing scalar action.
- Substitute ν_w=Jμ_w for the three parameters. All arithmetic takes place in the existing integral module; no smoothing denominator or2 is inverted.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-measure-cocycle
- DirichletPadicLFunctions:L1/padic-smoothed-numerator
- PadicMeasuresIwasawaAlgebras:L2/inverse-weight-dilation

**Acceptance**

- This formula has raw pushforward σ_u and no extra outside scalar.

**Tests**

- SuggestedPadicRelationTests.numerator_inverse_parameters: At p=3, ν_u+σ_uν_(u⁻¹)=0.
- SuggestedPadicRelationTests.numerator_no_extra_scalar: At p=3,u=v=2 the second moment is5/2=1/2+4·1/2; an extra scalar2 would give the wrong result.

**Sources**

- RJW-published, Remark3.33 and equation3-10, Definition3.34 and Lemma3.36, published129–131/PDF30–32; Proposition4.6, equation4-3 and Proposition4.11, published137–139/PDF38–40. Complete cited pages read28September2026.. Worker decomposition of the all-unit compatibility identities needed before the arithmetic pseudomeasure can be formed. The source does not state these cocycle/reflection adapters separately. The raw cocycle has scalar u, which inverse weighting cancels. Negative-unit boundary values give parity without averaging by2. All generic measure, dilation, inverse-weight and convolution operations are imported from their existing owners.

### Evenness of every ambient numerator

DirichletPadicLFunctions:L1/padic-numerator-even

Declaration: DirichletPadic.padicSmoothedNumerator_even

Kind: lemma. Implementation: unchecked.

For every u∈U, σ_(−1)ν_u=ν_u.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p and U=Z^×. For u∈U let μ_u, ν_u and λ_u be the preceding actual padicSmoothedMeasure, padicSmoothedNumerator and padicIntrinsicNumerator. These are on D(Z,Z), D(Z,Z) and D(U,Z), respectively. Let σ_u be native raw pushforward by z↦uz, and j the native pushforward U→Z. On D(U,Z), multiplication is the exact supplier multiplicative convolution and δ_u is native Dirac. No completed-algebra or localization identification is assumed.

**Construction or proof outline**

- Apply the numerator cocycle to (u,−1). The existing ν_(−1)=0 gives ν_(−u)=ν_u.
- Apply it to (−1,u). The same boundary value gives ν_(−u)=σ_(−1)ν_u. Compare the two identities.
- This proof works integrally at p=2. Odd monomial moments vanish by the existing moment formula, or by this reflection identity followed by cancellation of the nonzero scalar2 in the domain Z; no inverse of2 is needed.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-numerator-cocycle
- DirichletPadicLFunctions:L1/padic-smoothed-numerator
- DirichletPadicLFunctions:L1/padic-numerator-moments

**Acceptance**

- Evenness does not require a dyadic idempotent decomposition.

**Tests**

- SuggestedPadicRelationTests.ambient_dyadic_even: At p=2 every ambient numerator is fixed by negation pushforward.
- SuggestedPadicRelationTests.ambient_odd_test: At p=2 the third ordinary moment of ν_u is0 for every u.

**Sources**

- RJW-published, Remark3.33 and equation3-10, Definition3.34 and Lemma3.36, published129–131/PDF30–32; Proposition4.6, equation4-3 and Proposition4.11, published137–139/PDF38–40. Complete cited pages read28September2026.. Worker decomposition of the all-unit compatibility identities needed before the arithmetic pseudomeasure can be formed. The source does not state these cocycle/reflection adapters separately. The raw cocycle has scalar u, which inverse weighting cancels. Negative-unit boundary values give parity without averaging by2. All generic measure, dilation, inverse-weight and convolution operations are imported from their existing owners.

### Dirac action on every intrinsic numerator

DirichletPadicLFunctions:L1/padic-intrinsic-dirac

Declaration: DirichletPadic.map_val_dirac_mul_padicIntrinsicNumerator

Kind: lemma. Implementation: unchecked.

For every u,v∈U, j(δ_v*λ_u)=σ_vν_u.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p and U=Z^×. For u∈U let μ_u, ν_u and λ_u be the preceding actual padicSmoothedMeasure, padicSmoothedNumerator and padicIntrinsicNumerator. These are on D(Z,Z), D(Z,Z) and D(U,Z), respectively. Let σ_u be native raw pushforward by z↦uz, and j the native pushforward U→Z. On D(U,Z), multiplication is the exact supplier multiplicative convolution and δ_u is native Dirac. No completed-algebra or localization identification is assumed.

**Construction or proof outline**

- Test the left side on an arbitrary ambient continuous f. Native map_apply, the supplier convolution evaluation and native Dirac evaluation give λ_u(w↦f(vw)). The supplier right-convolution evaluation fixes this ordered product explicitly.
- This test is the restriction to U of the ambient test z↦f(vz). Apply the preceding exact inclusion jλ_u=ν_u and native map_apply to obtain the right side.
- The statement uses multiplicative convolution only on U. It does not turn j into a homomorphism from multiplicative unit convolution to additive ambient convolution.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-intrinsic-inclusion
- PadicMeasuresIwasawaAlgebras:L1/convolution-evaluation
- PadicMeasuresIwasawaAlgebras:L1/right-convolution-evaluation
- mathlib:AbstractMeasure.map_apply
- mathlib:AbstractMeasure.dirac_apply

**Acceptance**

- The dilation parameter and arithmetic smoothing parameter are independent actual units.

**Tests**

- SuggestedPadicRelationTests.dirac_identity_inclusion: At p=2, j(δ_1*λ_u)=ν_u.
- SuggestedPadicRelationTests.dirac_negative_zero: At p=3, δ_v*λ_(−1)=0 for every v.

**Sources**

- RJW-published, Remark3.33 and equation3-10, Definition3.34 and Lemma3.36, published129–131/PDF30–32; Proposition4.6, equation4-3 and Proposition4.11, published137–139/PDF38–40. Complete cited pages read28September2026.. Worker decomposition of the all-unit compatibility identities needed before the arithmetic pseudomeasure can be formed. The source does not state these cocycle/reflection adapters separately. The raw cocycle has scalar u, which inverse weighting cancels. Negative-unit boundary values give parity without averaging by2. All generic measure, dilation, inverse-weight and convolution operations are imported from their existing owners.

### The all-unit intrinsic smoothing cocycle

DirichletPadicLFunctions:L1/padic-intrinsic-cocycle

Declaration: DirichletPadic.padicIntrinsicNumerator_mul

Kind: lemma. Implementation: unchecked.

For every u,v∈U, λ_(uv)=λ_u+δ_u*λ_v.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p and U=Z^×. For u∈U let μ_u, ν_u and λ_u be the preceding actual padicSmoothedMeasure, padicSmoothedNumerator and padicIntrinsicNumerator. These are on D(Z,Z), D(Z,Z) and D(U,Z), respectively. Let σ_u be native raw pushforward by z↦uz, and j the native pushforward U→Z. On D(U,Z), multiplication is the exact supplier multiplicative convolution and δ_u is native Dirac. No completed-algebra or localization identification is assumed.

**Construction or proof outline**

- Apply the injectivity of j supplied by the actual restriction retraction rj=id. Native pushforward is Z-linear, so inclusion carries the sum to the sum.
- Use jλ_w=ν_w for the two bare terms and the preceding Dirac-action adapter for the convolution term. The desired identity becomes exactly the ambient scalar-free numerator cocycle.
- At inverse parameters this gives λ_u+δ_u*λ_(u⁻¹)=λ_1=0. At v=−1 it gives λ_(−u)=λ_u because λ_(−1)=0.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-intrinsic-inclusion
- DirichletPadicLFunctions:L1/padic-intrinsic-dirac
- DirichletPadicLFunctions:L1/padic-numerator-cocycle
- DirichletPadicLFunctions:L1/padic-intrinsic-numerator
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-section

**Acceptance**

- No natural representative of u or v occurs in the statement or proof.

**Tests**

- SuggestedPadicRelationTests.intrinsic_inverse_parameters: At p=2, λ_u+δ_u*λ_(u⁻¹)=0.
- SuggestedPadicRelationTests.intrinsic_negative_parameter_change: At p=2, λ_(−u)=λ_u for every u.

**Sources**

- RJW-published, Remark3.33 and equation3-10, Definition3.34 and Lemma3.36, published129–131/PDF30–32; Proposition4.6, equation4-3 and Proposition4.11, published137–139/PDF38–40. Complete cited pages read28September2026.. Worker decomposition of the all-unit compatibility identities needed before the arithmetic pseudomeasure can be formed. The source does not state these cocycle/reflection adapters separately. The raw cocycle has scalar u, which inverse weighting cancels. Negative-unit boundary values give parity without averaging by2. All generic measure, dilation, inverse-weight and convolution operations are imported from their existing owners.

### Cross-numerator identity for every pair of units

DirichletPadicLFunctions:L1/padic-intrinsic-cross

Declaration: DirichletPadic.padicIntrinsicNumerator_cross

Kind: lemma. Implementation: unchecked.

For every u,v∈U, (δ_v−δ_1)*λ_u=(δ_u−δ_1)*λ_v.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p and U=Z^×. For u∈U let μ_u, ν_u and λ_u be the preceding actual padicSmoothedMeasure, padicSmoothedNumerator and padicIntrinsicNumerator. These are on D(Z,Z), D(Z,Z) and D(U,Z), respectively. Let σ_u be native raw pushforward by z↦uz, and j the native pushforward U→Z. On D(U,Z), multiplication is the exact supplier multiplicative convolution and δ_u is native Dirac. No completed-algebra or localization identification is assumed.

**Construction or proof outline**

- Write the intrinsic cocycle for (u,v) and (v,u). Their left sides agree because uv=vu in the native abelian unit group.
- Equating the right sides yields δ_v*λ_u−λ_u=δ_u*λ_v−λ_v. Use the supplier ring distributivity and δ_1=1 to rewrite this as the displayed cross identity.
- This is an equality of actual integral measures for every unit pair, before localization. It is the numerator identity needed to clear the fixed regular denominator at p+1. It does not assert that every δ_u−δ_1 is regular.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-intrinsic-cocycle
- PadicMeasuresIwasawaAlgebras:L1/convolution-algebra

**Acceptance**

- The factor indexed by v multiplies λ_u and the factor indexed by u multiplies λ_v. Torsion and identity parameters are allowed; no cancellation is performed.

**Tests**

- SuggestedPadicRelationTests.cross_orientation: At p=3,u=2,v=4, the second moment on the left is15 times the second moment of λ_2, namely15/2; the right is3 times5/2.
- SuggestedPadicRelationTests.cross_identity_parameter: At p=2 the cross numerator involving λ_1 is0.

**Sources**

- RJW-published, Remark3.33 and equation3-10, Definition3.34 and Lemma3.36, published129–131/PDF30–32; Proposition4.6, equation4-3 and Proposition4.11, published137–139/PDF38–40. Complete cited pages read28September2026.. Worker decomposition of the all-unit compatibility identities needed before the arithmetic pseudomeasure can be formed. The source does not state these cocycle/reflection adapters separately. The raw cocycle has scalar u, which inverse weighting cancels. Negative-unit boundary values give parity without averaging by2. All generic measure, dilation, inverse-weight and convolution operations are imported from their existing owners.

### Evenness of every intrinsic numerator

DirichletPadicLFunctions:L1/padic-intrinsic-even

Declaration: DirichletPadic.padicIntrinsicNumerator_even

Kind: lemma. Implementation: unchecked.

For every u∈U, δ_(−1)*λ_u=λ_u.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p and U=Z^×. For u∈U let μ_u, ν_u and λ_u be the preceding actual padicSmoothedMeasure, padicSmoothedNumerator and padicIntrinsicNumerator. These are on D(Z,Z), D(Z,Z) and D(U,Z), respectively. Let σ_u be native raw pushforward by z↦uz, and j the native pushforward U→Z. On D(U,Z), multiplication is the exact supplier multiplicative convolution and δ_u is native Dirac. No completed-algebra or localization identification is assumed.

**Construction or proof outline**

- The intrinsic cocycle at (u,−1) and λ_(−1)=0 gives λ_(−u)=λ_u. At (−1,u), it gives λ_(−u)=δ_(−1)*λ_u.
- Compare the two identities in the existing integral convolution ring. This can equivalently be transported from ambient evenness through the exact Dirac-action/inclusion comparison.
- At p=2 the sign element is retained. This result does not average using (1+δ_(−1))/2 or assert a product decomposition of the integral unit algebra.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-intrinsic-cocycle
- DirichletPadicLFunctions:L1/padic-intrinsic-numerator
- DirichletPadicLFunctions:L1/padic-numerator-even
- DirichletPadicLFunctions:L1/padic-intrinsic-dirac

**Acceptance**

- All-unit parity is available for the actual fraction once its regular denominator is cleared.

**Tests**

- SuggestedPadicRelationTests.intrinsic_dyadic_even: At p=2, δ_(−1)*λ_u=λ_u for every smoothing unit.
- SuggestedPadicRelationTests.intrinsic_odd_moment: At p=2 every intrinsic numerator has third moment0.

**Sources**

- RJW-published, Remark3.33 and equation3-10, Definition3.34 and Lemma3.36, published129–131/PDF30–32; Proposition4.6, equation4-3 and Proposition4.11, published137–139/PDF38–40. Complete cited pages read28September2026.. Worker decomposition of the all-unit compatibility identities needed before the arithmetic pseudomeasure can be formed. The source does not state these cocycle/reflection adapters separately. The raw cocycle has scalar u, which inverse weighting cancels. Negative-unit boundary values give parity without averaging by2. All generic measure, dilation, inverse-weight and convolution operations are imported from their existing owners.

### All-unit clearing of the arithmetic fraction

DirichletPadicLFunctions:L1/arithmetic-fraction-clearing

Declaration: DirichletPadic.arithmeticFraction_clearing

Kind: lemma. Implementation: unchecked.

If a∈U has value p+1, then for every g∈U, alg(θ_g)·mk′(λ_a,θ_a)=alg(λ_g) in Q.

**Hypotheses**

- p is any prime, including2; Z=Z_p, U=Z^× and M=D(U,Z) with the exact existing multiplicative convolution operations. Commutativity comes from the supplier commutative-convolution theorem. Set Q=FractionRing M, the native localization at nonZeroDivisors M, and δ=the actual supplier diracHom U→*M. PM=Iwasawa.pseudomeasures δ Q is the existing submodule. Write θ_u=δ_u−1 and λ_u=the preceding actual padicIntrinsicNumerator p u. M is not assumed to be a domain and Q is not assumed to be a field.

**Construction or proof outline**

- The supplier proves θ_a∈nonZeroDivisors M from the chosen value a=p+1, including p=2. Construct the fraction with native IsLocalization.mk′ using that actual regularity proof.
- Multiply the desired equality on the left by alg(θ_a). Commute the scalar factors and apply mk′_spec′. Its left side becomes alg(θ_g λ_a), and its right side becomes alg(θ_a λ_g).
- The preceding all-unit cross-numerator identity makes these equal. The image alg(θ_a) is a unit by IsLocalization.map_units, so native IsUnit.mul_right_inj cancels it. The complete scratch lemma verifies this argument for any commutative ring and its total quotient.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-intrinsic-cross
- PadicMeasuresIwasawaAlgebras:L3/regular-one-add-prime-difference
- PadicMeasuresIwasawaAlgebras:L1/dirac-hom
- PadicMeasuresIwasawaAlgebras:L1/commutative-convolution
- mathlib:FractionRing
- mathlib:IsLocalization.mk'
- mathlib:IsLocalization.mk'_spec'
- mathlib:IsLocalization.map_units
- mathlib:IsUnit.mul_right_inj

**Acceptance**

- No regularity is required of θ_g. The quantified membership witness is the actual integral λ_g.

**Tests**

- SuggestedActualPseudoTests.clearing_identity: For g=1 both sides vanish, since θ_1=0 and λ_1=0.
- SuggestedActualPseudoTests.clearing_negative: For g=−1 the fraction is annihilated by alg(δ_(−1)−1), since λ_(−1)=0.

**Sources**

- RJW-published, Definition3.34 and Lemma3.36, published130–131/PDF31–32; Theorem4.1, Definitions4.9–4.10 and Proposition4.11, published136–139/PDF37–40. Complete cited pages read28September2026.. Worker decomposition of the arithmetic construction on the actual unit-measure ring. The source writes its fraction using a generator. Here a with value p+1 need not generate the whole unit group: supplied regularity and the preceding all-unit cross identity prove membership directly. The native total quotient and the supplier pseudomeasure submodule are reused; no integral-domain, full-generator or completed-algebra identification is assumed.

### The arithmetic Kubota–Leopoldt pseudomeasure

DirichletPadicLFunctions:L1/arithmetic-pseudomeasure

Declaration: DirichletPadic.kubotaLeopoldtPseudomeasure

Kind: construction. Implementation: unchecked.

Choose a∈U with value p+1. Define ζ_p as mk′(λ_a,θ_a), with its all-unit membership proof, in the existing PM.

**Hypotheses**

- p is any prime, including2; Z=Z_p, U=Z^× and M=D(U,Z) with the exact existing multiplicative convolution operations. Commutativity comes from the supplier commutative-convolution theorem. Set Q=FractionRing M, the native localization at nonZeroDivisors M, and δ=the actual supplier diracHom U→*M. PM=Iwasawa.pseudomeasures δ Q is the existing submodule. Write θ_u=δ_u−1 and λ_u=the preceding actual padicIntrinsicNumerator p u. M is not assumed to be a domain and Q is not assumed to be a field.

**Construction or proof outline**

- Use the supplier exists_one_add_prime_unit to choose a; its supplied regularity makes the native fraction well-defined. For each g the preceding clearing equality gives the integral witness λ_g required by mem_pseudomeasures_iff.
- Package that fraction and membership proof into the existing pseudomeasure submodule. This is an arithmetic element, not a new generic carrier, and its measure ring keeps the inherited convolution operations.
- For any second choice a with the same value p+1, the cross-numerator identity and native mk′_eq_iff_eq identify the two fractions. Thus the coercion API describes the chosen object using every such a. Independence for arbitrary regular smoothing parameters is promoted below.
- Constructor tests use the promoted numerator comparison and existing λ boundary/natural/moment formulas. Nonzeroness follows because λ_a evaluated on x² is (1−p)(1−(p+1)²)/12≠0 in Q_p. If ζ_p were zero its cleared numerator λ_a would be zero by native injectivity. This argument uses a field only for the scalar moment, not for M or Q.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-fraction-clearing
- DirichletPadicLFunctions:L1/padic-intrinsic-numerator
- DirichletPadicLFunctions:L1/padic-intrinsic-natural
- DirichletPadicLFunctions:L1/padic-intrinsic-moments
- PadicMeasuresIwasawaAlgebras:L3/one-add-prime-unit
- PadicMeasuresIwasawaAlgebras:L3/pseudomeasures
- PadicMeasuresIwasawaAlgebras:L3/pseudomeasure-membership
- mathlib:IsLocalization.mk'_eq_iff_eq
- mathlib:IsFractionRing.injective

**Acceptance**

- The construction belongs to the actual supplier pseudomeasure submodule. No topological generator of the full unit group is chosen.

**API**

- DirichletPadic.kubotaLeopoldtPseudomeasure_coe: For any a with value p+1, the underlying element of Q is mk′(λ_a,θ_a).
- DirichletPadic.kubotaLeopoldtPseudomeasure_clearing: alg(θ_g)ζ_p=alg(λ_g) for every unit g; promoted below.
- DirichletPadic.kubotaLeopoldtPseudomeasure_numerator: The existing supplier numerator at g is exactly λ_g; promoted below.
- DirichletPadic.kubotaLeopoldtPseudomeasure_eq_fraction: Every u whose θ_u is regular represents ζ_p as mk′(λ_u,θ_u); promoted below.
- DirichletPadic.kubotaLeopoldtPseudomeasure_unique: The full family of specified arithmetic numerators uniquely determines ζ_p; promoted below.
- DirichletPadic.kubotaLeopoldtPseudomeasure_even: δ_(−1) acts trivially on ζ_p, including p=2; promoted below.

**Tests**

- SuggestedActualPseudoTests.constructor_identity_numerator: The supplier numerator of ζ_p at1 is0.
- SuggestedActualPseudoTests.constructor_sign_numerator: The supplier numerator at−1 is0, also at p=2.
- SuggestedActualPseudoTests.constructor_integral_numerator: At a with value p+1 its numerator equals the earlier intrinsicSmoothedNumerator p (p+1).
- SuggestedActualPseudoTests.constructor_not_zero: ζ_p≠0 for every prime, since its a=p+1 numerator has nonzero second moment.

**Uses**

- Theorem4.1 and Definition4.10: Provide the actual arithmetic element from integral smoothing numerators and clear every unit difference.
- Positive interpolation and uniqueness: Evaluate the same pseudomeasure on power characters after checking a nonzero denominator; still to be extracted.
- Constant term of the Eisenstein family: Supply the arithmetic zeta pseudomeasure whose x-twist, divided by 2 in the localized algebra, gives the constant coefficient, pending the explicit completed-algebra comparison and remaining family construction.

**Sources**

- RJW-published, Definition3.34 and Lemma3.36, published130–131/PDF31–32; Theorem4.1, Definitions4.9–4.10 and Proposition4.11, published136–139/PDF37–40. Complete cited pages read28September2026.. Worker decomposition of the arithmetic construction on the actual unit-measure ring. The source writes its fraction using a generator. Here a with value p+1 need not generate the whole unit group: supplied regularity and the preceding all-unit cross identity prove membership directly. The native total quotient and the supplier pseudomeasure submodule are reused; no integral-domain, full-generator or completed-algebra identification is assumed.

### Clearing every unit difference of the arithmetic pseudomeasure

DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-clearing

Declaration: DirichletPadic.kubotaLeopoldtPseudomeasure_clearing

Kind: lemma. Implementation: unchecked.

For every g∈U, alg(θ_g)ζ_p=alg(λ_g) in Q.

**Hypotheses**

- p is any prime, including2; Z=Z_p, U=Z^× and M=D(U,Z) with the exact existing multiplicative convolution operations. Commutativity comes from the supplier commutative-convolution theorem. Set Q=FractionRing M, the native localization at nonZeroDivisors M, and δ=the actual supplier diracHom U→*M. PM=Iwasawa.pseudomeasures δ Q is the existing submodule. Write θ_u=δ_u−1 and λ_u=the preceding actual padicIntrinsicNumerator p u. M is not assumed to be a domain and Q is not assumed to be a field.

**Construction or proof outline**

- Choose a with value p+1 and rewrite the underlying ζ_p using its coercion API.
- Apply arithmeticFraction_clearing for this a and the arbitrary g. In particular, the identity and sign units are valid clearing indices even though their differences cannot serve as regular denominators.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-pseudomeasure
- DirichletPadicLFunctions:L1/arithmetic-fraction-clearing
- PadicMeasuresIwasawaAlgebras:L3/one-add-prime-unit

**Acceptance**

- Every numerator is integral by construction, without interpreting ζ_p as an integral measure.

**Tests**

- SuggestedActualPseudoTests.cleared_difference_zero: alg(θ_1)ζ_p=0.
- SuggestedActualPseudoTests.sign_annihilator: alg(δ_(−1)−1)ζ_p=0.

**Sources**

- RJW-published, Definition3.34 and Lemma3.36, published130–131/PDF31–32; Theorem4.1, Definitions4.9–4.10 and Proposition4.11, published136–139/PDF37–40. Complete cited pages read28September2026.. Worker decomposition of the arithmetic construction on the actual unit-measure ring. The source writes its fraction using a generator. Here a with value p+1 need not generate the whole unit group: supplied regularity and the preceding all-unit cross identity prove membership directly. The native total quotient and the supplier pseudomeasure submodule are reused; no integral-domain, full-generator or completed-algebra identification is assumed.

### The arithmetic numerator agrees with the supplier numerator

DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-numerator

Declaration: DirichletPadic.kubotaLeopoldtPseudomeasure_numerator

Kind: comparison. Implementation: unchecked.

For every g∈U, Iwasawa.numerator δ Q g ζ_p=λ_g in M.

**Hypotheses**

- p is any prime, including2; Z=Z_p, U=Z^× and M=D(U,Z) with the exact existing multiplicative convolution operations. Commutativity comes from the supplier commutative-convolution theorem. Set Q=FractionRing M, the native localization at nonZeroDivisors M, and δ=the actual supplier diracHom U→*M. PM=Iwasawa.pseudomeasures δ Q is the existing submodule. Write θ_u=δ_u−1 and λ_u=the preceding actual padicIntrinsicNumerator p u. M is not assumed to be a domain and Q is not assumed to be a field.

**Construction or proof outline**

- The exact supplier numerator specification sends its numerator at g to alg(θ_g)ζ_p.
- The arithmetic clearing lemma identifies the same expression with alg(λ_g). Use native IsFractionRing.injective for the localization at non-zero-divisors to conclude equality in M.
- This comparison transports the preceding intrinsic moments unchanged. In particular its second moment is (1−p)(1−g²)/12 in Q_p and its numerator at−1 is zero.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-clearing
- DirichletPadicLFunctions:L1/padic-intrinsic-moments
- DirichletPadicLFunctions:L1/padic-intrinsic-numerator
- PadicMeasuresIwasawaAlgebras:L3/cleared-numerator
- PadicMeasuresIwasawaAlgebras:L3/cleared-numerator-spec
- mathlib:IsFractionRing.injective

**Acceptance**

- The two numerator operations agree as actual measures, not merely on a finite set of tests.

**Tests**

- SuggestedActualPseudoTests.numerator_moment_second: The numerator at g evaluated on x² is (1−p)(1−g²)/12 in Q_p.
- SuggestedActualPseudoTests.numerator_negative_zero: The supplier numerator at−1 is exactly zero in the integral measure ring.

**Sources**

- RJW-published, Definition3.34 and Lemma3.36, published130–131/PDF31–32; Theorem4.1, Definitions4.9–4.10 and Proposition4.11, published136–139/PDF37–40. Complete cited pages read28September2026.. Worker decomposition of the arithmetic construction on the actual unit-measure ring. The source writes its fraction using a generator. Here a with value p+1 need not generate the whole unit group: supplied regularity and the preceding all-unit cross identity prove membership directly. The native total quotient and the supplier pseudomeasure submodule are reused; no integral-domain, full-generator or completed-algebra identification is assumed.

### Independence of every regular smoothing parameter

DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-regular-parameter

Declaration: DirichletPadic.kubotaLeopoldtPseudomeasure_eq_fraction

Kind: comparison. Implementation: unchecked.

For every u∈U with θ_u∈nonZeroDivisors M, ζ_p=mk′(λ_u,θ_u) in Q.

**Hypotheses**

- p is any prime, including2; Z=Z_p, U=Z^× and M=D(U,Z) with the exact existing multiplicative convolution operations. Commutativity comes from the supplier commutative-convolution theorem. Set Q=FractionRing M, the native localization at nonZeroDivisors M, and δ=the actual supplier diracHom U→*M. PM=Iwasawa.pseudomeasures δ Q is the existing submodule. Write θ_u=δ_u−1 and λ_u=the preceding actual padicIntrinsicNumerator p u. M is not assumed to be a domain and Q is not assumed to be a field.

**Construction or proof outline**

- Write ζ_p as its fraction for a with value p+1. The preceding cross identity gives θ_u λ_a=θ_a λ_u.
- Apply native mk′_eq_iff_eq after the algebra map to conclude equality with mk′(λ_u,θ_u). This requires only the two supplied regularity proofs.
- The torsion counterexample retains the regularity hypothesis: (δ_(−1)−1)(δ_(−1)+1)=0 by the Dirac homomorphism. The second factor is nonzero because evaluating it on1 gives2≠0 in Z_p, including p=2. Thus θ_(−1) is not regular. Identity and torsion still index valid cleared numerators.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-pseudomeasure
- DirichletPadicLFunctions:L1/padic-intrinsic-cross
- PadicMeasuresIwasawaAlgebras:L1/dirac-hom
- PadicMeasuresIwasawaAlgebras:L1/convolution-algebra
- PadicMeasuresIwasawaAlgebras:L1/convolution-evaluation
- mathlib:AbstractMeasure.dirac_apply
- mathlib:IsLocalization.mk'_eq_iff_eq

**Acceptance**

- Neither u≠1 nor the existence of a numerator implies regularity. No fraction with a torsion denominator is formed.

**Tests**

- SuggestedActualPseudoTests.regular_parameter_two_choices: The fractions for any two regular parameters u,v are equal.
- SuggestedActualPseudoTests.torsion_is_not_regular: δ_(−1)−1 is not a non-zero-divisor for any prime, including2.

**Sources**

- RJW-published, Definition3.34 and Lemma3.36, published130–131/PDF31–32; Theorem4.1, Definitions4.9–4.10 and Proposition4.11, published136–139/PDF37–40. Complete cited pages read28September2026.. Worker decomposition of the arithmetic construction on the actual unit-measure ring. The source writes its fraction using a generator. Here a with value p+1 need not generate the whole unit group: supplied regularity and the preceding all-unit cross identity prove membership directly. The native total quotient and the supplier pseudomeasure submodule are reused; no integral-domain, full-generator or completed-algebra identification is assumed.

### Uniqueness from the arithmetic numerators

DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-unique

Declaration: DirichletPadic.kubotaLeopoldtPseudomeasure_unique

Kind: theorem. Implementation: unchecked.

If z∈PM has numerator λ_g for every g∈U, then z=ζ_p.

**Hypotheses**

- p is any prime, including2; Z=Z_p, U=Z^× and M=D(U,Z) with the exact existing multiplicative convolution operations. Commutativity comes from the supplier commutative-convolution theorem. Set Q=FractionRing M, the native localization at nonZeroDivisors M, and δ=the actual supplier diracHom U→*M. PM=Iwasawa.pseudomeasures δ Q is the existing submodule. Write θ_u=δ_u−1 and λ_u=the preceding actual padicIntrinsicNumerator p u. M is not assumed to be a domain and Q is not assumed to be a field.

**Construction or proof outline**

- Choose a with value p+1. The supplier numerator specification, the assumed numerator at a and the arithmetic clearing identity give alg(θ_a)z=alg(θ_a)ζ_p.
- The regularity of θ_a makes its image a unit. Cancel it using IsUnit.mul_right_inj and conclude equality of the underlying total-quotient elements, then equality in the submodule.
- Only the single numerator at such an a is needed, as the test records. Uniqueness from interpolation values is a subsequent task and is not assumed here.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-clearing
- PadicMeasuresIwasawaAlgebras:L3/cleared-numerator-spec
- PadicMeasuresIwasawaAlgebras:L3/one-add-prime-unit
- PadicMeasuresIwasawaAlgebras:L3/regular-one-add-prime-difference
- mathlib:IsLocalization.map_units
- mathlib:IsUnit.mul_right_inj

**Acceptance**

- The cancellation takes place in Q using the image of a regular element, not by asserting Q is a domain.

**Tests**

- SuggestedActualPseudoTests.uniqueness_one_numerator: A single matching numerator at a with value p+1 already forces z=ζ_p.

**Sources**

- RJW-published, Definition3.34 and Lemma3.36, published130–131/PDF31–32; Theorem4.1, Definitions4.9–4.10 and Proposition4.11, published136–139/PDF37–40. Complete cited pages read28September2026.. Worker decomposition of the arithmetic construction on the actual unit-measure ring. The source writes its fraction using a generator. Here a with value p+1 need not generate the whole unit group: supplied regularity and the preceding all-unit cross identity prove membership directly. The native total quotient and the supplier pseudomeasure submodule are reused; no integral-domain, full-generator or completed-algebra identification is assumed.

### Integral evenness of the arithmetic pseudomeasure

DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-even

Declaration: DirichletPadic.kubotaLeopoldtPseudomeasure_even

Kind: theorem. Implementation: unchecked.

δ_(−1)•ζ_p=ζ_p in PM for every prime p.

**Hypotheses**

- p is any prime, including2; Z=Z_p, U=Z^× and M=D(U,Z) with the exact existing multiplicative convolution operations. Commutativity comes from the supplier commutative-convolution theorem. Set Q=FractionRing M, the native localization at nonZeroDivisors M, and δ=the actual supplier diracHom U→*M. PM=Iwasawa.pseudomeasures δ Q is the existing submodule. Write θ_u=δ_u−1 and λ_u=the preceding actual padicIntrinsicNumerator p u. M is not assumed to be a domain and Q is not assumed to be a field.

**Construction or proof outline**

- Write ζ_p as mk′(λ_a,θ_a) for a with value p+1. Its scalar action in the submodule is multiplication by alg(δ_(−1)) in Q.
- Multiply both underlying elements by the unit alg(θ_a), commute factors and apply mk′_spec′. The resulting equality is alg(δ_(−1)λ_a)=alg(λ_a), precisely the preceding integral evenness of λ_a.
- Cancel alg(θ_a), then use subtype extensionality. Equivalently expand the already proved sign clearing identity alg(δ_(−1)−1)ζ_p=0. Neither argument divides by2, so both retain the dyadic sign element.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-pseudomeasure
- DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-clearing
- DirichletPadicLFunctions:L1/padic-intrinsic-even
- PadicMeasuresIwasawaAlgebras:L3/pseudomeasures
- mathlib:IsLocalization.mk'_spec'
- mathlib:IsLocalization.map_units
- mathlib:IsUnit.mul_right_inj

**Acceptance**

- Integral parity does not assert a dyadic plus/minus idempotent decomposition.

**Tests**

- SuggestedActualPseudoTests.even_sign_action: The sign Dirac measure fixes ζ_p for all primes, including2.
- SuggestedActualPseudoTests.identity_scalar_action: The identity Dirac measure acts as the identity on ζ_p.

**Sources**

- RJW-published, Definition3.34 and Lemma3.36, published130–131/PDF31–32; Theorem4.1, Definitions4.9–4.10 and Proposition4.11, published136–139/PDF37–40. Complete cited pages read28September2026.. Worker decomposition of the arithmetic construction on the actual unit-measure ring. The source writes its fraction using a generator. Here a with value p+1 need not generate the whole unit group: supplied regularity and the preceding all-unit cross identity prove membership directly. The native total quotient and the supplier pseudomeasure submodule are reused; no integral-domain, full-generator or completed-algebra identification is assumed.

### Positive Bernoulli moments of the arithmetic pseudomeasure

DirichletPadicLFunctions:L1/arithmetic-positive-bernoulli

Declaration: DirichletPadic.kubotaLeopoldtPseudomeasure_moment

Kind: theorem. Implementation: unchecked.

For every k>0, M_k(ζ_p)=−(1−p^(k−1))·alg_Q,Q_p(B_k/k), equivalently the Q_p-image of r_(p,k).

**Hypotheses**

- p is any prime, including2. Put Z=Z_p, U=Z^×, M=D(U,Z) with the exact existing commutative multiplicative convolution operations, Q=FractionRing M and PM=Iwasawa.pseudomeasures δ Q for the actual Dirac homomorphism. Let ζ_p be the preceding kubotaLeopoldtPseudomeasure p. For k>0 write M_k for the exact supplier positivePseudoMoment p k hk. B_k is the native ordinary Bernoulli convention B_1=−1/2. The rational expression r_(p,k)=−(1−p^(k−1))B_k/k is notation, not a new scalar carrier or definition. Its inclusions into C and Q_p are separate native rational casts.

**Construction or proof outline**

- Choose a∈U with value p+1. The exact supplier positivePseudoMoment_eq expresses M_k(ζ_p) as the kth moment of its numerator at a divided by a^k−1 in Q_p.
- Use the actual numerator comparison to replace the supplier numerator by λ_a, then use the existing all-unit intrinsic moment formula: λ_a(x^k)=(1−p^(k−1))(1−a^k)·alg(B_k/k).
- The supplier proves a^k≠1 in Z for k>0. The injective Z→Q_p inclusion keeps this denominator nonzero. Cancel (1−a^k)/(a^k−1)=−1 in Q_p. The complete native probe verifies the exact scalar identity. No factor k or a^k−1 is inverted in Z.
- At k=1, the Euler factor vanishes. At p=3,k=2 the value is1/6; at p=2,k=4 it is−7/120. These tests detect a sign error when removing the smoothing factor.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-numerator
- DirichletPadicLFunctions:L1/padic-intrinsic-moments
- PadicMeasuresIwasawaAlgebras:L3/actual-positive-pseudomoment
- PadicMeasuresIwasawaAlgebras:L3/one-add-prime-unit
- PadicMeasuresIwasawaAlgebras:L3/one-add-prime-positive-powers
- mathlib:PadicInt.ext
- mathlib:bernoulli_two

**Acceptance**

- Only positive degrees are evaluated. The rational Bernoulli quotient is included into Q_p; no integral scalar inverse is assumed.

**Tests**

- SuggestedInterpolationTests.positive_first_zero: For every prime, M_1(ζ_p)=0.
- SuggestedInterpolationTests.positive_second_ternary: At p=3 the second moment is1/6 in Q_3.
- SuggestedInterpolationTests.positive_fourth_dyadic: At p=2 the fourth moment is−7/120 in Q_2.

**Sources**

- RJW-published, Lemma3.36(iii), published130–131/PDF31–32; Theorem4.1 and Proposition4.11 with its complete proof, published136 and138–139/PDF37 and39–40. Complete cited pages read28September2026.. Worker decomposition of actual arithmetic positive interpolation and uniqueness. Generic positive evaluation and separation are supplied by PMIA. Complex special values are native Mathlib results, compared through one explicit rational value. Existing E4 handles the false unqualified odd-value assertion in the source proof: k=1 uses the zero Euler factor, while ζ(0)=−1/2 is nonzero. No additional finding or verdict is asserted.

### The rational Euler value and complex zeta

DirichletPadicLFunctions:L1/arithmetic-euler-zeta-comparison

Declaration: DirichletPadic.arithmeticEulerValue_complex

Kind: comparison. Implementation: unchecked.

For k>0, the complex image of r_(p,k) equals (1−p^(k−1))riemannZeta(1−k).

**Hypotheses**

- p is any prime, including2. Put Z=Z_p, U=Z^×, M=D(U,Z) with the exact existing commutative multiplicative convolution operations, Q=FractionRing M and PM=Iwasawa.pseudomeasures δ Q for the actual Dirac homomorphism. Let ζ_p be the preceding kubotaLeopoldtPseudomeasure p. For k>0 write M_k for the exact supplier positivePseudoMoment p k hk. B_k is the native ordinary Bernoulli convention B_1=−1/2. The rational expression r_(p,k)=−(1−p^(k−1))B_k/k is notation, not a new scalar carrier or definition. Its inclusions into C and Q_p are separate native rational casts.

**Construction or proof outline**

- Separate k=1 first. Both sides vanish because 1−p^0=0; the raw complex value remains ζ(0)=−1/2. This retains the endpoint correction E4.
- For k>1 apply native riemannZeta_neg_nat_eq_bernoulli′ at k−1. The exponent identity −(k−1)=1−k and (k−1)+1=k give ζ(1−k)=−B′_k/k.
- Since k≠1, native bernoulli_eq_bernoulli′_of_ne_one identifies B′_k with B_k. Multiply by the Euler factor and use native rational casts. The complete scratch proof verifies the statement including all natural-number subtraction and field-cast details.
- This is an arithmetic scalar comparison used by this pseudomeasure, not a new proof of analytic continuation or the native special-value theorem.

**Prerequisites**

- mathlib:riemannZeta_neg_nat_eq_bernoulli'
- mathlib:bernoulli_eq_bernoulli'_of_ne_one
- mathlib:riemannZeta_zero

**Acceptance**

- The assertion is true at k=1 because of the Euler factor, not because ζ(0) vanishes.

**Tests**

- SuggestedInterpolationTests.complex_endpoint_euler: (1−p^0)ζ(0)=0.
- SuggestedInterpolationTests.complex_endpoint_nonzero: The unsmoothed value ζ(0)=−1/2 is nonzero.
- SuggestedInterpolationTests.complex_second_ternary: (1−3)ζ(−1)=1/6.

**Sources**

- RJW-published, Lemma3.36(iii), published130–131/PDF31–32; Theorem4.1 and Proposition4.11 with its complete proof, published136 and138–139/PDF37 and39–40. Complete cited pages read28September2026.. Worker decomposition of actual arithmetic positive interpolation and uniqueness. Generic positive evaluation and separation are supplied by PMIA. Complex special values are native Mathlib results, compared through one explicit rational value. Existing E4 handles the false unqualified odd-value assertion in the source proof: k=1 uses the zero Euler factor, while ζ(0)=−1/2 is nonzero. No additional finding or verdict is asserted.

### Interpolation through a shared rational value

DirichletPadicLFunctions:L1/arithmetic-positive-interpolation

Declaration: DirichletPadic.kubotaLeopoldtPseudomeasure_interpolation

Kind: theorem. Implementation: unchecked.

For every k>0 there is a unique r∈ℚ whose complex image is (1−p^(k−1))ζ(1−k) and whose ℚ_p-image is M_k(ζ_p).

**Hypotheses**

- p is any prime, including2. Put Z=Z_p, U=Z^×, M=D(U,Z) with the exact existing commutative multiplicative convolution operations, Q=FractionRing M and PM=Iwasawa.pseudomeasures δ Q for the actual Dirac homomorphism. Let ζ_p be the preceding kubotaLeopoldtPseudomeasure p. For k>0 write M_k for the exact supplier positivePseudoMoment p k hk. B_k is the native ordinary Bernoulli convention B_1=−1/2. The rational expression r_(p,k)=−(1−p^(k−1))B_k/k is notation, not a new scalar carrier or definition. Its inclusions into C and Q_p are separate native rational casts.

**Construction or proof outline**

- Take the explicit rational r=r_(p,k). The preceding complex comparison proves its first property and the actual Bernoulli moment theorem proves its second after native rational-cast simplification.
- If another rational has both properties, its complex image agrees with this one. Injectivity of the rational map into C makes the rational values equal. This injectivity step is also checked by a complete native scratch lemma.
- The result makes the source interpolation equation precise without any comparison map C→Q_p. At degree1 the unique rational is0; at p=2,k=2 it is1/12.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-positive-bernoulli
- DirichletPadicLFunctions:L1/arithmetic-euler-zeta-comparison

**Acceptance**

- Existence and uniqueness concern a rational scalar included into two fields. The actual positive-pseudomoment operation remains the supplier operation.

**Tests**

- SuggestedInterpolationTests.rational_dyadic_second: The same rational1/12 has complex image (1−2)ζ(−1) and Q_2-image M_2(ζ_2).
- SuggestedInterpolationTests.rational_first_zero: The shared rational at k=1 is0 in both target fields.

**Sources**

- RJW-published, Lemma3.36(iii), published130–131/PDF31–32; Theorem4.1 and Proposition4.11 with its complete proof, published136 and138–139/PDF37 and39–40. Complete cited pages read28September2026.. Worker decomposition of actual arithmetic positive interpolation and uniqueness. Generic positive evaluation and separation are supplied by PMIA. Complex special values are native Mathlib results, compared through one explicit rational value. Existing E4 handles the false unqualified odd-value assertion in the source proof: k=1 uses the zero Euler factor, while ζ(0)=−1/2 is nonzero. No additional finding or verdict is asserted.

### Uniqueness from every positive interpolation value

DirichletPadicLFunctions:L1/arithmetic-interpolation-unique

Declaration: DirichletPadic.kubotaLeopoldtPseudomeasure_unique_of_moments

Kind: theorem. Implementation: unchecked.

If z∈PM satisfies M_k(z)=−(1−p^(k−1))alg(B_k/k) for all k>0, then z=ζ_p.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p, U=Z^×, M=D(U,Z) with the exact existing commutative multiplicative convolution operations, Q=FractionRing M and PM=Iwasawa.pseudomeasures δ Q for the actual Dirac homomorphism. Let ζ_p be the preceding kubotaLeopoldtPseudomeasure p. For k>0 write M_k for the exact supplier positivePseudoMoment p k hk. B_k is the native ordinary Bernoulli convention B_1=−1/2. The rational expression r_(p,k)=−(1−p^(k−1))B_k/k is notation, not a new scalar carrier or definition. Its inclusions into C and Q_p are separate native rational casts.

**Construction or proof outline**

- The actual positive Bernoulli theorem gives the same values for ζ_p. Apply additivity and the supplier M-scalar law at−1 to see that every positive moment of z−ζ_p is zero. The scalar test value of−1 is−1 since the convolution identity is δ_1.
- Invoke the exact supplier pseudomeasure_eq_zero_of_positive_moments on z−ζ_p, then subtract-zero extensionality gives z=ζ_p. No new generic separation theorem is planned.
- Existence is the preceding actual ζ_p, so the typed test states unique existence of an object with these values. If the input interpolation is instead supplied by shared rational values as in the preceding node, their unique complex rational representatives first identify them with r_(p,k), reducing to this hypothesis.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-positive-bernoulli
- DirichletPadicLFunctions:L1/arithmetic-positive-interpolation
- PadicMeasuresIwasawaAlgebras:L3/actual-positive-pseudomoment
- PadicMeasuresIwasawaAlgebras:L3/actual-pseudomoment-separation

**Acceptance**

- All positive degrees are quantified. Evenness or finitely many values alone is not used as a uniqueness criterion.

**Tests**

- SuggestedInterpolationTests.unique_interpolating_object: There exists exactly one actual PM element with all the specified positive Bernoulli moments.

**Sources**

- RJW-published, Lemma3.36(iii), published130–131/PDF31–32; Theorem4.1 and Proposition4.11 with its complete proof, published136 and138–139/PDF37 and39–40. Complete cited pages read28September2026.. Worker decomposition of actual arithmetic positive interpolation and uniqueness. Generic positive evaluation and separation are supplied by PMIA. Complex special values are native Mathlib results, compared through one explicit rational value. Existing E4 handles the false unqualified odd-value assertion in the source proof: k=1 uses the zero Euler factor, while ζ(0)=−1/2 is nonzero. No additional finding or verdict is asserted.

### Vanishing of every odd positive interpolation value

DirichletPadicLFunctions:L1/arithmetic-odd-moments

Declaration: DirichletPadic.kubotaLeopoldtPseudomeasure_odd_moment

Kind: lemma. Implementation: unchecked.

If k is odd, then M_k(ζ_p)=0, including k=1 and p=2.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p, U=Z^×, M=D(U,Z) with the exact existing commutative multiplicative convolution operations, Q=FractionRing M and PM=Iwasawa.pseudomeasures δ Q for the actual Dirac homomorphism. Let ζ_p be the preceding kubotaLeopoldtPseudomeasure p. For k>0 write M_k for the exact supplier positivePseudoMoment p k hk. B_k is the native ordinary Bernoulli convention B_1=−1/2. The rational expression r_(p,k)=−(1−p^(k−1))B_k/k is notation, not a new scalar carrier or definition. Its inclusions into C and Q_p are separate native rational casts.

**Construction or proof outline**

- Oddness implies k>0, so apply the actual positive Bernoulli formula.
- At k=1 use the zero Euler factor. For odd k>1 use native bernoulli_eq_zero_of_odd. These two cases also give an exact rational scalar proof in the native scratch module.
- This value-level consequence agrees with integral evenness of the actual pseudomeasure; the present proof neither averages by2 nor makes a dyadic idempotent decomposition.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-positive-bernoulli
- DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-even
- mathlib:bernoulli_eq_zero_of_odd

**Acceptance**

- The endpoint is proved by its Euler factor, keeping raw ζ(0) distinct.

**Tests**

- SuggestedInterpolationTests.odd_third_dyadic: M_3(ζ_2)=0.
- SuggestedInterpolationTests.odd_fifth_ternary: M_5(ζ_3)=0.

**Sources**

- RJW-published, Lemma3.36(iii), published130–131/PDF31–32; Theorem4.1 and Proposition4.11 with its complete proof, published136 and138–139/PDF37 and39–40. Complete cited pages read28September2026.. Worker decomposition of actual arithmetic positive interpolation and uniqueness. Generic positive evaluation and separation are supplied by PMIA. Complex special values are native Mathlib results, compared through one explicit rational value. Existing E4 handles the false unqualified odd-value assertion in the source proof: k=1 uses the zero Euler factor, while ζ(0)=−1/2 is nonzero. No additional finding or verdict is asserted.

### The norm of Euler–Bernoulli interpolation values

DirichletPadicLFunctions:L1/arithmetic-euler-value-norm

Declaration: DirichletPadic.arithmeticEulerValue_norm

Kind: lemma. Implementation: unchecked.

If k>0 and p−1 divides2k, then ‖r_(p,2k)‖=p/‖2k‖ in Q_p.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p, U=Z^×, M=D(U,Z) with the exact inherited commutative convolution operations, Q=FractionRing M and PM=Iwasawa.pseudomeasures δ Q. Let ζ_p be the actual kubotaLeopoldtPseudomeasure p and M_n its supplied positivePseudoMoment at degree n>0. B_n is the native ordinary Bernoulli number. Write r_(p,n)=−(1−p^(n−1))B_n/n in ℚ as notation for the already used rational scalar, with its separate native inclusion into Q_p. Norms in the statements are real-valued norms on Q_p.

**Construction or proof outline**

- Native Bernoulli.padicValRat_bernoulli gives v_p(B_(2k))=−1. This implies B_(2k)≠0 because native padicValRat p 0=0. The native rational-cast valuation and norm formula therefore give ‖B_(2k)‖=p.
- Since2k−1>0, the native prime-power norm is strictly less than1. Compare the norms of1 and−p^(2k−1) and use native Padic.add_eq_max_of_ne to obtain ‖1−p^(2k−1)‖=1.
- Include the rational expression into Q_p and use norm multiplicativity, negation and division. Its norm is1·p/‖2k‖. The complete native probe verifies Bernoulli norm, Euler-factor norm and this quotient formula without placeholders.
- The denominator2k is nonzero in the characteristic-zero field Q_p, but need not be a unit in Z_p. The tests explicitly retain its dyadic and higher p-power contributions.

**Prerequisites**

- mathlib:Bernoulli.padicValRat_bernoulli
- mathlib:Padic.valuation_ratCast
- mathlib:Padic.norm_eq_zpow_neg_valuation
- mathlib:Padic.norm_p_pow
- mathlib:Padic.add_eq_max_of_ne

**Acceptance**

- The divisibility condition p−1|2k is required for the cited Bernoulli valuation. The degree1 zero Euler factor is outside this positive-even-degree statement.

**Tests**

- SuggestedNonintegralityTests.scalar_dyadic_second: At p=2 and degree2 the rational value1/12 has2-adic norm4.
- SuggestedNonintegralityTests.scalar_ternary_sixth: At p=3 and degree6 the rational interpolation value has norm9.
- SuggestedNonintegralityTests.scalar_quinary_fourth: At p=5 and degree4 the rational interpolation value has norm5.

**Sources**

- RJW-published, Definitions3.7–3.8 and the integral-measure criterion, published119–120/PDF20–21; Theorem4.1 and Proposition4.11, published136 and138–139/PDF37 and39–40. Complete119–121 pages freshly read28September2026;136–139 retained from the preceding checkpoint.. Worker diagnostic consequence of the source interpolation theorem and the integral-value criterion, using the pinned native von Staudt–Clausen Bernoulli valuation. The source does not separately state this exact norm formula. This checkpoint excludes integral Z_p-valued measures; exclusion of bounded Q_p-valued measures requires unbounded moments and is retained as subsequent work. No new generic measure norm theorem or Bernoulli theorem is planned.

### Large norms of actual arithmetic pseudomoments

DirichletPadicLFunctions:L1/arithmetic-positive-moment-norm

Declaration: DirichletPadic.kubotaLeopoldtPseudomeasure_moment_norm

Kind: theorem. Implementation: unchecked.

If k>0 and p−1 divides2k, then ‖M_(2k)(ζ_p)‖=p/‖2k‖ and p≤‖M_(2k)(ζ_p)‖.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p, U=Z^×, M=D(U,Z) with the exact inherited commutative convolution operations, Q=FractionRing M and PM=Iwasawa.pseudomeasures δ Q. Let ζ_p be the actual kubotaLeopoldtPseudomeasure p and M_n its supplied positivePseudoMoment at degree n>0. B_n is the native ordinary Bernoulli number. Write r_(p,n)=−(1−p^(n−1))B_n/n in ℚ as notation for the already used rational scalar, with its separate native inclusion into Q_p. Norms in the statements are real-valued norms on Q_p.

**Construction or proof outline**

- The preceding positive Bernoulli moment theorem identifies the actual pseudomoment with the Q_p-image of r_(p,2k). Apply the scalar norm formula for the exact equality.
- The native integral norm bound gives ‖2k‖≤1, and the nonzero characteristic-zero integer2k has strictly positive norm. Divide the positive real p by that norm to obtain p/‖2k‖≥p.
- The native probe separately proves this general lower bound; the statement does not replace the actual pseudomoment operation with a scalar model. At p=2 the second and fourth moment norms are4 and8, respectively, stronger than the uniform lower bound2.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-positive-bernoulli
- DirichletPadicLFunctions:L1/arithmetic-euler-value-norm
- mathlib:Padic.norm_int_le_one

**Acceptance**

- These are actual admissible positive evaluations. No value at the trivial power character is asserted.

**Tests**

- SuggestedNonintegralityTests.moment_dyadic_second: The actual second pseudomoment at p=2 has norm4.
- SuggestedNonintegralityTests.moment_dyadic_fourth: The actual fourth pseudomoment at p=2 has norm8.
- SuggestedNonintegralityTests.moment_ternary_second: The actual second pseudomoment at p=3 has norm3.

**Sources**

- RJW-published, Definitions3.7–3.8 and the integral-measure criterion, published119–120/PDF20–21; Theorem4.1 and Proposition4.11, published136 and138–139/PDF37 and39–40. Complete119–121 pages freshly read28September2026;136–139 retained from the preceding checkpoint.. Worker diagnostic consequence of the source interpolation theorem and the integral-value criterion, using the pinned native von Staudt–Clausen Bernoulli valuation. The source does not separately state this exact norm formula. This checkpoint excludes integral Z_p-valued measures; exclusion of bounded Q_p-valued measures requires unbounded moments and is retained as subsequent work. No new generic measure norm theorem or Bernoulli theorem is planned.

### The arithmetic pseudomeasure is not integral

DirichletPadicLFunctions:L1/arithmetic-not-integral

Declaration: DirichletPadic.kubotaLeopoldtPseudomeasure_not_integral

Kind: theorem. Implementation: unchecked.

There is no μ∈M with Iwasawa.integral δ Q μ=ζ_p.

**Hypotheses**

- p is any prime, including2. Put Z=Z_p, U=Z^×, M=D(U,Z) with the exact inherited commutative convolution operations, Q=FractionRing M and PM=Iwasawa.pseudomeasures δ Q. Let ζ_p be the actual kubotaLeopoldtPseudomeasure p and M_n its supplied positivePseudoMoment at degree n>0. B_n is the native ordinary Bernoulli number. Write r_(p,n)=−(1−p^(n−1))B_n/n in ℚ as notation for the already used rational scalar, with its separate native inclusion into Q_p. Norms in the statements are real-valued norms on Q_p.

**Construction or proof outline**

- Suppose such an integral μ exists. Choose k=p−1, positive by primality. Then p−1 divides2k, so the preceding norm bound gives p≤‖M_(2k)(ζ_p)‖, with p>1.
- The supplier positivePseudoMoment_integral identifies this value with the scalar inclusion of μ(u↦u^(2k)). The test is a native Z-valued continuous function and μ has Z-valued output. Native PadicInt.norm_le_one, transported by its norm_def, gives the opposing bound≤1.
- The contradiction p≤1 proves nonexistence. This uniform choice works for p=2, where k=1 and the witness degree is2. It does not require division by2 or an odd-prime restriction.
- For the range test, an equality alg(μ)=ζ_p in Q would, by the exact supplier integral-inclusion-value and subtype extensionality, give the excluded equality in PM. Thus the underlying fraction is also outside Set.range(algebraMap M Q).

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-positive-moment-norm
- PadicMeasuresIwasawaAlgebras:L3/actual-positive-pseudomoment
- PadicMeasuresIwasawaAlgebras:L3/integral-pseudomeasure
- PadicMeasuresIwasawaAlgebras:L3/integral-inclusion-value
- mathlib:PadicInt.norm_le_one
- mathlib:PadicInt.norm_def

**Acceptance**

- This excludes Z_p-valued integral measures for every prime. A finite norm obstruction does not yet exclude bounded Q_p-valued measures; that requires a separate unboundedness argument.

**Tests**

- SuggestedNonintegralityTests.not_integral_each_measure: For every actual integral unit measure μ, its supplier integral inclusion differs from ζ_p.
- SuggestedNonintegralityTests.not_in_integral_range: The underlying total-quotient element of ζ_p is outside the range of algebraMap M Q.

**Sources**

- RJW-published, Definitions3.7–3.8 and the integral-measure criterion, published119–120/PDF20–21; Theorem4.1 and Proposition4.11, published136 and138–139/PDF37 and39–40. Complete119–121 pages freshly read28September2026;136–139 retained from the preceding checkpoint.. Worker diagnostic consequence of the source interpolation theorem and the integral-value criterion, using the pinned native von Staudt–Clausen Bernoulli valuation. The source does not separately state this exact norm formula. This checkpoint excludes integral Z_p-valued measures; exclusion of bounded Q_p-valued measures requires unbounded moments and is retained as subsequent work. No new generic measure norm theorem or Bernoulli theorem is planned.

### An explicit sequence of growing arithmetic moments

DirichletPadicLFunctions:L1/arithmetic-growing-moments

Declaration: DirichletPadic.kubotaLeopoldtPseudomeasure_growing_moments

Kind: theorem. Implementation: unchecked.

For every r≥0, p^(r+1)≤‖M_(n_r)(ζ_p)‖, with n_r=2(p−1)p^r>0.

**Hypotheses**

- p is any prime, including2. Let Z=Z_p, U=Z^× and K=Q_p with their native topologies. Let ζ_p be the preceding actual arithmetic pseudomeasure and M_n its existing positivePseudoMoment at n>0. For r≥0 put n_r=2(p−1)p^r, as notation for a natural number, not a new definition. On the native measure carrier D(U,K), t_n is the K-valued continuous function u↦u^n. U is compact by native Z_p compactness and the existing topological-units compactness instance. For μ∈D(U,K), L_μ=AbstractMeasure.toCLMEquiv μ is the existing continuous linear functional with its native operator norm; no norm or topology is imposed on the weak measure carrier itself.

**Construction or proof outline**

- Use the preceding exact moment norm formula at k=(p−1)p^r. Primality gives k>0, and p−1 divides2k, so the norm is p/‖2(p−1)p^r‖.
- The native norm of the integer2(p−1) is at most1. Multiplicativity and the native p-power norm give ‖2(p−1)p^r‖≤p^(−r). This denominator norm is strictly positive because the integer is nonzero in K.
- Multiply the claimed real inequality by that positive denominator norm. The upper bound makes the left side at most p^(r+1)p^(−r)=p. This proves the stated lower bound. Complete native scratch lemmas verify the denominator estimate and real division step.
- The argument retains p=2. There the exact norms are larger because the factor2 itself has norm1/2; for r=1 the degree is4 and the norm is8.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-positive-moment-norm
- mathlib:Padic.norm_int_le_one
- mathlib:Padic.norm_p_pow

**Acceptance**

- The sequence consists of positive even degrees for every prime. No asymptotic Bernoulli estimate is substituted for the preceding exact valuation result.

**Tests**

- SuggestedUnboundedTests.growing_dyadic_degree_four: At p=2,r=1, the degree4 moment has norm8, exceeding the lower bound4.
- SuggestedUnboundedTests.growing_ternary_degree_twelve: At p=3,r=1, the degree12 moment has norm9, equal to the lower bound9.

**Sources**

- RJW-published, Definitions3.7–3.8 and the bounded continuous-dual discussion, published119–120/PDF20–21; Theorem4.1 and Proposition4.11, published136 and138–139/PDF37 and39–40. Complete readings retained from the28September2026 predecessor checkpoints.. Worker consequence of the interpolation formula and the source continuous-dual definition of a field-valued measure. Previous exact norm formulas give a growing sequence, which contradicts the native operator-norm bound. This distinguishes a pseudomeasure from any bounded Q_p-valued measure without asserting a completed-algebra comparison, a value at the trivial character or an analytic-family construction.

### Positive arithmetic moments are unbounded

DirichletPadicLFunctions:L1/arithmetic-unbounded-moments

Declaration: DirichletPadic.kubotaLeopoldtPseudomeasure_unbounded_moments

Kind: theorem. Implementation: unchecked.

For every B∈R there exist a positive natural n and its positivity proof with B<‖M_n(ζ_p)‖.

**Hypotheses**

- p is any prime, including2. Let Z=Z_p, U=Z^× and K=Q_p with their native topologies. Let ζ_p be the preceding actual arithmetic pseudomeasure and M_n its existing positivePseudoMoment at n>0. For r≥0 put n_r=2(p−1)p^r, as notation for a natural number, not a new definition. On the native measure carrier D(U,K), t_n is the K-valued continuous function u↦u^n. U is compact by native Z_p compactness and the existing topological-units compactness instance. For μ∈D(U,K), L_μ=AbstractMeasure.toCLMEquiv μ is the existing continuous linear functional with its native operator norm; no norm or topology is imposed on the weak measure carrier itself.

**Construction or proof outline**

- Primality gives p>1 as a real number. The native ordered-semiring power-unboundedness theorem supplies r with B<p^(r+1), increasing the chosen exponent by one if needed.
- Take n=n_r and use the preceding explicit lower bound to obtain B<p^(r+1)≤‖M_n(ζ_p)‖.
- This quantifies over every real bound, unlike a finite collection of large norm examples. The complete native power-growth lemma checks the real Archimedean interface; finite controls are only illustrations.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-growing-moments
- mathlib:pow_unbounded_of_one_lt

**Acceptance**

- Unboundedness is asserted for norms of positive admissible evaluations, without choosing or evaluating the trivial character.

**Tests**

- SuggestedUnboundedTests.dyadic_exceeds_one_hundred: For p=2 some positive moment has norm greater than100.
- SuggestedUnboundedTests.ternary_exceeds_one_hundred: For p=3 some positive moment has norm greater than100.

**Sources**

- RJW-published, Definitions3.7–3.8 and the bounded continuous-dual discussion, published119–120/PDF20–21; Theorem4.1 and Proposition4.11, published136 and138–139/PDF37 and39–40. Complete readings retained from the28September2026 predecessor checkpoints.. Worker consequence of the interpolation formula and the source continuous-dual definition of a field-valued measure. Previous exact norm formulas give a growing sequence, which contradicts the native operator-norm bound. This distinguishes a pseudomeasure from any bounded Q_p-valued measure without asserting a completed-algebra comparison, a value at the trivial character or an analytic-family construction.

### No bounded field-valued measure has these moments

DirichletPadicLFunctions:L1/arithmetic-no-field-measure

Declaration: DirichletPadic.kubotaLeopoldtPseudomeasure_no_field_measure

Kind: theorem. Implementation: unchecked.

There is no μ∈D(U,K) such that μ(t_n)=M_n(ζ_p) for every n>0.

**Hypotheses**

- p is any prime, including2. Let Z=Z_p, U=Z^× and K=Q_p with their native topologies. Let ζ_p be the preceding actual arithmetic pseudomeasure and M_n its existing positivePseudoMoment at n>0. For r≥0 put n_r=2(p−1)p^r, as notation for a natural number, not a new definition. On the native measure carrier D(U,K), t_n is the K-valued continuous function u↦u^n. U is compact by native Z_p compactness and the existing topological-units compactness instance. For μ∈D(U,K), L_μ=AbstractMeasure.toCLMEquiv μ is the existing continuous linear functional with its native operator norm; no norm or topology is imposed on the weak measure carrier itself.

**Construction or proof outline**

- Suppose such a native field-valued measure exists. For every u∈U the norm of its value in K is at most1, since it comes from Z. Therefore ‖u^n‖≤1 for every n, and native ContinuousMap.norm_le on compact U gives ‖t_n‖≤1.
- Use the existing toCLMEquiv to view μ as L_μ. Native ContinuousLinearMap.le_opNorm_of_le gives ‖μ(t_n)‖≤‖L_μ‖·1=‖L_μ‖. The complete scratch proof verifies the bound for every degree, with the native compact-open/supremum-norm structures.
- Apply arithmetic moment unboundedness with B=‖L_μ‖. The matching moment at the supplied positive degree simultaneously has norm greater than and at most B, a contradiction.
- This excludes every bounded K-valued measure with those moments, including measures whose norm exceeds1. It does not need to identify K-valued measures with scalar extension of integral ones. The witness-degree test is the classical equivalent that every candidate μ fails at some positive degree.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-unbounded-moments
- mathlib:AbstractMeasure.toCLMEquiv
- mathlib:ContinuousMap.norm_le
- mathlib:ContinuousLinearMap.le_opNorm_of_le
- mathlib:PadicInt.compactSpace
- mathlib:PadicInt.norm_le_one
- mathlib:PadicInt.norm_def
- mathlib:AbstractMeasure.dirac_apply
- DirichletPadicLFunctions:L1/arithmetic-positive-bernoulli

**Acceptance**

- The operator norm belongs to the existing continuous linear functional, not to a newly imposed norm topology on the weak measure carrier. No completed-group-algebra or coefficient-extension identification is used.

**Tests**

- SuggestedUnboundedTests.no_field_measure_witness_degree: Every native K-valued unit measure disagrees with the arithmetic pseudomoments at some positive degree.
- SuggestedUnboundedTests.identity_atom_fails_dyadic_second: The K=Q_2-valued identity atom has second moment1, while the arithmetic value is1/12.
- SuggestedUnboundedTests.sign_atom_fails_ternary_second: The K=Q_3-valued sign atom has second moment1, while the arithmetic value is1/6.

**Sources**

- RJW-published, Definitions3.7–3.8 and the bounded continuous-dual discussion, published119–120/PDF20–21; Theorem4.1 and Proposition4.11, published136 and138–139/PDF37 and39–40. Complete readings retained from the28September2026 predecessor checkpoints.. Worker consequence of the interpolation formula and the source continuous-dual definition of a field-valued measure. Previous exact norm formulas give a growing sequence, which contradicts the native operator-norm bound. This distinguishes a pseudomeasure from any bounded Q_p-valued measure without asserting a completed-algebra comparison, a value at the trivial character or an analytic-family construction.

### Geometric form of the smoothing denominator

DirichletPadicLFunctions:L1/smoothing-geometric-denominator

Declaration: DirichletPadic.smoothingDenominator_geometric

Kind: lemma. Implementation: unchecked.

q_a(T)=Q_a(1+T)=Σ_(i<a)(1+T)^i for every a≥0.

**Hypotheses**

- R is a commutative ring and a is natural. Write Y=1+T, q_a=smoothingDenominator R a and F_a=smoothedSeries R a when the image of a is a unit. The symbols Q_a(U)=Σ_(i<a)U^i and B_a(U)=Σ_(i<a)Σ_(j<i)U^j abbreviate finite polynomial expressions, not new generic carriers or an infinite-series substitution. The empty sums at a=0 are zero.

**Construction or proof outline**

- The earlier denominator-factorization gives Tq_a=Y^a−1. The native finite geometric identity gives TΣ_(i<a)Y^i=Y^a−1, since Y−1=T.
- Native PowerSeries.X_mul_cancel cancels the common factor T. It works over every commutative coefficient ring, without requiring a domain or inverting T.
- The zero parameter is the empty sum. At a=3 the result is1+Y+Y², equal to3+3T+T².

**Prerequisites**

- DirichletPadicLFunctions:L1/denominator-factorization
- mathlib:mul_geom_sum
- mathlib:PowerSeries.X_mul_cancel

**Acceptance**

- This is the same existing binomial denominator, expressed in a finite geometric basis. No new denominator construction is introduced.

**Tests**

- SuggestedAdditiveRationalTests.geometric_denominator_zero: Over Z, q_0=0.
- SuggestedAdditiveRationalTests.geometric_denominator_three: Over Z, q_3=1+(1+T)+(1+T)².

**Sources**

- RJW-published, Proposition4.4, Definition4.5 and Proposition4.6, published137/PDF38; complete page freshly read on28September2026.. Worker finite-polynomial decomposition of the existing arithmetic cancellation equation. It uses finite geometric sums and multiplication-by-T injectivity over an arbitrary commutative ring. The source sign correction E1 is retained; no new finding is made.

### Finite geometric cancellation for the smoothing series

DirichletPadicLFunctions:L1/smoothing-geometric-cancellation

Declaration: DirichletPadic.smoothedSeries_geometric_cancellation

Kind: lemma. Implementation: unchecked.

If the image of a is a unit in R, Q_a(Y)F_a=B_a(Y).

**Hypotheses**

- R is a commutative ring and a is natural. Write Y=1+T, q_a=smoothingDenominator R a and F_a=smoothedSeries R a when the image of a is a unit. The symbols Q_a(U)=Σ_(i<a)U^i and B_a(U)=Σ_(i<a)Σ_(j<i)U^j abbreviate finite polynomial expressions, not new generic carriers or an infinite-series substitution. The empty sums at a=0 are zero.
- The image of a in R is a unit, as required by the existing smoothedSeries.

**Construction or proof outline**

- For each i, the native geometric identity gives TΣ_(j<i)Y^j=Y^i−1. Summing in i gives TB_a(Y)=Q_a(Y)−a.
- Use smoothing-geometric-denominator in the existing series-cleared-equation Tq_a F_a=q_a−a. Both TQ_a(Y)F_a and TB_a(Y) equal Q_a(Y)−a.
- Cancel T with the native PowerSeries.X_mul_cancel. The complete native probe verifies the two finite-sum transformations and cancellation with no domain hypothesis.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothing-geometric-denominator
- DirichletPadicLFunctions:L1/series-cleared-equation
- mathlib:mul_geom_sum
- mathlib:PowerSeries.X_mul_cancel

**Acceptance**

- B_a is only a finite polynomial abbreviation. This equality fixes the arithmetic numerator without relying on a power-series evaluation at a nonzero constant.

**Tests**

- SuggestedAdditiveRationalTests.geometric_cancellation_one: Over Q, the a=1 geometric denominator times F_1 is0.
- SuggestedAdditiveRationalTests.geometric_cancellation_three: Over Q, (1+Y+Y²)F_3=2+Y.

**Sources**

- RJW-published, Proposition4.4, Definition4.5 and Proposition4.6, published137/PDF38; complete page freshly read on28September2026.. Worker finite-polynomial decomposition of the existing arithmetic cancellation equation. It uses finite geometric sums and multiplication-by-T injectivity over an arbitrary commutative ring. The source sign correction E1 is retained; no new finding is made.

### Arithmetic numerator at the identity

DirichletPadicLFunctions:L1/padic-intrinsic-identity

Declaration: DirichletPadic.padicIntrinsicNumerator_one

Kind: lemma. Implementation: unchecked.

The actual integral numerator λ_1 is zero.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z with the supplied actual convolution ring and its commutativity theorem. Q is the native FractionRing M, the total quotient ring of a commutative ring, with its canonical injection i. No domain or field structure on M or Q is assumed.
- j∈C(U,Z) is the existing continuous unit coordinate. λ_u=padicIntrinsicNumerator p u is the existing all-unit integral arithmetic numerator. The notation for scalar multiplication in M is the native Z-module structure.

**Construction or proof outline**

- Promote the existing constructor API with its original suggested signature unchanged. This gives a declaration-sized prerequisite for the weighted-numerator boundary API.
- Choose a with value p+1. The existing all-unit cross relation gives θ_a λ_u=θ_u λ_a. For u=1 the right side is zero by the Dirac identity; for u=−1 it is zero by the existing intrinsic-evenness theorem.
- The supplied regularity of θ_a means its annihilator is zero. Apply this defining property to conclude λ_u=0. This route uses exact named theorem nodes and avoids consuming another unpromoted boundary API.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-intrinsic-cross
- DirichletPadicLFunctions:L1/padic-intrinsic-even
- PadicMeasuresIwasawaAlgebras:L3/one-add-prime-unit
- PadicMeasuresIwasawaAlgebras:L3/regular-one-add-prime-difference

**Acceptance**

- The original declaration, constructor API and earlier tests are preserved. This node exposes the boundary fact as a graph prerequisite.

**Tests**

- SuggestedLocalizedEisensteinTests.inherited_numerator_identity: At p=3 the existing numerator at 1 is zero.

**Sources**

- RJW-published, Lemma4.7 and Proposition4.8, equation4-3, Definitions4.9–4.10 and Proposition4.11 with proof, published137–139/PDF38–40; complete published136–139 freshly read28September2026.. Worker extension of the arithmetic numerator to every unit of Z_p using the preceding integral smoothing family, the existing psi/inverse-weight operators and the exact intrinsic restriction. Generic operators and topologies remain with PMIA and Mathlib. The k=1 Euler factor is retained as zero; E4 and all predecessor findings remain unchanged. No complex kernel for negative parameters is asserted.

### Arithmetic numerator at negative one

DirichletPadicLFunctions:L1/padic-intrinsic-negative-identity

Declaration: DirichletPadic.padicIntrinsicNumerator_neg_one

Kind: lemma. Implementation: unchecked.

The actual integral numerator λ_−1 is zero.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z with the supplied actual convolution ring and its commutativity theorem. Q is the native FractionRing M, the total quotient ring of a commutative ring, with its canonical injection i. No domain or field structure on M or Q is assumed.
- j∈C(U,Z) is the existing continuous unit coordinate. λ_u=padicIntrinsicNumerator p u is the existing all-unit integral arithmetic numerator. The notation for scalar multiplication in M is the native Z-module structure.

**Construction or proof outline**

- Promote the existing constructor API with its original suggested signature unchanged. This gives a declaration-sized prerequisite for the weighted-numerator boundary API.
- Choose a with value p+1. The existing all-unit cross relation gives θ_a λ_u=θ_u λ_a. For u=1 the right side is zero by the Dirac identity; for u=−1 it is zero by the existing intrinsic-evenness theorem.
- The supplied regularity of θ_a means its annihilator is zero. Apply this defining property to conclude λ_u=0. This route uses exact named theorem nodes and avoids consuming another unpromoted boundary API.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-intrinsic-cross
- DirichletPadicLFunctions:L1/padic-intrinsic-even
- PadicMeasuresIwasawaAlgebras:L3/one-add-prime-unit
- PadicMeasuresIwasawaAlgebras:L3/regular-one-add-prime-difference

**Acceptance**

- The original declaration, constructor API and earlier tests are preserved. This node exposes the boundary fact as a graph prerequisite.

**Tests**

- SuggestedLocalizedEisensteinTests.inherited_numerator_negative: At p=3 the existing numerator at −1 is zero.

**Sources**

- RJW-published, Lemma4.7 and Proposition4.8, equation4-3, Definitions4.9–4.10 and Proposition4.11 with proof, published137–139/PDF38–40; complete published136–139 freshly read28September2026.. Worker extension of the arithmetic numerator to every unit of Z_p using the preceding integral smoothing family, the existing psi/inverse-weight operators and the exact intrinsic restriction. Generic operators and topologies remain with PMIA and Mathlib. The k=1 Euler factor is retained as zero; E4 and all predecessor findings remain unchanged. No complex kernel for negative parameters is asserted.

### The translation difference of the smoothing measure

DirichletPadicLFunctions:L1/smoothed-translation-difference

Declaration: DirichletPadic.extend_smoothedMeasure_translation_difference

Kind: lemma. Implementation: unchecked.

(τ_a)_*μ−μ=Σ_(i<a)δ_i−a·δ_0.

**Hypotheses**

- p is any prime, including2. K is a complete ultrametric normed field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. The natural smoothing parameter a satisfies p∤a. Write μ=extendIntegralCoefficients(smoothedMeasure p a ha), the actual previously constructed measure on Z=ℤ_p. τ_i(x)=x+i is the native continuous translation and δ_i the native Dirac measure.
- For m≥0 put q=p^m, red_m=the native PadicInt.toZModPow m bundled using the existing PMIA continuity theorem, and c_m(r)=finiteProjection(red_m)(μ)(r). The residue r lies in native ZMod q, and r.val is its canonical natural representative. This notation introduces no new finite-measure carrier.
- The exact mass formula additionally assumes CharZero K and an explicit native unit u:(ZMod q)ˣ with ↑u=(a:ZMod q). Such u exists by the native unitOfCoprime and p∤a. Put v_r=((↑u⁻¹)r).val. Divisions by2 and q in that formula occur only in K; no integral inversion of p or2 is asserted.
- For inverse moments let n≥0, χ:DirichletCharacter K(p^n), k≥1, and I∈C(Z,K) be the existing native inverse extended by zero, followed by algebraMap. Write M_a=twistedSmoothedMeasure p n χ a ha(I^k). The approximation uses m≥1 and n≤m. The finite sum is S_m=Σ_(r:ZMod q)c_m(r)·primePowerCharacter(p,n,χ)(r.val)·I(r.val)^k.
- The quotient estimate uses d_a=χ(a)·((a:K)⁻¹)^(k−1)−1 and explicitly assumes d_a≠0. Its error is p^(−m)/‖d_a‖. It neither constructs a scalar L-function nor evaluates a pseudomeasure at a character with zero smoothing denominator.

**Construction or proof outline**

- Start with the existing actual measure equality Σ_(i<a)(τ_i)_*μ=Σ_(i<a)Σ_(j<i)δ_j. Apply native pushforward alongτ_1 and subtract the original equality.
- Native map_map, map_apply and continuity of addition identify τ_1∘τ_i withτ_(i+1). The left side telescopes to(τ_a)_*μ−μ.
- Native map_dirac sendsδ_j toδ_(j+1). Each inner difference on the right telescopes toδ_i−δ_0, and summing givesΣ_iδ_i−aδ_0.
- The native additive theorem Finset.sum_range_sub is generated by the indexed declaration Finset.prod_range_div; its full source and generated additive specification were checked. The complete telescope and triangular_telescope proofs verify both exact finite identities.
- At a=2 the right side isδ_1−δ_0. At a=1 both sides vanish. Retain the negative zero-atom term: its sign determines the residue recurrence.

**Prerequisites**

- DirichletPadicLFunctions:L2/smoothed-translation-sum
- mathlib:AbstractMeasure.map_map
- mathlib:AbstractMeasure.map_dirac
- mathlib:AbstractMeasure.map_apply
- mathlib:Finset.prod_range_div

**Acceptance**

- The equality is on the actual arithmetic measure, using only existing pushforward. No additive convolution comparison or general translation operator is defined.

**Tests**

- SuggestedSmoothedResidueTests.ternary_translation_difference: At p=3,a=2, the difference between translation by2 and the actual measure isδ_1−δ_0.

**Sources**

- RJW-published, Finite quotient integration and Proposition3.16, published121–123/PDF22–24; Proposition4.4, Definition4.5 and Proposition4.6, published137/PDF38; the actual character twist in equation(5-1) and the smoothed transform, published140–141/PDF41–42; equation(6-2) and§7, published151–158/PDF52–59.. Worker finite-residue derivation for the actual smoothing measure, followed by quantitative inverse-moment approximation. These specific carry formulas and error estimates are derived here from existing arithmetic translation, finite-projection and boundedness statements; the paper does not state them as separate lemmas. No Bernoulli-distribution carrier, unsmoothed pure-p measure, new projective limit or Coleman primitive is constructed.

### The finite recurrence for smoothing masses

DirichletPadicLFunctions:L1/smoothed-residue-recurrence

Declaration: DirichletPadic.smoothedMeasure_residue_recurrence

Kind: lemma. Implementation: unchecked.

c_m(r−a)−c_m(r)=N_a(r)−a·[r=0], where N_a(r)=#{i<a : i≡r mod q}.

**Hypotheses**

- p is any prime, including2. K is a complete ultrametric normed field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. The natural smoothing parameter a satisfies p∤a. Write μ=extendIntegralCoefficients(smoothedMeasure p a ha), the actual previously constructed measure on Z=ℤ_p. τ_i(x)=x+i is the native continuous translation and δ_i the native Dirac measure.
- For m≥0 put q=p^m, red_m=the native PadicInt.toZModPow m bundled using the existing PMIA continuity theorem, and c_m(r)=finiteProjection(red_m)(μ)(r). The residue r lies in native ZMod q, and r.val is its canonical natural representative. This notation introduces no new finite-measure carrier.
- The exact mass formula additionally assumes CharZero K and an explicit native unit u:(ZMod q)ˣ with ↑u=(a:ZMod q). Such u exists by the native unitOfCoprime and p∤a. Put v_r=((↑u⁻¹)r).val. Divisions by2 and q in that formula occur only in K; no integral inversion of p or2 is asserted.
- For inverse moments let n≥0, χ:DirichletCharacter K(p^n), k≥1, and I∈C(Z,K) be the existing native inverse extended by zero, followed by algebraMap. Write M_a=twistedSmoothedMeasure p n χ a ha(I^k). The approximation uses m≥1 and n≤m. The finite sum is S_m=Σ_(r:ZMod q)c_m(r)·primePowerCharacter(p,n,χ)(r.val)·I(r.val)^k.
- The quotient estimate uses d_a=χ(a)·((a:K)⁻¹)^(k−1)−1 and explicitly assumes d_a≠0. Its error is p^(−m)/‖d_a‖. It neither constructs a scalar L-function nor evaluates a pseudomeasure at a character with zero smoothing denominator.

**Construction or proof outline**

- Evaluate the preceding measure translation difference on the actual continuous indicator of the residue fiber r. The existing finite-projection coefficient theorem identifies its integral with c_m(r).
- Pullback byτ_a is the indicator of r−a because the native reduction is a ring homomorphism. Thus the translated coefficient is c_m(r−a), with the backward residue shift fixed explicitly.
- Eachδ_i contributes1 exactly when its natural residue equals r; the zero Dirac contributes[r=0]. This gives the displayed finite count in K, without any division or characteristic-zero requirement.
- Keep the whole count N_a(r), not only a single indicator. For p=2,a=5,m=1,r=0 it equals3, so the right side is3−5=−2. The case where a exceeds q is an essential carry test.
- At m=0 there is one residue; N_a(0)=a and the difference is0. Total mass, rather than this recurrence alone, fixes that coefficient.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-translation-difference
- PadicMeasuresIwasawaAlgebras:L1/finite-projection-coefficient
- PadicMeasuresIwasawaAlgebras:L1/integer-reduction-continuity
- mathlib:PadicInt.toZModPow
- mathlib:AbstractMeasure.map_apply
- mathlib:AbstractMeasure.dirac_apply

**Acceptance**

- This is a recurrence for the existing finite coefficients. It does not construct a second measure or assert that a recurrence without total mass has a unique solution.

**Tests**

- SuggestedSmoothedResidueTests.multiple_wrap_recurrence: At p=2,a=5 and modulus2, c(1)−c(0)=−2; the count includes all three even indices below5.

**Sources**

- RJW-published, Finite quotient integration and Proposition3.16, published121–123/PDF22–24; Proposition4.4, Definition4.5 and Proposition4.6, published137/PDF38; the actual character twist in equation(5-1) and the smoothed transform, published140–141/PDF41–42; equation(6-2) and§7, published151–158/PDF52–59.. Worker finite-residue derivation for the actual smoothing measure, followed by quantitative inverse-moment approximation. These specific carry formulas and error estimates are derived here from existing arithmetic translation, finite-projection and boundedness statements; the paper does not state them as separate lemmas. No Bernoulli-distribution carrier, unsmoothed pure-p measure, new projective limit or Coleman primitive is constructed.

### Exact residue masses of the smoothing measure

DirichletPadicLFunctions:L1/smoothed-residue-coefficients

Declaration: DirichletPadic.smoothedMeasure_residue

Kind: theorem. Implementation: unchecked.

For CharZero K, c_m(r)=(a−1)/2+(r.val−a v_r)/q.

**Hypotheses**

- p is any prime, including2. K is a complete ultrametric normed field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. The natural smoothing parameter a satisfies p∤a. Write μ=extendIntegralCoefficients(smoothedMeasure p a ha), the actual previously constructed measure on Z=ℤ_p. τ_i(x)=x+i is the native continuous translation and δ_i the native Dirac measure.
- For m≥0 put q=p^m, red_m=the native PadicInt.toZModPow m bundled using the existing PMIA continuity theorem, and c_m(r)=finiteProjection(red_m)(μ)(r). The residue r lies in native ZMod q, and r.val is its canonical natural representative. This notation introduces no new finite-measure carrier.
- The exact mass formula additionally assumes CharZero K and an explicit native unit u:(ZMod q)ˣ with ↑u=(a:ZMod q). Such u exists by the native unitOfCoprime and p∤a. Put v_r=((↑u⁻¹)r).val. Divisions by2 and q in that formula occur only in K; no integral inversion of p or2 is asserted.
- For inverse moments let n≥0, χ:DirichletCharacter K(p^n), k≥1, and I∈C(Z,K) be the existing native inverse extended by zero, followed by algebraMap. Write M_a=twistedSmoothedMeasure p n χ a ha(I^k). The approximation uses m≥1 and n≤m. The finite sum is S_m=Σ_(r:ZMod q)c_m(r)·primePowerCharacter(p,n,χ)(r.val)·I(r.val)^k.
- The quotient estimate uses d_a=χ(a)·((a:K)⁻¹)^(k−1)−1 and explicitly assumes d_a≠0. Its error is p^(−m)/‖d_a‖. It neither constructs a scalar L-function nor evaluates a pseudomeasure at a character with zero smoothing denominator.

**Construction or proof outline**

- Let N=N_a(r), r′=(r−a).val and v′=((↑u⁻¹)(r−a)).val. The division algorithm gives the integer equalities r′−r.val=−a+qN and v′−v_r=−1+q·[r=0]. The second equality uses invertibility of u, so v_r=0 exactly when r=0. These formulas allow arbitrarily many wraps of a around q.
- Substitute both equalities into the proposed coefficient difference. It equals N−a[r=0], exactly the preceding recurrence. The complete native carry_recurrence lemma verifies the field calculation, retaining q≠0.
- Multiplication by u⁻¹ permutes ZMod q. Therefore Σ_r v_r=Σ_r r.val=q(q−1)/2, from the native finite sum of natural representatives. The complete inverse_unit_permutation proof checks the actual residue permutation, and candidate_mass checks that the proposed coefficients sum to(a−1)/2.
- The actual coefficients have this same total. Apply coefficient extension and evaluation at1 to the existing reflection identity μ_a+(−id)_*μ_a=(a−1)δ_0; this gives2μ(1)=a−1. Divide by2 in the characteristic-zero field K and apply finite-projection-mass.
- The difference of the proposed and actual coefficients is invariant under addition by a. Since u is a unit modulo q, every residue is a natural multiple of a; induction along those multiples makes the difference constant. Equal total masses give q times that constant equal to0. The complete cyclic_difference_unique proof verifies this finite argument on native ZMod q and cancels q only using characteristic zero.
- At m=0 the formula is(a−1)/2. At a=1 it is0 on every residue. At p=3,a=2,m=1 the masses are1/2,−1/2,1/2; at p=2,a=3,m=2 they are1,−1,0,1. They obey the existing generic finite-projection refinement theorem.
- Equivalently, the coefficient is(a−1)/2−floor(a v_r/q), since a v_r mod q=r.val. In the dyadic case a is odd and(a−1)/2 is an integer. The displayed equality in K remains valid uniformly and does not place1/2 or1/q inℤ_p.

**Prerequisites**

- DirichletPadicLFunctions:L1/smoothed-residue-recurrence
- DirichletPadicLFunctions:L1/measure-reflection
- PadicMeasuresIwasawaAlgebras:L1/finite-projection-mass
- PadicMeasuresIwasawaAlgebras:L1/finite-projection-refinement
- PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-extension
- PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-pushforward
- mathlib:Nat.Prime.coprime_iff_not_dvd
- mathlib:ZMod.unitOfCoprime
- mathlib:ZMod.card
- mathlib:Fin.prod_univ_eq_prod_range
- mathlib:Finset.sum_range_id_mul_two

**Acceptance**

- The formula refers to the actual finiteProjection of the actual arithmetic measure. Characteristic zero is needed to determine its constant from total mass. The half-integer expression is never interpreted as division in the integral coefficient ring.

**Tests**

- SuggestedSmoothedResidueTests.ternary_three_cells: At p=3,a=2 and modulus3, the actual masses are1/2,−1/2,1/2.
- SuggestedSmoothedResidueTests.dyadic_four_cells: At p=2,a=3 and modulus4, the actual masses are1,−1,0,1.
- SuggestedSmoothedResidueTests.identity_parameter_cells: The actual a=1 smoothing measure has zero mass on every residue fiber.

**Sources**

- RJW-published, Finite quotient integration and Proposition3.16, published121–123/PDF22–24; Proposition4.4, Definition4.5 and Proposition4.6, published137/PDF38; the actual character twist in equation(5-1) and the smoothed transform, published140–141/PDF41–42; equation(6-2) and§7, published151–158/PDF52–59.. Worker finite-residue derivation for the actual smoothing measure, followed by quantitative inverse-moment approximation. These specific carry formulas and error estimates are derived here from existing arithmetic translation, finite-projection and boundedness statements; the paper does not state them as separate lemmas. No Bernoulli-distribution carrier, unsmoothed pure-p measure, new projective limit or Coleman primitive is constructed.

### Character evaluation of every arithmetic numerator

DirichletPadicLFunctions:L1/arithmetic-character-clearing

Declaration: DirichletPadic.kubotaLeopoldt_character_clearing

Kind: lemma. Implementation: unchecked.

For every g∈U, λ_g(κ), included in K, equals d_κ(g) E_κ(ζ_p). This includes κ(g)=1.

**Hypotheses**

- p is any prime, including 2. Z=ℤ_p, K=ℚ_p, U=Zˣ and M=D(U,Z) have their native structures and the supplied commutative multiplicative convolution ring. Q=FractionRing M is a total quotient ring, not assumed to be a field. ζ_p is the existing kubotaLeopoldtPseudomeasure in Iwasawa.pseudomeasures δ Q.
- κ,η:U→Z are native ContinuousMonoidHom characters. Every evaluated character is explicitly nontrivial. E_κ denotes the existing PMIA unitCharacterEval, evaluated at ζ_p; it is an additive map on the pseudomeasure module, not a ring map on all of Q. Put d_κ(g)=κ(g)−1 in Z, and include it in K when dividing.
- λ_g is the existing padicIntrinsicNumerator on U. For natural a with p∤a, let g∈U have value a; λ_g then equals the existing intrinsicSmoothedNumerator λ_a. Retain the bounded Z-scalar action on K when extending λ_a to the actual K-valued measure μ_a=extendIntegralUnitCoefficients λ_a.

**Construction or proof outline**

- Apply the exact supplier unitCharacterEval_numerator to the actual ζ_p. Its numerator is the supplier Iwasawa.numerator at g.
- Substitute arithmetic-pseudomeasure-numerator, which identifies that numerator with λ_g as an integral measure. The inclusion Z→K carries the scalar evaluation. No division or regularity condition on θ_g is used.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-numerator
- PadicMeasuresIwasawaAlgebras:L3/actual-unit-character-numerator

**Acceptance**

- A zero scalar denominator gives a vanishing numerator, not a value for the trivial character.

**Tests**

- SuggestedArithmeticCharacterTests.identity_clearing: At g=1, both sides are zero for every nontrivial κ.
- SuggestedArithmeticCharacterTests.zero_denominator_numerator: If κ(g)=1, λ_g(κ)=0 even when λ_g is not the zero measure.

**Sources**

- RJW-published, Definition 3.34 and equation (3-11), printed 129–130 / PDF30–31; Lemma 3.36, printed 130–131 / PDF31–32; §4, printed 136–139 / PDF37–40; Remark 2.18, printed 117 / PDF18.. Worker arithmetic specializations of the existing generic character evaluator and the integral smoothing construction. The finite-combination and denominator-loss estimates are derived here, not separately numbered source theorems. The unsmoothed blanket congruence is corrected as recorded in E10; no value at the trivial character is asserted.

### The arithmetic character ratio

DirichletPadicLFunctions:L1/arithmetic-character-ratio

Declaration: DirichletPadic.kubotaLeopoldt_character_ratio

Kind: theorem. Implementation: unchecked.

If κ(g)≠1, E_κ(ζ_p)=λ_g(κ)/d_κ(g) in K. For g of natural value a, the numerator is λ_a(κ).

**Hypotheses**

- p is any prime, including 2. Z=ℤ_p, K=ℚ_p, U=Zˣ and M=D(U,Z) have their native structures and the supplied commutative multiplicative convolution ring. Q=FractionRing M is a total quotient ring, not assumed to be a field. ζ_p is the existing kubotaLeopoldtPseudomeasure in Iwasawa.pseudomeasures δ Q.
- κ,η:U→Z are native ContinuousMonoidHom characters. Every evaluated character is explicitly nontrivial. E_κ denotes the existing PMIA unitCharacterEval, evaluated at ζ_p; it is an additive map on the pseudomeasure module, not a ring map on all of Q. Put d_κ(g)=κ(g)−1 in Z, and include it in K when dividing.
- λ_g is the existing padicIntrinsicNumerator on U. For natural a with p∤a, let g∈U have value a; λ_g then equals the existing intrinsicSmoothedNumerator λ_a. Retain the bounded Z-scalar action on K when extending λ_a to the actual K-valued measure μ_a=extendIntegralUnitCoefficients λ_a.

**Construction or proof outline**

- Apply the supplier actual-unit-character-ratio to ζ_p at this g; its hypothesis is κ(g)≠1, not regularity of δ_g−1.
- Replace the supplier numerator using arithmetic-pseudomeasure-numerator. For a natural g, use padic-intrinsic-natural. Division occurs only in K, where the indicated scalar is nonzero.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-numerator
- DirichletPadicLFunctions:L1/padic-intrinsic-natural
- PadicMeasuresIwasawaAlgebras:L3/actual-unit-character-ratio

**Acceptance**

- A torsion parameter may evaluate to a nonzero scalar although its difference is a zero divisor in M.

**Tests**

- SuggestedArithmeticCharacterTests.ratio_sign_parameter: For κ(−1)=−1, the numerator and the ratio at g=−1 are zero, including p=2.
- SuggestedArithmeticCharacterTests.ratio_two_parameters: Two units g,h with κ(g)≠1 and κ(h)≠1 give equal ratios.

**Sources**

- RJW-published, Definition 3.34 and equation (3-11), printed 129–130 / PDF30–31; Lemma 3.36, printed 130–131 / PDF31–32; §4, printed 136–139 / PDF37–40; Remark 2.18, printed 117 / PDF18.. Worker arithmetic specializations of the existing generic character evaluator and the integral smoothing construction. The finite-combination and denominator-loss estimates are derived here, not separately numbered source theorems. The unsmoothed blanket congruence is corrected as recorded in E10; no value at the trivial character is asserted.

### Power characters recover the interpolation values

DirichletPadicLFunctions:L1/arithmetic-character-positive

Declaration: DirichletPadic.kubotaLeopoldt_character_positive

Kind: comparison. Implementation: unchecked.

If k≥1 and κ(u)=u^k for all u∈U, then E_κ(ζ_p)=−(1−p^(k−1))B_k/k in K.

**Hypotheses**

- p is any prime, including 2. Z=ℤ_p, K=ℚ_p, U=Zˣ and M=D(U,Z) have their native structures and the supplied commutative multiplicative convolution ring. Q=FractionRing M is a total quotient ring, not assumed to be a field. ζ_p is the existing kubotaLeopoldtPseudomeasure in Iwasawa.pseudomeasures δ Q.
- κ,η:U→Z are native ContinuousMonoidHom characters. Every evaluated character is explicitly nontrivial. E_κ denotes the existing PMIA unitCharacterEval, evaluated at ζ_p; it is an additive map on the pseudomeasure module, not a ring map on all of Q. Put d_κ(g)=κ(g)−1 in Z, and include it in K when dividing.
- λ_g is the existing padicIntrinsicNumerator on U. For natural a with p∤a, let g∈U have value a; λ_g then equals the existing intrinsicSmoothedNumerator λ_a. Retain the bounded Z-scalar action on K when extending λ_a to the actual K-valued measure μ_a=extendIntegralUnitCoefficients λ_a.

**Construction or proof outline**

- Use the exact supplier actual-unit-character-positive-moment comparison at the same native character and exponent.
- Apply arithmetic-positive-bernoulli to the resulting positivePseudoMoment. The rational Bernoulli expression is included canonically in K. At k=1 the Euler factor gives zero.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-positive-bernoulli
- PadicMeasuresIwasawaAlgebras:L3/actual-unit-character-positive-moment

**Acceptance**

- Nontriviality remains explicit in the signature and is available for every positive power from the supplier positive-character admissibility. No complex-to-p-adic field map is used.

**Tests**

- SuggestedArithmeticCharacterTests.positive_first: The character u↦u has value zero for every p.
- SuggestedArithmeticCharacterTests.positive_ternary_second: At p=3, the character u↦u² has arithmetic value 1/6.

**Sources**

- RJW-published, Definition 3.34 and equation (3-11), printed 129–130 / PDF30–31; Lemma 3.36, printed 130–131 / PDF31–32; §4, printed 136–139 / PDF37–40; Remark 2.18, printed 117 / PDF18.. Worker arithmetic specializations of the existing generic character evaluator and the integral smoothing construction. The finite-combination and denominator-loss estimates are derived here, not separately numbered source theorems. The unsmoothed blanket congruence is corrected as recorded in E10; no value at the trivial character is asserted.

### Odd characters vanish

DirichletPadicLFunctions:L1/arithmetic-character-odd

Declaration: DirichletPadic.kubotaLeopoldt_character_odd

Kind: theorem. Implementation: unchecked.

If κ(−1)=−1, then E_κ(ζ_p)=0 for every prime p.

**Hypotheses**

- p is any prime, including 2. Z=ℤ_p, K=ℚ_p, U=Zˣ and M=D(U,Z) have their native structures and the supplied commutative multiplicative convolution ring. Q=FractionRing M is a total quotient ring, not assumed to be a field. ζ_p is the existing kubotaLeopoldtPseudomeasure in Iwasawa.pseudomeasures δ Q.
- κ,η:U→Z are native ContinuousMonoidHom characters. Every evaluated character is explicitly nontrivial. E_κ denotes the existing PMIA unitCharacterEval, evaluated at ζ_p; it is an additive map on the pseudomeasure module, not a ring map on all of Q. Put d_κ(g)=κ(g)−1 in Z, and include it in K when dividing.
- λ_g is the existing padicIntrinsicNumerator on U. For natural a with p∤a, let g∈U have value a; λ_g then equals the existing intrinsicSmoothedNumerator λ_a. Retain the bounded Z-scalar action on K when extending λ_a to the actual K-valued measure μ_a=extendIntegralUnitCoefficients λ_a.

**Construction or proof outline**

- The scalar d_κ(−1)=−2 is nonzero in K, including K=ℚ₂. Also κ cannot be the trivial character, since Z has characteristic zero.
- Use arithmetic-character-ratio at g=−1 and padic-intrinsic-negative-identity to make its numerator zero. This proves vanishing without constructing an integral half-idempotent.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-character-ratio
- DirichletPadicLFunctions:L1/padic-intrinsic-negative-identity

**Acceptance**

- This arithmetic vanishing statement is valid at p=2; the integral plus-corner comparison requires p odd.

**Tests**

- SuggestedArithmeticCharacterTests.odd_dyadic: At p=2 every character with κ(−1)=−1 has arithmetic value zero.
- SuggestedArithmeticCharacterTests.odd_is_nontrivial: The trivial character does not satisfy κ(−1)=−1.

**Sources**

- RJW-published, Definition 3.34 and equation (3-11), printed 129–130 / PDF30–31; Lemma 3.36, printed 130–131 / PDF31–32; §4, printed 136–139 / PDF37–40; Remark 2.18, printed 117 / PDF18.. Worker arithmetic specializations of the existing generic character evaluator and the integral smoothing construction. The finite-combination and denominator-loss estimates are derived here, not separately numbered source theorems. The unsmoothed blanket congruence is corrected as recorded in E10; no value at the trivial character is asserted.

### Finite character combinations through one smoothing measure

DirichletPadicLFunctions:L1/arithmetic-character-combination

Declaration: DirichletPadic.kubotaLeopoldt_character_combination

Kind: lemma. Implementation: unchecked.

For finite I, characters κ_i≠1, coefficients c_i∈K and a common natural smoothing parameter a with d_i=κ_i(g)−1≠0, ∑_i c_i E_(κ_i)(ζ_p)=μ_a(f), where f(u)=∑_i (c_i/d_i)κ_i(u) in C(U,K).

**Hypotheses**

- p is any prime, including 2. Z=ℤ_p, K=ℚ_p, U=Zˣ and M=D(U,Z) have their native structures and the supplied commutative multiplicative convolution ring. Q=FractionRing M is a total quotient ring, not assumed to be a field. ζ_p is the existing kubotaLeopoldtPseudomeasure in Iwasawa.pseudomeasures δ Q.
- κ,η:U→Z are native ContinuousMonoidHom characters. Every evaluated character is explicitly nontrivial. E_κ denotes the existing PMIA unitCharacterEval, evaluated at ζ_p; it is an additive map on the pseudomeasure module, not a ring map on all of Q. Put d_κ(g)=κ(g)−1 in Z, and include it in K when dividing.
- λ_g is the existing padicIntrinsicNumerator on U. For natural a with p∤a, let g∈U have value a; λ_g then equals the existing intrinsicSmoothedNumerator λ_a. Retain the bounded Z-scalar action on K when extending λ_a to the actual K-valued measure μ_a=extendIntegralUnitCoefficients λ_a.

**Construction or proof outline**

- Apply arithmetic-character-ratio separately to each κ_i at the same natural-valued g. The natural numerator comparison changes λ_g to λ_a.
- The exact integral-unit-extension-test-function compares μ_a on the scalar-extended κ_i with the inclusion of λ_a(κ_i). All κ_i are continuous integral tests, so this supplier applies.
- Use K-linearity of the existing continuous functional μ_a to combine the finite sum and the scalar c_i/d_i. The result is evaluation at the displayed continuous function.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-character-ratio
- DirichletPadicLFunctions:L1/intrinsic-numerator
- PadicMeasuresIwasawaAlgebras:L2/integral-unit-extension-test-function
- mathlib:AbstractMeasure.toCLMEquiv

**Acceptance**

- The same integral measure evaluates every summand; allowing a different smoothing measure in each term would not yield this identity.

**Tests**

- SuggestedArithmeticCharacterTests.combination_empty: For the empty index set, both sides are zero.
- SuggestedArithmeticCharacterTests.combination_single: For one character with c=d_κ(g), the identity gives d_κ(g)E_κ(ζ_p)=μ_a(κ).

**Sources**

- RJW-published, Definition 3.34 and equation (3-11), printed 129–130 / PDF30–31; Lemma 3.36, printed 130–131 / PDF31–32; §4, printed 136–139 / PDF37–40; Remark 2.18, printed 117 / PDF18.. Worker arithmetic specializations of the existing generic character evaluator and the integral smoothing construction. The finite-combination and denominator-loss estimates are derived here, not separately numbered source theorems. The unsmoothed blanket congruence is corrected as recorded in E10; no value at the trivial character is asserted.

### Denominator-qualified character Kummer bound

DirichletPadicLFunctions:L1/arithmetic-character-kummer

Declaration: DirichletPadic.kubotaLeopoldt_character_kummer

Kind: theorem. Implementation: unchecked.

Under arithmetic-character-combination, if B≥0 and ‖∑_i(c_i/d_i)κ_i(u)‖≤B for every u∈U, then ‖∑_i c_i E_(κ_i)(ζ_p)‖≤B.

**Hypotheses**

- p is any prime, including 2. Z=ℤ_p, K=ℚ_p, U=Zˣ and M=D(U,Z) have their native structures and the supplied commutative multiplicative convolution ring. Q=FractionRing M is a total quotient ring, not assumed to be a field. ζ_p is the existing kubotaLeopoldtPseudomeasure in Iwasawa.pseudomeasures δ Q.
- κ,η:U→Z are native ContinuousMonoidHom characters. Every evaluated character is explicitly nontrivial. E_κ denotes the existing PMIA unitCharacterEval, evaluated at ζ_p; it is an additive map on the pseudomeasure module, not a ring map on all of Q. Put d_κ(g)=κ(g)−1 in Z, and include it in K when dividing.
- λ_g is the existing padicIntrinsicNumerator on U. For natural a with p∤a, let g∈U have value a; λ_g then equals the existing intrinsicSmoothedNumerator λ_a. Retain the bounded Z-scalar action on K when extending λ_a to the actual K-valued measure μ_a=extendIntegralUnitCoefficients λ_a.

**Construction or proof outline**

- The function f in arithmetic-character-combination is a continuous K-valued function on compact U. Its pointwise bound gives its native supremum norm at most B.
- The existing intrinsic-numerator-norm gives ‖toCLMEquiv μ_a‖≤1. The native continuous-linear-map operator-norm bound gives ‖μ_a(f)‖≤B.
- Replace μ_a(f) by the exact finite combination. The case B=p^(−r), r≥0, is the denominator-cleared congruence; no denominators are silently discarded.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-character-combination
- DirichletPadicLFunctions:L1/intrinsic-numerator-norm
- mathlib:ContinuousMap.norm_le
- mathlib:ContinuousLinearMap.le_opNorm_of_le

**Acceptance**

- The normalized continuous test is the hypothesis. This does not assert a uniform bound for ζ_p as a field-valued measure; arithmetic-no-field-measure rules that out.

**Tests**

- SuggestedArithmeticCharacterTests.kummer_zero_function: If the normalized test sum is identically zero, the character-value combination is zero.
- SuggestedArithmeticCharacterTests.kummer_ternary_control: At p=3,a=2, d₂ E₂−d₄ E₄=15/4 has norm 1/3, whereas E₂−E₄=23/60 has norm 3.

**Sources**

- RJW-published, Definition 3.34 and equation (3-11), printed 129–130 / PDF30–31; Lemma 3.36, printed 130–131 / PDF31–32; §4, printed 136–139 / PDF37–40; Remark 2.18, printed 117 / PDF18.. Worker arithmetic specializations of the existing generic character evaluator and the integral smoothing construction. The finite-combination and denominator-loss estimates are derived here, not separately numbered source theorems. The unsmoothed blanket congruence is corrected as recorded in E10; no value at the trivial character is asserted.

### Precision loss from the two smoothing denominators

DirichletPadicLFunctions:L1/arithmetic-character-difference

Declaration: DirichletPadic.kubotaLeopoldt_character_difference

Kind: theorem. Implementation: unchecked.

For κ,η≠1, natural a prime to p with g of value a, and nonzero d_κ(g),d_η(g), if ε≥0 and ‖κ(u)−η(u)‖≤ε for all u∈U, then ‖E_κ(ζ_p)−E_η(ζ_p)‖≤ε/(‖d_κ(g)‖‖d_η(g)‖).

**Hypotheses**

- p is any prime, including 2. Z=ℤ_p, K=ℚ_p, U=Zˣ and M=D(U,Z) have their native structures and the supplied commutative multiplicative convolution ring. Q=FractionRing M is a total quotient ring, not assumed to be a field. ζ_p is the existing kubotaLeopoldtPseudomeasure in Iwasawa.pseudomeasures δ Q.
- κ,η:U→Z are native ContinuousMonoidHom characters. Every evaluated character is explicitly nontrivial. E_κ denotes the existing PMIA unitCharacterEval, evaluated at ζ_p; it is an additive map on the pseudomeasure module, not a ring map on all of Q. Put d_κ(g)=κ(g)−1 in Z, and include it in K when dividing.
- λ_g is the existing padicIntrinsicNumerator on U. For natural a with p∤a, let g∈U have value a; λ_g then equals the existing intrinsicSmoothedNumerator λ_a. Retain the bounded Z-scalar action on K when extending λ_a to the actual K-valued measure μ_a=extendIntegralUnitCoefficients λ_a.

**Construction or proof outline**

- Use arithmetic-character-combination with the two coefficients 1 and −1. The normalized test is κ/d_κ−η/d_η.
- Clear its two nonzero scalar denominators. Its numerator is d_η(κ−η)+(d_η−d_κ)η. Character values are units of Z because characters are monoid maps from U; hence their K-norm is one. Integral d_η has norm at most one.
- The global pointwise difference bound also bounds d_η−d_κ=η(g)−κ(g). The ultrametric inequality therefore bounds the cleared numerator by ε. Divide by the positive norms of the two denominators.
- Apply arithmetic-character-kummer to this pointwise bound. No proximity assumption on a or regularity of δ_g−1 is required.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-character-combination
- DirichletPadicLFunctions:L1/arithmetic-character-kummer
- mathlib:PadicInt.norm_units
- mathlib:PadicInt.norm_le_one

**Acceptance**

- Both denominator norms are indispensable. The ternary example disproves replacement of the right side by ε without further hypotheses.

**Tests**

- SuggestedArithmeticCharacterTests.difference_equal_characters: For η=κ and ε=0 the arithmetic difference is zero.
- SuggestedArithmeticCharacterTests.difference_ternary_loss: At p=3,a=2, κ(u)=u² and η(u)=u⁴ are congruent modulo 3; the bound is (1/3)/((1/3)(1/3))=3 and is attained by 23/60.

**Sources**

- RJW-published, Definition 3.34 and equation (3-11), printed 129–130 / PDF30–31; Lemma 3.36, printed 130–131 / PDF31–32; §4, printed 136–139 / PDF37–40; Remark 2.18, printed 117 / PDF18.. Worker arithmetic specializations of the existing generic character evaluator and the integral smoothing construction. The finite-combination and denominator-loss estimates are derived here, not separately numbered source theorems. The unsmoothed blanket congruence is corrected as recorded in E10; no value at the trivial character is asserted.

### Integral-unit denominators preserve character precision

DirichletPadicLFunctions:L1/arithmetic-character-unit-denominators

Declaration: DirichletPadic.kubotaLeopoldt_character_unit_denominators

Kind: theorem. Implementation: unchecked.

Under arithmetic-character-difference, if both d_κ(g) and d_η(g) are units in Z, then ‖E_κ(ζ_p)−E_η(ζ_p)‖≤ε.

**Hypotheses**

- p is any prime, including 2. Z=ℤ_p, K=ℚ_p, U=Zˣ and M=D(U,Z) have their native structures and the supplied commutative multiplicative convolution ring. Q=FractionRing M is a total quotient ring, not assumed to be a field. ζ_p is the existing kubotaLeopoldtPseudomeasure in Iwasawa.pseudomeasures δ Q.
- κ,η:U→Z are native ContinuousMonoidHom characters. Every evaluated character is explicitly nontrivial. E_κ denotes the existing PMIA unitCharacterEval, evaluated at ζ_p; it is an additive map on the pseudomeasure module, not a ring map on all of Q. Put d_κ(g)=κ(g)−1 in Z, and include it in K when dividing.
- λ_g is the existing padicIntrinsicNumerator on U. For natural a with p∤a, let g∈U have value a; λ_g then equals the existing intrinsicSmoothedNumerator λ_a. Retain the bounded Z-scalar action on K when extending λ_a to the actual K-valued measure μ_a=extendIntegralUnitCoefficients λ_a.

**Construction or proof outline**

- The native p-adic unit norm is one for each denominator. Substitute those norms into arithmetic-character-difference.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-character-difference
- mathlib:PadicInt.norm_units

**Acceptance**

- The fixed-character application includes character components without importing an analytic branch or a Teichmüller splitting from L3. The unit-denominator corollary has no dyadic instances.

**Tests**

- SuggestedArithmeticCharacterTests.unit_denominator_quinary: At p=5,a=2, the degree 2 and 6 denominators are units; the arithmetic difference −760/63 has norm 1/5.
- SuggestedArithmeticCharacterTests.dyadic_no_unit_denominator: At p=2 every integral character value is a unit congruent to 1 modulo 2, so κ(g)−1 is never an integral unit.

**Sources**

- RJW-published, Definition 3.34 and equation (3-11), printed 129–130 / PDF30–31; Lemma 3.36, printed 130–131 / PDF31–32; §4, printed 136–139 / PDF37–40; Remark 2.18, printed 117 / PDF18.. Worker arithmetic specializations of the existing generic character evaluator and the integral smoothing construction. The finite-combination and denominator-loss estimates are derived here, not separately numbered source theorems. The unsmoothed blanket congruence is corrected as recorded in E10; no value at the trivial character is asserted.

### Weight congruences in a fixed character component

DirichletPadicLFunctions:L1/arithmetic-fixed-character-weight-period

Declaration: DirichletPadic.kubotaLeopoldt_fixed_character_weight_period

Kind: theorem. Implementation: unchecked.

Fix an integral continuous character α. Suppose κ(u)=α(u)u^k and η(u)=α(u)u^l, with k,l≥1, r≥1 and k≡l mod p^(r−1)(p−1). If both smoothing denominators at the same natural parameter a are integral units, then ‖E_κ(ζ_p)−E_η(ζ_p)‖≤p^(−r).

**Hypotheses**

- p is any prime, including 2. Z=ℤ_p, K=ℚ_p, U=Zˣ and M=D(U,Z) have their native structures and the supplied commutative multiplicative convolution ring. Q=FractionRing M is a total quotient ring, not assumed to be a field. ζ_p is the existing kubotaLeopoldtPseudomeasure in Iwasawa.pseudomeasures δ Q.
- κ,η:U→Z are native ContinuousMonoidHom characters. Every evaluated character is explicitly nontrivial. E_κ denotes the existing PMIA unitCharacterEval, evaluated at ζ_p; it is an additive map on the pseudomeasure module, not a ring map on all of Q. Put d_κ(g)=κ(g)−1 in Z, and include it in K when dividing.
- λ_g is the existing padicIntrinsicNumerator on U. For natural a with p∤a, let g∈U have value a; λ_g then equals the existing intrinsicSmoothedNumerator λ_a. Retain the bounded Z-scalar action on K when extending λ_a to the actual K-valued measure μ_a=extendIntegralUnitCoefficients λ_a.

**Construction or proof outline**

- Map u to a unit modulo p^r. The native Euler theorem, the prime-power totient formula and the equality-of-powers theorem for congruent exponents give equal kth and lth powers in ZMod(p^r).
- The native reduction kernel and its ideal/norm-ball comparison imply ‖u^k−u^l‖≤p^(−r). Multiply by α(u), whose norm is one, to obtain the required difference bound between κ(u) and η(u). This calculation is the finite-unit argument already used for smoothed weight periods, not an analytic branch construction.
- Apply arithmetic-character-unit-denominators. The denominator-unit hypotheses in particular exclude trivial evaluated characters; their nontriviality certificates are retained explicitly in the signature.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-character-unit-denominators
- mathlib:PadicInt.toZModPow
- mathlib:PadicInt.ker_toZModPow
- mathlib:PadicInt.norm_le_pow_iff_mem_span_pow
- mathlib:ZMod.pow_totient
- mathlib:Nat.totient_prime_pow
- mathlib:pow_eq_pow_of_modEq
- mathlib:PadicInt.norm_units
- mathlib:PadicInt.norm_def

**Acceptance**

- The finite-order Teichmüller components are instances of α, once supplied by their existing owner. No finite-order hypothesis is needed for this stronger integral-character version.

**Tests**

- SuggestedArithmeticCharacterTests.fixed_component_identity: For k=l the arithmetic difference is zero for every fixed α satisfying the stated denominator conditions.
- SuggestedArithmeticCharacterTests.fixed_component_trivial_factor: For α=1 the statement agrees with the existing unit-denominator Bernoulli congruence after the positive-character comparison and its minus sign.

**Sources**

- RJW-published, Definition 3.34 and equation (3-11), printed 129–130 / PDF30–31; Lemma 3.36, printed 130–131 / PDF31–32; §4, printed 136–139 / PDF37–40; Remark 2.18, printed 117 / PDF18.. Worker arithmetic specializations of the existing generic character evaluator and the integral smoothing construction. The finite-combination and denominator-loss estimates are derived here, not separately numbered source theorems. The unsmoothed blanket congruence is corrected as recorded in E10; no value at the trivial character is asserted.

### Completed-algebra form of the arithmetic pseudomeasure

DirichletPadicLFunctions:L1/arithmetic-completed-transport

Declaration: DirichletPadic.kubotaLeopoldt_completed_comparison

Kind: comparison. Implementation: unchecked.

The image ζ_A has cleared numerator ([g]−1)ζ_A=λ_g^A for every g. It is the unique element of P_A with these numerators, and equals λ_u^A/([u]−1) for every regular smoothing parameter u.

**Hypotheses**

- p is any prime, including 2. Z=ℤ_p, K=ℚ_p, U=Zˣ and M=D(U,Z) have their native structures and the supplied commutative multiplicative convolution ring. Q=FractionRing M is a total quotient ring, not assumed to be a field. ζ_p is the existing kubotaLeopoldtPseudomeasure in Iwasawa.pseudomeasures δ Q.
- A=completedGroupAlgebra p U is the existing upstream Layer 9 carrier. E:M≃ₐ[Z]A is the requested PMIA measure/completed-algebra comparison, with E(δ_g)=[g]. E_Q:FractionRing M≃ₐ[Z]FractionRing A is its requested localization extension and sends the actual pseudomeasure submodule to P_A. Its construction and finite-level normalization are supplier obligations, not hypotheses replacing arithmetic proof.
- Write ζ_A=E_Q(ζ_p) and λ_g^A=E(λ_g) only as notation for these images; no second generic pseudomeasure or measure carrier is introduced.

**Construction or proof outline**

- Apply E_Q to arithmetic-pseudomeasure-clearing, using its compatibility with the integral algebra maps and E(δ_g)=[g]. This proves the full integral numerator family in A.
- For uniqueness, pull any competing pseudomeasure back along the supplier equivalence P_M≃P_A and apply arithmetic-pseudomeasure-unique.
- Transport arithmetic-pseudomeasure-regular-parameter using preservation and reflection of regular elements under E. The native localization extension is unique, so this image agrees with the source fraction at every admissible regular smoothing parameter.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-clearing
- DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-unique
- DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-regular-parameter
- PadicMeasuresIwasawaAlgebras:L1
- PadicMeasuresIwasawaAlgebras:L3

**Acceptance**

- At g=1 and g=−1 the cleared numerators are zero. The transport is not an identification of M with an arbitrary formal power-series ring. Its exact Lean statement awaits the owned completed-algebra comparison carrier and maps.

**Sources**

- RJW-published, Proposition 3.16, printed 122–123 / PDF23–24; Definition 3.34 and Lemma 3.36, printed 130–131 / PDF31–32; Definitions 4.9–4.10 and Proposition 4.11, printed 138–139 / PDF39–40; Lemmas 11.1–11.3 and Corollary 11.4, printed 174–175 / PDF75–76.. Arithmetic transport through the completed-algebra, sign-quotient and coefficient maps requested from their existing PMIA owners. The generic comparison proofs are not duplicated here. Lemma 11.3 uses the minus component for odd moments (paper E64); Corollary 11.4 requires the k=1 Euler factor and application to integral numerators (paper E65).

### The arithmetic element in the odd-prime plus corner

DirichletPadicLFunctions:L1/arithmetic-plus-corner

Declaration: DirichletPadic.kubotaLeopoldt_completed_plus

Kind: lemma. Implementation: unchecked.

For p odd, with e⁺=(1+[−1])/2 in A, e⁺ζ_A=ζ_A and e⁺λ_g^A=λ_g^A for every g.

**Hypotheses**

- p is any prime, including 2. Z=ℤ_p, K=ℚ_p, U=Zˣ and M=D(U,Z) have their native structures and the supplied commutative multiplicative convolution ring. Q=FractionRing M is a total quotient ring, not assumed to be a field. ζ_p is the existing kubotaLeopoldtPseudomeasure in Iwasawa.pseudomeasures δ Q.
- A=completedGroupAlgebra p U is the existing upstream Layer 9 carrier. E:M≃ₐ[Z]A is the requested PMIA measure/completed-algebra comparison, with E(δ_g)=[g]. E_Q:FractionRing M≃ₐ[Z]FractionRing A is its requested localization extension and sends the actual pseudomeasure submodule to P_A. Its construction and finite-level normalization are supplier obligations, not hypotheses replacing arithmetic proof.
- Write ζ_A=E_Q(ζ_p) and λ_g^A=E(λ_g) only as notation for these images; no second generic pseudomeasure or measure carrier is introduced.
- p≠2; A⁺ and A⁻ are the requested actual idempotent corner rings.

**Construction or proof outline**

- Transport the all-prime integral parity equations for ζ_p and λ_g through E_Q and E.
- Since p is odd, 2 is a unit of Z; distribute the scalar half over the sum of the identity and sign actions. Both terms fix the arithmetic objects, giving the asserted equalities.
- The corner A⁺=e⁺A has identity e⁺. Treating its inclusion into A as a unital homomorphism would be wrong; use the requested product decomposition A≃A⁺×A⁻ for localization comparisons.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-completed-transport
- DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-even
- DirichletPadicLFunctions:L1/padic-intrinsic-even
- PadicMeasuresIwasawaAlgebras:L1

**Acceptance**

- At p=2 only the inherited integral parity is asserted. No integral division by 2 or plus/minus splitting is inferred. The corner carriers and their localization maps await the exact PMIA request.

**Sources**

- RJW-published, Proposition 3.16, printed 122–123 / PDF23–24; Definition 3.34 and Lemma 3.36, printed 130–131 / PDF31–32; Definitions 4.9–4.10 and Proposition 4.11, printed 138–139 / PDF39–40; Lemmas 11.1–11.3 and Corollary 11.4, printed 174–175 / PDF75–76.. Arithmetic transport through the completed-algebra, sign-quotient and coefficient maps requested from their existing PMIA owners. The generic comparison proofs are not duplicated here. Lemma 11.3 uses the minus component for odd moments (paper E64); Corollary 11.4 requires the k=1 Euler factor and application to integral numerators (paper E65).

### Arithmetic descent through the sign quotient

DirichletPadicLFunctions:L1/arithmetic-sign-quotient

Declaration: DirichletPadic.kubotaLeopoldt_sign_quotient_comparison

Kind: comparison. Implementation: unchecked.

For p odd, the actual quotient q:U→U/{±1} and its completed-algebra map q_* send ζ_A to a pseudomeasure ζ_bar with ([q(g)]−1)ζ_bar=q_*(λ_g^A) for every g. Under the supplier plus-corner equivalence its lift is ζ_A, and even nontrivial character evaluations agree.

**Hypotheses**

- p is any prime, including 2. Z=ℤ_p, K=ℚ_p, U=Zˣ and M=D(U,Z) have their native structures and the supplied commutative multiplicative convolution ring. Q=FractionRing M is a total quotient ring, not assumed to be a field. ζ_p is the existing kubotaLeopoldtPseudomeasure in Iwasawa.pseudomeasures δ Q.
- A=completedGroupAlgebra p U is the existing upstream Layer 9 carrier. E:M≃ₐ[Z]A is the requested PMIA measure/completed-algebra comparison, with E(δ_g)=[g]. E_Q:FractionRing M≃ₐ[Z]FractionRing A is its requested localization extension and sends the actual pseudomeasure submodule to P_A. Its construction and finite-level normalization are supplier obligations, not hypotheses replacing arithmetic proof.
- Write ζ_A=E_Q(ζ_p) and λ_g^A=E(λ_g) only as notation for these images; no second generic pseudomeasure or measure carrier is introduced.
- p≠2. The supplier uses the closed sign subgroup {1,−1}, the actual topological quotient group, its completed group algebra and its normalized plus-corner equivalence.

**Construction or proof outline**

- The requested normalized plus-corner equivalence sends e⁺[g] to [q(g)]. The unnormalized orbit sum [g]+[−g] maps to 2[q(g)], which is why the scalar half is retained.
- Use the supplier product decomposition and total-quotient projection to send the arithmetic image ζ_A to the plus component and then the quotient ring. Its plus-corner identity is supplied by arithmetic-plus-corner.
- Apply the resulting localization map to every clearing identity. For any quotient unit h choose a lift g along the surjective q; its integral numerator q_*(λ_g^A) proves actual pseudomeasure membership. If g is replaced by −g, the intrinsic cocycle and λ_−1=0 identify the numerators.
- For an even nontrivial character κ, its unique descended character κ_bar is nontrivial. Choose a g with κ(g)≠1. The supplier evaluation naturality and the arithmetic character ratio give identical numerator values and nonzero scalar denominators. Their ratios agree.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-plus-corner
- DirichletPadicLFunctions:L1/arithmetic-character-ratio
- DirichletPadicLFunctions:L1/padic-intrinsic-cocycle
- DirichletPadicLFunctions:L1/padic-intrinsic-negative-identity
- PadicMeasuresIwasawaAlgebras:L1
- PadicMeasuresIwasawaAlgebras:L3

**Acceptance**

- Uniqueness of the lifted arithmetic element uses the actual plus-corner equivalence; no arbitrary choice of representative defines a measure. Exact quotient, corner and localization signatures are omitted until their supplier maps exist.

**Sources**

- RJW-published, Proposition 3.16, printed 122–123 / PDF23–24; Definition 3.34 and Lemma 3.36, printed 130–131 / PDF31–32; Definitions 4.9–4.10 and Proposition 4.11, printed 138–139 / PDF39–40; Lemmas 11.1–11.3 and Corollary 11.4, printed 174–175 / PDF75–76.. Arithmetic transport through the completed-algebra, sign-quotient and coefficient maps requested from their existing PMIA owners. The generic comparison proofs are not duplicated here. Lemma 11.3 uses the minus component for odd moments (paper E64); Corollary 11.4 requires the k=1 Euler factor and application to integral numerators (paper E65).

### Coefficient extension of the arithmetic pseudomeasure

DirichletPadicLFunctions:L1/arithmetic-coefficient-naturality

Declaration: DirichletPadic.kubotaLeopoldt_coefficient_naturality

Kind: comparison. Implementation: unchecked.

For finite complete valued extensions K⊂L of ℚ_p with compatible continuous scalar embeddings, the requested bounded-measure localization maps carry ζ_p to ζ_K and then to ζ_L. They carry λ_g to its actual coefficient extensions and preserve every admissible character value; extension to ℚ_p agrees with the existing integral-to-field measure extension.

**Hypotheses**

- p is any prime, including 2. Z=ℤ_p, K=ℚ_p, U=Zˣ and M=D(U,Z) have their native structures and the supplied commutative multiplicative convolution ring. Q=FractionRing M is a total quotient ring, not assumed to be a field. ζ_p is the existing kubotaLeopoldtPseudomeasure in Iwasawa.pseudomeasures δ Q.
- K and L are finite extensions of ℚ_p with their complete ultrametric field structures; embeddings are continuous, injective and compatible with the given ℤ_p-algebra maps. All coefficient operator and localization maps are the exact requested PMIA maps.

**Construction or proof outline**

- The supplier constructs the continuous coefficient extension on actual bounded unit measures and proves that the smoothing denominator at a=p+1 remains regular. Map the defining arithmetic fraction using these actual localization maps.
- Coefficient extension commutes with the actual inverse weighting, restriction and unit inclusion by the requested operator comparison; thus the mapped numerator is the coefficient extension of the existing λ_g. Apply the all-unit clearing identity to obtain pseudomeasure membership over each coefficient field.
- For a character κ:U→Kˣ with κ(g)≠1, the requested admissible evaluation is its integral numerator value divided by κ(g)−1. Injectivity of K→L preserves this nonzero condition; compatibility of integral evaluation gives exactly the image scalar in L.
- Identity and composition follow from the supplier coefficient maps and uniqueness of localization extension. The integral Q_p descent and inclusion square already present in nodes 54 and 65 supply the base comparison; no L1 dependency on its L2/L3 consumers is added.

**Prerequisites**

- DirichletPadicLFunctions:L1/arithmetic-pseudomeasure
- DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-clearing
- DirichletPadicLFunctions:L1/smoothed-extension-integral-descent
- DirichletPadicLFunctions:L1/intrinsic-numerator-extension-inclusion
- PadicMeasuresIwasawaAlgebras:L2
- PadicMeasuresIwasawaAlgebras:L3

**Acceptance**

- The target is the bounded K-valued measure algebra. It is not the unrestricted inverse limit of K-valued finite measures. General coefficients do not justify evaluating a zero smoothing denominator, and no map ℂ→K is used. Exact finite-extension localization and evaluator signatures await their supplier.

**Sources**

- RJW-published, Proposition 3.16, printed 122–123 / PDF23–24; Definition 3.34 and Lemma 3.36, printed 130–131 / PDF31–32; Definitions 4.9–4.10 and Proposition 4.11, printed 138–139 / PDF39–40; Lemmas 11.1–11.3 and Corollary 11.4, printed 174–175 / PDF75–76.. Arithmetic transport through the completed-algebra, sign-quotient and coefficient maps requested from their existing PMIA owners. The generic comparison proofs are not duplicated here. Lemma 11.3 uses the minus component for odd moments (paper E64); Corollary 11.4 requires the k=1 Euler factor and application to integral numerators (paper E65).
