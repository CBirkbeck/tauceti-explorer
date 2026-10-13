# Diophantine approximation and transcendence — Layer DT.0, continued: covering, Siegel's lemma in product form, partial quotients and tuple heights

This document continues Layer DT.0 (heights and approximation constants) of the roadmap *Diophantine
approximation and transcendence*. The first part of the layer, in the roadmap's main document, plans
the 46 targets of the stage: the primitive minimal polynomial, naive height, Mahler measure and house
of an algebraic number and their comparisons with Mathlib's absolute Weil height; Northcott's theorem;
Siegel's lemma over a number field with a uniform house bound; Dirichlet's theorems derived from
Minkowski's linear forms theorem; Kronecker's approximation theorem; the exponents of approximation,
badly approximable numbers and Littlewood's conjecture; and the continued-fraction formula for the
irrationality exponent. Everything here builds on those results and cites them by their identifiers;
nothing there is restated.

What this part adds:

- **The covering bound behind Kronecker's theorem** (§0.4a). If every nonzero vector of the polar
  lattice `L*` has length at least `R`, every point of the ambient space lies within `n/R` of `L`
  (Evertse, Corollary 2.21, with the explicit constant `n`). It is derived from the covering
  transference `μ(L)·λ₁(L*) ≤ n` of GeometryOfNumbersAndQuadraticArithmetic, Layer 4. It is stated
  in Euclidean form and in the maximum-norm matrix form that the proof of Kronecker's theorem uses.
  It replaces the request the first part addressed to GN.4.
- **Siegel's lemma in product form** (§0.3a). The bound is
  `((2√2·N)^{dM}·∏_i ∏_k max_j |σ_k(a_ij)|)^{1/(N−dM)}` (Berrevoets, Lemma 3.2), which sees each
  row and each embedding separately. Dobrowolski's auxiliary polynomial in ClassicalArithmeticCompletion
  (CA.6) needs exactly this form, because the uniform house bound loses the Mahler measure.
- **Bounded partial quotients** (§0.6a). An irrational number is badly approximable exactly when its
  partial quotients are bounded, with explicit constants both ways: `a_n ≤ B` gives
  `q‖qξ‖ > 1/(B+2)`, and `q‖qξ‖ ≥ c` gives `a_n ≤ 1/c`. The statement uses Mathlib's
  `GenContFract.of`, as ProbabilisticAndMetricNumberTheory (PM.4) requested.
- **The maximum height of a tuple** (§0.2a). `h_max(y) = max_i h(y_i)`, the height of an algebraic
  vector in Binyamini's point-counting paper, with the minimal-polynomial formula
  `h(x) = (log a₀ + Σ log max(1,|x_i|))/d` as an API item.

## Scope and boundaries

This part owns the four targets above. It does not own:

- the covering radius, the successive minima and the transference theorems of lattices
  (GeometryOfNumbersAndQuadraticArithmetic, Layers 1 and 4), which §0.4a only applies;
- Waldschmidt's Thue–Siegel lemma for real linear forms, which the first part plans in Layer DT.3
  (`DT.3/thue-siegel-lemma-for-inequalities`) and which Binyamini's Lemma 25 specialises;
- the absolute height of a projective point and its comparison with `h_max`
  (HeightsRationalPointsAndObstructions, Layer RP.0);
- the scalar absolute height itself, which is Mathlib's `NumberField.absLogHeight₁`.

Dobrowolski's theorem is ClassicalArithmeticCompletion's (CA.6), and the dynamics of bounded
continued fractions is ProbabilisticAndMetricNumberTheory's (PM.4); both import from here.

## Conventions

**Lattices.** A lattice in a finite-dimensional real inner-product space `E` is a discrete
`Submodule ℤ E` spanning `E` (`IsZLattice ℝ L`). Its polar lattice is
`L* = {y : ⟨y, x⟩ ∈ ℤ for all x ∈ L}`, Mathlib's `LinearMap.BilinForm.dualSubmodule (innerₗ E) L`.
In coordinates, `L = Bℤⁿ` for an invertible matrix `B` whose columns form a basis, and
`L* = (Bᵀ)⁻¹ℤⁿ` for the standard dot product. On `Fin n → ℝ` Mathlib's norm is the maximum norm; on
`EuclideanSpace ℝ (Fin n)` it is the Euclidean norm.

**Number fields.** `K` has degree `d`, and `σ₁, …, σ_d` are all ring homomorphisms `K → ℂ`, so each
complex place contributes an embedding and its conjugate. Coefficients of Siegel's lemma are in
`𝓞 K`; unknowns are in `ℤ`.

**Continued fractions.** For irrational `ξ = [a₀; a₁, a₂, …]`, the partial quotient `a_{n+1}` is the
`n`-th partial denominator of `GenContFract.of ξ`; `a₀ = ⌊ξ⌋` is its head and is never bounded.
`q_n = (GenContFract.of ξ).dens n` are the denominators of the convergents,
`‖t‖ = |t − round t|`, and `ξ` is badly approximable when it is irrational and
`q·‖qξ‖ ≥ c > 0` for every integer `q ≥ 1` (the first part's `DT.0/badly-approximable`).

**Heights.** `h = NumberField.absLogHeight₁` is the absolute logarithmic Weil height and
`H = NumberField.absMulHeight₁ = e^h`. Both are independent of the field and take the junk values
`h = 0` and `H = 1` at transcendental elements.

## Sources

- J.-H. Evertse, *Diophantine approximation*, lecture notes (Leiden, 2019), Chapter 1 (Exercise 1.7,
  printed p. 8), Chapter 2, §§2.4–2.5 (printed pp. 31–36) and Chapter 3, Theorem 3.20 (printed p. 52);
  `pub.math.leidenuniv.nl/~evertsejh/dio.shtml`.
- O. B. Berrevoets, *On Lehmer's problem*, bachelor thesis, Leiden University (2016), Chapter 3,
  printed pp. 10–15; `math.leidenuniv.nl/scripties/BachBerrevoets.pdf`.
- L. Pottmeyer, *Diophantine Approximation*, lecture notes, version of 17 January 2022, Chapter 1,
  §1.3, printed pp. 12–21; `esaga.uni-due.de/f/lukas.pottmeyer/DioApp.pdf`.
- G. Binyamini, *Point counting for foliations over number fields*, Forum of Mathematics, Pi 10
  (2022), e6, §1.1.4 (p. 2) and §5 (pp. 18–19); doi:10.1017/fmp.2021.20.

## How the targets fit together

The four targets are independent of one another. §0.4a rests on GeometryOfNumbersAndQuadraticArithmetic
and feeds the first part's Kronecker theorem. §0.3a is a self-contained box-principle argument that
refines the first part's Siegel lemma and feeds ClassicalArithmeticCompletion. §0.6a combines the
first part's lower bound for the error of a convergent with Mathlib's continued-fraction API and
Legendre's theorem, and feeds ProbabilisticAndMetricNumberTheory. §0.2a is a light definition on top
of Mathlib's absolute height and the first part's height comparisons.

## Targets

### 0.2a The maximum height of a tuple

<a id="max-absolute-height-of-tuple"></a>
#### The maximum absolute height of a tuple of algebraic numbers

`DT.0/max-absolute-height-of-tuple` · definition · Lean: `maxAbsLogHeight`, `maxAbsMulHeight`

Let `F` be a field of characteristic zero, `ι` a finite type and `y : ι → F`. Define
`h_max(y) := max_{i∈ι} h(y_i)`, where `h = NumberField.absLogHeight₁`, and `h_max(y) := 0` when `ι` is
empty. In Lean this is the real supremum `⨆ i, absLogHeight₁ (y i)`, which is `0` for an empty
family. The multiplicative form is `H_max(y) := exp h_max(y)`, the maximum of `1` and the
`absMulHeight₁ (y i)`. For an algebraic `x` of degree `d` whose primitive minimal polynomial is
`a₀·∏_{i=1}^{d}(X − x_i)` with `a₀ > 0`, `h(x) = (log a₀ + Σ_i log max(1, |x_i|))/d`.

*Hypotheses.*

- `F` has characteristic zero. A transcendental coordinate gets Mathlib's junk value `h = 0`, so
  statements about the height of a tuple assume every coordinate algebraic.
- This is the maximum of the scalar heights, not the absolute height of the projective point
  `[1 : y_1 : ⋯ : y_m]`. That projective height, and its comparison with `h_max`, belong to
  HeightsRationalPointsAndObstructions, Layer RP.0.

*Uses.*

- Binyamini, §1.1.4, formula (1), p. 2: the height of an algebraic vector is the largest height of its
  coordinates, and the counting sets `A(g, h; Φ)` of (70), p. 19, bound `h(Φ(p))` in this sense.
- Binyamini, Lemma 27, p. 19: the lower bound for an integer polynomial at an algebraic point is
  stated through `H(y)^{d(m+1)}` with `H(y) = exp h_max(y)`.
- HeightsRationalPointsAndObstructions, Layer RP.0: the consumer named by the routing of Binyamini's
  paper, which compares `h_max` with the projective tuple height.

*API.*

- `maxAbsLogHeight` (constructor): `h_max(y) := ⨆ i, absLogHeight₁(y_i)` for `y : ι → F` with `ι`
  finite.
- `maxAbsLogHeight_of_isEmpty` (simp): `h_max(y) = 0` when `ι` is empty.
- `maxAbsLogHeight_unique` (simp): for `ι` with exactly one element `i`, `h_max(y) = absLogHeight₁(y_i)`.
- `absLogHeight₁_le_maxAbsLogHeight` (relation): `absLogHeight₁(y_i) ≤ h_max(y)` for every `i`.
- `maxAbsLogHeight_le_iff` (characterisation): for `t ≥ 0`, `h_max(y) ≤ t` if and only if
  `absLogHeight₁(y_i) ≤ t` for every `i`.
- `absLogHeight₁_nonneg` (compatibility): `0 ≤ absLogHeight₁ x` for every `x` in a field of
  characteristic zero, since `absMulHeight₁ x ≥ 1`.
- `maxAbsLogHeight_nonneg` (relation): `0 ≤ h_max(y)`.
- `maxAbsLogHeight_comp_equiv` (functoriality): `h_max(y ∘ e) = h_max(y)` for an equivalence
  `e : κ ≃ ι`.
- `maxAbsLogHeight_map` (functoriality): `h_max(f ∘ y) = h_max(y)` for a ring homomorphism
  `f : F → F′` of characteristic-zero fields. `f` maps algebraic elements to algebraic elements with
  the same minimal polynomial, and transcendental ones to transcendental ones.
- `absLogHeight₁_eq_log_mahlerMeasure_div` (relation): for algebraic `x` of degree `d`,
  `absLogHeight₁ x = log M(x)/d = (log a₀ + Σ_i log max(1, |x_i|))/d` (Binyamini's formula (1)). In
  Lean it is stated for any primitive `P ∈ ℤ[X]` of degree `d` with `P(x) = 0`, through Mathlib's
  `Polynomial.mahlerMeasure` of `P` over `ℂ`.
- `maxAbsMulHeight` (data): `H_max(y) := exp h_max(y)`.
- `maxAbsMulHeight_eq_max_one_iSup` (characterisation): `H_max(y) = max(1, max_i absMulHeight₁(y_i))`;
  in particular `H_max` of the empty tuple is `1`.
- `finite_setOf_maxAbsLogHeight_le` (other): for `m, D ∈ ℕ` and `T ∈ ℝ`, the set of `y ∈ ℂ^m` with
  every `y_i` algebraic of degree at most `D` and `h_max(y) ≤ T` is finite (Northcott for tuples).

*Unit tests.*

- `test_maxAbsLogHeight_empty` (degenerate): `maxAbsLogHeight y = 0` for `y : Fin 0 → ℚ`.
- `test_maxAbsLogHeight_pair` (computation): `maxAbsLogHeight ![(2 : ℚ), 1/3] = log 3`.
- `test_maxAbsLogHeight_sqrtTwo` (computation): `maxAbsLogHeight ![√2] = (log 2)/2`. The height of `√2`
  computed in `ℚ(√2)` without the normalisation `1/[ℚ(√2):ℚ]` would give `log 2`.
- `test_maxAbsLogHeight_rootsOfUnity` (computation): `maxAbsLogHeight ![Complex.I, -1] = 0`.
- `test_maxAbsLogHeight_ne_projective` (non-example): `maxAbsLogHeight ![(2 : ℚ), 1/2] = log 2`,
  whereas the projective point `[1 : 2 : 1/2] = [2 : 4 : 1]` has
  `Height.logHeight ![(2 : ℚ), 4, 1] = log 4`.

*Proof sketch.*

1. Define `maxAbsLogHeight y := ⨆ i, NumberField.absLogHeight₁ (y i)` in `ℝ`. The family is finite,
   hence bounded, and `Real.iSup_of_isEmpty` gives the value `0` for empty `ι`.
2. Nonnegativity: for algebraic `x`, `absMulHeight₁ x` is `mulHeight₁` of the generator of `ℚ(x)`,
   which is at least `1` (`Height.one_le_mulHeight₁`), raised to a positive power; otherwise it is `1`.
3. The formula for `h(x)`: `DT.0/height-comparisons` gives `log M(x) = d·h(x)`, and
   `DT.0/mahler-measure-of-algebraic-number` gives `M(x) = a₀·∏_i max(1, |x_i|)`.
4. Invariance: `h(x)` depends only on the minimal polynomial of `x`
   (`DT.0/abs-mul-height-eq-of-minpoly-eq`), so `h_max` is unchanged by a field embedding applied to
   every coordinate and by reindexing.
5. Northcott for tuples follows coordinate by coordinate from `DT.0/northcott-absolute-height`.

*Checks.*

- `h_max(2, 1/3) = log 3`, and `h_max(√2) = (log 2)/2`.
- `h_max` of the empty tuple is `0`, and `h_max(i, −1) = 0`.
- `h_max(2, 1/2) = log 2`, while `[1 : 2 : 1/2]` has logarithmic height `log 4`.

*Needs:* `DT.0/height-comparisons` (first part); `DT.0/mahler-measure-of-algebraic-number` (first
part); `DT.0/abs-mul-height-eq-of-minpoly-eq` (first part); `DT.0/northcott-absolute-height` (first
part); Mathlib `NumberField.absLogHeight₁`, `NumberField.absMulHeight₁`, `Height.one_le_mulHeight₁`,
`Real.iSup_of_isEmpty`.

*Source:* Binyamini, §1.1.4, formula (1), p. 2: the absolute logarithmic height through the minimal
polynomial over `ℤ`, `H = e^h`, and the height of a vector as the largest height of its coordinates.
Binyamini, Lemma 27, (69), and (70), p. 19: the uses for vectors.

### 0.3a Siegel's lemma in product form

<a id="siegel-lemma-number-field-product"></a>
#### Siegel's lemma over a number field in product form

`DT.0/siegel-lemma-number-field-product` · theorem · Lean:
`exists_ne_zero_int_vec_abs_le_of_prod_embeddings`

Let `K` be a number field of degree `d` and `σ₁, …, σ_d` its embeddings into `ℂ`. Let `M ≥ 0` and `N`
be integers with `N > dM`, and let `a_ij ∈ 𝓞_K` (`1 ≤ i ≤ M`, `1 ≤ j ≤ N`) be such that every row
`(a_i1, …, a_iN)` has a nonzero entry. Put `P_i := ∏_{k=1}^{d} max_{1≤j≤N} |σ_k(a_ij)|`; then
`P_i ≥ 1`. The system `Σ_j a_ij x_j = 0` (`1 ≤ i ≤ M`) has a solution `x ∈ ℤ^N ∖ {0}` with

`max_j |x_j| ≤ ((2√2·N)^{dM}·P_1⋯P_M)^{1/(N−dM)}`.

For `M ≥ 1` the bound equals `(2√2·N·(P_1⋯P_M)^{1/(dM)})^{dM/(N−dM)}`, the form of Berrevoets's
Lemma 3.2.

*Hypotheses.*

- The unknowns are rational integers and the coefficients algebraic integers. The bound sees each row
  through its own embedding maxima, so one row with large coefficients does not enlarge the
  contribution of the others.
- Every row must have a nonzero entry. A zero row gives `P_i = 0` and the bound `0`, which no nonzero
  `x` meets. A zero row imposes no condition and can be deleted first.
- `M = 0` is allowed (bound `1`, solution `e₁`); Berrevoets states `M ≥ 1`.
- `σ₁, …, σ_d` run over all `d` ring homomorphisms `K → ℂ` (`NumberField.Embeddings.card`): each
  complex embedding appears together with its conjugate.

*Proof sketch.*

1. Real coordinates: `τ_k := σ_k` for the `r₁` real embeddings and, for one embedding `σ` of each
   conjugate pair, `Re σ` and `Im σ`; there are `d` of them. For an integer `Y ≥ 1` and
   `y ∈ {0, …, Y}^N`, each `τ_k(Σ_j a_ij y_j)` lies in `[−A_ki, A_ki]` with
   `A_ki := N·Y·max_j |τ_k(a_ij)| ≤ N·Y·max_j |σ_k(a_ij)|`.
2. Cut each interval into `n_i := ⌊1 + 2√2·N·Y·P_i^{1/d}⌋` equal pieces, giving `∏_i n_i^d` boxes. If
   `(Y + 1)^N > ∏_i n_i^d`, the box principle (`Finset.exists_ne_map_eq_of_card_lt_of_maps_to`) gives
   `y ≠ y′` in one box, and `x := y − y′` is nonzero with `|x_j| ≤ Y`.
3. Each `|τ_k(Σ_j a_ij x_j)|` is at most `2A_ki/n_i`. Combining the real and imaginary parts of a
   complex embedding costs a factor `√2`, so `|σ_k(Σ_j a_ij x_j)| ≤ 2√2·N·Y·max_j|σ_k(a_ij)|/n_i` for
   every `k`. Multiplying over `k` gives
   `|N_{K/ℚ}(Σ_j a_ij x_j)| ≤ (2√2·N·Y·P_i^{1/d}/n_i)^d < 1`.
4. The norm of an algebraic integer is a rational integer (`Algebra.coe_norm_int`) equal to the
   product of its `d` conjugates (`Algebra.norm_eq_prod_embeddings`). It vanishes only at `0`
   (`Algebra.norm_eq_zero_iff`), and a nonzero integer has absolute value at least `1`
   (`Int.one_le_abs`). Hence `Σ_j a_ij x_j = 0` for every `i`.
5. Counting: a nonzero entry `a_iℓ` has `|N(a_iℓ)| ≥ 1`, so `P_i ≥ ∏_k |σ_k(a_iℓ)| ≥ 1` and
   `1 < 2√2·N·P_i^{1/d}`. Then `n_i < 2√2·N·(Y + 1)·P_i^{1/d}`, and the box condition holds once
   `(Y + 1)^{N−dM} ≥ (2√2·N)^{dM}·∏_i P_i`. Take `Y` to be the integer part of
   `((2√2·N)^{dM}·∏_i P_i)^{1/(N−dM)}`. That root is at least `1`, so `Y ≥ 1`; `Y + 1` exceeds the
   root, and `Y` is at most the stated bound.

*Checks.*

- `K = ℚ(i)` (`d = 2`), `M = 1`, `N = 3`, row `(1, i, 1 + i)`: each embedding has row maximum `√2`, so
  `P_1 = 2` and the bound is `((6√2)²·2)^{1/1} = 144`; `x = (1, 1, −1)` solves `1 + i − (1 + i) = 0`
  with `max|x_j| = 1`.
- House form: if `|σ_k(a_ij)| ≤ A` for all `i, j, k`, then `P_i ≤ A^d` and the bound is at most
  `(2√2·N·A)^{dM/(N−dM)}`. Once zero rows are discarded (which lowers `M`), this is below the
  `(3NA)^{dM/(N−dM)}` of `DT.0/siegel-lemma-number-field`, so the product form refines that node.
- `K = ℚ`: `P_i = max_j |a_ij|`, and the bound `((2√2·N)^M·∏_i max_j |a_ij|)^{1/(N−M)}` uses each row's
  own size. Mathlib's `Int.Matrix.exists_ne_zero_int_vec_norm_le` uses the largest entry of the whole
  matrix.
- Dobrowolski's system (`ClassicalArithmeticCompletion:CA.6/dobrowolski-auxiliary-polynomial`): the
  rows `a_ij = C(j, i)·α^{j−i}` (`0 ≤ i < M`, `0 ≤ j ≤ N`, so `N + 1` unknowns) contain `a_ii = 1`, and
  `P_i ≤ N^{d·i}·M(α)^N` for an algebraic integer `α`. This is the input of that node's bound, applied
  with `N + 1` unknowns and exponent `1/(N + 1 − dM)`.

*Needs:* Mathlib `NumberField.RingOfIntegers`, `NumberField.Embeddings.card`,
`Algebra.norm_eq_prod_embeddings`, `Algebra.coe_norm_int`, `Algebra.norm_eq_zero_iff`,
`Int.one_le_abs`, `Finset.exists_ne_map_eq_of_card_lt_of_maps_to`.

*Source:* Berrevoets, Lemma 3.2, p. 11: the statement, with a number field of degree `d`,
algebraic-integer coefficients and no zero row, `N > dM`, and the bound through the product over rows
and embeddings with the constant `2√2·N`. Berrevoets, proof of Lemma 3.2, pp. 12–15: the box
principle in the coordinates `τ_k`, the choice of `n_i`, the norm argument and the choice of `Y`,
followed above with the corrections noted at the end of this document. Berrevoets, Remark 3.3,
pp. 11–12: a nonzero solution exists because the system is `dM` rational equations in `N > dM`
unknowns. Evertse, Theorem 3.20, p. 52: the uniform-house form that this refines.

### 0.4a The covering bound behind Kronecker's theorem

<a id="polar-lattice-covering-bound"></a>
#### Covering bound from a polar lattice without short vectors

`DT.0/polar-lattice-covering-bound` · theorem · Lean: `exists_mem_norm_sub_le_of_polar`
(Euclidean form), `exists_lattice_point_near_of_polar_long` (coordinate form)

Let `E` be a real inner-product space of finite dimension `n`, let `L ⊂ E` be a discrete full
`ℤ`-lattice, and let `L*` be its polar lattice. Let `R > 0` and suppose that `‖y‖ ≥ R` for every
nonzero `y ∈ L*`. Then every `b ∈ E` has a point `x ∈ L` with `‖x − b‖ ≤ n/R`.

Coordinate form: let `B` be an invertible real `n × n` matrix and `L = Bℤⁿ`, so that `L* = (Bᵀ)⁻¹ℤⁿ`.
If every nonzero vector of `(Bᵀ)⁻¹ℤⁿ` has maximum norm at least `R`, then for every `b ∈ ℝⁿ` there is
`z ∈ ℤⁿ` with `|(Bz − b)_i| ≤ n/R` for every `i`.

This is Evertse's Corollary 2.21 with the explicit constant `n` in place of `n·c(n)/2`, and it is the
covering input of the first part's `DT.0/kronecker-approximation-theorem`, applied in `ℝ^{n+1}` with
constant `n + 1`.

*Hypotheses.*

- `n = dim E` may be `0`: then `E = L = L* = 0`, the hypothesis is empty and `x = b = 0`.
- `L*` is the polar for the inner product that defines `‖·‖`. In coordinates that is the standard dot
  product, and the columns of `(Bᵀ)⁻¹` form the basis of `L*` dual to the columns of `B`.
- The hypothesis bounds the polar lattice from below, not `L` itself; a lattice without short vectors
  can cover badly (see the checks).
- Evertse assumes `‖y‖ > R` strictly. The non-strict hypothesis suffices here, because the covering
  transference is applied to the attained first minimum of `L*`.

*Proof sketch.*

1. If `n = 0` take `x = 0`. Let `n ≥ 1`. `L*` is a discrete full lattice:
   `LinearMap.BilinForm.dualSubmodule_span_of_basis` identifies it with the `ℤ`-span of the dual
   basis, and `GN.0/covolume-dual` records that it is full with covolume `covol(L)⁻¹`.
2. The first Euclidean minimum `λ₁(L*)` is at least `R`: by `GN.1/successive-minimum-first` with
   `r = λ₁(L*)`, some nonzero `y ∈ L*` has `‖y‖ ≤ λ₁(L*)`, and `‖y‖ ≥ R` by hypothesis.
3. `GN.4/covering-dual-transference` gives `μ(L)·λ₁(L*) ≤ n` for the covering radius `μ(L)` of
   `GN.4/covering-radius`, hence `μ(L) ≤ n/R`.
4. `L` is closed (a discrete subgroup of a Hausdorff group, the additive form of
   `Subgroup.isClosed_of_discrete`) and nonempty, and `E` is proper, so
   `IsClosed.exists_infDist_eq_dist` gives `x ∈ L` with `‖x − b‖ = dist(b, L) ≤ μ(L) ≤ n/R`.
5. Coordinate form: take `E = EuclideanSpace ℝ (Fin n)` and `L` the `ℤ`-span of the columns of `B`;
   then `L* = (Bᵀ)⁻¹ℤⁿ` (Evertse §2.4, p. 32). A vector whose maximum norm is at least `R` has
   Euclidean norm at least `R`, and `|(x − b)_i| ≤ ‖x − b‖` (`PiLp.norm_apply_le`).

*Checks.*

- Evertse's Theorem 2.20 has an unspecified constant `c(n)` (his remark offers `(4/3)^{n(n−1)/2}` or
  `4ⁿ·vol(Bₙ)⁻²`), and Corollary 2.21 the radius `n·c(n)/(2R)`. Through the covering transference
  the radius is `n/R`, with no successive-minima constant.
- `n = 1`, `L = aℤ` with `a > 0`: `L* = a⁻¹ℤ`, the hypothesis holds with `R = 1/a`, and the theorem
  gives distance at most `a`; the true covering radius is `a/2`.
- `L = ℤⁿ`: `L* = ℤⁿ` and `R = 1`; the point `(1/2, …, 1/2)` is at Euclidean distance `√n/2 ≤ n` and
  at maximum-norm distance `1/2` from `ℤⁿ`.
- Swapping `L` and `L*` in the hypothesis is false. For `n = 2` and `L = ℤ × kℤ` (`k ≥ 2`) every
  nonzero vector of `L` has length at least `1`, yet `(0, k/2)` is at distance `k/2` from `L`. Here
  `L* = ℤ × k⁻¹ℤ` contains `(0, 1/k)`, so the theorem's hypothesis fails for every `R > 1/k`.
- Kronecker's theorem: in `ℝ^{n+1}` the constant is `n + 1`, so `R := (n + 1)/ε` puts every point
  within Euclidean, hence coordinatewise, distance `ε` of the lattice `L_M` in the proof of Evertse's
  Theorem 2.22. The first part's suggested file imports this statement in existential form,
  `∃ C > 0`, which follows with `C = n + 1`. The suggested file of this part proves that step.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.4/covering-dual-transference`;
`GeometryOfNumbersAndQuadraticArithmetic:GN.4/covering-radius`;
`GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-first`;
`GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-dual`; Mathlib
`LinearMap.BilinForm.dualSubmodule`, `LinearMap.BilinForm.dualSubmodule_span_of_basis`, `IsZLattice`,
`Subgroup.isClosed_of_discrete`, `IsClosed.exists_infDist_eq_dist`, `PiLp.norm_apply_le`.

*Source:* Evertse, Chapter 2, Corollary 2.21, p. 33, proof pp. 33–34: the radius `n·c(n)/(2R)` under
the strict hypothesis; the proof rounds the coordinates of `b` in a basis realising the successive
minima of `L`. Evertse, §2.4, p. 32: the polar lattice, its basis `(Vᵀ)⁻¹`, `d(L*) = d(L)⁻¹`, and
Theorem 2.20. Evertse, §2.5, proof of Theorem 2.22, pp. 35–36: the consumer.

### 0.6a Badly approximable numbers and partial quotients

<a id="badly-approximable-iff-bounded-partial-quotients"></a>
#### Badly approximable numbers are those with bounded partial quotients

`DT.0/badly-approximable-iff-bounded-partial-quotients` · theorem · Lean:
`badlyApproximable_iff_bddAbove_partDens`, with the two directions
`one_div_add_two_lt_mul_abs_sub_round` and `partDen_le_one_div_of_le_mul_abs_sub_round`

Let `ξ` be an irrational real number with simple continued fraction `ξ = [a₀; a₁, a₂, …]`, so that
`(GenContFract.of ξ).partDens.get? n = some a_{n+1}` for every `n ≥ 0`.

- (a) If `a_n ≤ B` for every `n ≥ 1`, then `q·‖qξ‖ > 1/(B + 2)` for every integer `q ≥ 1`.
- (b) If `c > 0` and `q·‖qξ‖ ≥ c` for every integer `q ≥ 1`, then `a_n ≤ 1/c` for every `n ≥ 1`.

Consequently `ξ` is badly approximable (`DT.0/badly-approximable`) if and only if its partial
quotients `a₁, a₂, …` are bounded.

*Hypotheses.*

- `ξ` irrational. A rational number has a terminating expansion, so its partial quotients are
  trivially bounded, but `DT.0/badly-approximable` excludes rationals: the equivalence fails without
  irrationality.
- `a₀ = ⌊ξ⌋` is not a partial denominator and is not bounded by `B`; it is an arbitrary integer.
- Pottmeyer defines badly approximable by `liminf q²·|ξ − p/q| > 0` over coprime `(p, q)` with
  `q ≥ 1`. His definition admits rationals; for irrational `ξ` it agrees with
  `DT.0/badly-approximable`, since `q·‖qξ‖ = q²·|ξ − p/q|` for `p` the integer nearest to `qξ`.
- For `0 < ξ < 1` the `a_n` (`n ≥ 1`) are the digits of the Gauss map, the form used by
  ProbabilisticAndMetricNumberTheory, Layer PM.4.

*Proof sketch.*

1. As `ξ` is irrational the expansion does not terminate (`GenContFract.terminates_iff_rat`), so
   every `a_{n+1}` exists and is an integer at least `1` (`GenContFract.of_one_le_get?_partDen`,
   `GenContFract.exists_int_eq_of_partDen`). The `p_n`, `q_n` are integers, `q_n ≥ 1`, and
   `p_n/q_n = ξ.convergent n` (`Real.convs_eq_convergent`).
2. (b) `GenContFract.abs_sub_convergents_le'` gives `|ξ − p_n/q_n| ≤ 1/(a_{n+1}·q_n²)`. With `q = q_n`:
   `c ≤ q_n·‖q_nξ‖ ≤ q_n·|q_nξ − p_n| ≤ 1/a_{n+1}`.
3. (a) Let `q ≥ 1` and `p := round(qξ)`. If `q·‖qξ‖ ≥ 1/2` we are done, since `B ≥ 1` gives
   `1/2 > 1/(B + 2)`. Otherwise `r := p/q` satisfies
   `|ξ − r| = ‖qξ‖/q < 1/(2q²) ≤ 1/(2·den(r)²)`, so Legendre's theorem
   (`Real.exists_rat_eq_convergent`) gives `r = ξ.convergent k` for some `k`, with `den(r) = q_k ≤ q`.
4. `DT.0/convergent-error-lower-bound` gives `|ξ − r| > 1/(q_k(q_k + q_{k+1}))`. The recurrence
   `q_{k+1} = a_{k+1}·q_k + q_{k−1}` (`GenContFract.dens_recurrence`, with `q_{−1} = 0`) and
   `q_{k−1} ≤ q_k` (`GenContFract.of_den_mono`) give `q_{k+1} ≤ (B + 1)·q_k`. Hence
   `‖qξ‖ = q·|ξ − r| > q/((B + 2)·q_k²) ≥ 1/((B + 2)·q)`.
5. (a) with `c = 1/(B + 2)` makes `ξ` badly approximable; (b) bounds the partial quotients of a badly
   approximable `ξ` by `1/c`.

*Checks.*

- Golden ratio `φ = [1; 1, 1, …]`: (a) gives `q·‖qφ‖ > 1/3` for every `q ≥ 1`; the true liminf is
  `1/√5 ≈ 0.447` (Hurwitz), consistent with the bound.
- `√2 = [1; 2, 2, …]`: (a) gives `q·‖q√2‖ > 1/4`; at `q = 1, 2, 5, 12` the values are about `0.414`,
  `0.343`, `0.355` and `0.353`. Conversely (b) with `c = 1/4` bounds the partial quotients by `4`.
- `ξ = 1/2`: `GenContFract.of (1/2)` has the single partial denominator `2`, so its partial
  denominators are bounded, yet `2·‖2·(1/2)‖ = 0` and `1/2` is not badly approximable.
- `liouvilleNumber 10` is not badly approximable (a unit test of `DT.0/badly-approximable`), so its
  partial quotients are unbounded.

*Needs:* `DT.0/badly-approximable` (first part); `DT.0/convergent-error-lower-bound` (first part);
Mathlib `GenContFract.of`, `GenContFract.partDens`, `GenContFract.terminates_iff_rat`,
`GenContFract.of_one_le_get?_partDen`, `GenContFract.exists_int_eq_of_partDen`,
`GenContFract.abs_sub_convergents_le'`, `GenContFract.dens_recurrence`, `GenContFract.of_den_mono`,
`Real.convergent`, `Real.convs_eq_convergent`, `Real.exists_rat_eq_convergent`, `round`, `Irrational`.

*Source:* Pottmeyer, Proposition 1.3.21, p. 21: the equivalence for irrational `α = ⟨a₀, a₁, …⟩`. Its
proof is left as Exercise 1.13 (p. 21), and the sketch above supplies it. Pottmeyer, Definition
1.3.19 and Remark 1.3.20, p. 20: the liminf definition. Pottmeyer, proof of Proposition 1.3.6,
(1.8)–(1.9), p. 14, and Exercise 1.12(b), p. 21: the exact error of a convergent and Legendre's
criterion. Evertse, Exercise 1.7(iv)–(v), p. 8, and Chapter 2, p. 23: the two-sided error bounds and
the definition used by `DT.0/badly-approximable`.

## Dependencies

**Inside this roadmap.** From the first part of Layer DT.0: `badly-approximable`,
`convergent-error-lower-bound`, `height-comparisons`, `mahler-measure-of-algebraic-number`,
`abs-mul-height-eq-of-minpoly-eq` and `northcott-absolute-height`. No other layer is used.

**Other roadmaps.** GeometryOfNumbersAndQuadraticArithmetic, a lower tier: Layer 0
(`covolume-dual`), Layer 1 (`successive-minimum-first`) and Layer 4 (`covering-radius`,
`covering-dual-transference`), for §0.4a only.

**Consumers.**

- The first part's `DT.0/kronecker-approximation-theorem` uses §0.4a with constant `n + 1`.
- ClassicalArithmeticCompletion, Layer CA.6 (`dobrowolski-auxiliary-polynomial`) uses §0.3a.
- ProbabilisticAndMetricNumberTheory, Layer PM.4 (`bounded-digits-compact-orbit`) uses §0.6a.
- HeightsRationalPointsAndObstructions, Layer RP.0, and the routed items of Binyamini's paper use
  §0.2a.

**Re-pointing at assembly.** This part may not edit the first part's packet, so these edits are
recorded for the assembly:

- `DT.0/kronecker-approximation-theorem` cites the stage `GeometryOfNumbersAndQuadraticArithmetic:GN.4`
  and requests the covering bound; it should cite `DT.0/polar-lattice-covering-bound`, with
  `C_{n+1} = n + 1`.
- The first part's request to GN.1 was a promotion bridge only. The GeometryOfNumbersAndQuadraticArithmetic
  packet is promoted, and `GN.1/minkowski-linear-forms` states the linear forms theorem with
  non-strict inequalities at `∏a_i ≥ |det A|`, as `DT.0/dirichlet-approximation-from-minkowski` uses
  it. The stage anchors to GN.1 can be dropped.
- CA.6 and PM.4 cite the stage DT.0 with a request each; they should cite the two nodes above.

## Acceptance tests

Every definition above lists its unit tests and every theorem its checks. The decisive ones are
these:

- `h_max(√2) = (log 2)/2` catches an unnormalised height, and `h_max(2, 1/2) = log 2 ≠ log 4`
  separates `h_max` from the projective height.
- The row `(1, i, 1 + i)` over `ℚ(i)` gives the product bound `144`; a zero row makes the bound `0`,
  so the nonzero-row hypothesis is needed.
- `L = ℤ × kℤ` shows that the covering bound needs its hypothesis on `L*`, not on `L`.
- `1/2` shows that the bounded-partial-quotient criterion needs irrationality, and the golden ratio
  and `√2` meet the explicit constants `1/3` and `1/4`.

## Notes on the sources

- In the proof of Berrevoets's Lemma 3.2 (p. 14), the strict inequality in the count of boxes is
  justified by calling the `d`-th root of `∏_k |σ_k(a_iℓ)|` the norm of `a_iℓ`. It is the `d`-th root
  of the absolute norm. That root is still at least `1`, because the norm of a nonzero algebraic
  integer is a nonzero rational integer, so the argument stands (sourceIssue E601).
- In the same proof the box principle is set up for an integer `Y ≥ 1` (p. 12). At the end (p. 14)
  `Y` is set equal to the root `((2√2N)^{dM}·∏∏ max_j|σ_k(a_ij)|)^{1/(N−dM)}`, which in general is
  not an integer (for `K = ℚ` and the row `(1, 1)` it is `4√2`). Taking the integer part repairs the
  proof and leaves the lemma unchanged (sourceIssue E602).
- In the proof of Evertse's Theorem 2.22 (p. 35) the target vector is printed as
  `(θ₁, …, θₙ, 2Mε)`; the next display needs `(−θ₁, …, −θₙ, 2ε)`. The first part records this as
  its sourceIssue E4, confirmed by its review, and it does not affect §0.4a.
- Pottmeyer leaves the proof of Proposition 1.3.21 to the reader (Exercise 1.13). The proof above
  uses Legendre's criterion instead of Pottmeyer's law of best approximation (Theorem 1.3.12),
  because Mathlib proves the former.
