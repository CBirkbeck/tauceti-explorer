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
import Mathlib.RepresentationTheory.Basic
import Mathlib.RepresentationTheory.Invariants
import Mathlib.Algebra.Group.Action.Opposite
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.Data.Matrix.Basic

/-!
# Suggested Lean forms: Hilbert coefficients (part O0, scope O0–O7)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`OverconvergentAutomorphicForms`, layers O0–O7) is definitive. The statements below suggest Lean
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
  (source issue E2; its value is not the AIP universal-coordinate parameter).
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

/-- Geometric weights use the baseline continuous hom, not another character structure. -/
theorem GeomWeight.ext {κ κ' : GeomWeight F p R} (h : ∀ x, κ x = κ' x) : κ = κ' := sorry

def GeomWeight.pullback (κ : GeomWeight F p R)
    (f : ContinuousMonoidHom (Op F p)ˣ (Op F p)ˣ) : GeomWeight F p R := κ.comp f

@[simp] theorem GeomWeight.one_apply (x : (Op F p)ˣ) :
    (1 : GeomWeight F p R) x = 1 := sorry

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
nontrivial on the prime-to-`p` torsion (source issue E2; its value is not the AIP universal-coordinate parameter). -/
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


/-! ## Named weight acceptance examples
The comment immediately above each `example` is its stable packet test name.
The Gaussian fraction field and the two characters are genuine test fixtures;
their unproved constructions/specifications use `sorry` on the actual carrier.
-/
namespace TauCeti.HilbertWeight.Test
open TauCeti.HilbertWeight
variable (p : ℕ) [Fact p.Prime]
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩

-- op_rat
example : Nonempty (Op ℚ p ≃ₐ[ℤ_[p]] ℤ_[p]) := sorry

-- op_not_discrete
example (F : Type*) [Field F] [NumberField F] : ¬ DiscreteTopology (Op F p) := sorry

/-- A concrete carrier for Q(i), avoiding a symbol for an unknown number field. -/
abbrev GaussianField := FractionRing GaussianInt
instance : NumberField GaussianField := sorry
-- op_split
example : Nonempty (Op GaussianField 5 ≃ₐ[ℤ_[5]] (ℤ_[5] × ℤ_[5])) := sorry

-- norm_rat
example (e : Op ℚ p ≃ₐ[ℤ_[p]] ℤ_[p]) (x : (Op ℚ p)ˣ) :
    normUnits ℚ p x = Units.map e.toMonoidHom x := sorry
-- norm_neg_one
example (F : Type*) [Field F] [NumberField F] :
    ((normUnits F p (-1) : ℤ_[p]ˣ) : ℤ_[p]) = (-1) ^ Module.finrank ℚ F := sorry
-- norm_not_trivial
example (F : Type*) [Field F] [NumberField F] (h : Odd (Module.finrank ℚ F)) :
    normUnits F p ≠ 1 := sorry

-- principalUnits_zero
example (F : Type*) [Field F] [NumberField F] : principalUnits F p 0 = ⊤ := sorry
-- principalUnits_rat
example (hp : p ≠ 2) : (principalUnits ℚ p 1).index = p - 1 := sorry
-- principalUnits_root_of_unity
example (hp : p ≠ 2) (ζ : (Op ℚ p)ˣ) (hζ : ζ ^ (p - 1) = 1) (hζ1 : ζ ≠ 1) :
    ζ ∉ principalUnits ℚ p 1 := sorry

section Characters
variable (F : Type*) [Field F] [NumberField F]
variable (R : Type*) [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]
-- geomWeight_trivial
example : (1 : GeomWeight F p R) 1 = 1 := sorry
-- geomWeight_norm
example : ∃ κ : GeomWeight F p ℚ_[p], ∀ x,
    ((κ x : ℚ_[p]ˣ) : ℚ_[p]) = ((normUnits F p x : ℤ_[p]ˣ) : ℤ_[p]) := sorry
-- geomWeight_rat
example : Nonempty (GeomWeight ℚ p R ≃* ContinuousMonoidHom ℤ_[p]ˣ Rˣ) := sorry
-- arithWeight_trivial
example : ArithWeight.mk F p R 1 1 = 1 := sorry
-- arithWeight_rat
example : Nonempty (ArithWeight ℚ p R ≃*
    (ContinuousMonoidHom ℤ_[p]ˣ Rˣ × ContinuousMonoidHom ℤ_[p]ˣ Rˣ)) := sorry
-- arithWeight_mk_injective
example (w w' : GeomWeight F p R) (t t' : ContinuousMonoidHom ℤ_[p]ˣ Rˣ)
    (h : ArithWeight.mk F p R w t = ArithWeight.mk F p R w' t') : w = w' ∧ t = t' := sorry
-- weightDualMap_rat
example (e : Op ℚ p ≃ₐ[ℤ_[p]] ℤ_[p]) (x : (Op ℚ p)ˣ) :
    weightDualMap ℚ p x = (x ^ 2, (Units.map e.toMonoidHom x)⁻¹) := sorry
-- weightDualMap_one
example : weightDualMap F p 1 = (1, 1) := sorry
-- weightDualMap_not_printed
example : (fun x : (Op ℚ 5)ˣ => weightDualMap ℚ 5 x) ≠
    (fun x : (Op ℚ 5)ˣ => (x ^ 2, normUnits ℚ 5 x)) := sorry
-- weightMap_t_one
example (w : GeomWeight F p R) (x : (Op F p)ˣ) :
    weightMap F p R (ArithWeight.mk F p R w 1) x = w x ^ 2 := sorry
-- weightMap_w_one
example (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ) (x : (Op F p)ˣ) :
    weightMap F p R (ArithWeight.mk F p R 1 t) x = (t (normUnits F p x))⁻¹ := sorry
-- weightMap_rat
example (e : Op ℚ p ≃ₐ[ℤ_[p]] ℤ_[p])
    (w : GeomWeight ℚ p R) (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ) (x : (Op ℚ p)ˣ) :
    weightMap ℚ p R (ArithWeight.mk ℚ p R w t) x =
      w x ^ 2 * (t (Units.map e.toMonoidHom x))⁻¹ := sorry
end Characters

/-- The Teichmuller test fixture is specified by the torsion/congruence conditions below. -/
def teichWeight : GeomWeight ℚ p ℚ_[p] := sorry
theorem teichWeight_spec (x : (Op ℚ p)ˣ) :
    (teichWeight p x) ^ (p - 1) = 1 ∧
    ‖((teichWeight p x : ℚ_[p]ˣ) : ℚ_[p]) -
      (((normUnits ℚ p x : ℤ_[p]ˣ) : ℤ_[p]) : ℚ_[p])‖ < 1 := sorry

/-- Power of the rational norm character, used only as a test fixture. -/
def powerWeight (k : ℕ) : GeomWeight ℚ p ℚ_[p] where
  toMonoidHom := (Units.map (algebraMap ℤ_[p] ℚ_[p]).toMonoidHom).comp
    ((powMonoidHom k).comp (normUnits ℚ p))
  continuous_toFun := sorry
-- radius_trivial
example : radiusParameter ℚ p ℚ_[p] 1 = 0 := sorry
-- radius_teichmuller
example (hp : p ≠ 2) : radiusParameter ℚ p ℚ_[p] (teichWeight p) = 0 := sorry
-- radius_power
example (hp : p ≠ 2) (k : ℕ) :
    radiusParameter ℚ p ℚ_[p] (powerWeight p k) = ‖((p * k : ℕ) : ℚ_[p])‖ := sorry
end TauCeti.HilbertWeight.Test

/-! ## Algebraic vector-cocycle core
The right action is Mathlib's action of the opposite group. The laws below
are typed algebraic identities; the unprovided analytic condition is omitted,
with its exact supplier contract in the register. This core is not an adic torsor.
-/
namespace TauCeti.Overconvergent
open MulOpposite
variable (Γ X C : Type*) [Group Γ] [Group C] [MulAction Γᵐᵒᵖ X]

/-- O1/right-automorphy-cocycle, algebraic part. -/
structure RightCocycle where
  j : Γ → X → C
  one : ∀ x, j 1 x = 1
  mul : ∀ γ δ x, j (γ * δ) x = j γ x * j δ (op γ • x)

namespace right_automorphy_cocycle
variable {Γ X C}
theorem ext (J J' : RightCocycle Γ X C) (h : ∀ γ x, J.j γ x = J'.j γ x) :
    J = J' := sorry

def trivial : RightCocycle Γ X C where
  j _ _ := 1
  one := sorry
  mul := sorry

theorem apply_one (J : RightCocycle Γ X C) (x : X) : J.j 1 x = 1 := sorry
theorem apply_mul (J : RightCocycle Γ X C) (γ δ : Γ) (x : X) :
    J.j (γ * δ) x = J.j γ x * J.j δ (op γ • x) := sorry

variable (A V : Type*) [CommRing A] [AddCommGroup V] [Module A V]
/-- Genuine vector-valued algebraic equivariance, using the baseline representation. -/
def equivariant (J : RightCocycle Γ X C) (ρ : Representation A C V) : Submodule A (X → V) where
  carrier := {f | ∀ γ x, f (op γ • x) = ρ (J.j γ x)⁻¹ (f x)}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

theorem mem_equivariant (J : RightCocycle Γ X C) (ρ : Representation A C V)
    (f : X → V) : f ∈ equivariant A V J ρ ↔
      ∀ γ x, f (op γ • x) = ρ (J.j γ x)⁻¹ (f x) := sorry

def gauge (J : RightCocycle Γ X C) (b : X → C) : RightCocycle Γ X C where
  j γ x := (b x)⁻¹ * J.j γ x * b (op γ • x)
  one := sorry
  mul := sorry

theorem gauge_equivariant (J : RightCocycle Γ X C) (ρ : Representation A C V)
    (b : X → C) (f : equivariant A V J ρ) :
    (fun x => ρ (b x)⁻¹ (f.1 x)) ∈ equivariant A V (gauge J b) ρ := sorry

/-- Inverse map is pointwise `ρ (b x)`; neither coefficient order is commuted. -/
def gaugeEquiv (J : RightCocycle Γ X C) (ρ : Representation A C V)
    (b : X → C) : equivariant A V J ρ ≃ₗ[A] equivariant A V (gauge J b) ρ := sorry

theorem gaugeEquiv_apply (J : RightCocycle Γ X C) (ρ : Representation A C V)
    (b : X → C) (f : equivariant A V J ρ) (x : X) :
    (gaugeEquiv A V J ρ b f).1 x = ρ (b x)⁻¹ (f.1 x) := sorry

theorem gaugeEquiv_symm_apply (J : RightCocycle Γ X C) (ρ : Representation A C V)
    (b : X → C) (f : equivariant A V (gauge J b) ρ) (x : X) :
    ((gaugeEquiv A V J ρ b).symm f).1 x = ρ (b x) (f.1 x) := sorry

/-- A left cocycle requires inversion of both the group element and coefficient.
The compatibility hypothesis identifies two actual actions, rather than adding an
unstated analytic condition to this algebraic core. -/
def ofLeft [MulAction Γ X] (K : Γ → X → C)
    (hKone : ∀ x, K 1 x = 1)
    (hKmul : ∀ γ δ x, K (γ * δ) x = K γ (δ • x) * K δ x)
    (hconvert : ∀ (γ : Γ) (x : X), op γ • x = γ⁻¹ • x) : RightCocycle Γ X C where
  j γ x := (K γ⁻¹ x)⁻¹
  one := sorry
  mul := sorry
end right_automorphy_cocycle

namespace Test
-- TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_trivial
example {Γ X : Type*} [Group Γ] [MulAction Γᵐᵒᵖ X]
    (A V : Type*) [CommRing A] [AddCommGroup V] [Module A V]
    (J : RightCocycle Γ X Unit) (f : X → V) :
    f ∈ right_automorphy_cocycle.equivariant A V J (Representation.trivial A Unit V) ↔
      ∀ γ : Γ, ∀ x, f (MulOpposite.op γ • x) = f x := sorry

/-- Scalar translation fixture with a genuine cocycle law. -/
def integerCocycle (u : ℚˣ) : RightCocycle (Multiplicative ℤ) (Multiplicative ℤ) ℚˣ where
  j γ _ := u ^ Multiplicative.toAdd γ
  one := sorry
  mul := sorry

def scalarRepresentation : Representation ℚ ℚˣ ℚ where
  toFun u :=
    { toFun := fun v => (u : ℚ) * v
      map_add' := sorry
      map_smul' := sorry }
  map_one' := sorry
  map_mul' := sorry
-- TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_scalarSign
example (u : ℚˣ) (f : Multiplicative ℤ → ℚ)
    (hf : f ∈ right_automorphy_cocycle.equivariant ℚ ℚ (integerCocycle u) scalarRepresentation)
    (n : ℤ) (x : Multiplicative ℤ) :
    f (MulOpposite.op (Multiplicative.ofAdd n) • x) = ((u ^ (-n) : ℚˣ) : ℚ) * f x := sorry

/-- Inverse of the upper-unipotent matrix [[1,1],[0,1]]. -/
def inverseA : Matrix (Fin 2) (Fin 2) ℚ := fun i j =>
  if i = 0 ∧ j = 1 then -1 else if i = j then 1 else 0
/-- Inverse of the lower-unipotent matrix [[1,0],[1,1]]. -/
def inverseB : Matrix (Fin 2) (Fin 2) ℚ := fun i j =>
  if i = 1 ∧ j = 0 then -1 else if i = j then 1 else 0
-- TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_matrixOrder
example : inverseB * inverseA ≠ inverseA * inverseB := sorry

-- TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_gaugeIdentity
example (J : RightCocycle Γ X C)
    (A V : Type*) [CommRing A] [AddCommGroup V] [Module A V]
    (ρ : Representation A C V) (f : right_automorphy_cocycle.equivariant A V J ρ) :
    right_automorphy_cocycle.gauge J (fun _ => 1) = J ∧
    (right_automorphy_cocycle.gaugeEquiv A V J ρ (fun _ => 1) f).1 = f.1 := sorry

/-- The scalar source action is left fractional-linear translation. -/
def fractionalLinear (M : Matrix (Fin 2) (Fin 2) ℚ) (z : ℚ) : ℚ :=
  (M 0 0 * z + M 0 1) / (M 1 0 * z + M 1 1)
def hilbertFactor (M : Matrix (Fin 2) (Fin 2) ℚ) (z : ℚ) : ℚ :=
  M 1 0 * z + M 1 1
def lowerP3 : Matrix (Fin 2) (Fin 2) ℚ := fun i j =>
  if i = 1 ∧ j = 0 then 3 else if i = j then 1 else 0
def scaleTwo : Matrix (Fin 2) (Fin 2) ℚ := fun i j =>
  if i = j then (if i = 0 then 2 else 1) else 0

-- O2/hilbert-cocycle-law: this catches the unconverted right cz+d identity.
example : hilbertFactor (lowerP3 * scaleTwo) 1 = 7 ∧
    hilbertFactor lowerP3 (fractionalLinear scaleTwo 1) * hilbertFactor scaleTwo 1 = 7 ∧
    hilbertFactor lowerP3 1 * hilbertFactor scaleTwo (fractionalLinear lowerP3 1) = 4 := sorry
end Test
end TauCeti.Overconvergent

/-!
## Supplier-dependent mathematical register (explicit signature omissions)

The weights and algebraic RightCocycle core above are typed and elaborated.
This register records the complete mathematical statements, API and tests of the
packet, including their current supplier contracts. Entries for geometry and
analytic coefficients remain comments: they are not Lean signatures or compiled
examples. The libraries lack the actual carriers identified in the packet gaps.
No unknown condition is replaced by a Prop-valued field, axiom or fake geometry.

Independent review: needs changes. The full finite-character integral AIP
generator/descent and exact formal-completion-to-analytic-O+ comparison are
unverified. Heuer supplies a natural map, rather than a general isomorphism.
The source Hilbert action is left; its cz+d identity is converted explicitly to
the generic right-action convention before using that core.

### OverconvergentAutomorphicForms:O0/units-at-p

The algebraic carrier/core is typed above; analytic refinements remain supplier-dependent.

definition TauCeti.HilbertWeight.Op : For a number field F and a prime p, 𝒪_p := ℤ_p ⊗_ℤ 𝒪_F with its ℤ_p-algebra structure from the left factor and the ℤ_p-module topology. It is a finite free ℤ_p-module of rank [F : ℚ], a compact topological ring, and T(ℤ_p) := 𝒪_p^× (with the units topology) is BHW's T(ℤ_p) for T = Res_{𝒪_F|ℤ} G_m.
Hypotheses: No hypothesis on how p decomposes in F: 𝒪_p is the product of the completed local rings at the primes above p, not assumed unramified or split. Scalars on the left, so that the pinned base-change instances apply.
Carrier dependencies: mathlib:TensorProduct, mathlib:NumberField.RingOfIntegers, mathlib:PadicInt, mathlib:Algebra.TensorProduct.leftAlgebra, mathlib:Module.Finite.base_change, mathlib:Module.Free.tensor, mathlib:moduleTopology, mathlib:IsModuleTopology, mathlib:IsModuleTopology.isTopologicalRing, mathlib:IsModuleTopology.continuous_of_linearMap, mathlib:Module.finrank_baseChange, mathlib:NumberField.RingOfIntegers.rank, mathlib:PadicInt.compactSpace, mathlib:Rat.ringOfIntegersEquiv
lemma TauCeti.HilbertWeight.compactSpace_Op : 𝒪_p is compact.
lemma TauCeti.HilbertWeight.finrank_Op : finrank_{ℤ_p} 𝒪_p = [F : ℚ].
lemma TauCeti.HilbertWeight.unitsToOp : The map 𝒪_F^× → 𝒪_p^×, η ↦ 1 ⊗ η.
example op_rat : 𝒪_p ≅ ℤ_p for F = ℚ.
example op_not_discrete : 𝒪_p is not discrete.
example op_split : For F = ℚ(i) and p = 5, 𝒪_p ≅ ℤ_5 × ℤ_5.
Acceptance: F = ℚ: 𝒪_p ≅ ℤ_p as ℤ_p-algebras, via Rat.ringOfIntegersEquiv. The topology is not discrete; a definition by the discrete topology would make every character continuous and the weight space far too large. F = ℚ(i), p = 5: 𝒪_p ≅ ℤ_5 × ℤ_5, and T(ℤ_5) = (ℤ_5^×)², matching Res_{𝒪_F|ℤ} G_m at a split prime.
Sources: BHW-2023 §6.1, Definition 6.1, printed p. 1756

### OverconvergentAutomorphicForms:O0/norm-at-p

The algebraic carrier/core is typed above; analytic refinements remain supplier-dependent.

construction TauCeti.HilbertWeight.normUnits : N : 𝒪_p^× → ℤ_p^× is the norm Algebra.norm ℤ_p (the determinant of multiplication on the free ℤ_p-module 𝒪_p), restricted to units. It is a continuous homomorphism, and N(1 ⊗ a) = N_{F/ℚ}(a) for a ∈ 𝒪_F.
Hypotheses: 𝒪_p finite free over ℤ_p (units-at-p).
Carrier dependencies: OverconvergentAutomorphicForms:O0/units-at-p, mathlib:Algebra.norm, mathlib:Units.map, mathlib:Algebra.norm_apply, mathlib:LinearMap.det, mathlib:LinearMap.det_baseChange, mathlib:IsModuleTopology.continuous_of_linearMap
lemma TauCeti.HilbertWeight.continuous_normUnits : N is continuous.
lemma TauCeti.HilbertWeight.norm_tmul_one : N(1 ⊗ a) = N_{F/ℚ}(a).
lemma TauCeti.HilbertWeight.normUnits_unitsToOp : N(1 ⊗ η) = N_{F/ℚ}(η) in ℤ_p for a global unit η.
example norm_rat : For F = ℚ, N is the identity.
example norm_neg_one : N(−1) = (−1)^{[F:ℚ]}.
example norm_not_trivial : For [F:ℚ] odd, N is not the trivial character (N(−1) = −1).
Acceptance: F = ℚ: N is the identity of ℤ_p^×. N(−1) = (−1)^{[F:ℚ]}. N(1 ⊗ η) = 1 for a totally positive unit η of a totally real F (used by weight-comparison-totally-positive-units).
Sources: BHW-2023 §6.1, Definition 6.1, printed p. 1756

### OverconvergentAutomorphicForms:O0/principal-units

The algebraic carrier/core is typed above; analytic refinements remain supplier-dependent.

construction TauCeti.HilbertWeight.principalUnits : For r ≥ 0, H_r := {x ∈ 𝒪_p^× : x − 1 ∈ p^r 𝒪_p} is an open subgroup of finite index of 𝒪_p^×; for r ≥ 1 it is a pro-p group, so it meets the prime-to-p torsion of 𝒪_p^× trivially.
Hypotheses: r ∈ ℕ; H_0 = 𝒪_p^×.
Carrier dependencies: OverconvergentAutomorphicForms:O0/units-at-p, mathlib:Subgroup, mathlib:Ideal.span, mathlib:Subgroup.FiniteIndex, mathlib:IsModuleTopology
lemma TauCeti.HilbertWeight.isOpen_principalUnits : H_r is open.
lemma TauCeti.HilbertWeight.finiteIndex_principalUnits : H_r has finite index.
lemma TauCeti.HilbertWeight.principalUnits_antitone : r ≤ s implies H_s ≤ H_r.
example principalUnits_zero : H_0 = 𝒪_p^×.
example principalUnits_rat : F = ℚ, p odd: H_1 = 1 + pℤ_p has index p − 1.
example principalUnits_root_of_unity : A nontrivial (p−1)-st root of unity in ℤ_p^× is not in H_1.
Acceptance: r = 0 gives all of 𝒪_p^×. F = ℚ, p odd, r = 1: H_1 = 1 + pℤ_p, of index p − 1; a nontrivial (p−1)-st root of unity is not in H_1. This is the subgroup over which the corrected |T_κ| is taken (source issue E2).
Sources: BHW-2023 Definition 4.5(1), printed p. 1736

### OverconvergentAutomorphicForms:O0/geometric-weight-characters

The algebraic carrier/core is typed above; analytic refinements remain supplier-dependent.

definition TauCeti.HilbertWeight.GeomWeight : For a topological commutative ring R, the R-points of the weight space 𝒲* for G* are the continuous characters T(ℤ_p) = 𝒪_p^× → R^×: GeomWeight F p R := ContinuousMonoidHom 𝒪_p^× R^×. BHW's 𝒲* = Spf(ℤ_p⟦T(ℤ_p)⟧)^an_η × L is the rigid space representing this functor on affinoid L-algebras; its construction and representability are requested from PadicMeasuresIwasawaAlgebras L0a.
Hypotheses: R a topological commutative ring, R^× with the units topology. No analyticity or algebraicity is assumed: an arbitrary continuous character is a weight, not an algebraic weight. All representation-by-rigid-space assertions use the imported universal character functor; the Lean abbreviation itself gives points only.
Carrier dependencies: OverconvergentAutomorphicForms:O0/units-at-p, mathlib:ContinuousMonoidHom, mathlib:IsTopologicalRing, PadicMeasuresIwasawaAlgebras:L0a
lemma TauCeti.HilbertWeight.GeomWeight.ext : Two geometric weights are equal iff their values on all units agree.
lemma TauCeti.HilbertWeight.GeomWeight.pullback : Precomposition by a continuous monoid endomorphism of O_p^×.
lemma TauCeti.HilbertWeight.GeomWeight.one_apply : The trivial weight evaluates to 1 on every unit.
example geomWeight_trivial : The trivial character is a weight.
example geomWeight_norm : x ↦ N(x) is a ℚ_p-valued weight.
example geomWeight_rat : For F = ℚ these are the continuous characters of ℤ_p^×.
Acceptance: F = ℚ: GeomWeight ℚ p R is the set of continuous characters ℤ_p^× → R^×, BHW's weight space for GL_2/ℚ (Definition 3.1). Algebraic weights x ↦ N(x)^k (k ∈ ℤ) and x ↦ ∏_σ σ(x)^{k_σ} (after extending scalars to split F) are weights; a finite-order character of 𝒪_p^× is a weight that is not algebraic. Let R be the same abstract p-adic integer algebra with discrete topology. The identity homomorphism on its unit group from the usual p-adic topology is not continuous (the inverse image of {1} is not open), hence is not an R-valued weight.
Sources: BHW-2023 §6.1, Definition 6.1(ii), printed p. 1756; BHW-2023 §6.1, Definition 6.1, printed p. 1756

### OverconvergentAutomorphicForms:O0/arithmetic-weight-characters

The algebraic carrier/core is typed above; analytic refinements remain supplier-dependent.

definition TauCeti.HilbertWeight.ArithWeight : For a topological commutative ring R, the R-points of the weight space 𝒲 for G are the continuous characters of T(ℤ_p) × ℤ_p^×: ArithWeight F p R := ContinuousMonoidHom (𝒪_p^× × ℤ_p^×) R^×. Every such character is uniquely a pair (w, t) with w ∈ GeomWeight and t : ℤ_p^× → R^× continuous, via κ(x, y) = w(x)t(y).
Hypotheses: R a topological commutative ring. All representation-by-rigid-space assertions use the imported universal character functor; the Lean abbreviation itself gives points only.
Carrier dependencies: OverconvergentAutomorphicForms:O0/units-at-p, OverconvergentAutomorphicForms:O0/geometric-weight-characters, mathlib:ContinuousMonoidHom, mathlib:ContinuousMonoidHom.fst, mathlib:ContinuousMonoidHom.snd, PadicMeasuresIwasawaAlgebras:L0a
lemma TauCeti.HilbertWeight.ArithWeight.mk : (w, t) ↦ the character (x, y) ↦ w(x)t(y).
lemma TauCeti.HilbertWeight.ArithWeight.bijective_mk : Every arithmetic weight is uniquely of the form mk w t.
lemma TauCeti.HilbertWeight.ArithWeight.mk_apply : (mk w t)(x, y) = w(x)·t(y).
example arithWeight_trivial : mk 1 1 = 1.
example arithWeight_rat : For F = ℚ these are pairs of characters of ℤ_p^×.
example arithWeight_mk_injective : mk w t = mk w' t' implies w = w' and t = t'.
Acceptance: F = ℚ: pairs of characters of ℤ_p^×. (w, t) = (1, 1) gives the trivial weight. The decomposition is unique: ArithWeight.mk is injective.
Sources: BHW-2023 §6.1, Definition 6.1(i), printed p. 1756; BHW-2023 §6.1, Definition 6.1, printed p. 1756

### OverconvergentAutomorphicForms:O0/weight-dual-group-map

The algebraic carrier/core is typed above; analytic refinements remain supplier-dependent.

construction TauCeti.HilbertWeight.weightDualMap : ι : 𝒪_p^× → 𝒪_p^× × ℤ_p^×, x ↦ (x², N(x)^{-1}), a continuous group homomorphism. It is the map for which pulling back characters gives BHW's displayed formula κ = w²·(t^{-1} ∘ N); BHW print x ↦ (x², N(x)) (source issue E1).
Hypotheses: The inversion on the second coordinate is deliberate: it is what the displayed formula and BHW (9.1) require.
Carrier dependencies: OverconvergentAutomorphicForms:O0/units-at-p, OverconvergentAutomorphicForms:O0/norm-at-p, mathlib:ContinuousMonoidHom
lemma TauCeti.HilbertWeight.weightDualMap : x ↦ (x², N(x)^{-1}) as a continuous monoid hom.
lemma TauCeti.HilbertWeight.weightDualMap_apply : ι(x) = (x², N(x)^{-1}).
lemma TauCeti.HilbertWeight.weightDualMap_unitsToOp : For a totally positive global unit η of a totally real F, ι(η) = (η², 1).
example weightDualMap_rat : For F = ℚ, ι(x) = (x², x^{-1}).
example weightDualMap_one : ι(1) = (1, 1).
example weightDualMap_not_printed : ι ≠ (x ↦ (x², N(x))) whenever N is not 2-torsion on 𝒪_p^×, e.g. F = ℚ, p = 5.
Acceptance: Pulling back (w, t) along ι gives w²·(t^{-1} ∘ N), not w²·(t ∘ N): with t trivial both agree, with w trivial they are inverse to each other. F = ℚ: ι(x) = (x², x^{-1}).
Sources: BHW-2023 §6.1, Definition 6.1, printed p. 1756; BHW-2023 §9, proof of Lemma 9.2, (9.1), printed p. 1781

### OverconvergentAutomorphicForms:O0/weight-comparison

The algebraic carrier/core is typed above; analytic refinements remain supplier-dependent.

construction TauCeti.HilbertWeight.weightMap : ρ_R : ArithWeight F p R → GeomWeight F p R, κ ↦ κ ∘ ι, natural in the coefficient ring R. It is the map on points of BHW's morphism ρ : 𝒲 → 𝒲*, through which every weight for G is regarded as a weight for G*.
Hypotheses: R a topological commutative ring; naturality is for continuous ring maps R → R'.
Carrier dependencies: OverconvergentAutomorphicForms:O0/arithmetic-weight-characters, OverconvergentAutomorphicForms:O0/geometric-weight-characters, OverconvergentAutomorphicForms:O0/weight-dual-group-map, mathlib:ContinuousMonoidHom.comp, PadicMeasuresIwasawaAlgebras:L0a
lemma TauCeti.HilbertWeight.weightMap : κ ↦ κ ∘ ι.
lemma TauCeti.HilbertWeight.weightMap_mk_apply : ρ(w, t) = w²·(t^{-1} ∘ N) (weight-comparison-formula).
lemma TauCeti.HilbertWeight.weightMap_mul : ρ(κκ') = ρ(κ)ρ(κ'): ρ is a group homomorphism.
example weightMap_t_one : ρ(w, 1) = w².
example weightMap_w_one : ρ(1, t) = t^{-1} ∘ N.
example weightMap_rat : For F = ℚ, ρ(w, t)(x) = w(x)²t(x)^{-1}.
Acceptance: F = ℚ: ρ(w, t)(x) = w(x)²t(x)^{-1}. ρ is a group homomorphism for the pointwise group structures. The morphism of rigid spaces 𝒲 → 𝒲* is L0a's pullback in G applied to ι; its points are ρ_R.
Sources: BHW-2023 §6.1, Definition 6.1, printed p. 1756; BHW-2023 §6.1, after Definition 6.2, printed p. 1757

### OverconvergentAutomorphicForms:O0/weight-comparison-formula

The algebraic carrier/core is typed above; analytic refinements remain supplier-dependent.

lemma TauCeti.HilbertWeight.weightMap_mk_apply : For w ∈ GeomWeight F p R, t : ℤ_p^× → R^× continuous and x ∈ 𝒪_p^×: ρ(ArithWeight.mk w t)(x) = w(x)²·t(N(x))^{-1}.
Hypotheses: As in weight-comparison.
Carrier dependencies: OverconvergentAutomorphicForms:O0/weight-comparison, OverconvergentAutomorphicForms:O0/arithmetic-weight-characters, OverconvergentAutomorphicForms:O0/weight-dual-group-map
Acceptance: This is BHW's displayed κ = w²·(t^{-1} ∘ N_{F/ℚ}). With the printed map x ↦ (x², N(x)) one would get w(x)²·t(N(x)) instead (E1).
Sources: BHW-2023 §6.1, Definition 6.1, printed p. 1756

### OverconvergentAutomorphicForms:O0/weight-comparison-norm-factor

The algebraic carrier/core is typed above; analytic refinements remain supplier-dependent.

lemma TauCeti.HilbertWeight.weightMap_mk_mul_inv_sq : For κ = ρ(mk w t) and x ∈ 𝒪_p^×: κ(x)·w(x)^{-2} = t(N(x))^{-1}. In particular κ·w^{-2} factors through N : 𝒪_p^× → ℤ_p^×.
Hypotheses: As in weight-comparison.
Carrier dependencies: OverconvergentAutomorphicForms:O0/weight-comparison-formula
Acceptance: BHW: 'κ(x)·w(x^{-2}) factors through some power of the norm'; here the factor is exactly t^{-1} ∘ N. For (w, t) = (N^a, N^b) (algebraic), κ = N^{2a−b}.
Sources: BHW-2023 §6.1, Definition 6.1, printed p. 1756

### OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units

The algebraic carrier/core is typed above; analytic refinements remain supplier-dependent.

lemma TauCeti.HilbertWeight.weightMap_mk_totallyPositive : Let F be totally real and η ∈ 𝒪_F^× totally positive (σ(η) > 0 for every real embedding σ). For κ = ρ(mk w t): κ(η)^{-1}·w(η)² = t(N(η)) = 1, where η is viewed in 𝒪_p^× by η ↦ 1 ⊗ η.
Hypotheses: F totally real; η totally positive; R any topological commutative ring.
Carrier dependencies: OverconvergentAutomorphicForms:O0/weight-comparison-norm-factor, OverconvergentAutomorphicForms:O0/norm-at-p, mathlib:NumberField.IsTotallyReal, mathlib:NumberField.isUnit_iff_norm, mathlib:Algebra.norm_eq_prod_embeddings
Acceptance: This is BHW (9.1), which makes the conditions (3) and (4) of §9 independent of representatives. Total positivity is needed: for η = −1 and [F:ℚ] odd, t(N(η)) = t(−1), which can be −1.
Sources: BHW-2023 §9, proof of Lemma 9.2, (9.1), printed p. 1781

### OverconvergentAutomorphicForms:O0/weight-radius-parameter

The algebraic carrier/core is typed above; analytic refinements remain supplier-dependent.

construction TauCeti.HilbertWeight.radiusParameter : For a normed commutative ring A and κ∈GeomWeight F p A, set T_pro(κ)=sup_{x∈H_r0}‖κ(x)−1‖, r0=1 for odd p and 3 for p=2. This replaces BHW’s all-unit supremum for the boundedness diagnostic (E2). It is not asserted to equal every universal coordinate used in the AIP annuli, and does not validate the printed analytic-radius formula (E3).
Hypotheses: A a normed commutative ring; κ continuous.
Carrier dependencies: OverconvergentAutomorphicForms:O0/principal-units, OverconvergentAutomorphicForms:O0/geometric-weight-characters
lemma TauCeti.HilbertWeight.radiusParameter_one : |T_1| = 0.
lemma TauCeti.HilbertWeight.radiusParameter_lt_one : Continuous characters into uniform Banach ℚ_p-algebras have |T_κ| < 1 (continuous-character-bounded).
lemma TauCeti.HilbertWeight.radiusParameter_nonneg : 0 ≤ |T_κ|.
example radius_trivial : |T_1| = 0.
example radius_teichmuller : F = ℚ, p odd: |T_ω| = 0 for the Teichmüller character.
example radius_power : For F=Q, p odd and k∈N, T_pro(x↦x^k)=|pk|_p, including k=0.
Acceptance: The trivial character has |T_κ| = 0. F = ℚ, p odd, κ = the Teichmüller character ω: |T_ω| = 0 (ω is trivial on 1 + pℤ_p), whereas BHW's printed supremum over ℤ_p^× gives 1. F = ℚ, p odd, κ(x) = x^k: |T_κ| = |pk|_p.
Sources: BHW-2023 §6.1, after Definition 6.2, printed p. 1757; BHW-2023 Definition 4.5(1), printed p. 1736

### OverconvergentAutomorphicForms:O0/continuous-character-bounded

The algebraic carrier/core is typed above; analytic refinements remain supplier-dependent.

lemma TauCeti.HilbertWeight.radiusParameter_lt_one : Let A be a complete normed ℚ_p-algebra whose norm is ultrametric and power-multiplicative (a uniform Banach algebra, such as an affinoid algebra with its spectral norm). Then every κ ∈ GeomWeight F p A has |T_κ| < 1.
Hypotheses: A complete, ultrametric, ‖1‖ = 1, ‖·‖ power-multiplicative; κ continuous.
Carrier dependencies: OverconvergentAutomorphicForms:O0/weight-radius-parameter, OverconvergentAutomorphicForms:O0/principal-units, OverconvergentAutomorphicForms:O0/units-at-p, mathlib:IsModuleTopology
Acceptance: This is the coefficient-level form of 'an affinoid image is bounded'; unboundedness only occurs for non-affinoid families U, which need L0a's rigid spaces. Power-multiplicativity is needed: for a non-uniform norm the binomial estimate fails. The ultrametric hypothesis is needed for the domination step; archimedean normed algebras are excluded.
Sources: BHW-2023 §6.1, Definition 6.2, printed p. 1756

### OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights

theorem TauCeti.Overconvergent.analytic_continuation_of_bounded_weights : For a bounded smooth family κ:U→W*, there exists a common positive radius r<1 and a unique analytic multiplicative extension of its character to B_r(O_p^×:1)×U, agreeing with κ on O_p^××U. The extension respects multiplication wherever defined. This is an existence theorem; r=|p|^r0 |Tκ| is not asserted (E3).
Hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Boundedness is affinoid-image boundedness. The corrected pro-p supremum is a useful diagnostic, not the universal-coordinate annulus of AIP Proposition 2.8.
Carrier dependencies: OverconvergentAutomorphicForms:O0/geometric-weight-characters, OverconvergentAutomorphicForms:O0/weight-radius-parameter, OverconvergentAutomorphicForms:O0/continuous-character-bounded, PadicMeasuresIwasawaAlgebras:L0a, LocallyAnalyticDistributions:L0
Acceptance: A finite conductor character extends on sufficiently small residue balls. For p=3, κ(4)=ζ_9 cannot extend to the printed ball of radius 3^(−7/6), by E3. The trivial character extends to every admitted neighbourhood; no formula forcing r=0 is imposed.
Sources: BHW-2023 §6.1, Proposition 6.3, p.1757; AIP-ADIC-2016 §2.4.3, Proposition 2.8, p.9

### OverconvergentAutomorphicForms:O0/bounded-weight-families

construction TauCeti.Overconvergent.bounded_weight_families : A bounded geometric (respectively arithmetic) family on U is a morphism to the imported W* (respectively W) factoring through an affinoid subspace, with the pulled-back universal character on O_p^××U (respectively (O_p^××Z_p^×)×U). Smoothness of the family means smoothness of U; it does not mean the weight morphism is smooth.
Hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
Carrier dependencies: PadicMeasuresIwasawaAlgebras:L0a, OverconvergentAutomorphicForms:O0/geometric-weight-characters, OverconvergentAutomorphicForms:O0/arithmetic-weight-characters
lemma TauCeti.Overconvergent.bounded_weight_families.character : Evaluate the pulled-back universal character.
lemma TauCeti.Overconvergent.bounded_weight_families.pullback : Pull back along U′→U, preserving boundedness and the character.
lemma TauCeti.Overconvergent.bounded_weight_families.ext : A family is determined by its weight morphism; choices of affinoid factorisation give the same character.
example TauCeti.Overconvergent.Test.O0_bounded_weight_families_point : U=Spa(L) gives the specified single continuous character.
example TauCeti.Overconvergent.Test.O0_bounded_weight_families_constant : A constant family has κ(x,u)=κ(x) on every fibre.
example TauCeti.Overconvergent.Test.O0_bounded_weight_families_image : An unbounded identity map on the entire nonquasicompact weight space has no single affinoid factorisation.
Acceptance: A bounded geometric (respectively arithmetic) family on U is a morphism to the imported W* (respectively W) factoring through an affinoid subspace, with the pulled-back universal character on O_p^××U (respectively (O_p^××Z_p^×)×U). Smoothness of the family means smoothness of U; it does not mean the weight morphism is smooth.
Sources: BHW-2023 Definition 6.2, p.1756

### OverconvergentAutomorphicForms:O0/finite-analytic-coefficients

definition TauCeti.Overconvergent.finite_analytic_coefficients : For a compact open H of a p-adic Levi M and affinoid A, a finite analytic coefficient representation is a finite projective A-module V with its canonical Banach topology and continuous A-linear H-action whose orbit maps are analytic on specified Lie charts H_n. A stable A+-lattice V+ is additional data. The representation includes scalar characters but is not required to have rank one.
Hypotheses: M is a reductive p-adic group with the analytic charts supplied by LocallyAnalyticDistributions:L0. A is a complete uniform affinoid Q_p-algebra; analytic extension to H_n is specified, not inferred from continuity.
Carrier dependencies: mathlib:Representation, LocallyAnalyticDistributions:L0, AdicSpacesPartII:R0/completed-tensor-banach-module
lemma TauCeti.Overconvergent.finite_analytic_coefficients.action : ρ(h):V≃ₗ[A]V, with analytic orbit maps on H_n.
lemma TauCeti.Overconvergent.finite_analytic_coefficients.changeScalars : Finite projective completed base change to an affinoid B, preserving the pulled-back analytic action.
lemma TauCeti.Overconvergent.finite_analytic_coefficients.tensor : Tensor coefficients on V⊗_A W with diagonal action.
lemma TauCeti.Overconvergent.finite_analytic_coefficients.dual : Contragredient on Hom_A(V,A), action f↦f∘ρ(h⁻¹).
lemma TauCeti.Overconvergent.finite_analytic_coefficients.algebraic : Restrict an algebraic Levi representation to H_n and extend scalars to A.
example TauCeti.Overconvergent.Test.O0_finite_analytic_coefficients_scalar : A rank-one character acts by multiplication by κ(h).
example TauCeti.Overconvergent.Test.O0_finite_analytic_coefficients_rankTwo : On A² a diagonal torus acts by diag(χ1(h),χ2(h)), retaining both distinct characters.
example TauCeti.Overconvergent.Test.O0_finite_analytic_coefficients_dualSign : The dual of a scalar character κ is κ⁻¹, not κ.
example TauCeti.Overconvergent.Test.O0_finite_analytic_coefficients_continuous : A continuous character with conductor greater than the chosen chart level is not analytic on that chart.
Acceptance: For a compact open H of a p-adic Levi M and affinoid A, a finite analytic coefficient representation is a finite projective A-module V with its canonical Banach topology and continuous A-linear H-action whose orbit maps are analytic on specified Lie charts H_n. A stable A+-lattice V+ is additional data. The representation includes scalar characters but is not required to have rank one.
Sources: BP-HIGHER §6.2, pp.147–152

### OverconvergentAutomorphicForms:O0/coefficient-tensor-dual

theorem TauCeti.Overconvergent.coefficient_tensor_dual : Finite analytic coefficients are closed under tensor products and contragredient duals on a common analytic chart; (V⊗W)∨≅V∨⊗W∨ for finite projective coefficients, and these identifications commute with affinoid base change. The dual of a general induced Banach module is its continuous dual; no finite-projective claim is made for it.
Hypotheses: Use finite projective modules for the algebraic dual/tensor isomorphism. For induced coefficients use the normed continuous dual, and retain its strong topology; general affinoid coefficients need not give orthonormalisable duals.
Carrier dependencies: OverconvergentAutomorphicForms:O0/finite-analytic-coefficients, mathlib:Representation.tprod, mathlib:Representation.dual, AdicSpacesPartII:R0/completed-tensor-banach-module
Acceptance: For two scalar coefficients the tensor weight is κλ and the dual weight κ⁻¹. The multiplication map on induced functions is not declared an isomorphism Ind(κ)⊗Ind(λ)≅Ind(κλ).
Sources: BP-HIGHER §6.2.2–6.2.4, p.148; §6.2.20, pp.152–153

### OverconvergentAutomorphicForms:O0/analytic-induced-coefficients

construction TauCeti.Overconvergent.analytic_induced_coefficients : For an n-analytic torus character κ_A and a chosen closed subgroup M_1 with Iwahori decomposition, define Vκ^{n-an} as analytic functions f on the actual adic neighbourhood M_1 M_n with f(mb)=(w0,M κ_A)(b⁻¹)f(m), for b in the upper Borel neighbourhood. Left action is (h·f)(m)=f(h⁻¹m). The locally analytic induction is colim_n Vκ^{n-an} with its LB topology; the continuous strong dual is the distribution coefficient module. At fixed n the strong dual (Vκ^{n-an})∨ need not be projective over A: BP instead defines projective Dκ^{n-an} as the compact-open continuous dual of bounded analytic functions on the open polydisc M_1 M_n°; Dκ^{lan}=lim_n Dκ^{n-an} is the dual of the locally analytic induction.
Hypotheses: Use BP §6.2’s Levi, Borel, longest Weyl element and actual analytic subgroup conventions. M_1 is closed with M_1=N̄_1 T_1 N_1, T_1=T(Z_p), and T^{M,−} normalizes N̄_1. M_1 is not required open or Zariski dense. κ_A is a character of w0,M⁻¹T(Z_p)w0,M, n-analytic after the Weyl conjugation. Functions are analytic on the adic thickening M_1 M_n, not merely set functions on M_1. A is uniform finite-type Tate over the coefficient field.
Carrier dependencies: LocallyAnalyticDistributions:L0, OverconvergentAutomorphicForms:O0/bounded-weight-families, AdicSpacesPartII:R0/completed-tensor-banach-module
lemma TauCeti.Overconvergent.analytic_induced_coefficients.equivariance : f(mb)=(w0,M κ_A)(b⁻¹)f(m).
lemma TauCeti.Overconvergent.analytic_induced_coefficients.leftAction : h·f is f(h⁻¹m), with (h1h2)·f=h1·(h2·f).
lemma TauCeti.Overconvergent.analytic_induced_coefficients.unipotentChart : Restriction to the opposite-unipotent chart gives the analytic Banach function module.
lemma TauCeti.Overconvergent.analytic_induced_coefficients.restrictRadius : Restriction Vκ^{n-an}→Vκ^{(n+1)-an} and its composition law.
lemma TauCeti.Overconvergent.analytic_induced_coefficients.continuousDual : Continuous A-linear dual with the strong topology; the induced action is contragredient.
lemma TauCeti.Overconvergent.analytic_induced_coefficients.distributions : Dκ^{n-an} is the compact-open continuous A-dual of bounded analytic functions on M_1 M_n°; Dκ^{lan}=lim_n Dκ^{n-an}, with the specified right (M_1,T^{M,+}) action and contragredient left (M_1,T^{M,−}) action.
example TauCeti.Overconvergent.Test.O0_analytic_induced_coefficients_torus : For M=T there is no unipotent coordinate and induction is the rank-one coefficient character with the prescribed Weyl/inverse convention.
example TauCeti.Overconvergent.Test.O0_analytic_induced_coefficients_sl2 : For SL2 and dominant k≥0, z^(k+1) is an analytic function on the opposite-unipotent ball and is not in the embedded algebraic polynomial subspace of degree≤k.
example TauCeti.Overconvergent.Test.O0_analytic_induced_coefficients_actionOrder : ((h1h2)·f)(m)=f(h2⁻¹h1⁻¹m).
example TauCeti.Overconvergent.Test.O0_analytic_induced_coefficients_tensor : For SL2 and κ=λ=1, multiplication of induced functions kills 1⊗z−z⊗1, a nonzero tensor detected by evaluation at two distinct points of the unipotent ball; it is not a tensor-product isomorphism.
Acceptance: For a torus M=T there is no unipotent variable and induction is the rank-one coefficient with the Weyl/inverse convention. For SL2 and k≥0 the polynomial subspace of degree≤k is proper: z^(k+1) is analytic but outside it. If M_1 is not Zariski dense, functions on its adic neighbourhood cannot be replaced by functions on its rational points. Fixed-radius projective distributions use the bounded open-polydisc dual, not an unsupported projectivity assertion for the ordinary Banach dual.
Sources: BP-HIGHER §6.2.4, pp.148–149; Remark 6.2.8, pp.149–150; §6.2.20, pp.152–153

### OverconvergentAutomorphicForms:O0/algebraic-induced-comparison

comparison TauCeti.Overconvergent.algebraic_induced_comparison : For dominant algebraic κ, restriction of regular induced functions embeds Vκ into Vκ^{n-an} and is M_1-equivariant. For t∈T^{M,+}, ι(tv)=(w0,M κ)(t)·tι(v). A finite-order character w0,M χ:M_1→F× trivial on M_1∩M_n extends trivially across M_n and restricts to the Weyl-conjugate torus character χ. Multiplication by (w0,M χ)⁻¹ gives Vκ_A^{n-an}⊗_F F(w0,M χ)≅Vκ_Aχ^{n-an} as (M_1,T^{M,+}) modules, where the finite-character factor has trivial positive-monoid action. Algebraic restriction induces a map on continuous duals; no blanket surjectivity over A is asserted.
Hypotheses: BP algebraic induced model uses f(mb)=(w0,M κ)(b⁻¹)f(m). Do not remove the positive-monoid scalar, or conclude that an algebraic weight makes analytic induction finite rank. The finite-order character is defined on M_1, not only its torus, is trivial on M_1∩M_n, and has the explicitly trivial T^{M,+} action from BP §6.2.9.
Carrier dependencies: OverconvergentAutomorphicForms:O0/analytic-induced-coefficients, OverconvergentAutomorphicForms:O0/finite-analytic-coefficients, AutomorphicBundles:B4
Acceptance: In SL2 the finite-dimensional polynomial subspace is proper in the analytic functions. Scalar inverse/positive conventions must be converted explicitly before applying this to O8’s transpose convention.
Sources: BP-HIGHER §6.2.9, Lemma 6.2.10 and §6.2.11, p.150; Proposition 6.3.6, p.154

### OverconvergentAutomorphicForms:O0/unitary-completed-coefficients

construction TauCeti.Overconvergent.unitary_completed_coefficients : Ŝξ,τ(U^℘,O_E)=lim_k colim_{U℘} Sξ,τ(U℘U^℘,O_E/ϖ_E^k), where f(gu)=u⁻¹f(g) in the finite automorphic function spaces. After tensoring E, Π is an admissible unitary Banach GL_n(K)-representation commuting with the tame Hecke algebra. On some compact open H its restriction is C(H,E)^s, s≥1.
Hypotheses: F/F+ is CM, G/F+ is a definite unitary group with G×F+F≅GL_n, n≥2, and every p-adic place of F+ splits in F. Fix ℘|p, K=F+_℘=F_℘̃, E large enough, dominant ξ_v and inertial τ_v at every other v|p with stable O_E-lattices Wξ,τ. U^℘ is sufficiently small; its other p-components are GL_n(O_{F+_v}); levels at inert finite places are hyperspecial. The nonzero local regular representation hypothesis Π|H≅C(H,E)^s has s≥1.
Carrier dependencies: CompletedCohomologyPartII:CC.8, OverconvergentAutomorphicForms:O0/finite-analytic-coefficients
lemma TauCeti.Overconvergent.unitary_completed_coefficients.modPower : Projection to the k-th p-adic quotient, retaining the colimit over level.
lemma TauCeti.Overconvergent.unitary_completed_coefficients.groupAction : Continuous GL_n(K)-action by translations, commuting with tame Hecke.
lemma TauCeti.Overconvergent.unitary_completed_coefficients.localRegular : For the supplied H, Π|H≅C(H,E)^s with s≥1.
example TauCeti.Overconvergent.Test.O0_unitary_completed_coefficients_order : For the local translation model H=Z_p, lim_m colim_i Map(Z/p^i,Z/p^m)=C(Z_p,Z_p). The function x↦x belongs to this completion but is not in colim_i Map(Z/p^i,Z_p), since it is not locally constant; interchanging the limits loses it.
example TauCeti.Overconvergent.Test.O0_unitary_completed_coefficients_coefficients : At a finite level with coefficient W=E² and u acting by diag(a,b), the two coordinates obey f(gu)=(a⁻¹ f1(g),b⁻¹ f2(g)); replacing u⁻¹ by u gives a different coefficient condition when a² or b² is not 1.
example TauCeti.Overconvergent.Test.O0_unitary_completed_coefficients_multiplicity : For Π=0 the Jacquet module is zero and its coherent support/eigenvariety is empty, so the nd_K-dimensional nonzero eigenvariety conclusion requires the local regular multiplicity s≥1.
Acceptance: Ŝξ,τ(U^℘,O_E)=lim_k colim_{U℘} Sξ,τ(U℘U^℘,O_E/ϖ_E^k), where f(gu)=u⁻¹f(g) in the finite automorphic function spaces. After tensoring E, Π is an admissible unitary Banach GL_n(K)-representation commuting with the tame Hecke algebra. On some compact open H its restriction is C(H,E)^s, s≥1.
Sources: DING-2025 §4.2.2, pp.66–67, definitions before Proposition 4.14

### OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety

application TauCeti.Overconvergent.unitary_jacquet_eigenvariety : For the supplied Π, import Emerton’s locally Q_p-analytic vectors and J_B. Its strong dual defines the coherent eigenvariety sheaf M(U^℘) on E(U^℘)→T̂, where T̂ parametrizes continuous characters of T(K), including its n unramified coordinates. (δ,ω) is an E-point iff Hom_{T(K)}(δ,J_B(Π_Qp-an[mω]))≠0. Classical points use Π_lalg in this criterion.
Hypotheses: F/F+ is CM, G/F+ is a definite unitary group with G×F+F≅GL_n, n≥2, and every p-adic place of F+ splits in F. Fix ℘|p, K=F+_℘=F_℘̃, E large enough, dominant ξ_v and inertial τ_v at every other v|p with stable O_E-lattices Wξ,τ. U^℘ is sufficiently small; its other p-components are GL_n(O_{F+_v}); levels at inert finite places are hyperspecial. The nonzero local regular representation hypothesis Π|H≅C(H,E)^s has s≥1.
Carrier dependencies: OverconvergentAutomorphicForms:O0/unitary-completed-coefficients, PadicMeasuresIwasawaAlgebras:L0a
Acceptance: dim T̂=n([K:Q_p]+1), whereas the eigenvariety dimension below is n[K:Q_p]. For n=2,K=Q_p the two dimensions are 4 and 2; do not count unramified coordinates as weight dimensions.
Sources: DING-2025 §4.2.2, p.67, immediately before Proposition 4.14

### OverconvergentAutomorphicForms:O0/unitary-eigenvariety-geometry

theorem TauCeti.Overconvergent.unitary_eigenvariety_geometry : Under DH and the imported Jacquet–Emerton construction, E(U^℘) is equidimensional of dimension n d_K, d_K=[K:Q_p], and its specified coherent sheaf M(U^℘) is Cohen–Macaulay over E(U^℘).
Hypotheses: All three DH hypotheses apply; the local model has s≥1. These are the jointly proved parts (1)–(2) of Ding Proposition 4.14, not a generic property of supports of admissible representations.
Carrier dependencies: OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety, OverconvergentAutomorphicForms:O0/unitary-completed-coefficients
Acceptance: For n=2,K=Q_p the dimension is 2, not 4. Cohen–Macaulayness concerns the actual Jacquet coefficient sheaf, not every coherent sheaf.
Sources: DING-2025 Proposition 4.14(1)–(2), p.67

### OverconvergentAutomorphicForms:O0/unitary-eigenvariety-reduced

theorem TauCeti.Overconvergent.unitary_eigenvariety_reduced : The same E(U^℘) is reduced, under the definite-unitary hypotheses and the classical-density theorem in the supplied Jacquet–Emerton package.
Hypotheses: F/F+ is CM, G/F+ is a definite unitary group with G×F+F≅GL_n, n≥2, and every p-adic place of F+ splits in F. Fix ℘|p, K=F+_℘=F_℘̃, E large enough, dominant ξ_v and inertial τ_v at every other v|p with stable O_E-lattices Wξ,τ. U^℘ is sufficiently small; its other p-components are GL_n(O_{F+_v}); levels at inert finite places are hyperspecial. The nonzero local regular representation hypothesis Π|H≅C(H,E)^s has s≥1.
Carrier dependencies: OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety, OverconvergentAutomorphicForms:O0/unitary-eigenvariety-geometry
Acceptance: The ring E[ε]/(ε²) is Cohen–Macaulay and equidimensional but not reduced; this rules out deriving (3) from (1)–(2) alone.
Sources: DING-2025 Proposition 4.14(3) and proof, p.67

### OverconvergentAutomorphicForms:O1/right-automorphy-cocycle

The algebraic carrier/core is typed above; analytic refinements remain supplier-dependent.

definition TauCeti.Overconvergent.RightCocycle : Let X have a right Γ-action and C be a coefficient group. A right automorphy cocycle is J:Γ×X→C with J(1,x)=1 and J(γδ,x)=J(γ,x)J(δ,xγ). For a left representation ρ:C→Aut_A(V), equivariant functions satisfy f(xγ)=ρ(J(γ,x)⁻¹)f(x). In analytic geometry J is an analytic map on the actual cover and coefficient neighbourhood.
Hypotheses: Γ acts on the right. For a left action and left cocycle K with K(γδ,x)=K(γ,δx)K(δ,x), use x·γ=γ⁻¹x and J(γ,x)=K(γ⁻¹,x)⁻¹. Then left equivariance f(γx)=ρ(K(γ,x))f(x) becomes the stated right inverse-equivariance. Both the inverse group element and inverse coefficient are required in the noncommutative conversion. C and ρ need not commute. Analyticity and stable-lattice preservation are genuine imported conditions, not implicit in a set-theoretic cocycle.
Carrier dependencies: mathlib:Representation, AutomorphicBundles:B0/sections-equivariant, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.right_automorphy_cocycle.apply_one : J(1,x)=1.
lemma TauCeti.Overconvergent.right_automorphy_cocycle.apply_mul : J(γδ,x)=J(γ,x)J(δ,xγ).
lemma TauCeti.Overconvergent.right_automorphy_cocycle.equivariant : The algebraic equivariant functions form an A-submodule of X→V; analytic functions are used only with the supplied analytic carrier.
lemma TauCeti.Overconvergent.right_automorphy_cocycle.gauge : For b:X→C construct J′γ(x)=b(x)⁻¹Jγ(x)b(xγ).
lemma TauCeti.Overconvergent.right_automorphy_cocycle.ext : Two right cocycles agree if their values agree for every γ and x.
lemma TauCeti.Overconvergent.right_automorphy_cocycle.trivial : The constant unit map is the trivial right cocycle.
lemma TauCeti.Overconvergent.right_automorphy_cocycle.mem_equivariant : f belongs to the equivariant submodule iff ∀γ,x, f(xγ)=ρ(Jγ(x)⁻¹)f(x).
lemma TauCeti.Overconvergent.right_automorphy_cocycle.gauge_equivariant : The map f′(x)=ρ(b(x)⁻¹)f(x) sends J-equivariant functions to gauge(J,b)-equivariant functions.
lemma TauCeti.Overconvergent.right_automorphy_cocycle.gaugeEquiv : Pointwise ρ(b(x)⁻¹) defines an A-linear equivalence between the J and gauge(J,b) equivariant submodules, with inverse pointwise ρ(b(x)).
lemma TauCeti.Overconvergent.right_automorphy_cocycle.ofLeft : Given compatible left/right actions x·γ=γ⁻¹x and a left cocycle K, construct the right cocycle Jγ(x)=Kγ⁻¹(x)⁻¹.
lemma TauCeti.Overconvergent.right_automorphy_cocycle.gaugeEquiv_apply : The forward gauge equivalence evaluates at x as ρ(b(x)⁻¹)f(x).
lemma TauCeti.Overconvergent.right_automorphy_cocycle.gaugeEquiv_symm_apply : The inverse gauge equivalence evaluates at x as ρ(b(x))f(x).
example TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_trivial : J=1 gives invariant functions.
example TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_scalarSign : For X=Γ=Z with translation, constant J(n,x)=u^n gives f(x+n)=u^(−n)f(x).
example TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_matrixOrder : For A⁻¹=[[1,−1],[0,1]] and B⁻¹=[[1,0],[−1,1]] over Q, B⁻¹A⁻¹=[[1,−1],[−1,2]] differs from A⁻¹B⁻¹=[[2,−1],[−1,1]].
example TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_gaugeIdentity : Gauge by b(x)=1 gives the original right cocycle and the identity equivalence on equivariant functions.
Acceptance: Trivial J gives invariant functions. For left K the conversion Jγ(x)=Kγ⁻¹(x)⁻¹ obeys the right law in the given order even when C is noncommutative. For inverse unipotent matrices A⁻¹=[[1,−1],[0,1]], B⁻¹=[[1,0],[−1,1]], the successive coefficient action is B⁻¹A⁻¹≠A⁻¹B⁻¹.
Sources: BHW-2023 Definitions 6.4–6.5, pp.1757–1758

### OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf

construction TauCeti.Overconvergent.equivariant_coefficient_sheaf : For an actual right Γ-torsor q:Y→X on the supplied analytic/v-site, an analytic cocycle J and coefficient module V on U, define E_J as the sheaf whose sections over W→X are analytic V-valued functions on Y_W×U satisfying f(yγ)=ρ(Jγ(y)⁻¹)f(y). Rational and integral versions use O and O+ respectively, with a specified stable lattice in the latter.
Hypotheses: The cover is the supplied torsor and its descent datum, not an unspecified map. V is finite analytic or the supplied Banach induced coefficient module; exactness or local freeness is not assumed for arbitrary infinite-rank coefficients.
Carrier dependencies: OverconvergentAutomorphicForms:O1/right-automorphy-cocycle, OverconvergentAutomorphicForms:O0/finite-analytic-coefficients, OverconvergentAutomorphicForms:O0/analytic-induced-coefficients, mathlib:SheafOfModules, AutomorphicBundles:B0/sections-equivariant, PerfectoidSpaces:P9, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.equivariant_coefficient_sheaf.sections : Sections are exactly the displayed equivariant analytic functions.
lemma TauCeti.Overconvergent.equivariant_coefficient_sheaf.pullback : Base change of torsor, cocycle and coefficients induces sheaf pullback.
lemma TauCeti.Overconvergent.equivariant_coefficient_sheaf.coefficientMap : An intertwiner of representations induces a sheaf map.
lemma TauCeti.Overconvergent.equivariant_coefficient_sheaf.tensorMap : Pointwise tensor gives E_J(V)⊗E_J(W)→E_J(V⊗W); it is an isomorphism for effective finite locally free descent.
lemma TauCeti.Overconvergent.equivariant_coefficient_sheaf.integralInclusion : A stable V+ gives E_J+→E_J, not automatically equality after inverting p.
example TauCeti.Overconvergent.Test.O1_equivariant_coefficient_sheaf_identityCover : For the identity torsor and trivial group, E_J is the original analytic coefficient sheaf.
example TauCeti.Overconvergent.Test.O1_equivariant_coefficient_sheaf_line : For a scalar character, equivariance is multiplication by κ(Jγ)⁻¹.
example TauCeti.Overconvergent.Test.O1_equivariant_coefficient_sheaf_vector : A rank-two diagonal coefficient representation produces a rank-two descended bundle when effective, not a line bundle.
Acceptance: For an actual right Γ-torsor q:Y→X on the supplied analytic/v-site, an analytic cocycle J and coefficient module V on U, define E_J as the sheaf whose sections over W→X are analytic V-valued functions on Y_W×U satisfying f(yγ)=ρ(Jγ(y)⁻¹)f(y). Rational and integral versions use O and O+ respectively, with a specified stable lattice in the latter.
Sources: BHW-2023 Definition 6.5 and Proposition 6.6, p.1758

### OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality

theorem TauCeti.Overconvergent.coefficient_descent_functoriality : Effective finite locally free cocycle descent commutes with coefficient intertwiners, tensor, contragredient dual and base pullback; iterated descent agrees with descent through an exact effective group extension. For Banach coefficients assert only the maps and exactness supplied by the relevant Banach descent theorem.
Hypotheses: Use effective descent on the indicated site. Finite quotient invariants in characteristic zero use an invertible group order; integral invariants do not inherit this automatically. A quotient stabilizer must act trivially on a descended coarse fibre; otherwise retain the equivariant/stack object.
Carrier dependencies: OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf, OverconvergentAutomorphicForms:O0/coefficient-tensor-dual, AutomorphicBundles:B0/ineffective-fibre-descent, PerfectoidSpaces:P9
Acceptance: Finite-character averaging over a p-divisible group order is valid over L but need not preserve an O+ lattice.
Sources: BHW-2023 §9, Lemmas 9.3–9.7, pp.1782–1786

### OverconvergentAutomorphicForms:O1/analytic-line-effectivity

theorem TauCeti.Overconvergent.analytic_line_effectivity : For smooth rigid X over a perfectoid field extension of Q_p and a v-line L obtained by cocycle descent, analyticity on a Zariski-dense analytic open implies analyticity on X. For a topologically finite-type formal O_K-scheme 𝔛 and a pro-etale profinite formal torsor 𝔛∞→𝔛, a continuous multiplicative cocycle c:G→O(𝔛∞)× gives a v-line on the generic fibre that is the analytification of a Zariski line on 𝔛. An arbitrary analytic O+-unit cocycle is not substituted for this formal cocycle.
Hypotheses: The first assertion is for line bundles, not arbitrary Banach or rank-r v-bundles. For the formal assertion the cocycle lies in units of the completed formal structural ring O(𝔛∞), reduces modulo p^m through a finite quotient, and the finite-level descended lines form a compatible effective system. The map O(𝔛∞)→O+(X∞) used by Heuer is a natural map, not an asserted general isomorphism.
Carrier dependencies: OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf, PerfectoidSpaces:P9
Acceptance: An arbitrary v-vector bundle is not declared analytic by this line-bundle criterion.
Sources: HEUER-2022 Corollary 1.4, p.3; Proposition 3.8, p.16

### OverconvergentAutomorphicForms:O2/admitted-hilbert-domain

construction TauCeti.Overconvergent.admitted_hilbert_domain : Choose the anticanonical Hilbert domain X_{Γ0*(p^n)}(ε)_a, n≥1 or ∞, and its infinite-level cover with T4’s Hodge–Tate coordinate z. The chosen bounded analytic weight extension and m,ε satisfy DOM; at finite level AL_n maps the level-domain of radius p^n ε to X(ε). At n=0 define on X(ε) by AL_1 from X_{Γ0*(p)}(pε)_a. This domain is the input for coefficients, rather than a definition of the Hilbert tower itself.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
Carrier dependencies: HodgeTateAndCanonicalSubgroups:T4, OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights, OverconvergentAutomorphicForms:O0/bounded-weight-families, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.admitted_hilbert_domain.periodCoordinate : The supplied z lies in the indicated radius neighbourhood of O_p.
lemma TauCeti.Overconvergent.admitted_hilbert_domain.restrict : For ε′≤ε, inclusion of the smaller anticanonical domain.
lemma TauCeti.Overconvergent.admitted_hilbert_domain.atkinLehner : AL_n maps the level-domain of radius p^n ε to the base-domain of radius ε on the corresponding canonical domain.
example TauCeti.Overconvergent.Test.O2_admitted_hilbert_domain_ordinary : ε=0 gives the ordinary anticanonical domain.
example TauCeti.Overconvergent.Test.O2_admitted_hilbert_domain_levelZero : At n=0 the definition is transported by AL_1, with pε on its level-domain and ε on its tame target.
example TauCeti.Overconvergent.Test.O2_admitted_hilbert_domain_radius : For p=3 and m=1 the sufficient bound is ε≤1/9; ε=1/3 fails the selected admission inequality even for the trivial continuous character.
Acceptance: AL_n:X_{Γ0*(p^n)}(p^nε)_a≅X(ε) scales the source radius; at level zero AL_1 uses source pε and target ε. At p=3,m=1 the sufficient bound is ε≤1/9; ε=1/3 is outside this admitted range. ε=0 is the ordinary domain, whereas overconvergent forms use the positive admitted radii.
Sources: BHW-2023 §5.3 and §6.2, Definitions 5.17 and 6.4–6.5, pp.1751,1757–1758

### OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor

construction TauCeti.Overconvergent.hilbert_automorphy_factor : For γ=(a b;c d)∈Γ0(p), set jγ(z)=cz+d in O_p⊗O(X∞×U); T4’s coordinate transformation makes jγ a unit in the chosen analytic neighbourhood. The scalar coefficient factor is κ(jγ(z))⁻¹. For finite/vector analytic Levi coefficients use the supplied Levi-valued torsor cocycle, not a determinant character in place of the representation. The source level action is left; write f(γx)=κ(jγ(x))⁻¹f(x). For a right-action interface use x·γ=γ⁻¹x and the factor jγ⁻¹(x) as in hilbert-cocycle-law.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use the right action and T4’s precise fractional-linear coordinate convention.
Carrier dependencies: OverconvergentAutomorphicForms:O2/admitted-hilbert-domain, OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights, HodgeTateAndCanonicalSubgroups:T4, HodgeTateAndCanonicalSubgroups:T5, OverconvergentAutomorphicForms:O0/finite-analytic-coefficients, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.hilbert_automorphy_factor.apply : jγ=cz+d and the section multiplier is κ(cz+d)⁻¹.
lemma TauCeti.Overconvergent.hilbert_automorphy_factor.unit : jγ takes values in the admitted unit neighbourhood.
lemma TauCeti.Overconvergent.hilbert_automorphy_factor.weightPullback : Pulling back κ pulls back its automorphy factor.
example TauCeti.Overconvergent.Test.O2_hilbert_automorphy_factor_upperUnipotent : For γ=(1 b;0 1), jγ=1.
example TauCeti.Overconvergent.Test.O2_hilbert_automorphy_factor_diagonal : For γ=diag(a,d), the scalar section multiplier is κ(d)⁻¹.
example TauCeti.Overconvergent.Test.O2_hilbert_automorphy_factor_determinant : jγ is not det γ: diag(a,1) has jγ=1 even when det γ=a≠1.
Acceptance: For γ=(a b;c d)∈Γ0(p), set jγ(z)=cz+d in O_p⊗O(X∞×U); T4’s coordinate transformation makes jγ a unit in the chosen analytic neighbourhood. The scalar coefficient factor is κ(jγ(z))⁻¹. For finite/vector analytic Levi coefficients use the supplied Levi-valued torsor cocycle, not a determinant character in place of the representation.
Sources: BHW-2023 Definition 6.4, p.1757

### OverconvergentAutomorphicForms:O2/hilbert-cocycle-law

theorem TauCeti.Overconvergent.hilbert_cocycle_law : For BHW’s left level action γx, the Hilbert factor jγ(x)=cγ z(x)+dγ satisfies j_{γδ}(x)=jγ(δx)jδ(x). Its analytic character extension is multiplicative on these admitted factors, so f(γx)=κ(jγ(x))⁻¹f(x) is consistent. For x·γ=γ⁻¹x, the scalar cocycle Jγ(x)=jγ⁻¹(x) obeys O1’s right law (the scalar group is commutative). For noncommuting left frame factors K use Jγ(x)=Kγ⁻¹(x)⁻¹ and retain the representation convention of O1.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
Carrier dependencies: OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor, OverconvergentAutomorphicForms:O1/right-automorphy-cocycle, HodgeTateAndCanonicalSubgroups:T4
Acceptance: At p=3, γ=[[1,0],[3,1]], δ=diag(2,1), z=1, jγδ=7 and jγ(δz)jδ(z)=7; the erroneous right-action expression jγ(z)jδ(γz) is 4. An upper unipotent has trivial scalar factor. General noncommutative factors use Kγ⁻¹(x)⁻¹; coefficient factors cannot be reordered.
Sources: BHW-2023 Definition 6.4 and the construction following it, pp.1757–1758; BHW-2023 §5.2.1, Definition 5.14, pp.1749–1750; §5.5, Lemma 5.31, p.1755; §8.2, Definition 8.8, p.1768

### OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf

construction TauCeti.Overconvergent.geometric_hilbert_sheaf : Define ω_n^κ on X_{Γ0*(p^n)}(ε)_a×U as the actual Γ0*(p^n)-equivariant coefficient functions on X_{Γ*(p∞)}(ε)_a×U with scalar factor κ(cz+d)⁻¹. For n=∞ use the corresponding kernel subgroup of the projection. For n=0 transport through AL_1. This is an analytic invertible sheaf, not an alias for AIP’s independent sheaf.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
Carrier dependencies: OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf, OverconvergentAutomorphicForms:O1/analytic-line-effectivity, OverconvergentAutomorphicForms:O2/hilbert-cocycle-law, OverconvergentAutomorphicForms:O2/admitted-hilbert-domain, PerfectoidSpaces:P9, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.geometric_hilbert_sheaf.sections : Sections are the displayed κ⁻¹-equivariant analytic functions.
lemma TauCeti.Overconvergent.geometric_hilbert_sheaf.localRank : Locally free rank one over O_{X×U}.
lemma TauCeti.Overconvergent.geometric_hilbert_sheaf.restriction : The canonical map along ε′≤ε and along the specified level maps.
example TauCeti.Overconvergent.Test.O2_geometric_hilbert_sheaf_trivialWeight : κ=1 gives O_{X×U}.
example TauCeti.Overconvergent.Test.O2_geometric_hilbert_sheaf_parallelOne : The parallel algebraic weight x↦N(x) gives det ω; it is not the trivial character 1.
example TauCeti.Overconvergent.Test.O2_geometric_hilbert_sheaf_finiteLevel : Finite-level sections pull back to the stated equivariant functions on the infinite cover.
Acceptance: Define ω_n^κ on X_{Γ0*(p^n)}(ε)_a×U as the actual Γ0*(p^n)-equivariant coefficient functions on X_{Γ*(p∞)}(ε)_a×U with scalar factor κ(cz+d)⁻¹. For n=∞ use the corresponding kernel subgroup of the projection. For n=0 transport through AL_1. This is an analytic invertible sheaf, not an alias for AIP’s independent sheaf.
Sources: BHW-2023 Definition 6.5 and Proposition 6.6, p.1758

### OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps

theorem TauCeti.Overconvergent.hilbert_level_radius_maps : The ω_n^κ pull back canonically under compatible finite/infinite level maps, rational weight pullbacks and restrictions ε′≤ε. Identifications obey identity/composition. AL_n:X_{Γ0*(p^n)}(p^nε)_a≅X(ε) transports the coefficient line on the p^nε level-domain to the ε tame-domain; in particular n=0 is defined using AL_1 from level-radius pε. Integral weight pullbacks satisfy the additional conditions of O3/hilbert-weight-pullback.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Maps of weight families pull back the specified character and its analytic extension. Claims about sheaves do not assert arbitrary nonflat base change of global sections.
Carrier dependencies: OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf, OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality, HodgeTateAndCanonicalSubgroups:T4
Acceptance: A composition of level/radius maps gives the same identification as the composite map.
Sources: BHW-2023 Definition 6.5 and Remark 6.7, p.1758; Definition 7.13, p.1764

### OverconvergentAutomorphicForms:O2/hilbert-algebraic-specialisation

comparison TauCeti.Overconvergent.hilbert_algebraic_specialisation : For κ(x)=∏_{σ:F→L}σ(x)^{kσ}, the geometric ω_n^κ identifies with ⊗_σ ω_σ^{kσ} on the anticanonical domain, pulled back via the specified AL_n convention. For κ=N^k this is (det ω)^k. Locally algebraic finite characters retain their finite-level character twist.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. The embeddings and classical differential eigenlines are defined over L; integer exponents may be negative since the factors are lines.
Carrier dependencies: OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf, AutomorphicBundles:B4, HodgeTateAndCanonicalSubgroups:T5
Acceptance: F=Q, κ(x)=x^k recovers ω^k with the stated AL convention. κ=1 recovers O, whereas κ=N recovers det ω.
Sources: BHW-2023 Remark 6.7, p.1758

### OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf

construction TauCeti.Overconvergent.integral_hilbert_sheaf : Define ω_n^{κ,+} as the O+ equivariance equalizer on the actual infinite-level cover, for the same left level action and multiplier κ(jγ(x))⁻¹ as ω_n^κ. The admitted factors have integral unit values. This defines the specified subsheaf of rational coefficients; invertibility on the AIP-admitted intersection is the separate comparison target geometric-aip-comparison, with its unresolved integral input recorded as a gap.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. The coefficient chart is equipped with A+ and the character extension is bounded in integral units. Integral local invertibility uses the independent AIP comparison, not a characteristic-zero averaging argument.
Carrier dependencies: OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf, PerfectoidSpaces:P9, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.integral_hilbert_sheaf.sections : Integral sections are the equivariant functions in q_*O+.
lemma TauCeti.Overconvergent.integral_hilbert_sheaf.inclusion : ω_n^{κ,+} embeds into ω_n^κ.
lemma TauCeti.Overconvergent.integral_hilbert_sheaf.restrict : Compatible restriction and level maps preserve the lattice.
example TauCeti.Overconvergent.Test.O3_integral_hilbert_sheaf_trivial : At trivial weight the lattice is O+.
example TauCeti.Overconvergent.Test.O3_integral_hilbert_sheaf_inverse : The inverse of an O+ unit factor preserves O+.
example TauCeti.Overconvergent.Test.O3_integral_hilbert_sheaf_rationalLine : On Spa(Q_p), Z_p and pZ_p are distinct integral submodules of Q_p but both rationalize to Q_p; rational invertibility therefore does not identify the chosen lattice.
Acceptance: The trivial coefficient character gives O+ by the actual invariant-function descent. Inverting an O+ unit preserves integral functions. The rational line does not determine the integral equalizer: on Spa(Q_p), Z_p and pZ_p are distinct integral lattices in Q_p with identical rationalisation.
Sources: BHW-2023 Definition 6.5, p.1758

### OverconvergentAutomorphicForms:O3/integral-rationalisation

comparison TauCeti.Overconvergent.integral_rationalisation : On the admitted bounded-weight domains, ω_n^{κ,+}[1/p]≅ω_n^κ, and the analogous arithmetic statement holds after its descent is constructed. This is a sheaf identity; it does not assert H^0(ω+)[1/p]≅H^0(ω) on every nonquasicompact base.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use local quasicompact coefficient trivializations and bounded character factors; for a global H^0 claim additionally require a finite quasicompact cover with bounded denominators. Restrict the positive-radius assertion to the independently verified AIP-admitted intersection.
Carrier dependencies: OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf, OverconvergentAutomorphicForms:O5/geometric-aip-comparison, PerfectoidSpaces:P9
Acceptance: On an affinoid trivializing patch rational sections are precisely integral sections with a bounded p-denominator.
Sources: BHW-2023 Definition 9.8, p.1786

### OverconvergentAutomorphicForms:O3/hilbert-weight-pullback

theorem TauCeti.Overconvergent.hilbert_weight_pullback : For a morphism of bounded smooth weight families U′→U pulling back κ and the chosen common analytic extension, the pulled-back geometric coefficient line is ω_n^{κ′}; with compatible integral structures the same holds integrally. These identifications commute with level and radius maps.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Maps of weight families pull back the specified character and its analytic extension. Claims about sheaves do not assert arbitrary nonflat base change of global sections. Integral pullback is claimed only for flat formal coefficient changes satisfying P9’s completed-descent hypotheses, or for the explicitly proved AIP chart refinement maps. Arbitrary integral weight specialisation is excluded (AIP CUSP Remark 3.15).
Carrier dependencies: OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf, OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality, OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps, PerfectoidSpaces:P9
Acceptance: Specialising a family to a point recovers its character sheaf. This theorem does not imply arbitrary base change for all fixed-radius global sections.
Sources: BHW-2023 §6.1–6.2, Definitions 6.2 and 6.5, pp.1756–1758; AIP-CUSP-2016 Remark 3.15, p.17

### OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms

construction TauCeti.Overconvergent.fixed_radius_hilbert_forms : Mκ^{G*,c}(n,N,ε;U)=H^0(X_{c,U,Γ0*(p^n),μN}(ε)_a,ω_n^κ); define Mκ^{G*,c,+} using ω_n^{κ,+}. Restriction maps go from a larger admitted neighbourhood to a smaller one. Banach and projectivity claims require the finite-level affinoid weight and cusp hypotheses in O6.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Fix a positive prime-to-p polarisation ideal c. Both ε=0 and ε>0 have meanings, but they are different domains.
Carrier dependencies: OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf, OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf, OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps, HilbertModularVarietiesAndShimuraCurves:H3, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.fixed_radius_hilbert_forms.restrict : Restriction along ε′≤ε, with identity and composition.
lemma TauCeti.Overconvergent.fixed_radius_hilbert_forms.integralInclusion : Integral sections map to rational sections.
lemma TauCeti.Overconvergent.fixed_radius_hilbert_forms.evaluateWeight : Pullback of a section to a weight fibre; no surjectivity without O6 hypotheses.
example TauCeti.Overconvergent.Test.O3_fixed_radius_hilbert_forms_zero : The zero section belongs to every fixed-radius module.
example TauCeti.Overconvergent.Test.O3_fixed_radius_hilbert_forms_trivial : For κ=1 the space is H^0 of O on the actual domain.
example TauCeti.Overconvergent.Test.O3_fixed_radius_hilbert_forms_ordinary : ε=0 defines ordinary-locus sections and is not a synonym for positive-radius overconvergence.
Acceptance: Mκ^{G*,c}(n,N,ε;U)=H^0(X_{c,U,Γ0*(p^n),μN}(ε)_a,ω_n^κ); define Mκ^{G*,c,+} using ω_n^{κ,+}. Restriction maps go from a larger admitted neighbourhood to a smaller one. Banach and projectivity claims require the finite-level affinoid weight and cusp hypotheses in O6.
Sources: BHW-2023 Definition 6.8, p.1758

### OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms

construction TauCeti.Overconvergent.overconvergent_hilbert_forms : Mκ^{G*,c,†}=colim_{ε>0 admitted}Mκ^{G*,c}(n,N,ε;U) along restrictions toward the ordinary locus. Its integral counterpart is the same filtered colimit of the specified lattices. The locally convex direct-limit topology is used when asserting continuity; no equality with all ordinary-locus sections is built into the definition.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. At a bounded family choose the positive cofinal system admitted for that family; compare choices via a common cofinal subsystem.
Carrier dependencies: OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms, LocallyAnalyticDistributions:L4/projective-banach-modules, LocallyAnalyticDistributions:L0, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.overconvergent_hilbert_forms.ofRadius : Canonical map from any positive admitted radius.
lemma TauCeti.Overconvergent.overconvergent_hilbert_forms.lift : Compatible linear maps from every radius induce a unique map from the colimit.
lemma TauCeti.Overconvergent.overconvergent_hilbert_forms.cofinal : A cofinal family of positive admitted radii gives the same overconvergent module.
example TauCeti.Overconvergent.Test.O3_overconvergent_hilbert_forms_representative : Every element has a representative at some positive admitted radius.
example TauCeti.Overconvergent.Test.O3_overconvergent_hilbert_forms_equality : Two representatives agree iff their restrictions agree at some smaller positive admitted radius.
example TauCeti.Overconvergent.Test.O3_overconvergent_hilbert_forms_ordinary : A section defined only at ε=0 has no tautological representative in this colimit.
Acceptance: Mκ^{G*,c,†}=colim_{ε>0 admitted}Mκ^{G*,c}(n,N,ε;U) along restrictions toward the ordinary locus. Its integral counterpart is the same filtered colimit of the specified lattices. The locally convex direct-limit topology is used when asserting continuity; no equality with all ordinary-locus sections is built into the definition.
Sources: BHW-2023 Definitions 6.5–6.8 and Remark 6.9, pp.1758–1759

### OverconvergentAutomorphicForms:O3/ramified-modified-lattice

application TauCeti.Overconvergent.ramified_modified_lattice : At ramified p, the integral differential module used for AIP coefficients is ω^int, the O_F⊗O+-span of the appropriate Hodge–Tate/canonical-subgroup image. It is locally free of rank one over O_F⊗O+ in the admitted range, although the naive ω+ need not be so away from the Rapoport locus. The perfectoid integral line is compared to coefficients of ω^int, not to a nonexistent splitting of naive ω+.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use T5’s exact canonical-subgroup range and modified differential theorem; the Rapoport condition is not imposed globally.
Carrier dependencies: OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf, HodgeTateAndCanonicalSubgroups:T5
Acceptance: For a split/unramified Rapoport point the expected differential eigenline model agrees with the modification. As a local algebra test, over k[e]/e² the regular module has e acting as a nonzero Jordan block, whereas k² with e acting by zero is not free of rank one; equal k-dimensions do not establish O_F-line freeness.
Sources: BHW-2023 §7.1, pp.1759–1761

### OverconvergentAutomorphicForms:O4/presentation-geometric-small

construction TauCeti.Overconvergent.presentation_geometric_small : Define presentation (1) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ*(p∞)}(ε)_a×U, with acting group Γ0*(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
Carrier dependencies: OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf, OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor, HilbertModularVarietiesAndShimuraCurves:H4, PerfectoidShimuraVarieties:S5, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.presentation_geometric_small.sections : Sections satisfy exactly the Γ0*(p^n)-equivariance condition with multiplier κ(cz+d)⁻¹.
lemma TauCeti.Overconvergent.presentation_geometric_small.integralInclusion : The O+ equalizer embeds in its O version.
lemma TauCeti.Overconvergent.presentation_geometric_small.pullback : Compatible level, radius and weight pullback retains this cover and coefficient action.
example TauCeti.Overconvergent.Test.O4_presentation_geometric_small_trivial : When w=t=1, the presentation is the structural sheaf on its own quotient base.
example TauCeti.Overconvergent.Test.O4_presentation_geometric_small_factor : The section multiplier on a group element is κ(cz+d)⁻¹, including its sign and determinant/polarisation component.
example TauCeti.Overconvergent.Test.O4_presentation_geometric_small_cover : For ε∈Z_p^×, diag(ε,1) has j=1 and fixes every weight-equivariant coefficient function on the small cover; this is the invariance used in the full-cover comparison.
Acceptance: Define presentation (1) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ*(p∞)}(ε)_a×U, with acting group Γ0*(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.
Sources: BHW-2023 Definition 9.1(1), pp.1780–1781

### OverconvergentAutomorphicForms:O4/presentation-geometric-full

construction TauCeti.Overconvergent.presentation_geometric_full : Define presentation (2) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group Γ0(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
Carrier dependencies: OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf, OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor, HilbertModularVarietiesAndShimuraCurves:H4, PerfectoidShimuraVarieties:S5, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.presentation_geometric_full.sections : Sections satisfy exactly the Γ0(p^n)-equivariance condition with multiplier κ(cz+d)⁻¹.
lemma TauCeti.Overconvergent.presentation_geometric_full.integralInclusion : The O+ equalizer embeds in its O version.
lemma TauCeti.Overconvergent.presentation_geometric_full.pullback : Compatible level, radius and weight pullback retains this cover and coefficient action.
example TauCeti.Overconvergent.Test.O4_presentation_geometric_full_trivial : When w=t=1, the presentation is the structural sheaf on its own quotient base.
example TauCeti.Overconvergent.Test.O4_presentation_geometric_full_factor : The section multiplier on a group element is κ(cz+d)⁻¹, including its sign and determinant/polarisation component.
example TauCeti.Overconvergent.Test.O4_presentation_geometric_full_cover : For u∈O_p^×, diag(u,1) has j=1 and fixes a section of presentation (2), while its determinant may be nontrivial.
Acceptance: Define presentation (2) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group Γ0(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.
Sources: BHW-2023 Definition 9.1(2), pp.1780–1781

### OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate

construction TauCeti.Overconvergent.presentation_arithmetic_intermediate : Define presentation (3) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group E(p^n) and section transformation multiplier κ(cz+d)⁻¹w(x) for a representative (γ,x); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
Carrier dependencies: OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf, OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor, HilbertModularVarietiesAndShimuraCurves:H4, PerfectoidShimuraVarieties:S5, OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units, OverconvergentAutomorphicForms:O4/arithmetic-representatives, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.presentation_arithmetic_intermediate.sections : Sections satisfy exactly the E(p^n)-equivariance condition with multiplier κ(cz+d)⁻¹w(x) for a representative (γ,x).
lemma TauCeti.Overconvergent.presentation_arithmetic_intermediate.integralInclusion : The O+ equalizer embeds in its O version.
lemma TauCeti.Overconvergent.presentation_arithmetic_intermediate.pullback : Compatible level, radius and weight pullback retains this cover and coefficient action.
example TauCeti.Overconvergent.Test.O4_presentation_arithmetic_intermediate_trivial : When w=t=1, the presentation is the structural sheaf on its own quotient base.
example TauCeti.Overconvergent.Test.O4_presentation_arithmetic_intermediate_factor : The section multiplier on a group element is κ(cz+d)⁻¹w(x) for a representative (γ,x), including its sign and determinant/polarisation component.
example TauCeti.Overconvergent.Test.O4_presentation_arithmetic_intermediate_cover : For η∈O_F^{×,+}, the representative change (γ,x)↦(γηI,xη²) leaves κ(cz+d)⁻¹w(x) unchanged.
Acceptance: Define presentation (3) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group E(p^n) and section transformation multiplier κ(cz+d)⁻¹w(x) for a representative (γ,x); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.
Sources: BHW-2023 Definition 9.1(3), pp.1780–1781

### OverconvergentAutomorphicForms:O4/presentation-arithmetic-full

construction TauCeti.Overconvergent.presentation_arithmetic_full : Define presentation (4) independently as the O+ equivariance equalizer on the actual cover X_{G,U,Γ(p∞)}(ε)_a×U, with acting group PΓ0(p^n) and section transformation multiplier κ(cz+d)⁻¹w(det γ); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
Carrier dependencies: OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf, OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor, HilbertModularVarietiesAndShimuraCurves:H4, PerfectoidShimuraVarieties:S5, OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units, OverconvergentAutomorphicForms:O4/arithmetic-representatives, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.presentation_arithmetic_full.sections : Sections satisfy exactly the PΓ0(p^n)-equivariance condition with multiplier κ(cz+d)⁻¹w(det γ).
lemma TauCeti.Overconvergent.presentation_arithmetic_full.integralInclusion : The O+ equalizer embeds in its O version.
lemma TauCeti.Overconvergent.presentation_arithmetic_full.pullback : Compatible level, radius and weight pullback retains this cover and coefficient action.
example TauCeti.Overconvergent.Test.O4_presentation_arithmetic_full_trivial : When w=t=1, the presentation is the structural sheaf on its own quotient base.
example TauCeti.Overconvergent.Test.O4_presentation_arithmetic_full_factor : The section multiplier on a group element is κ(cz+d)⁻¹w(det γ), including its sign and determinant/polarisation component.
example TauCeti.Overconvergent.Test.O4_presentation_arithmetic_full_cover : For η∈(1+NO_F)^{×,+}, the central scalar ηI has multiplier κ(η)⁻¹w(η²)=1.
Acceptance: Define presentation (4) independently as the O+ equivariance equalizer on the actual cover X_{G,U,Γ(p∞)}(ε)_a×U, with acting group PΓ0(p^n) and section transformation multiplier κ(cz+d)⁻¹w(det γ); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.
Sources: BHW-2023 Definition 9.1(4), pp.1780–1781

### OverconvergentAutomorphicForms:O4/arithmetic-representatives

theorem TauCeti.Overconvergent.arithmetic_representatives : The multiplier of presentation (3) is unchanged by (γ,x)↦(γηI,xη²), η∈O_F^{×,+}. The multiplier of (4) kills the central closure Z∞ of (1+NO_F)^{×,+}, so descends to PΓ0(p^n). Both assertions use κ(η)⁻¹w(η²)=1.
Hypotheses: Use H4’s actual quotient relations and topological closure, not a quotient by all p-adic units. Arithmetic κ=ρ(w,t), and totally positive global units have norm 1.
Carrier dependencies: OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units, OverconvergentAutomorphicForms:O2/hilbert-cocycle-law, HilbertModularVarietiesAndShimuraCurves:H4
Acceptance: Ignoring w(η²) generally breaks presentation (3).
Sources: BHW-2023 Lemma 9.2 and equation (9.1), pp.1781–1782

### OverconvergentAutomorphicForms:O4/geometric-full-cover-comparison

comparison TauCeti.Overconvergent.geometric_full_cover_comparison : Pullback from the full Γ tower to the Γ* tower identifies presentations (2) and (1), integrally and rationally. The inverse is constructed through X_{Γ*(p∞)}←X_{Γ*(p∞)}×O_p^×→X_{Γ(p∞)}, whose right map is a Z_p^×-torsor. It is a genuine isomorphism independent of the choice of full geometric cover.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
Carrier dependencies: OverconvergentAutomorphicForms:O4/presentation-geometric-small, OverconvergentAutomorphicForms:O4/presentation-geometric-full, PerfectoidShimuraVarieties:S5, PerfectoidSpaces:P9, HodgeTateAndCanonicalSubgroups:T4, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Acceptance: For diag(u,1), the coefficient factor is κ(1)⁻¹=1.
Sources: BHW-2023 Lemma 9.3, pp.1782–1783

### OverconvergentAutomorphicForms:O4/twisted-polarisation-action

construction TauCeti.Overconvergent.twisted_polarisation_action : On π_* of presentation (2), define the left action of positive global units by ε·_w f=w(ε)(ε⁻¹)^*f. This preserves the geometric coefficient sheaf and factors through the finite group Δ(N) supplied by H4. This finite group differs from the profinite Δ(p∞N) acting on full towers.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
Carrier dependencies: OverconvergentAutomorphicForms:O4/presentation-geometric-full, OverconvergentAutomorphicForms:O4/arithmetic-representatives, HilbertModularVarietiesAndShimuraCurves:H4, HodgeTateAndCanonicalSubgroups:T4, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.twisted_polarisation_action.apply : ε·_w f=w(ε)(ε⁻¹)^*f.
lemma TauCeti.Overconvergent.twisted_polarisation_action.mul : (εδ)·_w f=ε·_w(δ·_w f).
lemma TauCeti.Overconvergent.twisted_polarisation_action.finiteAction : The action factors through the specified finite Δ(N).
example TauCeti.Overconvergent.Test.O4_twisted_polarisation_action_trivialW : w=1 gives inverse polarisation pullback.
example TauCeti.Overconvergent.Test.O4_twisted_polarisation_action_constant : On a scalar constant section the action is multiplication by w(ε).
example TauCeti.Overconvergent.Test.O4_twisted_polarisation_action_inverse : Using ε^* instead of (ε⁻¹)^* gives the opposite base action and generally changes the descent.
Acceptance: On π_* of presentation (2), define the left action of positive global units by ε·_w f=w(ε)(ε⁻¹)^*f. This preserves the geometric coefficient sheaf and factors through the finite group Δ(N) supplied by H4. This finite group differs from the profinite Δ(p∞N) acting on full towers.
Sources: BHW-2023 Definition 9.4 and Lemma 9.5, p.1783

### OverconvergentAutomorphicForms:O4/finite-polarisation-descent

comparison TauCeti.Overconvergent.finite_polarisation_descent : Presentation (3) is canonically (π_* presentation (2))^{Δ(N)}, with the O4 twisted polarisation action, for both integral and rational coefficients. The quotient is the finite effective geometric-to-arithmetic polarisation quotient; it is not the full profinite tower quotient.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
Carrier dependencies: OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate, OverconvergentAutomorphicForms:O4/presentation-geometric-full, OverconvergentAutomorphicForms:O4/twisted-polarisation-action, HilbertModularVarietiesAndShimuraCurves:H4
Acceptance: Integral descent is not justified by dividing by a potentially p-divisible |Δ(N)|.
Sources: BHW-2023 Lemma 9.6, p.1784

### OverconvergentAutomorphicForms:O4/weil-pairing-comparison

comparison TauCeti.Overconvergent.weil_pairing_comparison : The map from presentation (4) to presentation (3) is f↦w(eβ)⁻¹π∞^*f. Its inverse multiplies by w(eβ) and descends through the actual profinite Δ(p∞N)-torsor. Both maps preserve O+ and are inverse. The transformation is (γ,x)^*w(eβ)=w(x⁻¹)w(det γ)w(eβ).
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1. The full-level pairing eβ is an O_p^×-valued map supplied by S5, with the stated transformation law.
Carrier dependencies: OverconvergentAutomorphicForms:O4/presentation-arithmetic-full, OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate, OverconvergentAutomorphicForms:O4/arithmetic-representatives, PerfectoidShimuraVarieties:S5, PerfectoidSpaces:P9, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Acceptance: The plain pullback π∞^* does not convert the determinant multiplier to the polarisation multiplier when w is nontrivial.
Sources: BHW-2023 Equation (9.5) and Lemma 9.7, pp.1784–1786

### OverconvergentAutomorphicForms:O4/polarisation-class-forms

construction TauCeti.Overconvergent.polarisation_class_forms : For arithmetic forms take the direct sum of fixed-c spaces over prime-to-p fractional ideals and quotient by P_x(f)−f for totally positive p-adic units x, where P_x transports c to xc. The indexing quotient is the finite narrow class group. Integral forms use the corresponding integral lattices. For G* retain a chosen set of class representatives and the specified comparison maps.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1. Use H3/H4’s transport maps and their composition law; for arithmetic forms a transport by a positive unit stabilizing an ideal is already the identity after descent.
Carrier dependencies: OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms, OverconvergentAutomorphicForms:O4/weil-pairing-comparison, OverconvergentAutomorphicForms:O4/finite-polarisation-descent, HilbertModularVarietiesAndShimuraCurves:H3, HilbertModularVarietiesAndShimuraCurves:H4, tauceti:NumberField.NarrowClassGroup, tauceti:NumberField.NarrowClassGroup.instFinite, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.polarisation_class_forms.ofIdeal : Map each fixed-c arithmetic form into the class-independent quotient.
lemma TauCeti.Overconvergent.polarisation_class_forms.transportRelation : ofIdeal(P_x f)=ofIdeal(f).
lemma TauCeti.Overconvergent.polarisation_class_forms.representatives : A finite set of narrow-class representatives yields the direct-sum presentation, using the arithmetic stabilizer identity.
example TauCeti.Overconvergent.Test.O4_polarisation_class_forms_rational : For F=Q there is one narrow ideal class and arithmetic forms reduce to the single class component.
example TauCeti.Overconvergent.Test.O4_polarisation_class_forms_transport : The class of f at c equals the class of P_x f at xc.
example TauCeti.Overconvergent.Test.O4_polarisation_class_forms_geometricChoices : For G* a change of representatives retains noncanonical polarisation maps; arithmetic independence is not silently asserted before descent.
Acceptance: For arithmetic forms take the direct sum of fixed-c spaces over prime-to-p fractional ideals and quotient by P_x(f)−f for totally positive p-adic units x, where P_x transports c to xc. The indexing quotient is the finite narrow class group. Integral forms use the corresponding integral lattices. For G* retain a chosen set of class representatives and the specified comparison maps.
Sources: BHW-2023 Definition 9.10, pp.1786–1787

### OverconvergentAutomorphicForms:O4/polarisation-choice-independence

theorem TauCeti.Overconvergent.polarisation_choice_independence : Arithmetic polarisation-class forms and their transported correspondences are canonically independent of narrow-class representative choices: P_x compose multiplicatively and any two transports with the same target differ by a positive-unit stabilizer acting trivially after arithmetic descent. For G* changes of representatives conjugate operators by the chosen polarisation comparisons; no canonical equality before these choices is claimed.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
Carrier dependencies: OverconvergentAutomorphicForms:O4/polarisation-class-forms, OverconvergentAutomorphicForms:O4/finite-polarisation-descent, HilbertModularVarietiesAndShimuraCurves:H4
Acceptance: Changing a polarisation representative twice agrees with changing it by the product transport.
Sources: BHW-2023 Remark 10.6, p.1791; Definition 9.10, pp.1786–1787

### OverconvergentAutomorphicForms:O5/aip-independent-coefficients

construction TauCeti.Overconvergent.aip_independent_coefficients : On each AIP chart construct the modified differential frame torsor F_{n,r,I} and its B_n=O_p×·(1+p^n Hdg^(−p^n/(p−1))Res_{O_F/Z}G_a) action independently of the perfectoid tower. Define the analytic rational and integral coefficient sheaves as the κ⁻¹-eigenfunctions in (g_n f_n)_*O and (g_n f_n)_*O+ on this actual analytic torsor. In the formal AIP construction, first construct w_{n,r,I} for the universal character on W_F^0, then retain §6.4’s finite-character factor wχ for a full weight. The full formal sheaf is coherent; Prop.4.3 is not cited to assert its integral formal invertibility for every χ.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum. Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
Carrier dependencies: HodgeTateAndCanonicalSubgroups:T5, OverconvergentAutomorphicForms:O3/ramified-modified-lattice, OverconvergentAutomorphicForms:O0/bounded-weight-families, LocallyAnalyticDistributions:L0, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.aip_independent_coefficients.eigencondition : f(b·s)=κ(b)⁻¹f(s) on the specified B_n-torsor.
lemma TauCeti.Overconvergent.aip_independent_coefficients.integralInclusion : Integral eigenfunctions embed in the rational coefficient sheaf.
lemma TauCeti.Overconvergent.aip_independent_coefficients.restrictChart : Change of admissible interval, canonical level and radius gives the AIP transition maps.
example TauCeti.Overconvergent.Test.O5_aip_independent_coefficients_trivial : The trivial character gives the structural sheaf after descent.
example TauCeti.Overconvergent.Test.O5_aip_independent_coefficients_algebraic : An algebraic κ gives the corresponding modified differential coefficient on the admitted chart.
example TauCeti.Overconvergent.Test.O5_aip_independent_coefficients_independent : For F=Q and κ(x)=x, scaling a differential frame s by λ∈Z_p^× gives f(λs)=λ⁻¹f(s); these eigenfunctions are not invariant functions for nontrivial λ.
Acceptance: On each AIP chart define the modified differential frame torsor F_{n,r,I} over its finite Igusa cover and B_n=O_p^×·(1+p^n Hdg^(−p^n/(p−1))Res_{O_F/Z}G_a). Define the integral AIP coefficient sheaf as (g_n f_n)_*O_{F_{n,r,I}}[κ⁻¹] on the formal model, then pass to the adic integral and rational generic fibres. This uses the modified differential lattice and is independent of the perfectoid equivariant-function definition.
Sources: AIP-ADIC-2016 §4.1–4.2, Definition before Proposition 4.3, pp.15–16; BHW-2023 Definition 7.9, p.1761; AIP-ADIC-2016 §6.4, finite-character construction before Theorem 6.7, p.29

### OverconvergentAutomorphicForms:O5/aip-line-and-gluing

theorem TauCeti.Overconvergent.aip_line_and_gluing : The independently constructed analytic AIP O+ coefficient sheaves are locally free of rank one and canonically identify under admissible chart changes, yielding the rational analytic line. For the universal formal character on W_F^0, formal invertibility and chart change follow from AIP Propositions 4.3 and 4.7. For full finite-character weights, the additional integral O+ identification/local-generator proof is the unresolved target recorded in the gap; no full-weight formal invertibility is inferred from Proposition 4.3.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum. Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
Carrier dependencies: OverconvergentAutomorphicForms:O5/aip-independent-coefficients, HodgeTateAndCanonicalSubgroups:T5, PerfectoidSpaces:P9
Acceptance: Overlaps identify generators up to integral units and satisfy the triple-overlap cocycle.
Sources: AIP-ADIC-2016 Propositions 4.3 and 4.7, pp.16–18; BHW-2023 Proposition 7.10, p.1762

### OverconvergentAutomorphicForms:O5/geometric-aip-comparison

comparison TauCeti.Overconvergent.geometric_aip_comparison : On the common admitted domains, for all n≥0 and n=∞, the chosen Hodge–Tate tautological frame defines ω_{G*,n}^{κ,+}≅ω_{G*,AIP,n}^{κ,+}, and hence the rational line isomorphism. At n=0 use AL_1 on both sides. Positive radii are chosen from the verified intersection; no εκ derived from the false printed supremum/formula is asserted.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum. Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
Carrier dependencies: OverconvergentAutomorphicForms:O5/aip-line-and-gluing, OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf, HodgeTateAndCanonicalSubgroups:T5, PerfectoidSpaces:P9, OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Acceptance: F=Q specialises to the modular-curve perfectoid–Pilloni construction after the same inverse-weight and AL conventions. Integral freeness of the perfectoid coefficient equalizer follows on this intersection.
Sources: BHW-2023 Theorem 7.14 and proof, pp.1764–1765

### OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison

comparison TauCeti.Overconvergent.arithmetic_aip_comparison : Define arithmetic AIP coefficients independently as the twisted finite Δ(N)-invariants of π_* of geometric AIP coefficients. Then ω_{G,c,n}^{κ,+}≅ω_{G,c,AIP,n}^{κ,+} for n≥0 or ∞ and the common admitted radii. The isomorphism includes the Weil-pairing character and finite polarisation action; rationalisation gives the arithmetic analytic line.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum. Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Arithmetic family κ_ar=(w,t) with geometric κ=ρ(w,t); translate AIP CUSP’s (ν,w_AIP) as ν=w and w_AIP=t⁻¹.
Carrier dependencies: OverconvergentAutomorphicForms:O5/geometric-aip-comparison, OverconvergentAutomorphicForms:O4/weil-pairing-comparison, OverconvergentAutomorphicForms:O4/finite-polarisation-descent, OverconvergentAutomorphicForms:O4/geometric-full-cover-comparison, OverconvergentAutomorphicForms:O4/twisted-polarisation-action, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Acceptance: Removing w(eβ)⁻¹ breaks the determinant/polarisation equivariance for nontrivial w.
Sources: BHW-2023 Definition 9.11 and Theorem 9.12, p.1787; AIP-CUSP-2016 §4, weight convention before Theorem 4.4, pp.26–28

### OverconvergentAutomorphicForms:O5/aip-comparison-naturality

theorem TauCeti.Overconvergent.aip_comparison_naturality : The geometric and arithmetic comparisons are uniquely determined by their maps on the chosen tautological frame torsors. They commute with weight pullback, admitted chart/radius refinement and compatible level maps; equality of dimensions or a scalar normalisation at one classical weight does not determine this comparison.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum. Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Maps of weight families pull back the specified character and its analytic extension. Claims about sheaves do not assert arbitrary nonflat base change of global sections.
Carrier dependencies: OverconvergentAutomorphicForms:O5/geometric-aip-comparison, OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison, OverconvergentAutomorphicForms:O3/hilbert-weight-pullback, HodgeTateAndCanonicalSubgroups:T5, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Acceptance: Rescaling a chosen frame rescales both eigenfunction descriptions in the same way.
Sources: BHW-2023 Proofs of Theorems 7.14 and 9.12, pp.1764–1765,1787; AIP-ADIC-2016 Proposition 4.7, pp.17–18

### OverconvergentAutomorphicForms:O6/hilbert-cusp-forms

construction TauCeti.Overconvergent.hilbert_cusp_forms : On the supplied smooth toroidal compactification with boundary divisor D, define the subcanonical coefficient line ω^κ(−D)=ω^κ⊗I_D and cusp forms Sκ(n,N,ε;U)=H^0(ω^κ(−D)) on the admitted toroidal neighbourhood, with the corresponding integral lattice and positive-radius colimit. Arithmetic forms descend with the same boundary ideal.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. C6 supplies the toroidal/minimal neighbourhoods, boundary Cartier ideal, extensions of the coefficient line and boundary-compatible maps.
Carrier dependencies: OverconvergentAutomorphicForms:O5/geometric-aip-comparison, OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison, ShimuraCompactifications:C6, OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.hilbert_cusp_forms.inclusion : Sκ injects into the corresponding modular forms via I_D→O.
lemma TauCeti.Overconvergent.hilbert_cusp_forms.boundaryKernel : Cusp sections are the kernel of restriction to the boundary coefficient sheaf.
lemma TauCeti.Overconvergent.hilbert_cusp_forms.restrict : Radius, level and weight maps retaining the boundary ideal induce maps on cusp forms.
example TauCeti.Overconvergent.Test.O6_hilbert_cusp_forms_constant : At weight zero on a connected compactified component with nonempty boundary, the constant section 1 is not cuspidal.
example TauCeti.Overconvergent.Test.O6_hilbert_cusp_forms_elliptic : For F=Q the q-expansion of a cusp section has constant coefficient 0 at every cusp.
example TauCeti.Overconvergent.Test.O6_hilbert_cusp_forms_higherDegree : Koecher extension in g>1 does not make a nonzero boundary constant term vanish.
Acceptance: On the supplied smooth toroidal compactification with boundary divisor D, define the subcanonical coefficient line ω^κ(−D)=ω^κ⊗I_D and cusp forms Sκ(n,N,ε;U)=H^0(ω^κ(−D)) on the admitted toroidal neighbourhood, with the corresponding integral lattice and positive-radius colimit. Arithmetic forms descend with the same boundary ideal.
Sources: BHW-2023 Remark 6.9 and Remark 9.9, pp.1759,1786

### OverconvergentAutomorphicForms:O6/hilbert-koecher

comparison TauCeti.Overconvergent.hilbert_koecher : For g>1, the supplied Hilbert Koecher theorem identifies interior coefficient sections with their extension to the minimal/toroidal compactified neighbourhood. Cusp sections are separately those vanishing along D. For g=1 use the compactified cusp/q-expansion calculation instead of a codimension≥2 Koecher claim. These identifications commute with the O5 comparison.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use C6’s normality, compactification maps and minimal-boundary codimension hypotheses; at g=1 the minimal boundary has codimension one.
Carrier dependencies: OverconvergentAutomorphicForms:O6/hilbert-cusp-forms, ShimuraCompactifications:C6, AutomorphicBundles:B5/hilbert-cuspidal-boundary, OverconvergentAutomorphicForms:O5/aip-comparison-naturality
Acceptance: A section with nonzero q-constant term can extend by Koecher and still fail to be a cusp form.
Sources: AIP-ADIC-2016 §8.4, Proposition 8.4, pp.36–37 (statement p.37); BHW-2023 Remark 6.9, p.1759

### OverconvergentAutomorphicForms:O6/tame-hilbert-hecke

construction TauCeti.Overconvergent.tame_hilbert_hecke : For a prime ideal a∤pN and its moduli correspondence X_c←^{π1}C_a→^{π2}X_{ca}, use the canonical coefficient identification θ:π2*ω→π1*ω from the prime-to-p Hodge–Tate isogeny. Set T_a=q_a⁻¹Tr_{π1} θ π2*, q_a=|O_F/a|. It maps the ca component to c, preserves radii, extends to the boundary, and descends to arithmetic polarisation classes.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. π1 is finite locally free of degree q_a+1 for the prime cyclic-subgroup correspondence. The normalization is 1/q_a, not reciprocal degree.
Carrier dependencies: OverconvergentAutomorphicForms:O4/polarisation-class-forms, OverconvergentAutomorphicForms:O2/hilbert-cocycle-law, HilbertModularVarietiesAndShimuraCurves:H3, ShimuraCompactifications:C6, AdicSpacesPartII:R3/pull-identify-trace, AdicSpacesPartII:R3/analytic-trace-finite-locally-free, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product, HilbertModularVarietiesAndShimuraCurves:H1, HilbertModularVarietiesAndShimuraCurves:H4
lemma TauCeti.Overconvergent.tame_hilbert_hecke.formula : T_a=q_a⁻¹Trπ1 θ π2*.
lemma TauCeti.Overconvergent.tame_hilbert_hecke.component : The source polarisation ideal is ca and the target is c.
lemma TauCeti.Overconvergent.tame_hilbert_hecke.integral : T_a preserves the specified integral lattice.
lemma TauCeti.Overconvergent.tame_hilbert_hecke.cusp : The boundary-compatible correspondence preserves cusp forms.
example TauCeti.Overconvergent.Test.O6_tame_hilbert_hecke_weightZero : On the constant weight-zero section 1, T_a(1)=(q_a+1)/q_a.
example TauCeti.Overconvergent.Test.O6_tame_hilbert_hecke_normalisation : Averaging by 1/(q_a+1) would send 1 to 1 and is not BHW’s operator.
example TauCeti.Overconvergent.Test.O6_tame_hilbert_hecke_component : Changing a representative ca by a positive p-unit conjugates by P_x and leaves the arithmetic class operator unchanged.
Acceptance: For a prime ideal a∤pN and its moduli correspondence X_c←^{π1}C_a→^{π2}X_{ca}, use the canonical coefficient identification θ:π2*ω→π1*ω from the prime-to-p Hodge–Tate isogeny. Set T_a=q_a⁻¹Tr_{π1} θ π2*, q_a=|O_F/a|. It maps the ca component to c, preserves radii, extends to the boundary, and descends to arithmetic polarisation classes.
Sources: BHW-2023 Lemma 10.1 and Definition 10.2, pp.1788–1789

### OverconvergentAutomorphicForms:O6/wild-hilbert-hecke

construction TauCeti.Overconvergent.wild_hilbert_hecke : For 𝔭|p, q_𝔭=|O_F/𝔭|, e=v_𝔭(p), finite n≥1 and l=ne+1, use the anticanonical extension correspondence with π1 degree q_𝔭 and π2 quotient by D[𝔭]. Let u_𝔭=diag(ϖ_𝔭,1); its action identifies π2*ω+→π1*ω+ independently of the chosen generator of 𝔭O_p. Define U_𝔭=q_𝔭⁻¹Trπ1 θ_𝔭 π2*. It improves the 𝔭-partial Hasse bound, not all partial bounds in general.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. The actual extra level and anticanonical subgroup condition are C[𝔭^{en}]=D[𝔭^{en}]. The chosen domains must support this correspondence.
Carrier dependencies: OverconvergentAutomorphicForms:O4/polarisation-class-forms, OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor, HilbertModularVarietiesAndShimuraCurves:H3, HodgeTateAndCanonicalSubgroups:T4, ShimuraCompactifications:C6, AdicSpacesPartII:R3/pull-identify-trace, AdicSpacesPartII:R3/analytic-trace-finite-locally-free, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product, HilbertModularVarietiesAndShimuraCurves:H1, HilbertModularVarietiesAndShimuraCurves:H4
lemma TauCeti.Overconvergent.wild_hilbert_hecke.formula : U_𝔭=q_𝔭⁻¹Trπ1 θ_𝔭 π2*.
lemma TauCeti.Overconvergent.wild_hilbert_hecke.uniformiserIndependent : The coefficient map and resulting operator do not depend on ϖ_𝔭.
lemma TauCeti.Overconvergent.wild_hilbert_hecke.partialRadius : The second projection lands in the supplied improved 𝔭-Hasse neighbourhood.
lemma TauCeti.Overconvergent.wild_hilbert_hecke.cusp : Boundary-compatible quotient isogenies preserve the cusp submodule.
example TauCeti.Overconvergent.Test.O6_wild_hilbert_hecke_ellipticRadius : For F=Q the second projection lands in radius ε/p.
example TauCeti.Overconvergent.Test.O6_wild_hilbert_hecke_constant : At weight zero, U_p(1)=1 because π1 has degree p and the factor is 1/p.
example TauCeti.Overconvergent.Test.O6_wild_hilbert_hecke_individualCompactness : For a split p in degree>1, improvement in only one partial Hasse coordinate does not prove compactness on the simultaneous-radius Banach module.
Acceptance: For 𝔭|p, q_𝔭=|O_F/𝔭|, e=v_𝔭(p), finite n≥1 and l=ne+1, use the anticanonical extension correspondence with π1 degree q_𝔭 and π2 quotient by D[𝔭]. Let u_𝔭=diag(ϖ_𝔭,1); its action identifies π2*ω+→π1*ω+ independently of the chosen generator of 𝔭O_p. Define U_𝔭=q_𝔭⁻¹Trπ1 θ_𝔭 π2*. It improves the 𝔭-partial Hasse bound, not all partial bounds in general.
Sources: BHW-2023 §10.2, Lemma 10.3 and Definition 10.4, pp.1789–1790

### OverconvergentAutomorphicForms:O6/hilbert-diamond-operators

construction TauCeti.Overconvergent.hilbert_diamond_operators : For a finite tame-level normalizer element d inducing a level automorphism on the actual Hilbert moduli scheme, define ⟨d⟩ by pullback of sections with the induced coefficient identification. The multiplication law is the one of that level action, with inverse-base-action convention fixed as in B5; boundary ideals and arithmetic polarisation descent are retained.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use a finite tame level automorphism, with its actual action on the coefficient torsor. This is separate from the central projective quotient and positive-unit polarisation action.
Carrier dependencies: HilbertModularVarietiesAndShimuraCurves:H3, AutomorphicBundles:B5/hecke-section-operator, OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality, OverconvergentAutomorphicForms:O4/polarisation-choice-independence, ShimuraCompactifications:C6, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product, HilbertModularVarietiesAndShimuraCurves:H1, HilbertModularVarietiesAndShimuraCurves:H4
lemma TauCeti.Overconvergent.hilbert_diamond_operators.apply : Pullback through the level automorphism with its coefficient map.
lemma TauCeti.Overconvergent.hilbert_diamond_operators.mul : Composition follows the fixed level-action convention.
lemma TauCeti.Overconvergent.hilbert_diamond_operators.cusp : The induced map preserves vanishing on the boundary.
example TauCeti.Overconvergent.Test.O6_hilbert_diamond_operators_identity : ⟨1⟩ is the identity operator.
example TauCeti.Overconvergent.Test.O6_hilbert_diamond_operators_inverse : ⟨d⁻¹⟩ is inverse to ⟨d⟩.
example TauCeti.Overconvergent.Test.O6_hilbert_diamond_operators_polarisation : A positive-unit polarisation action is not renamed a tame diamond operator without matching the level moduli action.
Acceptance: For a finite tame-level normalizer element d inducing a level automorphism on the actual Hilbert moduli scheme, define ⟨d⟩ by pullback of sections with the induced coefficient identification. The multiplication law is the one of that level action, with inverse-base-action convention fixed as in B5; boundary ideals and arithmetic polarisation descent are retained.
Sources: AIP-CUSP-2016 §3.7, Remark 3.28, p.24

### OverconvergentAutomorphicForms:O6/aip-hecke-equivariance

theorem TauCeti.Overconvergent.aip_hecke_equivariance : The geometric and arithmetic O5 integral/rational comparison maps intertwine tame T_a, finite tame diamond actions and wild U_𝔭 on their actual section modules, with the same q_a⁻¹ and q_𝔭⁻¹ factors. For wild operators the rational normalized action and integral renormalized action are distinguished.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. All correspondence and AIP chart hypotheses used above hold on the common source and target domains.
Carrier dependencies: OverconvergentAutomorphicForms:O5/geometric-aip-comparison, OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison, OverconvergentAutomorphicForms:O6/tame-hilbert-hecke, OverconvergentAutomorphicForms:O6/wild-hilbert-hecke, OverconvergentAutomorphicForms:O6/hilbert-diamond-operators, HodgeTateAndCanonicalSubgroups:T5, AdicSpacesPartII:R3/pull-identify-trace
Acceptance: The comparison diagram uses exactly the same scalar normalizer on its two sides.
Sources: BHW-2023 Proposition 10.8 and proof, pp.1791–1792

### OverconvergentAutomorphicForms:O6/hilbert-q-expansion-comparison

comparison TauCeti.Overconvergent.hilbert_q_expansion_comparison : At each supplied compactified cusp, the O5 frame comparison identifies the perfectoid coefficient q-expansion with the AIP expansion. At algebraic weights it agrees with B5’s classical Hilbert expansion after converting κ_ar=(w,t) to (ν=w,w_AIP=t⁻¹) and matching B5’s coefficient line, cusp labels and Hecke normalization. Vanishing of every cusp constant term characterizes cuspidality in the supplied range.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use B5’s exact algebraic-weight, tame level and coefficient-ring hypotheses for its classical expansion principle; p-level/family expansions require the requested extension below.
Carrier dependencies: OverconvergentAutomorphicForms:O5/aip-comparison-naturality, OverconvergentAutomorphicForms:O6/aip-hecke-equivariance, AutomorphicBundles:B5/hilbert-cusp-expansion, AutomorphicBundles:B5/hilbert-expansion-principle, AutomorphicBundles:B5/hilbert-cuspidal-boundary, AutomorphicBundles:B5/hecke-expansion-compatibility, AutomorphicBundles:B5, ShimuraCompactifications:C6, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Acceptance: For F=Q the cusp constant coefficient is zero precisely for cusp sections. A classical B5 theorem at prime-to-p full level is not applied directly to an arbitrary Iwahori family without the requested extension.
Sources: BHW-2023 Remark 6.9; Proposition 10.8, pp.1759,1791–1792

### OverconvergentAutomorphicForms:O6/fixed-cusp-banach-modules

theorem TauCeti.Overconvergent.fixed_cusp_banach_modules : At finite wild level and bounded affinoid weight U=Spa(A,A+), with κ locally n_an-analytic and partial Hasse bounds 0<v_i<1/p^{n_an}, on a selected cofinal global-Hasse minimal affinoid neighbourhood inside the partial-radius region, the fixed-radius cusp module is a projective Banach A-module in the (Pr) sense: a continuous direct summand of an orthonormalisable Banach module. Weight specialisation to the source’s coefficient-field points is surjective. This is not finite projectivity, and no such claim is made for every noncuspidal or infinite-level section module.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use the sufficiently small tame level, compactified coefficient model, positive cofinal partial-radius range and finite-level cusp vanishing hypotheses of AIP CUSP Theorems 3.16 and 4.4. For arithmetic descent work in characteristic zero, where the finite Δ projector is defined. Choose the refined global-Hasse strict affinoid neighbourhood of AIP CUSP Proposition 3.22’s Hattori footnote. Arbitrary simultaneous partial-radius opens are not assumed affinoid.
Carrier dependencies: OverconvergentAutomorphicForms:O6/hilbert-cusp-forms, OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison, ShimuraCompactifications:C6, LocallyAnalyticDistributions:L4/projective-banach-modules, OverconvergentAutomorphicForms:O6/cuspidal-coefficient-vanishing
Acceptance: For F=Q an infinite-dimensional fixed-radius cusp module may satisfy (Pr) without being finite projective over A. The statement excludes ε=0 and infinite wild level.
Sources: AIP-CUSP-2016 Theorem 4.4 and proof, p.28; Theorem 3.16, p.18

### OverconvergentAutomorphicForms:O6/compact-radius-restriction

theorem TauCeti.Overconvergent.compact_radius_restriction : For finite-level fixed cusp Banach modules on nested admissible minimal affinoid neighbourhoods V⋐_U W with coherent pushed-forward cusp coefficient, restriction S(W)→S(V) is completely continuous in the nonarchimedean finite-rank-approximation sense used by LAD L4. It is not justified merely by continuity or by compactness of a topological image over a general affinoid algebra.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use C6’s coherent cusp pushforward and the relative compactness W,V required by AdicSpacesPartII:R3. Source S(W) satisfies (Pr). Choose the same cofinal global-Hasse affinoid models as fixed-cusp-banach-modules, with the required relative compact containment after the controlling radius improvement.
Carrier dependencies: OverconvergentAutomorphicForms:O6/fixed-cusp-banach-modules, AdicSpacesPartII:R3/restriction-strictly-completely-continuous, LocallyAnalyticDistributions:L4/completely-continuous, ShimuraCompactifications:C6
Acceptance: Restriction along an equality of domains is the identity and is not completely continuous on an infinite orthonormalisable module.
Sources: AIP-CUSP-2016 Lemma 3.27 and proof, p.24

### OverconvergentAutomorphicForms:O6/controlling-hilbert-operator

construction TauCeti.Overconvergent.controlling_hilbert_operator : On finite-level arithmetic cusp forms over a bounded affinoid family define U_p=∏_{𝔭|p}U_𝔭^{e_𝔭}, e_𝔭=v_𝔭(p), using the commuting arithmetic operators and polarisation transports. The product maps through the neighbourhood with every partial Hasse bound v_i/p; its total normalizer is (∏q_𝔭^{e_𝔭})⁻¹=p^(−g).
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use compatible finite-level partial-radius correspondences and a fixed positive radius vector v. The arithmetic class quotient gives a canonical endomorphism; G* requires the stated polarisation representative maps. Choose the same cofinal global-Hasse affinoid models as fixed-cusp-banach-modules, with the required relative compact containment after the controlling radius improvement.
Carrier dependencies: OverconvergentAutomorphicForms:O6/wild-hilbert-hecke, OverconvergentAutomorphicForms:O4/polarisation-choice-independence, HilbertModularVarietiesAndShimuraCurves:H3, HodgeTateAndCanonicalSubgroups:T4, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.controlling_hilbert_operator.product : U_p=∏U_𝔭^{e_𝔭}, with compatible arithmetic polarisation identifications.
lemma TauCeti.Overconvergent.controlling_hilbert_operator.radiusFactorisation : Factor S(v)→S(v/p)→S(v), where the first map is restriction and the second the bounded correspondence action.
lemma TauCeti.Overconvergent.controlling_hilbert_operator.normalizer : The product scalar factor is p^(−g).
example TauCeti.Overconvergent.Test.O6_controlling_hilbert_operator_rational : For F=Q this is the usual single U_p with normalizer 1/p.
example TauCeti.Overconvergent.Test.O6_controlling_hilbert_operator_ramification : If p is totally ramified of degree g, the controlling operator is U_𝔭^g, not just U_𝔭.
example TauCeti.Overconvergent.Test.O6_controlling_hilbert_operator_split : For a split prime in a quadratic field it is U_𝔭1 U_𝔭2 with normalizer p⁻².
Acceptance: On finite-level arithmetic cusp forms over a bounded affinoid family define U_p=∏_{𝔭|p}U_𝔭^{e_𝔭}, e_𝔭=v_𝔭(p), using the commuting arithmetic operators and polarisation transports. The product maps through the neighbourhood with every partial Hasse bound v_i/p; its total normalizer is (∏q_𝔭^{e_𝔭})⁻¹=p^(−g).
Sources: BHW-2023 Remark 10.6, p.1791; AIP-CUSP-2016 Lemma 3.25(4) and Lemma 3.27, pp.22–24

### OverconvergentAutomorphicForms:O6/controlling-complete-continuity

theorem TauCeti.Overconvergent.controlling_complete_continuity : The controlling U_p on the specified finite-level, fixed positive-radius cusp Banach A-module is completely continuous. For G* include its fixed representative comparisons. The proof is the actual radius factorisation through the compact restriction of O6; no compactness claim for every individual U_𝔭 or for the ε=0/infinite-level space is included.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use all hypotheses of fixed-cusp-banach-modules, compact-radius-restriction and controlling-hilbert-operator. Choose the same cofinal global-Hasse affinoid models as fixed-cusp-banach-modules, with the required relative compact containment after the controlling radius improvement.
Carrier dependencies: OverconvergentAutomorphicForms:O6/controlling-hilbert-operator, OverconvergentAutomorphicForms:O6/compact-radius-restriction, OverconvergentAutomorphicForms:O6/aip-hecke-equivariance, LocallyAnalyticDistributions:L4/completely-continuous
Acceptance: At F=Q the factorisation passes through radius v/p. An individual split-prime operator improves only one direction, so this proof does not apply to it.
Sources: AIP-CUSP-2016 Lemma 3.27, p.24; BHW-2023 Remark 10.6, p.1791

### OverconvergentAutomorphicForms:O6/hecke-lattice-renormalisation

theorem TauCeti.Overconvergent.hecke_lattice_renormalisation : T_a preserves the specified integral lattice. Each q_𝔭 U_𝔭 preserves it, and p^g U_p preserves it because ∏q_𝔭^{e_𝔭}=p^g. These are sufficient uniform renormalizations on the stated domains, not assertions of optimality or integrality of the rational normalized U_𝔭 for every weight.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use integral coefficient maps, trace preserving O+ on the supplied finite locally free integral correspondence models, and integral polarisation transport.
Carrier dependencies: OverconvergentAutomorphicForms:O6/tame-hilbert-hecke, OverconvergentAutomorphicForms:O6/wild-hilbert-hecke, OverconvergentAutomorphicForms:O6/controlling-hilbert-operator, AdicSpacesPartII:R3/analytic-trace-finite-locally-free, PerfectoidSpaces:P9, HilbertModularVarietiesAndShimuraCurves:H4
Acceptance: For F=Q the sufficient renormalization is pU_p. Tame integral preservation alone cannot prove normalized wild integral preservation.
Sources: BHW-2023 Lemma 10.3 and Remark 10.7, pp.1789–1791

### OverconvergentAutomorphicForms:O7/ordinary-completed-functions

construction TauCeti.Overconvergent.ordinary_completed_functions : On each ordinary formal affinoid patch define V+ = lim_m colim_i H^0(Ig_i,O/p^m), with i the finite Igusa level. Sheafify the compatible patchwise construction to obtain the completed Igusa structural sheaf; V=V+[1/p]. Global ordinary p-adic forms are its sheaf sections. Do not exchange the two limits or replace sheafwise completion by an unconditional global-section formula.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use T5’s actual ordinary formal Igusa tower with finite-etale transition maps. The inverse limit defines the formal completed structural ring; an identification with the actual analytic tower O+ is the separate O7 comparison target, with the exact hypotheses still recorded as a gap.
Carrier dependencies: HodgeTateAndCanonicalSubgroups:T5, PerfectoidSpaces:P9, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.ordinary_completed_functions.modPower : Projection to colim_i O(Ig_i)/p^m.
lemma TauCeti.Overconvergent.ordinary_completed_functions.levelAction : The compatible finite-level deck actions give a continuous completed tower action.
lemma TauCeti.Overconvergent.ordinary_completed_functions.restriction : Restriction between formal patches commutes with both stated limit maps.
lemma TauCeti.Overconvergent.ordinary_completed_functions.rationalise : V+→V+[1/p].
example TauCeti.Overconvergent.Test.O7_ordinary_completed_functions_order : For the constant profinite translation tower with deck group Z_p, the m-th quotient is Map_lc(Z_p,Z/p^m); the compatible functions x↦x mod p^m define the completed continuous function x↦x, which factors through no single finite level over Z_p.
example TauCeti.Overconvergent.Test.O7_ordinary_completed_functions_trivialTower : For a constant affine tower Spf R, the construction is the p-adic completion lim_m R/p^m.
example TauCeti.Overconvergent.Test.O7_ordinary_completed_functions_nonaffine : On a disjoint union of points indexed by n≥1 with a Z_p-torsor on each, the section whose nth component is the nth p-adic digit is locally in the finite-level mod-p structural colimit but has no uniform finite level globally. Thus sheafifying the level colimit before global sections cannot be replaced by a single global level colimit on this non-quasicompact base.
Acceptance: On each ordinary formal affinoid patch define V+ = lim_m colim_i H^0(Ig_i,O/p^m), with i the finite Igusa level. Sheafify the compatible patchwise construction to obtain the completed Igusa structural sheaf; V=V+[1/p]. Global ordinary p-adic forms are its sheaf sections. Do not exchange the two limits or replace sheafwise completion by an unconditional global-section formula.
Sources: HEUER-2022 Proposition 3.8 and proof, p.16; BHW-2023 Proof of Proposition 6.6, p.1758

### OverconvergentAutomorphicForms:O7/ordinary-weighted-forms

construction TauCeti.Overconvergent.ordinary_weighted_forms : For the continuous bounded integral weight κ, define ordinary geometric forms as the completed Igusa functions satisfying f(tu)=κ(u)⁻¹f(t), for the actual O_p^× deck action. Arithmetic ordinary forms retain the w-polarisation/determinant action and its descent exactly as O4. Coefficients and topology are completed before taking this weight equalizer.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use compatible integral weight coefficients: modulo p^m the character is locally constant and factors through a finite quotient on each fixed affinoid formal patch.
Carrier dependencies: OverconvergentAutomorphicForms:O7/ordinary-completed-functions, OverconvergentAutomorphicForms:O0/bounded-weight-families, OverconvergentAutomorphicForms:O4/twisted-polarisation-action, OverconvergentAutomorphicForms:O4/weil-pairing-comparison, HodgeTateAndCanonicalSubgroups:T5, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.ordinary_weighted_forms.weightRelation : f(tu)=κ(u)⁻¹f(t).
lemma TauCeti.Overconvergent.ordinary_weighted_forms.integralInclusion : The integral weighted equalizer maps to its rationalized sheaf.
lemma TauCeti.Overconvergent.ordinary_weighted_forms.weightPullback : Compatible base/weight pullback induces the weighted ordinary coefficient map.
lemma TauCeti.Overconvergent.ordinary_weighted_forms.arithmeticDescent : Retain the finite twisted Δ action and the full pairing character when passing to arithmetic forms.
example TauCeti.Overconvergent.Test.O7_ordinary_weighted_forms_trivial : κ=1 gives deck-invariant completed functions.
example TauCeti.Overconvergent.Test.O7_ordinary_weighted_forms_sign : For κ(u)=u^k in the elliptic case, the relation is f(tu)=u^(−k)f(t).
example TauCeti.Overconvergent.Test.O7_ordinary_weighted_forms_conductor : A character of arbitrarily large conductor cannot be imposed as equivariance on one fixed small finite Igusa level.
Acceptance: For the continuous bounded integral weight κ, define ordinary geometric forms as the completed Igusa functions satisfying f(tu)=κ(u)⁻¹f(t), for the actual O_p^× deck action. Arithmetic ordinary forms retain the w-polarisation/determinant action and its descent exactly as O4. Coefficients and topology are completed before taking this weight equalizer.
Sources: BHW-2023 Proposition 6.6 and §9, pp.1758,1781–1787; HEUER-2022 Proposition 3.8, p.16

### OverconvergentAutomorphicForms:O7/igusa-completion-comparison

comparison TauCeti.Overconvergent.igusa_completion_comparison : On ordinary affinoid formal patches, the prescribed lim_m colim_i finite-level reductions identify with the integral completed structural sheaf of the actual infinite Igusa tower, equivariantly for its deck action and weight reductions. These local identifications glue; a global equality of two differently ordered limits is not claimed.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use T5’s actual ordinary Igusa tower. P9 must establish the analytic O+ comparison for these specific formal affinoid models, including the precise normality/integral-closure and completion/topology hypotheses; those hypotheses have not been extracted from Heuer Proposition 3.8. No unrestricted nonaffine global-section interchange is used.
Carrier dependencies: OverconvergentAutomorphicForms:O7/ordinary-completed-functions, PerfectoidSpaces:P9, HodgeTateAndCanonicalSubgroups:T5, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Acceptance: The constant affine tower reduces to the ordinary p-adic completion formula. For a constant nonnormal formal model Spf(O_K⟨pT,T²,T³⟩), the integral element T is power-bounded on the generic fibre but is not in the formal structural ring. Thus a completion-to-O+ isomorphism cannot be asserted for arbitrary topologically finite-type formal models without further hypotheses.
Sources: HEUER-2022 Proof of Proposition 3.8, p.16

### OverconvergentAutomorphicForms:O7/ordinary-restriction

construction TauCeti.Overconvergent.ordinary_restriction : Restrict a fixed positive-radius geometric/arithmetic form to the ordinary locus and pull back to its Igusa frame, producing its weighted completed Igusa function. The maps are compatible with positive-radius restrictions and therefore give Mκ†→ordinary Igusa forms, with integral and cusp versions. No surjectivity onto all ordinary forms is part of this map.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use the ordinary torsor frame comparison of T5 and O5. The map on integral sections uses the actual completed structural sheaf comparison.
Carrier dependencies: OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms, OverconvergentAutomorphicForms:O7/ordinary-weighted-forms, OverconvergentAutomorphicForms:O7/igusa-completion-comparison, OverconvergentAutomorphicForms:O5/aip-comparison-naturality, HodgeTateAndCanonicalSubgroups:T5, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
lemma TauCeti.Overconvergent.ordinary_restriction.ofRadius : The colimit map on a positive-radius representative is restriction to the ordinary locus.
lemma TauCeti.Overconvergent.ordinary_restriction.integral : The map preserves the integral weighted sheaf.
lemma TauCeti.Overconvergent.ordinary_restriction.cusp : Boundary vanishing is retained on ordinary cusp charts.
lemma TauCeti.Overconvergent.ordinary_restriction.levelWeight : The map commutes with compatible level and weight changes.
example TauCeti.Overconvergent.Test.O7_ordinary_restriction_representatives : Two colimit representatives agreeing on a smaller positive radius have the same ordinary image.
example TauCeti.Overconvergent.Test.O7_ordinary_restriction_trivial : A weight-zero constant section restricts to the same constant Igusa function.
example TauCeti.Overconvergent.Test.O7_ordinary_restriction_wholeSpace : An ordinary function without any positive-radius extension is not declared an overconvergent form.
Acceptance: Restrict a fixed positive-radius geometric/arithmetic form to the ordinary locus and pull back to its Igusa frame, producing its weighted completed Igusa function. The maps are compatible with positive-radius restrictions and therefore give Mκ†→ordinary Igusa forms, with integral and cusp versions. No surjectivity onto all ordinary forms is part of this map.
Sources: BHW-2023 Proof of Proposition 6.6 and Theorem 7.14, pp.1758,1764–1765

### OverconvergentAutomorphicForms:O7/ordinary-coefficient-comparison

comparison TauCeti.Overconvergent.ordinary_coefficient_comparison : The ε=0 perfectoid/AIP integral coefficient sheaf identifies with the weighted completed Igusa sheaf through the ordinary differential frame and its formal cocycle descent. Arithmetic comparison retains w(eβ)⁻¹ and twisted finite Δ(N)-descent. This identifies ordinary coefficient models, not the entire positive-radius overconvergent space with ordinary Hida forms.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use actual ordinary formal torsor and the completion comparison on patches; κ is bounded with integral unit values.
Carrier dependencies: OverconvergentAutomorphicForms:O7/ordinary-weighted-forms, OverconvergentAutomorphicForms:O7/igusa-completion-comparison, OverconvergentAutomorphicForms:O5/geometric-aip-comparison, OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison, OverconvergentAutomorphicForms:O1/analytic-line-effectivity, HodgeTateAndCanonicalSubgroups:T5, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Acceptance: For an algebraic elliptic weight this is the usual ordinary differential trivialization of ω^k.
Sources: HEUER-2022 Proposition 3.8, p.16; AIP-ADIC-2016 §8.4, discussion after Proposition 8.4, p.37

### OverconvergentAutomorphicForms:O7/ordinary-hecke-expansions

theorem TauCeti.Overconvergent.ordinary_hecke_expansions : Ordinary restriction and the ordinary coefficient comparison commute with compatible weight/level/radius maps, normalized tame T_a, diamonds and wild U_𝔭 on the supplied ordinary correspondences, and with all supplied cusp q-expansions. Cusp forms remain cusp forms and integral renormalized operators obey the same comparison.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use the compactified ordinary correspondence, expansion and integral-trace inputs requested for O6; retain the same normalizers and arithmetic transport.
Carrier dependencies: OverconvergentAutomorphicForms:O7/ordinary-restriction, OverconvergentAutomorphicForms:O7/ordinary-coefficient-comparison, OverconvergentAutomorphicForms:O6/aip-hecke-equivariance, OverconvergentAutomorphicForms:O6/hilbert-q-expansion-comparison, OverconvergentAutomorphicForms:O6/hecke-lattice-renormalisation, PerfectoidSpaces:P9
Acceptance: In the elliptic case ordinary and overconvergent restriction have the same q-expansion at each ordinary cusp. No assertion of equality of all ordinary and finite-slope overconvergent spaces follows.
Sources: BHW-2023 Proposition 10.8, pp.1791–1792; HEUER-2022 Proposition 3.8, p.16

### OverconvergentAutomorphicForms:O6/cuspidal-coefficient-vanishing

theorem TauCeti.Overconvergent.cuspidal_coefficient_vanishing : For the supplied toroidal-to-minimal map ρ at the finite Igusa/p-level formal model and the small analytic coefficient Ωχ, R^qρ_*Ωχ(−D)=0 for q>0; the untwisted structural assertion is R^qρ_*O(−D)=0. After the permitted base changes, the pushed-forward cusp coefficient is coherent and gives the acyclic affinoid section model used for (Pr) and specialisation.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use the precise formal Igusa normalization, boundary divisor and sufficiently small analytic character χ of AIP CUSP §3.6. The formal cusp vanishing input from the fan/unit quotient is the recorded missing compactification theorem. The chosen minimal neighbourhood is an actual global-Hasse affinoid strict neighbourhood inside the partial-radius region; AIP CUSP Proposition 3.22’s Hattori footnote explicitly requires this refinement.
Carrier dependencies: ShimuraCompactifications:C6, AdicSpacesPartII:R3/tate-acyclicity-finite-modules, OverconvergentAutomorphicForms:O5/aip-line-and-gluing
Acceptance: The argument uses −D and is not asserted for every noncuspidal coefficient sheaf.
Sources: AIP-CUSP-2016 Theorem 3.17, Corollary 3.20 and Proposition 3.22 with footnote, pp.18–21

## Explicit unresolved inputs

Jacquet–Emerton eigenvariety and unitary regularity owner: No existing stage/node covers Emerton analytic vectors and J_B, the full T(K)-character functor with unramified coordinates, coherent strong-dual support, definite-unitary admissibility/local regularity with s≥1, its dimension/depth theorem and classical-density reducedness. PadicFamilies L2a is the Buzzard compact-operator engine; CC.8 is only the completed topological adapter. Proposed Part II: PadicFamilies, Part II: Jacquet-module eigenvarieties, starting with these two existing packages and compact-torus characters. The Ding source proof leaves require the precise BHS/Emerton theorem statements before implementation.

Cuspidal formal cohomology beyond compactification geometry: C6 supplies geometry but has no exact node for the formal toric fan/unit quotient cusp vanishing of AIP CUSP Appendix Proposition6.4 and Theorem3.17, nor the theorem-on-formal-functions adapter. Proposed Part II: ShimuraCompactifications, Part II: Hilbert cusp cohomology, with the structural R^qρ_*O(−D)=0 input. O6 then proves the analytic coefficient lift and (Pr) application. The author-noted global-Hasse affinoid refinement must remain in the fixed-radius statement.

Numerical comparison of weight charts and radius ranges: A common positive radius follows from the requested universal-coordinate analytic extension and canonical subgroup bounds. No valid scalar replacement for BHW rκ=|p|^r0|Tκ| was established; E3 disproves it even after the pro-p supremum correction. Implementation must use AIP coordinate charts/admitted inequalities, or prove a separate quantitative radius theorem; no guessed closed formula is a prerequisite here.

O0 prototype carriers from suppliers: The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised.

O1 prototype carriers from suppliers: The algebraic RightCocycle core, equivariant submodule, gauge equivalence and left-to-right conversion are typed in the suggested file. The actual analytic coefficient ringed site, torsor, analytic function and stable-lattice conditions are absent from the pinned libraries and remain precise supplier-dependent signature omissions; no Prop-valued replacement is introduced.

O2 prototype carriers from suppliers: The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised.

O3 prototype carriers from suppliers: The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised.

O4 prototype carriers from suppliers: The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised.

O5 prototype carriers from suppliers: The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised.

O6 prototype carriers from suppliers: The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised.

O7 prototype carriers from suppliers: The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised.

Full finite-character integral AIP comparison: AIP ADIC §§4.1–4.3 constructs an invertible formal w_{n,r,I} for the universal character on W_F^0. §6.4 (p.29) adds a finite-character wχ stated coherent and invertible on the ordinary locus and analytic fibre, not on the whole formal model. BHW Proposition 7.10 and Theorem 7.14 assert full analytic O+ invertibility/comparison, but their reduction to Prop.4.3 suppresses this factor. Supply at T5/P9 the precise full-character analytic O+ local-generator/descent theorem on the common admitted domains and its chart transitions. For the proposed divide-by-generator proof of O5, prove its pullback is an O+ unit, or replace that proof by a coefficient-sensitive integral descent argument. Do not assume the perfectoid equalizer is already a line or infer integral freeness from rational freeness. This review does not establish that either published theorem is false.

Formal completion versus actual analytic Igusa O+: Heuer Proposition 3.8, p.16, constructs O(𝔛∞)=lim_m colim_i O(𝔛_i)/p^m → O+(X∞); it does not assert this map is an isomorphism. A constant nonnormal model O_K⟨pT,T²,T³⟩ already misses the power-bounded integral element T. T5/P9 must supply the exact normal/integrally closed formal Igusa models and the theorem identifying their completed structural rings with the analytic O+ sheaf, with the requisite topology, base change and restriction hypotheses. Formal effectivity of the line cocycle alone does not settle this comparison.

-/
