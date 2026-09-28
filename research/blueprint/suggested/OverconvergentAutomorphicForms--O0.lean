import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.GroupTheory.Index
import Mathlib.Analysis.Normed.Ring.Basic
import Mathlib.Analysis.Normed.Unbundled.RingSeminorm
import Mathlib.RingTheory.Norm.Basic
import Mathlib.Topology.Algebra.Module.ModuleTopology
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.LinearAlgebra.FreeModule.Finite.Basic

/-!
# Suggested Lean forms: Hilbert weights (OverconvergentAutomorphicForms, part O0)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`OverconvergentAutomorphicForms`, layer O0) is definitive. The statements below suggest Lean
forms, so that contributors and reviewers converge on names and signatures. Every proof of a new
declaration is `sorry`; nothing here claims to be formalised.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`.

## Conventions

* `𝒪_p` is `ℤ_[p] ⊗[ℤ] 𝓞 F` with the `ℤ_p`-module topology (scalars on the left, so that the
  pinned base-change instances apply); `T(ℤ_p) = 𝒪_pˣ`.
* Weight spaces are given by their functors of points: continuous characters of `𝒪_pˣ`
  (for `G*`) or of `𝒪_pˣ × ℤ_pˣ` (for `G`) with values in a topological ring. The rigid spaces
  representing them belong to PadicMeasuresIwasawaAlgebras L0a.
* The weight map uses `x ↦ (x², N(x)⁻¹)`, which BHW's displayed formula `κ = w²·(t⁻¹ ∘ N)`
  requires (their printed map lacks the inversion; source issue E1).
* `|T_κ|` is a supremum over the pro-`p` subgroup `1 + p^{r₀} 𝒪_p`, not over all of `𝒪_pˣ`
  (source issue E2).
* The analytic continuation of bounded weights (BHW Proposition 6.3) has no signature here: it
  needs LocallyAnalyticDistributions L0's Banach spaces of analytic functions and the adic
  thickenings `B_r(𝒪_pˣ : 1)`, which the pinned libraries do not provide.
-/

open NumberField TensorProduct

noncomputable section

namespace TauCeti.HilbertWeight

variable (F : Type*) [Field F] [NumberField F] (p : ℕ) [Fact p.Prime]

/-- **`O0/units-at-p`**. `𝒪_p := ℤ_p ⊗_ℤ 𝒪_F`. -/
abbrev Op : Type _ := ℤ_[p] ⊗[ℤ] 𝓞 F

instance : Module.Finite ℤ_[p] (Op F p) := inferInstance

instance : Module.Free ℤ_[p] (Op F p) := inferInstance

instance : TopologicalSpace (Op F p) := moduleTopology ℤ_[p] (Op F p)

instance : IsModuleTopology ℤ_[p] (Op F p) := ⟨rfl⟩

instance : IsTopologicalRing (Op F p) := IsModuleTopology.isTopologicalRing ℤ_[p] (Op F p)

/-- API: `𝒪_p` is compact. -/
theorem compactSpace_Op : CompactSpace (Op F p) := sorry

/-- API: `𝒪_p` has rank `[F : ℚ]` over `ℤ_p`. -/
theorem finrank_Op : Module.finrank ℤ_[p] (Op F p) = Module.finrank ℚ F := sorry

/-- **`O0/norm-at-p`**. The norm `𝒪_pˣ → ℤ_pˣ`, the determinant of multiplication over `ℤ_p`. -/
def normUnits : (Op F p)ˣ →* ℤ_[p]ˣ := Units.map (Algebra.norm ℤ_[p] : Op F p →* ℤ_[p])

/-- API: the norm is continuous. -/
theorem continuous_normUnits : Continuous (normUnits F p) := sorry

/-- API: on global integers the norm is `N_{F/ℚ}`. -/
theorem norm_tmul_one (a : 𝓞 F) :
    Algebra.norm ℤ_[p] ((1 : ℤ_[p]) ⊗ₜ[ℤ] a) = ((Algebra.norm ℤ a : ℤ) : ℤ_[p]) := sorry

/-- Global units as units at `p`. -/
def unitsToOp : (𝓞 F)ˣ →* (Op F p)ˣ :=
  Units.map (Algebra.TensorProduct.includeRight : 𝓞 F →ₐ[ℤ] Op F p).toMonoidHom

/-- API: `N(1 ⊗ η) = N_{F/ℚ}(η)` on global units. -/
theorem normUnits_unitsToOp (η : (𝓞 F)ˣ) :
    ((normUnits F p (unitsToOp F p η) : ℤ_[p]ˣ) : ℤ_[p]) =
      ((Algebra.norm ℤ (η : 𝓞 F) : ℤ) : ℤ_[p]) := sorry

/-- **`O0/principal-units`**. `1 + p^r 𝒪_p`, an open subgroup of `𝒪_pˣ`; pro-`p` for `r ≥ 1`. -/
def principalUnits (r : ℕ) : Subgroup (Op F p)ˣ where
  carrier := {x | (x : Op F p) - 1 ∈ Ideal.span {((p : Op F p)) ^ r}}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- API: principal units are open. -/
theorem isOpen_principalUnits (r : ℕ) : IsOpen ((principalUnits F p r : Set (Op F p)ˣ)) := sorry

/-- API: the index of `1 + p^r 𝒪_p` is finite. -/
theorem finiteIndex_principalUnits (r : ℕ) : (principalUnits F p r).FiniteIndex := sorry

/-- API: the principal units decrease with `r`. -/
theorem principalUnits_antitone {r s : ℕ} (h : r ≤ s) :
    principalUnits F p s ≤ principalUnits F p r := sorry

section Weights

variable (R : Type*) [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

/-- **`O0/geometric-weight-characters`**. The `R`-points of the weight space `𝒲*` for `G*`:
continuous characters `𝒪_pˣ → Rˣ`. Representability by a rigid space is PadicMeasuresIwasawaAlgebras
L0a's. -/
abbrev GeomWeight := ContinuousMonoidHom (Op F p)ˣ Rˣ

/-- **`O0/arithmetic-weight-characters`**. The `R`-points of the weight space `𝒲` for `G`:
continuous characters of `𝒪_pˣ × ℤ_pˣ`. -/
abbrev ArithWeight := ContinuousMonoidHom ((Op F p)ˣ × ℤ_[p]ˣ) Rˣ

/-- A pair `(w, t)` as an arithmetic weight. -/
def ArithWeight.mk (w : GeomWeight F p R) (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ) :
    ArithWeight F p R :=
  (w.comp (ContinuousMonoidHom.fst _ _)) * (t.comp (ContinuousMonoidHom.snd _ _))

/-- API: every arithmetic weight is a pair `(w, t)`, uniquely. -/
theorem ArithWeight.bijective_mk :
    Function.Bijective (fun wt : GeomWeight F p R × ContinuousMonoidHom ℤ_[p]ˣ Rˣ ↦
      ArithWeight.mk F p R wt.1 wt.2) := sorry

/-- API: `(mk w t)(x, y) = w(x) t(y)`. -/
@[simp] theorem ArithWeight.mk_apply (w : GeomWeight F p R) (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ)
    (x : (Op F p)ˣ) (y : ℤ_[p]ˣ) : ArithWeight.mk F p R w t (x, y) = w x * t y := sorry

/-- **`O0/weight-dual-group-map`**. `x ↦ (x², N(x)⁻¹)`: the group map dual to `ρ`, with the
inversion on the second coordinate (BHW Definition 6.1 prints `x ↦ (x², N(x))`; source issue E1). -/
def weightDualMap : ContinuousMonoidHom (Op F p)ˣ ((Op F p)ˣ × ℤ_[p]ˣ) where
  toMonoidHom :=
    { toFun := fun x ↦ (x ^ 2, (normUnits F p x)⁻¹)
      map_one' := by simp
      map_mul' := fun x y ↦ by
        ext1 <;> simp only [Prod.fst_mul, Prod.snd_mul, map_mul, mul_inv]
        exact mul_pow x y 2 }
  continuous_toFun := sorry

omit [NumberField F] in
/-- API: `ι(x) = (x², N(x)⁻¹)`. -/
@[simp] theorem weightDualMap_apply (x : (Op F p)ˣ) :
    weightDualMap F p x = (x ^ 2, (normUnits F p x)⁻¹) := rfl

/-- API: on a totally positive global unit of a totally real field, `ι(η) = (η², 1)`. -/
theorem weightDualMap_unitsToOp [NumberField.IsTotallyReal F] (η : (𝓞 F)ˣ)
    (hη : ∀ φ : F →+* ℝ, 0 < φ ((η : 𝓞 F) : F)) :
    weightDualMap F p (unitsToOp F p η) = (unitsToOp F p η ^ 2, 1) := sorry

/-- **`O0/weight-comparison`**. `ρ : 𝒲 → 𝒲*` on `R`-points: pull back along `weightDualMap`. -/
def weightMap (κ : ArithWeight F p R) : GeomWeight F p R := κ.comp (weightDualMap F p)

/-- API: `ρ` is a group homomorphism. -/
theorem weightMap_mul (κ κ' : ArithWeight F p R) :
    weightMap F p R (κ * κ') = weightMap F p R κ * weightMap F p R κ' := sorry

/-- **`O0/weight-comparison-formula`**. `ρ(w, t) = w² · (t⁻¹ ∘ N)`. -/
theorem weightMap_mk_apply (w : GeomWeight F p R) (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ)
    (x : (Op F p)ˣ) :
    weightMap F p R (ArithWeight.mk F p R w t) x = w x ^ 2 * (t (normUnits F p x))⁻¹ := sorry

/-- **`O0/weight-comparison-norm-factor`**. `κ(x) · w(x⁻²)` factors through the norm. -/
theorem weightMap_mk_mul_inv_sq (w : GeomWeight F p R) (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ)
    (x : (Op F p)ˣ) :
    weightMap F p R (ArithWeight.mk F p R w t) x * (w x ^ 2)⁻¹ = (t (normUnits F p x))⁻¹ := sorry

/-- **`O0/weight-comparison-totally-positive-units`** (BHW (9.1)). For a totally real `F` and a
totally positive unit `η`, `κ⁻¹(η) w(η²) = t(N η) = 1`. -/
theorem weightMap_mk_totallyPositive [NumberField.IsTotallyReal F]
    (w : GeomWeight F p R) (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ) (η : (𝓞 F)ˣ)
    (hη : ∀ φ : F →+* ℝ, 0 < φ ((η : 𝓞 F) : F)) :
    (weightMap F p R (ArithWeight.mk F p R w t) (unitsToOp F p η))⁻¹ *
      w (unitsToOp F p η) ^ 2 = 1 := sorry

end Weights

section Bounded

variable (A : Type*) [NormedCommRing A]

/-- `r₀ = 1` for odd `p` and `r₀ = 3` for `p = 2` (BHW Proposition 6.3). -/
def r0 : ℕ := if p = 2 then 3 else 1

/-- **`O0/weight-radius-parameter`**. `|T_κ| := sup ‖κ(x) - 1‖` over the pro-`p` subgroup
`1 + p^{r₀} 𝒪_p`. BHW take the supremum over all of `𝒪_pˣ`, which gives `1` for every character
nontrivial on the prime-to-`p` torsion (source issue E2). -/
def radiusParameter (κ : GeomWeight F p A) : ℝ :=
  ⨆ x : principalUnits F p (r0 p), ‖((κ x : Aˣ) : A) - 1‖

/-- API: the trivial character has radius parameter `0`. -/
theorem radiusParameter_one : radiusParameter F p A 1 = 0 := sorry

/-- API: `0 ≤ |T_κ|`. -/
theorem radiusParameter_nonneg (κ : GeomWeight F p A) : 0 ≤ radiusParameter F p A κ := sorry

/-- **`O0/continuous-character-bounded`**. Over a complete normed `ℚ_p`-algebra with
ultrametric power-multiplicative norm (a uniform Banach algebra, such as an affinoid algebra with its spectral
norm), every continuous character has `|T_κ| < 1`: this is "affinoid images are bounded" at the
level of coefficients. -/
theorem radiusParameter_lt_one [NormedAlgebra ℚ_[p] A] [NormOneClass A] [CompleteSpace A]
    [IsUltrametricDist A]
    (hA : IsPowMul (norm : A → ℝ)) (κ : GeomWeight F p A) : radiusParameter F p A κ < 1 := sorry

end Bounded

end TauCeti.HilbertWeight

namespace TauCeti.HilbertWeight.SuggestedTest

open TauCeti.HilbertWeight

variable (p : ℕ) [Fact p.Prime]

/-- `𝒪_p` for `F = ℚ` is `ℤ_p`. -/
example : Nonempty (Op ℚ p ≃ₐ[ℤ_[p]] ℤ_[p]) := sorry

/-- `𝒪_p` is not discrete. -/
example (F : Type*) [Field F] [NumberField F] : ¬ DiscreteTopology (Op F p) := sorry

/-- The norm of `-1` is `(-1)^[F:ℚ]`. -/
example (F : Type*) [Field F] [NumberField F] :
    ((normUnits F p (-1) : ℤ_[p]ˣ) : ℤ_[p]) = (-1) ^ Module.finrank ℚ F := sorry

/-- Weight map at `t = 1`: `ρ(w, 1) = w²`. -/
example (F : Type*) [Field F] [NumberField F] (R : Type*) [CommRing R] [TopologicalSpace R]
    [IsTopologicalRing R] (w : GeomWeight F p R) (x : (Op F p)ˣ) :
    weightMap F p R (ArithWeight.mk F p R w 1) x = w x ^ 2 := sorry

/-- Weight map at `w = 1`: `ρ(1, t) = t⁻¹ ∘ N`. -/
example (F : Type*) [Field F] [NumberField F] (R : Type*) [CommRing R] [TopologicalSpace R]
    [IsTopologicalRing R] (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ) (x : (Op F p)ˣ) :
    weightMap F p R (ArithWeight.mk F p R 1 t) x = (t (normUnits F p x))⁻¹ := sorry

/-- `1 + p⁰ 𝒪_p` is all of `𝒪_pˣ`. -/
example (F : Type*) [Field F] [NumberField F] : principalUnits F p 0 = ⊤ := sorry

/-- For `F = ℚ` and odd `p`, a nontrivial `(p-1)`-st root of unity is not in `1 + p ℤ_p`
(so the prime-to-`p` torsion is excluded from the radius parameter). -/
example (hp : p ≠ 2) (ζ : (Op ℚ p)ˣ) (hζ : ζ ^ (p - 1) = 1) (hζ1 : ζ ≠ 1) :
    ζ ∉ principalUnits ℚ p 1 := sorry

end TauCeti.HilbertWeight.SuggestedTest
