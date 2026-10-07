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

/-!
# Suggested Lean forms: local Galois deformation rings (LocalGaloisDeformationRings, R08.1–R08.6, L7, L8)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`LocalGaloisDeformationRings`) is definitive. The statements below suggest Lean forms, so that
contributors and reviewers converge on names and signatures. Every proof of a new declaration is
`sorry`; nothing here claims to be formalised.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. This file imports Mathlib only; the
generic functors (`Lift`, `Def`, `PhiP`, …) are those of the GlobalGaloisDeformations suggested
file, and the local statements that use them are recorded in the comment block below.

The file has three parts: concrete checks that elaborate against Mathlib (the archimedean ring at
`p = 2`, flag dimensions, Kisin's 2-adic relations, and the checks added with the full pass:
the tame relation, Snowden's presentation of `R̃† ⊗ k`, `GSp₄` nilpotents, `ρ_{n,m,0}` weights and the
dimension counts); a comment block of signatures against the GlobalGaloisDeformations functors;
and a generated sketch block that names every planned definition, API item, unit test and theorem
of the packet. The concrete content of the first part starts with the archimedean ring at `p = 2`: a lift of complex conjugation with
determinant `-1` is a matrix `M = !![a, b; c, -a]` with `a ^ 2 + b * c = 1`.
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
kernels of `(A - 1)^i` have the expected rank (here stated as freeness of rank `r i`). -/
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

/-!
## Signatures against the GlobalGaloisDeformations functors (comment only)

```
-- R08.1/local-lifting-ring
theorem Lift.proRepresentable_of_local (K : Type*) [Field K] [IsLocalField K] (ρbar : G_K →* GL (Fin n) 𝔽) :
    (Lift n ρbar).IsProRepresentable (C 𝒪)
-- R08.1/local-tangent-obstruction
theorem krullDim_localLiftingRing_ge (hℓp : ℓ = p) :
    1 + n ^ 2 + n ^ 2 * [K : ℚ_p] ≤ ringKrullDim (R□ ρbar)
-- R08.1/archimedean-odd-ring-p2
theorem oddArchimedeanRing_isDomain : IsDomain (MvPowerSeries (Fin 3) 𝒪 ⧸ Ideal.span {oddArchimedeanEquation a₀ b₀ c₀})
-- L7/finite-height-lattices and height-lattice-moduli (𝔖 = W⟦u⟧, E(u), M(V) from R07.4)
structure HeightLattice (h : ℕ) (M : EtalePhiModule 𝒪ℰ_B) where
  carrier : Submodule 𝔖_B M
  projective : Module.Projective 𝔖_B carrier
  spans : Submodule.span 𝒪ℰ_B carrier = ⊤
  phi_stable : ∀ x ∈ carrier, M.φ x ∈ carrier
  coker_killed : E ^ h • (carrier : Submodule 𝔖_B M) ≤ Submodule.span 𝔖_B (M.φ '' carrier)
theorem heightLatticeModuli_closedImmersion_generic : IsClosedImmersion ((Θ A h).baseChange ℚ_p)
-- R08.3/pst-deformation-ring and pst-generic-fibre
def pstQuotient (τ : GaloisType K E) (v : HodgeType K E) : Ideal (R□ ρbar)   -- reduced, p-torsion-free
theorem pstQuotient_points (x : R□ ρbar →+* ℚ̄_p) :
    RingHom.ker x ≥ pstQuotient τ v ↔ IsPotentiallySemistableOfType (x.comp ρ□) τ v
theorem pstQuotient_dim (hne : pstQuotient τ v ≠ ⊤) :
    ringKrullDim (R□ ρbar ⧸ pstQuotient τ v) = 1 + d ^ 2 + v.adQuotDim
-- R08.4/flat-deformation-condition and finite-flat-model-moduli (L7 with h = 1)
def flatLiftingRing (ρbar) : Ideal (R□ ρbar)        -- finite flat lifts (Ramakrishna)
def finiteFlatModels (ξ) : ProjectiveScheme R := heightLatticeModuli ξ 1
def finiteFlatModels_toFlat : finiteFlatModels univ ⟶ Spec (R□ ρbar ⧸ flatLiftingRing ρbar)
theorem finiteFlatModels_iso_of_small_ramification (he : e K < p - 1) :
    IsIso finiteFlatModels_toFlat
-- R08.4/hodge-type-resolution and components-via-special-fibre
theorem flatResolution_generic_iso (v : HodgeType K E) : IsIso ((Θv v).baseChange F)
theorem components_bijection (v) :
    ConnectedComponents (Spec (Rv v)[1/p]) ≃ ConnectedComponents (flatResolution v).closedFibre
-- R08.4/rank-two-bt-components (d = 2, v_ψ = 1)
theorem rankTwoBT_sameComponent_iff (hK0 : K₀ = ℚ_p) (x₁ x₂ : Spec (Rv 1)[1/p])
    (hn : ¬ IsOrdinary x₁ ∧ ¬ IsOrdinary x₂) :
    SameIrreducibleComponent x₁ x₂
-- R08.4/savitt-weight-two-rings
theorem savitt_principalSeries_irreducible (hτ : τ = ω̃ ^ i ⊕ ω̃ ^ j)
    (hρ : ρbar.restrict I_p ≅ ω₂ ^ k ⊕ ω₂ ^ (p * k)) :
    Nonempty (R 2 τ ρbar ≃ₐ[𝒪] 𝒪⟦X₁, X₂⟧ ⧸ Ideal.span {X₁ * X₂ - p * w})
```
-/

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

/-!
## Sketches of every planned declaration (generated from the packet; not elaborated)

Each entry gives a packet node, its proposed declaration name, and for definitions and
constructions its API items (as lemma names with their statements) and unit tests (as example
names). They depend on carriers that the supplier roadmaps build — GlobalGaloisDeformations'
`Lift`/`Def`, the coefficient categories of DeformationAndDerivedPatchingAlgebra R03.1, the period
rings of PadicHodgeTheory, Breuil–Kisin modules of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4
and the local duality of Tau Ceti ClassFieldTheory Layer 5 — so they are recorded here in
signature form rather than elaborated against private stand-ins. Every proof is `sorry`.

### Layer R08.1

* `R08.1/local-lifting-ring` (theorem): The local framed deformation ring.
  - theorem `TauCeti.GaloisDeformation.Local.localLiftingRing` : K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. The lifting functor Lift_ρ̄ of GlobalGaloisDeformations R04.1 is pro-represented by a complete local Noetherian 𝒪-algebra R^□_ρ̄ ∈ C_𝒪 with universal lift ρ^□ : G_K → GL_n(R^□_ρ̄). := sorry
* `R08.1/local-tangent-obstruction` (theorem): Tangent and obstruction description of local lifting rings.
  - theorem `TauCeti.GaloisDeformation.Local.localTangentObstruction` : K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. (1) m_{R^□}/(m², λ) is dual to Z¹(G_K, ad ρ̄), of dimension h¹ + n² − h⁰ where h^i = dim_𝔽 H^i(G_K, ad ρ̄). (2) R^□_ρ̄ ≅ 𝒪[[x₁, …, x_d]]/J with d = dim Z¹(G_K, ad ρ̄), and J/𝔪J embeds into H²(G_K, ad ρ̄)^∨, so J is … := sorry
* `R08.1/local-fixed-determinant` (theorem): Fixing the determinant of local lifts.
  - theorem `TauCeti.GaloisDeformation.Local.localFixedDeterminant` : K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. Let χ : G_K → 𝒪^× lift det ρ̄. The fixed-determinant lifting ring R^□_{ρ̄,χ} (GlobalGaloisDeformations R04.2) has tangent space Z¹(G_K, ad⁰ρ̄) and obstructions in H²(G_K, ad⁰ρ̄) when p ∤ n; its dimension is ≥ 1 + (n… := sorry
* `R08.1/local-forget-framing` (theorem): Forgetting the framing of local lifts.
  - theorem `TauCeti.GaloisDeformation.Local.localForgetFraming` : K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. If ρ̄ is Schur as a G_K-representation, the local universal deformation ring R_ρ̄ exists and R^□_ρ̄ ≅ R_ρ̄[[X_{ij}]]/(X_{11}) (n² − 1 variables), also with fixed determinant. If ρ̄ is not Schur (the usual case local… := sorry
* `R08.1/archimedean-rings-p-odd` (lemma): Archimedean deformation rings for odd p.
  - theorem `TauCeti.GaloisDeformation.Local.archimedeanRingsPOdd` : Let K = ℝ, G_ℝ = {1, c}, p odd, and ρ̄ : G_ℝ → GL_n(𝔽). Then H^i(G_ℝ, ad ρ̄) = 0 for i ≥ 1, R^□_ρ̄ is formally smooth over 𝒪 of relative dimension n² − dim (ad ρ̄)^{c}, and every lift is Γ̂_n-conjugate to the Teichmüller lift of ρ̄ (with ρ̄(c) diagonalised). For n = 2 and ρ̄ odd (det ρ̄(c) = −1), the relative dimension is 2, and with fixed determinant χ (χ(c) = −1) it is also 2. := sorry
* `R08.1/archimedean-odd-ring-p2` (theorem): The odd archimedean deformation ring at p = 2.
  - theorem `TauCeti.GaloisDeformation.Local.archimedeanOddRingP2` : Let p = 2, n = 2, K = ℝ, ψ : G_ℝ → 𝒪^× with ψ(c) = −1, and ρ̄ : G_ℝ → GL₂(𝔽) with det ρ̄ = ψ mod 2 (so ρ̄(c) is 1 or conjugate to (1 1; 0 1)). The fixed-determinant lifts send c to M = (a b; c′ −a) with a² + bc′ = 1, so R^{□,ψ} = 𝒪[[a − a₀, b − b₀, c′ − c′₀]]/(a² + bc′ − 1) centred at a lift (a₀, b₀, c′₀) of ρ̄(c). It is a complete intersection domain of relative dimension 2 over 𝒪; every 𝒪-point … := sorry
* `R08.1/local-residue-field-change` (lemma): Local deformation rings under change of coefficients.
  - theorem `TauCeti.GaloisDeformation.Local.localResidueFieldChange` : K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. For a finite local 𝒪 → 𝒪′ with residue extension 𝔽 ⊆ 𝔽′: R^□_{ρ̄⊗𝔽′,𝒪′} ≅ R^□_{ρ̄,𝒪} ⊗̂_𝒪 𝒪′, likewise with fixed determinant and (Schur) unframed; the tangent, obstruction and Euler-characteristic invariants of loc… := sorry
* `R08.1/coefficient-rings-lambda` (construction): Coefficient rings Λ for finite, p-adic and local residue fields.
  - `TauCeti.GaloisDeformation.Local.CoeffRing` (data) : The ring Λ attached to an 𝒪-field κ of the three kinds, with its residue isomorphism Λ/ϖ ≅ κ in cases (1), (3) and Λ = κ in case (2). := sorry
  - `TauCeti.GaloisDeformation.Local.CoeffRing.isCohen` (characterisation) : In case (3), any 𝒪-algebra that is a complete DVR with uniformiser ϖ and residue field κ is isomorphic to Λ. := sorry
  - `TauCeti.GaloisDeformation.Local.ArtinCat` (data) : The category 𝔄_Λ with the topology on each object. := sorry
  - `TauCeti.GaloisDeformation.Local.liftFunctorΛ` (constructor) : D^□_ρ : 𝔄_Λ → Set, continuous lifts of ρ : G_F → GL_d(κ). := sorry
  - `TauCeti.GaloisDeformation.Local.liftFunctorΛ_finite` (compatibility) : For κ finite, D^□_ρ restricted to Artinian objects is the lifting functor of GlobalGaloisDeformations R04.1. := sorry
  - example `coeffRing_finite` (degenerate) : For κ = k, CoeffRing κ = 𝒪. := sorry
  - example `coeffRing_padic` (computation) : For κ = L, CoeffRing κ = L and 𝔄_Λ consists of finite local L-algebras with residue field L. := sorry
  - example `coeffRing_char_p_dvr` (non-example) : For κ = k((t)), Λ is not 𝒪⟦t⟧ (not a DVR, residue field k) but the ϖ-adic completion of 𝒪⟦t⟧[1/t], a DVR with residue field k((t)). := sorry
  - example `liftFunctorΛ_compat` (compatibility) : For κ finite, liftFunctorΛ ρ agrees with the lifting functor of R08.1/local-lifting-ring on Artinian objects. := sorry
* `R08.1/lambda-presentation` (theorem): Presentation of framed rings over Λ and the cocycle count.
  - theorem `TauCeti.GaloisDeformation.Local.lambdaPresentation` : Let κ, Λ and ρ : G_F → GL_d(κ) be as in R08.1/coefficient-rings-lambda. (1) dim_κ Z¹(G_F, V) = h¹(G_F, V) + dim V − h⁰(G_F, V) for any finite continuous κ[G_F]-module V, and dim_κ Z¹(G_F, V) = dim V·([F:ℚ_p] + 1) + h²(G_F, V). (2) D^□_ρ is pro-represented by a complete local Noetherian Λ-algebra R^□_ρ with a presentation R^□_ρ ≅ Λ⟦x₁, …, x_r⟧/(f₁, …, f_s), r = dim_κ Z¹(G_F, ad ρ), s = dim_κ H²(G_F… := sorry
* `R08.1/completion-at-points` (theorem): Completed local rings at points of the generic fibre are framed rings.
  - theorem `TauCeti.GaloisDeformation.Local.completionAtPoints` : Let ρ̄ : G_F → GL_d(k′) (k′/k finite, F/ℚ_ℓ finite, ℓ = p allowed) with framed ring R^□_ρ̄. Let x ∈ Spec R^□_ρ̄ be a point with κ(x) finite over k′, a finite extension of L, or a local field of characteristic p (x ∈ P₁R^□_ρ̄), ρ_x : G_F → GL_d(κ(x)) the specialisation of the universal lift, Λ the coefficient ring of κ(x) (R08.1/coefficient-rings-lambda) and 𝔮 the kernel of Λ ⊗_𝒪 R^□_ρ̄ → κ(x), λ ⊗… := sorry
* `R08.1/smooth-points-generic-fibre` (theorem): Smooth points of the generic fibre and purity.
  - theorem `TauCeti.GaloisDeformation.Local.smoothPointsGenericFibre` : Let v be a finite place of a number field, F_v its completion, ρ̄ : G_{F_v} → G(k) with G = GL_n (or a group of R08.1/g-valued-framed-ring with fixed multiplier, e.g. GSp₄), and x a closed point of Spec R^□_v[1/p] with ρ_x : G_{F_v} → G(E′). Call x smooth if (R^□_v[1/p])^∧_x is regular. (1) If v ∤ p, x is smooth iff (ad⁰ρ_x)(1)^{G_{F_v}} = 0, equivalently H²(G_{F_v}, ad⁰ρ_x) = 0. (2) If v ∤ p and … := sorry
* `R08.1/rank-one-ring` (theorem): The universal deformation ring of a character.
  - theorem `TauCeti.GaloisDeformation.Local.rankOneRing` : Let F/ℚ_p be finite, ψ̄ : G_F → k^× continuous, R_ψ̄ its universal deformation ring and μ = μ_{p^∞}(F), a finite cyclic p-group. Local class field theory gives μ → F^× → G_F^{ab} → GL₁(R_ψ̄), hence 𝒪[μ] → R_ψ̄, and R_ψ̄ ≅ 𝒪[μ]⟦y₁, …, y_{[F:ℚ_p]+1}⟧. The irreducible components of Spec R_ψ̄ are indexed by the characters χ : μ → 𝒪^× (after enlarging 𝒪), and each R_ψ̄ ⊗_{𝒪[μ],χ} 𝒪 is formally smooth o… := sorry
* `R08.1/determinant-twisting` (theorem): Fixed-determinant rings by twisting: the functor 𝒳 and the power map φ_d.
  - theorem `TauCeti.GaloisDeformation.Local.determinantTwisting` : Let ρ̄ : G_F → GL_d(k), ψ : G_F → 𝒪^× a lift of det ρ̄, and χ = ψ∘Art_F on μ. (1) R^{□,ψ}_ρ̄ := R^□_ρ̄ ⊗_{R_{det ρ̄},ψ} 𝒪 represents framed lifts with determinant ψ, and is a quotient of R^{□,χ}_ρ̄ (lifts whose determinant restricted to Art_F(μ) is χ). (2) Let 𝒳 : C_𝒪 → Set send A to the group of continuous θ : G_F → 1 + 𝔪_A trivial on Art_F(μ); it is pro-represented by 𝒪(𝒳) ≅ 𝒪⟦y₁, …, y_{[F:ℚ_p]+… := sorry
* `R08.1/g-valued-framed-ring` (construction): G-valued framed deformation rings.
  - `TauCeti.GaloisDeformation.Local.GLift` (data) : D^□_{ρ,G}(A): continuous lifts Γ → G(A) of ρ. := sorry
  - `TauCeti.GaloisDeformation.Local.GFramedRing` (constructor) : R^□_{ρ,G}, the pro-representing complete local Noetherian Λ-algebra, with the universal lift ρ^□_G : Γ → G(R^□_{ρ,G}). := sorry
  - `TauCeti.GaloisDeformation.Local.GFramedRing.tangent` (characterisation) : Hom_Λ(R^□_{ρ,G}, κ[ε]) ≅ Z¹(Γ, ad ρ). := sorry
  - `TauCeti.GaloisDeformation.Local.GFramedRing.map` (functoriality) : A morphism φ : G → H induces R^□_{φ∘ρ,H} → R^□_{ρ,G}, with map_id and map_comp. := sorry
  - `TauCeti.GaloisDeformation.Local.GFramedRing.fixedMultiplier` (constructor) : For a character μ lifting ν∘ρ, the quotient R^{□,μ}_{ρ,G} of lifts with ν∘ρ_A = μ. := sorry
  - `TauCeti.GaloisDeformation.Local.GFramedRing.gl` (compatibility) : For G = GL_d, R^□_{ρ,GL_d} = R^□_ρ of R08.1/local-lifting-ring. := sorry
  - example `gFramed_GL1_trivial` (computation) : G = 𝔾_m, F = ℚ_p (p odd), ρ trivial: R^□_{ρ,G} ≅ 𝒪⟦y₁, y₂⟧ (R08.1/rank-one-ring). := sorry
  - example `gFramed_trivial_group` (degenerate) : G trivial: R^□_{ρ,G} = Λ. := sorry
  - example `gFramed_GSp4_unobstructed` (computation) : G = GSp₄ with fixed multiplier, v ∤ p, H⁰(F_v, ad⁰ρ̄(1)) = 0: R^{□,μ} is a power series ring over 𝒪 in 10 variables (BCGP21 Proposition 7.4.2). := sorry
  - example `gFramed_GL_compat` (compatibility) : GFramedRing for GL_d agrees with R^□_ρ of R08.1/local-lifting-ring. := sorry
* `R08.1/g-valued-presentations` (theorem): Presentations of G-valued framed rings and central quotients.
  - theorem `TauCeti.GaloisDeformation.Local.gValuedPresentations` : Let φ : G → H be a morphism of smooth affine 𝒪-group schemes with G⁰ → H⁰ smooth and surjective, ρ : Γ → G(κ) continuous and ad^{0,φ}ρ = ker(ad ρ → ad(φ∘ρ)). (1) R^□_{ρ,G} ≅ R^□_{φ∘ρ,H}⟦x₁, …, x_r⟧/(f₁, …, f_t) with r = dim Z¹(Γ, ad^{0,φ}ρ), t = h²(Γ, ad^{0,φ}ρ); for Γ = G_F, r − t = (dim G_κ − dim H_κ)([F:ℚ_p] + 1). (2) With H trivial: R^□_{ρ,G} ≅ Λ⟦x₁, …, x_r⟧/(f₁, …, f_s), r − s = dim G_κ·([F:ℚ… := sorry
* `R08.1/phi-gamma-module-deformation-rings` (construction): Deformation rings of (φ, Γ)-modules and their trianguline and de Rham quotients.
  - `TauCeti.GaloisDeformation.PhiGamma.defRing` (data) : R_D for a (φ, Γ_K)-module D with End(D) = E. := sorry
  - `TauCeti.GaloisDeformation.PhiGamma.triangulineDefRing` (constructor) : R_{D,w}, deformations with a deformation of the triangulation attached to w. := sorry
  - `TauCeti.GaloisDeformation.PhiGamma.deRhamDefRing` (constructor) : R_{D,g}, de Rham deformations. := sorry
  - `TauCeti.GaloisDeformation.PhiGamma.tangent_defRing` (characterisation) : Tangent space of R_D is Ext¹(D, D); of R_{D,w} the classes preserving the triangulation. := sorry
  - `TauCeti.GaloisDeformation.PhiGamma.formallySmooth` (other) : Under genericity of δ, R_D, R_{D,w}, R_{D,g} are formally smooth over E. := sorry
  - `TauCeti.GaloisDeformation.PhiGamma.galois_compat` (compatibility) : For D = D_rig(V), R_D is the unframed deformation ring of V (R08.1/completion-at-points modulo framing). := sorry
  - example `phiGamma_rank_one` (computation) : n = 1: R_D ≅ R_δ ≅ E⟦x₁, …, x_{[K:ℚ_p]+1}⟧. := sorry
  - example `phiGamma_trianguline_sub` (characterisation) : The tangent map of R_D → R_{D,w} identifies Hom(R_{D,w}, E[ε]) with the subspace of Ext¹(D, D) of extensions that are trianguline for the deformed refinement. := sorry
  - example `phiGamma_nongeneric` (non-example) : For D = ℛ ⊕ ℛ(x) (δ₁δ₂^{-1} = x^{-1}, not generic), Ext²(D, D) ≠ 0 and R_D is not formally smooth. := sorry
  - example `phiGamma_galois` (compatibility) : For D = D_rig(V) with End V = E, R_D is the unframed deformation ring of V. := sorry

### Layer R08.2

* `R08.2/tame-splitting` (lemma): The tame quotient and the reduction to tame pieces.
  - theorem `TauCeti.GaloisDeformation.Local.tameSplitting` : K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. Let P_K ⊆ I_K be the kernel of a surjection I_K ↠ ℤ_p (pro-order prime to p). Then G_K = P_K ⋊ T_K with T_K = G_K/P_K ≅ ℤ_p ⋊ ℤ (Frobenius acting by q). For an irreducible k[P_K]-module τ with stabiliser G_τ, deformations of ρ̄ are equivalent to tuples of deformations of the multiplicity spaces… := sorry
* `R08.2/unramified-lifting-ring` (theorem): Unramified lifts.
  - theorem `TauCeti.GaloisDeformation.Local.unramifiedLiftingRing` : K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. If ρ̄ is unramified, the unramified lifts form a deformation problem, and its ring is formally smooth over 𝒪 in n² variables (n² − 1 with fixed unramified determinant): an unramified lift is determined by ρ(φ) ∈ GL_n(A) lifting ρ̄(φ), for a Frobenius lift φ. := sorry
* `R08.2/minimally-ramified-condition` (definition): Minimally ramified lifts.
  - `TauCeti.GaloisDeformation.Local.IsMinimallyRamified` (constructor) : The minimally ramified condition on lifts of ρ̄|_{T_q} and of ρ̄. := sorry
  - `TauCeti.GaloisDeformation.Local.isMinimallyRamified_iff_filtration` (characterisation) : Equivalent to a σ_q-unipotent filtration by direct summands lifting the residual kernel filtration. := sorry
  - `TauCeti.GaloisDeformation.Local.IsMinimallyRamified.conj` (compatibility) : Stable under Γ̂_n-conjugation. := sorry
  - `TauCeti.GaloisDeformation.Local.minimallyRamified_deformationProblem` (instance) : Minimally ramified lifts form a deformation problem. := sorry
  - example `minRam_unramified` (compatibility) : For unramified ρ̄, minimally ramified = unramified. := sorry
  - example `minRam_conj` (characterisation) : Conjugating by Γ̂_n preserves the condition. := sorry
  - example `minRam_non_example` (non-example) : ρ(σ_q) = (1 x; 0 1), x ∈ m_A∖0, lifting ρ̄(σ_q) = 1, is not minimally ramified. := sorry
* `R08.2/minimally-ramified-ring` (theorem): The minimally ramified deformation ring.
  - theorem `TauCeti.GaloisDeformation.Local.minimallyRamifiedRing` : K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. The minimally ramified problem D_v is liftable, its tangent space L_v has dimension h⁰(G_K, ad ρ̄), and R^loc/I(D_v) is a power series ring in n² variables over 𝒪. If p ∤ #ρ̄(I_K), a lift is minimally ramified iff it vanishes on ker ρ̄|_{I_K}, and L_v = H¹(G_K/I_K, (ad ρ̄)^{I_K}). := sorry
* `R08.2/unrestricted-away-from-p` (theorem): Structure of unrestricted lifting rings away from p.
  - theorem `TauCeti.GaloisDeformation.Local.unrestrictedAwayFromP` : K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. (1) If H⁰(G_K, (ad ρ̄)(1)) = 0 then H²(G_K, ad ρ̄) = 0 and R^□_ρ̄ is a power series ring in n² variables over 𝒪. (2) For n = 2 and fixed determinant χ: R^□_{ρ̄,χ} is equidimensional of Krull dimension 4, R^□_{ρ̄,χ}[1/p] has dimension 3, its irreducible components are regular and finitely many, … := sorry
* `R08.2/inertial-type-quotient` (definition): Fixed inertial type quotients.
  - `TauCeti.GaloisDeformation.Local.typeQuotient` (constructor) : R^□_{ρ̄,χ,τ} as a quotient of R^□_{ρ̄,χ}. := sorry
  - `TauCeti.GaloisDeformation.Local.typeQuotient_points` (characterisation) : ℚ̄_p-points are the lifts of inertial type τ. := sorry
  - `TauCeti.GaloisDeformation.Local.typeQuotient_krullDim` (characterisation) : Nonzero ⇒ Krull dimension 4 (n = 2). := sorry
  - `TauCeti.GaloisDeformation.Local.typeQuotient_finite` (relation) : Only finitely many τ give nonzero quotients. := sorry
  - example `typeQuotient_unramified` (computation) : The trivial type with N = 0 gives the unramified quotient. := sorry
  - example `typeQuotient_finite` (characterisation) : Only finitely many types occur. := sorry
  - example `typeQuotient_not_torsion` (non-example) : The naive quotient by the equations of the type need not be p-torsion free; the definition takes the flat closure. := sorry
* `R08.2/taylor-wiles-local-ring` (theorem): Local rings at Taylor–Wiles primes.
  - theorem `TauCeti.GaloisDeformation.Local.taylorWilesLocalRing` : Let n = 2, ℓ ≠ p, ρ̄ unramified with ρ̄(Frob_K) having distinct eigenvalues, q ≡ 1 mod p with p^m ∥ q − 1, and χ unramified. Then R^□_{ρ̄,χ} ≅ 𝒪[[x, y, B, u]]/((1 + u)^{p^m} − 1), with ρ^□(φ) = (1 y; x 1)^{-1} diag(α + B, χ(φ)/(α + B)) (1 y; x 1) and ρ^□(σ) = (1 y; x 1)^{-1} diag(1 + u, (1 + u)^{-1}) (1 y; x 1). := sorry
* `R08.2/steinberg-condition` (definition): Steinberg (unipotent-monodromy) lifts.
  - `TauCeti.GaloisDeformation.Local.SteinbergLifts` (constructor) : D^Stein,1 and its flat closure D^Stein. := sorry
  - `TauCeti.GaloisDeformation.Local.steinberg_charpoly_frob` (characterisation) : Frobenius eigenvalues in ratio q. := sorry
  - `TauCeti.GaloisDeformation.Local.steinberg_le_unipotentInertia` (relation) : D^Stein ⊆ D^{(1,…,1)}. := sorry
  - `TauCeti.GaloisDeformation.Local.steinberg_n_two` (characterisation) : For n = 2, the relation q(tr ρ(φ))² = (1 + q)² det ρ(φ). := sorry
  - example `stein_n_two_relation` (computation) : For n = 2 the Steinberg relation is q(tr ρ(φ))² = (1 + q)² det ρ(φ). := sorry
  - example `stein_subset_unipotent` (characterisation) : Every Steinberg lift has unipotent inertia. := sorry
  - example `stein_not_unipotent_only` (non-example) : An unramified lift with Frobenius eigenvalue ratio ≠ q has unipotent inertia but is not Steinberg. := sorry
* `R08.2/ihara-avoidance-components` (theorem): Components for Ihara avoidance.
  - theorem `TauCeti.GaloisDeformation.Local.iharaAvoidanceComponents` : Let ℓ ≠ p, ρ̄ trivial, q ≡ 1 mod p, characters χ_i : I_K → 1 + λ trivial mod λ. (1) If the χ_i are distinct, Spec R^□/I^{(χ_i)} is irreducible with characteristic-zero generic point and Krull dimension n² + 1. (2) R^□/(λ, I^{(χ_i)}) = R^□/(λ, I^{(1,…,1)}). (3) All components of Spec R^□/I^{(1,…,1)} have dimension n² + 1 with characteristic-zero generic points, and each prime minimal over λ contain… := sorry
* `R08.2/q-tame-group` (definition): The q-tame group.
  - `TauCeti.GaloisDeformation.Local.TameGroup` (data) : T_q as a profinite group with generators t, φ_q. := sorry
  - `TauCeti.GaloisDeformation.Local.TameGroup.conj_t` (relation) : φ_q t φ_q^{-1} = t^q. := sorry
  - `TauCeti.GaloisDeformation.Local.TameGroup.lift` (universal-property) : A pair (A, B) in GL_n(R) with B A B^{-1} = A^q and A ≡ 1 mod 𝔪 (pro-p) defines a unique continuous representation of T_q. := sorry
  - `TauCeti.GaloisDeformation.Local.TameGroup.ofLocalField` (equivalence) : G_K/P_K ≅ T_q for K/ℚ_ℓ with residue field 𝔽_q, given the choices. := sorry
  - example `tameGroup_abelianisation` (computation) : T_q^{ab} ≅ ℤ_p/(q − 1) × ℤ̂. := sorry
  - example `tameGroup_q_one` (degenerate) : q = 1: T_1 = ℤ_p × ℤ̂ is abelian (the relation φtφ^{-1} = t is trivial). := sorry
  - example `tameGroup_not_direct` (non-example) : For q ≢ 1 mod p, T_q is not abelian: φ_q t φ_q^{-1} = t^q ≠ t. := sorry
  - example `tameGroup_sub` (characterisation) : ⟨t, φ_q^b⟩ ≅ T_{q^b}. := sorry
* `R08.2/level-raising-local-problems` (construction): Level-raising local deformation problems 𝒟^mix, 𝒟^unr, 𝒟^ram.
  - `TauCeti.GaloisDeformation.Local.LevelRaising.mix` (data) : The local deformation problem 𝒟^mix with its decomposition R^N = M₀ ⊕ M₁. := sorry
  - `TauCeti.GaloisDeformation.Local.LevelRaising.unr` (constructor) : 𝒟^unr ⊂ 𝒟^mix. := sorry
  - `TauCeti.GaloisDeformation.Local.LevelRaising.ram` (constructor) : 𝒟^ram ⊂ 𝒟^mix. := sorry
  - `TauCeti.GaloisDeformation.Local.LevelRaising.localModel` (equivalence) : 𝒟^mix is formally smooth over Spf 𝒪⟦x₀, x₁⟧/(x₀x₁), with 𝒟^unr = {x₀ = 0} and 𝒟^ram = {x₁ = 0}. := sorry
  - `TauCeti.GaloisDeformation.Local.LevelRaising.relation` (relation) : x(s − q^{−N}) = 0 in R^mix. := sorry
  - `TauCeti.GaloisDeformation.Local.LevelRaising.unr_eq_minimal` (compatibility) : 𝒟^unr is the minimally ramified problem of R08.2/minimally-ramified-condition for unramified r̄. := sorry
  - example `levelRaising_dims` (computation) : Relative dimensions: 𝒟^mix and 𝒟^unr have N² − 1 + 1 = N² as framed rings over 𝒪 on each component; 𝒟^ram is formally smooth of relative dimension N². := sorry
  - example `levelRaising_N2_components` (characterisation) : For N = 2, Spec R^mix has exactly two irreducible components, R^unr and R^ram, meeting in R^mix/(x, s − q^{−2}). := sorry
  - example `levelRaising_wrong_direction` (non-example) : With monodromy r(t)v′ = v′ + xv (the printed direction) the relation would be x(s − q²s′) = 0, which is not satisfied on the unramified component; the correct relation is x(s − q^{−N}) = 0. := sorry
  - example `levelRaising_degenerate_eigenvalues` (degenerate) : If p | q² − 1, the eigenvalues q^{−N}, q^{−N+2} coincide mod p and the decomposition R^N = M₀ ⊕ M₁ need not exist; the construction requires p ∤ q² − 1. := sorry
* `R08.2/unrestricted-ring-complete-intersection` (theorem): Unrestricted lifting rings away from p are complete intersections.
  - theorem `TauCeti.GaloisDeformation.Local.unrestrictedRingCompleteIntersection` : Let K/ℚ_ℓ be finite, ℓ ≠ p, and r̄ : G_K → GL_N(k). (1) The lifting ring R^□_r̄ is a reduced local complete intersection, flat over 𝒪 and of pure relative dimension N²; R^□_r̄/ϖ is equidimensional of dimension N². (2) Every irreducible component of Spf R^□_r̄ is a local deformation problem. (3) When p ≥ N, the minimally ramified problem 𝒟^min (R08.2/minimally-ramified-condition) is an irreducible … := sorry
* `R08.2/inertial-type-with-monodromy` (definition): Inertial types with monodromy and fixed-type rings.
  - `TauCeti.GaloisDeformation.Local.InertialType` (data) : An inertial type: an I_K-isomorphism class of Weil–Deligne representations restricted to I_K, N retained. := sorry
  - `TauCeti.GaloisDeformation.Local.fixedTypeRing` (constructor) : R^□_r̄(τ), the reduced 𝒪-flat quotient with ℚ̄_p-points of type τ. := sorry
  - `TauCeti.GaloisDeformation.Local.fixedTypeRing_points` (characterisation) : x ∈ Spec R^□_r̄[1/p](ℚ̄_p) lies on R^□_r̄(τ) iff WD(ρ_x)|_{I_K} ≅ τ. := sorry
  - `TauCeti.GaloisDeformation.Local.fixedTypeRing_union` (other) : Spec R^□_r̄[1/p] is the disjoint union over the finitely many τ of Spec R^□_r̄(τ)[1/p]. := sorry
  - `TauCeti.GaloisDeformation.Local.fixedTypeRing_n2` (compatibility) : For n = 2 and N = 0, R^□_r̄(τ) with fixed determinant is R08.2/inertial-type-quotient. := sorry
  - example `inertialType_steinberg_vs_trivial` (non-example) : τ_{Sp_2} (unipotent N ≠ 0) and the trivial type (N = 0) are different inertial types though both have trivial r|_{I_K}; their rings are different components. := sorry
  - example `inertialType_unramified` (computation) : For r̄ unramified and τ trivial with N = 0 the ring is the unramified-after-twist ring, formally smooth of relative dimension n² (R08.2/unramified-lifting-ring). := sorry
  - example `inertialType_dimension` (characterisation) : Each nonzero R^□_r̄(τ) is equidimensional of dimension 1 + n². := sorry
  - example `inertialType_empty` (degenerate) : If τ|_{P_K} is not the semisimplification of r̄|_{P_K}, R^□_r̄(τ) = 0. := sorry
* `R08.2/fixed-type-rings-rank-n` (theorem): Fixed-type rings away from p in rank n and constancy of types on components.
  - theorem `TauCeti.GaloisDeformation.Local.fixedTypeRingsRankN` : Let K/ℚ_ℓ be finite, ℓ ≠ p, r̄ : G_K → GL_n(k). (1) For each inertial type τ, R^□_r̄(τ) is reduced, 𝒪-flat and equidimensional of dimension 1 + n², and R^□_r̄/ϖ is equidimensional of dimension n². (2) If two ℚ̄_p-points of R^□_r̄ lie on the same irreducible component of Spec R^□_r̄[1/p], their Weil–Deligne representations restricted to I_K are conjugate; hence the conductor is constant on pure poi… := sorry
* `R08.2/rank-two-unrestricted-rings-cg` (theorem): Fixed-determinant rank-two rings away from p: complete intersection with smooth generic fibre.
  - theorem `TauCeti.GaloisDeformation.Local.rankTwoUnrestrictedRingsCg` : Let p be odd, v ≠ p a prime, ρ̄ : G_v → GL₂(k) and φ a fixed determinant; R_v = R_{v,φ} is the framed fixed-determinant ring. (1) R_v is a complete intersection, and R_v[1/p] is formally smooth over K. (2) After twisting ρ̄|G_v to be minimal among its twists (and extending k), H²(G_v, ad⁰ρ̄) ≠ 0 — i.e. R_v is not formally smooth — exactly in four cases: (a) v ≡ 1 mod p, ρ̄|G_v ≅ unr ⊗ (χ ⊕ 1) with… := sorry
* `R08.2/taylor-wiles-local-tangent` (theorem): Taylor–Wiles local conditions in rank n: the tangent dimension.
  - theorem `TauCeti.GaloisDeformation.Local.taylorWilesLocalTangent` : Let F_v/ℚ_ℓ be finite (ℓ ≠ p) with N(v) ≡ 1 mod p, and r̄|G_v ≅ s̄_v ⊕ ψ̄_v with ψ̄_v a one-dimensional generalised Frobenius eigenspace (unramified), ξ a fixed determinant. 𝒟_v consists of lifts of determinant ξ of the form s_v ⊕ ψ_v lifting s̄_v, ψ̄_v, with I_v acting by (possibly different) scalars on s_v and ψ_v, and L_v ⊂ H¹(G_v, ad⁰r̄) its tangent space. Then dim_k L_v − h⁰(G_v, ad⁰r̄) = 1. := sorry
* `R08.2/steinberg-ring-domain` (theorem): The Steinberg lifting ring is a domain and equals the fixed-type ring.
  - theorem `TauCeti.GaloisDeformation.Local.steinbergRingDomain` : Let K/ℚ_ℓ be finite with residue cardinality q_v ≡ 1 mod p, p^N ∥ q_v − 1 with p^N > n, and r̄ : G_K → GL_n(k) trivial. Then the Steinberg lifting ring R^St (Thorne 2015 §3.3.4: lifts with unipotent inertia and Frobenius eigenvalues α, q_vα, …, q_v^{n−1}α, flat-closed; R08.2/steinberg-condition) is a domain, and the natural surjection R^St → R^□_r̄(τ_{Sp_n}) onto the fixed-type ring of the special… := sorry
* `R08.2/dotto-division-algebra-cycles` (theorem): Breuil–Mézard cycles for central division algebras away from p.
  - theorem `TauCeti.GaloisDeformation.Local.dottoDivisionAlgebraCycles` : Let K/ℚ_ℓ be finite (ℓ ≠ p), D a central division algebra of rank n over K and r̄ : G_K → GL_n(k). Dotto's cycle map cyc_{D^×} sends a smooth irreducible representation σ of 𝒪_D^× over ℚ̄_p to the n²-dimensional cycle Z(R^□_r̄(τ)/ϖ) of the fixed-type ring of the inertial type τ whose generic representations contain JL_K(σ); representations σ, σ′ with the same reduction mod p give equal cycles. Con… := sorry
* `R08.2/regular-unipotent-minimally-ramified` (theorem): Unipotent lifts of a regular unipotent residual monodromy are minimally ramified.
  - theorem `TauCeti.GaloisDeformation.Local.regularUnipotentMinimallyRamified` : Let K/ℚ_ℓ be finite (ℓ ≠ p), σ a topological generator of tame inertia, r̄ : G_K → GL_n(k) with r̄(σ) unipotent with a single Jordan block, and r a lift to A ∈ C_𝒪 with characteristic polynomial of r(σ) equal to (X − 1)^n. Then for every j ≤ n the natural map ker((r(σ) − 1)^j) ⊗_A k → ker((r̄(σ) − 1)^j) is an isomorphism. Hence the unipotent problem R^1 (char r(σ) = (X − 1)^n) equals the minimally… := sorry
* `R08.2/gsp4-ramification-types` (definition): Ramification types U1–U3, P, H of GSp₄-valued residual representations.
  - `TauCeti.GaloisDeformation.Local.GSp4RamType` (data) : The types U1, U2, U3, P, H as a predicate on r̄ : G_x → GSp₄(k). := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4RamType.unipotent_rank` (characterisation) : r̄ is of type U_i iff r̄(I_x) is generated by exp(N) with N ∈ sp₄ nilpotent of rank i. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4RamType.exclusive` (other) : The types U, P, H are mutually exclusive. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4RamType.not_P` (other) : A cyclotomic-power similitude excludes type P. := sorry
  - example `gsp4Type_U1` (computation) : r̄(σ) = exp(E₂₃) = 1 + E₂₃ has rank-one logarithm, so r̄ is U1. := sorry
  - example `gsp4Type_U3_needs_p5` (non-example) : For p = 3, exp(N₃) = 1 + N₃ + N₃²/2 + N₃³/6 is not defined over k; type U3 is stated for p ≥ 5. := sorry
  - example `gsp4Type_unramified` (degenerate) : Unramified r̄ is of no type. := sorry
  - example `gsp4Type_H` (computation) : r̄|I_x absolutely irreducible with x ≡ 2 mod 5, p = 5: x⁴ − 1 ≡ 0 mod 5 is excluded from type H. := sorry
* `R08.2/gsp4-taylor-wiles-lifts` (theorem): GSp₄ lifts at Taylor–Wiles places.
  - theorem `TauCeti.GaloisDeformation.Local.gsp4TaylorWilesLifts` : Let v be a place with q_v ≡ 1 mod p, ρ̄ : G_{F_v} → GSp₄(k) unramified with multiplier ψ unramified, and ρ̄(Frob_v) with four distinct eigenvalues ᾱ₁, ᾱ₂, ᾱ₃ = ψ(Frob_v)/ᾱ₂, ᾱ₄ = ψ(Frob_v)/ᾱ₁. (1) Every lift ρ : G_{F_v} → GSp₄(A) with multiplier ψ is GSp₄(A)-conjugate to γ₁ ⊕ γ₂ ⊕ ψγ₂^{-1} ⊕ ψγ₁^{-1} for unique characters γ_i lifting the unramified γ̄_i with γ̄_i(Frob_v) = ᾱ_i. (2) With Δ_v = k(v)… := sorry
* `R08.2/gsp4-unipotent-local-models` (construction): Local models for GSp₄ Ihara avoidance: nilpotent strata, 𝒩(q) and ℳ(x, y; q).
  - `TauCeti.GaloisDeformation.Local.GSp4.exp₂` (constructor) : exp₂ : 𝒩 → 𝒰, N ↦ I + N + N²/2 + N³/2. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.log₂` (constructor) : log₂ : 𝒰 → 𝒩, U ↦ (U − I) − (U − I)²/2. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.exp₂_log₂` (equivalence) : exp₂ ∘ log₂ = id and log₂ ∘ exp₂ = id. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.exp₂_pow` (relation) : exp₂(mN + m*N³) = exp₂(N)^m, m* = (m − m³)/3. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.nilpotentStratum` (data) : 𝒩_i, the rank-i nilpotent stratum, with representative N_i. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.MSpace` (constructor) : ℳ(x, y; q) ⊂ GSp₄², with ℳ(1, 1; q) ≅ 𝒩(q). := sorry
  - example `exp2_N1` (computation) : exp₂(E₁₄) = I + E₁₄ (E₁₄² = 0). := sorry
  - example `exp2_zero` (degenerate) : exp₂(0) = I and log₂(I) = 0. := sorry
  - example `exp2_not_exp` (non-example) : For N₃ (N₃³ ≠ 0), exp₂(N₃) ≠ exp(N₃) = I + N₃ + N₃²/2 + N₃³/6; exp₂ is not the exponential, but it is a bijection 𝒩 → 𝒰 for p ≥ 3. := sorry
  - example `mstar_integral` (computation) : m* = (m − m³)/3 ∈ ℤ for all m ∈ ℤ, e.g. m = 2 gives m* = −2. := sorry
* `R08.2/gsp4-ihara-avoidance-rings` (theorem): GSp₄ Ihara-avoidance deformation rings.
  - theorem `TauCeti.GaloisDeformation.Local.gsp4IharaAvoidanceRings` : Let v be finite with q_v ≡ 1 mod p, ρ̄ : G_{F_v} → GSp₄(k) trivial, ψ unramified with trivial reduction, and χ = (χ₁, χ₂) continuous characters 𝒪_{F_v}^× → 𝒪^× trivial mod λ. 𝒟_v^χ is the problem of lifts with multiplier ψ such that for σ ∈ I_{F_v}, char ρ(σ) = (X − χ₁(Art^{-1}σ))(X − χ₂(Art^{-1}σ))(X − χ₂(Art^{-1}σ)^{-1})(X − χ₁(Art^{-1}σ)^{-1}), represented by R_v^χ. (1) If χ₁, χ₂ ≠ 1 and χ₁ ≠ χ… := sorry
* `R08.2/g-valued-generic-fibre-away-from-p` (theorem): Generic fibres of G-valued lifting rings away from p and minimally ramified lifts.
  - theorem `TauCeti.GaloisDeformation.Local.gValuedGenericFibreAwayFromP` : Let ℓ ≠ p, K/ℚ_ℓ finite (or a local field of characteristic ℓ), G a smooth affine group over 𝒪 with reductive G⁰, ρ̄ : G_K → G(k) and μ a fixed multiplier. (1) (Bellovin–Gee, Theorem 3.3.3) Spec R^{□,μ}_ρ̄[1/p] is equidimensional of dimension dim G^der, its components are indexed by inertial types up to G⁰-conjugacy, and it has an open dense regular subscheme; the Zariski closure of a component is… := sorry
* `R08.2/equal-characteristic-local-lifts` (theorem): Local lifts at places of global function fields.
  - theorem `TauCeti.GaloisDeformation.Local.equalCharacteristicLocalLifts` : Let F be a global function field of characteristic ℓ ≠ p and v a place. For p ≫_n 0 every ρ̄ : G_{F_v} → GL_n(k) has a p-adic lift; any character G_{F_v} → 1 + ϖ𝒪 has an n-th root when p ∤ n, so the determinant (or multiplier) of the lift can be matched to a prescribed global character μ. The generic-fibre analysis of R08.2/g-valued-generic-fibre-away-from-p (1) holds for R^{□,μ}_ρ̄. := sorry
* `R08.2/reducible-lifts-prescribed-determinant` (theorem): Lifts away from p of reducible residual representations with prescribed determinant.
  - theorem `TauCeti.GaloisDeformation.Local.reducibleLiftsPrescribedDeterminant` : Let p ≥ 3, ρ̄ ∼ (χ̄ ∗; 0 1) a two-dimensional residual representation of G_{F,S} and μ = κ^{r−1}χ₀ a geometric lift of det ρ̄ (r ≥ 2, χ₀ of finite order). For v ∈ S not above p there is, after enlarging 𝒪, a lift ρ_v : G_{F_v} → GL₂(𝒪′) of ρ̄|G_{F_v} with determinant μ, lying on a formally smooth irreducible component of R^{□,μ}_{ρ̄|G_{F_v}}. := sorry
* `R08.2/ihara-avoidance-rings-p2` (theorem): Unipotent ramification and Ihara-avoidance rings at p = 2.
  - theorem `TauCeti.GaloisDeformation.Local.iharaAvoidanceRingsP2` : Let p = 2, v ∤ 2 a finite place, ρ̄ : G_{F_v} → GL_n(k). (1) There is a finite extension F′_v/F_v such that every lift of ρ̄ becomes unipotently ramified on G_{F′_v}. (2) If ρ̄ is unramified with ρ̄(Frob_v) regular semisimple (q_v odd), every lift is strictly equivalent to a direct sum of characters, and becomes unramified over a uniform finite extension. (3) For ρ̄ trivial and finite-order charac… := sorry
* `R08.2/taylor-wiles-block-condition` (construction): The Taylor–Wiles block condition in rank n (including p = 2).
  - `TauCeti.GaloisDeformation.Local.TaylorWilesBlock` (data) : 𝒟^TW_v for a chosen eigenvalue α_v of multiplicity n₁. := sorry
  - `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.decomposition` (constructor) : The lifted decomposition r = A_v ⊕ B_v. := sorry
  - `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.deltaAlgebra` (constructor) : The canonical map 𝒪[Δ_v] → R^TW_v from ψ_v∘Art_{F_v}. := sorry
  - `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.isLocalDeformationProblem` (instance) : 𝒟^TW_v is a local deformation problem. := sorry
  - `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.rank2` (compatibility) : For n = 2, n₁ = 1 it is the Taylor–Wiles local ring of R08.2/taylor-wiles-local-ring. := sorry
  - example `twBlock_rank2` (compatibility) : n = 2, n₁ = 1, distinct eigenvalues: R^TW_v ≅ 𝒪[Δ_v]⟦x, y, B⟧, matching R08.2/taylor-wiles-local-ring. := sorry
  - example `twBlock_full_block` (degenerate) : n₁ = n: lifts are ψ_v·(unramified) on inertia, the ring is formally smooth over 𝒪[Δ_v]. := sorry
  - example `twBlock_p2_delta` (computation) : p = 2: Δ_v = k(v)^×(2), the 2-part, e.g. q_v = 17 gives Δ_v ≅ ℤ/16. := sorry
  - example `twBlock_needs_semisimple` (non-example) : If r̄(Frob_v) is not semisimple on the α_v-block, A_v(Frob_v) = α_v·1 cannot be lifted and the condition is empty. := sorry
* `R08.2/gsp4-minimal-conditions` (construction): Minimal GSp₄ conditions at the ramified primes of types U, P, H.
  - `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt` (data) : The minimal condition at x ∈ S(r̄) according to its type. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.unipotent_rank` (characterisation) : At types U_i the image of inertia is generated by exp(N) with rank N = i. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.rigid` (characterisation) : At types P, H the reduction map is injective on r(I_x). := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.isLocalDeformationProblem` (instance) : Each condition is a local deformation problem. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.U3_eq_unipotent` (compatibility) : At type U3 the condition equals the unipotent problem R^1 and the minimally ramified condition. := sorry
  - example `gsp4Minimal_U3` (compatibility) : Type U3: the minimal condition equals R^1 (single Jordan block, R08.2/regular-unipotent-minimally-ramified). := sorry
  - example `gsp4Minimal_H_rigid` (computation) : Type H with x⁴ − 1 prime to p: r(I_x) ≅ r̄(I_x), a finite group of order prime to p, so the condition is formally smooth. := sorry
  - example `gsp4Minimal_rank_jump` (non-example) : A lift at a U1 prime with r(σ) = exp(N) for N of rank 2 is not minimal: the rank of N must equal that of the residual. := sorry
  - example `gsp4Minimal_unramified` (degenerate) : At primes outside S(r̄) ∪ {p} the minimal condition is 'unramified'. := sorry
* `R08.2/rigid-residual-conditions` (definition): Rigidity of a residual representation for (Σ_min, Σ_lr).
  - `TauCeti.GaloisDeformation.Local.IsRigidFor` (data) : The predicate on r̄ given by the local conditions (1)–(4) at Σ_min, Σ_lr, the places above p and the rest. := sorry
  - `TauCeti.GaloisDeformation.Local.IsRigidFor.minimal` (projection) : For v ∈ Σ_min every lift of r̄_v is minimally ramified. := sorry
  - `TauCeti.GaloisDeformation.Local.IsRigidFor.levelRaising` (projection) : For v ∈ Σ_lr the residual hypothesis of R08.2/level-raising-local-problems holds. := sorry
  - `TauCeti.GaloisDeformation.Local.IsRigidFor.mono` (other) : Rigid for (Σ_min, Σ_lr) and 𝔭 satisfying (2) ⟹ rigid for (Σ_min, Σ_lr ∪ {𝔭}). := sorry
  - example `rigid_empty` (degenerate) : Σ_min = Σ_lr = ∅: rigidity says r̄ is unramified away from p and regular Fontaine–Laffaille at p. := sorry
  - example `rigid_eigenvalue_pair_twice` (non-example) : If r̄^♮_v(φ_w) has the pair {‖v‖^{−N}, ‖v‖^{−N+2}} twice, condition (2) fails and 𝒟^mix is not defined at v. := sorry
  - example `rigid_add_place` (characterisation) : Adding to Σ_lr a place satisfying (2) preserves rigidity (used with 𝔭 in LTXZZ §6.4). := sorry
  - example `rigid_minimal_unramified` (computation) : An unramified r̄_v with every lift unramified satisfies (1). := sorry

### Layer R08.3

* `R08.3/hodge-and-galois-types` (definition): p-adic Hodge types and Galois types.
  - `TauCeti.GaloisDeformation.Local.HodgeType` (structure) : (D_E, Fil^• D_{E,K}) with jumps in [0, h]. := sorry
  - `TauCeti.GaloisDeformation.Local.GaloisType` (structure) : τ : I_K → GL_r(E) with open kernel. := sorry
  - `TauCeti.GaloisDeformation.Local.IsOfType` (constructor) : V_B is potentially semistable of type (τ, v). := sorry
  - `TauCeti.GaloisDeformation.Local.HodgeType.adQuotDim` (characterisation) : dim_E ad D_{E,K}/Fil⁰ = Σ_σ (d² − Σ_j m_{σ,j}²)/2. := sorry
  - example `adQuotDim_regular` (computation) : Regular weights give [K : ℚ_p]·d(d − 1)/2 (for d = 2, K = ℚ_p: 1). := sorry
  - example `adQuotDim_formula` (characterisation) : (d² − Σ m_j²)/2 counts pairs of weights in different jumps; checked for d = 3 with multiplicities (2, 1): (9 − 5)/2 = 2. := sorry
  - example `galoisType_open_kernel` (non-example) : The restriction to I_K of the cyclotomic character has infinite image, so it is not a Galois type. := sorry
* `R08.3/semistable-height-quotient` (theorem): The semistable quotient with Hodge–Tate weights in [0, h].
  - theorem `TauCeti.GaloisDeformation.Local.semistableHeightQuotient` : Let A° be a complete local Noetherian W(𝔽)-algebra, A = A°[1/p], V_{A°} finite free of rank r with continuous G_K-action, and h ≥ 0. There is a quotient A_{st,h} of A such that a map ζ : A → B to a finite ℚ_p-algebra factors through A_{st,h} if and only if V_B = V_A ⊗ B is semistable with Hodge–Tate weights in [0, h]. It carries a projective W_{A_{st,h}}-module D of rank r with semilinear φ and li… := sorry
* `R08.3/hodge-type-components` (lemma): Fixing the p-adic Hodge type selects components.
  - theorem `TauCeti.GaloisDeformation.Local.hodgeTypeComponents` : Fix a p-adic Hodge type v over E and suppose A is an E-algebra. There is a quotient A_{st,v} of A_{st,h}, corresponding to a union of connected components of Spec A_{st,h}, such that ζ : A → B (B a finite E-algebra) factors through A_{st,v} exactly when V_B is semistable of p-adic Hodge type v. := sorry
* `R08.3/pst-deformation-ring` (theorem): Potentially semistable deformation rings of fixed type.
  - theorem `TauCeti.GaloisDeformation.Local.pstDeformationRing` : Let V_𝔽 be a d-dimensional 𝔽-representation of G_K, R^□ = R^□_{V_𝔽} its framed deformation ring over 𝒪_E (R08.1/local-lifting-ring), and (τ, v) a Galois type and a p-adic Hodge type. (1) There is a quotient (R^□[1/p])^{τ,v} of R^□[1/p] such that a map to a finite E-algebra B factors through it exactly when V_B is potentially semistable of type τ and p-adic Hodge type v. It is a union of connected … := sorry
* `R08.3/filtered-phi-N-deformations` (lemma): Deformation theory of filtered (φ, N)-modules with descent data.
  - theorem `TauCeti.GaloisDeformation.Local.filteredPhiNDeformations` : For L/K finite Galois and d ≥ 1, let Mod_{φ,N}(A) (A a ℚ_p-algebra) be the groupoid of finite projective L_0 ⊗ A-modules D_A of rank d, locally free, with semilinear Gal(L/K)-action, nilpotent N and semilinear bijective φ with pφN = Nφ; Mod_{F,φ,N} adds a Gal(L/K)-stable filtration of D_{A,L} by projective submodules. Let C•(D) be the total complex of (ad D)^{G_{L/K}} with the maps 1 − φ, N and pφ… := sorry
* `R08.3/pst-generic-fibre` (theorem): Dimension and generic smoothness of potentially semistable rings.
  - theorem `TauCeti.GaloisDeformation.Local.pstGenericFibre` : Spec (R^□_{V_𝔽}[1/p])^{τ,v} is equidimensional of dimension d² + dim_E ad D_{E,K}/Fil⁰ad D_{E,K} and has a formally smooth dense open subscheme. If End_{𝔽[G_K]}V_𝔽 = 𝔽, the same holds for (R_{V_𝔽}[1/p])^{τ,v} with dimension 1 + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}. Consequently a nonzero R^{□,τ,v} has Krull dimension 1 + d² + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}, and fixing the determinant lowers these dime… := sorry
* `R08.3/pcris-generic-smooth` (theorem): Potentially crystalline rings are generically smooth.
  - theorem `TauCeti.GaloisDeformation.Local.pcrisGenericSmooth` : Spec (R^□_{V_𝔽}[1/p])^{τ,v}_cr is formally smooth and equidimensional of dimension d² + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}; for End_{𝔽[G_K]}V_𝔽 = 𝔽 the unframed version has dimension 1 + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}. In particular (R^□[1/p])^{τ,v}_cr is reduced, and R^{□,τ,v}_cr[1/p] = (R^□[1/p])^{τ,v}_cr. In the Fontaine–Laffaille range (K/ℚ_p unramified, τ trivial, distinct weights whose maximum… := sorry
* `R08.3/pst-coefficient-change` (lemma): Potentially semistable rings under change of coefficients.
  - theorem `TauCeti.GaloisDeformation.Local.pstCoefficientChange` : For a finite extension 𝒪_E → 𝒪_{E′} (possibly with a residue field extension 𝔽 ⊆ 𝔽′), R^{□,τ,v}_{V_𝔽 ⊗ 𝔽′, 𝒪_{E′}} ≅ R^{□,τ,v}_{V_𝔽, 𝒪_E} ⊗_{𝒪_E} 𝒪_{E′}, compatibly with R^□_{V_𝔽⊗𝔽′,𝒪_{E′}} ≅ R^□_{V_𝔽,𝒪_E} ⊗̂_{𝒪_E} 𝒪_{E′} (R08.1/local-residue-field-change); likewise for the crystalline and unframed variants. := sorry
* `R08.3/pst-quotient-in-families` (theorem): Potentially semistable loci in families over a complete local base.
  - theorem `TauCeti.GaloisDeformation.Local.pstQuotientInFamilies` : Let E/ℚ_p be finite, A° a Noetherian complete local 𝒪_E-algebra with finite residue field, A = A°[1/p], and V_{A°} a finite free A°-module of rank r with a continuous G_K-action (K/ℚ_p finite). (1) (Kisin 2.5.5) For h ≥ 0 there is a quotient A^{st,h} of A such that a map of ℚ_p-algebras ζ : A → B to a finite ℚ_p-algebra B factors through it iff V_B = V_A ⊗_A B is semistable with Hodge–Tate weights… := sorry
* `R08.3/g-valued-pst-rings` (theorem): G-valued potentially semistable lifting rings (Balaji, Bellovin–Gee).
  - theorem `TauCeti.GaloisDeformation.Local.gValuedPstRings` : Let K/ℚ_p be finite, G a smooth affine 𝒪-group with reductive G⁰, ρ̄ : G_K → G(k), τ : I_K → G(Ē) an inertial type up to G⁰(Ē)-conjugacy and v a p-adic Hodge type (a conjugacy class of cocharacters). (1) (Balaji) There is a unique reduced 𝒪-flat quotient R^{□,τ,v}_ρ̄ of R^□_{ρ̄,G} (R08.1/g-valued-framed-ring) whose E′-points (E′/E finite) are exactly the lifts that are potentially semistable of ty… := sorry
* `R08.3/weil-deligne-type-ring` (construction): Rings of fixed Weil–Deligne type cut out of pseudo-character deformation rings (R_{B,M}).
  - `TauCeti.GaloisDeformation.Local.WDTypeRing` (data) : R_{B,M} = R^{ps,δ_M}_B[1/p]/I_{B,M} and its integral model R^+_{B,M}. := sorry
  - `TauCeti.GaloisDeformation.Local.WDTypeRing.points` (characterisation) : A maximal ideal of R^{ps,δ_M}_B[1/p] contains I_{B,M} iff the specialised pseudo-character is the trace of a de Rham representation of weights {0, 1} and Weil–Deligne type M. := sorry
  - `TauCeti.GaloisDeformation.Local.WDTypeRing.reduced` (other) : R_{B,M} is reduced and Jacobson. := sorry
  - `TauCeti.GaloisDeformation.Local.WDTypeRing.pid` (structure) : R_{B,M} is a finite product of principal ideal domains (bounded analytic functions on an open of ℙ¹). := sorry
  - `TauCeti.GaloisDeformation.Local.WDTypeRing.universalRep` (constructor) : The representation ρ_{B,M} with Tr ρ_{B,M} = the universal pseudo-character. := sorry
  - example `wdTypeRing_points_typeM` (characterisation) : Every maximal ideal x of R_{B,M} gives ρ_x de Rham of weights {0, 1} with WD(ρ_x) ≅ M (Frobenius included). := sorry
  - example `wdTypeRing_vs_galois_type` (non-example) : Fixing only the Galois type τ = M|_{I_{ℚ_p}} gives a ring of larger dimension (an unramified twist parameter); R_{B,M} fixes the Frobenius as well and so is one-dimensional (a product of PIDs). := sorry
  - example `wdTypeRing_empty_block` (degenerate) : If no de Rham representation of type M has reduction in B, I_{B,M} is the unit ideal and R_{B,M} = 0. := sorry
  - example `wdTypeRing_trace` (compatibility) : Tr ∘ ρ_{B,M} equals the image of the universal pseudo-character of R^{ps,δ_M}_B. := sorry
* `R08.3/bcdt-type-rings` (comparison): Breuil–Conrad–Diamond–Taylor type rings as Kisin rings.
  - theorem `TauCeti.GaloisDeformation.Local.bcdtTypeRings` : Let ℓ be a prime, ρ̄ : G_ℓ → GL(V) two-dimensional over k with End_{k[G_ℓ]} V = k, and R_{V,𝒪} its universal deformation ring. An ℓ-type τ is a class of two-dimensional τ : I_ℓ → GL(D) over ℚ̄_ℓ with open kernel extending to W_{ℚ_ℓ}; an extended ℓ-type τ′ a class of τ′ : W_{ℚ_ℓ} → GL(D′) with open kernel. ρ over K is of type τ (resp. τ′) if it is Barsotti–Tate over every finite F/ℚ_ℓ with τ|_{I_F}… := sorry
* `R08.3/fixed-determinant-pst-rings` (theorem): Fixed-determinant crystalline and ordinary rings as power-series quotients.
  - theorem `TauCeti.GaloisDeformation.Local.fixedDeterminantPstRings` : Let p ∤ n, λ a dominant weight, ρ̄ : G_K → GL_n(k), and ψ : G_K → 𝒪^× a crystalline character lifting det ρ̄ with τ-labelled Hodge–Tate weight Σ_i λ_{τ,i} + (n − i). For R = R^{cris,λ}_ρ̄ (resp. R^{△,λ}_ρ̄, L7/semistable-ordinary-quotient) put R^ψ = R ⊗_{R^□_ρ̄} R^{□,ψ}_ρ̄. Then the quotient map R → R^ψ has a section extending to an isomorphism R^ψ⟦X⟧ ≅ R; in particular R^ψ is 𝒪-flat and reduced, … := sorry

### Layer L7

* `L7/finite-height-lattices` (definition): Lattices of finite E-height.
  - `TauCeti.GaloisDeformation.Local.HeightLattice` (structure) : An 𝔖_B-lattice of E-height ≤ h in M_B. := sorry
  - `TauCeti.GaloisDeformation.Local.HasEHeightLE` (constructor) : V has E-height ≤ h. := sorry
  - `TauCeti.GaloisDeformation.Local.HeightLattice.baseChange` (functoriality) : Base change along B → B′. := sorry
  - `TauCeti.GaloisDeformation.Local.HeightLattice.unique` (characterisation) : Uniqueness over finite flat ℤ_p-algebras. := sorry
  - example `height_rank_one_E` (computation) : 𝔐 = 𝔖e with φ(e) = E(u)e has E-height exactly 1. := sorry
  - example `height_zero_iff_etale` (characterisation) : E-height ≤ 0 if and only if φ*𝔐 → 𝔐 is an isomorphism. := sorry
  - example `height_u_not_finite` (non-example) : φ(e) = ue: E(u)^h is never divisible by u in 𝔖 (E(0) = p·unit), so 𝔖/u𝔖 is killed by no power of E(u). := sorry
* `L7/height-lattice-moduli` (theorem): Moduli of lattices of bounded E-height and their image.
  - theorem `TauCeti.GaloisDeformation.Local.heightLatticeModuli` : Let A be a complete local Noetherian ring with finite residue field 𝔽 and V_A finite free of rank d with continuous G_{K_∞}-action. (1) On A-algebras B with 𝔪_A^i B = 0 for some i, B ↦ {𝔖_B-lattices of E-height ≤ h in M_B} is represented by a projective A-scheme Θ_A : 𝓛^{≤h}_{V_A} → Spec A, compatible with base change and carrying a canonical very ample line bundle. (2) Θ_A becomes a closed immers… := sorry
* `L7/ordinary-flag-scheme` (construction): The ordinary flag scheme and its image ring R^△_v.
  - `TauCeti.GaloisDeformation.Local.ordinaryFlagScheme` (constructor) : 𝒢_v ⊂ 𝓕 × Spec R^□_v. := sorry
  - `TauCeti.GaloisDeformation.Local.ordinaryFlagScheme_proper` (characterisation) : 𝒢_v → Spec R^□_v is proper. := sorry
  - `TauCeti.GaloisDeformation.Local.ordinaryFlagImage` (constructor) : R^△_v = im(R^□_v → H⁰(𝒢_v, 𝒪)). := sorry
  - `TauCeti.GaloisDeformation.Local.ordinaryFlagImage_points` (characterisation) : The domain point criterion. := sorry
  - example `ordinaryFlagImage_n_one` (degenerate) : n = 1: every line is a flag, and R^△_v = R^□_v/(ρ|_{I_{F_v}} − χ_1^univ). := sorry
  - example `ordinaryFlagScheme_permuted` (characterisation) : Requiring I_{F_v} to act on the i-th piece by χ^univ_{σ(i)} for σ ∈ S_n gives the variant R^{△,σ}_v used in the proof of L8/determinant-flag-comparison. := sorry
  - example `ordinaryFlagImage_not_flag` (non-example) : A point of R^△_v need not carry a flag over R itself, only over the algebraic closure of its fraction field. := sorry
* `L7/trivial-residual-flag-ring` (theorem): The flag image ring for trivial residual representation.
  - theorem `TauCeti.GaloisDeformation.Local.trivialResidualFlagRing` : (ACC+ Proposition 6.2.10, from Thorne [Tho15, Proposition 3.14].) If [F_v : ℚ_p] > n(n − 1)/2 + 1 and ρ̄ is trivial, then R^△_v is 𝒪-flat, reduced and equidimensional of dimension 1 + n² + n(n + 1)/2 · [F_v : ℚ_p], and Spec R^△_v → Spec Λ_v is bijective on generic points, hence on irreducible components. := sorry
* `L7/residually-split-nearly-ordinary-ring` (theorem): Nearly ordinary rings of a p-distinguished split residual representation.
  - theorem `TauCeti.GaloisDeformation.Local.residuallySplitNearlyOrdinaryRing` : (Skinner–Wiles Lemma 2.2 and Corollary 2.3.) Let n = 2, ρ_0 = χ ⊕ 1 on D = G_{F_v} with χ ≠ 1, d = [F_v : ℚ_p] and ω the mod-p cyclotomic character of D. There are a versal local 𝒪-deformation ρ : D → GL₂(R) of ρ_0 with det = χ̃ and a versal nearly ordinary deformation ρ_ord = (χ̃Ψ *; 0 Ψ^{−1}), Ψ ≡ 1, over R_ord, with R_ord ≅ 𝒪[[x_1, …, x_{2d+2}]]/(f) if χ = ω or ω = 1, and R_ord ≅ 𝒪[[x_1, …, x_{… := sorry
* `L7/fontaine-laffaille-deformation-condition` (construction): The Fontaine–Laffaille deformation condition.
  - `TauCeti.GaloisDeformation.Local.FLModule` (structure) : Objects of 𝓜𝓕_{𝒪,ṽ}: filtered 𝒪_{F_ṽ} ⊗ 𝒪-modules with the Φ^i. := sorry
  - `TauCeti.GaloisDeformation.Local.flFunctor` (constructor) : 𝐆_ṽ(M) = U_S(Hom(M, F_ṽ/𝒪_{F,ṽ}{l − 2}))(2 − l). := sorry
  - `TauCeti.GaloisDeformation.Local.flFunctor_fullyFaithful` (characterisation) : 𝐆_ṽ is exact and fully faithful, with image closed under subobjects and quotients. := sorry
  - `TauCeti.GaloisDeformation.Local.FLDeformation` (data) : The condition 𝒟_ṽ on lifts. := sorry
  - `TauCeti.GaloisDeformation.Local.FLDeformation.liftable` (characterisation) : Lemma 2.4.1. := sorry
  - example `fl_rank_one` (degenerate) : For n = 1 the tangent space is the unramified classes H¹(G/I, ad r̄) (Corollary 2.4.4). := sorry
  - example `fl_elliptic_curve` (computation) : E[l] for E with good reduction at an unramified l ≥ 3: weights {0, 1} are in range and multiplicity-free. := sorry
  - example `fl_weight_out_of_range` (non-example) : A crystalline character with Hodge–Tate weight l − 1 is outside 𝓜𝓕 (Fil^{l−1}M = 0 is required). := sorry
  - example `fl_repeated_weight` (non-example) : r̄ = ε ⊕ ε violates the multiplicity-one hypothesis for n = 2. := sorry
* `L7/fontaine-laffaille-tangent-space-and-smoothness` (theorem): Fontaine–Laffaille deformations: tangent space and smoothness (CHT Lemma 2.4.2, Corollaries 2.4.3–2.4.4, Lemma 2.4.5).
  - theorem `TauCeti.GaloisDeformation.Local.fontaineLaffailleTangentSpaceAndSmoothness` : (Lemma 2.4.2.) For M, N in 𝓜𝓕_{k,ṽ} there is an exact sequence 0 → Hom_{𝓜𝓕}(M, N) → Fil⁰Hom(M, N) → Hom_{Fr⊗1}(gr M, N) → Ext¹_{𝓜𝓕}(M, N) → 0, the middle map sending β to (βΦ^i_M − Φ^i_Nβ). (Corollary 2.4.3.) dim_k L_ṽ − dim_k H⁰(G_{F_ṽ}, ad r̄) = [F_ṽ : ℚ_l]·n(n − 1)/2, and R_ṽ^{loc}/𝓘_ṽ is a power series ring over 𝒪 in n² + [F_ṽ : ℚ_l]·n(n − 1)/2 variables. (Corollary 2.4.4.) If n = 1 then L_ṽ =… := sorry
* `L7/ordinary-condition-fixed-inertial-characters` (construction): Ordinary deformations with fixed inertial characters on a full flag (CHT §2.4.2).
  - `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia` (data) : The condition 𝒟_v with its characters χ_{v,i}. := sorry
  - `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.filtration` (constructor) : The filtration Fil^i of a lift in 𝒟_v. := sorry
  - `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.filtration_unique` (characterisation) : Lemma 2.4.6(1). := sorry
  - `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.filtration_baseChange` (compatibility) : Lemma 2.4.6(2). := sorry
  - `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.isLocalDeformationProblem` (instance) : Lemma 2.4.6(3). := sorry
  - example `ord_n1` (degenerate) : For n = 1, 𝒟_v is the lifts with inertial character χ_{v,0}. := sorry
  - example `ord_n2_distinct` (computation) : For n = 2 and r̄ = (χ̄_0 *; 0 χ̄_1) with χ̄_0/χ̄_1 ≠ 1, ω, the filtration is the unique line with character χ̄_0. := sorry
  - example `ord_cyclotomic_ratio_excluded` (non-example) : r̄ = ω ⊕ 1 on G_{ℚ_l} with ω on the sub (χ̄_1 = ω, χ̄_0 = 1, l > 3) satisfies CHT's printed (2) but not (2′); there H²(G, k(ω)) ≠ 0 and the ring is not formally smooth (E2). := sorry
  - example `ord_vs_flag_scheme` (compatibility) : The lifts in 𝒟_v are the points of L7/ordinary-flag-scheme's image over the fixed characters. := sorry
* `L7/ordinary-fixed-inertial-characters-smoothness` (theorem): Ordinary deformations with fixed inertial characters are formally smooth (CHT Lemmas 2.4.7–2.4.8).
  - theorem `TauCeti.GaloisDeformation.Local.ordinaryFixedInertialCharactersSmoothness` : Under (2′): (Lemma 2.4.7.) 𝒟_v is liftable. (Lemma 2.4.8.) R_v^{loc}/𝓘_v is a power series ring over 𝒪 in n² + [F_ṽ : ℚ_l]·n(n − 1)/2 variables, and dim_k L_v − dim_k H⁰(G_{F_ṽ}, ad r̄) = [F_ṽ : ℚ_l]·n(n − 1)/2. := sorry
* `L7/discrete-series-deformation-condition` (construction): Discrete series deformations away from l (CHT §2.4.5).
  - `TauCeti.GaloisDeformation.Local.DiscreteSeriesType` (structure) : (m, d, r̃_v) with conditions (1)–(3). := sorry
  - `TauCeti.GaloisDeformation.Local.IsDiscreteSeriesLift` (data) : Definition 2.4.24: the filtration with gr^i ≅ gr⁰(i) and gr⁰|_I ≅ r̃_v|_I ⊗ R. := sorry
  - `TauCeti.GaloisDeformation.Local.IsDiscreteSeriesLift.filtration_unique` (characterisation) : Lemma 2.4.25. := sorry
  - `TauCeti.GaloisDeformation.Local.discreteSeriesDeformation` (instance) : Lemma 2.4.26: a local deformation problem. := sorry
  - `TauCeti.GaloisDeformation.Local.DiscreteSeriesType.induced` (characterisation) : Lemma 2.4.23: r̃_v ≅ Ind s_v. := sorry
  - example `ds_steinberg` (compatibility) : d = 1, m = n, r̃_v trivial: the unipotent-monodromy (Steinberg) lifts with Frobenius eigenvalues α, qα, …, q^{n−1}α. := sorry
  - example `ds_m1` (degenerate) : m = 1: lifts with ρ|_I ≅ r̃_v|_I ⊗ R, i.e. minimally ramified type r̃_v. := sorry
  - example `ds_condition3_fails` (non-example) : If q ≡ 1 mod l then k(1) ≅ k and condition (3) fails for i = 1. := sorry
  - example `ds_induced_type` (computation) : d = 2 with r̃_v induced from the unramified quadratic extension (a supercuspidal type). := sorry
* `L7/discrete-series-smoothness` (theorem): Discrete series deformations are formally smooth of relative dimension n² (CHT Lemmas 2.4.27–2.4.30).
  - theorem `TauCeti.GaloisDeformation.Local.discreteSeriesSmoothness` : (Lemma 2.4.27.) 𝒟_v is liftable. (Lemma 2.4.28.) R_v^{loc}/𝓘_v is a power series ring in n² variables over 𝒪. (Corollary 2.4.29.) dim_k L_v = dim_k H⁰(G_{F_ṽ}, ad r̄). (Lemma 2.4.30.) If d = 1 and m = n, with Fil¹ ad r̄ the endomorphisms x with x Fil^i r̄ ⊂ Fil^{i+1} r̄, then L_v = H¹(G/I, k1_n) ⊕ ker(H¹(G, ad⁰r̄) → H¹(G, ad r̄/Fil¹ ad r̄)). := sorry
* `L7/ordinary-of-weight-lambda` (definition): Ordinary representations of weight λ.
  - `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight` (data) : The predicate: ρ has a G_K-stable full flag whose graded characters χ_i satisfy χ_i∘Art_K ≡ Π_τ τ^{−(λ_{τ,n−i+1}+i−1)} up to finite order on 𝒪_K^×. := sorry
  - `TauCeti.GaloisDeformation.Local.IsSemistableOrdinaryOfWeight` (data) : The same with equality on I_K. := sorry
  - `TauCeti.GaloisDeformation.Local.IsSemistableOrdinaryOfWeight.isOrdinary` (other) : Semistable-ordinary of weight λ implies ordinary of weight λ. := sorry
  - `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight.potentiallySemistable` (compatibility) : Ordinary of weight λ implies potentially semistable of Hodge type v_λ; semistable-ordinary implies semistable of type v_λ. := sorry
  - `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight.flag_unique` (characterisation) : If the χ_i are pairwise distinct on I_K, the flag is unique. := sorry
  - `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight.restrict` (functoriality) : Ordinary of weight λ is preserved by restriction to G_{K′} (with the restricted weight). := sorry
  - example `ordinaryWeight_n1` (computation) : n = 1, λ = (λ_τ): χ_p^{-1}-normalised, ρ = χ_λ·(unramified) is ordinary of weight λ; ρ = χ_λ·ω (ω of order p) is ordinary but not semistable-ordinary. := sorry
  - example `ordinaryWeight_weight_zero` (degenerate) : λ = 0, n = 2: ordinary of weight 0 means a stable line with characters ψ₁·(finite) and ψ₂·χ_p^{−1}·(finite), Hodge–Tate weights {0, 1} with HT(χ_p) = −1. := sorry
  - example `ordinaryWeight_charpoly_not_enough` (non-example) : Over B = E[ε]/ε², a lift ρ_B of an ordinary ρ whose characteristic polynomials agree with those of an ordinary representation of weight λ need not preserve any full flag over B when two graded characters of ρ coincide; equality of characteristic polynomials does not imply ordinary (L8/distinct-characters-flag). := sorry
  - example `ordinaryWeight_KW` (compatibility) : For n = 2, K/ℚ_p unramified and λ = (k − 2, 0), ordinary of weight λ with semistable normalisation is KW II Definition 3.4(2) (a stable rank-one W with inertia on W by χ_p^{k−1} up to finite order, trivial on V/W). := sorry
* `L7/semistable-ordinary-quotient` (theorem): Semistable-ordinary quotients of semistable lifting rings.
  - theorem `TauCeti.GaloisDeformation.Local.semistableOrdinaryQuotient` : Let λ be dominant for (Res_{K/ℚ_p} GL_n)_E and ρ̄ : G_K → GL_n(k). (1) (Kisin) There are unique 𝒪-flat quotients R^{st,λ}_ρ̄ and R^{cris,λ}_ρ̄ of R^□_ρ̄ whose maps to finite E-algebras B are exactly the lifts that are semistable (resp. crystalline) of p-adic Hodge type v_λ; R^{st,λ}_ρ̄ is reduced (Bellovin–Gee) and R^{cris,λ}_ρ̄[1/p] is regular. (2) If B is a finite local E-algebra, ρ_B semistable… := sorry
* `L7/g-valued-ordinary-condition` (definition): G-valued ordinary representations of weight λ.
  - `TauCeti.GaloisDeformation.Local.canonicalTorus` (data) : T_G = B/R_u(B), canonically independent of B. := sorry
  - `TauCeti.GaloisDeformation.Local.chiLambda` (constructor) : χ_λ : I_{F_v} → T_G(𝒪) attached to cocharacters λ_τ. := sorry
  - `TauCeti.GaloisDeformation.Local.IsGOrdinary` (data) : ρ : G_{F_v} → G(A) is F′_v-ordinary of weight λ. := sorry
  - `TauCeti.GaloisDeformation.Local.IsGOrdinary.gl` (compatibility) : For G = GL_n, IsGOrdinary is IsOrdinaryOfWeight of L7/ordinary-of-weight-lambda (with finite-order ambiguity absorbed by F′_v). := sorry
  - `TauCeti.GaloisDeformation.Local.IsGOrdinary.map` (functoriality) : Ordinarity is preserved by central isogenies G → G′ with the induced weight. := sorry
  - example `gOrdinary_torus` (degenerate) : G = T a torus: B = T, T_G = T and ρ is F′_v-ordinary of weight λ iff ρ|I_{F′_v} = χ_λ. := sorry
  - example `gOrdinary_GL2` (compatibility) : G = GL₂: agrees with L7/ordinary-of-weight-lambda for n = 2. := sorry
  - example `gOrdinary_GSp4` (computation) : G = GSp₄, λ regular: ordinary means a stable symplectic full flag with graded characters (χ₁, χ₂, ε^{-1}χ₂^{-1}, ε^{-1}χ₁^{-1}) of the prescribed inertial weights (BCGP25 §1.8.10). := sorry
  - example `gOrdinary_not_residual` (non-example) : The definition is for lifts to finite E-algebras; a residual ρ̄ with a stable Borel is not 'ordinary of weight λ' (χ_λ mod 𝔪 loses the weight). := sorry
* `L7/g-valued-ordinary-quotient` (construction): The G-valued ordinary flag scheme and the ordinary quotient R^{△λ}.
  - `TauCeti.GaloisDeformation.Local.gOrdinaryFlagScheme` (data) : 𝒢_λ ⊂ Fl_G ×_𝒪 Spec R^{□,v_λ}_ρ̄. := sorry
  - `TauCeti.GaloisDeformation.Local.gOrdinaryFlagScheme.isClosed` (characterisation) : 𝒢_λ is a closed subscheme, with the ideal of (1) including the central generators. := sorry
  - `TauCeti.GaloisDeformation.Local.gOrdinaryFlagScheme.proper` (other) : 𝒢_λ → Spec R^{□,v_λ}_ρ̄ is proper. := sorry
  - `TauCeti.GaloisDeformation.Local.gOrdinaryRing` (constructor) : R^{△λ}_ρ̄, the scheme-theoretic image of 𝒢_λ[1/p]. := sorry
  - `TauCeti.GaloisDeformation.Local.gOrdinaryRing_points` (characterisation) : Point criterion (3). := sorry
  - `TauCeti.GaloisDeformation.Local.gOrdinaryRing.gl` (compatibility) : For G = GL_n, R^{△λ}_ρ̄ is the weight-λ specialisation of L7/ordinary-flag-scheme's image ring, intersected with the Hodge type v_λ. := sorry
  - example `gOrdinaryRing_GL1` (degenerate) : G = GL₁: R^{△λ}_ρ̄ = R_ρ̄/(ρ(σ) − χ_λ(σ) : σ ∈ I_{F′_v}) up to the p-torsion-free generic fibre (R08.1/rank-one-ring). := sorry
  - example `gOrdinaryRing_central_generators` (non-example) : Without the generators ψ(t) − ψ(χ_λ(σ)) the scheme 𝒢_λ for G = GL₁ would be all of Spec R^{□,v_λ}, which contains non-ordinary points. := sorry
  - example `gOrdinaryRing_points_GL2` (computation) : G = GL₂, F_v = ℚ_p, λ = (1, 0): E-points of R^{△λ} are the crystalline-over-F′_v lifts (ψ₁χ_p ∗; 0 ψ₂) with ψ_i potentially unramified. := sorry
  - example `gOrdinaryRing_compat` (compatibility) : For G = GL_n and F′_v = F_v the points agree with those of L7/semistable-ordinary-quotient. := sorry
* `L7/g-valued-ordinary-components` (theorem): The G-valued ordinary locus is a union of components.
  - theorem `TauCeti.GaloisDeformation.Local.gValuedOrdinaryComponents` : Keep L7/g-valued-ordinary-quotient with λ dominant regular. R^{△λ}_ρ̄ is a union of irreducible components of R^{□,v_λ}_ρ̄; hence R^{△λ}_ρ̄[1/p] has an open dense regular subscheme and all its components have dimension dim G + [F_v:ℚ_p]·dim Fl_G. With a fixed multiplier μ : G_{F_v} → (G/G^der)(𝒪), the same holds with dim G^der in place of dim G. := sorry
* `L7/snowden-ordinary-ring-trivial-residual` (theorem): The two-dimensional ordinary ring of the trivial representation (Snowden).
  - theorem `TauCeti.GaloisDeformation.Local.snowdenOrdinaryRingTrivialResidual` : Let p be odd, F_v/ℚ_p finite, ρ̄ : G_{F_v} → GL₂(k) trivial, ε_p trivial on G_{F_v} mod p, and R^△_v = R^{△,(0,0),ψ}_v the fixed-determinant (ψ = ε_p^{-1}) semistable-ordinary ring of weight 0 (L7/semistable-ordinary-quotient, R08.3/fixed-determinant-pst-rings). (1) Spec R^△_v is equidimensional of dimension [F_v:ℚ_p] + 4 with two irreducible components X^cr = Spec R^{△,cr}_v and X^st = Spec R^{△,… := sorry
* `L7/ordinary-ring-with-frobenius-eigenvalue` (construction): The ordinary ring with a Frobenius eigenvalue for trivial ρ̄|G_p (Calegari–Geraghty R̃†).
  - `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue` (data) : R̃† with the universal pair (ρ, α) satisfying (1)–(6). := sorry
  - `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.forget` (projection) : R† → R̃†, forgetting α; R† is the image. := sorry
  - `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.beta_relation` (relation) : β² − (φ₁ + φ₄)β − (φ₁ + φ₄) = 0, α = 1 + β. := sorry
  - `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.unr` (constructor) : R^unr and R̃^unr = R̃† ⊗_{R†} R^unr. := sorry
  - `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.unramifiedIdeal` (constructor) : I = ker(R^univ → R^unr). := sorry
  - `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.doublingIdeal` (constructor) : J = Ann_{R^univ}(R̃†/R†). := sorry
  - example `eigenvalueRing_unr_presentation` (computation) : R^unr ≅ 𝒪/ϖ^m⟦φ₁, …, φ₄⟧/(φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃) and R̃^unr ≅ R^unr[β]/(β² − (φ₁ + φ₄)β − (φ₁ + φ₄)) ≅ R^unr ⊕ R^unr, with ϖ^m the largest power dividing all χ^{n−1}(g) − 1, g ∈ D_p. := sorry
  - example `eigenvalueRing_rank_two` (characterisation) : R̃† ⊗_{R†} Frac(R†) has degree 2 over Frac(R†) (two eigenvalues). := sorry
  - example `eigenvalueRing_not_flag_free` (non-example) : R† ≠ R̃†: the ring with an eigenvalue is not the image ring; their difference is measured by J. := sorry
  - example `eigenvalueRing_trace_relation` (computation) : α + α^{-1} = 2 + φ₁ + φ₄ in R̃†. := sorry
* `L7/eigenvalue-ring-normal-cm-type-three` (theorem): R̃† is a normal Cohen–Macaulay domain of relative dimension 4 and type 3.
  - theorem `TauCeti.GaloisDeformation.Local.eigenvalueRingNormalCmTypeThree` : Keep L7/ordinary-ring-with-frobenius-eigenvalue. (1) R̃† is an integral domain, normal and Cohen–Macaulay of relative dimension 4 over 𝒪; R̃† ⊗ k is a normal Cohen–Macaulay domain of dimension 4, not Gorenstein, isomorphic to the completion of Snowden's variety B₁ at b = (1, 1; 0): A := k⟦a, b, c, φ₁, φ₂, φ₃, φ₄, β⟧/(φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃, β² − (φ₁ + φ₄)β − (φ₁ + φ₄), aφ₁ + bφ₃ − aβ, aφ₂ + bφ₄ − b… := sorry
* `L7/gsp4-siegel-ordinary-condition` (construction): The Siegel-ordinary GSp₄ condition at p with fixed multiplier (Calegari–Geraghty).
  - `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary` (data) : The local deformation problem of Siegel-ordinary lifts with multiplier ε^{−(a−1)}. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary.plane` (constructor) : The stable unramified Lagrangian plane of a lift in the condition. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary.plane_unique` (characterisation) : Under the genericity condition the plane is unique and lifts the residual one. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary.tangent` (characterisation) : The tangent space of the condition is L_p ⊂ H¹(G_p, ad⁰r̄). := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary.isOrdinary` (compatibility) : Every lift in the condition is G-ordinary of the corresponding (non-regular) weight in the sense of L7/g-valued-ordinary-condition with the Siegel parabolic. := sorry
  - example `siegelOrdinary_u_dim` (computation) : dim u = 3 (root spaces (1,4), (2,3) and (1,3) ~ (2,4) in sp₄). := sorry
  - example `siegelOrdinary_not_borel_ordinary` (non-example) : A lift conjugate to an upper-triangular form with non-zero (1, 2)-entry is Borel-ordinary but not Siegel-ordinary. := sorry
  - example `siegelOrdinary_residual` (degenerate) : For R = k the condition is the residual shape itself. := sorry
  - example `siegelOrdinary_multiplier` (computation) : Every lift in the condition has multiplier ε^{−(a−1)}: (χ_αψ^{-1})(ε^{−(a−1)}χ_α^{-1}ψ) = ε^{−(a−1)}. := sorry
* `L7/gsp4-siegel-ordinary-tangent` (theorem): Tangent dimension of the Siegel-ordinary condition and its comparison with finite flatness.
  - theorem `TauCeti.GaloisDeformation.Local.gsp4SiegelOrdinaryTangent` : Keep L7/gsp4-siegel-ordinary-condition. (1) b⁰/u ≅ 1 ⊕ 1 ⊕ λ(α)λ(β)^{-1} as k[G_p]-modules, u ≅ λ(α²)ε̄^{a−1} ⊕ λ(β²)ε̄^{a−1} ⊕ λ(αβ)ε̄^{a−1}, and h⁰(G_p, g⁰/b⁰) = 0; hence h⁰(G_p, u) = h²(G_p, u) = 0, h¹(G_p, u) = 3, H¹(G_p, b⁰) ↠ H¹(G_p, b⁰/u) and H¹(G_p, b⁰) ↪ H¹(G_p, g⁰). (2) dim_k L_p − dim_k H⁰(G_p, ad⁰r̄) = 3. (3) The condition at p is equivalent to r|G_p being ordinary of fixed weight; for… := sorry
* `L7/gsp4-borel-ordinary-conditions` (construction): p-distinguished weight-two ordinary GSp₄ conditions (B- and P-ordinary).
  - `TauCeti.GaloisDeformation.Local.GSp4.IsPDistinguishedOrdinary` (data) : The residual and lifted p-distinguished weight-2 ordinary shapes. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.BorelOrdinary` (constructor) : 𝒟^{B,𝔠̄}_v over Λ_{v,2}, represented by R^{B,𝔠̄}_v. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.ParabolicOrdinary` (constructor) : 𝒟^P_v over Λ_{v,1}, represented by R^P_v. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.partiallyFramed` (other) : R^B and R^P are formally smooth over the B- and P-framed rings R^{B,◹}, R^{P,◹} (BCGP21 Lemma 7.3.12). := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.BorelOrdinary.semistable` (compatibility) : Every characteristic-zero point of R^{B,𝔠̄}_v is semistable (L7/g-valued-ordinary-quotient (4)). := sorry
  - example `gsp4BorelOrdinary_weightAlgebra` (computation) : Λ_{v,2} = 𝒪⟦(1 + pℤ_p)²⟧ ≅ 𝒪⟦x₁, x₂⟧ for p > 2. := sorry
  - example `gsp4BorelOrdinary_not_distinguished` (non-example) : ᾱ = β̄ is excluded: the residual Lagrangian plane then carries a two-dimensional unramified isotypic piece and the flag is not unique. := sorry
  - example `gsp4BorelOrdinary_semistable_not_crystalline` (characterisation) : When α² = 1, the rank-two subquotient on the first and fourth basis vectors may be the non-split extension of ε^{-1}λ_α^{-1} by λ_α given by the Kummer class of p in H¹(ℚ_p, E(ε)) = H¹(ℚ_p, E(ελ_α²)); such a lift is p-distinguished weight-2 ordinary and semistable but not crystalline, so the condition is not the crystalline condition. := sorry
  - example `gsp4BorelOrdinary_closed_immersion` (compatibility) : For p-distinguished ρ̄ the flag-incidence map of L7/gsp4-ordinary-flag-incidence is a closed immersion with image R^{B,𝔠̄}_v. := sorry
* `L7/gsp4-ordinary-generic-fibres` (theorem): Generic fibres of the GSp₄ ordinary rings: irreducibility, dimension and smooth pure points.
  - theorem `TauCeti.GaloisDeformation.Local.gsp4OrdinaryGenericFibres` : Keep L7/gsp4-borel-ordinary-conditions (p > 2, F_v = ℚ_p, ρ̄ p-distinguished weight 2 ordinary). (1) R^{B,𝔠̄}_v[1/p] and R^P_v[1/p] are irreducible, of relative dimensions 16 and 14 over ℚ_p. (2) R^{P,univ} and R^P are complete intersections, connected in characteristic zero, with non-smooth locus in characteristic zero of codimension at least two; R^{P,univ}[1/p] and R^P[1/p] are irreducible of d… := sorry
* `L7/gl2-borel-ordinary-ring` (theorem): The GL₂ ordinary ring R^{B₂}: irreducible generic fibre and explicit presentations.
  - theorem `TauCeti.GaloisDeformation.Local.gl2BorelOrdinaryRing` : Let p > 2 and r̄ = (λ_ᾱ ∗; 0 ε̄^{-1}λ_ᾱ^{-1}) : G_{ℚ_p} → GL₂(k), written with extension class η_{α²} ∈ H¹(ℚ_p, ε̄λ_{ᾱ²}); let Λ = 𝒪⟦1 + pℤ_p⟧ with canonical character θ : I_{ℚ_p} → Λ^× (through Art^{-1}). A lift r over A ∈ CNL_Λ is ordinary if it is ker(GL₂(A) → GL₂(k))-conjugate to (χ ∗; 0 ε^{-1}χ^{-1}) with χ̄ = λ_ᾱ and χ|_{I_{ℚ_p}} = θ; this local deformation problem is represented by R^{B₂}. … := sorry
* `L7/gsp4-ordinary-flag-incidence` (construction): The GSp₄ ordinary flag-incidence scheme and its scheme-theoretic image R^△_v.
  - `TauCeti.GaloisDeformation.Local.GSp4.weightAlgebra` (data) : Λ_{GSp₄,v} and Λ̃_{GSp₄,v} with their universal characters. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.ordinaryFlagScheme` (constructor) : 𝒢_v ⊂ 𝓕 ×_𝒪 Spec R_v. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.ordinaryFlagScheme_proper` (other) : 𝒢_v → Spec R_v is proper. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.ordinaryImage` (constructor) : R^△_v, the scheme-theoretic image (no flat closure). := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.ordinaryImage_points` (characterisation) : 𝒪_{E′}-points of Spf R^△_v are the ordinary lifts with the given p-stabilisation. := sorry
  - `TauCeti.GaloisDeformation.Local.GSp4.ordinaryFlagScheme_closedImmersion` (characterisation) : Residually p-distinguished ⟹ 𝒢_v → Spec R_v is a closed immersion. := sorry
  - example `gsp4Flag_weightAlgebra_p2` (computation) : p = 2: Spec Λ_{GSp₄,v} has 4 irreducible components (from (ℤ/2)² ⊂ (ℤ₂^×)²) and regular generic fibre. := sorry
  - example `gsp4Flag_filtration_dims` (computation) : dim Fil^i ad⁰ρ_x = 6, 4, 2, 1, 0 for i = 0, …, 4. := sorry
  - example `gsp4Flag_no_flat_closure` (non-example) : R^△_v may have p-torsion; replacing it by its flat closure changes the ring when 𝒢_v is not 𝒪-flat. := sorry
  - example `gsp4Flag_distinguished` (compatibility) : For residually p-distinguished ρ̄, R^△_v is the ring of L7/gsp4-borel-ordinary-conditions. := sorry
* `L7/gsp4-ordinary-regularity` (theorem): Regularity of the GSp₄ ordinary flag scheme at characteristic-zero points.
  - theorem `TauCeti.GaloisDeformation.Local.gsp4OrdinaryRegularity` : Keep L7/gsp4-ordinary-flag-incidence and let x be a closed point of 𝒢_v[1/p] with ρ_x. (1) If H²(G_{F_v}, Fil⁰ad⁰ρ_x) = 0, then x is a regular point of 𝒢_v[1/p], on a unique irreducible component, of dimension 16; and H²(G_{F_v}, Fil⁰ad⁰ρ_x) = 0 iff H⁰(G_{F_v}, (ad⁰ρ_x/Fil¹ad⁰ρ_x)(1)) = 0. (2) The conditions of (1) hold if (a) none of the specialisations at x of χ̃₁²ε, χ̃₂²ε, χ̃₁χ̃₂ε, χ̃₁χ̃₂^{-1} … := sorry
* `L7/gsp4-ordinary-weight-two-components` (theorem): Finite-flat ordinary weight-two lifts lie on one component.
  - theorem `TauCeti.GaloisDeformation.Local.gsp4OrdinaryWeightTwoComponents` : Keep L7/gsp4-ordinary-flag-incidence with p > 2. (1) If (ρ̄ ⊗ ε̄)|G_{F_v} is finite flat, then all ordinary pure weight-two crystalline lifts lie on a single irreducible component of Spec R^△_v, each on a unique component, of relative 𝒪-dimension 16. (2) If a component R^△_v/Q dominates Spec Λ_{GSp₄,v}, some minimal prime of the special fibre contains Q and no other minimal prime of R^△_v; this co… := sorry
* `L7/connects-relation` (definition): The relation "connects" between potentially crystalline lifts.
  - `TauCeti.GaloisDeformation.Local.Connects` (data) : ρ₁ ∼ ρ₂: same reduction, potentially crystalline with the same labelled Hodge–Tate weights, same component of the potentially crystalline lifting ring over ℚ̄_l. := sorry
  - `TauCeti.GaloisDeformation.Local.Connects.symm` (relation) : ρ₁ ∼ ρ₂ ⟹ ρ₂ ∼ ρ₁. := sorry
  - `TauCeti.GaloisDeformation.Local.Connects.restrict` (functoriality) : ρ₁ ∼ ρ₂ ⟹ ρ₁|G_{K′} ∼ ρ₂|G_{K′} for K′/K finite. := sorry
  - `TauCeti.GaloisDeformation.Local.Connects.sum_tensor_dual` (functoriality) : ∼ is compatible with direct sums, tensor products, duals, and twists by unramified characters with trivial reduction. := sorry
  - `TauCeti.GaloisDeformation.Local.Connects.symPow` (functoriality) : ∼ is compatible with Sym^{n−1} (components of these generic fibres are connected components and Sym^{n−1} induces a morphism of generic fibres). := sorry
  - `TauCeti.GaloisDeformation.Local.Connects.trans_of_smooth` (relation) : On points lying on unique components, ∼ is transitive. := sorry
  - example `connects_rank_one` (computation) : n = 1: ψ₁ ∼ ψ₂ iff ψ̄₁ = ψ̄₂ and HT(ψ₁) = HT(ψ₂) (crystalline characters). := sorry
  - example `connects_ordinary_trivial` (characterisation) : Two ordinary crystalline weight-0 lifts of the trivial representation connect (L7/weight-zero-crystalline-connectedness). := sorry
  - example `connects_different_weights` (non-example) : Lifts with different labelled Hodge–Tate weights never connect, even if their reductions agree. := sorry
  - example `connects_restrict` (compatibility) : ρ₁ ∼ ρ₂ implies ρ₁|G_{K′} ∼ ρ₂|G_{K′}. := sorry
* `L7/weight-zero-crystalline-connectedness` (theorem): Connectedness results for crystalline weight-zero lifts.
  - theorem `TauCeti.GaloisDeformation.Local.weightZeroCrystallineConnectedness` : Let K/ℚ_p be finite. (1) Two ordinary crystalline weight-0 representations ρ₁, ρ₂ of G_K with ρ̄₁ = ρ̄₂ trivial connect: ρ₁ ∼ ρ₂ (the ordinary weight-0 crystalline lifting ring of the trivial representation is irreducible). (2) For ρ : G_K → GL_n(ℤ̄_p) crystalline of weight 0 there is c = c(K, ρ, n) such that every crystalline weight-0 t with t ≡ ρ mod p^c satisfies t ∼ ρ. (3) A crystalline repres… := sorry
* `L7/local-model-rho-nm0` (construction): The induced local models ρ_{n,m,0}.
  - `TauCeti.GaloisDeformation.Local.rhoNM0` (constructor) : ρ_{n,m,0} = ⊕ ε₂^{m(n−i)}(ε′₂)^{m(i−1)}. := sorry
  - `TauCeti.GaloisDeformation.Local.rhoNM0.hodgeTate` (simp) : HT_τ(ρ_{n,m,0}) = {0, m, …, (n − 1)m} for each τ. := sorry
  - `TauCeti.GaloisDeformation.Local.rhoNM0.symPow` (relation) : Sym^{n−1}ρ_{2,m,0} ≅ ρ_{n,m,0}. := sorry
  - `TauCeti.GaloisDeformation.Local.rhoNM0.tensor` (relation) : ρ_{n,m,0} ⊗ ρ_{m,1,0} ≅ ρ_{nm,1,0}. := sorry
  - `TauCeti.GaloisDeformation.Local.rhoNM0.connects` (characterisation) : Crystalline lifts of ρ̄_{n,m,0} with the same weights connect to ρ_{n,m,0} after an unramified extension. := sorry
  - example `rhoNM0_n1` (degenerate) : n = 1: ρ_{1,m,0} is the trivial character. := sorry
  - example `rhoNM0_det` (computation) : det ρ_{2,1,0} = ε₂ε′₂ = ε^{-1}. := sorry
  - example `rhoNM0_weights` (computation) : ρ_{3,2,0} has Hodge–Tate weights {0, 2, 4} at each embedding. := sorry
  - example `rhoNM0_needs_p_large` (non-example) : For p ≤ nm the weights exceed the Fontaine–Laffaille range and formal smoothness of the lifting ring, hence (2), is not available. := sorry
* `L7/kisin-modules-tame-descent` (construction): Kisin modules with tame descent datum, eigenbases and shapes (GL₃).
  - `TauCeti.GaloisDeformation.Local.KisinModuleDescent` (data) : Y^{[0,h],τ}(R): Kisin modules with tame descent datum of type τ. := sorry
  - `TauCeti.GaloisDeformation.Local.KisinModuleDescent.eigenbasis` (constructor) : An eigenbasis and the partial Frobenius matrices A^{(j)}. := sorry
  - `TauCeti.GaloisDeformation.Local.KisinModuleDescent.shape` (constructor) : The shape w̃(ρ̄, τ) ∈ W̃^∨. := sorry
  - `TauCeti.GaloisDeformation.Local.KisinModuleDescent.etalePhiModule` (functoriality) : 𝔐 ↦ 𝓜 = (𝔐 ⊗ 𝒪_{ℰ,L′})^{Δ=1} and T*_dd. := sorry
  - `TauCeti.GaloisDeformation.Local.KisinModuleDescent.unique` (characterisation) : For 3-generic τ the Kisin module of type (η, τ) of ρ̄ is unique. := sorry
  - example `kisinDescent_trivialType` (degenerate) : τ trivial: descent data are trivial. := sorry
  - example `kisinDescent_shape_identity` (computation) : For ρ̄ = T*_dd of the semisimple Kisin module of shape t_1 (identity), w̃(ρ̄, τ) = t_1. := sorry
  - example `kisinDescent_shape_admissible` (characterisation) : w̃(ρ̄, τ) lies in Adm^∨(η) whenever ρ̄ has a potentially crystalline lift of type (η, τ) (Theorem 3.3.11). := sorry
  - example `kisinDescent_nongeneric` (non-example) : For τ not 1-generic the potentially crystalline ring is zero (Theorem 3.5.3), so no shape is attached. := sorry
* `L7/semisimple-kisin-modules-and-shapes` (theorem): Semisimple Kisin modules and the shapes of potentially crystalline lifts.
  - theorem `TauCeti.GaloisDeformation.Local.semisimpleKisinModulesAndShapes` : Keep L7/kisin-modules-tame-descent (GL₃, K/ℚ_p unramified). (1) A semisimple Kisin module of shape w̃ (Definition 3.3.4) gives a semisimple G_{K_∞}-representation, with the explicit normal form of Proposition 3.3.6 and étale φ-module 𝓜(w̃) (Definition 3.3.7); T*_dd of it and its inertial type are given by Proposition 3.3.8. (2) Semisimple Kisin modules of a fixed shape and inertial restriction are… := sorry
* `L7/gl3-pcris-deformation-rings` (theorem): Potentially crystalline deformation rings of GL₃ in parallel weight (2, 1, 0).
  - theorem `TauCeti.GaloisDeformation.Local.gl3PcrisDeformationRings` : Let K/ℚ_p be unramified of degree f, ρ̄ : G_K → GL₃(F) continuous, 10-generic and semisimple, τ a tame inertial type, and R^τ_ρ̄ the framed potentially crystalline deformation ring of type (η, τ) with η = (2, 1, 0) (R08.3/pst-deformation-ring). If τ is not 1-generic, R^τ_ρ̄ = 0. If τ is 1-generic: R^τ_ρ̄ is a normal Cohen–Macaulay domain; R̄^τ_ρ̄ := R^τ_ρ̄/ϖ is reduced, its irreducible components … := sorry
* `L7/gl3-explicit-rings` (construction): Explicit rings R^{expl,∇} and the comparison diagram (3.9).
  - `TauCeti.GaloisDeformation.Local.GL3.explicitRing` (data) : R̄^{expl,∇}_{𝔐̄,w̃} for each shape w̃ (three cases by length). := sorry
  - `TauCeti.GaloisDeformation.Local.GL3.comparisonDiagram` (constructor) : The diagram (3.9) relating R̄^τ_ρ̄, explicit rings and étale φ-modules. := sorry
  - `TauCeti.GaloisDeformation.Local.GL3.iotaPrime_mono` (characterisation) : ι′_τ is a monomorphism. := sorry
  - `TauCeti.GaloisDeformation.Local.GL3.formallySmooth_over_explicit` (other) : R̄^τ_ρ̄ is formally smooth over ⊗̂_i R̄^{expl,∇}_{𝔐̄,w̃_i}. := sorry
  - `TauCeti.GaloisDeformation.Local.GL3.irr_bijection` (equivalence) : Irr(R̄^τ_ρ̄) ↔ Π_i Irr(R̄^{expl,∇}_{w̃_i}). := sorry
  - example `gl3Explicit_identity_components` (computation) : For the identity shape the explicit ring has 6 minimal primes (Table 3, row id). := sorry
  - example `gl3Explicit_alpha_components` (computation) : For shape α the explicit ring has 6 minimal primes (Table 3, row α). := sorry
  - example `gl3Explicit_long_shape` (degenerate) : For ℓ(w̃_i) > 1 the explicit ring is formally smooth over R_N. := sorry
  - example `gl3Explicit_not_epi` (non-example) : ι′_τ is a monomorphism but not an isomorphism onto Φ-Mod^{ét,□}: étale φ-modules not coming from Kisin modules of type (η, τ) are not in the image. := sorry
* `L7/gl3-component-labelling` (theorem): Labelling of components of GL₃ potentially crystalline rings by Serre weights.
  - theorem `TauCeti.GaloisDeformation.Local.gl3ComponentLabelling` : Keep L7/gl3-pcris-deformation-rings with ρ̄ 10-generic. (1) (Proposition 3.6.1) There is a unique assignment σ ↦ 𝔭(σ) from W^?(ρ̄) to minimal primes of the special fibres such that the components of R̄^τ_ρ̄ are exactly the 𝔭(σ) with σ ∈ W^?(ρ̄, τ) (a geometric Breuil–Mézard statement). (2) (Theorem 3.6.4) Via the bijections of L7/gl3-explicit-rings, the component of σ is given explicitly by Table … := sorry
* `L7/partition-monodromy-rings` (construction): Unipotent lifting rings with monodromy bounded by a partition (Clozel–Thorne R^m_v).
  - `TauCeti.GaloisDeformation.Local.partitionRing` (data) : R^m_v for a partition m of n. := sorry
  - `TauCeti.GaloisDeformation.Local.partitionRing_points` (characterisation) : ℚ̄_l-points of R^m_v are the unipotently ramified lifts whose Frobenius characteristic polynomial lies in Pol_n(m, q_v). := sorry
  - `TauCeti.GaloisDeformation.Local.partitionRing_steinberg` (compatibility) : R^{(n)}_v = R^St_v. := sorry
  - `TauCeti.GaloisDeformation.Local.partitionRing_trivial` (compatibility) : R^{(1,…,1)}_v = R^1_v. := sorry
  - `TauCeti.GaloisDeformation.Local.partitionRing_mono` (other) : m ≤ m′ in the dominance order gives a surjection R^m_v ↠ R^{m′}_v (larger partitions impose more chains). := sorry
  - example `partitionRing_steinberg` (compatibility) : m = (n) gives R^St_v of R08.2/steinberg-condition. := sorry
  - example `partitionRing_trivial` (degenerate) : m = (1, …, 1) gives R^1_v. := sorry
  - example `partitionRing_n2` (computation) : n = 2, m = (2): the defining equation q_v(tr Φ)² = (1 + q_v)² det Φ. := sorry
  - example `partitionRing_not_scalar` (non-example) : R^m_v for m = (2, 1) is not the ring of lifts with scalar inertial semisimplification: it also constrains the Frobenius eigenvalues to contain a chain α, q_vα. := sorry
* `L7/partition-ring-smooth-points` (theorem): Smooth pure points of partition rings and their minimal primes.
  - theorem `TauCeti.GaloisDeformation.Local.partitionRingSmoothPoints` : Keep L7/partition-monodromy-rings. Let x ∈ Spec R^m_v[1/l] be a closed point given by ρ : G_{L_ṽ} → GL_n(𝒪) with ρ ⊗ ℚ̄_l pure (Taylor–Yoshida, Lemma 1.4). Then Spec R^1_v[1/l] is formally smooth over K at x, there is a unique minimal prime Q_v of R^1_v in the kernel of R^1_v → 𝒪, and Q_v contains ker(R^1_v → R^m_v). := sorry
* `L7/away-from-p-rank-n-interface` (comparison): Rank-n conditions away from p: the interface with R08.2.
  - theorem `TauCeti.GaloisDeformation.Local.awayFromPRankNInterface` : L7's rank-n semistable, Steinberg and minimally ramified conditions away from p are those of R08.2, cited and not rebuilt (RS-08 link R08.2 → L7): (1) minimally ramified lifts in rank n (R08.2/minimally-ramified-condition, R08.2/minimally-ramified-ring), which equal the unipotent lifts when r̄(σ) is a single Jordan block (R08.2/regular-unipotent-minimally-ramified); (2) Steinberg lifts with monodr… := sorry
* `L7/torsion-crystalline-representations` (definition): Torsion crystalline representations with Hodge–Tate weights in [a, b].
  - `TauCeti.GaloisDeformation.Local.IsTorsionCrystalline` (data) : R is a subquotient R″/R′ of lattices in a crystalline representation with weights in [a, b]. := sorry
  - `TauCeti.GaloisDeformation.Local.IsCrystallineIntegral` (data) : R crystalline iff every R/p^m R is torsion crystalline. := sorry
  - `TauCeti.GaloisDeformation.Local.IsTorsionCrystalline.closed` (other) : For b − a ≤ p − 2 the class is closed under subobjects, quotients and finite direct sums. := sorry
  - `TauCeti.GaloisDeformation.Local.IsCrystallineIntegral.of_rational` (compatibility) : A lattice in a crystalline representation with weights in [a, b] is crystalline. := sorry
  - `TauCeti.GaloisDeformation.Local.IsTorsionCrystalline.fontaineLaffaille` (equivalence) : For b − a ≤ p − 2 these are the representations of Fontaine–Laffaille modules. := sorry
  - example `torsionCrys_mu_p` (computation) : μ_p ≅ ℤ/p(1) is torsion crystalline with weights in [−1, 0] (LTXZZ convention). := sorry
  - example `torsionCrys_trivial` (degenerate) : ℤ/p^m with trivial action is torsion crystalline with weights in [0, 0]. := sorry
  - example `torsionCrys_wide_range` (non-example) : For b − a ≥ p − 1 the class is not closed under quotients in general (Fontaine–Laffaille fails at the endpoint, PadicHodgeTheory R06.4/fontaine-laffaille-endpoint-non-example). := sorry
  - example `torsionCrys_lattice` (compatibility) : A Γ-stable lattice in a crystalline representation is crystalline in the sense of (2). := sorry

### Layer L8

* `L8/ordinary-coefficient-ring` (construction): The universal character coefficient rings Λ_v and Λ̃_v.
  - `TauCeti.GaloisDeformation.Local.ordinaryWeightRing` (constructor) : Λ_v = 𝒪[[𝒪_{F_v}^×(p)ⁿ]]/𝔞 for a chosen set of minimal primes. := sorry
  - `TauCeti.GaloisDeformation.Local.universalInertialCharacter` (constructor) : χ_i^univ : I_{F_v} → Λ_v^×. := sorry
  - `TauCeti.GaloisDeformation.Local.ordinaryWeightRingTilde` (constructor) : Λ̃_v and χ̃_i^univ : G_{F_v} → Λ̃_v^×. := sorry
  - `TauCeti.GaloisDeformation.Local.universalInertialCharacter_residual` (characterisation) : χ_i^univ ≡ χ̄_i modulo the maximal ideal. := sorry
  - `TauCeti.GaloisDeformation.Local.minimalPrimes_torsionCharacters` (equivalence) : Minimal primes ↔ Galois orbits of torsion characters. := sorry
  - example `ordinaryWeightRing_Qp` (computation) : F_v = ℚ_p, p odd: 𝒪_{ℚ_p}^×(p) ≅ 1 + pℤ_p ≅ ℤ_p is torsion-free, so Λ_v = 𝒪[[X_1, …, X_n]] with 𝔞 = 0. := sorry
  - example `ordinaryWeightRing_torsion` (computation) : F_v = ℚ_p(ζ_p): 𝒪_{F_v}^×(p) has torsion μ_p, so 𝒪[[𝒪_{F_v}^×(p)]] has several minimal primes once ζ_p ∈ 𝒪, and 𝔞 selects tuples of characters of μ_pⁿ. := sorry
  - example `ordinaryWeightRing_n_one` (degenerate) : n = 1: χ_1^univ is the universal deformation of χ̄_1|_{I_{F_v}} with values in Λ_v, and Λ̃_v adds the Frobenius variable. := sorry
* `L8/determinant-ordinary-ring` (construction): The determinant-ordinary rings R̃^{det,ord}_v and R^{det,ord}_v.
  - `TauCeti.GaloisDeformation.Local.detOrdTilde` (constructor) : R̃^{det,ord}_v, the quotient by (6.2.7)–(6.2.8). := sorry
  - `TauCeti.GaloisDeformation.Local.detOrd` (constructor) : R^{det,ord}_v = im(R^□_v → R̃^{det,ord}_v). := sorry
  - `TauCeti.GaloisDeformation.Local.detOrdTilde_charpoly` (characterisation) : (6.2.7) holds over R̃^{det,ord}_v. := sorry
  - `TauCeti.GaloisDeformation.Local.detOrdTilde_product` (characterisation) : (6.2.8) holds over R̃^{det,ord}_v. := sorry
  - `TauCeti.GaloisDeformation.Local.detOrd_universal` (universal-property) : R^□_v → R factors through R^{det,ord}_v when R ↪ S carries characters ψ_i with the relations. := sorry
  - example `detOrd_n_one` (degenerate) : n = 1: (6.2.7) says ρ^□ = χ̃_1^univ and (6.2.8) is the same relation. := sorry
  - example `detOrd_diagonal` (computation) : A diagonal lift diag(χ̃_1, …, χ̃_n) satisfies (6.2.7) and (6.2.8). := sorry
  - example `detOrd_charpoly_not_enough` (non-example) : Over a field with repeated characters, (6.2.7) holds for any unipotent ρ(g) = 1 + N while (6.2.8) can fail; the product condition is independent. := sorry
* `L8/det-ord-finite` (lemma): R̃^{det,ord}_v is finite over R^{det,ord}_v.
  - theorem `TauCeti.GaloisDeformation.Local.detOrdFinite` : (ACC+ Lemma 6.2.9.) R̃^{det,ord}_v is a finite R^{det,ord}_v-algebra. := sorry
* `L8/ordinary-point-criteria` (lemma): Point criteria and Spec R^△_v ⊂ Spec R^{det,ord}_v.
  - theorem `TauCeti.GaloisDeformation.Local.ordinaryPointCriteria` : If R ↪ S is an injective map of R^□_v-algebras and there are characters ψ_1, …, ψ_n : G_{F_v} → S^× with ψ_i|_{I_{F_v}} the push-forward of χ_i^univ satisfying (6.2.7) and (6.2.8) with the push-forward of the universal lifting, then R^□_v → R factors through R^{det,ord}_v. Consequently Spec R^△_v ⊂ Spec R^{det,ord}_v as topological spaces, and there is a surjection of R^□_v-algebras R^{det,ord}_v … := sorry
* `L8/distinct-characters-flag` (lemma): Characteristic polynomials and ordered products give a flag.
  - theorem `TauCeti.GaloisDeformation.Local.distinctCharactersFlag` : (ACC+ Lemma 6.2.11.) Let K be a field, G a group and ρ : G → GL_n(K). If χ_1, …, χ_n : G → K^× are pairwise distinct characters with det(X − ρ(g)) = ∏_i(X − χ_i(g)) for all g and (ρ(g_1) − χ_1(g_1))⋯(ρ(g_n) − χ_n(g_n)) = 0 for all g_1, …, g_n, then there is a G-stable flag 0 = Fil⁰ ⊂ ⋯ ⊂ Filⁿ = Kⁿ with Fil^i/Fil^{i−1} ≅ K(χ_i). := sorry
* `L8/determinant-flag-comparison` (theorem): Determinant-ordinary versus flag-ordinary components.
  - theorem `TauCeti.GaloisDeformation.Local.determinantFlagComparison` : (ACC+ Proposition 6.2.12.) Let U ⊂ Spec Λ_v be the open locus where χ_1^univ, …, χ_n^univ are pairwise distinct, Z its complement, and f : Spec R^△_v → Spec Λ_v, g : Spec R^{det,ord}_v → Spec Λ_v the structure maps. Suppose ρ̄ is trivial and [F_v : ℚ_p] > n(n + 1)/2 + 1. (1) f^{−1}(U) = g^{−1}(U) in Spec R^□_v; hence every irreducible component C of Spec Λ_v is dominated by a unique irreducible co… := sorry
* `L8/doubling-equals-unramified` (theorem): The doubling ideal equals the unramified ideal (Calegari–Geraghty Lemma 3.22).
  - theorem `TauCeti.GaloisDeformation.Local.doublingEqualsUnramified` : Keep L7/ordinary-ring-with-frobenius-eigenvalue. (1) R^unr ≅ 𝒪/ϖ^m⟦φ₁, φ₂, φ₃, φ₄⟧/(φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃), where ϖ^m is the largest power of ϖ dividing χ^{n−1}(g) − 1 for all g in the decomposition group at p, and R̃^unr ≅ R^unr[β]/(β² − (φ₁ + φ₄)β − (φ₁ + φ₄)) ≅ R^unr ⊕ R^unr; so R^unr → R̃^unr is injective and R^unr acts faithfully on R̃^unr/R^unr ≅ R^unr. (2) J = I: the annihilator of R̃†/R† (… := sorry

### Layer R08.4

* `R08.4/flat-deformation-condition` (construction): Flat deformations and the flat deformation ring.
  - `TauCeti.GaloisDeformation.Local.flatLiftingRing` (constructor) : R^{fl,□}, the quotient of R^□ classifying flat lifts. := sorry
  - `TauCeti.GaloisDeformation.Local.flatLiftingRing_points` (characterisation) : An 𝒪_E-point is flat iff it is the Tate module of a p-divisible group. := sorry
  - `TauCeti.GaloisDeformation.Local.flatDeformationRing` (constructor) : R^fl when End V_𝔽 = 𝔽. := sorry
  - example `flat_mu_p_plus_Z_p` (computation) : 𝔽(1) ⊕ 𝔽 is finite flat. := sorry
  - example `flat_points_iff_pdivisible` (characterisation) : 𝒪_E-points of R^{fl,□} are Tate modules of p-divisible groups. := sorry
  - example `omega_sq_not_flat` (non-example) : ω² over ℚ_p (p > 3) has no finite flat model. := sorry
* `R08.4/finite-flat-model-moduli` (construction): The moduli of finite flat models.
  - `TauCeti.GaloisDeformation.Local.finiteFlatModels` (constructor) : 𝒢ℛ_{V_𝔽,ξ}, the projective R-scheme of E-height ≤ 1 lattices. := sorry
  - `TauCeti.GaloisDeformation.Local.finiteFlatModels_toFlat` (constructor) : Θ : 𝒢ℛ_{V_𝔽} → Spec R^fl, projective. := sorry
  - `TauCeti.GaloisDeformation.Local.finiteFlatModels_closedFibre` (characterisation) : 𝒢ℛ_{V_𝔽,0}(𝔽′) ≃ finite flat models of V_𝔽 ⊗ 𝔽′. := sorry
  - example `finiteFlatModels_irreducible_Qp` (computation) : K = ℚ_p, V_𝔽 irreducible: one model. := sorry
  - example `finiteFlatModels_closedFibre_models` (characterisation) : Closed-fibre points are finite flat models. := sorry
  - example `finiteFlatModels_two_models_ramified` (non-example) : Over ℚ_p(ζ_p), μ_p and ℤ/p are two models of one generic fibre. := sorry
* `R08.4/small-ramification-flat` (theorem): Unique models in small ramification.
  - theorem `TauCeti.GaloisDeformation.Local.smallRamificationFlat` : If e(K/ℚ_p) < p − 1, then Θ : 𝒢ℛ_{V_𝔽,ξ} → Spec R is an isomorphism for every ξ, and in particular Θ : 𝒢ℛ_{V_𝔽} → Spec R^fl is an isomorphism: a flat deformation has a unique finite flat model. := sorry
* `R08.4/flat-generic-fibre` (theorem): The generic fibre of the flat deformation ring.
  - theorem `TauCeti.GaloisDeformation.Local.flatGenericFibre` : On the generic fibre, flat deformations are the crystalline deformations with Hodge–Tate weights in {0, 1}: for an E-point ξ of R^{fl,□}, the completion of R^{fl,□}[1/p] at ξ pro-represents crystalline deformations of V_ξ, it is formally smooth over E, and if ξ has p-adic Hodge type v = (v_ψ)_ψ (v_ψ the multiplicity of the weight 1 at the embedding ψ) its dimension is d² + Σ_ψ (d − v_ψ)v_ψ. For th… := sorry
* `R08.4/hodge-type-resolution` (construction): Kisin's resolution of the flat deformation ring.
  - `TauCeti.GaloisDeformation.Local.flatHodgeTypeQuotient` (constructor) : R^v, the Hodge-type-v part of the flat ring. := sorry
  - `TauCeti.GaloisDeformation.Local.flatResolution` (constructor) : 𝒢ℛ^{v,loc} with Θ^v : 𝒢ℛ^{v,loc} → Spec R^v projective. := sorry
  - `TauCeti.GaloisDeformation.Local.flatResolution_generic_iso` (characterisation) : Θ^v[1/p] is an isomorphism. := sorry
  - example `flatResolution_small_ramification` (degenerate) : e < p − 1: Θ^v is an isomorphism integrally. := sorry
  - example `flatResolution_generic_iso` (characterisation) : Θ^v is an isomorphism after inverting p. := sorry
  - example `flatResolution_not_integral_iso` (non-example) : Θ^v has positive-dimensional closed fibre in general. := sorry
* `R08.4/resolution-local-structure` (theorem): Local structure of the resolution.
  - theorem `TauCeti.GaloisDeformation.Local.resolutionLocalStructure` : 𝒢ℛ^{v,loc} is normal and Cohen–Macaulay, and its closed fibre 𝒢ℛ^{v,loc}_0 is reduced and normal with rational singularities. A closed point of 𝒢ℛ^v lies in 𝒢ℛ^{v,loc} exactly when, for each σ ∈ Gal(K₀/ℚ_p), the nilpotent endomorphism π of σ-part of φ*𝔐/E(u)𝔐 has Jordan type dominated by the dual partition of v_σ. If for each σ any two of the v_ψ with ψ|K₀ = σ differ by at most 1, and either every… := sorry
* `R08.4/components-via-special-fibre` (theorem): Connected components through the special fibre.
  - theorem `TauCeti.GaloisDeformation.Local.componentsViaSpecialFibre` : There is a bijection between the connected components of Spec R^v[1/p] and those of the closed fibre 𝒢ℛ^{v,loc}_0 of the resolution. Because Θ^v[1/p] is an isomorphism, this describes components of the deformation ring itself and not only of the moduli space: connectedness of the source alone would not suffice. := sorry
* `R08.4/ordinary-type-of-components` (lemma): The ordinary type of a component.
  - theorem `TauCeti.GaloisDeformation.Local.ordinaryTypeOfComponents` : Every point 𝔐_A of the moduli has a maximal multiplicative subobject 𝔐^m_A and a maximal étale quotient 𝔐^ét_A, compatible with base change and exchanged by duality; their ranks d_m and d_ét are constant on each connected component of 𝒢ℛ^{v,loc}_0. For a pair d = (d_ét, d_m), an E-point x of Spec R^v lies on a connected component of Spec R^v[1/p] corresponding to a component of type d exactly when… := sorry
* `R08.4/rank-two-nonordinary-connected` (theorem): Connectedness of the non-ordinary locus in rank two.
  - theorem `TauCeti.GaloisDeformation.Local.rankTwoNonordinaryConnected` : Let d = 2, v_ψ = 1 for all ψ (so 𝒢ℛ^v = 𝒢ℛ^{v,loc}), and K₀ = ℚ_p. Any two non-ordinary 𝔽′-points of 𝒢ℛ^v_0 lie on the same connected component. So the non-ordinary locus of Spec R^v[1/p] is connected. := sorry
* `R08.4/rank-two-ordinary-locus` (theorem): The ordinary locus in rank two.
  - theorem `TauCeti.GaloisDeformation.Local.rankTwoOrdinaryLocus` : Let d = 2 and v_ψ = 1 for all ψ (K₀ arbitrary). The ordinary part 𝒢ℛ^{v,ord}_0 of the closed fibre, if non-empty, is a single point, unless V_𝔽 ≅ χ₁ ⊕ χ₂ with χ₁, χ₂ unramified. In that case it is two points (the models D(𝒢_{χ₁^{−1}ω}) ⊕ 𝒢_{χ₂} and D(𝒢_{χ₂^{−1}ω}) ⊕ 𝒢_{χ₁}) if χ₁ ≠ χ₂, and ℙ¹ if χ₁ = χ₂, all its models being isomorphic to D(𝒢_{χ₁^{−1}ω}) ⊕ 𝒢_{χ₁}. := sorry
* `R08.4/rank-two-bt-components` (theorem): Components of rank-two Barsotti–Tate deformation rings.
  - theorem `TauCeti.GaloisDeformation.Local.rankTwoBtComponents` : Let d = 2, v_ψ = 1 for all ψ (Barsotti–Tate with cyclotomic-type determinant), R = R^{fl,□} ⊗ 𝒪_F and R^v its Hodge-type-v quotient. (1) R^v is flat over ℤ_p of pure relative dimension 4 + [K : ℚ_p], and R^v[1/p] is formally smooth; its irreducible components are its connected components. (2) If E-points x₁, x₂ lie on the same irreducible component, then V_{x₁} and V_{x₂} are both ordinary or both… := sorry
* `R08.4/savitt-weight-two-rings` (theorem): Savitt's weight-two deformation rings of tame type.
  - theorem `TauCeti.GaloisDeformation.Local.savittWeightTwoRings` : Let p be odd, ρ̄ : G_{ℚ_p} → GL_2(k_E) with End ρ̄ = k_E, and R(2, τ, ρ̄) the quotient of the universal deformation ring by the intersection of the primes of type (2, τ) (potentially Barsotti–Tate of inertial type τ, Hodge–Tate weights (0, 1), fixed determinant). (1) If τ = ω̃^i ⊕ ω̃^j with i ≢ j mod p − 1: R(2, τ, ρ̄) = 0 unless ρ̄|I_p is (ω^{1+i} ∗; 0 ω^j), (ω^{1+j} ∗; 0 ω^i) or ω₂^k ⊕ ω₂^{pk} w… := sorry
* `R08.4/finite-cocycles-kummer` (theorem): Finite cocycles via Kummer theory over F^nr (KW II Lemma 3.7).
  - theorem `TauCeti.GaloisDeformation.Local.finiteCocyclesKummer` : Let F_v/ℚ_p be finite unramified, D_v = G_{F_v}, I_v its inertia, F^nr the maximal unramified extension. Let B be a complete local Noetherian 𝒪-algebra and N a finitely generated B-module, Ξ = χ₁η₁η₂^{-1} a character with Ξ|_{I_v} the cyclotomic character χ_p (the case k(ρ̄) = 2) and M = N(Ξ). Kummer theory gives H¹_cont(I_v, N(χ_p)) ≅ (F^{nr×} ⊗ N)^∧ (𝔪_B-adic completion), D_v/I_v-equivariantly; … := sorry
* `R08.4/kw-algebraisation-lemma` (lemma): Normalising a vector over 𝒪[T] inside 𝒪⟦T⟧ (KW II Lemma 3.8).
  - theorem `TauCeti.GaloisDeformation.Local.kwAlgebraisationLemma` : Let A₀ = 𝒪[T], A = 𝒪⟦T⟧, M₀ a free A₀-module of finite rank, M = A ⊗_{A₀} M₀ and m ∈ M. Then there exist m₀ ∈ M₀ and an isomorphism A ⊗_{A₀} M₀ ≅ M of A-modules sending m₀ to m. := sorry
* `R08.4/bt-ring-unique-generalisation` (theorem): Unique generalisation of generic points for Barsotti–Tate rings.
  - theorem `TauCeti.GaloisDeformation.Local.btRingUniqueGeneralisation` : Let p be odd, F_v/ℚ_p finite and R = R^{ε_p^{-1},BT}_v the fixed-determinant Barsotti–Tate lifting ring (crystalline of Hodge–Tate weights {0, 1}, determinant ε_p^{-1}) of ρ̄ : G_{F_v} → GL₂(k). Each generic point of Spec(R/ϖ) is the specialisation of a unique generic point of Spec R. Moreover, if ρ̄ is trivial, k_v ≠ 𝔽_p and R ≠ 0, Spec R has exactly two irreducible components, whose points are t… := sorry

### Layer R08.5

* `R08.5/connected-kisin-modules-with-coefficients` (construction): Kisin modules with coefficients and the connected condition.
  - `TauCeti.GaloisDeformation.Local.KisinModuleCoeff` (constructor) : (Mod/𝔖)_A with its φ and the E(u)-cokernel condition. := sorry
  - `TauCeti.GaloisDeformation.Local.KisinModuleCoeff.IsConnected` (constructor) : ψ_n(𝔐_A) ⊆ (p, u)φ^{n*}(𝔐_A) for n ≫ 0. := sorry
  - `TauCeti.GaloisDeformation.Local.KisinModuleCoeff.IsEtale` (constructor) : Image of φ^*𝔐 is E(u)𝔐. := sorry
  - `TauCeti.GaloisDeformation.Local.KisinModuleCoeff.IsMultiplicative` (constructor) : φ^*𝔐 → 𝔐 is an isomorphism. := sorry
  - `TauCeti.GaloisDeformation.Local.kisinGroupoid` (constructor) : D_{𝔖,M_𝔽} and D^c_{𝔖,M_𝔽}. := sorry
  - `TauCeti.GaloisDeformation.Local.kisinGroupoid_toPhiModule` (functoriality) : 𝔐_A ↦ 𝒪_ℰ ⊗ 𝔐_A (Lemma 2.1.7). := sorry
  - example `rank_one_etale` (computation) : Rank one, φ(e) = E(u)e: étale, not connected (its étale part is itself). := sorry
  - example `rank_one_multiplicative` (computation) : Rank one, φ(e) = e: multiplicative. := sorry
  - example `rank_one_cyclotomic` (computation) : Rank one, φ(e) = pE(u)/E(0)·e: connected, with G_{K∞} acting on (𝔐 ⊗ 𝒪_{ℰ^ur})^{φ=1} by χ^{−1} (proof of Lemma 2.3.4). := sorry
  - example `p_odd_vs_two` (non-example) : For p > 2 every object of (Mod/𝔖) corresponds to a finite flat group scheme (Kisin FM); at p = 2 only the connected ones do (1.3), so the étale part must be excluded. := sorry
* `R08.5/etale-multiplicative-parts` (lemma): Étale quotients, multiplicative parts and connectedness.
  - theorem `TauCeti.GaloisDeformation.Local.etaleMultiplicativeParts` : For (A, I) in 𝔄𝔲𝔤_{W(𝔽)} and 𝔐_A in D_{𝔖,M_𝔽}(A, I), 𝔐_A has a maximal étale quotient 𝔐^{ét}_A and a maximal multiplicative subobject 𝔐^m_A in (Mod/𝔖)_A, 𝔐_A/𝔐^m_A is in (Mod/𝔖)_A, and both constructions commute with base change (Lemma 2.1.8). 𝔐_A is connected iff 𝔐^{ét}_A = 0 (Lemma 2.1.9), and the inclusion D^c_{𝔖,M_𝔽} → D_{𝔖,M_𝔽} is open and closed (Proposition 2.1.10). := sorry
* `R08.5/connected-model-moduli` (theorem): Moduli of connected finite flat models.
  - theorem `TauCeti.GaloisDeformation.Local.connectedModelModuli` : D_{𝔖,M_𝔽} → D_{M_𝔽} is relatively representable and projective: for a complete local R and ξ ∈ D_{M_𝔽}(R) there is a projective R-scheme 𝒢ℛ_{V_𝔽,ξ} with |D_{𝔖,M_𝔽,ξ}|(A, I) ≅ Hom_{Spec R}(Spec A, 𝒢ℛ_{V_𝔽,ξ}), and Θ_{V_𝔽,ξ} : 𝒢ℛ_{V_𝔽,ξ} → Spec R becomes a closed immersion after inverting p; the connected part is a closed and open subscheme 𝒢ℛ^c_{V_𝔽,ξ} (Proposition 2.1.12). := sorry
* `R08.5/flat-connected-deformation-ring` (theorem): Flat connected deformation rings at p = 2.
  - theorem `TauCeti.GaloisDeformation.Local.flatConnectedDeformationRing` : Let D^{fl,c}_{V_𝔽} ⊆ D^{fl}_{V_𝔽} ⊆ D_{V_𝔽} be the deformations that arise from finite flat connected (resp. finite flat) 𝒪_K-group schemes; D^{fl,c} → D_{M_𝔽} is fully faithful. Both inclusions are relatively representable and closed, and for the maximal quotient R^c of R over which ξ is flat connected, Spec R^c[1/p] → Spec R[1/p] is an open immersion (Lemma 2.2.2). If ξ → D^{fl,c} is formally sm… := sorry
* `R08.5/rank-two-type-v` (lemma): Rank-two Kisin modules of type v and their determinant.
  - theorem `TauCeti.GaloisDeformation.Local.rankTwoTypeV` : A Kisin module 𝔐_A of 𝔖_A-rank 2 is of type v if (1 ⊗ φ)(φ^*𝔐_A)/E(u)𝔐_A is maximal isotropic in 𝔐_A/E(u)𝔐_A (2.3.1). If 𝔐_A is free of type v with φ-matrix H, then det H = pE(u)/E(0)·w with w ∈ 𝔖_A^× (Lemma 2.3.2). If 𝔐_𝔽 is connected of type v, every deformation 𝔐_A is connected with 𝔐^m_A = 0 (Lemma 2.3.3). For V_A = Θ(𝔐_A), det V_A|_{I_K} ≅ χ, and det V_A ≅ χ on G_K iff det H = pE(u)/E(0)·w wi… := sorry
* `R08.5/rank-two-connected-components` (theorem): Components of 2-adic Barsotti–Tate deformation rings.
  - theorem `TauCeti.GaloisDeformation.Local.rankTwoConnectedComponents` : For ξ ∈ D^{fl,c}_{V_𝔽}(R) with dim V_𝔽 = 2: the type-v locus 𝒢ℛ^{c,v}_{V_𝔽,ξ} ⊆ 𝒢ℛ^{fl,c}_{V_𝔽,ξ} is closed, Θ^v factors through Spec R^v (inertia acting on det by χ) and is an isomorphism after inverting p; and if ξ has determinant χ and ξ → D^{fl,c,χ} is formally smooth, the complete local rings of 𝒢ℛ^{c,v} are those of Hilbert modular varieties (Deligne–Pappas), so 𝒢ℛ^{c,v} is a normal local co… := sorry
* `R08.5/ordinary-deformations-p2` (theorem): Ordinary deformation rings of rank two at p = 2.
  - theorem `TauCeti.GaloisDeformation.Local.ordinaryDeformationsP2` : For a discrete ℤ_p[Γ_K]-module M with p nilpotent, H¹_f(G_K, M(χ)) (the classes whose inertial image lies in 𝒪^×_{K^ur} ⊗ M) is right exact in M (Lemma 2.4.2). The groupoid D^{ord,χ}_{V_𝔽} of triples (V_A, L_A, ι_A) with det V_A ≅ χ, L_A a G_K-stable line with I_K acting by χ, and extension class in H¹_f (2.4.3) is relatively representable and projective over D^χ_{V_𝔽}; Θ^{ord} becomes a closed em… := sorry
* `R08.5/kisin-local-rings-p2-comparison` (comparison): Kisin's rings away from 2 and at ∞ against R08.1–R08.2.
  - theorem `TauCeti.GaloisDeformation.Local.kisinLocalRingsP2Comparison` : Kisin's rings for p = 2 away from 2 and at the real place are those already planned: the ring of extensions of γ by γ(1) (Proposition 2.5.2) is R08.2's Steinberg condition (domain of dimension 3 after inverting p, formally smooth); unramified lifts with determinant ψχ (2.5.3) form a formally smooth ring of relative dimension 3 (R08.2/unramified-lifting-ring); the fixed-determinant ring (2.5.4) is … := sorry
* `R08.5/weight-p-crystalline-ordinarity` (theorem): Crystalline lifts of weight k ≤ p are ordinary when the residual representation is.
  - theorem `TauCeti.GaloisDeformation.Local.weightPCrystallineOrdinarity` : Let p ≥ 3, F/ℚ_p finite unramified and ρ : G_F → GL₂(E) a lift of ρ̄ that is crystalline of weight k (Hodge–Tate weights {0, k − 1}) with 2 ≤ k ≤ p. If ρ̄ is ordinary (has a G_F-stable line with unramified quotient), ρ is ordinary. The endpoint k = p, where Fontaine–Laffaille modules of filtration length p − 1 occur but the torsion functor is not fully faithful, is included. := sorry
* `R08.5/weight-p-plus-one-ordinary-ring` (theorem): Crystalline lifts of weight p + 1: ordinarity and formal smoothness.
  - theorem `TauCeti.GaloisDeformation.Local.weightPPlusOneOrdinaryRing` : Let p ≠ 2, ρ̄ : G_{F_v} → GL₂(k) with F_v/ℚ_p unramified, k(ρ̄) = p + 1 (so ρ̄|I_v ≅ (χ̄_p ∗; 0 1) très ramifié) and φ a fixed determinant. (1) For F_v = ℚ_p, every crystalline lift of weight p + 1 is ordinary (Berger–Li–Zhu), i.e. an extension of an unramified free rank-one representation by a free rank-one representation on which I_v acts by χ_p^p. (2) The framed fixed-determinant ring R^{□,ψ}_v… := sorry
* `R08.5/semistable-weight-two-resolution` (theorem): Semistable weight-two lifts at p: the resolution and the dyadic homothety case.
  - theorem `TauCeti.GaloisDeformation.Local.semistableWeightTwoResolution` : Let ρ̄_v = (γ̄_vχ̄_p ∗; 0 γ̄_v) : G_{F_v} → GL₂(k) with F_v/ℚ_p unramified and γ̄_v unramified, φ a fixed determinant, and γ_v a fixed unramified lift of γ̄_v with γ_v²χ_p = φ. Consider lifts (γ_vχ_p ∗; 0 γ_v). For finite A, |Z¹(D_v, A(χ_p))| = |A|^{2+[F_v:ℚ_p]}, and the moduli of such lifts with a stable line is a smooth resolution ℛ → Spf R^{□,ψ}_v: (1) unless p = 2 and D_v acts on ρ̄_v by homot… := sorry
* `R08.5/dyadic-minimal-lifts` (construction): Minimal lifts in the dihedral and exceptional cases (p = 2 and residue characteristic 2).
  - `TauCeti.GaloisDeformation.Local.DyadicMinimal.lift` (constructor) : The lift ρ₀ = unramified twist of Ind(γ̂δ) in case (a), or the S₄-lift in case (b). := sorry
  - `TauCeti.GaloisDeformation.Local.DyadicMinimal.restrict_inertia` (characterisation) : ρ₀|I_v is independent of δ (case (a)). := sorry
  - `TauCeti.GaloisDeformation.Local.DyadicMinimal.det_inertia` (simp) : det ρ₀|I_v is the Teichmüller lift of det ρ̄_v|I_v. := sorry
  - `TauCeti.GaloisDeformation.Local.DyadicMinimal.conductor` (compatibility) : a(ρ₀) = a(ρ̄_v). := sorry
  - `TauCeti.GaloisDeformation.Local.DyadicMinimal.problem` (constructor) : Minimal lifts: the inertia-rigid problem attached to ρ₀ (GlobalGaloisDeformations R04.4). := sorry
  - example `dyadicMinimal_det` (computation) : For ρ̄_v = Ind(γ) with γ of order 3·2^a on a ramified quadratic L, det ρ₀|I_v = Teichmüller(det ρ̄_v|I_v). := sorry
  - example `dyadicMinimal_naive_fails` (non-example) : The naive lift Ind(γ̂) without δ has det|I_v = ε_L·(γ̂∘t), which differs from the Teichmüller lift of det ρ̄|I_v by the ramified ε_L; δ corrects it. := sorry
  - example `dyadicMinimal_A4` (computation) : q = 2, p = 3, G ≅ A₄: ρ₀ has projective image S₄ ⊂ PGL₂(ℤ₃) or its subgroup A₄. := sorry
  - example `dyadicMinimal_tame` (degenerate) : If #G is prime to p, ρ₀ is the unique lift with ρ₀(I_v) ≅ ρ̄_v(I_v) (KW II §3.3.1, first case). := sorry
* `R08.5/twisted-semistable-away-from-p` (theorem): Twists of semistable deformations away from p.
  - theorem `TauCeti.GaloisDeformation.Local.twistedSemistableAwayFromP` : Let v ∤ p and ρ̄|D_v = (γ̄_vχ̄_p ∗; 0 γ̄_v). Fix a character γ_v of D_v lifting γ̄_v whose restriction to I_v is the Teichmüller lift, with γ_v²χ_p = φ, and consider lifts (γ_vχ_p ∗; 0 γ_v). For a finite 𝒪-algebra A, |Z¹(G_{F_v}, A(χ_p))| = |A|·|H⁰(G_{F_v}, A)| = |A|², and the moduli of such lifts with a stable line is a smooth resolution as in R08.5/semistable-weight-two-resolution with cocycle m… := sorry
* `R08.5/kw1-endpoint-weight-rings` (theorem): Endpoint-weight local rings for KW I Theorem 4.1.
  - theorem `TauCeti.GaloisDeformation.Local.kw1EndpointWeightRings` : KW I Theorem 4.1 (modularity lifting) needs, at p, local deformation rings of the following lifts of ρ̄|G_{ℚ_p}, each with a flat reduced framed fixed-determinant ring of relative dimension 3 + 1 = 4 with regular generic fibre (or formally smooth): (1) p = 2: crystalline of weight 2 (Kisin's 2-adic Barsotti–Tate rings, R08.5/flat-connected-deformation-ring and R08.5/rank-two-connected-components),… := sorry

### Layer R08.6

* `R08.6/smooth-resolution-criterion` (lemma): Smooth resolutions of framed deformation conditions.
  - theorem `TauCeti.GaloisDeformation.Local.smoothResolutionCriterion` : Let R^□_X be a nonzero quotient of the framed ring R^□ by a (GL_d)_1-stable ideal. A smooth resolution is a flat 𝒪-scheme ℛ with f : ℛ → Spec R^□_X such that: (1) f is proper with 𝒪_{Spec R^□_X} → f_*𝒪_ℛ injective; (2) ℛ[1/p] → Spec R^□[1/p] is a closed immersion; (3) the fibre Y over the closed point is geometrically connected; (4) ℛ has a smooth algebraization along Y. If such a resolution exist… := sorry
* `R08.6/kw-local-conditions` (definition): The local conditions of KW II.
  - `TauCeti.GaloisDeformation.Local.KWCondition` (structure) : A KW II local condition at v, with its choices. := sorry
  - `TauCeti.GaloisDeformation.Local.KWCondition.ring` (constructor) : R̄^{□,ψ}_v as the flat reduced quotient classifying X_v-lifts. := sorry
  - `TauCeti.GaloisDeformation.Local.KWCondition.points` (characterisation) : 𝒪′-points of the ring are exactly the X_v-lifts. := sorry
  - example `kwCondition_infinity` (computation) : Odd lifts at a real place. := sorry
  - example `kwCondition_points` (characterisation) : The ring classifies exactly the X_v-lifts on 𝒪′-points. := sorry
  - example `kwCondition_choice_needed` (non-example) : For unramified ρ̄_v = η̄₁ ⊕ η̄₂ with η̄₁ ≠ η̄₂, the union over both choices of the unramified-quotient character has two components, so it is not a domain; KW II fix one choice. := sorry
* `R08.6/export-archimedean` (theorem): Export: odd archimedean rings.
  - theorem `TauCeti.GaloisDeformation.Local.exportArchimedean` : At a real place v, R̄^{□,ψ}_∞ (odd lifts) is the completion of the quadric of 2 × 2 matrices with characteristic polynomial X² − 1 at ρ̄(c). It is a domain, flat over 𝒪 of relative dimension 2, with regular generic fibre. It is formally smooth when ρ̄(c) ≠ 1, which always holds for p ≠ 2. For p = 2 and ρ̄(c) = 1 it is 𝒪⟦X₁, X₂, X₃⟧/(X₁² + X₂X₃ + 2X₁), a relative complete intersection. := sorry
* `R08.6/export-fontaine-laffaille-irreducible` (theorem): Export: irreducible residual representation, low-weight crystalline.
  - theorem `TauCeti.GaloisDeformation.Local.exportFontaineLaffailleIrreducible` : Let F_v = ℚ_p and ρ̄_p be irreducible of weight k ≤ p. The ring of crystalline lifts of weight k with fixed determinant is formally smooth over 𝒪 of relative dimension 1, and the framed ring R̄^{□,ψ}_v is formally smooth of relative dimension 4 = 3 + [ℚ_p : ℚ_p]. The same holds for p = 2 (k = 2). := sorry
* `R08.6/export-weight-two-irreducible` (theorem): Export: irreducible residual representation, weight two.
  - theorem `TauCeti.GaloisDeformation.Local.exportWeightTwoIrreducible` : Let p ≠ 2, F_v = ℚ_p and ρ̄_p irreducible. After enlarging 𝒪, the fixed-determinant ring of weight-two potentially semistable lifts of the prescribed inertial type is 𝒪⟦T₁, T₂⟧/(T₁T₂ − p), and every 𝒪′-point is of the required type. The framed ring R̄^{□,ψ}_v ≅ 𝒪⟦T₁, …, T₅⟧/(T₁T₂ − p) is a domain, flat of relative dimension 4, with regular generic fibre, and it is not formally smooth. := sorry
* `R08.6/export-ordinary` (theorem): Export: ordinary rings of low weight or weight two.
  - theorem `TauCeti.GaloisDeformation.Local.exportOrdinary` : Let F_v/ℚ_p be unramified, ρ̄_v ordinary with k(ρ̄_v) ≤ p, and X_v the low-weight crystalline or weight-two potentially Barsotti–Tate condition, with the chosen unramified character. Then R̄^{□,ψ}_v is a domain, flat over 𝒪 of relative dimension 3 + [F_v : ℚ_p], with regular generic fibre. It is formally smooth if ρ̄_v is ramified or ρ̄_v ≅ η₁ ⊕ η₂ with η₁ ≠ η₂ unramified. Every lift of this type … := sorry
* `R08.6/export-semistable-weight-two-at-p` (theorem): Export: semistable weight-two rings above p.
  - theorem `TauCeti.GaloisDeformation.Local.exportSemistableWeightTwoAtP` : Let ρ̄_v = (γ̄_vχ̄_p ∗; 0 γ̄_v) with γ̄_v unramified, and X_v the semistable weight-two lifts (γ_vχ_p ∗; 0 γ_v) with a fixed unramified γ_v lifting γ̄_v and γ_v²χ_p = φ. R̄^{□,ψ}_v is formally smooth over 𝒪 of relative dimension 3 + [F_v : ℚ_p], unless p = 2 and D_v acts by homotheties. In that case it is a domain, faithfully flat of relative dimension 3 + [F_v : ℚ_p], with regular generic fibre. := sorry
* `R08.6/export-endpoint-weight` (theorem): Export: crystalline lifts of weight p + 1.
  - theorem `TauCeti.GaloisDeformation.Local.exportEndpointWeight` : Let p ≠ 2, F_v/ℚ_p unramified and k(ρ̄_v) = p + 1. The framed ring of crystalline (hence ordinary) lifts of weight p + 1 is formally smooth over 𝒪 of relative dimension 3 + [F_v : ℚ_p]. The map to the space of characters of the stable line is not formally smooth. := sorry
* `R08.6/export-away-from-p` (theorem): Export: rings at finite places away from p.
  - theorem `TauCeti.GaloisDeformation.Local.exportAwayFromP` : Let v ∤ p. (a) Semistable condition (γ_vχ_p ∗; 0 γ_v) with a fixed character γ_v (Teichmüller on inertia, γ_v²χ_p = φ): R̄^{□,ψ}_v is a domain, flat of relative dimension 3, with regular generic fibre (§3.3.4). (b) Inertia-rigid conditions (minimally ramified, abelian with fixed inertial character, non-abelian of level two with F_v = ℚ_q): after enlarging 𝒪 there is a lift ρ₀ with finite ρ₀(I_v) a… := sorry
* `R08.6/export-completed-tensor-product` (theorem): Export: the completed tensor product of KW II's local rings.
  - theorem `TauCeti.GaloisDeformation.Local.exportCompletedTensorProduct` : For S a finite set of places and conditions X_v of kw-local-conditions at each v ∈ S, after enlarging 𝒪, R̄^{□,loc,ψ} = ⊗̂_{v∈S} R̄^{□,ψ}_v is flat over 𝒪, each component has relative dimension 3|S| when F is totally real and S contains the infinite places and the places above p, and R̄^{□,loc,ψ}[1/p] is regular. If the conditions at the finite places of S not above p are semistable, it is a domai… := sorry
* `R08.6/local-nonemptiness` (theorem): Nonemptiness of KW II's local rings.
  - theorem `TauCeti.GaloisDeformation.Local.localNonemptiness` : For every condition X_v of kw-local-conditions (with the hypotheses of KW II Theorem 3.1), R̄^{□,ψ}_v ≠ 0, and it has a point over the integers 𝒪′ of a finite extension of E, that is, a lift of ρ̄_v of type X_v. The same holds for their completed tensor product. := sorry
* `R08.6/kw1-lift-types` (theorem): The local conditions of KW I Theorem 5.1.
  - theorem `TauCeti.GaloisDeformation.Local.kw1LiftTypes` : KW I Theorem 5.1 lifts ρ̄ (S-type, 2 ≤ k(ρ̄) ≤ p + 1 for p > 2) to an almost strictly compatible system whose p-adic member has one of the following local types; each is exported with its ring, dimension, nonemptiness and tangent condition: (1) minimally ramified at primes ≠ p (R08.2/minimally-ramified-ring, R08.5/dyadic-minimal-lifts; R08.6/export-away-from-p) and crystalline of weight k(ρ̄) at p… := sorry
* `R08.6/good-dihedral-type` (theorem): The good-dihedral local condition at q ≡ −1 mod p.
  - theorem `TauCeti.GaloisDeformation.Local.goodDihedralType` : Let q ≠ p be a prime with p | q + 1, and ρ̄|D_q ≅ (χ_p ∗; 0 1) up to unramified twist. Let {χ′, χ′^q} be a pair of ℤ_p-valued characters of I_q of level 2 (factoring through 𝔽_{q²}^× but not 𝔽_q^×) of p-power order, χ′ = ω_{q,2}^i ω_{q,2}^{qj} with 0 ≤ j < i ≤ q − 1, and i + j even when p = 2. The lifts with ρ|I_q ≅ χ′ ⊕ χ′^q (induced from a character of G_{ℚ_{q²}}) and fixed determinant form the … := sorry
* `R08.6/dyadic-weight-two-transition` (theorem): The dyadic weight-two transition: k(ρ̄) = 2 versus k(ρ̄) = 4 at p = 2.
  - theorem `TauCeti.GaloisDeformation.Local.dyadicWeightTwoTransition` : Let p = 2, F_v = ℚ₂ (or F_v/ℚ₂ unramified for reducible ρ̄_v), and φ = ψχ₂ a fixed determinant. The weight-two lifts used in KW I Theorem 5.1(2) and KW II §3.2.2(i) at p = 2 are: crystalline of weight 2 (equivalently Barsotti–Tate with det|I_v = χ₂) if k(ρ̄_v) = 2, and semistable of weight 2 with inertial Weil–Deligne parameter (id, N ≠ 0) if k(ρ̄_v) = 4. In the first case R̄^{□,ψ}_v is Kisin's 2-… := sorry
* `R08.6/ordinary-pcris-lifts-reducible` (theorem): Ordinary potentially crystalline local lifts of reducible residual representations.
  - theorem `TauCeti.GaloisDeformation.Local.ordinaryPcrisLiftsReducible` : Let p ≥ 3, ρ̄ ∼ (χ̄ ∗; 0 1) a two-dimensional residual representation of G_{F,S}, and μ = κ^{r−1}χ₀ (r ≥ 2, χ₀ of finite order) a geometric lift of det ρ̄. After enlarging 𝒪, for v | p there is an ordinary potentially crystalline lift ρ_v of ρ̄|G_{F_v} with Hodge–Tate weights {0, r − 1} and determinant μ; and there is always an ordinary potentially crystalline lift with Hodge–Tate weights {0, r − … := sorry
* `R08.6/serre-weight-crystalline-lift` (theorem): A crystalline lift in Serre weight.
  - theorem `TauCeti.GaloisDeformation.Local.serreWeightCrystallineLift` : Let ρ̄_p : G_{ℚ_p} → GL₂(k) (or G_{F_v} with F_v = ℚ_p at each v | p) and r = k(ρ̄_p) Serre's weight (Serre 1987 §2.3). After enlarging 𝒪 there is a crystalline lift ρ_p of ρ̄_p with Hodge–Tate weights {0, r − 1}; when ρ̄_p is reducible it may be chosen ordinary with an unramified quotient. := sorry
* `R08.6/newton-thorne-local-quotients` (application): Local quotients for weight-two symmetric power lifting (Newton–Thorne §4).
  - theorem `TauCeti.GaloisDeformation.Local.newtonThorneLocalQuotients` : Let r : G_F → GL₂(k) with det = ε^{-1} and R_v the fixed-determinant lifting ring at v. The local quotients R̄_v used in Newton–Thorne §4 are: (1) v | p, r_{π,ι}|G_{F_v} non-ordinary: the reduced 𝒪-torsion-free quotient of crystalline non-ordinary lifts of Hodge–Tate weights {0, 1}, a domain of dimension 4 + [F_v:ℚ_p] (Kisin, Corollary 2.3.13); (2) v | p, ordinary crystalline: the ordinary crystal… := sorry
* `R08.6/torsion-semistable-condition` (theorem): Torsion semistable lifts with Hodge–Tate weights in {0, 1} form a stable condition.
  - theorem `TauCeti.GaloisDeformation.Local.torsionSemistableCondition` : Let F_v/ℚ_p be finite and r̄ : G_{F_v} → GL₂(k). The condition on a lift r_B (B ∈ C_𝒪 Artinian) that B² be isomorphic, as ℤ_p[G_{F_v}]-module, to a subquotient of a lattice in a semistable ℚ_p[G_{F_v}]-representation with Hodge–Tate weights in {0, 1} is stable (closed under subobjects, quotients and finite direct sums in the sense of Ramakrishna), so it cuts out a quotient R′_v of the fixed-determ… := sorry
* `R08.6/category-deformation-conditions` (construction): Deformation conditions cut out by a category S (BCDT §4.3).
  - `TauCeti.GaloisDeformation.Local.CategoryCondition` (data) : A full subcategory S ⊂ S(ρ̄) closed under isomorphism, finite products, subobjects and quotients, containing V. := sorry
  - `TauCeti.GaloisDeformation.Local.CategoryCondition.defFunctor` (constructor) : D^S_{V,𝒪} and D^{ψ,S}_{V,𝒪}. := sorry
  - `TauCeti.GaloisDeformation.Local.CategoryCondition.ring` (constructor) : R^S_{V,𝒪}, R^{ψ,S}_{V,𝒪}, quotients of R_{V,𝒪}, R^ψ_{V,𝒪}. := sorry
  - `TauCeti.GaloisDeformation.Local.CategoryCondition.tangent` (characterisation) : Tangent space of D^{ψ,S} is H¹_S(G_ℓ, ad⁰ρ̄) ⊂ H¹(G_ℓ, ad⁰ρ̄). := sorry
  - `TauCeti.GaloisDeformation.Local.CategoryCondition.flat` (compatibility) : For S the finite flat modules, D^S is R08.4/flat-deformation-condition. := sorry
  - example `categoryCondition_all` (degenerate) : S = S(ρ̄): R^S_{V,𝒪} = R_{V,𝒪}. := sorry
  - example `categoryCondition_flat` (compatibility) : S = finite flat 𝒪[G_ℓ]-modules (ℓ = p): R^S is the flat deformation ring. := sorry
  - example `categoryCondition_not_closed` (non-example) : The subcategory of modules with a filtration by V whose extension classes are all split is not closed under quotients of nontrivial extensions in general, so it does not define a deformation condition. := sorry
  - example `categoryCondition_tangent_dim` (computation) : For S = finite flat, ρ̄ peu ramifié of weight 2 over ℚ_p: dim H¹_S(G_p, ad⁰ρ̄) = 1 + dim H⁰(G_p, ad⁰ρ̄). := sorry

-/
