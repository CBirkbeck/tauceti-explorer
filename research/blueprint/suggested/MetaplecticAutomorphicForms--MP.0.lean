/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These signatures suggest Lean forms so contributors and reviewers
can converge on names and signatures. Proof placeholders are not implementations.
Independent review REV-MetaplecticAutomorphicForms--MP.0: needs_changes.
The report records unresolved carrier/signature contradictions in the advanced
fragments. This file has not been certified to elaborate or agree throughout.
-/
import TauCeti.RepresentationTheory.ProjectiveRepresentation.Extension
import TauCeti.LinearAlgebra.BilinearForm.Isometry
import Mathlib.LinearAlgebra.Matrix.BilinearForm
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Data.ZMod.Basic

import Mathlib.RepresentationTheory.Irreducible
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.RepresentationTheory.Coinvariants
import TauCeti.RepresentationTheory.Continuous.Unitary.Basic
import Mathlib.Analysis.Distribution.SchwartzSpace.Basic
import Mathlib.MeasureTheory.Function.L2Space
import Mathlib.GroupTheory.SemidirectProduct
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.NumberTheory.ModularForms.JacobiTheta.OneVariable
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.Complex.Exponential
import Mathlib.RepresentationTheory.Continuous.Basic
import Mathlib.Analysis.Complex.UpperHalfPlane.Measure
import Mathlib.Algebra.Order.Field.Power
import Mathlib.RingTheory.Artinian.Module
import Mathlib.Analysis.Complex.UpperHalfPlane.MoebiusAction

set_option linter.unusedVariables false

namespace TauCeti.Metaplectic.Heisenberg

open LinearMap (BilinForm)
open Multiplicative
attribute [local instance] TauCeti.trivialMulDistribMulAction

variable {R C W W' W'' : Type*} [CommRing R]
  [AddCommGroup C] [Module R C]
  [AddCommGroup W] [Module R W] [AddCommGroup W'] [Module R W']
  [AddCommGroup W''] [Module R W'']

/-- Bilinear factor set using the native trivial coefficient action. -/
def bilinearFactorSet (B : LinearMap.BilinMap R W C) :
    TauCeti.FactorSet (Multiplicative W) (Multiplicative C) where
  toFun p := ofAdd (B p.1.toAdd p.2.toAdd)
  isMulCocycle₂' := by sorry
  map_one_one' := by sorry

-- The extension carrier, multiplication, exact sequence and central inclusion
-- already belong to TauCeti.FactorSet and are used without new wrappers.
lemma bilinearFactorSet_apply (B : LinearMap.BilinMap R W C) (x y : W) :
    (bilinearFactorSet B (ofAdd x, ofAdd y)).toAdd = B x y := by sorry

lemma bilinearFactorSet_mul_left (B : LinearMap.BilinMap R W C)
    (p q : (bilinearFactorSet B).Extension) :
    (p * q).left.toAdd = p.left.toAdd + q.left.toAdd +
      B p.right.toAdd q.right.toAdd := by sorry

lemma bilinearFactorSet_mul_right (B : LinearMap.BilinMap R W C)
    (p q : (bilinearFactorSet B).Extension) :
    (p * q).right.toAdd = p.right.toAdd + q.right.toAdd := by sorry

lemma bilinearFactorSet_inv (B : LinearMap.BilinMap R W C)
    (p : (bilinearFactorSet B).Extension) :
    p⁻¹ = ⟨ofAdd (-p.left.toAdd + B p.right.toAdd p.right.toAdd),
      ofAdd (-p.right.toAdd)⟩ := by sorry

lemma bilinearFactorSet_commutator (B : LinearMap.BilinMap R W C)
    (p q : (bilinearFactorSet B).Extension) :
    p * q * p⁻¹ * q⁻¹ = (bilinearFactorSet B).inl
      (ofAdd (B p.right.toAdd q.right.toAdd - B q.right.toAdd p.right.toAdd)) := by sorry

lemma bilinearFactorSet_mem_center_iff (B : LinearMap.BilinMap R W C)
    (p : (bilinearFactorSet B).Extension) :
    p ∈ Subgroup.center (bilinearFactorSet B).Extension ↔
      ∀ y : W, B p.right.toAdd y = B y p.right.toAdd := by sorry

lemma halfForm_commutator (B : BilinForm R W) (hB : B.IsAlt) [Invertible (2 : R)]
    (p q : (bilinearFactorSet ((⅟ (2 : R)) • B)).Extension) :
    p * q * p⁻¹ * q⁻¹ = (bilinearFactorSet ((⅟ (2 : R)) • B)).inl
      (ofAdd (B p.right.toAdd q.right.toAdd)) := by sorry

theorem halfForm_center (B : BilinForm R W) (hB : B.IsAlt) (hn : B.Nondegenerate)
    [Invertible (2 : R)] :
    Subgroup.center (bilinearFactorSet ((⅟ (2 : R)) • B)).Extension =
      ((bilinearFactorSet ((⅟ (2 : R)) • B)).inl).range := by sorry

/-- Native bilinear isometries act on the already constructed extensions. -/
def extensionIsometry {B : BilinForm R W} {C : BilinForm R W'}
    (e : B.IsometryEquiv C) :
    (bilinearFactorSet B).Extension ≃* (bilinearFactorSet C).Extension := by sorry

lemma extensionIsometry_apply {B : BilinForm R W} {C : BilinForm R W'}
    (e : B.IsometryEquiv C) (p : (bilinearFactorSet B).Extension) :
    extensionIsometry e p = ⟨p.left, ofAdd (e p.right.toAdd)⟩ := by sorry

lemma extensionIsometry_refl (B : BilinForm R W) :
    extensionIsometry (LinearMap.BilinForm.IsometryEquiv.refl B) = MulEquiv.refl _ := by sorry

lemma extensionIsometry_trans {B : BilinForm R W} {C : BilinForm R W'}
    {D : BilinForm R W''} (e : B.IsometryEquiv C) (f : C.IsometryEquiv D) :
    extensionIsometry (e.trans f) = (extensionIsometry e).trans (extensionIsometry f) := by sorry

lemma extensionIsometry_inl {B : BilinForm R W} {C : BilinForm R W'}
    (e : B.IsometryEquiv C) (t : R) :
    extensionIsometry e ((bilinearFactorSet B).inl (ofAdd t)) =
      (bilinearFactorSet C).inl (ofAdd t) := by sorry

/-- Action homomorphism from the native bilinear isometry group. -/
def extensionIsometryAction (B : BilinForm R W) :
    TauCeti.BilinForm.isometryGroup B →* MulAut (bilinearFactorSet B).Extension := by sorry

lemma extensionIsometryAction_apply (B : BilinForm R W)
    (e : TauCeti.BilinForm.isometryGroup B) (p : (bilinearFactorSet B).Extension) :
    extensionIsometryAction B e p =
      ⟨p.left, ofAdd ((e : W ≃ₗ[R] W) p.right.toAdd)⟩ := by sorry

#check TauCeti.FactorSet.groupExtension
#check TauCeti.FactorSet.rescaleEquiv
#check TauCeti.BilinForm.isometryGroup

lemma polarization_cocycle (B : BilinForm R W) [Invertible (2 : R)] (x y : W) :
    (⅟ (2 : R)) * (B x y - B y x) + (⅟ (2 : R)) * B (x+y) (x+y) =
      B x y + (⅟ (2 : R)) * B x x + (⅟ (2 : R)) * B y y := by sorry

/-- Change from half the alternating form to the polarized bilinear cocycle. -/
def polarizationEquiv (B : BilinForm R W) [Invertible (2 : R)] :
    (bilinearFactorSet ((⅟ (2 : R)) • (B - B.flip))).Extension ≃*
      (bilinearFactorSet B).Extension := by sorry

lemma polarizationEquiv_apply (B : BilinForm R W) [Invertible (2 : R)]
    (p : (bilinearFactorSet ((⅟ (2 : R)) • (B - B.flip))).Extension) :
    polarizationEquiv B p =
      ⟨ofAdd (p.left.toAdd + (⅟ (2 : R)) * B p.right.toAdd p.right.toAdd), p.right⟩ := by sorry

lemma polarizationEquiv_symm_apply (B : BilinForm R W) [Invertible (2 : R)]
    (p : (bilinearFactorSet B).Extension) :
    (polarizationEquiv B).symm p =
      ⟨ofAdd (p.left.toAdd - (⅟ (2 : R)) * B p.right.toAdd p.right.toAdd), p.right⟩ := by sorry

lemma polarizationEquiv_inl (B : BilinForm R W) [Invertible (2 : R)] (t : R) :
    polarizationEquiv B ((bilinearFactorSet ((⅟ (2 : R)) • (B - B.flip))).inl (ofAdd t)) =
      (bilinearFactorSet B).inl (ofAdd t) := by sorry

theorem centralCharacter_multiplicative_iff {A : Type*} [Group A]
    (B : LinearMap.BilinMap R W C) (chi : Multiplicative C →* A) :
    (∀ p q : (bilinearFactorSet B).Extension, chi (p*q).left = chi p.left * chi q.left) ↔
      ∀ x y : W, chi (ofAdd (B x y)) = 1 := by sorry

/-- The character (t,w) ↦ chi(t), with its necessary cocycle condition explicit. -/
def centralCharacter {A : Type*} [Group A] (B : LinearMap.BilinMap R W C)
    (chi : Multiplicative C →* A) (hchi : ∀ x y : W, chi (ofAdd (B x y)) = 1) :
    (bilinearFactorSet B).Extension →* A := by sorry

lemma centralCharacter_apply {A : Type*} [Group A] (B : LinearMap.BilinMap R W C)
    (chi : Multiplicative C →* A) (hchi : ∀ x y : W, chi (ofAdd (B x y)) = 1)
    (p : (bilinearFactorSet B).Extension) : centralCharacter B chi hchi p = chi p.left := by sorry

lemma centralCharacter_inl {A : Type*} [Group A] (B : LinearMap.BilinMap R W C)
    (chi : Multiplicative C →* A) (hchi : ∀ x y : W, chi (ofAdd (B x y)) = 1) (t : C) :
    centralCharacter B chi hchi ((bilinearFactorSet B).inl (ofAdd t)) = chi (ofAdd t) := by sorry

lemma centralCharacter_canonicalSection {A : Type*} [Group A] (B : LinearMap.BilinMap R W C)
    (chi : Multiplicative C →* A) (hchi : ∀ x y : W, chi (ofAdd (B x y)) = 1) (x : W) :
    centralCharacter B chi hchi ((bilinearFactorSet B).canonicalSection (ofAdd x)) = 1 := by sorry

lemma extensionIsometryAction_inl (B : BilinForm R W)
    (e : TauCeti.BilinForm.isometryGroup B) (t : R) :
    extensionIsometryAction B e ((bilinearFactorSet B).inl (ofAdd t)) =
      (bilinearFactorSet B).inl (ofAdd t) := by sorry

lemma extensionIsometryAction_injective (B : BilinForm R W) :
    Function.Injective (extensionIsometryAction B) := by sorry

lemma centralCharacter_unique {A : Type*} [Group A] (B : LinearMap.BilinMap R W C)
    (chi : Multiplicative C →* A) (hchi : ∀ x y : W, chi (ofAdd (B x y)) = 1)
    (rho : (bilinearFactorSet B).Extension →* A)
    (hc : ∀ t : C, rho ((bilinearFactorSet B).inl (ofAdd t)) = chi (ofAdd t))
    (hs : ∀ x : W, rho ((bilinearFactorSet B).canonicalSection (ofAdd x)) = 1) :
    rho = centralCharacter B chi hchi := by sorry

-- Test: bilinearFactorSet_zero. Native zero form gives the untwisted addition law.
example (p q : (bilinearFactorSet (0 : BilinForm ℤ ℤ)).Extension) :
    (p*q).left.toAdd = p.left.toAdd + q.left.toAdd := by sorry

-- Test: bilinearFactorSet_cross. This triangular matrix gives B(e₀,e₁)=1.
example : (bilinearFactorSet (Matrix.toBilin' (!![0,1;0,0] : Matrix (Fin 2) (Fin 2) ℤ))
    (ofAdd ![1,0],ofAdd ![0,1])).toAdd = 1 := by sorry

-- Test: bilinearFactorSet_reversed. The reverse product has a different cocycle.
example : (bilinearFactorSet (Matrix.toBilin' (!![0,1;0,0] : Matrix (Fin 2) (Fin 2) ℤ))
    (ofAdd ![0,1],ofAdd ![1,0])).toAdd = 0 := by sorry

-- Test: extensionIsometry_identity. Test at an actual integer vector.
example : extensionIsometry (LinearMap.BilinForm.IsometryEquiv.refl (0 : BilinForm ℤ ℤ))
    ⟨ofAdd 3,ofAdd 4⟩ = ⟨ofAdd 3,ofAdd 4⟩ := by sorry

-- Test: extensionIsometry_negation. Negation preserves any bilinear form.
example (B : BilinForm ℤ ℤ) :
    let e : B.IsometryEquiv B :=
      { LinearEquiv.neg ℤ with map_app' := by intros; simp }
    extensionIsometry e ⟨ofAdd 3,ofAdd 4⟩ = ⟨ofAdd 3,ofAdd (-4)⟩ := by sorry

-- Test: extensionIsometry_inverse. Different spaces use the existing inverse isometry.
example {B : BilinForm R W} {D : BilinForm R W'}
    (e : B.IsometryEquiv D) (p : (bilinearFactorSet B).Extension) :
    extensionIsometry e.symm (extensionIsometry e p) = p := by sorry

-- Test: extensionIsometryAction_identity. The native group identity fixes concrete data.
example : extensionIsometryAction (0 : BilinForm ℤ ℤ) 1
    ⟨ofAdd 3,ofAdd 4⟩ = ⟨ofAdd 3,ofAdd 4⟩ := by sorry

-- Test: extensionIsometryAction_negation. A nontrivial linear action fixes the center.
example :
    let e : TauCeti.BilinForm.isometryGroup (0 : BilinForm ℤ ℤ) :=
      ⟨LinearEquiv.neg ℤ, by intro x y; simp⟩
    extensionIsometryAction (0 : BilinForm ℤ ℤ) e
      ⟨ofAdd 3,ofAdd 4⟩ = ⟨ofAdd 3,ofAdd (-4)⟩ := by sorry

-- Test: extensionIsometryAction_center. Every isometry fixes the embedded scalar group.
example (B : BilinForm R W) (e : TauCeti.BilinForm.isometryGroup B) (t : R) :
    extensionIsometryAction B e ((bilinearFactorSet B).inl (ofAdd t)) =
      (bilinearFactorSet B).inl (ofAdd t) := by sorry

-- Test: polarizationEquiv_zero. The zero cocycle has no quadratic correction.
example [Invertible (2 : ℚ)] :
    polarizationEquiv (0 : BilinForm ℚ ℚ) ⟨ofAdd 3,ofAdd 4⟩ =
      ⟨ofAdd 3,ofAdd 4⟩ := by sorry

-- Test: polarizationEquiv_cross. q(2,3)=3 for B((x,y),(x′,y′))=xy′.
example [Invertible (2 : ℚ)] :
    polarizationEquiv (Matrix.toBilin' (!![0,1;0,0] : Matrix (Fin 2) (Fin 2) ℚ))
      ⟨ofAdd 0,ofAdd ![2,3]⟩ = ⟨ofAdd 3,ofAdd ![2,3]⟩ := by sorry

-- Test: polarizationEquiv_sign. The inverse correction has the opposite sign.
example [Invertible (2 : ℚ)] :
    (polarizationEquiv (Matrix.toBilin' (!![0,1;0,0] : Matrix (Fin 2) (Fin 2) ℚ))).symm
      ⟨ofAdd 0,ofAdd ![2,3]⟩ = ⟨ofAdd (-3),ofAdd ![2,3]⟩ := by sorry

-- Test: centralCharacter_value. The zero form permits the identity scalar character.
example : centralCharacter (0 : BilinForm ℤ ℤ) (MonoidHom.id _) (by intros; rfl)
    ⟨ofAdd 3,ofAdd 4⟩ = ofAdd 3 := by sorry

-- Test: centralCharacter_trivial. A trivial character works for every bilinear cocycle.
example (B : LinearMap.BilinMap R W C) :
    centralCharacter B (1 : Multiplicative C →* Multiplicative ℤ) (by intros; rfl) = 1 := by sorry

-- Test: centralCharacter_zero. The identity character on the zero form is 1 at identity.
example : centralCharacter (0 : BilinForm ℤ ℤ) (MonoidHom.id _) (by intros; rfl)
    (1 : (bilinearFactorSet (0 : BilinForm ℤ ℤ)).Extension) = 1 := by sorry

-- Acceptance: the half-alternating form has commutator exactly 1 on the standard pair.
example [Invertible (2 : ℚ)] :
    let B := Matrix.toBilin' (!![0,1;-1,0] : Matrix (Fin 2) (Fin 2) ℚ)
    let p : (bilinearFactorSet ((⅟ (2 : ℚ)) • B)).Extension := ⟨ofAdd 0,ofAdd ![1,0]⟩
    let q : (bilinearFactorSet ((⅟ (2 : ℚ)) • B)).Extension := ⟨ofAdd 0,ofAdd ![0,1]⟩
    (p*q*p⁻¹*q⁻¹).left.toAdd = 1 := by sorry

-- Acceptance: the raw bilinear construction still works in characteristic two.
example :
    let B := Matrix.toBilin' (!![0,1;0,0] : Matrix (Fin 2) (Fin 2) (ZMod 2))
    let p : (bilinearFactorSet B).Extension := ⟨ofAdd 0,ofAdd ![1,0]⟩
    let q : (bilinearFactorSet B).Extension := ⟨ofAdd 0,ofAdd ![0,1]⟩
    p*q ≠ q*p := by sorry

-- Acceptance: forgetting the cocycle condition does not give a character.
example :
    let B := Matrix.toBilin' (!![0,1;0,0] : Matrix (Fin 2) (Fin 2) ℤ)
    ¬ (∀ p q : (bilinearFactorSet B).Extension,
      (p*q).left = p.left*q.left) := by sorry

-- Acceptance: nondegeneracy is essential for the center formula.
example : Subgroup.center (bilinearFactorSet (0 : BilinForm ℤ ℤ)).Extension ≠
    ((bilinearFactorSet (0 : BilinForm ℤ ℤ)).inl).range := by sorry

end TauCeti.Metaplectic.Heisenberg


namespace TauCeti.Metaplectic
noncomputable section
open MeasureTheory Module Representation
open scoped TensorProduct SchwartzMap UpperHalfPlane NNReal
attribute [local instance] Classical.propDecidable
attribute [local instance] TauCeti.trivialMulDistribMulAction

section Algebra
variable {F V W G N : Type*} [Field F] [AddCommGroup V] [Module F V]
  [AddCommGroup W] [Module F W] [Group G] [Group N]
open Heisenberg
/- MetaplecticAutomorphicForms:MP.0/topological-heisenberg
The Q₂ product-topology test is generalized to native topological field/module parameters; local compactness and action-group topology require the packet hypotheses. -/
def heisenbergTopology (B : LinearMap.BilinForm F V) [TopologicalSpace F] [TopologicalSpace V] : TopologicalSpace (bilinearFactorSet B).Extension := by sorry
def heisenbergCoordinates (B : LinearMap.BilinForm F V) [TopologicalSpace F] [TopologicalSpace V] : letI := heisenbergTopology B; (bilinearFactorSet B).Extension ≃ₜ F × V := by sorry
lemma heisenberg_continuous_mul (B : LinearMap.BilinForm F V) [TopologicalSpace F] [TopologicalSpace V] [IsTopologicalAddGroup F] [IsTopologicalAddGroup V] (hB : Continuous (fun p : V × V => B p.1 p.2)) : letI := heisenbergTopology B; Continuous (fun p : (bilinearFactorSet B).Extension × (bilinearFactorSet B).Extension => p.1*p.2) := by sorry
lemma heisenberg_continuous_action (B : LinearMap.BilinForm F V) [TopologicalSpace F] [TopologicalSpace V] [TopologicalSpace (TauCeti.BilinForm.isometryGroup B)] (hEval : Continuous (fun p : TauCeti.BilinForm.isometryGroup B × V => (p.1 : V ≃ₗ[F] V) p.2)) : letI := heisenbergTopology B; Continuous (fun p : TauCeti.BilinForm.isometryGroup B × (bilinearFactorSet B).Extension => extensionIsometryAction B p.1 p.2) := by sorry
-- Test: TauCeti.Metaplectic.heisenbergTopology_zero
example : let B : LinearMap.BilinForm ℝ (Fin 0 → ℝ) := 0; letI := heisenbergTopology B; (bilinearFactorSet B).Extension ≃ₜ ℝ := by sorry
-- Test: TauCeti.Metaplectic.heisenbergTopology_q2
example (B : LinearMap.BilinForm F V) [TopologicalSpace F] [TopologicalSpace V] [IsTopologicalAddGroup F] [IsTopologicalAddGroup V] (hB : Continuous (fun p : V × V => B p.1 p.2)) : letI := heisenbergTopology B; Nonempty ((bilinearFactorSet B).Extension ≃ₜ F × V) ∧ Continuous (fun p : (bilinearFactorSet B).Extension × (bilinearFactorSet B).Extension => p.1*p.2) := by sorry
-- Test: TauCeti.Metaplectic.heisenbergTopology_projection
example (B : LinearMap.BilinForm F V) [TopologicalSpace F] [TopologicalSpace V] [T2Space F] [T2Space V] : letI := heisenbergTopology B; Topology.IsClosedEmbedding (fun t : F => (bilinearFactorSet B).inl (Multiplicative.ofAdd t)) ∧ Continuous (fun p : (bilinearFactorSet B).Extension => p.right.toAdd) ∧ IsOpenMap (fun p : (bilinearFactorSet B).Extension => p.right.toAdd) ∧ Function.Surjective (fun p : (bilinearFactorSet B).Extension => p.right.toAdd) := by sorry
/- MetaplecticAutomorphicForms:MP.0/heisenberg-haar
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem heisenberg_haar (B : LinearMap.BilinForm F V) [MeasurableSpace F] [MeasurableSpace V] [MeasurableSpace (bilinearFactorSet B).Extension] (μ : Measure F) (ν : Measure V) (p : (bilinearFactorSet B).Extension) : Measure.map (fun q : (bilinearFactorSet B).Extension => p*q) (Measure.map (fun x : F × V => ⟨Multiplicative.ofAdd x.1,Multiplicative.ofAdd x.2⟩) (μ.prod ν)) = Measure.map (fun x : F × V => (⟨Multiplicative.ofAdd x.1,Multiplicative.ofAdd x.2⟩ : (bilinearFactorSet B).Extension)) (μ.prod ν) := by sorry
def schroedingerFormula (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F)
    (t : F) (x : V) (y : W) (φ : V → ℂ) (u : V) : ℂ :=
  (ψ (Multiplicative.ofAdd (t+B u y+(2:F)⁻¹*B x y)) : ℂ)*φ(u+x)
/- MetaplecticAutomorphicForms:MP.0/schroedinger-model
Function-space action fragment. The requested local Schwartz carrier, Schwartz preservation and actual L² descent are not replaced by arbitrary structure fields; the unitarity signature takes the resulting native Hilbert action. -/
def schroedinger (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (t : F) (x : V) (y : W) : (V → ℂ) →ₗ[ℂ] (V → ℂ) := by sorry
lemma schroedinger_apply (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (t : F) (x : V) (y : W) (φ : V → ℂ) (u : V) : schroedinger ψ B t x y φ u = schroedingerFormula ψ B t x y φ u := by sorry
lemma schroedinger_center (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (t : F) (φ : V → ℂ) : schroedinger ψ B t 0 0 φ = (ψ (Multiplicative.ofAdd t) : ℂ) • φ := by sorry
lemma schroedinger_mul (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (t s : F) (x a : V) (y b : W) (h2 : (2:F) ≠ 0) : (schroedinger ψ B t x y).comp (schroedinger ψ B s a b) = schroedinger ψ B (t+s+(2:F)⁻¹*(B x b-B a y)) (x+a) (y+b) := by sorry
lemma schroedinger_isUnitary (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℂ H] (ρ : ContRepresentation ℂ N H) : TauCeti.ContRepresentation.IsUnitary ρ := by sorry
-- Test: TauCeti.Metaplectic.schroedinger_zero
example (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (t : F) (φ : V → ℂ) : schroedinger ψ B t 0 0 φ = (ψ (Multiplicative.ofAdd t) : ℂ) • φ := by sorry
-- Test: TauCeti.Metaplectic.schroedinger_translation
example (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (x u : V) (φ : V → ℂ) : schroedinger ψ B 0 x 0 φ u = φ(u+x) := by sorry
-- Test: TauCeti.Metaplectic.schroedinger_modulation
example (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (y : W) (u : V) (φ : V → ℂ) : schroedinger ψ B 0 0 y φ u = (ψ (Multiplicative.ofAdd (B u y)) : ℂ)*φ u := by sorry
-- Test: TauCeti.Metaplectic.schroedinger_commutator
example (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (x : V) (y : W) (h2 : (2:F) ≠ 0) : (schroedinger ψ B 0 x 0).comp (schroedinger ψ B 0 0 y) = (ψ (Multiplicative.ofAdd (B x y)) : ℂ) • ((schroedinger ψ B 0 0 y).comp (schroedinger ψ B 0 x 0)) := by sorry
/- MetaplecticAutomorphicForms:MP.0/induced-schroedinger
Section-evaluation/covariance fragment. The subtype states an explicit equation, not a placeholder Prop field. Smooth compact induction and its support condition await SR.2; the dyadic obstruction is expressed on its rational half argument. -/
def inducedSchroedingerEquiv (ψ : Multiplicative F →* ℂˣ) : {f : F × V → ℂ // ∀ t u, f (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*f (0,u)} ≃ (V → ℂ) := by sorry
lemma inducedSchroedingerEquiv_apply (ψ : Multiplicative F →* ℂˣ) (f : {f : F × V → ℂ // ∀ t u, f (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*f (0,u)}) (u : V) : inducedSchroedingerEquiv ψ f u = f.val (0,u) := by sorry
lemma inducedSchroedingerEquiv_covariance (ψ : Multiplicative F →* ℂˣ) (φ : V → ℂ) (t : F) (u : V) : (inducedSchroedingerEquiv ψ).symm φ |>.val (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*φ u := by sorry
lemma inducedSchroedingerEquiv_intertwines (ψ : Multiplicative F →* ℂˣ) (translation : N → {f : F × V → ℂ // ∀ t u, f (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*f (0,u)} → {f : F × V → ℂ // ∀ t u, f (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*f (0,u)}) (ρ : Representation ℂ N (V → ℂ)) (n : N) (f : {f : F × V → ℂ // ∀ t u, f (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*f (0,u)}) : inducedSchroedingerEquiv ψ (translation n f) = ρ n (inducedSchroedingerEquiv ψ f) := by sorry
-- Test: TauCeti.Metaplectic.inducedSchroedingerEquiv_zero
example (ψ : Multiplicative F →* ℂˣ) (φ : V → ℂ) : (inducedSchroedingerEquiv ψ).symm φ |>.val (0,0) = φ 0 := by sorry
-- Test: TauCeti.Metaplectic.inducedSchroedingerEquiv_indicator
example (ψ : Multiplicative F →* ℂˣ) (L : Set V) [DecidablePred (· ∈ L)] : inducedSchroedingerEquiv ψ ((inducedSchroedingerEquiv ψ).symm (L.indicator (fun _ => 1))) = L.indicator (fun _ => 1) := by sorry
-- Test: TauCeti.Metaplectic.inducedSchroedingerEquiv_dyadic
example (ψ : Multiplicative ℚ →* ℂˣ) (h : ψ (Multiplicative.ofAdd (1/2)) = -1) : ψ (Multiplicative.ofAdd (1/2)) ≠ 1 := by sorry
end Algebra
section Hilbert
variable {G N H K : Type*} [Group G] [Group N] [TopologicalSpace N]
 [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
 [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
/- MetaplecticAutomorphicForms:MP.0/hilbert-schroedinger
H denotes the actual L² space after supplier instantiation; this fragment does not manufacture a Hilbert space or assert every ContRepresentation is strongly continuous. L² null representatives are equal vectors. -/
def hilbertSchroedinger : ContRepresentation ℂ N H := by sorry
lemma hilbertSchroedinger_norm (h : N) (v : H) : ‖(hilbertSchroedinger : ContRepresentation ℂ N H) h v‖ = ‖v‖ := by sorry
lemma hilbertSchroedinger_schwartz (S : Type*) [AddCommGroup S] [Module ℂ S] (ρ : Representation ℂ N S) (i : S →ₗ[ℂ] H) (h : N) (φ : S) : i (ρ h φ) = (hilbertSchroedinger : ContRepresentation ℂ N H) h (i φ) := by sorry
lemma hilbertSchroedinger_stronglyContinuous (v : H) : Continuous (fun h : N => (hilbertSchroedinger : ContRepresentation ℂ N H) h v) := by sorry
-- Test: TauCeti.Metaplectic.hilbertSchroedinger_zero
example (ψ : N →* ℂˣ) (h : N) (z : ℂ) : (hilbertSchroedinger : ContRepresentation ℂ N ℂ) h z = (ψ h : ℂ)*z := by sorry
-- Test: TauCeti.Metaplectic.hilbertSchroedinger_gaussian
example (x : ℝ) : (∫ u : ℝ, ‖Complex.exp (-Real.pi * ((u+x)^2 : ℝ))‖^2) = ∫ u : ℝ, ‖Complex.exp (-Real.pi * (u^2 : ℝ))‖^2 := by sorry
-- Test: TauCeti.Metaplectic.hilbertSchroedinger_ae
example (h : N) (v w : H) (hvw : v = w) : (hilbertSchroedinger : ContRepresentation ℂ N H) h v = (hilbertSchroedinger : ContRepresentation ℂ N H) h w := by sorry
/- MetaplecticAutomorphicForms:MP.0/smooth-vectors
Real one-dimensional Schrödinger specialization, using all three Heisenberg coordinates (t,x,y). H is the actual L² space, i its Schwartz injection and orbit its strongly continuous Schrödinger action; those supplier identifications are omitted. Smoothness of a single translation or central orbit is insufficient. -/
theorem oscillator_smoothVectors (i : SchwartzMap ℝ ℂ →ₗ[ℂ] H) (orbit : (ℝ × ℝ × ℝ) → H → H) (v : H) : (∃ φ, i φ = v) ↔ ContDiff ℝ ∞ (fun p => orbit p v) := by sorry
/- MetaplecticAutomorphicForms:MP.1/unitary-stone-von-neumann
Irreducibility, shared nontrivial central character and strong group continuity are required in the packet; missing category predicates are omitted here. -/
theorem unitary_stoneVonNeumann (ρ : ContRepresentation ℂ N H) (σ : ContRepresentation ℂ N K) : ∃ e : H ≃ₗᵢ[ℂ] K, ∀ n v, e (ρ n v) = σ n (e v) := by sorry
/- MetaplecticAutomorphicForms:MP.1/scalar-normalizer-extension
Native subgroup of symplectic-action × unitary operators. The strong operator topology, exact kernel and nonsplitting tests require the source hypotheses; the nonsplitting fragment is meaningful only after the normalized μ₂ restriction. -/
def scalarNormalizer (act : G →* MulAut N) (ρ : ContRepresentation ℂ N H) : Subgroup (G × ↥(unitary (H →L[ℂ] H))) := by sorry
def scalarNormalizer_projection (act : G →* MulAut N) (ρ : ContRepresentation ℂ N H) : scalarNormalizer act ρ →* G := by sorry
lemma scalarNormalizer_covariance (act : G →* MulAut N) (ρ : ContRepresentation ℂ N H) (p : scalarNormalizer act ρ) (n : N) (v : H) : p.val.2.val (ρ n v) = ρ (act p.val.1 n) (p.val.2.val v) := by sorry
def scalarNormalizer_oscillator (act : G →* MulAut N) (ρ : ContRepresentation ℂ N H) : scalarNormalizer act ρ →* ↥(unitary (H →L[ℂ] H)) := by sorry
-- Test: TauCeti.Metaplectic.scalarNormalizer_zero
example [Subsingleton G] (act : G →* MulAut N) (ρ : ContRepresentation ℂ N H) (p : scalarNormalizer act ρ) : ∃! z : ℂ, ‖z‖ = 1 ∧ ∀ v, p.val.2.val v = z • v := by sorry
-- Test: TauCeti.Metaplectic.scalarNormalizer_kernel
example (act : G →* MulAut N) (ρ : ContRepresentation ℂ N H) (p : scalarNormalizer act ρ) (hp : p.val.1 = 1) : ∃! z : ℂ, ∀ v, p.val.2.val v = z • v := by sorry
-- Test: TauCeti.Metaplectic.scalarNormalizer_nonsplitting
example (act : G →* MulAut N) (ρ : ContRepresentation ℂ N H) [TopologicalSpace G] [TopologicalSpace (scalarNormalizer act ρ)] (pr : scalarNormalizer act ρ →* G) : ¬ ∃ s : G →* scalarNormalizer act ρ, Continuous s ∧ pr.comp s = MonoidHom.id G := by sorry
/- MetaplecticAutomorphicForms:MP.1/metaplectic-double-cover
Intrinsic ker λ₂, using a native subgroup. λ₂’s construction, transport to Rao coordinates, topology and the real nonsplitting hypotheses remain explicit in the packet. -/
def metaplecticCover (S : Type*) [Group S] (λ₂ : S →* ℂˣ) : Subgroup S := by sorry
lemma metaplecticCover_kernel (S : Type*) [Group S] (λ₂ : S →* ℂˣ) (s : S) : s ∈ metaplecticCover S λ₂ ↔ λ₂ s = 1 := by sorry
def metaplecticCover_toNormalizer (S : Type*) [Group S] (λ₂ : S →* ℂˣ) : metaplecticCover S λ₂ →* S := by sorry
def metaplecticCover_coboundary (S : Type*) [Group S] (λ₂ μ₂ : S →* ℂˣ) (e : S ≃* S) (h : ∀ s, μ₂ (e s) = λ₂ s) : metaplecticCover S λ₂ ≃* metaplecticCover S μ₂ := by sorry
-- Test: TauCeti.Metaplectic.metaplecticCover_zero
example (z : ℂˣ) : z ∈ metaplecticCover ℂˣ (show ℂˣ →* ℂˣ from {toFun := fun z => z^2,map_one' := by sorry,map_mul' := by sorry}) ↔ z^2 = 1 := by sorry
-- Test: TauCeti.Metaplectic.metaplecticCover_complex
example (S : Type*) [Group S] (λ₂ : S →* ℂˣ) : metaplecticCover S λ₂ ≃* G × ↥(rootsOfUnity 2 ℂ) := by sorry
-- Test: TauCeti.Metaplectic.metaplecticCover_real
example (S : Type*) [Group S] (λ₂ : S →* ℂˣ) [TopologicalSpace G] [TopologicalSpace (metaplecticCover S λ₂)] (pr : metaplecticCover S λ₂ →* G) : ¬ ∃ s : G →* metaplecticCover S λ₂, Continuous s ∧ pr.comp s = MonoidHom.id G := by sorry
/- MetaplecticAutomorphicForms:MP.1/genuine-oscillator
Restriction of the actual normalizer oscillator to ker λ₂. z denotes its distinguished central −1 in the genuine API and tests, and the zero-space specialization has carrier ℂ. Those central and carrier identifications, normalized λ₂, strong continuity and local-field hypotheses are omitted until the packet suppliers are available. -/
def weilRepresentation (S : Type*) [Group S] (λ₂ : S →* ℂˣ) (ω : S →* ↥(unitary (H →L[ℂ] H))) : metaplecticCover S λ₂ →* ↥(unitary (H →L[ℂ] H)) := by sorry
lemma weilRepresentation_apply (S : Type*) [Group S] (λ₂ : S →* ℂˣ) (ω : S →* ↥(unitary (H →L[ℂ] H))) (g : metaplecticCover S λ₂) : weilRepresentation S λ₂ ω g = ω g.val := by sorry
lemma weilRepresentation_central (S : Type*) [Group S] (λ₂ : S →* ℂˣ) (ω : S →* ↥(unitary (H →L[ℂ] H))) (z : metaplecticCover S λ₂) (v : H) : (weilRepresentation S λ₂ ω z).val v = -v := by sorry
lemma weilRepresentation_modelChange (e : H ≃ₗᵢ[ℂ] K) (ρ : ContRepresentation ℂ G H) (σ : ContRepresentation ℂ G K) : ∀ g v, e (ρ g v) = σ g (e v) := by sorry
-- Test: TauCeti.Metaplectic.weilRepresentation_zero
example (S : Type*) [Group S] (λ₂ : S →* ℂˣ) (ω : S →* ↥(unitary (ℂ →L[ℂ] ℂ))) (z : metaplecticCover S λ₂) (v : ℂ) : (weilRepresentation S λ₂ ω z).val v = -v := by sorry
-- Test: TauCeti.Metaplectic.weilRepresentation_genuine
example (S : Type*) [Group S] (λ₂ : S →* ℂˣ) (ω : S →* ↥(unitary (H →L[ℂ] H))) (z g : metaplecticCover S λ₂) (v : H) (hv : v ≠ 0) : (weilRepresentation S λ₂ ω (z*g)).val v = -(weilRepresentation S λ₂ ω g).val v ∧ (weilRepresentation S λ₂ ω (z*g)).val v ≠ (weilRepresentation S λ₂ ω g).val v := by sorry
-- Test: TauCeti.Metaplectic.weilRepresentation_identity
example (S : Type*) [Group S] (λ₂ : S →* ℂˣ) (ω : S →* ↥(unitary (H →L[ℂ] H))) : weilRepresentation S λ₂ ω 1 = 1 := by sorry
end Hilbert
section WeilIndex
variable {F V G : Type*} [Field F] [AddCommGroup V] [Module F V] [Group G]
/- MetaplecticAutomorphicForms:MP.2/weil-index
Distribution identity fragment; FT is the supplier’s distributional transform, a is the signed-polar determinant modulus and h its inverse. The dyadic test requires the packet’s Q₂ character and lattice quotient, omitted from this generic native signature. -/
def weilIndex (ψ : Multiplicative F →* ℂˣ) (q : QuadraticMap F V F) : ℂˣ := by sorry
lemma weilIndex_distribution (ψ : Multiplicative F →* ℂˣ) (q : QuadraticMap F V F) (FT : (V → ℂ) →ₗ[ℂ] (V → ℂ)) (h : V → V) (a : ℂ) (y : V) : FT (fun x => (ψ (Multiplicative.ofAdd (q x)) : ℂ)) y = (weilIndex ψ q : ℂ)*a*(ψ (Multiplicative.ofAdd (-q (h y))) : ℂ) := by sorry
lemma weilIndex_norm (ψ : Multiplicative F →* ℂˣ) (q : QuadraticMap F V F) : ‖(weilIndex ψ q : ℂ)‖ = 1 := by sorry
lemma weilIndex_isometry (ψ : Multiplicative F →* ℂˣ) (q q' : QuadraticMap F V F) (e : V ≃ₗ[F] V) (h : ∀ v, q' (e v) = q v) : weilIndex ψ q' = weilIndex ψ q := by sorry
lemma weilIndex_gaussSum (ψ : Multiplicative F →* ℂˣ) (q : QuadraticMap F V F) (T : Finset V) (volume : ℝ) : ∃ a : ℝ, 0 < a ∧ (weilIndex ψ q : ℂ) = a * (volume : ℂ) * ∑ x ∈ T, (ψ (Multiplicative.ofAdd (q x)) : ℂ) := by sorry
-- Test: TauCeti.Metaplectic.weilIndex_zero
example (ψ : Multiplicative F →* ℂˣ) (q : QuadraticMap F (Fin 0 → F) F) : weilIndex ψ q = 1 := by sorry
-- Test: TauCeti.Metaplectic.weilIndex_real
example (ψ : Multiplicative ℝ →* ℂˣ) (q : QuadraticMap ℝ ℝ ℝ) (a : ℝ) (ha : a ≠ 0) (hq : ∀ x, q x = a*x^2) : (weilIndex ψ q : ℂ) = Complex.exp (Complex.I * Real.pi * (SignType.sign a : ℝ)/4) := by sorry
-- Test: TauCeti.Metaplectic.weilIndex_q2
example (ψ : Multiplicative F →* ℂˣ) (q : QuadraticMap F V F) : (weilIndex ψ q : ℂ) = (1-Complex.I)/(Real.sqrt 2 : ℂ) := by sorry
-- Test: TauCeti.Metaplectic.weilIndex_hyperbolic
example (ψ : Multiplicative F →* ℂˣ) (q : QuadraticMap F (F × F) F) (hq : ∀ p, q p = p.1*p.2) : weilIndex ψ q = 1 := by sorry
/- MetaplecticAutomorphicForms:MP.2/weil-index-identities
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem weilIndex_hilbertSymbol (γ : Fˣ → ℂˣ) (hilbert : Fˣ → Fˣ → ℂˣ) (a b : Fˣ) : γ (a*b) = hilbert a b * γ a * γ b := by sorry
/- MetaplecticAutomorphicForms:MP.2/leray-form
Transverse graph q=½ω(y,Ty); the general triple requires the native perpendicular-quotient bridge. In the reduction API D and R are the source reduction domain and radical, and reducedForm is the constructed transverse quotient form. Descent and source identification remain omitted supplier conditions. The quotient example checks a native image under the quotient map, avoiding a quotient by R outside its domain. -/
def lerayForm (ω : LinearMap.BilinForm F V) (T : V →ₗ[F] V) : QuadraticMap F V F := by sorry
lemma lerayForm_graph (ω : LinearMap.BilinForm F V) (T : V →ₗ[F] V) (y : V) : lerayForm ω T y = (2:F)⁻¹ * ω y (T y) := by sorry
lemma lerayForm_isometry (ω ω' : LinearMap.BilinForm F V) (T T' : V →ₗ[F] V) (e : V ≃ₗ[F] V) (hω : ∀ x y, ω' x y = ω (e x) (e y)) (hT : ∀ y, e (T' y) = T (e y)) (y : V) : lerayForm ω' T' y = lerayForm ω T (e y) := by sorry
lemma lerayForm_reduction (ω : LinearMap.BilinForm F V) (T : V →ₗ[F] V) (D : Submodule F V) (R : Submodule F D) (reducedForm : QuadraticMap F (D ⧸ R) F) (y : D) : reducedForm (R.mkQ y) = lerayForm ω T y.val := by sorry
-- Test: TauCeti.Metaplectic.lerayForm_repeated
example (ω : LinearMap.BilinForm F V) : lerayForm ω (0 : V →ₗ[F] V) = 0 := by sorry
-- Test: TauCeti.Metaplectic.lerayForm_rankOne
example (ω : LinearMap.BilinForm F F) (h : ∀ x y, ω x y = -x*y) (x : F) : lerayForm ω LinearMap.id x = -(2:F)⁻¹*x^2 := by sorry
-- Test: TauCeti.Metaplectic.lerayForm_quotient
example (L R : Submodule F V) : Submodule.map R.mkQ (L ⊓ R) = ⊥ := by sorry
/- MetaplecticAutomorphicForms:MP.2/leray-cocycle
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem leray_cocycle (c : G → G → ℂˣ) (g h k : G) : c g h * c (g*h) k = c g (h*k) * c h k := by sorry
/- MetaplecticAutomorphicForms:MP.1/rao-factor-set
Native factor-set target; j,x,Leray,Hasse and corrected t(t−1)/2 formulas are specified in the packet. The rank-one and Levi tests below expose the Hilbert-symbol formulas only; full Bruhat coordinate bridges are gaps. -/
def raoFactorSet (x : G → Fˣ) (j : G → ℕ) (hilbert : Fˣ → Fˣ → ↥(rootsOfUnity 2 ℂ)) : TauCeti.FactorSet G ↥(rootsOfUnity 2 ℂ) := by sorry
lemma raoFactorSet_values (x : G → Fˣ) (j : G → ℕ) (hilbert : Fˣ → Fˣ → ↥(rootsOfUnity 2 ℂ)) (g h : G) : ((raoFactorSet x j hilbert (g,h)).val : ℂ)^2 = 1 := by sorry
lemma raoFactorSet_cocycle (x : G → Fˣ) (j : G → ℕ) (hilbert : Fˣ → Fˣ → ↥(rootsOfUnity 2 ℂ)) (g h k : G) : raoFactorSet x j hilbert (g,h) * raoFactorSet x j hilbert (g*h,k) = raoFactorSet x j hilbert (g,h*k) * raoFactorSet x j hilbert (h,k) := by sorry
lemma raoFactorSet_beta (β : G → ℂˣ) (c r : G → G → ℂˣ) (g h : G) : c g h = β (g*h)/(β g*β h)*r g h := by sorry
-- Test: TauCeti.Metaplectic.raoFactorSet_identity
example (x : G → Fˣ) (j : G → ℕ) (hilbert : Fˣ → Fˣ → ↥(rootsOfUnity 2 ℂ)) (g : G) : raoFactorSet x j hilbert (1,g) = 1 := by sorry
-- Test: TauCeti.Metaplectic.raoFactorSet_rankOne
example (hilbert : Fˣ → Fˣ → ℂˣ) (rankOneCocycle : Fˣ → Fˣ → Fˣ → ℂˣ) (x₁ x₂ x₁₂ : Fˣ) : rankOneCocycle x₁ x₂ x₁₂ = hilbert x₁ x₂ * hilbert (-x₁*x₂) x₁₂ := by sorry
-- Test: TauCeti.Metaplectic.raoFactorSet_levi
example (hilbert leviCocycle : Fˣ → Fˣ → ℂˣ) (a b : Fˣ) : leviCocycle a b = hilbert a b := by sorry
/- MetaplecticAutomorphicForms:MP.2/generator-operators
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem weil_generators (ψ : Multiplicative F →* ℂˣ) (q : QuadraticMap F V F) (r : (V → ℂ) →ₗ[ℂ] (V → ℂ)) (φ : V → ℂ) (x : V) : r φ x = (ψ (Multiplicative.ofAdd (q x)) : ℂ)*φ x := by sorry
/- MetaplecticAutomorphicForms:MP.2/operator-relations
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem weil_generatorRelations (FT : (V → ℂ) →ₗ[ℂ] (V → ℂ)) (γ : ℂ) (φ : V → ℂ) (x : V) : FT (FT φ) x = γ * φ (-x) := by sorry
/- MetaplecticAutomorphicForms:MP.2/character-and-dual
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem weil_characterChange (z : ℂˣ) : z*z*(z^2)⁻¹ = 1 ∧ z⁻¹*z^2 = z := by sorry
/- MetaplecticAutomorphicForms:MP.2/quadratic-uncertainty
Native support conclusion with valuation(0)=top, so isotropic points are retained. The actual nonarchimedean valuation, nondegenerate quadratic/Hermitian datum, self-dual Fourier transform and local-field hypotheses are required by the packet. No statement for arbitrary FT or valuation is claimed. -/
theorem weil_quadraticUncertainty [Nontrivial V] (q : QuadraticMap F V F) (valuation : F → WithTop ℤ) (FT : (V → ℂ) →ₗ[ℂ] (V → ℂ)) (φ : V → ℂ) (h : Function.support φ ⊆ {x | 0 < valuation (q x)}) (hh : Function.support (FT φ) ⊆ {x | 0 ≤ valuation (q x)}) : φ = 0 := by sorry
/- MetaplecticAutomorphicForms:MP.2/hermitian-uncertainty
Native support conclusion with valuation(0)=top, so isotropic points are retained. The actual nonarchimedean valuation, nondegenerate quadratic/Hermitian datum, self-dual Fourier transform and local-field hypotheses are required by the packet. No statement for arbitrary FT or valuation is claimed. -/
theorem weil_hermitianUncertainty [Nontrivial V] (q : QuadraticMap F V F) (valuation : F → WithTop ℤ) (FT : (V → ℂ) →ₗ[ℂ] (V → ℂ)) (φ : V → ℂ) (h : Function.support φ ⊆ {x | 0 < valuation (q x)}) (hh : Function.support (FT φ) ⊆ {x | 0 ≤ valuation (q x)}) : φ = 0 := by sorry
/- MetaplecticAutomorphicForms:MP.2/hermitian-operator-normalizations
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem weil_hermitianNormalizations (FT : (V → ℂ) →ₗ[ℂ] (V → ℂ)) (φ : V → ℂ) (x : V) : FT (FT φ) x = φ (-x) := by sorry
end WeilIndex
section LocalTheta
variable {F V W G H : Type*} [Field F] [AddCommGroup V] [Module F V]
 [AddCommGroup W] [Module F W] [Group G] [Group H]
/- MetaplecticAutomorphicForms:MP.3/orthogonal-symplectic-dual-pair
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def orthogonalSymplecticEmbedding (b : LinearMap.BilinForm F V) (ω : LinearMap.BilinForm F W) : (TauCeti.BilinForm.isometryGroup b × TauCeti.BilinForm.isometryGroup ω) →* (V ⊗[F] W ≃ₗ[F] V ⊗[F] W) := by sorry
def tensorSymplecticForm (b : LinearMap.BilinForm F V) (ω : LinearMap.BilinForm F W) : LinearMap.BilinForm F (V ⊗[F] W) := by sorry
lemma dualPair_commute (b : LinearMap.BilinForm F V) (ω : LinearMap.BilinForm F W) (g : TauCeti.BilinForm.isometryGroup b) (h : TauCeti.BilinForm.isometryGroup ω) : orthogonalSymplecticEmbedding b ω (g,1) * orthogonalSymplecticEmbedding b ω (1,h) = orthogonalSymplecticEmbedding b ω (1,h) * orthogonalSymplecticEmbedding b ω (g,1) := by sorry
lemma dualPair_kernel (b : LinearMap.BilinForm F V) (ω : LinearMap.BilinForm F W) (g : TauCeti.BilinForm.isometryGroup b) (h : TauCeti.BilinForm.isometryGroup ω) : orthogonalSymplecticEmbedding b ω (g,h) = 1 ↔ ∃ a : Fˣ, (∀ v, (g : V ≃ₗ[F] V) v = (a:F) • v) ∧ ∀ w, (h : W ≃ₗ[F] W) w = (a⁻¹:Fˣ) • w := by sorry
-- Test: TauCeti.Metaplectic.dualPair_line
example (b : LinearMap.BilinForm F F) (ω : LinearMap.BilinForm F W) (h : TauCeti.BilinForm.isometryGroup ω) (w : W) : orthogonalSymplecticEmbedding b ω (1,h) (1 ⊗ₜ[F] w) = 1 ⊗ₜ[F] ((h : W ≃ₗ[F] W) w) := by sorry
-- Test: TauCeti.Metaplectic.dualPair_zero
example (b : LinearMap.BilinForm F V) (ω : LinearMap.BilinForm F W) [Subsingleton V] : ∀ g, orthogonalSymplecticEmbedding b ω g = 1 := by sorry
-- Test: TauCeti.Metaplectic.dualPair_minus
example (v : V) (w : W) : (-v) ⊗ₜ[F] (-w) = v ⊗ₜ[F] w := by sorry
end LocalTheta
section ComplexTheta
variable {G H V W U : Type*} [Group G] [Group H] [AddCommGroup V] [Module ℂ V] [AddCommGroup W] [Module ℂ W] [AddCommGroup U] [Module ℂ U]
/- MetaplecticAutomorphicForms:MP.1/smooth-stone-von-neumann
Native representation equivalence; smooth irreducible nontrivial central-character conditions await SR.0/3 and remain mandatory in the packet. -/
theorem smooth_stoneVonNeumann (ρ : Representation ℂ G V) (σ : Representation ℂ G W) : Nonempty (Representation.Equiv ρ σ) := by sorry
/- MetaplecticAutomorphicForms:MP.1/intertwiner-lines
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem intertwinerLine_dim (ρ : Representation ℂ G V) (σ : Representation ℂ G W) : Module.finrank ℂ (IntertwiningMap ρ σ) = 1 := by sorry
/- MetaplecticAutomorphicForms:MP.3/big-theta-module
Algebraic tensor coinvariant adapter, defined as a type synonym of native Coinvariants. πdual is the SR.3 smooth dual, with a commuting H-action on the tensor product. In the isotypic API P is the actual π carrier and kernel the maximal π-isotypic kernel. The algebraic universal-map API omits H-equivariance and the smooth-dual adjunction; both remain mandatory before using the full source Hom comparison. -/
abbrev bigTheta (ρ : Representation ℂ G V) (πdual : Representation ℂ G W) : Type _ := Representation.Coinvariants (ρ.tprod πdual)
def bigTheta_hom (ρ : Representation ℂ G V) (πdual : Representation ℂ G W) : (bigTheta ρ πdual →ₗ[ℂ] U) ≃ {f : V ⊗[ℂ] W →ₗ[ℂ] U // ∀ g x, f ((ρ.tprod πdual) g x) = f x} := by sorry
lemma bigTheta_equivariant (ρ : Representation ℂ G V) (πdual : Representation ℂ G W) (σ : Representation ℂ H (V ⊗[ℂ] W)) (h : H) (g : G) (x : V ⊗[ℂ] W) : Representation.Coinvariants.mk (ρ.tprod πdual) (σ h ((ρ.tprod πdual) g x-x)) = 0 := by sorry
def bigTheta_isotypic (ρ : Representation ℂ G V) (πdual : Representation ℂ G W) (P : Type*) [AddCommGroup P] [Module ℂ P] (kernel : Submodule ℂ V) : (V ⧸ kernel) ≃ₗ[ℂ] P ⊗[ℂ] bigTheta ρ πdual := by sorry
-- Test: TauCeti.Metaplectic.bigTheta_character_mismatch
example (ρ : Representation ℂ G V) (πdual : Representation ℂ G W) (g : G) (a : ℂ) (ha : a ≠ 1) (hact : ∀ x, (ρ.tprod πdual) g x = a • x) : Subsingleton (bigTheta ρ πdual) := by sorry
-- Test: TauCeti.Metaplectic.bigTheta_trivial_factor
example (ρ : Representation ℂ G V) (πdual : Representation ℂ G ℂ) [Subsingleton G] : bigTheta ρ πdual ≃ₗ[ℂ] V := by sorry
-- Test: TauCeti.Metaplectic.bigTheta_quotient
example (ρ : Representation ℂ G V) (πdual : Representation ℂ G W) (f : V ⊗[ℂ] W →ₗ[ℂ] U) (hf : ∀ g x, f ((ρ.tprod πdual) g x) = f x) : ∃! q : bigTheta ρ πdual →ₗ[ℂ] U, q.comp (Representation.Coinvariants.mk (ρ.tprod πdual)) = f := by sorry
/- MetaplecticAutomorphicForms:MP.3/small-theta-module
Quotient by the native radical supplied by the finite-length smooth category. This signature neither defines the radical by an assumed Prop field nor asserts semisimplicity for an arbitrary quotient. -/
abbrev smallTheta (T : Type*) [AddCommGroup T] [Module ℂ T] (radical : Submodule ℂ T) : Type _ := T ⧸ radical
lemma smallTheta_projection (T : Type*) [AddCommGroup T] [Module ℂ T] (radical : Submodule ℂ T) : Function.Surjective radical.mkQ := by sorry
lemma smallTheta_semisimple (T : Type*) [AddCommGroup T] [Module ℂ T] (radical : Submodule ℂ T) (quotientAction : Representation ℂ H (T ⧸ radical)) : IsSemisimpleModule (MonoidAlgebra ℂ H) quotientAction.asModule := by sorry
lemma smallTheta_factor (T : Type*) [AddCommGroup T] [Module ℂ T] (radical : Submodule ℂ T) (f : T →ₗ[ℂ] U) (hf : radical ≤ LinearMap.ker f) : ∃! g : (T ⧸ radical) →ₗ[ℂ] U, g.comp radical.mkQ = f := by sorry
-- Test: TauCeti.Metaplectic.smallTheta_zero
example (T : Type*) [AddCommGroup T] [Module ℂ T] [Subsingleton T] (radical : Submodule ℂ T) : Subsingleton (T ⧸ radical) := by sorry
-- Test: TauCeti.Metaplectic.smallTheta_simple
example (T : Type*) [AddCommGroup T] [Module ℂ T] : (T ⧸ (⊥ : Submodule ℂ T)) ≃ₗ[ℂ] T := by sorry
-- Test: TauCeti.Metaplectic.smallTheta_extension
example (T : Type*) [AddCommGroup T] [Module ℂ T] (radical : Submodule ℂ T) (g : T →ₗ[ℂ] U) (hg : Function.Surjective g) (hker : LinearMap.ker g = radical) : (T ⧸ radical) ≃ₗ[ℂ] U := by sorry
/- MetaplecticAutomorphicForms:MP.3/theta-finite-length
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem bigTheta_finiteLength (σ : Representation ℂ H U) : IsArtinian (MonoidAlgebra ℂ H) σ.asModule ∧ IsNoetherian (MonoidAlgebra ℂ H) σ.asModule := by sorry
/- MetaplecticAutomorphicForms:MP.3/howe-duality
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem howeDuality (σ : Representation ℂ H U) : Subsingleton U ∨ Representation.IsIrreducible σ := by sorry
/- MetaplecticAutomorphicForms:MP.3/local-see-saw
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem localSeeSaw (ρ : Representation ℂ G V) (σ : Representation ℂ G W) (ρ' : Representation ℂ H V) (σ' : Representation ℂ H W) : Nonempty (IntertwiningMap ρ σ ≃ₗ[ℂ] IntertwiningMap ρ' σ') := by sorry
/- MetaplecticAutomorphicForms:MP.3/persistence-and-stable-range
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem theta_persistence_stableRange (Θ : ℕ → Type*) [∀ r, AddCommGroup (Θ r)] (r : ℕ) (h : Nontrivial (Θ r)) : ∀ s, r ≤ s → Nontrivial (Θ s) := by sorry
/- MetaplecticAutomorphicForms:MP.3/first-occurrence
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def firstOccurrence (Θ : ℕ → Type*) [∀ r, Zero (Θ r)] : WithTop ℕ := by sorry
lemma firstOccurrence_nonzero (Θ : ℕ → Type*) [∀ r, Zero (Θ r)] (r : ℕ) (h : firstOccurrence Θ = r) : ∃ x : Θ r, x ≠ 0 := by sorry
lemma firstOccurrence_vanishing (Θ : ℕ → Type*) [∀ r, Zero (Θ r)] (r : ℕ) (h : (r : WithTop ℕ) < firstOccurrence Θ) : ∀ x : Θ r, x = 0 := by sorry
lemma firstOccurrence_dimension (Θ : ℕ → Type*) [∀ r, Zero (Θ r)] (m₀ r : ℕ) (h : firstOccurrence Θ = r) : (m₀ : WithTop ℕ)+2*firstOccurrence Θ = (m₀+2*r : ℕ) := by sorry
-- Test: TauCeti.Metaplectic.firstOccurrence_zero
example (Θ : ℕ → Type*) [∀ r, Zero (Θ r)] (h : ∃ x : Θ 0, x ≠ 0) : firstOccurrence Θ = 0 := by sorry
-- Test: TauCeti.Metaplectic.firstOccurrence_empty
example (Θ : ℕ → Type*) [∀ r, Zero (Θ r)] (h : ∀ r x, x = (0 : Θ r)) : firstOccurrence Θ = ⊤ := by sorry
-- Test: TauCeti.Metaplectic.firstOccurrence_anisotropic
example (m₀ m₁ r : ℕ) (h : m₀ ≠ m₁) : m₀+2*r ≠ m₁+2*r := by sorry
/- MetaplecticAutomorphicForms:MP.3/supercuspidal-first-occurrence
Kudla III.6: for a supercuspidal source representation, all nonzero tower ranks have irreducible big lift equal to small lift. Only first occurrence is supercuspidal. The smooth admissibility, tower identification, and normalized higher-rank induction formula require SR.2/3 and remain in the packet. -/
theorem supercuspidal_firstOccurrence (T : ℕ → Type*) [∀ r, AddCommGroup (T r)] [∀ r, Module ℂ (T r)] (ThetaBig ThetaSmall : ∀ r, Representation ℂ H (T r)) (r₀ : ℕ) : ∀ r, r₀ ≤ r → Representation.IsIrreducible (ThetaBig r) ∧ Nonempty (Representation.Equiv (ThetaBig r) (ThetaSmall r)) := by sorry
/- MetaplecticAutomorphicForms:MP.3/kudla-jacquet-filtration
Finite filtration carrier; the exact normalized induced quotient formulas, rank bounds, modulus characters and smaller oscillator models are in the packet and require SR.2’s Jacquet/induction APIs. -/
theorem oscillator_jacquetFiltration (σ : Representation ℂ H U) (r : ℕ) : ∃ filtration : Fin (r+2) → Subrepresentation σ, Monotone filtration ∧ filtration 0 = ⊥ ∧ filtration (Fin.last (r+1)) = ⊤ := by sorry
/- MetaplecticAutomorphicForms:MP.3/doubling-filtration
Finite filtration carrier; the exact normalized induced quotient formulas, rank bounds, modulus characters and smaller oscillator models are in the packet and require SR.2’s Jacquet/induction APIs. -/
theorem doubling_rankFiltration (σ : Representation ℂ H U) (r : ℕ) : ∃ filtration : Fin (r+2) → Subrepresentation σ, Monotone filtration ∧ filtration 0 = ⊥ ∧ filtration (Fin.last (r+1)) = ⊤ := by sorry
/- MetaplecticAutomorphicForms:MP.3/type-ii-theta
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem typeII_theta (σ : Representation ℂ H U) : Subsingleton U ∨ Representation.IsIrreducible σ := by sorry
/- MetaplecticAutomorphicForms:MP.3/mvw-and-cover-induction
ρ and σ denote the stated MVW and smooth-dual realizations, or the cover-induced comparison. Only irreducible inputs have the source MVW≃dual assertion; the dual functor is not asserted covariant on all modules. -/
theorem mvw_coverInduction (ρ : Representation ℂ G V) (σ : Representation ℂ G W) : Nonempty (Representation.Equiv ρ σ) := by sorry
/- MetaplecticAutomorphicForms:MP.3/nonarchimedean-conservation
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem theta_conservation (n₁ n₂ dimU d : ℕ) : n₁+n₂ = 2*dimU+d := by sorry
/- MetaplecticAutomorphicForms:MP.3/archimedean-conservation
Displayed equality is only the two-tower equality cases of Sun–Zhu §7.2; the parity bounds and K_U-coset inequalities are separately stated in the packet, not subsumed by a universal archimedean equality. -/
theorem theta_archimedeanFirstOccurrence (n₁ n₂ dimU d : ℕ) : n₁+n₂ = 2*dimU+d := by sorry
/- MetaplecticAutomorphicForms:MP.3/orthogonal-cover-restriction
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem orthogonalCover_parity (m : ℕ) (centralAction : ℕ → ℂ) : centralAction m = (-1 : ℂ)^m := by sorry
/- MetaplecticAutomorphicForms:MP.3/unitary-splitting
Unitary splitting fragment. χV and χW must satisfy the quadratic-character restrictions on the native F× inclusion. ξ denotes the quotient character pulled back by the determinant. The zero tensor-space test specializes the actual carrier to ℂ with trivial auxiliary characters. In general GQT (2.2) gives a determinant-character line. Local field, extension, dimensions, polarization and determinant bridges remain the packet hypotheses. -/
def unitaryWeilRepresentation (χV χW : G →* ℂˣ) : Representation ℂ (G × H) U := by sorry
lemma unitarySplitting_cocycle (c : G → G → ℂˣ) (s : G → ℂˣ) (g h : G) : s (g*h) = s g*s h*c g h := by sorry
lemma unitarySplitting_character_change (ρ σ : Representation ℂ G V) (χ : G →* ℂˣ) : ∀ g v, σ g v = (χ g : ℂ) • ρ g v := by sorry
lemma unitarySplitting_delta (ρ : Representation ℂ G V) (σ : Representation ℂ G W) : Nonempty (Representation.Equiv ρ σ) := by sorry
-- Test: TauCeti.Metaplectic.unitarySplitting_zero
example (g : G × H) (z : ℂ) : (unitaryWeilRepresentation (1 : G →* ℂˣ) 1 : Representation ℂ (G × H) ℂ) g z = z := by sorry
-- Test: TauCeti.Metaplectic.unitarySplitting_restriction
example (included : Subgroup G) (χ δ : G →* ℂˣ) (m : ℕ) (g : included) (h : χ g.val ≠ δ g.val^m) : χ.comp included.subtype ≠ (δ^m).comp included.subtype := by sorry
-- Test: TauCeti.Metaplectic.unitarySplitting_twist
example (ρ σ : Representation ℂ G V) (ξ : G →* ℂˣ) (g : G) (v : V) : σ g v = (ξ g : ℂ) • ρ g v := by sorry
/- MetaplecticAutomorphicForms:MP.3/unitary-equal-almost-equal-rank
Dichotomy fragment in the source’s specified equal-rank/relevant tempered range. Almost-equal-rank two-nonzero cases, parameter/epsilon formulas and broader semisimplicity gates remain explicit in the packet. -/
theorem unitaryTheta_equalAlmostEqualRank (ThetaPlus ThetaMinus : Type*) [Zero ThetaPlus] [Zero ThetaMinus] : (∃ x : ThetaPlus, x ≠ 0) ↔ ¬ ∃ y : ThetaMinus, y ≠ 0 := by sorry
/- MetaplecticAutomorphicForms:MP.3/unitary-doubling-dichotomy
Dichotomy fragment in the source’s specified equal-rank/relevant tempered range. Almost-equal-rank two-nonzero cases, parameter/epsilon formulas and broader semisimplicity gates remain explicit in the packet. -/
theorem unitaryTheta_doublingDichotomy (ThetaPlus ThetaMinus : Type*) [Zero ThetaPlus] [Zero ThetaMinus] : (∃ x : ThetaPlus, x ≠ 0) ↔ ¬ ∃ y : ThetaMinus, y ≠ 0 := by sorry
/- MetaplecticAutomorphicForms:MP.3/relevant-unitary-dichotomy
Dichotomy fragment in the source’s specified equal-rank/relevant tempered range. Almost-equal-rank two-nonzero cases, parameter/epsilon formulas and broader semisimplicity gates remain explicit in the packet. -/
theorem theta_relevantDichotomy (ThetaPlus ThetaMinus : Type*) [Zero ThetaPlus] [Zero ThetaMinus] : (∃ x : ThetaPlus, x ≠ 0) ↔ ¬ ∃ y : ThetaMinus, y ≠ 0 := by sorry
/- MetaplecticAutomorphicForms:MP.3/mp-odd-orthogonal-unramified
Exponent-list fragment of the actual ψ-relative unramified parameter. Induced constituents, smaller-tower removal and modulus factors require the SR.2/3 carriers and source hypotheses. -/
theorem mpTheta_unramifiedInduction (exponents parameter : List ℂ) : parameter = exponents.flatMap (fun s => [s,-s]) := by sorry
/- MetaplecticAutomorphicForms:MP.3/rallis-unramified-satake
List-of-eigenvalues fragment; the exact added Satake segment and L-group normalization must be supplied from original Rallis, not an arbitrary added list. -/
theorem theta_unramifiedSatake (source target extra : List ℂ) : target = source ++ extra := by sorry
/- MetaplecticAutomorphicForms:MP.3/unitary-hecke-compatibility
A and B are precisely Li–Liu’s spherical Hecke algebra and theta quotient algebra, theta is its canonical surjection, and the two characters are those of the source and contragredient theta output. Their identification, compact subgroups and ramified range are omitted supplier conditions; this conclusion retains surjectivity and conjugate character matching. -/
theorem unitaryTheta_hecke (A B : Type*) [CommRing A] [CommRing B] (θ : A →+* B) (sourceCharacter : A →+* ℂ) (outputCharacter : B →+* ℂ) : Function.Surjective θ ∧ ∀ a, outputCharacter (θ a) = star (sourceCharacter a) := by sorry
/- MetaplecticAutomorphicForms:MP.3/theta-coefficient-rationality
Coefficient fragment of the semilinear theta comparison: sourceTheta and conjugateTheta are coefficients of theta(ιπ) and theta(σιπ), respectively, after their source-defined identification. The coefficient-field, similitude and psi_a hypotheses are omitted pending their suppliers. The conclusion compares two independently formed lifts. -/
theorem theta_coefficientRationality (σ : ℂ ≃+* ℂ) (sourceTheta conjugateTheta : G → ℂ) : ∀ g, conjugateTheta g = σ (sourceTheta g) := by sorry
/- MetaplecticAutomorphicForms:MP.3/quaternionic-similitude-datum
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def quaternionSimilitudeEmbedding (Gq Wq T : Type*) [Group Gq] [Group Wq] [AddCommGroup T] [Module ℂ T] (νV : Gq →* ℂˣ) (νW : Wq →* ℂˣ) : {p : Gq × Wq // νV p.1 = νW p.2} → (T ≃ₗ[ℂ] T) := by sorry
lemma quaternionTensor_pairing (F₀ T Q : Type*) [Field F₀] [AddCommGroup T] [Module F₀ T] [AddCommGroup Q] [Module F₀ Q] (tensorPairing : LinearMap.BilinForm F₀ T) (redTrace : Q →ₗ[F₀] F₀) (pairingValue : T → T → Q) (x y : T) : tensorPairing x y = (2:F₀)⁻¹ * redTrace (pairingValue x y) := by sorry
lemma quaternionSimilitude_invariant (b : LinearMap.BilinForm ℂ U) (g : U ≃ₗ[ℂ] U) (x y : U) : b (g x) (g y) = b x y := by sorry
lemma quaternionPolarization (F₀ T : Type*) [Field F₀] [AddCommGroup T] [Module F₀ T] (X Y : Submodule F₀ T) : IsCompl X Y := by sorry
-- Test: TauCeti.Metaplectic.quaternionTensor_rankOne
example : Module.finrank ℂ (Fin 2 → ℂ) = 2 := by sorry
-- Test: TauCeti.Metaplectic.quaternionTensor_zero
example : Subsingleton (Fin 0 → ℂ) := by sorry
-- Test: TauCeti.Metaplectic.quaternionTensor_mismatch
example (b : LinearMap.BilinForm ℂ U) (g : U ≃ₗ[ℂ] U) (a : ℂ) (ha : a ≠ 1) (x y : U) (hxy : b x y ≠ 0) (hg : b (g x) (g y) = a*b x y) : b (g x) (g y) ≠ b x y := by sorry
/- MetaplecticAutomorphicForms:MP.3/quaternionic-splitting
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def quaternionSplitting (c : G → G → ℂˣ) : G → ℂˣ := by sorry
lemma quaternionSplitting_cocycle (c : G → G → ℂˣ) (g h : G) : quaternionSplitting c (g*h) = quaternionSplitting c g * quaternionSplitting c h * c g h := by sorry
lemma quaternionSplitting_central (c : G → G → ℂˣ) (ξ : G →* ℂˣ) (m : ℕ) (z g : G) : quaternionSplitting c (z*g) = (ξ z)^m * quaternionSplitting c g := by sorry
lemma quaternionSplitting_auxiliary (c c' : G → G → ℂˣ) (g : G) : quaternionSplitting c g = quaternionSplitting c' g := by sorry
-- Test: TauCeti.Metaplectic.quaternionSplitting_identity
example (c : G → G → ℂˣ) : quaternionSplitting c 1 = 1 := by sorry
-- Test: TauCeti.Metaplectic.quaternionSplitting_character
example (c : G → G → ℂˣ) (z g : G) (xi : ℂˣ) (hxi : xi = -1) : quaternionSplitting c (z*g) = xi*quaternionSplitting c g := by sorry
-- Test: TauCeti.Metaplectic.quaternionSplitting_product
example (places : Type*) (S : Finset places) (localSplitting : places → G → ℂˣ) (gamma : G) : ∏ v ∈ S, localSplitting v gamma = 1 := by sorry
/- MetaplecticAutomorphicForms:MP.3/quaternionic-first-doubled-splitting
Equality of the source’s precisely normalized quaternionic cochains after its doubled/sharp/see-saw/Morita maps. Those carriers/maps and discriminant/norm-class hypotheses are supplier gaps; this is not equality of arbitrary cochains. -/
theorem quaternionSplitting_firstDoubled (s s' : G → ℂˣ) (g : G) : s g = s' g := by sorry
/- MetaplecticAutomorphicForms:MP.3/quaternionic-second-doubled-splitting
Equality of the source’s precisely normalized quaternionic cochains after its doubled/sharp/see-saw/Morita maps. Those carriers/maps and discriminant/norm-class hypotheses are supplier gaps; this is not equality of arbitrary cochains. -/
theorem quaternionSplitting_secondDoubled (s s' : G → ℂˣ) (g : G) : s g = s' g := by sorry
/- MetaplecticAutomorphicForms:MP.3/quaternionic-sharp-descent
Equality of the source’s precisely normalized quaternionic cochains after its doubled/sharp/see-saw/Morita maps. Those carriers/maps and discriminant/norm-class hypotheses are supplier gaps; this is not equality of arbitrary cochains. -/
theorem quaternionSplitting_sharpDescent (s s' : G → ℂˣ) (g : G) : s g = s' g := by sorry
/- MetaplecticAutomorphicForms:MP.3/quaternionic-see-saw-compatibility
Equality of the source’s precisely normalized quaternionic cochains after its doubled/sharp/see-saw/Morita maps. Those carriers/maps and discriminant/norm-class hypotheses are supplier gaps; this is not equality of arbitrary cochains. -/
theorem quaternionSplitting_seeSaw (s s' : G → ℂˣ) (g : G) : s g = s' g := by sorry
/- MetaplecticAutomorphicForms:MP.3/periods-i-comparison
Equality of the source’s precisely normalized quaternionic cochains after its doubled/sharp/see-saw/Morita maps. Those carriers/maps and discriminant/norm-class hypotheses are supplier gaps; this is not equality of arbitrary cochains. -/
theorem quaternionSplitting_periodsI (s s' : G → ℂˣ) (g : G) : s g = s' g := by sorry
/- MetaplecticAutomorphicForms:MP.3/harris-kudla-morita-comparison
Equality of the source’s precisely normalized quaternionic cochains after its doubled/sharp/see-saw/Morita maps. Those carriers/maps and discriminant/norm-class hypotheses are supplier gaps; this is not equality of arbitrary cochains. -/
theorem quaternionSplitting_harrisKudla (s s' : G → ℂˣ) (g : G) : s g = s' g := by sorry
/- MetaplecticAutomorphicForms:MP.3/periods-i-first-scalar-calculation
Appendix A.9 coordinate values; gamma is γ_F(·,ψ/2), hilbert the QFI.6 Hilbert symbol. The actual embeddings and a,b≠0 hypotheses are omitted until the quaternionic supplier. -/
theorem quaternionSplitting_scalarA9 (F : Type*) [Field F] (hilbert : F → F → ℂ) (gamma : F → ℂ) (a b u J₁ J₂ : F) (tilde s₂ mu chi : ℂ) : tilde = gamma J₁*hilbert (-2*a*b*J₂) J₁ ∧ s₂ = chi^(-4:ℤ)*hilbert u J₁ ∧ mu = gamma J₁*hilbert (-2*a*b*u*J₂) J₁ := by sorry
/- MetaplecticAutomorphicForms:MP.3/periods-i-second-scalar-calculation
Appendix A.10 values, with the exact second embedding and source nonzero coordinates required in the packet. -/
theorem quaternionSplitting_scalarA10 (F : Type*) [Field F] (hilbert : F → F → ℂ) (gamma : F → ℂ) (a b u J₁ J : F) (tilde s₁ mu : ℂ) : tilde = gamma J*hilbert (-2*a*b*J₁) J ∧ s₁ = hilbert u J ∧ mu = gamma J*hilbert (-2*a*b*u*J₁) J := by sorry
/- MetaplecticAutomorphicForms:MP.3/periods-i-square-quaternion-calculation
Only the normalized square-quaternion generators j_i/t_i in A.21–A.23; this does not claim triviality of both cochains on an arbitrary group element. -/
theorem quaternionSplitting_scalarA11 (s tilde : G → ℂˣ) (g : G) : s g = 1 ∧ tilde g = 1 := by sorry
/- MetaplecticAutomorphicForms:MP.3/similitude-theta-howe
smallLift denotes the small lift for the matched-multiplier similitude oscillator, not an arbitrary representation. The actual group carrier, finite-length big lift and injectivity comparison need the recorded SR.2/3 suppliers. -/
theorem similitudeTheta_howe (smallLift : Representation ℂ H U) : Subsingleton U ∨ Representation.IsIrreducible smallLift := by sorry
/- MetaplecticAutomorphicForms:MP.3/real-discrete-series-theta
Compact O(0,6) fragment: the holomorphic weight-(k+1) SL2 discrete series has theta highest weight (k-2,0,0), while its dual lift vanishes. Exact real groups, positive psi, highest-weight/cohomological induction and the O(4,2) comparison need AF.1; no generic irreducibility substitute is used. -/
theorem theta_realDiscreteSeries (compactHighestWeight : ℕ → ℤ × ℤ × ℤ) (compactDualLift : Type*) (k : ℕ) (hk : 2 ≤ k) : compactHighestWeight k = ((k:ℤ)-2,0,0) ∧ Subsingleton compactDualLift := by sorry
/- MetaplecticAutomorphicForms:MP.3/quaternionic-unramified-theta
Three-character fragment of IP Lemma9.4. chi2Norm is chi2 composed with N_E/F, modulus is the E absolute value and normModulus the F absolute value composed with N_E/F. The unramified torus, normalized induction and source constituent identification remain mandatory supplier conditions. -/
theorem theta_quaternionUnramified (F : Type*) (χ₁ χ₂ ξ modulus χ₂Norm normModulus : F → ℂ) (thetaParameter : F → ℂ × ℂ × ℂ) : ∀ a, thetaParameter a = (χ₁ a*(χ₂ a)⁻¹*ξ a, modulus a, χ₂Norm a*(normModulus a)^(-1/2:ℂ)) := by sorry
/- MetaplecticAutomorphicForms:MP.3/rank-one-oscillator-constituents
Corrected conjugate-oscillator convention: odd big lift is Steinberg-minus; even big lift is the extension of trivial by Steinberg-plus, whose underlying short exact sequence is displayed. The named carriers/maps must be those source representations and intertwining maps, supplied by SR.0/3. -/
theorem theta_rankOneConstituents (oddLift : Representation ℂ H W) (steinbergMinus : Representation ℂ H V) (steinbergPlusToEven : V →ₗ[ℂ] U) (evenToTrivial : U →ₗ[ℂ] ℂ) : Nonempty (Representation.Equiv steinbergMinus oddLift) ∧ Function.Injective steinbergPlusToEven ∧ Function.Surjective evenToTrivial ∧ LinearMap.range steinbergPlusToEven = LinearMap.ker evenToTrivial := by sorry
/- MetaplecticAutomorphicForms:MP.3/gl2-gso4-theta
Pullback to GL2 x GL2 of the GSO4 lift of pi-dual is the external tensor pi x pi. Generic irreducibility, similitude descent, central quotient and the back-lift comparison remain packet hypotheses/suppliers. -/
theorem theta_gl2Gso4 (π : Representation ℂ G V) (thetaLift : Representation ℂ (G × G) W) : ∃ e : W ≃ₗ[ℂ] V ⊗[ℂ] V, ∀ g h w, e (thetaLift (g,h) w) = TensorProduct.map (π g) (π h) (e w) := by sorry
/- MetaplecticAutomorphicForms:MP.3/minimal-orthogonal-theta
Finite-length fragment of Gan–Savin Prop14.2 and §14.3. thetaHomModule is the actual lifted Hom module under the displayed see-saw, with H=SO(2n-7) or Sp(V2) as appropriate. Minimal-representation identification, tempered scope and finite-index isogeny require suppliers; finite-dimensionality is not asserted. -/
theorem theta_minimalOrthogonal (thetaHomModule : Representation ℂ H U) : IsArtinian (MonoidAlgebra ℂ H) thetaHomModule.asModule ∧ IsNoetherian (MonoidAlgebra ℂ H) thetaHomModule.asModule := by sorry
/- MetaplecticAutomorphicForms:MP.3/division-ternary-theta
thetaJL is the rank-one psi-theta lift of JL(rho), where rho is irreducible supercuspidal on PGL2 as in GS23 §15.1. This conclusion includes nonzero irreducibility. Genuineness, supercuspidality and the precise PGL2/PB*/Mp2 carriers need the recorded suppliers. The source typo JL(tau) is corrected to JL(rho). -/
theorem theta_divisionTernary (thetaJL : Representation ℂ H U) : Representation.IsIrreducible thetaJL := by sorry
/- MetaplecticAutomorphicForms:MP.3/pgsp6-pgso8-similitude-theta
Nonvanishing and standard-parameter fragment for the generic PGSp6 to PGSO8 similitude lift. The exact LLC/Satake carrier and restriction constituent must be source-identified; the Spin7 to Spin8 and spin-restriction comparisons remain supplier gaps. -/
theorem theta_pgsp6Pgso8 (similitudeLift : Type*) [Zero similitudeLift] (sourceStandard targetStandard : List ℂ) : (∃ x : similitudeLift, x ≠ 0) ∧ targetStandard = sourceStandard ++ [1] := by sorry
/- MetaplecticAutomorphicForms:MP.3/pgsp6-theta-dichotomy
Exactly-one-nonzero fragment of GS23B §12.2 for the PGO8/PGO(5,1) towers. splitLift and nonsplitLift are the actual theta carriers of a fixed irreducible PGSp6 input; PGO6 first occurrence and the group/cover identifications remain in the packet. -/
theorem theta_pgsp6Dichotomy (splitLift nonsplitLift : Type*) [Zero splitLift] [Zero nonsplitLift] : (∃ x : splitLift, x ≠ 0) ↔ ¬ ∃ y : nonsplitLift, y ≠ 0 := by sorry
end ComplexTheta
section GlobalCover
variable {G R Z U X : Type*} [Group G] [Group R] [CommGroup Z]
 [AddCommGroup U] [Module ℂ U]
/- MetaplecticAutomorphicForms:MP.4/unramified-compact-splittings
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem metaplectic_compactSplitting (K : Subgroup G) (p : R →* G) : ∃ s : K →* R, ∀ k, p (s k) = k.val := by sorry
/- MetaplecticAutomorphicForms:MP.4/adelic-metaplectic-cover
R is the AA.1 restricted product, K the image of the finite-support sign-product kernel. Both their construction and topology are mandatory packet hypotheses, not arbitrary quotient data. -/
def adelicMetaplectic (K : Subgroup R) [K.Normal] : Type _ := R ⧸ K
def adelicMetaplectic_projection (K : Subgroup R) [K.Normal] (p : R →* G) (h : K ≤ p.ker) : R ⧸ K →* G := by sorry
def adelicMetaplectic_local (K : Subgroup R) [K.Normal] : R →* R ⧸ K := by sorry
lemma adelicMetaplectic_center_product (K : Subgroup R) [K.Normal] (ι : Z →* R) (ε : List Z) : (QuotientGroup.mk ((ε.map ι).prod) : R ⧸ K) = (ε.map (fun z => (QuotientGroup.mk (ι z) : R ⧸ K))).prod := by sorry
-- Test: TauCeti.Metaplectic.adelicCover_twoSigns
example (K : Subgroup R) [K.Normal] (z₁ z₂ : R) (h : z₁*z₂ ∈ K) : (QuotientGroup.mk (z₁*z₂) : R ⧸ K) = 1 := by sorry
-- Test: TauCeti.Metaplectic.adelicCover_oneSign
example (K : Subgroup R) [K.Normal] (z : R) (h : z ∉ K) : (QuotientGroup.mk z : R ⧸ K) ≠ 1 := by sorry
-- Test: TauCeti.Metaplectic.adelicCover_finiteSupport
example (K : Subgroup R) [K.Normal] (z z₀ : R) (h : z*z₀⁻¹ ∈ K) : (QuotientGroup.mk z : R ⧸ K) = QuotientGroup.mk z₀ := by sorry
/- MetaplecticAutomorphicForms:MP.4/global-weil-index-product
Finite support of the global index product; the compatible rational quadratic form/global character and good-place triviality are required packet hypotheses. -/
theorem weilIndex_productFormula (v : Finset X) (γ : X → ℂˣ) : ∏ x ∈ v, γ x = 1 := by sorry
/- MetaplecticAutomorphicForms:MP.4/rational-symplectic-splitting
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def rationalMetaplecticSplitting (Fgroup : Type*) [Group Fgroup] (K : Subgroup R) [K.Normal] : Fgroup →* R ⧸ K := by sorry
lemma rationalSplitting_projection (Fgroup : Type*) [Group Fgroup] (K : Subgroup R) [K.Normal] (diagonal : Fgroup →* G) (projection : R ⧸ K →* G) (γ : Fgroup) : projection (rationalMetaplecticSplitting (Fgroup := Fgroup) K γ) = diagonal γ := by sorry
lemma rationalSplitting_mul (Fgroup : Type*) [Group Fgroup] (K : Subgroup R) [K.Normal] (a b : Fgroup) : rationalMetaplecticSplitting (Fgroup := Fgroup) K (a*b) = rationalMetaplecticSplitting (Fgroup := Fgroup) K a * rationalMetaplecticSplitting (Fgroup := Fgroup) K b := by sorry
lemma rationalSplitting_polarization (Fgroup : Type*) [Group Fgroup] (K K' : Subgroup R) [K.Normal] [K'.Normal] (e : (R ⧸ K) ≃* (R ⧸ K')) (a : Fgroup) : e (rationalMetaplecticSplitting (Fgroup := Fgroup) K a) = rationalMetaplecticSplitting (Fgroup := Fgroup) K' a := by sorry
-- Test: TauCeti.Metaplectic.rationalSplitting_identity
example (Fgroup : Type*) [Group Fgroup] (K : Subgroup R) [K.Normal] : rationalMetaplecticSplitting (Fgroup := Fgroup) K 1 = 1 := by sorry
-- Test: TauCeti.Metaplectic.rationalSplitting_fourier
example (Fgroup : Type*) [Group Fgroup] (K : Subgroup R) [K.Normal] (ω : Representation ℂ (R ⧸ K) U) (τ : U →ₗ[ℂ] ℂ) (w : Fgroup) (φ : U) : τ (ω (rationalMetaplecticSplitting (Fgroup := Fgroup) K w) φ) = τ φ := by sorry
-- Test: TauCeti.Metaplectic.rationalSplitting_section
example (Fgroup : Type*) [Group Fgroup] (K : Subgroup R) [K.Normal] (theta : (R ⧸ K) → ℂ) (a : Fgroup) (z : R ⧸ K) (h : theta (z*rationalMetaplecticSplitting (Fgroup := Fgroup) K a) = -theta (rationalMetaplecticSplitting (Fgroup := Fgroup) K a)) (hn : theta (rationalMetaplecticSplitting (Fgroup := Fgroup) K a) ≠ 0) : theta (z*rationalMetaplecticSplitting (Fgroup := Fgroup) K a) ≠ theta (rationalMetaplecticSplitting (Fgroup := Fgroup) K a) := by sorry
/- MetaplecticAutomorphicForms:MP.4/adelic-weil-representation
U is the supplier’s finite restricted tensor × full joint archimedean Schwartz model. Pure-tensor evaluation and local good-vector/central conditions require those actual realizations. The two-coordinate Schwartz example explicitly requires a vector outside every finite sum of separated Schwartz products; an algebraic tensor carrier cannot satisfy it. -/
def adelicWeil (K : Subgroup R) [K.Normal] : Representation ℂ (R ⧸ K) U := by sorry
lemma adelicWeil_pureTensor (K : Subgroup R) [K.Normal] (ι : Type*) [Fintype ι] (V : ι → Type*) [∀ i, AddCommGroup (V i)] [∀ i, Module ℂ (V i)] (tensor : MultilinearMap ℂ V U) (localAction : ∀ i, Representation ℂ (R ⧸ K) (V i)) (g : R ⧸ K) (φ : ∀ i, V i) : adelicWeil K g (tensor φ) = tensor (fun i => localAction i g (φ i)) := by sorry
lemma adelicWeil_central (K : Subgroup R) [K.Normal] (z : R ⧸ K) (φ : U) : adelicWeil K z φ = -φ := by sorry
lemma adelicWeil_characterChange (K : Subgroup R) [K.Normal] (scaledWeil : Representation ℂ (R ⧸ K) U) (a : (R ⧸ K) ≃* (R ⧸ K)) (e : U ≃ₗ[ℂ] U) (g : R ⧸ K) (φ : U) : e (adelicWeil K g φ) = scaledWeil (a g) (e φ) := by sorry
-- Test: TauCeti.Metaplectic.adelicWeil_goodVector
example (K : Subgroup R) [K.Normal] (g : R ⧸ K) (φ : U) : adelicWeil K g φ = φ := by sorry
-- Test: TauCeti.Metaplectic.adelicWeil_twoCenters
example (K : Subgroup R) [K.Normal] (z₁ z₂ : R ⧸ K) (φ : U) (h : z₁*z₂ = 1) : adelicWeil K z₁ (adelicWeil K z₂ φ) = φ := by sorry
-- Test: TauCeti.Metaplectic.adelicWeil_jointSchwartz
example : ∃ φ : SchwartzMap (ℝ × ℝ) ℂ, ∀ (k : ℕ) (f g : Fin k → SchwartzMap ℝ ℂ), (φ : ℝ × ℝ → ℂ) ≠ (fun p => ∑ i, f i p.1*g i p.2) := by sorry
/- MetaplecticAutomorphicForms:MP.4/adelic-choice-compatibility
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem adelicWeil_choiceCompatibility (K : Subgroup R) [K.Normal] (ρ σ : Representation ℂ (R ⧸ K) U) : Nonempty (Representation.Equiv ρ σ) := by sorry
/- MetaplecticAutomorphicForms:MP.4/function-field-metaplectic-programme
Conditional excursion-algebra action signature only. A must be the requested twisted excursion algebra; gerbe/fusion/coherence and modified dual group remain gaps. This is not a proved metaplectic Langlands theorem. -/
def metaplectic_functionFieldProgramme (A : Type*) [CommRing A] : A →+* Module.End ℂ U := by sorry
end GlobalCover
section FiniteOscillator
variable {D G : Type*} [Fintype D] [DecidableEq D] [Group G]
/- MetaplecticAutomorphicForms:MP.4/finite-weil-representation
AGHMP omega_L convention: T has the negative phase, S the positive pairing exponential; rho_L is its conjugate. Function-space realization of C[D]; q and pairing are lifts of the completed IntegralLattices finite quadratic module values. Period/lift independence and the metaplectic generator relations require that native AddCircle/QuadraticMap bridge. -/
def finiteWeil (q : D → ℝ) (pairing : D → D → ℝ) (phase : ℂ) : Representation ℂ G (D → ℂ) := by sorry
lemma finiteWeil_T (q : D → ℝ) (pairing : D → D → ℝ) (phase : ℂ) (T : G) (μ ν : D) : finiteWeil q pairing phase T (Pi.single μ 1) ν = Complex.exp (-2*Real.pi*Complex.I*q μ) * ((Pi.single μ (1:ℂ) : D → ℂ) ν) := by sorry
lemma finiteWeil_S (q : D → ℝ) (pairing : D → D → ℝ) (phase : ℂ) (S : G) (φ : D → ℂ) (ν : D) : finiteWeil q pairing phase S φ ν = phase/(Real.sqrt (Fintype.card D) : ℂ) * ∑ μ, Complex.exp (2*Real.pi*Complex.I*pairing μ ν)*φ μ := by sorry
lemma finiteWeil_conjugate (q : D → ℝ) (pairing : D → D → ℝ) (phase : ℂ) (T : G) (μ ν : D) : star (finiteWeil q pairing phase T (Pi.single μ 1) ν) = Complex.exp (2*Real.pi*Complex.I*q μ) * ((Pi.single μ (1:ℂ) : D → ℂ) ν) := by sorry
-- Test: TauCeti.Metaplectic.finiteWeil_unimodular
example [Unique D] : Module.finrank ℂ (D → ℂ) = 1 := by sorry
-- Test: TauCeti.Metaplectic.finiteWeil_Tbasis
example (q : D → ℝ) (pairing : D → D → ℝ) (phase : ℂ) (T : G) (μ : D) (hq : q μ = 1/4) : finiteWeil q pairing phase T (Pi.single μ 1) μ = -Complex.I ∧ star (finiteWeil q pairing phase T (Pi.single μ 1) μ) = Complex.I := by sorry
-- Test: TauCeti.Metaplectic.finiteWeil_conjugation
example (a : ℂ) (h : a.im ≠ 0) : star a ≠ a := by sorry
end FiniteOscillator
section ThetaFunctions
variable {G H X Y : Type*} [Group G] [Group H]
/- MetaplecticAutomorphicForms:MP.5/theta-kernel
Rational evaluation/sum fragment. X is X(F), φ the restriction of an actual adelic Schwartz vector; summability, canonical rational lift and central z are essential packet hypotheses. -/
def thetaKernel (ω : Representation ℂ G (X → ℂ)) (g : G) (φ : X → ℂ) : ℂ := ∑' x, ω g φ x
lemma thetaKernel_apply (ω : Representation ℂ G (X → ℂ)) (g : G) (φ : X → ℂ) : thetaKernel ω g φ = ∑' x, ω g φ x := by sorry
lemma thetaKernel_rational (ω : Representation ℂ G (X → ℂ)) (γ g : G) (φ : X → ℂ) : thetaKernel ω (γ*g) φ = thetaKernel ω g φ := by sorry
lemma thetaKernel_central (ω : Representation ℂ G (X → ℂ)) (z g : G) (φ : X → ℂ) : thetaKernel ω (z*g) φ = -thetaKernel ω g φ := by sorry
-- Test: TauCeti.Metaplectic.thetaKernel_zero
example (ω : Representation ℂ G (Unit → ℂ)) (g : G) (φ : Unit → ℂ) : thetaKernel ω g φ = ω g φ () := by sorry
-- Test: TauCeti.Metaplectic.thetaKernel_fourier
example (ω : Representation ℂ G (X → ℂ)) (w : G) (φ : X → ℂ) : thetaKernel ω w φ = thetaKernel ω 1 φ := by sorry
-- Test: TauCeti.Metaplectic.thetaKernel_sign
example (f : G → ℂ) (z g : G) (hf : f (z*g) = -f g) (hfg : f g ≠ 0) : f (z*g) ≠ f g := by sorry
/- MetaplecticAutomorphicForms:MP.5/theta-growth-transfer
One differentiated theta function is displayed; the packet requires a single exponent for the complete all-derivatives family and its AA.3/AF.2 height comparison. -/
theorem theta_uniformModerateGrowth (θ : G → ℂ) (height : G → ℝ) : ∃ n : ℕ, ∃ C : ℝ, ∀ g, ‖θ g‖ ≤ C*height g^n := by sorry
/- MetaplecticAutomorphicForms:MP.5/genuine-automorphic-spaces
Genuine-sign submodule fragment. The AF.1/2 smooth, finite-level, Z-finite and uniform-growth restrictions and AF.3 all-parabolic continuous constant terms are omitted until their native carriers arrive. The full smooth space has a group action; its K-finite core has the (g,K) and finite-adelic actions. -/
def genuineAutomorphic (z : G) : Submodule ℂ (G → ℂ) := by sorry
lemma genuineAutomorphic_eval (z : G) (f : genuineAutomorphic z) (g : G) : f.val (z*g) = -f.val g := by sorry
lemma genuineAutomorphic_right (z : G) (h : G) (f : genuineAutomorphic z) : (fun g => f.val (g*h)) ∈ genuineAutomorphic z := by sorry
lemma genuineCusp_iff (Parabolic : Type*) (constantTerm : Parabolic → (G → ℂ) →ₗ[ℂ] ℂ) (f : G → ℂ) : (∀ P, constantTerm P f = 0) ↔ f ∈ ⨅ P, LinearMap.ker (constantTerm P) := by sorry
-- Test: TauCeti.Metaplectic.genuineAutomorphic_zero
example (z : G) : (0 : G → ℂ) ∈ genuineAutomorphic z := by sorry
-- Test: TauCeti.Metaplectic.genuineAutomorphic_descend
example (z : G) (f : genuineAutomorphic z) (h : ∀ g, f.val (z*g) = f.val g) : f.val = 0 := by sorry
-- Test: TauCeti.Metaplectic.genuineAutomorphic_translation
example (z h : G) (f : genuineAutomorphic z) (g : G) : f.val (z*(g*h)) = -f.val (g*h) := by sorry
/- MetaplecticAutomorphicForms:MP.5/unipotent-splitting
G here is the actual unipotent subgroup, H its inverse image in the cover. No arbitrary cover splits; the characteristic-zero unipotent and source topology conditions are mandatory. -/
theorem metaplectic_unipotentSplitting (p : H →* G) : ∃ s : G →* H, p.comp s = MonoidHom.id G := by sorry
/- MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def metaplecticWhittaker [MeasurableSpace H] (μ : Measure H) (ι : H → G) (η : H → ℂ) (f : G → ℂ) (g : G) : ℂ := ∫ u, f (ι u*g)*star (η u) ∂μ
lemma metaplecticWhittaker_trivial [MeasurableSpace H] (μ : Measure H) (ι : H → G) (f : G → ℂ) (g : G) : metaplecticWhittaker μ ι (fun _ => 1) f g = ∫ u, f (ι u*g) ∂μ := by sorry
lemma metaplecticWhittaker_right [MeasurableSpace H] (μ : Measure H) (ι : H → G) (η : H → ℂ) (f : G → ℂ) (g h : G) : metaplecticWhittaker μ ι η (fun x => f (x*h)) g = metaplecticWhittaker μ ι η f (g*h) := by sorry
lemma metaplecticWhittaker_central [MeasurableSpace H] (μ : Measure H) (ι : H → G) (η : H → ℂ) (f : G → ℂ) (z g : G) : metaplecticWhittaker μ ι η f (z*g) = -metaplecticWhittaker μ ι η f g := by sorry
-- Test: TauCeti.Metaplectic.metaplecticWhittaker_zeroU
example (f : G → ℂ) (g : G) : metaplecticWhittaker (Measure.dirac ()) (fun _ : Unit => (1:G)) (fun _ => 1) f g = f g := by sorry
-- Test: TauCeti.Metaplectic.metaplecticWhittaker_character
example [MeasurableSpace H] (μ : Measure H) (η : H → ℂ) (hμ : μ Set.univ = 1) (hη : ∀ u, ‖η u‖ = 1) : (∫ u, η u * star (η u) ∂μ) = 1 := by sorry
-- Test: TauCeti.Metaplectic.metaplecticWhittaker_orthogonal
example [MeasurableSpace H] (μ : Measure H) (η ζ : H →* ℂˣ) (h : η ≠ ζ) : (∫ u, (ζ u : ℂ)*star (η u : ℂ) ∂μ) = 0 := by sorry
/- MetaplecticAutomorphicForms:MP.5/global-theta-lift
Integrable theta pairing. Lean’s total Bochner integral returns zero for a nonintegrable input; that behavior is tested explicitly. It is not a convergent mathematical theta lift, whose integrability gate remains mandatory in the packet. -/
def globalThetaLift [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (f : H → ℂ) (g : G) : ℂ := ∫ h, θ g h*star (f h) ∂μ
lemma globalThetaLift_apply [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (f : H → ℂ) (g : G) : globalThetaLift μ θ f g = ∫ h, θ g h*star (f h) ∂μ := by sorry
lemma globalThetaLift_equivariant [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (f : H → ℂ) (g a : G) : globalThetaLift μ θ f (g*a) = globalThetaLift μ (fun x h => θ (x*a) h) f g := by sorry
lemma globalThetaLift_central [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (f : H → ℂ) (z g : G) (χ : ℂ) : globalThetaLift μ θ f (z*g) = χ*globalThetaLift μ θ f g := by sorry
-- Test: TauCeti.Metaplectic.globalThetaLift_zero
example [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (g : G) : globalThetaLift μ θ 0 g = 0 := by sorry
-- Test: TauCeti.Metaplectic.globalThetaLift_compact
example [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (f : H → ℂ) (g : G) (h : Integrable (fun x => θ g x*star (f x)) μ) : globalThetaLift μ θ f g = ∫ x, θ g x*star (f x) ∂μ := by sorry
-- Test: TauCeti.Metaplectic.globalThetaLift_divergent
example [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (f : H → ℂ) (g : G) (h : ¬Integrable (fun x => θ g x*star (f x)) μ) : globalThetaLift μ θ f g = 0 := by sorry
/- MetaplecticAutomorphicForms:MP.5/theta-integral-convergence
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem thetaIntegral_converges (m r n : ℤ) (ε₀ : ℤ) [MeasurableSpace H] (μ : Measure H) (θ : H → ℂ) (h : r = 0 ∨ n+ε₀ < m-r) : Integrable θ μ := by sorry
/- MetaplecticAutomorphicForms:MP.5/regularized-theta-integral
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def regularizedTheta [MeasurableSpace H] (μ : Measure H) (τ κ : ℂ) (P : ℂ → ℂ) (θ : G → H → ℂ) (E : ℂ → H → ℂ) (s : ℂ) (g : G) : ℂ := (τ*κ*P s)⁻¹ * ∫ h, θ g h*E s h ∂μ
lemma regularizedTheta_regularizer [MeasurableSpace H] (μ : Measure H) (τ κ : ℂ) (P Q : ℂ → ℂ) (θ ζ : G → H → ℂ) (E : ℂ → H → ℂ) (s : ℂ) (g : G) : regularizedTheta μ τ κ P θ E s g = regularizedTheta μ τ κ Q ζ E s g := by sorry
lemma regularizedTheta_convergent [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (g : G) : regularizedTheta μ 1 1 (fun _ => 1) θ (fun _ _ => 1) 0 g = ∫ h, θ g h ∂μ := by sorry
lemma regularizedTheta_laurent (B : ℂ → ℂ) (coeff : ℤ → ℂ) (ρ s : ℂ) : B s = ∑' k : ℤ, coeff k*(s-ρ)^k := by sorry
-- Test: TauCeti.Metaplectic.regularizedTheta_zero
example [MeasurableSpace H] (μ : Measure H) (τ κ : ℂ) (P : ℂ → ℂ) (E : ℂ → H → ℂ) (s : ℂ) (g : G) : regularizedTheta μ τ κ P (fun _ _ => 0) E s g = 0 := by sorry
-- Test: TauCeti.Metaplectic.regularizedTheta_scale
example [MeasurableSpace H] (μ : Measure H) (τ κ a : ℂ) (ha : a ≠ 0) (P : ℂ → ℂ) (θ : G → H → ℂ) (E : ℂ → H → ℂ) (s : ℂ) (g : G) : regularizedTheta μ τ κ (fun s => a*P s) (fun g h => a*θ g h) E s g = regularizedTheta μ τ κ P θ E s g := by sorry
-- Test: TauCeti.Metaplectic.regularizedTheta_splitBinary
example [MeasurableSpace H] (μ : Measure H) (P : ℂ → ℂ) (θ : G → H → ℂ) (E : ℂ → H → ℂ) (s : ℂ) (g : G) : regularizedTheta μ (1/2) 2 P θ E s g = (P s)⁻¹*(∫ h, θ g h*E s h ∂μ) := by sorry
/- MetaplecticAutomorphicForms:MP.5/extended-schwartz-weil
The real vector fragment is polynomial-times-Gaussian. In the similitude API ρ is the actual GO action, act its defining action and ν its multiplier: pullback uses (g⁻¹x,ν(g)u). In the restriction API the source GO isometry/GL₂ inclusion identifies the extended and usual oscillator actions at u=1. The full GL₂ action, adelic carrier and original Waldspurger/YZZ13 proof remain recorded supplier/source gaps. -/
def extendedSchwartzWeil (q : X → ℝ) (P₁ P₂ : ℝ → ℂ) (x : X) (u : ℝ) : ℂ := (P₁ (u*q x)+(SignType.sign u : ℂ)*P₂ (u*q x))*Real.exp (-2*Real.pi*abs u*q x)
lemma extendedSchwartzWeil_similitude (act : G → X → X) (ν : G → ℝ) (ρ : Representation ℂ G (X → ℝ → ℂ)) (φ : X → ℝ → ℂ) (g : G) (x : X) (u : ℝ) : ρ g φ x u = φ (act g⁻¹ x) (ν g*u) := by sorry
lemma extendedSchwartzWeil_restrict (ρExtended : Representation ℂ G (X → ℝ → ℂ)) (ρUsual : Representation ℂ H (X → ℂ)) (incl : H →* G) (φ : X → ℝ → ℂ) (h : H) (x : X) : ρExtended (incl h) φ x 1 = ρUsual h (fun x => φ x 1) x := by sorry
lemma extendedSchwartzWeil_real (q : X → ℝ) (P₁ P₂ : ℝ → ℂ) (x : X) (u : ℝ) : extendedSchwartzWeil q P₁ P₂ x u = (P₁ (u*q x)+(SignType.sign u : ℂ)*P₂ (u*q x))*Real.exp (-2*Real.pi*abs u*q x) := by sorry
-- Test: TauCeti.Metaplectic.extendedSchwartzWeil_zero
example (q : X → ℝ) (x : X) (u : ℝ) : extendedSchwartzWeil q (fun _ => 0) (fun _ => 0) x u = 0 := by sorry
-- Test: TauCeti.Metaplectic.extendedSchwartzWeil_sign
example (q : X → ℝ) (P₁ P₂ : ℝ → ℂ) (x : X) (u : ℝ) (hu : u < 0) : extendedSchwartzWeil q P₁ P₂ x u = (P₁ (u*q x)-P₂ (u*q x))*Real.exp (-2*Real.pi*abs u*q x) := by sorry
-- Test: TauCeti.Metaplectic.extendedSchwartzWeil_gaussian
example (q : X → ℝ) (x : X) : extendedSchwartzWeil q (fun _ => 1) (fun _ => 0) x 1 = Real.exp (-2*Real.pi*q x) := by sorry
/- MetaplecticAutomorphicForms:MP.5/unit-quotiented-theta
Y is the actual μ² quotient, X=V(F); absolute summability and simultaneous orbit reindexing are packet conditions. The stabilizer Bool test assumes the source’s distinct ±1. -/
def unitTheta (terms : Y → X → ℂ) : ℂ := ∑' y, ∑' x, terms y x
lemma unitTheta_representative (terms : Y → X → ℂ) (e : Y ≃ Y) (change : Y → X ≃ X) : unitTheta (fun y x => terms (e y) (change y x)) = unitTheta terms := by sorry
lemma unitTheta_rational (terms : G → Y → X → ℂ) (γ g : G) : unitTheta (terms (γ*g)) = unitTheta (terms g) := by sorry
lemma unitTheta_multiplicity (K : Subgroup G) (minusOne : G) (hneg : minusOne ≠ 1) : Finset.card (Finset.filter (fun b : Bool => (if b then minusOne else 1) ∈ K) Finset.univ) = if minusOne ∈ K then 2 else 1 := by sorry
-- Test: TauCeti.Metaplectic.unitTheta_zero
example : unitTheta (fun _ : Y => fun _ : X => (0:ℂ)) = 0 := by sorry
-- Test: TauCeti.Metaplectic.unitTheta_minusOne
example (K : Subgroup G) (minusOne : G) (h : minusOne ∈ K) : Finset.card (Finset.filter (fun b : Bool => (if b then minusOne else 1) ∈ K) Finset.univ) = 2 := by sorry
-- Test: TauCeti.Metaplectic.unitTheta_orbit
example : ¬ Summable (fun _ : ℤ => (1 : ℂ)) := by sorry
/- MetaplecticAutomorphicForms:MP.5/extended-restriction-comparison
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem extendedWeil_restriction (d d₁ : ℝ) (δ ρ χratio : ℂ) (left right : ℂ) : left = χratio * δ^((d-d₁)/2 : ℂ) * ρ^((d-d₁)/2 : ℂ) * right := by sorry
/- MetaplecticAutomorphicForms:MP.5/genuine-eisenstein-family
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def genuineEisenstein (terms : X → ℂ → G → ℂ) (s : ℂ) (g : G) : ℂ := ∑' x, terms x s g
lemma genuineEisenstein_sum (terms : X → ℂ → G → ℂ) (s : ℂ) (g : G) : genuineEisenstein terms s g = ∑' γ, terms γ s g := by sorry
lemma genuineEisenstein_central (terms : X → ℂ → G → ℂ) (s : ℂ) (z g : G) : genuineEisenstein terms s (z*g) = -genuineEisenstein terms s g := by sorry
lemma genuineEisenstein_constantTerm (E₀ E₁ M : ℂ → G → ℂ) (s : ℂ) (g : G) : E₀ s g = E₁ s g + M s g := by sorry
-- Test: TauCeti.Metaplectic.genuineEisenstein_zero
example (s : ℂ) (g : G) : genuineEisenstein (fun _ : X => fun _ _ => 0) s g = 0 := by sorry
-- Test: TauCeti.Metaplectic.genuineEisenstein_sign
example (terms : X → ℂ → G → ℂ) (s : ℂ) (z g : G) (hgenuine : ∀ x, terms x s (z*g) = -terms x s g) (hEis : genuineEisenstein terms s g ≠ 0) : genuineEisenstein terms s (z*g) ≠ genuineEisenstein terms s g := by sorry
-- Test: TauCeti.Metaplectic.genuineEisenstein_siegel
example (sectionParameter : ℕ → ℕ → ℕ → ℂ) (m n ε : ℕ) : sectionParameter m n ε = ((m : ℂ)-(n+ε))/2 := by sorry
end ThetaFunctions
section ThetaIntegrals
variable {G H X Y Z V : Type*} [Group G] [Group H] [Zero X] [Zero Y] [Zero Z]
 [MeasurableSpace X] [MeasurableSpace H]
 [AddCommGroup V] [Module ℂ V]
/- MetaplecticAutomorphicForms:MP.6/theta-measure-normalizations
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem theta_measureComparison (τ : ℝ) (μ : Measure H) (f : H → ℂ) : (τ : ℂ)⁻¹ * (∫ h, f h ∂μ) = (∫ h, (τ : ℂ)⁻¹*f h ∂μ) := by sorry
/- MetaplecticAutomorphicForms:MP.6/siegel-weil-section
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def siegelWeilSection (ω : Representation ℂ G (X → ℂ)) (φ : X → ℂ) : G → ℂ := fun g => ω g φ 0
lemma siegelWeilSection_apply (ω : Representation ℂ G (X → ℂ)) (φ : X → ℂ) (g : G) : siegelWeilSection ω φ g = ω g φ 0 := by sorry
lemma siegelWeilSection_covariance (ω : Representation ℂ G (X → ℂ)) (φ : X → ℂ) (p g : G) (χ : ℂ) : siegelWeilSection ω φ (p*g) = χ*siegelWeilSection ω φ g := by sorry
lemma siegelWeilSection_laurent (A : ℤ → ℂ) (E : ℂ → ℂ) (s s₀ : ℂ) : E s = ∑' k : ℤ, A k*(s-s₀)^k := by sorry
-- Test: TauCeti.Metaplectic.siegelWeilSection_zero
example (ω : Representation ℂ G (X → ℂ)) : siegelWeilSection ω 0 = 0 := by sorry
-- Test: TauCeti.Metaplectic.siegelWeilSection_identity
example (ω : Representation ℂ G (X → ℂ)) (φ : X → ℂ) : siegelWeilSection ω φ 1 = φ 0 := by sorry
-- Test: TauCeti.Metaplectic.siegelWeilSection_parameter
example : ((2:ℂ) - (1+1))/2 = 0 ∧ ((2:ℂ)/2) ≠ 0 := by sorry
/- MetaplecticAutomorphicForms:MP.6/ikeda-map
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def ikedaMap (μ : Measure X) (φ : X → Y → Z → ℂ) (a : Y) : ℂ := ∫ x, φ x a 0 ∂μ
lemma ikedaMap_apply (μ : Measure X) (φ : X → Y → Z → ℂ) (a : Y) : ikedaMap μ φ a = ∫ x, φ x a 0 ∂μ := by sorry
lemma ikedaMap_comp [MeasurableSpace Y] (μ : Measure X) (ν : Measure Y) (φ : X → Y → Z → ℂ) : (∫ a, ikedaMap μ φ a ∂ν) = ∫ x, ∫ a, φ x a 0 ∂ν ∂μ := by sorry
lemma ikedaMap_equivariant (μ : Measure X) (ρ : Representation ℂ G (X → Y → Z → ℂ)) (σ : Representation ℂ G (Y → ℂ)) (χ : G →* ℂˣ) (φ : X → Y → Z → ℂ) (g : G) (a : Y) : ikedaMap μ (ρ g φ) a = (χ g : ℂ)*σ g (fun a => ikedaMap μ φ a) a := by sorry
-- Test: TauCeti.Metaplectic.ikedaMap_identity
example (φ : Unit → Y → Z → ℂ) (a : Y) : ikedaMap (Measure.dirac ()) φ a = φ () a 0 := by sorry
-- Test: TauCeti.Metaplectic.ikedaMap_product
example (μ : Measure X) (f : X → ℂ) (g : Y → ℂ) (h : Z → ℂ) (a : Y) : ikedaMap μ (fun x a z => f x*g a*h z) a = (∫ x, f x ∂μ)*g a*h 0 := by sorry
-- Test: TauCeti.Metaplectic.ikedaMap_measure
example (μ : Measure X) (c : ℝ≥0) (φ : X → Y → Z → ℂ) (a : Y) : ikedaMap (c • μ) φ a = (c:ℂ)*ikedaMap μ φ a := by sorry
/- MetaplecticAutomorphicForms:MP.6/anisotropic-siegel-weil
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem siegelWeil_anisotropic (s₀ : ℝ) (τ degree : ℂ) (E I : ℂ) : E = (if 0 < s₀ then 1 else 2)*τ/degree*I := by sorry
/- MetaplecticAutomorphicForms:MP.6/first-term-identity
First-term/boundary nonexceptional signature. The split O(1,1) A₀=BnegOne=0 and A₁=B₀ branch is separately recorded in the packet; no use of this generic signature in that exception. -/
theorem siegelWeil_firstTerm (A B : ℤ → ℂ) : A 0 = 2*B (-1) := by sorry
/- MetaplecticAutomorphicForms:MP.6/second-term-identity
Native residual-image membership, expressing the quotient identity. B₀ is the Ikeda(K_Hφ) correction; residual is Im A₋₁, so no literal A₀=BnegOne identity is asserted without vanishing. -/
theorem siegelWeil_secondTerm (residual : Submodule ℂ V) (A₀ BnegOne B₀ : V) (κ : ℂ) : A₀-BnegOne+κ • B₀ ∈ residual := by sorry
/- MetaplecticAutomorphicForms:MP.6/coherent-incoherent-sections
Restricted tensor evaluation fragment, with almost-all spherical value1. Coherence is existence of a global quadratic/Hermitian form, not a new assumed Prop field; only its necessary invariant product is prototyped. -/
def thetaSectionCollection (places : Type*) (sections : places → G → ℂ) : G → ℂ := fun g => ∏' v, sections v g
lemma thetaSectionCollection_tensor (places : Type*) (sections : places → G → ℂ) (g : G) : thetaSectionCollection places sections g = ∏' v, sections v g := by sorry
lemma thetaSectionCollection_global (places : Type*) (sections : places → G → ℂ) (ω : Representation ℂ G (X → ℂ)) (φ : X → ℂ) : thetaSectionCollection places sections = siegelWeilSection ω φ := by sorry
lemma thetaSectionCollection_incoherent (places globalSpaces : Type*) (inv : places → ℂˣ) (localization : globalSpaces → places → ℂˣ) (S : Finset places) (hglobal : ∀ V, ∏ v ∈ S, localization V v = 1) (hincoherent : ∏ v ∈ S, inv v ≠ 1) : ¬ ∃ V, ∀ v, localization V v = inv v := by sorry
-- Test: TauCeti.Metaplectic.thetaSectionCollection_globalExample
example (places : Type*) (inv : places → ℂˣ) (S : Finset places) : ∏ v ∈ S, inv v = 1 := by sorry
-- Test: TauCeti.Metaplectic.thetaSectionCollection_oneFlip
example (places : Type*) [DecidableEq places] (inv : places → ℂˣ) (S : Finset places) (v : places) (hv : v ∈ S) (h : ∏ w ∈ S, inv w = 1) : ∏ w ∈ S, (if w = v then -inv w else inv w) = -1 := by sorry
-- Test: TauCeti.Metaplectic.thetaSectionCollection_standard
example (places : Type*) (sections : places → G → ℂ) (h : ∀ v, sections v 1 = 1) : thetaSectionCollection places sections 1 = 1 := by sorry
/- MetaplecticAutomorphicForms:MP.6/unitary-siegel-weil-measure
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem unitary_siegelWeilMeasure (I W b : ℂ) : I = b*W := by sorry
/- MetaplecticAutomorphicForms:MP.6/pi-coherence-parity
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem unitaryTheta_coherenceParity (r degree : ℕ) (v : Finset X) (η : X → ℂˣ) : ∏ x ∈ v, η x = -(-1 : ℂˣ)^(r*degree) := by sorry
end ThetaIntegrals
section Doubling
variable {G X H : Type*} [Group G] [MeasurableSpace G] [Zero X] [NormedAddCommGroup H] [InnerProductSpace ℂ H]
open scoped InnerProductSpace
/- MetaplecticAutomorphicForms:MP.6/doubling-schwartz-map
δ(φ⊗conjugate ψ) evaluation fragment, using Mathlib’s conjugate-linear-first inner product; ⟪ψ,φ⟫ matches the source linear-first convention. The actual partial Fourier Schwartz/tensor map and determinant twist require AL/SR suppliers. -/
def doublingSchwartz (φ ψ : H) : X → ℂ := by sorry
lemma doublingSchwartz_eval_zero (φ ψ : H) : doublingSchwartz (X := X) φ ψ 0 = ⟪ψ,φ⟫_ℂ := by sorry
lemma doublingSchwartz_equivariant (ρ : ContRepresentation ℂ G H) (doubledAction : Representation ℂ (G × G) (X → ℂ)) (χ : (G × G) →* ℂˣ) (φ ψ : H) (g h : G) (x : X) : doublingSchwartz (ρ g φ) (ρ h ψ) x = (χ (g,h) : ℂ)*doubledAction (g,h) (doublingSchwartz φ ψ) x := by sorry
lemma doublingSchwartz_pureTensor (φ ψ : H) (x : X) (partialFT : H → H → X → ℂ) : doublingSchwartz φ ψ x = partialFT φ ψ x := by sorry
-- Test: TauCeti.Metaplectic.doublingSchwartz_zero
example (ψ : H) : doublingSchwartz (X := X) 0 ψ = 0 := by sorry
-- Test: TauCeti.Metaplectic.doublingSchwartz_norm
example (φ : H) : doublingSchwartz (X := X) φ φ 0 = (‖φ‖^2 : ℝ) := by sorry
-- Test: TauCeti.Metaplectic.doublingSchwartz_conjugate
example : (Complex.I : ℂ) * star Complex.I = 1 ∧ Complex.I * Complex.I = -1 := by sorry
/- MetaplecticAutomorphicForms:MP.6/local-doubling-integral
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def localDoublingZeta (μ : Measure G) (ρ : ContRepresentation ℂ G H) (sectionFn : ℂ → G → ℂ) (s : ℂ) (φ ψ : H) : ℂ := ∫ g, sectionFn s g*⟪ψ,ρ g φ⟫_ℂ ∂μ
lemma localDoublingZeta_integral (μ : Measure G) (ρ : ContRepresentation ℂ G H) (sectionFn : ℂ → G → ℂ) (s : ℂ) (φ ψ : H) : localDoublingZeta μ ρ sectionFn s φ ψ = ∫ g, sectionFn s g*⟪ψ,ρ g φ⟫_ℂ ∂μ := by sorry
lemma localDoublingZeta_unramified (μ : Measure G) (ρ : ContRepresentation ℂ G H) (sectionFn : ℂ → G → ℂ) (s L d : ℂ) (φ ψ : H) : localDoublingZeta μ ρ sectionFn s φ ψ = L/d := by sorry
lemma localDoublingZeta_normalized (μ : Measure G) (ρ : ContRepresentation ℂ G H) (sectionFn : ℂ → G → ℂ) (s L : ℂ) (φ ψ : H) : localDoublingZeta μ ρ sectionFn s φ ψ / L = L⁻¹ * localDoublingZeta μ ρ sectionFn s φ ψ := by sorry
-- Test: TauCeti.Metaplectic.localDoublingZeta_zero
example (μ : Measure G) (ρ : ContRepresentation ℂ G H) (sectionFn : ℂ → G → ℂ) (s : ℂ) (ψ : H) : localDoublingZeta μ ρ sectionFn s 0 ψ = 0 := by sorry
-- Test: TauCeti.Metaplectic.localDoublingZeta_spherical
example (L d : ℂ) (hL : L ≠ 0) : (L/d)/L = d⁻¹ := by sorry
-- Test: TauCeti.Metaplectic.localDoublingZeta_measure
example (μ : Measure G) (c : ℝ≥0) (ρ : ContRepresentation ℂ G H) (sectionFn : ℂ → G → ℂ) (s : ℂ) (φ ψ : H) : localDoublingZeta (c • μ) ρ sectionFn s φ ψ = (c:ℂ)*localDoublingZeta μ ρ sectionFn s φ ψ := by sorry
/- MetaplecticAutomorphicForms:MP.6/theta-integral-factorization
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem thetaPairing_factorization (places : Type*) (S : Finset places) (Z : places → ℂ) (L globalPairing : ℂ) : globalPairing = L * ∏ v ∈ S, Z v := by sorry
/- MetaplecticAutomorphicForms:MP.6/rallis-inner-product
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem rallis_innerProduct (φ ψ : H) (degree L Zstar : ℂ) : ⟪ψ,φ⟫_ℂ = degree*L*Zstar := by sorry
/- MetaplecticAutomorphicForms:MP.6/global-theta-nonvanishing
Scalar nonvanishing fragment under all local nonzero and GQT11.7’s stated archimedean hypotheses; outside those cases the conclusion allows V′ with changed real signatures, not the original V. -/
theorem globalTheta_nonvanishing (lift : H → H) (L : ℂ) : (∃ v, lift v ≠ 0) ↔ L ≠ 0 := by sorry
/- MetaplecticAutomorphicForms:MP.6/global-see-saw-and-projection
The compatible global see-saw theta kernel and absolute integrability on the quotient product are required; regularized pairings and spectral projection need the packet’s separate proof gates. -/
theorem globalTheta_seeSaw [MeasurableSpace H] (μ : Measure G) (ν : Measure H) (theta : G → H → ℂ) (f : G → ℂ) (h : H → ℂ) : (∫ g, ∫ x, theta g x*star (f g)*star (h x) ∂ν ∂μ) = ∫ x, ∫ g, theta g x*star (f g)*star (h x) ∂μ ∂ν := by sorry
/- MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances
Range classification fragment: anisotropic binary/ternary convergent, split binary boundary, split ternary second-term. The actual norm-form case and rank conditions in the packet are required; it is not a disjunction for arbitrary integers. -/
theorem normTheta_integralRange (m r n : ℤ) : (r = 0 ∨ n+1 < m-r) ∨ (m = n+1 ∧ r = 1) ∨ n+1 < m := by sorry
/- MetaplecticAutomorphicForms:MP.6/toric-theta-pairing-interface
Normalized pairing interface only. The actual torus/GL₂ representations and Schwartz input and convergence are required; Waldspurger’s period/L-value theorem remains GZ.5’s responsibility. -/
theorem toricTheta_pairingComparison (θPeriod toricPairing normalization : ℂ) : θPeriod = normalization*toricPairing := by sorry
end Doubling
section Jacobi
variable {G N Z X : Type*} [Group G] [Group N] [Group Z] [Zero X]
def schroedingerWeil (act : G →* MulAut N) (rho : Representation ℂ N (X → ℂ)) (omega : Representation ℂ G (X → ℂ)) (p : N ⋊[act] G) : (X → ℂ) →ₗ[ℂ] (X → ℂ) := (rho p.left).comp (omega p.right)
/- MetaplecticAutomorphicForms:MP.6/jacobi-group
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def jacobiGroup (act : G →* MulAut N) : Type _ := N ⋊[act] G
lemma jacobiGroup_mul (act : G →* MulAut N) (a b : N ⋊[act] G) : a*b = ⟨a.left*act a.right b.left,a.right*b.right⟩ := by sorry
lemma schroedingerWeil_apply (act : G →* MulAut N) (ρ : Representation ℂ N (X → ℂ)) (ω : Representation ℂ G (X → ℂ)) (p : N ⋊[act] G) (φ : X → ℂ) : schroedingerWeil act ρ ω p φ = ρ p.left (ω p.right φ) := by sorry
lemma jacobiGroup_similitude (ψ : Z →* ℂˣ) (a : Z →* Z) (z : Z) : ψ (a z) = (ψ.comp a) z := by sorry
-- Test: TauCeti.Metaplectic.jacobiGroup_identity
example (act : ↥(rootsOfUnity 2 ℂ) →* MulAut (Multiplicative ℝ)) (hact : act = 1) : (Multiplicative ℝ) ⋊[act] ↥(rootsOfUnity 2 ℂ) ≃* (Multiplicative ℝ) × ↥(rootsOfUnity 2 ℂ) := by sorry
-- Test: TauCeti.Metaplectic.jacobiGroup_translation
example (act : G →* MulAut N) (ρ : Representation ℂ N (X → ℂ)) (ω : Representation ℂ G (X → ℂ)) (n : N) (φ : X → ℂ) : schroedingerWeil act ρ ω (SemidirectProduct.inl n) φ = ρ n φ := by sorry
-- Test: TauCeti.Metaplectic.jacobiGroup_covariance
example (act : G →* MulAut N) (g : G) (n : N) : (SemidirectProduct.inr g : N ⋊[act] G) * SemidirectProduct.inl n = SemidirectProduct.inl (act g n) * SemidirectProduct.inr g := by sorry
/- MetaplecticAutomorphicForms:MP.6/jacobi-spaces
Central-character subspace fragment. Full elliptic/weight covariance, archimedean holomorphy, cusp/growth and rational finite-level lattice are packet hypotheses pending native Jacobi space suppliers; the BFH lattice scale is rational, not a private wrapper. -/
def jacobiSpace (center : Z → X → X) (ψ : Z →* ℂˣ) : Submodule ℂ (X → ℂ) := by sorry
lemma jacobiSpace_central (center : Z → X → X) (ψ : Z →* ℂˣ) (f : jacobiSpace center ψ) (z : Z) (x : X) : f.val (center z x) = (ψ z : ℂ)*f.val x := by sorry
lemma jacobiSpace_elliptic (act : N → X → X) (phase : N → X → ℂ) (f : X → ℂ) (n : N) (x : X) : f (act n x) = phase n x*f x := by sorry
lemma jacobiSpace_weight (act : G → X → X) (J : G → X → ℂ) (f : X → ℂ) (g : G) (x : X) : f (act g x) = J g x*f x := by sorry
-- Test: TauCeti.Metaplectic.jacobiSpace_zero
example (center : Z → X → X) (ψ : Z →* ℂˣ) : (0 : X → ℂ) ∈ jacobiSpace center ψ := by sorry
-- Test: TauCeti.Metaplectic.jacobiSpace_index
example (center : Z → X → X) (ψ χ : Z →* ℂˣ) (f : jacobiSpace center ψ) (z : Z) (x : X) (hψ : ψ z ≠ χ z) (hf : f.val x ≠ 0) : f.val (center z x) ≠ (χ z : ℂ)*f.val x := by sorry
-- Test: TauCeti.Metaplectic.jacobiSpace_bfh
example (n N : ℕ) : (fun a : Fin n → ℤ => fun i => (a i : ℚ)/N) = (fun a => fun i => (a i : ℚ)*(N:ℚ)⁻¹) := by sorry
/- MetaplecticAutomorphicForms:MP.6/fourier-jacobi-extraction
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def fourierJacobi [MeasurableSpace Z] (μ : Measure Z) (center : Z → X → X) (ψ : Z →* ℂˣ) (f : X → ℂ) (x : X) : ℂ := ∫ z, f (center z x)*star (ψ z : ℂ) ∂μ
lemma fourierJacobi_index [MeasurableSpace Z] (μ : Measure Z) (center : Z → X → X) (ψ : Z →* ℂˣ) (f : X → ℂ) (z : Z) (x : X) : fourierJacobi μ center ψ f (center z x) = (ψ z : ℂ)*fourierJacobi μ center ψ f x := by sorry
lemma fourierJacobi_equivariant [MeasurableSpace Z] (μ : Measure Z) (center : Z → X → X) (ψ : Z →* ℂˣ) (f : X → ℂ) (act : G → X → X) (g : G) (x : X) : fourierJacobi μ center ψ (fun x => f (act g x)) x = fourierJacobi μ center ψ f (act g x) := by sorry
lemma fourierJacobi_coefficient [MeasurableSpace Z] (μ : Measure Z) (ψ : Z →* ℂˣ) (hμ : μ Set.univ = 1) (hψ : ∀ z, ‖(ψ z : ℂ)‖ = 1) : (∫ z, (ψ z : ℂ)*star (ψ z : ℂ) ∂μ) = 1 := by sorry
-- Test: TauCeti.Metaplectic.fourierJacobi_zero
example [MeasurableSpace Z] (μ : Measure Z) (center : Z → X → X) (ψ : Z →* ℂˣ) (x : X) : fourierJacobi μ center ψ 0 x = 0 := by sorry
-- Test: TauCeti.Metaplectic.fourierJacobi_matching
example [MeasurableSpace Z] (μ : Measure Z) (ψ : Z →* ℂˣ) (hμ : μ Set.univ = 1) (hψ : ∀ z, ‖(ψ z : ℂ)‖ = 1) : (∫ z, (ψ z : ℂ)*star (ψ z : ℂ) ∂μ) = 1 := by sorry
-- Test: TauCeti.Metaplectic.fourierJacobi_mismatch
example [MeasurableSpace Z] (μ : Measure Z) (ψ χ : Z →* ℂˣ) (h : ψ ≠ χ) : (∫ z, (χ z : ℂ)*star (ψ z : ℂ) ∂μ) = 0 := by sorry
/- MetaplecticAutomorphicForms:MP.6/jacobi-theta-decomposition-interface
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem jacobi_thetaDecomposition (D : Type*) [Fintype D] (theta : D → X → ℂ) (h : D → ℂ) (f : X → ℂ) : f = fun x => ∑ μ, h μ*theta μ x := by sorry
end Jacobi
section IdealTheta
/- MetaplecticAutomorphicForms:MP.5/ideal-class-theta
Norm-count theta function. w and r must be the imaginary-quadratic unit count and ideal-class coefficients, with n=0 separated from nonzero ideals; the lattice/ideal counting dictionary stays GN.3. -/
def idealClassTheta (w : ℕ) (r : ℕ → ℂ) (z : ℍ) : ℂ := (w:ℂ)⁻¹ + ∑' n : ℕ, r (n+1)*Complex.exp (2*Real.pi*Complex.I*(n+1)*(z:ℂ))
lemma idealClassTheta_coeff (w : ℕ) (r : ℕ → ℂ) (z : ℍ) : idealClassTheta w r z = (w:ℂ)⁻¹ + ∑' n : ℕ, r (n+1)*Complex.exp (2*Real.pi*Complex.I*(n+1)*(z:ℂ)) := by sorry
lemma idealClassTheta_constant (w : ℕ) (r : ℕ → ℂ) (constantCoefficient : (ℍ → ℂ) → ℂ) : constantCoefficient (idealClassTheta w r) = (w:ℂ)⁻¹ := by sorry
lemma idealClassTheta_lattice (Λ : Type*) (w : ℕ) (N : Λ → ℕ) (r : ℕ → ℂ) (z : ℍ) : idealClassTheta w r z = (w:ℂ)⁻¹ * ∑' ell, Complex.exp (2*Real.pi*Complex.I*N ell*(z:ℂ)) := by sorry
-- Test: TauCeti.Metaplectic.idealClassTheta_gaussianUnits
example (r : ℕ → ℂ) (constantCoefficient : (ℍ → ℂ) → ℂ) : constantCoefficient (idealClassTheta 4 r) = 1/4 := by sorry
-- Test: TauCeti.Metaplectic.idealClassTheta_conjugate
example (w : ℕ) (r r' : ℕ → ℂ) (h : r = r') (z : ℍ) : idealClassTheta w r z = idealClassTheta w r' z := by sorry
-- Test: TauCeti.Metaplectic.idealClassTheta_zeroIdeal
example (w : ℕ) (r : ℕ → ℂ) (constantCoefficient : (ℍ → ℂ) → ℂ) : constantCoefficient (idealClassTheta w r) = (w : ℂ)⁻¹ := by sorry
/- MetaplecticAutomorphicForms:MP.5/ideal-class-theta-modularity
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem idealClassTheta_modular (w : ℕ) (r : ℕ → ℂ) (γ : ℍ → ℍ) (j : ℍ → ℂ) (z : ℍ) : idealClassTheta w r (γ z) = j z * idealClassTheta w r z := by sorry
/- MetaplecticAutomorphicForms:MP.5/ideal-class-theta-conjugation
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem idealClassTheta_conjugation (w : ℕ) (r rInv : ℕ → ℂ) (z : ℍ) : idealClassTheta w r z = idealClassTheta w rInv z := by sorry
/- MetaplecticAutomorphicForms:MP.6/ideal-lattice-poisson
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem idealLattice_poisson (Λ dualΛ : Type*) (q : Λ → ℝ) (qd : dualΛ → ℝ) (volume : ℂ) (z : ℍ) : (∑' x, Complex.exp (2*Real.pi*Complex.I*q x*(z:ℂ))) = (volume*(z:ℂ))⁻¹ * ∑' y, Complex.exp (-2*Real.pi*Complex.I*qd y/(z:ℂ)) := by sorry
/- MetaplecticAutomorphicForms:MP.5/ideal-class-theta-general-transform
General SL₂ integral transform fragment with the source δ-indexed Gauss sum and determinant/ideal twist in factor/transformed. GZ’s explicit Lemma2.3 has odd fundamental discriminant; no all-D explicit formula is asserted. -/
theorem idealClassTheta_transform (w : ℕ) (r : ℕ → ℂ) (γ : ℍ → ℍ) (factor : ℍ → ℂ) (transformed : ℍ → ℂ) (z : ℍ) : idealClassTheta w r (γ z) = factor z * transformed z := by sorry
end IdealTheta
section HalfWeight
open scoped Real
abbrev GammaFour := CongruenceSubgroup.Gamma0 4
def infinityStabilizer : Subgroup GammaFour where
 carrier := {gamma | gamma.val 1 0 = 0}
 one_mem' := by sorry
 mul_mem' := by sorry
 inv_mem' := by sorry
abbrev InfinityCosets := Quotient (QuotientGroup.rightRel infinityStabilizer)
def cosetRepresentative (c : InfinityCosets) : GammaFour := c.out


def unitaryThetaSeed (z : ℍ) : ℂ := (Real.rpow z.im (1/4) : ℂ) * jacobiTheta (2*(z:ℂ))
def weightHalfEigenvalue (r : ℝ) : ℂ := 1/4 + ((r:ℂ)/2)^2

def shiftFour (ν : Fin 4) (z : ℍ) : ℍ := ⟨((z:ℂ)+(ν:ℕ))/4,by sorry⟩
def invertFour (z : ℍ) : ℍ := ⟨-1/(4*(z:ℂ)),by sorry⟩
def phaseW (z : ℍ) : ℂ := Complex.exp (Complex.I*Real.pi/4) *
 ((z:ℂ)/(‖(z:ℂ)‖:ℂ))^(-1/2 : ℂ)

def plusU (F : ℍ → ℂ) (z : ℍ) : ℂ := (Real.sqrt 2 : ℂ)/4 * ∑ ν : Fin 4, F (shiftFour ν z)
def plusW (F : ℍ → ℂ) (z : ℍ) : ℂ := phaseW z * F (invertFour z)
def plusPr (F : ℍ → ℂ) : ℍ → ℂ := (2/3:ℂ) • plusW (plusU F) + (1/3:ℂ) • F
/- MetaplecticAutomorphicForms:MP.7/theta-multiplier
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def thetaMultiplier (γ : GammaFour) (z : ℍ) : ℂ := unitaryThetaSeed (γ • z)/unitaryThetaSeed z
lemma thetaMultiplier_thetaRatio (γ : GammaFour) (z : ℍ) : thetaMultiplier γ z = unitaryThetaSeed (γ • z)/unitaryThetaSeed z := by sorry
lemma thetaMultiplier_cocycle (γ δ : GammaFour) (z : ℍ) : thetaMultiplier (γ*δ) z = thetaMultiplier γ (δ • z)*thetaMultiplier δ z := by sorry
lemma thetaMultiplier_unitary (γ : GammaFour) (z : ℍ) : ‖thetaMultiplier γ z‖ = 1 := by sorry
-- Test: TauCeti.Metaplectic.thetaMultiplier_test1
example (z : ℍ) : thetaMultiplier 1 z = 1 := by sorry
-- Test: TauCeti.Metaplectic.thetaMultiplier_test2
example (a : ℂ) (ha : a ≠ 0) (γ : GammaFour) (z : ℍ) : (a*unitaryThetaSeed (γ • z))/(a*unitaryThetaSeed z) = thetaMultiplier γ z := by sorry
-- Test: TauCeti.Metaplectic.thetaMultiplier_test3
example (γ δ : GammaFour) (z : ℍ) : (-thetaMultiplier (γ*δ) z) ≠ (-thetaMultiplier γ (δ • z))*(-thetaMultiplier δ z) := by sorry
/- MetaplecticAutomorphicForms:MP.7/half-weight-maass-space
Native function-submodule/eigen/automorphy fragment. Δ is the exact unitary half-weight differential operator, compared to QM.3 by y¼ conjugation and +3/16; smoothness and the self-adjoint three-cusp L² domain remain supplier gaps. -/
def halfWeightMaass (Δ : (ℍ → ℂ) →ₗ[ℂ] (ℍ → ℂ)) (r : ℝ) : Submodule ℂ (ℍ → ℂ) := by sorry
lemma halfWeightMaass_automorphy (Δ : (ℍ → ℂ) →ₗ[ℂ] (ℍ → ℂ)) (r : ℝ) (F : halfWeightMaass Δ r) (γ : GammaFour) (z : ℍ) : F.val (γ • z) = thetaMultiplier γ z*F.val z := by sorry
lemma halfWeightMaass_allCusps (constant : Fin 3 → (ℍ → ℂ) →ₗ[ℂ] ℂ) (F : ℍ → ℂ) : (∀ c, constant c F = 0) ↔ F ∈ ⨅ c, LinearMap.ker (constant c) := by sorry
lemma halfWeightMaass_eigenParameter (Δ : (ℍ → ℂ) →ₗ[ℂ] (ℍ → ℂ)) (r : ℝ) (F : halfWeightMaass Δ r) : Δ F.val = weightHalfEigenvalue r • F.val := by sorry
-- Test: TauCeti.Metaplectic.halfWeightMaass_test1
example (constant : Fin 3 → (ℍ → ℂ) →ₗ[ℂ] ℂ) (F : ℍ → ℂ) (h : constant 0 F = 0) (h₁ : constant 1 F ≠ 0) : ¬ ∀ c, constant c F = 0 := by sorry
-- Test: TauCeti.Metaplectic.halfWeightMaass_test2
example (F : ℍ → ℂ) (γ : GammaFour) (z : ℍ) (hJ : thetaMultiplier γ z ≠ 1) (hF : F z ≠ 0) (hi : F (γ • z) = F z) : F (γ • z) ≠ thetaMultiplier γ z*F z := by sorry
-- Test: TauCeti.Metaplectic.halfWeightMaass_test3
example (r : ℝ) (hr : r ≠ 0) : weightHalfEigenvalue r ≠ 1/4+(r:ℂ)^2 := by sorry
/- MetaplecticAutomorphicForms:MP.7/half-weight-fourier-expansion
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem halfWeight_fourierExpansion (W : ℝ → ℂ → ℝ → ℂ) (b : ℤ → ℂ) (r : ℝ) (F : ℍ → ℂ) (z : ℍ) : F z = ∑' n : ℤ, if n = 0 then 0 else b n * W (if 0 < n then 1/4 else -1/4) (Complex.I*r/2) (4*Real.pi*abs (n:ℝ)*z.im) * Complex.exp (2*Real.pi*Complex.I*n*z.re) := by sorry
def halfWeightEisConstant (Λ : ℂ → ℂ) (s : ℂ) (y : ℝ) : ℂ :=
 Λ (2*s)*(2:ℂ)^s*(y:ℂ)^(s/2+1/4) + Λ (2-2*s)*(2:ℂ)^(1-s)*(y:ℂ)^(3/4-s/2)
def halfWeightEisFourier (b : ℤ → ℂ → ℂ) (W : ℝ → ℂ → ℝ → ℂ) (s : ℂ) (z : ℍ) : ℂ :=
 ∑' n : ℤ, if n = 0 then 0 else b n s*W (if 0 < n then 1/4 else -1/4) (s/2-1/4) (4*Real.pi*abs (n:ℝ)*z.im)*Complex.exp (2*Real.pi*Complex.I*n*z.re)
/- MetaplecticAutomorphicForms:MP.7/half-weight-eisenstein
Source Fourier-series construction, with Λ the completed zeta, b the stated plus coefficients and W the actual Whittaker function. Absolute convergence/meromorphic continuation and constant-term extraction are omitted until AS/AL/QM carriers arrive; arbitrary choices of these functions are not Eisenstein series. -/
def halfWeightEisenstein (Λ : ℂ → ℂ) (b : ℤ → ℂ → ℂ) (W : ℝ → ℂ → ℝ → ℂ) (s : ℂ) (z : ℍ) : ℂ := halfWeightEisConstant Λ s z.im + halfWeightEisFourier b W s z
lemma halfWeightEisenstein_initialSeries (Λ : ℂ → ℂ) (b : ℤ → ℂ → ℂ) (W : ℝ → ℂ → ℝ → ℂ) (s : ℂ) (z : ℍ) : halfWeightEisenstein Λ b W s z = halfWeightEisConstant Λ s z.im + halfWeightEisFourier b W s z := by sorry
lemma halfWeightEisenstein_constantTerms (Λ : ℂ → ℂ) (b : ℤ → ℂ → ℂ) (W : ℝ → ℂ → ℝ → ℂ) (constantTerm : (ℍ → ℂ) → ℝ → ℂ) (s : ℂ) (y : ℝ) : constantTerm (halfWeightEisenstein Λ b W s) y = halfWeightEisConstant Λ s y := by sorry
lemma halfWeightEisenstein_fourierTransport (s : ℂ) : s/2-1/4 = (s/2+1/4)-1/2 := by sorry
-- Test: TauCeti.Metaplectic.halfWeightEisenstein_test1
example : (1:ℂ)/2+1/4 = 3/4 ∧ 3/4-(1:ℂ)/2 = 1/4 := by sorry
-- Test: TauCeti.Metaplectic.halfWeightEisenstein_test2
example : (2:ℂ)^((1:ℂ)) ≠ 1 := by sorry
-- Test: TauCeti.Metaplectic.halfWeightEisenstein_test3
example (y : ℝ) (hy : 0 < y) : (y:ℂ)^((1:ℂ)/2+1/4) ≠ 0 := by sorry
/- MetaplecticAutomorphicForms:MP.7/fundamental-eisenstein-coefficient
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def fundamentalEisensteinCoefficient (Λ : ℤ → ℂ → ℂ) (d : ℤ) (s : ℂ) : ℂ := (Real.rpow (4*Real.pi) (-1/4) * Real.rpow (abs (d:ℝ)) (-3/4) : ℝ) * Λ d s
lemma fundamentalEisensteinCoefficient_fundamentalValue (Λ : ℤ → ℂ → ℂ) (d : ℤ) (s : ℂ) : fundamentalEisensteinCoefficient Λ d s = (Real.rpow (4*Real.pi) (-1/4) * Real.rpow (abs (d:ℝ)) (-3/4) : ℝ) * Λ d s := by sorry
lemma fundamentalEisensteinCoefficient_parityFactor (paper completed : ℤ → ℂ → ℂ) (d : ℤ) (s : ℂ) (α : ℕ) : paper d s = ((abs (d:ℝ):ℝ):ℂ)^(s/2)*(Real.pi:ℂ)^((α:ℂ)/2)*completed d s := by sorry
lemma fundamentalEisensteinCoefficient_product (Λ : ℤ → ℂ → ℂ) (d d' : ℤ) (s : ℂ) : fundamentalEisensteinCoefficient Λ d s*fundamentalEisensteinCoefficient Λ d' s = (Real.rpow (4*Real.pi) (-1/2) * Real.rpow (abs (d*d':ℝ)) (-3/4) : ℝ) * (Λ d s*Λ d' s) := by sorry
-- Test: TauCeti.Metaplectic.fundamentalEisensteinCoefficient_test1
example (Λ : ℤ → ℂ → ℂ) (s : ℂ) : fundamentalEisensteinCoefficient Λ 1 s = (Real.rpow (4*Real.pi) (-1/4):ℂ)*Λ 1 s := by sorry
-- Test: TauCeti.Metaplectic.fundamentalEisensteinCoefficient_test2
example (d : ℤ) (hd : d < 0) (s : ℂ) : Complex.Gamma ((s+(if 0 < d then 0 else 1))/2) = Complex.Gamma ((s+1)/2) := by sorry
-- Test: TauCeti.Metaplectic.fundamentalEisensteinCoefficient_test3
example : (2*Real.sqrt Real.pi : ℂ) ≠ 4*Real.pi := by sorry
/- MetaplecticAutomorphicForms:MP.7/eisenstein-divisor-coefficients
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem halfWeightEisenstein_coefficients (b : ℤ → ℂ → ℂ) (d : ℤ) (m : ℕ) (s : ℂ) (χ : ℕ → ℂ) : (m:ℂ)*(∑ n ∈ m.divisors, (n:ℂ)^(-3/2:ℂ)*χ n*b ((m:ℤ)^2*d/(n:ℤ)^2) s) = (m:ℂ)^(s-1/2)*(∑ n ∈ m.divisors, (n:ℂ)^(1-2*s))*b d s := by sorry
/- MetaplecticAutomorphicForms:MP.7/eisenstein-product-normalization
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem halfWeightEisenstein_product (Λ : ℤ → ℂ → ℂ) (d d' : ℤ) (s : ℂ) : Λ d s*Λ d' s = (2*Real.sqrt Real.pi : ℂ)*((abs (d*d':ℝ):ℝ):ℂ)^(3/4:ℂ)*fundamentalEisensteinCoefficient Λ d s*fundamentalEisensteinCoefficient Λ d' s := by sorry
/- MetaplecticAutomorphicForms:MP.7/theta-residue-normalization
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem halfWeightEisenstein_thetaResidue (Λ : ℂ → ℂ) (b : ℤ → ℂ → ℂ) (W : ℝ → ℂ → ℝ → ℂ) (residue : (ℂ → ℂ) → ℂ → ℂ) (z : ℍ) : residue (fun s => halfWeightEisenstein Λ b W s z) 1 = (1/2:ℂ)*unitaryThetaSeed z := by sorry
/- MetaplecticAutomorphicForms:MP.7/kohnen-plus-space
Fourier-kernel intersection fragment; the genuine ambient cusp/eigen space and applicable odd/p=2 Hecke preservation require the packet hypotheses. -/
def kohnenPlus (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ) : Submodule ℂ (ℍ → ℂ) := by sorry
lemma kohnenPlus_coefficientKernels (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ) (n : ℤ) (hn : n % 4 = 2 ∨ n % 4 = 3) : kohnenPlus coeff ≤ LinearMap.ker (coeff n) := by sorry
lemma kohnenPlus_membership (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ) (F : ℍ → ℂ) : F ∈ kohnenPlus coeff ↔ ∀ n, n % 4 = 2 ∨ n % 4 = 3 → coeff n F = 0 := by sorry
lemma kohnenPlus_linearStructure (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ) (T : (ℍ → ℂ) →ₗ[ℂ] (ℍ → ℂ)) : ∀ F ∈ kohnenPlus coeff, T F ∈ kohnenPlus coeff := by sorry
-- Test: TauCeti.Metaplectic.kohnenPlus_test1
example : (-3:ℤ) % 4 = 1 := by sorry
-- Test: TauCeti.Metaplectic.kohnenPlus_test2
example : (-1:ℤ) % 4 = 3 := by sorry
-- Test: TauCeti.Metaplectic.kohnenPlus_test3
example (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ) (constant : (ℍ → ℂ) →ₗ[ℂ] ℂ) (F : ℍ → ℂ) (h : F ∈ kohnenPlus coeff) (hc : constant F ≠ 0) : F ∉ LinearMap.ker constant := by sorry
/- MetaplecticAutomorphicForms:MP.7/plus-operators
Explicit U,W on native upper-half-plane functions; idempotence is only on the source ambient modular eigenspace. WU composition is exposed; no UW=WU assumption is inserted. -/
def plusOperators : ((ℍ → ℂ) →ₗ[ℂ] (ℍ → ℂ)) × ((ℍ → ℂ) →ₗ[ℂ] (ℍ → ℂ)) := by sorry
lemma plusOperators_uFormula (F : ℍ → ℂ) : plusOperators.1 F = plusU F := by sorry
lemma plusOperators_wFormula (F : ℍ → ℂ) : plusOperators.2 F = plusW F := by sorry
lemma plusOperators_projectionComparison (F : ℍ → ℂ) : plusPr F = (2/3:ℂ) • plusOperators.2 (plusOperators.1 F)+(1/3:ℂ) • F := by sorry
-- Test: TauCeti.Metaplectic.plusOperators_test1
example (F : ℍ → ℂ) (z : ℍ) : plusU F z = (Real.sqrt 2 : ℂ)/4*∑ ν : Fin 4, F (shiftFour ν z) := by sorry
-- Test: TauCeti.Metaplectic.plusOperators_test2
example (F : ℍ → ℂ) : plusPr (plusPr F) = plusPr F := by sorry
-- Test: TauCeti.Metaplectic.plusOperators_test3
example (F : ℍ → ℂ) (z : ℍ) : plusW (plusU F) z = phaseW z*((Real.sqrt 2 : ℂ)/4)*∑ ν : Fin 4, F (shiftFour ν (invertFour z)) := by sorry
/- MetaplecticAutomorphicForms:MP.7/plus-projection
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem kohnenPlus_projection (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ) (F : ℍ → ℂ) (h : F ∈ kohnenPlus coeff) : plusPr F = F := by sorry
def epsilonHalf (a : ℕ) : ℂ := if a % 4 = 1 then 1 else Complex.I
/- MetaplecticAutomorphicForms:MP.7/half-weight-kloosterman
Finite sum on native units of ZMod c; κ is the GN.2 extended Kronecker symbol, not a private substitute. The source modulus 4|c is required in the packet. -/
def halfWeightKloosterman (κ : ℤ → ℤ → ℤ) (m n : ℤ) (c : ℕ) [NeZero c] : ℂ := ∑ a : (ZMod c)ˣ, (κ c a.val.val : ℂ)*epsilonHalf a.val.val*Complex.exp (2*Real.pi*Complex.I*((m:ℂ)*a.val.val+(n:ℂ)*a⁻¹.val.val)/c)
lemma halfWeightKloosterman_unitSum (κ : ℤ → ℤ → ℤ) (m n : ℤ) (c : ℕ) [NeZero c] : halfWeightKloosterman κ m n c = ∑ a : (ZMod c)ˣ, (κ c a.val.val : ℂ)*epsilonHalf a.val.val*Complex.exp (2*Real.pi*Complex.I*((m:ℂ)*a.val.val+(n:ℂ)*a⁻¹.val.val)/c) := by sorry
lemma halfWeightKloosterman_inverseIndependence (m n c a ainv : ℤ) (k : ℤ) (hc : c ≠ 0) : Complex.exp (2*Real.pi*Complex.I*((m:ℂ)*a+(n:ℂ)*(ainv+k*c))/c) = Complex.exp (2*Real.pi*Complex.I*((m:ℂ)*a+(n:ℂ)*ainv)/c) := by sorry
lemma halfWeightKloosterman_modulusData : epsilonHalf 1 = 1 ∧ epsilonHalf 3 = Complex.I := by sorry
-- Test: TauCeti.Metaplectic.halfWeightKloosterman_modFour
example (κ : ℤ → ℤ → ℤ) (h₁ : κ 4 1 = 1) (h₃ : κ 4 3 = 1) : halfWeightKloosterman κ 0 0 4 = 1+Complex.I := by sorry
-- Test: TauCeti.Metaplectic.halfWeightKloosterman_period
example (κ : ℤ → ℤ → ℤ) (m n : ℤ) (c : ℕ) [NeZero c] : halfWeightKloosterman κ (m+c) n c = halfWeightKloosterman κ m n c := by sorry
-- Test: TauCeti.Metaplectic.halfWeightKloosterman_phase
example : (1+Complex.I : ℂ) ≠ 2 := by sorry
/- MetaplecticAutomorphicForms:MP.7/plus-kloosterman
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def plusKloosterman (κ : ℤ → ℤ → ℤ) (m n : ℤ) (c : ℕ) [NeZero c] : ℂ := (1-Complex.I)*(if 8 ∣ c then 1 else 2)*halfWeightKloosterman κ m n c
lemma plusKloosterman_dyadicFactor (κ : ℤ → ℤ → ℤ) (m n : ℤ) (c : ℕ) [NeZero c] : plusKloosterman κ m n c = (1-Complex.I)*(if 8 ∣ c then 1 else 2)*halfWeightKloosterman κ m n c := by sorry
lemma plusKloosterman_weightHalfComparison (κ : ℤ → ℤ → ℤ) (m n : ℤ) (c : ℕ) [NeZero c] : plusKloosterman κ m n c/(1-Complex.I) = (if 8 ∣ c then 1 else 2)*halfWeightKloosterman κ m n c := by sorry
lemma plusKloosterman_discriminantSymmetry (κ : ℤ → ℤ → ℤ) (m n : ℤ) (c : ℕ) [NeZero c] : plusKloosterman κ m n c = star (plusKloosterman κ n m c) := by sorry
-- Test: TauCeti.Metaplectic.plusKloosterman_modFour
example (κ : ℤ → ℤ → ℤ) (h₁ : κ 4 1 = 1) (h₃ : κ 4 3 = 1) : plusKloosterman κ 0 0 4 = 4 := by sorry
-- Test: TauCeti.Metaplectic.plusKloosterman_oneOne
example (κ : ℤ → ℤ → ℤ) (h₁ : κ 4 1 = 1) (h₃ : κ 4 3 = 1) : plusKloosterman κ 1 1 4 = -4 := by sorry
-- Test: TauCeti.Metaplectic.plusKloosterman_exception
example : (1-Complex.I)*(1+Complex.I) = (2:ℂ) ∧ (1-Complex.I)*2*(1+Complex.I) = (4:ℂ) := by sorry
/- MetaplecticAutomorphicForms:MP.7/plus-kloosterman-symmetry
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem plusKloosterman_symmetry (κ : ℤ → ℤ → ℤ) (m n : ℤ) (c : ℕ) [NeZero c] : plusKloosterman κ m n c = plusKloosterman κ n m c ∧ (plusKloosterman κ m n c).im = 0 := by sorry
/- MetaplecticAutomorphicForms:MP.7/half-weight-resolvent
Kernel value signature; native unbounded self-adjoint three-cusp domain, spectral pole parameter and resolvent operator require AS.0. The basis residue must be taken in the actual orthonormal weighted eigenspace. -/
def halfWeightResolvent (s : ℂ) (z w : ℍ) : ℂ := by sorry
lemma halfWeightResolvent_weightedDomain (s : ℂ) (γ : GammaFour) (z w : ℍ) : halfWeightResolvent s (γ • z) w = thetaMultiplier γ z*halfWeightResolvent s z w := by sorry
lemma halfWeightResolvent_covariance (s : ℂ) (γ : GammaFour) (z w : ℍ) : halfWeightResolvent s z (γ • w) = star (thetaMultiplier γ w)*halfWeightResolvent s z w := by sorry
lemma halfWeightResolvent_polarProjection (residue : (ℂ → ℂ) → ℂ → ℂ) (s₀ : ℂ) (basis : Finset (ℍ → ℂ)) (z w : ℍ) : residue (fun s => halfWeightResolvent s z w) s₀ = ∑ F ∈ basis, F z*star (F w) := by sorry
-- Test: TauCeti.Metaplectic.halfWeightResolvent_test1
example (s : ℂ) (γ : GammaFour) (z w : ℍ) (hJ : thetaMultiplier γ z ≠ 1) (hK : halfWeightResolvent s z w ≠ 0) : halfWeightResolvent s (γ • z) w ≠ halfWeightResolvent s z w := by sorry
-- Test: TauCeti.Metaplectic.halfWeightResolvent_test2
example (a : ℂ) (ha : ‖a‖ = 1) (F : ℍ → ℂ) (z w : ℍ) : (a*F z)*star (a*F w) = F z*star (F w) := by sorry
-- Test: TauCeti.Metaplectic.halfWeightResolvent_test3
example (basis : Finset (ℍ → ℂ)) (z w : ℍ) (h : ∀ F ∈ basis, plusPr F = F) : ∑ F ∈ basis, plusPr F z*star (plusPr F w) = ∑ F ∈ basis, F z*star (F w) := by sorry
def poincarePrefactor (n : ℤ) (s : ℂ) : ℂ :=
 Complex.Gamma (s-(if 0 < n then 1/4 else -1/4))/(4*Real.pi*abs (n:ℝ)*Complex.Gamma (2*s))
/- MetaplecticAutomorphicForms:MP.7/half-weight-poincare
Native right-coset quotient Γ∞\Γ. Quotient.out chooses representatives; source multiplier periodicity proves the summand independent of that choice. n≠0, Re(s)>1 and the actual Whittaker M remain packet conditions. -/
def halfWeightPoincare (M : ℝ → ℂ → ℝ → ℂ) (n : ℤ) (s : ℂ) (z : ℍ) : ℂ := by sorry
lemma halfWeightPoincare_seedNormalization (M : ℝ → ℂ → ℝ → ℂ) (n : ℤ) (s : ℂ) (z : ℍ) : halfWeightPoincare M n s z = poincarePrefactor n s * ∑' c : InfinityCosets, let γ := cosetRepresentative c; (thetaMultiplier γ z)⁻¹ * M (if 0 < n then 1/4 else -1/4) (s-1/2) (4*Real.pi*abs (n:ℝ)*(γ • z).im) * Complex.exp (2*Real.pi*Complex.I*n*(γ • z).re) := by sorry
lemma halfWeightPoincare_multiplierInverse (M : ℝ → ℂ → ℝ → ℂ) (n : ℤ) (s : ℂ) (γ : GammaFour) (z : ℍ) : halfWeightPoincare M n s (γ • z) = thetaMultiplier γ z*halfWeightPoincare M n s z := by sorry
lemma halfWeightPoincare_parameter (s : ℂ) : s/2+1/4-1/2 = s/2-1/4 := by sorry
-- Test: TauCeti.Metaplectic.halfWeightPoincare_test1
example (s : ℂ) : poincarePrefactor 1 s = Complex.Gamma (s-1/4)/(4*Real.pi*Complex.Gamma (2*s)) ∧ poincarePrefactor (-3) s = Complex.Gamma (s+1/4)/(12*Real.pi*Complex.Gamma (2*s)) := by sorry
-- Test: TauCeti.Metaplectic.halfWeightPoincare_test2
example (s : ℂ) : (4*Real.pi*abs (0:ℝ)*Complex.Gamma (2*s):ℂ) = 0 := by sorry
-- Test: TauCeti.Metaplectic.halfWeightPoincare_test3
example (s : ℂ) (hs : 1 < s.re) : poincarePrefactor 1 s*(4*Real.pi*Complex.Gamma (2*s)) = Complex.Gamma (s-1/4) := by sorry
/- MetaplecticAutomorphicForms:MP.7/poincare-residues
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem halfWeightPoincare_residue (M : ℝ → ℂ → ℝ → ℂ) (residue : (ℂ → ℂ) → ℂ → ℂ) (n : ℤ) (r : ℝ) (b : Finset (ℍ → ℂ)) (coeff : (ℍ → ℂ) → ℤ → ℂ) (z : ℍ) : residue (fun s => (2*s-1)*halfWeightPoincare M n s z) (1/2+Complex.I*r/2) = ∑ F ∈ b, star (coeff F n)*F z := by sorry
/- MetaplecticAutomorphicForms:MP.7/plus-bessel-coefficient
The full two-sign Gamma/power prefactor and K⁺/Bessel series are exposed. Nonzero discriminant indices, Re(s)>1, the actual J/I functions and meromorphic continuation remain packet conditions. -/
def plusBesselCoefficient (K : ℤ → ℤ → ℕ → ℂ) (BesselJ BesselI : ℂ → ℝ → ℂ) (m n : ℤ) (s : ℂ) : ℂ := by sorry
lemma plusBesselCoefficient_besselSeries (K : ℤ → ℤ → ℕ → ℂ) (BesselJ BesselI : ℂ → ℝ → ℂ) (m n : ℤ) (s : ℂ) : plusBesselCoefficient K BesselJ BesselI m n s = (Complex.Gamma (s-(if 0 < m then 1/4 else -1/4))*Complex.Gamma (s-(if 0 < n then 1/4 else -1/4))/(3*(Real.sqrt Real.pi:ℂ)*(2:ℂ)^(2-2*s)*Complex.Gamma (2*s-1/2)*(Real.sqrt (abs (m*n:ℝ)):ℂ))) * ∑' c : ℕ, if 0 < c ∧ 4 ∣ c then K m n c/c*(if 0 < m*n then BesselJ (2*s-1) (4*Real.pi*Real.sqrt (abs (m*n:ℝ))/c) else BesselI (2*s-1) (4*Real.pi*Real.sqrt (abs (m*n:ℝ))/c)) else 0 := by sorry
lemma plusBesselCoefficient_signs (J I : ℂ → ℝ → ℂ) (m n : ℤ) (hm : 0 < m) (hn : n < 0) (s : ℂ) (x : ℝ) : (Complex.Gamma (s-(if 0 < m then 1/4 else -1/4))*Complex.Gamma (s-(if 0 < n then 1/4 else -1/4)), if 0 < m*n then J (2*s-1) x else I (2*s-1) x) = (Complex.Gamma (s-1/4)*Complex.Gamma (s+1/4), I (2*s-1) x) := by sorry
lemma plusBesselCoefficient_continuation (K : ℤ → ℤ → ℕ → ℂ) (BesselJ BesselI : ℂ → ℝ → ℂ) (continued : ℤ → ℤ → ℂ → ℂ) (m n : ℤ) (s : ℂ) : continued m n s = plusBesselCoefficient K BesselJ BesselI m n s := by sorry
-- Test: TauCeti.Metaplectic.plusBesselCoefficient_test1
example (J I : ℂ → ℝ → ℂ) (s : ℂ) (x : ℝ) : (if 0 < (-3:ℤ)*(-4) then J (2*s-1) x else I (2*s-1) x) = J (2*s-1) x := by sorry
-- Test: TauCeti.Metaplectic.plusBesselCoefficient_test2
example (J I : ℂ → ℝ → ℂ) (s : ℂ) (x : ℝ) : (if 0 < (1:ℤ)*(-3) then J (2*s-1) x else I (2*s-1) x) = I (2*s-1) x := by sorry
-- Test: TauCeti.Metaplectic.plusBesselCoefficient_test3
example : (if 8 ∣ (4:ℕ) then (1:ℂ) else 2) = 2 := by sorry
/- MetaplecticAutomorphicForms:MP.7/projected-poincare-expansion
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem plusPoincare_expansion (P : ℍ → ℂ) (principal : ℍ → ℂ) (tail : ℍ → ℂ) : plusPr P = (2/3:ℂ) • principal + tail := by sorry
/- MetaplecticAutomorphicForms:MP.7/plus-coefficient-residue
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem plusBesselCoefficient_residue (Φ : ℂ → ℂ) (residue : (ℂ → ℂ) → ℂ → ℂ) (r : ℝ) (b : Finset (ℤ → ℂ)) (m n : ℤ) : residue (fun s => (2*s-1)*Φ s) (1/2+Complex.I*r/2) = ∑ f ∈ b, f m*star (f n) := by sorry
/- MetaplecticAutomorphicForms:MP.7/quadratic-root-weyl-sum
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def quadraticRootWeylSum (χ : ℤ → ℤ → ℤ → ℂ) (d d' m c : ℤ) : ℂ := ∑ b ∈ Finset.Ico 0 c, if c ∣ b^2-d*d' then χ (c/4) b ((b^2-d*d')/c) * Complex.exp (2*Real.pi*Complex.I*(2*m*b)/c) else 0
lemma quadraticRootWeylSum_rootIndex (χ : ℤ → ℤ → ℤ → ℂ) (d d' m c : ℤ) : quadraticRootWeylSum χ d d' m c = ∑ b ∈ Finset.Ico 0 c, if c ∣ b^2-d*d' then χ (c/4) b ((b^2-d*d')/c) * Complex.exp (2*Real.pi*Complex.I*(2*m*b)/c) else 0 := by sorry
lemma quadraticRootWeylSum_formEvaluation (a b D : ℤ) (h : 4*a ∣ b^2-D) (ha : a ≠ 0) : b^2-4*a*((b^2-D)/(4*a)) = D := by sorry
lemma quadraticRootWeylSum_evenness (χ : ℤ → ℤ → ℤ → ℂ) (d d' m c : ℤ) : quadraticRootWeylSum χ d d' (-m) c = quadraticRootWeylSum χ d d' m c := by sorry
-- Test: TauCeti.Metaplectic.quadraticRootWeylSum_test1
example (a b D : ℤ) (h : 4*a ∣ b^2-D) (ha : a ≠ 0) : b^2-4*a*((b^2-D)/(4*a)) = D := by sorry
-- Test: TauCeti.Metaplectic.quadraticRootWeylSum_test2
example : Complex.exp (2*Real.pi*Complex.I*(2:ℂ)/4) ≠ Complex.exp (2*Real.pi*Complex.I/4) := by sorry
-- Test: TauCeti.Metaplectic.quadraticRootWeylSum_test3
example (a : ℤ) (ha : 0 < a) : (Finset.Ico 0 (4*a)).card = 2*(Finset.Ico 0 (2*a)).card := by sorry
/- MetaplecticAutomorphicForms:MP.7/kohnen-salie-identity
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem kohnenSalie_identity (S : ℤ → ℤ → ℤ → ℕ → ℂ) (K : ℤ → ℤ → ℕ → ℂ) (χ : ℕ → ℂ) (d d' m : ℤ) (c : ℕ) : S d' d m c = ∑ a ∈ (Nat.gcd m.natAbs (c/4)).divisors, χ a * (Real.sqrt ((a:ℝ)/c):ℂ) * K d' (m^2*d/(a:ℤ)^2) (c/a) := by sorry
/- MetaplecticAutomorphicForms:MP.7/weight-two-cycle-unfolding
Corrected −it oriented kernel for z→γ_Qz. Cycle indexing, compact integration and convergence require the routed Nielsen-core supplier and the packet hypotheses. -/
theorem halfWeight_cycleUnfolding (cycleSum : ℂ) (S : ℕ → ℂ) (φ : ℝ → ℂ) (m : ℤ) (D : ℝ) : cycleSum = ∑' c : ℕ, if 0 < c ∧ 4 ∣ c then S c * (-(Complex.I)*(2*Real.sqrt D/c)) * (∫ θ in (0:ℝ)..Real.pi, Complex.exp (2*Real.pi*Complex.I*m*(2*Real.sqrt D/c)*Real.cos θ)*φ ((2*Real.sqrt D/c)*Real.sin θ)*Complex.exp (Complex.I*θ)) else 0 := by sorry
/- MetaplecticAutomorphicForms:MP.7/cm-poincare-sum
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem poincare_cmSum (trace : ℂ) (S : ℕ → ℂ) (B : ℂ → ℝ → ℂ) (s : ℂ) (m : ℤ) (D : ℝ) : trace = (2:ℂ)^(-1/2:ℂ)*((abs D:ℝ):ℂ)^(1/4:ℂ) * ∑' c : ℕ, if 0 < c ∧ 4 ∣ c then S c*(c:ℂ)^(-1/2:ℂ)*B (s-1/2) (4*Real.pi*abs (m:ℝ)*Real.sqrt (abs D)/c) else 0 := by sorry
/- MetaplecticAutomorphicForms:MP.7/positive-cycle-poincare-sum
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem poincare_positiveCycle (trace : ℂ) (S : ℕ → ℂ) (B : ℂ → ℝ → ℂ) (s : ℂ) (m : ℤ) (D : ℝ) : trace = (2:ℂ)^(s-1/2)*Complex.Gamma ((s+0)/2)^2/Complex.Gamma s*(D:ℂ)^(1/4:ℂ) * ∑' c : ℕ, if 0 < c ∧ 4 ∣ c then S c*(c:ℂ)^(-1/2:ℂ)*B (s-1/2) (4*Real.pi*abs (m:ℝ)*Real.sqrt (abs D)/c) else 0 := by sorry
/- MetaplecticAutomorphicForms:MP.7/negative-cycle-poincare-sum
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem poincare_negativeCycle (trace : ℂ) (S : ℕ → ℂ) (B : ℂ → ℝ → ℂ) (s : ℂ) (m : ℤ) (D : ℝ) : trace = (2:ℂ)^(s-1/2)*Complex.Gamma ((s+1)/2)^2/Complex.Gamma s*(D:ℂ)^(1/4:ℂ) * ∑' c : ℕ, if 0 < c ∧ 4 ∣ c then S c*(c:ℂ)^(-1/2:ℂ)*B (s-1/2) (4*Real.pi*abs (m:ℝ)*Real.sqrt (abs D)/c) else 0 := by sorry
/- MetaplecticAutomorphicForms:MP.7/three-case-poincare-identity
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem halfWeight_threeCasePoincare (Φ : ℤ → ℤ → ℂ → ℂ) (χ : ℕ → ℂ) (d d' m : ℤ) (s trace : ℂ) : 6*(Real.sqrt Real.pi:ℂ)*((abs (d*d':ℝ):ℝ):ℂ)^(3/4:ℂ)*m.natAbs * (∑ a ∈ m.natAbs.divisors, (a:ℂ)^(-3/2:ℂ)*χ a*Φ d' (m^2*d/(a:ℤ)^2) (s/2+1/4)) = trace := by sorry
/- MetaplecticAutomorphicForms:MP.7/plus-hecke-basis
Finite-dimensional simultaneous eigenbasis fragment; normal commuting Hecke operators and the explicit plus-space p=2 convention are packet/supplier conditions, not consequences of an arbitrary T. -/
theorem kohnenPlus_heckeBasis (V : Type*) [NormedAddCommGroup V] [InnerProductSpace ℂ V] [FiniteDimensional ℂ V] (T : ℕ → V →ₗ[ℂ] V) : ∃ B : Basis (Fin (Module.finrank ℂ V)) ℂ V, ∀ p i, Nat.Prime p → ∃ a : ℂ, T p (B i) = a • B i := by sorry
def shimuraSeries (K : ℂ → ℝ → ℂ) (a : ℕ → ℂ) (r : ℝ) (z : ℍ) : ℂ :=
 2*(Real.sqrt z.im : ℂ)*∑' n : ℤ, if n = 0 then 0 else a n.natAbs * K (Complex.I*r) (2*Real.pi*abs (n:ℝ)*z.im)*Complex.exp (2*Real.pi*Complex.I*n*z.re)
def shimuraCoefficientSequence (b : ℤ → ℂ) (χ : ℤ → ℕ → ℂ) (d : ℤ) (m : ℕ) : ℂ :=
  (m:ℂ)*(∑ n ∈ m.divisors, (n:ℂ)^(-3/2:ℂ)*χ d n*b ((m:ℤ)^2*d/(n:ℤ)^2))/b d
/- MetaplecticAutomorphicForms:MP.7/shimura-eigenline-lift
K-Bessel series from all-prime Hecke eigenvalues on an eigenline, with scale-invariant coefficient ratios. Automorphy and nonzero fundamental coefficient are separate theorems; p=2 needs its actual operator. -/
def shimuraEigenlineLift (K : ℂ → ℝ → ℂ) (a : ℕ → ℂ) (r : ℝ) : ℍ → ℂ := shimuraSeries K a r
lemma shimuraEigenlineLift_heckeSeries (K : ℂ → ℝ → ℂ) (a : ℕ → ℂ) (r : ℝ) (z : ℍ) : shimuraEigenlineLift K a r z = shimuraSeries K a r z := by sorry
lemma shimuraEigenlineLift_scaleIndependence (A B scale : ℂ) (h : scale ≠ 0) : (scale*A)/(scale*B) = A/B := by sorry
lemma shimuraEigenlineLift_fundamentalChoice (b : ℤ → ℂ) (χ : ℤ → ℕ → ℂ) (d e : ℤ) (hd : b d ≠ 0) (he : b e ≠ 0) (K : ℂ → ℝ → ℂ) (r : ℝ) : shimuraEigenlineLift K (shimuraCoefficientSequence b χ d) r = shimuraEigenlineLift K (shimuraCoefficientSequence b χ e) r := by sorry
-- Test: TauCeti.Metaplectic.shimuraEigenlineLift_test1
example (A B : ℂ) : (-A)/(-B) = A/B := by sorry
-- Test: TauCeti.Metaplectic.shimuraEigenlineLift_test2
example (b : ℤ → ℂ) (d : ℤ) (h : b d = 0) : ¬ b d ≠ 0 := by sorry
-- Test: TauCeti.Metaplectic.shimuraEigenlineLift_test3
example (a₂ a₂' : ℂ) (h : a₂ ≠ a₂') : (1-a₂/2+(1/4:ℂ)) ≠ (1-a₂'/2+(1/4:ℂ)) := by sorry
/- MetaplecticAutomorphicForms:MP.7/shimura-coefficient-relation
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem shimura_coefficientRelation (b : ℤ → ℂ) (a χ : ℕ → ℂ) (d : ℤ) (m : ℕ) : (m:ℂ)*(∑ n ∈ m.divisors, (n:ℂ)^(-3/2:ℂ)*χ n*b ((m:ℤ)^2*d/(n:ℤ)^2)) = a m*b d := by sorry
/- MetaplecticAutomorphicForms:MP.7/spectral-residue-substitution
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem spectralResidue_substitution (residue : (ℂ → ℂ) → ℂ → ℂ) (F : ℂ → ℂ) (r : ℝ) : residue (fun s => (2*s-1)*F (s/2+1/4)) (1/2+Complex.I*r) = 4*residue (fun w => (2*w-1)*F w) (1/2+Complex.I*r/2) := by sorry
/- MetaplecticAutomorphicForms:MP.7/spectral-trace-identity
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem halfWeight_spectralTrace (I J : Type*) [Fintype I] [Fintype J] (b : I → ℤ → ℂ) (a : I → ℕ → ℂ) (a₀ : J → ℕ → ℂ) (T : J → ℂ) (d d' : ℤ) (m : ℕ) : 12*(Real.sqrt Real.pi:ℂ)*((abs (d*d':ℝ):ℝ):ℂ)^(3/4:ℂ)*(∑ i, b i d'*star (b i d)*a i m) = ∑ j, a₀ j m*T j := by sorry
/- MetaplecticAutomorphicForms:MP.7/shimura-series-automorphy
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem shimura_automorphy (K : ℂ → ℝ → ℂ) (a : ℕ → ℂ) (r : ℝ) (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) (z : ℍ) : shimuraEigenlineLift K a r (γ • z) = shimuraEigenlineLift K a r z := by sorry
/- MetaplecticAutomorphicForms:MP.7/shimura-eigenline-bijection
Carrier signature for eigenlines and normalized even level-one forms. Projectivized native submodules and the actual Maass category await suppliers; no unique phase-independent vector is claimed. -/
def shimura_eigenlineBijection (halfLines levelOneForms : Type*) : halfLines ≃ levelOneForms := by sorry
/- MetaplecticAutomorphicForms:MP.7/extended-shimura-trace
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem shimura_extendedTrace (trace : ℂ) (D : ℤ) (b b' : ℂ) : trace = 12*(Real.sqrt Real.pi:ℂ)*((abs (D:ℝ):ℝ):ℂ)^(3/4:ℂ)*b'*star b := by sorry
/- MetaplecticAutomorphicForms:MP.7/negative-factor-trace
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem shimura_negativeTrace (D : ℤ) (b b' trace normSquared eigenvalue stabilizer : ℂ) : 12*(Real.sqrt Real.pi:ℂ)*((abs (D:ℝ):ℝ):ℂ)^(3/4:ℂ)*b'*star b = normSquared⁻¹*(eigenvalue/2)*trace := by sorry
/- MetaplecticAutomorphicForms:MP.7/positive-factor-trace
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem shimura_positiveTrace (D : ℤ) (b b' trace normSquared eigenvalue stabilizer : ℂ) : 12*(Real.sqrt Real.pi:ℂ)*((abs (D:ℝ):ℝ):ℂ)^(3/4:ℂ)*b'*star b = normSquared⁻¹*trace := by sorry
/- MetaplecticAutomorphicForms:MP.7/cm-trace
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem shimura_cmTrace (D : ℤ) (b b' trace normSquared eigenvalue stabilizer : ℂ) : 12*(Real.sqrt Real.pi:ℂ)*((abs (D:ℝ):ℝ):ℂ)^(3/4:ℂ)*b'*star b = normSquared⁻¹*(2*(Real.sqrt Real.pi:ℂ)/stabilizer)*trace := by sorry
/- MetaplecticAutomorphicForms:MP.7/duke-coefficient-bound
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem halfWeight_dukeBound (b : ℤ → ℂ) (t ε : ℝ) (hε : 0 < ε) : ∃ C A : ℝ, ∀ n : ℤ, n ≠ 0 → ‖b n‖ ≤ C*(1+abs t)^A*Real.cosh (Real.pi*t/2)*abs (n:ℝ)^(-2/7+ε) := by sorry
/- MetaplecticAutomorphicForms:MP.7/plus-normalization-conjugation
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem plusOperators_conjugation (C Cinv U₄ W₄ : (ℍ → ℂ) →ₗ[ℂ] (ℍ → ℂ)) : ∀ F, C (U₄ (Cinv F)) = plusU F ∧ C (W₄ (Cinv F)) = plusW F := by sorry
end HalfWeight
section FiniteFourier
variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V]
/- MetaplecticAutomorphicForms:MP.7/positive-fourier-kernel
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
def positiveFourierKernel (b : ℤ → V →ₗ[ℂ] ℂ) : Submodule ℂ V := by sorry
lemma positiveFourierKernel_memKernel (b : ℤ → V →ₗ[ℂ] ℂ) (v : V) : v ∈ positiveFourierKernel b ↔ ∀ n, 0 < n → n % 4 = 0 ∨ n % 4 = 1 → b n v = 0 := by sorry
lemma positiveFourierKernel_orthogonalSplit [FiniteDimensional ℂ V] (b : ℤ → V →ₗ[ℂ] ℂ) : positiveFourierKernel b ⊔ (positiveFourierKernel b).orthogonal = ⊤ := by sorry
lemma positiveFourierKernel_liftZero (b : ℤ → V →ₗ[ℂ] ℂ) (D Q : ℤ) (hD : 0 < D) (hQ : Q ≠ 0) (hDQ : (D*Q^2) % 4 = 0 ∨ (D*Q^2) % 4 = 1) (v : positiveFourierKernel b) : b (D*Q^2) v.val = 0 := by sorry
-- Test: TauCeti.Metaplectic.positiveFourierKernel_test1
example : ∃ v : Fin 3 → ℂ, v ≠ 0 ∧ ∀ n : ℕ, v 0+(n:ℂ)*v 1 = 0 := by sorry
-- Test: TauCeti.Metaplectic.positiveFourierKernel_test2
example (b : ℤ → V →ₗ[ℂ] ℂ) (h : positiveFourierKernel b = ⊤) (n : ℤ) (hn : 0 < n) (hnm : n % 4 = 0 ∨ n % 4 = 1) (v : V) : b n v = 0 := by sorry
-- Test: TauCeti.Metaplectic.positiveFourierKernel_test3
example : ∃ b : ℤ → ℂ, (∀ n, 0 < n → b n = 0) ∧ b (-3) ≠ 0 := by sorry
/- MetaplecticAutomorphicForms:MP.7/finite-fourier-certificate
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem positiveFourier_finiteCertificate [FiniteDimensional ℂ V] (b : ℤ → V →ₗ[ℂ] ℂ) (h : positiveFourierKernel b = ⊥) : ∃ n : Fin (Module.finrank ℂ V) → ℤ, (∀ i, 0 < n i ∧ (n i % 4 = 0 ∨ n i % 4 = 1)) ∧ Function.Injective (fun v : V => fun i => b (n i) v) := by sorry
/- MetaplecticAutomorphicForms:MP.7/finite-fourier-automorphy
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem shimura_finiteFourierAutomorphy (lift : V →ₗ[ℂ] (ℍ → ℂ)) (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) (v : V) (z : ℍ) : lift v (γ • z) = lift v z := by sorry
end FiniteFourier
section TraceInterfaces
/- MetaplecticAutomorphicForms:MP.7/dit11-eisenstein-comparison
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem halfWeightEisenstein_dit11 (P₀ : ℍ → ℂ → ℂ) (Λ : ℂ → ℂ) (b : ℤ → ℂ → ℂ) (W : ℝ → ℂ → ℝ → ℂ) (s : ℂ) (z : ℍ) : halfWeightEisenstein Λ b W s z = (2:ℂ)^s*Λ (2*s)*(Real.rpow z.im (1/4):ℂ)*P₀ z (s/2+1/4) := by sorry
/- MetaplecticAutomorphicForms:MP.7/resolvent-fourier-comparison
Prototype: native fragment; the packet records the omitted supplier and analytic conditions. -/
theorem halfWeightResolvent_fourier (M W : ℝ → ℂ → ℝ → ℂ) (s : ℂ) (z w : ℍ) (constant : ℂ) : halfWeightResolvent s w z = constant + ∑' n : ℤ, if n = 0 then 0 else halfWeightPoincare M n s z*W (if 0 < n then 1/4 else -1/4) (s-1/2) (4*Real.pi*abs (n:ℝ)*w.im)*Complex.exp (-2*Real.pi*Complex.I*n*w.re) := by sorry
/- MetaplecticAutomorphicForms:MP.7/shimura-dirichlet-series
Infinite prime Euler product in its source convergence half-plane. The actual quadratic Dirichlet L-function, eigenform coefficients and p=2 operator remain packet hypotheses. -/
theorem shimura_dirichletSeries (L : ℂ → ℂ) (b : ℤ → ℂ) (a : ℕ → ℂ) (d : ℤ) (s : ℂ) : L (s+1/2)*(∑' n : ℕ, if n = 0 then 0 else b (d*n^2)*(n:ℂ)^(1-s)) = b d*∏' p : {p : ℕ // Nat.Prime p}, (1-a p.val*(p.val:ℂ)^(-s)+(p.val:ℂ)^(-2*s))⁻¹ := by sorry
/- MetaplecticAutomorphicForms:MP.7/geometric-trace
Norm-denominator fragment with rawTrace the actual genus-weighted CM/oriented-cycle/core integral. The geometric definitions belong to GN.3/Fuchsian PartII and their three branch constants are stated in the packet. -/
def geometricTrace (measure : Measure ℍ) (φ : ℍ → ℂ) (rawTrace : ℂ) : ℂ := ((∫ z, ‖φ z‖^2 ∂measure : ℝ):ℂ)⁻¹*rawTrace
lemma geometricTrace_cm (I : Type*) [Fintype I] (measure : Measure ℍ) (φ : ℍ → ℂ) (points : I → ℍ) (weights : I → ℂ) : geometricTrace measure φ ((2*Real.sqrt Real.pi : ℂ)*∑ i, weights i*φ (points i)) = ((∫ z, ‖φ z‖^2 ∂measure : ℝ):ℂ)⁻¹*(2*Real.sqrt Real.pi : ℂ)*∑ i, weights i*φ (points i) := by sorry
lemma geometricTrace_cycle (I : Type*) [Fintype I] (measure : Measure ℍ) (φ : ℍ → ℂ) (genusWeight cycleIntegral : I → ℂ) : geometricTrace measure φ (∑ i, genusWeight i*cycleIntegral i) = ((∫ z, ‖φ z‖^2 ∂measure : ℝ):ℂ)⁻¹*∑ i, genusWeight i*cycleIntegral i := by sorry
lemma geometricTrace_odd (measure : Measure ℍ) (φ : ℍ → ℂ) : geometricTrace measure φ 0 = 0 := by sorry
-- Test: TauCeti.Metaplectic.geometricTrace_scale
example (measure : Measure ℍ) (φ : ℍ → ℂ) (rawTrace : ℂ) (a : ℂ) (ha : a ≠ 0) : geometricTrace measure (a • φ) (a*rawTrace) = geometricTrace measure φ rawTrace/star a := by sorry
-- Test: TauCeti.Metaplectic.geometricTrace_oddTest
example (measure : Measure ℍ) (φ : ℍ → ℂ) : geometricTrace measure φ 0 = 0 := by sorry
-- Test: TauCeti.Metaplectic.geometricTrace_norm
example (measure : Measure ℍ) (φ : ℍ → ℂ) (rawTrace : ℂ) (h : (∫ z, ‖φ z‖^2 ∂measure : ℝ) = 1) : geometricTrace measure φ rawTrace = rawTrace := by sorry
/- MetaplecticAutomorphicForms:MP.7/biro-shintani-lift
Biró's source Fourier series, not a theta-kernel construction. N>0 and D>0
fundamental, V*_{1/2}(4N), convergence and equation (14) are packet conditions.
The complex spectral parameter retains the source complementary range.
W is the source weight-zero Whittaker function W_s(z). Keeping W_s(kz) avoids
silently dropping its |k|^(1/2) factor in a conversion to shimuraSeries. -/
def biroCoefficientSequence (b : ℤ → ℂ) (χ : ℕ → ℂ) (N : ℕ) (D : ℤ) (k : ℕ) : ℂ :=
 ∑ P ∈ k.divisors, if Nat.Coprime N P then
   (Real.sqrt (k/P : ℕ) : ℂ)/(P:ℂ)*χ P*b (D*((k/P):ℤ)^2) else 0
def biroLift (W : ℂ → ℂ → ℂ) (b : ℤ → ℂ) (χ : ℕ → ℂ) (N : ℕ) (D : ℤ) (t : ℂ) (z : ℍ) : ℂ :=
 ∑' k : ℤ, if k = 0 then 0 else
   biroCoefficientSequence b χ N D k.natAbs * W (1/2+2*Complex.I*t) (k*(z:ℂ))
lemma biroLift_coeff (W : ℂ → ℂ → ℂ) (b : ℤ → ℂ) (χ : ℕ → ℂ) (N : ℕ) (D : ℤ) (t : ℂ) (z : ℍ) :
 biroLift W b χ N D t z = ∑' k : ℤ, if k = 0 then 0 else
   biroCoefficientSequence b χ N D k.natAbs * W (1/2+2*Complex.I*t) (k*(z:ℂ)) := by sorry
lemma biroLift_spectral (t : ℂ) : (2*t)^2 = 4*t^2 := by sorry
lemma biroLift_kernel (W : ℂ → ℂ → ℂ) (b : ℤ → ℂ) (χ : ℕ → ℂ) (N : ℕ) (D : ℤ) (t : ℂ) (z : ℍ)
 (hb : ∀ k : ℕ, b (D*(k:ℤ)^2) = 0) : biroLift W b χ N D t z = 0 := by sorry
-- Test: TauCeti.Metaplectic.biroLift_zero
example (W : ℂ → ℂ → ℂ) (χ : ℕ → ℂ) (N : ℕ) (D : ℤ) (t : ℂ) (z : ℍ) :
 biroLift W 0 χ N D t z = 0 := by sorry
-- Test: TauCeti.Metaplectic.biroLift_kernelTest
example (W : ℂ → ℂ → ℂ) (b : ℤ → ℂ) (χ : ℕ → ℂ) (N : ℕ) (D : ℤ) (t : ℂ) (z : ℍ)
 (hb : ∀ k : ℕ, b (D*(k:ℤ)^2) = 0) : biroLift W b χ N D t z = 0 := by sorry
-- Test: TauCeti.Metaplectic.biroLift_parameter
example (t : ℂ) (h : t ≠ 0) : (2*t)^2 ≠ t^2 := by sorry
-- Test: TauCeti.Metaplectic.biroLift_coefficientTwo
example (b : ℤ → ℂ) (χ : ℕ → ℂ) (D : ℤ) (hb : b D = 1) (hb4 : b (D*4) = 0)
 (hχ1 : χ 1 = 1) (hχ2 : χ 2 = 1) : biroCoefficientSequence b χ 1 D 2 = 1/2 := by sorry
/- MetaplecticAutomorphicForms:MP.7/adelic-classical-half-weight
Equivalence target only, between the actual compatible finite-level genuine adelic and classical spaces. The Iwasawa/multiplier/Whittaker/Laplacian matching conditions are omitted until their native suppliers arrive. -/
def halfWeight_adelicClassical (adelicFunctions classicalFunctions : Type*) [AddCommGroup adelicFunctions] [Module ℂ adelicFunctions] [AddCommGroup classicalFunctions] [Module ℂ classicalFunctions] : adelicFunctions ≃ₗ[ℂ] classicalFunctions := by sorry
/- MetaplecticAutomorphicForms:MP.7/bfh-kernel-import
Comparison signature for the MP.8 supplied BFH specialization; no new genus-two kernel is defined here. The exact restriction datum and parameter s−2/newform M versus auxiliary N are required. -/
theorem bfh_halfWeightKernelComparison (rankTwoKernel restrictedRankOneKernel : ℍ → ℂ) : rankTwoKernel = restrictedRankOneKernel := by sorry
/- MetaplecticAutomorphicForms:MP.7/ramified-quadratic-twist-kernel-inputs
BFH local-factor export signature only. The separate unavailable FH95 original kernel is an explicit source gap; this signature does not identify that unread kernel with BFH. -/
theorem quadraticTwist_kernelInputs (localIntegral eulerRatio : ℂ) : localIntegral = eulerRatio := by sorry
end TraceInterfaces

end
end TauCeti.Metaplectic
