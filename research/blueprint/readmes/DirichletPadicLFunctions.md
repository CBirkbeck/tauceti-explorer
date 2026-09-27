**Positive-series checkpoint, 27 September2026.** The packet has 80 unchecked nodes,
79 API entries, 61 definition/construction tests plus one other test, 65 typed
examples, 12 planets and 107 baseline references. Five gaps and one supplier
request remain; no stage is closed. All 72 predecessor node objects and nine
source findings are preserved. Earlier checkpoint totals below are historical.

**Previous finite-coordinate checkpoint, 27 September2026.** The packet now has 72 unchecked nodes, 71 API entries, 53 definition/construction tests plus one other test, 57 typed examples, 12 planets and 98 baseline references. Five gaps and one explicit supplier request remain; no stage is closed. Earlier checkpoint totals below are historical.

# Dirichlet p-adic L-functions, special values, and Eisenstein measures

This roadmap retains the explicit rational arithmetic construction under accepted RS-14. The existing
ModularForms and GlobalNumberFields roadmaps own the classical carriers and character conventions;
PadicMeasuresIwasawaAlgebras owns general measure/Amice and pseudomeasure interfaces;
LocallyAnalyticDistributions owns the analytic character-coordinate operations. The new work here is the
specific arithmetic construction, its values and its normalization comparisons. None of those shared
carriers is redefined.

**Classical Eisenstein comparison checkpoint, 27 September 2026.** All five layers L0–L4 remain in scope. The 58 predecessor mathematical statements and hypotheses are preserved. One proof-status sentence now points to the new modular comparison. Eight new L4 declarations normalize the existing classical form, construct its actual p-stabilization at Γ₀(p), prove the full q-expansion and compare positive coefficients with integral measure moments through a common integer. The packet has 66 unchecked nodes, 62 API entries, 46 definition/construction tests plus one other test, 50 typed examples, 12 planets and 86 baseline references. Five gaps and no requests remain; no stage is closed.

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

## Exact supplier handoff

The two generic root-averaging requests are resolved to the current
PadicMeasuresIwasawaAlgebras:L2 nodes root-partial-fractions, root-denominator-nonzero,
rational-root-average-descent and translated-polynomial-descent-nonzero.
The second comparison uses the original bounded psiSeries, integral coefficients, polynomial
numerator and denominator, and the actual cyclotomic subfield of ℂ_p. Its topological evaluation
is justified in the supplier; no arbitrary formal substitution at ζ−1 or action on 1/T is inferred.
The source-domain finding E6 remains a finding about the paper. The blueprint proof plan now
has the exact repair. None of these admitted signatures is an implementation or a review verdict.

The positive coefficient constructor lies in D(ℤ_p×,ℤ_p). Earlier smoothing and numerator
constructions lie in D(ℤ_p,ℤ_p). Their separate intrinsic-support and completed-algebra comparisons
remain explicit gaps. Integral coefficient extension on the ambient ℤ_p carrier now has supplier
nodes, but its arithmetic instantiation is still part of L1's remaining comparisons.

## L4: positive Eisenstein coefficient measures

Let p be any prime, including 2, and let U=ℤ_p× with its usual unit-group topology. For a
positive integer n, take the finite sum of native integral Dirac measures

    A_n = Σ_{d∣n, p∤d} δ_d ∈ D(U,ℤ_p).

Here D is Mathlib’s existing continuous linear functional on continuous functions, and d means
the unit whose underlying p-adic integer is the natural cast of d. Primality turns p∤d into
coprimality; the pinned norm criterion then makes that cast a unit. The existing unit constructor
supplies the point of U. The finite sum is integral at p=2 as well as at odd primes.
There is no denominator in this construction. Its index is positive: it does not assign a measure
to n=0 or replace the source’s separate constant pseudomeasure by a zero coefficient.

Evaluation is the finite sum of evaluations. In particular, for every natural exponent e,

    A_n(x^e) = Σ_{d∣n, p∤d} d^e.

The ordinary exponent for a modular form of weight k is e=k−1. At n=1 the measure is δ_1.
More generally A_{p^r}=δ_1 for every r≥0, and A_{pn}=A_n. Stabilization removes the contribution
of p-divisible divisors; it does not erase the Fourier coefficient indexed by p. For example,
at p=2 the measure A_6 is δ_1+δ_3, its mass is 2, and its weight-four moment is 28.

Split all divisors of n into those divisible by p and those prime to p. When p∣n, multiplication
by p identifies the first set with the divisors of n/p. Taking e-th powers therefore gives

    A_n(x^e) = σ_e(n) − p^e σ_e(n/p)  if p∣n,
    A_n(x^e) = σ_e(n)                  if p∤n.

The proof first establishes this identity in ℤ, with casts before subtraction, and then maps it
to ℤ_p. It includes e=0. Thus at p=3,n=6,e=3 the value is 252−27·9=9. These calculations
are the positive coefficient calculation in Definition 8.1 and Theorem 8.2 of the source.

The congruence is equally concrete. For r≥1 and e≡e′ modulo p^(r−1)(p−1), every divisor
occurring in A_n is a unit modulo p^r. The pinned Fermat–Euler remainder theorem identifies
its two powers modulo p^r. Sum the integer divisibility witnesses and cast to ℤ_p to obtain

    p^r ∣ A_n(x^e′) − A_n(x^e).

This gives positive coefficient congruences at even weights k,k′≥4 by using their exponents
k−1,k′−1. It states a sufficient modulus, including 2^(r−1) at p=2. It assumes no single
topological generator of ℤ₂×. At odd p, belonging to the same tame component modulo p−1
alone does not give arbitrary precision: for p=5,n=2 the exponents 3 and 7 give 9 and 129;
the difference 120 is divisible by 5 but not 25. The modulus required at precision 25 is 20.

These are arithmetic measure statements in the native carrier. The new classical comparison
below constructs the rescaled and stabilized bundled form from the pinned ModularForm.E
and levelRaise. Its positive coefficients and the measure moments share a common integer.
The completed-algebra image of A_n and constant pseudomeasure A₀=xζ_p/2 remain required
comparisons. Integrality of positive coefficients at p=2 says nothing about dividing the
constant pseudomeasure by2.
The full tame-character family and constant-term congruences still need their own decomposition.
Geometric realization and Hida–Coleman control retain the PadicFamilies owner fixed by RS-14.

The [published §8](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), printed pp.158–161,
was read fully and collated with [arXiv v2](https://arxiv.org/pdf/2309.15692v2), pp.43–45.
The weight congruence and p-index invariance are derived finite-coefficient consequences;
they are not presented as separately numbered source results. The six L4 planets are
Eisenstein coefficient measures, Eisenstein coefficient interpolation, Eisenstein weight congruences,
p-stabilized Eisenstein series, Eisenstein divisor-sum coefficients and Eisenstein moment specialization.

## Declaration plan

### Binomial smoothing denominator

`DirichletPadicLFunctions:L1/smoothing-denominator` — definition.

Define q_a in R[[T]] by coefficient_n(q_a)=choose(a,n+1). It is the integral quotient of (1+T)^a−1 by T. The definition is coefficient-wise and does not invert T.

Hypotheses:

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.

Proof plan:

- Apply the existing PowerSeries.mk to the indicated natural binomial coefficients.
- The coefficient API follows from coeff_mk; n=0 gives the constant coefficient a.
- The polynomial binomial formula gives Tq_a=(1+T)^a−1; coefficient maps preserve the natural coefficients.

Acceptance:

- The coefficient definition gives a polynomial of degree at most a−1 for a>0; it gives zero when a=0. The tests distinguish the quotient by T from the unshifted binomial polynomial.

Prerequisites: `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`, `mathlib:Polynomial.coeff_one_add_X_pow`.

Uses:

- RJW Proposition 4.4 and Definition 4.5: Construct the integral power series before applying the existing Amice inverse; coefficient tests detect a sign error in the printed expansion.
- RJW Proposition 4.6 and DirichletPadicLFunctions:L1: The specific measure and its exact normalization are the input to polynomial moments, restriction to units and the zeta pseudomeasure.
- ColemanPowerSeries:L2; RJW Proposition 10.4: The Coleman logarithmic derivative compares with this same arithmetic smoothing series, so the sign and coefficient-map laws must be fixed before that comparison.
- RJW Lemmas 4.2–4.3 and Proposition 4.6; this checkpoint's formal Bernoulli and moment comparisons: Evaluate the same arithmetic object against ordinary polynomial functions; retain the rational scalar and factorial/sign normalization before using complex or p-adic embeddings.

API:

- `DirichletPadic.coeff_smoothingDenominator` (data): The nth coefficient is choose(a,n+1); promoted.
- `DirichletPadic.constantCoeff_smoothingDenominator` (simp): The constant coefficient is a; promoted.
- `DirichletPadic.X_mul_smoothingDenominator` (relation): Tq_a=(1+T)^a−1; promoted.
- `DirichletPadic.smoothingDenominator_isUnit` (structure): If a is a unit, q_a is a unit; promoted.
- `DirichletPadic.smoothingDenominator_map` (functoriality): Every coefficient ring homomorphism sends q_a to q_a over its target; promoted.
- `DirichletPadic.exp_sub_one_mul_smoothingDenominator_subst` (compatibility): Over a commutative ℚ-algebra, (E−1)q_a(E−1)=E^a−1; promoted.
- `DirichletPadic.bernoulli_mul_smoothingDenominator_subst` (compatibility): B_a q_a(E−1)=C(a)B over a commutative ℚ-algebra; promoted.

Tests:

- `SuggestedTests.denominator_zero` (degenerate): q₀=0 over ℤ.
- `SuggestedTests.denominator_one` (computation): q₁=1 over ℤ.
- `SuggestedTests.denominator_two` (computation): q₂=2+T over ℤ.

Source: RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Denominator coefficients

`DirichletPadicLFunctions:L1/denominator-coefficients` — lemma.

For every n≥0, coefficient_n(q_a)=choose(a,n+1).

Hypotheses:

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.

Proof plan:

- Unfold smoothing-denominator and apply PowerSeries.coeff_mk.

Acceptance:

- Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

Prerequisites: `DirichletPadicLFunctions:L1/smoothing-denominator`, `mathlib:PowerSeries.coeff_mk`.

Source: RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Denominator constant coefficient

`DirichletPadicLFunctions:L1/denominator-constant` — lemma.

The constant coefficient of q_a is a.

Hypotheses:

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.

Proof plan:

- Use denominator-coefficients at n=0 and the natural identity choose(a,1)=a.

Acceptance:

- Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

Prerequisites: `DirichletPadicLFunctions:L1/denominator-coefficients`, `mathlib:PowerSeries.coeff_zero_eq_constantCoeff_apply`.

Source: RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Binomial denominator factorization

`DirichletPadicLFunctions:L1/denominator-factorization` — lemma.

Tq_a=(1+T)^a−1 in R[[T]], including a=0.

Hypotheses:

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.

Proof plan:

- Compare the constant coefficients: both sides are zero.
- For degree n+1, coeff_succ_X_mul and denominator-coefficients give choose(a,n+1).
- Transfer Polynomial.coeff_one_add_X_pow through the polynomial-to-series ring homomorphism, using coeff_coe, coe_X and coe_pow. These are the coefficients on the right; extensionality finishes.

Acceptance:

- Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

Prerequisites: `DirichletPadicLFunctions:L1/denominator-coefficients`, `mathlib:PowerSeries.coeff_succ_X_mul`, `mathlib:Polynomial.coeff_one_add_X_pow`, `mathlib:Polynomial.coeff_coe`, `mathlib:Polynomial.coeToPowerSeries.ringHom`, `mathlib:Polynomial.coe_X`, `mathlib:Polynomial.coe_pow`.

Source: RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Unit smoothing denominator

`DirichletPadicLFunctions:L1/denominator-unit` — lemma.

If a is a unit in R, then q_a is a unit in R[[T]].

Hypotheses:

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

Proof plan:

- Use denominator-constant and the existing PowerSeries.isUnit_iff_constantCoeff.

Acceptance:

- Over ℤ₂ the parameter a=3 gives a unit q₃, but a=2 does not. No division by 2 is introduced.

Prerequisites: `DirichletPadicLFunctions:L1/denominator-constant`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`.

Source: RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Denominator under coefficient change

`DirichletPadicLFunctions:L1/denominator-coefficient-map` — lemma.

For f:R→S a homomorphism of commutative rings, coefficient-wise f sends q_a over R to q_a over S.

Hypotheses:

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- S is a commutative ring and f:R→S is a ring homomorphism.

Proof plan:

- Use PowerSeries.coeff_map and denominator-coefficients.
- The ring map preserves natural casts. Coefficient extensionality gives the equality.

Acceptance:

- The map ℤ→ℤ₂ sends 2+T to 2+T; identity and composite maps give the same q_a without choosing coordinates.

Prerequisites: `DirichletPadicLFunctions:L1/denominator-coefficients`, `mathlib:PowerSeries.map`, `mathlib:PowerSeries.coeff_map`.

Source: RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Integral smoothed power series

`DirichletPadicLFunctions:L1/smoothed-series` — construction.

For a with unit image u in R, define F_a=b_a·q_a⁻¹ in R[[T]], using the existing inverse-of-a-series construction with constant unit u. Here b_a has coefficient choose(a,n+2). This constructs the pole cancellation integrally before any rational comparison.

Hypotheses:

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

Proof plan:

- Use denominator-constant to identify the constant coefficient of q_a with the unit supplied by a.
- Apply PowerSeries.invOfUnit to q_a and that unit. Multiply by the series b_a constructed with PowerSeries.mk.
- The equality q_a F_a=b_a follows from mul_invOfUnit. No inverse of T appears. Proof irrelevance or the uniqueness theorem removes dependence on the unit certificate.

Acceptance:

- Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

Prerequisites: `DirichletPadicLFunctions:L1/smoothing-denominator`, `DirichletPadicLFunctions:L1/denominator-constant`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.invOfUnit`, `mathlib:PowerSeries.mul_invOfUnit`.

Uses:

- RJW Proposition 4.4 and Definition 4.5: Construct the integral power series before applying the existing Amice inverse; coefficient tests detect a sign error in the printed expansion.
- RJW Proposition 4.6 and DirichletPadicLFunctions:L1: The specific measure and its exact normalization are the input to polynomial moments, restriction to units and the zeta pseudomeasure.
- ColemanPowerSeries:L2; RJW Proposition 10.4: The Coleman logarithmic derivative compares with this same arithmetic smoothing series, so the sign and coefficient-map laws must be fixed before that comparison.
- RJW Lemmas 4.2–4.3 and Proposition 4.6; this checkpoint's formal Bernoulli and moment comparisons: Evaluate the same arithmetic object against ordinary polynomial functions; retain the rational scalar and factorial/sign normalization before using complex or p-adic embeddings.

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

Tests:

- `SuggestedTests.series_one` (degenerate): F₁=0 over ℚ.
- `SuggestedTests.series_two_sign` (computation): Over ℚ, F₂ has constant coefficient 1/2 and linear coefficient −1/4.
- `SuggestedTests.series_three_dyadic` (computation): Over ℤ₂, the unit parameter 3 gives constant coefficient 1. This needs no inverse of 2.
- `SuggestedTests.series_exp_one` (degenerate): Over ℚ, F₁(exp−1)=0.
- `SuggestedTests.series_exp_two` (computation): Over ℚ, F₂(exp−1) has coefficients 1/2,−1/4,0 in degrees 0–2.
- `SuggestedTests.series_exp_factorial` (computation): Over ℚ, coefficient₃(F₂(exp−1))=1/48; its factorial-normalized value is 1/8.

Source: RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Integral cancellation equation

`DirichletPadicLFunctions:L1/series-cancellation` — lemma.

q_a F_a=b_a in R[[T]].

Hypotheses:

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

Proof plan:

- Unfold smoothed-series. Commute factors and apply PowerSeries.mul_invOfUnit with denominator-constant.

Acceptance:

- Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-series`, `DirichletPadicLFunctions:L1/denominator-constant`, `mathlib:PowerSeries.mul_invOfUnit`.

Source: RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Cancellation after multiplication by T

`DirichletPadicLFunctions:L1/series-cleared-equation` — lemma.

Tq_a F_a=q_a−a in R[[T]].

Hypotheses:

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

Proof plan:

- Multiply series-cancellation by T.
- PowerSeries.sub_const_eq_X_mul_shift identifies q_a−a with T times the shifted q_a. Denominator-coefficients and denominator-constant identify that shifted series with b_a.

Acceptance:

- Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

Prerequisites: `DirichletPadicLFunctions:L1/series-cancellation`, `DirichletPadicLFunctions:L1/denominator-coefficients`, `DirichletPadicLFunctions:L1/denominator-constant`, `mathlib:PowerSeries.sub_const_eq_X_mul_shift`.

Source: RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Uniqueness of the smoothed series

`DirichletPadicLFunctions:L1/series-uniqueness` — theorem.

For F∈R[[T]], if Tq_a F=q_a−a then F=F_a.

Hypotheses:

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

Proof plan:

- Compare the assumed equation with series-cleared-equation.
- Cancel T using PowerSeries.X_mul_cancel, which does not assume a domain.
- Cancel the unit q_a using denominator-unit and IsUnit.mul_left_cancel.

Acceptance:

- At a=2 over ℚ, the equation forces the constant coefficient 1/2; the sign-reversed geometric series cannot satisfy it. The proof remains valid over rings with zero divisors.

Prerequisites: `DirichletPadicLFunctions:L1/series-cleared-equation`, `DirichletPadicLFunctions:L1/denominator-unit`, `mathlib:PowerSeries.X_mul_cancel`, `mathlib:IsUnit.mul_left_cancel`.

Source: RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Smoothed constant coefficient

`DirichletPadicLFunctions:L1/series-constant` — lemma.

The constant coefficient of F_a is choose(a,2)u⁻¹, where u is the unit equal to a.

Hypotheses:

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

Proof plan:

- Use the definition of smoothed-series, multiplicativity of the constant-coefficient ring map, and coeff_mk for b_a.
- PowerSeries.constantCoeff_invOfUnit supplies u⁻¹.

Acceptance:

- Specialize to a=2 over ℚ: q₂=2+T and F₂=1/(2+T), with constant coefficient +1/2. The degenerate a=1 series is zero.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-series`, `mathlib:PowerSeries.coeff_mk`, `mathlib:PowerSeries.coeff_zero_eq_constantCoeff_apply`, `mathlib:PowerSeries.constantCoeff_invOfUnit`.

Source: RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Smoothed coefficient recurrence

`DirichletPadicLFunctions:L1/series-coefficient-recurrence` — lemma.

For n≥0, a F_{a,n}=choose(a,n+2)−∑_{i=0}^{n−1} choose(a,n−i+1) F_{a,i}.

Hypotheses:

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.

Proof plan:

- Apply coefficient_n to series-cancellation and use PowerSeries.coeff_mul.
- Use denominator-coefficients for q_a, then separate the convolution summand containing F_{a,n}; its other factor is q_{a,0}=a.
- Move the remaining finite sum to the other side. The case n=0 has an empty sum.

Acceptance:

- For a=2 over ℚ the recurrence gives F_{2,n}=(-1)^n/2^(n+1). At n=0 it gives a F_{a,0}=choose(a,2), with no missing endpoint term.

Prerequisites: `DirichletPadicLFunctions:L1/series-cancellation`, `DirichletPadicLFunctions:L1/denominator-coefficients`, `DirichletPadicLFunctions:L1/denominator-constant`, `mathlib:PowerSeries.coeff_mul`, `mathlib:PowerSeries.coeff_mk`.

Source: RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Smoothed series under coefficient change

`DirichletPadicLFunctions:L1/series-coefficient-map` — lemma.

For a ring map f:R→S, the coefficient-wise image of F_a over R equals F_a over S. A unit a maps to a unit, and any certificate of that fact gives the same series.

Hypotheses:

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.
- S is a commutative ring and f:R→S is a ring homomorphism.

Proof plan:

- Map series-cleared-equation coefficient-wise through f.
- Use denominator-coefficient-map, PowerSeries.map_C and map_X to identify the target equation.
- Apply series-uniqueness over S. IsUnit.map supplies admissibility, and the ring-homomorphism laws imply identity and composition compatibility.

Acceptance:

- The integral series over ℤ_p maps to the same rational expression over ℚ_p after coefficient extension. Iterated coefficient maps and their composite give identical series.

Prerequisites: `DirichletPadicLFunctions:L1/series-cleared-equation`, `DirichletPadicLFunctions:L1/denominator-coefficient-map`, `DirichletPadicLFunctions:L1/series-uniqueness`, `mathlib:PowerSeries.map`, `mathlib:PowerSeries.map_C`, `mathlib:PowerSeries.map_X`, `mathlib:IsUnit.map`.

Source: RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Rational formula for the smoothed series

`DirichletPadicLFunctions:L1/series-fraction-comparison` — theorem.

Let f:R[[T]]→K be a ring homomorphism to a field, with f(T)≠0. Then f(F_a)=1/f(T)−a/((1+f(T))^a−1). In particular this is a comparison after cancellation, not a definition in R[[T]].

Hypotheses:

- R is a commutative ring; a is a natural number. Write q_a(T)=∑ choose(a,n+1)Tⁿ and b_a(T)=∑ choose(a,n+2)Tⁿ. All binomial coefficients are cast from ℕ to R.
- The image of a in R is a unit. The arithmetic application takes a>1 and p not dividing a; a=1 is included here only as a degenerate zero test.
- K is a field, f:R[[T]]→K is a ring homomorphism, and f(T)≠0.

Proof plan:

- Denominator-unit and IsUnit.map show that f(q_a) is a unit, hence nonzero in K.
- Map denominator-factorization to get (1+f(T))^a−1=f(T)f(q_a), which is nonzero.
- Map series-cleared-equation and divide by that nonzero product. Field algebra gives the stated difference.

Acceptance:

- At a=2 the rational expression simplifies to 1/(2+f(T)). The hypothesis f(T)≠0 excludes using totalized division at the origin to compute the constant coefficient.

Prerequisites: `DirichletPadicLFunctions:L1/denominator-factorization`, `DirichletPadicLFunctions:L1/denominator-unit`, `DirichletPadicLFunctions:L1/series-cleared-equation`, `mathlib:IsUnit.map`.

Source: RJW-published, Proposition 4.4 and its proof, printed p. 137 / PDF 38; Definition 4.5 immediately following. Decomposes the source binomial cancellation into a reusable integral declaration. The source works over ℤ_p; the formulation over any commutative ring with unit a is an explicit algebraic generalization. The printed geometric-series sign is corrected as recorded in E1.

### Arithmetic smoothing measure

`DirichletPadicLFunctions:L1/smoothed-measure` — construction.

For p prime and p∤a, define μ_a in the existing measure carrier D(ℤ_p,ℤ_p) as the inverse Amice transform of F_a over ℤ_p. This is the particular arithmetic measure, not a second definition of the Amice transform.

Hypotheses:

- p is a prime natural number, a is a natural number, and p does not divide a.
- Use the existing carrier D(ℤ_p,ℤ_p) of abstract ℤ_p-valued measures and its existing Amice equivalence.

Proof plan:

- Use Nat.Prime.coprime_iff_not_dvd, PadicInt.norm_natCast_eq_one_iff and PadicInt.isUnit_iff to turn p∤a into the unit hypothesis for smoothed-series.
- Apply the inverse of AbstractMeasure.amiceTransformEquiv to that integral series. The existing equivalence includes continuity and boundedness of the resulting measure.
- The forward-transform equation and Mahler values follow from the existing equivalence laws. Injectivity of the existing transform gives uniqueness.

Acceptance:

- The construction lands in the existing continuous integral measure carrier at p=2 as well as odd primes. It does not construct the dyadic unit-group pseudomeasure.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-series`, `mathlib:Nat.Prime.coprime_iff_not_dvd`, `mathlib:PadicInt.norm_natCast_eq_one_iff`, `mathlib:PadicInt.isUnit_iff`, `mathlib:AbstractMeasure.amiceTransformEquiv`.

Uses:

- RJW Proposition 4.4 and Definition 4.5: Construct the integral power series before applying the existing Amice inverse; coefficient tests detect a sign error in the printed expansion.
- RJW Proposition 4.6 and DirichletPadicLFunctions:L1: The specific measure and its exact normalization are the input to polynomial moments, restriction to units and the zeta pseudomeasure.
- ColemanPowerSeries:L2; RJW Proposition 10.4: The Coleman logarithmic derivative compares with this same arithmetic smoothing series, so the sign and coefficient-map laws must be fixed before that comparison.
- RJW Lemmas 4.2–4.3 and Proposition 4.6; this checkpoint's formal Bernoulli and moment comparisons: Evaluate the same arithmetic object against ordinary polynomial functions; retain the rational scalar and factorial/sign normalization before using complex or p-adic embeddings.
- RJW Proposition 4.11; DirichletPadicLFunctions:L1 arithmetic smoothing compatibility and parity: Compare actual smoothing parameters before localization. The unweighted cocycle has scalar a; inverse weighting cancels it. Reflection has a zero-atom correction, killed by the inverse weight. These provide arithmetic identities for the later denominator-qualified independence and parity/descent comparisons.

API:

- `DirichletPadic.amice_smoothedMeasure` (characterisation): The Amice transform of μ_a is F_a for any unit certificate for a; promoted.
- `DirichletPadic.smoothedMeasure_mahler` (data): The nth Mahler value of μ_a is coefficient_n(F_a); promoted.
- `DirichletPadic.smoothedMeasure_unique` (universal-property): A measure with Amice transform F_a equals μ_a; promoted.
- `DirichletPadic.smoothedMeasure_moment` (data): The kth ordinary moment, embedded in ℚ_p, is (1−a^(k+1))B_(k+1)/(k+1); promoted with the exact PadicMeasuresIwasawaAlgebras:L2/ordinary-moment-exp supplier.
- `DirichletPadic.smoothedBernoulli_mem_padicInt` (structure): The smoothed rational Bernoulli value lies in the image of ℤ_p in ℚ_p; promoted and using the exact generic moment supplier.
- `DirichletPadic.smoothedMeasure_mul` (relation): For natural a,b with p∤a and p∤b, μ_(ab)=μ_a+a·σ_a(μ_b) as actual elements of D(Z,Z). The scalar a multiplies the raw pushforward; it is essential. Promoted to measure-smoothing-cocycle.
- `DirichletPadic.smoothedMeasure_cross` (relation): For natural a,b prime to p, b·σ_b(μ_a)−μ_a=a·σ_a(μ_b)−μ_b in D(Z,Z). Promoted to measure-cross-smoothing.
- `DirichletPadic.smoothedMeasure_reflection` (relation): For every natural a prime to p, μ_a+AbstractMeasure.map ε μ_a=(a−1)·δ₀ in D(Z,Z), with ε(z)=−z and δ₀ the existing Dirac measure at zero. Promoted to measure-reflection.

Tests:

- `SuggestedTests.measure_one` (degenerate): Over ℤ₃ the a=1 measure is zero.
- `SuggestedTests.measure_two_mass` (computation): Over ℤ₃ the a=2 measure has twice its zeroth Mahler value equal to 1.
- `SuggestedTests.measure_dyadic_mass` (computation): Over ℤ₂ the a=3 measure has zeroth Mahler value 1.
- `SuggestedTests.moment_zero_sign` (computation): At p=3,a=2 the embedded ordinary degree-zero moment is 1/2.
- `SuggestedTests.moment_one_dyadic` (computation): At p=2,a=3 the embedded degree-one moment is −2/3.
- `SuggestedTests.moment_two_not_mahler` (comparison): At p=3,a=2 the embedded degree-two ordinary moment is zero, unlike the degree-two Mahler value 1/8.
- `SuggestedTests.moment_three_factorial` (computation): At p=3,a=2 the embedded degree-three ordinary moment is 1/8, not the exponential coefficient 1/48.
- `SuggestedSmoothingTests.measure_product_odd` (computation): At p=3, μ₄=μ₂+2σ₂μ₂.
- `SuggestedSmoothingTests.measure_product_dyadic` (compatibility): At p=2, μ₁₅=μ₃+3σ₃μ₅.
- `SuggestedSmoothingTests.reflection_zero_atom` (non-example): At p=3, μ₂+map(−id)μ₂=δ₀; omitting the zero atom fails.
- `SuggestedSmoothingTests.reflection_dyadic` (compatibility): At p=2, μ₃+map(−id)μ₃=2δ₀, with no division by 2.

Source: RJW-published, Definition 4.5 and Proposition 4.6, printed p. 137 / PDF 38. The specific arithmetic measure is defined exactly as the source prescribes; the pinned library already supplies the requisite ℤ_p-coefficient Amice inverse.

### Amice transform of the smoothing measure

`DirichletPadicLFunctions:L1/measure-amice` — lemma.

The Amice transform of μ_a equals F_a over ℤ_p, independently of the chosen proof that a is a unit.

Hypotheses:

- p is a prime natural number, a is a natural number, and p does not divide a.
- Use the existing carrier D(ℤ_p,ℤ_p) of abstract ℤ_p-valued measures and its existing Amice equivalence.

Proof plan:

- Unfold smoothed-measure and use the inverse/forward laws of AbstractMeasure.amiceTransformEquiv.
- Use amiceTransformEquiv_apply to identify the forward map with amiceTransform; unit-certificate proof irrelevance identifies the series.

Acceptance:

- This equality fixes the sign: at a=2 and p=3 its constant coefficient is +1/2.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-measure`, `mathlib:AbstractMeasure.amiceTransformEquiv`, `mathlib:AbstractMeasure.amiceTransformEquiv_apply`.

Source: RJW-published, Definition 4.5, printed p. 137 / PDF 38. Defining property of the source measure, transported through the existing equivalence.

### Mahler values of the smoothing measure

`DirichletPadicLFunctions:L1/measure-mahler` — lemma.

For each n≥0, μ_a applied to the continuous nth Mahler basis function equals coefficient_n(F_a).

Hypotheses:

- p is a prime natural number, a is a natural number, and p does not divide a.
- Use the existing carrier D(ℤ_p,ℤ_p) of abstract ℤ_p-valued measures and its existing Amice equivalence.

Proof plan:

- Apply coefficient_n to measure-amice.
- Use AbstractMeasure.coeff_amiceTransformEquiv and amiceTransformEquiv_apply.

Acceptance:

- At p=3,a=2,n=0 the value is 1/2; at p=2,a=3,n=0 it is 1. Ordinary powers x^k require an additional moment calculation and are not identified with Mahler functions.

Prerequisites: `DirichletPadicLFunctions:L1/measure-amice`, `mathlib:AbstractMeasure.coeff_amiceTransformEquiv`, `mathlib:AbstractMeasure.amiceTransformEquiv_apply`.

Source: RJW-published, Definition 4.5 and the reference to Corollary 3.30 before Proposition 4.4, printed p. 137 / PDF 38. Coefficient-level consequence of the defining Amice transform; the equivalence with Mahler values is the pinned baseline.

### Uniqueness of the smoothing measure

`DirichletPadicLFunctions:L1/measure-uniqueness` — lemma.

Every ℤ_p-valued measure on ℤ_p whose Amice transform is F_a equals μ_a.

Hypotheses:

- p is a prime natural number, a is a natural number, and p does not divide a.
- Use the existing carrier D(ℤ_p,ℤ_p) of abstract ℤ_p-valued measures and its existing Amice equivalence.

Proof plan:

- Compare its assumed transform with measure-amice.
- Apply the existing AbstractMeasure.injective_amiceTransform in the coefficient ring ℤ_p.

Acceptance:

- The zero transform forces μ₁=0. No independent measure-space carrier or new general uniqueness theorem is introduced.

Prerequisites: `DirichletPadicLFunctions:L1/measure-amice`, `mathlib:AbstractMeasure.injective_amiceTransform`.

Source: RJW-published, Definition 4.5, printed p. 137 / PDF 38. Uniqueness of this particular arithmetic measure uses the existing general Amice injectivity theorem.

### Exponential denominator factorization

`DirichletPadicLFunctions:L1/denominator-exp-factorization` — lemma.

(E−1) q_a(E−1)=E^a−1 in R[[X]], for every natural a (including a=0).

Hypotheses:

- R is a commutative ℚ-algebra and a is a natural number. E=PowerSeries.exp R, h=E−1, B=bernoulliPowerSeries R and B_a=rescale(a) B. All of these are the existing Mathlib series; q_a is this packet's integral smoothing denominator.

Proof plan:

- constantCoeff_exp implies constantCoeff(h)=0. HasSubst.of_constantCoeff_zero' therefore licenses substAlgHom h; no analytic exponential on ℤ_p is invoked.
- Apply this algebra homomorphism to denominator-factorization. Its X and constant rules identify the two sides with h q_a(h) and (1+h)^a−1=E^a−1.

Acceptance:

- At a=0 both sides vanish; at a=1 the equation is h=h. No inverse of a or X is required.

Prerequisites: `DirichletPadicLFunctions:L1/denominator-factorization`, `mathlib:PowerSeries.exp`, `mathlib:PowerSeries.constantCoeff_exp`, `mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'`, `mathlib:PowerSeries.substAlgHom`, `mathlib:PowerSeries.coe_substAlgHom`, `mathlib:PowerSeries.substAlgHom_X`, `mathlib:PowerSeries.subst_C`.

Source: RJW-published, Lemma 4.3 and equation (4-1), printed p. 136 / PDF 37; Proposition 4.4, printed p. 137 / PDF 38. Formal-series implementation of the source's change T=exp(t)−1, not an assertion of analytic convergence. The algebraic Bernoulli identity is already baseline; only its arithmetic smoothing specialization is new. The ℚ-algebra generality is an explicit extension of the source's scalar calculation.

### Bernoulli denominator comparison

`DirichletPadicLFunctions:L1/bernoulli-denominator-comparison` — lemma.

B_a q_a(E−1)=C(a) B in R[[X]], for every natural a.

Hypotheses:

- R is a commutative ℚ-algebra and a is a natural number. E=PowerSeries.exp R, h=E−1, B=bernoulliPowerSeries R and B_a=rescale(a) B. All of these are the existing Mathlib series; q_a is this packet's integral smoothing denominator.

Proof plan:

- Rescale the baseline identity B(E−1)=X by a. The ring-map laws, exp_pow_eq_rescale_exp and rescale_X give B_a(E^a−1)=C(a)X.
- Use denominator-exp-factorization to replace E^a−1 by h q_a(h). The unscaled Bernoulli identity also gives C(a) B h=C(a)X.
- Thus h times the two proposed sides agrees. Multiply that equality by B and use Bh=X; cancel X with PowerSeries.X_mul_cancel. This avoids a domain hypothesis and does not divide by h.

Acceptance:

- At a=1 the equation is B=B; at a=0 both sides are zero. It holds over commutative ℚ-algebras with zero divisors.

Prerequisites: `DirichletPadicLFunctions:L1/denominator-exp-factorization`, `mathlib:bernoulliPowerSeries`, `mathlib:bernoulliPowerSeries_mul_exp_sub_one`, `mathlib:PowerSeries.rescale`, `mathlib:PowerSeries.exp_pow_eq_rescale_exp`, `mathlib:PowerSeries.rescale_X`, `mathlib:PowerSeries.X_mul_cancel`.

Source: RJW-published, Lemma 4.3 and equation (4-1), printed p. 136 / PDF 37; Proposition 4.4, printed p. 137 / PDF 38. Formal-series implementation of the source's change T=exp(t)−1, not an assertion of analytic convergence. The algebraic Bernoulli identity is already baseline; only its arithmetic smoothing specialization is new. The ℚ-algebra generality is an explicit extension of the source's scalar calculation.

### Smoothed Bernoulli generating series

`DirichletPadicLFunctions:L1/series-exp-bernoulli` — theorem.

For a with unit image in R, X F_a(E−1)=B−B_a in R[[X]].

Hypotheses:

- R is a commutative ℚ-algebra and a is a natural number. E=PowerSeries.exp R, h=E−1, B=bernoulliPowerSeries R and B_a=rescale(a) B. All of these are the existing Mathlib series; q_a is this packet's integral smoothing denominator.
- The image of a in R is a unit; use the same smoothedSeries and its unit certificate as in the integral construction.

Proof plan:

- Apply substAlgHom h to series-cleared-equation to get h q_a(h) F_a(h)=q_a(h)−C(a). Formal substitutability follows as in denominator-exp-factorization.
- Multiply by B and use B h=X. Replace C(a) B by B_a q_a(h), using bernoulli-denominator-comparison.
- Both sides now have the factor q_a(h). It is a unit: denominator-unit followed by IsUnit.map under substAlgHom h. Cancel this unit to obtain the equality.
- All steps are formal algebra. This is a coefficient-level route to the Bernoulli application, not a replacement for the retained real Mellin continuation, decay or differentiation proof.

Acceptance:

- Over ℚ at a=2, F₂(E−1)=1/(1+E) has coefficients 1/2, −1/4, 0, 1/48 in degrees 0–3. At a=1 the series is zero.

Prerequisites: `DirichletPadicLFunctions:L1/series-cleared-equation`, `DirichletPadicLFunctions:L1/denominator-unit`, `DirichletPadicLFunctions:L1/denominator-exp-factorization`, `DirichletPadicLFunctions:L1/bernoulli-denominator-comparison`, `mathlib:bernoulliPowerSeries_mul_exp_sub_one`, `mathlib:IsUnit.map`, `mathlib:IsUnit.mul_left_cancel`, `mathlib:PowerSeries.exp`, `mathlib:PowerSeries.constantCoeff_exp`, `mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'`, `mathlib:PowerSeries.substAlgHom`, `mathlib:PowerSeries.coe_substAlgHom`, `mathlib:PowerSeries.substAlgHom_X`, `mathlib:PowerSeries.subst_C`.

Source: RJW-published, Lemma 4.3 and equation (4-1), printed p. 136 / PDF 37; Proposition 4.4, printed p. 137 / PDF 38. Formal-series implementation of the source's change T=exp(t)−1, not an assertion of analytic convergence. The algebraic Bernoulli identity is already baseline; only its arithmetic smoothing specialization is new. The ℚ-algebra generality is an explicit extension of the source's scalar calculation.

### Factorial-normalized smoothing coefficients

`DirichletPadicLFunctions:L1/series-exp-coefficients` — lemma.

For every k≥0, k!·coefficient_k(F_a(E−1))=algebraMap ℚ R ((1−a^(k+1)) B_(k+1)/(k+1)), with Mathlib's bernoulli and B₁=−1/2.

Hypotheses:

- R is a commutative ℚ-algebra and a is a natural number. E=PowerSeries.exp R, h=E−1, B=bernoulliPowerSeries R and B_a=rescale(a) B. All of these are the existing Mathlib series; q_a is this packet's integral smoothing denominator.
- The image of a in R is a unit; k is a natural number. Rational denominators are formed in ℚ before applying algebraMap, never in ℤ_p.

Proof plan:

- Take coefficient k+1 of series-exp-bernoulli. coeff_succ_X_mul identifies the left side as coefficient k of F_a(h).
- Unfold the existing bernoulliPowerSeries and use coeff_mk and coeff_rescale. The right side is the image of (1−a^(k+1)) B_(k+1)/(k+1)!.
- Multiply by k! and use (k+1)!=(k+1)k! in ℚ, where factorials are nonzero. Ring-map laws transport the resulting equality to R. In particular k=0 is retained.

Acceptance:

- At k=0 the value is (a−1)/2, not its negative. For a=2,k=3 the coefficient is 1/48 but the factorial-normalized value is 1/8.

Prerequisites: `DirichletPadicLFunctions:L1/series-exp-bernoulli`, `mathlib:PowerSeries.coeff_succ_X_mul`, `mathlib:bernoulliPowerSeries`, `mathlib:PowerSeries.coeff_mk`, `mathlib:PowerSeries.coeff_rescale`.

Source: RJW-published, Lemma 4.2, printed p. 136 / PDF 37, together with Lemma 4.3 and Proposition 4.6. Formal-series implementation of the source's change T=exp(t)−1, not an assertion of analytic convergence. The algebraic Bernoulli identity is already baseline; only its arithmetic smoothing specialization is new. The ℚ-algebra generality is an explicit extension of the source's scalar calculation.

### Complex comparison of the smoothed rational value

`DirichletPadicLFunctions:L0/smoothed-value-complex` — comparison.

For a,k∈ℕ the complex image of the rational number (1−a^(k+1)) B_(k+1)/(k+1) equals (−1)^k (1−a^(k+1)) ζ(−k).

Hypotheses:

- a,k are natural numbers. Bernoulli numbers use Mathlib's B₁=−1/2 convention. The comparison uses algebraMap ℚ ℂ, not an isomorphism from ℂ to a p-adic field.

Proof plan:

- Rewrite ζ(−k) by the existing riemannZeta_neg_nat_eq_bernoulli. This statement includes k=0.
- The two factors (−1)^k multiply to 1. Use the rational-to-complex ring-map laws to identify the result with the indicated rational image.
- This is only the smoothing and embedding comparison. The baseline special-value theorem is not re-proved; the analytic Mellin argument remains an L0 gap.

Acceptance:

- At a=2,k=0, (1−2)ζ(0)=1/2. For k=1 the value is (1−a²)/12. This formula does not yet include any unit-restriction Euler factor.

Prerequisites: `mathlib:riemannZeta_neg_nat_eq_bernoulli`.

Tests:

- `SuggestedTests.complex_zero_sign` (computation): (1−2)ζ(0)=1/2 in ℂ.

Source: RJW-published, Lemma 4.2 and Proposition 4.6, printed pp. 136–137 / PDF 37–38. Comparison of the source's complex notation with an explicit rational value using the existing corrected negative-zeta formula. No transport of arbitrary complex values is asserted.

### Ordinary moments of the smoothing measure

`DirichletPadicLFunctions:L1/measure-ordinary-moment` — theorem.

For p prime, p∤a and every k≥0, the image in ℚ_p of μ_a(x↦x^k) equals algebraMap ℚ ℚ_p ((1−a^(k+1)) B_(k+1)/(k+1)).

Hypotheses:

- p is prime; a,k are natural numbers; p does not divide a. μ_a is the already planned ℤ_p-valued smoothedMeasure and x↦x^k is (ContinuousMap.id ℤ_p)^k.
- The measure is evaluated before the value is embedded into ℚ_p. No scalar-extension construction of measures and no ℤ_p-coefficient exponential series is assumed.

Proof plan:

- Apply the generic formal-exponential/Amice moment comparison supplied by PadicMeasuresIwasawaAlgebras:L2/ordinary-moment-exp to μ_a. That comparison identifies its embedded ordinary moment with k! times coefficient k of its coefficient-extended Amice series after substituting exp−1.
- Use measure-amice and series-coefficient-map for ℤ_p→ℚ_p to identify that coefficient-extended Amice series with F_a over ℚ_p. The norm/unit criteria already used in smoothed-measure supply the ℤ_p unit certificate; IsUnit.map supplies its image in ℚ_p.
- Apply series-exp-coefficients with R=ℚ_p. No factor (−1)^k remains in the Bernoulli expression. The separate smoothed-value-complex node recovers the source's complex notation via the same rational number.
- The generic comparison is supplied by the exact L2 node, whose weighting/Mahler/formal-calculus prerequisites end in the pinned baseline. This fills the supplier boundary in the proof plan, not an implementation claim.

Acceptance:

- For p=3,a=2 the moments of degrees 0,1,2,3 are 1/2,−1/4,0,1/8. The degree-two Mahler value is instead 1/8, so these test functions must not be conflated.
- For p=2,a=3 the degree-one ordinary moment is −2/3 in ℚ₂ and is integral. No inverse of 2 in ℤ₂ is required.

Prerequisites: `DirichletPadicLFunctions:L1/measure-amice`, `DirichletPadicLFunctions:L1/series-coefficient-map`, `DirichletPadicLFunctions:L1/series-exp-coefficients`, `PadicMeasuresIwasawaAlgebras:L2/ordinary-moment-exp`, `mathlib:Nat.Prime.coprime_iff_not_dvd`, `mathlib:PadicInt.norm_natCast_eq_one_iff`, `mathlib:PadicInt.isUnit_iff`, `mathlib:IsUnit.map`.

Source: RJW-published, Proposition 4.6, printed p. 137 / PDF 38, using Corollary 3.30, printed p. 126 / PDF 27. The source's ordinary-moment theorem, expressed through its rational Bernoulli value. The formal coefficient proof route complements, but does not discharge, L0's mandated Mellin argument; the generic moment comparison remains with its accepted RS-14 owner.

### Integrality of smoothed Bernoulli values

`DirichletPadicLFunctions:L1/smoothed-value-integral` — theorem.

For p prime and p∤a, for each k≥0 there exists z∈ℤ_p whose image in ℚ_p is (1−a^(k+1)) B_(k+1)/(k+1).

Hypotheses:

- p is prime; a,k are natural numbers; p does not divide a. The rational expression is embedded in ℚ_p using algebraMap.

Proof plan:

- Choose z=μ_a((ContinuousMap.id ℤ_p)^k), which is in ℤ_p because the existing carrier is an integral measure on integral continuous functions.
- Use measure-ordinary-moment for the required equality in ℚ_p. This is smoothed integrality, not unsmoothed Bernoulli integrality, Kummer congruences or a dyadic pseudomeasure splitting.

Acceptance:

- For p=2,a=3,k=1 the value is −2/3, which is 2-adically integral although B₂/2=1/12 is not. The nonunit parameter p=2,a=2 remains excluded.

Prerequisites: `DirichletPadicLFunctions:L1/measure-ordinary-moment`.

Source: RJW-published, Proposition 4.4, Definition 4.5 and Proposition 4.6, printed p. 137 / PDF 38. Immediate arithmetic integrality consequence of the source's integral measure and moment theorem; the claim is explicitly smoothed.

### Cyclotomic average of the smoothing fractions

`DirichletPadicLFunctions:L1/smoothing-root-average` — lemma.

For a characteristic-zero field K, a primitive p-th root ζ∈K, y∈K with y^p≠1 and y^(pa)≠1, and p∤a, the sum over 0≤i<p of [1/(ζ^i y−1)−a/((ζ^i y)^a−1)] equals p[1/(y^p−1)−a/(y^(pa)−1)].

Hypotheses:

- p is prime, K is a field of characteristic zero, ζ is a primitive p-th root, a∈ℕ and p∤a, y^p≠1 and y^(pa)≠1.

Proof plan:

- Import the exact supplier root-partial-fractions identity: Σ_i 1/(ζ^i y−1)=p/(y^p−1). This is a finite identity in K, not an application of ψ to a pole.
- From p∤a and primality obtain gcd(a,p)=1. IsPrimitiveRoot.pow_of_coprime makes ζ^a primitive of order p. Apply the same imported identity to ζ^a and y^a. Its denominator is y^(pa)−1 by commutation of natural powers.
- Distribute the finite sum across subtraction and the scalar a, and combine the two identities. The displayed nonvanishing hypotheses ensure all denominators at roots are nonzero; no analytic substitution is used.

Acceptance:

- At p=2,a=3,ζ=−1,y=2 the two summands are 4/7 and 0, agreeing with 2(1/3−3/63)=4/7. At a=1 both sides vanish.
- The assumption p∤a is essential: at p=2,a=2,y=2 the two sides are −2/3 and 2/5, respectively.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/root-partial-fractions`, `mathlib:IsPrimitiveRoot.pow_of_coprime`, `mathlib:Nat.Prime.coprime_iff_not_dvd`.

Source: RJW-published, Lemma 4.7 and its partial-fraction calculation, printed p.137 / PDF38; arXiv v2 p.27. The source computes the unsmoothed partial fractions and then smooths. This node gives only the arithmetic two-term consequence, leaving the generic identity to its owner.

### Frobenius comparison for the smoothed series

`DirichletPadicLFunctions:L1/series-phi-psi-fixed` — lemma.

On B=ℤ_p[[T]], with b=(1+T)^p−1, φ(ψ_B(F_a))=φ(F_a), where φ(F)=F(b) and ψ_B is the exact bounded integral Amice-transported operator.

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Use the exact rational-root-average-descent in the supplier’s cyclotomic subfield K of ℂ_p, with its inclusion and canonical ℤ_p coefficient map. Write F_a=P/Q, where P=Σ_{j<a} choose(a,j+2)T^j and Q=Σ_{j<a} choose(a,j+1)T^j. Their series images are b_a and q_a; Q(0)=a is a unit. The existing cancellation equation supplies QF_a=P.
- In Frac(K[[T]]) put Y=1+T. The supplier comparison gives p·j(φψ_B F_a)=Σ_i P(ζ^iY−1)/Q(ζ^iY−1). Here polynomial evaluation is finite. It is never PowerSeries.subst at the nonnilpotent constant ζ^i−1.
- The binomial identities TQ=Y^a−1 and TP=Q−a turn each quotient into 1/(ζ^iY−1)−a/((ζ^iY)^a−1). All divisors are nonzero: for i=0 the linear coefficient detects nonzero T and aT, while for i≠0 the primitive-root/coprimality conditions give nonzero constants. Equivalently this follows from the nonzero polynomials in the field.
- Apply smoothing-root-average with y=Y. Its hypotheses hold because Y^p−1 and Y^(pa)−1 are nonzero polynomials in characteristic zero (p,a>0). The resulting right side is p·j(φF_a), by series-fraction-comparison for the receiving map j∘φ; this map sends T to the nonzero b.
- Cancel nonzero p in the field and use the injectivity of the coefficient/series embedding j to descend equality to B. The exact supplier nodes rational-root-average-descent and translated-polynomial-descent-nonzero now supply the operator comparison and nonvanishing. Their statements use the original bounded psiSeries and topological root evaluation, not an action on individual poles.

Acceptance:

- Both sides are integral series although individual fractions have poles. At a=1 both are zero; no Laurent-series extension of ψ is assumed.

Prerequisites: `DirichletPadicLFunctions:L1/smoothing-root-average`, `DirichletPadicLFunctions:L1/series-cancellation`, `DirichletPadicLFunctions:L1/denominator-factorization`, `DirichletPadicLFunctions:L1/series-cleared-equation`, `DirichletPadicLFunctions:L1/series-fraction-comparison`, `PadicMeasuresIwasawaAlgebras:L2/psi-series`, `PadicMeasuresIwasawaAlgebras:L2/rational-root-average-descent`, `PadicMeasuresIwasawaAlgebras:L2/translated-polynomial-descent-nonzero`.

Source: RJW-published, Lemma 4.7 and its partial-fraction calculation, printed p.137 / PDF38; arXiv v2 p.27. Domain-correct version of the source’s intermediate equality; E6 records the missing domain justification.

### Psi invariance of the smoothing series

`DirichletPadicLFunctions:L1/series-psi-fixed` — theorem.

ψ_B(F_a)=F_a in ℤ_p[[T]].

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Apply the existing planned ψ_B to both sides of series-phi-psi-fixed. Use the exact psi-series-phi law twice: ψ_Bφ=id.
- This removes φ without introducing a localization action or an invariance hypothesis. The averaging input now follows from the exact supplier nodes imported by series-phi-psi-fixed.

Acceptance:

- Works at p=2 for odd a as well as odd p. For a=1 it agrees with ψ_B(0)=0.

Prerequisites: `DirichletPadicLFunctions:L1/series-phi-psi-fixed`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-phi`.

Source: RJW-published, Lemma 4.7 and its partial-fraction calculation, printed p.137 / PDF38; arXiv v2 p.27. The exact arithmetic fixed-point statement on the bounded carrier. Generic root averaging is supplied by the exact L2 rational-root-average-descent node.

### Psi invariance of the smoothing measure

`DirichletPadicLFunctions:L1/measure-psi-fixed` — theorem.

ψ(μ_a)=μ_a in D(ℤ_p,ℤ_p).

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Apply injective_amiceTransform. Rewrite A(ψμ_a) using psi-series-intertwining and Aμ_a=F_a using measure-amice.
- Apply series-psi-fixed, then measure-amice in reverse. The p-adic unit certificate is the same norm/unit criterion as in smoothed-measure.

Acceptance:

- This is ψ-invariance of μ_a, not unit support: ψμ_a=μ_a, whereas a unit-supported measure has ψμ=0. For p=3,a=2 the nonzero total mass 1/2 rules out that confusion.

Prerequisites: `DirichletPadicLFunctions:L1/series-psi-fixed`, `DirichletPadicLFunctions:L1/measure-amice`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-intertwining`, `mathlib:AbstractMeasure.injective_amiceTransform`, `DirichletPadicLFunctions:L1/smoothed-measure`.

Source: RJW-published, Lemma 4.7 and its partial-fraction calculation, printed p.137 / PDF38; arXiv v2 p.27. Lemma 4.7 itself, transported through the exact integral Amice comparison.

### Trivial smoothing measure

`DirichletPadicLFunctions:L1/measure-one` — lemma.

For every prime p, the admissible boundary parameter a=1 gives μ_1=0.

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- At a=1 every numerator coefficient choose(1,n+2) vanishes. Unfold the smoothed-series definition and use coefficient extensionality to get F_1=0.
- Use measure-amice and injective_amiceTransform to conclude μ_1=0. This boundary test is independent of root averaging.

Acceptance:

- The later denominator θ_1=[1]−[1] is also zero; the zero measure test does not allow division by θ_1.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-series`, `DirichletPadicLFunctions:L1/measure-amice`, `mathlib:AbstractMeasure.injective_amiceTransform`.

Source: RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. Boundary extension of the source’s arithmetic measure definition, used to test the restriction and numerator constructions.

### Unit restriction of the smoothing measure

`DirichletPadicLFunctions:L1/unit-smoothed-measure` — construction.

Construct ρ_a=unitSmoothedMeasure p a := Eμ_a in D(ℤ_p,ℤ_p). It is the unit restriction on the ambient carrier.

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Apply the existing unitRestriction linear map to the already constructed μ_a. No subtype measure, coefficient extension or new restriction operator is constructed.
- The definition requires no ψ-invariance. The separate support, difference and moment nodes prove the arithmetic API; the difference and numerical moments use the exact averaging supplier through series-phi-psi-fixed.
- The a=1 API uses measure-one and linearity of E; it does not use averaging.

Acceptance:

- The integral ambient carrier is retained at p=2. The mass and moment tests depend on the later Euler-factor proof; they are typed target tests, not independently implemented evidence.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-measure`, `DirichletPadicLFunctions:L1/measure-one`, `PadicMeasuresIwasawaAlgebras:L2/unit-restriction`.

Uses:

- RJW Proposition 4.8: The restriction removes the Euler factor.
- RJW equation (4-3) and Definition 4.10: The numerator is its inverse weighting before any pseudomeasure denominator is inverted.

API:

- `DirichletPadic.unitSmoothedMeasure_eq` (characterisation): ρ_a=Eμ_a.
- `DirichletPadic.unitSmoothedMeasure_supported` (relation): Eρ_a=ρ_a; promoted to unit-smoothed-support.
- `DirichletPadic.unitSmoothedMeasure_eq_sub_phi` (relation): ρ_a=μ_a−φμ_a; promoted to unit-smoothed-difference.
- `DirichletPadic.unitSmoothedMeasure_euler` (data): ρ_a(x^k)=(1−p^k)μ_a(x^k); promoted to unit-smoothed-euler.
- `DirichletPadic.unitSmoothedMeasure_moment` (data): Its embedded moment is (1−p^k)(1−a^(k+1))B_(k+1)/(k+1); promoted to unit-smoothed-moment.
- `DirichletPadic.unitSmoothedMeasure_mass` (simp): ρ_a(1)=0; promoted to unit-smoothed-mass.
- `DirichletPadic.unitSmoothedMeasure_one` (simp): At a=1 the measure ρ_1 is zero.

Tests:

- `SuggestedTests.unit_smoothing_mass` (degenerate): For p=3,a=2, ρ_a(1)=0.
- `SuggestedTests.unit_smoothing_first_moment` (computation): For p=3,a=2, the image of ρ_a(x) in ℚ₃ is 1/2.
- `SuggestedTests.unit_smoothing_dyadic` (computation): For p=2,a=3, the image of ρ_a(x) in ℚ₂ is 2/3.
- `SuggestedTests.unit_smoothing_one` (degenerate): For p=3,a=1, ρ_a=0.

Source: RJW-published, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.28. Arithmetic application of the generic unit restriction already owned by L2.

### Unit support of the restricted smoothing measure

`DirichletPadicLFunctions:L1/unit-smoothed-support` — lemma.

Eρ_a=ρ_a.

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Unfold unit-smoothed-measure. At each continuous test function f, apply the exact unit-restriction-evaluation supplier twice: E(Eμ_a)(f)=μ_a((1−χ)((1−χ)f)), where χ is the existing clopen characteristic function of pZ.
- By the pinned LocallyConstant.coe_charFn, χ has value zero or one at each point. Split on membership in pZ; (1−χ)²=1−χ in both cases. Hence the value is μ_a((1−χ)f)=Eμ_a(f). Extensionality concludes, independently of root averaging. No unpromoted foreign idempotence API is used.

Acceptance:

- Equivalent to ψρ_a=0 by the supplier’s unit-support criterion; this statement does not say ψμ_a=0.

Prerequisites: `DirichletPadicLFunctions:L1/unit-smoothed-measure`, `PadicMeasuresIwasawaAlgebras:L2/unit-restriction-evaluation`, `mathlib:LocallyConstant.coe_charFn`.

Source: RJW-published, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.28. The source restricts to units; the ambient formulation records that support exactly.

### Euler projector on the arithmetic measure

`DirichletPadicLFunctions:L1/unit-smoothed-difference` — lemma.

ρ_a=μ_a−φμ_a.

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Use E=id−P from unit-restriction and Pμ=φψμ from phi-psi.
- Apply measure-psi-fixed to μ_a. Thus Eμ_a=μ_a−φμ_a. This is where the source’s ψ-invariance is required.

Acceptance:

- Taking total mass gives zero since φ preserves constant test functions. The equality holds on all continuous test functions.

Prerequisites: `DirichletPadicLFunctions:L1/unit-smoothed-measure`, `DirichletPadicLFunctions:L1/measure-psi-fixed`, `PadicMeasuresIwasawaAlgebras:L2/unit-restriction`, `PadicMeasuresIwasawaAlgebras:L2/phi-psi`.

Source: RJW-published, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.28. The second equality in the proof of Proposition 4.8.

### Euler factor for unit moments

`DirichletPadicLFunctions:L1/unit-smoothed-euler` — lemma.

For every k≥0, ρ_a(x↦x^k)=(1−p^k)μ_a(x↦x^k) in ℤ_p.

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Evaluate unit-smoothed-difference on the continuous polynomial x^k.
- Use phi-evaluation to replace (φμ_a)(x^k) by μ_a((px)^k). Pointwise (px)^k=p^k x^k; integral measure linearity extracts p^k. This also holds for k=0, including at x=0.

Acceptance:

- At k=0 the factor is zero. At p=2,k=1 it is −1, not an inverse of 2.

Prerequisites: `DirichletPadicLFunctions:L1/unit-smoothed-difference`, `PadicMeasuresIwasawaAlgebras:L2/phi-evaluation`.

Source: RJW-published, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.28. The source’s last equality in the proof of Proposition 4.8.

### Smoothed Bernoulli values on units

`DirichletPadicLFunctions:L1/unit-smoothed-moment` — theorem.

For k≥0, the image of ρ_a(x^k) in ℚ_p is (1−p^k)(1−a^(k+1))B_(k+1)/(k+1), with rational Bernoulli numbers B₁=−1/2.

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Embed unit-smoothed-euler into ℚ_p. Apply measure-ordinary-moment and preservation of rational/natural scalars by the canonical maps.
- The result is stated as an equality of two images in ℚ_p, after evaluating the integral measure. It never casts a complex zeta value into a p-adic field.

Acceptance:

- For p=3,a=2 the moments of degrees 0,1,2,3 are 0,1/2,0,−13/4. For p=2,a=3 the first moment is 2/3.

Prerequisites: `DirichletPadicLFunctions:L1/unit-smoothed-euler`, `DirichletPadicLFunctions:L1/measure-ordinary-moment`.

Source: RJW-published, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.28. Bernoulli normalization of Proposition 4.8, using the earlier exact rational/complex comparison.

### Zero mass of the unit smoothing measure

`DirichletPadicLFunctions:L1/unit-smoothed-mass` — lemma.

ρ_a(1)=0 in ℤ_p.

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Specialize unit-smoothed-euler to k=0. The continuous function x^0 is 1 everywhere and 1−p^0=0.

Acceptance:

- The full μ_a has mass (a−1)/2 in ℚ_p, so zero unit mass is a meaningful restriction test.

Prerequisites: `DirichletPadicLFunctions:L1/unit-smoothed-euler`.

Source: RJW-published, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.28. Weight-zero consequence of Proposition 4.8, required at the k=1 numerator endpoint.

### Integrality of Euler-smoothed Bernoulli values

`DirichletPadicLFunctions:L1/unit-smoothed-integral` — theorem.

For every k≥0, (1−p^k)(1−a^(k+1))B_(k+1)/(k+1) in ℚ_p lies in the image of ℤ_p.

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Take the integral witness ρ_a(x^k). Apply unit-smoothed-moment. This does not assert integrality after cancelling either factor.

Acceptance:

- At p=2,a=3,k=1 the value 2/3 is integral. No assertion is made that B₂/2 is integral.

Prerequisites: `DirichletPadicLFunctions:L1/unit-smoothed-moment`.

Source: RJW-published, Proposition 4.8 and proof, printed p.138 / PDF39; arXiv v2 p.28. Integral consequence of the actual measure; a later Kummer theorem still needs its own denominator and congruence hypotheses.

### Arithmetic numerator measure

`DirichletPadicLFunctions:L1/smoothed-numerator` — construction.

Construct ν_a=smoothedNumerator p a := Jμ_a in D(ℤ_p,ℤ_p), where J is the exact imported inverseWeight. Since J(Eμ)=Jμ, this is x⁻¹ times the unit-restricted smoothing measure.

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Apply the existing inverseWeight to μ_a. Its multiplier is the already existing PadicInt.inv, continuous by the supplier’s proof plan and zero at every nonunit. No new inverse function or generic measure operator is defined.
- Use inverse-weight-support to identify Jμ_a with Jρ_a. The inverse-weight-evaluation node supplies the evaluation API. Its support and primitive characterization are proved in the promoted nodes below, independently of ψ-invariance.
- The a=1 API follows from measure-one and linearity of J. Numerical moments are proved through the later moment-shift and Euler-factor nodes, not assumed by the construction.

Acceptance:

- The definition is meaningful for every prime, including p=2. It constructs the integral numerator only; no completed-group-ring denominator has been inverted.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-measure`, `DirichletPadicLFunctions:L1/unit-smoothed-measure`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-support`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-evaluation`, `DirichletPadicLFunctions:L1/measure-one`.

Uses:

- RJW equation (4-3): Shifts the exponent so the smoothing factor is a^k−1.
- RJW Definition 4.10 and Proposition 4.11: Supplies the arithmetic numerator whose regularity and division by θ_a remain separate proof obligations.
- ColemanPowerSeries:L2 comparison: Gives an exact arithmetic Amice target; the Coleman owner still proves its normalization and sign comparison.
- RJW Proposition 4.11; DirichletPadicLFunctions:L1 arithmetic smoothing compatibility and parity: Compare actual smoothing parameters before localization. The unweighted cocycle has scalar a; inverse weighting cancels it. Reflection has a zero-atom correction, killed by the inverse weight. These provide arithmetic identities for the later denominator-qualified independence and parity/descent comparisons.

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
- `DirichletPadic.smoothedNumerator_mul` (relation): For natural a,b prime to p, ν_(ab)=ν_a+σ_a(ν_b), where ν_c=Jμ_c. There is no extra scalar a after inverse weighting. Promoted to numerator-smoothing-cocycle.
- `DirichletPadic.smoothedNumerator_cross` (relation): For natural a,b prime to p, σ_b(ν_a)−ν_a=σ_a(ν_b)−ν_b in D(Z,Z). This is the explicit numerator compatibility for the eventual denominators [a]−[1], expressed solely by existing pushforwards. Promoted to numerator-cross-smoothing.
- `DirichletPadic.smoothedNumerator_even` (relation): For every natural a prime to p, AbstractMeasure.map ε ν_a=ν_a, with ε(z)=−z and ν_a=Jμ_a. The equality holds integrally also at p=2. Promoted to numerator-even.

Tests:

- `SuggestedTests.numerator_endpoint` (degenerate): For p=3,a=2, ν_a(x)=0.
- `SuggestedTests.numerator_second_moment` (computation): For p=3,a=2, the image of ν_a(x²) in ℚ₃ is 1/2.
- `SuggestedTests.numerator_dyadic` (computation): For p=2,a=3, the image of ν_a(x²) in ℚ₂ is 2/3.
- `SuggestedTests.numerator_one` (degenerate): For p=3,a=1, ν_a=0.
- `SuggestedTests.numerator_not_unit_measure` (non-example): For p=3,a=2, ν_a≠ρ_a; their first moments are 0 and 1/2.
- `SuggestedSmoothingTests.numerator_product_scalar` (compatibility): At p=3, Jμ₄=Jμ₂+σ₂Jμ₂, without an extra 2.
- `SuggestedSmoothingTests.cross_smoothing_second_moment` (computation): At p=3, 15·(Jμ₂)(x²)=3·(Jμ₄)(x²), detecting the exponent k in the normalized factors.
- `SuggestedSmoothingTests.even_dyadic_numerator` (compatibility): At p=2, map(−id)(Jμ₃)=Jμ₃.

Source: RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. The arithmetic specialization of equation (4-3), using the owner’s now explicit generic operator.

### Unit support of the arithmetic numerator

`DirichletPadicLFunctions:L1/numerator-support` — lemma.

Eν_a=ν_a.

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Apply inverse-weight-support to μ_a and unfold smoothed-numerator. The result is independent of root averaging.

Acceptance:

- The equivalent criterion is ψν_a=0. This follows because J vanishes on every nonunit, not by treating all nonzero p-adic integers as units.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-numerator`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-support`.

Source: RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. The source constructs the numerator on units; the shared ambient formulation makes this support explicit.

### Primitive equation for the numerator

`DirichletPadicLFunctions:L1/numerator-weight` — lemma.

Wν_a=ρ_a, where W is weighting by the identity continuous function x.

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Apply the exact generic weight-inverse-weight identity WJμ=Eμ to μ_a. Unfold the two arithmetic constructions.

Acceptance:

- The identity is on every continuous test function, including weight zero; it does not invert x at a nonunit.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-numerator`, `DirichletPadicLFunctions:L1/unit-smoothed-measure`, `PadicMeasuresIwasawaAlgebras:L2/weight-inverse-weight`.

Source: RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. Defining cancellation of multiplication by x and by x⁻¹ on the unit-supported component.

### Unique unit-supported arithmetic primitive

`DirichletPadicLFunctions:L1/numerator-unique` — theorem.

For ν∈D, if Eν=ν and Wν=ρ_a, then ν=ν_a.

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Apply J to Wν=ρ_a. The generic inverse-weight-weight identity gives JWν=Eν=ν.
- On the right, inverse-weight-support gives Jρ_a=Jμ_a=ν_a. Thus equality follows. Support is essential, since W kills the mass at zero.

Acceptance:

- Without unit support, ν_a+cδ₀ has the same W-image for any c. The uniqueness statement therefore tests both required properties.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-numerator`, `DirichletPadicLFunctions:L1/unit-smoothed-measure`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-weight`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-support`.

Source: RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. Uniqueness API derived from the source’s inverse weighting, without claiming pseudomeasure independence.

### Moment shift under inverse weighting

`DirichletPadicLFunctions:L1/numerator-moment-shift` — lemma.

For k≥0, ν_a(x^(k+1))=ρ_a(x^k) in ℤ_p.

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Evaluate numerator-weight on x^k. The exact weight-evaluation theorem gives (Wν_a)(x^k)=ν_a(x·x^k). Rewrite pointwise x·x^k=x^(k+1).

Acceptance:

- At k=0 it says ν_a(x)=ρ_a(1); it supplies no formula for the total mass ν_a(1).

Prerequisites: `DirichletPadicLFunctions:L1/numerator-weight`, `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`.

Source: RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. The exponent shift immediately after equation (4-3).

### Bernoulli moments of the arithmetic numerator

`DirichletPadicLFunctions:L1/numerator-moment` — theorem.

For every integer k≥1, the image of ν_a(x^k) in ℚ_p equals (1−p^(k−1))(1−a^k)B_k/k.

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Write k=(k−1)+1 using k≥1. Apply numerator-moment-shift and unit-smoothed-moment at degree k−1.
- Normalize natural exponents and the rational denominator. At k=1 the factor 1−p^0 is zero. Do not cancel it or invoke the false assertion ζ(0)=0; E4 already records the source’s endpoint error.

Acceptance:

- At k=1 the moment is zero for every p,a. At p=3,a=2,k=2 it is 1/2; at p=2,a=3,k=2 it is 2/3. The theorem makes no claim at k=0.

Prerequisites: `DirichletPadicLFunctions:L1/numerator-moment-shift`, `DirichletPadicLFunctions:L1/unit-smoothed-moment`.

Source: RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. Rational Bernoulli form of the source’s numerator interpolation identity; it is not yet a theorem about the pseudomeasure ζ_p.

### Integrality of numerator Bernoulli moments

`DirichletPadicLFunctions:L1/numerator-integral` — theorem.

For k≥1, the rational value (1−p^(k−1))(1−a^k)B_k/k has integral image in ℚ_p.

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Take z=ν_a(x^k) in ℤ_p and use numerator-moment. No division by the smoothing factor or Euler factor is licensed.

Acceptance:

- The k=1 witness is zero. Dyadic p=2,a=3,k=2 gives 2/3, and is integral without an odd-prime hypothesis.

Prerequisites: `DirichletPadicLFunctions:L1/numerator-moment`.

Source: RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. Integrality from the concrete arithmetic numerator; later congruences and pseudomeasure division remain separate.

### Amice transform of the arithmetic numerator

`DirichletPadicLFunctions:L1/numerator-amice` — comparison.

Aν_a=inverseMahler(F_a) in ℤ_p[[T]], using the exact integral inverseMahler supplied by L2.

Hypotheses:

- p is prime; a is a natural number with p∤a. Write Z=ℤ_p, D=D(Z,Z), μ_a=smoothedMeasure p a. All measures remain on the existing ambient continuous dual; E, φ, ψ, J and A are the exact imported unitRestriction, phiMeasure, psiMeasure, inverseWeight and Amice maps.
- All natural smoothing parameters prime to p are positive. The case a=1 is the zero boundary test; a>1 is needed for the later nondegenerate pseudomeasure construction.

Proof plan:

- Apply inverse-mahler-intertwining to μ_a: A(Jμ_a)=inverseMahler(Aμ_a). Substitute measure-amice and unfold smoothed-numerator.
- This comparison is independent of the missing root-average bridge. It connects the arithmetic numerator to the existing generic primitive operator, rather than rebuilding that operator in Dirichlet or Coleman.

Acceptance:

- At a=1 both sides vanish. The comparison uses integral series and the existing inverseMahler, not a field-valued Amice inverse.

Prerequisites: `DirichletPadicLFunctions:L1/smoothed-numerator`, `DirichletPadicLFunctions:L1/measure-amice`, `PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-intertwining`.

Source: RJW-published, Equation (4-3), its following moment identity and Definition 4.10, printed p.138 / PDF39; arXiv v2 pp.27–28. Amice expression of the source’s inverse-weighted numerator, with generic construction imported.

### Multiplication of smoothing parameters

`DirichletPadicLFunctions:L1/measure-smoothing-cocycle` — lemma.

For natural a,b with p∤a and p∤b, μ_(ab)=μ_a+a·σ_a(μ_b) as actual elements of D(Z,Z). The scalar a multiplies the raw pushforward; it is essential.

Hypotheses:

- p is any prime, including 2; Z=ℤ_p, D=D(Z,Z) is the existing integral abstract-measure carrier. μ_a is the existing arithmetic smoothedMeasure for a∈ℕ with p∤a. Natural a=1 is included as the existing degenerate zero case.
- Write d_c:C(Z,Z) for z↦cz and σ_c=AbstractMeasure.map d_c for the existing raw pushforward. Write ε:C(Z,Z) for z↦−z. This notation introduces no new action, carrier or formal-substitution comparison.

Proof plan:

- Primality implies p∤ab, so all three already defined arithmetic measures exist. Any proof certificate gives the same measure.
- Evaluate the difference against x^k for every k≥0. The existing pushforward evaluation gives (σ_a μ_b)(x^k)=a^k μ_b(x^k); pull the constant through the linear functional.
- Embed the evaluated values in ℚ_p and use measure-ordinary-moment. With B=B_(k+1)/(k+1), the rational identity (1−(ab)^(k+1))B=(1−a^(k+1))B+a^(k+1)(1−b^(k+1))B cancels every moment. Ring-map laws and PadicInt.ext return the equality to Z.
- For the difference λ of the two displayed sides, apply the existing AbstractMeasure.ext_mahler. Pointwise, n!·mahler_n is the descending Pochhammer polynomial by mahler_apply and Ring.descPochhammer_eq_factorial_smul_choose. Expand it as the finite sum of integral coefficients times x^k using Polynomial.smeval_eq_sum and Polynomial.sum. Linearity and the just-computed zero ordinary moments give n!·λ(mahler_n)=0. Cancel the nonzero integer n! in the domain Z, then apply ext_mahler. This is a direct finite polynomial expansion inside the arithmetic proof, not a newly asserted generic moment theorem or division by n! in Z.

Acceptance:

- At p=3,a=b=2, μ₄=μ₂+2σ₂μ₂. The total masses are 3/2=1/2+2·1/2, detecting omission of a.
- At p=2,a=3,b=5, μ₁₅=μ₃+3σ₃μ₅; all coefficients remain integral. No odd-prime hypothesis or inverse of 2 is used.

Prerequisites: `DirichletPadicLFunctions:L1/measure-ordinary-moment`, `mathlib:AbstractMeasure.map`, `mathlib:AbstractMeasure.map_apply`, `mathlib:AbstractMeasure.ext_mahler`, `mathlib:mahler_apply`, `mathlib:Ring.descPochhammer_eq_factorial_smul_choose`, `mathlib:Polynomial.smeval_eq_sum`, `mathlib:Polynomial.sum`, `mathlib:Polynomial.smul_pow`, `mathlib:PadicInt.ext`.

Source: RJW-published, Proposition 4.6, printed p.137 / PDF38; equation (4-3), Definition 4.10 and Proposition 4.11, printed pp.138–139 / PDF39–40. Moment-determination method: Lemma 3.36(i), printed p.130 / PDF31. §4 collated with arXiv v2 PDF27–28. These arithmetic cocycle/reflection identities are explicit consequences of the source’s smoothed moments and inverse weighting, decomposed here as the compatibility input for its claimed independence. The source does not state these exact formulas as separate lemmas. The proof works in the pinned ambient integral carrier and retains the actual completed-group-algebra and regularity comparisons as gaps. All-prime validity, including the integral dyadic reflection identity without averaging by 1/2, is checked by this argument.

### Cross-smoothing before inverse weighting

`DirichletPadicLFunctions:L1/measure-cross-smoothing` — lemma.

For natural a,b prime to p, b·σ_b(μ_a)−μ_a=a·σ_a(μ_b)−μ_b in D(Z,Z).

Hypotheses:

- p is any prime, including 2; Z=ℤ_p, D=D(Z,Z) is the existing integral abstract-measure carrier. μ_a is the existing arithmetic smoothedMeasure for a∈ℕ with p∤a. Natural a=1 is included as the existing degenerate zero case.
- Write d_c:C(Z,Z) for z↦cz and σ_c=AbstractMeasure.map d_c for the existing raw pushforward. Write ε:C(Z,Z) for z↦−z. This notation introduces no new action, carrier or formal-substitution comparison.

Proof plan:

- Apply measure-smoothing-cocycle to (a,b) and to (b,a). Natural multiplication commutes, and proof irrelevance identifies the same μ_(ab).
- Equate the right sides and rearrange in the additive group. The factors a and b belong to the unweighted arithmetic measures and must remain.

Acceptance:

- The equality holds for a=1 or b=1 using the already constructed zero measure; it does not license division by [1]−[1].

Prerequisites: `DirichletPadicLFunctions:L1/measure-smoothing-cocycle`.

Source: RJW-published, Proposition 4.6, printed p.137 / PDF38; equation (4-3), Definition 4.10 and Proposition 4.11, printed pp.138–139 / PDF39–40. Moment-determination method: Lemma 3.36(i), printed p.130 / PDF31. §4 collated with arXiv v2 PDF27–28. These arithmetic cocycle/reflection identities are explicit consequences of the source’s smoothed moments and inverse weighting, decomposed here as the compatibility input for its claimed independence. The source does not state these exact formulas as separate lemmas. The proof works in the pinned ambient integral carrier and retains the actual completed-group-algebra and regularity comparisons as gaps. All-prime validity, including the integral dyadic reflection identity without averaging by 1/2, is checked by this argument.

### Reflection with the zero-atom correction

`DirichletPadicLFunctions:L1/measure-reflection` — lemma.

For every natural a prime to p, μ_a+AbstractMeasure.map ε μ_a=(a−1)·δ₀ in D(Z,Z), with ε(z)=−z and δ₀ the existing Dirac measure at zero.

Hypotheses:

- p is any prime, including 2; Z=ℤ_p, D=D(Z,Z) is the existing integral abstract-measure carrier. μ_a is the existing arithmetic smoothedMeasure for a∈ℕ with p∤a. Natural a=1 is included as the existing degenerate zero case.
- Write d_c:C(Z,Z) for z↦cz and σ_c=AbstractMeasure.map d_c for the existing raw pushforward. Write ε:C(Z,Z) for z↦−z. This notation introduces no new action, carrier or formal-substitution comparison.

Proof plan:

- For λ equal to the left side minus the right, pushforward and Dirac evaluation give its kth moment as (1+(−1)^k)μ_a(x^k)−(a−1)0^k.
- At k=0, 0^0=1 and the existing bernoulli_one gives 2μ_a(1)=a−1 after embedding the evaluated scalar in ℚ_p; return via PadicInt.ext. No inverse of 2 in Z is used.
- For odd positive k, 1+(−1)^k=0. For even k>0, k+1 is odd and exceeds 1, so bernoulli_eq_zero_of_odd makes the moment vanish. The Dirac term vanishes whenever k>0.
- For the difference λ of the two displayed sides, apply the existing AbstractMeasure.ext_mahler. Pointwise, n!·mahler_n is the descending Pochhammer polynomial by mahler_apply and Ring.descPochhammer_eq_factorial_smul_choose. Expand it as the finite sum of integral coefficients times x^k using Polynomial.smeval_eq_sum and Polynomial.sum. Linearity and the just-computed zero ordinary moments give n!·λ(mahler_n)=0. Cancel the nonzero integer n! in the domain Z, then apply ext_mahler. This is a direct finite polynomial expansion inside the arithmetic proof, not a newly asserted generic moment theorem or division by n! in Z.

Acceptance:

- At p=3,a=2, the correction is exactly δ₀, not zero. At p=2,a=3 it is 2δ₀, which is nonzero in ℤ₂. Reflection alone therefore does not make μ_a odd on the ambient space.

Prerequisites: `DirichletPadicLFunctions:L1/measure-ordinary-moment`, `mathlib:AbstractMeasure.map`, `mathlib:AbstractMeasure.map_apply`, `mathlib:AbstractMeasure.ext_mahler`, `mathlib:mahler_apply`, `mathlib:Ring.descPochhammer_eq_factorial_smul_choose`, `mathlib:Polynomial.smeval_eq_sum`, `mathlib:Polynomial.sum`, `mathlib:Polynomial.smul_pow`, `mathlib:PadicInt.ext`, `mathlib:AbstractMeasure.dirac`, `mathlib:AbstractMeasure.dirac_apply`, `mathlib:bernoulli_one`, `mathlib:bernoulli_eq_zero_of_odd`.

Source: RJW-published, Proposition 4.6, printed p.137 / PDF38; equation (4-3), Definition 4.10 and Proposition 4.11, printed pp.138–139 / PDF39–40. Moment-determination method: Lemma 3.36(i), printed p.130 / PDF31. §4 collated with arXiv v2 PDF27–28. These arithmetic cocycle/reflection identities are explicit consequences of the source’s smoothed moments and inverse weighting, decomposed here as the compatibility input for its claimed independence. The source does not state these exact formulas as separate lemmas. The proof works in the pinned ambient integral carrier and retains the actual completed-group-algebra and regularity comparisons as gaps. All-prime validity, including the integral dyadic reflection identity without averaging by 1/2, is checked by this argument.

### Smoothing cocycle for the unit numerator

`DirichletPadicLFunctions:L1/numerator-smoothing-cocycle` — lemma.

For natural a,b prime to p, ν_(ab)=ν_a+σ_a(ν_b), where ν_c=Jμ_c. There is no extra scalar a after inverse weighting.

Hypotheses:

- p is any prime, including 2; Z=ℤ_p, D=D(Z,Z) is the existing integral abstract-measure carrier. μ_a is the existing arithmetic smoothedMeasure for a∈ℕ with p∤a. Natural a=1 is included as the existing degenerate zero case.
- Write d_c:C(Z,Z) for z↦cz and σ_c=AbstractMeasure.map d_c for the existing raw pushforward. Write ε:C(Z,Z) for z↦−z. This notation introduces no new action, carrier or formal-substitution comparison.
- J is the exact supplier inverseWeight p; ν_a is the existing DirichletPadic.smoothedNumerator, defined by ν_a=Jμ_a. The supplier inverse-weight-support gives ν_a=J(unitRestriction μ_a) and its unit support. No intrinsic unit-group measure, completed Iwasawa algebra, denominator regularity or localization is inferred.

Proof plan:

- Apply the supplier linear map J to measure-smoothing-cocycle. Linearity gives Jμ_a+a·J(σ_a μ_b).
- The existing prime/coprimality and norm/unit criteria make a a unit of Z. Apply the exact inverse-weight-dilation supplier to this unit: J(σ_a μ_b)=a⁻¹·σ_a(Jμ_b). The forward pushforward direction is unchanged.
- Cancel a·a⁻¹=1 in Z to obtain the formula. The inverse-weight-support supplier identifies each Jμ_c with the inverse-weighted restriction used by the arithmetic numerator. No ψ-invariance or root-averaging theorem is needed for this compatibility identity.

Acceptance:

- At p=3,a=b=2 the formula is ν₄=ν₂+σ₂ν₂. The scalar 2 from the unweighted formula is cancelled by the supplier’s inverse scalar 1/2.

Prerequisites: `DirichletPadicLFunctions:L1/measure-smoothing-cocycle`, `DirichletPadicLFunctions:L1/smoothed-numerator`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-dilation`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-support`, `mathlib:Nat.Prime.coprime_iff_not_dvd`, `mathlib:PadicInt.norm_natCast_eq_one_iff`, `mathlib:PadicInt.isUnit_iff`.

Source: RJW-published, Proposition 4.6, printed p.137 / PDF38; equation (4-3), Definition 4.10 and Proposition 4.11, printed pp.138–139 / PDF39–40. Moment-determination method: Lemma 3.36(i), printed p.130 / PDF31. §4 collated with arXiv v2 PDF27–28. These arithmetic cocycle/reflection identities are explicit consequences of the source’s smoothed moments and inverse weighting, decomposed here as the compatibility input for its claimed independence. The source does not state these exact formulas as separate lemmas. The proof works in the pinned ambient integral carrier and retains the actual completed-group-algebra and regularity comparisons as gaps. All-prime validity, including the integral dyadic reflection identity without averaging by 1/2, is checked by this argument.

### Cross-smoothing for the unit numerator

`DirichletPadicLFunctions:L1/numerator-cross-smoothing` — lemma.

For natural a,b prime to p, σ_b(ν_a)−ν_a=σ_a(ν_b)−ν_b in D(Z,Z). This is the explicit numerator compatibility for the eventual denominators [a]−[1], expressed solely by existing pushforwards.

Hypotheses:

- p is any prime, including 2; Z=ℤ_p, D=D(Z,Z) is the existing integral abstract-measure carrier. μ_a is the existing arithmetic smoothedMeasure for a∈ℕ with p∤a. Natural a=1 is included as the existing degenerate zero case.
- Write d_c:C(Z,Z) for z↦cz and σ_c=AbstractMeasure.map d_c for the existing raw pushforward. Write ε:C(Z,Z) for z↦−z. This notation introduces no new action, carrier or formal-substitution comparison.
- J is the exact supplier inverseWeight p; ν_a is the existing DirichletPadic.smoothedNumerator, defined by ν_a=Jμ_a. The supplier inverse-weight-support gives ν_a=J(unitRestriction μ_a) and its unit support. No intrinsic unit-group measure, completed Iwasawa algebra, denominator regularity or localization is inferred.

Proof plan:

- Apply numerator-smoothing-cocycle in both orders. Both left sides are ν_(ab) by commutativity and proof irrelevance.
- Rearrange the equality ν_a+σ_aν_b=ν_b+σ_bν_a.
- Keep this equality in the actual ambient integral carrier. To use it as equality of fractions, the intrinsic unit-support comparison, multiplicative Dirac/convolution interpretation, actual completed-group-ring comparison and denominator regularity remain required. This node neither assumes nor concludes those missing comparisons.

Acceptance:

- Evaluation at x^k gives (b^k−1)ν_a(x^k)=(a^k−1)ν_b(x^k). At a=2,b=4,k=2 the coefficients are 15 and 3; using k+1 would give the wrong normalization.

Prerequisites: `DirichletPadicLFunctions:L1/numerator-smoothing-cocycle`.

Source: RJW-published, Proposition 4.6, printed p.137 / PDF38; equation (4-3), Definition 4.10 and Proposition 4.11, printed pp.138–139 / PDF39–40. Moment-determination method: Lemma 3.36(i), printed p.130 / PDF31. §4 collated with arXiv v2 PDF27–28. These arithmetic cocycle/reflection identities are explicit consequences of the source’s smoothed moments and inverse weighting, decomposed here as the compatibility input for its claimed independence. The source does not state these exact formulas as separate lemmas. The proof works in the pinned ambient integral carrier and retains the actual completed-group-algebra and regularity comparisons as gaps. All-prime validity, including the integral dyadic reflection identity without averaging by 1/2, is checked by this argument.

### Evenness of the unit numerator

`DirichletPadicLFunctions:L1/numerator-even` — lemma.

For every natural a prime to p, AbstractMeasure.map ε ν_a=ν_a, with ε(z)=−z and ν_a=Jμ_a. The equality holds integrally also at p=2.

Hypotheses:

- p is any prime, including 2; Z=ℤ_p, D=D(Z,Z) is the existing integral abstract-measure carrier. μ_a is the existing arithmetic smoothedMeasure for a∈ℕ with p∤a. Natural a=1 is included as the existing degenerate zero case.
- Write d_c:C(Z,Z) for z↦cz and σ_c=AbstractMeasure.map d_c for the existing raw pushforward. Write ε:C(Z,Z) for z↦−z. This notation introduces no new action, carrier or formal-substitution comparison.
- J is the exact supplier inverseWeight p; ν_a is the existing DirichletPadic.smoothedNumerator, defined by ν_a=Jμ_a. The supplier inverse-weight-support gives ν_a=J(unitRestriction μ_a) and its unit support. No intrinsic unit-group measure, completed Iwasawa algebra, denominator regularity or localization is inferred.

Proof plan:

- Apply the linear J to measure-reflection. Use inverse-weight-dilation at the actual unit −1 to identify J(map ε μ_a)=−map ε(Jμ_a).
- The zero-atom term is killed directly: for any f, inverse-weight-evaluation and baseline Dirac evaluation give (Jδ₀)(f)=PadicInt.inv(0)f(0)=0. Use padic-unit-inverse-identification and the baseline Ring.inverse_zero for that last equality; extensionality gives Jδ₀=0 without consuming an unpromoted supplier API item.
- Thus ν_a−map ε ν_a=0, giving the claimed equality. No division by 2, projection (1+ε)/2 or splitting of the dyadic unit group is used. The resulting even numerator is an arithmetic parity input, not already descent in the completed Iwasawa algebra.

Acceptance:

- At p=2,a=3 the unweighted reflection retains 2δ₀, but inverse weighting kills precisely that correction and gives an even numerator. Integral C₂-idempotents or dyadic pseudomeasure normalization are not asserted.

Prerequisites: `DirichletPadicLFunctions:L1/measure-reflection`, `DirichletPadicLFunctions:L1/smoothed-numerator`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-dilation`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-support`, `PadicMeasuresIwasawaAlgebras:L2/padic-unit-inverse-identification`, `mathlib:AbstractMeasure.dirac_apply`, `mathlib:Ring.inverse_zero`.

Source: RJW-published, Proposition 4.6, printed p.137 / PDF38; equation (4-3), Definition 4.10 and Proposition 4.11, printed pp.138–139 / PDF39–40. Moment-determination method: Lemma 3.36(i), printed p.130 / PDF31. §4 collated with arXiv v2 PDF27–28. These arithmetic cocycle/reflection identities are explicit consequences of the source’s smoothed moments and inverse weighting, decomposed here as the compatibility input for its claimed independence. The source does not state these exact formulas as separate lemmas. The proof works in the pinned ambient integral carrier and retains the actual completed-group-algebra and regularity comparisons as gaps. All-prime validity, including the integral dyadic reflection identity without averaging by 1/2, is checked by this argument.

### Positive Eisenstein coefficient measures

`DirichletPadicLFunctions:L4/positive-eisenstein-measure` — construction.

Define A_n=Σ_{d∣n,p∤d}δ_u(d) in the existing D(U,ℤ_p), where u(d) is the unique unit whose underlying p-adic integer is d. This is an integral measure for every p and every n>0. The construction specifies only the positive coefficients; A₀ is the source’s distinct pseudomeasure xζ_p/2.

Hypotheses:

- p is any prime, including 2; n is a positive natural number, represented by ℕ+ in the suggested file.
- Write U=ℤ_p× with its native unit-group topology and D(U,ℤ_p)=AbstractMeasure U ℤ_p ℤ_p. All powers have natural exponent. No coefficient at n=0 is defined here.

Proof plan:

- Enumerate positive divisors using Nat.divisors; positivity of n excludes its zero-index convention.
- For p∤d, use Nat.Prime.coprime_iff_not_dvd, PadicInt.norm_natCast_eq_one_iff and PadicInt.isUnit_iff. The existing IsUnit.unit supplies u(d); IsUnit.unit_spec identifies its value with d. Proof irrelevance and unit extensionality make this independent of the certificate.
- Take the finite sum of existing AbstractMeasure.dirac in the native additive group of integral measures. No inverse of p, inverse of 2, localization or Amice comparison is used.
- The n=1 and prime-power APIs follow by enumerating the divisors; for p^r every divisor except 1 is divisible by p. Evaluation at the constant test function counts the summands. The evaluation, moment, p-removal and congruence APIs used by other declarations have their own nodes below.

Acceptance:

- All seven tests use the actual unit-group measure carrier. A_p=δ_1 and the exponent-zero test exclude deleting the entire q^p coefficient or summing only prime divisors.

Prerequisites: `mathlib:AbstractMeasure`, `mathlib:AbstractMeasure.dirac`, `mathlib:AbstractMeasure.dirac_apply`, `mathlib:Nat.mem_divisors`, `mathlib:Nat.mem_divisors_prime_pow`, `mathlib:Nat.Prime.coprime_iff_not_dvd`, `mathlib:PadicInt.norm_natCast_eq_one_iff`, `mathlib:PadicInt.isUnit_iff`, `mathlib:IsUnit.unit`, `mathlib:IsUnit.unit_spec`.

Uses:

- RJW Theorem 8.2(b), positive coefficients: Evaluate A_n at x^(k−1) for even k≥4; this produces the p-depleted divisor sum in Definition 8.1.
- RJW Remark 8.3(1–2); DirichletPadicLFunctions:L4: Positive coefficient congruences quantify weight variation, with the tame component and precision modulus made explicit.
- PadicFamilies via the RS-14 boundary: Supplies the arithmetic positive coefficient data for the geometric owner’s family comparison; no geometric family or completed algebra is rebuilt here.

API:

- `DirichletPadic.positiveEisensteinMeasure_eq_sum` (constructor): For n>0, A_n is the finite sum over d∣n of δ_u(d) if p∤d and zero otherwise; u(d) is the existing IsUnit.unit of the natural cast, proved a unit by the pinned norm and coprimality criteria.
- `DirichletPadic.positiveEisensteinMeasure_apply` (data): For every continuous f:ℤ_p×→ℤ_p, A_n(f)=Σ_{d∣n,p∤d}f(u(d)). Promoted to positive-eisenstein-evaluation.
- `DirichletPadic.positiveEisensteinMeasure_moment` (compatibility): For e≥0, A_n(x^e)=Σ_{d∣n,p∤d}d^e in ℤ_p. Promoted to positive-eisenstein-moment.
- `DirichletPadic.positiveEisensteinMeasure_one` (simp): A_1=δ_1.
- `DirichletPadic.positiveEisensteinMeasure_prime_pow` (simp): For every r≥0, A_{p^r}=δ_1, including r=0.
- `DirichletPadic.positiveEisensteinMeasure_mul_p` (relation): A_{pn}=A_n for every positive n. Promoted to positive-eisenstein-remove-p.
- `DirichletPadic.positiveEisensteinMeasure_mass` (data): A_n(1) is the number of positive divisors of n prime to p, cast to ℤ_p.
- `DirichletPadic.positiveEisensteinMeasure_euler_moment` (compatibility): A_n(x^e)=σ_e(n)−p^e σ_e(n/p) when p∣n, and σ_e(n) otherwise, with both natural divisor sums cast to ℤ_p. Promoted to positive-eisenstein-euler-moment.
- `DirichletPadic.positiveEisensteinMeasure_moment_congr` (relation): For r≥1 and e≡e′ modulo p^(r−1)(p−1), the difference A_n(x^e′)−A_n(x^e) is divisible by p^r in ℤ_p. Promoted to positive-eisenstein-weight-congruence.

Tests:

- `SuggestedEisensteinTests.first_coefficient` (computation): At p=3, A_1=δ_1.
- `SuggestedEisensteinTests.prime_coefficient_survives` (non-example): At p=3, A_3=δ_1; the coefficient of q^p survives stabilization.
- `SuggestedEisensteinTests.dyadic_divisor_sum` (computation): At p=2, A_6=δ_1+δ_3 on ℤ₂×; the natural cast of 3 is viewed as a unit.
- `SuggestedEisensteinTests.mass_counts_divisors` (degenerate): At p=2, the exponent-zero moment of A_6 is 2, its number of odd divisors.
- `SuggestedEisensteinTests.weight_four_dyadic` (compatibility): At p=2 and n=6, the weight-four exponent is 3 and A_6(x³)=1+27=28.
- `SuggestedEisensteinTests.dyadic_precision` (compatibility): At p=2, n=3, r=3 and exponents 1,5, the moment difference is 244−4=240, divisible by 8.
- `SuggestedEisensteinTests.tame_component_not_enough_for_precision` (non-example): At p=5, n=2, exponents 3,7 agree modulo p−1, but their moments differ by 129−9=120, which is not divisible by 25 in ℤ₅.

Source: RJW-published, §8, Definition 8.1 and proof of Theorem 8.2, printed pp.159–160 / PDF60–61; collated with arXiv v2 p.44. The positive coefficients are finite sums of unit Dirac measures. We instantiate the native continuous integral measure carrier. Its comparison with the completed group algebra and the constant coefficient are separate open comparisons.

### Evaluation of positive Eisenstein coefficients

`DirichletPadicLFunctions:L4/positive-eisenstein-evaluation` — lemma.

For every continuous f:U→ℤ_p, A_n(f)=Σ_{d∣n,p∤d}f(u(d)).

Hypotheses:

- p is any prime, including 2; n is a positive natural number, represented by ℕ+ in the suggested file.
- Write U=ℤ_p× with its native unit-group topology and D(U,ℤ_p)=AbstractMeasure U ℤ_p ℤ_p. All powers have natural exponent. No coefficient at n=0 is defined here.

Proof plan:

- Unfold the finite arithmetic sum in positive-eisenstein-measure.
- Evaluation is additive in AbstractMeasure, so distribute it over the finite sum. Apply the pinned dirac_apply to each retained divisor; omitted divisors contribute zero.

Acceptance:

- At p=2,n=6 and f=1 the value is 2; for f(u)=u³ the value is 28.

Prerequisites: `DirichletPadicLFunctions:L4/positive-eisenstein-measure`, `mathlib:AbstractMeasure.dirac_apply`.

Source: RJW-published, §8, Definition 8.1 and proof of Theorem 8.2, printed pp.159–160 / PDF60–61; collated with arXiv v2 p.44. The positive coefficients are finite sums of unit Dirac measures. We instantiate the native continuous integral measure carrier. Its comparison with the completed group algebra and the constant coefficient are separate open comparisons.

### Positive Eisenstein moment formula

`DirichletPadicLFunctions:L4/positive-eisenstein-moment` — theorem.

For every e≥0, A_n(x^e)=Σ_{d∣n,p∤d}d^e in ℤ_p. In particular, even weight k≥4 uses e=k−1 and gives the positive divisor coefficient σ^p_{k−1}(n) printed in Definition 8.1.

Hypotheses:

- p is any prime, including 2; n is a positive natural number, represented by ℕ+ in the suggested file.
- Write U=ℤ_p× with its native unit-group topology and D(U,ℤ_p)=AbstractMeasure U ℤ_p ℤ_p. All powers have natural exponent. No coefficient at n=0 is defined here.

Proof plan:

- The unit value map is continuous; its e-th power is a continuous ℤ_p-valued test function.
- Apply positive-eisenstein-evaluation and use IsUnit.unit_spec to identify each evaluation with d^e. Natural cast and power commute.
- Substitute e=k−1 to identify the arithmetic coefficient in the source. This is the finite coefficient identity; the new positive-eisenstein-modular-comparison node identifies the native modular-form coefficient, while the completed-algebra image remains recorded in the L4 gap.

Acceptance:

- p=2,n=6,e=3 gives 28; p=3,n=6,e=3 gives 9. e=0 gives the number of divisors prime to p.

Prerequisites: `DirichletPadicLFunctions:L4/positive-eisenstein-evaluation`, `mathlib:IsUnit.unit_spec`.

Source: RJW-published, §8, Definition 8.1 and proof of Theorem 8.2, printed pp.159–160 / PDF60–61; collated with arXiv v2 p.44. The positive coefficients are finite sums of unit Dirac measures. We instantiate the native continuous integral measure carrier. Its comparison with the completed group algebra and the constant coefficient are separate open comparisons.

### Invariance under multiplying the coefficient index by p

`DirichletPadicLFunctions:L4/positive-eisenstein-remove-p` — lemma.

For n>0, A_{pn}=A_n as integral measures on U. Thus A_{p^r n}=A_n for every r≥0.

Hypotheses:

- p is any prime, including 2; n is a positive natural number, represented by ℕ+ in the suggested file.
- Write U=ℤ_p× with its native unit-group topology and D(U,ℤ_p)=AbstractMeasure U ℤ_p ℤ_p. All powers have natural exponent. No coefficient at n=0 is defined here.

Proof plan:

- For d prime to p, primality gives gcd(d,p)=1. Nat.Coprime.dvd_mul_left identifies d∣pn with d∣n.
- Use Nat.mem_divisors and positivity of both indices to identify the two finite filtered divisor sets.
- The Dirac summand depends only on d, so the constructor sums coincide. Iteration gives the stated prime-power consequence.

Acceptance:

- At p=2 the measures A_3 and A_6 are both δ_1+δ_3; at n=1 all A_{p^r} equal δ_1.

Prerequisites: `DirichletPadicLFunctions:L4/positive-eisenstein-measure`, `mathlib:Nat.mem_divisors`, `mathlib:Nat.Coprime.dvd_mul_left`, `mathlib:Nat.Prime.coprime_iff_not_dvd`.

Source: RJW-published, §8, Definition 8.1 and proof of Theorem 8.2, printed pp.159–160 / PDF60–61; collated with arXiv v2 p.44. The positive coefficients are finite sums of unit Dirac measures. We instantiate the native continuous integral measure carrier. Its comparison with the completed group algebra and the constant coefficient are separate open comparisons.

### Euler-factor deletion for positive divisor sums

`DirichletPadicLFunctions:L4/divisor-sum-euler-deletion` — lemma.

For e≥0, Σ_{d∣n,p∤d}d^e=σ_e(n)−p^e σ_e(n/p) if p∣n, and σ_e(n) otherwise. This equality is in ℤ, with σ_e the existing natural-valued ArithmeticFunction.sigma and all terms cast before subtraction.

Hypotheses:

- p is any prime, including 2; n is a positive natural number, represented by ℕ+ in the suggested file.
- Write U=ℤ_p× with its native unit-group topology and D(U,ℤ_p)=AbstractMeasure U ℤ_p ℤ_p. All powers have natural exponent. No coefficient at n=0 is defined here.

Proof plan:

- Use ArithmeticFunction.sigma_apply to express the full sum over positive divisors.
- Split the divisor set into p-divisible and prime-to-p parts. If p∤n, the first part is empty.
- If p∣n, multiplication by p bijects divisors of n/p with p-divisible divisors of n: its inverse sends d to d/p. The equalities n=p(n/p) and d=p(d/p), with p>0, prove both divisibility directions and inverse identities by cancellation.
- Reindex the divisible part by this bijection and use (pd)^e=p^e d^e. Subtract its integer sum from the full sum. The same argument works at e=0.

Acceptance:

- At p=3,n=6,e=3: 252−27·9=9. At p=2,n=6,e=0: 4−2=2.

Prerequisites: `mathlib:ArithmeticFunction.sigma_apply`, `mathlib:Nat.mem_divisors`.

Source: RJW-published, §8, Definition 8.1 and proof of Theorem 8.2, printed pp.159–160 / PDF60–61; collated with arXiv v2 p.44. The elementary coefficient calculation following Definition 8.1 is separated into its precise finite-divisor identity. The source uses e=k−1 for even k≥4; the finite identity itself holds for all e≥0.

### Euler-deleted Eisenstein moments

`DirichletPadicLFunctions:L4/positive-eisenstein-euler-moment` — theorem.

For every e≥0, A_n(x^e)=σ_e(n)−p^eσ_e(n/p) if p∣n, and σ_e(n) otherwise, in ℤ_p. Taking e=k−1 recovers the nonconstant coefficient calculation for E_k−p^(k−1)E_k(pz); it does not yet identify an actual bundled modular form.

Hypotheses:

- p is any prime, including 2; n is a positive natural number, represented by ℕ+ in the suggested file.
- Write U=ℤ_p× with its native unit-group topology and D(U,ℤ_p)=AbstractMeasure U ℤ_p ℤ_p. All powers have natural exponent. No coefficient at n=0 is defined here.

Proof plan:

- Apply positive-eisenstein-moment.
- Map divisor-sum-euler-deletion along the existing integer cast ℤ→ℤ_p; finite sums, products, powers and subtraction commute with the map.
- For even k≥4 use e=k−1. The quotient index n/p occurs only in the p∣n branch.

Acceptance:

- At p=2,n=6,e=3: 252−8·28=28. At n=p all e≥0 give 1, not zero.

Prerequisites: `DirichletPadicLFunctions:L4/positive-eisenstein-moment`, `DirichletPadicLFunctions:L4/divisor-sum-euler-deletion`.

Source: RJW-published, §8, Definition 8.1 and proof of Theorem 8.2, printed pp.159–160 / PDF60–61; collated with arXiv v2 p.44. The positive coefficients are finite sums of unit Dirac measures. We instantiate the native continuous integral measure carrier. Its comparison with the completed group algebra and the constant coefficient are separate open comparisons.

### Weight congruences for positive Eisenstein coefficients

`DirichletPadicLFunctions:L4/positive-eisenstein-weight-congruence` — theorem.

For r≥1 and e,e′≥0 with e≡e′ modulo p^(r−1)(p−1), the element A_n(x^e′)−A_n(x^e) is divisible by p^r in ℤ_p. For weights k,k′≥4 even, apply this with e=k−1 and e′=k′−1. The assertion includes p=2; it is a sufficient precision modulus, with no claim of optimality.

Hypotheses:

- p is any prime, including 2; n is a positive natural number, represented by ℕ+ in the suggested file.
- Write U=ℤ_p× with its native unit-group topology and D(U,ℤ_p)=AbstractMeasure U ℤ_p ℤ_p. All powers have natural exponent. No coefficient at n=0 is defined here.
- r is a positive natural number; e,e′ are natural numbers satisfying the displayed congruence.

Proof plan:

- Use positive-eisenstein-moment for both exponents. Every retained divisor d is coprime to p and hence to p^r.
- Apply Nat.pow_totient_mod at modulus p^r, which is greater than 1. Nat.totient_prime_pow rewrites its totient as p^(r−1)(p−1). The exponent congruence identifies the remainders, so the two powers of each d are congruent modulo p^r.
- Use Nat.modEq_iff_dvd to express each power difference as an integer multiple of p^r. Cast this equality to ℤ_p and sum the finitely many witnesses.
- For odd p the factor p−1 records the tame component; p-adic closeness without that condition is insufficient. At p=2 the modulus here is 2^(r−1), and the argument does not assume ℤ₂× is procyclic.

Acceptance:

- At p=2,n=3,r=3,e=1,e′=5 the difference is 240 and is divisible by 8. At p=5,n=2,r=2, exponents 3,7 have the same tame component but difference 120 is not divisible by 25; the required modulus is 20.

Prerequisites: `DirichletPadicLFunctions:L4/positive-eisenstein-moment`, `mathlib:Nat.pow_totient_mod`, `mathlib:Nat.totient_prime_pow`, `mathlib:Nat.modEq_iff_dvd`, `mathlib:Nat.Prime.coprime_iff_not_dvd`.

Source: RJW-published, §8, Definition 8.1 and proof of Theorem 8.2, printed pp.159–160 / PDF60–61; collated with arXiv v2 p.44. A quantitative finite-coefficient consequence of Theorem 8.2 and the weight-variation discussion in Remark 8.3. The precision statement is derived using the pinned Fermat–Euler remainder API; it is not quoted as a separately numbered source theorem. It covers only positive coefficients.

## Remaining coverage and ownership

### DirichletPadicLFunctions:L0 — partial

- Source-decompose the actual Mellin continuation and differentiation/decay argument, then compare algebraic Bernoulli values through explicit complex and p-adic embeddings. The negative-zeta formula, including ζ(0)=−1/2, already exists; E2 and E5 record source normalization errors.
- Import generalized Bernoulli/finite Fourier data from the existing ModularForms Layer 0; compare Dedekind zeta with the meromorphic germ and residue supplied through AutomorphicLFunctionsAndLocalFactors:AL.1 and Mathlib’s real class-number limit; instantiate GlobalNumberFields Layers 9–10 idele/infinity-type conventions.

### DirichletPadicLFunctions:L1 — partial

- The actual integral numerator, unit support, unique primitive equation and inverseMahler comparison have exact supplier nodes. The ambient arithmetic cocycle, cross-smoothing identity and evenness of the numerator are now planned explicitly. Compare these identities through the intrinsic unit-support and multiplicative Dirac/convolution maps with the actual completed unit-group algebra, prove regularity of θ_a=[a]−[1], and instantiate L3 pseudomeasures with exact carrier/denominator comparisons.
- Prove independence of the smoothing parameter, full pseudomeasure interpolation for every k≥1 (including the zero Euler factor at k=1), parity descent in the actual completed algebra (the ambient numerator is now even) and denominator-qualified Kummer congruences. The present integral measure/numerator statements cover p=2, but do not construct a dyadic pseudomeasure splitting or choose a nonexistent single topological generator of ℤ₂×.
- Complete the source’s analytic Mellin/decay/differentiation route under L0. Complete measure coefficient-extension/descent maps through the shared measure API; an integral coefficient identity alone is not a scalar-extension theorem for measures. The supplier now has integral coefficient extension on ℤ_p; instantiate that exact interface for this arithmetic measure and prove the required comparisons. This does not supply an intrinsic-unit-group or completed-algebra comparison.

### DirichletPadicLFunctions:L2 — not_read

- Read and decompose the actual p-power twists, roots-of-unity/Gauss computation, integral primitive tame-character measure, and all scalar/conductor comparisons. Reuse the generic L2 operators and the primitive conductor when evaluating characters at p; treat the trivial branch separately.

### DirichletPadicLFunctions:L3 — not_read

- Read and decompose branch interpolation, the complex and p-adic cyclotomic logarithm formulas, the pure p-power conductor case, pole numerator/convergence/simple-zero division and residue coordinate change. Import ColemanIntegration:L0 logarithms and LocallyAnalyticDistributions:L3 coordinates; retain the integral ±1×(1+4ℤ₂) branch.

### DirichletPadicLFunctions:L4 — partial

- The explicit finite coordinates E_(n;r,s), their two independent transition maps and native integral/moment comparisons are now supplied. Instantiate positive-eisenstein-completed-coordinates once the requested PadicMeasuresIwasawaAlgebras:L1 actual integral-measure/completed-algebra map, Dirac projections and separating joint projections are supplied. The generic carrier, topology and convolution are owned there, with its existing ProfiniteProPGroups Layer9 anchor. Construct A₀=xζ_p/2 in the actual localized algebra using L1 arithmetic zeta and PadicMeasuresIwasawaAlgebras:L3, including the admissible evaluation domain and dyadic division by 2. No A₀ is supplied by the positive-index constructor.
- Assemble the full coefficientwise specialization at x^(k−1), prove the constant-term congruences with denominator qualifications, and decompose the tame-character extension. The present congruence concerns only positive rational-field Eisenstein coefficients. Geometric affinoid realization and Hida–Coleman control belong to PadicFamilies; fix the weight shift recorded in E9 before stating that comparison.

## Source findings

All findings await independent review unless the preserved record explicitly says otherwise. The source versions and bounded searches below distinguish the paper from its blueprint repair.

### DirichletPadicLFunctions/E1

misprint; affects the proof. Proposition 4.4, last displayed equation of the proof: printed p. 137 / PDF 38; arXiv v2 p. 27.

Printed: F_a(T) = (1/T) ∑_{n≥1} (−T)^n g(T)^n

Correction: Insert a minus before the sum. Equivalently F_a(T)=g(T)/(1+Tg(T)). The integral cancellation nodes use b_a/q_a, with q_a=a(1+Tg) and b_a=ag.

Reason: Since (1+Tg)⁻¹=1+∑_{n≥1}(−Tg)^n, subtracting it from 1 negates the tail. At a=2, g=1/2 and the correct F₂=1/(2+T) has constant +1/2, whereas the printed tail has constant −1/2. The integrality statement remains valid; the displayed equality has the wrong sign.

Known: new

Correction search:

- The version-of-record PDF at https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf, visually checked at published pp. 112, 136, 137 and 139, and arXiv:2309.15692v2 collated at pp. 9, 26–28.
- The arXiv version listing https://arxiv.org/abs/2309.15692, rechecked 26 September 2026: latest listed revision v2, 19 December 2024.
- The journal article page https://msp.org/ent/2025/4-1/p03.xhtml, and Crossref DOI 10.2140/ent.2025.4.101 metadata, checked in this worker session on 26 September 2026; no correction link or update-to/updated-by relation found. The journal XHTML was read through a direct HTTP fetch because the browser text tool rejected that content type.
- Authors’ publication pages https://sites.google.com/site/joaquinrj/home and https://chriswilliams1404.wixsite.com/website/publications-preprints, rechecked 26 September 2026; no correction linked for this paper.
- Targeted searches for the authors/title plus errata/correction and for Proposition 4.4 and Corollary 2.8, 26 September 2026; no correcting publication located. The campaign/accepted RS-14 already warns about ζ(0) and the k=1 Euler-factor endpoint; these are acknowledged prior roadmap observations, not claims of first discovery. This bounded search does not prove that no correction exists.

### DirichletPadicLFunctions/E2

misprint; affects nothing. Opening paragraph of §4.1: printed p. 136 / PDF 37; arXiv v2 p. 26.

Printed: ζ(−k) = (d^k f/dt^k)(0)

Correction: For f(t)=t/(e^t−1), with its analytic value at zero, replace the derivative term by (−1)^k f^(k+1)(0)/(k+1). The Bernoulli expression at the end of the source sentence is the correct one.

Reason: The source defines f^(m)(0)=B_m with B₁=−1/2. Thus f(0)=1, already contradicting the printed derivative term at k=0 because ζ(0)=−1/2. The corrected term equals (−1)^k B_{k+1}/(k+1). This does not change Lemma 4.2’s separate formula for f_a.

Known: new

Correction search:

- The version-of-record PDF at https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf, visually checked at published pp. 112, 136, 137 and 139, and arXiv:2309.15692v2 collated at pp. 9, 26–28.
- The arXiv version listing https://arxiv.org/abs/2309.15692, rechecked 26 September 2026: latest listed revision v2, 19 December 2024.
- The journal article page https://msp.org/ent/2025/4-1/p03.xhtml, and Crossref DOI 10.2140/ent.2025.4.101 metadata, checked in this worker session on 26 September 2026; no correction link or update-to/updated-by relation found. The journal XHTML was read through a direct HTTP fetch because the browser text tool rejected that content type.
- Authors’ publication pages https://sites.google.com/site/joaquinrj/home and https://chriswilliams1404.wixsite.com/website/publications-preprints, rechecked 26 September 2026; no correction linked for this paper.
- Targeted searches for the authors/title plus errata/correction and for Proposition 4.4 and Corollary 2.8, 26 September 2026; no correcting publication located. The campaign/accepted RS-14 already warns about ζ(0) and the k=1 Euler-factor endpoint; these are acknowledged prior roadmap observations, not claims of first discovery. This bounded search does not prove that no correction exists.

### DirichletPadicLFunctions/E3

error; affects the proof. Parameter choice and decay assertion in §4.1 immediately before Lemma 4.2: printed p. 136 / PDF 37; arXiv v2 p. 26. The related polynomial aside in §10.2, published p. 165 / PDF 66, was checked in the published version.

Printed: “an integer coprime to p”

Correction: Require a positive integer coprime to p for the asserted rapidly decreasing smoothed function and its Mellin integral. The nondegenerate arithmetic construction takes a>1, as the campaign already specifies.

Reason: The printed condition permits a=−1. For t>0, f_{−1}(t)=1/(e^t−1)+1/(e^{−t}−1)=−1, which does not tend to zero and is not rapidly decreasing. The hypothesis used to apply Theorem 2.4 therefore fails for an allowed parameter. Restricting a>0 repairs this step; a=1 gives the zero function and is used only as a boundary test here. The same positivity qualification is needed for the §10.2 assertion that ((1+T)^a−1)/T is a polynomial: for the allowed integer a=−1 it is −1/(1+T), a unit formal series with infinitely many nonzero coefficients. The Coleman comparison still uses the correct formal series.

Known: new

Correction search:

- The version-of-record PDF at https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf, visually checked at published pp. 112, 136, 137 and 139, and arXiv:2309.15692v2 collated at pp. 9, 26–28.
- The arXiv version listing https://arxiv.org/abs/2309.15692, rechecked 26 September 2026: latest listed revision v2, 19 December 2024.
- The journal article page https://msp.org/ent/2025/4-1/p03.xhtml, and Crossref DOI 10.2140/ent.2025.4.101 metadata, checked in this worker session on 26 September 2026; no correction link or update-to/updated-by relation found. The journal XHTML was read through a direct HTTP fetch because the browser text tool rejected that content type.
- Authors’ publication pages https://sites.google.com/site/joaquinrj/home and https://chriswilliams1404.wixsite.com/website/publications-preprints, rechecked 26 September 2026; no correction linked for this paper.
- Targeted searches for the authors/title plus errata/correction and for Proposition 4.4 and Corollary 2.8, 26 September 2026; no correcting publication located. The campaign/accepted RS-14 already warns about ζ(0) and the k=1 Euler-factor endpoint; these are acknowledged prior roadmap observations, not claims of first discovery. This bounded search does not prove that no correction exists.

### DirichletPadicLFunctions/E4

error; affects the proof. Proof of Proposition 4.11: printed p. 139 / PDF 40; arXiv v2 p. 28.

Printed: ζ(1−k)≠0 iff k is even

Correction: Treat k=1 separately using 1−p^(k−1)=0. For odd k>1, ζ(1−k)=0; for even k the sign (−1)^k is already one. The interpolation theorem remains valid for all k≥1.

Reason: At k=1 the source assertion would force ζ(0)=0, but ζ(0)=−1/2. Its multiplication by the zero Euler factor still gives the required equality. The endpoint is already flagged in the campaign specification and accepted RS-14; this item records the precise published locator.

Known: new

Correction search:

- The version-of-record PDF at https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf, visually checked at published pp. 112, 136, 137 and 139, and arXiv:2309.15692v2 collated at pp. 9, 26–28.
- The arXiv version listing https://arxiv.org/abs/2309.15692, rechecked 26 September 2026: latest listed revision v2, 19 December 2024.
- The journal article page https://msp.org/ent/2025/4-1/p03.xhtml, and Crossref DOI 10.2140/ent.2025.4.101 metadata, checked in this worker session on 26 September 2026; no correction link or update-to/updated-by relation found. The journal XHTML was read through a direct HTTP fetch because the browser text tool rejected that content type.
- Authors’ publication pages https://sites.google.com/site/joaquinrj/home and https://chriswilliams1404.wixsite.com/website/publications-preprints, rechecked 26 September 2026; no correction linked for this paper.
- Targeted searches for the authors/title plus errata/correction and for Proposition 4.4 and Corollary 2.8, 26 September 2026; no correcting publication located. The campaign/accepted RS-14 already warns about ζ(0) and the k=1 Euler-factor endpoint; these are acknowledged prior roadmap observations, not claims of first discovery. This bounded search does not prove that no correction exists.

### DirichletPadicLFunctions/E5

error; affects a stated result. Corollary 2.8: printed p. 112 / PDF 13; arXiv v2 p. 9. Compare the B₁ convention in Remark 2.5, published p. 111 / PDF 12.

Printed: ζ(−n)=−B_{n+1}/(n+1), n≥0

Correction: With the source convention B₁=−1/2, the formula valid for every n≥0 is ζ(−n)=(−1)^n B_{n+1}/(n+1). Alternatively retain the printed minus formula for n≥1 and state ζ(0)=−1/2 separately.

Reason: At n=0 the printed right-hand side is +1/2, whereas ζ(0)=−1/2. For n>0 the conventional minus formula holds because B_m=0 for odd m>1. The exact all-n corrected formula is already proved by the pinned Mathlib riemannZeta_neg_nat_eq_bernoulli and is reused, not planned here.

Known: new

Correction search:

- The version-of-record PDF at https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf, visually checked at published pp. 112, 136, 137 and 139, and arXiv:2309.15692v2 collated at pp. 9, 26–28.
- The arXiv version listing https://arxiv.org/abs/2309.15692, rechecked 26 September 2026: latest listed revision v2, 19 December 2024.
- The journal article page https://msp.org/ent/2025/4-1/p03.xhtml, and Crossref DOI 10.2140/ent.2025.4.101 metadata, checked in this worker session on 26 September 2026; no correction link or update-to/updated-by relation found. The journal XHTML was read through a direct HTTP fetch because the browser text tool rejected that content type.
- Authors’ publication pages https://sites.google.com/site/joaquinrj/home and https://chriswilliams1404.wixsite.com/website/publications-preprints, rechecked 26 September 2026; no correction linked for this paper.
- Targeted searches for the authors/title plus errata/correction and for Proposition 4.4 and Corollary 2.8, 26 September 2026; no correcting publication located. The campaign/accepted RS-14 already warns about ζ(0) and the k=1 Euler-factor endpoint; these are acknowledged prior roadmap observations, not claims of first discovery. This bounded search does not prove that no correction exists.

### DirichletPadicLFunctions/E6

gap; affects the proof. Proof of Lemma4.7, printed p.137 / PDF38; arXiv:2309.15692v2 p.27.

Printed: ψ(1/T)=1/T

Correction: Justify an extension of ψ and its comparison to the bounded operator before acting on 1/T, or clear the poles and apply the generic rational-series root-average comparison only to the integral smoothed F_a. The latter route is specified by the two L2 requests in this packet.

Reason: The bounded integral operator acts on ℤ_p[[T]], while 1/T is outside that carrier. Linearity and commutation with dilation cannot be applied to the two pole terms inside the existing domain, even though their smoothed difference is integral. The finite partial-fraction identity is algebraically correct; the missing step is its operator-domain comparison, not a counterexample to Lemma4.7.

Known: new

Correction search:

- The same gap was already recorded as ColemanPowerSeries/E8 in the current atlas source register; this consumer record acknowledges that prior unreviewed roadmap observation and makes no priority claim.
- Fresh collation of the full published §4 (PDF37–40) and v2 PDF26–28 on 27 September 2026; both retain the displayed pole calculation. The source digests are recorded in sourceVersions.
- arXiv version listing https://arxiv.org/abs/2309.15692 checked on27 September2026: latest revision v2,19 December2024; no later correcting version identified.
- Targeted title/authors plus errata/correction and arXiv number plus Lemma4.7 searches on27 September2026 found no correcting publication. The journal article URL https://msp.org/ent/2025/4-1/p03.xhtml returned unsupported/error content through the browser route in this continuation; this failure is not evidence of absence. Earlier author-page/Crossref searches are retained with E1–E5 as their own provenance. The marker new means no identified published correction, not claimed novelty.

### DirichletPadicLFunctions/E7

misprint; affects nothing. End of proof of Lemma7.5, published printed158 / PDF59; arXiv v2 p.43.

Printed: −log_p(a) − p⁻¹log_p(a) = −(1−p⁻¹)log_p(a).

Correction: The second sign must be plus: −log_p(a)+p⁻¹log_p(a).

Reason: The two preceding values are −log_p(a) and −p⁻¹log_p(a); subtracting the latter changes its sign. The final displayed value is the intended correct one.

Known: Already recorded in this atlas as ColemanIntegration/E22 (awaiting independent review); no published correction identified.

Correction search:

- 2026-09-27: compared published §8 printed158–161 / PDF59–62 with arXiv:2309.15692v2 pp.43–45; the relevant text persists in both. Files are recorded in sourceVersions.
- 2026-09-27: https://arxiv.org/abs/2309.15692 lists v1 (27 September 2023) and v2 (19 December 2024), with no newer version displayed.
- 2026-09-27: https://msp.org/ent/2025/4-1/p03.xhtml fetched and read; no erratum, corrigendum or correction link found. Joaquín Rodrigues Jacinto’s https://sites.google.com/site/joaquinrj/home lists the paper and journal link, without a separate correction.
- 2026-09-27: title/author searches with errata and Remark8.3 correction returned no identified correction. The atlas source-issues register was checked for this paper; the Lemma7.5 sign is already ColemanIntegration/E22. This bounded search is not a priority or novelty claim.

### DirichletPadicLFunctions/E8

misprint; affects nothing. Opening definition of G_k in §8, published printed158 / PDF59; arXiv v2 p.43.

Printed: Eisenstein series of level k

Correction: Eisenstein series of weight k and level one.

Reason: The full lattice sum is invariant with weight k under SL₂(ℤ). The next sentence calls it weight k, and the level changes to Γ₀(p) only at Definition8.1.

Known: new

Correction search:

- 2026-09-27: compared published §8 printed158–161 / PDF59–62 with arXiv:2309.15692v2 pp.43–45; the relevant text persists in both. Files are recorded in sourceVersions.
- 2026-09-27: https://arxiv.org/abs/2309.15692 lists v1 (27 September 2023) and v2 (19 December 2024), with no newer version displayed.
- 2026-09-27: https://msp.org/ent/2025/4-1/p03.xhtml fetched and read; no erratum, corrigendum or correction link found. Joaquín Rodrigues Jacinto’s https://sites.google.com/site/joaquinrj/home lists the paper and journal link, without a separate correction.
- 2026-09-27: title/author searches with errata and Remark8.3 correction returned no identified correction. The atlas source-issues register was checked for this paper; the Lemma7.5 sign is already ColemanIntegration/E22. This bounded search is not a priority or novelty claim.

### DirichletPadicLFunctions/E9

misprint; affects a stated result. Remark8.3(2), published printed160–161 / PDF61–62; arXiv v2 pp.44–45.

Printed: κ_k : x ↦ x^k; for all k ≥ 4, E(q)(κ_k)=E_k^(p)(z).

Correction: For the Mellin transforms of the coefficients A_n of Theorem8.2, specialize at κ_{k−1}, for even k≥4. An alternative convention must explicitly replace every coefficient by its inverse-weight twist before specializing at κ_k.

Reason: Theorem8.2 evaluates A_n at x^(k−1). For p=3,n=2,k=4, the displayed κ_4 evaluates A_2=δ_1+δ_2 to 17, whereas the weight-four coefficient is 1+2³=9. The even-weight restriction of the construction is also missing in this remark. The corrected convention agrees with Definition8.1 and Theorem8.2; no change to those statements is needed.

Known: new

Correction search:

- 2026-09-27: compared published §8 printed158–161 / PDF59–62 with arXiv:2309.15692v2 pp.43–45; the relevant text persists in both. Files are recorded in sourceVersions.
- 2026-09-27: https://arxiv.org/abs/2309.15692 lists v1 (27 September 2023) and v2 (19 December 2024), with no newer version displayed.
- 2026-09-27: https://msp.org/ent/2025/4-1/p03.xhtml fetched and read; no erratum, corrigendum or correction link found. Joaquín Rodrigues Jacinto’s https://sites.google.com/site/joaquinrj/home lists the paper and journal link, without a separate correction.
- 2026-09-27: title/author searches with errata and Remark8.3 correction returned no identified correction. The atlas source-issues register was checked for this paper; the Lemma7.5 sign is already ColemanIntegration/E22. This bounded search is not a priority or novelty claim.

E6 preserves the historical request wording as source-finding provenance. Those requests now have the exact supplier nodes listed above. E7 is the already recorded ColemanIntegration/E22 sign typo, not a discovery claim.

## Sources and verification

- [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Joaquín Rodrigues Jacinto and Chris Williams, Essential Number Theory 4 (2025), no. 1, 101–216; DOI 10.2140/ent.2025.4.101. SHA-256 `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`.
- [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), Joaquín Rodrigues Jacinto and Chris Williams, arXiv:2309.15692v2, 19 December 2024. SHA-256 `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4`.

The actual PadicMeasuresIwasawaAlgebras suggested file is imported and compiled before the consumer. It supplies unchecked prototype signatures. The reader and packet remain the mathematical plan, and no implementation is claimed. The final handoff records the compilation, exact source reading, arithmetic checks, counts and publication guard. All five layers remain in scope; no stage is closed.


## L4: classical normalization and p-stabilization

Write E_k^lib for the pinned constant-one Eisenstein form. The source's
arithmetic normalization is Eᵃ_k=−B_k E_k^lib/(2k). For even k≥4 its
constant coefficient is ζ(1−k)/2 and its positive coefficient at n is
σ_(k−1)(n). This scalar conversion uses the existing modular form and
its complete holomorphy and cusp conditions.

The stabilized form lives in the native space at Γ₀(p). Restrict the
level-one form to Γ₀(p) for the first term, and to Γ₀(1) before applying
the pinned V_p operator for the second. This avoids any implicit equality
of two presentations of the level-one group. The existing conjugation
lemma supplies the exact level-raise hypothesis. Its evaluation is f(pz),
with no additional scalar.

Consequently its q-expansion is Q_k(q)−p^(k−1)Q_k(q^p). Positive
coefficients are integers. The constant is the rational number
−(1−p^(k−1))B_k/(2k), which need not be integral at p. In particular
the dyadic weight-four constant is −7/240; the q² coefficient is1.
Stabilization removes divisors divisible by p, not coefficients whose
indices are multiples of p.

For every n>0 the native measure A_n evaluates on x^(k−1) to the
p-adic image of the same integer as the complex modular coefficient.
This common integer supplies the comparison; there is no transport
of arbitrary complex values to a p-adic field. The completed-algebra
image, arithmetic A₀=xζ_p/2, its admissible evaluation domain and
tame-character family remain required work.

### Arithmetic normalization of the classical Eisenstein form

`DirichletPadicLFunctions:L4/normalized-eisenstein` — construction. Proposed declaration: `DirichletPadic.normalizedEisenstein`.

For k≥4 define Eᵃ_k=(−B_k/(2k))·E_k^lib in the existing complex ModularForm(SL₂(ℤ),k), where E_k^lib is the pinned ModularForm.E. This is only a scalar normalization of the existing form. Its arithmetic coefficient formulas below require k even; the constructor itself also makes sense for odd k≥4.

Hypotheses: k is a natural number with k≥4. Evenness is required by the arithmetic coefficient API, not by scalar multiplication in the constructor. The Bernoulli scalar is rational with its usual complex embedding; ModularForm.E is Mathlib’s pinned constant-one form at even weights.

Proof outline:

1. Use k≥4 to obtain the existing constructor’s bound 3≤k. Apply the native complex scalar action to ModularForm.E, with scalar the complex image of −B_k/(2k)∈ℚ. Slash invariance, holomorphy and boundedness at every cusp are supplied by the existing ModularForm module structure.
2. Do not define a second lattice sum, nebentypus space or q-expansion carrier. The pointwise formula is scalar evaluation, and changing the proof of k≥4 does not change the form by proof irrelevance.
3. The positive coefficients and the constant zeta comparison are separate promoted API nodes, because p-stabilization consumes both. The restriction k≥4 excludes the exceptional weight-two correction, which belongs to the classical ModularForms owner.

Prerequisites: `mathlib:ModularForm.E`.

Acceptance:

- At even weight4 the constant coefficient is 1/240 and the first positive coefficient is 1; native E₄ has constant1 and first coefficient240.
- At weight6 the constant is −1/504 and the coefficient at2 is33. The Bernoulli sign and weight exponent are visible in these tests.

Uses:

- RJW Definition8.1: The p-stabilized form must start from the arithmetic normalization with positive coefficients σ_(k−1).
- RJW Theorem8.2(b): Its constant coefficient is compared with the separately constructed arithmetic pseudomeasure, and its positive coefficients with native integral measures.

API:

- `DirichletPadic.normalizedEisenstein_eq_smul` (constructor): Eᵃ_k=(−B_k/(2k))·E_k^lib in the native level-one modular-form space.
- `DirichletPadic.normalizedEisenstein_apply` (coercion): For z in the upper half-plane, Eᵃ_k(z)=(−B_k/(2k))E_k^lib(z).
- `DirichletPadic.normalizedEisenstein_coeff` (data): For even k≥4, the period-one coefficient at0 is −B_k/(2k), and at n>0 is σ_(k−1)(n). Promoted to normalized-eisenstein-coeff.
- `DirichletPadic.normalizedEisenstein_constant_zeta` (compatibility): For even k≥4, the constant coefficient equals ζ(1−k)/2. Promoted to normalized-eisenstein-zeta-constant.

Tests:

- `SuggestedModularTests.weight_four_normalization` (computation): The weight-four constant is 1/240 and its q coefficient is1.
- `SuggestedModularTests.weight_six_sign` (computation): The weight-six constant is −1/504 and its q² coefficient is33.
- `SuggestedModularTests.native_constant_one_rejected` (non-example): The weight-four arithmetic constant is not1; the pinned constant-one E₄ cannot be used unchanged in Theorem8.2.

Source: §8, normalized E_k formula, printed159 / PDF60; arXiv v2 p.43. Arithmetic scalar conversion of the source’s normalization using the existing constant-one Eisenstein form, not a reconstruction of that form.

### Divisor coefficients of the arithmetic normalization

`DirichletPadicLFunctions:L4/normalized-eisenstein-coeff` — lemma. Proposed declaration: `DirichletPadic.normalizedEisenstein_coeff`.

For even k≥4 and n≥0, a_n(Eᵃ_k)=−B_k/(2k) if n=0, and a_n(Eᵃ_k)=σ_(k−1)(n) if n>0, with the rational and natural quantities embedded in ℂ.

Hypotheses: p is any prime, including 2; k is an even natural number with k≥4. B_k is Mathlib’s rational Bernoulli number, with B₁=−1/2. Eᵃ_k denotes normalizedEisenstein in the existing level-one ModularForm carrier; Eᵃ_{k,p} denotes pStabilizedEisenstein at Γ₀(p). All q-expansions have period 1, q=exp(2πiz).

Proof outline:

1. Apply ModularForm.qExpansion_smul with the native period-one certificate one_mem_strictPeriods_SL. The coefficient map is linear. Substitute the exact pinned EisensteinSeries.E_qExpansion_coeff formula, separating n=0 before cancelling any scalar.
2. Justify B_k≠0 inside this proof: write k=2j with j>0. riemannZeta_ne_zero_of_one_lt_re applies at 2j>1, while riemannZeta_two_mul_nat expresses this nonzero value as a scalar multiple of B_(2j). If B_(2j)=0 the value would vanish. This short specialization uses the existing zeta API, not a new general Bernoulli theory.
3. For n>0 cancel (−B_k/(2k))(−2k/B_k)=1 using k≠0 and the preceding nonvanishing. For n=0 the original coefficient is1, leaving −B_k/(2k).

Prerequisites: `DirichletPadicLFunctions:L4/normalized-eisenstein`, `mathlib:ModularForm.qExpansion_smul`, `mathlib:one_mem_strictPeriods_SL`, `mathlib:EisensteinSeries.E_qExpansion_coeff`, `mathlib:riemannZeta_two_mul_nat`, `mathlib:riemannZeta_ne_zero_of_one_lt_re`.

Acceptance:

- Positive coefficient1 is1, not −2k/B_k. At k=4,n=2 it is9; at k=6,n=2 it is33.
- The proof must not cancel B_k at odd k>1, when the required nonvanishing fails.

Source: §8, normalized E_k formula, printed159 / PDF60; arXiv v2 p.43. Rescales the already proved classical coefficient formula. The nonvanishing step is explicitly discharged through baseline zeta declarations.

### The zeta constant term

`DirichletPadicLFunctions:L4/normalized-eisenstein-zeta-constant` — lemma. Proposed declaration: `DirichletPadic.normalizedEisenstein_constant_zeta`.

For even k≥4, a₀(Eᵃ_k)=ζ(1−k)/2 in ℂ. Both equal the complex image of the rational number −B_k/(2k).

Hypotheses: p is any prime, including 2; k is an even natural number with k≥4. B_k is Mathlib’s rational Bernoulli number, with B₁=−1/2. Eᵃ_k denotes normalizedEisenstein in the existing level-one ModularForm carrier; Eᵃ_{k,p} denotes pStabilizedEisenstein at Γ₀(p). All q-expansions have period 1, q=exp(2πiz).

Proof outline:

1. Use normalized-eisenstein-coeff at n=0. Apply the pinned all-index riemannZeta_neg_nat_eq_bernoulli at k−1.
2. Here k−1 is odd, k−1+1=k and −(k−1)=1−k after casting. Thus (−1)^(k−1)=−1 and the zeta value is −B_k/k. Divide by2 and rearrange in ℂ.
3. This comparison only uses a rational normalized special value; it defines no map from ℂ to a p-adic field.

Prerequisites: `DirichletPadicLFunctions:L4/normalized-eisenstein-coeff`, `mathlib:riemannZeta_neg_nat_eq_bernoulli`.

Acceptance:

- For k=4 the constant is ζ(−3)/2=1/240. For k=6 it is ζ(−5)/2=−1/504.
- The k=1 sign exception in the source’s unrestricted negative-value formula never enters: the stated range is even k≥4.

Source: §8, normalized E_k formula, printed159 / PDF60; arXiv v2 p.43. Identifies the source constant through the corrected pinned zeta formula, with the common rational value specified.

### The p-stabilized Eisenstein modular form

`DirichletPadicLFunctions:L4/p-stabilized-eisenstein` — construction. Proposed declaration: `DirichletPadic.pStabilizedEisenstein`.

For every prime p and k≥4 construct Eᵃ_{k,p}=res_(Γ₀(p)) Eᵃ_k−p^(k−1)V_p(res_(Γ₀(1)) Eᵃ_k) in the existing ModularForm(Γ₀(p),k). Here V_p is TauCeti.ModularForm.levelRaise, so pointwise Eᵃ_{k,p}(z)=Eᵃ_k(z)−p^(k−1)Eᵃ_k(pz). Evenness is required for the following coefficient comparisons.

Hypotheses: p is any prime, including2; k≥4. Arithmetic coefficient statements additionally require k even. Γ₀(N) always means its native image (CongruenceSubgroup.Gamma0 N).map(mapGL ℝ); V_p has the pinned evaluation f(pz).

Proof outline:

1. View Γ₀(N) through its image under mapGL ℝ. This image is contained in SL₂(ℤ)’s image by the elementary subgroup-map inclusion, so the existing ModularForm.ofLe restricts Eᵃ_k to Γ₀(p) and Γ₀(1). No equality of differently represented group carriers is assumed.
2. Prime p is nonzero. Specialize Gamma0_map_le_conjAct_scaleGL at M=1,d=p and simplify p·1=p. This supplies exactly the conjugation hypothesis for the existing levelRaise from Γ₀(1) to Γ₀(p). The determinant-one structure comes from these native congruence subgroups.
3. Take the difference in that native complex modular-form module. Holomorphy and the conditions at all cusps are inherited from ofLe, levelRaise, scalar multiplication and subtraction; the definition is therefore an actual modular form, not a formal q-series assumed modular.
4. Use coe_ofLe and levelRaise_apply to get the pointwise API. In this normalization V_p f(z)=f(pz), with no additional p-power from the slash operator. No odd-prime hypothesis or division by p is needed.

Prerequisites: `DirichletPadicLFunctions:L4/normalized-eisenstein`, `tauceti:ModularForm.ofLe`, `tauceti:ModularForm.coe_ofLe`, `tauceti:TauCeti.ModularForm.levelRaise`, `tauceti:TauCeti.ModularForm.levelRaise_apply`, `tauceti:TauCeti.Gamma0_map_le_conjAct_scaleGL`.

Acceptance:

- At p=2,k=4 the form has levelΓ₀(2), constant −7/240 and coefficient at2 equal1.
- At p=3,k=4 coefficient at2 is9 and at6 is9. The coefficient at p is1: stabilization removes p-divisible divisors, not all coefficients indexed by multiples of p.

Uses:

- RJW Definition8.1: Gives the modular-form side of the arithmetic specialization.
- RJW Theorem8.2(b): The coefficient measures specialize to the q-expansion of this actual form. Geometric family realization stays with PadicFamilies.

API:

- `DirichletPadic.pStabilizedEisenstein_eq` (constructor): Eᵃ_{k,p} is the stated difference of restriction and the pinned p-level raise in ModularForm(Γ₀(p),k).
- `DirichletPadic.pStabilizedEisenstein_apply` (coercion): For every z∈ℍ, Eᵃ_{k,p}(z)=Eᵃ_k(z)−p^(k−1)Eᵃ_k(pz).
- `DirichletPadic.pStabilizedEisenstein_qExpansion` (compatibility): Its full period-one q-expansion is Q_k−p^(k−1)Q_k(q^p), including degree0, where Q_k=qExpansion(Eᵃ_k). Promoted to p-stabilized-q-expansion.
- `DirichletPadic.pStabilizedEisenstein_coeff_pos` (data): For even k≥4 and n>0, a_n(Eᵃ_{k,p})=Σ_{d∣n,p∤d}d^(k−1) in ℂ. Promoted to p-stabilized-positive-coeff.
- `DirichletPadic.pStabilizedEisenstein_constant_zeta` (data): For even k≥4, a₀(Eᵃ_{k,p})=(1−p^(k−1))ζ(1−k)/2. Promoted to p-stabilized-zeta-constant.

Tests:

- `SuggestedModularTests.dyadic_stabilized_constant` (computation): At p=2,k=4 the constant is −7/240.
- `SuggestedModularTests.coefficient_at_p_survives` (non-example): At p=2,k=4 the coefficient at2 is1, hence it is not zero.
- `SuggestedModularTests.prime_to_p_index` (computation): At p=3,k=4 the coefficient at2 is9.
- `SuggestedModularTests.multiple_of_p_index` (compatibility): At p=3,k=4 the coefficient at6 is9, equal to the coefficient at2.

Source: Definition8.1 and following q-expansion and level assertion, printed159 / PDF60; arXiv v2 p.44. Instantiates the pinned degeneracy operator and restriction maps to establish the source’s actual modularity and normalization.

### Degeneracy formula for the full q-expansion

`DirichletPadicLFunctions:L4/p-stabilized-q-expansion` — comparison. Proposed declaration: `DirichletPadic.pStabilizedEisenstein_qExpansion`.

For every prime p and k≥4, qExpansion₁(Eᵃ_{k,p})=Q_k−p^(k−1)·expand_p(Q_k) in ℂ[[q]], where Q_k=qExpansion₁(Eᵃ_k) and expand_p substitutes q↦q^p. This equality includes the constant coefficient and does not require k even.

Hypotheses: p is prime and k≥4; no evenness is needed for the level-raise identity. Q_k is the period-one q-expansion of the arithmetic scalar multiple Eᵃ_k.

Proof outline:

1. Apply ModularForm.qExpansion_sub and qExpansion_smul at Γ₀(p). The baseline strictPeriods_Gamma0 identifies the strict periods with ℤ, giving period1 at both Γ₀(p) and Γ₀(1).
2. Apply the exact TauCeti.ModularForm.qExpansion_levelRaise to the same conjugation certificate used in the constructor. Its result is native PowerSeries.expand p, not an unproved assertion about reindexing an analytic infinite sum.
3. Restriction does not change the underlying function, by ModularForm.coe_ofLe. Since qExpansion is defined on functions, both remaining restricted q-expansions are definitionally Q_k. This proves the full series identity.

Prerequisites: `DirichletPadicLFunctions:L4/p-stabilized-eisenstein`, `mathlib:ModularForm.qExpansion_sub`, `mathlib:ModularForm.qExpansion_smul`, `mathlib:CongruenceSubgroup.strictPeriods_Gamma0`, `tauceti:ModularForm.coe_ofLe`, `tauceti:TauCeti.ModularForm.qExpansion_levelRaise`.

Acceptance:

- At n=0, expand_p retains a₀, hence the factor1−p^(k−1).
- At n>0 not divisible by p, expand_p has zero coefficient. At p∣n it contributes a_(n/p), with no extra normalization factor.

Source: Definition8.1 and following q-expansion and level assertion, printed159 / PDF60; arXiv v2 p.44. Makes the source’s easy Fourier check a comparison using the existing modular-form and formal-series APIs.

### Positive Fourier coefficients after stabilization

`DirichletPadicLFunctions:L4/p-stabilized-positive-coeff` — theorem. Proposed declaration: `DirichletPadic.pStabilizedEisenstein_coeff_pos`.

For every prime p, even k≥4 and positive n, a_n(Eᵃ_{k,p}) is the complex image of S_(p,k,n)=Σ_{d∣n,p∤d}d^(k−1)∈ℤ. Equivalently it is σ_(k−1)(n)−p^(k−1)σ_(k−1)(n/p) if p∣n, and σ_(k−1)(n) otherwise.

Hypotheses: p is any prime, including 2; k is an even natural number with k≥4. B_k is Mathlib’s rational Bernoulli number, with B₁=−1/2. Eᵃ_k denotes normalizedEisenstein in the existing level-one ModularForm carrier; Eᵃ_{k,p} denotes pStabilizedEisenstein at Γ₀(p). All q-expansions have period 1, q=exp(2πiz).

Proof outline:

1. Take coefficient n in p-stabilized-q-expansion and use PowerSeries.coeff_expand. Split p∣n. If p∤n the expanded coefficient is0; if p∣n, primality and n>0 give n/p>0, so both source coefficients are positive-index instances of normalized-eisenstein-coeff.
2. The resulting difference is the complex cast of the integer expression in the existing divisor-sum-euler-deletion node at exponent k−1. Apply that node and distribute the cast across the finite sum. Integer subtraction avoids truncated natural subtraction.
3. All positivity and divisibility hypotheses are explicit: the n=0 branch uses a different constant-term theorem, not the convention for Nat.divisors 0.

Prerequisites: `DirichletPadicLFunctions:L4/p-stabilized-q-expansion`, `DirichletPadicLFunctions:L4/normalized-eisenstein-coeff`, `DirichletPadicLFunctions:L4/divisor-sum-euler-deletion`, `mathlib:PowerSeries.coeff_expand`.

Acceptance:

- At p=2,k=4,n=6 the coefficient is28=1+3³; at p=3 it is9=1+2³.
- For n=p the coefficient is1, so the phrase about killing coefficients at p is interpreted as removing p-divisible divisors.
- For p=3,k=4,n=2 the exponent is3 and the result9; the incorrect exponent4 gives17.

Source: Definition8.1 and following q-expansion and level assertion, printed159 / PDF60; arXiv v2 p.44. Combines the actual modular-form q-expansion with the already planned integer divisor deletion; no duplicate finite-divisor lemma is introduced.

### Euler factor in the stabilized constant term

`DirichletPadicLFunctions:L4/p-stabilized-zeta-constant` — theorem. Proposed declaration: `DirichletPadic.pStabilizedEisenstein_constant_zeta`.

For every prime p and even k≥4, a₀(Eᵃ_{k,p})=(1−p^(k−1))ζ(1−k)/2 in ℂ. It is the complex image of c_(p,k)=−(1−p^(k−1))B_k/(2k)∈ℚ.

Hypotheses: p is any prime, including 2; k is an even natural number with k≥4. B_k is Mathlib’s rational Bernoulli number, with B₁=−1/2. Eᵃ_k denotes normalizedEisenstein in the existing level-one ModularForm carrier; Eᵃ_{k,p} denotes pStabilizedEisenstein at Γ₀(p). All q-expansions have period 1, q=exp(2πiz).

Proof outline:

1. Take coefficient0 in p-stabilized-q-expansion. PowerSeries.coeff_expand has p∣0 and 0/p=0, so the coefficient is (1−p^(k−1))a₀(Eᵃ_k).
2. Apply normalized-eisenstein-zeta-constant. For the rational representative, use normalized-eisenstein-coeff at0 and commute the rational-to-complex cast with products and division. Here2k≠0.
3. The rational representative can independently be embedded in ℚ_p, but this does not construct A₀ or supply an integral measure. In particular, dyadic denominators are not dismissed by a division inside ℤ₂.

Prerequisites: `DirichletPadicLFunctions:L4/p-stabilized-q-expansion`, `DirichletPadicLFunctions:L4/normalized-eisenstein-zeta-constant`, `DirichletPadicLFunctions:L4/normalized-eisenstein-coeff`, `mathlib:PowerSeries.coeff_expand`.

Acceptance:

- At p=2,k=4 the constant is −7/240; at p=3,k=4 it is −13/120.
- At p=2,k=6 it is31/504. These are rational constants, with no claim that they all lie in ℤ_p.

Source: Definition8.1 and following q-expansion and level assertion, printed159 / PDF60; arXiv v2 p.44. Identifies the exact constant needed by Theorem8.2 while retaining the missing arithmetic pseudomeasure as an explicit gap.

### Measure moments and modular Fourier coefficients

`DirichletPadicLFunctions:L4/positive-eisenstein-modular-comparison` — theorem. Proposed declaration: `DirichletPadic.positiveEisensteinMeasure_modular_coeff`.

For every prime p, even k≥4 and n>0, there is a unique integer S such that a_n(Eᵃ_{k,p})=ι_ℂ(S) and A_n(x^(k−1))=ι_ℤp(S), where A_n is the native positiveEisensteinMeasure and S=Σ_{d∣n,p∤d}d^(k−1). This is the positive-index specialization in Theorem8.2 through a common arithmetic coefficient.

Hypotheses: p is any prime, including 2; k is an even natural number with k≥4. B_k is Mathlib’s rational Bernoulli number, with B₁=−1/2. Eᵃ_k denotes normalizedEisenstein in the existing level-one ModularForm carrier; Eᵃ_{k,p} denotes pStabilizedEisenstein at Γ₀(p). All q-expansions have period 1, q=exp(2πiz).

Proof outline:

1. Choose the displayed finite integer sum. p-stabilized-positive-coeff identifies its complex image with the coefficient of the actual stabilized modular form.
2. Apply the existing positive-eisenstein-moment node at exponent k−1 to identify the integral p-adic moment. The integer cast distributes over powers and the finite divisor sum, giving precisely the same S in ℤ_p.
3. Uniqueness follows from injectivity of the integer cast into ℂ. No C-to-C_p isomorphism, measure scalar-extension assumption or completion of the group ring appears in this positive-coefficient comparison.
4. For arbitrary p-adic coefficient extensions one must still use the owner’s measure base-change maps; the joint equality proved here concerns the native ℤ_p-valued measure. The index0 is excluded and remains the separate A₀=xζ_p/2 construction.

Prerequisites: `DirichletPadicLFunctions:L4/p-stabilized-positive-coeff`, `DirichletPadicLFunctions:L4/positive-eisenstein-moment`.

Acceptance:

- At p=2,k=4,n=6 the common integer is28, in both ℂ and ℤ₂.
- At p=3,k=4,n=2 it is9; exponent k instead of k−1 would give17.
- At n=p the common integer is1, consistent with A_p=δ₁. The common-integer theorem makes no assertion for A₀.

Source: Theorem8.2(b), positive-index calculation in its proof, printed160 / PDF61; arXiv v2 p.44. Completes only the positive-index comparison with the native classical modular form. The completed-algebra image and the constant pseudomeasure remain distinct missing inputs.

### Remaining L4 boundary

The positive coefficient measures now compare to the actual Γ₀(p) modular form through eight native normalization and p-stabilization declarations. Both the full classical q-expansion and its rational zeta constant are planned from the pinned ModularForm and levelRaise APIs. The remaining full L4 targets are: The explicit finite coordinates E_(n;r,s), their two independent transition maps and native integral/moment comparisons are now supplied. Instantiate positive-eisenstein-completed-coordinates once the requested PadicMeasuresIwasawaAlgebras:L1 actual integral-measure/completed-algebra map, Dirac projections and separating joint projections are supplied. The generic carrier, topology and convolution are owned there, with its existing ProfiniteProPGroups Layer9 anchor. Construct A₀=xζ_p/2 in the actual localized algebra using L1 arithmetic zeta and PadicMeasuresIwasawaAlgebras:L3, including the admissible evaluation domain and dyadic division by 2. No A₀ is supplied by the positive-index constructor. Assemble the full coefficientwise specialization at x^(k−1), prove the constant-term congruences with denominator qualifications, and decompose the tame-character extension. The present congruence concerns only positive rational-field Eisenstein coefficients. Geometric affinoid realization and Hida–Coleman control belong to PadicFamilies; fix the weight shift recorded in E9 before stating that comparison. Accepted RS-14 retained scope: Use the existing classical Eisenstein modular forms, their generalized Bernoulli/Fourier coefficient API and pinned level-one q-expansion. Own the p-stabilized form E_k-p^(k-1)E_k(pz) for even k>=4, its actual modular-form/q-expansion comparison, coefficient measures A_n=sum_{d|n,p not dividing d}delta_d and A_0=x*zeta_p/2, and coefficientwise specialization at x^(k-1). Own the measure-valued tame-character family and integral coefficient congruences, with exact primitive and p-stabilization normalizations. Full geometric affinoid realization/Hida–Coleman control remains PadicFamilies' separate task; no new classical nebentypus/Eisenstein carrier is defined.

The suggested file types every new node, all nine new API entries and all seven new construction tests. Both new constructors use the real existing ModularForm type. The shared measure supplier is imported as an unchecked suggested dependency; placeholders do not establish implementations. No new source finding is added, and no review verdict is claimed.

## Finite group-ring coordinates of positive Eisenstein coefficients

For n>0 the native measure A_n on U=ℤ_p× is already the finite sum of Dirac
measures at p-prime divisors. At unit-group level r and coefficient level s,
its coordinate is the corresponding sum of basis vectors in
(ℤ/p^sℤ)[(ℤ/p^rℤ)×]. Both indices are retained independently. Distinct divisors
may have the same residue: their multiplicities add, and can then become zero
modulo p^s. No division by a transition kernel cardinality is used.

The finite model uses only the existing MonoidAlgebra, PadicInt.toZModPow,
Units.map and coefficient/group map APIs. Its pairing with a finite residue
function agrees with reduction of the native integral whenever that test
function factors after reduction. For power moments the sufficient condition
is s≤r. The arithmetic finite calculation does not construct an inverse limit,
a generic restriction functor, a new convolution or a coefficient A₀.

The canonical completed-algebra image is specified by all these coordinates,
but its actual shared measure comparison is still missing. The request to
PadicMeasuresIwasawaAlgebras:L1 names the map, Dirac compatibility, finite
projections and their separation, with the ProfiniteProPGroups Layer9 anchor.
The accepted RS16 joint-topology condition remains binding. The inclusion of
intrinsic unit measures into measures on additive ℤ_p is not an algebra map
for their different convolutions. No dyadic sign-idempotent splitting is used.

Source: RJW, published Proposition3.16 and its explicit maps (printed121–123),
and Theorem8.2 (printed160). Printed120–123 and159–160 were read; the finite
adapters are worker deductions, and all nine inherited source findings survive.

### Finite quotient Eisenstein coefficients

`DirichletPadicLFunctions:L4/positive-eisenstein-finite` — `positiveEisensteinFinite` (construction).

Define E_(n;r,s)=Σ_{d∣n,p∤d}[red_r(u(d))] in (ℤ/p^sℤ)[U_r]. Each divisor contributes a coefficient 1, so divisors with the same unit residue contribute with multiplicity. This is the explicit finite group-ring coordinate of the positive coefficient, using existing group algebras and residue maps.

Hypotheses: p is any prime, including 2; n>0. Put U=ℤ_p× and U_r=(ℤ/p^rℤ)× for r≥0. Let ρ_s:ℤ_p→ℤ/p^sℤ be the pinned PadicInt.toZModPow and red_r=Units.map(ρ_r). For a positive divisor d of n with p∤d, u(d) is the same unit of ℤ_p used by positive-eisenstein-measure. Define E_(n;r,s) in the existing MonoidAlgebra(ℤ/p^sℤ,U_r). The group level r and coefficient level s vary independently, including zero. No p-adic topology is assigned to a power-series carrier here.

Proof outline:

1. Use the same natural-cast unit and finite divisor set as positive-eisenstein-measure; apply the existing Units.map to ρ_r. No quotient group or unit carrier is reconstructed.
2. Sum the existing MonoidAlgebra.single at those units with coefficient 1 in ℤ/p^sℤ. Distinct divisors need not have distinct images, so the sum is taken over divisors, not the set of distinct residues.
3. At s=0 the coefficient ring is ℤ/1ℤ and the result is zero. At r=0 the group is trivial, so its single coefficient is the number of p-prime divisors modulo p^s. At n=1 and n=p^a the only retained divisor is 1.
4. Deleting powers of p in n leaves the p-prime divisor set unchanged, by the existing positive-eisenstein-remove-p argument. These are arithmetic specializations, not a definition of the shared completed algebra.

Prerequisites: `DirichletPadicLFunctions:L4/positive-eisenstein-measure`, `DirichletPadicLFunctions:L4/positive-eisenstein-remove-p`, `mathlib:PadicInt.toZModPow`, `mathlib:Units.map`, `mathlib:MonoidAlgebra.single`.

API:

- `DirichletPadic.positiveEisensteinFinite_eq_sum` (constructor): E_(n;r,s) is the divisor-indexed sum of single(red_r(u(d)),1), with the same u(d) as A_n.
- `DirichletPadic.positiveEisensteinFinite_coeff` (data): For a∈U_r, its coefficient is Σ_{d∣n,p∤d}1_(red_r(u(d))=a) in ℤ/p^sℤ. Promoted to positive-eisenstein-finite-coeff.
- `DirichletPadic.positiveEisensteinFinite_transition` (functoriality): For r′≤r and s′≤s, reduce coefficients then push the group index forward; the image of E_(n;r,s) is E_(n;r′,s′). Promoted to positive-eisenstein-finite-transition.
- `DirichletPadic.positiveEisensteinFinite_apply` (compatibility): For continuous f:U→ℤ_p and any g:U_r→ℤ/p^sℤ with ρ_s(f(u))=g(red_r(u)), the reduced integral A_n(f) equals Σ_a coeff_a(E_(n;r,s))g(a). Promoted to positive-eisenstein-finite-evaluation.
- `DirichletPadic.positiveEisensteinFinite_moment` (compatibility): If s≤r and e≥0, evaluation on the e-th power of the reduced unit equals ρ_s(A_n(x^e)). Promoted to positive-eisenstein-finite-moment.
- `DirichletPadic.positiveEisensteinFinite_one` (simp): E_(1;r,s)=[1] for all r,s.
- `DirichletPadic.positiveEisensteinFinite_prime_pow` (simp): E_(p^a;r,s)=[1] for all a,r,s, including a=0.
- `DirichletPadic.positiveEisensteinFinite_mul_p` (relation): E_(pn;r,s)=E_(n;r,s) for all n>0.
- `DirichletPadic.positiveEisensteinFinite_coeff_zero` (simp): E_(n;r,0)=0 because the coefficient ring is ℤ/1ℤ.

Uses:

- RJW Proposition3.16 followed by Theorem8.2: Identify the finite group-ring coordinates of the actual positive coefficient measures.
- DirichletPadicLFunctions:L4/positive-eisenstein-completed-coordinates: Supplies explicit, compatible coordinate values for the existing completed-algebra owner’s measure comparison.
- DirichletPadicLFunctions:L4 coefficient specialization and congruences: Check finite precision moments with the unit-group quotient and coefficient precision separately specified.

Tests:

- `FiniteCoefficientTests.dyadic_separated` (computation): At p=2,n=6,r=2,s=3, E=[1]+[3] in (ℤ/8ℤ)[(ℤ/4ℤ)×].
- `FiniteCoefficientTests.dyadic_collision` (compatibility): At p=2,n=6,r=1,s=3, E=2[1]; the two divisors merge and their multiplicities add.
- `FiniteCoefficientTests.dyadic_cancellation` (non-example): At p=2,n=6,r=1,s=1, E=0. A set of distinct residues with coefficient1 gives the wrong answer.
- `FiniteCoefficientTests.prime_coefficient` (computation): At p=3,n=3,r=2,s=2, E=[1], so the positive coefficient at q^p survives.
- `FiniteCoefficientTests.trivial_group_mass` (degenerate): At p=2,n=6,r=0,s=3, E=2[1]; trivial group level does not force coefficient precision0.
- `FiniteCoefficientTests.zero_coefficient_ring` (degenerate): For every p,n,r, E_(n;r,0)=0.
- `FiniteCoefficientTests.separate_precision_levels` (non-example): At p=2,n=6,r=2,s=1, E=[1]+[3] is nonzero, while its image at r=1,s=1 vanishes.

Acceptance: The dyadic tests distinguish adding multiplicities from deleting collisions, and distinguish the coefficient level from the group level. No coefficient A₀ is defined.

Sources: §3.3, Proposition3.16 and explicit coordinate maps, printed121–123 / PDF22–24; §8 Theorem8.2 proof, printed160 / PDF61. Read 27 September2026. The source identifies a measure with its finite coset masses and defines A_n as the divisor Dirac sum. The two-index reduction modulo p^s at unit-group level p^r, its exact multiplicities and tests are worker-derived specializations. The general completed-algebra comparison remains an explicit supplier request.

### Finite residue multiplicities

`DirichletPadicLFunctions:L4/positive-eisenstein-finite-coeff` — `positiveEisensteinFinite_coeff` (lemma).

For a∈U_r, coeff_a(E_(n;r,s)) is the number of p-prime positive divisors d of n with red_r(u(d))=a, reduced modulo p^s. Equivalently it is the sum of the corresponding 0–1 indicators.

Hypotheses: p is any prime, including 2; n>0. Put U=ℤ_p× and U_r=(ℤ/p^rℤ)× for r≥0. Let ρ_s:ℤ_p→ℤ/p^sℤ be the pinned PadicInt.toZModPow and red_r=Units.map(ρ_r). For a positive divisor d of n with p∤d, u(d) is the same unit of ℤ_p used by positive-eisenstein-measure. Define E_(n;r,s) in the existing MonoidAlgebra(ℤ/p^sℤ,U_r). The group level r and coefficient level s vary independently, including zero. No p-adic topology is assigned to a power-series carrier here.

Proof outline:

1. Apply the existing coefficient map to the finite sum; evaluate each MonoidAlgebra.single by Finsupp.single_apply.
2. Collect the indicators. Coefficients count preimages with multiplicity; they are not membership indicators for the image set.

Prerequisites: `DirichletPadicLFunctions:L4/positive-eisenstein-finite`, `mathlib:MonoidAlgebra.coeff_sum`, `mathlib:MonoidAlgebra.coeff_single`, `mathlib:Finsupp.single_apply`.

Acceptance: At p=2,n=6 the two residue classes at r=2 merge into a coefficient2 at r=1 and then become0 modulo2.

Sources: §3.3, Proposition3.16 and explicit coordinate maps, printed121–123 / PDF22–24; §8 Theorem8.2 proof, printed160 / PDF61. Read 27 September2026. The source identifies a measure with its finite coset masses and defines A_n as the divisor Dirac sum. The two-index reduction modulo p^s at unit-group level p^r, its exact multiplicities and tests are worker-derived specializations. The general completed-algebra comparison remains an explicit supplier request.

### Joint finite-level compatibility

`DirichletPadicLFunctions:L4/positive-eisenstein-finite-transition` — `positiveEisensteinFinite_transition` (lemma).

For r′≤r and s′≤s, map E_(n;r,s) first along ℤ/p^sℤ→ℤ/p^s′ℤ and then along U_r→U_r′. The result is E_(n;r′,s′). The group map pushes coefficients forward by adding over each fiber.

Hypotheses: p is any prime, including 2; n>0. Put U=ℤ_p× and U_r=(ℤ/p^rℤ)× for r≥0. Let ρ_s:ℤ_p→ℤ/p^sℤ be the pinned PadicInt.toZModPow and red_r=Units.map(ρ_r). For a positive divisor d of n with p∤d, u(d) is the same unit of ℤ_p used by positive-eisenstein-measure. Define E_(n;r,s) in the existing MonoidAlgebra(ℤ/p^sℤ,U_r). The group level r and coefficient level s vary independently, including zero. No p-adic topology is assigned to a power-series carrier here.

Proof outline:

1. The native PadicInt.zmod_cast_comp_toZModPow gives compatibility of the ring reductions. Applying Units.map identifies the two routes for every u(d).
2. Map the finite sum through MonoidAlgebra.mapRingHom and mapDomainRingHom. Both preserve sums and the image of each single basis vector has coefficient1 at red_r′(u(d)).
3. Composition and the commutation of coefficient/group reduction are the pinned general map identities. No averaging, division by the kernel size, procyclic generator or pure T-adic quotient is introduced.

Prerequisites: `DirichletPadicLFunctions:L4/positive-eisenstein-finite`, `mathlib:PadicInt.zmod_cast_comp_toZModPow`, `mathlib:MonoidAlgebra.mapRingHom`, `mathlib:MonoidAlgebra.mapDomainRingHom`, `mathlib:MonoidAlgebra.mapRingHom_single`, `mathlib:MonoidAlgebra.mapDomain_single`, `mathlib:MonoidAlgebra.mapRingHom_comp_mapDomainRingHom`.

Acceptance: The transition from r=2,s=3 to r′=1,s′=1 at p=2,n=6 sends [1]+[3] to0. Coefficient reduction is independent of the group reduction.

Sources: §3.3, Proposition3.16 and explicit coordinate maps, printed121–123 / PDF22–24; §8 Theorem8.2 proof, printed160 / PDF61. Read 27 September2026. The source identifies a measure with its finite coset masses and defines A_n as the divisor Dirac sum. The two-index reduction modulo p^s at unit-group level p^r, its exact multiplicities and tests are worker-derived specializations. The general completed-algebra comparison remains an explicit supplier request.

### Finite coordinate and native integral comparison

`DirichletPadicLFunctions:L4/positive-eisenstein-finite-evaluation` — `positiveEisensteinFinite_apply` (lemma).

Let f:U→ℤ_p be continuous and g:U_r→ℤ/p^sℤ any function such that ρ_s(f(u))=g(red_r(u)) for all u. Then ρ_s(A_n(f))=Σ_{a∈U_r}coeff_a(E_(n;r,s))·g(a). This compares the actual intrinsic measure with the finite coordinate, with factorization required only after coefficient reduction.

Hypotheses: p is any prime, including 2; n>0. Put U=ℤ_p× and U_r=(ℤ/p^rℤ)× for r≥0. Let ρ_s:ℤ_p→ℤ/p^sℤ be the pinned PadicInt.toZModPow and red_r=Units.map(ρ_r). For a positive divisor d of n with p∤d, u(d) is the same unit of ℤ_p used by positive-eisenstein-measure. Define E_(n;r,s) in the existing MonoidAlgebra(ℤ/p^sℤ,U_r). The group level r and coefficient level s vary independently, including zero. No p-adic topology is assigned to a power-series carrier here.

Proof outline:

1. Use positive-eisenstein-evaluation to write A_n(f) as its divisor sum and apply the ring map ρ_s term by term.
2. Apply the stated factorization at each u(d). On the other side expand positive-eisenstein-finite-coeff, interchange two finite sums and evaluate the single nonzero indicator for each divisor.
3. This arithmetic finite-sum argument needs neither a new measure restriction functor nor a general completed-algebra comparison. The factorization hypothesis is explicit; arbitrary f need not factor at a fixed r,s.

Prerequisites: `DirichletPadicLFunctions:L4/positive-eisenstein-evaluation`, `DirichletPadicLFunctions:L4/positive-eisenstein-finite-coeff`.

Acceptance: The constant function1 recovers mass modulo p^s. A nonconstant residue function checks that the comparison remembers individual cosets rather than just total mass.

Sources: §3.3, Proposition3.16 and explicit coordinate maps, printed121–123 / PDF22–24; §8 Theorem8.2 proof, printed160 / PDF61. Read 27 September2026. The source identifies a measure with its finite coset masses and defines A_n as the divisor Dirac sum. The two-index reduction modulo p^s at unit-group level p^r, its exact multiplicities and tests are worker-derived specializations. The general completed-algebra comparison remains an explicit supplier request.

### Finite precision power moments

`DirichletPadicLFunctions:L4/positive-eisenstein-finite-moment` — `positiveEisensteinFinite_moment` (lemma).

For s≤r and e≥0, pair E_(n;r,s) with a↦(a reduced from ℤ/p^rℤ to ℤ/p^sℤ)^e. Its value is ρ_s(A_n(x^e))=Σ_{d∣n,p∤d}d^e modulo p^s. Weight k specializes at e=k−1.

Hypotheses: p is any prime, including 2; n>0. Put U=ℤ_p× and U_r=(ℤ/p^rℤ)× for r≥0. Let ρ_s:ℤ_p→ℤ/p^sℤ be the pinned PadicInt.toZModPow and red_r=Units.map(ρ_r). For a positive divisor d of n with p∤d, u(d) is the same unit of ℤ_p used by positive-eisenstein-measure. Define E_(n;r,s) in the existing MonoidAlgebra(ℤ/p^sℤ,U_r). The group level r and coefficient level s vary independently, including zero. No p-adic topology is assigned to a power-series carrier here.

Proof outline:

1. Apply positive-eisenstein-finite-evaluation with the actual continuous function u↦u^e.
2. The hypothesis s≤r and native compatibility of ρ give the required factorization. Use positive-eisenstein-moment for the final divisor sum.
3. At s>r this particular power function need not descend modulo p^s: no such assertion is made. The constructor and transition theorem still allow independent r,s.

Prerequisites: `DirichletPadicLFunctions:L4/positive-eisenstein-finite-evaluation`, `DirichletPadicLFunctions:L4/positive-eisenstein-moment`, `mathlib:PadicInt.zmod_cast_comp_toZModPow`.

Acceptance: At p=2,n=6,r=s=3,e=3 the answer is28 modulo8, namely4. The moment exponent is k−1, and e=0 remains the mass test.

Sources: §3.3, Proposition3.16 and explicit coordinate maps, printed121–123 / PDF22–24; §8 Theorem8.2 proof, printed160 / PDF61. Read 27 September2026. The source identifies a measure with its finite coset masses and defines A_n as the divisor Dirac sum. The two-index reduction modulo p^s at unit-group level p^r, its exact multiplicities and tests are worker-derived specializations. The general completed-algebra comparison remains an explicit supplier request.

### Completed-algebra coordinates of positive coefficients

`DirichletPadicLFunctions:L4/positive-eisenstein-completed-coordinates` — `positiveEisenstein_completed_projection` (comparison).

Under the actual integral measure/completed-group-algebra comparison supplied by PadicMeasuresIwasawaAlgebras:L1, the image of A_n has projection E_(n;r,s) in (ℤ/p^sℤ)[U_r] for every r,s. These projections uniquely characterize that image in the separated joint inverse limit. This is an arithmetic specialization of the requested owner map, not a construction of another completed algebra.

Hypotheses: p is any prime, including 2; n>0. Put U=ℤ_p× and U_r=(ℤ/p^rℤ)× for r≥0. Let ρ_s:ℤ_p→ℤ/p^sℤ be the pinned PadicInt.toZModPow and red_r=Units.map(ρ_r). For a positive divisor d of n with p∤d, u(d) is the same unit of ℤ_p used by positive-eisenstein-measure. Define E_(n;r,s) in the existing MonoidAlgebra(ℤ/p^sℤ,U_r). The group level r and coefficient level s vary independently, including zero. No p-adic topology is assigned to a power-series carrier here.

Proof outline:

1. Import the owner’s actual ℤ_p-linear measure comparison, Dirac-generator compatibility, finite coefficient/group projections and their separating property. Its ℤ_p anchor is the existing ProfiniteProPGroups Layer9 roadmap, with the accepted RS16 topology gate.
2. Expand A_n as its native intrinsic-unit Dirac sum. Linearity and projection of Dirac at u(d) to [red_r(u(d))] give exactly the defining finite coordinate.
3. Invoke the supplied separated joint inverse-limit property for uniqueness. The arithmetic finite-level formula and transitions are supplied here; the common completed carrier and measure equivalence remain an open named request. This does not construct A₀ or arithmetic ζ_p.

Prerequisites: `DirichletPadicLFunctions:L4/positive-eisenstein-measure`, `DirichletPadicLFunctions:L4/positive-eisenstein-finite`, `DirichletPadicLFunctions:L4/positive-eisenstein-finite-transition`, `PadicMeasuresIwasawaAlgebras:L1`.

Acceptance: The requested map sends intrinsic δ_1 to the multiplicative identity and preserves convolution; the inclusion into measures on additive ℤ_p is not substituted for that algebra map. Include p=2 with no integral sign-idempotent splitting.

Sources: §3.3, Proposition3.16 and explicit coordinate maps, printed121–123 / PDF22–24; §8 Theorem8.2 proof, printed160 / PDF61. Read 27 September2026. The source identifies a measure with its finite coset masses and defines A_n as the divisor Dirac sum. The two-index reduction modulo p^s at unit-group level p^r, its exact multiplicities and tests are worker-derived specializations. The general completed-algebra comparison remains an explicit supplier request.

The one current supplier request is: For U=ℤ_p× and every prime p including2, supply the actual ℤ_p-linear integral-measure equivalence D(U,ℤ_p)→ℤ_p[[U]] on the existing ProfiniteProPGroups Layer9 completed-group-algebra anchor, compatible with convolution and Dirac u↦[u]. Supply the projections to (ℤ/p^sℤ)[(ℤ/p^rℤ)×], all r,s≥0, their joint coefficient/group transition laws, projection of [u] to [red_r(u)], and separation by these projections. Identify these quotients through the canonical unit reduction and its open kernel; use the joint adic/finite-quotient topology, not pure T-adic kernels or an integral dyadic eigenspace splitting. This request imports the general comparison; the finite divisor-coordinate arithmetic is already provided by the consuming nodes.

Current L4 gap: The eight positive-series adapters supply the native coefficientwise assembly and full positive modular comparison through ℤ. They do not set A₀ to zero. Remaining work: The explicit finite coordinates E_(n;r,s), their two independent transition maps and native integral/moment comparisons are now supplied. Instantiate positive-eisenstein-completed-coordinates once the requested PadicMeasuresIwasawaAlgebras:L1 actual integral-measure/completed-algebra map, Dirac projections and separating joint projections are supplied. The generic carrier, topology and convolution are owned there, with its existing ProfiniteProPGroups Layer9 anchor. Construct A₀=xζ_p/2 in the actual localized algebra using L1 arithmetic zeta and PadicMeasuresIwasawaAlgebras:L3, including the admissible evaluation domain and dyadic division by 2. No A₀ is supplied by the positive-index constructor. The positive part now has a native continuous power-series-valued measure, uniform coefficient bounds, test and weight congruences, and whole-series comparison with the actual p-stabilized modular form after removing its constant coefficient. Assemble the full family with the actual A₀ pseudomeasure, prove constant-term congruences with denominator qualifications, and decompose the tame-character extension. Geometric affinoid realization and Hida–Coleman control belong to PadicFamilies; retain the weight shift recorded in E9. Accepted RS-14 retained scope: Use the existing classical Eisenstein modular forms, their generalized Bernoulli/Fourier coefficient API and pinned level-one q-expansion. Own the p-stabilized form E_k-p^(k-1)E_k(pz) for even k>=4, its actual modular-form/q-expansion comparison, coefficient measures A_n=sum_{d|n,p not dividing d}delta_d and A_0=x*zeta_p/2, and coefficientwise specialization at x^(k-1). Own the measure-valued tame-character family and integral coefficient congruences, with exact primitive and p-stabilization normalizations. Full geometric affinoid realization/Hida–Coleman control remains PadicFamilies' separate task; no new classical nebentypus/Eisenstein carrier is defined.

At the previous finite-coordinate checkpoint, the full suggested file compiled with zero errors and141 expected proof-placeholder warnings; its actual PMIA import has317. All3541 reached Mathlib source files match the pin, and19 Tau Ceti modules were freshly rebuilt from pinned sources with zero warnings. Ten executable declarations and seven typed examples append to the previous seed. The completed-algebra declaration remains an explicit comment pending its actual supplier API, in accordance with the owner-carrier rule. Six complete finite-coordinate and native-measure scratch lemmas have no placeholders, errors or warnings. The exact finite regression harness passes146,171 assertions over8,400 systems, including75,600 transitions,25,200 test-function pairings and20,160 power moments. These are finite checks, not an implementation of the completed measure algebra or arithmetic pseudomeasure.


## The native positive q-expansion measure

The source first specifies each positive coefficient A_n as the sum of Dirac
measures at the positive divisors prime to p. The same coefficients can be
assembled into one native continuous linear map E⁺ from continuous integral
tests on the unit group to formal power series over ℤ_p. Continuity uses the
coefficientwise topology: a fixed coefficient is a fixed continuous linear
functional. This gives a precise positive-part version of the variation in
Remark8.3(1), without requiring a completed group algebra or an analytic weight
space before that variation can be stated.

The uniform bound is stronger than separate coefficientwise continuity: every
coefficient of E⁺(f) has norm at most the supremum norm of f, independent of its
index. This comes from the ultrametric finite-sum inequality. It does not count
divisors in the bound and does not turn the product topology on the power-series
carrier into a supremum-norm topology. Nor is E⁺ multiplicative in the test
function: for p=2 and index six, the constant test one has coefficient two.

Pointwise divisibility of the difference of two tests passes through every
finite Dirac sum. Choosing a quotient for each coefficient then gives actual
divisibility by a constant power series. The same argument turns the preceding
power-moment congruence into an equality modulo pʳ of the entire positive series.
The modulus on exponents is p^(r−1)(p−1), and the classical weight exponent
continues to be k−1. Both the proof and the tests retain the dyadic case.

The comparison with the actual classical modular form is through a single
integer power series Q. Its images in ℂ[[q]] and ℤ_p[[q]] are respectively the
positive part of the actual p-stabilized q-expansion and the positive-series
measure evaluated at x^(k−1). Coefficientwise injectivity of ℤ→ℂ makes Q unique.
No comparison map from ℂ to a p-adic field is used. The degree-zero subtraction
is essential: at p=2,k=4 the actual modular constant is −7/240. The zero at
degree zero in E⁺ is a truncation convention, never the source's A₀.

### Uniform bound for positive Eisenstein integrals

`DirichletPadicLFunctions:L4/positive-eisenstein-evaluation-bound` — `positiveEisensteinMeasure_norm_le` (lemma).

For every n>0 and f∈C(U,Z), |A_n(f)|_p ≤ ‖f‖∞. The constant is one, independently of n and of the number of divisors.

**Hypotheses:** p is any prime, including 2; Z=ℤ_p and U=Z× with their native topologies. A_n is the already planned positiveEisensteinMeasure for n>0. C(U,Z) has its compact-open topology and supremum norm. Z[[q]] has the existing coefficientwise topology PowerSeries.WithPiTopology; no norm on that power-series carrier is asserted.

**Proof outline:**

1. Use positive-eisenstein-evaluation to write A_n(f) as a finite sum of evaluations at the prime-to-p divisors. Every nonzero summand has norm at most ‖f‖∞ by ContinuousMap.norm_coe_le_norm.
2. Apply the additive form of the indexed IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg. Its generated norm_sum_le_of_forall_le_of_nonneg handles the finite sum, including zero summands. No division by the cardinality occurs.

**Prerequisites:** `DirichletPadicLFunctions:L4/positive-eisenstein-evaluation`, `mathlib:ContinuousMap.norm_coe_le_norm`, `mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`.

**Acceptance:** At n=1 this is the norm bound for evaluation at 1. The dyadic n=6 mass is 2 and has norm 1/2, so equality is not asserted.

**Sources:** RJW-published, §8, Definition 8.1, Theorem 8.2 and Remark 8.3(1), printed159–160 / PDF60–61; fresh reading 27 September2026. The positive Dirac coefficients and exponent k−1 are explicit in the source. Their assembly into a native continuous linear map, the uniform coefficient bounds and series divisibility are worker deductions. The actual constant pseudomeasure and the geometric weight family remain outside this positive-part adapter.

### The positive Eisenstein q-expansion measure

`DirichletPadicLFunctions:L4/positive-eisenstein-series` — `positiveEisensteinSeries` (construction).

There is a canonical native AbstractMeasure(U,Z,Z[[q]]), denoted E⁺, given on f∈C(U,Z) by E⁺(f)=Σ_{n≥1} A_n(f)qⁿ. In this formal coefficient description coefficient zero is zero. This is the positive part of the source family, and does not define its missing A₀.

**Hypotheses:** p is any prime, including 2; Z=ℤ_p and U=Z× with their native topologies. A_n is the already planned positiveEisensteinMeasure for n>0. C(U,Z) has its compact-open topology and supremum norm. Z[[q]] has the existing coefficientwise topology PowerSeries.WithPiTopology; no norm on that power-series carrier is asserted.

**Proof outline:**

1. Use PowerSeries.mk with coefficient zero equal to zero and coefficient n>0 equal to the existing A_n(f). Establish additivity and Z-linearity coefficientwise using native linearity of A_n and PowerSeries.ext.
2. For each fixed coefficient, the map in f is either zero or the continuous linear functional A_n. The existing coefficientwise convergence criterion gives continuity of the assembled map. This is exactly the native AbstractMeasure carrier; no new definition of a generic measure or completed group algebra is needed.
3. The projection formulas follow from coeff_mk. Extensionality of power series and of native continuous linear maps proves uniqueness. The algebraic and continuity API comes from this construction.

**Prerequisites:** `DirichletPadicLFunctions:L4/positive-eisenstein-measure`, `mathlib:AbstractMeasure`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`, `mathlib:PowerSeries.ext`, `mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`.

**Uses:**

- RJW Theorem8.2(b): Packages all positive coefficient specializations in one actual continuous linear map, so its equality with the positive modular q-expansion can be stated as a series equality.
- RJW Remark8.3(1) and DirichletPadicLFunctions:L4: Uniform coefficient bounds and congruences make the positive-coefficient weight variation precise. The constant-term and tame-character extensions remain separate targets.

**API:**

- `positiveEisensteinSeries_coeff` (projection): For n≥0, coefficient n of E⁺(f) is zero when n=0 and A_n(f) when n>0. This item is promoted to positive-eisenstein-series-coeff.
- `positiveEisensteinSeries_coeff_zero` (simp): Coefficient zero of E⁺(f) is zero for every f.
- `positiveEisensteinSeries_coeff_pos` (projection): For n>0, coefficient n of E⁺(f) is A_n(f).
- `positiveEisensteinSeries_zero` (simp): E⁺(0)=0.
- `positiveEisensteinSeries_add` (simp): E⁺(f+g)=E⁺(f)+E⁺(g).
- `positiveEisensteinSeries_smul` (simp): E⁺(a f)=a E⁺(f) for a∈Z.
- `positiveEisensteinSeries_continuous` (structure): E⁺:C(U,Z)→Z[[q]] is continuous for the compact-open and coefficientwise topologies.
- `positiveEisensteinSeries_unique` (extensionality): Any native Z[[q]]-valued measure M with coefficient zero equal to zero and coefficient n equal to A_n on every test for every n>0 equals E⁺.

**Unit tests:**

- `SuggestedPositiveSeriesTests.zero_input` (computation): At p=2, E⁺(0)=0.
- `SuggestedPositiveSeriesTests.constant_coefficient` (computation): At p=2 and every f∈C(U,Z), coefficient zero of E⁺(f) is zero.
- `SuggestedPositiveSeriesTests.first_coefficient` (computation): At p=3, coefficient one of E⁺(f) is f(1).
- `SuggestedPositiveSeriesTests.prime_coefficient` (computation): At p=3, coefficient three of E⁺(f) is f(1), so it need not vanish.
- `SuggestedPositiveSeriesTests.dyadic_weight_four` (computation): At p=2, coefficient six of E⁺(x³) is 1³+3³=28.
- `SuggestedPositiveSeriesTests.dyadic_series_precision` (characterisation): At p=2, the constant series 8 divides E⁺(x⁵)−E⁺(x).
- `SuggestedPositiveSeriesTests.tame_congruence_insufficient` (non-example): At p=5, the constant series 25 does not divide E⁺(x⁷)−E⁺(x³): coefficient two of the difference is 120.
- `SuggestedPositiveSeriesTests.omitted_constant_is_nonzero` (non-example): At p=2, the actual weight-four p-stabilized modular form has constant coefficient −7/240 in ℂ, while E⁺(x³) has constant coefficient zero in ℤ₂.

**Acceptance:** Construct the map using the actual native continuous-dual and PowerSeries types. Maintain zero only as the positive truncation boundary; retain the nonzero classical constant in the modular comparison.

**Sources:** RJW-published, §8, Definition 8.1, Theorem 8.2 and Remark 8.3(1), printed159–160 / PDF60–61; fresh reading 27 September2026. The positive Dirac coefficients and exponent k−1 are explicit in the source. Their assembly into a native continuous linear map, the uniform coefficient bounds and series divisibility are worker deductions. The actual constant pseudomeasure and the geometric weight family remain outside this positive-part adapter.

### Coefficients of the positive q-expansion

`DirichletPadicLFunctions:L4/positive-eisenstein-series-coeff` — `positiveEisensteinSeries_coeff` (lemma).

For every f∈C(U,Z) and n≥0, coefficient n of E⁺(f) equals zero for n=0, and equals A_n(f) for n>0.

**Hypotheses:** p is any prime, including 2; Z=ℤ_p and U=Z× with their native topologies. A_n is the already planned positiveEisensteinMeasure for n>0. C(U,Z) has its compact-open topology and supremum norm. Z[[q]] has the existing coefficientwise topology PowerSeries.WithPiTopology; no norm on that power-series carrier is asserted.

**Proof outline:**

1. Unfold only the coefficient assembly and apply PowerSeries.coeff_mk. Split n=0 from n>0. The positive index passed to A_n carries the proof n>0.

**Prerequisites:** `DirichletPadicLFunctions:L4/positive-eisenstein-series`, `mathlib:PowerSeries.coeff_mk`.

**Acceptance:** Use this promoted projection node in all later coefficient arguments; do not depend on an unlisted API item.

**Sources:** RJW-published, §8, Definition 8.1, Theorem 8.2 and Remark 8.3(1), printed159–160 / PDF60–61; fresh reading 27 September2026. The positive Dirac coefficients and exponent k−1 are explicit in the source. Their assembly into a native continuous linear map, the uniform coefficient bounds and series divisibility are worker deductions. The actual constant pseudomeasure and the geometric weight family remain outside this positive-part adapter.

### Uniform bound for all q-coefficients

`DirichletPadicLFunctions:L4/positive-eisenstein-series-bound` — `positiveEisensteinSeries_coeff_norm_le` (lemma).

For every f∈C(U,Z) and n≥0, |coeff_n(E⁺(f))|_p≤‖f‖∞. Thus all positive coefficients are bounded by the same constant.

**Hypotheses:** p is any prime, including 2; Z=ℤ_p and U=Z× with their native topologies. A_n is the already planned positiveEisensteinMeasure for n>0. C(U,Z) has its compact-open topology and supremum norm. Z[[q]] has the existing coefficientwise topology PowerSeries.WithPiTopology; no norm on that power-series carrier is asserted.

**Proof outline:**

1. Apply positive-eisenstein-series-coeff. At n=0 use nonnegativity of the norm; at n>0 apply positive-eisenstein-evaluation-bound.

**Prerequisites:** `DirichletPadicLFunctions:L4/positive-eisenstein-series-coeff`, `DirichletPadicLFunctions:L4/positive-eisenstein-evaluation-bound`.

**Acceptance:** This is a coefficientwise inequality, with no assertion that the coefficientwise topology is a supremum-norm topology.

**Sources:** RJW-published, §8, Definition 8.1, Theorem 8.2 and Remark 8.3(1), printed159–160 / PDF60–61; fresh reading 27 September2026. The positive Dirac coefficients and exponent k−1 are explicit in the source. Their assembly into a native continuous linear map, the uniform coefficient bounds and series divisibility are worker deductions. The actual constant pseudomeasure and the geometric weight family remain outside this positive-part adapter.

### Uniform test-function congruences

`DirichletPadicLFunctions:L4/positive-eisenstein-series-test-congruence` — `positiveEisensteinSeries_test_congr` (lemma).

Let r≥0 and f,g∈C(U,Z). If pʳ divides f(u)−g(u) in Z for every u∈U, then the constant series C(pʳ) divides E⁺(f)−E⁺(g) in Z[[q]].

**Hypotheses:** p is any prime, including 2; Z=ℤ_p and U=Z× with their native topologies. A_n is the already planned positiveEisensteinMeasure for n>0. C(U,Z) has its compact-open topology and supremum norm. Z[[q]] has the existing coefficientwise topology PowerSeries.WithPiTopology; no norm on that power-series carrier is asserted.

**Proof outline:**

1. At positive degree use positive-eisenstein-series-coeff and positive-eisenstein-evaluation. Subtract the two finite sums. Every summand is divisible by pʳ by hypothesis, so Finset.dvd_sum gives divisibility of each coefficient. Degree zero vanishes.
2. Choose a quotient coefficient b_n for each coefficient difference. Set B=PowerSeries.mk(b_n). PowerSeries.coeff_C_mul and PowerSeries.ext give E⁺(f)−E⁺(g)=C(pʳ)B. This elementary coefficientwise argument requires no continuity or uniform choice for the quotient coefficients.

**Prerequisites:** `DirichletPadicLFunctions:L4/positive-eisenstein-series-coeff`, `DirichletPadicLFunctions:L4/positive-eisenstein-evaluation`, `mathlib:Finset.dvd_sum`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`, `mathlib:PowerSeries.coeff_C_mul`, `mathlib:PowerSeries.ext`.

**Acceptance:** Allow r=0; then divisibility by one is automatic. The conclusion is in the actual integral power-series ring and has no unmentioned denominator.

**Sources:** RJW-published, §8, Definition 8.1, Theorem 8.2 and Remark 8.3(1), printed159–160 / PDF60–61; fresh reading 27 September2026. The positive Dirac coefficients and exponent k−1 are explicit in the source. Their assembly into a native continuous linear map, the uniform coefficient bounds and series divisibility are worker deductions. The actual constant pseudomeasure and the geometric weight family remain outside this positive-part adapter.

### Weight congruences for the positive series

`DirichletPadicLFunctions:L4/positive-eisenstein-series-weight-congruence` — `positiveEisensteinSeries_weight_congr` (theorem).

For r≥1 and e,e′≥0 with e≡e′ modulo p^(r−1)(p−1), C(pʳ) divides E⁺(x^e′)−E⁺(x^e) in Z[[q]]. This includes p=2. A classical weight k uses e=k−1.

**Hypotheses:** p is any prime, including 2; Z=ℤ_p and U=Z× with their native topologies. A_n is the already planned positiveEisensteinMeasure for n>0. C(U,Z) has its compact-open topology and supremum norm. Z[[q]] has the existing coefficientwise topology PowerSeries.WithPiTopology; no norm on that power-series carrier is asserted.

**Proof outline:**

1. For n>0, the promoted coefficient formula reduces the assertion to positive-eisenstein-weight-congruence. The zero coefficient vanishes.
2. Assemble quotient coefficients with PowerSeries.mk and conclude by coeff_C_mul and PowerSeries.ext, exactly as in the preceding divisibility argument. This uses the already planned all-prime moment congruence, and does not posit a topological generator of ℤ₂×.

**Prerequisites:** `DirichletPadicLFunctions:L4/positive-eisenstein-series-coeff`, `DirichletPadicLFunctions:L4/positive-eisenstein-weight-congruence`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`, `mathlib:PowerSeries.coeff_C_mul`, `mathlib:PowerSeries.ext`.

**Acceptance:** At p=2,e=1,e′=5,r=3 obtain divisibility by8. At p=5,e=3,e′=7, coefficient two is120, divisible by5 but not25; congruence modulo p−1 alone cannot give the stronger precision.

**Sources:** RJW-published, §8, Definition 8.1, Theorem 8.2 and Remark 8.3(1), printed159–160 / PDF60–61; fresh reading 27 September2026. The positive Dirac coefficients and exponent k−1 are explicit in the source. Their assembly into a native continuous linear map, the uniform coefficient bounds and series divisibility are worker deductions. The actual constant pseudomeasure and the geometric weight family remain outside this positive-part adapter.

### Invariance of coefficients under multiplication by p

`DirichletPadicLFunctions:L4/positive-eisenstein-series-index-invariance` — `positiveEisensteinSeries_coeff_mul_p` (lemma).

For every n≥0 and f∈C(U,Z), coeff_(pn)(E⁺(f))=coeff_n(E⁺(f)).

**Hypotheses:** p is any prime, including 2; Z=ℤ_p and U=Z× with their native topologies. A_n is the already planned positiveEisensteinMeasure for n>0. C(U,Z) has its compact-open topology and supremum norm. Z[[q]] has the existing coefficientwise topology PowerSeries.WithPiTopology; no norm on that power-series carrier is asserted.

**Proof outline:**

1. At n=0 both sides are the same zero coefficient. At n>0, prime positivity implies pn>0. Apply positive-eisenstein-series-coeff twice and positive-eisenstein-remove-p.

**Prerequisites:** `DirichletPadicLFunctions:L4/positive-eisenstein-series-coeff`, `DirichletPadicLFunctions:L4/positive-eisenstein-remove-p`.

**Acceptance:** The q^p coefficient equals f(1), not zero. This coefficient identity introduces no generic U_p or Hecke operator.

**Sources:** RJW-published, §8, Definition 8.1, Theorem 8.2 and Remark 8.3(1), printed159–160 / PDF60–61; fresh reading 27 September2026. The positive Dirac coefficients and exponent k−1 are explicit in the source. Their assembly into a native continuous linear map, the uniform coefficient bounds and series divisibility are worker deductions. The actual constant pseudomeasure and the geometric weight family remain outside this positive-part adapter.

### Joint integral series comparison with the modular form

`DirichletPadicLFunctions:L4/positive-eisenstein-series-modular-comparison` — `positiveEisensteinSeries_modular` (comparison).

For even k≥4 there exists a unique Q∈ℤ[[q]] such that its coefficient map to ℂ equals the actual q-expansion of pStabilizedEisenstein(p,k) minus the constant series of that expansion’s constant coefficient, and its coefficient map to Z equals E⁺(x^(k−1)). Explicitly Q₀=0 and Q_n=Σ_{d∣n,p∤d}d^(k−1) for n>0.

**Hypotheses:** p is any prime, including 2; Z=ℤ_p and U=Z× with their native topologies. A_n is the already planned positiveEisensteinMeasure for n>0. C(U,Z) has its compact-open topology and supremum norm. Z[[q]] has the existing coefficientwise topology PowerSeries.WithPiTopology; no norm on that power-series carrier is asserted.

**Proof outline:**

1. For each positive degree take the unique common integer supplied by positive-eisenstein-modular-comparison. Set degree zero to zero and use PowerSeries.mk to assemble these integers into Q. The supplier identifies each positive coefficient with the displayed divisor sum.
2. For the complex comparison, apply PowerSeries.coeff_map and PowerSeries.ext. At degree zero subtraction of the constant series gives zero; at every positive degree coeff_C_of_ne_zero vanishes and the existing common-integer comparison supplies equality.
3. For the p-adic comparison, use positive-eisenstein-series-coeff and the other equality from the same integer comparison; again degree zero is zero. Injectivity of the integer embedding into ℂ and PowerSeries.map_injective give uniqueness.
4. The removed coefficient is the actual rational zeta constant from p-stabilized-zeta-constant. This theorem compares whole positive power series through ℤ; it does not postulate an embedding of ℂ into a p-adic field and does not supply the missing constant pseudomeasure.

**Prerequisites:** `DirichletPadicLFunctions:L4/positive-eisenstein-series-coeff`, `DirichletPadicLFunctions:L4/positive-eisenstein-modular-comparison`, `DirichletPadicLFunctions:L4/p-stabilized-zeta-constant`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`, `mathlib:PowerSeries.ext`, `mathlib:PowerSeries.coeff_map`, `mathlib:PowerSeries.coeff_zero_C`, `mathlib:PowerSeries.coeff_C_of_ne_zero`, `mathlib:PowerSeries.map_injective`.

**Acceptance:** At p=2,k=4 the omitted constant is−7/240, while Q₆=28. No equality with the full untruncated modular expansion is asserted.

**Sources:** RJW-published, §8, Definition 8.1, Theorem 8.2 and Remark 8.3(1), printed159–160 / PDF60–61; fresh reading 27 September2026. The positive Dirac coefficients and exponent k−1 are explicit in the source. Their assembly into a native continuous linear map, the uniform coefficient bounds and series divisibility are worker deductions. The actual constant pseudomeasure and the geometric weight family remain outside this positive-part adapter.

### Validation and remaining work

The full suggested file compiles with zero errors and 164 expected placeholder
warnings. The actual PMIA supplier file is freshly compiled; all reached
Mathlib sources match the pinned source bytes and the 19 reached Tau Ceti
modules were rebuilt from the pin without warnings. A separate baseline-only
scratch file implements the native assembly and proves its coefficient formula,
uniqueness, constant-series divisibility, ultrametric finite-sum bound and finite
congruence. Those five proofs and the assembly construction contain no
placeholders and compile without errors or warnings. They validate the native
interfaces; none of the 80 roadmap nodes is claimed implemented.

The exact arithmetic harness passes 46,468 assertions for p=2,3,5,7 and
coefficients through degree100. It tests uniform evaluation bounds, pointwise
test congruences, weight congruences, index invariance and integer comparison
with the independently specified classical divisor-sum and p-stabilization
formulas. Controls retain the nonzero q^p coefficient, weight shift,
insufficiency of tame congruence for precision25, dyadic precision8 and nonzero
classical constant. These are finite scalar regressions, not proofs about
infinite series or topology.

The continuation freshly downloaded the published paper, matching the recorded
SHA256, and read physical PDF60–61 in full. This covers Definition8.1,
Theorem8.2, Remark8.3(1) and the beginning of Remark8.3(2); earlier reading scope
remains historical provenance. The eight new adapters are deductions from the
positive coefficient formula, not additional named results attributed to the
paper. All nine source findings are preserved; no new source error is alleged.

Resume with the exact supplier request for the actual integral-measure/completed
unit-group algebra comparison, or with the arithmetic localization and A₀ after
that interface is supplied. The admissible evaluation domain and division by2
at p=2 must be made explicit. Positive-series assembly does not resolve those
constant-term, tame-character or geometric-family targets. The other L0–L3
coverage and gap entries remain unchanged.
