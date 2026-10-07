import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FieldSimp
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Coeff

/-!
# Suggested Lean forms: local Galois deformation rings (LocalGaloisDeformationRings, R08.1–R08.6, L7, L8)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`LocalGaloisDeformationRings`) is definitive. The statements suggest Lean forms so that
contributors and reviewers converge on names and signatures. Substantive new theorem signatures
use `sorry`; the worked matrix and arithmetic checks below have proofs. Nothing here claims that
the roadmap has been formalised.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. This file imports individual Mathlib
modules. The required local lifting, coefficient, period-module and scheme carriers are supplied
by other roadmaps; their planned forms are not substituted by `Prop` placeholders here.

Independent review `REV-LocalGaloisDeformationRings`: the packet needs changes. Most of its
definitions, API lemmas, examples and named theorems still lack actual Lean signatures. The final
comment is a mathematical planning inventory, not elaborated declarations. Elaborating this file
checks only the concrete signatures and computations above that inventory; it does not establish
the correspondence required by PROTOCOL section 13. The review report lists the missing carriers
and scope corrections for a revision worker.

The concrete content includes the odd archimedean equation at `p = 2`, flag dimensions, tame matrix
relations, Snowden's presentation, a nonreduced determinant-ordinary counterexample over `ZMod 9`,
and the cubic term in the symplectic nilpotent model in characteristic three.
-/

namespace TauCeti.GaloisDeformation.Local

variable {R : Type*} [CommRing R]

/-- **`R08.1/archimedean-odd-ring-p2`**, first step: an involution of determinant `-1` in
`M₂(R)` has trace `0` (Cayley–Hamilton). -/
theorem trace_eq_zero_of_mul_self_eq_one_of_det (M : Matrix (Fin 2) (Fin 2) R)
    (h : M * M = 1) (hd : M.det = -1) : M.trace = 0 := sorry

/-- The converse: a traceless matrix with `a² + bc = 1` is an involution. -/
theorem traceless_mul_self (a b c : R) (h : a ^ 2 + b * c = 1) :
    !![a, b; c, -a] * !![a, b; c, -a] = 1 := sorry

/-- Its determinant is `-1`. -/
theorem traceless_det (a b c : R) (h : a ^ 2 + b * c = 1) : (!![a, b; c, -a]).det = -1 := sorry

/-- The equation of the odd archimedean ring at `p = 2`, as an element of the power series ring
in the three entries centred at a lift `(a₀, b₀, c₀)` of `ρ̄(c)`. -/
noncomputable def oddArchimedeanEquation (a₀ b₀ c₀ : R) : MvPowerSeries (Fin 3) R :=
  (MvPowerSeries.C a₀ + MvPowerSeries.X 0) ^ 2 +
    (MvPowerSeries.C b₀ + MvPowerSeries.X 1) * (MvPowerSeries.C c₀ + MvPowerSeries.X 2) - 1

/-- **`R08.2/steinberg-condition`**, `n = 2`: the Frobenius relation of Steinberg lifts,
`q (tr ρ(φ))² = (1 + q)² det ρ(φ)`. -/
def SteinbergFrobRelation (q : ℕ) (M : Matrix (Fin 2) (Fin 2) R) : Prop :=
  (q : R) * M.trace ^ 2 = (1 + q) ^ 2 * M.det

/-- For `M = diag(α, qα)` the relation holds. -/
theorem steinbergFrobRelation_diag (q : ℕ) (α : R) :
    SteinbergFrobRelation q !![α, 0; 0, (q : R) * α] := sorry

/-- **`R08.2/minimally-ramified-condition`**, the kernel condition for a single matrix: the
kernels of `(A - 1)^i` have the expected rank (here stated as freeness of rank `r i`).
This is only a pointwise necessary condition. Minimality also requires compatibility of these
kernels with every coefficient base change; this helper is not the full deformation condition. -/
def KernelsHaveRank {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (r : ℕ → ℕ) : Prop :=
  ∀ i, Nonempty (Module.Basis (Fin (r i)) R (LinearMap.ker (Matrix.toLin' ((A - 1) ^ i))))

/-- **`R08.3/hodge-and-galois-types`**: the dimension `(d² − Σ mⱼ²)/2` of the partial flag variety
of a filtration with jump multiplicities `m`, the contribution of one embedding to
`dim ad D/Fil⁰ ad D` in Kisin's dimension formula. -/
def flagDim (m : List ℕ) : ℕ := (m.sum ^ 2 - (m.map (· ^ 2)).sum) / 2

/-- **`L7/finite-height-lattices`**, the non-example: `u` never divides a power of an element
whose constant term is a non-zero-divisor (such as `E(u)`, with `E(0) = p · unit`), so
`𝔖/u𝔖` is killed by no power of `E(u)`. -/
theorem X_not_dvd_pow {A : Type*} [CommRing A] [IsDomain A] (f : PowerSeries A)
    (hf : PowerSeries.constantCoeff f ≠ 0) (h : ℕ) : ¬ (PowerSeries.X ∣ f ^ h) := by
  rw [PowerSeries.X_dvd_iff, map_pow]
  exact pow_ne_zero _ hf


end TauCeti.GaloisDeformation.Local

namespace TauCeti.GaloisDeformation.Local.SuggestedTest

open TauCeti.GaloisDeformation.Local

/-- `diag(1, -1)` is an odd involution. -/
example : (!![(1 : ℤ), 0; 0, -1]) * !![(1 : ℤ), 0; 0, -1] = 1 := by
  ext i j; fin_cases i <;> fin_cases j <;> simp

/-- The unipotent `!![1, 1; 0, -1]` over `ℤ` lifts `!![1, 1; 0, 1]` mod 2 and is an involution. -/
example : (!![(1 : ℤ), 1; 0, -1]) * !![(1 : ℤ), 1; 0, -1] = 1 := by
  ext i j; fin_cases i <;> fin_cases j <;> simp

/-- `R08.3/hodge-and-galois-types`: regular weights in rank two give `1`, the Barsotti–Tate case. -/
example : flagDim [1, 1] = 1 := by decide

/-- Rank three with multiplicities `(2, 1)`: the flag variety is `ℙ²`. -/
example : flagDim [2, 1] = 2 := by decide

/-- Regular weights in rank three: `3 = 3·2/2`. -/
example : flagDim [1, 1, 1] = 3 := by decide

/-- Parallel weights contribute nothing. -/
example : flagDim [3] = 0 := by decide

/-- `R08.6/export-archimedean`: KW II's equation `X₁² + X₂X₃ + 2X₁` is `a² + bc − 1` at `a = 1 + X₁`. -/
example {R : Type*} [CommRing R] (x b c : R) : (1 + x) ^ 2 + b * c - 1 = x ^ 2 + b * c + 2 * x := by
  ring

/-- `R08.6/export-completed-tensor-product`: `2[F:ℚ] + (3|S_p| + [F:ℚ]) + 3|S′| = 3|S|` with
`|S| = [F:ℚ] + |S_p| + |S′|` (infinite places, places above `p`, other finite places). -/
example (n sp s' : ℕ) : 2 * n + (3 * sp + n) + 3 * s' = 3 * (n + sp + s') := by ring

/-- `R08.4/flat-generic-fibre`: `d² + Σ_ψ (d − v_ψ)v_ψ` with `d = 2`, `v_ψ = 1` over `n = [K : ℚ_p]`
embeddings is `4 + n`. -/
example (n : ℕ) : 2 ^ 2 + n * ((2 - 1) * 1) = 4 + n := by norm_num

/-- `R08.4/small-ramification-flat`: `K = ℚ_p` has `e = 1 < p − 1` once `p ≥ 3`. -/
example (p : ℕ) (hp : 3 ≤ p) : 1 < p - 1 := by omega

/-- `R08.4/savitt-weight-two-rings`: rescaling by the unit `w` turns `X₁X₂ − pw` into `X₁X₂ − p`. -/
example {R : Type*} [CommRing R] (x y p w winv : R) (h : w * winv = 1) :
    x * y - p * w = w * ((winv * x) * y - p) := by
  linear_combination (-(x * y)) * h

/-- `L8/determinant-ordinary-ring`, n = 2: a diagonal lift `diag(u, w)` with characters `u`, `w`
satisfies the ordered-product relation (6.2.8): `(ρ(g₁) − χ₁(g₁))(ρ(g₂) − χ₂(g₂)) = 0`. -/
example {R : Type*} [CommRing R] (u₁ w₁ u₂ w₂ : R) :
    (!![u₁, 0; 0, w₁] - u₁ • (1 : Matrix (Fin 2) (Fin 2) R)) *
      (!![u₂, 0; 0, w₂] - w₂ • (1 : Matrix (Fin 2) (Fin 2) R)) = 0 := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- `L8/determinant-flag-comparison`, the final dimension inequality doubled, with `A = n²`,
`B = n(n+1)`, `C = n(n+1)[F_v:ℚ_p]` and `m = [F_v:ℚ_p]`: if `B + 4 ≤ 2m` (i.e. `m > n(n+1)/2 + 1`) and `n ≥ 1`,
then `2(1 + n²) + n(n+1) + n(n+1)m − 2m ≤ 2(n² − 1) + n(n+1)m`. -/
example (A B C m : ℕ) (hA : 1 ≤ A) (h : B + 4 ≤ 2 * m) :
    2 * (1 + A) + B + C ≤ 2 * (A - 1) + C + 2 * m := by
  omega

/-! ### Checkpoint 7: CHT §§2.4.1, 2.4.2, 2.4.5 -/

/-- `L7/fontaine-laffaille-tangent-space-and-smoothness`: at `n = 2`, `F_ṽ = ℚ_l`, the ring has
`n² + [F_ṽ:ℚ_l]·n(n−1)/2 = 5` variables. -/
example : 2 ^ 2 + 1 * (2 * (2 - 1) / 2) = 5 := by decide

/-- `L7/discrete-series-smoothness` (Lemma 2.4.28): `m(n − m) + (n − m)² + (m² − 1) + (m(n − m) + 1) = n²`. -/
example (n m : ℤ) : m * (n - m) + (n - m) ^ 2 + (m ^ 2 - 1) + (m * (n - m) + 1) = n ^ 2 := by
  ring

/-- Source issue E2: for `r̄ = ω ⊕ 1` with `ω` on the sub, the suitable first-order lifts have dimension
`1 + 1 + 3 = 5`, whereas CHT's count `n(n+1)/2 + [F_ṽ:ℚ_l]·n(n−1)/2` gives `4`. -/
example : 1 + 1 + 3 = 5 ∧ 2 * (2 + 1) / 2 + 1 * (2 * (2 - 1) / 2) = 4 := by decide

end TauCeti.GaloisDeformation.Local.SuggestedTest

/-! ## R08.5 (checkpoint 8): Kisin's 2-adic rings -/

namespace TauCeti.GaloisDeformation.Local.R085Test

/-- `R08.5/kisin-local-rings-p2-comparison` (Kisin 2.5.6, trivial `V_𝔽`): the universal odd lift
`c ↦ !![1 + x, y; z, -1 - x]` has determinant `−1` exactly on `x² + 2x + yz = 0`. -/
example {R : Type*} [CommRing R] (x y z : R) :
    Matrix.det !![1 + x, y; z, -1 - x] = -1 - (x ^ 2 + 2 * x + y * z) := by
  simp [Matrix.det_fin_two]
  ring

/-- `R08.5/kisin-local-rings-p2-comparison` (Kisin 2.5.6, unipotent `V_𝔽`): for `c ↦ !![1 + x, 1 + y; z, -1 - x]` the
relation is `x² + 2x + yz + z = 0`. -/
example {R : Type*} [CommRing R] (x y z : R) :
    Matrix.det !![1 + x, 1 + y; z, -1 - x] = -1 - (x ^ 2 + 2 * x + y * z + z) := by
  simp [Matrix.det_fin_two]
  ring

/-- `R08.5/kisin-local-rings-p2-comparison`: on the relation, the lift squares to the identity, so it is a
representation of `Gal(ℂ/ℝ)`. -/
example {R : Type*} [CommRing R] (x y z : R) (h : x ^ 2 + 2 * x + y * z = 0) :
    !![1 + x, y; z, -1 - x] * !![1 + x, y; z, -1 - x] = 1 := by
  ext i j
  fin_cases i <;> fin_cases j
  · simp [Matrix.mul_apply, Fin.sum_univ_two]
    linear_combination h
  · simp [Matrix.mul_apply, Fin.sum_univ_two]
    ring
  · simp [Matrix.mul_apply, Fin.sum_univ_two]
    ring
  · simp [Matrix.mul_apply, Fin.sum_univ_two]
    linear_combination h

end TauCeti.GaloisDeformation.Local.R085Test

/-! ## Checks added with the full pass (R08.1–R08.6, L7, L8)

Each block names the packet node it tests. Statements that need the deformation-theoretic
carriers of the supplier roadmaps are in the generated sketch block at the end of the file. -/

namespace TauCeti.GaloisDeformation.Local.FullPassTest

open Matrix

/-! ### R08.1 -/

/-- `R08.1/lambda-presentation`, the count `r − s = d²(1 + [F:ℚ_p])` in rank one over `ℚ_p`:
`r = 2`, `s = 0`. -/
example : (2 : ℤ) - 0 = 1 ^ 2 * (1 + 1) := by norm_num

/-- `R08.1/g-valued-presentations`, `G = GL_d`, `H = GL₁`, `φ = det`:
`(d² − 1)(m + 1) = d²(m + 1) − (m + 1)`. -/
example (d m : ℤ) : (d ^ 2 - 1) * (m + 1) = d ^ 2 * (m + 1) - (m + 1) := by ring

/-- `R08.1/g-valued-presentations` (4): fixed-multiplier `GSp₄` at `v ∤ p` has `dim ad⁰ = 10`
variables when unobstructed; `dim Lie GSp₄ = 11 = 10 + 1`. -/
example : (10 : ℕ) + 1 = 11 := rfl

/-! ### R08.2 -/

/-- `R08.2/q-tame-group`: the relation `Φ Σ = Σ^q Φ` (that is, `ΦΣΦ⁻¹ = Σ^q`) for a pair of
matrices. -/
def IsTameRelation {R : Type*} [CommRing R] {n : ℕ} (q : ℕ) (Φ S : Matrix (Fin n) (Fin n) R) :
    Prop :=
  Φ * S = S ^ q * Φ

/-- `R08.2/q-tame-group`, a lower unipotent `S` and the power formula used in the test below. -/
theorem lowerUnipotent_pow {R : Type*} [CommRing R] (x : R) (q : ℕ) :
    (!![1, 0; x, 1] : Matrix (Fin 2) (Fin 2) R) ^ q = !![1, 0; (q : R) * x, 1] := by
  induction q with
  | zero => ext i j; fin_cases i <;> fin_cases j <;> simp
  | succ k ih =>
    rw [pow_succ, ih]
    ext i j
    fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]
    all_goals ring

/-- `tameGroup` test: `Φ = diag(1, q)` and `S = !![1, 0; x, 1]` satisfy the tame relation. -/
example {R : Type*} [CommRing R] (x : R) (q : ℕ) :
    IsTameRelation q (!![1, 0; 0, (q : R)]) (!![1, 0; x, 1]) := by
  unfold IsTameRelation
  rw [lowerUnipotent_pow]
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- `R08.2/rank-two-unrestricted-rings-cg`, footnote 5 with `v = 2`: `C(T) = T² − 2` satisfies
`C(t + t⁻¹) = t² + t⁻²`. -/
example (t : ℚ) (ht : t ≠ 0) : (t + t⁻¹) ^ 2 - 2 = t ^ 2 + t⁻¹ ^ 2 := by
  field_simp
  ring

/-- `R08.2/rank-two-unrestricted-rings-cg`: `(q + 1)/2` geometric components for `q = 3`, and
`(q − 1)/2 = 1` of them ramified. -/
example : (3 + 1) / 2 = 2 ∧ (3 - 1) / 2 = 1 := by decide

/-- `R08.2/taylor-wiles-local-tangent`: the ramified direction `(n − 1)a + b = 0` for scalars
`a` on `s_v` and `b = −(n − 1)a` on `ψ_v`. -/
example (n : ℤ) (a : ℤ) : (n - 1) * a + (-(n - 1) * a) = 0 := by ring

/-- `R08.2/gsp4-unipotent-local-models`: `m* = (m − m³)/3` at `m = 2` is `−2`. -/
example : ((2 : ℤ) - 2 ^ 3) / 3 = -2 := by norm_num

/-- `R08.2/gsp4-unipotent-local-models`: `N₁ = E₁₄` squares to zero, so `exp₂(N₁) = 1 + N₁`. -/
example : (!![(0 : ℤ), 0, 0, 1; 0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0]) *
    !![(0 : ℤ), 0, 0, 1; 0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0] = 0 := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_four]

/-- `R08.2/gsp4-unipotent-local-models`: centraliser fibre dimensions `11, 7, 5, 3` decrease
with the rank of the nilpotent. -/
example : [11, 7, 5, 3].Pairwise (· > ·) := by decide

/-! ### R08.3 and L7 -/

/-- `R08.3/g-valued-pst-rings`, `G = GL₂`, regular weight: `dim G + [K:ℚ_p]·dim Fl = 4 + n`. -/
example (n : ℕ) : 4 + n * 1 = 4 + n := by ring

/-- `L7/local-model-rho-nm0`: the labelled Hodge–Tate weights `{0, m, …, (n − 1)m}`. -/
def rhoNM0Weights (n m : ℕ) : List ℕ := (List.range n).map (· * m)

example : rhoNM0Weights 3 2 = [0, 2, 4] := by decide

/-- `L7/local-model-rho-nm0`, the tensor identity on exponents: the summand of index
`k = m(i − 1) + j` of `ρ_{n,m,0} ⊗ ρ_{m,1,0}` is `ε₂^{nm − k} (ε′₂)^{k − 1}`. -/
example (n m i j : ℤ) :
    m * (n - i) + (m - j) = n * m - (m * (i - 1) + j) ∧
      m * (i - 1) + (j - 1) = (m * (i - 1) + j) - 1 := by
  constructor <;> ring

/-- `L7/ordinary-ring-with-frobenius-eigenvalue` and `L7/eigenvalue-ring-normal-cm-type-three`:
with `m = !![a, b; c, -a]` and `n = φ − 1 = !![φ₁, φ₂; φ₃, φ₄]`, the entries of `mn − βm` are the
four bilinear generators of Snowden's presentation. -/
example {R : Type*} [CommRing R] (a b c φ₁ φ₂ φ₃ φ₄ β : R) :
    !![a, b; c, -a] * !![φ₁, φ₂; φ₃, φ₄] - β • !![a, b; c, -a] =
      !![a * φ₁ + b * φ₃ - a * β, a * φ₂ + b * φ₄ - b * β;
        -a * φ₃ + c * φ₁ - c * β, -(a * φ₄ - c * φ₂ - a * β)] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp
  all_goals ring

/-- The same presentation: `m² = (a² + bc)·1`. -/
example {R : Type*} [CommRing R] (a b c : R) :
    !![a, b; c, -a] * !![a, b; c, -a] = (a ^ 2 + b * c) • (1 : Matrix (Fin 2) (Fin 2) R) := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp
  all_goals ring

/-- The same presentation: `det(1 + n) = 1` is `φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃ = 0`. -/
example {R : Type*} [CommRing R] (φ₁ φ₂ φ₃ φ₄ : R) :
    Matrix.det !![1 + φ₁, φ₂; φ₃, 1 + φ₄] - 1 = φ₁ + φ₄ + φ₁ * φ₄ - φ₂ * φ₃ := by
  simp [Matrix.det_fin_two]; ring

/-- The same presentation: when `det φ = 1`, `P_φ(1 + β) = β² − (φ₁ + φ₄)β − (φ₁ + φ₄)`. -/
example {R : Type*} [CommRing R] (φ₁ φ₄ β : R) :
    (1 + β) ^ 2 - (2 + φ₁ + φ₄) * (1 + β) + 1 = β ^ 2 - (φ₁ + φ₄) * β - (φ₁ + φ₄) := by ring

/-- `eigenvalueRing_trace_relation`: `α + α⁻¹ = 2 + φ₁ + φ₄` when `α` is a root of
`X² − (2 + φ₁ + φ₄)X + 1`. -/
example (α φ₁ φ₄ : ℚ) (hα : α ≠ 0) (h : α ^ 2 - (2 + φ₁ + φ₄) * α + 1 = 0) :
    α + α⁻¹ = 2 + φ₁ + φ₄ := by
  field_simp
  linear_combination h

/-- `L7/eigenvalue-ring-normal-cm-type-three` (4): with `a = 0`, `φ₃ = −φ₂`, `φ₁ = −(b + c)`,
the first relation of `B` becomes `−(b + c)² + φ₂²`. -/
example {R : Type*} [CommRing R] (b c φ₂ : R) :
    -(-(b + c)) ^ 2 - φ₂ * (-φ₂) = -(b + c) ^ 2 + φ₂ ^ 2 := by ring

/-- `L7/eigenvalue-ring-normal-cm-type-three` (2): `21 = C(7, 2)` quadratic monomials in six
variables, minus six relations, gives `15`. -/
example : Nat.choose 7 2 = 21 ∧ 21 - 6 = 15 := by decide

/-- `L7/gsp4-siegel-ordinary-tangent` (2): `2 + h¹(u) − h⁰(b⁰/u) − h⁰(u) = 2 + 3 − 2 − 0 = 3`. -/
example : (2 : ℤ) + 3 - 2 - 0 = 3 := by norm_num

/-- `L7/gsp4-ordinary-flag-incidence` (3): `dim Fil^i ad⁰ = 6, 4, 2, 1, 0`, inside
`dim ad⁰ = 10`. -/
example : [6, 4, 2, 1, 0].Pairwise (· > ·) ∧ 6 ≤ 10 := by decide

/-! ### R08.4–R08.6 -/

/-- `R08.4/finite-cocycles-kummer`: `|Z¹_f| = |N|^{1 + [F_v:ℚ_p]}`; for `N = 𝔽_p`, `F_v = ℚ_p`
this is `p²`. -/
example (p : ℕ) : p ^ (1 + 1) = p ^ 2 := rfl

/-- `R08.5/semistable-weight-two-resolution`: `|Z¹(A(χ_p))| = |A|^{2 + [F:ℚ_p]}` and the torsor
has rank `2 + [F:ℚ_p]`; relative dimension `3 + [F:ℚ_p] = (2 + [F:ℚ_p]) + 1` (the ℙ¹ direction). -/
example (f : ℕ) : 3 + f = (2 + f) + 1 := by ring

/-- `R08.6/good-dihedral-type`: `q = 5`, `p = 3`, `r = 1`: `j = (q + 1)/p − 1 = 1` and
`i = q − 1 − j = 3`. -/
example : (5 + 1) / 3 - 1 = 1 ∧ 5 - 1 - 1 = 3 := by decide

/-- `R08.6/kw1-lift-types`, type (3) with `q = 7`, `p = 3`: `p ∣ q − 1`, so `(ℤ/7)ˣ` has a
character of order 3. -/
example : 3 ∣ 7 - 1 := by decide

end TauCeti.GaloisDeformation.Local.FullPassTest

namespace TauCeti.GaloisDeformation.Local.ReviewTest

/-- `ordinaryDet_repeated_characters_fail`: every matrix in this upper triangular family over
`ZMod 9` has trace two and determinant one. The family contains `diag(4,7)` and the upper
unipotent matrix. In rank two these equations give characteristic polynomial `(X-1)^2`. -/
theorem ordinaryDet_trace_det (a b : ZMod 9) :
    Matrix.trace !![1 + 3 * a, b; 0, 1 - 3 * a] = 2 ∧
      Matrix.det !![1 + 3 * a, b; 0, 1 - 3 * a] = 1 := by
  constructor
  · simp [Matrix.trace_fin_two]
    decide
  · simp [Matrix.det_fin_two]
    ring_nf
    simp [show (9 : ZMod 9) = 0 by decide]

/-- The characteristic-polynomial equations hold on every element of the family, rather than
only on its two chosen generators. This catches the false repeated-character field example. -/
example (a b : ZMod 9) :
    Matrix.charpoly !![1 + 3 * a, b; 0, 1 - 3 * a] =
      (Polynomial.X - Polynomial.C 1) ^ 2 := by
  let : Fact (1 < 9) := ⟨by decide⟩
  rw [Matrix.charpoly_fin_two, (ordinaryDet_trace_det a b).1,
    (ordinaryDet_trace_det a b).2]
  simp only [Polynomial.C_ofNat, Polynomial.C_1]
  ring

/-- The ordered product for the two generators is nonzero, although both characters are one. -/
example :
    ((!![(4 : ZMod 9), 0; 0, 7]) - 1) * ((!![(1 : ZMod 9), 1; 0, 1]) - 1) ≠ 0 := by
  decide

/-- `nilpotentModel_cubic_correction`: the regular symplectic nilpotent in characteristic three.
This is only a matrix used in a test, not a replacement for its owning Lie/group scheme. -/
def regularNilpotentModThree : Matrix (Fin 4) (Fin 4) (ZMod 3) :=
  !![0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, -1; 0, 0, 0, 0]

example : regularNilpotentModThree ^ 3 ≠ 0 ∧ regularNilpotentModThree ^ 4 = 0 := by
  decide

/-- At `q=2`, the integral coefficient `(q-q^3)/3=-2` becomes one modulo three. -/
example : (((2 : ℤ) - 2 ^ 3) / 3 : ℤ) = -2 ∧ (-2 : ZMod 3) = 1 := by
  decide

/-- Omitting the cubic correction changes the required Frobenius equation even at `p=3`. -/
example : (2 : ZMod 3) • regularNilpotentModThree + regularNilpotentModThree ^ 3 ≠
    (2 : ZMod 3) • regularNilpotentModThree := by
  decide

end TauCeti.GaloisDeformation.Local.ReviewTest

/-!
## Mathematical planning inventory (comments only)

This inventory records the corrected packet's statements, proposed API names and test names.
It contains no Lean declaration or proof and does not satisfy section 13's signature requirement.
The bodies that cannot yet be stated are omitted honestly. Source and prerequisite information
remains in the packet; the independent review records the remaining gaps.

### LocalGaloisDeformationRings:R08.1/local-lifting-ring (theorem)

K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. The lifting functor Lift_ρ̄ of GlobalGaloisDeformations R04.1 is pro-represented by a complete local Noetherian 𝒪-algebra R^□_ρ̄ ∈ C_𝒪 with universal lift ρ^□ : G_K → GL_n(R^□_ρ̄).


### LocalGaloisDeformationRings:R08.1/local-tangent-obstruction (theorem)

K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. (1) m_{R^□}/(m², λ) is dual to Z¹(G_K, ad ρ̄), of dimension h¹ + n² − h⁰ where h^i = dim_𝔽 H^i(G_K, ad ρ̄). (2) R^□_ρ̄ ≅ 𝒪[[x₁, …, x_d]]/J with d = dim Z¹(G_K, ad ρ̄), and the canonical obstruction map H²(G_K, ad ρ̄)^∨ ↠ J/𝔪J is surjective (equivalently (J/𝔪J)^∨ ↪ H²(G_K, ad ρ̄)), so J is generated by at most h² elements. (3) By local Tate duality h² = dim H⁰(G_K, ad ρ̄^∨(1)), and by the local Euler characteristic formula h⁰ − h¹ + h² = −n²[K:ℚ_p] if ℓ = p and 0 if ℓ ≠ p; hence dim R^□_ρ̄ ≥ 1 + n² + n²[K:ℚ_p] if ℓ = p and ≥ 1 + n² if ℓ ≠ p, and R^□_ρ̄ is formally smooth of relative dimension n²(1 + [K:ℚ_p]) if ℓ = p and n² if ℓ ≠ p when H⁰(G_K, ad ρ̄^∨(1)) = 0.


### LocalGaloisDeformationRings:R08.1/local-fixed-determinant (theorem)

K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. Let χ : G_K → 𝒪^× lift det ρ̄. The fixed-determinant lifting ring R^□_{ρ̄,χ} (GlobalGaloisDeformations R04.2) has tangent space Z¹(G_K, ad⁰ρ̄) and obstructions in H²(G_K, ad⁰ρ̄) when p ∤ n; its dimension is ≥ 1 + (n² − 1)(1 + [K:ℚ_p]) for ℓ = p and ≥ n² for ℓ ≠ p; and R^□_ρ̄ ≅ R^□_{ρ̄,χ} ⊗̂_𝒪 𝒪[[G_K^{ab,(p)}]] (p ∤ n).


### LocalGaloisDeformationRings:R08.1/local-forget-framing (theorem)

K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. If ρ̄ is Schur as a G_K-representation, the local universal deformation ring R_ρ̄ exists and R^□_ρ̄ ≅ R_ρ̄[[X_{ij}]]/(X_{11}) (n² − 1 variables), also with fixed determinant. If ρ̄ is not Schur (the usual case locally), R_ρ̄ need not exist and only the framed ring, with the conjugation action of the formal group Γ̂_n, is used.


### LocalGaloisDeformationRings:R08.1/archimedean-rings-p-odd (lemma)

Let K = ℝ, G_ℝ = {1, c}, p odd, and ρ̄ : G_ℝ → GL_n(𝔽). Then H^i(G_ℝ, ad ρ̄) = 0 for i ≥ 1, R^□_ρ̄ is formally smooth over 𝒪 of relative dimension n² − dim (ad ρ̄)^{c}, and every lift is Γ̂_n-conjugate to the Teichmüller lift of ρ̄ (with ρ̄(c) diagonalised). For n = 2 and ρ̄ odd (det ρ̄(c) = −1), the relative dimension is 2, and with fixed determinant χ (χ(c) = −1) it is also 2.


### LocalGaloisDeformationRings:R08.1/archimedean-odd-ring-p2 (theorem)

Let p = 2, n = 2, K = ℝ, ψ : G_ℝ → 𝒪^× with ψ(c) = −1, and ρ̄ : G_ℝ → GL₂(𝔽) with det ρ̄ = ψ mod 2 (so ρ̄(c) is 1 or conjugate to (1 1; 0 1)). The fixed-determinant lifts send c to M = (a b; c′ −a) with a² + bc′ = 1, so R^{□,ψ} = 𝒪[[a − a₀, b − b₀, c′ − c′₀]]/(a² + bc′ − 1) centred at a lift (a₀, b₀, c′₀) of ρ̄(c). It is a complete intersection domain of relative dimension 2 over 𝒪; every 𝒪-point is odd, so R^odd = R^{□,ψ}; R^odd[1/2] is formally smooth; R^odd ⊗ 𝔽 is a domain.


### LocalGaloisDeformationRings:R08.1/local-residue-field-change (lemma)

K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. For a finite local 𝒪 → 𝒪′ with residue extension 𝔽 ⊆ 𝔽′: R^□_{ρ̄⊗𝔽′,𝒪′} ≅ R^□_{ρ̄,𝒪} ⊗̂_𝒪 𝒪′, likewise with fixed determinant and (Schur) unframed; the tangent, obstruction and Euler-characteristic invariants of local-tangent-obstruction are unchanged (h^i(G_K, ad ρ̄ ⊗ 𝔽′) = h^i(G_K, ad ρ̄)), so the dimension bounds and formal smoothness are preserved.


### LocalGaloisDeformationRings:R08.2/tame-splitting (lemma)

K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. Let P_K ⊆ I_K be the kernel of a surjection I_K ↠ ℤ_p (pro-order prime to p). Then G_K = P_K ⋊ T_K with T_K = G_K/P_K ≅ ℤ_p ⋊ ℤ̂ (Frobenius acting by q). For an irreducible 𝔽[P_K]-module τ with stabiliser G_τ, deformations of ρ̄ are equivalent to tuples of deformations of the multiplicity spaces ρ̄_τ = Hom_{P_K}(τ, ρ̄) as T_τ-representations.


### LocalGaloisDeformationRings:R08.2/unramified-lifting-ring (theorem)

K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. If ρ̄ is unramified, the unramified lifts form a deformation problem, and its ring is formally smooth over 𝒪 in n² variables (n² − 1 with fixed unramified determinant): an unramified lift is determined by ρ(φ) ∈ GL_n(A) lifting ρ̄(φ), for a Frobenius lift φ.


### LocalGaloisDeformationRings:R08.2/minimally-ramified-condition (definition)

K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. A lift ρ of an m-dimensional representation ρ̄ of T_q = ℤ_p ⋊ ℤ is minimally ramified if ker(ρ(σ_q) − 1)^i ⊗_R 𝔽 → ker(ρ̄(σ_q) − 1)^i is an isomorphism for all i; a lift of ρ̄ : G_K → GL_n(𝔽) is minimally ramified if each tame piece ρ_τ (tame-splitting) is. Equivalently, the filtration Fil^i = ker(ρ(σ_q) − 1)^i is by direct summands lifting the residual one, with σ_q acting trivially on the graded pieces.

- API `TauCeti.GaloisDeformation.Local.IsMinimallyRamified`: The minimally ramified condition on lifts of ρ̄|_{T_q} and of ρ̄.
- API `TauCeti.GaloisDeformation.Local.isMinimallyRamified_iff_filtration`: Equivalent to a σ_q-unipotent filtration by direct summands lifting the residual kernel filtration.
- API `TauCeti.GaloisDeformation.Local.IsMinimallyRamified.conj`: Stable under Γ̂_n-conjugation.
- API `TauCeti.GaloisDeformation.Local.minimallyRamified_deformationProblem`: Minimally ramified lifts form a deformation problem.
- API `TauCeti.GaloisDeformation.Local.minimal_baseChange`: A map of coefficient algebras carries a minimal lift and its split kernel flag to the corresponding minimal lift; each kernel commutes with base change.
- API `TauCeti.GaloisDeformation.Local.minimal_generator_independent`: Replacing a topological generator of the pro-p tame inertia factor by its unit power gives the same minimal condition and kernel filtration.
- Test `minRam_unramified` (compatibility): For unramified ρ̄, minimally ramified = unramified.
- Test `minRam_conj` (characterisation): Conjugating by Γ̂_n preserves the condition.
- Test `minRam_non_example` (non-example): ρ(σ_q) = (1 x; 0 1), x ∈ m_A∖0, lifting ρ̄(σ_q) = 1, is not minimally ramified.

### LocalGaloisDeformationRings:R08.2/minimally-ramified-ring (theorem)

K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. The minimally ramified problem D_v is liftable, its tangent space L_v has dimension h⁰(G_K, ad ρ̄), and R^loc/I(D_v) is a power series ring in n² variables over 𝒪. If p ∤ #ρ̄(I_K), a lift is minimally ramified iff it vanishes on ker ρ̄|_{I_K}, and L_v = H¹(G_K/I_K, (ad ρ̄)^{I_K}).


### LocalGaloisDeformationRings:R08.2/unrestricted-away-from-p (theorem)

K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. (1) If H⁰(G_K, (ad ρ̄)(1)) = 0 then H²(G_K, ad ρ̄) = 0 and R^□_ρ̄ is a power series ring in n² variables over 𝒪. (2) For n = 2 and fixed determinant χ: R^□_{ρ̄,χ} is equidimensional of Krull dimension 4, R^□_{ρ̄,χ}[1/p] has dimension 3, its irreducible components are regular and finitely many, and the restriction to inertia of the Weil–Deligne type (forgetting N) is constant on each component.


### LocalGaloisDeformationRings:R08.2/inertial-type-quotient (definition)

For n = 2, ℓ ≠ p and a full inertial Weil–Deligne type τ = (r|I_K,N), let R^□_{ρ̄,χ,τ} be the reduced 𝒪-flat quotient defined by the Zariski closure in Spec R^□_{ρ̄,χ} of its characteristic-zero points of exact type τ. A nonzero such quotient is a union of irreducible components of absolute Krull dimension 4. Exact-type points lie in its generic fibre and are Zariski dense there; boundary points may have smaller monodromy. The pointwise iff in Gee §3.31 requires correction (E3). Only finitely many types give nonzero quotients.

- API `TauCeti.GaloisDeformation.Local.typeQuotient`: R^□_{ρ̄,χ,τ} as a quotient of R^□_{ρ̄,χ}.
- API `TauCeti.GaloisDeformation.Local.typeQuotient_points`: Every exact-type point factors through the type quotient; its exact-type points are Zariski dense. The converse can fail on component intersections.
- API `TauCeti.GaloisDeformation.Local.typeQuotient_krullDim`: Nonzero ⇒ Krull dimension 4 (n = 2).
- API `TauCeti.GaloisDeformation.Local.typeQuotient_finite`: Only finitely many full inertial types have a nonzero closure quotient.
- API `TauCeti.GaloisDeformation.Local.typeQuotient_unique`: The defining ideal is the intersection of the kernels of all characteristic-zero exact-type points. Any reduced 𝒪-flat quotient defined by that same closure has the same kernel, hence a unique compatible quotient-ring isomorphism.
- Test `typeQuotient_unramified` (computation): For ρ̄ unramified, trivial r|I_K and N = 0 give the unramified quotient. The closure of a Steinberg type with N ≠ 0 can meet it at an N = 0 point.
- Test `typeQuotient_finite` (characterisation): Only finitely many types occur.
- Test `typeQuotient_not_torsion` (non-example): The naive quotient by the equations of the type need not be p-torsion free; the definition takes the flat closure.

### LocalGaloisDeformationRings:R08.2/taylor-wiles-local-ring (theorem)

Let n = 2, ℓ ≠ p, ρ̄ unramified with ρ̄(Frob_K) having distinct eigenvalues, q ≡ 1 mod p with p^m ∥ q − 1, and χ unramified. Then R^□_{ρ̄,χ} ≅ 𝒪[[x, y, B, u]]/((1 + u)^{p^m} − 1), with ρ^□(φ) = (1 y; x 1)^{-1} diag(α + B, χ(φ)/(α + B)) (1 y; x 1) and ρ^□(σ) = (1 y; x 1)^{-1} diag(1 + u, (1 + u)^{-1}) (1 y; x 1).


### LocalGaloisDeformationRings:R08.2/steinberg-condition (definition)

Let ℓ ≠ p, ρ̄ trivial of dimension n, q ≡ 1 mod p. D^Stein,1 consists of the lifts ρ with char ρ(σ)(X) = (X − 1)^n for σ ∈ I_K and char ρ(φ)(X) ∈ Pol_n({n}, q), i.e. Frobenius eigenvalues of the form α, qα, …, q^{n−1}α; D^Stein is its flat closure (the quotient by λ-power torsion). For n = 2 this is Gee's P_m: char ρ(σ) = (X − 1)² and q(tr ρ(φ))² = (1 + q)² det ρ(φ). The condition records the monodromy relation; it is not the same as scalar (unipotent) inertial semisimplification, which is D^{(1,…,1)}.

- API `TauCeti.GaloisDeformation.Local.SteinbergLifts`: D^Stein,1 and its flat closure D^Stein.
- API `TauCeti.GaloisDeformation.Local.steinberg_charpoly_frob`: Frobenius eigenvalues in ratio q.
- API `TauCeti.GaloisDeformation.Local.steinberg_le_unipotentInertia`: D^Stein ⊆ D^{(1,…,1)}.
- API `TauCeti.GaloisDeformation.Local.steinberg_n_two`: For n = 2, the relation q(tr ρ(φ))² = (1 + q)² det ρ(φ).
- API `TauCeti.GaloisDeformation.Local.SteinbergLifts.baseChange`: A coefficient map carries a lift with unipotent inertia and a chosen q-chain Frobenius polynomial to one satisfying the same equations. A lift represented by the 𝒪-flat closure stays represented by that quotient after composition.
- Test `stein_n_two_relation` (computation): For n = 2 the Steinberg relation is q(tr ρ(φ))² = (1 + q)² det ρ(φ).
- Test `stein_subset_unipotent` (characterisation): Every Steinberg lift has unipotent inertia.
- Test `stein_not_unipotent_only` (non-example): An unramified lift with Frobenius eigenvalue ratio ≠ q has unipotent inertia but is not Steinberg.

### LocalGaloisDeformationRings:R08.2/ihara-avoidance-components (theorem)

Let ℓ ≠ p, ρ̄ trivial, q ≡ 1 mod p, characters χ_i : I_K → 1 + λ trivial mod λ. (1) If the χ_i are distinct, Spec R^□/I^{(χ_i)} is irreducible with characteristic-zero generic point and Krull dimension n² + 1. (2) R^□/(λ, I^{(χ_i)}) = R^□/(λ, I^{(1,…,1)}). (3) All components of Spec R^□/I^{(1,…,1)} have dimension n² + 1 with characteristic-zero generic points, and each prime minimal over λ contains a unique minimal prime. (4) Spec R^□/I^Stein is irreducible of dimension n² + 1. For n = 2 with χ trivial: the minimal primes of R^□_{ρ̄,χ} are √P_ur, √P_m and √P_ζ (ζ ≠ 1), with √P₁ = √P_ur ∩ √P_m, and R^□_{χ,1}/λ = R^□_{χ,ζ}/λ.


### LocalGaloisDeformationRings:R08.3/hodge-and-galois-types (definition)

Let E/ℚ_p be finite. A p-adic Hodge type v = (D_E, Fil^i D_{E,K}, 0 ≤ i ≤ h) is a finite-dimensional E-vector space D_E with a filtration of D_{E,K} = D_E ⊗_{ℚ_p} K by E ⊗ K-submodules whose graded pieces lie in degrees [0, h]. For a finite E-algebra B, a de Rham B-representation V_B of G_K is of p-adic Hodge type v if its Hodge–Tate weights lie in [0, h] and gr^i Hom_{B[G_K]}(V_B, B_dR ⊗ B) ≅ gr^i D_{E,K} ⊗_E B for all i. A Galois type is τ : I_K → GL_r(E) with open kernel; a potentially semistable V_B is of type τ if tr(γ | D*_pst(V_B)) = tr τ(γ) for all γ ∈ I_K. The number that enters dimension formulas is dim_E ad D_{E,K}/Fil⁰ad D_{E,K} = Σ_{σ : K → Ē} (d² − Σ_j m_{σ,j}²)/2, with m_{σ,j} the multiplicities of the jumps of the σ-component.

- API `TauCeti.GaloisDeformation.Local.HodgeType`: (D_E, Fil^• D_{E,K}) with jumps in [0, h].
- API `TauCeti.GaloisDeformation.Local.GaloisType`: τ : I_K → GL_r(E) with open kernel.
- API `TauCeti.GaloisDeformation.Local.IsOfType`: V_B is potentially semistable of type (τ, v).
- API `TauCeti.GaloisDeformation.Local.HodgeType.adQuotDim`: dim_E ad D_{E,K}/Fil⁰ = Σ_σ (d² − Σ_j m_{σ,j}²)/2.
- API `TauCeti.GaloisDeformation.Local.HodgeType.filteredIsom_iff`: Over a splitting coefficient field, two filtered K⊗E-modules of the given rank are filtered-isomorphic iff their graded multiplicities agree at every embedding and jump. This concerns filtered isomorphism classes, not equality of raw filtration subspaces.
- API `TauCeti.GaloisDeformation.Local.GaloisType.conjugacy`: A change of basis conjugates the finite inertia representation and gives an isomorphic Galois type; isomorphism classes and the type condition are independent of the chosen matrix representative.
- Test `adQuotDim_regular` (computation): Regular weights give [K : ℚ_p]·d(d − 1)/2 (for d = 2, K = ℚ_p: 1).
- Test `adQuotDim_formula` (characterisation): (d² − Σ m_j²)/2 counts pairs of weights in different jumps; checked for d = 3 with multiplicities (2, 1): (9 − 5)/2 = 2.
- Test `galoisType_open_kernel` (non-example): The restriction to I_K of the cyclotomic character has infinite image, so it is not a Galois type.

### LocalGaloisDeformationRings:R08.3/semistable-height-quotient (theorem)

Let A° be a complete local Noetherian W(𝔽)-algebra, A = A°[1/p], V_{A°} finite free of rank r with continuous G_K-action, and h ≥ 0. There is a quotient A_{st,h} of A such that a map ζ : A → B to a finite ℚ_p-algebra factors through A_{st,h} if and only if V_B = V_A ⊗ B is semistable with Hodge–Tate weights in [0, h]. It carries a projective W_{A_{st,h}}-module D of rank r with semilinear φ and linear N, and for such ζ, D ⊗ B ≅ Hom_{B[G_K]}(V_B, B⁺_st ⊗ B) compatibly with φ and N.


### LocalGaloisDeformationRings:R08.3/hodge-type-components (lemma)

Fix a p-adic Hodge type v over E and suppose A is an E-algebra. There is a quotient A_{st,v} of A_{st,h}, corresponding to a union of connected components of Spec A_{st,h}, such that ζ : A → B (B a finite E-algebra) factors through A_{st,v} exactly when V_B is semistable of p-adic Hodge type v.


### LocalGaloisDeformationRings:R08.3/pst-deformation-ring (theorem)

Fix a finite Galois extension L/K and a bounded Hodge-type family of representations semistable over L. In this common semistable-over-L quotient, Hodge type and the finite inertial type factoring through I_K/I_L are locally constant on the generic fibre. Each fixed (τ,v) locus is a union of connected, hence of irreducible, components of that quotient. This assertion concerns the bounded semistable quotient, not the unrestricted lifting ring R^□[1/p].


### LocalGaloisDeformationRings:R08.3/filtered-phi-N-deformations (lemma)

For L/K finite Galois and d ≥ 1, let Mod_{φ,N}(A) (A a ℚ_p-algebra) be the groupoid of finite projective L_0 ⊗ A-modules D_A of rank d, locally free, with semilinear Gal(L/K)-action, nilpotent N and semilinear bijective φ with pφN = Nφ; Mod_{F,φ,N} adds a Gal(L/K)-stable filtration of D_{A,L} by projective submodules. Let C•(D) be the total complex of (ad D)^{G_{L/K}} with the maps 1 − φ, N and pφ − 1, and H•(D) its cohomology. For a small extension A → A/I of local ℚ_p-algebras: if H²(D_{A/𝔪}) = 0 a lift exists; lifts form a torsor under H¹ ⊗ I (with H¹_F, involving ad D_L/Fil⁰ad D_L, in the filtered case); forgetting the filtration is formally smooth. For D_A over Noetherian A with A → Mod_{φ,N} formally smooth, the complement of the support of H²(D_A) is dense and formally smooth over ℚ_p. For the potentially semistable quotients, the completion at each maximal ideal maps formally smoothly to Mod_{F,φ,N} (Proposition 3.3.1).


### LocalGaloisDeformationRings:R08.3/pst-generic-fibre (theorem)

Spec (R^□_{V_𝔽}[1/p])^{τ,v} is equidimensional of dimension d² + dim_E ad D_{E,K}/Fil⁰ad D_{E,K} and has a formally smooth dense open subscheme. If End_{𝔽[G_K]}V_𝔽 = 𝔽, the same holds for (R_{V_𝔽}[1/p])^{τ,v} with dimension 1 + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}. Consequently a nonzero R^{□,τ,v} has Krull dimension 1 + d² + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}, and imposing a compatible determinant with nonzero fixed-determinant quotient lowers these dimensions by one.


### LocalGaloisDeformationRings:R08.3/pcris-generic-smooth (theorem)

Spec (R^□_{V_𝔽}[1/p])^{τ,v}_cr is formally smooth and equidimensional of dimension d² + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}; for End_{𝔽[G_K]}V_𝔽 = 𝔽 the unframed version has dimension 1 + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}. In particular (R^□[1/p])^{τ,v}_cr is reduced, and R^{□,τ,v}_cr[1/p] = (R^□[1/p])^{τ,v}_cr. In the Fontaine–Laffaille range (K/ℚ_p unramified, τ trivial, distinct weights whose maximum minus minimum is ≤ p − 2) the fixed-determinant ring is formally smooth over 𝒪, a power series ring in d² − 1 + [K : ℚ_p]·d(d − 1)/2 variables.


### LocalGaloisDeformationRings:R08.3/pst-coefficient-change (lemma)

For a finite extension 𝒪_E → 𝒪_{E′} (possibly with a residue field extension 𝔽 ⊆ 𝔽′), R^{□,τ,v}_{V_𝔽 ⊗ 𝔽′, 𝒪_{E′}} ≅ R^{□,τ,v}_{V_𝔽, 𝒪_E} ⊗_{𝒪_E} 𝒪_{E′}, compatibly with R^□_{V_𝔽⊗𝔽′,𝒪_{E′}} ≅ R^□_{V_𝔽,𝒪_E} ⊗̂_{𝒪_E} 𝒪_{E′} (R08.1/local-residue-field-change); likewise for the crystalline and unframed variants.


### LocalGaloisDeformationRings:R08.4/flat-deformation-condition (construction)

The deformations of V_𝔽 over Artinian 𝒪-algebras A that are the generic fibre of a finite flat group scheme over 𝒪_K form a deformation condition: D^fl ⊆ D_{V_𝔽} is relatively representable. So the framed lifting ring R^□ (R08.1/local-lifting-ring) has a quotient R^{fl,□} classifying flat lifts, and when End_{𝔽[G_K]} V_𝔽 = 𝔽 the universal deformation ring has a quotient R^fl. An 𝒪_E-point is flat exactly when V_{𝒪_E}/p^n comes from a finite flat group scheme for every n, that is, when V_{𝒪_E} is the Tate module of a p-divisible group.

- API `TauCeti.GaloisDeformation.Local.flatLiftingRing`: R^{fl,□}, the quotient of R^□ classifying flat lifts.
- API `TauCeti.GaloisDeformation.Local.flatLiftingRing_points`: An 𝒪_E-point is flat iff it is the Tate module of a p-divisible group.
- API `TauCeti.GaloisDeformation.Local.flatDeformationRing`: R^fl when End V_𝔽 = 𝔽.
- API `TauCeti.GaloisDeformation.Local.flatLiftingRing.universal`: For an Artinian coefficient algebra A, the natural bijection Hom_cont,𝒪(R^{fl,□},A)≃{framed lifts to A satisfying the finite-flat deformation condition} commutes with coefficient maps. At coefficient integers its point criterion is the p-divisible-group criterion already stated.
- Test `flat_mu_p_plus_Z_p` (computation): 𝔽(1) ⊕ 𝔽 is finite flat.
- Test `flat_points_iff_pdivisible` (characterisation): 𝒪_E-points of R^{fl,□} are Tate modules of p-divisible groups.
- Test `omega_sq_not_flat` (non-example): ω² over ℚ_p (p > 3) has no finite flat model.

### LocalGaloisDeformationRings:R08.4/finite-flat-model-moduli (construction)

For a complete local R with residue field 𝔽 and ξ ∈ D^fl(R), the lattices of E-height ≤ 1 in M(V_R) (L7/height-lattice-moduli with h = 1: 𝔖_B-submodules 𝔐_B ⊂ M_B, projective of rank d, φ-stable, spanning, with coker(φ*𝔐_B → 𝔐_B) killed by E(u)) are represented by a projective R-scheme 𝒢ℛ_{V_𝔽,ξ}. For R = R^fl (End V_𝔽 = 𝔽), or R = R^{fl,□}, this gives a projective morphism Θ : 𝒢ℛ_{V_𝔽} → Spec R^fl sending a lattice to the flat deformation it defines. Its closed fibre 𝒢ℛ_{V_𝔽,0} is a projective 𝔽-scheme whose 𝔽′-points are the isomorphism classes of finite flat models of V_𝔽 ⊗ 𝔽′.

- API `TauCeti.GaloisDeformation.Local.finiteFlatModels`: 𝒢ℛ_{V_𝔽,ξ}, the projective R-scheme of E-height ≤ 1 lattices.
- API `TauCeti.GaloisDeformation.Local.finiteFlatModels_toFlat`: Θ : 𝒢ℛ_{V_𝔽} → Spec R^fl, projective.
- API `TauCeti.GaloisDeformation.Local.finiteFlatModels_closedFibre`: 𝒢ℛ_{V_𝔽,0}(𝔽′) ≃ finite flat models of V_𝔽 ⊗ 𝔽′.
- API `TauCeti.GaloisDeformation.Local.finiteFlatModels.points`: For an R-algebra B in the source moduli category, morphisms Spec B→𝒢ℛ_{V_𝔽,ξ} correspond to E-height≤1 projective lattices in M(ξ)_B, with the specified generic-fibre identification. Pullback of the universal lattice gives this bijection and commutes with B→B′.
- Test `finiteFlatModels_irreducible_Qp` (computation): K = ℚ_p, V_𝔽 irreducible: one model.
- Test `finiteFlatModels_closedFibre_models` (characterisation): Closed-fibre points are finite flat models.
- Test `finiteFlatModels_two_models_ramified` (non-example): Over ℚ_p(ζ_p), μ_p and ℤ/p are two models of one generic fibre.

### LocalGaloisDeformationRings:R08.4/small-ramification-flat (theorem)

If e(K/ℚ_p) < p − 1, then Θ : 𝒢ℛ_{V_𝔽,ξ} → Spec R is an isomorphism for every ξ, and in particular Θ : 𝒢ℛ_{V_𝔽} → Spec R^fl is an isomorphism: a flat deformation has a unique finite flat model.


### LocalGaloisDeformationRings:R08.4/flat-generic-fibre (theorem)

On the generic fibre, flat deformations are the crystalline deformations with Hodge–Tate weights in {0, 1}: for an E-point ξ of R^{fl,□}, the completion of R^{fl,□}[1/p] at ξ pro-represents crystalline deformations of V_ξ, it is formally smooth over E, and if ξ has p-adic Hodge type v = (v_ψ)_ψ (v_ψ the multiplicity of the weight 1 at the embedding ψ) its dimension is d² + Σ_ψ (d − v_ψ)v_ψ. For the unframed ring (End V_𝔽 = 𝔽) the dimension is 1 + Σ_ψ (d − v_ψ)v_ψ.


### LocalGaloisDeformationRings:R08.4/hodge-type-resolution (construction)

Let R be R^{fl,□} ⊗ 𝒪_F (or R^fl ⊗ 𝒪_F when End V_𝔽 = 𝔽), F large enough to contain the reflex fields, and v a p-adic Hodge type. Let R^v be the quotient of R cut out by the closure of the union of the connected components of Spec R[1/p] on which the Hodge type is v. The lattices whose φ*𝔐/E(u)𝔐 has determinant ∏_ψ ψ(a)^{v_ψ} form a closed subscheme 𝒢ℛ^v ⊂ 𝒢ℛ, and its p-torsion-free part 𝒢ℛ^{v,loc} carries a projective map Θ^v : 𝒢ℛ^{v,loc} → Spec R^v that becomes an isomorphism after inverting p.

- API `TauCeti.GaloisDeformation.Local.flatHodgeTypeQuotient`: R^v, the Hodge-type-v part of the flat ring.
- API `TauCeti.GaloisDeformation.Local.flatResolution`: 𝒢ℛ^{v,loc} with Θ^v : 𝒢ℛ^{v,loc} → Spec R^v projective.
- API `TauCeti.GaloisDeformation.Local.flatResolution_generic_iso`: Θ^v[1/p] is an isomorphism.
- API `TauCeti.GaloisDeformation.Local.flatResolution.points`: An admissible B-point is a finite-flat model lattice satisfying the labelled Hodge determinant/rank condition defining v. Pullback of the universal lattice and its filtration commutes with coefficient base change.
- Test `flatResolution_small_ramification` (degenerate): e < p − 1: Θ^v is an isomorphism integrally.
- Test `flatResolution_generic_iso` (characterisation): Θ^v is an isomorphism after inverting p.
- Test `flatResolution_not_integral_iso` (non-example): Θ^v has positive-dimensional closed fibre in general.

### LocalGaloisDeformationRings:R08.4/resolution-local-structure (theorem)

𝒢ℛ^{v,loc} is normal and Cohen–Macaulay, and its closed fibre 𝒢ℛ^{v,loc}_0 is reduced and normal with rational singularities. A closed point of 𝒢ℛ^v lies in 𝒢ℛ^{v,loc} exactly when, for each σ ∈ Gal(K₀/ℚ_p), the nilpotent endomorphism π of σ-part of φ*𝔐/E(u)𝔐 has Jordan type dominated by the dual partition of v_σ. If for each σ any two of the v_ψ with ψ|K₀ = σ differ by at most 1, and either every v_ψ ∈ {0, 1} or e ≤ 2, then 𝒢ℛ^{v,loc} = 𝒢ℛ^v.


### LocalGaloisDeformationRings:R08.4/components-via-special-fibre (theorem)

There is a bijection between the connected components of Spec R^v[1/p] and those of the closed fibre 𝒢ℛ^{v,loc}_0 of the resolution. Because Θ^v[1/p] is an isomorphism, this describes components of the deformation ring itself and not only of the moduli space: connectedness of the source alone would not suffice.


### LocalGaloisDeformationRings:R08.4/ordinary-type-of-components (lemma)

Every point 𝔐_A of the moduli has a maximal multiplicative subobject 𝔐^m_A and a maximal étale quotient 𝔐^ét_A, compatible with base change and exchanged by duality; their ranks d_m and d_ét are constant on each connected component of 𝒢ℛ^{v,loc}_0. For a pair d = (d_ét, d_m), an E-point x of Spec R^v lies on a connected component of Spec R^v[1/p] corresponding to a component of type d exactly when the maximal unramified subrepresentation of V_x(−1) has dimension d_m and the maximal unramified quotient of V_x has dimension d_ét.


### LocalGaloisDeformationRings:R08.4/rank-two-nonordinary-connected (theorem)

Let d = 2, v_ψ = 1 for all ψ (so 𝒢ℛ^v = 𝒢ℛ^{v,loc}), and K₀ = ℚ_p. Any two non-ordinary 𝔽′-points of 𝒢ℛ^v_0 lie on the same connected component. So the non-ordinary locus of Spec R^v[1/p] is connected.


### LocalGaloisDeformationRings:R08.4/rank-two-ordinary-locus (theorem)

Let d = 2 and v_ψ = 1 for all ψ (K₀ arbitrary). The ordinary part 𝒢ℛ^{v,ord}_0 of the closed fibre, if non-empty, is a single point, unless V_𝔽 ≅ χ₁ ⊕ χ₂ with χ₁, χ₂ unramified. In that case it is two points (the models D(𝒢_{χ₁^{−1}ω}) ⊕ 𝒢_{χ₂} and D(𝒢_{χ₂^{−1}ω}) ⊕ 𝒢_{χ₁}) if χ₁ ≠ χ₂, and ℙ¹ if χ₁ = χ₂, all its models being isomorphic to D(𝒢_{χ₁^{−1}ω}) ⊕ 𝒢_{χ₁}.


### LocalGaloisDeformationRings:R08.4/rank-two-bt-components (theorem)

Let d = 2, v_ψ = 1 for all ψ (Barsotti–Tate with cyclotomic-type determinant), R = R^{fl,□} ⊗ 𝒪_F and R^v its Hodge-type-v quotient. (1) R^v is flat over ℤ_p of pure relative dimension 4 + [K : ℚ_p], and R^v[1/p] is formally smooth; its irreducible components are its connected components. (2) If E-points x₁, x₂ lie on the same irreducible component, then V_{x₁} and V_{x₂} are both ordinary or both non-ordinary. Conversely they lie on the same component if (i) both are non-ordinary and K₀ = ℚ_p, or (ii) both are ordinary and the characters of G_K on the lines L_i ⊂ V_{x_i} where I_K acts cyclotomically have the same reduction mod π_E. The same holds for R^fl ⊗ 𝒪_F when End V_𝔽 = 𝔽, with relative dimension 1 + [K : ℚ_p]. In particular a modular point and a lift meet the same component exactly when they satisfy these matching conditions, which is how Kisin chooses his auxiliary modular forms.


### LocalGaloisDeformationRings:R08.4/savitt-weight-two-rings (theorem)

Let p be odd, ρ̄ : G_{ℚ_p} → GL_2(k_E) with End ρ̄ = k_E, and R(2, τ, ρ̄) the quotient of the universal deformation ring by the intersection of the primes of type (2, τ) (potentially Barsotti–Tate of inertial type τ, Hodge–Tate weights (0, 1), fixed determinant). (1) If τ = ω̃^i ⊕ ω̃^j with i ≢ j mod p − 1: R(2, τ, ρ̄) = 0 unless ρ̄|I_p is (ω^{1+i} ∗; 0 ω^j), (ω^{1+j} ∗; 0 ω^i) or ω₂^k ⊕ ω₂^{pk} with k = 1 + {j − i} + (p + 1)i; it is 𝒪_E⟦Y⟧ in the two reducible cases, and 𝒪_E⟦X₁, X₂⟧/(X₁X₂ − pw) with w ∈ 𝒪_E^× in the irreducible case (E ⊇ ℚ_{p²}, √det ρ̄(Frob_p) ∈ k_E). (2) If τ = ω̃₂^m ⊕ ω̃₂^{pm} with p + 1 ∤ m: R(2, τ, ρ̄) is 𝒪_E⟦B⟧ for the reducible and irreducible shapes listed by Savitt (Theorem 6.23), and 0 otherwise. So the Breuil–Mézard conjecture holds for k = 2 and τ tame. Explicitly in Theorem 6.23 write m = i + (p+1)j, 1≤i≤p, so p+1∤m. The reducible inertial shapes are (ω^{i+j} *;0 ω^{1+j}) and (ω^{1+j} *;0 ω^{i+j}); the first extension is peu ramifié for i=2 and the second for i=p−1. The irreducible inertial shapes are ω₂^{p+m}⊕ω₂^{1+pm} and ω₂^{1+m}⊕ω₂^{p(1+m)}. These cases give 𝒪_E[[B]], and all other shapes give zero. For Theorem 6.22 the nodal case has τ=ω̃^i⊕ω̃^j, i≢j mod p−1, and ρ̄|I_p=ω₂^a⊕ω₂^{pa}, a=1+{j−i}+(p+1)i, where 0<{j−i}<p−1; assume E contains ℚ_{p²} and k_E contains a square root of det ρ̄(Frob_p).


### LocalGaloisDeformationRings:R08.6/smooth-resolution-criterion (lemma)

Let R^□_X be a nonzero quotient of the framed ring R^□ by a (GL_d)_1-stable ideal. A smooth resolution is a flat 𝒪-scheme ℛ with f : ℛ → Spec R^□_X such that: (1) f is proper with 𝒪_{Spec R^□_X} → f_*𝒪_ℛ injective; (2) ℛ[1/p] → Spec R^□[1/p] is a closed immersion; (3) the fibre Y over the closed point is geometrically connected; (4) ℛ has a smooth algebraization along Y. If such a resolution exists, then R^□_X is a domain, R^□_X[1/p] is regular, the relative dimension of R^□_X over 𝒪 equals that of ℛ, and the 𝒪̄-points of D^□_X are the images of the points of ℛ specialising into Y.


### LocalGaloisDeformationRings:R08.6/kw-local-conditions (definition)

For a place v of a totally real F and ρ̄_v : D_v → GL_2(𝔽) with fixed determinant φ = ψχ_p, R̄^{□,ψ}_v is the flat, reduced quotient of R^{□,ψ}_v classifying, in the sense of KW II Definition 2.4, the lifts satisfying one of the following conditions X_v:
(∞) odd lifts;
(p) with F_v/ℚ_p unramified, and F_v = ℚ_p when ρ̄_v is irreducible or k(ρ̄_v) = p+1: low-weight crystalline lifts (crystalline of weight k(ρ̄_v) ≤ p, or ordinary of weight p+1 when k = p+1); weight-two lifts (for p odd, potentially semistable of weight 2 with inertial Weil–Deligne parameter (ω^{k−2} ⊕ 1, 0), or (1, N) with N ≠ 0 when k = p+1; for p = 2, crystalline of weight 2 if k = 2 and semistable of weight 2 if k = 4); semistable weight-two lifts (γ_vχ_p ∗; 0 γ_v) with a fixed unramified γ_v;
(v ∤ p) semistable lifts (γ_vχ_p ∗; 0 γ_v) with fixed γ_v (§3.3.4), or inertia-rigid lifts conjugate on inertia to a fixed ρ₀ (§3.3.1–3.3.3; F_v = ℚ_q in §3.3.3).
The choices (an unramified character when ρ̄_v ≅ η̄₁ ⊕ η̄₂ is unramified with k = p; the characters γ_v; the lift ρ₀) are part of the datum.

- API `TauCeti.GaloisDeformation.Local.KWCondition`: A KW II local condition at v, with its choices.
- API `TauCeti.GaloisDeformation.Local.KWCondition.ring`: R̄^{□,ψ}_v as the flat reduced quotient classifying X_v-lifts.
- API `TauCeti.GaloisDeformation.Local.KWCondition.points`: 𝒪′-points of the ring are exactly the X_v-lifts.
- API `TauCeti.GaloisDeformation.Local.KWCondition.ring_unique`: With all local type, weight, determinant and chosen-character data fixed, two reduced 𝒪-flat quotient rings having the same characteristic-zero X_v-points have the same kernel in R^□_v and a unique isomorphism respecting that quotient map.
- Test `kwCondition_infinity` (computation): Odd lifts at a real place.
- Test `kwCondition_points` (characterisation): The ring classifies exactly the X_v-lifts on 𝒪′-points.
- Test `kwCondition_choice_needed` (non-example): For unramified ρ̄_v = η̄₁ ⊕ η̄₂ with η̄₁ ≠ η̄₂, the union over both choices of the unramified-quotient character has two components, so it is not a domain; KW II fix one choice.

### LocalGaloisDeformationRings:R08.6/export-archimedean (theorem)

At a real place v, R̄^{□,ψ}_∞ (odd lifts) is the completion of the quadric of 2 × 2 matrices with characteristic polynomial X² − 1 at ρ̄(c). It is a domain, flat over 𝒪 of relative dimension 2, with regular generic fibre. It is formally smooth when ρ̄(c) ≠ 1, which always holds for p ≠ 2. For p = 2 and ρ̄(c) = 1 it is 𝒪⟦X₁, X₂, X₃⟧/(X₁² + X₂X₃ + 2X₁), a relative complete intersection.


### LocalGaloisDeformationRings:R08.6/export-fontaine-laffaille-irreducible (theorem)

Let F_v = ℚ_p and ρ̄_p be irreducible of weight k ≤ p. The ring of crystalline lifts of weight k with fixed determinant is formally smooth over 𝒪 of relative dimension 1, and the framed ring R̄^{□,ψ}_v is formally smooth of relative dimension 4 = 3 + [ℚ_p : ℚ_p]. The same holds for p = 2 (k = 2).


### LocalGaloisDeformationRings:R08.6/export-weight-two-irreducible (theorem)

Let p ≠ 2, F_v = ℚ_p and ρ̄_p irreducible. After enlarging 𝒪, the fixed-determinant ring of weight-two potentially semistable lifts of this nontrivial tame principal-series inertial type is 𝒪⟦T₁, T₂⟧/(T₁T₂ − p), and every 𝒪′-point is of the required type. The framed ring R̄^{□,ψ}_v ≅ 𝒪⟦T₁, …, T₅⟧/(T₁T₂ − p) is a domain, flat of relative dimension 4, with regular generic fibre, and it is not formally smooth.


### LocalGaloisDeformationRings:R08.6/export-ordinary (theorem)

Let F_v/ℚ_p be unramified, ρ̄_v ordinary with k(ρ̄_v) ≤ p, and X_v the low-weight crystalline or weight-two potentially Barsotti–Tate condition, with the chosen unramified character. Then R̄^{□,ψ}_v is a domain, flat over 𝒪 of relative dimension 3 + [F_v : ℚ_p], with regular generic fibre. It is formally smooth if ρ̄_v is ramified or ρ̄_v ≅ η₁ ⊕ η₂ with η₁ ≠ η₂ unramified. Every lift of this type is (χ₁η₁ ∗; 0 η₂) with η₁, η₂ unramified, where χ₁ = χ_p^{k−1} (crystalline) or χ_pω^{k−2} (weight two).


### LocalGaloisDeformationRings:R08.6/export-semistable-weight-two-at-p (theorem)

Let ρ̄_v = (γ̄_vχ̄_p ∗; 0 γ̄_v) with γ̄_v unramified, and X_v the semistable weight-two lifts (γ_vχ_p ∗; 0 γ_v) with a fixed unramified γ_v lifting γ̄_v and γ_v²χ_p = φ. R̄^{□,ψ}_v is formally smooth over 𝒪 of relative dimension 3 + [F_v : ℚ_p], unless p = 2 and D_v acts by homotheties. In that case it is a domain, faithfully flat of relative dimension 3 + [F_v : ℚ_p], with regular generic fibre.


### LocalGaloisDeformationRings:R08.6/export-endpoint-weight (theorem)

Let p>2, F_v=ℚ_p and k(ρ̄_v)=p+1 in the KW II §3.2.7 residual Serre-weight case, with its compatible fixed determinant. The framed ring of crystalline (hence ordinary) lifts of weight p+1 is formally smooth over 𝒪 of relative dimension 4. The map to the space of characters of the stable line is not formally smooth.


### LocalGaloisDeformationRings:R08.6/export-away-from-p (theorem)

Let v ∤ p. (a) Semistable condition (γ_vχ_p ∗; 0 γ_v) with a fixed character γ_v (Teichmüller on inertia, γ_v²χ_p = φ): R̄^{□,ψ}_v is a domain, flat of relative dimension 3, with regular generic fibre (§3.3.4). (b) Inertia-rigid conditions (minimally ramified, abelian with fixed inertial character, non-abelian of level two with F_v = ℚ_q): after enlarging 𝒪 there is a lift ρ₀ with finite ρ₀(I_v) and determinant φ. The ring is flat, each component of relative dimension 3, with regular generic fibre (GlobalGaloisDeformations R04.4/inertia-rigid-deformations with d = 2, fixed determinant).


### LocalGaloisDeformationRings:R08.6/export-completed-tensor-product (theorem)

For S a finite set of places and conditions X_v of kw-local-conditions at each v ∈ S, after enlarging 𝒪, R̄^{□,loc,ψ} = ⊗̂_{v∈S} R̄^{□,ψ}_v is flat over 𝒪, each component has relative dimension 3|S| when F is totally real and S contains the infinite places and the places above p, and R̄^{□,loc,ψ}[1/p] is regular. If the conditions at the finite places of S not above p are semistable, it is a domain. It has points over the integers of a finite extension of E.


### LocalGaloisDeformationRings:R08.6/local-nonemptiness (theorem)

For every condition X_v of kw-local-conditions (with the hypotheses of KW II Theorem 3.1), R̄^{□,ψ}_v ≠ 0, and it has a point over the integers 𝒪′ of a finite extension of E, that is, a lift of ρ̄_v of type X_v. The same holds for their completed tensor product.


### LocalGaloisDeformationRings:L7/finite-height-lattices (definition)

Let K/ℚ_p be finite with residue field k, W = W(k), e = [K : W[1/p]], π a uniformiser with Eisenstein polynomial E(u) ∈ W[u], 𝔖 = W⟦u⟧ with φ(u) = u^p and the Frobenius on W, 𝒪_ℰ the p-adic completion of 𝔖[1/u], and K_∞ = ∪_n K(π_n) for compatible p^n-th roots π_n of π. For V a finite free module of rank d over ℤ_p (or over a complete local ring A with finite residue field) with continuous G_{K_∞}-action, M(V) = (𝒪_{ℰ^ur}^∧ ⊗̂ V*)^{G_{K_∞}} is a finite free 𝒪_ℰ-module (𝒪_{ℰ,A}-module) with φ*M ≅ M. For an A-algebra B, an 𝔖_B-lattice of E-height ≤ h in M_B = M ⊗_A B is an 𝔖_B-submodule 𝔐_B that is finite projective of rank d, generates M_B over 𝒪_ℰ ⊗ B, is φ-stable, and has coker(φ*𝔐_B → 𝔐_B) killed by E(u)^h. V has E-height ≤ h if M(V) contains such a lattice. Over finite flat ℤ_p-algebras the lattice is then unique, and a ℚ_p-representation has E-height ≤ h if one, and then every, G_{K_∞}-stable lattice does.

- API `TauCeti.GaloisDeformation.Local.HeightLattice`: An 𝔖_B-lattice of E-height ≤ h in M_B.
- API `TauCeti.GaloisDeformation.Local.HasEHeightLE`: V has E-height ≤ h.
- API `TauCeti.GaloisDeformation.Local.HeightLattice.baseChange`: Base change along B → B′.
- API `TauCeti.GaloisDeformation.Local.HeightLattice.unique`: Uniqueness over finite flat ℤ_p-algebras.
- API `TauCeti.GaloisDeformation.Local.HeightLattice.ext`: Two family lattices inside the same M_B, with the inherited Frobenius and specified generic-fibre identification, are equal if their underlying 𝔖_B-submodules are equal. Their height and projectivity witnesses are properties.
- Test `height_rank_one_E` (computation): 𝔐 = 𝔖e with φ(e) = E(u)e has E-height exactly 1.
- Test `height_zero_iff_etale` (characterisation): E-height ≤ 0 if and only if φ*𝔐 → 𝔐 is an isomorphism.
- Test `height_u_not_finite` (non-example): φ(e) = ue: E(u)^h is never divisible by u in 𝔖 (E(0) = p·unit), so 𝔖/u𝔖 is killed by no power of E(u).

### LocalGaloisDeformationRings:L7/height-lattice-moduli (theorem)

Let A be a complete local Noetherian ring with finite residue field 𝔽 and V_A finite free of rank d with continuous G_{K_∞}-action. (1) On A-algebras B with 𝔪_A^i B = 0 for some i, B ↦ {𝔖_B-lattices of E-height ≤ h in M_B} is represented by a projective A-scheme Θ_A : 𝓛^{≤h}_{V_A} → Spec A, compatible with base change and carrying a canonical very ample line bundle. (2) Θ_A becomes a closed immersion after inverting p. (3) If A^{≤h} is the quotient of A cut out by the scheme-theoretic image of Θ_A, then for every finite W(𝔽)[1/p]-algebra B, A → B factors through A^{≤h} exactly when V_B has E-height ≤ h. (4) There is a finite 𝔖_{A^{≤h}}-module 𝔐 with φ*𝔐 → 𝔐 of cokernel killed by E(u)^h, locally free after inverting p, which specialises at each such B to the unique lattice.


### LocalGaloisDeformationRings:L8/ordinary-coefficient-ring (construction)

Let F_v/ℚ_p be finite, 𝒪 the ring of integers of a finite extension E/ℚ_p with residue field k, and ρ̄ : G_{F_v} → GL_n(k) with a G_{F_v}-stable full flag 0 = Fil⁰ ⊂ ⋯ ⊂ Filⁿ = kⁿ, graded characters χ̃_i : G_{F_v} → k^× and χ̄_i = χ̃_i|_{I_{F_v}}. Let 𝒪_{F_v}^×(p) be the pro-p completion of 𝒪_{F_v}^×, with Art_{F_v} : 𝒪_{F_v}^×(p) ≅ I^{ab}_{F_v}(p). For a nonempty set of minimal primes of 𝒪[[𝒪_{F_v}^×(p)ⁿ]] with intersection 𝔞, Λ_v = 𝒪[[𝒪_{F_v}^×(p)ⁿ]]/𝔞; 𝔞 corresponds to a fixed collection of ordered n-tuples of characters of the torsion subgroup of I^{ab}_{F_v}(p). For each i the universal character χ_i^univ : I_{F_v} → Λ_v^× is the Teichmüller lift of χ̄_i times the map sending I_{F_v} to the i-th copy of 𝒪_{F_v}^×(p) via Art_{F_v}^{−1}. With Λ̃_v = 𝒪[[F_v^×(p)ⁿ]] ⊗_{𝒪[[𝒪_{F_v}^×(p)ⁿ]]} Λ_v, the χ_i^univ extend to χ̃_i^univ : G_{F_v} → Λ̃_v^× lifting χ̃_i.

- API `TauCeti.GaloisDeformation.Local.ordinaryWeightRing`: Λ_v = 𝒪[[𝒪_{F_v}^×(p)ⁿ]]/𝔞 for a chosen set of minimal primes.
- API `TauCeti.GaloisDeformation.Local.universalInertialCharacter`: χ_i^univ : I_{F_v} → Λ_v^×.
- API `TauCeti.GaloisDeformation.Local.ordinaryWeightRingTilde`: Λ̃_v and χ̃_i^univ : G_{F_v} → Λ̃_v^×.
- API `TauCeti.GaloisDeformation.Local.universalInertialCharacter_residual`: χ_i^univ ≡ χ̄_i modulo the maximal ideal.
- API `TauCeti.GaloisDeformation.Local.minimalPrimes_torsionCharacters`: Minimal primes ↔ Galois orbits of torsion characters.
- API `TauCeti.GaloisDeformation.Local.ordinaryWeightRing.universal`: Continuous 𝒪-algebra maps Λ_v→A correspond to ordered continuous characters of 𝒪_{F_v}^×(p) with the prescribed reductions whose induced map from the completed group algebra kills 𝔞. The correspondence commutes with maps of complete coefficient algebras.
- Test `ordinaryWeightRing_Qp` (computation): F_v = ℚ_p, p odd: 𝒪_{ℚ_p}^×(p) ≅ 1 + pℤ_p ≅ ℤ_p is torsion-free, so Λ_v = 𝒪[[X_1, …, X_n]] with 𝔞 = 0.
- Test `ordinaryWeightRing_torsion` (computation): F_v = ℚ_p(ζ_p): 𝒪_{F_v}^×(p) has torsion μ_p, so 𝒪[[𝒪_{F_v}^×(p)]] has several minimal primes once ζ_p ∈ 𝒪, and 𝔞 selects tuples of characters of μ_pⁿ.
- Test `ordinaryWeightRing_n_one` (degenerate): n = 1: χ_1^univ is the universal deformation of χ̄_1|_{I_{F_v}} with values in Λ_v, and Λ̃_v adds the Frobenius variable.

### LocalGaloisDeformationRings:L7/ordinary-flag-scheme (construction)

With Λ_v as in L8/ordinary-coefficient-ring and R^□_v ∈ CNL_{Λ_v} the universal lifting ring of ρ̄ (R08.1), let 𝓕 be the flag variety over 𝒪 of complete flags in 𝒪ⁿ and 𝒢_v ⊂ 𝓕 ×_𝒪 Spec R^□_v the closed subscheme whose A-points (A an R^□_v-algebra) are flags preserved by the universal lifting over A on which I_{F_v} acts on Fil_i/Fil_{i−1} through χ_i^univ. The map 𝒢_v → Spec R^□_v is proper, and R^△_v is the image of R^□_v → H⁰(𝒢_v, 𝒪_{𝒢_v}). For a domain R ∈ CNL_{Λ_v} with K an algebraic closure of Frac R, an R-point of Spec R^□_v factors through R^△_v iff ρ ⊗_R K has a G_{F_v}-stable full flag with I_{F_v} acting on the graded pieces by the push-forwards of the χ_j^univ.

- API `TauCeti.GaloisDeformation.Local.ordinaryFlagScheme`: 𝒢_v ⊂ 𝓕 × Spec R^□_v.
- API `TauCeti.GaloisDeformation.Local.ordinaryFlagScheme_proper`: 𝒢_v → Spec R^□_v is proper.
- API `TauCeti.GaloisDeformation.Local.ordinaryFlagImage`: R^△_v = im(R^□_v → H⁰(𝒢_v, 𝒪)).
- API `TauCeti.GaloisDeformation.Local.ordinaryFlagImage_points`: The domain point criterion.
- API `TauCeti.GaloisDeformation.Local.ordinaryFlagScheme.points`: A coefficient point is a framed lift together with a full flag of locally direct summands, stable under G_{F_v}, with the prescribed ordered inertia characters on its graded lines. Pullback of the universal flag realizes this bijection.
- API `TauCeti.GaloisDeformation.Local.ordinaryFlagScheme.baseChange`: Tensoring a flag of direct summands along a coefficient map gives the new point of the incidence scheme; identity and composition agree with ordinaryFlagScheme pullback.
- Test `ordinaryFlagImage_n_one` (degenerate): n = 1: every line is a flag, and R^△_v = R^□_v/(ρ|_{I_{F_v}} − χ_1^univ).
- Test `ordinaryFlagScheme_permuted` (characterisation): Requiring I_{F_v} to act on the i-th piece by χ^univ_{σ(i)} for σ ∈ S_n gives the variant R^{△,σ}_v used in the proof of L8/determinant-flag-comparison.
- Test `ordinaryFlagImage_not_flag` (non-example): A point of R^△_v need not carry a flag over R itself, only over the algebraic closure of its fraction field.

### LocalGaloisDeformationRings:L7/trivial-residual-flag-ring (theorem)

(ACC+ Proposition 6.2.10, from Thorne [Tho15, Proposition 3.14].) If [F_v : ℚ_p] > n(n − 1)/2 + 1 and ρ̄ is trivial, then R^△_v is 𝒪-flat, reduced and equidimensional of dimension 1 + n² + n(n + 1)/2 · [F_v : ℚ_p], and Spec R^△_v → Spec Λ_v is bijective on generic points, hence on irreducible components.


### LocalGaloisDeformationRings:L7/residually-split-nearly-ordinary-ring (theorem)

(Skinner–Wiles Lemma 2.2 and Corollary 2.3.) Let n = 2, ρ_0 = χ ⊕ 1 on D = G_{F_v} with χ ≠ 1, d = [F_v : ℚ_p] and ω the mod-p cyclotomic character of D. There are a versal local 𝒪-deformation ρ : D → GL₂(R) of ρ_0 with det = χ̃ and a versal nearly ordinary deformation ρ_ord = (χ̃Ψ *; 0 Ψ^{−1}), Ψ ≡ 1, over R_ord, with R_ord ≅ 𝒪[[x_1, …, x_{2d+2}]]/(f) if χ = ω or ω = 1, and R_ord ≅ 𝒪[[x_1, …, x_{2d+1}]] otherwise. R_ord is a quotient of R by an ideal generated by d + ε elements, ε = 2 if χ = ω = χ^{−1}, ε = 1 if ω = 1, or χ = ω ≠ χ^{−1}, or χ ≠ ω = χ^{−1}, and ε = 0 otherwise.


### LocalGaloisDeformationRings:L8/determinant-ordinary-ring (construction)

Let R̃^□_v = R^□_v ⊗_{Λ_v} Λ̃_v and R̃^{det,ord}_v its maximal quotient on which, for all g, g_1, …, g_n ∈ G_{F_v}, (6.2.7) det(X − ρ^□(g)) = ∏_{i=1}^n (X − χ̃_i^univ(g)) and (6.2.8) (ρ^□(g_1) − χ̃_1^univ(g_1))⋯(ρ^□(g_n) − χ̃_n^univ(g_n)) = 0. R^{det,ord}_v is the image of R^□_v → R̃^{det,ord}_v.

- API `TauCeti.GaloisDeformation.Local.detOrdTilde`: R̃^{det,ord}_v, the quotient by (6.2.7)–(6.2.8).
- API `TauCeti.GaloisDeformation.Local.detOrd`: R^{det,ord}_v = im(R^□_v → R̃^{det,ord}_v).
- API `TauCeti.GaloisDeformation.Local.detOrdTilde_charpoly`: (6.2.7) holds over R̃^{det,ord}_v.
- API `TauCeti.GaloisDeformation.Local.detOrdTilde_product`: (6.2.8) holds over R̃^{det,ord}_v.
- API `TauCeti.GaloisDeformation.Local.detOrd_universal`: R^□_v → R factors through R^{det,ord}_v when R ↪ S carries characters ψ_i with the relations.
- API `TauCeti.GaloisDeformation.Local.detOrdTilde.factor_iff`: A continuous map from R̃^□_v to A factors uniquely through R̃^{det,ord}_v iff every coefficient of (6.2.7) and every ordered matrix entry of (6.2.8) vanishes in A. The ordered products are required for all tuples of group elements, and are preserved by A→A′.
- Test `detOrd_n_one` (degenerate): n = 1: (6.2.7) says ρ^□ = χ̃_1^univ and (6.2.8) is the same relation.
- Test `detOrd_diagonal` (computation): A diagonal lift diag(χ̃_1, …, χ̃_n) satisfies (6.2.7) and (6.2.8).
- Test `detOrd_charpoly_not_enough` (non-example): Over A=ℤ/9 let M=diag(4,7), U=(1 1;0 1), and H the finite subgroup they generate in GL₂(A). Every element of H has characteristic polynomial (X−1)², with both prescribed characters equal to 1, but (M−I)(U−I)=(0 3;0 0)≠0. Thus (6.2.7) does not imply (6.2.8).

### LocalGaloisDeformationRings:L8/det-ord-finite (lemma)

(ACC+ Lemma 6.2.9.) R̃^{det,ord}_v is a finite R^{det,ord}_v-algebra.


### LocalGaloisDeformationRings:L8/ordinary-point-criteria (lemma)

If R ↪ S is an injective map of R^□_v-algebras and there are characters ψ_1, …, ψ_n : G_{F_v} → S^× with ψ_i|_{I_{F_v}} the push-forward of χ_i^univ satisfying (6.2.7) and (6.2.8) with the push-forward of the universal lifting, then R^□_v → R factors through R^{det,ord}_v. Consequently Spec R^△_v ⊂ Spec R^{det,ord}_v as topological spaces, and there is a surjection of R^□_v-algebras R^{det,ord}_v ↠ (R^△_v)_red.


### LocalGaloisDeformationRings:L8/distinct-characters-flag (lemma)

(ACC+ Lemma 6.2.11.) Let K be a field, G a group and ρ : G → GL_n(K). If χ_1, …, χ_n : G → K^× are pairwise distinct characters with det(X − ρ(g)) = ∏_i(X − χ_i(g)) for all g and (ρ(g_1) − χ_1(g_1))⋯(ρ(g_n) − χ_n(g_n)) = 0 for all g_1, …, g_n, then there is a G-stable flag 0 = Fil⁰ ⊂ ⋯ ⊂ Filⁿ = Kⁿ with Fil^i/Fil^{i−1} ≅ K(χ_i).


### LocalGaloisDeformationRings:L8/determinant-flag-comparison (theorem)

(ACC+ Proposition 6.2.12.) Let U ⊂ Spec Λ_v be the open locus where χ_1^univ, …, χ_n^univ are pairwise distinct, Z its complement, and f : Spec R^△_v → Spec Λ_v, g : Spec R^{det,ord}_v → Spec Λ_v the structure maps. Suppose ρ̄ is trivial and [F_v : ℚ_p] > n(n + 1)/2 + 1. (1) f^{−1}(U) = g^{−1}(U) in Spec R^□_v; hence every irreducible component C of Spec Λ_v is dominated by a unique irreducible component C′ of Spec R^{det,ord}_v, of dimension n² + 1 + n(n + 1)/2 · [F_v : ℚ_p]. (2) Every irreducible component C′ of R^{det,ord}_v not dominating a component of Spec Λ_v lies in g^{−1}(Z) and has dimension ≤ n² − 1 + n(n + 1)/2 · [F_v : ℚ_p].


### LocalGaloisDeformationRings:L7/fontaine-laffaille-deformation-condition (construction)

Let l = p, F_ṽ unramified over ℚ_l, and K (the coefficient field, integers 𝒪, residue field k) containing the images of all embeddings F_ṽ ↪ K̄. Let 𝓜𝓕_{𝒪,ṽ} be the category of finite 𝒪_{F_ṽ} ⊗_{ℤ_l} 𝒪-modules M with a decreasing filtration by direct summands, Fil⁰M = M, Fil^{l−1}M = 0, and Fr ⊗ 1-linear Φ^i : Fil^iM → M with Φ^i|_{Fil^{i+1}M} = lΦ^{i+1} and Σ_i Φ^i Fil^iM = M, and 𝓜𝓕_{k,ṽ} its objects killed by λ. The covariant Fontaine–Laffaille functor 𝐆_ṽ(M) = U_S(Hom(M, F_ṽ/𝒪_{F,ṽ}{l − 2}))(2 − l) is exact, fully faithful and 𝒪-linear into finite 𝒪-modules with continuous G_{F_ṽ}-action, with essential image closed under subobjects and quotients, Ext¹_{𝓜𝓕} ↪ Ext¹_{𝒪[G]} and Hom_{𝓜𝓕} ≅ H⁰(G, Hom). Assume r̄|_{G_{F_ṽ}} is in the essential image of 𝐆_ṽ with dim_k(gr^i 𝐆_ṽ^{−1}(r̄) ⊗_{𝒪_{F_ṽ},τ̃} 𝒪) ≤ 1 for every i and τ̃. The Fontaine–Laffaille deformation problem 𝒟_ṽ consists of the lifts r of r̄ to R such that r ⊗_R R′ lies in the essential image of 𝐆_ṽ for every Artinian quotient R′ of R; its tangent space L_ṽ is the image of Ext¹_{𝓜𝓕_{k,ṽ}}(𝐆_ṽ^{−1}(r̄), 𝐆_ṽ^{−1}(r̄)) ↪ H¹(G_{F_ṽ}, ad r̄). (Lemma 2.4.1.) 𝒟_ṽ is liftable.

- API `TauCeti.GaloisDeformation.Local.FLModule`: Objects of 𝓜𝓕_{𝒪,ṽ}: filtered 𝒪_{F_ṽ} ⊗ 𝒪-modules with the Φ^i.
- API `TauCeti.GaloisDeformation.Local.flFunctor`: 𝐆_ṽ(M) = U_S(Hom(M, F_ṽ/𝒪_{F,ṽ}{l − 2}))(2 − l).
- API `TauCeti.GaloisDeformation.Local.flFunctor_fullyFaithful`: 𝐆_ṽ is exact and fully faithful, with image closed under subobjects and quotients.
- API `TauCeti.GaloisDeformation.Local.FLDeformation`: The condition 𝒟_ṽ on lifts.
- API `TauCeti.GaloisDeformation.Local.FLDeformation.liftable`: Lemma 2.4.1.
- API `TauCeti.GaloisDeformation.Local.FLDeformation.baseChange`: A map of Artinian coefficient algebras carries a lift in the local FL deformation condition to another lift in that condition by the imported coefficient-compatible FL realization. This is a local wrapper; the filtered category and realization remain R07.3/R06.4.
- Test `fl_rank_one` (degenerate): For n = 1 the tangent space is the unramified classes H¹(G/I, ad r̄) (Corollary 2.4.4).
- Test `fl_elliptic_curve` (computation): E[l] for E with good reduction at an unramified l ≥ 3: weights {0, 1} are in range and multiplicity-free.
- Test `fl_weight_out_of_range` (non-example): A crystalline character with Hodge–Tate weight l − 1 is outside 𝓜𝓕 (Fil^{l−1}M = 0 is required).
- Test `fl_repeated_weight` (non-example): r̄ = ε ⊕ ε violates the multiplicity-one hypothesis for n = 2.

### LocalGaloisDeformationRings:L7/fontaine-laffaille-tangent-space-and-smoothness (theorem)

(Lemma 2.4.2.) For M, N in 𝓜𝓕_{k,ṽ} there is an exact sequence 0 → Hom_{𝓜𝓕}(M, N) → Fil⁰Hom(M, N) → Hom_{Fr⊗1}(gr M, N) → Ext¹_{𝓜𝓕}(M, N) → 0, the middle map sending β to (βΦ^i_M − Φ^i_Nβ). (Corollary 2.4.3.) dim_k L_ṽ − dim_k H⁰(G_{F_ṽ}, ad r̄) = [F_ṽ : ℚ_l]·n(n − 1)/2, and R_ṽ^{loc}/𝓘_ṽ is a power series ring over 𝒪 in n² + [F_ṽ : ℚ_l]·n(n − 1)/2 variables. (Corollary 2.4.4.) If n = 1 then L_ṽ = H¹(G_{F_ṽ}/I_{F_ṽ}, ad r̄). (Lemma 2.4.5.) If r̄|_{G_{F_ṽ}} = ⊕ s̄_i then H¹(G, ad r̄) = ⊕_{i,j} H¹(G, Hom(s̄_i, s̄_j)) and L_ṽ = ⊕_{i,j}(L_ṽ)_{i,j}, the images of Ext¹_{𝓜𝓕}(𝐆^{−1}(s̄_i), 𝐆^{−1}(s̄_j)).


### LocalGaloisDeformationRings:L7/ordinary-condition-fixed-inertial-characters (construction)

Let l = p and choose characters χ_{v,i} : G_{F_ṽ} → 𝒪^× (i = 0, …, n − 1) such that (1) r̄ has a decreasing filtration {Fil̄^i} by k[G_{F_ṽ}]-submodules with gr̄^i r̄ ≅ k(χ_{v,i}), and (2′) for i < j, χ̄_{v,j}/χ̄_{v,i} is neither trivial nor the mod-l cyclotomic character ε̄ (the condition the proofs use; CHT print the inverse ratio, source issue LocalGaloisDeformationRings/E2). Then {Fil̄^i} is unique. 𝒟_v consists of the lifts r of r̄ to R such that Rⁿ has a decreasing filtration {Fil^i} by R[G_{F_ṽ}]-submodules with Fil^i ⊗_R k ≅ Fil̄^i and I_{F_ṽ} acting on gr^iRⁿ by χ_{v,i}; the Fil^i are then free direct summands and gr^iRⁿ ≅ R(χ′_i) with χ′_i an unramified twist of χ_{v,i} reducing to χ_{v,i} mod λ. (Lemma 2.4.6.) (1) Such a filtration is unique; (2) for R ↪ S injective in 𝒞_𝒪 and r over R with (S, r) ∈ 𝒟_v, (Fil^i_S ∩ Rⁿ) ⊗_R S ≅ Fil^i_S; (3) 𝒟_v is a local deformation problem.

- API `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia`: The condition 𝒟_v with its characters χ_{v,i}.
- API `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.filtration`: The filtration Fil^i of a lift in 𝒟_v.
- API `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.filtration_unique`: Lemma 2.4.6(1).
- API `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.filtration_baseChange`: Lemma 2.4.6(2).
- API `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.isLocalDeformationProblem`: Lemma 2.4.6(3).
- API `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.graded_character`: For a lift satisfying the fixed-inertia ordinary condition, the action of σ∈I_v on gr^i of its unique filtration is multiplication by χ_{v,i}(σ); this statement is compatible with the source’s one-based ordering.
- Test `ord_n1` (degenerate): For n = 1, 𝒟_v is the lifts with inertial character χ_{v,0}.
- Test `ord_n2_distinct` (computation): For n=2 write ρ̄=(χ̄₁ *;0 χ̄₀) with χ̄₁/χ̄₀ ≠ 1,ω. The decreasing filtration has Fil¹ equal to the unique line carrying the prescribed χ̄₁; its quotient carries χ̄₀.
- Test `ord_cyclotomic_ratio_excluded` (non-example): r̄ = ω ⊕ 1 on G_{ℚ_l} with ω on the sub (χ̄_1 = ω, χ̄_0 = 1, l > 3) satisfies CHT's printed (2) but not (2′); there H²(G, k(ω)) ≠ 0 and the ring is not formally smooth (E2).
- Test `ord_vs_flag_scheme` (compatibility): The lifts in 𝒟_v are the points of L7/ordinary-flag-scheme's image over the fixed characters.

### LocalGaloisDeformationRings:L7/ordinary-fixed-inertial-characters-smoothness (theorem)

Under (2′): (Lemma 2.4.7.) 𝒟_v is liftable. (Lemma 2.4.8.) R_v^{loc}/𝓘_v is a power series ring over 𝒪 in n² + [F_ṽ : ℚ_l]·n(n − 1)/2 variables, and dim_k L_v − dim_k H⁰(G_{F_ṽ}, ad r̄) = [F_ṽ : ℚ_l]·n(n − 1)/2.


### LocalGaloisDeformationRings:L7/discrete-series-deformation-condition (construction)

Let l ≠ p, n = md and r̃_v : G_{F_ṽ} → GL_d(𝒪) continuous with (1) r̃_v ⊗ k absolutely irreducible, (2) every irreducible subquotient of (r̃_v ⊗ k)|_{I_{F_ṽ}} absolutely irreducible, and (3) r̃_v ⊗ k ≇ r̃_v ⊗ k(i) for i = 1, …, m. (Lemma 2.4.23.) r̃_v ≅ Ind_{G_{F′_ṽ}}^{G_{F_ṽ}} s_v for the unramified F′_ṽ of degree d₁ and s_v with s_v|_I ⊗ k absolutely irreducible and not conjugate-isomorphic; a lift ρ with ρ|_I ≅ r̃_v|_I ⊗ R is Ind(s_v ⊗ R(χ)) for a unique unramified χ; and Z_{GL_d(R)}(r̃_v(I)) ↠ Z_{GL_d(R/I)}(r̃_v(I)). (Definition 2.4.24.) ρ : G_{F_ṽ} → GL_n(R) is r̃_v-discrete series if it has a decreasing filtration {Fil^i} by R-direct summands with gr^iρ ≅ (gr⁰ρ)(i) for i = 1, …, m − 1 and (gr⁰ρ)|_I ≅ r̃_v|_I ⊗ R. (Lemma 2.4.25.) The filtration is unique. (Lemma 2.4.26.) If r̄ is r̃_v-discrete series, its r̃_v-discrete series lifts form a local deformation problem 𝒟_v.

- API `TauCeti.GaloisDeformation.Local.DiscreteSeriesType`: (m, d, r̃_v) with conditions (1)–(3).
- API `TauCeti.GaloisDeformation.Local.IsDiscreteSeriesLift`: Definition 2.4.24: the filtration with gr^i ≅ gr⁰(i) and gr⁰|_I ≅ r̃_v|_I ⊗ R.
- API `TauCeti.GaloisDeformation.Local.IsDiscreteSeriesLift.filtration_unique`: Lemma 2.4.25.
- API `TauCeti.GaloisDeformation.Local.discreteSeriesDeformation`: Lemma 2.4.26: a local deformation problem.
- API `TauCeti.GaloisDeformation.Local.DiscreteSeriesType.induced`: Lemma 2.4.23: r̃_v ≅ Ind s_v.
- API `TauCeti.GaloisDeformation.Local.DiscreteSeriesType.filtration_baseChange`: The unique direct-summand filtration of a discrete-series lift pulls back along every allowed coefficient map; its graded identifications and the fixed prime-to-p inertia representation pull back with it.
- Test `ds_steinberg` (compatibility): d = 1, m = n, r̃_v trivial: the unipotent-monodromy (Steinberg) lifts with Frobenius eigenvalues α, qα, …, q^{n−1}α.
- Test `ds_m1` (degenerate): m = 1: lifts with ρ|_I ≅ r̃_v|_I ⊗ R, i.e. minimally ramified type r̃_v.
- Test `ds_condition3_fails` (non-example): If q ≡ 1 mod p then k(1) ≅ k and condition (3) fails for i = 1.
- Test `ds_induced_type` (computation): d = 2 with r̃_v induced from the unramified quadratic extension (a supercuspidal type).

### LocalGaloisDeformationRings:L7/discrete-series-smoothness (theorem)

(Lemma 2.4.27.) 𝒟_v is liftable. (Lemma 2.4.28.) R_v^{loc}/𝓘_v is a power series ring in n² variables over 𝒪. (Corollary 2.4.29.) dim_k L_v = dim_k H⁰(G_{F_ṽ}, ad r̄). (Lemma 2.4.30.) If d = 1 and m = n, with Fil¹ ad r̄ the endomorphisms x with x Fil^i r̄ ⊂ Fil^{i+1} r̄, then L_v = H¹(G/I, k1_n) ⊕ ker(H¹(G, ad⁰r̄) → H¹(G, ad r̄/Fil¹ ad r̄)).


### LocalGaloisDeformationRings:R08.5/connected-kisin-modules-with-coefficients (construction)

For an admissible augmented coefficient algebra (A,I) in Kisin’s category 𝔄𝔲𝔤_{W(𝔽)}, (Mod/𝔖)_A is the category of finite projective 𝔖_A-modules 𝔐_A with 1 ⊗ φ : φ^*(𝔐_A) → 𝔐_A whose cokernel is killed by E(u) (so 1 ⊗ φ is injective); (Mod/𝔖)^c_A is the full subcategory where ψ_n(𝔐_A) ⊆ (p, u)φ^{n*}(𝔐_A) for n large, with ψ_n = φ^{n−1*}(ψ) ∘ ⋯ ∘ ψ (2.1.4). 𝔐_A is multiplicative if φ^*(𝔐_A) → 𝔐_A is an isomorphism and étale if its image is E(u)𝔐_A. With M_𝔽 = (𝒪_{ℰ^ur} ⊗ V_𝔽(−1))^{G_{K∞}}, D_{V_𝔽}, D_{M_𝔽} and D_{𝔖,M_𝔽} ⊇ D^c_{𝔖,M_𝔽} are the groupoids of deformations of V_𝔽, of the étale φ-module M_𝔽, and of Kisin modules (connected) with an identification of their 𝒪_ℰ-module with M_𝔽 (2.1.1–2.1.5), and 𝔐_A ↦ 𝒪_ℰ ⊗ 𝔐_A is a morphism D_{𝔖,M_𝔽} → D_{M_𝔽} (Lemma 2.1.7).

- API `TauCeti.GaloisDeformation.Local.KisinModuleCoeff`: (Mod/𝔖)_A with its φ and the E(u)-cokernel condition.
- API `TauCeti.GaloisDeformation.Local.KisinModuleCoeff.IsConnected`: ψ_n(𝔐_A) ⊆ (p, u)φ^{n*}(𝔐_A) for n ≫ 0.
- API `TauCeti.GaloisDeformation.Local.KisinModuleCoeff.IsEtale`: Image of φ^*𝔐 is E(u)𝔐.
- API `TauCeti.GaloisDeformation.Local.KisinModuleCoeff.IsMultiplicative`: φ^*𝔐 → 𝔐 is an isomorphism.
- API `TauCeti.GaloisDeformation.Local.kisinGroupoid`: D_{𝔖,M_𝔽} and D^c_{𝔖,M_𝔽}.
- API `TauCeti.GaloisDeformation.Local.kisinGroupoid_toPhiModule`: 𝔐_A ↦ 𝒪_ℰ ⊗ 𝔐_A (Lemma 2.1.7).
- API `TauCeti.GaloisDeformation.Local.kisinGroupoid.baseChange`: Along an admissible morphism of augmented coefficient algebras, tensor the imported Kisin module, its connectedness condition and its identification with the fixed étale φ-module. This defines pullback on the local deformation groupoid, with identity and composition laws; it does not redefine the underlying integral category.
- Test `rank_one_etale` (computation): Rank one, φ(e) = E(u)e: étale, not connected (its étale part is itself).
- Test `rank_one_multiplicative` (computation): Rank one, φ(e) = e: multiplicative.
- Test `rank_one_cyclotomic` (computation): The rank-one module with φ(e)=pE(u)/E(0)·e is étale because p/E(0) is a unit; it is not connected. A module with unit Frobenius is multiplicative and connected. Use the source’s fixed (1) twist in the Galois realization when comparing characters.
- Test `p_odd_vs_two` (non-example): At p=2 an étale rank-one object is nonconnected and still has a finite-flat étale model. Kisin’s connected equivalence is restricted to connected objects; it does not exclude all nonconnected finite-flat groups.

### LocalGaloisDeformationRings:R08.5/etale-multiplicative-parts (lemma)

For (A, I) in 𝔄𝔲𝔤_{W(𝔽)} and 𝔐_A in D_{𝔖,M_𝔽}(A, I), 𝔐_A has a maximal étale quotient 𝔐^{ét}_A and a maximal multiplicative subobject 𝔐^m_A in (Mod/𝔖)_A, 𝔐_A/𝔐^m_A is in (Mod/𝔖)_A, and both constructions commute with base change (Lemma 2.1.8). 𝔐_A is connected iff 𝔐^{ét}_A = 0 (Lemma 2.1.9), and the inclusion D^c_{𝔖,M_𝔽} → D_{𝔖,M_𝔽} is open and closed (Proposition 2.1.10).


### LocalGaloisDeformationRings:R08.5/connected-model-moduli (theorem)

D_{𝔖,M_𝔽} → D_{M_𝔽} is relatively representable and projective: for a complete local R and ξ ∈ D_{M_𝔽}(R) there is a projective R-scheme 𝒢ℛ_{V_𝔽,ξ} with |D_{𝔖,M_𝔽,ξ}|(A, I) ≅ Hom_{Spec R}(Spec A, 𝒢ℛ_{V_𝔽,ξ}), and Θ_{V_𝔽,ξ} : 𝒢ℛ_{V_𝔽,ξ} → Spec R becomes a closed immersion after inverting p; the connected part is a closed and open subscheme 𝒢ℛ^c_{V_𝔽,ξ} (Proposition 2.1.12).


### LocalGaloisDeformationRings:R08.5/flat-connected-deformation-ring (theorem)

Let D^{fl,c}_{V_𝔽} ⊆ D^{fl}_{V_𝔽} ⊆ D_{V_𝔽} be the deformations that arise from finite flat connected (resp. finite flat) 𝒪_K-group schemes; D^{fl,c} → D_{M_𝔽} is fully faithful. Both inclusions are relatively representable and closed, and for the maximal quotient R^c of R over which ξ is flat connected, Spec R^c[1/p] → Spec R[1/p] is an open immersion (Lemma 2.2.2). If ξ → D^{fl,c} is formally smooth then R[1/p] is formally smooth over W(𝔽)[1/p] (Lemma 2.2.3). There is Θ_{V_𝔽} : D^c_{𝔖,M_𝔽} → D^{fl,c}_{V_𝔽} compatible with 𝒪_ℰ ⊗ − (Proposition 2.2.4), and for formally smooth ξ the projective morphism Θ : 𝒢ℛ^c_{V_𝔽,ξ} → Spec R becomes an isomorphism after inverting p (Proposition 2.2.7).


### LocalGaloisDeformationRings:R08.5/rank-two-type-v (lemma)

A Kisin module 𝔐_A of 𝔖_A-rank 2 is of type v if (1 ⊗ φ)(φ^*𝔐_A)/E(u)𝔐_A is maximal isotropic in 𝔐_A/E(u)𝔐_A (2.3.1). If 𝔐_A is free of type v with φ-matrix H, then det H = pE(u)/E(0)·w with w ∈ 𝔖_A^× (Lemma 2.3.2). If 𝔐_𝔽 is connected of type v, every deformation 𝔐_A is connected with 𝔐^m_A = 0 (Lemma 2.3.3). For V_A = Θ(𝔐_A), det V_A|_{I_K} ≅ χ, and det V_A ≅ χ on G_K iff det H = pE(u)/E(0)·w with w ↦ 1 in (W(k) ⊗ A)^× iff a basis can be chosen with det H = pE(u)/E(0) (Lemma 2.3.4).


### LocalGaloisDeformationRings:R08.5/rank-two-connected-components (theorem)

For ξ ∈ D^{fl,c}_{V_𝔽}(R) with dim V_𝔽 = 2: the type-v locus 𝒢ℛ^{c,v}_{V_𝔽,ξ} ⊆ 𝒢ℛ^{fl,c}_{V_𝔽,ξ} is closed, Θ^v factors through Spec R^v (inertia acting on det by χ) and is an isomorphism after inverting p; and if ξ has determinant χ and ξ → D^{fl,c,χ} is formally smooth, the complete local rings of 𝒢ℛ^{c,v} are those of Hilbert modular varieties (Deligne–Pappas), so 𝒢ℛ^{c,v} is a normal local complete intersection over W(𝔽) with geometrically reduced special fibre and formally smooth generic fibre (Theorem 2.3.9). If det V_𝔽 = χ and V_𝔽 comes from a connected finite flat group scheme, the closed fibre 𝒢ℛ^{c,v}_{V_𝔽,0} is geometrically connected when k = 𝔽_p or G_K acts trivially on V_𝔽, and then Spec R[1/p] is geometrically connected (Theorem 2.3.11). The framed ring R^{fl,c,ψ,□}_{V_𝔽}[1/p] with determinant ψχ (ψ unramified) is formally smooth over E of relative dimension 3 + [K : ℚ_p], and geometrically connected under those conditions (Corollary 2.3.13).


### LocalGaloisDeformationRings:R08.5/ordinary-deformations-p2 (theorem)

For a discrete ℤ_p[Γ_K]-module M with p nilpotent, H¹_f(G_K, M(χ)) (the classes whose inertial image lies in 𝒪^×_{K^ur} ⊗ M) is right exact in M (Lemma 2.4.2). The groupoid D^{ord,χ}_{V_𝔽} of triples (V_A, L_A, ι_A) with det V_A ≅ χ, L_A a G_K-stable line with I_K acting by χ, and extension class in H¹_f (2.4.3) is relatively representable and projective over D^χ_{V_𝔽}; Θ^{ord} becomes a closed embedding after inverting p, and is formally smooth when ξ is (Proposition 2.4.4). The scheme-theoretic image R^{ord}_ξ has as E-points the crystalline representations (χη ∗; 0 η^{−1}) with η unramified, R^{ord}_ξ[1/p] is formally smooth, and R^{ord}_ξ is a domain unless V_𝔽 ≅ χ₁ ⊕ χ₂ with χ₁ ≠ χ₂ and χ₁|_{I_K} = χ₂|_{I_K} = χ (Corollary 2.4.5); the framed version R^{ord,ψ,□}_{V_𝔽}[1/p] is formally smooth of dimension 3 + [K : ℚ_p] (Corollary 2.4.6).


### LocalGaloisDeformationRings:R08.5/kisin-local-rings-p2-comparison (comparison)

Kisin's rings for p = 2 away from 2 and at the real place are those already planned: the ring of extensions of γ by γ(1) (Proposition 2.5.2) is R08.2's Steinberg condition (domain of dimension 3 after inverting p, formally smooth); unramified lifts with determinant ψχ (2.5.3) form a formally smooth ring of relative dimension 3 (R08.2/unramified-lifting-ring); the fixed-determinant ring (2.5.4) is 3-dimensional after inverting p and a union of formally smooth components, with tangent dimension 3 + h²(G_L, ad⁰V_x) (R08.2/unrestricted-away-from-p); and the odd archimedean ring at p = 2 is 𝒪⟦x, y, z⟧/(x² + 2x + yz) for trivial V_𝔽 and 𝒪⟦x, y, z⟧/(x² + 2x + yz + z) for V_𝔽 = (1 1; 0 1), with universal lifts c ↦ (1+x y; z −1−x) and (1+x 1+y; z −1−x) (Proposition 2.5.6; R08.1/archimedean-odd-ring-p2).


### LocalGaloisDeformationRings:R08.1/coefficient-rings-lambda (construction)

Let 𝒪 be the ring of integers of a finite extension L/ℚ_p with residue field k and uniformiser ϖ, F/ℚ_p finite, and κ an 𝒪-field of one of three kinds: (1) a finite extension of k; (2) a finite extension of L; (3) a local field of characteristic p containing k, so 𝒪_κ ≅ k′⟦t⟧. Put Λ = 𝒪_{L′} with L′/L unramified of residue field κ in case (1); Λ = κ (with Λ⁰ = 𝒪_κ) in case (2); and in case (3) Λ = the p-adic completion of 𝒪_{L′}⟦t⟧[1/t], a complete discrete valuation ring with uniformiser ϖ and residue field κ (an 𝒪-Cohen ring of κ, unique up to non-canonical isomorphism). 𝔄_Λ is the category of local Artinian Λ-algebras with residue field κ, topologised discretely in case (1), p-adically in case (2), and as finite-length Λ⁰[1/t]/ϖⁿ-modules in case (3). For a continuous ρ : G_F → GL_d(κ), D^□_ρ(A) is the set of continuous lifts ρ_A : G_F → GL_d(A) of ρ. In case (1) this is the functor of R08.1/local-lifting-ring.

- API `TauCeti.GaloisDeformation.Local.CoeffRing`: The ring Λ attached to an 𝒪-field κ of the three kinds, with its residue isomorphism Λ/ϖ ≅ κ in cases (1), (3) and Λ = κ in case (2).
- API `TauCeti.GaloisDeformation.Local.CoeffRing.isCohen`: In case (3), any 𝒪-algebra that is a complete DVR with uniformiser ϖ and residue field κ is isomorphic to Λ.
- API `TauCeti.GaloisDeformation.Local.ArtinCat`: The category 𝔄_Λ with the topology on each object.
- API `TauCeti.GaloisDeformation.Local.liftFunctorΛ`: D^□_ρ : 𝔄_Λ → Set, continuous lifts of ρ : G_F → GL_d(κ).
- API `TauCeti.GaloisDeformation.Local.liftFunctorΛ_finite`: For κ finite, D^□_ρ restricted to Artinian objects is the lifting functor of GlobalGaloisDeformations R04.1.
- Test `coeffRing_finite` (degenerate): For κ = k, CoeffRing κ = 𝒪.
- Test `coeffRing_padic` (computation): For κ = L, CoeffRing κ = L and 𝔄_Λ consists of finite local L-algebras with residue field L.
- Test `coeffRing_char_p_dvr` (non-example): For κ = k((t)), Λ is not 𝒪⟦t⟧ (not a DVR, residue field k) but the ϖ-adic completion of 𝒪⟦t⟧[1/t], a DVR with residue field k((t)).
- Test `liftFunctorΛ_compat` (compatibility): For κ finite, liftFunctorΛ ρ agrees with the lifting functor of R08.1/local-lifting-ring on Artinian objects.

### LocalGaloisDeformationRings:R08.1/lambda-presentation (theorem)

Let κ, Λ and ρ : G_F → GL_d(κ) be as in R08.1/coefficient-rings-lambda. (1) dim_κ Z¹(G_F, V) = h¹(G_F, V) + dim V − h⁰(G_F, V) for any finite continuous κ[G_F]-module V, and dim_κ Z¹(G_F, V) = dim V·([F:ℚ_p] + 1) + h²(G_F, V). (2) D^□_ρ is pro-represented by a complete local Noetherian Λ-algebra R^□_ρ with a presentation R^□_ρ ≅ Λ⟦x₁, …, x_r⟧/(f₁, …, f_s), r = dim_κ Z¹(G_F, ad ρ), s = dim_κ H²(G_F, ad ρ); hence r − s = d² + d²[F:ℚ_p]. (3) The analogous presentation over the universal deformation ring R_{det ρ} of det ρ holds with ad⁰ in place of ad when p ∤ d.


### LocalGaloisDeformationRings:R08.1/completion-at-points (theorem)

Let ρ̄ : G_F → GL_d(k′) (k′/k finite, F/ℚ_ℓ finite, ℓ = p allowed) with framed ring R^□_ρ̄. Let x ∈ Spec R^□_ρ̄ be a point with κ(x) finite over k′, a finite extension of L, or a local field of characteristic p (x ∈ P₁R^□_ρ̄), ρ_x : G_F → GL_d(κ(x)) the specialisation of the universal lift, Λ the coefficient ring of κ(x) (R08.1/coefficient-rings-lambda) and 𝔮 the kernel of Λ ⊗_𝒪 R^□_ρ̄ → κ(x), λ ⊗ a ↦ λ̄ā. Then the completion of (Λ ⊗_𝒪 R^□_ρ̄)_𝔮 is naturally isomorphic to R^□_{ρ_x}. In particular, for a closed point x of Spec R^□_ρ̄[1/p] with residue field E′, the completed local ring (R^□_ρ̄[1/p])^∧_x pro-represents the framed deformations of ρ_x : G_F → GL_d(E′) to Artinian local E′-algebras with residue field E′, and is a power series ring over E′ in dim Z¹(G_F, ad ρ_x) variables when H²(G_F, ad ρ_x) = 0. The same holds with fixed determinant (ad⁰ in place of ad) and for G-valued lifts (R08.1/g-valued-framed-ring).


### LocalGaloisDeformationRings:R08.1/smooth-points-generic-fibre (theorem)

Let v be a finite place of a number field, F_v its completion, ρ̄ : G_{F_v} → G(k) with G = GL_n (or a group of R08.1/g-valued-framed-ring with fixed multiplier, e.g. GSp₄), and x a closed point of Spec R^□_v[1/p] with ρ_x : G_{F_v} → G(E′). Call x smooth if (R^□_v[1/p])^∧_x is regular. (1) If v ∤ p, x is smooth iff (ad⁰ρ_x)(1)^{G_{F_v}} = 0, equivalently H²(G_{F_v}, ad⁰ρ_x) = 0. (2) If v ∤ p and ρ_x is pure (its Weil–Deligne representation is pure), then x is smooth. (3) If v ∤ p, Spec R^□_v[1/p] is equidimensional of dimension n² (dim G^der for fixed multiplier), and smooth at pure points.


### LocalGaloisDeformationRings:R08.1/rank-one-ring (theorem)

Let F/ℚ_p be finite, ψ̄ : G_F → k^× continuous, R_ψ̄ its universal deformation ring and μ = μ_{p^∞}(F), a finite cyclic p-group. Local class field theory gives μ → F^× → G_F^{ab} → GL₁(R_ψ̄), hence 𝒪[μ] → R_ψ̄, and R_ψ̄ ≅ 𝒪[μ]⟦y₁, …, y_{[F:ℚ_p]+1}⟧. The irreducible components of Spec R_ψ̄ are indexed by the characters χ : μ → 𝒪^× (after enlarging 𝒪), and each R_ψ̄ ⊗_{𝒪[μ],χ} 𝒪 is formally smooth over 𝒪.


### LocalGaloisDeformationRings:R08.1/determinant-twisting (theorem)

Let ρ̄ : G_F → GL_d(k), ψ : G_F → 𝒪^× a lift of det ρ̄, and χ = ψ∘Art_F on μ. (1) R^{□,ψ}_ρ̄ := R^□_ρ̄ ⊗_{R_{det ρ̄},ψ} 𝒪 represents framed lifts with determinant ψ, and is a quotient of R^{□,χ}_ρ̄ (lifts whose determinant restricted to Art_F(μ) is χ). (2) Let 𝒳 : C_𝒪 → Set send A to the group of continuous θ : G_F → 1 + 𝔪_A trivial on Art_F(μ); it is pro-represented by 𝒪(𝒳) ≅ 𝒪⟦y₁, …, y_{[F:ℚ_p]+1}⟧, and φ_e : θ ↦ θ^e. ρ ↦ (det ρ)ψ^{-1} makes R^{□,χ}_ρ̄ an 𝒪(𝒳)-algebra. (3) (ρ, θ) ↦ (ρ ⊗ θ^{-1}, θ) is a natural isomorphism D^{□,χ}_ρ̄ ×_{𝒳,φ_d} 𝒳 ≅ D^{□,ψ}_ρ̄ × 𝒳, hence R^{□,χ}_ρ̄ ⊗_{𝒪(𝒳),φ_d} 𝒪(𝒳) ≅ R^{□,ψ}_ρ̄ ⊗̂_𝒪 𝒪(𝒳). (4) φ_d : 𝒪(𝒳) → 𝒪(𝒳) is finite and flat, étale after inverting p, and a universal homeomorphism on special fibres.


### LocalGaloisDeformationRings:R08.1/g-valued-framed-ring (construction)

Let G be a smooth affine group scheme over 𝒪 (for example GL_n, GSp_{2n} with its multiplier ν : GSp_{2n} → 𝔾_m, or a generalised reductive group), Γ a profinite group with Mazur's p-finiteness condition (for example G_F), κ and Λ as in R08.1/coefficient-rings-lambda, and ρ : Γ → G(κ) continuous. D^□_{ρ,G} : 𝔄_Λ → Set sends A to the continuous ρ_A : Γ → G(A) lifting ρ. (1) dim_κ Z¹(Γ, ad ρ) is finite, where ad ρ = Lie G_κ with the adjoint action. (2) D^□_{ρ,G} is pro-represented by a complete local Noetherian Λ-algebra R^□_{ρ,G} with residue field κ and tangent space Z¹(Γ, ad ρ). (3) For a closed normal subgroup scheme (e.g. fixed multiplier ν∘ρ_A = μ), the corresponding fixed-multiplier functor is a closed subfunctor, pro-represented by a quotient R^{□,μ}_{ρ,G}. (4) Surjections G(A′) → G(A) in 𝔄_Λ have continuous set-theoretic sections, and G(A) is locally profinite.

- API `TauCeti.GaloisDeformation.Local.GLift`: D^□_{ρ,G}(A): continuous lifts Γ → G(A) of ρ.
- API `TauCeti.GaloisDeformation.Local.GFramedRing`: R^□_{ρ,G}, the pro-representing complete local Noetherian Λ-algebra, with the universal lift ρ^□_G : Γ → G(R^□_{ρ,G}).
- API `TauCeti.GaloisDeformation.Local.GFramedRing.tangent`: Hom_Λ(R^□_{ρ,G}, κ[ε]) ≅ Z¹(Γ, ad ρ).
- API `TauCeti.GaloisDeformation.Local.GFramedRing.map`: A morphism φ : G → H induces R^□_{φ∘ρ,H} → R^□_{ρ,G}, with map_id and map_comp.
- API `TauCeti.GaloisDeformation.Local.GFramedRing.fixedMultiplier`: For a character μ lifting ν∘ρ, the quotient R^{□,μ}_{ρ,G} of lifts with ν∘ρ_A = μ.
- API `TauCeti.GaloisDeformation.Local.GFramedRing.gl`: For G = GL_d, R^□_{ρ,GL_d} = R^□_ρ of R08.1/local-lifting-ring.
- API `TauCeti.GaloisDeformation.Local.GFramedRing.hom_ext`: Two continuous Λ-algebra maps R^□_{ρ,G}→A are equal iff the induced G(A)-valued framed lifts are equal. The pro-representing bijection is natural in A; this uses framed equality rather than conjugacy.
- Test `gFramed_GL1_trivial` (computation): G = 𝔾_m, F = ℚ_p (p odd), ρ trivial: R^□_{ρ,G} ≅ 𝒪⟦y₁, y₂⟧ (R08.1/rank-one-ring).
- Test `gFramed_trivial_group` (degenerate): G trivial: R^□_{ρ,G} = Λ.
- Test `gFramed_GSp4_unobstructed` (computation): G = GSp₄ with fixed multiplier, v ∤ p, H⁰(F_v, ad⁰ρ̄(1)) = 0: R^{□,μ} is a power series ring over 𝒪 in 10 variables (BCGP21 Proposition 7.4.2).
- Test `gFramed_GL_compat` (compatibility): GFramedRing for GL_d agrees with R^□_ρ of R08.1/local-lifting-ring.

### LocalGaloisDeformationRings:R08.1/g-valued-presentations (theorem)

Let φ : G → H be a morphism of smooth affine 𝒪-group schemes with G⁰ → H⁰ smooth and surjective, ρ : Γ → G(κ) continuous and ad^{0,φ}ρ = ker(ad ρ → ad(φ∘ρ)). (1) R^□_{ρ,G} ≅ R^□_{φ∘ρ,H}⟦x₁, …, x_r⟧/(f₁, …, f_t) with r = dim Z¹(Γ, ad^{0,φ}ρ), t = h²(Γ, ad^{0,φ}ρ); for Γ = G_F, r − t = (dim G_κ − dim H_κ)([F:ℚ_p] + 1). (2) With H trivial: R^□_{ρ,G} ≅ Λ⟦x₁, …, x_r⟧/(f₁, …, f_s), r − s = dim G_κ·([F:ℚ_p] + 1). (3) For H = G/Z with Z ⊂ Z(G⁰) flat closed and normal in G: if Z is finite étale then R^□_H = R^□_G; if Z is a torus with Z ∩ G′ étale then R^□_{G/G′} ⊗̂_{R^□_{H/H′}} R^□_H ≅ R^□_G. (4) For v ∤ p and G = GSp₄ with fixed multiplier, H⁰(F_v, ad⁰ρ̄(1)) = 0 implies R^{□,μ}_v is a power series ring over 𝒪 in 10 variables, and all lifts of an unramified ρ̄ are unramified.


### LocalGaloisDeformationRings:R08.1/phi-gamma-module-deformation-rings (construction)

Let K/ℚ_p be finite, E/ℚ_p finite and large, and D a (φ, Γ_K)-module over the Robba ring ℛ_{K,E} with End(D) = E, trianguline with a generic parameter δ : T(K) → E^× (T the diagonal torus of GL_n) and refinement w. R_D is the universal deformation ring of D on local Artinian E-algebras with residue field E; R_{D,w} that of T_w-deformations (trianguline deformations with respect to the refinement w(φ)); R_{D,g} that of de Rham, equivalently crystabelline, deformations; R_δ (resp. R_{δ,g}) that of the character δ of T(K) (resp. of its locally algebraic deformations). All are formally smooth complete local Noetherian E-algebras, with tangent spaces Ext¹_{(φ,Γ)}(D, D), its trianguline and de Rham subspaces, Hom(T(K), E) and Hom_sm(T(K), E); there are surjections R_D ↠ R_{D,w} ↠ R_{D,g} and R_δ ↠ R_{δ,g}, and for each w the parameter map induces a Cartesian square of local Artinian E-algebras with corners R_{w(φ)z^h}/𝔪², R_{w(φ)z^h,g}/𝔪², R_{D,w}/𝔪² and R_{D,g}/𝔪² (Ding (3.55)): a first-order trianguline deformation is de Rham exactly when its parameter is locally algebraic.

- API `TauCeti.GaloisDeformation.PhiGamma.defRing`: R_D for a (φ, Γ_K)-module D with End(D) = E.
- API `TauCeti.GaloisDeformation.PhiGamma.triangulineDefRing`: R_{D,w}, deformations with a deformation of the triangulation attached to w.
- API `TauCeti.GaloisDeformation.PhiGamma.deRhamDefRing`: R_{D,g}, de Rham deformations.
- API `TauCeti.GaloisDeformation.PhiGamma.tangent_defRing`: Tangent space of R_D is Ext¹(D, D); of R_{D,w} the classes preserving the triangulation.
- API `TauCeti.GaloisDeformation.PhiGamma.formallySmooth`: Under genericity of δ, R_D, R_{D,w}, R_{D,g} are formally smooth over E.
- API `TauCeti.GaloisDeformation.PhiGamma.galois_compat`: For D = D_rig(V), R_D is the unframed deformation ring of V (R08.1/completion-at-points modulo framing).
- API `TauCeti.GaloisDeformation.Local.triangulineDefRing.forget`: Forgetting the chosen deformation of the triangulation gives a natural transformation to the deformation functor of D, hence a continuous E-algebra map R_D→R_{D,w}. Composition with this map sends a trianguline point to its underlying module deformation.
- Test `phiGamma_rank_one` (computation): n = 1: R_D ≅ R_δ ≅ E⟦x₁, …, x_{[K:ℚ_p]+1}⟧.
- Test `phiGamma_trianguline_sub` (characterisation): The tangent map of R_D → R_{D,w} identifies Hom(R_{D,w}, E[ε]) with the subspace of Ext¹(D, D) of extensions that are trianguline for the deformed refinement.
- Test `phiGamma_nongeneric` (non-example): D=ℛ⊕ℛ(ε) lies outside the End(D)=E and genericity hypotheses. Its cyclotomic off-diagonal summand has H²≠0 by local duality; it cannot be used as an instance of the stated smoothness theorem.
- Test `phiGamma_galois` (compatibility): For D = D_rig(V) with End V = E, R_D is the unframed deformation ring of V.

### LocalGaloisDeformationRings:R08.2/q-tame-group (definition)

For a positive integer q prime to p, the q-tame group T_q is the semidirect product t^{ℤ_p} ⋊ φ_q^{ℤ̂} of profinite groups with φ_q t φ_q^{-1} = t^q. For b ≥ 1, T_{q^b} is identified with the closed subgroup topologically generated by t and φ_q^b. For K/ℚ_ℓ finite (ℓ ≠ p) with residue field of order q, G_K/P_K ≅ T_q, where P_K is the kernel of a surjection I_K ↠ ℤ_p (R08.2/tame-splitting).

- API `TauCeti.GaloisDeformation.Local.TameGroup`: T_q as a profinite group with generators t, φ_q.
- API `TauCeti.GaloisDeformation.Local.TameGroup.conj_t`: φ_q t φ_q^{-1} = t^q.
- API `TauCeti.GaloisDeformation.Local.TameGroup.lift`: A pair (A, B) in GL_n(R) with B A B^{-1} = A^q and A ≡ 1 mod 𝔪 (pro-p) defines a unique continuous representation of T_q.
- API `TauCeti.GaloisDeformation.Local.TameGroup.ofLocalField`: G_K/P_K ≅ T_q for K/ℚ_ℓ with residue field 𝔽_q, given the choices.
- API `TauCeti.GaloisDeformation.Local.TameGroup.lift_ext`: Two continuous representations of T_q into GL_n(R) that agree on the chosen dense topological generators t and φ_q are equal. The unique lift of a tame pair commutes with continuous coefficient maps.
- Test `tameGroup_abelianisation` (computation): T_q^{ab} ≅ ℤ_p/(q − 1) × ℤ̂.
- Test `tameGroup_q_one` (degenerate): q = 1: T_1 = ℤ_p × ℤ̂ is abelian (the relation φtφ^{-1} = t is trivial).
- Test `tameGroup_not_direct` (non-example): For q ≢ 1 mod p, T_q is not abelian: φ_q t φ_q^{-1} = t^q ≠ t.
- Test `tameGroup_sub` (characterisation): ⟨t, φ_q^b⟩ ≅ T_{q^b}.

### LocalGaloisDeformationRings:R08.2/level-raising-local-problems (construction)

Let F/F⁺ be a quadratic CM extension, v an inert finite place with residue cardinality q=Nv prime to p, w the place above v, N≥2, p≥N, and p∤(q²−1). Let (r̄,χ) be the polarized 𝒢_N-valued local problem of LTXZZ Definition 3.5.1, with r̄♮ on G_{F_w} unramified, χ=η_v^μ ε_p^{1−N}, and the generalized eigenvalues of r̄♮(φ_w) containing {q^{−N},q^{−N+2}} exactly once. In its canonical rank-two block M₀, define 𝒟^mix by inertia preserving M₀ and acting trivially on M₁, 𝒟^unr by trivial inertia on M₀ too, and 𝒟^ram by characteristic polynomial (T−q^{−N})(T−q^{−N+2}) on M₀. For these polarized lifts, 𝒟^mix is formally smooth over Spf 𝒪[[x₀,x₁]]/(x₀x₁) of pure relative dimension N²−1; its two components 𝒟^unr and 𝒟^ram have relative dimension N². With r♮(t)v=v+xv′, and Frobenius eigenvalues s,s′, the relation is x(s−q^{−N})=0. Here φ_w t φ_w⁻¹=t^{q²}, since #k(w)=q². This is not asserted for arbitrary GL_N lifts over a local field of residue size q.

- API `TauCeti.GaloisDeformation.Local.LevelRaising.mix`: The polarized local problem 𝒟^mix with its canonical rank-two block at an inert place; the GL_N restriction is r♮ on G_{F_w}.
- API `TauCeti.GaloisDeformation.Local.LevelRaising.unr`: 𝒟^unr ⊂ 𝒟^mix.
- API `TauCeti.GaloisDeformation.Local.LevelRaising.ram`: 𝒟^ram ⊂ 𝒟^mix.
- API `TauCeti.GaloisDeformation.Local.LevelRaising.localModel`: 𝒟^mix is formally smooth over Spf 𝒪⟦x₀, x₁⟧/(x₀x₁), with 𝒟^unr = {x₀ = 0} and 𝒟^ram = {x₁ = 0}.
- API `TauCeti.GaloisDeformation.Local.LevelRaising.relation`: x(s − q^{−N}) = 0 in R^mix.
- API `TauCeti.GaloisDeformation.Local.LevelRaising.unr_eq_minimal`: For the unramified polarized residual problem 𝒟^unr is the polarized unramified lifting condition; after restriction to G_{F_w} it is unramified GL_N inertia.
- Test `levelRaising_dims` (computation): Relative dimensions: 𝒟^mix and 𝒟^unr have N² − 1 + 1 = N² as framed rings over 𝒪 on each component; 𝒟^ram is formally smooth of relative dimension N².
- Test `levelRaising_N2_components` (characterisation): For N = 2, Spec R^mix has exactly two irreducible components, R^unr and R^ram, meeting in R^mix/(x, s − q^{−2}).
- Test `levelRaising_wrong_direction` (non-example): For φ_w t φ_w⁻¹=t^{q²}, the direction r♮(t)v=v+xv′ gives x(s′−q²s)=0; the reversed direction gives x(s−q²s′)=0. These are different relations. Both vanish when x=0, so the reversed relation does not fail on the unramified component.
- Test `levelRaising_degenerate_eigenvalues` (degenerate): When p divides q²−1 the two residual eigenvalues coincide and separate eigenlines are not supplied by Hensel. The polarized nodal model requires p∤(q²−1).

### LocalGaloisDeformationRings:R08.2/unrestricted-ring-complete-intersection (theorem)

Let K/ℚ_ℓ be finite, ℓ ≠ p, and r̄ : G_K → GL_N(k). (1) The lifting ring R^□_r̄ is a reduced local complete intersection, flat over 𝒪 and of pure relative dimension N²; R^□_r̄/ϖ is equidimensional of dimension N². (2) Every irreducible component of Spf R^□_r̄ is a local deformation problem. (3) When p ≥ N, the minimally ramified problem 𝒟^min (R08.2/minimally-ramified-condition) is an irreducible component of Spf R^□_r̄, formally smooth over 𝒪 of relative dimension N².


### LocalGaloisDeformationRings:R08.2/inertial-type-with-monodromy (definition)

Let K/ℚ_ℓ be finite, ℓ ≠ p. An inertial type (in Shotton's sense) is an isomorphism class of continuous representations τ : I_K → GL_n(ℚ̄_p) that extend to the Weil group W_K, together with the monodromy: equivalently, an I_K-isomorphism class of Weil–Deligne representations (r, N) restricted to inertia with N retained. For r̄ : G_K → GL_n(k) and τ, R^□_r̄(τ) is the reduced 𝒪-flat quotient of R^□_r̄ defined by the Zariski closure of exact-type characteristic-zero points; N is retained in τ but may drop at boundary points.

- API `TauCeti.GaloisDeformation.Local.InertialType`: An inertial type: an I_K-isomorphism class of Weil–Deligne representations restricted to I_K, N retained.
- API `TauCeti.GaloisDeformation.Local.fixedTypeRing`: R^□_r̄(τ), the reduced 𝒪-flat closure quotient of exact-type points.
- API `TauCeti.GaloisDeformation.Local.fixedTypeRing_points`: Every exact-type point lies on R^□_r̄(τ), and such points are dense in its generic fibre. Boundary points need not have exact type τ.
- API `TauCeti.GaloisDeformation.Local.fixedTypeRing_union`: The generic fibre is covered by finitely many closed type-ring loci, which can intersect; this is not a disjoint union.
- API `TauCeti.GaloisDeformation.Local.fixedTypeRing_n2`: For n=2, after imposing the same compatible determinant, this closure definition agrees with R08.2/inertial-type-quotient.
- API `TauCeti.GaloisDeformation.Local.fixedTypeRing.unique`: The reduced flat closure quotient is uniquely characterized by the intersection of kernels of exact-type characteristic-zero points. Its ring maps agree if they agree after precomposing the quotient map from R^□_r̄.
- Test `inertialType_steinberg_vs_trivial` (non-example): The trivial type and Steinberg type Sp₂ differ by N. Their closure rings can meet at an N=0 specialization, for instance the family ρ_c(φ)=diag(q,1), ρ_c(t)=(1 c;0 1) with c=pt and q≡1 mod p.
- Test `inertialType_unramified` (computation): For r̄ unramified and τ trivial with N = 0 the ring is the unramified-after-twist ring, formally smooth of relative dimension n² (R08.2/unramified-lifting-ring).
- Test `inertialType_dimension` (characterisation): Each nonzero R^□_r̄(τ) is equidimensional of dimension 1 + n².
- Test `inertialType_empty` (degenerate): If the reductions of τ|P_K and ρ̄|P_K are incompatible after coefficient extension, the exact-type locus and its closure ring are empty. Compare characteristic-zero and characteristic-p representations through reduction, not literal equality.

### LocalGaloisDeformationRings:R08.2/fixed-type-rings-rank-n (theorem)

Let K/ℚ_ℓ be finite, ℓ ≠ p, r̄ : G_K → GL_n(k). (1) For each inertial type τ, R^□_r̄(τ) is reduced, 𝒪-flat and equidimensional of dimension 1 + n², and R^□_r̄/ϖ is equidimensional of dimension n². (2) If two ℚ̄_p-points lie on the same irreducible component of Spec R^□_r̄[1/p] and neither lies on any other irreducible component, their Weil–Deligne representations restricted to I_K are conjugate; hence the conductor is constant on pure points of a component. (3) Spec R^□_r̄[1/p] has finitely many connected components, and there is a finite extension K′/K such that every lift of r̄ becomes unipotently ramified on G_{K′}.


### LocalGaloisDeformationRings:R08.2/rank-two-unrestricted-rings-cg (theorem)

In the CG18 §4.2 setting at v|N, assume ρ̄ is ramified and its conductor is minimal among twists, p≥3, and use the compatible fixed determinant χ_φ of that section. Let p be odd, v ≠ p a prime, ρ̄ : G_v → GL₂(k) and φ a fixed determinant; R_v = R_{v,φ} is the framed fixed-determinant ring. (1) R_v is a complete intersection, and R_v[1/p] is formally smooth over K. (2) After twisting ρ̄|G_v to be minimal among its twists (and extending k), H²(G_v, ad⁰ρ̄) ≠ 0 — i.e. R_v is not formally smooth — exactly in four cases: (a) v ≡ 1 mod p, ρ̄|G_v ≅ unr ⊗ (χ ⊕ 1) with χ ramified; (b) v ≡ −1 mod p, ρ̄|G_v absolutely irreducible and induced from ℚ_{v²}; (c) v ≡ 1 mod p, ρ̄|G_v ≅ unr ⊗ (1 ∗; 0 1) with ∗ ramified; (d) v ≡ −1 mod p, ρ̄|G_v ≅ unr ⊗ (ω̄ ∗; 0 1) with ∗ ramified. (3) In cases (a), (b), R_v is a power series ring over 𝒪[Δ], Δ the maximal p-quotient of F_v^× resp. F_{v²}^×. (4) In cases (c), (d), R_v ≅ 𝒪⟦x₁, …, x₄⟧/(r) for one r ≠ 0; in case (c) one may take r = C(T) − T with C(t + t^{-1}) = t^v + t^{-v} and T the trace of a generator of tame inertia, and R_v[1/p] has (q + 1)/2 geometric components (q the largest power of p dividing v − 1): one where inertia acts unipotently (T = 2) and (q − 1)/2 where it acts through ζ ≠ 1, ζ^q = 1, with T = ζ + ζ^{-1}.


### LocalGaloisDeformationRings:R08.2/taylor-wiles-local-tangent (theorem)

Let F_v/ℚ_ℓ be finite (ℓ ≠ p) with N(v) ≡ 1 mod p, and r̄|G_v ≅ s̄_v ⊕ ψ̄_v with ψ̄_v a one-dimensional generalised Frobenius eigenspace (unramified), ξ a fixed determinant. 𝒟_v consists of lifts of determinant ξ of the form s_v ⊕ ψ_v lifting s̄_v, ψ̄_v, with I_v acting by (possibly different) scalars on s_v and ψ_v, and L_v ⊂ H¹(G_v, ad⁰r̄) its tangent space. Then dim_k L_v − h⁰(G_v, ad⁰r̄) = 1.


### LocalGaloisDeformationRings:R08.2/steinberg-ring-domain (theorem)

Let K/ℚ_ℓ be finite with residue cardinality q_v ≡ 1 mod p, p^N ∥ q_v − 1 with p^N > n, and r̄ : G_K → GL_n(k) trivial. Then the Steinberg lifting ring R^St (Thorne 2015 §3.3.4: lifts with unipotent inertia and Frobenius eigenvalues α, q_vα, …, q_v^{n−1}α, flat-closed; R08.2/steinberg-condition) is a domain, and the natural surjection R^St → R^□_r̄(τ_{Sp_n}) onto the fixed-type ring of the special inertial type is an isomorphism.


### LocalGaloisDeformationRings:R08.2/dotto-division-algebra-cycles (theorem)

Let K/ℚ_ℓ be finite (ℓ ≠ p), D a central division algebra of rank n over K and r̄ : G_K → GL_n(k). Dotto's cycle map cyc_{D^×} sends a smooth irreducible representation σ of 𝒪_D^× over ℚ̄_p to the n²-dimensional cycle Z(R^□_r̄(τ)/ϖ) of the fixed-type ring of the inertial type τ whose generic representations contain JL_K(σ); representations σ, σ′ with the same reduction mod p give equal cycles. Consequently, for the type τ_s of a level-zero type of D^× of order p and the Steinberg type τ_{Sp_n}, (R^□_r̄(τ_s)/ϖ)_red ≅ (R^□_r̄(τ_{Sp_n})/ϖ)_red.


### LocalGaloisDeformationRings:R08.2/regular-unipotent-minimally-ramified (theorem)

Let K/ℚ_ℓ be finite (ℓ ≠ p), σ a topological generator of tame inertia, r̄ : G_K → GL_n(k) with r̄(σ) unipotent with a single Jordan block, and r a lift to A ∈ C_𝒪 with characteristic polynomial of r(σ) equal to (X − 1)^n. Then for every j ≤ n the natural map ker((r(σ) − 1)^j) ⊗_A k → ker((r̄(σ) − 1)^j) is an isomorphism. Hence the unipotent problem R^1 (char r(σ) = (X − 1)^n) equals the minimally ramified problem of R08.2/minimally-ramified-condition under this hypothesis on r̄.


### LocalGaloisDeformationRings:R08.2/gsp4-ramification-types (definition)

Let x ≠ p be a prime and r̄ : G_x → GSp₄(k) with similitude a power of the cyclotomic character. r̄ is of type: (U3) if r̄(I_x) is unipotent, conjugate to the group generated by exp(N₃), N₃ = E₁₂ + E₂₃ − E₃₄ (rank 3); (U2) if conjugate to ⟨exp(N₂)⟩, N₂ = E₁₂ − E₃₄ (rank 2); (U1) if conjugate to ⟨exp(N₁)⟩, N₁ = E₂₃ (rank 1); (P) if r̄|G_x is a sum of characters with r̄|I_x = diag(1, 1, χ_x, χ_x) for a nontrivial χ_x, with isotropic invariant and χ_x-planes, and x − 1 prime to p; (H) if r̄|I_x is absolutely irreducible and x⁴ − 1 is prime to p. A cyclotomic-power similitude excludes type P, the types U, P, H are mutually exclusive, and r̄ is of type U2 (resp. U3) iff r̄(I_x) is generated by exp(N) with N nilpotent of rank 2 (resp. 3).

- API `TauCeti.GaloisDeformation.Local.GSp4RamType`: The types U1, U2, U3, P, H as a predicate on r̄ : G_x → GSp₄(k).
- API `TauCeti.GaloisDeformation.Local.GSp4RamType.unipotent_rank`: r̄ is of type U_i iff r̄(I_x) is generated by exp(N) with N ∈ sp₄ nilpotent of rank i.
- API `TauCeti.GaloisDeformation.Local.GSp4RamType.exclusive`: The types U, P, H are mutually exclusive.
- API `TauCeti.GaloisDeformation.Local.GSp4RamType.not_P`: A cyclotomic-power similitude excludes type P.
- API `TauCeti.GaloisDeformation.Local.GSp4RamType.conjugate`: Each ramification type is invariant under GSp₄(k)-conjugation of the residual representation. Its geometric orbit description is preserved by splitting coefficient-field extension, with the rational-orbit qualification already stated.
- Test `gsp4Type_U1` (computation): r̄(σ) = exp(E₂₃) = 1 + E₂₃ has rank-one logarithm, so r̄ is U1.
- Test `gsp4Type_U3_needs_p5` (non-example): For p = 3, exp(N₃) = 1 + N₃ + N₃²/2 + N₃³/6 is not defined over k; type U3 is stated for p ≥ 5.
- Test `gsp4Type_unramified` (degenerate): Unramified r̄ is of no type.
- Test `gsp4Type_H` (computation): r̄|I_x absolutely irreducible with x ≡ 2 mod 5, p = 5: x⁴ − 1 ≡ 0 mod 5 is excluded from type H.

### LocalGaloisDeformationRings:R08.2/gsp4-taylor-wiles-lifts (theorem)

Let v be a place with q_v ≡ 1 mod p, ρ̄ : G_{F_v} → GSp₄(k) unramified with multiplier ψ unramified, and ρ̄(Frob_v) with four distinct eigenvalues ᾱ₁, ᾱ₂, ᾱ₃ = ψ(Frob_v)/ᾱ₂, ᾱ₄ = ψ(Frob_v)/ᾱ₁. (1) Every lift ρ : G_{F_v} → GSp₄(A) with multiplier ψ is GSp₄(A)-conjugate to γ₁ ⊕ γ₂ ⊕ ψγ₂^{-1} ⊕ ψγ₁^{-1} for unique characters γ_i lifting the unramified γ̄_i with γ̄_i(Frob_v) = ᾱ_i. (2) With Δ_v = k(v)^×(p)², the characters γ_i∘Art_{F_v}|_{𝒪^×} give a local map 𝒪[Δ_v] → R^□_v, formally smooth of relative dimension 10, depending on the ordering of the eigenvalues.


### LocalGaloisDeformationRings:R08.2/gsp4-unipotent-local-models (construction)

Let p ≥ 3 and q a positive integer prime to p. 𝒰 ⊂ GSp₄/𝒪 is the closed subscheme of matrices with characteristic polynomial (X − 1)⁴ and 𝒩 ⊂ Lie GSp₄ that of matrices with characteristic polynomial X⁴. The truncated maps exp₂(N) = I + N + N²/2 + N³/2 and log₂(U) = (U − I) − (U − I)²/2 are mutually inverse GSp₄-equivariant isomorphisms 𝒩 ≅ 𝒰, with exp₂(mN + m*N³) = exp₂(N)^m and log₂(U^m) = m log₂(U) + m* log₂(U)³, m* = (m − m³)/3. 𝒩_i ⊂ 𝒩 is the reduced locally closed stratum of nilpotents of rank i, with representatives N₀ = 0, N₁ = E₁₄, N₂ = E₁₃ + E₂₄, N₃ = E₁₂ + E₂₃ − E₃₄; the centraliser Z_{GSp₄}(N_i) is smooth over 𝒪 with fibres of dimensions 11, 7, 5, 3. 𝒩(q) is the scheme of pairs (Φ, N) with Φ ∈ GSp₄, N ∈ 𝒩 and ΦNΦ^{-1} = qN + q*N³, q*=(q−q³)/3∈ℤ, and ℳ(x, y; q) (x, y ∈ 𝒪^×) the scheme of pairs (Φ, Σ) ∈ GSp₄² with char Σ = (X − x)(X − y)(X − y^{-1})(X − x^{-1}) and ΦΣΦ^{-1} = Σ^q; (Φ, Σ) ↦ (Φ, log₂ Σ) is an isomorphism ℳ(1, 1; q) ≅ 𝒩(q).

- API `TauCeti.GaloisDeformation.Local.GSp4.exp₂`: exp₂ : 𝒩 → 𝒰, N ↦ I + N + N²/2 + N³/2.
- API `TauCeti.GaloisDeformation.Local.GSp4.log₂`: log₂ : 𝒰 → 𝒩, U ↦ (U − I) − (U − I)²/2.
- API `TauCeti.GaloisDeformation.Local.GSp4.exp₂_log₂`: exp₂ ∘ log₂ = id and log₂ ∘ exp₂ = id.
- API `TauCeti.GaloisDeformation.Local.GSp4.exp₂_pow`: exp₂(mN + m*N³) = exp₂(N)^m, m* = (m − m³)/3.
- API `TauCeti.GaloisDeformation.Local.GSp4.nilpotentStratum`: 𝒩_i, the rank-i nilpotent stratum, with representative N_i.
- API `TauCeti.GaloisDeformation.Local.GSp4.MSpace`: ℳ(x, y; q) ⊂ GSp₄², with ℳ(1, 1; q) ≅ 𝒩(q).
- API `TauCeti.GaloisDeformation.Local.GSp4.exp₂_conjugate`: For invertible g in GSp₄, exp₂(gNg⁻¹)=g exp₂(N)g⁻¹ and log₂(gUg⁻¹)=g log₂(U)g⁻¹. Both polynomial maps commute with coefficient maps in which 2 is invertible.
- Test `exp2_N1` (computation): exp₂(E₁₄) = I + E₁₄ (E₁₄² = 0).
- Test `exp2_zero` (degenerate): exp₂(0) = I and log₂(I) = 0.
- Test `exp2_not_exp` (non-example): For p≥5 and N₃ with N₃³≠0, exp₂(N₃)≠exp(N₃)=I+N₃+N₃²/2+N₃³/6. At p=3 the usual exponential formula is undefined, whereas exp₂ is still a bijection 𝒩→𝒰.
- Test `mstar_integral` (computation): m* = (m − m³)/3 ∈ ℤ for all m ∈ ℤ, e.g. m = 2 gives m* = −2.
- Test `nilpotentModel_cubic_correction` (non-example): For q=2 one has q*=−2. In characteristic 3 the cubic coefficient is 1 and N₃³≠0, so the defining equation is ΦN₃Φ⁻¹=2N₃+N₃³, not merely 2N₃.

### LocalGaloisDeformationRings:R08.2/gsp4-ihara-avoidance-rings (theorem)

Let v be finite with q_v ≡ 1 mod p, ρ̄ : G_{F_v} → GSp₄(k) trivial, ψ unramified with trivial reduction, and χ = (χ₁, χ₂) continuous characters 𝒪_{F_v}^× → 𝒪^× trivial mod λ. 𝒟_v^χ is the problem of lifts with multiplier ψ such that for σ ∈ I_{F_v}, char ρ(σ) = (X − χ₁(Art^{-1}σ))(X − χ₂(Art^{-1}σ))(X − χ₂(Art^{-1}σ)^{-1})(X − χ₁(Art^{-1}σ)^{-1}), represented by R_v^χ. (1) If χ₁, χ₂ ≠ 1 and χ₁ ≠ χ₂^{±1}, every closed point of Spec R_v^χ[1/p] is smooth and Spec R_v^χ is irreducible of dimension 11. (2) For χ₁ = χ₂ = 1, Spec R_v^1 is equidimensional of dimension 11 with characteristic-zero generic points, and every generic point of Spec R_v^1/λ specialises from a unique generic point of Spec R_v^1. (3) R̃_v^χ ≅ R_v^χ⟦T⟧ is the completed local ring of ℳ(x, y; q_v) at (1, 1), x = χ₁(Art^{-1}σ), y = χ₂(Art^{-1}σ), and R_v^χ/λ = R_v^1/λ.


### LocalGaloisDeformationRings:R08.2/g-valued-generic-fibre-away-from-p (theorem)

Let ℓ ≠ p, K/ℚ_ℓ finite (or a local field of characteristic ℓ), G a smooth affine group over 𝒪 with reductive G⁰, ρ̄ : G_K → G(k) and μ a fixed multiplier. (1) (Bellovin–Gee, Theorem 3.3.3) Spec R^{□,μ}_ρ̄[1/p] is equidimensional of dimension dim G^der, its components are covered by the closures of inertial-type loci, with possibly multiple components for one type up to G⁰-conjugacy, and it has an open dense regular subscheme; the Zariski closure of a component is a reduced 𝒪-flat quotient. (2) (Booher) For G = GSp_{2n} and multiplier κ^{1−2n}, ρ̄ has a minimally ramified lift lying on an irreducible component of R^{□,κ^{1−2n}}_ρ̄ isomorphic to 𝒪′⟦X₁, …, X_{dim G^der}⟧. (3) At a trivial prime v₀, a lift whose Weil–Deligne representation is a twist of the Steinberg parameter is a formally smooth point of R^{□,κ^{1−2n}}_{ρ̄|G_{v₀}}.


### LocalGaloisDeformationRings:R08.2/equal-characteristic-local-lifts (theorem)

Let F be a global function field of characteristic ℓ ≠ p and v a place. For p ≫_n 0 every ρ̄ : G_{F_v} → GL_n(k) has a p-adic lift; any character G_{F_v} → 1 + ϖ𝒪 has an n-th root when p ∤ n, so the determinant (or multiplier) of the lift can be matched to a prescribed global character μ. The generic-fibre analysis of R08.2/g-valued-generic-fibre-away-from-p (1) holds for R^{□,μ}_ρ̄.


### LocalGaloisDeformationRings:R08.2/reducible-lifts-prescribed-determinant (theorem)

Let p ≥ 3, ρ̄ ∼ (χ̄ ∗; 0 1) a two-dimensional residual representation of G_{F,S} and μ = κ^{r−1}χ₀ a geometric lift of det ρ̄ (r ≥ 2, χ₀ of finite order). For v ∈ S not above p there is, after enlarging 𝒪, a lift ρ_v : G_{F_v} → GL₂(𝒪′) of ρ̄|G_{F_v} with determinant μ, lying on a formally smooth irreducible component of R^{□,μ}_{ρ̄|G_{F_v}}.


### LocalGaloisDeformationRings:R08.2/ihara-avoidance-rings-p2 (theorem)

Let p = 2, v ∤ 2 a finite place, ρ̄ : G_{F_v} → GL_n(k). (1) There is a finite extension F′_v/F_v such that every lift of ρ̄ becomes unipotently ramified on G_{F′_v}. (2) If ρ̄ is unramified with ρ̄(Frob_v) regular semisimple (q_v odd), every lift is strictly equivalent to a direct sum of characters, and becomes unramified over a uniform finite extension. (3) For ρ̄ trivial and finite-order characters χ_{v,j} : 𝒪_{F_v}^× → 𝒪^× trivial mod ϖ, let R_v^χ classify lifts with char ρ(σ)(X) = Π_j (X − χ_{v,j}(Art^{-1}σ)^{-1}) for σ ∈ I_{F_v}. If all χ_{v,j} = 1, every component of R_v^1 has dimension n² + 1, every prime minimal over ϖ contains a unique minimal prime, and generic points have characteristic zero; if the χ_{v,j} are pairwise distinct, Spec R_v^χ is irreducible of dimension n² + 1 with characteristic-zero generic point.


### LocalGaloisDeformationRings:R08.3/pst-quotient-in-families (theorem)

Let E/ℚ_p be finite, A° a Noetherian complete local 𝒪_E-algebra with finite residue field, A = A°[1/p], and V_{A°} a finite free A°-module of rank r with a continuous G_K-action (K/ℚ_p finite). (1) (Kisin 2.5.5) For h ≥ 0 there is a quotient A^{st,h} of A such that a map of ℚ_p-algebras ζ : A → B to a finite ℚ_p-algebra B factors through it iff V_B = V_A ⊗_A B is semistable with Hodge–Tate weights in [0, h]; over A^{st,h} there is a projective (φ, N)-module D of rank r specialising to D_st(V_B). (2) (Kisin 2.7.6) For a p-adic Hodge type v (an E-vector space D_E of dimension r with E ⊗ K-submodules) and τ : I_K → GL_r(E) with open kernel, there is a quotient A^{τ,v} of A such that ζ : A → B (B a finite E-algebra) factors through it iff V_B is potentially semistable of type τ and p-adic Hodge type v. (3) (Kisin 2.7.7) Likewise A^{τ,v}_cr for potentially crystalline. These quotients are compatible with base change along maps A° → A′° of complete local 𝒪_E-algebras: (A′)^{τ,v} = A′ ⊗_A A^{τ,v}.


### LocalGaloisDeformationRings:R08.3/g-valued-pst-rings (theorem)

Let K/ℚ_p be finite, G a smooth affine 𝒪-group with reductive G⁰, ρ̄ : G_K → G(k), τ : I_K → G(Ē) an inertial type up to G⁰(Ē)-conjugacy and v a p-adic Hodge type (a conjugacy class of cocharacters). (1) (Balaji) There is a unique reduced 𝒪-flat quotient R^{□,τ,v}_ρ̄ of R^□_{ρ̄,G} (R08.1/g-valued-framed-ring) whose E′-points (E′/E finite) are exactly the lifts that are potentially semistable of type (τ, v). (2) (Bellovin–Gee, Theorem A) For v = v_λ with λ regular, R^{□,τ,v}_ρ̄ is equidimensional, every irreducible component of R^{□,τ,v}_ρ̄[1/p] has dimension dim G + [K:ℚ_p]·dim Fl_G, and R^{□,τ,v}_ρ̄[1/p] has an open dense regular subscheme. (3) With fixed multiplier μ the same holds with dim G^der in place of dim G. For G = GL_n this is R08.3/pst-deformation-ring with R08.3/pst-generic-fibre (dim Fl = n(n−1)/2).


### LocalGaloisDeformationRings:R08.3/weil-deligne-type-ring (construction)

Let p be such that the block theory of GL₂(ℚ_p) applies, B a block of mod p representations of GL₂(ℚ_p) with pseudo-character deformation ring R^{ps,δ}_B, and M a supercuspidal Weil–Deligne representation (a filtered (φ, N, G_{ℚ_p})-module type of weights 0 and 1) with δ_M its determinant. I_{B,M} is the intersection of the maximal ideals 𝔭 of R^{ps,δ_M}_B[1/p] at which the universal pseudo-character specialises to the trace of a de Rham representation of weights {0, 1} and type M (whole Weil–Deligne representation fixed, not only its restriction to inertia). R_{B,M} := R^{ps,δ_M}_B[1/p]/I_{B,M} is reduced and Jacobson, R^+_{B,M} is the image of R^{ps,δ_M}_B, and R_{B,M} = R^+_{B,M}[1/p]. (Théorème 5.11) R_{B,M} is the ring of bounded analytic functions on an open subset of ℙ¹, a finite product of principal ideal domains, and there is a unique up to isomorphism representation ρ_{B,M} : G_{ℚ_p} → GL₂(R_{B,M}) with trace the universal pseudo-character.

- API `TauCeti.GaloisDeformation.Local.WDTypeRing`: R_{B,M} = R^{ps,δ_M}_B[1/p]/I_{B,M} and its integral model R^+_{B,M}.
- API `TauCeti.GaloisDeformation.Local.WDTypeRing.points`: A maximal ideal of R^{ps,δ_M}_B[1/p] contains I_{B,M} iff the specialised pseudo-character is the trace of a de Rham representation of weights {0, 1} and Weil–Deligne type M.
- API `TauCeti.GaloisDeformation.Local.WDTypeRing.reduced`: R_{B,M} is reduced and Jacobson.
- API `TauCeti.GaloisDeformation.Local.WDTypeRing.pid`: R_{B,M} is a finite product of principal ideal domains (bounded analytic functions on an open of ℙ¹).
- API `TauCeti.GaloisDeformation.Local.WDTypeRing.universalRep`: The representation ρ_{B,M} with Tr ρ_{B,M} = the universal pseudo-character.
- API `TauCeti.GaloisDeformation.Local.WDTypeRing.integralImage`: R^+_{B,M} is the image of R^{ps,δ_M}_B→R_{B,M}; its kernel is the inverse image of I_{B,M} under localization, and localizing R^+_{B,M} at p gives R_{B,M}. This makes integral image and generic ring distinct constructions.
- Test `wdTypeRing_points_typeM` (characterisation): Every maximal ideal x of R_{B,M} gives ρ_x de Rham of weights {0, 1} with WD(ρ_x) ≅ M (Frobenius included).
- Test `wdTypeRing_vs_galois_type` (non-example): Choose a supercuspidal WD representation M that is not isomorphic to its unramified quadratic twist. The two have the same inertial restriction and determinant but differ as full WD types. Forgetting Frobenius does not by itself imply an increase of one in dimension when determinant is fixed.
- Test `wdTypeRing_empty_block` (degenerate): If no de Rham representation of type M has reduction in B, I_{B,M} is the unit ideal and R_{B,M} = 0.
- Test `wdTypeRing_trace` (compatibility): Tr ∘ ρ_{B,M} equals the image of the universal pseudo-character of R^{ps,δ_M}_B.

### LocalGaloisDeformationRings:R08.3/bcdt-type-rings (comparison)

Let ℓ be a prime, ρ̄ : G_ℓ → GL(V) two-dimensional over k with End_{k[G_ℓ]} V = k, and R_{V,𝒪} its universal deformation ring. An ℓ-type τ is a class of two-dimensional τ : I_ℓ → GL(D) over ℚ̄_ℓ with open kernel extending to W_{ℚ_ℓ}; an extended ℓ-type τ′ a class of τ′ : W_{ℚ_ℓ} → GL(D′) with open kernel. ρ over K is of type τ (resp. τ′) if it is Barsotti–Tate over every finite F/ℚ_ℓ with τ|_{I_F} trivial, WD(ρ)|_{I_ℓ} ∈ τ (resp. WD(ρ) ∼ τ′), and ε^{-1} det ρ has finite order prime to ℓ. R^D_{V,𝒪} = R^τ_{V,𝒪} is the quotient of R_{V,𝒪} by the intersection of the primes of type τ (0 if none); 'weakly of type τ' means factoring through R^D; τ is weakly acceptable if R^D = 0 or there is a surjection 𝒪⟦X⟧ ↠ R^D. Then: (1) R^D_{V,𝒪} is the unframed potentially crystalline quotient R^{τ,v_{BT},cris} obtained from R08.3/pst-deformation-ring and R08.3/pcris-generic-smooth with v_{BT} the Hodge type of weights {0, 1} and the determinant condition. (2) BCDT Conjecture 1.1.1 (a deformation to 𝒪′ is weakly of type τ iff it is of type τ) holds, by the point characterisation of Kisin's rings.


### LocalGaloisDeformationRings:R08.3/fixed-determinant-pst-rings (theorem)

Let p ∤ n, λ a dominant weight, ρ̄ : G_K → GL_n(k), and ψ : G_K → 𝒪^× a crystalline character lifting det ρ̄ with τ-labelled Hodge–Tate weight Σ_i (λ_{τ,i} + n − i). For R = R^{cris,λ}_ρ̄ (resp. R^{△,λ}_ρ̄, L7/semistable-ordinary-quotient) put R^ψ = R ⊗_{R^□_ρ̄} R^{□,ψ}_ρ̄. Then the quotient map R → R^ψ has a section extending to an isomorphism R^ψ⟦X⟧ ≅ R; in particular R^ψ is 𝒪-flat and reduced, and a map R^{□,ψ}_ρ̄ → B (B a finite E-algebra) factors through R^ψ iff the corresponding lift is crystalline of Hodge type v_λ (resp. semistable-ordinary of weight λ).


### LocalGaloisDeformationRings:R08.4/finite-cocycles-kummer (theorem)

Let F_v/ℚ_p be finite unramified, D_v = G_{F_v}, I_v its inertia, F^nr the maximal unramified extension. Let B be a complete local Noetherian 𝒪-algebra and N a finitely generated B-module, Ξ = χ₁η₁η₂^{-1} a character with Ξ|_{I_v} the cyclotomic character χ_p (the case k(ρ̄) = 2) and M = N(Ξ). Kummer theory gives H¹_cont(I_v, N(χ_p)) ≅ (F^{nr×} ⊗ N)^∧ (𝔪_B-adic completion), D_v/I_v-equivariantly; composing with the valuation (v(p) = 1) gives v_Z : Z¹(D_v, M) → N, and Z¹_f(M) := ker v_Z (finite cocycles; Z¹_f = Z¹ when k(ρ̄) > 2). Then Z¹_f(B(Ξ)) is free of rank 1 + [F_v:ℚ_p] over B and Z¹_f(N(Ξ)) = Z¹_f(B(Ξ)) ⊗_B N.


### LocalGaloisDeformationRings:R08.4/kw-algebraisation-lemma (lemma)

Let A₀ = 𝒪[T], A = 𝒪⟦T⟧, M₀ a free A₀-module of finite rank, M = A ⊗_{A₀} M₀ and m ∈ M. Then there exist m₀ ∈ M₀ and an isomorphism A ⊗_{A₀} M₀ ≅ M of A-modules sending m₀ to m.


### LocalGaloisDeformationRings:R08.4/bt-ring-unique-generalisation (theorem)

Let p be odd, F_v/ℚ_p finite and R = R^{ε_p^{-1},BT}_v the fixed-determinant Barsotti–Tate lifting ring (crystalline of Hodge–Tate weights {0, 1}, determinant ε_p^{-1}) of ρ̄ : G_{F_v} → GL₂(k). Each generic point of Spec(R/ϖ) is the specialisation of a unique generic point of Spec R. Moreover, if ρ̄ is trivial, k_v ≠ 𝔽_p and R ≠ 0, Spec R has exactly two irreducible components, whose points are the ordinary and the non-ordinary lifts.


### LocalGaloisDeformationRings:R08.5/weight-p-crystalline-ordinarity (comparison)

Let p ≥ 3, F/ℚ_p finite unramified and ρ : G_F → GL₂(E) a lift of ρ̄ that is crystalline of weight k (Hodge–Tate weights {0, k − 1}) with 2 ≤ k ≤ p. If ρ̄ is ordinary (has a G_F-stable line with unramified quotient), ρ is ordinary. The endpoint k = p, where Fontaine–Laffaille modules of filtration length p − 1 occur but the torsion functor is not fully faithful, is included.


### LocalGaloisDeformationRings:R08.5/weight-p-plus-one-ordinary-ring (theorem)

Let p ≠ 2, ρ̄ : G_{F_v} → GL₂(k) with F_v = ℚ_p, k(ρ̄) = p + 1 (so ρ̄|I_v ≅ (χ̄_p ∗; 0 1) très ramifié) and φ a fixed determinant. (1) For F_v = ℚ_p, every crystalline lift of weight p + 1 is ordinary (Berger–Li–Zhu), i.e. an extension of an unramified free rank-one representation by a free rank-one representation on which I_v acts by χ_p^p. (2) The framed fixed-determinant ring R^{□,ψ}_v of ordinary lifts of weight p + 1 (extensions of unramified η₂ by χ_p^pη₁) is formally smooth over 𝒪 of relative dimension 4. (3) The map Spf R^{□,ψ}_v → X to the space of characters giving the action on the stable line is not formally smooth.


### LocalGaloisDeformationRings:R08.5/semistable-weight-two-resolution (theorem)

Let ρ̄_v = (γ̄_vχ̄_p ∗; 0 γ̄_v) : G_{F_v} → GL₂(k) with F_v/ℚ_p unramified and γ̄_v unramified, φ a fixed determinant, and γ_v a fixed unramified lift of γ̄_v with γ_v²χ_p = φ. Consider lifts (γ_vχ_p ∗; 0 γ_v). For finite A, |Z¹(D_v, A(χ_p))| = |A|^{2+[F_v:ℚ_p]}, and the moduli of such lifts with a stable line is a smooth resolution ℛ → Spf R^{□,ψ}_v: (1) unless p = 2 and D_v acts on ρ̄_v by homotheties, ℛ → Spf R^{□,ψ}_v is an isomorphism and ℛ is a torsor over the completion of ℙ¹_𝒪 at the residual line with its prescribed character of ρ̄_v under the completion of a free module of rank 2 + [F_v:ℚ_p] along the zero section; (2) if p = 2 and D_v acts by homotheties, ℛ is a torsor over the completion of ℙ¹_𝒪 along its special fibre under the completion of a free module of rank 2 + [F_v:ℚ_p].


### LocalGaloisDeformationRings:R08.5/dyadic-minimal-lifts (construction)

Let v be a place with residue characteristic q ≠ p and ρ̄_v : D_v → GL₂(k) whose projective image G of I_v has order divisible by p and is non-cyclic. (a) If the centre C of the image of wild inertia in G is cyclic, then p = 2, G is dihedral of order 2d with d odd and q | d, and ρ̄_v ≅ Ind_{G_L}^{D_v}(γ) for a wildly ramified character γ of a ramified quadratic L/F_v; the minimal lift ρ₀ is an unramified twist of Ind(γ̂δ) with γ̂ the Teichmüller lift and δ a ramified quadratic character of G_L, with det ρ₀ = φ. Its restriction to I_v does not depend on δ, det ρ₀|I_v is the Teichmüller lift of det ρ̄|I_v, and the conductor of ρ₀ equals that of ρ̄_v. (b) If C is non-cyclic, then q = 2, p = 3, G ≅ A₄ inside S₄, and ρ₀ is the unique lift with determinant φ whose projectivisation is the lift of S₄ to PGL₂(ℤ₃). A lift ρ of ρ̄_v is minimal if ρ|I_v ≅ ρ₀|I_v; minimal lifts form the inertia-rigid deformation problem of ρ₀.

- API `TauCeti.GaloisDeformation.Local.DyadicMinimal.lift`: The lift ρ₀ = unramified twist of Ind(γ̂δ) in case (a), or the S₄-lift in case (b).
- API `TauCeti.GaloisDeformation.Local.DyadicMinimal.restrict_inertia`: ρ₀|I_v is independent of δ (case (a)).
- API `TauCeti.GaloisDeformation.Local.DyadicMinimal.det_inertia`: det ρ₀|I_v is the Teichmüller lift of det ρ̄_v|I_v.
- API `TauCeti.GaloisDeformation.Local.DyadicMinimal.conductor`: a(ρ₀) = a(ρ̄_v).
- API `TauCeti.GaloisDeformation.Local.DyadicMinimal.problem`: Minimal lifts: the inertia-rigid problem attached to ρ₀ (GlobalGaloisDeformations R04.4).
- Test `dyadicMinimal_det` (computation): For ρ̄_v = Ind(γ) with γ of order 3·2^a on a ramified quadratic L, det ρ₀|I_v = Teichmüller(det ρ̄_v|I_v).
- Test `dyadicMinimal_naive_fails` (non-example): The naive lift Ind(γ̂) without δ has det|I_v = ε_L·(γ̂∘t), which differs from the Teichmüller lift of det ρ̄|I_v by the ramified ε_L; δ corrects it.
- Test `dyadicMinimal_A4` (computation): q = 2, p = 3, G ≅ A₄: ρ₀ has projective image S₄ ⊂ PGL₂(ℤ₃) or its subgroup A₄.
- Test `dyadicMinimal_tame` (degenerate): If #G is prime to p, ρ₀ is the unique lift with ρ₀(I_v) ≅ ρ̄_v(I_v) (KW II §3.3.1, first case).

### LocalGaloisDeformationRings:R08.5/twisted-semistable-away-from-p (theorem)

Let v ∤ p and ρ̄|D_v = (γ̄_vχ̄_p ∗; 0 γ̄_v). Fix a character γ_v of D_v lifting γ̄_v whose restriction to I_v is the Teichmüller lift, with γ_v²χ_p = φ, and consider lifts (γ_vχ_p ∗; 0 γ_v). For a finite 𝒪-algebra A, |Z¹(G_{F_v}, A(χ_p))| = |A|·|H⁰(G_{F_v}, A)| = |A|², and the moduli of such lifts with a stable line is a smooth resolution as in R08.5/semistable-weight-two-resolution with cocycle module of rank 2. If ρ̄_v is ramified, the conductor of such a lift equals the conductor of ρ̄_v.


### LocalGaloisDeformationRings:R08.5/kw1-endpoint-weight-rings (theorem)

KW I Theorem 4.1 (modularity lifting) needs, at p, local deformation rings of the following lifts of ρ̄|G_{ℚ_p}, each with a flat reduced framed fixed-determinant ring of relative dimension 3 + 1 = 4 with regular generic fibre (or formally smooth): (1) p = 2: crystalline of weight 2 (Kisin's 2-adic Barsotti–Tate rings, R08.5/flat-connected-deformation-ring and R08.5/rank-two-connected-components), or semistable of weight 2 when k(ρ̄) = 4 (R08.5/semistable-weight-two-resolution, homothety case included); (2) p > 2: crystalline of weight k with 2 ≤ k ≤ p + 1 — the Fontaine–Laffaille range k ≤ p − 1, the endpoint k = p (R08.5/weight-p-crystalline-ordinarity) and k = p + 1 (R08.5/weight-p-plus-one-ordinary-ring) — or potentially semistable of weight 2 (R08.3/pst-deformation-ring, R08.4/savitt-weight-two-rings).


### LocalGaloisDeformationRings:R08.6/kw1-lift-types (theorem)

KW I Theorem 5.1 lifts ρ̄ (S-type, 2 ≤ k(ρ̄) ≤ p + 1 for p > 2) to an almost strictly compatible system whose p-adic member has one of the following local types; each is exported with its ring, dimension, nonemptiness and tangent condition: (1) minimally ramified at primes ≠ p (R08.2/minimally-ramified-ring, R08.5/dyadic-minimal-lifts; R08.6/export-away-from-p) and crystalline of weight k(ρ̄) at p (R08.6/export-fontaine-laffaille-irreducible, R08.6/export-ordinary, R08.6/export-endpoint-weight); (2) weight 2, minimally ramified at primes ≠ p, with inertial Weil–Deligne parameter (ω_p^{k(ρ̄)−2} ⊕ 1, 0) at p, or (id, N ≠ 0) when k(ρ̄) = p + 1 (p > 2) or k(ρ̄) = 4 (p = 2) (R08.6/export-weight-two-irreducible, R08.6/export-ordinary, R08.6/export-semistable-weight-two-at-p, R08.6/dyadic-weight-two-transition); (3) at q ∥ N(ρ̄) with p | q − 1 and ρ̄|I_q = (χ ∗; 0 1): ρ_p|I_q = (χ′ ∗; 0 1) for a chosen non-trivial 𝒪′-valued lift χ′ of χ factoring through (ℤ/q)^× (i even if p = 2): the abelian condition with fixed inertial character (R08.6/export-away-from-p); (4) at q ≠ p with p | q + 1 and ρ̄|D_q ≅ (χ_p ∗; 0 1) up to unramified twist: the good-dihedral condition (R08.6/good-dihedral-type).


### LocalGaloisDeformationRings:R08.6/good-dihedral-type (theorem)

Let q ≠ p be a prime with p | q + 1, and ρ̄|D_q ≅ (χ_p ∗; 0 1) up to unramified twist. Let {χ′, χ′^q} be a pair of 𝒪′-valued characters of I_q of level 2 (factoring through 𝔽_{q²}^× but not 𝔽_q^×) of p-power order, χ′ = ω_{q,2}^i ω_{q,2}^{qj} with 0 ≤ j < i ≤ q − 1, and i + j even when p = 2. The lifts with ρ|I_q ≅ χ′ ⊕ χ′^q (induced from a character of G_{ℚ_{q²}}) and fixed determinant form the non-abelian level-two inertia-rigid problem: its ring is flat of relative dimension 3 over 𝒪 with regular generic fibre, and it is non-empty after enlarging 𝒪. Such χ′ exist unless p = 2 and v₂(q + 1) = 1; for p odd they are the non-trivial powers of ω_{q,2}^{(q²−1)/p^r} (r = v_p(q + 1)), and (i, j) = (q − 1 − j, m(q + 1)/p^r − 1) with 0 < m < p^r/2, so i = j + 1 does not occur.


### LocalGaloisDeformationRings:R08.6/dyadic-weight-two-transition (theorem)

Let p = 2, F_v = ℚ₂ (or F_v/ℚ₂ unramified for reducible ρ̄_v), and φ = ψχ₂ a fixed determinant. The weight-two lifts used in KW I Theorem 5.1(2) and KW II §3.2.2(i) at p = 2 are: crystalline of weight 2 (equivalently Barsotti–Tate with det|I_v = χ₂) if k(ρ̄_v) = 2, and semistable of weight 2 with inertial Weil–Deligne parameter (id, N ≠ 0) if k(ρ̄_v) = 4. In the first case R̄^{□,ψ}_v is Kisin's 2-adic flat ring (R08.5/flat-connected-deformation-ring, R08.5/rank-two-connected-components), flat of relative dimension 3 + [F_v:ℚ₂] with regular generic fibre; in the second it is the semistable weight-two ring (γ_vχ₂ ∗; 0 γ_v) of R08.6/export-semistable-weight-two-at-p, formally smooth unless D_v acts by homotheties, in which case it is a domain, faithfully flat of relative dimension 3 + [F_v:ℚ₂] with regular generic fibre.


### LocalGaloisDeformationRings:R08.6/ordinary-pcris-lifts-reducible (theorem)

Let p ≥ 3, ρ̄ ∼ (χ̄ ∗; 0 1) a two-dimensional residual representation of G_{F,S}, and μ = κ^{r−1}χ₀ (r ≥ 2, χ₀ of finite order) a geometric lift of det ρ̄. After enlarging 𝒪, for v | p there is an ordinary potentially crystalline lift ρ_v of ρ̄|G_{F_v} with Hodge–Tate weights {0, r − 1} and determinant μ; and there is always an ordinary potentially crystalline lift with Hodge–Tate weights {0, r − 1} having a non-trivial unramified quotient, possibly without det ρ_v = μ. Here a lift is ordinary when it is F′_v-ordinary of some weight in the sense of L7/g-valued-ordinary-condition (for GL₂: a stable line with the prescribed inertial characters).


### LocalGaloisDeformationRings:R08.6/serre-weight-crystalline-lift (theorem)

Let ρ̄_p : G_{ℚ_p} → GL₂(k) (or G_{F_v} with F_v = ℚ_p at each v | p) and r = k(ρ̄_p) Serre's weight (Serre 1987 §2.3). After enlarging 𝒪 there is a crystalline lift ρ_p of ρ̄_p with Hodge–Tate weights {0, r − 1}; when ρ̄_p is reducible it may be chosen ordinary with an unramified quotient.


### LocalGaloisDeformationRings:R08.6/newton-thorne-local-quotients (application)

Let r : G_F → GL₂(k) with det = ε^{-1} and R_v the fixed-determinant lifting ring at v. The local quotients R̄_v used in Newton–Thorne §4 are: (1) v | p, r_{π,ι}|G_{F_v} non-ordinary: the reduced 𝒪-torsion-free quotient of crystalline non-ordinary lifts of Hodge–Tate weights {0, 1}, a domain of dimension 4 + [F_v:ℚ_p] (Kisin, Corollary 2.3.13); (2) v | p, ordinary crystalline: the ordinary crystalline quotient, a domain of dimension 4 + [F_v:ℚ_p] (Kisin, Proposition 2.4.6); (3) v ∈ Σ_p (ordinary non-crystalline, p > 2): the semistable non-crystalline quotient, a domain of dimension 4 + [F_v:ℚ_p] (Snowden, Proposition 4.3.1); (4) v ∈ Σ^p: the extensions of ε^{-1} by 1, a domain of dimension 4 (Kisin, Proposition 2.5.2); (5) v real: Kisin's R^{V−1,F}, a domain of dimension 3 (Proposition 2.5.6).


### LocalGaloisDeformationRings:R08.6/torsion-semistable-condition (theorem)

Let F_v/ℚ_p be finite and r̄ : G_{F_v} → GL₂(k). The condition on a lift r_B (B ∈ C_𝒪 Artinian) that B² be isomorphic, as ℤ_p[G_{F_v}]-module, to a subquotient of a lattice in a semistable ℚ_p[G_{F_v}]-representation with Hodge–Tate weights in {0, 1} is stable (closed under subobjects, quotients and finite direct sums in the sense of Ramakrishna), so it cuts out a quotient R′_v of the fixed-determinant lifting ring R_v. The semistable non-crystalline quotient of R08.6/newton-thorne-local-quotients (3) factors through R′_v.


### LocalGaloisDeformationRings:R08.6/category-deformation-conditions (construction)

Let K/ℚ_ℓ be finite with integers 𝒪 and residue field k, ρ̄ : G_ℓ → Aut_k(V) two-dimensional with centraliser k, and ψ a lift of det ρ̄. S(ρ̄) is the abelian category of finite-length 𝒪[G_ℓ]-modules with a filtration whose graded pieces are ≅ V. For a full subcategory S ⊂ S(ρ̄) closed under isomorphism, finite products, subobjects and quotients and containing V, D^S_{V,𝒪}(R) is the set of deformations to R with R/𝔞 ∈ S (as 𝒪[G_ℓ]-modules, R/𝔞)² for all open ideals 𝔞; D^{ψ,S} adds det = ψ. They are represented by R^S_{V,𝒪} and R^{ψ,S}_{V,𝒪}, quotients of R_{V,𝒪} and R^ψ_{V,𝒪}; the tangent space of D^S is Ext¹_S(V, V) and that of D^{ψ,S} is H¹_S(G_ℓ, ad⁰ρ̄).

- API `TauCeti.GaloisDeformation.Local.CategoryCondition`: A full subcategory S ⊂ S(ρ̄) closed under isomorphism, finite products, subobjects and quotients, containing V.
- API `TauCeti.GaloisDeformation.Local.CategoryCondition.defFunctor`: D^S_{V,𝒪} and D^{ψ,S}_{V,𝒪}.
- API `TauCeti.GaloisDeformation.Local.CategoryCondition.ring`: R^S_{V,𝒪}, R^{ψ,S}_{V,𝒪}, quotients of R_{V,𝒪}, R^ψ_{V,𝒪}.
- API `TauCeti.GaloisDeformation.Local.CategoryCondition.tangent`: Tangent space of D^{ψ,S} is H¹_S(G_ℓ, ad⁰ρ̄) ⊂ H¹(G_ℓ, ad⁰ρ̄).
- API `TauCeti.GaloisDeformation.Local.CategoryCondition.flat`: For S the finite flat modules, D^S is R08.4/flat-deformation-condition.
- API `TauCeti.GaloisDeformation.Local.CategoryCondition.mono`: For S⊂T satisfying the category-condition hypotheses and the same residual object and determinant, D^S⊂D^T induces a canonical surjection R^T↠R^S commuting with the universal lifts.
- Test `categoryCondition_all` (degenerate): S = S(ρ̄): R^S_{V,𝒪} = R_{V,𝒪}.
- Test `categoryCondition_flat` (compatibility): S = finite flat 𝒪[G_ℓ]-modules (ℓ = p): R^S is the flat deformation ring.
- Test `categoryCondition_not_closed` (non-example): The full subcategory consisting of 0 and a single copy of the residual object V is not closed under finite products: V⊕V is missing. It therefore fails the category-condition hypotheses. A category of semisimple sums is not a counterexample to subobject/quotient closure.
- Test `categoryCondition_tangent_dim` (computation): For S = finite flat, ρ̄ peu ramifié of weight 2 over ℚ_p: dim H¹_S(G_p, ad⁰ρ̄) = 1 + dim H⁰(G_p, ad⁰ρ̄).

### LocalGaloisDeformationRings:L7/ordinary-of-weight-lambda (definition)

Let K/ℚ_p be finite, E ⊃ K-Galois closure large, and λ = (λ_{τ,1} ≥ ⋯ ≥ λ_{τ,n})_{τ : K ↪ E} a dominant weight. A continuous ρ : G_K → GL_n(B) (B a finite E-algebra, or 𝒪_{E′}) is ordinary of weight λ if it is conjugate to an upper-triangular representation with diagonal characters χ₁, …, χ_n (in that order) such that, for every i, the character x ↦ χ_i(Art_K(x))·Π_τ τ(x)^{λ_{τ,n−i+1}+i−1} of 𝒪_K^× has finite order (equivalently, χ_i(Art_K(α)) = Π_τ τ(α)^{−(λ_{τ,n−i+1}+i−1)} for α ∈ 𝒪_K^× close to 1). It is semistable-ordinary of weight λ if the χ_i satisfy the identity on all of I_K: χ_j(σ) = Π_τ τ(Art_K^{-1}(σ))^{−λ_{τ,n+1−j}−(j−1)}. The flag is part of the condition; a condition on characteristic polynomials alone is not equivalent (L8).

- API `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight`: The predicate: ρ has a G_K-stable full flag whose graded characters χ_i satisfy χ_i∘Art_K ≡ Π_τ τ^{−(λ_{τ,n−i+1}+i−1)} up to finite order on 𝒪_K^×.
- API `TauCeti.GaloisDeformation.Local.IsSemistableOrdinaryOfWeight`: The same with equality on I_K.
- API `TauCeti.GaloisDeformation.Local.IsSemistableOrdinaryOfWeight.isOrdinary`: Semistable-ordinary of weight λ implies ordinary of weight λ.
- API `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight.potentiallySemistable`: Ordinary of weight λ implies potentially semistable of Hodge type v_λ; semistable-ordinary implies semistable of type v_λ.
- API `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight.flag_unique`: If the χ_i are pairwise distinct on I_K, the flag is unique.
- API `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight.restrict`: Ordinary of weight λ is preserved by restriction to G_{K′} (with the restricted weight).
- API `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight.baseChange`: A coefficient map between the allowed finite E-algebras carries the stable full flag of direct summands and its ordered inertia characters to an ordinary flag of the same weight. Exact semistable-ordinary characters are preserved as well.
- Test `ordinaryWeight_n1` (computation): n = 1, λ = (λ_τ): χ_p^{-1}-normalised, ρ = χ_λ·(unramified) is ordinary of weight λ; ρ = χ_λ·ω (ω ramified of order p) is ordinary but not semistable-ordinary.
- Test `ordinaryWeight_weight_zero` (degenerate): For n=2 and λ=(0,0), the ordered inertia characters are 1 and ε_p⁻¹. Weight zero is not the condition that both diagonal characters are unramified.
- Test `ordinaryWeight_charpoly_not_enough` (non-example): For n=2, λ=(0,0), a nonsplit extension with subcharacter ε_p⁻¹ and quotient 1 has the same characteristic polynomials as 1⊕ε_p⁻¹ but lacks a stable subline carrying 1. It fails CN’s prescribed ordering despite the determinant equations.
- Test `ordinaryWeight_KW` (compatibility): For n=2, λ=(k−2,0), CN’s ordered inertia characters are 1 and ε_p^{−(k−1)}. Dualizing and reversing the flag gives KW’s higher-weight subline χ_p^{k−1} and weight-zero quotient. This is a duality comparison, not equality of the original ordered representations.

### LocalGaloisDeformationRings:L7/semistable-ordinary-quotient (theorem)

Let λ be dominant for (Res_{K/ℚ_p} GL_n)_E and ρ̄ : G_K → GL_n(k). (1) (Kisin) There are unique 𝒪-flat quotients R^{st,λ}_ρ̄ and R^{cris,λ}_ρ̄ of R^□_ρ̄ whose maps to finite E-algebras B are exactly the lifts that are semistable (resp. crystalline) of p-adic Hodge type v_λ; R^{st,λ}_ρ̄ is reduced (Bellovin–Gee) and R^{cris,λ}_ρ̄[1/p] is regular. (2) If B is a finite local E-algebra, ρ_B semistable of Hodge type v_λ and ρ_B ⊗ B/𝔪_B semistable-ordinary of weight λ, then ρ_B is semistable-ordinary of weight λ. (3) There is a unique 𝒪-flat quotient R^{△,λ}_ρ̄ whose B-points are the semistable-ordinary lifts of weight λ; Spec R^{△,λ}_ρ̄[1/p] is open and closed in Spec R^{st,λ}_ρ̄[1/p], so R^{△,λ}_ρ̄ is reduced.


### LocalGaloisDeformationRings:L7/g-valued-ordinary-condition (definition)

Let G be a split connected reductive group over 𝒪 (more generally smooth affine with split reductive G⁰) and T_G its canonical torus: T_G = B/R_u(B) for any Borel B ⊂ G, canonically independent of B (G(𝒪)-conjugacy of Borels and N_G(B) = B); fix B₀ ⊃ T₀ and identify T_G ×_𝒪 A with B₀/R_u(B₀) ×_𝒪 A. For v | p and cocharacters λ_τ : 𝔾_m → T_G (τ ∈ Hom_{ℚ_p}(F_v, E)), χ_λ : I_{F_v} → T_G(𝒪) is χ_λ(σ) = Π_τ λ_τ(τ(rec_v^{-1}(σ))), rec_v taking uniformisers to geometric Frobenius. For a finite local E-algebra A and finite F′_v/F_v, ρ : G_{F_v} → G(A) is F′_v-ordinary of weight λ if there is a Borel B ⊂ G_A with ρ(G_{F_v}) ⊂ B(A) such that, for g ∈ G(A) with gBg^{-1} = B₀, the composite G_{F_v} → B(A) → B₀(A) → T_G(A) equals χ_λ on I_{F′_v} (independent of g). For dominant regular λ this has p-adic Hodge type v_λ.

- API `TauCeti.GaloisDeformation.Local.canonicalTorus`: T_G = B/R_u(B), canonically independent of B.
- API `TauCeti.GaloisDeformation.Local.chiLambda`: χ_λ : I_{F_v} → T_G(𝒪) attached to cocharacters λ_τ.
- API `TauCeti.GaloisDeformation.Local.IsGOrdinary`: ρ : G_{F_v} → G(A) is F′_v-ordinary of weight λ.
- API `TauCeti.GaloisDeformation.Local.IsGOrdinary.gl`: For G = GL_n, IsGOrdinary is IsOrdinaryOfWeight of L7/ordinary-of-weight-lambda (with finite-order ambiguity absorbed by F′_v).
- API `TauCeti.GaloisDeformation.Local.IsGOrdinary.map`: Ordinarity is preserved by central isogenies G → G′ with the induced weight.
- Test `gOrdinary_torus` (degenerate): G = T a torus: B = T, T_G = T and ρ is F′_v-ordinary of weight λ iff ρ|I_{F′_v} = χ_λ.
- Test `gOrdinary_GL2` (compatibility): G = GL₂: agrees with L7/ordinary-of-weight-lambda for n = 2.
- Test `gOrdinary_GSp4` (computation): G = GSp₄, λ regular: ordinary means a stable symplectic full flag with graded characters (χ₁, χ₂, ε^{-1}χ₂^{-1}, ε^{-1}χ₁^{-1}) of the prescribed inertial weights (BCGP25 §1.8.10).
- Test `gOrdinary_not_residual` (non-example): The definition is for lifts to finite E-algebras; a residual ρ̄ with a stable Borel is not 'ordinary of weight λ' (χ_λ mod 𝔪 loses the weight).

### LocalGaloisDeformationRings:L7/g-valued-ordinary-quotient (construction)

Keep L7/g-valued-ordinary-condition and let R^{□,v_λ}_ρ̄ be the potentially semistable G-valued lifting ring of Hodge type v_λ (R08.3/g-valued-pst-rings) with universal lift ρ^λ. Let 𝒢 ⊂ Fl_G be the closed subscheme of Borels fixed by ρ^λ_A(G_{F_v}), and 𝒢_λ ⊂ 𝒢 the subfunctor of B such that, Zariski-locally with gBg^{-1} = B₀, the projection of gρ^λ(σ)g^{-1} to T_G equals χ_λ(σ) for σ ∈ I_{F′_v}. (1) 𝒢_λ is representable by a closed subscheme of 𝒢, cut out by the ideal generated by the c_{β,σ} (β positive roots, defined by c_{β,σ}X_β = p_β(Ad(gρ^λ(σ)g^{-1})X_β) − β(χ_λ(σ))X_β) together with ψ(t) − ψ(χ_λ(σ)) for ψ in a basis of X*(T₀) (the central generators). (2) R^{△λ}_ρ̄ is the scheme-theoretic image of 𝒢_λ[1/p] → Spec R^{□,v_λ}_ρ̄; Λ : 𝒢_λ → Spec R^{□,v_λ}_ρ̄ is proper, so Spec R^{△λ}_ρ̄[1/p] is its image. (3) A map f : R^{□,v_λ}_ρ̄ → A to a finite local E-algebra factors through R^{△λ}_ρ̄ iff f∘ρ^λ is F′_v-ordinary of weight λ. (4) A Borel-valued representation r : G_{F_v} → B₀(A) whose torus part equals χ_λ on I_{F′_v} is semistable over F′_v of p-adic Hodge type v_λ (Nekovář for GL_n, Patrikis for G).

- API `TauCeti.GaloisDeformation.Local.gOrdinaryFlagScheme`: 𝒢_λ ⊂ Fl_G ×_𝒪 Spec R^{□,v_λ}_ρ̄.
- API `TauCeti.GaloisDeformation.Local.gOrdinaryFlagScheme.isClosed`: 𝒢_λ is a closed subscheme, with the ideal of (1) including the central generators.
- API `TauCeti.GaloisDeformation.Local.gOrdinaryFlagScheme.proper`: 𝒢_λ → Spec R^{□,v_λ}_ρ̄ is proper.
- API `TauCeti.GaloisDeformation.Local.gOrdinaryRing`: R^{△λ}_ρ̄, the scheme-theoretic image of 𝒢_λ[1/p].
- API `TauCeti.GaloisDeformation.Local.gOrdinaryRing_points`: Point criterion (3).
- API `TauCeti.GaloisDeformation.Local.gOrdinaryRing.gl`: For G = GL_n, R^{△λ}_ρ̄ is the weight-λ specialisation of L7/ordinary-flag-scheme's image ring, intersected with the Hodge type v_λ.
- API `TauCeti.GaloisDeformation.Local.gOrdinaryFlagScheme.points`: Over a finite E-algebra in the specified semistable-over-F′_v Hodge family, a point is a framed lift and a Borel reduction satisfying the root and canonical-torus equations. Base change pulls back the Borel reduction and these equations; the torus equations are retained also when G has no roots.
- Test `gOrdinaryRing_GL1` (degenerate): G = GL₁: R^{△λ}_ρ̄ = R_ρ̄/(ρ(σ) − χ_λ(σ) : σ ∈ I_{F′_v}) up to the p-torsion-free generic fibre (R08.1/rank-one-ring).
- Test `gOrdinaryRing_central_generators` (non-example): In the ambient unrestricted framed GL₁ ring there are no root generators. The torus equations ρ(σ)=χ_λ(σ) on I_{F′_v} must be imposed explicitly. Whether they are redundant after a particular fixed Hodge/semistable quotient is a separate assertion.
- Test `gOrdinaryRing_points_GL2` (computation): For G=GL₂, F_v=ℚ_p and λ=(1,0), the stated ordinary point has the form (ψ₁χ_p *;0 ψ₂) in the FKP convention and is semistable over F′_v. A nonzero Tate-curve extension can have N≠0 and need not be crystalline.
- Test `gOrdinaryRing_compat` (compatibility): For G = GL_n and F′_v = F_v the points agree with those of L7/semistable-ordinary-quotient.

### LocalGaloisDeformationRings:L7/g-valued-ordinary-components (theorem)

Keep L7/g-valued-ordinary-quotient with λ dominant regular. R^{△λ}_ρ̄ is a union of irreducible components of R^{□,v_λ}_ρ̄; hence R^{△λ}_ρ̄[1/p] has an open dense regular subscheme and all its components have dimension dim G + [F_v:ℚ_p]·dim Fl_G. With a fixed multiplier μ : G_{F_v} → (G/G^der)(𝒪), the same holds with dim G^der in place of dim G.


### LocalGaloisDeformationRings:L7/snowden-ordinary-ring-trivial-residual (theorem)

Let p be odd, F_v/ℚ_p finite, ρ̄ : G_{F_v} → GL₂(k) trivial, ε_p trivial on G_{F_v} mod p, and R^△_v = R^{△,(0,0),ψ}_v the fixed-determinant (ψ = ε_p^{-1}) semistable-ordinary ring of weight 0 (L7/semistable-ordinary-quotient, R08.3/fixed-determinant-pst-rings). (1) Spec R^△_v is equidimensional of dimension [F_v:ℚ_p] + 4 with two irreducible components X^cr = Spec R^{△,cr}_v and X^st = Spec R^{△,st}_v: an E′-point factors through R^{△,cr}_v iff ρ_x is crystalline, and through R^{△,st}_v iff ρ_x is conjugate to (1 ∗; 0 ε_p^{-1}). (2) Each generic point of Spec(R^△_v/ϖ) is the specialisation of a unique generic point of Spec R^△_v.


### LocalGaloisDeformationRings:L7/ordinary-ring-with-frobenius-eigenvalue (construction)

Let p ≥ 3, n ≥ 2 and ρ̄|G_{ℚ_p} trivial (two-dimensional), with determinant χ^{n−1}. R̃† represents framed deformations ρ of ρ̄|G_p with determinant χ^{n−1} together with α ∈ A such that, writing φ := ρ(φ_p) and g := ρ(g): (1) det φ = 1; (2) α is a root of the characteristic polynomial of φ; (3) tr g = χ^{n−1}(g) + 1 for g ∈ I_p; (4) (g − 1)(g′ − 1) = (χ^{n−1}(g) − 1)(g′ − 1); (5) (g − 1)(φ − α) = (χ^{n−1}(g) − 1)(φ − α); (6) (φ − α)(g − 1) = (α^{-1} − α)(g − 1), for g, g′ ∈ I_p — the reduced 𝒪-flat ring of Kisin's ordinary lifts with an eigenvalue of Frobenius on the unramified quotient (Snowden's equations). R† is its image after forgetting α (the ordinary ring without the eigenvalue). R̃† is topologically generated over 𝒪 by φ₁, …, φ₄ (entries of ρ(φ_p) − 1), x_{ij} (entries of ρ(g_j) − 1) and β = α − 1, with β² − (φ₁ + φ₄)β − (φ₁ + φ₄) = 0. R^unr is the largest quotient of R† on which the deformation is unramified (R† modulo the entries of ρ(g) − 1, g ∈ I_p), R̃^unr = R̃† ⊗_{R†} R^unr, the unramified ideal is I = ker(R^univ → R^unr) and the doubling ideal is J = Ann_{R^univ}(R̃†/R†).

- API `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue`: R̃† with the universal pair (ρ, α) satisfying (1)–(6).
- API `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.forget`: R† → R̃†, forgetting α; R† is the image.
- API `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.beta_relation`: β² − (φ₁ + φ₄)β − (φ₁ + φ₄) = 0, α = 1 + β.
- API `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.unr`: R^unr and R̃^unr = R̃† ⊗_{R†} R^unr.
- API `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.unramifiedIdeal`: I = ker(R^univ → R^unr).
- API `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.doublingIdeal`: J = Ann_{R^univ}(R̃†/R†).
- API `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.hom_ext`: Two continuous maps R̃†→A are equal iff they induce the same framed lift ρ and the same eigenvalue α. Equality of ρ alone characterizes maps from the image ring R†, not maps from R̃†.
- Test `eigenvalueRing_unr_presentation` (computation): R^unr ≅ 𝒪/ϖ^m⟦φ₁, …, φ₄⟧/(φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃) and R̃^unr ≅ R^unr[β]/(β² − (φ₁ + φ₄)β − (φ₁ + φ₄)) ≅ R^unr ⊕ R^unr, with ϖ^m the largest power dividing all χ^{n−1}(g) − 1, g ∈ D_p. The direct sum is an isomorphism of R^unr-modules, not a product of rings.
- Test `eigenvalueRing_rank_two` (characterisation): The unramified quotient has a rank-two eigenvalue algebra as a module, while its support is killed by a power of ϖ. After inverting p, I=J becomes the unit ideal and R̃†[1/p]=R†[1/p]; the ordinary eigenvalue map is generically degree one.
- Test `eigenvalueRing_not_flag_free` (non-example): R† ≠ R̃†: the ring with an eigenvalue is not the image ring; their difference is measured by J.
- Test `eigenvalueRing_trace_relation` (computation): α + α^{-1} = 2 + φ₁ + φ₄ in R̃†.

### LocalGaloisDeformationRings:L7/eigenvalue-ring-normal-cm-type-three (theorem)

Keep L7/ordinary-ring-with-frobenius-eigenvalue. (1) R̃† is an integral domain, normal and Cohen–Macaulay of relative dimension 4 over 𝒪; R̃† ⊗ k is a normal Cohen–Macaulay domain of dimension 4, not Gorenstein, isomorphic to the completion of Snowden's variety B₁ at b = (1, 1; 0): A := k⟦a, b, c, φ₁, φ₂, φ₃, φ₄, β⟧/(φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃, β² − (φ₁ + φ₄)β − (φ₁ + φ₄), aφ₁ + bφ₃ − aβ, aφ₂ + bφ₄ − bβ, −aφ₃ + cφ₁ − cβ, aφ₄ − cφ₂ − aβ, a² + bc). (2) B := A/βA ≅ k⟦a, b, c, φ₁, φ₂, φ₃⟧/(−φ₁² − φ₂φ₃, aφ₁ + bφ₃, aφ₂ − bφ₁, −aφ₃ + cφ₁, −aφ₁ − cφ₂, a² + bc) is Cohen–Macaulay of dimension 3, isomorphic to the completion of its associated graded ring, with Hilbert series H_B(t) = 1 + 6t + 15t² + ⋯. (3) For an ideal I ⊂ B generated by three elements of degree one, the generators form a regular sequence iff H_{B/I}(t) = 1 + 3t. (4) {β, a, φ₂ + φ₃, b + c + φ₁} is a regular sequence in A with quotient C ≅ k[x, y, z]/(x, y, z)², H_C = 1 + 3t. (5) dim_k ω_{R̃†}/𝔪ω_{R̃†} = 3: R̃† is Cohen–Macaulay of type 3, in particular not Gorenstein.


### LocalGaloisDeformationRings:L7/gsp4-siegel-ordinary-condition (construction)

Let p > 2, a ≥ 2 and r̄ : G_{ℚ_p} → GSp₄(k) with multiplier ε̄^{−(a−1)} of the shape below with α, β ∈ k^× and (α² − 1)(β² − 1)(α²β² − 1)(α − β) ≠ 0. A lift r to R ∈ C_𝒪 satisfies the condition at p if r is GSp₄(R)-conjugate to the matrix with rows (χ_αψ^{-1}, 0, ∗, ∗), (0, χ_βψ^{-1}, ∗, ∗), (0, 0, ε^{−(a−1)}χ_β^{-1}ψ, 0), (0, 0, 0, ε^{−(a−1)}χ_α^{-1}ψ), with χ_α, χ_β unramified characters lifting λ(α), λ(β) and ψ unramified, trivial mod 𝔪_R. Equivalently, r stabilises an isotropic (Lagrangian) plane on which G_p acts through the sum of two unramified characters lifting λ(α), λ(β), and acts on the quotient through ε^{−(a−1)} times the dual characters. Its tangent space: with b⁰ ⊂ g⁰ = ad⁰r̄ the Borel of Sp₄ and u ⊂ b⁰ the 3-dimensional unipotent radical of the Siegel parabolic (upper-right 2 × 2 block), L′_p = ker(H¹(G_p, b⁰) → H¹(I_p, b⁰/u)) and L_p = image of L′_p in H¹(G_p, g⁰).

- API `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary`: The local deformation problem of Siegel-ordinary lifts with multiplier ε^{−(a−1)}.
- API `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary.plane`: The stable unramified Lagrangian plane of a lift in the condition.
- API `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary.plane_unique`: Under the genericity condition the plane is unique and lifts the residual one.
- API `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary.tangent`: The tangent space of the condition is L_p ⊂ H¹(G_p, ad⁰r̄).
- API `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary.isOrdinary`: Every lift in the condition is G-ordinary of the corresponding (non-regular) weight in the sense of L7/g-valued-ordinary-condition with the Siegel parabolic.
- API `TauCeti.GaloisDeformation.Local.SiegelOrdinary.baseChange`: Along a coefficient map, the Galois-stable unramified Lagrangian direct summand pulls back to the corresponding plane; isotropy, its rank and the fixed multiplier are preserved. Under the stated uniqueness hypothesis this is the plane assigned to the pulled-back lift.
- Test `siegelOrdinary_u_dim` (computation): dim u = 3 (root spaces (1,4), (2,3) and (1,3) ~ (2,4) in sp₄).
- Test `siegelOrdinary_not_borel_ordinary` (non-example): A ramified nonsplit extension of the two prescribed unramified characters on the Lagrangian quotient plane is not Siegel ordinary: the quotient-plane inertia action is nontrivial. A nonzero upper matrix entry alone is insufficient, since an unramified extension may be split by conjugation.
- Test `siegelOrdinary_residual` (degenerate): For R = k the condition is the residual shape itself.
- Test `siegelOrdinary_multiplier` (computation): Every lift in the condition has multiplier ε^{−(a−1)}: (χ_αψ^{-1})(ε^{−(a−1)}χ_α^{-1}ψ) = ε^{−(a−1)}.

### LocalGaloisDeformationRings:L7/gsp4-siegel-ordinary-tangent (theorem)

Keep L7/gsp4-siegel-ordinary-condition. (1) b⁰/u ≅ 1 ⊕ 1 ⊕ λ(α)λ(β)^{-1} as k[G_p]-modules, u ≅ λ(α²)ε̄^{a−1} ⊕ λ(β²)ε̄^{a−1} ⊕ λ(αβ)ε̄^{a−1}, and h⁰(G_p, g⁰/b⁰) = 0; hence h⁰(G_p, u) = h²(G_p, u) = 0, h¹(G_p, u) = 3, H¹(G_p, b⁰) ↠ H¹(G_p, b⁰/u) and H¹(G_p, b⁰) ↪ H¹(G_p, g⁰). (2) dim_k L_p − dim_k H⁰(G_p, ad⁰r̄) = 3. (3) The condition at p is equivalent to r|G_p being ordinary of fixed weight; for a = 2 it is equivalent to finite flatness of r^∨ ≅ r ⊗ ε.


### LocalGaloisDeformationRings:L7/gsp4-borel-ordinary-conditions (construction)

Assume p > 2 and F_v = ℚ_p. For x ∈ k^×, λ_x is the unramified character with λ_x(Frob) = x. ρ̄|G_{F_v} is p-distinguished weight 2 ordinary if it is conjugate to the matrix with rows (λ_{ᾱ}, 0, ∗, ∗), (0, λ_{β̄}, ∗, ∗), (0, 0, ε̄^{-1}λ_{β̄}^{-1}, 0), (0, 0, 0, ε̄^{-1}λ_{ᾱ}^{-1}) with ᾱ ≠ β̄; a lift is p-distinguished weight 2 ordinary if it is conjugate to the same shape with λ_α, λ_β lifting λ_{ᾱ}, λ_{β̄} (such lifts are semistable, not necessarily crystalline). With 𝔠̄ ∈ {ᾱ, β̄} and the weight algebras Λ_{v,2} = 𝒪⟦(1 + pℤ_p)²⟧ and Λ_{v,1} = 𝒪⟦1 + pℤ_p⟧, 𝒟^{B,𝔠̄}_v (over Λ_{v,2}) is the problem of lifts conjugate to a Borel-upper-triangular form with diagonal characters whose inertial restrictions are the universal characters and with the first character lifting λ_{𝔠̄}; 𝒟^P_v (over Λ_{v,1}) the analogous Siegel-parabolic problem. They are represented by R^{B,𝔠̄}_v and R^P_v; their B- and P-framed variants R^{B,◹}, R^{P,◹} (framed for the Borel resp. parabolic) are defined so that R^B and R^P are formally smooth over them.

- API `TauCeti.GaloisDeformation.Local.GSp4.IsPDistinguishedOrdinary`: The residual and lifted p-distinguished weight-2 ordinary shapes.
- API `TauCeti.GaloisDeformation.Local.GSp4.BorelOrdinary`: 𝒟^{B,𝔠̄}_v over Λ_{v,2}, represented by R^{B,𝔠̄}_v.
- API `TauCeti.GaloisDeformation.Local.GSp4.ParabolicOrdinary`: 𝒟^P_v over Λ_{v,1}, represented by R^P_v.
- API `TauCeti.GaloisDeformation.Local.GSp4.partiallyFramed`: R^B and R^P are formally smooth over the B- and P-framed rings R^{B,◹}, R^{P,◹} (BCGP21 Lemma 7.3.12).
- API `TauCeti.GaloisDeformation.Local.GSp4.BorelOrdinary.semistable`: At the specified weight-two arithmetic specialization, the source’s ordinary finite-flat flag criterion gives a semistable lift. Arbitrary variable-weight points are not asserted semistable.
- API `TauCeti.GaloisDeformation.Local.BorelOrdinary.toParabolic`: Forgetting the appropriate steps of the ordinary full flag and restricting its weight characters to Λ_{v,1} gives a parabolic-ordinary point. The induced map of representing rings follows the opposite direction and commutes with universal representations.
- Test `gsp4BorelOrdinary_weightAlgebra` (computation): Λ_{v,2} = 𝒪⟦(1 + pℤ_p)²⟧ ≅ 𝒪⟦x₁, x₂⟧ for p > 2.
- Test `gsp4BorelOrdinary_not_distinguished` (non-example): ᾱ = β̄ is excluded: the residual Lagrangian plane then carries a two-dimensional unramified isotypic piece and the flag is not unique.
- Test `gsp4BorelOrdinary_semistable_not_crystalline` (characterisation): When α² = 1, the rank-two subquotient on the first and fourth basis vectors may be the non-split extension of ε^{-1}λ_α^{-1} by λ_α given by the Kummer class of p in H¹(ℚ_p, E(ε)) = H¹(ℚ_p, E(ελ_α²)); such a lift is p-distinguished weight-2 ordinary and semistable but not crystalline, so the condition is not the crystalline condition.
- Test `gsp4BorelOrdinary_closed_immersion` (compatibility): For p-distinguished ρ̄ the flag-incidence map of L7/gsp4-ordinary-flag-incidence is a closed immersion with image R^{B,𝔠̄}_v.

### LocalGaloisDeformationRings:L7/gsp4-ordinary-generic-fibres (theorem)

Keep L7/gsp4-borel-ordinary-conditions (p > 2, F_v = ℚ_p, ρ̄ p-distinguished weight 2 ordinary). (1) R^{B,𝔠̄}_v[1/p] and R^P_v[1/p] are irreducible, of relative dimensions 16 and 14 over ℚ_p. (2) R^{P,univ} and R^P are complete intersections, connected in characteristic zero, with non-smooth locus in characteristic zero of codimension at least two; R^{P,univ}[1/p] and R^P[1/p] are irreducible of dimensions 15 and 14. (3) The P-framed ring R^{P,univ,◹} is a completed tensor product of GL₂ ordinary rings for the three two-dimensional subquotients (Lemma 7.3.15). (4) H²(ℚ_p, ad⁰_B ρ̄) is non-zero only in the cases listed in Lemma 7.3.14 (explicit in terms of ᾱ, β̄ and the extension classes η_δ). (5) A pure closed point of R^{B,𝔠̄}_v[1/p] or R^P_v[1/p] is smooth.


### LocalGaloisDeformationRings:L7/gl2-borel-ordinary-ring (theorem)

Let p > 2 and r̄ = (λ_ᾱ ∗; 0 ε̄^{-1}λ_ᾱ^{-1}) : G_{ℚ_p} → GL₂(k), written with extension class η_{α²} ∈ H¹(ℚ_p, ε̄λ_{ᾱ²}); let Λ = 𝒪⟦1 + pℤ_p⟧ with canonical character θ : I_{ℚ_p} → Λ^× (through Art^{-1}). A lift r over A ∈ CNL_Λ is ordinary if it is ker(GL₂(A) → GL₂(k))-conjugate to (χ ∗; 0 ε^{-1}χ^{-1}) with χ̄ = λ_ᾱ and χ|_{I_{ℚ_p}} = θ; this local deformation problem is represented by R^{B₂}. (1) h²(ℚ_p, ad⁰_{B₂}r̄) = 0 unless ᾱ² = 1 and η_{α²} = 0, in which case it equals 1. (2) R^{B₂}[1/p] is irreducible of relative dimension 5 over ℚ_p; when h² = 0, R^{B₂} is formally smooth over 𝒪 of relative dimension 5. (3) The B₂-framed fixed-determinant ring R^{B₂,◹} has an explicit presentation over the universal deformation ring R^{GL₁} = 𝒪⟦y₁, y₂⟧ of λ_ᾱ (Lemma 7.3.7), and R^{B₂,□} is formally smooth over R^{B₂,◹} of relative dimension 1. (4) The points of R^{B₂}[1/p] that are not smooth over Λ are, up to unramified twist, crystalline extensions of ε^{-1} by 1.


### LocalGaloisDeformationRings:L7/gsp4-ordinary-flag-incidence (construction)

Let v | p with F_v = ℚ_p (any p, including p = 2), ρ̄ : G_{F_v} → GSp₄(k) ordinary with a fixed p-stabilisation (χ̄₁, χ̄₂) and multiplier ε̄^{-1}. Λ_{GSp₄,v} = 𝒪⟦(𝒪_{F_v}^×(p))²⟧ with characters θ_i : I_{F_v} → Λ^× (the i-th copy through Art^{-1}); for p > 2, Λ_{GSp₄,v} ≅ 𝒪⟦x₁, x₂⟧, for p = 2 Spec Λ_{GSp₄,v} has four components with regular generic fibre. Λ̃_{GSp₄,v} = 𝒪⟦Gal(F_v^{ab}/F_v)(p)²⟧ carries universal characters (χ̃₁, χ̃₂) lifting (χ̄₁, χ̄₂). With 𝓕 the flag variety of full symplectic flags (Fil_i^⊥ = Fil_{4−i}) and R_v the fixed-multiplier lifting ring over Λ̃, 𝒢_v ⊂ 𝓕 ×_𝒪 Spec R_v is the closed subscheme of pairs (Fil_•, R_v → A) with Fil_• stable and G_{F_v} acting on the graded pieces by χ̃₁, χ̃₂, ε^{-1}χ̃₂^{-1}, ε^{-1}χ̃₁^{-1}. R^△_v := im(R_v → 𝒪_{𝒢_v}(𝒢_v)), so Spec R^△_v is the scheme-theoretic image of 𝒢_v → Spec R_v (p-torsion is not removed). (1) The 𝒪_{E′}-points of Spf R^△_v are exactly the lifts that are ordinary with p-stabilisation (χ̃₁, χ̃₂). (2) If ρ̄ is residually p-distinguished (the four characters pairwise distinct), the flag is unique and 𝒢_v → Spec R_v is a closed immersion. (3) At a characteristic-zero flagged point x, Fil^i ad⁰ρ_x (symplectic endomorphisms lowering the flag by i) has dimensions 6, 4, 2, 1, 0 for i = 0, …, 4.

- API `TauCeti.GaloisDeformation.Local.GSp4.weightAlgebra`: Λ_{GSp₄,v} and Λ̃_{GSp₄,v} with their universal characters.
- API `TauCeti.GaloisDeformation.Local.GSp4.ordinaryFlagScheme`: 𝒢_v ⊂ 𝓕 ×_𝒪 Spec R_v.
- API `TauCeti.GaloisDeformation.Local.GSp4.ordinaryFlagScheme_proper`: 𝒢_v → Spec R_v is proper.
- API `TauCeti.GaloisDeformation.Local.GSp4.ordinaryImage`: R^△_v, the scheme-theoretic image (no flat closure).
- API `TauCeti.GaloisDeformation.Local.GSp4.ordinaryImage_points`: 𝒪_{E′}-points of Spf R^△_v are the ordinary lifts with the given p-stabilisation.
- API `TauCeti.GaloisDeformation.Local.GSp4.ordinaryFlagScheme_closedImmersion`: Residually p-distinguished ⟹ 𝒢_v → Spec R_v is a closed immersion.
- API `TauCeti.GaloisDeformation.Local.GSp4.ordinaryFlagScheme.points`: A coefficient point consists of a fixed-similitude framed lift, an isotropic stable full flag and the ordered universal weight characters of its graded lines. This description and the incidence equations commute with coefficient base change.
- Test `gsp4Flag_weightAlgebra_p2` (computation): p = 2: Spec Λ_{GSp₄,v} has 4 irreducible components (from (ℤ/2)² ⊂ (ℤ₂^×)²) and regular generic fibre.
- Test `gsp4Flag_filtration_dims` (computation): dim Fil^i ad⁰ρ_x = 6, 4, 2, 1, 0 for i = 0, …, 4.
- Test `gsp4Flag_no_flat_closure` (non-example): R^△_v may have p-torsion; replacing it by its flat closure changes the ring when 𝒢_v is not 𝒪-flat.
- Test `gsp4Flag_distinguished` (compatibility): For residually p-distinguished ρ̄, R^△_v is the ring of L7/gsp4-borel-ordinary-conditions.

### LocalGaloisDeformationRings:L7/gsp4-ordinary-regularity (theorem)

Keep L7/gsp4-ordinary-flag-incidence and let x be a closed point of 𝒢_v[1/p] with ρ_x. (1) If H²(G_{F_v}, Fil⁰ad⁰ρ_x) = 0, then x is a regular point of 𝒢_v[1/p], on a unique irreducible component, of dimension 16; and H²(G_{F_v}, Fil⁰ad⁰ρ_x) = 0 iff H⁰(G_{F_v}, (ad⁰ρ_x/Fil¹ad⁰ρ_x)(1)) = 0. (2) The conditions of (1) hold if (a) none of the specialisations at x of χ̃₁²ε, χ̃₂²ε, χ̃₁χ̃₂ε, χ̃₁χ̃₂^{-1} equals ε; or (b) ρ_x is pure and p-distinguished; or (c) ρ_x is pure and potentially crystalline. (3) If ρ_x is p-distinguished and (1) holds, the image of x in Spec R^△_v is a regular point on a unique irreducible component of relative 𝒪-dimension 16.


### LocalGaloisDeformationRings:L7/gsp4-ordinary-weight-two-components (theorem)

Keep L7/gsp4-ordinary-flag-incidence with p > 2. (1) If (ρ̄ ⊗ ε̄)|G_{F_v} is finite flat, then all ordinary pure weight-two crystalline lifts lie on a single irreducible component of Spec R^△_v, each on a unique component, of relative 𝒪-dimension 16. (2) If a component R^△_v/Q dominates Spec Λ_{GSp₄,v}, some minimal prime of the special fibre contains Q and no other minimal prime of R^△_v; this component has relative 𝒪-dimension 16. No claim is made that every component dominates Λ.


### LocalGaloisDeformationRings:L7/connects-relation (definition)

Let K/ℚ_l be finite (l = p) and ρ₁, ρ₂ : G_K → GL_n(𝒪_{ℚ̄_l}) continuous. ρ₁ connects to ρ₂ (ρ₁ ∼ ρ₂) if: the reductions ρ̄₁, ρ̄₂ are equivalent; ρ₁, ρ₂ are potentially crystalline; HT_τ(ρ₁) = HT_τ(ρ₂) for every τ : K ↪ ℚ̄_l; and ρ₁, ρ₂ define points on the same irreducible component of Spec(R^□_{ρ̄₁,{HT_τ},K′-cris} ⊗ ℚ̄_l) for some (hence all) sufficiently large K′. For l ≠ p the analogue uses Spec(R^□_{ρ̄₁} ⊗ ℚ̄_l). ρ₁ strongly connects to ρ₂ if moreover ρ₁ lies on a unique component.

- API `TauCeti.GaloisDeformation.Local.Connects`: ρ₁ ∼ ρ₂: same reduction, potentially crystalline with the same labelled Hodge–Tate weights, same component of the potentially crystalline lifting ring over ℚ̄_l.
- API `TauCeti.GaloisDeformation.Local.Connects.symm`: ρ₁ ∼ ρ₂ ⟹ ρ₂ ∼ ρ₁.
- API `TauCeti.GaloisDeformation.Local.Connects.restrict`: ρ₁ ∼ ρ₂ ⟹ ρ₁|G_{K′} ∼ ρ₂|G_{K′} for K′/K finite.
- API `TauCeti.GaloisDeformation.Local.Connects.sum_tensor_dual`: ∼ is compatible with direct sums, tensor products, duals, and twists by unramified characters with trivial reduction.
- API `TauCeti.GaloisDeformation.Local.Connects.symPow`: ∼ is compatible with Sym^{n−1} (components of these generic fibres are connected components and Sym^{n−1} induces a morphism of generic fibres).
- API `TauCeti.GaloisDeformation.Local.Connects.trans_of_smooth`: On points lying on unique components, ∼ is transitive.
- Test `connects_rank_one` (computation): n = 1: ψ₁ ∼ ψ₂ iff ψ̄₁ = ψ̄₂ and HT(ψ₁) = HT(ψ₂) (crystalline characters).
- Test `connects_ordinary_trivial` (characterisation): Two ordinary crystalline weight-0 lifts of the trivial representation connect (L7/weight-zero-crystalline-connectedness).
- Test `connects_different_weights` (non-example): Lifts with different labelled Hodge–Tate weights never connect, even if their reductions agree.
- Test `connects_restrict` (compatibility): ρ₁ ∼ ρ₂ implies ρ₁|G_{K′} ∼ ρ₂|G_{K′}.

### LocalGaloisDeformationRings:L7/weight-zero-crystalline-connectedness (theorem)

Let K/ℚ_p be finite. (1) Two ordinary crystalline weight-0 representations ρ₁, ρ₂ of G_K with ρ̄₁ = ρ̄₂ trivial connect: ρ₁ ∼ ρ₂ (the ordinary weight-0 crystalline lifting ring of the trivial representation is irreducible). (2) For ρ : G_K → GL_n(ℤ̄_p) crystalline of weight 0 there is c = c(K, ρ, n) such that every crystalline weight-0 t with t ≡ ρ mod p^c satisfies t ∼ ρ. (3) A crystalline representation of G_K with parallel Hodge–Tate weights {0, …, n − 1} is ordinary iff the roots of its Frobenius characteristic polynomial (on D_cris, φ^f with f the residue degree) have valuations 0, f, …, (n − 1)f. (4) Symmetric powers and tensor products of crystalline ordinary representations are crystalline ordinary.


### LocalGaloisDeformationRings:L7/local-model-rho-nm0 (construction)

Let p > nm, ε₂, ε′₂ : G_{ℚ_{p²}} → ℤ̄_p^× the two Lubin–Tate characters trivial on Art_{ℚ_{p²}}(p) (so ε₂ε′₂ = ε^{-1}), and ρ_{n,m,0} = ⊕_{i=1}^n ε₂^{m(n−i)}(ε′₂)^{m(i−1)} : G_{ℚ_{p²}} → GL_n(ℤ̄_p), crystalline with Hodge–Tate weights {0, m, …, (n − 1)m} at each embedding (Fontaine–Laffaille since p > nm); ρ₀ = ρ_{n,1,0} has weight 0. (1) Sym^{n−1}ρ_{2,m,0} ≅ ρ_{n,m,0} and ρ_{n,m,0} ⊗ ρ_{m,1,0} ≅ ρ_{nm,1,0}. (2) If K₀/ℚ_{p²} is unramified and ρ : G_{K₀} → GL_n(ℤ̄_p) is crystalline with Hodge–Tate weights {0, m, …, (n − 1)m} and ρ̄|I_{K₀} = ρ̄_{n,m,0}|I_{K₀}, then ρ̄|G_{K₁} = ρ̄_{n,m,0}|G_{K₁} for some finite unramified K₁/K₀, and ρ|G_K ∼ ρ_{n,m,0}|G_K for every finite K/K₀ with ρ̄|G_K = ρ̄_{n,m,0}|G_K.

- API `TauCeti.GaloisDeformation.Local.rhoNM0`: ρ_{n,m,0} = ⊕ ε₂^{m(n−i)}(ε′₂)^{m(i−1)}.
- API `TauCeti.GaloisDeformation.Local.rhoNM0.hodgeTate`: HT_τ(ρ_{n,m,0}) = {0, m, …, (n − 1)m} for each τ.
- API `TauCeti.GaloisDeformation.Local.rhoNM0.symPow`: Sym^{n−1}ρ_{2,m,0} ≅ ρ_{n,m,0}.
- API `TauCeti.GaloisDeformation.Local.rhoNM0.tensor`: ρ_{n,m,0} ⊗ ρ_{m,1,0} ≅ ρ_{nm,1,0}.
- API `TauCeti.GaloisDeformation.Local.rhoNM0.connects`: Crystalline lifts of ρ̄_{n,m,0} with the same weights connect to ρ_{n,m,0} after an unramified extension.
- API `TauCeti.GaloisDeformation.Local.rhoNM0.rank_one`: For n=1 the sole summand has exponents zero, so ρ_{1,m,0} is the trivial character for every allowed m.
- Test `rhoNM0_n1` (degenerate): n = 1: ρ_{1,m,0} is the trivial character.
- Test `rhoNM0_det` (computation): det ρ_{2,1,0} = ε₂ε′₂ = ε^{-1}.
- Test `rhoNM0_weights` (computation): ρ_{3,2,0} has Hodge–Tate weights {0, 2, 4} at each embedding.
- Test `rhoNM0_needs_p_large` (non-example): The bound p>nm supplies the uniform FL range for the tensor weights. If p≤nm that hypothesis is unavailable; this does not imply that every individual weight multiset is outside the FL interval.

### LocalGaloisDeformationRings:L7/kisin-modules-tame-descent (construction)

Let K/ℚ_p be unramified of degree f, τ a tame inertial type with lowest alcove presentation (s, μ), L′/K the tame extension of degree e′ = p^{f′} − 1 (f′ = f or 3f by the orientation of α_{(s,μ)}), Δ = Gal(L′/K), 𝔖_{L′,R} = (W(k′) ⊗ R)⟦v⟧ with its Δ-action and Frobenius, and h ≥ 0. Y^{[0,h],τ}(R) is the groupoid of Kisin modules 𝔐 over 𝔖_{L′,R} of rank 3 and E(v)-height in [0, h] with a semilinear Δ-action of type τ (Definition 3.1.3). An eigenbasis of 𝔐 (Definition 3.1.6) is a basis of each isotypic piece compatible with the descent datum; in such bases the partial Frobenii have matrices A^{(j)} ∈ GL₃(R((v))). The shape w̃(ρ̄, τ) ∈ W̃^∨ (Definition 3.3.1–3.3.2) records the Iwahori double coset of the matrices A^{(j)} of the Kisin module of type (η, τ) attached to ρ̄ (unique by LLHLM18 Theorem 3.2). The étale φ-module 𝓜 = (𝔐 ⊗ 𝒪_{ℰ,L′})^{Δ=1} and T*_dd : Y^{[0,h],τ}(R) → Rep_R(G_{K_∞}) connect Kisin modules to Galois representations.

- API `TauCeti.GaloisDeformation.Local.KisinModuleDescent`: Y^{[0,h],τ}(R): Kisin modules with tame descent datum of type τ.
- API `TauCeti.GaloisDeformation.Local.KisinModuleDescent.eigenbasis`: An eigenbasis and the partial Frobenius matrices A^{(j)}.
- API `TauCeti.GaloisDeformation.Local.KisinModuleDescent.shape`: The shape w̃(ρ̄, τ) ∈ W̃^∨.
- API `TauCeti.GaloisDeformation.Local.KisinModuleDescent.etalePhiModule`: 𝔐 ↦ 𝓜 = (𝔐 ⊗ 𝒪_{ℰ,L′})^{Δ=1} and T*_dd.
- API `TauCeti.GaloisDeformation.Local.KisinModuleDescent.unique`: For 3-generic τ the Kisin module of type (η, τ) of ρ̄ is unique.
- Test `kisinDescent_trivialType` (degenerate): τ trivial: descent data are trivial.
- Test `kisinDescent_shape_identity` (computation): For ρ̄ = T*_dd of the semisimple Kisin module of shape t_1 (identity), w̃(ρ̄, τ) = t_1.
- Test `kisinDescent_shape_admissible` (characterisation): w̃(ρ̄, τ) lies in Adm^∨(η) whenever ρ̄ has a potentially crystalline lift of type (η, τ) (Theorem 3.3.11).
- Test `kisinDescent_nongeneric_not_empty` (non-example): Without 1-generic τ, Theorem 3.5.3 does not apply; it does not imply that the ring is zero. The trivial residual representation has a trivial-type, weight-zero crystalline lift, a concrete nonzero nongeneric case.

### LocalGaloisDeformationRings:L7/semisimple-kisin-modules-and-shapes (theorem)

Keep L7/kisin-modules-tame-descent (GL₃, K/ℚ_p unramified). (1) A semisimple Kisin module of shape w̃ (Definition 3.3.4) gives a semisimple G_{K_∞}-representation, with the explicit normal form of Proposition 3.3.6 and étale φ-module 𝓜(w̃) (Definition 3.3.7); T*_dd of it and its inertial type are given by Proposition 3.3.8. (2) Semisimple Kisin modules of a fixed shape and inertial restriction are classified (Proposition 3.3.9). (3) If ρ̄ has a potentially crystalline lift of type (η, τ), then so does ρ̄^ss (Lemma 3.3.10). (4) (Theorem 3.3.11) If ρ̄ has a potentially crystalline lift of type (η, τ) with either τ a regular principal-series type and general effective λ, or λ=η and τ 3-generic, as in Theorem 3.3.11, its Kisin module has shape in Adm^∨(η). (5) (Theorem 3.3.12) Sums of characters admit semisimple Kisin modules, and the Kisin module of type (η, τ) of a semisimple ρ̄ is semisimple.


### LocalGaloisDeformationRings:L7/gl3-pcris-deformation-rings (theorem)

Let K/ℚ_p be unramified of degree f, ρ̄ : G_K → GL₃(F) continuous, 10-generic and semisimple, τ a tame inertial type, and R^τ_ρ̄ the framed potentially crystalline deformation ring of type (η, τ) with η = (2, 1, 0) (R08.3/pst-deformation-ring). If τ is not 1-generic, R^τ_ρ̄ = 0. If τ is 1-generic and R^τ_ρ̄≠0: R^τ_ρ̄ is a normal Cohen–Macaulay domain; R̄^τ_ρ̄ := R^τ_ρ̄/ϖ is reduced, its irreducible components are formally smooth of the same dimension, and their number equals #W^?(ρ̄, τ) (the predicted Serre weights in the Jordan–Hölder factors of σ(τ)). For shapes w̃_j of length > 1 at every j (τ 5-generic), the same holds with R^τ_ρ̄ ≠ 0 (Lemma 3.5.4).


### LocalGaloisDeformationRings:L7/gl3-explicit-rings (construction)

Keep L7/kisin-modules-tame-descent. For a Kisin module 𝔐̄ over F of shape w̃ = (w̃_i), the groupoids Φ-Mod^ét_{ℳ̄}, Φ-Mod^{ét,□}_{ℳ̄}, Ȳ^{η,τ}_{𝔐̄} and D̄^{τ,β̄}_{𝔐̄} (deformations with a gauge basis) fit into a canonical diagram (3.9) relating R̄^τ_ρ̄, the explicit rings and étale φ-modules; D̄^{τ,β̄}_{𝔐̄} is representable (LLHLM18 Theorems 4.17, 6.12) and the torus quotient gives Ȳ. The explicit ring R̄^{expl,∇}_{𝔐̄,w̃_i} is defined case by case: for ℓ(w̃_i) > 1, for ℓ(w̃_i) = 1 (shape α) and for ℓ(w̃_i) = 0 (identity shape), as the quotient of the coordinate ring of the universal partial Frobenius matrix A^{(i)} by the monodromy (∇) condition; R̄^τ_ρ̄ is formally smooth over ⊗̂_i R̄^{expl,∇}_{𝔐̄,w̃_i}. The map ι′_τ in (3.9) is a monomorphism (Proposition 3.6.3), and there are bijections Irr(R̄^τ_ρ̄) ↔ Π_i Irr(R̄^{expl,∇}_{w̃_i}).

- API `TauCeti.GaloisDeformation.Local.GL3.explicitRing`: R̄^{expl,∇}_{𝔐̄,w̃} for each shape w̃ (three cases by length).
- API `TauCeti.GaloisDeformation.Local.GL3.comparisonDiagram`: The diagram (3.9) relating R̄^τ_ρ̄, explicit rings and étale φ-modules.
- API `TauCeti.GaloisDeformation.Local.GL3.iotaPrime_mono`: ι′_τ is a monomorphism.
- API `TauCeti.GaloisDeformation.Local.GL3.formallySmooth_over_explicit`: R̄^τ_ρ̄ is formally smooth over ⊗̂_i R̄^{expl,∇}_{𝔐̄,w̃_i}.
- API `TauCeti.GaloisDeformation.Local.GL3.irr_bijection`: Irr(R̄^τ_ρ̄) ↔ Π_i Irr(R̄^{expl,∇}_{w̃_i}).
- Test `gl3Explicit_identity_components` (computation): For the identity shape the explicit ring has 6 minimal primes (Table 3, row id).
- Test `gl3Explicit_alpha_components` (computation): For shape α the explicit ring has 6 minimal primes (Table 3, row α).
- Test `gl3Explicit_long_shape` (degenerate): For ℓ(w̃_i) > 1 the explicit ring is formally smooth over R_N.
- Test `gl3Explicit_not_epi` (non-example): ι′_τ is a monomorphism but not an isomorphism onto Φ-Mod^{ét,□}: étale φ-modules not coming from Kisin modules of type (η, τ) are not in the image.

### LocalGaloisDeformationRings:L7/gl3-component-labelling (theorem)

Keep L7/gl3-pcris-deformation-rings with ρ̄ 10-generic. (1) (Proposition 3.6.1) There is a unique assignment σ ↦ 𝔭(σ) from W^?(ρ̄) to minimal primes of the special fibres such that the components of R̄^τ_ρ̄ are exactly the 𝔭(σ) with σ ∈ W^?(ρ̄, τ) (a geometric Breuil–Mézard statement). (2) (Theorem 3.6.4) Via the bijections of L7/gl3-explicit-rings, the component of σ is given explicitly by Table 3 (each shape row lists the chart, its relations and the components c_{(ε,i)} and intersections 𝔴). (3) (Lemma 3.6.6, Corollary 3.6.7) Components for different types τ, τ′ match iff the partial Frobenius matrices agree after normalising gauge bases. (4) (Proposition 3.6.9) Minimal types and the element z̃* determine the labelling; (Lemma 3.6.10) the symmetric difference of chosen variables equals twice the graph distance.


### LocalGaloisDeformationRings:L7/partition-monodromy-rings (construction)

Let v ∤ l (l = p the coefficient prime), q_v ≡ 1 mod l, r̄|G_{L_ṽ} trivial of dimension n, and R^1_v the ring of lifts with char ρ(σ) = (X − 1)^n for σ ∈ I_{L_ṽ}. For a partition m = (m₁ ≥ ⋯ ≥ m_k) of n, R^m_v is the maximal 𝒪-flat reduced quotient of R^1_v classifying lifts for which a lift of Frob_ṽ^{-1} has characteristic polynomial in Taylor's scheme Pol_n(m, q_v) (the polynomials whose roots can be grouped into chains α, q_vα, …, q_v^{m_i−1}α). For m = (n), R^m_v = R^St_v (R08.2/steinberg-condition); for m = (1, …, 1), R^m_v = R^1_v. A local deformation problem is determined by its ring (BLGHT Lemma 3.2).

- API `TauCeti.GaloisDeformation.Local.partitionRing`: R^m_v for a partition m of n.
- API `TauCeti.GaloisDeformation.Local.partitionRing_points`: ℚ̄_l-points of R^m_v are the unipotently ramified lifts whose Frobenius characteristic polynomial lies in Pol_n(m, q_v).
- API `TauCeti.GaloisDeformation.Local.partitionRing_steinberg`: R^{(n)}_v = R^St_v.
- API `TauCeti.GaloisDeformation.Local.partitionRing_trivial`: R^{(1,…,1)}_v = R^1_v.
- API `TauCeti.GaloisDeformation.Local.partitionRing_mono`: If m is obtained by splitting the parts of m′ into shorter consecutive q-chains, Pol_n(m′,q)⊂Pol_n(m,q), giving R^m_v↠R^{m′}_v. Dominance of partitions alone does not imply this inclusion.
- API `TauCeti.GaloisDeformation.Local.partitionRing.coefficientMap`: Composing a framed lift with a coefficient map preserves unipotent inertia and the defining Frobenius q-chain equations. A point of the reduced flat quotient R^m_v therefore pulls back as a point of that same quotient; no bound on the rank of N is inferred.
- Test `partitionRing_steinberg` (compatibility): m = (n) gives R^St_v of R08.2/steinberg-condition.
- Test `partitionRing_trivial` (degenerate): m = (1, …, 1) gives R^1_v.
- Test `partitionRing_n2` (computation): n = 2, m = (2): the defining equation q_v(tr Φ)² = (1 + q_v)² det Φ.
- Test `partitionRing_not_scalar` (non-example): R^m_v for m = (2, 1) is not the ring of lifts with scalar inertial semisimplification: it also constrains the Frobenius eigenvalues to contain a chain α, q_vα.
- Test `partitionRing_dominance_insufficient` (non-example): The roots {1,q,q²,b} for generic b form chains of lengths (3,1), but cannot be grouped into two chains of length 2. Thus dominance (3,1)≥(2,2) does not give the proposed quotient map.

### LocalGaloisDeformationRings:L7/partition-ring-smooth-points (theorem)

Keep L7/partition-monodromy-rings. Let x ∈ Spec R^m_v[1/l] be a closed point given by ρ : G_{L_ṽ} → GL_n(𝒪) with ρ ⊗ ℚ̄_l pure (Taylor–Yoshida, Lemma 1.4). Then Spec R^1_v[1/l] is formally smooth over K at x, there is a unique minimal prime Q_v of R^1_v in the kernel of R^1_v → 𝒪, and Q_v contains ker(R^1_v → R^m_v).


### LocalGaloisDeformationRings:L7/away-from-p-rank-n-interface (comparison)

L7's rank-n semistable, Steinberg and minimally ramified conditions away from p are those of R08.2, cited and not rebuilt (RS-08 link R08.2 → L7): (1) minimally ramified lifts in rank n (R08.2/minimally-ramified-condition, R08.2/minimally-ramified-ring), which equal the unipotent lifts when r̄(σ) is a single Jordan block (R08.2/regular-unipotent-minimally-ramified); (2) Steinberg lifts with monodromy (R08.2/steinberg-condition, R08.2/steinberg-ring-domain) and their generalisations with Frobenius characteristic polynomial constrained by q-chains of a partition (L7/partition-monodromy-rings); (3) fixed inertial types with monodromy (R08.2/inertial-type-with-monodromy) with constancy on components (R08.2/fixed-type-rings-rank-n); (4) Ihara-avoidance rings (R08.2/ihara-avoidance-components, R08.2/ihara-avoidance-rings-p2); (5) discrete series lifts (L7/discrete-series-deformation-condition). These, together with the ordinary and Fontaine–Laffaille conditions of L7, are exported to GlobalGaloisDeformations G7 and, for the comparisons of patched complexes under change of local condition, to PotentialAutomorphyInfrastructure PA.3.


### LocalGaloisDeformationRings:L8/doubling-equals-unramified (theorem)

Keep L7/ordinary-ring-with-frobenius-eigenvalue. (1) R^unr ≅ 𝒪/ϖ^m⟦φ₁, φ₂, φ₃, φ₄⟧/(φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃), where ϖ^m is the largest power of ϖ dividing χ^{n−1}(g) − 1 for all g in the decomposition group at p, and R̃^unr ≅ R^unr[β]/(β² − (φ₁ + φ₄)β − (φ₁ + φ₄)) ≅ R^unr ⊕ R^unr as R^unr-modules; so R^unr → R̃^unr is injective and R^unr acts faithfully on R̃^unr/R^unr ≅ R^unr. (2) J = I: the annihilator of R̃†/R† (the ring with a Frobenius eigenvalue modulo the flag-free image ring) is the kernel of the map to the unramified quotient.


### LocalGaloisDeformationRings:R08.2/taylor-wiles-block-condition (construction)

Let v be a finite place (v ∤ p) with r̄|G_{F_v} unramified and r̄(Frob_v) semisimple; choose an eigenvalue α_v ∈ k of multiplicity n₁ and the decomposition r̄|G_{F_v} = Ā_v ⊕ B̄_v with Ā_v(Frob_v) = α_v·1_{n₁}. 𝒟^TW_v(R) consists of lifts r with a decomposition r = A_v ⊕ B_v lifting it, B_v unramified and A_v|I_{F_v} = ψ_v·1_{n₁} for a character ψ_v : I_{F_v} → R^×. With Δ_v the p-part of k(v)^× (the 2-part when p = 2), ψ_v∘Art_{F_v} gives a canonical homomorphism Δ_v → R^×, making the lifting ring an 𝒪[Δ_v]-algebra. 𝒟^TW_v depends on α_v.

- API `TauCeti.GaloisDeformation.Local.TaylorWilesBlock`: 𝒟^TW_v for a chosen eigenvalue α_v of multiplicity n₁.
- API `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.decomposition`: The lifted decomposition r = A_v ⊕ B_v.
- API `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.deltaAlgebra`: The canonical map 𝒪[Δ_v] → R^TW_v from ψ_v∘Art_{F_v}.
- API `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.isLocalDeformationProblem`: 𝒟^TW_v is a local deformation problem.
- API `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.rank2`: For n=2,n₁=1, distinct eigenvalues and q_v≡1 mod p, impose the compatible unramified determinant to recover R08.2/taylor-wiles-local-ring.
- API `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.decomposition_unique`: The selected Frobenius block is the image of the idempotent obtained by Hensel separation of its residual eigenvalue from the complementary eigenvalues. This projector, its A_v⊕B_v decomposition and the imposed scalar inertia character commute with allowed coefficient maps.
- Test `twBlock_rank2` (compatibility): For n=2,n₁=1 and distinct eigenvalues, the variable-determinant block ring is 𝒪[Δ_v][[x,y,B,C]]. After imposing the compatible unramified determinant it is 𝒪[Δ_v][[x,y,B]], as in R08.2/taylor-wiles-local-ring.
- Test `twBlock_full_block` (degenerate): n₁ = n: lifts are ψ_v·(unramified) on inertia, the ring is formally smooth over 𝒪[Δ_v].
- Test `twBlock_p2_delta` (computation): p = 2: Δ_v = k(v)^×(2), the 2-part, e.g. q_v = 17 gives Δ_v ≅ ℤ/16.
- Test `twBlock_needs_semisimple` (non-example): A nonscalar residual Jordan block does not satisfy the semisimple-block hypothesis. The source condition does not impose A_v(Frob_v)=α_v I on lifts, so it does not force emptiness merely because a generalized eigenblock is nonsemisimple.

### LocalGaloisDeformationRings:R08.2/gsp4-minimal-conditions (construction)

Let r̄ : G_ℚ → GSp₄(k) with similitude ε̄^{−(a−1)} and x ∈ S(r̄) of one of the types of R08.2/gsp4-ramification-types. A lift r of r̄|G_x with similitude ε^{−(a−1)} is minimal at x if: (U1–U3) r|I_x has unipotent image, topologically generated by exp(N) with N conjugate over the coefficient algebra (after the specified splitting extension) to the chosen residual orbit representative N₁, N₂ or N₃ respectively, up to the compatible unit rescaling; (P) r(I_x) ≅ r̄(I_x) (reduction is injective on the image of inertia); (H) likewise r(I_x) ≅ r̄(I_x). Minimal lifts at x form a local deformation problem; at a prime x of type U3 it coincides with the unipotent problem R^1 and with the minimally ramified condition (R08.2/regular-unipotent-minimally-ramified).

- API `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt`: The minimal condition at x ∈ S(r̄) according to its type.
- API `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.unipotent_rank`: At U_i the logarithm lifts the specified nilpotent orbit over the Artinian coefficient ring; require conjugacy to the chosen representative or equivalent free kernel/image conditions for every power, not just generic matrix rank.
- API `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.rigid`: At types P, H the reduction map is injective on r(I_x).
- API `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.isLocalDeformationProblem`: Each condition is a local deformation problem.
- API `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.U3_eq_unipotent`: At type U3 the condition equals the unipotent problem R^1 and the minimally ramified condition.
- API `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.baseChange`: The split nilpotent-orbit lifting condition at U_i is preserved under Artinian coefficient maps by applying the map to its conjugating element and unit parameter. The P/H condition uses the fixed prime-to-p inertia lift and is preserved under the same maps.
- Test `gsp4Minimal_U3` (compatibility): Type U3: the minimal condition equals R^1 (single Jordan block, R08.2/regular-unipotent-minimally-ramified).
- Test `gsp4Minimal_H_rigid` (computation): Type H with x⁴ − 1 prime to p: r(I_x) ≅ r̄(I_x), a finite group of order prime to p, so the condition is formally smooth.
- Test `gsp4Minimal_rank_jump` (non-example): Over an Artinian coefficient algebra, a nilpotent lifting N₁ whose square is a nonzero nilpotent matrix cannot be conjugate to N₁ (which squares to zero). It fails the U1 orbit condition even if its reduction has rank 1; a generic-rank label alone would miss this.
- Test `gsp4Minimal_unramified` (degenerate): At primes outside S(r̄) ∪ {p} the minimal condition is 'unramified'.

### LocalGaloisDeformationRings:R08.2/rigid-residual-conditions (definition)

Let F/F⁺ be a CM extension, N ≥ 2, ℓ = p ≥ N, and r̄ : Γ_{F⁺} → 𝒢_N(k) with similitude η^N_{F/F⁺}ε^{1−N}, r̄^♮ its restriction to Γ_F composed with the projection to GL_N. For disjoint finite sets Σ_min, Σ_lr of places of F⁺ not above p, r̄ is rigid for (Σ_min, Σ_lr) if: (1) for v ∈ Σ_min every lift of r̄_v is minimally ramified (R08.2/minimally-ramified-condition); (2) for v ∈ Σ_lr (inert in F, w the place above v) the generalised eigenvalues of r̄^♮_v(φ_w) contain the pair {‖v‖^{−N}, ‖v‖^{−N+2}} exactly once (the residual hypothesis of R08.2/level-raising-local-problems); (3) for v | p, r̄^♮_v is regular Fontaine–Laffaille crystalline (L7/fontaine-laffaille-deformation-condition); (4) r̄_v is unramified at every other finite place. All liftings are taken with the fixed similitude character.

- API `TauCeti.GaloisDeformation.Local.IsRigidFor`: The predicate on r̄ given by the local conditions (1)–(4) at Σ_min, Σ_lr, the places above p and the rest.
- API `TauCeti.GaloisDeformation.Local.IsRigidFor.minimal`: For v ∈ Σ_min every lift of r̄_v is minimally ramified.
- API `TauCeti.GaloisDeformation.Local.IsRigidFor.levelRaising`: For v ∈ Σ_lr the residual hypothesis of R08.2/level-raising-local-problems holds.
- API `TauCeti.GaloisDeformation.Local.IsRigidFor.mono`: Rigid for (Σ_min, Σ_lr) and 𝔭 satisfying (2) ⟹ rigid for (Σ_min, Σ_lr ∪ {𝔭}). Require every added place to be outside the previous minimal, level-raising and p-adic sets and to satisfy the inert-place and q²−1 side conditions.
- Test `rigid_empty` (degenerate): Σ_min = Σ_lr = ∅: rigidity says r̄ is unramified away from p and regular Fontaine–Laffaille at p.
- Test `rigid_eigenvalue_pair_twice` (non-example): If r̄^♮_v(φ_w) has the pair {‖v‖^{−N}, ‖v‖^{−N+2}} twice, condition (2) fails and 𝒟^mix is not defined at v.
- Test `rigid_add_place` (characterisation): Adding to Σ_lr a place satisfying (2) preserves rigidity (used with 𝔭 in LTXZZ §6.4).
- Test `rigid_minimal_unramified` (computation): An unramified r̄_v with every lift unramified satisfies (1).

### LocalGaloisDeformationRings:L7/torsion-crystalline-representations (definition)

Let w | p with F_w/ℚ_p finite unramified, a ≤ b integers, and Mod(F_w, ℤ_p) the category of finitely generated ℤ_p-modules with continuous Γ_{F_w}-action. (1) A torsion object R is crystalline with Hodge–Tate weights in [a, b] if R ≅ R″/R′ for Γ_{F_w}-stable ℤ_p-lattices R′ ⊆ R″ in a crystalline ℚ_p-representation with Hodge–Tate weights in [a, b]. (2) R ∈ Mod(F_w, ℤ_p) is crystalline with weights in [a, b] if R/p^m R is torsion crystalline with weights in [a, b] for every m ≥ 1. (3) R ∈ Mod(F_w, 𝒪) is crystalline if its underlying ℤ_p-module is. For b − a ≤ p − 2 these are the objects in the essential image of Fontaine–Laffaille's functor (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3), and a lattice R with R_ℚ crystalline is crystalline.

- API `TauCeti.GaloisDeformation.Local.IsTorsionCrystalline`: R is a subquotient R″/R′ of lattices in a crystalline representation with weights in [a, b].
- API `TauCeti.GaloisDeformation.Local.IsCrystallineIntegral`: R crystalline iff every R/p^m R is torsion crystalline.
- API `TauCeti.GaloisDeformation.Local.IsTorsionCrystalline.closed`: For every fixed [a,b], torsion crystalline objects are closed under subobjects, quotients and finite direct sums.
- API `TauCeti.GaloisDeformation.Local.IsCrystallineIntegral.of_rational`: A lattice in a crystalline representation with weights in [a, b] is crystalline.
- API `TauCeti.GaloisDeformation.Local.IsTorsionCrystalline.fontaineLaffaille`: For b − a ≤ p − 2 these are the representations of Fontaine–Laffaille modules.
- API `TauCeti.GaloisDeformation.Local.IsTorsionCrystalline.twist`: Tensoring a torsion crystalline object with a lattice in a crystalline character of constant labelled Hodge weight w shifts its weight interval from [a,b] to [a+w,b+w]. This states the shift in terms of w, independently of the cyclotomic sign convention.
- Test `torsionCrys_mu_p` (computation): μ_p ≅ ℤ/p(1) is torsion crystalline with weights in [−1, 0] (LTXZZ convention).
- Test `torsionCrys_trivial` (degenerate): ℤ/p^m with trivial action is torsion crystalline with weights in [0, 0].
- Test `torsionCrys_wide_range` (non-example): At b−a=p−1, unrestricted integral FL full faithfulness can fail (R06.4/fontaine-laffaille-endpoint-non-example). Torsion crystalline subquotient closure still holds by the lattice-quotient definition.
- Test `torsionCrys_lattice` (compatibility): A Γ-stable lattice in a crystalline representation is crystalline in the sense of (2).

-/
