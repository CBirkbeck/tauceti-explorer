/-
This file is not the roadmap and is not exhaustive. The roadmap document,
research/blueprint/readmes/MetaplecticAutomorphicForms.md, is definitive. These
signatures suggest Lean forms so contributors and reviewers can converge on
names and signatures. Proof placeholders are not implementations.

Roadmap MetaplecticAutomorphicForms, assembled from its two parts: part MP.0
(layers MP.0–MP.7, namespaces TauCeti.Metaplectic.Heisenberg and
TauCeti.Metaplectic) and part MP.8 (layer MP.8, namespace
TauCeti.Jacobi.GenusTwo). Both independent reviews
(REV-MetaplecticAutomorphicForms--MP.0, REV-MetaplecticAutomorphicForms--MP.8)
returned needs_changes: several fragments below are recorded there as
signatures to repair, and missing supplier conditions are omitted and named in
comments and in the packets' prototypeBoundary and signatureOmissions fields.
A raw-function or arbitrary-carrier sketch is not an unconditional claim.

Pinned baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/
import TauCeti.RepresentationTheory.ProjectiveRepresentation.Extension
import TauCeti.LinearAlgebra.BilinearForm.Isometry
import TauCeti.RepresentationTheory.Continuous.Unitary.Basic
import Mathlib.Algebra.Order.Field.Power
import Mathlib.Analysis.Complex.Exponential
import Mathlib.Analysis.Complex.SqrtDeriv
import Mathlib.Analysis.Complex.UpperHalfPlane.Measure
import Mathlib.Analysis.Complex.UpperHalfPlane.MoebiusAction
import Mathlib.Analysis.Distribution.SchwartzSpace.Basic
import Mathlib.Analysis.Matrix.Normed
import Mathlib.Analysis.Meromorphic.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Data.Int.ModEq
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.GroupTheory.SemidirectProduct
import Mathlib.LinearAlgebra.FreeModule.PID
import Mathlib.LinearAlgebra.Matrix.BilinearForm
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.LinearAlgebra.QuadraticForm.Basis
import Mathlib.LinearAlgebra.SymplecticGroup
import Mathlib.LinearAlgebra.UnitaryGroup
import Mathlib.MeasureTheory.Function.L2Space
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.NumberTheory.ModularForms.JacobiTheta.OneVariable
import Mathlib.NumberTheory.ModularForms.JacobiTheta.TwoVariable
import Mathlib.RepresentationTheory.Coinvariants
import Mathlib.RepresentationTheory.Continuous.Basic
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RingTheory.Artinian.Module
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.Topology.ContinuousMap.Basic

set_option linter.unusedVariables false

/-! ## Part MP.0: layers MP.0–MP.7 (`TauCeti.Metaplectic.Heisenberg`, `TauCeti.Metaplectic`) -/


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
@[instance_reducible] def heisenbergTopology (B : LinearMap.BilinForm F V) [TopologicalSpace F] [TopologicalSpace V] : TopologicalSpace (bilinearFactorSet B).Extension := by sorry
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
  (ψ (Multiplicative.ofAdd (t+B u y+(2:F)⁻¹*B x y)) : ℂ)*φ (u+x)
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
example (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (x u : V) (φ : V → ℂ) : schroedinger ψ B 0 x 0 φ u = φ (u+x) := by sorry
-- Test: TauCeti.Metaplectic.schroedinger_modulation
example (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (y : W) (u : V) (φ : V → ℂ) : schroedinger ψ B 0 0 y φ u = (ψ (Multiplicative.ofAdd (B u y)) : ℂ)*φ u := by sorry
-- Test: TauCeti.Metaplectic.schroedinger_commutator
example (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (x : V) (y : W) (h2 : (2:F) ≠ 0) : (schroedinger ψ B 0 x 0).comp (schroedinger ψ B 0 0 y) = (ψ (Multiplicative.ofAdd (B x y)) : ℂ) • ((schroedinger ψ B 0 0 y).comp (schroedinger ψ B 0 x 0)) := by sorry
/- MetaplecticAutomorphicForms:MP.0/induced-schroedinger
Section-evaluation/covariance fragment. The subtype states an explicit equation, not a placeholder Prop field. Smooth compact induction and its support condition await SR.2; the dyadic obstruction is expressed on its rational half argument. -/
def inducedSchroedingerEquiv (ψ : Multiplicative F →* ℂˣ) : {f : F × V → ℂ // ∀ t u, f (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*f (0,u)} ≃ (V → ℂ) := by sorry
lemma inducedSchroedingerEquiv_apply (ψ : Multiplicative F →* ℂˣ) (f : {f : F × V → ℂ // ∀ t u, f (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*f (0,u)}) (u : V) : inducedSchroedingerEquiv ψ f u = f.val (0,u) := by sorry
lemma inducedSchroedingerEquiv_covariance (ψ : Multiplicative F →* ℂˣ) (φ : V → ℂ) (t : F) (u : V) : ((inducedSchroedingerEquiv ψ).symm φ).val (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*φ u := by sorry
lemma inducedSchroedingerEquiv_intertwines (ψ : Multiplicative F →* ℂˣ) (translation : N → {f : F × V → ℂ // ∀ t u, f (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*f (0,u)} → {f : F × V → ℂ // ∀ t u, f (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*f (0,u)}) (ρ : Representation ℂ N (V → ℂ)) (n : N) (f : {f : F × V → ℂ // ∀ t u, f (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*f (0,u)}) : inducedSchroedingerEquiv ψ (translation n f) = ρ n (inducedSchroedingerEquiv ψ f) := by sorry
-- Test: TauCeti.Metaplectic.inducedSchroedingerEquiv_zero
example (ψ : Multiplicative F →* ℂˣ) (φ : V → ℂ) : ((inducedSchroedingerEquiv ψ).symm φ).val (0,0) = φ 0 := by sorry
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
theorem oscillator_smoothVectors (i : SchwartzMap ℝ ℂ →ₗ[ℂ] H) (orbit : (ℝ × ℝ × ℝ) → H → H) (v : H) : (∃ φ, i φ = v) ↔ ContDiff ℝ (⊤ : ℕ∞) (fun p => orbit p v) := by sorry
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
def metaplecticCover (S : Type*) [Group S] (lam₂ : S →* ℂˣ) : Subgroup S := by sorry
lemma metaplecticCover_kernel (S : Type*) [Group S] (lam₂ : S →* ℂˣ) (s : S) : s ∈ metaplecticCover S lam₂ ↔ lam₂ s = 1 := by sorry
def metaplecticCover_toNormalizer (S : Type*) [Group S] (lam₂ : S →* ℂˣ) : metaplecticCover S lam₂ →* S := by sorry
def metaplecticCover_coboundary (S : Type*) [Group S] (lam₂ μ₂ : S →* ℂˣ) (e : S ≃* S) (h : ∀ s, μ₂ (e s) = lam₂ s) : metaplecticCover S lam₂ ≃* metaplecticCover S μ₂ := by sorry
-- Test: TauCeti.Metaplectic.metaplecticCover_zero
example (z : ℂˣ) : z ∈ metaplecticCover ℂˣ (show ℂˣ →* ℂˣ from {toFun := fun z => z^2,map_one' := by sorry,map_mul' := by sorry}) ↔ z^2 = 1 := by sorry
-- Test: TauCeti.Metaplectic.metaplecticCover_complex
example (S : Type*) [Group S] (lam₂ : S →* ℂˣ) : metaplecticCover S lam₂ ≃* G × ↥(rootsOfUnity 2 ℂ) := by sorry
-- Test: TauCeti.Metaplectic.metaplecticCover_real
example (S : Type*) [Group S] (lam₂ : S →* ℂˣ) [TopologicalSpace G] [TopologicalSpace (metaplecticCover S lam₂)] (pr : metaplecticCover S lam₂ →* G) : ¬ ∃ s : G →* metaplecticCover S lam₂, Continuous s ∧ pr.comp s = MonoidHom.id G := by sorry
/- MetaplecticAutomorphicForms:MP.1/genuine-oscillator
Restriction of the actual normalizer oscillator to ker λ₂. z denotes its distinguished central −1 in the genuine API and tests, and the zero-space specialization has carrier ℂ. Those central and carrier identifications, normalized λ₂, strong continuity and local-field hypotheses are omitted until the packet suppliers are available. -/
def weilRepresentation (S : Type*) [Group S] (lam₂ : S →* ℂˣ) (ω : S →* ↥(unitary (H →L[ℂ] H))) : metaplecticCover S lam₂ →* ↥(unitary (H →L[ℂ] H)) := by sorry
lemma weilRepresentation_apply (S : Type*) [Group S] (lam₂ : S →* ℂˣ) (ω : S →* ↥(unitary (H →L[ℂ] H))) (g : metaplecticCover S lam₂) : weilRepresentation S lam₂ ω g = ω g.val := by sorry
lemma weilRepresentation_central (S : Type*) [Group S] (lam₂ : S →* ℂˣ) (ω : S →* ↥(unitary (H →L[ℂ] H))) (z : metaplecticCover S lam₂) (v : H) : (weilRepresentation S lam₂ ω z).val v = -v := by sorry
lemma weilRepresentation_modelChange (e : H ≃ₗᵢ[ℂ] K) (ρ : ContRepresentation ℂ G H) (σ : ContRepresentation ℂ G K) : ∀ g v, e (ρ g v) = σ g (e v) := by sorry
-- Test: TauCeti.Metaplectic.weilRepresentation_zero
example (S : Type*) [Group S] (lam₂ : S →* ℂˣ) (ω : S →* ↥(unitary (ℂ →L[ℂ] ℂ))) (z : metaplecticCover S lam₂) (v : ℂ) : (weilRepresentation S lam₂ ω z).val v = -v := by sorry
-- Test: TauCeti.Metaplectic.weilRepresentation_genuine
example (S : Type*) [Group S] (lam₂ : S →* ℂˣ) (ω : S →* ↥(unitary (H →L[ℂ] H))) (z g : metaplecticCover S lam₂) (v : H) (hv : v ≠ 0) : (weilRepresentation S lam₂ ω (z*g)).val v = -(weilRepresentation S lam₂ ω g).val v ∧ (weilRepresentation S lam₂ ω (z*g)).val v ≠ (weilRepresentation S lam₂ ω g).val v := by sorry
-- Test: TauCeti.Metaplectic.weilRepresentation_identity
example (S : Type*) [Group S] (lam₂ : S →* ℂˣ) (ω : S →* ↥(unitary (H →L[ℂ] H))) : weilRepresentation S lam₂ ω 1 = 1 := by sorry
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

/-! ## Part MP.8: layer MP.8 (`TauCeti.Jacobi.GenusTwo`) -/

namespace TauCeti.Jacobi.GenusTwo

-- Native integral quadratic forms encode half-integral symmetric matrices.
-- Integral index arithmetic is reused by the analytic constructions below.
local notation "V" => Fin 2 → ℤ
local notation "FData" => QuadraticForm ℤ V × V

/-- Integral shift from BFH (2.9), with a=m/N and c=N^(1-j). -/
def fourierShift (a c : ℤ) (l : V) (p : FData) : FData :=
  (p.1 + c • (a • QuadraticMap.linMulLin (dotProductBilin ℤ ℤ l)
      (dotProductBilin ℤ ℤ l) -
    QuadraticMap.linMulLin (dotProductBilin ℤ ℤ p.2)
      (dotProductBilin ℤ ℤ l)),
   p.2 - (2 * a) • l)

lemma fourierShift_fst_apply (a c : ℤ) (l : V) (p : FData) (x : V) :
    (fourierShift a c l p).1 x =
      p.1 x + c * (a * (l ⬝ᵥ x)^2 - (p.2 ⬝ᵥ x) * (l ⬝ᵥ x)) := by sorry

lemma fourierShift_snd (a c : ℤ) (l : V) (p : FData) :
    (fourierShift a c l p).2 = p.2 - (2 * a) • l := by sorry

lemma fourierShift_zero (a c : ℤ) (p : FData) :
    fourierShift a c 0 p = p := by sorry

lemma fourierShift_add (a c : ℤ) (l k : V) (p : FData) :
    fourierShift a c (l + k) p = fourierShift a c k (fourierShift a c l p) := by sorry

lemma fourierShift_neg (a c : ℤ) (l : V) (p : FData) :
    fourierShift a c (-l) (fourierShift a c l p) = p := by sorry

-- Test: fourierShift_zero_data; j=0 at level N=8 and a=1.
example : fourierShift 1 8 ![1,0] (0,0) =
    (8 • QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, ![-2,0]) := by sorry

-- Test: fourierShift_other_cusp; the same shift at j=1 has c=1.
example : fourierShift 1 1 ![1,0] (0,0) =
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, ![-2,0]) := by sorry

-- Test: fourierShift_mixed_term; integral x₀x₁ has half-integral matrix entries.
example : fourierShift 1 1 ![0,1]
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 1, ![1,0]) =
    (QuadraticMap.proj (R := ℤ) (1 : Fin 2) 1, ![1,-2]) := by sorry

/-- The quadratic form represented by BFH's matrix U divided by N. -/
def fourierDiscriminant (a c : ℤ) (p : FData) : QuadraticForm ℤ V :=
  (4 * a) • p.1 - c • QuadraticMap.linMulLin
    (dotProductBilin ℤ ℤ p.2) (dotProductBilin ℤ ℤ p.2)

lemma fourierDiscriminant_apply (a c : ℤ) (p : FData) (x : V) :
    fourierDiscriminant a c p x = 4 * a * p.1 x - c * (p.2 ⬝ᵥ x)^2 := by sorry

lemma fourierDiscriminant_zero (a c : ℤ) :
    fourierDiscriminant a c (0,0) = 0 := by sorry

lemma fourierDiscriminant_zero_vector (a c : ℤ) (Q : QuadraticForm ℤ V) :
    fourierDiscriminant a c (Q,0) = (4 * a) • Q := by sorry

-- Test: fourierDiscriminant_mixed; detects the factor 4 and off-diagonal convention.
example : fourierDiscriminant 1 1
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 1, 0) ![1,1] = 4 := by sorry

-- Test: fourierDiscriminant_negative; no positivity condition on Fourier data.
example : fourierDiscriminant 1 8 (0, ![1,0]) ![1,0] = -8 := by sorry

-- Test: fourierDiscriminant_zero_index; a=0 forgets the quadratic form.
example : fourierDiscriminant 0 1
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, 0) =
    fourierDiscriminant 0 1 (0,0) := by sorry

lemma fourierDiscriminant_shift (a c : ℤ) (l : V) (p : FData) :
    fourierDiscriminant a c (fourierShift a c l p) =
      fourierDiscriminant a c p := by sorry

lemma fourierShift_modEq (a c : ℤ) (l : V) (p : FData) (i : Fin 2) :
    Int.ModEq (2 * a) ((fourierShift a c l p).2 i) (p.2 i) := by sorry

lemma eq_of_fourierDiscriminant_eq (a c : ℤ) (ha : a ≠ 0)
    (p q : FData) (hR : p.2 = q.2)
    (hD : fourierDiscriminant a c p = fourierDiscriminant a c q) :
    p = q := by sorry

lemma fourierShift_injective (a c : ℤ) (ha : a ≠ 0) (p : FData) :
    Function.Injective (fun l : V => fourierShift a c l p) := by sorry

theorem exists_fourierShift_iff (a c : ℤ) (ha : a ≠ 0) (p q : FData) :
    (∃ l : V, fourierShift a c l p = q) ↔
    fourierDiscriminant a c p = fourierDiscriminant a c q ∧
      ∀ i, Int.ModEq (2 * a) (p.2 i) (q.2 i) := by sorry

theorem existsUnique_fourierRepresentative (a c : ℤ) (ha : a ≠ 0)
    (p : FData) (nu : V) (hnu : ∀ i, Int.ModEq (2 * a) (p.2 i) (nu i)) :
    ∃! Q : QuadraticForm ℤ V,
      fourierDiscriminant a c (Q,nu) = fourierDiscriminant a c p := by sorry

lemma coefficient_eq_of_fourierInvariants {A : Type*} (a c : ℤ) (ha : a ≠ 0)
    (B : FData → A) (hB : ∀ (l : V) (p : FData), B (fourierShift a c l p) = B p)
    (p q : FData) (hD : fourierDiscriminant a c p = fourierDiscriminant a c q)
    (hR : ∀ i, Int.ModEq (2 * a) (p.2 i) (q.2 i)) : B p = B q := by sorry

-- Acceptance: arbitrary integral c, including zero and negative values.
example (p : FData) (l : V) :
    fourierDiscriminant (-1) 0 (fourierShift (-1) 0 l p) =
      fourierDiscriminant (-1) 0 p := by sorry

-- Acceptance: identical residue does not suffice without discriminant equality.
example : ¬ ∃ l : V, fourierShift 1 1 l (0,0) =
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, 0) := by sorry

-- Acceptance: at a=0 the orbit criterion is false, even with equal vector data.
example : ¬ ∃ l : V, fourierShift 0 1 l (0,0) =
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, 0) := by sorry

-- Acceptance: discriminant equality alone cannot distinguish residue classes.
example : fourierDiscriminant 2 1 (0, ![1,0]) =
    fourierDiscriminant 2 1 (0, ![-1,0]) ∧
    ¬ ∃ l : V, fourierShift 2 1 l (0, ![1,0]) = (0, ![-1,0]) := by sorry

#check QuadraticMap.linMulLin
#check QuadraticMap.toQuadraticMap_toBilin
#check Int.modEq_iff_dvd


noncomputable section
open Matrix MeasureTheory
open scoped ComplexConjugate
attribute [local instance] Matrix.normedAddCommGroup Matrix.normedSpace
abbrev IVec := Fin 2 → ℤ
abbrev CVec := Fin 2 → ℂ
abbrev RVec := Fin 2 → ℝ
abbrev M2 (R : Type*) := Matrix (Fin 2) (Fin 2) R
abbrev I4 := Fin 2 ⊕ Fin 2
abbrev M4 (R : Type*) := Matrix I4 I4 R

-- Coordinate helpers, not additional mathematical targets.
def expTwoPi (z : ℂ) : ℂ := Complex.exp (2 * Real.pi * Complex.I * z)
def quad (Z : M2 ℂ) (w : CVec) : ℂ := w ⬝ᵥ (Z *ᵥ w)
def blockA (g : M4 ℝ) : M2 ℂ := fun i j => g (.inl i) (.inl j)
def blockB (g : M4 ℝ) : M2 ℂ := fun i j => g (.inl i) (.inr j)
def blockC (g : M4 ℝ) : M2 ℂ := fun i j => g (.inr i) (.inl j)
def blockD (g : M4 ℝ) : M2 ℂ := fun i j => g (.inr i) (.inr j)
def fractional (g : M4 ℝ) (Z : M2 ℂ) : M2 ℂ :=
  (blockA g * Z + blockB g) * (blockC g * Z + blockD g)⁻¹
def baseMatrix : M2 ℂ := Complex.I • (1 : M2 ℂ)
def baseImage (g : M4 ℝ) : M2 ℂ := fractional g baseMatrix
def symCoords (x : Fin 3 → ℝ) : M2 ℝ := !![x 2, x 1; x 1, x 0]
def unipotent (X : M2 ℝ) : M4 ℝ := Matrix.fromBlocks 1 X 0 1
def ivCast (v : IVec) : CVec := fun i => v i

-- MetaplecticAutomorphicForms:MP.8/siegel-space
abbrev SiegelSpace : Type := {Z : M2 ℂ // Zᵀ = Z ∧ (Z.map Complex.im).PosDef}
lemma siegelSpace_mem (Z : M2 ℂ) : (Zᵀ = Z ∧ (Z.map Complex.im).PosDef) ↔
    ∃ z : SiegelSpace, z.val = Z := by sorry
lemma siegelSpace_im_pos (z : SiegelSpace) : (z.val.map Complex.im).PosDef := by sorry
def siegelSpace_base : SiegelSpace := ⟨baseMatrix, by sorry⟩
-- Test: siegelSpace_diagonal
example : ∃ z : SiegelSpace, z.val = !![Complex.I,0;0,2*Complex.I] := by sorry
-- Test: siegelSpace_real
example : ¬ ∃ z : SiegelSpace, z.val = (1 : M2 ℂ) := by sorry
-- Test: siegelSpace_asymmetric
example : ¬ ∃ z : SiegelSpace, z.val = !![Complex.I,1;0,Complex.I] := by sorry


-- MetaplecticAutomorphicForms:MP.8/positive-similitudes
def positiveSimilitudes : Subgroup ((M4 ℝ)ˣ × ℝˣ) := by sorry
lemma positiveSimilitudes_mem (g : (M4 ℝ)ˣ) (mu : ℝˣ) :
    (g,mu) ∈ positiveSimilitudes ↔ 0 < (mu : ℝ) ∧
      (g : M4 ℝ)ᵀ * Matrix.J (Fin 2) ℝ * (g : M4 ℝ) =
        (mu : ℝ) • Matrix.J (Fin 2) ℝ := by sorry
lemma positiveSimilitudes_multiplier_mul (g h : positiveSimilitudes) :
    ((g*h).val.2 : ℝ) = (g.val.2 : ℝ)*(h.val.2 : ℝ) := by sorry
lemma positiveSimilitudes_symplectic (g : M4 ℝ) :
    gᵀ * Matrix.J (Fin 2) ℝ * g = Matrix.J (Fin 2) ℝ ↔
      g ∈ Matrix.symplecticGroup (Fin 2) ℝ := by sorry
-- Test: positiveSimilitudes_scalar
example : (2 • (1 : M4 ℝ))ᵀ * Matrix.J (Fin 2) ℝ * (2 • (1 : M4 ℝ)) =
    4 • Matrix.J (Fin 2) ℝ := by sorry
-- Test: positiveSimilitudes_reflection
example : ¬ ∃ mu : ℝ, 0 < mu ∧
    (Matrix.fromBlocks (1 : M2 ℝ) 0 0 (-1))ᵀ * Matrix.J (Fin 2) ℝ *
      (Matrix.fromBlocks (1 : M2 ℝ) 0 0 (-1)) = mu • Matrix.J (Fin 2) ℝ := by sorry
-- Test: positiveSimilitudes_base_action
example : fractional (2 • (1 : M4 ℝ)) baseMatrix = baseMatrix := by sorry


-- MetaplecticAutomorphicForms:MP.8/siegel-action
def siegelAction (g : positiveSimilitudes) (z : SiegelSpace) : SiegelSpace := by sorry
lemma siegelAction_apply (g : positiveSimilitudes) (z : SiegelSpace) :
    (siegelAction g z).val = fractional (g.val.1 : M4 ℝ) z.val := by sorry
def siegelFactor (g : positiveSimilitudes) (z : SiegelSpace) : ℂ :=
  (blockC (g.val.1 : M4 ℝ) * z.val + blockD (g.val.1 : M4 ℝ)).det / (g.val.2 : ℝ)
lemma siegelAction_one (z : SiegelSpace) : siegelAction 1 z = z := by sorry
lemma siegelAction_mul (g h : positiveSimilitudes) (z : SiegelSpace) :
    siegelAction (g*h) z = siegelAction g (siegelAction h z) := by sorry
lemma siegelFactor_cocycle (g h : positiveSimilitudes) (z : SiegelSpace) :
    siegelFactor (g*h) z = siegelFactor g (siegelAction h z)*siegelFactor h z := by sorry
-- Test: siegelAction_scalar (raw matrix version)
example : fractional (2 • (1 : M4 ℝ)) baseMatrix = baseMatrix := by sorry
-- Test: siegelAction_translation
example : fractional (unipotent (1 : M2 ℝ)) baseMatrix = (1+Complex.I) • (1 : M2 ℂ) := by sorry
-- Test: siegelAction_fourier
example : fractional (Matrix.J (Fin 2) ℝ) baseMatrix = baseMatrix := by sorry


-- MetaplecticAutomorphicForms:MP.8/similitude-cover
-- Continuous roots suffice: their nonvanishing implies holomorphy in the symmetric coordinates.
structure similitudeCover where
  base : positiveSimilitudes
  root : SiegelSpace → ℂ
  continuous_root : Continuous root
  square_root : ∀ z, root z ^ 2 = siegelFactor base z
instance : Group similitudeCover := by sorry
lemma similitudeCover_square (g : similitudeCover) (z : SiegelSpace) :
    g.root z ^ 2 = siegelFactor g.base z := by sorry
lemma similitudeCover_mul_root (g h : similitudeCover) (z : SiegelSpace) :
    (g*h).root z = g.root (siegelAction h.base z)*h.root z := by sorry
lemma similitudeCover_kernel (g : similitudeCover) (h : g.base = 1) :
    (∀ z, g.root z = 1) ∨ (∀ z, g.root z = -1) := by sorry
-- Test: similitudeCover_two_lifts
example : (fun _ : SiegelSpace => (1 : ℂ)) ≠ (fun _ : SiegelSpace => (-1 : ℂ)) := by sorry
-- Test: similitudeCover_base_branch
example : Complex.sqrt (-baseMatrix.det) = 1 := by sorry
-- Test: similitudeCover_scaled_branch
example : Complex.sqrt (-(2 • baseMatrix).det) = 2 := by sorry


-- MetaplecticAutomorphicForms:MP.8/compact-stabilizer
theorem compact_stabilizer (g : M4 ℝ) (h : g ∈ Matrix.symplecticGroup (Fin 2) ℝ) :
    fractional g baseMatrix = baseMatrix ↔ gᵀ * g = 1 := by sorry


-- MetaplecticAutomorphicForms:MP.8/arithmetic-subgroup
def arithmeticGamma (N : ℕ) : Subgroup (Matrix.symplecticGroup (Fin 2) ℤ) := by sorry
lemma arithmeticGamma_mem (N : ℕ) (g : Matrix.symplecticGroup (Fin 2) ℤ) :
    g ∈ arithmeticGamma N ↔
    (∀ i j : Fin 2, (N : ℤ) ∣ (g : M4 ℤ) (.inr i) (.inl j)) ∧
      (N : ℤ) ∣ (g : M4 ℤ) (.inl 1) (.inl 0) ∧
      (N : ℤ) ∣ (g : M4 ℤ) (.inr 0) (.inr 1) := by sorry
lemma arithmeticGamma_one (N : ℕ) : (1 : Matrix.symplecticGroup (Fin 2) ℤ) ∈ arithmeticGamma N := by sorry
lemma arithmeticGamma_upper (N : ℕ) (X : M2 ℤ) (h : Xᵀ=X) :
    ∃ g : arithmeticGamma N, (g.val : M4 ℤ) = Matrix.fromBlocks 1 X 0 1 := by sorry
-- Test: arithmeticGamma_upper_example
example : ∃ g : arithmeticGamma 8, (g.val : M4 ℤ) =
    Matrix.fromBlocks 1 (!![0,1;1,0] : M2 ℤ) 0 1 := by sorry
-- Test: arithmeticGamma_lower_example
example : ¬ ∃ g : arithmeticGamma 8, (g.val : M4 ℤ) =
    Matrix.fromBlocks (1 : M2 ℤ) 0 1 1 := by sorry
-- Test: arithmeticGamma_level_one
example : arithmeticGamma 1 = ⊤ := by sorry


-- MetaplecticAutomorphicForms:MP.8/bfh-slash
def bfhSlash (m : ℤ) (gamma : M4 ℝ) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (W : CVec) : ℂ :=
  let E := blockC gamma * baseImage g + blockD gamma
  expTwoPi (-m * quad (E⁻¹ * blockC gamma) W) * phi (gamma*g) (E⁻¹ᵀ *ᵥ W)
lemma bfhSlash_one (m : ℤ) (phi : M4 ℝ → CVec → ℂ) (g : positiveSimilitudes) (W : CVec) :
    bfhSlash m 1 phi (g.val.1 : M4 ℝ) W = phi (g.val.1 : M4 ℝ) W := by sorry
lemma bfhSlash_mul (m : ℤ) (phi : M4 ℝ → CVec → ℂ)
    (a b : Matrix.symplecticGroup (Fin 2) ℝ) (g : positiveSimilitudes) (W : CVec) :
    bfhSlash m (b : M4 ℝ) (bfhSlash m (a : M4 ℝ) phi) (g.val.1 : M4 ℝ) W =
      bfhSlash m ((a : M4 ℝ)*(b : M4 ℝ)) phi (g.val.1 : M4 ℝ) W := by sorry
lemma bfhSlash_fourier (m : ℤ) (phi : M4 ℝ → CVec → ℂ) (g : positiveSimilitudes) (W : CVec) :
    bfhSlash m (Matrix.J (Fin 2) ℝ) phi (g.val.1 : M4 ℝ) W =
      expTwoPi (-m * quad (baseImage (g.val.1 : M4 ℝ))⁻¹ W) *
        phi (Matrix.J (Fin 2) ℝ * (g.val.1 : M4 ℝ)) ((baseImage (g.val.1 : M4 ℝ))⁻¹ *ᵥ W) := by sorry
-- Test: bfhSlash_zero
example (m : ℤ) (gamma g : M4 ℝ) (W : CVec) : bfhSlash m gamma (fun _ _ => 0) g W = 0 := by sorry
-- Test: bfhSlash_unipotent
example (m : ℤ) (B : M2 ℝ) (h : Bᵀ=B) (phi : M4 ℝ → CVec → ℂ) (g : positiveSimilitudes) (W : CVec) :
    bfhSlash m (unipotent B) phi (g.val.1 : M4 ℝ) W = phi (unipotent B*(g.val.1 : M4 ℝ)) W := by sorry
-- Test: bfhSlash_fourier_at_base
example (m : ℤ) (phi : M4 ℝ → CVec → ℂ) (W : CVec) :
    bfhSlash m (Matrix.J (Fin 2) ℝ) phi 1 W =
      expTwoPi (m * Complex.I * (W ⬝ᵥ W)) * phi (Matrix.J (Fin 2) ℝ) (-Complex.I • W) := by sorry


-- MetaplecticAutomorphicForms:MP.8/bfh-translation
def bfhTranslate (m : ℤ) (l r : CVec) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (W : CVec) : ℂ :=
  expTwoPi (m * (quad (baseImage g) l + 2 * (W ⬝ᵥ l))) * phi g (W+baseImage g*ᵥl+r)
lemma bfhTranslate_zero (m : ℤ) (phi : M4 ℝ → CVec → ℂ) : bfhTranslate m 0 0 phi = phi := by sorry
lemma bfhTranslate_comp (m : ℤ) (l r k t : CVec) (phi : M4 ℝ → CVec → ℂ)
    (g : positiveSimilitudes) (W : CVec) :
    bfhTranslate m k t (bfhTranslate m l r phi) (g.val.1 : M4 ℝ) W =
      expTwoPi (2*m*(t ⬝ᵥ l)) * bfhTranslate m (l+k) (r+t) phi (g.val.1 : M4 ℝ) W := by sorry
lemma bfhTranslate_linear (m : ℤ) (l r : CVec) (phi psi : M4 ℝ → CVec → ℂ) :
    bfhTranslate m l r (phi+psi) = bfhTranslate m l r phi + bfhTranslate m l r psi := by sorry
-- Test: bfhTranslate_integer_phase
example : expTwoPi (2*(8 : ℂ)*((![1/8,0] : CVec) ⬝ᵥ ![1,0])) = 1 := by sorry
-- Test: bfhTranslate_real_phase
example : expTwoPi (2*((![1/4,0] : CVec) ⬝ᵥ ![1,0])) = -1 := by sorry
-- Test: bfhTranslate_constant_at_base
example : bfhTranslate 1 ![1,0] 0 (fun _ _ => 1) 1 0 = Complex.exp (-2*Real.pi) := by sorry


-- MetaplecticAutomorphicForms:MP.8/genus-two-theta
def genusTwoTheta (a : ℕ) (nu : IVec) (Z : M2 ℂ) (W : CVec) : ℂ :=
  ∑' R : IVec, if ∀ i, Int.ModEq (2*(a : ℤ)) (R i) (nu i) then
    expTwoPi (quad Z (ivCast R)/(4*a) + (ivCast R ⬝ᵥ W)) else 0
lemma genusTwoTheta_residue (a : ℕ) (nu l : IVec) (Z : M2 ℂ) (W : CVec) :
    genusTwoTheta a (nu+(2*(a : ℤ))•l) Z W = genusTwoTheta a nu Z W := by sorry
lemma genusTwoTheta_elliptic (a : ℕ) (ha : 0<a) (nu l r : IVec) (z : SiegelSpace) (W : CVec) :
    genusTwoTheta a nu z.val W = expTwoPi (a*(quad z.val (ivCast l)+2*(W ⬝ᵥ ivCast l))) *
      genusTwoTheta a nu z.val (W+z.val*ᵥivCast l+ivCast r) := by sorry
lemma genusTwoTheta_diagonal (a : ℕ) (ha : 0<a) (z : CVec) (hz : ∀ i, 0<(z i).im) (W : CVec) :
    genusTwoTheta a 0 (Matrix.diagonal z) W = ∏ i, jacobiTheta₂ (2*a*W i) (2*a*z i) := by sorry
-- Test: genusTwoTheta_negation
example (a : ℕ) (nu : IVec) (Z : M2 ℂ) (W : CVec) :
    genusTwoTheta a (-nu) Z (-W) = genusTwoTheta a nu Z W := by sorry
-- Test: genusTwoTheta_period
example (Z : M2 ℂ) (W : CVec) : genusTwoTheta 1 ![2,0] Z W = genusTwoTheta 1 0 Z W := by sorry
-- Test: genusTwoTheta_product
example : genusTwoTheta 1 0 baseMatrix 0 = jacobiTheta₂ 0 (2*Complex.I)^2 := by sorry


-- MetaplecticAutomorphicForms:MP.8/quadratic-matrix
def quadraticMatrix (Q : QuadraticForm ℤ IVec) : M2 ℚ :=
  let b : ℚ := Q ![1,1] - Q ![1,0] - Q ![0,1]
  !![(Q ![1,0] : ℚ), b/2; b/2, (Q ![0,1] : ℚ)]
lemma quadraticMatrix_symmetric (Q : QuadraticForm ℤ IVec) : (quadraticMatrix Q)ᵀ = quadraticMatrix Q := by sorry
lemma quadraticMatrix_eval (Q : QuadraticForm ℤ IVec) (x : IVec) :
    (fun i => (x i : ℚ)) ⬝ᵥ (quadraticMatrix Q *ᵥ (fun i => (x i : ℚ))) = (Q x : ℚ) := by sorry
lemma quadraticMatrix_injective : Function.Injective quadraticMatrix := by sorry
-- Test: quadraticMatrix_mixed
example : quadraticMatrix (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 1) = !![0,1/2;1/2,0] := by sorry
-- Test: quadraticMatrix_square
example : quadraticMatrix (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0) = !![1,0;0,0] := by sorry
-- Test: quadraticMatrix_negative
example : quadraticMatrix (-QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0) = !![-1,0;0,0] := by sorry


-- MetaplecticAutomorphicForms:MP.8/fourier-coefficient
def fourierCoefficient (N : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (Q : QuadraticForm ℤ IVec) (R : IVec) : ℂ :=
  let T : M2 ℂ := (quadraticMatrix Q).map (fun q : ℚ => (q : ℂ))
  (N : ℂ)^(-3*(j.val : ℤ)) *
    ∫ X : Fin 3 → ℝ in Set.pi Set.univ (fun _ => Set.Ico 0 ((N : ℝ)^j.val)),
      ∫ W : RVec in Set.pi Set.univ (fun _ => Set.Ico 0 1),
        phi (unipotent (symCoords X)*g) (fun i => W i) *
          expTwoPi (-((N : ℂ)^(-(j.val : ℤ)))*(T*(baseImage g+(symCoords X).map (fun x : ℝ => (x : ℂ)))).trace -
            (N : ℂ)^(1-j.val)*(ivCast R ⬝ᵥ (fun i => (W i : ℂ))))
lemma fourierCoefficient_zero (N : ℕ) (j : Fin 2) (g : M4 ℝ) (Q : QuadraticForm ℤ IVec) (R : IVec) :
    fourierCoefficient N j (fun _ _ => 0) g Q R = 0 := by sorry
-- Integrability cannot be dropped from additive Bochner integration. This prototype
-- uses continuity on the compact boxes as a sufficient, fully expressible condition.
lemma fourierCoefficient_add (N : ℕ) (j : Fin 2) (phi psi : M4 ℝ → CVec → ℂ)
    (hp : Continuous (Function.uncurry phi)) (hq : Continuous (Function.uncurry psi))
    (g : positiveSimilitudes) (Q : QuadraticForm ℤ IVec) (R : IVec) :
    fourierCoefficient N j (phi+psi) (g.val.1 : M4 ℝ) Q R =
      fourierCoefficient N j phi (g.val.1 : M4 ℝ) Q R + fourierCoefficient N j psi (g.val.1 : M4 ℝ) Q R := by sorry
lemma fourierCoefficient_scalar (N : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (c : ℂ) (g : M4 ℝ) (Q : QuadraticForm ℤ IVec) (R : IVec) :
    fourierCoefficient N j (c • phi) g Q R = c*fourierCoefficient N j phi g Q R := by sorry
-- Test: fourierCoefficient_constant
example (N : ℕ) (hN : 0<N) (j : Fin 2) (g : M4 ℝ) :
    fourierCoefficient N j (fun _ _ => 1) g 0 0 = 1 := by sorry
-- Test: fourierCoefficient_vector_mode
example (N : ℕ) (hN : 0<N) (j : Fin 2) (g : M4 ℝ) (R : IVec) :
    fourierCoefficient N j (fun _ W => expTwoPi ((N : ℂ)^(1-j.val)*(ivCast R ⬝ᵥ W))) g 0 R = 1 := by sorry
-- Test: fourierCoefficient_wrong_vector
example (N : ℕ) (hN : 0<N) (j : Fin 2) (g : M4 ℝ) (R : IVec) (hR : R≠0) :
    fourierCoefficient N j (fun _ _ => 1) g 0 R = 0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/theta-pairing


-- MetaplecticAutomorphicForms:MP.8/coefficient-shift-analytic


-- MetaplecticAutomorphicForms:MP.8/theta-decomposition


-- MetaplecticAutomorphicForms:MP.8/theta-fourier-transform


-- MetaplecticAutomorphicForms:MP.8/theta-component-fourier-law


-- MetaplecticAutomorphicForms:MP.8/bfh-jacobi-specialization
def isPositiveMatrix (g : M4 ℝ) : Prop :=
  ∃ mu : ℝ, 0<mu ∧ gᵀ * Matrix.J (Fin 2) ℝ * g = mu • Matrix.J (Fin 2) ℝ
def cuspGamma (j : Fin 2) (g : M4 ℤ) : M4 ℝ :=
  let h := g.map (fun x : ℤ => (x : ℝ))
  if j.val=0 then h else -(Matrix.J (Fin 2) ℝ)*h*Matrix.J (Fin 2) ℝ
structure bfhJacobiFunctions (N : ℕ) (m : ℤ) (j : Fin 2) where
  toFun : M4 ℝ → CVec → ℂ
  smooth : ∀ g W, isPositiveMatrix g → ContDiffAt ℝ ⊤ (Function.uncurry toFun) (g,W)
  holomorphic : ∀ g, isPositiveMatrix g → Differentiable ℂ (toFun g)
  gamma_invariant : ∀ gamma : arithmeticGamma N, ∀ g W, isPositiveMatrix g →
    bfhSlash m (cuspGamma j (gamma.val : M4 ℤ)) toFun g W = toFun g W
  translation_invariant : ∀ l r : IVec, ∀ g W, isPositiveMatrix g →
    bfhTranslate m ((N : ℂ)^(-(j.val : ℤ)) • ivCast l)
      ((N : ℂ)^((j.val : ℤ)-1) • ivCast r) toFun g W = toFun g W
def bfhJacobiFunctions_zero (N : ℕ) (m : ℤ) (j : Fin 2) : bfhJacobiFunctions N m j := by sorry
lemma bfhJacobiFunctions_translation (N : ℕ) (m : ℤ) (j : Fin 2) (phi : bfhJacobiFunctions N m j)
    (l r : IVec) (g : M4 ℝ) (W : CVec) (hg : isPositiveMatrix g) :
    bfhTranslate m ((N : ℂ)^(-(j.val : ℤ)) • ivCast l)
      ((N : ℂ)^((j.val : ℤ)-1) • ivCast r) phi.toFun g W = phi.toFun g W := by sorry
def bfhJacobiFunctions_fourier_cusp (N : ℕ) (hN : 0<N) (m : ℤ)
    (phi : bfhJacobiFunctions N m 0) : bfhJacobiFunctions N m 1 := by sorry
-- Test: bfhJacobiFunctions_zero_test
example (j : Fin 2) : ∃ phi : bfhJacobiFunctions 8 16 j, phi.toFun = fun _ _ => 0 := by sorry
-- Test: bfhJacobiFunctions_constant_zero_index
example (N : ℕ) (hN : 0<N) (j : Fin 2) :
    ∃ phi : bfhJacobiFunctions N 0 j, phi.toFun = fun _ _ => 1 := by sorry
-- Test: bfhJacobiFunctions_constant_positive_index
example : ¬ ∃ phi : bfhJacobiFunctions 8 16 0, phi.toFun = fun _ _ => 1 := by sorry


-- MetaplecticAutomorphicForms:MP.8/theta-components
-- The projection is defined on arbitrary coordinate functions. Its decomposition laws
-- require bfhJacobiFunctions, so regularity is not encoded as the desired conclusion.
def thetaComponent (N a : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (nu : IVec) : ℂ := by sorry
lemma thetaComponent_zero (N a : ℕ) (j : Fin 2) (g : M4 ℝ) (nu : IVec) :
    thetaComponent N a j (fun _ _ => 0) g nu = 0 := by sorry
lemma thetaComponent_residue (N a : ℕ) (ha : 0<a) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (nu l : IVec) :
    thetaComponent N a j phi g (nu+(2*(a : ℤ))•l) = thetaComponent N a j phi g nu := by sorry
-- Test: thetaComponent_basis
example (a : ℕ) (ha : 0<a) (mu nu : IVec) :
    thetaComponent 1 a 0 (fun g W => genusTwoTheta a mu (baseImage g) W) 1 nu =
      if (∀ i, Int.ModEq (2*(a : ℤ)) (mu i) (nu i)) then 1 else 0 := by sorry
lemma thetaComponent_scalar (N a : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (nu : IVec) (c : ℂ) : thetaComponent N a j (c • phi) g nu=c*thetaComponent N a j phi g nu := by sorry
-- Test: thetaComponent_zero_test
example (N a : ℕ) (j : Fin 2) (g : M4 ℝ) (nu : IVec) : thetaComponent N a j (fun _ _ => 0) g nu=0 := by sorry
-- Test: thetaComponent_period
example (phi : M4 ℝ → CVec → ℂ) (g : M4 ℝ) : thetaComponent 8 2 1 phi g ![0,5]=thetaComponent 8 2 1 phi g ![0,1] := by sorry
-- Fully expressible signatures for the preceding analytic theorems.
-- Gaussian orthogonality uses W=Z*l+r and the Jacobian det(Im Z).
theorem theta_pairing (a : ℕ) (ha : 0<a) (z : SiegelSpace) (mu nu : IVec) :
    (∫ l : RVec in Set.pi Set.univ (fun _ => Set.Ico 0 1),
      ∫ r : RVec in Set.pi Set.univ (fun _ => Set.Ico 0 1),
        let W := z.val *ᵥ (fun i => (l i : ℂ)) + (fun i => (r i : ℂ))
        genusTwoTheta a mu z.val W * conj (genusTwoTheta a nu z.val W) *
          Complex.exp (-4*Real.pi*a*quad (((z.val.map Complex.im)⁻¹).map (fun x : ℝ => (x : ℂ)))
            (fun i => (W i).im)) * (z.val.map Complex.im).det) =
      if (∀ i, Int.ModEq (2*(a : ℤ)) (mu i) (nu i)) then
        (Real.sqrt (z.val.map Complex.im).det : ℂ)/(2*a) else 0 := by sorry
theorem coefficient_shift_analytic (N m : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N ∣ m)
    (j : Fin 2) (phi : bfhJacobiFunctions N m j) (g : positiveSimilitudes)
    (l : IVec) (p : QuadraticForm ℤ IVec × IVec) :
    let q := fourierShift (m/N) ((N : ℤ)^(1-j.val)) l p
    fourierCoefficient N j phi.toFun (g.val.1 : M4 ℝ) q.1 q.2 =
      fourierCoefficient N j phi.toFun (g.val.1 : M4 ℝ) p.1 p.2 := by sorry
theorem theta_decomposition (N m : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N ∣ m)
    (j : Fin 2) (phi : bfhJacobiFunctions N m j) (g : positiveSimilitudes) (W : CVec) :
    phi.toFun (g.val.1 : M4 ℝ) W =
      ∑ nu : Fin 2 → Fin (2*(m/N)),
        thetaComponent N (m/N) j phi.toFun (g.val.1 : M4 ℝ) (fun i => nu i) *
          genusTwoTheta (m/N) (fun i => nu i)
            ((N : ℂ)^(1-2*(j.val : ℤ)) • baseImage (g.val.1 : M4 ℝ))
            ((N : ℂ)^(1-j.val) • W) := by sorry
theorem theta_fourier_transform (a : ℕ) (ha : 0<a) (z : SiegelSpace) (W : CVec) (nu : IVec) :
    genusTwoTheta a nu (-z.val⁻¹) (z.val⁻¹ *ᵥ W) =
      expTwoPi (a*quad z.val⁻¹ W) * Complex.sqrt (-z.val.det)/(2*a) *
        ∑ mu : Fin 2 → Fin (2*a), expTwoPi (-(ivCast nu ⬝ᵥ (fun i => (mu i : ℂ)))/(2*a)) *
          genusTwoTheta a (fun i => mu i) z.val W := by sorry
theorem theta_component_fourier_law (N m : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N ∣ m)
    (phi : bfhJacobiFunctions N m 0) (g : positiveSimilitudes) (nu : IVec) :
    thetaComponent N (m/N) 1 (bfhSlash m (Matrix.J (Fin 2) ℝ) phi.toFun) (g.val.1 : M4 ℝ) nu =
      Complex.sqrt (-(baseImage (g.val.1 : M4 ℝ)).det)/(2*m) *
        ∑ mu : Fin 2 → Fin (2*(m/N)),
          expTwoPi (-(N : ℂ)*(ivCast nu ⬝ᵥ (fun i => (mu i : ℂ)))/(2*m)) *
            thetaComponent N (m/N) 0 phi.toFun (Matrix.J (Fin 2) ℝ*(g.val.1 : M4 ℝ)) (fun i => mu i) := by sorry


-- MetaplecticAutomorphicForms:MP.8/theta-coefficient
def thetaCoefficient (N m : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (U : M2 ℤ) (nu : IVec) : ℂ := by sorry
lemma thetaCoefficient_recovered (N m : ℕ) (hN : 0<N) (hm : 0<m) (j : Fin 2)
    (phi : M4 ℝ → CVec → ℂ) (g : M4 ℝ) (Q : QuadraticForm ℤ IVec) (nu : IVec)
    (U : M2 ℤ) (hU : U.map (fun x : ℤ => (x : ℚ)) =
      (4*(m : ℚ)) • quadraticMatrix Q - (N : ℚ)^(2-j.val) •
        Matrix.vecMulVec (fun i => (nu i : ℚ)) (fun i => (nu i : ℚ))) :
    thetaCoefficient N m j phi g U nu = fourierCoefficient N j phi g Q nu := by sorry
lemma thetaCoefficient_zero (N m : ℕ) (j : Fin 2) (g : M4 ℝ) (U : M2 ℤ) (nu : IVec) :
    thetaCoefficient N m j (fun _ _ => 0) g U nu=0 := by sorry
lemma thetaCoefficient_scalar (N m : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ) (g : M4 ℝ) (U : M2 ℤ) (nu : IVec) (c : ℂ) :
    thetaCoefficient N m j (c • phi) g U nu=c*thetaCoefficient N m j phi g U nu := by sorry
-- Test: thetaCoefficient_zero_test
example (N m : ℕ) (j : Fin 2) (g : M4 ℝ) (U : M2 ℤ) (nu : IVec) :
    thetaCoefficient N m j (fun _ _ => 0) g U nu = 0 := by sorry
-- Test: thetaCoefficient_parity
example (phi : M4 ℝ → CVec → ℂ) (g : M4 ℝ) : thetaCoefficient 8 16 1 phi g 1 0 = 0 := by sorry

-- Test: thetaCoefficient_integral_index
example (phi : M4 ℝ → CVec → ℂ) (g : M4 ℝ) :
    thetaCoefficient 8 16 1 phi g !![0,0;0,56] ![0,1]=fourierCoefficient 8 1 phi g (QuadraticMap.proj 1 1) ![0,1] := by sorry


-- MetaplecticAutomorphicForms:MP.8/bfh-seed
abbrev KTwo := Matrix.unitaryGroup (Fin 2) ℂ
def rotationK (t : ℝ) : KTwo := ⟨(!![Real.cos t,Real.sin t;-Real.sin t,Real.cos t] : M2 ℂ), by sorry⟩
-- This finite matrix realization instantiates the imported continuous K-representation.
-- The two proof fields are defining input properties, not Whittaker conclusions.
structure BFHTestVector (k : ℕ) (d : ℕ) where
  sigma : KTwo →* (Matrix (Fin d) (Fin d) ℂ)ˣ
  continuous_sigma : Continuous (fun g => (sigma g : Matrix (Fin d) (Fin d) ℂ))
  v : Fin d → ℂ
  weight : ∀ t : ℝ, v ᵥ* (sigma (rotationK t) : Matrix (Fin d) (Fin d) ℂ) =
    Complex.exp (Complex.I*k*t) • v
  central : sigma ⟨(-1 : M2 ℂ), by sorry⟩ = 1
def bfhSeed (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) (g : M4 ℝ) : Fin d → ℂ := by sorry
lemma bfhSeed_identity (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) :
    bfhSeed k d data F 1 = F 1 • data.v := by sorry
lemma bfhSeed_zero (k d : ℕ) (data : BFHTestVector k d) : bfhSeed k d data (fun _ => 0) = 0 := by sorry
lemma bfhSeed_scalar (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) (c : ℂ) :
    bfhSeed k d data (c • F) = c • bfhSeed k d data F := by sorry
-- Test: bfhSeed_base
example (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) (h : F 1=1) :
    bfhSeed k d data F 1 = data.v := by sorry
-- Test: bfhSeed_zero_vector
example (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) (h : data.v=0) :
    bfhSeed k d data F = 0 := by sorry
-- Test: bfhSeed_central
example (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) :
    bfhSeed k d data F (2 • (1 : M4 ℝ)) = bfhSeed k d data F 1 := by sorry


-- MetaplecticAutomorphicForms:MP.8/induced-seed-family
def inducedSeedFamily (I : M4 ℝ → ℂ) (s : ℂ) (g : M4 ℝ) : ℂ :=
  Complex.exp (s/2 * Real.log (baseImage g |>.map Complex.im |>.det)) * I g
lemma inducedSeedFamily_zero (I : M4 ℝ → ℂ) (g : positiveSimilitudes) :
    inducedSeedFamily I 0 (g.val.1 : M4 ℝ) = I (g.val.1 : M4 ℝ) := by sorry
lemma inducedSeedFamily_add (I : M4 ℝ → ℂ) (s t : ℂ) (g : positiveSimilitudes) :
    inducedSeedFamily I (s+t) (g.val.1 : M4 ℝ) =
      Complex.exp (t/2*Real.log (baseImage (g.val.1 : M4 ℝ) |>.map Complex.im |>.det)) *
        inducedSeedFamily I s (g.val.1 : M4 ℝ) := by sorry
lemma inducedSeedFamily_holomorphic (I : M4 ℝ → ℂ) (g : positiveSimilitudes) :
    Differentiable ℂ (fun s => inducedSeedFamily I s (g.val.1 : M4 ℝ)) := by sorry
-- Test: inducedSeedFamily_identity
example (I : M4 ℝ → ℂ) (s : ℂ) : inducedSeedFamily I s 1 = I 1 := by sorry
-- Test: inducedSeedFamily_levi
example (s : ℂ) : inducedSeedFamily (fun _ => 1) s
    (Matrix.fromBlocks (2 • (1 : M2 ℝ)) 0 0 ((1/2 : ℝ) • (1 : M2 ℝ))) = (4 : ℂ)^s := by sorry
-- Test: inducedSeedFamily_zero_seed
example (s : ℂ) (g : M4 ℝ) : inducedSeedFamily (fun _ => 0) s g = 0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/jacobi-eisenstein
-- The quotient is constructed from the actual parabolic intersection.
def bfhParabolic (N : ℕ) : Subgroup (arithmeticGamma N) := by sorry
abbrev BFHCosets (N : ℕ) := (arithmeticGamma N) ⧸ bfhParabolic N
-- Native G/H is identified with H\G by inverse representatives.
def cosetMatrix (N : ℕ) (c : BFHCosets N) : M4 ℝ := by sorry
def jacobiSummand (_N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (s : ℂ)
    (gamma : M4 ℝ) (l : IVec) (g : M4 ℝ) (W : CVec) : ℂ :=
  bfhSlash m gamma (bfhTranslate m (ivCast l) 0 (fun h _ => inducedSeedFamily I s h)) g W
def jacobiEisenstein (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (s : ℂ) (g : M4 ℝ) (W : CVec) : ℂ :=
  ∑' c : BFHCosets N, ∑' l : IVec, jacobiSummand N m I s (cosetMatrix N c) l g W
lemma jacobiEisenstein_zero (N : ℕ) (m : ℤ) (s : ℂ) : jacobiEisenstein N m (fun _ => 0) s = 0 := by sorry
lemma jacobiEisenstein_scalar (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (s c : ℂ) :
    jacobiEisenstein N m (c • I) s = c • jacobiEisenstein N m I s := by sorry
lemma jacobiEisenstein_summand (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (s : ℂ) (g : positiveSimilitudes) (W : CVec) :
    jacobiSummand N m I s 1 0 (g.val.1 : M4 ℝ) W = inducedSeedFamily I s (g.val.1 : M4 ℝ) := by sorry
-- Test: jacobiEisenstein_zero_test
example (N : ℕ) (m : ℤ) (s : ℂ) (g : M4 ℝ) (Q : QuadraticForm ℤ IVec) (R : IVec) :
    fourierCoefficient N 0 (jacobiEisenstein N m (fun _ => 0) s) g Q R = 0 := by sorry
-- Test: jacobiEisenstein_identity_term
example (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (s : ℂ) : jacobiSummand N m I s 1 0 1 0 = I 1 := by sorry
-- Test: jacobiEisenstein_nonzero_translation
example (N : ℕ) (I : M4 ℝ → ℂ) (s : ℂ) :
    jacobiSummand N 1 I s 1 ![1,0] 1 0 = Complex.exp (-2*Real.pi)*I 1 := by sorry


-- MetaplecticAutomorphicForms:MP.8/whittaker-functions
def kappaX (x : Fin 3 → ℝ) : KTwo := by sorry
def transformedX (x : Fin 3 → ℝ) : ℝ := -x 1*(x 0+x 2)/(1+(x 0)^2+(x 1)^2)
def transformedY (x : Fin 3 → ℝ) : ℝ :=
  Real.sqrt (1+(x 0)^2+2*(x 1)^2+(x 2)^2+(x 0*x 2-(x 1)^2)^2)/(1+(x 0)^2+(x 1)^2)
def whittakerKernel (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s : ℂ) (x : Fin 3 → ℝ) : ℂ :=
  let Z := (symCoords x).map (fun a : ℝ => (a : ℂ)) + baseMatrix
  Complex.sqrt (-Z.det) / ((‖Z.det‖ : ℂ)^s) * expTwoPi (eps*y1*x 0) *
    expTwoPi (y2*((transformedX x : ℂ)+Complex.I*transformedY x)) *
    ((transformedY x : ℂ)^((k : ℂ)/2)) * phi (kappaX x)
def whittakerFunction (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s : ℂ) : ℂ :=
  ((y1*y2 : ℝ) : ℂ)^(4-s) * (y2 : ℂ)^((k : ℂ)/2) * ∫ x : Fin 3 → ℝ, whittakerKernel k phi eps y1 y2 s x
lemma whittakerFunction_zero (k : ℕ) (eps : ℤ) (y1 y2 : ℝ) (s : ℂ) :
    whittakerFunction k (fun _ => 0) eps y1 y2 s = 0 := by sorry
lemma whittakerFunction_scalar (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s c : ℂ) :
    whittakerFunction k (c • phi) eps y1 y2 s = c*whittakerFunction k phi eps y1 y2 s := by sorry
lemma whittakerFunction_degenerate_scale (k : ℕ) (phi : KTwo → ℂ) (y1 y2 : ℝ) (hy : 0<y1) (s : ℂ) :
    whittakerFunction k phi 0 y1 y2 s = (y1 : ℂ)^(4-s)*whittakerFunction k phi 0 1 y2 s := by sorry
-- Test: whittakerFunction_zero_test
example (k : ℕ) (y1 y2 : ℝ) (s : ℂ) : whittakerFunction k (fun _ => 0) 1 y1 y2 s = 0 := by sorry
-- Test: whittakerKernel_base
example (k : ℕ) (eps : ℤ) (y1 y2 : ℝ) (s : ℂ) :
    whittakerKernel k (fun _ => 1) eps y1 y2 s 0 = Complex.exp (-2*Real.pi*y2) := by sorry
-- Test: whittakerFunction_degenerate_test
example (k : ℕ) (phi : KTwo → ℂ) (y2 : ℝ) (s : ℂ) :
    whittakerFunction k phi 0 2 y2 s = (2 : ℂ)^(4-s)*whittakerFunction k phi 0 1 y2 s := by sorry


-- MetaplecticAutomorphicForms:MP.8/whittaker-majorant
theorem whittaker_majorant (a b c : ℝ) (ha : 1/2<a) (hab : 3/2<2*a+b) (habc : 1<a+b+c) :
    Integrable (fun x : Fin 3 → ℝ =>
      (1+(x 0)^2+2*(x 1)^2+(x 2)^2+(x 0*x 2-(x 1)^2)^2)^(-a) *
      (1+(x 0)^2+(x 1)^2)^(-b) * (1+(x 0)^2)^(-c)) := by sorry


-- MetaplecticAutomorphicForms:MP.8/whittaker-initial-convergence
-- A genuine input property, not an assumed Whittaker conclusion.
def IsBFHMatrixCoefficient (k : ℕ) (phi : KTwo → ℂ) : Prop :=
  ∃ d : ℕ, ∃ data : BFHTestVector k d, ∃ T : (Fin d → ℂ) →ₗ[ℂ] ℂ,
    ∀ q, phi q = T (data.v ᵥ* (data.sigma q : Matrix (Fin d) (Fin d) ℂ))

theorem whittaker_initial_convergence (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (eps : ℤ)
    (heps : eps ∈ ({-1,0,1} : Set ℤ)) (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2)
    (s : ℂ) (hs : 2<s.re) : Integrable (whittakerKernel k phi eps y1 y2 s) := by sorry


-- MetaplecticAutomorphicForms:MP.8/jacquet-two-parameter


def jacquetTwoParameter (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s r : ℂ) : ℂ := by sorry
def auxiliaryWhittaker (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s r : ℂ) : ℂ :=
  (Real.pi : ℂ)^(-r)*Complex.Gamma (r+(k : ℂ)/2)*jacquetTwoParameter k phi eps y1 y2 s r
lemma jacquetTwoParameter_linear (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s r c : ℂ) :
    jacquetTwoParameter k (c • phi) eps y1 y2 s r = c*jacquetTwoParameter k phi eps y1 y2 s r := by sorry
lemma jacquetTwoParameter_normalization (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s r : ℂ) :
    auxiliaryWhittaker k phi eps y1 y2 s r =
      (Real.pi : ℂ)^(-r)*Complex.Gamma (r+(k : ℂ)/2)*jacquetTwoParameter k phi eps y1 y2 s r := by sorry
lemma jacquetTwoParameter_specialize (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (eps : ℤ) (heps : eps=1 ∨ eps=-1)
    (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2) (s : ℂ) (hs : (3+(k : ℝ))/2<s.re) :
    auxiliaryWhittaker k phi eps y1 y2 s ((k : ℂ)/2) = whittakerFunction k phi eps y1 y2 s := by sorry
-- Test: jacquetTwoParameter_zero
example (k : ℕ) (eps : ℤ) (y1 y2 : ℝ) (s r : ℂ) : jacquetTwoParameter k (fun _ => 0) eps y1 y2 s r=0 := by sorry
-- Test: jacquetTwoParameter_weight_two
example : (Real.pi : ℂ)^(-(1 : ℂ))*Complex.Gamma (1+(2 : ℂ)/2) = (Real.pi : ℂ)⁻¹ := by sorry
-- Test: jacquetTwoParameter_specialization_test
example (y : ℝ) (hy : 0<y) : (y : ℂ)^((2 : ℂ)/2)*Complex.exp (-y/2) = y*Complex.exp (-y/2) := by sorry


-- MetaplecticAutomorphicForms:MP.8/jacquet-r-reflection



theorem jacquet_r_reflection (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (eps : ℤ) (heps : eps=1 ∨ eps=-1)
    (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2) :
    ∃ Vc : (ℂ × ℂ) → ℂ, DifferentiableOn ℂ Vc {z | 5/2<(z.1+z.2).re ∧ 3/2<(z.1-z.2).re} ∧
      (∀ z, 1/2<z.2.re → 3/2<(z.1-z.2).re →
        Vc z = jacquetTwoParameter k phi eps y1 y2 z.1 z.2) ∧
      ∀ s r, 5/2<(s+r).re → 3/2<(s-r).re →
        5/2<(s+1-r).re → 3/2<(s-(1-r)).re →
        (∀ n : ℕ, r+(k : ℂ)/2 ≠ -(n : ℂ)) →
        (∀ n : ℕ, 1-r+(k : ℂ)/2 ≠ -(n : ℂ)) →
        (Real.pi : ℂ)^(-r)*Complex.Gamma (r+(k : ℂ)/2)*Vc (s,r) =
          (Real.pi : ℂ)^(-(1-r))*Complex.Gamma (1-r+(k : ℂ)/2)*Vc (s,1-r) := by sorry


-- MetaplecticAutomorphicForms:MP.8/jacquet-weyl-reflection


def torusK (t : ℝ) : KTwo := ⟨Matrix.diagonal ![1,Complex.exp (Complex.I*t)], by sorry⟩
-- Torus projections do not retain the original SO(2) weight-k vector condition.
def IsFiniteKMatrixCoefficient (phi : KTwo → ℂ) : Prop :=
  ∃ d : ℕ, ∃ sigma : KTwo →* (Matrix (Fin d) (Fin d) ℂ)ˣ,
    Continuous (fun q => (sigma q : Matrix (Fin d) (Fin d) ℂ)) ∧
    sigma ⟨(-1 : M2 ℂ), by sorry⟩ = 1 ∧
    ∃ v : Fin d → ℂ, ∃ T : (Fin d → ℂ) →ₗ[ℂ] ℂ,
      ∀ q, phi q = T (v ᵥ* (sigma q : Matrix (Fin d) (Fin d) ℂ))

-- Corrected from the evaluated integrals (3.26)–(3.27), not the p.562 normalizer.
def jacquetGammaArguments (eps n : ℤ) (s r : ℂ) : ℂ × ℂ :=
  let e : ℂ := eps
  let t : ℂ := n
  ((s-r+e*t+(e-1)/2)/2, (s+r+e*t+(e+1)/2)/2)
def normalizedJacquet (k : ℕ) (phi : KTwo → ℂ) (eps n : ℤ) (y1 y2 : ℝ) (s r : ℂ) : ℂ :=
  (2 : ℂ)^(-s)*(Real.pi : ℂ)^(-s)*Complex.Gamma (jacquetGammaArguments eps n s r).1*
    Complex.Gamma (jacquetGammaArguments eps n s r).2*jacquetTwoParameter k phi eps y1 y2 s r
example (n : ℤ) (s r : ℂ) :
    jacquetGammaArguments 1 n s r = ((s-r+n)/2,(s+r+n+1)/2) := by sorry
example (n : ℤ) (s r : ℂ) :
    jacquetGammaArguments (-1) n s r = ((s-r-n-1)/2,(s+r-n)/2) := by sorry

-- Joint meromorphic topology is omitted; these native slice statements retain the
-- reflection-stable continuation domain and do not posit an empty chamber overlap.
theorem jacquet_weyl_reflection (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsFiniteKMatrixCoefficient phi) (eps n : ℤ) (heps : eps=1 ∨ eps=-1)
    (hn : ∀ t q, phi (torusK t*q)=Complex.exp (-Complex.I*n*t)*phi q)
    (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2) :
    ∃ Vc : (ℂ × ℂ) → ℂ,
      (∀ r, 1/2<r.re → MeromorphicOn (fun s => Vc (s,r)) {s | 2<s.re}) ∧
      (∀ s, 2<s.re → MeromorphicOn (fun r => Vc (s,r)) {r | 1/2<r.re}) ∧
      (∀ s r, 2<s.re → 1/2<r.re → 3/2<(s-r).re →
        Vc (s,r)=jacquetTwoParameter k phi eps y1 y2 s r) ∧
      ∀ s r, 2<s.re → 1/2<r.re →
        (∀ j : ℕ, (jacquetGammaArguments eps n s r).1≠-(j : ℂ) ∧
          (jacquetGammaArguments eps n s r).2≠-(j : ℂ)) →
        (∀ j : ℕ, (jacquetGammaArguments eps n (r+3/2) (s-3/2)).1≠-(j : ℂ) ∧
          (jacquetGammaArguments eps n (r+3/2) (s-3/2)).2≠-(j : ℂ)) →
        (2 : ℂ)^(-s)*(Real.pi : ℂ)^(-s)*Complex.Gamma (jacquetGammaArguments eps n s r).1*
          Complex.Gamma (jacquetGammaArguments eps n s r).2*Vc (s,r)=
        (2 : ℂ)^(-(r+3/2))*(Real.pi : ℂ)^(-(r+3/2))*
          Complex.Gamma (jacquetGammaArguments eps n (r+3/2) (s-3/2)).1*
          Complex.Gamma (jacquetGammaArguments eps n (r+3/2) (s-3/2)).2*Vc (r+3/2,s-3/2) := by sorry


-- MetaplecticAutomorphicForms:MP.8/whittaker-continuation
theorem whittaker_continuation (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (eps : ℤ) (heps : eps=1 ∨ eps=-1)
    (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2) :
    ∃ W : ℂ → ℂ, DifferentiableOn ℂ W {s | 3/2<s.re} ∧
      ∀ s, 2<s.re → W s = whittakerFunction k phi eps y1 y2 s := by sorry


-- MetaplecticAutomorphicForms:MP.8/whittaker-rapid-decay


theorem whittaker_rapid_decay (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (eps : ℤ) (heps : eps=1 ∨ eps=-1) :
    ∃ W : ℝ → ℝ → ℂ → ℂ,
      (∀ y1 y2, 0<y1 → 0<y2 → DifferentiableOn ℂ (W y1 y2) {s | 3/2<s.re}) ∧
      (∀ y1 y2 s, 0<y1 → 0<y2 → 2<s.re → W y1 y2 s=whittakerFunction k phi eps y1 y2 s) ∧
      ∀ S : Set ℂ, IsCompact S → S⊆{s | 3/2<s.re} →
        ∃ C : ℝ, ∃ xi : SchwartzMap (ℝ × ℝ) ℝ,
          ∀ s∈S, ∀ y1 y2 : ℝ, 0<y1 → 0<y2 →
            ‖W y1 y2 s‖≤Real.rpow (y1*y2) (-C)*xi (y1,y2) := by sorry


-- MetaplecticAutomorphicForms:MP.8/degenerate-whittaker-continuation
theorem degenerate_whittaker_continuation (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2) :
    ∃ W : ℂ → ℂ, DifferentiableOn ℂ W {s | 3/2<s.re} ∧
      ∀ s, 2<s.re → W s = whittakerFunction k phi 0 y1 y2 s := by sorry


-- MetaplecticAutomorphicForms:MP.8/test-coefficient-algebra
def testPhi1 (x : Fin 3 → ℝ) : ℝ :=
  1 / Real.sqrt (1+(x 0)^2+2*(x 1)^2+(x 2)^2+(x 0*x 2-(x 1)^2)^2)
def testPhi2 (x : Fin 3 → ℝ) : ℝ :=
  (((symCoords x).det)^2-1)*x 0 /
    (1+(x 0)^2+2*(x 1)^2+(x 2)^2+(x 0*x 2-(x 1)^2)^2)^2
def testPhi3 (x : Fin 3 → ℝ) : ℝ :=
  x 1*(1-(symCoords x).det)/(1+(x 0)^2+2*(x 1)^2+(x 2)^2+(x 0*x 2-(x 1)^2)^2)
-- The R_k closure/density signature awaits the supplier's topological representation API.
-- Chart signatures are concrete; global membership is not assumed as a field.
lemma testPhi1_det (x : Fin 3 → ℝ) :
    testPhi1 x = 1 / ‖((symCoords x).map (fun a : ℝ => (a : ℂ))+baseMatrix).det‖ := by sorry
-- Test: testCoefficientAlgebra_base
example : (testPhi1 0,testPhi2 0,testPhi3 0) = (1,0,0) := by sorry
-- Test: testCoefficientAlgebra_nonzero_phi2
example : testPhi2 ![1,0,0] = -1/4 := by sorry
-- Test: testCoefficientAlgebra_nonzero_phi3
example : testPhi3 ![0,1,0] = 1/2 := by sorry


-- The chart value is positive, but this global compact coefficient is signed.
def globalTestPhi1 (q : KTwo) : ℂ := (((q : M2 ℂ).map Complex.im).det : ℝ)
lemma globalTestPhi1_chart (x : Fin 3 → ℝ) :
    globalTestPhi1 (kappaX x) = (testPhi1 x : ℂ) := by sorry
def deltaZ (z : ℝ) : ℝ := Real.sqrt (1+z^2)
def kappaZ (z : ℝ) : KTwo :=
  ⟨Matrix.diagonal ![1,(1-Complex.I*z)/(deltaZ z : ℂ)], by sorry⟩
lemma globalTestPhi1_rotated (x : Fin 3 → ℝ) (z : ℝ) :
    globalTestPhi1 (kappaX x*kappaZ z) =
      (((1+z*x 0)/deltaZ z*testPhi1 x : ℝ) : ℂ) := by sorry
-- Test: testCoefficientAlgebra_negative_branch
example : globalTestPhi1 (kappaX ![-2,0,0]*kappaZ 1) =
    ((-1/(Real.sqrt 2*Real.sqrt 5) : ℝ) : ℂ) := by sorry

def testCoefficientAlgebra (k : ℕ) : Submodule ℂ (KTwo → ℂ) := by sorry
lemma testCoefficientAlgebra_mul (k : ℕ) (f g : KTwo → ℂ)
    (hf : f ∈ testCoefficientAlgebra 0) (hg : g ∈ testCoefficientAlgebra k) :
    f*g ∈ testCoefficientAlgebra k := by sorry
lemma testCoefficientAlgebra_dense (k : ℕ) (he : Even k) (f : KTwo → ℂ) (hf : Continuous f)
    (hw : ∀ t : ℝ, ∀ q : KTwo, f (rotationK t*q)=expTwoPi ((k : ℂ)*t/(2*Real.pi))*f q)
    (eps : ℝ) (heps : 0<eps) : ∃ g ∈ testCoefficientAlgebra k, ∀ q, ‖g q-f q‖<eps := by sorry
lemma testCoefficientAlgebra_chart :
    globalTestPhi1 ∈ testCoefficientAlgebra 0 ∧
    ∃ f2 ∈ testCoefficientAlgebra 0, ∃ f3 ∈ testCoefficientAlgebra 0,
      ∀ x, globalTestPhi1 (kappaX x)=(testPhi1 x : ℂ) ∧
        f2 (kappaX x)=(testPhi2 x : ℂ) ∧ f3 (kappaX x)=(testPhi3 x : ℂ) := by sorry


-- φ₁ is weight zero. Divisibility is multiplication in the concrete coefficient ring.
def HasBFHDivisor (k : ℕ) (phi : KTwo → ℂ) : Prop :=
  ∃ psi ∈ testCoefficientAlgebra k, ∀ q : KTwo, phi q = globalTestPhi1 q*psi q


-- MetaplecticAutomorphicForms:MP.8/test-coefficient-strip


theorem test_coefficient_strip (k : ℕ) (phi : KTwo → ℂ) (hp : phi∈testCoefficientAlgebra k)
    (eps : ℝ) (he : 0<eps) (he1 : eps<1) :
    ∃ F : KTwo → ℝ → ℝ → ℂ → ℂ, ∃ B : ℝ, 0≤B ∧
      (∀ q x3 x4, DifferentiableOn ℂ (F q x3 x4) {z | |z.im|<1}) ∧
      (∀ q (x1 x3 x4 : ℝ), F q x3 x4 (x1 : ℂ)=phi (kappaX ![x1,x3,x4]*q)) ∧
      (∀ q x3 x4 z, |z.im|≤eps → ‖F q x3 x4 z‖≤B) := by sorry


-- MetaplecticAutomorphicForms:MP.8/rotated-whittaker-bound


-- Use the actual compact product (3.38), with the full scalar W prefactor.
-- The published (3.31) chart equality is false on the negative branch.
-- A compact-transition and uniform-majorant proof remains a packet gap.
def rotatedWhittakerKernel (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ)
    (y1 y2 : ℝ) (s : ℂ) (z : ℝ) (x : Fin 3 → ℝ) : ℂ :=
  ((y1*y2 : ℝ) : ℂ)^(4-s)*(y2 : ℂ)^((k : ℂ)/2)*
    whittakerKernel k (fun q => phi (q*kappaZ z)) eps y1 y2 s x
theorem rotated_whittaker_bound (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (hd : HasBFHDivisor k phi)
    (eps : ℤ) (heps : eps=1 ∨ eps=-1) (S : Set ℂ) (hS : IsCompact S) (hs : S⊆{s | 3/2<s.re}) :
    ∃ C B : ℝ, 0<C ∧ 0≤B ∧ ∀ s∈S, ∀ y1 y2 z : ℝ, 0<y1 → C<y2 →
      Integrable (rotatedWhittakerKernel k phi eps y1 y2 s z) ∧
      ‖∫ x : Fin 3 → ℝ, rotatedWhittakerKernel k phi eps y1 y2 s z x‖≤B*Real.rpow y1 (4-s.re) := by sorry


-- MetaplecticAutomorphicForms:MP.8/novodvorsky-transform
def novodvorskyKernel (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (u s : ℂ) (y1 y2 z : ℝ) : ℂ :=
  whittakerFunction k (fun q => phi (q*kappaZ z)) eps (y1/(1+z^2)) (deltaZ z*y2) s *
    expTwoPi (-eps*y1*z/(1+z^2)) * (y1 : ℂ)^(u-3/2) * Complex.sqrt (1+Complex.I*z)
def novodvorskyTransform (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (u s : ℂ) (y2 : ℝ) : ℂ :=
  ∫ y1 in Set.Ioi (0 : ℝ), (∫ z : ℝ, novodvorskyKernel k phi eps u s y1 y2 z) / y1
lemma novodvorskyTransform_zero (k : ℕ) (eps : ℤ) (u s : ℂ) (y2 : ℝ) :
    novodvorskyTransform k (fun _ => 0) eps u s y2 = 0 := by sorry
lemma novodvorskyTransform_scalar (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (u s c : ℂ) (y2 : ℝ) :
    novodvorskyTransform k (c • phi) eps u s y2 = c*novodvorskyTransform k phi eps u s y2 := by sorry
lemma novodvorskyTransform_sign (y1 z : ℝ) :
    expTwoPi (-y1*z/(1+z^2)) * expTwoPi (y1*z/(1+z^2)) = 1 := by sorry
-- Test: novodvorskyTransform_zero_test
example (k : ℕ) (u s : ℂ) (y2 : ℝ) : novodvorskyTransform k (fun _ => 0) 1 u s y2 = 0 := by sorry
-- Test: novodvorskyTransform_root
example : Complex.sqrt (1+Complex.I*(0 : ℝ)) = 1 := by sorry
-- Test: novodvorskyTransform_sign_test
example : expTwoPi ((-1 : ℂ)/2) = -1 := by sorry


-- MetaplecticAutomorphicForms:MP.8/novodvorsky-continuation


theorem novodvorsky_continuation (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (hd : HasBFHDivisor k phi)
    (eps : ℤ) (heps : eps=1 ∨ eps=-1) (y2 : ℝ) (h2 : 0<y2) :
    ∃ F : (ℂ × ℂ) → ℂ,
      DifferentiableOn ℂ F {z | 3/2<z.2.re ∧ 0<(z.1-z.2+5/2).re} ∧
      ∀ s, 2<s.re → ∃ U : ℝ, ∀ u, U<u.re → F (u,s)=novodvorskyTransform k phi eps u s y2 := by sorry


-- MetaplecticAutomorphicForms:MP.8/tau-transform


-- The fixed compact product ηw⁻¹κ_z wJ is obtained from the BFH matrices, not chosen freely.
def tauCompactArgument (z : ℝ) : KTwo := by sorry
def tauKernel (k : ℕ) (phi : KTwo → ℂ) (s : ℂ) (y2 z : ℝ) : ℂ :=
  (deltaZ z : ℂ)^(-s+(k : ℂ)/2)*Complex.exp (-2*Real.pi*y2*deltaZ z)*
    Complex.sqrt (1+Complex.I*z)*phi (tauCompactArgument z)
def tauTransform (k : ℕ) (phi : KTwo → ℂ) (s : ℂ) (y2 : ℝ) : ℂ := ∫ z : ℝ, tauKernel k phi s y2 z
lemma tauTransform_zero (k : ℕ) (s : ℂ) (y2 : ℝ) : tauTransform k (fun _ => 0) s y2=0 := by sorry
lemma tauTransform_scalar (k : ℕ) (phi : KTwo → ℂ) (s c : ℂ) (y2 : ℝ) :
    tauTransform k (c • phi) s y2=c*tauTransform k phi s y2 := by sorry
lemma tauTransform_holomorphic (k : ℕ) (phi : KTwo → ℂ) (hp : Continuous phi) (y2 : ℝ) (h2 : 0<y2) :
    Differentiable ℂ (fun s => tauTransform k phi s y2) := by sorry
-- Test: tauTransform_zero_test
example (k : ℕ) (s : ℂ) (y2 : ℝ) : tauTransform k (fun _ => 0) s y2=0 := by sorry
-- Test: tauTransform_base_factor
example (k : ℕ) (s : ℂ) (y2 : ℝ) : tauKernel k (fun _ => 1) s y2 0=Complex.exp (-2*Real.pi*y2) := by sorry
-- Test: tauTransform_weight_two
example (z : ℝ) : (deltaZ z : ℂ)^(-(1 : ℂ)+(2 : ℂ)/2)=1 := by sorry


-- MetaplecticAutomorphicForms:MP.8/degenerate-mellin-coefficients


-- Wc is the continued W⁰ family; its exact construction is supplied by the preceding continuation theorem.
def degenerateMellinCoefficients (Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ)
    (phi : KTwo → ℂ) (s : ℂ) (y2 : ℝ) : ℂ :=
  ∫ z : ℝ, (deltaZ z : ℂ)^(2*s-8)*Wc (fun q => phi (q*kappaZ z)) (deltaZ z*y2) s*Complex.sqrt (1+Complex.I*z)
def degenerateMellinOpposite (Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ)
    (phi : KTwo → ℂ) (s : ℂ) (y2 : ℝ) : ℂ := by sorry
-- Continued-family linearity, measurability and local holomorphic domination are
-- concrete hypotheses of the API below.
lemma degenerateMellinCoefficients_kernel (s : ℂ) (z : ℝ) :
    (deltaZ z : ℂ)^(2*s-8)*Complex.sqrt (1+Complex.I*z) =
    ((Real.sqrt (1+z^2) : ℝ) : ℂ)^(2*s-8)*Complex.sqrt (1+Complex.I*z) := by sorry
-- Test: degenerateMellinCoefficients_zero
example (Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ) (hz : ∀ y s, Wc (fun _ => 0) y s=0) (s : ℂ) (y2 : ℝ) :
    degenerateMellinCoefficients Wc (fun _ => 0) s y2=0 := by sorry
-- Test: degenerateMellinCoefficients_s_two
example (z : ℝ) : (deltaZ z : ℂ)^(2*(2 : ℂ)-8)=(1+(z : ℂ)^2)^(-2 : ℂ) := by sorry
-- Test: degenerateMellinCoefficients_z_zero
example (s : ℂ) : (deltaZ 0 : ℂ)^(2*s-8)*Complex.sqrt (1+Complex.I*(0 : ℝ))=1 := by sorry


lemma degenerateMellinCoefficients_linear (Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ)
    (hl : ∀ c phi y s, Wc (c • phi) y s=c*Wc phi y s)
    (phi : KTwo → ℂ) (s c : ℂ) (y2 : ℝ) :
    degenerateMellinCoefficients Wc (c • phi) s y2=c*degenerateMellinCoefficients Wc phi s y2 := by sorry
-- Holomorphy requires the continued W family and its compact-parameter integrable majorants.
lemma degenerateMellinCoefficients_holomorphic (Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ)
    (phi : KTwo → ℂ) (y2 : ℝ) (h2 : 0<y2)
    (hw : ∀ z : ℝ, DifferentiableOn ℂ (fun s =>
      (deltaZ z : ℂ)^(2*s-8)*Wc (fun q => phi (q*kappaZ z)) (deltaZ z*y2) s*Complex.sqrt (1+Complex.I*z)) {s | 3/2<s.re})
    (hmeas : ∀ s : ℂ, AEStronglyMeasurable (fun z : ℝ =>
      (deltaZ z : ℂ)^(2*s-8)*Wc (fun q => phi (q*kappaZ z)) (deltaZ z*y2) s*Complex.sqrt (1+Complex.I*z)))
    (hdom : ∀ s : ℂ, 3/2<s.re → ∃ U : Set ℂ, IsOpen U ∧ s∈U ∧ U⊆{t | 3/2<t.re} ∧
      ∃ B : ℝ → ℝ, Integrable B ∧ ∀ t∈U, ∀ z : ℝ,
        ‖(deltaZ z : ℂ)^(2*t-8)*Wc (fun q => phi (q*kappaZ z)) (deltaZ z*y2) t*Complex.sqrt (1+Complex.I*z)‖≤B z) :
    DifferentiableOn ℂ (fun s => degenerateMellinCoefficients Wc phi s y2) {s | 3/2<s.re} := by sorry


-- MetaplecticAutomorphicForms:MP.8/local-test-nonzero-f


theorem local_test_nonzero_f (k : ℕ) (hk : 2≤k) (he : Even k)
    (u s : ℂ) (hs : 3/2<s.re) (hu : 0<(u-s+5/2).re) :
    ∃ phi : KTwo → ℂ, IsBFHMatrixCoefficient k phi ∧ HasBFHDivisor k phi ∧
      (∀ t y2, 0<y2 → tauTransform k phi t y2=0) ∧
      ∀ eps : ℤ, eps=1 ∨ eps=-1 → ∃ y2 : ℝ, 0<y2 ∧ ∃ F : (ℂ × ℂ) → ℂ,
        DifferentiableOn ℂ F {z | 3/2<z.2.re ∧ 0<(z.1-z.2+5/2).re} ∧ F (u,s)≠0 ∧
        ∀ t, 2<t.re → ∃ U : ℝ, ∀ v, U<v.re → F (v,t)=novodvorskyTransform k phi eps v t y2 := by sorry


-- MetaplecticAutomorphicForms:MP.8/local-test-nonzero-tau


theorem local_test_nonzero_tau (k : ℕ) (hk : 2≤k) (he : Even k) (s : ℂ) (hs : 3/2<s.re) :
    ∃ phi : KTwo → ℂ, IsBFHMatrixCoefficient k phi ∧ HasBFHDivisor k phi ∧
      ∃ y2 : ℝ, 0<y2 ∧ tauTransform k phi s y2≠0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/local-test-nonzero-m


theorem local_test_nonzero_m (k : ℕ) (hk : 2≤k) (he : Even k) :
    ∃ Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ,
      (∀ psi, IsBFHMatrixCoefficient k psi → ∀ y, 0<y → DifferentiableOn ℂ (Wc psi y) {s | 3/2<s.re}) ∧
      (∀ psi, IsBFHMatrixCoefficient k psi → ∀ y s, 0<y → 2<s.re → Wc psi y s=whittakerFunction k psi 0 1 y s) ∧
      ∃ phi : KTwo → ℂ, IsBFHMatrixCoefficient k phi ∧ HasBFHDivisor k phi ∧
        (∀ s y, 0<y → tauTransform k phi s y=0) ∧
        ∃ y : ℝ, 0<y ∧ degenerateMellinCoefficients Wc phi 2 y≠0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/similitude-heisenberg-comparison


def symplecticPairing (w v : I4 → ℝ) : ℝ := w ⬝ᵥ (Matrix.J (Fin 2) ℝ *ᵥ v)
def heisenbergCoordinatesMul (x y : (I4 → ℝ) × ℝ) : (I4 → ℝ) × ℝ :=
  (x.1+y.1,x.2+y.2+symplecticPairing x.1 y.1/2)
def similitudeCoordinatesAction (g : positiveSimilitudes) (x : (I4 → ℝ) × ℝ) : (I4 → ℝ) × ℝ :=
  ((g.val.1 : M4 ℝ) *ᵥ x.1,(g.val.2 : ℝ)*x.2)
-- OMITTED CONDITION: the MP.6 native Jacobi equivalence and its arithmetic lattices.
theorem similitude_heisenberg_comparison (g : positiveSimilitudes) (x y : (I4 → ℝ) × ℝ) :
    similitudeCoordinatesAction g (heisenbergCoordinatesMul x y)=
      heisenbergCoordinatesMul (similitudeCoordinatesAction g x) (similitudeCoordinatesAction g y) := by sorry


-- MetaplecticAutomorphicForms:MP.8/full-real-cover


def coverConjugation : MulAut similitudeCover := by sorry
def coverReflectionAction : Multiplicative (ZMod 2) →* MulAut similitudeCover := by sorry
abbrev fullRealCover := SemidirectProduct similitudeCover (Multiplicative (ZMod 2)) coverReflectionAction
def fullRealProjection : fullRealCover →* (M4 ℝ)ˣ := by sorry
lemma fullRealCover_positive (g : similitudeCover) :
    fullRealProjection ⟨g,1⟩ = g.base.val.1 := by sorry
lemma fullRealCover_kernel (g : fullRealCover) (h : fullRealProjection g=1) :
    g.right=1 ∧ ((∀ z, g.left.root z=1) ∨ (∀ z, g.left.root z=-1)) := by sorry
lemma fullRealCover_reflection :
    (⟨1,Multiplicative.ofAdd (1 : ZMod 2)⟩ : fullRealCover)^2=1 := by sorry
-- Test: fullRealCover_reflection_test
example : (Matrix.fromBlocks (1 : M2 ℝ) 0 0 (-1))^2=(1 : M4 ℝ) := by sorry
-- Test: fullRealCover_base
example : -(baseMatrix.map star)=baseMatrix := by sorry
-- Test: fullRealCover_central
example (g : similitudeCover) (h : g.base=1) (hroot : ∀ z, g.root z=-1) :
    ∀ z, (coverConjugation g).root z=-1 := by sorry


-- MetaplecticAutomorphicForms:MP.8/arithmetic-adelic-comparison


-- arithmetic_adelic_comparison: signature omitted. MP.4 must supply the native
-- restricted product of local covers, rational splitting, dyadic compact-open lattice
-- stabilizer and rational-similitude extension before this comparison can be typed.
-- Its full statement, prerequisite request and exact gap are in the definitive packet.


-- MetaplecticAutomorphicForms:MP.8/theta-levi-transform


def bfhLevi (Q : M2 ℝ) : M4 ℝ := Matrix.fromBlocks Q 0 0 Q⁻¹ᵀ
theorem theta_levi_transform (N m : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N∣m)
    (n : ℤ) (hn : (N : ℤ)∣n) (phi : bfhJacobiFunctions N m 1) (g : positiveSimilitudes) (nu : IVec) :
    thetaComponent N (m/N) 1 phi.toFun (bfhLevi !![1,(n : ℝ);0,1]*(g.val.1 : M4 ℝ)) nu=
      thetaComponent N (m/N) 1 phi.toFun (g.val.1 : M4 ℝ) ((!![1,n;0,1] : M2 ℤ)ᵀ *ᵥ nu) := by sorry


-- MetaplecticAutomorphicForms:MP.8/theta-unipotent-transforms


-- The cover-valued lower-unipotent root law remains in the definitive packet;
-- this native signature is its upper-unipotent specialization.
theorem theta_unipotent_transforms (N m : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N∣m)
    (phi : bfhJacobiFunctions N m 1) (g : positiveSimilitudes) (r : ℤ)
    (Vv : M2 ℤ) (hv : Vvᵀ=Vv) (h00 : (N : ℤ)∣Vv 0 0) (h01 : (N : ℤ)∣Vv 0 1)
    (h11 : (4*(m : ℤ))∣Vv 1 1) :
    thetaComponent N (m/N) 1 phi.toFun (unipotent (Vv.map (fun z => (z : ℝ)))*(g.val.1 : M4 ℝ)) ![0,r]=
      thetaComponent N (m/N) 1 phi.toFun (g.val.1 : M4 ℝ) ![0,r] := by sorry


-- MetaplecticAutomorphicForms:MP.8/coefficient-levi-transform


-- Native quadratic-form congruence gives the exact yᵀTy matrix relation.
theorem coefficient_levi_transform (Q : QuadraticForm ℤ IVec) (y : M2 ℤ) :
    quadraticMatrix (Q.comp (Matrix.toLin' y))=
      (y.map (fun z : ℤ => (z : ℚ)))ᵀ*quadraticMatrix Q*(y.map (fun z : ℤ => (z : ℚ))) := by sorry
-- The actual B_j/C_j covariance additionally imports the cusp subgroup and residue transport.


-- MetaplecticAutomorphicForms:MP.8/matrix-mobius
def matrixMobius (H : M2 ℤ) : ℤ := by sorry
lemma matrixMobius_unimodular (H : (M2 ℤ)ˣ) : matrixMobius H = 1 := by sorry
lemma matrixMobius_smith (a b : ℕ) (ha : 0<a) (hb : 0<b) (hab : a∣b) :
    matrixMobius !![(a : ℤ),0;0,(b : ℤ)] =
      (Nat.gcd a b : ℤ)*ArithmeticFunction.moebius a*ArithmeticFunction.moebius b := by sorry
lemma matrixMobius_equiv (H : M2 ℤ) (U Vv : (M2 ℤ)ˣ) :
    matrixMobius ((U : M2 ℤ)*H*(Vv : M2 ℤ)) = matrixMobius H := by sorry
-- Test: matrixMobius_identity
example : matrixMobius (1 : M2 ℤ) = 1 := by sorry
-- Test: matrixMobius_scalar_prime
example (p : ℕ) (hp : p.Prime) : matrixMobius ((p : ℤ) • (1 : M2 ℤ)) = p := by sorry
-- Test: matrixMobius_square_prime
example (p : ℕ) (hp : p.Prime) : matrixMobius !![((p : ℤ)^2),0;0,1] = 0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/primitive-symplectic-pairs
def primitivePair (C D : M2 ℤ) : Prop :=
  ∀ G : M2 ℚ, (∀ i j, ∃ z : ℤ, (G*C.map (fun z => (z : ℚ))) i j = z) →
    (∀ i j, ∃ z : ℤ, (G*D.map (fun z => (z : ℚ))) i j = z) →
    ∀ i j, ∃ z : ℤ, G i j = z
theorem primitive_symplectic_pairs (C D : M2 ℤ) (hs : C*Dᵀ=D*Cᵀ)
    (hr : ∀ v : Fin 2 → ℚ, v ᵥ* C.map (fun z => (z : ℚ)) = 0 → v ᵥ* D.map (fun z => (z : ℚ)) = 0 → v = 0) :
    primitivePair C D ↔ ∃ g : Matrix.symplecticGroup (Fin 2) ℤ,
      (∀ i j, (g : M4 ℤ) (.inr i) (.inl j)=C i j) ∧
      (∀ i j, (g : M4 ℤ) (.inr i) (.inr j)=D i j) := by sorry


-- MetaplecticAutomorphicForms:MP.8/matrix-mobius-divisor-identity


abbrev MatrixDivisors (C : M2 ℤ) := {L : Submodule ℤ IVec // LinearMap.range (Matrix.toLin' C) ≤ L}
-- Choose a Z-basis of the full lattice; the μ₂ value does not depend on this choice.
def matrixDivisorRepresentative (C : M2 ℤ) (L : MatrixDivisors C) : M2 ℤ := by sorry
theorem matrix_mobius_divisor_identity (C : M2 ℤ) (hc : C.det≠0) :
    (∑' L : MatrixDivisors C, (matrixMobius (matrixDivisorRepresentative C L) : ℂ))=
      if IsUnit C.det then 1 else 0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/matrix-mobius-inversion


-- These computational sums range over the actual symmetric-pair translation quotient.
def symmetricPairSum (N : ℕ) (restricted primitive : Bool) (C : M2 ℤ) (h : M2 ℚ → ℂ) : ℂ := by sorry
def matrixDivisorQuotient (C : M2 ℤ) (L : MatrixDivisors C) : M2 ℤ := by sorry
theorem matrix_mobius_inversion (C : M2 ℤ) (hc : C.det≠0) (h : M2 ℚ → ℂ)
    (hp : ∀ X : M2 ℚ, Xᵀ=X → ∀ S : M2 ℤ, Sᵀ=S → h (X+S.map (fun z => (z : ℚ)))=h X) :
    symmetricPairSum 1 false true C h=
      ∑' L : MatrixDivisors C, (matrixMobius (matrixDivisorRepresentative C L) : ℂ)*
        symmetricPairSum 1 false false (matrixDivisorQuotient C L) h := by sorry


-- MetaplecticAutomorphicForms:MP.8/finite-exponential-sums


def finiteExponentialSums (j : Fin 2) (N : ℕ) (m : ℤ) (C : M2 ℤ)
    (T : QuadraticForm ℤ IVec) (R : IVec) : ℂ := by sorry
-- The phase on the cusp-one representatives, with the exact native quadratic-form dictionary.
def firstCuspPhase (N : ℕ) (m : ℤ) (C D : M2 ℤ) (T : QuadraticForm ℤ IVec) (R l : IVec) : ℂ :=
  let A := (C.map (fun z => (z : ℚ)))⁻¹ * D.map (fun z => (z : ℚ))
  expTwoPi (-(ivCast R ⬝ᵥ (A.map (fun q => (q : ℂ)) *ᵥ ivCast l)) +
    m*quad (A.map (fun q => (q : ℂ))) (ivCast l) +
    (1/(N : ℂ))*((quadraticMatrix T * A).trace : ℚ))
lemma finiteExponentialSums_well_defined (N : ℕ) (m : ℤ) (C D S : M2 ℤ)
    (hc : C.det≠0) (hd : C*Dᵀ=D*Cᵀ) (hs : Sᵀ=S) (T : QuadraticForm ℤ IVec) (R l h : IVec) :
    firstCuspPhase N m C (D+(N : ℤ) • (C*S)) T R (l+Cᵀ *ᵥ h)=firstCuspPhase N m C D T R l := by sorry
lemma finiteExponentialSums_identity (N : ℕ) (hN : 0<N) (m : ℤ)
    (T : QuadraticForm ℤ IVec) (R : IVec) : finiteExponentialSums 1 N m 1 T R=1 := by sorry
lemma finiteExponentialSums_bad_determinant (N : ℕ) (hN : 0<N) (m : ℤ) (C : M2 ℤ)
    (hc : C.det≠0) (hbad : 1<Int.gcd C.det N) (T : QuadraticForm ℤ IVec) (R : IVec) :
    finiteExponentialSums 1 N m C T R=0 := by sorry
-- Test: finiteExponentialSums_identity_test
example : finiteExponentialSums 1 1 1 1 0 0=1 := by sorry
-- Test: finiteExponentialSums_bad_prime
example (p N : ℕ) (hp : p.Prime) (hN : 0<N) (hd : p∣N) (T : QuadraticForm ℤ IVec) (R : IVec) :
    finiteExponentialSums 1 N 1 ((p : ℤ) • (1 : M2 ℤ)) T R=0 := by sorry
-- Test: finiteExponentialSums_gauss
example : finiteExponentialSums 1 1 1 (!![1,0;0,3] : M2 ℤ) 0 0=0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/fourier-unfolding-kernel


def fourierUnfoldingKernel (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (Q : M2 ℝ) (s : ℂ)
    (C : M2 ℤ) (T : M2 ℚ) (R : IVec) : ℂ :=
  (1/(2*m*(N : ℂ)^3)) * ∫ x : Fin 3 → ℝ,
    let Y := Q*Qᵀ
    let Z := (symCoords x).map (fun a : ℝ => (a : ℂ)) + Complex.I • Y.map (fun a : ℝ => (a : ℂ))
    Complex.sqrt (-Z.det) * Complex.exp (s/2*Real.log (Y.det/‖Z.det‖^2)) *
      I (Matrix.fromBlocks (0 : M2 ℝ) (-(C.map (fun z => (z : ℝ)))⁻¹ᵀ) (C.map (fun z => (z : ℝ))) 0 *
        Matrix.fromBlocks Q ((symCoords x)*Q⁻¹ᵀ) 0 Q⁻¹ᵀ) *
      expTwoPi (quad Z (ivCast R)/(4*m) - (1/(N : ℂ))*((T.map (fun q => (q : ℂ))*Z).trace))
lemma fourierUnfoldingKernel_zero (N : ℕ) (m : ℤ) (Q : M2 ℝ) (s : ℂ) (C : M2 ℤ) (T : M2 ℚ) (R : IVec) :
    fourierUnfoldingKernel N m (fun _ => 0) Q s C T R=0 := by sorry
lemma fourierUnfoldingKernel_linear (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (Q : M2 ℝ) (s c : ℂ)
    (C : M2 ℤ) (T : M2 ℚ) (R : IVec) :
    fourierUnfoldingKernel N m (c • I) Q s C T R=c*fourierUnfoldingKernel N m I Q s C T R := by sorry
lemma fourierUnfoldingKernel_discriminant (N : ℕ) (hN : 0<N) (m : ℤ) (hm : m≠0)
    (I : M4 ℝ → ℂ) (Q : M2 ℝ) (s : ℂ) (C : M2 ℤ) (Uq : M2 ℚ) (R : IVec) :
    fourierUnfoldingKernel N m I Q s C ((1/(4*m : ℚ)) • (Uq+(N : ℚ) • Matrix.vecMulVec (fun i => (R i : ℚ)) (fun i => (R i : ℚ)))) R =
      fourierUnfoldingKernel N m I Q s C ((1/(4*m : ℚ)) • Uq) 0 := by sorry
-- Test: fourierUnfoldingKernel_zero_test
example (N : ℕ) (m : ℤ) (Q : M2 ℝ) (s : ℂ) (C : M2 ℤ) (T : M2 ℚ) (R : IVec) :
    fourierUnfoldingKernel N m (fun _ => 0) Q s C T R=0 := by sorry
-- Test: fourierUnfoldingKernel_base_root
example : Complex.sqrt (-baseMatrix.det)=1 := by sorry
-- Test: fourierUnfoldingKernel_shift_test
example (Z : M2 ℂ) : quad Z ![0,1]/(4*(16 : ℂ)) - (1/(8 : ℂ))*((!![0,0;0,(1/8 : ℂ)]*Z).trace)=0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/cusp-one-unfolding


-- Quotient relation: left Γ⁰(N) multiplication on nonsingular C with N|C₁₂.
def firstCuspSetoid (N : ℕ) : Setoid {C : M2 ℤ // C.det≠0 ∧ (N : ℤ)∣C 0 1} := by sorry
abbrev FirstCuspClasses (N : ℕ) := Quotient (firstCuspSetoid N)
def firstCuspRepresentative (N : ℕ) (c : FirstCuspClasses N) : M2 ℤ := by sorry
-- OMITTED HYPOTHESES: I is the BFH elliptic newform seed with its exact covariance.
theorem cusp_one_unfolding (N m : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N∣m)
    (I : M4 ℝ → ℂ) (Q : M2 ℝ) (hQ : (Q*Qᵀ).PosDef)
    (X : M2 ℝ) (hX : Xᵀ=X) (T : QuadraticForm ℤ IVec) (R : IVec) :
    ∃ S : ℝ, ∀ s : ℂ, S<s.re →
      fourierCoefficient N 1 (jacobiEisenstein N m I s) (Matrix.fromBlocks Q (X*Q⁻¹ᵀ) 0 Q⁻¹ᵀ) T R=
      ∑' c : FirstCuspClasses N,
        finiteExponentialSums 1 N m (firstCuspRepresentative N c) T R *
          ((firstCuspRepresentative N c).det.natAbs : ℂ)^(-s)*
          fourierUnfoldingKernel N m I Q s (firstCuspRepresentative N c) (quadraticMatrix T) R := by sorry


-- MetaplecticAutomorphicForms:MP.8/cusp-zero-rank-expansion


def zeroCuspSetoid (N : ℕ) : Setoid {C : M2 ℤ // C.det≠0 ∧ ∀ i j, (N : ℤ)∣C i j} := by sorry
abbrev ZeroCuspClasses (N : ℕ) := Quotient (zeroCuspSetoid N)
def zeroCuspRepresentative (N : ℕ) (c : ZeroCuspClasses N) : M2 ℤ := by sorry
-- These are the original rank-C=1 and rank-C=0 terms of (5.4), before cancellation.
def rankOneCoefficient (N m : ℕ) (I : M4 ℝ → ℂ) (s : ℂ) (g : M4 ℝ) (T : QuadraticForm ℤ IVec) (R : IVec) : ℂ := by sorry
def rankZeroCoefficient (N m : ℕ) (I : M4 ℝ → ℂ) (s : ℂ) (g : M4 ℝ) (T : QuadraticForm ℤ IVec) (R : IVec) : ℂ := by sorry
-- OMITTED HYPOTHESES: I is the specified BFH newform seed.
theorem cusp_zero_rank_expansion (N m : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N∣m)
    (I : M4 ℝ → ℂ) (Q : M2 ℝ) (hQ : (Q*Qᵀ).PosDef)
    (X : M2 ℝ) (hX : Xᵀ=X) (T : QuadraticForm ℤ IVec) (R : IVec) :
    ∃ S : ℝ, ∀ s : ℂ, S<s.re →
      fourierCoefficient N 0 (jacobiEisenstein N m I s) (Matrix.fromBlocks Q (X*Q⁻¹ᵀ) 0 Q⁻¹ᵀ) T R=
      (∑' c : ZeroCuspClasses N, finiteExponentialSums 0 N m (zeroCuspRepresentative N c) T R *
        ((zeroCuspRepresentative N c).det.natAbs : ℂ)^(-s)*(N : ℂ)^3*
        fourierUnfoldingKernel N m I Q s (zeroCuspRepresentative N c) ((N : ℚ) • quadraticMatrix T) ((N : ℤ) • R)) +
      rankOneCoefficient N m I s (Matrix.fromBlocks Q (X*Q⁻¹ᵀ) 0 Q⁻¹ᵀ) T R +
      rankZeroCoefficient N m I s (Matrix.fromBlocks Q (X*Q⁻¹ᵀ) 0 Q⁻¹ᵀ) T R := by sorry


-- MetaplecticAutomorphicForms:MP.8/whittaker-coefficient-extraction


-- j indexes the two actual theta-component families; cusp zero is extended by zero outside 4m|D.
def whittakerCoefficientExtraction (j : Fin 2) (N : ℕ) (m : ℤ)
    (C : M4 ℝ → M2 ℚ → IVec → ℂ) (D r : ℤ) (q : ℕ) (y1 y2 : ℝ) : ℂ := by sorry
lemma whittakerCoefficientExtraction_linear (j : Fin 2) (N : ℕ) (m : ℤ)
    (C : M4 ℝ → M2 ℚ → IVec → ℂ) (D r : ℤ) (q : ℕ) (y1 y2 : ℝ) (c : ℂ) :
    whittakerCoefficientExtraction j N m (c • C) D r q y1 y2=c*whittakerCoefficientExtraction j N m C D r q y1 y2 := by sorry
-- A native scalar period integral exposes the interval-independence API.
def periodCoefficient (N : ℕ) (q : ℤ) (f : ℝ → ℂ) (a : ℝ) : ℂ :=
  (1/(N : ℂ))*∫ x in Set.Icc a (a+N), f x*expTwoPi (-(q : ℂ)*x/N)
lemma whittakerCoefficientExtraction_period (N : ℕ) (hN : 0<N) (q : ℤ) (f : ℝ → ℂ)
    (hf : Continuous f) (hp : ∀ x, f (x+N)=f x) (a : ℝ) : periodCoefficient N q f a=periodCoefficient N q f 0 := by sorry
-- The zero extension is part of the computational definition.
lemma whittakerCoefficientExtraction_parity (N : ℕ) (m : ℤ)
    (C : M4 ℝ → M2 ℚ → IVec → ℂ) (D r : ℤ) (q : ℕ) (y1 y2 : ℝ) (h : ¬4*m∣D) :
    whittakerCoefficientExtraction 0 N m C D r q y1 y2=0 := by sorry
-- Test: whittakerCoefficientExtraction_zero
example (j : Fin 2) (N : ℕ) (m D r : ℤ) (q : ℕ) (y1 y2 : ℝ) :
    whittakerCoefficientExtraction j N m (fun _ _ _ => 0) D r q y1 y2=0 := by sorry
-- Test: whittakerCoefficientExtraction_frequency
example (N : ℕ) (hN : 0<N) (q : ℤ) (c : ℂ) : periodCoefficient N q (fun x => expTwoPi ((q : ℂ)*x/N)*c) 0=c := by sorry
-- Test: whittakerCoefficientExtraction_wrong_frequency
example (N : ℕ) (hN : 0<N) (q r : ℤ) (h : q≠r) (c : ℂ) :
    periodCoefficient N r (fun x => expTwoPi ((q : ℂ)*x/N)*c) 0=0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/bfh-l-dirichlet-series


def bfhLTerm (N k : ℕ) (m r n1 : ℤ) (q : ℕ) (a : ℕ → ℂ) (s : ℂ) (alpha beta delta : ℕ) : ℂ :=
  if 0<alpha ∧ 0<delta ∧ beta<N*delta ∧ N∣beta ∧ alpha∣q*delta then
    finiteExponentialSums 1 N m (!![(alpha : ℤ),(beta : ℤ);0,(delta : ℤ)])
      (n1 • QuadraticMap.proj 1 1) ![0,r] * ((alpha*delta : ℕ) : ℂ)^(-s) *
      ((alpha : ℂ)/delta)^((k : ℂ)/2) * a (q*delta/alpha) * expTwoPi ((q : ℂ)*beta/(N*alpha))
  else 0
def bfhLDirichletSeries (N k : ℕ) (m r n1 : ℤ) (q : ℕ) (a : ℕ → ℂ) (s : ℂ) : ℂ :=
  ∑' t : ℕ × ℕ × ℕ, bfhLTerm N k m r n1 q a s t.1 t.2.1 t.2.2
lemma bfhLDirichletSeries_scalar (N k : ℕ) (m r n1 : ℤ) (q : ℕ) (a : ℕ → ℂ) (s c : ℂ) :
    bfhLDirichletSeries N k m r n1 q (c • a) s=c*bfhLDirichletSeries N k m r n1 q a s := by sorry
lemma bfhLDirichletSeries_identity_term (N k : ℕ) (hN : 0<N) (m r n1 : ℤ) (q : ℕ) (a : ℕ → ℂ) (s : ℂ) :
    bfhLTerm N k m r n1 q a s 1 0 1=a q := by sorry
lemma bfhLDirichletSeries_specialize (N k : ℕ) (m r n1 : ℤ) (a : ℕ → ℂ) (s : ℂ) :
    bfhLDirichletSeries N k m r n1 1 a s=∑' t : ℕ × ℕ × ℕ, bfhLTerm N k m r n1 1 a s t.1 t.2.1 t.2.2 := by sorry
-- Test: bfhLDirichletSeries_zero
example (N k : ℕ) (m r n1 : ℤ) (q : ℕ) (s : ℂ) : bfhLDirichletSeries N k m r n1 q (fun _ => 0) s=0 := by sorry
-- Test: bfhLDirichletSeries_normalized_term
example (N k : ℕ) (hN : 0<N) (m r n1 : ℤ) (a : ℕ → ℂ) (ha : a 1=1) (s : ℂ) : bfhLTerm N k m r n1 1 a s 1 0 1=1 := by sorry
-- Test: bfhLDirichletSeries_divisibility
example (N k : ℕ) (m r n1 : ℤ) (a : ℕ → ℂ) (s : ℂ) : bfhLTerm N k m r n1 1 a s 2 0 1=0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/bfh-p-dirichlet-series


-- The transformed cusp coefficient function is imported from upstream ModularForms layer 6; use its actual matrices here.
def bfhPDirichletSeries (N k : ℕ) (m D r : ℤ) (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s : ℂ) : ℂ := by sorry
lemma bfhPDirichletSeries_scalar (N k : ℕ) (m D r : ℤ) (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s c : ℂ) :
    bfhPDirichletSeries N k m D r q (c • aCusp) s=c*bfhPDirichletSeries N k m D r q aCusp s := by sorry
lemma bfhPDirichletSeries_residue (N k : ℕ) (hN : 0<N) (m D r : ℤ) (hm : (N : ℤ)∣m)
    (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s : ℂ) :
    bfhPDirichletSeries N k m D (r+2*m/N) q aCusp s=bfhPDirichletSeries N k m D r q aCusp s := by sorry
lemma bfhPDirichletSeries_parity (N k : ℕ) (m D r : ℤ) (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s : ℂ)
    (h : ¬4*m∣D) : bfhPDirichletSeries N k m D r q aCusp s=0 := by sorry
-- Test: bfhPDirichletSeries_zero
example (N k : ℕ) (m D r : ℤ) (q : ℕ) (s : ℂ) : bfhPDirichletSeries N k m D r q (fun _ _ => 0) s=0 := by sorry
-- Test: bfhPDirichletSeries_residue_test
example (k : ℕ) (D r : ℤ) (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s : ℂ) :
    bfhPDirichletSeries 8 k 16 D (r+4) q aCusp s=bfhPDirichletSeries 8 k 16 D r q aCusp s := by sorry
-- Test: bfhPDirichletSeries_nonintegral
example (k : ℕ) (r : ℤ) (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s : ℂ) :
    bfhPDirichletSeries 8 k 16 1 r q aCusp s=0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/first-cusp-whittaker-expansion


-- OMITTED HYPOTHESES: C is the actual first-cusp theta coefficient family of the
-- BFH elliptic-newform Eisenstein series at s, and a is the original normalized f.
theorem first_cusp_whittaker_expansion (N m k : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N∣m)
    (C : ℂ → M4 ℝ → M2 ℚ → IVec → ℂ) (a : ℕ → ℂ) (phi : KTwo → ℂ)
    (hp : IsBFHMatrixCoefficient k phi) (D r : ℤ) (hD : D≠0) (q : ℕ) (hq : 0<q)
    (hindex : (4*(m : ℤ))∣((N : ℤ)*(r^2-D)))
    (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2) :
    ∃ S : ℝ, ∀ s : ℂ, S<s.re →
      whittakerCoefficientExtraction 1 N m (C s) D r q y1 y2=
      (((q : ℂ)/N)*(D.natAbs : ℂ)/(4*m))^(s-4)*((q : ℂ)/N)^(-(k : ℂ)/2)*
        expTwoPi (Complex.I*y1*D/(4*m))*
        bfhLDirichletSeries N k m r ((N : ℤ)*(r^2-D)/(4*m)) q a s*
        whittakerFunction k phi D.sign ((D.natAbs : ℝ)*y1/(4*m)) ((q : ℝ)/N*y2) s := by sorry


-- MetaplecticAutomorphicForms:MP.8/opposite-cusp-whittaker-expansion


-- OMITTED HYPOTHESES: C is the actual opposite-cusp coefficient family, aCusp its
-- Fricke/cusp seed, and phiW(q)=T(vσ(qw)) with the specified w.
theorem opposite_cusp_whittaker_expansion (N m k : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N∣m)
    (C : ℂ → M4 ℝ → M2 ℚ → IVec → ℂ) (aCusp : M2 ℤ → ℕ → ℂ) (phiW : KTwo → ℂ)
    (D r : ℤ) (hD : D≠0) (hindex : (4*(m : ℤ))∣D) (q : ℕ) (hq : 0<q)
    (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2) :
    ∃ S : ℝ, ∀ s : ℂ, S<s.re →
      whittakerCoefficientExtraction 0 N m (C s) D r q y1 y2=
      (N : ℂ)^3*(((q : ℂ)/N)*(D.natAbs : ℂ)/(4*m))^(s-4)*((q : ℂ)/N)^(-(k : ℂ)/2)*
        expTwoPi (Complex.I*y1*D/(4*m))*bfhPDirichletSeries N k m D r q aCusp s*
        whittakerFunction k phiW D.sign ((D.natAbs : ℝ)*y1/(4*m)) ((q : ℝ)/N*y2) s := by sorry


-- MetaplecticAutomorphicForms:MP.8/local-prime-root-counts


-- n0 is a chosen integer representative of n1/N in the required p-power ring.
-- The CRT comparison proves representative independence before using these counts.
def localPrimeRootCounts (p a _b d : ℕ) (m r n0 : ℤ) : ℕ :=
  Nat.card {v : Fin (p^a) × Fin (p^d) //
    Int.ModEq (p^a) (m*(v.1.val : ℤ)^2) 0 ∧
    Int.ModEq (p^(min a d)) (2*m*v.1.val*v.2.val-r*v.1.val) 0 ∧
    Int.ModEq (p^d) (m*(v.2.val : ℤ)^2-r*v.2.val+n0) 0}
def thirdPrimeRootCounts (p a b d : ℕ) (m r n0 : ℤ) : ℕ :=
  Nat.card {v : Fin (p^b) × Fin (p^(a+d-b)) //
    Int.ModEq (p^b) (m*(v.1.val : ℤ)^2+r*v.1.val+n0) 0 ∧
    Int.ModEq (p^b) (2*m*v.1.val*v.2.val+r*v.2.val-r*(p : ℤ)^(a-b)*v.1.val-2*(p : ℤ)^(a-b)*n0) 0 ∧
    Int.ModEq (p^(a+d-b)) (m*(v.2.val : ℤ)^2-r*(p : ℤ)^(a-b)*v.2.val+(p : ℤ)^(2*(a-b))*n0) 0}
lemma localPrimeRootCounts_zero_exponents (p b : ℕ) (m r n0 : ℤ) : localPrimeRootCounts p 0 b 0 m r n0=1 := by sorry
lemma localPrimeRootCounts_finite (p a b d : ℕ) (m r n0 : ℤ) : localPrimeRootCounts p a b d m r n0≤p^a*p^d := by sorry
lemma localPrimeRootCounts_quadratic (p b d : ℕ) (m r n0 : ℤ) :
    localPrimeRootCounts p 0 b d m r n0=Nat.card {v : Fin (p^d) // Int.ModEq (p^d) (m*(v.val : ℤ)^2-r*v.val+n0) 0} := by sorry
-- Test: localPrimeRootCounts_base
example : localPrimeRootCounts 3 0 0 0 1 0 0=1 := by sorry
-- Test: localPrimeRootCounts_split
example : localPrimeRootCounts 3 0 0 1 1 0 (-1)=2 := by sorry
-- Test: localPrimeRootCounts_nonsplit
example : localPrimeRootCounts 3 0 0 1 1 0 1=0 := by sorry


-- Test: localPrimeRootCounts_mixed_modulus
example : localPrimeRootCounts 3 2 2 1 16 1 0=6 := by sorry

-- MetaplecticAutomorphicForms:MP.8/local-root-count-table


-- Prototype: the h=0, a=0 row, avoiding an untyped fundamental-character field.
theorem local_root_count_table (p d : ℕ) (hp : p.Prime) (hp2 : p≠2) (hd : 0<d)
    (m r n0 : ℤ) (hm : ¬(p : ℤ)∣m)
    (hD : ¬(p : ℤ)∣(r^2-4*m*n0)) :
    localPrimeRootCounts p 0 0 d m r n0=
      if ∃ x : Fin p, Int.ModEq p ((x.val : ℤ)^2) (r^2-4*m*n0) then 2 else 0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/local-mobius-factors


-- S is the concrete unrestricted local sum; the μ₂-inverted value uses only these four divisors.
def invertedLocalSum (p a b d : ℕ) (S : ℕ → ℕ → ℕ → ℂ) : ℂ := by sorry
theorem local_mobius_factors (p a b d : ℕ) (hp : p.Prime) (hd : 0<d) (S : ℕ → ℕ → ℕ → ℂ) :
    invertedLocalSum p a b d S=
      if a=0 ∨ b=0 then S a b d-(p : ℂ)*S a b (d-1)
      else S a b d-(p : ℂ)^2*S (a-1) (b-1) d-(p : ℂ)*S a b (d-1)+
        (p : ℂ)^3*S (a-1) (b-1) (d-1) := by sorry


-- MetaplecticAutomorphicForms:MP.8/unramified-euler-factors


def unramifiedLocalSeries (p k : ℕ) (a : ℕ → ℂ) (Sp : ℕ → ℕ → ℕ → ℂ) (s : ℂ) : ℂ :=
  1 + ∑' d : ℕ, if 0<d then ∑ aa∈Finset.range (d+1),
    (p : ℂ)^(d-aa)*(Sp aa aa d-(if aa=0 then 0 else Sp aa (aa-1) d))*
      (p : ℂ)^(-((aa+d : ℕ) : ℂ)*s-((d-aa : ℕ) : ℂ)*k/2)*a (d-aa) else 0
-- a(j) denotes the original newform coefficient at p^j.
-- OMITTED HYPOTHESES: Sp(a,b,d) is the actual primitive exponential sum
-- for [[p^a,p^b],[0,p^d]], D is fundamental and chi=χ_D(p); p is away from 2mN.
-- The first exponent is fixed in the beta-difference; only b changes.
theorem unramified_euler_factors (p k : ℕ) (hp : p.Prime)
    (sig sig' : ℂ) (hprod : sig*sig'=(p : ℂ)^(k-1)) (chi : ℤ)
    (a : ℕ → ℂ) (ha0 : a 0=1) (ha1 : a 1=sig+sig')
    (harec : ∀ j, a (j+2)=(sig+sig')*a (j+1)-(p : ℂ)^(k-1)*a j)
    (Sp : ℕ → ℕ → ℕ → ℂ) :
    ∃ S : ℝ, ∀ s : ℂ, S<s.re →
      unramifiedLocalSeries p k a Sp s=
        ((1-sig^2*(p : ℂ)^(4-k-2*s))*(1-sig'^2*(p : ℂ)^(4-k-2*s))*(1-(p : ℂ)^(3-2*s)))/
        ((1-chi*sig*(p : ℂ)^(2-(k : ℂ)/2-s))*(1-chi*sig'*(p : ℂ)^(2-(k : ℂ)/2-s))) := by sorry


-- MetaplecticAutomorphicForms:MP.8/squarefactor-polynomial-bound


-- OMITTED HYPOTHESES: b is the finite Dirichlet polynomial produced by (7.35)
-- from the fixed normalized newform's local factors and its coefficient bound.
theorem squarefactor_polynomial_bound (b : ℂ → ℕ → ℂ) (eps : ℝ) (he : 0<eps) :
    ∃ C : ℝ, 0≤C ∧ ∀ s : ℝ, 2≤s → ∀ D1 : ℕ, 0<D1 →
      ‖b (s : ℂ) D1‖≤C*Real.rpow D1 (1/2+eps) := by sorry


-- MetaplecticAutomorphicForms:MP.8/theta-normal-convergence


-- The uniform Gaussian majorant is a native summable family, before derivative refinements.
theorem theta_normal_convergence (a : ℕ) (ha : 0<a) (nu : IVec)
    (S : Set (SiegelSpace × CVec)) (hS : IsCompact S) :
    ∃ B : IVec → ℝ, Summable B ∧ ∀ p∈S, ∀ R : IVec,
      (∀ i, Int.ModEq (2*(a : ℤ)) (R i) (nu i)) →
        ‖expTwoPi (quad p.1.val (ivCast R)/(4*a) + ivCast R ⬝ᵥ p.2)‖≤B R := by sorry


-- MetaplecticAutomorphicForms:MP.8/genuine-induced-comparison


def genuineThetaLift (E : M4 ℝ → ℂ) (g : similitudeCover) : ℂ := g.root siegelSpace_base*E g.base.val.1
-- Native central-character part of the comparison. OMITTED INTERFACE: the normalized
-- adelic induced space Ind(π̃_f |det|^(s−2)), its section covariance and measures.
theorem genuine_induced_comparison (E : M4 ℝ → ℂ) (g z : similitudeCover)
    (hz : z.base=1) (hr : ∀ q, z.root q=-1) :
    genuineThetaLift E (g*z)=-genuineThetaLift E g := by sorry


-- MetaplecticAutomorphicForms:MP.8/genuine-eisenstein-initial-convergence


-- The scalar coordinate conclusion is native. OMITTED CONDITIONS: I is the BFH
-- inducing section, the finite cover/arithmetic comparison and its AS.1 majorants.
theorem genuine_eisenstein_initial_convergence (N m : ℕ) (I : M4 ℝ → ℂ) :
    ∃ S : ℝ, ∀ s : ℂ, S<s.re → ∀ g : positiveSimilitudes, ∀ W : CVec,
      Summable (fun t : BFHCosets N × IVec =>
        jacobiSummand N m I s (cosetMatrix N t.1) t.2 g.val.1 W) := by sorry


-- MetaplecticAutomorphicForms:MP.8/genuine-intertwining-operators


def coverUnipotent (x : Fin 3 → ℝ) : similitudeCover := by sorry
def coverFourier : similitudeCover := by sorry
-- Archimedean integral signature. The adelic restricted product and inducing-space
-- covariance are omitted until MP.4 and AS.2 supply the exact native interfaces.
def genuineIntertwiner (_s : ℂ) (F : similitudeCover → ℂ) (g : similitudeCover) : ℂ :=
  ∫ x : Fin 3 → ℝ, F (coverFourier⁻¹*coverUnipotent x*g)
def normalizedGenuineIntertwiner (s : ℂ) (F : similitudeCover → ℂ) : similitudeCover → ℂ := by sorry
lemma genuineIntertwiner_equivariant (s : ℂ) (F : similitudeCover → ℂ) (g h : similitudeCover) :
    genuineIntertwiner s (fun q => F (q*h)) g=genuineIntertwiner s F (g*h) := by sorry
lemma genuineIntertwiner_integral (s : ℂ) (F : similitudeCover → ℂ) (g : similitudeCover) :
    genuineIntertwiner s F g=∫ x : Fin 3 → ℝ, F (coverFourier⁻¹*coverUnipotent x*g) := by sorry
-- OMITTED HYPOTHESES: F is in the normalized genuine induced space and s avoids
-- the operator pole divisors; the normalization and π_f∨ identification are not yet typed.
lemma genuineIntertwiner_composition (s : ℂ) (F : similitudeCover → ℂ) :
    normalizedGenuineIntertwiner (4-s) (normalizedGenuineIntertwiner s F)=F := by sorry
-- Test: genuineIntertwiner_zero
example (s : ℂ) : genuineIntertwiner s (fun _ => 0)=0 := by sorry
-- Test: genuineIntertwiner_central_sign
example (s : ℂ) (F : similitudeCover → ℂ) (z : similitudeCover) (hz : ∀ g, F (g*z)=-F g) :
    ∀ g, genuineIntertwiner s F (g*z)=-genuineIntertwiner s F g := by sorry
-- Test: genuineIntertwiner_reflection
example (s : ℂ) : 4-(4-s)=s := by sorry


-- MetaplecticAutomorphicForms:MP.8/genuine-constant-term


-- Euclidean archimedean integral coordinate. The adelic quotient and induced-space
-- covariance hypotheses are omitted until MP.4 and AS.1/2 provide native interfaces.
def genuineConstantTerm (E : similitudeCover → ℂ) (g : similitudeCover) : ℂ :=
  ∫ x in Set.pi Set.univ (fun _ : Fin 3 => Set.Icc (0 : ℝ) 1), E (coverUnipotent x*g)
-- OMITTED CONDITIONS: E is the genuine BFH Eisenstein sum of F, including rational
-- unipotent periodicity, cuspidal inducing data and the common convergence chamber.
theorem genuine_constant_term (s : ℂ) (F E : similitudeCover → ℂ) (g : similitudeCover) :
    genuineConstantTerm E g=F g+genuineIntertwiner s F g := by sorry


-- MetaplecticAutomorphicForms:MP.8/genuine-eisenstein-continuation


-- OMITTED CONDITIONS: E is the actual BFH sum with its induced covariance and
-- arithmetic data; the contragredient identification and operator topology are untyped.
theorem genuine_eisenstein_continuation
    (E : ℂ → (similitudeCover → ℂ) → similitudeCover → ℂ) :
    ∃ Ec : ℂ → (similitudeCover → ℂ) → similitudeCover → ℂ,
      (∀ F g, MeromorphicOn (fun s => Ec s F g) Set.univ) ∧
      (∃ S : ℝ, ∀ s F g, S<s.re → Ec s F g=E s F g) ∧
      ∀ s F g, Ec s F g=Ec (4-s) (normalizedGenuineIntertwiner s F) g := by sorry


-- MetaplecticAutomorphicForms:MP.8/opposite-cusp-zero-regularity


-- OMITTED HYPOTHESES: aCusp is the actual Fricke/cusp expansion of the normalized
-- weight-k newform at conductor M, with 8M|N, 4m|N² and N|m.
theorem opposite_cusp_zero_regularity (N k : ℕ) (m r : ℤ) (aCusp : M2 ℤ → ℕ → ℂ) :
    ∃ P : ℂ → ℂ, ∃ U : Set ℂ, IsOpen U ∧ (2 : ℂ)∈U ∧ DifferentiableOn ℂ P U ∧
      ∃ S : ℝ, ∀ s, S<s.re → P s=bfhPDirichletSeries N k m 0 r 1 aCusp s := by sorry


-- MetaplecticAutomorphicForms:MP.8/fourier-residue-interchanges


-- The meromorphic residue statement is applied to local denominator-cleared families.
-- This prototype records the holomorphic integral consequence; the residue topology
-- and infinite-sum extensions are omitted pending AS.2/MP.4 interfaces.
theorem fourier_residue_interchanges (f : ℂ → (Fin 3 → ℝ) → ℂ) (U : Set ℂ) (hU : IsOpen U)
    (hf : ∀ x, DifferentiableOn ℂ (fun s => f s x) U)
    (hm : ∀ s, AEStronglyMeasurable (f s))
    (hdom : ∀ s∈U, ∃ Vv : Set ℂ, IsOpen Vv ∧ s∈Vv ∧ Vv⊆U ∧
      ∃ B : (Fin 3 → ℝ) → ℝ, Integrable B ∧ ∀ t∈Vv, ∀ x, ‖f t x‖≤B x) :
    DifferentiableOn ℂ (fun s => ∫ x, f s x) U := by sorry


-- MetaplecticAutomorphicForms:MP.8/two-variable-twist-series


-- L is the computational coefficient argument; the BFH comparison fixes it to the
-- actual first-cusp Dirichlet series and imports its newform hypotheses.
def twoVariableTwistSeries (eps : ℤ) (N : ℕ) (m r : ℤ) (L : ℂ → ℤ → ℂ) (u s : ℂ) : ℂ :=
  ∑' D : ℤ, if 0<eps*D ∧ Int.ModEq (4*m/N) D (r^2) then
    L s D*(D.natAbs : ℂ)^(s-u-5/2) else 0
lemma twoVariableTwistSeries_scalar (eps : ℤ) (N : ℕ) (m r : ℤ) (L : ℂ → ℤ → ℂ) (u s c : ℂ) :
    twoVariableTwistSeries eps N m r (c • L) u s=c*twoVariableTwistSeries eps N m r L u s := by sorry
lemma twoVariableTwistSeries_congruence (eps : ℤ) (N : ℕ) (m r : ℤ) (L : ℂ → ℤ → ℂ) (u s : ℂ) :
    twoVariableTwistSeries eps N m r L u s=
      ∑' D : ℤ, if 0<eps*D ∧ Int.ModEq (4*m/N) D (r^2) then L s D*(D.natAbs : ℂ)^(s-u-5/2) else 0 := by sorry
lemma twoVariableTwistSeries_sign (D : ℤ) : ¬(0<D ∧ 0< -D) ∧ ¬0<(1 : ℤ)*0 := by sorry
-- Test: twoVariableTwistSeries_zero
example (eps : ℤ) (N : ℕ) (m r : ℤ) (u s : ℂ) : twoVariableTwistSeries eps N m r (fun _ _ => 0) u s=0 := by sorry
-- Test: twoVariableTwistSeries_modulus
example (u s : ℂ) : twoVariableTwistSeries 1 8 16 1 (fun _ D => if D=1 then 1 else 0) u s=1 := by sorry
-- Test: twoVariableTwistSeries_excluded
example : ¬Int.ModEq 8 (2 : ℤ) (1^2) ∧ ¬Int.ModEq 8 (-1 : ℤ) (1^2) ∧ ¬Int.ModEq 8 (0 : ℤ) (1^2) := by sorry


-- MetaplecticAutomorphicForms:MP.8/two-variable-polar-combination


def bfhPolarTerm (N k : ℕ) (_r : ℤ) (L0 P0 : ℂ → ℂ)
    (M Mt tau : ℂ → ℝ → ℂ) (y2 : ℝ) (u s : ℂ) : ℂ :=
  -(N : ℂ)^(-s+4+(k : ℂ)/2)*L0 s*M s ((N : ℝ)⁻¹*y2)/(u-s+5/2) +
  (N : ℂ)^(7-s-(k : ℂ)/2)*P0 s*(y2 : ℂ)^(2*s-5)*Mt s ((N : ℝ)⁻¹*y2)/(u+s-5/2) +
  (N : ℂ)^(-s)*(y2 : ℂ)^(3-s+(k : ℂ)/2)*tau s ((N : ℝ)⁻¹*y2)/(u-s+3/2)
-- OMITTED CONDITIONS: L,L0,P0 are the actual continued newform BFH coefficients;
-- F±,M,Mt,tau use a single fixed BFH finite K-type and the proven tail estimates.
theorem two_variable_polar_combination (N m k : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N∣m)
    (r : ℤ) (L : ℂ → ℤ → ℂ) (L0 P0 : ℂ → ℂ)
    (Fp Fm : ℂ → ℂ → ℝ → ℂ) (M Mt tau : ℂ → ℝ → ℂ) (y2 : ℝ) (h2 : 0<y2) :
    ∃ A : (ℂ × ℂ) → ℂ,
      (∃ S U : ℝ, ∀ u s : ℂ, S<s.re → U<u.re →
        A (u,s)=(4*(m : ℂ))^(-s+u+5/2)*(N : ℂ)^(-s+4+(k : ℂ)/2)*
          (twoVariableTwistSeries 1 N m r L u s*Fp u s ((N : ℝ)⁻¹*y2)+
           twoVariableTwistSeries (-1) N m r L u s*Fm u s ((N : ℝ)⁻¹*y2))) ∧
      (∀ p : ℂ × ℂ, 3/2<p.2.re → 0<p.1.re → p.2.re-5/2<p.1.re →
        ∃ Vv : Set (ℂ × ℂ), IsOpen Vv ∧ p∈Vv ∧
          ∃ d H : (ℂ × ℂ) → ℂ, DifferentiableOn ℂ d Vv ∧ DifferentiableOn ℂ H Vv ∧
            (∀ U : Set (ℂ × ℂ), IsOpen U → U⊆Vv → U.Nonempty → ∃ q∈U, d q≠0) ∧
            ∀ q∈Vv, d q≠0 → A q=H q/d q) ∧
      ∃ Vv : Set (ℂ × ℂ), IsOpen Vv ∧ ((1/2 : ℂ),(2 : ℂ))∈Vv ∧
        DifferentiableOn ℂ (fun p => A p-bfhPolarTerm N k r L0 P0 M Mt tau y2 p.1 p.2) Vv := by sorry


-- MetaplecticAutomorphicForms:MP.8/bsd2-export


-- Native numerical normalization check in the actual determinant-root convention.
-- OMITTED INTERFACES: the continued upstream newform/twist and symmetric-square
-- L-functions, denominator nonvanishing, and the consumer's residue/noncancellation APIs.
theorem bsd2_export (s : ℂ) : (s-1/2)-3/2=s-2 ∧ -(s-2)+2=4-s := by sorry

end
end TauCeti.Jacobi.GenusTwo
