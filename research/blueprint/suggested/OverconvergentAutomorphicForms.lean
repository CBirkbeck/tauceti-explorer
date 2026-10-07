/-
# Suggested Lean forms: p-adic automorphic coefficients (O0–O8)

This file is not the roadmap and is not exhaustive. The roadmap document
`OverconvergentAutomorphicForms.md` is definitive. These statements suggest Lean forms
so that contributors and reviewers converge on names and signatures. Proofs of new
results are placeholders; nothing here claims to be formalised.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`.
The typed core uses actual baseline carriers. The mathematical register at the end
records supplier-dependent signatures, API and tests; its entries are comments and
are not compiled declarations. The packet gaps identify the missing genuine carriers.
-/

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
import Mathlib.Data.Matrix.ColumnRowPartitioned
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Algebra.Module.LinearMap.Defs

/-!
`𝒪_p` is `ℤ_[p] ⊗[ℤ] 𝓞 F` with scalars on the left and the module topology.
The weight map is dual to `x ↦ (x², N(x)⁻¹)`; the weight spaces themselves belong
 to PadicMeasuresIwasawaAlgebras L0a. A bounded character's analytic extension
uses the supplied adic neighbourhood and Banach function spaces.

The coefficient core uses right actions and inverse descent factors. BHW's left
Hilbert action is transported by inversion before applying it. Siegel row graphs
use the right action directly, with `J = A + Z*C`, `Zγ = J⁻¹*(B + Z*D)`.
Namespaces preserve the common weight/coefficient API and the Siegel application.
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

open Matrix

namespace TauCeti.Overconvergent.Siegel

variable {n R : Type*} [Fintype n] [DecidableEq n] [CommRing R]

/-- Row-graph normalisation on the locus where the denominator is a unit. -/
lemma graph_normalisation (A B C D Z : Matrix n n R)
    (hJ : IsUnit (A + Z * C).det) :
    Matrix.fromCols (1 : Matrix n n R) Z * Matrix.fromBlocks A B C D =
      (A + Z * C) * Matrix.fromCols (1 : Matrix n n R)
        ((A + Z * C)⁻¹ * (B + Z * D)) := by
  sorry

/-- The actual Siegel denominator satisfies the right-action cocycle identity. -/
lemma factor_composition (A B C D E F G H Z : Matrix n n R)
    (hJ : IsUnit (A + Z * C).det) :
    (A * E + B * G) + Z * (C * E + D * G) =
      (A + Z * C) * (E + ((A + Z * C)⁻¹ * (B + Z * D)) * G) := by
  sorry

/-- Composition of chart coordinates, with both denominators invertible. -/
lemma coordinate_composition (A B C D E F G H Z : Matrix n n R)
    (hJ : IsUnit (A + Z * C).det)
    (hK : IsUnit (E + ((A + Z * C)⁻¹ * (B + Z * D)) * G).det) :
    (((A * E + B * G) + Z * (C * E + D * G))⁻¹ *
      ((A * F + B * H) + Z * (C * F + D * H))) =
    (E + ((A + Z * C)⁻¹ * (B + Z * D)) * G)⁻¹ *
      (F + ((A + Z * C)⁻¹ * (B + Z * D)) * H) := by
  sorry

/-- Correct antidiagonal dual factor: the lower-left block precedes Z. -/
lemma antidiagonal_dual_factor (W A C Z : Matrix n n R)
    (hW : W * W = 1) (hZ : W * Z.transpose * W = Z) :
    W * (A + Z * C).transpose * W =
      W * A.transpose * W + (W * C.transpose * W) * Z := by
  sorry

/-- Apply a scalar character to the determinant of the actual matrix factor.
The three units are the unique unit lifts of the displayed denominators. -/
lemma determinant_character_cocycle {S : Type*} [CommRing S]
    (A B C D E F G H Z : Matrix n n R)
    (j k l : Matrix.GeneralLinearGroup n R)
    (hj : (j : Matrix n n R) = A + Z * C)
    (hk : (k : Matrix n n R) =
      E + ((A + Z * C)⁻¹ * (B + Z * D)) * G)
    (hl : (l : Matrix n n R) = (A * E + B * G) + Z * (C * E + D * G))
    (χ : Rˣ →* Sˣ) :
    (χ (Matrix.GeneralLinearGroup.det l))⁻¹ =
      (χ (Matrix.GeneralLinearGroup.det j))⁻¹ *
      (χ (Matrix.GeneralLinearGroup.det k))⁻¹ := by
  sorry

/-- The concrete determinant-character eigenline in the function module.
Analytic restriction requires the actual O0 character extension. -/
def determinantLineMap {S : Type*} [CommRing S] (χ : Rˣ →* Sˣ) :
    S →ₗ[S] (Matrix.GeneralLinearGroup n R → S) := by
  sorry

lemma determinantLineMap_apply {S : Type*} [CommRing S]
    (χ : Rˣ →* Sˣ) (a : S) (g : Matrix.GeneralLinearGroup n R) :
    determinantLineMap χ a g = a * (χ (Matrix.GeneralLinearGroup.det g) : S) := by
  sorry

lemma determinantLineMap_at_one {S : Type*} [CommRing S]
    (χ : Rˣ →* Sˣ) (a : S) :
    determinantLineMap (n := n) χ a 1 = a := by
  sorry

lemma determinantLineMap_injective {S : Type*} [CommRing S]
    (χ : Rˣ →* Sˣ) :
    Function.Injective (determinantLineMap (n := n) χ) := by
  sorry

lemma determinantLineMap_left_translate {S : Type*} [CommRing S]
    (χ : Rˣ →* Sˣ) (a : S) (h g : Matrix.GeneralLinearGroup n R) :
    determinantLineMap χ a (h * g) =
      (χ (Matrix.GeneralLinearGroup.det h) : S) * determinantLineMap χ a g := by
  sorry

lemma determinantLineMap_right_translate {S : Type*} [CommRing S]
    (χ : Rˣ →* Sˣ) (a : S) (g b : Matrix.GeneralLinearGroup n R) :
    determinantLineMap χ a (g * b) =
      (χ (Matrix.GeneralLinearGroup.det b) : S) * determinantLineMap χ a g := by
  sorry

lemma determinantLineMap_trivial {S : Type*} [CommRing S]
    (a : S) (g : Matrix.GeneralLinearGroup n R) :
    determinantLineMap (1 : Rˣ →* Sˣ) a g = a := by
  sorry

-- TauCeti.Overconvergent.Siegel.determinantLineMap_test_trivial
example {S : Type*} [CommRing S] (a : S) (g : Matrix.GeneralLinearGroup n R) :
    determinantLineMap (1 : Rˣ →* Sˣ) a g = a := by
  sorry

-- TauCeti.Overconvergent.Siegel.determinantLineMap_test_diagonal
example (h : (!![2, 0; 0, 3] : Matrix (Fin 2) (Fin 2) ℚ).det ≠ 0) :
    determinantLineMap (MonoidHom.id ℚˣ) 1
      (Matrix.GeneralLinearGroup.mkOfDetNeZero !![2, 0; 0, 3] h) = 6 := by
  sorry

-- TauCeti.Overconvergent.Siegel.determinantLineMap_test_unipotent
example (h : (!![1, 7; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ).det ≠ 0) :
    determinantLineMap (MonoidHom.id ℚˣ) 1
      (Matrix.GeneralLinearGroup.mkOfDetNeZero !![1, 7; 0, 1] h) = 1 := by
  sorry

-- TauCeti.Overconvergent.Siegel.determinantLineMap_test_evaluation
example {S : Type*} [CommRing S] (χ : Rˣ →* Sˣ) (a b : S)
    (h : determinantLineMap (n := n) χ a = determinantLineMap (n := n) χ b) :
    a = b := by
  sorry

/-- The Atkin–Lehner matrix changes the row graph to the other chart. -/
lemma atkin_lehner_chart (q : R) (Z : Matrix n n R) :
    Matrix.fromCols (1 : Matrix n n R) Z *
      Matrix.fromBlocks (0 : Matrix n n R) 1 (-(q • (1 : Matrix n n R))) 0 =
    Matrix.fromCols (-(q • Z)) (1 : Matrix n n R) := by
  sorry

-- Acceptance: the Atkin–Lehner block inverse requires a unit scalar.
example (q : Rˣ) :
    Matrix.fromBlocks (0 : Matrix n n R) 1 (-((q : R) • (1 : Matrix n n R))) 0 *
      Matrix.fromBlocks (0 : Matrix n n R) (-((↑q⁻¹ : R) • (1 : Matrix n n R))) 1 0 = 1 := by
  sorry

example (q z : ℚ) :
    Matrix.fromCols (1 : Matrix (Fin 1) (Fin 1) ℚ) !![z] *
      Matrix.fromBlocks (0 : Matrix (Fin 1) (Fin 1) ℚ) 1 !![-q] 0 =
    Matrix.fromCols (!![-q * z] : Matrix (Fin 1) (Fin 1) ℚ)
      (1 : Matrix (Fin 1) (Fin 1) ℚ) := by
  sorry

-- Acceptance: the identity block acts identically.
example (Z : Matrix n n R) :
    ((1 : Matrix n n R) + Z * 0)⁻¹ * (0 + Z * 1) = Z := by
  sorry

-- Acceptance: in genus one the denominator is a + z*c, not c*z + d.
example (a b c d z : ℚ) (h : a + z * c ≠ 0) :
    (((!![a] : Matrix (Fin 1) (Fin 1) ℚ) + !![z] * !![c])⁻¹ *
      (!![b] + !![z] * !![d])) 0 0 = (a + z * c)⁻¹ * (b + z * d) := by
  sorry

-- Acceptance: unit denominators are essential; a zero denominator cannot be cancelled.
example :
    Matrix.fromCols (1 : Matrix (Fin 1) (Fin 1) ℚ) (0 : Matrix (Fin 1) (Fin 1) ℚ) *
        Matrix.fromBlocks (0 : Matrix (Fin 1) (Fin 1) ℚ) (1 : Matrix (Fin 1) (Fin 1) ℚ) (1 : Matrix (Fin 1) (Fin 1) ℚ) (0 : Matrix (Fin 1) (Fin 1) ℚ) ≠
      (0 : Matrix (Fin 1) (Fin 1) ℚ) * Matrix.fromCols (1 : Matrix (Fin 1) (Fin 1) ℚ) (0 : Matrix (Fin 1) (Fin 1) ℚ) := by
  sorry

-- Acceptance: multiplication order of two genus-two factors is observable.
example :
    (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 0; 1, 1] ≠
      (!![1, 0; 1, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 1; 0, 1] := by
  sorry

-- Acceptance: the source's antidiagonal-dual order fails for a lower unipotent
-- symplectic element with C = 3*E21 and Z = E12.
example :
    let W : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 1, 0]
    let Z : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 0, 0]
    let C : Matrix (Fin 2) (Fin 2) ℚ := !![0, 0; 3, 0]
    W * (1 + Z * C).transpose * W = !![1, 0; 0, 4] := by
  sorry

example :
    let W : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 1, 0]
    let Z : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 0, 0]
    let C : Matrix (Fin 2) (Fin 2) ℚ := !![0, 0; 3, 0]
    W * (1 + Z * C).transpose * W ≠ 1 + Z * (W * C.transpose * W) := by
  sorry

-- Acceptance: determinant character agrees with integer powers, including duals.
example (j k : Matrix.GeneralLinearGroup n R) (m : ℤ) :
    Matrix.GeneralLinearGroup.det (j * k) ^ (-m) =
      Matrix.GeneralLinearGroup.det j ^ (-m) *
      Matrix.GeneralLinearGroup.det k ^ (-m) := by
  sorry

example (j : Matrix.GeneralLinearGroup n R) :
    Matrix.GeneralLinearGroup.det j ^ (0 : ℤ) = 1 := by
  sorry

example (j : Matrix.GeneralLinearGroup n R) :
    Matrix.GeneralLinearGroup.det j ^ (-1 : ℤ) =
      (Matrix.GeneralLinearGroup.det j)⁻¹ := by
  sorry

-- Acceptance: finite algebra handles the empty index set; geometric genus stays positive.
example (j : Matrix.GeneralLinearGroup (Fin 0) R) :
    Matrix.GeneralLinearGroup.det j = 1 := by
  sorry

#check Matrix.fromCols_mul_fromBlocks
#check Matrix.mul_nonsing_inv
#check Matrix.GeneralLinearGroup.det
#check Matrix.transpose_mul



end TauCeti.Overconvergent.Siegel

/-!
## Supplier-dependent mathematical register

The entries below preserve every node, API item and test name of the assembled
packets. Entries without genuine supplier carriers have no typed signature here.
In particular, the full-character integral AIP generator/descent and the exact
Igusa structural-completion/analytic-O+ comparison require the recorded proofs.
Heuer supplies a natural map, rather than an arbitrary-model isomorphism.
No unknown condition is replaced by a Prop-valued field, axiom or fake geometry.

### OverconvergentAutomorphicForms:O0/units-at-p

definition TauCeti.HilbertWeight.Op : For a number field F and a prime p, 𝒪_p := ℤ_p ⊗_ℤ 𝒪_F with its ℤ_p-algebra structure from the left factor and the ℤ_p-module topology. It is a finite free ℤ_p-module of rank [F : ℚ], a compact topological ring, and T(ℤ_p) := 𝒪_p^× (with the units topology) is BHW's T(ℤ_p) for T = Res_{𝒪_F|ℤ} G_m.
Hypotheses: No hypothesis on how p decomposes in F: 𝒪_p is the product of the completed local rings at the primes above p, not assumed unramified or split. Scalars on the left, so that the pinned base-change instances apply.
Carrier dependencies: mathlib:TensorProduct, mathlib:NumberField.RingOfIntegers, mathlib:PadicInt, mathlib:Algebra.TensorProduct.leftAlgebra, mathlib:Module.Finite.base_change, mathlib:Module.Free.tensor, mathlib:moduleTopology, mathlib:IsModuleTopology, mathlib:IsModuleTopology.isTopologicalRing, mathlib:IsModuleTopology.continuous_of_linearMap, mathlib:Module.finrank_baseChange, mathlib:NumberField.RingOfIntegers.rank, mathlib:PadicInt.compactSpace, mathlib:Rat.ringOfIntegersEquiv
Proof outline: Define Op F p := ℤ_[p] ⊗[ℤ] 𝓞 F; its ℤ_p-algebra structure is Algebra.TensorProduct.leftAlgebra. Module.Finite from Module.Finite.base_change and Module.Free from Module.Free.tensor, since 𝓞 F is finite free over ℤ. Give it moduleTopology ℤ_[p] (an IsModuleTopology instance); it is a topological ring by IsModuleTopology.isTopologicalRing. Rank: Module.finrank_baseChange with NumberField.RingOfIntegers.rank. Compactness: a ℤ_p-basis identifies 𝒪_p with ℤ_p^n by a linear equivalence, which is a homeomorphism for module topologies (IsModuleTopology.continuous_of_linearMap), and ℤ_p is compact (PadicInt.compactSpace). The unit locus is clopen and compact: a finite-free multiplication determinant is a unit in Z_p exactly when the element is invertible (adjugate/Cayley–Hamilton). Its continuous inverse image of Z_p^× identifies with O_p^×, including the units topology and continuous inverse.
lemma TauCeti.HilbertWeight.compactSpace_Op : 𝒪_p is compact.
lemma TauCeti.HilbertWeight.finrank_Op : finrank_{ℤ_p} 𝒪_p = [F : ℚ].
lemma TauCeti.HilbertWeight.unitsToOp : The map 𝒪_F^× → 𝒪_p^×, η ↦ 1 ⊗ η.
example op_rat : 𝒪_p ≅ ℤ_p for F = ℚ.
example op_not_discrete : 𝒪_p is not discrete.
example op_split : For F = ℚ(i) and p = 5, 𝒪_p ≅ ℤ_5 × ℤ_5.
Acceptance: F = ℚ: 𝒪_p ≅ ℤ_p as ℤ_p-algebras, via Rat.ringOfIntegersEquiv. The topology is not discrete; a definition by the discrete topology would make every character continuous and the weight space far too large. F = ℚ(i), p = 5: 𝒪_p ≅ ℤ_5 × ℤ_5, and T(ℤ_5) = (ℤ_5^×)², matching Res_{𝒪_F|ℤ} G_m at a split prime.
Sources: BHW-2023 §6.1, Definition 6.1, printed p. 1756

### OverconvergentAutomorphicForms:O0/norm-at-p

construction TauCeti.HilbertWeight.normUnits : N : 𝒪_p^× → ℤ_p^× is the norm Algebra.norm ℤ_p (the determinant of multiplication on the free ℤ_p-module 𝒪_p), restricted to units. It is a continuous homomorphism, and N(1 ⊗ a) = N_{F/ℚ}(a) for a ∈ 𝒪_F.
Hypotheses: 𝒪_p finite free over ℤ_p (units-at-p).
Carrier dependencies: OverconvergentAutomorphicForms:O0/units-at-p, mathlib:Algebra.norm, mathlib:Units.map, mathlib:Algebra.norm_apply, mathlib:LinearMap.det, mathlib:LinearMap.det_baseChange, mathlib:IsModuleTopology.continuous_of_linearMap
Proof outline: Units.map of the monoid hom Algebra.norm ℤ_[p] : 𝒪_p →* ℤ_p. Continuity: in a ℤ_p-basis the norm is a polynomial in the coordinates (Algebra.norm_apply, LinearMap.det), and coordinates are continuous for the module topology. Compatibility: multiplication by 1 ⊗ a is the base change of multiplication by a on 𝒪_F, so its determinant is N_{F/ℚ}(a) (LinearMap.det_baseChange).
lemma TauCeti.HilbertWeight.continuous_normUnits : N is continuous.
lemma TauCeti.HilbertWeight.norm_tmul_one : N(1 ⊗ a) = N_{F/ℚ}(a).
lemma TauCeti.HilbertWeight.normUnits_unitsToOp : N(1 ⊗ η) = N_{F/ℚ}(η) in ℤ_p for a global unit η.
example norm_rat : For F = ℚ, N is the identity.
example norm_neg_one : N(−1) = (−1)^{[F:ℚ]}.
example norm_not_trivial : For [F:ℚ] odd, N is not the trivial character (N(−1) = −1).
Acceptance: F = ℚ: N is the identity of ℤ_p^×. N(−1) = (−1)^{[F:ℚ]}. N(1 ⊗ η) = 1 for a totally positive unit η of a totally real F (used by weight-comparison-totally-positive-units).
Sources: BHW-2023 §6.1, Definition 6.1, printed p. 1756

### OverconvergentAutomorphicForms:O0/principal-units

construction TauCeti.HilbertWeight.principalUnits : For r ≥ 0, H_r := {x ∈ 𝒪_p^× : x − 1 ∈ p^r 𝒪_p} is an open subgroup of finite index of 𝒪_p^×; for r ≥ 1 it is a pro-p group, so it meets the prime-to-p torsion of 𝒪_p^× trivially.
Hypotheses: r ∈ ℕ; H_0 = 𝒪_p^×.
Carrier dependencies: OverconvergentAutomorphicForms:O0/units-at-p, mathlib:Subgroup, mathlib:Ideal.span, mathlib:Subgroup.FiniteIndex, mathlib:IsModuleTopology
Proof outline: Closure under products and inverses: (1 + p^r a)(1 + p^r b) = 1 + p^r(a + b + p^r ab), and the inverse of a unit ≡ 1 mod p^r is ≡ 1 mod p^r. Openness: p^r 𝒪_p is open in the module topology (a finite-index ℤ_p-submodule), and H_r is its translate intersected with the open units. Finite index: 𝒪_p^×/H_r injects into (𝒪_p/p^r)^×, a finite group. Pro-p for r ≥ 1: H_r/H_s is a p-group for s ≥ r, being filtered by the additive groups p^i 𝒪_p/p^{i+1} 𝒪_p.
lemma TauCeti.HilbertWeight.isOpen_principalUnits : H_r is open.
lemma TauCeti.HilbertWeight.finiteIndex_principalUnits : H_r has finite index.
lemma TauCeti.HilbertWeight.principalUnits_antitone : r ≤ s implies H_s ≤ H_r.
example principalUnits_zero : H_0 = 𝒪_p^×.
example principalUnits_rat : F = ℚ, p odd: H_1 = 1 + pℤ_p has index p − 1.
example principalUnits_root_of_unity : A nontrivial (p−1)-st root of unity in ℤ_p^× is not in H_1.
Acceptance: r = 0 gives all of 𝒪_p^×. F = ℚ, p odd, r = 1: H_1 = 1 + pℤ_p, of index p − 1; a nontrivial (p−1)-st root of unity is not in H_1. This is the subgroup over which the corrected |T_κ| is taken (source issue E2).
Sources: BHW-2023 Definition 4.5(1), printed p. 1736

### OverconvergentAutomorphicForms:O0/geometric-weight-characters

definition TauCeti.HilbertWeight.GeomWeight : For a topological commutative ring R, the R-points of the weight space 𝒲* for G* are the continuous characters T(ℤ_p) = 𝒪_p^× → R^×: GeomWeight F p R := ContinuousMonoidHom 𝒪_p^× R^×. BHW's 𝒲* = Spf(ℤ_p⟦T(ℤ_p)⟧)^an_η × L is the rigid space representing this functor on affinoid L-algebras; its construction and representability are requested from PadicMeasuresIwasawaAlgebras L0a.
Hypotheses: R a topological commutative ring, R^× with the units topology. No analyticity or algebraicity is assumed: an arbitrary continuous character is a weight, not an algebraic weight. All representation-by-rigid-space assertions use the imported universal character functor; the Lean abbreviation itself gives points only.
Carrier dependencies: OverconvergentAutomorphicForms:O0/units-at-p, mathlib:ContinuousMonoidHom, mathlib:IsTopologicalRing, PadicMeasuresIwasawaAlgebras:L0a
Proof outline: Definition: ContinuousMonoidHom (Op F p)ˣ Rˣ. It is a commutative group under pointwise multiplication, and post-composition with continuous ring maps R → R' makes it a functor.
lemma TauCeti.HilbertWeight.GeomWeight.ext : Two geometric weights are equal iff their values on all units agree.
lemma TauCeti.HilbertWeight.GeomWeight.pullback : Precomposition by a continuous monoid endomorphism of O_p^×.
lemma TauCeti.HilbertWeight.GeomWeight.one_apply : The trivial weight evaluates to 1 on every unit.
example geomWeight_trivial : The trivial character is a weight.
example geomWeight_norm : x ↦ N(x) is a ℚ_p-valued weight.
example geomWeight_rat : For F = ℚ these are the continuous characters of ℤ_p^×.
Acceptance: F = ℚ: GeomWeight ℚ p R is the set of continuous characters ℤ_p^× → R^×, BHW's weight space for GL_2/ℚ (Definition 3.1). Algebraic weights x ↦ N(x)^k (k ∈ ℤ) and x ↦ ∏_σ σ(x)^{k_σ} (after extending scalars to split F) are weights; a finite-order character of 𝒪_p^× is a weight that is not algebraic. Let R be the same abstract p-adic integer algebra with discrete topology. The identity homomorphism on its unit group from the usual p-adic topology is not continuous (the inverse image of {1} is not open), hence is not an R-valued weight.
Sources: BHW-2023 §6.1, Definition 6.1(ii), printed p. 1756; BHW-2023 §6.1, Definition 6.1, printed p. 1756

### OverconvergentAutomorphicForms:O0/arithmetic-weight-characters

definition TauCeti.HilbertWeight.ArithWeight : For a topological commutative ring R, the R-points of the weight space 𝒲 for G are the continuous characters of T(ℤ_p) × ℤ_p^×: ArithWeight F p R := ContinuousMonoidHom (𝒪_p^× × ℤ_p^×) R^×. Every such character is uniquely a pair (w, t) with w ∈ GeomWeight and t : ℤ_p^× → R^× continuous, via κ(x, y) = w(x)t(y).
Hypotheses: R a topological commutative ring. All representation-by-rigid-space assertions use the imported universal character functor; the Lean abbreviation itself gives points only.
Carrier dependencies: OverconvergentAutomorphicForms:O0/units-at-p, OverconvergentAutomorphicForms:O0/geometric-weight-characters, mathlib:ContinuousMonoidHom, mathlib:ContinuousMonoidHom.fst, mathlib:ContinuousMonoidHom.snd, PadicMeasuresIwasawaAlgebras:L0a
Proof outline: Definition: ContinuousMonoidHom ((Op F p)ˣ × ℤ_[p]ˣ) Rˣ. ArithWeight.mk w t := (w ∘ fst)·(t ∘ snd) (ContinuousMonoidHom.fst, ContinuousMonoidHom.snd, pointwise product). Bijectivity of (w, t) ↦ ArithWeight.mk w t: restrict κ to 𝒪_p^× × 1 and 1 × ℤ_p^×; a character of a product of groups is the product of its restrictions.
lemma TauCeti.HilbertWeight.ArithWeight.mk : (w, t) ↦ the character (x, y) ↦ w(x)t(y).
lemma TauCeti.HilbertWeight.ArithWeight.bijective_mk : Every arithmetic weight is uniquely of the form mk w t.
lemma TauCeti.HilbertWeight.ArithWeight.mk_apply : (mk w t)(x, y) = w(x)·t(y).
example arithWeight_trivial : mk 1 1 = 1.
example arithWeight_rat : For F = ℚ these are pairs of characters of ℤ_p^×.
example arithWeight_mk_injective : mk w t = mk w' t' implies w = w' and t = t'.
Acceptance: F = ℚ: pairs of characters of ℤ_p^×. (w, t) = (1, 1) gives the trivial weight. The decomposition is unique: ArithWeight.mk is injective.
Sources: BHW-2023 §6.1, Definition 6.1(i), printed p. 1756; BHW-2023 §6.1, Definition 6.1, printed p. 1756

### OverconvergentAutomorphicForms:O0/weight-dual-group-map

construction TauCeti.HilbertWeight.weightDualMap : ι : 𝒪_p^× → 𝒪_p^× × ℤ_p^×, x ↦ (x², N(x)^{-1}), a continuous group homomorphism. It is the map for which pulling back characters gives BHW's displayed formula κ = w²·(t^{-1} ∘ N); BHW print x ↦ (x², N(x)) (source issue E1).
Hypotheses: The inversion on the second coordinate is deliberate: it is what the displayed formula and BHW (9.1) require.
Carrier dependencies: OverconvergentAutomorphicForms:O0/units-at-p, OverconvergentAutomorphicForms:O0/norm-at-p, mathlib:ContinuousMonoidHom
Proof outline: ι is a homomorphism because 𝒪_p^× and ℤ_p^× are commutative: (xy)² = x²y² and N(xy)^{-1} = N(x)^{-1}N(y)^{-1}. Continuity: squaring and inversion are continuous on the topological groups of units, and N is continuous (norm-at-p).
lemma TauCeti.HilbertWeight.weightDualMap : x ↦ (x², N(x)^{-1}) as a continuous monoid hom.
lemma TauCeti.HilbertWeight.weightDualMap_apply : ι(x) = (x², N(x)^{-1}).
lemma TauCeti.HilbertWeight.weightDualMap_unitsToOp : For a totally positive global unit η of a totally real F, ι(η) = (η², 1).
example weightDualMap_rat : For F = ℚ, ι(x) = (x², x^{-1}).
example weightDualMap_one : ι(1) = (1, 1).
example weightDualMap_not_printed : ι ≠ (x ↦ (x², N(x))) whenever N is not 2-torsion on 𝒪_p^×, e.g. F = ℚ, p = 5.
Acceptance: Pulling back (w, t) along ι gives w²·(t^{-1} ∘ N), not w²·(t ∘ N): with t trivial both agree, with w trivial they are inverse to each other. F = ℚ: ι(x) = (x², x^{-1}).
Sources: BHW-2023 §6.1, Definition 6.1, printed p. 1756; BHW-2023 §9, proof of Lemma 9.2, (9.1), printed p. 1781

### OverconvergentAutomorphicForms:O0/weight-comparison

construction TauCeti.HilbertWeight.weightMap : ρ_R : ArithWeight F p R → GeomWeight F p R, κ ↦ κ ∘ ι, natural in the coefficient ring R. It is the map on points of BHW's morphism ρ : 𝒲 → 𝒲*, through which every weight for G is regarded as a weight for G*.
Hypotheses: R a topological commutative ring; naturality is for continuous ring maps R → R'.
Carrier dependencies: OverconvergentAutomorphicForms:O0/arithmetic-weight-characters, OverconvergentAutomorphicForms:O0/geometric-weight-characters, OverconvergentAutomorphicForms:O0/weight-dual-group-map, mathlib:ContinuousMonoidHom.comp, PadicMeasuresIwasawaAlgebras:L0a
Proof outline: Definition by composition with weight-dual-group-map (ContinuousMonoidHom.comp). Naturality: composition on the left and on the right commute.
lemma TauCeti.HilbertWeight.weightMap : κ ↦ κ ∘ ι.
lemma TauCeti.HilbertWeight.weightMap_mk_apply : ρ(w, t) = w²·(t^{-1} ∘ N) (weight-comparison-formula).
lemma TauCeti.HilbertWeight.weightMap_mul : ρ(κκ') = ρ(κ)ρ(κ'): ρ is a group homomorphism.
example weightMap_t_one : ρ(w, 1) = w².
example weightMap_w_one : ρ(1, t) = t^{-1} ∘ N.
example weightMap_rat : For F = ℚ, ρ(w, t)(x) = w(x)²t(x)^{-1}.
Acceptance: F = ℚ: ρ(w, t)(x) = w(x)²t(x)^{-1}. ρ is a group homomorphism for the pointwise group structures. The morphism of rigid spaces 𝒲 → 𝒲* is L0a's pullback in G applied to ι; its points are ρ_R.
Sources: BHW-2023 §6.1, Definition 6.1, printed p. 1756; BHW-2023 §6.1, after Definition 6.2, printed p. 1757

### OverconvergentAutomorphicForms:O0/weight-comparison-formula

lemma TauCeti.HilbertWeight.weightMap_mk_apply : For w ∈ GeomWeight F p R, t : ℤ_p^× → R^× continuous and x ∈ 𝒪_p^×: ρ(ArithWeight.mk w t)(x) = w(x)²·t(N(x))^{-1}.
Hypotheses: As in weight-comparison.
Carrier dependencies: OverconvergentAutomorphicForms:O0/weight-comparison, OverconvergentAutomorphicForms:O0/arithmetic-weight-characters, OverconvergentAutomorphicForms:O0/weight-dual-group-map
Proof outline: Unfold: ρ(mk w t)(x) = (mk w t)(ι x) = w(x²)·t(N(x)^{-1}) = w(x)²·t(N(x))^{-1}, using that w and t are homomorphisms.
Acceptance: This is BHW's displayed κ = w²·(t^{-1} ∘ N_{F/ℚ}). With the printed map x ↦ (x², N(x)) one would get w(x)²·t(N(x)) instead (E1).
Sources: BHW-2023 §6.1, Definition 6.1, printed p. 1756

### OverconvergentAutomorphicForms:O0/weight-comparison-norm-factor

lemma TauCeti.HilbertWeight.weightMap_mk_mul_inv_sq : For κ = ρ(mk w t) and x ∈ 𝒪_p^×: κ(x)·w(x)^{-2} = t(N(x))^{-1}. In particular κ·w^{-2} factors through N : 𝒪_p^× → ℤ_p^×.
Hypotheses: As in weight-comparison.
Carrier dependencies: OverconvergentAutomorphicForms:O0/weight-comparison-formula
Proof outline: Rearrange weight-comparison-formula.
Acceptance: BHW: 'κ(x)·w(x^{-2}) factors through some power of the norm'; here the factor is exactly t^{-1} ∘ N. For (w, t) = (N^a, N^b) (algebraic), κ = N^{2a−b}.
Sources: BHW-2023 §6.1, Definition 6.1, printed p. 1756

### OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units

lemma TauCeti.HilbertWeight.weightMap_mk_totallyPositive : Let F be totally real and η ∈ 𝒪_F^× totally positive (σ(η) > 0 for every real embedding σ). For κ = ρ(mk w t): κ(η)^{-1}·w(η)² = t(N(η)) = 1, where η is viewed in 𝒪_p^× by η ↦ 1 ⊗ η.
Hypotheses: F totally real; η totally positive; R any topological commutative ring.
Carrier dependencies: OverconvergentAutomorphicForms:O0/weight-comparison-norm-factor, OverconvergentAutomorphicForms:O0/norm-at-p, mathlib:NumberField.IsTotallyReal, mathlib:NumberField.isUnit_iff_norm, mathlib:Algebra.norm_eq_prod_embeddings
Proof outline: By weight-comparison-norm-factor, κ(η)^{-1}w(η)² = t(N(1 ⊗ η)). N(1 ⊗ η) = N_{F/ℚ}(η) (norm-at-p) = ±1 since η is a unit (NumberField.isUnit_iff_norm), and N_{F/ℚ}(η) = ∏_σ σ(η) > 0 (Algebra.norm_eq_prod_embeddings, all embeddings real), so N_{F/ℚ}(η) = 1 and t(1) = 1.
Acceptance: This is BHW (9.1), which makes the conditions (3) and (4) of §9 independent of representatives. Total positivity is needed: for η = −1 and [F:ℚ] odd, t(N(η)) = t(−1), which can be −1.
Sources: BHW-2023 §9, proof of Lemma 9.2, (9.1), printed p. 1781

### OverconvergentAutomorphicForms:O0/weight-radius-parameter

construction TauCeti.HilbertWeight.radiusParameter : For a normed commutative ring A and κ∈GeomWeight F p A, set T_pro(κ)=sup_{x∈H_r0}‖κ(x)−1‖, r0=1 for odd p and 3 for p=2. This replaces BHW’s all-unit supremum for the boundedness diagnostic (E2). It is not asserted to equal every universal coordinate used in the AIP annuli, and does not validate the printed analytic-radius formula (E3).
Hypotheses: A a normed commutative ring; κ continuous.
Carrier dependencies: OverconvergentAutomorphicForms:O0/principal-units, OverconvergentAutomorphicForms:O0/geometric-weight-characters
Proof outline: Definition as an indexed supremum (iSup) over the subgroup principal-units H_{r₀}.
lemma TauCeti.HilbertWeight.radiusParameter_one : |T_1| = 0.
lemma TauCeti.HilbertWeight.radiusParameter_lt_one : Continuous characters into uniform Banach ℚ_p-algebras have |T_κ| < 1 (continuous-character-bounded).
lemma TauCeti.HilbertWeight.radiusParameter_nonneg : 0 ≤ |T_κ|.
example radius_trivial : |T_1| = 0.
example radius_teichmuller : F = ℚ, p odd: |T_ω| = 0 for the Teichmüller character.
example radius_power : For F=Q, p odd and k∈N, T_pro(x↦x^k)=|pk|_p, including k=0.
Acceptance: The trivial character has |T_κ| = 0. F = ℚ, p odd, κ = the Teichmüller character ω: |T_ω| = 0 (ω is trivial on 1 + pℤ_p), whereas BHW's printed supremum over ℤ_p^× gives 1. F = ℚ, p odd, κ(x) = x^k: |T_κ| = |pk|_p.
Sources: BHW-2023 §6.1, after Definition 6.2, printed p. 1757; BHW-2023 Definition 4.5(1), printed p. 1736

### OverconvergentAutomorphicForms:O0/continuous-character-bounded

lemma TauCeti.HilbertWeight.radiusParameter_lt_one : Let A be a complete normed ℚ_p-algebra whose norm is ultrametric and power-multiplicative (a uniform Banach algebra, such as an affinoid algebra with its spectral norm). Then every κ ∈ GeomWeight F p A has |T_κ| < 1.
Hypotheses: A complete, ultrametric, ‖1‖ = 1, ‖·‖ power-multiplicative; κ continuous.
Carrier dependencies: OverconvergentAutomorphicForms:O0/weight-radius-parameter, OverconvergentAutomorphicForms:O0/principal-units, OverconvergentAutomorphicForms:O0/units-at-p, mathlib:IsModuleTopology
Proof outline: For x ∈ H_{r₀}, x^{p^n} → 1, so κ(x)^{p^n} → 1 by continuity. If y = κ(x) − 1 had ‖y‖ ≥ 1, expand (1 + y)^{p^n} − 1 = y^{p^n} + Σ_{0<j<p^n} C(p^n, j) y^j. The first term has norm ‖y‖^{p^n} (power-multiplicativity), and each other term has norm ≤ |p|·‖y‖^j ≤ |p|·‖y‖^{p^n} < ‖y‖^{p^n}, since p divides C(p^n, j) and ‖y‖ ≥ 1. The norm is ultrametric, so ‖(1 + y)^{p^n} − 1‖ = ‖y‖^{p^n} ≥ 1 for all n, contradicting κ(x)^{p^n} → 1. Hence ‖κ(x) − 1‖ < 1. x ↦ ‖κ(x) − 1‖ is continuous on the compact group H_{r₀} (open in the compact 𝒪_p^×), so its supremum is attained and is < 1.
Acceptance: This is the coefficient-level form of 'an affinoid image is bounded'; unboundedness only occurs for non-affinoid families U, which need L0a's rigid spaces. Power-multiplicativity is needed: for a non-uniform norm the binomial estimate fails. The ultrametric hypothesis is needed for the domination step; archimedean normed algebras are excluded.
Sources: BHW-2023 §6.1, Definition 6.2, printed p. 1756

### OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights

theorem TauCeti.Overconvergent.analytic_continuation_of_bounded_weights : For a bounded smooth family κ:U→W*, there exists a common positive radius r<1 and a unique analytic multiplicative extension of its character to B_r(O_p^×:1)×U, agreeing with κ on O_p^××U. The extension respects multiplication wherever defined. This is an existence theorem; r=|p|^r0 |Tκ| is not asserted (E3).
Hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Boundedness is affinoid-image boundedness. The corrected pro-p supremum is a useful diagnostic, not the universal-coordinate annulus of AIP Proposition 2.8.
Carrier dependencies: OverconvergentAutomorphicForms:O0/geometric-weight-characters, OverconvergentAutomorphicForms:O0/weight-radius-parameter, OverconvergentAutomorphicForms:O0/continuous-character-bounded, PadicMeasuresIwasawaAlgebras:L0a, LocallyAnalyticDistributions:L0
Proof outline: Pull the family back from one affinoid of the universal compact-torus character space (PadicMeasuresIwasawaAlgebras:L0a). Apply AIP ADIC Proposition 2.8 on finitely many universal-coordinate annuli/charts; use their smallest positive analytic neighbourhood. LocallyAnalyticDistributions:L0 supplies the multivariable analytic-character theorem and its normed function spaces. Glue by uniqueness: a convergent analytic function vanishing on a product of small Z_p lattices is zero, by the one-variable identity theorem successively in the coordinates. Agreement at a single point of each ball would not suffice. Multiplicativity follows by the same identity argument on the product neighbourhood, then descends over U by pulling back the universal construction.
Acceptance: A finite conductor character extends on sufficiently small residue balls. For p=3, κ(4)=ζ_9 cannot extend to the printed ball of radius 3^(−7/6), by E3. The trivial character extends to every admitted neighbourhood; no formula forcing r=0 is imposed.
Sources: BHW-2023 §6.1, Proposition 6.3, p.1757; AIP-ADIC-2016 §2.4.3, Proposition 2.8, p.9

### OverconvergentAutomorphicForms:O0/bounded-weight-families

construction TauCeti.Overconvergent.bounded_weight_families : A bounded geometric (respectively arithmetic) family on U is a morphism to the imported W* (respectively W) factoring through an affinoid subspace, with the pulled-back universal character on O_p^××U (respectively (O_p^××Z_p^×)×U). Smoothness of the family means smoothness of U; it does not mean the weight morphism is smooth.
Hypotheses: Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm.
Carrier dependencies: PadicMeasuresIwasawaAlgebras:L0a, OverconvergentAutomorphicForms:O0/geometric-weight-characters, OverconvergentAutomorphicForms:O0/arithmetic-weight-characters
Proof outline: Use the universal character of L0a and pull it back; retain the chosen affinoid chart to select a common analytic neighbourhood. Restriction to opens and morphisms of bases is functorial. On overlaps the same universal character gives the canonical identification.
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
Proof outline: Use baseline Representation for the algebraic action and imported analytic orbit maps for the chart condition. Use finite-projective Banach topology from AdicSpacesPartII:R0/completed-tensor-banach-module; record rather than manufacture a stable lattice.
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
Proof outline: Apply baseline Representation.tprod and Representation.dual. In a finite projective local splitting the analytic orbit maps are matrix products and inverse-transposes. Descend the dual/tensor identification from finite free modules through idempotents; finite-projective completed tensor agrees with ordinary tensor by the imported R0 theorem.
Acceptance: For two scalar coefficients the tensor weight is κλ and the dual weight κ⁻¹. The multiplication map on induced functions is not declared an isomorphism Ind(κ)⊗Ind(λ)≅Ind(κλ).
Sources: BP-HIGHER §6.2.2–6.2.4, p.148; §6.2.20, pp.152–153

### OverconvergentAutomorphicForms:O0/analytic-induced-coefficients

construction TauCeti.Overconvergent.analytic_induced_coefficients : For an n-analytic torus character κ_A and a chosen closed subgroup M_1 with Iwahori decomposition, define Vκ^{n-an} as analytic functions f on the actual adic neighbourhood M_1 M_n with f(mb)=(w0,M κ_A)(b⁻¹)f(m), for b in the upper Borel neighbourhood. Left action is (h·f)(m)=f(h⁻¹m). The locally analytic induction is colim_n Vκ^{n-an} with its LB topology; the continuous strong dual is the distribution coefficient module. At fixed n the strong dual (Vκ^{n-an})∨ need not be projective over A: BP instead defines projective Dκ^{n-an} as the compact-open continuous dual of bounded analytic functions on the open polydisc M_1 M_n°; Dκ^{lan}=lim_n Dκ^{n-an} is the dual of the locally analytic induction.
Hypotheses: Use BP §6.2’s Levi, Borel, longest Weyl element and actual analytic subgroup conventions. M_1 is closed with M_1=N̄_1 T_1 N_1, T_1=T(Z_p), and T^{M,−} normalizes N̄_1. M_1 is not required open or Zariski dense. κ_A is a character of w0,M⁻¹T(Z_p)w0,M, n-analytic after the Weyl conjugation. Functions are analytic on the adic thickening M_1 M_n, not merely set functions on M_1. A is uniform finite-type Tate over the coefficient field.
Carrier dependencies: LocallyAnalyticDistributions:L0, OverconvergentAutomorphicForms:O0/bounded-weight-families, AdicSpacesPartII:R0/completed-tensor-banach-module
Proof outline: Import multivariable analytic function Banach modules from LAD L0; cut out right Borel equivariance as a closed submodule. Iwahori factorisation identifies it with analytic functions on the opposite-unipotent neighbourhood, producing its Banach norm. Left inverse translation preserves the relation. The transition maps are restriction to smaller neighbourhoods; use their specified colimit and strong-dual topologies. For distributions retain §6.2.20’s bounded open-polydisc function space and compact-open dual topology. Do not identify its projective Dκ^{n-an} with the ordinary strong Banach dual over a general affinoid A.
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
Proof outline: Restrict regular functions to the analytic chart. Density of the unipotent chart and algebraic coordinates gives injectivity. Compute the actions as in BP §6.2.11 (a subsection, not a lemma); positive-monoid normalization gives ι(tv)=(w0,M κ)(t)tι(v). Apply Lemma 6.2.10 with its M_1-character and conductor hypotheses, multiplying by (w0,M χ)⁻¹. Proposition 6.3.6 provides the sheaf maps with its 2ρ_nc dual twist; it does not supply a general Hahn–Banach or surjectivity theorem over A.
Acceptance: In SL2 the finite-dimensional polynomial subspace is proper in the analytic functions. Scalar inverse/positive conventions must be converted explicitly before applying this to O8’s transpose convention.
Sources: BP-HIGHER §6.2.9, Lemma 6.2.10 and §6.2.11, p.150; Proposition 6.3.6, p.154

### OverconvergentAutomorphicForms:O0/unitary-completed-coefficients

construction TauCeti.Overconvergent.unitary_completed_coefficients : Ŝξ,τ(U^℘,O_E)=lim_k colim_{U℘} Sξ,τ(U℘U^℘,O_E/ϖ_E^k), where f(gu)=u⁻¹f(g) in the finite automorphic function spaces. After tensoring E, Π is an admissible unitary Banach GL_n(K)-representation commuting with the tame Hecke algebra. On some compact open H its restriction is C(H,E)^s, s≥1.
Hypotheses: F/F+ is CM, G/F+ is a definite unitary group with G×F+F≅GL_n, n≥2, and every p-adic place of F+ splits in F. Fix ℘|p, K=F+_℘=F_℘̃, E large enough, dominant ξ_v and inertial τ_v at every other v|p with stable O_E-lattices Wξ,τ. U^℘ is sufficiently small; its other p-components are GL_n(O_{F+_v}); levels at inert finite places are hyperspecial. The nonzero local regular representation hypothesis Π|H≅C(H,E)^s has s≥1.
Carrier dependencies: CompletedCohomologyPartII:CC.8, OverconvergentAutomorphicForms:O0/finite-analytic-coefficients
Proof outline: Import the completed topological coefficient tower and its actions from CompletedCohomologyPartII:CC.8. Admissibility and the local regular model require the separate Jacquet–Emerton/definite-unitary input recorded in the owner gap. The finite double-coset description at sufficiently small level gives locally regular translation actions. The local regular model with positive multiplicity is a separate requested theorem; do not infer it from arbitrary admissibility.
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
Proof outline: Use the Jacquet–Emerton eigenvariety package requested as a Part II of PadicFamilies, rather than the compact Up package of L2a. Split T(K)=T(O_K)×Z^n after choosing uniformizers; compact character coordinates come from PMIA L0a, while unramified coordinates are G_m^n. Choice changes coordinates, not the character functor. The eigenvariety sheaf is the sheaf attached to the Jacquet strong dual, not an arbitrary coherent sheaf declared equal to it.
Acceptance: dim T̂=n([K:Q_p]+1), whereas the eigenvariety dimension below is n[K:Q_p]. For n=2,K=Q_p the two dimensions are 4 and 2; do not count unramified coordinates as weight dimensions.
Sources: DING-2025 §4.2.2, p.67, immediately before Proposition 4.14

### OverconvergentAutomorphicForms:O0/unitary-eigenvariety-geometry

theorem TauCeti.Overconvergent.unitary_eigenvariety_geometry : Under DH and the imported Jacquet–Emerton construction, E(U^℘) is equidimensional of dimension n d_K, d_K=[K:Q_p], and its specified coherent sheaf M(U^℘) is Cohen–Macaulay over E(U^℘).
Hypotheses: All three DH hypotheses apply; the local model has s≥1. These are the jointly proved parts (1)–(2) of Ding Proposition 4.14, not a generic property of supports of admissible representations.
Carrier dependencies: OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety, OverconvergentAutomorphicForms:O0/unitary-completed-coefficients
Proof outline: Apply the local regular model from unitary-completed-coefficients. Invoke the precise dimension/depth theorem of the Jacquet–Emerton package (Ding proof references BHS Lemma 3.10, Proposition 3.11, Corollary 3.12 and its §5.2). This is recorded as an owner gap, not silently re-proved here.
Acceptance: For n=2,K=Q_p the dimension is 2, not 4. Cohen–Macaulayness concerns the actual Jacquet coefficient sheaf, not every coherent sheaf.
Sources: DING-2025 Proposition 4.14(1)–(2), p.67

### OverconvergentAutomorphicForms:O0/unitary-eigenvariety-reduced

theorem TauCeti.Overconvergent.unitary_eigenvariety_reduced : The same E(U^℘) is reduced, under the definite-unitary hypotheses and the classical-density theorem in the supplied Jacquet–Emerton package.
Hypotheses: F/F+ is CM, G/F+ is a definite unitary group with G×F+F≅GL_n, n≥2, and every p-adic place of F+ splits in F. Fix ℘|p, K=F+_℘=F_℘̃, E large enough, dominant ξ_v and inertial τ_v at every other v|p with stable O_E-lattices Wξ,τ. U^℘ is sufficiently small; its other p-components are GL_n(O_{F+_v}); levels at inert finite places are hyperspecial. The nonzero local regular representation hypothesis Π|H≅C(H,E)^s has s≥1.
Carrier dependencies: OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety, OverconvergentAutomorphicForms:O0/unitary-eigenvariety-geometry
Proof outline: Use the Jacquet formalism’s density of suitable classical points and the generic regularity argument cited by Ding Proposition 4.14(3). Record that this source-proof leaf is requested from the proposed PadicFamilies Part II; reducedness does not follow just from equidimensionality or a Cohen–Macaulay sheaf.
Acceptance: The ring E[ε]/(ε²) is Cohen–Macaulay and equidimensional but not reduced; this rules out deriving (3) from (1)–(2) alone.
Sources: DING-2025 Proposition 4.14(3) and proof, p.67

### OverconvergentAutomorphicForms:O1/right-automorphy-cocycle

definition TauCeti.Overconvergent.RightCocycle : Let X have a right Γ-action and C be a coefficient group. A right automorphy cocycle is J:Γ×X→C with J(1,x)=1 and J(γδ,x)=J(γ,x)J(δ,xγ). For a left representation ρ:C→Aut_A(V), equivariant functions satisfy f(xγ)=ρ(J(γ,x)⁻¹)f(x). In analytic geometry J is an analytic map on the actual cover and coefficient neighbourhood.
Hypotheses: Γ acts on the right. For a left action and left cocycle K with K(γδ,x)=K(γ,δx)K(δ,x), use x·γ=γ⁻¹x and J(γ,x)=K(γ⁻¹,x)⁻¹. Then left equivariance f(γx)=ρ(K(γ,x))f(x) becomes the stated right inverse-equivariance. Both the inverse group element and inverse coefficient are required in the noncommutative conversion. C and ρ need not commute. Analyticity and stable-lattice preservation are genuine imported conditions, not implicit in a set-theoretic cocycle.
Carrier dependencies: mathlib:Representation, AutomorphicBundles:B0/sections-equivariant, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Bundle the algebraic cocycle laws; use Representation for ρ. Check consistency: successive inverse coefficient actions are ρ(Jδ(xγ)⁻¹)ρ(Jγ(x)⁻¹)=ρ((Jγ(x)Jδ(xγ))⁻¹). Analytic versions import the site and coefficient neighbourhood, using AutomorphicBundles B0’s associated-bundle conventions after converting left/right actions. Convert the BHW left action explicitly: its scalar coefficient multiplier is Kγ(x)=κ(jγ(x))⁻¹, so the corresponding right scalar cocycle is Jγ(x)=κ(jγ⁻¹(x)). The cz+d function itself has the left cocycle law of O2.
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
Proof outline: Use the equalizer of the two action maps on q_* of analytic coefficient functions; equalizers preserve the sheaf condition. The right cocycle gives a descent datum on Y×_X Y and its triple-overlap identity. For finite coefficients invoke the imported associated-bundle framework; effectivity on v/profinite covers is the separate theorem below.
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
Proof outline: Check each map on the torsor by the cocycle identity and the representation tensor/dual laws. Use uniqueness of effective descent to compare the resulting maps and prove identities/composition. Use AutomorphicBundles B0 ineffective-fibre criterion only for the finite tame quotient to which its hypotheses apply.
Acceptance: Finite-character averaging over a p-divisible group order is valid over L but need not preserve an O+ lattice.
Sources: BHW-2023 §9, Lemmas 9.3–9.7, pp.1782–1786

### OverconvergentAutomorphicForms:O1/analytic-line-effectivity

theorem TauCeti.Overconvergent.analytic_line_effectivity : For smooth rigid X over a perfectoid field extension of Q_p and a v-line L obtained by cocycle descent, analyticity on a Zariski-dense analytic open implies analyticity on X. For a topologically finite-type formal O_K-scheme 𝔛 and a pro-etale profinite formal torsor 𝔛∞→𝔛, a continuous multiplicative cocycle c:G→O(𝔛∞)× gives a v-line on the generic fibre that is the analytification of a Zariski line on 𝔛. An arbitrary analytic O+-unit cocycle is not substituted for this formal cocycle.
Hypotheses: The first assertion is for line bundles, not arbitrary Banach or rank-r v-bundles. For the formal assertion the cocycle lies in units of the completed formal structural ring O(𝔛∞), reduces modulo p^m through a finite quotient, and the finite-level descended lines form a compatible effective system. The map O(𝔛∞)→O+(X∞) used by Heuer is a natural map, not an asserted general isomorphism.
Carrier dependencies: OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf, PerfectoidSpaces:P9
Proof outline: Import Heuer Corollary 1.4 and Proposition 3.8 from PerfectoidSpaces:P9, as requested below. Apply the first to extend ordinary analytic trivializations of the line. For the formal assertion descend at each finite quotient modulo p^m and use formal p-adic effectivity; do not swap global sections with limits on arbitrary nonaffine bases.
Acceptance: An arbitrary v-vector bundle is not declared analytic by this line-bundle criterion.
Sources: HEUER-2022 Corollary 1.4, p.3; Proposition 3.8, p.16

### OverconvergentAutomorphicForms:O2/admitted-hilbert-domain

construction TauCeti.Overconvergent.admitted_hilbert_domain : Choose the anticanonical Hilbert domain X_{Γ0*(p^n)}(ε)_a, n≥1 or ∞, and its infinite-level cover with T4’s Hodge–Tate coordinate z. The chosen bounded analytic weight extension and m,ε satisfy DOM; at finite level AL_n maps the level-domain of radius p^n ε to X(ε). At n=0 define on X(ε) by AL_1 from X_{Γ0*(p)}(pε)_a. This domain is the input for coefficients, rather than a definition of the Hilbert tower itself.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
Carrier dependencies: HodgeTateAndCanonicalSubgroups:T4, OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights, OverconvergentAutomorphicForms:O0/bounded-weight-families, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Import canonical subgroup, anticanonical domain and z-bounds from HodgeTateAndCanonicalSubgroups:T4. Intersect the geometric admissibility range with the weight-extension range. Restrictions and AL_n retain the scaled Hasse radius. The corrected radius exists by O0; no ε is computed from the false printed |T| formula.
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
Proof outline: Use c∈pO_p and the anticanonical z-bound to place cz+d in B_r(O_p^×:1). Evaluate the selected analytic κ-extension; its inverse is defined since the extension is multiplicative into units. For vectors retain the actual Levi-valued left frame cocycle and its coefficient representation. Convert to O1 with Kγ⁻¹(x)⁻¹; do not reuse the scalar commutation argument for noncommuting coefficients.
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
Proof outline: Use the source left fractional-linear transformation z(δx)=(aδ z(x)+bδ)/(cδ z(x)+dδ). Matrix multiplication gives cγδ z+dγδ=(cγ z(δx)+dγ)(cδ z+dδ), establishing the left law. Evaluate the multiplicative analytic scalar character and use inverse coefficient equivariance. For general vector factors apply the noncommutative ofLeft conversion in O1, with reversed inverse order.
Acceptance: At p=3, γ=[[1,0],[3,1]], δ=diag(2,1), z=1, jγδ=7 and jγ(δz)jδ(z)=7; the erroneous right-action expression jγ(z)jδ(γz) is 4. An upper unipotent has trivial scalar factor. General noncommutative factors use Kγ⁻¹(x)⁻¹; coefficient factors cannot be reordered.
Sources: BHW-2023 Definition 6.4 and the construction following it, pp.1757–1758; BHW-2023 §5.2.1, Definition 5.14, pp.1749–1750; §5.5, Lemma 5.31, p.1755; §8.2, Definition 8.8, p.1768

### OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf

construction TauCeti.Overconvergent.geometric_hilbert_sheaf : Define ω_n^κ on X_{Γ0*(p^n)}(ε)_a×U as the actual Γ0*(p^n)-equivariant coefficient functions on X_{Γ*(p∞)}(ε)_a×U with scalar factor κ(cz+d)⁻¹. For n=∞ use the corresponding kernel subgroup of the projection. For n=0 transport through AL_1. This is an analytic invertible sheaf, not an alias for AIP’s independent sheaf.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
Carrier dependencies: OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf, OverconvergentAutomorphicForms:O1/analytic-line-effectivity, OverconvergentAutomorphicForms:O2/hilbert-cocycle-law, OverconvergentAutomorphicForms:O2/admitted-hilbert-domain, PerfectoidSpaces:P9, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Use the actual left tower action and multiplier f(γx)=κ(jγ(x))⁻¹f(x); convert to O1’s right equalizer with x·γ=γ⁻¹x and Jγ=jγ⁻¹. No unconverted right cz+d identity is used. On the ordinary locus use the supplied Igusa formal trivialization and analytic-line-effectivity. Use the dense-open analytic-line criterion from O1 to obtain an analytic invertible sheaf on the smooth domain; finite-level descent through the tower is supplied by P9.
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
Proof outline: Compare both sides on the common infinite cover: the coordinate, cocycle and weight coincide. O1 descent-functoriality gives unique identifications. For level zero transport the definition through AL_1 rather than asserting an unrelated tower quotient.
Acceptance: A composition of level/radius maps gives the same identification as the composite map.
Sources: BHW-2023 Definition 6.5 and Remark 6.7, p.1758; Definition 7.13, p.1764

### OverconvergentAutomorphicForms:O2/hilbert-algebraic-specialisation

comparison TauCeti.Overconvergent.hilbert_algebraic_specialisation : For κ(x)=∏_{σ:F→L}σ(x)^{kσ}, the geometric ω_n^κ identifies with ⊗_σ ω_σ^{kσ} on the anticanonical domain, pulled back via the specified AL_n convention. For κ=N^k this is (det ω)^k. Locally algebraic finite characters retain their finite-level character twist.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. The embeddings and classical differential eigenlines are defined over L; integer exponents may be negative since the factors are lines.
Carrier dependencies: OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf, AutomorphicBundles:B4, HodgeTateAndCanonicalSubgroups:T5
Proof outline: Import the algebraic Hodge bundle and representation correspondence from AutomorphicBundles:B4. T5 identifies the tautological Hodge–Tate trivialization with the differential frame; its transformation is cz+d. Evaluate the algebraic character on this frame and descend. Finite-character twists are retained on their level cover.
Acceptance: F=Q, κ(x)=x^k recovers ω^k with the stated AL convention. κ=1 recovers O, whereas κ=N recovers det ω.
Sources: BHW-2023 Remark 6.7, p.1758

### OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf

construction TauCeti.Overconvergent.integral_hilbert_sheaf : Define ω_n^{κ,+} as the O+ equivariance equalizer on the actual infinite-level cover, for the same left level action and multiplier κ(jγ(x))⁻¹ as ω_n^κ. The admitted factors have integral unit values. This defines the specified subsheaf of rational coefficients; invertibility on the AIP-admitted intersection is the separate comparison target geometric-aip-comparison, with its unresolved integral input recorded as a gap.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. The coefficient chart is equipped with A+ and the character extension is bounded in integral units. Integral local invertibility uses the independent AIP comparison, not a characteristic-zero averaging argument.
Carrier dependencies: OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf, PerfectoidSpaces:P9, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Form the O+ equalizer using the same cocycle; inverse factors preserve O+. The inclusion into rational functions is tautological. At finite level transport along the same tower and AL maps. Do not assume integral local freeness here. It is an output of the O5 comparison target; the full finite-character integral generator/descent step is recorded as unresolved.
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
Proof outline: Use geometric-aip-comparison to identify the integral equalizer with the independently constructed integral AIP line. On an AIP trivializing patch its generator pulls back to the perfectoid frame; rational equivariant sections are the same generator times invariant rational functions. P9 identifies these invariants with O of the base. Thus localisation of the integral line identifies with the independently defined rational line locally; glue. Arithmetic descent uses the integral-unit comparison maps of O4.
Acceptance: On an affinoid trivializing patch rational sections are precisely integral sections with a bounded p-denominator.
Sources: BHW-2023 Definition 9.8, p.1786

### OverconvergentAutomorphicForms:O3/hilbert-weight-pullback

theorem TauCeti.Overconvergent.hilbert_weight_pullback : For a morphism of bounded smooth weight families U′→U pulling back κ and the chosen common analytic extension, the pulled-back geometric coefficient line is ω_n^{κ′}; with compatible integral structures the same holds integrally. These identifications commute with level and radius maps.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Maps of weight families pull back the specified character and its analytic extension. Claims about sheaves do not assert arbitrary nonflat base change of global sections. Integral pullback is claimed only for flat formal coefficient changes satisfying P9’s completed-descent hypotheses, or for the explicitly proved AIP chart refinement maps. Arbitrary integral weight specialisation is excluded (AIP CUSP Remark 3.15).
Carrier dependencies: OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf, OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality, OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps, PerfectoidSpaces:P9
Proof outline: On the tower, pullback of the character is exactly the new automorphy factor. Use finite locally free coefficient descent and its base-change law rather than commuting arbitrary invariants with a nonflat tensor product. For O+ use the requested bounded integral descent/base-change theorem on compatible integral charts.
Acceptance: Specialising a family to a point recovers its character sheaf. This theorem does not imply arbitrary base change for all fixed-radius global sections.
Sources: BHW-2023 §6.1–6.2, Definitions 6.2 and 6.5, pp.1756–1758; AIP-CUSP-2016 Remark 3.15, p.17

### OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms

construction TauCeti.Overconvergent.fixed_radius_hilbert_forms : Mκ^{G*,c}(n,N,ε;U)=H^0(X_{c,U,Γ0*(p^n),μN}(ε)_a,ω_n^κ); define Mκ^{G*,c,+} using ω_n^{κ,+}. Restriction maps go from a larger admitted neighbourhood to a smaller one. Banach and projectivity claims require the finite-level affinoid weight and cusp hypotheses in O6.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Fix a positive prime-to-p polarisation ideal c. Both ε=0 and ε>0 have meanings, but they are different domains.
Carrier dependencies: OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf, OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf, OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps, HilbertModularVarietiesAndShimuraCurves:H3, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Take sections of the already constructed sheaves. The integral inclusion follows from O3 integral-hilbert-sheaf. Use sheaf restriction for maps; define the fixed-radius topology from the actual affinoid/coherent or Banach coefficient model, not the discrete topology.
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
Proof outline: Construct the filtered colimit of actual section modules and restriction maps. Equip it with the direct-limit locally convex topology supplied by LAD, using the Banach models at finite affinoid weight and finite level where available. Functoriality follows from commuting restriction diagrams; cofinal changes do not change the module.
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
Proof outline: Import the modified differential lattice and Hodge–Tate image from T5. Use its rank-one theorem to define the differential frame torsor used by O5. Retain both lattices and the map between them; only on the locus where the supplied theorem identifies them can the modification be omitted.
Acceptance: For a split/unramified Rapoport point the expected differential eigenline model agrees with the modification. As a local algebra test, over k[e]/e² the regular module has e acting as a nonzero Jordan block, whereas k² with e acting by zero is not free of rank one; equal k-dimensions do not establish O_F-line freeness.
Sources: BHW-2023 §7.1, pp.1759–1761

### OverconvergentAutomorphicForms:O4/presentation-geometric-small

construction TauCeti.Overconvergent.presentation_geometric_small : Define presentation (1) independently as the O+ equivariance equalizer on the actual cover X_{U,Γ*(p∞)}(ε)_a×U, with acting group Γ0*(p^n) and section transformation multiplier κ(cz+d)⁻¹; rational coefficients replace O+ by O. Push forward to the finite-level base. None of the four definitions is an abbreviation for another.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
Carrier dependencies: OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf, OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor, HilbertModularVarietiesAndShimuraCurves:H4, PerfectoidShimuraVarieties:S5, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Import the stated cover, group action and quotient from H4/S5. Use the same pulled-back Hodge–Tate coordinate on that cover. Form O1’s equivariant-function equalizer. For quotient groups the next representative-independence theorem is needed before the action is well-defined. Retain the separate cover and action as construction data; comparisons are subsequent maps, not definitional equalities.
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
Proof outline: Import the stated cover, group action and quotient from H4/S5. Use the same pulled-back Hodge–Tate coordinate on that cover. Form O1’s equivariant-function equalizer. For quotient groups the next representative-independence theorem is needed before the action is well-defined. Retain the separate cover and action as construction data; comparisons are subsequent maps, not definitional equalities.
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
Proof outline: Import the stated cover, group action and quotient from H4/S5. Use the same pulled-back Hodge–Tate coordinate on that cover. Form O1’s equivariant-function equalizer. For quotient groups the next representative-independence theorem is needed before the action is well-defined. Retain the separate cover and action as construction data; comparisons are subsequent maps, not definitional equalities.
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
Proof outline: Import the stated cover, group action and quotient from H4/S5. Use the same pulled-back Hodge–Tate coordinate on that cover. Form O1’s equivariant-function equalizer. For quotient groups the next representative-independence theorem is needed before the action is well-defined. Retain the separate cover and action as construction data; comparisons are subsequent maps, not definitional equalities.
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
Proof outline: Apply weight-comparison-totally-positive-units to η. In (3), cz+d becomes η(cz+d) and the polarisation multiplier gains w(η²), so the product is unchanged. In (4), the central factor is the same identity; continuity extends it to Z∞. The descent law follows from the Hilbert cocycle law.
Acceptance: Ignoring w(η²) generally breaks presentation (3).
Sources: BHW-2023 Lemma 9.2 and equation (9.1), pp.1781–1782

### OverconvergentAutomorphicForms:O4/geometric-full-cover-comparison

comparison TauCeti.Overconvergent.geometric_full_cover_comparison : Pullback from the full Γ tower to the Γ* tower identifies presentations (2) and (1), integrally and rationally. The inverse is constructed through X_{Γ*(p∞)}←X_{Γ*(p∞)}×O_p^×→X_{Γ(p∞)}, whose right map is a Z_p^×-torsor. It is a genuine isomorphism independent of the choice of full geometric cover.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
Carrier dependencies: OverconvergentAutomorphicForms:O4/presentation-geometric-small, OverconvergentAutomorphicForms:O4/presentation-geometric-full, PerfectoidShimuraVarieties:S5, PerfectoidSpaces:P9, HodgeTateAndCanonicalSubgroups:T4, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Pull back a section along the tower morphism; the coordinate/cocycle agree by S5/T4. For the inverse, pull the Γ* section to the product. The action diag(ε,1), ε∈Z_p^×, has j=1, giving invariance under the antidiagonal torsor action. Use P9’s O/O+ profinite torsor descent. Verify diag(u,1) invariance for all u∈O_p^× and Γ0* equivariance; these generate the full Γ0 action. The composites are the identity by faithful pullback.
Acceptance: For diag(u,1), the coefficient factor is κ(1)⁻¹=1.
Sources: BHW-2023 Lemma 9.3, pp.1782–1783

### OverconvergentAutomorphicForms:O4/twisted-polarisation-action

construction TauCeti.Overconvergent.twisted_polarisation_action : On π_* of presentation (2), define the left action of positive global units by ε·_w f=w(ε)(ε⁻¹)^*f. This preserves the geometric coefficient sheaf and factors through the finite group Δ(N) supplied by H4. This finite group differs from the profinite Δ(p∞N) acting on full towers.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1.
Carrier dependencies: OverconvergentAutomorphicForms:O4/presentation-geometric-full, OverconvergentAutomorphicForms:O4/arithmetic-representatives, HilbertModularVarietiesAndShimuraCurves:H4, HodgeTateAndCanonicalSubgroups:T4, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Compute the left action law using the commutative character w and inverse base pullback. Polarisation preserves the Hodge–Tate coordinate and commutes with the Γ action, so preserves geometric equivariance. Use H4’s congruence/square relations and κ(η)⁻¹w(η²)=1 to kill the specified kernel; do not assert that all totally positive units are squares.
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
Proof outline: Use H4’s finite quotient and the description of E(p^n) as the extension carrying both Γ and positive-unit actions. A section invariant under the twisted action satisfies exactly the E multiplier of presentation (3), and conversely. Sheaf equalizers therefore identify the two constructions even integrally; no averaging by 1/|Δ(N)| is used to define integral invariants.
Acceptance: Integral descent is not justified by dividing by a potentially p-divisible |Δ(N)|.
Sources: BHW-2023 Lemma 9.6, p.1784

### OverconvergentAutomorphicForms:O4/weil-pairing-comparison

comparison TauCeti.Overconvergent.weil_pairing_comparison : The map from presentation (4) to presentation (3) is f↦w(eβ)⁻¹π∞^*f. Its inverse multiplies by w(eβ) and descends through the actual profinite Δ(p∞N)-torsor. Both maps preserve O+ and are inverse. The transformation is (γ,x)^*w(eβ)=w(x⁻¹)w(det γ)w(eβ).
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1. The full-level pairing eβ is an O_p^×-valued map supplied by S5, with the stated transformation law.
Carrier dependencies: OverconvergentAutomorphicForms:O4/presentation-arithmetic-full, OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate, OverconvergentAutomorphicForms:O4/arithmetic-representatives, PerfectoidShimuraVarieties:S5, PerfectoidSpaces:P9, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Multiply the pullback by the inverse pairing character; its transformation changes w(det γ) into w(x) by cancellation. For the inverse, w(eβ)f is invariant under positive global units. Their density in the profinite quotient and continuity extend invariance to Δ(p∞N). Apply P9 profinite descent and faithful pullback to prove the inverse and its PΓ0 equivariance. Pairing values are integral units, so preserve O+.
Acceptance: The plain pullback π∞^* does not convert the determinant multiplier to the polarisation multiplier when w is nontrivial.
Sources: BHW-2023 Equation (9.5) and Lemma 9.7, pp.1784–1786

### OverconvergentAutomorphicForms:O4/polarisation-class-forms

construction TauCeti.Overconvergent.polarisation_class_forms : For arithmetic forms take the direct sum of fixed-c spaces over prime-to-p fractional ideals and quotient by P_x(f)−f for totally positive p-adic units x, where P_x transports c to xc. The indexing quotient is the finite narrow class group. Integral forms use the corresponding integral lattices. For G* retain a chosen set of class representatives and the specified comparison maps.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. An arithmetic family is κ_ar=(w,t), with geometric κ=ρ(w,t). n≥1 or ∞; level zero is transported separately by AL_1. Use H3/H4’s transport maps and their composition law; for arithmetic forms a transport by a positive unit stabilizing an ideal is already the identity after descent.
Carrier dependencies: OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms, OverconvergentAutomorphicForms:O4/weil-pairing-comparison, OverconvergentAutomorphicForms:O4/finite-polarisation-descent, HilbertModularVarietiesAndShimuraCurves:H3, HilbertModularVarietiesAndShimuraCurves:H4, tauceti:NumberField.NarrowClassGroup, tauceti:NumberField.NarrowClassGroup.instFinite, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Construct arithmetic fixed-c sections from presentation (4) and its level-zero transport. Use H4’s positive-p-unit transport and its composition law to form the stated quotient module. Use baseline NarrowClassGroup and its finiteness instead of rebuilding ideal class theory; H3 supplies identification of the prime-to-p ideal indexing quotient.
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
Proof outline: Use H4’s transport composition and O4 twisted/finite descent to kill the stabilizer ambiguity. Build the representative-change map componentwise with P_x; its inverse uses P_{x⁻¹}. The quotient relation makes both composites and all correspondence diagrams independent of x in the arithmetic case. Retain the chosen conjugation in the geometric case.
Acceptance: Changing a polarisation representative twice agrees with changing it by the product transport.
Sources: BHW-2023 Remark 10.6, p.1791; Definition 9.10, pp.1786–1787

### OverconvergentAutomorphicForms:O5/aip-independent-coefficients

construction TauCeti.Overconvergent.aip_independent_coefficients : On each AIP chart construct the modified differential frame torsor F_{n,r,I} and its B_n=O_p×·(1+p^n Hdg^(−p^n/(p−1))Res_{O_F/Z}G_a) action independently of the perfectoid tower. Define the analytic rational and integral coefficient sheaves as the κ⁻¹-eigenfunctions in (g_n f_n)_*O and (g_n f_n)_*O+ on this actual analytic torsor. In the formal AIP construction, first construct w_{n,r,I} for the universal character on W_F^0, then retain §6.4’s finite-character factor wχ for a full weight. The full formal sheaf is coherent; Prop.4.3 is not cited to assert its integral formal invertibility for every χ.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum. Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges.
Carrier dependencies: HodgeTateAndCanonicalSubgroups:T5, OverconvergentAutomorphicForms:O3/ramified-modified-lattice, OverconvergentAutomorphicForms:O0/bounded-weight-families, LocallyAnalyticDistributions:L0, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Import T5’s canonical subgroup, modified lattice, Hodge–Tate congruence and the frame torsor; retain its B_n-action. Extend the universal-coordinate character via AIP Proposition 2.8 on W_F^0. For a full weight retain the finite torsion character χ and its independent eigencomponent on the normalized finite Igusa cover (§6.4, p.29). Take actual κ⁻¹ analytic O and O+ eigenfunctions. The universal formal line and the full finite-character formal factor are separate; identification of the latter with the analytic O+ lattice remains part of the recorded integral comparison gap.
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
Proof outline: For the W_F^0 universal formal line apply AIP Proposition 4.3, proved by Lemmas 4.4–4.6: the trace-compatible projector constructs a generator congruent to 1 modulo topologically nilpotent elements, and normality finishes the argument. For full weights retain §6.4’s coherent wχ factor. Supply the missing passage from this formal finite-character factor to an invertible analytic O+ eigenline and its local generator. Rational or ordinary-locus invertibility alone does not supply that statement. Use Proposition 4.7 for the universal formal chart transitions; verify the finite-character factor and its O+ lattice transitions as part of the same unresolved input. On a common refinement compare the actual eigenfunctions to obtain the triple-overlap identity.
Acceptance: Overlaps identify generators up to integral units and satisfy the triple-overlap cocycle.
Sources: AIP-ADIC-2016 Propositions 4.3 and 4.7, pp.16–18; BHW-2023 Proposition 7.10, p.1762

### OverconvergentAutomorphicForms:O5/geometric-aip-comparison

comparison TauCeti.Overconvergent.geometric_aip_comparison : On the common admitted domains, for all n≥0 and n=∞, the chosen Hodge–Tate tautological frame defines ω_{G*,n}^{κ,+}≅ω_{G*,AIP,n}^{κ,+}, and hence the rational line isomorphism. At n=0 use AL_1 on both sides. Positive radii are chosen from the verified intersection; no εκ derived from the false printed supremum/formula is asserted.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum. Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant.
Carrier dependencies: OverconvergentAutomorphicForms:O5/aip-line-and-gluing, OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf, HodgeTateAndCanonicalSubgroups:T5, PerfectoidSpaces:P9, OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Use T5’s actual left-equivariant tautological map s(γx)=jγ(x)s(x), including the scaled map s∘u_n in the AL_n diagram. Pull an AIP eigenfunction along s. Its inverse-character relation is precisely the perfectoid κ⁻¹ automorphy relation. To prove integral surjectivity, first supply an AIP generator whose pullback f is a unit in the cover O+, or a stronger coefficient-sensitive integral descent argument. Then any equivariant g has invariant integral ratio g/f, and P9 identifies that invariant ring with base O+. This proves local freeness and the isomorphism without assuming the perfectoid equalizer is already a line. The required full finite-character generator/descent statement is the recorded unresolved input. Glue using chosen tautological frames; handle ∞ with the corresponding limit torsor and 0 via the scaled AL_1 diagram.
Acceptance: F=Q specialises to the modular-curve perfectoid–Pilloni construction after the same inverse-weight and AL conventions. Integral freeness of the perfectoid coefficient equalizer follows on this intersection.
Sources: BHW-2023 Theorem 7.14 and proof, pp.1764–1765

### OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison

comparison TauCeti.Overconvergent.arithmetic_aip_comparison : Define arithmetic AIP coefficients independently as the twisted finite Δ(N)-invariants of π_* of geometric AIP coefficients. Then ω_{G,c,n}^{κ,+}≅ω_{G,c,AIP,n}^{κ,+} for n≥0 or ∞ and the common admitted radii. The isomorphism includes the Weil-pairing character and finite polarisation action; rationalisation gives the arithmetic analytic line.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum. Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Arithmetic family κ_ar=(w,t) with geometric κ=ρ(w,t); translate AIP CUSP’s (ν,w_AIP) as ν=w and w_AIP=t⁻¹.
Carrier dependencies: OverconvergentAutomorphicForms:O5/geometric-aip-comparison, OverconvergentAutomorphicForms:O4/weil-pairing-comparison, OverconvergentAutomorphicForms:O4/finite-polarisation-descent, OverconvergentAutomorphicForms:O4/geometric-full-cover-comparison, OverconvergentAutomorphicForms:O4/twisted-polarisation-action, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Follow the explicit chain: presentation (4)→(3) via w(eβ)⁻¹; (3)→finite Δ-invariants of (2); (2)→(1); (1)→geometric AIP by the torsor comparison. The twisted polarisation action on geometric AIP agrees with O4’s action by its frame calculation. Thus the last map descends integrally. Transport level zero by AL_1 and rationalise locally. Hecke equivariance is the later O6 theorem, not presumed here.
Acceptance: Removing w(eβ)⁻¹ breaks the determinant/polarisation equivariance for nontrivial w.
Sources: BHW-2023 Definition 9.11 and Theorem 9.12, p.1787; AIP-CUSP-2016 §4, weight convention before Theorem 4.4, pp.26–28

### OverconvergentAutomorphicForms:O5/aip-comparison-naturality

theorem TauCeti.Overconvergent.aip_comparison_naturality : The geometric and arithmetic comparisons are uniquely determined by their maps on the chosen tautological frame torsors. They commute with weight pullback, admitted chart/radius refinement and compatible level maps; equality of dimensions or a scalar normalisation at one classical weight does not determine this comparison.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use the independent AIP formal weight chart indexed by I=[p^k,p^k′], 0≤k≤k′, with r_AIP≥3 and r_AIP+k≥n_AIP≥k′+2 for odd p (≥k′+4 for p=2). Set n′=n_AIP−k′−2 (or −4). These are universal-coordinate conditions; δ is not silently identified with the corrected pro-p supremum. Choose a positive or ordinary radius in the intersection of the canonical-subgroup, analytic-character and AIP torsor admissibility ranges. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Maps of weight families pull back the specified character and its analytic extension. Claims about sheaves do not assert arbitrary nonflat base change of global sections.
Carrier dependencies: OverconvergentAutomorphicForms:O5/geometric-aip-comparison, OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison, OverconvergentAutomorphicForms:O3/hilbert-weight-pullback, HodgeTateAndCanonicalSubgroups:T5, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: On a common trivializing cover, both maps evaluate the same eigenfunction at the same selected frame. This proves uniqueness after faithful pullback. Use T5’s compatibility of the tautological frame with each change of base, level and radius and AIP Proposition 4.7 for chart changes. For arithmetic coefficients the Weil pairing and twisted polarisation action also pull back compatibly, so descent preserves each commuting diagram.
Acceptance: Rescaling a chosen frame rescales both eigenfunction descriptions in the same way.
Sources: BHW-2023 Proofs of Theorems 7.14 and 9.12, pp.1764–1765,1787; AIP-ADIC-2016 Proposition 4.7, pp.17–18

### OverconvergentAutomorphicForms:O6/hilbert-cusp-forms

construction TauCeti.Overconvergent.hilbert_cusp_forms : On the supplied smooth toroidal compactification with boundary divisor D, define the subcanonical coefficient line ω^κ(−D)=ω^κ⊗I_D and cusp forms Sκ(n,N,ε;U)=H^0(ω^κ(−D)) on the admitted toroidal neighbourhood, with the corresponding integral lattice and positive-radius colimit. Arithmetic forms descend with the same boundary ideal.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. C6 supplies the toroidal/minimal neighbourhoods, boundary Cartier ideal, extensions of the coefficient line and boundary-compatible maps.
Carrier dependencies: OverconvergentAutomorphicForms:O5/geometric-aip-comparison, OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison, ShimuraCompactifications:C6, OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Import the compactification and boundary geometry from ShimuraCompactifications:C6. Extend the coefficient line via O5 and the AIP compactified torsor, then tensor with the actual ideal I_D. Define sections and restriction maps. The boundary ideal is retained through finite arithmetic polarisation descent.
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
Proof outline: Apply AIP ADIC Proposition 8.4 through the exact Koecher package requested from C6: extend across minimal boundary of codimension at least two. Compare the subcanonical sheaf by the ideal D, not by the extension theorem. For degree one use B5’s compactified cusp expansion and its boundary constant term. O5 compares the coefficient lines on the compactified torsor.
Acceptance: A section with nonzero q-constant term can extend by Koecher and still fail to be a cusp form.
Sources: AIP-ADIC-2016 §8.4, Proposition 8.4, pp.36–37 (statement p.37); BHW-2023 Remark 6.9, p.1759

### OverconvergentAutomorphicForms:O6/tame-hilbert-hecke

construction TauCeti.Overconvergent.tame_hilbert_hecke : For a prime ideal a∤pN and its moduli correspondence X_c←^{π1}C_a→^{π2}X_{ca}, use the canonical coefficient identification θ:π2*ω→π1*ω from the prime-to-p Hodge–Tate isogeny. Set T_a=q_a⁻¹Tr_{π1} θ π2*, q_a=|O_F/a|. It maps the ca component to c, preserves radii, extends to the boundary, and descends to arithmetic polarisation classes.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. π1 is finite locally free of degree q_a+1 for the prime cyclic-subgroup correspondence. The normalization is 1/q_a, not reciprocal degree.
Carrier dependencies: OverconvergentAutomorphicForms:O4/polarisation-class-forms, OverconvergentAutomorphicForms:O2/hilbert-cocycle-law, HilbertModularVarietiesAndShimuraCurves:H3, ShimuraCompactifications:C6, AdicSpacesPartII:R3/pull-identify-trace, AdicSpacesPartII:R3/analytic-trace-finite-locally-free, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product, HilbertModularVarietiesAndShimuraCurves:H1, HilbertModularVarietiesAndShimuraCurves:H4
Proof outline: Import the moduli correspondence and its compactified extension from H3/C6. Use the prime-to-p isogeny to identify Hodge–Tate frames and their cocycles (BHW Lemma 10.1). Apply AdicSpacesPartII R3 pull-identify-trace and finite locally free trace; multiply by q_a⁻¹. Since a∤p this normalization is an integral unit. Use arithmetic descent and polarisation transport to define the same operator on the class-independent module.
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
Proof outline: Import the p-level moduli correspondence, its degree and partial-radius image from H3/T4/C6. Compute u_𝔭* z=ϖ_𝔭 z and conjugation γ↦(a,ϖb;ϖ⁻¹c,d); the cz+d factor is unchanged. Changing ϖ by a unit changes the level action by a diagonal element with j=1, so the coefficient map agrees. Apply finite locally free trace and the 1/q_𝔭 factor. This may require renormalization to preserve an integral lattice.
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
Proof outline: Import the level automorphism and associated coefficient identification from H3 and B5. Use O1 functoriality to obtain the section map. Compute identity/composition on the actual cover. Boundary and polarisation compatibility allow restriction to cusp forms and descent to arithmetic classes.
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
Proof outline: For tame isogenies, naturality of the Hodge–Tate sequence makes the torsor frame diagram commute. For wild isogenies, use the adjugate u_𝔭^∨ and u_𝔭^∨e1=e1 in the frame comparison; this identifies the perfectoid coefficient map with the AIP differential pullback. Trace projection/base-change compatibility gives equality after the identical normalization. Arithmetic descent retains the pairing twist and polarisation action. Degree-one finite level correspondences give the diamond compatibility.
Acceptance: The comparison diagram uses exactly the same scalar normalizer on its two sides.
Sources: BHW-2023 Proposition 10.8 and proof, pp.1791–1792

### OverconvergentAutomorphicForms:O6/hilbert-q-expansion-comparison

comparison TauCeti.Overconvergent.hilbert_q_expansion_comparison : At each supplied compactified cusp, the O5 frame comparison identifies the perfectoid coefficient q-expansion with the AIP expansion. At algebraic weights it agrees with B5’s classical Hilbert expansion after converting κ_ar=(w,t) to (ν=w,w_AIP=t⁻¹) and matching B5’s coefficient line, cusp labels and Hecke normalization. Vanishing of every cusp constant term characterizes cuspidality in the supplied range.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use B5’s exact algebraic-weight, tame level and coefficient-ring hypotheses for its classical expansion principle; p-level/family expansions require the requested extension below.
Carrier dependencies: OverconvergentAutomorphicForms:O5/aip-comparison-naturality, OverconvergentAutomorphicForms:O6/aip-hecke-equivariance, AutomorphicBundles:B5/hilbert-cusp-expansion, AutomorphicBundles:B5/hilbert-expansion-principle, AutomorphicBundles:B5/hilbert-cuspidal-boundary, AutomorphicBundles:B5/hecke-expansion-compatibility, AutomorphicBundles:B5, ShimuraCompactifications:C6, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Pull both coefficient sections to the same Tate semi-abelian cusp chart. T5’s chosen differential/HT frame evaluates to the same formal trivialization. Use B5’s cusp-expansion and boundary criteria for classical specialisations; retain the coefficient line rather than pretending expansions are scalar at every cusp. Use the separately requested bounded-family, p-level extension for the full coefficient sheaf. Compare correspondence expansions by the pull-identify-trace formula and the declared normalizers.
Acceptance: For F=Q the cusp constant coefficient is zero precisely for cusp sections. A classical B5 theorem at prime-to-p full level is not applied directly to an arbitrary Iwahori family without the requested extension.
Sources: BHW-2023 Remark 6.9; Proposition 10.8, pp.1759,1791–1792

### OverconvergentAutomorphicForms:O6/fixed-cusp-banach-modules

theorem TauCeti.Overconvergent.fixed_cusp_banach_modules : At finite wild level and bounded affinoid weight U=Spa(A,A+), with κ locally n_an-analytic and partial Hasse bounds 0<v_i<1/p^{n_an}, on a selected cofinal global-Hasse minimal affinoid neighbourhood inside the partial-radius region, the fixed-radius cusp module is a projective Banach A-module in the (Pr) sense: a continuous direct summand of an orthonormalisable Banach module. Weight specialisation to the source’s coefficient-field points is surjective. This is not finite projectivity, and no such claim is made for every noncuspidal or infinite-level section module.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use the sufficiently small tame level, compactified coefficient model, positive cofinal partial-radius range and finite-level cusp vanishing hypotheses of AIP CUSP Theorems 3.16 and 4.4. For arithmetic descent work in characteristic zero, where the finite Δ projector is defined. Choose the refined global-Hasse strict affinoid neighbourhood of AIP CUSP Proposition 3.22’s Hattori footnote. Arbitrary simultaneous partial-radius opens are not assumed affinoid.
Carrier dependencies: OverconvergentAutomorphicForms:O6/hilbert-cusp-forms, OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison, ShimuraCompactifications:C6, LocallyAnalyticDistributions:L4/projective-banach-modules, OverconvergentAutomorphicForms:O6/cuspidal-coefficient-vanishing
Proof outline: Use O5/O6 cusp comparisons to identify the fixed-radius cusp module with AIP’s compactified coefficient module. Apply AIP CUSP Theorem 4.4 at fixed v; use its proof via Theorem 3.16 and the finite characteristic-zero idempotent for arithmetic forms. Use cuspidal-coefficient-vanishing on the actual finite-level formal cusp model. The cofinal global-Hasse refinement supplies affinoid acyclicity; the p-complete free local coefficient modules and split exact Cech resolution give (Pr). Use LAD L4’s projective Banach terminology and scalar-extension results only within their exact hypotheses.
Acceptance: For F=Q an infinite-dimensional fixed-radius cusp module may satisfy (Pr) without being finite projective over A. The statement excludes ε=0 and infinite wild level.
Sources: AIP-CUSP-2016 Theorem 4.4 and proof, p.28; Theorem 3.16, p.18

### OverconvergentAutomorphicForms:O6/compact-radius-restriction

theorem TauCeti.Overconvergent.compact_radius_restriction : For finite-level fixed cusp Banach modules on nested admissible minimal affinoid neighbourhoods V⋐_U W with coherent pushed-forward cusp coefficient, restriction S(W)→S(V) is completely continuous in the nonarchimedean finite-rank-approximation sense used by LAD L4. It is not justified merely by continuity or by compactness of a topological image over a general affinoid algebra.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use C6’s coherent cusp pushforward and the relative compactness W,V required by AdicSpacesPartII:R3. Source S(W) satisfies (Pr). Choose the same cofinal global-Hasse affinoid models as fixed-cusp-banach-modules, with the required relative compact containment after the controlling radius improvement.
Carrier dependencies: OverconvergentAutomorphicForms:O6/fixed-cusp-banach-modules, AdicSpacesPartII:R3/restriction-strictly-completely-continuous, LocallyAnalyticDistributions:L4/completely-continuous, ShimuraCompactifications:C6
Proof outline: Apply AdicSpacesPartII:R3/restriction-strictly-completely-continuous to the coherent sections: after a continuous surjection from a topologically free Banach module, the restriction is strictly completely continuous. Use the (Pr) splitting of fixed-cusp-banach-modules to remove that presentation; finite-rank approximation is preserved under bounded pre/post composition. Use LAD L4/completely-continuous for the exact operator notion. For the controlling product choose V at improved partial radius v/p.
Acceptance: Restriction along an equality of domains is the identity and is not completely continuous on an infinite orthonormalisable module.
Sources: AIP-CUSP-2016 Lemma 3.27 and proof, p.24

### OverconvergentAutomorphicForms:O6/controlling-hilbert-operator

construction TauCeti.Overconvergent.controlling_hilbert_operator : On finite-level arithmetic cusp forms over a bounded affinoid family define U_p=∏_{𝔭|p}U_𝔭^{e_𝔭}, e_𝔭=v_𝔭(p), using the commuting arithmetic operators and polarisation transports. The product maps through the neighbourhood with every partial Hasse bound v_i/p; its total normalizer is (∏q_𝔭^{e_𝔭})⁻¹=p^(−g).
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use compatible finite-level partial-radius correspondences and a fixed positive radius vector v. The arithmetic class quotient gives a canonical endomorphism; G* requires the stated polarisation representative maps. Choose the same cofinal global-Hasse affinoid models as fixed-cusp-banach-modules, with the required relative compact containment after the controlling radius improvement.
Carrier dependencies: OverconvergentAutomorphicForms:O6/wild-hilbert-hecke, OverconvergentAutomorphicForms:O4/polarisation-choice-independence, HilbertModularVarietiesAndShimuraCurves:H3, HodgeTateAndCanonicalSubgroups:T4, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Compose wild operators with multiplicities e_𝔭. Their quotient isogenies cover all primes above p and their combined radius gain is division by p in each coordinate (AIP Lemma 3.25(4)). Use arithmetic polarisation-choice-independence to identify the final pc component with c. Compute ∏q_𝔭^{e_𝔭}=p^{∑e_𝔭f_𝔭}=p^g; retain that normalizer.
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
Proof outline: Use U_p=bounded correspondence map ∘ restriction S(v)→S(v/p). Apply compact-radius-restriction and stability of complete continuity under bounded composition from LAD L4. O6 AIP Hecke equivariance gives the same factorisation as AIP CUSP Lemma 3.27, including normalization and polarisation choices.
Acceptance: At F=Q the factorisation passes through radius v/p. An individual split-prime operator improves only one direction, so this proof does not apply to it.
Sources: AIP-CUSP-2016 Lemma 3.27, p.24; BHW-2023 Remark 10.6, p.1791

### OverconvergentAutomorphicForms:O6/hecke-lattice-renormalisation

theorem TauCeti.Overconvergent.hecke_lattice_renormalisation : T_a preserves the specified integral lattice. Each q_𝔭 U_𝔭 preserves it, and p^g U_p preserves it because ∏q_𝔭^{e_𝔭}=p^g. These are sufficient uniform renormalizations on the stated domains, not assertions of optimality or integrality of the rational normalized U_𝔭 for every weight.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use integral coefficient maps, trace preserving O+ on the supplied finite locally free integral correspondence models, and integral polarisation transport.
Carrier dependencies: OverconvergentAutomorphicForms:O6/tame-hilbert-hecke, OverconvergentAutomorphicForms:O6/wild-hilbert-hecke, OverconvergentAutomorphicForms:O6/controlling-hilbert-operator, AdicSpacesPartII:R3/analytic-trace-finite-locally-free, PerfectoidSpaces:P9, HilbertModularVarietiesAndShimuraCurves:H4
Proof outline: Tame normalizers q_a are p-adic units, so the integral pull-identify-trace map remains integral. For a wild factor remove 1/q_𝔭; its coefficient map and integral trace preserve the lattice. Compose the renormalized factors and use the degree/norm identity of controlling-hilbert-operator; arithmetic integral transport preserves the lattice.
Acceptance: For F=Q the sufficient renormalization is pU_p. Tame integral preservation alone cannot prove normalized wild integral preservation.
Sources: BHW-2023 Lemma 10.3 and Remark 10.7, pp.1789–1791

### OverconvergentAutomorphicForms:O7/ordinary-completed-functions

construction TauCeti.Overconvergent.ordinary_completed_functions : On each ordinary formal affinoid patch define V+ = lim_m colim_i H^0(Ig_i,O/p^m), with i the finite Igusa level. Sheafify the compatible patchwise construction to obtain the completed Igusa structural sheaf; V=V+[1/p]. Global ordinary p-adic forms are its sheaf sections. Do not exchange the two limits or replace sheafwise completion by an unconditional global-section formula.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use T5’s actual ordinary formal Igusa tower with finite-etale transition maps. The inverse limit defines the formal completed structural ring; an identification with the actual analytic tower O+ is the separate O7 comparison target, with the exact hypotheses still recorded as a gap.
Carrier dependencies: HodgeTateAndCanonicalSubgroups:T5, PerfectoidSpaces:P9, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Reduce the finite Igusa tower modulo p^m and form its direct limit in level first. Take the p-adic inverse limit with its inverse-limit topology; this constructs formal completed tower functions. Do not identify it with analytic O+ merely from Heuer Proposition 3.8’s natural map. Glue and sheafify over the ordinary formal base. Any global-limit interchange on a nonaffine space requires separate acyclicity/Mittag–Leffler hypotheses.
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
Proof outline: Construct the weight equalizer in the already completed Igusa structural sheaf. Continuity of κ makes the finite reductions compatible; no single Igusa level is claimed to support every continuous character. Use the same twisted finite polarisation descent and Weil-pairing transformation for the arithmetic forms.
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
Proof outline: At each m use the finite-etale system and its structural colimit. Construct the natural equivariant map from the ordered formal completion to O+(X∞) as in Heuer. Prove it is an isomorphism for the actual Igusa tower using the additional integral-closure/completion theorem at P9; this precise source input remains unresolved. Restriction compatibility glues the comparison; equivariance is verified at each finite quotient before completion.
Acceptance: The constant affine tower reduces to the ordinary p-adic completion formula. For a constant nonnormal formal model Spf(O_K⟨pT,T²,T³⟩), the integral element T is power-bounded on the generic fibre but is not in the formal structural ring. Thus a completion-to-O+ isomorphism cannot be asserted for arbitrary topologically finite-type formal models without further hypotheses.
Sources: HEUER-2022 Proof of Proposition 3.8, p.16

### OverconvergentAutomorphicForms:O7/ordinary-restriction

construction TauCeti.Overconvergent.ordinary_restriction : Restrict a fixed positive-radius geometric/arithmetic form to the ordinary locus and pull back to its Igusa frame, producing its weighted completed Igusa function. The maps are compatible with positive-radius restrictions and therefore give Mκ†→ordinary Igusa forms, with integral and cusp versions. No surjectivity onto all ordinary forms is part of this map.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Choose a common analytic extension of κ to a neighbourhood B_r(O_p^×:1), and m≥1 with p^(−m)≤r<1. Put c_p=2 for p≥5, 3 for p=3, 4 for p=2. The anticanonical domain has 0≤ε≤1/(c_p p^m). At every level the radius is pulled back along the stated Atkin–Lehner map, not silently held constant. Use the ordinary torsor frame comparison of T5 and O5. The map on integral sections uses the actual completed structural sheaf comparison.
Carrier dependencies: OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms, OverconvergentAutomorphicForms:O7/ordinary-weighted-forms, OverconvergentAutomorphicForms:O7/igusa-completion-comparison, OverconvergentAutomorphicForms:O5/aip-comparison-naturality, HodgeTateAndCanonicalSubgroups:T5, AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product
Proof outline: Restrict the coefficient section to ε=0. Pull to the ordinary Igusa torsor and evaluate using the selected differential/HT frame; its transformation is precisely the inverse weight relation. Apply igusa-completion-comparison to identify the integral function, retain arithmetic twists, and use the positive-radius colimit universal property.
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
Proof outline: On each ordinary formal patch the HT frame and modified differential frame coincide through T5. Use O1 analytic-line-effectivity’s formal Igusa descent theorem to identify the weighted completed functions with the coefficient line. Apply the O4 pairing and finite twisted descent to the arithmetic model; glue by the selected frame’s uniqueness.
Acceptance: For an algebraic elliptic weight this is the usual ordinary differential trivialization of ω^k.
Sources: HEUER-2022 Proposition 3.8, p.16; AIP-ADIC-2016 §8.4, discussion after Proposition 8.4, p.37

### OverconvergentAutomorphicForms:O7/ordinary-hecke-expansions

theorem TauCeti.Overconvergent.ordinary_hecke_expansions : Ordinary restriction and the ordinary coefficient comparison commute with compatible weight/level/radius maps, normalized tame T_a, diamonds and wild U_𝔭 on the supplied ordinary correspondences, and with all supplied cusp q-expansions. Cusp forms remain cusp forms and integral renormalized operators obey the same comparison.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use the compactified ordinary correspondence, expansion and integral-trace inputs requested for O6; retain the same normalizers and arithmetic transport.
Carrier dependencies: OverconvergentAutomorphicForms:O7/ordinary-restriction, OverconvergentAutomorphicForms:O7/ordinary-coefficient-comparison, OverconvergentAutomorphicForms:O6/aip-hecke-equivariance, OverconvergentAutomorphicForms:O6/hilbert-q-expansion-comparison, OverconvergentAutomorphicForms:O6/hecke-lattice-renormalisation, PerfectoidSpaces:P9
Proof outline: Restrict the O6 isogeny/torsor diagrams to the ordinary locus; the Igusa frame is the restriction of their tautological frame. Finite-level reductions commute with the supplied correspondence maps and trace. Take completion in the established order to obtain the ordinary diagrams. On Tate cusp charts the same coefficient trivialization gives the same q-series; arithmetic twists and the boundary ideal persist under descent.
Acceptance: In the elliptic case ordinary and overconvergent restriction have the same q-expansion at each ordinary cusp. No assertion of equality of all ordinary and finite-slope overconvergent spaces follows.
Sources: BHW-2023 Proposition 10.8, pp.1791–1792; HEUER-2022 Proposition 3.8, p.16

### OverconvergentAutomorphicForms:O6/cuspidal-coefficient-vanishing

theorem TauCeti.Overconvergent.cuspidal_coefficient_vanishing : For the supplied toroidal-to-minimal map ρ at the finite Igusa/p-level formal model and the small analytic coefficient Ωχ, R^qρ_*Ωχ(−D)=0 for q>0; the untwisted structural assertion is R^qρ_*O(−D)=0. After the permitted base changes, the pushed-forward cusp coefficient is coherent and gives the acyclic affinoid section model used for (Pr) and specialisation.
Hypotheses: F is a totally real number field of degree g; p is any rational prime, including ramified primes. Tame level N is prime to p and sufficiently small for the Hilbert moduli schemes and finite-level torsors; work over a complete perfectoid extension L of Q_p containing the required embeddings and roots of unity. A bounded smooth weight family has a smooth rigid base U over L and image in an affinoid of the appropriate weight space. Affinoid assertions additionally require U=Spa(A,A+) with A reduced and equipped with its compatible uniform spectral norm. Use the precise formal Igusa normalization, boundary divisor and sufficiently small analytic character χ of AIP CUSP §3.6. The formal cusp vanishing input from the fan/unit quotient is the recorded missing compactification theorem. The chosen minimal neighbourhood is an actual global-Hasse affinoid strict neighbourhood inside the partial-radius region; AIP CUSP Proposition 3.22’s Hattori footnote explicitly requires this refinement.
Carrier dependencies: ShimuraCompactifications:C6, AdicSpacesPartII:R3/tate-acyclicity-finite-modules, OverconvergentAutomorphicForms:O5/aip-line-and-gluing
Proof outline: Use the formal cusp description supplied by C6: the completed torus embedding fan modulo its unit group, with positive support for O(−D). The formal-functions theorem reduces higher direct-image vanishing to cohomology of those cusp fibres; AIP CUSP Appendix Proposition 6.4 gives the required fan/unit-quotient vanishing. This auxiliary theorem is recorded as a Part II owner gap, not presumed from a compactification alone. AIP Lemma 3.19 identifies the small analytic character line modulo p with O. Lift the structural vanishing by p-adic completeness/Nakayama as in Corollary 3.20. On the refined minimal affinoid use AdicSpacesPartII R3 finite-module Tate acyclicity; apply finite characteristic-zero projectors only after rationalisation.
Acceptance: The argument uses −D and is not asserted for every noncuspidal coefficient sheaf.
Sources: AIP-CUSP-2016 Theorem 3.17, Corollary 3.20 and Proposition 3.22 with footnote, pp.18–21

### OverconvergentAutomorphicForms:O8/graph-normalisation

lemma TauCeti.Overconvergent.Siegel.graph_normalisation : Put J=A+ZC and Zγ=J⁻¹(B+ZD). If det J is a unit, then [I,Z][A,B;C,D]=J[I,Zγ]. Here [I,Z] is Matrix.fromCols I Z and J⁻¹ is the nonsingular matrix inverse.
Hypotheses: R is a commutative ring; the matrix index set n is finite with decidable equality. All displayed blocks and Z are square n by n matrices. These algebraic statements include the empty index set; the geometric application has g≥1. det(A+ZC) is a unit.
Carrier dependencies: mathlib:Matrix.fromCols, mathlib:Matrix.fromCols_mul_fromBlocks, mathlib:Matrix.mul_fromCols, mathlib:Matrix.mul_nonsing_inv
Proof outline: Expand the left-hand side by Matrix.fromCols_mul_fromBlocks. Expand the right-hand side by Matrix.mul_fromCols and cancel JJ⁻¹ using Matrix.mul_nonsing_inv. No symplectic hypothesis is needed for this finite algebra identity.
Acceptance: For γ=I the coordinate is Z and the factor is I. For g=1 the coordinate is (a+zc)⁻¹(b+zd). For g=1, Z=0 and γ=[0,1;1,0], the factor is zero and the normalisation equation fails; the unit hypothesis is essential.
Sources: drw-v3 Lemma 2.3.1 and its displayed proof, p. 15

### OverconvergentAutomorphicForms:O8/factor-composition

lemma TauCeti.Overconvergent.Siegel.factor_composition : For γ=[A,B;C,D], δ=[E,F;G,H], put Jγ(Z)=A+ZC and Zγ=Jγ(Z)⁻¹(B+ZD). If det Jγ(Z) is a unit, then Jγδ(Z)=Jγ(Z)(E+ZγG), where Jγδ(Z)=(AE+BG)+Z(CE+DG). Thus Jγδ(Z)=Jγ(Z)Jδ(Zγ), in this order.
Hypotheses: R is a commutative ring; the matrix index set n is finite with decidable equality. All displayed blocks and Z are square n by n matrices. These algebraic statements include the empty index set; the geometric application has g≥1. det Jγ(Z) is a unit.
Carrier dependencies: OverconvergentAutomorphicForms:O8/graph-normalisation, mathlib:Matrix.fromBlocks_multiply, mathlib:Matrix.mul_nonsing_inv
Proof outline: Use Matrix.fromBlocks_multiply for the top-left and bottom-left entries of γδ. Distribute (A+ZC)(E+Jγ(Z)⁻¹(B+ZD)G). Cancel JJ⁻¹ using graph-normalisation and compare the four summands.
Acceptance: Verify Jγδ(Z)=Jγ(Z)Jδ(Zγ), not the reversed product. Genus-two upper and lower elementary unipotent matrices do not commute, so a scalar-only test cannot establish the matrix order. With either block matrix the identity, the factor law reduces to the identity law.
Sources: drw-v3 Lemma 2.3.1, p. 15; equation (5), p. 20; Remark 3.1.15, p. 25

### OverconvergentAutomorphicForms:O8/coordinate-composition

lemma TauCeti.Overconvergent.Siegel.coordinate_composition : With γ,δ,Jγ and Zγ as above, assume det Jγ(Z) and det(E+ZγG) are units. Then Z(γδ)=(Zγ)δ: explicitly [(AE+BG)+Z(CE+DG)]⁻¹[(AF+BH)+Z(CF+DH)]=(E+ZγG)⁻¹(F+ZγH).
Hypotheses: R is a commutative ring; the matrix index set n is finite with decidable equality. All displayed blocks and Z are square n by n matrices. These algebraic statements include the empty index set; the geometric application has g≥1. Both consecutive denominator determinants are units.
Carrier dependencies: OverconvergentAutomorphicForms:O8/graph-normalisation, OverconvergentAutomorphicForms:O8/factor-composition, mathlib:Matrix.isUnit_iff_isUnit_det, mathlib:Matrix.nonsing_inv_mul, mathlib:Matrix.fromBlocks_multiply
Proof outline: factor-composition expresses the denominator of γδ as a product of units; Matrix.isUnit_iff_isUnit_det supplies its invertibility. Apply graph-normalisation twice and associate [I,Z]γδ. The two resulting graph matrices have the same unit leading factor. Cancel that factor by Matrix.nonsing_inv_mul and read the right block, giving the displayed identity.
Acceptance: Three chart coordinates compose in the same right-action order as their block matrices. If a consecutive denominator is not a unit, no assertion of chart preservation is made.
Sources: drw-v3 Lemma 2.3.1, p. 15

### OverconvergentAutomorphicForms:O8/antidiagonal-dual-factor

lemma TauCeti.Overconvergent.Siegel.antidiagonal_dual_factor : Let W be an involutive square matrix, W²=I, with W Zᵀ W=Z. Then W(A+ZC)ᵀW=W AᵀW+(W CᵀW)Z. For the reversal matrix W=breve I, this is Jγ(Z)‡=A‡+C‡Z, where M‡=W Mᵀ W.
Hypotheses: R is a commutative ring; the matrix index set n is finite with decidable equality. All displayed blocks and Z are square n by n matrices. These algebraic statements include the empty index set; the geometric application has g≥1. W²=I and W Zᵀ W=Z.
Carrier dependencies: mathlib:Matrix.transpose_mul
Proof outline: Apply Matrix.transpose_mul to ZC; it gives CᵀZᵀ. Insert W² between Cᵀ and Zᵀ and use the antidiagonal symmetry of Z. The resulting C‡Z order corrects the expressions used in the two intertwining computations of Proposition 3.3.10; source issue E-O8-10 records the counterexample.
Acceptance: For W=[0,1;1,0], Z=[0,1;0,0], C=[0,0;3,0], A=I, the left side is diag(1,4), while A‡+ZC‡=diag(4,1). For general q=pⁿ≠0 the same example is a strict-Iwahori, indeed principal-level, lower unipotent symplectic element. For g=1 the two orders coincide, so this test must use g≥2.
Sources: drw-v3 Proof of Proposition 3.3.10, constructions Ψ1 and Ψ2, pp. 35–36

### OverconvergentAutomorphicForms:O8/determinant-character-cocycle

lemma TauCeti.Overconvergent.Siegel.determinant_character_cocycle : Let R,S be commutative rings and χ:R×→S× a group homomorphism. For consecutive invertible denominator matrices j=Jγ(Z), k=Jδ(Zγ), and l=Jγδ(Z), let d=det:GL(n,R)→R× be the baseline determinant homomorphism. Then χ(d(l))⁻¹=χ(d(j))⁻¹χ(d(k))⁻¹. In particular, χ(u)=uᵐ gives d(l)^(−m)=d(j)^(−m)d(k)^(−m) for every integer m.
Hypotheses: R is a commutative ring; the matrix index set n is finite with decidable equality. All displayed blocks and Z are square n by n matrices. These algebraic statements include the empty index set; the geometric application has g≥1. S is commutative; j,k,l are matrix units with the three displayed underlying matrices. χ is a homomorphism, not an arbitrary function on units.
Carrier dependencies: OverconvergentAutomorphicForms:O8/factor-composition, mathlib:Matrix.GeneralLinearGroup.det, mathlib:Matrix.det_mul, mathlib:map_inv, mathlib:mul_zpow
Proof outline: factor-composition identifies l=jk; equality of matrix units is detected by their underlying matrices. Apply Matrix.GeneralLinearGroup.det and χ, then inversion in the commutative group S×. Use mul_zpow for the integer-weight consequence. This establishes the scalar inverse factor used for coefficient functions, not a reversed matrix cocycle.
Acceptance: Weight zero gives factor one. Weight one gives det(J)⁻¹ on coefficients; weight minus one gives det(J). On the empty matrix index set det=1. For g=1 this recovers (a+zc)^(−m).
Sources: drw-v3 Equation (5), p. 20; Definition 3.1.14(iii), p. 24

### OverconvergentAutomorphicForms:O8/hodge-frame-transformation

lemma TauCeti.Overconvergent.Siegel.hodge_frame_transformation : On Y_w let s=(s₁,…,s_g) be the frame of the pulled-back Hodge bundle obtained from the first g coordinate sections of the dual universal Lagrangian by the S3 isomorphism π_HT*W∨≅h*ω. Then, for γ=[A,B;C,D]∈K, γ*s=s(A+ZC). Consequently the right frame torsor is trivialized by s, with transition matrix Jγ(Z)=A+ZC.
Hypotheses: g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists. K is the group-theoretic strict Iwahori, the inverse image of the diagonal torus of GSp(2g,F_p). Its definition uses the full tower quotient, not the inadequate moduli data in source issue E-O8-1. Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p. The open period domain is defined by the supplied S3 map. When calling it a proven canonical/anticanonical neighbourhood, use the T3 comparison with p>2g and its stated radii; the mere period-domain definition requires no canonical-subgroup theorem.
Carrier dependencies: OverconvergentAutomorphicForms:O8/graph-normalisation, OverconvergentAutomorphicForms:O8/coordinate-composition, PerfectoidShimuraVarieties:S1, PerfectoidShimuraVarieties:S3, HodgeTateAndCanonicalSubgroups:T3
Proof outline: S3 provides the tautological dual-Lagrangian identification with h*ω, including its equivariance; this identity is not assumed as an O8 conclusion. On the row-graph chart [I,Z], compute the first g columns after right multiplication by γ. graph-normalisation identifies the coefficient matrix as A+ZC. Pull this computation through π_HT. This is the source Corollary 2.4.2 followed by equation (5).
Acceptance: For γ=1 the frame is fixed. The coefficient transformation is inverse to the frame transformation. No GSp(Q_p) action at fixed toroidal cone decomposition or Galois-equivariance after suppressing Tate twists is inferred.
Sources: drw-v3 Corollary 2.4.2, p. 17; Proposition 2.5.2, pp. 18–19; equation (5), p. 20

### OverconvergentAutomorphicForms:O8/determinant-frame-transformation

lemma TauCeti.Overconvergent.Siegel.determinant_frame_transformation : In the preceding setting put η=s₁∧…∧s_g, a nowhere-vanishing section of h*det(ω) on Y_w. For γ∈K, γ*η=det(Jγ(Z))η.
Hypotheses: g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists. K is the group-theoretic strict Iwahori, the inverse image of the diagonal torus of GSp(2g,F_p). Its definition uses the full tower quotient, not the inadequate moduli data in source issue E-O8-1. Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p. Use the genuine open period domain from S3; an identification with canonical/anticanonical Hasse domains additionally requires the quantitative T3 comparison, including p>2g where DRW §3.6 uses it. Boundary statements use the separate toroidal nodes below.
Carrier dependencies: OverconvergentAutomorphicForms:O8/hodge-frame-transformation, mathlib:Module.Basis.det_apply, mathlib:AlternatingMap.eq_smul_basis_det, mathlib:Matrix.GeneralLinearGroup.det, AutomorphicBundles:B4/siegel-coefficient, AutomorphicBundles:B0/sections-equivariant
Proof outline: Apply the top exterior power to hodge-frame-transformation. In a local determinant-line trivialization, Module.Basis.det_apply identifies the coefficient with det J; AlternatingMap.eq_smul_basis_det identifies every alternating coordinate evaluation with that determinant. The determinant-line constructions and gluing are imported from B4; invertibility of J shows η remains a frame.
Acceptance: For diagonal J with entries u₁,…,u_g, the factor is the product of the u_i. For g=1, η=s₁. The frame transforms by det J, while invariant coefficient functions transform by its inverse.
Sources: drw-v3 Corollary 2.4.2, p. 17; equation (5), p. 20

### OverconvergentAutomorphicForms:O8/scalar-coefficient-identification

theorem TauCeti.Overconvergent.Siegel.scalar_coefficient_identification : Let E be a complete coefficient field containing C_p, or a reduced affinoid coefficient algebra over C_p, and let χ be an analytic character of the unit neighbourhood containing det Jγ(Z). Suppose O0 supplies its extension and analytic scalar action on that neighbourhood, uniformly at the chosen radius. The O1 coefficient sheaf attached to this character and the Siegel Hodge-frame reduction has, on every open V⊂X_w, sections exactly the analytic coefficient functions f on h⁻¹(V) satisfying γ*f=χ(det Jγ(Z))⁻¹f for every γ∈K. The equality is compatible with restrictions in V.
Hypotheses: g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists. K is the group-theoretic strict Iwahori, the inverse image of the diagonal torus of GSp(2g,F_p). Its definition uses the full tower quotient, not the inadequate moduli data in source issue E-O8-1. Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p. Use the genuine open period domain from S3; an identification with canonical/anticanonical Hasse domains additionally requires the quantitative T3 comparison, including p>2g where DRW §3.6 uses it. Boundary statements use the separate toroidal nodes below. An actual O0 analytic character and its extension to the determinant neighbourhood are supplied. For a character initially on Z_p× use an O0 r-analytic extension and w>r+1; no assertion for a merely continuous character without that extension. O1 supplies the sheaf-category equalizer on this quotient and the relevant completed coefficient functions.
Carrier dependencies: OverconvergentAutomorphicForms:O8/hodge-frame-transformation, OverconvergentAutomorphicForms:O8/determinant-character-cocycle, OverconvergentAutomorphicForms:O0/finite-analytic-coefficients, OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf
Proof outline: hodge-frame-transformation identifies the actual transition matrix. Apply determinant-character-cocycle to obtain the scalar descent law. Invoke the O1 equalizer construction for that law. Its equalizer condition, under the actual frame trivialization, is exactly the displayed equation. O1 sheaf and pullback laws identify restrictions; do not replace the analytic section space by all set-theoretic functions.
Acceptance: χ=1 gives the structure sheaf after applying the supplied quotient descent theorem. The defining relation contains the inverse scalar factor. A radius outside the supplied extension domain is rejected. This statement does not assert coherence of an infinite-dimensional analytic induced module.
Sources: drw-v3 Definition 3.1.14(iii), p. 24; Remark 3.1.15, p. 25

### OverconvergentAutomorphicForms:O8/determinant-hodge-specialisation

theorem TauCeti.Overconvergent.Siegel.determinant_hodge_specialisation : Under the same actual torsor and descent hypotheses, take the algebraic character χ_m(u)=uᵐ, m∈Z, using its O0 specialization. Then the O1 scalar coefficient sheaf in scalar-coefficient-identification is canonically isomorphic to (det ω)^⊗m restricted to X_w. For negative m this denotes the corresponding tensor power of the dual line. On Y_w the map is f↦fη^⊗m; for m<0 use the dual frame. It is an isomorphism of sheaves, not a classicality theorem for global forms.
Hypotheses: g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists. K is the group-theoretic strict Iwahori, the inverse image of the diagonal torus of GSp(2g,F_p). Its definition uses the full tower quotient, not the inadequate moduli data in source issue E-O8-1. Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p. Use the genuine open period domain from S3; an identification with canonical/anticanonical Hasse domains additionally requires the quantitative T3 comparison, including p>2g where DRW §3.6 uses it. Boundary statements use the separate toroidal nodes below. The B4 determinant line, its duals and tensor powers, and O1 effective descent for this finite-rank coefficient object are supplied.
Carrier dependencies: OverconvergentAutomorphicForms:O8/scalar-coefficient-identification, OverconvergentAutomorphicForms:O8/determinant-frame-transformation, OverconvergentAutomorphicForms:O0/finite-analytic-coefficients, OverconvergentAutomorphicForms:O0/coefficient-tensor-dual, OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf, OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality, mathlib:mul_zpow, AutomorphicBundles:B4/siegel-coefficient, AutomorphicBundles:B0/sections-equivariant
Proof outline: determinant-frame-transformation gives γ*(η^⊗m)=det(Jγ)^mη^⊗m, using duals for negative weights. Multiply by the coefficient law det(Jγ)^(−m); the product is invariant and descends through O1. Conversely pull back a determinant-line section and express it uniquely in the frame η^⊗m. Invariance gives exactly the scalar coefficient law. The two maps are inverse on the torsor. Faithfulness in the imported descent equivalence gives the isomorphism downstairs.
Acceptance: m=0 gives O_Xw. m=1 gives det ω, not its dual. m=−1 gives (det ω)∨. In genus one this gives powers of the Hodge line. In genus two m=1 has local factor det(A+ZC), not one chosen matrix entry.
Sources: drw-v3 Equation (5), p. 20; §3.4, pp. 37–38

### OverconvergentAutomorphicForms:O8/algebraic-levi-specialisation

theorem TauCeti.Overconvergent.Siegel.algebraic_levi_specialisation : Let ρ:GL_g→GL(V) be a finite-dimensional algebraic representation over the coefficient field, restricted analytically to the actual O0 frame reduction. Let Q=Isom(O^g,ω) be the B4 right Hodge-frame torsor and Eρ=Q×^{GL_g}V with relation (qg,v)~(q,ρ(g)v). Then the O1 coefficient sheaf for this finite-rank representation and the Siegel factor Jγ(Z) is canonically isomorphic to Eρ|X_w. Its pulled-back coefficients satisfy γ*f=ρ(Jγ(Z))⁻¹f. For a Levi with a separate similitude character this statement uses the trivial character on that extra factor; extra twists must be included explicitly.
Hypotheses: g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists. K is the group-theoretic strict Iwahori, the inverse image of the diagonal torus of GSp(2g,F_p). Its definition uses the full tower quotient, not the inadequate moduli data in source issue E-O8-1. Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p. Use the genuine open period domain from S3; an identification with canonical/anticanonical Hasse domains additionally requires the quantitative T3 comparison, including p>2g where DRW §3.6 uses it. Boundary statements use the separate toroidal nodes below. V is finite-dimensional and ρ algebraic; O0 supplies its analytic restriction. B4 supplies Q and its associated bundle with the stated right-torsor convention, and O1 supplies effective descent.
Carrier dependencies: OverconvergentAutomorphicForms:O8/hodge-frame-transformation, OverconvergentAutomorphicForms:O8/factor-composition, OverconvergentAutomorphicForms:O8/antidiagonal-dual-factor, OverconvergentAutomorphicForms:O0/finite-analytic-coefficients, OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf, OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality, AutomorphicBundles:B4/siegel-coefficient, AutomorphicBundles:B0/sections-equivariant, AutomorphicBundles:B2/levi-highest-weight-convention
Proof outline: Pull back Q and trivialize it by the actual frame s from hodge-frame-transformation. The associated-bundle relation converts sγ=sJγ into the coefficient change ρ(Jγ)⁻¹. factor-composition proves that these changes compose correctly; O1 supplies the generic representation-valued descent theorem. Apply the O1 equivalence to the equivariant trivial bundle and the pullback of Eρ, whose transition maps agree. This proves the isomorphism. For comparison with the induced highest-weight model, keep the corrected antidiagonal_dual_factor available, but do not infer equality with its infinite-dimensional analytic enlargement.
Acceptance: The standard representation recovers ω with its rank g. The determinant representation agrees with determinant-hodge-specialisation at m=1. The dual standard representation recovers ω∨. A Schur representation recovers the corresponding B4 Schur-functor bundle. For g≥2, specializing an analytic induced module at an algebraic weight is not asserted to collapse to this finite-rank representation.
Sources: drw-v3 Corollary 2.4.2, p. 17; §3.4 and Proposition 3.4.3, pp. 37–38

### OverconvergentAutomorphicForms:O8/determinant-line-map

construction TauCeti.Overconvergent.Siegel.determinantLineMap : For a finite index set n, commutative rings R,S and a homomorphism χ:R×→S×, construct the S-linear map Lχ:S→(GL(n,R)→S), Lχ(a)(g)=a·χ(det g). Its image is the rank-one free determinant-character line, canonically isomorphic to S. This is the specific Siegel scalar eigenline embedding, not a new definition of induction or analytic functions. For an O0 character defined only on the determinant neighbourhood of an analytic Iwahori, the same formula is constructed directly on that group. Its multiplicativity and analyticity use the local O0 extension; no extension to every unit of C_p is asserted.
Hypotheses: n is finite with decidable equality; R,S are commutative rings; χ is a homomorphism into units. No analyticity or geometric assertion is made about the unrestricted function module.
Carrier dependencies: mathlib:LinearMap, mathlib:Matrix.GeneralLinearGroup.det, mathlib:Matrix.GeneralLinearGroup.mkOfDetNeZero, mathlib:Matrix.det_mul, mathlib:Matrix.det_transpose
Proof outline: Use the pointwise S-module on functions and the existing determinant homomorphism to construct the bundled LinearMap. Evaluate at the identity to obtain a left inverse, hence injectivity; use multiplicativity of determinant for both translation laws. For analytic coefficients, repeat this formula on the actual Iwahori group using the O0 local character extension on its determinant image; use determinant multiplicativity and evaluation at the identity there. A globally defined χ is required only for the unrestricted finite prototype. No identification with the whole induced module follows.
lemma TauCeti.Overconvergent.Siegel.determinantLineMap_apply : Lχ(a)(g)=a·χ(det g).
lemma TauCeti.Overconvergent.Siegel.determinantLineMap_at_one : Lχ(a)(1)=a.
lemma TauCeti.Overconvergent.Siegel.determinantLineMap_injective : Lχ is injective; its image is canonically a copy of S.
lemma TauCeti.Overconvergent.Siegel.determinantLineMap_left_translate : Lχ(a)(hg)=χ(det h)·Lχ(a)(g).
lemma TauCeti.Overconvergent.Siegel.determinantLineMap_right_translate : Lχ(a)(gb)=χ(det b)·Lχ(a)(g); this includes the full upper-unipotent invariance used in Borel induction.
lemma TauCeti.Overconvergent.Siegel.determinantLineMap_trivial : For the trivial character, Lχ(a) is the constant function with value a.
example TauCeti.Overconvergent.Siegel.determinantLineMap_test_trivial : For χ=1, every a and g satisfy Lχ(a)(g)=a.
example TauCeti.Overconvergent.Siegel.determinantLineMap_test_diagonal : For R=S=Q, χ=id, a=1 and the genuine GL₂ element diag(2,3), Lχ(1)(g)=6.
example TauCeti.Overconvergent.Siegel.determinantLineMap_test_unipotent : For R=S=Q, χ=id and g=[1,7;0,1], Lχ(1)(g)=1.
example TauCeti.Overconvergent.Siegel.determinantLineMap_test_evaluation : For any χ and a,b, equality Lχ(a)=Lχ(b) implies a=b, by evaluation at 1.
Acceptance: Evaluation at the identity recovers a, including over a ring with zero divisors. For χ=id over Q and g=diag(2,3), Lχ(1)(g)=6; a constant-function embedding gives the wrong answer. Every upper-unipotent genus-two g has value 1 for L_id(1).
Sources: drw-v3 Definitions 3.1.10 and 3.1.14, pp.23–24; Proposition 3.4.3, p.38

### OverconvergentAutomorphicForms:O8/siegel-analytic-instance

theorem TauCeti.Overconvergent.Siegel.siegel_analytic_instance : Let U=Spa(A,A+) be a bounded smooth weight family on the diagonal torus of GL_g with an O0 uniform r-analytic character κ, trivial on the upper-unipotent subgroup. For rational w>1+r, use the O0 coefficient module Cκ^(w-an)(Iw_GLg,B) of analytic functions satisfying f(ℓb)=κ(b)f(ℓ), with representation ρκ(h)f(ℓ)=f(hᵀℓ). On the supplied Siegel domain X_w, O1 applied to Jγ=Aγ+ZCγ yields the sheaf whose sections on V are analytic coefficients F on Y_w×_Xw V satisfying γ*F=ρκ(Jγ)⁻¹F. Its restriction and bounded family maps are the O1 maps. For κ=χ∘det the determinantLineMap formula, evaluated directly on the actual Iwahori with the O0 local extension of χ, identifies a rank-one subobject with scalar-coefficient-identification, not the entire induced sheaf.
Hypotheses: g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists. K is the group-theoretic strict Iwahori, the inverse image of the diagonal torus of GSp(2g,F_p). Its definition uses the full tower quotient, not the inadequate moduli data in source issue E-O8-1. Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p. w>1+r; the family has a uniform character extension, analytic action of all occurring Jγ, and completed coefficients supplied by O0. The period-domain application uses p odd. A canonical-domain assertion uses the T3 quantitative comparison with p>2g. Integral assertions require the analytic Gauss lattice, not pointwise integral values.
Carrier dependencies: OverconvergentAutomorphicForms:O8/hodge-frame-transformation, OverconvergentAutomorphicForms:O8/factor-composition, OverconvergentAutomorphicForms:O8/determinant-line-map, OverconvergentAutomorphicForms:O8/scalar-coefficient-identification, OverconvergentAutomorphicForms:O0/analytic-induced-coefficients, OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf
Proof outline: Import the analytic Iwahori module, transpose-left representation and bounded base-change interface from O0. Use hodge-frame-transformation and factor-composition to supply the actual right-action factor to O1; the inverse representation order is ρ(Jδ(Zγ))⁻¹ρ(Jγ(Z))⁻¹. Apply the O1 sheaf/restriction/family construction; evaluate the determinantLineMap formula on the actual analytic group using the local O0 character to obtain the scalar subobject. A character initially on Z_p× is not assumed to extend to all C_p×.
Acceptance: The identity group element acts identically and two noncommuting genus-two elements satisfy the correct shifted cocycle. At κ=1 and g≥2, analytic functions in the lower-unipotent coordinate survive; the entire fibre is not the one-dimensional constant line. At g=1 the unipotent coordinate set is empty and the determinant induced module is a character line. Restriction to a smaller supplied radius domain and bounded weight specialization agree with O1, under its analytic hypotheses.
Sources: drw-v3 Definition 3.1.10, Remark 3.1.13 and Definition 3.1.14, pp.23–25

### OverconvergentAutomorphicForms:O8/algebraic-induced-injection

theorem TauCeti.Overconvergent.Siegel.algebraic_induced_injection : For a dominant polynomial weight k=(k₁≥⋯≥k_g≥0), take the algebraic Borel-equivariant realization P_k of regular functions GL_g→A¹ with f(ℓb)=k(b)f(ℓ), using the transpose-left representation ρ_k of DRW Definition 3.4.2. On the same X_w with w>1+r_k, restriction of regular functions to the analytic Iwahori group induces a monomorphism E_{ρ_k}|X_w→ω_k,w, functorial in open restriction. E_{ρ_k} is the B4 bundle after the B2 highest-weight/dual conversion has identified this specific realization. This is an injection; no equality with the entire analytic induced module is asserted for g≥2. The scalar polynomial weight k=(m,…,m), m≥0, gives the determinant Hodge line subobject. Negative determinant weights are handled by finite-line dual descent, independently of this polynomial-weight source theorem.
Hypotheses: g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists. K is the group-theoretic strict Iwahori, the inverse image of the diagonal torus of GSp(2g,F_p). Its definition uses the full tower quotient, not the inadequate moduli data in source issue E-O8-1. Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p. The O0 restriction map from the algebraic induced realization to analytic induction is an equivariant injection; it includes full right-Borel equivariance, not merely torus eigenvectors. The B2 weight convention identifies ρ_k with the required B4 coefficient; no unproved equality of a representation and its dual is assumed.
Carrier dependencies: OverconvergentAutomorphicForms:O8/algebraic-levi-specialisation, OverconvergentAutomorphicForms:O8/siegel-analytic-instance, AutomorphicBundles:B2/levi-highest-weight-convention, AutomorphicBundles:B4/siegel-coefficient, OverconvergentAutomorphicForms:O0/algebraic-induced-comparison, OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf, OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality
Proof outline: Use the genuine regular-function/Borel-equivariant algebraic realization from O0 and B4/B2, together with its analytic restriction monomorphism. Apply algebraic-levi-specialisation to its finite fibre representation; compare with siegel-analytic-instance under the same Jγ. Descend the equivariant injection by O1. The finite associated-bundle route bypasses the incorrect frame-factor order in the printed Proposition 3.3.10.
Acceptance: For g=1 the map identifies the character fibre, and for constant dominant weights its finite source is det(ω)^m. For g=2, k=0, nonconstant analytic functions of the lower-unipotent coordinate show why surjectivity must not be claimed. The regular function x11*x22/det(x) is torus invariant but not right-upper-unipotent invariant; it is excluded from P_0.
Sources: drw-v3 Definition 3.4.2 and Proposition 3.4.3, p.38

### OverconvergentAutomorphicForms:O8/atkin-lehner-chart

lemma TauCeti.Overconvergent.Siegel.atkin_lehner_chart : For a finite index set n and commutative ring R, let q∈R. Then [I,Z][0,I;−qI,0]=[−qZ,I]. Thus over a p-adic coefficient field the Atkin–Lehner matrix with q=p changes the anticanonical graph coordinate Z to the canonical-chart coordinate Z′=−pZ. The graph identity alone says nothing about canonical subgroups or domain quotients.
Hypotheses: n finite with decidable equality; R commutative; q any element for the first identity and q a unit for the inverse formula.
Carrier dependencies: mathlib:Matrix.fromCols_mul_fromBlocks, mathlib:Matrix.fromBlocks_multiply
Proof outline: Apply Matrix.fromCols_mul_fromBlocks and simplify the scalar block products. Verify both block inverse products with Matrix.fromBlocks_multiply; specialize q to p in the coefficient field. Import the actual quotient/domain map from T3/S3 when using this identity to transport sheaves.
Acceptance: At genus one [1,z] maps to [−qz,1]; the sign and factor q are both visible. The formula holds at Z=0, including q=0; invertibility is asserted only for units q.
Sources: drw-v3 Remark 3.6.2, Atkin–Lehner display, p.43; canonical-chart coordinates in §3.6, p.42

### OverconvergentAutomorphicForms:O8/toroidal-coefficient-instance

theorem TauCeti.Overconvergent.Siegel.toroidal_coefficient_instance : For the genuine toroidal tower diamond D and period map π_HT^tor:D→FL supplied by S6, pull back the canonical M^c_μ-torsor on FL. Given a representation V in the O0/O1 coefficient category with an actual analytic action of M^c_μ (or a supplied reduction), form its associated coefficient object on D using O1. It is functorial in equivariant representation maps and agrees with the open-domain construction on the open Shimura subdiamond. Finite-level descent is asserted only for the effective descent data exported by O1; infinite Banach descent is not deduced from a pro-étale torsor alone. The construction uses diamonds and does not assert representability of D by a perfectoid space.
Hypotheses: A Shimura datum (G,X), neat finite level K=K^pKp and a smooth admissible toroidal cone system Σ in characteristic zero; F/Qp finite contains the reflex field and splits G and μ as in BP §4.4. Use G^c and M^c_μ, the central quotient and Levi of the imported canonical coefficient construction; the Hodge and Hodge–Tate parabolics are opposite. S6 supplies the inverse-limit toroidal diamond D and period map, with the compatible deck actions preserving the chosen cone system. General G(Qp) Hecke maps are correspondences between compatible levels and cone decompositions, using common refinements; a G(Qp) action on D at a fixed Σ is not assumed. T6:comparison supplies the canonical torsor comparison including the μ-cyclotomic twist. The relevant completed structure sheaf and descent category are supplied by O1. The chosen fibre object belongs to the supplied descent category; a torus character alone is not an action of the full Levi.
Carrier dependencies: PerfectoidShimuraVarieties:S6, HodgeTateAndCanonicalSubgroups:T6:comparison, OverconvergentAutomorphicForms:O0/finite-analytic-coefficients, OverconvergentAutomorphicForms:O0/analytic-induced-coefficients, OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf, OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality, AutomorphicBundles:B0/hodge-parabolic-convention, AutomorphicBundles:B0/sections-equivariant
Proof outline: Import S6 and T6:comparison, specifically BP Theorem 4.4.40, rather than reconstructing logarithmic period sheaves or the period map. Apply the existing O1 associated coefficient functor to the actual pullback torsor and the specified full group action/reduction. Use functoriality and restriction in O1 for representation morphisms and the open embedding; retain the boundary site.
Acceptance: The trivial finite fibre gives the completed structure sheaf on D. The Siegel open restriction with its chosen graph frame gives the same Jγ as hodge-frame-transformation. A character given only on a compact torus cannot be used on the full Levi without an analytic extension or an actual reduced torsor. At fixed Σ only the supplied cone-compatible deck actions are used; a general Hecke element requires compatible cone changes and a common refinement.
Sources: bp-author §4.4.38–4.4.40, pp.79–80; Hecke compatibility: Remark 4.4.28, p.76 and §4.6.18, pp.96–97

### OverconvergentAutomorphicForms:O8/toroidal-algebraic-comparison

theorem TauCeti.Overconvergent.Siegel.toroidal_algebraic_comparison : For a finite-dimensional algebraic representation ρ of M^c_μ, the finite coefficient object associated to π_HT^tor* (G^c,an/U_P) on D is isomorphic to the pullback of the canonical toroidal automorphic bundle Eρ^can associated to M_dR, twisted by the μ-action on Zp(1). On a μ-central summand where ρ∘μ has character t↦t^j, this is h*Eρ^can⊗Qp(j) after completed scalar extension. Without a chosen compatible root system the Tate line must remain in the statement. The comparison is compatible with tensor products, duals, representation morphisms and restriction to the open subdiamond.
Hypotheses: A Shimura datum (G,X), neat finite level K=K^pKp and a smooth admissible toroidal cone system Σ in characteristic zero; F/Qp finite contains the reflex field and splits G and μ as in BP §4.4. Use G^c and M^c_μ, the central quotient and Levi of the imported canonical coefficient construction; the Hodge and Hodge–Tate parabolics are opposite. S6 supplies the inverse-limit toroidal diamond D and period map, with the compatible deck actions preserving the chosen cone system. General G(Qp) Hecke maps are correspondences between compatible levels and cone decompositions, using common refinements; a G(Qp) action on D at a fixed Σ is not assumed. T6:comparison supplies the canonical torsor comparison including the μ-cyclotomic twist. The relevant completed structure sheaf and descent category are supplied by O1. ρ is algebraic and finite-dimensional; canonical toroidal extension is the normalized one supplied by B3.general. On an arithmetic base retain the Tate line; on C_p an untwisted formula requires a fixed trivialization.
Carrier dependencies: OverconvergentAutomorphicForms:O8/toroidal-coefficient-instance, PerfectoidShimuraVarieties:S6, HodgeTateAndCanonicalSubgroups:T6:comparison, AutomorphicBundles:B3.general/general-canonical-extension, AutomorphicBundles:B0/sections-equivariant
Proof outline: Use the S6/T6 identification M_HT=M_dR×^{μ,Zp×}Zp(1) from BP Theorem 4.4.40. Apply the associated finite coefficient functor and B0 sections-equivariant, and use the B3.general canonical extension rather than an arbitrary boundary extension. Decompose according to the central μ-weights when giving the explicit Tate-summand formula; use tensor/dual compatibility of the imported torsor equivalence.
Acceptance: The trivial representation has j=0 and gives the structure sheaf comparison. For a μ-weight-one line the comparison retains Qp(1); dropping it changes arithmetic Galois descent. After the specified Siegel twist trivialization, restriction to the graph domain agrees with determinant-hodge-specialisation and algebraic-levi-specialisation. At fixed Σ only the supplied cone-compatible deck actions are used; a general Hecke element requires compatible cone changes and a common refinement.
Sources: bp-author §4.4.38–4.4.40, pp.79–80; Hecke compatibility: Remark 4.4.28, p.76 and §4.6.18, pp.96–97

### OverconvergentAutomorphicForms:O8/supplied-domain-instance

application TauCeti.Overconvergent.Siegel.supplied_domain_instance : For a unitary or other Shimura datum, let U be an actual analytic domain in its finite-level variety or toroidal diamond, Q_H→U an actual analytic H-torsor reduction of the canonical Levi torsor supplied by its geometry owner, and V an O0 analytic coefficient with an action of H. The O1 coefficient sheaf associated to (Q_H,V) is the datum-specific instance on U. For finite algebraic V extending to the Levi, extension of structure group identifies this sheaf with the canonical B4 datum-specific bundle restricted to U, with any T6 cyclotomic twist retained. A morphism of supplied domains/reductions induces the O1 coefficient pullback map. This statement constructs no ordinary locus and assumes no canonical subgroup for arbitrary data.
Hypotheses: The datum, characteristic-zero coefficient base, level, actual domain and topology are supplied, not encoded by an unspecified proposition. Q_H is a genuine reduction and V has an analytic H-action at its proven radius; O1 supplies effective descent in this category. For the finite comparison, V extends algebraically to the full Levi and B4 supplies that datum-specific associated bundle.
Carrier dependencies: OverconvergentAutomorphicForms:O0/finite-analytic-coefficients, OverconvergentAutomorphicForms:O0/analytic-induced-coefficients, OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf, OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality, AutomorphicBundles:B0/sections-equivariant, AutomorphicBundles:B4, PerfectoidShimuraVarieties:S6, HodgeTateAndCanonicalSubgroups:T6:comparison
Proof outline: Import the supplied analytic reduction and its map to the canonical Levi torsor. Instantiate O1 on this reduction with the supplied O0 fibre action; use associated-torsor extension of structure group for finite algebraic V. Transport the B4 bundle through that equivalence and the T6 twist; obtain pullback naturality directly from O1.
Acceptance: With a trivial reduction the coefficient sheaf is the corresponding function sheaf tensored with V. With the Siegel Hodge-frame reduction the result recovers the Siegel nodes in this packet. Changing a frame by h changes coefficient coordinates by ρ(h)⁻¹; a noncommuting pair tests the order. An arbitrary unitary datum without a supplied analytic reduction is outside the hypotheses.
Sources: bp-author §4.6.12, pp.94–95 and §6.3.1, p.153

### OverconvergentAutomorphicForms:O8/bruhat-reduced-family

theorem TauCeti.Overconvergent.Siegel.bruhat_reduced_family : In the BP quasi-split abelian-type setting, choose a split finite coefficient field F, compatible reductive O_F model and rational Borel/torus, neat tame level and toroidal Σ. Let Kp=Kp,m′,0 with m′>0 and w∈^M W. For n≥0 use the supplied étale reduction M_dR,n,Kp on U_w,n=(π_HT,Kp^tor)⁻¹(]C_w,k[_n,n Kp), under H=Kp,w,Mμ^c Mμ,n^c. For a complete Tate affinoid (A,A+) over (F,O_F) and n-analytic ν_A:T^c(Zp)→A×, put κ_A=−w0,M wν_A−(w0,M wρ+ρ), using BP additive weight notation and the same positive roots. The O0/O1 coefficient sheaf on U_w,n is the BP §6.3.1 sheaf of functions on M_dR,n,Kp×Spa(A,A+) satisfying f(mb)=(w0,M κ_A)(b⁻¹)f(m) for b∈B^c∩H. When ν is algebraic and κ is Mμ-dominant, it admits the finite canonical coefficient injection Vκ→Vν^(n-an) of BP Proposition 6.3.6. This supplies a proved datum-specific reduction instance beyond a universal ordinary neighbourhood claim.
Hypotheses: G_Qp is quasi-split; G splits over F; use the actual integral model and Kp,m′,0 of BP §3.5.1, not a guessed principal-congruence subgroup. The toroidal setup is of abelian type as in the reduction section; F is enlarged when needed so the μ-cyclotomic image lies in the reduction group. For the precursor reduction with m,n≥0 require 0≤m−n≤m′−1 (BP Proposition 4.6.12); the family uses m=n and the pushout on p.95. O0 supplies the analytic induction with precisely this character, root shift and action; O1 supplies completed analytic descent. No local projectivity claim is made without the finite-trivializing cover conditions.
Carrier dependencies: OverconvergentAutomorphicForms:O8/supplied-domain-instance, PerfectoidShimuraVarieties:S6, OverconvergentAutomorphicForms:O0/analytic-induced-coefficients, OverconvergentAutomorphicForms:O0/algebraic-induced-comparison, OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf, OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality, AutomorphicBundles:B2/levi-highest-weight-convention, AutomorphicBundles:B4
Proof outline: Import the S6 reduction theorem with the BP radius/level and cyclotomic hypotheses, then push out the m=n reduction to the affinoid thickening group H. Use the O0 analytic induced realization with ν→κ and the exact Borel-equivariance convention; instantiate supplied-domain-instance. For algebraic κ dominant, restrict regular Borel-equivariant functions to analytic ones, then apply O1 to the finite injection; import the canonical coefficient from B4/B2.
Acceptance: The root correction w0,M wρ+ρ remains visible; replacing ν by κ without it gives the wrong finite coefficient. For a torus Levi there are no unipotent analytic coordinates; the fibre is the character line. The n=n radius choice satisfies the reduction inequality for every m′>0, whereas m−n>m′−1 is excluded. For G=Res_Qp²/Qp GL₂ and the mixed cocharacter of BP Example 4.6.10, Kp,w,Mμ is the actual projected subgroup, not an independently chosen full product Iwahori.
Sources: bp-author §4.6.8–4.6.15, pp.92–95; §6.3.1 and Proposition 6.3.6, pp.153–154
-/
