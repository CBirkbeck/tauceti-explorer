# Dirichlet p-adic L-functions, special values, and Eisenstein measures

This roadmap retains the explicit rational arithmetic construction under accepted RS-14. The existing
ModularForms and GlobalNumberFields roadmaps own the classical carriers and character conventions;
PadicMeasuresIwasawaAlgebras owns general measure/Amice and pseudomeasure interfaces;
LocallyAnalyticDistributions owns the analytic character-coordinate operations. The new work here is the
specific arithmetic construction, its values and its normalization comparisons. None of those shared
carriers is redefined.

**Unit/numerator partial checkpoint, 27 September 2026.** All five layers L0–L4 remain in scope.
The 25 predecessor declarations are preserved verbatim. Twenty new nodes specify the arithmetic
root-average calculation, the bounded ψ-invariance proof, unit Euler factors and the integral numerator.
The actual generic operators are imported from the measure roadmap, including its inverse weighting.
Two precise generic averaging requests remain open there. Their gap propagates to the arithmetic
ψ-invariance and numerical unit/numerator moments; the numerator construction, support, primitive
characterization and Amice comparison already have exact supplier nodes. No whole layer is closed,
and no conclusion is packaged as a hypothesis of its own theorem.

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
their Bernoulli values now have the explicit proof chain below, with its generic moment comparison
imported from its exact L2 supplier node.

The coefficient recurrence

    a F_{a,n} = choose(a,n+2) − Σ_{i<n} choose(a,n−i+1) F_{a,i}

supplies concrete values and an independent sign check. Coefficient ring maps preserve both q_a and F_a;
the uniqueness proof establishes this without choosing a second inverse construction. Scalar extension
of the measures themselves requires the common measure API and is kept as a distinct comparison gap.

ColemanPowerSeries:L2 uses the same normalization: RJW Proposition 10.4 identifies the logarithmic
derivative of the cyclotomic-unit series with a−1−F_a. The arithmetic smoothing sign is fixed here;
the Coleman owner proves its own comparison and handles its operator conventions.

## Bernoulli coefficients and ordinary moments

Over a commutative ℚ-algebra R, use the existing formal series E=exp(X) and
B=Σ B_n Xⁿ/n!, with B₁=−1/2. Put h=E−1 and B_a=B(aX). The constant coefficient of h is
zero, so formal substitution is licensed. Neither the exponential series nor division by n! is being
constructed over ℤ_p.

Substitution and the existing Bernoulli identity give

    h q_a(h) = E^a−1,       B_a q_a(h) = a B,
    X F_a(h) = B−B_a.

For the second equality, rescale B(E−1)=X by a and cancel h by multiplying by B and then
cancelling X. This works even with zero divisors in R. For the third, substitute into the integral
cleared equation and cancel the unit q_a(h). Taking coefficient k+1 yields

    k! [X^k] F_a(exp(X)−1) = (1−a^(k+1)) B_(k+1)/(k+1).

This is an arithmetic specialization of existing formal Bernoulli theory, not a new Bernoulli carrier.
The algebraic route does not discharge L0's required analytic Mellin continuation, decay or
differentiation argument.

For the actual integral μ_a, `PadicMeasuresIwasawaAlgebras:L2/ordinary-moment-exp` identifies its
ordinary moment with the factorial-normalized coefficient after extending its Amice coefficients to
ℚ_p and substituting exp(X)−1. That node treats every μ:D(ℤ_p,ℤ_p), not only μ_a, and its
proof chain uses weighting, the division-free Mahler recurrence and formal derivative identities.
This imports the accepted RS-14 owner's construction without repeating it. The arithmetic specialization gives

    (μ_a(x↦x^k) : ℚ_p) = ((1−a^(k+1)) B_(k+1)/(k+1) : ℚ_p).

The measure is evaluated in ℤ_p first. This avoids assuming an unplanned scalar-extension map on
measures. It also proves that this **smoothed** rational value is p-adically integral. It does not
prove unsmoothed integrality or Kummer congruences.

The same rational number has complex image (−1)^k(1−a^(k+1))ζ(−k), by the pinned negative-zeta
formula, including k=0. There is no ℂ-to-ℂ_p transport. For p=3,a=2, the first four ordinary
moments are 1/2, −1/4, 0, 1/8. In particular, the second moment is not its Mahler coefficient 1/8,
and the third moment is not its exponential-series coefficient 1/48. At p=2,a=3 the first moment
is −2/3, an integral dyadic value computed in ℚ₂, with no inversion of 2 in ℤ₂.

### Shared denominator ownership

The q_a introduced here is also the finite geometric sum Σ_{i<a}(1+T)^i used for the Coleman
cyclotomic unit. These are two formulas for one arithmetic object, not two carriers. The Coleman
comparison must import this L1 owner and prove the finite-sum identification at its own L2.
The separate Coleman ownership correction in PR #3104 now imports this denominator and retains
the finite-sum equality as a comparison. There is no reverse prerequisite from this L1 to Coleman:L2.

## Declaration plan

The packet has 45 unchecked declarations and 38 API entries. Its five definition/construction nodes
carry 25 tests; one inherited comparison has an additional test. The suggested file contains all
26 packet tests and two further examples, for 28 typed examples. The ordinary-moment supplier is
resolved to its exact L2 node. The new averaging requests are the only open cross-roadmap requests
in this checkpoint. Detailed remaining source obligations follow the declaration plan.

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
- `DirichletPadic.exp_sub_one_mul_smoothingDenominator_subst` (compatibility): Over a commutative ℚ-algebra, (E−1)q_a(E−1)=E^a−1; promoted.
- `DirichletPadic.bernoulli_mul_smoothingDenominator_subst` (compatibility): B_a q_a(E−1)=C(a)B over a commutative ℚ-algebra; promoted.

Unit tests:

- `SuggestedTests.denominator_zero`: q₀=0 over ℤ.
- `SuggestedTests.denominator_one`: q₁=1 over ℤ.
- `SuggestedTests.denominator_two`: q₂=2+T over ℤ.

Consumers: RJW Proposition 4.4 and Definition 4.5: Construct the integral power series before applying the existing Amice inverse; coefficient tests detect a sign error in the printed expansion. RJW Proposition 4.6 and DirichletPadicLFunctions:L1: The specific measure and its exact normalization are the input to polynomial moments, restriction to units and the zeta pseudomeasure. ColemanPowerSeries:L2; RJW Proposition 10.4: The Coleman logarithmic derivative compares with this same arithmetic smoothing series, so the sign and coefficient-map laws must be fixed before that comparison. RJW Lemmas 4.2–4.3 and Proposition 4.6; this checkpoint's formal Bernoulli and moment comparisons: Evaluate the same arithmetic object against ordinary polynomial functions; retain the rational scalar and factorial/sign normalization before using complex or p-adic embeddings.

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
- `DirichletPadic.X_mul_smoothedSeries_subst_exp` (compatibility): Over a commutative ℚ-algebra with unit a, X F_a(E−1)=B−B_a; promoted.
- `DirichletPadic.factorial_mul_coeff_smoothedSeries_subst_exp` (data): The factorial-normalized coefficient is the rational smoothed Bernoulli value, including k=0; promoted.

Unit tests:

- `SuggestedTests.series_one`: F₁=0 over ℚ.
- `SuggestedTests.series_two_sign`: Over ℚ, F₂ has constant coefficient 1/2 and linear coefficient −1/4.
- `SuggestedTests.series_three_dyadic`: Over ℤ₂, the unit parameter 3 gives constant coefficient 1. This needs no inverse of 2.
- `SuggestedTests.series_exp_one`: Over ℚ, F₁(exp−1)=0.
- `SuggestedTests.series_exp_two`: Over ℚ, F₂(exp−1) has coefficients 1/2,−1/4,0 in degrees 0–2.
- `SuggestedTests.series_exp_factorial`: Over ℚ, coefficient₃(F₂(exp−1))=1/48; its factorial-normalized value is 1/8.

Consumers: RJW Proposition 4.4 and Definition 4.5: Construct the integral power series before applying the existing Amice inverse; coefficient tests detect a sign error in the printed expansion. RJW Proposition 4.6 and DirichletPadicLFunctions:L1: The specific measure and its exact normalization are the input to polynomial moments, restriction to units and the zeta pseudomeasure. ColemanPowerSeries:L2; RJW Proposition 10.4: The Coleman logarithmic derivative compares with this same arithmetic smoothing series, so the sign and coefficient-map laws must be fixed before that comparison. RJW Lemmas 4.2–4.3 and Proposition 4.6; this checkpoint's formal Bernoulli and moment comparisons: Evaluate the same arithmetic object against ordinary polynomial functions; retain the rational scalar and factorial/sign normalization before using complex or p-adic embeddings.

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
- `DirichletPadic.smoothedMeasure_moment` (data): The kth ordinary moment, embedded in ℚ_p, is (1−a^(k+1))B_(k+1)/(k+1); promoted with the exact PadicMeasuresIwasawaAlgebras:L2/ordinary-moment-exp supplier.
- `DirichletPadic.smoothedBernoulli_mem_padicInt` (structure): The smoothed rational Bernoulli value lies in the image of ℤ_p in ℚ_p; promoted and using the exact generic moment supplier.

Unit tests:

- `SuggestedTests.measure_one`: Over ℤ₃ the a=1 measure is zero.
- `SuggestedTests.measure_two_mass`: Over ℤ₃ the a=2 measure has twice its zeroth Mahler value equal to 1.
- `SuggestedTests.measure_dyadic_mass`: Over ℤ₂ the a=3 measure has zeroth Mahler value 1.
- `SuggestedTests.moment_zero_sign`: At p=3,a=2 the embedded ordinary degree-zero moment is 1/2.
- `SuggestedTests.moment_one_dyadic`: At p=2,a=3 the embedded degree-one moment is −2/3.
- `SuggestedTests.moment_two_not_mahler`: At p=3,a=2 the embedded degree-two ordinary moment is zero, unlike the degree-two Mahler value 1/8.
- `SuggestedTests.moment_three_factorial`: At p=3,a=2 the embedded degree-three ordinary moment is 1/8, not the exponential coefficient 1/48.

Consumers: RJW Proposition 4.4 and Definition 4.5: Construct the integral power series before applying the existing Amice inverse; coefficient tests detect a sign error in the printed expansion. RJW Proposition 4.6 and DirichletPadicLFunctions:L1: The specific measure and its exact normalization are the input to polynomial moments, restriction to units and the zeta pseudomeasure. ColemanPowerSeries:L2; RJW Proposition 10.4: The Coleman logarithmic derivative compares with this same arithmetic smoothing series, so the sign and coefficient-map laws must be fixed before that comparison. RJW Lemmas 4.2–4.3 and Proposition 4.6; this checkpoint's formal Bernoulli and moment comparisons: Evaluate the same arithmetic object against ordinary polynomial functions; retain the rational scalar and factorial/sign normalization before using complex or p-adic embeddings.

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

### Exponential denominator factorization

`DirichletPadicLFunctions:L1/denominator-exp-factorization` — lemma.

(E−1) q_a(E−1)=E^a−1 in R[[X]], for every natural a (including a=0).

Hypotheses: R is a commutative ℚ-algebra and a is a natural number. E=PowerSeries.exp R, h=E−1, B=bernoulliPowerSeries R and B_a=rescale(a) B. All of these are the existing Mathlib series; q_a is this packet's integral smoothing denominator.

Proof outline:

1. constantCoeff_exp implies constantCoeff(h)=0. HasSubst.of_constantCoeff_zero' therefore licenses substAlgHom h; no analytic exponential on ℤ_p is invoked.
2. Apply this algebra homomorphism to denominator-factorization. Its X and constant rules identify the two sides with h q_a(h) and (1+h)^a−1=E^a−1.

Prerequisites: `DirichletPadicLFunctions:L1/denominator-factorization`, `mathlib:PowerSeries.exp`, `mathlib:PowerSeries.constantCoeff_exp`, `mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'`, `mathlib:PowerSeries.substAlgHom`, `mathlib:PowerSeries.coe_substAlgHom`, `mathlib:PowerSeries.substAlgHom_X`, `mathlib:PowerSeries.subst_C`.

Acceptance: At a=0 both sides vanish; at a=1 the equation is h=h. No inverse of a or X is required.

Source: Rodrigues Jacinto–Williams, Lemma 4.3 and equation (4-1), printed p. 136 / PDF 37; Proposition 4.4, printed p. 137 / PDF 38. Formal-series implementation of the source's change T=exp(t)−1, not an assertion of analytic convergence. The algebraic Bernoulli identity is already baseline; only its arithmetic smoothing specialization is new. The ℚ-algebra generality is an explicit extension of the source's scalar calculation.

### Bernoulli denominator comparison

`DirichletPadicLFunctions:L1/bernoulli-denominator-comparison` — lemma.

B_a q_a(E−1)=C(a) B in R[[X]], for every natural a.

Hypotheses: R is a commutative ℚ-algebra and a is a natural number. E=PowerSeries.exp R, h=E−1, B=bernoulliPowerSeries R and B_a=rescale(a) B. All of these are the existing Mathlib series; q_a is this packet's integral smoothing denominator.

Proof outline:

1. Rescale the baseline identity B(E−1)=X by a. The ring-map laws, exp_pow_eq_rescale_exp and rescale_X give B_a(E^a−1)=C(a)X.
2. Use denominator-exp-factorization to replace E^a−1 by h q_a(h). The unscaled Bernoulli identity also gives C(a) B h=C(a)X.
3. Thus h times the two proposed sides agrees. Multiply that equality by B and use Bh=X; cancel X with PowerSeries.X_mul_cancel. This avoids a domain hypothesis and does not divide by h.

Prerequisites: `DirichletPadicLFunctions:L1/denominator-exp-factorization`, `mathlib:bernoulliPowerSeries`, `mathlib:bernoulliPowerSeries_mul_exp_sub_one`, `mathlib:PowerSeries.rescale`, `mathlib:PowerSeries.exp_pow_eq_rescale_exp`, `mathlib:PowerSeries.rescale_X`, `mathlib:PowerSeries.X_mul_cancel`.

Acceptance: At a=1 the equation is B=B; at a=0 both sides are zero. It holds over commutative ℚ-algebras with zero divisors.

Source: Rodrigues Jacinto–Williams, Lemma 4.3 and equation (4-1), printed p. 136 / PDF 37; Proposition 4.4, printed p. 137 / PDF 38. Formal-series implementation of the source's change T=exp(t)−1, not an assertion of analytic convergence. The algebraic Bernoulli identity is already baseline; only its arithmetic smoothing specialization is new. The ℚ-algebra generality is an explicit extension of the source's scalar calculation.

### Smoothed Bernoulli generating series

`DirichletPadicLFunctions:L1/series-exp-bernoulli` — theorem.

For a with unit image in R, X F_a(E−1)=B−B_a in R[[X]].

Hypotheses: R is a commutative ℚ-algebra and a is a natural number. E=PowerSeries.exp R, h=E−1, B=bernoulliPowerSeries R and B_a=rescale(a) B. All of these are the existing Mathlib series; q_a is this packet's integral smoothing denominator. The image of a in R is a unit; use the same smoothedSeries and its unit certificate as in the integral construction.

Proof outline:

1. Apply substAlgHom h to series-cleared-equation to get h q_a(h) F_a(h)=q_a(h)−C(a). Formal substitutability follows as in denominator-exp-factorization.
2. Multiply by B and use B h=X. Replace C(a) B by B_a q_a(h), using bernoulli-denominator-comparison.
3. Both sides now have the factor q_a(h). It is a unit: denominator-unit followed by IsUnit.map under substAlgHom h. Cancel this unit to obtain the equality.
4. All steps are formal algebra. This is a coefficient-level route to the Bernoulli application, not a replacement for the retained real Mellin continuation, decay or differentiation proof.

Prerequisites: `DirichletPadicLFunctions:L1/series-cleared-equation`, `DirichletPadicLFunctions:L1/denominator-unit`, `DirichletPadicLFunctions:L1/denominator-exp-factorization`, `DirichletPadicLFunctions:L1/bernoulli-denominator-comparison`, `mathlib:bernoulliPowerSeries_mul_exp_sub_one`, `mathlib:IsUnit.map`, `mathlib:IsUnit.mul_left_cancel`, `mathlib:PowerSeries.exp`, `mathlib:PowerSeries.constantCoeff_exp`, `mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'`, `mathlib:PowerSeries.substAlgHom`, `mathlib:PowerSeries.coe_substAlgHom`, `mathlib:PowerSeries.substAlgHom_X`, `mathlib:PowerSeries.subst_C`.

Acceptance: Over ℚ at a=2, F₂(E−1)=1/(1+E) has coefficients 1/2, −1/4, 0, 1/48 in degrees 0–3. At a=1 the series is zero.

Source: Rodrigues Jacinto–Williams, Lemma 4.3 and equation (4-1), printed p. 136 / PDF 37; Proposition 4.4, printed p. 137 / PDF 38. Formal-series implementation of the source's change T=exp(t)−1, not an assertion of analytic convergence. The algebraic Bernoulli identity is already baseline; only its arithmetic smoothing specialization is new. The ℚ-algebra generality is an explicit extension of the source's scalar calculation.

### Factorial-normalized smoothing coefficients

`DirichletPadicLFunctions:L1/series-exp-coefficients` — lemma.

For every k≥0, k!·coefficient_k(F_a(E−1))=algebraMap ℚ R ((1−a^(k+1)) B_(k+1)/(k+1)), with Mathlib's bernoulli and B₁=−1/2.

Hypotheses: R is a commutative ℚ-algebra and a is a natural number. E=PowerSeries.exp R, h=E−1, B=bernoulliPowerSeries R and B_a=rescale(a) B. All of these are the existing Mathlib series; q_a is this packet's integral smoothing denominator. The image of a in R is a unit; k is a natural number. Rational denominators are formed in ℚ before applying algebraMap, never in ℤ_p.

Proof outline:

1. Take coefficient k+1 of series-exp-bernoulli. coeff_succ_X_mul identifies the left side as coefficient k of F_a(h).
2. Unfold the existing bernoulliPowerSeries and use coeff_mk and coeff_rescale. The right side is the image of (1−a^(k+1)) B_(k+1)/(k+1)!.
3. Multiply by k! and use (k+1)!=(k+1)k! in ℚ, where factorials are nonzero. Ring-map laws transport the resulting equality to R. In particular k=0 is retained.

Prerequisites: `DirichletPadicLFunctions:L1/series-exp-bernoulli`, `mathlib:PowerSeries.coeff_succ_X_mul`, `mathlib:bernoulliPowerSeries`, `mathlib:PowerSeries.coeff_mk`, `mathlib:PowerSeries.coeff_rescale`.

Acceptance: At k=0 the value is (a−1)/2, not its negative. For a=2,k=3 the coefficient is 1/48 but the factorial-normalized value is 1/8.

Source: Rodrigues Jacinto–Williams, Lemma 4.2, printed p. 136 / PDF 37, together with Lemma 4.3 and Proposition 4.6. Formal-series implementation of the source's change T=exp(t)−1, not an assertion of analytic convergence. The algebraic Bernoulli identity is already baseline; only its arithmetic smoothing specialization is new. The ℚ-algebra generality is an explicit extension of the source's scalar calculation.

### Complex comparison of the smoothed rational value

`DirichletPadicLFunctions:L0/smoothed-value-complex` — comparison.

For a,k∈ℕ the complex image of the rational number (1−a^(k+1)) B_(k+1)/(k+1) equals (−1)^k (1−a^(k+1)) ζ(−k).

Hypotheses: a,k are natural numbers. Bernoulli numbers use Mathlib's B₁=−1/2 convention. The comparison uses algebraMap ℚ ℂ, not an isomorphism from ℂ to a p-adic field.

Proof outline:

1. Rewrite ζ(−k) by the existing riemannZeta_neg_nat_eq_bernoulli. This statement includes k=0.
2. The two factors (−1)^k multiply to 1. Use the rational-to-complex ring-map laws to identify the result with the indicated rational image.
3. This is only the smoothing and embedding comparison. The baseline special-value theorem is not re-proved; the analytic Mellin argument remains an L0 gap.

Prerequisites: `mathlib:riemannZeta_neg_nat_eq_bernoulli`.

Unit tests:

- `SuggestedTests.complex_zero_sign`: (1−2)ζ(0)=1/2 in ℂ.

Acceptance: At a=2,k=0, (1−2)ζ(0)=1/2. For k=1 the value is (1−a²)/12. This formula does not yet include any unit-restriction Euler factor.

Source: Rodrigues Jacinto–Williams, Lemma 4.2 and Proposition 4.6, printed pp. 136–137 / PDF 37–38. Comparison of the source's complex notation with an explicit rational value using the existing corrected negative-zeta formula. No transport of arbitrary complex values is asserted.

### Ordinary moments of the smoothing measure

`DirichletPadicLFunctions:L1/measure-ordinary-moment` — theorem.

For p prime, p∤a and every k≥0, the image in ℚ_p of μ_a(x↦x^k) equals algebraMap ℚ ℚ_p ((1−a^(k+1)) B_(k+1)/(k+1)).

Hypotheses: p is prime; a,k are natural numbers; p does not divide a. μ_a is the already planned ℤ_p-valued smoothedMeasure and x↦x^k is (ContinuousMap.id ℤ_p)^k. The measure is evaluated before the value is embedded into ℚ_p. No scalar-extension construction of measures and no ℤ_p-coefficient exponential series is assumed.

Proof outline:

1. Apply the generic formal-exponential/Amice moment comparison supplied by PadicMeasuresIwasawaAlgebras:L2/ordinary-moment-exp to μ_a. That comparison identifies its embedded ordinary moment with k! times coefficient k of its coefficient-extended Amice series after substituting exp−1.
2. Use measure-amice and series-coefficient-map for ℤ_p→ℚ_p to identify that coefficient-extended Amice series with F_a over ℚ_p. The norm/unit criteria already used in smoothed-measure supply the ℤ_p unit certificate; IsUnit.map supplies its image in ℚ_p.
3. Apply series-exp-coefficients with R=ℚ_p. No factor (−1)^k remains in the Bernoulli expression. The separate smoothed-value-complex node recovers the source's complex notation via the same rational number.
4. The generic comparison is supplied by the exact L2 node, whose weighting/Mahler/formal-calculus prerequisites end in the pinned baseline. This fills the supplier boundary in the proof plan, not an implementation claim.

Prerequisites: `DirichletPadicLFunctions:L1/measure-amice`, `DirichletPadicLFunctions:L1/series-coefficient-map`, `DirichletPadicLFunctions:L1/series-exp-coefficients`, `PadicMeasuresIwasawaAlgebras:L2/ordinary-moment-exp`, `mathlib:Nat.Prime.coprime_iff_not_dvd`, `mathlib:PadicInt.norm_natCast_eq_one_iff`, `mathlib:PadicInt.isUnit_iff`, `mathlib:IsUnit.map`.

Acceptance: For p=3,a=2 the moments of degrees 0,1,2,3 are 1/2,−1/4,0,1/8. The degree-two Mahler value is instead 1/8, so these test functions must not be conflated. For p=2,a=3 the degree-one ordinary moment is −2/3 in ℚ₂ and is integral. No inverse of 2 in ℤ₂ is required.

Source: Rodrigues Jacinto–Williams, Proposition 4.6, printed p. 137 / PDF 38, using Corollary 3.30, printed p. 126 / PDF 27. The source's ordinary-moment theorem, expressed through its rational Bernoulli value. The formal coefficient proof route complements, but does not discharge, L0's mandated Mellin argument; the generic moment comparison remains with its accepted RS-14 owner.

### Integrality of smoothed Bernoulli values

`DirichletPadicLFunctions:L1/smoothed-value-integral` — theorem.

For p prime and p∤a, for each k≥0 there exists z∈ℤ_p whose image in ℚ_p is (1−a^(k+1)) B_(k+1)/(k+1).

Hypotheses: p is prime; a,k are natural numbers; p does not divide a. The rational expression is embedded in ℚ_p using algebraMap.

Proof outline:

1. Choose z=μ_a((ContinuousMap.id ℤ_p)^k), which is in ℤ_p because the existing carrier is an integral measure on integral continuous functions.
2. Use measure-ordinary-moment for the required equality in ℚ_p. This is smoothed integrality, not unsmoothed Bernoulli integrality, Kummer congruences or a dyadic pseudomeasure splitting.

Prerequisites: `DirichletPadicLFunctions:L1/measure-ordinary-moment`.

Acceptance: For p=2,a=3,k=1 the value is −2/3, which is 2-adically integral although B₂/2=1/12 is not. The nonunit parameter p=2,a=2 remains excluded.

Source: Rodrigues Jacinto–Williams, Proposition 4.4, Definition 4.5 and Proposition 4.6, printed p. 137 / PDF 38. Immediate arithmetic integrality consequence of the source's integral measure and moment theorem; the claim is explicitly smoothed.

## L1: bounded ψ, unit Euler factors and the arithmetic numerator

Put Z=ℤ_p, B=Z[[T]] and D=D(Z,Z). Write A for the pinned integral Amice equivalence,
φ for pushforward by x↦px, ψ for its bounded left inverse, E for restriction to units,
W for weighting by x and J for inverse weighting. Each generic operator is imported from
PadicMeasuresIwasawaAlgebras:L2 at the exact node IDs below. In particular, J uses the existing
PadicInt.inv, which is the inverse on units and zero on every nonunit. It is not the field inverse
at all nonzero p-adic integers. No generic operator is reconstructed in this roadmap.

The source proves ψμ_a=μ_a by calculating ψ(1/T). That intermediate expression is outside B.
The repair works with the integral F_a=b_a/q_a throughout the operator calculation. In a cyclotomic
coefficient extension K, set Y=1+T inside Frac(K[[T]]). For a primitive p-th root ζ, finite algebra gives

    Σ_{i<p} [1/(ζⁱY−1) − a/((ζⁱY)^a−1)]
      = p [1/(Y^p−1) − a/(Y^(pa)−1)].

The consumer combines two instances of the generic partial-fraction identity. For the second,
ζ^a is primitive because p∤a. Each arithmetic term is the evaluation of the finite polynomial
quotient P/Q representing F_a. This evaluation is legitimate in the receiving field; it never
substitutes a nonzero constant into an arbitrary formal power series.

The further identity identifying the left side with p·φψ_B(F_a) is genuinely missing from the
current supplier blueprint. The exact request below fixes its field, embedding, polynomial
hypotheses and bounded operator. After it is supplied, cancellation of p in the receiving field
and injective descent give φψ_B(F_a)=φ(F_a). Applying ψ_Bφ=id gives ψ_B(F_a)=F_a; Amice
injectivity then gives ψμ_a=μ_a. This open comparison is not hidden in a hypothesis of the Lean
signature. Source issue E6 records the domain gap, already observed in ColemanPowerSeries/E8.

The arithmetic restriction and numerator themselves have direct definitions:

    ρ_a = Eμ_a,                 ν_a = Jμ_a = Jρ_a.

They are actual elements of the existing ambient integral measure carrier. The exact generic
identities already imply Eρ_a=ρ_a, Eν_a=ν_a, Wν_a=ρ_a, and uniqueness of ν_a among unit-supported
solutions of that primitive equation. In particular, support is essential: adding any multiple of
δ₀ does not change Wν, so uniqueness without support would be false. The Amice comparison is
Aν_a=inverseMahler(F_a), with the precise inverseMahler supplied by L2. These statements do not
use the missing root-average input.

Once ψ-invariance is proved, the source's Euler-factor calculation is

    ρ_a = μ_a − φμ_a,
    ρ_a(x^k) = (1−p^k) μ_a(x^k),                    k≥0,
    ν_a(x^k) = ρ_a(x^(k−1)),                        k≥1.

With the existing ordinary-moment theorem, the respective rational images are
(1−p^k)(1−a^(k+1))B_(k+1)/(k+1) and (1−p^(k−1))(1−a^k)B_k/k. Evaluation takes place in Z before
embedding the value into ℚ_p. At k=1 the numerator moment vanishes because 1−p⁰=0; no assertion
that ζ(0)=0 and no cancellation of the zero Euler factor is permitted. There is no formula here
for ν_a(1), the numerator's degree-zero moment.

For p=3,a=2, ρ_a(x)=1/2 while ν_a(x)=0 and ν_a(x²)=1/2. This detects a tempting omission of
inverse weighting. For p=2,a=3 both ρ_a(x) and ν_a(x²) have value 2/3, integral in ℤ₂. These
arithmetic constructions cover all primes. They do not choose a topological generator of ℤ₂×,
prove regularity of [a]−[1], or divide in an unspecified completed group algebra. The actual
pseudomeasure, smoothing independence, parity and Kummer congruences retain their separate gaps.

### Cyclotomic average of the smoothing fractions

`DirichletPadicLFunctions:L1/smoothing-root-average` — `DirichletPadic.smoothed_rational_average` (lemma).

For a characteristic-zero field K, a primitive p-th root ζ∈K, y∈K with y^p≠1 and y^(pa)≠1, and p∤a, the sum over 0≤i<p of [1/(ζ^i y−1)−a/((ζ^i y)^a−1)] equals p[1/(y^p−1)−a/(y^(pa)−1)].

Hypotheses and conventions: p is prime, K is a field of characteristic zero, ζ is a primitive p-th root, a∈ℕ and p∤a, y^p≠1 and y^(pa)≠1.

Proof/construction:

1. Import the generic finite-root partial-fraction identity requested from L2: Σ_i 1/(ζ^i y−1)=p/(y^p−1). This is a finite identity in K, not an application of ψ to a pole.
2. From p∤a and primality obtain gcd(a,p)=1. IsPrimitiveRoot.pow_of_coprime makes ζ^a primitive of order p. Apply the same imported identity to ζ^a and y^a. Its denominator is y^(pa)−1 by commutation of natural powers.
3. Distribute the finite sum across subtraction and the scalar a, and combine the two identities. The displayed nonvanishing hypotheses ensure all denominators at roots are nonzero; no analytic substitution is used.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2`, `mathlib:IsPrimitiveRoot.pow_of_coprime`, `mathlib:Nat.Prime.coprime_iff_not_dvd`.

Acceptance: At p=2,a=3,ζ=−1,y=2 the two summands are 4/7 and 0, agreeing with 2(1/3−3/63)=4/7. At a=1 both sides vanish. The assumption p∤a is essential: at p=2,a=2,y=2 the two sides are −2/3 and 2/5, respectively.

Source: Rodrigues Jacinto–Williams, Lemma 4.7 and its partial-fraction calculation, printed p.137 / PDF38; arXiv v2 p.27. The source computes the unsmoothed partial fractions and then smooths. This node gives only the arithmetic two-term consequence, leaving the generic identity to its owner.

### Frobenius comparison for the smoothed series

`DirichletPadicLFunctions:L1/series-phi-psi-fixed` — `DirichletPadic.phi_psi_smoothedSeries` (lemma).

On B=ℤ_p[[T]], with b=(1+T)^p−1, φ(ψ_B(F_a))=φ(F_a), where φ(F)=F(b) and ψ_B is the exact bounded integral Amice-transported operator.

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Use the requested rational-series averaging comparison in a cyclotomic coefficient extension K. Write F_a=P/Q, where P=Σ_{j<a} choose(a,j+2)T^j and Q=Σ_{j<a} choose(a,j+1)T^j. Their series images are b_a and q_a; Q(0)=a is a unit. The existing cancellation equation supplies QF_a=P.
2. In Frac(K[[T]]) put Y=1+T. The supplier comparison gives p·j(φψ_B F_a)=Σ_i P(ζ^iY−1)/Q(ζ^iY−1). Here polynomial evaluation is finite. It is never PowerSeries.subst at the nonnilpotent constant ζ^i−1.
3. The binomial identities TQ=Y^a−1 and TP=Q−a turn each quotient into 1/(ζ^iY−1)−a/((ζ^iY)^a−1). All divisors are nonzero: for i=0 the linear coefficient detects nonzero T and aT, while for i≠0 the primitive-root/coprimality conditions give nonzero constants. Equivalently this follows from the nonzero polynomials in the field.
4. Apply smoothing-root-average with y=Y. Its hypotheses hold because Y^p−1 and Y^(pa)−1 are nonzero polynomials in characteristic zero (p,a>0). The resulting right side is p·j(φF_a), by series-fraction-comparison for the receiving map j∘φ; this map sends T to the nonzero b.
5. Cancel nonzero p in the field and use the injectivity of the coefficient/series embedding j to descend equality to B. The generic averaging comparison remains an explicit request and gap, so this is a conditional proof plan with an unconditional target signature, not a closed derivation.

Prerequisites: `DirichletPadicLFunctions:L1/smoothing-root-average`, `DirichletPadicLFunctions:L1/series-cancellation`, `DirichletPadicLFunctions:L1/denominator-factorization`, `DirichletPadicLFunctions:L1/series-cleared-equation`, `DirichletPadicLFunctions:L1/series-fraction-comparison`, `PadicMeasuresIwasawaAlgebras:L2/psi-series`, `PadicMeasuresIwasawaAlgebras:L2`.

Acceptance: Both sides are integral series although individual fractions have poles. At a=1 both are zero; no Laurent-series extension of ψ is assumed.

Source: Rodrigues Jacinto–Williams, Lemma 4.7 and its partial-fraction calculation, printed p.137 / PDF38; arXiv v2 p.27. Domain-correct version of the source’s intermediate equality; E6 records the missing domain justification.

### Psi invariance of the smoothing series

`DirichletPadicLFunctions:L1/series-psi-fixed` — `DirichletPadic.psi_smoothedSeries` (theorem).

ψ_B(F_a)=F_a in ℤ_p[[T]].

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Apply the existing planned ψ_B to both sides of series-phi-psi-fixed. Use the exact psi-series-phi law twice: ψ_Bφ=id.
2. This removes φ without introducing a localization action or an invariance hypothesis. The generic averaging gap propagates from series-phi-psi-fixed.

Prerequisites: `DirichletPadicLFunctions:L1/series-phi-psi-fixed`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-phi`.

Acceptance: Works at p=2 for odd a as well as odd p. For a=1 it agrees with ψ_B(0)=0.

Source: Rodrigues Jacinto–Williams, Lemma 4.7 and its partial-fraction calculation, printed p.137 / PDF38; arXiv v2 p.27. The exact arithmetic fixed-point statement on the bounded carrier. Generic root averaging is a requested dependency.

### Psi invariance of the smoothing measure

`DirichletPadicLFunctions:L1/measure-psi-fixed` — `DirichletPadic.psi_smoothedMeasure` (theorem).

ψ(μ_a)=μ_a in D(ℤ_p,ℤ_p).

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Apply injective_amiceTransform. Rewrite A(ψμ_a) using psi-series-intertwining and Aμ_a=F_a using measure-amice.
2. Apply series-psi-fixed, then measure-amice in reverse. The p-adic unit certificate is the same norm/unit criterion as in smoothed-measure.

Prerequisites: `DirichletPadicLFunctions:L1/series-psi-fixed`, `DirichletPadicLFunctions:L1/measure-amice`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-intertwining`, `mathlib:AbstractMeasure.injective_amiceTransform`, `DirichletPadicLFunctions:L1/smoothed-measure`.

Acceptance: This is ψ-invariance of μ_a, not unit support: ψμ_a=μ_a, whereas a unit-supported measure has ψμ=0. For p=3,a=2 the nonzero total mass 1/2 rules out that confusion.

Source: Rodrigues Jacinto–Williams, Lemma 4.7 and its partial-fraction calculation, printed p.137 / PDF38; arXiv v2 p.27. Lemma 4.7 itself, transported through the exact integral Amice comparison.

### Trivial smoothing measure

`DirichletPadicLFunctions:L1/measure-one` — `DirichletPadic.smoothedMeasure_one` (lemma).

For every prime p, the admissible boundary parameter a=1 gives μ_1=0.

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. At a=1 every numerator coefficient choose(1,n+2) vanishes. Unfold the smoothed-series definition and use coefficient extensionality to get F_1=0.
2. Use measure-amice and injective_amiceTransform to conclude μ_1=0. This boundary test is independent of root averaging.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-series`, `DirichletPadicLFunctions:L1/measure-amice`, `mathlib:AbstractMeasure.injective_amiceTransform`.

Acceptance: The later denominator θ_1=[1]−[1] is also zero; the zero measure test does not allow division by θ_1.

Source: Rodrigues Jacinto–Williams, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. Boundary extension of the source’s arithmetic measure definition, used to test the restriction and numerator constructions.

### Unit restriction of the smoothing measure

`DirichletPadicLFunctions:L1/unit-smoothed-measure` — `DirichletPadic.unitSmoothedMeasure` (construction).

Construct ρ_a=unitSmoothedMeasure p a := Eμ_a in D(ℤ_p,ℤ_p). It is the unit restriction on the ambient carrier.

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Apply the existing unitRestriction linear map to the already constructed μ_a. No subtype measure, coefficient extension or new restriction operator is constructed.
2. The definition requires no ψ-invariance. The separate support, difference and moment nodes prove the arithmetic API; the difference and numerical moments inherit the explicit averaging gap.
3. The a=1 API uses measure-one and linearity of E; it does not use averaging.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-measure`, `DirichletPadicLFunctions:L1/measure-one`, `PadicMeasuresIwasawaAlgebras:L2/unit-restriction`.

API:

- `DirichletPadic.unitSmoothedMeasure_eq` (characterisation): ρ_a=Eμ_a.
- `DirichletPadic.unitSmoothedMeasure_supported` (relation): Eρ_a=ρ_a; promoted to unit-smoothed-support.
- `DirichletPadic.unitSmoothedMeasure_eq_sub_phi` (relation): ρ_a=μ_a−φμ_a; promoted to unit-smoothed-difference.
- `DirichletPadic.unitSmoothedMeasure_euler` (data): ρ_a(x^k)=(1−p^k)μ_a(x^k); promoted to unit-smoothed-euler.
- `DirichletPadic.unitSmoothedMeasure_moment` (data): Its embedded moment is (1−p^k)(1−a^(k+1))B_(k+1)/(k+1); promoted to unit-smoothed-moment.
- `DirichletPadic.unitSmoothedMeasure_mass` (simp): ρ_a(1)=0; promoted to unit-smoothed-mass.
- `DirichletPadic.unitSmoothedMeasure_one` (simp): At a=1 the measure ρ_1 is zero.

Unit tests:

- `SuggestedTests.unit_smoothing_mass` (degenerate): For p=3,a=2, ρ_a(1)=0.
- `SuggestedTests.unit_smoothing_first_moment` (computation): For p=3,a=2, the image of ρ_a(x) in ℚ₃ is 1/2.
- `SuggestedTests.unit_smoothing_dyadic` (computation): For p=2,a=3, the image of ρ_a(x) in ℚ₂ is 2/3.
- `SuggestedTests.unit_smoothing_one` (degenerate): For p=3,a=1, ρ_a=0.

Uses:

- `RJW Proposition 4.8`: The restriction removes the Euler factor.
- `RJW equation (4-3) and Definition 4.10`: The numerator is its inverse weighting before any pseudomeasure denominator is inverted.

Acceptance: The integral ambient carrier is retained at p=2. The mass and moment tests depend on the later Euler-factor proof; they are typed target tests, not independently implemented evidence.

Source: Rodrigues Jacinto–Williams, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.27. Arithmetic application of the generic unit restriction already owned by L2.

### Unit support of the restricted smoothing measure

`DirichletPadicLFunctions:L1/unit-smoothed-support` — `DirichletPadic.unitSmoothedMeasure_supported` (lemma).

Eρ_a=ρ_a.

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Unfold unit-smoothed-measure and apply the unitRestriction_idem API of the existing generic unit restriction. This is independent of the averaging request.

Prerequisites: `DirichletPadicLFunctions:L1/unit-smoothed-measure`, `PadicMeasuresIwasawaAlgebras:L2/unit-restriction`.

Acceptance: Equivalent to ψρ_a=0 by the supplier’s unit-support criterion; this statement does not say ψμ_a=0.

Source: Rodrigues Jacinto–Williams, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.27. The source restricts to units; the ambient formulation records that support exactly.

### Euler projector on the arithmetic measure

`DirichletPadicLFunctions:L1/unit-smoothed-difference` — `DirichletPadic.unitSmoothedMeasure_eq_sub_phi` (lemma).

ρ_a=μ_a−φμ_a.

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Use E=id−P from unit-restriction and Pμ=φψμ from phi-psi.
2. Apply measure-psi-fixed to μ_a. Thus Eμ_a=μ_a−φμ_a. This is where the source’s ψ-invariance is required.

Prerequisites: `DirichletPadicLFunctions:L1/unit-smoothed-measure`, `DirichletPadicLFunctions:L1/measure-psi-fixed`, `PadicMeasuresIwasawaAlgebras:L2/unit-restriction`, `PadicMeasuresIwasawaAlgebras:L2/phi-psi`.

Acceptance: Taking total mass gives zero since φ preserves constant test functions. The equality holds on all continuous test functions.

Source: Rodrigues Jacinto–Williams, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.27. The second equality in the proof of Proposition 4.8.

### Euler factor for unit moments

`DirichletPadicLFunctions:L1/unit-smoothed-euler` — `DirichletPadic.unitSmoothedMeasure_euler` (lemma).

For every k≥0, ρ_a(x↦x^k)=(1−p^k)μ_a(x↦x^k) in ℤ_p.

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Evaluate unit-smoothed-difference on the continuous polynomial x^k.
2. Use phi-evaluation to replace (φμ_a)(x^k) by μ_a((px)^k). Pointwise (px)^k=p^k x^k; integral measure linearity extracts p^k. This also holds for k=0, including at x=0.

Prerequisites: `DirichletPadicLFunctions:L1/unit-smoothed-difference`, `PadicMeasuresIwasawaAlgebras:L2/phi-evaluation`.

Acceptance: At k=0 the factor is zero. At p=2,k=1 it is −1, not an inverse of 2.

Source: Rodrigues Jacinto–Williams, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.27. The source’s last equality in the proof of Proposition 4.8.

### Smoothed Bernoulli values on units

`DirichletPadicLFunctions:L1/unit-smoothed-moment` — `DirichletPadic.unitSmoothedMeasure_moment` (theorem).

For k≥0, the image of ρ_a(x^k) in ℚ_p is (1−p^k)(1−a^(k+1))B_(k+1)/(k+1), with rational Bernoulli numbers B₁=−1/2.

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Embed unit-smoothed-euler into ℚ_p. Apply measure-ordinary-moment and preservation of rational/natural scalars by the canonical maps.
2. The result is stated as an equality of two images in ℚ_p, after evaluating the integral measure. It never casts a complex zeta value into a p-adic field.

Prerequisites: `DirichletPadicLFunctions:L1/unit-smoothed-euler`, `DirichletPadicLFunctions:L1/measure-ordinary-moment`.

Acceptance: For p=3,a=2 the moments of degrees 0,1,2,3 are 0,1/2,0,−13/4. For p=2,a=3 the first moment is 2/3.

Source: Rodrigues Jacinto–Williams, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.27. Bernoulli normalization of Proposition 4.8, using the earlier exact rational/complex comparison.

### Zero mass of the unit smoothing measure

`DirichletPadicLFunctions:L1/unit-smoothed-mass` — `DirichletPadic.unitSmoothedMeasure_mass` (lemma).

ρ_a(1)=0 in ℤ_p.

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Specialize unit-smoothed-euler to k=0. The continuous function x^0 is 1 everywhere and 1−p^0=0.

Prerequisites: `DirichletPadicLFunctions:L1/unit-smoothed-euler`.

Acceptance: The full μ_a has mass (a−1)/2 in ℚ_p, so zero unit mass is a meaningful restriction test.

Source: Rodrigues Jacinto–Williams, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.27. Weight-zero consequence of Proposition 4.8, required at the k=1 numerator endpoint.

### Integrality of Euler-smoothed Bernoulli values

`DirichletPadicLFunctions:L1/unit-smoothed-integral` — `DirichletPadic.unitSmoothedBernoulli_mem_padicInt` (theorem).

For every k≥0, (1−p^k)(1−a^(k+1))B_(k+1)/(k+1) in ℚ_p lies in the image of ℤ_p.

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Take the integral witness ρ_a(x^k). Apply unit-smoothed-moment. This does not assert integrality after cancelling either factor.

Prerequisites: `DirichletPadicLFunctions:L1/unit-smoothed-moment`.

Acceptance: At p=2,a=3,k=1 the value 2/3 is integral. No assertion is made that B₂/2 is integral.

Source: Rodrigues Jacinto–Williams, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.27. Integral consequence of the actual measure; a later Kummer theorem still needs its own denominator and congruence hypotheses.

### Arithmetic numerator measure

`DirichletPadicLFunctions:L1/smoothed-numerator` — `DirichletPadic.smoothedNumerator` (construction).

Construct ν_a=smoothedNumerator p a := Jμ_a in D(ℤ_p,ℤ_p), where J is the exact imported inverseWeight. Since J(Eμ)=Jμ, this is x⁻¹ times the unit-restricted smoothing measure.

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Apply the existing inverseWeight to μ_a. Its multiplier is the already existing PadicInt.inv, continuous by the supplier’s proof plan and zero at every nonunit. No new inverse function or generic measure operator is defined.
2. Use inverse-weight-support to identify Jμ_a with Jρ_a. The inverse-weight-evaluation node supplies the evaluation API. Its support and primitive characterization are proved in the promoted nodes below, independently of ψ-invariance.
3. The a=1 API follows from measure-one and linearity of J. Numerical moments are proved through the later moment-shift and Euler-factor nodes, not assumed by the construction.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-measure`, `DirichletPadicLFunctions:L1/unit-smoothed-measure`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-support`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-evaluation`, `DirichletPadicLFunctions:L1/measure-one`.

API:

- `DirichletPadic.smoothedNumerator_eq_inverse_restriction` (compatibility): ν_a=Jρ_a.
- `DirichletPadic.smoothedNumerator_apply` (characterisation): ν_a(f)=μ_a(ιf), with ι the continuous existing unit inverse extended by zero.
- `DirichletPadic.smoothedNumerator_supported` (relation): Eν_a=ν_a; promoted to numerator-support.
- `DirichletPadic.weight_smoothedNumerator` (relation): Wν_a=ρ_a, where W is weighting by x; promoted to numerator-weight.
- `DirichletPadic.smoothedNumerator_unique` (universal-property): A unit-supported ν with Wν=ρ_a equals ν_a; promoted to numerator-unique.
- `DirichletPadic.smoothedNumerator_moment_shift` (data): ν_a(x^(k+1))=ρ_a(x^k) for k≥0; promoted to numerator-moment-shift.
- `DirichletPadic.smoothedNumerator_moment` (data): For k≥1 its embedded moment is (1−p^(k−1))(1−a^k)B_k/k; promoted to numerator-moment.
- `DirichletPadic.amice_smoothedNumerator` (compatibility): Aν_a=inverseMahler(F_a); promoted to numerator-amice.
- `DirichletPadic.smoothedNumerator_one` (simp): ν_1=0.

Unit tests:

- `SuggestedTests.numerator_endpoint` (degenerate): For p=3,a=2, ν_a(x)=0.
- `SuggestedTests.numerator_second_moment` (computation): For p=3,a=2, the image of ν_a(x²) in ℚ₃ is 1/2.
- `SuggestedTests.numerator_dyadic` (computation): For p=2,a=3, the image of ν_a(x²) in ℚ₂ is 2/3.
- `SuggestedTests.numerator_one` (degenerate): For p=3,a=1, ν_a=0.
- `SuggestedTests.numerator_not_unit_measure` (non-example): For p=3,a=2, ν_a≠ρ_a; their first moments are 0 and 1/2.

Uses:

- `RJW equation (4-3)`: Shifts the exponent so the smoothing factor is a^k−1.
- `RJW Definition 4.10 and Proposition 4.11`: Supplies the arithmetic numerator whose regularity and division by θ_a remain separate proof obligations.
- `ColemanPowerSeries:L2 comparison`: Gives an exact arithmetic Amice target; the Coleman owner still proves its normalization and sign comparison.

Acceptance: The definition is meaningful for every prime, including p=2. It constructs the integral numerator only; no completed-group-ring denominator has been inverted.

Source: Rodrigues Jacinto–Williams, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. The arithmetic specialization of equation (4-3), using the owner’s now explicit generic operator.

### Unit support of the arithmetic numerator

`DirichletPadicLFunctions:L1/numerator-support` — `DirichletPadic.smoothedNumerator_supported` (lemma).

Eν_a=ν_a.

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Apply inverse-weight-support to μ_a and unfold smoothed-numerator. The result is independent of the averaging gap.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-numerator`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-support`.

Acceptance: The equivalent criterion is ψν_a=0. This follows because J vanishes on every nonunit, not by treating all nonzero p-adic integers as units.

Source: Rodrigues Jacinto–Williams, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. The source constructs the numerator on units; the shared ambient formulation makes this support explicit.

### Primitive equation for the numerator

`DirichletPadicLFunctions:L1/numerator-weight` — `DirichletPadic.weight_smoothedNumerator` (lemma).

Wν_a=ρ_a, where W is weighting by the identity continuous function x.

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Apply the exact generic weight-inverse-weight identity WJμ=Eμ to μ_a. Unfold the two arithmetic constructions.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-numerator`, `DirichletPadicLFunctions:L1/unit-smoothed-measure`, `PadicMeasuresIwasawaAlgebras:L2/weight-inverse-weight`.

Acceptance: The identity is on every continuous test function, including weight zero; it does not invert x at a nonunit.

Source: Rodrigues Jacinto–Williams, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. Defining cancellation of multiplication by x and by x⁻¹ on the unit-supported component.

### Unique unit-supported arithmetic primitive

`DirichletPadicLFunctions:L1/numerator-unique` — `DirichletPadic.smoothedNumerator_unique` (theorem).

For ν∈D, if Eν=ν and Wν=ρ_a, then ν=ν_a.

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Apply J to Wν=ρ_a. The generic inverse-weight-weight identity gives JWν=Eν=ν.
2. On the right, inverse-weight-support gives Jρ_a=Jμ_a=ν_a. Thus equality follows. Support is essential, since W kills the mass at zero.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-numerator`, `DirichletPadicLFunctions:L1/unit-smoothed-measure`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-weight`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-support`.

Acceptance: Without unit support, ν_a+cδ₀ has the same W-image for any c. The uniqueness statement therefore tests both required properties.

Source: Rodrigues Jacinto–Williams, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. Uniqueness API derived from the source’s inverse weighting, without claiming pseudomeasure independence.

### Moment shift under inverse weighting

`DirichletPadicLFunctions:L1/numerator-moment-shift` — `DirichletPadic.smoothedNumerator_moment_shift` (lemma).

For k≥0, ν_a(x^(k+1))=ρ_a(x^k) in ℤ_p.

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Evaluate numerator-weight on x^k. The exact weight-evaluation theorem gives (Wν_a)(x^k)=ν_a(x·x^k). Rewrite pointwise x·x^k=x^(k+1).

Prerequisites: `DirichletPadicLFunctions:L1/numerator-weight`, `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`.

Acceptance: At k=0 it says ν_a(x)=ρ_a(1); it supplies no formula for the total mass ν_a(1).

Source: Rodrigues Jacinto–Williams, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. The exponent shift immediately after equation (4-3).

### Bernoulli moments of the arithmetic numerator

`DirichletPadicLFunctions:L1/numerator-moment` — `DirichletPadic.smoothedNumerator_moment` (theorem).

For every integer k≥1, the image of ν_a(x^k) in ℚ_p equals (1−p^(k−1))(1−a^k)B_k/k.

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Write k=(k−1)+1 using k≥1. Apply numerator-moment-shift and unit-smoothed-moment at degree k−1.
2. Normalize natural exponents and the rational denominator. At k=1 the factor 1−p^0 is zero. Do not cancel it or invoke the false assertion ζ(0)=0; E4 already records the source’s endpoint error.

Prerequisites: `DirichletPadicLFunctions:L1/numerator-moment-shift`, `DirichletPadicLFunctions:L1/unit-smoothed-moment`.

Acceptance: At k=1 the moment is zero for every p,a. At p=3,a=2,k=2 it is 1/2; at p=2,a=3,k=2 it is 2/3. The theorem makes no claim at k=0.

Source: Rodrigues Jacinto–Williams, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. Rational Bernoulli form of the source’s numerator interpolation identity; it is not yet a theorem about the pseudomeasure ζ_p.

### Integrality of numerator Bernoulli moments

`DirichletPadicLFunctions:L1/numerator-integral` — `DirichletPadic.smoothedNumeratorBernoulli_mem_padicInt` (theorem).

For k≥1, the rational value (1−p^(k−1))(1−a^k)B_k/k has integral image in ℚ_p.

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Take z=ν_a(x^k) in ℤ_p and use numerator-moment. No division by the smoothing factor or Euler factor is licensed.

Prerequisites: `DirichletPadicLFunctions:L1/numerator-moment`.

Acceptance: The k=1 witness is zero. Dyadic p=2,a=3,k=2 gives 2/3, and is integral without an odd-prime hypothesis.

Source: Rodrigues Jacinto–Williams, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. Integrality from the concrete arithmetic numerator; later congruences and pseudomeasure division remain separate.

### Amice transform of the arithmetic numerator

`DirichletPadicLFunctions:L1/numerator-amice` — `DirichletPadic.amice_smoothedNumerator` (comparison).

Aν_a=inverseMahler(F_a) in ℤ_p[[T]], using the exact integral inverseMahler supplied by L2.

Hypotheses and conventions: p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps. All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof/construction:

1. Apply inverse-mahler-intertwining to μ_a: A(Jμ_a)=inverseMahler(Aμ_a). Substitute measure-amice and unfold smoothed-numerator.
2. This comparison is independent of the missing root-average bridge. It connects the arithmetic numerator to the existing generic primitive operator, rather than rebuilding that operator in Dirichlet or Coleman.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-numerator`, `DirichletPadicLFunctions:L1/measure-amice`, `PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-intertwining`.

Acceptance: At a=1 both sides vanish. The comparison uses integral series and the existing inverseMahler, not a field-valued Amice inverse.

Source: Rodrigues Jacinto–Williams, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. Amice expression of the source’s inverse-weighted numerator, with generic construction imported.

### Exact requests at the supplier boundary

1. Supplier `PadicMeasuresIwasawaAlgebras:L2`: Generic finite-root partial-fraction identity: for a characteristic-zero field K, p prime, ζ∈K primitive of order p and y∈K with y^p≠1, prove every ζ^i y−1 (0≤i<p) is nonzero and Σ_{i<p} 1/(ζ^i y−1)=p/(y^p−1). Supply this generic algebraic ingredient once alongside the L2 root-of-unity averaging comparison, reusing existing root/polynomial APIs; the consumer only forms its arithmetic smoothing combination. Needed by `DirichletPadicLFunctions:L1/smoothing-root-average`.

2. Supplier `PadicMeasuresIwasawaAlgebras:L2`: Rational-series comparison for the actual integral ψ_B: put Z=ℤ_p, B=Z[[T]], b=(1+T)^p−1 and φ(F)=F(b). Supply a cyclotomic coefficient field extension K of ℚ_p with primitive p-th root ζ, its canonical injective coefficient/series map j:B→Frac(K[[T]]), and Y=1+T in that fraction field. For arbitrary P,Q∈Z[T] with Q(0) a unit, and F∈B satisfying Q·F=P (polynomials coerced to series), prove each Q(ζ^iY−1) is nonzero and p·j(φ(ψ_B F))=Σ_{i<p} P(ζ^iY−1)/Q(ζ^iY−1). Polynomial coefficients are embedded canonically in K. The comparison must refer to the bounded Amice-transported psiSeries already defined in L2, not define a second operator or assume this comparison. Prove the root translation/convergence or denominator-cleared trace comparison and coefficient descent; do not substitute ζ−1 into arbitrary formal series. The identity alone suffices for this consumer, with no action of ψ_B on 1/T. Needed by `DirichletPadicLFunctions:L1/series-phi-psi-fixed`.

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

**DirichletPadicLFunctions/E6** (gap; affects the proof), Proof of Lemma4.7, printed p.137 / PDF38; arXiv:2309.15692v2 p.27. The source uses ψ(1/T)=1/T. Justify an extension of ψ and its comparison to the bounded operator before acting on 1/T, or clear the poles and apply the generic rational-series root-average comparison only to the integral smoothed F_a. The latter route is specified by the two L2 requests in this packet. The bounded integral operator acts on ℤ_p[[T]], while 1/T is outside that carrier. Linearity and commutation with dilation cannot be applied to the two pole terms inside the existing domain, even though their smoothed difference is integral. The finite partial-fraction identity is algebraically correct; the missing step is its operator-domain comparison, not a counterexample to Lemma4.7.

This is the same gap previously recorded in ColemanPowerSeries/E8, not a new discovery. Both source versions were freshly collated; a bounded correction search on 27 September 2026 found no published repair. The journal browser route failed and supplies no evidence of absence. “New” in the schema records no identified published correction, without a novelty claim. The five earlier source-issue objects are preserved exactly.

## Remaining source decomposition and ownership

### DirichletPadicLFunctions:L0 — partial

- Source-decompose the actual Mellin continuation and differentiation/decay argument, then compare algebraic Bernoulli values through explicit complex and p-adic embeddings. The negative-zeta formula, including ζ(0)=−1/2, already exists; E2 and E5 record source normalization errors.
- Import generalized Bernoulli/finite Fourier data from the existing ModularForms Layer 0; compare Dedekind zeta with the meromorphic germ and residue supplied through AutomorphicLFunctionsAndLocalFactors:AL.1 and Mathlib’s real class-number limit; instantiate GlobalNumberFields Layers 9–10 idele/infinity-type conventions.

### DirichletPadicLFunctions:L1 — partial

- Fill the two precise L2 requests for the generic finite-root partial fractions and its comparison with the actual bounded integral psiSeries. These are the remaining proof inputs for series-phi-psi-fixed; their gap propagates through psi-invariance to the unit and numerator Bernoulli moment theorems. Do not apply psiSeries to 1/T.
- The actual integral arithmetic numerator, its unit support, unique primitive equation and inverseMahler comparison now have exact planned supplier nodes. Prove arithmetic smoothing compatibility and regularity of the chosen θ_a=[a]−[1] in the actual completed unit-group algebra, and instantiate L3 pseudomeasures with exact carrier/denominator comparisons.
- Prove independence of the smoothing parameter, full pseudomeasure interpolation for every k≥1 (including the zero Euler factor at k=1), odd-prime parity/descent and denominator-qualified Kummer congruences. The present integral measure/numerator statements cover p=2, but do not construct a dyadic pseudomeasure splitting or choose a nonexistent single topological generator of ℤ₂×.
- Complete the source’s analytic Mellin/decay/differentiation route under L0. Complete measure coefficient-extension/descent maps through the shared measure API; an integral coefficient identity alone is not a scalar-extension theorem for measures.

### DirichletPadicLFunctions:L2 — not_read

- Read and decompose the actual p-power twists, roots-of-unity/Gauss computation, integral primitive tame-character measure, and all scalar/conductor comparisons. Reuse the generic L2 operators and the primitive conductor when evaluating characters at p; treat the trivial branch separately.

### DirichletPadicLFunctions:L3 — not_read

- Read and decompose branch interpolation, the complex and p-adic cyclotomic logarithm formulas, the pure p-power conductor case, pole numerator/convergence/simple-zero division and residue coordinate change. Import ColemanIntegration:L0 logarithms and LocallyAnalyticDistributions:L3 coordinates; retain the integral ±1×(1+4ℤ₂) branch.

### DirichletPadicLFunctions:L4 — not_read

- Read and decompose actual p-stabilized Eisenstein modular forms, their coefficient measures and pseudomeasure constant term, tame-character families and integral coefficient congruences. Import the existing ModularForms classical carriers; geometric affinoid realization and Hida–Coleman control belong to PadicFamilies.

The generic moment request is filled by `PadicMeasuresIwasawaAlgebras:L2/ordinary-moment-exp`:
for every integral μ and k≥0 it identifies the embedded moment with k! times the coefficient after
formal exp−1 substitution. No generic theorem is duplicated and no placeholder carrier is supplied.
The 18 original nodes and four formal-series nodes have baseline/local inputs, and the complex
comparison uses the baseline negative-zeta theorem. The ordinary-moment and integrality nodes now
have the exact external supplier for their proof plans. No whole stage is claimed closed. The present unit restriction and numerator use precise supplier nodes. Their new averaging comparisons are exact open requests; generalized coefficient measures and pseudomeasures must likewise use their owners’ precise interfaces. In particular the published L3 pseudomeasure
evaluation checkpoint supplies generic conditional algebra; it does not prove the arithmetic smoothing
regularity, the completed-group-ring comparison, or the odd-prime/dyadic augmentation arguments.

The retained RS-14 scopes are recorded verbatim in the five gaps. The general character/continuation
interfaces formerly assigned to the retired AnalyticNumberTheory:AN.1 use the reviewed Mathlib upstream
owners instead. The order ColemanIntegration:L0 → DirichletPadicLFunctions:L3 → ColemanIntegration:L3
is preserved. Generalized Bernoulli and classical character Eisenstein carriers remain in ModularForms
Layer 0. Hida–Coleman geometric family realization remains in PadicFamilies. No existing roadmap is
re-planned.

The proposed L1 planets are Smoothed power series, Integral cancellation formula, Smoothed measure,
Smoothed Bernoulli series and Smoothed moment formula. The auxiliary denominator and its API remain
ordinary declaration nodes. A planet is a proposed landmark, not evidence that its dependency is closed.

## Sources and evidence

- Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Essential Number Theory 4 (2025), no. 1, 101–216; DOI 10.2140/ent.2025.4.101. PDF 37–40, printed 136–139: all of §4, including Lemmas 4.2–4.3, Proposition 4.4, Definition 4.5, Proposition 4.6, Lemma 4.7, Proposition 4.8, Definitions 4.9–4.10 and Proposition 4.11 with their proofs; beginning of §5.1 on PDF 40. PDF 66, printed 165: §10.2, Lemma 10.3 and Propositions 10.4 / Lemma 10.5 with their proofs, to verify the Coleman-series consumer and sign. PDF 12–13, printed 111–112: the end of Theorem 2.4 and its proof, Bernoulli convention in Remark 2.5, Lemma 2.6 and its proof, Lemma 2.7 and Corollary 2.8. This is a partial reading, not a source-complete extraction of §§2–8. SHA-256 `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`; accessed 2026-09-26.
- Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), arXiv:2309.15692v2, 19 December 2024. PDF 26–28, full pages, collated with published §4; PDF 9, Lemma 2.7 and Corollary 2.8 and surrounding text, collated with published PDF 13. SHA-256 `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4`; accessed 2026-09-26.

The packet lists every cited pinned declaration, its exact file and the statement ranges read. Existing power-series inversion, Amice inversion and negative-zeta values are baseline citations, not new nodes.

Second-checkpoint reading adds the published §3.4 final paragraphs and §3.5.1 (printed pp. 125–126 /
PDF 26–27), including the proof of Lemma 3.29 and Corollary 3.30, and rechecks §4.1 through Proposition
4.6. The first checkpoint's source findings and bounded erratum searches are retained. The arXiv record
was refreshed and still lists v2, 19 December 2024, as the latest version. The new formal comparison
uses the pinned Bernoulli, exponential and substitution statements listed in the packet; all 8,482
Mathlib source dependencies of the suggested imports were byte-checked against the pinned sources.

The current checkpoint imports the real repository file
`research.blueprint.suggested.PadicMeasuresIwasawaAlgebras` in its suggested Lean file, in addition
to individual pinned Mathlib imports. This types the exact proposed supplier interfaces, including
inverseWeight and inverseMahler. That imported file contains unchecked prototype statements;
compilation is a signature check and does not turn either roadmap into a formalized library.
It is compiled from the captured source before the consumer. No surrogate axioms or copied foreign
definitions were introduced to imitate the missing averaging comparison. The missing comparison
itself remains prose in requests because it has no supplier declaration yet.

The current reading freshly covered published §4, PDF37–40 / printed136–139, and v2 PDF26–28.
Their SHA-256 digests remain those above. All five audit rows, the accepted RS-14 ownership/link
decisions, the touching link records and the current 69-node measure supplier were checked. The
new baseline citation IsPrimitiveRoot.pow_of_coprime was read at the pin. The generic partial
fractions and bounded rational-average comparison were not found in pinned Mathlib/TauCeti or
other current packets. Later layers retain their existing reading status; this is not a full-paper
extraction or closure claim.

L1 now has six planets, its permitted maximum: the five predecessor planets plus Unit Euler-factor
formula. The 45 nodes comprise 1 definition, 4 constructions, 26 lemmas, 12 theorems and 2 comparisons.
All remain unchecked. The direct arithmetic numerator is a measure, not the already-defined ζ_p.
