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
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.Algebra.Module.Projective
import Mathlib.RingTheory.Valuation.Integers
import Mathlib.Algebra.Order.Monoid.Prod
import Mathlib.Algebra.Order.GroupWithZero.WithZero
import Mathlib.Algebra.Colimit.DirectLimit
import Mathlib.RingTheory.Ideal.Quotient.Defs
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.Topology.Algebra.Ring.Basic

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

/-! ## Scalar tests of the integral AIP proof
These declarations test the scalar norm argument on genuine Mathlib carriers.
They do not define a Hilbert torsor, a valued-point site, or an analytic sheaf.
The adic application in O5 uses every valuation, including higher-rank points.
-/
namespace TauCeti.Overconvergent
namespace aip_independent_coefficients
variable {K : Type*} [NormedField K]
/-- Finite torsion characters have unit norm, including p-primary torsion. -/
theorem finiteOrder_norm_one (u : Kˣ) (n : ℕ) (hn : n ≠ 0) (hu : u ^ n = 1) :
    ‖(u : K)‖ = 1 := sorry
/-- Normed-field part of `translationUnits`: both directions preserve the bound. -/
theorem translationUnits (u : Kˣ) (hu : ‖(u : K)‖ = 1) (a : K) :
    (‖(u : K)⁻¹ * a‖ ≤ 1 ↔ ‖a‖ ≤ 1) := sorry
end aip_independent_coefficients

namespace geometric_aip_comparison
variable {G X Y K : Type*} [Group G] [MulAction G Y] [NormedField K]
/-- Scalar core of O5's boundedness argument. Orbit coverage is an explicit
hypothesis; it does not stand for a missing geometric condition. -/
theorem bounded_iff (κ : G →* Kˣ) (f : Y → K) (s : X → Y)
    (hκ : ∀ g, ‖(κ g : K)‖ = 1)
    (hf : ∀ g y, f (g • y) = (κ g : K)⁻¹ * f y)
    (hcover : ∀ y, ∃ (g : G) (x : X), g • s x = y) :
    (∀ y, ‖f y‖ ≤ 1) ↔ ∀ x, ‖f (s x)‖ ≤ 1 := sorry
end geometric_aip_comparison

/-! Algebraic specialisation of the P9 integral-coboundary criterion.
Here A and B are actual scalar rings, and the invariant-ring hypothesis is
fully stated. This tests why a unit eigenvector trivialises the lattice;
it does not assert existence of such a unit on any geometric chart. -/
namespace ScalarIntegralFixture
variable (A B G : Type*) [CommRing A] [CommRing B] [Algebra A B] [Group G]
def eigenmodule (δ : G →* (B ≃ₐ[A] B)) (χ : G →* Aˣ) : Submodule A B where
  carrier := {b | ∀ g, δ g b = algebraMap A B ((↑((χ g)⁻¹)) : A) * b}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- A unit eigenvector and the exact invariant ring yield an integral line. -/
def unitGeneratorEquiv (δ : G →* (B ≃ₐ[A] B)) (χ : G →* Aˣ)
    (hbase : Function.Injective (algebraMap A B))
    (hfixed : ∀ b : B, (∀ g, δ g b = b) → ∃ a : A, algebraMap A B a = b)
    (u : Bˣ) (hu : ∀ g, δ g (u : B) = algebraMap A B ((↑((χ g)⁻¹)) : A) * (u : B)) :
    A ≃ₗ[A] eigenmodule A B G δ χ := sorry

theorem unitGeneratorEquiv_apply (δ : G →* (B ≃ₐ[A] B)) (χ : G →* Aˣ)
    (hbase : Function.Injective (algebraMap A B))
    (hfixed : ∀ b : B, (∀ g, δ g b = b) → ∃ a : A, algebraMap A B a = b)
    (u : Bˣ) (hu : ∀ g, δ g (u : B) = algebraMap A B ((↑((χ g)⁻¹)) : A) * (u : B))
    (a : A) :
    (unitGeneratorEquiv A B G δ χ hbase hfixed u hu a : B) =
      algebraMap A B a * (u : B) := sorry
end ScalarIntegralFixture

namespace Test
local instance : Fact (Nat.Prime 3) := ⟨by decide⟩
-- Scalar part of O5_aip_independent_coefficients_finiteFactor.
-- The actual normalized finite Igusa eigencomponent remains in the omission register.
example : ‖(-1 : ℚ_[3])‖ = 1 ∧ ‖(-1 : ℚ_[3])⁻¹‖ = 1 := sorry
-- O5/geometric-aip-comparison: the trivial multiplier keeps the whole orbit bound.
example {G X Y K : Type*} [Group G] [MulAction G Y] [NormedField K]
    (f : Y → K) (s : X → Y) (hf : ∀ (g : G) (y : Y), f (g • y) = f y)
    (hcover : ∀ y, ∃ (g : G) (x : X), g • s x = y) :
    (∀ y, ‖f y‖ ≤ 1) ↔ ∀ x, ‖f (s x)‖ ≤ 1 := sorry
-- A one-way integral multiplier is insufficient.
example : ‖(3 : ℚ_[3])‖ ≤ 1 ∧ ¬ ‖(3 : ℚ_[3])⁻¹‖ ≤ 1 := sorry
-- A rational unit need not be an integral unit.
example : ¬ IsUnit (3 : ℤ_[3]) ∧ IsUnit (3 : ℚ_[3]) := sorry
end Test
end TauCeti.Overconvergent

/-! ## Ordinary-completion proof tests
The norm and polynomial tests below are partial algebraic tests of O7.
They are not a Tate algebra, a formal scheme, or an infinite Igusa tower.
The polynomial seed explains why completion of a nonnormal model can miss
power-bounded functions; the actual analytic counterexample is in O7's contract.
-/
namespace TauCeti.Overconvergent.OrdinaryCompletionFixture
variable {A : Type*} [NormedCommRing A] [NormOneClass A]
/-- Normed-ring step of O7: power multiplicativity characterises bounded powers. -/
theorem powers_bounded_iff (hA : IsPowMul (norm : A → ℝ)) (a : A) :
    (∃ C : ℝ, ∀ n : ℕ, ‖a ^ n‖ ≤ C) ↔ ‖a‖ ≤ 1 := sorry

variable (p : ℕ) [Fact p.Prime]
/-- Polynomial seed of the reviewed nonnormal-model counterexample. -/
def nonnormalSeed : Subalgebra ℤ_[p] (Polynomial ℚ_[p]) :=
  Algebra.adjoin ℤ_[p] { (p : ℚ_[p]) • Polynomial.X,
    Polynomial.X ^ 2, Polynomial.X ^ 3 }

-- Integral polynomial coefficients have a p-divisible linear coefficient in this seed.
example : (Polynomial.X : Polynomial ℚ_[p]) ∉ nonnormalSeed p := sorry
example : (Polynomial.X ^ 2 : Polynomial ℚ_[p]) ∈ nonnormalSeed p ∧
    (Polynomial.X ^ 3 : Polynomial ℚ_[p]) ∈ nonnormalSeed p := sorry
-- Inverting p recovers the omitted parameter.
example : (p : ℚ_[p])⁻¹ • ((p : ℚ_[p]) •
    (Polynomial.X : Polynomial ℚ_[p])) = Polynomial.X := sorry
end TauCeti.Overconvergent.OrdinaryCompletionFixture

/-! ## Algebraic prerequisites for finite coefficients and ordinary completion

BP section 6.2 (pp147–153) requires genuine analytic charts and function spaces.
The following FiniteCoefficientCore keeps the algebraic operations and a supplied stable lattice
separate from that missing analytic structure. None is advertised as finite_analytic_coefficients.
AIP Lemma4.4 (p16) supplies analytic admission; section6.4 (p29) retains the finite-character
factor. The valuation signatures below type the pointwise implication conditional on both bounds.
Heuer Proposition3.8 (p16) motivates the affine ordered ring completion; OrdinaryAffineCompletion
retains that order without identifying its rings with actual Igusa patch functions or analytic O+.
-/

namespace TauCeti.Overconvergent.FiniteCoefficientCore

variable {A H V W : Type*} [CommRing A] [Group H]
  [AddCommGroup V] [Module A V] [AddCommGroup W] [Module A W]

/-- Algebraic action underlying O0 finite analytic coefficients. -/
def action (ρ : Representation A H V) (h : H) : V ≃ₗ[A] V where
  toLinearMap := ρ h
  invFun := ρ h⁻¹
  left_inv := by sorry
  right_inv := by sorry

/-- Tensor and dual actions are existing Mathlib constructions. -/
abbrev tensor (ρ : Representation A H V) (σ : Representation A H W) := ρ.tprod σ
abbrev dual (ρ : Representation A H V) := ρ.dual

/-- Algebraic scalar extension; no assertion about Banach completion is made here. -/
def changeScalars (B : Type*) [CommRing B] [Algebra A B]
    (ρ : Representation A H V) : Representation B H (B ⊗[A] V) where
  toFun h := (ρ h).baseChange B
  map_one' := by sorry
  map_mul' := by sorry

/-- The continuous finite-projective core on the canonical module topology.
Analytic orbit maps and Banach scalar extension still require their actual supplier types. -/
structure ContinuousFiniteCoefficient (A H V : Type*) [CommRing A] [Group H]
    [AddCommGroup V] [Module A V] [Module.Finite A V] [Module.Projective A V]
    [TopologicalSpace A] [IsTopologicalRing A] [TopologicalSpace H]
    [TopologicalSpace V] [IsModuleTopology A V] where
  representation : Representation A H V
  continuous_action : Continuous (fun hv : H × V => representation hv.1 hv.2)

/-- A specified stable integral spanning submodule. Boundedness and openness for a Banach
lattice require the analytic supplier and are not asserted by this algebraic core. -/
structure StableIntegralSubmodule (ρ : Representation A H V) (Aplus : Subring A) where
  lattice : Submodule Aplus V
  stable : ∀ h v, v ∈ lattice → ρ h v ∈ lattice
  spans : Submodule.span A (lattice : Set V) = ⊤

/-- Scalar-character representation. -/
def scalar (χ : H →* Aˣ) : Representation A H A where
  toFun h := (χ h : A) • LinearMap.id
  map_one' := by sorry
  map_mul' := by sorry

/-- Two independent characters, with no rank-one assumption. -/
def diagonal (χ₁ χ₂ : H →* Aˣ) : Representation A H (A × A) :=
  (scalar χ₁).prod (scalar χ₂)

-- O0 finite coefficient action/inverse prerequisite: group action, not a semigroup inverse.
example (ρ : Representation A H V) (h : H) (v : V) :
    (action ρ h).symm (action ρ h v) = v := sorry
-- O0 scalar-character prerequisite.
example (χ : H →* Aˣ) (h : H) (a : A) : scalar χ h a = (χ h : A) * a := sorry
-- O0 rank-two prerequisite: both characters survive.
example (χ₁ χ₂ : H →* Aˣ) (h : H) (a b : A) :
    diagonal χ₁ χ₂ h (a, b) = ((χ₁ h : A) * a, (χ₂ h : A) * b) := sorry
-- O0 dual-sign prerequisite, tested on the scalar module.
example (χ : H →* Aˣ) (h : H) (f : Module.Dual A A) (a : A) :
    dual (scalar χ) h f a = f ((χ h⁻¹ : A) * a) := sorry
-- O0 completed-base-change prerequisite: this tests only the underlying algebraic map.
example (B : Type*) [CommRing B] [Algebra A B] (ρ : Representation A H V)
    (h : H) (b : B) (v : V) :
    changeScalars B ρ h (b ⊗ₜ[A] v) = b ⊗ₜ[A] (ρ h v) := sorry
-- O0 diagonal tensor prerequisite.
example (ρ : Representation A H V) (σ : Representation A H W) (h : H) (v : V) (w : W) :
    tensor ρ σ h (v ⊗ₜ[A] w) = ρ h v ⊗ₜ[A] σ h w := sorry
-- Stable-integral-submodule fixture: the trivial representation preserves the full A-lattice.
example : Nonempty (StableIntegralSubmodule (1 : Representation A H V) (⊤ : Subring A)) := sorry
-- Continuous core fixture on the actual canonical topology of the scalar module.
example [TopologicalSpace A] [IsTopologicalRing A] [TopologicalSpace H]
    [IsModuleTopology A A] : Nonempty (ContinuousFiniteCoefficient A H A) := sorry

end TauCeti.Overconvergent.FiniteCoefficientCore

namespace TauCeti.Overconvergent

variable {R Γ₀ : Type*} [CommRing R] [LinearOrderedCommGroupWithZero Γ₀]

/-- The arbitrary-rank valuation step in O5. At a valued point the actual admitted
character supplies both hypotheses; establishing admission is still a separate geometric input.
This lemma applies to every valuation, without choosing an embedding in the real numbers. -/
theorem aip_translation_valuation_units (v : Valuation R Γ₀) (u : Rˣ)
    (hu : v (u : R) ≤ 1) (hinv : v ((u⁻¹ : Rˣ) : R) ≤ 1) (a : R) :
    v (((u⁻¹ : Rˣ) : R) * a) ≤ 1 ↔ v a ≤ 1 := sorry

namespace ValuationTranslation

/-- Finite-order character values have valuation one, including p-primary values. -/
theorem finiteOrder_value_one (v : Valuation R Γ₀) (u : Rˣ) (d : ℕ)
    (hd : 0 < d) (horder : u ^ d = 1) : v (u : R) = 1 := sorry

/-- All-valuations version: a given family may contain valuations of different ranks.
The family is supplied by geometric O+; this theorem does not define that sheaf. -/
theorem family_integral_iff {I : Type*} (Γ : I → Type*)
    [∀ i, LinearOrderedCommGroupWithZero (Γ i)] (vs : ∀ i, Valuation R (Γ i))
    (u : Rˣ) (hu : ∀ i, vs i (u : R) ≤ 1)
    (hinv : ∀ i, vs i ((u⁻¹ : Rˣ) : R) ≤ 1) (a : R) :
    (∀ i, vs i (((u⁻¹ : Rˣ) : R) * a) ≤ 1) ↔ ∀ i, vs i a ≤ 1 := sorry

-- TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_higherRank
-- A genuinely non-Archimedean ordered value group: the lexicographic two-rank group.
example (v : Valuation R (WithZero (Multiplicative (ℤ ×ₗ ℤ)))) (u : Rˣ)
    (hu : v (u : R) ≤ 1) (hinv : v ((u⁻¹ : Rˣ) : R) ≤ 1) (a : R) :
    v (((u⁻¹ : Rˣ) : R) * a) ≤ 1 ↔ v a ≤ 1 := sorry

-- TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_primePower
-- O5 acceptance: no condition that the torsion order be prime to p occurs.
example (v : Valuation R Γ₀) (u : Rˣ) (p n : ℕ) (hp : 0 < p)
    (hu : u ^ (p ^ n) = 1) : v (u : R) = 1 := sorry
-- TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_finiteOrder
-- O5 finite torsion multiplier and its inverse both preserve the integral bound.
example (v : Valuation R Γ₀) (u : Rˣ) (d : ℕ) (hd : 0 < d)
    (hu : u ^ d = 1) (a : R) :
    v (((u⁻¹ : Rˣ) : R) * a) ≤ 1 ↔ v a ≤ 1 := sorry
-- TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_sign
-- O5 at p=2: the sign character value has order two and is retained.
example (v : Valuation R Γ₀) (a : R) : v (-a) ≤ 1 ↔ v a ≤ 1 := sorry
-- TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_nonunit
-- O5 failure test: an integral multiplier with nonintegral inverse fails at a=1.
example (v : Valuation R Γ₀) (u : Rˣ) (hu : v (u : R) < 1) :
    ¬ (v (((u⁻¹ : Rˣ) : R) * 1) ≤ 1 ↔ v (1 : R) ≤ 1) := sorry
-- TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_eigencondition
-- O5 geometric eigencondition, used pointwise in either translation direction.
example {Y : Type*} (v : Valuation R Γ₀) (u : Rˣ) (h : Y → R) (y y' : Y)
    (heigen : h y' = ((u⁻¹ : Rˣ) : R) * h y)
    (hu : v (u : R) ≤ 1) (hinv : v ((u⁻¹ : Rˣ) : R) ≤ 1) :
    h y' ∈ v.integer ↔ h y ∈ v.integer := sorry

end ValuationTranslation
end TauCeti.Overconvergent

namespace TauCeti.Overconvergent.OrdinaryAffineCompletion

variable (R : ℕ → Type*) [∀ i, CommRing (R i)]
  (f : ∀ i j, i ≤ j → R i →+* R j) [DirectedSystem R (f · · ·)] (p : ℕ)

/-- Reduction at finite level, before taking a direct limit. -/
abbrev Reduction (m i : ℕ) := R i ⧸ Ideal.span {(p : R i) ^ m}

/-- Pullback in level preserves the ideal generated by p^m. -/
def reductionTransition (m i j : ℕ) (hij : i ≤ j) :
    Reduction R p m i →+* Reduction R p m j :=
  Ideal.Quotient.lift _ ((Ideal.Quotient.mk _).comp (f i j hij)) (by sorry)

instance reductionDirected (m : ℕ) :
    DirectedSystem (Reduction R p m) (reductionTransition R f p m · · ·) := by sorry

/-- Inner limit in the O7 affine formula: level is allowed to depend on m. -/
abbrev ReductionColimit (m : ℕ) :=
  DirectLimit (Reduction R p m) (reductionTransition R f p m)

/-- Precision reduction at one finite level. -/
def precisionReduction (m i : ℕ) :
    Reduction R p (m + 1) i →+* Reduction R p m i :=
  Ideal.Quotient.factor (by sorry)

/-- Precision reduction on the level colimit, induced by the finite-level maps. -/
def reduce (m : ℕ) : ReductionColimit R f p (m + 1) →+* ReductionColimit R f p m :=
  DirectLimit.Ring.lift _ _ _
    (fun i => (DirectLimit.Ring.of _ _ i).comp (precisionReduction R p m i)) (by sorry)

/-- Outer inverse limit; ring operations are componentwise. This is an affine algebraic
prerequisite, not a sheaf on an invented replacement for the ordinary formal Igusa tower. -/
def compatibleSubring : Subring (∀ m, ReductionColimit R f p m) where
  carrier := {x | ∀ m, reduce R f p m (x (m + 1)) = x m}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry
  neg_mem' := by sorry

abbrev Completed := compatibleSubring R f p

/-- The m-th precision projection really retains the level colimit. -/
def modPower (m : ℕ) : Completed R f p →+* ReductionColimit R f p m :=
  (Pi.evalRingHom _ m).comp (compatibleSubring R f p).subtype

/-- Rationalisation is localization at p after completion. -/
abbrev Rationalised := Localization.Away (p : Completed R f p)

def rationalise : Completed R f p →+* Rationalised R f p := algebraMap _ _

/-- Finite-level compatible pullbacks induce the restriction between two completed patches.
Actual ordinary formal patch rings and their restrictions must be supplied by T5/P9. -/
def restriction (S : ℕ → Type*) [∀ i, CommRing (S i)]
    (g : ∀ i j, i ≤ j → S i →+* S j) [DirectedSystem S (g · · ·)]
    (φ : ∀ i, R i →+* S i)
    (hφ : ∀ i j hij x, φ j (f i j hij x) = g i j hij (φ i x)) :
    Completed R f p →+* Completed S g p := by sorry

-- O7 affine projection acceptance: reduction compatibility has the specified orientation.
example (x : Completed R f p) (m : ℕ) :
    reduce R f p m (modPower R f p (m + 1) x) = modPower R f p m x := sorry
-- O7 affine level acceptance: moving a representative to a higher level does not change it.
example (m i j : ℕ) (hij : i ≤ j) (x : Reduction R p m i) :
    DirectLimit.Ring.of _ _ j (reductionTransition R f p m i j hij x) =
      (DirectLimit.Ring.of _ _ i x : ReductionColimit R f p m) := sorry
-- Restriction acceptance: the identity patch pullback acts as the identity at every precision.
example (x : Completed R f p) (m : ℕ) :
    modPower R f p m (restriction R f p R f (fun _ => RingHom.id _) (by sorry) x) =
      modPower R f p m x := sorry

section ConstantTower
variable (B : Type*) [CommRing B]

instance constantDirected :
    DirectedSystem (fun _ : ℕ => B) (fun {i j : ℕ} (_ : i ≤ j) => (RingHom.id B : B → B)) := by sorry

/-- A constant affine tower gives the existing p-adic completion, with no analytic identification. -/
def constantEquiv :
    Completed (fun _ : ℕ => B) (fun _ _ _ => RingHom.id B) p ≃+*
      AdicCompletion (Ideal.span {(p : B)}) B := by sorry

-- O7 constant-tower test: this uses Mathlib's actual completion carrier.
example : Nonempty
    (Completed (fun _ : ℕ => B) (fun _ _ _ => RingHom.id B) p ≃+*
      AdicCompletion (Ideal.span {(p : B)}) B) := sorry

end ConstantTower
end TauCeti.Overconvergent.OrdinaryAffineCompletion

/-!
## Supplier-dependent mathematical register (explicit signature omissions)

The prefix types the weight/cocycle cores, arbitrary-rank pointwise valuation translation, finite coefficient algebraic prerequisites and the ordered affine ring completion. The full analytic/geometric node contracts remain distinct from these auxiliary signatures. This register is a mathematical specification, not Lean signatures or compiled examples. Actual adic ringed sites, towers, analytic induction and completed ordinary carriers are the suppliers recorded below. Unknown conditions are omitted from the typed cores; no Prop-valued substitute or artificial geometry is introduced.

Integral comparison and integral freeness are separate: O5 uses rational comparison and valuation-unit translation for its lattice isomorphism. Full-character positive-radius O+ freeness still needs integral trivializations. O7 uses explicit finite-level good-reduction and analytic norm-completion contracts, not an isomorphism inferred from Heuer’s natural map.

OverconvergentAutomorphicForms:O0/units-at-p — Units at p of a number field
TauCeti.HilbertWeight.Op: For a number field F and a prime p, 𝒪_p := ℤ_p ⊗_ℤ 𝒪_F with its ℤ_p-algebra structure from the left factor and the ℤ_p-module topology. It is a finite free ℤ_p-module of rank [F : ℚ], a compact topological ring, and T(ℤ_p) := 𝒪_p^× (with the units topology) is BHW's T(ℤ_p) for T = Res_{𝒪_F|ℤ} G_m.
hypotheses: No hypothesis on how p decomposes in F: 𝒪_p is the product of the completed local rings at the primes above p, not assumed unramified or split.
hypotheses: Scalars on the left, so that the pinned base-change instances apply.
prerequisites: mathlib:TensorProduct
prerequisites: mathlib:NumberField.RingOfIntegers
prerequisites: mathlib:PadicInt
prerequisites: mathlib:Algebra.TensorProduct.leftAlgebra
prerequisites: mathlib:Module.Finite.base_change
prerequisites: mathlib:Module.Free.tensor
prerequisites: mathlib:moduleTopology
prerequisites: mathlib:IsModuleTopology
prerequisites: mathlib:IsModuleTopology.isTopologicalRing
prerequisites: mathlib:IsModuleTopology.continuous_of_linearMap
prerequisites: mathlib:Module.finrank_baseChange
prerequisites: mathlib:NumberField.RingOfIntegers.rank
prerequisites: mathlib:PadicInt.compactSpace
prerequisites: mathlib:Rat.ringOfIntegersEquiv
proofSteps: Define Op F p := ℤ_[p] ⊗[ℤ] 𝓞 F; its ℤ_p-algebra structure is Algebra.TensorProduct.leftAlgebra.
proofSteps: Module.Finite from Module.Finite.base_change and Module.Free from Module.Free.tensor, since 𝓞 F is finite free over ℤ.
proofSteps: Give it moduleTopology ℤ_[p] (an IsModuleTopology instance); it is a topological ring by IsModuleTopology.isTopologicalRing.
proofSteps: Rank: Module.finrank_baseChange with NumberField.RingOfIntegers.rank. Compactness: a ℤ_p-basis identifies 𝒪_p with ℤ_p^n by a linear equivalence, which is a homeomorphism for module topologies (IsModuleTopology.continuous_of_linearMap), and ℤ_p is compact (PadicInt.compactSpace).
proofSteps: The unit locus is clopen and compact: a finite-free multiplication determinant is a unit in Z_p exactly when the element is invertible (adjugate/Cayley–Hamilton). Its continuous inverse image of Z_p^× identifies with O_p^×, including the units topology and continuous inverse.
api: TauCeti.HilbertWeight.compactSpace_Op: 𝒪_p is compact.
api: TauCeti.HilbertWeight.finrank_Op: finrank_{ℤ_p} 𝒪_p = [F : ℚ].
api: TauCeti.HilbertWeight.unitsToOp: The map 𝒪_F^× → 𝒪_p^×, η ↦ 1 ⊗ η.
tests: op_rat: 𝒪_p ≅ ℤ_p for F = ℚ.
tests: op_not_discrete: 𝒪_p is not discrete.
tests: op_split: For F = ℚ(i) and p = 5, 𝒪_p ≅ ℤ_5 × ℤ_5.
acceptance: F = ℚ: 𝒪_p ≅ ℤ_p as ℤ_p-algebras, via Rat.ringOfIntegersEquiv.
acceptance: The topology is not discrete; a definition by the discrete topology would make every character continuous and the weight space far too large.
acceptance: F = ℚ(i), p = 5: 𝒪_p ≅ ℤ_5 × ℤ_5, and T(ℤ_5) = (ℤ_5^×)², matching Res_{𝒪_F|ℤ} G_m at a split prime.

OverconvergentAutomorphicForms:O0/norm-at-p — The norm on units at p
TauCeti.HilbertWeight.normUnits: N : 𝒪_p^× → ℤ_p^× is the norm Algebra.norm ℤ_p (the determinant of multiplication on the free ℤ_p-module 𝒪_p), restricted to units. It is a continuous homomorphism, and N(1 ⊗ a) = N_{F/ℚ}(a) for a ∈ 𝒪_F.
hypotheses: 𝒪_p finite free over ℤ_p (units-at-p).
prerequisites: OverconvergentAutomorphicForms:O0/units-at-p
prerequisites: mathlib:Algebra.norm
prerequisites: mathlib:Units.map
prerequisites: mathlib:Algebra.norm_apply
prerequisites: mathlib:LinearMap.det
prerequisites: mathlib:LinearMap.det_baseChange
prerequisites: mathlib:IsModuleTopology.continuous_of_linearMap
proofSteps: Units.map of the monoid hom Algebra.norm ℤ_[p] : 𝒪_p →* ℤ_p.
proofSteps: Continuity: in a ℤ_p-basis the norm is a polynomial in the coordinates (Algebra.norm_apply, LinearMap.det), and coordinates are continuous for the module topology.
proofSteps: Compatibility: multiplication by 1 ⊗ a is the base change of multiplication by a on 𝒪_F, so its determinant is N_{F/ℚ}(a) (LinearMap.det_baseChange).
api: TauCeti.HilbertWeight.continuous_normUnits: N is continuous.
api: TauCeti.HilbertWeight.norm_tmul_one: N(1 ⊗ a) = N_{F/ℚ}(a).
api: TauCeti.HilbertWeight.normUnits_unitsToOp: N(1 ⊗ η) = N_{F/ℚ}(η) in ℤ_p for a global unit η.
tests: norm_rat: For F = ℚ, N is the identity.
tests: norm_neg_one: N(−1) = (−1)^{[F:ℚ]}.
tests: norm_not_trivial: For [F:ℚ] odd, N is not the trivial character (N(−1) = −1).
acceptance: F = ℚ: N is the identity of ℤ_p^×.
acceptance: N(−1) = (−1)^{[F:ℚ]}.
acceptance: N(1 ⊗ η) = 1 for a totally positive unit η of a totally real F (used by weight-comparison-totally-positive-units).

OverconvergentAutomorphicForms:O0/principal-units — Principal units 1 + p^r 𝒪_p
TauCeti.HilbertWeight.principalUnits: For r ≥ 0, H_r := {x ∈ 𝒪_p^× : x − 1 ∈ p^r 𝒪_p} is an open subgroup of finite index of 𝒪_p^×; for r ≥ 1 it is a pro-p group, so it meets the prime-to-p torsion of 𝒪_p^× trivially.
hypotheses: r ∈ ℕ; H_0 = 𝒪_p^×.
prerequisites: OverconvergentAutomorphicForms:O0/units-at-p
prerequisites: mathlib:Subgroup
prerequisites: mathlib:Ideal.span
prerequisites: mathlib:Subgroup.FiniteIndex
prerequisites: mathlib:IsModuleTopology
proofSteps: Closure under products and inverses: (1 + p^r a)(1 + p^r b) = 1 + p^r(a + b + p^r ab), and the inverse of a unit ≡ 1 mod p^r is ≡ 1 mod p^r.
proofSteps: Openness: p^r 𝒪_p is open in the module topology (a finite-index ℤ_p-submodule), and H_r is its translate intersected with the open units.
proofSteps: Finite index: 𝒪_p^×/H_r injects into (𝒪_p/p^r)^×, a finite group.
proofSteps: Pro-p for r ≥ 1: H_r/H_s is a p-group for s ≥ r, being filtered by the additive groups p^i 𝒪_p/p^{i+1} 𝒪_p.
api: TauCeti.HilbertWeight.isOpen_principalUnits: H_r is open.
api: TauCeti.HilbertWeight.finiteIndex_principalUnits: H_r has finite index.
api: TauCeti.HilbertWeight.principalUnits_antitone: r ≤ s implies H_s ≤ H_r.
tests: principalUnits_zero: H_0 = 𝒪_p^×.
tests: principalUnits_rat: F = ℚ, p odd: H_1 = 1 + pℤ_p has index p − 1.
tests: principalUnits_root_of_unity: A nontrivial (p−1)-st root of unity in ℤ_p^× is not in H_1.
acceptance: r = 0 gives all of 𝒪_p^×.
acceptance: F = ℚ, p odd, r = 1: H_1 = 1 + pℤ_p, of index p − 1; a nontrivial (p−1)-st root of unity is not in H_1.
acceptance: This is the subgroup over which the corrected |T_κ| is taken (source issue E2).

OverconvergentAutomorphicForms:O0/geometric-weight-characters — Geometric Hilbert weights
TauCeti.HilbertWeight.GeomWeight: For a topological commutative ring R, the R-points of the weight space 𝒲* for G* are the continuous characters T(ℤ_p) = 𝒪_p^× → R^×: GeomWeight F p R := ContinuousMonoidHom 𝒪_p^× R^×. BHW's 𝒲* = Spf(ℤ_p⟦T(ℤ_p)⟧)^an_η × L is the rigid space representing this functor on affinoid L-algebras; its construction and representability are requested from PadicMeasuresIwasawaAlgebras L0a.
hypotheses: R a topological commutative ring, R^× with the units topology.
hypotheses: No analyticity or algebraicity is assumed: an arbitrary continuous character is a weight, not an algebraic weight.
hypotheses: All representation-by-rigid-space assertions use the imported universal character functor; the Lean abbreviation itself gives points only.
prerequisites: OverconvergentAutomorphicForms:O0/units-at-p
prerequisites: mathlib:ContinuousMonoidHom
prerequisites: mathlib:IsTopologicalRing
prerequisites: PadicMeasuresIwasawaAlgebras:L0a
proofSteps: Definition: ContinuousMonoidHom (Op F p)ˣ Rˣ. It is a commutative group under pointwise multiplication, and post-composition with continuous ring maps R → R' makes it a functor.
api: TauCeti.HilbertWeight.GeomWeight.ext: Two geometric weights are equal iff their values on all units agree.
api: TauCeti.HilbertWeight.GeomWeight.pullback: Precomposition by a continuous monoid endomorphism of O_p^×.
api: TauCeti.HilbertWeight.GeomWeight.one_apply: The trivial weight evaluates to 1 on every unit.
tests: geomWeight_trivial: The trivial character is a weight.
tests: geomWeight_norm: x ↦ N(x) is a ℚ_p-valued weight.
tests: geomWeight_rat: For F = ℚ these are the continuous characters of ℤ_p^×.
acceptance: F = ℚ: GeomWeight ℚ p R is the set of continuous characters ℤ_p^× → R^×, BHW's weight space for GL_2/ℚ (Definition 3.1).
acceptance: Algebraic weights x ↦ N(x)^k (k ∈ ℤ) and x ↦ ∏_σ σ(x)^{k_σ} (after extending scalars to split F) are weights; a finite-order character of 𝒪_p^× is a weight that is not algebraic.
acceptance: Let R be the same abstract p-adic integer algebra with discrete topology. The identity homomorphism on its unit group from the usual p-adic topology is not continuous (the inverse image of {1} is not open), hence is not an R-valued weight.

OverconvergentAutomorphicForms:O0/arithmetic-weight-characters — Arithmetic Hilbert weights
TauCeti.HilbertWeight.ArithWeight: For a topological commutative ring R, the R-points of the weight space 𝒲 for G are the continuous characters of T(ℤ_p) × ℤ_p^×: ArithWeight F p R := ContinuousMonoidHom (𝒪_p^× × ℤ_p^×) R^×. Every such character is uniquely a pair (w, t) with w ∈ GeomWeight and t : ℤ_p^× → R^× continuous, via κ(x, y) = w(x)t(y).
hypotheses: R a topological commutative ring.
hypotheses: All representation-by-rigid-space assertions use the imported universal character functor; the Lean abbreviation itself gives points only.
prerequisites: OverconvergentAutomorphicForms:O0/units-at-p
prerequisites: OverconvergentAutomorphicForms:O0/geometric-weight-characters
prerequisites: mathlib:ContinuousMonoidHom
prerequisites: mathlib:ContinuousMonoidHom.fst
prerequisites: mathlib:ContinuousMonoidHom.snd
prerequisites: PadicMeasuresIwasawaAlgebras:L0a
proofSteps: Definition: ContinuousMonoidHom ((Op F p)ˣ × ℤ_[p]ˣ) Rˣ. ArithWeight.mk w t := (w ∘ fst)·(t ∘ snd) (ContinuousMonoidHom.fst, ContinuousMonoidHom.snd, pointwise product).
proofSteps: Bijectivity of (w, t) ↦ ArithWeight.mk w t: restrict κ to 𝒪_p^× × 1 and 1 × ℤ_p^×; a character of a product of groups is the product of its restrictions.
api: TauCeti.HilbertWeight.ArithWeight.mk: (w, t) ↦ the character (x, y) ↦ w(x)t(y).
api: TauCeti.HilbertWeight.ArithWeight.bijective_mk: Every arithmetic weight is uniquely of the form mk w t.
api: TauCeti.HilbertWeight.ArithWeight.mk_apply: (mk w t)(x, y) = w(x)·t(y).
tests: arithWeight_trivial: mk 1 1 = 1.
tests: arithWeight_rat: For F = ℚ these are pairs of characters of ℤ_p^×.
tests: arithWeight_mk_injective: mk w t = mk w' t' implies w = w' and t = t'.
acceptance: F = ℚ: pairs of characters of ℤ_p^×.
acceptance: (w, t) = (1, 1) gives the trivial weight.
acceptance: The decomposition is unique: ArithWeight.mk is injective.

OverconvergentAutomorphicForms:O0/weight-dual-group-map — The group map dual to the weight map
TauCeti.HilbertWeight.weightDualMap: ι : 𝒪_p^× → 𝒪_p^× × ℤ_p^×, x ↦ (x², N(x)^{-1}), a continuous group homomorphism. It is the map for which pulling back characters gives BHW's displayed formula κ = w²·(t^{-1} ∘ N); BHW print x ↦ (x², N(x)) (source issue E1).
hypotheses: The inversion on the second coordinate is deliberate: it is what the displayed formula and BHW (9.1) require.
prerequisites: OverconvergentAutomorphicForms:O0/units-at-p
prerequisites: OverconvergentAutomorphicForms:O0/norm-at-p
prerequisites: mathlib:ContinuousMonoidHom
proofSteps: ι is a homomorphism because 𝒪_p^× and ℤ_p^× are commutative: (xy)² = x²y² and N(xy)^{-1} = N(x)^{-1}N(y)^{-1}.
proofSteps: Continuity: squaring and inversion are continuous on the topological groups of units, and N is continuous (norm-at-p).
api: TauCeti.HilbertWeight.weightDualMap: x ↦ (x², N(x)^{-1}) as a continuous monoid hom.
api: TauCeti.HilbertWeight.weightDualMap_apply: ι(x) = (x², N(x)^{-1}).
api: TauCeti.HilbertWeight.weightDualMap_unitsToOp: For a totally positive global unit η of a totally real F, ι(η) = (η², 1).
tests: weightDualMap_rat: For F = ℚ, ι(x) = (x², x^{-1}).
tests: weightDualMap_one: ι(1) = (1, 1).
tests: weightDualMap_not_printed: ι ≠ (x ↦ (x², N(x))) whenever N is not 2-torsion on 𝒪_p^×, e.g. F = ℚ, p = 5.
acceptance: Pulling back (w, t) along ι gives w²·(t^{-1} ∘ N), not w²·(t ∘ N): with t trivial both agree, with w trivial they are inverse to each other.
acceptance: F = ℚ: ι(x) = (x², x^{-1}).

OverconvergentAutomorphicForms:O0/weight-comparison — The weight map ρ : 𝒲 → 𝒲*
TauCeti.HilbertWeight.weightMap: ρ_R : ArithWeight F p R → GeomWeight F p R, κ ↦ κ ∘ ι, natural in the coefficient ring R. It is the map on points of BHW's morphism ρ : 𝒲 → 𝒲*, through which every weight for G is regarded as a weight for G*.
hypotheses: R a topological commutative ring; naturality is for continuous ring maps R → R'.
prerequisites: OverconvergentAutomorphicForms:O0/arithmetic-weight-characters
prerequisites: OverconvergentAutomorphicForms:O0/geometric-weight-characters
prerequisites: OverconvergentAutomorphicForms:O0/weight-dual-group-map
prerequisites: mathlib:ContinuousMonoidHom.comp
prerequisites: PadicMeasuresIwasawaAlgebras:L0a
proofSteps: Definition by composition with weight-dual-group-map (ContinuousMonoidHom.comp).
proofSteps: Naturality: composition on the left and on the right commute.
api: TauCeti.HilbertWeight.weightMap: κ ↦ κ ∘ ι.
api: TauCeti.HilbertWeight.weightMap_mk_apply: ρ(w, t) = w²·(t^{-1} ∘ N) (weight-comparison-formula).
api: TauCeti.HilbertWeight.weightMap_mul: ρ(κκ') = ρ(κ)ρ(κ'): ρ is a group homomorphism.
tests: weightMap_t_one: ρ(w, 1) = w².
tests: weightMap_w_one: ρ(1, t) = t^{-1} ∘ N.
tests: weightMap_rat: For F = ℚ, ρ(w, t)(x) = w(x)²t(x)^{-1}.
acceptance: F = ℚ: ρ(w, t)(x) = w(x)²t(x)^{-1}.
acceptance: ρ is a group homomorphism for the pointwise group structures.
acceptance: The morphism of rigid spaces 𝒲 → 𝒲* is L0a's pullback in G applied to ι; its points are ρ_R.

OverconvergentAutomorphicForms:O0/weight-comparison-formula — The formula for ρ
TauCeti.HilbertWeight.weightMap_mk_apply: For w ∈ GeomWeight F p R, t : ℤ_p^× → R^× continuous and x ∈ 𝒪_p^×: ρ(ArithWeight.mk w t)(x) = w(x)²·t(N(x))^{-1}.
hypotheses: As in weight-comparison.
prerequisites: OverconvergentAutomorphicForms:O0/weight-comparison
prerequisites: OverconvergentAutomorphicForms:O0/arithmetic-weight-characters
prerequisites: OverconvergentAutomorphicForms:O0/weight-dual-group-map
proofSteps: Unfold: ρ(mk w t)(x) = (mk w t)(ι x) = w(x²)·t(N(x)^{-1}) = w(x)²·t(N(x))^{-1}, using that w and t are homomorphisms.
acceptance: This is BHW's displayed κ = w²·(t^{-1} ∘ N_{F/ℚ}).
acceptance: With the printed map x ↦ (x², N(x)) one would get w(x)²·t(N(x)) instead (E1).

OverconvergentAutomorphicForms:O0/weight-comparison-norm-factor — ρ(w, t)·w^{-2} factors through the norm
TauCeti.HilbertWeight.weightMap_mk_mul_inv_sq: For κ = ρ(mk w t) and x ∈ 𝒪_p^×: κ(x)·w(x)^{-2} = t(N(x))^{-1}. In particular κ·w^{-2} factors through N : 𝒪_p^× → ℤ_p^×.
hypotheses: As in weight-comparison.
prerequisites: OverconvergentAutomorphicForms:O0/weight-comparison-formula
proofSteps: Rearrange weight-comparison-formula.
acceptance: The factor left after removing w² is precisely t⁻¹∘N, with t a character of Z_p×.
acceptance: For w=N^a and t(y)=y^b, the geometric character is κ=N^(2a−b).


OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units — ρ on totally positive global units
TauCeti.HilbertWeight.weightMap_mk_totallyPositive: Let F be totally real and η ∈ 𝒪_F^× totally positive (σ(η) > 0 for every real embedding σ). For κ = ρ(mk w t): κ(η)^{-1}·w(η)² = t(N(η)) = 1, where η is viewed in 𝒪_p^× by η ↦ 1 ⊗ η.
hypotheses: F totally real; η totally positive; R any topological commutative ring.
prerequisites: OverconvergentAutomorphicForms:O0/weight-comparison-norm-factor
prerequisites: OverconvergentAutomorphicForms:O0/norm-at-p
prerequisites: mathlib:NumberField.IsTotallyReal
prerequisites: mathlib:NumberField.isUnit_iff_norm
prerequisites: mathlib:Algebra.norm_eq_prod_embeddings
proofSteps: By weight-comparison-norm-factor, κ(η)^{-1}w(η)² = t(N(1 ⊗ η)).
proofSteps: N(1 ⊗ η) = N_{F/ℚ}(η) (norm-at-p) = ±1 since η is a unit (NumberField.isUnit_iff_norm), and N_{F/ℚ}(η) = ∏_σ σ(η) > 0 (Algebra.norm_eq_prod_embeddings, all embeddings real), so N_{F/ℚ}(η) = 1 and t(1) = 1.
acceptance: This is BHW (9.1), which makes the conditions (3) and (4) of §9 independent of representatives.
acceptance: Total positivity is needed: for η = −1 and [F:ℚ] odd, t(N(η)) = t(−1), which can be −1.

OverconvergentAutomorphicForms:O0/weight-radius-parameter — The radius parameter |T_κ|
TauCeti.HilbertWeight.radiusParameter: For a normed commutative ring A and κ∈GeomWeight F p A, set T_pro(κ)=sup_{x∈H_r0}‖κ(x)−1‖, r0=1 for odd p and 3 for p=2. This replaces BHW’s all-unit supremum for the boundedness diagnostic (E2). It is not asserted to equal every universal coordinate used in the AIP annuli, and does not validate the printed analytic-radius formula (E3).
hypotheses: A a normed commutative ring; κ continuous.
prerequisites: OverconvergentAutomorphicForms:O0/principal-units
prerequisites: OverconvergentAutomorphicForms:O0/geometric-weight-characters
proofSteps: Definition as an indexed supremum (iSup) over the subgroup principal-units H_{r₀}.
api: TauCeti.HilbertWeight.radiusParameter_one: |T_1| = 0.
api: TauCeti.HilbertWeight.radiusParameter_lt_one: Continuous characters into uniform Banach ℚ_p-algebras have |T_κ| < 1 (continuous-character-bounded).
api: TauCeti.HilbertWeight.radiusParameter_nonneg: 0 ≤ |T_κ|.
tests: radius_trivial: |T_1| = 0.
tests: radius_teichmuller: F = ℚ, p odd: |T_ω| = 0 for the Teichmüller character.
tests: radius_power: For F=Q, p odd and k∈N, T_pro(x↦x^k)=|pk|_p, including k=0.
acceptance: The trivial character has |T_κ| = 0.
acceptance: F = ℚ, p odd, κ = the Teichmüller character ω: |T_ω| = 0 (ω is trivial on 1 + pℤ_p), whereas BHW's printed supremum over ℤ_p^× gives 1.
acceptance: F = ℚ, p odd, κ(x) = x^k: |T_κ| = |pk|_p.

OverconvergentAutomorphicForms:O0/continuous-character-bounded — Continuous characters into uniform Banach algebras are bounded
TauCeti.HilbertWeight.radiusParameter_lt_one: Let A be a complete normed ℚ_p-algebra whose norm is ultrametric and power-multiplicative (a uniform Banach algebra, such as an affinoid algebra with its spectral norm). Then every κ ∈ GeomWeight F p A has |T_κ| < 1.
hypotheses: A complete, ultrametric, ‖1‖ = 1, ‖·‖ power-multiplicative; κ continuous.
prerequisites: OverconvergentAutomorphicForms:O0/weight-radius-parameter
prerequisites: OverconvergentAutomorphicForms:O0/principal-units
prerequisites: OverconvergentAutomorphicForms:O0/units-at-p
prerequisites: mathlib:IsModuleTopology
proofSteps: For x ∈ H_{r₀}, x^{p^n} → 1, so κ(x)^{p^n} → 1 by continuity.
proofSteps: If y = κ(x) − 1 had ‖y‖ ≥ 1, expand (1 + y)^{p^n} − 1 = y^{p^n} + Σ_{0<j<p^n} C(p^n, j) y^j. The first term has norm ‖y‖^{p^n} (power-multiplicativity), and each other term has norm ≤ |p|·‖y‖^j ≤ |p|·‖y‖^{p^n} < ‖y‖^{p^n}, since p divides C(p^n, j) and ‖y‖ ≥ 1. The norm is ultrametric, so ‖(1 + y)^{p^n} − 1‖ = ‖y‖^{p^n} ≥ 1 for all n, contradicting κ(x)^{p^n} → 1. Hence ‖κ(x) − 1‖ < 1.
proofSteps: x ↦ ‖κ(x) − 1‖ is continuous on the compact group H_{r₀} (open in the compact 𝒪_p^×), so its supremum is attained and is < 1.
acceptance: This is the coefficient-level form of 'an affinoid image is bounded'; unboundedness only occurs for non-affinoid families U, which need L0a's rigid spaces.
acceptance: Power-multiplicativity is needed: for a non-uniform norm the binomial estimate fails.
acceptance: The ultrametric hypothesis is needed for the domination step; archimedean normed algebras are excluded.

OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights — Analytic continuation of bounded weights
TauCeti.Overconvergent.analytic_continuation_of_bounded_weights: For a bounded smooth family κ:U→W*, there exists a common positive radius r<1 and a unique analytic multiplicative extension of its character to B_r(O_p^×:1)×U, agreeing with κ on O_p^××U. The extension respects multiplication wherever defined. This is an existence theorem; r=|p|^r0 |Tκ| is not asserted (E3).
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Boundedness is affinoid-image boundedness. The corrected pro-p supremum is a useful diagnostic, not the universal-coordinate annulus of AIP Proposition 2.8.
prerequisites: OverconvergentAutomorphicForms:O0/geometric-weight-characters
prerequisites: OverconvergentAutomorphicForms:O0/weight-radius-parameter
prerequisites: OverconvergentAutomorphicForms:O0/continuous-character-bounded
prerequisites: PadicMeasuresIwasawaAlgebras:L0a
prerequisites: LocallyAnalyticDistributions:L0
proofSteps: Pull the family back from one affinoid of the universal compact-torus character space (PadicMeasuresIwasawaAlgebras:L0a).
proofSteps: Apply AIP ADIC Proposition 2.8 on finitely many universal-coordinate annuli/charts; use their smallest positive analytic neighbourhood. LocallyAnalyticDistributions:L0 supplies the multivariable analytic-character theorem and its normed function spaces.
proofSteps: Glue by uniqueness: a convergent analytic function vanishing on a product of small Z_p lattices is zero, by the one-variable identity theorem successively in the coordinates. Agreement at a single point of each ball would not suffice.
proofSteps: Multiplicativity follows by the same identity argument on the product neighbourhood, then descends over U by pulling back the universal construction.
acceptance: A finite conductor character extends on sufficiently small residue balls.
acceptance: For p=3, κ(4)=ζ_9 cannot extend to the printed ball of radius 3^(−7/6), by E3.
acceptance: The trivial character extends to every admitted neighbourhood; no formula forcing r=0 is imposed.

OverconvergentAutomorphicForms:O0/bounded-weight-families — Bounded weight families
TauCeti.Overconvergent.bounded_weight_families: A bounded geometric (respectively arithmetic) family on U is a morphism to the imported W* (respectively W) factoring through an affinoid subspace, with the pulled-back universal character on O_p^××U (respectively (O_p^××Z_p^×)×U). Smoothness of the family means smoothness of U; it does not mean the weight morphism is smooth.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
prerequisites: PadicMeasuresIwasawaAlgebras:L0a
prerequisites: OverconvergentAutomorphicForms:O0/geometric-weight-characters
prerequisites: OverconvergentAutomorphicForms:O0/arithmetic-weight-characters
proofSteps: Use the universal character of L0a and pull it back; retain the chosen affinoid chart to select a common analytic neighbourhood.
proofSteps: Restriction to opens and morphisms of bases is functorial. On overlaps the same universal character gives the canonical identification.
api: TauCeti.Overconvergent.bounded_weight_families.character: Evaluate the pulled-back universal character.
api: TauCeti.Overconvergent.bounded_weight_families.pullback: Pull back along U′→U, preserving boundedness and the character.
api: TauCeti.Overconvergent.bounded_weight_families.ext: A family is determined by its weight morphism; choices of affinoid factorisation give the same character.
tests: TauCeti.Overconvergent.Test.O0_bounded_weight_families_point: U=Spa(L) gives the specified single continuous character.
tests: TauCeti.Overconvergent.Test.O0_bounded_weight_families_constant: A constant family has κ(x,u)=κ(x) on every fibre.
tests: TauCeti.Overconvergent.Test.O0_bounded_weight_families_image: An unbounded identity map on the entire nonquasicompact weight space has no single affinoid factorisation.
acceptance: A bounded geometric (respectively arithmetic) family on U is a morphism to the imported W* (respectively W) factoring through an affinoid subspace, with the pulled-back universal character on O_p^××U (respectively (O_p^××Z_p^×)×U). Smoothness of the family means smoothness of U; it does not mean the weight morphism is smooth.

OverconvergentAutomorphicForms:O0/finite-analytic-coefficients — Finite analytic coefficient representations
TauCeti.Overconvergent.finite_analytic_coefficients: For a compact open H of a p-adic Levi M and affinoid A, a finite analytic coefficient representation is a finite projective A-module V with its canonical Banach topology and continuous A-linear H-action whose orbit maps are analytic on specified Lie charts H_n. A stable A+-lattice V+ is additional data. The representation includes scalar characters but is not required to have rank one.
hypotheses: M is a reductive p-adic group with the analytic charts supplied by LocallyAnalyticDistributions:L0.
hypotheses: A is a complete uniform affinoid Q_p-algebra; analytic extension to H_n is specified, not inferred from continuity.
prerequisites: mathlib:Representation
prerequisites: LocallyAnalyticDistributions:L0
prerequisites: AdicSpacesPartII:R0/completed-tensor-banach-module
proofSteps: Use baseline Representation for the algebraic action and imported analytic orbit maps for the chart condition.
proofSteps: Use finite-projective Banach topology from AdicSpacesPartII:R0/completed-tensor-banach-module; record rather than manufacture a stable lattice.
api: TauCeti.Overconvergent.finite_analytic_coefficients.action: ρ(h):V≃ₗ[A]V, with analytic orbit maps on H_n.
api: TauCeti.Overconvergent.finite_analytic_coefficients.changeScalars: Finite projective completed base change to an affinoid B, preserving the pulled-back analytic action.
api: TauCeti.Overconvergent.finite_analytic_coefficients.tensor: Tensor coefficients on V⊗_A W with diagonal action.
api: TauCeti.Overconvergent.finite_analytic_coefficients.dual: Contragredient on Hom_A(V,A), action f↦f∘ρ(h⁻¹).
api: TauCeti.Overconvergent.finite_analytic_coefficients.algebraic: Restrict an algebraic Levi representation to H_n and extend scalars to A.
tests: TauCeti.Overconvergent.Test.O0_finite_analytic_coefficients_scalar: A rank-one character acts by multiplication by κ(h).
tests: TauCeti.Overconvergent.Test.O0_finite_analytic_coefficients_rankTwo: On A² a diagonal torus acts by diag(χ1(h),χ2(h)), retaining both distinct characters.
tests: TauCeti.Overconvergent.Test.O0_finite_analytic_coefficients_dualSign: The dual of a scalar character κ is κ⁻¹, not κ.
tests: TauCeti.Overconvergent.Test.O0_finite_analytic_coefficients_continuous: A continuous character with conductor greater than the chosen chart level is not analytic on that chart.
acceptance: For a compact open H of a p-adic Levi M and affinoid A, a finite analytic coefficient representation is a finite projective A-module V with its canonical Banach topology and continuous A-linear H-action whose orbit maps are analytic on specified Lie charts H_n. A stable A+-lattice V+ is additional data. The representation includes scalar characters but is not required to have rank one.

OverconvergentAutomorphicForms:O0/coefficient-tensor-dual — Tensor and dual coefficient laws
TauCeti.Overconvergent.coefficient_tensor_dual: Finite analytic coefficients are closed under tensor products and contragredient duals on a common analytic chart; (V⊗W)∨≅V∨⊗W∨ for finite projective coefficients, and these identifications commute with affinoid base change. The dual of a general induced Banach module is its continuous dual; no finite-projective claim is made for it.
hypotheses: Use finite projective modules for the algebraic dual/tensor isomorphism.
hypotheses: For induced coefficients use the normed continuous dual, and retain its strong topology; general affinoid coefficients need not give orthonormalisable duals.
prerequisites: OverconvergentAutomorphicForms:O0/finite-analytic-coefficients
prerequisites: mathlib:Representation.tprod
prerequisites: mathlib:Representation.dual
prerequisites: AdicSpacesPartII:R0/completed-tensor-banach-module
proofSteps: Apply baseline Representation.tprod and Representation.dual. In a finite projective local splitting the analytic orbit maps are matrix products and inverse-transposes.
proofSteps: Descend the dual/tensor identification from finite free modules through idempotents; finite-projective completed tensor agrees with ordinary tensor by the imported R0 theorem.
acceptance: For two scalar coefficients the tensor weight is κλ and the dual weight κ⁻¹.
acceptance: The multiplication map on induced functions is not declared an isomorphism Ind(κ)⊗Ind(λ)≅Ind(κλ).

OverconvergentAutomorphicForms:O0/analytic-induced-coefficients — Analytic induced coefficients
TauCeti.Overconvergent.analytic_induced_coefficients: For an n-analytic torus character κ_A and a chosen closed subgroup M_1 with Iwahori decomposition, define Vκ^{n-an} as analytic functions f on the actual adic neighbourhood M_1 M_n with f(mb)=(w0,M κ_A)(b⁻¹)f(m), for b in the upper Borel neighbourhood. Left action is (h·f)(m)=f(h⁻¹m). The locally analytic induction is colim_n Vκ^{n-an} with its LB topology; the continuous strong dual is the distribution coefficient module. At fixed n the strong dual (Vκ^{n-an})∨ need not be projective over A: BP instead defines projective Dκ^{n-an} as the compact-open continuous dual of bounded analytic functions on the open polydisc M_1 M_n°; Dκ^{lan}=lim_n Dκ^{n-an} is the dual of the locally analytic induction.
hypotheses: Use BP §6.2’s Levi, Borel, longest Weyl element and actual analytic subgroup conventions. M_1 is closed with M_1=N̄_1 T_1 N_1, T_1=T(Z_p), and T^{M,−} normalizes N̄_1. M_1 is not required open or Zariski dense. κ_A is a character of w0,M⁻¹T(Z_p)w0,M, n-analytic after the Weyl conjugation.
hypotheses: Functions are analytic on the adic thickening M_1 M_n, not merely set functions on M_1. A is uniform finite-type Tate over the coefficient field.
prerequisites: LocallyAnalyticDistributions:L0
prerequisites: OverconvergentAutomorphicForms:O0/bounded-weight-families
prerequisites: AdicSpacesPartII:R0/completed-tensor-banach-module
proofSteps: Import multivariable analytic function Banach modules from LAD L0; cut out right Borel equivariance as a closed submodule.
proofSteps: Iwahori factorisation identifies it with analytic functions on the opposite-unipotent neighbourhood, producing its Banach norm.
proofSteps: Left inverse translation preserves the relation. The transition maps are restriction to smaller neighbourhoods; use their specified colimit and strong-dual topologies.
proofSteps: For distributions retain §6.2.20’s bounded open-polydisc function space and compact-open dual topology. Do not identify its projective Dκ^{n-an} with the ordinary strong Banach dual over a general affinoid A.
api: TauCeti.Overconvergent.analytic_induced_coefficients.equivariance: f(mb)=(w0,M κ_A)(b⁻¹)f(m).
api: TauCeti.Overconvergent.analytic_induced_coefficients.leftAction: h·f is f(h⁻¹m), with (h1h2)·f=h1·(h2·f).
api: TauCeti.Overconvergent.analytic_induced_coefficients.unipotentChart: Restriction to the opposite-unipotent chart gives the analytic Banach function module.
api: TauCeti.Overconvergent.analytic_induced_coefficients.restrictRadius: Restriction Vκ^{n-an}→Vκ^{(n+1)-an} and its composition law.
api: TauCeti.Overconvergent.analytic_induced_coefficients.continuousDual: Continuous A-linear dual with the strong topology; the induced action is contragredient.
api: TauCeti.Overconvergent.analytic_induced_coefficients.distributions: Dκ^{n-an} is the compact-open continuous A-dual of bounded analytic functions on M_1 M_n°; Dκ^{lan}=lim_n Dκ^{n-an}, with the specified right (M_1,T^{M,+}) action and contragredient left (M_1,T^{M,−}) action.
tests: TauCeti.Overconvergent.Test.O0_analytic_induced_coefficients_torus: For M=T there is no unipotent coordinate and induction is the rank-one coefficient character with the prescribed Weyl/inverse convention.
tests: TauCeti.Overconvergent.Test.O0_analytic_induced_coefficients_sl2: For SL2 and dominant k≥0, z^(k+1) is an analytic function on the opposite-unipotent ball and is not in the embedded algebraic polynomial subspace of degree≤k.
tests: TauCeti.Overconvergent.Test.O0_analytic_induced_coefficients_actionOrder: ((h1h2)·f)(m)=f(h2⁻¹h1⁻¹m).
tests: TauCeti.Overconvergent.Test.O0_analytic_induced_coefficients_tensor: For SL2 and κ=λ=1, multiplication of induced functions kills 1⊗z−z⊗1, a nonzero tensor detected by evaluation at two distinct points of the unipotent ball; it is not a tensor-product isomorphism.
acceptance: For a torus M=T there is no unipotent variable and induction is the rank-one coefficient with the Weyl/inverse convention.
acceptance: For SL2 and k≥0 the polynomial subspace of degree≤k is proper: z^(k+1) is analytic but outside it.
acceptance: If M_1 is not Zariski dense, functions on its adic neighbourhood cannot be replaced by functions on its rational points.
acceptance: Fixed-radius projective distributions use the bounded open-polydisc dual, not an unsupported projectivity assertion for the ordinary Banach dual.

OverconvergentAutomorphicForms:O0/algebraic-induced-comparison — Algebraic specialisation of analytic induction
TauCeti.Overconvergent.algebraic_induced_comparison: For dominant algebraic κ, restriction of regular induced functions embeds Vκ into Vκ^{n-an} and is M_1-equivariant. For t∈T^{M,+}, ι(tv)=(w0,M κ)(t)·tι(v). A finite-order character w0,M χ:M_1→F× trivial on M_1∩M_n extends trivially across M_n and restricts to the Weyl-conjugate torus character χ. Multiplication by (w0,M χ)⁻¹ gives Vκ_A^{n-an}⊗_F F(w0,M χ)≅Vκ_Aχ^{n-an} as (M_1,T^{M,+}) modules, where the finite-character factor has trivial positive-monoid action. Algebraic restriction induces a map on continuous duals; no blanket surjectivity over A is asserted.
hypotheses: BP algebraic induced model uses f(mb)=(w0,M κ)(b⁻¹)f(m).
hypotheses: Do not remove the positive-monoid scalar, or conclude that an algebraic weight makes analytic induction finite rank.
hypotheses: The finite-order character is defined on M_1, not only its torus, is trivial on M_1∩M_n, and has the explicitly trivial T^{M,+} action from BP §6.2.9.
prerequisites: OverconvergentAutomorphicForms:O0/analytic-induced-coefficients
prerequisites: OverconvergentAutomorphicForms:O0/finite-analytic-coefficients
prerequisites: AutomorphicBundles:B4
proofSteps: Restrict regular functions to the analytic chart. Density of the unipotent chart and algebraic coordinates gives injectivity.
proofSteps: Compute the actions as in BP §6.2.11 (a subsection, not a lemma); positive-monoid normalization gives ι(tv)=(w0,M κ)(t)tι(v).
proofSteps: Apply Lemma 6.2.10 with its M_1-character and conductor hypotheses, multiplying by (w0,M χ)⁻¹. Proposition 6.3.6 provides the sheaf maps with its 2ρ_nc dual twist; it does not supply a general Hahn–Banach or surjectivity theorem over A.
acceptance: In SL2 the finite-dimensional polynomial subspace is proper in the analytic functions.
acceptance: Scalar inverse/positive conventions must be converted explicitly before applying this to O8’s transpose convention.

OverconvergentAutomorphicForms:O0/unitary-completed-coefficients — Definite unitary completed coefficients
TauCeti.Overconvergent.unitary_completed_coefficients: Ŝξ,τ(U^℘,O_E)=lim_k colim_{U℘} Sξ,τ(U℘U^℘,O_E/ϖ_E^k), where f(gu)=u⁻¹f(g) in the finite automorphic function spaces. After tensoring E, Π is an admissible unitary Banach GL_n(K)-representation commuting with the tame Hecke algebra. On some compact open H its restriction is C(H,E)^s, s≥1.
hypotheses: F/F+ is CM, G/F+ is a definite unitary group with G×F+F≅GL_n, n≥2, and every p-adic place of F+ splits in F.
hypotheses: Fix ℘|p, K=F+_℘=F_℘̃, E large enough, dominant ξ_v and inertial τ_v at every other v|p with stable O_E-lattices Wξ,τ.
hypotheses: U^℘ is sufficiently small; its other p-components are GL_n(O_{F+_v}); levels at inert finite places are hyperspecial. The nonzero local regular representation hypothesis Π|H≅C(H,E)^s has s≥1.
prerequisites: CompletedCohomologyPartII:CC.8
prerequisites: OverconvergentAutomorphicForms:O0/finite-analytic-coefficients
proofSteps: Import the completed topological coefficient tower and its actions from CompletedCohomologyPartII:CC.8. Admissibility and the local regular model require the separate Jacquet–Emerton/definite-unitary input recorded in the owner gap.
proofSteps: The finite double-coset description at sufficiently small level gives locally regular translation actions. The local regular model with positive multiplicity is a separate requested theorem; do not infer it from arbitrary admissibility.
api: TauCeti.Overconvergent.unitary_completed_coefficients.modPower: Projection to the k-th p-adic quotient, retaining the colimit over level.
api: TauCeti.Overconvergent.unitary_completed_coefficients.groupAction: Continuous GL_n(K)-action by translations, commuting with tame Hecke.
api: TauCeti.Overconvergent.unitary_completed_coefficients.localRegular: For the supplied H, Π|H≅C(H,E)^s with s≥1.
tests: TauCeti.Overconvergent.Test.O0_unitary_completed_coefficients_order: For the local translation model H=Z_p, lim_m colim_i Map(Z/p^i,Z/p^m)=C(Z_p,Z_p). The function x↦x belongs to this completion but is not in colim_i Map(Z/p^i,Z_p), since it is not locally constant; interchanging the limits loses it.
tests: TauCeti.Overconvergent.Test.O0_unitary_completed_coefficients_coefficients: At a finite level with coefficient W=E² and u acting by diag(a,b), the two coordinates obey f(gu)=(a⁻¹ f1(g),b⁻¹ f2(g)); replacing u⁻¹ by u gives a different coefficient condition when a² or b² is not 1.
tests: TauCeti.Overconvergent.Test.O0_unitary_completed_coefficients_multiplicity: For Π=0 the Jacquet module is zero and its coherent support/eigenvariety is empty, so the nd_K-dimensional nonzero eigenvariety conclusion requires the local regular multiplicity s≥1.
acceptance: Ŝξ,τ(U^℘,O_E)=lim_k colim_{U℘} Sξ,τ(U℘U^℘,O_E/ϖ_E^k), where f(gu)=u⁻¹f(g) in the finite automorphic function spaces. After tensoring E, Π is an admissible unitary Banach GL_n(K)-representation commuting with the tame Hecke algebra. On some compact open H its restriction is C(H,E)^s, s≥1.

OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety — Unitary Jacquet eigenvariety coefficients
TauCeti.Overconvergent.unitary_jacquet_eigenvariety: For the supplied Π, import Emerton’s locally Q_p-analytic vectors and J_B. Its strong dual defines the coherent eigenvariety sheaf M(U^℘) on E(U^℘)→T̂, where T̂ parametrizes continuous characters of T(K), including its n unramified coordinates. (δ,ω) is an E-point iff Hom_{T(K)}(δ,J_B(Π_Qp-an[mω]))≠0. Classical points use Π_lalg in this criterion.
hypotheses: F/F+ is CM, G/F+ is a definite unitary group with G×F+F≅GL_n, n≥2, and every p-adic place of F+ splits in F.
hypotheses: Fix ℘|p, K=F+_℘=F_℘̃, E large enough, dominant ξ_v and inertial τ_v at every other v|p with stable O_E-lattices Wξ,τ.
hypotheses: U^℘ is sufficiently small; its other p-components are GL_n(O_{F+_v}); levels at inert finite places are hyperspecial. The nonzero local regular representation hypothesis Π|H≅C(H,E)^s has s≥1.
prerequisites: OverconvergentAutomorphicForms:O0/unitary-completed-coefficients
prerequisites: PadicMeasuresIwasawaAlgebras:L0a
proofSteps: Use the Jacquet–Emerton eigenvariety package requested as a Part II of PadicFamilies, rather than the compact Up package of L2a.
proofSteps: Split T(K)=T(O_K)×Z^n after choosing uniformizers; compact character coordinates come from PMIA L0a, while unramified coordinates are G_m^n. Choice changes coordinates, not the character functor.
proofSteps: The eigenvariety sheaf is the sheaf attached to the Jacquet strong dual, not an arbitrary coherent sheaf declared equal to it.
acceptance: dim T̂=n([K:Q_p]+1), whereas the eigenvariety dimension below is n[K:Q_p].
acceptance: For n=2,K=Q_p the two dimensions are 4 and 2; do not count unramified coordinates as weight dimensions.

OverconvergentAutomorphicForms:O0/unitary-eigenvariety-geometry — Unitary eigenvariety dimension and depth
TauCeti.Overconvergent.unitary_eigenvariety_geometry: Under DH and the imported Jacquet–Emerton construction, E(U^℘) is equidimensional of dimension n d_K, d_K=[K:Q_p], and its specified coherent sheaf M(U^℘) is Cohen–Macaulay over E(U^℘).
hypotheses: All three DH hypotheses apply; the local model has s≥1.
hypotheses: These are the jointly proved parts (1)–(2) of Ding Proposition 4.14, not a generic property of supports of admissible representations.
prerequisites: OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety
prerequisites: OverconvergentAutomorphicForms:O0/unitary-completed-coefficients
proofSteps: Apply the local regular model from unitary-completed-coefficients.
proofSteps: Invoke the precise dimension/depth theorem of the Jacquet–Emerton package (Ding proof references BHS Lemma 3.10, Proposition 3.11, Corollary 3.12 and its §5.2). This is recorded as an owner gap, not silently re-proved here.
acceptance: For n=2,K=Q_p the dimension is 2, not 4.
acceptance: Cohen–Macaulayness concerns the actual Jacquet coefficient sheaf, not every coherent sheaf.

OverconvergentAutomorphicForms:O0/unitary-eigenvariety-reduced — Reducedness of the unitary eigenvariety
TauCeti.Overconvergent.unitary_eigenvariety_reduced: The same E(U^℘) is reduced, under the definite-unitary hypotheses and the classical-density theorem in the supplied Jacquet–Emerton package.
hypotheses: F/F+ is CM, G/F+ is a definite unitary group with G×F+F≅GL_n, n≥2, and every p-adic place of F+ splits in F.
hypotheses: Fix ℘|p, K=F+_℘=F_℘̃, E large enough, dominant ξ_v and inertial τ_v at every other v|p with stable O_E-lattices Wξ,τ.
hypotheses: U^℘ is sufficiently small; its other p-components are GL_n(O_{F+_v}); levels at inert finite places are hyperspecial. The nonzero local regular representation hypothesis Π|H≅C(H,E)^s has s≥1.
prerequisites: OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety
prerequisites: OverconvergentAutomorphicForms:O0/unitary-eigenvariety-geometry
proofSteps: Use the Jacquet formalism’s density of suitable classical points and the generic regularity argument cited by Ding Proposition 4.14(3).
proofSteps: Record that this source-proof leaf is requested from the proposed PadicFamilies Part II; reducedness does not follow just from equidimensionality or a Cohen–Macaulay sheaf.
acceptance: The ring E[ε]/(ε²) is Cohen–Macaulay and equidimensional but not reduced; this rules out deriving (3) from (1)–(2) alone.

OverconvergentAutomorphicForms:O1/right-automorphy-cocycle — Right automorphy cocycles
TauCeti.Overconvergent.RightCocycle: Let X have a right Γ-action and C be a coefficient group. A right automorphy cocycle is J:Γ×X→C with J(1,x)=1 and J(γδ,x)=J(γ,x)J(δ,xγ). For a left representation ρ:C→Aut_A(V), equivariant functions satisfy f(xγ)=ρ(J(γ,x)⁻¹)f(x). In analytic geometry J is an analytic map on the actual cover and coefficient neighbourhood.
hypotheses: Γ acts on the right. For a left action and left cocycle K with K(γδ,x)=K(γ,δx)K(δ,x), use x·γ=γ⁻¹x and J(γ,x)=K(γ⁻¹,x)⁻¹. Then left equivariance f(γx)=ρ(K(γ,x))f(x) becomes the stated right inverse-equivariance. Both the inverse group element and inverse coefficient are required in the noncommutative conversion.
hypotheses: C and ρ need not commute. Analyticity and stable-lattice preservation are genuine imported conditions, not implicit in a set-theoretic cocycle.
prerequisites: mathlib:Representation
prerequisites: AutomorphicBundles:B0/sections-equivariant
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Bundle the algebraic cocycle laws; use Representation for ρ.
proofSteps: Check consistency: successive inverse coefficient actions are ρ(Jδ(xγ)⁻¹)ρ(Jγ(x)⁻¹)=ρ((Jγ(x)Jδ(xγ))⁻¹).
proofSteps: Analytic versions import the site and coefficient neighbourhood, using AutomorphicBundles B0’s associated-bundle conventions after converting left/right actions.
proofSteps: Convert the BHW left action explicitly: its scalar coefficient multiplier is Kγ(x)=κ(jγ(x))⁻¹, so the corresponding right scalar cocycle is Jγ(x)=κ(jγ⁻¹(x)). The cz+d function itself has the left cocycle law of O2.
api: TauCeti.Overconvergent.right_automorphy_cocycle.apply_one: J(1,x)=1.
api: TauCeti.Overconvergent.right_automorphy_cocycle.apply_mul: J(γδ,x)=J(γ,x)J(δ,xγ).
api: TauCeti.Overconvergent.right_automorphy_cocycle.equivariant: The algebraic equivariant functions form an A-submodule of X→V; analytic functions are used only with the supplied analytic carrier.
api: TauCeti.Overconvergent.right_automorphy_cocycle.gauge: For b:X→C construct J′γ(x)=b(x)⁻¹Jγ(x)b(xγ).
api: TauCeti.Overconvergent.right_automorphy_cocycle.ext: Two right cocycles agree if their values agree for every γ and x.
api: TauCeti.Overconvergent.right_automorphy_cocycle.trivial: The constant unit map is the trivial right cocycle.
api: TauCeti.Overconvergent.right_automorphy_cocycle.mem_equivariant: f belongs to the equivariant submodule iff ∀γ,x, f(xγ)=ρ(Jγ(x)⁻¹)f(x).
api: TauCeti.Overconvergent.right_automorphy_cocycle.gauge_equivariant: The map f′(x)=ρ(b(x)⁻¹)f(x) sends J-equivariant functions to gauge(J,b)-equivariant functions.
api: TauCeti.Overconvergent.right_automorphy_cocycle.gaugeEquiv: Pointwise ρ(b(x)⁻¹) defines an A-linear equivalence between the J and gauge(J,b) equivariant submodules, with inverse pointwise ρ(b(x)).
api: TauCeti.Overconvergent.right_automorphy_cocycle.ofLeft: Given compatible left/right actions x·γ=γ⁻¹x and a left cocycle K, construct the right cocycle Jγ(x)=Kγ⁻¹(x)⁻¹.
api: TauCeti.Overconvergent.right_automorphy_cocycle.gaugeEquiv_apply: The forward gauge equivalence evaluates at x as ρ(b(x)⁻¹)f(x).
api: TauCeti.Overconvergent.right_automorphy_cocycle.gaugeEquiv_symm_apply: The inverse gauge equivalence evaluates at x as ρ(b(x))f(x).
tests: TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_trivial: J=1 gives invariant functions.
tests: TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_scalarSign: For X=Γ=Z with translation, constant J(n,x)=u^n gives f(x+n)=u^(−n)f(x).
tests: TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_matrixOrder: For A⁻¹=[[1,−1],[0,1]] and B⁻¹=[[1,0],[−1,1]] over Q, B⁻¹A⁻¹=[[1,−1],[−1,2]] differs from A⁻¹B⁻¹=[[2,−1],[−1,1]].
tests: TauCeti.Overconvergent.Test.O1_right_automorphy_cocycle_gaugeIdentity: Gauge by b(x)=1 gives the original right cocycle and the identity equivalence on equivariant functions.
acceptance: Trivial J gives invariant functions.
acceptance: For left K the conversion Jγ(x)=Kγ⁻¹(x)⁻¹ obeys the right law in the given order even when C is noncommutative.
acceptance: For inverse unipotent matrices A⁻¹=[[1,−1],[0,1]], B⁻¹=[[1,0],[−1,1]], the successive coefficient action is B⁻¹A⁻¹≠A⁻¹B⁻¹.

OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf — Equivariant coefficient sheaves
TauCeti.Overconvergent.equivariant_coefficient_sheaf: For an actual right Γ-torsor q:Y→X on the supplied analytic/v-site, an analytic cocycle J and coefficient module V on U, define E_J as the sheaf whose sections over W→X are analytic V-valued functions on Y_W×U satisfying f(yγ)=ρ(Jγ(y)⁻¹)f(y). Rational and integral versions use O and O+ respectively, with a specified stable lattice in the latter.
hypotheses: The cover is the supplied torsor and its descent datum, not an unspecified map.
hypotheses: V is finite analytic or the supplied Banach induced coefficient module; exactness or local freeness is not assumed for arbitrary infinite-rank coefficients.
prerequisites: OverconvergentAutomorphicForms:O1/right-automorphy-cocycle
prerequisites: OverconvergentAutomorphicForms:O0/finite-analytic-coefficients
prerequisites: OverconvergentAutomorphicForms:O0/analytic-induced-coefficients
prerequisites: mathlib:SheafOfModules
prerequisites: AutomorphicBundles:B0/sections-equivariant
prerequisites: PerfectoidSpaces:P9
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Use the equalizer of the two action maps on q_* of analytic coefficient functions; equalizers preserve the sheaf condition.
proofSteps: The right cocycle gives a descent datum on Y×_X Y and its triple-overlap identity.
proofSteps: For finite coefficients invoke the imported associated-bundle framework; effectivity on v/profinite covers is the separate theorem below.
api: TauCeti.Overconvergent.equivariant_coefficient_sheaf.sections: Sections are exactly the displayed equivariant analytic functions.
api: TauCeti.Overconvergent.equivariant_coefficient_sheaf.pullback: Base change of torsor, cocycle and coefficients induces sheaf pullback.
api: TauCeti.Overconvergent.equivariant_coefficient_sheaf.coefficientMap: An intertwiner of representations induces a sheaf map.
api: TauCeti.Overconvergent.equivariant_coefficient_sheaf.tensorMap: Pointwise tensor gives E_J(V)⊗E_J(W)→E_J(V⊗W); it is an isomorphism for effective finite locally free descent.
api: TauCeti.Overconvergent.equivariant_coefficient_sheaf.integralInclusion: A stable V+ gives E_J+→E_J, not automatically equality after inverting p.
tests: TauCeti.Overconvergent.Test.O1_equivariant_coefficient_sheaf_identityCover: For the identity torsor and trivial group, E_J is the original analytic coefficient sheaf.
tests: TauCeti.Overconvergent.Test.O1_equivariant_coefficient_sheaf_line: For a scalar character, equivariance is multiplication by κ(Jγ)⁻¹.
tests: TauCeti.Overconvergent.Test.O1_equivariant_coefficient_sheaf_vector: A rank-two diagonal coefficient representation produces a rank-two descended bundle when effective, not a line bundle.
acceptance: For an actual right Γ-torsor q:Y→X on the supplied analytic/v-site, an analytic cocycle J and coefficient module V on U, define E_J as the sheaf whose sections over W→X are analytic V-valued functions on Y_W×U satisfying f(yγ)=ρ(Jγ(y)⁻¹)f(y). Rational and integral versions use O and O+ respectively, with a specified stable lattice in the latter.

OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality — Functorial coefficient descent
TauCeti.Overconvergent.coefficient_descent_functoriality: Effective finite locally free cocycle descent commutes with coefficient intertwiners, tensor, contragredient dual and base pullback; iterated descent agrees with descent through an exact effective group extension. For Banach coefficients assert only the maps and exactness supplied by the relevant Banach descent theorem.
hypotheses: Use effective descent on the indicated site. Finite quotient invariants in characteristic zero use an invertible group order; integral invariants do not inherit this automatically.
hypotheses: A quotient stabilizer must act trivially on a descended coarse fibre; otherwise retain the equivariant/stack object.
prerequisites: OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf
prerequisites: OverconvergentAutomorphicForms:O0/coefficient-tensor-dual
prerequisites: AutomorphicBundles:B0/ineffective-fibre-descent
prerequisites: PerfectoidSpaces:P9
proofSteps: Check each map on the torsor by the cocycle identity and the representation tensor/dual laws.
proofSteps: Use uniqueness of effective descent to compare the resulting maps and prove identities/composition.
proofSteps: Use AutomorphicBundles B0 ineffective-fibre criterion only for the finite tame quotient to which its hypotheses apply.
acceptance: Finite-character averaging over a p-divisible group order is valid over L but need not preserve an O+ lattice.

OverconvergentAutomorphicForms:O1/analytic-line-effectivity — Analytic effectivity of line descent
TauCeti.Overconvergent.analytic_line_effectivity: For smooth rigid X over a perfectoid field extension of Q_p and a v-line L obtained by cocycle descent, analyticity on a Zariski-dense analytic open implies analyticity on X. For a topologically finite-type formal O_K-scheme 𝔛 and a pro-etale profinite formal torsor 𝔛∞→𝔛, a continuous multiplicative cocycle c:G→O(𝔛∞)× gives a v-line on the generic fibre that is the analytification of a Zariski line on 𝔛. An arbitrary analytic O+-unit cocycle is not substituted for this formal cocycle.
hypotheses: The first assertion is for line bundles, not arbitrary Banach or rank-r v-bundles.
hypotheses: For the formal assertion the cocycle lies in units of the completed formal structural ring O(𝔛∞), reduces modulo p^m through a finite quotient, and the finite-level descended lines form a compatible effective system. The map O(𝔛∞)→O+(X∞) used by Heuer is a natural map, not an asserted general isomorphism.
prerequisites: OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf
prerequisites: PerfectoidSpaces:P9
proofSteps: Import Heuer Corollary 1.4 and Proposition 3.8 from PerfectoidSpaces:P9, as requested below.
proofSteps: Apply the first to extend ordinary analytic trivializations of the line. For the formal assertion descend at each finite quotient modulo p^m and use formal p-adic effectivity; do not swap global sections with limits on arbitrary nonaffine bases.
acceptance: An arbitrary v-vector bundle is not declared analytic by this line-bundle criterion.

OverconvergentAutomorphicForms:O2/admitted-hilbert-domain — Admitted Hilbert coefficient domains
TauCeti.Overconvergent.admitted_hilbert_domain: Choose the anticanonical Hilbert domain X_{Γ0*(p^n)}(ε)_a, n≥1 or ∞, and its infinite-level cover with T4’s Hodge–Tate coordinate z. The chosen bounded analytic weight extension and m,ε satisfy DOM; at finite level AL_n maps the level-domain of radius p^n ε to X(ε). At n=0 define on X(ε) by AL_1 from X_{Γ0*(p)}(pε)_a. This domain is the input for coefficients, rather than a definition of the Hilbert tower itself.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
prerequisites: HodgeTateAndCanonicalSubgroups:T4
prerequisites: OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights
prerequisites: OverconvergentAutomorphicForms:O0/bounded-weight-families
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Import canonical subgroup, anticanonical domain and z-bounds from HodgeTateAndCanonicalSubgroups:T4.
proofSteps: Intersect the geometric admissibility range with the weight-extension range. Restrictions and AL_n retain the scaled Hasse radius.
proofSteps: The corrected radius exists by O0; no ε is computed from the false printed |T| formula.
api: TauCeti.Overconvergent.admitted_hilbert_domain.periodCoordinate: The supplied z lies in the indicated radius neighbourhood of O_p.
api: TauCeti.Overconvergent.admitted_hilbert_domain.restrict: For ε′≤ε, inclusion of the smaller anticanonical domain.
api: TauCeti.Overconvergent.admitted_hilbert_domain.atkinLehner: AL_n maps the level-domain of radius p^n ε to the base-domain of radius ε on the corresponding canonical domain.
tests: TauCeti.Overconvergent.Test.O2_admitted_hilbert_domain_ordinary: ε=0 gives the ordinary anticanonical domain.
tests: TauCeti.Overconvergent.Test.O2_admitted_hilbert_domain_levelZero: At n=0 the definition is transported by AL_1, with pε on its level-domain and ε on its tame target.
tests: TauCeti.Overconvergent.Test.O2_admitted_hilbert_domain_radius: For p=3 and m=1 the sufficient bound is ε≤1/9; ε=1/3 fails the selected admission inequality even for the trivial continuous character.
acceptance: AL_n:X_{Γ0*(p^n)}(p^nε)_a≅X(ε) scales the source radius; at level zero AL_1 uses source pε and target ε.
acceptance: At p=3,m=1 the sufficient bound is ε≤1/9; ε=1/3 is outside this admitted range.
acceptance: ε=0 is the ordinary domain, whereas overconvergent forms use the positive admitted radii.

OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor — Hilbert automorphy factors
TauCeti.Overconvergent.hilbert_automorphy_factor: For γ=(a b;c d)∈Γ0(p), set jγ(z)=cz+d in O_p⊗O(X∞×U); T4’s coordinate transformation makes jγ a unit in the chosen analytic neighbourhood. The scalar coefficient factor is κ(jγ(z))⁻¹. For finite/vector analytic Levi coefficients use the supplied Levi-valued torsor cocycle, not a determinant character in place of the representation. The source level action is left; write f(γx)=κ(jγ(x))⁻¹f(x). For a right-action interface use x·γ=γ⁻¹x and the factor jγ⁻¹(x) as in hilbert-cocycle-law.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: Use T4’s left fractional-linear coordinate convention. For a right action explicitly convert x·γ=γ⁻¹x and invert the coefficient cocycle as in O1.
prerequisites: OverconvergentAutomorphicForms:O2/admitted-hilbert-domain
prerequisites: OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights
prerequisites: HodgeTateAndCanonicalSubgroups:T4
prerequisites: HodgeTateAndCanonicalSubgroups:T5
prerequisites: OverconvergentAutomorphicForms:O0/finite-analytic-coefficients
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Use c∈pO_p and the anticanonical z-bound to place cz+d in B_r(O_p^×:1).
proofSteps: Evaluate the selected analytic κ-extension; its inverse is defined since the extension is multiplicative into units.
proofSteps: For vectors retain the actual Levi-valued left frame cocycle and its coefficient representation. Convert to O1 with Kγ⁻¹(x)⁻¹; do not reuse the scalar commutation argument for noncommuting coefficients.
api: TauCeti.Overconvergent.hilbert_automorphy_factor.apply: jγ=cz+d and the section multiplier is κ(cz+d)⁻¹.
api: TauCeti.Overconvergent.hilbert_automorphy_factor.unit: jγ takes values in the admitted unit neighbourhood.
api: TauCeti.Overconvergent.hilbert_automorphy_factor.weightPullback: Pulling back κ pulls back its automorphy factor.
tests: TauCeti.Overconvergent.Test.O2_hilbert_automorphy_factor_upperUnipotent: For γ=(1 b;0 1), jγ=1.
tests: TauCeti.Overconvergent.Test.O2_hilbert_automorphy_factor_diagonal: For γ=diag(a,d), the scalar section multiplier is κ(d)⁻¹.
tests: TauCeti.Overconvergent.Test.O2_hilbert_automorphy_factor_determinant: jγ is not det γ: diag(a,1) has jγ=1 even when det γ=a≠1.
acceptance: For γ=(a b;c d)∈Γ0(p), set jγ(z)=cz+d in O_p⊗O(X∞×U); T4’s coordinate transformation makes jγ a unit in the chosen analytic neighbourhood. The scalar coefficient factor is κ(jγ(z))⁻¹. For finite/vector analytic Levi coefficients use the supplied Levi-valued torsor cocycle, not a determinant character in place of the representation.


OverconvergentAutomorphicForms:O2/hilbert-cocycle-law — Hilbert cocycle identity
TauCeti.Overconvergent.hilbert_cocycle_law: For BHW’s left level action γx, the Hilbert factor jγ(x)=cγ z(x)+dγ satisfies j_{γδ}(x)=jγ(δx)jδ(x). Its analytic character extension is multiplicative on these admitted factors, so f(γx)=κ(jγ(x))⁻¹f(x) is consistent. For x·γ=γ⁻¹x, the scalar cocycle Jγ(x)=jγ⁻¹(x) obeys O1’s right law (the scalar group is commutative). For noncommuting left frame factors K use Jγ(x)=Kγ⁻¹(x)⁻¹ and retain the representation convention of O1.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
prerequisites: OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor
prerequisites: OverconvergentAutomorphicForms:O1/right-automorphy-cocycle
prerequisites: HodgeTateAndCanonicalSubgroups:T4
proofSteps: Use the source left fractional-linear transformation z(δx)=(aδ z(x)+bδ)/(cδ z(x)+dδ).
proofSteps: Matrix multiplication gives cγδ z+dγδ=(cγ z(δx)+dγ)(cδ z+dδ), establishing the left law.
proofSteps: Evaluate the multiplicative analytic scalar character and use inverse coefficient equivariance. For general vector factors apply the noncommutative ofLeft conversion in O1, with reversed inverse order.
acceptance: At p=3, γ=[[1,0],[3,1]], δ=diag(2,1), z=1, jγδ=7 and jγ(δz)jδ(z)=7; the erroneous right-action expression jγ(z)jδ(γz) is 4.
acceptance: An upper unipotent has trivial scalar factor.
acceptance: General noncommutative factors use Kγ⁻¹(x)⁻¹; coefficient factors cannot be reordered.

OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf — Geometric overconvergent Hilbert sheaves
TauCeti.Overconvergent.geometric_hilbert_sheaf: Define ω_n^κ on X_{Γ0*(p^n)}(ε)_a×U as the actual Γ0*(p^n)-equivariant coefficient functions on X_{Γ*(p∞)}(ε)_a×U with scalar factor κ(cz+d)⁻¹. For n=∞ use the corresponding kernel subgroup of the projection. For n=0 transport through AL_1. This is an analytic invertible sheaf, not an alias for AIP’s independent sheaf.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
prerequisites: OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf
prerequisites: OverconvergentAutomorphicForms:O1/analytic-line-effectivity
prerequisites: OverconvergentAutomorphicForms:O2/hilbert-cocycle-law
prerequisites: OverconvergentAutomorphicForms:O2/admitted-hilbert-domain
prerequisites: PerfectoidSpaces:P9
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Use the actual left tower action and multiplier f(γx)=κ(jγ(x))⁻¹f(x); convert to O1’s right equalizer with x·γ=γ⁻¹x and Jγ=jγ⁻¹. No unconverted right cz+d identity is used.
proofSteps: On the ordinary locus use the supplied Igusa formal trivialization and analytic-line-effectivity.
proofSteps: Use the dense-open analytic-line criterion from O1 to obtain an analytic invertible sheaf on the smooth domain; finite-level descent through the tower is supplied by P9.
api: TauCeti.Overconvergent.geometric_hilbert_sheaf.sections: Sections are the displayed κ⁻¹-equivariant analytic functions.
api: TauCeti.Overconvergent.geometric_hilbert_sheaf.localRank: Locally free rank one over O_{X×U}.
api: TauCeti.Overconvergent.geometric_hilbert_sheaf.restriction: The canonical map along ε′≤ε and along the specified level maps.
tests: TauCeti.Overconvergent.Test.O2_geometric_hilbert_sheaf_trivialWeight: κ=1 gives O_{X×U}.
tests: TauCeti.Overconvergent.Test.O2_geometric_hilbert_sheaf_parallelOne: The parallel algebraic weight x↦N(x) gives det ω; it is not the trivial character 1.
tests: TauCeti.Overconvergent.Test.O2_geometric_hilbert_sheaf_finiteLevel: Finite-level sections pull back to the stated equivariant functions on the infinite cover.
acceptance: Define ω_n^κ on X_{Γ0*(p^n)}(ε)_a×U as the actual Γ0*(p^n)-equivariant coefficient functions on X_{Γ*(p∞)}(ε)_a×U with scalar factor κ(cz+d)⁻¹. For n=∞ use the corresponding kernel subgroup of the projection. For n=0 transport through AL_1. This is an analytic invertible sheaf, not an alias for AIP’s independent sheaf.

OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps — Hilbert level and radius compatibility
TauCeti.Overconvergent.hilbert_level_radius_maps: The ω_n^κ pull back canonically under compatible finite/infinite level maps, rational weight pullbacks and restrictions ε′≤ε. Identifications obey identity/composition. AL_n:X_{Γ0*(p^n)}(p^nε)_a≅X(ε) transports the coefficient line on the p^nε level-domain to the ε tame-domain; in particular n=0 is defined using AL_1 from level-radius pε. Integral weight pullbacks satisfy the additional conditions of O3/hilbert-weight-pullback.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: Maps of weight families pull back the specified character and its analytic extension. Claims about sheaves do not assert arbitrary nonflat base change of global sections.
prerequisites: OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf
prerequisites: OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality
prerequisites: HodgeTateAndCanonicalSubgroups:T4
proofSteps: Compare both sides on the common infinite cover: the coordinate, cocycle and weight coincide.
proofSteps: O1 descent-functoriality gives unique identifications. For level zero transport the definition through AL_1 rather than asserting an unrelated tower quotient.
acceptance: A composition of level/radius maps gives the same identification as the composite map.

OverconvergentAutomorphicForms:O2/hilbert-algebraic-specialisation — Classical Hilbert coefficient specialisation
TauCeti.Overconvergent.hilbert_algebraic_specialisation: For κ(x)=∏_{σ:F→L}σ(x)^{kσ}, the geometric ω_n^κ identifies with ⊗_σ ω_σ^{kσ} on the anticanonical domain, pulled back via the specified AL_n convention. For κ=N^k this is (det ω)^k. Locally algebraic finite characters retain their finite-level character twist.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: The embeddings and classical differential eigenlines are defined over L; integer exponents may be negative since the factors are lines.
prerequisites: OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf
prerequisites: AutomorphicBundles:B4
prerequisites: HodgeTateAndCanonicalSubgroups:T5
proofSteps: Import the algebraic Hodge bundle and representation correspondence from AutomorphicBundles:B4.
proofSteps: T5 identifies the tautological Hodge–Tate trivialization with the differential frame; its transformation is cz+d.
proofSteps: Evaluate the algebraic character on this frame and descend. Finite-character twists are retained on their level cover.
acceptance: F=Q, κ(x)=x^k recovers ω^k with the stated AL convention.
acceptance: κ=1 recovers O, whereas κ=N recovers det ω.

OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf — Integral Hilbert coefficient lattices
TauCeti.Overconvergent.integral_hilbert_sheaf: Define ω_n^{κ,+} as the O+ equivariance equalizer on the actual infinite-level cover, for the same left level action and multiplier κ(jγ(x))⁻¹ as ω_n^κ. The admitted factors have integral unit values. This specifies a subsheaf of rational coefficients. O5/geometric-aip-comparison identifies the two independently defined integral equalizers; positive-radius full-character local freeness additionally requires the separate O5/aip-line-and-gluing unit-trivialization input.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: The coefficient chart is equipped with A+ and the character extension has integral unit values. Integral local invertibility requires the independent AIP unit-trivialization input and the comparison; characteristic-zero averaging does not supply it.
prerequisites: OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf
prerequisites: PerfectoidSpaces:P9
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Form the O+ equalizer using the same cocycle; inverse factors preserve O+.
proofSteps: The inclusion into rational functions is tautological. At finite level transport along the same tower and AL maps.
proofSteps: Do not assume integral local freeness here. After O5 identifies the equalizers, freeness follows only when its separate full-character integral unit-trivialization criterion is established.
proofSteps: Use O5’s integral comparison as an isomorphism of the specified O+ equalizers. Any claim of full-character positive-radius local freeness additionally requires the separate unit-trivialization input of O5/aip-line-and-gluing.
api: TauCeti.Overconvergent.integral_hilbert_sheaf.sections: Integral sections are the equivariant functions in q_*O+.
api: TauCeti.Overconvergent.integral_hilbert_sheaf.inclusion: ω_n^{κ,+} embeds into ω_n^κ.
api: TauCeti.Overconvergent.integral_hilbert_sheaf.restrict: Compatible restriction and level maps preserve the lattice.
tests: TauCeti.Overconvergent.Test.O3_integral_hilbert_sheaf_trivial: At trivial weight the lattice is O+.
tests: TauCeti.Overconvergent.Test.O3_integral_hilbert_sheaf_inverse: The inverse of an O+ unit factor preserves O+.
tests: TauCeti.Overconvergent.Test.O3_integral_hilbert_sheaf_rationalLine: On Spa(Q_p), Z_p and pZ_p are distinct integral submodules of Q_p but both rationalize to Q_p; rational invertibility therefore does not identify the chosen lattice.
acceptance: The trivial coefficient character gives O+ by the actual invariant-function descent.
acceptance: Inverting an O+ unit preserves integral functions.
acceptance: The rational line does not determine the integral equalizer: on Spa(Q_p), Z_p and pZ_p are distinct integral lattices in Q_p with identical rationalisation.

OverconvergentAutomorphicForms:O3/integral-rationalisation — Rationalisation of integral coefficients
TauCeti.Overconvergent.integral_rationalisation: On the admitted bounded-weight domains, ω_n^{κ,+}[1/p]≅ω_n^κ, and the analogous arithmetic statement holds after its descent is constructed. This is a sheaf identity; it does not assert H^0(ω+)[1/p]≅H^0(ω) on every nonquasicompact base.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: Work locally on quasicompact base and weight patches whose inverse images in the profinite level torsor are quasicompact. P9 supplies O+[1/p]=O on these inverse images, and the equivariance multipliers and their inverses are integral units. A global sections statement additionally requires a finite such cover with bounded denominators.
prerequisites: OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf
prerequisites: PerfectoidSpaces:P9
proofSteps: On a quasicompact inverse-image patch, a rational equivariant function has a finite open cover on which it is p^−N times an O+ function. Take the maximum of these finitely many denominators, using P9’s local O+[1/p]=O contract.
proofSteps: Multiplication by this single p^N preserves the same eigencondition, so the resulting section lies in the integral equalizer. The inclusion gives the reverse direction. This is a local argument on actual torsor functions, without an integral AIP generator or an interchange of arbitrary infinite invariants with localization.
proofSteps: Glue these local equalizer identifications to obtain the sheaf identity. After O4 arithmetic descent is constructed, use the same bounded-denominator argument on its quasicompact covers and its integral-unit transport maps; no division by a group order is needed.
acceptance: On an affinoid trivializing patch rational sections are precisely integral sections with a bounded p-denominator.


OverconvergentAutomorphicForms:O3/hilbert-weight-pullback — Variation of Hilbert coefficients in weight
TauCeti.Overconvergent.hilbert_weight_pullback: For a morphism of bounded smooth weight families U′→U pulling back κ and the chosen common analytic extension, the pulled-back geometric coefficient line is ω_n^{κ′}; with compatible integral structures the same holds integrally. These identifications commute with level and radius maps.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: Maps of weight families pull back the specified character and its analytic extension. Claims about sheaves do not assert arbitrary nonflat base change of global sections.
hypotheses: Integral pullback is claimed only for flat formal coefficient changes satisfying P9’s completed-descent hypotheses, or for the explicitly proved AIP chart refinement maps. Arbitrary integral weight specialisation is excluded (AIP CUSP Remark 3.15).
prerequisites: OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf
prerequisites: OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality
prerequisites: OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps
prerequisites: PerfectoidSpaces:P9
proofSteps: On the tower, pullback of the character is exactly the new automorphy factor.
proofSteps: Use finite locally free coefficient descent and its base-change law rather than commuting arbitrary invariants with a nonflat tensor product.
proofSteps: For O+ use the requested bounded integral descent/base-change theorem on compatible integral charts.
acceptance: Specialising a family to a point recovers its character sheaf.
acceptance: This theorem does not imply arbitrary base change for all fixed-radius global sections.

OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms — Fixed-radius Hilbert forms
TauCeti.Overconvergent.fixed_radius_hilbert_forms: Mκ^{G*,c}(n,N,ε;U)=H^0(X_{c,U,Γ0*(p^n),μN}(ε)_a,ω_n^κ); define Mκ^{G*,c,+} using ω_n^{κ,+}. Restriction maps go from a larger admitted neighbourhood to a smaller one. Banach and projectivity claims require the finite-level affinoid weight and cusp hypotheses in O6.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: Fix a positive prime-to-p polarisation ideal c. Both ε=0 and ε>0 have meanings, but they are different domains.
prerequisites: OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf
prerequisites: OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf
prerequisites: OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps
prerequisites: HilbertModularVarietiesAndShimuraCurves:H3
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Take sections of the already constructed sheaves. The integral inclusion follows from O3 integral-hilbert-sheaf.
proofSteps: Use sheaf restriction for maps; define the fixed-radius topology from the actual affinoid/coherent or Banach coefficient model, not the discrete topology.
api: TauCeti.Overconvergent.fixed_radius_hilbert_forms.restrict: Restriction along ε′≤ε, with identity and composition.
api: TauCeti.Overconvergent.fixed_radius_hilbert_forms.integralInclusion: Integral sections map to rational sections.
api: TauCeti.Overconvergent.fixed_radius_hilbert_forms.evaluateWeight: Pullback of a section to a weight fibre; no surjectivity without O6 hypotheses.
tests: TauCeti.Overconvergent.Test.O3_fixed_radius_hilbert_forms_zero: The zero section belongs to every fixed-radius module.
tests: TauCeti.Overconvergent.Test.O3_fixed_radius_hilbert_forms_trivial: For κ=1 the space is H^0 of O on the actual domain.
tests: TauCeti.Overconvergent.Test.O3_fixed_radius_hilbert_forms_ordinary: ε=0 defines ordinary-locus sections and is not a synonym for positive-radius overconvergence.
acceptance: Mκ^{G*,c}(n,N,ε;U)=H^0(X_{c,U,Γ0*(p^n),μN}(ε)_a,ω_n^κ); define Mκ^{G*,c,+} using ω_n^{κ,+}. Restriction maps go from a larger admitted neighbourhood to a smaller one. Banach and projectivity claims require the finite-level affinoid weight and cusp hypotheses in O6.

OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms — Overconvergent Hilbert forms
TauCeti.Overconvergent.overconvergent_hilbert_forms: Mκ^{G*,c,†}=colim_{ε>0 admitted}Mκ^{G*,c}(n,N,ε;U) along restrictions toward the ordinary locus. Its integral counterpart is the same filtered colimit of the specified lattices. The locally convex direct-limit topology is used when asserting continuity; no equality with all ordinary-locus sections is built into the definition.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: At a bounded family choose the positive cofinal system admitted for that family; compare choices via a common cofinal subsystem.
prerequisites: OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms
prerequisites: LocallyAnalyticDistributions:L4/projective-banach-modules
prerequisites: LocallyAnalyticDistributions:L0
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Construct the filtered colimit of actual section modules and restriction maps.
proofSteps: Equip it with the direct-limit locally convex topology supplied by LAD, using the Banach models at finite affinoid weight and finite level where available.
proofSteps: Functoriality follows from commuting restriction diagrams; cofinal changes do not change the module.
api: TauCeti.Overconvergent.overconvergent_hilbert_forms.ofRadius: Canonical map from any positive admitted radius.
api: TauCeti.Overconvergent.overconvergent_hilbert_forms.lift: Compatible linear maps from every radius induce a unique map from the colimit.
api: TauCeti.Overconvergent.overconvergent_hilbert_forms.cofinal: A cofinal family of positive admitted radii gives the same overconvergent module.
tests: TauCeti.Overconvergent.Test.O3_overconvergent_hilbert_forms_representative: Every element has a representative at some positive admitted radius.
tests: TauCeti.Overconvergent.Test.O3_overconvergent_hilbert_forms_equality: Two representatives agree iff their restrictions agree at some smaller positive admitted radius.
tests: TauCeti.Overconvergent.Test.O3_overconvergent_hilbert_forms_ordinary: A section defined only at ε=0 has no tautological representative in this colimit.
acceptance: Mκ^{G*,c,†}=colim_{ε>0 admitted}Mκ^{G*,c}(n,N,ε;U) along restrictions toward the ordinary locus. Its integral counterpart is the same filtered colimit of the specified lattices. The locally convex direct-limit topology is used when asserting continuity; no equality with all ordinary-locus sections is built into the definition.

OverconvergentAutomorphicForms:O3/ramified-modified-lattice — Modified lattices at ramified primes
TauCeti.Overconvergent.ramified_modified_lattice: At ramified p, the integral differential module used for AIP coefficients is ω^int, the O_F⊗O+-span of the appropriate Hodge–Tate/canonical-subgroup image. It is locally free of rank one over O_F⊗O+ in the admitted range, although the naive ω+ need not be so away from the Rapoport locus. The perfectoid integral line is compared to coefficients of ω^int, not to a nonexistent splitting of naive ω+.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: Use T5’s exact canonical-subgroup range and modified differential theorem; the Rapoport condition is not imposed globally.
prerequisites: OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf
prerequisites: HodgeTateAndCanonicalSubgroups:T5
proofSteps: Import the modified differential lattice and Hodge–Tate image from T5.
proofSteps: Use its rank-one theorem to define the differential frame torsor used by O5.
proofSteps: Retain both lattices and the map between them; only on the locus where the supplied theorem identifies them can the modification be omitted.
acceptance: For a split/unramified Rapoport point the expected differential eigenline model agrees with the modification.
acceptance: As a local algebra test, over k[e]/e² the regular module has e acting as a nonzero Jordan block, whereas k² with e acting by zero is not free of rank one; equal k-dimensions do not establish O_F-line freeness.

OverconvergentAutomorphicForms:O4/presentation-geometric-small — Geometric small-cover coefficients
TauCeti.Overconvergent.presentation_geometric_small: Define presentation (1) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ*(p∞)}(ε)_a×U, with acting group Γ0*(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
prerequisites: OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf
prerequisites: OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor
prerequisites: HilbertModularVarietiesAndShimuraCurves:H4
prerequisites: PerfectoidShimuraVarieties:S5
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Import the stated cover, group action and quotient from H4/S5. Use the same pulled-back Hodge–Tate coordinate on that cover.
proofSteps: Form O1’s equivariant-function equalizer. For quotient groups the next representative-independence theorem is needed before the action is well-defined.
proofSteps: Retain the separate cover and action as construction data; comparisons are subsequent maps, not definitional equalities.
api: TauCeti.Overconvergent.presentation_geometric_small.sections: Sections satisfy exactly the Γ0*(p^n)-equivariance condition with multiplier κ(cz+d)⁻¹.
api: TauCeti.Overconvergent.presentation_geometric_small.integralInclusion: The O+ equalizer embeds in its O version.
api: TauCeti.Overconvergent.presentation_geometric_small.pullback: Compatible level, radius and weight pullback retains this cover and coefficient action.
tests: TauCeti.Overconvergent.Test.O4_presentation_geometric_small_trivial: When w=t=1, the presentation is the structural sheaf on its own quotient base.
tests: TauCeti.Overconvergent.Test.O4_presentation_geometric_small_factor: The section multiplier on a group element is κ(cz+d)⁻¹, including its sign and determinant/polarisation component.
tests: TauCeti.Overconvergent.Test.O4_presentation_geometric_small_cover: For ε∈Z_p^×, diag(ε,1) has j=1 and fixes every weight-equivariant coefficient function on the small cover; this is the invariance used in the full-cover comparison.
acceptance: Define presentation (1) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ*(p∞)}(ε)_a×U, with acting group Γ0*(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

OverconvergentAutomorphicForms:O4/presentation-geometric-full — Geometric full-cover coefficients
TauCeti.Overconvergent.presentation_geometric_full: Define presentation (2) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group Γ0(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
prerequisites: OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf
prerequisites: OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor
prerequisites: HilbertModularVarietiesAndShimuraCurves:H4
prerequisites: PerfectoidShimuraVarieties:S5
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Import the stated cover, group action and quotient from H4/S5. Use the same pulled-back Hodge–Tate coordinate on that cover.
proofSteps: Form O1’s equivariant-function equalizer. For quotient groups the next representative-independence theorem is needed before the action is well-defined.
proofSteps: Retain the separate cover and action as construction data; comparisons are subsequent maps, not definitional equalities.
api: TauCeti.Overconvergent.presentation_geometric_full.sections: Sections satisfy exactly the Γ0(p^n)-equivariance condition with multiplier κ(cz+d)⁻¹.
api: TauCeti.Overconvergent.presentation_geometric_full.integralInclusion: The O+ equalizer embeds in its O version.
api: TauCeti.Overconvergent.presentation_geometric_full.pullback: Compatible level, radius and weight pullback retains this cover and coefficient action.
tests: TauCeti.Overconvergent.Test.O4_presentation_geometric_full_trivial: When w=t=1, the presentation is the structural sheaf on its own quotient base.
tests: TauCeti.Overconvergent.Test.O4_presentation_geometric_full_factor: The section multiplier on a group element is κ(cz+d)⁻¹, including its sign and determinant/polarisation component.
tests: TauCeti.Overconvergent.Test.O4_presentation_geometric_full_cover: For u∈O_p^×, diag(u,1) has j=1 and fixes a section of presentation (2), while its determinant may be nontrivial.
acceptance: Define presentation (2) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group Γ0(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate — Arithmetic intermediate-cover coefficients
TauCeti.Overconvergent.presentation_arithmetic_intermediate: Define presentation (3) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group E(p^n) and section transformation multiplier κ(cz+d)⁻¹w(x) for a representative (γ,x); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
prerequisites: OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf
prerequisites: OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor
prerequisites: HilbertModularVarietiesAndShimuraCurves:H4
prerequisites: PerfectoidShimuraVarieties:S5
prerequisites: OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units
prerequisites: OverconvergentAutomorphicForms:O4/arithmetic-representatives
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Import the stated cover, group action and quotient from H4/S5. Use the same pulled-back Hodge–Tate coordinate on that cover.
proofSteps: Form O1’s equivariant-function equalizer. For quotient groups the next representative-independence theorem is needed before the action is well-defined.
proofSteps: Retain the separate cover and action as construction data; comparisons are subsequent maps, not definitional equalities.
api: TauCeti.Overconvergent.presentation_arithmetic_intermediate.sections: Sections satisfy exactly the E(p^n)-equivariance condition with multiplier κ(cz+d)⁻¹w(x) for a representative (γ,x).
api: TauCeti.Overconvergent.presentation_arithmetic_intermediate.integralInclusion: The O+ equalizer embeds in its O version.
api: TauCeti.Overconvergent.presentation_arithmetic_intermediate.pullback: Compatible level, radius and weight pullback retains this cover and coefficient action.
tests: TauCeti.Overconvergent.Test.O4_presentation_arithmetic_intermediate_trivial: When w=t=1, the presentation is the structural sheaf on its own quotient base.
tests: TauCeti.Overconvergent.Test.O4_presentation_arithmetic_intermediate_factor: The section multiplier on a group element is κ(cz+d)⁻¹w(x) for a representative (γ,x), including its sign and determinant/polarisation component.
tests: TauCeti.Overconvergent.Test.O4_presentation_arithmetic_intermediate_cover: For η∈O_F^{×,+}, the representative change (γ,x)↦(γηI,xη²) leaves κ(cz+d)⁻¹w(x) unchanged.
acceptance: Define presentation (3) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ(p∞)}(ε)_a×U, with acting group E(p^n) and section transformation multiplier κ(cz+d)⁻¹w(x) for a representative (γ,x); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

OverconvergentAutomorphicForms:O4/presentation-arithmetic-full — Arithmetic full-cover coefficients
TauCeti.Overconvergent.presentation_arithmetic_full: Define presentation (4) independently as the O+ equivariance equalizer on the actual cover X_{G,U,Γ(p∞)}(ε)_a×U, with acting group PΓ0(p^n) and section transformation multiplier κ(cz+d)⁻¹w(det γ); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
prerequisites: OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf
prerequisites: OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor
prerequisites: HilbertModularVarietiesAndShimuraCurves:H4
prerequisites: PerfectoidShimuraVarieties:S5
prerequisites: OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units
prerequisites: OverconvergentAutomorphicForms:O4/arithmetic-representatives
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Import the stated cover, group action and quotient from H4/S5. Use the same pulled-back Hodge–Tate coordinate on that cover.
proofSteps: Form O1’s equivariant-function equalizer. For quotient groups the next representative-independence theorem is needed before the action is well-defined.
proofSteps: Retain the separate cover and action as construction data; comparisons are subsequent maps, not definitional equalities.
api: TauCeti.Overconvergent.presentation_arithmetic_full.sections: Sections satisfy exactly the PΓ0(p^n)-equivariance condition with multiplier κ(cz+d)⁻¹w(det γ).
api: TauCeti.Overconvergent.presentation_arithmetic_full.integralInclusion: The O+ equalizer embeds in its O version.
api: TauCeti.Overconvergent.presentation_arithmetic_full.pullback: Compatible level, radius and weight pullback retains this cover and coefficient action.
tests: TauCeti.Overconvergent.Test.O4_presentation_arithmetic_full_trivial: When w=t=1, the presentation is the structural sheaf on its own quotient base.
tests: TauCeti.Overconvergent.Test.O4_presentation_arithmetic_full_factor: The section multiplier on a group element is κ(cz+d)⁻¹w(det γ), including its sign and determinant/polarisation component.
tests: TauCeti.Overconvergent.Test.O4_presentation_arithmetic_full_cover: For η∈(1+NO_F)^{×,+}, the central scalar ηI has multiplier κ(η)⁻¹w(η²)=1.
acceptance: Define presentation (4) independently as the O+ equivariance equalizer on the actual cover X_{G,U,Γ(p∞)}(ε)_a×U, with acting group PΓ0(p^n) and section transformation multiplier κ(cz+d)⁻¹w(det γ); rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.

OverconvergentAutomorphicForms:O4/arithmetic-representatives — Well-defined arithmetic coefficient actions
TauCeti.Overconvergent.arithmetic_representatives: The multiplier of presentation (3) is unchanged by (γ,x)↦(γηI,xη²), η∈O_F^{×,+}. The multiplier of (4) kills the central closure Z∞ of (1+NO_F)^{×,+}, so descends to PΓ0(p^n). Both assertions use κ(η)⁻¹w(η²)=1.
hypotheses: Use H4’s actual quotient relations and topological closure, not a quotient by all p-adic units.
hypotheses: Arithmetic κ=ρ(w,t), and totally positive global units have norm 1.
prerequisites: OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units
prerequisites: OverconvergentAutomorphicForms:O2/hilbert-cocycle-law
prerequisites: HilbertModularVarietiesAndShimuraCurves:H4
proofSteps: Apply weight-comparison-totally-positive-units to η.
proofSteps: In (3), cz+d becomes η(cz+d) and the polarisation multiplier gains w(η²), so the product is unchanged.
proofSteps: In (4), the central factor is the same identity; continuity extends it to Z∞. The descent law follows from the Hilbert cocycle law.
acceptance: Ignoring w(η²) generally breaks presentation (3).

OverconvergentAutomorphicForms:O4/geometric-full-cover-comparison — Comparison of geometric covers
TauCeti.Overconvergent.geometric_full_cover_comparison: Pullback from the full Γ tower to the Γ* tower identifies presentations (2) and (1), integrally and rationally. The inverse is constructed through X_{Γ*(p∞)}←X_{Γ*(p∞)}×O_p^×→X_{Γ(p∞)}, whose right map is a Z_p^×-torsor. It is a genuine isomorphism independent of the choice of full geometric cover.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
prerequisites: OverconvergentAutomorphicForms:O4/presentation-geometric-small
prerequisites: OverconvergentAutomorphicForms:O4/presentation-geometric-full
prerequisites: PerfectoidShimuraVarieties:S5
prerequisites: PerfectoidSpaces:P9
prerequisites: HodgeTateAndCanonicalSubgroups:T4
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Pull back a section along the tower morphism; the coordinate/cocycle agree by S5/T4.
proofSteps: For the inverse, pull the Γ* section to the product. The action diag(ε,1), ε∈Z_p^×, has j=1, giving invariance under the antidiagonal torsor action.
proofSteps: Use P9’s O/O+ profinite torsor descent. Verify diag(u,1) invariance for all u∈O_p^× and Γ0* equivariance; these generate the full Γ0 action. The composites are the identity by faithful pullback.
acceptance: For diag(u,1), the coefficient factor is κ(1)⁻¹=1.

OverconvergentAutomorphicForms:O4/twisted-polarisation-action — Twisted polarisation action
TauCeti.Overconvergent.twisted_polarisation_action: On π_* of presentation (2), define the left action of positive global units by ε·_w f=w(ε)(ε⁻¹)^*f. This preserves the geometric coefficient sheaf and factors through the finite group Δ(N) supplied by H4. This finite group differs from the profinite Δ(p∞N) acting on full towers.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
prerequisites: OverconvergentAutomorphicForms:O4/presentation-geometric-full
prerequisites: OverconvergentAutomorphicForms:O4/arithmetic-representatives
prerequisites: HilbertModularVarietiesAndShimuraCurves:H4
prerequisites: HodgeTateAndCanonicalSubgroups:T4
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Compute the left action law using the commutative character w and inverse base pullback.
proofSteps: Polarisation preserves the Hodge–Tate coordinate and commutes with the Γ action, so preserves geometric equivariance.
proofSteps: Use H4’s congruence/square relations and κ(η)⁻¹w(η²)=1 to kill the specified kernel; do not assert that all totally positive units are squares.
api: TauCeti.Overconvergent.twisted_polarisation_action.apply: ε·_w f=w(ε)(ε⁻¹)^*f.
api: TauCeti.Overconvergent.twisted_polarisation_action.mul: (εδ)·_w f=ε·_w(δ·_w f).
api: TauCeti.Overconvergent.twisted_polarisation_action.finiteAction: The action factors through the specified finite Δ(N).
tests: TauCeti.Overconvergent.Test.O4_twisted_polarisation_action_trivialW: w=1 gives inverse polarisation pullback.
tests: TauCeti.Overconvergent.Test.O4_twisted_polarisation_action_constant: On a scalar constant section the action is multiplication by w(ε).
tests: TauCeti.Overconvergent.Test.O4_twisted_polarisation_action_inverse: Using ε^* instead of (ε⁻¹)^* gives the opposite base action and generally changes the descent.
acceptance: On π_* of presentation (2), define the left action of positive global units by ε·_w f=w(ε)(ε⁻¹)^*f. This preserves the geometric coefficient sheaf and factors through the finite group Δ(N) supplied by H4. This finite group differs from the profinite Δ(p∞N) acting on full towers.

OverconvergentAutomorphicForms:O4/finite-polarisation-descent — Finite polarisation descent
TauCeti.Overconvergent.finite_polarisation_descent: Presentation (3) is canonically (π_* presentation (2))^{Δ(N)}, with the O4 twisted polarisation action, for both integral and rational coefficients. The quotient is the finite effective geometric-to-arithmetic polarisation quotient; it is not the full profinite tower quotient.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
prerequisites: OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate
prerequisites: OverconvergentAutomorphicForms:O4/presentation-geometric-full
prerequisites: OverconvergentAutomorphicForms:O4/twisted-polarisation-action
prerequisites: HilbertModularVarietiesAndShimuraCurves:H4
proofSteps: Use H4’s finite quotient and the description of E(p^n) as the extension carrying both Γ and positive-unit actions.
proofSteps: A section invariant under the twisted action satisfies exactly the E multiplier of presentation (3), and conversely.
proofSteps: Sheaf equalizers therefore identify the two constructions even integrally; no averaging by 1/|Δ(N)| is used to define integral invariants.
acceptance: Integral descent is not justified by dividing by a potentially p-divisible |Δ(N)|.

OverconvergentAutomorphicForms:O4/weil-pairing-comparison — Weil-pairing arithmetic comparison
TauCeti.Overconvergent.weil_pairing_comparison: The map from presentation (4) to presentation (3) is f↦w(eβ)⁻¹π∞^*f. Its inverse multiplies by w(eβ) and descends through the actual profinite Δ(p∞N)-torsor. Both maps preserve O+ and are inverse. The transformation is (γ,x)^*w(eβ)=w(x⁻¹)w(det γ)w(eβ).
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
hypotheses: The full-level pairing eβ is an O_p^×-valued map supplied by S5, with the stated transformation law.
prerequisites: OverconvergentAutomorphicForms:O4/presentation-arithmetic-full
prerequisites: OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate
prerequisites: OverconvergentAutomorphicForms:O4/arithmetic-representatives
prerequisites: PerfectoidShimuraVarieties:S5
prerequisites: PerfectoidSpaces:P9
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Multiply the pullback by the inverse pairing character; its transformation changes w(det γ) into w(x) by cancellation.
proofSteps: For the inverse, w(eβ)f is invariant under positive global units. Their density in the profinite quotient and continuity extend invariance to Δ(p∞N).
proofSteps: Apply P9 profinite descent and faithful pullback to prove the inverse and its PΓ0 equivariance. Pairing values are integral units, so preserve O+.
acceptance: The plain pullback π∞^* does not convert the determinant multiplier to the polarisation multiplier when w is nontrivial.

OverconvergentAutomorphicForms:O4/polarisation-class-forms — Forms across polarisation classes
TauCeti.Overconvergent.polarisation_class_forms: For arithmetic forms take the direct sum of fixed-c spaces over prime-to-p fractional ideals and quotient by P_x(f)−f for totally positive p-adic units x, where P_x transports c to xc. The indexing quotient is the finite narrow class group. Integral forms use the corresponding integral lattices. For G* retain a chosen set of class representatives and the specified comparison maps.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
hypotheses: Use H3/H4’s transport maps and their composition law; for arithmetic forms a transport by a positive unit stabilizing an ideal is already the identity after descent.
prerequisites: OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms
prerequisites: OverconvergentAutomorphicForms:O4/weil-pairing-comparison
prerequisites: OverconvergentAutomorphicForms:O4/finite-polarisation-descent
prerequisites: HilbertModularVarietiesAndShimuraCurves:H3
prerequisites: HilbertModularVarietiesAndShimuraCurves:H4
prerequisites: tauceti:NumberField.NarrowClassGroup
prerequisites: tauceti:NumberField.NarrowClassGroup.instFinite
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Construct arithmetic fixed-c sections from presentation (4) and its level-zero transport.
proofSteps: Use H4’s positive-p-unit transport and its composition law to form the stated quotient module.
proofSteps: Use baseline NarrowClassGroup and its finiteness instead of rebuilding ideal class theory; H3 supplies identification of the prime-to-p ideal indexing quotient.
api: TauCeti.Overconvergent.polarisation_class_forms.ofIdeal: Map each fixed-c arithmetic form into the class-independent quotient.
api: TauCeti.Overconvergent.polarisation_class_forms.transportRelation: ofIdeal(P_x f)=ofIdeal(f).
api: TauCeti.Overconvergent.polarisation_class_forms.representatives: A finite set of narrow-class representatives yields the direct-sum presentation, using the arithmetic stabilizer identity.
tests: TauCeti.Overconvergent.Test.O4_polarisation_class_forms_rational: For F=Q there is one narrow ideal class and arithmetic forms reduce to the single class component.
tests: TauCeti.Overconvergent.Test.O4_polarisation_class_forms_transport: The class of f at c equals the class of P_x f at xc.
tests: TauCeti.Overconvergent.Test.O4_polarisation_class_forms_geometricChoices: For G* a change of representatives retains noncanonical polarisation maps; arithmetic independence is not silently asserted before descent.
acceptance: For arithmetic forms take the direct sum of fixed-c spaces over prime-to-p fractional ideals and quotient by P_x(f)−f for totally positive p-adic units x, where P_x transports c to xc. The indexing quotient is the finite narrow class group. Integral forms use the corresponding integral lattices. For G* retain a chosen set of class representatives and the specified comparison maps.

OverconvergentAutomorphicForms:O4/polarisation-choice-independence — Independence of arithmetic polarisation choices
TauCeti.Overconvergent.polarisation_choice_independence: Arithmetic polarisation-class forms and their transported correspondences are canonically independent of narrow-class representative choices: P_x compose multiplicatively and any two transports with the same target differ by a positive-unit stabilizer acting trivially after arithmetic descent. For G* changes of representatives conjugate operators by the chosen polarisation comparisons; no canonical equality before these choices is claimed.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
prerequisites: OverconvergentAutomorphicForms:O4/polarisation-class-forms
prerequisites: OverconvergentAutomorphicForms:O4/finite-polarisation-descent
prerequisites: HilbertModularVarietiesAndShimuraCurves:H4
proofSteps: Use H4’s transport composition and O4 twisted/finite descent to kill the stabilizer ambiguity.
proofSteps: Build the representative-change map componentwise with P_x; its inverse uses P_{x⁻¹}.
proofSteps: The quotient relation makes both composites and all correspondence diagrams independent of x in the arithmetic case. Retain the chosen conjugation in the geometric case.
acceptance: Changing a polarisation representative twice agrees with changing it by the product transport.

OverconvergentAutomorphicForms:O5/aip-independent-coefficients — Independent AIP coefficient sheaves
TauCeti.Overconvergent.aip_independent_coefficients: On each AIP chart construct the modified differential frame torsor F_{n,r,I} and its B_n=O_p×·(1+p^n Hdg^(−p^n/(p−1))Res_{O_F/Z}G_a) action independently of the perfectoid tower. Define the analytic rational and integral coefficient sheaves as the κ⁻¹-eigenfunctions in (g_n f_n)_*O and (g_n f_n)_*O+ on this actual analytic torsor. In the formal AIP construction, first construct w_{n,r,I} for the universal character on W_F^0, then retain §6.4’s finite-character factor wχ for a full weight. The full formal sheaf is coherent; Prop.4.3 is not cited to assert its integral formal invertibility for every χ.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
hypotheses: Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
prerequisites: HodgeTateAndCanonicalSubgroups:T5
prerequisites: OverconvergentAutomorphicForms:O3/ramified-modified-lattice
prerequisites: OverconvergentAutomorphicForms:O0/bounded-weight-families
prerequisites: LocallyAnalyticDistributions:L0
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Import T5’s canonical subgroup, modified lattice, Hodge–Tate congruence and the frame torsor; retain its B_n-action.
proofSteps: Extend the universal-coordinate character via AIP Proposition 2.8 on W_F^0. For a full weight retain the finite torsion character χ and its independent eigencomponent on the normalized finite Igusa cover (§6.4, p.29).
proofSteps: Take actual κ⁻¹ analytic O and O+ eigenfunctions. Keep the universal formal line and the full finite-character coherent factor separate. Identification of that formal factor with the analytic integral lattice belongs to the full-character integral-trivialization request; the analytic integral equalizer is already defined independently.
proofSteps: On every complete algebraically closed valued test point of the admitted B_n-torsor, both κ(b) and κ(b)⁻¹ belong to the valuation ring. For the small analytic factor this is AIP Lemma4.4’s topologically nilpotent congruence; for the finite factor it follows from finite order. This is a unit-valued multiplier condition, not the existence of a unit-valued eigenfunction.
api: TauCeti.Overconvergent.aip_independent_coefficients.eigencondition: f(b·s)=κ(b)⁻¹f(s) on the specified B_n-torsor.
api: TauCeti.Overconvergent.aip_independent_coefficients.integralInclusion: Integral eigenfunctions embed in the rational coefficient sheaf.
api: TauCeti.Overconvergent.aip_independent_coefficients.restrictChart: Change of admissible interval, canonical level and radius gives the AIP transition maps.
api: TauCeti.Overconvergent.aip_independent_coefficients.finiteFactor: Record χ on H, its extension through (O_F/p²O_F)×, and the coherent normalized-Igusa eigencomponent wχ independently of the W_F^0 universal formal line.
api: TauCeti.Overconvergent.aip_independent_coefficients.translationUnits: On the admitted torsor, κ(b) and κ(b)⁻¹ are integral at every valued test point. Translating an eigenfunction by b therefore preserves its pointwise integral bound.
tests: TauCeti.Overconvergent.Test.O5_aip_independent_coefficients_trivial: The trivial character gives the structural sheaf after descent.
tests: TauCeti.Overconvergent.Test.O5_aip_independent_coefficients_algebraic: An algebraic κ gives the corresponding modified differential coefficient on the admitted chart.
tests: TauCeti.Overconvergent.Test.O5_aip_independent_coefficients_independent: For F=Q and κ(x)=x, scaling a differential frame s by λ∈Z_p^× gives f(λs)=λ⁻¹f(s); these eigenfunctions are not invariant functions for nontrivial λ.
tests: TauCeti.Overconvergent.Test.O5_aip_independent_coefficients_finiteFactor: At p=2, the character of the torsion subgroup of Z_2× sending −1 to −1 is not a W_F^0 character. Its normalized finite-Igusa factor must be retained, even though every finite-character value and its inverse are integral units.
acceptance: Construct the analytic O and O+ eigenfunction sheaves independently on the actual modified differential frame torsor, retaining the full finite torsion character. Construct the W_F^0 formal line and the full-character coherent formal factor separately. Identification of the latter’s integral generic fibre with the analytic O+ equalizer is an explicit remaining input, not part of the definition.


OverconvergentAutomorphicForms:O5/aip-translation-valuation-units — AIP translations preserve integral bounds
TauCeti.Overconvergent.aip_translation_valuation_units: On an admitted AIP frame torsor, at every valued test point both κ(b) and κ(b)⁻¹ lie in the valuation ring. Consequently h(b·y)=κ(b)⁻¹h(y) is integral if and only if h(y) is integral. This includes the full finite torsion character, including p-primary values, and does not assert existence of an integral unit eigenfunction.
hypotheses: Use the actual frame torsor and universal-coordinate admission hypotheses of aip-independent-coefficients. Check all continuous valuations used to define geometric O+, with complete valued extensions as required.
prerequisites: OverconvergentAutomorphicForms:O5/aip-independent-coefficients
prerequisites: mathlib:Valuation
prerequisites: mathlib:Valuation.integer
proofSteps: Factor the character into the universal analytic character and the finite torsion character. The compact-unit values of the former are pullbacks of units of the integral formal weight character. On the extended frame neighbourhood AIP Lemma4.4 gives a congruence to one by a topologically nilpotent element, so these values and their inverses are also integral.
proofSteps: For a finite-character value u with u^d=1, the ordered valuation group is torsion-free, hence v(u)^d=1 implies v(u)=1, even if p divides d. Multiply the two unit values.
proofSteps: Apply the eigencondition in both directions. No rank-one norm test replaces the quantification over all valuations.
acceptance: A multiplier p has integral value but nonintegral inverse and does not satisfy the conclusion.
acceptance: The finite character sending −1 to −1 at p=2 preserves both bounds despite being outside W_F^0.


tests: TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_higherRank: The valuation-unit implication holds with value group WithZero of the multiplicative lexicographically ordered Z by Z group, without a real-valued norm.
tests: TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_primePower: A unit of positive prime-power order has valuation one at every valuation, without a prime-to-p order condition.
tests: TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_finiteOrder: A unit of any positive finite order and its inverse preserve the integral bound on every translated scalar.
tests: TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_sign: The sign character value at p=2 preserves integrality: a and its negative have the same bound at every valuation.
tests: TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_nonunit: For a multiplier with valuation strictly below one, its inverse fails the bound at a=1; value-integrality alone is insufficient.
tests: TauCeti.Overconvergent.Test.O5_aip_translation_valuation_units_eigencondition: For an actual supplied eigencondition relating two point values by the inverse multiplier, membership in the valuation ring agrees when both multiplier bounds hold.

OverconvergentAutomorphicForms:O5/aip-line-and-gluing — AIP integral line and gluing
TauCeti.Overconvergent.aip_line_and_gluing: For the universal formal character on W_F^0, the AIP eigenmodule is a formal line and its admissible chart transports satisfy the cocycle identity (AIP Propositions4.3/4.7). For a full character, §6.4 gives a coherent formal sheaf and a rational analytic line, with chart transport obtained from the actual eigenfunctions. An analytic O+ line for the full character follows if, locally on the analytic base, a torsor eigenfunction e and its inverse are both in O+ and their transports differ by base O+ units. Existence of such integral trivializations at positive radius for arbitrary χ is the precise remaining freeness target; rational line gluing does not assert it.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
hypotheses: Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
hypotheses: For the analytic full-character unit criterion require actual geometric O+ invariant-function descent on the entire weight-product sheaf. The completed lattice tensor used by the named P9 theorem is a distinct coefficient object.
prerequisites: OverconvergentAutomorphicForms:O5/aip-independent-coefficients
prerequisites: HodgeTateAndCanonicalSubgroups:T5
prerequisites: PerfectoidSpaces:P9
prerequisites: PerfectoidSpaces:P9/integral-coboundary-trivialises-integral-sheaf
proofSteps: For the W_F^0 universal formal line, AIP Proposition4.3 and Lemmas4.4–4.6 construct the trace-compatible eigenfunction congruent to one modulo topologically nilpotent elements on the actual formal torsor. Its value and inverse are integral; normality proves formal rank one. Pullback of this formal line to its specified analytic O+ ringed chart is a line.
proofSteps: AIP Proposition4.7 compares the universal-character formal lines on a common refinement. The ratio of their unit-valued generators is invariant; the exact P9 invariant-functions contract identifies it with a base O+ unit. Ratios multiply on triple overlaps.
proofSteps: For full weights retain §6.4’s normalized finite-Igusa factor. The paper proves coherence and rational/ordinary invertibility, which supplies the rational analytic line. No denominator 1/|H| is used to claim integral freeness, especially when H has p-torsion.
proofSteps: For a full-character integral trivialization e, require the sheafwise geometric identity ((g_n f_n)_*O+)^{B_n}=O+ on all base opens. Then every integral eigenfunction g has invariant integral ratio g/e; conversely multiplication by e sends each base integral function to an eigenfunction. Require base O+ unit transition ratios. P9’s named integral-coboundary theorem proves this algebraic criterion for its chosen completed lattice tensor; applying it to geometric O+ on a smooth weight product needs the separate P9 request and cannot identify these two lattices silently.
proofSteps: The positive-radius full-character existence/transport of e is requested at T5/P9 and recorded as a gap. The O5 comparison of two integral equalizers below does not use this existence statement.
acceptance: Universal-character generators are units after the specified pullback, with inverse integral as well as value integral.
acceptance: Full finite-character rational freeness and ordinary freeness do not discharge positive-radius integral freeness.
acceptance: A candidate generator with inverse only in O, such as p on a constant integral chart, fails the unit criterion.
acceptance: The explicit finite-character factor is retained on every chart refinement.


OverconvergentAutomorphicForms:O5/geometric-aip-comparison — Geometric perfectoid–AIP comparison
TauCeti.Overconvergent.geometric_aip_comparison: On the common admitted domains, for every n≥0 and n=∞, pullback along the actual scaled Hodge–Tate frame gives an isomorphism from the independent AIP rational coefficient line to the perfectoid rational coefficient line and identifies their O+ eigenfunction submodules. At n=0 use AL_1 on both sides. The integral assertion is an isomorphism of lattices, without assuming either lattice already locally free. Full-character integral local freeness is the separate O5/aip-line-and-gluing target. Positive radii lie in the verified intersection; no radius formula derived from the false printed supremum is used.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
hypotheses: Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: The actual frame torsor F_m→X is a B_m-torsor on the stated site; after a complete algebraically closed valued extension every frame over a point is a B_m-translate of the Hodge–Tate frame of a lifted infinite-level point. The tower projection is valuatively surjective. These are the concrete T5/S5 torsor maps, not arbitrary maps of sets.
hypotheses: On this admitted torsor the character multiplier and its inverse are O+ units at every valued test point. Use the AIP small-character congruences and the full finite-order factor. O+ is the subsheaf defined by all pointwise valuation bounds, with pullback reflecting bounds along the valuatively surjective tower.
hypotheses: Apply T5/hodge-tate-aip-lift only with its actual bound ε_base≤p^(−(m+1)). In the scaled map s∘u_n, ε_base is the radius after u_n, while the anticanonical source radius is p^n ε_base. Require every source domain to satisfy its own O2 admissibility bounds as well; the bound 1/(c_p p^m) alone does not imply the T5 bound for p≥5.
prerequisites: OverconvergentAutomorphicForms:O5/aip-line-and-gluing
prerequisites: OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf
prerequisites: HodgeTateAndCanonicalSubgroups:T5
prerequisites: PerfectoidSpaces:P9
prerequisites: OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
prerequisites: OverconvergentAutomorphicForms:O1/analytic-line-effectivity
prerequisites: HodgeTateAndCanonicalSubgroups:T5/hodge-tate-aip-lift
prerequisites: HodgeTateAndCanonicalSubgroups:T5/aip-automorphy-factor
prerequisites: OverconvergentAutomorphicForms:O5/aip-translation-valuation-units
proofSteps: T5 supplies the actual left-equivariant map s(γx)=jγ(x)s(x) and its scaled s∘u_n Atkin–Lehner diagram. Pullback of AIP eigenfunctions therefore has the perfectoid inverse-character relation.
proofSteps: Establish the rational isomorphism first: the full-character AIP rational line comes from §6.4/Thm6.7. O1 analytic effectivity supplies the perfectoid rational line (ordinary formal descent followed by the dense-open criterion). In a local rational AIP generator, its evaluation at a frame is nonzero: after a valued extension trivializing the torsor, the associated rational line is the one-dimensional character fibre. Thus the map between rational lines is fibrewise nonzero, hence an isomorphism. No integral generator is invoked.
proofSteps: For integrality, let a rational AIP eigenfunction h pull back to an integral perfectoid section. For an arbitrary valued point y of F_m, lift its base point to x in the actual tower, extending the complete algebraically closed valued field if necessary. Torsor transitivity gives y=b·s(x). Then h(y)=κ(b)⁻¹h(s(x)); both multipliers are valuation units, so h(y) is integral exactly when h(s(x)) is. The pointwise definition of O+ proves h lies in the AIP integral equalizer. The forward direction is preservation of O+ by pullback.
proofSteps: Apply the argument on every base open and its weight product using P9’s actual sheafwise function/descent contract. Checking only product affinoids would not prove the entire product-sheaf assertion. This makes the integral map and its rational inverse inverse sheaf maps.
proofSteps: The maps glue because they are actual pullbacks, independently of integral local freeness. Handle ∞ with its limit torsor and 0 with AL_1. Once the separate full-character unit-trivialization input is supplied, the isomorphism transports integral local freeness; it does not prove that input by itself.
api: TauCeti.Overconvergent.geometric_aip_comparison.bounded_iff: For scalar eigenfunctions with unit-valued multipliers, if every valued torsor frame is a translate of a lifted Hodge–Tate frame, the bound on all torsor frames is equivalent to the bound on all lifted Hodge–Tate frames. The typed normed-field version is an algebraic test of this proof step; the adic application checks all valuations.
acceptance: Full torsion characters are included in the norm argument: finite-order values have valuation one, including p-primary roots of unity.
acceptance: An inverse character is necessary, but its integrality uses both the character and its inverse, not mere nonvanishing.
acceptance: The rational pullback being an isomorphism, its integral inverse is checked by every torsor frame valuation; equality of dimensions or a single fibre alone is insufficient.
acceptance: A scalar multiplier p would not preserve integral bounds under translation and fails the hypothesis.
acceptance: Integral equalizers can be compared before their local freeness is known. No inference from rational freeness to O+ freeness occurs.


OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison — Arithmetic perfectoid–AIP comparison
TauCeti.Overconvergent.arithmetic_aip_comparison: Define arithmetic AIP coefficients independently as the twisted finite Δ(N)-invariants of π_* of geometric AIP coefficients. Then ω_{G,c,n}^{κ,+}≅ω_{G,c,AIP,n}^{κ,+} for n≥0 or ∞ and the common admitted radii. The isomorphism includes the Weil-pairing character and finite polarisation action; rationalisation gives the arithmetic analytic line.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
hypotheses: Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: Arithmetic family κ_ar=(w,t) with geometric κ=ρ(w,t); translate AIP CUSP’s (ν,w_AIP) as ν=w and w_AIP=t⁻¹.
hypotheses: Inherit geometric-aip-comparison’s explicit T5 radius bound and scaled source-domain admission wherever the Hodge–Tate frame comparison is used, on both source and target of each comparison diagram.
prerequisites: OverconvergentAutomorphicForms:O5/geometric-aip-comparison
prerequisites: OverconvergentAutomorphicForms:O4/weil-pairing-comparison
prerequisites: OverconvergentAutomorphicForms:O4/finite-polarisation-descent
prerequisites: OverconvergentAutomorphicForms:O4/geometric-full-cover-comparison
prerequisites: OverconvergentAutomorphicForms:O4/twisted-polarisation-action
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Follow the explicit chain: presentation (4)→(3) via w(eβ)⁻¹; (3)→finite Δ-invariants of (2); (2)→(1); (1)→geometric AIP by the torsor comparison.
proofSteps: The twisted polarisation action on geometric AIP agrees with O4’s action by its frame calculation. Thus the last map descends integrally.
proofSteps: Transport level zero by AL_1 and rationalise locally. Hecke equivariance is the later O6 theorem, not presumed here.
proofSteps: Use O5’s integral comparison as an isomorphism of the specified O+ equalizers. Any claim of full-character positive-radius local freeness additionally requires the separate unit-trivialization input of O5/aip-line-and-gluing.
acceptance: Removing w(eβ)⁻¹ breaks the determinant/polarisation equivariance for nontrivial w.


OverconvergentAutomorphicForms:O5/aip-comparison-naturality — Naturality and uniqueness of torsor comparisons
TauCeti.Overconvergent.aip_comparison_naturality: The geometric and arithmetic comparisons are uniquely determined by their maps on the chosen tautological frame torsors. They commute with weight pullback, admitted chart/radius refinement and compatible level maps; equality of dimensions or a scalar normalisation at one classical weight does not determine this comparison.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum.
hypotheses: Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: Maps of weight families pull back the specified character and its analytic extension. Claims about sheaves do not assert arbitrary nonflat base change of global sections.
hypotheses: Inherit geometric-aip-comparison’s explicit T5 radius bound and scaled source-domain admission wherever the Hodge–Tate frame comparison is used, on both source and target of each comparison diagram.
prerequisites: OverconvergentAutomorphicForms:O5/geometric-aip-comparison
prerequisites: OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison
prerequisites: OverconvergentAutomorphicForms:O3/hilbert-weight-pullback
prerequisites: HodgeTateAndCanonicalSubgroups:T5
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: On a common trivializing cover, both maps evaluate the same eigenfunction at the same selected frame. This proves uniqueness after faithful pullback.
proofSteps: Use T5’s compatibility of the tautological frame with each change of base, level and radius and AIP Proposition 4.7 for chart changes.
proofSteps: For arithmetic coefficients the Weil pairing and twisted polarisation action also pull back compatibly, so descent preserves each commuting diagram.
proofSteps: Use O5’s integral comparison as an isomorphism of the specified O+ equalizers. Any claim of full-character positive-radius local freeness additionally requires the separate unit-trivialization input of O5/aip-line-and-gluing.
acceptance: Rescaling a chosen frame rescales both eigenfunction descriptions in the same way.


OverconvergentAutomorphicForms:O6/hilbert-cusp-forms — Hilbert cusp forms
TauCeti.Overconvergent.hilbert_cusp_forms: On the supplied smooth toroidal compactification with boundary divisor D, define the subcanonical coefficient line ω^κ(−D)=ω^κ⊗I_D and cusp forms Sκ(n,N,ε;U)=H^0(ω^κ(−D)) on the admitted toroidal neighbourhood, with the corresponding integral lattice and positive-radius colimit. Arithmetic forms descend with the same boundary ideal.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: C6 supplies the toroidal/minimal neighbourhoods, boundary Cartier ideal, extensions of the coefficient line and boundary-compatible maps.
hypotheses: Inherit geometric-aip-comparison’s explicit T5 radius bound and scaled source-domain admission wherever the Hodge–Tate frame comparison is used, on both source and target of each comparison diagram.
prerequisites: OverconvergentAutomorphicForms:O5/geometric-aip-comparison
prerequisites: OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison
prerequisites: ShimuraCompactifications:C6
prerequisites: OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Import the compactification and boundary geometry from ShimuraCompactifications:C6.
proofSteps: Extend the coefficient line via O5 and the AIP compactified torsor, then tensor with the actual ideal I_D.
proofSteps: Define sections and restriction maps. The boundary ideal is retained through finite arithmetic polarisation descent.
api: TauCeti.Overconvergent.hilbert_cusp_forms.inclusion: Sκ injects into the corresponding modular forms via I_D→O.
api: TauCeti.Overconvergent.hilbert_cusp_forms.boundaryKernel: Cusp sections are the kernel of restriction to the boundary coefficient sheaf.
api: TauCeti.Overconvergent.hilbert_cusp_forms.restrict: Radius, level and weight maps retaining the boundary ideal induce maps on cusp forms.
tests: TauCeti.Overconvergent.Test.O6_hilbert_cusp_forms_constant: At weight zero on a connected compactified component with nonempty boundary, the constant section 1 is not cuspidal.
tests: TauCeti.Overconvergent.Test.O6_hilbert_cusp_forms_elliptic: For F=Q the q-expansion of a cusp section has constant coefficient 0 at every cusp.
tests: TauCeti.Overconvergent.Test.O6_hilbert_cusp_forms_higherDegree: Koecher extension in g>1 does not make a nonzero boundary constant term vanish.
acceptance: On the supplied smooth toroidal compactification with boundary divisor D, define the subcanonical coefficient line ω^κ(−D)=ω^κ⊗I_D and cusp forms Sκ(n,N,ε;U)=H^0(ω^κ(−D)) on the admitted toroidal neighbourhood, with the corresponding integral lattice and positive-radius colimit. Arithmetic forms descend with the same boundary ideal.


OverconvergentAutomorphicForms:O6/hilbert-koecher — Koecher extension and cuspidality
TauCeti.Overconvergent.hilbert_koecher: For g>1, the supplied Hilbert Koecher theorem identifies interior coefficient sections with their extension to the minimal/toroidal compactified neighbourhood. Cusp sections are separately those vanishing along D. For g=1 use the compactified cusp/q-expansion calculation instead of a codimension≥2 Koecher claim. These identifications commute with the O5 comparison.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: Use C6’s normality, compactification maps and minimal-boundary codimension hypotheses; at g=1 the minimal boundary has codimension one.
prerequisites: OverconvergentAutomorphicForms:O6/hilbert-cusp-forms
prerequisites: ShimuraCompactifications:C6
prerequisites: AutomorphicBundles:B5/hilbert-cuspidal-boundary
prerequisites: OverconvergentAutomorphicForms:O5/aip-comparison-naturality
proofSteps: Apply AIP ADIC Proposition 8.4 through the exact Koecher package requested from C6: extend across minimal boundary of codimension at least two.
proofSteps: Compare the subcanonical sheaf by the ideal D, not by the extension theorem.
proofSteps: For degree one use B5’s compactified cusp expansion and its boundary constant term. O5 compares the coefficient lines on the compactified torsor.
acceptance: A section with nonzero q-constant term can extend by Koecher and still fail to be a cusp form.

OverconvergentAutomorphicForms:O6/tame-hilbert-hecke — Tame Hilbert Hecke operators
TauCeti.Overconvergent.tame_hilbert_hecke: For a prime ideal a∤pN and its moduli correspondence X_c←^{π1}C_a→^{π2}X_{ca}, use the canonical coefficient identification θ:π2*ω→π1*ω from the prime-to-p Hodge–Tate isogeny. Set T_a=q_a⁻¹Tr_{π1} θ π2*, q_a=|O_F/a|. It maps the ca component to c, preserves radii, extends to the boundary, and descends to arithmetic polarisation classes.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: π1 is finite locally free of degree q_a+1 for the prime cyclic-subgroup correspondence. The normalization is 1/q_a, not reciprocal degree.
prerequisites: OverconvergentAutomorphicForms:O4/polarisation-class-forms
prerequisites: OverconvergentAutomorphicForms:O2/hilbert-cocycle-law
prerequisites: HilbertModularVarietiesAndShimuraCurves:H3
prerequisites: ShimuraCompactifications:C6
prerequisites: AdicSpacesPartII:R3/pull-identify-trace
prerequisites: AdicSpacesPartII:R3/analytic-trace-finite-locally-free
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
prerequisites: HilbertModularVarietiesAndShimuraCurves:H1
prerequisites: HilbertModularVarietiesAndShimuraCurves:H4
proofSteps: Import the moduli correspondence and its compactified extension from H3/C6.
proofSteps: Use the prime-to-p isogeny to identify Hodge–Tate frames and their cocycles (BHW Lemma 10.1).
proofSteps: Apply AdicSpacesPartII R3 pull-identify-trace and finite locally free trace; multiply by q_a⁻¹. Since a∤p this normalization is an integral unit.
proofSteps: Use arithmetic descent and polarisation transport to define the same operator on the class-independent module.
api: TauCeti.Overconvergent.tame_hilbert_hecke.formula: T_a=q_a⁻¹Trπ1 θ π2*.
api: TauCeti.Overconvergent.tame_hilbert_hecke.component: The source polarisation ideal is ca and the target is c.
api: TauCeti.Overconvergent.tame_hilbert_hecke.integral: T_a preserves the specified integral lattice.
api: TauCeti.Overconvergent.tame_hilbert_hecke.cusp: The boundary-compatible correspondence preserves cusp forms.
tests: TauCeti.Overconvergent.Test.O6_tame_hilbert_hecke_weightZero: On the constant weight-zero section 1, T_a(1)=(q_a+1)/q_a.
tests: TauCeti.Overconvergent.Test.O6_tame_hilbert_hecke_normalisation: Averaging by 1/(q_a+1) would send 1 to 1 and is not BHW’s operator.
tests: TauCeti.Overconvergent.Test.O6_tame_hilbert_hecke_component: Changing a representative ca by a positive p-unit conjugates by P_x and leaves the arithmetic class operator unchanged.
acceptance: For a prime ideal a∤pN and its moduli correspondence X_c←^{π1}C_a→^{π2}X_{ca}, use the canonical coefficient identification θ:π2*ω→π1*ω from the prime-to-p Hodge–Tate isogeny. Set T_a=q_a⁻¹Tr_{π1} θ π2*, q_a=|O_F/a|. It maps the ca component to c, preserves radii, extends to the boundary, and descends to arithmetic polarisation classes.

OverconvergentAutomorphicForms:O6/wild-hilbert-hecke — Wild Hilbert Hecke operators
TauCeti.Overconvergent.wild_hilbert_hecke: For 𝔭|p, q_𝔭=|O_F/𝔭|, e=v_𝔭(p), finite n≥1 and l=ne+1, use the anticanonical extension correspondence with π1 degree q_𝔭 and π2 quotient by D[𝔭]. Let u_𝔭=diag(ϖ_𝔭,1); its action gives an integral coefficient map π2*ω+→π1*ω+ independently of the chosen generator of 𝔭O_p. Define U_𝔭=q_𝔭⁻¹Trπ1 θ_𝔭 π2*. It improves the 𝔭-partial Hasse bound, not all partial bounds in general.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: The actual extra level and anticanonical subgroup condition are C[𝔭^{en}]=D[𝔭^{en}]. The chosen domains must support this correspondence.
prerequisites: OverconvergentAutomorphicForms:O4/polarisation-class-forms
prerequisites: OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor
prerequisites: HilbertModularVarietiesAndShimuraCurves:H3
prerequisites: HodgeTateAndCanonicalSubgroups:T4
prerequisites: ShimuraCompactifications:C6
prerequisites: AdicSpacesPartII:R3/pull-identify-trace
prerequisites: AdicSpacesPartII:R3/analytic-trace-finite-locally-free
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
prerequisites: HilbertModularVarietiesAndShimuraCurves:H1
prerequisites: HilbertModularVarietiesAndShimuraCurves:H4
proofSteps: Import the p-level moduli correspondence, its degree and partial-radius image from H3/T4/C6.
proofSteps: Compute u_𝔭* z=ϖ_𝔭 z and conjugation γ↦(a,ϖb;ϖ⁻¹c,d); the cz+d factor is unchanged.
proofSteps: Changing ϖ by a unit changes the level action by a diagonal element with j=1, so the coefficient map agrees.
proofSteps: Apply finite locally free trace and the 1/q_𝔭 factor. This may require renormalization to preserve an integral lattice.
api: TauCeti.Overconvergent.wild_hilbert_hecke.formula: U_𝔭=q_𝔭⁻¹Trπ1 θ_𝔭 π2*.
api: TauCeti.Overconvergent.wild_hilbert_hecke.uniformiserIndependent: The coefficient map and resulting operator do not depend on ϖ_𝔭.
api: TauCeti.Overconvergent.wild_hilbert_hecke.partialRadius: The second projection lands in the supplied improved 𝔭-Hasse neighbourhood.
api: TauCeti.Overconvergent.wild_hilbert_hecke.cusp: Boundary-compatible quotient isogenies preserve the cusp submodule.
tests: TauCeti.Overconvergent.Test.O6_wild_hilbert_hecke_ellipticRadius: For F=Q the second projection lands in radius ε/p.
tests: TauCeti.Overconvergent.Test.O6_wild_hilbert_hecke_constant: At weight zero, U_p(1)=1 because π1 has degree p and the factor is 1/p.
tests: TauCeti.Overconvergent.Test.O6_wild_hilbert_hecke_individualCompactness: For a split p in degree>1, improvement in only one partial Hasse coordinate does not prove compactness on the simultaneous-radius Banach module.
acceptance: For 𝔭|p, q_𝔭=|O_F/𝔭|, e=v_𝔭(p), finite n≥1 and l=ne+1, use the anticanonical extension correspondence with π1 degree q_𝔭 and π2 quotient by D[𝔭]. Let u_𝔭=diag(ϖ_𝔭,1); its action gives an integral coefficient map π2*ω+→π1*ω+ independently of the chosen generator of 𝔭O_p. Define U_𝔭=q_𝔭⁻¹Trπ1 θ_𝔭 π2*. It improves the 𝔭-partial Hasse bound, not all partial bounds in general.


OverconvergentAutomorphicForms:O6/hilbert-diamond-operators — Hilbert diamond operators
TauCeti.Overconvergent.hilbert_diamond_operators: For a finite tame-level normalizer element d inducing a level automorphism on the actual Hilbert moduli scheme, define ⟨d⟩ by pullback of sections with the induced coefficient identification. The multiplication law is the one of that level action, with inverse-base-action convention fixed as in B5; boundary ideals and arithmetic polarisation descent are retained.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: Use a finite tame level automorphism, with its actual action on the coefficient torsor. This is separate from the central projective quotient and positive-unit polarisation action.
prerequisites: HilbertModularVarietiesAndShimuraCurves:H3
prerequisites: AutomorphicBundles:B5/hecke-section-operator
prerequisites: OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality
prerequisites: OverconvergentAutomorphicForms:O4/polarisation-choice-independence
prerequisites: ShimuraCompactifications:C6
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
prerequisites: HilbertModularVarietiesAndShimuraCurves:H1
prerequisites: HilbertModularVarietiesAndShimuraCurves:H4
proofSteps: Import the level automorphism and associated coefficient identification from H3 and B5.
proofSteps: Use O1 functoriality to obtain the section map. Compute identity/composition on the actual cover.
proofSteps: Boundary and polarisation compatibility allow restriction to cusp forms and descent to arithmetic classes.
api: TauCeti.Overconvergent.hilbert_diamond_operators.apply: Pullback through the level automorphism with its coefficient map.
api: TauCeti.Overconvergent.hilbert_diamond_operators.mul: Composition follows the fixed level-action convention.
api: TauCeti.Overconvergent.hilbert_diamond_operators.cusp: The induced map preserves vanishing on the boundary.
tests: TauCeti.Overconvergent.Test.O6_hilbert_diamond_operators_identity: ⟨1⟩ is the identity operator.
tests: TauCeti.Overconvergent.Test.O6_hilbert_diamond_operators_inverse: ⟨d⁻¹⟩ is inverse to ⟨d⟩.
tests: TauCeti.Overconvergent.Test.O6_hilbert_diamond_operators_polarisation: A positive-unit polarisation action is not renamed a tame diamond operator without matching the level moduli action.
acceptance: For a finite tame-level normalizer element d inducing a level automorphism on the actual Hilbert moduli scheme, define ⟨d⟩ by pullback of sections with the induced coefficient identification. The multiplication law is the one of that level action, with inverse-base-action convention fixed as in B5; boundary ideals and arithmetic polarisation descent are retained.

OverconvergentAutomorphicForms:O6/aip-hecke-equivariance — Hecke equivariance of the AIP comparison
TauCeti.Overconvergent.aip_hecke_equivariance: The geometric and arithmetic O5 integral/rational comparison maps intertwine tame T_a, finite tame diamond actions and wild U_𝔭 on their actual section modules, with the same q_a⁻¹ and q_𝔭⁻¹ factors. For wild operators the rational normalized action and integral renormalized action are distinguished.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: All correspondence and AIP chart hypotheses used above hold on the common source and target domains.
hypotheses: Inherit geometric-aip-comparison’s explicit T5 radius bound and scaled source-domain admission wherever the Hodge–Tate frame comparison is used, on both source and target of each comparison diagram.
prerequisites: OverconvergentAutomorphicForms:O5/geometric-aip-comparison
prerequisites: OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison
prerequisites: OverconvergentAutomorphicForms:O6/tame-hilbert-hecke
prerequisites: OverconvergentAutomorphicForms:O6/wild-hilbert-hecke
prerequisites: OverconvergentAutomorphicForms:O6/hilbert-diamond-operators
prerequisites: HodgeTateAndCanonicalSubgroups:T5
prerequisites: AdicSpacesPartII:R3/pull-identify-trace
proofSteps: For tame isogenies, naturality of the Hodge–Tate sequence makes the torsor frame diagram commute.
proofSteps: For wild isogenies, use the adjugate u_𝔭^∨ and u_𝔭^∨e1=e1 in the frame comparison; this identifies the perfectoid coefficient map with the AIP differential pullback.
proofSteps: Trace projection/base-change compatibility gives equality after the identical normalization. Arithmetic descent retains the pairing twist and polarisation action.
proofSteps: Degree-one finite level correspondences give the diamond compatibility.
acceptance: The comparison diagram uses exactly the same scalar normalizer on its two sides.


OverconvergentAutomorphicForms:O6/hilbert-q-expansion-comparison — Hilbert q-expansion compatibility
TauCeti.Overconvergent.hilbert_q_expansion_comparison: At each supplied compactified cusp, the O5 frame comparison identifies the perfectoid coefficient q-expansion with the AIP expansion. At algebraic weights it agrees with B5’s classical Hilbert expansion after converting κ_ar=(w,t) to (ν=w,w_AIP=t⁻¹) and matching B5’s coefficient line, cusp labels and Hecke normalization. Vanishing of every cusp constant term characterizes cuspidality in the supplied range.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: Use B5’s exact algebraic-weight, tame level and coefficient-ring hypotheses for its classical expansion principle; p-level/family expansions require the requested extension below.
prerequisites: OverconvergentAutomorphicForms:O5/aip-comparison-naturality
prerequisites: OverconvergentAutomorphicForms:O6/aip-hecke-equivariance
prerequisites: AutomorphicBundles:B5/hilbert-cusp-expansion
prerequisites: AutomorphicBundles:B5/hilbert-expansion-principle
prerequisites: AutomorphicBundles:B5/hilbert-cuspidal-boundary
prerequisites: AutomorphicBundles:B5/hecke-expansion-compatibility
prerequisites: AutomorphicBundles:B5
prerequisites: ShimuraCompactifications:C6
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Pull both coefficient sections to the same Tate semi-abelian cusp chart. T5’s chosen differential/HT frame evaluates to the same formal trivialization.
proofSteps: Use B5’s cusp-expansion and boundary criteria for classical specialisations; retain the coefficient line rather than pretending expansions are scalar at every cusp.
proofSteps: Use the separately requested bounded-family, p-level extension for the full coefficient sheaf. Compare correspondence expansions by the pull-identify-trace formula and the declared normalizers.
acceptance: For F=Q the cusp constant coefficient is zero precisely for cusp sections.
acceptance: A classical B5 theorem at prime-to-p full level is not applied directly to an arbitrary Iwahori family without the requested extension.

OverconvergentAutomorphicForms:O6/fixed-cusp-banach-modules — Fixed-radius cusp Banach modules
TauCeti.Overconvergent.fixed_cusp_banach_modules: At finite wild level and an admissible open affinoid U=Spa(A,A+) of the arithmetic weight space, with κ locally n_an-analytic and partial Hasse bounds 0<v_i<1/p^{n_an}, on a selected cofinal global-Hasse minimal affinoid neighbourhood inside the partial-radius region, the fixed-radius cusp module is a projective Banach A-module in the (Pr) sense: a continuous direct summand of an orthonormalisable Banach module. Weight specialisation to the source’s coefficient-field points is surjective. This is not finite projectivity, and no such claim is made for every noncuspidal or infinite-level section module.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: Use the sufficiently small tame level, compactified coefficient model, positive cofinal partial-radius range and finite-level cusp vanishing hypotheses of AIP CUSP Theorems 3.16 and 4.4. For arithmetic descent work in characteristic zero, where the finite Δ projector is defined.
hypotheses: Choose the refined global-Hasse strict affinoid neighbourhood of AIP CUSP Proposition 3.22’s Hattori footnote. Arbitrary simultaneous partial-radius opens are not assumed affinoid.
hypotheses: For direct use of AIP CUSP Theorem4.4, U is an admissible open affinoid of the arithmetic weight space, not an arbitrary bounded affinoid mapping to it. At finite wild level use the O2 Atkin–Lehner transport to tame level, with the scaled radius and boundary-compatible coefficient transport supplied by C6; arbitrary weight base change requires a separate completed scalar-extension theorem.
prerequisites: OverconvergentAutomorphicForms:O6/hilbert-cusp-forms
prerequisites: OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison
prerequisites: ShimuraCompactifications:C6
prerequisites: LocallyAnalyticDistributions:L4/projective-banach-modules
prerequisites: OverconvergentAutomorphicForms:O6/cuspidal-coefficient-vanishing
prerequisites: OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps
proofSteps: Use O5/O6 cusp comparisons to identify the fixed-radius cusp module with AIP’s compactified coefficient module.
proofSteps: Apply AIP CUSP Theorem4.4 on its admissible open arithmetic weight affinoid, retaining its finite characteristic-zero Δ projector and proof via Theorem3.16. For finite wild level first transport to the corresponding tame-level module by O2’s Atkin–Lehner isomorphism, with scaled radius and C6’s boundary transport. The theorem is not cited for an arbitrary affinoid weight pullback.
proofSteps: Use cuspidal-coefficient-vanishing on the actual finite-level formal cusp model. The cofinal global-Hasse refinement supplies affinoid acyclicity; the p-complete free local coefficient modules and split exact Cech resolution give (Pr).
proofSteps: Use LAD L4’s projective Banach terminology and scalar-extension results only within their exact hypotheses.
acceptance: For F=Q an infinite-dimensional fixed-radius cusp module may satisfy (Pr) without being finite projective over A.
acceptance: The statement excludes ε=0 and infinite wild level.


OverconvergentAutomorphicForms:O6/compact-radius-restriction — Compact restriction of cusp forms
TauCeti.Overconvergent.compact_radius_restriction: For finite-level fixed cusp Banach modules on nested admissible minimal affinoid neighbourhoods V⋐_U W with coherent pushed-forward cusp coefficient, restriction S(W)→S(V) is completely continuous in the nonarchimedean finite-rank-approximation sense used by LAD L4. It is not justified merely by continuity or by compactness of a topological image over a general affinoid algebra.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: Use C6’s coherent cusp pushforward and the relative compactness W,V required by AdicSpacesPartII:R3. Source S(W) satisfies (Pr).
hypotheses: Choose the same cofinal global-Hasse affinoid models as fixed-cusp-banach-modules, with the required relative compact containment after the controlling radius improvement.
hypotheses: Use the admissible open arithmetic weight affinoid of fixed-cusp-banach-modules. An arbitrary bounded affinoid weight pullback needs a separate completed scalar-extension result preserving (Pr).
prerequisites: OverconvergentAutomorphicForms:O6/fixed-cusp-banach-modules
prerequisites: AdicSpacesPartII:R3/restriction-strictly-completely-continuous
prerequisites: LocallyAnalyticDistributions:L4/completely-continuous
prerequisites: ShimuraCompactifications:C6
proofSteps: Apply AdicSpacesPartII:R3/restriction-strictly-completely-continuous to the coherent sections: after a continuous surjection from a topologically free Banach module, the restriction is strictly completely continuous.
proofSteps: Use the (Pr) splitting of fixed-cusp-banach-modules to remove that presentation; finite-rank approximation is preserved under bounded pre/post composition.
proofSteps: Use LAD L4/completely-continuous for the exact operator notion. For the controlling product choose V at improved partial radius v/p.
acceptance: Restriction along an equality of domains is the identity and is not completely continuous on an infinite orthonormalisable module.


OverconvergentAutomorphicForms:O6/controlling-hilbert-operator — Controlling Hilbert U operator
TauCeti.Overconvergent.controlling_hilbert_operator: On finite-level arithmetic cusp forms over a bounded affinoid family define U_p=∏_{𝔭|p}U_𝔭^{e_𝔭}, e_𝔭=v_𝔭(p), using the commuting arithmetic operators and polarisation transports. The product maps through the neighbourhood with every partial Hasse bound v_i/p; its total normalizer is (∏q_𝔭^{e_𝔭})⁻¹=p^(−g).
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: Use compatible finite-level partial-radius correspondences and a fixed positive radius vector v. The arithmetic class quotient gives a canonical endomorphism; G* requires the stated polarisation representative maps.
hypotheses: Choose the same cofinal global-Hasse affinoid models as fixed-cusp-banach-modules, with the required relative compact containment after the controlling radius improvement.
prerequisites: OverconvergentAutomorphicForms:O6/wild-hilbert-hecke
prerequisites: OverconvergentAutomorphicForms:O4/polarisation-choice-independence
prerequisites: HilbertModularVarietiesAndShimuraCurves:H3
prerequisites: HodgeTateAndCanonicalSubgroups:T4
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Compose wild operators with multiplicities e_𝔭. Their quotient isogenies cover all primes above p and their combined radius gain is division by p in each coordinate (AIP Lemma 3.25(4)).
proofSteps: Use arithmetic polarisation-choice-independence to identify the final pc component with c.
proofSteps: Compute ∏q_𝔭^{e_𝔭}=p^{∑e_𝔭f_𝔭}=p^g; retain that normalizer.
api: TauCeti.Overconvergent.controlling_hilbert_operator.product: U_p=∏U_𝔭^{e_𝔭}, with compatible arithmetic polarisation identifications.
api: TauCeti.Overconvergent.controlling_hilbert_operator.radiusFactorisation: Factor S(v)→S(v/p)→S(v), where the first map is restriction and the second the bounded correspondence action.
api: TauCeti.Overconvergent.controlling_hilbert_operator.normalizer: The product scalar factor is p^(−g).
tests: TauCeti.Overconvergent.Test.O6_controlling_hilbert_operator_rational: For F=Q this is the usual single U_p with normalizer 1/p.
tests: TauCeti.Overconvergent.Test.O6_controlling_hilbert_operator_ramification: If p is totally ramified of degree g, the controlling operator is U_𝔭^g, not just U_𝔭.
tests: TauCeti.Overconvergent.Test.O6_controlling_hilbert_operator_split: For a split prime in a quadratic field it is U_𝔭1 U_𝔭2 with normalizer p⁻².
acceptance: On finite-level arithmetic cusp forms over a bounded affinoid family define U_p=∏_{𝔭|p}U_𝔭^{e_𝔭}, e_𝔭=v_𝔭(p), using the commuting arithmetic operators and polarisation transports. The product maps through the neighbourhood with every partial Hasse bound v_i/p; its total normalizer is (∏q_𝔭^{e_𝔭})⁻¹=p^(−g).

OverconvergentAutomorphicForms:O6/controlling-complete-continuity — Complete continuity of the controlling operator
TauCeti.Overconvergent.controlling_complete_continuity: The controlling U_p on the specified finite-level, fixed positive-radius cusp Banach A-module is completely continuous. For G* include its fixed representative comparisons. The proof is the actual radius factorisation through the compact restriction of O6; no compactness claim for every individual U_𝔭 or for the ε=0/infinite-level space is included.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: Use all hypotheses of fixed-cusp-banach-modules, compact-radius-restriction and controlling-hilbert-operator.
hypotheses: Choose the same cofinal global-Hasse affinoid models as fixed-cusp-banach-modules, with the required relative compact containment after the controlling radius improvement.
prerequisites: OverconvergentAutomorphicForms:O6/controlling-hilbert-operator
prerequisites: OverconvergentAutomorphicForms:O6/compact-radius-restriction
prerequisites: OverconvergentAutomorphicForms:O6/aip-hecke-equivariance
prerequisites: LocallyAnalyticDistributions:L4/completely-continuous
proofSteps: Use U_p=bounded correspondence map ∘ restriction S(v)→S(v/p).
proofSteps: Apply compact-radius-restriction and stability of complete continuity under bounded composition from LAD L4.
proofSteps: O6 AIP Hecke equivariance gives the same factorisation as AIP CUSP Lemma 3.27, including normalization and polarisation choices.
acceptance: At F=Q the factorisation passes through radius v/p.
acceptance: An individual split-prime operator improves only one direction, so this proof does not apply to it.

OverconvergentAutomorphicForms:O6/hecke-lattice-renormalisation — Integral renormalisation of wild Hecke operators
TauCeti.Overconvergent.hecke_lattice_renormalisation: T_a preserves the specified integral lattice. Each q_𝔭 U_𝔭 preserves it, and p^g U_p preserves it because ∏q_𝔭^{e_𝔭}=p^g. These are sufficient uniform renormalizations on the stated domains, not assertions of optimality or integrality of the rational normalized U_𝔭 for every weight.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: Use integral coefficient maps, trace preserving O+ on the supplied finite locally free integral correspondence models, and integral polarisation transport.
prerequisites: OverconvergentAutomorphicForms:O6/tame-hilbert-hecke
prerequisites: OverconvergentAutomorphicForms:O6/wild-hilbert-hecke
prerequisites: OverconvergentAutomorphicForms:O6/controlling-hilbert-operator
prerequisites: AdicSpacesPartII:R3/analytic-trace-finite-locally-free
prerequisites: PerfectoidSpaces:P9
prerequisites: HilbertModularVarietiesAndShimuraCurves:H4
proofSteps: Tame normalizers q_a are p-adic units, so the integral pull-identify-trace map remains integral.
proofSteps: For a wild factor remove 1/q_𝔭; its coefficient map and integral trace preserve the lattice.
proofSteps: Compose the renormalized factors and use the degree/norm identity of controlling-hilbert-operator; arithmetic integral transport preserves the lattice.
acceptance: For F=Q the sufficient renormalization is pU_p.
acceptance: Tame integral preservation alone cannot prove normalized wild integral preservation.

OverconvergentAutomorphicForms:O7/ordinary-completed-functions — Completed ordinary Igusa functions
TauCeti.Overconvergent.ordinary_completed_functions: On each ordinary formal affinoid patch define V+ = lim_m colim_i H^0(Ig_i,O/p^m), with i the finite Igusa level. Sheafify the compatible patchwise construction to obtain the completed Igusa structural sheaf; V=V+[1/p]. Global ordinary p-adic forms are its sheaf sections. Do not exchange the two limits or replace sheafwise completion by an unconditional global-section formula.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Use T5’s actual ordinary formal Igusa tower with finite-etale transition maps. The inverse limit defines the formal completed structural ring; an identification with the actual analytic tower O+ is the separate O7 comparison target, with the exact hypotheses still recorded as a gap.
prerequisites: HodgeTateAndCanonicalSubgroups:T5
prerequisites: PerfectoidSpaces:P9
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Reduce the finite Igusa tower modulo p^m and form its direct limit in level first.
proofSteps: Take the p-adic inverse limit with its inverse-limit topology; this constructs formal completed tower functions. Do not identify it with analytic O+ merely from Heuer Proposition 3.8’s natural map.
proofSteps: Glue and sheafify over the ordinary formal base. Any global-limit interchange on a nonaffine space requires separate acyclicity/Mittag–Leffler hypotheses.
api: TauCeti.Overconvergent.ordinary_completed_functions.modPower: Projection to colim_i O(Ig_i)/p^m.
api: TauCeti.Overconvergent.ordinary_completed_functions.levelAction: The compatible finite-level deck actions give a continuous completed tower action.
api: TauCeti.Overconvergent.ordinary_completed_functions.restriction: Restriction between formal patches commutes with both stated limit maps.
api: TauCeti.Overconvergent.ordinary_completed_functions.rationalise: V+→V+[1/p].
tests: TauCeti.Overconvergent.Test.O7_ordinary_completed_functions_order: For the constant profinite translation tower with deck group Z_p, the m-th quotient is Map_lc(Z_p,Z/p^m); the compatible functions x↦x mod p^m define the completed continuous function x↦x, which factors through no single finite level over Z_p.
tests: TauCeti.Overconvergent.Test.O7_ordinary_completed_functions_trivialTower: For a constant affine tower Spf R, the construction is the p-adic completion lim_m R/p^m.
tests: TauCeti.Overconvergent.Test.O7_ordinary_completed_functions_nonaffine: On a disjoint union of points indexed by n≥1 with a Z_p-torsor on each, the section whose nth component is the nth p-adic digit is locally in the finite-level mod-p structural colimit but has no uniform finite level globally. Thus sheafifying the level colimit before global sections cannot be replaced by a single global level colimit on this non-quasicompact base.
acceptance: On each ordinary formal affinoid patch define V+ = lim_m colim_i H^0(Ig_i,O/p^m), with i the finite Igusa level. Sheafify the compatible patchwise construction to obtain the completed Igusa structural sheaf; V=V+[1/p]. Global ordinary p-adic forms are its sheaf sections. Do not exchange the two limits or replace sheafwise completion by an unconditional global-section formula.

OverconvergentAutomorphicForms:O7/ordinary-weighted-forms — Weighted ordinary Igusa forms
TauCeti.Overconvergent.ordinary_weighted_forms: For the continuous bounded integral weight κ, define ordinary geometric forms as the completed Igusa functions satisfying f(tu)=κ(u)⁻¹f(t), for the actual O_p^× deck action. Arithmetic ordinary forms retain the w-polarisation/determinant action and its descent exactly as O4. Coefficients and topology are completed before taking this weight equalizer.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Use compatible integral weight coefficients: modulo p^m the character is locally constant and factors through a finite quotient on each fixed affinoid formal patch.
prerequisites: OverconvergentAutomorphicForms:O7/ordinary-completed-functions
prerequisites: OverconvergentAutomorphicForms:O0/bounded-weight-families
prerequisites: OverconvergentAutomorphicForms:O4/twisted-polarisation-action
prerequisites: OverconvergentAutomorphicForms:O4/weil-pairing-comparison
prerequisites: HodgeTateAndCanonicalSubgroups:T5
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Construct the weight equalizer in the already completed Igusa structural sheaf.
proofSteps: Continuity of κ makes the finite reductions compatible; no single Igusa level is claimed to support every continuous character.
proofSteps: Use the same twisted finite polarisation descent and Weil-pairing transformation for the arithmetic forms.
api: TauCeti.Overconvergent.ordinary_weighted_forms.weightRelation: f(tu)=κ(u)⁻¹f(t).
api: TauCeti.Overconvergent.ordinary_weighted_forms.integralInclusion: The integral weighted equalizer maps to its rationalized sheaf.
api: TauCeti.Overconvergent.ordinary_weighted_forms.weightPullback: Compatible base/weight pullback induces the weighted ordinary coefficient map.
api: TauCeti.Overconvergent.ordinary_weighted_forms.arithmeticDescent: Retain the finite twisted Δ action and the full pairing character when passing to arithmetic forms.
tests: TauCeti.Overconvergent.Test.O7_ordinary_weighted_forms_trivial: κ=1 gives deck-invariant completed functions.
tests: TauCeti.Overconvergent.Test.O7_ordinary_weighted_forms_sign: For κ(u)=u^k in the elliptic case, the relation is f(tu)=u^(−k)f(t).
tests: TauCeti.Overconvergent.Test.O7_ordinary_weighted_forms_conductor: A character of arbitrarily large conductor cannot be imposed as equivariance on one fixed small finite Igusa level.
acceptance: For the continuous bounded integral weight κ, define ordinary geometric forms as the completed Igusa functions satisfying f(tu)=κ(u)⁻¹f(t), for the actual O_p^× deck action. Arithmetic ordinary forms retain the w-polarisation/determinant action and its descent exactly as O4. Coefficients and topology are completed before taking this weight equalizer.

OverconvergentAutomorphicForms:O7/igusa-completion-comparison — Igusa completion comparison
TauCeti.Overconvergent.igusa_completion_comparison: For the actual ordinary formal affine Igusa tower, take the direct limit in finite level modulo p^m and then the inverse limit in m. Under the finite-level good-reduction and analytic completion contracts below, the natural map identifies this ordered completion with analytic tower O+, equivariantly and compatibly with formal-patch restriction. Compatible weight lattices may be completed by the specified coefficient construction; this does not identify every completed lattice tensor with geometric O+ of a weight product.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: The ordinary base formal patch is flat, topologically of finite presentation, and formally smooth over the integral coefficient ring. Its finite Igusa covers are finite étale and surjective, so the ordinary finite-level special fibres are geometrically reduced. Use the open ordinary Rapoport moduli locus: arbitrary normalized positive-radius models are not included.
hypotheses: For each finite level put A_i=O(Ig_i,an) with its uniform spectral norm and R_i=O(𝔐_i). T5/P9 supplies the finite-level good-reduction identity R_i={a:‖a‖≤1}, also after the coefficient-field extension. Pullback A_i→A_j is isometric, as its analytic map is surjective.
hypotheses: P9 supplies the analytic affine tower with function ring A∞ equal to the separated spectral-norm completion of colim_i A_i and structural O+ equal to its power-bounded subring. Restrict on a compatible formal-affine basis. An infinite Igusa tower is not assumed perfectoid merely because its base field is perfectoid.
hypotheses: For coefficient/weight completion retain the prescribed bounded lattice and P9’s reduction/restriction contract. Arbitrary weights need not have a good-reduction integral model, and geometric O+ is not identified with a lattice tensor without a separate comparison.
prerequisites: OverconvergentAutomorphicForms:O7/ordinary-completed-functions
prerequisites: PerfectoidSpaces:P9
prerequisites: HodgeTateAndCanonicalSubgroups:T5
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: AIP §7.1 p30 makes the ordinary finite-level Igusa covers finite étale over the smooth ordinary special fibre. The ordinary discussion in §8.4 p37 places them in the Rapoport locus. T5 must lift these facts to the actual flat formally smooth ordinary charts and finite étale integral covers used by O7, including the coefficient-field base extension.
proofSteps: At a discretely valued model with uniformizer π, reduced special fibre gives the elementary norm argument: if a∉πR_i, its nonzero reduction has no nilpotent power, hence ‖a^k‖=1 for all k. After π-scaling this proves the π-adic norm is power-multiplicative and R_i is exactly the unit ball of A_i. The extension to the specified coefficient field is a finite-level good-reduction base-change contract at P9; normality alone is not substituted for this contract.
proofSteps: Take the isometric union of the A_i. Its norm is power-multiplicative, hence so is the norm on its separated completion A∞. Consequently its power-bounded subring equals its unit ball.
proofSteps: Every element of the unit ball of A∞ can be approximated with error <1 by a finite-level element b. The ultrametric inequality makes ‖b‖≤1, so b∈R_i by the finite-level identity. Repeating to errors |p|^m shows that the unit ball is the p-adic completion of colim_i R_i. The p-adic and norm topologies agree on these integral rings, since p^m times the unit ball is the ball of radius |p|^m. Thus that completion is lim_m colim_i R_i/p^m, in exactly this order.
proofSteps: This proves the natural map is an isomorphism once the explicitly requested finite-level good-reduction/base-change and analytic tower contracts are supplied. Heuer Proposition3.8 alone gives only the map and formal-cocycle effectivity, not these contracts.
proofSteps: Check actions and restrictions at finite level; their continuous extensions give equivariance and glue the comparison. For weighted reductions use the compatible coefficient-lattice contract separately. No nonaffine global-section or limit interchange is invoked.
acceptance: The finite-level unit-ball identity and isometric transitions are checked before completion.
acceptance: The completed norm remains power-multiplicative; a unit-ball approximant has integral finite-level coefficients.
acceptance: The constant model O_K⟨pT,T²,T³⟩ fails the reduced-fibre/unit-ball hypothesis: T² is bounded, but T is power-bounded and not a structural formal function.
acceptance: A non-quasicompact ordinary base retains patchwise sheafification; no uniform global finite level is inferred.

OverconvergentAutomorphicForms:O7/ordinary-restriction — Restriction to ordinary Igusa forms
TauCeti.Overconvergent.ordinary_restriction: Restrict a fixed positive-radius geometric/arithmetic form to the ordinary locus and pull back to its Igusa frame, producing its weighted completed Igusa function. The maps are compatible with positive-radius restrictions and therefore give Mκ†→ordinary Igusa forms, with integral and cusp versions. No surjectivity onto all ordinary forms is part of this map.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
hypotheses: Use the ordinary torsor frame comparison of T5 and O5. The map on integral sections uses the actual completed structural sheaf comparison.
prerequisites: OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms
prerequisites: OverconvergentAutomorphicForms:O7/ordinary-weighted-forms
prerequisites: OverconvergentAutomorphicForms:O7/igusa-completion-comparison
prerequisites: OverconvergentAutomorphicForms:O5/aip-comparison-naturality
prerequisites: HodgeTateAndCanonicalSubgroups:T5
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: Restrict the coefficient section to ε=0.
proofSteps: Pull to the ordinary Igusa torsor and evaluate using the selected differential/HT frame; its transformation is precisely the inverse weight relation.
proofSteps: Apply igusa-completion-comparison to identify the integral function, retain arithmetic twists, and use the positive-radius colimit universal property.
api: TauCeti.Overconvergent.ordinary_restriction.ofRadius: The colimit map on a positive-radius representative is restriction to the ordinary locus.
api: TauCeti.Overconvergent.ordinary_restriction.integral: The map preserves the integral weighted sheaf.
api: TauCeti.Overconvergent.ordinary_restriction.cusp: Boundary vanishing is retained on ordinary cusp charts.
api: TauCeti.Overconvergent.ordinary_restriction.levelWeight: The map commutes with compatible level and weight changes.
tests: TauCeti.Overconvergent.Test.O7_ordinary_restriction_representatives: Two colimit representatives agreeing on a smaller positive radius have the same ordinary image.
tests: TauCeti.Overconvergent.Test.O7_ordinary_restriction_trivial: A weight-zero constant section restricts to the same constant Igusa function.
tests: TauCeti.Overconvergent.Test.O7_ordinary_restriction_wholeSpace: An ordinary function without any positive-radius extension is not declared an overconvergent form.
acceptance: Restrict a fixed positive-radius geometric/arithmetic form to the ordinary locus and pull back to its Igusa frame, producing its weighted completed Igusa function. The maps are compatible with positive-radius restrictions and therefore give Mκ†→ordinary Igusa forms, with integral and cusp versions. No surjectivity onto all ordinary forms is part of this map.

OverconvergentAutomorphicForms:O7/ordinary-coefficient-comparison — Ordinary coefficient comparison
TauCeti.Overconvergent.ordinary_coefficient_comparison: The ε=0 perfectoid/AIP integral coefficient sheaf identifies with the weighted completed Igusa sheaf through the ordinary differential frame and its formal cocycle descent. Arithmetic comparison retains w(eβ)⁻¹ and twisted finite Δ(N)-descent. This identifies ordinary coefficient models, not the entire positive-radius overconvergent space with ordinary Hida forms.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Use actual ordinary formal torsor and the completion comparison on patches; κ is bounded with integral unit values.
prerequisites: OverconvergentAutomorphicForms:O7/ordinary-weighted-forms
prerequisites: OverconvergentAutomorphicForms:O7/igusa-completion-comparison
prerequisites: OverconvergentAutomorphicForms:O5/geometric-aip-comparison
prerequisites: OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison
prerequisites: OverconvergentAutomorphicForms:O1/analytic-line-effectivity
prerequisites: HodgeTateAndCanonicalSubgroups:T5
prerequisites: AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
proofSteps: On each ordinary formal patch the HT frame and modified differential frame coincide through T5.
proofSteps: Use O1 analytic-line-effectivity’s formal Igusa descent theorem to identify the weighted completed functions with the coefficient line.
proofSteps: Apply the O4 pairing and finite twisted descent to the arithmetic model; glue by the selected frame’s uniqueness.
proofSteps: Use O5’s integral comparison as an isomorphism of the specified O+ equalizers. Any claim of full-character positive-radius local freeness additionally requires the separate unit-trivialization input of O5/aip-line-and-gluing.
acceptance: For an algebraic elliptic weight this is the usual ordinary differential trivialization of ω^k.

OverconvergentAutomorphicForms:O7/ordinary-hecke-expansions — Ordinary Hecke and expansion compatibility
TauCeti.Overconvergent.ordinary_hecke_expansions: Ordinary restriction and the ordinary coefficient comparison commute with compatible weight/level/radius maps, normalized tame T_a, diamonds and wild U_𝔭 on the supplied ordinary correspondences, and with all supplied cusp q-expansions. Cusp forms remain cusp forms and integral renormalized operators obey the same comparison.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Use the compactified ordinary correspondence, expansion and integral-trace inputs requested for O6; retain the same normalizers and arithmetic transport.
prerequisites: OverconvergentAutomorphicForms:O7/ordinary-restriction
prerequisites: OverconvergentAutomorphicForms:O7/ordinary-coefficient-comparison
prerequisites: OverconvergentAutomorphicForms:O6/aip-hecke-equivariance
prerequisites: OverconvergentAutomorphicForms:O6/hilbert-q-expansion-comparison
prerequisites: OverconvergentAutomorphicForms:O6/hecke-lattice-renormalisation
prerequisites: PerfectoidSpaces:P9
proofSteps: Restrict the O6 isogeny/torsor diagrams to the ordinary locus; the Igusa frame is the restriction of their tautological frame.
proofSteps: Finite-level reductions commute with the supplied correspondence maps and trace. Take completion in the established order to obtain the ordinary diagrams.
proofSteps: On Tate cusp charts the same coefficient trivialization gives the same q-series; arithmetic twists and the boundary ideal persist under descent.
acceptance: In the elliptic case ordinary and overconvergent restriction have the same q-expansion at each ordinary cusp.
acceptance: No assertion of equality of all ordinary and finite-slope overconvergent spaces follows.

OverconvergentAutomorphicForms:O6/cuspidal-coefficient-vanishing — Cuspidal coefficient pushforward vanishing
TauCeti.Overconvergent.cuspidal_coefficient_vanishing: For the supplied toroidal-to-minimal map ρ at the finite Igusa/p-level formal model and the small analytic coefficient Ωχ, R^qρ_*Ωχ(−D)=0 for q>0; the untwisted structural assertion is R^qρ_*O(−D)=0. After the permitted base changes, the pushed-forward cusp coefficient is coherent and gives the acyclic affinoid section model used for (Pr) and specialisation.
hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes.
hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity.
hypotheses: A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
hypotheses: Use the precise formal Igusa normalization, boundary divisor and sufficiently small analytic character χ of AIP CUSP §3.6. The formal cusp vanishing input from the fan/unit quotient is the recorded missing compactification theorem.
hypotheses: The chosen minimal neighbourhood is an actual global-Hasse affinoid strict neighbourhood inside the partial-radius region; AIP CUSP Proposition 3.22’s Hattori footnote explicitly requires this refinement.
prerequisites: ShimuraCompactifications:C6
prerequisites: AdicSpacesPartII:R3/tate-acyclicity-finite-modules
prerequisites: OverconvergentAutomorphicForms:O5/aip-line-and-gluing
proofSteps: Use the formal cusp description supplied by C6: the completed torus embedding fan modulo its unit group, with positive support for O(−D).
proofSteps: The formal-functions theorem reduces higher direct-image vanishing to cohomology of those cusp fibres; AIP CUSP Appendix Proposition 6.4 gives the required fan/unit-quotient vanishing. This auxiliary theorem is recorded as a Part II owner gap, not presumed from a compactification alone.
proofSteps: AIP Lemma 3.19 identifies the small analytic character line modulo p with O. Lift the structural vanishing by p-adic completeness/Nakayama as in Corollary 3.20.
proofSteps: On the refined minimal affinoid use AdicSpacesPartII R3 finite-module Tate acyclicity; apply finite characteristic-zero projectors only after rationalisation.
acceptance: The argument uses −D and is not asserted for every noncuspidal coefficient sheaf.

Exact remaining inputs:
Jacquet–Emerton eigenvariety and unitary regularity owner: No existing stage/node covers Emerton analytic vectors and J_B, the full T(K)-character functor with unramified coordinates, coherent strong-dual support, definite-unitary admissibility/local regularity with s≥1, its dimension/depth theorem and classical-density reducedness. PadicFamilies L2a is the Buzzard compact-operator engine; CC.8 is only the completed topological adapter. Proposed Part II: PadicFamilies, Part II: Jacquet-module eigenvarieties, starting with these two existing packages and compact-torus characters. The Ding source proof leaves require the precise BHS/Emerton theorem statements before implementation.
Cuspidal formal cohomology beyond compactification geometry: C6 supplies geometry but has no exact node for the formal toric fan/unit quotient cusp vanishing of AIP CUSP Appendix Proposition6.4 and Theorem3.17, nor the theorem-on-formal-functions adapter. Proposed Part II: ShimuraCompactifications, Part II: Hilbert cusp cohomology, with the structural R^qρ_*O(−D)=0 input. O6 then proves the analytic coefficient lift and (Pr) application. The author-noted global-Hasse affinoid refinement must remain in the fixed-radius statement.
Numerical comparison of weight charts and radius ranges: A common positive radius follows from the requested universal-coordinate analytic extension and canonical subgroup bounds. No valid scalar replacement for BHW rκ=|p|^r0|Tκ| was established; E3 disproves it even after the pro-p supremum correction. Implementation must use AIP coordinate charts/admitted inequalities, or prove a separate quantitative radius theorem; no guessed closed formula is a prerequisite here.
O0 prototype carriers from suppliers: The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised.
O1 prototype carriers from suppliers: The algebraic RightCocycle core, equivariant submodule, gauge equivalence and left-to-right conversion are typed in the suggested file. The actual analytic coefficient ringed site, torsor, analytic function and stable-lattice conditions are absent from the pinned libraries and remain precise supplier-dependent signature omissions; no Prop-valued replacement is introduced.
O2 prototype carriers from suppliers: The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised.
O3 prototype carriers from suppliers: The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised.
O4 prototype carriers from suppliers: The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised.
O5 prototype carriers from suppliers: The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised. The suggested file types the normed-field translation test and the algebraic invariant-ring/unit-generator criterion; these scalar tests do not supply an analytic torsor or its local integral generators.
O6 prototype carriers from suppliers: The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised.
O7 prototype carriers from suppliers: The pinned libraries lack the actual rigid analytic chart/induction, Hilbert moduli tower, torsor, adic ringed coefficient site or completed ordinary carrier required by these statements. Their complete mathematical signatures, API and test contracts are recorded in the suggested-file omission register, with the named supplier prerequisites above. No Prop-valued substitute or fake geometric carrier is introduced. Replace register entries by typed signatures as the suppliers are formalised. The suggested file types the power-multiplicative norm step and a polynomial seed of the nonnormal-model counterexample. The seed is not a Tate algebra or a formal Igusa model.
Full finite-character positive-radius integral freeness: AIP ADIC Propositions4.3/4.7 pp16–18 prove universal-character formal freeness; §6.4 p29 adds wχ, coherent and invertible on the ordinary locus and rational fibre. Positive-radius full-character analytic O+ freeness still requires base-local unit-valued torsor eigenfunctions and unit chart ratios. The T5/P9 request must identify the normalized finite-Igusa lattice, including p-primary χ, and prove this exact unit criterion or a coefficient-sensitive freeness theorem. O5 now proves the isomorphism of integral equalizers by rational comparison and valuative boundedness without this freeness premise. Thus the gap concerns freeness, not that integral isomorphism. Algebraic twisting alone is insufficient: it must compare the modified differential lattice on the actual Igusa cover and its base descent. No claim that the published theorem is false is made. The existing P9 completed-lattice-tensor unit criterion is only an algebraic model: its geometric O+ weight-product variant requires the requested invariant-function descent and must not be inferred by identifying the two coefficient objects.
Ordinary good-reduction model and analytic tower contracts: O7 supplies the completion/unit-ball argument, using reduced special fibres at a discretely valued model and isometric finite-level maps. T5 must identify the actual ordinary formal charts as flat formally smooth with finite étale surjective Igusa covers, also after the stated base extension. P9 must supply R_i=A_i° after this extension and the analytic tower completion A∞=completion(colim A_i), with compatible formal-patch restrictions. These are exact verifiable hypotheses, not a consequence of Heuer3.8’s natural map or of normality alone. Arbitrary weight tensors additionally need their separate compatible lattice comparison. The argument does not assert that the Igusa tower is perfectoid.

Supplier requests:
PadicMeasuresIwasawaAlgebras:L0a: Universal rigid character spaces and characters for O_p^× and O_p^××Z_p^×; represent the continuous-character functors on affinoid algebras, pull back along x↦(x²,N(x)⁻¹), and provide bounded affinoid-image families. For Ding only compact T(O_K) coordinates are requested here, not a new noncompact character theory.
LocallyAnalyticDistributions:L0: Multivariable analytic Banach functions on finite-product local-integer balls and compact Levi/Iwahori thickenings, Gauss norms, analytic orbit maps, locally uniform extension of continuous multiplicative characters on affinoid families as in AIP ADIC Proposition 2.8, uniqueness on products of Z_p lattices, LB restriction colimits and strong continuous dual topology. The printed scalar formula of BHW Prop.6.3 is excluded.
AutomorphicBundles:B4: Algebraic Hilbert differential eigensummands and determinant conventions; algebraic induced Levi representation associated bundles and their conversion to the O1 right/inverse convention. Existing B4 nodes were screened; no exact node supplies the requested p-adic-torsor comparison statement.
AutomorphicBundles:B5: Extend the exact classical Hilbert cusp-expansion/principle/boundary nodes to the compactified p-level bounded analytic families used here, retaining the cusp coefficient line, connectedness/base hypotheses, finite-level character twist and the 1/q isogeny trace normalization. Classical prime-to-p expansion nodes alone do not supply this extension.
PerfectoidSpaces:P9: Actual sheafwise O and O+ function descent on the indicated profinite Hilbert/Igusa torsors, also on all opens of the smooth weight product (product affinoids alone are insufficient); coefficient-sensitive functoriality, local O+[1/p]=O and integral trace preservation for the stated formal correspondences. For the actual analytic AIP B_n frame torsor additionally supply ((g_n f_n)_*O+)^{B_n}=O+ on all base opens; B_n is not merely a profinite deck group. Supply the geometric O+ sheaf version of the integral-coboundary unit criterion on all weight-product opens. The existing named theorem concerns a completed lattice tensor, which is not identified with geometric product O+. For rationalisation supply quasicompact inverse-image patches and local O+[1/p]=O there, so a finite cover gives one p-denominator for an equivariant function. For O5 check valued-point lifting/reflection of O+ bounds along the actual tower: every AIP frame after a valued extension is a B_m-translate of a lifted Hodge–Tate frame, and the multiplier and inverse are valuation units. This supplies the integral-equalizer comparison without freeness. Full-character positive-radius freeness is a distinct request for base-local unit eigenfunctions and unit transitions, including the normalized finite-Igusa factor. For O7 supply the finite-level good-reduction identity R_i=A_i° after coefficient extension, isometric transitions, and a sheafy analytic affine tower with A∞ the separated spectral-norm completion of colim_i A_i; restriction on the compatible formal-affine basis must agree. O7’s norm proof then identifies the ordered p-adic completion with A∞°. Keep weight-lattice completion separate from geometric product O+. Heuer3.8 is used for formal-unit cocycles and its natural map only.
HodgeTateAndCanonicalSubgroups:T4: Hilbert canonical/anticanonical domains at arbitrary p including ramification; actual Hodge–Tate coordinate and left fractional-linear convention z(γx)=(az(x)+b)/(cz(x)+d), with jγδ(x)=jγ(δx)jδ(x) and explicit inversion when converting to a right action; bound ε≤1/(c_p p^m), c_p=2 (p≥5),3 (p=3),4 (p=2); AL_n:X_{Γ0*(p^n)}(p^nε)_a≅X(ε); partial-Hasse improvement under u_𝔭 and the all-direction v/p improvement for ∏U_𝔭^{e_𝔭}.
HodgeTateAndCanonicalSubgroups:T5: The actual modified differential lattice on the Igusa cover (including ramified non-Rapoport points), B_m frame torsor, canonical-subgroup congruence and tautological Hodge–Tate lift; retain the left cz+d law, level/radius and isogeny diagrams. For O5 certify torsor transitivity on valued points, the common analytic-character admission and integral-unit multipliers. Positive-radius full-character integral freeness additionally needs base-local unit eigenfunctions on the normalized finite-Igusa factor and compatible O+ transitions; do not assume descent of the modified lattice just because it is a line on the cover. For O7 identify the actual ordinary flat formally smooth integral moduli charts, finite étale surjective formal Igusa covers and their coefficient extension, allowing P9’s finite-level good-reduction comparison. Smooth ordinary special fibres alone do not identify an unspecified formal model. The named hodge-tate-aip-lift is used with ε_base≤p^(−(m+1)); the s∘u_n source has radius p^n ε_base and must separately remain O2-admitted.
HilbertModularVarietiesAndShimuraCurves:H3: Polarisation component indexing by prime-to-p ideals and its narrow-class quotient, the effective finite Δ(N) action, and positive-unit/p-unit polarisation transports with their stabilizer and composition laws. O6 builds its isogeny correspondences from the universal moduli and level objects of H1/H4; H3 supplies their source/target component identifications.
HilbertModularVarietiesAndShimuraCurves:H4: The effective Hilbert arithmetic/geometric quotients E(p^n), PΓ0(p^n), central closure Z∞, actual finite Δ(N) and profinite Δ(p∞N), positive-unit congruence/square relations, and transport P_x with its stabilizer and composition laws. Finite Δ and full tower Δ must remain distinct. Supply actual subgroup-scheme/level objects of the universal Hilbert abelian scheme and their forgetful/quotient maps for O6’s finite correspondences; the coefficient normalization and operator are owned by O6.
PerfectoidShimuraVarieties:S5: The three actual Hilbert Γ*, mixed Γ and arithmetic G infinite-level covers, their maps and right group actions; the Z_p^× torsor span and full profinite Δ(p∞N) torsor; O_p^×-valued Weil pairing eβ with (γ,x)^*w(eβ)=w(x⁻¹)w(detγ)w(eβ), and compatibility of the common HT coordinate.
ShimuraCompactifications:C6: Toroidal/minimal/formal Hilbert models and compactified Igusa/Hecke maps including ramified p; boundary Cartier ideal and coefficient extension; ordinary cusp charts and finite polarisation compatibility; g>1 Koecher with normality/codimension hypotheses, the g=1 cusp calculation, and cofinal global-Hasse minimal affinoids with relative compact containment. The additional cuspidal formal cohomology theorem of AIP CUSP Thm3.17/Appendix6.4 is separately recorded as a scope extension gap, not assumed from this geometry alone.
CompletedCohomologyPartII:CC.8: Adapter of the generic completed topological object to Ding §4.2.2’s definite unitary Ŝξ,τ(U^℘,O_E)=lim_k colim_{U℘}Sξ,τ(U℘U^℘,O_E/ϖ_E^k), retaining the other-p coefficient lattices and commuting tame Hecke/GL_n(K) actions. Admissibility and Π|H≅C(H,E)^s are outside this purely topological adapter and are recorded under the new Jacquet owner gap.
HilbertModularVarietiesAndShimuraCurves:H1: The actual Hilbert PEL moduli scheme and universal O_F-abelian scheme with polarisation and prime-to-p level. O6 uses this carrier to construct its finite cyclic-subgroup correspondences and tame level automorphisms; no abstract arbitrary pair of maps is substituted.
-/
