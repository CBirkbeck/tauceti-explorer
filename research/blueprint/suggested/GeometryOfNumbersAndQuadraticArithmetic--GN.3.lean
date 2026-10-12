import Mathlib.Algebra.Module.ZLattice.Basic
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Algebra.GCDMonoid.Finset
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Combinatorics.Enumerative.Partition.Basic
import Mathlib.NumberTheory.ModularForms.JacobiTheta.OneVariable
import Mathlib.NumberTheory.Pell
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.Asymptotics.Defs
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Data.ZMod.Basic
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.Analysis.Real.Sqrt

/-!
# Geometry of numbers, quadratic forms and homogeneous arithmetic — Layer GN.3 (follow-up)

This file is not the roadmap and is not exhaustive: the roadmap document
(`research/blueprint/readmes/GeometryOfNumbersAndQuadraticArithmetic--GN.3.md`) is definitive.
The statements below suggest Lean forms for the definitions, API items, unit tests and named
theorems of the GN.3 follow-up packet, so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`; nothing here is claimed to be formalised.

Light definitions (closed formulas, finite counts, finite-sum adapters) have real bodies. The
heavy constructions (representation schemes, local densities as limits, smooth group-scheme
models, Weil operators, Tamagawa measures, Siegel series of lattices) are specified in the
document; their names are listed in the closing comment "Statements not typed at the pins",
grouped by the carriers they need.
-/

open scoped BigOperators
open Polynomial

noncomputable section

namespace TauCeti.GeometryOfNumbersPlan

/-! ## 3A. Reduction domains -/

section Reduction

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- `minkowski-reduced-basis`: an ordered basis `b` of the lattice `L` is Minkowski-reduced when
each `b i` is no longer than any lattice vector whose coefficients from index `i` on are coprime,
i.e. any vector that extends `b 0, …, b (i-1)` to a basis. -/
def MinkowskiReduced {n : ℕ} (L : Submodule ℤ E) (b : Module.Basis (Fin n) ℤ L) : Prop :=
  ∀ i : Fin n, ∀ v : L,
    (Finset.univ.filter (fun j : Fin n => i ≤ j)).gcd (fun j => b.repr v j) = 1 →
      ‖((b i : L) : E)‖ ≤ ‖(v : E)‖

/-- `MinkowskiReduced.exists` -/
theorem MinkowskiReduced.exists (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] :
    ∃ b : Module.Basis (Fin (Module.finrank ℝ E)) ℤ L, MinkowskiReduced L b := sorry

/-- `MinkowskiReduced.neg`: changing the sign of one basis vector preserves reducedness. -/
theorem MinkowskiReduced.neg {n : ℕ} (L : Submodule ℤ E) (b : Module.Basis (Fin n) ℤ L)
    (hb : MinkowskiReduced L b) (i : Fin n) :
    MinkowskiReduced L (b.isUnitSMul (w := fun j => if j = i then (-1 : ℤ) else 1)
      (fun j => by split_ifs <;> simp)) := sorry

/-- `MinkowskiReduced.norm_le`: the lengths of a reduced basis increase. -/
theorem MinkowskiReduced.norm_le {n : ℕ} (L : Submodule ℤ E) (b : Module.Basis (Fin n) ℤ L)
    (hb : MinkowskiReduced L b) {i j : Fin n} (hij : i ≤ j) :
    ‖((b i : L) : E)‖ ≤ ‖((b j : L) : E)‖ := sorry

/-- `MinkowskiReduced.gram_iff`: reducedness depends only on the Gram matrix. -/
theorem MinkowskiReduced.gram_iff {n : ℕ} (L L' : Submodule ℤ E) (b : Module.Basis (Fin n) ℤ L)
    (b' : Module.Basis (Fin n) ℤ L')
    (h : ∀ i j, inner ℝ ((b i : L) : E) ((b j : L) : E) = inner ℝ ((b' i : L') : E) ((b' j : L') : E)) :
    MinkowskiReduced L b ↔ MinkowskiReduced L' b' := sorry

end Reduction

/-- Test `MinkowskiReduced.std_Z2` and `MinkowskiReduced.not_shear` are stated on the standard
lattice `ℤ² ⊂ EuclideanSpace ℝ (Fin 2)`; `MinkowskiReduced.rank_zero`: -/
example (L : Submodule ℤ (EuclideanSpace ℝ (Fin 0))) (b : Module.Basis (Fin 0) ℤ L) :
    MinkowskiReduced L b := fun i => i.elim0

/-- `minus-continued-fraction`: the digit `⌊w⌋ + 1` of the minus continued fraction. -/
def MinusCF.digit (w : ℝ) : ℤ := ⌊w⌋ + 1

/-- The remainder map `w ↦ 1 / (⌊w⌋ + 1 - w)`. -/
def MinusCF.next (w : ℝ) : ℝ := 1 / ((MinusCF.digit w : ℝ) - w)

/-- A real quadratic irrational `w` with conjugate `wσ` is reduced when `0 < wσ < 1 < w`. -/
def IsMinusReduced (w wσ : ℝ) : Prop := 0 < wσ ∧ wσ < 1 ∧ 1 < w

/-- `MinusCF.digit_ge_two`: after the first step every digit is at least `2`. -/
theorem MinusCF.digit_ge_two (w : ℝ) (hw : Irrational w) : 2 ≤ MinusCF.digit (MinusCF.next w) := sorry

/-- `MinusCF.periodic_iff_reduced` (stated for the orbit of the remainder map). -/
theorem MinusCF.periodic_iff_reduced (D : ℕ) (hD : ¬ IsSquare D) (a b c : ℚ) (hb : b ≠ 0) (hc : c ≠ 0) :
    (∃ k > 0, MinusCF.next^[k] ((a + b * Real.sqrt D) / c) = (a + b * Real.sqrt D) / c) ↔
      IsMinusReduced ((a + b * Real.sqrt D) / c) ((a - b * Real.sqrt D) / c) := sorry

/-- Test `MinusCF.digit_sqrt_two`. -/
example : MinusCF.digit (Real.sqrt 2) = 2 := sorry

/-- Test `IsMinusReduced.golden_succ`. -/
example : IsMinusReduced ((3 + Real.sqrt 5) / 2) ((3 - Real.sqrt 5) / 2) := sorry

/-- Test `IsMinusReduced.not_sqrt_two`. -/
example : ¬ IsMinusReduced (Real.sqrt 2) (-Real.sqrt 2) := by
  rintro ⟨h, -, -⟩
  have := Real.sqrt_nonneg 2
  linarith

/-- `pell-automorph`: the automorph `γ_Q` of `[a, b, c]` attached to a solution of `t² − du² = 4`. -/
def pellAutomorph (a b c t u : ℤ) : Matrix (Fin 2) (Fin 2) ℤ :=
  !![(t - b * u) / 2, -c * u; a * u, (t + b * u) / 2]

/-- Acceptance of `pell-automorph` for `x² − 2y²`: `(t, u) = (6, 2)` gives `[[3, 4], [2, 3]]`. -/
example : pellAutomorph 1 0 (-2) 6 2 = !![3, 4; 2, 3] := by decide

/-- `pell-automorph`: `γ_Q` preserves the form when `t² − d u² = 4` with `d = b² − 4ac`. -/
theorem pellAutomorph_preserves (a b c t u : ℤ) (h : t ^ 2 - (b ^ 2 - 4 * a * c) * u ^ 2 = 4)
    (x y : ℤ) :
    let g := pellAutomorph a b c t u
    a * (g 0 0 * x + g 0 1 * y) ^ 2 + b * (g 0 0 * x + g 0 1 * y) * (g 1 0 * x + g 1 1 * y)
      + c * (g 1 0 * x + g 1 1 * y) ^ 2 = a * x ^ 2 + b * x * y + c * y ^ 2 := sorry

/-! ## 3B. Finite-field counts -/

/-- `gaussian-binomial`: `[n choose k]_q ∈ ℤ` by the q-Pascal recursion. -/
def gaussianBinomial {R : Type*} [CommRing R] (q : R) : ℕ → ℕ → R
  | _, 0 => 1
  | 0, _ + 1 => 0
  | n + 1, k + 1 => gaussianBinomial q n k + q ^ (k + 1) * gaussianBinomial q n (k + 1)

@[simp] theorem gaussianBinomial_zero_right {R : Type*} [CommRing R] (q : R) (n : ℕ) : gaussianBinomial q n 0 = 1 := by
  cases n <;> rfl

theorem gaussianBinomial_succ_succ {R : Type*} [CommRing R] (q : R) (n k : ℕ) :
    gaussianBinomial q (n + 1) (k + 1) =
      gaussianBinomial q n k + q ^ (k + 1) * gaussianBinomial q n (k + 1) := rfl

theorem gaussianBinomial_symm {R : Type*} [CommRing R] (q : R) {n k : ℕ} (h : k ≤ n) :
    gaussianBinomial q n k = gaussianBinomial q n (n - k) := sorry

/-- `card_subspaces_eq_gaussianBinomial`. -/
theorem card_subspaces_eq_gaussianBinomial (F : Type*) [Field F] [Fintype F] (n k : ℕ) :
    (Nat.card {W : Submodule F (Fin n → F) // Module.finrank F W = k} : ℤ) =
      gaussianBinomial (Fintype.card F : ℤ) n k := sorry

/-- `qBinomial_theorem`. -/
theorem qBinomial_theorem (q : ℤ) (n : ℕ) :
    ∏ i ∈ Finset.range n, (1 + C (q ^ i) * X) =
      ∑ k ∈ Finset.range (n + 1), C (q ^ (k * (k - 1) / 2) * gaussianBinomial q n k) * X ^ k := sorry

/-- `gaussianBinomial_alternating_sum` (He–Li–Shi–Yang, Corollary 5.25). -/
theorem gaussianBinomial_alternating_sum (q : ℚ) (hq : q ≠ 0) (n : ℕ) (f : ℚ[X])
    (hf : f.natDegree < n) :
    ∑ i ∈ Finset.range (n + 1),
      (-1) ^ i * q ^ (i * (i - 1) / 2) * gaussianBinomial q n i * f.eval (q⁻¹ ^ i) = 0 := sorry

/-- Test `gaussianBinomial_one`. -/
example (n k : ℕ) : gaussianBinomial (1 : ℤ) n k = n.choose k := sorry
/-- Test `gaussianBinomial_two_four_two`. -/
example : gaussianBinomial (2 : ℤ) 4 2 = 35 := by decide
/-- Test `gaussianBinomial_gt`. -/
example : gaussianBinomial (3 : ℤ) 2 3 = 0 := by decide
/-- Test `gaussianBinomial_three_two_one`. -/
example : gaussianBinomial (3 : ℤ) 2 1 = 4 := by decide

/-- `finite-orthogonal-group-order`: `|SO^±_{2r}(F_q)|`, with `split = true` for `+`. -/
def soEvenOrder (q r : ℕ) (split : Bool) : ℤ :=
  (q : ℤ) ^ (r * (r - 1)) * ((q : ℤ) ^ r - if split then 1 else -1) *
    ∏ i ∈ Finset.Icc 1 (r - 1), ((q : ℤ) ^ (2 * i) - 1)

/-- `|SO_{2r+1}(F_q)|`. -/
def soOddOrder (q r : ℕ) : ℤ :=
  (q : ℤ) ^ (r ^ 2) * ∏ i ∈ Finset.Icc 1 r, ((q : ℤ) ^ (2 * i) - 1)

/-- Acceptance: `|SO_4^+(F_2)| = 36`, `|SO_4^-(F_2)| = 60`, `|SO_3(F_3)| = 24`. -/
example : soEvenOrder 2 2 true = 36 ∧ soEvenOrder 2 2 false = 60 ∧ soOddOrder 3 1 = 24 := by decide

/-- `unitary-isotropic-subspace-count`: the closed form `S_{m,b}`. -/
def unitaryIsotropicCount (q : ℚ) (m b : ℕ) : ℚ :=
  (∏ i ∈ Finset.Icc (m - 2 * b + 1) m, (1 - (-q) ^ i)) / ∏ i ∈ Finset.Icc 1 b, (1 - q ^ (2 * i))

/-- Acceptance: `S_{2,1} = q + 1` and `S_{3,1} = q³ + 1`. -/
example (q : ℚ) (hq : 1 < q) :
    unitaryIsotropicCount q 2 1 = q + 1 ∧ unitaryIsotropicCount q 3 1 = q ^ 3 + 1 := sorry

/-- `symplectic-isometry-count`: injective isometries of an `m`-dimensional alternating space with
`t`-dimensional radical into the symplectic space of dimension `2s` over `F_q`. -/
def symplecticIsometryCount (q : ℚ) (m t s : ℕ) : ℚ :=
  if m + t ≤ 2 * s then
    q ^ (m * (4 * s - m + 1) / 2) * ∏ i ∈ Finset.Ioc (s - (m + t) / 2) s, (1 - q ^ (-(2 * (i : ℤ))))
  else 0

/-- Acceptance: `m = t = 1` gives the `q^{2s} − 1` nonzero vectors. -/
example (q : ℚ) (hq : 1 < q) (s : ℕ) (hs : 1 ≤ s) :
    symplecticIsometryCount q 1 1 s = q ^ (2 * s) - 1 := sorry

/-- `finite-hermitian-norm-fiber`: nonzero norm values of `F_{q²}/F_q` have `q + 1` preimages. -/
theorem finite_hermitian_norm_fiber (F : Type*) [Field F] [Fintype F] (q : ℕ)
    (hF : Fintype.card F = q ^ 2) (c : F) (hc : c ≠ 0) (hcq : c ^ q = c) :
    Nat.card {x : F // x ^ (q + 1) = c} = q + 1 := sorry

/-! ## 3F. Theta series -/

section Theta

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- `definite-lattice-theta-series`, in the real model of a positive definite lattice:
`Θ_L(τ) = ∑_{x ∈ L} exp(π i τ ‖x‖²)`. -/
def latticeThetaSeries (L : Submodule ℤ E) (τ : ℂ) : ℂ :=
  ∑' x : L, Complex.exp (Real.pi * Complex.I * τ * (‖(x : E)‖ ^ 2 : ℝ))

/-- `latticeThetaSeries_summable`. -/
theorem latticeThetaSeries_summable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    {τ : ℂ} (hτ : 0 < τ.im) :
    Summable fun x : L => Complex.exp (Real.pi * Complex.I * τ * (‖(x : E)‖ ^ 2 : ℝ)) := sorry

/-- `latticeThetaSeries_coeff`: the coefficient of `exp(π i τ m)` is the shell count. -/
theorem latticeThetaSeries_coeff (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (hint : ∀ x : L, ∃ k : ℕ, ‖(x : E)‖ ^ 2 = k) {τ : ℂ} (hτ : 0 < τ.im) :
    latticeThetaSeries L τ =
      ∑' m : ℕ, (Nat.card {x : L // ‖(x : E)‖ ^ 2 = m} : ℂ) * Complex.exp (Real.pi * Complex.I * τ * m) :=
  sorry

/-- Test `latticeThetaSeries_jacobi`: for `ℤ ⊂ ℝ`, the theta series is Mathlib's `jacobiTheta`. -/
example (τ : ℂ) :
    latticeThetaSeries (AddSubgroup.zmultiples (1 : ℝ)).toIntSubmodule τ = jacobiTheta τ := sorry

/-- Test `latticeThetaSeries_rankZero`. -/
example (L : Submodule ℤ (EuclideanSpace ℝ (Fin 0))) (τ : ℂ) : latticeThetaSeries L τ = 1 := sorry

end Theta

/-- `genus-theta-average` as a finite-sum adapter over class representatives with their
automorphism orders. -/
def genusThetaAverage {ι : Type*} [Fintype ι] (Θ : ι → ℂ → ℂ) (aut : ι → ℕ) (τ : ℂ) : ℂ :=
  (∑ i, Θ i τ / aut i) / ∑ i, (1 : ℂ) / aut i

/-- `genusThetaAverage_oneClass`. -/
theorem genusThetaAverage_oneClass (Θ : Unit → ℂ → ℂ) (aut : Unit → ℕ) (h : aut () ≠ 0) (τ : ℂ) :
    genusThetaAverage Θ aut τ = Θ () τ := by
  simp [genusThetaAverage]
  field_simp

/-! ## 3C. Quadratic local densities -/

/-- `quadratic-local-density` (finite level): the number of `x ∈ (ℤ/p^n)^r` with
`∑ S i j x_i x_j ≡ m`, for an integral symmetric matrix `S` (so `Q(x) = xᵀ S x`). -/
def quadraticRepCount {r : ℕ} (S : Matrix (Fin r) (Fin r) ℤ) (p n : ℕ) (m : ℤ) : ℕ :=
  Nat.card {x : Fin r → ZMod (p ^ n) // ∑ i, ∑ j, (S i j : ZMod (p ^ n)) * x i * x j = m}

/-- The normalized count `μ_p(m, n) = p^{-n(r-1)} N_m(p^n)`. -/
def normalizedRepCount {r : ℕ} (S : Matrix (Fin r) (Fin r) ℤ) (p n : ℕ) (m : ℤ) : ℚ :=
  (quadraticRepCount S p n m : ℚ) / (p : ℚ) ^ (n * (r - 1))

/-- `quadratic-density-stabilization`: the normalized counts are eventually constant. -/
theorem normalizedRepCount_eventually_const {r : ℕ} (S : Matrix (Fin r) (Fin r) ℤ)
    (hS : S.det ≠ 0) (p : ℕ) [Fact p.Prime] (m : ℤ) (hm : m ≠ 0) :
    ∃ N₀, ∀ n ≥ N₀, normalizedRepCount S p n m = normalizedRepCount S p N₀ m := sorry

/-- The stabilization index `w_p(m)` of Shankar–Shankar–Tang–Tayou. -/
def stabilizationIndex (p : ℕ) (m : ℤ) : ℕ :=
  if p = 2 then 1 + 2 * padicValInt 2 (2 * m) else 1 + padicValInt p m

/-- Test `representationDensity_one_one`: `x² ≡ 1` has two solutions modulo `3`. -/
example : quadraticRepCount !![(1 : ℤ)] 3 1 1 = 2 := sorry

/-- Test `representationDensity_one_p`: `x² ≡ 3 (mod 9)` has no solution, so the density of `3`
by `⟨1⟩` at `3` is `0` although the congruence modulo `3` is solvable. -/
example : quadraticRepCount !![(1 : ℤ)] 3 2 3 = 0 := sorry

/-- The odd-corank weight `m(t, s; X) = (1 + s q^{(t-1)/2} X) ∏_{0 ≤ i < (t-1)/2} (1 - q^{2i} X²)`
of `orthogonal-siegel-series`, for odd `t`. -/
def orthWeightOdd (q : ℤ) (t : ℕ) (s : ℤ) : ℤ[X] :=
  (1 + C (s * q ^ ((t - 1) / 2)) * X) *
    ∏ i ∈ Finset.range ((t - 1) / 2), (1 - C (q ^ (2 * i)) * X ^ 2)

/-- The even-corank weight `m^♭(t, s, χ; X)`, equal to `1` at `t = 0`. -/
def orthWeightEven (q : ℤ) (t : ℕ) (s χ : ℤ) : ℤ[X] :=
  if t = 0 then 1 else
    (1 + C (s * q ^ (t / 2)) * X) * (1 - C χ * X) *
      ∏ i ∈ Finset.Ioo 0 (t / 2), (1 - C (q ^ (2 * i)) * X ^ 2)

/-- Test `weightFlat_zero`. -/
example (q s χ : ℤ) : orthWeightEven q 0 s χ = 1 := by simp [orthWeightEven]

/-- Test `orthogonalSiegelSeries_example_111`: the series `1 − qX + qX² − X³` of the lattice with
invariants `(1,1,1)` has central derivative `3 − q`. -/
example (q : ℤ) :
    -((1 - C q * X + C q * X ^ 2 - X ^ 3 : ℤ[X]).derivative.eval 1) = 3 - q := by
  simp; ring

/-- `maximal-mass-local-type`. -/
inductive MaximalMassLocalType
  | zero | I | IIPlus | IIMinus | II | IIIPlus | IIIMinus
  deriving DecidableEq

/-- `maximalMassWittSign`: `ω = c·ε(m)` where `ε(m)` is the Hilbert-symbol correction by the
rank modulo `8`; the symbols `(-1,-1)`, `(-1,d)`, `(-1,-d)` are passed in. -/
def maximalMassWittSign (m : ℕ) (c hmm hmd hmnd : ℤ) : ℤ :=
  match m % 8 with
  | 1 | 2 => c
  | 5 | 6 => c * hmm
  | 0 | 3 => c * hmd
  | _ => c * hmnd

/-- `maximal-local-mass-factor`: Kirschmer's table, `odd = true` for rank `2r + 1`. -/
def maximalLocalMassFactor (q r : ℕ) (odd : Bool) : MaximalMassLocalType → ℚ
  | .zero => 1
  | .I => if odd then ((q : ℚ) ^ (2 * r) - 1) / (2 * (q + 1))
          else ((q : ℚ) ^ (r - 1) - 1) * ((q : ℚ) ^ r - 1) / (2 * (q + 1))
  | .IIPlus => ((q : ℚ) ^ r + 1) / 2
  | .IIMinus => ((q : ℚ) ^ r - 1) / 2
  | .II => ((q : ℚ) ^ (r - 1) + 1) * ((q : ℚ) ^ r + 1) / (2 * (q + 1))
  | .IIIPlus => 1 / 2
  | .IIIMinus => 1 / 2

/-- Test `maximalLocalMassFactor_q2_odd`. -/
example : maximalLocalMassFactor 2 1 true .I = 1 / 2 ∧ maximalLocalMassFactor 2 1 true .IIPlus = 3 / 2 ∧
    maximalLocalMassFactor 2 1 true .IIMinus = 1 / 2 := by
  refine ⟨?_, ?_, ?_⟩ <;> norm_num [maximalLocalMassFactor]

/-- Test `maximalLocalMassFactor_q3_even`. -/
example : maximalLocalMassFactor 3 2 false .I = 2 ∧ maximalLocalMassFactor 3 2 false .II = 5 ∧
    maximalLocalMassFactor 3 2 false .IIIPlus = 1 / 2 := by
  refine ⟨?_, ?_, ?_⟩ <;> norm_num [maximalLocalMassFactor]

/-- `maximalLocalMassFactor_pos`. -/
theorem maximalLocalMassFactor_pos (q r : ℕ) (hq : 2 ≤ q) (hr : 1 ≤ r) (odd : Bool)
    (t : MaximalMassLocalType) (ht : odd = false → 2 ≤ r) : 0 < maximalLocalMassFactor q r odd t := sorry

/-! ## 3D. Hermitian densities -/

/-- `hermitian-central-derivative`, rank one: `D(X) = ∑_{i ≤ a} (-X)^i`. -/
def rankOneHermitianSiegel (a : ℕ) : ℤ[X] := ∑ i ∈ Finset.range (a + 1), (-X) ^ i

/-- `hermitianCentralDerivative_rankOne` for `a = 1` and `a = 3`: tests `hermitianCentralDerivative_pi` and
`hermitianCentralDerivative_pi_cubed`. -/
example : -((rankOneHermitianSiegel 1).derivative.eval 1) = 1 ∧
    -((rankOneHermitianSiegel 3).derivative.eval 1) = 2 := sorry

/-- The weight `m(a) = ∏_{i=1}^{a-1} (1 - (-q)^i)` of Corollary 3.5.3, with `m(0) = 0`. -/
def hermitianDerivativeWeight (q : ℤ) (a : ℕ) : ℤ :=
  if a = 0 then 0 else ∏ i ∈ Finset.Ico 1 a, (1 - (-q) ^ i)

/-- Test `hermitianCentralDerivative_not_q`: `m(2) = 1 + q`. -/
example (q : ℤ) : hermitianDerivativeWeight q 2 = 1 + q := by
  simp [hermitianDerivativeWeight]

/-- `ramified-hermitian-density`: the ramified weight `∏_{i=0}^{t/2-1} (1 - q^{2i} X²)`. -/
def ramifiedWeight (q : ℤ) (t : ℕ) : ℤ[X] :=
  ∏ i ∈ Finset.range (t / 2), (1 - C (q ^ (2 * i)) * X ^ 2)

/-- `split-hermitian-density`: the weight `m(a; T) = ∏_{i<a} (1 - (η q)^i T)` with `η = ±1`. -/
def splitHermitianWeight (q η : ℤ) (a : ℕ) : ℤ[X] :=
  ∏ i ∈ Finset.range a, (1 - C ((η * q) ^ i) * X)

/-- `hlsy-primitive-derivative-formula` (3), as a function of the full type `t > 0` and the sign. -/
def hlsyPrimitiveDerivative (q : ℤ) (t : ℕ) (χ : ℤ) : ℤ :=
  if t % 2 = 1 then ∏ ℓ ∈ Finset.Icc 1 ((t - 1) / 2), (1 - q ^ (2 * ℓ))
  else (1 - χ * q ^ (t / 2)) * ∏ ℓ ∈ Finset.Icc 1 (t / 2 - 1), (1 - q ^ (2 * ℓ))

/-- Acceptance: `t = 1` gives `1`, `t = 2` gives `1 − χ q`. -/
example (q χ : ℤ) : hlsyPrimitiveDerivative q 1 χ = 1 ∧ hlsyPrimitiveDerivative q 2 χ = 1 - χ * q := by
  simp [hlsyPrimitiveDerivative]

/-! ## 3E. Mass, Tamagawa numbers and orbit counts -/

/-- The mass of a finite family of classes with automorphism orders `aut`, as a finite-sum adapter. -/
def familyMass {ι : Type*} [Fintype ι] (aut : ι → ℕ) : ℚ := ∑ i, (1 : ℚ) / aut i

/-- `mass-class-count-comparison`: `mass ≤ #classes ≤ H · mass` when `1 ≤ |Aut| ≤ H`. -/
theorem familyMass_le_card_le {ι : Type*} [Fintype ι] (aut : ι → ℕ) (H : ℕ)
    (h1 : ∀ i, 1 ≤ aut i) (hH : ∀ i, aut i ≤ H) :
    familyMass aut ≤ Fintype.card ι ∧ (Fintype.card ι : ℚ) ≤ H * familyMass aut := sorry

/-- Test `hermitianGenusMass_one_class`: one class with two automorphisms has mass `1/2`. -/
example : familyMass (fun _ : Unit => 2) = 1 / 2 := by simp [familyMass]

/-- `finite-subgroup-gln-bound` (Minkowski): finite subgroups of `GL_N(ℤ)` have order at most
`exp(N log N + C N)`. -/
theorem finite_subgroup_GL_card_le :
    ∃ C : ℝ, ∀ N : ℕ, 1 ≤ N → ∀ G : Subgroup (Matrix.GeneralLinearGroup (Fin N) ℤ), Finite G →
      (Nat.card G : ℝ) ≤ Real.exp (N * Real.log N + C * N) := sorry

/-- The factorial sum of `unimodular-hermitian-mass-asymptotic`:
`∑_{d=1}^n log((d-1)!) = n² log n / 2 - 3n²/4 + O(n log n)`. -/
theorem sum_log_factorial_asymptotic :
    (fun n : ℕ => ∑ d ∈ Finset.Icc 1 n, Real.log ((d - 1).factorial : ℝ)
        - ((n : ℝ) ^ 2 * Real.log n / 2 - 3 * (n : ℝ) ^ 2 / 4)) =O[Filter.atTop]
      fun n : ℕ => (n : ℝ) * Real.log n := sorry

/-- `orthogonal-archimedean-gauge`: Kirschmer's constant `γ_G` for `SO(m)`, `r = ⌊m/2⌋`. -/
def orthogonalArchimedeanConstant (m : ℕ) : ℝ :=
  let r := m / 2
  if m % 2 = 1 then (∏ i ∈ Finset.Icc 1 r, ((2 * i - 1).factorial : ℝ)) / (2 * Real.pi) ^ (r * (r + 1))
  else ((r - 1).factorial : ℝ) * (∏ i ∈ Finset.Icc 1 (r - 1), ((2 * i - 1).factorial : ℝ)) /
    (2 * Real.pi) ^ (r ^ 2)

/-- The skew-orthonormal volume `V_n = ∏_{j=2}^n 2π^{j/2}/Γ(j/2)` of `SO(n)` (IntegralLattices 7E). -/
def orthogonalSkewBasisVolume (n : ℕ) : ℝ :=
  ∏ j ∈ Finset.Icc 2 n, 2 * Real.pi ^ ((j : ℝ) / 2) / Real.Gamma ((j : ℝ) / 2)

/-- The mass-gauge scale `2^{-⌊n/2⌋}` for odd `n` and `1` for even `n`. -/
def orthogonalMassGaugeScale (n : ℕ) : ℝ := if n % 2 = 1 then (2 : ℝ)⁻¹ ^ (n / 2) else 1

/-- `orthogonal-archimedean-gauge`: `V_{2r+1} = 2^r / γ_odd(r)` and `V_{2r} = 1/γ_even(r)`. -/
theorem orthogonalSkewBasisVolume_eq (r : ℕ) (hr : 1 ≤ r) :
    orthogonalSkewBasisVolume (2 * r + 1) = 2 ^ r / orthogonalArchimedeanConstant (2 * r + 1) ∧
    orthogonalSkewBasisVolume (2 * r) = 1 / orthogonalArchimedeanConstant (2 * r) := sorry

/-- Acceptance: `V_3 = 8π²` and the rank-three gauge volume is `4π² = 1/γ_odd(1)`. -/
example : orthogonalSkewBasisVolume 3 = 8 * Real.pi ^ 2 ∧
    orthogonalMassGaugeScale 3 * orthogonalSkewBasisVolume 3 = 1 / orthogonalArchimedeanConstant 3 := sorry

/-- `good-place-volume-euler-product`, odd rank: the good-place stabilizer volume
`∏_{i=1}^r (1 - q^{-2i})`. -/
def goodOrthogonalVolumeOdd (q : ℝ) (r : ℕ) : ℝ := ∏ i ∈ Finset.Icc 1 r, (1 - q ^ (-(2 * (i : ℝ))))

/-- Acceptance: the rank-three good volume is `1 - q⁻²`. -/
example (q : ℝ) : goodOrthogonalVolumeOdd q 1 = 1 - q ^ (-(2 : ℝ)) := by
  simp [goodOrthogonalVolumeOdd]

/-- `punctual-hilbert-count`: Yun's weighted partition sum `∑_{λ ⊢ j} q^{j - length λ}`. -/
def punctualHilbertCount (q j : ℕ) : ℕ :=
  ∑ μ : Nat.Partition j, q ^ (j - μ.parts.card)

/-- Test `punctualHilbertCount_zero` and `punctualHilbertCount_two`. -/
example (q : ℕ) : punctualHilbertCount q 0 = 1 ∧ punctualHilbertCount q 2 = q + 1 := sorry

/-- `punctualHilbertCount_le`. -/
theorem punctualHilbertCount_le (q j : ℕ) (hq : 2 ≤ q) : punctualHilbertCount q j ≤ (2 * q) ^ j := sorry

/-- `weightedPartitionSum_le`. -/
theorem weightedPartitionSum_le (q a : ℕ) (hq : 2 ≤ q) :
    ∑ j ∈ Finset.range (a + 1), punctualHilbertCount q j ≤ (q + 1) ^ a := sorry

/-- `hermitian-genus-mass`, acceptance for `ℚ(i)`: the unit form on `ℤ[i]` has automorphism group
`μ₄`, so its one-class genus has mass `1/4`. -/
example : familyMass (fun _ : Unit => 4) = 1 / 4 := by simp [familyMass]

/-!
## Statements not typed at the pins

The following packet items are specified in the document and are not given Lean signatures here,
because the carriers they need are not in the pinned Mathlib or Tau Ceti. They are grouped by the
missing carrier.

* Local fields with an unramified or ramified quadratic extension, hermitian lattices over them and
  the hermitian representation scheme: `hermitianRepresentationScheme`,
  `primitiveHermitianRepresentationScheme` and their API, `hermitian_count_stabilizes`,
  `primitive_hermitian_smooth_count`, `hermitian_saturation_density_sum`,
  `hermitianCentralDerivative` (beyond rank one), `hermitianCentralDerivative_eq_sum`,
  `hermitianDensityAtOne`, the special values, `hermitian_induction_formula`, the almost self-dual
  density and `Den_Λ`, the lattice-extension lemmas, the split densities (`split-hermitian-density`
  beyond its weight), `ramifiedHermitianDensity`, `ramifiedChoYamauchi`, `ramifiedSiegelSeries`,
  `ramifiedCentralDerivative`, `ramifiedPrimitiveDensity`, `ramifiedPrimitiveDerivative` and their
  decomposition and inversion formulas, the He–Li–Shi–Yang formula beyond its closed values,
  `full-type-mu-invariants`, `ramified-lattice-lemmas`.
* Haar measure on hermitian matrices over a local field and its Fourier analysis:
  `hermitianSiegelIntegral`, `hermitianSphericalFunction` and their API,
  `hermitian-siegel-functional-equation-proof`, `hermitian-finite-fourier-count`.
* Quadratic lattices over `𝒪_F` for a local field `F` and their representation schemes:
  `quadraticLocalDensity` (the limit), `representationDensity`, the comparison
  `quadraticLocalDensity_self_eq_alpha` with IntegralLattices 7C, `JordanTypeData` and the Hanke
  type counts with `hanke-reduction-maps`, `odd-prime-density-formula`, `density-good-prime-bounds`
  (it needs a maximal-lattice predicate over `ℤ_p`), `density-local-term-bounds`,
  `orthogonal-cho-yamauchi`, `orthogonalSiegelSeries`, `orthogonalSiegelSeriesFlat`,
  `orthogonalCentralDerivative`, `ikeda-functional-equation`, `orthogonal-induction-formula`,
  `IsCoIsotropic`, `IsHorizontal`, `horizontalOverlattices`, `orthogonal-valuation-reduction`,
  `full-type-weighted-identities`.
* Isometry and subspace counts of quadratic, hermitian and symplectic spaces over finite fields as
  cardinalities (the closed forms `soEvenOrder`, `soOddOrder`, `unitaryIsotropicCount` and
  `symplecticIsometryCount` are typed above): `finite-orthogonal-group-order` and
  `orthogonal-isometry-count` as statements about `QuadraticMap` over `GaloisField`.
* Genus class sets of lattices over `ℤ` and over number rings with their automorphism groups (the
  sums are typed above as finite-sum adapters): `proper-ordinary-mass-doubling`, `genusThetaAverage_of_genus`,
  `genusRepresentationNumber`, `siegel-main-theorem`, `mst-auxiliary-mass-formula`,
  `numberRingTraceForm` and `traceLatticeRealComparison`, `finite-bounded-integral-endomorphisms`
  for `O_K`-actions, `hermitianGenus_doubleCoset`, `unitary-tamagawa-mass-formula`,
  `unimodular-hermitian-mass-asymptotic`, `modelRing`, `positiveUnitOrbitCount`,
  `local-lattice-orbit-bounds`, `definite-unimodular-theta-average` (it also needs Hilbert modular
  Eisenstein series on `ℍ^d`), `reduced-cycle-class-invariant` (narrow class groups of real
  quadratic fields with the ideal–form bijection of IntegralLattices B2), `minkowski-reduced-siegel`
  (Siegel sets of AdelicAlgebraicGroups AA.3).
* Local types of quadratic spaces over `p`-adic fields and smooth group-scheme models:
  `maximalMassLocalType` (the selector; the type and the table are typed above),
  `maximalMassLocalType_basisChange`, `smoothMaximalOrthogonalModel` and its API,
  `maximalOrthogonalReductiveQuotient`, `dyadicEnlargedRepresentation`,
  `smoothOrthogonalCongruenceKernel`, `orthogonal-canonical-local-volume`.
* Adelic Schwartz–Bruhat spaces, Weil operators, Tamagawa measures and Tamagawa numbers:
  `adelicSchwartzBruhat`, `quadraticWeilOperators` and their API, `quadraticFiberDistribution`
  and its API, `rank-one-siegel-weil`, `orthogonal-tamagawa-stabilizer`,
  `quaternion-adjoint-tamagawa`, `orthogonal-tamagawa-two`, and the compact-volume statement of
  `orthogonal-archimedean-gauge` (Haar measure on `SO(n)`).

### Further packet names not typed here

Every remaining theorem, API item and unit test of the packet, by node; each needs one of the
carriers listed above, and its statement is in the document.

* `minkowski-reduced-basis`: `MinkowskiReduced.map_isometry`, `MinkowskiReduced.first_minimum`.
* `minus-continued-fraction`: `MinusCF.tendsto_convergents`, `MinusCF.digit_ge_two_test`.
* `definite-lattice-theta-series`: `latticeThetaSeries_differentiable`, `latticeThetaSeries_directSum`, `latticeThetaSeries_rescale`, `latticeThetaSeries_isometry`, `latticeThetaSeries_Z_coeff`, `latticeThetaSeries_Z2_coeff`.
* `genus-theta-average`: `genusRepresentationNumber_zero`, `genusThetaAverage_Z3`, `genusRepresentationNumber_zero_test`, `genusThetaAverage_not_uniform`, `genusThetaAverage_mass_compat`.
* `quadratic-local-density`: `quadraticLocalDensity_basisChange`, `quadraticLocalDensity_emptyGeneric`, `quadraticLocalDensity_rank_zero`, `quadraticLocalDensity_hyperbolic_three`.
* `hanke-solution-types`: `goodTypeCount`, `badTypeCount`, `zeroTypeCount`, `count_eq_good_add_bad_add_zero`, `dualSwap`, `goodTypeCount_of_not_dvd`, `zeroTypeCount_eq_zero`, `badTypeCount_unimodular`, `rank_convention_dyadic`.
* `orthogonal-siegel-series`: `orthogonalSiegelSeries_eval`, `orthogonalSiegelSeries_weightSum`, `orthogonalSiegelSeries_selfDual`, `orthogonalSiegelSeries_cancel`, `orthogonalSiegelSeries_selfDual_one`, `orthogonalSiegelSeries_eval_zero`.
* `horizontal-lattice`: `derivative_difference_eq_horizontal_count`, `horizontalOverlattices_coIsotropic`, `isHorizontal_selfDual`, `not_isHorizontal_type_three`, `horizontalOverlattices_coIsotropic_empty`, `isHorizontal_type_two_sign`.
* `hermitian-representation-scheme`: `hermitianRepresentationScheme_points`, `hermitianRepresentationScheme_basisChange`, `hermitianRepresentationScheme_genericDim`, `hermitianRepresentationScheme_rankZero`, `primitive_excludes_zero`, `primitive_count_F4`, `genericDim_one_one`.
* `hermitian-count-stabilizes`: `hermitian-count-stabilizes`.
* `primitive-hermitian-smooth-count`: `primitive-hermitian-smooth-count`.
* `hermitian-saturation-density-sum`: `hermitian-saturation-density-sum`.
* `hermitian-cancellation-law`: `hermitian-cancellation-law`.
* `hermitian-central-derivative`: `hermitianCentralDerivative_cancel`, `hermitianDensityAtOne_selfDual`.
* `hermitian-special-values`: `hermitian-special-values`.
* `hermitian-induction-formula`: `hermitian-induction-formula`.
* `almost-self-dual-density`: `almost-self-dual-density`.
* `hermitian-lattice-extension-lemmas`: `hermitian-lattice-extension-lemmas`.
* `hironaka-siegel-integral`: `hermitianSphericalFunction_invariant`, `hermitianSiegelIntegral_rational`, `hermitianSiegelIntegral_basisChange`, `hermitianSiegelIntegral_rankZero`, `hermitianSiegelIntegral_unit`, `hermitianSiegelIntegral_conductor`, `hermitianSiegelIntegral_density`.
* `ramified-hermitian-density`: `ramifiedSiegelSeries_one`, `ramifiedSiegelSeries_one_eq_zero`, `ramifiedCentralDerivative_rankTwo`, `ramifiedChoYamauchi_rankZero`, `ramified_type_parity`.
* `ramified-primitive-density`: `ramifiedDensity_eq_sum_primitive`, `ramifiedPrimitiveDensity_inversion`, `ramifiedDerivative_eq_sum`, `ramifiedPrimitiveDensity_hyperbolic`, `ramifiedPrimitiveDensity_nonIntegral`, `ramifiedPrimitiveDensity_equalRank`, `ramifiedPrimitiveDensity_hyperbolic_rankOne`, `ramifiedDensity_inversion_roundtrip`.
* `number-ring-trace-lattice`: `numberRingTraceForm_posDef`, `numberRingTraceForm_rank`, `numberRingTraceForm_isometry`, `trace_scalar_operator_bound`, `numberRingTraceForm_rat`, `numberRingTraceForm_sqrt5`, `numberRingTraceForm_rankZero`, `numberRingTraceForm_one_place`.
* `maximal-mass-local-type`: `maximalMassLocalType_eq_zero_of_unimodular`, `maximalMassWittSign_rank_three`, `maximalMassLocalType_odd_signs`, `maximalMassLocalType_signed_disc`, `maximalMassLocalType_ramified`.
* `maximal-local-mass-factor`: `maximalLocalMassFactor_zero`, `maximalLocalMassFactor_odd_I`, `maximalLocalMassFactor_even_II`, `maximalLocalMassFactor_even_III`, `maximalLocalMassFactor_good`, `maximalLocalMassFactor_dyadic_III`.
* `smooth-maximal-orthogonal-model`: `smoothMaximalOrthogonalModel_integralPoints`, `smoothMaximalOrthogonalModel_smooth`, `reductiveQuotient_rank3_q2`, `dyadicEnlargedRepresentation_one`, `congruence_conditions_differ`, `enlarged_exponents`.
* `quadratic-weil-operators`: `quadraticWeilOperators_relations`, `quadraticWeilOperators_rationalSplitting`, `thetaDistribution_invariant`, `quadraticWeilOperators_orthogonal`, `weilMultiplication_zero`, `weilFourier_sq`, `thetaDistribution_dilation`, `weilFourier_two_point`.
* `quadratic-fiber-distribution`: `quadraticFiberDistribution_fourier`, `quadraticFiberDistribution_scale`, `quadraticFiberDistribution_invariant`, `quadraticFiberDistribution_density`, `fiber_negative_definite_empty`, `fiber_zero_no_atom`, `fiber_scale_five`, `fiber_density_compat`.
* `hermitian-genus-mass`: `hermitianGenusMass_pos`, `hermitianGenus_finite`, `hermitianGenusMass_le_card`, `hermitianGenusMass_gaussian`, `hermitianGenus_projective`, `hermitianGenusMass_rankZero`.
* `model-ring-orbit-count`: `positiveUnitOrbitCount_finite`, `positiveUnitOrbitCount_prod`, `log_positiveUnitOrbitCount_le`, `modelRing_one_positive`, `modelRing_singular_excluded`, `positiveUnitOrbitCount_gaussian`, `positiveUnitOrbitCount_congruence`.
* `punctual-hilbert-count`: `punctualHilbertCount_eq`, `punctualHilbertCount_length_over_O`, `punctualHilbertCount_one`.
-/

end TauCeti.GeometryOfNumbersPlan
