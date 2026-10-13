# Quantitative logarithmic forms

This part of Diophantine approximation and transcendence constructs the interfaces
needed for effective lower bounds on linear forms in chosen logarithms. The complex
route must support algebraic coefficients of bounded degree and a nonzero
inhomogeneous term. The finite-place route must support algebraic inputs, arbitrary
chosen primes, dependent logarithms and nonunits. Both routes expose their height,
degree, denominator and branch costs rather than hiding them in an unnamed estimate.

The qualitative material belongs to the preceding DT.3 development: Hermite,
Lindemann–Weierstrass, Gelfond–Schneider, Schneider–Lang and qualitative Baker,
together with their auxiliary integrals and functions. Their existing target ids
remain the interfaces. This part imports them and adds the quantitative proof
machinery. In particular it does not introduce another algebraic closure, number
field, height, valuation, completion, Tate algebra, scheme or Kummer-character carrier.

The central complex route is

\[
\text{Laurent degree and transverse jets}\longrightarrow
\text{relative multiplicity estimate}\longrightarrow
\text{interpolation rank}\longrightarrow
\text{one determinant with incompatible bounds}\longrightarrow
\text{fixed-logarithm Baker bounds}.
\]

The finite-place route is

\[
\text{deep exp/log and normal series}\longrightarrow
\text{Hermite extrapolation and Liouville}\longrightarrow
\text{auxiliary-grid contraction}\longrightarrow
\text{Kummer descent}\longrightarrow
\text{generated-field and algebraic-field consumers}.
\]

Every numerical bound below is a target with the stated prerequisites. The
unresolved proof obligations at the end identify where its proof still needs
checking. The fixed-logarithm complex consumer uses the conservative constant
derived here; it does not depend on the sharper Matveev or LMN constants. The
numeric Yu consumer depends on the terminal, parameter, descent and corrected
generated-field comparison obligations.

## Conventions and end interfaces

Heights are absolute. Write
\(H(x)=\mathrm{NumberField.absMulHeight}_1(x)\) and
\(h(x)=\log H(x)\), using the native characteristic-zero-field definitions only
on algebraic inputs. For a number field of degree \(D\), relative logarithmic
height is \(D h(x)\). Projective height \(h(1:x_1:\cdots:x_r)\) is distinct
from the maximum of scalar heights. An embedding into a larger field preserves
absolute height; it changes relative height. The integer height convention is
\(h(a)=\log\max(1,|a|)\), including zero.

A chosen complex logarithm \(\lambda_j\) is fixed by
\(\exp\lambda_j=\alpha_j\); it is not silently replaced by the principal
branch. The nonhomogeneous form is
\(\Lambda=\beta_0+\sum_j\beta_j\lambda_j\).
For multiplicative consumers the integer correction by \(2\pi i\) is explicit.
The letter \(e\) in expressions such as \((eB)^{-C}\) is the real exponential
of 1. In local-field formulas \(e\) denotes the absolute ramification index;
these uses occur in separate interfaces.

At a prime \(P\) above \(p\), integer prime-ideal order and analytic order are
related by \(v_p(x)=\operatorname{ord}_P(x)/e_P\). Thus
\(|x|_p=p^{-v_p(x)}\), while the product-formula height place is
\((p^{f_P})^{-\operatorname{ord}_P(x)}\). The strict exp/log threshold is
\(v_p(x)>1/(p-1)\), or \((p-1)\operatorname{ord}_P(x)>e_P\).
For zero, order is infinite. Factorial-normalized jets always include division
by the indicated factorial.

In the additive-torus argument \(G_d=K^d\times K^\times\), and torus degree
means an absolute Laurent exponent bound. In Yu interpolation \(n\ge2\),
\(q=3\) at \(p=2\) and \(q=2\) otherwise. Indices such as \(V_{n-1}\)
mean an indexed height parameter, not subtraction from \(V_n\).

The fixed-logarithm Baker interface asserts an effective \(C>0\) for fixed
logarithms and a fixed positive coefficient-degree bound: every nonzero form
with coefficient heights at most \(B\ge1\) satisfies
\(|\Lambda|\ge(eB)^{-C}\). It includes \(\beta_0\).
The explicit pointwise estimate uses
\(C_{\mathrm{safe}}(m)=2^{m+25}m^{4m+10}\); the sum-normalized specialization
uses \(C(m)=2^{m+25}m^{3m+9}\). Their distinction is part of the interface.

The finite-place end interface first states the bound over
\(K_0=\mathbf Q(\alpha_1,\ldots,\alpha_n)\), with its actual residue degree.
A larger consumer field carries a specified prime above the base prime and
the relative ramification factor. Length one uses the separate one-power
argument. Padding by \(\alpha=1,b=0\) is valid only after full-Kummer assumptions
have been removed.

## Existing foundations and ownership

The baseline statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The exact declarations below
are imports, not construction targets.

| Declaration | Module | What it supplies |
| --- | --- | --- |
| `mathlib:Height.logHeight₁_inv` | `Mathlib/NumberTheory/Height/Basic.lean` | Relative logarithmic height is invariant under inversion, including zero. |
| `mathlib:Height.logHeight₁_pow` | `Mathlib/NumberTheory/Height/Basic.lean` | The relative logarithmic height of x^n is n times that of x. |
| `mathlib:Height.logHeight₁_zpow` | `Mathlib/NumberTheory/Height/Basic.lean` | Integer powers multiply relative logarithmic height by the absolute exponent. |
| `mathlib:Height.logHeight₁_mul_le` | `Mathlib/NumberTheory/Height/Basic.lean` | The relative height of a product is at most the sum of the heights. |
| `mathlib:Height.logHeight₁_add_le` | `Mathlib/NumberTheory/Height/Basic.lean` | The sum bound has totalWeight K times log 2 as its additive constant. |
| `mathlib:NumberField.totalWeight_eq_finrank` | `Mathlib/NumberTheory/Height/NumberField.lean` | The total weight of the number-field height equals the rational degree. |
| `mathlib:Rat.logHeight₁_eq_log_max` | `Mathlib/NumberTheory/Height/NumberField.lean` | For reduced a/b, relative logarithmic height is log(max(|a|,b)). |
| `mathlib:NumberField.mulHeight₁_eq` | `Mathlib/NumberTheory/Height/NumberField.lean` | The relative multiplicative height is the product of weighted infinite-place maxima and finite-place maxima. |
| `mathlib:MvPolynomial` | `Mathlib/Algebra/MvPolynomial/Basic.lean` | Multivariate polynomial carrier over a commutative semiring, built from finite-support exponent vectors. |
| `mathlib:AddMonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | Finite-support coefficients with convolution, used for Laurent monomials with an integer exponent. |
| `mathlib:Complex.dist_le_mul_div_pow_of_mapsTo_ball_of_isLittleO` | `Mathlib/Analysis/Complex/Schwarz.lean` | A holomorphic map little-o of the n-th power at the centre has the radius-ratio bound to power n+1. |
| `mathlib:AnalyticAt.exists_eventuallyEq_sum_add_pow_mul` | `Mathlib/Analysis/Analytic/Order.lean` | Taylor expansion through degree n−1 with analytic remainder divisible by z^n. |
| `mathlib:padicValNat_factorial` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | Legendre’s finite sum formula for the p-adic order of n!, with Nat.log p n<b. |
| `mathlib:sub_one_mul_padicValNat_factorial_lt_of_ne_zero` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | For n≠0, (p−1)vp(n!)<n, the strict convergence estimate needed for a scaled exponential. |
| `mathlib:MvPowerSeries.IsRestricted` | `Mathlib/RingTheory/MvPowerSeries/Restricted.lean` | The coefficient norm, weighted by a polyradius, tends to zero along the cofinite filter. |
| `tauceti:TauCeti.Huber.restrictedMvPowerSeriesSubring` | `TauCeti/RingTheory/Huber/Restricted/PowerSeries.lean` | The existing subring of multivariate power series whose coefficients tend to zero. |
| `tauceti:TauCeti.Huber.mem_restrictedMvPowerSeriesSubring` | `TauCeti/RingTheory/Huber/Restricted/PowerSeries.lean` | Membership in the restricted subring is precisely the restrictedness predicate. |
| `mathlib:autEquivRootsOfUnity` | `Mathlib/FieldTheory/KummerExtension.lean` | For an irreducible binomial over a field containing a primitive n-th root, the Galois group of its splitting field is isomorphic to the n-th roots of unity. |
| `mathlib:X_pow_sub_C_irreducible_iff_of_prime_pow_of_ne_two` | `Mathlib/FieldTheory/KummerExtension.lean` | For an odd prime q and positive k, irreducibility of X^(q^k)−a is equivalent to a not being a q-th power. |
| `mathlib:X_pow_sub_C_irreducible_iff_of_prime` | `Mathlib/FieldTheory/KummerPolynomial.lean` | For prime q, X^q−a is irreducible exactly when a is not a q-th power in the base field. |
| `mathlib:X_pow_mul_sub_C_irreducible` | `Mathlib/FieldTheory/KummerExtension.lean` | Irreducibility of X^m−a plus irreducibility of X^n minus each root over its simple adjunction gives irreducibility of X^(nm)−a. |
| `mathlib:NumberField.absMulHeight₁` | `Mathlib/NumberTheory/Height/NumberField.lean` | Native absolute multiplicative height on any characteristic-zero field: relative height in Q(x) to the reciprocal field degree when x is algebraic; value 1 otherwise. |
| `mathlib:NumberField.absLogHeight₁` | `Mathlib/NumberTheory/Height/NumberField.lean` | Logarithm of the native absolute multiplicative height; used only on algebraic inputs here. |

Native absolute heights and their existing DT.0 normalization targets are
reused. ArithmeticHeights owns extension invariance, Mahler measure,
Northcott/Kronecker and relative Siegel. Its integer-coefficient relative
Siegel interface is consumed through DT.0. The effective house estimate is
an ArithmeticHeights Part II need, not another height definition.

LocalFieldsRamification owns the local exponential, logarithm, strict inverse
equivalence and Teichmüller lifts. DT.3 derives the order isometry used by the
normal-function estimates from their series and Legendre bounds.
NumberFieldArithmetic owns canonical completion embeddings, lies-over data,
ramification and residue degrees. GlobalNumberFields owns the product formula
and its finite-place normalization. SchemeAndStackFoundations supplies the
multigraded Hilbert and complete-intersection foundation requested below.

The current Tau Ceti Kummer modules use native field extensions, automorphisms,
roots of unity and binomial polynomials. They provide cyclic-extension
infrastructure; they do not supply the simultaneous radical basis and bounded
logarithmic saturation required here. The multi-radical target reuses those
carriers. Character constructions with an integrally closed base condition are
not used as a general number-field replacement.

The precise supplier contracts are:

- **`SchemeAndStackFoundations:SF.0`.** SchemeAndStackFoundations, Part II: multigraded Hilbert polynomial for a finite-type quotient with a two-parameter filtration, its degree equals Krull dimension, additivity of the leading form with primary-component lengths, unmixedness of a complete intersection and regular-sequence degree bound. Apply to K[X1,…,Xd,Y,Z]/(YZ−1) with the bounded Laurent filtration. Use existing ideals and quotient rings, not a new scheme carrier. Consumers: [Filtered coordinates on an additive group times a torus](#filtered-additive-torus-coordinate-model), [Leading form of the filtered Hilbert polynomial](#laurent-hilbert-leading-form), [Subgroups, tangent spaces and dimensions in the one-torus case](#additive-one-torus-subgroups), [Degree bound for ideals added to a subgroup ideal](#laurent-complete-intersection-degree-bound), [Wüstholz’s transverse multiplicity inequality](#transverse-jet-multiplicity-bound), [Roy’s relative multiplicity estimate for one torus](#roy-relative-multiplicity-estimate-one-torus).
- **`tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.** Import LocalFieldsRamification Layer 1 localExponential/localLogarithm and the strict exp/log equivalence (p−1)i>e on the native complete discretely valued field, Teichmüller lifts and the residue multiplicative group. The DT.3 order-isometry adapter is derived from their series and Legendre bounds. Consumers: [Sharp deep-unit exponential and logarithm interface](#deep-unit-exp-log-adapter), [An explicit one-power bound over a number field](#yu-one-power-explicit-bound), [Torsion and deep-unit coordinates for Yu interpolation](#yu-torsion-and-deep-unit-coordinates), [Yu’s generated-field bound with the residue-degree correction](#yu-generated-field-general-bound).
- **`tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.** Import NumberFieldArithmetic Layer 5: canonical completion algebra homomorphisms for P above P0, finite extension and complete-field structure at the chosen prime, absolute and relative ramification and residue-degree identifications, ordP(x)=e(P/P0)ordP0(x) on the base field, and the resulting independence of ordP/e from the consumer field. Native primes and lies-over data are retained. Consumers: [Prime-ideal order and the local analytic normalization](#finite-place-normalization-adapter), [An explicit one-power bound over a number field](#yu-one-power-explicit-bound), [Yu’s generated-field bound with the residue-degree correction](#yu-generated-field-general-bound).
- **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-0-places-completions-and-the-product-formula`.** Import GlobalNumberFields Layer 0 product formula with finite-place norm |x|P=(p^f)^(-ordP x); compare this height place to the analytic p-normalized value p^(-ordP x/e). The two normalizations must not be interchanged in Liouville or height products. Consumers: [Prime-ideal order and the local analytic normalization](#finite-place-normalization-adapter), [Finite-place Liouville for integer polynomials](#finite-place-liouville-adapter).
- **`DiophantineApproximationAndTranscendence:DT.0`.** DT.0 must import ArithmeticHeights Layer 5.6 integer-coefficient relative Siegel: for m algebraic rows in a degree-D field and N>mD integer unknowns, a nonzero rational-integer solution bounded by the product of Euclidean row lengths and separate input heights with exponent D/(N−mD). Its relative discriminant factor is 1 over Q. ArithmeticHeights PR #287 is an upstream plan, not a declaration at the pinned libraries. Consumers: [Polynomial rows in the relative Siegel bound](#relative-siegel-polynomial-row-adapter).
- **`DiophantineApproximationAndTranscendence:DT.0`.** ArithmeticHeights, Part II, consumed through DT.0: the effective house estimate log house(α)>1/(2d²) and h(α)>1/(2d³) for a nonzero non-torsion algebraic integer of degree d, including large-degree and every small-degree numerical case. Use DT.0 height/Mahler-measure comparison and existing absolute-height carriers. Consumers: [The effective house input used in the short-relation bound](#effective-house-input-adapter).
- **`tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.** Import LocalFieldsRamification Layer 2 residue correspondence and the finite unramified-extension lattice, together with Layer 1 Teichmüller roots. For a finite extension E/Q2 of actual residue degree f0, E(ζ3)/E is unramified and the absolute residue degree of E(ζ3) is lcm(f0,2). This is a consequence of the existing residue-field extension/compositum contract, not another unramified-field construction. Consumers: [Yu’s generated-field bound with the residue-degree correction](#yu-generated-field-general-bound).

## Height interface

These adapters divide out the field degree once and retain it where Liouville needs it. Polynomial length is a sum of coefficient magnitudes; replacing it by a maximum loses the determinant cost.

<a id="absolute-height-calculus-adapter"></a>

### Absolute-height calculus from relative heights

Target `DiophantineApproximationAndTranscendence:DT.3/absolute-height-calculus-adapter` (comparison).

For a number field K of degree D and x,y∈K, h(x)=NumberField.absLogHeight₁ x satisfies h(x⁻¹)=h(x), h(x^n)=|n|h(x) for n∈ℤ, h(xy)≤h(x)+h(y), and h(x+y)≤log 2+h(x)+h(y). For a∈ℤ, h(a)=log(max(1,|a|)). The same values hold after a characteristic-zero field embedding.

Hypotheses and conventions:

- K is a number field; D=[K:ℚ]>0.
- For an ambient field version, all arguments are algebraic over ℚ.

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.absHeight_inv` | other | h(x⁻¹)=h(x). |
| `LogarithmicForms.absHeight_zpow` | other | h(x^n)=\|n\|h(x), n∈ℤ. |
| `LogarithmicForms.absHeight_mul_le` | other | h(xy)≤h(x)+h(y). |
| `LogarithmicForms.absHeight_add_le` | other | h(x+y)≤log 2+h(x)+h(y). |
| `LogarithmicForms.absHeight_intCast` | other | h(a)=log(max(1,\|a\|)) for a∈ℤ. |

Checks of the definition or construction:

- **`LogarithmicForms.height_half`** (computed): h(1/2)=log 2.
- **`LogarithmicForms.height_zero`** (degenerate): h(0)=0.
- **`LogarithmicForms.height_quadratic_field`** (compatibility): h_{ℚ(i)}(2)=h_ℚ(2)=log 2.
- **`LogarithmicForms.height_product_cancel`** (non-example): h(2·1/2)=0≤2 log 2.

Uses:

- Waldschmidt, Proposition 9.18 and Theorem 9.1: Controls βj/βm and field-independent heights.
- Yu 1990, Lemmas 1.3–1.5 and §3: Controls algebraic evaluations and the heights of roots in the descent.

Proof or construction:

1. Use DT.0’s extension normalization to write h_K(x)=Height.logHeight₁ x/D.
2. Divide the pinned inversion, power, product and sum formulas by D; NumberField.totalWeight_eq_finrank cancels D in the sum constant.
3. Restrict an integer to ℚ and use Rat.logHeight₁_eq_log_max; transport by DT.0’s embedding comparison.

Prerequisites: `DiophantineApproximationAndTranscendence:DT.0/abs-mul-height-eq-rpow`, `DiophantineApproximationAndTranscendence:DT.0/mul-height-algebra-map`, `mathlib:Height.logHeight₁_inv`, `mathlib:Height.logHeight₁_zpow`, `mathlib:Height.logHeight₁_mul_le`, `mathlib:Height.logHeight₁_add_le`, `mathlib:NumberField.totalWeight_eq_finrank`, `mathlib:Rat.logHeight₁_eq_log_max`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §3.2, Property 3.3, pp.75–76. The absolute logarithmic height has the inverse, power, product and sum inequalities used to normalize coefficients.

Acceptance:

- Over ℚ and ℚ(i), h(2)=log 2; the relative height over ℚ(i) is 2 log 2.
- The inverse and integer formulas handle 0 without assuming it is a unit.

<a id="absolute-height-conjugate-size-adapter"></a>

### Absolute height and a chosen conjugate

Target `DiophantineApproximationAndTranscendence:DT.3/absolute-height-conjugate-size-adapter` (comparison).

For x∈K, K a number field of degree D, and σ:K→ℂ an embedding, log(max(1,|σx|))≤D h(x). For x≠0 this gives exp(−D h(x))≤|σx|≤exp(D h(x)).

Hypotheses and conventions:

- K is a number field and σ is a field embedding.
- The lower bound is asserted only when x≠0.

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.log_conjugate_le` | other | log(max(1,\|σx\|))≤D h(x). |
| `LogarithmicForms.conjugate_norm_bounds` | other | x≠0 implies exp(−Dh(x))≤\|σx\|≤exp(Dh(x)). |

Proof or construction:

1. The infinite-place factor containing σ in NumberField.mulHeight₁_eq is at least max(1,|σx|), and every other factor is at least 1.
2. Apply DT.0’s H_relative=H_absolute^D comparison and take logarithms.
3. Apply the upper bound to x⁻¹, using absolute-height-calculus-adapter.

Prerequisites: `DiophantineApproximationAndTranscendence:DT.0/abs-mul-height-eq-rpow`, `DiophantineApproximationAndTranscendence:DT.0/mul-height-algebra-map`, [Absolute-height calculus from relative heights](#absolute-height-calculus-adapter), `mathlib:NumberField.mulHeight₁_eq`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §3.5.1, equation (3.13), pp.82–83. The product-formula height bounds the size and reciprocal size at any chosen complex embedding.

Acceptance:

- For x=2∈ℚ the upper bound is equality.
- For x=0 the logarithmic upper bound is valid, while a positive reciprocal-size lower bound is excluded.

<a id="polynomial-length-and-block-degree"></a>

### Polynomial length and block degrees

Target `DiophantineApproximationAndTranscendence:DT.3/polynomial-length-and-block-degree` (definition).

For an integer polynomial P in finitely many variables partitioned into blocks, length(P)=Σκ |coeffκ(P)|. Its block-degree bound N means that every supported monomial has total exponent at most Nj in block j. For a Laurent polynomial, use the same finite coefficient sum; torus block bounds are absolute exponent bounds.

Hypotheses and conventions:

- A finite variable set and a specified partition into blocks; coefficients are integers.

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.length_zero` | simp | length(0)=0. |
| `LogarithmicForms.length_mul_le` | other | length(PQ)≤length(P)length(Q). |
| `LogarithmicForms.blockDegree_mul` | compatibility | N and M bounds give an N+M bound for PQ. |
| `LogarithmicForms.length_eval_bound` | other | \|P(x)\|≤length(P)∏j max(1,maxblock \|xi\|)^Nj. |

Checks of the definition or construction:

- **`LogarithmicForms.length_cancel`** (computed): length(3X−3X+2)=2.
- **`LogarithmicForms.length_two_terms`** (non-example): length(X−1)=2, not 1.
- **`LogarithmicForms.laurent_inverse_degree`** (compatibility): Y⁻³ has torus bound 3 and length 1.

Uses:

- Waldschmidt, Lemma 3.15 and §9.3.2: Measures cleared interpolation determinants.
- Yu 1990, Lemma 1.3: Measures the polynomial evaluated in a number field.

Proof or construction:

1. Use the existing finite-support coefficients of MvPolynomial, or AddMonoidAlgebra for Laurent monomials.
2. Record addition, multiplication and coefficientwise evaluation inequalities; the block bounds add under multiplication.

Prerequisites: `mathlib:MvPolynomial`, `mathlib:AddMonoidAlgebra`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §3.2, p.76; §3.5.2, Proposition 3.14, pp.83–84; §3.5.5, Lemma 3.15, pp.85–86. These coefficient sums and block bounds give the arithmetic cost of a determinant.

Acceptance:

- The bounds use the sum of absolute coefficients, not their maximum.
- Torus inverse monomials carry their own absolute exponents.

<a id="multiblock-liouville-height-adapter"></a>

### Multiblock Liouville inequality in absolute height

Target `DiophantineApproximationAndTranscendence:DT.3/multiblock-liouville-height-adapter` (comparison).

Let P∈ℤ[blocks] have length L≥1 and block bounds Nj. Let each nonempty block γj consist of elements of a number field K of degree D. If P(γ)≠0, then log|σ(P(γ))|≥−(D−1)log L−DΣj Nj h(1:γj). Here h is the absolute projective height, with extension normalization, and σ is any chosen complex embedding.

Hypotheses and conventions:

- P has integer coefficients, L≥1; the evaluated value is nonzero.
- K contains every argument; all block bounds Nj are nonnegative integers.

Proof or construction:

1. Bound every other archimedean conjugate by polynomial-length-and-block-degree.
2. At each finite place use the ultrametric evaluation bound.
3. Multiply the bounds, use the product formula, and express projective relative heights divided by D.

Prerequisites: [Polynomial length and block degrees](#polynomial-length-and-block-degree), [Absolute-height calculus from relative heights](#absolute-height-calculus-adapter), `DiophantineApproximationAndTranscendence:DT.3/liouville-size-inequality`, `DiophantineApproximationAndTranscendence:DT.0/mul-height-algebra-map`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §3.5.2, Proposition 3.14, pp.83–84. The blockwise product-formula estimate retains the factor D−1 on log length.

Acceptance:

- For P=X−1 and γ=2 over ℚ the lower bound is 1/2≤1.
- A zero evaluation is explicitly excluded.

## Multiplicity estimate

Only an additive group times one torus is needed. Its filtered coordinate ring, quotient dimensions and transverse derivatives are explicit. This is a relative multiplicity argument, retaining subgroup cosets and scheme multiplicities.

<a id="filtered-additive-torus-coordinate-model"></a>

### Filtered coordinates on an additive group times a torus

Target `DiophantineApproximationAndTranscendence:DT.3/filtered-additive-torus-coordinate-model` (definition).

For d≥0 and a field K, use Gd=K^d×Kˣ with law (x,y)(x′,y′)=(x+x′,yy′). Its coordinate ring is K[X1,…,Xd,Y,Y⁻¹], identified with K[X1,…,Xd,Y,Z]/(YZ−1). F(D0,D1) is the span of monomials X^κY^a with Σκi≤D0 and |a|≤D1. For an ideal I, H(I;D0,D1)=dimK image(F(D0,D1)→K[Gd]/I).

Hypotheses and conventions:

- K is a field; D0,D1 are nonnegative integers.
- Algebraic-set and subgroup assertions below additionally assume K algebraically closed of characteristic zero.

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.coordinateRing_quotient` | equivalence | K[Gd]≃K[X,Y,Z]/(YZ−1). |
| `LogarithmicForms.filtered_monomial_basis` | characterisation | The indicated bounded monomials form a basis of F(D0,D1). |
| `LogarithmicForms.filtered_mul` | compatibility | F(D)F(E)⊆F(D+E). |
| `LogarithmicForms.hilbertFunction_quotient` | characterisation | H(I;D) is the dimension of the quotient-image of F(D). |

Checks of the definition or construction:

- **`LogarithmicForms.filtered_torus_dimension`** (computed): For d=0,D1=2, dim F=5.
- **`LogarithmicForms.filtered_zero_bounds`** (degenerate): F(0,0) is the constants; H((1);0,0)=0.
- **`LogarithmicForms.quotient_inverse`** (compatibility): Y·Z=1 in the quotient, and Y⁻¹ evaluates to y⁻¹.
- **`LogarithmicForms.filtered_product_boundary`** (non-example): Y²·Y² is in F(0,4) and is not in F(0,2).

Uses:

- Roy, Theorems 8.4, 8.18 and 8.1: Supplies degree-controlled ideals and quotient dimensions.
- Waldschmidt, Lemma 9.17: Uses only one multiplicative coordinate in the rank argument.

Proof or construction:

1. Use AddMonoidAlgebra on (Fin d→₀ℕ)×ℤ and compare it to the indicated quotient of MvPolynomial.
2. The monomial span is finite-dimensional; define the quotient image with the native linear map.
3. Translations and the invariant derivations preserve F, and products take F(D)F(E) into F(D+E).

Prerequisites: `mathlib:MvPolynomial`, `mathlib:AddMonoidAlgebra`, `SchemeAndStackFoundations:SF.0`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §5.3(i)–(iii), pp.156–157; §8.1, p.231. The concrete Laurent coordinate ring and filtration used in the multiplicity estimate.

Acceptance:

- Do not introduce new scheme, ideal or group carriers.
- Filtration uses |a|≤D1, so the unquotiented dimension has 2D1+1 torus monomials.

<a id="laurent-hilbert-leading-form"></a>

### Leading form of the filtered Hilbert polynomial

Target `DiophantineApproximationAndTranscendence:DT.3/laurent-hilbert-leading-form` (construction).

For a proper ideal I⊂K[Gd], with m=Krull dimension K[Gd]/I, obtain the unique eventual polynomial PI(D0,D1) agreeing with H(I;D0,D1) for both parameters sufficiently large, and put 𝓗(I;D)=m! times its homogeneous degree-m part. Put 𝓗((1);D)=0. For a reduced nonempty closed set E, use I(E). Translation preserves H and 𝓗; for k disjoint cosets of one algebraic subgroup H, 𝓗(E;D)=k𝓗(H;D).

Hypotheses and conventions:

- K is algebraically closed of characteristic zero for geometric statements.
- The eventual polynomial is taken in both parameters; its top degree is the dimension.

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.hilbertPolynomial_eventually` | characterisation | PI agrees with H(I) for all sufficiently large bidegrees. |
| `LogarithmicForms.hilbertLeading_translate` | functoriality | Translation leaves 𝓗 unchanged. |
| `LogarithmicForms.hilbertLeading_cosets` | compatibility | k distinct subgroup cosets have leading form k𝓗(H). |

Checks of the definition or construction:

- **`LogarithmicForms.leading_full_group`** (computed): 𝓗(Gd;D)=2(d+1)D0^d D1.
- **`LogarithmicForms.leading_point`** (degenerate): A reduced point has 𝓗=1, including D0=D1=0.
- **`LogarithmicForms.leading_double_point`** (non-example): In K[Y,Y⁻¹], I=(Y−1)² has 𝓗=2, not 1.

Uses:

- Roy, Theorem 8.18: Compares the leading quotient dimensions of a multiplicity ideal and its coset support.
- Roy, Theorem 8.1: Turns the ideal bounds into the final binomial-times-cosets inequality.

Proof or construction:

1. Apply the requested multigraded Hilbert-polynomial theorem to the multihomogenized quotient model.
2. Recover the bounded Laurent filtration by the relations YZ=1.
3. Translation gives a filtration-preserving algebra automorphism; additivity of top-dimensional primary components gives the coset formula.

Prerequisites: [Filtered coordinates on an additive group times a torus](#filtered-additive-torus-coordinate-model), `SchemeAndStackFoundations:SF.0`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §5.2.2–§5.2.3, Proposition 5.2, pp.151–153; §5.3, Lemmas 5.9–5.10, pp.160–161; §8.2.2, Proposition 8.3, p.236. Eventual polynomiality and component additivity, specialized to the coordinate model.

Acceptance:

- Generic eventual polynomiality and primary-component additivity are supplier requests, not presumed consequences of Mathlib’s rational-function hilbertPoly.
- The multiplicity of a nonreduced component must be retained.

<a id="additive-one-torus-subgroups"></a>

### Subgroups, tangent spaces and dimensions in the one-torus case

Target `DiophantineApproximationAndTranscendence:DT.3/additive-one-torus-subgroups` (theorem).

Every algebraic subgroup H⊂K^d×Kˣ is uniquely V×T, where V is a linear subspace and T is either Kˣ or μN for some N≥1. Its ideal is generated by V⊥ and, in the finite case, Y^N−1. The neutral component is V×Kˣ or V×{1}; TeH is V×K or V×{0}, respectively. If r=dim V, then 𝓗(V×Kˣ;D)=2(r+1)D0^rD1 and 𝓗(V×μN;D)=N D0^r.

Hypotheses and conventions:

- K is algebraically closed and characteristic zero; H is a reduced algebraic subgroup.
- The case T=Kˣ is separate from finite μN.

Proof or construction:

1. Specialize Proposition 5.6 to one multiplicative coordinate: distinct characters and translations force the proposed ideal.
2. Use the rank-one subgroup classification of ℤ, then the squarefreeness of Y^N−1 for the components.
3. Count monomials modulo the linear equations and the torus equation, and differentiate the generators to identify TeH.

Prerequisites: [Filtered coordinates on an additive group times a torus](#filtered-additive-torus-coordinate-model), [Leading form of the filtered Hilbert polynomial](#laurent-hilbert-leading-form), `SchemeAndStackFoundations:SF.0`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §5.3, Propositions 5.6–5.7, pp.157–159, and Theorem 5.13, pp.161–163; §8.3.2, Lemma 8.13, p.241. Only the d1=1 case is needed for the selected interpolation determinant proof.

Acceptance:

- For d=0, μN has N components and tangent dimension zero.
- The finite-torus leading form is N D0^r, with no D1 factor.

<a id="laurent-complete-intersection-degree-bound"></a>

### Degree bound for ideals added to a subgroup ideal

Target `DiophantineApproximationAndTranscendence:DT.3/laurent-complete-intersection-degree-bound` (theorem).

Let H⊂Gd be an algebraic subgroup and A=I(H)+(Pj) a proper ideal, where every Pj has filtration bound (D0,D1). Then 𝓗(A;D0,D1)≤𝓗(H;D0,D1). More generally, in the polynomial presentation the same inequality holds for a complete-intersection ideal after adjoining polynomials of those block bounds, provided the resulting ideal is proper.

Hypotheses and conventions:

- K is algebraically closed of characteristic zero.
- A is proper; polynomials share the specified block-degree bounds.

Proof or construction:

1. The subgroup generators in the polynomial presentation, together with YZ−1, form a regular sequence.
2. Use the requested primary decomposition and unmixedness facts to choose linear combinations avoiding associated primes.
3. Multiplication by each selected polynomial is injective on the relevant quotient. Its degree-shift exact sequence bounds the leading Hilbert form by a finite difference; iterate up to the required codimension.

Prerequisites: [Subgroups, tangent spaces and dimensions in the one-torus case](#additive-one-torus-subgroups), [Leading form of the filtered Hilbert polynomial](#laurent-hilbert-leading-form), `SchemeAndStackFoundations:SF.0`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §8.2.3, Theorem 8.4, pp.236–238; §8.3.1, Lemma 8.7, p.239, and Theorem 8.8, pp.239–240. The complete-intersection argument supplies the upper bound for the later multiplicity ideal.

Acceptance:

- Properness cannot be replaced by a nonempty list of generators.
- Preserve scheme multiplicities when applying the primary-component sum.

<a id="invariant-jets-and-transverse-jet-coordinates"></a>

### Invariant derivatives and vanishing along a tangent subspace

Target `DiophantineApproximationAndTranscendence:DT.3/invariant-jets-and-transverse-jet-coordinates` (definition).

For w=(ξ,η)∈K^d×K put Dw=Σi ξi∂Xi+ηY∂Y on K[Gd]. For W a linear subspace, JetVanish(P,g,W,N) means every product Dw1…Dws P(g) is zero for 0≤s≤N and wj∈W. Define TeH={w:Dw(I(H))⊆I(H)}. The Dw commute, preserve the filtration, commute with translations, and depend linearly on w.

Hypotheses and conventions:

- K has characteristic zero; N≥0.
- The s=0 condition is P(g)=0.

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.invariantDeriv_monomial` | characterisation | Dw(X^κY^a)=Σi ξiκiX^(κ−ei)Y^a+ηaX^κY^a. |
| `LogarithmicForms.invariantDeriv_translate` | functoriality | Dw(P∘τg)=(DwP)∘τg. |
| `LogarithmicForms.jetVanish_basis` | characterisation | Products of basis directions test JetVanish. |
| `LogarithmicForms.tangent_subgroup_generators` | compatibility | Te(V×μN)=V×0; Te(V×Kˣ)=V×K. |

Checks of the definition or construction:

- **`LogarithmicForms.jet_order_zero`** (degenerate): JetVanish(P,g,W,0) is exactly P(g)=0.
- **`LogarithmicForms.jet_torus_inverse`** (computed): D(0,1)(Y⁻¹)=−Y⁻¹.
- **`LogarithmicForms.jet_monomial_point`** (non-example): (Y−1)² at y=1 vanishes through order 1 but not order 2.
- **`LogarithmicForms.jet_linear_direction`** (compatibility): For W=K(1,0), Dw agrees with the usual derivative of X.

Uses:

- Roy, Theorem 8.18: Produces independent transverse jet classes.
- Waldschmidt, Lemma 9.17: Converts a rank failure into simultaneous vanishing conditions.

Proof or construction:

1. Define derivatives on Laurent monomials and extend linearly; verify Leibniz and commutation there.
2. Compare to the polynomial presentation using the derivative of Y⁻¹.
3. A basis of W suffices to test all products; use the subgroup generators for the tangent characterization.

Prerequisites: [Filtered coordinates on an additive group times a torus](#filtered-additive-torus-coordinate-model), [Subgroups, tangent spaces and dimensions in the one-torus case](#additive-one-torus-subgroups), `DiophantineApproximationAndTranscendence:DT.3/multi-index-partial-derivative`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §8.1, pp.231–232; §8.3.2, equation (8.10) and Lemma 8.11, pp.240–241; Lemma 8.13, p.241. Invariant derivatives encode multiplicity and tangent directions.

Acceptance:

- Differentiating Y⁻¹ gives −ηY⁻¹.
- Order >N includes the N-th derivatives, not only the lower ones.

<a id="transverse-jet-multiplicity-bound"></a>

### Wüstholz’s transverse multiplicity inequality

Target `DiophantineApproximationAndTranscendence:DT.3/transverse-jet-multiplicity-bound` (theorem).

Let E be a finite nonempty union of cosets of an algebraic subgroup H⊂Gd, J=I(E), and A an ideal all of whose elements vanish through order S0 along W at every point of E. If dim Z(A)=dim H and ℓ=dim((W+TeH)/TeH), then 𝓗(A;D)≥binom(S0+ℓ,ℓ)𝓗(E;D).

Hypotheses and conventions:

- K is algebraically closed of characteristic zero; A is proper and S0≥0.
- The support dimension equality is essential; no inequality between leading forms of different total degrees is asserted.

Proof or construction:

1. Choose ℓ directions in W and subgroup equations with derivative-pairing matrix the identity modulo I(H); obtain coset versions using squared Chinese-remainder selectors.
2. Leibniz and factorials show D^β(PQ^α) is zero modulo J for |β|≤|α| unless β=α, when it is α!P.
3. Take a bounded-degree complement to J. Its products with Q^α for |α|≤S0 are independent modulo A, by the least derivative order and characteristic zero.
4. Compare quotient dimensions at D+S0C and pass to their top homogeneous parts.

Prerequisites: [Invariant derivatives and vanishing along a tangent subspace](#invariant-jets-and-transverse-jet-coordinates), [Subgroups, tangent spaces and dimensions in the one-torus case](#additive-one-torus-subgroups), [Leading form of the filtered Hilbert polynomial](#laurent-hilbert-leading-form), `SchemeAndStackFoundations:SF.0`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §8.3.3, Lemmas 8.14–8.16 and Theorem 8.18, pp.242–245. The transverse-coordinate argument proves the binomial multiplicity factor.

Acceptance:

- For ℓ=0 the factor is 1.
- For a point on Gm and S0=2 the ideal (Y−1)³ has leading multiplicity 3.

<a id="roy-relative-multiplicity-estimate-one-torus"></a>

### Roy’s relative multiplicity estimate for one torus

Target `DiophantineApproximationAndTranscendence:DT.3/roy-relative-multiplicity-estimate-one-torus` (theorem).

Let H−⊂H+⊂Gd be connected algebraic subgroups, d+=dim H+>0, Σ⊂H+ contain the identity, W⊂TeH+, S0≥0, and P of filtration bound D not identically zero on H+. If P vanishes through order d+·S0 along W on Σ[d+]+H−, there is a connected proper subgroup H*⊂H+ containing H−, with ℓ=dim((W+TeH*)/TeH*), such that binom(S0+ℓ,ℓ)#((Σ+H*)/H*)𝓗(H*;D)≤𝓗(H+;D). H* can be chosen as a component cut out in H+ by polynomials of bound D.

Hypotheses and conventions:

- K is algebraically closed of characteristic zero; all degree bounds are nonnegative integers.
- Σ[r] is the set of sums of r elements; Σ[0] is the identity.
- The cardinality in the conclusion is finite.

Proof or construction:

1. Form the nested ideals generated by bounded-degree derivatives and translates. Their zero-set dimensions have a plateau within d+ steps.
2. An irreducible component at that plateau has an algebraic stabilizer; the translates contained in the preceding zero set form a finite union of its cosets.
3. The transporter is cut out by bounded-degree translates, so the complete-intersection upper bound applies; use transverse-jet-multiplicity-bound for the lower bound.
4. Pass to the neutral component without changing its tangent space. Enlarge Σ by H−; connectedness forces H− into the resulting subgroup.

Prerequisites: [Degree bound for ideals added to a subgroup ideal](#laurent-complete-intersection-degree-bound), [Wüstholz’s transverse multiplicity inequality](#transverse-jet-multiplicity-bound), [Subgroups, tangent spaces and dimensions in the one-torus case](#additive-one-torus-subgroups), `SchemeAndStackFoundations:SF.0`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §8.1, Theorem 8.1, pp.231–233; §8.4, pp.244–247; §5.3, Lemma 5.11, p.161. The relative multiplicity estimate is used with Ga^d×Gm, not a higher-dimensional torus.

Acceptance:

- Keep d+·S0 as a product.
- The proof must construct the finite transporter-coset set rather than assume the desired subgroup.

## Interpolation determinants

The factorial polynomials, Taylor-index count and perturbed determinant estimate connect rank to simultaneous arithmetic and analytic bounds. The same selected nonzero minor is used in both inequalities.

<a id="delta-polynomial-adapter"></a>

### The delta polynomials and their normalized derivatives

Target `DiophantineApproximationAndTranscendence:DT.3/delta-polynomial-adapter` (definition).

Put Rk(z)=∏0≤j<k(z+j)/k!, with R0=1. For b≥1 and a=bq+r, 0≤r<b, set δb(z;a)=Rb(z)^q Rr(z). Let δb(z;a,c) be its c-th derivative, and νb=lcm(1,…,b). Yu’s polynomial Δ(z;k)=Rk(z+1), so its shift is retained explicitly. The δb(·;a), 0≤a≤A, form a basis of polynomials of degree≤A.

Hypotheses and conventions:

- b is a positive integer; a,c,k are nonnegative integers; coefficients are rational.

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.risingFactorial` | constructor | Rk=∏0≤j<k(X+j)/k! in Polynomial Q. |
| `LogarithmicForms.deltaPoly` | constructor | For b>0, δb(X;a)=Rb(X)^(a/b)R(a mod b)(X). |
| `LogarithmicForms.yuDelta` | constructor | Δ(X;k)=∏0≤j<k(X+j+1)/k! in Polynomial Q. |
| `LogarithmicForms.delta_zero_degree` | simp | δb(z;0)=1. |
| `LogarithmicForms.delta_one_block` | simp | δ1(z;a)=z^a. |
| `LogarithmicForms.delta_degree_basis` | characterisation | degree δb(·;a)=a and the bounded family is a basis. |
| `LogarithmicForms.yuDelta_shift` | compatibility | Δ(z;k)=Rk(z+1). |

Checks of the definition or construction:

- **`LogarithmicForms.delta_b2_a3`** (computed): δ2(z;3)=z²(z+1)/2.
- **`LogarithmicForms.delta_a0`** (degenerate): δb(z;0)=1 for all b≥1.
- **`LogarithmicForms.delta_shift_check`** (non-example): Δ(0;2)=1 while R2(0)=0.
- **`LogarithmicForms.delta_monomial_case`** (compatibility): δ1(z;4)=z⁴.

Uses:

- Waldschmidt, Definitions 9.9–9.10: Provides the modified interpolation basis and controlled denominators.
- Yu 1990, Lemmas 1.6–1.7 and §2: Provides integral-valued polynomial weights for auxiliary functions.

Proof or construction:

1. Use finite products in Polynomial ℚ and the unique division a=bq+r.
2. Distinct degrees a with nonzero leading coefficients prove the basis claim.
3. Use the shift identity to share estimates with Yu while preserving the two conventions.

Prerequisites: `mathlib:MvPolynomial`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §9.2.1(d), pp.269–270, and Lemma 9.8, pp.270–272. The bounded-block rising factorial replaces monomials in the interpolation columns.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §1, equation (1.9), p.25, and Lemma 1.6, pp.26–27. Yu’s factors start at z+1, rather than z.

Acceptance:

- No factorial denominator is silently discarded.
- The b=1 case gives δ1(z;a)=z^a.

<a id="delta-denominators-and-growth"></a>

### Denominators and growth of delta jets

Target `DiophantineApproximationAndTranscendence:DT.3/delta-denominators-and-growth` (theorem).

For a≥0,b≥1,C≥0,c≤C,m∈ℤ, νb^C δb(m;a,c)/c!∈ℤ. For z∈ℂ, Σ0≤c≤C binom(C,c)|δb(z;a,c)|≤C! exp(a+b)(1+|z|/b)^a. Also νb≤3^b. For Yu’s Δ and rational x with q^Jx a positive integer, q^(Jkl+l·ordq(k!))νk^m Δ(x;k,l,m)∈ℤ, where Δ(x;k,l,m)=((Δ(·;k)^l)^(m))(x)/m!.

Hypotheses and conventions:

- C,c,a,k,l,m,J are nonnegative integers; b≥1; k≥1 for νk.
- q is prime in Yu’s sharper q-adic assertion; q^Jx>0 is integral.

Proof or construction:

1. Count prime powers in factorial denominators and in every product remaining after differentiation; use Legendre’s formula.
2. Clear νb^C and bound derivative coefficient sums by a finite binomial expansion.
3. Use the elementary lcm bound and the shifted-polynomial prime-power count for Yu’s refinement. Yu 1994 Lemma 1.3 states J≥1; for J=0, x is a positive integer and Yu 1990 Lemma 1.6 gives νk^m Δ(x;k,l,m)∈ℤ, so multiplying by the extra integer q^(l·ordq(k!)) proves the displayed extension.

Prerequisites: [The delta polynomials and their normalized derivatives](#delta-polynomial-adapter).

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §9.2.1, Lemma 9.8, pp.270–272. The proof includes the denominator calculation and the growth bound.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §1, equation (1.9), p.25, and Lemma 1.6, pp.26–27. Contains the integer-value, lcm and derivative estimates.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. III](https://www.numdam.org/item/CM_1994__91_3_241_0.pdf), §1, Lemma 1.3, p.249. Sharpens the q-power denominator for rational inputs with a prime-power denominator.

Acceptance:

- For δ2(z;1)=z its first normalized derivative is integral already.
- At x=1/2, Δ(x;1)=3/2; the denominator test requires a q factor.

<a id="theta-minimal-degree-sum"></a>

### Minimum total degree of distinct Taylor monomials

Target `DiophantineApproximationAndTranscendence:DT.3/theta-minimal-degree-sum` (definition).

For n≥1,T0≥0,L≥0, Θ(n,T0,L) is the minimum of Σκ∈S |κ| over L-element sets S⊂ℕ^n satisfying κ2+…+κn≤T0. Put Θ(n,T0,0)=0. This is a minimum of a nonempty set of natural numbers; for n=1 it is L(L−1)/2.

Hypotheses and conventions:

- n≥1; T0,L are nonnegative integers.

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.theta_zero` | simp | Θ(n,T0,0)=0. |
| `LogarithmicForms.theta_one_variable` | compatibility | Θ(1,T0,L)=L(L−1)/2. |
| `LogarithmicForms.theta_monotone_L` | relation | Θ(n,T0,L) is nondecreasing in L. |
| `LogarithmicForms.theta_lower_bound` | other | For n≥2,T0≥1,L≥1, Θ≥(L/2)((L+1)/binom(T0+n−1,n−1)−T0/n−1). |

Checks of the definition or construction:

- **`LogarithmicForms.theta_one_three`** (computed): Θ(1,T0,3)=3.
- **`LogarithmicForms.theta_two_small`** (computed): Θ(2,1,3)=2, using (0,0),(1,0),(0,1).
- **`LogarithmicForms.theta_zero_size`** (degenerate): Θ(2,0,0)=0.
- **`LogarithmicForms.theta_zero_transverse`** (compatibility): Θ(n,0,L)=L(L−1)/2.
- **`LogarithmicForms.theta_lower_bound_positive_transverse`** (non-example): Θ(2,0,3)=3, whereas the lower-bound expression at these excluded inputs is 9/2. The hypothesis T0≥1 is necessary.

Uses:

- Waldschmidt, Lemmas 7.2–7.5 and 9.15: Bounds the determinant’s order at zero from distinct Taylor indices.

Proof or construction:

1. There are arbitrarily many admissible indices because κ1 is unrestricted.
2. Use well-ordering for the finite-set total; sort by total degree to obtain computable minimizers.
3. Count indices in layers to get the one-variable identity and the counting bound used below.

Prerequisites: `DiophantineApproximationAndTranscendence:DT.3/multi-index-partial-derivative`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §7.2, definition preceding Lemma 7.2, pp.192–193. Distinct Taylor monomials force vanishing of an alternant.

Acceptance:

- The first coordinate is unrestricted; bounding all coordinates would make the definition fail for large L.

<a id="partial-alternant-order-and-schwarz"></a>

### Vanishing order of a partially analytic alternant

Target `DiophantineApproximationAndTranscendence:DT.3/partial-alternant-order-and-schwarz` (theorem).

Let fi(z)=pi(z)φi(θ·z), pi a polynomial in n variables of degree≤T0, φi entire. In an L-row determinant, choose analytic rows I, evaluate each at finitely many zζμ after differential operators of order≤S0, and allow a constant rectangular column change Q. All other rows are constant. Its scalar entire determinant DI has order at zero at least max(0,Θ(n,T0,#I)−L S0). Consequently |DI(1)|≤E^(−max(0,Θ−LS0)) sup|z|=E |DI(z)| for E>1.

Hypotheses and conventions:

- n,L≥1; constant column change has the size making a square L×L product.
- Differential operators have constant coefficients and order≤S0.

Proof or construction:

1. Make a linear coordinate change aligning θ with the first coordinate; if θ=0 the polynomial case is immediate.
2. Expand φi into Taylor series. Equal surviving monomials in two analytic rows kill the determinant; their distinct degrees cost at least Θ.
3. Each differential operator loses at most S0 degrees. The column change does not alter the argument.
4. Taylor factorization converts the order into the little-o hypothesis of the pinned radius-ratio Schwarz theorem; bound the circle supremum by the maximum principle.

Prerequisites: [Minimum total degree of distinct Taylor monomials](#theta-minimal-degree-sum), `DiophantineApproximationAndTranscendence:DT.3/multi-index-partial-derivative`, `mathlib:AnalyticAt.exists_eventuallyEq_sum_add_pow_mul`, `mathlib:Complex.dist_le_mul_div_pow_of_mapsTo_ball_of_isLittleO`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §7.2, Lemma 7.2, pp.192–193; §7.3, Lemma 7.5, pp.196–197; §9.2.2, Lemmas 9.14–9.15, pp.277–278. The derivative and rectangular-column version accounts for the loss L S0.

Acceptance:

- When Θ−LS0<0, use the trivial nonnegative order.
- Do not replace log E by log(E/3); the sharp radius ratio is needed in the numerical constant.

<a id="perturbed-determinant-upper-bound"></a>

### A small perturbation of an analytic determinant

Target `DiophantineApproximationAndTranscendence:DT.3/perturbed-determinant-upper-bound` (theorem).

For an L×L matrix A+εB and each row subset I, let ΔI use rows of A on I and rows of B on its complement. If |ε|≤exp(−V), χ0>0,r≥1 and |ΔI|≤exp(−χ0 |I|^(1+1/r)+(χ1−V)|I|+χ2), with χ1≥0, then |det(A+εB)|≤exp(−LV+(r/χ0)^r(χ1/(r+1))^(r+1)+χ2+L log 2).

Hypotheses and conventions:

- χ0>0,χ1≥0,r≥1,V,χ2 real; L≥1.
- The subset bounds also include empty I; all determinant bounds are norm bounds, so zero determinants cause no logarithm issue.

Proof or construction:

1. Expand multilinearly over row subsets.
2. Optimize −χ0 x^(1+1/r)+χ1 x for real x≥0 by differentiation.
3. Sum at most 2^L terms and use the triangle inequality.

Prerequisites: [Vanishing order of a partially analytic alternant](#partial-alternant-order-and-schwarz).

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §7.3, Lemma 7.4, pp.195–196. The mixed-row expansion converts a small entry error into a determinant estimate.

Acceptance:

- ε=0 is allowed.
- The χ1=0 optimization term is zero.

<a id="modified-interpolation-matrix"></a>

### The algebraic interpolation matrix

Target `DiophantineApproximationAndTranscendence:DT.3/modified-interpolation-matrix` (definition).

Fix 1≤d≤m, β0,…,βm−1, αj≠0 and b=S♯≥1. Rows are (τ,t) with τ∈ℕ^d, |τ|≤T0, |t|≤T1; columns are (σ,s). In the general case set Γ(τ,t;σ,s)=Σκ≤τ0 binom(τ0,κ)δb(t;σ,κ)(smβ0)^(τ0−κ)∏m−d+1≤i<m(si+smβi)^τi∏j αj^(tsj). For β0=0, βi=−bi/bm with integer bi and bm≠0, the rational version is δb(t;σ,τ0)/τ0! times ∏i Δ(si bm−sm bi;τi) times ∏j αj^(tsj). These versions have the same row rank as the corresponding ordinary derivative-evaluation matrix.

Hypotheses and conventions:

- All row exponents and σ are nonnegative; t,s are integers.
- The general and rational versions are separate normalizations; bm need not be 1.

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.interpolation_entry_zero_jets` | simp | Γ(0,t;0,s)=∏αj^(tsj). |
| `LogarithmicForms.interpolation_rank_basis_change` | compatibility | The derivative and modified matrices have equal rank. |
| `LogarithmicForms.interpolation_entry_algebraic` | characterisation | Every entry is in the field generated by αj and βi. |
| `LogarithmicForms.interpolation_rational_entry` | characterisation | The homogeneous rational entry has the displayed Δ-product form. |

Checks of the definition or construction:

- **`LogarithmicForms.matrix_origin_entry`** (computed): τ=0,σ=0,s=0 gives Γ=1.
- **`LogarithmicForms.matrix_first_jet`** (computed): For τ0=1,σ=0 and the general matrix, Γ=smβ0∏αj^(tsj).
- **`LogarithmicForms.matrix_rational_shift`** (non-example): For τi=1, the rational factor is si bm−sm bi+1, not si bm−sm bi.
- **`LogarithmicForms.matrix_basis_small`** (compatibility): δ2(·;0)=1, δ2(·;1)=z, δ2(·;2)=z(z+1)/2 give an invertible triangular change.

Uses:

- Waldschmidt, Proposition 9.16: Extracts a nonzero full-row minor.
- Waldschmidt, Theorem 9.19: Provides one determinant with compatible arithmetic and analytic estimates.

Proof or construction:

1. Use δb(·;σ) as a polynomial basis in the derivative column variable.
2. The triangular change of derivative basis is invertible by its nonzero leading coefficients.
3. In the rational case additionally change the row polynomial basis to the Δ basis and divide by the stated nonzero factorials.

Prerequisites: [The delta polynomials and their normalized derivatives](#delta-polynomial-adapter), `DiophantineApproximationAndTranscendence:DT.3/exponential-monomial-derivatives`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §9.2.1, Lemma 9.7 and Definitions 9.9–9.10, pp.267–274; §9.2.2, equation (9.12), p.276; §9.2.3, p.280. The algebraic entries and the two changes of basis preserve the zero-estimate rank.

Acceptance:

- The σ=0,τ=0 entry is exactly ∏αj^(tsj).
- Rational row normalization retains both τ0! and bm.

<a id="interpolation-minimal-subspace-rank"></a>

### Full rank after the minimal-subspace selection

Target `DiophantineApproximationAndTranscendence:DT.3/interpolation-minimal-subspace-rank` (theorem).

Let S⊂ℤ^m be finite, S̃=S−S, vβ=(β1,…,βm−1,−1), and V⊂K^m a d-dimensional subspace containing vβ. Assume the first m−d coordinate vectors project to a basis of K^m/V, the αj generate a multiplicative group of rank≥m−1, S0+1≥2T0, |sj|<T0/4 for s∈S, and either β0≠0 or S̃[2]∩K vβ={0}. Assume (S0+1)#S>2(m+1)T0^mT1, #πV(S)≤(m+1)/(d+1)T0^(m−d), and no proper V′⊂V containing vβ satisfies the same quotient bound with d′. Then the modified matrix with σ≤(m+1)S0 and s∈(S̃∩V)[m+1] has row rank binom(T0+d,d)(2T1+1).

Hypotheses and conventions:

- K is algebraically closed of characteristic zero; 1≤d≤m; T0,T1,S0 are positive integers.
- S̃[r] is an r-fold sum of the difference set, not the original set S.

Proof or construction:

1. A rank failure gives a nonzero bounded-degree Laurent polynomial with the specified invariant-jet zeros.
2. Apply Roy’s relative estimate to Ga^d×Gm; injectivity of s↦sy follows from the stated β-direction condition. For D=∂X0+Y∂Y use W=K·(1,0,…,0,1). Its torus coordinate is 1; the direction printed in the author PDF p.282 has an erroneous final 0 (E610), while p.283 uses the required final 1.
3. Classify the obstruction subgroup. A finite torus obstruction contradicts multiplicative rank and the box bound; a full torus obstruction gives a proper V′ with the forbidden quotient cardinality.
4. A largest fiber of S→K^m/V supplies the needed # (S̃∩V) inequality.

Prerequisites: [The algebraic interpolation matrix](#modified-interpolation-matrix), [Roy’s relative multiplicity estimate for one torus](#roy-relative-multiplicity-estimate-one-torus), [Subgroups, tangent spaces and dimensions in the one-torus case](#additive-one-torus-subgroups).

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §9.2.3, Proposition 9.16 and Lemma 9.17, pp.280–286. Minimality removes the proper-subspace obstruction to full rank.

Acceptance:

- Correct Lemma 9.17 Step 1: sy=0 must imply s=0.
- The zero-coordinate case β0=0 requires the separate direction hypothesis.

<a id="interpolation-determinant-arithmetic-bound"></a>

### Arithmetic lower bound for a full-row interpolation minor

Target `DiophantineApproximationAndTranscendence:DT.3/interpolation-determinant-arithmetic-bound` (theorem).

Let Δ≠0 be an L×L minor of the modified matrix, with |t|≤T1,σ≤S0,|sj|≤Sj. Clearing the product of ν(S♯)^τ0 over its rows gives an integer polynomial in the β block and in αj,αj⁻¹. Its β total degree is≤LT0, each αj/αj⁻¹ block degree is≤LT1Sj, and its length is bounded by L! times the product of the cleared row-entry length bounds from Lemma 9.11. Apply multiblock Liouville to this polynomial and subtract the exact logarithm of the clearing denominator to obtain the lower bound for log|Δ|.

Hypotheses and conventions:

- The selected minor is nonzero in the common number field of degree D.
- In the rational version the β block is replaced by the integer coefficients bi and the Δ-polynomial bound.

Proof or construction:

1. Use the determinant’s permutation expansion to bound block degrees and coefficient length.
2. For each row clear ν(S♯)^τ0; the sum of τ0 is≤LT0, so the logarithmic denominator cost is≤LT0S♯log3.
3. Represent negative α exponents with inverse variables; use h(αj⁻¹)=h(αj), keeping the two signed contributions rather than deleting them.
4. Apply the nonzero-evaluation Liouville bound.

Prerequisites: [The algebraic interpolation matrix](#modified-interpolation-matrix), [Denominators and growth of delta jets](#delta-denominators-and-growth), [Multiblock Liouville inequality in absolute height](#multiblock-liouville-height-adapter), [Absolute-height calculus from relative heights](#absolute-height-calculus-adapter).

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §3.5.5, Lemma 3.15, pp.85–86; §9.2.1, Lemma 9.11, pp.273–274; §9.3.2, Step 3, pp.290–291. The cleared determinant has a controlled arithmetic cost before numerical specialization.

Acceptance:

- Retain the L! factor.
- For a monomial αj^(−tSj) the inverse-height contribution is h(αj), not zero.

<a id="interpolation-determinant-analytic-bound"></a>

### Analytic upper bound for the same interpolation minor

Target `DiophantineApproximationAndTranscendence:DT.3/interpolation-determinant-analytic-bound` (theorem).

Put Ld=binom(T0+d,d)(2T1+1), Vd=(T0+d)(2T1+1)log E/(2d), E>1. Let the selected matrix entries be Φ(σμ)τt(ζμ)+εbτtμ, where Φ is the modified derivative-basis entire function, |ε|≤exp(−Vd), and Mτt bounds both log sup|z|=E,maxμ |Φ(σμ)τt(zζμ)| and log maxμ |bτtμ|. Then |Δ|≤exp(−LdVd/2+Ld S0 log E+Ld log(2Ld)+Στ,t Mτt).

Hypotheses and conventions:

- d≥1,T0≥1,T1≥1. All columns have derivative order≤S0, and there are exactly Ld selected rows and columns.
- The row majorants Mτt are positive.

Proof or construction:

1. Use partial-alternant-order-and-schwarz for each mixed-row determinant.
2. Use Θ’s layer-counting lower bound, with its n=1 identity as a separate case.
3. Apply perturbed-determinant-upper-bound with r=1 and the source’s quadratic optimization.
4. For the logarithmic form, write ε as Λ times the explicit exponential correction; the row errors are bounded using the entire exponential difference integral.

Prerequisites: [The algebraic interpolation matrix](#modified-interpolation-matrix), [Minimum total degree of distinct Taylor monomials](#theta-minimal-degree-sum), [Vanishing order of a partially analytic alternant](#partial-alternant-order-and-schwarz), [A small perturbation of an analytic determinant](#perturbed-determinant-upper-bound), [Denominators and growth of delta jets](#delta-denominators-and-growth).

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §9.2.2, Proposition 9.13, pp.275–279; §9.3.2, Step 4, pp.291–293. The analytic estimate applies to the same minor as the arithmetic lower bound.

Acceptance:

- The error term includes LdS0logE.
- When using Proposition 9.16, replace S0 and the column box by its enlarged values.

## Quantitative complex bounds

The concrete parameter criterion uses M=1. Rounded lengths retain floor losses. The end adapters preserve algebraic coefficients, a constant term and logarithmic branches. Goal ids supplied by these adapters are outputs rather than assumptions.

<a id="waldschmidt-parameter-inequality"></a>

### Waldschmidt’s explicit parameter criterion with M=1

Target `DiophantineApproximationAndTranscendence:DT.3/waldschmidt-parameter-inequality` (theorem).

Let Λ=β0+Σj<m βjλj−λm≠0, exp λj=αj, D=[ℚ(α,β):ℚ], and the multiplicative rank of α be≥m−1. Let B1,B2,E≥e, Aj>1, logAj≥h(αj), DlogAj≥1, Σj |λj|/logAj≤D/E, and B1^D,B2^D≥E. Choose positive integers T0,T1,S♯,S0,Sj, U>0 and finite S⊂∏j[−Sj,Sj]∩ℤ^m. Set V=(T0+1)(2T1+1)log E/(2m), L=binom(T0+m,m)(2T1+1). Require S0+1≥2T0, T0>4Sj, |Σsjλj|≤U/(E(T1+1)) on S, (S0+1)#S>2(m+1)T0^mT1, B2≥e²(1+T1/S♯), and V/2≥4DT0logB1+2(m+1)DS0logB2+DS♯+Dlog(2L)+(m+1)U+2(m+1)D(T1+1)Σj SjlogAj. In the general case require logB1≥h(1:β0:…:βm−1) and B1≥2(m+1)T0·3^S♯Σj Sj. In the rational homogeneous case require β0=0,βj=−bj/bm,bm≠0, B1≥3^S♯ and B1≥e+2e(m+1)maxj<m(|bm|Sj+|bj|Sm)/T0. Then |Λ|>exp(−mV).

Hypotheses and conventions:

- m≥1 and every listed strict/non-strict parameter inequality is part of the statement.
- An empty maximum in the m=1 rational case is zero.
- This is only the M=1 case; the large-m parameter optimization is outside this continuation.

Proof or construction:

1. If a small integer multiple of vβ lies in (S−S)[2], Liouville applied to the corresponding monomial already proves the result; otherwise select a minimal V for the rank criterion.
2. Extract a nonzero minor using interpolation-minimal-subspace-rank.
3. Assuming |Λ|≤exp(−mV), bound the row errors and apply the analytic upper bound with the enlarged column box.
4. Use the arithmetic lower bound and the displayed budget inequality to obtain incompatible bounds for that same nonzero minor.

Prerequisites: [Full rank after the minimal-subspace selection](#interpolation-minimal-subspace-rank), [Arithmetic lower bound for a full-row interpolation minor](#interpolation-determinant-arithmetic-bound), [Analytic upper bound for the same interpolation minor](#interpolation-determinant-analytic-bound), [Absolute height and a chosen conjugate](#absolute-height-conjugate-size-adapter).

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §9.3.1–§9.3.2, Theorem 9.19 and its proof, pp.288–293. The concrete M=1 criterion keeps every parameter requirement visible.

Acceptance:

- Check all seven contributions to the V/2 budget.
- The polynomial-height hypothesis uses projective height, not the maximum of scalar heights.

<a id="waldschmidt-rounded-parameter-selection"></a>

### Rounded parameters for the explicit determinant criterion

Target `DiophantineApproximationAndTranscendence:DT.3/waldschmidt-rounded-parameter-selection` (construction).

Fix m≥1 and M=1. Put N0=8(m+1)^3, C0=(m+1)2^(1−2m)(N0+1)^(m+1), C1=(2N0+1)(C0+2)/4. Under the displayed field, coefficient and height/log hypotheses choose U=C0D^(m+2)logB1·∏j logAj·logB2/(log E)^(m+1), T0=floor(U/(2DlogB1)), T1=floor(N0DlogB1/log E), S0=floor(U/(DlogB2)), Sj=floor(U/(D(T1+1)logAj)), and S♯=floor(logB1/(6m)) in the general case or floor(logB1/log3) in the rational case. Take S to be the full integer box. These parameters meet the previous criterion and give |Λ|>exp(−C1D^(m+2)logB1logB2·∏j logAj/(log E)^(m+1)).

Hypotheses and conventions:

- λ1,…,λm are chosen logarithms of algebraic αj≠0; their multiplicative rank is at least m−1. The form is Λ=β0+Σj<m βjλj−λm≠0, D=[Q(α,β):Q], E≥e, and m≥1. The general and rational coefficient presentations are those displayed below.
- B1≥B2≥e, logB2≥log E/D, logAj≥max(hαj,log E/D), and Σ|λj|/logAj≤D/E.
- B2≥71N0/(m+1)(1+D/log E).
- General case: logB1≥h(1:β), B1≥C0³(D logA/log E)^(2m+2)(logB2)³, with logA=maxj logAj.
- Rational case: β0=0,βj=−bj/bm,bm≠0, B1≥e+4e(m+1)log E/(N0D) maxj<m(1+|bm|/logAj+|bj|/logAm).

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.waldParameters_positive` | characterisation | Each selected integer is positive. |
| `LogarithmicForms.waldParameters_admissible` | compatibility | All hypotheses of the parameter criterion hold. |
| `LogarithmicForms.waldParameters_budget` | other | mV<C1D^(m+2)logB1logB2∏logAj/(log E)^(m+1). |

Checks of the definition or construction:

- **`LogarithmicForms.wald_rounding_boundary`** (computed): For a real x≥2, floor x≥x/2. At x=2 this reads 2≥1; at x=5/2 it reads 2≥5/4. Equality at x=2 is not asserted.
- **`LogarithmicForms.wald_M_one`** (degenerate): For M=1 the auxiliary factor M* is 1.
- **`LogarithmicForms.wald_box_cardinality`** (compatibility): The selected box has exactly ∏j(2Sj+1) points.

Uses:

- Waldschmidt, Proposition 9.18 and Theorem 9.1: Produces the explicit exponential constant after rescaling B1 and B2.

Proof or construction:

1. Prove all floored integers are positive before using their reciprocals.
2. Use floor x≥x−1, and the source’s stronger floor x≥x/2 where x≥2, to check the box count and all size bounds.
3. The full box gives the linear-logarithm size condition by Σ|λj|/logAj≤D/E.
4. Check the budget term by term and use mV<C1 times the stated parameter product.

Prerequisites: [Waldschmidt’s explicit parameter criterion with M=1](#waldschmidt-parameter-inequality).

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §9.3.3, Corollary 9.20, pp.294–298. Only M=1 is used, so M*=1 in both printed formulas.

Acceptance:

- No floor is replaced by an unfloored real count.
- All parameters remain positive for m=1.

<a id="waldschmidt-independent-estimate-proof"></a>

### The sum-normalized Waldschmidt estimate

Target `DiophantineApproximationAndTranscendence:DT.3/waldschmidt-independent-estimate-proof` (theorem).

Under the displayed hypotheses, Λ≠0 and log|Λ|>−C(m)D^(m+2)log B·(∏j logAj)·log E*/(log E)^(m+1), where C(m)=2^(m+25)m^(3m+9). The sum-size hypothesis is explicit; the sharp pointwise estimate is not inferred from it.

Hypotheses and conventions:

- m≥1; λ1,…,λm are Q-linearly independent complex numbers, αj=exp λj are algebraic and nonzero.
- β0,…,βm are algebraic, not all zero; D=[Q(α1,…,αm,β0,…,βm):Q]. The form is Λ=β0+Σj βjλj.
- B,E,E*≥e; Aj>1 and logAj≥max(h(αj),E|λj|/D,log E/D). Require log E*≥max(log E/D,log(D/log E)) and B≥E*.
- General coefficients: B≥maxj DlogAj/log E and log B≥maxi h(βi). Alternatively β0=0, βj=bj∈Z, bm≠0, and B≥maxj<m (|bm|/logAj+|bj|/logAm)log E/D, with empty maximum zero.
- Additionally Σj |λj|/logAj≤D/E.

Proof or construction:

1. If every logarithmic coefficient βj, j≥1, is zero, use the absolute-height conjugate lower bound for β0. Otherwise in the general branch permute the logarithms to arrange βm≠0; the rational branch already assumes bm≠0.
2. Set logB1=37m^(3/2)logB and logB2=10sqrt(m)logE*. Use the M=1 rounded-parameter construction.
3. Check its projective-height and coefficient conditions from the displayed hypotheses and h(1:β)≤Σ h(βj).
4. Verify 370m²C1<C(m)−1. At m=1 its ratio to C(m) is 0.751594864 and at m=2 it is 0.139585562, by exact rational arithmetic. For m≥3, C0=2^(m+4)(m+1)^(3m+4)(1+1/(8(m+1)^3))^(m+1), C0≥2, and 2N0+1≤17(m+1)^3 give the ratio less than (3145/2^21)(4/3)^7·81=3145/3456<0.911, using (1+1/m)^m<e<3. Since C(m)≥2^26, the subtraction of 1 is absorbed.
5. For a general nonzero βm divide coefficients by −βm. Use the projective scaling identity, and bound the final |βm| factor by exp(−D hβm).
6. Use Q-independence to obtain multiplicative rank≥m−1 even when one relation gives a 2πi multiple.

Prerequisites: [Rounded parameters for the explicit determinant criterion](#waldschmidt-rounded-parameter-selection), [Absolute-height calculus from relative heights](#absolute-height-calculus-adapter), [Absolute height and a chosen conjugate](#absolute-height-conjugate-size-adapter), `DiophantineApproximationAndTranscendence:DT.3/baker-linear-independence-of-logarithms`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §9.3, Proposition 9.18, p.286; §9.3.4, proof, pp.298–302; §9.1, Theorem 9.1, pp.251–252. The M=1 argument proves the displayed all-m constant; the smaller large-m optimization is not needed.

Acceptance:

- Retain β0 in the coefficient-height and generated-field bounds.
- The additional sum hypothesis is explicit and is not inferred from the pointwise hypotheses.

<a id="baker-fixed-logarithm-coefficient-adapter"></a>

### General algebraic coefficients and fixed logarithms

Target `DiophantineApproximationAndTranscendence:DT.3/baker-fixed-logarithm-coefficient-adapter` (comparison).

For fixed chosen logarithms λ1,…,λm of nonzero algebraic numbers and a fixed positive degree bound D0 on every coefficient γ,βj, there is an effective C>0 depending only on λ,m,D0 such that any Λ=γ+Σβjλj≠0 satisfies |Λ|≥(eB)^−C, where B≥1 bounds the absolute multiplicative heights of γ and all βj. This supplies the existing baker-lower-bounds-for-linear-forms-in-logarithms target.

Hypotheses and conventions:

- All coefficients are algebraic of degree≤D0; γ need not be zero.
- λj are fixed choices; no branch choice depends on the varying coefficients.

Proof or construction:

1. Choose once a rational basis from the span of the fixed λj and rewrite all logarithms using fixed rational coefficients.
2. Height sum/product bounds control the rewritten coefficients by a fixed power of eB. The degree of their common field with the fixed αj is bounded by a constant depending only on D0,m and α.
3. Choose E=e, fixed Aj large enough for every possible degree, and fixed E* for the common-field degree bound.
4. Apply waldschmidt-pointwise-conservative-estimate with a fixed multiple/power of eB and absorb its log factor into C.
5. If the logarithmic span is zero, use the nonzero algebraic Liouville estimate for γ.

Prerequisites: [A conservative estimate under the original pointwise hypotheses](#waldschmidt-pointwise-conservative-estimate), [Absolute-height calculus from relative heights](#absolute-height-calculus-adapter), [Absolute height and a chosen conjugate](#absolute-height-conjugate-size-adapter), `DiophantineApproximationAndTranscendence:DT.3/galois-subfield-containing-finite-set`, `DiophantineApproximationAndTranscendence:DT.3/liouville-size-inequality`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §9.1, Theorem 9.1, pp.251–252; §9.4.2–§9.4.4, pp.304–312. A fixed rational change of logarithmic basis gives the effective fixed-logarithm estimate without claiming uniform sharp constants for dependent inputs.

Acceptance:

- An integer-coefficient Matveev theorem alone does not discharge this algebraic-coefficient target.
- The case γ≠0 is retained.

<a id="complex-multiplicative-form-adapter"></a>

### From a chosen logarithm to a product of powers

Target `DiophantineApproximationAndTranscendence:DT.3/complex-multiplicative-form-adapter` (comparison).

For fixed αj∈Qbarˣ and bj∈ℤ with Θ=∏j αj^bj−1≠0, the existing multiplicative-form target follows from the fixed-logarithm bound. Include 2πi as a chosen logarithm of 1, choose k∈ℤ so L=Σbjλj−2kπi has imaginary part in (−π,π], and use |k|≤a fixed multiple of max(1,max|bj|). If |Θ|<1/2, the local inverse of exp gives |L|≤2|Θ|; otherwise the bound is immediate.

Hypotheses and conventions:

- αj are fixed; chosen λj remain fixed.
- The integer k is part of the reduction; exp L=1+Θ.

Proof or construction:

1. Center the imaginary part by the nearest-integer operation.
2. Apply the fixed-logarithm coefficient adapter including the extra logarithm 2πi and its coefficient −k.
3. On |Θ|<1/2 use the convergent log(1+Θ) series and its norm bound; uniqueness in the chosen strip identifies it with L.
4. Absorb the factor 2 and the large-Θ case into a fixed exponent.

Prerequisites: [General algebraic coefficients and fixed logarithms](#baker-fixed-logarithm-coefficient-adapter), `DiophantineApproximationAndTranscendence:DT.3/algebraic-logarithms`.

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §9.4.3–§9.4.4, Corollary 9.22 and proof, pp.308–311. The complex reduction retains the 2πi correction.

Acceptance:

- A product different from 1 need not have a principal logarithm equal to Σbj principal logαj.
- The lower bound applies to complex as well as positive real αj.

<a id="two-logarithm-matveev-replacement"></a>

### A stated Matveev replacement for the sharp two-log estimate

Target `DiophantineApproximationAndTranscendence:DT.3/two-logarithm-matveev-replacement` (comparison).

For positive rationals a1,a2≠1 and integers b1,b2, set Λ=b1 log a1−b2 log a2≠0, Aj=max(log Habs(aj),0.16), B=max(1,|b1|,|b2|). The existing Matveev Corollary 2.3 target with n=2,D=1,κ=1 gives log|Λ|>−C2 A1A2 log(eB), where C2=min(e·30^5·2^(7/2),2^32). Assembly may use this explicit replacement wherever the old two-log consumer only needs an effective coefficient bound; it must retain this formula and credit Matveev, rather than the LMN constant 24.34.

Hypotheses and conventions:

- a1,a2 are positive rationals, different from 1; Λ≠0.
- The exact Matveev theorem is an imported planned target whose proof is not supplied by the selected Waldschmidt route.

Proof or construction:

1. Specialize the imported Matveev integer-coefficient corollary to n=2 and a real number field of degree 1.
2. For positive rationals, |log aj|≤log Habs(aj), so the Aj satisfy the corollary’s size conditions.
3. Use the corollary’s explicit B* option, B*=max(|b1|,|b2|), and then the larger B=max(1,B*). Alternatively permute the two inputs so A2≥A1; only with that ordering does B automatically dominate the weighted parameter max(1,|bj|Aj/A2).
4. Record the replacement in assembly and preserve the unresolved sharp-proof dependency.

Prerequisites: `DiophantineApproximationAndTranscendence:DT.3/matveev-corollary-linear-form-bound`, [Absolute-height calculus from relative heights](#absolute-height-calculus-adapter).

Source: [E. M. Matveev, An explicit lower bound for a homogeneous rational linear form in logarithms of algebraic numbers. II](https://www.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=314&what=fullteng&option_lang=eng), §2, Corollary 2.3, p.1219; §1, notation, pp.1217–1218. The real degree-one, two-logarithm specialization has exactly the stated constant.

Acceptance:

- The bound is explicitly weaker/different from the LMN expression.
- No claim is made that proving Waldschmidt’s constant proves Matveev’s sharp constant.

<a id="waldschmidt-pointwise-conservative-estimate"></a>

### A conservative estimate under the original pointwise hypotheses

Target `DiophantineApproximationAndTranscendence:DT.3/waldschmidt-pointwise-conservative-estimate` (theorem).

Under the displayed pointwise hypotheses, Λ≠0 and log|Λ|>−Csafe(m)D^(m+2)log B·(∏j logAj)·log E*/(log E)^(m+1), where Csafe(m)=2^(m+25)m^(4m+10). This supplies the original fixed-logarithm Baker consumers with a conservative effective constant.

Hypotheses and conventions:

- m≥1; λ1,…,λm are Q-linearly independent complex numbers, αj=exp λj are algebraic and nonzero.
- β0,…,βm are algebraic, not all zero; D=[Q(α1,…,αm,β0,…,βm):Q]. The form is Λ=β0+Σj βjλj.
- B,E,E*≥e; Aj>1 and logAj≥max(h(αj),E|λj|/D,log E/D). Require log E*≥max(log E/D,log(D/log E)) and B≥E*.
- General coefficients: B≥maxj DlogAj/log E and log B≥maxi h(βi). Alternatively β0=0, βj=bj∈Z, bm≠0, and B≥maxj<m (|bm|/logAj+|bj|/logAm)log E/D, with empty maximum zero.

Proof or construction:

1. Replace logAj by m logAj; the sum of logarithm sizes is then≤D/E.
2. Replace B by mB, so both the general coefficient-size condition and the homogeneous rational condition remain satisfied.
3. Apply the sum-normalized estimate. Since B≥e and m≥1, log(mB)≤m logB, and the product of the new logAj is m^m times the old product.
4. The resulting constant is C(m)m^(m+1)=Csafe(m).

Prerequisites: [The sum-normalized Waldschmidt estimate](#waldschmidt-independent-estimate-proof).

Source: [Michel Waldschmidt, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), §9.1, Theorem 9.1, pp.251–252; §9.3.1–§9.3.4, pp.288–302. The new larger constant follows by an explicit normalization of the proved sum-size case.

Acceptance:

- For m=1 the normalization is the identity and Csafe(1)=C(1).
- For m=2 the added normalization cost is 8, with no dependence on coefficients.

## P-adic analytic interface

Normal functions are integral restricted power series on the existing carrier. Hermite interpolation controls the weighted order of each coefficient; zero division then propagates the jets to fractional grid points.

<a id="finite-place-normalization-adapter"></a>

### Prime-ideal order and the local analytic normalization

Target `DiophantineApproximationAndTranscendence:DT.3/finite-place-normalization-adapter` (comparison).

Let K be a number field, P above the rational prime p, with e=ordP(p) and residue degree f. For x≠0 put vp(x)=ordP(x)/e. The analytic p-normalized absolute value is |x|p=p^(−vp(x)), while the product-formula finite-place value is vP(x)=(p^f)^(−ordP(x)). Thus |x|p=vP(x)^(1/(ef)). For F⊂K and Q=P∩OF, ordP(x)=e(P/Q)ordQ(x), eP=e(P/Q)eQ, so vp and |·|p agree on F. Completion embeddings use NumberFieldArithmetic’s canonical completionAlgHom for a specified lies-over place.

Hypotheses and conventions:

- P and Q are nonzero primes with the stated lies-over conditions; p is prime.
- Orders at zero are infinite; all real-valued equalities here assume x≠0.

Proof or construction:

1. Import the normalized prime order and finite-place absolute value from GlobalNumberFields.
2. Use NumberFieldArithmetic Layer 5.1–5.2 and 5.5 for the canonical completion map and matching e,f.
3. The ideal-power definition of ramification gives the restriction formula; divide by absolute e.
4. Compute the two exponential formulas, retaining the residue-degree f factor.

Prerequisites: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-0-places-completions-and-the-product-formula`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §0, notation before Theorem 1, pp.15–17; §1, Lemmas 1.2–1.4, pp.22–25. Separates prime-ideal order from ordp normalized to ordp(p)=1.

Acceptance:

- For K=ℚ, e=f=1 and the two absolute values agree.
- For an unramified quadratic completion, vP(p)=p^(−2) while |p|p=p^(−1).
- Never use an arbitrary Algebra Kp Lp instance to identify a global subfield.

<a id="deep-unit-exp-log-adapter"></a>

### Sharp deep-unit exponential and logarithm interface

Target `DiophantineApproximationAndTranscendence:DT.3/deep-unit-exp-log-adapter` (comparison).

For a finite extension E/ℚp with absolute ramification index e, import localExponential, localLogarithm and deepUnitExpLogEquiv from LocalFieldsRamification Layer 1. On vp(z)>1/(p−1), exp z=Σk z^k/k! and vp(exp z−1)=vp(z). On vp(u−1)>1/(p−1), log u=Σk≥1(−1)^(k+1)(u−1)^k/k and vp(log u)=vp(u−1). The maps are inverse and satisfy log(uv)=log u+log v on these deep units. Hence vp(u^b−1)=vp(b)+vp(u−1) when b∈ℤ is nonzero and u≠1 lies in this domain.

Hypotheses and conventions:

- p is prime; E is a finite mixed-characteristic local field with the canonical ℚp structure.
- The threshold is strict; in integer depth i it is (p−1)i>e.
- The order formulas exclude z=0, u=1 and b=0; the corresponding norm formulas include them.

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.deep_log_exp` | compatibility | log(exp z)=z on the strict domain. |
| `LogarithmicForms.deep_exp_log` | compatibility | exp(log u)=u on the strict domain. |
| `LogarithmicForms.deep_exp_order` | characterisation | vp(exp z−1)=vp(z). |
| `LogarithmicForms.deep_log_order` | characterisation | vp(log u)=vp(u−1). |

Proof or construction:

1. Use the supplier’s named convergence and inverse milestones, not a new logarithm on all units.
2. Legendre’s factorial inequality shows terms after the first have strictly greater order, proving the norm isometry on the sharp domain.
3. The logarithm has the same leading-term domination. The inverse and homomorphism identities give the power formula.

Prerequisites: `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`, [Prime-ideal order and the local analytic normalization](#finite-place-normalization-adapter), `mathlib:sub_one_mul_padicValNat_factorial_lt_of_ne_zero`.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §1, proof of Lemma 1.4, equations (1.6)–(1.8), pp.24–25. The one-power bound invokes inverse analytic functions only after moving into the strict domain.

Source: [Kunrui Yu, Linear forms in p-adic logarithms](https://archive.mpim-bonn.mpg.de/id/eprint/3587/1/preprint_1987_20.pdf), Chapter I §2, remark after Lemma 1.1, p.14; §3, pp.15–18. A scaled exponential is normal when its coefficient order exceeds 1/(p−1).

Acceptance:

- At p=2 use depth≥2 over ℚ2; depth 1 contains −1, where log cannot be injective.
- At p=3, u=4 gives vp(log u)=vp(u−1)=1.

<a id="normal-series-adapter"></a>

### Yu’s normal functions on the existing restricted-series carrier

Target `DiophantineApproximationAndTranscendence:DT.3/normal-series-adapter` (comparison).

Use the one-variable existing restricted power-series carrier over a complete finite extension E/ℚp. A series F=Σak z^k is normal when every ak is integral and ak→0. Its evaluation converges for every integral z, has integral value, and is determined by its coefficients. Translation by an integral c has coefficients Σk≥t binom(k,t)ak c^(k−t)=F^(t)(c)/t!, again integral and tending to zero. If F has zeros of orders≥mi at distinct integral ci, then F=G∏i(z−ci)^mi for a normal G. For δ with vp(δ)>1/(p−1), exp(δz) is normal.

Hypotheses and conventions:

- E is complete and nonarchimedean of characteristic zero; coordinates are integral.
- Use MvPowerSeries.IsRestricted at radius 1, or the equivalent TauCeti restricted subring; no new Tate-algebra carrier.

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.normal_eval_integral` | characterisation | Integral coordinates give integral values. |
| `LogarithmicForms.normal_translate` | functoriality | Integral translation preserves normality. |
| `LogarithmicForms.normal_jet` | characterisation | F^(t)(c)/t! is integral and tends to zero as t tends to infinity. |
| `LogarithmicForms.normal_divide_zeros` | other | Remove the specified finite product of zero factors within normal functions. |
| `LogarithmicForms.normal_exp` | compatibility | exp(δz) is normal on the strict exponential domain. |

Checks of the definition or construction:

- **`LogarithmicForms.normal_constant`** (degenerate): The constant 1 is normal, and every positive jet is 0.
- **`LogarithmicForms.normal_linear_translation`** (compatibility): For F=z−1, translation by 1 gives z.
- **`LogarithmicForms.normal_bad_geometric`** (non-example): Σz^k fails restrictedness although all coefficients are integral.
- **`LogarithmicForms.normal_exponential_boundary`** (non-example): At p=2, the coefficients of exp(2z) do not tend to 0 along k=2^r.

Proof or construction:

1. Identify a one-variable coefficient sequence with Fin 1 multivariate coefficients, and compare restrictedness at radius 1.
2. Uniform ultrametric convergence on the integral disc justifies translation and normalized termwise derivatives; binomial coefficients are integral.
3. At a zero translate, remove the initial zero coefficients, and translate back. Iterate over distinct zeros.
4. For exp(δz), vp(δ^k/k!)≥k(vpδ−1/(p−1)) tends to infinity.

Prerequisites: `mathlib:MvPowerSeries.IsRestricted`, `tauceti:TauCeti.Huber.restrictedMvPowerSeriesSubring`, `tauceti:TauCeti.Huber.mem_restrictedMvPowerSeriesSubring`, `mathlib:sub_one_mul_padicValNat_factorial_lt_of_ne_zero`, [Sharp deep-unit exponential and logarithm interface](#deep-unit-exp-log-adapter).

Source: [Kunrui Yu, Linear forms in p-adic logarithms](https://archive.mpim-bonn.mpg.de/id/eprint/3587/1/preprint_1987_20.pdf), Chapter I §2, definition, Lemma 1.1 and remark, pp.12–14. Normality adds integral coefficients to restrictedness; integral translations and zero division preserve it.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §1, paragraph before Lemma 1.2, p.22. The later argument uses this analytic class in the extrapolation lemma.

Acceptance:

- The series Σz^k has integral coefficients but is not restricted and is not normal.
- exp(pz) is normal for odd p; exp(4z) is normal at p=2.

<a id="hermite-interpolation-denominator-bound"></a>

### Hermite interpolation with a p-adic denominator bound

Target `DiophantineApproximationAndTranscendence:DT.3/hermite-interpolation-denominator-bound` (theorem).

Let p,q be distinct primes, q|R, R,M≥1, θ>0 rational, and a∈E with vp(a)=θ. Put I={s∈ℤ:1≤s≤R,q∤s}, N=M#I=(1−1/q)RM, A=Nθ+Mvp(R!)+(M−1)log R/log p. For any prescribed jets jt,s in E, 0≤t<M, there is a unique polynomial Q of degree<N with Q^(t)(sa)/t!=jt,s. If vp(jt,s)+tθ≥A for all s,t, each coefficient ck of Q satisfies vp(ck)+kθ≥Nθ. In particular ck is integral because k<N, Q is normal, and vp(Q(ya))≥Nθ for every p-integral y.

Hypotheses and conventions:

- E is a complete p-adic field containing a; zero jets have infinite order.
- The interpolation derivatives are normalized by t!; nodes sa are pairwise distinct.

Proof or construction:

1. Use the Chinese remainder decomposition E[z]/∏s(z−sa)^M and choose its unique representative of degree<N.
2. Write each Hermite basis term as (z−sa)^t times ∏r≠s((z−ra)/(sa−ra))^M times the appropriate truncated inverse at sa.
3. Count the p-power denominators of products of integer differences: their cost is at most Mvp(R!)+(M−1)log R/log p. The powers of a add at most (N−t)θ.
4. The coefficient of degree k in a basis term for the t-th jet has order at least (t−k)θ−Mvp(R!)−(M−1)log R/log p. The jet hypothesis therefore gives vp(ck)+kθ≥Nθ after summation.

Prerequisites: [Yu’s normal functions on the existing restricted-series carrier](#normal-series-adapter), `mathlib:padicValNat_factorial`.

Source: [Kunrui Yu, Linear forms in p-adic logarithms](https://archive.mpim-bonn.mpg.de/id/eprint/3587/1/preprint_1987_20.pdf), Chapter I §4, proof of Lemma 1.4, equations (1.10)–(1.16), pp.19–25; Appendix, Theorem A, pp.144–149. The interpolation formula and denominator count replace a p-adic contour integral.

Acceptance:

- At M=1 there are no higher normalized jets.
- The node count excludes q-divisible s, but vp(R!) still uses the full R factorial.
- For R=q=2,M=1,p=3 there is one node and the interpolant is constant.

<a id="yu-normal-schwarz-extrapolation"></a>

### Yu’s normal-function extrapolation lemma

Target `DiophantineApproximationAndTranscendence:DT.3/yu-normal-schwarz-extrapolation` (theorem).

With the primes, integers, θ and a of hermite-interpolation-denominator-bound, let F be normal. If min_{s∈I,0≤t<M}(vp(F^(t)(sa)/t!)+tθ)≥Nθ+Mvp(R!)+(M−1)log R/log p, then for every k∈ℤ, vp(F((k/q)a))≥Nθ, where N=(1−1/q)RM.

Hypotheses and conventions:

- θ>0, M,R≥1, q|R, q≠p, and vp(a)=θ.
- All evaluated coordinates are integral since q is a p-adic unit.

Proof or construction:

1. Form the Hermite interpolant Q. Its strengthened jet budget bounds Q((k/q)a) by order≥Nθ using its basis formula.
2. The difference F−Q has order≥M at every sa. Divide by their M-th-power product within normal functions.
3. At (k/q)a every difference from a node has order≥θ. The product has order≥Nθ and the normal quotient is integral.
4. Apply the ultrametric inequality to Q plus the product remainder.

Prerequisites: [Hermite interpolation with a p-adic denominator bound](#hermite-interpolation-denominator-bound), [Yu’s normal functions on the existing restricted-series carrier](#normal-series-adapter).

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §1, Lemma 1.2, p.23. The exact factorial and logarithmic losses in the jet hypothesis.

Source: [Kunrui Yu, Linear forms in p-adic logarithms](https://archive.mpim-bonn.mpg.de/id/eprint/3587/1/preprint_1987_20.pdf), Chapter I §4, Lemma 1.4 and its proof, pp.18–26. Constructs Q and factors the normal remainder to reach the fractional grid.

Acceptance:

- The conclusion concerns every integer k, including q-divisible ones.
- Dropping the factorial denominator loss would not follow from this proof.

<a id="finite-place-liouville-adapter"></a>

### Finite-place Liouville for integer polynomials

Target `DiophantineApproximationAndTranscendence:DT.3/finite-place-liouville-adapter` (comparison).

Let K be a number field of degree D, P above p with residue degree f, and F∈ℤ[X1,…,Xr] have length L≥1 and degree≤Nj in Xj. For βj∈K, F(β)≠0 implies ordP(F(β))≤D/(f log p)(log L+Σj Nj h(βj)). Dividing by e gives the normalized vp bound.

Hypotheses and conventions:

- The polynomial coefficients are rational integers; the evaluation is nonzero.
- Negative exponents must first be represented with inverse variables, using equal inverse height.

Proof or construction:

1. Bound the local evaluation at all other places by length and the separate scalar heights.
2. At P isolate its negative log contribution in the global product formula.
3. Use vP=(p^f)^−ordP and the absolute-height normalization.

Prerequisites: [Prime-ideal order and the local analytic normalization](#finite-place-normalization-adapter), [Polynomial length and block degrees](#polynomial-length-and-block-degree), [Absolute-height calculus from relative heights](#absolute-height-calculus-adapter), `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-0-places-completions-and-the-product-formula`.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §1, Lemma 1.3, p.23. The evaluation bound converts an analytic high-order estimate to exact zero.

Acceptance:

- For F=X−1, β=1+p^k over ℚ the inequality is k≤log(2(1+p^k))/log p.
- A zero evaluation is excluded, rather than assigned a finite order.

<a id="yu-one-power-explicit-bound"></a>

### An explicit one-power bound over a number field

Target `DiophantineApproximationAndTranscendence:DT.3/yu-one-power-explicit-bound` (theorem).

For α∈Kˣ, b∈ℤ nonzero, α^b≠1, and P above p of ramification e and residue degree f, ordP(α^b−1)≤D/(f log p){log(2|b|)+(p^f−1)(1+1/(p−1))e h(α)}, where D=[K:ℚ].

Hypotheses and conventions:

- K is a number field; p is prime; α^b≠1.
- No unit or non-torsion assumption is imposed on α.

Proof or construction:

1. If ordPα≠0, the left side is≤0. If α is torsion, apply finite-place Liouville to its nontrivial torsion power minus 1.
2. For a non-torsion unit take its residue order s≤p^f−1 and then the least κ bringing α^(sp^κ) into vp>1/(p−1); its minimality gives p^κ≤(1+1/(p−1))e.
3. Use deep-unit-exp-log-adapter to identify vp((α^(sp^κ))^b−1)=vp(b)+vp(α^(sp^κ)−1).
4. Apply finite-place Liouville and h(α^(sp^κ))=sp^κhα, then ef≤D and vp(b)≤log|b|/log p.

Prerequisites: [Finite-place Liouville for integer polynomials](#finite-place-liouville-adapter), [Sharp deep-unit exponential and logarithm interface](#deep-unit-exp-log-adapter), [Absolute-height calculus from relative heights](#absolute-height-calculus-adapter), `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §1, Lemma 1.4 and proof, pp.23–25. This separate lemma supplies the length-one reduction without padding an unproved full-Kummer hypothesis.

Acceptance:

- The p=2 threshold is strict and requires the extra power when necessary.
- For a nonunit the positive right side bounds a nonpositive order.

## Auxiliary arithmetic and Kummer descent

The integer-coefficient relative Siegel bound and bounded monomial basis feed the auxiliary construction. Prime-power irreducibility and radical relations feed its fractional-grid contraction. Effective house and short-relation constants are separate inputs.

<a id="relative-siegel-polynomial-row-adapter"></a>

### Polynomial rows in the relative Siegel bound

Target `DiophantineApproximationAndTranscendence:DT.3/relative-siegel-polynomial-row-adapter` (comparison).

Let K/ℚ have degree D, γij=Pij(β1,…,βr) with Pij∈ℤ[X], degrees in Xk bounded by Nik, and each polynomial row nonzero. Put X=∏i(Σj length(Pij)^2)^(1/2)·exp(Σk h(βk)Σi Nik). If n>mD, there is y∈ℤ^n nonzero with Σj γij yj=0 for all i and max|yj|≤X^(D/(n−mD)).

Hypotheses and conventions:

- There are m rows and n unknowns; a zero evaluated row may simply be removed.
- The input is the relative integer-solution theorem of ArithmeticHeights Layer 5.6, not a solution in OK.

Proof or construction:

1. Import the relative Bombieri–Vaaler theorem through DT.0’s height owner with base field ℚ. Its discriminant factor is 1.
2. Bound the absolute Arakelov height of each evaluated row by its Euclidean coefficient-length norm times the monomial height factors.
3. Multiply row bounds and take the geometric mean of the nonzero integer kernel vectors. Every rational integer vector height is its maximum coordinate magnitude.

Prerequisites: `DiophantineApproximationAndTranscendence:DT.0`, [Absolute-height calculus from relative heights](#absolute-height-calculus-adapter), [Polynomial length and block degrees](#polynomial-length-and-block-degree).

Source: [Kunrui Yu, Linear forms in p-adic logarithms. III](https://www.numdam.org/item/CM_1994__91_3_241_0.pdf), §1, Lemma 1.2, pp.248–249. The improved row-product bound replaces the older maximum-row estimate.

Acceptance:

- Use the product of row bounds, retaining the improved average τ0 cost in the auxiliary construction.
- The condition n>mD is strict.

<a id="dyadic-binomial-irreducibility-adapter"></a>

### Prime-power binomials with the dyadic hypothesis

Target `DiophantineApproximationAndTranscendence:DT.3/dyadic-binomial-irreducibility-adapter` (theorem).

Let K have characteristic zero, q be prime, k≥1, and a∈K. If q=2 assume i∈K with i²=−1. Then X^(q^k)−a is irreducible if and only if a is not a q-th power in K. The odd-prime assertion is imported directly from Mathlib; only the dyadic consequence under i∈K is a new target.

Hypotheses and conventions:

- The i hypothesis is mandatory when q=2.
- If a=0 then a is a q-th power and the irreducibility assertion is false.

Proof or construction:

1. For q odd apply the pinned prime-power criterion.
2. For q=2 start with the pinned prime criterion and induct using X_pow_mul_sub_C_irreducible.
3. If a root β of X^(2^r)−a were a square in K(β), its norm would make −a a square in K. Since −1=i², this would make a a square, contradiction.
4. Conversely a=b^q gives the usual difference-of-powers factorization for k≥1.

Prerequisites: `mathlib:X_pow_sub_C_irreducible_iff_of_prime_pow_of_ne_two`, `mathlib:X_pow_sub_C_irreducible_iff_of_prime`, `mathlib:X_pow_mul_sub_C_irreducible`.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §1, Lemma 1.8, p.28. The prime-power criterion used for torsion roots includes i in the dyadic case.

Acceptance:

- Over ℚ, X⁴+4 is reducible although −4 is not a square; hence the i hypothesis cannot be removed.
- Over ℚ(i), −4=(2i)², so this example does not satisfy the non-square hypothesis.

<a id="multi-radical-relation-adapter"></a>

### The relation alternative for a prime-radical tower

Target `DiophantineApproximationAndTranscendence:DT.3/multi-radical-relation-adapter` (theorem).

Let K have characteristic zero and contain all q-th roots of unity, q prime, αj∈Kˣ, and chosen θj with θj^q=αj. Put L=K(θ1,…,θr). For α∈Kˣ and θ^q=α, either [L(θ):L]=q or α=γ^q∏j αj^ij with γ∈Kˣ and 0≤ij<q. In the second case a q-th root is already in L. If the q-power classes of α1,…,αr are independent, the θ-monomials ∏θj^ij, 0≤ij<q, are a K-basis and [L:K]=q^r.

Hypotheses and conventions:

- K contains μq; all radicals are taken in one algebraic closure.
- The relation conclusion belongs to K; γ is not merely an element of L.

Proof or construction:

1. Apply the prime binomial criterion to the last extension.
2. The finite radical compositum is Galois; automorphisms embed into μq^r by their values on the chosen roots, using the pinned cyclic-binomial action at each irreducible step.
3. If θ∈L, its ratios σθ/θ form a character of this subgroup. A character extends to μq^r by elementary finite-field linear algebra. Divide θ by the corresponding θ-monomial.
4. The quotient is fixed by the full Galois group and hence lies in K. Taking q-th powers gives the displayed relation. For independent classes iterate and use the tower bases.

Prerequisites: `mathlib:X_pow_sub_C_irreducible_iff_of_prime`, `mathlib:autEquivRootsOfUnity`, [Prime-power binomials with the dyadic hypothesis](#dyadic-binomial-irreducibility-adapter).

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §1, Lemma 1.9, p.28; §3, Proposition 3.1, pp.67–69. The prime-radical relation is the algebraic input to descent from the full Kummer condition.

Acceptance:

- For K=ℚ, q=2, α1=2, α=8, the relation is 8=2·2² and the new root is already in ℚ(√2).
- For α1=2,α2=3 over ℚ the square classes are independent and the four radical monomials form a basis.
- The base-field condition μq⊂K is retained in this adapter.

<a id="bounded-total-degree-field-basis"></a>

### A monomial basis with bounded total degree

Target `DiophantineApproximationAndTranscendence:DT.3/bounded-total-degree-field-basis` (construction).

Let F⊂K be a finite field extension of degree d generated by α1,…,αn. There is an F-basis consisting of monomials ∏j αj^kj with kj≥0 and Σkj≤d−1. In Yu’s setting F=ℚ(α0), [F:ℚ]=D0, [K:F]=D1, combine this basis with 1,α0,…,α0^(D0−1) to get a rational basis ξd0,d=α0^d0∏j αj^kjd, with 0≤d0<D0 and Σj kjd≤D1−1.

Hypotheses and conventions:

- The αj generate the extension as a field and are algebraic over F.
- α0 is a primitive torsion root in Yu’s application, so its powers form the indicated F/ℚ basis.

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.boundedMonomialBasis_exists` | constructor | There is a basis with total degree≤d−1. |
| `LogarithmicForms.boundedMonomialBasis_height` | characterisation | h(ξd0,d)≤Σj kjd h(αj)≤(D1−1)maxj h(αj). |
| `LogarithmicForms.boundedMonomialBasis_tower` | compatibility | The combined family is a rational basis of K of size D0D1. |

Checks of the definition or construction:

- **`LogarithmicForms.monomial_basis_degree_one`** (degenerate): For d=1 the basis can be {1}.
- **`LogarithmicForms.monomial_basis_quadratic`** (computed): For ℚ(√2), {1,√2} has total exponents 0,1.
- **`LogarithmicForms.monomial_basis_biquadratic`** (compatibility): For ℚ(√2,√3), {1,√2,√3,√6} has total degrees 0,1,1,2≤3.
- **`LogarithmicForms.basis_not_all_monomials`** (non-example): The spanning monomials need not all be independent; repeated generators must be removed.

Uses:

- Yu 1990, Lemma 2.1; Yu 1994, Lemma 2.1: Restricts row-polynomial degrees before the relative Siegel bound.

Proof or construction:

1. Let Vs be the span of monomials of total degree≤s. V0 has dimension 1.
2. If Vs=Vs+1, it is stable under all generator multiplications and contains their generated algebra; for algebraic generators that algebra is K.
3. Until Vs=K its dimension strictly increases. Therefore Vd−1=K. Extract a basis from this finite spanning set.
4. Use the ordinary tower basis and absolute-height monomial inequalities.

Prerequisites: `DiophantineApproximationAndTranscendence:DT.3/galois-subfield-containing-finite-set`, [Absolute-height calculus from relative heights](#absolute-height-calculus-adapter), `mathlib:MvPolynomial`.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §2.3, basis selection before Lemma 2.1, pp.39–40. The chosen monomial rational basis limits the coefficient-height cost.

Acceptance:

- The bound is on total degree, not on each exponent separately.
- The actual basis may depend on α; the coefficient bound must be independent of its choice.

<a id="effective-house-input-adapter"></a>

### The effective house input used in the short-relation bound

Target `DiophantineApproximationAndTranscendence:DT.3/effective-house-input-adapter` (comparison).

For a nonzero algebraic integer α of degree d that is not a root of unity, the height owner must supply log house(α)>1/(2d²). Consequently h(α)>1/(2d³). This is a quantitative hypothesis: Northcott and Kronecker alone do not yield this numerical constant. DT.0 must import the effective ArithmeticHeights Part II result rather than introducing another height or house.

Hypotheses and conventions:

- α is integral, nonzero and not torsion; d≥1.
- The source’s large-degree and small-degree arguments must both be accounted for.

Proof or construction:

1. Use DT.0’s Mahler-measure/height comparison to get hα≥log house(α)/d.
2. Yu’s cited large-degree estimate handles d≥21; the remaining degrees use nonreciprocal and reciprocal estimates with explicit constants.
3. The original sources for the small-degree numerical verification and its refinement at d=18,20 are not read in this proof decomposition and are a recorded gap.

Prerequisites: `DiophantineApproximationAndTranscendence:DT.0/height-comparisons`, `DiophantineApproximationAndTranscendence:DT.0`.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §1, Lemma 1.10 and proof, pp.28–29. Uses Dobrowolski’s effective argument, Smyth’s nonreciprocal estimate and Boyd’s small-degree checks.

Acceptance:

- For d=1, an integer with |α|≥2 has log house≥log2>1/2.
- A root of unity has house 1 and must be excluded.
- A finite positive height minimum from Northcott is not substituted for 1/(2d³).

<a id="short-logarithmic-relation"></a>

### A bounded integer relation among dependent logarithms

Target `DiophantineApproximationAndTranscendence:DT.3/short-logarithmic-relation` (theorem).

Let K be a number field of degree D, and m≥2 chosen complex logarithms ℓ1,…,ℓm with exp ℓj∈Kˣ that are Q-linearly dependent. Choose Vj≥max(h(exp ℓj),|ℓj|/(2πD)), Vj>0. There are integers tj, not all zero, with Σj tjℓj=0 and |tk|≤[2(m−1)D³]^(m−1)∏j Vj/Vk for every k.

Hypotheses and conventions:

- The dependence is among the chosen logarithms, retaining any 2πi contribution.
- No division by a zero Vj is permitted.

Proof or construction:

1. Use the discrete lattice generated by logarithmic images modulo torsion and its rank-deficient relation map.
2. For a nonzero non-torsion algebraic integer, the effective-house input gives h>1/(2d³). For a nonintegral algebraic number of degree d, its primitive integer minimal polynomial has leading coefficient at least 2, hence h≥log 2/d>1/(2d³). Here d≤D. A torsion logarithm instead has zero height and its nonzero 2πi branch contribution must be retained explicitly in the logarithmic lattice.
3. Apply the geometry-of-numbers relation argument with the separate Vj weights; primitive scaling gives integer coefficients.
4. The cited Waldschmidt relation proof and Yu’s improved 2D² input have not been fully independently traced; record the exact missing supplier proof.

Prerequisites: [The effective house input used in the short-relation bound](#effective-house-input-adapter), [Absolute-height calculus from relative heights](#absolute-height-calculus-adapter), `DiophantineApproximationAndTranscendence:DT.3/algebraic-logarithms`.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §1, Lemma 1.11 and proof, p.29. The improved constant replaces 9D² by 2D² in the earlier short-relation argument.

Acceptance:

- For ℓ1=log2,ℓ2=log4, the primitive relation is (2,−1).
- A multiplicative relation without its 2πi correction is not sufficient for the stated exact logarithmic relation.

## Yu interpolation

Torsion classes split the finite coefficient box before Siegel is applied. Analytic extrapolation, arithmetic zero forcing and q-power box contraction alternate. The parameter theorem must simultaneously establish all of their budgets.

<a id="yu-torsion-and-deep-unit-coordinates"></a>

### Torsion and deep-unit coordinates for Yu interpolation

Target `DiophantineApproximationAndTranscendence:DT.3/yu-torsion-and-deep-unit-coordinates` (definition).

In the Yu unit setup put G=p^f−1, μ=ordq(G), G0=G/q^u, G1=G/q^μ, so G0=q^(μ−u)G1 and gcd(G1,q)=1. In K_P choose a primitive G-th root ζ with ζ^G0=α0^(p^v), and a q-th root ξ of ζ in an algebraic closure of K_P. Choose κ≥0 and residues 0≤rj<G with δj=αj^(p^κ)ζ^rj satisfying vp(δj−1)>θ+1/(p−1), θ>0 rational. Then log δj and exp(z log δj) are defined for integral z, and δj^(1/q)=exp(q⁻¹log δj). Choose compatible q-th roots of αj so δj^(1/q)=(αj^(1/q))^(p^κ)ξ^rj. For the analytic rescaling choose a finite complete extension E/K_P containing ξ, the compatible roots and an element aθ with vp(aθ)=θ. Such an element can be adjoined since θ is rational. Then exp(aθ⁻¹z log δj) is defined and normal on E’s closed unit disc.

Hypotheses and conventions:

- K is a number field of degree D; P lies above p with ramification index e and residue degree f; n≥2.
- Put q=3 when p=2 and q=2 otherwise. At p=2 assume ζ3∈K; at p≡1 mod4 assume i∈K; at p≡3 mod4 assume f odd or i∈K.
- Let q^u and p^v be the largest q-power and p-power orders of roots of unity in K. Choose α0 primitive of order p^v q^u.
- αj are P-units; θ>0 is rational and κ is large enough for the displayed strict inequality.

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.yu_G0_eq` | characterisation | G0=q^(μ−u)G1. |
| `LogarithmicForms.yu_G1_coprime` | characterisation | gcd(G1,q)=1. |
| `LogarithmicForms.yu_deep_unit_root` | compatibility | exp(q⁻¹log δj)=(αj^(1/q))^(p^κ)ξ^rj. |
| `LogarithmicForms.yu_deep_unit_normal` | compatibility | In the specified finite complete extension E, exp(aθ⁻¹z log δj) is normal, where vp(aθ)=θ. The symbol p^(−θ) abbreviates this chosen scalar inverse, not an arbitrary rational power in K_P. |

Checks of the definition or construction:

- **`LogarithmicForms.yu_residue_quotients`** (computed): For p=7,f=1,q=2,u=1, μ=1 and G0=G1=3.
- **`LogarithmicForms.yu_larger_q_part`** (non-example): For p=5,f=2,q=2,u=2, G=24,μ=3,G0=6,G1=3; their roles cannot be exchanged.
- **`LogarithmicForms.yu_trivial_unit`** (degenerate): For αj=1 choose rj=0; δj=1 and every logarithmic exponential is 1.
- **`LogarithmicForms.yu_q_root_power`** (compatibility): The analytic q-th root raised to q is δj.

Uses:

- Yu 1990, §2.3 and §2.4: Splits torsion coefficients and compares fractional-grid evaluations to algebraic radicals.
- Yu 1994, §2.4: Provides the normal exponential factors for the improved interpolation parameters.

Proof or construction:

1. Use the residue-field multiplicative group and LocalFieldsRamification’s Teichmüller lift to choose ζ; match its q-primary part with α0^(p^v).
2. First multiply αj by a residue root to obtain a principal unit. Repeated p-th powering raises its order until it exceeds the chosen sharp threshold.
3. Apply the imported exponential/logarithm equivalence. Since q≠p, division by q preserves the analytic domain.
4. Adjust the chosen algebraic q-th roots by μq to match the analytic roots. Adjoin aθ with vp(aθ)=θ in a finite complete extension, so the strict inequality makes exp(aθ⁻¹z log δj) normal by the factorial valuation bound. The G0 and G1 definitions are checked before residue-class calculations. The extra analytic extension does not replace K in any arithmetic height or degree count.

Prerequisites: `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`, [Prime-ideal order and the local analytic normalization](#finite-place-normalization-adapter), [Sharp deep-unit exponential and logarithm interface](#deep-unit-exp-log-adapter), [Prime-power binomials with the dyadic hypothesis](#dyadic-binomial-irreducibility-adapter).

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §2, equations (2.19)–(2.25), pp.33–34. The two distinct quotients G0 and G1 control the torsion and prime-to-q congruences.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. III](https://www.numdam.org/item/CM_1994__91_3_241_0.pdf), §1, Lemma 1.1, p.248; §2 before §2.1, p.253. The stronger depth estimate changes the scaling parameter, while retaining the compatible root construction.

Acceptance:

- The analytic exponent is used only after moving into the strict domain.
- The arbitrary primitive q-th root used in the algebraic extension may differ from the analytic choice; the compatibility adjustment is part of the definition.

<a id="yu-auxiliary-interpolation-functions"></a>

### Yu’s auxiliary interpolation functions

Target `DiophantineApproximationAndTranscendence:DT.3/yu-auxiliary-interpolation-functions` (definition).

Fix the torsion/deep-unit coordinates, box bounds Lj≥0 for −1≤j≤n, and a residue r modulo G1. Let C be the finite λ-box with Σj rjλj≡r mod G1. For integer coefficients pλ,d0,d and the bounded rational basis ξd0,d put pλ=Σd0,d pλ,d0,d ξd0,d. Define ΛJ(z,τ)=Δ(q^(−J)z+λ−1;L−1+1,λ0+1,τ0)∏j<n Δ(bnλj−bjλn;τj), and φJ(z,τ)=Σλ∈C pλΛJ(z,τ)∏j δj^(λjz). Split C into Ct by Σrjλj≡r+tG1 mod G0, 0≤t<q^(μ−u). Define φJ,t by the same φJ sum restricted to Ct. Put γλ,j=λj−(bj/bn)λn and fJ,t(z,τ)=Σλ∈Ct pλΛJ(z,τ)∏j<n δj^(γλ,j z). Here Δ(x;k,l,m) is the normalized derivative of Δ(x;k)^l, and Δ(x;t) denotes the rising-factorial polynomial.

Hypotheses and conventions:

- J≥0; τ∈ℕ^n; the basis indices have 0≤d0<D0 and 1≤d≤D1.
- bn has least p-order among the bj, so γλ,j is integral p-adically.
- ΛJ depends on λ, including λ0+1; replacing that exponent by L0+1 would change the interpolation matrix.

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.yu_aux_split` | characterisation | φJ is the sum of its Ct-restricted functions. |
| `LogarithmicForms.yu_aux_zero` | simp | Zero coefficients give φJ=fJ,t=0. |
| `LogarithmicForms.yu_aux_integral_exponents` | characterisation | vp(λj−bjλn/bn)≥0. |
| `LogarithmicForms.yu_aux_algebraic_integer_grid` | compatibility | At integer z the exponential factors are ordinary powers of δj. |

Checks of the definition or construction:

- **`LogarithmicForms.yu_aux_empty_box`** (degenerate): An empty congruence class gives φJ=0.
- **`LogarithmicForms.yu_aux_one_coefficient`** (computed): At z=0, with one λ=0 coefficient equal to 1 and τ=0, both φJ and fJ,t are 1 when that coefficient is in the selected class; Delta(0;k)=1.
- **`LogarithmicForms.yu_aux_projection`** (compatibility): For n=2,b=(1,2),λ=(1,1), γλ,1=1/2; this is integral at p=3.
- **`LogarithmicForms.yu_aux_least_order_needed`** (non-example): At p=2,b=(1,2), γλ,1=1/2 is not integral, so the least-order hypothesis fails.

Uses:

- Yu 1990, Lemma 2.1 and main inductive argument: Turns a bounded integer kernel vector into a long vanishing grid.
- Yu 1994, §2.3–§2.4: Uses the same finite sums with improved row-height and parameter estimates.

Proof or construction:

1. Use finite sums, the existing number-field basis and the Delta polynomial adapter.
2. Restrict the finite box by the two congruences; G0=q^(μ−u)G1 makes Ct a disjoint partition.
3. Interpret all local powers via exp(z log δj) on the integral disc.
4. The least-order condition makes bj/bn integral; the resulting exponential factors are normal after the aθ⁻¹ rescaling in the finite complete extension specified by the torsion/deep-unit target.

Prerequisites: [Torsion and deep-unit coordinates for Yu interpolation](#yu-torsion-and-deep-unit-coordinates), [The delta polynomials and their normalized derivatives](#delta-polynomial-adapter), [A monomial basis with bounded total degree](#bounded-total-degree-field-basis), [Yu’s normal functions on the existing restricted-series carrier](#normal-series-adapter).

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §2.2, equation (2.50), p.39; §2.4, equations (2.64)–(2.72), pp.43–45. Defines the interpolation weights, torsion split, and projected exponential function used in the induction.

Acceptance:

- All indices are finite, and a zero coefficient family gives the zero functions.
- The projected fJ,t and the algebraic φJ,t are distinguished; their difference is bounded rather than asserted to vanish.

<a id="yu-small-coefficient-auxiliary-function"></a>

### A nonzero auxiliary function with small integer coefficients

Target `DiophantineApproximationAndTranscendence:DT.3/yu-small-coefficient-auxiliary-function` (construction).

For each nonempty initial class Ct, take the algebraic equations φ0,t(s,τ)=0 with 1≤s≤S, q∤s, |τ|≤T. There are M0=(1−1/q)S binom(T+n,n) equations over K after dividing each row by its common local root-of-unity factor ζ^((r+tG1)s). With N0=D#Ct integer unknowns and N0>M0D, the relative Siegel polynomial-row bound gives a nonzero integer coefficient family of magnitude at most Xrow^(D/(N0−M0D)), where Xrow is the product of the Euclidean row-length and monomial-height bounds. If N0≥c0 M0D and Xrow≤X0^M0, its magnitude is at most X0^(1/(c0−1)). Join the independently solved Ct families to obtain the nonzero φ0 vanishing grid.

Hypotheses and conventions:

- K is a number field of degree D; P lies above p with ramification index e and residue degree f; n≥2.
- Put q=3 when p=2 and q=2 otherwise. At p=2 assume ζ3∈K; at p≡1 mod4 assume i∈K; at p≡3 mod4 assume f odd or i∈K.
- Let q^u and p^v be the largest q-power and p-power orders of roots of unity in K. Choose α0 primitive of order p^v q^u.
- Each αj, 1≤j≤n, is nonzero and a P-unit; bj∈ℤ, bn≠0 and vp(bn)=minj vp(bj); Θ=∏j αj^bj−1≠0.
- Vj≥max(h(αj),f log p/D); V1≤⋯≤Vn−1; no ordering of Vn is required.
- S≥1 is divisible by q, T≥0, c0>1, and the displayed unknown-count and row-product inequalities hold in every nonempty Ct.

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.yu_aux_initial_grid` | characterisation | φ0(s,τ)=0 for 1≤s≤S,q∤s,\|τ\|≤T. |
| `LogarithmicForms.yu_aux_coeff_bound` | characterisation | 0<max\|pλ,d0,d\|≤X0^(1/(c0−1)). |
| `LogarithmicForms.yu_aux_row_average` | compatibility | Σ\|τ\|≤T τ0=binom(T+n,n+1). |

Checks of the definition or construction:

- **`LogarithmicForms.yu_row_average_small`** (computed): For n=2,T=1 the three indices give τ0-sum 1=binom(3,3).
- **`LogarithmicForms.yu_unknown_count_boundary`** (non-example): N0=M0D does not satisfy the strict Siegel condition.
- **`LogarithmicForms.yu_aux_empty_initial_class`** (degenerate): An empty Ct contributes no unknowns and is omitted.
- **`LogarithmicForms.yu_integer_kernel`** (compatibility): For one rational row (1,2), the vector (2,−1) is an integer kernel vector.

Uses:

- Yu 1990, §2.4: Initializes J=0 with a nonzero coefficient family and a controlled arithmetic size.

Proof or construction:

1. The basis coefficients give integer unknowns. In Ct, write Σrjλj=r+tG1+G0kλ. At an integer grid point s, the factor ζ^(sΣrjλj) equals the common unit ζ^((r+tG1)s) times (α0^(p^v))^(skλ), which belongs to K. Divide by the common unit before treating these as K-valued rows. Powers of ζ^(G1s) give the separate class independence by the prime-power binomial criterion.
2. Use the bounded monomial basis and Delta denominator bounds to express every row by integer polynomials after common denominator clearing.
3. Apply the relative Siegel row adapter to each class separately. Retain the exact product of row bounds instead of replacing it by the worst row.
4. Average the derivative index: Σ|τ|≤T τ0=binom(T+n,n+1). This is the saving in Yu 1994, Lemma 2.1.
5. Choose a nonzero solution for every nonempty class and join them; the basis independence ensures the joined algebraic coefficient family is nonzero.

Prerequisites: [Yu’s auxiliary interpolation functions](#yu-auxiliary-interpolation-functions), [Polynomial rows in the relative Siegel bound](#relative-siegel-polynomial-row-adapter), [Denominators and growth of delta jets](#delta-denominators-and-growth), [Prime-power binomials with the dyadic hypothesis](#dyadic-binomial-irreducibility-adapter).

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §2.3, Lemma 2.1, pp.40–43. Splits the initial equations by torsion classes before constructing the integer kernel vector.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. III](https://www.numdam.org/item/CM_1994__91_3_241_0.pdf), §2.3, Lemma 2.1 and proof, pp.260–262. The product-of-rows Siegel bound improves the average derivative cost.

Acceptance:

- The strict inequality on integer unknowns counts D rational constraints per algebraic row.
- The proof does not use an OK solution in place of the required rational-integer coefficient solution.

<a id="yu-grid-extrapolation-and-contraction"></a>

### Grid extrapolation and contraction of the auxiliary box

Target `DiophantineApproximationAndTranscendence:DT.3/yu-grid-extrapolation-and-contraction` (theorem).

Suppose the Yu unit setup and full Kummer condition hold, and vp(Θ)≥U. Starting with the small-coefficient auxiliary function, for 0≤J≤floor(log Ln/log q)+1 obtain a nonzero integer family with the same coefficient bound, L−1^(J)=L−1, L0^(J)=L0, 0≤Lj^(J)≤q^(−J)Lj for 1≤j≤n, and φJ(s,τ)=0 for 1≤s≤q^J S,q∤s,|τ|≤q^(−J)T. This assertion requires the explicit analytic/arithmetic budget conditions described below and the terminal nonvanishing conditions of the parameter-selection target.

Hypotheses and conventions:

- K is a number field of degree D; P lies above p with ramification index e and residue degree f; n≥2.
- Put q=3 when p=2 and q=2 otherwise. At p=2 assume ζ3∈K; at p≡1 mod4 assume i∈K; at p≡3 mod4 assume f odd or i∈K.
- Let q^u and p^v be the largest q-power and p-power orders of roots of unity in K. Choose α0 primitive of order p^v q^u.
- Each αj, 1≤j≤n, is nonzero and a P-unit; bj∈ℤ, bn≠0 and vp(bn)=minj vp(bj); Θ=∏j αj^bj−1≠0.
- Vj≥max(h(αj),f log p/D); V1≤⋯≤Vn−1; no ordering of Vn is required.
- The chosen q-th roots satisfy [K(α0^(1/q),…,αn^(1/q)):K]=q^(n+1).
- The parameters satisfy the budget inequalities: at every J and k=0,…,n, set R=q^(J+k)S, M=floor((1−1/q)q^(−J)T/(n+1))+1, A=(L−1+1)(L0+1)(θ+1/(p−1)). In a finite complete extension containing aθ and a scalar cA with vp(cA)=A, the normalized jets of FJ,t(z,τ)=cA fJ,t(aθ⁻¹z,τ) have minimum order plus mθ at least (1−1/q)RMθ+Mvp(R!)+(M−1)log R/log p.
- The difference φJ,t(y,τ)−fJ,t(y,τ) has order at least U−T log(L−1+1)/log p−vp(bn), for positive p-integral rational y. This lower bound and (1−1/q)RMθ−A both exceed the finite-place Liouville upper bound on each cleared nonzero algebraic evaluation, including evaluations in K(α0^(1/q),…,αn^(1/q)).
- Ln≥1 for the displayed logarithmic terminal index. An initial Ln=0 box is treated directly by the terminal polynomial argument, whose precise grid/degree condition is recorded as a gap.

Proof or construction:

1. Induct on J. Within one J, extend the grid n times while reducing the derivative budget by (1−1/q)q^(−J)T/(n+1) at each step.
2. Differentiate the projected fJ,t and use the finite-difference identity for Delta: each normalized derivative is a controlled combination of nearby τ-indices. The normal-function Schwarz theorem applies with the displayed R,M,A.
3. Compare fJ,t to φJ,t using the small multiplicative form. At integer grid points first divide φJ,t by the common torsion unit ζ^((rJ+tG1)s); the remaining expression is a polynomial in α0,…,αn over K. At s/q use ξ^((rJ+tG1)s) instead, leaving a polynomial in the compatible q-th roots of α0,…,αn, of field degree q^(n+1)D. Clear the integer and q-power denominators using Yu 1994 Lemma 1.3, including its factorial q-order term. These root-of-unity factors have order zero. Finite-place Liouville applied in these arithmetic fields forces the grid values to vanish; the larger analytic field used to choose aθ,cA is not charged to those polynomial degrees.
4. At the fractional grid use the full radical monomial basis over K(ξ^G1). Its independence follows by the tower degree identity and the prime-power irreducibility of X^(q^(μ−u+1))−ζ_(q^u).
5. Write each exponent σj=λj*+qλj. Select a residue vector with a nonzero coefficient, retain that coefficient subfamily, and use the invertibility of q modulo G1 to define the next congruence. The bounds shrink by q while coefficient magnitudes do not grow.
6. At the terminal J, Ln^(J)=0. The finite-difference polynomial identities and the long grid force every retained coefficient to be zero, contradicting nonzero initialization. The untraced terminal argument imported from Yu 1989 is recorded as a gap.

Prerequisites: [A nonzero auxiliary function with small integer coefficients](#yu-small-coefficient-auxiliary-function), [Yu’s normal-function extrapolation lemma](#yu-normal-schwarz-extrapolation), [Finite-place Liouville for integer polynomials](#finite-place-liouville-adapter), [Denominators and growth of delta jets](#delta-denominators-and-growth), [The relation alternative for a prime-radical tower](#multi-radical-relation-adapter), [Prime-power binomials with the dyadic hypothesis](#dyadic-binomial-irreducibility-adapter).

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §2.4, main inductive argument and Lemmas 2.2–2.5, pp.43–60; §2.5, p.60. Alternates analytic extrapolation, arithmetic zero forcing and radical-basis contraction.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. III](https://www.numdam.org/item/CM_1994__91_3_241_0.pdf), §2.4, pp.262–263. Reuses the induction with improved arithmetic budgets; its denominator clearing must use the revised Lemma 1.3.

Acceptance:

- The fractional-grid Liouville step takes the degree q^(n+1)D of the radical field; omitting it invalidates the arithmetic budget.
- A nonzero residue subfamily is chosen before contraction; no claim that all residue subfamilies are nonzero is made.
- Terminal nonvanishing is an explicit recorded boundary rather than an unnamed zero-estimate import.

<a id="yu-improved-parameter-selection"></a>

### Improved integer parameters for Yu interpolation

Target `DiophantineApproximationAndTranscendence:DT.3/yu-improved-parameter-selection` (construction).

For the conditional-bound inputs choose positive c0,…,c4, ε1,ε2, κ,θ and U, and set Y=e f log p·U/(q^(n+1)D), S=q floor(c3(n+1)D W*/(f log p)), T=floor(Y/(c1c3 eθ W*)), L−1=floor W*, L0=floor(Y/(c1c4(L−1+1)log V*)), and Lj=floor(Y/(c1c2 n p^κ S Vj)). The target is a choice with all lengths nonnegative, Ln≥1 and S,T≥1, every nonempty initial class satisfying the small-coefficient theorem’s inequalities, and all the displayed grid-extrapolation budgets holding. In addition the terminal grid must exceed the exact degree needed to force the retained coefficients to vanish. Its U must be at most the conditional-bound right-hand side divided by e.

Hypotheses and conventions:

- K is a number field of degree D; P lies above p with ramification index e and residue degree f; n≥2.
- Put q=3 when p=2 and q=2 otherwise. At p=2 assume ζ3∈K; at p≡1 mod4 assume i∈K; at p≡3 mod4 assume f odd or i∈K.
- Let q^u and p^v be the largest q-power and p-power orders of roots of unity in K. Choose α0 primitive of order p^v q^u.
- Each αj, 1≤j≤n, is nonzero and a P-unit; bj∈ℤ, bn≠0 and vp(bn)=minj vp(bj); Θ=∏j αj^bj−1≠0.
- Vj≥max(h(αj),f log p/D); V1≤⋯≤Vn−1; no ordering of Vn is required.
- The chosen q-th roots satisfy [K(α0^(1/q),…,αn^(1/q)):K]=q^(n+1).
- B≥max(3,maxj|bj|); W*,V* are as defined in yu-full-kummer-conditional-bound; κ and θ satisfy the strict deep-unit inequality.

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.yu_parameter_q_divides_S` | characterisation | q divides S. |
| `LogarithmicForms.yu_parameter_box_shrink` | compatibility | The contracted positive-exponent lengths are at most q^(−J)Lj. |
| `LogarithmicForms.yu_parameter_budgets` | characterisation | The output satisfies all stated initial, jet, arithmetic and terminal inequalities. |

Checks of the definition or construction:

- **`LogarithmicForms.yu_S_rounding`** (computed): For q=3 and c3(n+1)D W*/(f log p)=4.2, S=12.
- **`LogarithmicForms.yu_L_rounding`** (computed): If Y/(c1c2np^κSVj)=2.9, Lj=2.
- **`LogarithmicForms.yu_floor_zero_rejected`** (non-example): A numerical input giving S=0 fails acceptance; no division by S is performed.
- **`LogarithmicForms.yu_strict_log_positive`** (compatibility): V*≥p^f>1 guarantees log V*>0.

Uses:

- Yu 1994, Theorem 2.1: Turns the qualitative interpolation contradiction into a calibrated explicit constant.

Proof or construction:

1. Use the improved U formula in Yu 1994 equation (2.30), p.255, the rounded lengths in equation (2.31), p.256, and the four p/e regimes in §2.6, pp.265–266. Equations (2.28)–(2.29), pp.254–255, state the budget requirements; they replace the older constants.
2. Prove the feasibility count, the Delta row product estimate and the normalized-jet budget from the rounded lengths. Floor losses are retained at every step.
3. Check the cases n=2,…,7 separately from n≥8; no replacement by a large-n table row is accepted without domination proof.
4. Recheck the q-denominator contribution Jkl+l vpq(k!) at fractional grid arguments; the q and p orders are distinct.
5. The complete interval verification, inherited terminal polynomial argument and the source’s exact special-parameter tables have not been independently validated in this proof decomposition; their necessary inequalities and numeric end bound are recorded as a gap.

Prerequisites: [Torsion and deep-unit coordinates for Yu interpolation](#yu-torsion-and-deep-unit-coordinates), [A nonzero auxiliary function with small integer coefficients](#yu-small-coefficient-auxiliary-function), [Grid extrapolation and contraction of the auxiliary box](#yu-grid-extrapolation-and-contraction).

Source: [Kunrui Yu, Linear forms in p-adic logarithms. III](https://www.numdam.org/item/CM_1994__91_3_241_0.pdf), §2.1, equations (2.28)–(2.30), pp.254–255; §2.2, equation (2.31), p.256; §2.4, pp.262–263; §2.5–§2.6, pp.263–266. Supplies the rounded lengths and numerical inequalities for the improved conditional estimate.

Acceptance:

- The output is a simultaneous feasibility and comparison theorem, not just the displayed floor definitions.
- The parameter gap must be discharged before claiming any numerical Yu end theorem is closed.

<a id="yu-full-kummer-conditional-bound"></a>

### Yu’s estimate under the full Kummer condition

Target `DiophantineApproximationAndTranscendence:DT.3/yu-full-kummer-conditional-bound` (theorem).

In the Yu unit setup with full Kummer condition, put V*=max(p^f,(2^11·3nD²Vn−1)^n). Choose B≥max(3,max|bj|), Bn≥|bn|, B′≥maxj<n|bj|, B0≥1 and B0≥min{|bj|:bj≠0}. Put ρ=16/3 for p=2 and ρ=5 otherwise, ρ″=1 if p|bn and 0 otherwise. Assume W≥max(log(1+(f log p/D)(Bn/V1+B′/Vn)/(ρ n)),ρ″log B0,2.95 log p) and W*≥max(W,nlog(2^11·3nD)). Then ordP Θ < c a^n ((n+1)^(n+1)n^n/n!) ((p^f−1)/(q^u(f log p)^(n+2))) D^(n+2)(∏Vj)W*log V*. Use the uniform dominating constants (c,a)=(105203.19,48) at p=2; (67313.63,40) at p=3, or p=5 with e≥2; (199585.97,40) at p≥7,e≥2; and (33910.91η1,20η2) at p≥5,e=1, where η1=p(p−1)/(p−2)² and η2=(p−1)/(p−2). These dominate every finite small-n row as well as the n≥8 row.

Hypotheses and conventions:

- K is a number field of degree D; P lies above p with ramification index e and residue degree f; n≥2.
- Put q=3 when p=2 and q=2 otherwise. At p=2 assume ζ3∈K; at p≡1 mod4 assume i∈K; at p≡3 mod4 assume f odd or i∈K.
- Let q^u and p^v be the largest q-power and p-power orders of roots of unity in K. Choose α0 primitive of order p^v q^u.
- Each αj, 1≤j≤n, is nonzero and a P-unit; bj∈ℤ, bn≠0 and vp(bn)=minj vp(bj); Θ=∏j αj^bj−1≠0.
- Vj≥max(h(αj),f log p/D); V1≤⋯≤Vn−1; no ordering of Vn is required.
- The chosen q-th roots satisfy [K(α0^(1/q),…,αn^(1/q)):K]=q^(n+1).
- n≥2; use the uniform constants justified by the finite row comparisons below.

Proof or construction:

1. Take the improved parameter selection. If vp Θ≥U, grid extrapolation and contraction reach the terminal nonvanishing contradiction. Therefore vp Θ<U.
2. Multiply by e to return to ordP. Compare the exact parameter U to the displayed c a^n factor.
3. For a field K larger than Q(α0,…,αn), restrict the prime and compare D/f, e and p^f−1 using finite-place-normalization-adapter and the monotonic function (p^x−1)/x.
4. The arithmetic calibration gap covers the exact numeric comparisons, including the finite small-n cases.
5. For each regime compare csmall·asmall^n with cuniform·auniform^n. The ratio increases with n on each finite row; check n=7 at p=2, and n=4 and n=7 for the other regimes. Exact decimal-rational computations give endpoint ratios below 0.976 at p=2; below 0.635 and 0.875 at p=3 or p=5,e≥2; below 0.583 and 0.863 at p≥7,e≥2; and below 0.620 and 0.872 at p≥5,e=1. The η factors cancel. This verifies table domination without verifying the interpolation budgets. The displayed W assumption uses 1/(ρn), a conservative strengthening of the source’s (n−1)/(ρn²) coefficient in (2.12), p.250.

Prerequisites: [Improved integer parameters for Yu interpolation](#yu-improved-parameter-selection), [Grid extrapolation and contraction of the auxiliary box](#yu-grid-extrapolation-and-contraction), [Prime-ideal order and the local analytic normalization](#finite-place-normalization-adapter).

Source: [Kunrui Yu, Linear forms in p-adic logarithms. III](https://www.numdam.org/item/CM_1994__91_3_241_0.pdf), §2, Theorems 2.1–2.2, pp.250–253; §2.6, pp.263–266. Conditional bound and removal of the field-generation assumption; the full radical-degree hypothesis is still present.

Acceptance:

- The q-primary torsion factor q^u is retained.
- The statement does not assume principal complex logarithms are Q-independent; full Kummer degree is its algebraic hypothesis.

## Kummer descent

A full-radical conditional estimate does not cover dependent logarithms. Saturation and triangular coordinate changes remove that restriction, while keeping the least p-order coefficient under control.

<a id="yu-saturated-logarithm-basis"></a>

### A saturated basis of unit logarithms

Target `DiophantineApproximationAndTranscendence:DT.3/yu-saturated-logarithm-basis` (construction).

Assume the Yu unit field and torsion setup. Put ℓ0=2πi/(p^v q^u), V0=1/(p^v q^u D), and let ℓ1,…,ℓn be Q-independent together with ℓ0, with exp ℓj a P-unit, |Im ℓj|≤π, and Vj≥max(h(exp ℓj),|ℓj|/(2πD),f log p/D). Then there are ℓ0′=ℓ0 and ℓ1′,…,ℓn′ whose exponentials belong to K and are P-units, with full q-radical degree q^(n+1), and triangular integers msj such that ℓs=Σj≤s msjℓj′ and mss=q^ws, ws≥0. For 1≤s≤n, V(ℓs′)≤max(Vs,(V0+⋯+Vs)/2), where V(ℓ)=max(h(exp ℓ),|ℓ|/(2πD)). For s<n, max1≤j≤s|msj|≤2((s+1)D³)^(s+1)(s+1)! V0 Vs^s. For s=n, max1≤j≤n|mnj|≤4((n+1)D³)^(n+1)n! V0 Vn−1^(n−2)Vn max(Vn,(Vn−1+Vn)/2).

Hypotheses and conventions:

- K is a number field of degree D; P lies above p with ramification index e and residue degree f; n≥2.
- Put q=3 when p=2 and q=2 otherwise. At p=2 assume ζ3∈K; at p≡1 mod4 assume i∈K; at p≡3 mod4 assume f odd or i∈K.
- Let q^u and p^v be the largest q-power and p-power orders of roots of unity in K. Choose α0 primitive of order p^v q^u.
- n≥2; V1≤⋯≤Vn−1; the logarithms meet the displayed independence, size and unit assumptions.

The interface exposes:

| Declaration | Role | Statement |
| --- | --- | --- |
| `LogarithmicForms.yu_saturated_full_degree` | characterisation | The q-radical field of exp ℓ0′,…,exp ℓn′ has degree q^(n+1). |
| `LogarithmicForms.yu_saturated_triangular` | characterisation | ℓs=Σj≤s msjℓj′ and mss=q^ws. |
| `LogarithmicForms.yu_saturated_height` | characterisation | V(ℓs′)≤max(Vs,(V0+⋯+Vs)/2). |
| `LogarithmicForms.yu_saturated_diagonal_p_unit` | compatibility | vp(mss)=0. |

Checks of the definition or construction:

- **`LogarithmicForms.yu_saturation_diagonal`** (computed): At p=3,q=2, a diagonal entry 8 has vp=0.
- **`LogarithmicForms.yu_saturation_no_independence`** (non-example): For ℓ2=2ℓ1 the full-rank construction is inapplicable; use rank reduction.
- **`LogarithmicForms.yu_saturation_no_change`** (compatibility): If M is already q-saturated, the identity matrix is an admissible triangular coordinate matrix.
- **`LogarithmicForms.yu_saturation_torsion`** (degenerate): The ℓ0 coordinate stays fixed, with m00=1.

Uses:

- Yu 1990, §4, cases (a)–(b); Yu 1994, §3: Transforms an arbitrary independent family into the conditional estimate’s radical-degree domain.

Proof or construction:

1. Let M=Σjℤℓj and Mq={ℓ:exp ℓ∈K is a P-unit and q^wℓ∈M for some w≥0}. The short-relation bound proves M has finite q-power index in Mq.
2. At each triangular position choose the least positive leading coefficient and reduce all earlier coefficients into centered residue intervals. The resulting ℓj′ form a basis of Mq; index factors imply mss is a q-power.
3. Maximal q-primary torsion in K forces ℓ0′=ℓ0. Height and logarithm-size inequalities give the displayed V estimates; the bounded relation theorem gives the coefficient estimates.
4. If a q-radical relation among the exponentials remained, taking a chosen complex logarithm and retaining its 2πi correction would produce ℓ∈Mq with qℓ=Σj ijℓj′, 0≤ij<q, not all zero. The basis forces every ij divisible by q, contradiction.
5. Since q≠p the diagonal coefficients are p-units. This is the part needed to carry the least-order last coefficient into the transformed multiplicative form.

Prerequisites: [A bounded integer relation among dependent logarithms](#short-logarithmic-relation), [The relation alternative for a prime-radical tower](#multi-radical-relation-adapter), [Absolute-height calculus from relative heights](#absolute-height-calculus-adapter), `DiophantineApproximationAndTranscendence:DT.3/algebraic-logarithms`.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §3, Proposition 3.1 and proof, pp.68–71. Saturation removes the radical-degree hypothesis while bounding heights and the triangular coordinate matrix.

Acceptance:

- The basis is saturated among logarithms whose exponentials are P-units, not among all algebraic logarithms.
- The 2πi contribution is expressed as a multiple of ℓ0, using μq⊂K.
- No claim that the off-diagonal entries are p-units is made.

<a id="yu-dependent-logarithm-reduction"></a>

### Rank reduction preserving the last coefficient’s p-order

Target `DiophantineApproximationAndTranscendence:DT.3/yu-dependent-logarithm-reduction` (theorem).

Use the saturated-logarithm setup, but let rankQ{ℓ0,…,ℓn}=r+1 with 2≤r<n and choose pivot indices 0=j0<⋯<jr=n, each nonpivot logarithm lying in the span of the earlier pivots. There exist full-Kummer unit logarithms ℓ0′=ℓ0,…,ℓr′ and integers ui>0,mij such that uiℓi=Σj≤s mijℓj′ for js≤i<js+1. At pivots ui=1; all ui are prime to pq. The earlier pivot diagonals are p^hs q^ws, and the last diagonal mnr=q^wr. For 1≤s<r, V(ℓs′)≤(s+1)Vn−r+s/2, and V(ℓr′)≤max(Vn,(r(r+1)Vn−1/4+Vn)/2). For each earlier block, max(ui,|mij|:1≤j≤s)≤2((s+1)D³)^(s+1)(s+1)!V0 Vn−r+s^s. The last row is bounded by 4((r+1)D³)^(r+1)r!V0 Vn−1^(r−2)Vn max(Vn,(r(r+1)Vn−1/4+Vn)/2).

Hypotheses and conventions:

- K is a number field of degree D; P lies above p with ramification index e and residue degree f; n≥2.
- Put q=3 when p=2 and q=2 otherwise. At p=2 assume ζ3∈K; at p≡1 mod4 assume i∈K; at p≡3 mod4 assume f odd or i∈K.
- Let q^u and p^v be the largest q-power and p-power orders of roots of unity in K. Choose α0 primitive of order p^v q^u.
- The original chosen logarithms satisfy the displayed pivot and rank conditions, |Im ℓi|≤π, and their size bounds.
- V1≤⋯≤Vn−1; the last index is a new pivot. Rank 0 or 1 is handled separately by torsion and one-power bounds.

Proof or construction:

1. Saturate the lattice of the first r pivots at both p and q. The bounded-relation theorem proves its finite index; centered triangular coordinates give the earlier diagonals.
2. For each nonpivot choose the least positive denominator ui. Saturation makes ui prime to pq. Apply the relation bound to obtain the displayed row estimates.
3. Saturate the last independent direction only at q. This gives a q-power last diagonal and preserves its p-order.
4. Use the multi-radical relation alternative to prove full Kummer degree, retaining the branch correction as in the independent case.
5. The stronger large-last-height refinements in Propositions 3.2 and 3.4 are required for the final source constant and remain explicitly in the descent-calibration gap.

Prerequisites: [A saturated basis of unit logarithms](#yu-saturated-logarithm-basis), [A bounded integer relation among dependent logarithms](#short-logarithmic-relation), [The relation alternative for a prime-radical tower](#multi-radical-relation-adapter).

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §3, Proposition 3.3 and proof, pp.77–81; Propositions 3.2 and 3.4, pp.77 and 81. Distinguishes p,q-saturation of the old directions from q-saturation of the last independent direction.

Acceptance:

- A last diagonal divisible by p would lose the minimum-p-order condition; the target explicitly gives a q-power.
- If the last logarithm is dependent, choose a different pivot presentation and use the dependent-last case of the unit-bound proof; do not apply the displayed pivot conclusion.

<a id="yu-unit-bound-after-descent"></a>

### Yu’s unit estimate after Kummer descent

Target `DiophantineApproximationAndTranscendence:DT.3/yu-unit-bound-after-descent` (theorem).

Let K,P,p,q,u,v,D,e,f be as in the Yu unit field and torsion setup. Let α1,…,αn be nonzero P-units, n≥2, and b∈ℤ^n not all zero, Θ=∏αj^bj−1≠0, B≥max(3,max|bj|). Take V1≤⋯≤Vn with Vj≥max(hαj,|principal log αj|/(2πD),f log p/D), and V=Vn. Put σ=1/(p^v q^u f log p), η1=p(p−1)/(p−2)², η2=(p−1)/(p−2), η=η1η2^n for p≥5. Then ordP Θ < C(n+1)^(n+2)n^(n+σ)((p^f−1)/(q^u(f log p)^(n+2)))D^(n+2)(∏Vj)log(D²B)max(nlog(2^10·3n(n+σ)D²V),f log p), where C=210406.38·24^n at p=2; C=134627.26·20^n at p=3 or at p=5,e≥2; C=399171.94·20^n at p≥7,e≥2; C=67821.82η·10^n at p≥5,e=1. No Q-independence or full Kummer hypothesis remains.

Hypotheses and conventions:

- K is a number field of degree D; P lies above p with ramification index e and residue degree f; n≥2.
- Put q=3 when p=2 and q=2 otherwise. At p=2 assume ζ3∈K; at p≡1 mod4 assume i∈K; at p≡3 mod4 assume f odd or i∈K.
- Let q^u and p^v be the largest q-power and p-power orders of roots of unity in K. Choose α0 primitive of order p^v q^u.
- The αj, coefficients, heights and sorted bounds satisfy the displayed conditions.
- The use of V=maxj Vj is a monotone weakening of the source’s smaller V in the least-order or dependent-last case.

Proof or construction:

1. Choose principal complex logarithms and include the torsion logarithm ℓ0. Sort the height parameters and split by logarithmic rank and whether the last direction is independent.
2. For full rank use the saturated basis; for intermediate rank use the dependent-logarithm reduction. If the last height is large use the strengthened coefficient estimates of Propositions 3.2 or 3.4.
3. Multiply by a common denominator prime to p, substitute the triangular coordinates, and remove torsion by the exponent p^v q^u. The last q-power diagonal preserves the least coefficient order in the applicable cases.
4. Apply the conditional bound, comparing the transformed product of heights and coefficient logarithms to the displayed expression. For small coefficient B use finite-place Liouville directly.
5. Rank 0 gives a torsion difference, and rank 1 reduces to the one-power bound. The final numerical comparisons over all rank and last-height regimes are the recorded descent-calibration gap.

Prerequisites: [Yu’s estimate under the full Kummer condition](#yu-full-kummer-conditional-bound), [A saturated basis of unit logarithms](#yu-saturated-logarithm-basis), [Rank reduction preserving the last coefficient’s p-order](#yu-dependent-logarithm-reduction), [An explicit one-power bound over a number field](#yu-one-power-explicit-bound), [Finite-place Liouville for integer polynomials](#finite-place-liouville-adapter).

Source: [Kunrui Yu, Linear forms in p-adic logarithms. III](https://www.numdam.org/item/CM_1994__91_3_241_0.pdf), §0.2, Theorem 1, pp.244–245; §3, pp.266–268. States the improved unit bound and follows the earlier eight-case Kummer descent.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §4, proof of Theorem 1, cases (a)–(h), pp.81–94. Treats independent, lower-rank, dependent-last and one-dimensional cases separately.

Acceptance:

- An algebraic multiplicative relation is allowed; only Θ≠0 is excluded.
- A length-one or torsion case is treated before applying the conditional n≥2 full-Kummer estimate.
- The height normalization is absolute and invariant under extending K.

## Algebraic Yu consumers

The local integer order is tracked through nonunit elimination and a generated-field extension. At p=2 the corrected residue degree after adjoining a cube root of unity is essential to the constant comparison.

<a id="yu-nonunit-elimination"></a>

### Eliminating nonunits without changing the multiplicative form

Target `DiophantineApproximationAndTranscendence:DT.3/yu-nonunit-elimination` (comparison).

Let K0=Q(α1,…,αn), degree D0, with P0 above p of ramification e0 and residue degree f0. Set aj=ordP0 αj. If Σj bjaj≠0 then ordP0(∏αj^bj−1)≤0. Otherwise, if some aj≠0, choose it as an, let M=|an|, and put αj′=αj^M αn^(−M aj/an) for j<n, αn′=1. All αj′ are P0-units and (∏αj^bj)^M=∏(αj′)^bj. If Θ≠0 and ordP0 Θ>e0/(p−1), then the powered form is nonzero and ordP0 Θ≤ordP0(∏(αj′)^bj−1). The absolute-height and principal-log cost of this replacement is bounded by the original D0/f0 weighted height input and the factor 10D0+1 used in Yu’s proof.

Hypotheses and conventions:

- All αj are nonzero; aj may be negative. The relation Σbjaj=0 is an exact integer equality.
- The asserted powered nonvanishing is used only above the strict exponential threshold.

Proof or construction:

1. Use the ultrametric order of x−1 when ordP0 x≠0 to settle the unequal-order case.
2. The exponent −M aj/an is integral, since M/an is ±1. Compute each new order and the identity of powered products.
3. If the original product is in the strict deep-unit domain, log is injective and multiplication by nonzero M cannot kill its logarithm; the power order formula gives nonvanishing and the order inequality.
4. Bound |aj| by D0 h(αj)/(f0 log p), applying finite-place Liouville to αj and its inverse. Apply absolute-height product/power calculus to αj′.
5. Small order is absorbed directly by the final numerical bound. Record the remaining transformed-height comparison in the general-bound calibration gap.

Prerequisites: [Prime-ideal order and the local analytic normalization](#finite-place-normalization-adapter), [Finite-place Liouville for integer polynomials](#finite-place-liouville-adapter), [Absolute-height calculus from relative heights](#absolute-height-calculus-adapter), [Sharp deep-unit exponential and logarithm interface](#deep-unit-exp-log-adapter).

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §4, equations (4.79)–(4.87), pp.97–98, with correction p.307. Removes the unit condition and requires a positive power of the original multiplicative product.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. III](https://www.numdam.org/item/CM_1994__91_3_241_0.pdf), §4, proof of Theorem 1′, p.271. Retains this replacement and changes the resulting logarithm-size comparison.

Acceptance:

- For α=(2,4),b=(2,−1), the order relation holds but Θ=0; the nonzero-form hypothesis is essential.
- For a nonunit product of nonzero order the order of its difference from 1 is nonpositive.
- A torsion product may be killed by M outside the strict deep-unit domain; powered nonvanishing is not asserted there.

<a id="yu-generated-field-general-bound"></a>

### Yu’s generated-field bound with the residue-degree correction

Target `DiophantineApproximationAndTranscendence:DT.3/yu-generated-field-general-bound` (theorem).

Let K0=Q(α1,…,αn) have degree D0, αj≠0, n≥2, P0 above p with ramification e0 and actual residue degree f0. Let b∈ℤ^n be nonzero, Θ=∏αj^bj−1≠0 and B≥max(3,max|bj|). Take sorted Vj≥max(hαj,|principal log αj|/(10D0),(1/2)(f0/D0)^2 log p), V=maxj Vj. The target is ordP0 Θ < C′(n+1)^(2n+4)((p^f0−1)/(log p)^(n+2))(D0/f0)^(2n+2)(∏Vj)log(4D0²B)max(log(2^13·3n(n+1)D0³V),f0 log p/n), with C′=14860·96^n at p=2; C′=9649·80^n at p=3 or p=5,e0≥2; C′=26065·80^n at p≥7,e0≥2; C′=4861η·40^n at p≥5,e0=1, η=η1η2^n as in the unit bound. The numeric theorem is retained as a target with an explicit correction/comparison gap, not treated as a proved import.

Hypotheses and conventions:

- K0 is the field generated by the original αj; a larger field has a different D and residue-degree factor.
- No assumption ordP0 αj=0 is made.
- All height parameters use the displayed absolute normalization.

Proof or construction:

1. Apply nonunit elimination or the small-order alternative. Adjoin ζ3 at p=2, adjoin i at p≡1 mod4 or p≡3 mod4 with even f0, and otherwise keep K0.
2. These prime-to-p roots give an unramified local extension, so e=e0. At odd p the prescribed cases give f=f0. At p=2 the correct value is f=lcm(f0,2), equal to f0 for even f0 and 2f0 for odd f0. The printed max(f0,2) is false when f0 is odd and greater than 1.
3. Apply the unit estimate to the transformed αj′ and restrict the prime-ideal order back to P0. Keep the actual local field extension degree, the global degree ≤2D0 and each transformed height.
4. Redo the constant comparison to p^f0−1, particularly the odd f0>1 dyadic case. This necessary comparison has not been established in this proof decomposition and is a recorded gap.
5. Only after this comparison is verified can the simplified Φ estimate be deduced from this theorem.

Prerequisites: [Yu’s unit estimate after Kummer descent](#yu-unit-bound-after-descent), [Eliminating nonunits without changing the multiplicative form](#yu-nonunit-elimination), [Prime-ideal order and the local analytic normalization](#finite-place-normalization-adapter), `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. III](https://www.numdam.org/item/CM_1994__91_3_241_0.pdf), §0.2, Theorem 1′, p.246 and remark p.247; §4, equations (4.3)–(4.5), pp.271–272. The stated result uses the original prime’s actual residue degree; the dyadic extension formula in its proof requires correction.

Acceptance:

- For f0=3 at p=2, the extension by ζ3 has residue degree 6, not 3.
- The correction is a proof issue; this packet does not claim a counterexample to the final bound.
- The generated-field and prime-restriction factors are retained for algebraic consumer fields.

<a id="yu-absolute-height-phi-adapter"></a>

### The absolute-height Φ estimate and algebraic-field consumer

Target `DiophantineApproximationAndTranscendence:DT.3/yu-absolute-height-phi-adapter` (comparison).

Let n≥2, K0=Q(α1,…,αn) of degree d, αj≠0, P0 above p with residue degree f, b∈ℤ^n nonzero, Θ=∏αj^bj−1≠0. Let hj≥max(hαj,|principal log αj|/(10d),log p), B=max(3,max|bj|), h′=max(1,maxj hj), and Φ=22000(9.5(n+1)d/√(log p))^(2(n+1))(p^f−1)(∏hj)log(10ndh′). Then the target is ordP0 Θ<Φ log(dB). For any specified number field L containing the αj and P above P0, ordP Θ=e(P/P0)ordP0 Θ, and the analytic vp-bound is unchanged on K0. In particular |Θ|p≥(eB)^(−C) for an explicit C depending on the αj, p and chosen prime, using C=2Φ log p for the rational field d=1.

Hypotheses and conventions:

- The Φ formula is for the generated field, not an arbitrary algebraic field of application.
- For a larger consumer field list the lies-over condition and relative ramification explicitly.
- Length one uses the separate one-power bound or pads with α2=1,b2=0 after Kummer descent has removed its radical-degree assumption.

Proof or construction:

1. In the generated-field bound set Vj=hj and sort the pairs (αj,bj,hj). Bound the four C′ regimes by the simplified numerical expression, retaining h′≥1 and hj≥log p.
2. Use f≤d, positive logarithms and elementary monotonicity to obtain the stated Φ bound. The exact numeric comparison is retained in the general-bound calibration gap.
3. Apply the finite-place restriction formula in a consumer field; divide by absolute e to obtain the same analytic vp on K0.
4. For d=1, |Θ|p=p^(−ordp Θ)>B^(−Φ log p). For a consumer input Binput≥1 with |bj|≤Binput, use B=max(3,Binput) and log(max(3,Binput))≤2log(eBinput), giving the conservative exponent C=2Φ log p in its own coefficient parameter.
5. For n=1 use the already planned one-power estimate; padding is legitimate only after the general bound is available.

Prerequisites: [Yu’s generated-field bound with the residue-degree correction](#yu-generated-field-general-bound), [An explicit one-power bound over a number field](#yu-one-power-explicit-bound), [Prime-ideal order and the local analytic normalization](#finite-place-normalization-adapter), [Absolute-height calculus from relative heights](#absolute-height-calculus-adapter).

Source: [Kunrui Yu, Linear forms in p-adic logarithms. III](https://www.numdam.org/item/CM_1994__91_3_241_0.pdf), §0.1, equations (0.1)–(0.2), pp.241–242; §0.2, Theorem 1′, p.246. The simplified inequality is expressed in absolute heights and the generated-field degree.

Source: [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), §2.6, proof of Theorem 2.2, pp.64–66. Prime restriction preserves p-normalized local order while the integer prime-ideal order scales by relative ramification.

Acceptance:

- For L/K0 ramified of relative index r, the integer prime-ideal order is multiplied by r; the normalized vp is unchanged.
- The algebraic-field consumer must state its prime and field embedding.
- A full-Kummer conditional theorem cannot be padded with α=1 because its radical-degree hypothesis would fail.

## End-target compatibility

The existing quantitative target ids remain the consumer interfaces. The
following relationships specify which proof route supports each formula.
A sharper numerical target is not replaced silently by a different constant.

| Existing interface | Quantitative supplier | Required distinction |
| --- | --- | --- |
| `DiophantineApproximationAndTranscendence:DT.3/waldschmidt-linear-independence-measure` | [The sum-normalized Waldschmidt estimate](#waldschmidt-independent-estimate-proof), [A conservative estimate under the original pointwise hypotheses](#waldschmidt-pointwise-conservative-estimate) | Same C under the explicit sum-size specialization; conservative Csafe under the original pointwise hypotheses; sharp C under pointwise hypotheses remains a gap. |
| `DiophantineApproximationAndTranscendence:DT.3/baker-lower-bounds-for-linear-forms-in-logarithms` | [General algebraic coefficients and fixed logarithms](#baker-fixed-logarithm-coefficient-adapter) | General bounded-degree algebraic coefficients, including the inhomogeneous term; use Csafe. |
| `DiophantineApproximationAndTranscendence:DT.3/baker-lower-bound-for-multiplicative-form` | [From a chosen logarithm to a product of powers](#complex-multiplicative-form-adapter) | Includes the 2πi branch correction. |
| `DiophantineApproximationAndTranscendence:DT.3/matveev-corollary-linear-form-bound`, `DiophantineApproximationAndTranscendence:DT.3/matveev-explicit-lower-bound`, `DiophantineApproximationAndTranscendence:DT.3/matveev-multiplicative-form-number-field`, `DiophantineApproximationAndTranscendence:DT.3/laurent-mignotte-nesterenko-two-logarithms` | [A stated Matveev replacement for the sharp two-log estimate](#two-logarithm-matveev-replacement) | Preserve all sharp targets and their proof gap. The named two-log replacement is conditional on the existing Matveev target; conservative Baker is a separate sufficient consumer bound. |
| `DiophantineApproximationAndTranscendence:DT.3/yu-explicit-p-adic-bound`, `DiophantineApproximationAndTranscendence:DT.3/yu-p-adic-lower-bound` | [The absolute-height Φ estimate and algebraic-field consumer](#yu-absolute-height-phi-adapter) | Includes generated-field, actual residue degree and larger-field ramification; numeric route retains the parameter, terminal, descent and corrected comparison gaps. |
| `DiophantineApproximationAndTranscendence:DT.3/p-adic-valuation-of-power-minus-one`, `DiophantineApproximationAndTranscendence:DT.3/p-adic-lower-bound-one-power` | [Sharp deep-unit exponential and logarithm interface](#deep-unit-exp-log-adapter), [An explicit one-power bound over a number field](#yu-one-power-explicit-bound) | Use the strict exp/log domain and the separate one-power argument. |
| All other accepted DT.3 targets | The original DiophantineApproximationAndTranscendence packet, unchanged | Import its Hermite, Lindemann–Weierstrass, Gelfond–Schneider, Schneider–Lang and qualitative Baker results and their existing foundations; no duplicate plan. |

The six existing DT.3 display landmarks remain Lindemann–Weierstrass,
Gelfond–Schneider, qualitative Baker, Baker's lower bound, Matveev's lower bound
and Yu's p-adic lower bound. The multiplicity, interpolation, Schwarz and descent
machinery is internal to their proof routes and adds no planet to this layer.

## Proof obligations for exact numerical constants

The following obligations identify the precise limit of the current proof
decomposition. They must be discharged before the corresponding numerical
end statements are asserted. Supplier contracts above are additional imports.

### G1. Sharp pointwise Waldschmidt constant

The selected determinant criterion requires Σ|λj|/logAj≤D/E. The pointwise hypotheses only bound each summand by D/E. The written rescaling proves Csafe=C(m)m^(m+1), which closes the fixed-logarithm Baker consumer, but not the original C(m)=2^(m+25)m^(3m+9) pointwise target. Reconcile the source’s final normalization or supply a fresh budget estimate before retaining that sharp numeric target.

Affected targets: [The sum-normalized Waldschmidt estimate](#waldschmidt-independent-estimate-proof), [A conservative estimate under the original pointwise hypotheses](#waldschmidt-pointwise-conservative-estimate).

### G2. Sharp Matveev and LMN targets

Matveev’s English §2 Corollary 2.3 was read for the exact real two-log specialization. Its proof in §§3–21, pp.1220–1266, has not been decomposed, and no primary proof for LMN’s sharp 24.34 formula was obtained. The original three Matveev targets and sharp LMN target remain planned imports, not consequences of the Waldschmidt constant. The Matveev replacement is available only conditional on that imported proof; fixed-logarithm consumers can instead use the established conservative route.

Affected targets: [A stated Matveev replacement for the sharp two-log estimate](#two-logarithm-matveev-replacement).

### G3. Effective house numerical inputs

Read Yu 1990 Lemma 1.10, pp.28–29, but not the original Dobrowolski, Smyth and Boyd proofs and small-degree checks cited there. The requested ArithmeticHeights Part II must prove the exact strict 1/(2d²) constant, including degrees 18 and 20, rather than infer a numerical bound from Northcott/Kronecker.

Affected targets: [The effective house input used in the short-relation bound](#effective-house-input-adapter).

### G4. Short relation determinant argument

Yu 1990 Lemma 1.11, p.29, cites Waldschmidt’s earlier bounded-relation proof and changes 9D² to 2D². Trace its covolume argument and primitive relation, including logarithmic branch/torsion factors, to justify the exact coordinatewise bound [2(m−1)D³]^(m−1)∏Vj/Vk.

Affected targets: [A bounded integer relation among dependent logarithms](#short-logarithmic-relation).

### G5. Yu terminal polynomial nonvanishing

Yu 1990 §2.5, p.60, invokes Lemma 2.5 of Yu 1989 for the final contradiction after Ln^(J)=0. The normal-function precursor was read, but this terminal lemma’s precise polynomial-degree/grid inequalities and proof have not been traced in the journal version. State and prove those inequalities in the parameter output; contracting one box coordinate to zero alone is not a contradiction.

Affected targets: [Grid extrapolation and contraction of the auxiliary box](#yu-grid-extrapolation-and-contraction), [Improved integer parameters for Yu interpolation](#yu-improved-parameter-selection).

### G6. Yu improved parameter budgets

The floor formulas and the analytic/arithmetic inequalities needed by the induction are stated, but Yu 1994 budget equations (2.28)–(2.30), pp.254–255, rounded parameters (2.31), p.256, and their induction on pp.262–263, and the four numeric regimes, pp.263–266, require a complete checked implication from the rounded parameters to the simultaneous initial row count, coefficient bound and jet/Liouville budgets. Small-n row domination was separately checked and is not this gap.

Affected targets: [Improved integer parameters for Yu interpolation](#yu-improved-parameter-selection), [Yu’s estimate under the full Kummer condition](#yu-full-kummer-conditional-bound).

### G7. Yu descent calibration

The independent and dependent triangular reductions are specified; the stronger large-last-height estimates in Yu 1990 Propositions 3.2 and 3.4, pp.77 and 81, and the final eight-case comparisons in §4, pp.81–94, remain unverified with the improved Yu 1994 constants. In each case check the transformed product of heights, coefficient bounds and least-p-order pivot before asserting the numeric unit end theorem.

Affected targets: [A saturated basis of unit logarithms](#yu-saturated-logarithm-basis), [Rank reduction preserving the last coefficient’s p-order](#yu-dependent-logarithm-reduction), [Yu’s unit estimate after Kummer descent](#yu-unit-bound-after-descent).

### G8. Generated-field and Phi constant comparison

Correct Yu 1994 §4 equation (4.4), p.271, to f=lcm(f0,2) at p=2 after adjoining ζ3; its max(f0,2) fails for odd f0>1. Recompute the unit-to-general height, residue and coefficient comparison with this actual f, and then the four-regime comparison from Theorem 1′ to Φ. This packet does not infer that the final stated theorem is false; it records a missing corrected proof. The same parity error occurs in the older Yu 1990 Appendix lemma, pp.111–112 (E611); that lemma cannot supply the missing comparison.

Affected targets: [Eliminating nonunits without changing the multiplicative form](#yu-nonunit-elimination), [Yu’s generated-field bound with the residue-degree correction](#yu-generated-field-general-bound), [The absolute-height Φ estimate and algebraic-field consumer](#yu-absolute-height-phi-adapter).

## Source corrections and checks

These findings describe the assertions in our own words. An author copy is
not treated as a collated version of record. Known published corrections are
distinguished from new findings. The independent review confirms E601–E611; findings in the author copy remain scoped to that copy. In particular,
the dyadic residue-degree example refutes a step in the proof, not Yu's final
theorem.

### E601. Author PDF, §9.2.3, proof of Lemma 9.17, Step 1, p.281

**Misprint.** The injectivity argument asks to conclude s≠0 from sy=0. The required conclusion is s=0.

Injectivity of s↦sy requires a zero kernel. The following p.282 calculation proves s=0, contradicting the nonzero sign on p.281. Reach: nothing. Known correction: new.

Correction search: Waldschmidt publications page https://webusers.imj-prg.fr/~michel.waldschmidt/texts.html (2026-10-13), book entry and links; Springer book page https://link.springer.com/book/10.1007/978-3-662-11569-5 (2026-10-13); no erratum located; Author PDF used here, pp.281–302; finding scoped to this copy, without a published-version collation.

### E602. Author PDF, §9.2.3, remark immediately before Proposition 9.18, p.286

**Misprint.** The exclusion of an integer multiple in the indicated direction is attached to β0≠0. Use the homogeneous β0=0 case for that implication.

Proposition 9.16 on p.281 assumes β0≠0 or the direction-exclusion condition. That exclusion is therefore required in its β0=0 branch, not in the first branch. Reach: nothing. Known correction: new.

Correction search: Waldschmidt publications page https://webusers.imj-prg.fr/~michel.waldschmidt/texts.html (2026-10-13), book entry and links; Springer book page https://link.springer.com/book/10.1007/978-3-662-11569-5 (2026-10-13); no erratum located; Author PDF used here, pp.281–302; finding scoped to this copy, without a published-version collation.

### E603. Author PDF, §9.3.3, Corollary 9.20, p.294 and its proof p.297

**Gap.** The statement and proof give different M*>1 factors, 2^(m+3)M² and 2^(m+4)M². Reconcile the two factors or verify the stronger one in the optimized M>1 proof. The selected M=1 route has M*=1 in both places.

The factors differ by 2. No unverified reduction of the larger factor is made in this packet; this discrepancy is bypassed by M=1. Reach: the proof. Known correction: new.

Correction search: Waldschmidt publications page https://webusers.imj-prg.fr/~michel.waldschmidt/texts.html (2026-10-13), book entry and links; Springer book page https://link.springer.com/book/10.1007/978-3-662-11569-5 (2026-10-13); no erratum located; Author PDF used here, pp.281–302; finding scoped to this copy, without a published-version collation.

### E604. Author PDF, §9.1 Theorem 9.1, pp.251–252; §9.3.4 final normalization, pp.298–302

**Gap.** The final argument returns from the weighted sum-size criterion to pointwise size assumptions while retaining the stated C(m). Account explicitly for the sum normalization in the parameter budget or constant. The explicit rescaling here gives Csafe=C(m)m^(m+1).

For m terms, the separate inequalities only give Σ|λj|/logAj≤mD/E. Replacing logAj by mlogAj repairs the sum condition but changes the product and coefficient logarithm; retaining the sharper C requires another justified step. Reach: the proof. Known correction: new.

Correction search: Waldschmidt publications page https://webusers.imj-prg.fr/~michel.waldschmidt/texts.html (2026-10-13), book entry and links; Springer book page https://link.springer.com/book/10.1007/978-3-662-11569-5 (2026-10-13); no erratum located; Author PDF used here, pp.281–302; finding scoped to this copy, without a published-version collation.

### E605. Published introduction, p.20, line 14

**Misprint.** The order of the integer coefficient bj is indexed by the prime ideal P. Use the rational-prime order ordp(bj) in this comparison.

The published correction p.307 changes the subscript. The least-coefficient-order normalization uses analytic p-order, not the ramification-scaled prime-ideal order. Reach: the proof. Known correction: Yu, Correction to Linear forms in p-adic logarithms. II, Compositio Mathematica 76 (1990), p.307, https://www.numdam.org/item/CM_1990__76_1-2_307_0.pdf.

Correction search: Numdam version-of-record item https://www.numdam.org/item/CM_1994__91_3_241_0/ (2026-10-13); Numdam published correction https://www.numdam.org/item/CM_1990__76_1-2_307_0/ (2026-10-13); Web search for Kunrui Yu Linear forms in p-adic logarithms III correction/erratum (2026-10-13); no correction of the dyadic residue-degree formula located.

### E606. Published §4, p.97, formula between (4.81) and (4.82)

**Misprint.** The multiplicative product is followed by a ramification-index factor rather than raised to it. Raise the multiplicative product to the ramification-index power.

The following identity and nonunit replacement require a power of the product; multiplication by the index is not the same algebraic operation. Confirmed against correction p.307. Reach: the proof. Known correction: Yu, Correction to Linear forms in p-adic logarithms. II, Compositio Mathematica 76 (1990), p.307, https://www.numdam.org/item/CM_1990__76_1-2_307_0.pdf.

Correction search: Numdam version-of-record item https://www.numdam.org/item/CM_1994__91_3_241_0/ (2026-10-13); Numdam published correction https://www.numdam.org/item/CM_1990__76_1-2_307_0/ (2026-10-13); Web search for Kunrui Yu Linear forms in p-adic logarithms III correction/erratum (2026-10-13); no correction of the dyadic residue-degree formula located.

### E607. Published §2.1, p.35, lines 13–14

**Misprint.** The parameter row for p>2,n≥8 has incorrect ranges. Use c0=17, 3/4≤c1≤3, c2=5, 124≤c3≤160 and 200≤c4≤230.

These are the ranges supplied by the published correction p.307. The selected improved 1994 route recalibrates its own parameters rather than using this uncorrected row. Reach: the proof. Known correction: Yu, Correction to Linear forms in p-adic logarithms. II, Compositio Mathematica 76 (1990), p.307, https://www.numdam.org/item/CM_1990__76_1-2_307_0.pdf.

Correction search: Numdam version-of-record item https://www.numdam.org/item/CM_1994__91_3_241_0/ (2026-10-13); Numdam published correction https://www.numdam.org/item/CM_1990__76_1-2_307_0/ (2026-10-13); Web search for Kunrui Yu Linear forms in p-adic logarithms III correction/erratum (2026-10-13); no correction of the dyadic residue-degree formula located.

### E608. Published §2, p.34, choice before equation (2.23); correction noted in Yu 1994, pp.252–253

**Misprint.** The compatible q-th root is placed in the complex field C. Place this root in Cp, the p-adic algebraic-closure completion used by the surrounding construction.

The compatibility involves the local torsion root ξ and the p-adic exp/log identities. Yu 1994 p.253 explicitly replaces C by Cp in the older text. Reach: the proof. Known correction: Yu 1994, Linear forms in p-adic logarithms. III, p.253, https://www.numdam.org/item/CM_1994__91_3_241_0.pdf.

Correction search: Numdam version-of-record item https://www.numdam.org/item/CM_1994__91_3_241_0/ (2026-10-13); Numdam published correction https://www.numdam.org/item/CM_1990__76_1-2_307_0/ (2026-10-13); Web search for Kunrui Yu Linear forms in p-adic logarithms III correction/erratum (2026-10-13); no correction of the dyadic residue-degree formula located.

### E609. Published §4, equation (4.4), p.271; actual f0 convention in remark p.247

**Error.** After adjoining ζ3 at p=2 the residue degree is stated as f=max(f0,2). The unramified local compositum has f=lcm(f0,2): f=f0 for even f0 and f=2f0 for odd f0. Recheck the bound comparison with this value.

An unramified cubic 2-adic field has residue field F8, which has no nontrivial cube root of unity. Adjoining ζ3 gives residue field F64 and degree 6, whereas max(3,2)=3. A global example is Q(root of X³+X+1), whose discriminant is −31 and whose reduction modulo 2 is irreducible. This refutes the displayed proof formula, not the final bound. Reach: the proof. Known correction: new.

Correction search: Numdam version-of-record item https://www.numdam.org/item/CM_1994__91_3_241_0/ (2026-10-13); Numdam published correction https://www.numdam.org/item/CM_1990__76_1-2_307_0/ (2026-10-13); Web search for Kunrui Yu Linear forms in p-adic logarithms III correction/erratum (2026-10-13); no correction of the dyadic residue-degree formula located.


### E610. Author PDF, §9.2.3, proof of Lemma 9.17, Step 3, p.282; following tangent calculation p.283

**Misprint.** The direction W for ∂X0+Y∂Y has its torus coordinate set to zero. Use W=K·(1,0,…,0,1), retaining torus coordinate 1.

The invariant derivation attached to (1,0,…,0,0) is only ∂X0. The displayed operator includes Y∂Y, and the following tangent-space argument on p.283 itself uses final coordinate 1. Reach: nothing. Known correction: new.

Correction search: Waldschmidt publications page https://webusers.imj-prg.fr/~michel.waldschmidt/texts.html (2026-10-13), book entry and links; Springer book page https://link.springer.com/book/10.1007/978-3-662-11569-5 (2026-10-13); no erratum located; Author PDF used here, pp.281–302; finding scoped to this copy, without a published-version collation; Web search for Waldschmidt Diophantine Approximation Linear Algebraic Groups errata 9.17 282 (2026-10-13); no correction located.


### E611. Published Appendix, Lemma, pp.111–112; convention (0.20), p.21

**Error.** The Appendix lemma gives residue degree max(fP0,2) after adjoining ζ3 at p=2 or i at p≡3 mod4, and its proof treats every fP0≥2 as a splitting case. Replace this by lcm(fP0,2) in these cases. The quadratic residue polynomial splits precisely for even fP0, and for odd fP0 the residue degree doubles. The p≡1 mod4 case is unchanged.

A degree-two finite field embeds in F_(p^fP0) only when 2 divides fP0. At p=2 the unramified cubic example in E609 gives degree 6. At p=3 and fP0=3, F27 has multiplicative order 26, so it has no primitive fourth root; adjoining i gives residue field F729. The claimed Appendix lemma itself is false; this is not a counterexample to the final linear-form bounds. Reach: the Appendix lemma as stated. Known correction: new.

Correction search: Numdam version-of-record item https://www.numdam.org/item/CM_1990__74_1_15_0/ and its erratum link (2026-10-13); Published correction https://www.numdam.org/item/CM_1990__76_1-2_307_0.pdf, p.307 (2026-10-13); its three entries do not correct the Appendix; Yu 1994 pp.247 and 271: actual-residue convention clarified but the dyadic max formula remains (E609); Web search for Kunrui Yu linear forms p-adic logarithms II 1990 Appendix residue degree correction erratum (2026-10-13); no Appendix correction located.

## Sources and versions

All statements and proof outlines above are written in our own words. Source
locators refer to printed pagination; the MPIM precursor has its own preprint
pagination. The precursor's analytic proof is not a claim that the unread
terminal lemma in the journal version has been checked.

- [Michel Waldschmidt; Chapters 5 and 8 by Damien Roy, Diophantine Approximation on Linear Algebraic Groups](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf), Springer Grundlehren 326 (2000), author PDF. Read 2026-10-13: Chapter 3, §§3.2–3.5, pp.73–86; Chapter 5, §§5.2–5.3, pp.150–165; Chapter 7, §§7.2–7.3, pp.192–198; Chapter 8, §§8.1–8.4, pp.231–247; Chapter 9, §§9.1–9.4, pp.251–255 and 269–312. SHA-256 `e04a822f5b5d61be78c290f508ee7c8a28766e060ef4ec62377d068a942e3d59`.
- [Kunrui Yu, Linear forms in p-adic logarithms. II](https://www.numdam.org/item/CM_1990__74_1_15_0.pdf), Compositio Mathematica 74 (1990), pp.15–113. Read 2026-10-13: §1, pp.22–30; §2, pp.30–67; §3, pp.67–81; §4 and Appendix, pp.81–98 and 111–112. SHA-256 `953caea45f0bd7935e67f1c1b00e79a71001c66ce6e79e2c24460cf989dfd45b`.
- [Kunrui Yu, Linear forms in p-adic logarithms. III](https://www.numdam.org/item/CM_1994__91_3_241_0.pdf), Compositio Mathematica 91 (1994), pp.241–276. Read 2026-10-13: §0, pp.241–247; §1–§4, pp.248–272; §5–§6, pp.272–276 (scope check only). SHA-256 `caea575fec7e5abb1fc7c4397cbd7a5f0f76e2b81a30aeb275b7c60ad8a1d846`.
- [Kunrui Yu, Correction to “Linear forms in p-adic logarithms. II”](https://www.numdam.org/item/CM_1990__76_1-2_307_0.pdf), Compositio Mathematica 76 (1990), p.307. Read 2026-10-13: Entire correction, p.307. SHA-256 `691a9bf832f8b97ee251cd9cdfc2d3313f28d4eb4f2afd3a3c1fe6a8ed8ef4fd`.
- [E. M. Matveev, An explicit lower bound for a homogeneous rational linear form in logarithms of algebraic numbers. II](https://www.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=314&what=fullteng&option_lang=eng), Izvestiya: Mathematics 64 (2000), pp.1217–1269, English version of record. Read 2026-10-13: §1, notation, pp.1217–1218; §2, Corollary 2.3, p.1219; statement only; §§3–21 not decomposed. SHA-256 `e395e4698837950b683362558441e1e75298ad28cb0cc8cf260a556c93093574`.
- [Kunrui Yu, Linear forms in p-adic logarithms](https://archive.mpim-bonn.mpg.de/id/eprint/3587/1/preprint_1987_20.pdf), MPIM preprint 1987-20; precursor to Acta Arithmetica 53 (1989). Read 2026-10-13: Chapter I §§2 and 4, pp.12–14 and 18–26; Appendix, Theorem A and construction, pp.144–149; locators are preprint pages. SHA-256 `9a8f69d791d9dc9fa7e16ec344a141b65a8ca6109c3c8cf742e0a0bbd8bedc1d`.

## Suggested declarations

The accompanying suggested file keeps three light polynomial definitions with
real finite-product bodies and two checks per definition. It states the
conservative complex milestone, the general fixed-logarithm bound, its complex
product consumer and a rational finite-place consumer. These signatures use
native absolute heights, number fields, complex numbers, minimum polynomials
and the rational p-adic norm. They are prototypes rather than implementations.
The conservative signature permits a containing number field: the determinant
criterion can be applied in that field using its own degree and the displayed
height/log hypotheses.

The heavier definitions and all of their API and Check statements remain
specified above. No replacement carrier or unspecified property is inserted
to make a signature typecheck. The exact integer-coefficient variants and
algebraic prime-restriction statements likewise remain mathematical targets
where their complete interfaces are supplied by the owner roadmaps.
