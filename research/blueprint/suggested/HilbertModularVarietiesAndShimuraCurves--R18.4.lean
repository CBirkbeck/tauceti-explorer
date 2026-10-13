import Mathlib.LinearAlgebra.FreeModule.PID
import Mathlib.LinearAlgebra.Prod
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.Algebra.Module.Pi
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic.NormNum
import TauCeti.AlgebraicTopology.LocalCoefficient

/-!
# Suggested statements for R18.4: finite-level cohomology refinements

This file is a roadmap suggestion, not an implementation or a claim of formalization.
The light definitions have real bodies over carriers at the recorded pins. The API,
end statements and examples have placeholder proofs. The reader contains the exact
arithmetic targets, source locators, hypotheses, dependencies and omission ledger.

Pins: Tau Ceti f790474821cf4256814db967cb154e7af3d0c369;
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

The geometric coefficient systems, algebraic cohomology, integral model towers,
local deformation rings, patching functor and PEL/CM projectors have no suitable
carriers at these pins. Their targets stay in the reader. In particular this file
introduces no abstract proposition package in place of those constructions.
-/

set_option autoImplicit false

namespace TauCeti.ShimuraCurve.R18Cohomology

noncomputable section

section Components

variable (A C : Type*) [CommRing A] [CommGroup C]

/-- Right translation on the finite component-function model. Arithmetic component
identification and the comparison with the dual group algebra belong to the reader. -/
def componentTranslation (c : C) : (C → A) →ₗ[A] (C → A) where
  toFun f x := f (x * c)
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

/-- The unnormalized spherical action on component functions. -/
def componentT (q : ℕ) (c : C) : (C → A) →ₗ[A] (C → A) :=
  ((q + 1 : ℕ) : A) • componentTranslation A C c

/-- The central scalar double coset has norm class c squared. -/
def componentS (c : C) : (C → A) →ₗ[A] (C → A) :=
  componentTranslation A C (c * c)

theorem components_T (q : ℕ) (c : C) (f : C → A) (x : C) :
    componentT A C q c f x = ((q + 1 : ℕ) : A) * f (x * c) := by
  sorry

theorem components_S (c : C) (f : C → A) (x : C) :
    componentS A C c f x = f (x * (c * c)) := by
  sorry

theorem components_character (q : ℕ) (c : C) (χ : C →* Aˣ) :
    componentT A C q c (fun x => (χ x : A)) =
      (((q + 1 : ℕ) : A) * (χ c : A)) • (fun x => (χ x : A)) := by
  sorry

theorem componentS_inverse (c : C) :
    (componentS A C c).comp (componentS A C c⁻¹) = LinearMap.id := by
  sorry

example : componentT ℚ Unit 3 () (fun _ => 1) () = 4 := by
  sorry

example (c : C) (f : C → A) :
    componentT A C 0 c f = componentTranslation A C c f := by
  sorry

end Components

section Gram

variable (A M : Type*) [CommRing A] [AddCommGroup M] [Module A M]

/-- The order of the two geometric degeneracy maps is fixed in the reader. -/
def degeneracyGram (q : ℕ) (T : A) (S : Aˣ) : (M × M) →ₗ[A] (M × M) :=
  LinearMap.prod
    (((q + 1 : ℕ) : A) • LinearMap.fst A M M +
      ((↑(S⁻¹) : A) * T) • LinearMap.snd A M M)
    (T • LinearMap.fst A M M + ((q + 1 : ℕ) : A) • LinearMap.snd A M M)

/-- Scalar determinant of the degeneracy Gram matrix, with the central operator. -/
def degeneracyDiscriminant (q : ℕ) (T : A) (S : Aˣ) : A :=
  ((q + 1 : ℕ) : A) ^ 2 - (↑(S⁻¹) : A) * T ^ 2

/-- The adjugate gives a splitting when the discriminant is a unit. -/
def degeneracyAdjugate (q : ℕ) (T : A) (S : Aˣ) : (M × M) →ₗ[A] (M × M) :=
  LinearMap.prod
    (((q + 1 : ℕ) : A) • LinearMap.fst A M M -
      ((↑(S⁻¹) : A) * T) • LinearMap.snd A M M)
    (-T • LinearMap.fst A M M + ((q + 1 : ℕ) : A) • LinearMap.snd A M M)

theorem gram_first (q : ℕ) (T : A) (S : Aˣ) (x y : M) :
    (degeneracyGram A M q T S (x, y)).1 =
      ((q + 1 : ℕ) : A) • x + ((↑(S⁻¹) : A) * T) • y := by
  sorry

theorem gram_second (q : ℕ) (T : A) (S : Aˣ) (x y : M) :
    (degeneracyGram A M q T S (x, y)).2 =
      T • x + ((q + 1 : ℕ) : A) • y := by
  sorry

theorem gram_adjugate (q : ℕ) (T : A) (S : Aˣ) :
    (degeneracyAdjugate A M q T S).comp (degeneracyGram A M q T S) =
      degeneracyDiscriminant A q T S • LinearMap.id ∧
    (degeneracyGram A M q T S).comp (degeneracyAdjugate A M q T S) =
      degeneracyDiscriminant A q T S • LinearMap.id := by
  sorry

theorem gram_baseChange (B : Type*) [CommRing B] (φ : A →+* B)
    (q : ℕ) (T : A) (S : Aˣ) :
    φ (degeneracyDiscriminant A q T S) =
      degeneracyDiscriminant B q (φ T) (Units.map φ.toMonoidHom S) := by
  sorry

/-- Algebraic milestone behind the geometric unit-discriminant splitting. -/
theorem oldspace_split (N : Type*) [AddCommGroup N] [Module A N]
    (δ : (M × M) →ₗ[A] N) (trace : N →ₗ[A] (M × M))
    (q : ℕ) (T : A) (S : Aˣ)
    (hGram : trace.comp δ = degeneracyGram A M q T S)
    (hUnit : IsUnit (degeneracyDiscriminant A q T S)) :
    ∃ r : N →ₗ[A] (M × M), r.comp δ = LinearMap.id := by
  sorry

example (q : ℕ) (S : Aˣ) :
    degeneracyGram A M q 0 S = ((q + 1 : ℕ) : A) • LinearMap.id := by
  sorry

example : degeneracyGram ℚ ℚ 2 3 (Units.mk0 2 (by norm_num)) (0, 1) =
    (3 / 2, 3) := by
  sorry

example : degeneracyGram ℚ ℚ 2 3 1 (1, -1) = (0, 0) := by
  sorry

example : degeneracyDiscriminant ℚ 2 3 1 = 0 := by
  sorry

end Gram

section Saturation

variable (O M N : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [AddCommGroup M] [Module O M] [Module.Finite O M] [Module.Free O M]
  [AddCommGroup N] [Module O N] [Module.Finite O N] [Module.Free O N]

/-- Divisibility reflection is injectivity after reduction modulo a uniformizer.
The finite-free hypotheses are the arithmetic cohomology-control conclusion. -/
theorem residual_injectivity_saturation (varpi : O) (hvarpi : Irreducible varpi)
    (f : M →ₗ[O] N)
    (hResidual : ∀ x : M, (∃ y : N, f x = varpi • y) → ∃ z : M, x = varpi • z) :
    Function.Injective f ∧ Module.IsTorsionFree O (N ⧸ LinearMap.range f) ∧
      Module.Free O (N ⧸ LinearMap.range f) := by
  sorry

theorem integral_ihara_reductions (varpi : O) (hvarpi : Irreducible varpi)
    (f : M →ₗ[O] N)
    (hResidual : ∀ x : M, (∃ y : N, f x = varpi • y) → ∃ z : M, x = varpi • z) :
    ∀ n : ℕ, ∀ x : M, (∃ y : N, f x = varpi ^ n • y) → ∃ z : M, x = varpi ^ n • z := by
  sorry

end Saturation

section ExistingCoefficients

open CategoryTheory

variable (R : Type*) [Ring R] (X : TopCat) (M : ModuleCat R)

/-- This is the existing carrier, rather than a newly postulated arithmetic sheaf. -/
example : TauCeti.LocalCoefficientSystem R X :=
  (TauCeti.LocalCoefficientSystem.constantFunctor (R := R) X).obj M

end ExistingCoefficients

end

end TauCeti.ShimuraCurve.R18Cohomology
