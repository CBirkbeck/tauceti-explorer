import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.Tactic.LinearCombination

/-!
# Suggested Lean forms: local Galois deformation rings (LocalGaloisDeformationRings, R08.1–R08.4, R08.6, L7)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`LocalGaloisDeformationRings`) is definitive. The statements below suggest Lean forms, so that
contributors and reviewers converge on names and signatures. Every proof of a new declaration is
`sorry`; nothing here claims to be formalised.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. This file imports Mathlib only; the
generic functors (`Lift`, `Def`, `PhiP`, …) are those of the GlobalGaloisDeformations suggested
file, and the local statements that use them are recorded in the comment block below.

The concrete content here is the archimedean ring at `p = 2`: a lift of complex conjugation with
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

end TauCeti.GaloisDeformation.Local.SuggestedTest
