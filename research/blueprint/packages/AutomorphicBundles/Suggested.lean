import Mathlib.Analysis.Complex.Exponential
import Mathlib.Analysis.Normed.Module.FiniteDimension
import Mathlib.Geometry.Manifold.MFDeriv.Defs
import TauCeti.NumberTheory.ModularForms.HeckeSlash.Nebentypus.Prime.Basic
import TauCeti.NumberTheory.ModularForms.HeckeSlash.Nebentypus.Action
import TauCeti.AlgebraicGeometry.Modules.TensorProduct
import Mathlib.Algebra.Module.Equiv.Basic
import Mathlib.Algebra.Module.Submodule.Range
import Mathlib.Algebra.Group.TypeTags.Basic
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Homology.ShortComplex.Exact
import Mathlib.Data.ZMod.Basic
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.AdicCompletion.Noetherian
import Mathlib.RingTheory.Ideal.AssociatedPrime.Finiteness
import Mathlib.RingTheory.Trace.Defs
import Mathlib.NumberTheory.ModularForms.SlashActions
import Mathlib.NumberTheory.ModularForms.NormTrace
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.AlgebraicGeometry.Modules.Tilde

/-!
# Automorphic bundles and classical automorphic forms

This file is not the roadmap and is not exhaustive. The accompanying README.md
is definitive. These declarations suggest Lean names and signatures; a `sorry`
is an unproved placeholder.

The elaborated definitions use the existing SlashAction, linear-equivalence,
Scheme.Modules, complex-manifold differentiability and section-map interfaces.
They include normalized holomorphic automorphy factors, their functional forgetting,
the inverse-factor slash adapter, arithmetic Hilbert weights,
and sections of a supplied coefficient on a supplied model. The Fourier–Jacobi
examples use the existing short-complex monicity, prime-filtration induction,
adic completion, power-series and trace APIs. They do not construct a Shimura
model or its canonical coefficient.

The geometric definitions require the actual supplier carriers in README.md:
canonical principal torsors and contracted products, compact-dual coefficients,
toroidal models and completed Mumford families, fractional Hilbert cusp series,
and logarithmic cohomology/VB comparisons. Their conditions are omitted from
the functional prototypes when they cannot be stated at the pins. They are not
replaced by opaque Prop fields. The final comment lists their interfaces and
API/test names; those comments are not elaborated signatures.

Everything is in namespace AutomorphicBundles, including FJCoefficient,
FourierJacobi, ClassicalHecke, VectorFourierJacobi and SiegelHT. For a left base
action the coefficient convention is J(g*h,x)=J(g,h • x) ∘ J(h,x).
LinearEquiv.trans applies its first argument and then its second, so the Lean
cocycle reverses the displayed trans arguments. The slash factor is inverted.
The complex-linear SL2 comparison does not model determinant-negative GL2,
whose scalar law is semilinear.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

-/

/-! ## Automorphy factors, weights and section maps: automorphy factors, Hilbert weights and supplied sections -/

open scoped MatrixGroups ModularForm Manifold
open CategoryTheory

noncomputable section

namespace AutomorphicBundles

section LinearCoefficients

variable {β G X R V : Type*} [Monoid G] [MulAction G X]
  [Semiring R] [AddCommMonoid V] [Module R V]

/-- C1: the convention adapter into Mathlib's existing indexed right-action class.
No finite-dimensionality, topology, field or freeness hypothesis is required. -/
@[instance_reducible]
def slashActionOfAutomorphyFactor
    (J : β → G → X → (V ≃ₗ[R] V))
    (hone : ∀ k x, J k 1 x = LinearEquiv.refl R V)
    (hmul : ∀ k g h x, J k (g * h) x = (J k h x).trans (J k g (h • x))) :
    SlashAction β G (X → V) where
  map k g f x := (J k g x).symm (f (g • x))
  zero_slash := by sorry
  slash_one := by sorry
  slash_mul := by sorry
  add_slash := by sorry

variable (J : β → G → X → (V ≃ₗ[R] V))
  (hone : ∀ k x, J k 1 x = LinearEquiv.refl R V)
  (hmul : ∀ k g h x, J k (g * h) x = (J k h x).trans (J k g (h • x)))

/-- L1 / evaluation API. -/
theorem slashActionOfAutomorphyFactor_map_apply (k : β) (g : G) (f : X → V) (x : X) :
    (slashActionOfAutomorphyFactor J hone hmul).map k g f x =
      (J k g x).symm (f (g • x)) := by sorry

/-- L2: invariance is the original transformation law, with no cancellation of a
particular section value and hence with no nowhere-zero hypothesis. -/
theorem slashActionOfAutomorphyFactor_invariant_iff (k : β) (f : X → V) :
    (∀ g, (slashActionOfAutomorphyFactor J hone hmul).map k g f = f) ↔
      ∀ g x, f (g • x) = J k g x (f x) := by sorry

/-- API: this linear-coefficient construction is R-linear on functions. -/
theorem slashActionOfAutomorphyFactor_map_smul (k : β) (g : G) (r : R) (f : X → V) :
    (slashActionOfAutomorphyFactor J hone hmul).map k g (r • f) =
      r • (slashActionOfAutomorphyFactor J hone hmul).map k g f := by sorry

/-- API: the operator depends on coefficient maps, not on the selected proof terms. -/
theorem slashActionOfAutomorphyFactor_congr
    (K : β → G → X → (V ≃ₗ[R] V))
    (kone : ∀ k x, K k 1 x = LinearEquiv.refl R V)
    (kmul : ∀ k g h x, K k (g * h) x = (K k h x).trans (K k g (h • x)))
    (hJK : ∀ k g x, J k g x = K k g x) :
    slashActionOfAutomorphyFactor J hone hmul =
      slashActionOfAutomorphyFactor K kone kmul := by sorry

/-- API: trivial coefficients leave exactly precomposition by the left base action. -/
theorem slashActionOfAutomorphyFactor_map_of_trivial
    (hJ : ∀ k g x, J k g x = LinearEquiv.refl R V)
    (k : β) (g : G) (f : X → V) :
    (slashActionOfAutomorphyFactor J hone hmul).map k g f = fun x ↦ f (g • x) := by sorry

end LinearCoefficients

/-- L3: for the right base action x ⋅ g := g⁻¹ • x, the new factor is
J_right(x,g) := J(g⁻¹,x). Its composition law reverses the displayed product order.
This is not the definition of the right slash action on functions. -/
theorem inverse_base_action_cocycle {G H X : Type*} [Group G] [Group H] [MulAction G X]
    (J : G → X → H)
    (hmul : ∀ g h x, J (g * h) x = J g (h • x) * J h x)
    (g h : G) (x : X) :
    J ((g * h)⁻¹) x = J h⁻¹ (g⁻¹ • x) * J g⁻¹ x := by sorry

/-- L4: a scalar transformation law detects the cocycle at a point only when that
section value can be cancelled. A zero section places no constraint on a factor. -/
theorem cocycle_at_of_automorphy_of_ne_zero {G X K : Type*}
    [Monoid G] [MulAction G X] [Field K]
    (J : G → X → K) (f : X → K)
    (hf : ∀ g x, f (g • x) = J g x * f x)
    (g h : G) (x : X) (hx : f x ≠ 0) :
    J (g * h) x = J g (h • x) * J h x := by sorry

end AutomorphicBundles

namespace AutomorphicBundles.Test

open AutomorphicBundles

-- Tests use the actual constructor's map, not an abstract postulated slash operator.
-- AutomorphicBundles.slashActionOfAutomorphyFactor_test_trivial
example {G X R V : Type*} [Monoid G] [MulAction G X]
    [Semiring R] [AddCommMonoid V] [Module R V] (g : G) (f : X → V) (x : X) :
    (slashActionOfAutomorphyFactor (β := Unit)
      (fun _ _ _ ↦ LinearEquiv.refl R V) (by sorry) (by sorry)).map () g f x =
      f (g • x) := by sorry

-- AutomorphicBundles.slashActionOfAutomorphyFactor_test_zero
example {β G X R V : Type*} [Monoid G] [MulAction G X]
    [Semiring R] [AddCommMonoid V] [Module R V]
    (J : β → G → X → (V ≃ₗ[R] V))
    (hone : ∀ k x, J k 1 x = LinearEquiv.refl R V)
    (hmul : ∀ k g h x, J k (g * h) x = (J k h x).trans (J k g (h • x)))
    (k : β) (g : G) :
    (slashActionOfAutomorphyFactor J hone hmul).map k g (0 : X → V) = 0 := by sorry

-- A genuinely point-dependent coefficient: changing a frame u gives J(g,x)=u(gx)u(x)⁻¹.
-- This checks the base-point shift that disappears in the erroneous printed formula.
-- AutomorphicBundles.slashActionOfAutomorphyFactor_test_frame
example {G X R V : Type*} [Monoid G] [MulAction G X]
    [Semiring R] [AddCommMonoid V] [Module R V]
    (u : X → (V ≃ₗ[R] V)) (g : G) (f : X → V) (x : X) :
    (slashActionOfAutomorphyFactor (β := Unit)
      (fun _ g x ↦ (u x).symm.trans (u (g • x))) (by sorry) (by sorry)).map () g f x =
      u x ((u (g • x)).symm (f (g • x))) := by sorry

-- Test helpers only: two noncommuting automorphisms of a two-dimensional vector space, with their actual inverse maps.
private def shearX {K : Type*} [Field K] : (K × K) ≃ₗ[K] (K × K) where
  toFun p := (p.1 + p.2, p.2)
  invFun p := (p.1 - p.2, p.2)
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry
  map_smul' := by sorry

private def shearY {K : Type*} [Field K] : (K × K) ≃ₗ[K] (K × K) where
  toFun p := (p.1, p.1 + p.2)
  invFun p := (p.1, p.2 - p.1)
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry
  map_smul' := by sorry

-- The base action is evaluation on V itself; constant functions make the coefficient
-- multiplication order visible independently of the point at which they are evaluated.
-- AutomorphicBundles.slashActionOfAutomorphyFactor_test_noncommuting
example :
    (slashActionOfAutomorphyFactor (β := Unit)
      (fun (_ : Unit) (g : (ℚ × ℚ) ≃ₗ[ℚ] (ℚ × ℚ)) (_ : ℚ × ℚ) ↦ g)
      (by sorry) (by sorry)).map () (shearX * shearY)
        (fun _ ↦ ((1 : ℚ), (0 : ℚ))) (0, 0) = (1, -1) ∧
    (slashActionOfAutomorphyFactor (β := Unit)
      (fun (_ : Unit) (g : (ℚ × ℚ) ≃ₗ[ℚ] (ℚ × ℚ)) (_ : ℚ × ℚ) ↦ g)
      (by sorry) (by sorry)).map () (shearY * shearX)
        (fun _ ↦ ((1 : ℚ), (0 : ℚ))) (0, 0) = (2, -1) := by sorry

-- Inversion is essential even before comparing two noncommuting elements.
-- AutomorphicBundles.slashActionOfAutomorphyFactor_test_inverse
example :
    (slashActionOfAutomorphyFactor (β := Unit)
      (fun (_ : Unit) (g : (ℚ × ℚ) ≃ₗ[ℚ] (ℚ × ℚ)) (_ : ℚ × ℚ) ↦ g)
      (by sorry) (by sorry)).map () shearX
        (fun _ ↦ ((0 : ℚ), (1 : ℚ))) (0, 0) = (-1, 1) := by sorry

private def scalarAut (a : ℂ) (ha : a ≠ 0) : ℂ ≃ₗ[ℂ] ℂ where
  toFun z := a * z
  invFun z := a⁻¹ * z
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry
  map_smul' := by sorry

private def sl2Coefficient (k : ℤ) (g : SL(2, ℤ)) (z : UpperHalfPlane) : ℂ ≃ₗ[ℂ] ℂ :=
  scalarAut (UpperHalfPlane.denom g z ^ k)
    (zpow_ne_zero k (UpperHalfPlane.denom_ne_zero g z))

-- Agreement with the existing Mathlib operator, not a new scalar modular-form definition.
-- AutomorphicBundles.slashActionOfAutomorphyFactor_test_sl2
example (k : ℤ) (g : SL(2, ℤ)) (f : UpperHalfPlane → ℂ) (z : UpperHalfPlane) :
    (slashActionOfAutomorphyFactor sl2Coefficient (by sorry) (by sorry)).map k g f z =
      (f ∣[k] g) z := by sorry

-- Zero sections do not detect a cocycle, even when the factor is nonzero and normalized.
-- The nonidentity element of C2 has square one, whereas 2² is not 1 in Q.
private def badFactor (g : Multiplicative (ZMod 2)) : ℚ := if g = 1 then 1 else 2

-- AutomorphicBundles.slashActionOfAutomorphyFactor_test_zero_noncocycle
example : badFactor 1 = 1 ∧
    (∀ g, badFactor g ≠ 0) ∧
    (∀ g, (0 : ℚ) = badFactor g * 0) ∧
    ¬ (∀ g h, badFactor (g * h) = badFactor g * badFactor h) := by sorry

-- Boundary: the full determinant-negative GL₂(R) action is semilinear, not C-linear.
-- AutomorphicBundles.slashActionOfAutomorphyFactor_test_semilinear
example (k : ℤ) (g : GL (Fin 2) ℝ) (f : UpperHalfPlane → ℂ) (c : ℂ) :
    (c • f) ∣[k] g = UpperHalfPlane.σ g c • (f ∣[k] g) := by sorry

end AutomorphicBundles.Test

-- Pinned existing inputs, not proposed declarations.
#check SlashAction
#check SlashAction.slash_mul
#check ModularForm.SL_slash_apply
#check ModularForm.slash_action_eq'_iff
#check ModularForm.smul_slash
#check LinearEquiv.trans
#check LinearEquiv.trans_symm
#check LinearEquiv.symm_apply_eq
#check LinearEquiv.automorphismGroup
#check LinearEquiv.applyDistribMulAction

namespace AutomorphicBundles

/- These are the actually expressible parts of the definition contracts. The missing
Shimura, compactification and canonical-coefficient conditions are
omitted, explicitly, rather than replaced by uninterpreted proposition fields. -/

/-- The algebraic forgetting of the holomorphic factor: its laws are concrete equations. -/
structure FunctionalAutomorphyFactor (β G X R V : Type*) [Monoid G] [MulAction G X]
    [Semiring R] [AddCommMonoid V] [Module R V] where
  coefficient : β → G → X → (V ≃ₗ[R] V)
  normalized : ∀ k x, coefficient k 1 x = LinearEquiv.refl R V
  cocycle : ∀ k g h x,
    coefficient k (g * h) x = (coefficient k h x).trans (coefficient k g (h • x))

section FactorAPI
variable {β G X R V : Type*} [Monoid G] [MulAction G X]
    [Semiring R] [AddCommMonoid V] [Module R V]

theorem FunctionalAutomorphyFactor_one (J : FunctionalAutomorphyFactor β G X R V) (k : β) (x : X) :
    J.coefficient k 1 x = LinearEquiv.refl R V := by sorry

theorem FunctionalAutomorphyFactor_mul (J : FunctionalAutomorphyFactor β G X R V)
    (k : β) (g h : G) (x : X) :
    J.coefficient k (g * h) x =
      (J.coefficient k h x).trans (J.coefficient k g (h • x)) := by sorry

/-- Gauge change in the forgotten functional coefficient; holomorphy is omitted. -/
def FunctionalAutomorphyFactor_change_frame (J : FunctionalAutomorphyFactor β G X R V)
    (u : X → (V ≃ₗ[R] V)) : FunctionalAutomorphyFactor β G X R V where
  coefficient k g x := ((u x).symm.trans (J.coefficient k g x)).trans (u (g • x))
  normalized := by sorry
  cocycle := by sorry

def FunctionalAutomorphyFactor_forget (J : FunctionalAutomorphyFactor β G X R V) :
    β → G → X → (V ≃ₗ[R] V) := J.coefficient

theorem FunctionalAutomorphyFactor_ext (J K : FunctionalAutomorphyFactor β G X R V)
    (h : ∀ k g x, J.coefficient k g x = K.coefficient k g x) : J = K := by sorry

theorem FunctionalAutomorphyFactor_change_frame_id (J : FunctionalAutomorphyFactor β G X R V) :
    FunctionalAutomorphyFactor_change_frame J (fun _ ↦ LinearEquiv.refl R V) = J := by sorry

theorem FunctionalAutomorphyFactor_change_frame_comp (J : FunctionalAutomorphyFactor β G X R V)
    (u v : X → (V ≃ₗ[R] V)) :
    FunctionalAutomorphyFactor_change_frame (FunctionalAutomorphyFactor_change_frame J u) v =
      FunctionalAutomorphyFactor_change_frame J (fun x ↦ (u x).trans (v x)) := by sorry

-- AutomorphicBundles.FunctionalAutomorphyFactor_test_unit (functional forgetting)
example (k : β) (g : G) (x : X) :
    let J : FunctionalAutomorphyFactor β G X R V :=
      { coefficient := fun _ _ _ ↦ LinearEquiv.refl R V
        normalized := by sorry
        cocycle := by sorry }
    J.coefficient k g x = LinearEquiv.refl R V := by sorry

-- AutomorphicBundles.FunctionalAutomorphyFactor_test_frame (functional forgetting)
example (u : X → (V ≃ₗ[R] V)) (k : β) (g : G) (x : X) :
    let J : FunctionalAutomorphyFactor β G X R V :=
      { coefficient := fun _ _ _ ↦ LinearEquiv.refl R V
        normalized := by sorry
        cocycle := by sorry }
    (FunctionalAutomorphyFactor_change_frame J u).coefficient k g x =
      (u x).symm.trans (u (g • x)) := by sorry
end FactorAPI

end AutomorphicBundles

namespace AutomorphicBundles.Test
open AutomorphicBundles

-- AutomorphicBundles.FunctionalAutomorphyFactor_test_order (functional forgetting)
example :
    let J : FunctionalAutomorphyFactor Unit ((ℚ × ℚ) ≃ₗ[ℚ] (ℚ × ℚ)) (ℚ × ℚ) ℚ (ℚ × ℚ) :=
      { coefficient := fun _ g _ ↦ g
        normalized := by sorry
        cocycle := by sorry }
    J.coefficient () (shearX * shearY) (0, 0) (1, 0) = (2, 1) ∧
      J.coefficient () (shearY * shearX) (0, 0) (1, 0) = (1, 1) := by sorry

-- AutomorphicBundles.FunctionalAutomorphyFactor_test_shift (functional forgetting)
example :
    let t : Multiplicative (ZMod 2) := Multiplicative.ofAdd 1
    let u : Multiplicative (ZMod 2) → ((ℚ × ℚ) ≃ₗ[ℚ] (ℚ × ℚ)) :=
      fun x ↦ if x = 1 then LinearEquiv.refl ℚ (ℚ × ℚ) else shearX
    let J : FunctionalAutomorphyFactor Unit (Multiplicative (ZMod 2))
        (Multiplicative (ZMod 2)) ℚ (ℚ × ℚ) :=
      FunctionalAutomorphyFactor_change_frame
        { coefficient := fun _ _ _ ↦ LinearEquiv.refl ℚ (ℚ × ℚ)
          normalized := by sorry
          cocycle := by sorry } u
    J.coefficient () (t * t) 1 (0, 1) = (0, 1) ∧
      ((J.coefficient () t 1).trans (J.coefficient () t 1)) (0, 1) = (2, 1) := by sorry

end AutomorphicBundles.Test

namespace AutomorphicBundles

section HolomorphicFactors
variable {β G E X V : Type*} [Monoid G] [MulAction G X]
  [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
  [TopologicalSpace X] [ChartedSpace E X] [IsManifold (𝓘(ℂ, E)) 1 X]
  [NormedAddCommGroup V] [NormedSpace ℂ V] [FiniteDimensional ℂ V]

/-- A normalized complex-linear cocycle with genuine holomorphy in the base point.
Finite-dimensionality makes pointwise holomorphy equivalent to a holomorphic GL-valued factor. -/
structure AutomorphyFactor (β G E X V : Type*) [Monoid G] [MulAction G X]
    [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    [TopologicalSpace X] [ChartedSpace E X] [IsManifold (𝓘(ℂ, E)) 1 X]
    [NormedAddCommGroup V] [NormedSpace ℂ V] [FiniteDimensional ℂ V]
    extends FunctionalAutomorphyFactor β G X ℂ V where
  holomorphic : ∀ k g v,
    MDifferentiable (𝓘(ℂ, E)) (𝓘(ℂ, V)) (fun x ↦ coefficient k g x v)

def AutomorphyFactor_forget
    (J : AutomorphyFactor β G E X V) : FunctionalAutomorphyFactor β G X ℂ V :=
  J.toFunctionalAutomorphyFactor

-- Explicit finite-dimensional holomorphy, rather than an opaque proposition.
def AutomorphyFactor_change_frame
    (J : AutomorphyFactor β G E X V)
    (hAction : ∀ g : G, MDifferentiable (𝓘(ℂ, E)) (𝓘(ℂ, E)) (fun x : X ↦ g • x))
    (u : X → V ≃ₗ[ℂ] V)
    (hu : ∀ v, MDifferentiable (𝓘(ℂ, E)) (𝓘(ℂ, V)) (fun x ↦ u x v)) :
    AutomorphyFactor β G E X V where
  coefficient k g x := ((u x).symm.trans (J.coefficient k g x)).trans (u (g • x))
  normalized := by sorry
  cocycle := by sorry
  holomorphic := by sorry

theorem AutomorphyFactor_forget_change_frame (J : AutomorphyFactor β G E X V)
    (hAction : ∀ g : G, MDifferentiable (𝓘(ℂ, E)) (𝓘(ℂ, E)) (fun x : X ↦ g • x))
    (u : X → V ≃ₗ[ℂ] V)
    (hu : ∀ v, MDifferentiable (𝓘(ℂ, E)) (𝓘(ℂ, V)) (fun x ↦ u x v)) :
    AutomorphyFactor_forget (AutomorphyFactor_change_frame J hAction u hu) =
      FunctionalAutomorphyFactor_change_frame (AutomorphyFactor_forget J) u := by sorry

theorem AutomorphyFactor_one (J : AutomorphyFactor β G E X V) (k : β) (x : X) :
    J.coefficient k 1 x = LinearEquiv.refl ℂ V := by sorry

theorem AutomorphyFactor_mul (J : AutomorphyFactor β G E X V)
    (k : β) (g h : G) (x : X) :
    J.coefficient k (g * h) x =
      (J.coefficient k h x).trans (J.coefficient k g (h • x)) := by sorry

theorem AutomorphyFactor_ext (J K : AutomorphyFactor β G E X V)
    (h : ∀ k g x, J.coefficient k g x = K.coefficient k g x) : J = K := by sorry

theorem AutomorphyFactor_inverse_holomorphic (J : AutomorphyFactor β G E X V)
    (k : β) (g : G) (v : V) :
    MDifferentiable (𝓘(ℂ, E)) (𝓘(ℂ, V)) (fun x ↦ (J.coefficient k g x).symm v) := by sorry

theorem AutomorphyFactor_change_frame_id (J : AutomorphyFactor β G E X V)
    (hAction : ∀ g : G, MDifferentiable (𝓘(ℂ, E)) (𝓘(ℂ, E)) (fun x : X ↦ g • x)) :
    AutomorphyFactor_change_frame J hAction (fun _ ↦ LinearEquiv.refl ℂ V)
      (by sorry) = J := by sorry

theorem AutomorphyFactor_change_frame_comp (J : AutomorphyFactor β G E X V)
    (hAction : ∀ g : G, MDifferentiable (𝓘(ℂ, E)) (𝓘(ℂ, E)) (fun x : X ↦ g • x))
    (u v : X → V ≃ₗ[ℂ] V)
    (hu : ∀ w, MDifferentiable (𝓘(ℂ, E)) (𝓘(ℂ, V)) (fun x ↦ u x w))
    (hv : ∀ w, MDifferentiable (𝓘(ℂ, E)) (𝓘(ℂ, V)) (fun x ↦ v x w)) :
    AutomorphyFactor_change_frame (AutomorphyFactor_change_frame J hAction u hu)
      hAction v hv =
    AutomorphyFactor_change_frame J hAction (fun x ↦ (u x).trans (v x))
      (by sorry) := by sorry

-- The inverse-factor slash formula preserves complex differentiability.
theorem AutomorphyFactor_slash_holomorphic (J : AutomorphyFactor β G E X V)
    (hAction : ∀ g : G, MDifferentiable (𝓘(ℂ, E)) (𝓘(ℂ, E)) (fun x : X ↦ g • x))
    (k : β) (g : G) (f : X → V)
    (hf : MDifferentiable (𝓘(ℂ, E)) (𝓘(ℂ, V)) f) :
    MDifferentiable (𝓘(ℂ, E)) (𝓘(ℂ, V))
      ((slashActionOfAutomorphyFactor J.coefficient J.normalized J.cocycle).map k g f) := by sorry

-- AutomorphicBundles.AutomorphyFactor_test_unit
example (k : β) (g : G) (x : X) :
    let J : AutomorphyFactor β G E X V :=
      { coefficient := fun _ _ _ ↦ LinearEquiv.refl ℂ V
        normalized := by sorry
        cocycle := by sorry
        holomorphic := by sorry }
    J.coefficient k g x = LinearEquiv.refl ℂ V := by sorry

-- AutomorphicBundles.AutomorphyFactor_test_frame
example
    (hAction : ∀ g : G, MDifferentiable (𝓘(ℂ, E)) (𝓘(ℂ, E)) (fun x : X ↦ g • x))
    (u : X → V ≃ₗ[ℂ] V)
    (hu : ∀ w, MDifferentiable (𝓘(ℂ, E)) (𝓘(ℂ, V)) (fun x ↦ u x w))
    (k : β) (g : G) (x : X) :
    let J : AutomorphyFactor β G E X V :=
      { coefficient := fun _ _ _ ↦ LinearEquiv.refl ℂ V
        normalized := by sorry
        cocycle := by sorry
        holomorphic := by sorry }
    (AutomorphyFactor_change_frame J hAction u hu).coefficient k g x =
      (u x).symm.trans (u (g • x)) := by sorry
end HolomorphicFactors

-- AutomorphicBundles.AutomorphyFactor_test_holomorphy
-- The exponential of the conjugate gives a functional cocycle but fails holomorphy
-- after gauge change for the sign action; normalization and cocycle alone permit it.
example : ¬ ∃ J : AutomorphyFactor Unit (ℂ ≃ₗ[ℂ] ℂ) ℂ ℂ ℂ,
    ∀ g z, J.coefficient () g z =
      ((LinearEquiv.smulOfUnit
          (Units.mk0 (Complex.exp (starRingEnd ℂ z)) (Complex.exp_ne_zero _))).symm.trans
        (LinearEquiv.refl ℂ ℂ)).trans
          (LinearEquiv.smulOfUnit
            (Units.mk0 (Complex.exp (starRingEnd ℂ (g z))) (Complex.exp_ne_zero _))) := by sorry


namespace Test

-- AutomorphicBundles.AutomorphyFactor_test_order
example :
    let J : AutomorphyFactor Unit ((ℂ × ℂ) ≃ₗ[ℂ] (ℂ × ℂ))
        (ℂ × ℂ) (ℂ × ℂ) (ℂ × ℂ) :=
      { coefficient := fun _ g _ ↦ g
        normalized := by sorry
        cocycle := by sorry
        holomorphic := by sorry }
    J.coefficient () (shearX * shearY) (0, 0) (1, 0) = (2, 1) ∧
      J.coefficient () (shearY * shearX) (0, 0) (1, 0) = (1, 1) := by sorry

-- AutomorphicBundles.AutomorphyFactor_test_shift
-- A holomorphic, point-dependent gauge for the sign action.
example :
    let u : ℂ → ℂ ≃ₗ[ℂ] ℂ := fun z ↦
      LinearEquiv.smulOfUnit (Units.mk0 (Complex.exp z) (Complex.exp_ne_zero z))
    let J : AutomorphyFactor Unit (ℂ ≃ₗ[ℂ] ℂ) ℂ ℂ ℂ :=
      AutomorphyFactor_change_frame
        { coefficient := fun _ _ _ ↦ LinearEquiv.refl ℂ ℂ
          normalized := by sorry
          cocycle := by sorry
          holomorphic := by sorry }
        (by sorry) u (by sorry)
    let t : ℂ ≃ₗ[ℂ] ℂ := LinearEquiv.neg ℂ
    J.coefficient () (t * t) 1 1 = 1 ∧
      ((J.coefficient () t 1).trans (J.coefficient () t 1)) 1 ≠ 1 := by sorry

end Test

/-- Arithmetic embedding-labelled weights, with actual integer parity equations. -/
structure HilbertArithmeticWeight (ι : Type*) [Fintype ι] where
  k : ι → ℤ
  w : ℤ
  parity : ∀ i, (w - k i) % 2 = 0

section WeightAPI
variable {ι : Type*} [Fintype ι]

def HilbertArithmeticWeight_k (weight : HilbertArithmeticWeight ι) : ι → ℤ := weight.k
def HilbertArithmeticWeight_w (weight : HilbertArithmeticWeight ι) : ℤ := weight.w
def HilbertArithmeticWeight_detExponent (weight : HilbertArithmeticWeight ι) (i : ι) : ℤ :=
    (weight.w - weight.k i) / 2

theorem HilbertArithmeticWeight_two_mul_detExponent (weight : HilbertArithmeticWeight ι)
    (i : ι) : 2 * HilbertArithmeticWeight_detExponent weight i = weight.w - weight.k i := by sorry

def HilbertArithmeticWeight_add (weight otherWeight : HilbertArithmeticWeight ι) :
    HilbertArithmeticWeight ι where
  k i := weight.k i + otherWeight.k i
  w := weight.w + otherWeight.w
  parity := by sorry

theorem HilbertArithmeticWeight_ext (weight otherWeight : HilbertArithmeticWeight ι)
    (hk : weight.k = otherWeight.k) (hw : weight.w = otherWeight.w) :
    weight = otherWeight := by sorry

-- AutomorphicBundles.HilbertArithmeticWeight_test_zero
example (i : ι) :
    HilbertArithmeticWeight_detExponent
      (⟨fun _ ↦ 0, 0, by sorry⟩ : HilbertArithmeticWeight ι) i = 0 := by sorry

-- AutomorphicBundles.HilbertArithmeticWeight_test_negative
example : HilbertArithmeticWeight_detExponent
    (⟨fun _ : Unit ↦ 4, 2, by sorry⟩ : HilbertArithmeticWeight Unit) () = -1 := by sorry

-- AutomorphicBundles.HilbertArithmeticWeight_test_parity
example : ¬ ∃ weight : HilbertArithmeticWeight Unit, weight.k () = 3 ∧ weight.w = 2 := by sorry
end WeightAPI

/-- The global-section type of a *supplied* coefficient on a *supplied* model.
No arbitrary scheme is asserted to be a Shimura compactification and no arbitrary
module is asserted to be its canonical coefficient. Their identifying conditions
are unavailable at the pin and are explicitly omitted from this prototype. -/
def classicalForms (model : AlgebraicGeometry.Scheme) (Vcan : model.Modules) : Type _ :=
  SheafOfModules.sections Vcan

-- A genuinely available operation on these supplied sections, using the baseline map.
def classicalForms_section (model : AlgebraicGeometry.Scheme) (Vcan : model.Modules)
    (f : classicalForms model Vcan) : SheafOfModules.sections Vcan := f

section SuppliedSections
variable {model : AlgebraicGeometry.Scheme} {V W U : model.Modules}

def classicalForms_map (u : V ⟶ W) : classicalForms model V → classicalForms model W :=
  SheafOfModules.sectionsMap u

theorem classicalForms_map_id (s : classicalForms model V) :
    classicalForms_map (𝟙 V) s = s := by sorry

theorem classicalForms_map_comp (u : V ⟶ W) (v : W ⟶ U) (s : classicalForms model V) :
    classicalForms_map (u ≫ v) s = classicalForms_map v (classicalForms_map u s) := by sorry

-- AutomorphicBundles.classicalForms_test_map_id (supplied-section forgetting)
example (s : classicalForms model V) : classicalForms_map (𝟙 V) s = s := by sorry

-- AutomorphicBundles.classicalForms_test_map_comp (supplied-section forgetting)
example (u : V ⟶ W) (v : W ⟶ U) (s : classicalForms model V) :
    classicalForms_map (u ≫ v) s = classicalForms_map v (classicalForms_map u s) := by sorry

-- AutomorphicBundles.classicalForms_test_map_zero (supplied-section forgetting)
-- At the pin, compatible sections have no global AddCommGroup instance; compare
-- the values on each open instead of inventing that instance.
example (u : V ⟶ W) (s : classicalForms model V)
    (hs : ∀ X, s.val X = 0) :
    ∀ X, (classicalForms_map u s).val X = 0 := by sorry

end SuppliedSections

end AutomorphicBundles

end

/-! ## Fourier–Jacobi algebra and comparison calculations: Fourier–Jacobi dévissage, local tests and weight calculations -/

/- Existing infrastructure: reuse it, do not redeclare it. -/
#check ModularForm.trace
#check CuspForm.trace
#check HeckeRing.GL2.heckeRingHomCharSpace
#check AlgebraicGeometry.Scheme.Modules.tensorProduct
#check AlgebraicGeometry.tilde.isoTop
#check HeckeRing.GL2.twistedHeckeSlashSum_diagCosetGamma0_of_prime
#check PowerSeries.isUnit_iff_constantCoeff
#check CategoryTheory.ShortComplex.mono_τ₂_of_exact_of_mono
#check IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime
#check IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime

noncomputable section

namespace AutomorphicBundles

namespace FourierJacobi

section Recognition

variable {R : Type*} [CommRing R]
variable {A B C D E : Type*}
variable [AddCommGroup A] [Module R A]
variable [AddCommGroup B] [Module R B]
variable [AddCommGroup C] [Module R C]
variable [AddCommGroup D] [Module R D]
variable [AddCommGroup E] [Module R E]

/-- The last diagram chase in the coefficient-recognition proof.

For the geometric application:
A = AF(k,M1), B = AF(k,M), C = AF(k,M/M1);
D and E are the respective products of coefficient-family modules.

`exactRow`, `naturality`, and `quotientInjective` are REAL mathematical
premises of this elementary lemma. Establishing them for those geometric
objects is separately required by the geometric construction; this lemma does not supply or
assume the entire geometric expansion theorem under a renamed field.
The algebraic proof body elaborates; its geometric instantiation remains required.
-/
theorem coefficientRecognitionLinear
    (i : A →ₗ[R] B) (q : B →ₗ[R] C)
    (expansion : B →ₗ[R] D) (quotientExpansion : C →ₗ[R] E)
    (coefficientQuotient : D →ₗ[R] E)
    (exactRow : LinearMap.range i = LinearMap.ker q)
    (naturality : quotientExpansion.comp q = coefficientQuotient.comp expansion)
    (quotientInjective : Function.Injective quotientExpansion)
    (b : B) (hb : coefficientQuotient (expansion b) = 0) :
    b ∈ LinearMap.range i := by
  rw [exactRow]
  change q b = 0
  apply quotientInjective
  calc
    quotientExpansion (q b) = coefficientQuotient (expansion b) :=
      congrArg (fun h : B →ₗ[R] E => h b) naturality
    _ = 0 := hb
    _ = quotientExpansion 0 := (map_zero quotientExpansion).symm

/-- The M1=M edge case of image recognition. -/
example (b : B) : b ∈ LinearMap.range (LinearMap.id : B →ₗ[R] B) := by
  exact ⟨b, rfl⟩

/-- A vanishing expansion detects zero only when injectivity is proved. -/
example (e : B →ₗ[R] D) (he : Function.Injective e) (b : B)
    (hb : e b = 0) : b = 0 := by
  apply he
  simpa using hb

end Recognition

section ExtensionRegression

open CategoryTheory

/-- Apply the EXISTING generic diagram lemma in the actual category of
modules. In B5 the two short complexes must first be constructed from the
Hodge-section and invariant-coefficient rows; this example does not construct
them or discharge their geometric exactness hypotheses.

There is deliberately no `Epi S.g` premise. Global sections of a short exact
sheaf sequence need not be right exact. The pinned source statement and proof
of the imported theorem, and the ModuleCat abelian-instance import, were read.
This application elaborates with the pinned ModuleCat and ShortComplex interfaces.
-/
example {R : Type*} [CommRing R]
    {S T : ShortComplex (ModuleCat R)} (φ : S ⟶ T)
    (hS : S.Exact)
    [Mono S.f] [Mono T.f] [Mono φ.τ₁] [Mono φ.τ₃] :
    Mono φ.τ₂ := by
  exact ShortComplex.mono_τ₂_of_exact_of_mono φ hS

/-- The first torsion extension test genuinely contains a nonzero nilpotent.
A theorem only about reduced coefficient rings does not cover this ring. -/
example : (2 : ZMod 4) ≠ 0 ∧ (2 : ZMod 4) ^ 2 = 0 := by
  decide

/-- Reduction to a residue field is not an injection of coefficient modules.
The devissage must use both terms of the extension, not just reduction. -/
example : ¬ Function.Injective (fun x : ZMod 4 => (x.val : ZMod 2)) := by
  decide

/-- Underlying finite-function test of 0 -> Z/2 -> Z/4 -> Z/2 -> 0.
The inclusion sends the class of one to two. This checks the first injection,
the middle image/kernel equality and the last surjection. It is not the
construction of a new exact-sequence carrier or a Fourier-Jacobi theorem.
The corresponding Z-linear maps are still required in a module instantiation.
-/
example :
    Function.Injective (fun y : ZMod 2 => (2 : ZMod 4) * (y.val : ZMod 4)) ∧
    (∀ x : ZMod 4, (x.val : ZMod 2) = 0 ↔
      ∃ y : ZMod 2, (2 : ZMod 4) * (y.val : ZMod 4) = x) ∧
    Function.Surjective (fun x : ZMod 4 => (x.val : ZMod 2)) := by
  decide

/-- For the C2-action (a,b) -> (a+b,b) on F2^2, the invariant vectors have
b=0. The equivariant second-coordinate quotient is onto before invariants but
not after invariants. Only left exactness of the invariant functor is used.
This finite computation is a regression, not a replacement group-action API.
-/
example :
    ¬ Function.Surjective
      (fun v : {v : ZMod 2 × ZMod 2 // v.1 + v.2 = v.1} => v.1.2) := by
  decide

end ExtensionRegression

section PrimeFiltrationReuse

universe u v

variable (R : Type u) [CommRing R] [IsNoetherianRing R]
variable (M : Type v) [AddCommGroup M] [Module R M] [Module.Finite R M]

/-- Direct application of the existing induction theorem, with its exact
module-universe and linear-equivalence interface. For B5 the motive is
injectivity of the constructed expansion map, not an opaque new predicate.
The three cases must be proved for the actual coefficient functors first.
Surjectivity of g below is on COEFFICIENT modules, not on global sections.
This direct-use example elaborates at the pinned commit. -/
example
    {motive : (N : Type v) → [AddCommGroup N] → [Module R N] →
      [Module.Finite R N] → Prop}
    (hzero : (N : Type v) → [AddCommGroup N] → [Module R N] →
      [Module.Finite R N] → [Subsingleton N] → motive N)
    (hprime : (N : Type v) → [AddCommGroup N] → [Module R N] →
      [Module.Finite R N] → (p : PrimeSpectrum R) →
      (N ≃ₗ[R] R ⧸ p.1) → motive N)
    (hext : (N₁ : Type v) → [AddCommGroup N₁] → [Module R N₁] →
      [Module.Finite R N₁] →
      (N₂ : Type v) → [AddCommGroup N₂] → [Module R N₂] →
      [Module.Finite R N₂] →
      (N₃ : Type v) → [AddCommGroup N₃] → [Module R N₃] →
      [Module.Finite R N₃] →
      (f : N₁ →ₗ[R] N₂) → (g : N₂ →ₗ[R] N₃) →
      Function.Injective f → Function.Surjective g → Function.Exact f g →
      motive N₁ → motive N₃ → motive N₂) : motive M := by
  exact IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime R
    (inferInstance : Module.Finite R M) (motive := motive) hzero hprime hext

end PrimeFiltrationReuse

-- Zero coefficients: no prime is chosen before the subsingleton case.
example :
    ∃ s : RelSeries {(N₁, N₂) |
        Submodule.IsQuotientEquivQuotientPrime
          (A := ℤ) (M := Fin 0 → ℤ) N₁ N₂},
      s.head = ⊥ ∧ s.last = ⊤ := by
  exact IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime
    ℤ (Fin 0 → ℤ)

-- Nilpotent torsion coefficients are permitted; the factors may repeat.
example :
    ∃ s : RelSeries {(N₁, N₂) |
        Submodule.IsQuotientEquivQuotientPrime (A := ℤ) (M := ZMod 4) N₁ N₂},
      s.head = ⊥ ∧ s.last = ⊤ := by
  exact IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime ℤ (ZMod 4)

-- A finite prime filtration is not necessarily a finite-length composition series.
example :
    ∃ s : RelSeries {(N₁, N₂) |
        Submodule.IsQuotientEquivQuotientPrime (A := ℤ) (M := ℤ) N₁ N₂},
      s.head = ⊥ ∧ s.last = ⊤ := by
  exact IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime ℤ ℤ

section LocalCompletionBaseline

variable {R : Type*} [CommRing R] [IsNoetherianRing R] [IsLocalRing R]
variable (I : Ideal R) (M : Type*) [AddCommGroup M] [Module R M] [Module.Finite R M]

-- The finite-stalk intersection step is already in Mathlib; no new theorem is planned.
example (hI : I ≠ ⊤) : (⨅ n : ℕ, I ^ n • ⊤ : Submodule R M) = ⊥ :=
  Ideal.iInf_pow_smul_eq_bot_of_isLocalRing I hI

-- The same input gives injectivity into Mathlib's actual completion carrier.
example (hI : I ≠ ⊤) : Function.Injective (AdicCompletion.of I M) := by
  let : IsHausdorff I M := IsHausdorff.of_isLocalRing I M hI
  exact AdicCompletion.of_injective I M

-- This is the germ-detection use, with no completeness premise on M.
example (hI : I ≠ ⊤) (m : M) (hm : AdicCompletion.of I M m = 0) : m = 0 := by
  let : IsHausdorff I M := IsHausdorff.of_isLocalRing I M hI
  exact AdicCompletion.of_injective I M (hm.trans (map_zero _).symm)

end LocalCompletionBaseline

-- The proper-ideal hypothesis is necessary even for a one-dimensional vector space.
example : ¬ Function.Injective (AdicCompletion.of (⊤ : Ideal (ZMod 2)) (ZMod 2)) := by
  sorry

section CompletionRegression

variable {R S : Type*} [CommRing R] [CommRing S]

/-- The unit obstruction that invalidates an unrestricted face-completion map.
This uses the pinned PowerSeries unit criterion, not a new completion type. -/
example : IsUnit (1 - (PowerSeries.X : PowerSeries R)) := by
  sorry

/-- There is no evaluation at one on ALL formal power series over a nonzero
ring, even without imposing continuity or fixing the coefficient subring. -/
example [Nontrivial S] (f : PowerSeries R →+* S) :
    f PowerSeries.X ≠ 1 := by
  sorry

/-- Apply this to the augmentation y -> 1 of the Laurent coefficient ring,
composed with the constant-x coefficient of R[y,y^-1][[x]]. The theorem is
only the algebraic obstruction; the actual toric rings and common-boundary
completion still have to be supplied by their owning roadmaps. -/
example [Nontrivial R] (evaluation : S →+* R) (y : S)
    (hy : evaluation y = 1) :
    ¬ ∃ f : PowerSeries R →+* S, f PowerSeries.X = y := by
  sorry

end CompletionRegression

/- Algebraic shadows of negative tests. These are not replacements for the
geometric tests below. -/

/-- One component does not detect a section supported on another component. -/
example : ((0, 1) : ℤ × ℤ).1 = 0 ∧ ((0, 1) : ℤ × ℤ) ≠ (0, 0) := by
  sorry

/-- A formal coefficient target must allow infinite support. -/
example : ¬ ∃ N : ℕ, ∀ n : ℕ, N ≤ n → (1 : ℤ) = 0 := by
  sorry

/-- A group sum is not the identity on trivial invariants in characteristic p. -/
example (p : ℕ) [Fact p.Prime] :
    (∑ _ : Fin p, (1 : ZMod p)) = 0 ∧ (1 : ZMod p) ≠ 0 := by
  sorry

end FourierJacobi


open CategoryTheory AlgebraicGeometry
open scoped AlgebraicGeometry

/- These are partial interfaces on ACTUAL scheme coefficient sheaves.
E is the sheaf Psi(ell) tensor the boundary bundle tensor_R M after its
formation by B3/SF.0. This does not construct a Shimura chart, its bundle or
its tensor comparison. No arbitrary Type is renamed a coefficient sheaf. -/
namespace FJCoefficient

noncomputable def map {C : Scheme} {E F : C.Modules} (φ : E ⟶ F) :
    Γ(E, (⊤ : C.Opens)) →ₗ[Γ(C, (⊤ : C.Opens))] Γ(F, (⊤ : C.Opens)) where
  toFun := φ.app ⊤
  map_add' := by sorry
  map_smul' := by sorry

theorem map_id {C : Scheme} (E : C.Modules) :
    map (𝟙 E) = LinearMap.id := by sorry

theorem map_comp {C : Scheme} {E F G : C.Modules} (φ : E ⟶ F) (ψ : F ⟶ G) :
    map (φ ≫ ψ) = (map ψ).comp (map φ) := by sorry

/-- On a common actual scheme chart, after the degree/sheaf transport has
been identified with this isomorphism. Cross-chart/cusp transport is omitted. -/
noncomputable def transport {C : Scheme} {E F : C.Modules} (e : E ≅ F) :
    Γ(E, (⊤ : C.Opens)) ≃ₗ[Γ(C, (⊤ : C.Opens))] Γ(F, (⊤ : C.Opens)) where
  toFun := map e.hom
  invFun := map e.inv
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry
  map_smul' := by sorry

theorem family_ext {C : Scheme} {I : Type*} (E : I → C.Modules)
    (a b : (i : I) → Γ(E i, (⊤ : C.Opens))) :
    a = b ↔ ∀ i, a i = b i := by sorry

-- FJCoefficient.zeroCoefficients: after the supplied coefficient sheaf is
-- identified with tilde of the zero module on the affine Tate chart.
example {R : CommRingCat} (M : ModuleCat R) [Subsingleton M] :
    Subsingleton ((modulesSpecToSheaf.obj (tilde M)).presheaf.obj (.op ⊤)) := by sorry

-- FJCoefficient.tateTrivialization: the actual affine-section interface.
-- The owner must identify Psi(n) tensor L^k tensor M with this tilde sheaf.
example {R : CommRingCat} (M : ModuleCat R) :
    Nonempty (M ≅ (modulesSpecToSheaf.obj (tilde M)).presheaf.obj (.op ⊤)) := by sorry

-- FJCoefficient.notFiniteSupport: the genuine infinite local power series.
example :
    let f : PowerSeries ℤ := PowerSeries.mk (fun _ => 1)
    (1 - PowerSeries.X) * f = 1 ∧
    (∀ n, PowerSeries.coeff n f = 1) ∧
    ¬ ∃ N : ℕ, ∀ n : ℕ, N ≤ n → PowerSeries.coeff n f = 0 := by sorry

end FJCoefficient

namespace ClassicalHecke

-- ClassicalHecke.weightZeroTrace: local finite-free trace, not a global
-- sheaf trace or a constructed Hecke correspondence. No averaging.
example {R A : Type*} [CommRing R] [CommRing A] [Algebra R A]
    {I : Type*} [Fintype I] (b : Module.Basis I R A) (ν : R) :
    ν * Algebra.trace R A (algebraMap R A 1) = ν * (Fintype.card I : R) := by sorry

-- The degree-(ell+1), det^{-1} normalization on the weight-zero scalar.
example (ell : ℚ) (hell : ell ≠ 0) :
    ell⁻¹ * (ell + 1) = (ell + 1) / ell := by sorry

end ClassicalHecke

namespace VectorFourierJacobi

-- VectorFourierJacobi.rankTwoMonomial: the LOCAL trivialized rank-two
-- calculation. It does not assert a descended/global automorphic form.
example {R : Type*} [CommRing R] (n : ℕ) (v : Fin 2 → R) :
    PowerSeries.coeff n (PowerSeries.monomial (R := Fin 2 → R) n v) = v ∧
    ∀ m, m ≠ n →
      PowerSeries.coeff m (PowerSeries.monomial (R := Fin 2 → R) n v) = 0 := by sorry

end VectorFourierJacobi

namespace SiegelHT

/- These integer calculations are the displayed weight/Tate numerators,
not a substitute for an algebraic representation or cohomology carrier. -/
def coherentWeights (k1 k2 w : ℤ) : Fin 4 → ℤ × ℤ × ℤ :=
  ![(k1, k2, -w), (2-k1, k2, -w), (3-k2, k1+1, -w), (3-k2, 3-k1, -w)]

def twiceTateWeights (k1 k2 w : ℤ) : Fin 4 → ℤ :=
  ![k1+k2+w, 2-k1+k2+w, 4-k2+k1+w, 6-k1-k2+w]

theorem integralTwists (k1 k2 w : ℤ) (hparity : (k1+k2+w) % 2 = 0) :
    ∀ j, ∃ a : ℤ, twiceTateWeights k1 k2 w j = 2*a := by sorry

example : coherentWeights 0 0 0 = ![(0,0,0), (2,0,0), (3,1,0), (3,3,0)] := by sorry

example : twiceTateWeights 0 0 0 = ![0,2,4,6] := by sorry

example : (0+0+1 : ℤ) % 2 ≠ 0 := by sorry

end SiegelHT

end AutomorphicBundles

end

/-!
## Geometric interfaces

The mathematical definitions, hypotheses, sources and prerequisites are in
README.md. The following names describe the interfaces requiring the supplied
geometric carriers. The functional declarations above are explicit forgettings
or algebraic steps of those interfaces, with their stated limitations.
Identity/composition laws hold with the same datum, level, field and model.

### B0

AutomorphicBundles.centralSplitQuotient
For a reductive ℚ-group in a Shimura datum, form the algebraic quotient Gᶜ = G/Z_s. Here Z_s is
the largest central ℚ-subtorus that splits over ℝ and has no nonzero ℚ-split subtorus; use
Milne's character-lattice description, equivalently Lan's removal of excess real split rank.
Algebraic representations factor through the quotient exactly when Z_s acts trivially. For GL₂
this torus is trivial; for Res_{F/ℚ}GL₂ with F totally real of degree d its dimension is d−1.
The quotient retains central characters that an adjoint quotient would erase.
API: AutomorphicBundles.centralSplitQuotient_quotient, AutomorphicBundles.centralSplitQuotient_factor, AutomorphicBundles.centralSplitQuotient_factor_iff
Tests: AutomorphicBundles.centralSplitQuotient_test_gl2, AutomorphicBundles.centralSplitQuotient_test_hilbert, AutomorphicBundles.centralSplitQuotient_test_trivial

AutomorphicBundles.ineffectiveFibreDescent
Separate the arithmetic group from its effective action on the Hermitian domain. Check the
action of its ineffective central kernel on every coefficient fibre before descending the
analytic bundle. For a finite tame quotient in characteristic zero, descent of an equivariant
locally free coefficient to the coarse space is equivalent to trivial stabilizer actions on the
fibres. An infinite arithmetic central kernel needs the separate effective-quotient argument; a
neat group can still contain nontrivial central units. Retain the stack coefficient whenever the
fibre-triviality or tame assumption fails.

AutomorphicBundles.hodgeParabolicConvention
Fix μ_h(z)=h_ℂ(z,1) acting by z^(−p) on H^{p,q}. Construct the filtration stabilizer
P_H=P(μ_h⁻¹), with Levi Z_G(μ_h), from D3's filtration and compact-dual interfaces. Compare it
explicitly with the opposite P_HT=P(μ_h) and BCGP's left-coset flag. The comparison includes
inversion of left/right cosets and the required dual coefficient. A sign choice for μ alone does
not identify the two associated bundles.

AutomorphicBundles.compactDualCoefficient
Over the actual coefficient field L, let V be a finite-dimensional algebraic representation of
P_Hᶜ. Define its Gᶜ-equivariant bundle on the compact dual by Gᶜ×^{P_Hᶜ}V, using
(g,v)∼(gp,ρ(p)⁻¹v). Allow parabolic representations with nontrivial unipotent action as well as
representations factoring through the Levi. Supply morphisms, tensor/dual/unit identifications
and pullback. On the GL₂ flag the tautological character gives O(−1); its inverse gives O(1).
API: AutomorphicBundles.compactDualCoefficient_fibre, AutomorphicBundles.compactDualCoefficient_inflate, AutomorphicBundles.compactDualCoefficient_tensor, AutomorphicBundles.compactDualCoefficient_map, AutomorphicBundles.compactDualCoefficient_map_id, AutomorphicBundles.compactDualCoefficient_map_comp
Tests: AutomorphicBundles.compactDualCoefficient_test_unit, AutomorphicBundles.compactDualCoefficient_test_gl2, AutomorphicBundles.compactDualCoefficient_test_unipotent

AutomorphicBundles.homogeneousHodgeTorsor
Pull the compact-dual P_Hᶜ-torsor back along the actual Borel embedding X→X̌. Its quotient by
the unipotent radical is the torsor of graded Hodge frames. Give the compatible action and
associated coefficient identification. A connection on the full group torsor does not
automatically give a flat connection on this filtration reduction.
API: AutomorphicBundles.homogeneousHodgeTorsor_filtered_frames, AutomorphicBundles.homogeneousHodgeTorsor_graded, AutomorphicBundles.homogeneousHodgeTorsor_pullback_coefficient
Tests: AutomorphicBundles.homogeneousHodgeTorsor_test_point, AutomorphicBundles.homogeneousHodgeTorsor_test_standard, AutomorphicBundles.homogeneousHodgeTorsor_test_graded

AutomorphicBundles.analyticCoefficient
For the actual arithmetic quotient of X, descend the Borel-pulled homogeneous coefficient
through the effective group. Require a torsion-free effective action and trivial action of the
ineffective kernel on fibres, or retain the equivariant stack formulation. Obtain its
holomorphic bundle structure from the Borel embedding and coefficient, rather than from a
quotient of smooth spaces alone.
API: AutomorphicBundles.analyticCoefficient_local_trivial, AutomorphicBundles.analyticCoefficient_section_equiv, AutomorphicBundles.analyticCoefficient_change_frame, AutomorphicBundles.analyticCoefficient_map, AutomorphicBundles.analyticCoefficient_map_id, AutomorphicBundles.analyticCoefficient_map_comp
Tests: AutomorphicBundles.analyticCoefficient_test_trivial, AutomorphicBundles.analyticCoefficient_test_odd, AutomorphicBundles.analyticCoefficient_test_rank

AutomorphicBundles.sectionsEquivariant
Identify sections of the associated bundle of a right P-torsor T with coefficient-valued
functions satisfying f(tp)=ρ(p)⁻¹f(t). In a local frame on a left arithmetic quotient this
becomes f(γx)=J(γ,x)f(x), where J(gh,x)=J(g,hx)J(h,x). Establish the identifications with their
regular or holomorphic hypotheses, and their compatibility with coefficient maps and frame
changes.

AutomorphicBundles.coefficientGaloisDescent
For a finite Galois splitting extension L/E, descend the equivariant coefficient using its
actual semilinear transport maps and cocycle. Tensor, dual and base-extension operations commute
with this descent. A highest weight descends only with the representation's Galois datum; use
its stabilizer field where necessary. In an embedding-labelled example a parallel tensor
survives permutation of factors, whereas a nonparallel label is not automatically defined over
E.
API: AutomorphicBundles.coefficientGaloisDescent_base_change, AutomorphicBundles.coefficientGaloisDescent_unique, AutomorphicBundles.coefficientGaloisDescent_associate, AutomorphicBundles.coefficientGaloisDescent_map, AutomorphicBundles.coefficientGaloisDescent_map_id, AutomorphicBundles.coefficientGaloisDescent_map_comp
Tests: AutomorphicBundles.coefficientGaloisDescent_test_identity, AutomorphicBundles.coefficientGaloisDescent_test_parallel, AutomorphicBundles.coefficientGaloisDescent_test_nonparallel

AutomorphicBundles.geometricAnalyticCoefficients
Compare the analytification of the actual algebraic associated coefficient with the holomorphic
bundle constructed from the same torsor and representation. The comparison respects equivariant
sections and tensor maps. Prove it by descent on the named torsor charts; no assertion of
coherent GAGA for a nonproper open variety is needed.

### B1

AutomorphicBundles.finiteTensorStabilizer
For a faithful representation of a reductive group in characteristic zero, choose finitely many
mixed tensors whose scheme-theoretic pointwise stabilizer is exactly the group. Include duals
and the stated Tate-coordinate convention. Stabilizing a line up to scalar is a weaker condition
and does not provide the tensor-preserving frame torsor used here.

AutomorphicBundles.absoluteHodgePropagation
Use Deligne's absolute-Hodge theorem for rational Hodge tensors in H¹ of abelian varieties and
its Tate tensor constructions. In a connected abelian family apply Principle B to a horizontal
tensor that has type (0,0) and is absolute Hodge at the specified fibre. State the comparison
and propagation hypotheses explicitly. This is a theorem about absolute Hodge classes, without
an assertion that they are algebraic cycles or that every motive has an abelian realization.

AutomorphicBundles.hodgeTensorRealizations
On the actual fine-level Hodge-type universal abelian family, realize the defining Hodge tensors
in Betti, étale and de Rham tensor spaces, with comparison, horizontality and rational descent.
The standard homology module is the dual of relative H¹ and carries the declared Tate lines. The
realizations preserve the tensor relations defining Gᶜ.
API: AutomorphicBundles.hodgeTensorRealizations_horizontal, AutomorphicBundles.hodgeTensorRealizations_compare, AutomorphicBundles.hodgeTensorRealizations_galois
Tests: AutomorphicBundles.hodgeTensorRealizations_test_endomorphism, AutomorphicBundles.hodgeTensorRealizations_test_polarization, AutomorphicBundles.hodgeTensorRealizations_test_zero

AutomorphicBundles.tensorFrameTorsor
Define the de Rham frame functor by tensor-preserving isomorphisms η:V⊗O→H_dR. The right action
is η·g=η∘g. Prove representability and local nonemptiness from the tensor comparison, then
identify it as the relevant principal torsor. Being a closed subfunctor of an isomorphism scheme
by itself proves neither local nonemptiness nor the torsor property.
API: AutomorphicBundles.tensorFrameTorsor_frame, AutomorphicBundles.tensorFrameTorsor_right_action, AutomorphicBundles.tensorFrameTorsor_coefficient
Tests: AutomorphicBundles.tensorFrameTorsor_test_identity, AutomorphicBundles.tensorFrameTorsor_test_sp, AutomorphicBundles.tensorFrameTorsor_test_rank

AutomorphicBundles.filtrationReduction
Construct the equivariant filtration map from the tensor frame torsor to the reflex-field
compact dual. Over a field where the reference parabolic is defined, identify its inverse image
with a P_Hᶜ-reduction and its unipotent quotient with graded frames. The reflex flag can have no
rational point, so do not choose a reference filtration over E without a hypothesis; nonsplit
flag forms test this distinction.
API: AutomorphicBundles.filtrationReduction_flag_map, AutomorphicBundles.filtrationReduction_parabolic_fibre, AutomorphicBundles.filtrationReduction_levi
Tests: AutomorphicBundles.filtrationReduction_test_siegel, AutomorphicBundles.filtrationReduction_test_zero, AutomorphicBundles.filtrationReduction_test_no_point

AutomorphicBundles.hodgeCanonicalPrincipalBundle
For a Hodge-type Shimura datum in characteristic zero, construct the canonical Gᶜ-principal
bundle over the reflex canonical model, its filtration map, its full-group flat connection and
its Hecke tower maps. Compare with the analytic torsor and impose the CM-period normalization at
special points. The integral tensor-frame construction at a particular good prime is additional
model-specific work, not an all-prime consequence.

AutomorphicBundles.embeddingIndependence
Compare the canonical principal bundles obtained from two faithful symplectic embeddings of the
same Hodge-type datum. Use a common tensor realization and tensor projectors to produce the
canonical comparison. Check its cocycle for three embeddings and compatibility with filtration,
connection, Hecke maps and CM normalization.

AutomorphicBundles.cmPrincipalNormalization
At a special point identify the principal-bundle fibre with the corresponding CM period torsor.
Verify reciprocity compatibility with the actual special-point transport. This fixes the
canonical rational model and comparison isomorphisms; it does not supply a preferred frame, a
numerical period or a trivialization of the period torsor.

AutomorphicBundles.abelianCanonicalPrincipalBundle
Pass from Hodge-type data to abelian-type data through the stated connected central-isogeny and
finite-quotient constructions. Descend the bundle, filtration, connection and tower maps,
checking that the quotient kernel acts trivially on the coefficient fibres. Compatibility with
connected-component transport is part of the construction.

AutomorphicBundles.principalHeckePullback
Along the supplied finite étale arithmetic level maps and Hecke translations, construct the
canonical isomorphisms between the pulled-back principal bundles. They preserve the filtration
map, full-group connection and special-point normalization, and satisfy identity and composition
laws. Trace on coherent sections is a separate B5 operation.

### B1.general

AutomorphicBundles.connectedPrincipalConjugation
For the connected datum with semisimple simply connected group, construct the
special-point-normalized conjugation transport of its principal bundle. Include the compact-dual
map, connection and Hecke action. Use the rank-one reduction and faithful adjoint-jet
realization below to prove that the normalization controls principal automorphisms.

AutomorphicBundles.adjointJetRealization
Realize the adjoint coefficient faithfully inside the second jets of the tangent bundle in the
connected conjugation argument. Prove equivariance and the induced restriction on principal
automorphisms. Use the corrected order-two injection in Milne's Lemmas 9.3–9.4; an order-one
tangent realization and the withdrawn Harris 1984 assertion do not replace it.

AutomorphicBundles.generalConnectedReduction
Reduce the connected principal-bundle conjugation theorem to type-A₁ subdata after the
prescribed totally real auxiliary extension. Separate algebraic-group generation in Lemma 9.5
from generation of rational points in Lemma 9.2. The latter requires the stated special tori,
local isotropy, simplicity and continuity arguments. Do not invoke the stronger rational-point
assertion in §8.1, which its footnote leaves conjectural.

AutomorphicBundles.generalPrincipalModel
For a general pure Shimura datum satisfying Milne II (2.1), descend the normalized connected
principal bundles to a canonical Gᶜ-torsor over E. Prove the continuity and effectivity of the
Weil descent datum and its compatibility with components and level maps. A family of motives is
not an additional assumed carrier for this construction.

AutomorphicBundles.generalCompactDualMap
Descend the equivariant compact-dual map along the general principal-bundle descent datum. It is
defined over E with its reflex flag target and is compatible with conjugation. A rational point
of that flag variety is not needed for the map and is not asserted by its existence.

AutomorphicBundles.generalConjugationCocycle
Prove the two-step cocycle for the special-point-normalized conjugation transports of general
principal bundles and their compact-dual maps. Keep all coefficient-field transports. Rational
Betti statements retain the ℚ-defined weight hypothesis of Milne III Theorem 6.2.

### B2

AutomorphicBundles.automorphicVectorBundle
Use the canonical principal bundle and its equivariant compact-dual map to descend γ*J to an
automorphic vector bundle V(J) over the actual coefficient field L. For a parabolic or Levi
representation take J from B0. Give a tensor, dual, unit and coefficient-map functor with
base-field and level compatibility. A full-group representation is required for the additional
flat realization; a GL₂ parabolic Hodge-line character need not extend to a rank-one GL₂
representation.
API: AutomorphicBundles.automorphicVectorBundle_pullback, AutomorphicBundles.automorphicVectorBundle_levi, AutomorphicBundles.automorphicVectorBundle_tensor, AutomorphicBundles.automorphicVectorBundle_scalar_extension, AutomorphicBundles.automorphicVectorBundle_map, AutomorphicBundles.automorphicVectorBundle_map_id, AutomorphicBundles.automorphicVectorBundle_map_comp
Tests: AutomorphicBundles.automorphicVectorBundle_test_unit, AutomorphicBundles.automorphicVectorBundle_test_hodge, AutomorphicBundles.automorphicVectorBundle_test_nonflat

AutomorphicBundles.automorphicAnalyticComparison
After L↪ℂ identify V(J)^an with B0's holomorphic quotient coefficient, using the same torsor,
inverse fibre action and effective arithmetic descent. Check coefficient maps, tensors and the
section transformation law under this identification.

AutomorphicBundles.leviHighestWeightConvention
For a split Levi over L and a dominant weight λ, label the coefficient fibre by the actual
representation V_λ. In BCGP's left-coset function realization its Borel character is −w₀,Mλ. The
dual representation has highest weight −w₀,Mλ as a different statement. Provide the explicit
conversion, including similitude characters, and the Galois descent datum for nonsplit forms.

AutomorphicBundles.bettiCoefficientLocalSystem
For a rational full-group Gᶜ-representation W, form the arithmetic Betti local system Γ\(X×W) on
the effective quotient. Under the stated ℚ-defined weight hypothesis, equip it with the
homogeneous variation of Hodge structure. Treat mixed weights weight by weight. Preserve the
homology/cohomology dual convention and Tate lines in the Siegel specialization.
API: AutomorphicBundles.bettiCoefficientLocalSystem_monodromy, AutomorphicBundles.bettiCoefficientLocalSystem_tensor, AutomorphicBundles.bettiCoefficientLocalSystem_complex_flat, AutomorphicBundles.bettiCoefficientLocalSystem_map, AutomorphicBundles.bettiCoefficientLocalSystem_map_id, AutomorphicBundles.bettiCoefficientLocalSystem_map_comp
Tests: AutomorphicBundles.bettiCoefficientLocalSystem_test_unit, AutomorphicBundles.bettiCoefficientLocalSystem_test_standard, AutomorphicBundles.bettiCoefficientLocalSystem_test_levi

AutomorphicBundles.etaleCoefficientLocalSystem
Choose a stable ℤ_ℓ lattice in a full-group ℓ-adic coefficient and compatible compact ℓ-levels.
Descend its finite lattice quotients on the arithmetic étale tower, take the inverse limit and
invert ℓ to obtain the local system over the canonical coefficient field. Prove independence of
the lattice after inversion and Hecke compatibility. Arithmetic ℚ_ℓ(1) and the geometrically
constant rank-one sheaf have different Galois actions.
API: AutomorphicBundles.etaleCoefficientLocalSystem_finite_level, AutomorphicBundles.etaleCoefficientLocalSystem_lattice_independence, AutomorphicBundles.etaleCoefficientLocalSystem_hecke, AutomorphicBundles.etaleCoefficientLocalSystem_map, AutomorphicBundles.etaleCoefficientLocalSystem_map_id, AutomorphicBundles.etaleCoefficientLocalSystem_map_comp
Tests: AutomorphicBundles.etaleCoefficientLocalSystem_test_unit, AutomorphicBundles.etaleCoefficientLocalSystem_test_abelian, AutomorphicBundles.etaleCoefficientLocalSystem_test_arithmetic

AutomorphicBundles.filteredDeRhamCoefficient
Associate to a full-group representation its algebraic de Rham coefficient with integrable
connection and Hodge filtration from γ. Prove Griffiths transversality and the corresponding
analytic horizontal-section description. Parabolic or Levi-only coefficients use the
associated-bundle functor without this flat structure.
API: AutomorphicBundles.filteredDeRhamCoefficient_connection, AutomorphicBundles.filteredDeRhamCoefficient_filtration, AutomorphicBundles.filteredDeRhamCoefficient_transversality, AutomorphicBundles.filteredDeRhamCoefficient_map, AutomorphicBundles.filteredDeRhamCoefficient_map_id, AutomorphicBundles.filteredDeRhamCoefficient_map_comp
Tests: AutomorphicBundles.filteredDeRhamCoefficient_test_unit, AutomorphicBundles.filteredDeRhamCoefficient_test_hodge, AutomorphicBundles.filteredDeRhamCoefficient_test_levi

AutomorphicBundles.realizationComparison
Over ℂ compare the Betti local system tensored with ℚ_ℓ to the geometric étale coefficient, and
the Betti coefficient tensored with O^an to the analytic filtered de Rham bundle. Make the maps
compatible with the specified tensor, dual, Tate and Hecke operations. The comparison requested
here does not add crystalline or B_dR assertions.

AutomorphicBundles.coefficientTensorHecke
Prove coherent compatibility of the associated-coefficient and full-group realization functors
with tensor products, duals, units, coefficient maps and finite-level/Hecke pullbacks. Include
the associativity, unit and composition diagrams. Exactness here is characteristic-zero
representation exactness; an integral lattice requires its own flatness or projectivity
hypotheses.

AutomorphicBundles.siegelTautologicalSequence
On the split opposite flag P_HT\G for GSp_{2g}, construct the sequence
0→L_(0,…,0,−1;1)→O⊗St→L_(1,0,…,0;1)→0. Both outer terms have rank g. Compare it with the actual
Hodge sequence using the opposite/dual conversion and declared Tate character. Its realization
in the solid analytic category is a separately supplied comparison.

### B2.general

AutomorphicBundles.generalAssociatedModel
Apply the same associated-coefficient functor to B1.general's canonical principal bundle and
compact-dual map. Obtain general-data V(J) over the actual field of definition, with tensor,
dual, pullback, analytic and normalized conjugation compatibilities. This uses the common
algebraic contracted-product interface, without a second coefficient construction.

AutomorphicBundles.generalFlatRealizations
For rational full-group coefficients on a general pure datum, construct Betti, arithmetic ℓ-adic
and filtered de Rham realizations using the general canonical torsor and tower. Give their
comparisons and tensor/Hecke maps. No universal abelian family or family of motives is assumed
for the general datum.

AutomorphicBundles.generalRealizationConjugation
Transport the general associated bundles and full-group realizations through normalized
conjugation. Check their comparison cocycles, coefficient-field changes and filtration maps. The
rational Betti comparison requires the weight to be ℚ-defined; its absence cannot be repaired by
simply forgetting the field of definition.

### B3

AutomorphicBundles.boundaryCoefficientChart
On the supplied neat characteristic-zero Hodge/PEL toroidal chart, describe the coefficient
using the actual semi-abelian degeneration or one-motive and its graded frames. Extend to the
specified good integral PEL base only with C5's finite locally free representations. Identify
the relative invariant differentials and coefficient transports on overlaps; the torus
differential is du/u, not the base differential dq/q.
API: AutomorphicBundles.boundaryCoefficientChart_restrict, AutomorphicBundles.boundaryCoefficientChart_hodge, AutomorphicBundles.boundaryCoefficientChart_transition, AutomorphicBundles.boundaryCoefficientChart_map, AutomorphicBundles.boundaryCoefficientChart_map_id, AutomorphicBundles.boundaryCoefficientChart_map_comp
Tests: AutomorphicBundles.boundaryCoefficientChart_test_tate, AutomorphicBundles.boundaryCoefficientChart_test_unit, AutomorphicBundles.boundaryCoefficientChart_test_base

AutomorphicBundles.canonicalExtension
Construct the locally free canonical extension V^can_Σ on the specified smooth toroidal model,
characterized by canonical boundary frames and the corresponding growth normalization. Give its
normalized coefficient-map and tensor functor. Use the Hodge/abelian characteristic-zero
construction, and the specific C5 good-integral coefficients where stated. Equality on the open
variety cannot characterize an extension, since boundary twists have the same restriction.
API: AutomorphicBundles.canonicalExtension_restrict, AutomorphicBundles.canonicalExtension_boundary_frame, AutomorphicBundles.canonicalExtension_tensor, AutomorphicBundles.canonicalExtension_unique, AutomorphicBundles.canonicalExtension_map, AutomorphicBundles.canonicalExtension_map_id, AutomorphicBundles.canonicalExtension_map_comp
Tests: AutomorphicBundles.canonicalExtension_test_unit, AutomorphicBundles.canonicalExtension_test_hodge, AutomorphicBundles.canonicalExtension_test_twist

AutomorphicBundles.canonicalExtensionGluing
Glue the chartwise canonical coefficient by the actual boundary-frame transition isomorphisms.
Prove the overlap cocycle, compatibility with the open bundle and uniqueness among extensions
with these normalized charts. Normality of the compactification alone does not establish the
gluing or uniqueness.

AutomorphicBundles.subcanonicalExtension
For the reduced normal-crossings Cartier boundary i:D↪S_Σ set V^sub_Σ=V^can_Σ⊗I_D=V^can_Σ(−D).
Construct 0→V^sub_Σ→V^can_Σ→i_*i*V^can_Σ→0 with the applicable field or relative tensor
hypotheses. At a crossing q₁q₂=0 the cusp ideal is (q₁q₂); vanishing only in (q₁,q₂), or
twisting by 2D, gives a different condition.
API: AutomorphicBundles.subcanonicalExtension_ideal, AutomorphicBundles.subcanonicalExtension_inclusion, AutomorphicBundles.subcanonicalExtension_restrict, AutomorphicBundles.subcanonicalExtension_map, AutomorphicBundles.subcanonicalExtension_map_id, AutomorphicBundles.subcanonicalExtension_map_comp
Tests: AutomorphicBundles.subcanonicalExtension_test_empty, AutomorphicBundles.subcanonicalExtension_test_crossing, AutomorphicBundles.subcanonicalExtension_test_multiplicity

AutomorphicBundles.refinementCanonicalExtension
For a smooth fan refinement f:S_Σ′→S_Σ identify f*V^can_Σ with V^can_Σ′ and construct the
natural boundary-ideal map f*V^sub_Σ→V^sub_Σ′. In general f*D≥D′, so the latter map need not be
an isomorphism. Use C3's f_*O=O and f_*I_D′=I_D to identify pushforwards and section spaces,
with coherent composition laws.

AutomorphicBundles.fanIndependentSections
Use a common smooth projective refinement to identify H⁰ of canonical extensions, and separately
of subcanonical extensions, for different fans in characteristic zero. Prove independence of the
common refinement and the three-fan cocycle. The required assertions concern section spaces and
the specified ideal pushforward, without a blanket theorem about higher direct images.

AutomorphicBundles.logarithmicConnectionExtension
For a full-group coefficient with regular singular connection and unipotent local monodromy,
extend the connection logarithmically with nilpotent residues and the zero-exponent
normalization. Identify its underlying bundle with the canonical extension and retain
logarithmic Griffiths transversality. Nonunipotent monodromy requires a specified residue
interval and is outside this nilpotent-residue identification.
API: AutomorphicBundles.logarithmicConnectionExtension_restrict, AutomorphicBundles.logarithmicConnectionExtension_residue, AutomorphicBundles.logarithmicConnectionExtension_tensor, AutomorphicBundles.logarithmicConnectionExtension_map, AutomorphicBundles.logarithmicConnectionExtension_map_id, AutomorphicBundles.logarithmicConnectionExtension_map_comp
Tests: AutomorphicBundles.logarithmicConnectionExtension_test_unit, AutomorphicBundles.logarithmicConnectionExtension_test_tate, AutomorphicBundles.logarithmicConnectionExtension_test_nonunipotent

AutomorphicBundles.minimalCoherentPushforward
For the proper toroidal-to-minimal morphism between the specified Noetherian characteristic-zero
models, form π_*V^can. Prove coherence, equality of global section spaces and fan independence
using refinements. Do not assume it is a vector bundle at the minimal boundary; coherent ideals
such as (x,y) on a nodal chart distinguish coherence from local freeness.
API: AutomorphicBundles.minimalCoherentPushforward_sections, AutomorphicBundles.minimalCoherentPushforward_coherent, AutomorphicBundles.minimalCoherentPushforward_refinement, AutomorphicBundles.minimalCoherentPushforward_map, AutomorphicBundles.minimalCoherentPushforward_map_id, AutomorphicBundles.minimalCoherentPushforward_map_comp
Tests: AutomorphicBundles.minimalCoherentPushforward_test_proper_open, AutomorphicBundles.minimalCoherentPushforward_test_rank, AutomorphicBundles.minimalCoherentPushforward_test_singular

AutomorphicBundles.minimalHodgeLineComparison
Under the supplied positivity, finite-generation and compactification hypotheses, descend a
sufficiently divisible positive power of the determinant Hodge line to an ample line on the
minimal model. Identify its toroidal pullback and the corresponding sections. This does not
descend an arbitrary automorphic vector bundle or remove the required divisibility.

AutomorphicBundles.canonicalRationalDescent
Descend the chart-normalized canonical and reduced-boundary subcanonical extensions to their
actual coefficient field L, and prove compatibility with field extension. Transport the boundary
ideal and normalized comparison maps in the descent datum. No all-prime integral extension
follows from this rationality statement.

### B3.general

AutomorphicBundles.generalCanonicalExtension
Extend the general-data coefficient to the supplied characteristic-zero general toroidal model,
using the general boundary chart and canonical normalization. Give gluing, rationality,
canonical and subcanonical coefficients and their functorial maps. The construction uses
C2.general's boundary data without asserting a universal abelian degeneration for general
Shimura data.

AutomorphicBundles.generalLogarithmicComparison
For a general full-group coefficient satisfying regular singularity and unipotence, compare the
canonical extension with the zero-exponent logarithmic connection extension. Preserve
filtration, residues and the normalized general conjugation map. The generic regular-singular
connection interface is a required supplier input.

AutomorphicBundles.generalBoundaryFunctoriality
Prove that general canonical and subcanonical section spaces and coefficient maps respect
compatible fan refinements, compactified Hecke maps and normalized conjugation. Use common
refinements and the reduced-boundary ideal pushforward for subcanonical sections. Retain the
distinction between their pushforward/section comparison and arbitrary subcanonical pullback
isomorphisms.

### B4

AutomorphicBundles.classicalForms
For an automorphic coefficient on a smooth projective toroidal model S_Σ/L, define
M(J,K;L)=H⁰(S_Σ,V(J)^can). The definition applies to the Hodge/abelian and general coefficients
through their corresponding B2–B3 layers. Use fan-independent sections for the level space,
proper coherent finiteness for finite dimension, and tensoring of sections for multiplication.
H⁰ on the nonproper open Shimura variety is not a substitute.
API: AutomorphicBundles.classicalForms_section, AutomorphicBundles.classicalForms_fan, AutomorphicBundles.classicalForms_multiply, AutomorphicBundles.classicalForms_map, AutomorphicBundles.classicalForms_map_id, AutomorphicBundles.classicalForms_map_comp
Tests: AutomorphicBundles.classicalForms_test_unit, AutomorphicBundles.classicalForms_test_curve, AutomorphicBundles.classicalForms_test_open, AutomorphicBundles.classicalForms_test_map_id, AutomorphicBundles.classicalForms_test_map_comp, AutomorphicBundles.classicalForms_test_map_zero

AutomorphicBundles.cuspForms
Define S(J,K;L)=H⁰(S_Σ,V(J)^sub). The boundary sequence identifies its image in M with the
kernel of restriction to the reduced boundary. This means vanishing in every boundary
component's ideal in the canonical frame. Use the subcanonical ideal-pushforward comparison for
fan independence. Left exactness suffices for the kernel statement; neither H¹-vanishing nor
Koecher's extension theorem makes boundary vanishing automatic.
API: AutomorphicBundles.cuspForms_include, AutomorphicBundles.cuspForms_kernel, AutomorphicBundles.cuspForms_tensor, AutomorphicBundles.cuspForms_map, AutomorphicBundles.cuspForms_map_id, AutomorphicBundles.cuspForms_map_comp
Tests: AutomorphicBundles.cuspForms_test_empty, AutomorphicBundles.cuspForms_test_constant, AutomorphicBundles.cuspForms_test_crossing

AutomorphicBundles.AutomorphyFactor
For a left group action on a complex domain X and a finite-dimensional complex coefficient V,
define a holomorphic linear factor J:Γ×X→GL_ℂ(V) by holomorphy in x, J(1,x)=1 and
J(gh,x)=J(g,hx)J(h,x). Its sections satisfy f(gx)=J(g,x)f(x). Canonical extension and cusp
growth are additional conditions in the specified boundary frame: holomorphic extension and
membership in the reduced boundary ideal, respectively. Frame change u gives
J′(g,x)=u(gx)J(g,x)u(x)⁻¹. The functional Lean form keeps the concrete linear equations and
omits the unavailable holomorphic carrier.
API: AutomorphicBundles.AutomorphyFactor_one, AutomorphicBundles.AutomorphyFactor_mul, AutomorphicBundles.AutomorphyFactor_change_frame, AutomorphicBundles.AutomorphyFactor_forget, AutomorphicBundles.AutomorphyFactor_ext, AutomorphicBundles.AutomorphyFactor_change_frame_id, AutomorphicBundles.AutomorphyFactor_change_frame_comp
Tests: AutomorphicBundles.AutomorphyFactor_test_unit, AutomorphicBundles.AutomorphyFactor_test_frame, AutomorphicBundles.AutomorphyFactor_test_order, AutomorphicBundles.AutomorphyFactor_test_shift

AutomorphicBundles.slashActionOfAutomorphyFactor
Let β index weights, G be a monoid acting on X on the left, R a semiring and V an R-module. A
family J(k,g,x):V≃_R V with the normalized shifted cocycle defines the existing SlashAction β G
(X→V) by (f|_k g)(x)=J(k,g,x)⁻¹(f(gx)). Prove its additive and R-linear laws, its dependence
only on the coefficient maps and its equality with precomposition when J=1. Its right-action
multiplication is f|_k(gh)=(f|_k g)|_k h.
API: AutomorphicBundles.slashActionOfAutomorphyFactor_map_apply, AutomorphicBundles.slashActionOfAutomorphyFactor_invariant_iff, AutomorphicBundles.slashActionOfAutomorphyFactor_map_smul, AutomorphicBundles.slashActionOfAutomorphyFactor_congr, AutomorphicBundles.slashActionOfAutomorphyFactor_map_of_trivial
Tests: AutomorphicBundles.slashActionOfAutomorphyFactor_test_trivial, AutomorphicBundles.slashActionOfAutomorphyFactor_test_zero, AutomorphicBundles.slashActionOfAutomorphyFactor_test_frame, AutomorphicBundles.slashActionOfAutomorphyFactor_test_noncommuting, AutomorphicBundles.slashActionOfAutomorphyFactor_test_inverse, AutomorphicBundles.slashActionOfAutomorphyFactor_test_sl2, AutomorphicBundles.slashActionOfAutomorphyFactor_test_zero_noncocycle, AutomorphicBundles.slashActionOfAutomorphyFactor_test_semilinear

AutomorphicBundles.slashActionOfAutomorphyFactor_map_apply
For exactly the family and hypotheses used in slashActionOfAutomorphyFactor, evaluate the map as
J(k,g,x)⁻¹(f(gx)). This is the defining-map formula, without an additional invertibility or
nonzero-section assumption.

AutomorphicBundles.slashActionOfAutomorphyFactor_invariant_iff
For the same normalized linear family, prove that f|_k g=f for every g is equivalent to
f(gx)=J(k,g,x)f(x) for every g,x. Apply the linear equivalence at each point; no cancellation of
a selected nonzero section is involved.

AutomorphicBundles.inverse_base_action_cocycle
If G and H are groups and J:G×X→H obeys the left shifted cocycle, the right base action x·g=g⁻¹x
has factor J_right(x,g)=J(g⁻¹,x). Its law is J((gh)⁻¹,x)=J(h⁻¹,g⁻¹x)J(g⁻¹,x). This changes the
action on the base; the right slash action on functions is the separate construction above.

AutomorphicBundles.cocycle_at_of_automorphy_of_ne_zero
For a monoid action, a field K and scalar functions J:G×X→K and f:X→K satisfying
f(gx)=J(g,x)f(x), prove the shifted cocycle at any x where f(x)≠0. Compare f((gh)x) with its
iterated transformation and cancel f(x). There is no such deduction at a zero of f; the
identically zero section imposes no cocycle condition.

AutomorphicBundles.analyticClassicalComparison
Under L↪ℂ, compare M with holomorphic equivariant sections of the analytic coefficient whose
components extend holomorphically in canonical cusp frames. Compare S with those components in
the reduced boundary ideal. Use the local removable-singularity result for logarithmic growth
and coordinatewise divisibility, then projective coherent GAGA on S_Σ. Scalar boundedness on the
Baily–Borel model requires the separately descended scalar line. A degree-zero kernel comparison
in the course notes does not prove a full Dolbeault resolution.

AutomorphicBundles.gl2HodgeLineComparison
At a fine modular level on the actual modular-curve model, identify ω=e*Ω¹_{E/S}, its
generalized-elliptic canonical extension and weight-k coefficient ω^k for every integer k;
negative powers mean duals. Import R15.1's proper-curve geometric forms and their all-cusp
analytic comparison to Mathlib ModularForm/CuspForm. Match the uniformization, Hodge dual
convention, holomorphy and every cusp condition. Use SL₂ for the ℂ-linear factor adapter and the
separate semilinear law for determinant-negative GL₂.

AutomorphicBundles.HilbertArithmeticWeight
For the finite set I of real embeddings of F, define HilbertArithmeticWeight by integers k_τ and
a common integer w with k_τ≡w mod 2. Put m_τ=(w−k_τ)/2 and prove 2m_τ=w−k_τ. Define addition and
extensionality by the actual integer data. This is a weight label; field and central descent are
separate theorems. Allow negative k_τ and negative determinant exponents.
API: AutomorphicBundles.HilbertArithmeticWeight_k, AutomorphicBundles.HilbertArithmeticWeight_w, AutomorphicBundles.HilbertArithmeticWeight_detExponent, AutomorphicBundles.HilbertArithmeticWeight_two_mul_detExponent, AutomorphicBundles.HilbertArithmeticWeight_add, AutomorphicBundles.HilbertArithmeticWeight_ext
Tests: AutomorphicBundles.HilbertArithmeticWeight_test_zero, AutomorphicBundles.HilbertArithmeticWeight_test_negative, AutomorphicBundles.HilbertArithmeticWeight_test_parity

AutomorphicBundles.hilbertCoefficient
Over a characteristic-zero splitting field L for F and the actual Hilbert–Blumenthal family,
take H¹_dR=⊕_τH_τ and ω=⊕_τω_τ, with ranks two and one. Set δ_τ=det H_τ and
ω^{(k,w)}=⊗_τ(ω_τ^{k_τ}⊗δ_τ^{(w−k_τ)/2}). In cohomological frames t_τ acts on ω_τ by t_τ and on
δ_τ by t_τ², giving the central character Norm(t)^w. Homology frames invert it. Tensor products
correspond to addition of arithmetic weights.
API: AutomorphicBundles.hilbertCoefficient_formula, AutomorphicBundles.hilbertCoefficient_central, AutomorphicBundles.hilbertCoefficient_add
Tests: AutomorphicBundles.hilbertCoefficient_test_rational, AutomorphicBundles.hilbertCoefficient_test_determinant, AutomorphicBundles.hilbertCoefficient_test_negative

AutomorphicBundles.hilbertCentralDescent
For the actual Res_{F/ℚ}GL₂ or G* quotient and its ineffective central subgroup C, the split
coefficient descends precisely when Norm(t)^w, or its homology inverse, is trivial on C. Totally
positive norm-one units pass this test, but remaining signs and finite stabilizers need their
own check. Use H0/H3/H4's true polarization and unit quotient for G*, retaining the stack
coefficient if descent fails.

AutomorphicBundles.unsplitHilbertDescent
Before a splitting extension use the O_F⊗O-linear Hodge and de Rham modules with their
determinant/norm constructions, rather than global embedding idempotents. After splitting,
descend the labelled tensor coefficient using the actual Galois permutation of embeddings and
representation datum, together with the central descent condition. Its field is the
weight/representation field and can exceed the reflex field. Integral versions require the
indicated finite locally free hypotheses.

AutomorphicBundles.siegelCoefficient
For a rank-g cohomological Hodge bundle ω and dominant integer λ₁≥⋯≥λ_g, set a_i=λ_i−λ_g and
define S_a(ω)⊗det(ω)^{λ_g} in characteristic zero. Declare the similitude/Tate character
independently. For a good integral base require the actual integral Schur representation.
Compare with BCGP's two tautological Levi coefficients using the opposite/dual switch from B2,
without asserting a split Hodge sequence. Scalar λ=(r,…,r) gives det(ω)^r; λ=(1,0,…,0) gives the
rank-g ω.
API: AutomorphicBundles.siegelCoefficient_schur, AutomorphicBundles.siegelCoefficient_scalar, AutomorphicBundles.siegelCoefficient_standard
Tests: AutomorphicBundles.siegelCoefficient_test_g1, AutomorphicBundles.siegelCoefficient_test_det, AutomorphicBundles.siegelCoefficient_test_standard

AutomorphicBundles.unitaryCoefficient
For the imaginary-quadratic GU(1,1) PEL datum over L containing the two labelled embeddings τ
and barτ, take H¹_dR=H_τ⊕H_barτ with rank-two summands and rank-one Hodge lines. In
cohomological graded frames the GL₁×GL₁×G_m coefficient (k,l;n) is ω_τ^k⊗ω_barτ^l⊗ν^n, with ν
the specified similitude/Tate line. Negative exponents use duals. Conjugation swaps k and l and
transports the PEL datum; no universal determinant identification of ν is assumed.
API: AutomorphicBundles.unitaryCoefficient_formula, AutomorphicBundles.unitaryCoefficient_dual, AutomorphicBundles.unitaryCoefficient_conjugate
Tests: AutomorphicBundles.unitaryCoefficient_test_unit, AutomorphicBundles.unitaryCoefficient_test_line, AutomorphicBundles.unitaryCoefficient_test_twist

AutomorphicBundles.numberFieldFormsBaseChange
For a proper toroidal model over L and a coherent canonical or subcanonical coefficient F, prove
finite dimension of H⁰ and the field-extension isomorphism H⁰(S_Σ,F)⊗_L L′≃H⁰(S_Σ×_L L′,F_L′).
Under L↪ℂ this identifies the rational classical or cusp space inside its analytic counterpart.
Check products and coefficient maps. An integral special-fibre base-change assertion would
require different hypotheses.

AutomorphicBundles.classicalVBTateNormalization
In BCGP's Hodge-type setting, fix neat tame K^p, a p-adic field large enough for the split group
and reflex embeddings, compatible toroidal fans and the separately supplied rational Hodge–Tate
M-torsor/VB functor. For an algebraic Levi coefficient L_κ identify VB⁰_Σ(L_κ)≃ω^{κ,sm}(κ(μ)),
where ω^{κ,sm}=colim_{K_p}ω^κ_{K_p} has the classical rational structure. Transport the
comparison when the group action moves fans, using compatible refinements. The μ-weight twist
belongs to this identification; §4.8's coherent convention is untwisted.

### B5

Fourier-Jacobi coefficient modules on the abelian torsor
On Lan's smooth proper good-prime PEL toroidal stack X over the indicated localization R of
reflex integers, or its field version, let k≥0 and let M be any R-module. At a cusp Φ, use its
abelian torsor C_Φ, character line Ψ_Φ(ℓ) and boundary determinant line L_Φ=det_ℤ(X_Φ)⊗ω_A.
Define C_Φ(ℓ;k,M)=Γ(C_Φ,Ψ_Φ(ℓ)⊗L_Φ^k⊗_R M). Coefficient families are products over the specified
character degrees, with full stabilizer transport. An expression through a pushforward on the
lower-dimensional moduli stack requires its own projection/base-change comparison.
API: AutomorphicBundles.FJCoefficient.map, AutomorphicBundles.FJCoefficient.transport, AutomorphicBundles.FJCoefficient.family_ext
Tests: AutomorphicBundles.FJCoefficient.zeroCoefficients, AutomorphicBundles.FJCoefficient.tateTrivialization, AutomorphicBundles.FJCoefficient.notFiniteSupport

Expansion by restriction to a formal cusp chart
For a nonempty stratum (Φ,δ,σ), restrict AF(k,M) to its actual formal completion, pull back to
the supplied Mumford chart, identify ω_tor with L_Φ and extract the degree components. This
defines an R-linear map into ∏_{ℓ∈σ∨}C_Φ(ℓ;k,M), equivariant for the actual chart stabilizer.
Its image has the completion/support conditions of the chart; the unrestricted product target
does not assert surjectivity or a product description of the completed algebra.
API: AutomorphicBundles.FourierJacobi.localExpansion, AutomorphicBundles.FourierJacobi.local_coeff, AutomorphicBundles.FourierJacobi.local_add, AutomorphicBundles.FourierJacobi.local_smul
Tests: AutomorphicBundles.FourierJacobi.local_zero, AutomorphicBundles.FourierJacobi.local_tate_monomial, AutomorphicBundles.FourierJacobi.local_coefficient_map

Comparison of cone expansions through a common completion
For positive cones with σ₁ a face of the closure of σ₂, σ₂∨⊂σ₁∨. Compare expansions of a global
section by pulling it to the common completion along the union of positive-cone strata, then
mapping continuously to the individual stratum completions. The σ₁ coefficients agree on σ₂∨ and
vanish on σ₁∨∖σ₂∨. Incidence chains and the support theorem put the resulting family in the dual
of the fan support. This is a theorem for sections in the common image, not a map on arbitrary
separate completed rings. The homogeneous degree maps, continuity, Mumford coefficient
comparison and stack descent are required hypotheses.

The cusp-label Fourier-Jacobi morphism
Define FJ_Φ by the compatible local coefficients on P_Φ∨. Its target is the full-cusp-stabilizer
fixed submodule of ∏_{ℓ∈P_Φ∨}C_Φ(ℓ;k,M), including the stabilizer's action on degrees and
invertible coefficient sheaves. Extending it by zero to a cone recovers the local expansion.
Coefficients may have infinite support, and descent to invariants uses no group average.
API: AutomorphicBundles.FourierJacobi.expansion, AutomorphicBundles.FourierJacobi.coeff, AutomorphicBundles.FourierJacobi.constantTerm, AutomorphicBundles.FourierJacobi.coefficient_naturality
Tests: AutomorphicBundles.FourierJacobi.global_zero, AutomorphicBundles.FourierJacobi.global_local, AutomorphicBundles.FourierJacobi.no_averaging

Refinement invariance of the expansion
For a compatible smooth fan refinement π:X_Σ′→X_Σ and the coefficient-sensitive section
comparison, prove that pulling a section back preserves every FJ_Φ coefficient. Common
refinements give canonical, cocycle-compatible identifications for different fans. For finite
projective coefficients pass through splittings of finite free modules and the toric
direct-image comparison; flatness alone does not express a module as a union of free submodules.

Boundary restriction from the constant term
At a stratum from a positive cone, reduction of a global expansion modulo its stratum ideal
retains just its degree-zero coefficient. Every nonzero degree in P_Φ∨ lies in that ideal by
positivity. To descend the constant to the lower-dimensional moduli stack use full
Γ_Φ-invariance and the true quotient of its finite cover. Restriction on the cover alone does
not identify a section on the quotient.

Naturality in the coefficient module
For a fixed model, weight and finite cusp collection I, set F(M)=AF(k,M) and
G(M)=∏_{i∈I}FJE_Φᵢ(k,M). For every R-linear coefficient map a:M→N, prove
G(a)∘FJ_I,M=FJ_I,N∘F(a). Check formal restriction, Hodge identification and degree projection on
the actual charts, then descend the transports and invariance. This functoriality requires no
exactness assertion for completion on arbitrary modules.

Left exactness of Hodge-section coefficient change
For a short exact coefficient sequence 0→N→M→Q→0 on the supplied R-flat model, prove
0→AF(k,N)→AF(k,M)→AF(k,Q) is left exact. Local freeness of the Hodge coefficient and R-flatness
on the atlas give exactness after tensoring; descend the quasi-coherent sequence and take
sections. Surjectivity onto AF(k,Q) is not asserted.

Left exactness of invariant coefficient families
For the same short exact coefficient sequence, prove left exactness of 0→G(N)→G(M)→G(Q),
including the products over character degrees and full stabilizer invariants. On each R-flat
abelian-torsor chart use locally free tensoring and section left exactness. Products have
componentwise unique kernel lifts; equivariance and uniqueness make those lifts invariant.
Neither right exactness of invariants nor their commutation with filtered colimits is used.

The prime-quotient coefficient case
For a prime ideal p of the field or Dedekind base R, including p=0, put S=R/p. Assume the chosen
base-changed strata meet every irreducible component of the reduced model X_S and the completed
coefficient charts are compatible with this base change. Then the joint expansion on AF(k,S) is
injective. At neat level use C5/neat-strata-detect-geometric-components with its good-prime
regular base and fan/no-self-intersection assumptions; non-neat coverage requires a separate
branch or level-descent comparison. Zero coefficients give zero completed sections, finite-stalk
Krull separation gives zero near the selected strata, and reducedness plus component detection
gives global zero.

Propagation through a coefficient extension
For the two actual left-exact coefficient rows of 0→N→M→Q→0, injectivity of FJ on AF(k,N) and
AF(k,Q) implies injectivity on AF(k,M). Apply Mathlib's short-complex monicity theorem to the
natural expansion morphism; its first-row monomorphisms and exactness are precisely the two
preceding lemmas. Nonsplit coefficient extensions and torsion are allowed. Surjectivity of the
last global-section map is unnecessary.

Finite coefficients by a prime filtration
If the prime-quotient geometric hypotheses hold for every p, deduce FJ injectivity for every
finitely generated R-module. Use the existing Noetherian prime-filtration induction: zero
coefficients, transport from a module linearly equivalent to R/p, and propagation through a
short exact coefficient sequence. Repeated prime factors, R/pⁿ and finite nonfree projective
coefficients are included. The prime filtration does not assert finite length, and coefficient
surjectivity is not section surjectivity.

Joint injectivity at a component-detecting collection of cusps
In Lan's setting choose finitely many nonempty strata whose union meets every irreducible
component of X. Require early C5 to relate this total-space hypothesis to the prime-quotient
detection used above, including the needed non-neat descent. Then FJ_I on AF(k,M) is injective
for every R-module M. A section comes from a finitely generated submodule N⊂M by qcqs
section-colimit compatibility. Naturality and injection G(N)→G(M) reduce its vanishing to the
finite-coefficient theorem. There is no interchange of an infinite coefficient product with a
filtered colimit.

Recognition of a coefficient submodule from expansions
For M₁⊂M and the same detecting cusps, a section in AF(k,M) comes from AF(k,M₁) exactly when
every chosen expansion lies in the corresponding image of the invariant coefficient family with
M₁ coefficients. Map the section to M/M₁, use naturality and injectivity for that quotient, then
the kernel/image equality of the AF row. The quotient need not be finite or flat, so the
arbitrary-coefficient theorem is essential.

Cuspidality from boundary restrictions
For a neat smooth toroidal model with reduced relative normal-crossings boundary D, suppose the
boundary coefficient sequence remains exact after tensoring with the chosen M. The image of
Γ(X,ω_tor^k(−D)⊗_R M) consists exactly of sections restricting to zero on D. If the boundary
charts detect that restriction, this is equivalent to vanishing of the required constant terms
at all proper boundary labels. Over a nonreduced base geometric-point vanishing is insufficient,
and a single maximal-cusp constant term does not replace all boundary restrictions.

Geometric Hecke operators on classical sections
For an admissible prime-to-characteristic g let K_g=K∩gKg⁻¹ and use X_K←p₁X_Kg→p₂X_K. On
compatible toroidal refinements the actual coefficient realization gives θ_g:p₂*E→p₁*E. Define
H_g=tr_p₁ θ_g p₂* on Γ(X_K,E⊗_R M), then T_g=ν(g)H_g for the specified K-bi-invariant
multiplicative unit-valued character ν. Trace is finite locally free trace transported through
the supplied toric-refinement comparison. Prove independence of representatives and refinement,
coefficient-map compatibility and preservation of subcanonical sections using the
reduced-boundary transport.
API: AutomorphicBundles.ClassicalHecke.operator, AutomorphicBundles.ClassicalHecke.operator_one, AutomorphicBundles.ClassicalHecke.coefficient_map, AutomorphicBundles.ClassicalHecke.refinement
Tests: AutomorphicBundles.ClassicalHecke.identity, AutomorphicBundles.ClassicalHecke.weightZeroTrace, AutomorphicBundles.ClassicalHecke.modularNormalization

Convolution law for the geometric Hecke action
With these correspondence, coefficient-cocycle, trace/base-change and
multiplicative-normalization hypotheses, extend [KgK]↦T_g to a unital ring homomorphism from the
existing integral Hecke ring to End_R Γ(X_K,E⊗_R M). Its action restricts to cusp sections.
Compare the inverse/right-coset orientation with HeckeCosetModule convolution and retain the
integer multiplicities from the correspondence decomposition.

Hecke action at non-neat level
For a normal neat K′⊲K with finite quotient Γ, identify sections of the actual equivariant
coefficient on [X_K′/Γ] with Γ(X_K′,E⊗_R M)^Γ. Construct the K-Hecke action on this equalizer
using the K_g correspondence and common neat covers of both legs. Prove stability, independence
of cover and agreement with stack pull-identify-trace. The AA.4 Cartesian comparison requires
its U′L=U hypothesis; normality of a chosen cover alone does not supply that square or its
double coset.

Tate and analytic q-expansion comparison
Specialize rank-one FJ to R15.1's Tate q-expansion and its analytic comparison with
UpperHalfPlane.qExpansion h at q=exp(2πiτ/h), using the same differential frame. At full level
n≥3 the owner's family is Tate(qⁿ) over ℤ[1/n,ζ_n][[q]], with Kodaira–Spencer sending the square
of the invariant differential to n dq/q. Import the all-component integral principle, cusp exact
sequence and geometric modular Hecke operators from R15.2. Compare their normalization with the
existing analytic Hecke action.

Fourier–Jacobi expansion with vector coefficients
On Lan's neat good-prime PEL model over a Noetherian allowed coefficient algebra R, let W be a
finite projective representation of the actual Levi. Import Ecan(W) and its boundary pullback
identification with a locally free E₀(W) on the abelian torsor C. For any M define degree-ℓ
coefficients Γ(C,Ψ(ℓ)⊗E₀(W)⊗_R M) and extract them by completed restriction. Keep the completion
support and full stabilizer transports before taking invariants. In general characteristic zero
require C3.general's proven mixed-boundary/coefficient comparison; Milne VII Conjecture 4.1 is
not that proof. The boundary filtration on C need not descend to its stabilizer quotient.
API: AutomorphicBundles.VectorFourierJacobi.expansion, AutomorphicBundles.VectorFourierJacobi.coefficient, AutomorphicBundles.VectorFourierJacobi.coefficient_map, AutomorphicBundles.VectorFourierJacobi.transport, AutomorphicBundles.VectorFourierJacobi.determinant, AutomorphicBundles.VectorFourierJacobi.refinement
Tests: AutomorphicBundles.VectorFourierJacobi.zeroRepresentation, AutomorphicBundles.VectorFourierJacobi.rankTwoMonomial, AutomorphicBundles.VectorFourierJacobi.scalarSpecialization

Expansion principle for locally free automorphic coefficients
Let R be Noetherian and X qcqs smooth over R in the supplied setup. Require finite-rank locally
free Ecan, R-flat abelian-torsor charts with locally free E₀, the actual formal graded
comparison/descent, and finitely many strata meeting every irreducible component of X_(R/p) for
each prime p. Then joint vector FJ is injective for every R-module M and recognizes images from
M₁⊂M. Its boundary-zero criterion identifies Esub sections when the relative boundary tensor
sequence is exact. Use prime filtrations, the two left-exact rows and qcqs colimits as in the
scalar proof.

Hilbert cusp q-expansions and coefficient lines
Let F≠ℚ be totally real, p possibly ramified, O the valuation ring of a sufficiently large
p-adic field with embedding set Θ, and U=U^p GL₂(O_F,p). For a Noetherian O-algebra R and
integer vectors (k,m), require χ_(k+2m),R to be trivial on O_F×∩U. Use the actual ramified
splitting-model line A_(k,m) and M_(k,m)(U;R)=Γ(Y,A)=Γ(Ymin,j_*A). For cusp data 0→I→H→J→0 with
polarization and level, set Λ=d_F⁻¹I⁻¹J. Choose fine prime-to-p N≥3, ζ_N∈O and a splitting of H.
Its coefficient line is D_(k,m),c=⊗_θ(I⁻¹)_θ^{kθ}⊗(d_F(IJ)⁻¹)_θ^{mθ}. Define the expansion into
completed line-valued series indexed by N⁻¹Λ_+∪{0}; prove splitting, representative and
fine-level transport with the actual unit action. The minimal pushforward need not be locally
free.
API: AutomorphicBundles.HilbertQExpansion.map, AutomorphicBundles.HilbertQExpansion.coeff, AutomorphicBundles.HilbertQExpansion.transport, AutomorphicBundles.HilbertQExpansion.coefficient_map, AutomorphicBundles.HilbertQExpansion.fineLevel
Tests: AutomorphicBundles.HilbertQExpansion.zero, AutomorphicBundles.HilbertQExpansion.localMonomial, AutomorphicBundles.HilbertQExpansion.unitTransport

Hilbert q-expansion principle
In this prime-to-p Hilbert setting, take cusps S meeting every connected component of Ymin,
equivalently surjecting onto F_+×\A_F,f×/det(U). Diamond's q_S is injective. For a Noetherian
O-subalgebra R′⊂R, coefficients in D_c⊗_O R′ at every c∈S recognize a form over R′. Require the
ramified formal-chart and component/fibre comparison from C6/H2/H3. For general U descend from a
normal fine cover by invariants. General Iwahori special fibres can have irreducible components
without cusps, so this detection principle does not extend to them.

Hilbert cusp forms and all cusp constants
Define the Hilbert cusp space as the kernel of the product of constant-term maps over all cusps,
with each constant in its actual line D_c⊗_O R and cusp-unit invariants. Under the
canonical/subcanonical comparison and exact boundary tensor sequence this equals the image of
Γ(Ytor,A_(k,m)(−D)⊗_O R). Constants are independent of the splitting. In §6.3's
characteristic-zero or O-flat setting a nonparallel pair (kθ,mθ) has zero invariant constants
and every form is cuspidal; no such assertion is made for arbitrary torsion coefficients.

Hecke action on Fourier–Jacobi coefficients
Complete the actual Hecke correspondence at its cusps and define the coefficient operator H_g^FJ
by its lattice transport, coefficient-bundle identification and finite trace. Prove
FJ∘T_g=ν(g)H_g^FJ∘FJ, compatible with coefficient change and refinement. At a good modular ℓ∤N
this becomes b_n=a_(ℓn)+χ(ℓ)ℓ^(k−1)a_(n/ℓ), including n=0 and with the second coefficient zero
if ℓ∤n. In Diamond's normalized Hilbert coefficients, for v∤np use r_m^t(T_v f)=r_m^(ϖ_v
t)(f)+Nm(v)r_m^(ϖ_v⁻¹t)(S_v f); for U₁(n) and v|n omit the second term. Keep the
coefficient-line/χ_m normalization and actual central correspondence S_v.

Classical algebraic bundles in the Hodge–Tate coefficient functor
Import B4's μ-normalized classical VB⁰ identification for finite-dimensional algebraic
M-dominant L_κ, neat tame K^p and a sufficiently large p-adic field E. Compare coherent level
cohomology with colim_{K_p}RΓ(X_KpK^p,ω^κ_Kp), a complex of smooth admissible
G(ℚ_p)-representations, with the corresponding normalization. Give the subcanonical version
using the actual boundary ideal, and compatibility with level maps, prime-to-p Hecke maps and
fan changes through common refinements. For GSp₄ the (1,0;−1) check gives ω_A(−1)⊗O^sm. The VB
carrier and its finite-dimensional descent/acyclicity come from HigherHidaAndColemanTheory.

Classical Siegel Hodge–Tate decomposition
For BCGP's finite-level GSp₄ toroidal model, take an integral dominant κ=(k₁,k₂;w) with 0≥k₁≥k₂
and k₁+k₂+w even. Let V_κ∨ be the actual canonical pro-Kummer-étale coefficient. With the
untwisted coherent convention of §4.8 put λ₀=(k₁,k₂;−w), λ₁=(2−k₁,k₂;−w), λ₂=(3−k₂,k₁+1;−w),
λ₃=(3−k₂,3−k₁;−w), and 2a₀=k₁+k₂+w, 2a₁=2−k₁+k₂+w, 2a₂=4−k₂+k₁+w, 2a₃=6−k₁−k₂+w. For i≥0 specify
the G_ℚp×T_KpK^p-equivariant comparison Hⁱ(X,V_κ∨)⊗_ℚp C_p≃⊕_{j=0}³H^(i−j)(X,ω^λj)(−a_j), with
negative coherent degrees zero. Use the logarithmic/pro-Kummer cohomology in the source, its
actual comparison and dual BGG/Kostant inputs; a spectral sequence alone does not establish the
displayed decomposition.

Compact-support Siegel Hodge–Tate decomposition
For exactly the datum, integral weight, coefficient and Tate convention of the preceding
comparison, specify H_cⁱ(X,V_κ∨)⊗_ℚp C_p≃⊕_{j=0}³H^(i−j)(X,ω^λj(−D))(−a_j), equivariantly for
G_ℚp×T_KpK^p. Here D is the actual reduced toroidal boundary and H_c the supplied
compact-support logarithmic/étale theory. Its boundary comparison and duality are separate
prerequisites; ordinary cohomology and degree-zero constant-term vanishing alone do not imply
this formula.

-/
