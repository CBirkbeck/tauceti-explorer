# Diophantine approximation and transcendence

**Roadmap** `DiophantineApproximationAndTranscendence` · stages DT.0–DT.5 · baseline Mathlib `082e2d3`, Tau Ceti `f790474`.

## Purpose

This roadmap develops the approximation of real and algebraic numbers by rationals and by algebraic numbers, and the
transcendence theory of the exponential function and its logarithms, to the point where their finiteness and effectivity
theorems can be used by the rest of the atlas.

- **Finiteness.** The roadmap proves:
  - Liouville's, Thue's and Roth's theorems;
  - Schmidt's Subspace Theorem and its p-adic form, with their applications to norm form and S-unit equations.
- **Effectivity.** It gives:
  - the theorems of Hermite, Lindemann–Weierstrass, Gelfond–Schneider and Baker;
  - Baker's, Matveev's and Yu's lower bounds for linear forms in logarithms;
  - the effective bounds for unit, Thue, superelliptic and S-unit equations that those lower bounds yield.
- **Beyond Baker.** It states and organises the theory of E- and G-functions, Mahler's method, algebraic independence and
  functional transcendence.

The roadmap keeps two things apart throughout:

- **Ineffective finiteness,** such as Roth's theorem and the Subspace Theorem, which bound the number of solutions but not
  their size.
- **Effective bounds,** which are Baker-type and give a proven search region.

Every theorem says which of the two it provides. Conjectural transcendence principles (Schanuel's conjecture, the period
conjecture) appear only as explicit hypotheses of conditional statements.

## Scope and structure

| Stage | Title | Content | Status of this blueprint |
|---|---|---|---|
| DT.0 | Heights and approximation constants | Heights, Mahler measure, house, Siegel's lemma over number fields, Dirichlet and Kronecker approximation, approximation exponents | partial: every source result decomposed; two requests to GeometryOfNumbersAndQuadraticArithmetic open |
| DT.1 | Liouville and Roth | Liouville with explicit constant, Thue by the auxiliary polynomial, Roth in full (index, divided derivatives, Wronskians, Roth's lemma), Thue equations | closed |
| DT.2 | Subspace theorem and S-unit equations | Subspace Theorem and p-adic form with exceptional subspaces, Roth from Subspace, approximation by algebraic numbers, norm form equations, Mahler's theorem, S-unit equations; the Evertse–Ferretti proof to its numbered results | partial: imported inputs of the proof, Schmidt's norm form theorem |
| DT.3 | Transcendence and logarithmic forms | Hermite, Lindemann–Weierstrass (Baker's form), Gelfond–Schneider, Baker 1966 by the Schneider–Lang method; exact statements of the quantitative bounds | partial: proofs of the quantitative bounds; absolute-height lemmas |
| DT.4 | Effective applications | Units and regulators, the unit equation, Thue, superelliptic and Catalan-type equations, S-unit equations, Pillai-type equations; height, degree and branch conversions | partial: proofs of 5.14 and 5.15, Tijdeman's bound, Yu for algebraic numbers |
| DT.5 | Further transcendence and unlikely intersections | E- and G-functions, Siegel–Shidlovskii and Beukers' refinement, André, Mahler functions and Nishioka, Nesterenko, Ax–Schanuel and Ax–Lindemann, Schanuel's and the period conjectures as hypotheses | partial: proofs without public sources, differential Galois theory |

**Order.** The atlas orders the stages DT.0 → DT.1 → DT.2 and DT.0 → DT.3 → DT.4 → DT.5. In the sources, Roth's theorem is
also a half-page corollary of the Subspace Theorem (Evertse, Corollary 7.2). The roadmap proves it directly in DT.1 by Roth's
method and records the Subspace deduction in DT.2 as a second proof: the Subspace Theorem's own proof uses Roth-type
machinery, so this is not a cycle.

## Conventions

- **Heights.**
  - **Naive height.** For α algebraic of degree d with primitive minimal polynomial f = a_d X^d + … + a_0 ∈ ℤ[X]
    (a_d > 0), H(α) = max |a_i|. For a rational x/y in lowest terms, H = max(|x|, |y|).
  - **Mahler measure.** M(α) = a_d ∏ max(1, |α^{(i)}|).
  - **Absolute Weil height.** H_abs(α) is Mathlib's `NumberField.absMulHeight₁`, with h = log H_abs. Then
    M(α) = H_abs(α)^d, and 2^{−d} H(α) ≤ M(α) ≤ (d+1)^{1/2} H(α) (DT.0).
  - **Mathlib's normalisation.** Mathlib's relative heights `Height.mulHeight` are taken in a fixed number field. Its places
    and product formula, including the multiplicity 2 at complex places, are used as they stand.
- **House.** The house of α is max_i |α^{(i)}|, over all complex conjugates. It is independent of the field in which α is
  considered; DT.0 compares it with Mathlib's `NumberField.house`.
- **Logarithms.**
  - A logarithm of a nonzero complex number is any solution of e^z = α. Theorems that depend on the branch say which
    branch they use.
  - The principal branch is Mathlib's `Complex.log`.
  - Passing from Baker's logarithmic form Λ = b_1 log α_1 + … + b_m log α_m to the multiplicative form α_1^{b_1} ⋯ α_m^{b_m} − 1
    adds a winding term 2kπi with |k| bounded by the exponents. DT.4 states the conversion.
  - p-adic logarithms enter only through the statement of Yu's theorem. Baker–Brumer p-adic independence belongs to
    IntegralIwasawaTheory.
- **Effectivity.** A bound is *effective* when the roadmap proves an explicit function of the stated parameters bounding
  the solutions. Finiteness theorems obtained from Roth's theorem or the Subspace Theorem are stated as finiteness only.

## Boundaries with other roadmaps

- **Mathlib.** It supplies the baseline: Dirichlet's theorem and continued fractions, Weil heights and the product formula,
  Liouville numbers and `LiouvilleWith`, Mahler measure, Siegel's lemma over ℤ and over rings of integers, Minkowski's
  convex body theorem, Dirichlet's unit theorem, part of Lindemann–Weierstrass, and linear recurrences. Nothing it contains
  is planned here.
- **GeometryOfNumbersAndQuadraticArithmetic.** It owns Minkowski-type theorems. This roadmap requests three things:
  - from GN.1, Minkowski's linear forms theorem in its closed-box form, and successive minima with Minkowski's second
    theorem;
  - from GN.4, the polar-lattice covering bound.

  Heights of subspaces and twisted heights, which only the Subspace Theorem uses, are planned here in DT.2.
- **EffectiveDiophantineMethods ED.2.** It owns lattice reduction and certified enumeration. DT.4 exports its bound
  theorems to ED.2 and plans no search.
- **ClassicalArithmeticCompletion CA.2.** It owns linear recurrence sequences. DT.2 requests their closed form for the
  Skolem–Mahler–Lech application.
- **PeriodsAndSpecialValues, HeightsRationalPointsAndObstructions and LogicAndDefinabilityInNumberTheory LD.6.** They own
  periods, rational points and o-minimal unlikely intersections. DT.5 states the functional-transcendence inputs that LD.6
  consumes, and a restructuring proposal records the link.
- **The absolute-height API.** RS-03 assigns it to the Mathlib baseline. Mathlib `082e2d3` lacks:
  - the extension formula and the field-independence of `absMulHeight₁`, which DT.0 plans;
  - elementary inequalities (inverse, product, sum), which are recorded as a gap consumed by DT.3.

## Sources

The main source is J.-H. Evertse, *Diophantine Approximation*, lecture notes for the Leiden/Mastermath course, 2019 edition,
chapters 1–8 (public, http://pub.math.leidenuniv.nl/~evertsejh/dio.shtml). The proofs Evertse only states come from public
primary sources:

- **Roth's theorem:** L. Pottmeyer's lecture notes.
- **The Subspace Theorem:** Evertse–Ferretti (arXiv:1008.2340), Evertse's preprints, and Evertse–Schlickewei–Schmidt
  (arXiv:math/0409604).
- **Baker's theorem:** M. Waldschmidt, *Diophantine Approximation on Linear Algebraic Groups* (posted on the author's page).
- **The quantitative bounds:** Matveev (Izv. Math. 2000) and Yu (Compositio 1990, 1994).
- **DT.4:** Bérczes–Evertse–Győry and Bugeaud–Győry.
- **DT.5:** Beukers (Annals 2006 and his Arizona Winter School notes), Adamczewski–Faverjon, André, Kirby, and
  Bakker–Tsimerman's lectures.

The selected sources named in the atlas are W. M. Schmidt, *Diophantine Approximation* (LNM 785) and Waldschmidt's book.
Schmidt's LNM is not public and is used only through these public equivalents. The packet's `sources` list records every
source, with URLs, and the sections read. Mistakes found in the sources are recorded in the packet's `sourceIssues`, with
corrections; the nodes use the corrected statements.

## DT.0 — Heights and approximation constants

This layer fixes the quantitative vocabulary that every other layer of the roadmap measures with:
the heights of algebraic numbers in both of the conventions the sources use (the naive height of
the primitive minimal polynomial, and Mathlib's absolute Weil height), the Mahler measure and the
house, the exact comparisons between them, and the exponents of rational and algebraic
approximation, with Dirichlet's theorem derived from Minkowski's convex body theorem as the basic
lower bound for all of them. It also builds the two tools of Evertse's chapter 3 that the
auxiliary-polynomial proofs of DT.1 and DT.3 need and Mathlib lacks in the required form:
Siegel's lemma over a number field with rational-integer solutions, and the Liouville-type size
bound for conjugates.

The source is Evertse, *Diophantine Approximation* (Leiden lecture notes, 2019 edition),
chapters 1–3, with the uses in chapters 4–7 read; Bugeaud, *Exponents of Diophantine
approximation* (arXiv:1502.03052) for the exponents; Sondow (arXiv:math/0406300) for the
continued-fraction formula; Smyth's Mahler-measure survey (arXiv:math/0701397) and the lecture
notes of Wu (Columbia) and Yang (Waterloo, C. L. Stewart's course) for the comparison of the
Mahler measure with the Weil height. Schmidt's LNM 785 and Waldschmidt's Grundlehren volume, named
by the atlas route, are not publicly available; Evertse's chapters 1–2 follow Schmidt, LNM 785,
chapter II.

### What Mathlib already provides (consume; never restate)

At Mathlib 082e2d3 the following are complete and are cited, not rebuilt.

- **Weil heights and places.** `Height.mulHeight₁`, `Height.mulHeight` (relative heights over a
  field with admissible absolute values), `NumberField.instAdmissibleAbsValues` (infinite places
  with multiplicity `mult`, finite places, product formula), the familiar product expressions
  `NumberField.mulHeight₁_eq`, `NumberField.mulHeight_eq`, the product formula
  `NumberField.prod_abs_eq_one`, Northcott inside a fixed number field
  `NumberField.finite_setOfPred_mulHeight₁_le`, the absolute height `NumberField.absMulHeight₁`,
  heights of rationals `Rat.mulHeight₁_eq_max`, and the denominator bound
  `NumberField.natDenominator_le_mulHeight₁`.
- **Denominators.** `Algebra.natDenominator` is Evertse's `den(α)` (the least positive `a` with
  `aα` integral: `Algebra.natDenominator_dvd_iff`); Evertse's Lemma 3.7 (`a₀α` is integral) is
  `isIntegral_leadingCoeff_smul`.
- **Mahler measure of polynomials.** `Polynomial.mahlerMeasure`, `Polynomial.mapMahlerMeasure`,
  Jensen's formula `Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots`, multiplicativity
  `Polynomial.mahlerMeasure_mul`, **Landau's inequality**
  `Polynomial.mahlerMeasure_le_sqrt_sum_sq_norm_coeff` and its sup-norm form
  `Polynomial.mahlerMeasure_le_sqrt_natDegree_add_one_mul_supNorm`, the coefficient bound
  `Polynomial.supNorm_le_choose_natDegree_div_two_mul_mahlerMeasure`, Northcott
  `Polynomial.finite_mahlerMeasure_le` and Kronecker `Polynomial.pow_eq_one_of_mahlerMeasure_eq_one`;
  `Polynomial.supNorm` is the naive height of a polynomial.
- **Gauss's lemma.** `Polynomial.gaussNorm_mul` (multiplicativity of Gauss norms for a
  nonarchimedean absolute value) and `Polynomial.isPrimitive_iff_forall_gaussNorm_eq_one`.
- **House in a fixed number field.** `NumberField.house`, `NumberField.house_eq_sup'`,
  `NumberField.house_mul_le`, `NumberField.house_add_le`, Evertse's Lemma 3.6
  (`NumberField.exists_conjugate_one_le_norm`), `NumberField.norm_norm_le_norm_mul_house_pow`,
  `NumberField.Embeddings.coeff_bdd_of_norm_le`, finiteness in a fixed field
  `NumberField.Embeddings.finite_of_norm_le` and Kronecker's theorem
  `NumberField.Embeddings.pow_eq_one_of_norm_eq_one`.
- **Siegel's lemma over ℤ.** `Int.Matrix.exists_ne_zero_int_vec_norm_le` is Evertse's Theorem 3.18
  (its constant `(N·max(1,‖A‖))^{M/(N−M)}` is at most Evertse's `(NA)^{M/(N−M)}` for `A ≥ 1`).
  Mathlib's number-field version `NumberField.house.exists_ne_zero_int_vec_house_le` has solutions
  in `𝓞 K` and unspecified constants; it is **not** Evertse's Theorem 3.20, which is built here.
- **One-dimensional Dirichlet, continued fractions, Liouville.** `Real.exists_int_int_abs_mul_sub_le`
  and `Real.exists_rat_abs_sub_le_and_den_le` (Evertse's Theorem 1.1, the second with
  coprimality), `Real.infinite_rat_abs_sub_lt_one_div_den_sq_of_irrational` (Corollary 1.2),
  `Real.convergent`, `Real.convs_eq_convergent`, Legendre's criterion `Real.exists_rat_eq_convergent`,
  the upper error bound `GenContFract.abs_sub_convs_le`, the exact error `GenContFract.sub_convs_eq`
  and the determinant formula `GenContFract.determinant` (Evertse's Exercise 1.7(iii)–(iv));
  `LiouvilleWith`, `Liouville`, `forall_liouvilleWith_iff`, `ae_not_liouvilleWith`,
  `liouville_liouvilleNumber`, `transcendental_liouvilleNumber`, and Liouville's inequality with an
  existential constant `Liouville.exists_pos_real_of_irrational_root`.
- **Minkowski.** `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`
  (compact form with `≤`, Evertse's Theorems 1.3 and 2.4). Its "actual inequalities" export,
  Minkowski's linear forms theorem, is owned by `GeometryOfNumbersAndQuadraticArithmetic:GN.1`
  and requested from there.
- **Algebraic numbers.** The facts of Evertse §§3.1–3.3 and 3.5: `minpoly.dvd`,
  `minpoly.irreducible`, integral closures, `NumberField.Embeddings.card` (Proposition 3.11),
  `NumberField.Embeddings.range_eval_eq_rootSet_minpoly` (Corollary 3.13 in set form),
  `Algebra.norm_eq_prod_embeddings`, `NumberField.isUnit_iff_norm` (Lemma 3.16),
  `Field.exists_primitive_element`, the Galois correspondence, and `Algebraic.countable`
  (Theorem 1.7(ii)).

### Standing conventions

- **Where algebraic numbers live.** Every height-type definition takes `x` in an arbitrary field of
  characteristic zero, like Mathlib's `absMulHeight₁`; conjugates are the complex roots of
  `minpoly ℚ x`, so no embedding into `ℂ` is chosen. All of them are invariant under ring
  homomorphisms of such fields and under replacing `x` by a conjugate.
- **Junk values.** For transcendental `x`: `F_x = 1`, `H(x) = 1`, `M(x) = 1` (matching Mathlib's
  junk value `1` for `absMulHeight₁`; Mathlib's docstring says `0`, the code returns `1`), and
  `⌈x⌉ = 0`. With these choices the comparison `M(x) = H_abs(x)^{deg x}` holds without an
  algebraicity hypothesis.
- **Two heights, never conflated.** The *naive height* `H(x)` is the maximum absolute value of the
  coefficients of the primitive minimal polynomial (Evertse ch. 3, used in chapters 5–7 and in
  Bugeaud). The *absolute height* is Mathlib's `absMulHeight₁`, normalised so that it is
  independent of the field. They agree on `ℚ`, where both equal `max(|num|, den)`; elsewhere they
  differ (`H(√2) = 2`, `absMulHeight₁ √2 = √2`) and are compared by explicit inequalities.
  Mathlib's `mulHeight₁` on a number field `K` is the *relative* height `H_K`, equal to
  `H_abs^{[K:ℚ]}`.
- **Places and multiplicities.** Absolute values are Mathlib's: infinite places with `mult w ∈ {1, 2}`
  and finite places normalised by the absolute norm, so that the product formula has no further
  local degrees.
- **Exponents** take values in `ℝ≥0∞` as suprema of `ofReal`; "infinitely many solutions" is
  `Set.Infinite`; heights of integer vectors are maximum norms; `‖t‖` for real `t` in the
  badly-approximable and Littlewood statements is the distance `|t − round t|` to the nearest
  integer.

### Objects

**Primitive minimal polynomial** (`DiophantineApproximation.primitiveMinpoly`,
node `DT.0/primitive-minimal-polynomial`). For algebraic `x`, `F_x ∈ ℤ[X]` is the unique primitive
integer polynomial with positive leading coefficient `a₀` that is a rational multiple of
`minpoly ℚ x`; built by clearing denominators (`IsLocalization.integerNormalization`), taking the
primitive part and fixing the sign. Over `ℂ`, `F_x = a₀ ∏ (X − x^{(i)})`.
API: `aeval_primitiveMinpoly`, `isPrimitive_primitiveMinpoly`, `leadingCoeff_primitiveMinpoly_pos`,
`irreducible_primitiveMinpoly`, `natDegree_primitiveMinpoly`, `primitiveMinpoly_dvd_iff` (a
polynomial in `ℤ[X]` vanishes at `x` iff `F_x` divides it in `ℤ[X]`),
`primitiveMinpoly_eq_of_isPrimitive` (extensionality), `primitiveMinpoly_eq_minpoly_int` (equals
`minpoly ℤ x` for algebraic integers), `primitiveMinpoly_ratCast` (`F_{p/q} = qX − p`),
`primitiveMinpoly_map`, `primitiveMinpoly_eq_of_minpoly_eq`, `primitiveMinpoly_of_not_isAlgebraic`,
`isIntegral_leadingCoeff_primitiveMinpoly_smul` (Lemma 3.7), and
`natDenominator_dvd_leadingCoeff_primitiveMinpoly`. The relation with the rational minimal
polynomial is its own lemma, `map_primitiveMinpoly` (`DT.0/map-primitive-minpoly`): the image of
`F_x` in `ℚ[X]` is `a₀·minpoly ℚ x`, so `deg F_x = deg x` and the complex roots of `F_x` are the
conjugates.
Unit tests: `test_primitiveMinpoly_twoThirds` (`F_{2/3} = 3X − 2`),
`test_primitiveMinpoly_evertseExample` (`F = 25X² − 10X − 11` for `(1 + 2√3)/5`, Evertse p. 41),
`test_primitiveMinpoly_transcendental` (`1` at `liouvilleNumber 10`),
`test_primitiveMinpoly_half_ne_minpolyInt` (differs from `minpoly ℤ (1/2) = 0`, the tempting wrong
definition), `test_primitiveMinpoly_sqrtTwo` (equals `minpoly ℤ √2`).

**Naive height** (`naiveHeight`, `DT.0/naive-height-of-algebraic-number`). `H(x) := supNorm F_x`.
API: `naiveHeight_eq_iSup`, `one_le_naiveHeight`, `naiveHeight_inv` (Exercise 3.1(i)),
`naiveHeight_map`, `naiveHeight_eq_of_minpoly_eq`, `inv_naiveHeight_add_one_le_norm` and
`norm_le_naiveHeight_add_one` (Exercise 3.1(ii), from Cauchy's bound),
`natDenominator_le_naiveHeight`, `naiveHeight_intCast`. The rational case is the lemma
`naiveHeight_ratCast` (`DT.0/naive-height-of-rational`): `H(x/y) = max(|x|, y) = mulHeight₁ (x/y)`
for `x/y` in lowest terms — the height of Evertse's chapter 6 and of Roth's theorem.
Unit tests: `test_naiveHeight_evertseExample` (`25`), `test_naiveHeight_zero` (`1`),
`test_naiveHeight_sqrtTwo` (`2`), `test_naiveHeight_sqrtTwo_ne_absHeight` (non-example: not the
Weil height), `test_naiveHeight_twoThirds_eq_mulHeight` (compatibility with Mathlib on `ℚ`).

**Mahler measure** (`mahlerMeasure`, `DT.0/mahler-measure-of-algebraic-number`). `M(x)` is
Mathlib's Mahler measure of `F_x` in `ℂ[X]`, i.e. `a₀ ∏ max(1, |x^{(i)}|)`.
API: `mahlerMeasure_eq_leadingCoeff_mul_prod` (root form), `one_le_mahlerMeasure`,
`leadingCoeff_le_mahlerMeasure`, `mahlerMeasure_ratCast`, `mahlerMeasure_inv`, `mahlerMeasure_map`,
`mahlerMeasure_eq_of_minpoly_eq`, `mahlerMeasure_eq_one_iff` (`M(x) = 1` iff `x = 0` or a root of
unity), `finite_setOf_mahlerMeasure_le` (Northcott).
Unit tests: `test_mahlerMeasure_half` (`2`), `test_mahlerMeasure_sqrtTwo` (`2`),
`test_mahlerMeasure_goldenRatio` (`φ`), `test_mahlerMeasure_I` (`1`), `test_mahlerMeasure_zero`
(`1`), `test_mahlerMeasure_half_ne_norm` (non-example: `M(1/2) = 2 ≠ |N(1/2)|`).

**House** (`house`, `DT.0/house-of-algebraic-number`). `⌈x⌉` is the maximum absolute value of
the complex roots of `minpoly ℚ x`. The compatibility with Mathlib is its own lemma,
`house_eq_numberField_house` (`DT.0/house-eq-numberField-house`, Evertse (3.2)): for `x` in a
number field `K`, `⌈x⌉ = NumberField.house x`, whatever `K` is.
API: `house_nonneg`, `norm_le_house`, `house_map`, `house_eq_of_minpoly_eq`, `house_mul_le`,
`house_add_le`, `house_pow` (Exercise 3.5), `house_ratCast`, `one_le_house` (Lemma 3.6),
`house_eq_one_iff` (Exercise 3.6(iv), Kronecker), `house_le_mahlerMeasure` and
`mahlerMeasure_le_leadingCoeff_mul_max_one_house_pow` (Smyth (6)).
Unit tests: `test_house_sqrtTwo`, `test_house_conjugateGolden` (`⌈(1 − √5)/2⌉ = (1 + √5)/2`),
`test_house_ne_abs` (non-example: the house is not `|x|`), `test_house_zero`, `test_house_I`,
`test_house_two_eq_numberFieldHouse`.

**Irrationality exponent** (`irrationalityExponent`, `DT.0/irrationality-exponent`).
`μ(ξ) := sup {p : LiouvilleWith p ξ} ∈ [1, ∞]` in `ℝ≥0∞`. Pinned: `μ = 1` on `ℚ`, `μ ≥ 2` exactly on
irrationals, `μ = ∞` exactly on Liouville numbers; on irrationals it is the classical exponent
(Sondow, Definition 2; Bugeaud's `w₁ + 1`).
API: `one_le_irrationalityExponent`, `le_irrationalityExponent_of_liouvilleWith`,
`liouvilleWith_of_lt_irrationalityExponent`, `irrationalityExponent_eq_iSup_infinite`
(rational-approximation form), `irrationalityExponent_eq_top_iff`, `irrationalityExponent_ratCast`,
`two_le_irrationalityExponent_iff`, `irrationalityExponent_add_ratCast`,
`irrationalityExponent_ratCast_mul`, `irrationalityExponent_neg`, `ae_irrationalityExponent_eq_two`.
Unit tests: `test_irrationalityExponent_half` (`1`), `test_irrationalityExponent_sqrtTwo` (`2`),
`test_irrationalityExponent_liouvilleNumber` (`⊤`), `test_irrationalityExponent_zero_ne_top`
(non-example: forgetting `ξ ≠ m/n` would give `⊤`).

**Linear-form exponent** (`linearFormExponent`, `DT.0/linear-form-exponent`). For `θ ∈ ℝⁿ`,
`w(θ)` is the supremum of `w` with `0 < |x₀ + x₁θ₁ + ⋯ + xₙθₙ| ≤ ‖x‖^{−w}` for infinitely many
`x ∈ ℤ^{n+1}`; Mahler's `w_n(ξ)` is `mahlerExponent n ξ := w(ξ, …, ξⁿ)` (Bugeaud, Definition 2.1).
API: `mahlerExponent`, `linearFormExponent_one_add` (`w(ξ) + 1 = μ(ξ)` for irrational `ξ`),
`le_linearFormExponent_of_infinite`, `mahlerExponent_mono`.
Unit tests: `test_linearFormExponent_sqrtTwo` (`1`), `test_linearFormExponent_half` (`0`;
non-example for dropping `0 < |…|`), `test_linearFormExponent_empty` (`0`),
`test_linearFormExponent_liouvilleNumber` (`⊤`).

**Simultaneous exponent** (`simultaneousExponent`, `DT.0/simultaneous-approximation-exponent`).
`λ(θ)` is the supremum of `λ` with `max_j |x₀θ_j − x_j| ≤ |x₀|^{−λ}` for infinitely many
`(x₀, x) ∈ ℤ^{n+1}`, `x₀ ≠ 0` (Bugeaud, Definition 2.2, for a general vector).
API: `simultaneousExponent_one_add`, `simultaneousExponent_eq_top_of_forall_rat`,
`simultaneousExponent_le_comp`.
Unit tests: `test_simultaneousExponent_sqrtTwo` (`1`), `test_simultaneousExponent_rationals` (`⊤`),
`test_simultaneousExponent_empty` (`⊤`), `test_simultaneousExponent_sqrtTwo_sqrtThree` (`≤ 1`).

**Algebraic-approximation exponent** (`algebraicApproximationExponent`,
`DT.0/algebraic-approximation-exponent`). `w*_n(ξ)` is the supremum of `w` with
`0 < |ξ − α| ≤ H(α)^{−w−1}` for infinitely many algebraic `α ∈ ℂ` of degree `≤ n`, `H` the naive
height (Bugeaud, Definition 2.1).
API: `algebraicApproximationExponent_one_add`, `algebraicApproximationExponent_mono`.
Unit tests: `test_algebraicApproximationExponent_sqrtTwo` (`1`),
`test_algebraicApproximationExponent_zero` (`w*_0 = 0`), `test_algebraicApproximationExponent_half`
(`0`; non-example for dropping `0 < |ξ − α|`), `test_algebraicApproximationExponent_liouvilleNumber`
(`⊤`).

**Badly approximable numbers** (`BadlyApproximable`, `DT.0/badly-approximable`). Irrational `ξ`
with `q‖qξ‖ ≥ c > 0` for all `q ≥ 1` (Evertse p. 23).
API: `BadlyApproximable.irrationalityExponent_eq` (`μ = 2`),
`badlyApproximable_of_natDegree_minpoly_eq_two` (quadratic irrationals, via Mathlib's Liouville
inequality; Exercise 2.7), `BadlyApproximable.not_liouville`, `BadlyApproximable.add_ratCast`,
`BadlyApproximable.ratCast_mul`.
Unit tests: `test_badlyApproximable_sqrtTwo`, `test_not_badlyApproximable_rat`,
`test_not_badlyApproximable_liouvilleNumber`, `test_badlyApproximable_goldenRatio`.

**Littlewood's conjecture** (`LittlewoodConjecture`, `DT.0/littlewood-conjecture`): the
proposition that for all `α, β` and `ε > 0` some `y ≥ 1` has `y‖yα‖‖yβ‖ < ε`. It is a statement for
explicit hypotheses, never an input. API: `littlewood_of_not_badlyApproximable`,
`infinite_setOf_mul_le_one` (the Dirichlet bound `≤ 1` infinitely often, Evertse p. 22).
Unit tests: `test_littlewood_rat`, `test_littlewood_liouvilleNumber`,
`test_littlewood_oneDimensional_false` (the one-dimensional analogue fails at `√2`).

### Heights under field extension, and `M(x) = H_abs(x)^{deg x}`

Mathlib's `absMulHeight₁` is defined through `ℚ⟮x⟯`; the facts that make it an absolute height are
missing at the pin and are built here, in the general form (tuples) that projective heights in
`HeightsRationalPointsAndObstructions:RP.0` also need.

- `prod_infinitePlace_comap_pow_mult` (`DT.0/infinite-places-over`): for number fields `K ⊆ L`,
  `∏_{w} g(w|_K)^{mult w} = ∏_{v} g(v)^{mult v·[L:K]}`, from `mult_mul_finrank`,
  `inertiaDeg_eq_finrank` and `sum_inertiaDeg_eq_finrank`.
- `mulHeight_algebraMap` (`DT.0/mul-height-algebra-map`): `mulHeight (x in L) = mulHeight(x)^{[L:K]}`
  for tuples `x` over `K` (scalar form `mulHeight₁_algebraMap`). Infinite part by the previous
  lemma; finite part by Mathlib's `FinitePlace.equivHeightOneSpectrum_symm_apply_algebraMap`
  (`|y|_P = |y|_p^{e f}`) and `∑_{P|p} e f = [L:K]` (`Ideal.sum_ramification_inertia_eq_finrank`).
- `mulHeight_ringEquiv` (`DT.0/mul-height-ring-equiv`): invariance under isomorphisms of number
  fields (the degree-one case of the extension formula).
- `absMulHeight₁_eq_rpow` (`DT.0/abs-mul-height-eq-rpow`): `absMulHeight₁ x = mulHeight₁(x)^{1/[K:ℚ]}`
  in any number field `K ∋ x`.
- `absMulHeight₁_eq_of_minpoly_eq` (`DT.0/abs-mul-height-eq-of-minpoly-eq`): conjugates, and images
  under field embeddings, have the same absolute height.
- `gaussNorm_map_eq_one_of_isPrimitive` (`DT.0/gauss-norm-primitive-finite-place`) and
  `finitePlace_leadingCoeff_mul_prod_max_eq_one` (`DT.0/finite-place-gauss-lemma`): if a primitive
  `P ∈ ℤ[X]` splits as `a ∏ (X − b)` over a number field `L`, then `|a|_w ∏ max(|b|_w, 1) = 1` at
  every finite place `w` (Gauss's lemma through Mathlib's `gaussNorm_mul`).
- **Theorem** `mahlerMeasure_eq_absMulHeight₁_pow` (`DT.0/height-comparisons`): for every `x` in a
  field of characteristic zero, `M(x) = absMulHeight₁(x)^{deg x}` (Smyth (4)–(5); Wu, Proposition
  3.1). Proof: in the splitting field `L` of `minpoly ℚ x`, the finite places contribute
  `|a₀|_w^{-1}` each (Gauss), the infinite places contribute `M(x)^{[L:ℚ]}` in total (each complex
  embedding sends the roots in `L` to the complex roots), the product formula removes `a₀`, and the
  `d` conjugates all have relative height `absMulHeight₁(x)^{[L:ℚ]}`.

### Height inequalities and Northcott

- `naiveHeight_le_choose_mul_mahlerMeasure` (`DT.0/naive-height-le-choose-mul-mahler-measure`):
  `H(x) ≤ binom(d, ⌊d/2⌋)·M(x) ≤ 2^d M(x)`; `mahlerMeasure_le_sqrt_mul_naiveHeight`
  (`DT.0/mahler-measure-le-sqrt-mul-naive-height`, Landau): `M(x) ≤ √(d+1)·H(x)` (Evertse's remark
  after Theorem 6.1).
- `naiveHeight_absMulHeight₁_comparison` (`DT.0/naive-height-abs-height-comparison`):
  `2^{−d}H(x) ≤ absMulHeight₁(x)^d ≤ √(d+1)·H(x)`, all three heights equal on `ℚ`.
- `finite_setOf_naiveHeight_le` (`DT.0/northcott-naive-height`): at most `d(2⌊B⌋ + 1)^{d+1}`
  algebraic numbers of degree `≤ d` and naive height `≤ B` (Evertse's Theorem 1.7 argument);
  `finite_setOf_absMulHeight₁_le` (`DT.0/northcott-absolute-height`): Northcott over `Q̄` for
  Mathlib's absolute height (Mathlib has only the fixed-field version).
- `choose_half_mul_sqrt_le_two_pow` (`DT.0/central-binomial-sqrt-bound`) and **Gelfond's
  inequality** `gelfond_inequality` (`DT.0/gelfond-inequality`): for `f = f₁⋯f_m ∈ ℂ[X]` of degree
  `d`, `∏ H(f_j) ≤ 2^d H(f)` and `H(f) ≤ 2^d ∏ H(f_j)` (Wu, Lemma 3.5).

### House, denominators and the Liouville size bound

- `naiveHeight_le_two_mul_house_pow` (`DT.0/naive-height-le-two-mul-house-pow`, Exercise 3.6(ii)):
  `H(x) ≤ (2⌈x⌉)^d` for nonzero algebraic integers.
- `finite_setOf_isIntegral_house_le` (`DT.0/finite-algebraic-integers-house-le`, Exercise
  3.6(iii)): at most `∑_{k≤d} k(2⌊(2 max(C,1))^k⌋ + 1)^k` algebraic integers of degree `≤ d` with
  house `≤ C`; consumed by DT.4 (Corollary 5.11).
- `natDenominator_zpow_mul_house_zpow_le_norm_embedding` (`DT.0/liouville-size-bound-embedding`):
  in a number field of degree `D`, `|σ(x)| ≥ den(x)^{−D}·house(x)^{1−D}` for `x ≠ 0` — for units
  `|σ(ε)| ≥ house(ε)^{1−D}`, the form DT.4's Lemma 5.9 uses.
- **Theorem** `natDenominator_zpow_mul_house_zpow_le_norm` (`DT.0/liouville-size-bound`, Exercise
  3.7(i)): `|z| ≥ den(z)^{−d}⌈z⌉^{1−d}` for nonzero algebraic `z` of degree `d`, the input of
  Liouville's inequality in the form of Exercise 3.7(ii) (DT.1).

### Siegel's lemma over a number field

- `eq_zero_of_forall_abs_re_im_le` (`DT.0/small-integral-element-eq-zero`, Lemma 3.19): an
  algebraic integer all of whose conjugates have real and imaginary parts at most `2/3` in absolute
  value is `0`.
- **Theorem** `exists_ne_zero_int_vec_abs_le_of_house_le` (`DT.0/siegel-lemma-number-field`,
  Theorem 3.20): for `[K:ℚ] = d`, `N > dM > 0`, `A ≥ 1` and `a_ij ∈ 𝓞 K` with `⌈a_ij⌉ ≤ A`, the system
  `∑_j a_ij x_j = 0` has a solution `x ∈ ℤ^N \ {0}` with `max|x_j| ≤ (3NA)^{dM/(N−dM)}`. ⚠ The
  unknowns are rational integers; the proof uses exactly `d` real coordinates per equation (the
  mixed embedding), which is what makes the exponent `dM/(N−dM)`. Consumed by Thue's Lemma 6.10
  (DT.1) and the Gelfond–Schneider construction, Lemma 4.22 (DT.3).

### Dirichlet's theorem through Minkowski

- **Theorem** `dirichlet_linearForms` (`DT.0/dirichlet-approximation-from-minkowski`): for a real
  `m × n` matrix and real `Q > 1` there are `y ∈ ℤ^n \ {0}`, `x ∈ ℤ^m` with `max|y_j| ≤ Q` and
  `|L_i(y) − x_i| ≤ Q^{−n/m}`. Proof: Minkowski's linear forms theorem for the `m + n` forms
  `L_i(y) − x_i`, `y_j` (determinant `±1`, bounds `Q^{−n/m}` and `Q`), requested from
  `GeometryOfNumbersAndQuadraticArithmetic:GN.1`; `Q > 1` excludes `y = 0`.
- `dirichlet_linearForms_infinite` (`DT.0/dirichlet-linear-forms-infinitely-many`, Exercise 2.6):
  infinitely many solutions of `|L_i(y) − x_i| ≤ ‖y‖^{−n/m}` when no nonzero `y` makes all `L_i(y)`
  integral.
- **Theorem** `simultaneous_dirichlet` (`DT.0/simultaneous-dirichlet-theorem`, Theorem 1.4(i)):
  `0 < y ≤ Q^n`, `|x_i − α_i y| ≤ Q^{−1}`.
- `simultaneous_dirichlet_infinite` (`DT.0/simultaneous-dirichlet-infinitely-many`, Theorem
  1.4(ii) = Corollary 2.7(i)): infinitely many coprime `(x, y)`, `y > 0`,
  `|α_i − x_i/y| ≤ y^{−1−1/n}`, when not all `α_i` are rational.
- `dirichlet_linearForm_infinite` (`DT.0/dirichlet-linear-form-infinitely-many`, Corollary
  2.7(ii)): infinitely many `(x, y)`, `y ≠ 0`, `|α·y − x| ≤ ‖y‖^{−n}`; the input of Evertse's
  Lemma 7.6 (DT.2).
- `irrational_of_tendsto_abs_sub` (`DT.0/irrationality-criterion`, Lemma 1.9), used for the
  irrationality of `e` (DT.3).
- **Theorem** `kronecker_approximation` (`DT.0/kronecker-approximation-theorem`, Theorem 2.22):
  if `1, α₁, …, αₙ` are `ℚ`-linearly independent then for every `θ` and `ε > 0` there are
  infinitely many `(x, y)` with `|α_i y − x_i − θ_i| ≤ ε`; the input is the polar-lattice covering
  bound (Corollary 2.21), requested from `GeometryOfNumbersAndQuadraticArithmetic:GN.4`.

### Exponents: Dirichlet bounds and continued fractions

- `inv_le_simultaneousExponent` (`DT.0/simultaneous-exponent-dirichlet-bound`): `λ(θ) ≥ 1/n`.
- `natCast_le_linearFormExponent` (`DT.0/linear-form-exponent-dirichlet-bound`): `w(θ) ≥ n` when
  `1, θ₁, …, θₙ` are `ℚ`-linearly independent; hence `w_n(ξ) ≥ n` for `ξ` not algebraic of degree
  `≤ n` (Bugeaud, Theorem 2.5).
- `algebraicApproximationExponent_le_mahlerExponent` (`DT.0/algebraic-exponent-le-mahler-exponent`):
  `w*_n(ξ) ≤ w_n(ξ)` (Bugeaud, Theorem 2.5), by the mean value inequality as in Evertse's proof of
  Theorem 7.8.
- `one_div_den_mul_add_lt_abs_sub_convergent` (`DT.0/convergent-error-lower-bound`):
  `|ξ − p_k/q_k| > 1/(q_k(q_k + q_{k+1}))` (Evertse Exercise 1.7(iv); Sondow (5)).
- **Theorem** `irrationalityExponent_eq_one_add_limsup`
  (`DT.0/irrationality-exponent-continued-fraction`, Sondow Theorem 1):
  `μ(ξ) = 1 + limsup log q_{k+1}/log q_k` for irrational `ξ` — the bridge between continued
  fractions and the approximation constants.

### Dependencies

- `GeometryOfNumbersAndQuadraticArithmetic:GN.1`: Minkowski's linear forms theorem, boundary
  form (requested).
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4`: polar-lattice covering bound (requested; a new
  stage edge `GN.4 → DT.0`).
- `FoundationsAndLibraryIntegration:LI.4` is a library-integration input; no node consumes it,
  since places and the product formula are taken from Mathlib directly.
- Consumers: DT.1 (naive height of rationals, Mahler measure, size bound, Siegel's lemma,
  irrationality exponent), DT.2 (naive height, Dirichlet for one linear form), DT.3 (house,
  denominators, Siegel's lemma, irrationality criterion), DT.4 (size bound for units, finiteness by
  house), `ClassicalArithmeticCompletion:CA.6` (Mahler measure, house and absolute-height
  conventions; its lower bounds for the house and Mahler measure are its own),
  `LogicAndDefinabilityInNumberTheory:LD.6` (naive heights of rational and bounded-degree points),
  and `HeightsRationalPointsAndObstructions:RP.0` (the extension formula).

### Acceptance

- Normalisation: `H(x/y) = max(|x|, |y|) = mulHeight₁(x/y)` for coprime `x, y`; `den(x) ≤ a₀ ≤ H(x)`
  and Mathlib's `natDenominator_le_mulHeight₁` hold together; for `K = ℚ(i)`, `mulHeight₁ 2 = 4` and
  `absMulHeight₁ 2 = 2`.
- Rational versus algebraic inputs are distinguished: `H(√2) = 2`, `absMulHeight₁ √2 = √2`,
  `M(√2) = 2 = (√2)²`; `M(1/2) = 2 = H(1/2) = absMulHeight₁(1/2)`.
- Product formula: the proof of `M = H_abs^d` uses Mathlib's product formula with multiplicities
  `mult w`, and the test `M(φ) = φ = (√φ)²` for the golden ratio checks the archimedean weighting.
- Dirichlet: for `n = 1` the Minkowski route reproduces Theorem 1.1 (bound `1/Q`, against Mathlib's
  `1/(Q + 1)` for integer `Q`); the body `C_Q` has area exactly `4`; `Q > 1` is where `y = 0` is
  excluded.
- Exponents: `μ(ℚ) = 1`, `μ(√2) = 2`, `μ(liouvilleNumber 10) = ∞`, `λ(√2) = w(√2) = w*_1(√2) = 1`,
  `λ(θ) ≥ 1/n` for all `θ`, and the golden ratio has `μ = 2` from the continued-fraction formula.
- Siegel: the case `K = ℚ` agrees in shape with Mathlib's Siegel lemma over `ℤ`; the exponent is
  `dM/(N − dM)`.

### Source notes

Recorded mistakes (all harmless to the statements): Evertse's Corollary 1.2 prints `y ⩾ 0` for
`y > 0`; Lemma 3.19's proof and the remark after Theorem 3.20 write `n` and `σ_D` for `d` and `σ_d`;
in the proof of Theorem 2.22 the vector `b` must be `(−θ₁, …, −θₙ, 2ε)` rather than
`(θ₁, …, θₙ, 2Mε)` for the next display and the conclusion (2.7) to follow; chapter 4 cites
"Theorem 3.22" for Siegel's Lemma (Theorem 3.20); chapter 5 cites Exercise 3.6(ii) for the
finiteness statement of Exercise 3.6(iii); Wu's Lemma 2.5 is mislabelled "independent of the
choice of coordinates" while proving independence of the number field.

## DT.1 — Liouville and Roth

This layer proves the three classical theorems on the approximation of an algebraic number by
rationals, each with its complete proof: **Liouville's inequality** with the explicit constant
`2^{1−d} M(α)^{−1}`, **Thue's approximation theorem** (exponent `κ > d/2 + 1`) by the one-variable
auxiliary-polynomial method, and **Roth's theorem** (every exponent `κ > 2`) by the
several-variable method: Siegel's lemma for an auxiliary polynomial of large index at
`(α, …, α)`, **Roth's lemma** bounding its index at a point of rapidly increasing heights through
**generalized Wronskians** and **Gelfond's lemma**, and the final inequality chain. It then
derives the standard consequences: the lower-bound form of Roth's theorem for every algebraic
number, the statement that no real algebraic number is `LiouvilleWith p` for `p > 2`, the
transcendence of `∑ b^{−3^k}`, the lower bound for square-free binary forms, and the finiteness of
Thue equations `F(x, y) = m`.

**What the libraries already have.** Mathlib (pinned commit 082e2d3) proves Liouville's
inequality with an existential constant (`Liouville.exists_pos_real_of_irrational_root`) and the
transcendence of Liouville numbers, and defines the predicate `LiouvilleWith p x` whose docstring
names the Thue–Siegel–Roth consequence as missing. It has the relative Weil heights of a field with
admissible absolute values (`Height.mulHeight₁`, `Height.logHeight₁`, `Height.mulHeight` of tuples,
`Finsupp.logHeight` of finitely supported functions), the number-field instance with the product
formula, Northcott's theorem for number fields, and the rational formula
`mulHeight₁ q = max(|num q|, den q)`. It has the one-variable Mahler measure with its coefficient
bounds (`Polynomial.mahlerMeasure`, `mahlerMeasure_mul`,
`supNorm_le_choose_natDegree_div_two_mul_mahlerMeasure`,
`mahlerMeasure_le_sqrt_natDegree_add_one_mul_supNorm`), Gauss's lemma for nonarchimedean
absolute values (`Polynomial.gaussNorm_mul`), one-variable Hasse derivatives and Taylor shifts
(`Polynomial.hasseDeriv`, `Polynomial.taylor`), the Wronskian of *two* polynomials
(`Polynomial.wronskian`), the homogenization `Polynomial.homogenize`, Siegel's lemma over `ℤ`
(`Int.Matrix.exists_ne_zero_int_vec_norm_le`) and a Siegel lemma over a number field whose
solutions lie in the ring of integers (`NumberField.house.exists_ne_zero_int_vec_house_le`). It has
no explicit Liouville constant, no Siegel lemma with algebraic-integer coefficients and
*rational-integer* unknowns, no divided partial derivatives of multivariate polynomials, no index
of a polynomial, no height of a polynomial as a named notion, no Wronskian of more than two
polynomials, no Thue or Roth theorem, and nothing on Thue equations. (Mathlib's
"Roth's theorem" is the unrelated statement on three-term progressions.)

**Sources.** J.-H. Evertse, *Diophantine Approximation*, Leiden/Utrecht course notes, Chapter 6
(Liouville, Roth's statement, Thue's theorem with complete proof, Thue equations) and Chapter 3,
§3.4 (Siegel's lemma); L. Pottmeyer, *Diophantine Approximation*, lecture notes (Duisburg–Essen,
version of 17 January 2022), §2.6 (index, the auxiliary polynomial) and Chapter 3 (Gelfond's
lemma, Wronskians, Roth's lemma, the proof of Roth's theorem). Pottmeyer proves Roth's theorem for
a number field and a finite set of places; this layer uses his proof specialised to `K = ℚ` and the
archimedean place, where his approximation classes are void and the product formula becomes the
denominator bound. Roth's lemma itself is planned over an arbitrary number field, as the source proves it for
algebraic points and the proof is uniform.

**Boundaries.** The Mahler measure `M(α)` and the naive height of an algebraic number are
DiophantineApproximationAndTranscendence:DT.0's (`DT.0/mahler-measure-of-algebraic-number`). The
Subspace Theorem, the p-adic Roth theorem (Ridout; Evertse, Theorem 8.6), Roth's theorem over number
fields and S-unit equations are DiophantineApproximationAndTranscendence:DT.2's. Effective bounds for
Thue equations (Evertse, Theorems 5.13 and 6.6) and Fel'dman's effective improvement of Liouville
(Evertse, Theorem 6.5) are DiophantineApproximationAndTranscendence:DT.4's; this layer exports the
binary-form bound (6.2) that Fel'dman's deduction uses. The abc statements are owned by
tauceti:TauCetiRoadmap/EllipticCurves (layer 8) and Belyi's theorem by the BelyiMaps successor
roadmaps; Evertse's §6.3 is therefore not part of this layer. The results of Bombieri–Schmidt and
Bennett (Evertse, Theorems 6.7 and 6.8), quoted there without proof, are not targets of this
roadmap.

### Conventions

- **Heights of rationals.** `H(x/y) = max(|x|, |y|)` for coprime `x, y`: Mathlib's `mulHeight₁` on
  `ℚ` (`Rat.mulHeight₁_eq_max`); `h = log H` is `logHeight₁`. No private height is introduced.
- **Heights over a number field `K` are relative.** Mathlib's heights over `K` are not divided by
  `[K : ℚ]`; every statement over `K` that the sources write with absolute heights carries the
  factor `[K : ℚ]` (`Module.finrank ℚ K`, equal to the total archimedean weight by
  `NumberField.totalWeight_eq_finrank`).
- **Height of a polynomial** (one or several variables): the projective logarithmic height of its
  coefficient vector, Mathlib's `Finsupp.logHeight` of the coefficient function; it is invariant
  under nonzero scalars and equals `0` at the zero polynomial (Mathlib's junk value).
- **Derivatives are divided.** `P^{((k))} = P^{(k)}/k!` in one variable (Mathlib's
  `Polynomial.hasseDeriv`), and `∂^d x^m = (∏_j binom(m_j, d_j)) x^{m−d}` in several variables. All
  indices, Wronskians and Taylor expansions use divided derivatives; they preserve integrality.
- **The index is `[0, ∞]`-valued**, equal to `∞` exactly at the zero polynomial, so that
  additivity and the ultrametric inequality hold without side conditions. Weights `r_j` are
  positive integers wherever finiteness is used.
- **Binary forms** are homogeneous elements of the polynomial ring in two variables `X = X_0`,
  `Y = X_1` (Mathlib's `IsHomogeneous`); `F(X, 1)` is the substitution `X_1 ↦ 1`. **Square-free**
  is Evertse's notion: not divisible in `ℂ[X, Y]` by `(aX + bY)^2` for any `(a, b) ≠ (0, 0)`; it is
  stated as that condition, not replaced by another predicate.
- **Effectivity** is recorded in statements and acceptance tests; Liouville's constant and the
  constants of Thue's gap principle are explicit, while Thue's and Roth's finiteness theorems give
  no list of solutions.

### DT.1a — Liouville's inequality

**The binary-form bound (6.2)** (`DiophantineApproximation.abs_eval_homogenize_le`). For
`f ∈ ℤ[X]` of degree `d ≥ 1`, a complex root `α` of `f`, and integers `x`, `y > 0`,
`|F(x, y)| ≤ 2^{d−1} M(f) max(|x|, y)^d |α − x/y|`, where `F = Polynomial.homogenize f d` and
`M(f)` is Mathlib's Mahler measure of `f` in `ℂ[X]`. Proof: factor `f = a_0 ∏ (X − α_i)` over `ℂ`
with `α_1 = α`; bound `|x − α_i y| ≤ 2 max(1, |α_i|) max(|x|, y)` for `i ≥ 2` and
`|x − αy| ≤ max(1, |α|) max(|x|, y)|α − x/y|`; multiply and use
`M(f) = |a_0| ∏ max(1, |α_i|)`. Coprimality is not needed; for coprime `x, y` the maximum is
`H(x/y)`.

**Liouville's inequality** (`DiophantineApproximation.liouville_explicit`; Evertse, Theorem 6.1).
Let `α ∈ ℂ` be algebraic of degree `d ≥ 1` with primitive minimal polynomial `F_α ∈ ℤ[X]`
(irreducible, primitive, positive leading coefficient) and `M(α) = M(F_α)`. For every `ξ ∈ ℚ`,
`ξ ≠ α`: `|ξ − α| ≥ 2^{1−d} M(α)^{−1} H(ξ)^{−d}`. Proof: `F(x, y)` is a nonzero integer (the only
root of `F_α` in degree 1 is `α`; in degree `≥ 2`, `F_α` has no rational root), and (6.2) gives
`1 ≤ 2^{d−1} M(α) H(ξ)^d |α − ξ|`. Acceptance: in degree 1, `|a/b − x/y| ≥ 1/(max(|a|, b) H(ξ))`;
for irrational real `α` the explicit constant is an admissible value of Mathlib's existential
constant; the constant is computable from `F_α`.

### DT.1b — The ℓ¹-norm and Siegel's lemma

**The ℓ¹-norm** `‖P‖ = ∑_i ‖p_i‖` of a one-variable polynomial over a seminormed ring
(`Polynomial.l1Norm`; Evertse's "norm of a polynomial"). API: `l1Norm_zero`, `l1Norm_nonneg`,
`l1Norm_eq_sum_range` (the sum over `0..natDegree`), `l1Norm_C`, `l1Norm_monomial`, `l1Norm_neg`,
`norm_coeff_le_l1Norm`, `supNorm_le_l1Norm` and `l1Norm_le_mul_supNorm` (comparison with Mathlib's
`supNorm`), `l1Norm_eq_zero_iff` (over a normed ring), `mahlerMeasure_le_l1Norm` (Mathlib's
`mahlerMeasure_le_sum_norm_coeff`). Lemmas used by Thue's proof, each its own declaration:
`l1Norm_add_le` and `l1Norm_mul_le` ((6.14)); `norm_eval_le_l1Norm_mul`:
`|P(z)| ≤ ‖P‖ max(1, |z|)^{deg P}` ((6.13)); `l1Norm_taylor_le`:
`‖P(X + a)‖ ≤ ‖P‖ (1 + |a|)^{deg P}` ((6.15), with Mathlib's `taylor`); `l1Norm_hasseDeriv_le`:
`‖P^{((k))}‖ ≤ 2^{deg P} ‖P‖` ((6.16)). Unit tests: `‖(X − 1)^2‖ = 4`; `‖1‖ = 1`; for `X − 2 ∈ ℂ[X]`
the sup norm is `2` and `‖X − 2‖ = 3`; `‖(X + 1)(X − 1)‖ = 2 < 4 = ‖X + 1‖ ‖X − 1‖` (only
submultiplicative).

**Siegel's lemma is imported from DT.0.** Both auxiliary-polynomial constructions of this layer use Siegel's lemma with algebraic-integer coefficients and rational-integer unknowns (Evertse, Theorem 3.20), which DT.0 plans once as `DiophantineApproximationAndTranscendence:DT.0/siegel-lemma-number-field` (`DiophantineApproximation.exists_ne_zero_int_vec_abs_le_of_house_le`), together with its input, Evertse's Lemma 3.19 that an algebraic integer all of whose embeddings have real and imaginary parts at most 2/3 is zero (`DiophantineApproximationAndTranscendence:DT.0/small-integral-element-eq-zero`). For `K = ℚ` it is the integer Siegel lemma with constant `3`; it is not Mathlib's house version, whose solutions lie in `O_K`; and the condition `N > dM` is necessary (`x_1 + 2^{1/3} x_2 + 2^{2/3} x_3 = 0` has no nonzero integer solution).

### DT.1c — Thue's approximation theorem

Throughout, `α` is algebraic of degree `d`, `b ≥ 1` an integer with `bα` integral (the leading
coefficient of the primitive minimal polynomial works, `isIntegral_leadingCoeff_smul`), and
`0 < ε < 1/2`.

**Thue's auxiliary polynomials** (`DiophantineApproximation.exists_thue_auxiliary_polynomials`;
Evertse, Lemma 6.10). For every `r ≥ 1` there are `P_r, Q_r ∈ ℤ[X]`, not both `0`, of degree at
most `m = [(1/2 + ε)dr]`, with `(X − α)^r | P_r − αQ_r` and `‖P_r‖, ‖Q_r‖ ≤ C_1^r`,
`C_1 = (12 b max(1, house α))^{d(1+1/ε)}`. Proof: the divisibility is the vanishing of the divided
derivatives of orders `< r` at `α`; multiplied by `b^m` these are `r` equations with coefficients in
`O_{ℚ(α)}` of house `≤ (2b max(1, house α))^{(2+2ε)dr}` in `2m + 2 > (1 + 2ε)dr` integer
unknowns; Siegel's lemma bounds every coefficient by `(6b max(1, house α))^{d(1+1/ε) r}` and summing
at most `m + 1 ≤ 2^{dr}` coefficients bounds the ℓ¹-norms.

**Lemma 6.11** (`DiophantineApproximation.minpoly_pow_dvd_of_X_sub_C_pow_dvd`). For `F ∈ ℚ[X]` and
algebraic `β` with minimal polynomial `f`: `(X − β)^m | F` in `ℂ[X]` implies `f^m | F` (`β` is a
simple root of `f`; induct on `m`).

**Lemma 6.12** (`DiophantineApproximation.exists_hasseDeriv_eval_ne`). If `d ≥ 2`, `P_r, Q_r` are
as above, and `ξ_1, ξ_2 ∈ ℚ`, then `P_r^{((k))}(ξ_1) ≠ ξ_2 Q_r^{((k))}(ξ_1)` for some
`0 ≤ k ≤ d(2εr + 1)`. Proof through Mathlib's Wronskian `F = P_r Q_r' − P_r' Q_r`: it is nonzero
(else `Q_r` would be divisible by `f^r`, too large a degree); `F = Q_r'(P_r − αQ_r) − Q_r(P_r' − αQ_r')`
is divisible by `f^{r−1}`; if the equalities hold for `k ≤ t` then `(X − ξ_1)^t | F`; comparing
degrees gives `t ≤ d(2εr + 1) − 1`.

**Lemma 6.13** (`DiophantineApproximation.thue_remainder_bounds`). If
`P^{((k))} − αQ^{((k))} = V (X − α)^{r−k}` with `k ≤ r` and `|z − α| ≤ 1`, then
`|V(z)|, |Q^{((k))}(z)| ≤ C_2^r`, `C_2 = 2^{(1/2+ε)d}(1 + |α|)^{1+(1/2+ε)d} C_1`, from (6.13)–(6.16)
applied to the shifted polynomials.

**Thue's gap principle** (`DiophantineApproximation.thue_gap_principle`; Evertse, Theorem 6.14 and
the proof of Theorem 6.9). For `α` algebraic of degree `d ≥ 2` and `κ > d/2 + 1` there are
effectively computable `C, λ ≥ 1` such that if `ξ_1` solves `|ξ − α| ≤ H(ξ)^{−κ}` with
`H(ξ_1) ≥ C`, every other solution has `H(ξ) ≤ H(ξ_1)^λ`. One takes
`ε = (κ − 1 − d/2)/((2κ + 2)d)`, `C = max(e, (2C_2)^{2/(εd)})`, `λ = 1 + 2(1 + κd)/(dε)`. Proof:
with `r = ⌊log H(ξ_2)/log H(ξ_1)⌋` the integers
`A_{r,k} = y_1^{[(1/2+ε)dr]} y_2 (P_r^{((k))}(ξ_1) − ξ_2 Q_r^{((k))}(ξ_1))` are not all zero for
`k ≤ d(2εr + 1)` (Lemma 6.12; these `k` are `≤ r`), while (6.20) and Lemma 6.13 give
`|A_{r,k}| ≤ 2C_2^r H(ξ_1)^{−εdr/2} < 1`.

**Thue's approximation theorem** (`DiophantineApproximation.thue_approximation`; Evertse,
Theorem 6.9). For a real algebraic `α` of degree `d ≥ 3` and `κ > d/2 + 1`, only finitely many
`ξ ∈ ℚ` satisfy `|ξ − α| ≤ H(ξ)^{−κ}`: otherwise Northcott supplies a solution of height `≥ C` and
another of height `> H^λ`, contradicting the gap principle. Acceptance: `d = 3` gives every
`κ > 5/2`; the method needs two solutions of very different heights and is ineffective; Thue's
proof does not use Liouville's inequality.

### DT.1d — Divided partial derivatives and the index

**Divided partial derivatives** (`MvPolynomial.hasseDeriv`). For a commutative semiring `R` and
`d ∈ ℕ^(σ)`, the `R`-linear map `∂^d` with `∂^d x^m = (∏_j binom(m_j, d_j)) x^{m−d}` (zero if some
`d_j > m_j`). API: `hasseDeriv_monomial`, `hasseDeriv_zero` (`∂^0 = id`),
`factorial_smul_hasseDeriv_single` (`k! ∂^{k e_i} = (∂/∂x_i)^k`, Mathlib's `pderiv`),
`hasseDeriv_eq_zero_of_degreeOf_lt`, `degreeOf_hasseDeriv_le`; lemmas with their own declarations:
the coefficient formula `coeff_hasseDeriv`
(`coeff_m ∂^d P = ∏_j binom(m_j + d_j, d_j) · coeff_{m+d} P`), the Leibniz rule `hasseDeriv_mul`
(`∂^d(PQ) = ∑_{a+b=d} ∂^a P ∂^b Q`), the composition rule `hasseDeriv_hasseDeriv`
(`∂^a ∂^b = ∏_j binom(a_j + b_j, a_j) ∂^{a+b}`), `map_hasseDeriv` (commutes with coefficient ring
maps, so integer polynomials have integer derivatives), `hasseDeriv_single_toMvPolynomial`
(agreement with Mathlib's one-variable Hasse derivative), the **Taylor expansion**
`eval_add_eq_finsum_hasseDeriv` (`P(a + y) = ∑_d (∂^d P)(a) y^d`), and the coefficient bounds
`abv_coeff_hasseDeriv_le` (`v(coeff_m ∂^d P) ≤ 2^{|m+d|} v(coeff_{m+d} P)` for any absolute value)
and `abv_coeff_hasseDeriv_le_of_isNonarchimedean` (factor `1` for nonarchimedean `v`). Unit tests:
`∂^{(2,0)}(x_0^3 x_1) = 3x_0 x_1` over `ℤ`; `∂^d 1 = 0` for `d ≠ 0`; `∂^{(2)} x_0^2 = 1` while
`(∂/∂x_0)^2 x_0^2 = 2`; `∂^{e_1}` of `X^2` placed in `x_1` is `2X` placed in `x_1`.

**The index** (`MvPolynomial.weightedIndex`; Pottmeyer, Definition 2.6.2). For weights `r`, a point
`a` and `P`: `Ind_{a,r}(P) = min{∑_j i_j/r_j : (∂^i P)(a) ≠ 0} ∈ [0, ∞]`, with `Ind(0) = ∞`. API:
`weightedIndex_zero`, `weightedIndex_eq_zero_iff` (`= 0` iff `P(a) ≠ 0`, for positive weights),
`weightedIndex_ne_top` (finite for `P ≠ 0` and positive weights), `weightedIndex_map` (invariance
under injective ring maps). Lemmas with their own declarations: `le_weightedIndex_iff`
(`t ≤ Ind` iff `∂^i P(a) = 0` whenever `∑ i_j/r_j < t`); `weightedIndex_le_sum_degreeOf`
(`Ind ≤ ∑ deg_{x_j} P / r_j`, hence `Ind ≤ n` under `deg_{x_j} P ≤ r_j`); **additivity**
`weightedIndex_mul` over an integral domain (Pottmeyer, Exercise 2.19: the lowest-weight parts of the
Taylor expansions multiply); the **ultrametric inequality** `min_weightedIndex_le_weightedIndex_add`
(Exercise 3.6); **differentiation** `weightedIndex_le_weightedIndex_hasseDeriv_add`
(`Ind(P) ≤ Ind(∂^d P) + ∑ d_j/r_j`, characteristic 0); `weightedIndex_rename` (absent variables are
invisible); `weightedIndex_smul_weights` (`Ind_{a, c r} = Ind_{a,r}/c`); `weightedIndex_toMvPolynomial`
(in one variable, `Ind = ord_{a_i}(p)/r_i`). Unit tests: `Ind_{(0,0),(3,3)}(x_0^3 − x_1^2) = 2/3`;
`Ind(1) = 0`; `Ind_{(0,0),(1,2)}(x_0 x_1) = 3/2` (weighted, not the total order `2`);
`Ind_{β,r}((x − β)^m) = m/r`.

### DT.1e — Heights of polynomials and Gelfond's lemma

**Height of a multivariate polynomial** (`MvPolynomial.logHeight`) and **of a one-variable
polynomial** (`Polynomial.logHeight`): Mathlib's `Finsupp.logHeight` of the coefficient function,
relative to the field. API: `logHeight_nonneg`, `logHeight_zero`, `logHeight_C_mul` (projectivity,
Pottmeyer's Lemma 3.2.2), `logHeight_C`, `logHeight_rename`, `logHeight_eq_of_numberField` (the
place-by-place formula with infinite-place multiplicities), `Polynomial.logHeight_X_sub_C`
(`h(X − β) = logHeight₁ β`), and the comparison `Polynomial.logHeight_toMvPolynomial` (the height of
`p` placed in a variable is `h(p)`). Lemmas: `logHeight_mul_of_disjoint_vars`
(`h(PQ) = h(P) + h(Q)` for disjoint variables, from Mathlib's `mulHeight_fun_mul_eq`; Pottmeyer,
Exercise 3.3) and `logHeight_map_intCast_le` (for `P ∈ ℤ[x]`, `h(P) ≤ log max |coeff P|`). Unit
tests (over `ℚ`): `h(2x_0 + 4) = log 2`; `h(5) = 0`; `h(x_0 − q) = logHeight₁ q`;
`h(2x_0 + 2) = 0`; `h(X − 2) = log 2`; `h(7) = 0`; `h(X^2 − 1/4) = log 4`; `h(X − 1/2) = log 2`.

**Gelfond's lemma in one variable** (`Polynomial.logHeight_add_logHeight_le`; Pottmeyer,
Proposition 3.2.12). For a number field `K` and nonzero `f, g ∈ K[X]`:
`h(f) + h(g) ≤ h(fg) + [K : ℚ] deg(fg) log 2`. At finite places Gauss's lemma
(`Polynomial.gaussNorm_mul`) gives equality; at an infinite place, through its complex embedding,
`|f| |g| ≤ 2^{deg(fg)} |fg|` for complex polynomials (`Polynomial.supNorm_mul_supNorm_le`, from
Mathlib's Mahler-measure bounds and the two binomial estimates
`choose_half_mul_choose_half_le` — `binom(a, ⌊a/2⌋) binom(b, ⌊b/2⌋) ≤ binom(a + b, ⌊(a + b)/2⌋)` — and
`choose_half_mul_sqrt_le_two_pow` — `binom(d, ⌊d/2⌋) √(d + 1) ≤ 2^d`). Only the one-variable case
is needed, so the multivariable Mahler measure of Pottmeyer's §3.2 is not part of this layer.

**Roth's lemma in one variable** (`Polynomial.rootMultiplicity_mul_logHeight₁_le`; Pottmeyer,
Lemma 3.4.3). For `P ∈ K[X] \ {0}`, `r ≥ deg P`, `β ∈ K`:
`ord_β(P) h(β) ≤ h(P) + [K : ℚ] r log 2`; with `r h(β) ≥ σ^{−1}(h(P) + 4r[K : ℚ])` this gives
`Ind_{β,r}(P) ≤ σ`.

### DT.1f — Wronskians

**The Wronskian of one-variable polynomials** (`Polynomial.hasseWronskian`):
`W(g_1, …, g_m) = det(g_l^{((k))})`, with divided derivatives (Pottmeyer, Remark 3.3.6). API:
`hasseWronskian_fin_two` (`W(a, b)` is Mathlib's `wronskian a b`), `hasseWronskian_fin_zero`,
`hasseWronskian_fin_one`, `prod_factorial_mul_hasseWronskian` (`(∏ k!) W` is the classical
Wronskian of Definition 3.3.1), `hasseWronskian_eq_zero_of_not_linearIndependent`,
`hasseWronskian_comp_perm`, `hasseWronskian_map`. Unit tests: `W(1, X, X^2) = 1`; `W(X, 2X) = 0`;
`W(1, X) = 1`; the classical Wronskian of `(1, X, X^2)` is `2`.

**The Wronskian criterion** (`Polynomial.linearIndependent_iff_hasseWronskian_ne_zero`; Pottmeyer,
Proposition 3.3.3). Over a field of characteristic `0`, `g_1, …, g_m` are linearly independent iff
`W(g) ≠ 0`. Proof of the hard direction by induction: a column relation over `K(X)` normalised by
`c_m = 1`, differentiated, gives a relation among the first `m − 1` columns, so all `c_l' = 0` and
`c_l ∈ K`. Characteristic `0` is essential (`W(1, X^p) = 0` over `𝔽_p`).

**Generalized Wronskians** (`MvPolynomial.genWronskian`; Definition 3.3.5):
`W_D(f) = det(∂^{D_k} f_l)`; `D` is admissible when `|D_k| ≤ k` (rows numbered from `0`), a
hypothesis of the theorems. API: `genWronskian_eq_zero_of_not_linearIndependent`,
`genWronskian_fin_zero`, `genWronskian_fin_one`, `map_genWronskian`,
`genWronskian_single_toMvPolynomial` (with `D_k = k e_i` and one-variable entries it is the
one-variable Wronskian); lemma `degreeOf_genWronskian_le` (`deg_{x_i} W_D ≤ m N` if all
`deg_{x_i} f_l ≤ N`; (3.16)). Unit tests: `W_{(0, e_0)}(x_0, x_1) = −x_1`; the empty generalized
Wronskian is `1`; `W_D(x_0, x_0) = 0`; `W_{(0, e_0)}(1, x_0) = 1`.

**The generalized Wronskian criterion** (`MvPolynomial.linearIndependent_iff_exists_genWronskian_ne_zero`;
Theorem 3.3.7). Over a field of characteristic `0`, `f_1, …, f_m ∈ K[x_1..x_n]` are independent iff
some admissible `W_D(f) ≠ 0`. Proof by Kronecker substitution `φ(f) = f(t, t^B, …, t^{B^{n−1}})`,
`B` larger than all partial degrees: `φ` preserves independence
(`MvPolynomial.linearIndependent_aeval_kronecker_iff`, Exercise 3.5(a)); the `k`-th derivative of
`φ(f)` is a `K[t]`-combination of the `φ(∂^d f)` with `|d| ≤ k`, with coefficients independent of
`f` (`MvPolynomial.exists_iterate_derivative_aeval_kronecker`, Exercise 3.5(b)); so the Wronskian of
the `φ(f_l)` is a combination of the `φ(W_D(f))`.

**Separation of a variable** (`MvPolynomial.exists_sum_mul_linearIndependent`; Lemma 3.3.8).
`P ≠ 0` is `∑_{k=0}^{s} f_k g_k` with `s ≤ deg_{x_{i_0}} P`, the `f_k` independent and free of
`x_{i_0}`, the `g_k` independent in `x_{i_0}` alone (choose `s` minimal). **The factorisation**
(`MvPolynomial.genWronskian_mul_genWronskian`; Lemma 3.3.9):
`W_D(f) W_{(0, e_{i_0}, …, s e_{i_0})}(g) = det(∂^{D_k + l e_{i_0}} P)` when `D_k` avoids `i_0`
(the determinant of a product, with the Leibniz rule for separated variables).

**Coefficients of products** (`MvPolynomial.abv_coeff_prod_le`; Remark 3.2.11). For an absolute
value `v` on an integral domain: `v(coeff_m ∏ f_k) ≤ 2^{∑_j deg_{x_j} ∏ f_k} ∏_k max v(coeff f_k)`
(count the decompositions of `m`).

**Height of a determinant of derivatives** (`MvPolynomial.logHeight_det_hasseDeriv_le`; §3.4.6).
For `P ∈ K[x_1..x_n]` and any `m × m` matrix of derivatives `∂^{E_{k,l}} P`:
`h(det) ≤ m h(P) + [K : ℚ](2m (∑_j deg_{x_j} P) log 2 + log m!)` (Leibniz formula, the two
coefficient bounds, the product bound, `m!` terms). Under Roth's-lemma hypothesis (ii) and
`s ≤ r_n` this gives (3.19): `h(W) ≤ (s + 1)(h(P) + 4r_1[K : ℚ])`.

### DT.1g — Roth's lemma

**Truncated sums** (`DiophantineApproximation.sum_max_sub_div_ge`; Lemma 3.4.8):
`∑_{i=0}^{k} max(δ − i/k, 0) ≥ (k + 1) min(δ/2, δ^2/2)`.

**Roth's lemma** (`DiophantineApproximation.roth_lemma`; Pottmeyer, Theorem 3.4.1). Let `K` be a
number field, `n ≥ 1`, `P ∈ K[x_1..x_n] \ {0}`, `β ∈ K^n`, `0 < σ ≤ 1/2`, and positive integers
`r_1..r_n` with
(i) `deg_{x_i} P ≤ r_i`; (ii) `r_{i+1} ≤ σ r_i`; (iii) `r_i h(β_i) ≥ σ^{−1}(h(P) + 4n r_1[K : ℚ])`.
Then `Ind_{β,r}(P) ≤ 2n σ^{1/2^{n−1}}`. Proof by induction on `n`: the case `n = 1` is the
one-variable lemma; for `n ≥ 2` separate `x_n`, take a nonzero admissible `U = W_D(f)` and
`V = W(g)`, so `W = UV = det(∂^{D_k + l e_n} P)`; the height bound and the disjoint-variables
product formula give hypothesis (iii) for `U` and `V` with weights `(s + 1)r`; the induction
hypothesis and the one-variable lemma bound `Ind(W) = Ind(U) + Ind(V)` from above by
`2(s + 1)(n − 1)σ^{1/2^{n−2}} + (s + 1)σ`; expanding the determinant, the ultrametric inequality,
additivity and the derivative bound give `Ind(W) ≥ (s + 1) min(Ind(P)/2, Ind(P)^2/2) − (s + 1)σ`;
comparing and using `Ind(P) ≤ n` gives the claim.

### DT.1h — The auxiliary polynomial and Roth's theorem

**Few small lattice points** (`DiophantineApproximation.card_filter_sum_div_le`; Lemma 2.6.4). The
number of `d ∈ ∏{0..r_i}` with `∑ d_i/r_i ≤ (n/2)(1 − ε)` is at most `∏(r_i + 1) e^{−ε^2 n/4}`
(an exponential-moment bound with `e^t ≤ 1 + t + t^2` for `|t| ≤ 1`).

**Roth's auxiliary polynomial** (`DiophantineApproximation.exists_roth_auxiliary_polynomial`;
Theorem 2.6.5). For `α` algebraic of degree `d`, `0 < ε < 1` and `n` with `e^{ε^2 n/4} ≥ 2d`, there
is `C ≥ 1` depending only on `α` (`C = 12 b max(1, house α)` works) such that for every positive
`r ∈ ℕ^n` some `P ∈ ℤ[x_1..x_n] \ {0}` has `deg_{x_i} P ≤ r_i`,
`Ind_{(α,…,α), r}(P) ≥ (n/2)(1 − ε)` and all coefficients `≤ C^{r_1+…+r_n}`. Proof: at most
`N/(2d)` vanishing conditions in `N = ∏(r_i + 1)` unknowns, cleared of denominators by `b^{|r|}`, and
Siegel's lemma of DT.1b (the source's height form of Siegel's lemma only changes `C`).

**The inequality chain over `ℚ`.** Fix `κ > 2`; choose `ε ∈ (0, 1/12)` with `κ(1/2 − 3ε) > 1`, `n`
with `e^{ε^2 n/4} ≥ 2d`, `σ = (5ε/4)^{2^{n−1}}`, `M = 2σ^{−1}`, `C_1 = max(log C, log 2)`,
`C_2 = 4C_1 + 2 log 2 + 2 log max(1, |α|)`, and `L ≥ σ^{−1}((5/2)C_1 + 5n)` so large that
`1 + C_2/(nL) < κ(1/2 − 3ε)`. The steps, each a declaration:
`exists_rapidly_increasing_heights` (an infinite set of rationals contains `β_1..β_n` with
`h(β_1) ≥ L`, `h(β_{i+1}) ≥ M h(β_i)`: Northcott); `roth_weights_spec` (for `D ≥ 5h(β_n)` the
weights `r_i = ⌊D/h(β_i)⌋` are positive, `∑ r_i ≤ 2D/L`, `r_{i+1} ≤ σ r_i`, and hypothesis (iii) of
Roth's lemma holds for every polynomial of height `≤ C_1 ∑ r_i`); `exists_hasseDeriv_eval_ne_zero`
(Lemma 3.5.7: from `Ind_β(P) ≤ (5/2)nε`, a derivative `Q = ∂^d P ∈ ℤ[x]` with
`Ind_α(Q) ≥ (1/2 − 3ε)n`, `Q(β) ≠ 0` and `log |coeff Q| ≤ 4C_1 D/L`);
`log_abs_eval_le` (Taylor expansion at `(α, …, α)`: if `|β_i − α| ≤ H(β_i)^{−κ}` and
`r_i h(β_i) ≥ D' ≥ 0` then
`log |Q(β)| ≤ log max |coeff Q| + (∑ r_i)(log 2 + log max(1, |α|)) + 2∑ log(r_i + 1) − κD'(1/2 − 3ε)n`);
`neg_sum_log_den_le_log_abs_eval` (`log |Q(β)| ≥ −∑ r_i log den(β_i)`, the product formula over
`ℚ`).

**Roth's theorem** (`DiophantineApproximation.roth`). For a real algebraic irrational `α` and
`κ > 2`, only finitely many `ξ ∈ ℚ` satisfy `|α − ξ| ≤ H(ξ)^{−κ}`. The proof gives no bound for
the solutions. Proof: with the parameters above, the two bounds combine to
`κ(D − h(β_n))(1/2 − 3ε)n ≤ nD + C_2 D/L + 2n log(D + 1)`; dividing by `nD` and letting `D → ∞`
(the `β_i` fixed) gives `κ(1/2 − 3ε) ≤ 1 + C_2/(nL)`, contradicting the choice of `L`. This is the
proof of Pottmeyer, §3.5, for `K = ℚ` and the archimedean place; it does not use the Subspace
Theorem (Evertse's Corollary 7.2 deduces the same statement from it).

### DT.1i — Consequences

- **Lower-bound form** (`DiophantineApproximation.roth_lower_bound`; Evertse, Theorem 6.2): for real
  algebraic irrational `α` and `κ > 2` there is `c > 0` with `|ξ − α| ≥ c H(ξ)^{−κ}` for all
  `ξ ∈ ℚ` (Exercise 6.1: the finitely many exceptions fix `c`).
- **All algebraic numbers** (`DiophantineApproximation.roth_lower_bound_of_isAlgebraic`): for `α ∈ ℂ`
  algebraic, `|ξ − α| ≥ c H(ξ)^{−κ}` for `ξ ≠ α`, using Liouville for rational `α` and
  `|ξ − α| ≥ |Im α|` for non-real `α`.
- **Mathlib's vocabulary** (`DiophantineApproximation.not_liouvilleWith_of_isAlgebraic`): a real
  algebraic number is not `LiouvilleWith p` for any `p > 2`; with Dirichlet's theorem of DT.0 the
  irrationality exponent of a real algebraic irrational is `2`.
- **Transcendence** (`DiophantineApproximation.transcendental_tsum_inv_pow_three_pow`; Evertse,
  Exercise 6.5): `∑_{k ≥ 1} b^{−3^k}` is transcendental for `b ≥ 2` (partial sums approximate to
  exponent `3`; this number is not a Liouville number, so Roth is genuinely needed).
- **Factorisation of square-free binary forms** (`DiophantineApproximation.exists_linear_factorisation`):
  a square-free form over `ℂ` not divisible by `Y` is `a_0 ∏(X − α_i Y)` with distinct `α_i`.
- **Square-free binary forms** (`DiophantineApproximation.binary_form_lower_bound`; Evertse,
  Theorem 6.3): for `F ∈ ℤ[X, Y]` square-free of degree `d ≥ 3` and `κ > 2`,
  `|F(x, y)| ≥ c(F, κ) max(|x|, |y|)^{d−κ}` whenever `F(x, y) ≠ 0`.
- **The square-free part** (`DiophantineApproximation.exists_squarefree_dvd`): if `F(X, 1)` has at
  least three distinct roots, a square-free form of degree `≥ 3` divides `F` in `ℤ[X, Y]`.
- **Thue's theorem on Thue equations** (`DiophantineApproximation.thue_equation_finite`; Evertse,
  Corollary 6.4): if `F(X, 1)` has at least three distinct roots and `m ≠ 0`, then `F(x, y) = m` has
  finitely many integer solutions; the proof is ineffective, and effective bounds are
  DiophantineApproximationAndTranscendence:DT.4's `DT.4/thue-equation-effective-bound`.

### Dependencies

Within the roadmap: DiophantineApproximationAndTranscendence:DT.0 for the Mahler measure of an
algebraic number (`DT.0/mahler-measure-of-algebraic-number`), used by Liouville's inequality.
Everything else rests on the pinned Mathlib declarations named above. Consumers:
DiophantineApproximationAndTranscendence:DT.2 (the atlas edge DT.1 → DT.2; the Subspace Theorem
extends Roth's theorem, and Evertse's Corollary 7.2 recovers Roth's statement from it) and
DiophantineApproximationAndTranscendence:DT.4 (the binary-form bound (6.2) in Fel'dman's deduction;
the ineffective Thue theorem is the statement DT.4 makes effective).

### Acceptance tests

- Liouville in degree 1 reproduces `|a/b − x/y| ≥ 1/(by)` up to the height normalisation, and the
  explicit constant is admissible in Mathlib's `Liouville.exists_pos_real_of_irrational_root`.
- Siegel's lemma over `ℚ` has constant `3`; `x_1 + 2^{1/3}x_2 + 2^{2/3}x_3 = 0` has no nonzero
  integer solution.
- Thue for `d = 3` admits every `κ > 5/2`, for `d = 4` every `κ > 3`; Roth admits every `κ > 2`,
  which is optimal by Dirichlet.
- `Ind_{(0,0),(3,3)}(x_0^3 − x_1^2) = 2/3`; `Ind_{(0,0),(1,2)}(x_0 x_1) = 3/2`.
- `W(1, X, X^2) = 1` with divided derivatives and `2` classically.
- `∑_{k≥1} 2^{−3^k}` is transcendental; `x^3 − 2y^3 = 1` has finitely many integer solutions, and
  `x^2 − 2y^2 = 1` (only two roots) has infinitely many.
- Roth's theorem is stated for algebraic irrational `α` and every `κ = 2 + ε > 2`, and its
  finiteness conclusion provides no list of solutions.

### Mistakes in the sources

Recorded in the packet (`sourceIssues`) with corrections; the nodes use the corrected statements.
In Evertse, Chapter 6: the identity for `F` in the proof of Lemma 6.12 has `P_r` and `Q_r` swapped;
Lemma 6.12 proves `k ≤ d(2εr + 1)` but is used with `<`; the proof of Theorem 6.9 does not check
`k ≤ r`, which (6.20) needs (it follows from (6.21)); Theorem 6.14 is stated for every degree
although its proof needs `α ∉ ℚ`; the proof of Lemma 6.10 bounds the coefficients but asserts a
bound for the ℓ¹-norm; the proof of Corollary 6.4 writes `f` for `f*`; the proof of Theorem 6.3
invokes Theorem 6.2 for roots of degree `≤ 2`. In Pottmeyer: index misprints in Lemmas 3.2.7 and
3.3.9 and in (3.35), (3.40) and the last display of Lemma 3.5.7; "left" for "right" in the proof
of Lemma 3.2.8; the archimedean factor before (3.21) should be `2^{(s+1)(r_1+…+r_n)}` (the final
bound is unchanged); the application of Lemma 3.4.8 omits a monotonicity step; the proof of
Proposition 3.3.3 is only sketched; the equations (2.36) should be indexed by the box; and in the
conclusion of §3.5, `L` must be fixed before the approximations are chosen.

## DT.2 — Subspace theorem and S-unit equations

This layer builds W. M. Schmidt's Subspace Theorem and H. P. Schlickewei's p-adic extension, with
the exceptional subspaces as part of every conclusion, and derives from them the classical
applications: Roth's theorem in its Subspace form, small values of linear forms in algebraic
numbers, approximation by algebraic numbers of bounded degree, norm form equations (Schmidt's
theorem), the Thue–Mahler equation, the S-unit equation in any field of characteristic 0 (with the
uniform bound of Evertse–Schlickewei–Schmidt) and the Skolem–Mahler–Lech theorem for simple
recurrences. It also builds the proof of the Subspace Theorem along the route of
Evertse–Ferretti: twisted heights, their successive infima, heights of subspaces, the exceptional
subspace and filtration of a pair (L, c), the semistable interval result, the general interval
result and the Parametric Subspace Theorem. Finiteness and effectivity are kept apart throughout:
every theorem says which of its objects are computable (the exceptional subspace T(L, c) of
Evertse–Ferretti, Vojta's subspaces) and which are not (the subspaces of the Subspace Theorem, the
intervals of the interval result, the finitely many remaining solutions).

Sources: J.-H. Evertse, *Diophantine Approximation*, Leiden lecture notes (2019), Chapters 7 and 8
(the statements and the proofs of all applications); J.-H. Evertse and R. G. Ferretti, *A further
improvement of the Quantitative Subspace Theorem*, arXiv:1008.2340 (Ann. of Math. 177 (2013)) (the
proof of the Subspace Theorem); J.-H. Evertse and H. P. Schlickewei, *A quantitative version of the
Absolute Subspace Theorem* (J. reine angew. Math. 548 (2002); author preprint), §21 (Mahler's
reduction to systems) and §§6, 7, 9 (inputs of Evertse–Ferretti); J.-H. Evertse, H. P. Schlickewei
and W. M. Schmidt, *Linear equations in variables which lie in a multiplicative group*,
arXiv:math/0409604 (Ann. of Math. 155 (2002)) (the S-unit theorem over fields of characteristic 0);
J.-H. Evertse, *An improvement of the quantitative Subspace theorem* (Compositio 101 (1996)) and *An
explicit version of Faltings' Product Theorem and an improvement of Roth's lemma* (Acta Arith. 73
(1995)), author preprints (the non-vanishing input). Schmidt's Lecture Notes in Mathematics 785 and
his 1972 Annals paper on norm form equations are not publicly available; Schmidt's own public
quantitative paper (Compositio 69 (1989)) refers back to LNM 785 for most arguments, so the proofs
here follow Evertse–Ferretti.

### Conventions

- **Linear forms** in X_1, …, X_n over a field F are coefficient vectors α ∈ F^n, evaluated by
  Mathlib's `dotProduct`: L(x) = α · x. A family (L_i)_{i ∈ ι} is **in general position** if every
  n of them are linearly independent (for #ι = n: linear independence).
- **Integer points** x ∈ ℤ^n carry the maximum norm ‖x‖ = max_i |x_i| (Mathlib's sup norm on
  `Fin n → ℤ`). A **proper subspace** of ℚ^n is a `Submodule ℚ (Fin n → ℚ)` different from ⊤, and
  x ∈ ℤ^n lies in V when its image in ℚ^n does. The zero vector solves every homogeneous inequality
  and lies in every subspace.
- **Heights.** For ξ = x/y ∈ ℚ in lowest terms, H(ξ) = max(|x|, |y|), which is Mathlib's
  `Height.mulHeight₁` on ℚ (`Rat.mulHeight₁_eq_max`). For algebraic ξ of higher degree, Theorem 7.8
  uses the naive height of DT.0 (maximum absolute value of the coefficients of the primitive minimal
  polynomial), not the absolute Weil height. In the proof of the Subspace Theorem all heights are
  absolute: H(x) = ∏_v max_i ‖x_i‖_v over the places of any number field containing the
  coordinates. The separate height H₂ used for subspaces, sharp Roth and hyperplane-grid
  non-vanishing uses Euclidean norms at infinite places and maximum norms at finite places.
  Evertse 1996 writes this height as H; it is not the max-norm H above. Over ℚ, H₂(1,1) = √2
  whereas the max-norm height is 1.
- **Absolute values.** On ℚ, |·|_∞ is the ordinary absolute value and |·|_p the p-adic one with
  |p|_p = p⁻¹ (Mathlib `padicNorm`, `Rat.AbsoluteValue.padic`). A **continuation** of |·|_p to a
  number field K is an `AbsoluteValue K ℝ` restricting to |·|_p on ℚ (Evertse's notation (8.4)).
  The **normalised absolute values** of Evertse–Ferretti are ‖x‖_w = |σ_w(x)|^{[K_w:ℝ]/[K:ℚ]} at
  infinite places and the extension of |·|_p^{[K_v:ℚ_p]/[K:ℚ]} at v | p; in Mathlib terms
  ‖x‖_w = w(x)^{mult(w)/[K:ℚ]} for `InfinitePlace` and ‖x‖_v = v(x)^{1/[K:ℚ]} for `FinitePlace`
  (normalised by the absolute norm). They satisfy the product formula (`NumberField.prod_abs_eq_one`).
- **Non-degenerate solutions.** A solution of α_1x_1 + ⋯ + α_nx_n = 1 is non-degenerate if no
  non-empty subsum vanishes; a solution of α_0x_0 + ⋯ + α_nx_n = 0 is non-degenerate if no proper
  non-empty subsum vanishes.
- **Recurrences** are Mathlib's `LinearRecurrence ℂ`; Evertse's u_h = c_1u_{h−1} + ⋯ + c_ku_{h−k}
  (c_k ≠ 0) is the recurrence with coefficients c_{k−i} and characteristic polynomial
  `LinearRecurrence.charPoly`. "θ is a root of unity" is `IsOfFinOrder θ`.
- **Twisted data** (Evertse–Ferretti (2.4)–(2.10)): L = (L_i^{(v)})_{v ∈ M_K, 1≤i≤n} with each
  {L_1^{(v)}, …, L_n^{(v)}} linearly independent and finitely many distinct forms; reals c_{iv},
  almost all 0, with Σ_i c_{iv} = 0 and Σ_v max_i c_{iv} ≤ 1; 0 < δ ≤ 1; R at least the number of
  distinct forms. Δ_L := ∏_v ‖det(L^{(v)})‖_v and H_L := ∏_v max ‖det(L_{i_1}, …, L_{i_n})‖_v.

### What Mathlib already provides (consume)

Absolute values and places of number fields (`AbsoluteValue`, `NumberField.InfinitePlace`,
`NumberField.FinitePlace`, `InfinitePlace.mult`), the product formula (`NumberField.prod_abs_eq_one`),
heights (`Height.mulHeight`, `Height.mulHeight₁`, `Rat.mulHeight_eq_max_abs_of_gcd_eq_one`, Northcott
`NumberField.finite_setOfPred_mulHeight₁_le`), p-adic numbers and a p-adic algebraic closure with
its norm (`padicNorm`, `PadicAlgCl`, `PadicAlgCl.norm_extends`), embeddings into algebraically closed
fields (`IsAlgClosed.lift`) and uniqueness of spectral norms (`spectralNorm_unique_field_norm_ext`),
Dirichlet's approximation theorem (`Real.infinite_rat_abs_sub_lt_one_div_den_sq_of_irrational`),
Dirichlet's unit theorem (`NumberField.Units.rank`, `NumberField.Units.finrank_eq`), norms and
discriminants (`Algebra.norm_eq_prod_embeddings`, `Algebra.norm_norm`, `NumberField.isUnit_iff_norm`,
`Algebra.discr_not_zero_of_basis`), Galois actions on roots (`Polynomial.Gal.galActionHom`), the
Nullstellensatz (`MvPolynomial.vanishingIdeal_zeroLocus_eq_radical`), Hoeffding's inequality
(`ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc`,
`ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun`), Gram–Schmidt
(`InnerProductSpace.gramSchmidt`), finitely generated subgroups (`Subgroup.FG`) and linear
recurrences (`LinearRecurrence`, `LinearRecurrence.charPoly`). Mathlib has no Subspace Theorem, no
Roth theorem for algebraic numbers, no twisted heights, no heights of subspaces, no Hadamard
inequality and no finiteness theorem for unit equations.

### Dependencies

- `DiophantineApproximationAndTranscendence:DT.1` (the stage edge; Roth's theorem there is the
  statement that `roth-from-subspace-theorem` re-proves in more generality) and
  `DiophantineApproximationAndTranscendence:DT.0` (the naive height of an algebraic number,
  `DT.0/naive-height-of-algebraic-number`, used by Theorem 7.8).
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1`: Minkowski's linear forms theorem (Evertse
  Corollary 2.6), used for the sharpness Lemma 7.6, and successive minima with Minkowski's second
  theorem (Evertse Theorem 2.9), the classical case under the absolute Minkowski theorem for
  twisted heights. Heights of subspaces are built here; for rational subspaces they agree with the
  covolume of T ∩ ℤ^n (`GeometryOfNumbersAndQuadraticArithmetic:GN.0`).
- `ClassicalArithmeticCompletion:CA.2`: the closed form u_h = Σ g_i(h)θ_i^h of complex linear
  recurrences (Evertse Theorem 8.17), at least for simple roots.
- Consumer: `HeightsRationalPointsAndObstructions:RP.4` (Siegel's theorem on integral points) uses
  `s-unit-equation-finiteness` and the Subspace Theorem. The effective counterparts (Baker's method
  for unit and Thue–Mahler equations) are DT.3–DT.4; certified enumeration is
  `EffectiveDiophantineMethods:ED.2`.

### 2A. Linear forms and absolute values

- **`InGeneralPosition L`** (definition, `linear-forms-in-general-position`). API:
  `InGeneralPosition.linearIndependent`, `inGeneralPosition_iff_det_ne_zero` (every n × n minor of
  distinct rows is non-zero), `inGeneralPosition_iff_linearIndependent` (#ι = n),
  `inGeneralPosition_two_iff` (two variables: pairwise non-proportional), `.comp_injective`,
  `.smul` (non-zero rescaling), `.map` (along a field homomorphism, for Galois transport),
  `.comp_matrix` (invertible change of variables), `inGeneralPosition_coords_add_sum`
  (X_1, …, X_n, X_1 + ⋯ + X_n). Unit tests: X, Y, X + Y is in general position; a repeated form
  is not; X_1, X_2, X_1 + X_2, X_3 is pairwise independent but not in general position; the
  coordinate forms; the three forms of Evertse (7.5) (determinant 4√6).
- **Lemma (Evertse 7.5, 8.9)** `sup-norm-bounded-by-independent-forms`: for any absolute value
  |·|_* on F and independent M_1, …, M_n there is C' with max_k |x_k|_* ≤ C' max_j |M_j(x)|_*
  (C' = max(1, max_k Σ_j |β_{kj}|_*) for the inverse matrix (β_{kj})).
- **Hadamard's inequality** `hadamard-inequality`: |det(a_1, …, a_n)| ≤ ∏‖a_j‖_2 on ℂ^n, via
  Gram–Schmidt.
- **Continuations** `absolute-value-continuation-exists`: every number field carries continuations
  of |·|_p and |·|_∞ (x ↦ ‖τ(x)‖ for τ : K → `PadicAlgCl p`, x ↦ |σ(x)| for σ : K → ℂ; Evertse's
  prime-ideal construction, Lemma 8.5, gives the same). `absolute-value-extends-to-algebraic-closure`:
  every continuation is of this form and extends to Q̄ (Evertse's "Fact", pp. 158 and 161).
- **Lemma 8.11** `rational-s-unit-product-criterion`: u = ±∏p_j^{w_j} iff |u|∏_j|u|_{p_j} = 1; for
  non-zero integers the product is ≥ 1.

### 2B. The Subspace Theorem and its forms

- **Theorem 7.1 (Schmidt)** `subspace-theorem-and-its-exceptional-subspaces`. For n ≥ 2, n linearly
  independent linear forms L_1, …, L_n with algebraic complex coefficients, C > 0 and δ > 0, all
  x ∈ ℤ^n with |L_1(x) ⋯ L_n(x)| ≤ C‖x‖^{−δ} lie in finitely many proper subspaces of ℚ^n. Proved
  as the case s = 0 of Theorem 8.7. The conclusion is not finiteness (if some L_i vanishes at a
  non-zero integer point, all its multiples are solutions: `vanishing-form-gives-infinitely-many-solutions`),
  and the proof does not determine the subspaces.
- **Theorem 7.4** `subspace-theorem-general-position`: for r ≥ n forms in general position,
  |L_1(x) ⋯ L_r(x)| ≤ C‖x‖^{r−n−δ} has its solutions in finitely many proper subspaces; equivalent
  to 7.1 (order the |L_i(x)|, apply Lemma 7.5 to the r − n largest).
- **Theorem 8.7 (Schlickewei)** `p-adic-subspace-theorem`. Notation (8.4): K a number field, primes
  p_1, …, p_s (s ≥ 0), continuations |·|_p to K for p ∈ {∞, p_1, …, p_s}; for each p linearly
  independent L_{1,p}, …, L_{n,p} with coefficients in K; ε > 0, C > 0. Then the solutions x ∈ ℤ^n of
  ∏_p |L_{1,p}(x) ⋯ L_{n,p}(x)|_p ≤ C‖x‖^{−ε} lie in finitely many proper subspaces of ℚ^n. Proof:
  reduce to primitive x; extend the continuations to Q̄; for primitive x, ‖x‖_p = 1 at every prime and
  H(x) = ‖x‖; the solutions with a vanishing form lie in the kernels; the others satisfy one of
  finitely many systems (`product-inequality-reduces-to-systems`), to each of which the absolute
  Subspace Theorem for systems applies over the base field ℚ.
- **Mahler's reduction** `product-inequality-reduces-to-systems` (Evertse–Schlickewei §21): with
  A_{ip} = n·max(1, max_j |α_{ij}^{(p)}|_p), there are B and finitely many exponent tuples d_{ip} ≤ 0
  with Σ d_{ip} = −n − ε/2 such that every primitive solution with ‖x‖ ≥ B and no vanishing form
  satisfies |L_{i,p}(x)|_p ≤ A_{ip}‖x‖_p‖x‖^{d_{ip}} for one tuple. The grid lemma (their Lemma 21.1)
  is proved directly: round y/Σy down to a mesh 1/M with M ≥ q/(1 − γ) and rescale.
- **Theorem 8.8** `p-adic-subspace-theorem-general-position`: r_p ≥ n forms in general position at
  each place, primitive x, right side C‖x‖^{r_∞ − n − ε}.
- **Theorem 7.14 (Vojta)** `vojta-effective-exceptional-subspaces`: for forms in general position
  there is a finite, effectively computable collection U_1, …, U_s of proper subspaces, depending
  only on the forms, outside which |L_1(x) ⋯ L_r(x)| ≤ C‖x‖^{r−n−δ} has finitely many solutions for
  every C, δ; derived from Evertse–Ferretti Theorem 3.3.

### 2C. Consequences in Evertse, Chapter 7

- **Corollary 7.2** `roth-from-subspace-theorem`: for α ∈ Q̄ ⊂ ℂ (any algebraic number), C > 0,
  κ > 2: finitely many ξ ∈ ℚ with |ξ − α| ≤ C·H(ξ)^{−κ} (multiply by y², apply 7.1 to Y and
  X − αY). For real α of degree ≥ 3 and C = 1 this is `DT.1/roth-theorem`; it remains ineffective.
- **Lemma 7.3** `two-form-strict-inequality-finite`: for two forms, 0 < |L_1(x)L_2(x)| ≤ C‖x‖^{−δ}
  has finitely many solutions.
- **Example (7.5)** `exceptional-subspace-example-three-forms`: for 0 < δ < 1 the strict inequality
  0 < |(x_1 + √2x_2 + √3x_3)(x_1 − √2x_2 + √3x_3)(x_1 − √2x_2 − √3x_3)| ≤ ‖x‖^{−δ} has
  infinitely many solutions with x_3 = 0 (from Dirichlet's theorem for √2): the exceptional
  subspaces are necessary for n ≥ 3.
- **Lemma 7.6** `linear-form-dirichlet-exponent`: for α_1, …, α_n ∈ ℝ linearly independent over ℚ,
  |α · x| ≤ C‖x‖^{1−n} has infinitely many solutions (Minkowski's linear forms theorem from GN.1;
  the infinitude uses the independence).
- **Theorem 7.7** `single-linear-form-inequality-finite`: for algebraic α_i, 0 < |α · x| ≤
  C‖x‖^{1−n−δ} has finitely many solutions (induction on n through 7.1).
- **Theorem 7.8** `approximation-by-algebraic-numbers-of-bounded-degree`: for α ∈ Q̄, C > 0 and
  κ > d + 1, only finitely many algebraic ξ of degree ≤ d satisfy |ξ − α| ≤ C·H(ξ)^{−κ}, H the
  naive height (the mean value inequality bounds |F(α)| ≤ C'‖x‖|ξ − α| for the primitive minimal
  polynomial F of ξ; then 7.7 with n = d + 1).

### 2D. Norm form equations

- **Lemma 7.10** `embedding-vectors-linearly-independent`: ℚ-independent α_1, …, α_n ∈ K give
  ℂ-independent vectors (σ_1(α_i), …, σ_d(α_i)) (the embedding matrix of a basis has square
  determinant equal to the non-zero discriminant).
- **Lemma 7.11** `norm-form-linear-factors-general-position`: if K = ℚ(θ) has degree d and the Galois
  group of the normal closure acts on the conjugates of θ as S_d (`Polynomial.Gal.galActionHom`
  surjective), the d conjugate forms σ_i(α_1)X_1 + ⋯ + σ_i(α_n)X_n are in general position.
- **Theorem 7.9** `norm-form-equation-finite-full-symmetric-group`: under the S_d hypothesis and
  n < d, N_{K/ℚ}(α_1x_1 + ⋯ + α_nx_n) = c has finitely many solutions x ∈ ℤ^n for every c ∈ ℚ
  (Theorem 7.4 with r = d, then induction on n on each exceptional subspace).
- `unit-group-infinite-criterion`: O_L^* is infinite iff L ≠ ℚ and L is not imaginary quadratic.
- **Theorem 7.13 (Schmidt)**: for M = ℤα_1 + ⋯ + ℤα_n (α_i ℚ-independent), (i) no µ ∈ K^* and
  subfield L ≠ ℚ, not imaginary quadratic, have µO_L ⊆ M, is equivalent to (ii) for every c ∈ ℚ^*,
  N_{K/ℚ}(ξ) = c has finitely many solutions ξ ∈ M. The direction (ii) ⇒ (i) is
  `degenerate-module-norm-form-infinitely-many-solutions` (ξ = µε², ε ∈ O_L^*); the direction
  (i) ⇒ (ii) is `schmidt-norm-form-theorem`, deduced from the Subspace Theorem by analysing the
  exceptional subspaces through the subfields of K. Acceptance example: K = ℚ(⁶√2),
  M = ⁶√2·ℤ[∛2] contains ⁶√2(1 − ∛2)^k for all k ∈ ℤ, all of norm −2.

### 2E. p-adic applications

- **Theorem 8.6 (Ridout)** `p-adic-roth-theorem`: ∏_p |α_p − ξ|_p ≤ C·H(ξ)^{−κ} (κ > 2) has finitely
  many solutions ξ ∈ ℚ. Example: |α − p^u/y| ≤ C·max(p^u, |y|)^{−1−ε} has finitely many solutions.
- `squarefree-binary-form-linear-factors`: a square-free binary form of degree n factors over Q̄
  into n pairwise independent linear forms.
- **Theorem 8.10 (Mahler)** `thue-mahler-finiteness`: for a square-free binary form F ∈ ℤ[X, Y] of
  degree n ≥ 3 and primes p_1, …, p_s, |F(x, y)| = p_1^{z_1} ⋯ p_s^{z_s} with gcd(x, y) = 1 has
  finitely many solutions (Theorem 8.8 with the linear factors of F and 0 < ε < n − 2). This proof is
  ineffective; the effective proof via linear forms in logarithms belongs to DT.4.
- **Theorem 8.12 over ℚ (Lang)** `two-term-unit-equation-over-rationals`: ax + by = 1 in a finitely
  generated Γ ⊂ ℚ^* has finitely many solutions (reduce to the Thue–Mahler equation for XY(X + Y)).

### 2F. S-unit equations

- **`IsNondegenerateSolution α x`** (definition, `nondegenerate-solution`). API: `.sum_eq_one`,
  `.subsum_ne_zero`, `.ne_zero`, `.map` (along a ring homomorphism keeping the subsums non-zero),
  `isNondegenerateSolution_of_subsingleton`, `.restrict` (complement of a minimal vanishing subsum).
  Unit tests: (1/2, 1/2) for x + y = 1; (2, 2, 1) for x − y + z = 1 is degenerate; one unknown; the
  two-unknown characterisation.
- **`IsNondegenerateHomogeneousSolution α x`** (definition, `nondegenerate-homogeneous-solution`).
  API: `.sum_eq_zero`, `.smul`, `isNondegenerateHomogeneousSolution_iff_cons` (α_0 = −1, x_0 = 1),
  `.merge` (substituting x_p = βx_q), `.ne_zero`. Unit tests: (1, 1, 2) for x + y − z = 0;
  (1, 1, 1, 1) for x − y + z − w = 0 is degenerate; two unknowns; the correspondence with the
  inhomogeneous equation.
- **Lemma 8.15** `homogeneous-unit-equation-subspace-cover`: for α_i ∈ ℚ^* and Γ ⊂ ℚ^* finitely
  generated, all solutions of α_0x_0 + ⋯ + α_nx_n = 0 in Γ lie in finitely many proper subspaces of
  the hyperplane H (Theorem 8.8 applied to Y_1, …, Y_n, Y_1 + ⋯ + Y_n; the prime set must contain the
  primes of α_0).
- **Lemma 8.16** `homogeneous-unit-equation-ratio-lemma` and **Theorem 8.14**
  `nondegenerate-solutions-have-finitely-many-ratios`: some ratio, and for non-degenerate solutions
  every ratio x_i/x_j, lies in a finite set.
- **Theorem 8.13 over ℚ** `s-unit-equation-over-rationals`: finitely many non-degenerate solutions of
  α_1x_1 + ⋯ + α_nx_n = 1 in Γ ⊂ ℚ^*.
- **Specialisation (ESS Lemma 3.1)** `specialization-to-algebraic-numbers`: for finitely many
  elements U of an algebraically closed field of characteristic 0 there is a Q̄-algebra homomorphism
  Q̄[U] → Q̄ (Nullstellensatz).
- **ESS Theorem 2.1** `unit-equation-subspace-bound-algebraic`: for Γ ⊂ (Q̄^*)^n of finite rank r, the
  solutions of y_1 + ⋯ + y_n = 1 of the form y = x ∗ z (x ∈ Γ, h(z) ≤ n^{−1}exp(−(4n)^{3n})(1 + h(x)))
  lie in at most exp((5n)^{3n}(r + 1)) proper subspaces; proved in ESS §§6–12 from the special case
  of the Parametric Subspace Theorem with forms X_1, …, X_n, X_1 + ⋯ + X_n.
- **ESS Theorem 1.1** `uniform-bound-nondegenerate-solutions`: in any field of characteristic 0, for
  Γ ⊂ (K^*)^n of rank r, a_1x_1 + ⋯ + a_nx_n = 1 has at most exp((6n)^{3n}(r + 1)) non-degenerate
  solutions in Γ (specialisation to Q̄, then induction on n over the subspaces of Theorem 2.1).
- **Theorem 8.13 (van der Poorten–Schlickewei, Evertse, Laurent)** `s-unit-equation-finiteness`:
  for K of characteristic 0, Γ ⊂ K^* finitely generated and α_i ∈ K^*, (8.14) has finitely many
  non-degenerate solutions in Γ^n; for n = 2 this is Lang's theorem, ax + by = 1 has finitely many
  solutions in Γ.

### 2G. Linear recurrences

- **`LinearRecurrence.IsNondegenerate E`** (definition, `nondegenerate-linear-recurrence`): the
  characteristic polynomial has non-zero constant term and no quotient of two distinct roots is a
  root of unity. API: `.root_ne_zero`, `.not_isOfFinOrder_div`, `isNondegenerate_iff_pow`
  (θ^N ≠ θ'^N for N ≥ 1), `.of_dvd` (passage to the minimal recurrence),
  `isNondegenerate_of_order_le_one`. Unit tests: Fibonacci is non-degenerate; u_{h+2} = −u_h
  (roots ±i) is not; u_{h+1} = 2u_h; the double root u_{h+2} = 2u_{h+1} − u_h is non-degenerate.
- **Skolem–Mahler–Lech, simple roots** `skolem-mahler-lech-simple-roots`: if θ_1, …, θ_m ∈ ℂ^* have no
  quotient θ_i/θ_j (i ≠ j) a root of unity and g_1, …, g_m ∈ ℂ are not all 0, then
  Σ g_iθ_i^h = 0 for only finitely many h ≥ 0; equivalently a non-zero solution of a non-degenerate
  recurrence with simple characteristic roots has finitely many zeros (Theorem 8.13 with Γ generated
  by the θ_i/θ_m; induction on m for vanishing subsums). Acceptance: u_h = 2^h + 3^h − 5^h vanishes
  only at h = 1; u_h = i^h + (−i)^h vanishes at every odd h.
- **ESS Theorem 1.2** `uniform-bound-zeros-simple-recurrence`: the zero set of a simple recurrence
  of order n ≥ 3 over an algebraically closed field of characteristic 0 is a union of at most
  exp((6n)^{3n}) points and arithmetic progressions, and has at most exp((6n)^{3n}) elements when the
  recurrence is non-degenerate.

### 2H. The proof of the Subspace Theorem (Evertse–Ferretti)

Definitions, each with its API and unit tests:

- **Twisted height** `twistedHeight` (`twisted-height`): H_{L,c,Q}(x) = ∏_v max_i ‖L_i^{(v)}(x)‖_v Q^{−c_{iv}}
  for x ∈ K^n ∖ {0}, H(0) = 0, extended to Q̄^n through finite extensions with c_{iw} = d(w|v)c_{iv}.
  Supporting data: `Place`, `normAbs` (normalised absolute values), `coordForms`, `deltaL` (Δ_L),
  `IsTwistedData` ((2.4)–(2.9)). API: `twistedHeight_zero`, `twistedHeight_pos`,
  `twistedHeight_smul` (projective), `twistedHeight_coords_zero` (c = 0 and coordinate forms give the
  absolute height (`Height.mulHeight`)^{1/[K:ℚ]}), `twistedHeight_shift` (EF Lemma 7.2),
  `twistedHeight_comp` (EF Lemma 7.3), `twistedHeight_one`. Galois invariance (EF Lemma 4.1) is part
  of the absolute definition. Unit tests: over ℚ with c_∞ = (1/2, −1/2), H_Q(1, 0) = Q^{−1/2};
  Q = 1 makes c irrelevant; for primitive integer x and c = 0 the value is max|x_i|; H(2x) = H(x).
- **Successive infima** `successiveInfimum`, `infimumSpace` (`successive-infima-of-twisted-height`):
  λ_i(Q) = inf{λ : dim span{x : H_{L,c,Q}(x) ≤ λ} ≥ i} over Q̄^n, T_i(Q) = ∩_{λ>λ_i(Q)} span{…}.
  API: `successiveInfimum_mono`, `successiveInfimum_nonneg`, `finrank_infimumSpace_of_lt` (EF
  Lemma 9.1), `successiveInfimum_coords_zero`. Unit tests: coordinate forms with c = 0 give all
  λ_i = 1; λ_0 = 0; the example above has λ_1 = Q^{−1/2}, λ_2 = Q^{1/2}; these differ for Q > 1.
- **Height of a subspace** `subspaceHeight` (`height-of-linear-subspace`), with `height2` (H_2 of a
  vector: Euclidean at infinite places, maximum at finite places) and `plucker` (the p × p minors
  in lexicographic order): H_2(T) = H_2(x_1 ∧ ⋯ ∧ x_p) for any basis, H_2({0}) = H_2(Q̄^n) = 1. API:
  `dotOrthogonal`, `subspaceHeight_bot`, `subspaceHeight_top`, `subspaceHeight_span_singleton`,
  `subspaceHeight_le_prod` ((6.11)), `subspaceHeight_orthogonal` (H_2(T^⊥) = H_2(T)),
  `subspaceHeight_inf_mul_sup_le` (Struppeck–Vaaler), `one_le_subspaceHeight`,
  `finite_subspaceHeight_le` (Northcott for subspaces), `subspaceHeight_rat_eq_covolume`
  (compatibility with GN.0). Unit tests: H_2(ℚ(1, 1)) = √2 = H_2(ℚ(2, 2)); H_2 of {0} and of the
  whole space is 1; coordinate planes have height 1; the hyperplane orthogonal to (1, 2, 2) has
  height 3.
- **Weights and the exceptional subspace** `localWeight`, `weight`, `weightRatio`,
  `exists_exceptionalSubspace`, `exceptionalSubspace` (`weight-and-exceptional-subspace`):
  w_v(U) = min{c_{i_1v} + ⋯ + c_{i_kv} : the restrictions of L_{i_1}^{(v)}, …, L_{i_k}^{(v)} to U are
  independent}, w(U) = Σ_v w_v(U); T(L, c) is the unique proper subspace maximising
  (w(U) − w(Q̄^n))/(n − dim U) (= w(U)/(n − dim U) under (2.8)) of minimal dimension; it is defined
  over K; (L, c) is semistable iff T(L, c) = {0} iff w(U) ≤ 0 for all proper U. API: `weight_bot`,
  `weight_top`, `weight_inf_add_weight_sup` (supermodularity, EF Lemma 15.1),
  `exceptionalSubspace_ne_top`, `exceptionalSubspace_spec`, `exceptionalSubspace_eq_bot_iff`,
  `exceptionalSubspace_shift`, `exceptionalSubspace_comp`, `exceptionalSubspace_coords_sum` (EF Lemma
  15.3). Unit tests: c = 0 gives T = {0}; over ℚ with c_∞ = (−1, 1), T = ℚe_2, with weights −1 on
  ℚ(1, 1) and 1 on ℚe_2; with c_∞ = (−1, 0, 1), T = span{e_2, e_3} although span{e_3} has the same
  weight.
- **Filtration** `twistedFiltration` (`twisted-height-filtration`, EF Lemma 15.4): the unique chain
  {0} = T_0 ⊊ ⋯ ⊊ T_r = Q̄^n whose points (dim T_l, w(T_l)) are the vertices of the upper convex hull
  of all (dim U, w(U)); T_{r−1} = T(L, c). API: `twistedFiltration_head`, `twistedFiltration_last`,
  `twistedFiltration_chain`, `twistedFiltration_penultimate`, `twistedFiltration_vertices`,
  `twistedFiltration_slope_antitone`. Unit tests: c = 0 gives [{0}, Q̄^n]; the example gives
  [{0}, ℚe_2, ℚ²]; at most n + 1 terms; not a complete flag in general.

Theorems, in the order of the proof:

- `absolute-minkowski-for-twisted-heights` (EF Proposition 9.2): n^{−n/2}Δ_L Q^{−α} ≤ λ_1(Q) ⋯ λ_n(Q)
  ≤ 2^{n(n−1)/2}Δ_L Q^{−α}, α = Σ_v Σ_i c_{iv} (Roy–Thunder's absolute Minkowski theorem, via
  Evertse–Schlickewei Corollary 7.2).
- `twisted-height-gap-principle` (EF Proposition 4.2): for A ≥ n^{1/δ} one proper subspace defined over
  K contains {x : H_{L,c,Q}(x) ≤ Δ_L^{1/n}Q^{−δ}} for all Q ∈ [A, A^{1+δ/2}) (Hadamard's inequality and
  the product formula).
- `davenport-lemma-for-twisted-heights` (EF Lemma 11.3), `sharp-roths-lemma` (Evertse 1995 Theorem 3:
  a multihomogeneous F of degrees d_1 ≫ ⋯ ≫ d_m has index < mΘ under its explicit H₂-height bound),
  `nonvanishing-on-grids` (EF Proposition 12.1 = Evertse 1996 Lemma 26), `bombieri-vaaler-siegel-lemma`
  (EF Lemma 13.1: H_2(x) ≤ V^{1/2}C_K(∏H_2(L_i))^{1/(V−U)}), `auxiliary-polynomial-for-twisted-heights`
  (EF Proposition 13.6, the Faltings–Wüstholz auxiliary polynomial built with Hoeffding's inequality).
- `interval-result-semistable-case` (EF Theorem 8.1): under (8.1)–(8.9), with
  m_2 = [61n^6 2^{2n}δ^{−2}log(22n²2^nR/δ)], ω_2 = m_2^{5/2}, C_2 = (2H_L)^{m_2^{2m_2}}, every Q ≥ 1
  with {x : H_{L,c,Q}(x) ≤ Q^{−δ}} ≠ {0} lies in [1, C_2) ∪ ∪_{h ≤ m_2}[Q_h, Q_h^{ω_2}).
- `limit-of-successive-infima` (EF Theorem 16.1): for large Q, λ_i(Q) = Q^{−µ(T_l,T_{l−1}) + o(1)} on
  the l-th block of the filtration and T_{d_l}(Q) = T_l.
- `height-bound-for-filtration-subspaces` (EF Proposition 17.5): H_2(T_i) ≤ (max H_2(L_i^{(v)}))^{4^n};
  hence T(L, c) is effectively computable.
- `interval-result` (EF Theorem 2.3): outside T(L, c), Q lies in [1, C_0) ∪ ∪_{h ≤ m_0}[Q_h, Q_h^{ω_0})
  with m_0 = [10^5 2^{2n}n^{10}δ^{−2}log(3δ^{−1}R)], ω_0 = δ^{−1}log 3R, C_0 = max(H_L^{1/R}, n^{1/δ}).
- `parametric-subspace-theorem` (EF Theorem 2.1): at most
  10^6 2^{2n}n^{10}δ^{−3}log(3δ^{−1}R)log(δ^{−1}log 3R) proper subspaces, defined over K, one of which
  contains {x : H_{L,c,Q}(x) ≤ Δ_L^{1/n}Q^{−δ}} for each Q ≥ C_0; the special case EF Theorem 1.1
  (forms among X_1, …, X_n, X_1 + ⋯ + X_n) is what the S-unit bound uses.
- `twisted-height-of-system-solutions` (EF Lemma 5.1), `absolute-subspace-theorem-for-systems` (EF
  Theorem 3.1: the solutions of the system (3.7) with H(x) ≥ max((H^*)^{1/3RD}, n^{n/ε}) lie in at most
  10^9 2^{2n}n^{14}ε^{−3}log(3ε^{−1}RD)log(ε^{−1}log 3RD) proper subspaces defined over K) and
  `faltings-wustholz-interval-refinement` (EF Theorem 3.3: an effectively computable proper subspace
  T outside which the solutions have bounded height).


### Rectangular-grid non-vanishing

Evertse's [1996 author preprint](https://pub.math.leidenuniv.nl/~evertsejh/95-subspace.pdf),
§7, Lemma 25 (p. 67), and the [published version](https://www.numdam.org/item/CM_1996__101_3_225_0.pdf),
p. 294, supply a small but essential part of the hyperplane-grid argument. A polynomial can
vanish at every point of a small integer grid; a suitably bounded derivative cannot do so
at every point. The reusable form works over a characteristic-zero integral domain R and
uses DT.1's divided derivatives, not a second derivative or grid structure.

The five lemma nodes below belong to DT.2. Their prerequisite leaves are the DT.1 Hasse-derivative
nodes and Mathlib's root multiplicity, root multiset, floors and polynomial equivalences.
Mathlib already supplies `Polynomial.hasseDeriv`,
`Polynomial.lt_rootMultiplicity_iff_isRoot_iterate_derivative`,
`Polynomial.count_roots`, `Polynomial.card_roots'` and `MvPolynomial.finSuccEquiv`.
They are consumed, not re-planned.

#### The degree capacity of a floored integer grid

`grid-floor-capacity` · API `DiophantineApproximation.grid_floor_capacity`.

For s ∈ ℕ and B > 0 real, put a = ⌊B⌋ and b = ⌊s/B⌋. Then s < (2a + 1)(b + 1). These are nonnegative integer floors; the result includes s = 0 and 0 < B < 1.

s ∈ ℕ; B > 0. B need not be integral or at least 1.

If B < 1 then a = 0 and B ≤ 2a + 1. If B ≥ 1 then a ≥ 1 and B < a + 1 ≤ 2a + 1.

The floor bound gives s/B < b + 1. Multiplication by B > 0 gives s < B(b + 1) ≤ (2a + 1)(b + 1).

Thus multiplicity b + 1 at 2a + 1 distinct points exceeds degree s. The source's printed factor 2b + 1 is not the degree of its displayed product; see E215.

Checks: s = 3, B = 1 gives capacity 12, not the printed 21. s = 0, B = 1/2 gives capacity 1.

#### A nonzero univariate jet at a bounded integer point

`univariate-integer-grid-jet` · API `Polynomial.exists_int_grid_hasseDeriv_ne_zero`.

Let R be a characteristic-zero integral domain, 0 ≠ P ∈ R[X], natDegree P ≤ s with s ∈ ℕ, and B > 0 real. There exist z ∈ ℤ and i ∈ ℕ with |z| ≤ B, i ≤ s/B and (DⁱP)(z) ≠ 0. Here Dⁱ is Mathlib's univariate Hasse derivative and z is cast into R.

R is a commutative integral domain of characteristic zero, not necessarily a field. P ≠ 0 and natDegree P ≤ s; equality is not required. B > 0; the point bound is in ℤ before casting to R.

Set a = ⌊B⌋ and b = ⌊s/B⌋. If the conclusion fails, all Hasse derivatives through order b vanish at every integer from −a to a. Floor bounds put these points and orders within the allowed box.

Multiply by i! to get vanishing of ordinary iterated derivatives through b. Polynomial.lt_rootMultiplicity_iff_isRoot_iterate_derivative gives multiplicity at least b + 1 at each point.

The 2a + 1 integer images are distinct by characteristic zero. Polynomial.count_roots identifies their multiplicities with counts in the root multiset. The disjoint sum of these counts is at least (2a + 1)(b + 1). No comaximality of linear factors over R is asserted.

Polynomial.card_roots' bounds the multiset cardinality by natDegree P ≤ s. Apply grid-floor-capacity for a contradiction. This argument works over domains, so induction needs no rational-function field.

Checks: A nonzero constant uses z = 0 and i = 0. The derivative budget is s/B, not s/(2B).

#### Divided derivatives and partial evaluation of one coordinate

`partial-specialization-jet` · API `MvPolynomial.hasseDeriv_partial_specialization`.

For a commutative semiring R, P ∈ R[X₀,…,Xₙ], a ∈ R, k ∈ ℕ and residual multi-index d ∈ ℕⁿ, let ev₀,a set X₀ = a and retain the other variables. Then Dᵈ(ev₀,a(D^{k e₀}P)) = ev₀,a(D^{(k,d)}P).

R is a commutative semiring; no characteristic-zero assumption is needed. Residual variables use Fin n and their original coordinates use Fin.succ. The full multi-index (k,d) is Finsupp.cons k d.

Expand P as a finite sum of monomials c X₀ʲ X_tail^u. Both sides are additive and R-linear.

For j ≥ k and u ≥ d componentwise, both sides equal c·binom(j,k)·∏ₗbinom(uₗ,dₗ)·a^{j−k}·X_tail^{u−d}. If a derivative order exceeds a corresponding degree, both sides vanish.

First-coordinate and residual derivative supports are disjoint, so the composition binomial factor equals 1. No factorial is introduced.

Checks: For P = X₀²X₁³, a = 2, k = 1, d = 2, both sides are 12X₁. Above the X₀-degree both sides vanish, including at a = 0.

#### A bounded partial specialization with nonzero residual polynomial

`nonzero-partial-grid-specialization` · API `MvPolynomial.exists_int_partial_grid_jet`.

Let R be a characteristic-zero integral domain, 0 ≠ P ∈ R[X₀,…,Xₙ], deg_{X₀}P ≤ s and B > 0. There exist z ∈ ℤ and k ∈ ℕ with |z| ≤ B and k ≤ s/B such that Q = ev₀,z(D^{k e₀}P) is nonzero and deg_{Xⱼ}Q ≤ deg_{X_{j+1}}P for every residual coordinate j.

R is a commutative integral domain of characteristic zero; s ∈ ℕ. P ≠ 0 and B > 0; homogeneity is not required. The remaining coordinate-degree bounds must survive the choice of point and derivative.

Use MvPolynomial.finSuccEquiv to regard P as f ∈ (R[X₁,…,Xₙ])[X₀]. The algebra equivalence preserves nonzeroness, and natDegree_finSuccEquiv identifies its degree with deg_{X₀}P.

The residual polynomial ring is again a characteristic-zero integral domain. Apply univariate-integer-grid-jet to f, giving z and k with the required bounds and nonzero Polynomial.eval (C z) (Polynomial.hasseDeriv k f).

Use finSuccEquiv_coeff_coeff and the Hasse coefficient formula on monomials to identify this expression with Q = Σ_{j≥k} binom(j,k) z^{j−k} f.coeff j, a finite sum with scalar coefficients.

By degreeOf_coeff_finSuccEquiv each coefficient has residual degrees bounded by those of P. Multiplication by a scalar does not increase a coordinate degree; degreeOf_sum_le supplies the bounds on Q needed for induction.

Checks: For P = (X₀³−X₀)X₁² and B = 1, all allowed value specializations vanish; z = 0 and k = 1 leave −X₁². Absent variables retain degree zero. The statement includes no residual variables.

#### Non-vanishing of a divided derivative on a rectangular integer grid

`rectangular-integer-grid-jet` · API `MvPolynomial.exists_rectangular_int_grid_jet`.

Let R be a characteristic-zero integral domain, 0 ≠ P ∈ R[X₁,…,Xₙ], sⱼ ∈ ℕ with deg_{Xⱼ}P ≤ sⱼ and real Bⱼ > 0. There exist zⱼ ∈ ℤ and a nonnegative multi-index d such that |zⱼ| ≤ Bⱼ and dⱼ ≤ sⱼ/Bⱼ for every j, and DᵈP(z) ≠ 0. Constants and n = 0 are included.

R is a commutative integral domain of characteristic zero; P ≠ 0. Every coordinate has its own positive real budget and natural degree upper bound. No homogeneity, positive degree, or bound Bⱼ ≥ 1 is assumed.

Induct on the number of variables. In zero variables P is a nonzero constant; the unique empty point and zero multi-index give nonzero evaluation.

For n+1 variables apply nonzero-partial-grid-specialization to coordinate 0 with s₀ and B₀. It gives z₀, k and nonzero Q with residual degrees bounded by the tail of s.

Apply induction to Q and the tail budgets, obtaining z_tail and d_tail with nonzero residual jet and all tail inequalities.

Use z = (z₀,z_tail) and d = (k,d_tail). partial-specialization-jet followed by tail evaluation identifies the nonzero residual jet with DᵈP(z). The first-coordinate inequalities together with the tail inequalities give all bounds.

Over a characteristic-zero field, multiply by the nonzero product ∏ⱼdⱼ! to recover the ordinary-derivative statement of Evertse's Lemma 25.

Checks: Budgets N/ε and degree bounds r_h give d_{hj} ≤ r_h ε/N, exactly the input to Evertse's Lemma 26. A nonzero jet need not occur at a nonzero point. EF Proposition 12.1's nonzero block points require a separate conversion.

#### Discriminating examples

These tests also occur in the suggested file:

- `Polynomial.test_grid_values_insufficient`: Over ℚ, X(X−1)(X+1) vanishes on the entire B = 1 grid, but its order-one Hasse derivative at 0 is −1. A value-only conclusion is false.
- `Polynomial.test_grid_radius_below_one`: For X³ and B = 1/2, the only point is 0. Orders 0,1,2 vanish, but the order-three Hasse derivative is 1 and 3 ≤ 3/(1/2).
- `Polynomial.test_grid_characteristic_two`: Over 𝔽₂, X²−X is nonzero but vanishes at every integer image. With s = 2 and B = 3, the only allowed order is 0. Characteristic zero cannot be omitted.
- `MvPolynomial.test_grid_zero_variables`: For nonzero c ∈ ℚ the zero-order derivative of C c in zero variables evaluates to c.
- `MvPolynomial.test_grid_mixed_jet`: For P = (X₀³−X₀)X₁², budgets (1,1/2) and degree bounds (3,2), z = (0,0), d = (1,2) satisfy all bounds and DᵈP(z) = −1. Every order-zero grid value is zero.

### Block-linear jets and nonzero block points

The algebraic portion of Evertse's Lemma 26 uses the full block degree, not the
maximum of the degrees in the separate variables. Its source is §7, preprint p. 68
and published pp. 295–296 of the two versions linked above. The explicit
coefficient formula and support arguments below expand that proof. The
nonzero-block replacement supplies the additional conclusion required by
Evertse–Ferretti Proposition 12.1; it is not presented as a separate printed
lemma of Evertse.

Write X_hl for N variables in each of m blocks, Y_ha for r parameters per block,
and L_hl(Y)=Σ_a A_hla Y_ha. The notation D^j means the existing DT.1 Hasse
derivative. For positive d_h, write w_d(j)=Σ_h(Σ_l j_hl)/d_h, with division in
the reals. No new derivative, grid, weight or homogeneity carrier is introduced.
The support condition for block degree d_h is the existing
`MvPolynomial.IsWeightedHomogeneous` condition with the h-th block-indicator
weight; it is written explicitly to match the inherited parent theorem.

Seven polynomial lemmas belong to DT.1, beside its existing derivative and
index API. The weight budget, grid replacement and conditional witness belong
to DT.2. The conditional witness depends on an actual nonzero polynomial
restriction and does not replace the height-theoretic proof of Lemma 24.

#### Block degrees in a linear substitution

`DT.1/block-linear-monomial-support` · API `MvPolynomial.block_sum_eq_of_coeff_linear_monomial_ne_zero`.

Let R be a commutative semiring, m,N,r natural numbers, A_h an N-by-r matrix, e an X-multiindex and k a Y-multiindex. Set L_hl(T)=Σ_a A_hla T_ha and c_e,k=[T^k]∏_hl L_hl(T)^e_hl. If c_e,k ≠ 0, then Σ_a k_ha=Σ_l e_hl for every block h.

Zero block counts, zero matrices and r=0 are allowed; no rank or characteristic assumption.

Use the existing weighted-homogeneous predicate with block-indicator weights w_h(h′,a)=1 when h=h′ and 0 otherwise.

Each L_h′l is a sum of scalar multiples of variables of weight w_h(h′,a). The pinned weighted-homogeneous sum, scalar, power and product lemmas give weight Σ_l e_hl for the displayed product.

A nonzero coefficient has that weight by the defining support property. Cancellation can delete coefficients, but cannot introduce a different block degree.

For a fixed k, every e with these equalities satisfies e_hl ≤ Σ_a k_ha; the corresponding finite coordinate box, filtered by the equalities, is exactly E(k). Finsupp's finite interval instance represents this set without introducing a new carrier.

Dependencies: `mathlib:MvPolynomial.IsWeightedHomogeneous`, `mathlib:MvPolynomial.isWeightedHomogeneous_X`, `mathlib:MvPolynomial.IsWeightedHomogeneous.C_mul`, `mathlib:MvPolynomial.IsWeightedHomogeneous.sum`, `mathlib:MvPolynomial.IsWeightedHomogeneous.pow`, `mathlib:MvPolynomial.IsWeightedHomogeneous.prod`, `mathlib:Finsupp.instLocallyFiniteOrder`.

Acceptance: Block degree is preserved exactly, not merely bounded above; zero rows impose no exception.

Tests:

- `MvPolynomial.test_linear_support_square`: Over ℚ, the coefficient of X₀X₁ in (X₀+X₁)² is 2.
- `MvPolynomial.test_linear_support_wrong_degree`: Over ℚ, the coefficient of X₀ in (X₀+X₁)² is zero.

#### Finite block-linear Hasse chain rule

`DT.1/block-linear-hasse-chain-rule` · API `MvPolynomial.hasseDeriv_eval₂_blockLinear`.

For R,m,N,r,A as in block-linear-monomial-support, any F∈R[X], X-multiindex i and Y-multiindex k satisfy D_Y^k((D_X^i F)(AY))=Σ_{e∈E(k)} c_e,k(A) b(i,e) (D_X^{i+e}F)(AY), as polynomials in Y. Here E(k)={e:Σ_l e_hl=Σ_a k_ha for every h}, c_e,k is the coefficient of T^k in ∏_hl(Σ_a A_hla T_ha)^e_hl, and b(i,e)=∏_hl binom(i_hl+e_hl,i_hl).

R is any commutative semiring. No injectivity, nonzero coefficient, homogeneity or positive degree is assumed.

Use the existing multivariate Taylor expansion for H=D^iF, as a polynomial identity: H(AY+AT)=Σ_e (D^eH)(AY)(AT)^e. Obtain this identity over the polynomial coefficient ring by the same monomial binomial expansion; all terms beyond the coordinate degrees vanish by the existing derivative degree bound.

Since A(Y+T)=AY+AT, extract the coefficient of T^k. On the left this is D_Y^k(H(AY)); on the right it is c_e,k(A)(D^eH)(AY). Coefficient extraction and the sum commute because the expansion is finite.

block-linear-monomial-support removes every e outside E(k). Its finite coordinate box also shows that zero summands can be added to obtain precisely the displayed finite sum.

Apply the existing Hasse composition identity, including b(i,e). Natural binomial coefficients are cast into R, so division and characteristic-zero assumptions are unnecessary.

Dependencies: `DT.1/block-linear-monomial-support`, `DT.1/multivariate-taylor-expansion`, `DT.1/multivariate-hasse-derivative-composition`, `DT.1/multivariate-hasse-derivative-coefficients`, `DT.1/multivariate-hasse-derivative`, `mathlib:MvPolynomial.eval₂_monomial`, `mathlib:MvPolynomial.eval_eval₂`.

Acceptance: The statement is an identity of polynomials, stronger than equality at integer grid points; it includes k=0 and a zero substitution matrix.

Tests:

- `MvPolynomial.test_chain_binomial_factor`: For F=X₀² over ℚ, D¹((D¹F)(2Y))=4; omitting the composition binomial coefficient would give 2.
- `MvPolynomial.test_chain_zero_map`: Substituting X↦0 into D⁰(X²+1) gives 1; its positive-order Hasse derivative is zero.

#### A nonzero original jet from a substituted jet

`DT.1/nonzero-block-linear-jet-extraction` · API `MvPolynomial.exists_nonzero_hasseDeriv_of_blockLinear`.

For R,m,N,r,A,F,i,k as above and y∈R^(mr), if D_Y^k((D_X^iF)(AY))(y)≠0, there is an X-multiindex e with Σ_l e_hl=Σ_a k_ha for each h and (D_X^{i+e}F)(Ay)≠0.

R is any commutative semiring; singular and zero matrices are allowed.

Evaluate block-linear-hasse-chain-rule at y, using the pinned evaluation-composition identity.

A nonzero finite sum has a nonzero summand. If the displayed original jet in that summand were zero, multiplication by its coefficient would make the summand zero. Thus it is nonzero, without a no-zero-divisors assumption.

Membership of the selected exponent in E(k) supplies every exact block-sum identity. This is only a one-way implication: nonzero original jets can cancel after substitution.

Dependencies: `DT.1/block-linear-hasse-chain-rule`, `mathlib:MvPolynomial.eval_eval₂`.

Acceptance: Do not infer a nonzero composed jet from a chosen nonzero original jet.

Tests:

- `MvPolynomial.test_chain_cancellation`: For F=X₀−X₁ and X₀=X₁=Y over ℚ, the composed polynomial is zero although D_(1,0)F=1 and D_(0,1)F=−1.
- `MvPolynomial.test_chain_order_zero`: For the identity substitution and F=X², the zero-order jet evaluated at 2 is 4.

#### Residual block degrees of a nonzero Hasse derivative

`DT.1/hasse-residual-block-degrees` · API `MvPolynomial.hasseDeriv_block_degrees`.

Let R be a commutative semiring and F∈R[X_hl] be block-homogeneous of natural degrees d_h, meaning every exponent μ in its support satisfies Σ_l μ_hl=d_h. If D^jF≠0, then Σ_l j_hl≤d_h for each h, and every exponent ν in the support of D^jF satisfies Σ_l ν_hl=d_h−Σ_l j_hl.

No characteristic or domain hypothesis is needed. The nonzero-derivative hypothesis is required for the order bound.

The existing coefficient formula gives coeff_ν(D^jF)=(∏_hl binom(ν_hl+j_hl,j_hl)) coeff_{ν+j}F.

A nonzero derivative coefficient therefore gives a nonzero coefficient of F at ν+j. Its block sum is d_h; distributing the natural sum gives Σ_l ν_hl+Σ_l j_hl=d_h.

Apply this to every surviving ν for residual homogeneity, and to one surviving ν (which exists by D^jF≠0) for the order bound. Subtract only after this equality; truncating subtraction alone cannot justify the order bound.

Dependencies: `DT.1/multivariate-hasse-derivative-coefficients`.

Acceptance: Use the inherited support condition, equivalently the pinned weighted-homogeneous predicate for each block indicator; no new multihomogeneous structure.

Tests:

- `MvPolynomial.test_residual_two_blocks`: For F=X_(0,0)²X_(1,0) over ℚ, D_(1,0)F=2X_(0,0)X_(1,0), of residual block degrees (1,1).
- `MvPolynomial.test_residual_zero_derivative`: D³(X²)=0 over ℚ, although 3≤2 is false; nonzero cannot be omitted from the order bound.

#### Individual degree after block-linear substitution

`DT.1/block-linear-degree-bound` · API `MvPolynomial.degreeOf_eval₂_blockLinear_le`.

Let R be a commutative semiring, F∈R[X_hl], and d_h∈ℕ. Assume Σ_l μ_hl≤d_h for every μ in the support of F and every h. For any block-linear matrix A_h of size N-by-r, each individual Y_ha-degree of F(AY) is at most d_h.

F may be zero; the block support condition is only an upper bound, not equality. A may have any rank.

Expand F as its finite sum of coefficient monomials using the pinned polynomial support-sum identity.

For a nonzero coefficient of F(AY), some monomial substitution summand has nonzero coefficient. A scalar coefficient cannot turn a zero coefficient into a nonzero one.

Apply block-linear-monomial-support to that summand: its output block sum equals the input block sum, hence is at most d_h. Each individual nonnegative exponent is bounded by that sum.

The pinned degreeOf_le_iff converts the resulting support bound to the individual degree inequality. This proof covers the zero polynomial without extracting a spurious monomial.

Dependencies: `DT.1/block-linear-monomial-support`, `mathlib:MvPolynomial.as_sum`, `mathlib:MvPolynomial.eval₂_monomial`, `mathlib:MvPolynomial.degreeOf_le_iff`.

Acceptance: The needed bound is the whole block degree, not the maximum of the separate input-variable degrees.

Tests:

- `MvPolynomial.test_substitution_merges_degrees`: Substituting X₀=X₁=Y into X₀X₁ gives Y², with individual Y-degree 2, although each original individual degree is 1.
- `MvPolynomial.test_substitution_zero_polynomial`: For the zero polynomial over ℚ, every individual degree is zero.

#### A nonzero value at a zero block forces degree zero

`DT.1/zero-block-forces-degree-zero` · API `MvPolynomial.block_degree_eq_zero_of_eval_ne_zero`.

Let R be a commutative semiring and H∈R[X_hl] have block degrees δ_h. If H(x)≠0 and x_h is the zero vector, then δ_h=0.

Block homogeneity means Σ_l μ_hl=δ_h for every exponent μ in the support. Nonzero value is an actual evaluation hypothesis.

If δ_h>0, the block sum of each supported exponent is positive, so some variable of that block occurs to positive power.

All those variables evaluate to zero at x. The pinned eval₂Hom_eq_zero lemma therefore makes every supported monomial vanish and gives H(x)=0, a contradiction.

Natural δ_h must consequently be zero; the argument also covers an empty coordinate block.

Dependencies: `mathlib:MvPolynomial.eval₂Hom_eq_zero`.

Acceptance: This is a residual-degree statement, not an inference that the original F has degree zero.

Tests:

- `MvPolynomial.test_positive_degree_zero_block`: For H=X_(0,0)² over ℚ, H evaluated at the zero block is 0.
- `MvPolynomial.test_constant_empty_block`: A constant polynomial 3 on one empty block evaluates to 3.

#### Simultaneous independence of degree-zero blocks

`DT.1/zero-degree-block-independence` · API `MvPolynomial.eval_eq_of_eq_on_nonzero_degree_blocks`.

Let R be a commutative semiring and H∈R[X_hl] have block degrees δ_h. If block vectors x,y agree on every block h with δ_h≠0, then H(x)=H(y). Thus all zero-degree blocks can be replaced simultaneously by arbitrary vectors.

The conclusion is global evaluation independence, not merely constancy at one witness.

For a supported exponent μ, a block with δ_h=0 has a sum of nonnegative exponents equal to zero; every μ_hl in that block is zero.

Every variable appearing in the support of that monomial therefore lies in a nonzero-degree block, where x and y agree.

Apply the pinned evaluation-congruence lemma to conclude equality for H. This establishes simultaneous replacement directly and avoids an unsupported iteration of pointwise independence.

Dependencies: `mathlib:MvPolynomial.eval₂_congr`.

Acceptance: Replacing any collection of zero-degree blocks at once preserves the value.

Tests:

- `MvPolynomial.test_degree_zero_block_ignored`: For H=X_(1,0)² over ℚ, H(0,2)=H(−3,2)=4.
- `MvPolynomial.test_nonhomogeneous_replacement_failure`: For H=1+X over ℚ, H(0)=1 but H(−1)=0: nonzero evaluation at zero does not imply independence without homogeneity.

#### Weighted budget for the extracted grid jet

`DT.2/block-linear-jet-weight-budget` · API `DiophantineApproximation.block_jet_weight_budget`.

Let m≥1,N≥2,d_h>0 be natural numbers and ε>0 real. Put w_d(u)=Σ_h(Σ_l u_hl)/d_h. Let X-multiindices i,e and Y-multiindex k, with N−1 parameters per block, satisfy w_d(i)<mε, Σ_l e_hl=Σ_a k_ha and k_ha≤d_h ε/N. Then w_d(i+e)<(2−1/N)mε<2mε.

All inequalities and divisions are in ℝ; d_h and N are cast before division. No rounding or ε≤1 assumption is needed.

Distribute the finite sums and use positive d_h to obtain w_d(i+e)=w_d(i)+Σ_h(Σ_a k_ha)/d_h.

Sum the N−1 coordinate bounds to get Σ_a k_ha≤(N−1)d_h ε/N. Divide by d_h and sum over m blocks.

Consequently w_d(i+e)≤w_d(i)+m(N−1)ε/N<(2−1/N)mε. Since mε/N>0, this is strictly below 2mε. These are elementary finite-sum and ordered-field calculations, requiring no new index definition.

Dependencies: elementary finite-sum and ordered-field arithmetic.

Acceptance: Preserve the initial strict inequality. A nonzero jet only bounds the weighted index weakly by its weight; strictness comes from this budget.

Tests:

- `DiophantineApproximation.test_grid_small_order_bound`: If k∈ℕ and k≤1/2 in ℝ, then k=0.
- `DiophantineApproximation.test_grid_weight_numerical`: With m=1,N=2,d=4,ε=1/2,i=0,e=k=1, the final weight is 1/4<3/4<1.

#### Nonzero block representatives preserving a grid value

`DT.2/nonzero-block-grid-replacement` · API `DiophantineApproximation.exists_nonzero_block_grid_same_eval`.

Let K be a field, b_h1,…,b_hr linearly independent vectors of K^N in each of m blocks, choose a₀∈{1,…,r}, and let B≥1. Let H∈K[X_hl] have block degrees δ_h. Suppose z_ha∈ℤ, |z_ha|≤B, and H(x)≠0 for x_h=Σ_a z_ha b_ha. There exist z′_ha∈ℤ with the same bounds such that every x′_h=Σ_a z′_ha b_ha is nonzero and H(x′)=H(x).

r is nonempty, witnessed by a₀. Linear independence suffices; no ambient subspace or spanning assertion is needed. No characteristic-zero assumption is needed for this replacement lemma.

For each block whose x_h is zero, zero-block-forces-degree-zero gives δ_h=0.

Set z′_h=z_h on nonzero blocks, and set z′_h to the integer unit vector at a₀ on zero blocks. Each coefficient remains bounded because B≥1.

LinearIndependent.ne_zero gives b_ha₀≠0, so the new x′_h is nonzero in every replaced block; unreplaced blocks were already nonzero.

On every block with δ_h≠0, x_h was nonzero and is unchanged. zero-degree-block-independence gives H(x′)=H(x) simultaneously.

Dependencies: `DT.1/zero-block-forces-degree-zero`, `DT.1/zero-degree-block-independence`, `mathlib:LinearIndependent.ne_zero`.

Acceptance: The conclusion is nonzero block vectors, not nonzero individual coordinates. Applied to H=D^jF, obtain its residual block degrees from hasse-residual-block-degrees first.

Tests:

- `DiophantineApproximation.test_all_zero_blocks_constant`: For H=1 over ℚ in two blocks of length 2, replacing both zero blocks by (1,0) preserves value 1 and makes both vectors nonzero.
- `DiophantineApproximation.test_mixed_zero_block_replacement`: For H=X_(1,0)² over ℚ at blocks (0,0) and (2,0), replacing only the first block by (1,0) preserves value 4; zero coordinates inside the nonzero vectors are allowed.

#### A nonzero-block grid jet from a nonzero restriction

`DT.2/conditional-nonzero-block-grid-jet` · API `DiophantineApproximation.exists_nonzero_block_grid_jet_of_restriction`.

Let K be a characteristic-zero field, m≥1,N≥2,d_h positive integers, and 0<ε≤1. Let F∈K[X_hl] have block degrees d_h, and for each h let b_h1,…,b_h,N−1 be linearly independent vectors of K^N. Suppose an X-multiindex i has w_d(i)<mε and the polynomial G(Y)=(D^iF)(Σ_a Y_1a b_1a,…,Σ_a Y_ma b_ma) is nonzero. There exist integers z_ha and an X-multiindex j with |z_ha|≤N/ε, every x_h=Σ_a z_ha b_ha nonzero, w_d(j)<(2−1/N)mε, and (D^jF)(x)≠0.

The nonzero composed polynomial G is an explicit input. F≠0 alone does not suffice. No height or degree-separation assumption is used at this conditional stage.

G≠0 implies D^iF≠0 since polynomial substitution maps zero to zero. hasse-residual-block-degrees gives residual degrees d_h−Σ_l i_hl≤d_h, and block-linear-degree-bound gives the individual parameter-degree bounds for G.

Reindex the m(N−1) variables by finProdFinEquiv and apply rectangular-integer-grid-jet with all budgets N/ε and degree bounds d_h. Transport evaluation, degree and the monomial Hasse coefficient formula back along the finite bijection. The resulting integer y and parameter order k satisfy |y_ha|≤N/ε and k_ha≤d_h ε/N, with a nonzero evaluated Hasse jet.

nonzero-block-linear-jet-extraction gives e with exact block sums and D^{i+e}F(Ay)≠0. Set j=i+e. block-linear-jet-weight-budget gives the strict weight bound.

Apply hasse-residual-block-degrees to the nonzero polynomial H=D^jF. Since N/ε≥1 and N−1≥1, nonzero-block-grid-replacement replaces all zero blocks while preserving the same nonzero Hasse jet and its order.

For the parent theorem, use the existing weighted-index definition to get index≤w_d(j), hence index<2mε. Over characteristic zero, the inherited factorial-to-ordinary derivative API makes this nonvanishing equivalent to the ordinary mixed-derivative form in the parent suggested signature.

Dependencies: `DT.1/hasse-residual-block-degrees`, `DT.1/block-linear-degree-bound`, `DT.1/nonzero-block-linear-jet-extraction`, `DT.1/multivariate-hasse-derivative-coefficients`, `DT.1/multivariate-hasse-derivative`, `DT.1/weighted-index-of-polynomial`, `DT.2/rectangular-integer-grid-jet`, `DT.2/block-linear-jet-weight-budget`, `DT.2/nonzero-block-grid-replacement`, `mathlib:finProdFinEquiv`.

Acceptance: This closes the purely algebraic and grid portion of Lemma 26 plus the nonzero-block conversion. It does not prove Lemma 24's hyperplane-height nonvanishing or the sharp Roth/Faltings input.

Tests:

- `DiophantineApproximation.test_conditional_line_grid_witness`: For m=1,N=2,d=2,ε=1, F=X_(0,0)² and the line basis (1,0), z=1 and j=0 give a nonzero block, value 1, and weight 0<3/2.
- `DiophantineApproximation.test_nonzero_not_nonzero_restriction`: F=X₁ is nonzero over ℚ, but restriction to the line Y↦(Y,0) is the zero polynomial. F≠0 cannot replace the nonzero-restriction hypothesis.

The characteristic-zero restriction enters at the integer-grid jet lemma and
at equivalence with ordinary derivatives. The coefficient-support, Hasse
chain-rule, residual-degree and independence lemmas work over any commutative
semiring. Grid replacement needs a field and a nonempty independent family,
but not characteristic zero. These distinctions keep the reusable algebra
separate from the arithmetic application.

The final index step uses its existing infimum definition: a nonzero jet gives
index ≤ w_d(j). For X² at 0 with weight 2, index and witness weight both equal 1.
The strict inequality in the final conclusion comes from
w_d(j)<(2−1/N)mε<2mε, not from a false strict index-to-witness inequality.

### Hyperplane-height non-vanishing

Evertse's Lemma 24 (author preprint pp. 64–67; published pp. 291–294) now has a
declaration-level reduction to `sharp-roths-lemma`. The separate proof of that
sharp Roth theorem, through the explicit Faltings Product Theorem, remains a gap.
The new reduction supplies the nonzero restriction required by the existing
conditional grid theorem, so Lemmas 24–26 share one explicit dependency chain.

Keep H₂ Euclidean at infinite places and maximum at finite places. Write
w_d(i)=Σ_hΣ_l i_hl/d_h. Every vanishing assumption is for w_d(i)<mΘ; E216's
correction is also needed at (7.11). A derivative on the boundary can be nonzero.

For the algebraic extraction use Mathlib's `MvPolynomial.sumAlgEquiv` to write
F(U,X)=Σ_e U^e Q_e(X), where U are the extra coordinates and X the two retained
coordinates in each block. Choose e of minimum total degree among the nonzero
Q_e. This simultaneous form of the paper's successive lowest-coordinate
extraction is an elementary supporting derivation: the paper does not state it
as a separate named result. It avoids additional polynomial carriers and makes
the same coefficient slice work for every low-order binary derivative.

The proof chain is:

1. A nonzero hyperplane normal b has a binary perpendicular vector of height
   at least H₂(b) to the power 1/(N−1).
2. Under hypothetical vanishing on the hyperplanes, substitute their affine
   graphs through these binary points. The coefficient of minimum extra degree
   gives a nonzero binary polynomial with the same strict vanishing condition.
3. Restore the original block degrees by multiplying by a coefficient-one
   monomial. Its coefficient height is no larger than that of F.
4. The binary heights meet sharp Roth's exact threshold, giving a contradictory
   nonzero jet. Express the resulting point in any supplied hyperplane basis;
   evaluation proves that the corresponding restricted jet polynomial is nonzero.

The following declarations make those steps reusable. Their packet node IDs
have prefix `DiophantineApproximationAndTranscendence:DT.2/`; each API name is
also the corresponding signature in the suggested file. None is an
implementation claim.

#### Euclidean height under zero extension

`height2-zero-extension` · `DiophantineApproximation.height2_zero_extension`.

Let K be a number field, I,J finite types, f:I→J injective, x:I→K nonzero, and y:J→K. If y(f(i))=x(i) and y(j)=0 off the range of f, then H₂(y)=H₂(x). This includes coordinate permutations and relabelling a coefficient support.

**Proof.**

1. At each infinite place the sum of squared embedded coordinates is unchanged: reindex the range by the injection and discard zero coordinates.
2. At each finite place the maximum is unchanged, since adjoining zero to a nonempty set of nonnegative values cannot change its supremum. The nonzero x ensures that the source index type is nonempty.
3. Raise the equal local factors to the defining positive exponents and multiply. No change of coefficient field or max-height substitution is involved.

**Inputs:** `DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace`.

**Tests.**

- `DiophantineApproximation.test_height2_zero_padding`: H₂(0,1,2,0)=H₂(1,2) over ℚ; padding and reindexing do not change the height.

**Acceptance:** Use the Euclidean-at-infinite-places height H₂ and strict weighted-order thresholds.

**Source:** author preprint §1 p. 2; §7 proof of Lemma 24, pp. 65–67; published pp. 292–294.

#### Euclidean height of a nonzero subvector

`height2-subvector` · `DiophantineApproximation.height2_comp_le`.

Let K be a number field, I,J finite types, f:I→J injective and y:J→K with y∘f nonzero. Then H₂(y∘f)≤H₂(y).

**Proof.**

1. At an infinite place, the subvector sum of squared norms is at most the full sum; at a finite place, its maximum is at most the full maximum. All factors are positive for nonzero vectors.
2. For each vector the finite-place maximum is 1 outside a finite union of exceptional sets: omit zero coordinates and use NumberField.FinitePlace.hasFiniteMulSupport on the remaining nonzero coordinates. Use one common finite set for both vectors.
3. Apply monotonicity of positive real powers to each local inequality and multiply the finite products. This is projective subvector monotonicity, not a comparison of arbitrarily rescaled affine coefficient lists.

**Inputs:** `DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace`, `mathlib:NumberField.FinitePlace.hasFiniteMulSupport`, `mathlib:Real.rpow_le_rpow`.

**Acceptance:** Use the Euclidean-at-infinite-places height H₂ and strict weighted-order thresholds.

**Source:** author preprint §1 p. 2; §7 proof of Lemma 24, pp. 65–67; published pp. 292–294.

#### Projective invariance of Euclidean height

`height2-scalar-invariance` · `DiophantineApproximation.height2_smul`.

For a number field K, a finite type I, a nonzero vector x:I→K and a∈K with a≠0, H₂(a·x)=H₂(x).

**Proof.**

1. At an infinite place factor |σ(a)|² out of the squared Euclidean norm. Its contribution after the defining real power is |σ(a)|^{mult/[K:ℚ]}. At a finite place factor |a| out of the maximum, contributing |a|^{1/[K:ℚ]}.
2. Use the finite-support reduction for the finite products. Their combined scalar factor is the [K:ℚ]-th root of NumberField.prod_abs_eq_one(a), hence 1.

**Inputs:** `DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace`, `mathlib:NumberField.prod_abs_eq_one`, `mathlib:NumberField.FinitePlace.hasFiniteMulSupport`, `mathlib:Real.rpow_def_of_pos`.

**Tests.**

- `DiophantineApproximation.test_height2_scaled_pivot`: Over ℚ, H₂(2,4,4)=3 and H₂(2,−1)²=5. Scaling the normal vector does not scale the projective height.

**Acceptance:** Use the Euclidean-at-infinite-places height H₂ and strict weighted-order thresholds.

**Source:** author preprint §1 p. 2; §7 proof of Lemma 24, pp. 65–67; published pp. 292–294.

#### Height of the binary perpendicular vector

`height2-binary-normal-vector` · `DiophantineApproximation.height2_pair_swap_neg`.

For a number field K and a,b∈K, H₂((b,−a))=H₂((a,b)).

**Proof.**

1. At every infinite place the sum |b|²+|−a|² is |a|²+|b|². At every finite place max(|b|,|−a|)=max(|a|,|b|). Thus the local factors agree, including a=b=0.

**Inputs:** `DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace`.

**Tests.**

- `DiophantineApproximation.test_height2_zero_vector`: H₂(0,0)=0 over ℚ. The binary swap/sign identity includes the zero vector; the large-pair theorem requires a nonzero pivot.

**Acceptance:** Use the Euclidean-at-infinite-places height H₂ and strict weighted-order thresholds.

**Source:** author preprint §1 p. 2; §7 proof of Lemma 24, pp. 65–67; published pp. 292–294.

#### Hyperplane height bounded by binary heights

`height2-normalized-pair-product` · `DiophantineApproximation.height2_le_prod_pairs`.

Let K be a number field, N≥2, b∈K^N, and p a coordinate with b_p≠0. Then H₂(b)≤∏_{q≠p}H₂((b_p,b_q)).

**Proof.**

1. Normalize c=b/b_p so c_p=1. Scalar invariance gives H₂(c)=H₂(b) and H₂((1,c_q))=H₂((b_p,b_q)).
2. At an infinite place put t_q=|σ(c_q)|²≥0. The powerset expansion of ∏_{q≠p}(1+t_q) contains the empty-set term 1 and all singleton terms, so 1+Σt_q≤∏(1+t_q). Take the mult/(2[K:ℚ]) power.
3. At a finite place each max(1,|c_q|)≥1. Their product bounds both 1 and every |c_q|, and hence max_j|c_j|. Raise to 1/[K:ℚ].
4. Multiply over a common finite set of exceptional places and interchange the finite coordinate products.

**Inputs:** `DiophantineApproximationAndTranscendence:DT.2/height2-scalar-invariance`, `DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace`, `mathlib:Finset.prod_one_add`, `mathlib:NumberField.FinitePlace.hasFiniteMulSupport`, `mathlib:Real.rpow_le_rpow`.

**Tests.**

- `DiophantineApproximation.test_height2_pivot_product`: Over ℚ, H₂(1,2,2)=3 and H₂(1,2)²=5. The product bound is strict: 3<5.
- `DiophantineApproximation.test_height2_not_max_height`: Over ℚ, H₂(1,1,1)²=3 whereas the native relative maximum height Height.mulHeight(1,1,1)=1.

**Acceptance:** Use the Euclidean-at-infinite-places height H₂ and strict weighted-order thresholds.

**Source:** author preprint §1 p. 2; §7 proof of Lemma 24, pp. 65–67; published pp. 292–294.

#### A binary direction of large height

`large-height-binary-direction` · `DiophantineApproximation.exists_large_height2_pair`.

Let K be a number field, N≥2, b∈K^N and b_p≠0. There is q≠p such that H₂(b)≤H₂((b_q,−b_p))^{N−1}. The vector (b_q,−b_p) is nonzero and solves b_p X+b_q Y=0.

**Proof.**

1. Choose q with maximal H₂((b_p,b_q)) among the N−1 other coordinates. This set is nonempty. Each binary height is positive because b_p≠0.
2. The product bound from height2-normalized-pair-product is at most this maximum to the power N−1. Apply height2-binary-normal-vector.
3. The second coordinate −b_p is nonzero and b_p b_q+b_q(−b_p)=0. This supplies the point and the height exponent used by sharp Roth.

**Inputs:** `DiophantineApproximationAndTranscendence:DT.2/height2-normalized-pair-product`, `DiophantineApproximationAndTranscendence:DT.2/height2-binary-normal-vector`, `DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace`.

**Acceptance:** For N=2 the exponent is 1 and equality holds. The chosen nonzero pivot need not maximize any local absolute value.

**Source:** author preprint §1 p. 2; §7 proof of Lemma 24, pp. 65–67; published pp. 292–294.

#### Coefficient height after multiplication by a monomial

`height2-monomial-multiplication` · `DiophantineApproximation.height2_coeff_monomial_mul`.

Let K be a number field, S a finite variable type, P∈K[S] nonzero and a a natural-number multiindex. The coefficient-vector height of X^a P equals that of P: H₂(((X^a P)_μ)_{μ∈supp(X^a P)})=H₂((P_ν)_{ν∈supp P}).

**Proof.**

1. Multiplication by the coefficient-one monomial translates each supported exponent ν to a+ν without changing its coefficient. Translation is injective and creates no cancellations.
2. Use the pinned coefficient-of-monomial-product formula both on and off this translated support. Apply height2-zero-extension to the induced bijection of finite supports.

**Inputs:** `DiophantineApproximationAndTranscendence:DT.2/height2-zero-extension`, `mathlib:MvPolynomial.coeff_monomial_mul`, `mathlib:MvPolynomial.coeff_monomial_mul'`.

**Acceptance:** Use the Euclidean-at-infinite-places height H₂ and strict weighted-order thresholds.

**Source:** author preprint §1 p. 2; §7 proof of Lemma 24, pp. 65–67; published pp. 292–294.

#### Coefficient height of a nonzero slice

`height2-coefficient-slice` · `DiophantineApproximation.height2_sumAlgEquiv_coeff_le`.

Let K be a number field, E,B finite variable types, F∈K[E⊕B], Q=sumAlgEquiv(F)∈(K[B])[E], and e an E-multiindex with Q_e≠0. Then H₂(coefficients of Q_e)≤H₂(coefficients of F).

**Proof.**

1. The native sumAlgEquiv separates the exponent into its E and B restrictions. The coefficient of v in Q_e is exactly the coefficient of F at the combined exponent (e,v). This follows on monomials from the native curry equivalence and extends by finite addition.
2. Thus the nonzero coefficients of Q_e form a subvector of the coefficients of F, indexed by the injection v↦(e,v). Apply height2-subvector.

**Inputs:** `DiophantineApproximationAndTranscendence:DT.2/height2-subvector`, `mathlib:MvPolynomial.sumAlgEquiv`.

**Acceptance:** Use the Euclidean-at-infinite-places height H₂ and strict weighted-order thresholds.

**Source:** author preprint §1 p. 2; §7 proof of Lemma 24, pp. 65–67; published pp. 292–294.

#### Hasse derivatives commute with coefficient slices

`hasse-derivative-coefficient-slice` · `MvPolynomial.hasseDeriv_sumAlgEquiv_coeff`.

For a commutative semiring R, variable types E,B, F∈R[E⊕B], an E-multiindex e and a B-multiindex i, the e-coefficient of sumAlgEquiv(D^{inr_*i}F) equals D^i((sumAlgEquiv F)_e).

**Proof.**

1. Check the identity on one monomial X_E^u X_B^v: both sides vanish unless u=e, and otherwise equal (∏_b binom(v_b,i_b))X_B^{v−i} with the original coefficient.
2. Extend by coefficient linearity over the finite support of F. The outer exponents are unchanged; in particular the outer support after differentiation is contained in the original outer support.

**Inputs:** `mathlib:MvPolynomial.sumAlgEquiv`, `DiophantineApproximationAndTranscendence:DT.1/multivariate-hasse-derivative-coefficients`, `DiophantineApproximationAndTranscendence:DT.1/multivariate-hasse-derivative`.

**Tests.**

- `MvPolynomial.test_hasse_binary_slice`: For F=U²X³, the U² coefficient after the second Hasse X derivative is 3X, not 6X.

**Acceptance:** No characteristic-zero hypothesis is needed for the coefficient identity. The derivatives are Hasse derivatives and retain their binomial factors.

**Source:** §7, Lemma 24 proof, preprint p. 66, differentiation only in the retained binary variables; published p. 293.

#### A lowest-degree coefficient after an affine substitution

`lowest-degree-affine-coefficient` · `MvPolynomial.coeff_eval₂_affine_of_min_degree`.

Let R be a commutative semiring, E,B finite types, Q∈(R[B])[E], e an E-multiindex, x:B→R, and A:B→E→R. Suppose |e|≤|u| for every u∈supp Q, where |u|=Σu_j. Substitute each inner variable X_b by x_b+Σ_j A_bj U_j and each outer variable by U_j. The coefficient of U^e in the resulting polynomial is (Q_e)(x).

**Proof.**

1. Expand Q=Σ_u U^u Q_u(X). In a contribution to exponent e one must have u≤e coordinatewise. The hypothesis |e|≤|u| then forces |u|=|e| and u=e; all proper coordinatewise predecessors have smaller total degree.
2. For u=e, only the constant coefficient of Q_e(x+A U) contributes. Evaluation at U=0 identifies that constant coefficient with Q_e(x). This also covers Q_e=0 and Q=0.
3. Use the pinned monomial-product coefficient formula for the first step and eval_eval₂ plus eval_zero for the second. No division, generic-point argument or cancellation assumption is needed.

**Inputs:** `mathlib:MvPolynomial.coeff_monomial_mul'`, `mathlib:MvPolynomial.eval₂_sum`, `mathlib:MvPolynomial.eval_eval₂`, `mathlib:MvPolynomial.eval_zero`.

**Tests.**

- `MvPolynomial.test_affine_minimum_needed`: For F=X+U and X=U, the U coefficient after substitution is 2, whereas the original U coefficient evaluated at X=0 is 1. The selected outer degree 1 is not minimal; the hypothesis cannot be removed.

**Acceptance:** The minimum-total-degree condition is essential: a lower outer monomial can gain degree through the affine substitution and change the coefficient of U^e.

**Source:** §7, Lemma 24, preprint pp. 65–66 / published pp. 292–293. Elementary simultaneous minimum-total-degree formulation of the printed successive lowest-coefficient argument..

#### Residual block degrees of a binary coefficient slice

`binary-slice-block-degrees` · `MvPolynomial.block_degrees_sumAlgEquiv_coeff`.

Let R be a commutative semiring, m,r natural numbers, E=Fin(m)×Fin(r), B=Fin(m)×Fin(2), and F∈R[E⊕B] with every supported exponent having block-h degree d_h. Put Q=sumAlgEquiv(F). If Q_e≠0, then s_h=Σ_a e_(h,a)≤d_h, and every supported binary exponent v of Q_e satisfies v_(h,0)+v_(h,1)=d_h−s_h.

**Proof.**

1. For each nonzero coefficient (Q_e)_v, combine the outer exponent e with v. Its coefficient in F is the same nonzero scalar. The block degree of that monomial is s_h+v_(h,0)+v_(h,1)=d_h.
2. A nonzero Q_e has at least one supported v, giving s_h≤d_h. Subtract s_h to obtain the displayed degree for every supported v.

**Inputs:** `mathlib:MvPolynomial.sumAlgEquiv`.

**Acceptance:** Do not infer s_h≤d_h for a zero slice. A nonzero constant slice has residual degree zero.

**Source:** §7, Lemma 24 proof, preprint pp. 66–67 / published pp. 293–294, the residual degrees before multiplying by X_(h,1)^{a_h}.

#### Low-order vanishing passes to a nonzero binary slice

`binary-slice-vanishing` · `MvPolynomial.exists_binary_slice_vanishing`.

Let K be an infinite field, E,B finite variable types, F∈K[E⊕B] nonzero, Q=sumAlgEquiv(F), and J any set of B-multiindices. Let x:B→K and A:B→E→K. Suppose for every i∈J and u:E→K, (D^{inr_*i}F)(u,x+A u)=0. Then there is e∈supp Q such that |e| is minimal on supp Q, Q_e≠0, and (D^i Q_e)(x)=0 for every i∈J.

**Proof.**

1. The native algebra equivalence sends F≠0 to Q≠0. Choose e of minimum total degree in the nonempty finite support of Q; Q_e≠0.
2. For i∈J, differentiate only the inner variables. hasse-derivative-coefficient-slice shows that the resulting outer support is a subset of supp Q, so the same e satisfies the minimum-degree inequality even when its own differentiated coefficient is zero.
3. Compose the differentiated polynomial with (u,x+A u). It evaluates to zero for every u by hypothesis, hence is the zero polynomial by the pinned infinite-domain polynomial funext theorem.
4. Its coefficient at e is therefore zero. lowest-degree-affine-coefficient identifies that coefficient with (D^i Q_e)(x). One e works for every i; it is selected from F before differentiation.

**Inputs:** `DiophantineApproximationAndTranscendence:DT.2/hasse-derivative-coefficient-slice`, `DiophantineApproximationAndTranscendence:DT.2/lowest-degree-affine-coefficient`, `mathlib:MvPolynomial.sumAlgEquiv`, `mathlib:MvPolynomial.funext`, `mathlib:MvPolynomial.eval_eval₂`.

**Tests.**

- `MvPolynomial.test_slice_before_specialization`: F=U²(X−2Y+U)³ has zero U⁰ coefficient but nonzero U² coefficient (X−2Y)³. Setting U=0 would destroy the nonzero polynomial needed by the proof.
- `MvPolynomial.test_slice_strict_boundary`: At (X,Y)=(2,1), the second Hasse X derivative of (X−2Y)³ is 0 and the third is 1. Vanishing strictly below the index does not include the boundary.
- `MvPolynomial.test_zero_extra_variables`: With no extra variables, the sole coefficient slice of X² is X². This is the N=2 case of the reduction.
- `MvPolynomial.test_slice_cancellation`: For UX−UX+U² the U coefficient is 0 and the U² coefficient is 1. The minimum is selected from the actual polynomial support after cancellation.

**Acceptance:** F may vanish when all extra variables are set to zero. This lemma extracts a nonzero coefficient instead of making that invalid specialization. Infinite K is used precisely for polynomial funext.

**Source:** §7, Lemma 24 proof, preprint pp. 65–66 / published pp. 292–293. Minimum total extra degree replaces the printed iteration of lowest coordinate degrees..

#### Restoring the original binary block degrees

`restore-binary-multihomogeneity` · `MvPolynomial.block_degrees_monomial_mul`.

Let R be a nontrivial commutative semiring, m a natural number, P∈R[X_(h,0),X_(h,1)] nonzero of block degrees δ_h, and a_h natural numbers. Put t_(h,0)=a_h and t_(h,1)=0. Then X^t P is nonzero and has block degrees δ_h+a_h.

**Proof.**

1. The coefficient-one monomial translates every supported exponent v to t+v with the same coefficient. It cannot annihilate a nonzero coefficient, even if R has zero divisors.
2. The translated exponent has block degree a_h+δ_h. Conversely every supported exponent of the product is a translate, by the pinned coefficient formula.

**Inputs:** `mathlib:MvPolynomial.coeff_monomial_mul`, `mathlib:MvPolynomial.coeff_monomial_mul'`.

**Tests.**

- `MvPolynomial.test_restored_binary_index`: X²(X−2Y)³ has weighted index 3/5 at (2,1) with both degree weights 5. The restored polynomial is homogeneous of degree 5.

**Acceptance:** The multiplier has coefficient one. Over a ring with zero divisors, an arbitrary nonzero scalar monomial would not give the same nonvanishing conclusion.

**Source:** §7, Lemma 24 proof, preprint pp. 66–67 / published pp. 293–294, definition of F*.

#### Non-vanishing on hyperplanes

`hyperplane-nonvanishing` · `DiophantineApproximation.nonvanishing_on_hyperplanes`.

Let K be a number field, m,N≥2, d_h positive integers, 0<Θ≤1, and d_h/d_(h+1)≥2m²/Θ. Let F∈K[X_hl] be nonzero and multihomogeneous of block degrees d_h. Let b_h∈K^N be nonzero and V_h={x:b_h·x=0}. Suppose H₂(b_h)^{d_h}≥(exp(Σd_h)H₂(coeff F))^{(N−1)(3m²/Θ)^m} for each h. Then there are x_h∈V_h and a Hasse multiindex i with w_d(i)=Σ_hΣ_l i_hl/d_h<mΘ and (D^iF)(x)≠0. The points and the derivative are K-rational.

**Proof.**

1. Choose a nonzero pivot p_h of b_h and use large-height-binary-direction to choose q_h≠p_h. Permute each block so these are its first two coordinates. The coefficient height is unchanged by the support bijection and height2-zero-extension; block degrees and weighted orders are unchanged because the permutation stays within each block. Transport Hasse jets using their monomial coefficient formula.
2. Write the reordered polynomial using E=Fin(m)×Fin(N−2) extra variables and B=Fin(m)×Fin(2) binary variables. Put x*_h=(b_(h,1),−b_(h,0)). Its height to the power N−1 bounds H₂(b_h), it is nonzero, and it satisfies the binary hyperplane equation.
3. For the contradiction assume every jet of weight <mΘ vanishes on the product of hyperplanes. For arbitrary extra coordinates u, keep the second binary coordinate x*_(h,1) fixed and replace the first by x*_(h,0)−Σ_a b_(h,a+2)u_(h,a)/b_(h,0). This affine substitution lies in the hyperplanes. Apply binary-slice-vanishing with J={binary i:w_d(i)<mΘ}. Obtain one nonzero coefficient slice P=Q_e whose every such jet vanishes at x*.
4. Put s_h=Σ_a e_(h,a). binary-slice-block-degrees gives s_h≤d_h and degrees d_h−s_h. Multiply P by ∏_h X_(h,0)^{s_h}. restore-binary-multihomogeneity gives a nonzero F* of degrees d_h. height2-coefficient-slice and height2-monomial-multiplication give H₂(coeff F*)≤H₂(coeff F).
5. The strict-threshold vanishing characterization gives index(P,x*,d)≥mΘ. The existing index product theorem and nonnegativity give index(F*,x*,d)≥index(P,x*,d). Equivalently, in the Hasse Leibniz sum every derivative of P has order bounded by the total derivative order, so all jets of F* of weight <mΘ vanish. No assumption that the multiplying monomial is nonzero at x* is needed.
6. Let A=(3m²/Θ)^m>0 and B=exp(Σd_h)H₂(coeff F)>0. The original hypothesis and pair bound imply B^{(N−1)A}≤H₂(x*_h)^{(N−1)d_h}. Taking the positive (N−1)-st root gives B^A≤H₂(x*_h)^{d_h}. Monotonicity and the coefficient-height bound give exactly sharp-roths-lemma for F*. Its nonzero jet of weight <mΘ contradicts the preceding vanishing. Convert its ordinary-derivative signature to Hasse derivatives with the existing factorial identity; characteristic zero makes the factors nonzero.
7. This is Evertse Lemma 24 reduced to the existing sharp-roths-lemma node. That node retains the explicit Faltings/Product Theorem proof gap; the reduction does not claim that gap is closed. For N=2 the extra-variable type is empty, e=0 and F*=F, giving the same argument without an extraction step.

**Inputs:** `DiophantineApproximationAndTranscendence:DT.2/large-height-binary-direction`, `DiophantineApproximationAndTranscendence:DT.2/height2-zero-extension`, `DiophantineApproximationAndTranscendence:DT.2/height2-coefficient-slice`, `DiophantineApproximationAndTranscendence:DT.2/height2-monomial-multiplication`, `DiophantineApproximationAndTranscendence:DT.2/binary-slice-vanishing`, `DiophantineApproximationAndTranscendence:DT.2/binary-slice-block-degrees`, `DiophantineApproximationAndTranscendence:DT.2/restore-binary-multihomogeneity`, `DiophantineApproximationAndTranscendence:DT.2/sharp-roths-lemma`, `DiophantineApproximationAndTranscendence:DT.1/weighted-index-vanishing-characterisation`, `DiophantineApproximationAndTranscendence:DT.1/weighted-index-mul`, `DiophantineApproximationAndTranscendence:DT.1/multivariate-hasse-derivative`, `DiophantineApproximationAndTranscendence:DT.1/multivariate-hasse-derivative-leibniz-rule`, `mathlib:MvPolynomial.sumAlgEquiv`, `mathlib:Real.rpow_le_rpow`, `mathlib:Real.rpow_le_rpow_iff`, `DiophantineApproximationAndTranscendence:DT.1/weighted-index-rename`.

**Acceptance:** The conclusion is a strict weighted bound and an actual nonzero jet on the hyperplanes. It is not inferred from F≠0 alone. Every height in the threshold is H₂. The proof is conditional on the already named sharp Roth node, whose proof gap remains explicit.

**Source:** §7, Lemma 24 and full proof, author preprint pp. 64–67; published pp. 291–294. Use strict inequality in (7.11), as required by E216..

#### A normal vector with the hyperplane height

`hyperplane-normal-height` · `DiophantineApproximation.exists_normal_height2`.

For a number field K, N≥2 and a submodule T≤K^N with dimension N−1, there is b∈K^N with b≠0, T=dotOrthogonal(K·b), and subspaceHeight(T)=H₂(b).

**Proof.**

1. The submodule is proper by its dimension. The pinned separating-functional theorem supplies a nonzero linear functional f with T≤ker f. Its kernel has dimension N−1 by the dual rank lemma, so equality follows from inclusion and equal dimensions.
2. Put b_j=f(e_j). Expand any vector in the standard basis to get f(x)=Σ_j b_j x_j. Nonzero f implies b≠0. By bilinearity and commutativity, ker f is precisely dotOrthogonal(K·b).
3. Apply the existing subspaceHeight_orthogonal and subspaceHeight_span_singleton APIs. The latter uses N≥2 and b≠0.

**Inputs:** `DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace`, `mathlib:Submodule.exists_le_ker_of_lt_top`, `mathlib:Module.Dual.finrank_ker_add_one_of_ne_zero`, `mathlib:Submodule.eq_of_le_of_finrank_eq`, `mathlib:Pi.basisFun`.

**Acceptance:** Use the Euclidean-at-infinite-places height H₂ and strict weighted-order thresholds.

**Source:** §7, equation (7.5) and Lemma 24, preprint p. 64 / published p. 291; comparison with the inherited Plücker-height definition.

#### A nonzero polynomial restriction in any hyperplane basis

`hyperplane-jet-restriction` · `DiophantineApproximation.exists_nonzero_hyperplane_jet_restriction`.

Under the hypotheses of hyperplane-nonvanishing, let a_(h,1),…,a_(h,N−1) be any basis of V_h. Then there is i with w_d(i)<mΘ such that (D^iF)(Σ_a Y_(1,a)a_(1,a),…,Σ_a Y_(m,a)a_(m,a)) is a nonzero polynomial. This is the precise input of conditional-nonzero-block-grid-jet.

**Proof.**

1. Apply hyperplane-nonvanishing to obtain x_h∈V_h with a nonzero evaluated jet. Express each x_h in the supplied basis, using its spanning property; no height condition on the basis vectors is required.
2. Evaluate the composed polynomial at those basis coefficients. The pinned eval_eval₂ identity identifies its value with the nonzero original jet. Since the zero polynomial evaluates to zero, the composed polynomial is nonzero.
3. For a hyperplane given as a codimension-one submodule T rather than an equation, take a nonzero element b of its one-dimensional dot-orthogonal space. Then T=dotOrthogonal(K·b). The existing subspaceHeight_span_singleton and subspaceHeight_orthogonal give subspaceHeight(T)=H₂(b). Thus the parent grid theorem has exactly the required hypotheses.

**Inputs:** `DiophantineApproximationAndTranscendence:DT.2/hyperplane-nonvanishing`, `DiophantineApproximationAndTranscendence:DT.2/height-of-linear-subspace`, `mathlib:MvPolynomial.eval_eval₂`, `mathlib:Submodule.mem_span_range_iff_exists_fun`, `DiophantineApproximationAndTranscendence:DT.2/hyperplane-normal-height`.

**Acceptance:** The basis can have arbitrary heights. Evaluation at a witness proves the restriction nonzero before the rectangular-grid lemma is invoked.

**Source:** §7, Lemma 26 proof, preprint p. 68 / published p. 295, its first application of Lemma 24.

#### Grid handoff and source corrections

`hyperplane-normal-height` converts the parent's codimension-one submodules to
normal vectors with exactly the same H₂ height. `hyperplane-jet-restriction`
then supplies the polynomial input to `conditional-nonzero-block-grid-jet`.
Its output has nonzero blocks and weighted order <(2−1/N)mΘ<2mΘ. This completes
the reduction of the parent grid theorem to the sharp Roth input; it does not
close the sharp Roth/Faltings proof gap or the other DT.2 gaps.

Two source findings are recorded with version-specific evidence in the packet:

- **E215, degree computation:** on published p. 294 and preprint p. 67, the product with
  2a + 1 factors of degree b + 1 is assigned degree (2a + 1)(2b + 1).
  Its degree is (2a + 1)(b + 1), and the hypothesis gives s ≥ deg P, not necessarily equality.
  The corrected grid-capacity argument still proves the lemma.
- **E216, index boundary:** on published p. 290 and preprint p. 63, defining the index by
  a *largest* threshold requires vanishing at all orders strictly below that threshold.
  With the printed non-strict condition, X₁₁ at 0 with unit degree weights has every
  threshold below 1 admissible but no largest one. The existing DT.1 `weightedIndex`
  already uses the correct least-nonzero-jet convention. A nonzero jet bounds the index
  by ≤ its order; final strict bounds come from the derivative-budget inequalities. The same error
  appears at (7.11), preprint p. 65 / published p. 292: index≥mΘ gives vanishing
  for orders <mΘ. Define I using this strict inequality. For X³ at 0 with weight
  5, the index is 3/5 and the third Hasse derivative is 1. The strict correction
  preserves (7.13) and the sharp Roth contradiction.

The packet records both PDF checksums and the bounded correction search; the findings
still require independent verification.

### Acceptance tests

- The exceptional subspaces appear in the conclusions of `subspace-theorem-and-its-exceptional-subspaces`,
  `p-adic-subspace-theorem` and `parametric-subspace-theorem`; `vanishing-form-gives-infinitely-many-solutions`
  and `exceptional-subspace-example-three-forms` prove they cannot be dropped, and
  `two-form-strict-inequality-finite` shows that for n = 2 the strict inequality is finite.
- Finiteness is separate from effectivity: `vojta-effective-exceptional-subspaces` and
  `faltings-wustholz-interval-refinement` make the exceptional subspaces effective while the
  remaining finitely many solutions stay ineffective; `thue-mahler-finiteness` records that its
  effective proof belongs to DT.4.
- Roth: `roth-from-subspace-theorem` with α real of degree ≥ 3 and C = 1 gives `DT.1/roth-theorem`.
- Norm forms: the ℚ(⁶√2) example of Theorem 7.13 (norm −2) and the Thue equation x³ − 2y³ = c as the
  case K = ℚ(∛2), n = 2 of Theorem 7.9; Pell's equation shows n = d is excluded.
- S-units: x + y = 1 in ⟨−1, 2⟩ has exactly (2, −1), (−1, 2), (1/2, 1/2); degenerate solutions of
  2^u − 2^u + 1 = 1 are infinite; x + y = 1 in the group generated by 2, 3, 5, 7, 11, 13 has 545
  solutions with x ≤ y (de Weger).
- Recurrences: 2^h + 3^h − 5^h has zero set {1}; i^h + (−i)^h has infinitely many zeros (degenerate).

### Boundaries

The general Skolem–Mahler–Lech theorem with repeated characteristic roots (Evertse Theorem 8.18 in
full, proved by p-adic analysis) and the closed form of recurrences belong with the theory of linear
recurrences (`ClassicalArithmeticCompletion:CA.2`); this layer proves the simple-root case, which is
an application of the S-unit equation. The Adamczewski–Bugeaud theorem on the block complexity of
b-ary expansions of algebraic numbers (Evertse §8.5) is not a target of this layer. Effective bounds
for unit, Thue and Thue–Mahler equations are DT.4; lattice reduction and enumeration are
`EffectiveDiophantineMethods:ED.2`; successive minima and Minkowski's theorems over ℝ^n are
`GeometryOfNumbersAndQuadraticArithmetic:GN.1`.

### Block homogenization and the affine chart

Evertse's affine Remark in §1, published pp. 221–222 of [An explicit version of
Faltings' Product Theorem](https://matwbn.icm.edu.pl/ksiazki/aa/aa73/aa7332.pdf),
compares the index of an affine polynomial with that of its block homogenization.
The comparison below uses native multivariate polynomials, the existing Hasse
operator and weighted index, and the native weighted-homogeneous predicate.
There is no new projective-space, polynomial, degree or height carrier. The
polynomial argument is independent of the arithmetic intersection proof of
sharp Roth, which remains an explicit gap.

For finite sets B of blocks and S of affine variables, let b:S→B specify the
block of each variable, and let d:B→ℕ. Put t_h(e)=Σ_{j:b(j)=h}e_j. An affine
polynomial f is d-bounded when t_h(e)≤d_h for every exponent e in its support.
Write A_d(e)=(d_h−t_h(e))_h⊕e on B⊕S. Block homogenization H_d retains the
monomials satisfying every block bound and pads them with the indicated
homogenizing exponents. This totalization discards overdegree terms, in
agreement with Mathlib's univariate homogenization. A constant polynomial
in an empty affine block still acquires the required homogenizing power.

For d-bounded f and a:S→R, the chart point is q=(1,a). In a commutative ring,
write D^γ for the existing Hasse derivative. The finite Taylor index set is
Γ_d={γ | ∀h t_h(γ)≤d_h}, contained in the coordinate box γ_j≤d_b(j). The
centered homogeneous Taylor expansion is

\[
H_d(f)=\sum_{\gamma\in\Gamma_d}(D^\gamma f)(a)
 \prod_h X_{h0}^{d_h-t_h(\gamma)}
 \prod_j(Y_j-a_jX_{b(j),0})^{\gamma_j}.
\]

Substituting X_h0=1+U_h and Y_j=a_j+V_j turns each centered factor into
V_j−a_jU_b(j). Thus the coefficient of U^κV^β only uses γ≥β with
t_h(γ−β)≤κ_h. In particular, its affine jet has block order at most
κ_h+t_h(β). This is the bound needed for weighted-index equality. The
paper's stronger coordinatewise bound is false (E219): F=Y²−X₀Y has a
nonzero X₀ derivative at (1,1), although its dehomogenization vanishes at 1.

No assertion about equality of polynomials is deduced merely from agreement
on the points of a finite ring. The Taylor argument is applied over a
polynomial coefficient ring and then combined with homogeneous reconstruction.
No factorial division is used. The Hasse formulation consequently includes
positive characteristic; the ordinary-derivative source convention has the
same vanishing orders in characteristic zero.

#### Block homogenization

**Declaration:** `DiophantineApproximationAndTranscendence:DT.2/block-homogenization` (definition).

Define H_d(f)=Σ_{e∈supp(f), ∀h t_h(e)≤d_h} coeff_e(f) X^{A_d(e)} in R[X_h0,Y_j], with variables B⊕S. The operation is total: it discards every monomial exceeding one of the block bounds. Under d-boundedness it is the usual product of X_h0^{d_h} times f(Y_j/X_b(j),0), expressed without localization.

**Construction or proof:**

1. Use the native coefficient support and finite sums, then the native monomial constructor at A_d(e). The inr coordinates recover e, so exponent padding introduces no collisions.
2. Filter before taking natural subtraction; saturation alone would retain overdegree terms and disagree with Polynomial.homogenize.

**Dependencies:** `mathlib:MvPolynomial.monomial`, `mathlib:MvPolynomial.as_sum`, `mathlib:Finsupp.sumElim`, `mathlib:Finsupp.equivFunOnFinite`, `mathlib:Polynomial.homogenize`.

**API:**

- `MvPolynomial.blockHomogenize_zero` (simp): H_d(0)=0.
- `MvPolynomial.blockHomogenize_add` (simp): H_d(f+g)=H_d(f)+H_d(g), without degree hypotheses.
- `MvPolynomial.blockHomogenize_smul` (structure): H_d(c·f)=c·H_d(f) for c∈R.
- `MvPolynomial.blockHomogenize_map` (functoriality): For a unital ring map φ:R→A, H_d(map φ f)=map φ(H_d(f)). Zero coefficients created by φ are harmless.
- `MvPolynomial.blockHomogenize_monomial` (simp): H_d(cY^e)=cX^{A_d(e)} if every t_h(e)≤d_h, and 0 otherwise.
- `MvPolynomial.blockHomogenize_C` (simp): H_d(c)=c∏_h X_h0^{d_h}.
- `MvPolynomial.blockHomogenize_one` (simp): H_d(1)=∏_h X_h0^{d_h}.
- `MvPolynomial.blockHomogenize_degree_zero` (characterisation): H_0(f)=coeff_0(f), as a constant polynomial.
- `MvPolynomial.rename_blockHomogenize_unique` (compatibility): For one block and one affine variable, rename the affine coordinate to 0 and the homogenizing coordinate to 1. Through uniqueAlgEquiv⁻¹, H_n(p) equals Polynomial.homogenize p n for all p and n. The promoted univariate-comparison node supplies this API.

**Unit tests:**

- `MvPolynomial.test_blockHomogenize_quadratic` (computation): Over ℚ, in one block of degree 2, y²−y homogenizes to Y²−X₀Y.
- `MvPolynomial.test_blockHomogenize_zero` (degenerate): The zero polynomial homogenizes to zero for degree 2.
- `MvPolynomial.test_blockHomogenize_truncation` (non-example): In one block of degree 1, y²+1 homogenizes to X₀, not Y²+X₀.
- `MvPolynomial.test_blockHomogenize_joint_degree` (non-example): Two variables in a single block of degree 1: y₁y₂ homogenizes to 0, even though each individual exponent is at most 1.
- `MvPolynomial.test_blockHomogenize_separate_blocks` (computation): Two variables in separate blocks, both degree 1: y₁y₂ homogenizes to Y₁Y₂.
- `MvPolynomial.test_blockHomogenize_degree_zero` (degenerate): At degree 0, y+3 homogenizes to the constant 3.
- `MvPolynomial.test_blockHomogenize_empty_affine_block` (degenerate): One block containing no affine variables, of degree 2: the constant 1 homogenizes to X₀².
- `MvPolynomial.test_blockHomogenize_native_orientation` (compatibility): For one affine variable and degree 3, y+1 agrees with Polynomial.homogenize after sending inr to native coordinate 0 and inl to native coordinate 1.

#### Coefficients of block homogenization

**Declaration:** `DiophantineApproximationAndTranscendence:DT.2/block-homogenization-coefficients` (lemma).

For every exponent u on B⊕S, coeff_u(H_d(f)) equals coeff_{u|S}(f) if u(inl h)+t_h(u|S)=d_h for all h, and equals 0 otherwise. No degree bound on f is needed.

**Construction or proof:**

1. Expand the finite monomial sum and use coeff_monomial. At most one input exponent contributes, since its affine part must be u|S.
2. The condition on u is equivalent to admissibility of its affine restriction and equality of its homogenizing part to d−t(u|S); use natural subtraction only after establishing the inequality.

**Dependencies:** `DiophantineApproximationAndTranscendence:DT.2/block-homogenization`, `mathlib:MvPolynomial.coeff_monomial`.

**API:**

- `MvPolynomial.coeff_blockHomogenize` (other): Let B and S be finite types, b:S→B assign each affine variable to a block, d:B→ℕ, and R be a commutative ring. Put t_h(e)=Σ_{j:b(j)=h}e_j and A_d(e)=(d_h−t_h(e))_h⊕e. Let H_d(f) denote blockHomogenize b d f. A polynomial is d-bounded when t_h(e)≤d_h for every e in its support and every h. For every exponent u on B⊕S, coeff_u(H_d(f)) equals coeff_{u|S}(f) if u(inl h)+t_h(u|S)=d_h for all h, and equals 0 otherwise. No degree bound on f is needed.

#### Support bijection for block homogenization

**Declaration:** `DiophantineApproximationAndTranscendence:DT.2/block-homogenization-support` (lemma).

If f is d-bounded, A_d is a bijection from supp(f) to supp(H_d(f)), preserving each coefficient. The declared theorem is the support bijection; coefficient preservation is supplied by the preceding coefficient node.

**Construction or proof:**

1. Apply the coefficient formula: a nonzero coefficient on either side corresponds to the unique affine restriction e.
2. A_d is injective by its inr coordinates. The support bound ensures every input coefficient survives. This remains a bijection of empty supports when f=0.

**Dependencies:** `DiophantineApproximationAndTranscendence:DT.2/block-homogenization-coefficients`.

**API:**

- `MvPolynomial.bijOn_support_blockHomogenize` (other): Let B and S be finite types, b:S→B assign each affine variable to a block, d:B→ℕ, and R be a commutative ring. Put t_h(e)=Σ_{j:b(j)=h}e_j and A_d(e)=(d_h−t_h(e))_h⊕e. Let H_d(f) denote blockHomogenize b d f. A polynomial is d-bounded when t_h(e)≤d_h for every e in its support and every h. If f is d-bounded, A_d is a bijection from supp(f) to supp(H_d(f)), preserving each coefficient. The declared theorem is the support bijection; coefficient preservation is supplied by the preceding coefficient node.

#### Dehomogenizing on the unit chart

**Declaration:** `DiophantineApproximationAndTranscendence:DT.2/block-homogenization-dehomogenization` (lemma).

If f is d-bounded, substituting X_h0=1 and retaining the affine variables in H_d(f) gives f as a polynomial over R.

**Construction or proof:**

1. Evaluate each monomial in the defining finite sum with aeval. All homogenizing factors become 1.
2. The degree hypothesis removes the filter; recover f from as_sum. This is a polynomial identity, with no inference from evaluation on a finite coefficient ring.

**Dependencies:** `DiophantineApproximationAndTranscendence:DT.2/block-homogenization`, `mathlib:MvPolynomial.aeval`, `mathlib:MvPolynomial.eval₂_monomial`, `mathlib:MvPolynomial.as_sum`.

**API:**

- `MvPolynomial.aeval_blockHomogenize_one_X` (other): Let B and S be finite types, b:S→B assign each affine variable to a block, d:B→ℕ, and R be a commutative ring. Put t_h(e)=Σ_{j:b(j)=h}e_j and A_d(e)=(d_h−t_h(e))_h⊕e. Let H_d(f) denote blockHomogenize b d f. A polynomial is d-bounded when t_h(e)≤d_h for every e in its support and every h. If f is d-bounded, substituting X_h0=1 and retaining the affine variables in H_d(f) gives f as a polynomial over R.

#### Agreement with univariate homogenization

**Declaration:** `DiophantineApproximationAndTranscendence:DT.2/block-homogenization-univariate` (lemma).

For B=S=Unit and b=id, send an ordinary polynomial p to the one-variable multivariate polynomial using uniqueAlgEquiv⁻¹. Rename inl to 1 and inr to 0 in H_n(p); the result is the native Polynomial.homogenize p n for every p and n, including n below the degree of p.

**Construction or proof:**

1. Compare coefficients under the bijection sending the affine variable to native coordinate 0 and the homogenizing variable to native coordinate 1.
2. The block coefficient formula retains exactly the exponents u₀+u₁=n, and coeff_uniqueAlgEquiv_symm identifies the retained coefficient with p.coeff u₀. Polynomial.coeff_homogenize gives the same coefficient on the other side, also when n is below the degree of p. Finish by coefficient extensionality.

**Dependencies:** `DiophantineApproximationAndTranscendence:DT.2/block-homogenization-coefficients`, `mathlib:MvPolynomial.uniqueAlgEquiv`, `mathlib:MvPolynomial.coeff_uniqueAlgEquiv_symm`, `mathlib:MvPolynomial.rename`, `mathlib:Polynomial.coeff_homogenize`.

**API:**

- `MvPolynomial.rename_blockHomogenize_unique` (other): Let B and S be finite types, b:S→B assign each affine variable to a block, d:B→ℕ, and R be a commutative ring. Put t_h(e)=Σ_{j:b(j)=h}e_j and A_d(e)=(d_h−t_h(e))_h⊕e. Let H_d(f) denote blockHomogenize b d f. A polynomial is d-bounded when t_h(e)≤d_h for every e in its support and every h. For B=S=Unit and b=id, send an ordinary polynomial p to the one-variable multivariate polynomial using uniqueAlgEquiv⁻¹. Rename inl to 1 and inr to 0 in H_n(p); the result is the native Polynomial.homogenize p n for every p and n, including n below the degree of p.

#### Homogeneity in each block

**Declaration:** `DiophantineApproximationAndTranscendence:DT.2/block-homogenization-homogeneous` (lemma).

For every h, H_d(f) is IsWeightedHomogeneous of degree d_h for the indicator weight that is 1 on inl h and on inr j with b(j)=h, and 0 elsewhere. This holds for all f, since overdegree terms were filtered.

**Construction or proof:**

1. A nonzero output coefficient satisfies the block equality in the coefficient node.
2. Unfold the native weighted-homogeneous predicate and express its weight as the homogenizing exponent plus the sum of affine exponents in the block.

**Dependencies:** `DiophantineApproximationAndTranscendence:DT.2/block-homogenization-coefficients`, `mathlib:MvPolynomial.IsWeightedHomogeneous`.

**API:**

- `MvPolynomial.isWeightedHomogeneous_blockHomogenize` (other): Let B and S be finite types, b:S→B assign each affine variable to a block, d:B→ℕ, and R be a commutative ring. Put t_h(e)=Σ_{j:b(j)=h}e_j and A_d(e)=(d_h−t_h(e))_h⊕e. Let H_d(f) denote blockHomogenize b d f. A polynomial is d-bounded when t_h(e)≤d_h for every e in its support and every h. For every h, H_d(f) is IsWeightedHomogeneous of degree d_h for the indicator weight that is 1 on inl h and on inr j with b(j)=h, and 0 elsewhere. This holds for all f, since overdegree terms were filtered.

#### Reconstruction from an affine chart

**Declaration:** `DiophantineApproximationAndTranscendence:DT.2/block-homogeneous-reconstruction` (lemma).

If F on B⊕S is IsWeightedHomogeneous of degree d_h for every block indicator, then H_d(F(1,Y))=F.

**Construction or proof:**

1. For an exponent u with nonzero coefficient in F, homogeneity forces u(inl h)=d_h−t_h(u|S) and t_h(u|S)≤d_h.
2. Thus the affine restrictions of distinct surviving exponents are distinct. Dehomogenization neither collides nor cancels these coefficients, and all resulting exponents are d-bounded.
3. The coefficient formula for H_d reconstructs every coefficient of F.

**Dependencies:** `DiophantineApproximationAndTranscendence:DT.2/block-homogenization-coefficients`, `mathlib:MvPolynomial.IsWeightedHomogeneous`, `mathlib:MvPolynomial.aeval`, `mathlib:MvPolynomial.eval₂_monomial`, `mathlib:MvPolynomial.as_sum`.

**API:**

- `MvPolynomial.blockHomogenize_aeval_one_X` (other): Let B and S be finite types, b:S→B assign each affine variable to a block, d:B→ℕ, and R be a commutative ring. Put t_h(e)=Σ_{j:b(j)=h}e_j and A_d(e)=(d_h−t_h(e))_h⊕e. Let H_d(f) denote blockHomogenize b d f. A polynomial is d-bounded when t_h(e)≤d_h for every e in its support and every h. If F on B⊕S is IsWeightedHomogeneous of degree d_h for every block indicator, then H_d(F(1,Y))=F.

#### Centered homogeneous Taylor expansion

**Declaration:** `DiophantineApproximationAndTranscendence:DT.2/block-homogeneous-centered-taylor` (lemma).

Suppose f is d-bounded and a:S→R. Write Γ_d={γ:S→₀ℕ | ∀h t_h(γ)≤d_h}, a finite set (each γ_j≤d_b(j)). Then H_d(f)=Σ_{γ∈Γ_d} (D^γf)(a) ∏_h X_h0^{d_h−t_h(γ)} ∏_j(Y_j−a_j X_b(j),0)^{γ_j}, as a polynomial over R. D is the inherited Hasse derivative.

**Construction or proof:**

1. The inherited coefficient formula makes D^γf zero outside Γ_d: every coefficient would come from an exponent ν+γ whose block sum exceeds a bound.
2. Use the inherited Taylor formula in a polynomial coefficient ring, commuting Hasse derivatives with the coefficient map R→R[Y]. Set its center to the constants a and its increment to Y−a, to obtain a polynomial identity for f; pointwise equality over R alone is not used.
3. Native weighted homogeneity of X and C, followed by sub, mul, pow and sum, proves that every term and the whole displayed expression have degree d_h in block h. Substitution X_h0=1 gives the polynomial Taylor identity. Apply homogeneous reconstruction to this expression and the chart identity of H_d(f).

**Dependencies:** `DiophantineApproximationAndTranscendence:DT.2/block-homogenization-dehomogenization`, `DiophantineApproximationAndTranscendence:DT.2/block-homogenization-homogeneous`, `DiophantineApproximationAndTranscendence:DT.2/block-homogeneous-reconstruction`, `DiophantineApproximationAndTranscendence:DT.1/multivariate-taylor-expansion`, `DiophantineApproximationAndTranscendence:DT.1/multivariate-hasse-derivative-coefficients`, `DiophantineApproximationAndTranscendence:DT.1/multivariate-hasse-derivative-commutes-with-ring-maps`, `mathlib:Finsupp.instLocallyFiniteOrder`, `mathlib:add_pow`, `mathlib:MvPolynomial.isWeightedHomogeneous_X`, `mathlib:MvPolynomial.isWeightedHomogeneous_C`, `mathlib:MvPolynomial.IsWeightedHomogeneous.sub`, `mathlib:MvPolynomial.IsWeightedHomogeneous.mul`, `mathlib:MvPolynomial.IsWeightedHomogeneous.pow`, `mathlib:MvPolynomial.IsWeightedHomogeneous.sum`.

**API:**

- `MvPolynomial.blockHomogenize_centered_taylor` (other): Let B and S be finite types, b:S→B assign each affine variable to a block, d:B→ℕ, and R be a commutative ring. Put t_h(e)=Σ_{j:b(j)=h}e_j and A_d(e)=(d_h−t_h(e))_h⊕e. Let H_d(f) denote blockHomogenize b d f. A polynomial is d-bounded when t_h(e)≤d_h for every e in its support and every h. Suppose f is d-bounded and a:S→R. Write Γ_d={γ:S→₀ℕ | ∀h t_h(γ)≤d_h}, a finite set (each γ_j≤d_b(j)). Then H_d(f)=Σ_{γ∈Γ_d} (D^γf)(a) ∏_h X_h0^{d_h−t_h(γ)} ∏_j(Y_j−a_j X_b(j),0)^{γ_j}, as a polynomial over R. D is the inherited Hasse derivative.

#### Triangular formula for homogeneous Hasse jets

**Declaration:** `DiophantineApproximationAndTranscendence:DT.2/block-homogeneous-hasse-jets` (lemma).

Suppose f is d-bounded, a:S→R, κ:B→₀ℕ and β:S→₀ℕ. At q=(1,a), D^{κ⊕β}H_d(f)(q) equals the sum over γ∈Γ_d with β≤γ and t_h(γ−β)≤κ_h for every h of (D^γf)(a) times ∏_j binom(γ_j,β_j)(−a_j)^{γ_j−β_j} times ∏_h binom(d_h−t_h(γ), κ_h−t_h(γ−β)). Natural binomial coefficients are mapped to R. Every contributing γ has t_h(γ)≤κ_h+t_h(β).

**Construction or proof:**

1. In centered homogeneous Taylor, substitute X_h0=1+U_h and Y_j=a_j+V_j. The centered linear factors become V_j−a_j U_b(j).
2. For the coefficient of U^κV^β, choose V_j^{β_j} from each centered factor. This forces β≤γ and contributes binom(γ_j,β_j)(−a_j)^{γ_j−β_j}, together with U_h-exponent t_h(γ−β).
3. The remaining U_h exponent must be κ_h−t_h(γ−β); choosing it from (1+U_h)^{d_h−t_h(γ)} gives the last binomial. Terms with excessive forced U_h exponent contribute zero and must be excluded before subtraction.
4. Identify the translated coefficient with the Hasse jet by the inherited polynomial Taylor formula over a polynomial coefficient ring. The total-order inequality follows by summing γ=β+(γ−β).

**Dependencies:** `DiophantineApproximationAndTranscendence:DT.2/block-homogeneous-centered-taylor`, `DiophantineApproximationAndTranscendence:DT.1/multivariate-taylor-expansion`, `DiophantineApproximationAndTranscendence:DT.1/multivariate-hasse-derivative-commutes-with-ring-maps`, `mathlib:MvPolynomial.coeff_mul`, `mathlib:add_pow`.

**API:**

- `MvPolynomial.eval_hasseDeriv_blockHomogenize` (other): Let B and S be finite types, b:S→B assign each affine variable to a block, d:B→ℕ, and R be a commutative ring. Put t_h(e)=Σ_{j:b(j)=h}e_j and A_d(e)=(d_h−t_h(e))_h⊕e. Let H_d(f) denote blockHomogenize b d f. A polynomial is d-bounded when t_h(e)≤d_h for every e in its support and every h. Suppose f is d-bounded, a:S→R, κ:B→₀ℕ and β:S→₀ℕ. At q=(1,a), D^{κ⊕β}H_d(f)(q) equals the sum over γ∈Γ_d with β≤γ and t_h(γ−β)≤κ_h for every h of (D^γf)(a) times ∏_j binom(γ_j,β_j)(−a_j)^{γ_j−β_j} times ∏_h binom(d_h−t_h(γ), κ_h−t_h(γ−β)). Natural binomial coefficients are mapped to R. Every contributing γ has t_h(γ)≤κ_h+t_h(β).

**Unit tests:**

- `MvPolynomial.test_blockHomogenize_cross_jet` (non-example): Over ℚ, F=Y²−X₀Y has ∂F/∂X₀(1,1)=−1 while f(1)=0. Thus the source’s printed restriction to affine order β=0 when the homogeneous order is (1,0) is false.

#### Pure affine jets on the chart

**Declaration:** `DiophantineApproximationAndTranscendence:DT.2/block-homogeneous-affine-jets` (lemma).

For d-bounded f, a:S→R and every β:S→₀ℕ, D^{0⊕β}H_d(f)(1,a)=D^βf(a).

**Construction or proof:**

1. Apply the triangular formula with κ=0. Nonnegative terms and the block partition force γ−β=0, hence γ=β, and all surviving binomial factors equal 1.
2. If β lies outside Γ_d, the sum is empty and D^βf=0 by the inherited coefficient formula and the support bound.

**Dependencies:** `DiophantineApproximationAndTranscendence:DT.2/block-homogeneous-hasse-jets`, `DiophantineApproximationAndTranscendence:DT.1/multivariate-hasse-derivative-coefficients`.

**API:**

- `MvPolynomial.eval_hasseDeriv_blockHomogenize_inr` (other): Let B and S be finite types, b:S→B assign each affine variable to a block, d:B→ℕ, and R be a commutative ring. Put t_h(e)=Σ_{j:b(j)=h}e_j and A_d(e)=(d_h−t_h(e))_h⊕e. Let H_d(f) denote blockHomogenize b d f. A polynomial is d-bounded when t_h(e)≤d_h for every e in its support and every h. For d-bounded f, a:S→R and every β:S→₀ℕ, D^{0⊕β}H_d(f)(1,a)=D^βf(a).

#### Transport of strict jet thresholds

**Declaration:** `DiophantineApproximationAndTranscendence:DT.2/block-homogeneous-strict-vanishing` (lemma).

Assume every d_h>0, f is d-bounded, a:S→R, and T∈[0,∞]. Homogeneous Hasse jets of H_d(f) at (1,a) vanish for every order i of weight Σ_v i_v/d_block(v)<T if and only if affine Hasse jets of f at a vanish for every γ of weight Σ_j γ_j/d_b(j)<T. Each homogenizing variable has its block’s weight d_h.

**Construction or proof:**

1. For the forward implication use pure affine jets; adding zero homogenizing orders leaves the weight unchanged.
2. For the converse split i into κ⊕β and use the triangular formula. Each term has t_h(γ)≤κ_h+t_h(β), so its affine weight is no greater than the homogeneous weight and is strictly below T.
3. The affine vanishing premise kills every term. Positive d_h makes the finite-weight division and block regrouping valid. The argument also works for T=0 and T=∞ and for f=0.

**Dependencies:** `DiophantineApproximationAndTranscendence:DT.2/block-homogeneous-hasse-jets`, `DiophantineApproximationAndTranscendence:DT.2/block-homogeneous-affine-jets`.

**API:**

- `MvPolynomial.blockHomogenize_strict_vanishing_iff` (other): Let B and S be finite types, b:S→B assign each affine variable to a block, d:B→ℕ, and R be a commutative ring. Put t_h(e)=Σ_{j:b(j)=h}e_j and A_d(e)=(d_h−t_h(e))_h⊕e. Let H_d(f) denote blockHomogenize b d f. A polynomial is d-bounded when t_h(e)≤d_h for every e in its support and every h. Assume every d_h>0, f is d-bounded, a:S→R, and T∈[0,∞]. Homogeneous Hasse jets of H_d(f) at (1,a) vanish for every order i of weight Σ_v i_v/d_block(v)<T if and only if affine Hasse jets of f at a vanish for every γ of weight Σ_j γ_j/d_b(j)<T. Each homogenizing variable has its block’s weight d_h.

#### Affine and homogeneous indices agree

**Declaration:** `DiophantineApproximationAndTranscendence:DT.2/block-homogeneous-weighted-index` (theorem).

If every d_h>0 and f is d-bounded, weightedIndex with weights d_h on homogenizing variables and d_b(j) on affine variables at (1,a) of H_d(f) equals weightedIndex with weights d_b(j) at a of f. The zero polynomial has index ∞ on both sides.

**Construction or proof:**

1. Apply the existing weighted-index vanishing characterization on each side at an arbitrary threshold T.
2. The strict-vanishing transport makes the lower sets of the two indices equal. Specialize to each index and use antisymmetry. No attainment argument, factorial division, or characteristic-zero assumption is needed.

**Dependencies:** `DiophantineApproximationAndTranscendence:DT.2/block-homogeneous-strict-vanishing`, `DiophantineApproximationAndTranscendence:DT.1/weighted-index-vanishing-characterisation`.

**API:**

- `MvPolynomial.weightedIndex_blockHomogenize` (other): Let B and S be finite types, b:S→B assign each affine variable to a block, d:B→ℕ, and R be a commutative ring. Put t_h(e)=Σ_{j:b(j)=h}e_j and A_d(e)=(d_h−t_h(e))_h⊕e. Let H_d(f) denote blockHomogenize b d f. A polynomial is d-bounded when t_h(e)≤d_h for every e in its support and every h. If every d_h>0 and f is d-bounded, weightedIndex with weights d_h on homogenizing variables and d_b(j) on affine variables at (1,a) of H_d(f) equals weightedIndex with weights d_b(j) at a of f. The zero polynomial has index ∞ on both sides.

**Unit tests:**

- `MvPolynomial.test_blockHomogenize_index_boundary` (computation): For f=y²−y at a=1 and degree 2 over ℚ, both indices equal 1/2; derivatives of weight exactly 1/2 need not vanish.
- `MvPolynomial.test_blockHomogenize_positive_characteristic` (non-example): Over 𝔽₂, D²(y²−1)(1)=1, although the ordinary second derivative is 0. Hasse derivatives are necessary for the characteristic-free statement.

#### Coefficient height under homogenization

**Declaration:** `DiophantineApproximationAndTranscendence:DT.2/block-homogeneous-coefficient-height` (lemma).

Let K be a number field in place of R. For nonzero d-bounded f, H₂ of the coefficient vector of H_d(f), indexed by its nonzero coefficient support, equals H₂ of the coefficient vector of f. This is the Euclidean-at-infinite-places coefficient height; no max-height substitution occurs.

**Construction or proof:**

1. The support bijection and coefficient formula identify the two finite nonzero coefficient families by a permutation.
2. Apply the existing H₂ zero-extension theorem to this bijection. Nonzero f ensures a nonempty source support and nonzero coefficient vector.

**Dependencies:** `DiophantineApproximationAndTranscendence:DT.2/block-homogenization-support`, `DiophantineApproximationAndTranscendence:DT.2/block-homogenization-coefficients`, `DiophantineApproximationAndTranscendence:DT.2/height2-zero-extension`.

**API:**

- `DiophantineApproximation.height2_coeff_blockHomogenize` (other): Let B and S be finite types, b:S→B assign each affine variable to a block, d:B→ℕ, and R be a commutative ring. Put t_h(e)=Σ_{j:b(j)=h}e_j and A_d(e)=(d_h−t_h(e))_h⊕e. Let H_d(f) denote blockHomogenize b d f. A polynomial is d-bounded when t_h(e)≤d_h for every e in its support and every h. Let K be a number field in place of R. For nonzero d-bounded f, H₂ of the coefficient vector of H_d(f), indexed by its nonzero coefficient support, equals H₂ of the coefficient vector of f. This is the Euclidean-at-infinite-places coefficient height; no max-height substitution occurs.

#### Source corrections and acceptance

The author copy and published version are separately hashed in the packet.
The read scope is author pp. 1–9 and 28–33, and published pp. 217–222, 242,
244–247. The main parts of §§2–4 are not covered by that reading. These new
source findings await independent verification:

- **E217**, §1, published pp. 217–218 and 221 (physical pp. 3–4 and 7); author pp. 3–4 and 8: index definition, derivative locus and affine index. In the definition by the largest vanishing threshold and the associated jet equations, use weighted order <σ. Define the zero polynomial’s index to be ∞. For F=X₁₁, d₁=1 and point (1:0), the first nonzero derivative has weight 1. The printed condition holds for every σ<1 and fails at σ=1, so there is no largest admissible threshold. Strict-below vanishing gives index 1 and agrees with the packet’s existing weightedIndex. E216 records this mechanism in a different paper (Evertse 1996), so it does not cover the present source.
- **E218**, §1, published p. 217 derivative definition and p. 221 affine Remark; author pp. 3 and 8. Start the derivative product at h=1; end the h-th homogeneous variable block at X_h,n_h. The blocks are numbered 1,…,m and the h-th block has n_h+1 variables. Both intended index sets are stated immediately before the misprints.
- **E219**, §1 Remark, published p. 222 (physical p. 8), first paragraph; author p. 8. Published page visually checked. Replace the coordinatewise affine derivative bound by Σ_{j≥1}k_hj≤Σ_{j≥0}i_hj separately in each block. The triangular Hasse-jet formula in this checkpoint proves this sufficient total-order bound on the chart X_h0=1. In characteristic zero, ordinary derivatives have the same vanishing orders because their factorial factors are nonzero. Take one block, F=X₁²−X₀X₁, f(y)=y²−y, homogeneous order i=(1,0), and point (X₀,X₁)=(1,1). Then ∂F/∂X₀=−1 at the point, whereas the printed bound permits only k=0 and f(1)=0. Coefficients with denominators powers of X₀ are regular at this point and cannot fix the contradiction. The corrected block-total bound permits the needed first affine derivative and proves equality of the indices.
- **E220**, Corollary, published pp. 219–220 (physical pp. 5–6); author p. 6. Require 0<ε≤M+1. The hypotheses and conclusions contain division by ε, and the proof applies Theorems 1 and 2 with ε′=ε/(M+1)>0. With the corrected strict index convention Z₀ is the whole product, so the proper-product conclusion is not an ε=0 statement. The printed division at ε=0 is undefined; this is not a counterexample satisfying a defined zero-parameter premise.
- **E221**, §5, proof of Lemma 11, published p. 245 (physical p. 31), first displayed dimension chain proving (5.2); author p. 30. Replace Z′ by Z in this term. Rank-nullity on T gives dim T−dim V_{ {1}∪i}=dim π_{ {1}∪i}(Z). For Z=(ℙ¹)², Z′={Q}×ℙ¹ and i={2}, the printed intermediate equality reads 1=1−1; the corrected one reads 1=2−1. The asserted conclusion (5.2) is unchanged.
- **E222**, §5, proof of Theorem 3, published pp. 245–246 (physical pp. 31–32); author pp. 31–32. Published p. 246 visually checked. Use the weak ratio bound ≥ stated in (1.11). In the numerical contradiction retain the factor s in (ms/ε′)^s, or bound it by (m²(m+1)/ε)^s using s≤m and ε′=ε/(m+1). The dropped factor is not supplied by ε′=ε/(m+1). Under the stated weak ratio hypothesis the corrected upper bound is (m²(m+1)/ε)^s(2m³/ε)^{−s}=((m+1)/(2m))^s<1 for m≥2 and s≥1. Since 2m³/ε>1 and Ση_i≥s, the ratio-product estimate still gives the contradiction. The theorem’s strict height premise (1.12) is unchanged; this correction does not by itself prove the ≥ height boundary used in Evertse 1996.
- **E223**, Author copy p. 28 lower bound in proof of Theorem 2, and p. 33 reference [12]; compare published pp. 242 and 247 (physical pp. 28 and 33). Use δ_m and the year 1955. Both are already correct in the published version. The factors in the next line cancel only with δ_m; the published proof prints that index. The published reference [12] dates Roth’s paper 1955, agreeing with the historical discussion in §1. These are findings about the author copy, not about the version of record.
- **E224**, Proof of Theorem 2, published p. 242 (physical p. 28), binomial coefficient bound preceding (4.12), visually checked; author p. 28. Start the inner sum at j=0. Then the product of all binomial coefficients is at most 2^{Σ_hΣ_{j=0}^{n_h}l_hj}=2^{d₁+⋯+d_m}. With a single block, exponent (l₀,l₁)=(2,0) and derivative order (i₀,i₁)=(1,0), the product of binomial coefficients is 2, while the printed intermediate upper bound is 1. Including j=0 restores the standard binomial bound and leaves the final coefficient-height estimate (4.12) unchanged.

Acceptance requires the exact native univariate comparison, support and H₂
preservation, polynomial centered Taylor identity, block-total triangular
jet bound and strict-threshold equality, including the zero polynomial.
The suggested file contains eleven additional typed examples: eight tests
of the new definition and three tests of the jet/index conventions. No new
planet is added; the inherited planet selection and restructuring proposals
are unchanged.

The remaining sharp-Roth work is the geometric and arithmetic intersection
proof, including multiplicities, heights and the §5 projection argument.
The strict height premise in 1995 Theorem 3, (1.12), must also be reconciled
explicitly with the inherited 1996 signature using a weak height inequality.
The closed affine comparison supplies no replacement for those inputs.

## DT.3 — Transcendence and logarithmic forms

This layer proves the classical transcendence theorems about the exponential function and the
lower bounds for linear forms in logarithms that the effective Diophantine layers consume. Four
developments make up the layer.

- **Exponentials of algebraic numbers.** It proves Hermite's theorem, the Lindemann–Weierstrass
  theorem in Baker's form and its consequences: transcendence of e^α and π, and algebraic
  independence of exponentials. It also states Schanuel's conjecture as a proposition.
- **Gelfond–Schneider.** Two proofs: Schneider's for real α and β, and Gelfond's for arbitrary
  logarithms.
- **Baker's theorem (1966).** ℚ-linearly independent logarithms of algebraic numbers are linearly
  independent over ℚ̄ together with 1. It is proved through the Schneider–Lang criterion for
  Cartesian products (Bertrand–Masser).
- **Explicit lower bounds.** Baker's 1975 bound, Matveev's explicit bound (archimedean,
  logarithmic and multiplicative forms, number-field and rational versions), the
  Laurent–Mignotte–Nesterenko bound for two logarithms, and Yu's p-adic bound with its rational
  specialisation.

**Sources.**
- The primary source is Evertse's Leiden notes *Diophantine Approximation* (2019), Chapter 4
  (all of it) and Chapter 5, §5.1, §5.4 and Exercises 5.4 and 5.9.
- Where Evertse states results without proof, the layer follows public primary sources:
  - Waldschmidt, *Diophantine Approximation on Linear Algebraic Groups* (Springer GL 326; the
    author posts the full text): Chapter 4 for Baker's theorem, Theorem 9.1 for the measure of
    linear independence;
  - Karatarakis–Wiedijk (arXiv:2603.24823) and Soundararajan's Stanford notes for Gelfond's
    method;
  - Matveev, Izv. Math. 64 (2000), Corollary 2.3;
  - Bugeaud–Mignotte–Siksek, Annals 163 (2006), Theorem 9.4;
  - Yu, Compositio 91 (1994), §0.1, and 74 (1990), Lemma 1.4.
- Schmidt's LNM 785 is not public and is not needed here.

Suggested home: TauCeti/NumberTheory/Transcendental/ for the arithmetic, with two analytic
libraries:
- TauCeti/Analysis/Complex/ZeroExtrapolation (one variable);
- TauCeti/Analysis/Complex/SeveralVariables/ (Cartesian products).

**Existing work.**
- Mathlib already contains the analytic step of the Lindemann–Weierstrass proof
  (LindemannWeierstrass.exp_polynomial_approx) and Siegel's lemma over the ring of integers
  (NumberField.house.exists_ne_zero_int_vec_house_le); the first is by Zhao, the second by
  Karatarakis.
- The open Mathlib pull request #28013 (Yuyang Zhao) proves linearIndependent_exp,
  algebraicIndependent_exp, transcendental_exp, transcendental_e, transcendental_pi and
  transcendental_log by Jacobson's route. This layer uses exactly those names and signatures, so
  that the Tau Ceti declarations can be deleted in favour of Mathlib's once the pull request
  lands.
- Karatarakis and Wiedijk formalised Gelfond–Schneider on a mathlib branch by Gelfond's method.
  The principal-branch statement here carries their name,
  transcendental_cpow_of_isAlgebraic_of_irrational.

### Conventions

- **Algebraic numbers.** "Algebraic" means algebraic over ℚ. This is equivalent to algebraic
  over ℤ for complex numbers (IsAlgebraic.restrictScalars). The field of algebraic numbers
  inside ℂ is Mathlib's integralClosure ℚ ℂ, written ℚ̄, as in the Mathlib pull request.
  Transcendence statements use Mathlib's Transcendental. The predicates AlgebraicIndependent and
  Algebra.trdeg are Mathlib's too.
- **Logarithms.** A logarithm of α ∈ ℂ^× is any λ ∈ ℂ with e^λ = α. The logarithms of α form a
  coset λ + 2πiℤ. The layer works throughout with the ℚ-vector space 𝓛 = {λ : e^λ algebraic}
  (Transcendence.algebraicLogs, defined below).
  - Every qualitative theorem is stated for arbitrary elements of 𝓛. The principal branch
    enters only in corollaries.
  - The principal branch is Mathlib's Complex.log, with log z = log|z| + i·arg z and
    −π < arg z ≤ π. Complex.cpow is x^y = exp(log x · y) for x ≠ 0.
  - Corollaries on the principal branch: transcendental_cpow_of_isAlgebraic_of_irrational,
    Evertse's Corollary 5.3, Bugeaud–Mignotte–Siksek's Theorem 9.4, and the condition on
    log α_j in Yu's theorem.
  - Changing a branch changes a linear form by an integer multiple of 2πi. A bound for one
    choice of logarithms says nothing about another, so every statement carries its logarithms
    as data.
- **Heights.**
  - h is the absolute logarithmic Weil height, Mathlib's NumberField.absLogHeight₁, and
    H_abs = e^h is NumberField.absMulHeight₁.
  - For a rational number x/y in lowest terms, H_abs = max(|x|, |y|) (Rat.mulHeight₁_eq_max).
  - Evertse's naive height H is the maximum absolute value of the coefficients of the primitive
    minimal polynomial. It comes from DiophantineApproximationAndTranscendence:DT.0
    (naive-height-of-algebraic-number). It compares with the absolute height by
    2^{−d}H ≤ H_abs^d ≤ √(d+1)·H (DT.0, height-comparisons).
  - Lower bounds are stated with H_abs. The naive-height forms follow at the cost of a constant
    depending only on the degree bound.
- **House, norm and denominators.**
  - house(α) = max_σ |σ(α)| is Mathlib's NumberField.house.
  - The norm is Algebra.norm.
  - Common denominators come from Algebra.IsAlgebraic.exists_integral_multiples.
  - The basic inequality of the whole layer is the **size inequality**: for x ≠ 0 in a number
    field of degree d with m·x integral, 1 ≤ m^d·|σ(x)|·house(x)^{d−1}.
- **Several variables.** ℂ^n is Fin n → ℂ with Mathlib's sup norm, |z| = max|z_i|, and
  ‖z‖ = Σ|z_i|. For σ ∈ ℕ^n, |σ| = max σ_i, ‖σ‖ = Σσ_i and σ! = ∏σ_i!. For an entire f,
  |f|_R = sup_{|z|≤R} |f(z)|. Bounds on |f|_R are carried as hypotheses of the form "for all z
  with |z| ≤ R, |f(z)| ≤ M", following Mathlib's usage; no sup-norm predicate is introduced.
- **p-adic statements.**
  - All p-adic lower bounds are stated multiplicatively, as lower bounds for |α^b − 1|_𝔭 or
    upper bounds for ord_𝔭(α^b − 1). This is how Yu states them, and it requires no choice of
    p-adic logarithm.
  - The translation into a linear form in p-adic logarithms (Yu 1990, Lemma 1.4) is a
    conversion lemma of DT.4. It is valid once ord_p(α − 1) > 1/(p − 1), where no branch
    choice arises.
  - The branch log_p(p) = 0 of the p-adic logarithm belongs to ColemanIntegration:L0.
  - The qualitative p-adic independence theorem of Baker–Brumer belongs to
    IntegralIwasawaTheory:L4.
- **Effectivity.** "Effectively computable" is a property of proofs, not of statements.
  - The Lean statements of Baker's 1975 bound and of Evertse's Corollary 5.3 are existential in
    the constant.
  - Effectivity is delivered by the explicit theorems that feed them: Waldschmidt's Theorem 9.1
    with C(m) = 2^{m+25}m^{3m+9}, Matveev's C_1(n) and Yu's Φ.
  - A finite search (DT.4, EffectiveDiophantineMethods:ED.2) must use an explicit theorem.
- **Nonvanishing.** Every lower bound has the hypothesis Λ ≠ 0 (or α^b ≠ 1) and says nothing
  when it fails. A complex bound is never used p-adically, nor the reverse.

### Baseline

The layer builds on the following Mathlib declarations, each read at the pinned commit.

- **Lindemann–Weierstrass, analytic step:** LindemannWeierstrass.integral_exp_mul_eval and
  exp_polynomial_approx.
- **Iterated derivatives of polynomials:** Polynomial.sumIDeriv, sumIDeriv_map,
  aeval_iterate_derivative_self, aeval_iterate_derivative_of_lt and
  exists_iterate_derivative_eq_factorial_smul.
- **Heights, house and norm:**
  - NumberField.house and its API: house_mul_le, house_add_le, house_pow_le, house_nat_mul,
    norm_embedding_le_house, house_eq_sup';
  - NumberField.norm_norm_le_norm_mul_house_pow and NumberField.exists_conjugate_one_le_norm;
  - Algebra.norm, Algebra.isIntegral_norm, Algebra.norm_ne_zero_iff and Algebra.norm_algebraMap.
- **Siegel's lemma** over 𝓞_K: NumberField.house.exists_ne_zero_int_vec_house_le.
- **Exponential and logarithm:** Complex.exp, Complex.log, Complex.cpow, Complex.expMonoidHom,
  Complex.exp_eq_exp_iff_exists_int and Complex.norm_log_one_add_half_le_self.
- **One-variable complex analysis:**
  - maximum modulus: Complex.norm_le_of_forall_mem_frontier_norm_le;
  - Cauchy estimates: Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le;
  - dslope and Complex.differentiableOn_dslope;
  - orders of vanishing: analyticOrderAt with analyticOrderAt_mul and its derivative
    characterisations;
  - the identity theorem;
  - Rolle's theorem, exists_deriv_eq_zero.
- **Algebra:**
  - Dedekind's independence of characters, linearIndependent_monoidHom;
  - AddMonoidAlgebra.lift, mapDomainRingEquiv, mapRingEquiv, and the no-zero-divisor instance
    for group algebras of groups with unique sums, with the fact that ℚ-vector spaces have
    unique sums;
  - Galois theory: splitting fields are Galois; AlgHom.restrictNormal';
  - discriminants: Algebra.discr_not_zero_of_basis and
    Algebra.discr_eq_det_embeddingsMatrixReindex_pow_two;
  - transcendence bases: Algebra.IsAlgebraic.isTranscendenceBasis_of_le_trdeg_of_finite and
    Algebra.IsAlgebraic.trdeg_le_cardinalMk.
- **Lifting the exponent:** Int.emultiplicity_pow_sub_pow and Int.two_pow_sub_pow'.
- **p-adic norms and absolute values:** padicNorm and the 𝔭-adic absolute value
  IsDedekindDomain.HeightOneSpectrum.adicAbv.

Mathlib has neither the Lindemann–Weierstrass theorem, nor the transcendence of e or π, nor
Gelfond–Schneider, Baker's theorem, any explicit linear-form bound, or a p-adic logarithm.

### DT.3a. Exponentials of algebraic numbers

**The space of logarithms 𝓛.** Transcendence.algebraicLogs is the ℚ-submodule
{λ ∈ ℂ : IsAlgebraic ℚ (exp λ)} of ℂ.

- *Why it is a submodule.* Closure under addition follows from e^{λ+μ} = e^λe^μ. Closure under
  q = a/b ∈ ℚ holds because (e^{qλ})^b = (e^λ)^a is algebraic, so e^{qλ} is algebraic.
- *API:*
  - mem_algebraicLogs (the membership criterion);
  - log_mem_algebraicLogs (Complex.log α ∈ 𝓛 for algebraic α ≠ 0);
  - mem_algebraicLogs_iff_exists_int (λ ∈ 𝓛 iff λ = log α + 2πik for some algebraic α ≠ 0 and
    k ∈ ℤ);
  - intCast_mul_two_pi_I_mem_algebraicLogs;
  - conj_mem_algebraicLogs;
  - ofReal_log_mem_algebraicLogs (real logarithms of positive rationals).
- *Unit tests:*
  - 0 ∈ 𝓛;
  - πi ∈ 𝓛;
  - 2πi ∈ 𝓛 although 2πi is not a principal logarithm, which rules out a definition by
    principal logarithms;
  - log 2 ∈ 𝓛 and equals Complex.log 2;
  - 1 ∉ 𝓛, because e is transcendental, which rules out confusing 𝓛 with ℚ̄.

**Hermite's theorem** (transcendental_e; Evertse Theorem 4.1). e is transcendental.
- *Proof outline.*
  - An integer relation q_0 + q_1e + ⋯ + q_ne^n = 0 may be taken with q_0 ≠ 0.
  - Mathlib's exp_polynomial_approx, applied to (X − 1)⋯(X − n), packages Evertse's Lemmas 4.2,
    4.4, 4.5 and the estimate of 4.7. It gives integers n_p prime to p and integer polynomials
    g_p with |n_pe^a − p·g_p(a)| ≤ c^p/(p − 1)! for a = 1, …, n.
  - The integer n_pq_0 + pΣq_ag_p(a) is prime to p (Lemma 4.6) but smaller than 1 for large p.
- *Relation to Lindemann–Weierstrass.* Transcendental ℤ (Real.exp 1) follows. The theorem is
  also the case a = 1 of Hermite–Lindemann below; the separate proof is Evertse's §4.1 and uses
  no Galois theory.

**Hermite's integral.** LindemannWeierstrass.hermiteIntegral f z is
F_f(z) = z∫₀¹e^{z(1−t)}f(zt)dt, for a complex polynomial f.
- *Characterisation* (hermiteIntegral_eq_sumIDeriv; Evertse Lemma 4.2):
  F_f(z) = e^z·(Σ_j f^{(j)})(0) − (Σ_j f^{(j)})(z).
- *Estimate* (norm_hermiteIntegral_le; Lemma 4.4): if |f(u)| ≤ C for |u| ≤ |z|, then
  |F_f(z)| ≤ |z|e^{|z|}C.
- *API:* linearity (hermiteIntegral_add, hermiteIntegral_smul), hermiteIntegral_zero_right, and
  hermiteIntegral_C (F_c(z) = c(e^z − 1)).
- *Unit tests:*
  - F_1(z) = e^z − 1;
  - F_X(1) = e − 2;
  - F_f(0) = 0;
  - F_X(1) ≠ ∫₀¹e^u·u du, which rules out the wrong kernel;
  - agreement with the expression of LindemannWeierstrass.integral_exp_mul_eval.
- *Sums over a relation* (sum_mul_hermiteIntegral_eq; Corollary 4.3, Lemma 4.12(i)): if
  Σδ_je^{γ_j} = 0, then Σδ_jF_f(γ_j) = −Σδ_j(Σ_i f^{(i)})(γ_j).

**Formal exponential sums.** For an intermediate field L of ℂ/ℚ, the group algebra
L[L] = AddMonoidAlgebra L L has elements Σδ_γ[γ] with [γ][γ'] = [γ + γ'].
- *Evaluation* (LindemannWeierstrass.expEval L). This is the L-algebra homomorphism
  L[L] → ℂ with [γ] ↦ e^γ, the lift of the character γ ↦ e^γ.
  - *API:* expEval_single, expEval_apply (the sum formula), expEval_mul, expEval_algebraMap.
  - *Unit tests:*
    - [0] ↦ 1;
    - [γ][γ'] ↦ e^{γ+γ'};
    - for L = ℂ, [πi] ↦ −1;
    - for L = ℂ the map has a kernel ([0] − [2πi]); the Lindemann–Weierstrass theorem says the
      kernel vanishes on ℚ̄[ℚ̄];
    - agreement with AddMonoidAlgebra.lift.
- *Galois conjugation* (LindemannWeierstrass.galConj τ, for τ ∈ Gal(L/ℚ)). This is the ring
  automorphism Σδ_γ[γ] ↦ Στ(δ_γ)[τγ], composed from mapDomainRingEquiv and mapRingEquiv. An
  element fixed by every galConj τ is exactly Evertse's datum of Theorem 4.11: each τ permutes
  the pairs (γ_k, δ_k).
  - *API:*
    - galConj_single and coeff_galConj ((galConj τ x) at τγ equals τ(x at γ));
    - galConj_refl and galConj_trans;
    - support_galConj;
    - forall_galConj_eq_iff, the fixed-point characterisation;
    - galConj_prod_galConj (the product of all conjugates is fixed).
  - *Unit tests:*
    - rational constants are fixed;
    - on ℚ(i), complex conjugation sends [i]·i to [−i]·(−i);
    - on a quadratic field, [s] + [−s] is fixed when τs = −s;
    - evaluation is not Galois-equivariant: e^{−√2} ≠ e^{√2}.

**Auxiliary polynomials and numbers.** Fix S ⊆ L finite with t = |S|, integers l, p, and γ ∈ S.
- LindemannWeierstrass.auxPoly S l p γ is
  (l^{tp}/(p−1)!)·(X − γ)^{p−1}∏_{γ'≠γ}(X − γ')^p, Evertse's f_k.
  - *API:* natDegree_auxPoly (= tp − 1) and auxPoly_map (Galois transport).
  - *Unit tests:*
    - S = {γ};
    - Hermite's polynomial (4.3) for L = ℚ;
    - {0, 1}, p = 2 gives X³ − 2X² + X;
    - {0}, p = 3 gives X²/2, which is not integral: the factor 1/(p − 1)! must be tracked.
- LindemannWeierstrass.auxValue x l p γ = −Σ_{γ'∈supp x}δ_{γ'}(Σ_j f_γ^{(j)})(γ') is Evertse's
  M_γ, taken in its algebraic form so that Galois automorphisms and norms apply.
  - *API:* integrality and nonvanishing, the Galois relation, the analytic expression and the
    smallness bound (the lemmas below).
  - *Unit tests:*
    - M = −l^p for x = [0];
    - M = 0 for x = 0;
    - M depends on l;
    - the analytic expression.

**The lemmas of Theorem 4.11.** Let L be finite and Galois.
- *Analytic expression* (coe_auxValue_eq_sum_hermiteIntegral; Lemma 4.12(i)): if expEval x = 0,
  then M_γ = Σδ_{γ'}F_{f_γ}(γ').
- *Galois relation* (auxValue_galConj; Lemma 4.12(ii)): for Galois-fixed x, τ(M_γ) = M_{τγ} and
  τγ ∈ supp x.
- *Derivatives* (eval_iterate_derivative_auxPoly; Lemma 4.13). Assume p is prime and lγ' is
  integral for γ' ∈ S. Then:
  - f_γ^{(p−1)}(γ) = A_γ^p with A_γ = l^t∏_{γ'≠γ}(γ − γ') integral;
  - the other derivatives of order < p vanish on S;
  - the derivatives of order ≥ p are p times algebraic integers.
  The last point uses the rescaling (p − 1)!f(X/l) and Mathlib's
  exists_iterate_derivative_eq_factorial_smul.
- *Nonvanishing* (isIntegral_auxValue, auxValue_ne_zero; Lemma 4.14). For primes
  p > |N(δ_γ)N(A_γ)|, M_γ is a nonzero algebraic integer, by the norm argument.
- *Smallness* (norm_auxValue_le; Lemma 4.15, which the source leaves as an exercise):
  |M_γ| ≤ C·c^p/(p − 1)!.

**Weak Lindemann–Weierstrass** (LindemannWeierstrass.expEval_ne_zero_of_forall_galConj_eq;
Theorem 4.11). If L/ℚ is finite Galois and x ∈ L[L] is nonzero and fixed by every Galois
conjugation, then expEval x ≠ 0.
- *Proof outline.* Clear denominators and choose l. For large p, M = M_γ is a nonzero algebraic
  integer all of whose Galois conjugates M_{τγ} have absolute value < 1. This contradicts Lemma
  3.6 in the form "a nonzero algebraic integer of a Galois subfield has a conjugate of absolute
  value at least 1" (Transcendence.exists_one_le_norm_algEquiv, from Mathlib's
  exists_conjugate_one_le_norm and restrictNormal).

**Lindemann–Weierstrass in Baker's form** (linearIndependent_exp; Evertse Theorem 4.8). Let u
be an injective family in ℚ̄. Then (e^{u_i}) is linearly independent over ℚ̄. Equivalently, for
pairwise distinct algebraic α_i and nonzero algebraic β_i, Σβ_ie^{α_i} ≠ 0.
- *Proof outline.*
  - Put all data in a finite Galois field L (Transcendence.exists_isGalois_superset).
  - Form x = Σβ_i[α_i] and P = ∏_τ galConj τ x.
  - P ≠ 0 because L[L] has no zero divisors ((L, +) is a ℚ-vector space, hence has unique
    sums). This replaces Evertse's lexicographic-order argument, which is a unique-sum argument.
  - P is Galois-fixed, and expEval P = 0. This contradicts Theorem 4.11.
- *Hypotheses.* Both hypotheses are essential. Equal exponents give
  (β_1 + β_2)e^{α_1} = 0; transcendental coefficients give e·e^0 − 1·e^1 = 0.

**Corollaries.**
- transcendental_exp (Corollary 4.9(i)): e^a is transcendental for algebraic a ≠ 0.
- transcendental_pi (Corollary 4.9(ii)): π is transcendental, through e^{πi} = −1. This refines
  Mathlib's irrational_pi.
- algebraicIndependent_exp (Corollary 4.10): for ℚ-linearly independent algebraic u, the e^{u_i}
  are algebraically independent over ℚ̄.
- Transcendence.transcendental_of_mem_algebraicLogs (Exercise 4.6(ii)): every nonzero element of
  𝓛 is transcendental. The pull request's transcendental_log is the principal-branch case.

**Schanuel's conjecture** (Transcendence.SchanuelConjecture). This is the proposition: for
every ℚ-linearly independent x ∈ ℂ^n, n ≤ trdeg_ℚ ℚ(x_1, …, x_n, e^{x_1}, …, e^{x_n}).
- *Use.* It is a statement, never an axiom. Results depending on it take it as a hypothesis.
- *API:*
  - SchanuelConjecture.le_trdeg;
  - the unconditional case n = 1 (schanuel_ineq_one);
  - the unconditional case of algebraic x (schanuel_ineq_of_isAlgebraic, from
    algebraicIndependent_exp).
- *Unit tests:*
  - n = 0;
  - x = 1;
  - x = (1, √2);
  - the variant with "pairwise distinct" in place of "linearly independent over ℚ" fails at
    x = (0) (Exercise 4.4).
- *Conditional theorems* (Evertse §4.3), each proved by choosing a transcendence basis among the
  generators:
  - SchanuelConjecture.algebraicIndependent_exp_one_pi: e and π are algebraically independent;
  - SchanuelConjecture.algebraicIndependent_of_mem_algebraicLogs: ℚ-linearly independent
    elements of 𝓛 are algebraically independent.

### DT.3b. Gelfond–Schneider

**One-variable tools.**
- *Rolle count* (Transcendence.exists_finset_card_deriv_zeros): a differentiable real function
  with N zeros has a derivative with N − 1 zeros.
- *Real exponential polynomials* (card_zeros_expPoly_le; Evertse Lemma 4.23). Let γ_k be
  distinct reals and p_k nonzero real polynomials. Then Σp_k(x)e^{γ_kx} has at most
  Σ(1 + deg p_k) − 1 real zeros. The proof is by induction, killing one term by differentiation
  and using the Rolle count.
- *Division by zeros* (exists_differentiable_eq_mul_prod_pow; Lemma 4.24 with multiplicities).
  An entire function vanishing to order k_i at distinct a_i is g·∏(z − a_i)^{k_i} with g entire.
  The proof iterates dslope.
- *Schwarz lemma for many zeros* (norm_le_of_zeros; Lemma 4.26 with multiplicities). If such an
  f satisfies |a_i| ≤ R and T ≥ 3R, then |f|_R ≤ |f|_T·(3R/T)^{Σk_i}. The proof uses the
  maximum modulus principle, Evertse's Lemma 4.25, which is Mathlib's.
- *Exponential sums* (sum_mul_exp_ne_zero). A nontrivial Σc_ie^{ρ_iz} with distinct ρ_i is not
  identically zero, by Dedekind's independence of characters. Hence it has finite order of
  vanishing everywhere.

**The real case** (Schneider's method; Evertse §4.4). Setting: K a number field of degree d
containing α = e^l, β and γ = e^{βl}.
- *Auxiliary function* (GelfondSchneider.exists_schneider_auxiliary; Lemma 4.22). For L ≥ 3 and
  D_1D_2 ≥ 2dL², Siegel's lemma over 𝓞_K gives algebraic integers a_{ij}, not all 0, with
  house(a_{ij}) ≤ exp(c_1(D_1 log L + D_2L)). With them, F(z) = Σa_{ij}z^ie^{jlz} vanishes at
  a + bβ for 1 ≤ a, b ≤ L.
  - Mathlib's Siegel lemma gives algebraic-integer rather than rational-integer coefficients;
    since K ⊆ ℝ in the real case, this is harmless.
  - The hypothesis L ≥ 3 repairs a slip in the source (see Source notes).
- *Estimates.* Parameters: L = 2dM², D_1 = (2d)²M³, D_2 = 2dM and c = 1 + ⌊√(2d)⌋. Let
  y_{ab} ∈ K be the algebraic value of F(a + bβ). For 1 ≤ a, b ≤ cL:
  - |F(a + bβ)| ≤ exp(c_4L^{3/2}log L − L²) (norm_schneider_auxiliary_le; Lemma 4.27(i), with
    the corrected bound |α^{jz}| ≤ e^{jT|log α|});
  - |σ(y_{ab})| ≤ exp(c_5L^{3/2}log L) for every embedding σ
    (norm_embedding_schneider_value_le; Lemma 4.27(ii));
  - m^{D_1+2cLD_2}y_{ab} is integral (isIntegral_pow_mul_schneider_value; Lemma 4.27(iii)).
- *Theorem 4.21* (GelfondSchneider.transcendental_rpow). For real algebraic α > 0, α ≠ 1 and
  irrational algebraic β, α^β is transcendental.
  - The size inequality forces F(a + bβ) = 0 for 1 ≤ a, b ≤ cL, which gives c²L² > D_1D_2
    distinct real zeros.
  - This contradicts the zero bound for real exponential polynomials.

**The general case** (Gelfond's method, following Karatarakis–Wiedijk and Soundararajan).
Setting: l ≠ 0 and β ∉ ℚ. K has degree h and contains α = e^l, β and γ = e^{βl}. Put
m = 2h + 2 and R_η(z) = Σ_{a,b≤q}η_{ab}e^{(a+bβ)lz}, with q² = 2mn.
- *Derivatives* (iteratedDeriv_gelfond): R_η^{(k)}(t) = l^kΣη_{ab}(a + bβ)^kα^{at}γ^{bt}.
- *Auxiliary function* (exists_gelfond_auxiliary). Siegel over 𝓞_K, with mn equations in 2mn
  unknowns, gives integral η ≠ 0 with house(η) ≤ c_1^n n^{(n+1)/2}. Then R_η vanishes to order n
  at 1, …, m.
- *First nonvanishing derivative* (exists_first_nonvanishing_derivative). There are r ≥ n and
  t_0 ≤ m such that all derivatives of order < r vanish at 1, …, m and R_η^{(r)}(t_0) ≠ 0.
- *Arithmetic lower bound* (norm_gelfond_value_ge). The algebraic number
  ρ = Ση_{ab}(a + bβ)^rα^{at_0}γ^{bt_0} is nonzero and |ρ| ≥ c_2^{−r}r^{−(h−1)(r+1)}, by the
  size inequality.
- *Analytic upper bound* (norm_gelfond_value_le). |ρ| ≤ c_3^r r^{((3−m)r+1)/2}. The proof
  divides R_η by (z − t_0)^r∏(z − k)^r and applies the maximum modulus principle on
  |z| = m(1 + r/q).
- *Gelfond–Schneider* (Transcendence.transcendental_exp_mul_of_mem_algebraicLogs; Evertse
  Theorem 4.16, Waldschmidt p. 3). For λ ∈ 𝓛 with λ ≠ 0 and β algebraic and irrational,
  e^{βλ} is transcendental.
  - The two bounds give r^{r/2−h+1/2} ≤ (c_2c_3)^r, which is false for large r ≥ n.
  - This form covers α = 1 with a nonzero logarithm 2πik, which Evertse's formulation
    (α ≠ 0, 1) excludes.

**Corollaries.**
- transcendental_cpow_of_isAlgebraic_of_irrational: the principal branch, in the
  Karatarakis–Wiedijk signature.
- Transcendence.transcendental_exp_pi_mul (Corollary 4.17): e^{πα} is transcendental for
  algebraic α ∉ ℚi, in particular e^π.
- Transcendence.linearIndependent_integralClosure_of_two (Corollary 4.18, Waldschmidt Theorem
  1.4): two ℚ-linearly independent elements of 𝓛 are ℚ̄-linearly independent; for example
  log 3/log 2 is transcendental.

### DT.3c. Baker's theorem through the Schneider–Lang criterion

This sub-layer follows Waldschmidt's Chapter 4. Throughout, entire functions of n variables are
complex-differentiable functions on ℂ^n.

**Partial derivatives** (Baker.mDeriv). D^σf = ∂_1^{σ_1}⋯∂_n^{σ_n}f, where
∂_ig(z) = fderiv g z (e_i).
- *API:*
  - mDeriv_zero;
  - mDeriv_add_single (D^{σ+e_i} = ∂_iD^σ for entire f);
  - mDeriv_add;
  - differentiable_mDeriv;
  - mDeriv_exp_dotProduct (D^σe^{w·z} = w^σe^{w·z});
  - mDeriv_monomial_mul_exp, the Leibniz expansion of Lemma 4.9.
- *Unit tests:*
  - D^0f = f;
  - ∂_0(z_0z_1) = z_1;
  - agreement with iteratedDeriv for n = 1;
  - D^{(1,1)}(z_0²) = 0 while the second total derivative along e_0 is 2, so D^σ is not a total
    derivative.

**Schwarz lemma on Cartesian products.**
- *Division by a linear factor* (Baker.exists_div_sub_single). f = f(…, ζ, …) + (z_k − ζ)g,
  with g entire given by ∫₀¹∂_kf(…, ζ + t(z_k − ζ), …)dt and |g|_R ≤ 2|f|_R/(R − r). Writing g
  as an integral makes it entire without the Osgood–Hartogs fact the source invokes; degrees in
  each variable are preserved.
- *Division by one polynomial* (exists_div_polynomial; Lemma 4.8, case m = n). Let P be monic of
  degree p with roots in |ζ| ≤ r, and R ≥ 5r.
  - f = f_0 + f_kP(z_k), with f_0 a polynomial of degree < p in z_k.
  - |f_0|_R ≤ 3^p|f|_R and |f_k|_R ≤ (3/R)^p|f|_R.
  - f_0 = 0 when f vanishes on the zero set of P(z_k) to the multiplicities of the roots.
- *Division by P_1(z_1), …, P_n(z_n)* (exists_div_cartesian; Lemma 4.8, case m = 1).
  - The decomposition is f = f_0 + Σf_iP_i(z_i), with f_0 of degree < p_j in each z_j.
  - The bounds are |f_i|_R ≤ 9^{np}R^{−p_i}|f|_R.
  - f_0 = 0 under the vanishing conditions on E_1 × ⋯ × E_n.
- *Proposition 4.7* (norm_le_of_vanishing_cartesian). Let E_i have S_1 points in |ζ| ≤ r, let
  R ≥ 18^n r, and let D^σf vanish on E_1 × ⋯ × E_n for |σ| < S_0. Then
  |f|_r ≤ |f|_R(18^n r/R)^{S_0S_1}.

**Auxiliary-function tools.**
- *Lemma 4.9* (mDeriv_monomial_mul_exp). D^σ(z^τe^{(tx)·z})(sy) is
  P^{(σs)}_{τt}(x, y)·∏e^{(x_i·y_j)t_is_j}, with P an integer polynomial whose degree and length
  are bounded as in the source.
- *Thue–Siegel for inequalities* (exists_int_vec_small_real, exists_int_vec_small_complex;
  Lemmas 4.11, 4.12). These are box-principle lemmas producing small integer vectors with small
  real or complex linear forms.
- *Cauchy's inequalities on polydiscs* (norm_mDeriv_le).
- *Truncated Taylor interpolation* (norm_le_truncatedTaylor; Lemma 4.13). The factor is 1 + T,
  in place of the source's 1 + √T from Parseval's formula; the loss is absorbed in
  Proposition 4.10.
- *Proposition 4.10* (exists_auxiliary_small). Under the source's parameter conditions, integers
  p_λ with 0 < max|p_λ| ≤ e^N give |Σp_λφ_λ|_r ≤ e^{−V}.
- *Linear independence* (eq_zero_of_sum_polynomial_mul_exp, linearIndependent_monomial_exp).
  The exponential monomials z^τe^{(tx)·z} are linearly independent when x_1, …, x_{d_1} are
  ℚ-linearly independent. The proof restricts to a generic line and uses the one-variable
  identity Σp_k(s)e^{λ_ks} ≡ 0 ⇒ all p_k = 0.

**The criterion.**
- *Step 2* (schneiderLang_liouville_bound). A nonzero D^σF(sy) satisfies
  log|D^σF(sy)| ≥ −c_1(N + ‖σ‖log T_1 + T_0 log(S_1 + ‖σ‖) + T_1S_1), by the size inequality.
- *Steps 3–4* (schneiderLang_exists_vanishing). Under (4.15), (4.17) and (4.18), an auxiliary
  F ≢ 0 exists with D^σF(sy) = 0 for |σ| < S_0 and |s| < S_1.
- *Step 5* (schneiderLang_upper_bound). This bounds the first nonvanishing derivative at order
  S_0'. The vanishing is measured by the total order ‖σ‖ and transferred to
  f(z) = F(Σz_jy_j), giving the exponent S_0'S_1/(2n). The printed step overlooks this transfer
  (see Source notes).
- *Corollary 4.2* (schneiderLang_cartesian). Let 0 ≤ d_0 ≤ n < d_0 + d_1, let x_i ∈ ℚ̄^n be
  ℚ-linearly independent, and let (y_j) be a basis of ℂ^n. Then one of the numbers y_{hj}
  (h ≤ d_0) and e^{x_i·y_j} is transcendental.
- *Corollaries 4.3 and 4.4* (schneiderLang_homogeneous, schneiderLang_inhomogeneous). These are
  the cases d_0 = 0 and d_0 = 1, stated with 𝓛.

**Baker's theorem.**
- *Theorem 4.5* (Baker.eq_zero_of_isAlgebraic_sum_basis_mul; Bertrand–Masser). If (β_k) is a
  ℚ-basis of a number field K ⊆ ℂ, ℓ_k ∈ 𝓛, and Σβ_kℓ_k is algebraic, then all ℓ_k = 0.
  - The matrix (σ_i(β_k)) is invertible: its determinant squared is the discriminant.
  - The three cases on λ_i = Σσ_i(β_k)ℓ_k go to Corollary 4.3, Corollary 4.4, or ℓ = 0.
- *Baker's theorem*
  (Transcendence.linearIndependent_cons_one_of_linearIndependent_rat; Evertse Theorem 5.1,
  Waldschmidt Theorem 1.6). For ℚ-linearly independent λ_1, …, λ_m ∈ 𝓛, the numbers
  1, λ_1, …, λ_m are linearly independent over ℚ̄. Any logarithms are allowed. The hypothesis is
  ℚ-independence of the chosen logarithms and must be checked at each use.
- *Corollaries:*
  - Transcendence.transcendental_sum_mul_of_linearIndependent (Evertse Theorem 4.19):
    Σβ_iλ_i with nonzero algebraic β_i is transcendental;
  - Transcendence.transcendental_exp_sum_mul (Corollary 4.20): α_1^{β_1}⋯α_n^{β_n} is
    transcendental for multiplicatively independent α_i and β ∉ ℚ^n.

### DT.3d. Explicit lower bounds for linear forms in logarithms

- **Waldschmidt's measure** (LogarithmicForms.waldschmidt_measure; DALAG Theorem 9.1 with
  Proposition 9.18). Let λ_1, …, λ_m ∈ 𝓛 be ℚ-linearly independent, let β_0, …, β_m be
  algebraic and not all zero, and let D be the degree of the field they generate with the
  α_j = e^{λ_j}. Assume the parameter conditions on B, E, E* and A_j of the source, general case
  (i) or homogeneous rational case (ii). Then:
  - Λ = β_0 + Σβ_jλ_j ≠ 0;
  - |Λ| > exp{−C(m)D^{m+2}(log B)(log A_1)⋯(log A_m)(log E*)(log E)^{−m−1}}, with
    C(m) = 2^{m+25}m^{3m+9}.

  The proof (DALAG §9.2–9.3) uses interpolation determinants, Fel'dman's polynomials and Roy's
  multiplicity estimate (Chapter 8). It is a target of this layer.
- **Baker 1975** (LogarithmicForms.baker_lower_bound; Evertse Theorem 5.2). Fix λ_1, …, λ_m ∈ 𝓛,
  not assumed independent, and a degree bound D. There is C such that
  |γ + Σβ_iλ_i| ≥ (eB)^{−C} whenever the form is nonzero, deg γ, deg β_i ≤ D, and B bounds
  H_abs of the coefficients.
  - The proof passes to a ℤ-basis of ℤλ_1 + ⋯ + ℤλ_m inside 𝓛 and applies Waldschmidt's
    measure.
  - It uses the elementary inequalities of the absolute height: extension invariance,
    h(x + y) ≤ h(x) + h(y) + log 2, h(xy) ≤ h(x) + h(y) and h(1/x) = h(x). The pinned Mathlib
    defines absLogHeight₁ without these lemmas; they belong to the absolute-height foundation,
    which RS-03 assigns upstream.
- **Corollary 5.3** (baker_lower_bound_prod_sub_one). For nonzero algebraic α_i there is C' with
  |α^b − 1| ≥ (eB)^{−C'} whenever α^b ≠ 1. The proof uses the principal logarithm, the extra
  logarithm πi and |log(1 + z)| ≤ (3/2)|z|.
- **Matveev's Corollary 2.3** (LogarithmicForms.matveev). Setting: a number field K ⊆ ℂ of
  degree D, κ = 1 if K ⊆ ℝ and 2 otherwise, nonzero logarithms λ_j of α_j ∈ K^×, b ∈ ℤ^n with
  Λ = Σb_jλ_j ≠ 0, A_j ≥ max{D·h(α_j), |λ_j|, 0.16} and B* = max|b_j|. Then
  log|Λ| > −C_1(n)D²A_1⋯A_n log(eD)log(eB*), with
  C_1(n) = min{κ^{−1}(en/2)^κ30^{n+3}n^{3.5}, 2^{6n+20}}. The proof is Matveev's paper, a target
  of this layer.
- **Matveev, multiplicative form** (matveev_prod_sub_one; Bugeaud–Mignotte–Siksek Theorem 9.4).
  With principal logarithms and A_j ≥ max{Dh(α_j), |log α_j|, 0.16}:
  - log|α^b − 1| > −3·30^{n+4}(n+1)^{5.5}D²(1 + log D)(1 + log nB)A_1⋯A_n;
  - if K ⊆ ℝ, log|α^b − 1| > −1.4·30^{n+3}n^{4.5}D²(1 + log D)(1 + log B)A_1⋯A_n.

  This is the form DT.4 and EffectiveDiophantineMethods:ED.2 use for algebraic units.
- **Matveev for rationals** (matveev_rat; Evertse Theorem 5.4). For nonzero rationals with
  a^b ≠ 1: |a^b − 1| ≥ (2/3)(eB)^{−C'}, with C' = ½e·m^{4.5}30^{m+3}∏max(1, log H(a_j)).
  Evertse prints the bound without the factor 2/3, which his derivation does not give.
- **Laurent–Mignotte–Nesterenko** (laurent_mignotte_nesterenko; Evertse Exercise 5.4). For
  positive rationals a_1, a_2 ≠ 1 and nonzero integers b_1, b_2 with
  Λ = b_1 log a_1 − b_2 log a_2 ≠ 0:
  log|Λ| ≥ −24.34(max{log(|b_1|/log H(a_2) + |b_2|/log H(a_1)) + 0.14, 21})²·log H(a_1)·log H(a_2).
- **Yu 1994** (LogarithmicForms.yu). Setting: n ≥ 2, K = ℚ(α_1, …, α_n) of degree d, 𝔭 | p with
  residue degree f_𝔭, α^b ≠ 1, and h_j ≥ max(h(α_j), |log α_j|/(10d), log p). Then
  ord_𝔭(α^b − 1) < Φ·log(dB), where:
  - B = max(|b_j|, 3);
  - Φ = 22000(9.5(n+1)d/√log p)^{2(n+1)}(p^{f_𝔭} − 1)h_1⋯h_n·log(10ndh').

  The Lean form bounds the 𝔭-adic absolute value with base N𝔭 = p^{f_𝔭} from below. The proof
  is Yu's papers, a target of this layer.
- **Lifting the exponent** (padicNorm_one_add_pow_sub_one; Evertse Exercise 5.9(i)). If
  p | a ≠ 0 for odd p, or 4 | a for p = 2, then |(1 + a)^b − 1|_p = |ab|_p ≥ 1/|ab|.
- **One power** (padicNorm_pow_sub_one_ge). For a rational p-adic unit a there is c with
  |a^b − 1|_p ≥ c·|b|_p whenever a^b ≠ 1.
- **Yu for rationals** (LogarithmicForms.yu_rat; Evertse Theorem 5.16). For rational p-adic
  units a_i there is C, depending on p, m and a, with |a^b − 1|_p ≥ (eB)^{−C} whenever
  a^b ≠ 1.
  - For m ≥ 2 one may take C = 2Φlog p from Yu 1994 with d = 1.
  - For m = 1 it follows from the elementary lemma.

### Dependencies

- **Within the roadmap.**
  - DT.0 supplies the naive height and the comparison M(α) = H_abs(α)^{deg α} used in the
    derivations of DT.3d.
  - DT.3 supplies DT.4 with Baker's and Matveev's archimedean bounds (Corollary 5.3, BMS
    Theorem 9.4) and Yu's p-adic bound.
  - DT.3 supplies DT.5 with Schanuel's conjecture as a proposition.
- **Across roadmaps.**
  - EffectiveDiophantineMethods:ED.2 imports the explicit bounds with their constants, degree,
    heights, branch and independence hypotheses.
  - ColemanIntegration:L0 owns the p-adic logarithm with log_p(p) = 0, and
    IntegralIwasawaTheory:L4 owns Baker–Brumer; this layer uses neither.
  - The atlas input FoundationsAndLibraryIntegration:LI.2 belongs to a retired roadmap; this
    layer cites Mathlib directly.

### Acceptance tests

- **Hypotheses of Lindemann–Weierstrass.** Distinct exponents and algebraic coefficients are
  both needed: (β_1 + β_2)e^{α_1} can vanish, and e·e^0 − e^1 = 0.
- **Branches.**
  - 2πi ∈ 𝓛 is not a principal logarithm.
  - Gelfond–Schneider holds for λ = 2πi, α = 1.
  - Baker's theorem applies to λ_1 = log 2 and λ_2 = log 2 + 2πi, which are ℚ-independent
    logarithms of the same number.
- **Gelfond–Schneider instances.** 2^{√2}, e^π = (−1)^{−i} and log 3/log 2 are transcendental.
  e^{πi} = −1 shows the exclusion α ∉ ℚi.
- **Baker instance.** 1, log 2 and log 3 are ℚ̄-linearly independent, so √2 log 2 + log 3 is
  transcendental.
- **Nonvanishing.** Every lower bound carries Λ ≠ 0. For α = (2, 4) and b = (2, −1),
  α^b − 1 = 0, and the bound is vacuous.
- **Explicit constants.**
  - For m = 2, a = (2, 3), Evertse's Theorem 5.4 with the factor 2/3 gives an explicit C'.
    The value 3² − 2³ = 1, that is |3²·2^{−3} − 1| = 1/8, lies above the bound.
  - The p-adic lemma gives |2^{4k} − 1|_5 = |k|_5/5.
- **Separation of bounds.** A complex bound is not applied p-adically: Corollary 5.3 and Yu's
  theorem are separate declarations with separate constants.

### Source notes

The following slips in the sources are recorded in the packet; the nodes use corrected forms.

- **Evertse, Chapter 4, index misprints.** On pp. 68–72: the tuples (i_1, …, i_k) that should be
  (i_1, …, i_d); α_1, …, α_d for α_1, …, α_n; the relation with index 0; and g_1^{(j)} in
  Lemma 4.13.
- **Evertse, Lemma 4.22.** It cites "Theorem 3.22" for Siegel's lemma, which is Theorem 3.20.
  Its estimate needs L ≥ 3.
- **Evertse, Lemma 4.27(i).** The bound |α^{jz}| ≤ (1 + |α|)^{Tj} fails for small α > 0; the
  correct bound is e^{jT|log α|}.
- **Evertse, after Lemma 4.23.** Vanishing columns must be discarded before applying the lemma.
- **Evertse, Corollary 4.18.** The proof has γ = −β_2/β_1 where −β_1/β_2 is meant, and it
  applies Theorem 4.16 to α_1, which may be 1.
- **Evertse, Corollary 4.20.** The proof applies Theorem 4.19 to forms with vanishing
  coefficients.
- **Evertse, Theorems 5.1 and 5.2.** They read "i = 1, …, n" for i = 1, …, m.
- **Evertse, Theorem 5.4.** It omits the factor 2/3.
- **Evertse, Exercise 5.9(i).** It needs a ≠ 0 and reads 1/ab for 1/|ab|.
- **Waldschmidt, §4.6 Step 5.** Proposition 4.7 is applied to F(Σz_jy_j) with multiplicity S_0',
  which does not follow from the vanishing of the standard partial derivatives D^σF with
  |σ| < S_0'. Measuring vanishing by total order and using multiplicity ⌈S_0'/n⌉ repairs the
  step, at the cost of constants.

## DT.4 — Effective applications

This layer turns lower bounds for linear forms in logarithms into **explicit search regions**
for Diophantine equations: exponential equations of Pillai type, gaps between S-integers, unit
equations, Thue equations, S-unit equations over ℚ, unit equations in finitely generated groups,
and Thue–Mahler equations, together with the statements of Baker's superelliptic theorem and the
Schinzel–Tijdeman theorem. Its source is Chapter 5 of Evertse's Leiden notes (sections 5.2–5.4 in
full, the applications of 5.1, and Exercise 5.9), supplemented by Bugeaud–Győry (1996) for the
S-unit height machinery, Bérczes–Evertse–Győry (2013) for the explicit superelliptic bounds and
Tzanakis–de Weger (1992) for the Thue–Mahler equation.

The layer proves bounds; it does not enumerate. Every region produced here is handed to
`EffectiveDiophantineMethods:ED.2`, which owns lattice (Baker–Davenport/LLL) reduction and the
certified exhaustive enumeration that proves a list of solutions complete. Conversely DT.4 consumes
exactly three results of `DiophantineApproximationAndTranscendence:DT.3`, all in multiplicative
form: Corollary 5.3 (Baker, as `DT.3/baker-lower-bounds-for-linear-forms-in-logarithms`), Theorem
5.4 (Matveev, `DT.3/matveev-explicit-lower-bound`) and Theorem 5.16 (Yu, `DT.3/yu-p-adic-lower-bound`),
plus Yu's theorem for algebraic numbers at prime ideals for the finitely generated case.

### Conventions (pinned)

- `K` is a number field of degree `d = [K : ℚ]`, with Mathlib's infinite places `w`, multiplicities
  `m_w ∈ {1, 2}`, `w(x) = |σ_w(x)|`, the **house** `house(α) = max_σ |σ(α)|`
  (`NumberField.house`), the unit rank `r = rank K`, the torsion subgroup `torsion K`, and the
  logarithmic embedding `L = logEmbedding K : (𝓞 K)ˣ → ℝ^{w ≠ w₀}`, `L(x)_w = m_w log w(x)`.
  Norms on `ℝ^{w ≠ w₀}` and `ℝ^r` are sup norms.
- A family of units `u : Fin r → (𝓞 K)ˣ` **of maximal rank** (Mathlib's `IsMaxRank`) is the data of
  every unit bound; `fundSystem K` is the default. `κ(u)` is the operator norm of the coordinate
  map of `basisOfIsMaxRank u` (the maximal absolute row sum of the inverse of the matrix
  `(m_w log w(u_j))`), and `c₁(u) = r · Σ_j ‖L(u_j)‖`. Both are explicit in the `u_j`.
- Heights: `H(q) = max(|num q|, den q)` for `q ∈ ℚ` (Mathlib's `Height.mulHeight₁`, see
  `Rat.mulHeight₁_eq_max`); over `K`, Mathlib's **relative** heights `Height.mulHeight₁` and
  `Height.logHeight₁ = Σ_v log⁺|x|_v` (infinite places with multiplicity), not divided by `d`.
  The naive height of an algebraic number is DT.0's `naive-height-of-algebraic-number`.
- **Effective** means: the region is described by an explicit expression in explicitly given data
  (degree, `κ(u)`, `c₁(u)`, houses, valuations) and in the constant `C` of a lower bound for a
  linear form in logarithms. The constant enters every DT.4 lemma as a **hypothesis of
  multiplicative form** — `|σ(γ ∏ u_j^{e_j}) − 1| ≥ (e · max(1, max_j |e_j|))^{−C}` whenever the
  left side is nonzero (archimedean), and `|γ ∏ γ_j^{z_j} − 1|_v ≥ (e · max(1, max |z_j|))^{−C}`
  (non-archimedean) — and the named theorems discharge it with DT.3. The `max(1, ·)` is the
  source's convention that the exponent of the leading coefficient `γ` counts in `B`.
- The branch conversion between Baker's logarithmic form and the multiplicative form (principal
  logarithm, the winding term `2kπi`) is the proof of Corollary 5.3 and belongs to DT.3; DT.4 owns
  the height and degree conversions below.
- `U_S` (rational S-units) and all solution sets are subsets of `ℚˣ`, `(𝓞 K)ˣ` or `Kˣ`; a binary
  form of degree `d` with `X^d`-coefficient `a₀ ≠ 0` is `f.homogenize d` for `f = F(X, 1)` of degree
  `d` (Mathlib's `Polynomial.homogenize`, variables `X₀ = X`, `X₁ = Y`).

### Objects

**`ratSUnits S` — the group `U_S` of rational S-units** (`DT.4/rational-s-unit-group`). For
`S : Finset ℕ`, the subgroup of `ℚˣ` of `x` with `v_p(x) = 0` for every prime `p ∉ S`. When `S`
consists of primes it is Evertse's `{±∏ p^{z_p}}`, isomorphic to `{±1} × ℤ^S`. API:
`mem_ratSUnits_iff` (valuations), `mem_ratSUnits_iff_num_den` (`|num|` and `den` lie in
`Nat.factoredNumbers S`), `mem_ratSUnits_iff_eq_sign_mul_prod` (Evertse's form),
`ratSUnits_mono`, `ratSUnits_empty` (`U_∅ = {±1}`), `ratSUnits_mulEquiv`
(`U_S ≃* ℤˣ × Multiplicative (S → ℤ)`), `ratSUnits_eq_setUnit` (agreement with Mathlib's
`Set.unit` for `𝓞 ℚ ⊂ ℚ` under `Rat.HeightOneSpectrum.primesEquiv`), `mulHeight₁_ratSUnits`
(`H(x) = max(∏ p^{v_p(x)^+}, ∏ p^{v_p(x)^-})`). Unit tests: `12/5 ∈ U_{2,3,5}`; `7 ∉ U_{2,3}`; `U_∅ = {1, −1}`
(the sign is kept); agreement with `Set.unit`. ⚠ The sign belongs to `U_S`; a definition as
positive S-smooth rationals breaks Theorem 5.17's normalisation.

**`boundedDivisors u α` — divisor representatives** (`DT.4/bounded-divisor-representatives`).
`D_u(α) = {γ ∈ 𝓞 K : γ ∣ α, house(γ) ≤ e^{c₁(u)} |N_{K/ℚ}(α)|^{1/d}}`. API:
`mem_boundedDivisors`, `boundedDivisors_finite` (promoted to `DT.4/bounded-divisor-representatives-finite`:
finite for `α ≠ 0`, via `NumberField.Embeddings.finite_of_norm_le`),
`exists_mem_boundedDivisors_of_dvd` (promoted to `DT.4/divisors-up-to-units`: Corollary 5.11),
`boundedDivisors_subset_dvd`, `one_mem_boundedDivisors`, `boundedDivisors_mul_unit`
(`D_u(ηα) = D_u(α)`). Unit tests: over `ℚ` (rank 0) `D(m)` is the set of divisors of `m` with
`|γ| ≤ |m|`; `D(6) = {±1, ±2, ±3, ±6}`; for a unit `α` every representative is a unit; for rank ≥ 1
the set of all divisors of `1` is infinite, so the house bound is what makes `D` finite. Its
enumeration (minimal polynomials with coefficients bounded by
`NumberField.Embeddings.coeff_bdd_of_norm_le`) is ED.2's.

### Height, degree and exponent conversions

- `DT.4/log-linear-inequality-bound`: `x ≤ a + b log x` with `b, x > 0` implies
  `x ≤ 2a + 2b(log(2b) − 1)`; for `a = b`, `x ≤ 2b log(2b)`. Every "this leads to an effectively
  computable bound" of the source is this lemma.
- `DT.4/conjugate-invariance-of-degree-and-height`: `minpoly ℚ (σ α) = minpoly ℚ α`, so
  conjugates share degree, naive height and Mahler measure; constants of DT.3 depending on degrees
  and heights are the same for `σ(α_1), …, σ(α_m)`.
- `DT.4/unit-conjugate-log-bound`: for a unit, `house(u)^{−(d−1)} ≤ |σ(u)| ≤ house(u)`, hence
  `|log|σ(u)|| ≤ (d − 1) log house(u)` (Evertse has `d`).
- `DT.4/small-conjugate-of-unit`: for `d ≥ 2`, some `|σ(y)| ≤ house(y)^{−1/(d−1)}`.
- `DT.4/prime-power-exponent-height-bound`: `v_p(n) log p ≤ log n`; for `x ∈ U_S`,
  `|v_p(x)| ≤ log H(x) / log 2`.
- `DT.4/rational-height-in-number-field`: `Height.mulHeight₁ (q : K) = H(q)^{[K:ℚ]}` for `q ∈ ℚ`.
- `DT.4/log-height-of-algebraic-integer-bound`: `logHeight₁(α) ≤ d · log⁺ house(α)` for `α ∈ 𝓞 K`.

### Units (Evertse §5.2)

Lemma 5.7 (units are the elements of norm `±1`) is Mathlib's `NumberField.isUnit_iff_norm`, and
Theorem 5.8 (Dirichlet) is Mathlib's `NumberField.Units.exist_unique_eq_mul_prod`,
`unitLattice` and `logEmbedding_eq_zero_iff`; neither is planned here.

- **Lemma 5.9** (`DT.4/unit-exponent-house-bound`): for `u` of maximal rank and
  `x = ζ ∏ u_j^{e_j}`, `|e_j| ≤ 2(d − 1) κ(u) log house(x)`.
- **Covering radius** (`DT.4/unit-lattice-covering-bound`): every `v ∈ ℝ^{w ≠ w₀}` is within
  `Σ_j ‖L(u_j)‖` of `L(∏ u_j^{n_j})` (Mathlib's `ZSpan.norm_fract_le`).
- **Lemma 5.10** (`DT.4/balanced-unit-multiple`): every nonzero `α ∈ 𝓞 K` has a unit multiple
  `εα` with `|log w(εα) − (1/d) log|N(α)|| ≤ c₁(u)` at every infinite place, hence
  `house(εα) ≤ e^{c₁(u)} |N(α)|^{1/d}`.
- **Corollary 5.11** (`DT.4/divisors-up-to-units`, `DT.4/bounded-divisor-representatives-finite`).

### Exponential equations (Evertse §5.1)

- **Corollary 5.5, first part** (`DT.4/pillai-difference-lower-bound`): for `a, b ≥ 2` and a
  constant `C₁` of Corollary 5.3 for `(b, a)`, `|a^m − b^n| ≥ max(a^m, b^n)(e max(m, n))^{−C₁}`.
- **Corollary 5.5, second part** (`DT.4/pillai-equation-exponent-bound`): `a^m − b^n = k ≠ 0`
  forces `max(m, n) ≤ 2(log|k| + C₁)/log 2 + 2(C₁/log 2)(log(2C₁/log 2) − 1)`.
- **Theorem** (`DT.4/pillai-equation-effective-finiteness`): the solution set is finite and the
  bound holds with Matveev's `C₁ = (e/2)·2^{4.5}·30^5·max(1, log a)·max(1, log b)` (Theorem 5.4,
  `m = 2`).
- **Gaps between S-integers** (`DT.4/gaps-between-s-integers-lower-bound`): for S-smooth
  `x < y`, `y − x ≥ y (e log y / log 2)^{−C}`; **Tijdeman's gap theorem** (Theorem 5.6,
  `DT.4/tijdeman-gap-theorem`) with `c₂ = C`, `c₁ = (e / log 2)^C`.
- **Tijdeman's Catalan bound** (`DT.4/tijdeman-catalan-bound`): `x^m − y^n = 1` with
  `x, y, m, n ≥ 2` implies `x^m, y^n ≤ C` for an effective `C`, following Tijdeman (Acta Arith.
  29, 1976): first the exponents are bounded by linear forms in two and three logarithms (DT.3),
  then the bases for fixed exponents.

### Unit equations (Evertse Theorem 5.12)

`DT.4/unit-equation-exponent-bound` is the proof of Theorem 5.12 with every constant explicit. For
rank `r ≥ 1`, `u` of maximal rank, `α, β ≠ 0` and a constant `C′` of Corollary 5.3 for the tuples
`(σ(γ), σ(u_1), …, σ(u_r))`, `γ ∈ {αζ, βζ}`, every solution of `αx + βy = 1` in units has all
exponents at most `max(1, 2A + 2B₀(log(2B₀) − 1))` with `κ = 2(d − 1)κ(u)`,
`A = κ(d − 1)(log max(house α, house β) + C′)`, `B₀ = κ(d − 1)C′`. The argument: bound the
exponents of `y` by Lemma 5.9, make one conjugate of `y` exponentially small, and compare
`|σ(αx) − 1| = |σ(βy)|` with Corollary 5.3.

**Theorem 5.12** (`DT.4/effective-finiteness-for-unit-and-thue-equations`, planet *Effective unit
equation theorem*): the solution set is finite and lies in the explicit region
`{ζ ∏ fundSystem_j^{e_j} : max|e_j| ≤ B}²`. Rank 0 is the finite torsion group; for rank ≥ 1 the
constant is the maximum of the Corollary 5.3 constants over the finitely many tuples, independent of
the embedding by conjugate invariance. ⚠ Corollary 5.3 needs its numbers `≠ 0, 1`: a factor
`σ(γ) = 1` is dropped from the tuple (see the sourceIssues). Acceptance: an imaginary quadratic
field gives at most `(#torsion)²` solutions; `x + y = 1` has no solutions in units of `ℚ(√2)`;
Wildanger's list for `ℚ(cos(2π/19))` (degree 9, rank 8) must be reproduced by ED.2 inside the
region.

### Thue equations (Evertse Theorem 5.13)

- **Siegel's identity** (`DT.4/siegel-identity`): `(α₂ − α₃)(X − α₁Y) + (α₃ − α₁)(X − α₂Y) +
  (α₁ − α₂)(X − α₃Y) = 0`, and its field form, the unit equation (5.6).
- **Monic reduction** (`DT.4/thue-equation-monic-reduction`): with `g = integralNormalization f`,
  `F(x, y) = m ⟺ G(a₀x, y) = a₀^{d−1}m`; a bijection of solution sets onto the solutions with
  `a₀ ∣ x′`.
- **Factorisation** (`DT.4/thue-form-factorisation`): `G(x, y) = ∏ (x − θ_i y)` over a splitting
  field; each factor divides `m` and has `|N| ≤ |m|^{[K:ℚ]}`.
- **Reduction** (`DT.4/thue-equation-reduction-to-unit-equations`): `x − θ_i y = μ_i ε_i` with
  `μ_i ∈ D(m)` and `(ε₀/ε₂, ε₁/ε₂)` solving `a(μ)X + b(μ)Y = 1`; `λ = (x − θ₀y)/(x − θ₂y)`
  recovers `x/y = (θ₀ − λθ₂)/(1 − λ)`.
- **Theorem 5.13** (`DT.4/thue-equation-effective-bound`, planet *Effective Thue equation
  theorem*): if `a₀ ≠ 0` and `F(X, 1)` has at least three distinct zeros, `F(x, y) = m ≠ 0` has
  finitely many solutions, each with `max(|a₀x|, |y|) ≤ |a₀^{d−1}m|^{1/d} e^{h_T}`,
  `h_T = 4 log⁺(e^{c₁}|m′|) + 2B_T Σ_j log house(u_j) + log⁺ house θ₀ + log⁺ house θ₂ + 2 log 2`,
  `B_T` the unit-equation bound maximised over `D(m′)³`. The height steps use Mathlib's
  `Height.logHeight₁_add_le`, `_sub_le`, `_mul_le`, `_inv`, `_zpow`, `_prod_le`. Each hypothesis is
  necessary: `x − 2y = 1`, `x² − 2y² = 1` and `(x − y)³ = 1` have infinitely many solutions.
  Acceptance: `x³ − 2y³ = 1` has exactly `(1, 0), (−1, −1)`, and ED.2's enumeration of the box must
  return exactly these.

### Superelliptic equations (Evertse Theorems 5.14, 5.15)

- **Worked reduction** (`DT.4/superelliptic-example-reduction`): every solution of
  `y³ = 2x(x − 3)` yields `a, b ∈ {±2^k3^l : k, l ≤ 2}` and `u, v` with `2x = au³`, `x − 3 = bv³`,
  `au³ − 2bv³ = 6`; the 324 Thue equations determine the solution set (which contains
  `x ∈ {0, 3, −1, 4, 12}`).
- **Baker's theorem** (Theorem 5.14, `DT.4/baker-superelliptic-theorem`): `f` without multiple zeros,
  `deg f ≥ 2` if `n ≥ 3`, `≥ 3` if `n = 2`, `b ≠ 0`: `b yⁿ = f(x)` has finitely many solutions,
  with `log max(1, |x|), log max(1, |y|) ≤ (6N)^{14n³N³} e^{8n²N³ĥ}` (`n ≥ 3`) and
  `(4N)^{212N⁴} e^{50N⁴ĥ}` (`n = 2`), `N = deg f`, `ĥ = log max(1, |b|, |coeffs|)`
  (Bérczes–Evertse–Győry 2013, Theorems 2.1–2.2 over ℚ). The double-zero example
  `y² = x²(x + 1)` (solutions `(t² − 1, t(t² − 1))`) shows the separability hypothesis is needed.
- **Schinzel–Tijdeman** (Theorem 5.15, `DT.4/schinzel-tijdeman-theorem`): a solution with
  `y ∉ {0, ±1}` forces `n ≤ (10N²)^{40N} e^{11Nĥ}`. Acceptance: `y = 2`, `f = X² + 7` has
  `n = 3, 4, 5, 7, 15` (Ramanujan–Nagell).

The proofs of Theorems 5.14 and 5.15 are targets of this layer. Evertse gives none; the complete
public proofs (Bérczes–Evertse–Győry, sections 3–6) use, besides `gyory-effective-finiteness`, the
reduction `x − α_i = δ_i ξ_i^n` with `δ_i` in an effectively determined finite set of the splitting
field, discriminant estimates for relative extensions, Thue equations over rings of S-integers, and
the explicit S-unit bounds of Győry–Yu (Acta Arith. 123, 2006); these steps belong to DT.4.

### p-adic analogues and S-unit equations (Evertse §5.4)

- **One logarithm** (Exercise 5.9, `DT.4/one-term-p-adic-lower-bound`): for `p ∣ a` (`4 ∣ a` if
  `p = 2`), `v_p((1 + a)^b − 1) = v_p(a) + v_p(b)`, so `|(1 + a)^b − 1|_p = |ab|_p ≥ 1/|ab|`
  (lifting the exponent: Mathlib's `padicValNat.pow_sub_pow`, `Int.emultiplicity_pow_sub_pow`).
  Acceptance: `5^x − 2^y = 1` has no solution with `x, y ≥ 2`.
- **Normal form** (`DT.4/s-unit-equation-coprime-reduction`): solutions of `x + y = 1` in `U_S²`
  correspond bijectively to pairwise coprime S-integers `u + v = w`, `w > 0`, each prime dividing at
  most one of them.
- **Exponent bound** (`DT.4/s-unit-equation-exponent-bound`): given `C` such that Theorem 5.16 holds
  at every `p ∈ S` for `−1` and the primes of `S ∖ {p}` (⚠ the sign `−1` must be included), every
  solution has `|v_p(x)|, |v_p(y)| ≤ max(1, (2C / log 2) log(2C / log 2))`.
- **Theorem 5.17** (`DT.4/s-unit-equation-effective-finiteness`, planet *Effective S-unit equation
  over ℚ*): finitely many solutions, all in the box `{x ∈ U_S : |v_p(x)| ≤ B}`. Acceptance: for
  `S = {2, 3}` the solutions `(2, −1), (1/2, 1/2), (3, −2), (4, −3), (9, −8), (1/4, 3/4),
  (1/9, 8/9)` and their images lie in the box; for `S = {2, 3, 5, 7, 11, 13}` ED.2 must reproduce
  de Weger's 545 solutions with `0 < x ≤ y`. The ineffective finiteness is DT.2's
  `s-unit-equation-finiteness`.

### Unit equations in finitely generated groups (Evertse Theorem 5.18)

- `DT.4/s-unit-log-height-identity`: for `y` a unit outside a finite set `S` of finite places,
  `Σ_{v ∈ S ∪ S_∞} ℓ_v(y) = 0` and `logHeight₁(y) = ½ Σ |ℓ_v(y)|` (Mathlib's product formula
  `NumberField.prod_abs_eq_one`); `DT.4/small-place-of-s-unit`: some `ℓ_v(y) ≤ −logHeight₁(y)/s`.
- `DT.4/exponent-height-bound-for-finitely-generated-groups`: for multiplicatively independent
  `γ_1, …, γ_t`, the S-logarithms are ℝ-independent (Northcott, Kronecker, discreteness) and
  `max |z_j| ≤ κ(γ) logHeight₁(ζ ∏ γ_j^{z_j})` with `κ(γ) = 2‖T_γ‖`.
- `DT.4/gyory-equation-exponent-bound`: with an archimedean constant (Corollary 5.3) and a
  non-archimedean constant (Yu, algebraic numbers) `C`, every solution of `ax + by = 1` in `Γ`
  has exponents at most `max(1, 2A + 2B₀(log(2B₀) − 1))`, `A = 2κs(log M + C)`, `B₀ = 2κsC`,
  `M = max(house a, house b, max_{v∈S} max(|a|_v, |b|_v))`.
- **Theorem 5.18** (`DT.4/gyory-effective-finiteness`, planet *Győry's theorem on unit
  equations*): for `Γ ⊂ Kˣ` finitely generated, `ax + by = 1` has finitely many solutions in `Γ²`,
  in the explicit region. Theorems 5.12 and 5.17 are its special cases `Γ = (𝓞 K)ˣ` and
  `K = ℚ, Γ = U_S`.

### Thue–Mahler equations

- `DT.4/s-integral-divisor-representation`: with class number `h`, generators `π_𝔭` of `𝔭^h`
  (`𝔭 ∈ P`) and `Γ_P = ⟨(𝓞 K)ˣ, π_𝔭⟩`, every nonzero `β` whose valuations outside `P` are at most
  those of `m` lies in `μ Γ_P` for `μ` in an explicit finite set.
- **Theorem** (`DT.4/thue-mahler-effective-finiteness`, planet *Thue–Mahler equation theorem*):
  for `F` as in Theorem 5.13 of degree `≥ 3`, `m ≠ 0` and primes `p_1, …, p_s`, the solutions of
  `F(x, y) = m p_1^{z_1} ⋯ p_s^{z_s}` with `gcd(x, y) = 1` are finitely many, in an explicit
  region. ⚠ Coprimality is essential: `(kx, ky)` with `k` an S-unit multiplies `F` by `k^d`.
  Acceptance: Tzanakis–de Weger's equation `x³ − 23x²y + 5xy² + 24y³ = ±2^{z_1}3^{z_2}5^{z_3}7^{z_4}`
  has 72 solutions with `x > 0`; ED.2 must reproduce them.

### Dependencies

- `DiophantineApproximationAndTranscendence:DT.3`: `baker-lower-bounds-for-linear-forms-in-logarithms`
  (Corollary 5.3), `matveev-explicit-lower-bound` (Theorem 5.4), `yu-p-adic-lower-bound`
  (Theorem 5.16), and Yu's bound for algebraic numbers at prime ideals (a gap until DT.3 states it).
- `DiophantineApproximationAndTranscendence:DT.0`: `naive-height-of-algebraic-number`,
  `mahler-measure-of-algebraic-number` (conjugate invariance).
- Mathlib: the unit theorem and regulator API, `house`, heights and the product formula,
  `ZSpan`, `padicValRat`, `Polynomial.homogenize`, `integralNormalization`, class-group
  finiteness. Nothing is requested from another roadmap.
- Consumers: `EffectiveDiophantineMethods:ED.2` (certified reduction and enumeration of every
  region above) and, through it, `ED.5`; the stage input `GeometryOfNumbersAndQuadraticArithmetic:GN.5`
  is not used by any node (the lattice step of Lemma 5.10 is Mathlib's), and dropping that edge is
  proposed.

### Acceptance for the layer

Every reduction preserves the solution set (monic reduction, Siegel identity, S-unit normal form,
the superelliptic example and the S-integral representation are stated as bijections or
covering maps), and every final region is a proven bound: a box in exponents or in `|x|, |y|` given
by an explicit expression. The numerical tests — `3^m − 2^n = 1`, `x³ − 2y³ = 1`, `y³ = 2x(x − 3)`,
de Weger's 545, Tzanakis–de Weger's 72 and Wildanger's degree-9 field — are the joint acceptance
tests of DT.4 and ED.2.

### Sources

Evertse, *Diophantine Approximation*, 2019 notes, Chapter 5 (all of sections 5.2–5.4, the
applications of 5.1, Exercise 5.9) and Chapter 3 (house, Lemma 3.6, Exercises 3.6–3.7);
Bugeaud–Győry, *Bounds for the solutions of unit equations*, Acta Arith. 74 (1996), sections 1–3;
Bérczes–Evertse–Győry, *Effective results for hyper- and superelliptic equations over number fields*
(arXiv:1301.7168), sections 1–2; Tzanakis–de Weger, *How to explicitly solve a Thue–Mahler
equation*, Compositio Math. 84 (1992), sections 1–5. The atlas's selected sources (Schmidt,
LNM 785; Waldschmidt's Springer book) are not public; Evertse's notes and the papers above are the
public equivalents used.

## DT.5 — Further transcendence and unlikely intersections

This layer carries transcendence theory beyond Baker: **E- and G-functions** (Siegel–Shidlovskii,
André's theorem on E-operators, Beukers' refinement), **Mahler's method** (Nishioka's theorem and
the lifting theorems of Philippon and Adamczewski–Faverjon), **algebraic independence**
(Nesterenko's theorem and the independence of π and e^π), and **functional transcendence** (Ax's
theorem — Ax–Schanuel and Ax–Lindemann–Weierstrass for the exponential). **Schanuel's conjecture**
and the conjecture on algebraic independence of logarithms are stated as propositions and used only
as explicit hypotheses. The layer's contribution to unlikely intersections is the functional
transcendence that `LogicAndDefinabilityInNumberTheory:LD.6` consumes; the unlikely-intersection
theorems themselves are owned elsewhere (see Boundaries).

Public sources: Beukers, *A refined version of the Siegel–Shidlovskii theorem* (arXiv math/0405549,
Ann. of Math. 2006); Beukers' Arizona Winter School 2008 notes *E-functions and G-functions*;
Fischler–Rivoal (arXiv 1910.06817) for the definition; Adamczewski–Faverjon (arXiv 1508.07158) for
Mahler's method; Kirby (arXiv 0708.1352) for the proof of Ax's theorem; Bakker–Tsimerman's lectures
on Ax–Schanuel; Waldschmidt, *Transcendence of periods* (PAMQ 2006) for Nesterenko and the
logarithm conjecture; André (arXiv 1107.1179) for the fibre-dimension argument. The atlas's selected
sources (Schmidt, Waldschmidt's book) and the classical monographs (Shidlovskii; Nishioka, LNM 1631;
Nesterenko–Philippon, LNM 1752; Ax, Annals 1971) are not public.

### Conventions (pinned)

- Power series are Mathlib's `PowerSeries ℂ`, differentiated by `PowerSeries.derivative`. An
  E-function is recorded by its coefficient sequence `a : ℕ → ℂ`, meaning `f(z) = Σ a_n zⁿ/n!`
  (`ePowerSeries a`, and the entire function `eFun a`); a G-function by `a` meaning `Σ a_n zⁿ`.
- `Q̄ = algebraicClosure ℚ ℂ` (as the subfield `Qbar`); "algebraic coefficients" means
  `IsAlgebraic ℚ`. The **size** of an algebraic number is the maximum absolute value of its
  conjugates (roots of its minimal polynomial). E- and G-functions use the **geometric**
  normalisation (sizes and denominators `≤ C^{n+1}`); Siegel's `(n!)^ε` variant is not used.
- Transcendence degrees are Mathlib's `Algebra.trdeg`. Functional transcendence degrees are taken
  over `ℂ(z) = RatFunc ℂ` inside `LaurentSeries ℂ` (with `open scoped RatFunc` for the algebra
  structure); for series with algebraic coefficients this equals the degree over `Q̄(z)`
  (`transcendence-over-algebraic-rational-functions`).
- A first-order system is `T(z) F′ = M(z) F` with `T, M` polynomial with algebraic coefficients
  (`SolvesSystem`); `T` is the common denominator of `A = M/T`.
- A Mahler system is `F(z) = A(z) F(z^q)`, `q ≥ 2`, `A ∈ GL_n(Q̄(z))`; `f(z^r)` is `expandPow r f`.
- Conjectures are `Prop`-valued definitions with complete bodies; no DT.5 theorem assumes one
  without taking it as a hypothesis.

### Objects

**`IsDFinite k f` — D-finite power series** (`DT.5/d-finite-power-series`): `f` satisfies
`Σ_{i≤n} p_i f^{(i)} = 0` with `p_i ∈ k[z]`, `p_n ≠ 0`. API: `IsDFinite.add`, `.mul`, `.derivative`,
`.mono`, `isDFinite_polynomial`, `isDFinite_iff_pRecursive` (coefficients satisfy a polynomial
recurrence). Unit tests: `exp` and `Σ zⁿ` are D-finite over `ℚ`; polynomials are; the lacunary
`Σ z^{2^n}` is not, even over `ℂ`.

**`dfiniteOrder` — the minimal differential equation** (`DT.5/minimal-differential-equation`): the
least order of an equation; minimal equations are proportional (`minimal_equation_unique`); the
order is `0` exactly for `f = 0`; `IsMinimalSingularPoint` is a common zero of the leading
coefficients of minimal equations. A singular point is **apparent** if the minimal operator has a
basis of solutions holomorphic there. Unit tests: `exp` has order 1 and no finite singular point;
`(z − 1)eᶻ` has minimal equation `(z − 1)f′ = zf`, singular (apparently) at `1`; a non-minimal
equation such as `(z − 1)(f′ − f) = 0` must not be used to define singular points.

**`IsEFunction a` — E-functions** (`DT.5/e-function`): algebraic coefficients, D-finite over `Q̄`,
sizes `≤ C^{n+1}`, common denominators `d_n ≤ D^{n+1}` with `d_n a_m` integral for `m ≤ n`. API:
`ePowerSeries`, `eFun`, `hurwitzMul` with `ePowerSeries_hurwitzMul`, `IsEFunction.add`,
`.hurwitzMul`, `.shift`, `.map_ringEquiv` (Galois conjugates), `.differentiable`, `.hasSum`,
`.exists_numberField`. Unit tests: `exp` (`a_n = 1`) and `(z − 1)eᶻ` (`a_n = n − 1`) are
E-functions; `e^{z²}` is not (in this normalisation); `1/(1 − z)` (`a_n = n!`) is not.

**`IsGFunction a` — G-functions** (`DT.5/g-function`): the same conditions for `Σ a_n zⁿ`.
API: `isGFunction_iff_isEFunction` (Borel transform), `IsGFunction.add`, `.mul`, `.hasRadius`.
Unit tests: `−log(1 − z)` and `Σ zⁿ` are G-functions; `exp` is not (denominators `n!`).

**`IsMahlerFunction q f` — Mahler functions** (`DT.5/mahler-function`): algebraic coefficients and
`Σ p_i(z) f(z^{q^i}) = 0` with `p_i ∈ Q̄[z]` not all zero. API: `expandPow`,
`IsMahlerFunction.add`, `.mul`, `.expandPow`, `isMahlerFunction_of_polynomial`,
`isMahlerFunction_iff_system`. Unit tests: `Σ z^{2^n}` (`z f(z) − (1 + z) f(z²) + f(z⁴) = 0`) and the
Thue–Morse product (`f = (1 − z) f(z²)`) are 2-Mahler; `exp` is not q-Mahler for any `q`; `z` is.

**`IsMahlerRegularPoint q A α` — regular points** (`DT.5/mahler-regular-point`): `0 < |α| < 1` and no
`α^{q^ℓ}`, `ℓ ≥ 0`, is a pole of an entry of `A` or `A⁻¹`. API: `isMahlerRegularPoint_iff`,
`IsMahlerRegularPoint.pow`, `isMahlerRegularPoint_of_polynomial`. Unit tests: for `A = [[1, 0], [z, 1]]`
every point is regular; for `A = (1 − 2z)⁻¹` the point `2^{−1/2}` is not (its square is a pole) —
checking only `ℓ = 0` is wrong; the empty system.

**`SchanuelConjecture`** (`DT.5/schanuel-conjecture`): for `ℚ`-linearly independent
`z_1, …, z_n ∈ ℂ`, `trdeg_ℚ ℚ(z, e^z) ≥ n`. API: `SchanuelConjecture.le_trdeg`,
`schanuel_inequality_of_isAlgebraic` (unconditional for algebraic arguments: Lindemann–Weierstrass,
DT.3), and the consequences below. Unit tests: `n = 1, z = 1` (e transcendental) and `z = (iπ)`
(π transcendental) hold unconditionally; `z = (1, 2)` shows linear independence cannot be dropped;
`n = 0` is trivial.

**`LogarithmsAlgebraicIndependenceConjecture`** (`DT.5/logarithms-algebraic-independence-conjecture`):
`ℚ`-linearly independent logarithms of algebraic numbers are algebraically independent. API:
`logarithmsConjecture_one` (the unconditional case `n = 1`),
`LogarithmsAlgebraicIndependenceConjecture.transcendental_div` (its Gelfond–Schneider shadow),
`logarithmsConjecture_of_schanuel`. Unit tests: Hermite–Lindemann for one logarithm; `log 2, log 4`
dependent; the conjecture predicts `log 2, log 3` independent.

### Foundations planned here

- **Cauchy's theorem for linear systems** (`DT.5/holomorphic-solutions-of-linear-systems`): with
  coefficients holomorphic on a disc, every initial value has a unique holomorphic solution on the
  whole disc; the solution space is `n`-dimensional (majorant method, identity theorem).
- **Kähler differentials** (`DT.5/kaehler-differentials-and-transcendence-degree`): for a finitely
  generated extension `E/C` in characteristic 0, `dim_E Ω_{E/C} = trdeg_C E`, with the differentials
  of a transcendence basis as basis (Mathlib's `KaehlerDifferential.mvPolynomialBasis`, localisation and
  `tensorKaehlerEquivOfFormallyEtale`); the transcendence-degree-one case is Tau Ceti's
  AlgebraicCurves layer 9.
- **Fibre dimension** (`DT.5/fibre-dimension-over-the-affine-line`): a torsion-free finitely
  generated `K[z]`-domain `A` has `dim A/(z − ξ)A + 1 = dim A = 1 + trdeg_{K(z)} Frac A` at every
  nonempty fibre (Krull's height theorem, going down for flat maps, Noether normalization).
- **Transcendence over `Q̄(z)` versus `ℂ(z)`** (`DT.5/transcendence-over-algebraic-rational-functions`).

### E-functions and G-functions

- **Ring structure** (`DT.5/e-functions-form-a-ring`), **monomial systems**
  (`DT.5/monomials-of-e-functions-solve-a-system`), **division at a rational zero**
  (`DT.5/rational-e-function-divided-by-vanishing-factor`).
- **Shidlovskii's lemma** (`DT.5/shidlovskii-lemma`) and **Chudnovsky's theorem**
  (`DT.5/chudnovsky-galochkin-condition`): a system of `Q̄(z)`-independent G-functions satisfies
  Galochkin's condition (denominators of `T^m G_m/m!` grow geometrically), via Siegel's lemma
  (Mathlib's `NumberField.house.exists_ne_zero_int_vec_house_le`).
- **G-operators at 0** (`DT.5/g-operator-regular-singularity-at-zero`): the minimal equation of a
  G-function is regular singular at 0.
- **Laplace transform** (`DT.5/laplace-transform-of-e-function`): `∫_0^∞ e^{−xt} f(t) dt = (1/x) g(1/x)`.
- **André's theorem** (`DT.5/andre-theorem-on-e-operators`, planet *André's theorem on
  E-operators*): every E-function satisfies `z^m y^{(m)} + Σ_k z^k q_k(z) y^{(k)} = 0` with
  `deg q_k ≤ m − k` — singular only at 0 and ∞. Hence (`DT.5/andre-holomorphic-solution-basis`) the
  minimal equation has holomorphic solutions at every `z ≠ 0`, and (`DT.5/andre-vanishing-corollary`)
  a rational E-function vanishing at 1 forces an apparent singularity there; this already proves π
  transcendental.
- **Beukers' vanishing theorem** (`DT.5/beukers-vanishing-theorem`): at a zero `ξ ∈ Q̄^×` of an
  E-function all solutions of its minimal equation vanish (Galois conjugates, differential Galois
  groups and their identity components).
- **Relations** (`DT.5/relation-module-basis-with-full-rank-specialisations`,
  `DT.5/beukers-linear-relations-theorem`): at `ξT(ξ) ≠ 0`, every `Q̄`-linear relation between
  values is a specialisation of a functional one; `Q̄(z)`-independent E-functions have
  `Q̄`-independent values.
- **Beukers' refined Siegel–Shidlovskii theorem** (`DT.5/beukers-refined-siegel-shidlovskii`,
  planet): every homogeneous algebraic relation between the values at `ξ` lifts to a relation over
  `Q̄[z]`. **Siegel–Shidlovskii** (`DT.5/siegel-shidlovskii-theorem`) follows with the fibre-dimension
  lemma: `trdeg` of the values equals `trdeg` of the functions.
- **Division and removal of singularities** (`DT.5/e-function-division-by-vanishing-factor`,
  `DT.5/beukers-removal-of-nonzero-singularities`): `f/(z − ξ)` is an E-function at a zero, and
  E-function systems factor as `f = B·e` with `e` solving a system over `Q̄[z, 1/z]`.
- **Lindemann–Weierstrass** (`DT.5/lindemann-weierstrass-via-e-functions`): the case
  `f_i = e^{β_i z}`; it must agree with DT.3's `lindemann-weierstrass-in-bakers-form`.
- **Galochkin–Chudnovsky** (`DT.5/galochkin-chudnovsky-linear-independence`): values of
  independent rational G-functions at `a/b` with `b > C|a|^{n+1}` are `ℚ`-linearly independent.

### Mahler's method

- **Nishioka's theorem** (`DT.5/nishioka-theorem`, planet): at a regular algebraic point the
  transcendence degree of the values equals that of the functions.
- **Lifting** (`DT.5/mahler-homogeneous-relations-lift`, `DT.5/mahler-linear-relations-lift`):
  homogeneous (and linear) relations between values at regular points lift to `Q̄[z]`.
- **Dichotomy** (`DT.5/mahler-values-transcendence-dichotomy`): a Mahler value at an algebraic
  non-pole is transcendental or lies in the number field of the data (Cobham's conjecture for
  automatic series).
- **Mahler's example** (`DT.5/lacunary-series-not-rational`, `DT.5/mahler-fredholm-transcendence`):
  `Σ α^{2^n}` is transcendental for algebraic `0 < |α| < 1`.

### Algebraic independence

- **Nesterenko's theorem** (`DT.5/nesterenko-theorem`, planet): for `τ ∈ ℍ`, three of
  `q = e^{2πiτ}, E₂(τ), E₄(τ), E₆(τ)` are algebraically independent (Mathlib's
  `EisensteinSeries.E2`, `ModularForm.E₄`, `ModularForm.E₆`, constant term 1).
- **Special values** (`DT.5/eisenstein-series-values-at-i`): `E₂(i) = 3/π`, `E₆(i) = 0`,
  `q(i) = e^{−2π}` (from Mathlib's `E2_slash_action` and weight-6 modularity).
- **π and e^π** (`DT.5/pi-and-exp-pi-algebraically-independent`): algebraically independent.

### Functional transcendence

- **Ax's lemmas** (`DT.5/ax-constant-coefficient-lemma`, `DT.5/ax-integer-relation-lemma`): for
  solutions of `D x_i = D y_i / y_i`, a minimal dependence among `dy_i/y_i − dx_i` has constant
  coefficients (Lie derivative), and a constant dependence forces `Σ z_i x_i ∈ C` for some nonzero
  `z ∈ ℤⁿ` (algebraic subgroups of `G_aⁿ × G_mⁿ`).
- **Ax–Schanuel** (`DT.5/ax-schanuel-theorem`, planet *Ax–Schanuel theorem*): with derivations
  `D_1, …, D_k` of `F` and constants `C`, if the `x_i` are `ℚ`-independent modulo `C` then
  `trdeg_C C(x, y) ≥ n + rank(D_j x_i)`. **Power-series form** (`DT.5/ax-schanuel-power-series`),
  **weak form** (`DT.5/weak-ax-schanuel`) and **Ax–Lindemann–Weierstrass**
  (`DT.5/ax-lindemann-weierstrass`): if the `f_i` parametrise an algebraic variety, the `e^{f_i}`
  are algebraically independent; geometrically, maximal algebraic subvarieties of `π⁻¹(V)` are
  rational translates, and Zariski closures of `π(V)` are finite unions of torus cosets.

### Conditional consequences

- `DT.5/schanuel-implies-e-pi-algebraically-independent`: Schanuel's conjecture implies that
  `e` and `π` are algebraically independent (apply it to `1, iπ`).
- `DT.5/schanuel-implies-logarithms-conjecture`: Schanuel's conjecture implies the logarithm
  conjecture (apply it to the logarithms themselves).

### Boundaries

- Periods: the formal periods and evaluation map are `PeriodsAndSpecialValues:PS.2`; the
  Kontsevich–Zagier period conjecture and its relatives are stated in
  `PeriodsAndSpecialValues:PS.7`. DT.5 restates neither.
- Unlikely intersections: Pila–Wilkie, Pila–Zannier and André–Oort are
  `LogicAndDefinabilityInNumberTheory:LD.6` (which consumes DT.5's exponential Ax–Schanuel and
  Ax–Lindemann–Weierstrass; the modular and Shimura versions, proved by o-minimal methods, belong
  there); Mordell–Lang, Manin–Mumford and Bogomolov are `HeightsRationalPointsAndObstructions:RP.5`;
  dynamical ones are `ArithmeticDynamics:DY.6`.
- Function-field algebraic independence (Papanikolas) is `DrinfeldModulesAndTModules:DM.8`.
- Lindemann–Weierstrass, Gelfond–Schneider and Baker's theorems are DT.3; DT.5 uses them only for
  compatibility statements.

### Dependencies

Mathlib (power series, derivations, Kähler differentials, `Algebra.trdeg`, `AlgebraicIndependent`,
`RatFunc`, `LaurentSeries`, Eisenstein series, Noether normalization, Krull dimension, analytic
functions); DT.3 (`lindemann-weierstrass-in-bakers-form`, `gelfond-schneider`). Differential Galois
theory (Picard–Vessiot) is required by Beukers' vanishing theorem and is planned by no roadmap: a
roadmap for linear differential equations and differential Galois theory is proposed to supply it,
and the dimension theory of finitely generated algebras is proposed for
`SchemeAndStackFoundations:SF.0`.

### Acceptance for the layer

Each named theorem carries its complete proof source or the precise missing input: Beukers' chain
from André's theorem to Theorem 1.3 is decomposed; André's theorem rests on Chudnovsky's theorem,
whose Shidlovskii-lemma input has no public proof; Nishioka's and Nesterenko's theorems have no
public proof source; Ax–Schanuel rests on Kirby's section 3 with Chevalley's indecomposability
theorem as the missing input. Conjectural principles appear only as the definitions
`SchanuelConjecture` and `LogarithmsAlgebraicIndependenceConjecture` and as hypotheses of the two
conditional theorems. Numerical and structural tests: `e^{β_i}` independence recovers
Lindemann–Weierstrass; `Σ 2^{−2^n}` is transcendental; `E₂(i) = 3/π`; `trdeg ℂ(t, eᵗ) = 2`.
