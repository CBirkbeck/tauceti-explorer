# Dirichlet p-adic L-functions, special values, and Eisenstein measures

This roadmap retains the explicit rational arithmetic construction under accepted RS-14. The existing
ModularForms and GlobalNumberFields roadmaps own the classical carriers and character conventions;
PadicMeasuresIwasawaAlgebras owns general measure/Amice and pseudomeasure interfaces;
LocallyAnalyticDistributions owns the analytic character-coordinate operations. The new work here is the
specific arithmetic construction, its values and its normalization comparisons. None of those shared
carriers is redefined.

**First partial checkpoint, 26 September 2026.** The five layers L0–L4 remain in scope. This document
decomposes the integral cancellation in Proposition 4.4 of Rodrigues Jacinto–Williams and the concrete
smoothing measure of Definition 4.5, including its Mahler coefficients. No whole layer is closed. The
ordinary polynomial moments, unit restriction, zeta pseudomeasure and character interpolation are
explicit remaining work; no assumption packages their desired conclusions.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. All five reviewed AUDIT-24 entries were read before planning.
In particular, Mathlib already supplies integral Amice inversion for ℤ_p-valued measures on ℤ_p.
Definition 4.5 needs this existing special case. The more general bounded-coefficient theory remains
with PadicMeasuresIwasawaAlgebras:L2, and is not a prerequisite for constructing this particular measure.
The broad audit wording that no total quotient ring exists is not used as a declaration claim: the
generic localization already exists, while the completed Iwasawa algebra and arithmetic comparisons
still require their owners' work.

## L1: integral smoothing

Let R be a commutative ring and a a natural number. Define two finite coefficient series

    q_a(T) = Σ choose(a,n+1) Tⁿ,       b_a(T) = Σ choose(a,n+2) Tⁿ.

The binomial identity and subtraction of the constant coefficient give

    T q_a(T) = (1+T)^a − 1,           q_a(T) − a = T b_a(T).

If a is a unit in R, then q_a is a unit because its constant coefficient is a. Set

    F_a(T) = b_a(T) q_a(T)⁻¹  ∈ R[[T]].

This uses the existing inverse-series construction. It gives q_a F_a=b_a and Tq_a F_a=q_a−a directly
inside R[[T]]. Multiplication by T is injective even over coefficient rings with zero divisors; together
with the unit q_a this proves uniqueness. Only after these integral identities are established is the
source's rational expression compared in a receiving field where the image of T is nonzero:

    F_a(T) = 1/T − a/((1+T)^a−1).

The value at T=0 is the constant coefficient of the cancelled series, not the result of evaluating two
undefined fractions. It is choose(a,2)/a, where division means multiplication by the inverse of the
unit a. Keeping this form avoids introducing 1/2 in a coefficient ring where 2 is not invertible.
For a=2 over ℚ, F₂=1/(2+T), with constant coefficient +1/2 and linear coefficient −1/4. For a=3 over
ℤ₂, the constant coefficient is 1. At a=1 the series is zero; this degenerate extension is a test, not
an admissible smoothing parameter for dividing a zeta numerator by [a]−[1]. The arithmetic construction
uses a>1 prime to p.

For p prime and p∤a, the existing p-adic norm/unit criteria make a a unit in ℤ_p. Apply the inverse of
`AbstractMeasure.amiceTransformEquiv` to F_a. This constructs the specific μ_a in the existing
continuous integral measure carrier. Its nth Mahler value equals the nth coefficient of F_a. This
statement includes n=0 and works at p=2 for odd a. Ordinary powers x^k are different test functions;
their Bernoulli/zeta values need the additional source arguments listed under remaining work.

The coefficient recurrence

    a F_{a,n} = choose(a,n+2) − Σ_{i<n} choose(a,n−i+1) F_{a,i}

supplies concrete values and an independent sign check. Coefficient ring maps preserve both q_a and F_a;
the uniqueness proof establishes this without choosing a second inverse construction. Scalar extension
of the measures themselves requires the common measure API and is kept as a distinct comparison gap.

ColemanPowerSeries:L2 uses the same normalization: RJW Proposition 10.4 identifies the logarithmic
derivative of the cyclotomic-unit series with a−1−F_a. The arithmetic smoothing sign is fixed here;
the Coleman owner proves its own comparison and handles its operator conventions.

## Declaration plan

Each item below proposes one library declaration. Any API item used by another node is promoted and
referenced explicitly. The three constructions have nine unit tests, including the degenerate parameter,
a sign-sensitive rational value and an integral dyadic value. The suggested file also gives the
rejection statement for a nonunit smoothing parameter at p=2. It contains proposed signatures only and
makes no implementation claim.

### Binomial smoothing denominator

`DirichletPadicLFunctions:L1/smoothing-denominator` — definition.

Define q_a in R[[T]] by coefficient_n(q_a)=choose(a,n+1). It is the integral quotient of (1+T)^a−1 by T. The definition is coefficient-wise and does not invert T.

Hypotheses: R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.

Proof outline:

1. Apply the existing PowerSeries.mk to the indicated natural binomial coefficients.
2. The coefficient API follows from coeff_mk; n=0 gives the constant coefficient a.
3. The polynomial binomial formula gives Tq_a=(1+T)^a−1; coefficient maps preserve the natural coefficients.

Prerequisites: `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`, `mathlib:Polynomial.coeff_one_add_X_pow`.

API:

- `DirichletPadic.coeff_smoothingDenominator` (data): The nth coefficient is choose(a,n+1); promoted.
- `DirichletPadic.constantCoeff_smoothingDenominator` (simp): The constant coefficient is a; promoted.
- `DirichletPadic.X_mul_smoothingDenominator` (relation): Tq_a=(1+T)^a−1; promoted.
- `DirichletPadic.smoothingDenominator_isUnit` (structure): If a is a unit, q_a is a unit; promoted.
- `DirichletPadic.smoothingDenominator_map` (functoriality): Every coefficient ring homomorphism sends q_a to q_a over its target; promoted.

Unit tests:

- `SuggestedTests.denominator_zero`: q₀=0 over ℤ.
- `SuggestedTests.denominator_one`: q₁=1 over ℤ.
- `SuggestedTests.denominator_two`: q₂=2+T over ℤ.

Consumers: RJW Proposition 4.4 and Definition 4.5: Construct the integral power series before applying the existing Amice inverse; coefficient tests detect a sign error in the printed expansion. RJW Proposition 4.6 and DirichletPadicLFunctions:L1: The specific measure and its exact normalization are the input to polynomial moments, restriction to units and the zeta pseudomeasure. ColemanPowerSeries:L2; RJW Proposition 10.4: The Coleman logarithmic derivative compares with this same arithmetic smoothing series, so the sign and coefficient-map laws must be fixed before that comparison.

Acceptance: The coefficient definition gives a polynomial of degree at most a−1 for a>0; it gives zero when a=0. The tests distinguish the quotient by T from the unshifted binomial polynomial.

Source: Rodrigues Jacinto–Williams, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Denominator coefficients

`DirichletPadicLFunctions:L1/denominator-coefficients` — lemma.

For every n≥0, coefficient_n(q_a)=choose(a,n+1).

Hypotheses: R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.

Proof outline:

1. Unfold smoothing-denominator and apply PowerSeries.coeff_mk.

Prerequisites: `DirichletPadicLFunctions:L1/smoothing-denominator`, `mathlib:PowerSeries.coeff_mk`.

Acceptance: Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

Source: Rodrigues Jacinto–Williams, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Denominator constant coefficient

`DirichletPadicLFunctions:L1/denominator-constant` — lemma.

The constant coefficient of q_a is a.

Hypotheses: R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.

Proof outline:

1. Use denominator-coefficients at n=0 and the natural identity choose(a,1)=a.

Prerequisites: `DirichletPadicLFunctions:L1/denominator-coefficients`, `mathlib:PowerSeries.coeff_zero_eq_constantCoeff_apply`.

Acceptance: Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

Source: Rodrigues Jacinto–Williams, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Binomial denominator factorization

`DirichletPadicLFunctions:L1/denominator-factorization` — lemma.

Tq_a=(1+T)^a−1 in R[[T]], including a=0.

Hypotheses: R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.

Proof outline:

1. Compare the constant coefficients: both sides are zero.
2. For degree n+1, coeff_succ_X_mul and denominator-coefficients give choose(a,n+1).
3. Transfer Polynomial.coeff_one_add_X_pow through the polynomial-to-series ring homomorphism, using coeff_coe, coe_X and coe_pow. These are the coefficients on the right; extensionality finishes.

Prerequisites: `DirichletPadicLFunctions:L1/denominator-coefficients`, `mathlib:PowerSeries.coeff_succ_X_mul`, `mathlib:Polynomial.coeff_one_add_X_pow`, `mathlib:Polynomial.coeff_coe`, `mathlib:Polynomial.coeToPowerSeries.ringHom`, `mathlib:Polynomial.coe_X`, `mathlib:Polynomial.coe_pow`.

Acceptance: Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

Source: Rodrigues Jacinto–Williams, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Unit smoothing denominator

`DirichletPadicLFunctions:L1/denominator-unit` — lemma.

If a is a unit in R, then q_a is a unit in R[[T]].

Hypotheses: R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R. The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

Proof outline:

1. Use denominator-constant and the existing PowerSeries.isUnit_iff_constantCoeff.

Prerequisites: `DirichletPadicLFunctions:L1/denominator-constant`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`.

Acceptance: Over ℤ₂ the parameter a=3 gives a unit q₃, but a=2 does not. No division by 2 is introduced.

Source: Rodrigues Jacinto–Williams, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Denominator under coefficient change

`DirichletPadicLFunctions:L1/denominator-coefficient-map` — lemma.

For f:R→S a homomorphism of commutative rings, coefficient-wise f sends q_a over R to q_a over S.

Hypotheses: R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R. S is a commutative ring and f:R→S is a ring homomorphism.

Proof outline:

1. Use PowerSeries.coeff_map and denominator-coefficients.
2. The ring map preserves natural casts. Coefficient extensionality gives the equality.

Prerequisites: `DirichletPadicLFunctions:L1/denominator-coefficients`, `mathlib:PowerSeries.map`, `mathlib:PowerSeries.coeff_map`.

Acceptance: The map ℤ→ℤ₂ sends 2+T to 2+T; identity and composite maps give the same q_a without choosing coordinates.

Source: Rodrigues Jacinto–Williams, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Integral smoothed power series

`DirichletPadicLFunctions:L1/smoothed-series` — construction.

For a with unit image u in R, define F_a=b_a·q_a⁻¹ in R[[T]], using the existing inverse-of-a-series construction with constant unit u. Here b_a has coefficient choose(a,n+2). This constructs the pole cancellation integrally before any rational comparison.

Hypotheses: R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R. The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

Proof outline:

1. Use denominator-constant to identify the constant coefficient of q_a with the unit supplied by a.
2. Apply PowerSeries.invOfUnit to q_a and that unit. Multiply by the series b_a constructed with PowerSeries.mk.
3. The equality q_a F_a=b_a follows from mul_invOfUnit. No inverse of T appears. Proof irrelevance or the uniqueness theorem removes dependence on the unit certificate.

Prerequisites: `DirichletPadicLFunctions:L1/smoothing-denominator`, `DirichletPadicLFunctions:L1/denominator-constant`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.invOfUnit`, `mathlib:PowerSeries.mul_invOfUnit`.

API:

- `DirichletPadic.smoothingDenominator_mul_smoothedSeries` (characterisation): q_a F_a=b_a; promoted.
- `DirichletPadic.X_mul_smoothingDenominator_mul_smoothedSeries` (relation): Tq_a F_a=q_a−a; promoted.
- `DirichletPadic.smoothedSeries_unique` (universal-property): This cancellation equation uniquely characterizes F_a; promoted.
- `DirichletPadic.constantCoeff_smoothedSeries` (simp): The constant coefficient is choose(a,2)u⁻¹; promoted.
- `DirichletPadic.coeff_smoothedSeries_recurrence` (data): a F_{a,n}=choose(a,n+2)−∑_{i<n}choose(a,n−i+1)F_{a,i}; promoted.
- `DirichletPadic.smoothedSeries_map` (functoriality): Coefficient ring maps preserve F_a, with the transported unit hypothesis; promoted.
- `DirichletPadic.smoothedSeries_one` (simp): For the unit parameter a=1, F₁=0.
- `DirichletPadic.smoothedSeries_fraction_formula` (compatibility): In a receiving field in which the image of T is nonzero, F_a equals 1/T−a/((1+T)^a−1); promoted.

Unit tests:

- `SuggestedTests.series_one`: F₁=0 over ℚ.
- `SuggestedTests.series_two_sign`: Over ℚ, F₂ has constant coefficient 1/2 and linear coefficient −1/4.
- `SuggestedTests.series_three_dyadic`: Over ℤ₂, the unit parameter 3 gives constant coefficient 1. This needs no inverse of 2.

Consumers: RJW Proposition 4.4 and Definition 4.5: Construct the integral power series before applying the existing Amice inverse; coefficient tests detect a sign error in the printed expansion. RJW Proposition 4.6 and DirichletPadicLFunctions:L1: The specific measure and its exact normalization are the input to polynomial moments, restriction to units and the zeta pseudomeasure. ColemanPowerSeries:L2; RJW Proposition 10.4: The Coleman logarithmic derivative compares with this same arithmetic smoothing series, so the sign and coefficient-map laws must be fixed before that comparison.

Acceptance: Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

Source: Rodrigues Jacinto–Williams, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Integral cancellation equation

`DirichletPadicLFunctions:L1/series-cancellation` — lemma.

q_a F_a=b_a in R[[T]].

Hypotheses: R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R. The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

Proof outline:

1. Unfold smoothed-series. Commute factors and apply PowerSeries.mul_invOfUnit with denominator-constant.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-series`, `DirichletPadicLFunctions:L1/denominator-constant`, `mathlib:PowerSeries.mul_invOfUnit`.

Acceptance: Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

Source: Rodrigues Jacinto–Williams, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Cancellation after multiplication by T

`DirichletPadicLFunctions:L1/series-cleared-equation` — lemma.

Tq_a F_a=q_a−a in R[[T]].

Hypotheses: R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R. The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

Proof outline:

1. Multiply series-cancellation by T.
2. PowerSeries.sub_const_eq_X_mul_shift identifies q_a−a with T times the shifted q_a. Denominator-coefficients and denominator-constant identify that shifted series with b_a.

Prerequisites: `DirichletPadicLFunctions:L1/series-cancellation`, `DirichletPadicLFunctions:L1/denominator-coefficients`, `DirichletPadicLFunctions:L1/denominator-constant`, `mathlib:PowerSeries.sub_const_eq_X_mul_shift`.

Acceptance: Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

Source: Rodrigues Jacinto–Williams, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Uniqueness of the smoothed series

`DirichletPadicLFunctions:L1/series-uniqueness` — theorem.

For F∈R[[T]], if Tq_a F=q_a−a then F=F_a.

Hypotheses: R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R. The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

Proof outline:

1. Compare the assumed equation with series-cleared-equation.
2. Cancel T using PowerSeries.X_mul_cancel, which does not assume a domain.
3. Cancel the unit q_a using denominator-unit and IsUnit.mul_left_cancel.

Prerequisites: `DirichletPadicLFunctions:L1/series-cleared-equation`, `DirichletPadicLFunctions:L1/denominator-unit`, `mathlib:PowerSeries.X_mul_cancel`, `mathlib:IsUnit.mul_left_cancel`.

Acceptance: At a=2 over ℚ, the equation forces the constant coefficient 1/2; the sign-reversed geometric series cannot satisfy it. The proof remains valid over rings with zero divisors.

Source: Rodrigues Jacinto–Williams, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Smoothed constant coefficient

`DirichletPadicLFunctions:L1/series-constant` — lemma.

The constant coefficient of F_a is choose(a,2)u⁻¹, where u is the unit equal to a.

Hypotheses: R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R. The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

Proof outline:

1. Use the definition of smoothed-series, multiplicativity of the constant-coefficient ring map, and coeff_mk for b_a.
2. PowerSeries.constantCoeff_invOfUnit supplies u⁻¹.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-series`, `mathlib:PowerSeries.coeff_mk`, `mathlib:PowerSeries.coeff_zero_eq_constantCoeff_apply`, `mathlib:PowerSeries.constantCoeff_invOfUnit`.

Acceptance: Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

Source: Rodrigues Jacinto–Williams, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Smoothed coefficient recurrence

`DirichletPadicLFunctions:L1/series-coefficient-recurrence` — lemma.

For n≥0, a F_{a,n}=choose(a,n+2)−∑_{i=0}^{n−1} choose(a,n−i+1) F_{a,i}.

Hypotheses: R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R. The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

Proof outline:

1. Apply coefficient_n to series-cancellation and use PowerSeries.coeff_mul.
2. Use denominator-coefficients for q_a, then separate the convolution summand containing F_{a,n}; its other factor is q_{a,0}=a.
3. Move the remaining finite sum to the other side. The case n=0 has an empty sum.

Prerequisites: `DirichletPadicLFunctions:L1/series-cancellation`, `DirichletPadicLFunctions:L1/denominator-coefficients`, `DirichletPadicLFunctions:L1/denominator-constant`, `mathlib:PowerSeries.coeff_mul`, `mathlib:PowerSeries.coeff_mk`.

Acceptance: For a=2 over ℚ the recurrence gives F_{2,n}=(-1)^n/2^(n+1). At n=0 it gives a F_{a,0}=choose(a,2), with no missing endpoint term.

Source: Rodrigues Jacinto–Williams, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Smoothed series under coefficient change

`DirichletPadicLFunctions:L1/series-coefficient-map` — lemma.

For a ring map f:R→S, the coefficient-wise image of F_a over R equals F_a over S. A unit a maps to a unit, and any certificate of that fact gives the same series.

Hypotheses: R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R. The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test. S is a commutative ring and f:R→S is a ring homomorphism.

Proof outline:

1. Map series-cleared-equation coefficient-wise through f.
2. Use denominator-coefficient-map, PowerSeries.map_C and map_X to identify the target equation.
3. Apply series-uniqueness over S. IsUnit.map supplies admissibility, and the ring-homomorphism laws imply identity and composition compatibility.

Prerequisites: `DirichletPadicLFunctions:L1/series-cleared-equation`, `DirichletPadicLFunctions:L1/denominator-coefficient-map`, `DirichletPadicLFunctions:L1/series-uniqueness`, `mathlib:PowerSeries.map`, `mathlib:PowerSeries.map_C`, `mathlib:PowerSeries.map_X`, `mathlib:IsUnit.map`.

Acceptance: The integral series over ℤ_p maps to the same rational expression over ℚ_p after coefficient extension. Iterated coefficient maps and their composite give identical series.

Source: Rodrigues Jacinto–Williams, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Rational formula for the smoothed series

`DirichletPadicLFunctions:L1/series-fraction-comparison` — theorem.

Let f:R[[T]]→K be a ring homomorphism to a field, with f(T)≠0. Then f(F_a)=1/f(T)−a/((1+f(T))^a−1). In particular this is a comparison after cancellation, not a definition in R[[T]].

Hypotheses: R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R. The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test. K is a field, f:R[[T]]→K is a ring homomorphism, and f(T)≠0.

Proof outline:

1. Denominator-unit and IsUnit.map show that f(q_a) is a unit, hence nonzero in K.
2. Map denominator-factorization to get (1+f(T))^a−1=f(T)f(q_a), which is nonzero.
3. Map series-cleared-equation and divide by that nonzero product. Field algebra gives the stated difference.

Prerequisites: `DirichletPadicLFunctions:L1/denominator-factorization`, `DirichletPadicLFunctions:L1/denominator-unit`, `DirichletPadicLFunctions:L1/series-cleared-equation`, `mathlib:IsUnit.map`.

Acceptance: At a=2 the rational expression simplifies to 1/(2+f(T)). The hypothesis f(T)≠0 excludes using totalized division at the origin to compute the constant coefficient.

Source: Rodrigues Jacinto–Williams, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Arithmetic smoothing measure

`DirichletPadicLFunctions:L1/smoothed-measure` — construction.

For p prime and p∤a, define μ_a in the existing measure carrier D(ℤ_p,ℤ_p) as the inverse Amice transform of F_a over ℤ_p. This is the particular arithmetic measure, not a second definition of the Amice transform.

Hypotheses: p is a prime natural number, a is a natural number, and p does not divide a. Use the existing carrier D(ℤ_p,ℤ_p) of abstract ℤ_p-valued measures and its existing Amice equivalence.

Proof outline:

1. Use Nat.Prime.coprime_iff_not_dvd, PadicInt.norm_natCast_eq_one_iff and PadicInt.isUnit_iff to turn p∤a into the unit hypothesis for smoothed-series.
2. Apply the inverse of AbstractMeasure.amiceTransformEquiv to that integral series. The existing equivalence includes continuity and boundedness of the resulting measure.
3. The forward-transform equation and Mahler values follow from the existing equivalence laws. Injectivity of the existing transform gives uniqueness.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-series`, `mathlib:Nat.Prime.coprime_iff_not_dvd`, `mathlib:PadicInt.norm_natCast_eq_one_iff`, `mathlib:PadicInt.isUnit_iff`, `mathlib:AbstractMeasure.amiceTransformEquiv`.

API:

- `DirichletPadic.amice_smoothedMeasure` (characterisation): The Amice transform of μ_a is F_a for any unit certificate for a; promoted.
- `DirichletPadic.smoothedMeasure_mahler` (data): The nth Mahler value of μ_a is coefficient_n(F_a); promoted.
- `DirichletPadic.smoothedMeasure_unique` (universal-property): A measure with Amice transform F_a equals μ_a; promoted.

Unit tests:

- `SuggestedTests.measure_one`: Over ℤ₃ the a=1 measure is zero.
- `SuggestedTests.measure_two_mass`: Over ℤ₃ the a=2 measure has twice its zeroth Mahler value equal to 1.
- `SuggestedTests.measure_dyadic_mass`: Over ℤ₂ the a=3 measure has zeroth Mahler value 1.

Consumers: RJW Proposition 4.4 and Definition 4.5: Construct the integral power series before applying the existing Amice inverse; coefficient tests detect a sign error in the printed expansion. RJW Proposition 4.6 and DirichletPadicLFunctions:L1: The specific measure and its exact normalization are the input to polynomial moments, restriction to units and the zeta pseudomeasure. ColemanPowerSeries:L2; RJW Proposition 10.4: The Coleman logarithmic derivative compares with this same arithmetic smoothing series, so the sign and coefficient-map laws must be fixed before that comparison.

Acceptance: The construction lands in the existing continuous integral measure carrier at p=2 as well as odd primes. It does not construct the dyadic unit-group pseudomeasure.

Source: Rodrigues Jacinto–Williams, Definition 4.5 and Proposition 4.6, printed p. 137 / PDF 38. The specific arithmetic measure is defined exactly as the source prescribes; the pinned library already supplies the requisite ℤ_p-coefficient Amice inverse.

### Amice transform of the smoothing measure

`DirichletPadicLFunctions:L1/measure-amice` — lemma.

The Amice transform of μ_a equals F_a over ℤ_p, independently of the chosen proof that a is a unit.

Hypotheses: p is a prime natural number, a is a natural number, and p does not divide a. Use the existing carrier D(ℤ_p,ℤ_p) of abstract ℤ_p-valued measures and its existing Amice equivalence.

Proof outline:

1. Unfold smoothed-measure and use the inverse/forward laws of AbstractMeasure.amiceTransformEquiv.
2. Use amiceTransformEquiv_apply to identify the forward map with amiceTransform; unit-certificate proof irrelevance identifies the series.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-measure`, `mathlib:AbstractMeasure.amiceTransformEquiv`, `mathlib:AbstractMeasure.amiceTransformEquiv_apply`.

Acceptance: This equality fixes the sign: at a=2 and p=3 its constant coefficient is +1/2.

Source: Rodrigues Jacinto–Williams, Definition 4.5, printed p. 137 / PDF 38. Defining property of the source measure, transported through the existing equivalence.

### Mahler values of the smoothing measure

`DirichletPadicLFunctions:L1/measure-mahler` — lemma.

For each n≥0, μ_a applied to the continuous nth Mahler basis function equals coefficient_n(F_a).

Hypotheses: p is a prime natural number, a is a natural number, and p does not divide a. Use the existing carrier D(ℤ_p,ℤ_p) of abstract ℤ_p-valued measures and its existing Amice equivalence.

Proof outline:

1. Apply coefficient_n to measure-amice.
2. Use AbstractMeasure.coeff_amiceTransformEquiv and amiceTransformEquiv_apply.

Prerequisites: `DirichletPadicLFunctions:L1/measure-amice`, `mathlib:AbstractMeasure.coeff_amiceTransformEquiv`, `mathlib:AbstractMeasure.amiceTransformEquiv_apply`.

Acceptance: At p=3,a=2,n=0 the value is 1/2; at p=2,a=3,n=0 it is 1. Ordinary powers x^k require an additional moment calculation and are not identified with Mahler functions.

Source: Rodrigues Jacinto–Williams, Definition 4.5 and the reference to Corollary 3.30 before Proposition 4.4, printed p. 137 / PDF 38. Coefficient-level consequence of the defining Amice transform; the equivalence with Mahler values is the pinned baseline.

### Uniqueness of the smoothing measure

`DirichletPadicLFunctions:L1/measure-uniqueness` — lemma.

Every ℤ_p-valued measure on ℤ_p whose Amice transform is F_a equals μ_a.

Hypotheses: p is a prime natural number, a is a natural number, and p does not divide a. Use the existing carrier D(ℤ_p,ℤ_p) of abstract ℤ_p-valued measures and its existing Amice equivalence.

Proof outline:

1. Compare its assumed transform with measure-amice.
2. Apply the existing AbstractMeasure.injective_amiceTransform in the coefficient ring ℤ_p.

Prerequisites: `DirichletPadicLFunctions:L1/measure-amice`, `mathlib:AbstractMeasure.injective_amiceTransform`.

Acceptance: The zero transform forces μ₁=0. No independent measure-space carrier or new general uniqueness theorem is introduced.

Source: Rodrigues Jacinto–Williams, Definition 4.5, printed p. 137 / PDF 38. Uniqueness of this particular arithmetic measure uses the existing general Amice injectivity theorem.

## Source corrections

The [published text](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf) was collated with
[arXiv v2](https://arxiv.org/pdf/2309.15692v2) at the passages recorded below. These are worker findings
awaiting independent verification. The sourceVersions and sourceIssues records preserve the exact
versions, locators, formulas and bounded correction searches. The campaign already flags the zero-value
and k=1 endpoint conventions; this checkpoint supplies their precise published locators.

- **DirichletPadicLFunctions/E1** (misprint; affects the proof), Proposition 4.4, last displayed equation of the proof: printed p. 137 / PDF 38; arXiv v2 p. 27. Insert a minus before the sum. Equivalently F_a(T)=g(T)/(1+Tg(T)). The integral cancellation nodes use b_a/q_a, with q_a=a(1+Tg) and b_a=ag. Since (1+Tg)⁻¹=1+∑_{n≥1}(−Tg)^n, subtracting it from 1 negates the tail. At a=2, g=1/2 and the correct F₂=1/(2+T) has constant +1/2, whereas the printed tail has constant −1/2. The integrality statement remains valid; the displayed equality has the wrong sign.
- **DirichletPadicLFunctions/E2** (misprint; affects nothing), Opening paragraph of §4.1: printed p. 136 / PDF 37; arXiv v2 p. 26. For f(t)=t/(e^t−1), with its analytic value at zero, replace the derivative term by (−1)^k f^(k+1)(0)/(k+1). The Bernoulli expression at the end of the source sentence is the correct one. The source defines f^(m)(0)=B_m with B₁=−1/2. Thus f(0)=1, already contradicting the printed derivative term at k=0 because ζ(0)=−1/2. The corrected term equals (−1)^k B_{k+1}/(k+1). This does not change Lemma 4.2’s separate formula for f_a.
- **DirichletPadicLFunctions/E3** (error; affects the proof), Parameter choice and decay assertion in §4.1 immediately before Lemma 4.2: printed p. 136 / PDF 37; arXiv v2 p. 26. The related polynomial aside in §10.2, published p. 165 / PDF 66, was checked in the published version. Require a positive integer coprime to p for the asserted rapidly decreasing smoothed function and its Mellin integral. The nondegenerate arithmetic construction takes a>1, as the campaign already specifies. The printed condition permits a=−1. For t>0, f_{−1}(t)=1/(e^t−1)+1/(e^{−t}−1)=−1, which does not tend to zero and is not rapidly decreasing. The hypothesis used to apply Theorem 2.4 therefore fails for an allowed parameter. Restricting a>0 repairs this step; a=1 gives the zero function and is used only as a boundary test here. The same positivity qualification is needed for the §10.2 assertion that ((1+T)^a−1)/T is a polynomial: for the allowed integer a=−1 it is −1/(1+T), a unit formal series with infinitely many nonzero coefficients. The Coleman comparison still uses the correct formal series.
- **DirichletPadicLFunctions/E4** (error; affects the proof), Proof of Proposition 4.11: printed p. 139 / PDF 40; arXiv v2 p. 28. Treat k=1 separately using 1−p^(k−1)=0. For odd k>1, ζ(1−k)=0; for even k the sign (−1)^k is already one. The interpolation theorem remains valid for all k≥1. At k=1 the source assertion would force ζ(0)=0, but ζ(0)=−1/2. Its multiplication by the zero Euler factor still gives the required equality. The endpoint is already flagged in the campaign specification and accepted RS-14; this item records the precise published locator.
- **DirichletPadicLFunctions/E5** (error; affects a stated result), Corollary 2.8: printed p. 112 / PDF 13; arXiv v2 p. 9. Compare the B₁ convention in Remark 2.5, published p. 111 / PDF 12. With the source convention B₁=−1/2, the formula valid for every n≥0 is ζ(−n)=(−1)^n B_{n+1}/(n+1). Alternatively retain the printed minus formula for n≥1 and state ζ(0)=−1/2 separately. At n=0 the printed right-hand side is +1/2, whereas ζ(0)=−1/2. For n>0 the conventional minus formula holds because B_m=0 for odd m>1. The exact all-n corrected formula is already proved by the pinned Mathlib riemannZeta_neg_nat_eq_bernoulli and is reused, not planned here.

No correction was located in the checked journal page, arXiv version list, author publication pages,
Crossref relations or targeted searches. This is a bounded search, not a claim that no correction exists.
The packet uses the corrected sign, positive arithmetic parameter and ζ(0)=−1/2 throughout. No author
contact or independent-review verdict is claimed.

## Remaining source decomposition and ownership

### DirichletPadicLFunctions:L0 — partial

- Source-decompose the actual Mellin continuation and differentiation/decay argument, then compare algebraic Bernoulli values through explicit complex and p-adic embeddings. The negative-zeta formula, including ζ(0)=−1/2, already exists; E2 and E5 record source normalization errors.
- Import generalized Bernoulli/finite Fourier data from the existing ModularForms Layer 0; compare Dedekind zeta with the meromorphic germ and residue supplied through AutomorphicLFunctionsAndLocalFactors:AL.1 and Mathlib’s real class-number limit; instantiate GlobalNumberFields Layers 9–10 idele/infinity-type conventions.

### DirichletPadicLFunctions:L1 — partial

- Prove the ordinary polynomial moments in Proposition 4.6 from the L0 smoothed Mellin calculation and the L2 Amice differential-operator comparison. This packet supplies exact Mahler coefficients only.
- Prove ψ-invariance (Lemma 4.7) and unit-restriction Euler factors (Proposition 4.8), obtaining the exact L2 operator contracts and checking the domain of the intermediate 1/T expressions rather than applying integral-series operators outside their domain.
- Construct x⁻¹ times the restricted measure, verify regularity and smoothing compatibility, and instantiate PadicMeasuresIwasawaAlgebras:L3 pseudomeasures with its exact available node IDs. The new generic evaluation packet does not supply the missing arithmetic regularity or completed-group-ring comparisons.
- Prove independence of the smoothing parameter, interpolation for every k≥1 including the k=1 zero Euler factor, odd-prime parity/descent, and denominator-qualified Kummer congruences. Retain a separate integral dyadic unit-group construction; this checkpoint proves only dyadic integrality of F_a and μ_a.
- Prove measure coefficient-extension/descent maps through the shared measure API. The series coefficient-map theorem here alone is not a scalar-extension theorem for measures or analytic families.

### DirichletPadicLFunctions:L2 — not_read

- Read and decompose the actual p-power twists, roots-of-unity/Gauss computation, integral primitive tame-character measure, and all scalar/conductor comparisons. Reuse the generic L2 operators and the primitive conductor when evaluating characters at p; treat the trivial branch separately.

### DirichletPadicLFunctions:L3 — not_read

- Read and decompose branch interpolation, the complex and p-adic cyclotomic logarithm formulas, the pure p-power conductor case, pole numerator/convergence/simple-zero division and residue coordinate change. Import ColemanIntegration:L0 logarithms and LocallyAnalyticDistributions:L3 coordinates; retain the integral ±1×(1+4ℤ₂) branch.

### DirichletPadicLFunctions:L4 — not_read

- Read and decompose actual p-stabilized Eisenstein modular forms, their coefficient measures and pseudomeasure constant term, tame-character families and integral coefficient congruences. Import the existing ModularForms classical carriers; geometric affinoid realization and Hida–Coleman control belong to PadicFamilies.

No external requests are needed by the declarations in this checkpoint: their exact inputs exist in
the pinned library. This does not close the campaign interfaces. A continuation constructing unit
restriction, generalized coefficient measures or pseudomeasures must use the precise available supplier
nodes and request any missing statements at their owners. In particular the published L3 pseudomeasure
evaluation checkpoint supplies generic conditional algebra; it does not prove the arithmetic smoothing
regularity, the completed-group-ring comparison, or the odd-prime/dyadic augmentation arguments.

The retained RS-14 scopes are recorded verbatim in the five gaps. The general character/continuation
interfaces formerly assigned to the retired AnalyticNumberTheory:AN.1 use the reviewed Mathlib upstream
owners instead. The order ColemanIntegration:L0 → DirichletPadicLFunctions:L3 → ColemanIntegration:L3
is preserved. Generalized Bernoulli and classical character Eisenstein carriers remain in ModularForms
Layer 0. Hida–Coleman geometric family realization remains in PadicFamilies. No existing roadmap is
re-planned.

The proposed L1 planets are Smoothed power series, Integral cancellation formula and Smoothed measure.
The auxiliary denominator and its API remain ordinary declaration nodes.

## Sources and evidence

- Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Essential Number Theory 4 (2025), no. 1, 101–216; DOI 10.2140/ent.2025.4.101. PDF 37–40, printed 136–139: all of §4, including Lemmas 4.2–4.3, Proposition 4.4, Definition 4.5, Proposition 4.6, Lemma 4.7, Proposition 4.8, Definitions 4.9–4.10 and Proposition 4.11 with their proofs; beginning of §5.1 on PDF 40. PDF 66, printed 165: §10.2, Lemma 10.3 and Propositions 10.4 / Lemma 10.5 with their proofs, to verify the Coleman-series consumer and sign. PDF 12–13, printed 111–112: the end of Theorem 2.4 and its proof, Bernoulli convention in Remark 2.5, Lemma 2.6 and its proof, Lemma 2.7 and Corollary 2.8. This is a partial reading, not a source-complete extraction of §§2–8. SHA-256 `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`; accessed 2026-09-26.
- Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), arXiv:2309.15692v2, 19 December 2024. PDF 26–28, full pages, collated with published §4; PDF 9, Lemma 2.7 and Corollary 2.8 and surrounding text, collated with published PDF 13. SHA-256 `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4`; accessed 2026-09-26.

The packet lists every cited pinned declaration, its exact file and the statement ranges read. Existing power-series inversion, Amice inversion and negative-zeta values are baseline citations, not new nodes.
