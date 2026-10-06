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

/-
-- Tau Ceti modules used by the B5 part. They are imported in a build at Tau Ceti
-- f790474; see "Tau Ceti imports" below.
-- import TauCeti.NumberTheory.ModularForms.HeckeSlash.Nebentypus.Prime.Basic
-- import TauCeti.NumberTheory.ModularForms.HeckeSlash.Nebentypus.Action
-- import TauCeti.AlgebraicGeometry.Modules.TensorProduct
-/

/-!
# Suggested Lean forms: automorphic bundles and classical automorphic forms

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/AutomorphicBundles.md` is definitive. The statements here
suggest Lean forms so that contributors and reviewers converge on names and signatures.

The file joins the suggested files of the roadmap's two parts (layers B0–B4 and layer B5).
Every declaration below is a proposal, and every `sorry` is an unproved placeholder;
`implementationStatus` stays `unchecked` for every node.

## What is elaborated and what is not

The pinned libraries contain no Shimura variety, canonical principal bundle, toroidal
extension, completed Mumford family, Hilbert cusp series or logarithmic cohomology.
Following PROTOCOL section 13, a condition that cannot yet be stated is left out rather
than replaced by a `Prop`-valued field. So the file has two layers.

* **Executable prototypes.** Part B0–B4: the convention adapter from a normalized
  automorphy factor to Mathlib's existing `SlashAction`, its evaluation and invariance
  lemmas, the inverse-base and nonzero-section cocycle lemmas, the functional
  `AutomorphyFactor` with frame change, arithmetic Hilbert weights with their parity and
  determinant exponents, and global sections of a *supplied* `Scheme.Modules` object.
  Part B5: the last diagram chase of coefficient recognition, the existing short-complex
  monicity lemma and prime-filtration induction applied as the dévissage uses them, Krull
  separation and adic-completion injectivity for finite stalks, the power-series unit
  obstruction behind the common-completion repair, section maps of supplied scheme modules,
  the local finite-free trace, a rank-two local monomial and the four GSp₄ coherent weights.
  None of these constructs a geometric object of the roadmap.
* **Named contracts.** Every other definition, construction and theorem of the roadmap,
  with all its API items and unit tests, is listed with its exact statement in the
  *Geometric contract inventory* comment at the end. Those names are reserved; they are
  not elaborated signatures, and their typed form needs the supplier carriers named there.

## Names

Everything lives in the root namespace `AutomorphicBundles`. The B0–B4 names are
`AutomorphicBundles.*` as in that part's packet. The B5 packet's names
`FJCoefficient.*`, `FourierJacobi.*`, `ClassicalHecke.*`, `VectorFourierJacobi.*` and
`HilbertQExpansion.*` keep their relative form inside it (so `FJCoefficient.map` is
`AutomorphicBundles.FJCoefficient.map`). Tests of B0–B4 are `example`s in
`AutomorphicBundles.Test`, each preceded by a comment naming the packet's test.

## Conventions

The existing `SlashAction` carrier is reused and its right-action law is not replanned.
For a left action on X the coefficient convention is
  J(k, g*h, x) = J(k, g, h • x) ∘ J(k, h, x).
Since `e.trans f` means f ∘ e, the Lean hypothesis writes the factors in reverse `trans`
order. The slash operator is J(k,g,x)⁻¹ applied to f(g • x). Linear coefficients do not
model the determinant-negative GL₂(ℝ) action over ℂ: Mathlib's `ModularForm.smul_slash`
has the semilinear scalar factor `σ g c`, so the concrete compatibility test is restricted
to SL₂(ℤ).

## Tau Ceti imports

The B5 part cites three Tau Ceti declarations as existing infrastructure:
`HeckeRing.GL2.heckeRingHomCharSpace` and
`HeckeRing.GL2.twistedHeckeSlashSum_diagCosetGamma0_of_prime`
(`TauCeti.NumberTheory.ModularForms.HeckeSlash.Nebentypus.Action` and `….Prime.Basic`), and
`AlgebraicGeometry.Scheme.Modules.tensorProduct`
(`TauCeti.AlgebraicGeometry.Modules.TensorProduct`). No declaration of this file depends on
them; they appear only as `#check`s. The shared build in which this file is checked has
Mathlib at the pin but not these Tau Ceti modules, so their imports and `#check`s are
commented out above and below. In a build at Tau Ceti f790474, restore both; nothing else
changes.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/

/-! ## Part B0–B4: automorphy factors, Hilbert weights and supplied sections -/

open scoped MatrixGroups ModularForm
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

-- Test helpers only: two noncommuting automorphisms of Q², with their actual inverse maps.
private def shearX : (ℚ × ℚ) ≃ₗ[ℚ] (ℚ × ℚ) where
  toFun p := (p.1 + p.2, p.2)
  invFun p := (p.1 - p.2, p.2)
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry
  map_smul' := by sorry

private def shearY : (ℚ × ℚ) ≃ₗ[ℚ] (ℚ × ℚ) where
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
Shimura, holomorphic, compactification and canonical-coefficient conditions are
omitted, explicitly, rather than replaced by uninterpreted proposition fields. -/

/-- The algebraic forgetting of the holomorphic factor: its laws are concrete equations. -/
structure AutomorphyFactor (β G X R V : Type*) [Monoid G] [MulAction G X]
    [Semiring R] [AddCommMonoid V] [Module R V] where
  coefficient : β → G → X → (V ≃ₗ[R] V)
  normalized : ∀ k x, coefficient k 1 x = LinearEquiv.refl R V
  cocycle : ∀ k g h x,
    coefficient k (g * h) x = (coefficient k h x).trans (coefficient k g (h • x))

section FactorAPI
variable {β G X R V : Type*} [Monoid G] [MulAction G X]
    [Semiring R] [AddCommMonoid V] [Module R V]

theorem AutomorphyFactor_one (J : AutomorphyFactor β G X R V) (k : β) (x : X) :
    J.coefficient k 1 x = LinearEquiv.refl R V := by sorry

theorem AutomorphyFactor_mul (J : AutomorphyFactor β G X R V)
    (k : β) (g h : G) (x : X) :
    J.coefficient k (g * h) x =
      (J.coefficient k h x).trans (J.coefficient k g (h • x)) := by sorry

/-- Gauge change in the forgotten functional coefficient; holomorphy is omitted. -/
def AutomorphyFactor_change_frame (J : AutomorphyFactor β G X R V)
    (u : X → (V ≃ₗ[R] V)) : AutomorphyFactor β G X R V where
  coefficient k g x := ((u x).symm.trans (J.coefficient k g x)).trans (u (g • x))
  normalized := by sorry
  cocycle := by sorry

def AutomorphyFactor_forget (J : AutomorphyFactor β G X R V) :
    β → G → X → (V ≃ₗ[R] V) := J.coefficient

theorem AutomorphyFactor_ext (J K : AutomorphyFactor β G X R V)
    (h : ∀ k g x, J.coefficient k g x = K.coefficient k g x) : J = K := by sorry

theorem AutomorphyFactor_change_frame_id (J : AutomorphyFactor β G X R V) :
    AutomorphyFactor_change_frame J (fun _ ↦ LinearEquiv.refl R V) = J := by sorry

theorem AutomorphyFactor_change_frame_comp (J : AutomorphyFactor β G X R V)
    (u v : X → (V ≃ₗ[R] V)) :
    AutomorphyFactor_change_frame (AutomorphyFactor_change_frame J u) v =
      AutomorphyFactor_change_frame J (fun x ↦ (u x).trans (v x)) := by sorry

-- AutomorphicBundles.AutomorphyFactor_test_unit (functional forgetting)
example (k : β) (g : G) (x : X) :
    let J : AutomorphyFactor β G X R V :=
      { coefficient := fun _ _ _ ↦ LinearEquiv.refl R V
        normalized := by sorry
        cocycle := by sorry }
    J.coefficient k g x = LinearEquiv.refl R V := by sorry

-- AutomorphicBundles.AutomorphyFactor_test_frame (functional forgetting)
example (u : X → (V ≃ₗ[R] V)) (k : β) (g : G) (x : X) :
    let J : AutomorphyFactor β G X R V :=
      { coefficient := fun _ _ _ ↦ LinearEquiv.refl R V
        normalized := by sorry
        cocycle := by sorry }
    (AutomorphyFactor_change_frame J u).coefficient k g x =
      (u x).symm.trans (u (g • x)) := by sorry
end FactorAPI

end AutomorphicBundles

namespace AutomorphicBundles.Test
open AutomorphicBundles

-- AutomorphicBundles.AutomorphyFactor_test_order (functional forgetting)
example :
    let J : AutomorphyFactor Unit ((ℚ × ℚ) ≃ₗ[ℚ] (ℚ × ℚ)) (ℚ × ℚ) ℚ (ℚ × ℚ) :=
      { coefficient := fun _ g _ ↦ g
        normalized := by sorry
        cocycle := by sorry }
    J.coefficient () (shearX * shearY) (0, 0) (1, 0) = (2, 1) ∧
      J.coefficient () (shearY * shearX) (0, 0) (1, 0) = (1, 1) := by sorry

-- AutomorphicBundles.AutomorphyFactor_test_shift (functional forgetting)
example :
    let t : Multiplicative (ZMod 2) := Multiplicative.ofAdd 1
    let u : Multiplicative (ZMod 2) → ((ℚ × ℚ) ≃ₗ[ℚ] (ℚ × ℚ)) :=
      fun x ↦ if x = 1 then LinearEquiv.refl ℚ (ℚ × ℚ) else shearX
    let J : AutomorphyFactor Unit (Multiplicative (ZMod 2))
        (Multiplicative (ZMod 2)) ℚ (ℚ × ℚ) :=
      AutomorphyFactor_change_frame
        { coefficient := fun _ _ _ ↦ LinearEquiv.refl ℚ (ℚ × ℚ)
          normalized := by sorry
          cocycle := by sorry } u
    J.coefficient () (t * t) 1 (0, 1) = (0, 1) ∧
      ((J.coefficient () t 1).trans (J.coefficient () t 1)) (0, 1) = (2, 1) := by sorry

end AutomorphicBundles.Test

namespace AutomorphicBundles

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

/-! ## Part B5: Fourier–Jacobi dévissage, local tests and weight calculations -/

/- Existing infrastructure: reuse it, do not redeclare it. -/
#check ModularForm.trace
#check CuspForm.trace
-- #check HeckeRing.GL2.heckeRingHomCharSpace  -- Tau Ceti; see the note on Tau Ceti imports
-- #check AlgebraicGeometry.Scheme.Modules.tensorProduct  -- Tau Ceti; see the note on Tau Ceti imports
#check AlgebraicGeometry.tilde.isoTop
-- #check HeckeRing.GL2.twistedHeckeSlashSum_diagCosetGamma0_of_prime  -- Tau Ceti; see the note on Tau Ceti imports
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
objects is separately required by the packet; this lemma does not supply or
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
## Geometric contract inventory (prose, not elaborated signatures)

Every node of the two packets is listed here in layer order, with its proposed name, its
exact statement, its API items, its unit tests and its inputs, generated from the packets.
These entries are reserved names and mathematical contracts. A comment here must never be
reported as a compiled signature: only the declarations above were elaborated, and the
packets record the typed-signature gaps ("Typed geometric signatures need the actual
supplier carriers" for B0–B4, "Actual geometric suggested-file carriers" for B5).

The missing carriers are: the actual Shimura stacks and their coefficients (B1–B4, with
SchemeAndStackFoundations SF.1); canonical principal torsors and contracted products
(the reductive-group direction); toroidal and minimal compactifications, completed
graded Mumford families, supports and invariants (ShimuraCompactifications C0–C6,
AdicSpacesPartII F0); Hilbert cusp fractional-lattice and coefficient-line series
(Hilbert H2/H3, C6); and the logarithmic canonical local systems, their cohomology and
the VB and BGG inputs (HodgeTateAndCanonicalSubgroups T6:comparison and the proposed
coefficient and representation roadmaps). When those exist, each entry becomes a
signature with its API lemmas and its tests as `example`s, without Prop placeholders.

### Layer B0


AutomorphicBundles:B0/central-split-quotient [construction] AutomorphicBundles.centralSplitQuotient
For a reductive Q-group G occurring in a Shimura datum, let Z_s be the largest central Q-subtorus
  which is R-split and has no nonzero Q-split subtorus (equivalently the character-lattice
  conditions in Milne III, p.52). Construct Gᶜ=G/Z_s, its quotient homomorphism, and the universal
  factorization of algebraic representations trivial on Z_s. Use this coefficient quotient, not Gᵈᵉʳ
  or Gᵃᵈ. Lan §5.3 describes Z_s equivalently as the minimal central subtorus removing the excess
  real split rank.
API:
  AutomorphicBundles.centralSplitQuotient_quotient [projection]: The algebraic epimorphism q:G→Gᶜ
    has kernel Z_s.
  AutomorphicBundles.centralSplitQuotient_factor [universal-property]: If ρ|Z_s=1 there is a unique
    ρᶜ with ρ=ρᶜ∘q.
  AutomorphicBundles.centralSplitQuotient_factor_iff [characterisation]: An algebraic representation
    factors through q iff Z_s acts trivially.
Tests (examples):
  AutomorphicBundles.centralSplitQuotient_test_gl2 [computation]: For G=GL2/Q, ranks of its centre
    over Q and R agree, so Z_s=1 and Gᶜ=G.
  AutomorphicBundles.centralSplitQuotient_test_hilbert [non-example]: For G=Res(F/Q)GL2 with [F:Q]>1
    totally real, Z_s has dimension [F:Q]−1; replacing Gᶜ by G without a central condition admits
    forbidden coefficients.
  AutomorphicBundles.centralSplitQuotient_test_trivial [degenerate]: The trivial representation
    factors through Gᶜ and stays trivial.
Inputs: none

AutomorphicBundles:B0/ineffective-fibre-descent [theorem] AutomorphicBundles.ineffectiveFibreDescent
In characteristic zero, for a finite stabilizer quotient admitting a tame coarse space, an
  equivariant vector bundle descends locally freely precisely when every geometric stabilizer acts
  trivially on its fibre. For Γ\X, distinguish the ineffective arithmetic centre Γ∩Z(G)(Q) from
  finite orbifold stabilizers; divide by the former only for coefficients on which it acts
  trivially. Neatness removes torsion, not non-torsion central units.
Inputs: AutomorphicBundles:B0/central-split-quotient, AlgebraicModuliForArithmeticGeometry:R09.5

AutomorphicBundles:B0/hodge-parabolic-convention [comparison] AutomorphicBundles.hodgeParabolicConvention
Fix μ_h(z)=h_C(z,1), acting by z^(−p) on H^{p,q}, and F^a=⊕_{p≥a}H^{p,q}. Its filtration stabilizer
  is P_H=P(μ_h⁻¹) in the dynamic-parabolic convention, with Levi M=Z_G(μ_h). The Hodge–Tate flag
  convention uses the opposite P_HT=P(μ_h). Right cosets G/P_H and left cosets P_H\G are compared by
  inversion; their associated-bundle conventions must transform ρ to the corresponding inverse/dual
  convention, not replace P_H by P_HT under the same name.
Inputs: ShimuraData:D3/filtration-parabolic, ShimuraData:D3/compact-dual

AutomorphicBundles:B0/compact-dual-coefficient [construction] AutomorphicBundles.compactDualCoefficient
Over a characteristic-zero coefficient field L containing the reflex field and a field of definition
  of the representation, on the compact-dual form X̌_L construct the Gᶜ-equivariant bundle attached
  to an algebraic representation ρ of the Hodge parabolic Pᶜ. After a splitting extension it is
  Gᶜ_L×^{Pᶜ}V with (g,v)~(gp,ρ(p)⁻¹v). A Levi representation is inflated along Pᶜ→Mᶜ; P
  representations with nontrivial unipotent action are not silently declared Levi representations.
API:
  AutomorphicBundles.compactDualCoefficient_fibre [projection]: At the base flag the P-equivariant
    fibre is V with action ρ.
  AutomorphicBundles.compactDualCoefficient_inflate [compatibility]: The coefficient for an M
    representation equals that for its inflation to P.
  AutomorphicBundles.compactDualCoefficient_tensor [functoriality]: Associated coefficients preserve
    tensor products, duals and the tensor unit.
  AutomorphicBundles.compactDualCoefficient_map [functoriality]: For a Pᶜ-equivariant linear map
    u:V→W over the fixed coefficient field, the induced map sends [g,v] to [g,u(v)] on the
    associated compact-dual bundles.
  AutomorphicBundles.compactDualCoefficient_map_id [simp]: For a fixed admitted input V, the induced
    map of the identity morphism of V is the identity on its output.
  AutomorphicBundles.compactDualCoefficient_map_comp [functoriality]: For admitted composable
    morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with
    the induced map of u; all datum, level, field and model hypotheses remain fixed.
Tests (examples):
  AutomorphicBundles.compactDualCoefficient_test_unit [degenerate]: The trivial one-dimensional
    representation yields O_X̌.
  AutomorphicBundles.compactDualCoefficient_test_gl2 [compatibility]: For G=GL2/L and P the
    stabilizer of Le₁, the contracted-product bundle for χ(p)=a when pe₁=ae₁ is O_(P¹)(−1), via
    [g,v]↦vge₁; the inverse character χ⁻¹ gives O_(P¹)(1). The cohomological Hodge convention must
    declare which of these characters is used.
  AutomorphicBundles.compactDualCoefficient_test_unipotent [non-example]: The standard P
    representation with a nontrivial upper-triangular unipotent action is not isomorphic as P-module
    to its associated graded inflation.
Inputs: AutomorphicBundles:B0/central-split-quotient,
  AutomorphicBundles:B0/hodge-parabolic-convention, ShimuraData:D3/reflex-flag-descent,
  AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent

AutomorphicBundles:B0/homogeneous-hodge-torsor [construction] AutomorphicBundles.homogeneousHodgeTorsor
Pull the complex principal Pᶜ torsor Gᶜ_C→X̌_C back along the Borel embedding X→X̌(C). Its sections
  are frames identifying the varying Hodge filtration with the reference filtration. The quotient by
  U(Pᶜ) is the Levi torsor of graded frames; no flat connection on this Levi torsor is asserted.
API:
  AutomorphicBundles.homogeneousHodgeTorsor_filtered_frames [characterisation]: A point is a
    tensor-compatible frame identifying the reference and varying filtrations.
  AutomorphicBundles.homogeneousHodgeTorsor_graded [projection]: The U quotient parametrizes
    individual frames of the graded pieces.
  AutomorphicBundles.homogeneousHodgeTorsor_pullback_coefficient [compatibility]: Associating a P
    coefficient to this torsor is the Borel pullback of its compact-dual bundle.
Tests (examples):
  AutomorphicBundles.homogeneousHodgeTorsor_test_point [computation]: At the reference point the
    torsor has its reference frame.
  AutomorphicBundles.homogeneousHodgeTorsor_test_standard [compatibility]: For the symplectic
    standard representation the associated filtration is the Hodge exact sequence.
  AutomorphicBundles.homogeneousHodgeTorsor_test_graded [non-example]: Two filtered frames differing
    by a nonidentity unipotent element have the same graded frame, but remain distinct filtered
    frames.
Inputs: AutomorphicBundles:B0/compact-dual-coefficient, ShimuraData:D3/borel-embedding,
  ShimuraData:D3/homogeneous-variation

AutomorphicBundles:B0/analytic-coefficient [construction] AutomorphicBundles.analyticCoefficient
For a torsion-free effective arithmetic action Γ_eff on X, and a homogeneous coefficient on which
  the ineffective kernel of Γ acts trivially, descend the Borel-pullback coefficient to Γ_eff\X. On
  an adelic component the description is Γ\(G(R)×V)/K_∞ with (g,v)·k=(gk,ρ(k)⁻¹v), equipped with the
  holomorphic structure supplied by the compact-dual coefficient.
API:
  AutomorphicBundles.analyticCoefficient_local_trivial [structure]: A small quotient chart
    identifies the coefficient with its holomorphic product bundle.
  AutomorphicBundles.analyticCoefficient_section_equiv [equivalence]: Sections correspond to
    equivariant functions under the diagonal fibre relation.
  AutomorphicBundles.analyticCoefficient_change_frame [compatibility]: Changing the frame conjugates
    the transition cocycle and preserves the descended bundle.
  AutomorphicBundles.analyticCoefficient_map [functoriality]: An equivariant morphism u between the
    supplied compact-dual coefficients descends on each effective analytic quotient; in a compatible
    frame it sends the class of (x,v) to (x,u(v)).
  AutomorphicBundles.analyticCoefficient_map_id [simp]: For a fixed admitted input V, the induced
    map of the identity morphism of V is the identity on its output.
  AutomorphicBundles.analyticCoefficient_map_comp [functoriality]: For admitted composable morphisms
    u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the
    induced map of u; all datum, level, field and model hypotheses remain fixed.
Tests (examples):
  AutomorphicBundles.analyticCoefficient_test_trivial [degenerate]: The trivial representation gives
    the holomorphic structure sheaf on Γ_eff\X.
  AutomorphicBundles.analyticCoefficient_test_odd [non-example]: The −1 stabilizer acts by −1 on an
    odd-weight GL2 coefficient, so that coefficient does not descend to the coarse quotient unless
    that stabilizer is removed.
  AutomorphicBundles.analyticCoefficient_test_rank [characterisation]: The local rank equals dim V,
    independent of the arithmetic component.
Inputs: AutomorphicBundles:B0/ineffective-fibre-descent,
  AutomorphicBundles:B0/homogeneous-hodge-torsor

AutomorphicBundles:B0/sections-equivariant [comparison] AutomorphicBundles.sectionsEquivariant
For a principal right P torsor T→S and the associated coefficient with (t,v)~(tp,ρ(p)⁻¹v), a section
  is equivalent to a function f:T→V with f(tp)=ρ(p)⁻¹f(t), in the algebraic or analytic category of
  that torsor. With a left arithmetic action the corresponding frame factor satisfies
  J(gh,x)=J(g,hx)J(h,x).
Inputs: AutomorphicBundles:B0/compact-dual-coefficient, AutomorphicBundles:B0/analytic-coefficient

AutomorphicBundles:B0/coefficient-galois-descent [construction] AutomorphicBundles.coefficientGaloisDescent
For a finite Galois extension L/E, a coefficient on the compact-dual form and its semilinear
  isomorphisms d_σ:σ*J→J satisfying d_στ=d_σ∘σ*d_τ descend the coefficient to E. The same applies to
  the compatible associated coefficient on the canonical torsor. If only the highest weight is
  given, first compute its Galois stabilizer; do not assume a splitting-field representation is
  defined over the reflex field.
API:
  AutomorphicBundles.coefficientGaloisDescent_base_change [compatibility]: The descended coefficient
    tensored with L is the original J with its given descent maps.
  AutomorphicBundles.coefficientGaloisDescent_unique [extensionality]: Morphisms over E are exactly
    L-morphisms compatible with all d_σ.
  AutomorphicBundles.coefficientGaloisDescent_associate [functoriality]: Descent commutes with
    association to a descended principal torsor.
  AutomorphicBundles.coefficientGaloisDescent_map [functoriality]: A coefficient morphism commuting
    with the actual semilinear Galois descent isomorphisms descends uniquely; its base change is the
    supplied split-coefficient morphism.
  AutomorphicBundles.coefficientGaloisDescent_map_id [simp]: For a fixed admitted input V, the
    induced map of the identity morphism of V is the identity on its output.
  AutomorphicBundles.coefficientGaloisDescent_map_comp [functoriality]: For admitted composable
    morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with
    the induced map of u; all datum, level, field and model hypotheses remain fixed.
Tests (examples):
  AutomorphicBundles.coefficientGaloisDescent_test_identity [degenerate]: For L=E and the identity
    datum descent returns J.
  AutomorphicBundles.coefficientGaloisDescent_test_parallel [computation]: For a real quadratic F
    split by L/E, the split tensor of the two embedding-labelled Hodge lines with equal exponent r
    admits the factor-swap descent isomorphism; applying the nontrivial permutation twice is
    identity. Retain the actual descent datum of the underlying HB family.
  AutomorphicBundles.coefficientGaloisDescent_test_nonparallel [non-example]: For a real quadratic F
    and weight (k1,k2) with k1≠k2, the nontrivial embedding permutation does not fix the label; it
    cannot be descended by declaring all d_σ identities.
Inputs: AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent,
  AutomorphicBundles:B0/compact-dual-coefficient

AutomorphicBundles:B0/geometric-analytic-coefficients [comparison] AutomorphicBundles.geometricAnalyticCoefficients
For an algebraic canonical principal bundle Π→S and its compact-dual map γ, analytification of the
  algebraically associated J coefficient equals the descended analytic coefficient of J. This
  follows by analytifying the actual descent maps. It is not an assertion that every analytic bundle
  on nonproper S is algebraic; GAGA is used only on a proper toroidal model.
Inputs: AutomorphicBundles:B0/coefficient-galois-descent,
  AutomorphicBundles:B0/analytic-coefficient, ComplexComparisonPartII:C0

### Layer B1


AutomorphicBundles:B1/finite-tensor-stabilizer [theorem] AutomorphicBundles.finiteTensorStabilizer
Over a characteristic-zero field k, let G↪GL(V) be a faithful finite-dimensional algebraic
  representation of a reductive algebraic group. There is a finite family of tensors in finite
  direct sums of V^{⊗m}⊗(V∨)^{⊗n} whose simultaneous scheme-theoretic stabilizer in GL(V) is G.
  Tensor spaces, duals and scalar action are part of the statement; preserving a line instead of its
  tensor generator is insufficient.
Inputs: none

AutomorphicBundles:B1/absolute-hodge-propagation [theorem] AutomorphicBundles.absoluteHodgePropagation
For an abelian variety over an algebraically closed characteristic-zero field admitting an embedding
  into C, every rational Hodge tensor formed from H¹, its dual and Tate twists is absolute Hodge. In
  a connected smooth proper abelian family, a horizontal tensor remaining of type (0,0) and absolute
  at one fibre is absolute at every fibre. The theorem does not assert such tensors are algebraic
  cycles, nor does it apply to arbitrary general-data motives.
Inputs: AbelianSchemesAndArithmeticModuli:A4

AutomorphicBundles:B1/hodge-tensor-realizations [construction] AutomorphicBundles.hodgeTensorRealizations
For a Hodge-type datum, a chosen symplectic embedding, and sufficiently small level with universal
  abelian scheme A/S over its canonical reflex field E, construct the Betti, étale and de Rham
  realizations of a finite defining family of rational Hodge tensors in H=H₁(A)=(R¹π_* )∨, including
  Tate twists. De Rham tensors are horizontal, in the required filtration, and defined over E; their
  descent uses Galois invariance from the level tower and absolute-Hodge compatibility, not merely
  their being of type (0,0) over C.
API:
  AutomorphicBundles.hodgeTensorRealizations_horizontal [structure]: The de Rham defining tensors
    satisfy ∇sα,dR=0.
  AutomorphicBundles.hodgeTensorRealizations_compare [compatibility]: The Betti–de Rham and
    Betti–étale comparisons send each sα to its named realization, with the same Tate normalization.
  AutomorphicBundles.hodgeTensorRealizations_galois [functoriality]: After base change to Ebar the
    named tensor sections are fixed by Gal(Ebar/E), hence descend to E.
Tests (examples):
  AutomorphicBundles.hodgeTensorRealizations_test_endomorphism [compatibility]: An algebraic
    endomorphism of A acts compatibly in all three degree-one realizations.
  AutomorphicBundles.hodgeTensorRealizations_test_polarization [characterisation]: The polarization
    tensor is valued in the specified Tate line; ignoring that line changes GSp to Sp.
  AutomorphicBundles.hodgeTensorRealizations_test_zero [degenerate]: Adding a zero tensor does not
    change the simultaneous stabilizer or the descended frame torsor.
Inputs: AutomorphicBundles:B1/finite-tensor-stabilizer,
  AutomorphicBundles:B1/absolute-hodge-propagation, AbelianSchemesAndArithmeticModuli:A4,
  PELModuli:M3, ShimuraVarieties:V5, ShimuraVarieties:V8

AutomorphicBundles:B1/tensor-frame-torsor [construction] AutomorphicBundles.tensorFrameTorsor
For the Hodge-type H and defining tensors above, the functor T(U)={η:V⊗O_U≃H_dR|U : η(sα)=sα,dR} is
  represented by a principal G_E torsor on S. The right action is η·g=η∘g. Comparison supplies local
  nonemptiness; being a closed tensor-preserving subfunctor of Isom alone does not prove it is a
  torsor. When required, push out to the coefficient group Gᶜ.
API:
  AutomorphicBundles.tensorFrameTorsor_frame [projection]: A T point is an invertible frame of H
    carrying every reference tensor to its de Rham realization.
  AutomorphicBundles.tensorFrameTorsor_right_action [structure]: η·g=η∘g, and T×G→T×_S T is an
    isomorphism.
  AutomorphicBundles.tensorFrameTorsor_coefficient [compatibility]: T×^G V identifies with H_dR for
    the chosen faithful coefficient.
Tests (examples):
  AutomorphicBundles.tensorFrameTorsor_test_identity [computation]: For a constant tensor-equipped
    bundle V⊗O_S, identity is a global frame and T≃G×S.
  AutomorphicBundles.tensorFrameTorsor_test_sp [non-example]: For a polarization with a separately
    varying similitude line, the correct tensor frame group is GSp; fixing the alternating form with
    no Tate line incorrectly yields Sp.
  AutomorphicBundles.tensorFrameTorsor_test_rank [characterisation]: An isomorphism frame exists
    only between equal-rank modules and must preserve all tensors, not just the polarization.
Inputs: AutomorphicBundles:B1/finite-tensor-stabilizer,
  AutomorphicBundles:B1/hodge-tensor-realizations, AutomorphicBundles:B0/central-split-quotient

AutomorphicBundles:B1/filtration-reduction [construction] AutomorphicBundles.filtrationReduction
The Hodge filtration on the tensor-equipped dR realization determines a Gᶜ-equivariant algebraic map
  γ:Tᶜ→X̌_E. Over an extension L/E where a reference parabolic P_H is defined, γ⁻¹(reference flag)
  is a principal P_H torsor. Its pushout along P_H→M is the torsor of graded frames. Over E, retain
  the descended flag variety rather than inventing an E-rational cocharacter.
API:
  AutomorphicBundles.filtrationReduction_flag_map [projection]: γ(ηg)=g⁻¹γ(η) in the chosen
    right-torsor convention.
  AutomorphicBundles.filtrationReduction_parabolic_fibre [characterisation]: After choosing the
    reference flag over L, its inverse image is exactly the tensor-preserving filtered frames.
  AutomorphicBundles.filtrationReduction_levi [compatibility]: Quotienting the filtered-frame torsor
    by U identifies frames of gr_F H individually.
Tests (examples):
  AutomorphicBundles.filtrationReduction_test_siegel [compatibility]: For the standard Siegel family
    γ records the Hodge subbundle, with its actual Lagrangian condition.
  AutomorphicBundles.filtrationReduction_test_zero [degenerate]: For a rank-zero coefficient the
    induced filtration is zero, even though the principal datum remains the same.
  AutomorphicBundles.filtrationReduction_test_no_point [non-example]: For the quaternionic Shimura
    curve of the division algebra B=(−1,3)/Q, the compact dual is the Severi–Brauer conic of B and
    has no Q-point; the rational γ:Π→X̌_Q does not furnish a section Spec Q→X̌_Q. B is split over R,
    while 3 is not a norm from Q(i), so this tests an actual nonsplit flag form.
Inputs: AutomorphicBundles:B1/tensor-frame-torsor, AutomorphicBundles:B0/homogeneous-hodge-torsor,
  ShimuraData:D3/reflex-flag-descent

AutomorphicBundles:B1/hodge-canonical-principal-bundle [theorem] AutomorphicBundles.hodgeCanonicalPrincipalBundle
For a Hodge-type Shimura datum and a sufficiently small effective level, Tᶜ with γ, its flat Gᶜ
  connection and its Hecke-tower action is the canonical standard principal bundle over E. Its
  analytification agrees with the homogeneous standard bundle, and its CM restriction satisfies the
  reciprocity normalization. The result is on characteristic-zero canonical models; it does not
  produce arbitrary-prime integral models.
Inputs: AutomorphicBundles:B1/tensor-frame-torsor, AutomorphicBundles:B1/filtration-reduction,
  ShimuraVarieties:V4

AutomorphicBundles:B1/embedding-independence [theorem] AutomorphicBundles.embeddingIndependence
Two faithful symplectic embeddings of the same Hodge-type datum give canonically isomorphic Gᶜ
  torsors, compact-dual maps and associated realizations over E, compatibly with composition. The
  canonical identification is induced by tensor constructions/projectors or by a common direct-sum
  embedding; it preserves tensors and filtration, not merely underlying ranks.
Inputs: AutomorphicBundles:B1/hodge-canonical-principal-bundle,
  AutomorphicBundles:B1/hodge-tensor-realizations, AutomorphicBundles:B1/finite-tensor-stabilizer

AutomorphicBundles:B1/cm-principal-normalization [comparison] AutomorphicBundles.cmPrincipalNormalization
On a CM subdatum (T,{h}) the canonical principal bundle and its Gᶜ pushout agree with the
  tensor/period torsor specified by the CM reciprocity law. For σ∈Aut(C), the conjugation
  isomorphism is normalized by that period torsor and the same Artin reciprocity convention as V4.
  This is an isomorphism of torsors, not a choice of a canonical rational frame or canonical complex
  period.
Inputs: AutomorphicBundles:B1/hodge-canonical-principal-bundle, ShimuraVarieties:V4

AutomorphicBundles:B1/abelian-canonical-principal-bundle [theorem] AutomorphicBundles.abelianCanonicalPrincipalBundle
The canonical principal bundle construction extends from Hodge-type to abelian-type data by
  connected components, central isogenies and finite quotients with trivial fibre-kernel action,
  then induction to the full Shimura tower. It is independent of the chosen Hodge-type cover and
  agrees with the CM normalization. The centre of the coefficient group and the actual arithmetic
  kernel remain visible.
Inputs: AutomorphicBundles:B1/hodge-canonical-principal-bundle,
  AutomorphicBundles:B1/embedding-independence, AutomorphicBundles:B1/cm-principal-normalization,
  AutomorphicBundles:B0/ineffective-fibre-descent, ShimuraVarieties:V6

AutomorphicBundles:B1/principal-hecke-pullback [comparison] AutomorphicBundles.principalHeckePullback
At finite levels K′⊂K and along a Hecke translation a, the canonical principal bundles identify
  under the actual finite étale tower maps, preserving γ, the flat connection and CM normalization.
  Associated coefficients carry induced pullback isomorphisms with identity/composition laws. This
  is not the pull–trace action on cohomology owned by B5.
Inputs: AutomorphicBundles:B1/abelian-canonical-principal-bundle, ShimuraVarieties:V1,
  ShimuraVarieties:V8

### Layer B1.general


AutomorphicBundles:B1.general/connected-principal-conjugation [theorem] AutomorphicBundles.connectedPrincipalConjugation
For a connected Shimura datum (G,X) with G semisimple simply connected, σ∈Aut(C) and a special point
  x, construct the σ-conjugate connected standard principal bundle with an algebraic normalized
  isomorphism compatible with its flat connection, compact-dual map, connected Hecke group and the
  period torsor at x. Under the V7 identification of conjugate data, the isomorphism is independent
  of auxiliary choices.
Inputs: AutomorphicBundles:B1/abelian-canonical-principal-bundle, ShimuraVarieties:V7,
  AutomorphicBundles:B1.general/general-connected-reduction

AutomorphicBundles:B1.general/adjoint-jet-realization [theorem] AutomorphicBundles.adjointJetRealization
In the connected semisimple simply connected setting, the adjoint compact-dual coefficient embeds
  equivariantly into the second-jet bundle of the compact-dual tangent bundle. The induced algebraic
  automorphic jet comparison controls the adjoint representation and reduces
  continuity/normalization of principal conjugation to algebraic geometric data. This uses the
  corrected jet argument, not Harris’s withdrawn 1984 §3.5 proof.
Inputs: ShimuraData:D3/compact-dual, ShimuraVarieties:V7

AutomorphicBundles:B1.general/general-connected-reduction [theorem] AutomorphicBundles.generalConnectedReduction
In Milne’s connected semisimple simply connected principal-bundle conjugation problem, the corrected
  §9 completion combines adjoint second-jet control with the specified type-A1 subdata to obtain the
  normalized principal comparison. After the prescribed auxiliary totally real extension, those A1
  subgroups generate G as an algebraic group by the root/Lie-algebra argument of Lemma 9.5. The
  rational-point step uses §9.2’s special-torus generation and auxiliary local-isotropy/simplicity
  argument; it does not assume Proposition 8.1’s stronger rational-point generation assertion,
  flagged as conjectural in footnote 14. Lemma 9.3 supplies continuity; the normalized compact-dual
  map and connection are preserved.
Inputs: AutomorphicBundles:B1.general/adjoint-jet-realization,
  AutomorphicBundles:B1/abelian-canonical-principal-bundle, ShimuraVarieties:V7

AutomorphicBundles:B1.general/general-principal-model [theorem] AutomorphicBundles.generalPrincipalModel
For a general pure Shimura datum satisfying Milne II (2.1), the standard Gᶜ principal bundle on the
  neat effective canonical tower has a canonical algebraic model over its reflex field E. Its
  analytification is the homogeneous standard bundle, with the canonical flat connection. Continuous
  effective Weil descent is proved before inferring a model from the conjugation cocycle.
Inputs: AutomorphicBundles:B1.general/general-connected-reduction,
  AutomorphicBundles:B0/central-split-quotient, ShimuraVarieties:V7, ShimuraVarieties:V8.general

AutomorphicBundles:B1.general/general-compact-dual-map [theorem] AutomorphicBundles.generalCompactDualMap
For the general standard principal model Π_E, its complex compact-dual map γ descends as a
  Gᶜ-equivariant algebraic map Π_E→X̌_E over the reflex field. The target is the descended
  parabolic-type variety and need not have an E-point. The selected μ and P may require a larger
  field.
Inputs: AutomorphicBundles:B1.general/general-principal-model, ShimuraData:D3/reflex-flag-descent

AutomorphicBundles:B1.general/general-conjugation-cocycle [theorem] AutomorphicBundles.generalConjugationCocycle
The general canonical principal model and γ admit normalized conjugation isomorphisms for
  automorphisms of C, compatible with the full Hecke action and flat connection; the two-step
  conjugation equals the one-step comparison through the canonically twisted datum. Their
  independence of the normalizing special point supplies the cocycle. The CM uniqueness
  characterization which also specifies rational Betti structure requires the weight in Gᶜ to be
  Q-defined as in Milne III Remark 4.5, final paragraph, and Theorem 6.2.
Inputs: AutomorphicBundles:B1.general/general-principal-model,
  AutomorphicBundles:B1.general/general-compact-dual-map,
  AutomorphicBundles:B1.general/general-connected-reduction, ShimuraVarieties:V7

### Layer B2


AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer [construction] AutomorphicBundles.automorphicVectorBundle
For the canonical Gᶜ torsor Π→S over E with γ:Π→X̌_E, and a Gᶜ-equivariant coefficient J on X̌ over
  its actual field L/E, descend γ*J along Π_L→S_L to a locally free bundle V(J). Over a field with a
  reference P_H, this is the associated bundle of the filtered P_H torsor. For a Levi M coefficient
  inflate along P_H→M. This construction includes general P coefficients without identifying them
  with Levi coefficients.
API:
  AutomorphicBundles.automorphicVectorBundle_pullback [characterisation]: Π*V(J)≃γ*J with the
    specified Gᶜ descent action.
  AutomorphicBundles.automorphicVectorBundle_levi [compatibility]: For ρ:M→GL(V), V(Jρ)≃P_dR×^{P_H}V
    after inflation.
  AutomorphicBundles.automorphicVectorBundle_tensor [functoriality]: V preserves tensor products,
    duals and the unit through canonical descent isomorphisms.
  AutomorphicBundles.automorphicVectorBundle_scalar_extension [compatibility]: V(J)⊗_L L′≃V(J⊗_L L′)
    for every field extension L′/L.
  AutomorphicBundles.automorphicVectorBundle_map [functoriality]: A Pᶜ-equivariant linear map u:V→W
    induces the associated coefficient map V(u) on the fixed canonical model; after pulling back to
    the principal torsor it is the constant map u.
  AutomorphicBundles.automorphicVectorBundle_map_id [simp]: For a fixed admitted input V, the
    induced map of the identity morphism of V is the identity on its output.
  AutomorphicBundles.automorphicVectorBundle_map_comp [functoriality]: For admitted composable
    morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with
    the induced map of u; all datum, level, field and model hypotheses remain fixed.
Tests (examples):
  AutomorphicBundles.automorphicVectorBundle_test_unit [degenerate]: For J=O_X̌ with trivial fibre
    action, V(J)=O_S.
  AutomorphicBundles.automorphicVectorBundle_test_hodge [compatibility]: In the Siegel cohomology
    convention, the Hodge-line/standard Levi coefficient gives e*Ω¹_A/S, not its inverse.
  AutomorphicBundles.automorphicVectorBundle_test_nonflat [non-example]: For the upper-triangular P
    in GL2, χ(diag(a,d))=a defines a rank-one associated automorphic coefficient. It is not the
    restriction of a one-dimensional GL2 representation: det^n restricts to a^n d^n and cannot equal
    a for any n. The full-group flat-connection functor therefore cannot be applied to this
    coefficient by declaring χ to extend.
Inputs: AutomorphicBundles:B1/abelian-canonical-principal-bundle,
  AutomorphicBundles:B1/filtration-reduction, AutomorphicBundles:B0/compact-dual-coefficient,
  AutomorphicBundles:B0/coefficient-galois-descent,
  AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent

AutomorphicBundles:B2/automorphic-analytic-comparison [comparison] AutomorphicBundles.automorphicAnalyticComparison
Over an embedding L↪C, the analytification of V(J) is canonically the arithmetic quotient of the
  Borel pullback of J. Its sections in a homogeneous frame obey the same transformation law. The
  comparison preserves the filtered P coefficient and the M graded coefficient separately.
Inputs: AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer,
  AutomorphicBundles:B0/geometric-analytic-coefficients, AutomorphicBundles:B0/sections-equivariant

AutomorphicBundles:B2/levi-highest-weight-convention [comparison] AutomorphicBundles.leviHighestWeightConvention
Over a characteristic-zero splitting field of M with a chosen Borel and torus, an M-dominant
  integral highest weight λ determines the irreducible algebraic representation V_λ. In BCGP Example
  3.2.18 the associated sheaf L_λ has fibre V_λ, of highest weight λ. Its
  left-coset/right-translation realization is (π_*O_(U_P\G))[B_M=−w₀^Mλ]; this function-equivariance
  character does not relabel the fibre as V_(−w₀^Mλ). The dual representation separately has highest
  weight −w₀^Mλ. Retain the central/similitude character and the Hodge/opposite-Hodge–Tate switch.
  Over a nonsplit field use the actual Galois descent datum; a label alone does not define a
  rational coefficient.
Inputs: AutomorphicBundles:B0/hodge-parabolic-convention,
  AutomorphicBundles:B0/compact-dual-coefficient, AutomorphicBundles:B0/coefficient-galois-descent,
  tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-3-maximal-torus-weights-and-the-highest-weight-classification

AutomorphicBundles:B2/betti-coefficient-local-system [construction] AutomorphicBundles.bettiCoefficientLocalSystem
For a finite-dimensional rational representation W of Gᶜ and a neat effective arithmetic component
  Γ\X, form the Betti local system Γ\(X×W) with its arithmetic monodromy. Its associated holomorphic
  flat bundle is the full-group automorphic bundle. If the projected weight is Q-defined and W is
  pure of one weight, it has the rational variation of Hodge structure from D3; mixed-weight
  representations are treated weightwise.
API:
  AutomorphicBundles.bettiCoefficientLocalSystem_monodromy [characterisation]: On Γ\X the local
    monodromy is the representation of Γ on W.
  AutomorphicBundles.bettiCoefficientLocalSystem_tensor [functoriality]: Betti coefficients preserve
    tensor products and duals.
  AutomorphicBundles.bettiCoefficientLocalSystem_complex_flat [compatibility]: W_B⊗_Q O_an is the
    full-group coefficient with its flat connection.
  AutomorphicBundles.bettiCoefficientLocalSystem_map [functoriality]: A full-Gᶜ representation
    intertwiner u:V→W induces a map of the descended Betti local systems with fibre u and preserves
    monodromy.
  AutomorphicBundles.bettiCoefficientLocalSystem_map_id [simp]: For a fixed admitted input V, the
    induced map of the identity morphism of V is the identity on its output.
  AutomorphicBundles.bettiCoefficientLocalSystem_map_comp [functoriality]: For admitted composable
    morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with
    the induced map of u; all datum, level, field and model hypotheses remain fixed.
Tests (examples):
  AutomorphicBundles.bettiCoefficientLocalSystem_test_unit [degenerate]: For W=Q with trivial
    action, W_B is the constant rational local system.
  AutomorphicBundles.bettiCoefficientLocalSystem_test_standard [compatibility]: For the Siegel
    homology representation, W_B=H₁ of the actual universal abelian family, not R¹π_*Q without a
    dual.
  AutomorphicBundles.bettiCoefficientLocalSystem_test_levi [non-example]: The GL2 upper-triangular
    Levi character (a,d)↦a is not the restriction of any one-dimensional GL2 representation (whose
    character is det^n). It cannot be supplied as a full-group rank-one Betti input without an
    extension.
Inputs: AutomorphicBundles:B0/central-split-quotient,
  AutomorphicBundles:B0/ineffective-fibre-descent,
  AutomorphicBundles:B2/automorphic-analytic-comparison, ShimuraData:D3/homogeneous-variation

AutomorphicBundles:B2/etale-coefficient-local-system [construction] AutomorphicBundles.etaleCoefficientLocalSystem
For a rational Gᶜ representation W, a prime ℓ and a level with compact ℓ-component preserving a Z_ℓ
  lattice in W⊗Q_ℓ, descend that lattice along the actual canonical ℓ-level étale tower to a lisse
  Z_ℓ sheaf, and invert ℓ to obtain W_ℓ on S_E. Changing stable lattices gives canonically the same
  Q_ℓ sheaf. This is a construction over E with Galois action, not just a local system on S(C).
API:
  AutomorphicBundles.etaleCoefficientLocalSystem_finite_level [projection]: The lattice modulo ℓⁿ is
    the finite étale sheaf associated to the chosen level quotient action.
  AutomorphicBundles.etaleCoefficientLocalSystem_lattice_independence [equivalence]: After tensoring
    with Q_ℓ the result is independent of a stable lattice through the common rational
    representation.
  AutomorphicBundles.etaleCoefficientLocalSystem_hecke [functoriality]: Level and Hecke pullbacks
    preserve the descended sheaf and its canonical arithmetic Galois structure.
  AutomorphicBundles.etaleCoefficientLocalSystem_map [functoriality]: A continuous full-Gᶜ
    Q_ℓ-representation intertwiner u:V→W induces the map of the descended arithmetic ℓ-adic local
    systems; it respects the actual finite-level tower and arithmetic Galois action.
  AutomorphicBundles.etaleCoefficientLocalSystem_map_id [simp]: For a fixed admitted input V, the
    induced map of the identity morphism of V is the identity on its output.
  AutomorphicBundles.etaleCoefficientLocalSystem_map_comp [functoriality]: For admitted composable
    morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with
    the induced map of u; all datum, level, field and model hypotheses remain fixed.
Tests (examples):
  AutomorphicBundles.etaleCoefficientLocalSystem_test_unit [degenerate]: The trivial representation
    gives the constant Q_ℓ sheaf over E.
  AutomorphicBundles.etaleCoefficientLocalSystem_test_abelian [compatibility]: The symplectic
    homology coefficient gives (R¹π_*Q_ℓ)∨ with its arithmetic action.
  AutomorphicBundles.etaleCoefficientLocalSystem_test_arithmetic [non-example]: Over Spec Q the
    étale coefficients Q_ℓ and Q_ℓ(1) have the same one-dimensional geometric/complex realization
    but different arithmetic Galois actions (trivial versus cyclotomic). Forgetting the arithmetic
    tower/action cannot characterize the descended coefficient.
Inputs: AutomorphicBundles:B0/central-split-quotient,
  AutomorphicBundles:B1/principal-hecke-pullback, ShimuraVarieties:V8, ShimuraVarieties:V1

AutomorphicBundles:B2/filtered-de-rham-coefficient [construction] AutomorphicBundles.filteredDeRhamCoefficient
For an algebraic full Gᶜ representation W over a number field L containing E, the canonical
  principal bundle gives a locally free filtered coefficient W_dR with integrable connection ∇ and
  Griffiths transversality. Its filtration is induced by γ. In Hodge type it agrees with the
  matching tensor construction in the universal family’s relative H₁,dR; regular-singular boundary
  extension is a separate B3 theorem.
API:
  AutomorphicBundles.filteredDeRhamCoefficient_connection [structure]: ∇²=0 and the connection
    descends from Π.
  AutomorphicBundles.filteredDeRhamCoefficient_filtration [projection]: F^aW_dR is the locally
    direct-summand filtration encoded by γ.
  AutomorphicBundles.filteredDeRhamCoefficient_transversality [compatibility]: ∇F^a⊂F^{a−1}⊗Ω¹_S;
    tensors and duals carry the induced filtered connections.
  AutomorphicBundles.filteredDeRhamCoefficient_map [functoriality]: A full-Gᶜ representation
    intertwiner induces a horizontal filtration-preserving map between the associated de Rham
    coefficients; its principal-frame map is u.
  AutomorphicBundles.filteredDeRhamCoefficient_map_id [simp]: For a fixed admitted input V, the
    induced map of the identity morphism of V is the identity on its output.
  AutomorphicBundles.filteredDeRhamCoefficient_map_comp [functoriality]: For admitted composable
    morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with
    the induced map of u; all datum, level, field and model hypotheses remain fixed.
Tests (examples):
  AutomorphicBundles.filteredDeRhamCoefficient_test_unit [degenerate]: The tensor unit is (O_S,d)
    with its weight-zero filtration.
  AutomorphicBundles.filteredDeRhamCoefficient_test_hodge [compatibility]: For H¹dR of an abelian
    family F¹=e*Ω¹_A/S and the connection is Gauss–Manin.
  AutomorphicBundles.filteredDeRhamCoefficient_test_levi [non-example]: For the GL2 upper-triangular
    Levi, (a,d)↦a does not extend to a one-dimensional GL2 representation, since no a^n d^n equals
    a. Its associated line cannot be treated as a rank-one input to the full-group filtered
    connection functor.
Inputs: AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer,
  AutomorphicBundles:B1/hodge-canonical-principal-bundle, ShimuraData:D3/homogeneous-variation,
  AbelianSchemesAndArithmeticModuli:A4

AutomorphicBundles:B2/realization-comparison [comparison] AutomorphicBundles.realizationComparison
After an embedding L↪C, for a rational Gᶜ representation W, W_B⊗Q_ℓ≃W_ℓ|S_C under the
  algebraic/analytic étale comparison, and W_B⊗O_an≃W_dR^an as flat holomorphic bundles. Under the
  Q-defined pure weight condition these respect Hodge filtrations and the rational variation. They
  preserve defining tensors, Tate twists, Hecke pullback and duals. No B_dR, crystalline or p-adic
  Hodge theorem is included.
Inputs: AutomorphicBundles:B2/betti-coefficient-local-system,
  AutomorphicBundles:B2/etale-coefficient-local-system,
  AutomorphicBundles:B2/filtered-de-rham-coefficient, AbelianSchemesAndArithmeticModuli:A4

AutomorphicBundles:B2/coefficient-tensor-hecke [theorem] AutomorphicBundles.coefficientTensorHecke
The automorphic coefficient functor and the full-group realization functors preserve tensor unit,
  tensor products, duals and morphisms, with coherent associativity/symmetry isomorphisms;
  realization comparisons commute with them. Their level and Hecke pullback identifications preserve
  this structure. Exactness is asserted in characteristic zero for the finite-dimensional algebraic
  representation categories; no all-prime semisimplicity is used.
Inputs: AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer,
  AutomorphicBundles:B1/principal-hecke-pullback, AutomorphicBundles:B2/realization-comparison

AutomorphicBundles:B2/siegel-tautological-sequence [theorem] AutomorphicBundles.siegelTautologicalSequence
On the split Siegel flag variety FL=P_HT\G over a characteristic-zero coefficient field E, with
  G=GSp_(2g) and St its standard representation, BCGP’s conventions give the G-equivariant exact
  sequence 0→L_(0,…,0,−1;1)→O_FL⊗St→L_(1,0,…,0;1)→0. Both end coefficients have rank g. Its
  algebraic analytification agrees with the same finite locally free sequence in the analytic/solid
  category once that comparison functor is supplied; no infinite-dimensional equivariant category is
  constructed here.
Inputs: AutomorphicBundles:B0/compact-dual-coefficient,
  AutomorphicBundles:B0/hodge-parabolic-convention,
  AutomorphicBundles:B2/levi-highest-weight-convention, PELModuli:M0

### Layer B2.general


AutomorphicBundles:B2.general/general-associated-model [theorem] AutomorphicBundles.generalAssociatedModel
For a general Shimura datum and a Gᶜ-equivariant compact-dual coefficient J defined over L/E,
  descent along the general canonical principal model constructs V(J) over L. It has the same
  analytic quotient, tensor/dual functoriality, Hecke pullback and coefficient-field base change as
  the abelian-type construction; σ-conjugation transports both the datum and J.
Inputs: AutomorphicBundles:B1.general/general-principal-model,
  AutomorphicBundles:B1.general/general-compact-dual-map,
  AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer,
  AutomorphicBundles:B0/coefficient-galois-descent,
  AutomorphicBundles:B1.general/general-conjugation-cocycle

AutomorphicBundles:B2.general/general-flat-realizations [theorem] AutomorphicBundles.generalFlatRealizations
For a rational representation W of the general coefficient group Gᶜ, the canonical principal model
  supplies W_dR with its integrable connection and flag filtration, and the canonical coefficient
  tower supplies W_ℓ. The analytic full-group coefficient supplies W_B and its comparison to both.
  Existence of these realizations is distinct from the unproved existence of a parameterized family
  of motives.
Inputs: AutomorphicBundles:B2.general/general-associated-model,
  AutomorphicBundles:B1.general/general-principal-model,
  AutomorphicBundles:B2/etale-coefficient-local-system,
  AutomorphicBundles:B2/realization-comparison, ShimuraVarieties:V8.general

AutomorphicBundles:B2.general/general-realization-conjugation [comparison] AutomorphicBundles.generalRealizationConjugation
Under Milne’s additional condition that the weight homomorphism projected to Gᶜ is Q-defined,
  general canonical conjugation preserves the rational Betti structure and its ℓ-adic comparison as
  well as the algebraic filtered dR coefficient. State the transported datum/representation and
  coefficient field on both sides. Without this weight condition retain the algebraic coefficient
  conjugation, but do not assert Theorem 6.2’s rational Betti conclusion.
Inputs: AutomorphicBundles:B2.general/general-flat-realizations,
  AutomorphicBundles:B1.general/general-conjugation-cocycle,
  AutomorphicBundles:B1/cm-principal-normalization

### Layer B3


AutomorphicBundles:B3/boundary-coefficient-chart [construction] AutomorphicBundles.boundaryCoefficientChart
For a neat characteristic-zero Hodge/PEL model with a smooth admissible fan, extend the filtered and
  graded coefficient frames across each toroidal cusp chart using the actual semi-abelian/1-motive
  degeneration supplied by C4. For an integral PEL specialization retain C5’s good-base hypotheses
  and finite locally free representations. Identify the extended Hodge coefficient with invariant
  differentials of the semi-abelian family, not with logarithmic differentials on the base.
API:
  AutomorphicBundles.boundaryCoefficientChart_restrict [compatibility]: Restriction to the open
    family is the given filtered/graded automorphic coefficient.
  AutomorphicBundles.boundaryCoefficientChart_hodge [characterisation]: The Hodge coefficient is
    e*Ω¹_G/SΣ of the supplied semi-abelian extension.
  AutomorphicBundles.boundaryCoefficientChart_transition [functoriality]: Degeneration-chart
    transition maps induce tensor-compatible frame/coefficient isomorphisms.
  AutomorphicBundles.boundaryCoefficientChart_map [functoriality]: A morphism of the prescribed
    boundary representations induces a chart-coefficient morphism compatible with the canonical
    frame and with every chart transition.
  AutomorphicBundles.boundaryCoefficientChart_map_id [simp]: For a fixed admitted input V, the
    induced map of the identity morphism of V is the identity on its output.
  AutomorphicBundles.boundaryCoefficientChart_map_comp [functoriality]: For admitted composable
    morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with
    the induced map of u; all datum, level, field and model hypotheses remain fixed.
Tests (examples):
  AutomorphicBundles.boundaryCoefficientChart_test_tate [compatibility]: The dimension-one Hodge
    frame at a multiplicative fibre is generated by du/u.
  AutomorphicBundles.boundaryCoefficientChart_test_unit [degenerate]: The trivial coefficient
    extends to O of each cusp chart.
  AutomorphicBundles.boundaryCoefficientChart_test_base [non-example]: The base logarithmic
    differential dq/q is not identified with the relative invariant differential du/u.
Inputs: AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer,
  ShimuraCompactifications:C4, ShimuraCompactifications:C5

AutomorphicBundles:B3/canonical-and-subcanonical-extensions [construction] AutomorphicBundles.canonicalExtension
For a neat effective characteristic-zero Shimura model S of Hodge/abelian type, a smooth projective
  admissible toroidal compactification j:S↪SΣ and an automorphic P/Levi coefficient V(J), construct
  the specified canonical locally free extension V(J)^can_Σ. It is the tensor-compatible cusp-chart
  extension characterized by its canonical boundary frames/growth model. Merely requiring j*V^can≃V
  does not characterize it: twists by boundary divisors share that open restriction. For good-base
  PEL integral coefficients use the separate C5 degeneration input.
API:
  AutomorphicBundles.canonicalExtension_restrict [compatibility]: j*V(J)^can_Σ≃V(J) with the given
    canonical open comparison.
  AutomorphicBundles.canonicalExtension_boundary_frame [characterisation]: On a canonical cusp chart
    V(J)^can is the locally free coefficient of the specified extended frame torsor.
  AutomorphicBundles.canonicalExtension_tensor [functoriality]: The canonical extension functor
    preserves tensor products, duals and the unit.
  AutomorphicBundles.canonicalExtension_unique [extensionality]: A chart-normalized extension with
    these transition maps has a unique isomorphism preserving its normalization.
  AutomorphicBundles.canonicalExtension_map [functoriality]: For a coefficient map induced by an
    algebraic Pᶜ-representation intertwiner, the prescribed canonical chart maps glue to its
    canonical extension; it restricts to the original coefficient map and respects canonical chart
    normalization. An arbitrary morphism on the open without this chart condition is not an admitted
    input.
  AutomorphicBundles.canonicalExtension_map_id [simp]: For a fixed admitted input V, the induced map
    of the identity morphism of V is the identity on its output.
  AutomorphicBundles.canonicalExtension_map_comp [functoriality]: For admitted composable morphisms
    u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the
    induced map of u; all datum, level, field and model hypotheses remain fixed.
Tests (examples):
  AutomorphicBundles.canonicalExtension_test_unit [degenerate]: The canonical extension of the unit
    coefficient is O_SΣ.
  AutomorphicBundles.canonicalExtension_test_hodge [compatibility]: For an elliptic/PEL Hodge
    coefficient it is the semi-abelian invariant-differential bundle.
  AutomorphicBundles.canonicalExtension_test_twist [non-example]: For nonempty boundary D, V^can(D)
    has the same open restriction but fails the specified canonical boundary-frame normalization.
Inputs: AutomorphicBundles:B3/boundary-coefficient-chart,
  AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer,
  ShimuraCompactifications:C2, AutomorphicBundles:B3/canonical-extension-gluing

AutomorphicBundles:B3/canonical-extension-gluing [theorem] AutomorphicBundles.canonicalExtensionGluing
The canonical boundary-chart coefficient identifications agree on toroidal overlaps, satisfy their
  cocycle law, and glue to a locally free extension functor whose restriction and chart
  normalization agree with the construction above. The resulting functor is independent of auxiliary
  frames, while its base space still depends on the fan.
Inputs: AutomorphicBundles:B3/boundary-coefficient-chart, ShimuraCompactifications:C2,
  ShimuraCompactifications:C4, AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent

AutomorphicBundles:B3/subcanonical-extension [construction] AutomorphicBundles.subcanonicalExtension
For the smooth toroidal model and reduced normal-crossings boundary divisor DΣ=SΣ\S, define
  V(J)^sub_Σ=V(J)^can_Σ⊗I_DΣ=V(J)^can_Σ(−DΣ). This is locally free because the reduced boundary is
  Cartier in this setting. The exact sequence 0→V^sub→V^can→i_*i*V^can→0 identifies subcanonical
  sections as sections vanishing on every reduced boundary component.
API:
  AutomorphicBundles.subcanonicalExtension_ideal [characterisation]: V^sub≃V^can⊗I_D with D reduced.
  AutomorphicBundles.subcanonicalExtension_inclusion [projection]: V^sub→V^can is the kernel of
    restriction to D.
  AutomorphicBundles.subcanonicalExtension_restrict [compatibility]: j*V^sub≃V, while boundary
    restriction of its included sections is zero.
  AutomorphicBundles.subcanonicalExtension_map [functoriality]: A coefficient morphism u^can induces
    u^sub=u^can⊗id_(I_D); the boundary inclusions commute with u^sub and u^can.
  AutomorphicBundles.subcanonicalExtension_map_id [simp]: For a fixed admitted input V, the induced
    map of the identity morphism of V is the identity on its output.
  AutomorphicBundles.subcanonicalExtension_map_comp [functoriality]: For admitted composable
    morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with
    the induced map of u; all datum, level, field and model hypotheses remain fixed.
Tests (examples):
  AutomorphicBundles.subcanonicalExtension_test_empty [degenerate]: For an empty boundary,
    V^sub=V^can.
  AutomorphicBundles.subcanonicalExtension_test_crossing [computation]: On Spec k[q1,q2] with
    reduced D=V(q1q2), the unit subcanonical ideal is (q1q2), so sections vanish on both components.
  AutomorphicBundles.subcanonicalExtension_test_multiplicity [non-example]: For a full divisor 2D,
    V^can(−2D) is not the reduced-boundary subcanonical extension.
Inputs: AutomorphicBundles:B3/canonical-and-subcanonical-extensions, ShimuraCompactifications:C2

AutomorphicBundles:B3/refinement-canonical-extension [comparison] AutomorphicBundles.refinementCanonicalExtension
For a refinement f:SΣ′→SΣ between smooth admissible toroidal models, f*V^can_Σ≃V^can_Σ′. There is a
  natural map f*V^sub_Σ→V^sub_Σ′ since f*DΣ≥DΣ′, but these subcanonical sheaves are not generally
  equal under pullback. Under the toric refinement ideal-pushforward condition f_*I_DΣ′=I_DΣ and
  f_*O=O, the projection formula gives f_*V^sub_Σ′≃V^sub_Σ and f_*V^can_Σ′≃V^can_Σ.
Inputs: AutomorphicBundles:B3/canonical-and-subcanonical-extensions,
  AutomorphicBundles:B3/subcanonical-extension, ShimuraCompactifications:C3

AutomorphicBundles:B3/fan-independent-sections [theorem] AutomorphicBundles.fanIndependentSections
For any two smooth projective admissible fans with a common refinement, pullback and the pushforward
  comparisons identify H⁰(SΣ,V^can_Σ) and H⁰(SΣ,V^sub_Σ) canonically across the fans. These
  identifications are transitive and compatible with morphisms defined on common compatible
  refinements. This is independence of section spaces, not equality of sheaves on different
  compactifications, and it does not assert all higher direct images vanish.
Inputs: AutomorphicBundles:B3/refinement-canonical-extension, ShimuraCompactifications:C3

AutomorphicBundles:B3/logarithmic-connection-extension [construction] AutomorphicBundles.logarithmicConnectionExtension
For a full Gᶜ coefficient with its regular-singular flat connection, on a neat level with unipotent
  local monodromy around the smooth reduced boundary, extend to the Deligne logarithmic bundle with
  nilpotent residues (the zero-exponent normalization). Its underlying bundle agrees with the
  canonical automorphic extension. Retain the Hodge filtration extension with Griffiths
  transversality. For non-unipotent levels one must choose a residue interval and prove the
  corresponding comparison separately.
API:
  AutomorphicBundles.logarithmicConnectionExtension_restrict [compatibility]: Restriction gives the
    original integrable flat connection.
  AutomorphicBundles.logarithmicConnectionExtension_residue [structure]: Each boundary residue is
    nilpotent in the unipotent zero-exponent normalization.
  AutomorphicBundles.logarithmicConnectionExtension_tensor [functoriality]: In that normalization
    the logarithmic extension preserves tensor products and duals, with induced residue actions.
  AutomorphicBundles.logarithmicConnectionExtension_map [functoriality]: A horizontal map between
    the admitted regular-singular full-group coefficients extends to a horizontal map between their
    normalized logarithmic extensions and commutes with the residues.
  AutomorphicBundles.logarithmicConnectionExtension_map_id [simp]: For a fixed admitted input V, the
    induced map of the identity morphism of V is the identity on its output.
  AutomorphicBundles.logarithmicConnectionExtension_map_comp [functoriality]: For admitted
    composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map
    of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.
Tests (examples):
  AutomorphicBundles.logarithmicConnectionExtension_test_unit [degenerate]: The unit coefficient
    extends to (O_SΣ,d) with zero residues.
  AutomorphicBundles.logarithmicConnectionExtension_test_tate [computation]: For a nodal elliptic
    degeneration the rank-two coefficient has nonzero nilpotent monodromy residue, while its
    determinant has zero residue.
  AutomorphicBundles.logarithmicConnectionExtension_test_nonunipotent [non-example]: A rank-one
    local system with monodromy −1 cannot be put in a nilpotent-residue normalization without a
    cover or a different exponent choice.
Inputs: AutomorphicBundles:B2/filtered-de-rham-coefficient,
  AutomorphicBundles:B3/canonical-and-subcanonical-extensions,
  AutomorphicBundles:B3/boundary-coefficient-chart

AutomorphicBundles:B3/minimal-coherent-pushforward [construction] AutomorphicBundles.minimalCoherentPushforward
For the proper toroidal-to-minimal map π:SΣ→Smin between noetherian characteristic-zero models,
  define the minimal coefficient π_*V^can. It is coherent, with the same global sections as V^can.
  No local freeness on the minimal boundary is claimed. Fan independence follows through the
  degree-zero refinement comparison.
API:
  AutomorphicBundles.minimalCoherentPushforward_sections [compatibility]:
    H⁰(Smin,π_*V^can)=H⁰(SΣ,V^can).
  AutomorphicBundles.minimalCoherentPushforward_coherent [structure]: Proper pushforward of the
    coherent canonical coefficient is coherent.
  AutomorphicBundles.minimalCoherentPushforward_refinement [functoriality]: Compatible fan
    refinements induce a canonical isomorphism of these degree-zero pushforwards.
  AutomorphicBundles.minimalCoherentPushforward_map [functoriality]: For a morphism u:F→G of the
    admitted canonical or subcanonical coefficients, π_*u is its coherent sheaf pushforward on the
    specified minimal model.
  AutomorphicBundles.minimalCoherentPushforward_map_id [simp]: For a fixed admitted input V, the
    induced map of the identity morphism of V is the identity on its output.
  AutomorphicBundles.minimalCoherentPushforward_map_comp [functoriality]: For admitted composable
    morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with
    the induced map of u; all datum, level, field and model hypotheses remain fixed.
Tests (examples):
  AutomorphicBundles.minimalCoherentPushforward_test_proper_open [degenerate]: When the Shimura
    variety is proper and π is identity, the minimal coefficient is V.
  AutomorphicBundles.minimalCoherentPushforward_test_rank [compatibility]: On the open S the
    pushforward restricts to V.
  AutomorphicBundles.minimalCoherentPushforward_test_singular [non-example]: On the noetherian nodal
    affine scheme Spec L[x,y]/(xy), the ideal (x,y) is coherent but is not locally free at the
    origin: its generic rank is one and its fibre modulo (x,y) has dimension two. This non-example
    tests the inference from coherent pushforward to local freeness; it does not identify that ideal
    with every automorphic coefficient.
Inputs: AutomorphicBundles:B3/canonical-and-subcanonical-extensions,
  AutomorphicBundles:B3/refinement-canonical-extension, ShimuraCompactifications:C2,
  mathlib:AlgebraicGeometry.Scheme.Modules, mathlib:AlgebraicGeometry.Scheme.Modules.presheaf,
  mathlib:SheafOfModules.sections, mathlib:AlgebraicGeometry.Scheme.Modules.pushforward,
  mathlib:AlgebraicGeometry.Scheme.Modules.pushforward_obj_obj, ShimuraVarieties:V2,
  ShimuraVarieties:V8

AutomorphicBundles:B3/minimal-hodge-line-comparison [comparison] AutomorphicBundles.minimalHodgeLineComparison
For the PEL/Hilbert scalar Hodge line under the compactification owner’s positivity and
  graded-section finite-generation hypotheses, a sufficiently divisible positive power of the
  toroidal Hodge line is pulled back from an ample invertible sheaf on the minimal compactification.
  Compare its scalar boundedness/section description with that line. This is an additional scalar
  theorem; it is not asserted for an arbitrary Levi vector coefficient or every undivided Hodge-line
  power.
Inputs: AutomorphicBundles:B3/minimal-coherent-pushforward, ShimuraCompactifications:C5,
  ShimuraCompactifications:C6, HilbertModularVarietiesAndShimuraCurves:H2

AutomorphicBundles:B3/canonical-rational-descent [theorem] AutomorphicBundles.canonicalRationalDescent
For a coefficient J defined over its number field L and a compatible smooth projective toroidal
  model over L, the canonical extension and reduced-boundary subcanonical extension are defined over
  L. Their field base-change identifications preserve the canonical chart normalization and reduced
  boundary. No all-prime integral extension is inferred from characteristic-zero descent.
Inputs: AutomorphicBundles:B3/canonical-and-subcanonical-extensions,
  AutomorphicBundles:B3/canonical-extension-gluing, AutomorphicBundles:B3/subcanonical-extension,
  AutomorphicBundles:B0/coefficient-galois-descent, ShimuraCompactifications:C2,
  AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer

### Layer B3.general


AutomorphicBundles:B3.general/general-canonical-extension [theorem] AutomorphicBundles.generalCanonicalExtension
On the characteristic-zero general-data toroidal models supplied by C2.general, the general
  automorphic coefficient V(J) admits the canonical locally free extension functor, with its
  specified analytic boundary normalization, rational descent and tensor/dual compatibility. Define
  the subcanonical extension using the reduced boundary ideal. This does not require an unspecified
  general-data semi-abelian family and does not assert an integral extension at all primes.
Inputs: AutomorphicBundles:B2.general/general-associated-model,
  AutomorphicBundles:B3/canonical-and-subcanonical-extensions,
  AutomorphicBundles:B3/subcanonical-extension, AutomorphicBundles:B3/canonical-rational-descent,
  ShimuraCompactifications:C2.general

AutomorphicBundles:B3.general/general-logarithmic-comparison [comparison] AutomorphicBundles.generalLogarithmicComparison
For a full Gᶜ representation on a general-data neat toroidal model, establish regular
  singularity/unipotent boundary monodromy and identify its canonical extension with the
  zero-exponent logarithmic flat extension; compare tensor, dual and conjugation structures. Keep
  the regular-singular proof interface explicit and do not attach a flat connection to every Levi
  coefficient.
Inputs: AutomorphicBundles:B2.general/general-flat-realizations,
  AutomorphicBundles:B3.general/general-canonical-extension,
  AutomorphicBundles:B3/logarithmic-connection-extension,
  AutomorphicBundles:B1.general/general-conjugation-cocycle, ShimuraCompactifications:C2.general

AutomorphicBundles:B3.general/general-boundary-functoriality [theorem] AutomorphicBundles.generalBoundaryFunctoriality
The general canonical and subcanonical section-space comparisons commute with fan refinements,
  compatible extensions of datum/Hecke maps and conjugation to the transported fan and coefficient.
  The subcanonical comparison uses reduced-boundary ideal pushforward, not equality under every
  pullback. A single fixed fan is not declared invariant under all Hecke translations.
Inputs: AutomorphicBundles:B3.general/general-canonical-extension,
  AutomorphicBundles:B3/refinement-canonical-extension,
  AutomorphicBundles:B3/fan-independent-sections,
  AutomorphicBundles:B1.general/general-conjugation-cocycle, ShimuraCompactifications:C3.general

### Layer B4


AutomorphicBundles:B4/classical-forms [definition] AutomorphicBundles.classicalForms
For an automorphic coefficient over L and a smooth projective toroidal model SΣ/L, define
  M(J,K;L)=H⁰(SΣ,V(J)^can). Use the fan-independent identification to regard this as the classical
  finite-level form space. The finite-dimensionality assertion uses properness/coherence, not H⁰ of
  the open variety alone. This definition applies to the general-data coefficient via
  B2.general/B3.general as well.
API:
  AutomorphicBundles.classicalForms_section [projection]: A classical form is a global section of
    the canonical coefficient.
  AutomorphicBundles.classicalForms_fan [equivalence]: Common refinements induce a canonical
    identification of M for different smooth projective fans.
  AutomorphicBundles.classicalForms_multiply [functoriality]: Tensoring sections gives
    M(J1)×M(J2)→M(J1⊗J2).
  AutomorphicBundles.classicalForms_map [functoriality]: A map u:V^can→W^can on the supplied model
    induces H⁰(u):M(V)→M(W). In the available Scheme.Modules forgetting this is exactly
    SheafOfModules.sectionsMap u.
  AutomorphicBundles.classicalForms_map_id [simp]: For a fixed admitted input V, the induced map of
    the identity morphism of V is the identity on its output.
  AutomorphicBundles.classicalForms_map_comp [functoriality]: For admitted composable morphisms
    u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the
    induced map of u; all datum, level, field and model hypotheses remain fixed.
Tests (examples):
  AutomorphicBundles.classicalForms_test_unit [degenerate]: For a proper geometrically connected
    model and trivial coefficient, M=L.
  AutomorphicBundles.classicalForms_test_curve [compatibility]: For the modular Hodge coefficient
    ω^k the space agrees with the geometric modular-form owner’s proper-curve sections.
  AutomorphicBundles.classicalForms_test_open [non-example]: For Spec L[t] with coefficient O,
    H⁰=L[t] has the infinite independent family 1,t,t²,…; it cannot replace the proper geometrically
    connected model, whose unit coefficient has H⁰=L.
  AutomorphicBundles.classicalForms_test_map_id [compatibility]: For any supplied Scheme.Modules
    coefficient V and section s, the supplied-section forgetting sends the identity coefficient map
    to s.
  AutomorphicBundles.classicalForms_test_map_comp [compatibility]: For supplied Scheme.Modules maps
    u:V→W and v:W→U, mapping a section by v∘u equals mapping first by u then by v.
  AutomorphicBundles.classicalForms_test_map_zero [degenerate]: For any supplied Scheme.Modules map
    u:V→W, its global-section map sends the compatible section whose value on every open is zero to
    the zero compatible section.
Inputs: AutomorphicBundles:B3/canonical-and-subcanonical-extensions,
  AutomorphicBundles:B3/fan-independent-sections,
  AutomorphicBundles:B3.general/general-canonical-extension,
  AutomorphicBundles:B3.general/general-boundary-functoriality,
  mathlib:AlgebraicGeometry.Scheme.Modules, mathlib:AlgebraicGeometry.Scheme.Modules.presheaf,
  mathlib:SheafOfModules.sections

AutomorphicBundles:B4/cusp-forms [definition] AutomorphicBundles.cuspForms
Define S(J,K;L)=H⁰(SΣ,V(J)^sub)=ker[M(J,K;L)→H⁰(DΣ,i*V(J)^can)]. Thus a cusp form vanishes along
  every component of the reduced boundary in the canonical frame. Its fan-independent definition
  uses the ideal-pushforward comparison; no Koecher extension theorem makes this vanishing
  automatic.
API:
  AutomorphicBundles.cuspForms_include [projection]: S(J)↪M(J) is induced by the boundary-ideal
    inclusion.
  AutomorphicBundles.cuspForms_kernel [characterisation]: A form is cuspidal iff its restriction to
    every reduced boundary component is zero.
  AutomorphicBundles.cuspForms_tensor [functoriality]: The product of a cusp form with a classical
    form is cuspidal in the tensor coefficient.
  AutomorphicBundles.cuspForms_map [functoriality]: A map between canonical coefficients induces the
    boundary-compatible map on their I_D twists and hence S(u):S(V)→S(W); the inclusions into
    classical forms commute with this map.
  AutomorphicBundles.cuspForms_map_id [simp]: For a fixed admitted input V, the induced map of the
    identity morphism of V is the identity on its output.
  AutomorphicBundles.cuspForms_map_comp [functoriality]: For admitted composable morphisms u:V→W and
    v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of
    u; all datum, level, field and model hypotheses remain fixed.
Tests (examples):
  AutomorphicBundles.cuspForms_test_empty [degenerate]: If D=∅, S(J)=M(J).
  AutomorphicBundles.cuspForms_test_constant [computation]: For nonempty boundary and trivial
    coefficient on a proper geometrically connected model, a nonzero constant is not cuspidal.
  AutomorphicBundles.cuspForms_test_crossing [characterisation]: At a two-component crossing a
    holomorphic coefficient is cuspidal iff it lies in the product ideal (q1q2), not merely (q1,q2).
Inputs: AutomorphicBundles:B3/subcanonical-extension, AutomorphicBundles:B4/classical-forms,
  AutomorphicBundles:B3/fan-independent-sections, mathlib:AlgebraicGeometry.Scheme.Modules,
  mathlib:AlgebraicGeometry.Scheme.Modules.presheaf, mathlib:SheafOfModules.sections

AutomorphicBundles:B4/automorphy-factor-cocycle-and-growth-conditions [definition] AutomorphicBundles.AutomorphyFactor
For a left action of Γ on a complex domain X and a finite-dimensional complex vector space V, a
  linear holomorphic automorphy factor is J:Γ×X→GL_C(V), holomorphic in x for each γ, with J(1,x)=1
  and J(gh,x)=J(g,hx)J(h,x). It defines f(gx)=J(g,x)f(x). Classical/cusp growth is a separate
  condition on such a holomorphic equivariant section in the specified canonical boundary frame:
  local holomorphic extension, respectively membership in its reduced boundary ideal. The algebraic
  adapter below forgets topology and retains only the normalized linear cocycle.
API:
  AutomorphicBundles.AutomorphyFactor_one [simp]: J(1,x)=id.
  AutomorphicBundles.AutomorphyFactor_mul [structure]: J(gh,x)=J(g,hx)∘J(h,x), with the indicated
    shifted base point.
  AutomorphicBundles.AutomorphyFactor_change_frame [equivalence]: A holomorphic frame change u gives
    J′(g,x)=u(gx)J(g,x)u(x)⁻¹ and an isomorphic coefficient.
  AutomorphicBundles.AutomorphyFactor_forget [projection]: Forgetting holomorphy yields the
    normalized linear cocycle input for the existing SlashAction adapter.
  AutomorphicBundles.AutomorphyFactor_ext [extensionality]: Two normalized functional factors with
    identical coefficient maps at every (k,g,x) are equal; the law proofs carry no extra data. The
    holomorphic refinement additionally retains its declared analytic hypotheses.
  AutomorphicBundles.AutomorphyFactor_change_frame_id [simp]: Gauge change by the constant identity
    frame returns the original normalized functional factor.
  AutomorphicBundles.AutomorphyFactor_change_frame_comp [relation]: Changing first by u and then by
    v equals changing by x↦v(x)∘u(x). This is the displayed order of frame composition, not its
    reverse.
Tests (examples):
  AutomorphicBundles.AutomorphyFactor_test_unit [degenerate]: The constant identity coefficient is
    normalized and satisfies the shifted cocycle.
  AutomorphicBundles.AutomorphyFactor_test_frame [computation]: For any invertible frame function u,
    J(g,x)=u(gx)u(x)⁻¹ satisfies the shifted cocycle.
  AutomorphicBundles.AutomorphyFactor_test_order [non-example]: For Q² let Sx(a,b)=(a+b,b),
    Sy(a,b)=(a,a+b). The constant functional factor J(g,x)=g for the evaluation action of GL(Q²) has
    J(SxSy,x)(1,0)=(2,1) and J(SySx,x)(1,0)=(1,1). Reversing coefficient composition fails this
    test.
  AutomorphicBundles.AutomorphyFactor_test_shift [non-example]: On C₂ acting on itself by left
    multiplication, choose frames u(1)=id and u(t)=Sx on Q². Gauge-changing the identity factor
    gives J(t²,1)(0,1)=(0,1), whereas the unshifted square J(t,1)²(0,1)=(2,1). Thus the base-point
    shift is necessary.
Inputs: AutomorphicBundles:B0/analytic-coefficient, AutomorphicBundles:B0/sections-equivariant,
  AutomorphicBundles:B3/canonical-and-subcanonical-extensions,
  AutomorphicBundles:B3/subcanonical-extension, mathlib:LinearEquiv.trans

AutomorphicBundles:B4/slash-action-of-automorphy-factor [construction] AutomorphicBundles.slashActionOfAutomorphyFactor
For any index β, monoid G acting on X on the left, semiring R and R-module V, normalized
  coefficients J(k,g,x):V≃_R V with J(k,gh,x)=J(k,g,hx)∘J(k,h,x) define Mathlib’s existing
  SlashAction β G (X→V) by (f|_k g)(x)=J(k,g,x)⁻¹ f(gx). No new slash-action carrier is introduced.
  The action is additive and R-linear, and |gh equals first |g then |h.
API:
  AutomorphicBundles.slashActionOfAutomorphyFactor_map_apply [simp]: The map evaluates to
    J(k,g,x)⁻¹(f(gx)).
  AutomorphicBundles.slashActionOfAutomorphyFactor_invariant_iff [characterisation]: ∀g,f|_k g=f iff
    ∀g,x,f(gx)=J(k,g,x)f(x).
  AutomorphicBundles.slashActionOfAutomorphyFactor_map_smul [structure]: Slash is R-linear on
    functions.
  AutomorphicBundles.slashActionOfAutomorphyFactor_congr [extensionality]: Pointwise equal
    coefficient families give equal SlashAction values, independent of proof terms.
  AutomorphicBundles.slashActionOfAutomorphyFactor_map_of_trivial [compatibility]: If J is identity,
    map is precomposition by the left base action.
Tests (examples):
  AutomorphicBundles.slashActionOfAutomorphyFactor_test_trivial [degenerate]: For identity J, f|g is
    x↦f(gx).
  AutomorphicBundles.slashActionOfAutomorphyFactor_test_zero [computation]: The zero function is
    fixed for every normalized coefficient.
  AutomorphicBundles.slashActionOfAutomorphyFactor_test_frame [characterisation]: The
    point-dependent frame cocycle u(gx)u(x)⁻¹ yields exactly u(x)u(gx)⁻¹f(gx).
  AutomorphicBundles.slashActionOfAutomorphyFactor_test_noncommuting [non-example]: For the two
    rational shears, applying the inverse composite in the wrong order changes the value on (1,0).
  AutomorphicBundles.slashActionOfAutomorphyFactor_test_inverse [non-example]: The rational shearX
    applied to the constant (0,1) has slash value (−1,1), detecting an operator that forgets the
    inverse.
  AutomorphicBundles.slashActionOfAutomorphyFactor_test_sl2 [compatibility]: For SL2(Z), V=C and
    J(k,g,z)=denom(g,z)^k as a scalar linear automorphism, the adapter equals Mathlib’s scalar slash
    action.
  AutomorphicBundles.slashActionOfAutomorphyFactor_test_zero_noncocycle [non-example]: The
    normalized nonzero factor on C2 with nonidentity value 2 transforms the zero section but fails
    J(gh)=J(g)J(h); this is not accepted as an adapter input.
  AutomorphicBundles.slashActionOfAutomorphyFactor_test_semilinear [non-example]: The
    determinant-negative GL2(R) slash law has conjugated scalar multiplication and cannot be
    represented by this C-linear adapter.
Inputs: mathlib:SlashAction, mathlib:LinearEquiv.trans, mathlib:LinearEquiv.trans_symm,
  mathlib:LinearEquiv.symm_apply_eq, mathlib:LinearEquiv.automorphismGroup,
  mathlib:LinearEquiv.applyDistribMulAction

AutomorphicBundles:B4/slash-evaluation [lemma] AutomorphicBundles.slashActionOfAutomorphyFactor_map_apply
For the exact parameters and normalized cocycle of slashActionOfAutomorphyFactor, its map evaluates
  as J(k,g,x)⁻¹(f(gx)).
Inputs: AutomorphicBundles:B4/slash-action-of-automorphy-factor

AutomorphicBundles:B4/slash-invariance [lemma] AutomorphicBundles.slashActionOfAutomorphyFactor_invariant_iff
For the exact adapter parameters, ∀g,f|_k g=f iff ∀g,x,f(gx)=J(k,g,x)f(x). This equivalence needs no
  nonzero-section hypothesis.
Inputs: AutomorphicBundles:B4/slash-evaluation, mathlib:LinearEquiv.symm_apply_eq

AutomorphicBundles:B4/inverse-base-action-cocycle [lemma] AutomorphicBundles.inverse_base_action_cocycle
For groups G,H, a left G-action on X and J:G×X→H satisfying the left shifted cocycle, define
  x·g=g⁻¹x and J_right(x,g)=J(g⁻¹,x). Then J((gh)⁻¹,x)=J(h⁻¹,g⁻¹x)J(g⁻¹,x). This right base action
  is distinct from the right slash action on functions.
Inputs: AutomorphicBundles:B4/automorphy-factor-cocycle-and-growth-conditions

AutomorphicBundles:B4/nonzero-section-cocycle [lemma] AutomorphicBundles.cocycle_at_of_automorphy_of_ne_zero
For a monoid G acting on X, a field K, J:G×X→K and f:X→K with f(gx)=J(g,x)f(x), at any point x with
  f(x)≠0 one has J(gh,x)=J(g,hx)J(h,x). No conclusion is inferred at a zero of f or from the zero
  function.
Inputs: none

AutomorphicBundles:B4/analytic-classical-comparison [theorem] AutomorphicBundles.analyticClassicalComparison
Over L↪C, identify classicalForms with holomorphic equivariant functions for the analytic
  coefficient whose components in the canonical boundary frame extend holomorphically across each
  cusp chart. Identify cuspForms with those components in the reduced boundary ideal. Locally,
  holomorphic logarithmic-growth components have removable singularities; cuspidal components are
  divisible by each reduced boundary parameter. Global algebraization uses proper projective GAGA on
  SΣ. The scalar Baily–Borel boundedness statement is limited to the separately descended scalar
  line coefficients.
Inputs: AutomorphicBundles:B4/classical-forms, AutomorphicBundles:B4/cusp-forms,
  AutomorphicBundles:B2/automorphic-analytic-comparison, AutomorphicBundles:B0/sections-equivariant,
  AutomorphicBundles:B3/canonical-and-subcanonical-extensions,
  AutomorphicBundles:B3/subcanonical-extension, AutomorphicBundles:B3/minimal-hodge-line-comparison,
  ComplexComparisonPartII:C2

AutomorphicBundles:B4/gl2-hodge-line-comparison [comparison] AutomorphicBundles.gl2HodgeLineComparison
For an actual modular-curve model with a fine level removing stabilizers, the cohomological Hodge
  line is ω=e*Ω¹_E/S, its canonical extension is the generalized-elliptic invariant-differential
  line, and the integer weight-k coefficient is ω^{⊗k} (dual powers for k<0). Compare the
  proper-curve geometric forms supplied by R15.1 to Mathlib’s existing scalar ModularForm Γ k /
  CuspForm Γ k after the actual complex uniformization and all-cusp comparison. For
  determinant-negative full GL2 the scalar law is semilinear; the C-linear prototype comparison is
  restricted to SL2.
Inputs: AutomorphicBundles:B2/automorphic-analytic-comparison,
  AutomorphicBundles:B4/analytic-classical-comparison, AlgebraicModularFormsAndSerreWeights:R15.1,
  mathlib:ModularForm, mathlib:CuspForm, mathlib:ModularForm.SL_slash_apply,
  mathlib:ModularForm.slash_action_eq'_iff, mathlib:ModularForm.smul_slash,
  mathlib:UpperHalfPlane.denom_ne_zero, mathlib:UpperHalfPlane.denom_cocycle,
  mathlib:UpperHalfPlane.denom_cocycle'

AutomorphicBundles:B4/hilbert-arithmetic-weight [definition] AutomorphicBundles.HilbertArithmeticWeight
For a finite set I of real embeddings of a totally real field F, an arithmetic weight is k:I→Z
  together with w:Z and the parity condition k_τ≡w mod 2 for every τ. Put m_τ=(w−k_τ)/2. This is a
  coefficient label, not the theorem that its representation descends to Q or through every
  arithmetic central stabilizer. Negative k and determinant powers are allowed over the
  characteristic-zero coefficient field.
API:
  AutomorphicBundles.HilbertArithmeticWeight_k [projection]: The embedding-indexed integer k_τ.
  AutomorphicBundles.HilbertArithmeticWeight_w [projection]: The common integer central weight w.
  AutomorphicBundles.HilbertArithmeticWeight_detExponent [data]: m_τ=(w−k_τ)/2.
  AutomorphicBundles.HilbertArithmeticWeight_two_mul_detExponent [characterisation]: 2m_τ=w−k_τ for
    every τ.
  AutomorphicBundles.HilbertArithmeticWeight_add [constructor]: Pointwise k addition and w addition
    preserve arithmetic parity.
  AutomorphicBundles.HilbertArithmeticWeight_ext [extensionality]: Arithmetic weights with the same
    embedding-indexed k and the same w are equal; parity proofs carry no extra data.
Tests (examples):
  AutomorphicBundles.HilbertArithmeticWeight_test_zero [degenerate]: k=0,w=0 is an arithmetic weight
    and every m_τ=0.
  AutomorphicBundles.HilbertArithmeticWeight_test_negative [computation]: For one embedding, k=4,w=2
    gives m=−1, so forbidding negative determinant twists would lose an allowed weight.
  AutomorphicBundles.HilbertArithmeticWeight_test_parity [non-example]: k=3,w=2 violates parity and
    is not an arithmetic weight.
Inputs: none

AutomorphicBundles:B4/hilbert-coefficient [construction] AutomorphicBundles.hilbertCoefficient
Over a characteristic-zero field L splitting F and the supplied HB family, decompose H¹dR=⊕_τH_τ and
  ω=⊕_τω_τ, with H_τ rank two and ω_τ rank one. For an arithmetic weight define
  ω^{(k,w)}=⊗_τ(ω_τ^{k_τ}⊗δ_τ^{m_τ}), δ_τ=det H_τ and m_τ=(w−k_τ)/2. In the cohomological frame
  convention scalar t_τ acts as t_τ on ω_τ and t_τ² on δ_τ, so the central character is
  ∏t_τ^w=Norm(t)^w. Passing to the homology representation convention inverts that character.
API:
  AutomorphicBundles.hilbertCoefficient_formula [characterisation]: The line equals the displayed
    tensor of ω_τ powers and determinant powers.
  AutomorphicBundles.hilbertCoefficient_central [compatibility]: Its cohomological-frame central
    action is Norm(t)^w.
  AutomorphicBundles.hilbertCoefficient_add [functoriality]: Coefficient tensor products correspond
    to addition of arithmetic weights.
Tests (examples):
  AutomorphicBundles.hilbertCoefficient_test_rational [compatibility]: For F=Q, (k,w=k) has m=0 and
    gives ω^k.
  AutomorphicBundles.hilbertCoefficient_test_determinant [computation]: For every embedding
    k_τ=0,w=2, the coefficient is ⊗_τdet H_τ.
  AutomorphicBundles.hilbertCoefficient_test_negative [non-example]: At k_τ=4,w=2 the determinant
    factor is δ_τ⁻¹; replacing m by its absolute value changes the central character.
Inputs: AutomorphicBundles:B4/hilbert-arithmetic-weight,
  AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer,
  AutomorphicBundles:B0/hodge-parabolic-convention, HilbertModularVarietiesAndShimuraCurves:H1,
  HilbertModularVarietiesAndShimuraCurves:H2

AutomorphicBundles:B4/hilbert-central-descent [theorem] AutomorphicBundles.hilbertCentralDescent
For the actual G=Res(F/Q)GL2 or G* arithmetic quotient, the split Hilbert coefficient descends
  through an ineffective central subgroup C iff its character Norm(t)^w (or its homology inverse) is
  trivial on C. Totally positive norm-one units act trivially for arithmetic (k,w), but any
  remaining signs and finite stabilizers must be checked separately. The G* polarization quotient
  uses H3/H4’s actual finite unit quotient, not a guessed quotient of the full centre.
Inputs: AutomorphicBundles:B4/hilbert-coefficient, AutomorphicBundles:B0/ineffective-fibre-descent,
  HilbertModularVarietiesAndShimuraCurves:H0, HilbertModularVarietiesAndShimuraCurves:H3,
  HilbertModularVarietiesAndShimuraCurves:H4

AutomorphicBundles:B4/unsplit-hilbert-descent [comparison] AutomorphicBundles.unsplitHilbertDescent
Descend the split Hilbert coefficient along the Galois action permuting F embeddings and the
  representation’s actual descent datum. Before splitting, use the O_F⊗O-linear Hodge/de Rham
  modules and determinant/norm constructions; do not choose global idempotent summands over a
  nonsplitting base. The coefficient field is the field of definition of the embedding-indexed
  weight and representation, enlarged if necessary beyond the Shimura reflex field.
Inputs: AutomorphicBundles:B4/hilbert-coefficient, AutomorphicBundles:B0/coefficient-galois-descent,
  AutomorphicBundles:B4/hilbert-central-descent, HilbertModularVarietiesAndShimuraCurves:H1,
  HilbertModularVarietiesAndShimuraCurves:H2

AutomorphicBundles:B4/siegel-coefficient [construction] AutomorphicBundles.siegelCoefficient
For the rank-g cohomological Hodge bundle ω of a principally polarized abelian family and a dominant
  integer weight λ₁≥⋯≥λ_g, set a_i=λ_i−λ_g and define the characteristic-zero coefficient
  S_a(ω)⊗(det ω)^{λ_g}, with the chosen similitude/Tate character separately specified. Use the
  actual Schur functor form over a good integral base when requested. In the BCGP opposite-flag
  convention compare the tautological exact sequence and its two Levi coefficients, with the dual
  and central-character conversion from B2.
API:
  AutomorphicBundles.siegelCoefficient_schur [characterisation]: The coefficient is
    S_(λ−λ_g)(ω)⊗det(ω)^{λ_g} with its separately declared central twist.
  AutomorphicBundles.siegelCoefficient_scalar [compatibility]: For λ=(r,…,r) the coefficient is
    det(ω)^r.
  AutomorphicBundles.siegelCoefficient_standard [compatibility]: For λ=(1,0,…,0) it is ω.
Tests (examples):
  AutomorphicBundles.siegelCoefficient_test_g1 [compatibility]: For g=1 the coefficient is the
    modular Hodge-line power ω^{λ₁}.
  AutomorphicBundles.siegelCoefficient_test_det [computation]: For λ=(−1,…,−1) it is det(ω)⁻¹, not a
    polynomial-only Schur coefficient.
  AutomorphicBundles.siegelCoefficient_test_standard [non-example]: For g>1, λ=(1,0,…,0) yields rank
    g, so replacing every Siegel coefficient by a scalar determinant power fails.
Inputs: AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer,
  AutomorphicBundles:B2/levi-highest-weight-convention, PELModuli:M3, PELModuli:M5,
  AbelianSchemesAndArithmeticModuli:A4,
  tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-2-the-weyl-construction-via-young-symmetrizers

AutomorphicBundles:B4/unitary-coefficient [construction] AutomorphicBundles.unitaryCoefficient
For the imaginary-quadratic GU(1,1) PEL datum over a coefficient field L containing both labelled
  embeddings τ,barτ of F, use the actual decomposition H¹dR=H_τ⊕H_barτ with each rank two and Hodge
  lines ω_τ,ω_barτ of rank one. In the chosen cohomological graded-frame convention the split Levi
  GL1×GL1×Gm weight (k,l;n) gives ω_τ^k⊗ω_barτ^l⊗ν^n, where ν is the declared similitude/Tate line.
  Negative exponents use duals. The formula is a labelled example, not an unproved identification of
  ν with a determinant on every model.
API:
  AutomorphicBundles.unitaryCoefficient_formula [characterisation]: The labelled weight coefficient
    is ω_τ^k⊗ω_barτ^l⊗ν^n.
  AutomorphicBundles.unitaryCoefficient_dual [functoriality]: The dual weight is (−k,−l;−n), with
    dualized similitude line.
  AutomorphicBundles.unitaryCoefficient_conjugate [compatibility]: The embedding permutation
    transports (k,l;n) to (l,k;n) and the transported PEL coefficient.
Tests (examples):
  AutomorphicBundles.unitaryCoefficient_test_unit [degenerate]: Weight (0,0;0) gives O.
  AutomorphicBundles.unitaryCoefficient_test_line [computation]: Weight (1,0;0) gives ω_τ, while
    (0,1;0) gives the differently labelled ω_barτ.
  AutomorphicBundles.unitaryCoefficient_test_twist [non-example]: Weight (0,0;1) is ν, so erasing
    the formal similitude/Tate line loses a coefficient even when k=l=0.
Inputs: AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer,
  AutomorphicBundles:B0/coefficient-galois-descent, AutomorphicBundles:B0/ineffective-fibre-descent,
  PELModuli:M0, PELModuli:M3, PELModuli:M5

AutomorphicBundles:B4/number-field-forms-base-change [theorem] AutomorphicBundles.numberFieldFormsBaseChange
For proper SΣ/L and coherent canonical or subcanonical coefficients, the form space is
  finite-dimensional over L and, for any field extension L′/L, H⁰(SΣ,F)⊗_L L′≃H⁰(SΣ,L′,F_L′). Under
  L↪C it identifies the L-rational subspace of the analytic classical/cusp space. Products and
  compatible coefficient maps commute with this base change. The theorem does not assert analogous
  flat base change for every integral special fibre.
Inputs: AutomorphicBundles:B4/classical-forms, AutomorphicBundles:B4/cusp-forms,
  AutomorphicBundles:B3/canonical-rational-descent,
  AutomorphicBundles:B4/analytic-classical-comparison

AutomorphicBundles:B4/classical-vb-tate-normalization [comparison] AutomorphicBundles.classicalVBTateNormalization
In the Hodge-type setting of BCGP §4.5, fix a neat tame level K^p, a p-adic coefficient field E
  large enough for the split group/reflex embeddings, compatible toroidal fans, and the separately
  constructed rational Hodge–Tate map/universal M torsor and VB functor. For a finite-dimensional
  algebraic Levi coefficient L_κ, identify VB⁰_Σ(L_κ)=ω^{κ,sm}(κ(μ)), where ω^{κ,sm}=colim_Kp ω^κ_Kp
  is the classical smooth canonical coefficient with rational structure. The μ-weight Tate twist is
  part of this comparison; it is absent from the untwisted coherent convention of §4.8. The action
  moves fans and is compared on compatible refinements.
Inputs: AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer,
  AutomorphicBundles:B1/filtration-reduction,
  AutomorphicBundles:B3/canonical-and-subcanonical-extensions,
  AutomorphicBundles:B2/levi-highest-weight-convention,
  AutomorphicBundles:B1/principal-hecke-pullback, AutomorphicBundles:B3/fan-independent-sections

### Layer B5


AutomorphicBundles:B5/fj-coefficient-module [definition]
Use the good-prime PEL setting of Lan 6.4 and 7.1: R is the indicated localization of the reflex
  integers (or its characteristic-zero field version), X is the smooth proper toroidal stack, k is a
  nonnegative integer, and M is an R-module. For an actual cusp label Phi, let C_Phi be its abelian
  torsor, Psi_Phi(ell) the character-indexed invertible sheaf from the relative torus embedding, and
  L_Phi = det_Z(X_Phi) tensor omega_A the boundary Hodge line. Define C_Phi(ell;k,M) = Gamma(C_Phi,
  Psi_Phi(ell) tensor L_Phi^k tensor_R M). This definition uses the torsor, not an arbitrary scalar
  coefficient ring. For an index set Lambda in the character lattice, the coefficient-family target
  is the product over ell in Lambda of these modules, with transport under the actual cusp
  stabilizer.
API:
  FJCoefficient.map [functoriality]: An R-linear map M to N induces coefficient maps in every
    degree, respecting identity and composition.
  FJCoefficient.transport [functoriality]: A supplied cusp-label or stabilizer isomorphism
    transports the lattice degree, invertible sheaf and coefficient section together, with
    composition law.
  FJCoefficient.family_ext [extensionality]: Two coefficient families are equal exactly when their
    components agree in every degree after the specified transports.
Tests (examples):
  FJCoefficient.zeroCoefficients [degenerate]: With coefficient module M = 0, every C_Phi(ell;k,M)
    is zero.
  FJCoefficient.tateTrivialization [compatibility]: For C_Phi = Spec R, Psi_Phi(n) and L_Phi
    trivialized by the Tate-chart data, C_Phi(n;k,M) identifies with M by evaluation in those
    trivializations.
  FJCoefficient.notFiniteSupport [non-example]: For the rank-one formal chart R[[q]] over nonzero R,
    the coefficient family of (1-q)^(-1) has coefficient 1 in every nonnegative degree; the
    expansion target must not impose finite support.
Inputs: AutomorphicBundles:B3, AutomorphicBundles:B4, ShimuraCompactifications:C0,
  ShimuraCompactifications:C4, ShimuraCompactifications:C5,
  mathlib:AlgebraicGeometry.Scheme.Modules, tauceti:AlgebraicGeometry.Scheme.Modules.tensorProduct,
  mathlib:AlgebraicGeometry.tilde.isoTop

AutomorphicBundles:B5/local-fj-expansion [construction]
For a nonempty stratum represented by (Phi,delta,sigma), construct the R-linear map from AF(k,M) =
  Gamma(X,omega_tor^k tensor_R M) to the product of C_Phi(ell;k,M) over ell in sigma-dual. It
  restricts a section to the formal completion along the stratum, pulls it to the supplied Mumford
  chart, identifies the Hodge line, and extracts graded coefficients. Its image satisfies the actual
  stabilizer equivariance. The coefficient product is a target, not an assertion that every family
  is the expansion of a section or of a completed graded-algebra element.
API:
  FourierJacobi.localExpansion [constructor]: Given the actual formal restriction, Mumford chart and
    Hodge comparison from the suppliers, return the R-linear local expansion with its degree-indexed
    coefficient target and stabilizer equivariance.
  FourierJacobi.local_coeff [projection]: Evaluation in degree ell equals the coefficient obtained
    from the actual completed section on the Mumford chart.
  FourierJacobi.local_add [simp]: The local expansion sends f+g to the sum of the two coefficient
    families.
  FourierJacobi.local_smul [simp]: The local expansion commutes with multiplication by every scalar
    in R.
Tests (examples):
  FourierJacobi.local_zero [degenerate]: The expansion of the zero section has every coefficient
    zero.
  FourierJacobi.local_tate_monomial [computation]: On the rank-one formal Tate chart, the local
    section q^n(du/u)^k has coefficient 1 in degree n and 0 in every other degree. This is a
    local-chart test, not a claim that the monomial extends to a global modular form.
  FourierJacobi.local_coefficient_map [compatibility]: Applying M to N to a section and then
    expanding gives the degreewise coefficient map applied to its expansion.
Inputs: AutomorphicBundles:B5/fj-coefficient-module, AutomorphicBundles:B3,
  ShimuraCompactifications:C0, ShimuraCompactifications:C4, ShimuraCompactifications:C5,
  AdicSpacesPartII:F0

AutomorphicBundles:B5/cone-compatibility [lemma]
For a face inclusion sigma1 contained in the closure of sigma2, with both cones in the positive part
  of the same cusp fan, sigma2-dual is contained in sigma1-dual. For a global Hodge section whose
  two local expansions are obtained from the common formal boundary chart specified in the supplier
  contract, its sigma1 coefficients agree with its sigma2 coefficients on sigma2-dual and vanish on
  sigma1-dual minus sigma2-dual. Thus the sigma1 family is the extension by zero of the sigma2
  family. Incidence chains of positive cones and the support theorem then put the global expansion
  in the dual of the fan support. This compares the common-image sections, not arbitrary elements of
  the two separately completed rings.
Inputs: AutomorphicBundles:B5/local-fj-expansion, ShimuraCompactifications:C0,
  ShimuraCompactifications:C4, ShimuraCompactifications:C5, AdicSpacesPartII:F0,
  mathlib:PowerSeries.isUnit_iff_constantCoeff, AdicSpacesPartII:F0/completion-of-morphism,
  ShimuraCompactifications:C0/relative-face-open

AutomorphicBundles:B5/global-fj-expansion [construction]
Restrict the compatible cone expansions to P_Phi-dual to obtain an R-linear cusp-label expansion
  FJ_Phi. Its codomain is the submodule of the product of C_Phi(ell;k,M) fixed by the actual action
  of the full cusp stabilizer, including its action on degrees and coefficient sheaves. Composing
  with a cone inclusion recovers the local expansion. Neither finite support nor division by the
  order of a stabilizer enters the definition.
API:
  FourierJacobi.expansion [constructor]: Given compatible local expansions and the support theorem,
    return the R-linear map to the actual full-stabilizer invariant coefficient family,
    characterized by its local coefficient evaluations.
  FourierJacobi.coeff [projection]: The ell-th coefficient is evaluation of the family in
    C_Phi(ell;k,M).
  FourierJacobi.constantTerm [projection]: The constant term is evaluation at degree zero, with its
    coefficient sheaf and stabilizer invariance retained.
  FourierJacobi.coefficient_naturality [functoriality]: An R-linear coefficient map M to N commutes
    with the global expansion and with each coefficient evaluation. Its proof obligation is the
    separate coefficient-naturality node below.
Tests (examples):
  FourierJacobi.global_zero [degenerate]: The zero section maps to the zero invariant family.
  FourierJacobi.global_local [compatibility]: Extending the global family to sigma-dual by zero
    gives the local expansion for that cone.
  FourierJacobi.no_averaging [non-example]: For a trivial action of the cyclic group of order p on
    F_p, the invariant submodule is all of F_p. A construction that multiplies a section by the
    group sum, or divides by p, does not give this invariant-section identification.
Inputs: AutomorphicBundles:B5/cone-compatibility, AutomorphicBundles:B5/fj-coefficient-module,
  ShimuraCompactifications:C1, ShimuraCompactifications:C4

AutomorphicBundles:B5/fj-refinement [theorem]
For a compatible smooth fan refinement pi:X_SigmaPrime to X_Sigma, pullback of sections of
  omega_tor^k tensor_R M commutes with FJ_Phi under the canonical cusp-label identifications. Using
  B3's section comparison and a common refinement gives a canonical identification independent of
  the chosen fan, not literal equality of compactifications.
Inputs: AutomorphicBundles:B5/global-fj-expansion, AutomorphicBundles:B3,
  ShimuraCompactifications:C3

AutomorphicBundles:B5/constant-term-restriction [theorem]
For a stratum represented by a cone in the positive part P_Phi-plus, restriction of f to that
  stratum is obtained from the degree-zero coefficient of FJ_Phi(f). Nonzero degrees in P_Phi-dual
  lie in the stratum ideal. Descent of this constant term to the lower-dimensional moduli object
  also uses full Gamma_Phi invariance and the quotient M_Phi/Gamma_Phi = M_Z; the finite cover M_Phi
  is not identified with M_Z before descent.
Inputs: AutomorphicBundles:B5/global-fj-expansion, ShimuraCompactifications:C0,
  ShimuraCompactifications:C1, ShimuraCompactifications:C4

AutomorphicBundles:B5/coefficient-naturality [lemma]
Fix the actual toroidal model, weight and finite collection I of cusp labels. Write F(M) = AF(k,M)
  and G(M) = product over i in I of FJE_Phi_i(k,M). For every R-linear map a:M to N, the constructed
  coefficient maps satisfy G(a) composed with FJ_I,M = FJ_I,N composed with F(a). Thus the
  Fourier-Jacobi maps form a natural transformation between the actual coefficient functors. This is
  the coefficient_naturality API of global-fj-expansion, now a separate proof node because it is
  used in the exact-row arguments.
Inputs: AutomorphicBundles:B5/global-fj-expansion, AutomorphicBundles:B5/local-fj-expansion,
  AutomorphicBundles:B5/fj-coefficient-module, AdicSpacesPartII:F0

AutomorphicBundles:B5/coefficient-sequence-exact [lemma]
For a short exact sequence 0 to N to M to Q to 0 of R-modules, the actual coefficient maps give an
  exact sequence 0 to AF(k,N) to AF(k,M) to AF(k,Q). No surjectivity of the last map is asserted. In
  particular, coefficient inclusions induce injections of Hodge sections.
Inputs: AutomorphicBundles:B3, AutomorphicBundles:B4, ShimuraCompactifications:C5,
  SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1

AutomorphicBundles:B5/fj-target-left-exact [lemma]
For the fixed finite collection I and G(M) = product over i in I of FJE_Phi_i(k,M), every short
  exact coefficient sequence 0 to N to M to Q to 0 induces a left exact sequence 0 to G(N) to G(M)
  to G(Q). This includes infinite products over character degrees and full cusp-stabilizer
  invariants. It asserts no surjectivity at G(Q) and no commutation with filtered colimits.
Inputs: AutomorphicBundles:B5/fj-coefficient-module, AutomorphicBundles:B5/global-fj-expansion,
  ShimuraCompactifications:C1, ShimuraCompactifications:C4, ShimuraCompactifications:C5,
  SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1

AutomorphicBundles:B5/fj-injectivity-cyclic [lemma]
Let p be a prime ideal of the indicated field or Dedekind base R, including p=0, and put S=R/p.
  Suppose the base-changed chosen strata jointly meet every irreducible component of X_S and the
  actual completed-chart coefficient comparisons are compatible with this base change. Then the
  joint Fourier-Jacobi map on AF(k,S) is injective. For p=0 this uses the reduced total model; for p
  nonzero it uses the reduced residue-field model. Fiberwise detection is supplied by the precise
  geometric request below; the neat-level route is not silently asserted at non-neat level.
Inputs: AutomorphicBundles:B5/local-fj-expansion, AutomorphicBundles:B5/global-fj-expansion,
  ShimuraCompactifications:C5, AdicSpacesPartII:F0, SchemeAndStackFoundations:SF.0,
  SchemeAndStackFoundations:SF.1, mathlib:Ideal.iInf_pow_smul_eq_bot_of_isLocalRing,
  mathlib:IsHausdorff.of_isLocalRing, mathlib:AdicCompletion.of_injective,
  AdicSpacesPartII:F0/completion-detects-near-closed,
  ShimuraCompactifications:C5/neat-strata-detect-geometric-components

AutomorphicBundles:B5/fj-injectivity-extension [lemma]
For a short exact coefficient sequence 0 to N to M to Q to 0 on the fixed actual PEL model,
  injectivity of the joint Fourier-Jacobi maps on AF(k,N) and AF(k,Q) implies injectivity on
  AF(k,M). The statement applies to nonsplit extensions, with no flatness assumption on N, M or Q
  beyond the geometric flatness already established for the coefficient functors.
Inputs: AutomorphicBundles:B5/coefficient-naturality,
  AutomorphicBundles:B5/coefficient-sequence-exact, AutomorphicBundles:B5/fj-target-left-exact,
  mathlib:CategoryTheory.ShortComplex.mono_τ₂_of_exact_of_mono

AutomorphicBundles:B5/fj-injectivity-finite [lemma]
Assume the geometric hypotheses of fj-injectivity-cyclic for every prime quotient R/p. Then the
  joint Fourier-Jacobi map is injective on AF(k,M) for every finitely generated R-module M. A finite
  prime filtration and the coefficient-extension lemma, rather than a free-module decomposition or
  completion faithfulness on each nonreduced thickening, give the reduction.
Inputs: AutomorphicBundles:B5/fj-injectivity-cyclic, AutomorphicBundles:B5/fj-injectivity-extension,
  AutomorphicBundles:B5/coefficient-naturality,
  mathlib:IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime,
  mathlib:IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime

AutomorphicBundles:B5/fj-injectivity [theorem]
In the setting of Lan 7.1.2.14, choose a finite collection of nonempty strata whose union meets
  every irreducible component of the toroidal model. The product of their Fourier-Jacobi morphisms
  on AF(k,M) is injective for every R-module M. The source hypothesis is preserved: early C5 must
  establish its compatibility with the prime-quotient component-detection hypotheses used below. The
  specified neat-level route does not by itself establish the full non-neat source theorem, which
  remains an open target.
Inputs: AutomorphicBundles:B5/fj-injectivity-finite, AutomorphicBundles:B5/coefficient-naturality,
  AutomorphicBundles:B5/fj-target-left-exact, AutomorphicBundles:B4, ShimuraCompactifications:C5,
  SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1

AutomorphicBundles:B5/coefficient-recognition [theorem]
Let M1 be an R-submodule of M and keep the detecting strata of fj-injectivity. If the expansion of f
  in AF(k,M) at every chosen cusp lies in the image of the corresponding coefficient-family module
  with coefficients in M1, then f lies in the image of AF(k,M1). This is an image-membership theorem
  for actual sections, not an unconditional assertion that global sections commute with every base
  change.
Inputs: AutomorphicBundles:B5/fj-injectivity, AutomorphicBundles:B5/coefficient-naturality,
  AutomorphicBundles:B5/coefficient-sequence-exact, AutomorphicBundles:B5/fj-target-left-exact

AutomorphicBundles:B5/cuspidal-boundary-criterion [theorem]
On a neat smooth toroidal model with its reduced relative normal-crossings divisor D, for the
  determinant-Hodge coefficient in this packet, a section belongs to the image of
  Gamma(X,omega_tor^k(-D) tensor_R M) precisely when its restriction to D is zero. Where the
  boundary-chart restrictions jointly detect this restriction, the condition is equivalently
  vanishing of the appropriate constant terms at all proper boundary labels. The exactness and
  detection assertions must be proved for the chosen M; a single maximal-cusp constant term is not
  substituted for all boundary restrictions.
Inputs: AutomorphicBundles:B3, AutomorphicBundles:B4,
  AutomorphicBundles:B5/constant-term-restriction, ShimuraCompactifications:C4,
  ShimuraCompactifications:C5

AutomorphicBundles:B5/hecke-section-operator [construction]
For the B1–B4 automorphic bundle E(V) on a fixed toroidal model X_K over R, take an admissible
  prime-to-characteristic element g with K_g=K∩gKg⁻¹ and the correspondence X_K ←p1 X_Kg →p2 X_K.
  After compatible cone refinement, the B2/B3 equivariant realization supplies θ_g:p2*E(V)→p1*E(V).
  For every R-module M define H_g=tr_p1 ∘ θ_g ∘ p2* on Γ(X_K,E(V)⊗_R M). Here the trace is the
  extension of the finite locally free trace through the supplied toric-refinement comparison, not a
  trace inferred for an arbitrary proper map. Fix a K-bi-invariant multiplicative character ν of the
  admissible monoid with values in R×, and set T_g=ν(g)H_g. The construction is independent of
  common refinement and representatives and preserves the subcanonical section module when the
  boundary ideal transport is supplied.
API:
  ClassicalHecke.operator [constructor]: The R-linear composite ν(g)tr_p1 θ_g p2* on the actual
    section module.
  ClassicalHecke.operator_one [simp]: The identity correspondence with ν(1)=1 acts as identity.
  ClassicalHecke.coefficient_map [functoriality]: An R-linear coefficient map M→N commutes with T_g,
    by coefficient-compatible pullback, trace and θ_g.
  ClassicalHecke.refinement [compatibility]: Transport across the B3 section comparison along a
    common fan refinement intertwines T_g, with identity and composition laws.
Tests (examples):
  ClassicalHecke.identity [degenerate]: The identity correspondence acts as identity on canonical
    and subcanonical sections.
  ClassicalHecke.weightZeroTrace [computation]: For a finite-free degree-d chart and the trivial
    bundle, the raw operator on 1 is d, not 1; the normalized value is ν(g)d.
  ClassicalHecke.modularNormalization [compatibility]: Over C, after the imported modular comparison
    and correct coset orientation, GL2 det⁻¹-scaled isogeny pull-identify-trace agrees with the
    existing HeckeRing.GL2.heckeRingHomCharSpace action; at an unramified prime its coefficients
    have the character-weighted ℓ^(k−1) term.
Inputs: AdelicAlgebraicGroups:AA.4/hecke-correspondence,
  AdelicAlgebraicGroups:AA.4/hecke-degree-double-coset, AutomorphicBundles:B2,
  AutomorphicBundles:B3, AutomorphicBundles:B4, ShimuraCompactifications:C3,
  SchemeAndStackFoundations:SF.0, mathlib:Algebra.trace_algebraMap_of_basis

AutomorphicBundles:B5/hecke-convolution [theorem]
With the correspondences, trace/base-change comparisons, θ cocycle and multiplicative normalization
  of hecke-section-operator, the assignment [KgK]↦T_g extends to a unital ring homomorphism from the
  existing integral Hecke ring to End_R Γ(X_K,E(V)⊗_R M), and restricts to the subcanonical section
  module. The multiplication convention is the existing HeckeCosetModule convolution, after an
  explicit right-coset/inverse-orientation comparison; its integer multiplicities are unchanged.
Inputs: AutomorphicBundles:B5/hecke-section-operator, AdelicAlgebraicGroups:AA.4/hecke-cartesian,
  tauceti:HeckeCosetModule.instRingHeckeRing, tauceti:HeckeRing.GL2.heckeRingHomCharSpace,
  SchemeAndStackFoundations:SF.0

AutomorphicBundles:B5/non-neat-hecke-descent [theorem]
Let K′◁K be neat and normal with finite Γ=K/K′, and use the actual equivariant canonical or
  subcanonical bundle on the stack quotient [X_K′/Γ]. Descent identifies its section module with
  Γ(X_K′,E⊗_R M)^Γ for every allowed R-module M. Define the K-Hecke operators through the refined
  K_g correspondences and their common neat covers. The resulting operators preserve this descent
  equalizer, are independent of the chosen neat cover, and agree under the descent identification
  with the stack pull-identify-trace action.
Inputs: AutomorphicBundles:B5/hecke-section-operator, AutomorphicBundles:B5/hecke-convolution,
  AdelicAlgebraicGroups:AA.4/hecke-cartesian, SchemeAndStackFoundations:SF.1,
  ShimuraCompactifications:C3

AutomorphicBundles:B5/modular-expansion-comparison [comparison]
Under B3/B4’s modular specialization and the R15.1 all-weight analytic comparison, the rank-one
  Fourier–Jacobi expansion is the imported Tate q-expansion, and over C it equals
  UpperHalfPlane.qExpansion h at the same cusp parameter q=exp(2πiτ/h) and invariant-differential
  trivialization. At full level n≥3 use Tate(q^n) over Z[1/n,ζ_n][[q]] as in the owner: the
  Kodaira–Spencer image of the square of the canonical differential is n dq/q. Import the R15.2
  all-component integral q-expansion principle and cusp exact sequence rather than asserting new
  modular theorems. Transport Hecke normalization to the existing analytic action and the owned
  geometric R15.2 operators.
Inputs: AutomorphicBundles:B5/local-fj-expansion, AutomorphicBundles:B5/hecke-section-operator,
  AlgebraicModularFormsAndSerreWeights:R15.1/hodge-bundle-with-tate-curve-normalization,
  AlgebraicModularFormsAndSerreWeights:R15.1/all-weight-analytic-comparison,
  AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem,
  AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions,
  AlgebraicModularFormsAndSerreWeights:R15.2/cuspidal-exact-sequence-equivariance,
  mathlib:UpperHalfPlane.qExpansion, mathlib:ModularForm.qExpansion_injective,
  mathlib:ModularForm.isCuspForm_iff_coeffZero_eq_zero, tauceti:HeckeRing.GL2.heckeRingHomCharSpace

AutomorphicBundles:B5/vector-fj-expansion [construction]
In Lan’s neat good-prime PEL setup, let R be a Noetherian coefficient algebra over the allowed
  reflex/representation base and W a finite projective R-representation of the actual Levi group.
  Import Ecan(W) from B2/B3. For each cusp chart the Raynaud/parabolic identification supplies a
  locally free bundle E0(W) on its abelian torsor C whose pullback is Ecan(W) on the completed
  Mumford family. For every R-module M define degree-ell coefficients as Γ(C,Ψ(ell)⊗E0(W)⊗_R M), and
  define the expansion by actual formal restriction, the bundle identification and graded
  extraction. Impose the completed support condition and full-stabilizer transports before passing
  to invariants. For general characteristic-zero Shimura data use this construction only after
  C3.general supplies the actual mixed-boundary formal isomorphism and coefficient-bundle
  comparison; Milne VII.4.1 is a conjectural description in the inspected notes, not that supplier’s
  proof.
API:
  VectorFourierJacobi.expansion [constructor]: Given the actual finite-projective representation
    bundle and its completed boundary identification, return the R-linear vector expansion into the
    full-stabilizer invariant family of sections of Ψ(ell) tensor E0(W) tensor_R M.
  VectorFourierJacobi.coefficient [projection]: Extract the degree-ell section of Ψ(ell)⊗E0(W)⊗M
    from the completed boundary restriction.
  VectorFourierJacobi.coefficient_map [functoriality]: An equivariant R-linear representation map
    W→W′ and a coefficient map M→M′ induce commuting degreewise maps, respecting identities and
    composition.
  VectorFourierJacobi.transport [functoriality]: A cusp transport moves the lattice degree, Ψ and E0
    together and intertwines extraction.
  VectorFourierJacobi.determinant [compatibility]: The determinant-Hodge representation specializes
    to the scalar FJ map, under B3’s supplied boundary bundle isomorphism.
  VectorFourierJacobi.refinement [compatibility]: The canonical section comparison for a common fan
    refinement intertwines vector expansions and has its cocycle law.
Tests (examples):
  VectorFourierJacobi.zeroRepresentation [degenerate]: For W=0 or M=0 every coefficient and
    expansion is zero.
  VectorFourierJacobi.rankTwoMonomial [computation]: On a trivial rank-two local coefficient bundle
    and rank-one chart, q^n(v1,v2) has vector coefficient (v1,v2) at n and zero at other degrees.
  VectorFourierJacobi.scalarSpecialization [compatibility]: For the determinant-Hodge representation
    giving ω^k the expansion equals the scalar map after the actual boundary-line identification.
Inputs: AutomorphicBundles:B5/fj-coefficient-module, AutomorphicBundles:B5/local-fj-expansion,
  AutomorphicBundles:B5/cone-compatibility, AutomorphicBundles:B5/global-fj-expansion,
  AutomorphicBundles:B2, AutomorphicBundles:B3, AutomorphicBundles:B3.general,
  AutomorphicBundles:B4, ShimuraCompactifications:C3.general, ShimuraCompactifications:C4

AutomorphicBundles:B5/vector-expansion-principle [theorem]
Let R be Noetherian, X a qcqs toroidal model smooth over R in the supplied PEL or
  characteristic-zero setup, Ecan a finite-rank locally free canonical automorphic bundle, and C_i
  its R-flat abelian-torsor charts with locally free E0,i. Require the actual formal
  restriction/graded coefficient identification, descent, and a finite collection of strata whose
  restrictions meet every irreducible component of X_(R/p) for every prime p⊂R. Then the joint
  vector Fourier–Jacobi map Γ(X,Ecan⊗_R M)→∏_i FJE_i(Ecan,M) is injective for every R-module M. For
  M1⊂M, membership of every expansion in the image from M1 is equivalent to membership of the global
  section in Γ(X,Ecan⊗M1). Boundary-zero coefficients at all required boundary strata characterize
  the image of Esub=Ecan(−D), when its relative boundary tensor sequence is exact.
Inputs: AutomorphicBundles:B5/vector-fj-expansion, AutomorphicBundles:B5/coefficient-naturality,
  AutomorphicBundles:B5/coefficient-sequence-exact, AutomorphicBundles:B5/fj-target-left-exact,
  AutomorphicBundles:B5/fj-injectivity-finite, AutomorphicBundles:B5/coefficient-recognition,
  AutomorphicBundles:B5/constant-term-restriction,
  AutomorphicBundles:B5/cuspidal-boundary-criterion,
  AdicSpacesPartII:F0/completion-detects-near-closed, SchemeAndStackFoundations:SF.1,
  AutomorphicBundles:B3, AutomorphicBundles:B4

AutomorphicBundles:B5/hilbert-cusp-expansion [construction]
Use Diamond’s Hilbert setting: F≠Q totally real, a rational prime p possibly ramified in F, a
  sufficiently large p-adic field with valuation ring O and embeddings Θ, and U=U^p GL2(O_F,p). Let
  R be a Noetherian O-algebra and (k,m)∈Z^Θ×Z^Θ with χ_(k+2m),R trivial on O_F×∩U. For the imported
  automorphic line A_(k,m), M_(k,m)(U;R)=Γ(Y,A)=Γ(Ymin,j_*A). At a cusp c represented by 0→I→H→J→0,
  polarization λ and level η, set Λ=d_F⁻¹I⁻¹J. Choose a prime-to-p full level N≥3 contained in U,
  ζ_N∈O, and a splitting H≅J⊕I. Let D_(k,m),c=⊗_θ (I⁻¹)_θ^⊗kθ ⊗ (d_F(IJ)⁻¹)_θ^⊗mθ. Define q_c by
  formal restriction into the series with coefficient line D_c⊗_O R and indices N⁻¹Λ_+∪{0}, using
  the actual unit action and completion. Changes of splitting, cusp representative and fine level
  use the canonical transports of these data; the expansion at general U is independent of a chosen
  cusp above c. The minimal pushforward j_*A is not assumed locally free.
API:
  HilbertQExpansion.map [constructor]: The R-linear formal restriction q_c into the coefficient-line
    series in the specified fractional positive lattice.
  HilbertQExpansion.coeff [projection]: Extract the D_c⊗R coefficient of t∈N⁻¹Λ_+∪{0}, including
    zero.
  HilbertQExpansion.transport [functoriality]: The canonical lattice/line isomorphism for a cusp
    representative or splitting change intertwines the transformed series; transports compose.
  HilbertQExpansion.coefficient_map [functoriality]: A Noetherian O-algebra map R→R′ commutes with
    each coefficient after base change of the actual form.
  HilbertQExpansion.fineLevel [compatibility]: Restriction to a fine U(N) and any cusp above c gives
    the same expansion after the canonical line/lattice identifications.
Tests (examples):
  HilbertQExpansion.zero [degenerate]: The zero form has zero coefficient in every degree; over the
    zero coefficient ring all forms and coefficients vanish.
  HilbertQExpansion.localMonomial [computation]: On a chosen formal cusp chart and coefficient-line
    trivialization, q^t d has coefficient d at t and zero elsewhere; no global form or unit
    invariance of this local monomial is asserted.
  HilbertQExpansion.unitTransport [non-example]: A family supported at a positive t moved to a
    different degree by a cusp unit, with nonzero coefficient only at t, is not invariant unless its
    full transported orbit satisfies the unit relation. It cannot be declared the expansion of a
    descended form.
Inputs: AutomorphicBundles:B5/vector-fj-expansion, HilbertModularVarietiesAndShimuraCurves:H2,
  HilbertModularVarietiesAndShimuraCurves:H3, ShimuraCompactifications:C6, AutomorphicBundles:B2,
  AutomorphicBundles:B3, AutomorphicBundles:B4

AutomorphicBundles:B5/hilbert-expansion-principle [theorem]
In hilbert-cusp-expansion’s prime-to-p-level setup, let S be a collection of cusps meeting every
  connected component of Ymin, equivalently with surjective determinant map S→F_+×\A_F,f×/det(U).
  Then q_S is injective. If R′⊂R is a Noetherian O-subalgebra and every coefficient lies in D_c⊗_O
  R′ at all c∈S, then the form comes from M_(k,m)(U;R′). This is Diamond Proposition 6.2.1; its
  geometric supplier must verify the component-to-fibre-detection comparison used by the vector
  principle. No analogous assertion is made for general Iwahori special fibres Y0(P)min_R, whose
  irreducible components need not contain cusps.
Inputs: AutomorphicBundles:B5/hilbert-cusp-expansion,
  AutomorphicBundles:B5/vector-expansion-principle, AutomorphicBundles:B5/coefficient-recognition,
  ShimuraCompactifications:C6, HilbertModularVarietiesAndShimuraCurves:H2,
  HilbertModularVarietiesAndShimuraCurves:H3, SchemeAndStackFoundations:SF.1

AutomorphicBundles:B5/hilbert-cuspidal-boundary [theorem]
In the Hilbert prime-to-p setting, let e_c be the constant coefficient of q_c with values in D_c⊗_O
  R. The source’s cusp space is ker(∏_c e_c), using all cusps. Under B3’s canonical/subcanonical
  boundary comparison and exact relative boundary tensor sequence, this is the image of
  Γ(Ytor,A_(k,m)(−D)⊗_O R) in the canonical sections. Each e_c is independent of splitting and lands
  in the actual cusp-unit invariants. In the characteristic-zero/flat O setting of §6.3, if the pair
  of weight vectors is not parallel, meaning (kθ,mθ) is not independent of θ, these invariant
  constants vanish and every such form is cuspidal; the conclusion is not inferred for arbitrary
  torsion R.
Inputs: AutomorphicBundles:B5/hilbert-cusp-expansion,
  AutomorphicBundles:B5/constant-term-restriction,
  AutomorphicBundles:B5/cuspidal-boundary-criterion, AutomorphicBundles:B3,
  ShimuraCompactifications:C6

AutomorphicBundles:B5/hecke-expansion-compatibility [theorem]
For an admissible geometric Hecke correspondence of hecke-section-operator, the actual completed
  cusp correspondence and bundle transport induce a coefficient operator H_g^FJ. The square FJ∘T_g =
  ν(g)H_g^FJ∘FJ commutes, including cusp-label changes, finite trace and full-stabilizer transport;
  it is independent of compatible refinement and commutes with allowed coefficient changes. No
  universal scalar formula for higher-dimensional coefficients is asserted: they remain sections on
  abelian torsors. At a good modular prime ℓ∤N, under modular-expansion-comparison this specializes
  to b_n=a_(ℓn)+χ(ℓ)ℓ^(k−1)a_(n/ℓ), with a_(n/ℓ)=0 when ℓ∤n and the n=0 term included. In Diamond’s
  Hilbert normalization r_m^t, for U1(n) or U(n) and v∤np, it specializes to r_m^t(T_v f)=r_m^(ϖ_v
  t)(f)+Nm(v) r_m^(ϖ_v⁻¹t)(S_v f); for U1(n) and v|n the second term is absent. Here r_m^t includes
  the coefficient-line/χ_m normalization of (6.1), and S_v is the actual central correspondence.
Inputs: AutomorphicBundles:B5/hecke-section-operator, AutomorphicBundles:B5/non-neat-hecke-descent,
  AutomorphicBundles:B5/modular-expansion-comparison, AutomorphicBundles:B5/hilbert-cusp-expansion,
  AutomorphicBundles:B5/vector-fj-expansion, ShimuraCompactifications:C3,
  ShimuraCompactifications:C4, ShimuraCompactifications:C6,
  AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions,
  tauceti:HeckeRing.GL2.twistedHeckeSlashSum_diagCosetGamma0_of_prime

AutomorphicBundles:B5/classical-bcgp-equivariance [comparison]
In BCGP’s Hodge-type setting, fix neat tame K^p, a sufficiently large p-adic coefficient field E,
  the actual Levi M, finite-dimensional algebraic L_κ with κ M-dominant, and compatible smooth
  toroidal data. The imported coefficient functor VB^0 identifies VB^0(L_κ)=ω^(κ,sm) with the smooth
  tower of the finite-level classical automorphic bundles of B2/B3, with its μ-weight Tate
  normalization. Its coherent cohomology is colim_(Kp) RΓ(X_KpK^p,ω_Kp^κ), a complex of smooth
  admissible G(Q_p)-representations. The same compatibility holds after tensoring by the actual
  boundary ideal (−D). Level pullbacks, prime-to-p Hecke maps and compatible fan refinements commute
  with the identification; G(Q_p) may change the fan. For GSp4 the convention check is
  ω^((1,0;−1),sm)=ω_A(−1)⊗O^sm, with Q_p(1) of Hodge–Tate weight −1 and Sen eigenvalue +1. The full
  derived/analytic VB machinery belongs to the already proposed HigherHidaAndColemanTheory, not to
  B5.
Inputs: AutomorphicBundles:B1, AutomorphicBundles:B2, AutomorphicBundles:B3,
  AutomorphicBundles:B3.general, AutomorphicBundles:B4,
  HodgeTateAndCanonicalSubgroups:T6:comparison, SchemeAndStackFoundations:SF.2,
  ShimuraCompactifications:C3.general, AutomorphicBundles:B5/hecke-section-operator

AutomorphicBundles:B5/classical-siegel-ht-comparison [theorem]
For the finite-level GSp4 toroidal model X=X_KpK^p in BCGP’s setting, let κ=(k1,k2;w) be an integral
  G-dominant weight with 0≥k1≥k2 and k1+k2+w even, and let V_κ∨ be its canonical pro-Kummer-étale
  coefficient local system. Use the untwisted canonical coherent bundles ω^λ of §4.8. Define
  λ0=(k1,k2;−w), λ1=(2−k1,k2;−w), λ2=(3−k2,k1+1;−w), λ3=(3−k2,3−k1;−w); 2a0=k1+k2+w, 2a1=2−k1+k2+w,
  2a2=4−k2+k1+w, 2a3=6−k1−k2+w. For every i≥0 there is a G_Qp×T_KpK^p-equivariant isomorphism
  H^i(X,V_κ∨)⊗_Qp C_p ≅ ⊕_(j=0..3) H^(i−j)(X,ω^λj)(−a_j), with negative coherent degrees interpreted
  as zero. The étale group is the logarithmic/pro-Kummer cohomology in the source notation; it is
  not reinterpreted as ordinary étale cohomology of the proper underlying toroidal space with an
  arbitrary lisse extension. The Tate convention is Q_p(1) of Hodge–Tate weight −1, Sen eigenvalue
  +1.
Inputs: AutomorphicBundles:B1, AutomorphicBundles:B2, AutomorphicBundles:B3, AutomorphicBundles:B4,
  HodgeTateAndCanonicalSubgroups:T6:comparison, SchemeAndStackFoundations:SF.2,
  AutomorphicBundles:B5/classical-bcgp-equivariance, AutomorphicBundles:B5/hecke-convolution

AutomorphicBundles:B5/cuspidal-siegel-ht-comparison [comparison]
With exactly the weight, coefficient local system, finite-level model and Tate convention of
  classical-siegel-ht-comparison, there is a G_Qp×T_KpK^p-equivariant isomorphism H_c^i(X,V_κ∨)⊗_Qp
  C_p ≅ ⊕_(j=0..3) H^(i−j)(X,ω^λj(−D))(−a_j), where D is the actual reduced toroidal boundary
  divisor and H_c is the compact-support logarithmic/étale theory used by BCGP. Keep this as a
  separate comparison from the ordinary canonical-bundle statement. The cusp twist is the
  subcanonical coefficient sheaf, not replacement by a selected set of zero constant terms in
  cohomological degree i.
Inputs: AutomorphicBundles:B1, AutomorphicBundles:B2, AutomorphicBundles:B3, AutomorphicBundles:B4,
  HodgeTateAndCanonicalSubgroups:T6:comparison, SchemeAndStackFoundations:SF.2,
  AutomorphicBundles:B5/classical-bcgp-equivariance, AutomorphicBundles:B5/hecke-convolution,
  AutomorphicBundles:B5/classical-siegel-ht-comparison,
  AutomorphicBundles:B5/cuspidal-boundary-criterion
-/
