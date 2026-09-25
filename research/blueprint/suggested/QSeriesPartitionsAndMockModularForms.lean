import Mathlib.Algebra.DirectSum.Basic
import Mathlib.Algebra.Lie.Classical
import Mathlib.Algebra.Lie.Free
import Mathlib.Algebra.Lie.Quotient
import Mathlib.Algebra.Lie.SerreConstruction
import Mathlib.Algebra.Lie.Sl2
import Mathlib.Algebra.Lie.UniversalEnveloping
import Mathlib.Algebra.MonoidAlgebra.Defs
import Mathlib.Algebra.Order.Round
import Mathlib.Algebra.Polynomial.Derivation
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.Algebra.Vertex.VertexOperator
import Mathlib.Analysis.Analytic.Basic
import Mathlib.Analysis.Asymptotics.AsymptoticEquivalent
import Mathlib.Analysis.Asymptotics.Defs
import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
import Mathlib.Analysis.Complex.UpperHalfPlane.Measure
import Mathlib.Analysis.Complex.UpperHalfPlane.Topology
import Mathlib.Analysis.Fourier.AddCircle
import Mathlib.Analysis.Fourier.Inversion
import Mathlib.Analysis.InnerProductSpace.Laplacian
import Mathlib.Analysis.MellinInversion
import Mathlib.Analysis.Meromorphic.Basic
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.SpecialFunctions.Gamma.Beta
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Analysis.SpecialFunctions.OrdinaryHypergeometric
import Mathlib.Analysis.SpecialFunctions.Pow.Complex
import Mathlib.Analysis.SpecialFunctions.RegularizedHypergeometric
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Deriv
import Mathlib.Basic.Real.Sign
import Mathlib.Combinatorics.Enumerative.Partition.GenFun
import Mathlib.Combinatorics.Enumerative.Partition.Glaisher
import Mathlib.Combinatorics.Enumerative.Pentagonal.EulerFunction
import Mathlib.Combinatorics.Enumerative.Pentagonal.PowerSeries
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.GroupTheory.Coxeter.Basic
import Mathlib.GroupTheory.Index
import Mathlib.LinearAlgebra.BilinearForm.TensorProduct
import Mathlib.LinearAlgebra.Determinant
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.Matrix.BilinearForm
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.LinearAlgebra.SymmetricAlgebra.Basic
import Mathlib.LinearAlgebra.TensorAlgebra.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.Trace
import Mathlib.MeasureTheory.Integral.CircleIntegral
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.NumberTheory.BernoulliPolynomials
import Mathlib.NumberTheory.LSeries.HurwitzZetaValues
import Mathlib.NumberTheory.LSeries.ZMod
import Mathlib.NumberTheory.LegendreSymbol.JacobiSymbol
import Mathlib.NumberTheory.Modular
import Mathlib.NumberTheory.ModularForms.Basic
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.NumberTheory.ModularForms.Cusps
import Mathlib.NumberTheory.ModularForms.DedekindEta
import Mathlib.NumberTheory.ModularForms.Discriminant
import Mathlib.NumberTheory.ModularForms.EisensteinSeries.Basic
import Mathlib.NumberTheory.ModularForms.EisensteinSeries.E2.Transform
import Mathlib.NumberTheory.ModularForms.JacobiTheta.OneVariable
import Mathlib.NumberTheory.ModularForms.JacobiTheta.TwoVariable
import Mathlib.NumberTheory.ModularForms.LevelOne.Basic
import Mathlib.NumberTheory.ModularForms.LevelOne.DimensionFormula
import Mathlib.NumberTheory.ModularForms.Petersson
import Mathlib.NumberTheory.ModularForms.QExpansion
import Mathlib.NumberTheory.ZetaValues
import Mathlib.RingTheory.Binomial
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.Polynomial.Cyclotomic.Roots
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.PowerSeries.Evaluation
import Mathlib.RingTheory.PowerSeries.Exp
import Mathlib.RingTheory.PowerSeries.Expand
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.PowerSeries.Log
import Mathlib.RingTheory.PowerSeries.PiTopology
import Mathlib.RingTheory.PowerSeries.Substitution

/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/QSeriesPartitionsAndMockModularForms.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-QSeriesPartitionsAndMockModularForms: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The file imports Mathlib only and elaborates at the Mathlib pin: the only messages are
`declaration uses 'sorry'` warnings. Where a node uses a Tau Ceti declaration, the
section says so in a comment and states locally only what the prototype needs.

One section per layer, QM.0 to QM.6, in the order of the roadmap; later sections use the
declarations of earlier ones. What the pinned libraries already contain -- partitions and
their generating functions, the x-adic topology on power series and Euler's pentagonal
number theorem, the Jacobi theta functions with their S and T transformations, the Dedekind
eta function, modular forms, slash actions and Eisenstein series, vertex operators -- is
imported, not restated.
-/

-- ===== QM.0 =====

section QM0File

/-
QM.0 Formal q-series and partitions: the suggested-Lean section of
BP-QSeriesPartitionsAndMockModularForms. This file is not the roadmap and is not exhaustive; the
roadmap document is definitive, and these statements suggest Lean forms so that contributors and
reviewers converge on names and signatures. They claim no implementation.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Tau Ceti is not imported (it is not built
here). The Tau Ceti declarations the roadmap uses are `TauCeti.conjugate` with its Young-diagram
lemmas (`TauCeti/Combinatorics/Enumerative/Partition/Conjugate.lean`), in the proof of the
"at most k parts" generating function; the related support predicate
`PowerSeries.IsSupportedOnDvd` (`TauCeti/RingTheory/PowerSeries/Support.lean`) is the condition
"coefficients vanish off the multiples of p" of the congruence section. No statement below needs
them, so nothing is restated locally.

Conventions: `R` is a commutative ring; `R⟦X⟧` carries Mathlib's scoped coefficientwise
(`PowerSeries.WithPiTopology`) topology over an arbitrary topology on `R` (all the formal
identities hold for every topology on `R`, in particular the discrete one, because their
coefficients are eventually constant); `X` is the power-series variable `q`. Gaussian polynomials
are polynomials (`Polynomial.X` is their variable) and are cast into `R⟦X⟧` when needed.
-/

namespace TauCeti.QSeries

noncomputable section QM0

open PowerSeries Finset Filter
open scoped Polynomial PowerSeries.WithPiTopology Topology

/-! ### The partition function (Stanley, EC1, §1.7) -/

/-- The partition function `p(n)`: the number of partitions of `n`. -/
def partitionCount (n : ℕ) : ℕ := Fintype.card n.Partition

theorem partitionCount_eq_card (n : ℕ) : partitionCount n = Fintype.card n.Partition := rfl

@[simp] theorem partitionCount_zero : partitionCount 0 = 1 := sorry

@[simp] theorem partitionCount_one : partitionCount 1 = 1 := sorry

theorem partitionCount_eq_card_restricted (n : ℕ) :
    partitionCount n = #(Nat.Partition.restricted n fun _ ↦ True) := sorry

theorem partitionCount_pos (n : ℕ) : 0 < partitionCount n := sorry

theorem partitionCount_le_succ (n : ℕ) : partitionCount n ≤ partitionCount (n + 1) := sorry

/-- Unit test `partitionCount_five`: `p(5) = 7`, the seven partitions 5, 41, 32, 311, 221, 2111,
11111 (Stanley, EC1, p. 65). -/
example : partitionCount 5 = 7 := sorry

/-- Unit test `partitionCount_twenty`: `p(20) = 627` (Stanley, EC1, p. 77). -/
example : partitionCount 20 = 627 := sorry

/-- Unit test `partitionCount_zero_eq_one`: the empty partition is the only partition of `0`. -/
example : partitionCount 0 = 1 := sorry

/-- Unit test `partitionCount_four_ne_compositions`: `p(4) = 5`, not the number `2 ^ 3 = 8` of
compositions of `4`: the order of the parts is forgotten. -/
example : partitionCount 4 = 5 ∧ partitionCount 4 ≠ 2 ^ (4 - 1) := sorry

/-! ### q-Pochhammer symbols (Gasper (1.2.3), (1.2.7)) -/

variable {R : Type*} [CommRing R]

/-- The finite q-Pochhammer symbol `(a; b)_n = ∏_{i < n} (1 - a bⁱ)` in `R⟦X⟧`. -/
def qPochhammer (a b : R⟦X⟧) (n : ℕ) : R⟦X⟧ := ∏ i ∈ range n, (1 - a * b ^ i)

/-- The infinite q-Pochhammer symbol `(a; b)_∞`, defined coefficientwise: its `m`-th coefficient
is that of `(a; b)_{m+1}`. It is the product `∏_{i ≥ 0} (1 - a bⁱ)` when `constantCoeff b = 0`
(`hasProd_qPochhammerInf`). -/
def qPochhammerInf (a b : R⟦X⟧) : R⟦X⟧ :=
  PowerSeries.mk fun m ↦ coeff m (qPochhammer a b (m + 1))

@[simp] theorem qPochhammer_zero (a b : R⟦X⟧) : qPochhammer a b 0 = 1 := sorry

@[simp] theorem qPochhammer_succ (a b : R⟦X⟧) (n : ℕ) :
    qPochhammer a b (n + 1) = qPochhammer a b n * (1 - a * b ^ n) := sorry

theorem qPochhammer_succ' (a b : R⟦X⟧) (n : ℕ) :
    qPochhammer a b (n + 1) = (1 - a) * qPochhammer (a * b) b n := sorry

theorem qPochhammer_add (a b : R⟦X⟧) (m n : ℕ) :
    qPochhammer a b (m + n) = qPochhammer a b m * qPochhammer (a * b ^ m) b n := sorry

theorem coeff_qPochhammerInf {a b : R⟦X⟧} (hb : constantCoeff b = 0) {m n : ℕ} (h : m < n) :
    coeff m (qPochhammerInf a b) = coeff m (qPochhammer a b n) := sorry

theorem hasProd_qPochhammerInf [TopologicalSpace R] (a : R⟦X⟧) {b : R⟦X⟧}
    (hb : constantCoeff b = 0) : HasProd (fun i ↦ 1 - a * b ^ i) (qPochhammerInf a b) := sorry

theorem tendsto_qPochhammer [TopologicalSpace R] (a : R⟦X⟧) {b : R⟦X⟧}
    (hb : constantCoeff b = 0) :
    Tendsto (qPochhammer a b) atTop (𝓝 (qPochhammerInf a b)) := sorry

theorem qPochhammerInf_eq_mul (a : R⟦X⟧) {b : R⟦X⟧} (hb : constantCoeff b = 0) (n : ℕ) :
    qPochhammerInf a b = qPochhammer a b n * qPochhammerInf (a * b ^ n) b := sorry

@[simp] theorem constantCoeff_qPochhammerInf (a : R⟦X⟧) {b : R⟦X⟧} (hb : constantCoeff b = 0) :
    constantCoeff (qPochhammerInf a b) = 1 - constantCoeff a := sorry

theorem isUnit_qPochhammerInf {a b : R⟦X⟧} (hb : constantCoeff b = 0)
    (ha : IsUnit (1 - constantCoeff a)) : IsUnit (qPochhammerInf a b) := sorry

/-- `(q; q)_∞` is Mathlib's Euler product: `qPochhammerInf X X = pentagonalSeries R`. -/
theorem qPochhammerInf_X_X : qPochhammerInf (X : R⟦X⟧) X = pentagonalSeries R := sorry

theorem map_qPochhammerInf {S : Type*} [CommRing S] (φ : R →+* S) (a b : R⟦X⟧) :
    map φ (qPochhammerInf a b) = qPochhammerInf (map φ a) (map φ b) := sorry

theorem expand_qPochhammerInf (k : ℕ) (hk : k ≠ 0) (a : R⟦X⟧) {b : R⟦X⟧}
    (hb : constantCoeff b = 0) :
    expand k hk (qPochhammerInf a b) = qPochhammerInf (expand k hk a) (expand k hk b) := sorry

/-- Multisection of the Euler product: `(q; q)_∞ = ∏_{r = 1}^{m} (q^r; q^m)_∞`. -/
theorem qPochhammerInf_X_X_eq_prod (m : ℕ) (hm : 0 < m) :
    qPochhammerInf (X : R⟦X⟧) X = ∏ r ∈ range m, qPochhammerInf (X ^ (r + 1)) (X ^ m) := sorry

/-- Evaluation inside the unit disc gives the analytic product `∏ (1 - a zⁱ)`. -/
theorem hasSum_eval_qPochhammerInf (a : ℂ) {z : ℂ} (hz : ‖z‖ < 1) :
    HasSum (fun n ↦ coeff n (qPochhammerInf (C a) (X : ℂ⟦X⟧)) * z ^ n)
      (∏' i : ℕ, (1 - a * z ^ i)) := sorry

/-- Unit test `qPochhammer_two`: `(a; q)_2 = (1 - a)(1 - a q)`. -/
example (a : R) : qPochhammer (C a) (X : R⟦X⟧) 2 = (1 - C a) * (1 - C a * X) := sorry

/-- Unit test `qPochhammerInf_zero_left`: `(0; b)_∞ = 1`. -/
example (b : R⟦X⟧) : qPochhammerInf 0 b = 1 := sorry

/-- Unit test `qPochhammerInf_one_X`: `(1; q)_∞ = 0`, since its factor `i = 0` is `1 - 1`. -/
example : qPochhammerInf (1 : R⟦X⟧) X = 0 := sorry

/-- Unit test `coeff_qPochhammerInf_X_X`: `(q; q)_∞ = 1 - q - q² + q⁵ + q⁷ - ⋯`, so its
coefficients at `2`, `3`, `5` are `-1`, `0`, `1`. -/
example : coeff 2 (qPochhammerInf (X : ℤ⟦X⟧) X) = -1 ∧ coeff 3 (qPochhammerInf (X : ℤ⟦X⟧) X) = 0 ∧
    coeff 5 (qPochhammerInf (X : ℤ⟦X⟧) X) = 1 := sorry

/-- Unit test `qPochhammerInf_base_matters`: `(q; q²)_∞ ≠ (q; q)_∞` (their coefficients at `2`
are `0` and `-1`): the base is part of the data. -/
example : qPochhammerInf (X : ℤ⟦X⟧) (X ^ 2) ≠ qPochhammerInf X X := sorry

/-- Unit test `not_summable_eval_one_qPochhammerInf`: the formal `(q; q)_∞` has no value at the
boundary point `q = 1`: its coefficients do not tend to `0`, so `∑ cₙ 1ⁿ` does not converge,
although every finite product `(q; q)_n` vanishes at `q = 1`. -/
example : ¬ Summable (fun n ↦ coeff n (qPochhammerInf (X : ℂ⟦X⟧) X) * (1 : ℂ) ^ n) := sorry

/-! ### q-integers, q-factorials and Gaussian polynomials (Stanley, EC1, §§1.3, 1.7) -/

variable (S : Type*) [CommSemiring S]

/-- The q-integer `(n) = 1 + q + ⋯ + q^{n-1}`. -/
def qInt (n : ℕ) : S[X] := ∑ i ∈ range n, Polynomial.X ^ i

@[simp] theorem qInt_zero : qInt S 0 = 0 := sorry

theorem qInt_succ (n : ℕ) : qInt S (n + 1) = qInt S n + Polynomial.X ^ n := sorry

theorem qInt_succ' (n : ℕ) : qInt S (n + 1) = 1 + Polynomial.X * qInt S n := sorry

theorem one_sub_X_mul_qInt (n : ℕ) :
    (1 - Polynomial.X) * qInt R n = 1 - Polynomial.X ^ n := sorry

@[simp] theorem eval_one_qInt (n : ℕ) : (qInt S n).eval 1 = n := sorry

theorem map_qInt {T : Type*} [CommSemiring T] (f : S →+* T) (n : ℕ) :
    (qInt S n).map f = qInt T n := sorry

/-- Unit test `qInt_three`: `(3) = 1 + q + q²`. -/
example : qInt ℤ 3 = 1 + Polynomial.X + Polynomial.X ^ 2 := sorry

/-- Unit test `qInt_zero_one`: `(0) = 0` and `(1) = 1`. -/
example : qInt ℤ 0 = 0 ∧ qInt ℤ 1 = 1 := sorry

/-- Unit test `eval_one_qInt_five`: at `q = 1` the q-integer `(5)` is `5`. -/
example : (qInt ℤ 5).eval 1 = 5 := sorry

/-- Unit test `qInt_two_ne_const`: `(2) = 1 + q` is not the constant `2`. -/
example : qInt ℤ 2 ≠ Polynomial.C 2 := sorry

/-- The q-factorial `(n)! = (1)(2)⋯(n)`. -/
def qFactorial (n : ℕ) : S[X] := ∏ i ∈ range n, qInt S (i + 1)

@[simp] theorem qFactorial_zero : qFactorial S 0 = 1 := sorry

theorem qFactorial_succ (n : ℕ) : qFactorial S (n + 1) = qFactorial S n * qInt S (n + 1) := sorry

@[simp] theorem eval_one_qFactorial (n : ℕ) : (qFactorial S n).eval 1 = n.factorial := sorry

theorem one_sub_X_pow_mul_qFactorial (n : ℕ) :
    (((1 - Polynomial.X) ^ n * qFactorial R n : R[X]) : R⟦X⟧) = qPochhammer X X n := sorry

theorem map_qFactorial {T : Type*} [CommSemiring T] (f : S →+* T) (n : ℕ) :
    (qFactorial S n).map f = qFactorial T n := sorry

/-- Unit test `qFactorial_three`: `(3)! = (1 + q)(1 + q + q²)`. -/
example : qFactorial ℤ 3 = (1 + Polynomial.X) * (1 + Polynomial.X + Polynomial.X ^ 2) := sorry

/-- Unit test `qFactorial_zero_eq_one`: the empty product `(0)! = 1`. -/
example : qFactorial ℤ 0 = 1 := sorry

/-- Unit test `eval_one_qFactorial_four`: at `q = 1`, `(4)! = 24`. -/
example : (qFactorial ℤ 4).eval 1 = 24 := sorry

/-- Unit test `qFactorial_two_ne_const`: `(2)! = 1 + q ≠ 2`. -/
example : qFactorial ℤ 2 ≠ Polynomial.C 2 := sorry

/-- The Gaussian polynomial (q-binomial coefficient) `[n, k]`, by the q-Pascal recursion
`[n+1, k+1] = [n, k] + q^{k+1} [n, k+1]`; it is `0` for `k > n`. -/
def qBinomial : ℕ → ℕ → S[X]
  | _, 0 => 1
  | 0, _ + 1 => 0
  | n + 1, k + 1 => qBinomial n k + Polynomial.X ^ (k + 1) * qBinomial n (k + 1)

@[simp] theorem qBinomial_zero_right (n : ℕ) : qBinomial S n 0 = 1 := sorry

@[simp] theorem qBinomial_zero_succ (k : ℕ) : qBinomial S 0 (k + 1) = 0 := sorry

theorem qBinomial_succ_succ (n k : ℕ) :
    qBinomial S (n + 1) (k + 1) = qBinomial S n k + Polynomial.X ^ (k + 1) * qBinomial S n (k + 1) :=
  sorry

theorem qBinomial_succ_succ' {n k : ℕ} (h : k ≤ n) :
    qBinomial S (n + 1) (k + 1) = Polynomial.X ^ (n - k) * qBinomial S n k + qBinomial S n (k + 1) :=
  sorry

theorem qBinomial_eq_zero_of_lt {n k : ℕ} (h : n < k) : qBinomial S n k = 0 := sorry

@[simp] theorem qBinomial_self (n : ℕ) : qBinomial S n n = 1 := sorry

theorem qBinomial_symm {n k : ℕ} (h : k ≤ n) : qBinomial S n (n - k) = qBinomial S n k := sorry

theorem qFactorial_eq_qBinomial_mul {n k : ℕ} (h : k ≤ n) :
    qFactorial S n = qBinomial S n k * qFactorial S k * qFactorial S (n - k) := sorry

theorem qPochhammer_X_X_eq_qBinomial_mul {n k : ℕ} (h : k ≤ n) :
    qPochhammer (X : R⟦X⟧) X n =
      (qBinomial R n k : R⟦X⟧) * qPochhammer X X k * qPochhammer X X (n - k) := sorry

@[simp] theorem eval_one_qBinomial (n k : ℕ) : (qBinomial S n k).eval 1 = n.choose k := sorry

theorem map_qBinomial {T : Type*} [CommSemiring T] (f : S →+* T) (n k : ℕ) :
    (qBinomial S n k).map f = qBinomial T n k := sorry

theorem natDegree_qBinomial [Nontrivial S] {n k : ℕ} (h : k ≤ n) :
    (qBinomial S n k).natDegree = k * (n - k) := sorry

theorem monic_qBinomial [Nontrivial S] {n k : ℕ} (h : k ≤ n) : (qBinomial S n k).Monic := sorry

theorem reverse_qBinomial {n k : ℕ} (h : k ≤ n) : (qBinomial S n k).reverse = qBinomial S n k :=
  sorry

/-- Unit test `qBinomial_four_two`: `[4, 2] = 1 + q + 2q² + q³ + q⁴`. -/
example : qBinomial ℤ 4 2 =
    1 + Polynomial.X + 2 * Polynomial.X ^ 2 + Polynomial.X ^ 3 + Polynomial.X ^ 4 := sorry

/-- Unit test `qBinomial_five_two`: `[5, 2] = 1 + q + 2q² + 2q³ + 2q⁴ + q⁵ + q⁶`, the ten
partitions in a `2 × 3` rectangle (Stanley, EC1, p. 67). -/
example : qBinomial ℤ 5 2 = 1 + Polynomial.X + 2 * Polynomial.X ^ 2 + 2 * Polynomial.X ^ 3 +
    2 * Polynomial.X ^ 4 + Polynomial.X ^ 5 + Polynomial.X ^ 6 := sorry

/-- Unit test `qBinomial_degenerate`: `[3, 0] = 1`, `[0, 1] = 0` and `[2, 3] = 0`. -/
example : qBinomial ℤ 3 0 = 1 ∧ qBinomial ℤ 0 1 = 0 ∧ qBinomial ℤ 2 3 = 0 := sorry

/-- Unit test `eval_one_qBinomial_five_two`: at `q = 1`, `[5, 2]` is `C(5, 2) = 10`. -/
example : (qBinomial ℤ 5 2).eval 1 = 10 := sorry

/-- Unit test `eval_two_qBinomial_four_two`: at `q = 2`, `[4, 2] = 35`, the number of
two-dimensional subspaces of `𝔽₂⁴`. -/
example : (qBinomial ℤ 4 2).eval 2 = 35 := sorry

/-- Unit test `qBinomial_two_one_ne_choose`: `[2, 1] = 1 + q` is not the constant `C(2, 1) = 2`. -/
example : qBinomial ℤ 2 1 ≠ Polynomial.C 2 := sorry

/-! ### Specialisation maps preserve x-adic products and sums -/

/-- A continuous coefficient map is continuous on power series; hence it maps convergent
products and sums to convergent products and sums (`HasProd.map`). -/
theorem continuous_powerSeries_map {T : Type*} [CommRing T] [TopologicalSpace R]
    [TopologicalSpace T] (φ : R →+* T) (hφ : Continuous φ) :
    Continuous (PowerSeries.map φ : R⟦X⟧ → T⟦X⟧) := sorry

theorem hasProd_powerSeries_map {T : Type*} [CommRing T] [TopologicalSpace R]
    [TopologicalSpace T] (φ : R →+* T) (hφ : Continuous φ) {ι : Type*} {f : ι → R⟦X⟧}
    {P : R⟦X⟧} (hf : HasProd f P) : HasProd (fun i ↦ PowerSeries.map φ (f i)) (map φ P) := sorry

/-- Substitution of a series with nilpotent constant coefficient (for instance `X ^ k`, or `c • X`
for `rescale`) maps convergent products to convergent products (discrete coefficients). -/
theorem hasProd_subst [UniformSpace R] [DiscreteUniformity R] {a : R⟦X⟧} (ha : HasSubst a)
    {ι : Type*} {f : ι → R⟦X⟧} {P : R⟦X⟧} (hf : HasProd f P) :
    HasProd (fun i ↦ (f i).subst a) (P.subst a) := sorry

/-- Evaluation at a topologically nilpotent element of a complete linearly topologised ring maps
convergent products of power series to convergent products. -/
theorem hasProd_eval₂ {T : Type*} [CommRing T] [UniformSpace R] [UniformSpace T]
    [IsUniformAddGroup R] [IsTopologicalRing R] [IsUniformAddGroup T] [T2Space T] [CompleteSpace T]
    [IsTopologicalRing T] [IsLinearTopology T T] {φ : R →+* T} (hφ : Continuous φ) {t : T}
    (ht : HasEval t) {ι : Type*} {f : ι → R⟦X⟧} {P : R⟦X⟧} (hf : HasProd f P) :
    HasProd (fun i ↦ eval₂ φ t (f i)) (eval₂ φ t P) := sorry

/-! ### q-binomial theorems -/

/-- **The q-binomial theorem** (Rothe; Stanley (1.87)), in any commutative ring. -/
theorem prod_one_add_mul_pow_eq_sum {T : Type*} [CommRing T] (x q : T) (n : ℕ) :
    ∏ i ∈ range n, (1 + x * q ^ i) =
      ∑ k ∈ range (n + 1), q ^ (k * (k - 1) / 2) * (qBinomial T n k).eval q * x ^ k := sorry

/-- **The q-Vandermonde identity** (Stanley, EC1, solution to Exercise 1.100). -/
theorem qBinomial_add (a b n : ℕ) :
    qBinomial S (a + b) n = ∑ k ∈ range (n + 1),
      Polynomial.X ^ (k * (k + b - n)) * qBinomial S a k * qBinomial S b (n - k) := sorry

/-- Gaussian polynomials at a base `q` with zero constant coefficient: `[n, k](q) (q; q)_k → 1`
as `n → ∞` with `k` fixed. -/
theorem tendsto_aeval_qBinomial_mul_qPochhammer [TopologicalSpace R] {q : R⟦X⟧}
    (hq : constantCoeff q = 0) (k : ℕ) :
    Tendsto (fun n ↦ Polynomial.aeval q (qBinomial R n k) * qPochhammer q q k) atTop (𝓝 1) :=
  sorry

/-- Gaussian polynomials at a base `q` with zero constant coefficient:
`[n, k](q) (q; q)_∞ → 1` as `k → ∞` and `n - k → ∞`. -/
theorem tendsto_aeval_qBinomial_mul_qPochhammerInf [TopologicalSpace R] {q : R⟦X⟧}
    (hq : constantCoeff q = 0) {n k : ℕ → ℕ} (hk : Tendsto k atTop atTop)
    (hnk : Tendsto (fun i ↦ n i - k i) atTop atTop) :
    Tendsto (fun i ↦ Polynomial.aeval q (qBinomial R (n i) (k i)) * qPochhammerInf q q) atTop
      (𝓝 1) := sorry

/-- **Euler's first identity** `(-x; q)_∞ = ∑ q^{k(k-1)/2} x^k / (q; q)_k`, for every `x`. -/
theorem hasSum_qPochhammerInf_neg [TopologicalSpace R] (x : R⟦X⟧) :
    HasSum (fun k ↦ X ^ (k * (k - 1) / 2) * x ^ k * invOfUnit (qPochhammer X X k) 1)
      (qPochhammerInf (-x) X) := sorry

/-- **Cauchy's q-binomial theorem** `∑ (a; q)_n zⁿ / (q; q)_n = (az; q)_∞ / (z; q)_∞`, for `z`
with zero constant coefficient. -/
theorem hasSum_cauchy [TopologicalSpace R] (a : R⟦X⟧) {z : R⟦X⟧} (hz : constantCoeff z = 0) :
    HasSum (fun n ↦ qPochhammer a X n * invOfUnit (qPochhammer X X n) 1 * z ^ n)
      (qPochhammerInf (a * z) X * invOfUnit (qPochhammerInf z X) 1) := sorry

/-- **Euler's second identity** `1 / (xq; q)_∞ = ∑ x^k q^k / (q; q)_k`, for every `x`. -/
theorem hasSum_invOfUnit_qPochhammerInf [TopologicalSpace R] (x : R⟦X⟧) :
    HasSum (fun k ↦ x ^ k * X ^ k * invOfUnit (qPochhammer X X k) 1)
      (invOfUnit (qPochhammerInf (x * X) X) 1) := sorry

/-! ### Partitions and their generating products -/

/-- **Euler's generating function** `∑ p(n) qⁿ · (q; q)_∞ = 1` (Stanley (1.77)). -/
theorem partitionSeries_mul_qPochhammerInf :
    (PowerSeries.mk fun n ↦ (partitionCount n : R)) * qPochhammerInf X X = 1 := sorry

/-- **Euler's recurrence** `∑_k (-1)^k p(n - k(3k-1)/2) = 0` for `n ≥ 1` (Stanley (1.91)). -/
theorem partitionCount_recurrence {n : ℕ} (hn : 0 < n) :
    ∑ k ∈ Finset.Icc (-(n : ℤ)) n, (k.negOnePow : ℤ) *
      (if pentagonal k ≤ n then (partitionCount (n - pentagonal k) : ℤ) else 0) = 0 := sorry

/-- Partitions into at most `k` parts: `∑ p_{≤k}(n) qⁿ · (q; q)_k = 1` (Stanley (1.76)). -/
theorem partitionsAtMost_mul_qPochhammer (k : ℕ) :
    (PowerSeries.mk fun n ↦
        (#(Finset.univ.filter fun μ : n.Partition ↦ μ.parts.card ≤ k) : R)) *
      qPochhammer X X k = 1 := sorry

/-- **Partitions in a box** (Stanley, Proposition 1.7.3): the coefficient of `q^m` in `[j+k, j]`
counts the partitions of `m` with at most `k` parts, each at most `j`. -/
theorem coeff_qBinomial_eq_card (j k m : ℕ) :
    (qBinomial ℕ (j + k) j).coeff m =
      #(Finset.univ.filter fun μ : m.Partition ↦ μ.parts.card ≤ k ∧ ∀ i ∈ μ.parts, i ≤ j) :=
  sorry

/-- **Euler's odd–distinct product identity** `(-q; q)_∞ (q; q²)_∞ = 1` (Stanley (1.81)). -/
theorem qPochhammerInf_neg_X_mul_qPochhammerInf_X_sq :
    qPochhammerInf (-X : R⟦X⟧) X * qPochhammerInf X (X ^ 2) = 1 := sorry

/-! ### The Jacobi triple product identity -/

/-- **The finite Jacobi triple product identity** (MacMahon), in any commutative ring. -/
theorem finite_jacobi_triple_product {T : Type*} [CommRing T] (b u : T) (N : ℕ) :
    ∏ i ∈ range N, (1 + b ^ i * u ^ (i + 1)) * (1 + b ^ (i + 1) * u ^ i) =
      ∑ k ∈ Finset.Icc (-(N : ℤ)) N, b ^ (k * (k - 1) / 2).toNat * u ^ (k * (k + 1) / 2).toNat *
        (qBinomial T (2 * N) (N + k).toNat).eval (b * u) := sorry

/-- **The universal Jacobi triple product identity** (Ramanujan's `f(α, β)`): for `α, β ∈ R⟦X⟧`
with `constantCoeff α = 0`,
`∏_{n ≥ 0} (1 + βⁿ α^{n+1})(1 + β^{n+1} αⁿ)(1 - β^{n+1} α^{n+1}) = ∑_k β^{k(k-1)/2} α^{k(k+1)/2}`. -/
theorem universal_jacobi_triple_product [TopologicalSpace R] [T2Space R] {α : R⟦X⟧}
    (hα : constantCoeff α = 0) (β : R⟦X⟧) :
    HasProd (fun n : ℕ ↦ (1 + β ^ n * α ^ (n + 1)) * (1 + β ^ (n + 1) * α ^ n) *
        (1 - β ^ (n + 1) * α ^ (n + 1)))
      (∑' k : ℤ, β ^ (k * (k - 1) / 2).toNat * α ^ (k * (k + 1) / 2).toNat) := sorry

/-- **The Jacobi triple product identity** in `R⟦x⟧` for a unit `a` of `R`:
`∏_{n ≥ 1} (1 + a x^{2n-1})(1 + a⁻¹ x^{2n-1})(1 - x^{2n}) = ∑_{n ∈ ℤ} aⁿ x^{n²}`. -/
theorem jacobi_triple_product [TopologicalSpace R] [T2Space R] (a : Rˣ) :
    HasProd (fun n : ℕ ↦ (1 + C (a : R) * X ^ (2 * n + 1)) *
        (1 + C ((a⁻¹ : Rˣ) : R) * X ^ (2 * n + 1)) * (1 - X ^ (2 * n + 2)))
      (∑' k : ℤ, C ((a ^ k : Rˣ) : R) * X ^ (k.natAbs ^ 2)) := sorry

/-- The requested form: coefficients Laurent polynomials in `a` (`R = ℤ[a, a⁻¹]`, `a = T 1`). -/
example : letI : TopologicalSpace (LaurentPolynomial ℤ) := ⊥
    HasProd (fun n : ℕ ↦ (1 + C (LaurentPolynomial.T 1 : LaurentPolynomial ℤ) * X ^ (2 * n + 1)) *
        (1 + C (LaurentPolynomial.T (-1)) * X ^ (2 * n + 1)) * (1 - X ^ (2 * n + 2)))
      (∑' k : ℤ, C (LaurentPolynomial.T k : LaurentPolynomial ℤ) * X ^ (k.natAbs ^ 2)) := sorry

/-- **Jacobi's identity** `∏ (1 - qⁿ)³ = ∑_{n ≥ 0} (-1)ⁿ (2n + 1) q^{n(n+1)/2}`. -/
theorem jacobi_cube [TopologicalSpace R] [T2Space R] :
    HasSum (fun n : ℕ ↦ C ((-1 : R) ^ n * (2 * n + 1)) * X ^ (n * (n + 1) / 2))
      (qPochhammerInf (X : R⟦X⟧) X ^ 3) := sorry

/-- Jacobi's identity summed over `ℤ`: `2 ∏ (1 - qⁿ)³ = ∑_{n ∈ ℤ} (-1)ⁿ (2n + 1) q^{n(n+1)/2}`. -/
theorem two_mul_jacobi_cube [TopologicalSpace R] [T2Space R] :
    HasSum (fun n : ℤ ↦ C ((n.negOnePow : R) * (2 * n + 1)) * X ^ (n * (n + 1) / 2).toNat)
      (2 * qPochhammerInf (X : R⟦X⟧) X ^ 3) := sorry

/-- `∏ (1 + x^{2n-1})² (1 - x^{2n}) = ∑_{n ∈ ℤ} x^{n²}`. -/
theorem theta_three_product [TopologicalSpace R] [T2Space R] :
    HasProd (fun n : ℕ ↦ (1 + X ^ (2 * n + 1)) ^ 2 * (1 - X ^ (2 * n + 2)))
      (∑' k : ℤ, (X : R⟦X⟧) ^ (k.natAbs ^ 2)) := sorry

/-- `2 ∏ (1 + x^{2n})² (1 - x^{2n}) = ∑_{r ∈ ℤ} x^{r² + r}`. -/
theorem theta_two_product [TopologicalSpace R] [T2Space R] :
    2 * ∏' n : ℕ, ((1 + X ^ (2 * n + 2)) ^ 2 * (1 - X ^ (2 * n + 2)) : R⟦X⟧) =
      ∑' r : ℤ, (X : R⟦X⟧) ^ (r * (r + 1)).toNat := sorry

/-- **Gauss's identity** `∏ (1 - xⁿ)/(1 + xⁿ) = ∑_{n ∈ ℤ} (-1)ⁿ x^{n²}`, in the form
`(x; x)_∞ = (-x; x)_∞ · ∑ (-1)ⁿ x^{n²}`. -/
theorem gauss_theta_four [TopologicalSpace R] [T2Space R] :
    qPochhammerInf (X : R⟦X⟧) X =
      qPochhammerInf (-X) X * ∑' k : ℤ, C (k.negOnePow : R) * X ^ (k.natAbs ^ 2) := sorry

/-- **Gauss's triangular-number identity** `∑_{n ≥ 0} q^{n(n+1)/2} = (q²; q²)_∞ / (q; q²)_∞`
(Stanley (1.132)). -/
theorem gauss_triangular [TopologicalSpace R] [T2Space R] :
    (∑' n : ℕ, (X : R⟦X⟧) ^ (n * (n + 1) / 2)) * qPochhammerInf X (X ^ 2) =
      qPochhammerInf (X ^ 2) (X ^ 2) := sorry

/-! ### Ramanujan's congruences (Ramanujan 1919, §§2–3) -/

/-- Frobenius: `(q; q)_∞ ^ p = (q^p; q^p)_∞` in `𝔽_p⟦q⟧`. -/
theorem qPochhammerInf_pow_prime (p : ℕ) [hp : Fact p.Prime] :
    (qPochhammerInf (X : (ZMod p)⟦X⟧) X) ^ p = expand p hp.out.ne_zero (qPochhammerInf X X) :=
  sorry

/-- If the coefficients of `q^r (q; q)_∞^{p-1}` at multiples of `p` vanish mod `p`, then
`p(pn + p - r) ≡ 0 (mod p)` for all `n`. -/
theorem partitionCount_modEq_zero_of_coeff (p r : ℕ) [Fact p.Prime] (hr : r ≤ p)
    (h : ∀ n, coeff (p * n) (X ^ r * qPochhammerInf (X : (ZMod p)⟦X⟧) X ^ (p - 1)) = 0) (n : ℕ) :
    (partitionCount (p * n + (p - r)) : ZMod p) = 0 := sorry

/-- The coefficient of `q^{5n}` in `q (q; q)_∞⁴` is divisible by `5`. -/
theorem five_dvd_coeff_X_mul_pow_four (n : ℕ) :
    (5 : ℤ) ∣ coeff (5 * n) (X * qPochhammerInf (X : ℤ⟦X⟧) X ^ 4) := sorry

/-- The coefficient of `q^{7n}` in `q² (q; q)_∞⁶` is divisible by `49`. -/
theorem fortynine_dvd_coeff_X_sq_mul_pow_six (n : ℕ) :
    (49 : ℤ) ∣ coeff (7 * n) (X ^ 2 * qPochhammerInf (X : ℤ⟦X⟧) X ^ 6) := sorry

/-- **Ramanujan's congruence** `p(5n + 4) ≡ 0 (mod 5)`. -/
theorem ramanujan_congruence_five (n : ℕ) : 5 ∣ partitionCount (5 * n + 4) := sorry

/-- **Ramanujan's congruence** `p(7n + 5) ≡ 0 (mod 7)`. -/
theorem ramanujan_congruence_seven (n : ℕ) : 7 ∣ partitionCount (7 * n + 5) := sorry

/-- **Ramanujan's congruences**, with the corollary `p(35n + 19) ≡ 0 (mod 35)`. -/
theorem ramanujan_congruence_thirtyfive (n : ℕ) : 35 ∣ partitionCount (35 * n + 19) := sorry

/-! ### The Rogers–Ramanujan identities (Cigler; Bressoud) -/

/-- **Cigler's identity** `∑_j (-1)^j q^{j(3j-1)/2} [n, k-j][n, k+j] = [n, k]`. -/
theorem cigler_identity (n k : ℕ) :
    ∑ j ∈ Finset.Icc (-(k : ℤ)) k, Polynomial.C (j.negOnePow : R) *
        Polynomial.X ^ (j * (3 * j - 1) / 2).toNat * qBinomial R n (k - j).toNat *
        qBinomial R n (k + j).toNat = qBinomial R n k := sorry

/-- Cigler's shifted identity `∑_j (-1)^j q^{3j(j-1)/2} [n, k-j][n+1, k+j] = q^k [n, k]`. -/
theorem cigler_identity_shifted (n k : ℕ) :
    ∑ j ∈ Finset.Icc (-(k : ℤ)) k, Polynomial.C (j.negOnePow : R) *
        Polynomial.X ^ (3 * j * (j - 1) / 2).toNat * qBinomial R n (k - j).toNat *
        qBinomial R (n + 1) (k + j).toNat = Polynomial.X ^ k * qBinomial R n k := sorry

/-- **Bressoud's identity** `∑_k q^{k²} [n, k] = ∑_j (-1)^j q^{j(5j-1)/2} [2n, n-2j]`. -/
theorem bressoud_first (n : ℕ) :
    ∑ k ∈ range (n + 1), Polynomial.X ^ (k ^ 2) * qBinomial R n k =
      ∑ j ∈ (Finset.Icc (-(n : ℤ)) n).filter (fun j ↦ 0 ≤ (n : ℤ) - 2 * j ∧ (n : ℤ) - 2 * j ≤ 2 * n),
        Polynomial.C (j.negOnePow : R) * Polynomial.X ^ (j * (5 * j - 1) / 2).toNat *
          qBinomial R (2 * n) ((n : ℤ) - 2 * j).toNat := sorry

/-- **Bressoud's second identity**
`∑_k q^{k² + k} [n, k] = ∑_j (-1)^j q^{j(5j-3)/2} [2n+1, n+1-2j]`. -/
theorem bressoud_second (n : ℕ) :
    ∑ k ∈ range (n + 1), Polynomial.X ^ (k ^ 2 + k) * qBinomial R n k =
      ∑ j ∈ (Finset.Icc (-(n : ℤ) - 1) (n + 1)).filter
          (fun j ↦ 0 ≤ (n : ℤ) + 1 - 2 * j ∧ (n : ℤ) + 1 - 2 * j ≤ 2 * n + 1),
        Polynomial.C (j.negOnePow : R) * Polynomial.X ^ (j * (5 * j - 3) / 2).toNat *
          qBinomial R (2 * n + 1) ((n : ℤ) + 1 - 2 * j).toNat := sorry

/-- **The first Rogers–Ramanujan identity** `∑ q^{k²}/(q; q)_k = 1/((q; q⁵)_∞ (q⁴; q⁵)_∞)`. -/
theorem rogers_ramanujan_first [TopologicalSpace R] [T2Space R] :
    (∑' k : ℕ, (X : R⟦X⟧) ^ (k ^ 2) * invOfUnit (qPochhammer X X k) 1) *
      (qPochhammerInf X (X ^ 5) * qPochhammerInf (X ^ 4) (X ^ 5)) = 1 := sorry

/-- **The second Rogers–Ramanujan identity**
`∑ q^{k² + k}/(q; q)_k = 1/((q²; q⁵)_∞ (q³; q⁵)_∞)`. -/
theorem rogers_ramanujan_second [TopologicalSpace R] [T2Space R] :
    (∑' k : ℕ, (X : R⟦X⟧) ^ (k ^ 2 + k) * invOfUnit (qPochhammer X X k) 1) *
      (qPochhammerInf (X ^ 2) (X ^ 5) * qPochhammerInf (X ^ 3) (X ^ 5)) = 1 := sorry

/-- Partitions into `k` parts differing by at least two have generating function
`q^{k²}/(q; q)_k`, and `q^{k² + k}/(q; q)_k` when `1` is not a part. -/
theorem differenceTwo_mul_qPochhammer (k : ℕ) :
    (PowerSeries.mk fun n ↦ (#(Finset.univ.filter fun μ : n.Partition ↦
        μ.parts.card = k ∧ μ.parts.Nodup ∧ ∀ i ∈ μ.parts, i + 1 ∉ μ.parts) : R)) *
        qPochhammer X X k = X ^ (k ^ 2) ∧
    (PowerSeries.mk fun n ↦ (#(Finset.univ.filter fun μ : n.Partition ↦
        μ.parts.card = k ∧ μ.parts.Nodup ∧ (∀ i ∈ μ.parts, i + 1 ∉ μ.parts) ∧ 1 ∉ μ.parts) : R)) *
        qPochhammer X X k = X ^ (k ^ 2 + k) := sorry

/-- **The Rogers–Ramanujan identities, partition form** (MacMahon, Schur). -/
theorem rogers_ramanujan_partitions (n : ℕ) :
    #(Finset.univ.filter fun μ : n.Partition ↦ ∀ i ∈ μ.parts, i % 5 = 1 ∨ i % 5 = 4) =
      #(Finset.univ.filter fun μ : n.Partition ↦ μ.parts.Nodup ∧ ∀ i ∈ μ.parts, i + 1 ∉ μ.parts) ∧
    #(Finset.univ.filter fun μ : n.Partition ↦ ∀ i ∈ μ.parts, i % 5 = 2 ∨ i % 5 = 3) =
      #(Finset.univ.filter fun μ : n.Partition ↦
        μ.parts.Nodup ∧ (∀ i ∈ μ.parts, i + 1 ∉ μ.parts) ∧ 1 ∉ μ.parts) := sorry

/-! ### Bailey pairs and the Andrews–Gordon identities (Warnaar §§1–2; Andrews 1984) -/

/-- `(α, β)` is a **Bailey pair relative to `a`** (Warnaar (1.3), Andrews (2.3)):
`β n = ∑_{r ≤ n} α r / ((q; q)_{n-r} (aq; q)_{n+r})`. Both denominators have constant coefficient `1`. -/
def IsBaileyPair (a : R⟦X⟧) (α β : ℕ → R⟦X⟧) : Prop :=
  ∀ n, β n = ∑ r ∈ range (n + 1), α r * invOfUnit (qPochhammer X X (n - r)) 1 *
    invOfUnit (qPochhammer (a * X) X (n + r)) 1

theorem isBaileyPair_iff (a : R⟦X⟧) (α β : ℕ → R⟦X⟧) :
    IsBaileyPair a α β ↔ ∀ n, β n = ∑ r ∈ range (n + 1), α r *
      invOfUnit (qPochhammer X X (n - r)) 1 * invOfUnit (qPochhammer (a * X) X (n + r)) 1 :=
  Iff.rfl

/-- `β` is determined by `α`. -/
theorem IsBaileyPair.beta_eq {a : R⟦X⟧} {α β β' : ℕ → R⟦X⟧} (h : IsBaileyPair a α β)
    (h' : IsBaileyPair a α β') : β = β' := sorry

/-- `α` is determined by `β`: the relation is triangular with unit diagonal `(aq; q)_{2n}⁻¹`. -/
theorem IsBaileyPair.alpha_eq {a : R⟦X⟧} {α α' β : ℕ → R⟦X⟧} (h : IsBaileyPair a α β)
    (h' : IsBaileyPair a α' β) : α = α' := sorry

theorem IsBaileyPair.exists_alpha (a : R⟦X⟧) (β : ℕ → R⟦X⟧) : ∃ α, IsBaileyPair a α β := sorry

theorem IsBaileyPair.add {a : R⟦X⟧} {α β α' β' : ℕ → R⟦X⟧} (h : IsBaileyPair a α β)
    (h' : IsBaileyPair a α' β') : IsBaileyPair a (α + α') (β + β') := sorry

theorem IsBaileyPair.smul {a : R⟦X⟧} {α β : ℕ → R⟦X⟧} (c : R⟦X⟧) (h : IsBaileyPair a α β) :
    IsBaileyPair a (c • α) (c • β) := sorry

theorem IsBaileyPair.map {S : Type*} [CommRing S] (f : R →+* S) {a : R⟦X⟧} {α β : ℕ → R⟦X⟧}
    (h : IsBaileyPair a α β) :
    IsBaileyPair (PowerSeries.map f a) (fun n ↦ PowerSeries.map f (α n)) (fun n ↦ PowerSeries.map f (β n)) :=
  sorry

/-- Test `baileyPair_zero` (degenerate). -/
example (a : R⟦X⟧) : IsBaileyPair a 0 0 := sorry

/-- Test `baileyPair_beta_zero` (computation): the `n = 0` relation. -/
example {a : R⟦X⟧} {α β : ℕ → R⟦X⟧} (h : IsBaileyPair a α β) : β 0 = α 0 := sorry

/-- Test `baileyPair_one_step` (computation): for `a = 1`, `α₀ = 1`, `α₁ = -(1 + q)` give `β₁ = 0`. -/
example : (1 : R⟦X⟧) * invOfUnit (qPochhammer X X 1) 1 * invOfUnit (qPochhammer X X 1) 1 +
    (-(1 + X)) * invOfUnit (qPochhammer X X 0) 1 * invOfUnit (qPochhammer X X 2) 1 = 0 := sorry

/-- Test `baileyPair_rogers` (compatibility): Rogers' pairs (Warnaar (1.7) relative to `1`, (1.10)
relative to `q`), both with `β_L = 1/(q; q)_L`. -/
example : IsBaileyPair (1 : R⟦X⟧)
      (fun L ↦ if L = 0 then 1 else (-1) ^ L * X ^ (L * (3 * L - 1) / 2) * (1 + X ^ L))
      (fun L ↦ invOfUnit (qPochhammer X X L) 1) ∧
    IsBaileyPair (X : R⟦X⟧)
      (fun L ↦ (-1) ^ L * X ^ (L * (3 * L + 1) / 2) * (1 - X ^ (2 * L + 1)) * invOfUnit (1 - X) 1)
      (fun L ↦ invOfUnit (qPochhammer X X L) 1) := sorry

/-- Test `baileyPair_delta_alpha` (non-example): `α = δ` does not pair with `β = δ`. -/
example [Nontrivial R] : ¬ IsBaileyPair (1 : R⟦X⟧) (fun n ↦ if n = 0 then 1 else 0)
    (fun n ↦ if n = 0 then 1 else 0) := sorry

/-- **The kernel identity** behind the limiting Bailey lemma:
`∑_{j=r}^{n} a^j q^{j²}/((q)_{n-j}(q)_{j-r}(aq)_{j+r}) = a^r q^{r²}/((q)_{n-r}(aq)_{n+r})`. -/
theorem bailey_kernel (a : R⟦X⟧) {r n : ℕ} (hrn : r ≤ n) :
    ∑ j ∈ Icc r n, a ^ j * X ^ (j ^ 2) * invOfUnit (qPochhammer X X (n - j)) 1 *
        invOfUnit (qPochhammer X X (j - r)) 1 * invOfUnit (qPochhammer (a * X) X (j + r)) 1 =
      a ^ r * X ^ (r ^ 2) * invOfUnit (qPochhammer X X (n - r)) 1 *
        invOfUnit (qPochhammer (a * X) X (n + r)) 1 := sorry

/-- The cleared form `∑_s [m, s] b^s q^{s²} (b q^{s+1}; q)_{m-s} = 1`, proved by the q-binomial theorem. -/
theorem bailey_kernel_cleared (b : R⟦X⟧) (m : ℕ) :
    ∑ s ∈ range (m + 1), (qBinomial R m s : R⟦X⟧) * b ^ s * X ^ (s ^ 2) *
      qPochhammer (b * X ^ (s + 1)) X (m - s) = 1 := sorry

/-- The `k`-th member of the Bailey chain starting from `β`:
`β^{(k+1)}_N = ∑_{r ≤ N} a^r q^{r²} β^{(k)}_r/(q; q)_{N-r}`. -/
def baileyChainBeta (a : R⟦X⟧) (β : ℕ → R⟦X⟧) : ℕ → ℕ → R⟦X⟧
  | 0 => β
  | k + 1 => fun N ↦ ∑ r ∈ range (N + 1), a ^ r * X ^ (r ^ 2) * baileyChainBeta a β k r *
      invOfUnit (qPochhammer X X (N - r)) 1

/-- **Bailey's lemma** in its limiting form (Warnaar (2.2)). -/
theorem IsBaileyPair.bailey {a : R⟦X⟧} {α β : ℕ → R⟦X⟧} (h : IsBaileyPair a α β) :
    IsBaileyPair a (fun n ↦ a ^ n * X ^ (n ^ 2) * α n) (baileyChainBeta a β 1) := sorry

/-- The Bailey chain: `k` applications of the lemma. -/
theorem IsBaileyPair.iterate {a : R⟦X⟧} {α β : ℕ → R⟦X⟧} (h : IsBaileyPair a α β) (k : ℕ) :
    IsBaileyPair a (fun n ↦ a ^ (k * n) * X ^ (k * n ^ 2) * α n) (baileyChainBeta a β k) := sorry

/-- The unit pair relative to `1`: `α₀ = 1`, `α_n = (-1)ⁿ q^{n(n-1)/2}(1 + qⁿ)`. -/
def unitAlphaOne (n : ℕ) : R⟦X⟧ :=
  if n = 0 then 1 else (-1) ^ n * X ^ (n * (n - 1) / 2) * (1 + X ^ n)

/-- The unit pair relative to `q`: `α_n = (-1)ⁿ q^{n(n-1)/2}(1 - q^{2n+1})/(1 - q)`. -/
def unitAlphaQ (n : ℕ) : R⟦X⟧ :=
  (-1) ^ n * X ^ (n * (n - 1) / 2) * (1 - X ^ (2 * n + 1)) * invOfUnit (1 - X) 1

theorem isBaileyPair_unit_one :
    IsBaileyPair (1 : R⟦X⟧) unitAlphaOne (fun n ↦ if n = 0 then 1 else 0) := sorry

theorem isBaileyPair_unit_q :
    IsBaileyPair (X : R⟦X⟧) unitAlphaQ (fun n ↦ if n = 0 then 1 else 0) := sorry

/-- **Andrews' limiting Bailey chain** (Andrews 1984, Theorem 2), for chains of length `k + 1`:
`(1/(aq)_∞) ∑ a^{(k+1)n} q^{(k+1)n²} α_n = ∑_{m₀ ≤ ⋯ ≤ m_k} a^{∑m} q^{∑m²} β_{m₀}/∏(q)_{m_{i+1}-m_i}`. -/
theorem tsum_bailey_chain [TopologicalSpace R] [T2Space R] {a : R⟦X⟧} {α β : ℕ → R⟦X⟧}
    (h : IsBaileyPair a α β) (k : ℕ) :
    invOfUnit (qPochhammerInf (a * X) X) 1 *
        ∑' n : ℕ, a ^ ((k + 1) * n) * X ^ ((k + 1) * n ^ 2) * α n =
      ∑' m : Fin (k + 1) → ℕ, if Monotone m then
        a ^ (∑ i, m i) * X ^ (∑ i, m i ^ 2) * β (m 0) *
          ∏ i : Fin k, invOfUnit (qPochhammer X X (m i.succ - m i.castSucc)) 1 else 0 := sorry

/-- **The Andrews–Gordon identities** for `i = 1` and `i = k` (Warnaar (2.5)), with `r = k - 1`
summation indices `n₁ ≥ ⋯ ≥ n_r ≥ 0` (here `m 0 ≥ ⋯ ≥ m (r-1)`), modulus `M = 2r + 3`:
`(∑ q^{∑ nⱼ² + ∑_{j ≥ i} nⱼ}/∏(q)_{nⱼ - nⱼ₊₁}) · (q; q)_∞ = (qⁱ; q^M)_∞ (q^{M-i}; q^M)_∞ (q^M; q^M)_∞`. -/
theorem andrews_gordon [TopologicalSpace R] [T2Space R] (r i : ℕ) (hi : i = 1 ∨ i = r + 1) :
    (∑' m : Fin r → ℕ, if Antitone m then
        (X : R⟦X⟧) ^ (∑ j, m j ^ 2 + ∑ j ∈ univ.filter (fun j : Fin r ↦ i ≤ (j : ℕ) + 1), m j) *
          ∏ j : Fin r, invOfUnit (qPochhammer X X
            (m j - if h : (j : ℕ) + 1 < r then m ⟨(j : ℕ) + 1, h⟩ else 0)) 1 else 0) *
        qPochhammerInf X X =
      qPochhammerInf (X ^ i) (X ^ (2 * r + 3)) * qPochhammerInf (X ^ (2 * r + 3 - i)) (X ^ (2 * r + 3)) *
        qPochhammerInf (X ^ (2 * r + 3)) (X ^ (2 * r + 3)) := sorry

/-- **The Andrews–Gordon identities as Nahm sums**: for `A_r = (2 min(i, j))` and `B_r = (1, …, r)`,
`∑_{m ∈ ℕ^r} q^{½ mᵀ A_r m}/∏(q)_{mⱼ}` and `∑ q^{½ mᵀ A_r m + B_r·m}/∏(q)_{mⱼ}`, times `(q; q)_∞`, are the
triple products for the classes `±(r + 1)` and `±1` modulo `2r + 3` (CGZ (45)). -/
theorem andrews_gordon_nahm [TopologicalSpace R] [T2Space R] (r : ℕ) :
    (∑' m : Fin r → ℕ, (X : R⟦X⟧) ^ (∑ i : Fin r, ∑ j : Fin r, min ((i : ℕ) + 1) ((j : ℕ) + 1) * m i * m j) *
        ∏ j, invOfUnit (qPochhammer X X (m j)) 1) * qPochhammerInf X X =
      qPochhammerInf (X ^ (r + 1)) (X ^ (2 * r + 3)) * qPochhammerInf (X ^ (r + 2)) (X ^ (2 * r + 3)) *
        qPochhammerInf (X ^ (2 * r + 3)) (X ^ (2 * r + 3)) ∧
    (∑' m : Fin r → ℕ, (X : R⟦X⟧) ^ (∑ i : Fin r, ∑ j : Fin r, min ((i : ℕ) + 1) ((j : ℕ) + 1) * m i * m j +
        ∑ j : Fin r, ((j : ℕ) + 1) * m j) * ∏ j, invOfUnit (qPochhammer X X (m j)) 1) * qPochhammerInf X X =
      qPochhammerInf X (X ^ (2 * r + 3)) * qPochhammerInf (X ^ (2 * r + 2)) (X ^ (2 * r + 3)) *
        qPochhammerInf (X ^ (2 * r + 3)) (X ^ (2 * r + 3)) := sorry

/-! ### Evaluation of formal products inside a disc -/

/-- **Evaluation of an x-adic product** on a disc where the factors are majorised: the formal
product `∏ (1 + fₙ)` evaluated at `z` is the analytic product of the evaluated factors. -/
theorem hasSum_eval_tprod_one_add {f : ℕ → ℂ⟦X⟧} {r : ℝ}
    (hord : Tendsto (fun n ↦ (f n).order) atTop (𝓝 ⊤))
    (hsum : ∀ n, Summable fun k ↦ ‖coeff k (f n)‖ * r ^ k)
    (hmaj : Summable fun n ↦ ∑' k, ‖coeff k (f n)‖ * r ^ k) {z : ℂ} (hz : ‖z‖ ≤ r) :
    HasSum (fun k ↦ coeff k (∏' n, (1 + f n)) * z ^ k)
      (∏' n, (1 + ∑' k, coeff k (f n) * z ^ k)) := sorry

theorem hasProd_eval_one_add {f : ℕ → ℂ⟦X⟧} {r : ℝ}
    (hord : Tendsto (fun n ↦ (f n).order) atTop (𝓝 ⊤))
    (hsum : ∀ n, Summable fun k ↦ ‖coeff k (f n)‖ * r ^ k)
    (hmaj : Summable fun n ↦ ∑' k, ‖coeff k (f n)‖ * r ^ k) {z : ℂ} (hz : ‖z‖ ≤ r) :
    HasProd (fun n ↦ 1 + ∑' k, coeff k (f n) * z ^ k)
      (∑' k, coeff k (∏' n, (1 + f n)) * z ^ k) := sorry

end QM0

end TauCeti.QSeries

end QM0File


-- ===== QM.1 =====

section QM1File

/-
Suggested Lean forms for layer QM.1 (Theta, eta and Jacobi forms) of the roadmap
"Q-series, partitions, Jacobi and mock modular forms" (`QSeriesPartitionsAndMockModularForms`).

This file is not the roadmap and is not exhaustive: the roadmap document is definitive. The
statements below suggest Lean forms, so that contributors and reviewers converge on names and
signatures. Every definition, API lemma, unit test and named theorem is proved by `sorry`; nothing
here is an implementation claim. It imports only Mathlib (082e2d3).

Objects owned by `MetaplecticAutomorphicForms:MP.7` (the half-integral-weight automorphy factor and
its sign cocycle, multiplier systems, Shimura's theta multiplier on `Γ₀(4)`, `Mp₂(ℤ)` and the Weil
representation `ρ_L`) are not declared here. Where a statement needs one of them it is written out
explicitly with Mathlib's principal-branch `cpow` (`(denom γ τ) ^ (1 / 2 : ℂ)`), Mathlib's
`jacobiSym`, or it is left out with a comment saying so; the formalisation imports MP.7's
declarations once they exist.
-/


open UpperHalfPlane hiding I
open Complex Filter Topology
open scoped MatrixGroups Real ModularForm

namespace TauCeti.QSeries

section QM1

noncomputable section

/-! ## Dedekind sums (Kong–Teo, §6) -/

/-- The Dedekind sum `s(h, k) = ∑_{r=1}^{k-1} (r/k) (hr/k - ⌊hr/k⌋ - 1/2)` (Kong–Teo (6.1));
`s(h, 0) = s(h, 1) = 0`. For `gcd(h, k) = 1` this is the classical `∑ ((r/k)) ((hr/k))`. -/
def dedekindSum (h : ℤ) (k : ℕ) : ℚ :=
  ∑ r ∈ Finset.Ico 1 k, ((r : ℚ) / k) * (Int.fract ((h * r : ℚ) / k) - 1 / 2)

/-- Kong–Teo, Lemma 6.1: `s(h, k)` depends only on `h mod k`. -/
theorem dedekindSum_congr {h h' : ℤ} {k : ℕ} (hk : h ≡ h' [ZMOD k]) :
    dedekindSum h k = dedekindSum h' k := sorry

/-- Kong–Teo, Lemma 6.2: `s(-h, k) = -s(h, k)` for `gcd(h, k) = 1`. -/
theorem dedekindSum_neg {h : ℤ} {k : ℕ} (hk : IsCoprime h k) :
    dedekindSum (-h) k = -dedekindSum h k := sorry

/-- `s(h, 1) = 0`. -/
@[simp] theorem dedekindSum_one_right (h : ℤ) : dedekindSum h 1 = 0 := sorry

/-- `s(1, k) = (k - 1)(k - 2)/(12k)` for `k ≥ 1`. -/
theorem dedekindSum_one_left {k : ℕ} (hk : 1 ≤ k) :
    dedekindSum 1 k = ((k : ℚ) - 1) * (k - 2) / (12 * k) := sorry

/-- `6k · s(h, k)` is an integer. -/
theorem exists_int_eq_six_mul_dedekindSum (h : ℤ) (k : ℕ) :
    ∃ n : ℤ, 6 * (k : ℚ) * dedekindSum h k = n := sorry

/-- Kong–Teo, Lemma 6.3: `∑_{r=1}^{k-1} ⌊hr/k⌋ = (h - 1)(k - 1)/2` for coprime `h, k ≥ 1`. -/
theorem sum_floor_mul_div {h k : ℕ} (hh : 1 ≤ h) (hk : 1 ≤ k) (hcop : Nat.Coprime h k) :
    (∑ r ∈ Finset.Ico 1 k, ((h * r / k : ℕ) : ℚ)) = ((h : ℚ) - 1) * (k - 1) / 2 := sorry

/-- Kong–Teo, Lemma 6.4: `∑_{r=1}^{k-1} ⌊hr/k⌋² = 2h s(k, h) + (2hk - 3h - k + 3)(h - 1)/6`. -/
theorem sum_floor_mul_div_sq {h k : ℕ} (hh : 1 ≤ h) (hk : 1 ≤ k) (hcop : Nat.Coprime h k) :
    (∑ r ∈ Finset.Ico 1 k, ((h * r / k : ℕ) : ℚ) ^ 2) =
      2 * h * dedekindSum k h + (2 * h * k - 3 * h - k + 3) * ((h : ℚ) - 1) / 6 := sorry

/-- **Dedekind reciprocity** (Kong–Teo, Theorem 6.5). -/
theorem dedekindSum_reciprocity {h k : ℕ} (hh : 1 ≤ h) (hk : 1 ≤ k) (hcop : Nat.Coprime h k) :
    dedekindSum h k + dedekindSum k h =
      ((h : ℚ) ^ 2 + (k : ℚ) ^ 2 - 3 * h * k + 1) / (12 * h * k) := sorry

/-- Unit test `dedekindSum.test_one_three`: `s(1, 3) = 1/18`. -/
example : dedekindSum 1 3 = 1 / 18 := sorry
/-- Unit test `dedekindSum.test_two_five`: `s(2, 5) = 0`. -/
example : dedekindSum 2 5 = 0 := sorry
/-- Unit test `dedekindSum.test_three_seven`: `s(3, 7) = -1/14` and `s(7, 3) = 1/18`. -/
example : dedekindSum 3 7 = -1 / 14 ∧ dedekindSum 7 3 = 1 / 18 := sorry
/-- Unit test `dedekindSum.test_degenerate`: `s(h, 1) = 0` for every `h`. -/
example (h : ℤ) : dedekindSum h 1 = 0 := sorry
/-- Unit test `dedekindSum.test_not_symmetric`: `s(4, 9) = -4/27 ≠ 1/8 = s(9, 4)`. -/
example : dedekindSum 4 9 = -4 / 27 ∧ dedekindSum 9 4 = 1 / 8 := sorry

/-! ## The eta multiplier system (Kong–Teo, §§5 and 7) -/

/-- Kong–Teo, Proposition 5.1: `η(τ + m) = e^{πim/12} η(τ)`. -/
theorem eta_add_int (τ : ℂ) (m : ℤ) : η (τ + m) = cexp (π * I * m / 12) * η τ := sorry

/-- Branch lemma behind Kong–Teo's induction step: for `x, y, xy` in the upper half-plane,
`(-i x)^{1/2} (-i y)^{1/2} = e^{-πi/4} (-i xy)^{1/2}` (principal branches). -/
theorem cpow_neg_I_mul_half_mul {x y : ℂ} (hx : 0 < x.im) (hy : 0 < y.im) (hxy : 0 < (x * y).im) :
    (-I * x) ^ (1 / 2 : ℂ) * (-I * y) ^ (1 / 2 : ℂ) =
      cexp (-π * I / 4) * (-I * (x * y)) ^ (1 / 2 : ℂ) := sorry

/-- The multiplier system `v_η : SL(2, ℤ) → ℂ` of the Dedekind eta function, normalised by
`η(γτ) = v_η(γ) (cτ + d)^{1/2} η(τ)` with the principal branch. For `c > 0` it is
`exp(πi((a + d)/(12c) + s(-d, c) - 1/4))` (Rademacher's formula, Kong–Teo (7.1)); for `c = 0` it is
`e^{πib/12}` (`d = 1`) or `-i e^{-πib/12}` (`d = -1`); for `c < 0` it is `i · v_η(-γ)`. -/
def etaMultiplier (γ : SL(2, ℤ)) : ℂ :=
  if 0 < γ 1 0 then
    cexp (π * I * (((γ 0 0 + γ 1 1 : ℤ) : ℂ) / (12 * (γ 1 0 : ℂ)) +
      (dedekindSum (-(γ 1 1)) (γ 1 0).toNat : ℂ) - 1 / 4))
  else if γ 1 0 = 0 then
    (if γ 1 1 = 1 then cexp (π * I * (γ 0 1 : ℂ) / 12) else -I * cexp (-π * I * (γ 0 1 : ℂ) / 12))
  else
    I * cexp (π * I * (((-(γ 0 0) - γ 1 1 : ℤ) : ℂ) / (12 * (-(γ 1 0) : ℂ)) +
      (dedekindSum (γ 1 1) (-(γ 1 0)).toNat : ℂ) - 1 / 4))

/-- The formula for `c > 0` (unfolding lemma). -/
theorem etaMultiplier_of_pos {γ : SL(2, ℤ)} (hc : 0 < γ 1 0) :
    etaMultiplier γ = cexp (π * I * (((γ 0 0 + γ 1 1 : ℤ) : ℂ) / (12 * (γ 1 0 : ℂ)) +
      (dedekindSum (-(γ 1 1)) (γ 1 0).toNat : ℂ) - 1 / 4)) := sorry

/-- `v_η(T^n) = e^{πin/12}`. -/
theorem etaMultiplier_T_zpow (n : ℤ) : etaMultiplier (ModularGroup.T ^ n) = cexp (π * I * n / 12) :=
  sorry

/-- `v_η(S) = e^{-πi/4}`. -/
theorem etaMultiplier_S : etaMultiplier ModularGroup.S = cexp (-π * I / 4) := sorry

/-- `v_η(-1) = -i`. -/
theorem etaMultiplier_neg_one : etaMultiplier (-1) = -I := sorry

/-- `v_η(-γ) = i v_η(γ)` when `c > 0` (and `v_η(γ) = i v_η(-γ)` when `c < 0`). -/
theorem etaMultiplier_neg_of_pos {γ : SL(2, ℤ)} (hc : 0 < γ 1 0) :
    etaMultiplier (-γ) = I * etaMultiplier γ := sorry

/-- `|v_η(γ)| = 1`. -/
theorem norm_etaMultiplier (γ : SL(2, ℤ)) : ‖etaMultiplier γ‖ = 1 := sorry

/-- `v_η(γ)^{24} = 1`. -/
theorem etaMultiplier_pow_24 (γ : SL(2, ℤ)) : etaMultiplier γ ^ 24 = 1 := sorry

/-- `v_η(γT) = e^{πi/12} v_η(γ)`. -/
theorem etaMultiplier_mul_T (γ : SL(2, ℤ)) :
    etaMultiplier (γ * ModularGroup.T) = cexp (π * I / 12) * etaMultiplier γ := sorry

/-- **Multiplier-system law**: `v_η(γ₁γ₂) (c₃τ + d₃)^{1/2} = v_η(γ₁) v_η(γ₂) (c₁γ₂τ + d₁)^{1/2}
(c₂τ + d₂)^{1/2}`, i.e. `v_η` is a multiplier system of weight `1/2` for the sign cocycle of
`MetaplecticAutomorphicForms:MP.7`. -/
theorem etaMultiplier_mul (γ₁ γ₂ : SL(2, ℤ)) (τ : ℍ) :
    etaMultiplier (γ₁ * γ₂) * denom (γ₁ * γ₂) τ ^ (1 / 2 : ℂ) =
      etaMultiplier γ₁ * etaMultiplier γ₂ * denom γ₁ (γ₂ • τ : ℍ) ^ (1 / 2 : ℂ) *
        denom γ₂ τ ^ (1 / 2 : ℂ) := sorry

/-- Unit test `etaMultiplier.test_T`: `v_η(T) = e^{πi/12}`. -/
example : etaMultiplier ModularGroup.T = cexp (π * I / 12) := sorry
/-- Unit test `etaMultiplier.test_S_agrees_with_mathlib`: `v_η(S) = (√i)⁻¹`, the constant of
Mathlib's `ModularForm.eta_comp_eq_csqrt_I_inv`. -/
example : etaMultiplier ModularGroup.S = (Complex.sqrt I)⁻¹ := sorry
/-- Unit test `etaMultiplier.test_neg_one`: `v_η(-1) = -i`. -/
example : etaMultiplier (-1) = -I := sorry
/-- Unit test `etaMultiplier.test_dedekind_sum_sign`: for `γ = (1 0; 3 1)`, `v_η(γ) = e^{-πi/4}`
(the Dedekind sum `s(-1, 3) = -1/18` enters with a plus sign; the opposite sign gives
`e^{-5πi/36}`, not a 24th root of unity). -/
example : etaMultiplier ⟨!![1, 0; 3, 1], by decide⟩ = cexp (-π * I / 4) := sorry
/-- Unit test `etaMultiplier.test_not_hom`: `v_η` is not a homomorphism: with
`γ = (-1 0; 1 -1)`, `v_η(Sγ) = -v_η(S) v_η(γ)`. -/
example : etaMultiplier (ModularGroup.S * ⟨!![-1, 0; 1, -1], by decide⟩) =
    -(etaMultiplier ModularGroup.S * etaMultiplier ⟨!![-1, 0; 1, -1], by decide⟩) := sorry
/-- Unit test `etaMultiplier.test_value_2135`: for `γ = (2 1; 5 3)`, `v_η(γ) = e^{-πi/6}`. -/
example : etaMultiplier ⟨!![2, 1; 5, 3], by decide⟩ = cexp (-π * I / 6) := sorry

/-- **Dedekind's functional equation** for `c > 0` (Kong–Teo, Theorem 7.1), with
`ω(a, b, c, d) = (a + d)/c + 12 s(-d, c)` an integer. -/
theorem eta_transform_of_pos (γ : SL(2, ℤ)) (hc : 0 < γ 1 0) (τ : ℍ) :
    η (γ • τ : ℍ) = cexp (π * I * (((γ 0 0 + γ 1 1 : ℤ) : ℂ) / (12 * (γ 1 0 : ℂ)) +
        (dedekindSum (-(γ 1 1)) (γ 1 0).toNat : ℂ))) *
        (-I * ((γ 1 0 : ℂ) * τ + γ 1 1)) ^ (1 / 2 : ℂ) * η τ ∧
      ∃ n : ℤ, ((γ 0 0 + γ 1 1 : ℤ) : ℚ) / (γ 1 0 : ℚ) +
        12 * dedekindSum (-(γ 1 1)) (γ 1 0).toNat = n := sorry

/-- **The Dedekind eta transformation formula** on all of `SL(2, ℤ)`. -/
theorem eta_transform (γ : SL(2, ℤ)) (τ : ℍ) :
    η (γ • τ : ℍ) = etaMultiplier γ * denom γ τ ^ (1 / 2 : ℂ) * η τ := sorry

/-- `e^{-2πiτ/24} η(τ) = ∏ (1 - qⁿ) → 1` as `Im τ → ∞`. -/
theorem tendsto_cexp_mul_eta_atImInfty :
    Tendsto (fun τ : ℍ ↦ cexp (-2 * π * I * τ / 24) * η τ) atImInfty (𝓝 1) := sorry

/-- **Eta at every cusp**: for every `σ ∈ SL(2, ℤ)`,
`e^{-2πiτ/24} (cτ + d)^{-1/2} η(στ) → v_η(σ) ≠ 0`: `η` has order `1/24` at every cusp. -/
theorem tendsto_eta_slash_atImInfty (σ : SL(2, ℤ)) :
    Tendsto (fun τ : ℍ ↦ cexp (-2 * π * I * τ / 24) * denom σ τ ^ (-(1 / 2 : ℂ)) * η (σ • τ : ℍ))
      atImInfty (𝓝 (etaMultiplier σ)) := sorry

/-! ## Eta quotients -/

/-- For `δ ∣ N`, conjugation by `diag(δ, 1)` sends `γ = (a b; c d) ∈ Γ₀(N)` to
`γ_δ = (a, δb; c/δ, d) ∈ SL(2, ℤ)`, so that `δ · (γτ) = γ_δ (δτ)`. -/
def gamma0Dilate {N δ : ℕ} (hδ : δ ∣ N) : CongruenceSubgroup.Gamma0 N →* SL(2, ℤ) := sorry

/-- The entries of `γ_δ`. -/
theorem gamma0Dilate_apply {N δ : ℕ} (hδ : δ ∣ N) (γ : CongruenceSubgroup.Gamma0 N) :
    ((gamma0Dilate hδ γ : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ) =
      !![(γ : SL(2, ℤ)) 0 0, δ * (γ : SL(2, ℤ)) 0 1; (γ : SL(2, ℤ)) 1 0 / δ, (γ : SL(2, ℤ)) 1 1] :=
  sorry

/-- `δ · (γτ) = γ_δ (δτ)`. -/
theorem gamma0Dilate_smul {N δ : ℕ} (hδ : δ ∣ N) (hδ0 : 0 < δ) (γ : CongruenceSubgroup.Gamma0 N)
    (τ : ℍ) :
    (δ : ℂ) * ((γ : SL(2, ℤ)) • τ : ℍ) =
      ((gamma0Dilate hδ γ • (⟨δ * (τ : ℂ), by sorry⟩ : ℍ) : ℍ) : ℂ) := sorry

/-- `j(γ_δ, δτ) = j(γ, τ)`. -/
theorem denom_gamma0Dilate {N δ : ℕ} (hδ : δ ∣ N) (hδ0 : 0 < δ) (γ : CongruenceSubgroup.Gamma0 N)
    (τ : ℍ) :
    denom (gamma0Dilate hδ γ) (δ * (τ : ℂ)) = denom (γ : SL(2, ℤ)) τ := sorry

/-- Unit test `gamma0Dilate.test_one`: `γ_1 = γ`. -/
example {N : ℕ} (γ : CongruenceSubgroup.Gamma0 N) :
    gamma0Dilate (one_dvd N) γ = (γ : SL(2, ℤ)) := sorry
/-- Unit test `gamma0Dilate.test_T`: `T_δ = T^δ`. -/
example {N δ : ℕ} (hδ : δ ∣ N) :
    gamma0Dilate hδ ⟨ModularGroup.T, by sorry⟩ = ModularGroup.T ^ (δ : ℤ) := sorry
/-- Unit test `gamma0Dilate.test_lower`: for `γ = (1 0; 4 1) ∈ Γ₀(4)` and `δ = 2`,
`γ_2 = (1 0; 2 1)`. -/
example : ((gamma0Dilate (show 2 ∣ 4 by norm_num) ⟨⟨!![1, 0; 4, 1], by decide⟩, by sorry⟩ :
    SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ) = !![1, 0; 2, 1] := sorry

/-- The eta quotient `η_r(τ) = ∏_{δ} η(δτ)^{r_δ}` for `r : ℕ →₀ ℤ` supported on positive
integers; its weight is `(1/2) ∑ r_δ`. -/
def etaQuotient (r : ℕ →₀ ℤ) (τ : ℂ) : ℂ :=
  ∏ δ ∈ r.support, η ((δ : ℂ) * τ) ^ (r δ)

/-- `η_{r+s} = η_r η_s` on the upper half-plane. -/
theorem etaQuotient_add (r s : ℕ →₀ ℤ) (τ : ℍ) :
    etaQuotient (r + s) τ = etaQuotient r τ * etaQuotient s τ := sorry

/-- `η_{single δ n}(τ) = η(δτ)^n`. -/
theorem etaQuotient_single (δ : ℕ) (n : ℤ) (τ : ℂ) :
    etaQuotient (Finsupp.single δ n) τ = η ((δ : ℂ) * τ) ^ n := sorry

/-- Eta quotients do not vanish on `ℍ`. -/
theorem etaQuotient_ne_zero (r : ℕ →₀ ℤ) (hr : ∀ δ ∈ r.support, 0 < δ) (τ : ℍ) :
    etaQuotient r τ ≠ 0 := sorry

/-- Eta quotients are holomorphic on `ℍ`. -/
theorem differentiableOn_etaQuotient (r : ℕ →₀ ℤ) (hr : ∀ δ ∈ r.support, 0 < δ) :
    DifferentiableOn ℂ (etaQuotient r) {z | 0 < z.im} := sorry

/-- The order at `∞`: `e^{-2πiτ(∑ δ r_δ)/24} η_r(τ) → 1`. -/
theorem tendsto_etaQuotient_atImInfty (r : ℕ →₀ ℤ) (hr : ∀ δ ∈ r.support, 0 < δ) :
    Tendsto (fun τ : ℍ ↦ cexp (-2 * π * I * τ * (∑ δ ∈ r.support, (δ : ℂ) * r δ) / 24) *
      etaQuotient r τ) atImInfty (𝓝 1) := sorry

/-- Unit test `etaQuotient.test_discriminant`: `η_{24·[1]} = Δ` (Mathlib's
`ModularForm.discriminant`). -/
example (τ : ℍ) : etaQuotient (Finsupp.single 1 24) τ = ModularForm.discriminant τ := sorry
/-- Unit test `etaQuotient.test_T_sign`: `η(τ)η(11τ)` is not `T`-invariant:
`f(τ + 1) = -f(τ)` because `∑ δ r_δ = 12 ≢ 0 (mod 24)`. -/
example (τ : ℍ) : etaQuotient (Finsupp.single 1 1 + Finsupp.single 11 1) ((τ : ℂ) + 1) =
    -etaQuotient (Finsupp.single 1 1 + Finsupp.single 11 1) τ := sorry
/-- Unit test `etaQuotient.test_zero`: the empty eta quotient is `1`. -/
example (τ : ℂ) : etaQuotient 0 τ = 1 := sorry

/-- **Transformation law of eta quotients** on `Γ₀(N)` (every `δ` in the support divides `N`):
`η_r(γτ) = (∏_δ v_η(γ_δ)^{r_δ}) ((cτ + d)^{1/2})^{∑ r_δ} η_r(τ)`. -/
theorem etaQuotient_transform {N : ℕ} (r : ℕ →₀ ℤ) (hr : ∀ δ ∈ r.support, 0 < δ ∧ δ ∣ N)
    (γ : CongruenceSubgroup.Gamma0 N) (τ : ℍ) :
    etaQuotient r ((γ : SL(2, ℤ)) • τ : ℍ) =
      (∏ δ ∈ r.support.attach,
          etaMultiplier (gamma0Dilate (hr δ.1 δ.2).2 γ) ^ (r δ.1)) *
        (denom (γ : SL(2, ℤ)) τ ^ (1 / 2 : ℂ)) ^ (∑ δ ∈ r.support, r δ) * etaQuotient r τ := sorry

/-- The Hermite decomposition behind the cusp orders: for `δ ≥ 1` and `σ = (a b; c d)`, with
`A = gcd(c, δ)` and `D = δ/A`, there are `σ' ∈ SL(2, ℤ)` and `0 ≤ B < D` with
`η(δ στ) = v_η(σ') D^{-1/2} (cτ + d)^{1/2} η((Aτ + B)/D)`. -/
theorem eta_dilate_slash (δ : ℕ) (hδ : 0 < δ) (σ : SL(2, ℤ)) :
    ∃ (σ' : SL(2, ℤ)) (B : ℤ), 0 ≤ B ∧ B < (δ / Int.gcd (σ 1 0) δ : ℕ) ∧ ∀ τ : ℍ,
      η ((δ : ℂ) * (σ • τ : ℍ)) = etaMultiplier σ' *
        ((δ / Int.gcd (σ 1 0) δ : ℕ) : ℂ) ^ (-(1 / 2 : ℂ)) * denom σ τ ^ (1 / 2 : ℂ) *
        η (((Int.gcd (σ 1 0) δ : ℂ) * τ + B) / ((δ / Int.gcd (σ 1 0) δ : ℕ) : ℂ)) := sorry

/-- **Ligozat's cusp-order formula**: for every `σ ∈ SL(2, ℤ)` with lower-left entry `c`, the eta
quotient has order `ρ = (1/24) ∑_δ r_δ gcd(c, δ)²/δ` at the cusp `σ∞`, with a nonzero leading
coefficient. -/
theorem etaQuotient_slash_tendsto (r : ℕ →₀ ℤ) (hr : ∀ δ ∈ r.support, 0 < δ) (σ : SL(2, ℤ)) :
    ∃ C : ℂ, C ≠ 0 ∧ Tendsto (fun τ : ℍ ↦
      cexp (-2 * π * I * τ *
          (((∑ δ ∈ r.support, (r δ : ℚ) * (Int.gcd (σ 1 0) δ : ℚ) ^ 2 / δ) / 24 : ℚ) : ℂ)) *
        (denom σ τ ^ (1 / 2 : ℂ)) ^ (-(∑ δ ∈ r.support, r δ)) * etaQuotient r (σ • τ : ℍ))
      atImInfty (𝓝 C) := sorry

/-- Gauss's identity as an eta quotient: `θ(τ) = ∑ q^{n²} = η(2τ)⁵ / (η(τ)² η(4τ)²)`
(`q = e^{2πiτ}`; Mathlib's `jacobiTheta` at `2τ`). -/
theorem jacobiTheta_two_mul_eq_etaQuotient (τ : ℍ) :
    jacobiTheta (2 * (τ : ℂ)) =
      etaQuotient (Finsupp.single 1 (-2) + Finsupp.single 2 5 + Finsupp.single 4 (-2)) τ := sorry

/-- **The eta-quotient multiplier of `θ` is Shimura's theta multiplier** (the convention of
`MetaplecticAutomorphicForms:MP.7`): for `γ ∈ Γ₀(4)` with lower row `(c, d)`,
`v_η(γ₁)^{-2} v_η(γ₂)^5 v_η(γ₄)^{-2} = (c/d) ε_d^{-1}`. MP.7's extended Jacobi symbol and `ε_d`
are written out. -/
theorem etaQuotient_theta_multiplier_eq_shimura (γ : CongruenceSubgroup.Gamma0 4) :
    etaMultiplier (gamma0Dilate (show 1 ∣ 4 by norm_num) γ) ^ (-2 : ℤ) *
        etaMultiplier (gamma0Dilate (show 2 ∣ 4 by norm_num) γ) ^ (5 : ℤ) *
        etaMultiplier (gamma0Dilate (show 4 ∣ 4 by norm_num) γ) ^ (-2 : ℤ) =
      ((if (γ : SL(2, ℤ)) 1 0 < 0 ∧ (γ : SL(2, ℤ)) 1 1 < 0 then -1 else 1) *
          jacobiSym ((γ : SL(2, ℤ)) 1 0) ((γ : SL(2, ℤ)) 1 1).natAbs : ℂ) *
        (if (γ : SL(2, ℤ)) 1 1 % 4 = 1 then 1 else I)⁻¹ := sorry

/-- `Γ₀(4)` is generated by `T`, `(1 0; 4 1)` and `-1` (Savitt, §4). -/
theorem gamma0_four_eq_closure :
    CongruenceSubgroup.Gamma0 4 =
      Subgroup.closure {ModularGroup.T, ⟨!![1, 0; 4, 1], by decide⟩, -1} := sorry

/-- **Savitt's Jacobi-symbol formula** (Theorem 4.1): for `γ = (a b; c d) ∈ Γ₀(4)`,
`v_η(γ) = (c/d) e^{πi E/12}` with `E = ac(1 - d²) + d(b - c + 3) - 3` and the extended Jacobi
symbol (`(c/d) = sgn(c) (c/|d|)` for `d < 0`, `(0/±1) = 1`). -/
theorem etaMultiplier_of_mem_gamma0_four (γ : SL(2, ℤ)) (hγ : γ ∈ CongruenceSubgroup.Gamma0 4) :
    etaMultiplier γ =
      ((if γ 1 0 < 0 ∧ γ 1 1 < 0 then -1 else 1) * jacobiSym (γ 1 0) (γ 1 1).natAbs : ℂ) *
        cexp (π * I * ((γ 0 0 * γ 1 0 * (1 - γ 1 1 ^ 2) + γ 1 1 * (γ 0 1 - γ 1 0 + 3) - 3 : ℤ) : ℂ)
          / 12) := sorry

/-! ## The theta group and the multiplier of `jacobiTheta` -/

/-- The theta group `Γ_θ = {γ ∈ SL(2, ℤ) : a ≡ d, b ≡ c (mod 2)}`, the matrices congruent to `1`
or `S` modulo `2`. -/
def thetaGroup : Subgroup SL(2, ℤ) where
  carrier := {γ | ((γ 0 0 : ZMod 2) = γ 1 1) ∧ ((γ 0 1 : ZMod 2) = γ 1 0)}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

theorem mem_thetaGroup_iff {γ : SL(2, ℤ)} :
    γ ∈ thetaGroup ↔ ((γ 0 0 : ZMod 2) = γ 1 1) ∧ ((γ 0 1 : ZMod 2) = γ 1 0) := sorry

theorem S_mem_thetaGroup : ModularGroup.S ∈ thetaGroup := sorry

theorem T_sq_mem_thetaGroup : ModularGroup.T ^ 2 ∈ thetaGroup := sorry

theorem T_notMem_thetaGroup : ModularGroup.T ∉ thetaGroup := sorry

theorem Gamma_two_le_thetaGroup : CongruenceSubgroup.Gamma 2 ≤ thetaGroup := sorry

theorem thetaGroup_index : thetaGroup.index = 3 := sorry

theorem thetaGroup_eq_closure :
    thetaGroup = Subgroup.closure {ModularGroup.S, ModularGroup.T ^ 2} := sorry

/-- Unit test `thetaGroup.test_S_T_sq`: `S, T², -1 ∈ Γ_θ`. -/
example : ModularGroup.S ∈ thetaGroup ∧ ModularGroup.T ^ 2 ∈ thetaGroup ∧ -1 ∈ thetaGroup := sorry
/-- Unit test `thetaGroup.test_T_not_mem`: `T ∉ Γ_θ` and `ST ∉ Γ_θ`. -/
example : ModularGroup.T ∉ thetaGroup ∧ ModularGroup.S * ModularGroup.T ∉ thetaGroup := sorry
/-- Unit test `thetaGroup.test_index`: `[SL(2, ℤ) : Γ_θ] = 3`, while `[SL(2, ℤ) : Γ₀(2)] = 3`
and `Γ_θ ≠ Γ₀(2)` (`S ∉ Γ₀(2)`). -/
example : thetaGroup.index = 3 ∧ ModularGroup.S ∉ CongruenceSubgroup.Gamma0 2 := sorry

/-- `γ ∈ Γ_θ` iff `γ ∈ Γ(2)` or `γ S⁻¹ ∈ Γ(2)`. -/
theorem mem_thetaGroup_iff_Gamma_two {γ : SL(2, ℤ)} :
    γ ∈ thetaGroup ↔
      γ ∈ CongruenceSubgroup.Gamma 2 ∨ γ * ModularGroup.S⁻¹ ∈ CongruenceSubgroup.Gamma 2 := sorry

/-- Right cosets of `Γ_θ`: `σ ∈ Γ_θ T^ℤ` iff its first column has `a + c` odd, and
`σ ∈ Γ_θ (TS) T^ℤ` iff `a` and `c` are both odd. -/
theorem thetaGroup_right_cosets (σ : SL(2, ℤ)) :
    ((∃ (γ : thetaGroup) (j : ℤ), σ = γ * ModularGroup.T ^ j) ↔ Odd (σ 0 0 + σ 1 0)) ∧
      ((∃ (γ : thetaGroup) (j : ℤ), σ = γ * (ModularGroup.T * ModularGroup.S) * ModularGroup.T ^ j) ↔
        (Odd (σ 0 0) ∧ Odd (σ 1 0))) := sorry

/-- The multiplier of `jacobiTheta` (`ϑ(τ) = ∑ e^{πin²τ}`) at `γ`, normalised by
`ϑ(γτ) = v_θ(γ) (cτ + d)^{1/2} ϑ(τ)` for `γ ∈ Γ_θ`; defined as the value of the quotient at
`τ = i` (`ϑ(i) > 0`). -/
def thetaMultiplier (γ : SL(2, ℤ)) : ℂ :=
  jacobiTheta (γ • UpperHalfPlane.I : ℍ) /
    (denom γ UpperHalfPlane.I ^ (1 / 2 : ℂ) * jacobiTheta (UpperHalfPlane.I : ℂ))

/-- `v_θ(S) = e^{-πi/4}` (from `jacobiTheta_S_smul`). -/
theorem thetaMultiplier_S : thetaMultiplier ModularGroup.S = cexp (-π * I / 4) := sorry

/-- `v_θ(T²) = 1` (from `jacobiTheta_T_sq_smul`). -/
theorem thetaMultiplier_T_sq : thetaMultiplier (ModularGroup.T ^ 2) = 1 := sorry

/-- `v_θ(-1) = -i`. -/
theorem thetaMultiplier_neg_one : thetaMultiplier (-1) = -I := sorry

/-- `|v_θ(γ)| = 1` and `v_θ(γ)⁸ = 1` on `Γ_θ`. -/
theorem thetaMultiplier_pow_eight {γ : SL(2, ℤ)} (hγ : γ ∈ thetaGroup) :
    thetaMultiplier γ ^ 8 = 1 := sorry

/-- Unit test `thetaMultiplier.test_S`: `v_θ(S) = e^{-πi/4}`, matching Mathlib's
`jacobiTheta_S_smul` (`(-iτ)^{1/2} = e^{-πi/4} τ^{1/2}`). -/
example : thetaMultiplier ModularGroup.S = cexp (-π * I / 4) := sorry
/-- Unit test `thetaMultiplier.test_gamma_two`: for `γ = (3 2; 4 3) ∈ Γ(2)`, `v_θ(γ) = i`
(`(8/3) ε₃⁻¹ = (-1)(-i)`). -/
example : thetaMultiplier ⟨!![3, 2; 4, 3], by decide⟩ = I := sorry
/-- Unit test `thetaMultiplier.test_not_eta`: `v_θ(T²) = 1 ≠ e^{πi/6} = v_η(T²)`, so `v_θ` is not
the restriction of `v_η` to `Γ_θ`. -/
example : thetaMultiplier (ModularGroup.T ^ 2) = 1 ∧
    etaMultiplier (ModularGroup.T ^ 2) = cexp (π * I / 6) := sorry

/-- `ϑ` on `Γ(2)`, from Shimura's theta law on `Γ₀(4)` (`MetaplecticAutomorphicForms:MP.7`) by
`ϑ(τ) = θ(τ/2)`: `ϑ(γτ) = (2c/d) ε_d⁻¹ (cτ + d)^{1/2} ϑ(τ)`. -/
theorem jacobiTheta_transform_Gamma_two (γ : SL(2, ℤ)) (hγ : γ ∈ CongruenceSubgroup.Gamma 2)
    (τ : ℍ) :
    jacobiTheta (γ • τ : ℍ) =
      ((if γ 1 0 < 0 ∧ γ 1 1 < 0 then -1 else 1) * jacobiSym (2 * γ 1 0) (γ 1 1).natAbs : ℂ) *
        (if γ 1 1 % 4 = 1 then 1 else I)⁻¹ * denom γ τ ^ (1 / 2 : ℂ) * jacobiTheta τ := sorry

/-- **The theta transformation law on the theta group**. -/
theorem jacobiTheta_transform (γ : SL(2, ℤ)) (hγ : γ ∈ thetaGroup) (τ : ℍ) :
    jacobiTheta (γ • τ : ℍ) = thetaMultiplier γ * denom γ τ ^ (1 / 2 : ℂ) * jacobiTheta τ := sorry

/-- `v_θ` is a multiplier system of weight `1/2` on `Γ_θ`. -/
theorem thetaMultiplier_mul {γ₁ γ₂ : SL(2, ℤ)} (h₁ : γ₁ ∈ thetaGroup) (h₂ : γ₂ ∈ thetaGroup)
    (τ : ℍ) :
    thetaMultiplier (γ₁ * γ₂) * denom (γ₁ * γ₂) τ ^ (1 / 2 : ℂ) =
      thetaMultiplier γ₁ * thetaMultiplier γ₂ * denom γ₁ (γ₂ • τ : ℍ) ^ (1 / 2 : ℂ) *
        denom γ₂ τ ^ (1 / 2 : ℂ) := sorry

/-- `ϑ` has no zeros in `ℍ` (Jacobi triple product at `z = 0`). -/
theorem jacobiTheta_ne_zero (τ : ℍ) : jacobiTheta τ ≠ 0 := sorry

/-- The cusp `1`: `(τ)^{-1/2} ϑ(1 - 1/τ) = e^{-πi/4} e^{πiτ/4} jacobiTheta₂(τ/2, τ)`. -/
theorem jacobiTheta_TS_slash (τ : ℍ) :
    denom (ModularGroup.T * ModularGroup.S) τ ^ (-(1 / 2 : ℂ)) *
        jacobiTheta ((ModularGroup.T * ModularGroup.S) • τ : ℍ) =
      cexp (-π * I / 4) * cexp (π * I * τ / 4) * jacobiTheta₂ ((τ : ℂ) / 2) τ := sorry

/-- `jacobiTheta₂(τ/2, τ) → 2` as `Im τ → ∞` (the terms `n = 0, -1`). -/
theorem tendsto_jacobiTheta₂_half_atImInfty :
    Tendsto (fun τ : ℍ ↦ jacobiTheta₂ ((τ : ℂ) / 2) τ) atImInfty (𝓝 2) := sorry

/-- **Theta at every cusp**: for `σ` with first column `(a, c)`, `(cτ + d)^{-1/2} ϑ(στ)` tends to a
nonzero constant if `a + c` is odd (cusps `Γ_θ ∞`, order `0`), and `e^{-πiτ/4}` times it tends to
a nonzero constant if `a, c` are both odd (cusps `Γ_θ 1`, order `1/8`). -/
theorem jacobiTheta_slash_tendsto (σ : SL(2, ℤ)) :
    (Odd (σ 0 0 + σ 1 0) → ∃ C : ℂ, C ≠ 0 ∧
      Tendsto (fun τ : ℍ ↦ denom σ τ ^ (-(1 / 2 : ℂ)) * jacobiTheta (σ • τ : ℍ)) atImInfty (𝓝 C)) ∧
    (Odd (σ 0 0) ∧ Odd (σ 1 0) → ∃ C : ℂ, C ≠ 0 ∧
      Tendsto (fun τ : ℍ ↦ cexp (-π * I * τ / 4) * denom σ τ ^ (-(1 / 2 : ℂ)) *
        jacobiTheta (σ • τ : ℍ)) atImInfty (𝓝 C)) := sorry

/-! ## Fourier expansion of periodic holomorphic functions -/

/-- A holomorphic `1`-periodic function on `{Im z > y₀}` is the sum of its Fourier series
`∑ aₙ e^{2πinz}`, with `aₙ = ∫₀¹ f(x + iy) e^{-2πin(x + iy)} dx` for any `y > y₀`. -/
theorem hasSum_fourier_of_periodic {f : ℂ → ℂ} {y₀ : ℝ}
    (hf : DifferentiableOn ℂ f {z | y₀ < z.im}) (hper : ∀ z, f (z + 1) = f z) {y : ℝ} (hy : y₀ < y)
    {z : ℂ} (hz : y₀ < z.im) :
    HasSum (fun n : ℤ ↦ (∫ x in (0 : ℝ)..1, f (x + y * I) * cexp (-2 * π * I * n * (x + y * I))) *
      cexp (2 * π * I * n * z)) (f z) := sorry

/-! ## The Jacobi theta function `ϑ(z; τ)` (Zwegers, Proposition 1.3) -/

/-- The **analytic Jacobi triple product** (Kong–Teo, Theorem 3.1 and Corollary 3.2). -/
theorem jacobiTheta₂_eq_tprod (z : ℂ) (τ : ℍ) :
    jacobiTheta₂ z τ = ∏' n : ℕ, (1 - cexp (2 * π * I * (n + 1) * τ)) *
      (1 + cexp (π * I * (2 * n + 1) * τ + 2 * π * I * z)) *
      (1 + cexp (π * I * (2 * n + 1) * τ - 2 * π * I * z)) := sorry

/-- Zwegers' odd Jacobi theta function `ϑ(z; τ) = ∑_{ν ∈ 1/2 + ℤ} e^{πiν²τ + 2πiν(z + 1/2)}`. -/
def oddJacobiTheta (z τ : ℂ) : ℂ :=
  ∑' n : ℤ, cexp (π * I * ((n : ℂ) + 1 / 2) ^ 2 * τ + 2 * π * I * ((n : ℂ) + 1 / 2) * (z + 1 / 2))

/-- `ϑ(z; τ) = e^{πiτ/4 + πi(z + 1/2)} jacobiTheta₂(z + 1/2 + τ/2, τ)`. -/
theorem oddJacobiTheta_eq_jacobiTheta₂ (z τ : ℂ) :
    oddJacobiTheta z τ =
      cexp (π * I * τ / 4 + π * I * (z + 1 / 2)) * jacobiTheta₂ (z + 1 / 2 + τ / 2) τ := sorry

/-- Zwegers 1.3(4): `ϑ(-z) = -ϑ(z)`. -/
theorem oddJacobiTheta_neg (z τ : ℂ) : oddJacobiTheta (-z) τ = -oddJacobiTheta z τ := sorry

/-- `ϑ` is holomorphic in `(z, τ)` on `ℂ × ℍ`. -/
theorem differentiableOn_oddJacobiTheta :
    DifferentiableOn ℂ (fun p : ℂ × ℂ ↦ oddJacobiTheta p.1 p.2) {p | 0 < p.2.im} := sorry

/-- Zwegers 1.3(1), (2): `ϑ(z + lτ + μ) = (-1)^{l+μ} e^{-πil²τ - 2πilz} ϑ(z)`. -/
theorem oddJacobiTheta_add_int_mul_add_int (z : ℂ) (τ : ℍ) (l μ : ℤ) :
    oddJacobiTheta (z + l * τ + μ) τ =
      (-1) ^ (l + μ) * cexp (-π * I * l ^ 2 * τ - 2 * π * I * l * z) * oddJacobiTheta z τ := sorry

/-- Zwegers 1.3(6): `ϑ(z; τ + 1) = e^{πi/4} ϑ(z; τ)`. -/
theorem oddJacobiTheta_add_one_right (z τ : ℂ) :
    oddJacobiTheta z (τ + 1) = cexp (π * I / 4) * oddJacobiTheta z τ := sorry

/-- Zwegers 1.3(7): `ϑ(z/τ; -1/τ) = -i (-iτ)^{1/2} e^{πiz²/τ} ϑ(z; τ)`. -/
theorem oddJacobiTheta_S (z : ℂ) (τ : ℍ) :
    oddJacobiTheta (z / τ) (-1 / τ) =
      -I * (-I * τ) ^ (1 / 2 : ℂ) * cexp (π * I * z ^ 2 / τ) * oddJacobiTheta z τ := sorry

/-- Zwegers 1.3(8), the triple product:
`ϑ(z) = -i q^{1/8} ζ^{-1/2} ∏ (1 - qⁿ)(1 - ζ q^{n-1})(1 - ζ⁻¹ qⁿ)`. -/
theorem oddJacobiTheta_eq_tprod (z : ℂ) (τ : ℍ) :
    oddJacobiTheta z τ = -I * cexp (2 * π * I * τ / 8 - π * I * z) *
      ∏' n : ℕ, (1 - cexp (2 * π * I * (n + 1) * τ)) *
        (1 - cexp (2 * π * I * z + 2 * π * I * n * τ)) *
        (1 - cexp (-2 * π * I * z + 2 * π * I * (n + 1) * τ)) := sorry

/-- Zwegers 1.3(5): the zeros of `ϑ(·; τ)` are the lattice points `nτ + m`, all simple. -/
theorem oddJacobiTheta_eq_zero_iff (z : ℂ) (τ : ℍ) :
    oddJacobiTheta z τ = 0 ↔ ∃ n m : ℤ, z = n * τ + m := sorry

/-- Zwegers 1.3(10): `ϑ'(0; τ) = -2π η(τ)³`. -/
theorem deriv_oddJacobiTheta_zero (τ : ℍ) :
    deriv (fun z ↦ oddJacobiTheta z τ) 0 = -2 * π * η τ ^ 3 := sorry

/-- Zwegers 1.3(3): up to a constant, `ϑ(·; τ)` is the only entire function with
`f(z + 1) = -f(z)` and `f(z + τ) = -e^{-πiτ - 2πiz} f(z)`. -/
theorem oddJacobiTheta_unique (τ : ℍ) (f : ℂ → ℂ) (hf : Differentiable ℂ f)
    (h1 : ∀ z, f (z + 1) = -f z) (h2 : ∀ z, f (z + τ) = -cexp (-π * I * τ - 2 * π * I * z) * f z) :
    ∃ C : ℂ, ∀ z, f z = C * oddJacobiTheta z τ := sorry

/-- **Modular transformation of `ϑ(z; τ)`** under all of `SL(2, ℤ)`, with multiplier `v_η³`. -/
theorem oddJacobiTheta_transform (γ : SL(2, ℤ)) (τ : ℍ) (z : ℂ) :
    oddJacobiTheta (z / denom γ τ) (γ • τ : ℍ) =
      etaMultiplier γ ^ 3 * denom γ τ ^ (1 / 2 : ℂ) *
        cexp (π * I * (γ 1 0 : ℂ) * z ^ 2 / denom γ τ) * oddJacobiTheta z τ := sorry

/-- Unit test `oddJacobiTheta.test_zero`: `ϑ(0; τ) = 0`. -/
example (τ : ℍ) : oddJacobiTheta 0 τ = 0 := sorry
/-- Unit test `oddJacobiTheta.test_half`: `ϑ(1/2; τ) = -e^{πiτ/4} jacobiTheta₂(τ/2, τ)`
(minus the theta constant `ϑ₂`). -/
example (τ : ℍ) : oddJacobiTheta (1 / 2) τ = -(cexp (π * I * τ / 4) * jacobiTheta₂ ((τ : ℂ) / 2) τ) :=
  sorry
/-- Unit test `oddJacobiTheta.test_leading_term`: `e^{-πiτ/4} ϑ(z; τ) → -2 sin(πz)` as
`Im τ → ∞`. -/
example (z : ℂ) : Tendsto (fun τ : ℍ ↦ cexp (-π * I * τ / 4) * oddJacobiTheta z τ) atImInfty
    (𝓝 (-2 * Complex.sin (π * z))) := sorry
/-- Unit test `oddJacobiTheta.test_not_even`: `ϑ` is not an even function of `z` (unlike
`jacobiTheta₂`): `ϑ(-1/4; i) ≠ ϑ(1/4; i)`. -/
example : oddJacobiTheta (-1 / 4) UpperHalfPlane.I ≠ oddJacobiTheta (1 / 4) UpperHalfPlane.I := sorry

/-! ## Jacobi forms (Eichler–Zagier; Dabholkar–Murthy–Zagier §4; Zwegers Chapter 3) -/

/-- The modular slash of weight `k` and index `m` (`k, m ∈ ½ℤ`, principal branch):
`(φ|_{k,m} γ)(τ, z) = (cτ + d)^{-k} e(-mcz²/(cτ + d)) φ(γτ, z/(cτ + d))`. -/
def jacobiModularSlash (k m : ℚ) (γ : SL(2, ℤ)) (φ : ℍ → ℂ → ℂ) : ℍ → ℂ → ℂ :=
  fun τ z ↦ denom γ τ ^ (-(k : ℂ)) *
    cexp (-2 * π * I * m * (γ 1 0 : ℂ) * z ^ 2 / denom γ τ) * φ (γ • τ) (z / denom γ τ)

/-- For integral `k`: `(φ|γ₁)|γ₂ = φ|(γ₁γ₂)`. -/
theorem jacobiModularSlash_mul (k : ℤ) (m : ℚ) (γ₁ γ₂ : SL(2, ℤ)) (φ : ℍ → ℂ → ℂ) :
    jacobiModularSlash k m γ₂ (jacobiModularSlash k m γ₁ φ) =
      jacobiModularSlash k m (γ₁ * γ₂) φ := sorry

theorem jacobiModularSlash_one (k m : ℚ) (φ : ℍ → ℂ → ℂ) : jacobiModularSlash k m 1 φ = φ := sorry

/-- `φ|_{k,m}(-1) (τ, z) = (-1)^{-k} φ(τ, -z)` (principal branch). -/
theorem jacobiModularSlash_neg_one (k : ℤ) (m : ℚ) (φ : ℍ → ℂ → ℂ) (τ : ℍ) (z : ℂ) :
    jacobiModularSlash k m (-1) φ τ z = (-1) ^ k * φ τ (-z) := sorry

/-- For index `0` and `φ` independent of `z`, the slash is Mathlib's weight-`k` slash. -/
theorem jacobiModularSlash_index_zero (k : ℤ) (γ : SL(2, ℤ)) (f : ℍ → ℂ) (τ : ℍ) (z : ℂ) :
    jacobiModularSlash k 0 γ (fun τ _ ↦ f τ) τ z = (f ∣[k] γ) τ := sorry

/-- The elliptic slash of index `m` (`2m ∈ ℤ`): `(φ|_m [l, μ])(τ, z) = e(m(l²τ + 2lz)) φ(τ, z + lτ + μ)`. -/
def jacobiEllipticSlash (m : ℚ) (l μ : ℤ) (φ : ℍ → ℂ → ℂ) : ℍ → ℂ → ℂ :=
  fun τ z ↦ cexp (2 * π * I * m * ((l : ℂ) ^ 2 * τ + 2 * l * z)) * φ τ (z + l * τ + μ)

/-- For `2m ∈ ℤ` the elliptic slash is an action of `ℤ²`. -/
theorem jacobiEllipticSlash_add (m : ℚ) (hm : ∃ n : ℤ, 2 * m = n) (l μ l' μ' : ℤ)
    (φ : ℍ → ℂ → ℂ) :
    jacobiEllipticSlash m l' μ' (jacobiEllipticSlash m l μ φ) =
      jacobiEllipticSlash m (l + l') (μ + μ') φ := sorry

theorem jacobiEllipticSlash_zero (m : ℚ) (φ : ℍ → ℂ → ℂ) : jacobiEllipticSlash m 0 0 φ = φ := sorry

/-- The Jacobi-group law (Eichler–Zagier Theorem 1.4): `(φ|_m X)|_{k,m} γ = (φ|_{k,m} γ)|_m (Xγ)`,
`X = (l, μ)` a row vector. -/
theorem jacobiModularSlash_jacobiEllipticSlash (k m : ℚ) (γ : SL(2, ℤ)) (l μ : ℤ)
    (φ : ℍ → ℂ → ℂ) :
    jacobiModularSlash k m γ (jacobiEllipticSlash m l μ φ) =
      jacobiEllipticSlash m (l * γ 0 0 + μ * γ 1 0) (l * γ 0 1 + μ * γ 1 1)
        (jacobiModularSlash k m γ φ) := sorry

/-- Unit test `jacobiModularSlash.test_T`: `φ|_{k,m} T (τ, z) = φ(τ + 1, z)`. -/
example (k m : ℚ) (φ : ℍ → ℂ → ℂ) (τ : ℍ) (z : ℂ) :
    jacobiModularSlash k m ModularGroup.T φ τ z = φ (ModularGroup.T • τ) z := sorry
/-- Unit test `jacobiModularSlash.test_S`: `φ|_{k,m} S (τ, z) = τ^{-k} e(-mz²/τ) φ(-1/τ, z/τ)`. -/
example (k m : ℚ) (φ : ℍ → ℂ → ℂ) (τ : ℍ) (z : ℂ) :
    jacobiModularSlash k m ModularGroup.S φ τ z =
      (τ : ℂ) ^ (-(k : ℂ)) * cexp (-2 * π * I * m * z ^ 2 / τ) * φ (ModularGroup.S • τ) (z / τ) :=
  sorry
/-- Unit test `jacobiModularSlash.test_index_zero`: in index `0` the slash of a `z`-independent
function is Mathlib's `SlashAction` of weight `k`. -/
example (k : ℤ) (γ : SL(2, ℤ)) (f : ℍ → ℂ) (τ : ℍ) (z : ℂ) :
    jacobiModularSlash k 0 γ (fun τ _ ↦ f τ) τ z = (f ∣[k] γ) τ := sorry
/-- Unit test `jacobiEllipticSlash.test_translation`: `φ|_m [0, μ] (τ, z) = φ(τ, z + μ)`. -/
example (m : ℚ) (μ : ℤ) (φ : ℍ → ℂ → ℂ) (τ : ℍ) (z : ℂ) :
    jacobiEllipticSlash m 0 μ φ τ z = φ τ (z + μ) := sorry
/-- Unit test `jacobiEllipticSlash.test_theta_character`: `ϑ|_{1/2}[l, μ] = (-1)^{l+μ} ϑ`. -/
example (l μ : ℤ) (τ : ℍ) (z : ℂ) :
    jacobiEllipticSlash (1 / 2) l μ (fun (τ : ℍ) (z : ℂ) ↦ oddJacobiTheta z τ) τ z =
      (-1) ^ (l + μ) * oddJacobiTheta z τ := sorry
/-- Unit test `jacobiEllipticSlash.test_index_zero`: in index `0` the elliptic slash is plain
translation `φ(τ, z + lτ + μ)`. -/
example (l μ : ℤ) (φ : ℍ → ℂ → ℂ) (τ : ℍ) (z : ℂ) :
    jacobiEllipticSlash 0 l μ φ τ z = φ τ (z + l * τ + μ) := sorry

/-- Holomorphic Jacobi forms of weight `k`, index `m` (`k, m ∈ ½ℤ`), multiplier `v` on
`SL(2, ℤ)` and character `χ` on `ℤ²`: holomorphic on `ℍ × ℂ`, `φ|_{k,m}γ = v(γ)φ`,
`φ|_m[l, μ] = χ(l, μ)φ`, and `e(mα²τ) φ(τ, ατ + β)` is bounded at `i∞` for all `α, β ∈ ℚ`. The
Eichler–Zagier space `J_{k,m}` is `v = 1`, `χ = 1`, `k, m ∈ ℤ`. -/
def JacobiForm (k m : ℚ) (v : SL(2, ℤ) → ℂ) (χ : ℤ × ℤ → ℂ) : Submodule ℂ (ℍ → ℂ → ℂ) where
  carrier := {φ | DifferentiableOn ℂ (fun p : ℂ × ℂ ↦ φ (ofComplex p.1) p.2) {p | 0 < p.1.im} ∧
    (∀ γ, jacobiModularSlash k m γ φ = v γ • φ) ∧
    (∀ l μ : ℤ, jacobiEllipticSlash m l μ φ = χ (l, μ) • φ) ∧
    ∀ α β : ℚ, IsBoundedAtImInfty fun τ : ℍ ↦
      cexp (2 * π * I * m * (α : ℂ) ^ 2 * τ) * φ τ (α * τ + β)}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- Jacobi cusp forms: as `JacobiForm`, with `e(mα²τ) φ(τ, ατ + β) → 0` at `i∞`. -/
def JacobiCuspForm (k m : ℚ) (v : SL(2, ℤ) → ℂ) (χ : ℤ × ℤ → ℂ) : Submodule ℂ (ℍ → ℂ → ℂ) where
  carrier := {φ | DifferentiableOn ℂ (fun p : ℂ × ℂ ↦ φ (ofComplex p.1) p.2) {p | 0 < p.1.im} ∧
    (∀ γ, jacobiModularSlash k m γ φ = v γ • φ) ∧
    (∀ l μ : ℤ, jacobiEllipticSlash m l μ φ = χ (l, μ) • φ) ∧
    ∀ α β : ℚ, IsZeroAtImInfty fun τ : ℍ ↦
      cexp (2 * π * I * m * (α : ℂ) ^ 2 * τ) * φ τ (α * τ + β)}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- Weak Jacobi forms: as `JacobiForm`, with `φ(τ, z)` bounded at `i∞` for each fixed `z`. -/
def WeakJacobiForm (k m : ℚ) (v : SL(2, ℤ) → ℂ) (χ : ℤ × ℤ → ℂ) : Submodule ℂ (ℍ → ℂ → ℂ) where
  carrier := {φ | DifferentiableOn ℂ (fun p : ℂ × ℂ ↦ φ (ofComplex p.1) p.2) {p | 0 < p.1.im} ∧
    (∀ γ, jacobiModularSlash k m γ φ = v γ • φ) ∧
    (∀ l μ : ℤ, jacobiEllipticSlash m l μ φ = χ (l, μ) • φ) ∧
    ∀ z : ℂ, IsBoundedAtImInfty fun τ : ℍ ↦ φ τ z}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- Weakly holomorphic Jacobi forms: as `JacobiForm`, with `e(Nτ) φ(τ, z)` bounded at `i∞` for
some `N ∈ ℕ` and every fixed `z`. -/
def WeaklyHolomorphicJacobiForm (k m : ℚ) (v : SL(2, ℤ) → ℂ) (χ : ℤ × ℤ → ℂ) :
    Submodule ℂ (ℍ → ℂ → ℂ) where
  carrier := {φ | DifferentiableOn ℂ (fun p : ℂ × ℂ ↦ φ (ofComplex p.1) p.2) {p | 0 < p.1.im} ∧
    (∀ γ, jacobiModularSlash k m γ φ = v γ • φ) ∧
    (∀ l μ : ℤ, jacobiEllipticSlash m l μ φ = χ (l, μ) • φ) ∧
    ∃ N : ℕ, ∀ z : ℂ, IsBoundedAtImInfty fun τ : ℍ ↦ cexp (2 * π * I * N * τ) * φ τ z}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

theorem JacobiCuspForm_le_JacobiForm (k m : ℚ) (v : SL(2, ℤ) → ℂ) (χ : ℤ × ℤ → ℂ) :
    JacobiCuspForm k m v χ ≤ JacobiForm k m v χ := sorry

theorem JacobiForm_le_WeakJacobiForm (k m : ℤ) :
    JacobiForm k m (fun _ ↦ 1) (fun _ ↦ 1) ≤ WeakJacobiForm k m (fun _ ↦ 1) (fun _ ↦ 1) := sorry

theorem WeakJacobiForm_le_WeaklyHolomorphicJacobiForm (k m : ℚ) (v : SL(2, ℤ) → ℂ)
    (χ : ℤ × ℤ → ℂ) : WeakJacobiForm k m v χ ≤ WeaklyHolomorphicJacobiForm k m v χ := sorry

/-- A weakly holomorphic Jacobi form times a power of `Δ` is weak. -/
theorem exists_discriminant_pow_mul_mem_WeakJacobiForm (k m : ℤ) {φ : ℍ → ℂ → ℂ}
    (hφ : φ ∈ WeaklyHolomorphicJacobiForm k m (fun _ ↦ 1) (fun _ ↦ 1)) :
    ∃ N : ℕ, (fun τ z ↦ ModularForm.discriminant τ ^ N * φ τ z) ∈
      WeakJacobiForm (k + 12 * N : ℤ) m (fun _ ↦ 1) (fun _ ↦ 1) := sorry

/-- Products: `J_{k,m}(v, χ) · J_{k',m'}(v', χ') ⊆ J_{k+k',m+m'}(vv', χχ')` for integral weights. -/
theorem mul_mem_JacobiForm {k k' : ℤ} {m m' : ℚ} {v v' : SL(2, ℤ) → ℂ} {χ χ' : ℤ × ℤ → ℂ}
    {φ ψ : ℍ → ℂ → ℂ} (hφ : φ ∈ JacobiForm k m v χ) (hψ : ψ ∈ JacobiForm k' m' v' χ') :
    φ * ψ ∈ JacobiForm (k + k' : ℤ) (m + m') (v * v') (χ * χ') := sorry

/-- Modular forms of level one times Jacobi forms. -/
theorem modularForm_smul_mem_JacobiForm {k k' m : ℤ} (f : ModularForm 𝒮ℒ k) {φ : ℍ → ℂ → ℂ}
    (hφ : φ ∈ JacobiForm k' m (fun _ ↦ 1) (fun _ ↦ 1)) :
    (fun (τ : ℍ) (z : ℂ) ↦ f τ * φ τ z) ∈ JacobiForm (k + k' : ℤ) m (fun _ ↦ 1) (fun _ ↦ 1) := sorry

/-- Index `0`: `J_{k,0} ≅ M_k(SL(2, ℤ))` (the forms do not depend on `z`). -/
theorem mem_JacobiForm_index_zero_iff (k : ℤ) (φ : ℍ → ℂ → ℂ) :
    φ ∈ JacobiForm k 0 (fun _ ↦ 1) (fun _ ↦ 1) ↔
      ∃ f : ModularForm 𝒮ℒ k, ∀ τ z, φ τ z = f τ := sorry

/-- Unit test `JacobiForm.test_odd_weight_index_one`: `J_{k,1} = 0` for odd `k`. -/
example (k : ℤ) (hk : Odd k) : JacobiForm k 1 (fun _ ↦ 1) (fun _ ↦ 1) = ⊥ := sorry
/-- Unit test `JacobiForm.test_index_zero`: the constant `1` is in `J_{0,0}`. -/
example : (fun (_ : ℍ) (_ : ℂ) ↦ (1 : ℂ)) ∈ JacobiForm 0 0 (fun _ ↦ 1) (fun _ ↦ 1) := sorry
/-- Unit test `JacobiForm.test_phi_not_holomorphic`: `φ_{-2,1} ∉ J_{-2,1}` (its coefficient
`c(0, ±1) = 1` has discriminant `-1 < 0`). -/
example : (fun (τ : ℍ) (z : ℂ) ↦ -(oddJacobiTheta z τ) ^ 2 / η τ ^ 6) ∉
    JacobiForm (-2) 1 (fun _ ↦ 1) (fun _ ↦ 1) := sorry
/-- Unit test `JacobiCuspForm.test_theta_not_cusp`: `ϑ ∈ J_{1/2,1/2}(v_η³, (-1)^{l+μ})` is not a
cusp form (its terms have discriminant `0`). -/
example : (fun (τ : ℍ) (z : ℂ) ↦ oddJacobiTheta z τ) ∉
    JacobiCuspForm (1 / 2) (1 / 2) (fun γ ↦ etaMultiplier γ ^ 3) (fun p ↦ (-1) ^ (p.1 + p.2)) :=
  sorry
/-- Unit test `JacobiCuspForm.test_zero`: `0 ∈ J⁰_{k,m}`. -/
example (k m : ℚ) : (0 : ℍ → ℂ → ℂ) ∈ JacobiCuspForm k m (fun _ ↦ 1) (fun _ ↦ 1) := sorry
/-- Unit test `JacobiCuspForm.test_constant`: the constant `1 ∈ J_{0,0}` is not a cusp form. -/
example : (fun (_ : ℍ) (_ : ℂ) ↦ (1 : ℂ)) ∉ JacobiCuspForm 0 0 (fun _ ↦ 1) (fun _ ↦ 1) := sorry
/-- Unit test `WeakJacobiForm.test_phi`: `φ_{-2,1} = -ϑ²/η⁶` is a weak Jacobi form of weight `-2`
and index `1`. -/
example : (fun (τ : ℍ) (z : ℂ) ↦ -(oddJacobiTheta z τ) ^ 2 / η τ ^ 6) ∈
    WeakJacobiForm (-2) 1 (fun _ ↦ 1) (fun _ ↦ 1) := sorry
/-- Unit test `JacobiForm.test_negative_weight`: `J_{-2,1} = 0` although `J̃_{-2,1} ≠ 0`. -/
example : JacobiForm (-2) 1 (fun _ ↦ 1) (fun _ ↦ 1) = ⊥ := sorry
/-- Unit test `WeakJacobiForm.test_not_weak`: `φ_{-2,1}/Δ` is weakly holomorphic but not weak. -/
example : (fun (τ : ℍ) (z : ℂ) ↦ -(oddJacobiTheta z τ) ^ 2 / η τ ^ 6 / ModularForm.discriminant τ) ∉
    WeakJacobiForm (-14) 1 (fun _ ↦ 1) (fun _ ↦ 1) := sorry
/-- Unit test `WeaklyHolomorphicJacobiForm.test_phi_div_delta`: `φ_{-2,1}/Δ ∈ J^!_{-14,1}`. -/
example : (fun (τ : ℍ) (z : ℂ) ↦ -(oddJacobiTheta z τ) ^ 2 / η τ ^ 6 / ModularForm.discriminant τ) ∈
    WeaklyHolomorphicJacobiForm (-14) 1 (fun _ ↦ 1) (fun _ ↦ 1) := sorry
/-- Unit test `WeaklyHolomorphicJacobiForm.test_inv_delta`: in index `0`, `1/Δ ∈ J^!_{-12,0}`. -/
example : (fun (τ : ℍ) (_ : ℂ) ↦ (ModularForm.discriminant τ)⁻¹) ∈
    WeaklyHolomorphicJacobiForm (-12) 0 (fun _ ↦ 1) (fun _ ↦ 1) := sorry
/-- Unit test `WeaklyHolomorphicJacobiForm.test_not_mem`: `exp(E₄³/Δ) = exp(j)` (independent of
`z`, invariant of weight `0`, holomorphic on `ℍ`) is not weakly holomorphic: it has an essential
singularity at `i∞`. -/
example : (fun (τ : ℍ) (_ : ℂ) ↦ cexp (ModularForm.E₄ τ ^ 3 / ModularForm.discriminant τ)) ∉
    WeaklyHolomorphicJacobiForm 0 0 (fun _ ↦ 1) (fun _ ↦ 1) := sorry
/-- Unit test `WeakJacobiForm.test_index_zero`: in index `0`, `E₄` (independent of `z`) is a weak
(indeed holomorphic) Jacobi form of weight `4`. -/
example : (fun (τ : ℍ) (_ : ℂ) ↦ ModularForm.E₄ τ) ∈ WeakJacobiForm 4 0 (fun _ ↦ 1) (fun _ ↦ 1) :=
  sorry

/-- The Fourier coefficient `c(n, r) = ∫₀¹∫₀¹ φ(x + i, u) e(-n(x + i) - ru) du dx` of a function
`1`-periodic in `τ` and in `z`. -/
def jacobiFourierCoeff (φ : ℍ → ℂ → ℂ) (n r : ℤ) : ℂ :=
  ∫ x in (0 : ℝ)..1, ∫ u in (0 : ℝ)..1,
    φ (ofComplex ((x : ℂ) + I)) u * cexp (-2 * π * I * (n * ((x : ℂ) + I) + r * u))

/-- The Fourier expansion `φ = ∑ c(n, r) qⁿ ζ^r` (absolutely convergent). -/
theorem hasSum_jacobiFourierCoeff (φ : ℍ → ℂ → ℂ)
    (hφ : DifferentiableOn ℂ (fun p : ℂ × ℂ ↦ φ (ofComplex p.1) p.2) {p | 0 < p.1.im})
    (hT : ∀ τ z, φ (ModularGroup.T • τ) z = φ τ z) (hz : ∀ τ z, φ τ (z + 1) = φ τ z) (τ : ℍ)
    (z : ℂ) :
    HasSum (fun p : ℤ × ℤ ↦ jacobiFourierCoeff φ p.1 p.2 * cexp (2 * π * I * (p.1 * τ + p.2 * z)))
      (φ τ z) := sorry

/-- Fourier coefficients determine the function. -/
theorem eq_of_jacobiFourierCoeff_eq {φ ψ : ℍ → ℂ → ℂ}
    (hφ : DifferentiableOn ℂ (fun p : ℂ × ℂ ↦ φ (ofComplex p.1) p.2) {p | 0 < p.1.im})
    (hψ : DifferentiableOn ℂ (fun p : ℂ × ℂ ↦ ψ (ofComplex p.1) p.2) {p | 0 < p.1.im})
    (hTφ : ∀ τ z, φ (ModularGroup.T • τ) z = φ τ z) (hzφ : ∀ τ z, φ τ (z + 1) = φ τ z)
    (hTψ : ∀ τ z, ψ (ModularGroup.T • τ) z = ψ τ z) (hzψ : ∀ τ z, ψ τ (z + 1) = ψ τ z)
    (h : ∀ n r, jacobiFourierCoeff φ n r = jacobiFourierCoeff ψ n r) : φ = ψ := sorry

/-- DMZ (4.4): for index `m ≥ 1`, `c(n, r)` depends only on `4nm - r²` and `r mod 2m`. -/
theorem jacobiFourierCoeff_eq_of_discriminant (k m : ℤ) (hm : 0 < m) {φ : ℍ → ℂ → ℂ}
    (hφ : φ ∈ WeaklyHolomorphicJacobiForm k m (fun _ ↦ 1) (fun _ ↦ 1)) {n r n' r' : ℤ}
    (hD : 4 * n * m - r ^ 2 = 4 * n' * m - r' ^ 2) (hr : r ≡ r' [ZMOD 2 * m]) :
    jacobiFourierCoeff φ n r = jacobiFourierCoeff φ n' r' := sorry

/-- `c(n, -r) = (-1)^k c(n, r)`. -/
theorem jacobiFourierCoeff_neg (k m : ℤ) {φ : ℍ → ℂ → ℂ}
    (hφ : φ ∈ WeaklyHolomorphicJacobiForm k m (fun _ ↦ 1) (fun _ ↦ 1)) (n r : ℤ) :
    jacobiFourierCoeff φ n (-r) = (-1) ^ k * jacobiFourierCoeff φ n r := sorry

/-- Unit test `jacobiFourierCoeff.test_phi`: `φ_{-2,1} = (ζ - 2 + ζ⁻¹) + (-2ζ² + 8ζ - 12 + 8ζ⁻¹ -
2ζ⁻²) q + O(q²)`: `c(0, ±1) = 1`, `c(0, 0) = -2`, `c(1, 0) = -12`, `c(1, 1) = 8`, `c(1, 2) = -2`. -/
example : let φ : ℍ → ℂ → ℂ := fun τ z ↦ -(oddJacobiTheta z τ) ^ 2 / η τ ^ 6
    jacobiFourierCoeff φ 0 1 = 1 ∧ jacobiFourierCoeff φ 0 0 = -2 ∧ jacobiFourierCoeff φ 1 0 = -12 ∧
      jacobiFourierCoeff φ 1 1 = 8 ∧ jacobiFourierCoeff φ 1 2 = -2 := sorry
/-- Unit test `jacobiFourierCoeff.test_constant`: the constant `1` has `c(0, 0) = 1` and all other
coefficients `0`. -/
example (n r : ℤ) : jacobiFourierCoeff (fun _ _ ↦ 1) n r = if n = 0 ∧ r = 0 then 1 else 0 := sorry
/-- Unit test `jacobiFourierCoeff.test_monomial`: `qⁿζ^r` has `c(n, r) = 1`. -/
example (n r : ℤ) :
    jacobiFourierCoeff (fun (τ : ℍ) (z : ℂ) ↦ cexp (2 * π * I * (n * τ + r * z))) n r = 1 := sorry

/-- **Fourier characterisation** (DMZ (4.5)–(4.7)): for `φ` holomorphic with the `J_{k,m}`
transformation laws (`m ≥ 1`), `φ ∈ J_{k,m}` iff `c(n, r) = 0` whenever `4nm < r²`. -/
theorem mem_JacobiForm_iff_fourierCoeff (k m : ℤ) (hm : 0 < m) {φ : ℍ → ℂ → ℂ}
    (hφ : φ ∈ WeaklyHolomorphicJacobiForm k m (fun _ ↦ 1) (fun _ ↦ 1)) :
    φ ∈ JacobiForm k m (fun _ ↦ 1) (fun _ ↦ 1) ↔
      ∀ n r : ℤ, 4 * n * m < r ^ 2 → jacobiFourierCoeff φ n r = 0 := sorry

/-- Cusp forms: `c(n, r) = 0` whenever `4nm ≤ r²`. -/
theorem mem_JacobiCuspForm_iff_fourierCoeff (k m : ℤ) (hm : 0 < m) {φ : ℍ → ℂ → ℂ}
    (hφ : φ ∈ WeaklyHolomorphicJacobiForm k m (fun _ ↦ 1) (fun _ ↦ 1)) :
    φ ∈ JacobiCuspForm k m (fun _ ↦ 1) (fun _ ↦ 1) ↔
      ∀ n r : ℤ, 4 * n * m ≤ r ^ 2 → jacobiFourierCoeff φ n r = 0 := sorry

/-- Weak forms: `c(n, r) = 0` whenever `n < 0`. -/
theorem mem_WeakJacobiForm_iff_fourierCoeff (k m : ℤ) {φ : ℍ → ℂ → ℂ}
    (hφ : φ ∈ WeaklyHolomorphicJacobiForm k m (fun _ ↦ 1) (fun _ ↦ 1)) :
    φ ∈ WeakJacobiForm k m (fun _ ↦ 1) (fun _ ↦ 1) ↔
      ∀ n r : ℤ, n < 0 → jacobiFourierCoeff φ n r = 0 := sorry

/-- The restriction `τ ↦ φ(τ, 0)` of `φ ∈ J_{k,m}` is a modular form of weight `k` for
`SL(2, ℤ)` (Mathlib's `ModularForm`). -/
theorem exists_modularForm_eq_jacobiForm_zero (k m : ℤ) {φ : ℍ → ℂ → ℂ}
    (hφ : φ ∈ JacobiForm k m (fun _ ↦ 1) (fun _ ↦ 1)) :
    ∃ f : ModularForm 𝒮ℒ k, ∀ τ, f τ = φ τ 0 := sorry

/-! ## Theta decomposition (Zwegers Theorem 3.1; DMZ §4.2) -/

/-- The index-`m` theta function `ϑ_{m,μ}(τ, z) = ∑_{r ≡ μ (2m)} q^{r²/4m} ζ^r`. -/
def jacobiThetaIndex (m : ℕ) (μ : ℤ) (τ : ℍ) (z : ℂ) : ℂ :=
  ∑' n : ℤ, cexp (2 * π * I * (((2 * m * n + μ : ℤ) : ℂ) ^ 2 * τ / (4 * m) +
    ((2 * m * n + μ : ℤ) : ℂ) * z))

/-- `ϑ_{m,μ}(τ, z) = e(μ²τ/4m + μz) jacobiTheta₂(2mz + μτ, 2mτ)`. -/
theorem jacobiThetaIndex_eq_jacobiTheta₂ (m : ℕ) (hm : 0 < m) (μ : ℤ) (τ : ℍ) (z : ℂ) :
    jacobiThetaIndex m μ τ z = cexp (2 * π * I * ((μ : ℂ) ^ 2 * τ / (4 * m) + μ * z)) *
      jacobiTheta₂ (2 * m * z + μ * τ) (2 * m * τ) := sorry

/-- `ϑ_{m,μ}` depends only on `μ mod 2m`. -/
theorem jacobiThetaIndex_add (m : ℕ) (μ : ℤ) (τ : ℍ) (z : ℂ) :
    jacobiThetaIndex m (μ + 2 * m) τ z = jacobiThetaIndex m μ τ z := sorry

/-- `ϑ_{m,μ}(τ + 1, z) = e(μ²/4m) ϑ_{m,μ}(τ, z)`. -/
theorem jacobiThetaIndex_T (m : ℕ) (hm : 0 < m) (μ : ℤ) (τ : ℍ) (z : ℂ) :
    jacobiThetaIndex m μ (ModularGroup.T • τ) z =
      cexp (2 * π * I * (μ : ℂ) ^ 2 / (4 * m)) * jacobiThetaIndex m μ τ z := sorry

/-- The elliptic law of index `m`: `ϑ_{m,μ}|_m[l, μ'] = ϑ_{m,μ}`. -/
theorem jacobiEllipticSlash_jacobiThetaIndex (m : ℕ) (μ l μ' : ℤ) :
    jacobiEllipticSlash m l μ' (jacobiThetaIndex m μ) = jacobiThetaIndex m μ := sorry

/-- **The `S`-law of `ϑ_{m,μ}`** (Poisson summation):
`ϑ_{m,μ}(-1/τ, z/τ) = (τ/2mi)^{1/2} e(mz²/τ) ∑_{ν mod 2m} e(-μν/2m) ϑ_{m,ν}(τ, z)`. -/
theorem jacobiThetaIndex_S (m : ℕ) (hm : 0 < m) (μ : ℤ) (τ : ℍ) (z : ℂ) :
    jacobiThetaIndex m μ (ModularGroup.S • τ) (z / τ) =
      ((τ : ℂ) / (2 * m * I)) ^ (1 / 2 : ℂ) * cexp (2 * π * I * m * z ^ 2 / τ) *
        ∑ ν ∈ Finset.range (2 * m), cexp (-2 * π * I * μ * ν / (2 * m)) *
          jacobiThetaIndex m ν τ z := sorry

/-- The `ϑ_{m,μ}(τ, ·)`, `0 ≤ μ < 2m`, are linearly independent over functions of `τ`. -/
theorem jacobiThetaIndex_linearIndependent (m : ℕ) (hm : 0 < m) (τ : ℍ) (h : ℤ → ℂ)
    (hsum : ∀ z, ∑ μ ∈ Finset.range (2 * m), h μ * jacobiThetaIndex m μ τ z = 0) :
    ∀ μ < 2 * m, h μ = 0 := sorry

/-- Unit test `jacobiThetaIndex.test_theta`: `ϑ_{1,0}(τ, 0) = ∑ q^{n²} = jacobiTheta(2τ)`. -/
example (τ : ℍ) : jacobiThetaIndex 1 0 τ 0 = jacobiTheta (2 * (τ : ℂ)) := sorry
/-- Unit test `jacobiThetaIndex.test_leading`: `e(-τ/4) ϑ_{1,1}(τ, z) → ζ + ζ⁻¹` at `i∞`. -/
example (z : ℂ) : Tendsto (fun τ : ℍ ↦ cexp (-2 * π * I * τ / 4) * jacobiThetaIndex 1 1 τ z)
    atImInfty (𝓝 (cexp (2 * π * I * z) + cexp (-2 * π * I * z))) := sorry
/-- Unit test `jacobiThetaIndex.test_not_S_invariant`: `ϑ_{1,0}` alone is not an `S`-eigenfunction:
the `S`-law mixes in `ϑ_{1,1}` (coefficient `e(-0·1/2) = 1 ≠ 0`). -/
example : ∃ τ : ℍ, ∃ z : ℂ, jacobiThetaIndex 1 0 (ModularGroup.S • τ) (z / τ) ≠
    ((τ : ℂ) / (2 * I)) ^ (1 / 2 : ℂ) * cexp (2 * π * I * z ^ 2 / τ) * jacobiThetaIndex 1 0 τ z :=
  sorry

/-- The theta-decomposition coefficient `h_μ(τ) = e(-μ²τ/4m) ∫₀¹ φ(τ, u) e(-μu) du`
(Zwegers Theorem 3.1). -/
def thetaDecompositionCoeff (m : ℕ) (φ : ℍ → ℂ → ℂ) (μ : ℤ) (τ : ℍ) : ℂ :=
  cexp (-2 * π * I * (μ : ℂ) ^ 2 * τ / (4 * m)) *
    ∫ u in (0 : ℝ)..1, φ τ u * cexp (-2 * π * I * μ * u)

/-- `h_{μ+2m} = h_μ` under the elliptic law. -/
theorem thetaDecompositionCoeff_add (m : ℕ) (hm : 0 < m) {φ : ℍ → ℂ → ℂ}
    (hE : ∀ l μ : ℤ, jacobiEllipticSlash m l μ φ = φ) (μ : ℤ) :
    thetaDecompositionCoeff m φ (μ + 2 * m) = thetaDecompositionCoeff m φ μ := sorry

/-- `h_μ` is holomorphic on `ℍ`. -/
theorem differentiableOn_thetaDecompositionCoeff (m : ℕ) {φ : ℍ → ℂ → ℂ}
    (hφ : DifferentiableOn ℂ (fun p : ℂ × ℂ ↦ φ (ofComplex p.1) p.2) {p | 0 < p.1.im}) (μ : ℤ) :
    DifferentiableOn ℂ (fun τ : ℂ ↦ thetaDecompositionCoeff m φ μ (ofComplex τ))
      {τ | 0 < τ.im} := sorry

/-- `h_μ(τ) = ∑_N C(N, μ) q^{N/4m}` with the coefficients of DMZ (4.9). -/
theorem thetaDecompositionCoeff_eq_tsum (k m : ℤ) (hm : 0 < m) {φ : ℍ → ℂ → ℂ}
    (hφ : φ ∈ WeaklyHolomorphicJacobiForm k m (fun _ ↦ 1) (fun _ ↦ 1)) (μ : ℤ) (τ : ℍ) :
    thetaDecompositionCoeff m.toNat φ μ τ =
      ∑' n : ℤ, jacobiFourierCoeff φ n μ * cexp (2 * π * I * ((4 * n * m - μ ^ 2 : ℤ) : ℂ) * τ /
        (4 * m)) := sorry

/-- Unit test `thetaDecompositionCoeff.test_theta`: for `φ = ϑ_{m,ν}`, `h_μ = 1` if
`μ ≡ ν (2m)` and `0` otherwise. -/
example (m : ℕ) (hm : 0 < m) (μ ν : ℤ) (τ : ℍ) :
    thetaDecompositionCoeff m (jacobiThetaIndex m ν) μ τ = if μ ≡ ν [ZMOD 2 * m] then 1 else 0 :=
  sorry
/-- Unit test `thetaDecompositionCoeff.test_phi`: for `φ_{-2,1}`, `e(τ/4) h_1(τ) → 1` and
`h_0(τ) → -2` at `i∞`. -/
example : Tendsto (fun τ : ℍ ↦ cexp (2 * π * I * τ / 4) *
      thetaDecompositionCoeff 1 (fun (τ : ℍ) (z : ℂ) ↦ -(oddJacobiTheta z τ) ^ 2 / η τ ^ 6) 1 τ) atImInfty
      (𝓝 1) ∧
    Tendsto (fun τ : ℍ ↦
      thetaDecompositionCoeff 1 (fun (τ : ℍ) (z : ℂ) ↦ -(oddJacobiTheta z τ) ^ 2 / η τ ^ 6) 0 τ) atImInfty
      (𝓝 (-2)) := sorry
/-- Unit test `thetaDecompositionCoeff.test_index_normalisation`: the prefactor is
`e(-μ²τ/4m)`, not `e(-μ²τ/m)`: for `φ = ϑ_{2,1}`, `h_1 = 1`. -/
example (τ : ℍ) : thetaDecompositionCoeff 2 (jacobiThetaIndex 2 1) 1 τ = 1 := sorry

/-- **Theta decomposition** (Zwegers Theorem 3.1): a function holomorphic in `z` with the index-`m`
elliptic law is `∑_{μ mod 2m} h_μ(τ) ϑ_{m,μ}(τ, z)`. -/
theorem eq_sum_thetaDecompositionCoeff_mul (m : ℕ) (hm : 0 < m) (φ : ℍ → ℂ → ℂ)
    (hφ : ∀ τ, Differentiable ℂ (φ τ)) (hE : ∀ l μ : ℤ, jacobiEllipticSlash m l μ φ = φ)
    (τ : ℍ) (z : ℂ) :
    φ τ z = ∑ μ ∈ Finset.range (2 * m),
      thetaDecompositionCoeff m φ μ τ * jacobiThetaIndex m μ τ z := sorry

/-- **Modularity of the theta coefficients** (Zwegers (3.3), (3.4)): under the weight-`k`
modular law, `h_μ(τ + 1) = e(-μ²/4m) h_μ(τ)` and
`h_μ(-1/τ) = τ^k (-iτ)^{-1/2} (2m)^{-1/2} ∑_ν e(μν/2m) h_ν(τ)`. -/
theorem thetaDecompositionCoeff_transform (k : ℤ) (m : ℕ) (hm : 0 < m) {φ : ℍ → ℂ → ℂ}
    (hφ : ∀ τ, Differentiable ℂ (φ τ)) (hE : ∀ l μ : ℤ, jacobiEllipticSlash m l μ φ = φ)
    (hM : ∀ γ, jacobiModularSlash k m γ φ = φ) (μ : ℤ) (τ : ℍ) :
    thetaDecompositionCoeff m φ μ (ModularGroup.T • τ) =
        cexp (-2 * π * I * (μ : ℂ) ^ 2 / (4 * m)) * thetaDecompositionCoeff m φ μ τ ∧
      thetaDecompositionCoeff m φ μ (ModularGroup.S • τ) =
        (τ : ℂ) ^ k / ((-I * τ) ^ (1 / 2 : ℂ) * ((2 * m : ℕ) : ℂ) ^ (1 / 2 : ℂ)) *
          ∑ ν ∈ Finset.range (2 * m), cexp (2 * π * I * μ * ν / (2 * m)) *
            thetaDecompositionCoeff m φ ν τ := sorry

/-- **Growth of the theta coefficients** (DMZ §4.2): `φ ∈ J_{k,m}` iff every `h_μ` is bounded at
`i∞`; `φ ∈ J⁰_{k,m}` iff every `h_μ → 0`. -/
theorem mem_JacobiForm_iff_thetaDecompositionCoeff (k : ℤ) (m : ℕ) (hm : 0 < m)
    {φ : ℍ → ℂ → ℂ} (hφ : φ ∈ WeaklyHolomorphicJacobiForm k m (fun _ ↦ 1) (fun _ ↦ 1)) :
    (φ ∈ JacobiForm k m (fun _ ↦ 1) (fun _ ↦ 1) ↔
      ∀ μ, IsBoundedAtImInfty (thetaDecompositionCoeff m φ μ)) ∧
    (φ ∈ JacobiCuspForm k m (fun _ ↦ 1) (fun _ ↦ 1) ↔
      ∀ μ, IsZeroAtImInfty (thetaDecompositionCoeff m φ μ)) := sorry

/-- **Converse of theta decomposition**: holomorphic `h_μ` (`μ mod 2m`) with the `T`- and `S`-laws
of weight `k - 1/2` give `∑ h_μ ϑ_{m,μ}` satisfying the weight-`k`, index-`m` modular law. -/
theorem jacobiModularSlash_sum_thetaIndex (k : ℤ) (m : ℕ) (hm : 0 < m) (h : ℤ → ℍ → ℂ)
    (hper : ∀ μ, h (μ + 2 * m) = h μ)
    (hT : ∀ μ τ, h μ (ModularGroup.T • τ) = cexp (-2 * π * I * (μ : ℂ) ^ 2 / (4 * m)) * h μ τ)
    (hS : ∀ μ τ, h μ (ModularGroup.S • τ) =
      (τ : ℂ) ^ k / ((-I * τ) ^ (1 / 2 : ℂ) * ((2 * m : ℕ) : ℂ) ^ (1 / 2 : ℂ)) *
        ∑ ν ∈ Finset.range (2 * m), cexp (2 * π * I * μ * ν / (2 * m)) * h ν τ) (γ : SL(2, ℤ)) :
    jacobiModularSlash k m γ
        (fun (τ : ℍ) (z : ℂ) ↦ ∑ μ ∈ Finset.range (2 * m), h μ τ * jacobiThetaIndex m μ τ z) =
      fun τ z ↦ ∑ μ ∈ Finset.range (2 * m), h μ τ * jacobiThetaIndex m μ τ z := sorry

-- The comparison of `(h_μ)` with vector-valued modular forms of weight `k - 1/2` for the Weil
-- representation `ρ_{L(-1)}` of `Mp₂(ℤ)` (`L = ℤ`, `q(x) = mx²`) is stated in the roadmap document
-- (node `QM.1/theta-decomposition-weil-representation`) but not here: `Mp₂(ℤ)` and `ρ_L` are
-- requested from `MetaplecticAutomorphicForms:MP.7` and have no Mathlib counterpart to state it
-- against.

/-! ## Examples: `ϑ` and `φ_{-2,1}` -/

/-- **`ϑ` is a Jacobi form** of weight `1/2`, index `1/2`, multiplier `v_η³` and character
`(-1)^{l+μ}`. -/
theorem oddJacobiTheta_mem_JacobiForm :
    (fun (τ : ℍ) (z : ℂ) ↦ oddJacobiTheta z τ) ∈
      JacobiForm (1 / 2) (1 / 2) (fun γ ↦ etaMultiplier γ ^ 3) (fun p ↦ (-1) ^ (p.1 + p.2)) := sorry

/-- The weak Jacobi form `φ_{-2,1} = -ϑ(z; τ)²/η(τ)⁶` (DMZ (4.29), with `ϑ₁ = -iϑ`). -/
def phiMinusTwoOne (τ : ℍ) (z : ℂ) : ℂ := -(oddJacobiTheta z τ) ^ 2 / η τ ^ 6

/-- `φ_{-2,1}` is even in `z`. -/
theorem phiMinusTwoOne_neg (τ : ℍ) (z : ℂ) : phiMinusTwoOne τ (-z) = phiMinusTwoOne τ z := sorry

/-- The zeros of `φ_{-2,1}(τ, ·)` are the lattice points, all double. -/
theorem phiMinusTwoOne_eq_zero_iff (τ : ℍ) (z : ℂ) :
    phiMinusTwoOne τ z = 0 ↔ ∃ n m : ℤ, z = n * τ + m := sorry

/-- `φ_{-2,1}(τ, 0) = 0` and its Taylor coefficient at `z = 0` is `(2πiz)²`:
`∂_z² φ_{-2,1}(τ, 0) = -8π²`. -/
theorem iteratedDeriv_two_phiMinusTwoOne_zero (τ : ℍ) :
    iteratedDeriv 2 (phiMinusTwoOne τ) 0 = -8 * π ^ 2 := sorry

/-- **`φ_{-2,1}` is a weak Jacobi form of weight `-2` and index `1`**, and not a holomorphic one. -/
theorem phiMinusTwoOne_mem_WeakJacobiForm :
    phiMinusTwoOne ∈ WeakJacobiForm (-2) 1 (fun _ ↦ 1) (fun _ ↦ 1) ∧
      phiMinusTwoOne ∉ JacobiForm (-2) 1 (fun _ ↦ 1) (fun _ ↦ 1) := sorry

/-- Unit test `phiMinusTwoOne.test_coefficients`: `c(0, 1) = 1`, `c(0, 0) = -2`, `c(1, 0) = -12`,
`c(1, 1) = 8`, `c(2, 0) = -56` (DMZ Table 1: `C(-1) = 1`, `C(0) = -2`, `C(4) = -12`, `C(3) = 8`,
`C(8) = -56`). -/
example : jacobiFourierCoeff phiMinusTwoOne 0 1 = 1 ∧ jacobiFourierCoeff phiMinusTwoOne 0 0 = -2 ∧
    jacobiFourierCoeff phiMinusTwoOne 1 0 = -12 ∧ jacobiFourierCoeff phiMinusTwoOne 1 1 = 8 ∧
    jacobiFourierCoeff phiMinusTwoOne 2 0 = -56 := sorry
/-- Unit test `phiMinusTwoOne.test_leading`: `φ_{-2,1}(τ, z) → ζ - 2 + ζ⁻¹` at `i∞`. -/
example (z : ℂ) : Tendsto (fun τ : ℍ ↦ phiMinusTwoOne τ z) atImInfty
    (𝓝 (cexp (2 * π * I * z) - 2 + cexp (-2 * π * I * z))) := sorry
/-- Unit test `phiMinusTwoOne.test_sign`: the sign is fixed by `c(0, 1) = +1`; `+ϑ²/η⁶` has
`c(0, 1) = -1`. -/
example : jacobiFourierCoeff (fun (τ : ℍ) (z : ℂ) ↦ (oddJacobiTheta z τ) ^ 2 / η τ ^ 6) 0 1 = -1 := sorry
/-- Unit test `phiMinusTwoOne.test_restriction`: `φ_{-2,1}(τ, 0) = 0`, consistent with
`M_{-2}(SL(2, ℤ)) = 0`. -/
example (τ : ℍ) : phiMinusTwoOne τ 0 = 0 := sorry

end

end QM1

end TauCeti.QSeries

end QM1File


-- ===== QM.2 =====

section QM2File

/-!
# QM.2 Partition asymptotics and exact formulas (suggested Lean forms)

This file is not the roadmap and is not exhaustive: the roadmap document is definitive, and the
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Everything is proved by `sorry`.

Conventions. `p(n)` is `Fintype.card (Nat.Partition n)`. The Dedekind sum `s(h, k)` belongs to
QM.1 (`QM.1/dedekind-eta-multiplier`); since that section is not available here it is written out
through the local notation `𝔰(h, k)` below, with `((x)) = fract x - 1/2` for `x ∉ ℤ` and `0` on `ℤ`.
Contour integrals are Tau Ceti's (`TauCeti.Contour.cauchyTheorem_starConvex`,
`TauCeti.Contour.IsPiecewiseC1On` at f790474); Tau Ceti is not imported here, so piecewise-`C¹`
hypotheses are stated with Mathlib's `ContDiffOn`. The Farey sequence is ClassicalArithmeticCompletion
CA.2's `fareySeq`, not available here; statements that need it are phrased through denominators and
determinants, and the circle-method lemmas that sum over Farey arcs are stated in the roadmap document.
-/

open Complex Real Filter Asymptotics
open scoped Nat

namespace TauCeti.QSeries

section QM2

-- The Dedekind sum `s(h, k) = ∑_{0<r<k} (r/k) ((h r / k))` of QM.1, written out.
set_option quotPrecheck false in
local notation "𝔰(" h ", " k ")" =>
  (∑ r ∈ Finset.Ioo (0 : ℕ) k, ((r : ℚ) / k) *
    (if Int.fract ((h : ℚ) * r / k) = 0 then 0 else Int.fract ((h : ℚ) * r / k) - 1 / 2))

/-! ## The partition generating function -/

/-- The partition generating function `F(x) = ∑ p(n) xⁿ` (meaningful for `‖x‖ < 1`). -/
noncomputable def partitionGenFun (x : ℂ) : ℂ :=
  ∑' n : ℕ, (Fintype.card (Nat.Partition n) : ℂ) * x ^ n

theorem hasSum_partitionGenFun {x : ℂ} (hx : ‖x‖ < 1) :
    HasSum (fun n : ℕ ↦ (Fintype.card (Nat.Partition n) : ℂ) * x ^ n) (partitionGenFun x) := sorry

theorem summable_norm_partitionGenFun {x : ℂ} (hx : ‖x‖ < 1) :
    Summable (fun n : ℕ ↦ (Fintype.card (Nat.Partition n) : ℝ) * ‖x‖ ^ n) := sorry

theorem hasProd_partitionGenFun {x : ℂ} (hx : ‖x‖ < 1) :
    HasProd (fun m : ℕ ↦ (1 - x ^ (m + 1))⁻¹) (partitionGenFun x) := sorry

theorem partitionGenFun_mul_tprod_one_sub_pow {x : ℂ} (hx : ‖x‖ < 1) :
    partitionGenFun x * ∏' m : ℕ, (1 - x ^ (m + 1)) = 1 := sorry

theorem partitionGenFun_ne_zero {x : ℂ} (hx : ‖x‖ < 1) : partitionGenFun x ≠ 0 := sorry

theorem differentiableOn_partitionGenFun :
    DifferentiableOn ℂ partitionGenFun (Metric.ball 0 1) := sorry

theorem norm_partitionGenFun_le {x : ℂ} (hx : ‖x‖ < 1) :
    ‖partitionGenFun x‖ ≤ (partitionGenFun (‖x‖ : ℂ)).re := sorry

theorem partitionGenFun_ofReal_strictMonoOn :
    (∀ t ∈ Set.Ico (0 : ℝ) 1, (partitionGenFun t).im = 0) ∧
      StrictMonoOn (fun t : ℝ ↦ (partitionGenFun t).re) (Set.Ico 0 1) := sorry

@[simp] theorem partitionGenFun_zero : partitionGenFun 0 = 1 := sorry

theorem coeff_genFun_one_eq_card (n : ℕ) :
    (Nat.Partition.genFun (fun _ _ ↦ (1 : ℂ))).coeff n = Fintype.card (Nat.Partition n) := sorry

/-- Unit test `TauCeti.QSeries.partitionGenFun_zero`: `F(0) = 1`. -/
example : partitionGenFun 0 = 1 := sorry

/-- Unit test `TauCeti.QSeries.card_partition_seven`: `p(7) = 15`. -/
example : Fintype.card (Nat.Partition 7) = 15 := sorry

/-- Unit test `TauCeti.QSeries.coeff_genFun_one_eq_card`: the coefficients of Mathlib's formal
generating function with `f = 1` are the partition numbers. -/
example (n : ℕ) :
    (Nat.Partition.genFun (fun _ _ ↦ (1 : ℂ))).coeff n = Fintype.card (Nat.Partition n) := sorry

/-- Unit test `TauCeti.QSeries.card_partition_four_ne_compositions`: `p(4) = 5`, not the `2³ = 8`
compositions of 4. -/
example : Fintype.card (Nat.Partition 4) = 5 ∧ Fintype.card (Nat.Partition 4) ≠ 2 ^ 3 := sorry

/-- `p` is nondecreasing (node `QM.2/partition-count-monotone`). -/
theorem card_partition_mono : Monotone fun m : ℕ ↦ Fintype.card (Nat.Partition m) := sorry

/-- `F(e^{2πiτ}) η(τ) = e^{πiτ/12}` (node `QM.2/partition-generating-function-eq-eta`). -/
theorem partitionGenFun_cexp_mul_eta {τ : ℂ} (hτ : 0 < τ.im) :
    partitionGenFun (cexp (2 * π * I * τ)) * ModularForm.eta τ = cexp (π * I * τ / 12) := sorry

/-- The transformation law of `F` near `e^{2πih/k}`
(node `QM.2/partition-generating-function-transformation`). -/
theorem partitionGenFun_transformation {h H : ℤ} {k : ℕ} (hk : 0 < k) (hcop : IsCoprime h k)
    (hH : (k : ℤ) ∣ h * H + 1) {z : ℂ} (hz : 0 < z.re) :
    partitionGenFun (cexp (2 * π * I * h / k - 2 * π * z / k ^ 2)) =
      cexp (π * I * ((𝔰(h, k) : ℚ) : ℂ)) * (z / k) ^ (1 / 2 : ℂ) *
        cexp (π / (12 * z) - π * z / (12 * k ^ 2)) *
          partitionGenFun (cexp (2 * π * I * H / k - 2 * π / z)) := sorry

/-! ## Ford circles and the Rademacher path -/

/-- The Ford circle `C(q)`: centre `q + i/(2 den²)`, radius `1/(2 den²)`. -/
noncomputable def fordCircle (q : ℚ) : Set ℂ :=
  Metric.sphere ((q : ℂ) + I / (2 * (q.den : ℂ) ^ 2)) (1 / (2 * (q.den : ℝ) ^ 2))

theorem fordCircle_eq_sphere {h : ℤ} {k : ℕ} (hk : 0 < k) (hcop : IsCoprime h k) :
    fordCircle ((h : ℚ) / k) =
      Metric.sphere ((h : ℂ) / k + I / (2 * (k : ℂ) ^ 2)) (1 / (2 * (k : ℝ) ^ 2)) := sorry

theorem mem_fordCircle_iff {q : ℚ} {τ : ℂ} :
    τ ∈ fordCircle q ↔ ‖τ - ((q : ℂ) + I / (2 * (q.den : ℂ) ^ 2))‖ = 1 / (2 * (q.den : ℝ) ^ 2) :=
  sorry

theorem coe_mem_fordCircle (q : ℚ) : (q : ℂ) ∈ fordCircle q := sorry

theorem im_pos_of_mem_fordCircle {q : ℚ} {τ : ℂ} (hτ : τ ∈ fordCircle q) (hne : τ ≠ q) :
    0 < τ.im := sorry

theorem fordCircle_add_intCast (q : ℚ) (m : ℤ) :
    fordCircle (q + m) = (fun τ : ℂ ↦ τ + m) '' fordCircle q := sorry

/-- Two Ford circles are tangent or disjoint (node `QM.2/ford-circles-tangent-or-disjoint`). -/
theorem fordCircle_tangent_or_disjoint {q r : ℚ} (hqr : q ≠ r) :
    ((q.num * r.den - r.num * q.den).natAbs = 1 → ∃! τ : ℂ, τ ∈ fordCircle q ∩ fordCircle r) ∧
      ((q.num * r.den - r.num * q.den).natAbs ≠ 1 → Disjoint (fordCircle q) (fordCircle r)) :=
  sorry

/-- Unit test `TauCeti.QSeries.fordCircle_zero_eq`: `C(0)` has centre `i/2` and radius `1/2`. -/
example : fordCircle 0 = Metric.sphere (I / 2) (1 / 2) := sorry

/-- Unit test `TauCeti.QSeries.fordCircle_half_mem`: `2/5 + i/5` lies on `C(0)` and on `C(1/2)`. -/
example : (2 / 5 + I / 5 : ℂ) ∈ fordCircle 0 ∧ (2 / 5 + I / 5 : ℂ) ∈ fordCircle (1 / 2) := sorry

/-- Unit test `TauCeti.QSeries.fordCircle_intCast`: `C(m)` has centre `m + i/2` and radius `1/2`. -/
example (m : ℤ) : fordCircle m = Metric.sphere ((m : ℂ) + I / 2) (1 / 2) := sorry

/-- Unit test `TauCeti.QSeries.fordCircle_third_twoThirds_disjoint`: `C(1/3)` and `C(2/3)` are
disjoint (determinant 3). -/
example : Disjoint (fordCircle (1 / 3)) (fordCircle (2 / 3)) := sorry

/-- Tangency points of adjacent Ford circles (node `QM.2/ford-circle-tangency-point`). -/
theorem fordCircle_tangency_point {h k h₁ k₁ h₂ k₂ : ℤ} (hk : 0 < k) (hk₁ : 0 < k₁) (hk₂ : 0 < k₂)
    (hdet₁ : h * k₁ - k * h₁ = 1) (hdet₂ : k * h₂ - h * k₂ = 1) :
    fordCircle ((h₁ : ℚ) / k₁) ∩ fordCircle ((h : ℚ) / k) =
        {(h : ℂ) / k - k₁ / (k * (k ^ 2 + k₁ ^ 2)) + I / (k ^ 2 + k₁ ^ 2)} ∧
      fordCircle ((h : ℚ) / k) ∩ fordCircle ((h₂ : ℚ) / k₂) =
        {(h : ℂ) / k + k₂ / (k * (k ^ 2 + k₂ ^ 2)) + I / (k ^ 2 + k₂ ^ 2)} := sorry

/-- The local coordinate `w = -i k² (τ - h/k)` maps `C(h/k)` onto `|w - 1/2| = 1/2`
(node `QM.2/ford-circle-local-coordinate`). -/
theorem fordCircle_image_localCoord {h : ℤ} {k : ℕ} (hk : 0 < k) (hcop : IsCoprime h k) :
    (fun τ : ℂ ↦ -I * (k : ℂ) ^ 2 * (τ - h / k)) '' fordCircle ((h : ℚ) / k) =
      Metric.sphere (1 / 2 : ℂ) (1 / 2) := sorry

/-- Inversion of the model circle (node `QM.2/rademacher-circle-inversion`). -/
theorem re_inv_eq_one_of_mem_modelCircle {w : ℂ} (hw : w ∈ Metric.sphere (1 / 2 : ℂ) (1 / 2))
    (hw0 : w ≠ 0) : 0 < w.re ∧ (w⁻¹).re = 1 := sorry

/-- Chord estimates (node `QM.2/ford-chord-estimates`); `k₁, k₂` are the denominators of the
Farey neighbours, so `k + k₁ ≥ N + 1` and `k + k₂ ≥ N + 1`. -/
theorem fordChord_estimates {k k₁ k₂ N : ℕ} (hk : 1 ≤ k) (hkN : k ≤ N) (hk₁N : k₁ ≤ N)
    (hk₂N : k₂ ≤ N) (h₁ : N + 1 ≤ k + k₁) (h₂ : N + 1 ≤ k + k₂) {w : ℂ}
    (hw : w ∈ segment ℝ
      ((k : ℂ) ^ 2 / (k ^ 2 + k₁ ^ 2) + I * (k * k₁) / (k ^ 2 + k₁ ^ 2))
      ((k : ℂ) ^ 2 / (k ^ 2 + k₂ ^ 2) - I * (k * k₂) / (k ^ 2 + k₂ ^ 2))) :
    ‖w‖ ≤ √2 * k / (N + 1) ∧ (k : ℝ) ^ 2 / (2 * N ^ 2) ≤ w.re ∧ 1 / 4 < (w⁻¹).re := sorry

/-- Minor arcs of the model circle, parametrised by `θ ↦ (1 + e^{iθ})/2`
(node `QM.2/rademacher-circle-minor-arc-estimates`). -/
theorem modelCircle_minorArc_estimates {θw : ℝ} (h0 : 0 ≤ θw) (hπ : θw < π) :
    (π - θw) / 2 ≤ π / 2 * ‖(1 + cexp (θw * I)) / 2‖ ∧
      ∀ θ ∈ Set.Icc θw π, ‖(1 + cexp (θ * I)) / 2‖ ≤ ‖(1 + cexp (θw * I)) / 2‖ := sorry

/-- The number of terms of the Farey sequence `F_N`, `1 + ∑_{k ≤ N} φ(k)`. -/
local notation "𝔉" N:max => (1 + ∑ k ∈ Finset.Icc 1 N, Nat.totient k : ℕ)

/-- The Rademacher path `P(N)`, parametrised on `[0, 𝔉 N]`, the `j`-th unit interval running over
the upper arc of the Ford circle of the `j`-th term of `F_N`. -/
noncomputable def rademacherPath (N : ℕ) : ℝ → ℂ := sorry

@[simp] theorem rademacherPath_start (N : ℕ) : rademacherPath N 0 = I := sorry

@[simp] theorem rademacherPath_end {N : ℕ} (hN : 1 ≤ N) :
    rademacherPath N (𝔉 N) = 1 + I := sorry

/-- `P(N)` is piecewise `C¹` (Tau Ceti's `IsPiecewiseC1On`, spelled out with Mathlib). -/
theorem isPiecewiseC1On_rademacherPath {N : ℕ} (hN : 1 ≤ N) :
    ContinuousOn (rademacherPath N) (Set.Icc 0 (𝔉 N)) ∧
      ∀ j : ℕ, j < (𝔉 N) → ContDiffOn ℝ 1 (rademacherPath N) (Set.Icc (j : ℝ) (j + 1)) := sorry

theorem im_rademacherPath_pos {N : ℕ} (hN : 1 ≤ N) {t : ℝ} (ht : t ∈ Set.Icc (0 : ℝ) (𝔉 N)) :
    0 < (rademacherPath N t).im := sorry

theorem rademacherPath_mem_fordCircle {N : ℕ} (hN : 1 ≤ N) {j : ℕ} (hj : j < (𝔉 N)) :
    ∃ q : ℚ, 0 ≤ q ∧ q ≤ 1 ∧ q.den ≤ N ∧
      ∀ t ∈ Set.Icc (j : ℝ) (j + 1), rademacherPath N t ∈ fordCircle q := sorry

theorem rademacherPath_eq_tangency {N : ℕ} (hN : 1 ≤ N) {j : ℕ} (hj₁ : 1 ≤ j) (hj : j < (𝔉 N)) :
    ∃ q r : ℚ, q < r ∧ r.num * q.den - q.num * r.den = 1 ∧
      rademacherPath N j ∈ fordCircle q ∩ fordCircle r := sorry

/-- Unit test `TauCeti.QSeries.rademacherPath_one_half`: `P(1)` passes through `(1 + i)/2`. -/
example : rademacherPath 1 1 = (1 + I) / 2 := sorry

/-- Unit test `TauCeti.QSeries.rademacherPath_two_tangency`: `P(2)` passes through the tangency
points `2/5 + i/5` and `3/5 + i/5`. -/
example : rademacherPath 2 1 = 2 / 5 + I / 5 ∧ rademacherPath 2 2 = 3 / 5 + I / 5 := sorry

/-- Unit test `TauCeti.QSeries.rademacherPath_start_end`: `P(N)` runs from `i` to `1 + i`. -/
example (N : ℕ) (hN : 1 ≤ N) : rademacherPath N 0 = I ∧ rademacherPath N (𝔉 N) = 1 + I := sorry

/-- Unit test `TauCeti.QSeries.rademacherPath_tangency_im`: `P(N)(1)` is the tangency point of
`C(0)` and `C(1/N)`, at height `1/(N² + 1)`. -/
example (N : ℕ) (hN : 1 ≤ N) : (rademacherPath N 1).im = 1 / ((N : ℝ) ^ 2 + 1) := sorry

/-! ## Gamma and Bessel functions -/

/-- The Laplace transform of `u^{s-1}` at complex `t` (node `QM.2/laplace-transform-cpow`). -/
theorem integral_cpow_mul_cexp_neg_mul_Ioi_of_re_pos {s t : ℂ} (hs : 0 < s.re) (ht : 0 < t.re) :
    ∫ u in Set.Ioi (0 : ℝ), (u : ℂ) ^ (s - 1) * cexp (-(t * u)) = Complex.Gamma s * t ^ (-s) :=
  sorry

/-- Laplace's integral for `1/Γ` on a vertical line
(node `QM.2/bromwich-integral-reciprocal-gamma`). -/
theorem inv_Gamma_eq_integral_vertical {c : ℝ} (hc : 0 < c) {s : ℂ} (hs : 1 < s.re) :
    (Complex.Gamma s)⁻¹ =
      (1 / (2 * π)) * ∫ y : ℝ, ((c : ℂ) + y * I) ^ (-s) * cexp ((c : ℂ) + y * I) := sorry

/-- The Bessel function of the first kind, `J_ν(z) = (z/2)^ν ₀F̃₁(; ν + 1; -z²/4)`. -/
noncomputable def besselJ (ν z : ℂ) : ℂ :=
  (z / 2) ^ ν * Complex.regularizedHGFun 0 {ν + 1} (-(z ^ 2) / 4)

theorem hasSum_besselJ (ν z : ℂ) :
    HasSum (fun j : ℕ ↦ (z / 2) ^ ν * ((-1) ^ j * (z ^ 2 / 4) ^ j /
      (j ! * Complex.Gamma (ν + j + 1)))) (besselJ ν z) := sorry

theorem differentiableOn_besselJ (ν : ℂ) : DifferentiableOn ℂ (besselJ ν) Complex.slitPlane :=
  sorry

theorem besselJ_ode (ν : ℂ) {z : ℂ} (hz : z ∈ Complex.slitPlane) :
    z ^ 2 * deriv (deriv (besselJ ν)) z + z * deriv (besselJ ν) z + (z ^ 2 - ν ^ 2) * besselJ ν z
      = 0 := sorry

theorem besselJ_add_besselJ (ν : ℂ) {z : ℂ} (hz : z ∈ Complex.slitPlane) :
    besselJ (ν - 1) z + besselJ (ν + 1) z = 2 * ν / z * besselJ ν z := sorry

theorem besselJ_one_half {x : ℝ} (hx : 0 < x) :
    besselJ (1 / 2) x = (√(2 / (π * x)) * Real.sin x : ℝ) := sorry

theorem besselJ_neg_natCast (n : ℕ) (z : ℂ) : besselJ (-n) z = (-1) ^ n * besselJ n z := sorry

/-- Unit test `TauCeti.QSeries.besselJ_zero_zero`: `J_0(0) = 1`. -/
example : besselJ 0 0 = 1 := sorry

/-- Unit test `TauCeti.QSeries.besselJ_one_half_pi`: `J_{1/2}(π) = 0`. -/
example : besselJ (1 / 2) π = 0 := sorry

/-- Unit test `TauCeti.QSeries.besselJ_zero_eq_regularizedHGFun`: `J_0(z) = ₀F̃₁(; 1; -z²/4)`. -/
example (z : ℂ) : besselJ 0 z = Complex.regularizedHGFun 0 {1} (-(z ^ 2) / 4) := sorry

/-- Unit test `TauCeti.QSeries.exists_besselJ_zero_eq_zero`: `J_0` vanishes in `(2, 3)`. -/
example : ∃ x ∈ Set.Ioo (2 : ℝ) 3, besselJ 0 x = 0 := sorry

/-- The modified Bessel function of the first kind, `I_ν(z) = (z/2)^ν ₀F̃₁(; ν + 1; z²/4)`. -/
noncomputable def modifiedBesselI (ν z : ℂ) : ℂ :=
  (z / 2) ^ ν * Complex.regularizedHGFun 0 {ν + 1} (z ^ 2 / 4)

theorem modifiedBesselI_eq_regularizedHGFun (ν z : ℂ) :
    modifiedBesselI ν z = (z / 2) ^ ν * Complex.regularizedHGFun 0 {ν + 1} (z ^ 2 / 4) := rfl

theorem hasSum_modifiedBesselI (ν z : ℂ) :
    HasSum (fun j : ℕ ↦ (z / 2) ^ ν * ((z ^ 2 / 4) ^ j / (j ! * Complex.Gamma (ν + j + 1))))
      (modifiedBesselI ν z) := sorry

theorem differentiable_regularizedHGFun_modifiedBessel (ν : ℂ) :
    Differentiable ℂ (fun z : ℂ ↦ Complex.regularizedHGFun 0 {ν + 1} (z ^ 2 / 4)) := sorry

theorem differentiableOn_modifiedBesselI (ν : ℂ) :
    DifferentiableOn ℂ (modifiedBesselI ν) Complex.slitPlane := sorry

theorem modifiedBesselI_neg_natCast (n : ℕ) (z : ℂ) :
    modifiedBesselI (-n) z = modifiedBesselI n z := sorry

theorem modifiedBesselI_sub_modifiedBesselI (ν : ℂ) {z : ℂ} (hz : z ∈ Complex.slitPlane) :
    modifiedBesselI (ν - 1) z - modifiedBesselI (ν + 1) z = 2 * ν / z * modifiedBesselI ν z :=
  sorry

theorem deriv_modifiedBesselI (ν : ℂ) {z : ℂ} (hz : z ∈ Complex.slitPlane) :
    deriv (modifiedBesselI ν) z = modifiedBesselI (ν + 1) z + ν / z * modifiedBesselI ν z := sorry

theorem modifiedBesselI_ode (ν : ℂ) {z : ℂ} (hz : z ∈ Complex.slitPlane) :
    z ^ 2 * deriv (deriv (modifiedBesselI ν)) z + z * deriv (modifiedBesselI ν) z
      - (z ^ 2 + ν ^ 2) * modifiedBesselI ν z = 0 := sorry

theorem modifiedBesselI_one_half {x : ℝ} (hx : 0 < x) :
    modifiedBesselI (1 / 2) x = (√(2 / (π * x)) * Real.sinh x : ℝ) := sorry

theorem modifiedBesselI_neg_one_half {x : ℝ} (hx : 0 < x) :
    modifiedBesselI (-(1 / 2)) x = (√(2 / (π * x)) * Real.cosh x : ℝ) := sorry

theorem modifiedBesselI_ofReal_pos {ν x : ℝ} (hν : -1 < ν) (hx : 0 < x) :
    (modifiedBesselI ν x).im = 0 ∧ 0 < (modifiedBesselI ν x).re := sorry

theorem norm_modifiedBesselI_le {ν x : ℝ} (hν : 0 ≤ ν) (hx : 0 ≤ x) :
    ‖modifiedBesselI ν x‖ ≤ (x / 2) ^ ν * Real.exp (x ^ 2 / 4) / Real.Gamma (ν + 1) := sorry

theorem isEquivalent_modifiedBesselI_atTop (ν : ℝ) :
    (fun x : ℝ ↦ modifiedBesselI ν x) ~[atTop] fun x : ℝ ↦ ((Real.exp x / √(2 * π * x) : ℝ) : ℂ) :=
  sorry

theorem modifiedBesselI_eq_besselJ (ν : ℂ) {z : ℂ} (hz₁ : -π < z.arg) (hz₂ : z.arg ≤ π / 2) :
    modifiedBesselI ν z = cexp (-ν * π * I / 2) * besselJ ν (I * z) := sorry

/-- Unit test `TauCeti.QSeries.modifiedBesselI_zero_zero`: `I_0(0) = 1`. -/
example : modifiedBesselI 0 0 = 1 := sorry

/-- Unit test `TauCeti.QSeries.modifiedBesselI_one_half_one`: `I_{1/2}(1) = √(2/π) sinh 1`. -/
example : modifiedBesselI (1 / 2) 1 = (√(2 / π) * Real.sinh 1 : ℝ) := sorry

/-- Unit test `TauCeti.QSeries.modifiedBesselI_zero_eq_regularizedHGFun`:
`I_0(z) = ₀F̃₁(; 1; z²/4)`. -/
example (z : ℂ) : modifiedBesselI 0 z = Complex.regularizedHGFun 0 {1} (z ^ 2 / 4) := sorry

/-- Unit test `TauCeti.QSeries.one_le_re_modifiedBesselI_zero`: `I_0(x) ≥ 1` on the real line,
unlike `J_0`. -/
example (x : ℝ) : 1 ≤ (modifiedBesselI 0 x).re := sorry

/-- The closed form of `I_{3/2}` (node `QM.2/modified-bessel-i-three-halves`). -/
theorem modifiedBesselI_three_halves {x : ℝ} (hx : 0 < x) :
    modifiedBesselI (3 / 2) x = (√(2 / (π * x)) * (Real.cosh x - Real.sinh x / x) : ℝ) := sorry

/-- The vertical-line integral for `I_ν` (node `QM.2/modified-bessel-i-bromwich-integral`). -/
theorem modifiedBesselI_eq_integral_vertical {x c : ℝ} (hx : 0 < x) (hc : 0 < c) {ν : ℂ}
    (hν : 0 < ν.re) :
    modifiedBesselI ν x = ((x : ℂ) / 2) ^ ν * ((1 / (2 * π)) * ∫ y : ℝ,
      ((c : ℂ) + y * I) ^ (-ν - 1) * cexp ((c : ℂ) + y * I + (x : ℂ) ^ 2 / (4 * ((c : ℂ) + y * I))))
    := sorry

/-! ## Rademacher's Kloosterman sum -/

/-- `A_k(n) = ∑_{h < k, (h,k) = 1} exp(πi s(h,k) - 2πinh/k)`. -/
noncomputable def rademacherKloosterman (k : ℕ) (n : ℤ) : ℂ :=
  ∑ h ∈ (Finset.range k).filter (fun h ↦ Nat.Coprime h k),
    cexp (π * I * ((𝔰(h, k) : ℚ) : ℂ) - 2 * π * I * n * h / k)

@[simp] theorem rademacherKloosterman_one (n : ℤ) : rademacherKloosterman 1 n = 1 := sorry

@[simp] theorem rademacherKloosterman_two (n : ℤ) : rademacherKloosterman 2 n = (-1) ^ n := sorry

@[simp] theorem rademacherKloosterman_three (n : ℤ) :
    rademacherKloosterman 3 n = 2 * Real.cos (π * (12 * n - 1) / 18) := sorry

@[simp] theorem rademacherKloosterman_add_mul_self (k : ℕ) (n m : ℤ) :
    rademacherKloosterman k (n + m * k) = rademacherKloosterman k n := sorry

theorem rademacherKloosterman_im (k : ℕ) (n : ℤ) : (rademacherKloosterman k n).im = 0 := sorry

theorem star_rademacherKloosterman (k : ℕ) (n : ℤ) :
    star (rademacherKloosterman k n) = rademacherKloosterman k n := sorry

theorem norm_rademacherKloosterman_le_totient (k : ℕ) (n : ℤ) :
    ‖rademacherKloosterman k n‖ ≤ φ k := sorry

/-- The trivial bound (node `QM.2/kloosterman-sum-rademacher-trivial-bound`). -/
theorem norm_rademacherKloosterman_le (k : ℕ) (n : ℤ) : ‖rademacherKloosterman k n‖ ≤ k := sorry

/-- Unit test `TauCeti.QSeries.rademacherKloosterman_one_apply`: `A_1(n) = 1`. -/
example (n : ℤ) : rademacherKloosterman 1 n = 1 := sorry

/-- Unit test `TauCeti.QSeries.rademacherKloosterman_four`: `A_4(n) = 2 cos(π(4n - 1)/8)`. -/
example (n : ℤ) : rademacherKloosterman 4 n = 2 * Real.cos (π * (4 * n - 1) / 8) := sorry

/-- Unit test `TauCeti.QSeries.rademacherKloosterman_five_one`: `A_5(1) = 0`. -/
example : rademacherKloosterman 5 1 = 0 := sorry

/-- Unit test `TauCeti.QSeries.rademacherKloosterman_three_zero_ne_ramanujan`: the eta multiplier
matters, `A_3(0) = 2 cos(π/18) ≠ 2 = c_3(0)`. -/
example : rademacherKloosterman 3 0 = 2 * Real.cos (π / 18) ∧ rademacherKloosterman 3 0 ≠ 2 :=
  sorry

/-- Unit test `TauCeti.QSeries.rademacherKloosterman_im_eq_zero`: `A_k(n)` is real. -/
example (k : ℕ) (n : ℤ) : (rademacherKloosterman k n).im = 0 := sorry

/-- The Jacobi-symbol form of `exp(πi s(h,k))` for odd `k`
(node `QM.2/kloosterman-sum-rademacher-jacobi-form`). -/
theorem cexp_dedekindSum_eq_jacobi_of_odd {h k : ℕ} {hb : ℤ} (hk : Odd k) (hcop : Nat.Coprime h k)
    (hinv : (k : ℤ) ∣ h * hb - 1) :
    cexp (π * I * ((𝔰(h, k) : ℚ) : ℂ)) = (jacobiSym (-(h : ℤ)) k : ℂ) *
      cexp (-(π * I * (((k : ℂ) - 1) / 4 +
        (1 / 12) * ((k : ℂ) - 1 / k) * (2 * h + hb - (h : ℂ) ^ 2 * hb)))) := sorry

/-- The Jacobi-symbol form of `exp(πi s(h,k))` for even `k` (same node). -/
theorem cexp_dedekindSum_eq_jacobi_of_even {h k : ℕ} {hb : ℤ} (hk : Even k) (hk0 : 0 < k)
    (hcop : Nat.Coprime h k) (hinv : (k : ℤ) ∣ h * hb - 1) :
    cexp (π * I * ((𝔰(h, k) : ℚ) : ℂ)) = (jacobiSym (-(k : ℤ)) h : ℂ) *
      cexp (-(π * I * ((2 - (h : ℂ) * k - h) / 4 +
        (1 / 12) * ((k : ℂ) - 1 / k) * (2 * h + hb - (h : ℂ) ^ 2 * hb)))) := sorry

/-- `A_k(n)` through the Jacobi-symbol roots of unity, odd `k`; `h̄ = h⁻¹ mod k`. -/
theorem rademacherKloosterman_eq_jacobi {k : ℕ} (hk : Odd k) (n : ℤ) :
    rademacherKloosterman k n = ∑ h ∈ (Finset.range k).filter (fun h ↦ Nat.Coprime h k),
      (jacobiSym (-(h : ℤ)) k : ℂ) *
        cexp (-(π * I * (((k : ℂ) - 1) / 4 + (1 / 12) * ((k : ℂ) - 1 / k) *
          (2 * h + (((h : ZMod k)⁻¹).val : ℂ) - (h : ℂ) ^ 2 * (((h : ZMod k)⁻¹).val : ℂ))))) *
        cexp (-(2 * π * I * n * h / k)) := sorry

/-- Lehmer's exponent form for odd `k` (node `QM.2/lehmer-exponent-form`). -/
theorem rademacherKloosterman_eq_lehmer_of_odd {k : ℕ} (hk : Odd k) (n : ℤ) :
    rademacherKloosterman k n = ∑ ρ ∈ (Finset.range k).filter (fun ρ ↦ Nat.Coprime ρ k),
      cexp (π * I * (-(24 * n * ρ + 6 * k * jacobiSym (-(ρ : ℤ)) k + 3 * k * (k - 3) +
        ((k : ℤ) ^ 2 - 1) * (2 * ρ + ((ρ : ZMod k)⁻¹).val - (ρ : ℤ) ^ 2 * ((ρ : ZMod k)⁻¹).val))
          : ℤ) / (12 * k)) := sorry

/-- Lehmer's exponent form for even `k` (same node). -/
theorem rademacherKloosterman_eq_lehmer_of_even {k : ℕ} (hk : Even k) (hk0 : 0 < k) (n : ℤ) :
    rademacherKloosterman k n = ∑ ρ ∈ (Finset.range k).filter (fun ρ ↦ Nat.Coprime ρ k),
      cexp (π * I * (-(24 * n * ρ + 6 * k * jacobiSym (-(k : ℤ)) ρ - ρ * (k + 1) * (k + 2) -
        ((k : ℤ) ^ 2 - 1) * ((ρ : ℤ) ^ 2 - 1) * ((ρ : ZMod k)⁻¹).val) : ℤ) / (12 * k)) := sorry

/-- Lehmer's congruences for odd `k` (node `QM.2/lehmer-exponent-congruences`). -/
theorem lehmer_congruences_of_odd {k ρ : ℕ} (hk : Odd k) (hρ : Nat.Coprime ρ k) (n : ℤ)
    (ρb : ℤ) (hρb : (k : ℤ) ∣ ρ * ρb - 1) (ρb' : ℤ)
    (hρb' : ((if 3 ∣ k then 3 * k else k : ℕ) : ℤ) ∣ ρ * ρb' - 1) :
    let f : ℤ := -(24 * n * ρ + 6 * k * jacobiSym (-(ρ : ℤ)) k + 3 * k * (k - 3) +
      ((k : ℤ) ^ 2 - 1) * (2 * ρ + ρb - (ρ : ℤ) ^ 2 * ρb))
    f ≡ (1 - 24 * n) * ρ + ρb' [ZMOD ((if 3 ∣ k then 3 * k else k : ℕ) : ℤ)] ∧
      (¬ 3 ∣ k → f ≡ 0 [ZMOD 3]) ∧
      f ≡ 2 * k * jacobiSym (-(ρ : ℤ)) k + k - 3 [ZMOD 8] := sorry

/-- Lehmer's multiplication theorem for odd coprime moduli
(node `QM.2/kloosterman-sum-rademacher-mul-odd`). -/
theorem rademacherKloosterman_mul {k₁ k₂ : ℕ} (h₁ : Odd k₁) (h₂ : Odd k₂)
    (hcop : Nat.Coprime k₁ k₂) (n₁ n₂ n₃ : ℤ) (c : ZMod (k₁ * k₂))
    (hc : ((8 * (3 / Nat.gcd 3 (k₁ * k₂)) : ℕ) : ZMod (k₁ * k₂)) * c =
      (((k₁ ^ 2 + k₂ ^ 2 - 1 : ℤ) / Nat.gcd 3 (k₁ * k₂) : ℤ) : ZMod (k₁ * k₂)))
    (h₃ : (n₃ : ZMod (k₁ * k₂)) = (k₁ : ZMod (k₁ * k₂)) ^ 2 * n₂ + (k₂ : ZMod (k₁ * k₂)) ^ 2 * n₁ - c) :
    rademacherKloosterman k₁ n₁ * rademacherKloosterman k₂ n₂ = rademacherKloosterman (k₁ * k₂) n₃ :=
  sorry

/-- Lehmer's multiplication theorem for an odd modulus and `2^λ`, `λ ≥ 2`
(node `QM.2/kloosterman-sum-rademacher-mul-two-power`). -/
theorem rademacherKloosterman_mul_two_pow {k lam : ℕ} (hk : Odd k) (hlam : 2 ≤ lam)
    (n₁ n₂ n₃ : ℤ) (c : ZMod (2 ^ lam * k))
    (hc : (((3 / Nat.gcd 3 k) : ℕ) : ZMod (2 ^ lam * k)) * c =
      (((k ^ 2 - 1 + 2 ^ (2 * lam) : ℤ) / (8 * Nat.gcd 3 k) : ℤ) : ZMod (2 ^ lam * k)))
    (h₃ : (n₃ : ZMod (2 ^ lam * k)) =
      (k : ZMod (2 ^ lam * k)) ^ 2 * n₂ + (2 : ZMod (2 ^ lam * k)) ^ (2 * lam) * n₁ - c) :
    rademacherKloosterman k n₁ * rademacherKloosterman (2 ^ lam) n₂ =
      (-1) ^ (2 ^ (lam - 2)) * rademacherKloosterman (2 ^ lam * k) n₃ := sorry

/-- Lehmer's doubling theorem (node `QM.2/kloosterman-sum-rademacher-double-odd`). -/
theorem rademacherKloosterman_double {k : ℕ} (hk : Odd k) (n : ℤ) :
    rademacherKloosterman k n = rademacherKloosterman (2 * k) (4 * n + ((k : ℤ) ^ 2 - 1) / 8) :=
  sorry

/-! ## The Rademacher series -/

/-- `R_k(n) = A_k(n) √k (u cosh u - sinh u)/(2√2 π λ³)`, `λ = √(n - 1/24)`, `u = π√(2/3) λ / k`. -/
noncomputable def rademacherTerm (k n : ℕ) : ℝ :=
  (rademacherKloosterman k n).re * √k *
    (π * √(2 / 3) * √((n : ℝ) - 1 / 24) / k * Real.cosh (π * √(2 / 3) * √((n : ℝ) - 1 / 24) / k)
      - Real.sinh (π * √(2 / 3) * √((n : ℝ) - 1 / 24) / k)) / (2 * √2 * π * √((n : ℝ) - 1 / 24) ^ 3)

theorem rademacherTerm_eq_deriv {k n : ℕ} (hk : 1 ≤ k) (hn : 1 ≤ n) :
    rademacherTerm k n = 1 / (π * √2) * (rademacherKloosterman k n).re * √k *
      deriv (fun m : ℝ ↦ Real.sinh (π / k * √(2 / 3 * (m - 1 / 24))) / √(m - 1 / 24)) n := sorry

theorem rademacherTerm_eq_modifiedBesselI {k n : ℕ} (hk : 1 ≤ k) (hn : 1 ≤ n) :
    rademacherTerm k n = 2 * π / (24 * (n : ℝ) - 1) ^ (3 / 4 : ℝ) *
      ((rademacherKloosterman k n).re / k) *
        (modifiedBesselI (3 / 2) ((π * √(24 * (n : ℝ) - 1) / (6 * k) : ℝ) : ℂ)).re := sorry

@[simp] theorem rademacherTerm_one {n : ℕ} (hn : 1 ≤ n) :
    rademacherTerm 1 n = 1 / (4 * √3 * ((n : ℝ) - 1 / 24)) *
      ((1 - 1 / (π * √(2 / 3 * ((n : ℝ) - 1 / 24)))) * Real.exp (π * √(2 / 3 * ((n : ℝ) - 1 / 24))) +
        (1 + 1 / (π * √(2 / 3 * ((n : ℝ) - 1 / 24)))) * Real.exp (-(π * √(2 / 3 * ((n : ℝ) - 1 / 24))))) :=
  sorry

theorem rademacherTerm_eq_zero_of_kloosterman_eq_zero {k n : ℕ}
    (h : rademacherKloosterman k n = 0) : rademacherTerm k n = 0 := sorry

/-- Unit test `TauCeti.QSeries.rademacherTerm_three_hundred`: `|R_3(100) + 2.598| < 10⁻³`. -/
example : |rademacherTerm 3 100 + 2.598| < 1 / 1000 := sorry

/-- Unit test `TauCeti.QSeries.rademacherTerm_five_one`: `R_5(1) = 0`. -/
example : rademacherTerm 5 1 = 0 := sorry

/-- Unit test `TauCeti.QSeries.rademacherTerm_one_one_eq_besselI`: the Bessel form at `k = n = 1`. -/
example : rademacherTerm 1 1 =
    2 * π / (23 : ℝ) ^ (3 / 4 : ℝ) * (modifiedBesselI (3 / 2) ((π * √23 / 6 : ℝ) : ℂ)).re := sorry

/-- Unit test `TauCeti.QSeries.rademacherTerm_one_one_ne_hardyRamanujan`: `R_1(1)` is not the
Hardy–Ramanujan term `φ_1(1) = e^{α}(α - 1)/(4√2 π λ³)`. -/
example : rademacherTerm 1 1 ≠
    Real.exp (π * √(2 / 3) * √(23 / 24)) * (π * √(2 / 3) * √(23 / 24) - 1) /
      (4 * √2 * π * √(23 / 24) ^ 3) := sorry

/-- `p(n)` as an integral along `P(N)` (node `QM.2/partition-number-path-integral`). -/
theorem card_partition_eq_integral_rademacherPath (n : ℕ) {N : ℕ} (hN : 1 ≤ N) :
    (Fintype.card (Nat.Partition n) : ℂ) = ∫ t in (0 : ℝ)..(𝔉 N),
      deriv (rademacherPath N) t * partitionGenFun (cexp (2 * π * I * rademacherPath N t)) *
        cexp (-(2 * π * I * n * rademacherPath N t)) := sorry

/-- Rademacher's truncation estimate from the circle method
(node `QM.2/circle-method-truncation-estimate`). -/
theorem abs_card_partition_sub_sum_rademacherTerm_le {n N : ℕ} (hn : 1 ≤ n) (hN : 1 ≤ N) :
    |(Fintype.card (Nat.Partition n) : ℝ) - ∑ k ∈ Finset.Icc 1 N, rademacherTerm k n| ≤
      (2 ^ (7 / 4 : ℝ) * ((partitionGenFun (Real.exp (-(π / 48)))).re - 1) * Real.exp (2 * π * n) +
        2 ^ (3 / 4 : ℝ) * π * Real.exp (π / 12 + 2 * π * n)) / √(N + 1) := sorry

/-- An elementary inequality (node `QM.2/cosh-sub-sinh-bound`). -/
theorem mul_cosh_sub_sinh_le {u : ℝ} (hu : 0 < u) :
    0 < u * Real.cosh u - Real.sinh u ∧ u * Real.cosh u - Real.sinh u ≤ u ^ 3 * Real.cosh u / 2 :=
  sorry

/-- The termwise bound (node `QM.2/rademacher-term-bound`). -/
theorem abs_rademacherTerm_le {k n : ℕ} (hk : 1 ≤ k) (hn : 1 ≤ n) :
    |rademacherTerm k n| ≤
      π ^ 2 / (6 * √3) * (k : ℝ) ^ (-(3 / 2 : ℝ)) * Real.cosh (π * √(2 / 3 * ((n : ℝ) - 1 / 24)) / k) :=
  sorry

/-- Absolute convergence (node `QM.2/rademacher-series-absolutely-convergent`). -/
theorem summable_abs_rademacherTerm {n : ℕ} (hn : 1 ≤ n) :
    Summable fun k : ℕ ↦ |rademacherTerm (k + 1) n| := sorry

/-- **Rademacher's exact formula** (node `QM.2/rademacher-exact-formula`). -/
theorem hasSum_rademacherTerm {n : ℕ} (hn : 1 ≤ n) :
    HasSum (fun k : ℕ ↦ rademacherTerm (k + 1) n) (Fintype.card (Nat.Partition n)) := sorry

/-- The effective remainder bound (node `QM.2/rademacher-remainder-bound`). -/
theorem abs_card_partition_sub_sum_rademacherTerm_le_tail {n N : ℕ} (hn : 1 ≤ n) (hN : 1 ≤ N) :
    |(Fintype.card (Nat.Partition n) : ℝ) - ∑ k ∈ Finset.Icc 1 N, rademacherTerm k n| ≤
      π ^ 2 / (3 * √3) * (N : ℝ) ^ (-(1 / 2 : ℝ)) *
        Real.cosh (π * √(2 / 3 * ((n : ℝ) - 1 / 24)) / (N + 1)) := sorry

/-- `p(n)` is the nearest integer to a certified truncation
(node `QM.2/partition-number-nearest-integer`). -/
theorem card_partition_eq_round_sum_rademacherTerm {n N : ℕ} (hn : 1 ≤ n) (hN : 1 ≤ N)
    (hbound : π ^ 2 / (3 * √3) * (N : ℝ) ^ (-(1 / 2 : ℝ)) *
      Real.cosh (π * √(2 / 3 * ((n : ℝ) - 1 / 24)) / (N + 1)) < 1 / 2) :
    (Fintype.card (Nat.Partition n) : ℤ) = round (∑ k ∈ Finset.Icc 1 N, rademacherTerm k n) := sorry

/-- The explicit sufficient condition `N ≥ max(35, α(n))` (same node). -/
theorem card_partition_eq_round_sum_rademacherTerm_of_le {n N : ℕ} (hn : 1 ≤ n) (hN : 35 ≤ N)
    (hα : π * √(2 / 3 * ((n : ℝ) - 1 / 24)) ≤ N) :
    (Fintype.card (Nat.Partition n) : ℤ) = round (∑ k ∈ Finset.Icc 1 N, rademacherTerm k n) := sorry

/-- The leading term (node `QM.2/rademacher-leading-term-asymptotic`). -/
theorem rademacherTerm_one_isEquivalent :
    (fun n : ℕ ↦ rademacherTerm 1 n) ~[atTop]
      fun n : ℕ ↦ Real.exp (π * √(2 * n / 3)) / (4 * √3 * n) := sorry

/-- **The Hardy–Ramanujan asymptotic formula** (node `QM.2/hardy-ramanujan-asymptotic`). -/
theorem card_partition_isEquivalent :
    (fun n : ℕ ↦ (Fintype.card (Nat.Partition n) : ℝ)) ~[atTop]
      fun n : ℕ ↦ Real.exp (π * √(2 * n / 3)) / (4 * √3 * n) := sorry

/-- The Hardy–Ramanujan term `φ_k(n) = √k e^u (u - 1)/(4√2 π λ³)`, written out. -/
local notation "φHR" k:max n:max =>
  (√(k : ℝ) * Real.exp (π * √(2 / 3 * ((n : ℝ) - 1 / 24)) / k) *
    (π * √(2 / 3 * ((n : ℝ) - 1 / 24)) / k - 1) / (4 * √2 * π * √((n : ℝ) - 1 / 24) ^ 3))

/-- Explicit error of the truncated Hardy–Ramanujan sum
(node `QM.2/hardy-ramanujan-truncation-bound`). -/
theorem abs_card_partition_sub_hardyRamanujan_le {n N : ℕ} (hn : 1 ≤ n) (hN : 1 ≤ N) :
    |(Fintype.card (Nat.Partition n) : ℝ) -
        ∑ k ∈ Finset.Icc 1 N, (rademacherKloosterman k n).re * φHR k n| ≤
      π ^ 2 / (3 * √3) * (N : ℝ) ^ (-(1 / 2 : ℝ)) *
          Real.cosh (π * √(2 / 3 * ((n : ℝ) - 1 / 24)) / (N + 1)) +
        (N : ℝ) ^ (5 / 2 : ℝ) / (4 * √2 * π * √((n : ℝ) - 1 / 24) ^ 3) := sorry

/-- **Hardy and Ramanujan's truncated formula** (node `QM.2/hardy-ramanujan-truncated-formula`). -/
theorem card_partition_sub_hardyRamanujan_isBigO {a : ℝ} (ha : 0 < a) :
    (fun n : ℕ ↦ (Fintype.card (Nat.Partition n) : ℝ) -
        ∑ k ∈ Finset.Icc 1 ⌊a * √n⌋₊, (rademacherKloosterman k n).re * φHR k n)
      =O[atTop] fun n : ℕ ↦ (n : ℝ) ^ (-(1 / 4 : ℝ)) := sorry

/-- `p(n)` is eventually the nearest integer to the Hardy–Ramanujan sum
(node `QM.2/hardy-ramanujan-nearest-integer`). -/
theorem eventually_card_partition_eq_round_hardyRamanujan {a : ℝ} (ha : 0 < a) :
    ∀ᶠ n : ℕ in atTop, (Fintype.card (Nat.Partition n) : ℤ) =
      round (∑ k ∈ Finset.Icc 1 ⌊a * √n⌋₊, (rademacherKloosterman k n).re * φHR k n) := sorry

end QM2

end TauCeti.QSeries

end QM2File


-- ===== QM.3 =====

section QM3File

/-
QM.3 Harmonic Maass forms: the suggested-Lean section of BP-QSeriesPartitionsAndMockModularForms.
This file is not the roadmap and is not exhaustive; the roadmap document is definitive, and these
statements suggest Lean forms so that contributors and reviewers converge on names and signatures.
Nothing here is an implementation claim.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Tau Ceti (f790474) is not imported, because it is
not built here. The Tau Ceti declarations this section would import are replaced by local stand-ins
with the same mathematical content:
* `lowerIncompleteGammaLocal`, `regularizedGammaLocal` for `TauCeti.lowerIncompleteGamma`,
  `TauCeti.regularizedGamma` (TauCeti/Analysis/SpecialFunctions/IncompleteGamma);
* `erfcLocal` for `TauCeti.Real.erfc` (TauCeti/Analysis/SpecialFunctions/Erf);
* `peterssonInnerCosetsLocal` for `CuspForm.peterssonInnerCosets`, with `Γ ⊔ center` in place of
  `Subgroup.withCenter` (TauCeti/NumberTheory/ModularForms/Petersson/FiniteIndex).
Sibling stages: the Bessel functions `J_ν`, `I_ν` of QM.2 (QM.2/bessel-function-j,
QM.2/modified-bessel-function-i) are replaced by the series stand-ins `besselJLocal`,
`besselILocal`.

Setting (pinned): scalar-valued forms of integral weight `k` on arithmetic subgroups
`Γ ≤ GL(2, ℝ)` with `Γ.HasDetOne` (images of finite-index subgroups of `SL(2, ℤ)`); the operators
`Δ_k`, `R_k`, `L_k`, `ξ_k` are defined for real `k`. Functions on `ℍ` are differentiated through
`f ∘ ofComplex`. Conventions: `e(x) = exp(2πix)`, `τ = u + iv`.
-/

noncomputable section

namespace TauCeti.QSeries

section QM3

set_option linter.unusedSectionVars false

open Complex Filter Asymptotics MeasureTheory
open UpperHalfPlane hiding I
open scoped Topology Real MatrixGroups ModularForm Manifold ComplexConjugate Pointwise
open scoped OnePoint

/-! ### Local stand-ins for Tau Ceti and QM.2 declarations -/

/-- Stand-in for `TauCeti.lowerIncompleteGamma`: `γ(s, x) = ∫₀ˣ t^{s-1} e^{-t} dt` for `s > 0`. -/
def lowerIncompleteGammaLocal (s x : ℝ) : ℝ :=
  if 0 < s then ∫ t in (0 : ℝ)..max x 0, t ^ (s - 1) * Real.exp (-t) else 0

/-- Stand-in for `TauCeti.regularizedGamma`: `P(s, x) = γ(s, x) / Γ(s)`. -/
def regularizedGammaLocal (s x : ℝ) : ℝ :=
  if 0 < s then lowerIncompleteGammaLocal s x / Real.Gamma s else 0

/-- Stand-in for `TauCeti.Real.erfc`. -/
def erfcLocal (x : ℝ) : ℝ := 1 - 2 / √π * ∫ t in (0 : ℝ)..x, Real.exp (-t ^ 2)

/-- Stand-in for `CuspForm.peterssonInnerCosets` (Tau Ceti): the unnormalised Petersson product
over `Γ\ℍ`, as a sum over the cosets of `Γ·{±1}` of level-one integrals over `ModularGroup.fd`. -/
def peterssonInnerCosetsLocal (Γ : Subgroup SL(2, ℤ)) (k : ℤ)
    (f g : CuspForm (Γ.map (Matrix.SpecialLinearGroup.mapGL ℝ)) k) : ℂ :=
  ∑ᶠ q : SL(2, ℤ) ⧸ (Γ ⊔ Subgroup.center SL(2, ℤ)),
    ∫ τ in ModularGroup.fd, petersson k (⇑f ∣[k] q.out⁻¹) (⇑g ∣[k] q.out⁻¹) τ

/-- Stand-in for QM.2's `besselJ`: `J_ν(z) = (z/2)^ν Σ_j (-1)^j (z²/4)^j / (j! Γ(ν + j + 1))`. -/
def besselJLocal (ν z : ℂ) : ℂ :=
  (z / 2) ^ ν * ∑' j : ℕ, (-1) ^ j * (z ^ 2 / 4) ^ j / (j.factorial * Complex.Gamma (ν + j + 1))

/-- Stand-in for QM.2's `modifiedBesselI`. -/
def besselILocal (ν z : ℂ) : ℂ :=
  (z / 2) ^ ν * ∑' j : ℕ, (z ^ 2 / 4) ^ j / (j.factorial * Complex.Gamma (ν + j + 1))

/-! ### Wirtinger derivatives (QM.3/wirtinger-derivatives) -/

namespace Complex

/-- The Wirtinger derivative `∂F(z) = ½(DF(z)(1) - i·DF(z)(i))`, `DF` the real Fréchet
derivative (junk value `0` where `F` is not real-differentiable). -/
def wirtingerDeriv (F : ℂ → ℂ) (z : ℂ) : ℂ :=
  (1 / 2 : ℂ) * (fderiv ℝ F z 1 - I * fderiv ℝ F z I)

/-- The Wirtinger derivative `∂̄F(z) = ½(DF(z)(1) + i·DF(z)(i))`. -/
def wirtingerDerivBar (F : ℂ → ℂ) (z : ℂ) : ℂ :=
  (1 / 2 : ℂ) * (fderiv ℝ F z 1 + I * fderiv ℝ F z I)

theorem wirtingerDerivBar_eq_zero_of_differentiableAt {F : ℂ → ℂ} {z : ℂ}
    (hF : DifferentiableAt ℂ F z) : wirtingerDerivBar F z = 0 := sorry

theorem differentiableAt_of_wirtingerDerivBar_eq_zero {F : ℂ → ℂ} {z : ℂ}
    (hF : DifferentiableAt ℝ F z) (h : wirtingerDerivBar F z = 0) : DifferentiableAt ℂ F z := sorry

theorem wirtingerDeriv_eq_deriv {F : ℂ → ℂ} {z : ℂ} (hF : DifferentiableAt ℂ F z) :
    wirtingerDeriv F z = deriv F z := sorry

theorem wirtingerDerivBar_conj {F : ℂ → ℂ} {z : ℂ} (hF : DifferentiableAt ℝ F z) :
    wirtingerDerivBar (fun w ↦ conj (F w)) z = conj (wirtingerDeriv F z) := sorry

/-- Leibniz rule for `∂̄` (the same holds for `∂`). -/
theorem wirtingerDerivBar_mul {F G : ℂ → ℂ} {z : ℂ} (hF : DifferentiableAt ℝ F z)
    (hG : DifferentiableAt ℝ G z) :
    wirtingerDerivBar (F * G) z = wirtingerDerivBar F z * G z + F z * wirtingerDerivBar G z :=
  sorry

/-- `4∂∂̄ = Δ`, Mathlib's Laplacian on `ℂ = ℝ²`. -/
theorem four_mul_wirtingerDeriv_wirtingerDerivBar {F : ℂ → ℂ} {z : ℂ}
    (hF : ContDiffAt ℝ 2 F z) :
    4 * wirtingerDeriv (wirtingerDerivBar F) z = Laplacian.laplacian F z := sorry

end Complex

/-- Unit test `wirtingerDerivBar_id_test`: `∂̄(z ↦ z) = 0`. -/
example (z : ℂ) : Complex.wirtingerDerivBar (fun w ↦ w) z = 0 := sorry

/-- Unit test `wirtingerDerivBar_conj_test`: `∂̄(z ↦ z̄) = 1`. -/
example (z : ℂ) : Complex.wirtingerDerivBar (fun w ↦ conj w) z = 1 := sorry

/-- Unit test `wirtingerDeriv_conj_test`: `∂(z ↦ z̄) = 0`. -/
example (z : ℂ) : Complex.wirtingerDeriv (fun w ↦ conj w) z = 0 := sorry

/-- Unit test `wirtingerDerivBar_im_test`: `∂̄(z ↦ Im z) = i/2`. -/
example (z : ℂ) : Complex.wirtingerDerivBar (fun w ↦ (w.im : ℂ)) z = I / 2 := sorry

/-- `∂_τ f` for `f : ℍ → ℂ`, through `f ∘ ofComplex`. -/
def dTau (f : ℍ → ℂ) (τ : ℍ) : ℂ := Complex.wirtingerDeriv (f ∘ ofComplex) τ

/-- `∂_τ̄ f` for `f : ℍ → ℂ`, through `f ∘ ofComplex`. -/
def dTauBar (f : ℍ → ℂ) (τ : ℍ) : ℂ := Complex.wirtingerDerivBar (f ∘ ofComplex) τ

/-- `∂_τ ∂_τ̄ f`. -/
def dTauDTauBar (f : ℍ → ℂ) (τ : ℍ) : ℂ :=
  Complex.wirtingerDeriv (Complex.wirtingerDerivBar (f ∘ ofComplex)) τ

/-- `D = (2πi)⁻¹ ∂_τ` (`= q d/dq` on holomorphic functions). -/
def qDeriv (f : ℍ → ℂ) (τ : ℍ) : ℂ := (2 * π * I)⁻¹ * dTau f τ

/-- `f` is of class `C²` on `ℍ` (through `f ∘ ofComplex`). -/
def IsC2OnUpper (f : ℍ → ℂ) : Prop := ContDiffOn ℝ 2 (f ∘ ofComplex) {z : ℂ | 0 < z.im}

/-- The function `τ ↦ e(nτ/h)`. -/
def fourierMode (n : ℤ) (h : ℝ) (τ : ℍ) : ℂ := cexp (2 * π * I * n * (τ : ℂ) / h)

/-! ### The weight-`k` hyperbolic Laplacian (QM.3/weight-k-hyperbolic-laplacian) -/

/-- `Δ_k f = -4v²∂_τ∂_τ̄ f + 2ikv ∂_τ̄ f` (Bruinier–Funke (3.1)), for real `k`. -/
def hyperbolicLaplacian (k : ℝ) (f : ℍ → ℂ) (τ : ℍ) : ℂ :=
  -4 * (τ.im : ℂ) ^ 2 * dTauDTauBar f τ + 2 * I * k * τ.im * dTauBar f τ

theorem hyperbolicLaplacian_eq_laplacian (k : ℝ) {f : ℍ → ℂ} {τ : ℍ}
    (hf : ContDiffAt ℝ 2 (f ∘ ofComplex) τ) :
    hyperbolicLaplacian k f τ =
      -(τ.im : ℂ) ^ 2 * Laplacian.laplacian (f ∘ ofComplex) (τ : ℂ) +
        2 * I * k * τ.im * dTauBar f τ := sorry

theorem hyperbolicLaplacian_zero_weight {f : ℍ → ℂ} {τ : ℍ}
    (hf : ContDiffAt ℝ 2 (f ∘ ofComplex) τ) :
    hyperbolicLaplacian 0 f τ = -(τ.im : ℂ) ^ 2 * Laplacian.laplacian (f ∘ ofComplex) (τ : ℂ) :=
  sorry

theorem hyperbolicLaplacian_add (k : ℝ) {f g : ℍ → ℂ} (hf : IsC2OnUpper f) (hg : IsC2OnUpper g)
    (c : ℂ) :
    hyperbolicLaplacian k (f + g) = hyperbolicLaplacian k f + hyperbolicLaplacian k g ∧
      hyperbolicLaplacian k (c • f) = c • hyperbolicLaplacian k f := sorry

theorem hyperbolicLaplacian_of_mdifferentiable (k : ℝ) {f : ℍ → ℂ} (hf : MDiff f) :
    hyperbolicLaplacian k f = 0 := sorry

theorem hyperbolicLaplacian_im_rpow (k s : ℝ) (τ : ℍ) :
    hyperbolicLaplacian k (fun τ ↦ ((τ.im ^ s : ℝ) : ℂ)) τ = ((s * (1 - k - s) * τ.im ^ s : ℝ) : ℂ) :=
  sorry

/-- Zwegers' weight-1/2 Casimir operator `Ω_{1/2} = -4v²∂_τ∂_τ̄ + iv∂_τ̄ + 3/16` is `Δ_{1/2} + 3/16`. -/
theorem hyperbolicLaplacian_half_add_eq_casimir (f : ℍ → ℂ) (τ : ℍ) :
    -4 * (τ.im : ℂ) ^ 2 * dTauDTauBar f τ + I * τ.im * dTauBar f τ + 3 / 16 * f τ =
      hyperbolicLaplacian (1 / 2) f τ + 3 / 16 * f τ := sorry

/-- Unit test `hyperbolicLaplacian_one_test`: `Δ_k 1 = 0`. -/
example (k : ℝ) : hyperbolicLaplacian k (fun _ ↦ 1) = 0 := sorry

/-- Unit test `hyperbolicLaplacian_im_rpow_one_sub_test`: `Δ_k(v^{1-k}) = 0`. -/
example (k : ℝ) : hyperbolicLaplacian k (fun τ ↦ ((τ.im ^ (1 - k) : ℝ) : ℂ)) = 0 := sorry

/-- Unit test `hyperbolicLaplacian_im_test`: `Δ_k(v) = -k v`. -/
example (k : ℝ) (τ : ℍ) : hyperbolicLaplacian k (fun τ ↦ (τ.im : ℂ)) τ = -k * τ.im := sorry

/-- Unit test `hyperbolicLaplacian_conj_test`: `Δ_k(τ̄) = 2ik v`; a first-order term
`ikv(∂_u - i∂_v)` would annihilate `τ̄`. -/
example (k : ℝ) (τ : ℍ) :
    hyperbolicLaplacian k (fun τ ↦ conj (τ : ℂ)) τ = 2 * I * k * τ.im := sorry

/-! ### Raising and lowering operators (QM.3/maass-raising-operator, QM.3/maass-lowering-operator) -/

/-- `R_k f = 2i∂_τ f + (k/v) f`. -/
def raisingOperator (k : ℝ) (f : ℍ → ℂ) (τ : ℍ) : ℂ :=
  2 * I * dTau f τ + k / τ.im * f τ

theorem raisingOperator_eq (k : ℝ) (f : ℍ → ℂ) (τ : ℍ) :
    raisingOperator k f τ = -4 * π * qDeriv f τ + k / τ.im * f τ := sorry

theorem raisingOperator_add (k : ℝ) {f g : ℍ → ℂ}
    (hf : ∀ τ : ℍ, DifferentiableAt ℝ (f ∘ ofComplex) τ)
    (hg : ∀ τ : ℍ, DifferentiableAt ℝ (g ∘ ofComplex) τ) (c : ℂ) :
    raisingOperator k (f + g) = raisingOperator k f + raisingOperator k g ∧
      raisingOperator k (c • f) = c • raisingOperator k f := sorry

theorem raisingOperator_qParam (k : ℝ) (n : ℤ) (τ : ℍ) :
    raisingOperator k (fourierMode n 1) τ = (-4 * π * n + k / τ.im) * fourierMode n 1 τ := sorry

/-- Unit test `raisingOperator_one_test`: `R_k 1 = k/v`. -/
example (k : ℝ) (τ : ℍ) : raisingOperator k (fun _ ↦ 1) τ = k / τ.im := sorry

/-- Unit test `raisingOperator_qParam_test`: `R_0 e(τ) = -4π e(τ)`. -/
example (τ : ℍ) : raisingOperator 0 (fourierMode 1 1) τ = -4 * π * fourierMode 1 1 τ := sorry

/-- Unit test `raisingOperator_im_rpow_neg_test`: `R_k(v^{-k}) = 0` although `v^{-k}` is not
holomorphic. -/
example (k : ℝ) (hk : k ≠ 0) :
    raisingOperator k (fun τ ↦ ((τ.im ^ (-k) : ℝ) : ℂ)) = 0 ∧
      ¬ MDiff (fun τ : ℍ ↦ ((τ.im ^ (-k) : ℝ) : ℂ)) := sorry

/-- `L_k f = -2iv² ∂_τ̄ f` (independent of `k`; the index records the weight change `k ↦ k - 2`). -/
def loweringOperator (_k : ℝ) (f : ℍ → ℂ) (τ : ℍ) : ℂ :=
  -2 * I * (τ.im : ℂ) ^ 2 * dTauBar f τ

theorem loweringOperator_eq_zero_iff (k : ℝ) {f : ℍ → ℂ}
    (hf : ∀ τ : ℍ, DifferentiableAt ℝ (f ∘ ofComplex) τ) :
    (∀ τ, loweringOperator k f τ = 0) ↔ MDiff f := sorry

theorem loweringOperator_add (k : ℝ) {f g : ℍ → ℂ}
    (hf : ∀ τ : ℍ, DifferentiableAt ℝ (f ∘ ofComplex) τ)
    (hg : ∀ τ : ℍ, DifferentiableAt ℝ (g ∘ ofComplex) τ) (c : ℂ) :
    loweringOperator k (f + g) = loweringOperator k f + loweringOperator k g ∧
      loweringOperator k (c • f) = c • loweringOperator k f := sorry

theorem loweringOperator_im_rpow (k s : ℝ) (τ : ℍ) :
    loweringOperator k (fun τ ↦ ((τ.im ^ s : ℝ) : ℂ)) τ = ((s * τ.im ^ (s + 1) : ℝ) : ℂ) := sorry

/-- Unit test `loweringOperator_qParam_test`: `L_k e(nτ) = 0`. -/
example (k : ℝ) (n : ℤ) : loweringOperator k (fourierMode n 1) = 0 := sorry

/-- Unit test `loweringOperator_im_one_sub_test`: `L_k(v^{1-k}) = (1 - k)v^{2-k}`. -/
example (k : ℝ) (τ : ℍ) :
    loweringOperator k (fun τ ↦ ((τ.im ^ (1 - k) : ℝ) : ℂ)) τ = (((1 - k) * τ.im ^ (2 - k) : ℝ) : ℂ) :=
  sorry

/-! ### The upper incomplete gamma function (QM.3/upper-incomplete-gamma) -/

/-- `Γ(s, x) = ∫_x^∞ t^{s-1} e^{-t} dt` for `x > 0` (every real `s`), and `0` for `x ≤ 0`. -/
def upperIncompleteGamma (s x : ℝ) : ℝ :=
  if 0 < x then ∫ t in Set.Ioi x, t ^ (s - 1) * Real.exp (-t) else 0

theorem upperIncompleteGamma_add_lowerIncompleteGamma {s x : ℝ} (hs : 0 < s) (hx : 0 < x) :
    upperIncompleteGamma s x + lowerIncompleteGammaLocal s x = Real.Gamma s := sorry

theorem upperIncompleteGamma_add_one (s : ℝ) {x : ℝ} (hx : 0 < x) :
    upperIncompleteGamma (s + 1) x = s * upperIncompleteGamma s x + x ^ s * Real.exp (-x) := sorry

theorem hasDerivAt_upperIncompleteGamma (s : ℝ) {x : ℝ} (hx : 0 < x) :
    HasDerivAt (upperIncompleteGamma s) (-(x ^ (s - 1) * Real.exp (-x))) x := sorry

theorem upperIncompleteGamma_one {x : ℝ} (hx : 0 < x) : upperIncompleteGamma 1 x = Real.exp (-x) :=
  sorry

theorem upperIncompleteGamma_nat_add_one (n : ℕ) {x : ℝ} (hx : 0 < x) :
    upperIncompleteGamma (n + 1) x =
      n.factorial * Real.exp (-x) * ∑ j ∈ Finset.range (n + 1), x ^ j / j.factorial := sorry

theorem upperIncompleteGamma_half_sq {x : ℝ} (hx : 0 < x) :
    upperIncompleteGamma (1 / 2) (x ^ 2) = √π * erfcLocal x := sorry

theorem upperIncompleteGamma_isEquivalent (s : ℝ) :
    (upperIncompleteGamma s) ~[atTop] fun x ↦ x ^ (s - 1) * Real.exp (-x) := sorry

theorem upperIncompleteGamma_pos (s : ℝ) {x : ℝ} (hx : 0 < x) : 0 < upperIncompleteGamma s x :=
  sorry

/-- Unit test `upperIncompleteGamma_one_test`: `Γ(1, x) = e^{-x}`. -/
example {x : ℝ} (hx : 0 < x) : upperIncompleteGamma 1 x = Real.exp (-x) := sorry

/-- Unit test `upperIncompleteGamma_two_test`: `Γ(2, x) = (1 + x)e^{-x}`. -/
example {x : ℝ} (hx : 0 < x) : upperIncompleteGamma 2 x = (1 + x) * Real.exp (-x) := sorry

/-- Unit test `upperIncompleteGamma_tendsto_zero_test`: `Γ(s, x) → Γ(s)` as `x → 0⁺` (`s > 0`). -/
example {s : ℝ} (hs : 0 < s) :
    Tendsto (upperIncompleteGamma s) (𝓝[>] 0) (𝓝 (Real.Gamma s)) := sorry

/-- Unit test `upperIncompleteGamma_ne_lower_test`: `Γ(1, 1) = e^{-1} ≠ 1 - e^{-1} = γ(1, 1)`. -/
example :
    upperIncompleteGamma 1 1 = Real.exp (-1) ∧ lowerIncompleteGammaLocal 1 1 = 1 - Real.exp (-1) ∧
      Real.exp (-1) ≠ 1 - Real.exp (-1) := sorry

/-- Unit test `upperIncompleteGamma_zero_pos_test`: `0 < Γ(0, 1)`. -/
example : 0 < upperIncompleteGamma 0 1 := sorry

/-- Unit test `loweringOperator_incompleteGamma_test`: for `n < 0`, `k ≤ 0`:
`L_k(Γ(1-k, 4π|n|v)e(nτ)) = -v^{2-k}(4π|n|)^{1-k}e(nτ̄)` (not `-2v^{2-k}…` as printed in
Bruinier–Funke Lemma 3.1). -/
example (k : ℤ) (hk : k ≤ 0) (n : ℤ) (hn : n < 0) (τ : ℍ) :
    loweringOperator k (fun τ ↦ (upperIncompleteGamma (1 - k) (4 * π * |n| * τ.im) : ℂ) *
        fourierMode n 1 τ) τ =
      -((τ.im ^ (2 - (k : ℝ)) * (4 * π * |n|) ^ (1 - (k : ℝ)) : ℝ) : ℂ) *
        cexp (2 * π * I * n * conj (τ : ℂ)) := sorry

/-! ### The ξ-operator (QM.3/xi-operator) -/

/-- `ξ_k f = 2i v^k conj(∂_τ̄ f)` (Bruinier–Funke Prop. 3.2), for real `k`. -/
def xiOperator (k : ℝ) (f : ℍ → ℂ) (τ : ℍ) : ℂ :=
  2 * I * ((τ.im ^ k : ℝ) : ℂ) * conj (dTauBar f τ)

theorem xiOperator_eq_lowering (k : ℝ) (f : ℍ → ℂ) (τ : ℍ) :
    xiOperator k f τ = ((τ.im ^ (k - 2) : ℝ) : ℂ) * conj (loweringOperator k f τ) := sorry

theorem xiOperator_eq_raising_conj (k : ℝ) {f : ℍ → ℂ}
    (hf : ∀ τ : ℍ, DifferentiableAt ℝ (f ∘ ofComplex) τ) :
    xiOperator k f = raisingOperator (-k) (fun τ ↦ ((τ.im ^ k : ℝ) : ℂ) * conj (f τ)) := sorry

theorem xiOperator_add (k : ℝ) {f g : ℍ → ℂ}
    (hf : ∀ τ : ℍ, DifferentiableAt ℝ (f ∘ ofComplex) τ)
    (hg : ∀ τ : ℍ, DifferentiableAt ℝ (g ∘ ofComplex) τ) (c : ℂ) :
    xiOperator k (f + g) = xiOperator k f + xiOperator k g ∧
      xiOperator k (c • f) = conj c • xiOperator k f := sorry

theorem xiOperator_eq_zero_iff (k : ℝ) {f : ℍ → ℂ}
    (hf : ∀ τ : ℍ, DifferentiableAt ℝ (f ∘ ofComplex) τ) :
    xiOperator k f = 0 ↔ MDiff f := sorry

theorem xiOperator_im_rpow_one_sub (k : ℝ) :
    xiOperator k (fun τ ↦ ((τ.im ^ (1 - k) : ℝ) : ℂ)) = fun _ ↦ ((1 - k : ℝ) : ℂ) := sorry

/-- Unit test `xiOperator_qParam_test`: `ξ_k e(nτ) = 0`. -/
example (k : ℝ) (n : ℤ) : xiOperator k (fourierMode n 1) = 0 := sorry

/-- Unit test `xiOperator_im_rpow_test`: `ξ_2(-(3/π)v^{-1}) = 3/π`. -/
example : xiOperator 2 (fun τ ↦ -(3 / π : ℂ) * ((τ.im ^ (-1 : ℝ) : ℝ) : ℂ)) = fun _ ↦ (3 / π : ℂ) :=
  sorry

/-- Unit test `xiOperator_not_linear_test`: `ξ_k(i v^{1-k}) = -i(1 - k)`. -/
example (k : ℝ) :
    xiOperator k (fun τ ↦ I * ((τ.im ^ (1 - k) : ℝ) : ℂ)) = fun _ ↦ -I * ((1 - k : ℝ) : ℂ) := sorry

/-- Unit test `xiOperator_incompleteGamma_test`: for `n < 0`, `k ≤ 0`:
`ξ_k(Γ(1-k, 4π|n|v)e(nτ)) = -(4π|n|)^{1-k} e(-nτ)`. -/
example (k : ℤ) (hk : k ≤ 0) (n : ℤ) (hn : n < 0) :
    xiOperator k (fun τ ↦ (upperIncompleteGamma (1 - k) (4 * π * |n| * τ.im) : ℂ) * fourierMode n 1 τ) =
      fun τ ↦ -(((4 * π * |n|) ^ (1 - (k : ℝ)) : ℝ) : ℂ) * fourierMode (-n) 1 τ := sorry

/-! ### Operator identities (QM.3 lemma nodes) -/

/-- QM.3/laplacian-raising-lowering-factorisation: `-Δ_k = L_{k+2}R_k + k = R_{k-2}L_k`. -/
theorem neg_hyperbolicLaplacian_eq (k : ℝ) {f : ℍ → ℂ} (hf : IsC2OnUpper f) :
    -hyperbolicLaplacian k f = loweringOperator (k + 2) (raisingOperator k f) + (k : ℂ) • f ∧
      -hyperbolicLaplacian k f = raisingOperator (k - 2) (loweringOperator k f) := sorry

/-- QM.3/xi-xi-eq-neg-laplacian: `ξ_{2-k} ξ_k = -Δ_k`. -/
theorem xiOperator_xiOperator (k : ℝ) {f : ℍ → ℂ} (hf : IsC2OnUpper f) :
    xiOperator (2 - k) (xiOperator k f) = -hyperbolicLaplacian k f := sorry

/-- QM.3/xi-holomorphic-iff-harmonic: `ξ_k f` is holomorphic iff `Δ_k f = 0`. -/
theorem mdifferentiable_xiOperator_iff (k : ℝ) {f : ℍ → ℂ} (hf : IsC2OnUpper f) :
    MDiff (xiOperator k f) ↔ hyperbolicLaplacian k f = 0 := sorry

/-- QM.3/raising-lowering-slash-equivariance. -/
theorem raisingOperator_slash (k : ℤ) (γ : GL (Fin 2) ℝ) (hγ : γ.det = 1) {f : ℍ → ℂ}
    (hf : ∀ τ : ℍ, DifferentiableAt ℝ (f ∘ ofComplex) τ) :
    raisingOperator k (f ∣[k] γ) = (raisingOperator k f) ∣[k + 2] γ ∧
      loweringOperator k (f ∣[k] γ) = (loweringOperator k f) ∣[k - 2] γ := sorry

/-- QM.3/laplacian-slash-equivariance. -/
theorem hyperbolicLaplacian_slash (k : ℤ) (γ : GL (Fin 2) ℝ) (hγ : γ.det = 1) {f : ℍ → ℂ}
    (hf : IsC2OnUpper f) : hyperbolicLaplacian k (f ∣[k] γ) = (hyperbolicLaplacian k f) ∣[k] γ :=
  sorry

/-- QM.3/xi-slash-equivariance. -/
theorem xiOperator_slash (k : ℤ) (γ : GL (Fin 2) ℝ) (hγ : γ.det = 1) {f : ℍ → ℂ}
    (hf : ∀ τ : ℍ, DifferentiableAt ℝ (f ∘ ofComplex) τ) :
    xiOperator k (f ∣[k] γ) = (xiOperator k f) ∣[2 - k] γ := sorry

/-! ### Iterated raising (QM.3/iterated-raising-operator) -/

/-- `R^0_k = id`, `R^{n+1}_k = R_{k+2n} ∘ R^n_k`. -/
def iteratedRaising (k : ℝ) : ℕ → (ℍ → ℂ) → ℍ → ℂ
  | 0, f => f
  | n + 1, f => raisingOperator (k + 2 * n) (iteratedRaising k n f)

theorem iteratedRaising_succ (k : ℝ) (n : ℕ) (f : ℍ → ℂ) :
    iteratedRaising k (n + 1) f = raisingOperator (k + 2 * n) (iteratedRaising k n f) := rfl

/-- Lewis–Zagier closed form: `R^n_k = (-4π)^n Σ_{m ≤ n} n!/(n-m)! binom(n+k-1, m)
(-1/(4πv))^m D^{n-m}`. -/
theorem iteratedRaising_eq_sum (k : ℝ) (n : ℕ) {f : ℍ → ℂ}
    (hf : ContDiffOn ℝ n (f ∘ ofComplex) {z : ℂ | 0 < z.im}) (τ : ℍ) :
    iteratedRaising k n f τ = (-4 * π : ℂ) ^ n * ∑ m ∈ Finset.range (n + 1),
      ((n.factorial / (n - m).factorial : ℕ) : ℂ) *
        (((descPochhammer ℝ m).eval ((n : ℝ) + k - 1) / m.factorial : ℝ) : ℂ) *
        (-1 / (4 * π * τ.im) : ℂ) ^ m * (qDeriv^[n - m] f) τ := sorry

theorem iteratedRaising_slash (k : ℤ) (n : ℕ) (γ : GL (Fin 2) ℝ) (hγ : γ.det = 1) {f : ℍ → ℂ}
    (hf : ContDiffOn ℝ n (f ∘ ofComplex) {z : ℂ | 0 < z.im}) :
    iteratedRaising k n (f ∣[k] γ) = (iteratedRaising k n f) ∣[k + 2 * n] γ := sorry

/-- QM.3/bol-identity: `D^{k-1} = (-4π)^{1-k} R^{k-1}_{2-k}`, hence `D^{k-1}` intertwines the
slash actions of weights `2 - k` and `k`. -/
theorem bol_identity (k : ℕ) (hk : 2 ≤ k) {f : ℍ → ℂ}
    (hf : ContDiffOn ℝ (k - 1) (f ∘ ofComplex) {z : ℂ | 0 < z.im}) :
    qDeriv^[k - 1] f = ((-4 * π : ℂ) ^ (1 - (k : ℤ))) • iteratedRaising (2 - k) (k - 1) f ∧
      ∀ γ : GL (Fin 2) ℝ, γ.det = 1 →
        qDeriv^[k - 1] (f ∣[(2 - k : ℤ)] γ) = (qDeriv^[k - 1] f) ∣[(k : ℤ)] γ := sorry

/-- Unit test `iteratedRaising_zero_test`: `R^0_k f = f`. -/
example (k : ℝ) (f : ℍ → ℂ) : iteratedRaising k 0 f = f := sorry

/-- Unit test `iteratedRaising_one_test`: `R^1_k f = R_k f`. -/
example (k : ℝ) (f : ℍ → ℂ) : iteratedRaising k 1 f = raisingOperator k f := sorry

/-- Unit test `iteratedRaising_qParam_test`: `R^2_0 e(τ) = (16π² - 8π/v) e(τ)`. -/
example (τ : ℍ) :
    iteratedRaising 0 2 (fourierMode 1 1) τ = (16 * π ^ 2 - 8 * π / τ.im) * fourierMode 1 1 τ := sorry

/-- Unit test `iteratedRaising_bol_vanishing_test`: `R^1_0 1 = 0` but `R^1_1 1 = 1/v ≠ 0`. -/
example (τ : ℍ) :
    iteratedRaising 0 1 (fun _ ↦ 1) τ = 0 ∧ iteratedRaising 1 1 (fun _ ↦ 1) τ = 1 / τ.im := sorry

/-! ### Non-holomorphic Fourier basis (QM.3 lemma nodes) -/

/-- QM.3/nonholomorphic-fourier-basis-decaying: for `n < 0`, `Γ(1-w, 4π|n|v/h)e(nτ/h)` is
`Δ_w`-harmonic with `ξ_w`-image `-(4π|n|/h)^{1-w} e(|n|τ/h)`. -/
theorem xiOperator_decayingBasis (w h : ℝ) (hh : 0 < h) (n : ℤ) (hn : n < 0) :
    hyperbolicLaplacian w (fun τ ↦ (upperIncompleteGamma (1 - w) (4 * π * |n| * τ.im / h) : ℂ) *
        fourierMode n h τ) = 0 ∧
      xiOperator w (fun τ ↦ (upperIncompleteGamma (1 - w) (4 * π * |n| * τ.im / h) : ℂ) *
        fourierMode n h τ) = fun τ ↦ -(((4 * π * |n| / h) ^ (1 - w) : ℝ) : ℂ) * fourierMode (-n) h τ :=
  sorry

/-- The growing basis function `ψ_n = e^{-W}(∫_1^W s^{-w}e^{2s} ds)·e(nu/h)`, `W = 2πnv/h`. -/
def growingBasis (w h : ℝ) (n : ℤ) (τ : ℍ) : ℂ :=
  (Real.exp (-(2 * π * n * τ.im / h)) *
      ∫ s in (1 : ℝ)..(2 * π * n * τ.im / h), s ^ (-w) * Real.exp (2 * s) : ℝ) *
    cexp (2 * π * I * n * τ.re / h)

/-- QM.3/nonholomorphic-fourier-basis-growing. -/
theorem xiOperator_growingBasis (w h : ℝ) (hh : 0 < h) (n : ℤ) (hn : 0 < n) :
    hyperbolicLaplacian w (growingBasis w h n) = 0 ∧
      xiOperator w (growingBasis w h n) =
        fun τ ↦ (((2 * π * n / h) ^ (1 - w) : ℝ) : ℂ) * fourierMode (-n) h τ := sorry

/-! ### Exponential growth at cusps (QM.3/exponential-growth-at-cusps) -/

namespace OnePoint

/-- `f` has exponential growth at `c` in weight `k`. -/
def IsExpGrowthAt (c : _root_.OnePoint ℝ) (f : ℍ → ℂ) (k : ℤ) : Prop :=
  ∀ g : GL (Fin 2) ℝ, g • ∞ = c →
    ∃ C : ℝ, (f ∣[k] g) =O[atImInfty] fun τ : ℍ ↦ Real.exp (C * τ.im)

theorem IsBoundedAt.isExpGrowthAt {c : _root_.OnePoint ℝ} {f : ℍ → ℂ} {k : ℤ}
    (h : c.IsBoundedAt f k) : IsExpGrowthAt c f k := sorry

theorem IsExpGrowthAt.add {c : _root_.OnePoint ℝ} {f g : ℍ → ℂ} {k : ℤ} (hf : IsExpGrowthAt c f k)
    (hg : IsExpGrowthAt c g k) : IsExpGrowthAt c (f + g) k ∧ ∀ a : ℂ, IsExpGrowthAt c (a • f) k :=
  sorry

theorem IsExpGrowthAt.mul {c : _root_.OnePoint ℝ} {f g : ℍ → ℂ} {k l : ℤ}
    (hf : IsExpGrowthAt c f k) (hg : IsExpGrowthAt c g l) : IsExpGrowthAt c (f * g) (k + l) := sorry

theorem IsExpGrowthAt.smul_iff (c : _root_.OnePoint ℝ) (f : ℍ → ℂ) (k : ℤ) (g : GL (Fin 2) ℝ) :
    IsExpGrowthAt (g • c) f k ↔ IsExpGrowthAt c (f ∣[k] g) k := sorry

end OnePoint

/-- `f` has exponential growth at every cusp of `Γ` in weight `k`. -/
def IsExpGrowthAtCusps (Γ : Subgroup (GL (Fin 2) ℝ)) (f : ℍ → ℂ) (k : ℤ) : Prop :=
  ∀ c : _root_.OnePoint ℝ, IsCusp c Γ → OnePoint.IsExpGrowthAt c f k

/-- Unit test `isExpGrowthAt_qParam_inv_test`: `e(-τ)` has exponential growth at `∞`. -/
example : OnePoint.IsExpGrowthAt ∞ (fourierMode (-1) 1) 0 := sorry

/-- Unit test `not_isBoundedAt_qParam_inv_test`: `e(-τ)` is not bounded at `∞`. -/
example : ¬ (∞ : _root_.OnePoint ℝ).IsBoundedAt (fourierMode (-1) 1) 0 := sorry

/-- Unit test `not_isExpGrowthAt_exp_qParam_inv_test`: `exp(e(-τ))` has no exponential growth
at `∞`. -/
example : ¬ OnePoint.IsExpGrowthAt ∞ (fun τ ↦ cexp (fourierMode (-1) 1 τ)) 0 := sorry

/-- Unit test `isExpGrowthAt_zero_test`: the zero function has exponential growth everywhere. -/
example (c : _root_.OnePoint ℝ) (k : ℤ) : OnePoint.IsExpGrowthAt c 0 k := sorry

/-! ### Weakly holomorphic modular forms (QM.3/weakly-holomorphic-modular-form) -/

/-- Weakly holomorphic modular forms of weight `k` for `Γ`: slash-invariant, holomorphic on `ℍ`,
with exponential growth at every cusp. -/
structure WeaklyHolomorphicModularForm (Γ : Subgroup (GL (Fin 2) ℝ)) (k : ℤ)
    extends SlashInvariantForm Γ k where
  holo' : MDiff (toSlashInvariantForm : ℍ → ℂ)
  expGrowth' {c : _root_.OnePoint ℝ} (hc : IsCusp c Γ) : OnePoint.IsExpGrowthAt c toFun k

namespace WeaklyHolomorphicModularForm

variable {Γ : Subgroup (GL (Fin 2) ℝ)} {k : ℤ}

instance funLike : FunLike (WeaklyHolomorphicModularForm Γ k) ℍ ℂ where
  coe f := f.toFun
  coe_injective f g h := by cases f; cases g; congr; exact DFunLike.ext' h

/-- Pointwise additive group structure. -/
instance instAddCommGroup : AddCommGroup (WeaklyHolomorphicModularForm Γ k) := sorry

/-- `M^!_k(Γ)` is a `ℂ`-vector space under pointwise operations. -/
instance instModule [Γ.HasDetOne] : Module ℂ (WeaklyHolomorphicModularForm Γ k) := sorry

/-- The product `M^!_k × M^!_l → M^!_{k+l}`. -/
def mul {l : ℤ} [Γ.HasDetPlusMinusOne] (f : WeaklyHolomorphicModularForm Γ k)
    (g : WeaklyHolomorphicModularForm Γ l) : WeaklyHolomorphicModularForm Γ (k + l) where
  toFun := f * g
  slash_action_eq' := sorry
  holo' := sorry
  expGrowth' := sorry

/-- `1/Δ ∈ M^!_{-12}(SL(2, ℤ))`. -/
def invDiscriminant : WeaklyHolomorphicModularForm 𝒮ℒ (-12) where
  toFun τ := (ModularForm.discriminant τ)⁻¹
  slash_action_eq' := sorry
  holo' := sorry
  expGrowth' := sorry

theorem eq_zero_of_odd (hΓ : -1 ∈ Γ) (hk : Odd k) (f : WeaklyHolomorphicModularForm Γ k) :
    f = 0 := sorry

/-- Restriction to an arithmetic subgroup `Γ' ≤ Γ` (identity on functions). -/
def ofLe {Γ' : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] [Γ'.IsArithmetic] (hΓ : Γ' ≤ Γ)
    (f : WeaklyHolomorphicModularForm Γ k) : WeaklyHolomorphicModularForm Γ' k where
  toFun := f
  slash_action_eq' γ hγ := f.slash_action_eq' γ (hΓ hγ)
  holo' := f.holo'
  expGrowth' := sorry

end WeaklyHolomorphicModularForm

namespace ModularForm

/-- The `ℂ`-linear inclusion `M_k(Γ) → M^!_k(Γ)`. -/
def toWeaklyHolomorphic {Γ : Subgroup (GL (Fin 2) ℝ)} {k : ℤ} [Γ.HasDetOne] :
    ModularForm Γ k →ₗ[ℂ] WeaklyHolomorphicModularForm Γ k where
  toFun f :=
    { toFun := f
      slash_action_eq' := f.slash_action_eq'
      holo' := f.holo'
      expGrowth' := fun hc ↦ OnePoint.IsBoundedAt.isExpGrowthAt (f.bdd_at_cusps' hc) }
  map_add' := sorry
  map_smul' := sorry

end ModularForm

/-- Unit test `inv_discriminant_not_bounded_test`: `1/Δ` is not
bounded at `∞`. -/
example : ¬ (∞ : _root_.OnePoint ℝ).IsBoundedAt WeaklyHolomorphicModularForm.invDiscriminant (-12) :=
  sorry

/-- Unit test `toWeaklyHolomorphic_injective_test`: the inclusion
`M_k(Γ) → M^!_k(Γ)` is injective and preserves the underlying function. -/
example {Γ : Subgroup (GL (Fin 2) ℝ)} {k : ℤ} [Γ.HasDetOne] :
    Function.Injective (ModularForm.toWeaklyHolomorphic (Γ := Γ) (k := k)) ∧
      ∀ f : ModularForm Γ k, ⇑(ModularForm.toWeaklyHolomorphic f) = ⇑f := sorry

/-- Unit test `weaklyHolomorphic_levelOne_odd_test`: for odd `k`,
`M^!_k(SL(2, ℤ)) = 0`. -/
example {k : ℤ} (hk : Odd k) (f : WeaklyHolomorphicModularForm 𝒮ℒ k) : f = 0 := sorry

/-- Unit test `inv_discriminant_expansion_test`:
`1/Δ(τ) - (e(-τ) + 24) = O(e^{-2πv})`. -/
example :
    (fun τ : ℍ ↦ WeaklyHolomorphicModularForm.invDiscriminant τ - (fourierMode (-1) 1 τ + 24)) =O[atImInfty]
      fun τ : ℍ ↦ Real.exp (-2 * π * τ.im) := sorry

/-! ### Harmonic weak Maass forms (QM.3/harmonic-maass-form) -/

/-- Harmonic weak Maass forms of weight `k` for `Γ` (Bruinier–Funke §3, scalar case): `C²`,
slash-invariant, `Δ_k`-harmonic, with exponential growth at every cusp. -/
structure HarmonicMaassForm (Γ : Subgroup (GL (Fin 2) ℝ)) (k : ℤ)
    extends SlashInvariantForm Γ k where
  contDiff' : IsC2OnUpper toFun
  harmonic' : hyperbolicLaplacian k toFun = 0
  expGrowth' {c : _root_.OnePoint ℝ} (hc : IsCusp c Γ) : OnePoint.IsExpGrowthAt c toFun k

namespace HarmonicMaassForm

variable {Γ : Subgroup (GL (Fin 2) ℝ)} {k : ℤ}

instance funLike : FunLike (HarmonicMaassForm Γ k) ℍ ℂ where
  coe f := f.toFun
  coe_injective f g h := by cases f; cases g; congr; exact DFunLike.ext' h

/-- Pointwise additive group structure. -/
instance instAddCommGroup : AddCommGroup (HarmonicMaassForm Γ k) := sorry

/-- `H_k(Γ)` is a `ℂ`-vector space. -/
instance instModule [Γ.HasDetOne] : Module ℂ (HarmonicMaassForm Γ k) := sorry

theorem hyperbolicLaplacian_eq_zero (f : HarmonicMaassForm Γ k) :
    hyperbolicLaplacian k f = 0 := f.harmonic'

/-- Restriction to an arithmetic subgroup `Γ' ≤ Γ`. -/
def ofLe {Γ' : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] [Γ'.IsArithmetic] (hΓ : Γ' ≤ Γ)
    (f : HarmonicMaassForm Γ k) : HarmonicMaassForm Γ' k where
  toFun := f
  slash_action_eq' γ hγ := f.slash_action_eq' γ (hΓ hγ)
  contDiff' := f.contDiff'
  harmonic' := f.harmonic'
  expGrowth' := sorry

theorem eq_zero_of_odd (hΓ : -1 ∈ Γ) (hk : Odd k) (f : HarmonicMaassForm Γ k) : f = 0 := sorry

end HarmonicMaassForm

namespace WeaklyHolomorphicModularForm

/-- The `ℂ`-linear inclusion `M^!_k(Γ) → H_k(Γ)`. -/
def toHarmonic {Γ : Subgroup (GL (Fin 2) ℝ)} {k : ℤ} [Γ.HasDetOne] :
    WeaklyHolomorphicModularForm Γ k →ₗ[ℂ] HarmonicMaassForm Γ k where
  toFun f :=
    { toFun := f
      slash_action_eq' := f.slash_action_eq'
      contDiff' := sorry
      harmonic' := hyperbolicLaplacian_of_mdifferentiable k f.holo'
      expGrowth' := f.expGrowth' }
  map_add' := sorry
  map_smul' := sorry

end WeaklyHolomorphicModularForm

/-- Unit test `harmonic_levelOne_odd_test`: `H_k(SL(2, ℤ)) = 0` for odd `k`. -/
example {k : ℤ} (hk : Odd k) (f : HarmonicMaassForm 𝒮ℒ k) : f = 0 := sorry

/-- Unit test `E2_not_slashInvariant_test`: `E₂|₂S ≠ E₂`, so `E₂` does not
underlie an element of `H_2(SL(2, ℤ))`. -/
example :
    EisensteinSeries.E2 ∣[(2 : ℤ)] ModularGroup.S ≠ EisensteinSeries.E2 ∧
      ¬ ∃ F : HarmonicMaassForm 𝒮ℒ 2, ⇑F = EisensteinSeries.E2 := sorry

/-- Unit test `toHarmonic_coe_test`: the image of `f ∈ M^!_k(Γ)` in `H_k(Γ)`
has underlying function `f`. -/
example {Γ : Subgroup (GL (Fin 2) ℝ)} {k : ℤ} [Γ.HasDetOne] (f : WeaklyHolomorphicModularForm Γ k) :
    ⇑(WeaklyHolomorphicModularForm.toHarmonic f) = ⇑f := sorry

/-! ### The ξ-map and the plus space (QM.3/xi-map, QM.3/harmonic-maass-form-plus-space) -/

namespace HarmonicMaassForm

variable {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] [Γ.HasDetOne] {k : ℤ}

/-- The conjugate-linear map `ξ_k : H_k(Γ) → M^!_{2-k}(Γ)` (Bruinier–Funke Prop. 3.2). -/
def xi (hk : k ≠ 1) : HarmonicMaassForm Γ k →ₗ⋆[ℂ] WeaklyHolomorphicModularForm Γ (2 - k) where
  toFun f :=
    { toFun := xiOperator k f
      slash_action_eq' := sorry
      holo' := sorry
      expGrowth' := sorry }
  map_add' := sorry
  map_smul' := sorry

theorem coe_xi (hk : k ≠ 1) (f : HarmonicMaassForm Γ k) : ⇑(xi hk f) = xiOperator k f := rfl

theorem xi_toHarmonic (hk : k ≠ 1) (g : WeaklyHolomorphicModularForm Γ k) :
    xi hk (WeaklyHolomorphicModularForm.toHarmonic g) = 0 := sorry

theorem xi_ofLe (hk : k ≠ 1) {Γ' : Subgroup (GL (Fin 2) ℝ)} [Γ'.IsArithmetic] [Γ'.HasDetOne]
    (hΓ : Γ' ≤ Γ) (f : HarmonicMaassForm Γ k) : ⇑(xi hk (f.ofLe hΓ)) = ⇑(xi hk f) := rfl

/-- `H_k^+(Γ) = ξ_k^{-1}(S_{2-k}(Γ))`. -/
def plusSpace (hk : k ≠ 1) : Submodule ℂ (HarmonicMaassForm Γ k) where
  carrier := {f | ∃ g : CuspForm Γ (2 - k), ⇑g = xiOperator k f}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

theorem mem_plusSpace_iff (hk : k ≠ 1) (f : HarmonicMaassForm Γ k) :
    f ∈ plusSpace hk ↔ ∃ g : CuspForm Γ (2 - k), ⇑g = xiOperator k f := Iff.rfl

theorem range_toHarmonic_le_plusSpace (hk : k ≠ 1) :
    LinearMap.range (WeaklyHolomorphicModularForm.toHarmonic (Γ := Γ) (k := k)) ≤ plusSpace hk :=
  sorry

theorem plusSpace_eq_range_of_two_le (hk : k ≠ 1) (hk2 : 2 ≤ k) :
    plusSpace hk = LinearMap.range (WeaklyHolomorphicModularForm.toHarmonic (Γ := Γ) (k := k)) :=
  sorry

end HarmonicMaassForm

/-- Unit test `xi_toHarmonic_test`: `ξ_k` vanishes on `M^!_k(Γ)`. -/
example {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] [Γ.HasDetOne] {k : ℤ} (hk : k ≠ 1)
    (g : WeaklyHolomorphicModularForm Γ k) :
    HarmonicMaassForm.xi hk (WeaklyHolomorphicModularForm.toHarmonic g) = 0 := sorry

/-- Unit test `xi_smul_test`: `ξ_k(i f) = -i ξ_k(f)`. -/
example {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] [Γ.HasDetOne] {k : ℤ} (hk : k ≠ 1)
    (f : HarmonicMaassForm Γ k) : HarmonicMaassForm.xi hk (I • f) = -I • HarmonicMaassForm.xi hk f :=
  sorry

/-- Unit test `toHarmonic_mem_plusSpace_test`: `M^!_k(Γ) ⊆ H_k^+(Γ)`. -/
example {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] [Γ.HasDetOne] {k : ℤ} (hk : k ≠ 1)
    (g : WeaklyHolomorphicModularForm Γ k) :
    WeaklyHolomorphicModularForm.toHarmonic g ∈ HarmonicMaassForm.plusSpace hk := sorry

/-- Unit test `plusSpace_eq_range_of_two_le_test`: for `k ≥ 2`,
`H_k^+(Γ) = M^!_k(Γ)`. -/
example {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] [Γ.HasDetOne] {k : ℤ} (hk : k ≠ 1)
    (hk2 : 2 ≤ k) (f : HarmonicMaassForm Γ k) :
    f ∈ HarmonicMaassForm.plusSpace hk ↔
      ∃ g : WeaklyHolomorphicModularForm Γ k, WeaklyHolomorphicModularForm.toHarmonic g = f := sorry

/-! ### Fourier coefficients, holomorphic and principal parts (QM.3/holomorphic-part,
QM.3/principal-part) -/

/-- The `n`-th Fourier coefficient of `u ↦ f(u + iv)` for the period `h`:
`a(n; v) = h⁻¹ ∫₀ʰ f(u + iv) e(-nu/h) du`. -/
def fourierCoeffAt (h : ℝ) (f : ℍ → ℂ) (n : ℤ) (v : ℝ) : ℂ :=
  h⁻¹ * ∫ u in (0 : ℝ)..h, f (ofComplex (u + v * I)) * cexp (-2 * π * I * n * u / h)

/-- The holomorphic coefficient `a⁺(n) = lim_{v → ∞} a(n; v) e^{2πnv/h}`. -/
def holoCoeffAt (h : ℝ) (f : ℍ → ℂ) (n : ℤ) : ℂ :=
  limUnder atTop fun v : ℝ ↦ fourierCoeffAt h f n v * Real.exp (2 * π * n * v / h)

namespace HarmonicMaassForm

variable {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] [Γ.HasDetOne] {k : ℤ}

/-- `a⁺(n)` at `∞`, for the width `h = Γ.strictWidthInfty`. -/
def holoCoeff (f : HarmonicMaassForm Γ k) (n : ℤ) : ℂ := holoCoeffAt Γ.strictWidthInfty f n

/-- `a⁻(n)`, the coefficient of `Γ(1-k, 4π|n|v/h) e(nτ/h)` (`0` for `n ≥ 0`). -/
def nonHoloCoeff (f : HarmonicMaassForm Γ k) (n : ℤ) : ℂ :=
  if n < 0 then
    (fourierCoeffAt Γ.strictWidthInfty f n 1 * Real.exp (2 * π * n / Γ.strictWidthInfty) -
        holoCoeff f n) /
      (upperIncompleteGamma (1 - k) (4 * π * |n| / Γ.strictWidthInfty) : ℂ)
  else 0

/-- The holomorphic part `f⁺(τ) = Σ a⁺(n) e(nτ/h)`. -/
def holomorphicPart (f : HarmonicMaassForm Γ k) (τ : ℍ) : ℂ :=
  ∑' n : ℤ, holoCoeff f n * fourierMode n Γ.strictWidthInfty τ

/-- The non-holomorphic part `f⁻ = f - f⁺`. -/
def nonHolomorphicPart (f : HarmonicMaassForm Γ k) : ℍ → ℂ := ⇑f - holomorphicPart f

theorem holomorphicPart_add_nonHolomorphicPart (f : HarmonicMaassForm Γ k) :
    holomorphicPart f + nonHolomorphicPart f = ⇑f := sorry

theorem mdifferentiable_holomorphicPart (hk : k ≠ 1) {f : HarmonicMaassForm Γ k}
    (hf : f ∈ plusSpace hk) : MDiff (holomorphicPart f) := sorry

theorem xi_nonHolomorphicPart (hk : k ≠ 1) {f : HarmonicMaassForm Γ k} (hf : f ∈ plusSpace hk) :
    xiOperator k (nonHolomorphicPart f) = xiOperator k f := sorry

theorem holomorphicPart_toHarmonic (g : WeaklyHolomorphicModularForm Γ k) :
    holomorphicPart (WeaklyHolomorphicModularForm.toHarmonic g) = ⇑g := sorry

/-- The least `N` with `a⁺(n) = 0` for `n < -N` (`0` if there is none). -/
def principalPartBound (f : HarmonicMaassForm Γ k) : ℕ :=
  sInf {N : ℕ | ∀ n : ℤ, n < -N → holoCoeff f n = 0}

/-- The principal part `P(f) = Σ_{n ≤ 0} a⁺(n) Tⁿ ∈ ℂ[T, T⁻¹]` (Bruinier–Funke (3.6)). -/
def principalPart (f : HarmonicMaassForm Γ k) : LaurentPolynomial ℂ :=
  ∑ n ∈ Finset.Icc (-(principalPartBound f : ℤ)) 0,
    LaurentPolynomial.C (holoCoeff f n) * LaurentPolynomial.T n

theorem principalPart_coeff (hk : k ≠ 1) {f : HarmonicMaassForm Γ k} (hf : f ∈ plusSpace hk)
    (n : ℤ) : (principalPart f).coeff n = if n ≤ 0 then holoCoeff f n else 0 := sorry

theorem principalPart_add (hk : k ≠ 1) {f g : HarmonicMaassForm Γ k} (hf : f ∈ plusSpace hk)
    (hg : g ∈ plusSpace hk) (c : ℂ) :
    principalPart (f + g) = principalPart f + principalPart g ∧
      principalPart (c • f) = c • principalPart f := sorry

theorem sub_principalPart_isBigO (hk : k ≠ 1) {f : HarmonicMaassForm Γ k}
    (hf : f ∈ plusSpace hk) :
    ∃ ε > 0, (fun τ : ℍ ↦ f τ -
      (principalPart f).coeff.sum fun n a ↦ a * fourierMode n Γ.strictWidthInfty τ) =O[atImInfty]
        fun τ ↦ Real.exp (-ε * τ.im) := sorry

end HarmonicMaassForm

/-- Unit test `holomorphicPart_toHarmonic_test`: the holomorphic part of the
image of `g ∈ M^!_k(Γ)` is `g`. -/
example {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] [Γ.HasDetOne] {k : ℤ}
    (g : WeaklyHolomorphicModularForm Γ k) :
    HarmonicMaassForm.holomorphicPart (WeaklyHolomorphicModularForm.toHarmonic g) = ⇑g := sorry

/-- Unit test `holomorphicPart_add_test`: `f = f⁺ + f⁻`, and `f⁻ → 0` at `∞`. -/
example {Γ : Subgroup (GL (Fin 2) ℝ)} [Γ.IsArithmetic] [Γ.HasDetOne] {k : ℤ} (hk : k ≠ 1)
    (f : HarmonicMaassForm Γ k) (hf : f ∈ HarmonicMaassForm.plusSpace hk) :
    HarmonicMaassForm.holomorphicPart f + HarmonicMaassForm.nonHolomorphicPart f = ⇑f ∧
      Tendsto (HarmonicMaassForm.nonHolomorphicPart f) atImInfty (𝓝 0) := sorry

/-- Unit test `principalPart_inv_discriminant_test`: `P(1/Δ) = T⁻¹ + 24`. -/
example :
    HarmonicMaassForm.principalPart
        (WeaklyHolomorphicModularForm.toHarmonic WeaklyHolomorphicModularForm.invDiscriminant) =
      LaurentPolynomial.T (-1) + LaurentPolynomial.C 24 := sorry

/-- Unit test `principalPart_E4_test`: `P(E₄) = 1`. -/
example :
    HarmonicMaassForm.principalPart (WeaklyHolomorphicModularForm.toHarmonic
        (ModularForm.toWeaklyHolomorphic (ModularForm.E (k := 4) (by norm_num)))) = 1 := sorry

/-- Unit test `principalPart_discriminant_test`: `P(Δ) = 0`. -/
example :
    HarmonicMaassForm.principalPart (WeaklyHolomorphicModularForm.toHarmonic
        (ModularForm.toWeaklyHolomorphic (CuspForm.discriminant : ModularForm 𝒮ℒ 12))) = 0 := sorry

/-! ### Cosets, cusps and constant terms -/

open Matrix.SpecialLinearGroup (mapGL)

/-- The cosets `SL(2, ℤ)/(Γ' · {±1})`, `Γ'` the preimage of `Γ` in `SL(2, ℤ)`; the inverses of
their representatives run over `Γ̃\SL(2, ℤ)`. -/
abbrev CosetsPM (Γ : Subgroup (GL (Fin 2) ℝ)) :=
  SL(2, ℤ) ⧸ (Γ.comap (mapGL (R := ℤ) ℝ) ⊔ Subgroup.center SL(2, ℤ))

/-- A common period `2·[SL(2, ℤ) : Γ']!` of `f|σ` for all `σ ∈ SL(2, ℤ)` and all `f` invariant
under `Γ`: every cusp width divides it. -/
def commonWidth (Γ : Subgroup (GL (Fin 2) ℝ)) : ℝ :=
  2 * ((Γ.comap (mapGL (R := ℤ) ℝ)).index.factorial : ℝ)

/-- The unnormalised Petersson product over `Γ\ℍ` of two functions, `∫ conj(f) g v^k dμ`. -/
def peterssonCosets (Γ : Subgroup (GL (Fin 2) ℝ)) (k : ℤ) (f g : ℍ → ℂ) : ℂ :=
  ∑ᶠ q : CosetsPM Γ, ∫ τ in ModularGroup.fd, petersson k (f ∣[k] q.out⁻¹) (g ∣[k] q.out⁻¹) τ

/-- A matrix `σ_c ∈ SL(2, ℤ)` with `σ_c ∞ = c` for a cusp orbit `c` of `Γ`. -/
def cuspMatrix (Γ : Subgroup (GL (Fin 2) ℝ)) (c : CuspOrbits Γ) : SL(2, ℤ) :=
  Classical.epsilon fun σ : SL(2, ℤ) ↦
    (mapGL (R := ℤ) ℝ σ : GL (Fin 2) ℝ) • (∞ : _root_.OnePoint ℝ) = ((Quotient.out c : cuspsSubMulAction Γ) : _root_.OnePoint ℝ)

/-- The width `h_c` of the cusp orbit `c`: the strict width at `∞` of `σ_c⁻¹ Γ σ_c`. -/
def cuspWidth (Γ : Subgroup (GL (Fin 2) ℝ)) (c : CuspOrbits Γ) : ℝ :=
  (ConjAct.toConjAct (mapGL (R := ℤ) ℝ (cuspMatrix Γ c))⁻¹ • Γ).strictWidthInfty

/-! ### The Bruinier–Funke pairing (QM.3/bruinier-funke-pairing and following) -/

variable {Γ : Subgroup (GL (Fin 2) ℝ)} {k : ℤ}

/-- `{g, f} = (g, ξ_k f)`, the Petersson product of `g ∈ M_{2-k}(Γ)` with `ξ_k f`. -/
def bruinierFunkePairing (g : ModularForm Γ (2 - k)) (f : HarmonicMaassForm Γ k) : ℂ :=
  peterssonCosets Γ (2 - k) (xiOperator k f) g

theorem bruinierFunkePairing_add_left [Γ.IsArithmetic] [Γ.HasDetOne] (hk : k ≠ 1)
    (g₁ g₂ : ModularForm Γ (2 - k)) {f f₁ f₂ : HarmonicMaassForm Γ k}
    (hf : f ∈ HarmonicMaassForm.plusSpace hk) (hf₁ : f₁ ∈ HarmonicMaassForm.plusSpace hk)
    (hf₂ : f₂ ∈ HarmonicMaassForm.plusSpace hk) (c : ℂ) :
    bruinierFunkePairing (g₁ + g₂) f = bruinierFunkePairing g₁ f + bruinierFunkePairing g₂ f ∧
      bruinierFunkePairing (c • g₁) f = c * bruinierFunkePairing g₁ f ∧
      bruinierFunkePairing g₁ (f₁ + f₂) = bruinierFunkePairing g₁ f₁ + bruinierFunkePairing g₁ f₂ ∧
      bruinierFunkePairing g₁ (c • f) = c * bruinierFunkePairing g₁ f := sorry

theorem bruinierFunkePairing_toHarmonic [Γ.IsArithmetic] [Γ.HasDetOne]
    (g : ModularForm Γ (2 - k)) (h : WeaklyHolomorphicModularForm Γ k) :
    bruinierFunkePairing g (WeaklyHolomorphicModularForm.toHarmonic h) = 0 := sorry

/-- Comparison with Tau Ceti's `CuspForm.peterssonInnerCosets` (here `peterssonInnerCosetsLocal`)
for `Γ = Γ₁.map (mapGL (R := ℤ) ℝ)`, `Γ₁ ≤ SL(2, ℤ)` of finite index. -/
theorem bruinierFunkePairing_eq_peterssonInnerCosets (Γ₁ : Subgroup SL(2, ℤ)) [Γ₁.FiniteIndex]
    (g : CuspForm (Γ₁.map (mapGL (R := ℤ) ℝ)) (2 - k)) (f : HarmonicMaassForm (Γ₁.map (mapGL (R := ℤ) ℝ)) k)
    (h : CuspForm (Γ₁.map (mapGL (R := ℤ) ℝ)) (2 - k)) (hh : ⇑h = xiOperator k f) :
    bruinierFunkePairing (g : ModularForm (Γ₁.map (mapGL (R := ℤ) ℝ)) (2 - k)) f =
      peterssonInnerCosetsLocal Γ₁ (2 - k) h g := sorry

/-- QM.3/bruinier-funke-pairing-formula (Bruinier–Funke Prop. 3.5): `{g, f}` depends only on the
principal parts, `{g, f} = Σ_c h_c Σ_{n ≤ 0} a⁺_c(n) b_c(-n)`, written as a sum over the cosets
with the common period `P = commonWidth Γ`. -/
theorem bruinierFunkePairing_eq_sum [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ) (hk : k ≠ 1)
    (g : ModularForm Γ (2 - k)) {f : HarmonicMaassForm Γ k}
    (hf : f ∈ HarmonicMaassForm.plusSpace hk) :
    bruinierFunkePairing g f = ∑ᶠ q : CosetsPM Γ, ∑' n : ℕ,
      holoCoeffAt (commonWidth Γ) (⇑f ∣[k] q.out⁻¹) (-n) *
        holoCoeffAt (commonWidth Γ) (⇑g ∣[2 - k] q.out⁻¹) n := sorry

/-- `{g, f}′ = Σ_c h_c Σ_{n < 0} a⁺_c(n) b_c(-n)` (Bruinier–Funke (3.15)). -/
def bruinierFunkePairing' (g : ModularForm Γ (2 - k)) (f : HarmonicMaassForm Γ k) : ℂ :=
  ∑ᶠ q : CosetsPM Γ, ∑' n : ℕ,
    holoCoeffAt (commonWidth Γ) (⇑f ∣[k] q.out⁻¹) (-(n + 1 : ℕ)) *
      holoCoeffAt (commonWidth Γ) (⇑g ∣[2 - k] q.out⁻¹) (n + 1 : ℕ)

/-- The constant-term pairing `Σ_c h_c a_c(0) b_c(0)`. -/
def constantTermPairing (Γ : Subgroup (GL (Fin 2) ℝ)) (k : ℤ) (g f : ℍ → ℂ) : ℂ :=
  ∑ᶠ q : CosetsPM Γ, holoCoeffAt (commonWidth Γ) (f ∣[k] q.out⁻¹) 0 *
    holoCoeffAt (commonWidth Γ) (g ∣[2 - k] q.out⁻¹) 0

theorem bruinierFunkePairing'_eq_of_isCuspForm [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ)
    (hk : k ≠ 1) (g : CuspForm Γ (2 - k)) {f : HarmonicMaassForm Γ k}
    (hf : f ∈ HarmonicMaassForm.plusSpace hk) :
    bruinierFunkePairing' (g : ModularForm Γ (2 - k)) f =
      bruinierFunkePairing (g : ModularForm Γ (2 - k)) f := sorry

theorem bruinierFunkePairing_sub_bruinierFunkePairing' [Γ.IsArithmetic] [Γ.HasDetOne]
    (hΓ : Γ ≤ 𝒮ℒ) (hk : k ≠ 1) (g : ModularForm Γ (2 - k)) {f : HarmonicMaassForm Γ k}
    (hf : f ∈ HarmonicMaassForm.plusSpace hk) :
    bruinierFunkePairing g f - bruinierFunkePairing' g f = constantTermPairing Γ k g f := sorry

/-- `M^!!_k(Γ)`: weakly holomorphic forms whose constant terms are orthogonal to those of all
`g ∈ M_{2-k}(Γ)` (Bruinier–Funke p. 15). -/
def weaklyHolomorphicPerp (Γ : Subgroup (GL (Fin 2) ℝ)) [Γ.HasDetOne] (k : ℤ) :
    Submodule ℂ (WeaklyHolomorphicModularForm Γ k) where
  carrier := {f | ∀ g : ModularForm Γ (2 - k), constantTermPairing Γ k g f = 0}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

theorem mem_weaklyHolomorphicPerp_iff [Γ.HasDetOne] (f : WeaklyHolomorphicModularForm Γ k) :
    f ∈ weaklyHolomorphicPerp Γ k ↔ ∀ g : ModularForm Γ (2 - k), constantTermPairing Γ k g f = 0 :=
  Iff.rfl

theorem weaklyHolomorphicPerp_eq_of_neg (hk : k < 0) (f : WeaklyHolomorphicModularForm 𝒮ℒ k) :
    f ∈ weaklyHolomorphicPerp 𝒮ℒ k ↔ holoCoeffAt 1 f 0 = 0 := sorry

/-- Unit test `bruinierFunkePairing_toHarmonic_test`: `{g, f} = 0` for weakly holomorphic `f`. -/
example [Γ.IsArithmetic] [Γ.HasDetOne] (g : ModularForm Γ (2 - k))
    (h : WeaklyHolomorphicModularForm Γ k) :
    bruinierFunkePairing g (WeaklyHolomorphicModularForm.toHarmonic h) = 0 := sorry

/-- Unit test `bruinierFunkePairing_smul_right_test`: `{g, c f} = c {g, f}` (linear in `f`
although `ξ_k` is conjugate-linear). -/
example [Γ.IsArithmetic] [Γ.HasDetOne] (hk : k ≠ 1) (g : ModularForm Γ (2 - k))
    {f : HarmonicMaassForm Γ k} (hf : f ∈ HarmonicMaassForm.plusSpace hk) (c : ℂ) :
    bruinierFunkePairing g (c • f) = c * bruinierFunkePairing g f := sorry

/-- Unit test `bruinierFunkePairing_eq_peterssonInnerCosets_test`: for a cusp form `g`,
`{g, f} = peterssonInnerCosets (ξ_k f) g`. -/
example (Γ₁ : Subgroup SL(2, ℤ)) [Γ₁.FiniteIndex] (g : CuspForm (Γ₁.map (mapGL (R := ℤ) ℝ)) (2 - k))
    (f : HarmonicMaassForm (Γ₁.map (mapGL (R := ℤ) ℝ)) k) (h : CuspForm (Γ₁.map (mapGL (R := ℤ) ℝ)) (2 - k))
    (hh : ⇑h = xiOperator k f) :
    bruinierFunkePairing (g : ModularForm (Γ₁.map (mapGL (R := ℤ) ℝ)) (2 - k)) f =
      peterssonInnerCosetsLocal Γ₁ (2 - k) h g := sorry

/-- Unit test `bruinierFunkePairing'_cuspForm_test`: for a cusp form `g`, `{g, f}′ = {g, f}`. -/
example [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ) (hk : k ≠ 1) (g : CuspForm Γ (2 - k))
    {f : HarmonicMaassForm Γ k} (hf : f ∈ HarmonicMaassForm.plusSpace hk) :
    bruinierFunkePairing' (g : ModularForm Γ (2 - k)) f =
      bruinierFunkePairing (g : ModularForm Γ (2 - k)) f := sorry

/-- Unit test `bruinierFunkePairing'_const_test`: level one, `f ∈ M^!_k` with principal part
`a(-1)q⁻¹ + a(0)`: `{g, f}′ = a(-1) b(1)`. -/
example (g : ModularForm 𝒮ℒ (2 - k)) (f : WeaklyHolomorphicModularForm 𝒮ℒ k)
    (hf : ∀ n : ℤ, n < -1 → holoCoeffAt 1 f n = 0) :
    bruinierFunkePairing' g (WeaklyHolomorphicModularForm.toHarmonic f) =
      holoCoeffAt 1 f (-1) * holoCoeffAt 1 g 1 := sorry

/-- Unit test `mem_weaklyHolomorphicPerp_j_test`: `j = E₄³/Δ ∈ M^!!_0(SL(2, ℤ))`, although its
constant term is `744`. -/
example (f : WeaklyHolomorphicModularForm 𝒮ℒ 0)
    (hf : ∀ τ, f τ = ModularForm.E (k := 4) (by norm_num) τ ^ 3 / ModularForm.discriminant τ) :
    f ∈ weaklyHolomorphicPerp 𝒮ℒ 0 ∧ holoCoeffAt 1 f 0 = 744 := sorry

/-- Unit test `not_mem_weaklyHolomorphicPerp_test`: `E₄/Δ = q⁻¹ + 264 + O(q)` is not in
`M^!!_{-8}(SL(2, ℤ))`. -/
example (f : WeaklyHolomorphicModularForm 𝒮ℒ (-8))
    (hf : ∀ τ, f τ = ModularForm.E (k := 4) (by norm_num) τ / ModularForm.discriminant τ) :
    holoCoeffAt 1 f 0 = 264 ∧ f ∉ weaklyHolomorphicPerp 𝒮ℒ (-8) := sorry

/-- Unit test `weaklyHolomorphicPerp_le_test`: for `k ≥ 3`, `M_{2-k}(Γ) = 0` and `M^!!_k = M^!_k`. -/
example [Γ.IsArithmetic] [Γ.HasDetOne] (hk : 3 ≤ k) :
    weaklyHolomorphicPerp Γ k = ⊤ := sorry

/-! ### Principal parts and the residue pairing (QM.3/principal-part-residue-pairing) -/

/-- `Sing(Γ) = ⊕_c ℂ[q_c⁻¹]`: families of Laurent polynomials with non-positive exponents, one per
cusp orbit. -/
def PrincipalPartSpace (Γ : Subgroup (GL (Fin 2) ℝ)) : Submodule ℂ (CuspOrbits Γ → LaurentPolynomial ℂ) where
  carrier := {P | ∀ c (n : ℤ), 0 < n → (P c).coeff n = 0}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- The residue pairing `⟨F, P⟩ = Σ_c h_c Σ_{n ≥ 0} F_c(n) P_c(-n)` (Borcherds, GKZ §3). -/
def residuePairing (Γ : Subgroup (GL (Fin 2) ℝ)) (F : CuspOrbits Γ → PowerSeries ℂ)
    (P : CuspOrbits Γ → LaurentPolynomial ℂ) : ℂ :=
  ∑ᶠ c : CuspOrbits Γ, (cuspWidth Γ c : ℂ) *
    ∑' n : ℕ, PowerSeries.coeff n (F c) * (P c).coeff (-n)

/-- The expansions at the cusps of a holomorphic function, `c ↦ Σ_{n ≥ 0} b_c(n) q_cⁿ`. -/
def powerSeriesMap (Γ : Subgroup (GL (Fin 2) ℝ)) (k : ℤ) (g : ℍ → ℂ) :
    CuspOrbits Γ → PowerSeries ℂ :=
  fun c ↦ PowerSeries.mk fun n ↦ holoCoeffAt (cuspWidth Γ c) (g ∣[k] cuspMatrix Γ c) n

/-- The least `N` with `a_c(n) = 0` for `n < -N` at the cusp orbit `c`. -/
def cuspPoleOrder (Γ : Subgroup (GL (Fin 2) ℝ)) (k : ℤ) (f : ℍ → ℂ) (c : CuspOrbits Γ) : ℕ :=
  sInf {N : ℕ | ∀ n : ℤ, n < -N → holoCoeffAt (cuspWidth Γ c) (f ∣[k] cuspMatrix Γ c) n = 0}

/-- `λ(f)`: the principal parts (with constant terms) of `f` at all cusp orbits. -/
def principalPartMap (Γ : Subgroup (GL (Fin 2) ℝ)) (k : ℤ) (f : ℍ → ℂ) :
    CuspOrbits Γ → LaurentPolynomial ℂ :=
  fun c ↦ ∑ n ∈ Finset.Icc (-(cuspPoleOrder Γ k f c : ℤ)) 0,
    LaurentPolynomial.C (holoCoeffAt (cuspWidth Γ c) (f ∣[k] cuspMatrix Γ c) n) *
      LaurentPolynomial.T n

/-- `⟨λ(g), λ(f)⟩ = 0` for `f ∈ M^!_k(Γ)`, `g ∈ M_{2-k}(Γ)` (residue theorem on `X(Γ)`). -/
theorem residuePairing_principalPartMap_eq_zero [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ)
    (f : WeaklyHolomorphicModularForm Γ k) (g : ModularForm Γ (2 - k)) :
    residuePairing Γ (powerSeriesMap Γ (2 - k) g) (principalPartMap Γ k f) = 0 := sorry

/-- QM.3/borcherds-obstruction-theorem (Borcherds, GKZ Thm 3.1, scalar case): a principal part is
realised by some `f ∈ M^!_k(Γ)` iff it is orthogonal to `λ(M_{2-k}(Γ))`. -/
theorem exists_weaklyHolomorphic_principalPart_iff [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ)
    (P : CuspOrbits Γ → LaurentPolynomial ℂ) (hP : P ∈ PrincipalPartSpace Γ) :
    (∃ f : WeaklyHolomorphicModularForm Γ k, principalPartMap Γ k f = P) ↔
      ∀ g : ModularForm Γ (2 - k), residuePairing Γ (powerSeriesMap Γ (2 - k) g) P = 0 := sorry

/-- Unit test `residuePairing_levelOne_test`: level one, `⟨λ(E₄), T⁻¹ + c⟩ = 240 + c`. -/
example (c : ℂ) :
    residuePairing 𝒮ℒ (powerSeriesMap 𝒮ℒ 4 (ModularForm.E (k := 4) (by norm_num)))
      (fun _ ↦ LaurentPolynomial.T (-1) + LaurentPolynomial.C c) = 240 + c := sorry

/-- Unit test `residuePairing_weaklyHolomorphic_test`: `⟨λ(g), λ(f)⟩ = 0` for `f ∈ M^!_k(Γ)`,
`g ∈ M_{2-k}(Γ)`. -/
example [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ) (f : WeaklyHolomorphicModularForm Γ k)
    (g : ModularForm Γ (2 - k)) :
    residuePairing Γ (powerSeriesMap Γ (2 - k) g) (principalPartMap Γ k f) = 0 := sorry

/-- Unit test `residuePairing_zero_test`: `⟨F, 0⟩ = 0 = ⟨0, P⟩`. -/
example (F : CuspOrbits Γ → PowerSeries ℂ) (P : CuspOrbits Γ → LaurentPolynomial ℂ) :
    residuePairing Γ F 0 = 0 ∧ residuePairing Γ 0 P = 0 := sorry

/-! ### Main theorems of Bruinier–Funke §3 -/

/-- QM.3/xi-kernel-weakly-holomorphic: `ker ξ_k = M^!_k(Γ)`. -/
theorem HarmonicMaassForm.ker_xi [Γ.IsArithmetic] [Γ.HasDetOne] (hk : k ≠ 1) :
    LinearMap.ker (HarmonicMaassForm.xi (Γ := Γ) hk) =
      LinearMap.range (WeaklyHolomorphicModularForm.toHarmonic (Γ := Γ) (k := k)) := sorry

/-- QM.3/harmonic-maass-form-fourier-expansion. -/
theorem HarmonicMaassForm.hasSum_fourier [Γ.IsArithmetic] [Γ.HasDetOne] (hk : k ≠ 1)
    {f : HarmonicMaassForm Γ k} (hf : f ∈ HarmonicMaassForm.plusSpace hk) :
    (∃ N : ℕ, ∀ n : ℤ, n < -N → f.holoCoeff n = 0) ∧ ∀ τ : ℍ,
      f τ = (∑' n : ℤ, f.holoCoeff n * fourierMode n Γ.strictWidthInfty τ) +
        ∑' n : ℤ, f.nonHoloCoeff n *
          (upperIncompleteGamma (1 - k) (4 * π * |n| * τ.im / Γ.strictWidthInfty) : ℂ) *
            fourierMode n Γ.strictWidthInfty τ := sorry

/-- QM.3/xi-surjective-free-normal (Bruinier–Funke Thm 3.7 for normal subgroups acting freely,
repaired at the cusps). -/
theorem HarmonicMaassForm.xi_surjective_of_free [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ)
    (hnormal : (Γ.comap (mapGL (R := ℤ) ℝ)).Normal) (hfree : ∀ γ ∈ Γ, ∀ τ : ℍ, γ • τ = τ → γ = 1)
    (hk : k ≠ 1) : Function.Surjective (HarmonicMaassForm.xi (Γ := Γ) hk) := sorry

/-- QM.3/xi-surjective (Bruinier–Funke Thm 3.7). -/
theorem HarmonicMaassForm.xi_surjective [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ)
    (hk : k ≠ 1) : Function.Surjective (HarmonicMaassForm.xi (Γ := Γ) hk) := sorry

/-- QM.3/bruinier-funke-exact-sequences (Bruinier–Funke Cor. 3.8). -/
theorem HarmonicMaassForm.exact_sequences [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ)
    (hk : k ≠ 1) :
    Function.Injective (WeaklyHolomorphicModularForm.toHarmonic (Γ := Γ) (k := k)) ∧
      LinearMap.range (WeaklyHolomorphicModularForm.toHarmonic (Γ := Γ) (k := k)) =
        LinearMap.ker (HarmonicMaassForm.xi (Γ := Γ) hk) ∧
      Function.Surjective (HarmonicMaassForm.xi (Γ := Γ) hk) ∧
      ∀ g : CuspForm Γ (2 - k), ∃ f ∈ HarmonicMaassForm.plusSpace (Γ := Γ) hk,
        ⇑(HarmonicMaassForm.xi hk f) = ⇑g := sorry

/-- QM.3/bruinier-funke-duality (Bruinier–Funke Thm 3.6). -/
theorem bruinierFunkePairing_nondegenerate [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ)
    (hk : k ≠ 1) :
    (∀ g : CuspForm Γ (2 - k),
      (∀ f ∈ HarmonicMaassForm.plusSpace hk, bruinierFunkePairing (g : ModularForm Γ (2 - k)) f = 0) →
        g = 0) ∧
    ∀ f ∈ HarmonicMaassForm.plusSpace hk,
      (∀ g : CuspForm Γ (2 - k), bruinierFunkePairing (g : ModularForm Γ (2 - k)) f = 0) →
        f ∈ LinearMap.range (WeaklyHolomorphicModularForm.toHarmonic (Γ := Γ) (k := k)) := sorry

/-- QM.3/bruinier-funke-duality-negative (Bruinier–Funke Cor. 3.9). -/
theorem bruinierFunkePairing'_nondegenerate [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ)
    (hk : k ≠ 1) :
    (∀ g : ModularForm Γ (2 - k),
      (∀ f ∈ HarmonicMaassForm.plusSpace hk, bruinierFunkePairing' g f = 0) → g = 0) ∧
    ∀ f ∈ HarmonicMaassForm.plusSpace hk,
      (∀ g : ModularForm Γ (2 - k), bruinierFunkePairing' g f = 0) →
        ∃ h ∈ weaklyHolomorphicPerp Γ k, WeaklyHolomorphicModularForm.toHarmonic h = f := sorry

/-- QM.3/harmonic-maass-form-prescribed-principal-parts (Bruinier–Funke Prop. 3.11, all cusps). -/
theorem HarmonicMaassForm.exists_principalPart [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ)
    (hk : k ≠ 1) (Q : CuspOrbits Γ → LaurentPolynomial ℂ)
    (hQ : ∀ c (n : ℤ), 0 ≤ n → (Q c).coeff n = 0) :
    ∃ f ∈ HarmonicMaassForm.plusSpace (Γ := Γ) hk, ∀ c, ∀ n : ℤ, n < 0 →
      holoCoeffAt (cuspWidth Γ c) (⇑f ∣[k] cuspMatrix Γ c) n = (Q c).coeff n := sorry

/-! ### Kloosterman sums (QM.3/classical-kloosterman-sum) -/

/-- `K(m, n, c) = Σ_{v ∈ (ℤ/cℤ)ˣ} e((m v̄ + n v)/c)`. -/
def kloostermanSum (m n : ℤ) (c : ℕ) [NeZero c] : ℂ :=
  ∑ v : (ZMod c)ˣ,
    cexp (2 * π * I * (m * ((v⁻¹ : (ZMod c)ˣ) : ZMod c).val + n * (v : ZMod c).val) / c)

theorem kloostermanSum_comm (m n : ℤ) (c : ℕ) [NeZero c] :
    kloostermanSum m n c = kloostermanSum n m c := sorry

theorem kloostermanSum_neg (m n : ℤ) (c : ℕ) [NeZero c] :
    kloostermanSum (-m) (-n) c = kloostermanSum m n c ∧
      conj (kloostermanSum m n c) = kloostermanSum m n c := sorry

theorem kloostermanSum_zero_right (m : ℤ) (c : ℕ) [NeZero c] :
    kloostermanSum m 0 c = ∑ v : (ZMod c)ˣ, cexp (2 * π * I * m * (v : ZMod c).val / c) ∧
      kloostermanSum 0 0 c = c.totient := sorry

theorem kloostermanSum_one (m n : ℤ) : kloostermanSum m n 1 = 1 := sorry

/-- Unit test `kloostermanSum_one_one_three_test`: `K(1, 1, 3) = -1`. -/
example : kloostermanSum 1 1 3 = -1 := sorry

/-- Unit test `kloostermanSum_zero_zero_test`: `K(0, 0, c) = φ(c)`. -/
example (c : ℕ) [NeZero c] : kloostermanSum 0 0 c = c.totient := sorry

/-- Unit test `kloostermanSum_one_one_five_test`: `K(1, 1, 5) = 2 + 2cos(4π/5) ≠ -1`, the value of
`Σ e(2v/5)`: the inverse matters. -/
example :
    kloostermanSum 1 1 5 = 2 + 2 * Real.cos (4 * π / 5) ∧
      (2 + 2 * Real.cos (4 * π / 5) : ℂ) ≠ -1 := sorry

/-- Unit test `kloostermanSum_conj_test`: `K(m, n, c)` is real. -/
example (m n : ℤ) (c : ℕ) [NeZero c] : conj (kloostermanSum m n c) = kloostermanSum m n c := sorry

/-! ### Poincaré series (QM.3/holomorphic-poincare-series, QM.3/maass-poincare-series) -/

/-- `Γ∞ = {±Tⁿ}`, the upper triangular elements of `SL(2, ℤ)`. -/
def gammaInfty : Subgroup SL(2, ℤ) where
  carrier := {g | g 1 0 = 0}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- `Γ₀(N)` as a subgroup of `GL(2, ℝ)`. -/
abbrev gamma0GL (N : ℕ) : Subgroup (GL (Fin 2) ℝ) :=
  ((CongruenceSubgroup.Gamma0 N : Subgroup SL(2, ℤ)) : Subgroup (GL (Fin 2) ℝ))

/-- The right cosets `Γ∞\Γ₀(N)`. -/
abbrev GammaInftyCosets (N : ℕ) :=
  Quotient (QuotientGroup.rightRel (gammaInfty.subgroupOf (CongruenceSubgroup.Gamma0 N)))

/-- `P(m, k, N; τ) = Σ_{A ∈ Γ∞\Γ₀(N)} (e(mτ)|_k A)(τ)` (Bruinier–Ono–Rhoades (6.4)). -/
def holomorphicPoincareSeries (m k : ℤ) (N : ℕ) (τ : ℍ) : ℂ :=
  ∑' q : GammaInftyCosets N, (fourierMode m 1 ∣[k] ((q.out : CongruenceSubgroup.Gamma0 N) : SL(2, ℤ))) τ

theorem holomorphicPoincareSeries_summable (m k : ℤ) (N : ℕ) [NeZero N] (hk : 4 ≤ k)
    (hke : Even k) (τ : ℍ) :
    Summable fun q : GammaInftyCosets N ↦
      ‖(fourierMode m 1 ∣[k] ((q.out : CongruenceSubgroup.Gamma0 N) : SL(2, ℤ))) τ‖ := sorry

theorem holomorphicPoincareSeries_slash (m k : ℤ) (N : ℕ) [NeZero N] (hk : 4 ≤ k) (hke : Even k)
    (γ : SL(2, ℤ)) (hγ : γ ∈ CongruenceSubgroup.Gamma0 N) :
    holomorphicPoincareSeries m k N ∣[k] γ = holomorphicPoincareSeries m k N := sorry

/-- For `m ≥ 1`, `P(m, k, N) ∈ S_k(Γ₀(N))`. -/
def holomorphicPoincareSeries_toCuspForm (m k : ℤ) (N : ℕ) [NeZero N] (hm : 1 ≤ m) (hk : 4 ≤ k)
    (hke : Even k) : CuspForm (gamma0GL N) k where
  toFun := holomorphicPoincareSeries m k N
  slash_action_eq' := sorry
  holo' := sorry
  zero_at_cusps' := sorry

/-- For all `m`, `P(m, k, N) ∈ M^!_k(Γ₀(N))`. -/
def holomorphicPoincareSeries_toWeaklyHolomorphic (m k : ℤ) (N : ℕ) [NeZero N] (hk : 4 ≤ k)
    (hke : Even k) : WeaklyHolomorphicModularForm (gamma0GL N) k where
  toFun := holomorphicPoincareSeries m k N
  slash_action_eq' := sorry
  holo' := sorry
  expGrowth' := sorry

theorem holomorphicPoincareSeries_zero_one (k : ℕ) (hk : 4 ≤ k) (hke : Even k) :
    holomorphicPoincareSeries 0 k 1 = ⇑(ModularForm.E (k := k) (by omega)) := sorry

/-- Unit test `holomorphicPoincare_zero_levelOne_test`: `P(0, k, 1) = E_k`. -/
example (k : ℕ) (hk : 4 ≤ k) (hke : Even k) :
    holomorphicPoincareSeries 0 k 1 = ⇑(ModularForm.E (k := k) (by omega)) := sorry

/-- Unit test `holomorphicPoincare_isCuspForm_test`: for `m ≥ 1`, `P(m, k, N)` vanishes at every
cusp of `Γ₀(N)`. -/
example (m k : ℤ) (N : ℕ) [NeZero N] (hm : 1 ≤ m) (hk : 4 ≤ k) (hke : Even k)
    (c : _root_.OnePoint ℝ) (hc : IsCusp c (gamma0GL N)) :
    c.IsZeroAt (holomorphicPoincareSeries m k N) k := sorry

/-- Unit test `holomorphicPoincare_neg_not_bounded_test`: `P(-m, k, N)` is not bounded at `∞`. -/
example (m k : ℤ) (N : ℕ) [NeZero N] (hm : 1 ≤ m) (hk : 4 ≤ k) (hke : Even k) :
    ¬ (∞ : _root_.OnePoint ℝ).IsBoundedAt (holomorphicPoincareSeries (-m) k N) k := sorry

/-- Unit test `holomorphicPoincare_one_twelve_test`: `P(1, 12, 1) = c·Δ` with `c ≠ 0`. -/
example : ∃ c : ℂ, c ≠ 0 ∧ holomorphicPoincareSeries 1 12 1 = c • ModularForm.discriminant := sorry

/-- The Maass–Poincaré seed `ψ_m(τ) = P(k-1, 4πmv) e(-mτ)`, `P` the regularised lower incomplete
gamma function. -/
def maassPoincareSeed (m : ℕ) (k : ℤ) (τ : ℍ) : ℂ :=
  (regularizedGammaLocal (k - 1) (4 * π * m * τ.im) : ℂ) * fourierMode (-m) 1 τ

theorem maassPoincareSeed_eq (m : ℕ) (k : ℤ) (hk : 2 ≤ k) (τ : ℍ) :
    maassPoincareSeed m k τ = fourierMode (-m) 1 τ -
      (upperIncompleteGamma (k - 1) (4 * π * m * τ.im) : ℂ) * fourierMode (-m) 1 τ /
        ((k - 2).toNat.factorial : ℂ) := sorry

/-- `Q(-m, k, N) = Σ_{A ∈ Γ∞\Γ₀(N)} (ψ_m|_{2-k} A)` (Bruinier–Ono–Rhoades (6.7), corrected seed). -/
def maassPoincareSeries (m : ℕ) (k : ℤ) (N : ℕ) (τ : ℍ) : ℂ :=
  ∑' q : GammaInftyCosets N,
    (maassPoincareSeed m k ∣[2 - k] ((q.out : CongruenceSubgroup.Gamma0 N) : SL(2, ℤ))) τ

theorem maassPoincareSeries_summable (m : ℕ) (k : ℤ) (N : ℕ) [NeZero N] (hk : 4 ≤ k)
    (hke : Even k) (τ : ℍ) :
    Summable fun q : GammaInftyCosets N ↦
      ‖(maassPoincareSeed m k ∣[2 - k] ((q.out : CongruenceSubgroup.Gamma0 N) : SL(2, ℤ))) τ‖ :=
  sorry

/-- `Q(-m, k, N)` as an element of `H_{2-k}(Γ₀(N))`. -/
def maassPoincareSeries_toHarmonic (m : ℕ) (k : ℤ) (N : ℕ) [NeZero N] (hk : 4 ≤ k)
    (hke : Even k) : HarmonicMaassForm (gamma0GL N) (2 - k) where
  toFun := maassPoincareSeries m k N
  slash_action_eq' := sorry
  contDiff' := sorry
  harmonic' := sorry
  expGrowth' := sorry

/-- QM.3/maass-poincare-series-harmonic (Bruinier–Ono–Rhoades Prop. 6.2, first assertion). -/
theorem maassPoincareSeries_mem_plusSpace (m : ℕ) (hm : 1 ≤ m) (k : ℤ) (N : ℕ) [NeZero N]
    (hk : 4 ≤ k) (hke : Even k) (hk1 : 2 - k ≠ 1) :
    maassPoincareSeries_toHarmonic m k N hk hke ∈ HarmonicMaassForm.plusSpace hk1 ∧
      (maassPoincareSeries_toHarmonic m k N hk hke).holoCoeff (-m) = 1 ∧
      ∀ n : ℤ, n < 0 → n ≠ -m → (maassPoincareSeries_toHarmonic m k N hk hke).holoCoeff n = 0 :=
  sorry

/-- QM.3/xi-maass-poincare-series: `ξ_{2-k} Q(-m, k, N) = (4πm)^{k-1}/(k-2)! · P(m, k, N)`. -/
theorem xiOperator_maassPoincareSeries (m : ℕ) (hm : 1 ≤ m) (k : ℤ) (N : ℕ) [NeZero N]
    (hk : 4 ≤ k) (hke : Even k) :
    xiOperator (2 - k) (maassPoincareSeries m k N) =
      (((4 * π * m) ^ (k - 1) / (k - 2).toNat.factorial : ℝ) : ℂ) • holomorphicPoincareSeries m k N :=
  sorry

/-- The coefficient `a(m, k, N; n)` of Bruinier–Ono–Rhoades Prop. 6.1(1) (J-Bessel). -/
def poincareCoeffJ (m k : ℤ) (N n : ℕ) : ℂ :=
  2 * π * (-1) ^ (k / 2) * ((n / m : ℝ) ^ (((k : ℝ) - 1) / 2) : ℝ) *
    ∑' c : ℕ, if N ∣ (c + 1) then
      kloostermanSum m n (c + 1) / (c + 1 : ℕ) *
        besselJLocal (k - 1) (4 * π * Real.sqrt (m * n) / (c + 1 : ℕ)) else 0

/-- The coefficient `a(-m, k, N; n)` of Bruinier–Ono–Rhoades Prop. 6.1(2) (I-Bessel). -/
def poincareCoeffI (m k : ℤ) (N n : ℕ) : ℂ :=
  2 * π * (-1) ^ (k / 2) * ((n / m : ℝ) ^ (((k : ℝ) - 1) / 2) : ℝ) *
    ∑' c : ℕ, if N ∣ (c + 1) then
      kloostermanSum (-m) n (c + 1) / (c + 1 : ℕ) *
        besselILocal (k - 1) (4 * π * Real.sqrt (m * n) / (c + 1 : ℕ)) else 0

/-- QM.3/holomorphic-poincare-series-fourier-expansion (Bruinier–Ono–Rhoades Prop. 6.1). -/
theorem holomorphicPoincareSeries_eq_tsum (m : ℕ) (hm : 1 ≤ m) (k : ℤ) (N : ℕ) [NeZero N]
    (hk : 4 ≤ k) (hke : Even k) (τ : ℍ) :
    holomorphicPoincareSeries m k N τ =
        fourierMode m 1 τ + ∑' n : ℕ, poincareCoeffJ m k N (n + 1) * fourierMode (n + 1 : ℕ) 1 τ ∧
      holomorphicPoincareSeries (-m) k N τ =
        fourierMode (-m) 1 τ + ∑' n : ℕ, poincareCoeffI m k N (n + 1) * fourierMode (n + 1 : ℕ) 1 τ :=
  sorry

/-- QM.3/maass-poincare-series-fourier-expansion (Bruinier–Ono–Rhoades Prop. 6.2): the holomorphic
coefficients `b(n) = -(m/n)^{k-1} a(-m, k, N; n)` (`n > 0`), the constant term, and the
non-holomorphic coefficients `-(m/|n|)^{k-1} a(m, k, N; |n|)/(k-2)!` (`n < 0`). -/
theorem maassPoincareSeries_coeff (m : ℕ) (hm : 1 ≤ m) (k : ℤ) (N : ℕ) [NeZero N] (hk : 4 ≤ k)
    (hke : Even k) :
    (∀ n : ℕ, 0 < n → (maassPoincareSeries_toHarmonic m k N hk hke).holoCoeff n =
        -((m / n : ℝ) ^ (k - 1) : ℝ) * poincareCoeffI m k N n) ∧
      (maassPoincareSeries_toHarmonic m k N hk hke).holoCoeff 0 =
        -((2 * π) ^ k * (-1) ^ (k / 2) * (m : ℝ) ^ (k - 1) / (k - 1).toNat.factorial : ℝ) *
          (∑' c : ℕ, if N ∣ (c + 1) then
            kloostermanSum (-m) 0 (c + 1) / ((c + 1 : ℕ) : ℂ) ^ k else 0) ∧
      ∀ n : ℕ, 0 < n → (maassPoincareSeries_toHarmonic m k N hk hke).nonHoloCoeff (-n) =
        -((m / n : ℝ) ^ (k - 1) / (k - 2).toNat.factorial : ℝ) *
          ((if n = m then 1 else 0) + poincareCoeffJ m k N n) := sorry

/-- QM.3/level-one-cusp-forms-spanned-by-poincare-series. -/
theorem span_holomorphicPoincareSeries (k : ℤ) (hk : 4 ≤ k) (hke : Even k) :
    Submodule.span ℂ (Set.range fun m : ℕ ↦
      holomorphicPoincareSeries_toCuspForm (m + 1) k 1 (by omega) hk hke) = ⊤ := sorry

/-- QM.3/level-one-plus-space-spanned-by-poincare-series (Bruinier–Funke Remark 3.10). -/
theorem mem_span_maassPoincareSeries (k : ℤ) (hk : 4 ≤ k) (hke : Even k) (hk1 : 2 - k ≠ 1)
    (f : HarmonicMaassForm (gamma0GL 1) (2 - k)) (hf : f ∈ HarmonicMaassForm.plusSpace hk1) :
    f ∈ Submodule.span ℂ (Set.range fun m : ℕ ↦ maassPoincareSeries_toHarmonic (m + 1) k 1 hk hke) :=
  sorry

/-- QM.3/flipping-derivative-theorem (Bruinier–Ono–Rhoades Thm 1.1): `D^{k-1}` maps `H_{2-k}^+`
to `M^!_k`, acting on the holomorphic coefficients by `n^{k-1}`. -/
theorem qDeriv_iterate_mem [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ) (k : ℕ) (hk : 2 ≤ k)
    (hk1 : (2 - k : ℤ) ≠ 1) {f : HarmonicMaassForm Γ (2 - k)}
    (hf : f ∈ HarmonicMaassForm.plusSpace hk1) :
    ∃ F : WeaklyHolomorphicModularForm Γ k, ⇑F = qDeriv^[k - 1] f ∧
      ∀ n : ℤ, holoCoeffAt Γ.strictWidthInfty F n =
        f.holoCoeff n * ((n / Γ.strictWidthInfty : ℝ) : ℂ) ^ (k - 1) := sorry

/-- QM.3/bol-image-of-maass-poincare-series: `D^{k-1} Q(-m, k, N) = -m^{k-1} P(-m, k, N)`. -/
theorem qDeriv_iterate_maassPoincareSeries (m : ℕ) (hm : 1 ≤ m) (k : ℕ) (N : ℕ) [NeZero N]
    (hk : 4 ≤ k) (hke : Even k) :
    qDeriv^[k - 1] (maassPoincareSeries m k N) =
      (-(m : ℂ) ^ (k - 1)) • holomorphicPoincareSeries (-m) k N := sorry

/-! ### Regularized Petersson product (QM.3/regularized-petersson-product) -/

/-- The truncated fundamental domain `F_T = {τ ∈ F : Im τ ≤ T}`. -/
def truncatedFd (T : ℝ) : Set ℍ := {τ | τ ∈ ModularGroup.fd ∧ τ.im ≤ T}

/-- `(g, h)^{reg} = [SL(2, ℤ) : Γ]⁻¹ lim_T ∫_{F_T(Γ)} g conj(h) v^k dμ`. -/
def regularizedPetersson (Γ : Subgroup (GL (Fin 2) ℝ)) (k : ℤ) (g h : ℍ → ℂ) : ℂ :=
  ((Γ.comap (mapGL (R := ℤ) ℝ)).index : ℂ)⁻¹ * limUnder atTop fun T : ℝ ↦
    ∑ᶠ q : CosetsPM Γ, ∫ τ in truncatedFd T, petersson k (h ∣[k] q.out⁻¹) (g ∣[k] q.out⁻¹) τ

theorem regularizedPetersson_tendsto [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ)
    (g : ModularForm Γ k) (h : WeaklyHolomorphicModularForm Γ k)
    (hh : ∀ q : CosetsPM Γ, holoCoeffAt (commonWidth Γ) (⇑h ∣[k] q.out⁻¹) 0 = 0) :
    Tendsto (fun T : ℝ ↦ ∑ᶠ q : CosetsPM Γ,
        ∫ τ in truncatedFd T, petersson k (⇑h ∣[k] q.out⁻¹) (⇑g ∣[k] q.out⁻¹) τ) atTop
      (𝓝 (((Γ.comap (mapGL (R := ℤ) ℝ)).index : ℂ) * regularizedPetersson Γ k g h)) := sorry

theorem regularizedPetersson_eq_of_isCuspForm [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ)
    (g : ModularForm Γ k) (h : CuspForm Γ k) :
    regularizedPetersson Γ k g h = ((Γ.comap (mapGL (R := ℤ) ℝ)).index : ℂ)⁻¹ * peterssonCosets Γ k h g :=
  sorry

/-- QM.3/regularized-pairing-with-bol-image (Bruinier–Ono–Rhoades Thm 4.1, with the factor
`(k-2)!` restored, sourceIssue E408). -/
theorem regularizedPetersson_iteratedRaising [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ)
    (k : ℕ) (hk : 2 ≤ k) (hk1 : (2 - k : ℤ) ≠ 1) (g : ModularForm Γ k)
    {f : HarmonicMaassForm Γ (2 - k)} (hf : f ∈ HarmonicMaassForm.plusSpace hk1) :
    regularizedPetersson Γ k g (iteratedRaising (2 - k) (k - 1) f) =
      (-1) ^ k * (k - 2).factorial / ((Γ.comap (mapGL (R := ℤ) ℝ)).index : ℂ) *
        ∑ᶠ q : CosetsPM Γ, holoCoeffAt (commonWidth Γ) (⇑g ∣[(k : ℤ)] q.out⁻¹) 0 *
          conj (holoCoeffAt (commonWidth Γ) (⇑f ∣[(2 - k : ℤ)] q.out⁻¹) 0) := sorry

/-- QM.3/image-of-bol-operator: the image of `D^{k-1}` on `H_{2-k}^+` is the set of
`h ∈ M^!_k` with vanishing constant terms that are orthogonal to cusp forms. -/
theorem exists_qDeriv_iterate_eq_iff [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ) (k : ℕ)
    (hk : 2 ≤ k) (hk1 : (2 - k : ℤ) ≠ 1) (h : WeaklyHolomorphicModularForm Γ k) :
    (∃ f ∈ HarmonicMaassForm.plusSpace (Γ := Γ) hk1, ⇑h = qDeriv^[k - 1] f) ↔
      (∀ q : CosetsPM Γ, holoCoeffAt (commonWidth Γ) (⇑h ∣[(k : ℤ)] q.out⁻¹) 0 = 0) ∧
        ∀ g : CuspForm Γ k, regularizedPetersson Γ k g h = 0 := sorry

/-- Unit test `regularizedPetersson_cuspForm_test`: on cusp forms the regularized product is the
index-normalised Petersson product. -/
example [Γ.IsArithmetic] [Γ.HasDetOne] (hΓ : Γ ≤ 𝒮ℒ) (g h : CuspForm Γ k) :
    regularizedPetersson Γ k g h = ((Γ.comap (mapGL (R := ℤ) ℝ)).index : ℂ)⁻¹ * peterssonCosets Γ k h g :=
  sorry

/-- Unit test `regularizedPetersson_zero_test`: `(g, 0)^{reg} = 0`. -/
example (g : ℍ → ℂ) : regularizedPetersson Γ k g 0 = 0 := sorry

/-- Unit test `regularizedPetersson_ne_test`: for `g = h = E₁₂` the truncated integrals grow like
`T¹¹/11`: the hypothesis on constant terms cannot be dropped. -/
example :
    Tendsto (fun T : ℝ ↦ (∫ τ in truncatedFd T, petersson 12 (ModularForm.E (k := 12) (by norm_num))
      (ModularForm.E (k := 12) (by norm_num)) τ) / T ^ 11) atTop (𝓝 (1 / 11)) := sorry

/-! ### The non-holomorphic Eisenstein series `E₂*` (QM.3/nonholomorphic-eisenstein-series-e2-star) -/

/-- `E₂*(τ) = E₂(τ) - 3/(πv)`. -/
def e2Star (τ : ℍ) : ℂ := EisensteinSeries.E2 τ - 3 / (π * τ.im)

theorem e2Star_slash (γ : SL(2, ℤ)) : e2Star ∣[(2 : ℤ)] γ = e2Star := sorry

/-- `E₂*` as an element of `H_2(SL(2, ℤ))`. -/
def e2StarHarmonic : HarmonicMaassForm 𝒮ℒ 2 where
  toFun := e2Star
  slash_action_eq' := sorry
  contDiff' := sorry
  harmonic' := sorry
  expGrowth' := sorry

theorem xiOperator_e2Star : xiOperator 2 e2Star = fun _ ↦ (3 / π : ℂ) := sorry

theorem e2Star_not_mem_plusSpace : e2StarHarmonic ∉ HarmonicMaassForm.plusSpace (k := 2) (by norm_num) :=
  sorry

/-- Unit test `e2Star_slash_test`: `E₂*|₂γ = E₂*` for all `γ ∈ SL(2, ℤ)`. -/
example (γ : SL(2, ℤ)) : e2Star ∣[(2 : ℤ)] γ = e2Star := sorry

/-- Unit test `e2Star_i_test`: `E₂*(i) = 0`, i.e. `E₂(i) = 3/π`. -/
example : e2Star UpperHalfPlane.I = 0 := sorry

/-- Unit test `e2Star_ne_E2_test`: `E₂* ≠ E₂`, and `E₂` is not invariant of weight 2. -/
example : e2Star ≠ EisensteinSeries.E2 ∧ EisensteinSeries.E2 ∣[(2 : ℤ)] ModularGroup.S ≠ EisensteinSeries.E2 :=
  sorry

/-- Unit test `xi_e2Star_const_test`: `ξ_2(E₂*) = 3/π`, the `ξ`-image of `-(3/π)v⁻¹`. -/
example :
    xiOperator 2 e2Star = (fun _ ↦ (3 / π : ℂ)) ∧
      xiOperator 2 (fun τ ↦ -(3 / π : ℂ) * ((τ.im ^ (-1 : ℝ) : ℝ) : ℂ)) = fun _ ↦ (3 / π : ℂ) := sorry

/-! ### Unit tests that use the Poincaré series and `E₂*` -/

/-- Unit test `e2Star_mem_test`: `E₂*` underlies an element of `H_2(SL(2, ℤ))`. -/
example : ∃ F : HarmonicMaassForm 𝒮ℒ 2, ⇑F = e2Star := ⟨e2StarHarmonic, rfl⟩

/-- Unit test `xi_e2Star_test`: `ξ_2(E₂*)` is the constant form `3/π`. -/
example : ⇑(HarmonicMaassForm.xi (k := 2) (by norm_num) e2StarHarmonic) = fun _ ↦ (3 / π : ℂ) := sorry

/-- Unit test `e2Star_not_mem_plusSpace_test`: `E₂* ∉ H_2^+(SL(2, ℤ))`. -/
example : e2StarHarmonic ∉ HarmonicMaassForm.plusSpace (k := 2) (by norm_num) := sorry

/-- Unit test `holoCoeff_maassPoincare_test`: `a⁺(-m) = 1` and `a⁺(n) = 0` for
`n < -m` for `Q(-m, k, N)`. -/
example (m : ℕ) (hm : 1 ≤ m) (k : ℤ) (N : ℕ) [NeZero N] (hk : 4 ≤ k) (hke : Even k) :
    (maassPoincareSeries_toHarmonic m k N hk hke).holoCoeff (-m) = 1 ∧
      ∀ n : ℤ, n < -m → (maassPoincareSeries_toHarmonic m k N hk hke).holoCoeff n = 0 := sorry

/-- Unit test `holomorphicPart_not_invariant_test`: the holomorphic part of
`Q(-1, 12, 1)` is not invariant under `|_{-10} SL(2, ℤ)`. -/
example :
    ¬ ∀ γ : SL(2, ℤ), HarmonicMaassForm.holomorphicPart
        (maassPoincareSeries_toHarmonic 1 12 1 (by norm_num) (by decide)) ∣[(-10 : ℤ)] γ =
      HarmonicMaassForm.holomorphicPart
        (maassPoincareSeries_toHarmonic 1 12 1 (by norm_num) (by decide)) := sorry

/-- Unit test `principalPart_ne_nonHolo_test`: the principal part of
`Q(-m, k, N)` is `T^{-m} + a⁺(0)`; the non-holomorphic term of order `q^{-m}` does not
contribute. -/
example (m : ℕ) (hm : 1 ≤ m) (k : ℤ) (N : ℕ) [NeZero N] (hk : 4 ≤ k) (hke : Even k) :
    HarmonicMaassForm.principalPart (maassPoincareSeries_toHarmonic m k N hk hke) =
      LaurentPolynomial.T (-m) +
        LaurentPolynomial.C ((maassPoincareSeries_toHarmonic m k N hk hke).holoCoeff 0) := sorry

/-- Unit test `bruinierFunkePairing_maassPoincare_test`: for `g ∈ S_k(SL(2, ℤ))` with coefficients
`b(n)`, `{g, Q(-m, k, 1)} = b(m)`. -/
example (m : ℕ) (hm : 1 ≤ m) (k : ℤ) (hk : 4 ≤ k) (hke : Even k)
    (g : CuspForm (gamma0GL 1) k) :
    bruinierFunkePairing (k := 2 - k) (by simpa using (g : ModularForm (gamma0GL 1) k))
        (maassPoincareSeries_toHarmonic m k 1 hk hke) = holoCoeffAt 1 g m := sorry

/-- Unit test `bruinierFunkePairing'_ne_test`: `{E₁₂, Q(-1, 12, 1)} = 0` but
`{E₁₂, Q(-1, 12, 1)}′ = b_{E₁₂}(1) = 65520/691 ≠ 0`. -/
example (E : ModularForm (gamma0GL 1) (2 - (2 - 12)))
    (hE : ⇑E = ⇑(ModularForm.E (k := 12) (by norm_num))) :
    bruinierFunkePairing E (maassPoincareSeries_toHarmonic 1 12 1 (by norm_num) (by decide)) = 0 ∧
      bruinierFunkePairing' E (maassPoincareSeries_toHarmonic 1 12 1 (by norm_num) (by decide)) =
        65520 / 691 := sorry

/-- Unit test `maassPoincare_seed_test`: `ψ_m = e(-mτ) - Γ(k-1, 4πmv) e(-mτ)/(k-2)!`. -/
example (m : ℕ) (k : ℤ) (hk : 4 ≤ k) (τ : ℍ) :
    maassPoincareSeed m k τ = fourierMode (-m) 1 τ -
      (upperIncompleteGamma (k - 1) (4 * π * m * τ.im) : ℂ) * fourierMode (-m) 1 τ /
        ((k - 2).toNat.factorial : ℂ) := sorry

/-- Unit test `maassPoincare_mem_plusSpace_test`: `Q(-m, k, N) ∈ H_{2-k}^+(Γ₀(N))`. -/
example (m : ℕ) (hm : 1 ≤ m) (k : ℤ) (N : ℕ) [NeZero N] (hk : 4 ≤ k) (hke : Even k)
    (hk1 : 2 - k ≠ 1) :
    maassPoincareSeries_toHarmonic m k N hk hke ∈ HarmonicMaassForm.plusSpace hk1 := sorry

/-- Unit test `maassPoincare_constant_term_test`: for `m = N = 1`, `k = 12`, the holomorphic part
has constant term `-65520/691` (Bruinier–Ono–Rhoades print `-0.04629`, sourceIssue E405). -/
example :
    (maassPoincareSeries_toHarmonic 1 12 1 (by norm_num) (by decide)).holoCoeff 0 = -65520 / 691 :=
  sorry

/-- Unit test `maassPoincare_not_weaklyHolomorphic_test`: `ξ_{-10} Q(-1, 12, 1) ≠ 0`, so
`Q(-1, 12, 1)` is not holomorphic. -/
example : xiOperator (2 - 12) (maassPoincareSeries 1 12 1) ≠ 0 := sorry

/-- Unit test `regularizedPetersson_bol_test`: level one, `(Δ, D^{11} Q(-1, 12, 1))^{reg} = 0`. -/
example :
    regularizedPetersson (gamma0GL 1) 12 ModularForm.discriminant
      (qDeriv^[11] (maassPoincareSeries 1 12 1)) = 0 := sorry

end QM3

end TauCeti.QSeries
end

end QM3File


-- ===== QM.4 =====

section QM4File

/-
QM.4 Mock modular completions: the suggested-Lean section of BP-QSeriesPartitionsAndMockModularForms.
This file is not the roadmap and is not exhaustive; the roadmap document is definitive, and these
statements suggest Lean forms so that contributors and reviewers converge on names and signatures.
Nothing here is an implementation claim.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Tau Ceti (f790474) is not imported, because it is
not built here; `TauCeti.Real.erf` is replaced by the stand-in `erfLocal`
(TauCeti/Analysis/SpecialFunctions/Erf). The declarations of the earlier stages of this roadmap
that QM.4 uses are replaced by stand-ins with the same content, so that the section elaborates
alone; in the merged file they are to be replaced by the originals:
* `zwegersThetaLocal` for QM.1's `oddJacobiTheta` (QM.1/jacobi-theta-function);
* `thetaIndexLocal` for QM.1's `jacobiThetaIndex` (QM.1/jacobi-theta-index), arguments `(z; τ)`;
* `upperIncompleteGammaLocalQM3`, `wirtingerDerivLocalQM3`, `dTauBarLocalQM3`,
  `xiOperatorLocalQM3`, `hyperbolicLaplacianLocalQM3` for QM.3's `upperIncompleteGamma`,
  `Complex.wirtingerDeriv`, `dTauBar`, `xiOperator`, `hyperbolicLaplacian`;
* the laws (E), (M) are written out; QM.1 expresses them as invariance under
  `jacobiEllipticSlash` and `jacobiModularSlash`, and `IsJacobiFormLocal` stands for membership in
  QM.1's `JacobiForm` (trivial multiplier and character).
The eta multiplier of QM.1 is not needed: `v(γ)^{-3}(cτ + d)^{1/2} = (cτ + d)² (η(τ)/η(γτ))³`.

Conventions (Zwegers): functions of `(z; τ)` with `τ ∈ ℂ`, hypotheses `0 < Im τ`; `e(x) = exp(2πix)`;
`(-iτ)^{s}` is the principal power.
-/

noncomputable section

namespace TauCeti.QSeries

section QM4

set_option linter.unusedSectionVars false

open _root_.Complex Filter Asymptotics MeasureTheory
open UpperHalfPlane hiding I
open scoped Topology Real ComplexConjugate MatrixGroups Matrix

/-! ### Stand-ins -/

/-- Stand-in for `TauCeti.Real.erf`. -/
def erfLocal (x : ℝ) : ℝ := 2 / √π * ∫ t in (0 : ℝ)..x, Real.exp (-t ^ 2)

/-- Stand-in for QM.1's `oddJacobiTheta`: `ϑ(z; τ) = Σ_{ν ∈ 1/2 + ℤ} e^{πiν²τ + 2πiν(z + 1/2)}`. -/
def zwegersThetaLocal (z τ : ℂ) : ℂ :=
  ∑' n : ℤ, cexp (π * I * ((n : ℂ) + 1 / 2) ^ 2 * τ + 2 * π * I * ((n : ℂ) + 1 / 2) * (z + 1 / 2))

/-- Stand-in for QM.1's `jacobiThetaIndex`: `ϑ_{m,l}(z; τ) = Σ_{λ ≡ l (2m)} e^{πiλ²τ/(2m) + 2πiλz}`. -/
def thetaIndexLocal (m : ℕ) (l : ℤ) (z τ : ℂ) : ℂ :=
  ∑' n : ℤ, cexp (2 * π * I * (((2 * m * n + l : ℤ) : ℂ) ^ 2 / (4 * m) * τ + (2 * m * n + l : ℤ) * z))

/-- Stand-in for QM.3's `upperIncompleteGamma`. -/
def upperIncompleteGammaLocalQM3 (s x : ℝ) : ℝ :=
  if 0 < x then ∫ t in Set.Ioi x, t ^ (s - 1) * Real.exp (-t) else 0

/-- Stand-in for QM.3's `Complex.wirtingerDeriv`. -/
def wirtingerDerivLocalQM3 (F : ℂ → ℂ) (z : ℂ) : ℂ :=
  (1 / 2 : ℂ) * (fderiv ℝ F z 1 - I * fderiv ℝ F z I)

/-- Stand-in for QM.3's `dTauBar`. -/
def dTauBarLocalQM3 (f : ℍ → ℂ) (τ : ℍ) : ℂ :=
  (1 / 2 : ℂ) * (fderiv ℝ (f ∘ ofComplex) τ 1 + I * fderiv ℝ (f ∘ ofComplex) τ I)

/-- Stand-in for QM.3's `xiOperator`: `ξ_k f = 2i v^k conj(∂_τ̄ f)`. -/
def xiOperatorLocalQM3 (k : ℝ) (f : ℍ → ℂ) (τ : ℍ) : ℂ :=
  2 * I * ((τ.im ^ k : ℝ) : ℂ) * conj (dTauBarLocalQM3 f τ)

/-- Stand-in for QM.3's `hyperbolicLaplacian`: `Δ_k f = -4v²∂_τ∂_τ̄ f + 2ikv ∂_τ̄ f`. -/
def hyperbolicLaplacianLocalQM3 (k : ℝ) (f : ℍ → ℂ) (τ : ℍ) : ℂ :=
  -4 * (τ.im : ℂ) ^ 2 * wirtingerDerivLocalQM3 (fun z ↦ dTauBarLocalQM3 f (ofComplex z)) τ +
    2 * I * k * τ.im * dTauBarLocalQM3 f τ

/-- `u ∉ ℤτ + ℤ`. -/
def NotInLattice (u τ : ℂ) : Prop := ∀ m n : ℤ, u ≠ m * τ + n

/-- `ζ_N = e^{2πi/N}`. -/
def zetaN (N : ℕ) : ℂ := cexp (2 * π * I / N)

/-! ### The error function `E` and `β` (QM.4/zwegers-error-function, QM.4/zwegers-beta-function) -/

/-- Zwegers' `E(x) = 2∫₀ˣ e^{-πu²} du`. -/
def zwegersE (x : ℝ) : ℝ := 2 * ∫ u in (0 : ℝ)..x, Real.exp (-π * u ^ 2)

theorem zwegersE_eq_erf (x : ℝ) : zwegersE x = erfLocal (√π * x) := sorry

theorem zwegersE_neg (x : ℝ) : zwegersE (-x) = -zwegersE x := sorry

theorem hasDerivAt_zwegersE (x : ℝ) : HasDerivAt zwegersE (2 * Real.exp (-π * x ^ 2)) x := sorry

theorem abs_zwegersE_lt_one (x : ℝ) : |zwegersE x| < 1 := sorry

theorem tendsto_zwegersE_atTop :
    Tendsto zwegersE atTop (𝓝 1) ∧ Tendsto zwegersE atBot (𝓝 (-1)) := sorry

/-- Unit test `zwegersE_zero_test`: `E(0) = 0`. -/
example : zwegersE 0 = 0 := sorry

/-- Unit test `zwegersE_eq_erf_test`: `E(x) = erf(√π x)`. -/
example (x : ℝ) : zwegersE x = erfLocal (√π * x) := sorry

/-- Unit test `zwegersE_deriv_test`: `E′(0) = 2`. -/
example : deriv zwegersE 0 = 2 := sorry

/-- Unit test `zwegersE_tendsto_test`: `E(x) → ±1` as `x → ±∞`. -/
example : Tendsto zwegersE atTop (𝓝 1) ∧ Tendsto zwegersE atBot (𝓝 (-1)) := sorry

/-- Zwegers' `β(x) = ∫_x^∞ u^{-1/2} e^{-πu} du`. -/
def zwegersBeta (x : ℝ) : ℝ := ∫ u in Set.Ioi x, u ^ (-(1 / 2 : ℝ)) * Real.exp (-π * u)

theorem zwegersBeta_eq_upperIncompleteGamma {x : ℝ} (hx : 0 < x) :
    zwegersBeta x = π ^ (-(1 / 2 : ℝ)) * upperIncompleteGammaLocalQM3 (1 / 2) (π * x) := sorry

theorem zwegersBeta_eq_erfc {x : ℝ} (hx : 0 ≤ x) : zwegersBeta x = 1 - erfLocal (√(π * x)) := sorry

theorem zwegersBeta_le_exp {x : ℝ} (hx : 0 ≤ x) :
    0 ≤ zwegersBeta x ∧ zwegersBeta x ≤ Real.exp (-π * x) := sorry

theorem tendsto_zwegersBeta_atTop : Tendsto zwegersBeta atTop (𝓝 0) := sorry

/-- QM.4/error-function-sign-beta (Zwegers Lemma 1.7): `E(x) = sgn(x)(1 - β(x²))`. -/
theorem zwegersE_eq_sign_mul (x : ℝ) : zwegersE x = Real.sign x * (1 - zwegersBeta (x ^ 2)) := sorry

/-- Unit test `zwegersBeta_zero_test`: `β(0) = 1`. -/
example : zwegersBeta 0 = 1 := sorry

/-- Unit test `zwegersBeta_eq_erfc_test`: `β(x) = erfc(√(πx))` for `x ≥ 0`. -/
example {x : ℝ} (hx : 0 ≤ x) : zwegersBeta x = 1 - erfLocal (√(π * x)) := sorry

/-- Unit test `zwegersBeta_le_exp_test`: `0 ≤ β(x) ≤ e^{-πx}`. -/
example {x : ℝ} (hx : 0 ≤ x) : 0 ≤ zwegersBeta x ∧ zwegersBeta x ≤ Real.exp (-π * x) := sorry

/-- Unit test `zwegersBeta_ne_upper_gamma_test`: `β(1) = π^{-1/2}Γ(1/2, π) ≠ Γ(1/2, 1)`. -/
example :
    zwegersBeta 1 = π ^ (-(1 / 2 : ℝ)) * upperIncompleteGammaLocalQM3 (1 / 2) π ∧
      zwegersBeta 1 ≠ upperIncompleteGammaLocalQM3 (1 / 2) 1 := sorry

/-! ### The Mordell integral (QM.4/mordell-integral) -/

/-- `h(z; τ) = ∫_ℝ e^{πiτx² - 2πzx} / cosh(πx) dx` (Zwegers Def. 1.1). -/
def mordellIntegral (z τ : ℂ) : ℂ :=
  ∫ x : ℝ, cexp (π * I * τ * x ^ 2 - 2 * π * z * x) / Complex.cosh (π * x)

theorem mordellIntegral_neg (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    mordellIntegral (-z) τ = mordellIntegral z τ := sorry

theorem differentiable_mordellIntegral {τ : ℂ} (hτ : 0 < τ.im) :
    Differentiable ℂ fun z ↦ mordellIntegral z τ := sorry

theorem mordellIntegral_integrable (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    Integrable fun x : ℝ ↦ cexp (π * I * τ * x ^ 2 - 2 * π * z * x) / Complex.cosh (π * x) := sorry

/-- QM.4/mordell-integral-s-transformation (Zwegers Prop. 1.2(5)). -/
theorem mordellIntegral_S (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    mordellIntegral (z / τ) (-1 / τ) =
      (-I * τ) ^ (1 / 2 : ℂ) * cexp (-π * I * z ^ 2 / τ) * mordellIntegral z τ := sorry

/-- Unit test `mordellIntegral_neg_test`: `h(-z) = h(z)`. -/
example (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) : mordellIntegral (-z) τ = mordellIntegral z τ := sorry

/-- Unit test `mordellIntegral_shift_test`: `h(z) + h(z + 1) = 2(-iτ)^{-1/2} e^{πi(z+1/2)²/τ}`. -/
example (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    mordellIntegral z τ + mordellIntegral (z + 1) τ =
      2 * (-I * τ) ^ (-(1 / 2 : ℂ)) * cexp (π * I * (z + 1 / 2) ^ 2 / τ) := sorry

/-- Unit test `mordellIntegral_zero_i_pos_test`: `h(0; i)` is real and positive. -/
example : (mordellIntegral 0 I).im = 0 ∧ 0 < (mordellIntegral 0 I).re := sorry

/-- Unit test `mordellIntegral_not_periodic_test`: `h(1; i) ≠ h(0; i)`. -/
example : mordellIntegral 1 I ≠ mordellIntegral 0 I := sorry

/-! ### The Appell–Lerch sum (QM.4/appell-lerch-sum) -/

/-- The summand `(-1)ⁿ e^{πi(n²+n)τ + 2πinv} / (1 - e^{2πinτ + 2πiu})`. -/
def appellLerchTerm (u v τ : ℂ) (n : ℤ) : ℂ :=
  (-1 : ℂ) ^ n * cexp (π * I * ((n : ℂ) ^ 2 + n) * τ + 2 * π * I * n * v) /
    (1 - cexp (2 * π * I * n * τ + 2 * π * I * u))

/-- `μ(u, v; τ) = e^{πiu}/ϑ(v; τ) · Σ_n (-1)ⁿ e^{πi(n²+n)τ + 2πinv}/(1 - e^{2πinτ + 2πiu})`. -/
def appellLerch (u v τ : ℂ) : ℂ :=
  cexp (π * I * u) / zwegersThetaLocal v τ * ∑' n : ℤ, appellLerchTerm u v τ n

theorem appellLerch_summable {u v τ : ℂ} (hτ : 0 < τ.im) (hu : NotInLattice u τ) :
    Summable fun n : ℤ ↦ ‖appellLerchTerm u v τ n‖ := sorry

theorem oddJacobiTheta_mul_appellLerch {u v τ : ℂ} (hτ : 0 < τ.im) (hv : NotInLattice v τ) :
    zwegersThetaLocal v τ * appellLerch u v τ = cexp (π * I * u) * ∑' n : ℤ, appellLerchTerm u v τ n :=
  sorry

theorem meromorphic_appellLerch (v : ℂ) {τ : ℂ} (hτ : 0 < τ.im) (hv : NotInLattice v τ) (u : ℂ) :
    MeromorphicAt (fun u ↦ appellLerch u v τ) u := sorry

/-- QM.4/appell-lerch-translation-tau (Zwegers Prop. 1.4(3)). -/
theorem appellLerch_add_tau {u v τ : ℂ} (hτ : 0 < τ.im) (hu : NotInLattice u τ)
    (hv : NotInLattice v τ) :
    appellLerch u v τ + cexp (-2 * π * I * (u - v) - π * I * τ) * appellLerch (u + τ) v τ =
      -I * cexp (-π * I * (u - v) - π * I * τ / 4) := sorry

/-- QM.4/odd-theta-derivative-transformations (Zwegers Prop. 1.3(9)). -/
theorem deriv_zwegersTheta_zero_transform {τ : ℂ} (hτ : 0 < τ.im) :
    deriv (fun z ↦ zwegersThetaLocal z (τ + 1)) 0 = cexp (π * I / 4) * deriv (fun z ↦ zwegersThetaLocal z τ) 0 ∧
      deriv (fun z ↦ zwegersThetaLocal z (-1 / τ)) 0 =
        (-I * τ) ^ (3 / 2 : ℂ) * deriv (fun z ↦ zwegersThetaLocal z τ) 0 := sorry

/-- QM.4/appell-lerch-difference-formula (Zwegers Prop. 1.4(7)). -/
theorem appellLerch_add_sub {u v z τ : ℂ} (hτ : 0 < τ.im) (hu : NotInLattice u τ)
    (hv : NotInLattice v τ) (huz : NotInLattice (u + z) τ) (hvz : NotInLattice (v + z) τ) :
    appellLerch (u + z) (v + z) τ - appellLerch u v τ =
      (2 * π * I)⁻¹ * deriv (fun w ↦ zwegersThetaLocal w τ) 0 * zwegersThetaLocal (u + v + z) τ *
          zwegersThetaLocal z τ /
        (zwegersThetaLocal u τ * zwegersThetaLocal v τ * zwegersThetaLocal (u + z) τ *
          zwegersThetaLocal (v + z) τ) := sorry

/-- QM.4/appell-lerch-s-transformation (Zwegers Prop. 1.5(2)). -/
theorem appellLerch_S {u v τ : ℂ} (hτ : 0 < τ.im) (hu : NotInLattice u τ) (hv : NotInLattice v τ) :
    (-I * τ) ^ (-(1 / 2 : ℂ)) * cexp (π * I * (u - v) ^ 2 / τ) * appellLerch (u / τ) (v / τ) (-1 / τ) +
        appellLerch u v τ = (2 * I)⁻¹ * mordellIntegral (u - v) τ := sorry

/-- Unit test `appellLerch_symm_test`: `μ(u, v) = μ(v, u)`. -/
example {u v τ : ℂ} (hτ : 0 < τ.im) (hu : NotInLattice u τ) (hv : NotInLattice v τ) :
    appellLerch u v τ = appellLerch v u τ := sorry

/-- Unit test `appellLerch_residue_test`: `lim_{u → 0} u μ(u, v) = -1/(2πi ϑ(v))`. -/
example {v τ : ℂ} (hτ : 0 < τ.im) (hv : NotInLattice v τ) :
    Tendsto (fun u ↦ u * appellLerch u v τ) (𝓝[≠] 0) (𝓝 (-1 / (2 * π * I * zwegersThetaLocal v τ))) :=
  sorry

/-- Unit test `appellLerch_neg_test`: `μ(-u, -v) = μ(u, v)`. -/
example {u v τ : ℂ} (hτ : 0 < τ.im) (hu : NotInLattice u τ) (hv : NotInLattice v τ) :
    appellLerch (-u) (-v) τ = appellLerch u v τ := sorry

/-- Unit test `appellLerch_not_elliptic_test`: `μ(u + τ, v) ≠ -e^{2πi(u-v)+πiτ} μ(u, v)` in
general; only `μ̃` is elliptic. -/
example {τ : ℂ} (hτ : 0 < τ.im) :
    ∃ u v : ℂ, NotInLattice u τ ∧ NotInLattice v τ ∧
      appellLerch (u + τ) v τ ≠ -cexp (2 * π * I * (u - v) + π * I * τ) * appellLerch u v τ := sorry

/-! ### The correction `R` (QM.4/zwegers-r-function) -/

/-- The summand of `R`, `ν = n + 1/2`, `a = Im u / Im τ`. -/
def zwegersRTerm (u τ : ℂ) (n : ℤ) : ℂ :=
  ((Real.sign ((n : ℝ) + 1 / 2) - zwegersE (((n : ℝ) + 1 / 2 + u.im / τ.im) * √(2 * τ.im)) : ℝ) : ℂ) *
    (-1 : ℂ) ^ n * cexp (-π * I * ((n : ℂ) + 1 / 2) ^ 2 * τ - 2 * π * I * ((n : ℂ) + 1 / 2) * u)

/-- `R(u; τ) = Σ_{ν ∈ 1/2 + ℤ} {sgn ν - E((ν + a)√(2y))}(-1)^{ν-1/2} e^{-πiν²τ - 2πiνu}`. -/
def zwegersR (u τ : ℂ) : ℂ := ∑' n : ℤ, zwegersRTerm u τ n

theorem zwegersR_summable (u : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    Summable fun n : ℤ ↦ ‖zwegersRTerm u τ n‖ := sorry

theorem zwegersR_eq_sign_add_beta (u : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    zwegersR u τ = ∑' n : ℤ,
      ((Real.sign ((n : ℝ) + 1 / 2) - Real.sign ((n : ℝ) + 1 / 2 + u.im / τ.im) +
        Real.sign ((n : ℝ) + 1 / 2 + u.im / τ.im) *
          zwegersBeta (2 * ((n : ℝ) + 1 / 2 + u.im / τ.im) ^ 2 * τ.im) : ℝ) : ℂ) *
        (-1 : ℂ) ^ n * cexp (-π * I * ((n : ℂ) + 1 / 2) ^ 2 * τ - 2 * π * I * ((n : ℂ) + 1 / 2) * u) :=
  sorry

theorem continuous_zwegersR :
    ContinuousOn (fun p : ℂ × ℂ ↦ zwegersR p.1 p.2) {p | 0 < p.2.im} := sorry

/-- QM.4/zwegers-r-translation-tau (Zwegers Prop. 1.9(2)). -/
theorem zwegersR_add_tau (u : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    zwegersR u τ + cexp (-2 * π * I * u - π * I * τ) * zwegersR (u + τ) τ =
      2 * cexp (-π * I * u - π * I * τ / 4) := sorry

/-- QM.4/zwegers-r-s-transformation (Zwegers Prop. 1.10(2)). -/
theorem zwegersR_S (u : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    (-I * τ) ^ (-(1 / 2 : ℂ)) * cexp (π * I * u ^ 2 / τ) * zwegersR (u / τ) (-1 / τ) + zwegersR u τ =
      mordellIntegral u τ := sorry

/-- Unit test `zwegersR_add_one_test`: `R(u + 1) = -R(u)`. -/
example (u : ℂ) {τ : ℂ} (hτ : 0 < τ.im) : zwegersR (u + 1) τ = -zwegersR u τ := sorry

/-- Unit test `zwegersR_neg_test`: `R(-u) = R(u)`. -/
example (u : ℂ) {τ : ℂ} (hτ : 0 < τ.im) : zwegersR (-u) τ = zwegersR u τ := sorry

/-- Unit test `zwegersR_not_holomorphic_test`: `R` is not holomorphic in `u`. -/
example {τ : ℂ} (hτ : 0 < τ.im) : ∃ u : ℂ, ¬ DifferentiableAt ℂ (fun u ↦ zwegersR u τ) u := sorry

/-- Unit test `zwegersR_t_test`: `R(u; τ + 1) = e^{-πi/4} R(u; τ)`. -/
example (u : ℂ) {τ : ℂ} (hτ : 0 < τ.im) : zwegersR u (τ + 1) = cexp (-π * I / 4) * zwegersR u τ :=
  sorry

/-! ### The completion `μ̃` (QM.4/zwegers-completion) -/

/-- `μ̃(u, v; τ) = μ(u, v; τ) + (i/2) R(u - v; τ)` (Zwegers (1.8)). -/
def zwegersCompletion (u v τ : ℂ) : ℂ := appellLerch u v τ + I / 2 * zwegersR (u - v) τ

theorem zwegersCompletion_symm {u v τ : ℂ} (hτ : 0 < τ.im) (hu : NotInLattice u τ)
    (hv : NotInLattice v τ) :
    zwegersCompletion (-u) (-v) τ = zwegersCompletion u v τ ∧
      zwegersCompletion v u τ = zwegersCompletion u v τ := sorry

theorem zwegersCompletion_diff {u v z τ : ℂ} (hτ : 0 < τ.im) (hu : NotInLattice u τ)
    (hv : NotInLattice v τ) (huz : NotInLattice (u + z) τ) (hvz : NotInLattice (v + z) τ) :
    zwegersCompletion (u + z) (v + z) τ - zwegersCompletion u v τ =
      (2 * π * I)⁻¹ * deriv (fun w ↦ zwegersThetaLocal w τ) 0 * zwegersThetaLocal (u + v + z) τ *
          zwegersThetaLocal z τ /
        (zwegersThetaLocal u τ * zwegersThetaLocal v τ * zwegersThetaLocal (u + z) τ *
          zwegersThetaLocal (v + z) τ) := sorry

theorem zwegersCompletion_residue {v τ : ℂ} (hτ : 0 < τ.im) (hv : NotInLattice v τ) :
    Tendsto (fun u ↦ u * zwegersCompletion u v τ) (𝓝[≠] 0)
      (𝓝 (-1 / (2 * π * I * zwegersThetaLocal v τ))) := sorry

/-- QM.4/completion-elliptic-transformation (Zwegers Thm 1.11(1)). -/
theorem zwegersCompletion_add_lattice {u v τ : ℂ} (hτ : 0 < τ.im) (hu : NotInLattice u τ)
    (hv : NotInLattice v τ) (k l m n : ℤ) :
    zwegersCompletion (u + k * τ + l) (v + m * τ + n) τ =
      (-1 : ℂ) ^ (k + l + m + n) *
        cexp (π * I * ((k - m : ℤ) : ℂ) ^ 2 * τ + 2 * π * I * (k - m : ℤ) * (u - v)) *
          zwegersCompletion u v τ := sorry

/-- QM.4/completion-modular-transformation (Zwegers Thm 1.11(2)): with the eta multiplier `v(γ)`,
`v(γ)^{-3}(cτ + d)^{1/2} = (cτ + d)² (η(τ)/η(γτ))³`. -/
theorem zwegersCompletion_modular {u v τ : ℂ} (hτ : 0 < τ.im) (hu : NotInLattice u τ)
    (hv : NotInLattice v τ) (γ : SL(2, ℤ)) :
    zwegersCompletion (u / (γ 1 0 * τ + γ 1 1)) (v / (γ 1 0 * τ + γ 1 1))
        ((γ 0 0 * τ + γ 0 1) / (γ 1 0 * τ + γ 1 1)) =
      (γ 1 0 * τ + γ 1 1) ^ 2 *
          (ModularForm.eta τ / ModularForm.eta ((γ 0 0 * τ + γ 0 1) / (γ 1 0 * τ + γ 1 1))) ^ 3 *
        cexp (-π * I * γ 1 0 * (u - v) ^ 2 / (γ 1 0 * τ + γ 1 1)) * zwegersCompletion u v τ := sorry

/-- Unit test `zwegersCompletion_symm_test`: `μ̃(v, u) = μ̃(u, v) = μ̃(-u, -v)`. -/
example {u v τ : ℂ} (hτ : 0 < τ.im) (hu : NotInLattice u τ) (hv : NotInLattice v τ) :
    zwegersCompletion v u τ = zwegersCompletion u v τ ∧
      zwegersCompletion (-u) (-v) τ = zwegersCompletion u v τ := sorry

/-- Unit test `zwegersCompletion_residue_test`: `lim_{u → 0} u μ̃(u, v) = -1/(2πi ϑ(v))`. -/
example {v τ : ℂ} (hτ : 0 < τ.im) (hv : NotInLattice v τ) :
    Tendsto (fun u ↦ u * zwegersCompletion u v τ) (𝓝[≠] 0)
      (𝓝 (-1 / (2 * π * I * zwegersThetaLocal v τ))) := sorry

/-- Unit test `zwegersCompletion_s_test`: `μ̃(u/τ, v/τ; -1/τ) = -√(-iτ) e^{-πi(u-v)²/τ} μ̃(u, v; τ)`. -/
example {u v τ : ℂ} (hτ : 0 < τ.im) (hu : NotInLattice u τ) (hv : NotInLattice v τ) :
    zwegersCompletion (u / τ) (v / τ) (-1 / τ) =
      -(-I * τ) ^ (1 / 2 : ℂ) * cexp (-π * I * (u - v) ^ 2 / τ) * zwegersCompletion u v τ := sorry

/-- Unit test `zwegersCompletion_ne_appellLerch_test`: `μ̃ ≠ μ`. -/
example {τ : ℂ} (hτ : 0 < τ.im) :
    ∃ u v : ℂ, NotInLattice u τ ∧ NotInLattice v τ ∧ zwegersCompletion u v τ ≠ appellLerch u v τ :=
  sorry

/-! ### Unary theta functions and period integrals (QM.4/unary-theta-function) -/

/-- `g_{a,b}(τ) = Σ_{ν ∈ a + ℤ} ν e^{πiν²τ + 2πiνb}` (Zwegers Def. 1.14). -/
def unaryTheta (a b : ℝ) (τ : ℂ) : ℂ :=
  ∑' n : ℤ, (((n : ℝ) + a : ℝ) : ℂ) * cexp (π * I * (((n : ℝ) + a : ℝ) : ℂ) ^ 2 * τ +
    2 * π * I * (((n : ℝ) + a : ℝ) : ℂ) * b)

theorem unaryTheta_add_one_left (a b : ℝ) : unaryTheta (a + 1) b = unaryTheta a b := sorry

theorem unaryTheta_add_one_right (a b : ℝ) :
    unaryTheta a (b + 1) = fun τ ↦ cexp (2 * π * I * a) * unaryTheta a b τ := sorry

theorem unaryTheta_neg (a b : ℝ) : unaryTheta (-a) (-b) = -unaryTheta a b := sorry

theorem differentiable_unaryTheta (a b : ℝ) :
    DifferentiableOn ℂ (unaryTheta a b) {τ : ℂ | 0 < τ.im} := sorry

/-- QM.4/unary-theta-s-transformation (Zwegers Prop. 1.15(5)). -/
theorem unaryTheta_S (a b : ℝ) {τ : ℂ} (hτ : 0 < τ.im) :
    unaryTheta a b (-1 / τ) = I * cexp (2 * π * I * a * b) * (-I * τ) ^ (3 / 2 : ℂ) * unaryTheta b (-a) τ :=
  sorry

/-- Unit test `unaryTheta_add_one_left_test`: `g_{a+1,b} = g_{a,b}`. -/
example (a b : ℝ) : unaryTheta (a + 1) b = unaryTheta a b := sorry

/-- Unit test `unaryTheta_neg_test`: `g_{-a,-b} = -g_{a,b}`. -/
example (a b : ℝ) : unaryTheta (-a) (-b) = -unaryTheta a b := sorry

/-- Unit test `unaryTheta_zero_test`: `g_{0,0} = 0`. -/
example : unaryTheta 0 0 = 0 := sorry

/-- Unit test `unaryTheta_not_weight_half_test`: `g_{0,0} = 0` while `Σ e^{πin²τ} ≠ 0`. -/
example {τ : ℂ} (hτ : 0 < τ.im) : unaryTheta 0 0 τ = 0 ∧ jacobiTheta τ ≠ 0 := sorry

/-- QM.4/r-as-period-integral (Zwegers Thm 1.16(1)): along `z = -τ̄ + it`,
`-i(z + τ) = 2y + t`. -/
theorem zwegersR_eq_periodIntegral {a : ℝ} (ha : a ∈ Set.Ioo (-(1 / 2 : ℝ)) (1 / 2)) (b : ℝ)
    {τ : ℂ} (hτ : 0 < τ.im) :
    ∫ t in Set.Ioi (0 : ℝ), unaryTheta (a + 1 / 2) (b + 1 / 2) (-conj τ + I * t) * I /
        (√(2 * τ.im + t) : ℂ) =
      -cexp (-π * I * a ^ 2 * τ + 2 * π * I * a * (b + 1 / 2)) * zwegersR (a * τ - b) τ := sorry

/-- QM.4/mordell-integral-as-period-integral (Zwegers Thm 1.16(2)). -/
theorem mordellIntegral_eq_periodIntegral {a b : ℝ} (ha : a ∈ Set.Ioo (-(1 / 2 : ℝ)) (1 / 2))
    (hb : b ∈ Set.Ioo (-(1 / 2 : ℝ)) (1 / 2)) {τ : ℂ} (hτ : 0 < τ.im) :
    ∫ t in Set.Ioi (0 : ℝ), unaryTheta (a + 1 / 2) (b + 1 / 2) (I * t) * I / (t - I * τ) ^ (1 / 2 : ℂ) =
      -cexp (-π * I * a ^ 2 * τ + 2 * π * I * a * (b + 1 / 2)) * mordellIntegral (a * τ - b) τ := sorry

/-! ### Indefinite theta functions (QM.4/indefinite-form-of-type-r-minus-one-one and following) -/

/-- An integral quadratic form `Q(x) = ½⟨x, Ax⟩` of type `(r - 1, 1)` with a chosen negative
vector `c₀` (Zwegers §2.2). -/
structure ZwegersForm (r : ℕ) where
  A : Matrix (Fin r) (Fin r) ℤ
  isSymm : A.IsSymm
  det_ne_zero : A.det ≠ 0
  c₀ : Fin r → ℝ
  Q_c₀_neg : c₀ ⬝ᵥ (A.map (Int.cast : ℤ → ℝ) *ᵥ c₀) < 0
  pos_on_orth : ∀ x : Fin r → ℝ, x ≠ 0 → x ⬝ᵥ (A.map (Int.cast : ℤ → ℝ) *ᵥ c₀) = 0 →
    0 < x ⬝ᵥ (A.map (Int.cast : ℤ → ℝ) *ᵥ x)

namespace ZwegersForm

variable {r : ℕ} (F : ZwegersForm r)

/-- `A` as a real matrix. -/
def Areal : Matrix (Fin r) (Fin r) ℝ := F.A.map (Int.cast : ℤ → ℝ)

/-- `Q(x) = ½⟨x, Ax⟩`. -/
def Q (x : Fin r → ℝ) : ℝ := (1 / 2) * (x ⬝ᵥ (F.Areal *ᵥ x))

/-- `B(x, y) = ⟨x, Ay⟩`. -/
def B (x y : Fin r → ℝ) : ℝ := x ⬝ᵥ (F.Areal *ᵥ y)

/-- `B(x, z)` for complex `z`. -/
def Bc (x : Fin r → ℝ) (z : Fin r → ℂ) : ℂ := ∑ i, ∑ j, (x i : ℂ) * F.A i j * z j

theorem B_self (x : Fin r → ℝ) : F.B x x = 2 * F.Q x := sorry

theorem B_neg_of_same_component {c₁ c₂ : Fin r → ℝ} (h₁ : F.Q c₁ < 0) (h₂ : F.Q c₂ < 0)
    (h₁₀ : F.B c₁ F.c₀ < 0) (h₂₀ : F.B c₂ F.c₀ < 0) : F.B c₁ c₂ < 0 := sorry

/-- The negative cone `C_Q = {c : Q(c) < 0, B(c, c₀) < 0}`. -/
def negCone : Set (Fin r → ℝ) := {c | F.Q c < 0 ∧ F.B c F.c₀ < 0}

/-- The cusp vectors `S_Q`: primitive integral `c` with `Q(c) = 0`, `B(c, c₀) < 0`. -/
def cuspVectors : Set (Fin r → ℝ) :=
  {c | (∃ n : Fin r → ℤ, c = (fun i ↦ (n i : ℝ)) ∧ ∀ d : ℤ, (∀ i, d ∣ n i) → IsUnit d) ∧
    F.Q c = 0 ∧ F.B c F.c₀ < 0}

/-- `C̄_Q = C_Q ∪ S_Q`. -/
def closedCone : Set (Fin r → ℝ) := F.negCone ∪ F.cuspVectors

theorem add_smul_mem_negCone {c₂ c₃ : Fin r → ℝ} (h₂ : c₂ ∈ F.cuspVectors) (h₃ : c₃ ∈ F.negCone)
    {t : ℝ} (ht : 0 < t) : c₂ + t • c₃ ∈ F.negCone := sorry

/-- The admissible characteristics `R(c)`: all of `ℝ^r` for `c ∈ C_Q`, `{a : B(c, a) ∉ ℤ}` for
`c ∈ S_Q`. -/
def admissible (c : Fin r → ℝ) : Set (Fin r → ℝ) :=
  {a | c ∈ F.negCone ∨ ∀ n : ℤ, F.B c a ≠ n}

/-- `D(c) = {(z, τ) : Im z / Im τ ∈ R(c)}`. -/
def admissibleDomain (c : Fin r → ℝ) : Set ((Fin r → ℂ) × ℂ) :=
  {p | 0 < p.2.im ∧ (fun i ↦ (p.1 i).im / p.2.im) ∈ F.admissible c}

theorem admissible_add_int {c : Fin r → ℝ} (hc : c ∈ F.closedCone) (a : Fin r → ℝ)
    (n : Fin r → ℤ) : a + (fun i ↦ (n i : ℝ)) ∈ F.admissible c ↔ a ∈ F.admissible c := sorry

/-- `ρ^c(ν; τ)`: `E(B(c, ν) √y / √(-Q(c)))` for `c ∈ C_Q` and `sgn B(c, ν)` for `c ∈ S_Q`. -/
def rho (c ν : Fin r → ℝ) (τ : ℂ) : ℝ :=
  if F.Q c < 0 then zwegersE (F.B c ν * √τ.im / √(-F.Q c)) else Real.sign (F.B c ν)

/-- `ρ^{c₁,c₂} = ρ^{c₁} - ρ^{c₂}`. -/
def rhoPair (c₁ c₂ ν : Fin r → ℝ) (τ : ℂ) : ℝ := F.rho c₁ ν τ - F.rho c₂ ν τ

theorem rhoPair_cocycle (c₁ c₂ c₃ ν : Fin r → ℝ) (τ : ℂ) :
    F.rhoPair c₁ c₂ ν τ + F.rhoPair c₂ c₃ ν τ + F.rhoPair c₃ c₁ ν τ = 0 ∧
      F.rhoPair c₁ c₂ ν τ = -F.rhoPair c₂ c₁ ν τ := sorry

theorem rho_smul {c : Fin r → ℝ} (hc : c ∈ F.closedCone) {t : ℝ} (ht : 0 < t) (ν : Fin r → ℝ)
    (τ : ℂ) : F.rho (t • c) ν τ = F.rho c ν τ := sorry

theorem rho_eq_sign_mul_one_sub_beta {c : Fin r → ℝ} (hc : c ∈ F.negCone) (ν : Fin r → ℝ)
    {τ : ℂ} (hτ : 0 < τ.im) :
    F.rho c ν τ = Real.sign (F.B c ν) * (1 - zwegersBeta (-(F.B c ν) ^ 2 * τ.im / F.Q c)) := sorry

/-- `ϑ^{c₁,c₂}(z; τ) = Σ_{n ∈ ℤ^r} ρ(n + a; τ) e^{2πiQ(n)τ + 2πiB(n, z)}`, `a = Im z / Im τ`. -/
def indefiniteTheta (c₁ c₂ : Fin r → ℝ) (z : Fin r → ℂ) (τ : ℂ) : ℂ :=
  ∑' n : Fin r → ℤ,
    (F.rhoPair c₁ c₂ (fun i ↦ (n i : ℝ) + (z i).im / τ.im) τ : ℂ) *
      cexp (2 * π * I * F.Q (fun i ↦ (n i : ℝ)) * τ + 2 * π * I * F.Bc (fun i ↦ (n i : ℝ)) z)

/-- `ϑ_{a,b}(τ) = Σ_{ν ∈ a + ℤ^r} ρ(ν; τ) e^{2πiQ(ν)τ + 2πiB(ν, b)}`. -/
def indefiniteThetaChar (c₁ c₂ a b : Fin r → ℝ) (τ : ℂ) : ℂ :=
  ∑' n : Fin r → ℤ,
    (F.rhoPair c₁ c₂ (fun i ↦ (n i : ℝ) + a i) τ : ℂ) *
      cexp (2 * π * I * F.Q (fun i ↦ (n i : ℝ) + a i) * τ +
        2 * π * I * F.B (fun i ↦ (n i : ℝ) + a i) b)

theorem indefiniteThetaChar_eq (c₁ c₂ a b : Fin r → ℝ) {τ : ℂ} (hτ : 0 < τ.im) :
    F.indefiniteThetaChar c₁ c₂ a b τ =
      cexp (2 * π * I * F.Q a * τ + 2 * π * I * F.B a b) *
        F.indefiniteTheta c₁ c₂ (fun i ↦ a i * τ + b i) τ := sorry

theorem indefiniteTheta_self (c : Fin r → ℝ) (z : Fin r → ℂ) (τ : ℂ) :
    F.indefiniteTheta c c z τ = 0 := sorry

/-- QM.4/indefinite-theta-convergence (Zwegers Prop. 2.4). -/
theorem indefiniteTheta_summable {c₁ c₂ : Fin r → ℝ} (h₁ : c₁ ∈ F.closedCone)
    (h₂ : c₂ ∈ F.closedCone) {z : Fin r → ℂ} {τ : ℂ}
    (hz : (z, τ) ∈ F.admissibleDomain c₁ ∩ F.admissibleDomain c₂) :
    Summable fun n : Fin r → ℤ ↦ ‖(F.rhoPair c₁ c₂ (fun i ↦ (n i : ℝ) + (z i).im / τ.im) τ : ℂ) *
      cexp (2 * π * I * F.Q (fun i ↦ (n i : ℝ)) * τ + 2 * π * I * F.Bc (fun i ↦ (n i : ℝ)) z)‖ :=
  sorry

/-- Representatives of `A⁻¹ℤ^r / ℤ^r` in `[0, 1)^r`. -/
def discriminantReps : Set (Fin r → ℝ) :=
  {p | (∀ i, 0 ≤ p i ∧ p i < 1) ∧ ∃ n : Fin r → ℤ, F.Areal *ᵥ p = fun i ↦ (n i : ℝ)}

/-- QM.4/indefinite-theta-s-transformation (Zwegers Prop. 2.7(7)), on
`D′(c) = {(z, τ) ∈ D(c) : (z/τ, -1/τ) ∈ D(c)}`. -/
theorem indefiniteTheta_S {c₁ c₂ : Fin r → ℝ} (h₁ : c₁ ∈ F.closedCone) (h₂ : c₂ ∈ F.closedCone)
    {z : Fin r → ℂ} {τ : ℂ} (hz : (z, τ) ∈ F.admissibleDomain c₁ ∩ F.admissibleDomain c₂)
    (hz' : (fun i ↦ z i / τ, -1 / τ) ∈ F.admissibleDomain c₁ ∩ F.admissibleDomain c₂) :
    F.indefiniteTheta c₁ c₂ (fun i ↦ z i / τ) (-1 / τ) =
      I / (√(-(F.A.det : ℝ)) : ℂ) * (-I * τ) ^ ((r : ℂ) / 2) *
        ∑ᶠ (p : Fin r → ℝ) (_ : p ∈ F.discriminantReps),
          cexp (2 * π * I * (∑ i, ∑ j, (z i + p i * τ) * F.A i j * (z j + p j * τ)) / 2 / τ) *
            F.indefiniteTheta c₁ c₂ (fun i ↦ z i + p i * τ) τ := sorry

/-- QM.4/indefinite-theta-characteristics-s (Zwegers Cor. 2.9(5)). -/
theorem indefiniteThetaChar_S {c₁ c₂ : Fin r → ℝ} (h₁ : c₁ ∈ F.closedCone) (h₂ : c₂ ∈ F.closedCone)
    {a b : Fin r → ℝ} (ha : a ∈ F.admissible c₁ ∩ F.admissible c₂)
    (hb : b ∈ F.admissible c₁ ∩ F.admissible c₂) {τ : ℂ} (hτ : 0 < τ.im) :
    F.indefiniteThetaChar c₁ c₂ a b (-1 / τ) =
      I / (√(-(F.A.det : ℝ)) : ℂ) * (-I * τ) ^ ((r : ℂ) / 2) * cexp (2 * π * I * F.B a b) *
        ∑ᶠ (p : Fin r → ℝ) (_ : p ∈ F.discriminantReps), F.indefiniteThetaChar c₁ c₂ (b + p) (-a) τ :=
  sorry

/-- `O_A^+(ℤ)`: integral `C` with `CᵀAC = A` and `B(Cc, c) < 0` on `C_Q` (Zwegers Def. 2.10). -/
def orthogonalPlus : Subgroup (Matrix.GeneralLinearGroup (Fin r) ℤ) where
  carrier := {C | (C : Matrix (Fin r) (Fin r) ℤ)ᵀ * F.A * C = F.A ∧
    ∀ c ∈ F.negCone, F.B ((C : Matrix (Fin r) (Fin r) ℤ).map (Int.cast : ℤ → ℝ) *ᵥ c) c < 0}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

theorem orthogonalPlus_mem_iff (C : Matrix.GeneralLinearGroup (Fin r) ℤ) :
    C ∈ F.orthogonalPlus ↔ (C : Matrix (Fin r) (Fin r) ℤ)ᵀ * F.A * C = F.A ∧
      ∀ c ∈ F.negCone, (C : Matrix (Fin r) (Fin r) ℤ).map (Int.cast : ℤ → ℝ) *ᵥ c ∈ F.negCone :=
  sorry

theorem orthogonalPlus_smul_negCone {C : Matrix.GeneralLinearGroup (Fin r) ℤ}
    (hC : C ∈ F.orthogonalPlus) :
    (fun c ↦ (C : Matrix (Fin r) (Fin r) ℤ).map (Int.cast : ℤ → ℝ) *ᵥ c) '' F.negCone = F.negCone ∧
      (fun c ↦ (C : Matrix (Fin r) (Fin r) ℤ).map (Int.cast : ℤ → ℝ) *ᵥ c) '' F.cuspVectors =
        F.cuspVectors := sorry

/-- QM.4/indefinite-theta-orthogonal-invariance (Zwegers Prop. 2.13). -/
theorem indefiniteTheta_orthogonalPlus {C : Matrix.GeneralLinearGroup (Fin r) ℤ}
    (hC : C ∈ F.orthogonalPlus) {c₁ c₂ : Fin r → ℝ} (h₁ : c₁ ∈ F.closedCone)
    (h₂ : c₂ ∈ F.closedCone) {z : Fin r → ℂ} {τ : ℂ}
    (hz : (z, τ) ∈ F.admissibleDomain c₁ ∩ F.admissibleDomain c₂) :
    F.indefiniteTheta ((C : Matrix (Fin r) (Fin r) ℤ).map (Int.cast : ℤ → ℝ) *ᵥ c₁)
        ((C : Matrix (Fin r) (Fin r) ℤ).map (Int.cast : ℤ → ℝ) *ᵥ c₂)
        ((C : Matrix (Fin r) (Fin r) ℤ).map (Int.cast : ℤ → ℂ) *ᵥ z) τ =
      F.indefiniteTheta c₁ c₂ z τ := sorry

end ZwegersForm

/-- Unit test `zwegersForm_example_test`: `A = (1 2; 2 1)`, `c₀ = (-1, 2)` is of type `(1, 1)` with
`Q(c₀) = -3/2`. -/
example : ∃ F : ZwegersForm 2, F.A = !![1, 2; 2, 1] ∧ F.c₀ = ![-1, 2] ∧ F.Q F.c₀ = -3 / 2 := sorry

/-- Unit test `zwegersForm_posDef_non_example_test`: positive definite forms are excluded. -/
example : ¬ ∃ F : ZwegersForm 2, F.A = 1 := sorry

/-- Unit test `zwegersForm_B_polar_test`: `B(x, y) = Q(x + y) - Q(x) - Q(y)`, `Q(x) = ½B(x, x)`. -/
example {r : ℕ} (F : ZwegersForm r) (x y : Fin r → ℝ) :
    F.B x y = F.Q (x + y) - F.Q x - F.Q y ∧ F.Q x = (1 / 2) * F.B x x := sorry

/-- Unit test `zwegersForm_seventh_test`: `A = (3 4; 4 3)`, `c₀ = (-3, 4)`, `Q(c₀) = -21/2`. -/
example : ∃ F : ZwegersForm 2, F.A = !![3, 4; 4, 3] ∧ F.c₀ = ![-3, 4] ∧ F.Q F.c₀ = -21 / 2 := sorry

/-- Unit test `negativeCone_example_test`: for `A = (1 2; 2 1)`, `c₀ = (-1, 2)`: `(-2, 1) ∈ C_Q`. -/
example (F : ZwegersForm 2) (hA : F.A = !![1, 2; 2, 1]) (hc : F.c₀ = ![-1, 2]) :
    ![-2, 1] ∈ F.negCone := sorry

/-- Unit test `cuspVectors_empty_test`: for `A = (1 0; 0 -3)`, `S_Q = ∅`. -/
example (F : ZwegersForm 2) (hA : F.A = !![1, 0; 0, -3]) : F.cuspVectors = ∅ := sorry

/-- Unit test `negativeCone_neg_non_example_test`: `-c₀ ∉ C_Q`. -/
example {r : ℕ} (F : ZwegersForm r) : -F.c₀ ∉ F.negCone := sorry

/-- Unit test `negativeCone_smul_test`: `C_Q` is stable under positive scalars. -/
example {r : ℕ} (F : ZwegersForm r) {c : Fin r → ℝ} (hc : c ∈ F.negCone) {t : ℝ} (ht : 0 < t) :
    t • c ∈ F.negCone := sorry

/-- Unit test `admissible_negCone_test`: `R(c) = ℝ^r` for `c ∈ C_Q`. -/
example {r : ℕ} (F : ZwegersForm r) {c : Fin r → ℝ} (hc : c ∈ F.negCone) :
    F.admissible c = Set.univ := sorry

/-- Unit test `admissible_cusp_test`: for `c ∈ S_Q`: `B(c, a) = 1/2` gives `a ∈ R(c)`, `B(c, a) = 1`
gives `a ∉ R(c)`. -/
example {r : ℕ} (F : ZwegersForm r) {c a a' : Fin r → ℝ} (hc : c ∈ F.cuspVectors)
    (ha : F.B c a = 1 / 2) (ha' : F.B c a' = 1) : a ∈ F.admissible c ∧ a' ∉ F.admissible c := sorry

/-- Unit test `admissible_translate_test`: `a ∈ R(c) ⇔ a + λ ∈ R(c)`. -/
example {r : ℕ} (F : ZwegersForm r) {c : Fin r → ℝ} (hc : c ∈ F.closedCone) (a : Fin r → ℝ)
    (n : Fin r → ℤ) : a + (fun i ↦ (n i : ℝ)) ∈ F.admissible c ↔ a ∈ F.admissible c := sorry

/-- Unit test `zwegersRho_self_test`: `ρ^{c,c} = 0`. -/
example {r : ℕ} (F : ZwegersForm r) (c ν : Fin r → ℝ) (τ : ℂ) : F.rhoPair c c ν τ = 0 := sorry

/-- Unit test `zwegersRho_cusp_test`: for `c ∈ S_Q`, `ρ^c(ν; τ) = sgn B(c, ν)`. -/
example {r : ℕ} (F : ZwegersForm r) {c : Fin r → ℝ} (hc : c ∈ F.cuspVectors) (ν : Fin r → ℝ)
    (τ : ℂ) : F.rho c ν τ = Real.sign (F.B c ν) := sorry

/-- Unit test `zwegersRho_tendsto_test`: for `c ∈ C_Q`, `B(c, ν) ≠ 0`: `ρ^c(ν; x + iy) → sgn B(c, ν)`
as `y → ∞`. -/
example {r : ℕ} (F : ZwegersForm r) {c : Fin r → ℝ} (hc : c ∈ F.negCone) (ν : Fin r → ℝ)
    (hν : F.B c ν ≠ 0) (x : ℝ) :
    Tendsto (fun y : ℝ ↦ F.rho c ν (x + y * I)) atTop (𝓝 (Real.sign (F.B c ν))) := sorry

/-- Unit test `zwegersRho_not_sign_test`: for `c ∈ C_Q`, `|ρ^c| < 1`. -/
example {r : ℕ} (F : ZwegersForm r) {c : Fin r → ℝ} (hc : c ∈ F.negCone) (ν : Fin r → ℝ)
    {τ : ℂ} (hτ : 0 < τ.im) : |F.rho c ν τ| < 1 := sorry

/-- Unit test `indefiniteTheta_self_test`: `ϑ^{c,c} = 0`. -/
example {r : ℕ} (F : ZwegersForm r) (c : Fin r → ℝ) (z : Fin r → ℂ) (τ : ℂ) :
    F.indefiniteTheta c c z τ = 0 := sorry

/-- Unit test `indefiniteTheta_neg_test`: `ϑ(-z) = -ϑ(z)`. -/
example {r : ℕ} (F : ZwegersForm r) {c₁ c₂ : Fin r → ℝ} (h₁ : c₁ ∈ F.closedCone)
    (h₂ : c₂ ∈ F.closedCone) {z : Fin r → ℂ} {τ : ℂ}
    (hz : (z, τ) ∈ F.admissibleDomain c₁ ∩ F.admissibleDomain c₂) :
    F.indefiniteTheta c₁ c₂ (-z) τ = -F.indefiniteTheta c₁ c₂ z τ := sorry

/-- Unit test `indefiniteTheta_eta_squared_test`: `A = (1 2; 2 1)`, `c₁ = (-1, 2)`, `c₂ = (-2, 1)`,
`a = b = (1/6, 1/6)`: `ϑ_{a,b} = 2e^{πi/3} η²` (Zwegers Example 2.16). -/
example (F : ZwegersForm 2) (hA : F.A = !![1, 2; 2, 1]) {τ : ℂ} (hτ : 0 < τ.im) :
    F.indefiniteThetaChar ![-1, 2] ![-2, 1] ![1 / 6, 1 / 6] ![1 / 6, 1 / 6] τ =
      2 * cexp (π * I / 3) * ModularForm.eta τ ^ 2 := sorry

/-- Unit test `indefiniteTheta_char_test`: `ϑ_{a,b}(τ) = e^{2πiQ(a)τ + 2πiB(a,b)} ϑ(aτ + b; τ)`. -/
example {r : ℕ} (F : ZwegersForm r) (c₁ c₂ a b : Fin r → ℝ) {τ : ℂ} (hτ : 0 < τ.im) :
    F.indefiniteThetaChar c₁ c₂ a b τ =
      cexp (2 * π * I * F.Q a * τ + 2 * π * I * F.B a b) *
        F.indefiniteTheta c₁ c₂ (fun i ↦ a i * τ + b i) τ := sorry

/-- Unit test `orthogonalPlus_example_test`: for `A = (1 2; 2 1)`, `C = (1 0; -4 -1) ∈ O_A^+(ℤ)` and
`C c₁ = c₁` for `c₁ = (-1, 2)`. -/
example (F : ZwegersForm 2) (hA : F.A = !![1, 2; 2, 1]) :
    ∃ C ∈ F.orthogonalPlus, (C : Matrix (Fin 2) (Fin 2) ℤ) = !![1, 0; -4, -1] ∧
      (C : Matrix (Fin 2) (Fin 2) ℤ).map (Int.cast : ℤ → ℝ) *ᵥ ![-1, 2] = ![-1, 2] := sorry

/-- Unit test `orthogonalPlus_det_test`: `det C = ±1` on `O_A^+(ℤ)`. -/
example {r : ℕ} (F : ZwegersForm r) {C : Matrix.GeneralLinearGroup (Fin r) ℤ}
    (hC : C ∈ F.orthogonalPlus) :
    (C : Matrix (Fin r) (Fin r) ℤ).det = 1 ∨ (C : Matrix (Fin r) (Fin r) ℤ).det = -1 := sorry

/-- Unit test `orthogonalPlus_neg_one_test`: `-I ∉ O_A^+(ℤ)` (it swaps the two components). -/
example {r : ℕ} (F : ZwegersForm r) : -1 ∉ F.orthogonalPlus := sorry

/-! ### Meromorphic Jacobi forms (QM.4/meromorphic-jacobi-transformation-laws) -/

/-- (E) of index `m`: `ϕ(z + λτ + μ; τ) = e^{-2πim(λ²τ + 2λz)} ϕ(z; τ)`. -/
def SatisfiesEllipticLaw (m : ℕ) (ϕ : ℂ → ℂ → ℂ) : Prop :=
  ∀ z τ : ℂ, 0 < τ.im → ∀ l μ : ℤ,
    ϕ (z + l * τ + μ) τ = cexp (-2 * π * I * m * ((l : ℂ) ^ 2 * τ + 2 * l * z)) * ϕ z τ

/-- (M) of weight `k` and index `m`. -/
def SatisfiesModularLaw (k : ℤ) (m : ℕ) (ϕ : ℂ → ℂ → ℂ) : Prop :=
  ∀ γ : SL(2, ℤ), ∀ z τ : ℂ, 0 < τ.im →
    ϕ (z / (γ 1 0 * τ + γ 1 1)) ((γ 0 0 * τ + γ 0 1) / (γ 1 0 * τ + γ 1 1)) =
      (γ 1 0 * τ + γ 1 1) ^ k * cexp (2 * π * I * m * γ 1 0 * z ^ 2 / (γ 1 0 * τ + γ 1 1)) * ϕ z τ

/-- Stand-in for membership in QM.1's `JacobiForm` (weight `k`, index `m`, trivial multiplier and
character): holomorphic, (E), (M), and the growth condition along torsion points. -/
def IsJacobiFormLocal (k : ℤ) (m : ℕ) (ϕ : ℂ → ℂ → ℂ) : Prop :=
  DifferentiableOn ℂ (fun p : ℂ × ℂ ↦ ϕ p.1 p.2) {p | 0 < p.2.im} ∧
    SatisfiesEllipticLaw m ϕ ∧ SatisfiesModularLaw k m ϕ ∧
    ∀ α β : ℚ, ∃ C : ℝ, ∀ τ : ℂ, 1 ≤ τ.im →
      ‖cexp (2 * π * I * m * (α : ℂ) ^ 2 * τ) * ϕ (α * τ + β) τ‖ ≤ C

theorem SatisfiesEllipticLaw.mul_modularForm {m : ℕ} {ϕ : ℂ → ℂ → ℂ}
    (hϕ : SatisfiesEllipticLaw m ϕ) (g : ℂ → ℂ) :
    SatisfiesEllipticLaw m (fun z τ ↦ g τ * ϕ z τ) := sorry

theorem SatisfiesEllipticLaw.periodic {m : ℕ} {ϕ : ℂ → ℂ → ℂ} (hϕ : SatisfiesEllipticLaw m ϕ)
    (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) : ϕ (z + 1) τ = ϕ z τ := sorry

/-- Unit test `jacobiLaws_phi_minus_two_one_test`: `-ϑ²/η⁶` satisfies (E) with `m = 1` and (M) with
`k = -2`. -/
example :
    SatisfiesEllipticLaw 1 (fun z τ ↦ -zwegersThetaLocal z τ ^ 2 / ModularForm.eta τ ^ 6) ∧
      SatisfiesModularLaw (-2) 1 (fun z τ ↦ -zwegersThetaLocal z τ ^ 2 / ModularForm.eta τ ^ 6) :=
  sorry

/-- Unit test `jacobiLaws_zero_test`: `0` satisfies (E) and (M). -/
example (k : ℤ) (m : ℕ) :
    SatisfiesEllipticLaw m (fun _ _ ↦ 0) ∧ SatisfiesModularLaw k m (fun _ _ ↦ 0) := sorry

/-- Unit test `jacobiLaws_theta_non_example_test`: `ϑ` satisfies (E) for no integer `m ≥ 1`. -/
example (m : ℕ) (hm : 1 ≤ m) : ¬ SatisfiesEllipticLaw m zwegersThetaLocal := sorry

/-- Unit test `jacobiLaws_jacobiForm_test`: Jacobi forms satisfy (E) and (M). -/
example (k : ℤ) (m : ℕ) (ϕ : ℂ → ℂ → ℂ) (hϕ : IsJacobiFormLocal k m ϕ) :
    SatisfiesEllipticLaw m ϕ ∧ SatisfiesModularLaw k m ϕ := sorry

/-! ### Level-`m` Appell functions (QM.4/level-m-appell-function and following) -/

/-- `f_u^{(m)}(z; τ) = Σ_λ e^{2πimλ²τ + 4πimλz} / (1 - e^{2πiλτ + 2πi(z - u)})` (Zwegers Def. 3.2). -/
def levelAppell (m : ℕ) (u z τ : ℂ) : ℂ :=
  ∑' l : ℤ, cexp (2 * π * I * m * (l : ℂ) ^ 2 * τ + 4 * π * I * m * l * z) /
    (1 - cexp (2 * π * I * l * τ + 2 * π * I * (z - u)))

theorem levelAppell_add_one_left (m : ℕ) (u z τ : ℂ) :
    levelAppell m (u + 1) z τ = levelAppell m u z τ := sorry

theorem levelAppell_add_one_tau (m : ℕ) (u z τ : ℂ) :
    levelAppell m u z (τ + 1) = levelAppell m u z τ := sorry

theorem meromorphic_levelAppell (m : ℕ) (u : ℂ) {τ : ℂ} (hτ : 0 < τ.im) (z : ℂ) :
    MeromorphicAt (fun z ↦ levelAppell m u z τ) z := sorry

/-- Unit test `levelAppell_add_one_u_test`: `f_{u+1} = f_u`. -/
example (m : ℕ) (u z τ : ℂ) : levelAppell m (u + 1) z τ = levelAppell m u z τ := sorry

/-- Unit test `levelAppell_t_test`: `f_u(z; τ + 1) = f_u(z; τ)`. -/
example (m : ℕ) (u z τ : ℂ) : levelAppell m u z (τ + 1) = levelAppell m u z τ := sorry

/-- Unit test `levelAppell_residue_test`: `lim_{z → u} (z - u) f_u(z; τ) = -1/(2πi)`. -/
example (m : ℕ) (hm : 1 ≤ m) (u : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    Tendsto (fun z ↦ (z - u) * levelAppell m u z τ) (𝓝[≠] u) (𝓝 (-1 / (2 * π * I))) := sorry

/-- Unit test `levelAppell_not_modular_test`: `f_u` does not satisfy the S-law of a Jacobi form of
weight 1 and index `m`. -/
example (m : ℕ) (hm : 1 ≤ m) :
    ∃ u z τ : ℂ, 0 < τ.im ∧
      levelAppell m (u / τ) (z / τ) (-1 / τ) ≠ τ * cexp (2 * π * I * m * z ^ 2 / τ) * levelAppell m u z τ :=
  sorry

/-- `R_{m,l}(u; τ) = Σ_{λ ≡ l (2m)} {sgn(λ + 1/2) - E((λ + 2m Im u / y)√(y/m))} e^{-πiλ²τ/(2m) - 2πiλu}`
(Zwegers Def. 3.4). -/
def levelR (m : ℕ) (l : ℤ) (u τ : ℂ) : ℂ :=
  ∑' n : ℤ, ((Real.sign ((2 * m * n + l : ℤ) + 1 / 2 : ℝ) -
      zwegersE (((2 * m * n + l : ℤ) + 2 * m * u.im / τ.im) * √(τ.im / m)) : ℝ) : ℂ) *
    cexp (-π * I * ((2 * m * n + l : ℤ) : ℂ) ^ 2 * τ / (2 * m) - 2 * π * I * (2 * m * n + l : ℤ) * u)

theorem levelR_summable (m : ℕ) (hm : 1 ≤ m) (l : ℤ) (u : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    Summable fun n : ℤ ↦ ‖((Real.sign ((2 * m * n + l : ℤ) + 1 / 2 : ℝ) -
      zwegersE (((2 * m * n + l : ℤ) + 2 * m * u.im / τ.im) * √(τ.im / m)) : ℝ) : ℂ) *
    cexp (-π * I * ((2 * m * n + l : ℤ) : ℂ) ^ 2 * τ / (2 * m) - 2 * π * I * (2 * m * n + l : ℤ) * u)‖ :=
  sorry

theorem levelR_add_two_m (m : ℕ) (l : ℤ) : levelR m (l + 2 * m) = levelR m l := sorry

/-- Unit test `levelR_shift_test`: `R_{m,l+2m} = R_{m,l}`. -/
example (m : ℕ) (l : ℤ) : levelR m (l + 2 * m) = levelR m l := sorry

/-- Unit test `levelR_decomposition_test`: with `a = 2m Im u / y`,
`|R_{m,l} - Σ_{λ ≡ l}[sgn(λ + ½) - sgn(λ + a)] e^{…}| ≤ e^{-πya²/(2m)} Σ_{λ ≡ l} e^{-πy(λ + a)²/(2m)}`. -/
example (m : ℕ) (hm : 1 ≤ m) (l : ℤ) (u : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    ‖levelR m l u τ - ∑' n : ℤ, ((Real.sign ((2 * m * n + l : ℤ) + 1 / 2 : ℝ) -
        Real.sign ((2 * m * n + l : ℤ) + 2 * m * u.im / τ.im) : ℝ) : ℂ) *
      cexp (-π * I * ((2 * m * n + l : ℤ) : ℂ) ^ 2 * τ / (2 * m) - 2 * π * I * (2 * m * n + l : ℤ) * u)‖ ≤
      Real.exp (-π * τ.im * (2 * m * u.im / τ.im) ^ 2 / (2 * m)) *
        ∑' n : ℤ, Real.exp (-π * τ.im * ((2 * m * n + l : ℤ) + 2 * m * u.im / τ.im) ^ 2 / (2 * m)) :=
  sorry

/-- Unit test `levelR_not_holomorphic_test`: `e^{-2πimα²τ} R_{m,l}(ατ + β; τ)` is not holomorphic. -/
example (m : ℕ) (hm : 1 ≤ m) (l : ℤ) (α β : ℝ) :
    ∃ τ : ℂ, 0 < τ.im ∧
      ¬ DifferentiableAt ℂ (fun τ ↦ cexp (-2 * π * I * m * α ^ 2 * τ) * levelR m l (α * τ + β) τ) τ :=
  sorry

/-- `f̃_u = f_u - ½ Σ_{l mod 2m} R_{m,l}(u; τ) ϑ_{m,l}(z; τ)` (Zwegers Def. 3.4). -/
def completedAppell (m : ℕ) (u z τ : ℂ) : ℂ :=
  levelAppell m u z τ - (1 / 2) * ∑ l ∈ Finset.range (2 * m), levelR m l u τ * thetaIndexLocal m l z τ

theorem completedAppell_add_one_left (m : ℕ) (u z τ : ℂ) :
    completedAppell m (u + 1) z τ = completedAppell m u z τ := sorry

theorem completedAppell_poles (m : ℕ) (hm : 1 ≤ m) (u : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    Tendsto (fun z ↦ (z - u) * completedAppell m u z τ) (𝓝[≠] u) (𝓝 (-1 / (2 * π * I))) ∧
      ∀ z, NotInLattice (z - u) τ → DifferentiableAt ℂ (fun z ↦ completedAppell m u z τ) z := sorry

/-- Unit test `completedAppell_residue_test`: `Res_{z=u} f̃_u = -1/(2πi)`. -/
example (m : ℕ) (hm : 1 ≤ m) (u : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    Tendsto (fun z ↦ (z - u) * completedAppell m u z τ) (𝓝[≠] u) (𝓝 (-1 / (2 * π * I))) := sorry

/-- Unit test `completedAppell_elliptic_test`: `f̃_u` satisfies (E) in `z` of index `m`. -/
example (m : ℕ) (hm : 1 ≤ m) (u : ℂ) :
    SatisfiesEllipticLaw m (fun z τ ↦ completedAppell m u z τ) := sorry

/-- Unit test `completedAppell_ne_test`: `f̃_u ≠ f_u`. -/
example (m : ℕ) (hm : 1 ≤ m) {τ : ℂ} (hτ : 0 < τ.im) :
    ∃ u z : ℂ, completedAppell m u z τ ≠ levelAppell m u z τ := sorry

/-- Unit test `completedAppell_indefinite_theta_test`: `f̃_u(z; τ) = ½ϑ^{c₁,c₂}((z - u, 2mu); τ)` for
`A = (2m 1; 1 0)`, `c₁ = (0, 1)`, `c₂ = (-1, 2m)` (Zwegers Prop. 3.5(3)). -/
example (m : ℕ) (hm : 1 ≤ m) (F : ZwegersForm 2) (hA : F.A = !![2 * (m : ℤ), 1; 1, 0])
    (hc : F.c₀ = ![-1, 2 * (m : ℝ)]) (u z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) (hzu : NotInLattice (z - u) τ) :
    completedAppell m u z τ = (1 / 2) * F.indefiniteTheta ![0, 1] ![-1, 2 * (m : ℝ)] ![z - u, 2 * (m : ℂ) * u] τ :=
  sorry

/-! ### Residues of real-analytic times meromorphic functions (QM.4/real-analytic-residue) -/

/-- `Res_{v=u}[f(v) g(v)] = (s-1)!⁻¹ ∂_v^{s-1}[f(v)(v-u)^s g(v)]|_{v=u}` (Zwegers Def. 3.8), the value
at `u` taken as the limit from `v ≠ u` (the bracket is extended continuously across `u`). -/
def realAnalyticResidue (f g : ℂ → ℂ) (u : ℂ) (s : ℕ) : ℂ :=
  limUnder (𝓝[≠] u) fun w ↦
    ((s - 1).factorial : ℂ)⁻¹ * (wirtingerDerivLocalQM3^[s - 1] (fun v ↦ f v * (v - u) ^ s * g v)) w

theorem realAnalyticResidue_eq_residue {f g : ℂ → ℂ} {u : ℂ} {s : ℕ} {r : ℝ} (hr : 0 < r)
    (hf : DifferentiableOn ℂ f (Metric.ball u r))
    (hg : DifferentiableOn ℂ (fun v ↦ (v - u) ^ s * g v) (Metric.ball u r))
    {ρ : ℝ} (hρ : 0 < ρ) (hρr : ρ < r) :
    realAnalyticResidue f g u s = (2 * π * I)⁻¹ * ∮ z in C(u, ρ), f z * g z := sorry

theorem realAnalyticResidue_simple {f g : ℂ → ℂ} {u : ℂ} (hf : ContinuousAt f u) {L : ℂ}
    (hg : Tendsto (fun v ↦ (v - u) * g v) (𝓝[≠] u) (𝓝 L)) :
    realAnalyticResidue f g u 1 = f u * L := sorry

/-- Unit test `realAnalyticResidue_holomorphic_test`: for holomorphic `f` it is the classical
residue. -/
example {f g : ℂ → ℂ} {u : ℂ} {s : ℕ} {r : ℝ} (hr : 0 < r)
    (hf : DifferentiableOn ℂ f (Metric.ball u r))
    (hg : DifferentiableOn ℂ (fun v ↦ (v - u) ^ s * g v) (Metric.ball u r))
    {ρ : ℝ} (hρ : 0 < ρ) (hρr : ρ < r) :
    realAnalyticResidue f g u s = (2 * π * I)⁻¹ * ∮ z in C(u, ρ), f z * g z := sorry

/-- Unit test `realAnalyticResidue_simple_test`: `Res_{v=u}[f(v)/(v - u)] = f(u)`. -/
example (f : ℂ → ℂ) (u : ℂ) (hf : ContinuousAt f u) :
    realAnalyticResidue f (fun v ↦ 1 / (v - u)) u 1 = f u := sorry

/-- Unit test `realAnalyticResidue_conj_test`: `Res_{v=u}[conj(v - u)/(v - u)²] = 0`. -/
example (u : ℂ) : realAnalyticResidue (fun v ↦ conj (v - u)) (fun v ↦ (v - u) ^ (-2 : ℤ)) u 2 = 0 :=
  sorry

/-! ### Fourier coefficients of meromorphic Jacobi forms (Zwegers Thm 3.9, Cor. 3.10, Prop. 3.11) -/

/-- The coefficient `h_l(τ)` of Zwegers Thm 3.9 for a pole set `P ⊆ P_p` of `ϕ(·; τ)` with orders
`s`: `e^{-πil²τ/(2m)} ∫_p^{p+1} ϕ(z; τ) e^{-2πilz} dz - πi Σ_{u ∈ P} Res_{v=u}[R_{m,l}(v; τ) ϕ(v; τ)]`. -/
def meromorphicThetaCoeff (m : ℕ) (ϕ : ℂ → ℂ → ℂ) (τ p : ℂ) (P : Finset ℂ) (s : ℂ → ℕ) (l : ℤ) : ℂ :=
  cexp (-π * I * (l : ℂ) ^ 2 * τ / (2 * m)) *
      (∫ t in (0 : ℝ)..1, ϕ (p + t) τ * cexp (-2 * π * I * l * (p + t))) -
    π * I * ∑ u ∈ P, realAnalyticResidue (fun v ↦ levelR m l v τ) (fun v ↦ ϕ v τ) u (s u)

/-- QM.4/meromorphic-jacobi-fourier-coefficients (Zwegers Thm 3.9): for `ϕ` meromorphic in `z`
satisfying (E), whose poles are `P + ℤτ + ℤ` with `P` in the parallelogram `P_p` (no poles on its
boundary) and orders `s`; under (M) of weight `k` the `h_l` transform like the theta coefficients
of a Jacobi form. -/
theorem meromorphicJacobi_eq_sum (m : ℕ) (hm : 1 ≤ m) {ϕ : ℂ → ℂ → ℂ} (hE : SatisfiesEllipticLaw m ϕ)
    {τ : ℂ} (hτ : 0 < τ.im) (p : ℂ) (P : Finset ℂ) (s : ℂ → ℕ)
    (hP : ∀ u ∈ P, ∃ x y : ℝ, x ∈ Set.Ioo 0 1 ∧ y ∈ Set.Ioo 0 1 ∧ u = p + x * τ + y)
    (hmero : ∀ z, MeromorphicAt (fun z ↦ ϕ z τ) z)
    (hpoles : ∀ z, (∀ u ∈ P, NotInLattice (z - u) τ) → DifferentiableAt ℂ (fun z ↦ ϕ z τ) z)
    (horder : ∀ u ∈ P, DifferentiableAt ℂ (fun z ↦ (z - u) ^ s u * ϕ z τ) u)
    {z : ℂ} (hz : ∀ u ∈ P, NotInLattice (z - u) τ) :
    ϕ z τ = ∑ l ∈ Finset.range (2 * m), meromorphicThetaCoeff m ϕ τ p P s l * thetaIndexLocal m l z τ -
      2 * π * I * ∑ u ∈ P,
        realAnalyticResidue (fun v ↦ completedAppell m v z τ) (fun v ↦ ϕ v τ) u (s u) := sorry

/-- QM.4/meromorphic-jacobi-simple-poles (Zwegers Cor. 3.10): simple poles, `d_u = -2πi Res ϕ`. -/
theorem meromorphicJacobi_eq_sum_simple (m : ℕ) (hm : 1 ≤ m) {ϕ : ℂ → ℂ → ℂ}
    (hE : SatisfiesEllipticLaw m ϕ) {τ : ℂ} (hτ : 0 < τ.im) (p : ℂ) (P : Finset ℂ) (d : ℂ → ℂ)
    (hP : ∀ u ∈ P, ∃ x y : ℝ, x ∈ Set.Ioo 0 1 ∧ y ∈ Set.Ioo 0 1 ∧ u = p + x * τ + y)
    (hpoles : ∀ z, (∀ u ∈ P, NotInLattice (z - u) τ) → DifferentiableAt ℂ (fun z ↦ ϕ z τ) z)
    (hres : ∀ u ∈ P, Tendsto (fun z ↦ (z - u) * ϕ z τ) (𝓝[≠] u) (𝓝 (-d u / (2 * π * I))))
    {z : ℂ} (hz : ∀ u ∈ P, NotInLattice (z - u) τ) :
    ϕ z τ = ∑ l ∈ Finset.range (2 * m),
        (cexp (-π * I * (l : ℂ) ^ 2 * τ / (2 * m)) *
            (∫ t in (0 : ℝ)..1, ϕ (p + t) τ * cexp (-2 * π * I * l * (p + t))) +
          (1 / 2) * ∑ u ∈ P, d u * levelR m l u τ) * thetaIndexLocal m l z τ +
      ∑ u ∈ P, d u * completedAppell m u z τ := sorry

/-- QM.4/residue-function-modularity (Zwegers Prop. 3.11): if `ϕ` satisfies (E) and (M) of weight
`k` and has a simple pole at `ατ + β` (`α, β ∈ ℚ`) with residue function `d(τ)`, then
`e^{2πimα²τ} d(τ)` transforms like a modular form of weight `k - 1` on a finite-index subgroup. -/
theorem residueFunction_modular (m : ℕ) (hm : 1 ≤ m) (k : ℤ) {ϕ : ℂ → ℂ → ℂ}
    (hE : SatisfiesEllipticLaw m ϕ) (hM : SatisfiesModularLaw k m ϕ) (α β : ℚ) (d : ℂ → ℂ)
    (hd : ∀ τ : ℂ, 0 < τ.im →
      Tendsto (fun z ↦ (z - (α * τ + β)) * ϕ z τ) (𝓝[≠] (α * τ + β)) (𝓝 (-d τ / (2 * π * I)))) :
    ∃ Γ : Subgroup SL(2, ℤ), Γ.FiniteIndex ∧ ∀ γ ∈ Γ, ∀ τ : ℂ, 0 < τ.im →
      cexp (2 * π * I * m * (α : ℂ) ^ 2 * ((γ 0 0 * τ + γ 0 1) / (γ 1 0 * τ + γ 1 1))) *
          d ((γ 0 0 * τ + γ 0 1) / (γ 1 0 * τ + γ 1 1)) =
        (γ 1 0 * τ + γ 1 1) ^ (k - 1) * (cexp (2 * π * I * m * (α : ℂ) ^ 2 * τ) * d τ) := sorry

/-! ### Non-holomorphic unary theta functions (QM.4/unary-real-analytic-theta) -/

/-- `R_{a,b}(τ) = Σ_{ν ∈ a + ℤ} sgn(ν) β(2ν²y) e^{-πiν²τ - 2πiνb}` (Zwegers Def. 4.1). -/
def unaryR (a b : ℝ) (τ : ℂ) : ℂ :=
  ∑' n : ℤ, ((Real.sign ((n : ℝ) + a) * zwegersBeta (2 * ((n : ℝ) + a) ^ 2 * τ.im) : ℝ) : ℂ) *
    cexp (-π * I * (((n : ℝ) + a : ℝ) : ℂ) ^ 2 * τ - 2 * π * I * (((n : ℝ) + a : ℝ) : ℂ) * b)

theorem unaryR_add_one_left (a b : ℝ) : unaryR (a + 1) b = unaryR a b := sorry

theorem unaryR_summable (a b : ℝ) {τ : ℂ} (hτ : 0 < τ.im) :
    Summable fun n : ℤ ↦ ‖((Real.sign ((n : ℝ) + a) * zwegersBeta (2 * ((n : ℝ) + a) ^ 2 * τ.im) : ℝ) : ℂ) *
      cexp (-π * I * (((n : ℝ) + a : ℝ) : ℂ) ^ 2 * τ - 2 * π * I * (((n : ℝ) + a : ℝ) : ℂ) * b)‖ := sorry

theorem continuous_unaryR (a b : ℝ) : ContinuousOn (unaryR a b) {τ : ℂ | 0 < τ.im} := sorry

/-- QM.4/xi-of-unary-real-analytic-theta: `ξ_{1/2} R_{a,b} = -√2 g_{a,b}` and
`ξ_{1/2}(R_{a,b}(N·)) = -√(2N) g_{a,b}(N·)`. -/
theorem xiOperator_unaryR {a : ℝ} (ha : a ∈ Set.Ioo (0 : ℝ) 1) (b : ℝ) (N : ℕ) (hN : 1 ≤ N) :
    xiOperatorLocalQM3 (1 / 2) (fun τ : ℍ ↦ unaryR a b τ) = (fun τ : ℍ ↦ -(√2 : ℂ) * unaryTheta a b τ) ∧
      xiOperatorLocalQM3 (1 / 2) (fun τ : ℍ ↦ unaryR a b (N * τ)) =
        fun τ : ℍ ↦ -(√(2 * N) : ℂ) * unaryTheta a b (N * τ) := sorry

/-- Unit test `unaryR_add_one_test`: `R_{a+1,b} = R_{a,b}`. -/
example (a b : ℝ) : unaryR (a + 1) b = unaryR a b := sorry

/-- Unit test `unaryR_zero_test`: `R_{0,b}` has no `ν = 0` term. -/
example (b : ℝ) {τ : ℂ} (hτ : 0 < τ.im) :
    unaryR 0 b τ = ∑' n : ℤ, if n = 0 then 0 else
      ((Real.sign (n : ℝ) * zwegersBeta (2 * (n : ℝ) ^ 2 * τ.im) : ℝ) : ℂ) *
        cexp (-π * I * ((n : ℝ) : ℂ) ^ 2 * τ - 2 * π * I * ((n : ℝ) : ℂ) * b) := sorry

/-- Unit test `unaryR_not_holomorphic_test`: `R_{a,b}` is not holomorphic for `a ∉ ℤ`. -/
example {a : ℝ} (ha : ∀ n : ℤ, a ≠ n) (b : ℝ) :
    ∃ τ : ℂ, 0 < τ.im ∧ ¬ DifferentiableAt ℂ (unaryR a b) τ := sorry

/-- Unit test `unaryR_eq_R_test`: for `a ∈ (0, 1)`,
`R_{a,b}(τ) = i e^{-πi(a-½)²τ - 2πi(a-½)b} R((a - ½)τ + b + ½; τ)` (Zwegers Prop. 4.2(1)). -/
example {a : ℝ} (ha : a ∈ Set.Ioo (0 : ℝ) 1) (b : ℝ) {τ : ℂ} (hτ : 0 < τ.im) :
    unaryR a b τ = I * cexp (-π * I * ((a : ℂ) - 1 / 2) ^ 2 * τ - 2 * π * I * ((a : ℂ) - 1 / 2) * b) *
      zwegersR (((a : ℂ) - 1 / 2) * τ + b + 1 / 2) τ := sorry

/-! ### Seventh-order mock theta functions (Zwegers §4.3) -/

/-- `(q)_∞ = Π_{n ≥ 1}(1 - qⁿ)`, `q = e(τ)`. -/
def qPochhammerInfLocal (τ : ℂ) : ℂ := ∏' n : ℕ, (1 - cexp (2 * π * I * (n + 1) * τ))

/-- Hickerson's sign `1` on `r, s ≥ 0`, `-1` on `r, s < 0`, `0` otherwise. -/
def hickersonSign (r s : ℤ) : ℂ := if 0 ≤ r ∧ 0 ≤ s then 1 else if r < 0 ∧ s < 0 then -1 else 0

/-- `(q)_∞ F_j(q) = (Σ_{r,s ≥ 0} - Σ_{r,s < 0})(-1)^{r+s} q^{3r²/2 + 4rs + 3s²/2 + tr + ts + e}`. -/
def seventhOrderSum (t e : ℚ) (τ : ℂ) : ℂ :=
  (qPochhammerInfLocal τ)⁻¹ * ∑' p : ℤ × ℤ, hickersonSign p.1 p.2 * (-1 : ℂ) ^ (p.1 + p.2) *
    cexp (2 * π * I * ((3 * p.1 ^ 2 / 2 + 4 * p.1 * p.2 + 3 * p.2 ^ 2 / 2 + t * p.1 + t * p.2 + e : ℚ) : ℂ) * τ)

/-- `F₀`. -/
def seventhOrderF0 (τ : ℂ) : ℂ := seventhOrderSum (1 / 2) 0 τ

/-- `F₁`. -/
def seventhOrderF1 (τ : ℂ) : ℂ := seventhOrderSum (5 / 2) 1 τ

/-- `F₂`. -/
def seventhOrderF2 (τ : ℂ) : ℂ := seventhOrderSum (3 / 2) 0 τ

/-- `F₇(τ) = (q^{-1/168}F₀, q^{47/168}F₂, q^{-25/168}F₁)`. -/
def seventhOrderVector (τ : ℂ) : Fin 3 → ℂ :=
  ![cexp (2 * π * I * (-1 / 168) * τ) * seventhOrderF0 τ, cexp (2 * π * I * (47 / 168) * τ) * seventhOrderF2 τ,
    cexp (2 * π * I * (-25 / 168) * τ) * seventhOrderF1 τ]

theorem differentiable_seventhOrderVector (i : Fin 3) :
    DifferentiableOn ℂ (fun τ ↦ seventhOrderVector τ i) {τ : ℂ | 0 < τ.im} := sorry

/-- `M₇ = (2/√7)(sin π/7, sin 3π/7, sin 2π/7; sin 3π/7, -sin 2π/7, sin π/7; sin 2π/7, sin π/7, -sin 3π/7)`. -/
def seventhOrderM : Matrix (Fin 3) (Fin 3) ℂ :=
  ((2 / √7 : ℝ) : ℂ) • (!![Real.sin (π / 7), Real.sin (3 * π / 7), Real.sin (2 * π / 7);
    Real.sin (3 * π / 7), -Real.sin (2 * π / 7), Real.sin (π / 7);
    Real.sin (2 * π / 7), Real.sin (π / 7), -Real.sin (3 * π / 7)].map (fun x : ℝ ↦ (x : ℂ)))

theorem seventhOrderM_sq : seventhOrderM * seventhOrderM = 1 := sorry

/-- The form `A = (3 4; 4 3)` with `c₀ = (-3, 4)` of Zwegers §4.3. -/
def seventhForm : ZwegersForm 2 where
  A := !![3, 4; 4, 3]
  isSymm := sorry
  det_ne_zero := sorry
  c₀ := ![-3, 4]
  Q_c₀_neg := sorry
  pos_on_orth := sorry

/-- `H₇ = ζ₁₄⁻¹(2η)⁻¹(ϑ_{e/14,e/14}, ϑ_{3e/14,5e/14}, ϑ_{5e/14,3e/14})`, `c₁ = (-3, 4)`, `c₂ = (-4, 3)`,
`e = (1, 1)`. -/
def seventhOrderH (τ : ℂ) : Fin 3 → ℂ :=
  fun i ↦ (zetaN 14)⁻¹ / (2 * ModularForm.eta τ) *
    ![seventhForm.indefiniteThetaChar ![-3, 4] ![-4, 3] ![1 / 14, 1 / 14] ![1 / 14, 1 / 14] τ,
      seventhForm.indefiniteThetaChar ![-3, 4] ![-4, 3] ![3 / 14, 3 / 14] ![5 / 14, 5 / 14] τ,
      seventhForm.indefiniteThetaChar ![-3, 4] ![-4, 3] ![5 / 14, 5 / 14] ![3 / 14, 3 / 14] τ] i

/-- `G₇ = -(ζ₈₄^{-13}R_{13/42,-1/2} + ζ₈₄R_{41/42,-1/2}, ζ₈₄^{29}R_{11/42,-5/2} + ζ₈₄^{-41}R_{25/42,-5/2},
ζ₂₈⁵R_{23/42,-3/2} + ζ₂₈^{-9}R_{37/42,-3/2})(21τ)`. -/
def seventhOrderG (τ : ℂ) : Fin 3 → ℂ :=
  -![zetaN 84 ^ (-13 : ℤ) * unaryR (13 / 42) (-1 / 2) (21 * τ) + zetaN 84 * unaryR (41 / 42) (-1 / 2) (21 * τ),
    zetaN 84 ^ (29 : ℤ) * unaryR (11 / 42) (-5 / 2) (21 * τ) +
      zetaN 84 ^ (-41 : ℤ) * unaryR (25 / 42) (-5 / 2) (21 * τ),
    zetaN 28 ^ (5 : ℤ) * unaryR (23 / 42) (-3 / 2) (21 * τ) +
      zetaN 28 ^ (-9 : ℤ) * unaryR (37 / 42) (-3 / 2) (21 * τ)]

/-- `g₇ = (ζ₈₄^{-13}g_{13/42,1/2} + ζ₈₄g_{41/42,1/2}, ζ₈₄^{73}g_{11/42,1/2} + ζ₈₄^{59}g_{25/42,1/2},
ζ₈₄^{61}g_{23/42,1/2} + ζ₈₄^{47}g_{37/42,1/2})(21τ)`. -/
def seventhOrderShadow (τ : ℂ) : Fin 3 → ℂ :=
  ![zetaN 84 ^ (-13 : ℤ) * unaryTheta (13 / 42) (1 / 2) (21 * τ) + zetaN 84 * unaryTheta (41 / 42) (1 / 2) (21 * τ),
    zetaN 84 ^ (73 : ℤ) * unaryTheta (11 / 42) (1 / 2) (21 * τ) +
      zetaN 84 ^ (59 : ℤ) * unaryTheta (25 / 42) (1 / 2) (21 * τ),
    zetaN 84 ^ (61 : ℤ) * unaryTheta (23 / 42) (1 / 2) (21 * τ) +
      zetaN 84 ^ (47 : ℤ) * unaryTheta (37 / 42) (1 / 2) (21 * τ)]

theorem seventhOrderShadow_S {τ : ℂ} (hτ : 0 < τ.im) :
    seventhOrderShadow (-1 / τ) = -(-I * τ) ^ (3 / 2 : ℂ) • (seventhOrderM *ᵥ seventhOrderShadow τ) := sorry

theorem differentiable_seventhOrderShadow (i : Fin 3) :
    DifferentiableOn ℂ (fun τ ↦ seventhOrderShadow τ i) {τ : ℂ | 0 < τ.im} := sorry

/-- The `T`-multipliers `diag(ζ₁₆₈^{-1}, ζ₁₆₈^{47}, ζ₁₆₈^{-25})`. -/
def seventhOrderTMult : Fin 3 → ℂ := ![zetaN 168 ^ (-1 : ℤ), zetaN 168 ^ (47 : ℤ), zetaN 168 ^ (-25 : ℤ)]

/-- QM.4/seventh-order-decomposition (Zwegers Prop. 4.5): `F₇ = H₇ + G₇`. -/
theorem seventhOrderVector_eq {τ : ℂ} (hτ : 0 < τ.im) :
    seventhOrderVector τ = seventhOrderH τ + seventhOrderG τ := sorry

/-- QM.4/seventh-order-completion-transformation (Zwegers Prop. 4.5(1)): `H₇` is a vector-valued
real-analytic modular form of weight 1/2 for `SL(2, ℤ)`, annihilated by `Δ_{1/2}` (equivalently an
`Ω_{1/2}`-eigenfunction with eigenvalue `3/16`). -/
theorem seventhOrderH_transform {τ : ℂ} (hτ : 0 < τ.im) :
    seventhOrderH (τ + 1) = (fun i ↦ seventhOrderTMult i * seventhOrderH τ i) ∧
      seventhOrderH (-1 / τ) = (-I * τ) ^ (1 / 2 : ℂ) • (seventhOrderM *ᵥ seventhOrderH τ) := sorry

/-- QM.4/seventh-order-shadow: `Δ_{1/2} H₇ = 0` and `ξ_{1/2} H₇ = -√42 g₇` componentwise. -/
theorem xiOperator_seventhOrderH (i : Fin 3) :
    hyperbolicLaplacianLocalQM3 (1 / 2) (fun τ : ℍ ↦ seventhOrderH τ i) = 0 ∧
      xiOperatorLocalQM3 (1 / 2) (fun τ : ℍ ↦ seventhOrderH τ i) =
        fun τ : ℍ ↦ -(√42 : ℂ) * seventhOrderShadow τ i := sorry

/-- QM.4/seventh-order-correction-bounded (Zwegers Prop. 4.5(2)): `G₇` is bounded towards every
rational point. -/
theorem seventhOrderG_bounded (x : ℚ) (i : Fin 3) :
    ∃ C : ℝ, ∀ t : ℝ, 0 < t → t ≤ 1 → ‖seventhOrderG (x + t * I) i‖ ≤ C := sorry

/-- QM.4/seventh-order-non-modularity (Zwegers Cor. 4.6). -/
theorem seventhOrderVector_sub_S {τ : ℂ} (hτ : 0 < τ.im) (i : Fin 3) :
    seventhOrderVector τ i - ((-I * τ) ^ (-(1 / 2 : ℂ)) • (seventhOrderM *ᵥ seventhOrderVector (-1 / τ))) i =
      I * √21 * ∫ t in Set.Ioi (0 : ℝ), seventhOrderShadow (I * t) i * I / (t - I * τ) ^ (1 / 2 : ℂ) ∧
    seventhOrderVector (τ + 1) i = seventhOrderTMult i * seventhOrderVector τ i := sorry

/-- Unit test `seventhOrder_F0_coeff_test`: `F₀ = 1 + q + q³ + q⁴ + q⁵ + 2q⁷ + q⁸ + 2q⁹ + O(q¹⁰)`. -/
example : ∃ c : ℕ → ℂ, (∀ τ : ℂ, 0 < τ.im →
      HasSum (fun n ↦ c n * cexp (2 * π * I * n * τ)) (seventhOrderF0 τ)) ∧
    c 0 = 1 ∧ c 1 = 1 ∧ c 2 = 0 ∧ c 3 = 1 ∧ c 4 = 1 ∧ c 5 = 1 ∧ c 6 = 0 ∧ c 7 = 2 ∧ c 8 = 1 ∧ c 9 = 2 :=
  sorry

/-- Unit test `seventhOrder_T_test`: `F₇(τ + 1) = diag(ζ₁₆₈^{-1}, ζ₁₆₈^{47}, ζ₁₆₈^{-25}) F₇(τ)`. -/
example {τ : ℂ} (hτ : 0 < τ.im) :
    seventhOrderVector (τ + 1) = fun i ↦ seventhOrderTMult i * seventhOrderVector τ i := sorry

/-- Unit test `seventhOrder_not_modular_test`: `F₇(-1/τ) ≠ √(-iτ) M₇ F₇(τ)`. -/
example : ∃ τ : ℂ, 0 < τ.im ∧
    seventhOrderVector (-1 / τ) ≠ (-I * τ) ^ (1 / 2 : ℂ) • (seventhOrderM *ᵥ seventhOrderVector τ) := sorry

/-- Unit test `seventhOrder_F_holo_test`: each component of `F₇` is holomorphic (`ξ_{1/2} F₇ = 0`). -/
example (i : Fin 3) : xiOperatorLocalQM3 (1 / 2) (fun τ : ℍ ↦ seventhOrderVector τ i) = 0 := sorry

/-- Unit test `seventhOrderH_T_test`: `H₇(τ + 1) = diag(ζ₁₆₈^{-1}, ζ₁₆₈^{47}, ζ₁₆₈^{-25}) H₇(τ)`. -/
example {τ : ℂ} (hτ : 0 < τ.im) :
    seventhOrderH (τ + 1) = fun i ↦ seventhOrderTMult i * seventhOrderH τ i := sorry

/-- Unit test `seventhOrderH_S_test`: `H₇(-1/τ) = √(-iτ) M₇ H₇(τ)`. -/
example {τ : ℂ} (hτ : 0 < τ.im) :
    seventhOrderH (-1 / τ) = (-I * τ) ^ (1 / 2 : ℂ) • (seventhOrderM *ᵥ seventhOrderH τ) := sorry

/-- Unit test `seventhOrderG_ne_zero_test`: `G₇ ≠ 0`, so `H₇ ≠ F₇`. -/
example : ∃ τ : ℂ, 0 < τ.im ∧ seventhOrderG τ ≠ 0 := sorry

/-- Unit test `seventhOrderH_decomp_test`: `H₇ = F₇ - G₇`. -/
example {τ : ℂ} (hτ : 0 < τ.im) : seventhOrderH τ = seventhOrderVector τ - seventhOrderG τ := sorry

/-- Unit test `seventhOrderShadow_S_test`: `g₇(-1/τ) = -M₇(-iτ)^{3/2} g₇(τ)`. -/
example {τ : ℂ} (hτ : 0 < τ.im) :
    seventhOrderShadow (-1 / τ) = -(-I * τ) ^ (3 / 2 : ℂ) • (seventhOrderM *ᵥ seventhOrderShadow τ) := sorry

/-- Unit test `seventhOrderShadow_first_test`: the first component of `g₇`. -/
example (τ : ℂ) :
    seventhOrderShadow τ 0 = zetaN 84 ^ (-13 : ℤ) * unaryTheta (13 / 42) (1 / 2) (21 * τ) +
      zetaN 84 * unaryTheta (41 / 42) (1 / 2) (21 * τ) := sorry

/-- Unit test `seventhOrderShadow_ne_zero_test`: `g₇ ≠ 0`. -/
example : ∃ τ : ℂ, 0 < τ.im ∧ seventhOrderShadow τ ≠ 0 := sorry

/-- Unit test `seventhOrderShadow_holo_test`: `g₇` is holomorphic on `ℍ`. -/
example (i : Fin 3) : DifferentiableOn ℂ (fun τ ↦ seventhOrderShadow τ i) {τ : ℂ | 0 < τ.im} := sorry

/-! ### The fifth-order mock theta functions (Zwegers §4.4)

`A = (5 0; 0 -2)`, `c₁ = (2, 5)`, `c₂ = (-2, 5)`; `B(c₁, c₂) = -70` and
`Q(c₁) = Q(c₂) = -15`, so `c₁` and `c₂` lie in the same component of the positive
cone, which is what the indefinite theta machinery needs. -/

/-- The indefinite quadratic form of the fifth-order functions. -/
def fifthForm : ZwegersForm 2 where
  A := !![5, 0; 0, -2]
  isSymm := sorry
  det_ne_zero := sorry
  c₀ := ![2, 5]
  Q_c₀_neg := sorry
  pos_on_orth := sorry

/-- Andrews' corrected double sum for `f₀`: `(q)_∞ f₀(q) = Σ_{n ≥ 0, |j| ≤ n}
(-1)^j q^{5n²/2 + n/2 - j²}(1 - q^{4n+2})`. -/
def fifthOrderF0 (τ : ℂ) : ℂ :=
  (qPochhammerInfLocal τ)⁻¹ * ∑' p : ℕ × ℤ,
    (if p.2.natAbs ≤ p.1 then (-1 : ℂ) ^ p.2 else 0) *
      (cexp (2 * π * I * ((5 * p.1 ^ 2 / 2 + p.1 / 2 - p.2 ^ 2 : ℚ) : ℂ) * τ) -
        cexp (2 * π * I * ((5 * p.1 ^ 2 / 2 + 9 * p.1 / 2 + 2 - p.2 ^ 2 : ℚ) : ℂ) * τ))

/-- Andrews' corrected double sum for `f₁`. -/
def fifthOrderF1 (τ : ℂ) : ℂ :=
  (qPochhammerInfLocal τ)⁻¹ * ∑' p : ℕ × ℤ,
    (if p.2.natAbs ≤ p.1 then (-1 : ℂ) ^ p.2 else 0) *
      (cexp (2 * π * I * ((5 * p.1 ^ 2 / 2 + 3 * p.1 / 2 - p.2 ^ 2 : ℚ) : ℂ) * τ) -
        cexp (2 * π * I * ((5 * p.1 ^ 2 / 2 + 7 * p.1 / 2 + 1 - p.2 ^ 2 : ℚ) : ℂ) * τ))

/-- `F₀` through its double sum, with the `(q²; q²)_∞` denominator. -/
def fifthOrderCapF0 (τ : ℂ) : ℂ := sorry

/-- `F₁`. -/
def fifthOrderCapF1 (τ : ℂ) : ℂ := sorry

/-- `1 + 2ψ₀`, from Andrews' **corrected** third identity. -/
def fifthOrderPsi0 (τ : ℂ) : ℂ := sorry

/-- `ψ₁`. -/
def fifthOrderPsi1 (τ : ℂ) : ℂ := sorry

/-- `φ₀`. -/
def fifthOrderPhi0 (τ : ℂ) : ℂ := sorry

/-- `φ₁`, from Andrews' **corrected** eighth identity. -/
def fifthOrderPhi1 (τ : ℂ) : ℂ := sorry

-- andrews_corrections: a record, not a statement. Zwegers finds the third and eighth of Andrews'
-- printed identities wrong, and `fifthOrderPsi0` and `fifthOrderPhi1` above use his corrected forms.

/-- `F_{5,1}(τ) = (q^{-1/60}f₀, q^{11/60}f₁, q^{-1/240}(-1 + F₀(q^{1/2})),
q^{71/240}F₁(q^{1/2}), q^{-1/240}(-1 + F₀(-q^{1/2})), q^{71/240}F₁(-q^{1/2}))`. -/
def fifthOrderVectorOne (τ : ℂ) : Fin 6 → ℂ :=
  ![cexp (2 * π * I * (-1 / 60) * τ) * fifthOrderF0 τ,
    cexp (2 * π * I * (11 / 60) * τ) * fifthOrderF1 τ,
    cexp (2 * π * I * (-1 / 240) * τ) * (-1 + fifthOrderCapF0 (τ / 2)),
    cexp (2 * π * I * (71 / 240) * τ) * fifthOrderCapF1 (τ / 2),
    cexp (2 * π * I * (-1 / 240) * τ) * (-1 + fifthOrderCapF0 (τ / 2 + 1 / 2)),
    cexp (2 * π * I * (71 / 240) * τ) * fifthOrderCapF1 (τ / 2 + 1 / 2)]

/-- The level at which the unary `R` functions of `G_{5,1}` are evaluated. -/
def fifthOrderLevel : ℕ := 30

/-- `H_{5,1} = (2η)⁻¹(ϑ_{(1/10,0),(0,1/4)}, ϑ_{(3/10,0),(0,1/4)}, ϑ_{(1/5,1/4),(1/2,1)},
ϑ_{(2/5,1/4),(1/2,2)}, ζ₈ϑ_{(1/5,1/4),(0,1/4)}, ζ₈ϑ_{(2/5,1/4),(0,1/4)})`. -/
def fifthOrderH (τ : ℂ) : Fin 6 → ℂ :=
  fun i ↦ 1 / (2 * ModularForm.eta τ) *
    ![fifthForm.indefiniteThetaChar ![2, 5] ![-2, 5] ![1 / 10, 0] ![0, 1 / 4] τ,
      fifthForm.indefiniteThetaChar ![2, 5] ![-2, 5] ![3 / 10, 0] ![0, 1 / 4] τ,
      fifthForm.indefiniteThetaChar ![2, 5] ![-2, 5] ![1 / 5, 1 / 4] ![1 / 2, 1] τ,
      fifthForm.indefiniteThetaChar ![2, 5] ![-2, 5] ![2 / 5, 1 / 4] ![1 / 2, 2] τ,
      zetaN 8 * fifthForm.indefiniteThetaChar ![2, 5] ![-2, 5] ![1 / 5, 1 / 4] ![0, 1 / 4] τ,
      zetaN 8 * fifthForm.indefiniteThetaChar ![2, 5] ![-2, 5] ![2 / 5, 1 / 4] ![0, 1 / 4] τ] i

/-- `G_{5,1}`, a vector of combinations of unary `R` functions at `30τ`. -/
def fifthOrderG (τ : ℂ) : Fin 6 → ℂ :=
  (1 / 2 : ℂ) • ![2 * zetaN 12 * unaryR (1 / 30) (5 / 2) (30 * τ) +
      2 * (zetaN 12)⁻¹ * unaryR (11 / 30) (5 / 2) (30 * τ),
    2 * zetaN 12 * unaryR (13 / 30) (5 / 2) (30 * τ) +
      2 * (zetaN 12)⁻¹ * unaryR (23 / 30) (5 / 2) (30 * τ),
    -unaryR (19 / 60) 0 (30 * τ) - unaryR (29 / 60) 0 (30 * τ) +
      unaryR (49 / 60) 0 (30 * τ) + unaryR (59 / 60) 0 (30 * τ),
    -unaryR (13 / 60) 0 (30 * τ) - unaryR (23 / 60) 0 (30 * τ) +
      unaryR (43 / 60) 0 (30 * τ) + unaryR (53 / 60) 0 (30 * τ),
    (zetaN 24) ^ (-5 : ℤ) * unaryR (19 / 60) (5 / 2) (30 * τ) +
      (zetaN 24) ^ (5 : ℤ) * unaryR (29 / 60) (5 / 2) (30 * τ) +
      zetaN 24 * unaryR (49 / 60) (5 / 2) (30 * τ) +
      (zetaN 24)⁻¹ * unaryR (59 / 60) (5 / 2) (30 * τ),
    zetaN 24 * unaryR (13 / 60) (5 / 2) (30 * τ) +
      (zetaN 24)⁻¹ * unaryR (23 / 60) (5 / 2) (30 * τ) +
      (zetaN 24) ^ (-5 : ℤ) * unaryR (43 / 60) (5 / 2) (30 * τ) +
      (zetaN 24) ^ (5 : ℤ) * unaryR (53 / 60) (5 / 2) (30 * τ)]

/-- `M₅`, the `6 × 6` matrix of sines of `π/5` and `2π/5`. -/
def fifthOrderM : Matrix (Fin 6) (Fin 6) ℂ :=
  !![0, 0, Real.sqrt 2 * Real.sin (π / 5), Real.sqrt 2 * Real.sin (2 * π / 5), 0, 0;
     0, 0, Real.sqrt 2 * Real.sin (2 * π / 5), -(Real.sqrt 2 * Real.sin (π / 5)), 0, 0;
     Real.sin (π / 5) / Real.sqrt 2, Real.sin (2 * π / 5) / Real.sqrt 2, 0, 0, 0, 0;
     Real.sin (2 * π / 5) / Real.sqrt 2, -(Real.sin (π / 5) / Real.sqrt 2), 0, 0, 0, 0;
     0, 0, 0, 0, Real.sin (2 * π / 5), Real.sin (π / 5);
     0, 0, 0, 0, Real.sin (π / 5), -Real.sin (2 * π / 5)]

/-- Zwegers Prop. 4.10: `F_{5,1} = H_{5,1} + G_{5,1}`. -/
theorem fifthOrderVectorOne_eq {τ : ℂ} (hτ : 0 < τ.im) :
    fifthOrderVectorOne τ = fifthOrderH τ + fifthOrderG τ := sorry

/-- Zwegers Prop. 4.10(1), the `S`-transformation of the completion. -/
theorem fifthOrderH_S {τ : ℂ} (hτ : 0 < τ.im) :
    fifthOrderH (-1 / τ) =
      ((-I * τ) ^ (1 / 2 : ℂ) * (2 / Real.sqrt 5)) • (fifthOrderM *ᵥ fifthOrderH τ) := sorry

/-- Zwegers Prop. 4.10(2): `G_{5,1}` is bounded towards the rationals. -/
theorem fifthOrderG_bounded (ξ : ℚ) (i : Fin 6) :
    ∃ C : ℝ, ∀ τ : ℂ, 0 < τ.im → τ.re = ξ → ‖fifthOrderG τ i‖ ≤ C := sorry

-- Zwegers Prop. 4.13–4.14, not stated: they need the second vector `F_{5,2} = H_{5,2} + G_{5,2}` of
-- Zwegers Lemma 4.11, which is not defined here.
-- fifthOrderG_two_eq_neg: not stated; `G_{5,2} = -G_{5,1}`, so the two corrections cancel.
-- fifthOrderSum_modular: not stated; `F₅ = F_{5,1} + F_{5,2}` is a holomorphic vector-valued modular
-- form of weight `1/2` with the `T`- and `S`-matrices of `fifthOrderH`.

/-- Unit test `fifthOrder_prefactor_test`. -/
example (τ : ℂ) : fifthOrderVectorOne τ 0 = cexp (2 * π * I * (-1 / 60) * τ) * fifthOrderF0 τ := rfl

/-- Unit test `fifthOrderG_level_test`: every unary `R` in `G_{5,1}` is at `30τ`. -/
example : fifthOrderLevel = 30 := rfl

/-- Unit test `fifthOrderH_entries_test`: the last two entries carry `ζ₈`. -/
example (τ : ℂ) : fifthOrderH τ 4 =
    1 / (2 * ModularForm.eta τ) *
      (zetaN 8 * fifthForm.indefiniteThetaChar ![2, 5] ![-2, 5] ![1 / 5, 1 / 4] ![0, 1 / 4] τ) := rfl

/-- Unit test `fifthOrderM_block_test`: `M₅` is block structured. -/
example : fifthOrderM 0 0 = 0 ∧ fifthOrderM 0 1 = 0 := ⟨rfl, rfl⟩

/-! ### The index-13 weight-1 meromorphic Jacobi form (Zwegers §3.5, Prop. 3.12)

`φ = (ϑ₀₀ϑ₀₁ϑ₁₀)⁹/(Δϑ₁₁)`, whose residue at `0` is the **constant** `-128/π`.
The four theta functions with characteristics come from QM.1 and are not
redefined here. -/

/-- `φ`, the index-13 weight-1 meromorphic Jacobi form. -/
def indexThirteenPhi (z τ : ℂ) : ℂ := sorry

/-- The residue at `z = 0` is the constant `-128/π`, independent of `τ`. -/
theorem indexThirteenPhi_residue {τ : ℂ} (hτ : 0 < τ.im) :
    Tendsto (fun z ↦ z * indexThirteenPhi z τ) (𝓝[≠] (0 : ℂ)) (𝓝 (-128 / π)) := sorry

/-- The 26 coefficient functions `h_l`. -/
def indexThirteenCoefficients (l : ℤ) (τ : ℂ) : ℂ := sorry

/-- Zwegers Prop. 3.12: the decomposition of `φ`. -/
theorem indexThirteenPhi_decomposition {z τ : ℂ} (hτ : 0 < τ.im) :
    indexThirteenPhi z τ =
      (∑ l ∈ Finset.range 26, indexThirteenCoefficients l τ * thetaIndexLocal 13 l z τ) +
        512 * I * completedAppell 13 0 z τ := sorry

-- indexThirteenCoefficients_modular: not stated; `(h_l)` is a vector-valued real-analytic modular form
-- of weight `1/2` with Casimir eigenvalue `3/16` (Zwegers Prop. 3.12). It needs the `S`- and
-- `T`-matrices of the index-13 theta decomposition, which are not defined here.

/-- Unit test `indexThirteen_index_test`: the sum runs over 26 classes. -/
example : (Finset.range 26).card = 26 := rfl

-- Unit test indexThirteen_not_generic_test: a record, not a statement. The coefficient functions are
-- Casimir eigenfunctions only because the residues are constant; for a general meromorphic Jacobi form
-- they are not, and no real-analytic modular form results.

end QM4

end TauCeti.QSeries
end

end QM4File


-- ===== QM.5 =====

section QM5File

/-
QM.5 Arithmetic and quantum connections: the suggested-Lean section of
BP-QSeriesPartitionsAndMockModularForms. This file is not the roadmap and is not exhaustive; the
roadmap document is definitive, and these statements suggest Lean forms so that contributors and
reviewers converge on names and signatures. They claim no implementation.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Tau Ceti is not imported (it is not built here).
Declarations of other roadmaps that this section would import are not restated; where a statement
needs one of them, the fact is either passed as an explicit hypothesis or the statement is left out
with a comment:
* the normalised modular invariant `j = E₄³/Δ` (Tau Ceti ModularForms layer 0, module
  `ModularForms.LevelOne.JInputs`) is used through the local stand-in `jInvariantLocal`;
* the Habiro ring and its evaluation and Taylor maps (HabiroCyclotomicCompletions HC.1, HC.3) are not
  restated: Kontsevich's series is represented by its formal values `kontsevichValue` and Taylor
  expansions `kontsevichTaylor` at roots of unity;
* half-integral weight cusp forms (MetaplecticAutomorphicForms MP.7) enter only through the explicit
  conditions of `IsShimuraCuspFormLocal`;
* the WRT invariant and the unified invariant of the Poincaré sphere (ArithmeticQuantumTopology QT.3,
  QT.4) are not restated, so the Lawrence–Zagier comparison theorems are recorded in the roadmap
  document only;
* conjugation of partitions (`TauCeti.conjugate`) is replaced by an existential involution.

Conventions: `q = e^{2πiτ}`; radial approach `τ = x + i t/(2π)`, `t → 0⁺`, i.e. `q = e^{2πix}e^{−t}`.
-/

noncomputable section

namespace TauCeti.QSeries

section QM5

open Filter Asymptotics Finset
open scoped Real Topology MatrixGroups _root_.ModularForm

/-! ### Radial limits and radial asymptotic expansions -/

/-- The point `x + i t/(2π)` of the vertical ray above `x`; with `q = e^{2πiτ}` it corresponds to
`q = e^{2πix}e^{−t}`. -/
def radialPoint (x t : ℝ) : ℂ := x + Complex.I * (t / (2 * π))

/-- `HasRadialLimit G x L`: `G(x + it/(2π)) → L` as `t → 0⁺`. -/
def HasRadialLimit (G : ℂ → ℂ) (x : ℝ) (L : ℂ) : Prop :=
  Tendsto (fun t : ℝ => G (radialPoint x t)) (𝓝[>] 0) (𝓝 L)

/-- The radial limit from below, `G(x − it/(2π)) → L`. -/
def HasRadialLimitBelow (G : ℂ → ℂ) (x : ℝ) (L : ℂ) : Prop :=
  HasRadialLimit (fun z => G (starRingEnd ℂ z)) x L

open Classical in
/-- The radial limit value (junk value `0` when there is no radial limit). -/
def radialLimit (G : ℂ → ℂ) (x : ℝ) : ℂ :=
  if h : ∃ L, HasRadialLimit G x L then h.choose else 0

theorem HasRadialLimit.unique {G : ℂ → ℂ} {x : ℝ} {L₁ L₂ : ℂ} (h₁ : HasRadialLimit G x L₁)
    (h₂ : HasRadialLimit G x L₂) : L₁ = L₂ := sorry

theorem HasRadialLimit.radialLimit_eq {G : ℂ → ℂ} {x : ℝ} {L : ℂ} (h : HasRadialLimit G x L) :
    radialLimit G x = L := sorry

theorem HasRadialLimit.add {G G' : ℂ → ℂ} {x : ℝ} {L L' : ℂ} (h : HasRadialLimit G x L)
    (h' : HasRadialLimit G' x L') : HasRadialLimit (G + G') x (L + L') := sorry

theorem HasRadialLimit.const_mul {G : ℂ → ℂ} {x : ℝ} {L : ℂ} (c : ℂ) (h : HasRadialLimit G x L) :
    HasRadialLimit (fun z => c * G z) x (c * L) := sorry

theorem hasRadialLimit_iff_disc (g : ℂ → ℂ) (x : ℝ) (L : ℂ) :
    HasRadialLimit (fun τ => g (Complex.exp (2 * π * Complex.I * τ))) x L ↔
      Tendsto (fun t : ℝ => g (Complex.exp (2 * π * Complex.I * x) * Real.exp (-t))) (𝓝[>] 0)
        (𝓝 L) := sorry

theorem HasRadialLimit.of_continuousWithinAt {G : ℂ → ℂ} {x : ℝ}
    (h : ContinuousWithinAt G {z : ℂ | 0 ≤ z.im} x) : HasRadialLimit G x (G x) := sorry

theorem HasRadialLimit.comp_add_one {G : ℂ → ℂ} {x : ℝ} {c L : ℂ}
    (hG : ∀ τ : ℂ, 0 < τ.im → G (τ + 1) = c * G τ) (h : HasRadialLimit G x L) :
    HasRadialLimit G (x + 1) (c * L) := sorry

/-- Unit test `TauCeti.QSeries.HasRadialLimit.test_qParam`: `e^{2πiτ}` has radial limit
`e^{2πix}`. -/
example (x : ℝ) : HasRadialLimit (fun τ => Complex.exp (2 * π * Complex.I * τ)) x
    (Complex.exp (2 * π * Complex.I * x)) := sorry

/-- Unit test `TauCeti.QSeries.HasRadialLimit.test_const`: constants have themselves as radial
limit. -/
example (c : ℂ) (x : ℝ) : HasRadialLimit (fun _ => c) x c := sorry

/-- Unit test `TauCeti.QSeries.HasRadialLimit.test_geometric_pole`: `q/(1 − q)` has no radial limit
at `0`. -/
example : ¬ ∃ L, HasRadialLimit (fun τ => Complex.exp (2 * π * Complex.I * τ) /
    (1 - Complex.exp (2 * π * Complex.I * τ))) 0 L := sorry

/-- Unit test `TauCeti.QSeries.HasRadialLimit.test_below_conj`: the lower radial limit is the
radial limit of `G ∘ conj`. -/
example (G : ℂ → ℂ) (x : ℝ) (L : ℂ) :
    HasRadialLimitBelow G x L ↔ HasRadialLimit (fun z => G (starRingEnd ℂ z)) x L := sorry

/-- `HasRadialExpansion G x a`: for every `R`, `G(x + it/2π) − Σ_{r<R} a_r t^r = O(t^R)` as
`t → 0⁺`. -/
def HasRadialExpansion (G : ℂ → ℂ) (x : ℝ) (a : PowerSeries ℂ) : Prop :=
  ∀ R : ℕ, (fun t : ℝ => G (radialPoint x t) -
      ∑ r ∈ range R, PowerSeries.coeff r a * (t : ℂ) ^ r) =O[𝓝[>] 0] fun t : ℝ => (t : ℂ) ^ R

/-- The expansion from below, in the same variable `2π·Im τ`. -/
def HasRadialExpansionBelow (G : ℂ → ℂ) (x : ℝ) (a : PowerSeries ℂ) : Prop :=
  HasRadialExpansion (fun z => G (starRingEnd ℂ z)) x (PowerSeries.rescale (-1 : ℂ) a)

/-- Bringmann–Rolen: the asymptotic expansions of `f` (upper) and `g` (lower) agree at `x`. -/
def RadialExpansionsAgree (f g : ℂ → ℂ) (x : ℝ) : Prop :=
  ∃ a : PowerSeries ℂ, HasRadialExpansion f x a ∧ HasRadialExpansionBelow g x a

theorem HasRadialExpansion.unique {G : ℂ → ℂ} {x : ℝ} {a b : PowerSeries ℂ}
    (ha : HasRadialExpansion G x a) (hb : HasRadialExpansion G x b) : a = b := sorry

theorem HasRadialExpansion.hasRadialLimit {G : ℂ → ℂ} {x : ℝ} {a : PowerSeries ℂ}
    (h : HasRadialExpansion G x a) : HasRadialLimit G x (PowerSeries.constantCoeff a) := sorry

theorem HasRadialExpansion.add {G G' : ℂ → ℂ} {x : ℝ} {a a' : PowerSeries ℂ}
    (h : HasRadialExpansion G x a) (h' : HasRadialExpansion G' x a') :
    HasRadialExpansion (G + G') x (a + a') := sorry

theorem HasRadialExpansion.mul {G G' : ℂ → ℂ} {x : ℝ} {a a' : PowerSeries ℂ}
    (h : HasRadialExpansion G x a) (h' : HasRadialExpansion G' x a') :
    HasRadialExpansion (G * G') x (a * a') := sorry

theorem HasRadialExpansion.of_isBigO_all {G : ℂ → ℂ} {x : ℝ}
    (h : ∀ R : ℕ, (fun t : ℝ => G (radialPoint x t)) =O[𝓝[>] 0] fun t : ℝ => (t : ℂ) ^ R) :
    HasRadialExpansion G x 0 := sorry

theorem HasRadialExpansion.of_hasSum {G : ℂ → ℂ} {x : ℝ} {a : PowerSeries ℂ} {ε : ℝ}
    (hε : 0 < ε) (h : ∀ t ∈ Set.Ioo 0 ε,
      HasSum (fun r => PowerSeries.coeff r a * (t : ℂ) ^ r) (G (radialPoint x t))) :
    HasRadialExpansion G x a := sorry

theorem RadialExpansionsAgree.radialLimit_eq {f g : ℂ → ℂ} {x : ℝ}
    (h : RadialExpansionsAgree f g x) :
    ∃ L, HasRadialLimit f x L ∧ HasRadialLimitBelow g x L := sorry

/-- Unit test `TauCeti.QSeries.HasRadialExpansion.test_qParam_pow`: the expansion of `q^m` at `x` is
`e^{2πimx}·exp(−mt)`. -/
example (m : ℕ) (x : ℝ) : HasRadialExpansion (fun τ => Complex.exp (2 * π * Complex.I * m * τ)) x
    (Complex.exp (2 * π * Complex.I * m * x) •
      PowerSeries.mk fun r => (-(m : ℂ)) ^ r / (r.factorial : ℂ)) := sorry

/-- Unit test `TauCeti.QSeries.HasRadialExpansion.test_zero`: the zero function has expansion `0`. -/
example (x : ℝ) : HasRadialExpansion 0 x 0 := sorry

/-- Unit test `TauCeti.QSeries.HasRadialExpansion.test_flat`: `e^{−2πi/τ}` is flat at `0` although
it is non-zero. -/
example : HasRadialExpansion (fun τ => Complex.exp (-(2 * π * Complex.I / τ))) 0 0 ∧
    Complex.exp (-(2 * π * Complex.I / Complex.I)) ≠ 0 := sorry

/-- Unit test `TauCeti.QSeries.HasRadialExpansion.test_constantCoeff`: the constant term of an
expansion is the radial limit. -/
example (G : ℂ → ℂ) (x : ℝ) (a : PowerSeries ℂ) (h : HasRadialExpansion G x a) :
    HasRadialLimit G x (PowerSeries.constantCoeff a) := sorry

/-! ### Periodic `L`-values and the renormalised sum (Lawrence–Zagier, Proposition) -/

/-- The Hurwitz zeta function at `s = 0` (the `k = 0` case of `hurwitzZeta_neg_nat` on `(0, 1]`). -/
theorem hurwitzZeta_zero_of_mem_Ioc {x : ℝ} (hx : x ∈ Set.Ioc (0 : ℝ) 1) :
    HurwitzZeta.hurwitzZeta (x : UnitAddCircle) 0 = 1 / 2 - x := sorry

/-- Lawrence–Zagier (12), `r ≥ 1`. -/
theorem LFunction_neg_nat_eq_bernoulli {M : ℕ} [NeZero M] (Φ : ZMod M → ℂ) {r : ℕ} (hr : r ≠ 0) :
    ZMod.LFunction Φ (-(r : ℂ)) = -((M : ℂ) ^ r / (r + 1)) *
      ∑ n ∈ Icc 1 M, Φ n * (bernoulliFun (r + 1) (n / M) : ℂ) := sorry

/-- Lawrence–Zagier (12), `r = 0`, and the corollary's renormalised sum. -/
theorem LFunction_zero_eq_of_sum_eq_zero {M : ℕ} [NeZero M] (Φ : ZMod M → ℂ)
    (hΦ : ∑ j, Φ j = 0) :
    ZMod.LFunction Φ 0 = -∑ n ∈ Icc 1 M, ((n : ℂ) / M - 1 / 2) * Φ n := sorry

/-- Euler–Maclaurin asymptotics of `Σ_{m≥0} f((m + a)t)` (Zagier's Proposition 3 and its shifted
form (44), with the corrected sign of the Bernoulli term). -/
theorem euler_maclaurin_asymptotic {f : ℝ → ℂ} (hf : ContDiff ℝ (⊤ : ℕ∞) f)
    (hdecay : ∀ k : ℕ, (fun x => iteratedDeriv k f x) =O[atTop] fun x => x ^ (-2 : ℤ))
    {a : ℝ} (ha : a ∈ Set.Ioc (0 : ℝ) 1) (N : ℕ) :
    (fun t : ℝ => ∑' m : ℕ, f ((m + a) * t) - (∫ x in Set.Ioi (0 : ℝ), f x) / t +
      ∑ n ∈ range N, iteratedDeriv n f 0 / (n.factorial : ℂ) *
        ((bernoulliFun (n + 1) a / (n + 1) : ℝ) : ℂ) * (t : ℂ) ^ n)
      =O[𝓝[>] 0] fun t : ℝ => (t : ℂ) ^ N := sorry

/-- Lawrence–Zagier, Proposition (first part): `Σ Φ(n)e^{−nt} ∼ Σ L(−r, Φ)(−t)^r/r!`. -/
theorem periodic_exponential_sum_asymptotic {M : ℕ} [NeZero M] (Φ : ZMod M → ℂ)
    (hΦ : ∑ j, Φ j = 0) (R : ℕ) :
    (fun t : ℝ => ∑' n : ℕ, Φ n * Complex.exp (-(n * t)) -
      ∑ r ∈ range R, ZMod.LFunction Φ (-(r : ℂ)) * ((-t : ℝ) : ℂ) ^ r / (r.factorial : ℂ))
      =O[𝓝[>] 0] fun t : ℝ => (t : ℂ) ^ R := sorry

/-- Lawrence–Zagier, Proposition (second part), with the weight `n^ν`, `ν ∈ {0, 1}`:
`Σ n^ν Φ(n)e^{−n²t} ∼ Σ L(−2r − ν, Φ)(−t)^r/r!`. -/
theorem periodic_gaussian_sum_asymptotic {M : ℕ} [NeZero M] (Φ : ZMod M → ℂ)
    (hΦ : ∑ j, Φ j = 0) {ν : ℕ} (hν : ν ≤ 1) (R : ℕ) :
    (fun t : ℝ => ∑' n : ℕ, (n : ℂ) ^ ν * Φ n * Complex.exp (-((n : ℂ) ^ 2 * t)) -
      ∑ r ∈ range R, ZMod.LFunction Φ (-(2 * r + ν : ℂ)) * ((-t : ℝ) : ℂ) ^ r /
        (r.factorial : ℂ)) =O[𝓝[>] 0] fun t : ℝ => (t : ℂ) ^ R := sorry

/-- Lawrence–Zagier, Corollary: the renormalised sum. -/
theorem renormalised_sum {M : ℕ} [NeZero M] (Φ : ZMod M → ℂ) (hΦ : ∑ j, Φ j = 0) :
    Tendsto (fun t : ℝ => ∑' n : ℕ, Φ n * Complex.exp (-(n * t))) (𝓝[>] 0)
        (𝓝 (ZMod.LFunction Φ 0)) ∧
      Tendsto (fun t : ℝ => ∑' n : ℕ, Φ n * Complex.exp (-((n : ℂ) ^ 2 * t))) (𝓝[>] 0)
        (𝓝 (ZMod.LFunction Φ 0)) := sorry

/-! ### Quantum modular forms (Zagier's canonical definition) -/

/-- The Möbius action of `SL(2, ℤ)` on `ℚ` (junk value when `cx + d = 0`). -/
def qmfMoebius (γ : SL(2, ℤ)) (x : ℚ) : ℚ :=
  (((γ 0 0 : ℤ) : ℚ) * x + γ 0 1) / (((γ 1 0 : ℤ) : ℚ) * x + γ 1 1)

/-- The Möbius action of `SL(2, ℤ)` on `ℂ`. -/
def moebiusC (γ : SL(2, ℤ)) (τ : ℂ) : ℂ :=
  (((γ 0 0 : ℤ) : ℂ) * τ + γ 0 1) / (((γ 1 0 : ℤ) : ℂ) * τ + γ 1 1)

/-- The boundary factor `j_k(γ, x)`: the limit as `y → 0⁺` of the principal power
`(c(x − iy) + d)^{−k}`, i.e. the lower-half-plane branch (`0` when `cx + d = 0`). -/
def boundaryFactor (k : ℝ) (γ : SL(2, ℤ)) (x : ℝ) : ℂ :=
  if ((γ 1 0 : ℤ) : ℝ) * x + γ 1 1 = 0 then 0
  else if 0 < ((γ 1 0 : ℤ) : ℝ) * x + γ 1 1 then
    (((((γ 1 0 : ℤ) : ℝ) * x + γ 1 1) ^ (-k) : ℝ) : ℂ)
  else if 0 < (γ 1 0 : ℤ) then
    (((|((γ 1 0 : ℤ) : ℝ) * x + γ 1 1|) ^ (-k) : ℝ) : ℂ) * Complex.exp (π * Complex.I * k)
  else
    (((|((γ 1 0 : ℤ) : ℝ) * x + γ 1 1|) ^ (-k) : ℝ) : ℂ) * Complex.exp (-(π * Complex.I * k))

/-- The quantum slash `(f|_{k,ε}γ)(x) = ε(γ)·j_k(γ, x)·f(γx)`. -/
def quantumSlash (k : ℝ) (ε : SL(2, ℤ) → ℂ) (γ : SL(2, ℤ)) (f : ℚ → ℂ) (x : ℚ) : ℂ :=
  ε γ * boundaryFactor k γ x * f (qmfMoebius γ x)

/-- The period function `h_γ = f − f|_{k,ε}γ`. -/
def quantumPeriodFunction (k : ℝ) (ε : SL(2, ℤ) → ℂ) (γ : SL(2, ℤ)) (f : ℚ → ℂ) : ℚ → ℂ :=
  f - quantumSlash k ε γ f

/-- Zagier's canonical definition: every period function agrees on `ℚ`, off a finite set, with a
function real-analytic off that set. -/
def IsQuantumModularForm (Γ : Subgroup SL(2, ℤ)) (k : ℝ) (ε : SL(2, ℤ) → ℂ) (f : ℚ → ℂ) : Prop :=
  ∀ γ ∈ Γ, ∃ S : Finset ℝ, ∃ H : ℝ → ℂ, AnalyticOnNhd ℝ H ((S : Set ℝ)ᶜ) ∧
    ∀ x : ℚ, (x : ℝ) ∉ S → ((γ 1 0 : ℤ) : ℚ) * x + γ 1 1 ≠ 0 →
      H x = quantumPeriodFunction k ε γ f x

theorem boundaryFactor_of_pos {k : ℝ} {γ : SL(2, ℤ)} {x : ℝ}
    (h : 0 < ((γ 1 0 : ℤ) : ℝ) * x + γ 1 1) :
    boundaryFactor k γ x = (((((γ 1 0 : ℤ) : ℝ) * x + γ 1 1) ^ (-k) : ℝ) : ℂ) := sorry

theorem boundaryFactor_eq_limit {k : ℝ} {γ : SL(2, ℤ)} {x : ℝ}
    (h : ((γ 1 0 : ℤ) : ℝ) * x + γ 1 1 ≠ 0) :
    Tendsto (fun y : ℝ => (((γ 1 0 : ℤ) : ℂ) * (x - Complex.I * y) + γ 1 1) ^ (-(k : ℂ)))
      (𝓝[>] 0) (𝓝 (boundaryFactor k γ x)) := sorry

theorem boundaryFactor_int (k : ℤ) {γ : SL(2, ℤ)} {x : ℝ}
    (h : ((γ 1 0 : ℤ) : ℝ) * x + γ 1 1 ≠ 0) :
    boundaryFactor k γ x = ((((γ 1 0 : ℤ) : ℝ) * x + γ 1 1 : ℝ) : ℂ) ^ (-k) := sorry

theorem IsQuantumModularForm.add {Γ : Subgroup SL(2, ℤ)} {k : ℝ} {ε : SL(2, ℤ) → ℂ}
    {f g : ℚ → ℂ} (hf : IsQuantumModularForm Γ k ε f) (hg : IsQuantumModularForm Γ k ε g) :
    IsQuantumModularForm Γ k ε (f + g) := sorry

theorem IsQuantumModularForm.smul {Γ : Subgroup SL(2, ℤ)} {k : ℝ} {ε : SL(2, ℤ) → ℂ}
    {f : ℚ → ℂ} (c : ℂ) (hf : IsQuantumModularForm Γ k ε f) :
    IsQuantumModularForm Γ k ε (c • f) := sorry

theorem IsQuantumModularForm.mono {Γ Γ' : Subgroup SL(2, ℤ)} {k : ℝ} {ε : SL(2, ℤ) → ℂ}
    {f : ℚ → ℂ} (hf : IsQuantumModularForm Γ k ε f) (h : Γ' ≤ Γ) :
    IsQuantumModularForm Γ' k ε f := sorry

theorem isQuantumModularForm_of_analyticOnNhd (k : ℤ) {F : ℝ → ℂ}
    (hF : AnalyticOnNhd ℝ F Set.univ) :
    IsQuantumModularForm ⊤ k 1 (fun x : ℚ => F x) := sorry

/-- The cocycle condition on the factor `ε(γ)·j_k(γ, x)` over `Γ` (a multiplier system for the lower
boundary branch). -/
def QuantumCocycleCondition (Γ : Subgroup SL(2, ℤ)) (k : ℝ) (ε : SL(2, ℤ) → ℂ) : Prop :=
  ∀ γ₁ ∈ Γ, ∀ γ₂ ∈ Γ, ∀ x : ℚ, ((γ₂ 1 0 : ℤ) : ℚ) * x + γ₂ 1 1 ≠ 0 →
    (((γ₁ * γ₂) 1 0 : ℤ) : ℚ) * x + (γ₁ * γ₂) 1 1 ≠ 0 →
      ε (γ₁ * γ₂) * boundaryFactor k (γ₁ * γ₂) x =
        ε γ₁ * boundaryFactor k γ₁ (qmfMoebius γ₂ x) * (ε γ₂ * boundaryFactor k γ₂ x)

/-- The cocycle relation `h_{γ₁γ₂} = h_{γ₁}|γ₂ + h_{γ₂}` (Zagier). -/
theorem quantumPeriodFunction_mul {Γ : Subgroup SL(2, ℤ)} {k : ℝ} {ε : SL(2, ℤ) → ℂ}
    (hcoc : QuantumCocycleCondition Γ k ε) {γ₁ γ₂ : SL(2, ℤ)} (h₁ : γ₁ ∈ Γ) (h₂ : γ₂ ∈ Γ)
    (f : ℚ → ℂ) (x : ℚ) (hx : ((γ₂ 1 0 : ℤ) : ℚ) * x + γ₂ 1 1 ≠ 0)
    (hx' : (((γ₁ * γ₂) 1 0 : ℤ) : ℚ) * x + (γ₁ * γ₂) 1 1 ≠ 0) :
    quantumPeriodFunction k ε (γ₁ * γ₂) f x =
      quantumSlash k ε γ₂ (quantumPeriodFunction k ε γ₁ f) x +
        quantumPeriodFunction k ε γ₂ f x := sorry

/-- Reduction of quantum modularity to a generating set (under the cocycle condition). -/
theorem isQuantumModularForm_iff_generators {Γ : Subgroup SL(2, ℤ)} {k : ℝ}
    {ε : SL(2, ℤ) → ℂ} {G : Set SL(2, ℤ)} (hG : Subgroup.closure G = Γ)
    (hcoc : QuantumCocycleCondition Γ k ε) (f : ℚ → ℂ) :
    IsQuantumModularForm Γ k ε f ↔ ∀ γ ∈ G, ∃ S : Finset ℝ, ∃ H : ℝ → ℂ,
      AnalyticOnNhd ℝ H ((S : Set ℝ)ᶜ) ∧ ∀ x : ℚ, (x : ℝ) ∉ S →
        ((γ 1 0 : ℤ) : ℚ) * x + γ 1 1 ≠ 0 → H x = quantumPeriodFunction k ε γ f x := sorry

/-- Unit test `TauCeti.QSeries.IsQuantumModularForm.test_const`: constants are quantum modular of
weight `0`. -/
example : IsQuantumModularForm ⊤ 0 1 (fun _ => 1) := sorry

/-- Unit test `TauCeti.QSeries.IsQuantumModularForm.test_sq`: `x ↦ x²` is quantum modular of
weight `1`. -/
example : IsQuantumModularForm ⊤ 1 1 (fun x : ℚ => ((x : ℂ)) ^ 2) := sorry

/-- Unit test `TauCeti.QSeries.IsQuantumModularForm.test_indicator_int`: the indicator of `ℤ` is not
quantum modular of weight `0`. -/
example : ¬ IsQuantumModularForm ⊤ 0 1 (fun x : ℚ => if x.den = 1 then (1 : ℂ) else 0) := sorry

/-- Unit test `TauCeti.QSeries.boundaryFactor.test_neg`: the lower branch at `x < 0` for `S` and
`k = 3/2`. -/
example {x : ℝ} (hx : x < 0) :
    boundaryFactor (3 / 2) ModularGroup.S x = -Complex.I * ((|x| ^ (-(3 / 2 : ℝ)) : ℝ) : ℂ) :=
  sorry

/-- Unit test `TauCeti.QSeries.boundaryFactor.test_int_compat`: in integral weight the branch plays no
role. -/
example (k : ℤ) (γ : SL(2, ℤ)) (x : ℝ) (h : ((γ 1 0 : ℤ) : ℝ) * x + γ 1 1 ≠ 0) :
    boundaryFactor k γ x = ((((γ 1 0 : ℤ) : ℝ) * x + γ 1 1 : ℝ) : ℂ) ^ (-k) := sorry

/-! ### Eichler integrals (holomorphic and non-holomorphic) -/

/-- The holomorphic Eichler integral of weight `w` of `Σ_{n≥1} a(n)e^{2πinτ/N}`:
`Σ_{n≥1} (n/N)^{1−w}a(n)e^{2πinτ/N}`. -/
def eichlerIntegral (w : ℝ) (N : ℕ) (a : ℕ → ℂ) (τ : ℂ) : ℂ :=
  ∑' n : ℕ, (((((n + 1 : ℕ) : ℝ) / N) ^ (1 - w) : ℝ) : ℂ) * a (n + 1) *
    Complex.exp (2 * π * Complex.I * ((n + 1 : ℕ) : ℂ) * τ / N)

theorem hasSum_eichlerIntegral {w : ℝ} {N : ℕ} [NeZero N] {a : ℕ → ℂ}
    (ha : ∃ C A : ℝ, ∀ n, ‖a n‖ ≤ C * (n : ℝ) ^ A) {τ : ℂ} (hτ : 0 < τ.im) :
    HasSum (fun n : ℕ => (((((n + 1 : ℕ) : ℝ) / N) ^ (1 - w) : ℝ) : ℂ) * a (n + 1) *
      Complex.exp (2 * π * Complex.I * ((n + 1 : ℕ) : ℂ) * τ / N)) (eichlerIntegral w N a τ) :=
  sorry

theorem differentiableOn_eichlerIntegral {w : ℝ} {N : ℕ} [NeZero N] {a : ℕ → ℂ}
    (ha : ∃ C A : ℝ, ∀ n, ‖a n‖ ≤ C * (n : ℝ) ^ A) :
    DifferentiableOn ℂ (eichlerIntegral w N a) {τ | 0 < τ.im} := sorry

theorem eichlerIntegral_add {w : ℝ} {N : ℕ} [NeZero N] {a b : ℕ → ℂ}
    (ha : ∃ C A : ℝ, ∀ n, ‖a n‖ ≤ C * (n : ℝ) ^ A) (hb : ∃ C A : ℝ, ∀ n, ‖b n‖ ≤ C * (n : ℝ) ^ A)
    {τ : ℂ} (hτ : 0 < τ.im) :
    eichlerIntegral w N (a + b) τ = eichlerIntegral w N a τ + eichlerIntegral w N b τ := sorry

theorem eichlerIntegral_smul (w : ℝ) (N : ℕ) (a : ℕ → ℂ) (c : ℂ) :
    eichlerIntegral w N (c • a) = c • eichlerIntegral w N a := sorry

theorem eichlerIntegral_one (N : ℕ) (a : ℕ → ℂ) (τ : ℂ) :
    eichlerIntegral 1 N a τ = ∑' n : ℕ, a (n + 1) *
      Complex.exp (2 * π * Complex.I * ((n + 1 : ℕ) : ℂ) * τ / N) := sorry

theorem deriv_eichlerIntegral {w : ℝ} {N : ℕ} [NeZero N] {a : ℕ → ℂ}
    (ha : ∃ C A : ℝ, ∀ n, ‖a n‖ ≤ C * (n : ℝ) ^ A) {τ : ℂ} (hτ : 0 < τ.im) :
    deriv (eichlerIntegral w N a) τ = 2 * π * Complex.I * eichlerIntegral (w - 1) N a τ := sorry

theorem eichlerIntegral_add_N (w : ℝ) (N : ℕ) [NeZero N] (a : ℕ → ℂ) (τ : ℂ) :
    eichlerIntegral w N a (τ + N) = eichlerIntegral w N a τ := sorry

/-- Unary theta series: for `a(n²) = n^ν C(n)` (weight `ν + 1/2`), the Eichler integral is
`N^{ν−1/2}Σ n^{1−ν}C(n)q^{n²/N}`. -/
theorem eichlerIntegral_unaryTheta (N : ℕ) [NeZero N] (C : ℕ → ℂ) {ν : ℕ} (hν : ν ≤ 1)
    (τ : ℂ) :
    eichlerIntegral (ν + 1 / 2) N
        (fun m => if IsSquare m then (Nat.sqrt m : ℂ) ^ ν * C (Nat.sqrt m) else 0) τ =
      (((N : ℝ) ^ ((ν : ℝ) - 1 / 2) : ℝ) : ℂ) * ∑' n : ℕ, ((n + 1 : ℕ) : ℂ) ^ (1 - ν) *
        C (n + 1) * Complex.exp (2 * π * Complex.I * ((n + 1 : ℕ) : ℂ) ^ 2 * τ / N) := sorry

/-- Compatibility with the integral-weight Eichler integral `Σ a_n n^{1−k}qⁿ` of a level-one cusp
form (Tau Ceti modular symbols layer). -/
theorem eichlerIntegral_qExpansion {k : ℕ} (f : CuspForm 𝒮ℒ k) (τ : ℂ) :
    eichlerIntegral k 1 (fun n => (UpperHalfPlane.qExpansion 1 f).coeff n) τ =
      ∑' n : ℕ, (UpperHalfPlane.qExpansion 1 f).coeff (n + 1) / ((n + 1 : ℕ) : ℂ) ^ (k - 1) *
        Complex.exp (2 * π * Complex.I * ((n + 1 : ℕ) : ℂ) * τ) := sorry

theorem tendsto_eichlerIntegral_atImInfty {w : ℝ} {N : ℕ} [NeZero N] {a : ℕ → ℂ}
    (ha : ∃ C A : ℝ, ∀ n, ‖a n‖ ≤ C * (n : ℝ) ^ A) (x : ℝ) :
    Tendsto (fun y : ℝ => eichlerIntegral w N a (x + Complex.I * y)) atTop (𝓝 0) := sorry

/-- The character `χ₁₂ = (12/·)` on `ZMod 12`. -/
def chiTwelve (n : ZMod 12) : ℂ :=
  if n = 1 ∨ n = 11 then 1 else if n = 5 ∨ n = 7 then -1 else 0

/-- The coefficients of `η(τ) = Σ χ₁₂(n)q^{n²/24}` in the exponents `m/24`. -/
def etaCoeff (m : ℕ) : ℂ := if IsSquare m then chiTwelve (Nat.sqrt m) else 0

/-- Unit test `TauCeti.QSeries.eichlerIntegral.test_weight_one`: the Eichler integral of weight one
is the series itself. -/
example (N : ℕ) (a : ℕ → ℂ) :
    eichlerIntegral 1 N a = fun τ => ∑' n : ℕ, a (n + 1) *
      Complex.exp (2 * π * Complex.I * ((n + 1 : ℕ) : ℂ) * τ / N) := sorry

/-- Unit test `TauCeti.QSeries.eichlerIntegral.test_delta_coeff`: the `q²`-coefficient of `Δ̃` is
`τ(2)/2¹¹ = −3/256`. -/
example : (((((1 + 1 : ℕ) : ℝ) / (1 : ℕ)) ^ (1 - (12 : ℝ)) : ℝ) : ℂ) * (-24 : ℂ) = -3 / 256 :=
  sorry

/-- Unit test `TauCeti.QSeries.eichlerIntegral.test_eta_normalisation`: Zagier's `η̃` is
`√24` times the weight-`1/2` Eichler integral of `η`. -/
example (τ : ℂ) :
    ((Real.sqrt 24 : ℝ) : ℂ) * eichlerIntegral (1 / 2) 24 etaCoeff τ =
      ∑' n : ℕ, ((n + 1 : ℕ) : ℂ) * chiTwelve (n + 1 : ℕ) *
        Complex.exp (2 * π * Complex.I * ((n + 1 : ℕ) : ℂ) ^ 2 * τ / 24) := sorry

/-- Unit test `TauCeti.QSeries.eichlerIntegral.test_no_constant`: the Eichler integral has no
constant term. -/
example {w : ℝ} {N : ℕ} [NeZero N] {a : ℕ → ℂ} (ha : ∃ C : ℝ, ∀ n, ‖a n‖ ≤ C) (x : ℝ) :
    Tendsto (fun y : ℝ => eichlerIntegral w N a (x + Complex.I * y)) atTop (𝓝 0) := sorry

/-- The upper incomplete gamma function `Γ(s, x) = ∫_x^∞ t^{s−1}e^{−t} dt` with complex `s`
(the pinned libraries have only positive real parameters). -/
def upperIncompleteGammaLocal (s : ℂ) (x : ℝ) : ℂ :=
  ∫ t in Set.Ioi x, (t : ℂ) ^ (s - 1) * Complex.exp (-(t : ℂ))

/-- Shimura's theta multiplier factor `ε_d^{2k}(c/d)` for `d > 0` odd (`ε_d = 1` or `i`); the full
convention, including `d < 0`, is MetaplecticAutomorphicForms MP.7's. -/
def shimuraFactorLocal (k : ℝ) (γ : SL(2, ℤ)) : ℂ :=
  (if (γ 1 1 : ℤ) % 4 = 1 then (1 : ℂ) else Complex.I) ^ (2 * (k : ℂ)) *
    (jacobiSym (γ 1 0) (γ 1 1).natAbs : ℂ)

/-- Local stand-in for "f is a cusp form of weight `k` on `Γ₀(N)` with Shimura's multiplier"
(MetaplecticAutomorphicForms MP.7): holomorphy, the transformation law for `γ ∈ Γ₀(N)` with `d > 0`,
and exponential decay at every cusp. -/
def IsShimuraCuspFormLocal (k : ℝ) (N : ℕ) (f : ℂ → ℂ) : Prop :=
  DifferentiableOn ℂ f {τ | 0 < τ.im} ∧
  (∀ γ : SL(2, ℤ), (N : ℤ) ∣ γ 1 0 → 0 < γ 1 1 → ∀ τ : ℂ, 0 < τ.im →
      shimuraFactorLocal k γ * (((γ 1 0 : ℤ) : ℂ) * τ + γ 1 1) ^ (-(k : ℂ)) * f (moebiusC γ τ) =
        f τ) ∧
  (∀ γ : SL(2, ℤ), ∃ C c : ℝ, 0 < c ∧ ∀ τ : ℂ, 1 ≤ τ.im →
      ‖(((γ 1 0 : ℤ) : ℂ) * τ + γ 1 1) ^ (-(k : ℂ)) * f (moebiusC γ τ)‖ ≤ C * Real.exp (-c * τ.im))

/-- The non-holomorphic Eichler integral on the lower half-plane,
`f*(τ) = ((−2πi)^{k−1}/Γ(k−1))∫_{τ̄}^{i∞} f(w)(w − τ)^{k−2}dw` (vertical path). -/
def nonholomorphicEichlerIntegral (k : ℝ) (f : ℂ → ℂ) (τ : ℂ) : ℂ :=
  (-2 * π * Complex.I) ^ ((k : ℂ) - 1) / Complex.Gamma ((k : ℂ) - 1) *
    ∫ y in Set.Ioi (0 : ℝ), f (starRingEnd ℂ τ + Complex.I * y) *
      (starRingEnd ℂ τ + Complex.I * y - τ) ^ ((k : ℂ) - 2) * Complex.I

theorem nonholomorphicEichlerIntegral_eq_tsum {k : ℝ} {N : ℕ} {f : ℂ → ℂ} {a : ℕ → ℂ}
    (hf : IsShimuraCuspFormLocal k N f)
    (hfa : ∀ w : ℂ, 0 < w.im →
      HasSum (fun n : ℕ => a (n + 1) * Complex.exp (2 * π * Complex.I * ((n + 1 : ℕ) : ℂ) * w))
        (f w)) {τ : ℂ} (hτ : τ.im < 0) :
    nonholomorphicEichlerIntegral k f τ = (Complex.Gamma ((k : ℂ) - 1))⁻¹ *
      ∑' n : ℕ, a (n + 1) * ((n + 1 : ℕ) : ℂ) ^ (1 - (k : ℂ)) *
        Complex.exp (2 * π * Complex.I * ((n + 1 : ℕ) : ℂ) * τ) *
          upperIncompleteGammaLocal ((k : ℂ) - 1) (4 * π * (n + 1 : ℕ) * |τ.im|) := sorry

theorem nonholomorphicEichlerIntegral_add {k : ℝ} {N : ℕ} {f g : ℂ → ℂ}
    (hf : IsShimuraCuspFormLocal k N f) (hg : IsShimuraCuspFormLocal k N g) {τ : ℂ}
    (hτ : τ.im < 0) :
    nonholomorphicEichlerIntegral k (f + g) τ =
      nonholomorphicEichlerIntegral k f τ + nonholomorphicEichlerIntegral k g τ := sorry

theorem nonholomorphicEichlerIntegral_smul (k : ℝ) (f : ℂ → ℂ) (c : ℂ) (τ : ℂ) :
    nonholomorphicEichlerIntegral k (c • f) τ = c * nonholomorphicEichlerIntegral k f τ := sorry

theorem nonholomorphicEichlerIntegral_add_one {k : ℝ} {f : ℂ → ℂ}
    (hf : ∀ w : ℂ, f (w + 1) = f w) (τ : ℂ) :
    nonholomorphicEichlerIntegral k f (τ + 1) = nonholomorphicEichlerIntegral k f τ := sorry

/-- The integral may be taken along any path in `ℍ` from `τ̄` to `i∞` that is eventually vertical;
here: first horizontally to `Re τ + s + i|Im τ|`, then vertically. -/
theorem nonholomorphicEichlerIntegral_path {k : ℝ} {N : ℕ} {f : ℂ → ℂ}
    (hf : IsShimuraCuspFormLocal k N f) {τ : ℂ} (hτ : τ.im < 0) (s : ℝ) :
    nonholomorphicEichlerIntegral k f τ =
      (-2 * π * Complex.I) ^ ((k : ℂ) - 1) / Complex.Gamma ((k : ℂ) - 1) *
        ((∫ u in (0 : ℝ)..s, f (starRingEnd ℂ τ + u) * (starRingEnd ℂ τ + u - τ) ^ ((k : ℂ) - 2)) +
          ∫ y in Set.Ioi (0 : ℝ), f (starRingEnd ℂ τ + s + Complex.I * y) *
            (starRingEnd ℂ τ + s + Complex.I * y - τ) ^ ((k : ℂ) - 2) * Complex.I) := sorry

/-- Unit test `TauCeti.QSeries.nonholomorphicEichlerIntegral.test_zero`: the zero form has zero
non-holomorphic Eichler integral. -/
example (k : ℝ) (τ : ℂ) : nonholomorphicEichlerIntegral k 0 τ = 0 := sorry

/-- Unit test `TauCeti.QSeries.nonholomorphicEichlerIntegral.test_single_term`: one exponential. -/
example {k : ℝ} (hk : (1 : ℝ) / 2 ≤ k) {τ : ℂ} (hτ : τ.im < 0) :
    ∫ y in Set.Ioi (0 : ℝ), Complex.exp (2 * π * Complex.I * (starRingEnd ℂ τ + Complex.I * y)) *
      (starRingEnd ℂ τ + Complex.I * y - τ) ^ ((k : ℂ) - 2) * Complex.I =
      Complex.I ^ ((k : ℂ) - 1) * (2 * π : ℂ) ^ (1 - (k : ℂ)) *
        Complex.exp (2 * π * Complex.I * τ) *
          upperIncompleteGammaLocal ((k : ℂ) - 1) (4 * π * |τ.im|) := sorry

/-- Unit test `TauCeti.QSeries.nonholomorphicEichlerIntegral.test_not_holomorphic`: the
non-holomorphic Eichler integral of `e^{2πiw}` is not complex differentiable on `H⁻`. -/
example : ¬ DifferentiableOn ℂ
    (nonholomorphicEichlerIntegral (3 / 2) fun w => Complex.exp (2 * π * Complex.I * w))
    {τ : ℂ | τ.im < 0} := sorry

/-- The period integral `r_{f,α}(z) = ((−2πi)^{k−1}/Γ(k−1))∫_α^{i∞} f(w)(w − z)^{k−2}dw`. -/
def eichlerPeriodIntegral (k : ℝ) (f : ℂ → ℂ) (α : ℝ) (z : ℂ) : ℂ :=
  (-2 * π * Complex.I) ^ ((k : ℂ) - 1) / Complex.Gamma ((k : ℂ) - 1) *
    ∫ y in Set.Ioi (0 : ℝ), f (α + Complex.I * y) *
      ((α : ℂ) + Complex.I * y - z) ^ ((k : ℂ) - 2) * Complex.I

/-- The arc `s ↦ α + (β − α)s + i s(1 − s)` in `ℍ` from `α` to `β`. -/
def cuspArc (α β : ℝ) (s : ℝ) : ℂ := α + (β - α) * s + Complex.I * (s * (1 - s))

theorem analyticOnNhd_eichlerPeriodIntegral {k : ℝ} {N : ℕ} {f : ℂ → ℂ}
    (hf : IsShimuraCuspFormLocal k N f) (α : ℚ) :
    AnalyticOnNhd ℝ (fun x : ℝ => eichlerPeriodIntegral k f α x) ({(α : ℝ)}ᶜ) := sorry

theorem eichlerPeriodIntegral_sub {k : ℝ} {N : ℕ} {f : ℂ → ℂ}
    (hf : IsShimuraCuspFormLocal k N f) (α β : ℚ) {z : ℂ} (hz : z.im < 0) :
    eichlerPeriodIntegral k f α z - eichlerPeriodIntegral k f β z =
      (-2 * π * Complex.I) ^ ((k : ℂ) - 1) / Complex.Gamma ((k : ℂ) - 1) *
        ∫ s in (0 : ℝ)..1, f (cuspArc α β s) * (cuspArc α β s - z) ^ ((k : ℂ) - 2) *
          ((β - α : ℝ) + Complex.I * (1 - 2 * s)) := sorry

theorem eichlerPeriodIntegral_add_one {k : ℝ} {f : ℂ → ℂ} (hf : ∀ w : ℂ, f (w + 1) = f w)
    (α : ℝ) (z : ℂ) :
    eichlerPeriodIntegral k f (α + 1) (z + 1) = eichlerPeriodIntegral k f α z := sorry

theorem eichlerPeriodIntegral_linear {k : ℝ} {N : ℕ} {f g : ℂ → ℂ}
    (hf : IsShimuraCuspFormLocal k N f) (hg : IsShimuraCuspFormLocal k N g) (c : ℂ) (α : ℚ)
    {z : ℂ} (hz : z.im < 0) :
    eichlerPeriodIntegral k (f + c • g) α z =
      eichlerPeriodIntegral k f α z + c * eichlerPeriodIntegral k g α z := sorry

/-- Unit test `TauCeti.QSeries.eichlerPeriodIntegral.test_zero`: `r_{0,α} = 0`. -/
example (k : ℝ) (α : ℝ) (z : ℂ) : eichlerPeriodIntegral k 0 α z = 0 := sorry

/-- Unit test `TauCeti.QSeries.eichlerPeriodIntegral.test_self_difference`: `r_{f,α} − r_{f,α} = 0`,
the empty arc. -/
example (k : ℝ) (f : ℂ → ℂ) (α : ℝ) (z : ℂ) :
    eichlerPeriodIntegral k f α z - eichlerPeriodIntegral k f α z = 0 ∧
      (∫ s in (0 : ℝ)..1, f (cuspArc α α s) * (cuspArc α α s - z) ^ ((k : ℂ) - 2) *
        ((α - α : ℝ) + Complex.I * (1 - 2 * s))) =
      ∫ s in (0 : ℝ)..1, f (α + Complex.I * (s * (1 - s))) *
        ((α : ℂ) + Complex.I * (s * (1 - s)) - z) ^ ((k : ℂ) - 2) * (Complex.I * (1 - 2 * s)) :=
  sorry

/-- Unit test `TauCeti.QSeries.eichlerPeriodIntegral.test_sub_nonholomorphic`: the period integral
differs from `f*` by the integral from `α` to `z̄`. -/
example {k : ℝ} {N : ℕ} {f : ℂ → ℂ} (hf : IsShimuraCuspFormLocal k N f) (α : ℚ) {z : ℂ}
    (hz : z.im < 0) :
    eichlerPeriodIntegral k f α z - nonholomorphicEichlerIntegral k f z =
      (-2 * π * Complex.I) ^ ((k : ℂ) - 1) / Complex.Gamma ((k : ℂ) - 1) *
        ∫ s in (0 : ℝ)..1, f (cuspArc α (starRingEnd ℂ z).re s + Complex.I * (s * |z.im|)) *
          (cuspArc α (starRingEnd ℂ z).re s + Complex.I * (s * |z.im|) - z) ^ ((k : ℂ) - 2) *
            (((starRingEnd ℂ z).re - α : ℝ) + Complex.I * (1 - 2 * s) + Complex.I * |z.im|) :=
  sorry

/-! ### The Bringmann–Rolen chain (half-integral weight Eichler integrals are quantum modular) -/

/-- The character `χ₋₄` at an odd integer. -/
def chiMinusFour (d : ℤ) : ℂ := if d % 4 = 1 then 1 else if d % 4 = 3 then -1 else 0

/-- The twisted `L`-function `L_f(ζ_c^d; s) = Σ a(n)e^{2πind/c}n^{−s}` (the Dirichlet series). -/
def twistedLSeriesLocal (a : ℕ → ℂ) (x : ℚ) (s : ℂ) : ℂ :=
  ∑' n : ℕ, a (n + 1) * Complex.exp (2 * π * Complex.I * ((n + 1 : ℕ) : ℂ) * (x : ℂ)) *
    ((n + 1 : ℕ) : ℂ) ^ (-s)

/-- Bringmann–Rolen (2.4). -/
theorem nonholomorphicEichler_transformation {k : ℝ} (hk : ∃ m : ℕ, k = m + 1 / 2) {N : ℕ}
    (hN : 4 ∣ N) {f : ℂ → ℂ} (hf : IsShimuraCuspFormLocal k N f) {γ : SL(2, ℤ)}
    (hγ : (N : ℤ) ∣ γ 1 0) (hc : γ 1 0 ≠ 0) (hd : 0 < γ 1 1) {τ : ℂ} (hτ : τ.im < 0) :
    nonholomorphicEichlerIntegral k f τ - chiMinusFour (γ 1 1) * (shimuraFactorLocal (2 - k) γ *
      (((γ 1 0 : ℤ) : ℂ) * τ + γ 1 1) ^ ((k : ℂ) - 2) *
        nonholomorphicEichlerIntegral k f (moebiusC γ τ)) =
      eichlerPeriodIntegral k f (-(γ 1 1 : ℝ) / (γ 1 0 : ℝ)) τ := sorry

/-- Non-tangential boundary values of `f*` at rational points. -/
theorem nonholomorphicEichler_nontangential_limit {k : ℝ} (hk : ∃ m : ℕ, k = m + 1 / 2)
    {N : ℕ} {f : ℂ → ℂ} (hf : IsShimuraCuspFormLocal k N f) (x : ℚ) (C : ℝ) :
    ∃ L : ℂ, Tendsto (nonholomorphicEichlerIntegral k f)
      (𝓝[{τ : ℂ | τ.im < 0 ∧ |τ.re - x| ≤ C * |τ.im|}] (x : ℂ)) (𝓝 L) ∧
      HasRadialLimitBelow (nonholomorphicEichlerIntegral k f) x L := sorry

/-- Bringmann–Rolen Lemma 2.2: continuation and trivial zeros of twisted `L`-functions. -/
theorem twistedLSeries_continuation {k : ℝ} (hk : ∃ m : ℕ, k = m + 1 / 2) {N : ℕ}
    (hN : 4 ∣ N) {f : ℂ → ℂ} {a : ℕ → ℂ} (hf : IsShimuraCuspFormLocal k N f)
    (hfa : ∀ w : ℂ, 0 < w.im →
      HasSum (fun n : ℕ => a (n + 1) * Complex.exp (2 * π * Complex.I * ((n + 1 : ℕ) : ℂ) * w))
        (f w)) (x : ℚ) :
    ∃ L : ℂ → ℂ, Differentiable ℂ L ∧
      (∀ s : ℂ, k / 2 + 2 < s.re → L s = twistedLSeriesLocal a x s) ∧
      ∀ m : ℕ, L (-(m : ℂ)) = 0 := sorry

/-- Stirling's estimate in vertical strips. -/
theorem gamma_vertical_decay (x₁ x₂ : ℝ) :
    ∃ C : ℝ, ∀ s : ℂ, x₁ ≤ s.re → s.re ≤ x₂ → 1 ≤ |s.im| →
      ‖Complex.Gamma s‖ ≤ C * |s.im| ^ (s.re - 1 / 2) * Real.exp (-(π * |s.im| / 2)) := sorry

/-- Bringmann–Rolen Lemma 2.3, uniformly in vertical strips. -/
theorem twistedLSeries_vertical_growth {k : ℝ} (hk : ∃ m : ℕ, k = m + 1 / 2) {N : ℕ}
    (hN : 4 ∣ N) {f : ℂ → ℂ} {a : ℕ → ℂ} (hf : IsShimuraCuspFormLocal k N f)
    (hfa : ∀ w : ℂ, 0 < w.im →
      HasSum (fun n : ℕ => a (n + 1) * Complex.exp (2 * π * Complex.I * ((n + 1 : ℕ) : ℂ) * w))
        (f w)) (x : ℚ) {L : ℂ → ℂ} (hL : Differentiable ℂ L)
    (hLs : ∀ s : ℂ, k / 2 + 2 < s.re → L s = twistedLSeriesLocal a x s) (x₁ x₂ : ℝ) :
    ∃ C A : ℝ, ∀ s : ℂ, x₁ ≤ s.re → s.re ≤ x₂ → ‖L s‖ ≤ C * (1 + |s.im|) ^ A := sorry

/-- Bringmann–Rolen Lemma 3.1 (Flajolet–Gourdon–Dumas): poles of the Mellin transform give the
asymptotic expansion. -/
theorem mellin_asymptotic_transfer {F : ℝ → ℂ} (hF : ContinuousOn F (Set.Ioi 0)) {α β r : ℝ}
    (hβ : β < α) (hr : 1 < r) {G : ℂ → ℂ} (poles : Finset ℂ) (res : ℂ → ℂ)
    (hconv : ∀ s : ℂ, α < s.re → mellin F s = G s)
    (hmero : DifferentiableOn ℂ G ({s : ℂ | β ≤ s.re} \ (poles : Set ℂ)))
    (hpoles : ∀ a ∈ poles, β < a.re ∧
      Tendsto (fun s => (s - a) * G s) (𝓝[≠] a) (𝓝 (res a)))
    (hdecay : ∃ C : ℝ, ∀ s : ℂ, β ≤ s.re → 1 ≤ ‖s‖ → s ∉ poles → ‖G s‖ ≤ C * ‖s‖ ^ (-r)) :
    (fun x : ℝ => F x - ∑ a ∈ poles, res a * (x : ℂ) ^ (-a)) =O[𝓝[>] 0]
      fun x : ℝ => ((x ^ (-β) : ℝ) : ℂ) := sorry

/-- Bringmann–Rolen (3.3): the radial expansion of `f̃` at `x`. -/
theorem eichlerIntegral_hasRadialExpansion {k : ℝ} (hk : ∃ m : ℕ, k = m + 1 / 2) {N : ℕ}
    (hN : 4 ∣ N) {f : ℂ → ℂ} {a : ℕ → ℂ} (hf : IsShimuraCuspFormLocal k N f)
    (hfa : ∀ w : ℂ, 0 < w.im →
      HasSum (fun n : ℕ => a (n + 1) * Complex.exp (2 * π * Complex.I * ((n + 1 : ℕ) : ℂ) * w))
        (f w)) (x : ℚ) {L : ℂ → ℂ} (hL : Differentiable ℂ L)
    (hLs : ∀ s : ℂ, k / 2 + 2 < s.re → L s = twistedLSeriesLocal a x s) :
    HasRadialExpansion (eichlerIntegral k 1 a) x
      (PowerSeries.mk fun n => (-1 : ℂ) ^ n / (n.factorial : ℂ) * L ((k : ℂ) - 1 - n)) := sorry

/-- The Mellin transform of `e^tΓ(k − 1, 2t)`: poles and residues (Bringmann–Rolen Lemma 3.2 core). -/
theorem incompleteGamma_mellin_residue {k : ℝ} (hk : ∃ m : ℕ, k = m + 1 / 2) (n : ℕ) :
    Tendsto (fun s : ℂ => (s + n) * mellin (fun t : ℝ => Complex.exp t *
      upperIncompleteGammaLocal ((k : ℂ) - 1) (2 * t)) s) (𝓝[≠] (-(n : ℂ)))
      (𝓝 (Complex.Gamma ((k : ℂ) - 1) / (n.factorial : ℂ))) := sorry

/-- Bringmann–Rolen (3.19): the radial expansion of `f*` from below. -/
theorem nonholomorphicEichler_hasRadialExpansionBelow {k : ℝ} (hk : ∃ m : ℕ, k = m + 1 / 2)
    {N : ℕ} (hN : 4 ∣ N) {f : ℂ → ℂ} {a : ℕ → ℂ} (hf : IsShimuraCuspFormLocal k N f)
    (hfa : ∀ w : ℂ, 0 < w.im →
      HasSum (fun n : ℕ => a (n + 1) * Complex.exp (2 * π * Complex.I * ((n + 1 : ℕ) : ℂ) * w))
        (f w)) (x : ℚ) {L : ℂ → ℂ} (hL : Differentiable ℂ L)
    (hLs : ∀ s : ℂ, k / 2 + 2 < s.re → L s = twistedLSeriesLocal a x s) :
    HasRadialExpansionBelow (nonholomorphicEichlerIntegral k f) x
      (PowerSeries.mk fun n => (-1 : ℂ) ^ n / (n.factorial : ℂ) * L ((k : ℂ) - 1 - n)) := sorry

/-- Bringmann–Rolen Proposition 2.1: `f̃` and `f*` have agreeing expansions at every rational. -/
theorem eichler_radialExpansionsAgree {k : ℝ} (hk : ∃ m : ℕ, k = m + 1 / 2) {N : ℕ}
    (hN : 4 ∣ N) {f : ℂ → ℂ} {a : ℕ → ℂ} (hf : IsShimuraCuspFormLocal k N f)
    (hfa : ∀ w : ℂ, 0 < w.im →
      HasSum (fun n : ℕ => a (n + 1) * Complex.exp (2 * π * Complex.I * ((n + 1 : ℕ) : ℂ) * w))
        (f w)) (x : ℚ) :
    RadialExpansionsAgree (eichlerIntegral k 1 a) (nonholomorphicEichlerIntegral k f) x := sorry

/-- Bringmann–Rolen Theorem 1.1: the radial limits of `f̃` form a quantum modular form of weight
`2 − k` on `Γ₀(N)` with multiplier `χ₋₄(d)ε_d^{2(2−k)}(c/d)` (lower boundary branch). -/
theorem eichlerIntegral_isQuantumModularForm {k : ℝ} (hk : ∃ m : ℕ, k = m + 1 / 2) {N : ℕ}
    (hN : 4 ∣ N) {f : ℂ → ℂ} {a : ℕ → ℂ} (hf : IsShimuraCuspFormLocal k N f)
    (hfa : ∀ w : ℂ, 0 < w.im →
      HasSum (fun n : ℕ => a (n + 1) * Complex.exp (2 * π * Complex.I * ((n + 1 : ℕ) : ℂ) * w))
        (f w)) :
    IsQuantumModularForm (CongruenceSubgroup.Gamma0 N) (2 - k)
      (fun γ => chiMinusFour (γ 1 1) * shimuraFactorLocal (2 - k) γ)
      (fun x : ℚ => radialLimit (eichlerIntegral k 1 a) x) := sorry

/-- Bringmann–Rolen Corollary 1.2: `Q_f(x) = L_f(e^{2πix}; k − 1)` is quantum modular. -/
theorem twistedLValue_isQuantumModularForm {k : ℝ} (hk : ∃ m : ℕ, k = m + 1 / 2) {N : ℕ}
    (hN : 4 ∣ N) {f : ℂ → ℂ} {a : ℕ → ℂ} (hf : IsShimuraCuspFormLocal k N f)
    (hfa : ∀ w : ℂ, 0 < w.im →
      HasSum (fun n : ℕ => a (n + 1) * Complex.exp (2 * π * Complex.I * ((n + 1 : ℕ) : ℂ) * w))
        (f w)) (Lval : ℚ → ℂ → ℂ) (hL : ∀ x, Differentiable ℂ (Lval x))
    (hLs : ∀ x : ℚ, ∀ s : ℂ, k / 2 + 2 < s.re → Lval x s = twistedLSeriesLocal a x s) :
    IsQuantumModularForm (CongruenceSubgroup.Gamma0 N) (2 - k)
      (fun γ => chiMinusFour (γ 1 1) * shimuraFactorLocal (2 - k) γ)
      (fun x : ℚ => Lval x ((k : ℂ) - 1)) := sorry

/-! ### Kontsevich's strange series, the sum of tails and the strange identity -/

open scoped PowerSeries.WithPiTopology

/-- `(a; x)_n = ∏_{j<n}(1 − a x^j)` in a commutative ring; `(ξ; ξ)_n = rootPochhammer ξ ξ n`.
(The formal-power-series `q`-Pochhammer symbol is QM.0's; this is its evaluation.) -/
def rootPochhammer {R : Type*} [CommRing R] (a x : R) (n : ℕ) : R :=
  ∏ j ∈ range n, (1 - a * x ^ j)

/-- The formal value `F(ξ) = Σ_{n < ord ξ}(ξ; ξ)_n` of Kontsevich's series at a root of unity (the
Habiro evaluation `ev_ξ F` of HabiroCyclotomicCompletions HC.3; junk value `0` if `ξ` is not a root
of unity). -/
def kontsevichValue (ξ : ℂ) : ℂ :=
  ∑ n ∈ range (orderOf ξ), rootPochhammer ξ ξ n

/-- The variable `q = ξe^{−t}` as a power series in `t`. -/
def rootTaylorVariable (ξ : ℂ) : PowerSeries ℂ :=
  ξ • PowerSeries.rescale (-1 : ℂ) (PowerSeries.exp ℂ)

/-- The Taylor expansion `T_ξF = Σ_n (ξe^{−t}; ξe^{−t})_n ∈ ℂ⟦t⟧` of Kontsevich's series at `ξ`. -/
def kontsevichTaylor (ξ : ℂ) : PowerSeries ℂ :=
  ∑' n : ℕ, rootPochhammer (rootTaylorVariable ξ) (rootTaylorVariable ξ) n

/-- `φ(x) = e^{πix/12}F(e^{2πix})` on `ℚ`. -/
def kontsevichPhi (x : ℚ) : ℂ :=
  Complex.exp (π * Complex.I * x / 12) * kontsevichValue (Complex.exp (2 * π * Complex.I * x))

theorem kontsevichValue_eq_sum_range {ξ : ℂ} {M : ℕ} (hM : 0 < M) (hξ : ξ ^ M = 1) :
    kontsevichValue ξ = ∑ n ∈ range M, rootPochhammer ξ ξ n := sorry

theorem constantCoeff_kontsevichTaylor {ξ : ℂ} (hξ : ∃ M : ℕ, 0 < M ∧ ξ ^ M = 1) :
    PowerSeries.constantCoeff (kontsevichTaylor ξ) = kontsevichValue ξ := sorry

theorem kontsevichValue_galois (σ : ℂ ≃+* ℂ) {ξ : ℂ} (hξ : ∃ M : ℕ, 0 < M ∧ ξ ^ M = 1) :
    σ (kontsevichValue ξ) = kontsevichValue (σ ξ) := sorry

theorem kontsevichPhi_add_one (x : ℚ) :
    kontsevichPhi (x + 1) = Complex.exp (2 * π * Complex.I / 24) * kontsevichPhi x := sorry

theorem kontsevichPhi_neg (x : ℚ) : kontsevichPhi (-x) = starRingEnd ℂ (kontsevichPhi x) := sorry

/-- Unit test `TauCeti.QSeries.kontsevichValue.test_one`: `F(1) = 1`. -/
example : kontsevichValue 1 = 1 := sorry

/-- Unit test `TauCeti.QSeries.kontsevichValue.test_neg_one`: `F(−1) = 3`. -/
example : kontsevichValue (-1) = 3 := sorry

/-- Unit test `TauCeti.QSeries.kontsevichValue.test_I`: `F(i) = 8 − 3i`. -/
example : kontsevichValue Complex.I = 8 - 3 * Complex.I := sorry

/-- Unit test `TauCeti.QSeries.kontsevichTaylor.test_one_coeffs`: `F(e^{−t}) = 1 + t + (3/2)t² + ⋯`. -/
example : PowerSeries.coeff 0 (kontsevichTaylor 1) = 1 ∧ PowerSeries.coeff 1 (kontsevichTaylor 1) = 1 ∧
    PowerSeries.coeff 2 (kontsevichTaylor 1) = 3 / 2 := sorry

/-- Unit test `TauCeti.QSeries.kontsevichValue.test_not_power_series`: the partial sums of
`Σ (q; q)_n` do not converge in `ℤ⟦q⟧`. -/
example (M : ℕ) : PowerSeries.coeff 1
    (∑ n ∈ range (M + 1), rootPochhammer (PowerSeries.X : PowerSeries ℤ) PowerSeries.X n) =
      -(M : ℤ) := sorry

/-- The sum of tails `F₁ = Σ_{n≥1} n(q; q)_{n−1}qⁿ ∈ ℤ⟦q⟧`. -/
def sumOfTails : PowerSeries ℤ :=
  ∑' n : ℕ, ((n + 1 : ℕ) : PowerSeries ℤ) *
    rootPochhammer (PowerSeries.X : PowerSeries ℤ) PowerSeries.X n * PowerSeries.X ^ (n + 1)

/-- `F₁` as a function on the unit disc. -/
def sumOfTailsFun (q : ℂ) : ℂ :=
  ∑' n : ℕ, ((n + 1 : ℕ) : ℂ) * rootPochhammer q q n * q ^ (n + 1)

/-- The tails series `F₂ = Σ_n [(q; q)_n − (q; q)_∞] ∈ ℤ⟦q⟧`. -/
def tailsSeries : PowerSeries ℤ :=
  ∑' n : ℕ, (rootPochhammer (PowerSeries.X : PowerSeries ℤ) PowerSeries.X n -
    ∏' j : ℕ, (1 - PowerSeries.X ^ (j + 1) : PowerSeries ℤ))

theorem sumOfTails_eq_tailsSeries : sumOfTails = tailsSeries := sorry

theorem sumOfTailsFun_eq_tsum {q : ℂ} (hq : ‖q‖ < 1) :
    sumOfTailsFun q = ∑' m : ℕ, ((PowerSeries.coeff m sumOfTails : ℤ) : ℂ) * q ^ m := sorry

theorem coeff_sumOfTails (m : ℕ) :
    PowerSeries.coeff m sumOfTails = ∑ n ∈ range m, PowerSeries.coeff m
      (((n + 1 : ℕ) : PowerSeries ℤ) *
        rootPochhammer (PowerSeries.X : PowerSeries ℤ) PowerSeries.X n * PowerSeries.X ^ (n + 1)) :=
  sorry

/-- Unit test `TauCeti.QSeries.sumOfTails.test_coeffs`: `F₁ = q + 2q² + q³ + ⋯`. -/
example : PowerSeries.coeff 1 sumOfTails = 1 ∧ PowerSeries.coeff 2 sumOfTails = 2 ∧
    PowerSeries.coeff 3 sumOfTails = 1 := sorry

/-- Unit test `TauCeti.QSeries.sumOfTails.test_constantCoeff`: `F₁` has no constant term. -/
example : PowerSeries.constantCoeff sumOfTails = 0 := sorry

/-- Unit test `TauCeti.QSeries.sumOfTails.test_eq_tails`: `F₁ = F₂`. -/
example : sumOfTails = tailsSeries := sorry

/-- Zagier (16) and the analytic agreement of `F₁` with `F` at roots of unity. -/
theorem sumOfTails_partial (N : ℕ) :
    ∑ n ∈ range N, (rootPochhammer (PowerSeries.X : PowerSeries ℤ) PowerSeries.X n -
        rootPochhammer PowerSeries.X PowerSeries.X N) =
      ∑ n ∈ range N, ((n + 1 : ℕ) : PowerSeries ℤ) *
        rootPochhammer (PowerSeries.X : PowerSeries ℤ) PowerSeries.X n * PowerSeries.X ^ (n + 1) :=
  sorry

theorem sumOfTails_hasRadialExpansion (x : ℚ) :
    HasRadialExpansion (fun τ => sumOfTailsFun (Complex.exp (2 * π * Complex.I * τ))) x
      (kontsevichTaylor (Complex.exp (2 * π * Complex.I * x))) := sorry

/-- `χ₁₂` on natural numbers, as an integer. -/
def chiTwelveNat (n : ℕ) : ℤ :=
  if n % 12 = 1 ∨ n % 12 = 11 then 1 else if n % 12 = 5 ∨ n % 12 = 7 then -1 else 0

/-- Andrews' exercise (Zagier (23)): in `(ℤ⟦x⟧)⟦q⟧`,
`Σ_{n≥0}(x; q)_{n+1}xⁿ = Σ_{n≥1} χ₁₂(n)x^{(n−1)/2}q^{(n²−1)/24}`. -/
theorem andrews_exercise_identity :
    HasSum (fun n : ℕ => rootPochhammer (PowerSeries.C (PowerSeries.X : PowerSeries ℤ))
        (PowerSeries.X : PowerSeries (PowerSeries ℤ)) (n + 1) *
          PowerSeries.C (PowerSeries.X : PowerSeries ℤ) ^ n)
      (∑' n : ℕ, (chiTwelveNat n : PowerSeries (PowerSeries ℤ)) *
        PowerSeries.C ((PowerSeries.X : PowerSeries ℤ) ^ ((n - 1) / 2)) *
          PowerSeries.X ^ ((n ^ 2 - 1) / 24)) := sorry

/-- `H(q) = Σ_{n≥1} nχ₁₂(n)q^{(n²−1)/24}`. -/
def etaHalfDerivSeries : PowerSeries ℚ :=
  ∑' n : ℕ, ((n * chiTwelveNat n : ℤ) : PowerSeries ℚ) * PowerSeries.X ^ ((n ^ 2 - 1) / 24)

/-- Zagier's Theorem 2: `F₁ = −½H + (½ − E)(q; q)_∞` with `E = Σ d(n)qⁿ`. -/
theorem zagier_sum_of_tails_identity :
    PowerSeries.map (Int.castRingHom ℚ) sumOfTails =
      -(1 / 2 : ℚ) • etaHalfDerivSeries +
        (PowerSeries.C (1 / 2 : ℚ) -
            PowerSeries.mk fun n => ((ArithmeticFunction.sigma 0 n : ℕ) : ℚ)) *
          ∏' j : ℕ, (1 - PowerSeries.X ^ (j + 1) : PowerSeries ℚ) := sorry

/-- Euler's product vanishes to infinite order radially at every rational point, also after
multiplication by `E(q)`. -/
theorem eulerProduct_hasRadialExpansion_zero (x : ℚ) :
    HasRadialExpansion (fun τ => ∏' j : ℕ, (1 - Complex.exp (2 * π * Complex.I * (j + 1) * τ))) x 0 ∧
      HasRadialExpansion (fun τ => (∑' n : ℕ, ((ArithmeticFunction.sigma 0 (n + 1) : ℕ) : ℂ) *
        Complex.exp (2 * π * Complex.I * (n + 1) * τ)) *
          ∏' j : ℕ, (1 - Complex.exp (2 * π * Complex.I * (j + 1) * τ))) x 0 := sorry

/-- The strange identity: the radial expansion of `H` at every root of unity is `−2·T_ξF`. -/
theorem strange_identity (x : ℚ) :
    HasRadialExpansion (fun τ => ∑' n : ℕ, ((n * chiTwelveNat n : ℤ) : ℂ) *
        Complex.exp (2 * π * Complex.I * τ * (((n ^ 2 - 1) / 24 : ℕ) : ℂ))) x
      ((-2 : ℂ) • kontsevichTaylor (Complex.exp (2 * π * Complex.I * x))) := sorry

/-- The value formula `F(ξ) = (1/4N)Σ_{m=1}^N m²χ₁₂(m)ξ^{(m²−1)/24}` (Zagier, Theorem 6, `n = 0`). -/
theorem kontsevichValue_eq_sum (α : ℚ) {N : ℕ} (hN : 12 ∣ N) (hN0 : 0 < N)
    (hξ : Complex.exp (2 * π * Complex.I * α) ^ (N / 12) = 1) :
    kontsevichValue (Complex.exp (2 * π * Complex.I * α)) =
      1 / (4 * N) * ∑ m ∈ Icc 1 N, ((m : ℂ) ^ 2 * chiTwelveNat m) *
        Complex.exp (2 * π * Complex.I * α * ((m : ℂ) ^ 2 - 1) / 24) := sorry

/-- Kontsevich's `φ` is a quantum modular form of weight `3/2` on `SL(2, ℤ)` (Zagier, Topology 40,
§6), with the multiplier inverse to that of `η` on the lower boundary branch, and the explicit
`S`-law `φ(x) + (ix)^{−3/2}φ(−1/x) = g(x)` with `g` smooth and real-analytic off `0`. -/
theorem kontsevichPhi_isQuantumModularForm :
    (∃ ε : SL(2, ℤ) → ℂ, ε ModularGroup.T = Complex.exp (-(2 * π * Complex.I / 24)) ∧
      ε ModularGroup.S = Complex.exp (2 * π * Complex.I / 8) ∧
      IsQuantumModularForm ⊤ (3 / 2) ε kontsevichPhi) ∧
    ∃ g : ℝ → ℂ, ContDiff ℝ (⊤ : ℕ∞) g ∧ AnalyticOnNhd ℝ g ({0}ᶜ) ∧
      ∀ x : ℚ, x ≠ 0 → kontsevichPhi x +
        (Complex.I * x) ^ (-(3 / 2 : ℂ)) * kontsevichPhi (-1 / x) = g x := sorry

/-! ### Cohen's σ at roots of unity -/

/-- `σ(ξ) = 1 + Σ(−1)ⁿξ^{n+1}(ξ; ξ)_n` (terminating). -/
def cohenSigma (ξ : ℂ) : ℂ :=
  1 + ∑ n ∈ range (orderOf ξ), (-1) ^ n * ξ ^ (n + 1) * rootPochhammer ξ ξ n

/-- `σ*(ξ) = −2Σξ^{n+1}(ξ²; ξ²)_n` (terminating). -/
def cohenSigmaStar (ξ : ℂ) : ℂ :=
  -2 * ∑ n ∈ range (orderOf ξ), ξ ^ (n + 1) * rootPochhammer (ξ ^ 2) (ξ ^ 2) n

theorem cohenSigma_eq_sum_range {ξ : ℂ} {M : ℕ} (hM : 0 < M) (hξ : ξ ^ M = 1) :
    cohenSigma ξ = 1 + ∑ n ∈ range M, (-1) ^ n * ξ ^ (n + 1) * rootPochhammer ξ ξ n := sorry

theorem cohenSigmaStar_eq_sum_range {ξ : ℂ} {M : ℕ} (hM : 0 < M) (hξ : (ξ ^ 2) ^ M = 1)
    (hroot : ∃ M' : ℕ, 0 < M' ∧ ξ ^ M' = 1) :
    cohenSigmaStar ξ = -2 * ∑ n ∈ range M, ξ ^ (n + 1) * rootPochhammer (ξ ^ 2) (ξ ^ 2) n :=
  sorry

theorem cohenSigma_galois (σ : ℂ ≃+* ℂ) {ξ : ℂ} (hξ : ∃ M : ℕ, 0 < M ∧ ξ ^ M = 1) :
    σ (cohenSigma ξ) = cohenSigma (σ ξ) ∧ σ (cohenSigmaStar ξ) = cohenSigmaStar (σ ξ) := sorry

theorem cohenSigma_one : cohenSigma 1 = 2 := sorry

/-- Unit test `TauCeti.QSeries.cohenSigma.test_one`: `σ(1) = 2`. -/
example : cohenSigma 1 = 2 := sorry

/-- Unit test `TauCeti.QSeries.cohenSigma.test_neg_one`: `σ(−1) = −2`. -/
example : cohenSigma (-1) = -2 := sorry

/-- Unit test `TauCeti.QSeries.cohenSigma.test_I`: `σ(i) = −2i − 4`. -/
example : cohenSigma Complex.I = -2 * Complex.I - 4 := sorry

/-- Unit test `TauCeti.QSeries.cohenSigmaStar.test_one`: `σ*(1) = −2`. -/
example : cohenSigmaStar 1 = -2 := sorry

/-- Cohen's telescoping identity (9) in `ℤ[q, q⁻¹]`. -/
theorem cohen_telescoping_identity (k : ℕ) :
    ∑ n ∈ range k, ∏ j ∈ range n, (LaurentPolynomial.T (-((j : ℤ) + 1)) - 1 :
        LaurentPolynomial ℤ) -
      ∑ n ∈ range k, LaurentPolynomial.T ((n : ℤ) + 1) *
        ∏ j ∈ range n, (1 - LaurentPolynomial.T (2 * ((j : ℤ) + 1))) =
    (∏ j ∈ range k, (1 - LaurentPolynomial.T ((j : ℤ) + 1))) *
      ∑ n ∈ Icc 1 k, LaurentPolynomial.T (-(((n * (n - 1) / 2 : ℕ)) : ℤ)) *
        ∏ j ∈ range (k - n), (1 + LaurentPolynomial.T ((j : ℤ) + 1)) := sorry

/-- Cohen's duality `σ(ξ) = −σ*(ξ⁻¹)` at every root of unity. -/
theorem cohenSigma_eq_neg_cohenSigmaStar_inv {ξ : ℂ} (hξ : ∃ M : ℕ, 0 < M ∧ ξ ^ M = 1) :
    cohenSigma ξ = -cohenSigmaStar ξ⁻¹ := sorry

/-! ### The Poincaré homology sphere (Lawrence–Zagier)

The comparison of the radial limits below with the WRT invariant and with the unified invariant
(ArithmeticQuantumTopology QT.3, QT.4) is not restated here: those invariants are the other
roadmap's declarations. -/

/-- `χ₊` of period 60. -/
def lzChiPlus (n : ZMod 60) : ℤ :=
  if n = 1 ∨ n = 11 ∨ n = 19 ∨ n = 29 then 1
  else if n = 31 ∨ n = 41 ∨ n = 49 ∨ n = 59 then -1 else 0

/-- `χ₋` of period 60. -/
def lzChiMinus (n : ZMod 60) : ℤ :=
  if n = 7 ∨ n = 13 ∨ n = 17 ∨ n = 23 then 1
  else if n = 37 ∨ n = 43 ∨ n = 47 ∨ n = 53 then -1 else 0

/-- The character `ε` of conductor 5 with `ε(1, 2, 3, 4) = (1, −i, i, −1)`. -/
def epsFive (n : ZMod 5) : ℂ :=
  if n = 1 then 1 else if n = 2 then -Complex.I else if n = 3 then Complex.I
  else if n = 4 then -1 else 0

theorem lzChiPlus_ne_zero_iff (n : ZMod 60) : lzChiPlus n ≠ 0 ↔ n.val ^ 2 % 120 = 1 := sorry

theorem lzChiPlus_neg (n : ZMod 60) :
    lzChiPlus (-n) = -lzChiPlus n ∧ lzChiMinus (-n) = -lzChiMinus n := sorry

theorem sum_lzChiPlus : ∑ n : ZMod 60, lzChiPlus n = 0 ∧ ∑ n : ZMod 60, lzChiMinus n = 0 := sorry

theorem lzChiPlus_eq_re (n : ZMod 60) :
    (lzChiPlus n : ℂ) = (chiTwelve (n.val : ZMod 12) * epsFive (n.val : ZMod 5)).re ∧
      (lzChiMinus n : ℂ) = (chiTwelve (n.val : ZMod 12) * epsFive (n.val : ZMod 5)).im := sorry

/-- Unit test `TauCeti.QSeries.lzChiPlus.test_values`: sample values. -/
example : lzChiPlus 11 = 1 ∧ lzChiPlus 49 = -1 ∧ lzChiPlus 7 = 0 := sorry

/-- Unit test `TauCeti.QSeries.lzChiPlus.test_zagier_description`: Zagier's description of `χ₊`. -/
example (n : ℕ) : lzChiPlus n = if Nat.gcd n 6 = 1 ∧ (n % 5 = 1 ∨ n % 5 = 4)
    then (-1) ^ (n % 60 / 30) else 0 := sorry

/-- Unit test `TauCeti.QSeries.lzChiPlus.test_mean_zero`: `χ₊` has mean zero. -/
example : ∑ n : ZMod 60, lzChiPlus n = 0 := sorry

/-- Unit test `TauCeti.QSeries.lzChiPlus.test_not_multiplicative`: `χ₊` is not multiplicative. -/
example : lzChiPlus 7 * lzChiPlus 7 ≠ lzChiPlus 49 := sorry

/-- `A(q) = Σ_{n≥1} χ₊(n)q^{(n²−1)/120} ∈ ℤ⟦q⟧`. -/
def lzSeries : PowerSeries ℤ :=
  PowerSeries.mk fun m => if IsSquare (120 * m + 1) then lzChiPlus (Nat.sqrt (120 * m + 1)) else 0

/-- `A` as a function on the unit disc. -/
def lzSeriesFun (q : ℂ) : ℂ :=
  ∑' n : ℕ, (lzChiPlus n : ℂ) * q ^ ((n ^ 2 - 1) / 120)

/-- `Θ̃_χ(τ) = Σ_{n≥1} χ(n)q^{n²/120}` for `χ = χ₊, χ₋`. -/
def lzThetaTilde (χ : ZMod 60 → ℤ) (τ : ℂ) : ℂ :=
  ∑' n : ℕ, (χ n : ℂ) * Complex.exp (2 * π * Complex.I * (n : ℂ) ^ 2 * τ / 120)

theorem lzThetaTilde_eq {τ : ℂ} (hτ : 0 < τ.im) :
    lzThetaTilde lzChiPlus τ =
      Complex.exp (2 * π * Complex.I * τ / 120) * lzSeriesFun (Complex.exp (2 * π * Complex.I * τ)) :=
  sorry

theorem lzThetaTilde_eq_eichlerIntegral (τ : ℂ) :
    ((Real.sqrt 120 : ℝ) : ℂ) * lzThetaTilde lzChiPlus τ = eichlerIntegral (3 / 2) 120
      (fun m => if IsSquare m then (Nat.sqrt m : ℂ) * lzChiPlus (Nat.sqrt m) else 0) τ := sorry

theorem coeff_lzSeries (m : ℕ) : PowerSeries.coeff m lzSeries =
    if IsSquare (120 * m + 1) then lzChiPlus (Nat.sqrt (120 * m + 1)) else 0 := sorry

/-- Unit test `TauCeti.QSeries.lzSeries.test_coeffs`: `A = 1 + q + q³ + ⋯ − q⁸ − ⋯`. -/
example : PowerSeries.coeff 0 lzSeries = 1 ∧ PowerSeries.coeff 1 lzSeries = 1 ∧
    PowerSeries.coeff 2 lzSeries = 0 ∧ PowerSeries.coeff 3 lzSeries = 1 ∧
    PowerSeries.coeff 8 lzSeries = -1 := sorry

/-- Unit test `TauCeti.QSeries.lzSeries.test_constantCoeff`: `A(0) = 1`. -/
example : PowerSeries.constantCoeff lzSeries = 1 := sorry

/-- Unit test `TauCeti.QSeries.lzSeries.test_coeff_range`: the coefficients lie in `{−1, 0, 1}`. -/
example (m : ℕ) : PowerSeries.coeff m lzSeries ∈ ({-1, 0, 1} : Set ℤ) := sorry

/-- The analytic side of Lawrence–Zagier Theorem 1: the radial limit of `A` at a root of unity of
order `K` is `Σ_{n=1}^{30K}χ₊(n)(1 − n/(30K))ξ^{(n²−1)/120}` (the WRT identification is QT.4's). -/
theorem lzSeries_hasRadialLimit (x : ℚ) :
    HasRadialLimit (fun τ => lzSeriesFun (Complex.exp (2 * π * Complex.I * τ))) x
      (∑ n ∈ Icc 1 (30 * x.den), (lzChiPlus n : ℂ) * (1 - (n : ℂ) / (30 * x.den)) *
        Complex.exp (2 * π * Complex.I * x * (((n ^ 2 - 1) / 120 : ℕ) : ℂ))) := sorry

/-- The analytic side of Lawrence–Zagier Theorem 2: the expansion of `A` at `q = 1`. -/
theorem lzSeries_hasRadialExpansion_zero :
    HasRadialExpansion (fun τ => lzSeriesFun (Complex.exp (2 * π * Complex.I * τ))) 0
      (PowerSeries.rescale (1 / 120 : ℂ) (PowerSeries.exp ℂ) *
        PowerSeries.mk fun r => ZMod.LFunction (fun n => (lzChiPlus n : ℂ)) (-(2 * r : ℂ)) *
          (-1 / 120 : ℂ) ^ r / (r.factorial : ℂ)) := sorry

/-- The weight-3/2 theta series `Θ_χ(τ) = Σ_{n≥1} nχ(n)q^{n²/120}`. -/
def lzTheta (χ : ZMod 60 → ℤ) (τ : ℂ) : ℂ :=
  ∑' n : ℕ, (n : ℂ) * (χ n : ℂ) * Complex.exp (2 * π * Complex.I * (n : ℂ) ^ 2 * τ / 120)

/-- Lawrence–Zagier (15). -/
theorem lzTheta_transformation {τ : ℂ} (hτ : 0 < τ.im) :
    lzTheta lzChiPlus (τ + 1) = Complex.exp (π * Complex.I / 60) * lzTheta lzChiPlus τ ∧
    lzTheta lzChiMinus (τ + 1) = Complex.exp (49 * π * Complex.I / 60) * lzTheta lzChiMinus τ ∧
    lzTheta lzChiPlus (-1 / τ) = (τ / Complex.I) ^ (3 / 2 : ℂ) *
      (Real.sqrt ((1 - 1 / Real.sqrt 5) / 2) * lzTheta lzChiPlus τ +
        Real.sqrt ((1 + 1 / Real.sqrt 5) / 2) * lzTheta lzChiMinus τ) ∧
    lzTheta lzChiMinus (-1 / τ) = (τ / Complex.I) ^ (3 / 2 : ℂ) *
      (Real.sqrt ((1 + 1 / Real.sqrt 5) / 2) * lzTheta lzChiPlus τ -
        Real.sqrt ((1 - 1 / Real.sqrt 5) / 2) * lzTheta lzChiMinus τ) := sorry

/-- The radial limits of `Θ̃₊` form a quantum modular form of weight `1/2` on a finite-index
subgroup (Lawrence–Zagier §4; Zagier, Quantum modular forms, Example 4). -/
theorem lzThetaTilde_isQuantumModularForm :
    ∃ Γ : Subgroup SL(2, ℤ), Γ.FiniteIndex ∧ ∃ ε : SL(2, ℤ) → ℂ,
      IsQuantumModularForm Γ (1 / 2) ε (fun x : ℚ => radialLimit (lzThetaTilde lzChiPlus) x) :=
  sorry

/-! ### Cranks, ranks and the congruences mod 5, 7, 11 (Andrews–Garvan; Garvan; Dyson) -/

/-- The largest part of a partition (`0` for the empty partition). -/
def largestPart {n : ℕ} (p : Nat.Partition n) : ℕ := p.parts.sup

/-- The number of parts equal to `1`. -/
def numOnes {n : ℕ} (p : Nat.Partition n) : ℕ := p.parts.count 1

/-- The number of parts larger than the number of ones. -/
def numPartsAbove {n : ℕ} (p : Nat.Partition n) : ℕ :=
  (p.parts.filter fun i => numOnes p < i).card

/-- The Andrews–Garvan crank: `ℓ(λ)` if `λ` has no ones, else `μ(λ) − ω(λ)`. -/
def partitionCrank {n : ℕ} (p : Nat.Partition n) : ℤ :=
  if numOnes p = 0 then (largestPart p : ℤ) else (numPartsAbove p : ℤ) - numOnes p

/-- Dyson's rank: largest part minus number of parts. -/
def dysonRank {n : ℕ} (p : Nat.Partition n) : ℤ := (largestPart p : ℤ) - p.parts.card

/-- The partition `1ⁿ`. -/
def onesPartition (n : ℕ) : Nat.Partition n :=
  Nat.Partition.ofSums n (Multiset.replicate n 1) (by simp)

theorem partitionCrank_of_numOnes_eq_zero {n : ℕ} {p : Nat.Partition n} (h : numOnes p = 0) :
    partitionCrank p = largestPart p := sorry

theorem partitionCrank_of_numOnes_pos {n : ℕ} {p : Nat.Partition n} (h : 0 < numOnes p) :
    partitionCrank p = (numPartsAbove p : ℤ) - numOnes p := sorry

theorem partitionCrank_indiscrete {n : ℕ} (hn : 2 ≤ n) :
    partitionCrank (Nat.Partition.indiscrete n) = n := sorry

theorem partitionCrank_ones {n : ℕ} (hn : 1 ≤ n) : partitionCrank (onesPartition n) = -(n : ℤ) :=
  sorry

theorem abs_partitionCrank_le {n : ℕ} (p : Nat.Partition n) : |partitionCrank p| ≤ n := sorry

/-- Unit test `TauCeti.QSeries.partitionCrank.test_six`: the cranks of the partitions of `6`. -/
example : (Finset.univ.val.map fun p : Nat.Partition 6 => partitionCrank p) =
    ({6, 0, 4, -1, 3, 1, -3, 2, -2, -4, -6} : Multiset ℤ) := sorry

/-- Unit test `TauCeti.QSeries.partitionCrank.test_one`: the crank of the partition of `1` is `−1`. -/
example (p : Nat.Partition 1) : partitionCrank p = -1 := sorry

/-- Unit test `TauCeti.QSeries.partitionCrank.test_ne_rank`: `5 + 1` has crank `0` and rank `3`. -/
example : partitionCrank (Nat.Partition.ofSums 6 {5, 1} rfl) = 0 ∧
    dysonRank (Nat.Partition.ofSums 6 {5, 1} rfl) = 3 := sorry

/-- Unit test `TauCeti.QSeries.partitionCrank.test_eleven_classes`: the cranks of the partitions of
`6` are pairwise incongruent mod `11`. -/
example : Function.Injective fun p : Nat.Partition 6 => (partitionCrank p : ZMod 11) := sorry

/-- The crank count `M(m, n)`, with the convention `M(0,1) = −1`, `M(±1,1) = 1` at `n = 1`. -/
def crankCount (m : ℤ) (n : ℕ) : ℤ :=
  if n = 1 then (if m = 1 ∨ m = -1 then 1 else if m = 0 then -1 else 0)
  else ((Finset.univ.filter fun p : Nat.Partition n => partitionCrank p = m).card : ℤ)

/-- `M(k, t, n) = Σ_{m ≡ k (mod t)} M(m, n)`. -/
def crankCountMod (t : ℕ) (k : ZMod t) (n : ℕ) : ℤ :=
  ∑ m ∈ (Finset.Icc (-(n : ℤ)) n).filter (fun m : ℤ => ((m : ZMod t)) = k), crankCount m n

theorem sum_crankCount (n : ℕ) :
    ∑ m ∈ Finset.Icc (-(n : ℤ)) n, crankCount m n = Fintype.card (Nat.Partition n) := sorry

theorem sum_crankCountMod (t : ℕ) [NeZero t] (n : ℕ) :
    ∑ k : ZMod t, crankCountMod t k n = Fintype.card (Nat.Partition n) := sorry

theorem crankCount_neg (m : ℤ) (n : ℕ) : crankCount (-m) n = crankCount m n := sorry

theorem crankCount_eq_zero_of_lt {m : ℤ} {n : ℕ} (h : (n : ℤ) < |m|) : crankCount m n = 0 := sorry

theorem crankCount_one : crankCount 0 1 = -1 ∧ crankCount 1 1 = 1 ∧ crankCount (-1) 1 = 1 := sorry

/-- Unit test `TauCeti.QSeries.crankCount.test_sum_six`: `Σ_m M(m, 6) = 11`. -/
example : ∑ m ∈ Finset.Icc (-6 : ℤ) 6, crankCount m 6 = 11 := sorry

/-- Unit test `TauCeti.QSeries.crankCountMod.test_eleven_six`: `M(k, 11, 6) = 1` for all `k`. -/
example (k : ZMod 11) : crankCountMod 11 k 6 = 1 := sorry

/-- Unit test `TauCeti.QSeries.crankCount.test_one`: the convention at `n = 1`. -/
example : crankCount 0 1 = -1 ∧ crankCount 1 1 = 1 ∧ crankCount (-1) 1 = 1 := sorry

/-- Unit test `TauCeti.QSeries.crankCount.test_convention_differs`: the literal count at `n = 1`
differs from the convention. -/
example : crankCount 0 1 = -1 ∧
    (Finset.univ.filter fun p : Nat.Partition 1 => partitionCrank p = 0).card = 0 := sorry

/-- The crank generating function (Andrews–Garvan), with the inverted factors multiplied out:
`(Σ_n Σ_m M(m, n)zᵐqⁿ)·∏(1 − zqⁿ)(1 − z⁻¹qⁿ) = ∏(1 − qⁿ)`. -/
theorem crank_generating_function [TopologicalSpace (LaurentPolynomial ℤ)]
    [T2Space (LaurentPolynomial ℤ)] :
    (PowerSeries.mk fun n => ∑ m ∈ Finset.Icc (-(n : ℤ)) n,
        (crankCount m n : LaurentPolynomial ℤ) * LaurentPolynomial.T m) *
      (∏' j : ℕ, (1 - PowerSeries.C (LaurentPolynomial.T 1) * PowerSeries.X ^ (j + 1))) *
        (∏' j : ℕ, (1 - PowerSeries.C (LaurentPolynomial.T (-1)) * PowerSeries.X ^ (j + 1))) =
      ∏' j : ℕ, (1 - PowerSeries.X ^ (j + 1) : PowerSeries (LaurentPolynomial ℤ)) := sorry

/-- Equidistribution from a vanishing sum over a primitive root of unity of prime order. -/
theorem eq_of_sum_mul_primitiveRoot_eq_zero {t : ℕ} [NeZero t] (ht : t.Prime) {ζ : ℂ}
    (hζ : IsPrimitiveRoot ζ t) (c : ZMod t → ℚ) (h : ∑ k : ZMod t, (c k : ℂ) * ζ ^ k.val = 0) :
    ∀ k l : ZMod t, c k = c l := sorry

/-- The crank divides the partitions of `5n + 4` into five equal classes. -/
theorem crankCountMod_five (n : ℕ) (k : ZMod 5) :
    5 * crankCountMod 5 k (5 * n + 4) = Fintype.card (Nat.Partition (5 * n + 4)) := sorry

/-- The crank divides the partitions of `7n + 5` into seven equal classes. -/
theorem crankCountMod_seven (n : ℕ) (k : ZMod 7) :
    7 * crankCountMod 7 k (7 * n + 5) = Fintype.card (Nat.Partition (7 * n + 5)) := sorry

/-- The crank divides the partitions of `11n + 6` into eleven equal classes. -/
theorem crankCountMod_eleven (n : ℕ) (k : ZMod 11) :
    11 * crankCountMod 11 k (11 * n + 6) = Fintype.card (Nat.Partition (11 * n + 6)) := sorry

/-- Ramanujan's congruence `p(11n + 6) ≡ 0 (mod 11)`. -/
theorem ramanujan_congruence_eleven (n : ℕ) : 11 ∣ Fintype.card (Nat.Partition (11 * n + 6)) :=
  sorry

/-- The rank count `N(m, n)` (with `N(0, 0) = 1`). -/
def dysonRankCount (m : ℤ) (n : ℕ) : ℤ :=
  ((Finset.univ.filter fun p : Nat.Partition n => dysonRank p = m).card : ℤ)

/-- `N(k, t, n) = Σ_{m ≡ k (mod t)} N(m, n)`. -/
def dysonRankCountMod (t : ℕ) (k : ZMod t) (n : ℕ) : ℤ :=
  ∑ m ∈ (Finset.Icc (-(n : ℤ)) n).filter (fun m : ℤ => ((m : ZMod t)) = k), dysonRankCount m n

/-- Conjugation (`TauCeti.conjugate`, not restated here) is an involution negating the rank. -/
theorem dysonRank_conjugate (n : ℕ) :
    ∃ σ : Nat.Partition n ≃ Nat.Partition n, (∀ p, σ (σ p) = p) ∧
      ∀ p, dysonRank (σ p) = -dysonRank p := sorry

theorem dysonRankCount_neg (m : ℤ) (n : ℕ) : dysonRankCount (-m) n = dysonRankCount m n := sorry

theorem sum_dysonRankCount (n : ℕ) :
    ∑ m ∈ Finset.Icc (-(n : ℤ)) n, dysonRankCount m n = Fintype.card (Nat.Partition n) := sorry

/-- Unit test `TauCeti.QSeries.dysonRank.test_garvan_example`: the rank of `4+4+3+2+1+1+1` is `−3`. -/
example : dysonRank (Nat.Partition.ofSums 16 {4, 4, 3, 2, 1, 1, 1} rfl) = -3 := sorry

/-- Unit test `TauCeti.QSeries.dysonRankCountMod.test_five_four`: `N(k, 5, 4) = 1` for all `k`. -/
example (k : ZMod 5) : dysonRankCountMod 5 k 4 = 1 := sorry

/-- Unit test `TauCeti.QSeries.dysonRank.test_empty`: the empty partition has rank `0`. -/
example : dysonRank (default : Nat.Partition 0) = 0 ∧ dysonRankCount 0 0 = 1 := sorry

/-- Unit test `TauCeti.QSeries.dysonRankCountMod.test_not_eleven`: the rank does not separate the
partitions of `6` into eleven equal classes. -/
example : dysonRankCountMod 11 1 6 = 2 := sorry

/-- The rank generating function (Durfee square):
`Σ N(m, n)zᵐqⁿ = 1 + Σ_{n≥1} q^{n²}/((zq; q)_n(z⁻¹q; q)_n)`. -/
theorem rank_generating_function [TopologicalSpace (LaurentPolynomial ℤ)]
    [T2Space (LaurentPolynomial ℤ)] :
    (PowerSeries.mk fun n => ∑ m ∈ Finset.Icc (-(n : ℤ)) n,
        (dysonRankCount m n : LaurentPolynomial ℤ) * LaurentPolynomial.T m) =
      1 + ∑' n : ℕ, PowerSeries.X ^ ((n + 1) ^ 2) *
        PowerSeries.invOfUnit (rootPochhammer (PowerSeries.C (LaurentPolynomial.T 1) * PowerSeries.X)
          PowerSeries.X (n + 1) *
          rootPochhammer (PowerSeries.C (LaurentPolynomial.T (-1)) * PowerSeries.X) PowerSeries.X
            (n + 1)) 1 := sorry

/-- Atkin–Swinnerton-Dyer: the rank divides the partitions of `5n + 4` and `7n + 5` into equal
classes. -/
theorem atkin_swinnerton_dyer (n : ℕ) :
    (∀ k : ZMod 5, 5 * dysonRankCountMod 5 k (5 * n + 4) =
      Fintype.card (Nat.Partition (5 * n + 4))) ∧
    ∀ k : ZMod 7, 7 * dysonRankCountMod 7 k (7 * n + 5) =
      Fintype.card (Nat.Partition (7 * n + 5)) := sorry

/-! ### Radial limits of rank minus crank (Folsom–Ono–Rhoades)

Choi's identity, FOR Theorem 3.2 and Proposition 3.3 involve Zwegers' `µ` and its completion
(QM.4) and the η multiplier (QM.1); they are recorded in the roadmap document and not restated. -/

/-- Uniform bounds for `(wq; q)_n` at `q = ξe^{−t}`, `ξ = e^{2πih/k}`, `w ∈ ⟨ξ⟩`. -/
theorem rootPochhammer_bound {h k : ℕ} (hk : 0 < k) (hhk : Nat.Coprime h k) {w : ℂ}
    (hw : ∃ j : ℕ, w = Complex.exp (2 * π * Complex.I * h / k) ^ j) (m : ℕ) :
    ∃ C : ℝ, ∀ t ∈ Set.Ioc (0 : ℝ) 1, ∀ n : ℕ,
      ‖rootPochhammer (w * (Complex.exp (2 * π * Complex.I * h / k) * Real.exp (-t)))
          (Complex.exp (2 * π * Complex.I * h / k) * Real.exp (-t)) n‖ ≤ C ∧
      ((m + 1) * k ≤ n →
        ‖rootPochhammer (w * (Complex.exp (2 * π * Complex.I * h / k) * Real.exp (-t)))
          (Complex.exp (2 * π * Complex.I * h / k) * Real.exp (-t)) n‖ ≤ C * t ^ m) := sorry

/-- `U(w; q) = Σ_{n≥0}(wq; q)_n(w⁻¹q; q)_n q^{n+1}` in `ℤ[w, w⁻¹]⟦q⟧`. -/
def unimodalSeries [TopologicalSpace (LaurentPolynomial ℤ)] : PowerSeries (LaurentPolynomial ℤ) :=
  ∑' n : ℕ, rootPochhammer (PowerSeries.C (LaurentPolynomial.T 1) * PowerSeries.X) PowerSeries.X n *
    rootPochhammer (PowerSeries.C (LaurentPolynomial.T (-1)) * PowerSeries.X) PowerSeries.X n *
      PowerSeries.X ^ (n + 1)

/-- The terminating value `U(ζ_b^a; ζ_k^h) = Σ_{n<k}(wζ; ζ)_n(w⁻¹ζ; ζ)_nζ^{n+1}` (for `b ∣ k`). -/
def unimodalValue (a b h k : ℕ) : ℂ :=
  ∑ n ∈ range k,
    rootPochhammer (Complex.exp (2 * π * Complex.I * a / b) * Complex.exp (2 * π * Complex.I * h / k))
      (Complex.exp (2 * π * Complex.I * h / k)) n *
    rootPochhammer ((Complex.exp (2 * π * Complex.I * a / b))⁻¹ *
        Complex.exp (2 * π * Complex.I * h / k)) (Complex.exp (2 * π * Complex.I * h / k)) n *
      Complex.exp (2 * π * Complex.I * h / k) ^ (n + 1)

theorem unimodalValue_eq_sum_range {a b h k M : ℕ} (hbk : b ∣ k) (hk : 0 < k) (hM : k ≤ M) :
    unimodalValue a b h k = ∑ n ∈ range M,
      rootPochhammer (Complex.exp (2 * π * Complex.I * a / b) *
          Complex.exp (2 * π * Complex.I * h / k)) (Complex.exp (2 * π * Complex.I * h / k)) n *
      rootPochhammer ((Complex.exp (2 * π * Complex.I * a / b))⁻¹ *
          Complex.exp (2 * π * Complex.I * h / k)) (Complex.exp (2 * π * Complex.I * h / k)) n *
        Complex.exp (2 * π * Complex.I * h / k) ^ (n + 1) := sorry

theorem sum_pochhammer_eq_unimodalSeries [TopologicalSpace (LaurentPolynomial ℤ)]
    [T2Space (LaurentPolynomial ℤ)] :
    ∑' n : ℕ, PowerSeries.X ^ (n + 1) *
        rootPochhammer (PowerSeries.C (LaurentPolynomial.T 1)) PowerSeries.X (n + 1) *
        rootPochhammer (PowerSeries.C (LaurentPolynomial.T (-1))) PowerSeries.X (n + 1) =
      PowerSeries.C ((1 - LaurentPolynomial.T 1) * (1 - LaurentPolynomial.T (-1))) * unimodalSeries :=
  sorry

theorem unimodalValue_neg_one {h k' : ℕ} (hk' : 0 < k') (hh : Nat.Coprime h (2 * k')) :
    unimodalValue 1 2 h (2 * k') = ∑ n ∈ range k',
      rootPochhammer (-Complex.exp (2 * π * Complex.I * h / (2 * k')))
        (Complex.exp (2 * π * Complex.I * h / (2 * k'))) n ^ 2 *
          Complex.exp (2 * π * Complex.I * h / (2 * k')) ^ (n + 1) := sorry

/-- Unit test `TauCeti.QSeries.unimodalSeries.test_coeffs`: `U(−1; q) = q + q² + 3q³ + ⋯`. -/
example [TopologicalSpace (LaurentPolynomial ℤ)] [T2Space (LaurentPolynomial ℤ)] :
    PowerSeries.coeff 1 (PowerSeries.map (LaurentPolynomial.eval₂ (RingHom.id ℤ) (-1))
        unimodalSeries) = 1 ∧
    PowerSeries.coeff 2 (PowerSeries.map (LaurentPolynomial.eval₂ (RingHom.id ℤ) (-1))
        unimodalSeries) = 1 ∧
    PowerSeries.coeff 3 (PowerSeries.map (LaurentPolynomial.eval₂ (RingHom.id ℤ) (-1))
        unimodalSeries) = 3 := sorry

/-- Unit test `TauCeti.QSeries.unimodalValue.test_neg_one`: `U(−1; −1) = −1`. -/
example : unimodalValue 1 2 1 2 = -1 := sorry

/-- Unit test `TauCeti.QSeries.unimodalValue.test_I`: `U(−1; i) = −i`. -/
example : unimodalValue 1 2 1 4 = -Complex.I := sorry

/-- Unit test `TauCeti.QSeries.unimodalValue.test_nonterminating`: at `ζ = e^{2πi/3}` no factor of
`(−ζ; ζ)_n` vanishes. -/
example (n : ℕ) : rootPochhammer (-Complex.exp (2 * π * Complex.I / 3))
    (Complex.exp (2 * π * Complex.I / 3)) n ≠ 0 := sorry

/-- The rank function `R(w; q) = 1 + Σ_{n≥1} q^{n²}/((wq; q)_n(w⁻¹q; q)_n)` on the unit disc. -/
def rankFunction (w q : ℂ) : ℂ :=
  1 + ∑' n : ℕ, q ^ ((n + 1) ^ 2) /
    (rootPochhammer (w * q) q (n + 1) * rootPochhammer (w⁻¹ * q) q (n + 1))

/-- The crank function `C(w; q) = (q; q)_∞/((wq; q)_∞(w⁻¹q; q)_∞)` on the unit disc. -/
def crankFunction (w q : ℂ) : ℂ :=
  ∏' j : ℕ, (1 - q ^ (j + 1)) / ((1 - w * q ^ (j + 1)) * (1 - w⁻¹ * q ^ (j + 1)))

/-- Folsom–Ono–Rhoades Theorem 1.2. -/
theorem rank_sub_crank_hasRadialLimit {a b h k h' : ℕ} (hab : a < b) (ha : 1 ≤ a)
    (hhk : h < k) (hh : 1 ≤ h) (hcab : Nat.Coprime a b) (hchk : Nat.Coprime h k) (hbk : b ∣ k)
    (hh' : (h * h' + 1) % k = 0) :
    HasRadialLimit (fun τ => rankFunction (Complex.exp (2 * π * Complex.I * a / b))
        (Complex.exp (2 * π * Complex.I * τ)) -
      Complex.exp (-(2 * π * Complex.I * (a ^ 2 * h' * k : ℕ) / (b ^ 2 : ℕ))) *
        crankFunction (Complex.exp (2 * π * Complex.I * a / b))
          (Complex.exp (2 * π * Complex.I * τ))) ((h : ℚ) / k)
      (-(1 - Complex.exp (2 * π * Complex.I * a / b)) *
        (1 - (Complex.exp (2 * π * Complex.I * a / b))⁻¹) * unimodalValue a b h k) := sorry

/-- Folsom–Ono–Rhoades Theorem 1.1 (Ramanujan's claim for `f(q) = R(−1; q)` and
`b(q) = C(−1; q)`). -/
theorem ramanujan_radial_limit_claim {h k' : ℕ} (hk' : 0 < k') (hh : Nat.Coprime h (2 * k')) :
    HasRadialLimit (fun τ => rankFunction (-1) (Complex.exp (2 * π * Complex.I * τ)) -
        (-1) ^ k' * crankFunction (-1) (Complex.exp (2 * π * Complex.I * τ)))
      ((h : ℚ) / (2 * k'))
      (-4 * ∑ n ∈ range k', rootPochhammer (-Complex.exp (2 * π * Complex.I * h / (2 * k')))
        (Complex.exp (2 * π * Complex.I * h / (2 * k'))) n ^ 2 *
          Complex.exp (2 * π * Complex.I * h / (2 * k')) ^ (n + 1)) := sorry

/-! ### Traces of singular moduli (Zagier) -/

/-- Local stand-in for the normalised modular invariant `j = E₄³/Δ` (Tau Ceti ModularForms layer 0,
module `ModularForms.LevelOne.JInputs`, which owns it). -/
def jInvariantLocal (τ : UpperHalfPlane) : ℂ := ModularForm.E₄ τ ^ 3 / ModularForm.discriminant τ

/-- `j` as a function on `ℂ` (junk off `ℍ`). -/
def jInvariantC (τ : ℂ) : ℂ := jInvariantLocal (UpperHalfPlane.ofComplex τ)

/-- The positive definite forms `[a, b, c]` with `b² − 4ac = −d`. -/
def heegnerForms (d : ℕ) : Set (ℤ × ℤ × ℤ) :=
  {Q | 0 < Q.1 ∧ Q.2.1 ^ 2 - 4 * Q.1 * Q.2.2 = -(d : ℤ)}

/-- The CM point `α_Q = (−b + i√d)/(2a)`. -/
def cmPoint (Q : ℤ × ℤ × ℤ) (d : ℕ) : ℂ :=
  (-(Q.2.1 : ℂ) + Complex.I * Real.sqrt d) / (2 * Q.1)

/-- The reduced forms of discriminant `−d` (`|b| ≤ a ≤ c`, `b ≥ 0` if `|b| = a` or `a = c`), a set
of representatives of `Q_d/PSL(2, ℤ)`. -/
def heegnerClasses (d : ℕ) : Finset (ℤ × ℤ × ℤ) :=
  ((Finset.Icc (1 : ℤ) d) ×ˢ (Finset.Icc (-(d : ℤ)) d) ×ˢ (Finset.Icc (1 : ℤ) d)).filter fun Q =>
    Q.2.1 ^ 2 - 4 * Q.1 * Q.2.2 = -(d : ℤ) ∧ |Q.2.1| ≤ Q.1 ∧ Q.1 ≤ Q.2.2 ∧
      ((|Q.2.1| = Q.1 ∨ Q.1 = Q.2.2) → 0 ≤ Q.2.1)

/-- The weight `w_Q = |PSL(2, ℤ)_Q|` of a reduced form: `2` for `[a, 0, a]`, `3` for `[a, a, a]`,
`1` otherwise. -/
def stabiliserOrder (Q : ℤ × ℤ × ℤ) : ℕ :=
  if Q.2.1 = 0 ∧ Q.1 = Q.2.2 then 2 else if Q.1 = Q.2.1 ∧ Q.2.1 = Q.2.2 then 3 else 1

/-- The right action `Q ↦ Q ∘ γ` of `SL(2, ℤ)` on binary quadratic forms. -/
def formAction (γ : SL(2, ℤ)) (Q : ℤ × ℤ × ℤ) : ℤ × ℤ × ℤ :=
  (Q.1 * γ 0 0 ^ 2 + Q.2.1 * γ 0 0 * γ 1 0 + Q.2.2 * γ 1 0 ^ 2,
   2 * Q.1 * γ 0 0 * γ 0 1 + Q.2.1 * (γ 0 0 * γ 1 1 + γ 0 1 * γ 1 0) + 2 * Q.2.2 * γ 1 0 * γ 1 1,
   Q.1 * γ 0 1 ^ 2 + Q.2.1 * γ 0 1 * γ 1 1 + Q.2.2 * γ 1 1 ^ 2)

theorem cmPoint_smul {d : ℕ} {Q : ℤ × ℤ × ℤ} (hQ : Q ∈ heegnerForms d) (γ : SL(2, ℤ)) :
    cmPoint (formAction γ Q) d = moebiusC γ⁻¹ (cmPoint Q d) := sorry

theorem stabiliserOrder_eq {d : ℕ} {Q : ℤ × ℤ × ℤ} (hQ : Q ∈ heegnerClasses d) :
    Nat.card {γ : SL(2, ℤ) // formAction γ Q = Q} = 2 * stabiliserOrder Q := sorry

/-- The left side is the Hurwitz class number `H(d)` of Tau Ceti ModularForms layer 11 (weighted
count of reduced forms); the right side is the orbit–stabiliser weighting. -/
theorem sum_inv_stabiliserOrder (d : ℕ) :
    ∑ Q ∈ heegnerClasses d, (1 : ℚ) / stabiliserOrder Q =
      ∑ Q ∈ heegnerClasses d, (2 : ℚ) / Nat.card {γ : SL(2, ℤ) // formAction γ Q = Q} := sorry

theorem heegnerForms_eq_empty {d : ℕ} (hd : d % 4 = 1 ∨ d % 4 = 2) : heegnerForms d = ∅ := sorry

/-- Unit test `TauCeti.QSeries.heegnerClasses.test_three`: one class of discriminant `−3`, weight `3`. -/
example : heegnerClasses 3 = {(1, 1, 1)} ∧ stabiliserOrder (1, 1, 1) = 3 := sorry

/-- Unit test `TauCeti.QSeries.heegnerClasses.test_twelve`: `H(12) = 4/3`. -/
example : ∑ Q ∈ heegnerClasses 12, (1 : ℚ) / stabiliserOrder Q = 4 / 3 := sorry

/-- Unit test `TauCeti.QSeries.heegnerForms.test_empty`: no forms of discriminant `−5`. -/
example : heegnerForms 5 = ∅ := sorry

/-- Unit test `TauCeti.QSeries.cmPoint.test_four`: the CM point of `[1, 0, 1]` is `i`. -/
example : cmPoint (1, 0, 1) 4 = Complex.I := sorry

/-- The modular trace `t(d) = Σ_{Q∈Q_d/Γ} (j(α_Q) − 744)/w_Q`. -/
def modularTrace (d : ℕ) : ℂ :=
  ∑ Q ∈ heegnerClasses d, (jInvariantC (cmPoint Q d) - 744) / stabiliserOrder Q

/-- The weight-two function `Λ_d = Σ_Q (1/w_Q)·j′/(j − j(α_Q))`. -/
def heegnerLogDeriv (d : ℕ) (τ : ℂ) : ℂ :=
  ∑ Q ∈ heegnerClasses d,
    (1 / (stabiliserOrder Q : ℂ)) * deriv jInvariantC τ / (jInvariantC τ - jInvariantC (cmPoint Q d))

theorem modularTrace_eq_zero {d : ℕ} (hd : d % 4 = 1 ∨ d % 4 = 2) : modularTrace d = 0 := sorry

theorem modularTrace_three : modularTrace 3 = -248 := sorry

theorem modularTrace_four : modularTrace 4 = 492 := sorry

/-- `t(d)` is the `q`-coefficient of `−(2πi)⁻¹Λ_d`, whose constant term is `H(d)`. -/
theorem modularTrace_eq_coeff_logDeriv (d : ℕ) :
    (fun y : ℝ => -(2 * π * Complex.I)⁻¹ * heegnerLogDeriv d (Complex.I * y) -
        (∑ Q ∈ heegnerClasses d, (1 : ℂ) / stabiliserOrder Q) -
          modularTrace d * Real.exp (-(2 * π * y))) =O[atTop]
      fun y : ℝ => Real.exp (-(4 * π * y)) := sorry

/-- Unit test `TauCeti.QSeries.modularTrace.test_three`: `t(3) = −248`. -/
example : modularTrace 3 = -248 := sorry

/-- Unit test `TauCeti.QSeries.modularTrace.test_twelve`: `t(12) = 53008`. -/
example : modularTrace 12 = 53008 := sorry

/-- Unit test `TauCeti.QSeries.modularTrace.test_five`: `t(5) = 0`. -/
example : modularTrace 5 = 0 := sorry

/-- Unit test `TauCeti.QSeries.modularTrace.test_not_trace_of_j`: `t(3) ≠ j(ρ) = 0`. -/
example : modularTrace 3 ≠ jInvariantC ((-1 + Complex.I * Real.sqrt 3) / 2) := sorry

theorem heegnerLogDeriv_slash (d : ℕ) (γ : SL(2, ℤ)) {τ : ℂ} (hτ : 0 < τ.im) :
    heegnerLogDeriv d (moebiusC γ τ) = (((γ 1 0 : ℤ) : ℂ) * τ + γ 1 1) ^ 2 * heegnerLogDeriv d τ :=
  sorry

theorem heegnerLogDeriv_qExpansion (d : ℕ) :
    (fun y : ℝ => -(2 * π * Complex.I)⁻¹ * heegnerLogDeriv d (Complex.I * y) -
        (∑ Q ∈ heegnerClasses d, (1 : ℂ) / stabiliserOrder Q) -
          modularTrace d * Real.exp (-(2 * π * y))) =O[atTop]
      fun y : ℝ => Real.exp (-(4 * π * y)) := sorry

theorem heegnerLogDeriv_residue {d : ℕ} {Q : ℤ × ℤ × ℤ} (hQ : Q ∈ heegnerClasses d) :
    Tendsto (fun τ => (τ - cmPoint Q d) * heegnerLogDeriv d τ) (𝓝[≠] (cmPoint Q d)) (𝓝 1) := sorry

theorem heegnerLogDeriv_unique (d : ℕ) {F G : ℂ → ℂ} (hG : DifferentiableOn ℂ G {τ | 0 < τ.im})
    (hGmod : ∀ γ : SL(2, ℤ), ∀ τ : ℂ, 0 < τ.im →
      G (moebiusC γ τ) = (((γ 1 0 : ℤ) : ℂ) * τ + γ 1 1) ^ 2 * G τ)
    (hGbdd : ∃ C : ℝ, ∀ τ : ℂ, 1 ≤ τ.im → ‖G τ‖ ≤ C)
    (hFG : ∀ τ : ℂ, 0 < τ.im → F τ = heegnerLogDeriv d τ + G τ) :
    ∀ τ : ℂ, 0 < τ.im → F τ = heegnerLogDeriv d τ := sorry

/-- Unit test `TauCeti.QSeries.heegnerLogDeriv.test_three`: `−(2πi)⁻¹Λ₃ = (1/3)E₆/E₄`. -/
example {τ : ℂ} (hτ : 0 < τ.im) (hE : ModularForm.E₄ (UpperHalfPlane.ofComplex τ) ≠ 0) :
    -(2 * π * Complex.I)⁻¹ * heegnerLogDeriv 3 τ =
      (1 / 3) * ModularForm.E₆ (UpperHalfPlane.ofComplex τ) /
        ModularForm.E₄ (UpperHalfPlane.ofComplex τ) := sorry

/-- Unit test `TauCeti.QSeries.heegnerLogDeriv.test_constant_term`: the constant term is `H(d)`. -/
example (d : ℕ) : Tendsto (fun y : ℝ => -(2 * π * Complex.I)⁻¹ * heegnerLogDeriv d (Complex.I * y))
    atTop (𝓝 (∑ Q ∈ heegnerClasses d, (1 : ℂ) / stabiliserOrder Q)) := sorry

/-- Unit test `TauCeti.QSeries.heegnerLogDeriv.test_empty`: `Λ₅ = 0`. -/
example : heegnerLogDeriv 5 = 0 := sorry

/-- Zagier's form `g(τ) = θ₁(τ)E₄(4τ)/η(4τ)⁶`. -/
def zagierTraceForm (τ : ℂ) : ℂ :=
  jacobiTheta₂ (1 / 2) (2 * τ) * ModularForm.E₄ (UpperHalfPlane.ofComplex (4 * τ)) /
    ModularForm.eta (4 * τ) ^ 6

/-- The Fourier coefficient `B(d) = ∫_0^1 g(x + i)e^{−2πid(x+i)}dx`. -/
def zagierTraceCoeff (d : ℤ) : ℂ :=
  ∫ x in (0 : ℝ)..1, zagierTraceForm (x + Complex.I) *
    Complex.exp (-(2 * π * Complex.I * d * (x + Complex.I)))

theorem hasSum_zagierTraceForm {τ : ℂ} (hτ : 0 < τ.im) :
    HasSum (fun d : ℕ => zagierTraceCoeff ((d : ℤ) - 1) *
      Complex.exp (2 * π * Complex.I * (((d : ℤ) - 1 : ℤ) : ℂ) * τ)) (zagierTraceForm τ) := sorry

theorem zagierTraceCoeff_eq_zero {d : ℤ} (hd : d % 4 = 1 ∨ d % 4 = 2) : zagierTraceCoeff d = 0 :=
  sorry

theorem zagierTraceCoeff_neg_one : zagierTraceCoeff (-1) = 1 := sorry

theorem zagierTraceCoeff_zero : zagierTraceCoeff 0 = -2 := sorry

/-- Unit test `TauCeti.QSeries.zagierTraceCoeff.test_three`: `B(3) = 248`. -/
example : zagierTraceCoeff 3 = 248 := sorry

/-- Unit test `TauCeti.QSeries.zagierTraceCoeff.test_four`: `B(4) = −492`. -/
example : zagierTraceCoeff 4 = -492 := sorry

/-- Unit test `TauCeti.QSeries.zagierTraceCoeff.test_plus`: Kohnen's plus condition. -/
example : zagierTraceCoeff 1 = 0 ∧ zagierTraceCoeff 2 = 0 := sorry

/-- Unit test `TauCeti.QSeries.zagierTraceCoeff.test_polar`: `B(−1) = 1`. -/
example : zagierTraceCoeff (-1) = 1 := sorry

/-- Zagier §2: the two recursions satisfied by the coefficients of `g`. -/
theorem zagierTraceCoeff_recursions (n : ℕ) :
    ∑ r ∈ Finset.Icc (-(Nat.sqrt (4 * n + 1) : ℤ)) (Nat.sqrt (4 * n + 1)),
        zagierTraceCoeff (4 * n - r ^ 2) = 0 ∧
      ∑ r ∈ Finset.Icc (1 : ℤ) (Nat.sqrt (4 * n + 1)), (r : ℂ) ^ 2 * zagierTraceCoeff (4 * n - r ^ 2) =
        if n = 0 then 1 else 240 * (ArithmeticFunction.sigma 3 n : ℂ) := sorry

/-- The diagonal of the modular polynomial, `Φ_n(j(τ), j(τ)) = ∏_{ad=n, 0≤b<d}(j(τ) − j((aτ+b)/d))`. -/
def modularDiagonalLocal (n : ℕ) (τ : ℂ) : ℂ :=
  ∏ a ∈ n.divisors, ∏ b ∈ range (n / a),
    (jInvariantC τ - jInvariantC ((a * τ + b) / ((n / a : ℕ) : ℂ)))

/-- Zagier (9) in logarithmic-derivative form (`n` not a square). -/
theorem modularDiagonal_logDeriv {n : ℕ} (hn : ¬ IsSquare n) {τ : ℂ} (hτ : 0 < τ.im)
    (hτ' : modularDiagonalLocal n τ ≠ 0) :
    logDeriv (modularDiagonalLocal n) τ =
      ∑ r ∈ Finset.Icc (-(Nat.sqrt (4 * n - 1) : ℤ)) (Nat.sqrt (4 * n - 1)),
        heegnerLogDeriv (4 * n - r ^ 2).toNat τ := sorry

/-- Zagier (5) and the Kronecker–Hurwitz class number relation (7). -/
theorem modularTrace_first_recursion {n : ℕ} (hn : 1 ≤ n) :
    (∑ r ∈ Finset.Icc (-(Nat.sqrt (4 * n - 1) : ℤ)) (Nat.sqrt (4 * n - 1)),
        modularTrace (4 * n - r ^ 2).toNat =
      if IsSquare n then -4 else if IsSquare (4 * n + 1) then 2 else 0) ∧
    ∑ r ∈ Finset.Icc (-(Nat.sqrt (4 * n - 1) : ℤ)) (Nat.sqrt (4 * n - 1)),
        ∑ Q ∈ heegnerClasses (4 * n - r ^ 2).toNat, (1 : ℚ) / stabiliserOrder Q =
      ∑ e ∈ n.divisors, (max e (n / e) : ℚ) + if IsSquare n then 1 / 6 else 0 := sorry

/-- Zagier's Proposition (12) (`n` not a square). -/
theorem weight_two_trace_identity {n : ℕ} (hn : ¬ IsSquare n) {τ : ℂ} (hτ : 0 < τ.im)
    (hτ' : modularDiagonalLocal n τ ≠ 0) :
    ModularForm.E₄ (UpperHalfPlane.ofComplex τ) * ModularForm.E₆ (UpperHalfPlane.ofComplex τ) /
        ModularForm.discriminant (UpperHalfPlane.ofComplex τ) *
      ∑ a ∈ n.divisors, ∑ b ∈ range (n / a),
        (n : ℂ) ^ 3 * ((n / a : ℕ) : ℂ) ^ (-4 : ℤ) *
          ModularForm.E₄ (UpperHalfPlane.ofComplex ((a * τ + b) / ((n / a : ℕ) : ℂ))) /
            (jInvariantC τ - jInvariantC ((a * τ + b) / ((n / a : ℕ) : ℂ))) =
      (4 * π * Complex.I)⁻¹ *
        ∑ r ∈ Finset.Icc (-(Nat.sqrt (4 * n - 1) : ℤ)) (Nat.sqrt (4 * n - 1)),
          ((r : ℂ) ^ 2 - n) * heegnerLogDeriv (4 * n - r ^ 2).toNat τ := sorry

/-- Zagier (6). -/
theorem modularTrace_second_recursion {n : ℕ} (hn : 1 ≤ n) :
    ∑ r ∈ Finset.Icc (1 : ℤ) (Nat.sqrt (4 * n - 1)), (r : ℂ) ^ 2 * modularTrace (4 * n - r ^ 2).toNat =
      -240 * (ArithmeticFunction.sigma 3 n : ℂ) +
        if IsSquare n then -8 * (n : ℂ) else if IsSquare (4 * n + 1) then 4 * (n : ℂ) + 1 else 0 :=
  sorry

/-- Zagier's Theorem 1: `t(d) = −B(d)` for all `d > 0`. -/
theorem modularTrace_eq_neg_zagierTraceCoeff {d : ℕ} (hd : 0 < d) :
    modularTrace d = -zagierTraceCoeff d := sorry

end QM5

end TauCeti.QSeries
end

end QM5File


-- ===== QM.6 =====

section QM6File

/-
Suggested Lean for stage QM.6 (moonshine) of the roadmap
`QSeriesPartitionsAndMockModularForms`.

This file is not the roadmap and is not exhaustive: the roadmap document is definitive. The
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`; conditions that cannot yet be stated are left out.

Tau Ceti declarations are not imported (Tau Ceti is not built locally). Where the roadmap uses
`TauCeti.IntegralLattice` (with `IsEven`, `IsUnimodular`), `TauCeti.IntegralLattice.ofGramMatrix`
and `TauCeti.SporadicName.Group SporadicName.M`, this file uses a local stand-in (a free ℤ-module
with an even symmetric bilinear form, the Gram matrix of `II_{1,1}`, and the `Y₄₄₃` Coxeter
presentation of the Monster); the comments name the Tau Ceti declarations to use instead.
-/

open scoped TensorProduct MatrixGroups

namespace TauCeti.QSeries

section QM6

/-! ## QM.6a Vertex algebras -/

/-- A vertex algebra over a commutative ring (Borcherds' axioms), built on Mathlib's
`VertexOperator`: `Y u = Σ u_n z^{-n-1}` with `u_n = VertexOperator.ncoeff (Y u) n`. Truncation is
automatic because vertex operators take values in Laurent series. -/
structure VertexAlgebra (R : Type*) [CommRing R] (V : Type*) [AddCommGroup V] [Module R V] where
  /-- The state–field correspondence. -/
  Y : V →ₗ[R] VertexOperator R V
  /-- The vacuum vector. -/
  vac : V
  creation_pos : ∀ (u : V) (n : ℤ), 0 ≤ n → VertexOperator.ncoeff (Y u) n vac = 0
  creation_neg_one : ∀ u : V, VertexOperator.ncoeff (Y u) (-1) vac = u
  borcherds : ∀ (u v w : V) (m n q : ℤ),
    (∑ᶠ i : ℕ, Ring.choose m i •
        VertexOperator.ncoeff (Y (VertexOperator.ncoeff (Y u) (q + i) v)) (m + n - i) w) =
      ∑ᶠ i : ℕ, ((-1 : ℤ) ^ i * Ring.choose q i) •
        (VertexOperator.ncoeff (Y u) (m + q - i) (VertexOperator.ncoeff (Y v) (n + i) w) -
          (q.negOnePow : ℤ) •
            VertexOperator.ncoeff (Y v) (n + q - i) (VertexOperator.ncoeff (Y u) (m + i) w))

namespace VertexAlgebra

variable {R : Type*} [CommRing R] {V : Type*} [AddCommGroup V] [Module R V]

/-- The `n`-th product `u_n`. -/
def nprod (A : VertexAlgebra R V) (u : V) (n : ℤ) : Module.End R V :=
  VertexOperator.ncoeff (A.Y u) n

/-- Truncation. -/
theorem nprod_eq_zero_of_le (A : VertexAlgebra R V) (u v : V) :
    ∃ N : ℤ, ∀ n ≥ N, A.nprod u n v = 0 := sorry

@[simp] theorem nprod_vac_of_nonneg (A : VertexAlgebra R V) (u : V) {n : ℤ} (hn : 0 ≤ n) :
    A.nprod u n A.vac = 0 := A.creation_pos u n hn

@[simp] theorem nprod_vac_neg_one (A : VertexAlgebra R V) (u : V) :
    A.nprod u (-1) A.vac = u := A.creation_neg_one u

theorem borcherds_identity (A : VertexAlgebra R V) (u v w : V) (m n q : ℤ) :
    (∑ᶠ i : ℕ, Ring.choose m i • A.nprod (A.nprod u (q + i) v) (m + n - i) w) =
      ∑ᶠ i : ℕ, ((-1 : ℤ) ^ i * Ring.choose q i) •
        (A.nprod u (m + q - i) (A.nprod v (n + i) w) -
          (q.negOnePow : ℤ) • A.nprod v (n + q - i) (A.nprod u (m + i) w)) :=
  A.borcherds u v w m n q

theorem ext {A B : VertexAlgebra R V} (hY : A.Y = B.Y) (hvac : A.vac = B.vac) : A = B := by
  cases A; cases B; cases hY; cases hvac; rfl

/-- The vertex algebra of a commutative `ℚ`-algebra with a derivation:
`u_n v = (∂^{-n-1} u / (-n-1)!) v` for `n ≤ -1` and `0` for `n ≥ 0`. -/
noncomputable def ofDerivation {A : Type*} [CommRing A] [Algebra ℚ A] (d : Derivation ℚ A A) :
    VertexAlgebra ℚ A := sorry

/-- The translation operator `D v = v_{-2} 1`. -/
def translation (A : VertexAlgebra R V) : Module.End R V where
  toFun v := A.nprod v (-2) A.vac
  map_add' := sorry
  map_smul' := sorry

/-- The divided powers `D^{(k)} v = v_{-k-1} 1`. -/
def divPow (A : VertexAlgebra R V) (k : ℕ) : Module.End R V where
  toFun v := A.nprod v (-(k : ℤ) - 1) A.vac
  map_add' := sorry
  map_smul' := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.ofDerivation_polynomial_nprod`: in the vertex algebra of
`(ℚ[X], d/dX)`, `X_{-2} 1 = 1`, `X_{-1} X = X²` and `X_n X = 0` for `n ≥ 0`. -/
example :
    (ofDerivation (Polynomial.derivative' (R := ℚ))).nprod Polynomial.X (-2) 1 = 1 ∧
    (ofDerivation (Polynomial.derivative' (R := ℚ))).nprod Polynomial.X (-1) Polynomial.X =
      Polynomial.X ^ 2 ∧
    ∀ n : ℤ, 0 ≤ n →
      (ofDerivation (Polynomial.derivative' (R := ℚ))).nprod Polynomial.X n Polynomial.X = 0 :=
  sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.subsingleton_of_zero_module`: the zero module carries
exactly one vertex algebra structure. -/
example : Subsingleton (VertexAlgebra ℚ PUnit) := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.not_matrix_ring_vertexAlgebra`: the rule
`u_n v = δ_{n,-1} u v` on the non-commutative ring `M₂(ℚ)` is not a vertex algebra. -/
example : ¬ ∃ A : VertexAlgebra ℚ (Matrix (Fin 2) (Fin 2) ℚ), A.vac = 1 ∧
    ∀ (u v : Matrix (Fin 2) (Fin 2) ℚ) (n : ℤ), A.nprod u n v = if n = -1 then u * v else 0 :=
  sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.ofDerivation_nprod_nonneg`: in `ofDerivation d` all
products `u_n v` with `n ≥ 0` vanish and `u_{-1} v = u v`. -/
example {A : Type*} [CommRing A] [Algebra ℚ A] (d : Derivation ℚ A A) (u v : A) :
    (∀ n : ℤ, 0 ≤ n → (ofDerivation d).nprod u n v = 0) ∧ (ofDerivation d).nprod u (-1) v = u * v :=
  sorry

/-- Node `vertex-algebra-vacuum-translation`. -/
theorem vacuum_translation (A : VertexAlgebra R V) :
    (∀ (v : V) (n : ℤ), A.nprod A.vac n v = if n = -1 then v else 0) ∧
    A.translation A.vac = 0 ∧
    (∀ (v : V) (n : ℤ), A.nprod (A.translation v) n = -(n : R) • A.nprod v (n - 1)) ∧
    (∀ (v w : V) (n : ℤ), A.translation (A.nprod v n w) =
      A.nprod (A.translation v) n w + A.nprod v n (A.translation w)) ∧
    (∀ (k : ℕ) (v : V), ((k : R) + 1) • A.divPow (k + 1) v = A.translation (A.divPow k v)) :=
  sorry

/-- Node `vertex-algebra-commutator-formula`: the commutator formula. -/
theorem commutator_formula (A : VertexAlgebra R V) (u v : V) (m n : ℤ) :
    A.nprod u m ∘ₗ A.nprod v n - A.nprod v n ∘ₗ A.nprod u m =
      ∑ᶠ i : ℕ, Ring.choose m i • A.nprod (A.nprod u i v) (m + n - i) := sorry

/-- Node `vertex-algebra-commutator-formula`: the associativity formula. -/
theorem associativity_formula (A : VertexAlgebra R V) (u v : V) (q n : ℤ) :
    A.nprod (A.nprod u q v) n =
      ∑ᶠ i : ℕ, ((-1 : ℤ) ^ i * Ring.choose q i) •
        (A.nprod u (q - i) ∘ₗ A.nprod v (n + i) -
          (q.negOnePow : ℤ) • (A.nprod v (n + q - i) ∘ₗ A.nprod u i)) := sorry

/-- Node `vertex-algebra-skew-symmetry`. -/
theorem skew_symmetry (A : VertexAlgebra R V) (u v : V) (n : ℤ) :
    A.nprod v n u = ∑ᶠ i : ℕ, ((n + i + 1).negOnePow : ℤ) • A.divPow i (A.nprod u (n + i) v) :=
  sorry

/-! ### The Lie algebra `V/DV` -/

/-- `DV = Σ_{i ≥ 1} D^{(i)}(V)`. -/
def translationSpan (A : VertexAlgebra R V) : Submodule R V :=
  Submodule.span R {x | ∃ (i : ℕ) (w : V), 1 ≤ i ∧ x = A.divPow i w}

/-- The Lie algebra `V ⧸ DV` with bracket `[u, v] = u_0 v`. -/
def LieQuotient (A : VertexAlgebra R V) : Type _ := V ⧸ A.translationSpan

instance (A : VertexAlgebra R V) : LieRing A.LieQuotient := sorry
instance (A : VertexAlgebra R V) : LieAlgebra R A.LieQuotient := sorry

/-- The quotient map `V → V ⧸ DV`. -/
def LieQuotient.mk (A : VertexAlgebra R V) : V →ₗ[R] A.LieQuotient := sorry

@[simp] theorem LieQuotient.bracket_mk (A : VertexAlgebra R V) (u v : V) :
    ⁅LieQuotient.mk A u, LieQuotient.mk A v⁆ = LieQuotient.mk A (A.nprod u 0 v) := sorry

@[simp] theorem zeroMode_translation (A : VertexAlgebra R V) (i : ℕ) (hi : 1 ≤ i) (w : V) :
    A.nprod (A.divPow i w) 0 = 0 := sorry

instance lieRingModuleQuotient (A : VertexAlgebra R V) : LieRingModule A.LieQuotient V := sorry
instance lieModuleQuotient (A : VertexAlgebra R V) : LieModule R A.LieQuotient V := sorry

theorem zeroMode_derivation (A : VertexAlgebra R V) (u v w : V) (n : ℤ) :
    A.nprod u 0 (A.nprod v n w) = A.nprod (A.nprod u 0 v) n w + A.nprod v n (A.nprod u 0 w) :=
  sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.LieQuotient.ofDerivation_abelian`: for
`ofDerivation d` the Lie algebra `V/DV` is abelian. -/
example {A : Type*} [CommRing A] [Algebra ℚ A] (d : Derivation ℚ A A)
    (x y : (ofDerivation d).LieQuotient) : ⁅x, y⁆ = 0 := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.LieQuotient.bracket_self`: `⁅mk u, mk u⁆ = 0`. -/
example (A : VertexAlgebra R V) (u : V) : ⁅LieQuotient.mk A u, LieQuotient.mk A u⁆ = 0 :=
  lie_self _

/-- Unit test `TauCeti.QSeries.VertexAlgebra.zeroMode_vacuum`: `1_0 = 0` and `u_0 1 = 0`. -/
example (A : VertexAlgebra R V) : A.nprod A.vac 0 = 0 ∧ ∀ u : V, A.nprod u 0 A.vac = 0 := sorry

/-! ### Homomorphisms and automorphisms -/

/-- Homomorphisms of vertex algebras. -/
structure Hom {W : Type*} [AddCommGroup W] [Module R W] (A : VertexAlgebra R V)
    (B : VertexAlgebra R W) extends V →ₗ[R] W where
  map_vac' : toFun A.vac = B.vac
  map_nprod' : ∀ (u v : V) (n : ℤ), toFun (A.nprod u n v) = B.nprod (toFun u) n (toFun v)

@[simp] theorem Hom.map_nprod {W : Type*} [AddCommGroup W] [Module R W] {A : VertexAlgebra R V}
    {B : VertexAlgebra R W} (f : A.Hom B) (u v : V) (n : ℤ) :
    f.toLinearMap (A.nprod u n v) = B.nprod (f.toLinearMap u) n (f.toLinearMap v) :=
  f.map_nprod' u v n

/-- The automorphism group of a vertex algebra. -/
def Aut (A : VertexAlgebra R V) : Type _ :=
  {f : V ≃ₗ[R] V // f A.vac = A.vac ∧ ∀ (u v : V) (n : ℤ), f (A.nprod u n v) = A.nprod (f u) n (f v)}

instance (A : VertexAlgebra R V) : Group A.Aut := sorry

instance (A : VertexAlgebra R V) : CoeFun A.Aut (fun _ ↦ V → V) := ⟨fun g ↦ g.1⟩

theorem Aut.commute_translation (A : VertexAlgebra R V) (g : A.Aut) (v : V) :
    g (A.translation v) = A.translation (g v) := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.Aut.one_apply`: the identity automorphism acts as the
identity. -/
example (A : VertexAlgebra R V) (v : V) : (1 : A.Aut) v = v := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.Aut.of_zero_module`: the automorphism group of the zero
vertex algebra is trivial. -/
example (A : VertexAlgebra ℚ PUnit) : Subsingleton A.Aut := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.Aut.neg_not_hom`: on a nonzero vertex algebra `v ↦ -v`
is not an automorphism. -/
example {W : Type*} [AddCommGroup W] [Module ℚ W] (A : VertexAlgebra ℚ W) (h : A.vac ≠ 0) :
    ¬ ∃ g : A.Aut, ∀ v, g v = -v := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.Aut.ofDerivation_algEquiv`: an algebra automorphism
commuting with the derivation is a vertex algebra automorphism. -/
example {A : Type*} [CommRing A] [Algebra ℚ A] (d : Derivation ℚ A A) (σ : A ≃ₐ[ℚ] A)
    (hσ : ∀ a, σ (d a) = d (σ a)) : ∃ g : (ofDerivation d).Aut, ∀ a, g a = σ a := sorry

end VertexAlgebra

/-! ### The existence theorem and tensor products -/

/-- Mutual locality of two fields: `(y - z)^N [A(y), B(z)] = 0`, written on modes. -/
def IsMutuallyLocal {k V : Type*} [Field k] [AddCommGroup V] [Module k V]
    (A B : VertexOperator k V) : Prop :=
  ∃ N : ℕ, ∀ m n : ℤ, ∑ i ∈ Finset.range (N + 1),
    ((-1 : ℤ) ^ i * (N.choose i : ℤ)) •
      (VertexOperator.ncoeff A (m + N - i) ∘ₗ VertexOperator.ncoeff B (n + i) -
        VertexOperator.ncoeff B (n + i) ∘ₗ VertexOperator.ncoeff A (m + N - i)) = 0

namespace VertexAlgebra

variable {k : Type*} [Field k] [CharZero k] {V W : Type*} [AddCommGroup V] [Module k V]
  [AddCommGroup W] [Module k W]

/-- Node `vertex-algebra-existence-theorem` (Matsuo–Nagatomo, Theorem 5.4.1). -/
theorem existence_theorem (vac : V) (T : Module.End k V) (S : Set (VertexOperator k V))
    (hvac : vac ≠ 0) (hT : T vac = 0)
    (hloc : ∀ A ∈ S, ∀ B ∈ S, IsMutuallyLocal A B)
    (hcre : ∀ A ∈ S, ∀ n : ℤ, 0 ≤ n → VertexOperator.ncoeff A n vac = 0)
    (hcov : ∀ A ∈ S, ∀ n : ℤ, T ∘ₗ VertexOperator.ncoeff A n - VertexOperator.ncoeff A n ∘ₗ T =
      -(n : k) • VertexOperator.ncoeff A (n - 1))
    (hgen : ∀ U : Submodule k V, vac ∈ U →
      (∀ A ∈ S, ∀ n : ℤ, ∀ u ∈ U, VertexOperator.ncoeff A n u ∈ U) → U = ⊤) :
    ∃! Va : VertexAlgebra k V, Va.vac = vac ∧
      ∀ A ∈ S, Va.Y (VertexOperator.ncoeff A (-1) vac) = A := sorry

/-- The one-dimensional vertex algebra `k` (`1_{-1} = id`). -/
noncomputable def unit (k : Type*) [Field k] : VertexAlgebra k k := sorry

/-- The tensor product of vertex algebras. -/
noncomputable def tensorProduct (A : VertexAlgebra k V) (B : VertexAlgebra k W) :
    VertexAlgebra k (V ⊗[k] W) := sorry

@[simp] theorem tensorProduct_nprod_tmul (A : VertexAlgebra k V) (B : VertexAlgebra k W)
    (a c : V) (b d : W) (n : ℤ) :
    (A.tensorProduct B).nprod (a ⊗ₜ b) n (c ⊗ₜ d) =
      ∑ᶠ i : ℤ, A.nprod a i c ⊗ₜ B.nprod b (n - 1 - i) d := sorry

/-- `a ↦ a ⊗ 1`. -/
noncomputable def tensorProduct.inl (A : VertexAlgebra k V) (B : VertexAlgebra k W) :
    A.Hom (A.tensorProduct B) := sorry

/-- `b ↦ 1 ⊗ b`. -/
noncomputable def tensorProduct.inr (A : VertexAlgebra k V) (B : VertexAlgebra k W) :
    B.Hom (A.tensorProduct B) := sorry

/-- Functoriality of the tensor product. -/
noncomputable def tensorProduct.map {V' W' : Type*} [AddCommGroup V'] [Module k V']
    [AddCommGroup W'] [Module k W'] {A : VertexAlgebra k V} {A' : VertexAlgebra k V'}
    {B : VertexAlgebra k W} {B' : VertexAlgebra k W'} (f : A.Hom A') (g : B.Hom B') :
    (A.tensorProduct B).Hom (A'.tensorProduct B') := sorry

@[simp] theorem tensorProduct_translation (A : VertexAlgebra k V) (B : VertexAlgebra k W) :
    (A.tensorProduct B).translation =
      TensorProduct.map A.translation LinearMap.id + TensorProduct.map LinearMap.id B.translation :=
  sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.tensorProduct_vac_nprod`: the vacuum is `1 ⊗ 1` and
`(a ⊗ 1)_{-1}(1 ⊗ b) = a ⊗ b`. -/
example (A : VertexAlgebra k V) (B : VertexAlgebra k W) (a : V) (b : W) :
    (A.tensorProduct B).vac = A.vac ⊗ₜ B.vac ∧
      (A.tensorProduct B).nprod (a ⊗ₜ B.vac) (-1) (A.vac ⊗ₜ b) = a ⊗ₜ b := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.tensorProduct_unit`: `V ⊗ k ≃ V`. -/
example (A : VertexAlgebra k V) :
    ∃ f : (A.tensorProduct (unit k)).Hom A, Function.Bijective f.toLinearMap := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.tensorProduct_inl_inr_commute`: the two factors commute. -/
example (A : VertexAlgebra k V) (B : VertexAlgebra k W) (a : V) (b : W) (m n : ℤ) :
    (A.tensorProduct B).nprod (a ⊗ₜ B.vac) m ∘ₗ (A.tensorProduct B).nprod (A.vac ⊗ₜ b) n =
      (A.tensorProduct B).nprod (A.vac ⊗ₜ b) n ∘ₗ (A.tensorProduct B).nprod (a ⊗ₜ B.vac) m :=
  sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.tensorProduct_not_shifted`: the index-shifted rule
violates the creation axiom. -/
example (A : VertexAlgebra k V) (B : VertexAlgebra k W) (h : A.vac ⊗ₜ B.vac ≠ (0 : V ⊗[k] W)) :
    ¬ ∃ C : VertexAlgebra k (V ⊗[k] W), C.vac = A.vac ⊗ₜ B.vac ∧
      ∀ (a c : V) (b d : W) (n : ℤ),
        C.nprod (a ⊗ₜ b) n (c ⊗ₜ d) = ∑ᶠ i : ℤ, A.nprod a i c ⊗ₜ B.nprod b (n - i) d := sorry

end VertexAlgebra

/-! ### The Virasoro algebra -/

/-- The Virasoro algebra over a field of characteristic zero, basis `L n` (`n : ℤ`) and `C`. -/
def Virasoro (k : Type*) [Field k] : Type _ := (ℤ ⊕ Unit) →₀ k

namespace Virasoro

variable (k : Type*) [Field k] [CharZero k]

instance : LieRing (Virasoro k) := sorry
instance : LieAlgebra k (Virasoro k) := sorry

/-- The basis element `L n`. -/
noncomputable def L (n : ℤ) : Virasoro k := sorry
/-- The central element `C`. -/
noncomputable def C : Virasoro k := sorry

@[simp] theorem lie_L_L (m n : ℤ) :
    ⁅L k m, L k n⁆ = ((m - n : ℤ) : k) • L k (m + n) +
      (if m + n = 0 then ((m ^ 3 - m : ℤ) : k) / 12 else 0) • C k := sorry

@[simp] theorem lie_C (x : Virasoro k) : ⁅C k, x⁆ = 0 := sorry

/-- The basis indexed by `ℤ ⊕ Unit`. -/
noncomputable def basis : Module.Basis (ℤ ⊕ Unit) k (Virasoro k) := sorry

theorem isSl2Triple : IsSl2Triple (2 • L k 0) (L k (-1)) (-L k 1) := sorry

/-- A Lie module over `Vir` has central charge `c` when `C` acts as `c`. -/
def HasCentralCharge (M : Type*) [AddCommGroup M] [Module k M] [LieRingModule (Virasoro k) M]
    (c : k) : Prop :=
  ∀ m : M, ⁅C k, m⁆ = c • m

/-- Unit test `TauCeti.QSeries.Virasoro.lie_L_two_L_neg_two`: `[L₂, L₋₂] = 4L₀ + C/2`. -/
example : ⁅L k 2, L k (-2)⁆ = (4 : k) • L k 0 + (1 / 2 : k) • C k := sorry

/-- Unit test `TauCeti.QSeries.Virasoro.lie_L_one_L_neg_one`: `[L₁, L₋₁] = 2L₀`. -/
example : ⁅L k 1, L k (-1)⁆ = (2 : k) • L k 0 := sorry

/-- Unit test `TauCeti.QSeries.Virasoro.trivial_hasCentralCharge_zero`: a trivial module has central
charge `0`. -/
example (M : Type*) [AddCommGroup M] [Module k M] [LieRingModule (Virasoro k) M]
    [LieModule.IsTrivial (Virasoro k) M] : HasCentralCharge k M 0 := sorry

/-- Unit test `TauCeti.QSeries.Virasoro.C_mem_derivedSeries`: `C` is a sum of brackets. -/
example : C k = ⁅(2 : k) • L k 2, L k (-2)⁆ + ⁅(-4 : k) • L k 1, L k (-1)⁆ := sorry

end Virasoro

/-! ### Conformal vectors and vertex operator algebras -/

/-- A conformal vector of central charge `c` (Borcherds). -/
structure ConformalVector {k V : Type*} [Field k] [CharZero k] [AddCommGroup V] [Module k V]
    (A : VertexAlgebra k V) where
  /-- The conformal vector. -/
  ω : V
  /-- The central charge. -/
  c : k
  zero_mode : ∀ v, A.nprod ω 0 v = A.translation v
  one_mode : A.nprod ω 1 ω = (2 : k) • ω
  two_mode : A.nprod ω 2 ω = 0
  three_mode : A.nprod ω 3 ω = (c / 2) • A.vac
  high_mode : ∀ i : ℤ, 4 ≤ i → A.nprod ω i ω = 0
  isInternal : DirectSum.IsInternal (fun n : ℤ ↦ Module.End.eigenspace (A.nprod ω 1) (n : k))

namespace ConformalVector

variable {k V : Type*} [Field k] [CharZero k] [AddCommGroup V] [Module k V]
  {A : VertexAlgebra k V} (ω : ConformalVector A)

/-- `L n = ω_{n+1}`. -/
def L (n : ℤ) : Module.End k V := A.nprod ω.ω (n + 1)

@[simp] theorem L_neg_one : ω.L (-1) = A.translation := sorry

/-- The weight space `V_n = ker (L₀ - n)`. -/
def weightSpace (n : ℤ) : Submodule k V := Module.End.eigenspace (ω.L 0) (n : k)

theorem isInternal_weightSpace : DirectSum.IsInternal ω.weightSpace := sorry

theorem nprod_mem_weightSpace {a b : ℤ} {u v : V} (hu : u ∈ ω.weightSpace a)
    (hv : v ∈ ω.weightSpace b) (n : ℤ) : A.nprod u n v ∈ ω.weightSpace (a + b - n - 1) := sorry

@[simp] theorem vac_mem_weightSpace_zero : A.vac ∈ ω.weightSpace 0 ∧ ω.ω ∈ ω.weightSpace 2 :=
  sorry

/-- The central charge. -/
def centralCharge : k := ω.c

/-- Node `conformal-vector-virasoro-representation` (a), (b): Virasoro relations. -/
theorem virasoro_relations (m n : ℤ) :
    ω.L m ∘ₗ ω.L n - ω.L n ∘ₗ ω.L m =
      ((m - n : ℤ) : k) • ω.L (m + n) +
        (if m + n = 0 then (ω.c * ((m ^ 3 - m : ℤ) : k) / 12) • (1 : Module.End k V) else 0) :=
  sorry

/-- Node `conformal-vector-virasoro-representation` (c): commutator with a primary vector. -/
theorem commutator_primary (v : V) (h : ℤ) (hv : ω.L 0 v = (h : k) • v)
    (hprim : ∀ n : ℤ, 1 ≤ n → ω.L n v = 0) (m n : ℤ) :
    ω.L m ∘ₗ A.nprod v n - A.nprod v n ∘ₗ ω.L m = (((m + 1) * (h - 1) - n : ℤ) : k) • A.nprod v (m + n) :=
  sorry

/-- Unit test `TauCeti.QSeries.ConformalVector.ofDerivation_zero`: for the zero derivation, `ω = 0`
is a conformal vector of central charge `0`. -/
example {B : Type*} [CommRing B] [Algebra ℚ B] :
    ∃ ω : ConformalVector (VertexAlgebra.ofDerivation (0 : Derivation ℚ B B)), ω.ω = 0 ∧ ω.c = 0 :=
  sorry

/-- Unit test `TauCeti.QSeries.ConformalVector.weight_omega`: `ω ∈ V₂`, `L₀ 1 = 0`, `L₋₁ ω = Dω`. -/
example : ω.ω ∈ ω.weightSpace 2 ∧ ω.L 0 A.vac = 0 ∧ ω.L (-1) ω.ω = A.translation ω.ω := sorry

end ConformalVector

namespace VertexAlgebra

variable {k V : Type*} [Field k] [CharZero k] [AddCommGroup V] [Module k V]
  {A : VertexAlgebra k V}

/-- The conformal automorphisms (those fixing `ω`). -/
def Aut.conformal (ω : ConformalVector A) : Subgroup A.Aut := sorry

theorem Aut.mapsTo_weightSpace (ω : ConformalVector A) (g : A.Aut) (hg : g ∈ Aut.conformal ω)
    (n : ℤ) {w : V} (hw : w ∈ ω.weightSpace n) : g w ∈ ω.weightSpace n := sorry

/-- Invariant (compatible) bilinear forms, for an involution `θ`. -/
def IsInvariantForm (ω : ConformalVector A) (θ : A.Aut) (B : LinearMap.BilinForm k V) : Prop :=
  B.IsSymm ∧ ∀ (i : ℤ) (u : V), u ∈ ω.weightSpace i → ∀ (n : ℤ) (v w : V),
    B (A.nprod u n v) w = ((i.negOnePow : ℤ) : k) *
      ∑ᶠ j : ℕ, ((j.factorial : k))⁻¹ * B v (A.nprod ((ω.L 1 ^ j) (θ u)) (2 * i - j - n - 2) w)

theorem IsInvariantForm.adjoint_L {ω : ConformalVector A} {θ : A.Aut}
    {B : LinearMap.BilinForm k V} (hB : IsInvariantForm ω θ B) (hθ : θ ω.ω = ω.ω) (n : ℤ)
    (v w : V) : B (ω.L n v) w = B v (ω.L (-n) w) := sorry

theorem IsInvariantForm.orthogonal_weightSpace {ω : ConformalVector A} {θ : A.Aut}
    {B : LinearMap.BilinForm k V} (hB : IsInvariantForm ω θ B) (hθ : θ ω.ω = ω.ω) {i j : ℤ}
    (hij : i ≠ j) {v w : V} (hv : v ∈ ω.weightSpace i) (hw : w ∈ ω.weightSpace j) :
    B v w = 0 := sorry

theorem IsInvariantForm.adjoint_zeroMode {ω : ConformalVector A} {θ : A.Aut}
    {B : LinearMap.BilinForm k V} (hB : IsInvariantForm ω θ B) {u : V} (hu0 : ω.L 0 u = u)
    (hu : ∀ n : ℤ, 1 ≤ n → ω.L n u = 0) (v w : V) :
    B (A.nprod u 0 v) w = -B v (A.nprod (θ u) 0 w) := sorry

/-- The contravariant form `(u, v)₀ = -(u, θ v)`. -/
def contravariantForm (θ : A.Aut) (B : LinearMap.BilinForm k V) : LinearMap.BilinForm k V :=
  -(B.compl₂ (θ.1 : V ≃ₗ[k] V).toLinearMap)

theorem IsInvariantForm.comp_aut {ω : ConformalVector A} {θ : A.Aut}
    {B : LinearMap.BilinForm k V} (hB : IsInvariantForm ω θ B) (g : A.Aut)
    (hg : g ∈ Aut.conformal ω) (hgθ : g * θ = θ * g) :
    IsInvariantForm ω θ (B.compl₁₂ (g.1 : V ≃ₗ[k] V).toLinearMap (g.1 : V ≃ₗ[k] V).toLinearMap) :=
  sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.isInvariantForm_zero`: the zero form is invariant. -/
example (ω : ConformalVector A) (θ : A.Aut) : IsInvariantForm ω θ 0 := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.IsInvariantForm.vac_orthogonal`: `(1, v) = 0` for `v` of
nonzero weight. -/
example {ω : ConformalVector A} {θ : A.Aut} {B : LinearMap.BilinForm k V}
    (hB : IsInvariantForm ω θ B) (hθ : θ ω.ω = ω.ω) {i : ℤ} (hi : i ≠ 0) {v : V}
    (hv : v ∈ ω.weightSpace i) : B A.vac v = 0 := sorry

end VertexAlgebra

/-- Vertex operator algebras: conformal vector, finite-dimensional weight spaces, weights bounded
below. -/
structure VertexOperatorAlgebra (k V : Type*) [Field k] [CharZero k] [AddCommGroup V]
    [Module k V] where
  /-- The underlying vertex algebra. -/
  toVertexAlgebra : VertexAlgebra k V
  /-- The conformal vector. -/
  conformal : ConformalVector toVertexAlgebra
  finiteDimensional : ∀ n : ℤ, FiniteDimensional k (conformal.weightSpace n)
  bddBelow : ∃ N : ℤ, ∀ n < N, conformal.weightSpace n = ⊥

namespace VertexOperatorAlgebra

variable {k W : Type*} [Field k] [CharZero k] [AddCommGroup W] [Module k W]
  (V : VertexOperatorAlgebra k W)

/-- The weight space `V_n`. -/
def weightSpace (n : ℤ) : Submodule k W := V.conformal.weightSpace n

instance finiteDimensional_weightSpace (n : ℤ) : FiniteDimensional k (V.weightSpace n) :=
  V.finiteDimensional n

theorem exists_weightSpace_eq_bot : ∃ N : ℤ, ∀ n < N, V.weightSpace n = ⊥ := V.bddBelow

/-- Nonnegatively graded (Borcherds' definition). -/
def IsNonnegGraded : Prop := ∀ n < 0, V.weightSpace n = ⊥

/-- CFT type: nonnegatively graded with `V₀ = k·1`. -/
def IsCFTType : Prop :=
  V.IsNonnegGraded ∧ V.weightSpace 0 = Submodule.span k {V.toVertexAlgebra.vac}

/-- The group of conformal automorphisms. -/
def Aut : Subgroup V.toVertexAlgebra.Aut := VertexAlgebra.Aut.conformal V.conformal

theorem Aut.mapsTo_weightSpace (g : V.Aut) (n : ℤ) {w : W} (hw : w ∈ V.weightSpace n) :
    (g : V.toVertexAlgebra.Aut) w ∈ V.weightSpace n := sorry

/-- The one-dimensional vertex operator algebra `k` (central charge `0`). -/
noncomputable def unit (k : Type*) [Field k] [CharZero k] : VertexOperatorAlgebra k k := sorry

/-- The tensor product of vertex operator algebras. -/
noncomputable def tensor {W' : Type*} [AddCommGroup W'] [Module k W']
    (V : VertexOperatorAlgebra k W) (V' : VertexOperatorAlgebra k W') :
    VertexOperatorAlgebra k (W ⊗[k] W') := sorry

/-- Unit test `TauCeti.QSeries.VertexOperatorAlgebra.ofFiniteCommAlgebra`: a finite-dimensional
commutative algebra with the zero derivation and `ω = 0` is a vertex operator algebra of central
charge `0` concentrated in weight `0`. -/
example {B : Type*} [CommRing B] [Algebra ℚ B] [FiniteDimensional ℚ B] :
    ∃ V : VertexOperatorAlgebra ℚ B, V.toVertexAlgebra = VertexAlgebra.ofDerivation 0 ∧
      V.conformal.c = 0 ∧ V.weightSpace 0 = ⊤ := sorry

end VertexOperatorAlgebra

namespace ConformalVector

variable {k V W : Type*} [Field k] [CharZero k] [AddCommGroup V] [Module k V] [AddCommGroup W]
  [Module k W] {A : VertexAlgebra k V} {B : VertexAlgebra k W}

/-- Node `tensor-product-conformal-structure`: the conformal vector of a tensor product. -/
noncomputable def tensor (ωV : ConformalVector A) (ωW : ConformalVector B) :
    ConformalVector (A.tensorProduct B) := sorry

/-- Node `tensor-product-conformal-structure`: `ω = ω_V ⊗ 1 + 1 ⊗ ω_W`, central charges add, and the
product of invariant forms is invariant. -/
theorem tensor_spec (ωV : ConformalVector A) (ωW : ConformalVector B) (θV : A.Aut) (θW : B.Aut)
    (BV : LinearMap.BilinForm k V) (BW : LinearMap.BilinForm k W)
    (hV : VertexAlgebra.IsInvariantForm ωV θV BV) (hW : VertexAlgebra.IsInvariantForm ωW θW BW) :
    (ωV.tensor ωW).ω = ωV.ω ⊗ₜ B.vac + A.vac ⊗ₜ ωW.ω ∧ (ωV.tensor ωW).c = ωV.c + ωW.c ∧
      ∃ θ : (A.tensorProduct B).Aut,
        VertexAlgebra.IsInvariantForm (ωV.tensor ωW) θ (BV.tmul BW) := sorry

end ConformalVector

/-! ### Graded traces and McKay–Thompson series -/

namespace VertexOperatorAlgebra

variable {k W : Type*} [Field k] [CharZero k] [AddCommGroup W] [Module k W]
  (V : VertexOperatorAlgebra k W)

/-- The graded trace `Z_V(g) = Σ tr(g | V_n) qⁿ`. -/
noncomputable def gradedTrace (g : Module.End k W)
    (hg : ∀ n : ℤ, ∀ w ∈ V.weightSpace n, g w ∈ V.weightSpace n) : LaurentSeries k :=
  HahnSeries.mk (fun n ↦ LinearMap.trace k (V.weightSpace n) (g.restrict (hg n))) sorry

@[simp] theorem gradedTrace_coeff (g : Module.End k W)
    (hg : ∀ n : ℤ, ∀ w ∈ V.weightSpace n, g w ∈ V.weightSpace n) (n : ℤ) :
    (V.gradedTrace g hg).coeff n = LinearMap.trace k (V.weightSpace n) (g.restrict (hg n)) := rfl

/-- The graded dimension `Σ dim(V_n) qⁿ`. -/
noncomputable def gradedDimension : LaurentSeries k := V.gradedTrace 1 (fun _ _ hw ↦ hw)

/-- The graded trace of a conformal automorphism. -/
noncomputable def gradedTraceAut (g : V.Aut) : LaurentSeries k :=
  V.gradedTrace ((g : V.toVertexAlgebra.Aut).1 : W ≃ₗ[k] W).toLinearMap
    (fun n _ hw ↦ Aut.mapsTo_weightSpace V g n hw)

theorem gradedTrace_conj (g h : V.Aut) : V.gradedTraceAut (h * g * h⁻¹) = V.gradedTraceAut g :=
  sorry

theorem gradedTrace_tensor {W' : Type*} [AddCommGroup W'] [Module k W']
    (V' : VertexOperatorAlgebra k W') (g : Module.End k W) (g' : Module.End k W')
    (hg : ∀ n : ℤ, ∀ w ∈ V.weightSpace n, g w ∈ V.weightSpace n)
    (hg' : ∀ n : ℤ, ∀ w ∈ V'.weightSpace n, g' w ∈ V'.weightSpace n)
    (hgg : ∀ n : ℤ, ∀ w ∈ (V.tensor V').weightSpace n,
      TensorProduct.map g g' w ∈ (V.tensor V').weightSpace n) :
    (V.tensor V').gradedTrace (TensorProduct.map g g') hgg =
      V.gradedTrace g hg * V'.gradedTrace g' hg' := sorry

theorem gradedTrace_one_coeff_nonneg (n : ℤ) : ∃ d : ℕ, V.gradedDimension.coeff n = d := sorry

/-- The McKay–Thompson series `T_g = q⁻¹ Z_V(g)`. -/
noncomputable def mckayThompsonSeries (g : Module.End k W)
    (hg : ∀ n : ℤ, ∀ w ∈ V.weightSpace n, g w ∈ V.weightSpace n) : LaurentSeries k :=
  HahnSeries.single (-1 : ℤ) (1 : k) * V.gradedTrace g hg

/-- The McKay–Thompson series of a conformal automorphism. -/
noncomputable def mckayThompsonAut (g : V.Aut) : LaurentSeries k :=
  HahnSeries.single (-1 : ℤ) (1 : k) * V.gradedTraceAut g

@[simp] theorem mckayThompsonSeries_coeff (g : Module.End k W)
    (hg : ∀ n : ℤ, ∀ w ∈ V.weightSpace n, g w ∈ V.weightSpace n) (n : ℤ) :
    (V.mckayThompsonSeries g hg).coeff n =
      LinearMap.trace k (V.weightSpace (n + 1)) (g.restrict (hg (n + 1))) := sorry

theorem mckayThompsonSeries_conj (g h : V.Aut) :
    V.mckayThompsonAut (h * g * h⁻¹) = V.mckayThompsonAut g := sorry

@[simp] theorem mckayThompsonSeries_coeff_neg_one (hV : V.IsCFTType) (g : V.Aut) :
    (V.mckayThompsonAut g).coeff (-1) = 1 := sorry

@[simp] theorem mckayThompsonSeries_coeff_zero (h1 : V.weightSpace 1 = ⊥) (g : V.Aut) :
    (V.mckayThompsonAut g).coeff 0 = 0 := sorry

theorem mckayThompsonSeries_mul_single (g : Module.End k W)
    (hg : ∀ n : ℤ, ∀ w ∈ V.weightSpace n, g w ∈ V.weightSpace n) :
    HahnSeries.single (1 : ℤ) (1 : k) * V.mckayThompsonSeries g hg = V.gradedTrace g hg := sorry

/-- Unit test `TauCeti.QSeries.VertexOperatorAlgebra.gradedTrace_trivial`: for the one-dimensional
vertex operator algebra and `g = t • 1`, `Z(g) = t`. -/
example (t : k) :
    (unit k).gradedTrace (t • (1 : Module.End k k)) (fun _ _ hw ↦ Submodule.smul_mem _ t hw) =
      HahnSeries.single (0 : ℤ) t := sorry

/-- Unit test `TauCeti.QSeries.VertexOperatorAlgebra.mckayThompsonSeries_coeff_lt`: for a
nonnegatively graded `V`, `T_g` has at most a simple pole. -/
example (hV : V.IsNonnegGraded) (g : V.Aut) (n : ℤ) (hn : n < -1) :
    (V.mckayThompsonAut g).coeff n = 0 := sorry

/-- Unit test `TauCeti.QSeries.VertexOperatorAlgebra.mckayThompsonSeries_normalized`: if `V` is of CFT
type with `V₁ = 0` then `T_g - q⁻¹` has no terms of degree `≤ 0`. -/
example (hV : V.IsCFTType) (h1 : V.weightSpace 1 = ⊥) (g : V.Aut) (n : ℤ) (hn : n ≤ 0) :
    (V.mckayThompsonAut g - HahnSeries.single (-1 : ℤ) (1 : k)).coeff n = 0 := sorry

end VertexOperatorAlgebra
/-! ### Lattice vertex algebras -/

/-- Local stand-in for `TauCeti.IntegralLattice` with `IsEven`: a symmetric, even `ℤ`-valued
bilinear form on a finite free `ℤ`-module. In Tau Ceti use `TauCeti.IntegralLattice` and
`TauCeti.IntegralLattice.IsEven`. -/
structure EvenLattice (L : Type*) [AddCommGroup L] where
  /-- The bilinear form. -/
  form : LinearMap.BilinForm ℤ L
  symm : ∀ x y, form x y = form y x
  even : ∀ x, Even (form x x)

namespace EvenLattice

variable {L : Type*} [AddCommGroup L] (Λ : EvenLattice L)

/-- A lattice cocycle `ε : L × L → {±1}`. -/
structure Cocycle where
  /-- The cocycle. -/
  ε : L → L → ℤˣ
  map_add_left : ∀ a b c, ε (a + b) c = ε a c * ε b c
  map_add_right : ∀ a b c, ε a (b + c) = ε a b * ε a c
  diag : ∀ a, ε a a = (Λ.form a a / 2).negOnePow

theorem Cocycle.exists [Module.Free ℤ L] [Module.Finite ℤ L] : Nonempty Λ.Cocycle := sorry

theorem Cocycle.mul_swap (ε : Λ.Cocycle) (a b : L) :
    ε.ε a b * ε.ε b a = (Λ.form a b).negOnePow := sorry

/-- The twisted group algebra `k_ε[L]`. -/
def TwistedGroupAlgebra (k : Type*) [Field k] {Λ : EvenLattice L} (_ε : Λ.Cocycle) : Type _ :=
  AddMonoidAlgebra k L

variable {k : Type*} [Field k] {Λ}

instance (ε : Λ.Cocycle) : Ring (TwistedGroupAlgebra k ε) := sorry
instance (ε : Λ.Cocycle) : Algebra k (TwistedGroupAlgebra k ε) := sorry

/-- The basis vector `e^α`. -/
noncomputable def TwistedGroupAlgebra.single (ε : Λ.Cocycle) (a : L) : TwistedGroupAlgebra k ε :=
  sorry

@[simp] theorem TwistedGroupAlgebra.single_mul_single (ε : Λ.Cocycle) (a b : L) :
    TwistedGroupAlgebra.single (k := k) ε a * TwistedGroupAlgebra.single ε b =
      ((ε.ε a b : ℤ) : k) • TwistedGroupAlgebra.single ε (a + b) := sorry

/-- Two cocycles give isomorphic twisted group algebras. -/
noncomputable def TwistedGroupAlgebra.equivOfCocycle (ε ε' : Λ.Cocycle) :
    TwistedGroupAlgebra k ε ≃ₐ[k] TwistedGroupAlgebra k ε' := sorry

/-- The root lattice `A₁ = ℤα` with `⟨α, α⟩ = 2`. -/
def A1 : EvenLattice ℤ where
  form := (2 : ℤ) • LinearMap.mul ℤ ℤ
  symm := sorry
  even := sorry

/-- Unit test `TauCeti.QSeries.EvenLattice.TwistedGroupAlgebra.A1_sq`: `e^α e^α = -e^{2α}` and
`e^α e^{-α} = -e^0`. -/
example (ε : A1.Cocycle) :
    TwistedGroupAlgebra.single (k := ℚ) ε 1 * TwistedGroupAlgebra.single ε 1 =
      -TwistedGroupAlgebra.single ε 2 ∧
    TwistedGroupAlgebra.single (k := ℚ) ε 1 * TwistedGroupAlgebra.single ε (-1) =
      -TwistedGroupAlgebra.single ε 0 := sorry

/-- Unit test `TauCeti.QSeries.EvenLattice.TwistedGroupAlgebra.zero_lattice`: for `L = 0`,
`k_ε[L] ≃ k`. -/
example (Λ₀ : EvenLattice PUnit) (ε : Λ₀.Cocycle) : Nonempty (TwistedGroupAlgebra ℚ ε ≃ₐ[ℚ] ℚ) :=
  sorry

/-- Unit test `TauCeti.QSeries.EvenLattice.Cocycle.one_not_cocycle`: `ε = 1` is not a cocycle for
`A₁`. -/
example : ¬ ∃ ε : A1.Cocycle, ∀ a b, ε.ε a b = 1 := sorry

/-- Unit test `TauCeti.QSeries.EvenLattice.TwistedGroupAlgebra.commute_iff`: `e^a e^b = e^b e^a` iff
`⟨a, b⟩` is even. -/
example (Λ : EvenLattice L) (ε : Λ.Cocycle) (a b : L) :
    TwistedGroupAlgebra.single (k := ℚ) ε a * TwistedGroupAlgebra.single ε b =
      TwistedGroupAlgebra.single ε b * TwistedGroupAlgebra.single ε a ↔ Even (Λ.form a b) := sorry

end EvenLattice

/-- The Fock space `S(ĥ⁻) ⊗ k[L]` underlying the lattice vertex algebra (`ĥ⁻ = ⊕_{n ≥ 1} h t⁻ⁿ`,
indexed by `ℕ`). -/
abbrev LatticeFock (k L : Type*) [Field k] [AddCommGroup L] : Type _ :=
  SymmetricAlgebra k (ℕ →₀ (k ⊗[ℤ] L)) ⊗[k] AddMonoidAlgebra k L

section Lattice

variable {k : Type*} [Field k] [CharZero k] {L : Type*} [AddCommGroup L] [Module.Free ℤ L]
  [Module.Finite ℤ L]

/-- The lattice vertex algebra `V_L`. -/
noncomputable def latticeVertexAlgebra (Λ : EvenLattice L) (ε : Λ.Cocycle) :
    VertexAlgebra k (LatticeFock k L) := sorry

/-- The vector `e^γ = 1 ⊗ e^γ`. -/
noncomputable def latticeExp (γ : L) : LatticeFock k L := 1 ⊗ₜ AddMonoidAlgebra.single γ 1

/-- The vector `α(-1)1`. -/
noncomputable def heisenbergVector (α : L) : LatticeFock k L := sorry

/-- The Heisenberg operator `α(n)`. -/
noncomputable def heisenbergOp (α : L) (n : ℤ) : Module.End k (LatticeFock k L) := sorry

/-- The lattice-degree-`γ` subspace `S(ĥ⁻) ⊗ e^γ`. -/
noncomputable def latticeDegree (γ : L) : Submodule k (LatticeFock k L) := sorry

/-- Vertex operators `Y(e^β, z)` for an arbitrary (not necessarily even) form and bimultiplicative
`ε`; for even lattices these are the fields of `V_L`. -/
noncomputable def latticeVertexOperator (B : LinearMap.BilinForm ℤ L) (ε : L → L → ℤˣ) (β : L) :
    VertexOperator k (LatticeFock k L) := sorry

namespace latticeVertexAlgebra

variable (Λ : EvenLattice L) (ε : Λ.Cocycle)

theorem nprod_mem_degree {α β : L} {u v : LatticeFock k L} (hu : u ∈ latticeDegree α)
    (hv : v ∈ latticeDegree β) (n : ℤ) :
    (latticeVertexAlgebra Λ ε).nprod u n v ∈ latticeDegree (α + β) := sorry

@[simp] theorem expMode (α β : L) :
    (∀ n : ℤ, -Λ.form α β ≤ n →
      (latticeVertexAlgebra Λ ε).nprod (latticeExp α) n (latticeExp (k := k) β) = 0) ∧
    (latticeVertexAlgebra Λ ε).nprod (latticeExp α) (-Λ.form α β - 1) (latticeExp (k := k) β) =
      ((ε.ε α β : ℤ) : k) • latticeExp (α + β) := sorry

@[simp] theorem heisenbergMode (α : L) (n : ℤ) :
    (latticeVertexAlgebra Λ ε).nprod (heisenbergVector α) n = heisenbergOp (k := k) α n := sorry

/-- The conformal vector `ω = ½ Σ hᵢ(-1) hⁱ(-1) 1` of a nondegenerate even lattice. -/
noncomputable def conformalVector (hnd : ∀ x, (∀ y, Λ.form x y = 0) → x = 0) :
    ConformalVector (latticeVertexAlgebra (k := k) Λ ε) := sorry

theorem conformalVector_c (hnd : ∀ x, (∀ y, Λ.form x y = 0) → x = 0) :
    (conformalVector (k := k) Λ ε hnd).c = Module.finrank ℤ L := sorry

@[simp] theorem L_zero_apply (hnd : ∀ x, (∀ y, Λ.form x y = 0) → x = 0) (γ : L) :
    (conformalVector (k := k) Λ ε hnd).L 0 (latticeExp γ) =
      ((Λ.form γ γ / 2 : ℤ) : k) • latticeExp γ := sorry

/-- The Cartan involution `θ(α(n)) = -α(n)`, `θ(e^γ) = (-1)^{⟨γ,γ⟩/2} e^{-γ}`. -/
noncomputable def cartanInvolution : (latticeVertexAlgebra (k := k) Λ ε).Aut := sorry

/-- For a positive definite lattice, `V_L` as a vertex operator algebra. -/
noncomputable def toVOA (Λ : EvenLattice L) (ε : Λ.Cocycle) (hpos : ∀ x, x ≠ 0 → 0 < Λ.form x x) :
    VertexOperatorAlgebra k (LatticeFock k L) := sorry

/-- Node `lattice-vertex-algebra-invariant-form`. -/
theorem invariantForm (hnd : ∀ x, (∀ y, Λ.form x y = 0) → x = 0)
    (huni : ∀ f : L →ₗ[ℤ] ℤ, ∃ x, ∀ y, f y = Λ.form x y) :
    ∃ B : LinearMap.BilinForm k (LatticeFock k L),
      VertexAlgebra.IsInvariantForm (conformalVector Λ ε hnd) 1 B ∧ B.Nondegenerate ∧
      B (latticeExp 0) (latticeExp 0) = -1 ∧
      ∀ r : L, B (latticeExp r) (cartanInvolution Λ ε (latticeExp r)) = -1 := sorry

end latticeVertexAlgebra

/-- Unit test `TauCeti.QSeries.latticeVertexAlgebra.A1_bracket`: for `A₁`, `(e^α)₀ e^{-α} =
ε(α,-α) α(-1)1` and `(α(-1)1)₀ e^α = 2 e^α`. -/
example (ε : EvenLattice.A1.Cocycle) :
    (latticeVertexAlgebra (k := ℚ) EvenLattice.A1 ε).nprod (latticeExp 1) 0 (latticeExp (-1)) =
      ((ε.ε 1 (-1) : ℤ) : ℚ) • heisenbergVector 1 ∧
    (latticeVertexAlgebra (k := ℚ) EvenLattice.A1 ε).nprod (heisenbergVector 1) 0 (latticeExp 1) =
      (2 : ℚ) • latticeExp 1 := sorry

/-- Unit test `TauCeti.QSeries.latticeVertexAlgebra.zero_lattice`: for `L = 0` the space `V_L` is
one-dimensional. -/
example : Module.finrank ℚ (LatticeFock ℚ PUnit) = 1 := sorry

/-- Unit test `TauCeti.QSeries.latticeVertexAlgebra.odd_not_local`: for the odd lattice `ℤ` with
`⟨1,1⟩ = 1` and `ε = 1`, `Y(e^1, z)` is not local with itself. -/
example : ¬ IsMutuallyLocal
    (latticeVertexOperator (k := ℚ) (LinearMap.mul ℤ ℤ) (fun _ _ ↦ 1) (1 : ℤ))
    (latticeVertexOperator (k := ℚ) (LinearMap.mul ℤ ℤ) (fun _ _ ↦ 1) (1 : ℤ)) := sorry

/-- Unit test `TauCeti.QSeries.latticeVertexAlgebra.gradedDimension_posDef`: for a positive definite
even lattice, `dim V₁ = rank L + #{x : ⟨x,x⟩ = 2}`. -/
example (Λ : EvenLattice L) (ε : Λ.Cocycle) (hpos : ∀ x, x ≠ 0 → 0 < Λ.form x x) :
    (latticeVertexAlgebra.toVOA (k := ℚ) Λ ε hpos).gradedDimension.coeff 1 =
      (Module.finrank ℤ L : ℚ) + (Set.ncard {x : L | Λ.form x x = 2} : ℚ) := sorry

/-- The Heisenberg vertex operator algebra of rank `d`. -/
noncomputable def heisenbergVOA (k : Type*) [Field k] [CharZero k] (d : ℕ) :
    VertexOperatorAlgebra k (SymmetricAlgebra k (ℕ →₀ (Fin d → k))) := sorry

/-- The involution `α ↦ -α` of the Heisenberg vertex operator algebra. -/
noncomputable def heisenbergVOA.neg (k : Type*) [Field k] [CharZero k] (d : ℕ) :
    (heisenbergVOA k d).Aut := sorry

end Lattice

/-- The lattice `II_{1,1}` (Gram matrix `[[0,-1],[-1,0]]`); in Tau Ceti use
`TauCeti.IntegralLattice.ofGramMatrix`. -/
def II11 : EvenLattice (Fin 2 → ℤ) where
  form := Matrix.toBilin' !![0, -1; -1, 0]
  symm := sorry
  even := sorry

namespace II11

@[simp] theorem form_apply (v w : Fin 2 → ℤ) : II11.form v w = -(v 0 * w 1 + w 0 * v 1) := sorry

theorem isEven (x : Fin 2 → ℤ) : Even (II11.form x x) := II11.even x

theorem isUnimodular : ∀ f : (Fin 2 → ℤ) →ₗ[ℤ] ℤ, ∃ x, ∀ y, f y = II11.form x y := sorry

theorem norm_eq_two_iff (v : Fin 2 → ℤ) : II11.form v v = 2 ↔ v = ![1, -1] ∨ v = ![-1, 1] := sorry

/-- The reflection in `(1, -1)`: `(m, n) ↦ (n, m)`. -/
def reflection : (Fin 2 → ℤ) ≃ₗ[ℤ] (Fin 2 → ℤ) := sorry

/-- Unit test `TauCeti.QSeries.II11.norm_one_neg_one`: `⟨(1,-1),(1,-1)⟩ = 2`, `⟨(1,1),(1,1)⟩ = -2`. -/
example : II11.form ![1, -1] ![1, -1] = 2 ∧ II11.form ![1, 1] ![1, 1] = -2 := sorry

/-- Unit test `TauCeti.QSeries.II11.norm_eq_zero_iff`: norm zero iff a coordinate vanishes. -/
example (v : Fin 2 → ℤ) : II11.form v v = 0 ↔ v 0 = 0 ∨ v 1 = 0 := sorry

/-- Unit test `TauCeti.QSeries.II11.gram_det`: the Gram determinant is `-1`. -/
example : (!![0, -1; -1, 0] : Matrix (Fin 2) (Fin 2) ℤ).det = -1 := by
  simp [Matrix.det_fin_two]

/-- Unit test `TauCeti.QSeries.II11.not_posDef`: `II_{1,1}` is not positive definite. -/
example : II11.form ![1, 1] ![1, 1] < 0 := sorry

end II11

section LatticeTests

/-- Unit test `TauCeti.QSeries.VertexAlgebra.zeroMode_not_antisymmetric`: for the conformal vector
of the `A₁` lattice vertex algebra, `ω₀ ω = Dω ≠ 0`. -/
example (ε : EvenLattice.A1.Cocycle) (hnd : ∀ x, (∀ y, EvenLattice.A1.form x y = 0) → x = 0) :
    (latticeVertexAlgebra (k := ℚ) EvenLattice.A1 ε).nprod
      (latticeVertexAlgebra.conformalVector EvenLattice.A1 ε hnd).ω 0
      (latticeVertexAlgebra.conformalVector EvenLattice.A1 ε hnd).ω ≠ 0 := sorry

/-- Unit test `TauCeti.QSeries.ConformalVector.lattice_rankOne`: for `A₁`, `ω = ¼ α(-1)² 1` has
central charge `1` and `L₀ e^α = e^α`. -/
example (ε : EvenLattice.A1.Cocycle) (hnd : ∀ x, (∀ y, EvenLattice.A1.form x y = 0) → x = 0) :
    (latticeVertexAlgebra.conformalVector (k := ℚ) EvenLattice.A1 ε hnd).ω =
        (1 / 4 : ℚ) • (latticeVertexAlgebra EvenLattice.A1 ε).nprod (heisenbergVector 1) (-1)
          (heisenbergVector 1) ∧
      (latticeVertexAlgebra.conformalVector (k := ℚ) EvenLattice.A1 ε hnd).c = 1 ∧
      (latticeVertexAlgebra.conformalVector (k := ℚ) EvenLattice.A1 ε hnd).L 0 (latticeExp 1) =
        latticeExp 1 := sorry

/-- Unit test `TauCeti.QSeries.ConformalVector.two_omega_not_conformal`: `2ω` is not a conformal
vector. -/
example (ε : EvenLattice.A1.Cocycle) (hnd : ∀ x, (∀ y, EvenLattice.A1.form x y = 0) → x = 0) :
    ¬ ∃ ω' : ConformalVector (latticeVertexAlgebra (k := ℚ) EvenLattice.A1 ε),
      ω'.ω = (2 : ℚ) • (latticeVertexAlgebra.conformalVector EvenLattice.A1 ε hnd).ω := sorry

/-- Unit test `TauCeti.QSeries.VertexOperatorAlgebra.lattice_rankOne_weightSpace_one`: for `A₁`,
`dim V₀ = 1` and `dim V₁ = 3`. -/
example (ε : EvenLattice.A1.Cocycle) (hpos : ∀ x, x ≠ 0 → 0 < EvenLattice.A1.form x x) :
    Module.finrank ℚ ((latticeVertexAlgebra.toVOA (k := ℚ) EvenLattice.A1 ε hpos).weightSpace 0) = 1 ∧
    Module.finrank ℚ ((latticeVertexAlgebra.toVOA (k := ℚ) EvenLattice.A1 ε hpos).weightSpace 1) = 3 :=
  sorry

/-- Unit test `TauCeti.QSeries.VertexOperatorAlgebra.not_II11`: `V_{II_{1,1}}` is not a vertex
operator algebra. -/
example (ε : II11.Cocycle) : ¬ ∃ V : VertexOperatorAlgebra ℚ (LatticeFock ℚ (Fin 2 → ℤ)),
    V.toVertexAlgebra = latticeVertexAlgebra II11 ε := sorry

/-- Unit test `TauCeti.QSeries.VertexOperatorAlgebra.isCFTType_lattice`: `V_L` is of CFT type for
positive definite `L`. -/
example {L : Type*} [AddCommGroup L] [Module.Free ℤ L] [Module.Finite ℤ L] (Λ : EvenLattice L)
    (ε : Λ.Cocycle) (hpos : ∀ x, x ≠ 0 → 0 < Λ.form x x) :
    (latticeVertexAlgebra.toVOA (k := ℚ) Λ ε hpos).IsCFTType := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.IsInvariantForm.lattice_fock`: for an even unimodular
lattice there is a `θ`-invariant form with `(α(-1)1, β(-1)1) = ⟨α, β⟩`. -/
example {L : Type*} [AddCommGroup L] [Module.Free ℤ L] [Module.Finite ℤ L] (Λ : EvenLattice L)
    (ε : Λ.Cocycle) (hnd : ∀ x, (∀ y, Λ.form x y = 0) → x = 0)
    (huni : ∀ f : L →ₗ[ℤ] ℤ, ∃ x, ∀ y, f y = Λ.form x y) :
    ∃ B : LinearMap.BilinForm ℚ (LatticeFock ℚ L),
      VertexAlgebra.IsInvariantForm (latticeVertexAlgebra.conformalVector Λ ε hnd)
        (latticeVertexAlgebra.cartanInvolution Λ ε) B ∧
      ∀ α β : L, B (heisenbergVector α) (heisenbergVector β) = Λ.form α β := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.IsInvariantForm.lattice_fock_not_id`: every
`id`-invariant form on `V_{A₁}` has `(e^α, e^α) = 0`, so the Fock form is not `id`-invariant. -/
example (ε : EvenLattice.A1.Cocycle) (hnd : ∀ x, (∀ y, EvenLattice.A1.form x y = 0) → x = 0)
    (B : LinearMap.BilinForm ℚ (LatticeFock ℚ ℤ))
    (hB : VertexAlgebra.IsInvariantForm (latticeVertexAlgebra.conformalVector EvenLattice.A1 ε hnd) 1 B) :
    B (latticeExp 1) (latticeExp 1) = 0 := sorry

/-- Unit test `TauCeti.QSeries.VertexOperatorAlgebra.gradedDimension_heisenberg`: the graded dimension
of the rank-one Heisenberg vertex operator algebra has coefficients `1, 1, 2, 3, 5, 7`. -/
example : (heisenbergVOA ℚ 1).gradedDimension.coeff 0 = 1 ∧ (heisenbergVOA ℚ 1).gradedDimension.coeff 1 = 1 ∧
    (heisenbergVOA ℚ 1).gradedDimension.coeff 2 = 2 ∧ (heisenbergVOA ℚ 1).gradedDimension.coeff 3 = 3 ∧
    (heisenbergVOA ℚ 1).gradedDimension.coeff 4 = 5 ∧ (heisenbergVOA ℚ 1).gradedDimension.coeff 5 = 7 :=
  sorry

/-- Unit test `TauCeti.QSeries.VertexOperatorAlgebra.gradedTrace_neg_heisenberg`: for `α ↦ -α`,
`Z(g) = Π (1 + qⁿ)⁻¹ = 1 - q - q³ + q⁴ - ⋯`. -/
example : ((heisenbergVOA ℚ 1).gradedTraceAut (heisenbergVOA.neg ℚ 1)).coeff 1 = -1 ∧
    ((heisenbergVOA ℚ 1).gradedTraceAut (heisenbergVOA.neg ℚ 1)).coeff 2 = 0 ∧
    ((heisenbergVOA ℚ 1).gradedTraceAut (heisenbergVOA.neg ℚ 1)).coeff 3 = -1 := sorry

/-- Unit test `TauCeti.QSeries.VertexOperatorAlgebra.gradedTrace_not_multiplicative`: `Z(g)²` and
`Z(g²) = Z(1)` differ at `q¹`. -/
example : (((heisenbergVOA ℚ 1).gradedTraceAut (heisenbergVOA.neg ℚ 1)) ^ 2).coeff 1 = -2 ∧
    (heisenbergVOA ℚ 1).gradedDimension.coeff 1 = 1 := sorry

/-- Unit test `TauCeti.QSeries.VertexOperatorAlgebra.mckayThompsonSeries_heisenberg24`: for the
rank-24 Heisenberg vertex operator algebra, `T₁ = q⁻¹ + 24 + 324 q + 3200 q² + ⋯`. -/
example : ((heisenbergVOA ℚ 24).mckayThompsonAut 1).coeff (-1) = 1 ∧
    ((heisenbergVOA ℚ 24).mckayThompsonAut 1).coeff 0 = 24 ∧
    ((heisenbergVOA ℚ 24).mckayThompsonAut 1).coeff 1 = 324 ∧
    ((heisenbergVOA ℚ 24).mckayThompsonAut 1).coeff 2 = 3200 := sorry

end LatticeTests
/-! ## QM.6c The product formula for `j` -/

section JFunction

open UpperHalfPlane
open scoped Manifold

/-- A normalized `q`-series `q⁻¹ + Σ_{n ≥ 1} aₙ qⁿ`. -/
def IsNormalizedQSeries {k : Type*} [Field k] (f : LaurentSeries k) : Prop :=
  f.coeff (-1) = 1 ∧ ∀ n : ℤ, n ≤ 0 → n ≠ -1 → f.coeff n = 0

/-- `E₄(q) = 1 + 240 Σ σ₃(n) qⁿ ∈ ℤ⟦q⟧`. -/
noncomputable def qm6E4Series : PowerSeries ℤ :=
  PowerSeries.mk fun n ↦ if n = 0 then 1 else 240 * (ArithmeticFunction.sigma 3 n : ℤ)

/-- `(q; q)_∞ = Π (1 - qⁿ)`. The roadmap takes this from `QM.0/q-pochhammer`; local stand-in. -/
noncomputable def qm6QPochhammer : PowerSeries ℤ := sorry

theorem constantCoeff_qm6QPochhammer : PowerSeries.constantCoeff qm6QPochhammer = 1 := sorry

/-- `j(q) = q⁻¹ E₄(q)³ (q;q)_∞⁻²⁴ ∈ ℤ((q))`. -/
noncomputable def jLaurentSeries : LaurentSeries ℤ :=
  HahnSeries.single (-1 : ℤ) (1 : ℤ) *
    HahnSeries.ofPowerSeries ℤ ℤ (qm6E4Series ^ 3 * PowerSeries.invOfUnit (qm6QPochhammer ^ 24) 1)

/-- `J = j - 744`. -/
noncomputable def JLaurentSeries : LaurentSeries ℤ := jLaurentSeries - 744

/-- `J` with rational coefficients. -/
noncomputable def JLaurentSeriesQ : LaurentSeries ℚ := JLaurentSeries.map (Int.castRingHom ℚ)

@[simp] theorem JLaurentSeries.coeff_neg_one : JLaurentSeries.coeff (-1) = 1 := sorry
@[simp] theorem JLaurentSeries.coeff_zero : JLaurentSeries.coeff 0 = 0 := sorry
@[simp] theorem JLaurentSeries.coeff_eq_zero_of_lt (n : ℤ) (hn : n < -1) : JLaurentSeries.coeff n = 0 :=
  sorry

theorem jLaurentSeries_mul_discriminant :
    jLaurentSeries * (HahnSeries.single (1 : ℤ) (1 : ℤ) * HahnSeries.ofPowerSeries ℤ ℤ (qm6QPochhammer ^ 24)) =
      HahnSeries.ofPowerSeries ℤ ℤ (qm6E4Series ^ 3) := sorry

/-- The analytic `j = E₄³/Δ`. The roadmap uses the `j` of the ModularForms roadmap, Layer 0. -/
noncomputable def qm6JFunction (τ : ℍ) : ℂ := (ModularForm.E₄ τ) ^ 3 / ModularForm.discriminant τ

/-- Laurent `q`-expansions. -/
def HasLaurentQExpansion (f : ℍ → ℂ) (F : LaurentSeries ℂ) : Prop :=
  ∀ τ : ℍ, HasSum (fun n : ℤ ↦ F.coeff n * Function.Periodic.qParam 1 τ ^ n) (f τ)

open Classical in
/-- The Laurent `q`-expansion `q^{-N} · qExpansion (q^N f)`. -/
noncomputable def laurentQExpansion (f : ℍ → ℂ) : LaurentSeries ℂ :=
  if h : ∃ N : ℕ, IsBoundedAtImInfty (fun τ : ℍ ↦ Function.Periodic.qParam 1 τ ^ N * f τ) then
    HahnSeries.single (-(Nat.find h : ℤ)) (1 : ℂ) *
      HahnSeries.ofPowerSeries ℤ ℂ
        (UpperHalfPlane.qExpansion 1 (fun τ ↦ Function.Periodic.qParam 1 τ ^ Nat.find h * f τ))
  else 0

theorem jLaurentSeries_hasLaurentQExpansion :
    HasLaurentQExpansion qm6JFunction (jLaurentSeries.map (Int.castRingHom ℂ)) := sorry

theorem hasLaurentQExpansion_laurentQExpansion {f : ℍ → ℂ} (hf : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f)
    (hper : ∀ τ : ℍ, f ((1 : ℝ) +ᵥ τ) = f τ)
    (hb : ∃ N : ℕ, IsBoundedAtImInfty (fun τ : ℍ ↦ Function.Periodic.qParam 1 τ ^ N * f τ)) :
    HasLaurentQExpansion f (laurentQExpansion f) := sorry

theorem HasLaurentQExpansion.unique {f : ℍ → ℂ} {F G : LaurentSeries ℂ}
    (hF : HasLaurentQExpansion f F) (hG : HasLaurentQExpansion f G) : F = G := sorry

@[simp] theorem laurentQExpansion_mul {f g : ℍ → ℂ} {F G : LaurentSeries ℂ}
    (hF : HasLaurentQExpansion f F) (hG : HasLaurentQExpansion g G) :
    laurentQExpansion (f * g) = laurentQExpansion f * laurentQExpansion g := sorry

theorem laurentQExpansion_ofBounded {f : ℍ → ℂ} (hf : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f)
    (hper : ∀ τ : ℍ, f ((1 : ℝ) +ᵥ τ) = f τ) (hb : IsBoundedAtImInfty f) :
    laurentQExpansion f = HahnSeries.ofPowerSeries ℤ ℂ (UpperHalfPlane.qExpansion 1 f) := sorry

/-- Unit test `TauCeti.QSeries.JLaurentSeries.coeff_one`: `c(1) = 196884`, `c(2) = 21493760`,
`c(3) = 864299970`. -/
example : JLaurentSeries.coeff 1 = 196884 ∧ JLaurentSeries.coeff 2 = 21493760 ∧
    JLaurentSeries.coeff 3 = 864299970 := sorry

/-- Unit test `TauCeti.QSeries.JLaurentSeries.coeff_four`: `c(4) = 20245856256`,
`c(5) = 333202640600`. -/
example : JLaurentSeries.coeff 4 = 20245856256 ∧ JLaurentSeries.coeff 5 = 333202640600 := sorry

/-- Unit test `TauCeti.QSeries.JLaurentSeries.order`: `J` has order `-1`. -/
example : JLaurentSeries.order = -1 := sorry

/-- Unit test `TauCeti.QSeries.JLaurentSeries.ne_inv_discriminant`: `J ≠ q⁻¹(q;q)_∞⁻²⁴`. -/
example : JLaurentSeries ≠
    HahnSeries.single (-1 : ℤ) (1 : ℤ) *
      HahnSeries.ofPowerSeries ℤ ℤ (PowerSeries.invOfUnit (qm6QPochhammer ^ 24) 1) := sorry

/-- Unit test `TauCeti.QSeries.laurentQExpansion_qParam_inv`: the expansion of `e^{-2πiτ}` is `q⁻¹`. -/
example : laurentQExpansion (fun τ ↦ (Function.Periodic.qParam 1 τ)⁻¹) =
    HahnSeries.single (-1 : ℤ) (1 : ℂ) := sorry

/-- Unit test `TauCeti.QSeries.laurentQExpansion_zero`: the expansion of `0` is `0`. -/
example : laurentQExpansion (0 : ℍ → ℂ) = 0 := sorry

/-- Unit test `TauCeti.QSeries.laurentQExpansion_discriminant_coeff_one`: the expansion of `Δ` has
`q¹`-coefficient `1` and no terms of degree `≤ 0`. -/
example : (laurentQExpansion ModularForm.discriminant).coeff 1 = 1 ∧
    ∀ n : ℤ, n ≤ 0 → (laurentQExpansion ModularForm.discriminant).coeff n = 0 := sorry

/-- Unit test `TauCeti.QSeries.not_hasLaurentQExpansion_id`: `τ ↦ τ` has no Laurent `q`-expansion. -/
example : ¬ ∃ F : LaurentSeries ℂ, HasLaurentQExpansion (fun τ : ℍ ↦ (τ : ℂ)) F := sorry

/-- The level-one modular functions holomorphic on `ℍ`: the weight-`0`, level-one case of the
weakly holomorphic modular forms of stage QM.3 (`QM.3/weakly-holomorphic-modular-form`), with its
algebra structure. -/
def WeaklyHolomorphicModularFunction : Subalgebra ℂ (ℍ → ℂ) where
  carrier := {f | MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f ∧ (∀ (γ : SL(2, ℤ)) (τ : ℍ), f (γ • τ) = f τ) ∧
    ∃ N : ℕ, IsBoundedAtImInfty (fun τ : ℍ ↦ Function.Periodic.qParam 1 τ ^ N * f τ)}
  mul_mem' := sorry
  add_mem' := sorry
  algebraMap_mem' := sorry

namespace WeaklyHolomorphicModularFunction

theorem mem_iff (f : ℍ → ℂ) : f ∈ WeaklyHolomorphicModularFunction ↔
    MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f ∧ (∀ (γ : SL(2, ℤ)) (τ : ℍ), f (γ • τ) = f τ) ∧
      ∃ N : ℕ, IsBoundedAtImInfty (fun τ : ℍ ↦ Function.Periodic.qParam 1 τ ^ N * f τ) := Iff.rfl

/-- The Laurent expansion of an element of `M^!_0`. -/
noncomputable def laurentQExpansion (f : WeaklyHolomorphicModularFunction) : LaurentSeries ℂ :=
  TauCeti.QSeries.laurentQExpansion f

/-- A bounded element of `M^!_0` as a weight-zero level-one modular form. -/
noncomputable def toModularForm (f : WeaklyHolomorphicModularFunction)
    (hf : IsBoundedAtImInfty (f : ℍ → ℂ)) : ModularForm 𝒮ℒ 0 := sorry

theorem const_of_bounded (f : WeaklyHolomorphicModularFunction)
    (hf : IsBoundedAtImInfty (f : ℍ → ℂ)) : ∃ c : ℂ, (f : ℍ → ℂ) = Function.const ℍ c := sorry

theorem laurentQExpansion_injective :
    Function.Injective (laurentQExpansion : WeaklyHolomorphicModularFunction → LaurentSeries ℂ) :=
  sorry

/-- Unit test `TauCeti.QSeries.WeaklyHolomorphicModularFunction.const_mem`: constants lie in
`M^!_0`. -/
example (c : ℂ) : Function.const ℍ c ∈ WeaklyHolomorphicModularFunction := sorry

/-- Unit test `TauCeti.QSeries.WeaklyHolomorphicModularFunction.bounded_eq_const`: bounded elements
are constant. -/
example (f : WeaklyHolomorphicModularFunction) (hf : IsBoundedAtImInfty (f : ℍ → ℂ)) :
    ∃ c : ℂ, ∀ τ, (f : ℍ → ℂ) τ = c := sorry

/-- Unit test `TauCeti.QSeries.WeaklyHolomorphicModularFunction.E4_not_mem`: `E₄ ∉ M^!_0`. -/
example : (⇑ModularForm.E₄ : ℍ → ℂ) ∉ WeaklyHolomorphicModularFunction := sorry

/-- Unit test `TauCeti.QSeries.WeaklyHolomorphicModularFunction.j_mem`: `j ∈ M^!_0` with Laurent
expansion `j(q)`. -/
example : qm6JFunction ∈ WeaklyHolomorphicModularFunction ∧
    ∀ n : ℤ, (TauCeti.QSeries.laurentQExpansion qm6JFunction).coeff n = (jLaurentSeries.coeff n : ℂ) :=
  sorry

/-- Weight-zero Hecke operators on `M^!_0`. -/
noncomputable def hecke (m : ℕ) [NeZero m] :
    WeaklyHolomorphicModularFunction →ₗ[ℂ] WeaklyHolomorphicModularFunction := sorry

@[simp] theorem hecke_apply (m : ℕ) [NeZero m] (f : WeaklyHolomorphicModularFunction) (τ : ℍ) :
    ((hecke m f : WeaklyHolomorphicModularFunction) : ℍ → ℂ) τ =
      (m : ℂ)⁻¹ * ∑ a ∈ m.divisors, ∑ b ∈ Finset.range (m / a),
        (f : ℍ → ℂ) (UpperHalfPlane.ofComplex ((a * (τ : ℂ) + b) / ((m / a : ℕ) : ℂ))) := sorry

@[simp] theorem hecke_one : hecke 1 = LinearMap.id := sorry

@[simp] theorem hecke_const (m : ℕ) [NeZero m] (c : ℂ) :
    hecke m (algebraMap ℂ WeaklyHolomorphicModularFunction c) =
      algebraMap ℂ WeaklyHolomorphicModularFunction
        (((ArithmeticFunction.sigma 1 m : ℕ) : ℂ) / m * c) := sorry

end WeaklyHolomorphicModularFunction

/-- Node `modular-function-polynomial-in-j`: `M^!_0 = ℂ[j]`. -/
theorem modularFunction_eq_poly_j (f : ℍ → ℂ) (hf : f ∈ WeaklyHolomorphicModularFunction) :
    ∃! P : Polynomial ℂ, ∀ τ, f τ = P.eval (qm6JFunction τ) := sorry

/-- Formal weight-zero Hecke operators on Laurent series. -/
noncomputable def formalHecke (k : Type*) [Field k] [CharZero k] (m : ℕ) :
    LaurentSeries k →ₗ[k] LaurentSeries k := sorry

section FormalHecke

variable {k : Type*} [Field k] [CharZero k]

@[simp] theorem formalHecke_coeff (m : ℕ) (hm : 0 < m) (f : LaurentSeries k) (n : ℤ) :
    (formalHecke k m f).coeff n =
      ∑ a ∈ (Nat.divisors m).filter (fun a : ℕ ↦ (a : ℤ) ∣ n),
        (a : k)⁻¹ * f.coeff (m * n / (a : ℤ) ^ 2) := sorry

@[simp] theorem formalHecke_one : formalHecke k 1 = LinearMap.id := sorry

theorem formalHecke_mul_coprime {m n : ℕ} (h : m.Coprime n) :
    formalHecke k m ∘ₗ formalHecke k n = formalHecke k (m * n) := sorry

theorem formalHecke_normalized (m : ℕ) (hm : 0 < m) (f : LaurentSeries k)
    (hf : IsNormalizedQSeries f) (n : ℤ) (hn : n ≤ 0) :
    (formalHecke k m f - HahnSeries.single (-(m : ℤ)) ((m : k)⁻¹)).coeff n = 0 := sorry

theorem formalHecke_map {k' : Type*} [Field k'] [CharZero k'] (φ : k →+* k') (m : ℕ)
    (f : LaurentSeries k) :
    formalHecke k' m (f.map φ) = (formalHecke k m f).map φ := sorry

/-- Unit test `TauCeti.QSeries.formalHecke_two_J`: `T₂J = ½q⁻² + 21493760 q + (c(4) + c(1)/2) q² + ⋯`. -/
example : (formalHecke ℚ 2 JLaurentSeriesQ).coeff (-2) = 1 / 2 ∧
    (formalHecke ℚ 2 JLaurentSeriesQ).coeff (-1) = 0 ∧ (formalHecke ℚ 2 JLaurentSeriesQ).coeff 0 = 0 ∧
    (formalHecke ℚ 2 JLaurentSeriesQ).coeff 1 = 21493760 ∧
    (formalHecke ℚ 2 JLaurentSeriesQ).coeff 2 = 20245856256 + 98442 := sorry

/-- Unit test `TauCeti.QSeries.formalHecke_one_apply`: `T₁ f = f`. -/
example (f : LaurentSeries k) : formalHecke k 1 f = f := by simp

/-- Unit test `TauCeti.QSeries.formalHecke_not_mul`: `T₂(q⁻²) ≠ (T₂ q⁻¹)²`. -/
example : formalHecke ℚ 2 (HahnSeries.single (-2 : ℤ) 1) =
      HahnSeries.single (-1 : ℤ) 1 + HahnSeries.single (-4 : ℤ) (1 / 2) ∧
    (formalHecke ℚ 2 (HahnSeries.single (-1 : ℤ) 1)) ^ 2 = HahnSeries.single (-4 : ℤ) (1 / 4) := sorry

/-- Unit test `TauCeti.QSeries.formalHecke_const`: `T_m a = (σ₁(m)/m) a`. -/
example (m : ℕ) (hm : 0 < m) (a : k) :
    formalHecke k m (HahnSeries.C a) =
      HahnSeries.C ((((ArithmeticFunction.sigma 1 m : ℕ) : k) / m) * a) := sorry

end FormalHecke

namespace WeaklyHolomorphicModularFunction

theorem laurentQExpansion_hecke (m : ℕ) [NeZero m] (f : WeaklyHolomorphicModularFunction) :
    laurentQExpansion (hecke m f) = formalHecke ℂ m (laurentQExpansion f) := sorry

/-- `J = j - 744` as an element of `M^!_0`. -/
noncomputable def J : WeaklyHolomorphicModularFunction := sorry

/-- Unit test `TauCeti.QSeries.WeaklyHolomorphicModularFunction.hecke_one_apply`: `T₁ f = f`. -/
example (f : WeaklyHolomorphicModularFunction) : hecke 1 f = f := by simp

/-- Unit test `TauCeti.QSeries.WeaklyHolomorphicModularFunction.hecke_const_two`: `T₂ 1 = (3/2) 1`. -/
example : hecke 2 (1 : WeaklyHolomorphicModularFunction) =
    algebraMap ℂ WeaklyHolomorphicModularFunction (3 / 2) := sorry

/-- Unit test `TauCeti.QSeries.WeaklyHolomorphicModularFunction.hecke_J_leading`: `T_m J =
(1/m) q^{-m} + O(q)`. -/
example (m : ℕ) [NeZero m] : (laurentQExpansion (hecke m J)).coeff (-(m : ℤ)) = (m : ℂ)⁻¹ ∧
    ∀ n : ℤ, n ≤ 0 → n ≠ -(m : ℤ) → (laurentQExpansion (hecke m J)).coeff n = 0 := sorry

/-- Unit test `TauCeti.QSeries.WeaklyHolomorphicModularFunction.partial_sum_not_invariant`: the
partial sum `½ (J(τ/2) + J((τ+1)/2))` is not in `M^!_0`. -/
example : (fun τ : ℍ ↦ (1 / 2 : ℂ) * ((J : ℍ → ℂ) (UpperHalfPlane.ofComplex ((τ : ℂ) / 2)) +
    (J : ℍ → ℂ) (UpperHalfPlane.ofComplex (((τ : ℂ) + 1) / 2)))) ∉ WeaklyHolomorphicModularFunction :=
  sorry

end WeaklyHolomorphicModularFunction

/-- `J` with complex coefficients. -/
noncomputable def JLaurentSeriesC : LaurentSeries ℂ := JLaurentSeries.map (Int.castRingHom ℂ)

/-- Node `hecke-transform-of-j`: `T_m J = P_m(J)` with `deg P_m = m` and leading coefficient `1/m`. -/
theorem hecke_transform_J (m : ℕ) (hm : 0 < m) :
    ∃ P : Polynomial ℂ, P.natDegree = m ∧ P.leadingCoeff = (m : ℂ)⁻¹ ∧
      formalHecke ℂ m JLaurentSeriesC = Polynomial.aeval JLaurentSeriesC P := sorry

/-- Node `polynomial-in-j-principal-part`. -/
theorem polynomial_eq_zero_of_principalPart {k : Type*} [Field k] (J : LaurentSeries k)
    (hJ : J.coeff (-1) = 1 ∧ ∀ n : ℤ, n < -1 ∨ n = 0 → J.coeff n = 0) (P : Polynomial k)
    (hP : ∀ n : ℤ, n ≤ 0 → (Polynomial.aeval J P).coeff n = 0) : P = 0 := sorry

/-- The convergent product `Π_{m ≥ 1, n ≥ -1} (1 - pᵐ qⁿ)^{c(mn)}` in `ℚ((q))⟦p⟧`. -/
noncomputable def jProductPowerSeries : PowerSeries (LaurentSeries ℚ) := sorry

/-- Node `formal-product-logarithm`: the product is `exp(-Σ_M T_M(J) p^M)`. -/
theorem jProductPowerSeries_eq_exp :
    jProductPowerSeries = (PowerSeries.exp (LaurentSeries ℚ)).subst
      (-(PowerSeries.mk fun M : ℕ ↦ if M = 0 then 0 else formalHecke ℚ M JLaurentSeriesQ)) := sorry

/-- The product `Π_{m ≥ 1, n ∈ ℤ} (1 - pᵐ qⁿ)^{c(mn)}` in `ℤ((q))((p))`. -/
noncomputable def jProductLaurent : LaurentSeries (LaurentSeries ℤ) := sorry

/-- The product `Π_{m, n ≥ 1} (1 - pᵐ qⁿ)^{c(mn)}` in `ℤ⟦p, q⟧`. -/
noncomputable def jProductMv : MvPowerSeries (Fin 2) ℤ := sorry

/-- Node `j-product-formula` (Borcherds, Lemma 7.1): `p⁻¹ Π (1 - pᵐqⁿ)^{c(mn)} = J(p) - J(q)`. -/
theorem j_product_formula :
    HahnSeries.single (-1 : ℤ) (1 : LaurentSeries ℤ) * jProductLaurent =
      JLaurentSeries.map (HahnSeries.C : ℤ →+* LaurentSeries ℤ) - HahnSeries.C JLaurentSeries := sorry

/-- Node `j-product-formula`, second form:
`Π_{m,n ≥ 1} (1 - pᵐqⁿ)^{c(mn)} = 1 - Σ c(m+n-1) pᵐ qⁿ`. -/
theorem j_product_formula_mv :
    jProductMv = 1 - (show MvPowerSeries (Fin 2) ℤ from fun e : Fin 2 →₀ ℕ ↦
      if 1 ≤ e 0 ∧ 1 ≤ e 1 then JLaurentSeries.coeff ((e 0 : ℤ) + e 1 - 1) else 0) := sorry

end JFunction
/-! ## QM.6b The no-ghost theorem and the Monster Lie algebra -/

namespace VertexAlgebra

variable {k V : Type*} [Field k] [CharZero k] [AddCommGroup V] [Module k V] {A : VertexAlgebra k V}

/-- The physical space `Pⁱ = {v : L₀ v = i v, Lₙ v = 0 (n ≥ 1)}`. -/
def physicalSpace (ω : ConformalVector A) (i : ℤ) : Submodule k V where
  carrier := {v | ω.L 0 v = (i : k) • v ∧ ∀ n : ℤ, 1 ≤ n → ω.L n v = 0}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

theorem mem_physicalSpace (ω : ConformalVector A) (i : ℤ) (v : V) :
    v ∈ physicalSpace ω i ↔ ω.L 0 v = (i : k) • v ∧ ∀ n : ℤ, 1 ≤ n → ω.L n v = 0 := Iff.rfl

theorem mem_physicalSpace_iff_L_one_L_two (ω : ConformalVector A) (i : ℤ) (v : V) :
    v ∈ physicalSpace ω i ↔ ω.L 0 v = (i : k) • v ∧ ω.L 1 v = 0 ∧ ω.L 2 v = 0 := sorry

theorem zeroMode_mem_physicalSpace (ω : ConformalVector A) {u v : V}
    (hu : u ∈ physicalSpace ω 1) (hv : v ∈ physicalSpace ω 1) :
    A.nprod u 0 v ∈ physicalSpace ω 1 := sorry

theorem translation_physicalSpace_zero (ω : ConformalVector A) {v : V}
    (hv : v ∈ physicalSpace ω 0) : A.translation v ∈ physicalSpace ω 1 := sorry

theorem physicalSpace_map (ω : ConformalVector A) (g : A.Aut) (hg : g ∈ Aut.conformal ω) (i : ℤ)
    {v : V} (hv : v ∈ physicalSpace ω i) : g v ∈ physicalSpace ω i := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.vac_mem_physicalSpace_zero`: `1 ∈ P⁰`. -/
example (ω : ConformalVector A) : A.vac ∈ physicalSpace ω 0 := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.omega_not_mem_physicalSpace_two`: `ω ∉ P²` if `c ≠ 0`. -/
example (ω : ConformalVector A) (hc : ω.c ≠ 0) (hvac : A.vac ≠ 0) : ω.ω ∉ physicalSpace ω 2 := sorry

/-- The radical `N = {p ∈ P¹ : (p, P¹) = 0}`. -/
def physicalRadical (ω : ConformalVector A) (B : LinearMap.BilinForm k V) : Submodule k V where
  carrier := {p | p ∈ physicalSpace ω 1 ∧ ∀ q ∈ physicalSpace ω 1, B p q = 0}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- The Lie algebra of physical states `P¹ ⧸ N`. -/
def physicalLieAlgebra (ω : ConformalVector A) (B : LinearMap.BilinForm k V) : Type _ :=
  physicalSpace ω 1 ⧸ (physicalRadical ω B).comap (physicalSpace ω 1).subtype

instance (ω : ConformalVector A) (B : LinearMap.BilinForm k V) :
    LieRing (physicalLieAlgebra ω B) := sorry
instance (ω : ConformalVector A) (B : LinearMap.BilinForm k V) :
    LieAlgebra k (physicalLieAlgebra ω B) := sorry

namespace physicalLieAlgebra

variable (ω : ConformalVector A) (B : LinearMap.BilinForm k V)

/-- The quotient map `P¹ → P¹ ⧸ N`. -/
noncomputable def mk : physicalSpace ω 1 →ₗ[k] physicalLieAlgebra ω B := sorry

@[simp] theorem bracket_mk (u v : physicalSpace ω 1) :
    ⁅mk ω B u, mk ω B v⁆ = mk ω B ⟨A.nprod u 0 v, zeroMode_mem_physicalSpace ω u.2 v.2⟩ := sorry

/-- The induced invariant form. -/
noncomputable def form : LinearMap.BilinForm k (physicalLieAlgebra ω B) := sorry

theorem form_lie (hB : IsInvariantForm ω 1 B) (x y z : physicalLieAlgebra ω B) :
    form ω B ⁅x, y⁆ z = -form ω B y ⁅x, z⁆ := sorry

/-- The Lie algebra involution induced by `θ`. -/
noncomputable def involution (θ : A.Aut) (hθ : θ ω.ω = ω.ω) :
    physicalLieAlgebra ω B ≃ₗ⁅k⁆ physicalLieAlgebra ω B := sorry

/-- The graded piece of degree `r` for a grading `deg` of `V`. -/
noncomputable def gradedPiece {Γ : Type*} [AddCommGroup Γ] (deg : Γ → Submodule k V) (r : Γ) :
    Submodule k (physicalLieAlgebra ω B) := sorry

/-- Automorphisms preserving `ω` and the form act by Lie algebra automorphisms. -/
noncomputable def map (g : A.Aut) (hg : g ∈ Aut.conformal ω) (hgB : ∀ u v, B (g u) (g v) = B u v) :
    physicalLieAlgebra ω B ≃ₗ⁅k⁆ physicalLieAlgebra ω B := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.physicalLieAlgebra.form_nondegenerate`: the induced form
is nondegenerate. -/
example (hB : IsInvariantForm ω 1 B) : (form ω B).Nondegenerate := sorry

end physicalLieAlgebra

/-- Unit test `TauCeti.QSeries.VertexAlgebra.physicalLieAlgebra.trivial`: for the one-dimensional
vertex algebra, `g(V) = 0`. -/
example (ω : ConformalVector (unit ℚ)) (B : LinearMap.BilinForm ℚ ℚ) :
    Subsingleton (physicalLieAlgebra ω B) := sorry

end VertexAlgebra

section NoGhost

variable {W : Type*} [AddCommGroup W] [Module ℝ W]

theorem II11.nondegenerate : ∀ x : Fin 2 → ℤ, (∀ y, II11.form x y = 0) → x = 0 := sorry

/-- The invariant form on `V_{II_{1,1}}` normalized by `(1, 1) = -1`. -/
noncomputable def II11Form (ε : II11.Cocycle) : LinearMap.BilinForm ℝ (LatticeFock ℝ (Fin 2 → ℤ)) :=
  sorry

/-- `V ⊗ V_{II_{1,1}}`. -/
noncomputable def noGhostVA (V : VertexOperatorAlgebra ℝ W) (ε : II11.Cocycle) :
    VertexAlgebra ℝ (W ⊗[ℝ] LatticeFock ℝ (Fin 2 → ℤ)) :=
  V.toVertexAlgebra.tensorProduct (latticeVertexAlgebra II11 ε)

/-- Its conformal vector (central charge `c + 2`). -/
noncomputable def noGhostConformal (V : VertexOperatorAlgebra ℝ W) (ε : II11.Cocycle) :
    ConformalVector (noGhostVA V ε) :=
  V.conformal.tensor (latticeVertexAlgebra.conformalVector II11 ε II11.nondegenerate)

/-- The product form on `V ⊗ V_{II_{1,1}}`. -/
noncomputable def noGhostForm (_V : VertexOperatorAlgebra ℝ W) (B : LinearMap.BilinForm ℝ W)
    (ε : II11.Cocycle) : LinearMap.BilinForm ℝ (W ⊗[ℝ] LatticeFock ℝ (Fin 2 → ℤ)) :=
  B.tmul (II11Form ε)

/-- The involution `id ⊗ θ`. -/
noncomputable def noGhostInvolution (V : VertexOperatorAlgebra ℝ W) (ε : II11.Cocycle) :
    (noGhostVA V ε).Aut := sorry

/-- The subspace of `II_{1,1}`-degree `r`. -/
noncomputable def tensorDegree (r : Fin 2 → ℤ) : Submodule ℝ (W ⊗[ℝ] LatticeFock ℝ (Fin 2 → ℤ)) :=
  sorry

/-- The physical states `P¹_r`. -/
noncomputable def noGhostPhysical (V : VertexOperatorAlgebra ℝ W) (ε : II11.Cocycle)
    (r : Fin 2 → ℤ) : Submodule ℝ (W ⊗[ℝ] LatticeFock ℝ (Fin 2 → ℤ)) :=
  VertexAlgebra.physicalSpace (noGhostConformal V ε) 1 ⊓ tensorDegree r

/-- The null space of the contravariant form on `P¹_r`. -/
noncomputable def noGhostNull (V : VertexOperatorAlgebra ℝ W) (B : LinearMap.BilinForm ℝ W)
    (ε : II11.Cocycle) (r : Fin 2 → ℤ) : Submodule ℝ (noGhostPhysical V ε r) := sorry

/-- `P¹_r / N_r`. -/
def noGhostQuotient (V : VertexOperatorAlgebra ℝ W) (B : LinearMap.BilinForm ℝ W)
    (ε : II11.Cocycle) (r : Fin 2 → ℤ) : Type _ :=
  noGhostPhysical V ε r ⧸ noGhostNull V B ε r

noncomputable instance (V : VertexOperatorAlgebra ℝ W) (B : LinearMap.BilinForm ℝ W) (ε : II11.Cocycle)
    (r : Fin 2 → ℤ) : AddCommGroup (noGhostQuotient V B ε r) :=
  inferInstanceAs (AddCommGroup (noGhostPhysical V ε r ⧸ noGhostNull V B ε r))
noncomputable instance (V : VertexOperatorAlgebra ℝ W) (B : LinearMap.BilinForm ℝ W) (ε : II11.Cocycle)
    (r : Fin 2 → ℤ) : Module ℝ (noGhostQuotient V B ε r) :=
  inferInstanceAs (Module ℝ (noGhostPhysical V ε r ⧸ noGhostNull V B ε r))

/-- The action of `G` on `P¹_r / N_r` through `V`. -/
noncomputable def noGhostQuotient.action {G : Type*} [Group G] (V : VertexOperatorAlgebra ℝ W)
    (B : LinearMap.BilinForm ℝ W) (ε : II11.Cocycle) (r : Fin 2 → ℤ) (ρ : G →* V.Aut) :
    G →* (noGhostQuotient V B ε r ≃ₗ[ℝ] noGhostQuotient V B ε r) := sorry

/-- The action of `G` on a weight space. -/
noncomputable def VertexOperatorAlgebra.weightAction {G : Type*} [Group G]
    (V : VertexOperatorAlgebra ℝ W) (ρ : G →* V.Aut) (n : ℤ) :
    G →* (V.weightSpace n ≃ₗ[ℝ] V.weightSpace n) := sorry

/-- Node `no-ghost-theorem` (Goddard–Thorn; Borcherds Theorem 5.1; Jurisich 1998 Theorem 6.2),
case `r ≠ 0`. The steps are nodes `no-ghost-operator-adjoints`, `…-transverse-generation`,
`…-transverse-space`, `…-spurious-states` and `…-physical-decomposition`. -/
theorem no_ghost (V : VertexOperatorAlgebra ℝ W) (B : LinearMap.BilinForm ℝ W) (ε : II11.Cocycle)
    (hc : V.conformal.c = 24) (hnn : V.IsNonnegGraded)
    (h0 : Module.finrank ℝ (V.weightSpace 0) = 1)
    (hB : VertexAlgebra.IsInvariantForm V.conformal 1 B) (hnd : B.Nondegenerate)
    {G : Type*} [Group G] (ρ : G →* V.Aut)
    (hρ : ∀ (g : G) (u v : W), B ((ρ g : V.toVertexAlgebra.Aut) u) ((ρ g : V.toVertexAlgebra.Aut) v) =
      B u v)
    (r : Fin 2 → ℤ) (hr : r ≠ 0) :
    ∃ e : noGhostQuotient V B ε r ≃ₗ[ℝ] V.weightSpace (1 - II11.form r r / 2),
      ∀ g : G, (noGhostQuotient.action V B ε r ρ g).trans e =
        e.trans (V.weightAction ρ (1 - II11.form r r / 2) g) := sorry

/-- Node `no-ghost-theorem`, case `r = 0`: `P¹₀ / N₀ ≃ V₁ ⊕ ℝ²`. -/
theorem no_ghost_zero (V : VertexOperatorAlgebra ℝ W) (B : LinearMap.BilinForm ℝ W)
    (ε : II11.Cocycle) (hc : V.conformal.c = 24) (hnn : V.IsNonnegGraded)
    (h0 : Module.finrank ℝ (V.weightSpace 0) = 1)
    (hB : VertexAlgebra.IsInvariantForm V.conformal 1 B) (hnd : B.Nondegenerate) :
    Nonempty (noGhostQuotient V B ε 0 ≃ₗ[ℝ] (V.weightSpace 1 × (Fin 2 → ℝ))) := sorry

end NoGhost

/-! ### Moonshine modules and the Monster Lie algebra -/

section Moonshine

variable {W : Type*} [AddCommGroup W] [Module ℝ W]

/-- Borcherds' properties (1)–(2) of a moonshine module. -/
structure IsMoonshineModule (V : VertexOperatorAlgebra ℝ W) (B : LinearMap.BilinForm ℝ W) :
    Prop where
  centralCharge : V.conformal.c = 24
  invariant : VertexAlgebra.IsInvariantForm V.conformal 1 B
  posDef : ∀ w : W, w ≠ 0 → 0 < B w w
  nonneg : V.IsNonnegGraded
  gradedDimension : V.mckayThompsonSeries 1 (fun _ _ hw ↦ hw) = JLaurentSeries.map (Int.castRingHom ℝ)

namespace IsMoonshineModule

variable {V : VertexOperatorAlgebra ℝ W} {B : LinearMap.BilinForm ℝ W}

@[simp] theorem mckayThompsonSeries_one (h : IsMoonshineModule V B) :
    V.mckayThompsonSeries 1 (fun _ _ hw ↦ hw) = JLaurentSeries.map (Int.castRingHom ℝ) :=
  h.gradedDimension

@[simp] theorem finrank_weightSpace (h : IsMoonshineModule V B) (n : ℤ) (hn : -1 ≤ n) :
    (Module.finrank ℝ (V.weightSpace (n + 1)) : ℤ) = JLaurentSeries.coeff n := sorry

theorem weightSpace_zero (h : IsMoonshineModule V B) :
    V.weightSpace 0 = Submodule.span ℝ {V.toVertexAlgebra.vac} := sorry

@[simp] theorem weightSpace_one (h : IsMoonshineModule V B) : V.weightSpace 1 = ⊥ := sorry

/-- The conformal automorphisms preserving the form. -/
def formAut (V : VertexOperatorAlgebra ℝ W) (B : LinearMap.BilinForm ℝ W) : Subgroup V.Aut := sorry

theorem noGhostHypotheses (h : IsMoonshineModule V B) :
    Module.finrank ℝ (V.weightSpace 0) = 1 ∧ B.Nondegenerate ∧ V.conformal.c = 24 := sorry

/-- Unit test `TauCeti.QSeries.IsMoonshineModule.finrank_weightSpace_two`: `dim V₂ = 196884`,
`dim V₃ = 21493760`. -/
example (h : IsMoonshineModule V B) :
    Module.finrank ℝ (V.weightSpace 2) = 196884 ∧ Module.finrank ℝ (V.weightSpace 3) = 21493760 :=
  sorry

/-- Unit test `TauCeti.QSeries.IsMoonshineModule.weightSpace_neg`: `V_n = 0` for `n < 0`. -/
example (h : IsMoonshineModule V B) (n : ℤ) (hn : n < 0) : V.weightSpace n = ⊥ := h.nonneg n hn

/-- Unit test `TauCeti.QSeries.IsMoonshineModule.mckayThompsonSeries_one_coeff`: `T₁ = q⁻¹ + 196884 q
+ 21493760 q² + 864299970 q³ + ⋯`. -/
example (h : IsMoonshineModule V B) :
    (V.mckayThompsonSeries 1 (fun _ _ hw ↦ hw)).coeff (-1) = 1 ∧
    (V.mckayThompsonSeries 1 (fun _ _ hw ↦ hw)).coeff 0 = 0 ∧
    (V.mckayThompsonSeries 1 (fun _ _ hw ↦ hw)).coeff 1 = 196884 ∧
    (V.mckayThompsonSeries 1 (fun _ _ hw ↦ hw)).coeff 2 = 21493760 ∧
    (V.mckayThompsonSeries 1 (fun _ _ hw ↦ hw)).coeff 3 = 864299970 := sorry

end IsMoonshineModule

/-- Unit test `TauCeti.QSeries.IsMoonshineModule.not_heisenberg24`: the rank-24 Heisenberg vertex
operator algebra is not a moonshine module. -/
example (B : LinearMap.BilinForm ℝ (SymmetricAlgebra ℝ (ℕ →₀ (Fin 24 → ℝ)))) :
    ¬ IsMoonshineModule (heisenbergVOA ℝ 24) B := sorry

/-- The Monster Lie algebra `m(V) = g(V ⊗ V_{II_{1,1}})`. -/
def monsterLieAlgebra (V : VertexOperatorAlgebra ℝ W) (B : LinearMap.BilinForm ℝ W)
    (ε : II11.Cocycle) : Type _ :=
  VertexAlgebra.physicalLieAlgebra (noGhostConformal V ε) (noGhostForm V B ε)

noncomputable instance (V : VertexOperatorAlgebra ℝ W) (B : LinearMap.BilinForm ℝ W) (ε : II11.Cocycle) :
    LieRing (monsterLieAlgebra V B ε) :=
  inferInstanceAs (LieRing (VertexAlgebra.physicalLieAlgebra _ _))
noncomputable instance (V : VertexOperatorAlgebra ℝ W) (B : LinearMap.BilinForm ℝ W) (ε : II11.Cocycle) :
    LieAlgebra ℝ (monsterLieAlgebra V B ε) :=
  inferInstanceAs (LieAlgebra ℝ (VertexAlgebra.physicalLieAlgebra _ _))

namespace monsterLieAlgebra

variable (V : VertexOperatorAlgebra ℝ W) (B : LinearMap.BilinForm ℝ W) (ε : II11.Cocycle)

/-- The root space `m_r`, `r ∈ II_{1,1}`. -/
noncomputable def rootSpace (r : Fin 2 → ℤ) : Submodule ℝ (monsterLieAlgebra V B ε) := sorry

theorem isInternal_rootSpace : DirectSum.IsInternal (rootSpace V B ε) := sorry

/-- For `r = (a, b) ≠ 0`, `m_r ≃ V_{ab+1}`. -/
noncomputable def rootSpaceEquiv (hV : IsMoonshineModule V B) (r : Fin 2 → ℤ) (hr : r ≠ 0) :
    rootSpace V B ε r ≃ₗ[ℝ] V.weightSpace (r 0 * r 1 + 1) := sorry

@[simp] theorem finrank_rootSpace (hV : IsMoonshineModule V B) (r : Fin 2 → ℤ) :
    (Module.finrank ℝ (rootSpace V B ε r) : ℤ) =
      if r = 0 then 2 else JLaurentSeries.coeff (r 0 * r 1) := sorry

/-- The contravariant form `(x, y)₀ = -(x, θ y)`. -/
noncomputable def contravariantForm : LinearMap.BilinForm ℝ (monsterLieAlgebra V B ε) := sorry

theorem contravariantForm_pos (hV : IsMoonshineModule V B) (r : Fin 2 → ℤ) (hr : r ≠ 0)
    (x : monsterLieAlgebra V B ε) (hx : x ∈ rootSpace V B ε r) (hx0 : x ≠ 0) :
    0 < contravariantForm V B ε x x := sorry

/-- The Cartan element `1 ⊗ α(-1)1`. -/
noncomputable def cartanElement (α : Fin 2 → ℤ) : monsterLieAlgebra V B ε := sorry

@[simp] theorem cartan_act (α r : Fin 2 → ℤ) (x : monsterLieAlgebra V B ε)
    (hx : x ∈ rootSpace V B ε r) :
    ⁅cartanElement V B ε α, x⁆ = (II11.form α r : ℝ) • x := sorry

/-- The action of `G ≤ Aut(V, ω, (·,·))` by graded Lie algebra automorphisms (a group
homomorphism into the Lie algebra automorphisms). -/
noncomputable def action {G : Type*} [Group G] (ρ : G →* IsMoonshineModule.formAut V B) (g : G) :
    monsterLieAlgebra V B ε ≃ₗ⁅ℝ⁆ monsterLieAlgebra V B ε := sorry

/-- Unit test `TauCeti.QSeries.monsterLieAlgebra.finrank_one_one`: `dim m_{(1,1)} = 196884`,
`dim m_{(1,-1)} = 1`. -/
example (hV : IsMoonshineModule V B) :
    Module.finrank ℝ (rootSpace V B ε ![1, 1]) = 196884 ∧
      Module.finrank ℝ (rootSpace V B ε ![1, -1]) = 1 := sorry

/-- Unit test `TauCeti.QSeries.monsterLieAlgebra.rootSpace_eq_bot`: `m_{(a,b)} = 0` for `ab < -1`, and
`m_{(1,0)} = 0`. -/
example (hV : IsMoonshineModule V B) (r : Fin 2 → ℤ) (hr : r 0 * r 1 < -1) :
    rootSpace V B ε r = ⊥ ∧ rootSpace V B ε ![1, 0] = ⊥ := sorry

/-- Unit test `TauCeti.QSeries.monsterLieAlgebra.physical_not_quotient`: `P¹_{(1,0)} ≠ 0` although
`m_{(1,0)} = 0`. -/
example (hV : IsMoonshineModule V B) :
    noGhostPhysical V ε ![1, 0] ≠ ⊥ ∧ rootSpace V B ε ![1, 0] = ⊥ := sorry

attribute [local instance] LieRing.ofAssociativeRing LieAlgebra.ofAssociativeAlgebra in
/-- Unit test `TauCeti.QSeries.monsterLieAlgebra.gl2`: `m_{(-1,1)} ⊕ m_{(0,0)} ⊕ m_{(1,-1)} ≅ gl₂(ℝ)`. -/
example (hV : IsMoonshineModule V B) :
    ∃ S : LieSubalgebra ℝ (monsterLieAlgebra V B ε),
      S.toSubmodule = rootSpace V B ε ![-1, 1] ⊔ rootSpace V B ε 0 ⊔ rootSpace V B ε ![1, -1] ∧
      Nonempty (S ≃ₗ⁅ℝ⁆ Matrix (Fin 2) (Fin 2) ℝ) := sorry

end monsterLieAlgebra

end Moonshine
section PhysicalTests

/-- Unit test `TauCeti.QSeries.VertexAlgebra.physicalSpace_A1`: in `V_{A₁}`, `e^α`, `e^{-α}` and
`α(-1)1` lie in `P¹`. -/
example (ε : EvenLattice.A1.Cocycle) (hnd : ∀ x, (∀ y, EvenLattice.A1.form x y = 0) → x = 0) :
    latticeExp 1 ∈ VertexAlgebra.physicalSpace
        (latticeVertexAlgebra.conformalVector (k := ℚ) EvenLattice.A1 ε hnd) 1 ∧
      latticeExp (-1) ∈ VertexAlgebra.physicalSpace
        (latticeVertexAlgebra.conformalVector (k := ℚ) EvenLattice.A1 ε hnd) 1 ∧
      heisenbergVector 1 ∈ VertexAlgebra.physicalSpace
        (latticeVertexAlgebra.conformalVector (k := ℚ) EvenLattice.A1 ε hnd) 1 := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.physicalSpace_one_eq_weightSpace`: for a vertex operator
algebra of CFT type with a nondegenerate invariant form, `P¹ = V₁`. -/
example {k W : Type*} [Field k] [CharZero k] [AddCommGroup W] [Module k W]
    (V : VertexOperatorAlgebra k W) (hV : V.IsCFTType) (B : LinearMap.BilinForm k W)
    (hB : VertexAlgebra.IsInvariantForm V.conformal 1 B) (hnd : B.Nondegenerate) :
    VertexAlgebra.physicalSpace V.conformal 1 = V.weightSpace 1 := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.physicalLieAlgebra.A1_iso_sl2`: for `V_{A₁}`, `g(V)` is
three-dimensional and contains an `sl₂`-triple. -/
example (ε : EvenLattice.A1.Cocycle) (hnd : ∀ x, (∀ y, EvenLattice.A1.form x y = 0) → x = 0)
    (B : LinearMap.BilinForm ℚ (LatticeFock ℚ ℤ))
    (hB : VertexAlgebra.IsInvariantForm
      (latticeVertexAlgebra.conformalVector EvenLattice.A1 ε hnd) 1 B) (hBnd : B.Nondegenerate) :
    Module.finrank ℚ (VertexAlgebra.physicalLieAlgebra
        (latticeVertexAlgebra.conformalVector EvenLattice.A1 ε hnd) B) = 3 ∧
      ∃ e f h : VertexAlgebra.physicalLieAlgebra
        (latticeVertexAlgebra.conformalVector EvenLattice.A1 ε hnd) B, IsSl2Triple h e f := sorry

/-- Unit test `TauCeti.QSeries.VertexAlgebra.physicalLieAlgebra.radical_II11_ne_bot`: for
`V_{II_{1,1}}` the radical `N ⊆ P¹` is nonzero (it contains `D e^{(1,0)}`). -/
example (ε : II11.Cocycle) (B : LinearMap.BilinForm ℚ (LatticeFock ℚ (Fin 2 → ℤ))) :
    ∃ p ∈ VertexAlgebra.physicalRadical
      (latticeVertexAlgebra.conformalVector (k := ℚ) II11 ε II11.nondegenerate) B, p ≠ 0 := sorry

end PhysicalTests
/-! ### Borcherds algebras and free Lie algebras -/

/-- Borcherds' conditions (C1)–(C3) on a real matrix. -/
def IsBorcherdsMatrix {I : Type*} (A : Matrix I I ℝ) : Prop :=
  A.IsSymm ∧ (∀ i j, i ≠ j → A i j ≤ 0) ∧ ∀ i j, 0 < A i i → ∃ n : ℤ, 2 * A i j / A i i = n

/-- The ideal of relations of the Borcherds algebra `g(A)` in the free Lie algebra on
`e_i` (`Sum.inl`), `f_i` (`Sum.inr ∘ Sum.inl`), `h_i` (`Sum.inr ∘ Sum.inr`). -/
noncomputable def BorcherdsAlgebra.relations {I : Type*} (A : Matrix I I ℝ) :
    LieIdeal ℝ (FreeLieAlgebra ℝ (I ⊕ I ⊕ I)) := sorry

/-- The Borcherds (generalized Kac–Moody) algebra of a matrix. -/
def BorcherdsAlgebra {I : Type*} (A : Matrix I I ℝ) : Type _ :=
  FreeLieAlgebra ℝ (I ⊕ I ⊕ I) ⧸ BorcherdsAlgebra.relations A

namespace BorcherdsAlgebra

variable {I : Type*} (A : Matrix I I ℝ)

noncomputable instance : LieRing (BorcherdsAlgebra A) :=
  inferInstanceAs (LieRing (FreeLieAlgebra ℝ (I ⊕ I ⊕ I) ⧸ relations A))
noncomputable instance : LieAlgebra ℝ (BorcherdsAlgebra A) :=
  inferInstanceAs (LieAlgebra ℝ (FreeLieAlgebra ℝ (I ⊕ I ⊕ I) ⧸ relations A))

/-- The generator `e_i`. -/
noncomputable def e (i : I) : BorcherdsAlgebra A :=
  (LieSubmodule.Quotient.mk (FreeLieAlgebra.of ℝ (Sum.inl i)) :
    FreeLieAlgebra ℝ (I ⊕ I ⊕ I) ⧸ relations A)
/-- The generator `f_i`. -/
noncomputable def f (i : I) : BorcherdsAlgebra A :=
  (LieSubmodule.Quotient.mk (FreeLieAlgebra.of ℝ (Sum.inr (Sum.inl i))) :
    FreeLieAlgebra ℝ (I ⊕ I ⊕ I) ⧸ relations A)
/-- The generator `h_i`. -/
noncomputable def h (i : I) : BorcherdsAlgebra A :=
  (LieSubmodule.Quotient.mk (FreeLieAlgebra.of ℝ (Sum.inr (Sum.inr i))) :
    FreeLieAlgebra ℝ (I ⊕ I ⊕ I) ⧸ relations A)

@[simp] theorem lie_e_f [DecidableEq I] (i j : I) :
    ⁅e A i, f A j⁆ = if i = j then h A i else 0 := sorry

/-- The root space of degree `α ∈ ⊕ ℤ αᵢ`. -/
noncomputable def rootSpace (α : I →₀ ℤ) : Submodule ℝ (BorcherdsAlgebra A) := sorry

theorem rootGrading [DecidableEq I] : DirectSum.IsInternal (rootSpace A) := sorry

/-- The Chevalley involution `eᵢ ↦ -fᵢ`, `fᵢ ↦ -eᵢ`, `hᵢ ↦ -hᵢ`. -/
noncomputable def chevalleyInvolution : BorcherdsAlgebra A ≃ₗ⁅ℝ⁆ BorcherdsAlgebra A := sorry

/-- Comparison with Mathlib's Serre construction for a symmetric generalized Cartan matrix. -/
noncomputable def equivToLieAlgebra [DecidableEq I] (CM : Matrix I I ℤ) (hCM : ∀ i, CM i i = 2) :
    BorcherdsAlgebra (CM.map ((↑) : ℤ → ℝ)) ≃ₗ⁅ℝ⁆ Matrix.ToLieAlgebra ℝ CM := sorry

/-- The positive part `n⁺`, generated by the `eᵢ`. -/
noncomputable def positivePart : LieSubalgebra ℝ (BorcherdsAlgebra A) :=
  LieSubalgebra.lieSpan ℝ _ (Set.range (e A))

/-- The negative part `n⁻`, generated by the `fᵢ`. -/
noncomputable def negativePart : LieSubalgebra ℝ (BorcherdsAlgebra A) :=
  LieSubalgebra.lieSpan ℝ _ (Set.range (f A))

/-- The subalgebra `u⁺` generated by the `(ad e_{i₁} ⋯ ad e_{iₖ})(e_j)` with real `iₗ` and
imaginary `j`. -/
noncomputable def uPlus : LieSubalgebra ℝ (BorcherdsAlgebra A) :=
  LieSubalgebra.lieSpan ℝ _ {x | ∃ j, A j j ≤ 0 ∧ ∃ l : List I, (∀ i ∈ l, 0 < A i i) ∧
    x = (l.map fun i ↦ LieAlgebra.ad ℝ (BorcherdsAlgebra A) (e A i)).prod (e A j)}

/-- Node `borcherds-algebra-triangular-decomposition`. -/
theorem triangular_decomposition (hA : IsBorcherdsMatrix A) :
    LinearIndependent ℝ (h A) ∧
      (negativePart A).toSubmodule ⊔ Submodule.span ℝ (Set.range (h A)) ⊔
        (positivePart A).toSubmodule = ⊤ ∧
      Disjoint (negativePart A).toSubmodule
        (Submodule.span ℝ (Set.range (h A)) ⊔ (positivePart A).toSubmodule) := sorry

/-- Unit test `TauCeti.QSeries.BorcherdsAlgebra.heisenberg`: `g((0))` is three-dimensional with `h`
central. -/
example : Module.finrank ℝ (BorcherdsAlgebra !![(0 : ℝ)]) = 3 ∧
    ∀ x : BorcherdsAlgebra !![(0 : ℝ)], ⁅h !![(0 : ℝ)] 0, x⁆ = 0 := sorry

attribute [local instance] LieRing.ofAssociativeRing LieAlgebra.ofAssociativeAlgebra in
/-- Unit test `TauCeti.QSeries.BorcherdsAlgebra.sl2`: `g((2)) ≅ sl₂(ℝ)`. -/
example : Nonempty (BorcherdsAlgebra !![(2 : ℝ)] ≃ₗ⁅ℝ⁆ LieAlgebra.SpecialLinear.sl (Fin 2) ℝ) :=
  sorry

/-- Unit test `TauCeti.QSeries.BorcherdsAlgebra.empty`: for `I = ∅`, `g(A) = 0`. -/
example (A₀ : Matrix Empty Empty ℝ) : Subsingleton (BorcherdsAlgebra A₀) := sorry

/-- Unit test `TauCeti.QSeries.BorcherdsAlgebra.no_serre_imaginary`: imaginary simple roots obey no
Serre relation. -/
example (n : ℕ) :
    ((LieAlgebra.ad ℝ _ (e !![(-1 : ℝ), -1; -1, -1] 0)) ^ n) (e !![(-1 : ℝ), -1; -1, -1] 1) ≠ 0 :=
  sorry

/-! #### The canonical central extension -/

/-- Relations of the universal algebra `ĝ(A)` (generators `e_i`, `f_i`, `h_ij`). -/
noncomputable def universalRelations (A : Matrix I I ℝ) :
    LieIdeal ℝ (FreeLieAlgebra ℝ (I ⊕ I ⊕ (I × I))) := sorry

/-- The canonical central extension `ĝ(A)`. -/
def Universal (A : Matrix I I ℝ) : Type _ := FreeLieAlgebra ℝ (I ⊕ I ⊕ (I × I)) ⧸ universalRelations A

noncomputable instance : LieRing (Universal A) :=
  inferInstanceAs (LieRing (FreeLieAlgebra ℝ (I ⊕ I ⊕ (I × I)) ⧸ universalRelations A))
noncomputable instance : LieAlgebra ℝ (Universal A) :=
  inferInstanceAs (LieAlgebra ℝ (FreeLieAlgebra ℝ (I ⊕ I ⊕ (I × I)) ⧸ universalRelations A))

/-- The generator `h_ij`. -/
noncomputable def Universal.hh (i j : I) : Universal A :=
  (LieSubmodule.Quotient.mk (FreeLieAlgebra.of ℝ (Sum.inr (Sum.inr (i, j)))) :
    FreeLieAlgebra ℝ (I ⊕ I ⊕ (I × I)) ⧸ universalRelations A)

@[simp] theorem Universal.hh_eq_zero (i j : I) (hij : ∃ l, A l i ≠ A l j) : Universal.hh A i j = 0 :=
  sorry

/-- `c = span {h_ij : i ≠ j}`. -/
noncomputable def Universal.center : LieIdeal ℝ (Universal A) :=
  LieSubmodule.lieSpan ℝ _ {x | ∃ i j, i ≠ j ∧ x = Universal.hh A i j}

/-- `ĝ(A)/c ≃ g(A)`. -/
noncomputable def Universal.quotientEquiv :
    (Universal A ⧸ Universal.center A) ≃ₗ⁅ℝ⁆ BorcherdsAlgebra A := sorry

/-- The invariant form pulled back from `g(A)`. -/
noncomputable def Universal.invariantForm : LinearMap.BilinForm ℝ (Universal A) := sorry

/-- Unit test `TauCeti.QSeries.BorcherdsAlgebra.Universal.kacMoody`: if all `aᵢᵢ > 0` then `c = 0`. -/
example (hA : ∀ i, 0 < A i i) (hA' : IsBorcherdsMatrix A)
    (hcol : ∀ i j, i ≠ j → ∃ l, A l i ≠ A l j) : Universal.center A = ⊥ := sorry

/-- Unit test `TauCeti.QSeries.BorcherdsAlgebra.Universal.hh_ne_zero`: for `[[-2,-2],[-2,-2]]`,
`h₁₂ ≠ 0` and `h₁₂` is central. -/
example : Universal.hh !![(-2 : ℝ), -2; -2, -2] 0 1 ≠ 0 ∧
    ∀ x : Universal !![(-2 : ℝ), -2; -2, -2], ⁅Universal.hh !![(-2 : ℝ), -2; -2, -2] 0 1, x⁆ = 0 := sorry

/-- Unit test `TauCeti.QSeries.BorcherdsAlgebra.Universal.center_ne_c`: for `A = (0)`, `c = 0` but the
centre is nonzero. -/
example : Universal.center !![(0 : ℝ)] = ⊥ ∧
    ∃ x : Universal !![(0 : ℝ)], x ≠ 0 ∧ ∀ y : Universal !![(0 : ℝ)], ⁅x, y⁆ = 0 := sorry

/-- Unit test `TauCeti.QSeries.BorcherdsAlgebra.Universal.quotient_mk_hh`: `h_ii ↦ h_i`, `h_ij ↦ 0`. -/
example [DecidableEq I] (i j : I) (hij : i ≠ j) :
    Universal.quotientEquiv A (LieSubmodule.Quotient.mk (Universal.hh A i i)) = h A i ∧
      Universal.quotientEquiv A (LieSubmodule.Quotient.mk (Universal.hh A i j)) = 0 := sorry

end BorcherdsAlgebra

/-- Node `borcherds-characterisation-theorem` (Borcherds; Jurisich 1998 Theorem 4.1). -/
theorem borcherds_characterisation (g : Type*) [LieRing g] [LieAlgebra ℝ g]
    (gr : ℤ → Submodule ℝ g) (ω : g ≃ₗ⁅ℝ⁆ g) (B : LinearMap.BilinForm ℝ g)
    (h1 : DirectSum.IsInternal gr) (h1f : ∀ i, i ≠ 0 → FiniteDimensional ℝ (gr i))
    (h1g : ∀ i j x y, x ∈ gr i → y ∈ gr j → ⁅x, y⁆ ∈ gr (i + j))
    (h1d : ∀ i, i ≠ 0 → Submodule.span ℝ {x | x ∈ gr i ∧ ∀ c ∈ gr 0, ∃ t : ℝ, ⁅c, x⁆ = t • x} = gr i)
    (h2 : ∀ x, ω (ω x) = x) (h2g : ∀ i x, x ∈ gr i → ω x ∈ gr (-i)) (h2z : ∀ x ∈ gr 0, ω x = -x)
    (h3s : ∀ x y, B x y = B y x) (h3i : ∀ x y z, B ⁅x, y⁆ z = B x ⁅y, z⁆)
    (h3ω : ∀ x y, B (ω x) (ω y) = B x y) (h3o : ∀ i j x y, x ∈ gr i → y ∈ gr j → i + j ≠ 0 → B x y = 0)
    (h3p : ∀ m x, m ≠ 0 → x ∈ gr m → x ≠ 0 → 0 < -B x (ω x))
    (h4 : ∀ x ∈ gr 0, x ∈ Submodule.span ℝ {z | ∃ a b : g, z = ⁅a, b⁆}) :
    ∃ (I : Type) (A : Matrix I I ℝ), IsBorcherdsMatrix A ∧
      ∃ π : BorcherdsAlgebra.Universal A →ₗ⁅ℝ⁆ g, Function.Surjective π ∧
        ∀ x, π x = 0 → ∀ y : BorcherdsAlgebra.Universal A, ⁅x, y⁆ = 0 := sorry

/-- Node `lazard-elimination`. -/
theorem lazard_elimination (X : Type*) (S : Set X) :
    ∃ φ : FreeLieAlgebra ℝ (List S × {x : X // x ∉ S}) →ₗ⁅ℝ⁆ FreeLieAlgebra ℝ X,
      Function.Injective φ ∧
      φ.range = LieIdeal.toLieSubalgebra ℝ _
        (LieSubmodule.lieSpan ℝ (FreeLieAlgebra ℝ X) (FreeLieAlgebra.of ℝ '' Sᶜ)) ∧
      IsCompl (LieSubalgebra.lieSpan ℝ (FreeLieAlgebra ℝ X) (FreeLieAlgebra.of ℝ '' S)).toSubmodule
        (LieSubmodule.lieSpan ℝ (FreeLieAlgebra ℝ X) (FreeLieAlgebra.of ℝ '' Sᶜ)).toSubmodule := sorry

/-- Node `graded-trace-exterior-symmetric-power` (a), exterior powers:
`Σ (-1)ⁿ tr(g | Λⁿ U) tⁿ = exp(-Σ_{m ≥ 1} tr(gᵐ) tᵐ / m)`. -/
theorem trace_exteriorPower_generating {k U : Type*} [Field k] [CharZero k] [AddCommGroup U]
    [Module k U] [FiniteDimensional k U] (g : Module.End k U) :
    PowerSeries.mk (fun n ↦ (-1 : k) ^ n * LinearMap.trace k _ (exteriorPower.map n g)) =
      (PowerSeries.exp k).subst
        (-(PowerSeries.mk fun m ↦ if m = 0 then 0 else LinearMap.trace k U (g ^ m) / m)) := sorry

/-- `exp(-Σ_{i ≥ 1} ψⁱ(F i) / i)` in `k⟦p, q⟧`, where `ψⁱ` substitutes `p ↦ pⁱ`, `q ↦ qⁱ` and `F i`
is the character of `gⁱ` (the Adams-operation exponential of node
`graded-trace-exterior-symmetric-power` (b)); `F i` has no constant term. -/
noncomputable def adamsExpNeg {k : Type*} [Field k] [CharZero k]
    (F : ℕ → MvPowerSeries (Fin 2) k) : MvPowerSeries (Fin 2) k := sorry

/-- The degree-`d` part of a free Lie algebra with graded generators. -/
noncomputable def freeLieDegree {X : Type*} (deg : X → Fin 2 →₀ ℕ) (d : Fin 2 →₀ ℕ) :
    Submodule ℚ (FreeLieAlgebra ℚ X) := sorry

/-- Node `free-lie-algebra-character-formula` (case `g = 1`; Jurisich 1998 Proposition 5.1):
`Π_d (1 - e^d)^{dim L_d} = 1 - Σ_x e^{deg x}`. -/
theorem freeLie_character {X : Type*} (deg : X → Fin 2 →₀ ℕ) (hdeg : ∀ x, deg x ≠ 0)
    (hfin : ∀ d, (deg ⁻¹' {d}).Finite) :
    adamsExpNeg (fun _ ↦ show MvPowerSeries (Fin 2) ℚ from
        fun d ↦ (Module.finrank ℚ (freeLieDegree deg d) : ℚ)) =
      1 - show MvPowerSeries (Fin 2) ℚ from fun d ↦ ((deg ⁻¹' {d}).ncard : ℚ) := sorry

/-- Node `borcherds-algebra-free-subalgebra` (Jurisich 1998 Theorem 5.1). -/
theorem borcherds_free_subalgebra {I : Type*} (A : Matrix I I ℝ) (hA : IsBorcherdsMatrix A)
    (himag : ∀ i j, i ≠ j → A i i ≤ 0 → A j j ≤ 0 → A i j < 0) :
    ∃ (X : Type) (φ : FreeLieAlgebra ℝ X →ₗ⁅ℝ⁆ BorcherdsAlgebra A),
      Function.Injective φ ∧ φ.range = BorcherdsAlgebra.uPlus A := sorry

/-- The index set of Jurisich's matrix: `none` is the real simple root `(1,-1)`, `some ⟨n, k⟩` the
`k`-th copy of the imaginary simple root `(1, n+1)`. -/
def MonsterSimpleRoot : Type := Option (Σ n : ℕ, Fin (JLaurentSeries.coeff (n + 1)).toNat)

/-- The degree in `II_{1,1}` of a simple root. -/
def MonsterSimpleRoot.degree : MonsterSimpleRoot → Fin 2 → ℤ
  | none => ![1, -1]
  | some ⟨n, _⟩ => ![1, (n : ℤ) + 1]

/-- Jurisich's matrix `M`, with entries `⟨(1,i),(1,j)⟩ = -(i + j)`. -/
noncomputable def jurisichMatrix : Matrix MonsterSimpleRoot MonsterSimpleRoot ℝ :=
  fun a b ↦ (II11.form a.degree b.degree : ℝ)

section MonsterStructure

variable {W : Type*} [AddCommGroup W] [Module ℝ W] (V : VertexOperatorAlgebra ℝ W)
  (B : LinearMap.BilinForm ℝ W) (ε : II11.Cocycle)

/-- Node `monster-lie-algebra-is-borcherds-algebra` (Borcherds Theorem 6.2). -/
theorem monsterLieAlgebra_isBorcherds (hV : IsMoonshineModule V B) :
    ∃ (I : Type) (A : Matrix I I ℝ), IsBorcherdsMatrix A ∧
      Nonempty ((BorcherdsAlgebra A ⧸ LieAlgebra.center ℝ (BorcherdsAlgebra A)) ≃ₗ⁅ℝ⁆
        monsterLieAlgebra V B ε) := sorry

/-- Node `monster-lie-algebra-simple-roots` (Borcherds Theorem 7.2): `m ≅ g(M)/c`. -/
theorem monsterLieAlgebra_simpleRoots (hV : IsMoonshineModule V B) :
    IsBorcherdsMatrix jurisichMatrix ∧
      Nonempty ((BorcherdsAlgebra jurisichMatrix ⧸ LieAlgebra.center ℝ (BorcherdsAlgebra jurisichMatrix))
        ≃ₗ⁅ℝ⁆ monsterLieAlgebra V B ε) := sorry

/-- Node `monster-lie-algebra-free-decomposition`: `u⁻` is free on generators of degree `-(a,b)`,
with `c(a+b-1)` generators in each degree (as `Aut`-modules `W_{-(a,b)} ≅ V_{a+b}`). -/
theorem monsterLieAlgebra_uMinus_free (hV : IsMoonshineModule V B) :
    ∃ (X : Type) (deg : X → Fin 2 → ℤ) (φ : FreeLieAlgebra ℝ X →ₗ⁅ℝ⁆ monsterLieAlgebra V B ε),
      Function.Injective φ ∧
      (∀ x, 1 ≤ -deg x 0 ∧ 1 ≤ -deg x 1 ∧
        φ (FreeLieAlgebra.of ℝ x) ∈ monsterLieAlgebra.rootSpace V B ε (deg x)) ∧
      (∀ a b : ℤ, 1 ≤ a → 1 ≤ b →
        (Nat.card {x // deg x = ![-a, -b]} : ℤ) = JLaurentSeries.coeff (a + b - 1)) ∧
      φ.range.toSubmodule = ⨆ (a : ℤ) (b : ℤ) (_ : 1 ≤ a) (_ : 1 ≤ b),
        monsterLieAlgebra.rootSpace V B ε ![-a, -b] := sorry

/-- Node `twisted-denominator-identity` (Borcherds (8.3)), in the form
`exp(-Σ_i ψⁱ(Σ_{a,b ≥ 1} c_{gⁱ}(ab) pᵃ qᵇ)/i) = 1 - Σ_{a,b ≥ 1} c_g(a+b-1) pᵃ qᵇ`, equivalent to
`p⁻¹ exp(-Σ_i Σ_{m ≥ 1, n} c_{gⁱ}(mn) p^{mi} q^{ni}/i) = T_g(p) - T_g(q)`. -/
theorem twisted_denominator_identity (hV : IsMoonshineModule V B)
    (g : IsMoonshineModule.formAut V B) :
    adamsExpNeg (fun i ↦ show MvPowerSeries (Fin 2) ℝ from fun e ↦
        if 1 ≤ e 0 ∧ 1 ≤ e 1 then
          (V.mckayThompsonAut ((g : V.Aut) ^ i)).coeff ((e 0 : ℤ) * e 1) else 0) =
      1 - show MvPowerSeries (Fin 2) ℝ from fun e ↦
        if 1 ≤ e 0 ∧ 1 ≤ e 1 then (V.mckayThompsonAut (g : V.Aut)).coeff ((e 0 : ℤ) + e 1 - 1)
        else 0 := sorry

end MonsterStructure
/-! ### Replication -/

section Replication

variable {k : Type*} [Field k] [CharZero k]

/-- The replication identity of a family `F` at index `s`, in the form
`exp(-Σ_i ψⁱ(Σ_{a,b ≥ 1} a_{si}(ab) pᵃqᵇ)/i) = 1 - Σ_{a,b ≥ 1} a_s(a+b-1) pᵃqᵇ`. -/
def ReplicationIdentity (F : ℕ → LaurentSeries k) (s : ℕ) : Prop :=
  adamsExpNeg (fun i ↦ show MvPowerSeries (Fin 2) k from fun e ↦
      if 1 ≤ e 0 ∧ 1 ≤ e 1 then (F (s * i)).coeff ((e 0 : ℤ) * e 1) else 0) =
    1 - show MvPowerSeries (Fin 2) k from fun e ↦
      if 1 ≤ e 0 ∧ 1 ≤ e 1 then (F s).coeff ((e 0 : ℤ) + e 1 - 1) else 0

/-- Replication families. -/
def IsReplicationFamily (F : ℕ → LaurentSeries k) : Prop :=
  ∀ s : ℕ, 1 ≤ s → IsNormalizedQSeries (F s) ∧ ReplicationIdentity F s

/-- Completely replicable normalized `q`-series. -/
def IsCompletelyReplicable (f : LaurentSeries k) : Prop :=
  ∃ F : ℕ → LaurentSeries k, IsReplicationFamily F ∧ F 1 = f

theorem IsReplicationFamily.comp_mul {F : ℕ → LaurentSeries k} (hF : IsReplicationFamily F)
    (t : ℕ) (ht : 1 ≤ t) : IsReplicationFamily (fun s ↦ F (t * s)) := sorry

theorem IsReplicationFamily.coeff_four {F : ℕ → LaurentSeries k} (hF : IsReplicationFamily F)
    (s : ℕ) (hs : 1 ≤ s) :
    (F s).coeff 4 = (F s).coeff 3 + ((F s).coeff 1 ^ 2 - (F (2 * s)).coeff 1) / 2 := sorry

/-- Node `replication-recursion` (a), the case `4k` of Borcherds' (9.1). -/
theorem replication_recursion_four {F : ℕ → LaurentSeries k} (hF : IsReplicationFamily F)
    (s : ℕ) (hs : 1 ≤ s) (m : ℕ) (hm : 1 ≤ m) :
    (F s).coeff (4 * m) = (F s).coeff (2 * m + 1) + ((F s).coeff m ^ 2 - (F (2 * s)).coeff m) / 2 +
      ∑ j ∈ Finset.Ico 1 m, (F s).coeff j * (F s).coeff (2 * m - j) := sorry

/-- Node `replication-recursion` (b): a replication family is determined by the coefficients at
`q¹, q², q³, q⁵` of all its members. -/
theorem replication_determined {F F' : ℕ → LaurentSeries k} (hF : IsReplicationFamily F)
    (hF' : IsReplicationFamily F')
    (h : ∀ s : ℕ, 1 ≤ s → ∀ n ∈ ({1, 2, 3, 5} : Finset ℤ), (F s).coeff n = (F' s).coeff n) :
    ∀ s : ℕ, 1 ≤ s → F s = F' s := sorry

/-- The product `Π_{n ≥ 1} (1 - q^{2n-1})²⁴ ∈ ℚ⟦q⟧`. -/
noncomputable def oddEulerProduct24 : PowerSeries ℚ := sorry

/-- The `2B` McKay–Thompson series `q⁻¹ Π (1 - q^{2n-1})²⁴ + 24`. -/
noncomputable def T2BLaurentSeries : LaurentSeries ℚ :=
  HahnSeries.single (-1 : ℤ) (1 : ℚ) * HahnSeries.ofPowerSeries ℤ ℚ oddEulerProduct24 + 24

/-- Unit test `TauCeti.QSeries.IsCompletelyReplicable.qInv`: `q⁻¹` is completely replicable. -/
example : IsCompletelyReplicable (HahnSeries.single (-1 : ℤ) (1 : ℚ)) := sorry

/-- Unit test `TauCeti.QSeries.IsReplicationFamily.const_J`: the constant family `J` is a replication
family. -/
example : IsReplicationFamily (fun _ ↦ JLaurentSeriesQ) := sorry

/-- Unit test `TauCeti.QSeries.IsReplicationFamily.not_const_T2B`: the constant family `T_{2B}` is not
a replication family. -/
example : ¬ IsReplicationFamily (fun _ ↦ T2BLaurentSeries) := sorry

/-- Unit test `TauCeti.QSeries.IsReplicationFamily.T2B_J`: `a(4) = a(3) + (a(1)² - c(1))/2` for
`T_{2B}` with replicate `J` (`-49152 = 11202 + (276² - 196884)/2`). -/
example : T2BLaurentSeries.coeff 4 =
    T2BLaurentSeries.coeff 3 + (T2BLaurentSeries.coeff 1 ^ 2 - JLaurentSeriesQ.coeff 1) / 2 := sorry

end Replication

/-- Node `moonshine-module-complete-replicability`: for any moonshine module and any automorphism
preserving `ω` and the form, `s ↦ T_{gˢ}` is a replication family. -/
theorem moonshine_complete_replicability {W : Type*} [AddCommGroup W] [Module ℝ W]
    (V : VertexOperatorAlgebra ℝ W) (B : LinearMap.BilinForm ℝ W) (hV : IsMoonshineModule V B)
    (g : IsMoonshineModule.formAut V B) :
    IsReplicationFamily (fun s ↦ V.mckayThompsonAut ((g : V.Aut) ^ s)) := sorry
/-! ## QM.6d Hauptmoduln and monstrous moonshine -/

section Hauptmodul

open UpperHalfPlane
open scoped Manifold

/-- The image of `SL₂(ℤ)` in `SL₂(ℝ)`. -/
noncomputable def qm6SL2Z : Subgroup SL(2, ℝ) :=
  (⊤ : Subgroup SL(2, ℤ)).map (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ))

/-- The image of `Γ₀(N)` in `SL₂(ℝ)`. -/
noncomputable def qm6Gamma0 (N : ℕ) : Subgroup SL(2, ℝ) :=
  (CongruenceSubgroup.Gamma0 N).map (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ))

/-- The translation `(1 t; 0 1)`. -/
noncomputable def qm6Translation (t : ℝ) : SL(2, ℝ) := ⟨!![1, t; 0, 1], sorry⟩

/-- Moonshine-type modular groups (Gannon, Definition 1). -/
def IsMoonshineType (Γ : Subgroup SL(2, ℝ)) : Prop :=
  DiscreteTopology Γ ∧ (∃ N : ℕ, 0 < N ∧ qm6Gamma0 N ≤ Γ) ∧
    ∀ t : ℝ, qm6Translation t ∈ Γ ↔ ∃ n : ℤ, t = n

namespace IsMoonshineType

variable {Γ : Subgroup SL(2, ℝ)}

theorem gamma0_le (h : IsMoonshineType Γ) : ∃ N : ℕ, 0 < N ∧ qm6Gamma0 N ≤ Γ := h.2.1

theorem translation_mem_iff (h : IsMoonshineType Γ) (t : ℝ) :
    qm6Translation t ∈ Γ ↔ ∃ n : ℤ, t = n := h.2.2 t

theorem periodic (h : IsMoonshineType Γ) {f : ℍ → ℂ} (hf : ∀ γ ∈ Γ, ∀ τ : ℍ, f (γ • τ) = f τ)
    (τ : ℍ) : f ((1 : ℝ) +ᵥ τ) = f τ := sorry

theorem commensurable (h : IsMoonshineType Γ) :
    (Γ ⊓ qm6SL2Z).relIndex Γ ≠ 0 ∧ (Γ ⊓ qm6SL2Z).relIndex qm6SL2Z ≠ 0 := sorry

end IsMoonshineType

/-- Normalized Hauptmoduln (Borcherds §1; Gannon (2.6)). -/
def IsNormalizedHauptmodul (Γ : Subgroup SL(2, ℝ)) (f : ℍ → ℂ) : Prop :=
  MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f ∧ (∀ γ ∈ Γ, ∀ τ : ℍ, f (γ • τ) = f τ) ∧
    IsZeroAtImInfty (fun τ : ℍ ↦ f τ - (Function.Periodic.qParam 1 τ)⁻¹) ∧
    ∀ A : SL(2, ℤ),
      (∀ γ ∈ Γ, ((γ⁻¹ * Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) A : SL(2, ℝ)) :
        Matrix (Fin 2) (Fin 2) ℝ) 1 0 ≠ 0) →
      IsBoundedAtImInfty (fun τ : ℍ ↦ f (A • τ))

namespace IsNormalizedHauptmodul

variable {Γ : Subgroup SL(2, ℝ)} {f : ℍ → ℂ}

theorem invariant (h : IsNormalizedHauptmodul Γ f) (γ : SL(2, ℝ)) (hγ : γ ∈ Γ) (τ : ℍ) :
    f (γ • τ) = f τ := h.2.1 γ hγ τ

theorem hasLaurentQExpansion (hΓ : IsMoonshineType Γ) (h : IsNormalizedHauptmodul Γ f) :
    ∃ F : LaurentSeries ℂ, HasLaurentQExpansion f F ∧ IsNormalizedQSeries F := sorry

theorem unique (hΓ : IsMoonshineType Γ) {f' : ℍ → ℂ} (h : IsNormalizedHauptmodul Γ f)
    (h' : IsNormalizedHauptmodul Γ f') : f = f' := sorry

theorem of_le {Γ' : Subgroup SL(2, ℝ)} (hΓ' : IsMoonshineType Γ') (hle : Γ ≤ Γ')
    (h : IsNormalizedHauptmodul Γ f) (h' : ∀ γ ∈ Γ', ∀ τ : ℍ, f (γ • τ) = f τ) :
    IsNormalizedHauptmodul Γ' f := sorry

end IsNormalizedHauptmodul

/-- Node `hauptmodul-genus-zero` (Lean-visible part): a normalized Hauptmodul separates the
`Γ`-orbits of `ℍ`. The genus-zero statement `genus X(Γ) = 0` uses FuchsianOrbifolds'
`RiemannSurface.genus` and `RiemannSurface.biholomorph_of_degree_eq_one` (not importable here). -/
theorem hauptmodul_injective_on_orbits {Γ : Subgroup SL(2, ℝ)} (hΓ : IsMoonshineType Γ)
    {f : ℍ → ℂ} (h : IsNormalizedHauptmodul Γ f) (τ₁ τ₂ : ℍ) (h12 : f τ₁ = f τ₂) :
    ∃ γ ∈ Γ, γ • τ₁ = τ₂ := sorry

/-- The `Γ₀(2)` Hauptmodul `Δ(τ)/Δ(2τ) + 24`. -/
noncomputable def qm6T2B (τ : ℍ) : ℂ :=
  ModularForm.discriminant τ / ModularForm.discriminant (UpperHalfPlane.ofComplex (2 * (τ : ℂ))) + 24

/-- Node `j-normalized-hauptmodul`. -/
theorem j_normalizedHauptmodul :
    IsNormalizedHauptmodul qm6SL2Z (fun τ ↦ qm6JFunction τ - 744) ∧
      HasLaurentQExpansion (fun τ ↦ qm6JFunction τ - 744) JLaurentSeriesC := sorry

/-- Node `gamma0-two-hauptmodul`. -/
theorem gamma0_two_hauptmodul :
    IsNormalizedHauptmodul (qm6Gamma0 2) qm6T2B ∧
      (laurentQExpansion qm6T2B).coeff 1 = 276 ∧ (laurentQExpansion qm6T2B).coeff 2 = -2048 ∧
      (laurentQExpansion qm6T2B).coeff 3 = 11202 ∧ (laurentQExpansion qm6T2B).coeff 4 = -49152 ∧
      (laurentQExpansion qm6T2B).coeff 5 = 184024 := sorry

/-- The Atkin–Lehner involution `W₂ = (0 -1/√2; √2 0)`. -/
noncomputable def qm6AtkinLehnerTwo : SL(2, ℝ) := ⟨!![0, -1 / Real.sqrt 2; Real.sqrt 2, 0], sorry⟩

/-- Unit test `TauCeti.QSeries.IsMoonshineType.SL2Z`: `SL₂(ℤ)` is of moonshine type. -/
example : IsMoonshineType qm6SL2Z := sorry

/-- Unit test `TauCeti.QSeries.IsMoonshineType.gamma0_two`: `Γ₀(2)` is of moonshine type. -/
example : IsMoonshineType (qm6Gamma0 2) := sorry

/-- Unit test `TauCeti.QSeries.IsMoonshineType.gamma0_two_plus`: `Γ₀(2)+` is of moonshine type. -/
example : IsMoonshineType (Subgroup.closure (qm6Gamma0 2 ∪ {qm6AtkinLehnerTwo})) := sorry

/-- Unit test `TauCeti.QSeries.IsMoonshineType.not_gamma_two`: `Γ(2)` is not of moonshine type. -/
example : ¬ IsMoonshineType
    ((CongruenceSubgroup.Gamma 2).map (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ))) := sorry

/-- Unit test `TauCeti.QSeries.IsNormalizedHauptmodul.J`: `j - 744` is a normalized Hauptmodul for
`SL₂(ℤ)`. -/
example : IsNormalizedHauptmodul qm6SL2Z (fun τ ↦ qm6JFunction τ - 744) := j_normalizedHauptmodul.1

/-- Unit test `TauCeti.QSeries.IsNormalizedHauptmodul.not_j`: `j` is not normalized. -/
example : ¬ IsNormalizedHauptmodul qm6SL2Z qm6JFunction := sorry

/-- Unit test `TauCeti.QSeries.IsNormalizedHauptmodul.not_J_gamma0_two`: `j - 744` is not a normalized
Hauptmodul for `Γ₀(2)`. -/
example : ¬ IsNormalizedHauptmodul (qm6Gamma0 2) (fun τ ↦ qm6JFunction τ - 744) := sorry

/-- Unit test `TauCeti.QSeries.IsNormalizedHauptmodul.not_const`: constants are not normalized
Hauptmoduln. -/
example (Γ : Subgroup SL(2, ℝ)) (c : ℂ) : ¬ IsNormalizedHauptmodul Γ (fun _ ↦ c) := sorry

/-- Unit test `TauCeti.QSeries.VertexOperatorAlgebra.mckayThompsonSeries_heisenberg24_not_invariant`:
no constant shift of `q⁻¹ Π (1 - qⁿ)⁻²⁴` is the expansion of an `SL₂(ℤ)`-invariant function. -/
example (c : ℂ) (f : ℍ → ℂ) (hf : ∀ (γ : SL(2, ℤ)) (τ : ℍ), f (γ • τ) = f τ) :
    ¬ HasLaurentQExpansion f
      (((heisenbergVOA ℚ 24).mckayThompsonAut 1).map (algebraMap ℚ ℂ) + HahnSeries.C c) := sorry

/-- Node `moonshine-identity-thompson-series`. -/
theorem moonshine_identity {W : Type*} [AddCommGroup W] [Module ℝ W]
    (V : VertexOperatorAlgebra ℝ W) (B : LinearMap.BilinForm ℝ W) (hV : IsMoonshineModule V B) :
    (V.mckayThompsonSeries 1 (fun _ _ hw ↦ hw)).map (algebraMap ℝ ℂ) = JLaurentSeriesC ∧
      IsNormalizedHauptmodul qm6SL2Z (fun τ ↦ qm6JFunction τ - 744) := sorry

end Hauptmodul

/-! ### The Monster and the moonshine theorem -/

/-- The edges of the `Y₄₄₃` diagram (Tau Ceti: `TauCeti.Sporadic.Monster.edges`). -/
def y443Edges : List (Fin 12 × Fin 12) :=
  [(0, 1), (1, 2), (2, 3), (3, 4), (0, 5), (5, 6), (6, 7), (7, 8), (0, 9), (9, 10), (10, 11)]

/-- The `Y₄₄₃` Coxeter matrix (Tau Ceti: `TauCeti.Sporadic.Monster.coxeterMatrix`). -/
def y443 : CoxeterMatrix (Fin 12) where
  M := Matrix.of fun i j ↦ if i = j then 1 else if (i, j) ∈ y443Edges ∨ (j, i) ∈ y443Edges then 3 else 2
  isSymm := sorry
  diagonal := sorry
  off_diagonal := sorry

/-- The Monster as `Y₄₄₃` modulo the spider relator `(a b₁ c₁ a b₂ c₂ a b₃ c₃)¹⁰` and Ivanov's
`f₃₁₂ = (a b₃ c₃ d₃ b₁ c₁ b₂)⁹`. Local stand-in for `TauCeti.SporadicName.Group SporadicName.M`
(`TauCeti.Sporadic.Monster.presentation`). -/
def PresentedMonster : Type :=
  y443.Group ⧸ Subgroup.normalClosure
    {(y443.simple 0 * y443.simple 1 * y443.simple 2 * y443.simple 0 * y443.simple 5 * y443.simple 6 *
        y443.simple 0 * y443.simple 9 * y443.simple 10) ^ 10,
      (y443.simple 0 * y443.simple 9 * y443.simple 10 * y443.simple 11 * y443.simple 1 *
        y443.simple 2 * y443.simple 5) ^ 9}

instance : Group PresentedMonster := QuotientGroup.Quotient.group _

open UpperHalfPlane in
/-- Node `monstrous-moonshine-theorem` (Borcherds, Theorem 1.1; Conway–Norton's main conjecture).
Its proof consumes the gaps recorded in the packet (the Frenkel–Lepowsky–Meurman module, the
identification of its automorphism group with the presented Monster, the Monster character table,
and the Conway–Norton functions with Koike's replicability). The head-character statement (node
`monster-head-characters`) needs the character table of the Monster and is not stated here. -/
theorem monstrous_moonshine :
    ∃ (W : Type) (_ : AddCommGroup W) (_ : Module ℝ W) (V : VertexOperatorAlgebra ℝ W)
      (B : LinearMap.BilinForm ℝ W) (_ : IsMoonshineModule V B)
      (ρ : PresentedMonster →* IsMoonshineModule.formAut V B), Function.Injective ρ ∧
      ∀ g : PresentedMonster, ∃ (Γ : Subgroup SL(2, ℝ)) (h : ℕ), IsMoonshineType Γ ∧
        h ∣ Nat.gcd 24 (orderOf g) ∧ qm6Gamma0 (orderOf g * h) ≤ Γ ∧
        ∃ f : ℍ → ℂ, IsNormalizedHauptmodul Γ f ∧
          HasLaurentQExpansion f ((V.mckayThompsonAut (ρ g : V.Aut)).map (algebraMap ℝ ℂ)) := sorry
end QM6

end TauCeti.QSeries

end QM6File
