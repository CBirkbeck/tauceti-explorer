/-
This file is not the roadmap and is not exhaustive. README.md is definitive.
These statements suggest Lean forms so contributors and reviewers can converge
on names and signatures. Proof placeholders are not implementations.

The full geometric, smoothness, growth, measure and analytic assumptions in the
README remain required. Comments below identify signatures whose actual
supplier carriers cannot yet be expressed. Such signatures are omitted rather
than asserted for arbitrary independently chosen representations or functions.

Pinned baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
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
import Mathlib.Analysis.InnerProductSpace.Adjoint
import Mathlib.MeasureTheory.Group.Measure
import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.LinearAlgebra.QuadraticForm.Basis
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Data.Int.ModEq
import Mathlib.LinearAlgebra.SymplecticGroup
import Mathlib.LinearAlgebra.UnitaryGroup
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.NumberTheory.ModularForms.JacobiTheta.TwoVariable
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Analysis.Complex.SqrtDeriv
import Mathlib.Analysis.Meromorphic.Basic
import Mathlib.Analysis.Matrix.Normed
import Mathlib.Topology.ContinuousMap.Basic
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.LinearAlgebra.FreeModule.PID

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

-- Test: TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_zero. Native zero form gives the untwisted addition law.
example (p q : (bilinearFactorSet (0 : BilinForm ℤ ℤ)).Extension) :
    (p*q).left.toAdd = p.left.toAdd + q.left.toAdd := by sorry

-- Test: TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_cross. This triangular matrix gives B(e₀,e₁)=1.
example : (bilinearFactorSet (Matrix.toBilin' (!![0,1;0,0] : Matrix (Fin 2) (Fin 2) ℤ))
    (ofAdd ![1,0],ofAdd ![0,1])).toAdd = 1 := by sorry

-- Test: TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_reversed. The reverse product has a different cocycle.
example : (bilinearFactorSet (Matrix.toBilin' (!![0,1;0,0] : Matrix (Fin 2) (Fin 2) ℤ))
    (ofAdd ![0,1],ofAdd ![1,0])).toAdd = 0 := by sorry

-- Test: TauCeti.Metaplectic.Heisenberg.extensionIsometry_identity. Test at an actual integer vector.
example : extensionIsometry (LinearMap.BilinForm.IsometryEquiv.refl (0 : BilinForm ℤ ℤ))
    ⟨ofAdd 3,ofAdd 4⟩ = ⟨ofAdd 3,ofAdd 4⟩ := by sorry

-- Test: TauCeti.Metaplectic.Heisenberg.extensionIsometry_negation. Negation preserves any bilinear form.
example (B : BilinForm ℤ ℤ) :
    let e : B.IsometryEquiv B :=
      { LinearEquiv.neg ℤ with map_app' := by intros; simp }
    extensionIsometry e ⟨ofAdd 3,ofAdd 4⟩ = ⟨ofAdd 3,ofAdd (-4)⟩ := by sorry

-- Test: TauCeti.Metaplectic.Heisenberg.extensionIsometry_inverse. Different spaces use the existing inverse isometry.
example {B : BilinForm R W} {D : BilinForm R W'}
    (e : B.IsometryEquiv D) (p : (bilinearFactorSet B).Extension) :
    extensionIsometry e.symm (extensionIsometry e p) = p := by sorry

-- Test: TauCeti.Metaplectic.Heisenberg.extensionIsometryAction_identity. The native group identity fixes concrete data.
example : extensionIsometryAction (0 : BilinForm ℤ ℤ) 1
    ⟨ofAdd 3,ofAdd 4⟩ = ⟨ofAdd 3,ofAdd 4⟩ := by sorry

-- Test: TauCeti.Metaplectic.Heisenberg.extensionIsometryAction_negation. A nontrivial linear action fixes the center.
example :
    let e : TauCeti.BilinForm.isometryGroup (0 : BilinForm ℤ ℤ) :=
      ⟨LinearEquiv.neg ℤ, by intro x y; simp⟩
    extensionIsometryAction (0 : BilinForm ℤ ℤ) e
      ⟨ofAdd 3,ofAdd 4⟩ = ⟨ofAdd 3,ofAdd (-4)⟩ := by sorry

-- Test: TauCeti.Metaplectic.Heisenberg.extensionIsometryAction_center. Every isometry fixes the embedded scalar group.
example (B : BilinForm R W) (e : TauCeti.BilinForm.isometryGroup B) (t : R) :
    extensionIsometryAction B e ((bilinearFactorSet B).inl (ofAdd t)) =
      (bilinearFactorSet B).inl (ofAdd t) := by sorry

-- Test: TauCeti.Metaplectic.Heisenberg.polarizationEquiv_zero. The zero cocycle has no quadratic correction.
example [Invertible (2 : ℚ)] :
    polarizationEquiv (0 : BilinForm ℚ ℚ) ⟨ofAdd 3,ofAdd 4⟩ =
      ⟨ofAdd 3,ofAdd 4⟩ := by sorry

-- Test: TauCeti.Metaplectic.Heisenberg.polarizationEquiv_cross. q(2,3)=3 for B((x,y),(x′,y′))=xy′.
example [Invertible (2 : ℚ)] :
    polarizationEquiv (Matrix.toBilin' (!![0,1;0,0] : Matrix (Fin 2) (Fin 2) ℚ))
      ⟨ofAdd 0,ofAdd ![2,3]⟩ = ⟨ofAdd 3,ofAdd ![2,3]⟩ := by sorry

-- Test: TauCeti.Metaplectic.Heisenberg.polarizationEquiv_sign. The inverse correction has the opposite sign.
example [Invertible (2 : ℚ)] :
    (polarizationEquiv (Matrix.toBilin' (!![0,1;0,0] : Matrix (Fin 2) (Fin 2) ℚ))).symm
      ⟨ofAdd 0,ofAdd ![2,3]⟩ = ⟨ofAdd (-3),ofAdd ![2,3]⟩ := by sorry

-- Test: TauCeti.Metaplectic.Heisenberg.centralCharacter_value. The zero form permits the identity scalar character.
example : centralCharacter (0 : BilinForm ℤ ℤ) (MonoidHom.id _) (by intros; rfl)
    ⟨ofAdd 3,ofAdd 4⟩ = ofAdd 3 := by sorry

-- Test: TauCeti.Metaplectic.Heisenberg.centralCharacter_trivial. A trivial character works for every bilinear cocycle.
example (B : LinearMap.BilinMap R W C) :
    centralCharacter B (1 : Multiplicative C →* Multiplicative ℤ) (by intros; rfl) = 1 := by sorry

-- Test: TauCeti.Metaplectic.Heisenberg.centralCharacter_zero. The identity character on the zero form is 1 at identity.
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
The native extension receives the product topology. Joint continuity of the isometry evaluation is an explicit hypothesis, rather than a consequence of algebraic isometries. Native closed-embedding and open-projection tests concern this product topology. Their finite-dimensional local-field specialization still requires the requested topological suppliers.
-/
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
Emitted: left-translation invariance of the product of two additive invariant measures, with Borel, second-countable, SFinite and continuous-bilinear hypotheses. Missing: right translation, transported native-extension Haar instance, finite-dimensional determinant/self-dual normalization and symplectic invariance. Dirac mass at zero is no longer admitted as arbitrary Haar data.
-/
theorem heisenberg_haar (B : LinearMap.BilinForm F V)
    [TopologicalSpace F] [TopologicalSpace V] [IsTopologicalAddGroup F]
    [IsTopologicalAddGroup V] [MeasurableSpace F] [MeasurableSpace V]
    [BorelSpace F] [BorelSpace V] [SecondCountableTopology F] [SecondCountableTopology V]
    (μ : Measure F) (ν : Measure V) [SFinite μ] [SFinite ν]
    [μ.IsAddLeftInvariant] [ν.IsAddLeftInvariant]
    (hB : Continuous (fun q : V × V => B q.1 q.2)) (p : F × V) :
    Measure.map (fun q : F × V => (p.1+q.1+B p.2 q.2, p.2+q.2)) (μ.prod ν) =
      μ.prod ν := by sorry
def schroedingerFormula (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F)
    (t : F) (x : V) (y : W) (φ : V → ℂ) (u : V) : ℂ :=
  (ψ (Multiplicative.ofAdd (t+B u y+(2:F)⁻¹*B x y)) : ℂ)*φ(u+x)
/- MetaplecticAutomorphicForms:MP.0/schroedinger-model
Emitted: the actual phase/translation operator on functions, its group law with 2≠0, and equality of squared-norm integrals for a unitary character and an additive invariant measure. Missing: preservation of the finite-dimensional local Schwartz–Bruhat carrier, L² descent outside the real-line specialization, and the smooth representation instance. No unitarity assertion is made for an arbitrary ContRepresentation.
-/
def schroedinger (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (t : F) (x : V) (y : W) : (V → ℂ) →ₗ[ℂ] (V → ℂ) := by sorry
lemma schroedinger_apply (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (t : F) (x : V) (y : W) (φ : V → ℂ) (u : V) : schroedinger ψ B t x y φ u = schroedingerFormula ψ B t x y φ u := by sorry
lemma schroedinger_center (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (t : F) (φ : V → ℂ) : schroedinger ψ B t 0 0 φ = (ψ (Multiplicative.ofAdd t) : ℂ) • φ := by sorry
lemma schroedinger_mul (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (t s : F) (x a : V) (y b : W) (h2 : (2:F) ≠ 0) : (schroedinger ψ B t x y).comp (schroedinger ψ B s a b) = schroedinger ψ B (t+s+(2:F)⁻¹*(B x b-B a y)) (x+a) (y+b) := by sorry
lemma schroedinger_isUnitary (ψ : Multiplicative F →* ℂˣ)
    (B : V →ₗ[F] W →ₗ[F] F) [TopologicalSpace V] [IsTopologicalAddGroup V]
    [MeasurableSpace V] [BorelSpace V] (μ : Measure V) [μ.IsAddLeftInvariant]
    (hψ : ∀ s, ‖(ψ (Multiplicative.ofAdd s) : ℂ)‖ = 1)
    (t : F) (x : V) (y : W) (φ : V → ℂ) :
    (∫ u, ‖schroedinger ψ B t x y φ u‖^2 ∂μ) = ∫ u, ‖φ u‖^2 ∂μ := by sorry
-- Test: TauCeti.Metaplectic.schroedinger_zero
example (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (t : F) (φ : V → ℂ) : schroedinger ψ B t 0 0 φ = (ψ (Multiplicative.ofAdd t) : ℂ) • φ := by sorry
-- Test: TauCeti.Metaplectic.schroedinger_translation
example (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (x u : V) (φ : V → ℂ) : schroedinger ψ B 0 x 0 φ u = φ(u+x) := by sorry
-- Test: TauCeti.Metaplectic.schroedinger_modulation
example (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (y : W) (u : V) (φ : V → ℂ) : schroedinger ψ B 0 0 y φ u = (ψ (Multiplicative.ofAdd (B u y)) : ℂ)*φ u := by sorry
-- Test: TauCeti.Metaplectic.schroedinger_commutator
example (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (x : V) (y : W) (h2 : (2:F) ≠ 0) : (schroedinger ψ B 0 x 0).comp (schroedinger ψ B 0 0 y) = (ψ (Multiplicative.ofAdd (B x y)) : ℂ) • ((schroedinger ψ B 0 0 y).comp (schroedinger ψ B 0 x 0)) := by sorry
/- MetaplecticAutomorphicForms:MP.0/induced-schroedinger
Emitted: evaluation at the section, explicit central covariance, and the coordinate translation computed from the same Schrödinger formula. The inverse is no longer paired with an independently chosen translation. Missing: local smoothness and compact support modulo the polarization subgroup, and identification with SR.2 compact induction. The rational half-argument test is an obstruction fragment; it is not a Q₂ conductor theorem.
-/
def inducedSchroedingerEquiv (ψ : Multiplicative F →* ℂˣ) : {f : F × V → ℂ // ∀ t u, f (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*f (0,u)} ≃ (V → ℂ) := by sorry
lemma inducedSchroedingerEquiv_apply (ψ : Multiplicative F →* ℂˣ) (f : {f : F × V → ℂ // ∀ t u, f (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*f (0,u)}) (u : V) : inducedSchroedingerEquiv ψ f u = f.val (0,u) := by sorry
lemma inducedSchroedingerEquiv_covariance (ψ : Multiplicative F →* ℂˣ) (φ : V → ℂ) (t : F) (u : V) : (inducedSchroedingerEquiv ψ).symm φ |>.val (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*φ u := by sorry
def inducedSchroedingerTranslation (ψ : Multiplicative F →* ℂˣ)
    (B : V →ₗ[F] W →ₗ[F] F) (t : F) (x : V) (y : W)
    (f : {f : F × V → ℂ // ∀ s u, f (s,u) = (ψ (Multiplicative.ofAdd s) : ℂ)*f (0,u)}) :
    {f : F × V → ℂ // ∀ s u, f (s,u) = (ψ (Multiplicative.ofAdd s) : ℂ)*f (0,u)} :=
  ⟨fun q => f.val (q.1+t+B q.2 y+(2:F)⁻¹*B x y, q.2+x), by sorry⟩
lemma inducedSchroedingerEquiv_intertwines (ψ : Multiplicative F →* ℂˣ)
    (B : V →ₗ[F] W →ₗ[F] F) (t : F) (x : V) (y : W)
    (f : {f : F × V → ℂ // ∀ s u, f (s,u) = (ψ (Multiplicative.ofAdd s) : ℂ)*f (0,u)}) :
    inducedSchroedingerEquiv ψ (inducedSchroedingerTranslation ψ B t x y f) =
      schroedinger ψ B t x y (inducedSchroedingerEquiv ψ f) := by sorry
-- Test: TauCeti.Metaplectic.inducedSchroedingerEquiv_zero
example (ψ : Multiplicative F →* ℂˣ) (φ : V → ℂ) : (inducedSchroedingerEquiv ψ).symm φ |>.val (0,0) = φ 0 := by sorry
-- Test: TauCeti.Metaplectic.inducedSchroedingerEquiv_indicator
example (ψ : Multiplicative F →* ℂˣ) (L : Set V) [DecidablePred (· ∈ L)] : inducedSchroedingerEquiv ψ ((inducedSchroedingerEquiv ψ).symm (L.indicator (fun _ => 1))) = L.indicator (fun _ => 1) := by sorry
-- Test: TauCeti.Metaplectic.inducedSchroedingerEquiv_dyadic
example (ψ : Multiplicative ℚ →* ℂˣ) (h : ψ (Multiplicative.ofAdd (1/2)) = -1) : ψ (Multiplicative.ofAdd (1/2)) ≠ 1 := by sorry

end Algebra
section RealHilbert
open scoped ContDiff
variable (ψ : Multiplicative ℝ →* ℂˣ)
    (hψ : Continuous (fun s : ℝ => (ψ (Multiplicative.ofAdd s) : ℂ)))
    (hunit : ∀ s : ℝ, ‖(ψ (Multiplicative.ofAdd s) : ℂ)‖ = 1)
/- MetaplecticAutomorphicForms:MP.0/hilbert-schroedinger
Emitted: the real-line Lebesgue L² linear isometry with ψ-dependent a.e. phase/translation formula, norm preservation, native SchwartzMap.toLp comparison and continuity of every orbit. The central, Gaussian translation and a.e.-representative tests concern this specialization. Missing: general finite-dimensional real/complex and nonarchimedean local-field models and the zero-dimensional carrier identification.
-/
def hilbertSchroedinger (ψ : Multiplicative ℝ →* ℂˣ)
    (hψ : Continuous (fun s : ℝ => (ψ (Multiplicative.ofAdd s) : ℂ)))
    (hunit : ∀ s : ℝ, ‖(ψ (Multiplicative.ofAdd s) : ℂ)‖ = 1) (t x y : ℝ) :
    Lp ℂ 2 (volume : Measure ℝ) ≃ₗᵢ[ℂ] Lp ℂ 2 (volume : Measure ℝ) := by sorry
lemma hilbertSchroedinger_aeFormula (t x y : ℝ) (v : Lp ℂ 2 (volume : Measure ℝ)) :
    ⇑(hilbertSchroedinger ψ hψ hunit t x y v) =ᵐ[volume]
      (fun u => (ψ (Multiplicative.ofAdd (t+u*y+x*y/2)) : ℂ)*v (u+x)) := by sorry
lemma hilbertSchroedinger_norm (t x y : ℝ) (v : Lp ℂ 2 (volume : Measure ℝ)) :
    ‖hilbertSchroedinger ψ hψ hunit t x y v‖ = ‖v‖ := by sorry
def hilbertSchroedinger_realSchwartz (ψ : Multiplicative ℝ →* ℂˣ)
    (hψ : Continuous (fun s : ℝ => (ψ (Multiplicative.ofAdd s) : ℂ)))
    (hunit : ∀ s : ℝ, ‖(ψ (Multiplicative.ofAdd s) : ℂ)‖ = 1) (t x y : ℝ) :
    SchwartzMap ℝ ℂ →ₗ[ℂ] SchwartzMap ℝ ℂ := by sorry
lemma hilbertSchroedinger_realSchwartz_apply (t x y u : ℝ) (φ : SchwartzMap ℝ ℂ) :
    hilbertSchroedinger_realSchwartz ψ hψ hunit t x y φ u =
      (ψ (Multiplicative.ofAdd (t+u*y+x*y/2)) : ℂ)*φ (u+x) := by sorry
lemma hilbertSchroedinger_schwartz (t x y : ℝ) (φ : SchwartzMap ℝ ℂ) :
    (hilbertSchroedinger_realSchwartz ψ hψ hunit t x y φ).toLp 2 volume =
      hilbertSchroedinger ψ hψ hunit t x y (φ.toLp 2 volume) := by sorry
lemma hilbertSchroedinger_stronglyContinuous (v : Lp ℂ 2 (volume : Measure ℝ)) :
    Continuous (fun p : ℝ × ℝ × ℝ =>
      hilbertSchroedinger ψ hψ hunit p.1 p.2.1 p.2.2 v) := by sorry
-- Test: TauCeti.Metaplectic.hilbertSchroedinger_zero
example (t : ℝ) (v : Lp ℂ 2 (volume : Measure ℝ)) :
    hilbertSchroedinger ψ hψ hunit t 0 0 v = (ψ (Multiplicative.ofAdd t) : ℂ) • v := by sorry
-- Test: TauCeti.Metaplectic.hilbertSchroedinger_gaussian
example (x : ℝ) : (∫ u : ℝ, ‖Complex.exp (-Real.pi * ((u+x)^2 : ℝ))‖^2) =
    ∫ u : ℝ, ‖Complex.exp (-Real.pi * (u^2 : ℝ))‖^2 := by sorry
-- Test: TauCeti.Metaplectic.hilbertSchroedinger_ae
example (t x y : ℝ) (f g : ℝ → ℂ) (hf : MemLp f 2 volume) (hg : MemLp g 2 volume)
    (hfg : f =ᵐ[volume] g) :
    hilbertSchroedinger ψ hψ hunit t x y (hf.toLp f) =
      hilbertSchroedinger ψ hψ hunit t x y (hg.toLp g) := by sorry
/- MetaplecticAutomorphicForms:MP.0/smooth-vectors
Emitted only for the real-line oscillator just constructed: smoothness of the full three-coordinate orbit is equivalent to being in the image of native SchwartzMap.toLp. ψ is required nontrivial. The trivial character would leave only translations and would not imply Schwartz decay. Missing: finite-dimensional local-field smooth/Fréchet category comparisons and the nonarchimedean instance.
-/
theorem oscillator_smoothVectors (hne : ∃ s, ψ (Multiplicative.ofAdd s) ≠ 1)
    (v : Lp ℂ 2 (volume : Measure ℝ)) :
    (∃ φ : SchwartzMap ℝ ℂ, φ.toLp 2 volume = v) ↔
      ContDiff ℝ ∞ (fun p : ℝ × ℝ × ℝ =>
        hilbertSchroedinger ψ hψ hunit p.1 p.2.1 p.2.2 v) := by sorry
end RealHilbert
section LocalTheta
variable {F V W G H : Type*} [Field F] [AddCommGroup V] [Module F V]
 [AddCommGroup W] [Module F W] [Group G] [Group H]

/- MetaplecticAutomorphicForms:MP.3/orthogonal-symplectic-dual-pair
Emitted: native tensor bilinear form, commuting isometry actions and scalar kernel with both tensor factors nonzero. The zero-factor test deliberately allows a larger kernel. Missing: identification of nondegenerate symmetric/alternating forms with the source classical dual pair and its pulled-back cover.
-/
def orthogonalSymplecticEmbedding (b : LinearMap.BilinForm F V) (ω : LinearMap.BilinForm F W) : (TauCeti.BilinForm.isometryGroup b × TauCeti.BilinForm.isometryGroup ω) →* (V ⊗[F] W ≃ₗ[F] V ⊗[F] W) := by sorry
def tensorSymplecticForm (b : LinearMap.BilinForm F V) (ω : LinearMap.BilinForm F W) : LinearMap.BilinForm F (V ⊗[F] W) := by sorry
lemma dualPair_commute (b : LinearMap.BilinForm F V) (ω : LinearMap.BilinForm F W) (g : TauCeti.BilinForm.isometryGroup b) (h : TauCeti.BilinForm.isometryGroup ω) : orthogonalSymplecticEmbedding b ω (g,1) * orthogonalSymplecticEmbedding b ω (1,h) = orthogonalSymplecticEmbedding b ω (1,h) * orthogonalSymplecticEmbedding b ω (g,1) := by sorry
lemma dualPair_kernel [Nontrivial V] [Nontrivial W]
    (b : LinearMap.BilinForm F V) (ω : LinearMap.BilinForm F W)
    (g : TauCeti.BilinForm.isometryGroup b) (h : TauCeti.BilinForm.isometryGroup ω) :
    orthogonalSymplecticEmbedding b ω (g,h) = 1 ↔
      ∃ a : Fˣ, (∀ v, (g : V ≃ₗ[F] V) v = (a:F) • v) ∧
        ∀ w, (h : W ≃ₗ[F] W) w = (a⁻¹:Fˣ) • w := by sorry
-- Test: TauCeti.Metaplectic.dualPair_line
example (b : LinearMap.BilinForm F F) (ω : LinearMap.BilinForm F W) (h : TauCeti.BilinForm.isometryGroup ω) (w : W) : orthogonalSymplecticEmbedding b ω (1,h) (1 ⊗ₜ[F] w) = 1 ⊗ₜ[F] ((h : W ≃ₗ[F] W) w) := by sorry
-- Test: TauCeti.Metaplectic.dualPair_zero
example (b : LinearMap.BilinForm F V) (ω : LinearMap.BilinForm F W) [Subsingleton V] : ∀ g, orthogonalSymplecticEmbedding b ω g = 1 := by sorry
-- Test: TauCeti.Metaplectic.dualPair_minus
example (v : V) (w : W) : (-v) ⊗ₜ[F] (-w) = v ⊗ₜ[F] w := by sorry
/- MetaplecticAutomorphicForms:MP.2/leray-form
Emitted: the graph quadratic map ½ω(y,Ty), transport under isometry and coordinate sign/zero tests. Missing: the actual Lagrangian triple, isotropic R, R⊥/R and images (Lj∩R⊥+R)/R, its nondegenerate descent, and the comparison with the graph model. The generic quotient-coordinate test only detects why quotienting Lj∩R⊥ by R is ill-typed.
-/
def lerayForm (ω : LinearMap.BilinForm F V) (T : V →ₗ[F] V) : QuadraticMap F V F := by sorry
lemma lerayForm_graph (ω : LinearMap.BilinForm F V) (T : V →ₗ[F] V) (y : V) : lerayForm ω T y = (2:F)⁻¹ * ω y (T y) := by sorry
lemma lerayForm_isometry (ω ω' : LinearMap.BilinForm F V) (T T' : V →ₗ[F] V) (e : V ≃ₗ[F] V) (hω : ∀ x y, ω' x y = ω (e x) (e y)) (hT : ∀ y, e (T' y) = T (e y)) (y : V) : lerayForm ω' T' y = lerayForm ω T (e y) := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.lerayForm_reduction
-- Test: TauCeti.Metaplectic.lerayForm_repeated
example (ω : LinearMap.BilinForm F V) : lerayForm ω (0 : V →ₗ[F] V) = 0 := by sorry
-- Test: TauCeti.Metaplectic.lerayForm_rankOne
example (ω : LinearMap.BilinForm F F) (h : ∀ x y, ω x y = -x*y) (x : F) : lerayForm ω LinearMap.id x = -(2:F)⁻¹*x^2 := by sorry
-- Test: TauCeti.Metaplectic.lerayForm_quotient
example (L R : Submodule F V) : Submodule.map R.mkQ (L ⊓ R) = ⊥ := by sorry

end LocalTheta
section Hilbert
variable {G N H K : Type*} [Group G] [Group N]
 [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
 [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]

/- MetaplecticAutomorphicForms:MP.1/scalar-normalizer-extension
Emitted: the covariance subgroup of G×unitary(H→L[ℂ]H), its two homomorphism projections, and the one-dimensional scalar test with trivial G. Missing: the actual nonzero irreducible Heisenberg model, scalar-kernel Schur theorem, strong operator topology and local charts. The real nonsplitting target is for its normalized μ₂ restriction, not for arbitrary G or its circle extension.
-/
def scalarNormalizer (act : G →* MulAut N) (ρ : ContRepresentation ℂ N H) : Subgroup (G × ↥(unitary (H →L[ℂ] H))) := by sorry
def scalarNormalizer_projection (act : G →* MulAut N) (ρ : ContRepresentation ℂ N H) : scalarNormalizer act ρ →* G := by sorry
lemma scalarNormalizer_covariance (act : G →* MulAut N) (ρ : ContRepresentation ℂ N H) (p : scalarNormalizer act ρ) (n : N) (v : H) : p.val.2.val (ρ n v) = ρ (act p.val.1 n) (p.val.2.val v) := by sorry
def scalarNormalizer_oscillator (act : G →* MulAut N) (ρ : ContRepresentation ℂ N H) : scalarNormalizer act ρ →* ↥(unitary (H →L[ℂ] H)) := by sorry
-- Test: TauCeti.Metaplectic.scalarNormalizer_zero
example [Subsingleton G] (act : G →* MulAut N)
    (ρ : ContRepresentation ℂ N ℂ) (p : scalarNormalizer act ρ) :
    ∃! z : ℂ, ‖z‖ = 1 ∧ ∀ v, p.val.2.val v = z • v := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.scalarNormalizer_kernel
-- Omitted at the supplier boundary: TauCeti.Metaplectic.scalarNormalizer_nonsplitting
/- MetaplecticAutomorphicForms:MP.1/metaplectic-double-cover
Emitted: a native kernel subgroup of a supplied character lambda2, inclusion, character-compatible transport and three square-kernel computations on ℂˣ. These are algebraic kernel adapters, not complex splitting or real nonsplitting of Sp. Missing: construction of normalized lambda2 on the actual oscillator normalizer, μ₂ kernel over Sp, Rao-coordinate transport and topology. The source complex/real facts remain acceptance obligations.
-/
def metaplecticCover (S : Type*) [Group S] (lambda2 : S →* ℂˣ) : Subgroup S := by sorry
lemma metaplecticCover_kernel (S : Type*) [Group S] (lambda2 : S →* ℂˣ) (s : S) : s ∈ metaplecticCover S lambda2 ↔ lambda2 s = 1 := by sorry
def metaplecticCover_toNormalizer (S : Type*) [Group S] (lambda2 : S →* ℂˣ) : metaplecticCover S lambda2 →* S := by sorry
def metaplecticCover_coboundary (S : Type*) [Group S] (lambda2 μ₂ : S →* ℂˣ) (e : S ≃* S) (h : ∀ s, μ₂ (e s) = lambda2 s) : metaplecticCover S lambda2 ≃* metaplecticCover S μ₂ := by sorry
-- Test: TauCeti.Metaplectic.metaplecticCover_zero
example (z : ℂˣ) : z ∈ metaplecticCover ℂˣ (show ℂˣ →* ℂˣ from {toFun := fun z => z^2,map_one' := by sorry,map_mul' := by sorry}) ↔ z^2 = 1 := by sorry
-- Test: TauCeti.Metaplectic.metaplecticCover_complex
example (z : ℂˣ)
    (square : ℂˣ →* ℂˣ) (hsquare : ∀ w, square w = w^2) :
    z ∈ metaplecticCover ℂˣ square ↔ z ∈ rootsOfUnity 2 ℂ := by sorry
-- Test: TauCeti.Metaplectic.metaplecticCover_real
example (square : ℂˣ →* ℂˣ)
    (hsquare : ∀ w, square w = w^2) : (-1 : ℂˣ) ∈ metaplecticCover ℂˣ square := by sorry
/- MetaplecticAutomorphicForms:MP.1/genuine-oscillator
Emitted: restriction of the supplied unitary normalizer action to ker lambda2 and its identity test. Missing: identification of the distinguished central −1, its action on the actual nonzero oscillator, zero-dimensional sign carrier and model-change intertwiner. An arbitrary element z, particularly z=1, cannot be assigned action −id.
-/
def weilRepresentation (S : Type*) [Group S] (lambda2 : S →* ℂˣ) (ω : S →* ↥(unitary (H →L[ℂ] H))) : metaplecticCover S lambda2 →* ↥(unitary (H →L[ℂ] H)) := by sorry
lemma weilRepresentation_apply (S : Type*) [Group S] (lambda2 : S →* ℂˣ) (ω : S →* ↥(unitary (H →L[ℂ] H))) (g : metaplecticCover S lambda2) : weilRepresentation S lambda2 ω g = ω g.val := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.weilRepresentation_central
-- Omitted at the supplier boundary: TauCeti.Metaplectic.weilRepresentation_modelChange
-- Omitted at the supplier boundary: TauCeti.Metaplectic.weilRepresentation_zero
-- Omitted at the supplier boundary: TauCeti.Metaplectic.weilRepresentation_genuine
-- Test: TauCeti.Metaplectic.weilRepresentation_identity
example (S : Type*) [Group S] (lambda2 : S →* ℂˣ) (ω : S →* ↥(unitary (H →L[ℂ] H))) : weilRepresentation S lambda2 ω 1 = 1 := by sorry

end Hilbert
section ComplexTheta
variable {G H V W U : Type*} [Group G] [Group H]
 [AddCommGroup V] [Module ℂ V] [AddCommGroup W] [Module ℂ W] [AddCommGroup U] [Module ℂ U]

/- MetaplecticAutomorphicForms:MP.3/big-theta-module
Emitted: native algebraic tensor coinvariants and invariant-map universal property. H-equivariance now requires commuting G,H actions. Missing: SR.3 smooth dual and admissibility, the actual maximal π-isotypic quotient and smooth tensor–Hom adjunction. The algebraic universal map is recorded separately from the full source Hom identity.
-/
abbrev bigTheta (ρ : Representation ℂ G V) (πdual : Representation ℂ G W) : Type _ := Representation.Coinvariants (ρ.tprod πdual)
def bigTheta_hom (ρ : Representation ℂ G V) (πdual : Representation ℂ G W) : (bigTheta ρ πdual →ₗ[ℂ] U) ≃ {f : V ⊗[ℂ] W →ₗ[ℂ] U // ∀ g x, f ((ρ.tprod πdual) g x) = f x} := by sorry
lemma bigTheta_equivariant (ρ : Representation ℂ G V)
    (πdual : Representation ℂ G W) (σ : Representation ℂ H (V ⊗[ℂ] W))
    (hcomm : ∀ h g x, σ h ((ρ.tprod πdual) g x) = (ρ.tprod πdual) g (σ h x))
    (h : H) (g : G) (x : V ⊗[ℂ] W) :
    Representation.Coinvariants.mk (ρ.tprod πdual)
      (σ h ((ρ.tprod πdual) g x-x)) = 0 := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.bigTheta_isotypic
-- Test: TauCeti.Metaplectic.bigTheta_character_mismatch
example (ρ : Representation ℂ G V) (πdual : Representation ℂ G W) (g : G) (a : ℂ) (ha : a ≠ 1) (hact : ∀ x, (ρ.tprod πdual) g x = a • x) : Subsingleton (bigTheta ρ πdual) := by sorry
-- Test: TauCeti.Metaplectic.bigTheta_trivial_factor
example (ρ : Representation ℂ G V) (πdual : Representation ℂ G ℂ) [Subsingleton G] : bigTheta ρ πdual ≃ₗ[ℂ] V := by sorry
-- Test: TauCeti.Metaplectic.bigTheta_quotient
example (ρ : Representation ℂ G V) (πdual : Representation ℂ G W) (f : V ⊗[ℂ] W →ₗ[ℂ] U) (hf : ∀ g x, f ((ρ.tprod πdual) g x) = f x) : ∃! q : bigTheta ρ πdual →ₗ[ℂ] U, q.comp (Representation.Coinvariants.mk (ρ.tprod πdual)) = f := by sorry
/- MetaplecticAutomorphicForms:MP.3/small-theta-module
Emitted: quotient by a specified native submodule and its quotient-map universal property, including zero and simple-quotient fragments. Missing: construction of the actual maximal semisimple quotient in the finite-length smooth category and identification of its radical. No semisimplicity assertion survives for an arbitrary submodule.
-/
abbrev smallTheta (T : Type*) [AddCommGroup T] [Module ℂ T] (radical : Submodule ℂ T) : Type _ := T ⧸ radical
lemma smallTheta_projection (T : Type*) [AddCommGroup T] [Module ℂ T] (radical : Submodule ℂ T) : Function.Surjective radical.mkQ := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.smallTheta_semisimple
lemma smallTheta_factor (T : Type*) [AddCommGroup T] [Module ℂ T] (radical : Submodule ℂ T) (f : T →ₗ[ℂ] U) (hf : radical ≤ LinearMap.ker f) : ∃! g : (T ⧸ radical) →ₗ[ℂ] U, g.comp radical.mkQ = f := by sorry
-- Test: TauCeti.Metaplectic.smallTheta_zero
example (T : Type*) [AddCommGroup T] [Module ℂ T] [Subsingleton T] (radical : Submodule ℂ T) : Subsingleton (T ⧸ radical) := by sorry
-- Test: TauCeti.Metaplectic.smallTheta_simple
example (T : Type*) [AddCommGroup T] [Module ℂ T] : (T ⧸ (⊥ : Submodule ℂ T)) ≃ₗ[ℂ] T := by sorry
-- Test: TauCeti.Metaplectic.smallTheta_extension
example (T : Type*) [AddCommGroup T] [Module ℂ T] (radical : Submodule ℂ T) (g : T →ₗ[ℂ] U) (hg : Function.Surjective g) (hker : LinearMap.ker g = radical) : (T ⧸ radical) ≃ₗ[ℂ] U := by sorry
/- MetaplecticAutomorphicForms:MP.3/first-occurrence
Emitted: least nonzero rank in WithTop ℕ, vanishing below it and conversion to anisotropic dimension plus twice the rank. These statements work for a supplied family; persistence and existence of a nonzero tower member are separate source theorems.
-/
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
/- MetaplecticAutomorphicForms:MP.2/character-and-dual
Emitted: unit identities showing tensor weight 2−2=0 after λ₂⁻¹ and dual weight −1+2=1 after λ₂. Missing: the actual λ-character, representation tensor/dual objects and their smooth category comparisons; the unit identities alone are not those equivalences.
-/
theorem weil_characterChange (z : ℂˣ) : z*z*(z^2)⁻¹ = 1 ∧ z⁻¹*z^2 = z := by sorry

end ComplexTheta
section GlobalCover
variable {G R Z : Type*} [Group G] [Group R] [CommGroup Z]

/- MetaplecticAutomorphicForms:MP.4/adelic-metaplectic-cover
Emitted: native quotient by a normal subgroup, descent of a projection when the subgroup lies in its kernel, and finite-support product-one sign tests. Missing: AA.1 restricted product with specified compact splittings, its topology, the exact central sign subgroup and continuity/surjectivity of the adelic projection.
-/
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

end GlobalCover
section FiniteOscillator
variable {D : Type*} [Fintype D] [DecidableEq D]
/- MetaplecticAutomorphicForms:MP.4/finite-weil-representation
Emitted: native T and S linear operators on D→ℂ, negative T exponent, positive S pairing exponent, specified phase/cardinality factor and T-conjugation tests. Missing: the nondegenerate finite quadratic module, source Weil phase, metaplectic presentation relations and the resulting full representation. The one-dimensional S test uses zero pairing and phase 1; unimodularity alone does not erase a signature phase.
-/
def finiteWeil_TOperator (q : D → ℝ) : (D → ℂ) →ₗ[ℂ] (D → ℂ) := by sorry
def finiteWeil_SOperator (pairing : D → D → ℝ) (phase : ℂ) :
    (D → ℂ) →ₗ[ℂ] (D → ℂ) := by sorry
lemma finiteWeil_T (q : D → ℝ) (μ ν : D) :
    finiteWeil_TOperator q (Pi.single μ 1) ν =
      Complex.exp (-2*Real.pi*Complex.I*q μ) * ((Pi.single μ (1:ℂ) : D → ℂ) ν) := by sorry
lemma finiteWeil_S (pairing : D → D → ℝ) (phase : ℂ) (φ : D → ℂ) (ν : D) :
    finiteWeil_SOperator pairing phase φ ν = phase/(Real.sqrt (Fintype.card D) : ℂ) *
      ∑ μ, Complex.exp (2*Real.pi*Complex.I*pairing μ ν)*φ μ := by sorry
lemma finiteWeil_conjugate (q : D → ℝ) (μ ν : D) :
    star (finiteWeil_TOperator q (Pi.single μ 1) ν) =
      Complex.exp (2*Real.pi*Complex.I*q μ) * ((Pi.single μ (1:ℂ) : D → ℂ) ν) := by sorry
-- Test: TauCeti.Metaplectic.finiteWeil_unimodular
example [Unique D] : finiteWeil_TOperator (fun _ : D => 0) = LinearMap.id := by sorry
-- Test: TauCeti.Metaplectic.finiteWeil_Tbasis
example (q : D → ℝ) (μ : D) (hq : q μ = 1/4) :
    finiteWeil_TOperator q (Pi.single μ 1) μ = -Complex.I ∧
      star (finiteWeil_TOperator q (Pi.single μ 1) μ) = Complex.I := by sorry
-- Test: TauCeti.Metaplectic.finiteWeil_conjugation
example (φ : Unit → ℂ) : finiteWeil_SOperator (fun _ _ : Unit => 0) 1 φ = φ := by sorry
end FiniteOscillator
section ThetaFunctions
variable {G H X Y : Type*} [Group G] [Group H]

/- MetaplecticAutomorphicForms:MP.5/theta-kernel
Emitted: summation of a given representation action, rational invariance under an explicit reindexing action and central sign under the actual −id action. Missing: the adelic Schwartz/rational lattice carrier, canonical rational splitting, absolute summability and Poisson proof for the Fourier generator. An arbitrary group element cannot stand for the canonical rational lift.
-/
def thetaKernel (ω : Representation ℂ G (X → ℂ)) (g : G) (φ : X → ℂ) : ℂ := ∑' x, ω g φ x
lemma thetaKernel_apply (ω : Representation ℂ G (X → ℂ)) (g : G) (φ : X → ℂ) : thetaKernel ω g φ = ∑' x, ω g φ x := by sorry
lemma thetaKernel_rational (ω : Representation ℂ G (X → ℂ))
    (γ g : G) (e : X ≃ X) (φ : X → ℂ)
    (hreindex : ∀ f x, ω γ f x = f (e x)) :
    thetaKernel ω (γ*g) φ = thetaKernel ω g φ := by sorry
lemma thetaKernel_central (ω : Representation ℂ G (X → ℂ))
    (z g : G) (φ : X → ℂ) (hz : ∀ f, ω z f = -f) :
    thetaKernel ω (z*g) φ = -thetaKernel ω g φ := by sorry
-- Test: TauCeti.Metaplectic.thetaKernel_zero
example (ω : Representation ℂ G (Unit → ℂ)) (g : G) (φ : Unit → ℂ) : thetaKernel ω g φ = ω g φ () := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.thetaKernel_fourier
-- Test: TauCeti.Metaplectic.thetaKernel_sign
example (f : G → ℂ) (z g : G) (hf : f (z*g) = -f g) (hfg : f g ≠ 0) : f (z*g) ≠ f g := by sorry
/- MetaplecticAutomorphicForms:MP.5/genuine-automorphic-spaces
Emitted: the central-sign submodule of functions and its right translation/constant-term algebra. Missing: the rational quotient, smooth genuine automorphic carrier, moderate growth, full cusp condition and AF.2/3 comparison. The function submodule is not itself the automorphic space.
-/
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
/- MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker
Emitted: the integral formula, central-sign covariance with an actual commutation equation, probability-normalized matching-character integral with a.e. strong measurability, and finite-group counting-measure orthogonality. Missing: the actual unipotent quotient, normalized adelic Haar measure, Fourier completeness and automorphic constant/Whittaker coefficient comparison.
-/
def metaplecticWhittaker [MeasurableSpace H] (μ : Measure H) (ι : H → G) (η : H → ℂ) (f : G → ℂ) (g : G) : ℂ := ∫ u, f (ι u*g)*star (η u) ∂μ
lemma metaplecticWhittaker_trivial [MeasurableSpace H] (μ : Measure H) (ι : H → G) (f : G → ℂ) (g : G) : metaplecticWhittaker μ ι (fun _ => 1) f g = ∫ u, f (ι u*g) ∂μ := by sorry
lemma metaplecticWhittaker_right [MeasurableSpace H] (μ : Measure H) (ι : H → G) (η : H → ℂ) (f : G → ℂ) (g h : G) : metaplecticWhittaker μ ι η (fun x => f (x*h)) g = metaplecticWhittaker μ ι η f (g*h) := by sorry
lemma metaplecticWhittaker_central [MeasurableSpace H]
    (μ : Measure H) (ι : H → G) (η : H → ℂ) (f : G → ℂ) (z g : G)
    (hz : ∀ a, f (z*a) = -f a) (hcomm : ∀ u, ι u*z = z*ι u) :
    metaplecticWhittaker μ ι η f (z*g) = -metaplecticWhittaker μ ι η f g := by sorry
-- Test: TauCeti.Metaplectic.metaplecticWhittaker_zeroU
example (f : G → ℂ) (g : G) : metaplecticWhittaker (Measure.dirac ()) (fun _ : Unit => (1:G)) (fun _ => 1) f g = f g := by sorry
-- Test: TauCeti.Metaplectic.metaplecticWhittaker_character
example [MeasurableSpace H] (μ : Measure H) (η : H → ℂ)
    (hμ : μ Set.univ = 1) (hηm : AEStronglyMeasurable η μ) (hη : ∀ u, ‖η u‖ = 1) :
    (∫ u, η u * star (η u) ∂μ) = 1 := by sorry
-- Test: TauCeti.Metaplectic.metaplecticWhittaker_orthogonal
example [Fintype H] [MeasurableSpace H] [MeasurableSingletonClass H]
    (η ζ : H →* ℂˣ) (h : η ≠ ζ) :
    (∫ u, (ζ u : ℂ)*star (η u : ℂ) ∂(Measure.count : Measure H)) = 0 := by sorry
/- MetaplecticAutomorphicForms:MP.5/global-theta-lift
Emitted: integral of the supplied θ and conjugate f, central covariance of that same θ, zero and one-point Dirac tests. Missing: the actual convergent theta kernel, automorphic input category, joint integrability, cusp/decay and adjoint comparison. Lean’s totalized divergent integral test is a non-example, never a definition of the source lift.
-/
def globalThetaLift [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (f : H → ℂ) (g : G) : ℂ := ∫ h, θ g h*star (f h) ∂μ
lemma globalThetaLift_apply [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (f : H → ℂ) (g : G) : globalThetaLift μ θ f g = ∫ h, θ g h*star (f h) ∂μ := by sorry
lemma globalThetaLift_equivariant [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (f : H → ℂ) (g a : G) : globalThetaLift μ θ f (g*a) = globalThetaLift μ (fun x h => θ (x*a) h) f g := by sorry
lemma globalThetaLift_central [MeasurableSpace H] (μ : Measure H)
    (θ : G → H → ℂ) (f : H → ℂ) (z g : G) (χ : ℂ)
    (hz : ∀ a h, θ (z*a) h = χ*θ a h) :
    globalThetaLift μ θ f (z*g) = χ*globalThetaLift μ θ f g := by sorry
-- Test: TauCeti.Metaplectic.globalThetaLift_zero
example [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (g : G) : globalThetaLift μ θ 0 g = 0 := by sorry
-- Test: TauCeti.Metaplectic.globalThetaLift_compact
example (θ : G → Unit → ℂ) (f : Unit → ℂ) (g : G) :
    globalThetaLift (Measure.dirac ()) θ f g = θ g ()*star (f ()) := by sorry
-- Test: TauCeti.Metaplectic.globalThetaLift_divergent
example [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (f : H → ℂ) (g : G) (h : ¬Integrable (fun x => θ g x*star (f x)) μ) : globalThetaLift μ θ f g = 0 := by sorry
/- MetaplecticAutomorphicForms:MP.5/regularized-theta-integral
Emitted: the normalized integral expression for given smoothing/Eisenstein data, scaling and split-binary τ=1/2,κ=2 arithmetic tests. Missing: actual regularizer in the enveloping/Hecke algebra, its nonzero scalar polynomial, convergent initial family, meromorphic continuation, Laurent extraction and regularizer independence. Arbitrary analytic data do not define the source regularization.
-/
def regularizedTheta [MeasurableSpace H] (μ : Measure H) (τ κ : ℂ) (P : ℂ → ℂ) (θ : G → H → ℂ) (E : ℂ → H → ℂ) (s : ℂ) (g : G) : ℂ := (τ*κ*P s)⁻¹ * ∫ h, θ g h*E s h ∂μ
-- Omitted at the supplier boundary: TauCeti.Metaplectic.regularizedTheta_regularizer
lemma regularizedTheta_convergent [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (g : G) : regularizedTheta μ 1 1 (fun _ => 1) θ (fun _ _ => 1) 0 g = ∫ h, θ g h ∂μ := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.regularizedTheta_laurent
-- Test: TauCeti.Metaplectic.regularizedTheta_zero
example [MeasurableSpace H] (μ : Measure H) (τ κ : ℂ) (P : ℂ → ℂ) (E : ℂ → H → ℂ) (s : ℂ) (g : G) : regularizedTheta μ τ κ P (fun _ _ => 0) E s g = 0 := by sorry
-- Test: TauCeti.Metaplectic.regularizedTheta_scale
example [MeasurableSpace H] (μ : Measure H) (τ κ a : ℂ) (ha : a ≠ 0) (P : ℂ → ℂ) (θ : G → H → ℂ) (E : ℂ → H → ℂ) (s : ℂ) (g : G) : regularizedTheta μ τ κ (fun s => a*P s) (fun g h => a*θ g h) E s g = regularizedTheta μ τ κ P θ E s g := by sorry
-- Test: TauCeti.Metaplectic.regularizedTheta_splitBinary
example [MeasurableSpace H] (μ : Measure H) (P : ℂ → ℂ) (θ : G → H → ℂ) (E : ℂ → H → ℂ) (s : ℂ) (g : G) : regularizedTheta μ (1/2) 2 P θ E s g = (P s)⁻¹*(∫ h, θ g h*E s h ∂μ) := by sorry
/- MetaplecticAutomorphicForms:MP.5/extended-schwartz-weil
Emitted: the polynomial Gaussian function and sign/zero/scaling tests. Missing: extension of the actual oscillator to the source similitude group and its action on the specified Schwartz module; arbitrary linear operators no longer serve as the extension or restriction comparison.
-/
def extendedSchwartzWeil (q : X → ℝ) (P₁ P₂ : ℝ → ℂ) (x : X) (u : ℝ) : ℂ := (P₁ (u*q x)+(SignType.sign u : ℂ)*P₂ (u*q x))*Real.exp (-2*Real.pi*abs u*q x)
-- Omitted at the supplier boundary: TauCeti.Metaplectic.extendedSchwartzWeil_similitude
-- Omitted at the supplier boundary: TauCeti.Metaplectic.extendedSchwartzWeil_restrict
lemma extendedSchwartzWeil_real (q : X → ℝ) (P₁ P₂ : ℝ → ℂ) (x : X) (u : ℝ) : extendedSchwartzWeil q P₁ P₂ x u = (P₁ (u*q x)+(SignType.sign u : ℂ)*P₂ (u*q x))*Real.exp (-2*Real.pi*abs u*q x) := by sorry
-- Test: TauCeti.Metaplectic.extendedSchwartzWeil_zero
example (q : X → ℝ) (x : X) (u : ℝ) : extendedSchwartzWeil q (fun _ => 0) (fun _ => 0) x u = 0 := by sorry
-- Test: TauCeti.Metaplectic.extendedSchwartzWeil_sign
example (q : X → ℝ) (P₁ P₂ : ℝ → ℂ) (x : X) (u : ℝ) (hu : u < 0) : extendedSchwartzWeil q P₁ P₂ x u = (P₁ (u*q x)-P₂ (u*q x))*Real.exp (-2*Real.pi*abs u*q x) := by sorry
-- Test: TauCeti.Metaplectic.extendedSchwartzWeil_gaussian
example (q : X → ℝ) (x : X) : extendedSchwartzWeil q (fun _ => 1) (fun _ => 0) x 1 = Real.exp (-2*Real.pi*q x) := by sorry
/- MetaplecticAutomorphicForms:MP.5/unit-quotiented-theta
Emitted: a double series and exact reindexing/stabilizer-cardinality fragments. Missing: ideal-lattice arithmetic, quotient by actual units, absolute summability and the rational/adelic source identification. The independent GN arithmetic request is a gate; GN.3’s theta consumer is not imported. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite.
-/
def unitTheta (terms : Y → X → ℂ) : ℂ := ∑' y, ∑' x, terms y x
lemma unitTheta_representative (terms : Y → X → ℂ) (e : Y ≃ Y) (change : Y → X ≃ X) : unitTheta (fun y x => terms (e y) (change y x)) = unitTheta terms := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.unitTheta_rational
lemma unitTheta_multiplicity (K : Subgroup G) (minusOne : G) (hneg : minusOne ≠ 1) : Finset.card (Finset.filter (fun b : Bool => (if b then minusOne else 1) ∈ K) Finset.univ) = if minusOne ∈ K then 2 else 1 := by sorry
-- Test: TauCeti.Metaplectic.unitTheta_zero
example : unitTheta (fun _ : Y => fun _ : X => (0:ℂ)) = 0 := by sorry
-- Test: TauCeti.Metaplectic.unitTheta_minusOne
example (K : Subgroup G) (minusOne : G) (h : minusOne ∈ K) : Finset.card (Finset.filter (fun b : Bool => (if b then minusOne else 1) ∈ K) Finset.univ) = 2 := by sorry
-- Test: TauCeti.Metaplectic.unitTheta_orbit
example : ¬ Summable (fun _ : ℤ => (1 : ℂ)) := by sorry
/- MetaplecticAutomorphicForms:MP.5/genuine-eisenstein-family
Emitted: coset-sum formula, termwise central-sign covariance and zero/one-term tests. Missing: the actual normalized induced representation, verified chamber, convergence, continuation and normalized-cover constant-term intertwiners. The one-term example is not the Siegel evaluation-section parameter theorem.
-/
def genuineEisenstein (terms : X → ℂ → G → ℂ) (s : ℂ) (g : G) : ℂ := ∑' x, terms x s g
lemma genuineEisenstein_sum (terms : X → ℂ → G → ℂ) (s : ℂ) (g : G) : genuineEisenstein terms s g = ∑' γ, terms γ s g := by sorry
lemma genuineEisenstein_central (terms : X → ℂ → G → ℂ)
    (s : ℂ) (z g : G) (hz : ∀ x, terms x s (z*g) = -terms x s g) :
    genuineEisenstein terms s (z*g) = -genuineEisenstein terms s g := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.genuineEisenstein_constantTerm
-- Test: TauCeti.Metaplectic.genuineEisenstein_zero
example (s : ℂ) (g : G) : genuineEisenstein (fun _ : X => fun _ _ => 0) s g = 0 := by sorry
-- Test: TauCeti.Metaplectic.genuineEisenstein_sign
example (terms : X → ℂ → G → ℂ) (s : ℂ) (z g : G) (hgenuine : ∀ x, terms x s (z*g) = -terms x s g) (hEis : genuineEisenstein terms s g ≠ 0) : genuineEisenstein terms s (z*g) ≠ genuineEisenstein terms s g := by sorry
-- Test: TauCeti.Metaplectic.genuineEisenstein_siegel
example (s : ℂ) (g : G) :
    genuineEisenstein (fun _ : Unit => fun _ _ => (3:ℂ)) s g = 3 := by sorry

end ThetaFunctions
section ThetaIntegrals
variable {G H X Y Z V : Type*} [Group G] [Group H] [Zero X] [Zero Y] [Zero Z]
 [MeasurableSpace X] [MeasurableSpace H] [AddCommGroup V] [Module ℂ V]

/- MetaplecticAutomorphicForms:MP.6/theta-measure-normalizations
Emitted: elementary scaling of a fixed integral. Missing: actual cover-to-linear quotient Haar comparison, disconnected orthogonal Tamagawa measure, τ(H),κ and split O(1,1) source normalizations. Scaling arbitrary measures is not a proof of their source values.
-/
theorem theta_measureComparison (τ : ℝ) (μ : Measure H) (f : H → ℂ) : (τ : ℂ)⁻¹ * (∫ h, f h ∂μ) = (∫ h, (τ : ℂ)⁻¹*f h ∂μ) := by sorry
/- MetaplecticAutomorphicForms:MP.6/siegel-weil-section
Emitted: evaluation at zero of a supplied representation with covariance only when its parabolic evaluation equation is supplied. Missing: the actual oscillator, normalized induced carrier, parameter-dependent flat section and Laurent coefficients. The scalar parameter computation does not construct those carriers.
-/
def siegelWeilSection (ω : Representation ℂ G (X → ℂ)) (φ : X → ℂ) : G → ℂ := fun g => ω g φ 0
lemma siegelWeilSection_apply (ω : Representation ℂ G (X → ℂ)) (φ : X → ℂ) (g : G) : siegelWeilSection ω φ g = ω g φ 0 := by sorry
lemma siegelWeilSection_covariance (ω : Representation ℂ G (X → ℂ))
    (φ : X → ℂ) (p g : G) (χ : ℂ) (hp : ∀ f, ω p f 0 = χ*f 0) :
    siegelWeilSection ω φ (p*g) = χ*siegelWeilSection ω φ g := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.siegelWeilSection_laurent
-- Test: TauCeti.Metaplectic.siegelWeilSection_zero
example (ω : Representation ℂ G (X → ℂ)) : siegelWeilSection ω 0 = 0 := by sorry
-- Test: TauCeti.Metaplectic.siegelWeilSection_identity
example (ω : Representation ℂ G (X → ℂ)) (φ : X → ℂ) : siegelWeilSection ω φ 1 = φ 0 := by sorry
-- Test: TauCeti.Metaplectic.siegelWeilSection_parameter
example : ((2:ℂ) - (1+1))/2 = 0 ∧ ((2:ℂ)/2) ≠ 0 := by sorry
/- MetaplecticAutomorphicForms:MP.6/ikeda-map
Emitted: the explicit integral, identity and separated-variable tests and Fubini composition with SFinite measures and joint Integrable hypothesis. Missing: actual smaller-tower Schwartz data, self-dual measures, source oscillator actions and equivariance. Unrelated representations no longer occur in its intertwining API.
-/
def ikedaMap (μ : Measure X) (φ : X → Y → Z → ℂ) (a : Y) : ℂ := ∫ x, φ x a 0 ∂μ
lemma ikedaMap_apply (μ : Measure X) (φ : X → Y → Z → ℂ) (a : Y) : ikedaMap μ φ a = ∫ x, φ x a 0 ∂μ := by sorry
lemma ikedaMap_comp [MeasurableSpace Y] (μ : Measure X) (ν : Measure Y)
    [SFinite μ] [SFinite ν] (φ : X → Y → Z → ℂ)
    (hφ : Integrable (fun q : X × Y => φ q.1 q.2 0) (μ.prod ν)) :
    (∫ a, ikedaMap μ φ a ∂ν) = ∫ x, ∫ a, φ x a 0 ∂ν ∂μ := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.ikedaMap_equivariant
-- Test: TauCeti.Metaplectic.ikedaMap_identity
example (φ : Unit → Y → Z → ℂ) (a : Y) : ikedaMap (Measure.dirac ()) φ a = φ () a 0 := by sorry
-- Test: TauCeti.Metaplectic.ikedaMap_product
example (μ : Measure X) (f : X → ℂ) (g : Y → ℂ) (h : Z → ℂ) (a : Y) : ikedaMap μ (fun x a z => f x*g a*h z) a = (∫ x, f x ∂μ)*g a*h 0 := by sorry
-- Test: TauCeti.Metaplectic.ikedaMap_measure
example (μ : Measure X) (c : ℝ≥0) (φ : X → Y → Z → ℂ) (a : Y) : ikedaMap (c • μ) φ a = (c:ℂ)*ikedaMap μ φ a := by sorry
/- MetaplecticAutomorphicForms:MP.6/coherent-incoherent-sections
Emitted: restricted tprod of given local functions, good-place evaluations and finite-support sign-product obstructions with the product constraint explicitly assumed for global localizations. Missing: source induced-section tensor identification and actual localization isometries. Quadratic global existence comes from GlobalQuadraticForms Layers3,7,8 and real signatures from Layer4.4; a global Hermitian theorem needs its separate supplier.
-/
def thetaSectionCollection (places : Type*) (sections : places → G → ℂ) : G → ℂ := fun g => ∏' v, sections v g
lemma thetaSectionCollection_tensor (places : Type*) (sections : places → G → ℂ) (g : G) : thetaSectionCollection places sections g = ∏' v, sections v g := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.thetaSectionCollection_global
lemma thetaSectionCollection_incoherent (places globalSpaces : Type*) (inv : places → ℂˣ) (localization : globalSpaces → places → ℂˣ) (S : Finset places) (hglobal : ∀ V, ∏ v ∈ S, localization V v = 1) (hincoherent : ∏ v ∈ S, inv v ≠ 1) : ¬ ∃ V, ∀ v, localization V v = inv v := by sorry
-- Test: TauCeti.Metaplectic.thetaSectionCollection_globalExample
example (places : Type*) (inv : places → ℂˣ) (S : Finset places)
    (h : ∀ v ∈ S, inv v = 1) : ∏ v ∈ S, inv v = 1 := by sorry
-- Test: TauCeti.Metaplectic.thetaSectionCollection_oneFlip
example (places : Type*) [DecidableEq places] (inv : places → ℂˣ) (S : Finset places) (v : places) (hv : v ∈ S) (h : ∏ w ∈ S, inv w = 1) : ∏ w ∈ S, (if w = v then -inv w else inv w) = -1 := by sorry
-- Test: TauCeti.Metaplectic.thetaSectionCollection_standard
example (places : Type*) (sections : places → G → ℂ) (h : ∀ v, sections v 1 = 1) : thetaSectionCollection places sections 1 = 1 := by sorry

end ThetaIntegrals
section Doubling
variable {G X H : Type*} [Group G] [MeasurableSpace G] [Zero X]
 [NormedAddCommGroup H] [InnerProductSpace ℂ H]
open scoped InnerProductSpace

/- MetaplecticAutomorphicForms:MP.6/local-doubling-integral
Emitted: the integral of the same ContRepresentation matrix coefficient, native conjugate-first inner product, elementary normalization, zero, measure scaling and Unit-group integral=1 tests. Missing: actual doubling embedding, section/evaluation data, convergence chamber, zeta normalization and spherical L-factor theorem. An arbitrary scalar is no longer asserted to be an unramified ratio.
-/
def localDoublingZeta (μ : Measure G) (ρ : ContRepresentation ℂ G H) (sectionFn : ℂ → G → ℂ) (s : ℂ) (φ ψ : H) : ℂ := ∫ g, sectionFn s g*⟪ψ,ρ g φ⟫_ℂ ∂μ
lemma localDoublingZeta_integral (μ : Measure G) (ρ : ContRepresentation ℂ G H) (sectionFn : ℂ → G → ℂ) (s : ℂ) (φ ψ : H) : localDoublingZeta μ ρ sectionFn s φ ψ = ∫ g, sectionFn s g*⟪ψ,ρ g φ⟫_ℂ ∂μ := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.localDoublingZeta_unramified
lemma localDoublingZeta_normalized (μ : Measure G) (ρ : ContRepresentation ℂ G H) (sectionFn : ℂ → G → ℂ) (s L : ℂ) (φ ψ : H) : localDoublingZeta μ ρ sectionFn s φ ψ / L = L⁻¹ * localDoublingZeta μ ρ sectionFn s φ ψ := by sorry
-- Test: TauCeti.Metaplectic.localDoublingZeta_zero
example (μ : Measure G) (ρ : ContRepresentation ℂ G H) (sectionFn : ℂ → G → ℂ) (s : ℂ) (ψ : H) : localDoublingZeta μ ρ sectionFn s 0 ψ = 0 := by sorry
-- Test: TauCeti.Metaplectic.localDoublingZeta_spherical
example (ρ : ContRepresentation ℂ Unit ℂ) (s : ℂ) :
    localDoublingZeta (Measure.dirac ()) ρ (fun _ _ => 1) s 1 1 = 1 := by sorry
-- Test: TauCeti.Metaplectic.localDoublingZeta_measure
example (μ : Measure G) (c : ℝ≥0) (ρ : ContRepresentation ℂ G H) (sectionFn : ℂ → G → ℂ) (s : ℂ) (φ ψ : H) : localDoublingZeta (c • μ) ρ sectionFn s φ ψ = (c:ℂ)*localDoublingZeta μ ρ sectionFn s φ ψ := by sorry
/- MetaplecticAutomorphicForms:MP.6/global-see-saw-and-projection
Emitted: interchange of the actual double integral with SFinite measures and joint Integrable hypothesis. Missing: common oscillator and rational see-saw embeddings, spectral projection, cusp category and the target Hom comparison. Separate fiber integrability would not justify Fubini.
-/
theorem globalTheta_seeSaw [MeasurableSpace H]
    (μ : Measure G) (ν : Measure H) [SFinite μ] [SFinite ν]
    (theta : G → H → ℂ) (f : G → ℂ) (h : H → ℂ)
    (hint : Integrable (fun q : G × H => theta q.1 q.2*star (f q.1)*star (h q.2))
      (μ.prod ν)) :
    (∫ g, ∫ x, theta g x*star (f g)*star (h x) ∂ν ∂μ) =
      ∫ x, ∫ g, theta g x*star (f g)*star (h x) ∂μ ∂ν := by sorry
/- MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances
Emitted: integer classification for n=1,m=2 or3,r=0 or1. Missing: binary norm/ternary trace-zero quadratic spaces, actual Haar/splitting adapters and ordinary/boundary/second-term coefficients. The split ternary identity is modulo the residual image; GZ.5 is a consumer, never a prerequisite.
-/
theorem normTheta_integralRange (m r n : ℤ) (hn : n = 1)
    (hm : m = 2 ∨ m = 3) (hr : r = 0 ∨ r = 1) :
    (r = 0 ∨ n+1 < m-r) ∨ (m = n+1 ∧ r = 1) ∨ n+1 < m := by sorry

end Doubling
section Jacobi
variable {G N Z X : Type*} [Group G] [Group N] [Group Z] [Zero X]
def schroedingerWeil (act : G →* MulAut N) (rho : Representation ℂ N (X → ℂ)) (omega : Representation ℂ G (X → ℂ)) (p : N ⋊[act] G) : (X → ℂ) →ₗ[ℂ] (X → ℂ) := (rho p.left).comp (omega p.right)

/- MetaplecticAutomorphicForms:MP.6/jacobi-group
Emitted: native semidirect product and covariance formula. The accompanying Schrödinger–Weil operator formula is a function until covariance supplies its representation law. Missing: source symplectic action, actual oscillator, topology and classical matrix-index specialization; the BFH genus-two object stays with MP.8.
-/
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
Emitted: a central-character submodule of functions and central-character compatibility tests. Missing: full Jacobi elliptic, slash/weight, matrix-index, holomorphy and support conditions and their action laws. QM.1 items(a)–(e) and the separately sourced L2s unitary instance remain exact producer gates, not an MP.8 import.
-/
def jacobiSpace (center : Z → X → X) (ψ : Z →* ℂˣ) : Submodule ℂ (X → ℂ) := by sorry
lemma jacobiSpace_central (center : Z → X → X) (ψ : Z →* ℂˣ) (f : jacobiSpace center ψ) (z : Z) (x : X) : f.val (center z x) = (ψ z : ℂ)*f.val x := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.jacobiSpace_elliptic
-- Omitted at the supplier boundary: TauCeti.Metaplectic.jacobiSpace_weight
-- Test: TauCeti.Metaplectic.jacobiSpace_zero
example (center : Z → X → X) (ψ : Z →* ℂˣ) : (0 : X → ℂ) ∈ jacobiSpace center ψ := by sorry
-- Test: TauCeti.Metaplectic.jacobiSpace_index
example (center : Z → X → X) (ψ χ : Z →* ℂˣ) (f : jacobiSpace center ψ) (z : Z) (x : X) (hψ : ψ z ≠ χ z) (hf : f.val x ≠ 0) : f.val (center z x) ≠ (χ z : ℂ)*f.val x := by sorry
-- Test: TauCeti.Metaplectic.jacobiSpace_bfh
example (n N : ℕ) : (fun a : Fin n → ℤ => fun i => (a i : ℚ)/N) = (fun a => fun i => (a i : ℚ)*(N:ℚ)⁻¹) := by sorry
/- MetaplecticAutomorphicForms:MP.6/fourier-jacobi-extraction
Emitted: the Fourier integral, covariance under commuting action, a.e.-measurable probability-normalized matching-character test and finite-group mismatching-character test. Missing: actual central Haar quotient and translation law, matrix-index Fourier extraction and classical/Jacobi carrier identification.
-/
def fourierJacobi [MeasurableSpace Z] (μ : Measure Z) (center : Z → X → X) (ψ : Z →* ℂˣ) (f : X → ℂ) (x : X) : ℂ := ∫ z, f (center z x)*star (ψ z : ℂ) ∂μ
-- Omitted at the supplier boundary: TauCeti.Metaplectic.fourierJacobi_index
lemma fourierJacobi_equivariant [MeasurableSpace Z] (μ : Measure Z)
    (center : Z → X → X) (ψ : Z →* ℂˣ) (f : X → ℂ) (act : G → X → X)
    (hcomm : ∀ z g x, act g (center z x) = center z (act g x)) (g : G) (x : X) :
    fourierJacobi μ center ψ (fun x => f (act g x)) x =
      fourierJacobi μ center ψ f (act g x) := by sorry
lemma fourierJacobi_coefficient [MeasurableSpace Z] (μ : Measure Z)
    (ψ : Z →* ℂˣ) (hμ : μ Set.univ = 1)
    (hψm : AEStronglyMeasurable (fun z => (ψ z : ℂ)) μ)
    (hψ : ∀ z, ‖(ψ z : ℂ)‖ = 1) :
    (∫ z, (ψ z : ℂ)*star (ψ z : ℂ) ∂μ) = 1 := by sorry
-- Test: TauCeti.Metaplectic.fourierJacobi_zero
example [MeasurableSpace Z] (μ : Measure Z) (center : Z → X → X) (ψ : Z →* ℂˣ) (x : X) : fourierJacobi μ center ψ 0 x = 0 := by sorry
-- Test: TauCeti.Metaplectic.fourierJacobi_matching
example [MeasurableSpace Z] (μ : Measure Z) (ψ : Z →* ℂˣ)
    (hμ : μ Set.univ = 1) (hψm : AEStronglyMeasurable (fun z => (ψ z : ℂ)) μ)
    (hψ : ∀ z, ‖(ψ z : ℂ)‖ = 1) :
    (∫ z, (ψ z : ℂ)*star (ψ z : ℂ) ∂μ) = 1 := by sorry
-- Test: TauCeti.Metaplectic.fourierJacobi_mismatch
example [Fintype Z] [MeasurableSpace Z] [MeasurableSingletonClass Z]
    (ψ χ : Z →* ℂˣ) (h : ψ ≠ χ) :
    (∫ z, (χ z : ℂ)*star (ψ z : ℂ) ∂(Measure.count : Measure Z)) = 0 := by sorry

end Jacobi
section IdealTheta

/- MetaplecticAutomorphicForms:MP.5/ideal-class-theta
Emitted: a weighted norm-index series on a supplied lattice and coefficient sequence. Missing: bijection from nonzero lattice/unit orbits to integral ideals in the correct class, its weight, ideal norms and class representatives, actual Fourier extraction and constant term. The generic series does not prove ideal-class modularity or its conjugation law. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite.
-/
def idealClassTheta (w : ℕ) (r : ℕ → ℂ) (z : ℍ) : ℂ := (w:ℂ)⁻¹ + ∑' n : ℕ, r (n+1)*Complex.exp (2*Real.pi*Complex.I*(n+1)*(z:ℂ))
lemma idealClassTheta_coeff (w : ℕ) (r : ℕ → ℂ) (z : ℍ) : idealClassTheta w r z = (w:ℂ)⁻¹ + ∑' n : ℕ, r (n+1)*Complex.exp (2*Real.pi*Complex.I*(n+1)*(z:ℂ)) := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.idealClassTheta_constant
-- Omitted at the supplier boundary: TauCeti.Metaplectic.idealClassTheta_lattice
-- Test: TauCeti.Metaplectic.idealClassTheta_gaussianUnits
example (z : ℍ) : idealClassTheta 4 (fun _ => 0) z = 1/4 := by sorry
-- Test: TauCeti.Metaplectic.idealClassTheta_conjugate
example (w : ℕ) (r r' : ℕ → ℂ) (h : r = r') (z : ℍ) : idealClassTheta w r z = idealClassTheta w r' z := by sorry
-- Test: TauCeti.Metaplectic.idealClassTheta_zeroIdeal
example (w : ℕ) (r : ℕ → ℂ) (z : ℍ) :
    idealClassTheta w (fun n => if n = 0 then 42 else r n) z = idealClassTheta w r z := by sorry

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
def halfWeightEisConstant (Λ : ℂ → ℂ) (s : ℂ) (y : ℝ) : ℂ :=
 Λ (2*s)*(2:ℂ)^s*(y:ℂ)^(s/2+1/4) + Λ (2-2*s)*(2:ℂ)^(1-s)*(y:ℂ)^(3/4-s/2)
def halfWeightEisFourier (b : ℤ → ℂ → ℂ) (W : ℝ → ℂ → ℝ → ℂ) (s : ℂ) (z : ℍ) : ℂ :=
 ∑' n : ℤ, if n = 0 then 0 else b n s*W (if 0 < n then 1/4 else -1/4) (s/2-1/4) (4*Real.pi*abs (n:ℝ)*z.im)*Complex.exp (2*Real.pi*Complex.I*n*z.re)

def epsilonHalf (a : ℕ) : ℂ := if a % 4 = 1 then 1 else Complex.I
def poincarePrefactor (n : ℤ) (s : ℂ) : ℂ :=
 Complex.Gamma (s-(if 0 < n then 1/4 else -1/4))/(4*Real.pi*abs (n:ℝ)*Complex.Gamma (2*s))
def shimuraSeries (K : ℂ → ℝ → ℂ) (a : ℕ → ℂ) (r : ℝ) (z : ℍ) : ℂ :=
 2*(Real.sqrt z.im : ℂ)*∑' n : ℤ, if n = 0 then 0 else a n.natAbs * K (Complex.I*r) (2*Real.pi*abs (n:ℝ)*z.im)*Complex.exp (2*Real.pi*Complex.I*n*z.re)
def shimuraCoefficientSequence (b : ℤ → ℂ) (χ : ℤ → ℕ → ℂ) (d : ℤ) (m : ℕ) : ℂ :=
  (m:ℂ)*(∑ n ∈ m.divisors, (n:ℂ)^(-3/2:ℂ)*χ d n*b ((m:ℤ)^2*d/(n:ℤ)^2))/b d

/- MetaplecticAutomorphicForms:MP.7/theta-multiplier
Emitted: the native Jacobi-theta quotient multiplier, nonvanishing/unit norm and shift/inversion/phase tests on Γ₀(4). Missing: identification with the adelic cover and supplier Whittaker/Fourier normalizations; no new theta function duplicates Mathlib.
-/
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
Emitted: intersection of an eigen-equation for a supplied Δ and the actual theta-multiplier automorphy condition. Missing: native smooth weighted Laplacian domain, L² quotient and three-cusp decay/Fourier coefficients. The cusp tests detect that checking one cusp or weight-zero invariance is insufficient.
-/
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
/- MetaplecticAutomorphicForms:MP.7/half-weight-eisenstein
Emitted: the explicitly normalized constant term plus nonzero allowed-index Fourier series, zero/constant-term and index-zero exclusion tests. Missing: actual completed zeta, plus coefficient and Whittaker functions, convergence, automorphy, meromorphic continuation and extraction at the other cusps. Independently chosen functions are only a series adapter.
-/
def halfWeightEisenstein (Λ : ℂ → ℂ) (b : ℤ → ℂ → ℂ) (W : ℝ → ℂ → ℝ → ℂ) (s : ℂ) (z : ℍ) : ℂ := halfWeightEisConstant Λ s z.im + halfWeightEisFourier b W s z
lemma halfWeightEisenstein_initialSeries (Λ : ℂ → ℂ) (b : ℤ → ℂ → ℂ) (W : ℝ → ℂ → ℝ → ℂ) (s : ℂ) (z : ℍ) : halfWeightEisenstein Λ b W s z = halfWeightEisConstant Λ s z.im + halfWeightEisFourier b W s z := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.halfWeightEisenstein_constantTerms
lemma halfWeightEisenstein_fourierTransport (s : ℂ) : s/2-1/4 = (s/2+1/4)-1/2 := by sorry
-- Test: TauCeti.Metaplectic.halfWeightEisenstein_test1
example (W : ℝ → ℂ → ℝ → ℂ) (s : ℂ) (z : ℍ) :
    halfWeightEisenstein (fun _ => 0) (fun _ _ => 0) W s z = 0 := by sorry
-- Test: TauCeti.Metaplectic.halfWeightEisenstein_test2
example (Λ : ℂ → ℂ) (W : ℝ → ℂ → ℝ → ℂ) (s : ℂ) (z : ℍ) :
    halfWeightEisenstein Λ (fun _ _ => 0) W s z = halfWeightEisConstant Λ s z.im := by sorry
-- Test: TauCeti.Metaplectic.halfWeightEisenstein_test3
example (Λ : ℂ → ℂ) (b : ℤ → ℂ → ℂ)
    (W : ℝ → ℂ → ℝ → ℂ) (s : ℂ) (z : ℍ) :
    halfWeightEisenstein Λ (fun n t => if n = 0 then 42 else b n t) W s z =
      halfWeightEisenstein Λ b W s z := by sorry
/- MetaplecticAutomorphicForms:MP.7/fundamental-eisenstein-coefficient
Emitted: the |d|^(-3/4)(4π)^(-1/4) coefficient prefactor and its product formula, with direct d=1,d=−3 and 2√π product tests. Missing: actual completed Dirichlet L-function, fundamental discriminant and parity Γ-factor identification; the omitted parity API cannot equate independently chosen functions.
-/
def fundamentalEisensteinCoefficient (Λ : ℤ → ℂ → ℂ) (d : ℤ) (s : ℂ) : ℂ := (Real.rpow (4*Real.pi) (-1/4) * Real.rpow (abs (d:ℝ)) (-3/4) : ℝ) * Λ d s
lemma fundamentalEisensteinCoefficient_fundamentalValue (Λ : ℤ → ℂ → ℂ) (d : ℤ) (s : ℂ) : fundamentalEisensteinCoefficient Λ d s = (Real.rpow (4*Real.pi) (-1/4) * Real.rpow (abs (d:ℝ)) (-3/4) : ℝ) * Λ d s := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.fundamentalEisensteinCoefficient_parityFactor
lemma fundamentalEisensteinCoefficient_product (Λ : ℤ → ℂ → ℂ) (d d' : ℤ) (s : ℂ) : fundamentalEisensteinCoefficient Λ d s*fundamentalEisensteinCoefficient Λ d' s = (Real.rpow (4*Real.pi) (-1/2) * Real.rpow (abs (d*d':ℝ)) (-3/4) : ℝ) * (Λ d s*Λ d' s) := by sorry
-- Test: TauCeti.Metaplectic.fundamentalEisensteinCoefficient_test1
example (Λ : ℤ → ℂ → ℂ) (s : ℂ) : fundamentalEisensteinCoefficient Λ 1 s = (Real.rpow (4*Real.pi) (-1/4):ℂ)*Λ 1 s := by sorry
-- Test: TauCeti.Metaplectic.fundamentalEisensteinCoefficient_test2
example (Λ : ℤ → ℂ → ℂ) (s : ℂ) :
    fundamentalEisensteinCoefficient Λ (-3) s =
      (Real.rpow (4*Real.pi) (-1/4)*Real.rpow 3 (-3/4):ℂ)*Λ (-3) s := by sorry
-- Test: TauCeti.Metaplectic.fundamentalEisensteinCoefficient_test3
example (Λ : ℤ → ℂ → ℂ) (s : ℂ) :
    (2*Real.sqrt Real.pi:ℂ)*fundamentalEisensteinCoefficient Λ 1 s*
      fundamentalEisensteinCoefficient Λ 1 s = Λ 1 s*Λ 1 s := by sorry
/- MetaplecticAutomorphicForms:MP.7/eisenstein-product-normalization
Emitted: the exact prefactor product identity with d,d′ nonzero. At d=0 totalized negative powers vanish while arbitrary Λ(0,s) need not, so nonzero discriminants are mandatory. Source completed-L-function and Eisenstein identification remain separate.
-/
theorem halfWeightEisenstein_product (Λ : ℤ → ℂ → ℂ)
    (d d' : ℤ) (hd : d ≠ 0) (hd' : d' ≠ 0) (s : ℂ) :
    Λ d s*Λ d' s = (2*Real.sqrt Real.pi : ℂ)*((abs (d*d':ℝ):ℝ):ℂ)^(3/4:ℂ)*
      fundamentalEisensteinCoefficient Λ d s*fundamentalEisensteinCoefficient Λ d' s := by sorry
/- MetaplecticAutomorphicForms:MP.7/kohnen-plus-space
Emitted: the native intersection of forbidden coefficient kernels, membership and linear closure. Missing: its ambient cusp/eigen space and actual Hecke preservation, including the prime2 convention. Vanishing forbidden coefficients alone does not impose cuspidality.
-/
def kohnenPlus (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ) : Submodule ℂ (ℍ → ℂ) := by sorry
lemma kohnenPlus_coefficientKernels (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ) (n : ℤ) (hn : n % 4 = 2 ∨ n % 4 = 3) : kohnenPlus coeff ≤ LinearMap.ker (coeff n) := by sorry
lemma kohnenPlus_membership (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ) (F : ℍ → ℂ) : F ∈ kohnenPlus coeff ↔ ∀ n, n % 4 = 2 ∨ n % 4 = 3 → coeff n F = 0 := by sorry
lemma kohnenPlus_linearStructure (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ)
    (a : ℂ) (F H : kohnenPlus coeff) : a • F.val + H.val ∈ kohnenPlus coeff := by sorry
-- Test: TauCeti.Metaplectic.kohnenPlus_test1
example (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ) (F : ℍ → ℂ)
    (h : coeff (-1) F ≠ 0) : F ∉ kohnenPlus coeff := by sorry
-- Test: TauCeti.Metaplectic.kohnenPlus_test2
example (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ)
    (h : ∀ n, n % 4 = 2 ∨ n % 4 = 3 → coeff n = 0) : kohnenPlus coeff = ⊤ := by sorry
-- Test: TauCeti.Metaplectic.kohnenPlus_test3
example (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ) (constant : (ℍ → ℂ) →ₗ[ℂ] ℂ) (F : ℍ → ℂ) (h : F ∈ kohnenPlus coeff) (hc : constant F ≠ 0) : F ∉ LinearMap.ker constant := by sorry
/- MetaplecticAutomorphicForms:MP.7/plus-operators
Emitted: native linear U,W and their specified WU combination on functions, explicit √2/order tests and its value on the constant function. Missing: actual Maass domain and operator relations proving orthogonal plus projection there. The constant-function value rules out treating this combination as idempotent on every function.
-/
def plusOperators : ((ℍ → ℂ) →ₗ[ℂ] (ℍ → ℂ)) × ((ℍ → ℂ) →ₗ[ℂ] (ℍ → ℂ)) := by sorry
lemma plusOperators_uFormula (F : ℍ → ℂ) : plusOperators.1 F = plusU F := by sorry
lemma plusOperators_wFormula (F : ℍ → ℂ) : plusOperators.2 F = plusW F := by sorry
lemma plusOperators_projectionComparison (F : ℍ → ℂ) : plusPr F = (2/3:ℂ) • plusOperators.2 (plusOperators.1 F)+(1/3:ℂ) • F := by sorry
-- Test: TauCeti.Metaplectic.plusOperators_test1
example (F : ℍ → ℂ) (z : ℍ) : plusU F z = (Real.sqrt 2 : ℂ)/4*∑ ν : Fin 4, F (shiftFour ν z) := by sorry
-- Test: TauCeti.Metaplectic.plusOperators_test2
example (z : ℍ) :
    plusPr (fun _ => 1) z = (2/3:ℂ)*phaseW z*(Real.sqrt 2:ℂ)+(1/3:ℂ) := by sorry
-- Test: TauCeti.Metaplectic.plusOperators_test3
example (F : ℍ → ℂ) (z : ℍ) : plusW (plusU F) z = phaseW z*((Real.sqrt 2 : ℂ)/4)*∑ ν : Fin 4, F (shiftFour ν (invertFour z)) := by sorry
/- MetaplecticAutomorphicForms:MP.7/half-weight-kloosterman
Emitted: finite sum over native ZMod units with epsilon phase, inverse-lift independence and c=4/period tests under stated κ values. Missing: the actual extended Kronecker symbol and required source modulus/discriminant identification. κ is a finite-sum input, not an arbitrary asserted arithmetic character.
-/
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
Emitted: exact dyadic scalar multiple and concrete c=4 values under the specified κ values. Missing: actual Kronecker data proving reality and symmetry in the source range; those assertions have been omitted for arbitrary κ.
-/
def plusKloosterman (κ : ℤ → ℤ → ℤ) (m n : ℤ) (c : ℕ) [NeZero c] : ℂ := (1-Complex.I)*(if 8 ∣ c then 1 else 2)*halfWeightKloosterman κ m n c
lemma plusKloosterman_dyadicFactor (κ : ℤ → ℤ → ℤ) (m n : ℤ) (c : ℕ) [NeZero c] : plusKloosterman κ m n c = (1-Complex.I)*(if 8 ∣ c then 1 else 2)*halfWeightKloosterman κ m n c := by sorry
lemma plusKloosterman_weightHalfComparison (κ : ℤ → ℤ → ℤ) (m n : ℤ) (c : ℕ) [NeZero c] : plusKloosterman κ m n c/(1-Complex.I) = (if 8 ∣ c then 1 else 2)*halfWeightKloosterman κ m n c := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.plusKloosterman_discriminantSymmetry
-- Test: TauCeti.Metaplectic.plusKloosterman_modFour
example (κ : ℤ → ℤ → ℤ) (h₁ : κ 4 1 = 1) (h₃ : κ 4 3 = 1) : plusKloosterman κ 0 0 4 = 4 := by sorry
-- Test: TauCeti.Metaplectic.plusKloosterman_oneOne
example (κ : ℤ → ℤ → ℤ) (h₁ : κ 4 1 = 1) (h₃ : κ 4 3 = 1) : plusKloosterman κ 1 1 4 = -4 := by sorry
-- Test: TauCeti.Metaplectic.plusKloosterman_exception
example : (1-Complex.I)*(1+Complex.I) = (2:ℂ) ∧ (1-Complex.I)*2*(1+Complex.I) = (4:ℂ) := by sorry
/- MetaplecticAutomorphicForms:MP.7/half-weight-poincare
Emitted: quotient-indexed sum and source prefactor/Whittaker-parameter arithmetic with Γ cancellation only in Re(s)>1. Missing: actual Whittaker M, well-defined representative-independent seed, convergence, automorphy and residues. The third test checks its 4π|n| factor, not the full residue theorem.
-/
def halfWeightPoincare (M : ℝ → ℂ → ℝ → ℂ) (n : ℤ) (s : ℂ) (z : ℍ) : ℂ := by sorry
lemma halfWeightPoincare_seedNormalization (M : ℝ → ℂ → ℝ → ℂ) (n : ℤ) (s : ℂ) (z : ℍ) : halfWeightPoincare M n s z = poincarePrefactor n s * ∑' c : InfinityCosets, let γ := cosetRepresentative c; (thetaMultiplier γ z)⁻¹ * M (if 0 < n then 1/4 else -1/4) (s-1/2) (4*Real.pi*abs (n:ℝ)*(γ • z).im) * Complex.exp (2*Real.pi*Complex.I*n*(γ • z).re) := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.halfWeightPoincare_multiplierInverse
lemma halfWeightPoincare_parameter (s : ℂ) : s/2+1/4-1/2 = s/2-1/4 := by sorry
-- Test: TauCeti.Metaplectic.halfWeightPoincare_test1
example (s : ℂ) : poincarePrefactor 1 s = Complex.Gamma (s-1/4)/(4*Real.pi*Complex.Gamma (2*s)) ∧ poincarePrefactor (-3) s = Complex.Gamma (s+1/4)/(12*Real.pi*Complex.Gamma (2*s)) := by sorry
-- Test: TauCeti.Metaplectic.halfWeightPoincare_test2
example (s : ℂ) : (4*Real.pi*abs (0:ℝ)*Complex.Gamma (2*s):ℂ) = 0 := by sorry
-- Test: TauCeti.Metaplectic.halfWeightPoincare_test3
example (s : ℂ) (hs : 1 < s.re) : poincarePrefactor 1 s*(4*Real.pi*Complex.Gamma (2*s)) = Complex.Gamma (s-1/4) := by sorry
/- MetaplecticAutomorphicForms:MP.7/plus-bessel-coefficient
Emitted: the full two-sign Γ/power/sqrt prefactor and K⁺/c series, with direct coefficient tests supported at c=4 for same/opposite signs and doubled dyadic input. Missing: actual J/I, K⁺ and the projected-resolvent meromorphic continuation; independently chosen continuation is not equated with the initial series.
-/
def plusBesselCoefficient (K : ℤ → ℤ → ℕ → ℂ) (BesselJ BesselI : ℂ → ℝ → ℂ) (m n : ℤ) (s : ℂ) : ℂ := by sorry
lemma plusBesselCoefficient_besselSeries (K : ℤ → ℤ → ℕ → ℂ) (BesselJ BesselI : ℂ → ℝ → ℂ) (m n : ℤ) (s : ℂ) : plusBesselCoefficient K BesselJ BesselI m n s = (Complex.Gamma (s-(if 0 < m then 1/4 else -1/4))*Complex.Gamma (s-(if 0 < n then 1/4 else -1/4))/(3*(Real.sqrt Real.pi:ℂ)*(2:ℂ)^(2-2*s)*Complex.Gamma (2*s-1/2)*(Real.sqrt (abs (m*n:ℝ)):ℂ))) * ∑' c : ℕ, if 0 < c ∧ 4 ∣ c then K m n c/c*(if 0 < m*n then BesselJ (2*s-1) (4*Real.pi*Real.sqrt (abs (m*n:ℝ))/c) else BesselI (2*s-1) (4*Real.pi*Real.sqrt (abs (m*n:ℝ))/c)) else 0 := by sorry
lemma plusBesselCoefficient_signs (J I : ℂ → ℝ → ℂ) (m n : ℤ) (hm : 0 < m) (hn : n < 0) (s : ℂ) (x : ℝ) : (Complex.Gamma (s-(if 0 < m then 1/4 else -1/4))*Complex.Gamma (s-(if 0 < n then 1/4 else -1/4)), if 0 < m*n then J (2*s-1) x else I (2*s-1) x) = (Complex.Gamma (s-1/4)*Complex.Gamma (s+1/4), I (2*s-1) x) := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.plusBesselCoefficient_continuation
-- Test: TauCeti.Metaplectic.plusBesselCoefficient_test1
example (J I : ℂ → ℝ → ℂ) (s : ℂ) :
    plusBesselCoefficient (fun _ _ c => if c = 4 then 1 else 0) J I (-3) (-4) s =
      (Complex.Gamma (s+1/4)^2 /
        (3*(Real.sqrt Real.pi:ℂ)*(2:ℂ)^(2-2*s)*Complex.Gamma (2*s-1/2)*
          (Real.sqrt 12:ℂ))) * (J (2*s-1) (Real.pi*Real.sqrt 12)/4) := by sorry
-- Test: TauCeti.Metaplectic.plusBesselCoefficient_test2
example (J I : ℂ → ℝ → ℂ) (s : ℂ) :
    plusBesselCoefficient (fun _ _ c => if c = 4 then 1 else 0) J I 1 (-3) s =
      (Complex.Gamma (s-1/4)*Complex.Gamma (s+1/4) /
        (3*(Real.sqrt Real.pi:ℂ)*(2:ℂ)^(2-2*s)*Complex.Gamma (2*s-1/2)*
          (Real.sqrt 3:ℂ))) * (I (2*s-1) (Real.pi*Real.sqrt 3)/4) := by sorry
-- Test: TauCeti.Metaplectic.plusBesselCoefficient_test3
example (J I : ℂ → ℝ → ℂ) (s : ℂ) :
    plusBesselCoefficient (fun _ _ c => if c = 4 then 2 else 0) J I 1 1 s =
      2*plusBesselCoefficient (fun _ _ c => if c = 4 then 1 else 0) J I 1 1 s := by sorry
/- MetaplecticAutomorphicForms:MP.7/quadratic-root-weyl-sum
Emitted: root-congruence finite sum, discriminant arithmetic and phase/range tests. Missing: an actual binary genus character with representative, reflection and scaling laws; evenness is not asserted for arbitrary χ. This is an independent GN PartII request, without a GN.2 stage input. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite.
-/
def quadraticRootWeylSum (χ : ℤ → ℤ → ℤ → ℂ) (d d' m c : ℤ) : ℂ := ∑ b ∈ Finset.Ico 0 c, if c ∣ b^2-d*d' then χ (c/4) b ((b^2-d*d')/c) * Complex.exp (2*Real.pi*Complex.I*(2*m*b)/c) else 0
lemma quadraticRootWeylSum_rootIndex (χ : ℤ → ℤ → ℤ → ℂ) (d d' m c : ℤ) : quadraticRootWeylSum χ d d' m c = ∑ b ∈ Finset.Ico 0 c, if c ∣ b^2-d*d' then χ (c/4) b ((b^2-d*d')/c) * Complex.exp (2*Real.pi*Complex.I*(2*m*b)/c) else 0 := by sorry
lemma quadraticRootWeylSum_formEvaluation (a b D : ℤ) (h : 4*a ∣ b^2-D) (ha : a ≠ 0) : b^2-4*a*((b^2-D)/(4*a)) = D := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.quadraticRootWeylSum_evenness
-- Test: TauCeti.Metaplectic.quadraticRootWeylSum_test1
example (a b D : ℤ) (h : 4*a ∣ b^2-D) (ha : a ≠ 0) : b^2-4*a*((b^2-D)/(4*a)) = D := by sorry
-- Test: TauCeti.Metaplectic.quadraticRootWeylSum_test2
example : Complex.exp (2*Real.pi*Complex.I*(2:ℂ)/4) ≠ Complex.exp (2*Real.pi*Complex.I/4) := by sorry
-- Test: TauCeti.Metaplectic.quadraticRootWeylSum_test3
example (a : ℤ) (ha : 0 < a) : (Finset.Ico 0 (4*a)).card = 2*(Finset.Ico 0 (2*a)).card := by sorry
/- MetaplecticAutomorphicForms:MP.7/shimura-eigenline-lift
Emitted: coefficient-ratio Fourier series and nonzero-scalar invariance. Missing: actual all-prime Hecke eigenform data, fundamental nonzero coefficient and recurrence proving independence of that choice, the Bessel kernel and automorphy. The p=2 factor remains explicit.
-/
def shimuraEigenlineLift (K : ℂ → ℝ → ℂ) (a : ℕ → ℂ) (r : ℝ) : ℍ → ℂ := shimuraSeries K a r
lemma shimuraEigenlineLift_heckeSeries (K : ℂ → ℝ → ℂ) (a : ℕ → ℂ) (r : ℝ) (z : ℍ) : shimuraEigenlineLift K a r z = shimuraSeries K a r z := by sorry
lemma shimuraEigenlineLift_scaleIndependence (A B scale : ℂ) (h : scale ≠ 0) : (scale*A)/(scale*B) = A/B := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.shimuraEigenlineLift_fundamentalChoice
-- Test: TauCeti.Metaplectic.shimuraEigenlineLift_test1
example (A B : ℂ) : (-A)/(-B) = A/B := by sorry
-- Test: TauCeti.Metaplectic.shimuraEigenlineLift_test2
example (b : ℤ → ℂ) (d : ℤ) (h : b d = 0) : ¬ b d ≠ 0 := by sorry
-- Test: TauCeti.Metaplectic.shimuraEigenlineLift_test3
example (a₂ a₂' : ℂ) (h : a₂ ≠ a₂') : (1-a₂/2+(1/4:ℂ)) ≠ (1-a₂'/2+(1/4:ℂ)) := by sorry

end HalfWeight
section FiniteFourier
variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V]

/- MetaplecticAutomorphicForms:MP.7/positive-fourier-kernel
Emitted: native coefficient-kernel intersection, finite-dimensional orthogonal complement and a zero-coefficient lift test. Missing: actual Fourier maps and source trace identity for automorphy. A nonzero invisible vector is permitted; vanishing positive coefficients does not assert vanishing negative coefficients.
-/
def positiveFourierKernel (b : ℤ → V →ₗ[ℂ] ℂ) : Submodule ℂ V := by sorry
lemma positiveFourierKernel_memKernel (b : ℤ → V →ₗ[ℂ] ℂ) (v : V) : v ∈ positiveFourierKernel b ↔ ∀ n, 0 < n → n % 4 = 0 ∨ n % 4 = 1 → b n v = 0 := by sorry
lemma positiveFourierKernel_orthogonalSplit [FiniteDimensional ℂ V] (b : ℤ → V →ₗ[ℂ] ℂ) : positiveFourierKernel b ⊔ (positiveFourierKernel b).orthogonal = ⊤ := by sorry
lemma positiveFourierKernel_liftZero (b : ℤ → V →ₗ[ℂ] ℂ) (D Q : ℤ) (hD : 0 < D) (hQ : Q ≠ 0) (hDQ : (D*Q^2) % 4 = 0 ∨ (D*Q^2) % 4 = 1) (v : positiveFourierKernel b) : b (D*Q^2) v.val = 0 := by sorry
-- Test: TauCeti.Metaplectic.positiveFourierKernel_test1
example (z : ℂ) (hz : z ≠ 0) :
    z ∉ positiveFourierKernel (fun _ : ℤ => (LinearMap.id : ℂ →ₗ[ℂ] ℂ)) := by sorry
-- Test: TauCeti.Metaplectic.positiveFourierKernel_test2
example (b : ℤ → V →ₗ[ℂ] ℂ) (h : positiveFourierKernel b = ⊤) (n : ℤ) (hn : 0 < n) (hnm : n % 4 = 0 ∨ n % 4 = 1) (v : V) : b n v = 0 := by sorry
-- Test: TauCeti.Metaplectic.positiveFourierKernel_test3
example :
    positiveFourierKernel (fun n : ℤ => if n = -3 then (LinearMap.id : ℂ →ₗ[ℂ] ℂ) else 0) = ⊤ := by sorry
/- MetaplecticAutomorphicForms:MP.7/finite-fourier-certificate
Emitted: finite separation of the orthogonal complement by positive admissible coefficient coordinates under finite dimensionality and the stated common-kernel condition. Missing: identification of those maps with the source Fourier coefficients and the trace/analytic inputs for automorphy.
-/
theorem positiveFourier_finiteCertificate [FiniteDimensional ℂ V] (b : ℤ → V →ₗ[ℂ] ℂ) (h : positiveFourierKernel b = ⊥) : ∃ n : Fin (Module.finrank ℂ V) → ℤ, (∀ i, 0 < n i ∧ (n i % 4 = 0 ∨ n i % 4 = 1)) ∧ Function.Injective (fun v : V => fun i => b (n i) v) := by sorry

end FiniteFourier
section TraceInterfaces

/- MetaplecticAutomorphicForms:MP.7/geometric-trace
Emitted: inverse-norm normalization and CM/cycle scalar fragments; odd cancellation now pairs an actual finite index set by an involution preserving weights and reversing function values. Missing: the actual source CM points/stabilizers and oriented cycles, genus-character symmetry and integral reflection law for each branch. RawTrace=0 is not used as a substitute for odd parity. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite.
-/
def geometricTrace (measure : Measure ℍ) (φ : ℍ → ℂ) (rawTrace : ℂ) : ℂ := ((∫ z, ‖φ z‖^2 ∂measure : ℝ):ℂ)⁻¹*rawTrace
lemma geometricTrace_cm (I : Type*) [Fintype I] (measure : Measure ℍ) (φ : ℍ → ℂ) (points : I → ℍ) (weights : I → ℂ) : geometricTrace measure φ ((2*Real.sqrt Real.pi : ℂ)*∑ i, weights i*φ (points i)) = ((∫ z, ‖φ z‖^2 ∂measure : ℝ):ℂ)⁻¹*(2*Real.sqrt Real.pi : ℂ)*∑ i, weights i*φ (points i) := by sorry
lemma geometricTrace_cycle (I : Type*) [Fintype I] (measure : Measure ℍ) (φ : ℍ → ℂ) (genusWeight cycleIntegral : I → ℂ) : geometricTrace measure φ (∑ i, genusWeight i*cycleIntegral i) = ((∫ z, ‖φ z‖^2 ∂measure : ℝ):ℂ)⁻¹*∑ i, genusWeight i*cycleIntegral i := by sorry
lemma geometricTrace_odd (I : Type*) [Fintype I]
    (measure : Measure ℍ) (φ : ℍ → ℂ) (points : I → ℍ) (weights : I → ℂ)
    (reflection : I ≃ I) (hweight : ∀ i, weights (reflection i) = weights i)
    (hodd : ∀ i, φ (points (reflection i)) = -φ (points i)) :
    geometricTrace measure φ (∑ i, weights i*φ (points i)) = 0 := by sorry
-- Test: TauCeti.Metaplectic.geometricTrace_scale
example (measure : Measure ℍ) (φ : ℍ → ℂ) (rawTrace : ℂ) (a : ℂ) (ha : a ≠ 0) : geometricTrace measure (a • φ) (a*rawTrace) = geometricTrace measure φ rawTrace/star a := by sorry
-- Test: TauCeti.Metaplectic.geometricTrace_oddTest
example (measure : Measure ℍ) (φ : ℍ → ℂ) (p q : ℍ) (a : ℂ)
    (hodd : φ q = -φ p) : geometricTrace measure φ (a*φ p+a*φ q) = 0 := by sorry
-- Test: TauCeti.Metaplectic.geometricTrace_norm
example (measure : Measure ℍ) (φ : ℍ → ℂ) (rawTrace : ℂ) (h : (∫ z, ‖φ z‖^2 ∂measure : ℝ) = 1) : geometricTrace measure φ rawTrace = rawTrace := by sorry
/- MetaplecticAutomorphicForms:MP.7/biro-shintani-lift
Emitted: the Fourier series over all nonzero positive and negative indices with |Q|^(1/2)/P divisor coefficient and positive-D inputs, complex spectral parameter, kernel/zero and coefficient2=1/2 tests. Missing: actual general-level Maass carrier, Fourier extraction, Whittaker W, eigen-equation, trace identity(14), convergence and corrected analytic proof. The spectral API is omitted instead of replacing a Laplace theorem by an arithmetic equality.
-/
def biroCoefficientSequence (b : ℤ → ℂ) (χ : ℕ → ℂ) (N : ℕ) (D : ℤ) (k : ℕ) : ℂ :=
 ∑ P ∈ k.divisors, if Nat.Coprime N P then
   (Real.sqrt (k/P : ℕ) : ℂ)/(P:ℂ)*χ P*b (D*((k/P):ℤ)^2) else 0
def biroLift (W : ℂ → ℂ → ℂ) (b : ℤ → ℂ) (χ : ℕ → ℂ) (N : ℕ) (D : ℤ) (t : ℂ) (z : ℍ) : ℂ :=
 ∑' k : ℤ, if k = 0 then 0 else
   biroCoefficientSequence b χ N D k.natAbs * W (1/2+2*Complex.I*t) (k*(z:ℂ))
lemma biroLift_coeff (W : ℂ → ℂ → ℂ) (b : ℤ → ℂ) (χ : ℕ → ℂ) (N : ℕ) (D : ℤ) (t : ℂ) (z : ℍ) :
 biroLift W b χ N D t z = ∑' k : ℤ, if k = 0 then 0 else
   biroCoefficientSequence b χ N D k.natAbs * W (1/2+2*Complex.I*t) (k*(z:ℂ)) := by sorry
-- Omitted at the supplier boundary: TauCeti.Metaplectic.biroLift_spectral
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

end TraceInterfaces

end
end TauCeti.Metaplectic

/-
Protocol §13: omitted declarations, API items and tests.
Each name below is a planning target, not a Lean assertion. Its actual carrier
and comparison maps must be constructed before its signature can be emitted.
The packet and reader retain the full statements, hypotheses and proof routes.

MetaplecticAutomorphicForms:MP.3/orthogonal-cover-restriction — Cover over orthogonal–symplectic pairs
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: The scalar cover pulls back to O(V)×Sp(W). O(V) has the Schrödinger splitting h↦[φ(x)↦φ(h⁻¹x)]. The restriction over Sp(W) of the μ₂ cover is trivial when m=dim V is even and is the metaplectic cover of W when m is odd. The tensor Weil representation consequently descends to O(V)×Sp(W) for even m and is genuine on O(V)×Mp(W) for odd m.
  TauCeti.Metaplectic.orthogonalCover_parity [target]: The scalar cover pulls back to O(V)×Sp(W). O(V) has the Schrödinger splitting h↦[φ(x)↦φ(h⁻¹x)]. The restriction over Sp(W) of the μ₂ cover is trivial when m=dim V is even and is the metaplectic cover of W when m is odd. The tensor Weil representation consequently descends to O(V)×Sp(W) for even m and is genuine on O(V)×Mp(W) for odd m.

MetaplecticAutomorphicForms:MP.3/unitary-splitting — Unitary dual-pair splittings
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The cited papers invoke Kudla’s unitary splitting formula; its original proof must be collated. Gan–Ichino §4 fixes the trace pairing and asserts δ-independence. General E/F Hermitian-space and quaternionic group carriers are requested ClassicalGroups Part-II inputs; the existing complex classical-group carriers do not provide them.
  TauCeti.Metaplectic.unitaryWeilRepresentation [target]: For E/F quadratic, an ε-Hermitian V and a −ε-Hermitian W, construct their commuting actions on the F-symplectic tensor space with trace pairing. A pair of characters χV,χW of E× with χV|F×=ωE/F^dim V and χW|F×=ωE/F^dim W gives the two compatible scalar-cover splittings and the Weil representation ωψ,χV,χW. Record dependence on ψ and the auxiliary characters. With the trace symplectic pairing fixed, the splitting is independent of the trace-zero δ used to express the construction.
  TauCeti.Metaplectic.unitarySplitting_cocycle [api]: Each splitting cochain cancels the pulled-back scalar cocycle.
  TauCeti.Metaplectic.unitarySplitting_character_change [api]: If χ is replaced by χη with η|F×=1, transport η to η̃:E¹→C× by η̃(x/xᶜ)=η(x). Changing χV twists the W-factor by η̃∘det; changing χW twists the V-factor by η̃∘det.
  TauCeti.Metaplectic.unitarySplitting_delta [api]: For the fixed trace symplectic space and ψ,χV,χW, changing the auxiliary trace-zero δ leaves the splitting unchanged.
  TauCeti.Metaplectic.unitarySplitting_zero [tests]: For V=0 the oscillator carrier is the line ℂ. On the unitary W factor its action is χV∘ι⁻¹∘det, where ι:E×/F×→E¹ sends x to x/xᶜ. For χV=1 this line is trivial; a valid nontrivial character trivial on F× need not act trivially.
  TauCeti.Metaplectic.unitarySplitting_restriction [tests]: A character whose restriction to F× is not ωE/F^dim V is rejected as splitting data.
  TauCeti.Metaplectic.unitarySplitting_twist [tests]: Two valid characters differing by η trivial on F× produce η̃∘det, where η̃(x/xᶜ)=η(x). Testing ξ directly on det∈E¹ would miss the Hilbert-90 transport.

MetaplecticAutomorphicForms:MP.3/big-theta-module — Big theta module
Emitted: native algebraic tensor coinvariants and invariant-map universal property. H-equivariance now requires commuting G,H actions. Missing: SR.3 smooth dual and admissibility, the actual maximal π-isotypic quotient and smooth tensor–Hom adjunction. The algebraic universal map is recorded separately from the full source Hom identity.
  TauCeti.Metaplectic.bigTheta_isotypic [api]: The maximal π-isotypic quotient of S is π⊗Θ(π).

MetaplecticAutomorphicForms:MP.3/small-theta-module — Small theta quotient
Emitted: quotient by a specified native submodule and its quotient-map universal property, including zero and simple-quotient fragments. Missing: construction of the actual maximal semisimple quotient in the finite-length smooth category and identification of its radical. No semisimplicity assertion survives for an arbitrary submodule.
  TauCeti.Metaplectic.smallTheta_semisimple [api]: θ(π) is semisimple in the supplied smooth category.

MetaplecticAutomorphicForms:MP.3/theta-finite-length — Finite length of theta modules
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The generic SR criteria are requested; the exact archimedean finite-generation proof and its globalization/automatic-continuity bridge remain unverified. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.0:abelian-category, SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3, AutomorphicFormsOnReductiveGroups:AF.1.
  TauCeti.Metaplectic.bigTheta_finiteLength [target]: For a type-I reductive dual pair over a nonarchimedean characteristic-zero local field and irreducible admissible π, Θ(π) is an admissible smooth H-module of finite length. At archimedean places state the corresponding finitely generated admissible (g,K)-module result on the oscillator Harish-Chandra module, with its own source gate.

MetaplecticAutomorphicForms:MP.3/howe-duality — Howe duality
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Gan–Takeda proof continuation PDF11–21 and its type-II/MVW inputs need complete proof closure; the full quaternionic Gan–Sun theorem and archimedean Howe/automatic-continuity sources remain requested.; Gan–Ichino18 and Gan–Savin23 invoke classical Howe duality. Their invocation is read; Howe’s archimedean original proof and its Harish-Chandra/globalization comparison have not been read here. Supply the full real/complex theorem with exact categories before closing this node. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3, AutomorphicFormsOnReductiveGroups:AF.1.
  TauCeti.Metaplectic.howeDuality [target]: For an orthogonal–symplectic or unitary type-I pair over a nonarchimedean local field of characteristic different from two, θ(π) is zero or irreducible, and nonzero θ(π)≃θ(π′) implies π≃π′. This includes residue characteristic two. For quaternionic pairs use the additional theorem explicitly, rather than treating Gan–Takeda’s partial quaternionic statement as full Howe duality. For real or complex type-I pairs, use the archimedean Howe theorem in the appropriate Harish-Chandra/smooth-globalization category; this is a separate original-source input, not a consequence of Gan–Takeda’s nonarchimedean theorem.

MetaplecticAutomorphicForms:MP.3/local-see-saw — Local see-saw identity
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Kudla IV.1 pp59–66 has been read. Its common oscillator, sum tensorization and specialized application supply the route; a general native smooth tensor–Hom/dual adjunction, with the exact infinite-dimensional dual and admissibility conditions, remains to be supplied from SR and the unread original references. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.0:abelian-category, SmoothRepresentationsOfLocalGroups:SR.2, AutomorphicFormsOnReductiveGroups:AF.1.
  TauCeti.Metaplectic.localSeeSaw [target]: For a see-saw of commuting dual pairs inside one symplectic space with compatible splittings, identify HomH1(ΘG1(π1),π2) with HomH2(ΘG2(π2∨),π1∨), after writing the common oscillator Hom space and its exact tensor/dual conventions. State the identity first for big theta coinvariants; a small-theta version needs semisimplicity/Howe hypotheses.

MetaplecticAutomorphicForms:MP.3/persistence-and-stable-range — Persistence and stable range
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: In a fixed orthogonal Witt tower V_r=V_0⊕H^r paired with Sp(W), dim W=2n, a nonzero theta lift persists for larger r. Every irreducible admissible genuine π has nonzero theta lift in stable range r≥2n; in the reverse direction a fixed O(V)-representation has nonzero lift when n≥dim V. These are sufficient bounds, not minimal first-occurrence formulas. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3.
  TauCeti.Metaplectic.theta_persistence_stableRange [target]: In a fixed orthogonal Witt tower V_r=V_0⊕H^r paired with Sp(W), dim W=2n, a nonzero theta lift persists for larger r. Every irreducible admissible genuine π has nonzero theta lift in stable range r≥2n; in the reverse direction a fixed O(V)-representation has nonzero lift when n≥dim V. These are sufficient bounds, not minimal first-occurrence formulas.

MetaplecticAutomorphicForms:MP.3/supercuspidal-first-occurrence — Supercuspidal first occurrence
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For a supercuspidal π in Kudla’s nonarchimedean orthogonal–symplectic range, let r₀ (respectively n₀ in the reverse direction) be first occurrence. At every larger rank the big lift is irreducible admissible and equals the small lift. At first occurrence it is supercuspidal; above first occurrence it is not supercuspidal and embeds in the normalized parabolic induction of the first lift with the explicit tower characters of III.6 Theorems6.1–6.2. Do not extend this big=small assertion to arbitrary nonsupercuspidal π. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3.
  TauCeti.Metaplectic.supercuspidal_firstOccurrence [target]: For a supercuspidal π in Kudla’s nonarchimedean orthogonal–symplectic range, let r₀ (respectively n₀ in the reverse direction) be first occurrence. At every larger rank the big lift is irreducible admissible and equals the small lift. At first occurrence it is supercuspidal; above first occurrence it is not supercuspidal and embeds in the normalized parabolic induction of the first lift with the explicit tower characters of III.6 Theorems6.1–6.2. Do not extend this big=small assertion to arbitrary nonsupercuspidal π.

MetaplecticAutomorphicForms:MP.3/kudla-jacquet-filtration — Kudla’s Jacquet filtration
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For Q(X_a)⊂G(W_n), the normalized Jacquet module of ω has a finite filtration with kth quotient, 0≤k≤min(a,q_V), equal to normalized induction from Q(X_{a−k},X_a)×G(W_{n−2a})×P(Y_k) of χV|det X_{a−k}|^{s_{m,n}+(a−k)/2}⊗Cc∞(Isom_{E,c}(X_k,Y_k))⊗ω_{smaller}. Here s_{m,n}=(m−n−ε₀)/2 and (b,c) acts on f(g) by χV(det b)χW(det c)f(c⁻¹gb). Supplier categories: SmoothRepresentationsOfLocalGroups:SR.0:abelian-category, SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3.
  TauCeti.Metaplectic.oscillator_jacquetFiltration [target]: For Q(X_a)⊂G(W_n), the normalized Jacquet module of ω has a finite filtration with kth quotient, 0≤k≤min(a,q_V), equal to normalized induction from Q(X_{a−k},X_a)×G(W_{n−2a})×P(Y_k) of χV|det X_{a−k}|^{s_{m,n}+(a−k)/2}⊗Cc∞(Isom_{E,c}(X_k,Y_k))⊗ω_{smaller}. Here s_{m,n}=(m−n−ε₀)/2 and (b,c) acts on f(g) by χV(det b)χW(det c)f(c⁻¹gb).

MetaplecticAutomorphicForms:MP.3/doubling-filtration — Doubling principal-series filtration
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For I(s)=normalized Ind_{Siegel}^{G(W⊕W⁻)}χV|det|^s, its restriction to G(W)×G(W) has rank-t quotients induced from Q_t×Q_t with characters χV|det X_t|^{s+t/2} on both GL_t factors and χV(det W⁻_{n−2t})⊗Cc∞(G(W_{n−2t})) on the remaining factors. The open-orbit quotient R_0=χV(det W⁻)⊗Cc∞G(W) is independent of s. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3.
  TauCeti.Metaplectic.doubling_rankFiltration [target]: For I(s)=normalized Ind_{Siegel}^{G(W⊕W⁻)}χV|det|^s, its restriction to G(W)×G(W) has rank-t quotients induced from Q_t×Q_t with characters χV|det X_t|^{s+t/2} on both GL_t factors and χV(det W⁻_{n−2t})⊗Cc∞(G(W_{n−2t})) on the remaining factors. The open-orbit quotient R_0=χV(det W⁻)⊗Cc∞G(W) is independent of s.

MetaplecticAutomorphicForms:MP.3/type-ii-theta — Type-II theta input
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Mínguez’s original proof and the full unequal-rank parameter formula have not been read; only the cited input needed by Gan–Takeda is planned. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3.
  TauCeti.Metaplectic.typeII_theta [target]: For the split type-II pair GL_m(F)×GL_n(F), the small theta lift of an irreducible smooth representation is zero or irreducible, and nonzero lifts determine the source representation uniquely. The unequal-rank parameter formula used by a boundary argument is a separately requested Mínguez input; no general n<m vanishing is asserted.

MetaplecticAutomorphicForms:MP.3/mvw-and-cover-induction — MVW involution and metaplectic induction
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Original MVW irreducible-duality proof and real-cover variant remain supplier/source requests; a cited use does not close those proofs. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.0:abelian-category, SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3, AutomorphicFormsOnReductiveGroups:AF.1.
  TauCeti.Metaplectic.mvw_coverInduction [target]: Transport the native smooth dual/induction operations to the canonical split unipotent radicals of Mp. The MVW involution is an exact covariant functor and for irreducible π gives π^MVW≃π∨; it is not the contragredient functor on every module. On a standard Levi GL_k×Mp_{2n−2k}, τ̃ψ=(τ∘projection)⊗χψ has central −1 acting by −1 and determines normalized parabolic induction.

MetaplecticAutomorphicForms:MP.3/nonarchimedean-conservation — Nonarchimedean conservation relations
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For the two enhanced Witt towers differing by the anti-split class in Sun–Zhu, the dimension first-occurrence indices satisfy n_t₁(π)+n_t₂(π)=2 dim_D U+d_{D,ε}. Here d is 4 for orthogonal, 2 for unitary, 1 for quaternionic Hermitian, 3 for quaternionic skew-Hermitian and 0 for symplectic U. In particular an Sp_{2n} representation in the two even-orthogonal towers has dimension sum 4n+4, and for O(V) the symplectic rank indices of π and π⊗det sum dim V. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.3.
  TauCeti.Metaplectic.theta_conservation [target]: For the two enhanced Witt towers differing by the anti-split class in Sun–Zhu, the dimension first-occurrence indices satisfy n_t₁(π)+n_t₂(π)=2 dim_D U+d_{D,ε}. Here d is 4 for orthogonal, 2 for unitary, 1 for quaternionic Hermitian, 3 for quaternionic skew-Hermitian and 0 for symplectic U. In particular an Sp_{2n} representation in the two even-orthogonal towers has dimension sum 4n+4, and for O(V) the symplectic rank indices of π and π⊗det sum dim V.

MetaplecticAutomorphicForms:MP.3/archimedean-conservation — Archimedean first-occurrence cases
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The cited degenerate-principal-series and archimedean Howe/automatic-continuity inputs are not proved here; §7 references are recorded as requests. Supplier categories: AutomorphicFormsOnReductiveGroups:AF.1.
  TauCeti.Metaplectic.theta_archimedeanFirstOccurrence [target]: For real/complex orthogonal U, n_t₁(π)+n_t₂(π)=2 dim U for the towers differing by the sign class. For complex symplectic or real quaternionic Hermitian U there is no two-tower conservation relation: the parity-compatible first occurrence is at most dim U or dim U+1. For real symplectic, complex unitary, or real quaternionic skew-Hermitian U, each K_U-coset T has a distinct pair with dimension sum 2 dim U+d; every other pair has sum at least 2 dim U+d|t₃−t₄|, and the two minima modulo 2K_U sum 2 dim U+d.

MetaplecticAutomorphicForms:MP.3/unitary-equal-almost-equal-rank — Unitary equal and almost equal rank
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: LLC/root-number supplier stage and original theta-dichotomy proofs require an exact owner mapping; the packet requests that mapping rather than inventing an existing declaration. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.3, ModularityAndLanglandsExtensions:ML.4.
  TauCeti.Metaplectic.unitaryTheta_equalAlmostEqualRank [target]: For tempered π of U(W_n) over a nonarchimedean characteristic-zero F, equal-rank theta to U(V_n^ε) is nonzero in exactly one sign, determined by ε(1/2,φπχV⁻¹,ψ₂^E)=εε′, and its parameter is φπχV⁻¹χW. For rank n+1, if χV is absent from φπ both signs are nonzero, while if χV occurs exactly one sign is nonzero; the lifted parameter is (φπχV⁻¹χW)⊕χW. In these stated tempered ranges the big nonzero lift is irreducible.

MetaplecticAutomorphicForms:MP.3/unitary-doubling-dichotomy — Unitary doubling multiplicity and dichotomy
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Li–Liu’s broader semisimplicity assertion refers to the same argument as Gan–Ichino; matching that argument to its complete hypotheses remains open (existing paper finding E15). Supplier categories: AutomorphicFormsOnReductiveGroups:AF.1.
  TauCeti.Metaplectic.unitaryTheta_doublingDichotomy [target]: In Li–Liu Assumption3.1’s rank-2r skew-Hermitian setting, the two equal-rank Hermitian theta choices give the local dichotomy of Proposition3.6 and the local doubling Hom space has dimension at most one. Keep its assertion that the relevant big theta module is semisimple as a separate source/proof gate; Gan–Ichino’s scoped irreducibility theorem alone does not prove that broader assertion.

MetaplecticAutomorphicForms:MP.3/mp-odd-orthogonal-unramified — Unramified metaplectic theta and induction
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: PDF24 start of Lemma6.8 and every removed-pair exponent must be collated before the smaller-tower parameter signature is closed; this node does not substitute an unqualified Satake assertion. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.3.
  TauCeti.Metaplectic.mpTheta_unramifiedInduction [target]: For nonarchimedean odd-residue F and ψ of conductor O_F, the standard compact splitting identifies unramified genuine Mp₂n representations with unramified principal-series constituents induced from χψ|·|^{s_i}. The ψ-relative parameter is ⊕i(|·|^{s_i}⊕|·|^{−s_i}). Smaller odd-orthogonal towers obey the first-occurrence vanishing and induction principle of Gan–Ichino Lemmas6.3,6.8,6.10, with the removed character pairs and their modulus factors explicit.

MetaplecticAutomorphicForms:MP.3/rallis-unramified-satake — Rallis unramified theta parameters
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Ral82 original local computation is cited but unread; the exact dimension-dependent segment remains a source gate rather than an invented formula. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.3, AdelicAlgebraicGroups:AA.2.
  TauCeti.Metaplectic.theta_unramifiedSatake [target]: Relate the spherical Hecke characters of a nonzero local theta lift by Rallis’s L-group map, including the additional SL₂/principal-series segment specified by the dimension difference. For the orthogonal–symplectic instances of Chenevier–Taïbi §5.3.2, keep the local Satake relation separate from their global level-one multiplicity computation.

MetaplecticAutomorphicForms:MP.3/unitary-hecke-compatibility — Unitary theta Hecke compatibility
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The original Liu spherical module theorem and split-place AppendixA computation are unread; the broader tempered big-lift semisimplicity cited in Proposition3.9 remains the same explicit proof gate. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.3, AdelicAlgebraicGroups:AA.2.
  TauCeti.Metaplectic.unitaryTheta_hecke [target]: For Li–Liu’s unramified/almost-unramified and split local places, the oscillator spherical module induces the surjective Hecke map θ^R:H^R_W→T^R, and the π Hecke character factors through it. The operator on the theta output has the contragredient/conjugate character χπ(s)^c. At ramified odd places of Li–Liu22, use the special compact K_r and the trace-self-dual lattice indicator, not the unramified hyperspecial vector.

MetaplecticAutomorphicForms:MP.1/smooth-stone-von-neumann — Smooth Stone–von Neumann theorem
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Kudla and Sun–Zhu both refer this proof to MVW 2.I.2; that book proof has not been read. The smooth uniqueness and scalar Schur step remain explicit proof gaps until a matching source is checked. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.0:abelian-category, SmoothRepresentationsOfLocalGroups:SR.3.
  TauCeti.Metaplectic.smooth_stoneVonNeumann [target]: For a finite-dimensional symplectic space over a nonarchimedean local field of characteristic different from two and a nontrivial continuous unitary ψ, every irreducible smooth complex representation of H(W) with central character ψ is isomorphic to the Schrödinger model. Its Heisenberg intertwining endomorphism algebra is C.

MetaplecticAutomorphicForms:MP.1/unitary-stone-von-neumann — Unitary Stone–von Neumann theorem
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Garrett’s real proof supplies the route with the two recorded textual corrections; its Schwartz Fourier-density step, the complex reduction and nonarchimedean unitary analogue still need analytic proof closure and native irreducibility formulation.
  TauCeti.Metaplectic.unitary_stoneVonNeumann [target]: Every irreducible strongly continuous unitary representation of the real Heisenberg group with nontrivial unitary central character is unitarily equivalent to L²(X); all unitary representations with that character are Hilbert multiplicities of it. The complex local-field Heisenberg statement is obtained by viewing its alternating pairing and character on the underlying real group.

MetaplecticAutomorphicForms:MP.1/scalar-normalizer-extension — Unitary normalizer extension
Emitted: the covariance subgroup of G×unitary(H→L[ℂ]H), its two homomorphism projections, and the one-dimensional scalar test with trivial G. Missing: the actual nonzero irreducible Heisenberg model, scalar-kernel Schur theorem, strong operator topology and local charts. The real nonsplitting target is for its normalized μ₂ restriction, not for arbitrary G or its circle extension.
  TauCeti.Metaplectic.scalarNormalizer_kernel [tests]: Any pair above g=1 is exactly a unique scalar z·id with |z|=1.
  TauCeti.Metaplectic.scalarNormalizer_nonsplitting [tests]: For W≠0 over R the normalized μ₂ subextension does not admit a continuous homomorphic section; arbitrary lift choice does not prove a splitting.

MetaplecticAutomorphicForms:MP.1/intertwiner-lines — Scalar ambiguity and composition of intertwiners
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For each g∈Sp(W), the smooth intertwiner space between ρ and its g-twist is a one-dimensional C vector space; its nonzero operators are invertible. Choosing A_g with A_1=1 yields A_gA_h=c(g,h)A_{gh}, where c is a normalized scalar factor set. Rescaling A_g by b(g) changes c by b(g)b(h)/b(gh). If the chosen A_g are unitary operators, the resulting cocycle scalars have norm one; arbitrary nonzero intertwiners need not have that normalization.
  TauCeti.Metaplectic.intertwinerLine_dim [target]: For each g∈Sp(W), the smooth intertwiner space between ρ and its g-twist is a one-dimensional C vector space; its nonzero operators are invertible. Choosing A_g with A_1=1 yields A_gA_h=c(g,h)A_{gh}, where c is a normalized scalar factor set. Rescaling A_g by b(g) changes c by b(g)b(h)/b(gh). If the chosen A_g are unitary operators, the resulting cocycle scalars have norm one; arbitrary nonzero intertwiners need not have that normalization.

MetaplecticAutomorphicForms:MP.2/weil-index — Weil index
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: AL.0 Part II must supply Fourier transforms of oscillatory distributions and finite-dimensional self-dual measure; the native Fourier integral on integrable functions cannot itself define γ. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion, AutomorphicLFunctionsAndLocalFactors:AL.0.
  TauCeti.Metaplectic.weilIndex [target]: For a nondegenerate quadratic form q on F^d, define γψ(q)∈U(1) as the scalar in the Fourier transform of the oscillatory distribution ψ∘q: with positive Fourier kernel ψ(x·y) and coordinate self-dual Haar, its transform at y is γψ(q)|det Bq|⁻¹/²ψ(−q(Bq⁻¹y)), where Bq(x,y)=q(x+y)−q(x)−q(y). In the Bq-self-dual measure this is γψ(q)ψ(−q(y)). This is not an absolutely convergent integral over F^d.
  TauCeti.Metaplectic.weilIndex_distribution [api]: The Fourier transform identity above characterizes γψ(q).
  TauCeti.Metaplectic.weilIndex_norm [api]: |γψ(q)|=1.
  TauCeti.Metaplectic.weilIndex_isometry [api]: Isometric quadratic forms have equal Weil index.
  TauCeti.Metaplectic.weilIndex_gaussSum [api]: For ψq-trivial L, γ is the unit normalization of vol(L)Σ_{L′/L}ψ(q(x)).
  TauCeti.Metaplectic.weilIndex_zero [tests]: The zero-dimensional form has γ=1.
  TauCeti.Metaplectic.weilIndex_real [tests]: For ψ(t)=e^{2πit} on R, γψ(ax²)=e^{πi sgn(a)/4} for a≠0.
  TauCeti.Metaplectic.weilIndex_q2 [tests]: For ψ₂(t)=e^{−2πi frac₂(t)} on Q₂, γψ₂(x²)=(1−i)/√2, from the lattice quotient ½Z₂/Z₂.
  TauCeti.Metaplectic.weilIndex_hyperbolic [tests]: The hyperbolic form xy has index one with the same Fourier convention.

MetaplecticAutomorphicForms:MP.2/weil-index-identities — Weil index and Hilbert symbol
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: The index is multiplicative under orthogonal sums, invariant under isometry and trivial on hyperbolic planes, with γψ(−q)=γψ(q)⁻¹. For η=ψ/2 define γ(a,η)=γ(η a x²)/γ(η x²). Then γ(ab,η)=(a,b)F γ(a,η)γ(b,η), γ(a,ηb)=(a,b)F γ(a,η), γ(a,η)²=(−1,a)F and γ(a,η)⁴=1. If q=Σa_ix_i², γψ(q)=γ(det q,ψ)γψ(x²)^d∏_{i<j}(a_i,a_j)F; det q means ∏a_i, not det Bq=2^d∏a_i.
  TauCeti.Metaplectic.weilIndex_hilbertSymbol [target]: The index is multiplicative under orthogonal sums, invariant under isometry and trivial on hyperbolic planes, with γψ(−q)=γψ(q)⁻¹. For η=ψ/2 define γ(a,η)=γ(η a x²)/γ(η x²). Then γ(ab,η)=(a,b)F γ(a,η)γ(b,η), γ(a,ηb)=(a,b)F γ(a,η), γ(a,η)²=(−1,a)F and γ(a,η)⁴=1. If q=Σa_ix_i², γψ(q)=γ(det q,ψ)γψ(x²)^d∏_{i<j}(a_i,a_j)F; det q means ∏a_i, not det Bq=2^d∏a_i.

MetaplecticAutomorphicForms:MP.2/leray-form — Leray quadratic form
Emitted: the graph quadratic map ½ω(y,Ty), transport under isometry and coordinate sign/zero tests. Missing: the actual Lagrangian triple, isotropic R, R⊥/R and images (Lj∩R⊥+R)/R, its nondegenerate descent, and the comparison with the graph model. The generic quotient-coordinate test only detects why quotienting Lj∩R⊥ by R is ill-typed.
  TauCeti.Metaplectic.lerayForm_reduction [api]: The general triple is the transverse construction on its reduced symplectic quotient.

MetaplecticAutomorphicForms:MP.2/leray-cocycle — Leray cocycle of intertwiners
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Kudla refers the integral-composition proof to Rao; exact quotient integral normalizations must be checked before promoting this proof route to closure.
  TauCeti.Metaplectic.leray_cocycle [target]: For the unitary normalized integral operators r_Y(g), their factor set is c_Y(g₁,g₂)=γψ(L(Y,Yg₁⁻¹,Yg₂⁻¹g₁⁻¹))=γψ(L(Y,Yg₂⁻¹,Yg₁)). This obeys normalization and the two-cocycle identity because it computes actual operator composition.

MetaplecticAutomorphicForms:MP.1/rao-factor-set — Rao factor set
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Bruhat x(g), j(g), Leray rank and t-integrality still require their full sourced definitions/proofs; the formula specifies the target but does not conceal those data as arbitrary functions.
  TauCeti.Metaplectic.raoFactorSet [target]: Relative to Y, write j(g)=rank(c_g) and x(g)∈F×/(F×)² for the Bruhat square class. For q=L(Y,Yg₂⁻¹,Yg₁), let t=(j(g₁)+j(g₂)−j(g₁g₂)−dim q)/2. Define the μ₂-valued Rao factor set by (x₁,x₂)(−x₁x₂,x₁₂)(−1,det(2q))^t(−1,−1)^{t(t−1)/2}Hasse(2q). Its normalization and cocycle equation make a native FactorSet with trivial μ₂ action.
  TauCeti.Metaplectic.raoFactorSet_values [api]: Its values lie in μ₂.
  TauCeti.Metaplectic.raoFactorSet_cocycle [api]: c(g,h)c(gh,k)=c(g,hk)c(h,k).
  TauCeti.Metaplectic.raoFactorSet_beta [api]: The displayed β cochain converts it to the integral-operator cocycle.
  TauCeti.Metaplectic.raoFactorSet_identity [tests]: c(1,g)=c(g,1)=1.
  TauCeti.Metaplectic.raoFactorSet_rankOne [tests]: For SL₂, x(g)=c if c≠0 and x(g)=d otherwise; the factor is (x₁,x₂)(−x₁x₂,x₁₂).
  TauCeti.Metaplectic.raoFactorSet_levi [tests]: In rank one, restriction to diagonal matrices has factor (a,b)F and generally does not split over the entire Levi.

MetaplecticAutomorphicForms:MP.1/genuine-oscillator — Genuine Weil representation
Emitted: restriction of the supplied unitary normalizer action to ker lambda2 and its identity test. Missing: identification of the distinguished central −1, its action on the actual nonzero oscillator, zero-dimensional sign carrier and model-change intertwiner. An arbitrary element z, particularly z=1, cannot be assigned action −id.
  TauCeti.Metaplectic.weilRepresentation_central [api]: ωψ(1,−1)=−id.
  TauCeti.Metaplectic.weilRepresentation_modelChange [api]: A unitary Heisenberg model intertwiner conjugates the intrinsic cover action; changing its scalar leaves this equivalence unchanged.
  TauCeti.Metaplectic.weilRepresentation_zero [tests]: For W=0, μ₂ acts on C by its sign character.
  TauCeti.Metaplectic.weilRepresentation_genuine [tests]: In a nonzero model the two lifts of the same g have opposite operators.

MetaplecticAutomorphicForms:MP.2/generator-operators — Weil operators on generators
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: In the polarized nonarchimedean model, the scalar-normalized integral operators satisfy r(m(a))φ(x)=|det a|^{1/2}φ(xa), r(n(b))φ(x)=ψ(½x bᵗx)φ(x), and r(w) is the self-dual Fourier operator for the explicitly chosen w. The double-cover action is εβ(g)r(g), hence the Levi acquires the Weil-index character and Fourier the corresponding Weil factor. For an orthogonal space V of dimension m, ω(m(a),ε)φ(x)=χV,ψ(det a,ε)|det a|^{m/2}φ(xa), ω(n(b))φ(x)=ψ(½tr(b·Gram(x)))φ(x), and ω(w)φ=γ(ψ∘V)^{−n} times the negative-kernel Fourier transform for Kudla’s w. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion.
  TauCeti.Metaplectic.weil_generators [target]: In the polarized nonarchimedean model, the scalar-normalized integral operators satisfy r(m(a))φ(x)=|det a|^{1/2}φ(xa), r(n(b))φ(x)=ψ(½x bᵗx)φ(x), and r(w) is the self-dual Fourier operator for the explicitly chosen w. The double-cover action is εβ(g)r(g), hence the Levi acquires the Weil-index character and Fourier the corresponding Weil factor. For an orthogonal space V of dimension m, ω(m(a),ε)φ(x)=χV,ψ(det a,ε)|det a|^{m/2}φ(xa), ω(n(b))φ(x)=ψ(½tr(b·Gram(x)))φ(x), and ω(w)φ=γ(ψ∘V)^{−n} times the negative-kernel Fourier transform for Kudla’s w.

MetaplecticAutomorphicForms:MP.2/operator-relations — Generator relations and intrinsic comparison
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Weil’s big-cell proof continuation and the complete presentation-to-operator calculation must be checked; this node records the exact comparison target rather than assuming all generator formulas define a representation.
  TauCeti.Metaplectic.weil_generatorRelations [target]: The unipotent, Levi and Fourier operators satisfy their presentation relations with exactly the Rao central factors; their action is the intrinsic genuine representation obtained from the normalizer. In particular Fourier squared is reflection times its Weil scalar, and conjugating a unipotent by Fourier gives the opposite unipotent with its prescribed phase.

MetaplecticAutomorphicForms:MP.3/quaternionic-similitude-datum — Quaternionic similitude dual pair
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Quaternionic Hermitian and connected similitude carriers are imported from upstream; exact layer mapping is requested.
  TauCeti.Metaplectic.quaternionSimilitudeEmbedding [target]: Let B=E⊕Ej over F, E=F(i), i²=u, j²=J. For a right skew-Hermitian B-space V of rank m with diagonal κ_i i and the left Hermitian line W=B, construct the F-symplectic space V⊗B W with pairing (1/2)Tr_{B/F}(the tensor product of the skew-Hermitian and Hermitian pairings). The matched subgroup G={(g,h)∈GU(V)^0×B×:ν(g)=ν(h)∈N_{E/F}(E×)} acts by g⁻¹v⊗wh. The bases e_i⊗1,e_i⊗j and e_i⊗i,e_i⊗ij give X,Y.
  TauCeti.Metaplectic.quaternionTensor_pairing [api]: The pairing is half the reduced trace.
  TauCeti.Metaplectic.quaternionSimilitude_invariant [api]: Matched multipliers preserve the tensor pairing.
  TauCeti.Metaplectic.quaternionPolarization [api]: X,Y span complementary Lagrangians.
  TauCeti.Metaplectic.quaternionTensor_rankOne [tests]: At m=1 each Lagrangian has F-dimension2.
  TauCeti.Metaplectic.quaternionTensor_zero [tests]: At m=0 the tensor space is zero.
  TauCeti.Metaplectic.quaternionTensor_mismatch [tests]: Unequal multipliers rescale the pairing, hence do not give a symplectic isometry.

MetaplecticAutomorphicForms:MP.3/quaternionic-splitting — Quaternionic similitude splitting
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Original Kudla unitary and Periods-I/II splittings remain unread inputs. Existing E6 replaces s(g₂) by s_v(g₂).
  TauCeti.Metaplectic.quaternionSplitting [target]: Construct s_v:G_v→C¹ with z_Y(g₁,g₂)=s_v(g₁g₂)/(s_v(g₁)s_v(g₂)). It obeys s_v(zg)=ξE_v(z)^m s_v(g), agrees with the standard compact splitting almost everywhere, and ∏v s_v(γ)=1 for γ∈G(F). This splits the scalar-circle cover on the norm-image subgroup; no μ₂ splitting is inferred.
  TauCeti.Metaplectic.quaternionSplitting_cocycle [api]: The cochain cancels z_Y in the stated quotient direction.
  TauCeti.Metaplectic.quaternionSplitting_central [api]: Central scalars give ξE(z)^m.
  TauCeti.Metaplectic.quaternionSplitting_auxiliary [api]: The result is independent of α and auxiliary χ.
  TauCeti.Metaplectic.quaternionSplitting_identity [tests]: s_v(1)=1.
  TauCeti.Metaplectic.quaternionSplitting_character [tests]: An odd-rank scalar with ξE(z)=−1 acts by −1.
  TauCeti.Metaplectic.quaternionSplitting_product [tests]: For rational γ the product of local values is1.

MetaplecticAutomorphicForms:MP.3/quaternionic-first-doubled-splitting — First doubled quaternionic splitting
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: On U(V⊕V⁻), ŝ₁ is1 for split B and (−1)^j on a Bruhat stratum for division B. It cancels z_{V△}, is invariant under E× conjugation, and on the norm-one scalar embedding α has value1 if α=1 and (−1)^m otherwise in the division case.
  TauCeti.Metaplectic.quaternionSplitting_firstDoubled [target]: On U(V⊕V⁻), ŝ₁ is1 for split B and (−1)^j on a Bruhat stratum for division B. It cancels z_{V△}, is invariant under E× conjugation, and on the norm-one scalar embedding α has value1 if α=1 and (−1)^m otherwise in the division case.

MetaplecticAutomorphicForms:MP.3/quaternionic-second-doubled-splitting — Second doubled quaternionic splitting
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For the doubled unitary W-model, ŝ₂(h)=χ(x(h))^mγ^{−j(h)}, γ=(u,det V)_F γ_F(−u,ψ/2)^mγ_F(−1,ψ/2)^{−m}. It is invariant under E× conjugation. The diagonal norm-one scalar gives χ(α)^{−2m}; the mixed embedding of A.7 gives χ(α)^{−m} times1 for split B and (−1)^m for division B.
  TauCeti.Metaplectic.quaternionSplitting_secondDoubled [target]: For the doubled unitary W-model, ŝ₂(h)=χ(x(h))^mγ^{−j(h)}, γ=(u,det V)_F γ_F(−u,ψ/2)^mγ_F(−1,ψ/2)^{−m}. It is invariant under E× conjugation. The diagonal norm-one scalar gives χ(α)^{−2m}; the mixed embedding of A.7 gives χ(α)^{−m} times1 for split B and (−1)^m for division B.

MetaplecticAutomorphicForms:MP.3/quaternionic-sharp-descent — Sharp splitting and norm-one descent
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: On G^sharp={(g,h,α,α):ν(g)=ν(h)=Nα}, set ŝ^sharp=χ(α)^{−m}ŝ₁(ι(gα⁻¹,1))ŝ₂(ι(hα⁻¹,1))z_{V△}(ι(gα⁻¹,1),ι(hα⁻¹,1)). Define μ(σ)=z_{Y□}(σ₀,σ)⁻¹z_{Y□}(σ₀σσ₀⁻¹,σ₀), so z_{Y□}=z_{V△}δμ. Put s^sharp=ŝ^sharp·μ and s₂=ŝ₂·μ on their respective embedded groups. Descend s(g,h)=s^sharp(g,h,α,α)/s₂(ι(1,[α,α])). LemmaA.10 proves independence of the norm lift using LemmaA.9; LemmaA.12 cancels auxiliary χ.
  TauCeti.Metaplectic.quaternionSplitting_sharpDescent [target]: On G^sharp={(g,h,α,α):ν(g)=ν(h)=Nα}, set ŝ^sharp=χ(α)^{−m}ŝ₁(ι(gα⁻¹,1))ŝ₂(ι(hα⁻¹,1))z_{V△}(ι(gα⁻¹,1),ι(hα⁻¹,1)). Define μ(σ)=z_{Y□}(σ₀,σ)⁻¹z_{Y□}(σ₀σσ₀⁻¹,σ₀), so z_{Y□}=z_{V△}δμ. Put s^sharp=ŝ^sharp·μ and s₂=ŝ₂·μ on their respective embedded groups. Descend s(g,h)=s^sharp(g,h,α,α)/s₂(ι(1,[α,α])). LemmaA.10 proves independence of the norm lift using LemmaA.9; LemmaA.12 cancels auxiliary χ.

MetaplecticAutomorphicForms:MP.3/quaternionic-see-saw-compatibility — Quaternionic see-saw and Periods-II comparison
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The original Periods-II splitting remains unread; AppendixA supplies the comparison.
  TauCeti.Metaplectic.quaternionSplitting_seeSaw [target]: For an orthogonal sum V=V′⊕V″ with matched similitude triple, s=s′s″ on the see-saw restriction. In rank-one Periods-II conventions, s^natural(α,h)=s(α,h)χ(α)⁻¹.

MetaplecticAutomorphicForms:MP.3/periods-i-comparison — Periods-I splitting comparison
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The original Periods-I construction is an unread referenced input.
  TauCeti.Metaplectic.quaternionSplitting_periodsI [target]: For m=2, V=B₁⊗E B₂, J₁J₂=J, κ₁=1, κ₂=−J₁, the ratio ζ=tilde s/s is an automorphic character. If F is totally real, E totally imaginary and B₁,B₂ split at one common real place, ζ=1 at every local place.

MetaplecticAutomorphicForms:MP.3/periods-i-first-scalar-calculation — First scalar splitting calculation
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For α=a+bi with a,b≠0, tilde s(1,α,α)=γ_F(J₁,ψ/2)(−2abJ₂,J₁)_F; ŝ₂(ι([α,α],1))=χ(α)⁻²(u,J₁)_F; μ on that matrix is γ_F(J₁,ψ/2)(−2abuJ₂,J₁)_F. Together these give s=tilde s on the first E× embedding.
  TauCeti.Metaplectic.quaternionSplitting_scalarA9 [target]: For α=a+bi with a,b≠0, tilde s(1,α,α)=γ_F(J₁,ψ/2)(−2abJ₂,J₁)_F; ŝ₂(ι([α,α],1))=χ(α)⁻²(u,J₁)_F; μ on that matrix is γ_F(J₁,ψ/2)(−2abuJ₂,J₁)_F. Together these give s=tilde s on the first E× embedding.

MetaplecticAutomorphicForms:MP.3/periods-i-second-scalar-calculation — Second scalar splitting calculation
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For α=a+bi with a,b≠0, tilde s(α,α⁻¹,1)=γ_F(J,ψ/2)(−2abJ₁,J)_F; ŝ₁(ι([α,α⁻¹],1))=(u,J)_F; μ is γ_F(J,ψ/2)(−2abuJ₁,J)_F. Together these give s=tilde s on the second E× embedding.
  TauCeti.Metaplectic.quaternionSplitting_scalarA10 [target]: For α=a+bi with a,b≠0, tilde s(α,α⁻¹,1)=γ_F(J,ψ/2)(−2abJ₁,J)_F; ŝ₁(ι([α,α⁻¹],1))=(u,J)_F; μ is γ_F(J,ψ/2)(−2abuJ₁,J)_F. Together these give s=tilde s on the second E× embedding.

MetaplecticAutomorphicForms:MP.3/periods-i-square-quaternion-calculation — Square quaternion splitting calculation
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: When J_i=t_i², the normalized generators j_i^natural=j_i/t_i have both splittings equal to1 on the matrices of A.21–A.23. Combined with the scalar calculations and the negative real generator, this gives (A.11).
  TauCeti.Metaplectic.quaternionSplitting_scalarA11 [target]: When J_i=t_i², the normalized generators j_i^natural=j_i/t_i have both splittings equal to1 on the matrices of A.21–A.23. Combined with the scalar calculations and the negative real generator, this gives (A.11).

MetaplecticAutomorphicForms:MP.3/harris-kudla-morita-comparison — Harris–Kudla splitting comparison
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For split B and idempotent e, V^dagger=Ve and W^dagger=eW have dimensions2m and2; V^dagger has symmetric diagonal (κ_i u/2,−κ_i/2). Set s^dagger(h)=ξE(x(h))^m(γ′)^{−j(h)}, γ′=γ_F(ψ/2)^{2m}γ_F(det V^dagger,ψ/2)Hasse(V^dagger). Extend to similitudes by h↦h d(ν(h))⁻¹. The polarization correction gives s₀=s^daggerμ₀=s.
  TauCeti.Metaplectic.quaternionSplitting_harrisKudla [target]: For split B and idempotent e, V^dagger=Ve and W^dagger=eW have dimensions2m and2; V^dagger has symmetric diagonal (κ_i u/2,−κ_i/2). Set s^dagger(h)=ξE(x(h))^m(γ′)^{−j(h)}, γ′=γ_F(ψ/2)^{2m}γ_F(det V^dagger,ψ/2)Hasse(V^dagger). Extend to similitudes by h↦h d(ν(h))⁻¹. The polarization correction gives s₀=s^daggerμ₀=s.

MetaplecticAutomorphicForms:MP.3/similitude-theta-howe — Similitude theta correspondence
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Original similitude Howe and Clifford inputs must be instantiated; compact induction is supplied by SR.2. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3, AutomorphicFormsOnReductiveGroups:AF.1.
  TauCeti.Metaplectic.similitudeTheta_howe [target]: For the matched multiplier subgroup R⊂G×H^+ and its extended oscillator action, Ω=compact Ind_R^{G×H^+}ω has finite-length big theta quotients. In the classical pairs scoped by Ichino–Prasanna, the small lift is zero or irreducible and injective on its nonzero domain. H^+ is the multiplier-image subgroup.

MetaplecticAutomorphicForms:MP.3/real-discrete-series-theta — Real discrete-series theta lifts
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The original archimedean identification and complete root data remain an AF.1/source gate. Supplier categories: AutomorphicFormsOnReductiveGroups:AF.1.
  TauCeti.Metaplectic.theta_realDiscreteSeries [target]: For ψ_R(t)=exp(2πit), k≥2 and holomorphic SL₂(R) discrete series of weight k+1, theta to O(4,2) restricts to the identity component as A_q₀(0,0,k−2), while its dual lifts as A_q₁(k−2,0,0). q₀ has Levi so(4)+so(2); q₁ has Levi so(2)+so(2,2) and minimal K-type(k,0,0). To O(0,6) the holomorphic lift has highest weight(k−2,0,0), and the dual lift is zero.

MetaplecticAutomorphicForms:MP.3/quaternionic-unramified-theta — Quaternionic unramified theta lift
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Lemma9.4 omits its local calculation; an explicit Hecke computation must close it. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.3, AdelicAlgebraicGroups:AA.2.
  TauCeti.Metaplectic.theta_quaternionUnramified [target]: In Lemma9.4’s odd-residue unramified E/F, split B, self-dual V^dagger and conductor-zero ψ setup, an unramified H^+ constituent of normalized GL₂ induction χ₁⊗χ₂ lifts to the GSO(3,3)-form constituent induced from (χ₁χ₂⁻¹ξE)⊗|·|⊗((χ₂|·|⁻¹/²)∘N_{E/F}), on the source’s torus coordinates.

MetaplecticAutomorphicForms:MP.3/rank-one-oscillator-constituents — Rank-one oscillator constituents
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The §11.4 proof continuation and original rank-one extension theorem require full reading; existing E36 corrects ψ to its conjugate in the theta input.
  TauCeti.Metaplectic.theta_rankOneConstituents [target]: On S(F), the genuine rank-one oscillator splits into even and odd functions ρψ⁺,ρψ⁻. For the split O₃ pair, the corrected Gan–Savin convention uses the conjugate oscillator: Θ(ρbarψ⁻)=St⁻ and 0→St⁺→Θ(ρbarψ⁺)→1→0. These are big-lift assertions; the even big lift is an extension, while its small lift is1.

MetaplecticAutomorphicForms:MP.3/gl2-gso4-theta — GL₂–GSO₄ theta correspondence
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For irreducible generic π of GL₂(F), the similitude theta lift of π∨ to GSO₄≃(GL₂×GL₂)/diagonal center is π⊗π, and theta back from π⊗π is π∨, in Gan–Savin Lemma13.2’s action convention. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.3.
  TauCeti.Metaplectic.theta_gl2Gso4 [target]: For irreducible generic π of GL₂(F), the similitude theta lift of π∨ to GSO₄≃(GL₂×GL₂)/diagonal center is π⊗π, and theta back from π⊗π is π∨, in Gan–Savin Lemma13.2’s action convention.

MetaplecticAutomorphicForms:MP.3/minimal-orthogonal-theta — Minimal orthogonal theta lift
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Yamana Proposition8.4 is invoked for the minimal theta realization but its original proof is unread. GS23 Proposition14.2 and §14.3 prove finite length of the specified Hom modules; the original exceptional realization and generic smooth tensor–Hom/finite-index restriction steps remain supplier inputs. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.3.
  TauCeti.Metaplectic.theta_minimalOrthogonal [target]: For split SO₂n with n=5 or6, the big theta lift of the trivial SL₂ representation is the minimal representation Π_n (the irreducibility is the cited Yamana input). For tempered π of G₂ its Π_n lift to SO₂n−7 has finite length, as in Proposition14.2. For the tensor restriction Sp(V₂)×Sp(V₆)→SO(V₂⊗V₆), the see-saw identifies the relevant Hom module with Hom_{Sp(V₂′)}(Θ′(σ),1); it has finite length as an Sp(V₂)-module, as in §14.3. This is a finite-length assertion, not finite-dimensionality of the entire Hom space.

MetaplecticAutomorphicForms:MP.3/division-ternary-theta — Division ternary theta lift
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The source domain is irreducible supercuspidal rho on PGL2 and its JL(rho) on PB×, as read before GS23 Lemma15.4. The original rank-one Waldspurger/Jacquet–Langlands proofs and exact carrier/psi comparison remain unread supplier inputs. Supplier categories: ModularityAndLanglandsExtensions:ML.4.
  TauCeti.Metaplectic.theta_divisionTernary [target]: Let ρ be an irreducible supercuspidal representation of PGL₂(F), for characteristic-zero nonarchimedean F. If B is the division quaternion algebra, JL(ρ) is its representation on PB×≃SO(B₀,N). With fixed nontrivial ψ, the rank-one theta lift σ_ρ=θ_ψ(JL(ρ)) to Mp₂ is nonzero irreducible, genuine and supercuspidal. This is the classical input in Gan–Savin §15.1; the exceptional lift to G₂ is separately owned.

MetaplecticAutomorphicForms:MP.3/pgsp6-pgso8-similitude-theta — PGSp₆–PGSO₈ similitude theta
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Exact local LLC and Spin representation supplier mapping must be supplied; the generic theta theorem is cited in the source rather than reproved there. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.3, ModularityAndLanglandsExtensions:ML.4.
  TauCeti.Metaplectic.theta_pgsp6Pgso8 [target]: For generic irreducible σ of PGSp₆(F), its classical similitude theta lift to PGSO₈ is nonzero. If σ_b is a constituent on Sp₆, its SO₈ theta lift occurs in the similitude restriction and has standard parameter φ_b⊕1. At unramified places the Satake embedding is Spin₇→Spin₈ with standard representation 1⊕std₇ and the corresponding spin restrictions.

MetaplecticAutomorphicForms:MP.3/pgsp6-theta-dichotomy — PGSp₆ theta dichotomy
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Every irreducible σ of PGSp₆(F) has nonzero theta lift to exactly one of PGO₈ and PGO_{5,1} in Gan–Savin’s two matched towers. Some representations already occur at PGO₆≃PGL₄⋊{±1}; first occurrence determines this case.
  TauCeti.Metaplectic.theta_pgsp6Dichotomy [target]: Every irreducible σ of PGSp₆(F) has nonzero theta lift to exactly one of PGO₈ and PGO_{5,1} in Gan–Savin’s two matched towers. Some representations already occur at PGO₆≃PGL₄⋊{±1}; first occurrence determines this case.

MetaplecticAutomorphicForms:MP.3/relevant-unitary-dichotomy — Relevant unitary local dichotomy
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The original [20,Thm3.10]/[19,Thm1.3(ii)] proof scope and big-lift irreducibility still require collation.
  TauCeti.Metaplectic.theta_relevantDichotomy [target]: For a relevant tempered L-representation π_v in Disegni–Liu’s rank n=2r setting, there is a unique rank-n Hermitian space V_πv for which theta is nonzero, for every embedding L→C. Its lift is tempered irreducible admissible and the double-theta Hom recovers π_v. Keep the stated semisimplicity/irreducibility reference gate separate from Howe duality.

MetaplecticAutomorphicForms:MP.3/theta-coefficient-rationality — Rationality of local theta lifting
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For the same relevant π, let U_π be the finite-place set where π_v is not invariant under every similitude conjugation †a, a∈F_v×. Define Q_π by the open subgroup {a∈Zhat×:a_v∈N(E_v×) for every v∈U_π}. For σ∈Aut(C/Q_π), θ(σιπ_v)≃σθ(ιπ_v). The comparison changes ψ to ψ_a and π to π^{†a}; the norm/symmetry condition removes that change. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0.
  TauCeti.Metaplectic.theta_coefficientRationality [target]: For the same relevant π, let U_π be the finite-place set where π_v is not invariant under every similitude conjugation †a, a∈F_v×. Define Q_π by the open subgroup {a∈Zhat×:a_v∈N(E_v×) for every v∈U_π}. For σ∈Aut(C/Q_π), θ(σιπ_v)≃σθ(ιπ_v). The comparison changes ψ to ψ_a and π to π^{†a}; the norm/symmetry condition removes that change.

MetaplecticAutomorphicForms:MP.2/quadratic-uncertainty — Quadratic uncertainty principle
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The native valuation and finite-dimensional Schwartz carriers must be supplied by AL.0 Part II; the proof and exact strict/non-strict cone definitions were read, including residue characteristic2. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion.
  TauCeti.Metaplectic.weil_quadraticUncertainty [target]: Let (V,q) be a positive-dimensional nondegenerate quadratic space over nonarchimedean F, char F≠2, with conductor-zero ψ and self-dual Fourier transform. If φ∈S(V) has support in {q>0 in valuation, i.e. q∈p_F} and its Fourier transform has support in {q∈O_F}, then φ=0 identically. Corollary8.1.4 says that supp φ⊂{val q>0} and a scalar-multiple Fourier eigenfunction condition also force φ=0.

MetaplecticAutomorphicForms:MP.2/hermitian-uncertainty — Hermitian uncertainty principle
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For a positive-dimensional nondegenerate Hermitian space V over E/F with conjugation c, set q(x)=½Tr_E/F⟨x,x⟩=⟨x,x⟩∈F. Use the Fourier kernel ψ(Tr_E/F⟨x,y⟩) and its self-dual measure. If supp φ⊆{x | val_F⟨x,x⟩>0} and supp φ̂⊆{x | val_F⟨x,x⟩≥0}, then φ=0 by the quadratic uncertainty principle. The half-trace form is the Hermitian norm, not its unscaled trace 2⟨x,x⟩. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion.
  TauCeti.Metaplectic.weil_hermitianUncertainty [target]: For a positive-dimensional nondegenerate Hermitian space V over E/F with conjugation c, set q(x)=½Tr_E/F⟨x,x⟩=⟨x,x⟩∈F. Use the Fourier kernel ψ(Tr_E/F⟨x,y⟩) and its self-dual measure. If supp φ⊆{x | val_F⟨x,x⟩>0} and supp φ̂⊆{x | val_F⟨x,x⟩≥0}, then φ=0 by the quadratic uncertainty principle. The half-trace form is the Hermitian norm, not its unscaled trace 2⟨x,x⟩.

MetaplecticAutomorphicForms:MP.2/hermitian-operator-normalizations — Hermitian oscillator normalizations
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The γ_V=−1 assertion for the specific nonsplit Hermitian datum in Li–Zhang Lemma6.3.1 and Zhang’s Deligne epsilon-factor input need original proof closure. General Fourier theory stays with AL.0/AL.2. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion, AutomorphicLFunctionsAndLocalFactors:AL.2.
  TauCeti.Metaplectic.weil_hermitianNormalizations [target]: Compare the Hermitian Weil operators in Li–Liu22, Li–Zhang22B, Disegni–Liu24 and Zhang21 with MP.2: m(a) has the specified character and |det a|_E^{dim_E V/2}, n(b) has ψ(tr bT(x)), and w has γ_V^{rank} times the positive Fourier transform for the source’s chosen trace pairing. Zhang’s even quadratic formula uses χV(a)=(a,(−1)^{dim V/2}det q)_F. His AppendixA gives γ_V=η(det Hermitian V)ε(η,1/2,ψ)^{dim_E V} and the hyperbolic constant1.

MetaplecticAutomorphicForms:MP.4/unramified-compact-splittings — Unramified compact splittings
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For a nonarchimedean odd-residue local field, conductor-zero ψ and a self-dual symplectic lattice, the normalized oscillator supplies the distinguished splitting of Sp(W)(O) into Mp(W), fixing the lattice indicator in its Schrödinger model. For a global datum these conditions hold at all but finitely many places. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion.
  TauCeti.Metaplectic.metaplectic_compactSplitting [target]: For a nonarchimedean odd-residue local field, conductor-zero ψ and a self-dual symplectic lattice, the normalized oscillator supplies the distinguished splitting of Sp(W)(O) into Mp(W), fixing the lattice indicator in its Schrödinger model. For a global datum these conditions hold at all but finitely many places.

MetaplecticAutomorphicForms:MP.4/global-weil-index-product — Weil product formula
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The oscillatory-distribution version of AL.0 Poisson and its finite-dimensional self-dual normalization remain a Part-II request. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation.
  TauCeti.Metaplectic.weilIndex_productFormula [target]: For a nondegenerate quadratic form q over a global field F and the factorizable additive character ψ of A/F with compatible self-dual measures, γψ_v(q_v)=1 almost everywhere and ∏_vγψ_v(q_v)=1. This is the analytic Weil-index product formula; local Hilbert/Hasse formulas are its local adapters.

MetaplecticAutomorphicForms:MP.4/rational-symplectic-splitting — Rational symplectic splitting
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: The product formula gives a canonical homomorphism Sp(W)(F)→Mp(W)(A) splitting the adelic projection, characterized by preservation of the theta summation functional. It agrees with rational Levi/unipotent/Fourier lifts and respects a change of polarization. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation.
  TauCeti.Metaplectic.rationalMetaplecticSplitting [target]: The product formula gives a canonical homomorphism Sp(W)(F)→Mp(W)(A) splitting the adelic projection, characterized by preservation of the theta summation functional. It agrees with rational Levi/unipotent/Fourier lifts and respects a change of polarization.
  TauCeti.Metaplectic.rationalSplitting_projection [api]: Projection of the rational lift is the diagonal adelic symplectic element.
  TauCeti.Metaplectic.rationalSplitting_mul [api]: The rational lift is a group homomorphism.
  TauCeti.Metaplectic.rationalSplitting_polarization [api]: Changing rational polarization conjugates the model and preserves the lift.
  TauCeti.Metaplectic.rationalSplitting_identity [tests]: The rational identity maps to the adelic identity.
  TauCeti.Metaplectic.rationalSplitting_fourier [tests]: The rational Fourier generator preserves theta summation by global Poisson.
  TauCeti.Metaplectic.rationalSplitting_section [tests]: An arbitrary single-place sign change of a rational lift generally destroys theta preservation.

MetaplecticAutomorphicForms:MP.4/adelic-weil-representation — Adelic Weil representation
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: AL.0’s scalar adelic space needs the finite-dimensional/joint archimedean extension; the completion and continuous action comparison must be supplied. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space, AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space.
  TauCeti.Metaplectic.adelicWeil [target]: Construct the global oscillator action on S(X(A))=S(X_∞)⊗(∏′_{v finite}S(X_v)), the algebraic finite-place restricted tensor product with standard lattice indicators and the full joint archimedean Schwartz space. Pure tensor operators use the product of local Weil actions; the product-one central subgroup acts trivially, so the action descends to Mp(W)(A).
  TauCeti.Metaplectic.adelicWeil_pureTensor [api]: On a factorizable vector, each local operator acts on its own factor.
  TauCeti.Metaplectic.adelicWeil_central [api]: The single adelic central −1 acts as scalar −1.
  TauCeti.Metaplectic.adelicWeil_characterChange [api]: Changing the global additive character gives the scaled quadratic/symplectic datum with compatible local operators.
  TauCeti.Metaplectic.adelicWeil_goodVector [tests]: At a good place the integral compact splitting fixes the standard indicator.
  TauCeti.Metaplectic.adelicWeil_twoCenters [tests]: Two local central −1 operators cancel on a pure tensor and descend to the quotient identity.
  TauCeti.Metaplectic.adelicWeil_jointSchwartz [tests]: In two archimedean coordinates there exists a joint Schwartz function outside every finite sum of products of one-coordinate Schwartz functions. The adelic model must accept it.

MetaplecticAutomorphicForms:MP.4/adelic-choice-compatibility — Adelic choice compatibility
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Changing local sections by coboundaries, polarization, or finitely many integral reference vectors produces the corresponding isomorphic restricted-product cover and oscillator model, provided the central product quotient and rational splitting are transported together. Changing ψ to ψ_a, a∈F×, is the scaled rational datum and respects the product formula.
  TauCeti.Metaplectic.adelicWeil_choiceCompatibility [target]: Changing local sections by coboundaries, polarization, or finitely many integral reference vectors produces the corresponding isomorphic restricted-product cover and oscillator model, provided the central product quotient and rational splitting are transported together. Changing ψ to ψ_a, a∈F×, is the scaled rational datum and respects the product formula.

MetaplecticAutomorphicForms:MP.4/finite-weil-representation — Finite Weil representation
Emitted: native T and S linear operators on D→ℂ, negative T exponent, positive S pairing exponent, specified phase/cardinality factor and T-conjugation tests. Missing: the nondegenerate finite quadratic module, source Weil phase, metaplectic presentation relations and the resulting full representation. The one-dimensional S test uses zero pairing and phase 1; unimodularity alone does not erase a signature phase.
  TauCeti.Metaplectic.finiteWeil [target]: For an even integral lattice L with discriminant module D=L∨/L, realize C[D] as the finite adelic Schwartz subspace S_L supported on Lhat∨ and periodic under Lhat. Restrict the adelic Weil action along the rational lift whose real component is γ̃∈Mp₂(Z). In the AGHMP convention this is ω_L, while the frequently cited ρ_L is its complex conjugate. Since ψ_Q is trivial on Q and ψ_Q,∞(q)=exp(2πiq), ψ_Q,f(q)=exp(−2πiq). Thus T in ω_L multiplies e_μ by exp(−2πiq(μ)); in ρ_L it multiplies by exp(2πiq(μ)). S in ω_L has the positive discriminant-pairing exponential and the conjugate of the usual ρ_L Weil phase, namely it is the discriminant-pairing finite Fourier transform with the signature/Weil phase dictated by ψ.

MetaplecticAutomorphicForms:MP.4/function-field-metaplectic-programme — Function-field metaplectic programme
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Metaplectic Satake/fusion, gerbe sheaves and modified excursion operators are a proposed upstream Part-II request; §14 does not establish all of them. Supplier categories: GeometricSatakeAndFusion:GS3, GlobalShtukasAndFunctionFieldLanglands:GS.5, GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule, GlobalShtukasAndFunctionFieldLanglands:GS.5/excursion-operator, GlobalShtukasAndFunctionFieldLanglands:GS.5/the-excursion-algebra.
  TauCeti.Metaplectic.metaplectic_functionFieldProgramme [target]: Lafforgue §14 sketches a conditional extension of shtuka excursion constructions to metaplectic groups: replace ordinary geometric Satake by its metaplectic version and use the modified dual group and gerbe/twisting data of (14.1)–(14.5). Record this as a programme with explicit missing hypotheses and constructions, not as a proved metaplectic global Langlands theorem.

MetaplecticAutomorphicForms:MP.5/theta-kernel — Theta kernel
Emitted: summation of a given representation action, rational invariance under an explicit reindexing action and central sign under the actual −id action. Missing: the adelic Schwartz/rational lattice carrier, canonical rational splitting, absolute summability and Poisson proof for the Fourier generator. An arbitrary group element cannot stand for the canonical rational lift.
  TauCeti.Metaplectic.thetaKernel_fourier [tests]: The rational Fourier generator preserves the sum by Poisson with covolume1.

MetaplecticAutomorphicForms:MP.5/theta-growth-transfer — Theta smoothness and growth transfer
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Weil’s cited continuity proof alone does not prove uniform moderate growth. The differentiated lattice majorant and finite-cover height comparison are explicit missing proof steps, requested from AA.3/AF.2 with an MP-specific transfer. Supplier categories: AdelicAlgebraicGroups:AA.3/adelic-siegel-set, AdelicAlgebraicGroups:AA.3/siegel-covering-adelic, AdelicAlgebraicGroups:AA.3/height-siegel-estimate, AutomorphicFormsOnReductiveGroups:AF.2/automorphic-forms-uniform-growth.
  TauCeti.Metaplectic.theta_uniformModerateGrowth [target]: The theta kernel is smooth at infinity, locally constant at finite places, and every archimedean differential operator can be applied termwise on compact subsets. On the specified adelic Siegel sets its derivatives satisfy a common polynomial height bound for each finite Schwartz seminorm family. With fixed finite level and finite K-type this gives uniform moderate growth in the AF.2 sense, after comparison of the cover height with the base-group height.

MetaplecticAutomorphicForms:MP.5/unipotent-splitting — Unipotent splittings
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The complete root-relation proof and native rational-unipotent carrier are supplier/gap inputs; the Siegel formula alone is not a proof for every U.
  TauCeti.Metaplectic.metaplectic_unipotentSplitting [target]: Each rational unipotent subgroup U of Sp(W) has the canonical continuous splitting in the local and adelic metaplectic double cover, compatible with conjugation and the rational splitting. On the Siegel unipotent this is the phase-multiplication operator. Uniqueness is in the characteristic-zero unipotent setting and follows from absence of nontrivial continuous μ₂-valued characters.

MetaplecticAutomorphicForms:MP.5/theta-integral-convergence — Weil convergence criterion
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The original convergence proof referenced by GQT is not fully read; its finite-cover/reduction comparison is retained as a proof gap. Supplier categories: AdelicAlgebraicGroups:AA.3, AdelicAlgebraicGroups:AA.1.
  TauCeti.Metaplectic.thetaIntegral_converges [target]: For the GQT type-I datum with dim_E V=m=m₀+2r, dim_E W=n, ε₀∈{−1,0,1}, d(n)=n+ε₀, the theta integral of every Schwartz vector over H(V)(F)\H(V)(A) converges absolutely if r=0 or m−r>d(n). The borderline and second-term cases require the regularized construction. This is a criterion for the theta integral, not for the pointwise rational theta sum.

MetaplecticAutomorphicForms:MP.5/regularized-theta-integral — Regularized theta integral
Emitted: the normalized integral expression for given smoothing/Eisenstein data, scaling and split-binary τ=1/2,κ=2 arithmetic tests. Missing: actual regularizer in the enveloping/Hecke algebra, its nonzero scalar polynomial, convergent initial family, meromorphic continuation, Laurent extraction and regularizer independence. Arbitrary analytic data do not define the source regularization.
  TauCeti.Metaplectic.regularizedTheta_regularizer [api]: The meromorphic family is independent of the admissible z.
  TauCeti.Metaplectic.regularizedTheta_laurent [api]: B_k is the coefficient of (s−ρ_H)^k with no reindexing.

MetaplecticAutomorphicForms:MP.5/extended-schwartz-weil — Extended Schwartz Weil action
Emitted: the polynomial Gaussian function and sign/zero/scaling tests. Missing: extension of the actual oscillator to the source similitude group and its action on the specified Schwartz module; arbitrary linear operators no longer serve as the extension or restriction comparison.
  TauCeti.Metaplectic.extendedSchwartzWeil_similitude [api]: A similitude transports the u parameter with the source’s multiplier convention.
  TauCeti.Metaplectic.extendedSchwartzWeil_restrict [api]: At u=1 and in the isometry subgroup the usual even oscillator action is recovered.

MetaplecticAutomorphicForms:MP.5/unit-quotiented-theta — Unit-quotiented theta series
Emitted: a double series and exact reindexing/stabilizer-cardinality fragments. Missing: ideal-lattice arithmetic, quotient by actual units, absolute summability and the rational/adelic source identification. The independent GN arithmetic request is a gate; GN.3’s theta consumer is not imported. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite.
  TauCeti.Metaplectic.unitTheta_rational [api]: The series satisfies the stated GL₂(F) transformation.

MetaplecticAutomorphicForms:MP.5/extended-restriction-comparison — Extended restriction comparison
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The abbreviated restriction formula suppresses splitting-character data. The generator comparison and exact source convention must be reconciled; only the matching-character version is targeted without an extra ratio.
  TauCeti.Metaplectic.extendedWeil_restriction [target]: For V₁⊂V nondegenerate even-dimensional spaces of dimensions d₁,d, restrict a standard tensor test vector along V₁ and compare its transformed restrictions. In the finite-place normalized model the modulus ratio is δ(g)^((d−d₁)/2), where δ(diag(a,d))=|a/d|^{1/2}; at infinity include the prescribed ρ(g) power. The quadratic-character/Weil-index ratio must also be retained unless the two splitting characters agree.

MetaplecticAutomorphicForms:MP.6/siegel-weil-section — Siegel–Weil section
Emitted: evaluation at zero of a supplied representation with covariance only when its parabolic evaluation equation is supplied. Missing: the actual oscillator, normalized induced carrier, parameter-dependent flat section and Laurent coefficients. The scalar parameter computation does not construct those carriers.
  TauCeti.Metaplectic.siegelWeilSection_laurent [api]: A_k is indexed by powers of s−s₀.

MetaplecticAutomorphicForms:MP.6/ikeda-map — Ikeda map
Emitted: the explicit integral, identity and separated-variable tests and Fubini composition with SFinite measures and joint Integrable hypothesis. Missing: actual smaller-tower Schwartz data, self-dual measures, source oscillator actions and equivariance. Unrelated representations no longer occur in its intertwining API.
  TauCeti.Metaplectic.ikedaMap_equivariant [api]: The smaller dual-pair action intertwines with its prescribed character.

MetaplecticAutomorphicForms:MP.6/anisotropic-siegel-weil — Anisotropic Siegel–Weil formula
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The original anisotropic identity and exact constant proof are cited by GQT but not fully read; the scalar must be rechecked against the adopted normalized I convention.
  TauCeti.Metaplectic.siegelWeil_anisotropic [target]: For anisotropic H(V), E(g,s₀,Φφ)=c_{m,n} τ(H)/[E:F]·I_{n,0}(φ), with the source’s definition of I and its measure comparison, c=1 for s₀>0 and c=2 for s₀≤0. Retain the split exceptional-group normalization wherever it enters a boundary comparison; do not transfer this anisotropic formula to a split divergent norm form.

MetaplecticAutomorphicForms:MP.6/first-term-identity — Regularized first-term identity
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The first-term identity proof inputs and the exceptional boundary calculation require their referenced original proofs; all ranges and coefficient conventions are retained for review.
  TauCeti.Metaplectic.siegelWeil_firstTerm [target]: For r>0 and 0<m≤d(n), the GQT normalized Laurent coefficients satisfy A₀(φ)=2B₋₁(φ), both in the strict first-term range 0<m<d(n) (Theorem7.4) and at the boundary m=d(n) (Theorem7.3(ii)). In the split O(1,1) exception in either range, A₀=B₋₁=0 and A₁=B₀. All coefficients are evaluated at their respective s₀ and ρ_H. The r=0 anisotropic identity is the separate Theorem7.1 node.

MetaplecticAutomorphicForms:MP.6/second-term-identity — Regularized second-term identity
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The induction and constant-term proof continuation after the read statements is not fully checked. The exact κ_{r,r′} evaluation and quotient carrier remain implementation/review work. Supplier categories: AutomorphicSpectralTheory:AS.2.
  TauCeti.Metaplectic.siegelWeil_secondTerm [target]: In d(n)<m≤d(n)+r with r≤n, let m+m′=2d(n), V′ the complementary Witt-tower space of index r′. Then A₋₁(φ)=B₋₂(φ), and A₀(φ)=B₋₁(φ)−κ_{r,r′}B₀(Ik_{r,r′}(π_KHφ)) modulo Im A₋₁. The correction is zero for r′=0 or H(V′)=O(1,1), with the source’s stipulated interpretation. Equality of A₀ and B₋₁ is only a quotient identity unless the residual image vanishes.

MetaplecticAutomorphicForms:MP.6/coherent-incoherent-sections — Coherent and incoherent sections
Emitted: restricted tprod of given local functions, good-place evaluations and finite-support sign-product obstructions with the product constraint explicitly assumed for global localizations. Missing: source induced-section tensor identification and actual localization isometries. Quadratic global existence comes from GlobalQuadraticForms Layers3,7,8 and real signatures from Layer4.4; a global Hermitian theorem needs its separate supplier.
  TauCeti.Metaplectic.thetaSectionCollection_global [api]: For a coherent datum the section equals that of the global Schwartz vector.

MetaplecticAutomorphicForms:MP.6/unitary-siegel-weil-measure — Unitary Siegel–Weil measure
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The referenced LL21 local identity proof is unread; its rational Haar scalar and native orbital-integral carrier remain precise supplier/proof inputs. Supplier categories: AdelicAlgebraicGroups:AA.1.
  TauCeti.Metaplectic.unitary_siegelWeilMeasure [target]: For DL’s rank n=2r unitary local datum and a nonsingular moment matrix T, use the unique rationally normalized H(F_v)-Haar measure stipulated in §4.1(H8): I_T(φ)=b_{2r,v}(1)·W_T(SW(φ)), with the source Whittaker character and local standard section. At an unramified hyperspecial place the designated compact subgroup has volume1. This equality specifies a normalization; it is not an arbitrary Haar choice.

MetaplecticAutomorphicForms:MP.6/pi-coherence-parity — Unitary theta coherence parity
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The exact global Hermitian existence theorem needs a separate source-qualified Hermitian supplier (not QFI6C or GlobalQuadraticForms); the native local invariant carrier is a QFI Part-II adapter request; no arithmetic height assertion is part of this node.
  TauCeti.Metaplectic.unitaryTheta_coherenceParity [target]: For DL’s tempered relevant π with rank n=2r, prescribed infinity signature (n−1,1) at one place and (n,0) elsewhere, the locally distinguished finite Hermitian spaces V_{π_v} form a coherent global collection exactly when ∏_{v finite}η_v((−1)^r det V_{π_v})=−(−1)^{r[F:Q]}. Retain the ordinary norm-character conventions at every v. This global form-existence test is distinct from the local theta dichotomy.

MetaplecticAutomorphicForms:MP.6/doubling-schwartz-map — Doubling Schwartz map
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The exact partial Fourier kernel and native completed/joint tensor comparison remain a finite-dimensional AL Part-II input. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion.
  TauCeti.Metaplectic.doublingSchwartz [target]: Identify the doubled oscillator space for W⊕W⁻ with the tensor of the ψ and ψ⁻¹ oscillator models. Define δ:S(V^n)⊗conjugate(S(V^n))→S(V^n⊕V^n) by the source partial Fourier/polarization transform. Normalize it so δ(φ₁⊗conjugate φ₂)(0)=⟨φ₁,φ₂⟩. Under G×G its action is the two commuting Weil actions with the explicit χV determinant twist in the doubled embedding.
  TauCeti.Metaplectic.doublingSchwartz_eval_zero [api]: δ(φ₁⊗conjugate φ₂)(0)=⟨φ₁,φ₂⟩.
  TauCeti.Metaplectic.doublingSchwartz_equivariant [api]: δ intertwines the doubled action with the stipulated χV determinant twist.
  TauCeti.Metaplectic.doublingSchwartz_pureTensor [api]: δ is the source partial Fourier transform of a pure tensor.
  TauCeti.Metaplectic.doublingSchwartz_zero [tests]: A zero factor maps to zero.
  TauCeti.Metaplectic.doublingSchwartz_norm [tests]: For equal φ the value at0 is its squared L² norm.
  TauCeti.Metaplectic.doublingSchwartz_conjugate [tests]: Replacing conjugate φ₂ by φ₂ changes a Hermitian pairing into a bilinear one.

MetaplecticAutomorphicForms:MP.6/local-doubling-integral — Local doubling zeta integral
Emitted: the integral of the same ContRepresentation matrix coefficient, native conjugate-first inner product, elementary normalization, zero, measure scaling and Unit-group integral=1 tests. Missing: actual doubling embedding, section/evaluation data, convergence chamber, zeta normalization and spherical L-factor theorem. An arbitrary scalar is no longer asserted to be an unramified ratio.
  TauCeti.Metaplectic.localDoublingZeta_unramified [api]: The designated spherical data give L_v/d_v.

MetaplecticAutomorphicForms:MP.6/theta-integral-factorization — Factorization of theta pairings
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The complete unfolding proof and each ramified integral comparison require their original sources and native restricted quotient integration. Supplier categories: AdelicAlgebraicGroups:AA.0/restricted-haar-factorizable-integral, AutomorphicLFunctionsAndLocalFactors:AL.0.
  TauCeti.Metaplectic.thetaPairing_factorization [target]: For pure tensor Schwartz vectors, matrix coefficients and sections in a proved absolute-convergence chamber, the unfolded doubled theta pairing equals the product of its normalized local integrals times the designated partial/global L-factor and almost-everywhere denominators. Restricted-product Fubini uses AA.0’s countability, second-countability, open compact and cofinite indicator hypotheses; ramified and real factors are computed independently. A rational theta sum itself is generally not the product of local theta sums.

MetaplecticAutomorphicForms:MP.6/rallis-inner-product — Rallis inner product formula
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The referenced Yamana/PSR proof, holomorphy criterion and exact Val interpretation are not fully read; statement and ranges are checked but the proof chain remains open. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0.
  TauCeti.Metaplectic.rallis_innerProduct [target]: In the GQT positive range d(n)<m≤2d(n), r≤n, allowing both its second-term and convergent cases, for cuspidal π whose lower theta lifts vanish, the theta inner product is [E:F]·Val_{s=s_{m,n}} L(s+1/2,π⊗χV)·Z*(s,Φ,f₁,f₂), with the exact normalized doubled section and global measures. If every relevant local theta lift is nonzero, the stated L-factor is holomorphic at that point and the formula uses its value. The lower-lift vanishing is essential to the cuspidal and residual-term elimination.

MetaplecticAutomorphicForms:MP.6/global-theta-nonvanishing — Global theta nonvanishing criterion
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The cited real induced-module diagrams and original local comparison proofs are unread; Conjecture11.5 is not used as a theorem. The target preserves Proposition11.6/Theorem11.7’s restricted hypotheses.
  TauCeti.Metaplectic.globalTheta_nonvanishing [target]: In the same first-occurrence range, the global theta lift is nonzero exactly when the relevant normalized local functionals and the special L-value are nonzero. Replacing local-functional nonvanishing by local-theta nonvanishing requires GQT’s extra archimedean/range hypotheses: ε₀=−1, or all unitary archimedean places split, or orthogonal F totally complex, or m=d(n)+1. In the remaining cases the source permits modifying real signatures; it does not prove the unrestricted assertion for the original V.

MetaplecticAutomorphicForms:MP.6/jacobi-spaces — Jacobi spaces
Emitted: a central-character submodule of functions and central-character compatibility tests. Missing: full Jacobi elliptic, slash/weight, matrix-index, holomorphy and support conditions and their action laws. QM.1 items(a)–(e) and the separately sourced L2s unitary instance remain exact producer gates, not an MP.8 import.
  TauCeti.Metaplectic.jacobiSpace_elliptic [api]: The coordinate elliptic law has the prescribed quadratic phase.
  TauCeti.Metaplectic.jacobiSpace_weight [api]: The symplectic covariance agrees with the specified weight/multiplier.

MetaplecticAutomorphicForms:MP.6/fourier-jacobi-extraction — Fourier–Jacobi extraction
Emitted: the Fourier integral, covariance under commuting action, a.e.-measurable probability-normalized matching-character test and finite-group mismatching-character test. Missing: actual central Haar quotient and translation law, matrix-index Fourier extraction and classical/Jacobi carrier identification.
  TauCeti.Metaplectic.fourierJacobi_index [api]: The coefficient has ψ_m central character.

MetaplecticAutomorphicForms:MP.6/jacobi-theta-decomposition-interface — Jacobi theta decomposition interface
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The generic lattice theta-decomposition proof/carrier remains open. MP.8 depends on the common MP.6 interface; cross-references record the specialization contract rather than a closed cyclic proof.; QM.1’s request to MP.6, items(a)–(e), is binding: the discrete J_n(Γ) and Heisenberg-center bridge; matrix-index slash action; typus(Γ,V) and Fourier cusp support; half-integral scalar index through central characters or z↦2z; the elliptic-function theta decomposition and Skoruppa Theorem5, with the dual finite Weil module and finite-image hypothesis. The existing four adelic integral-index contracts do not yet supply these outputs, so QM.1’s eight stage prerequisites remain. Also extract the unitary Jacobi/Schrödinger–Weil and Fourier–Jacobi instance needed by AutomorphicCongruences:L2s, with its unitary splitting, coefficient/index and multiplier conventions. No use by L2 itself has been established, and no L2 edge is added. BFH genus-two and QM classical q-series specializations retain their owners. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation.
  TauCeti.Metaplectic.jacobi_thetaDecomposition [target]: For a positive integral index and normally convergent Jacobi section, elliptic invariance decomposes its Fourier indices into finitely many discriminant residues; its unique theta components transform through the finite Weil module. Prove the general statement using compact torus orthogonality and Poisson summation. MP.8/theta-decomposition, theta-pairing and theta-fourier-transform specialize this interface to the exact genus-two BFH formulas, including the positive-on-iY determinant-root branch; this node does not use them.

MetaplecticAutomorphicForms:MP.5/ideal-class-theta — Ideal-class theta series
Emitted: a weighted norm-index series on a supplied lattice and coefficient sequence. Missing: bijection from nonzero lattice/unit orbits to integral ideals in the correct class, its weight, ideal norms and class representatives, actual Fourier extraction and constant term. The generic series does not prove ideal-class modularity or its conjugation law. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite.
  TauCeti.Metaplectic.idealClassTheta_constant [api]: The constant coefficient is1/w.
  TauCeti.Metaplectic.idealClassTheta_lattice [api]: The w-normalized lattice sum equals the ideal-count series.

MetaplecticAutomorphicForms:MP.5/ideal-class-theta-modularity — Ideal-class theta modularity
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Hecke/Schoeneberg’s original all-discriminant modularity proof is not read; GZ quotes it. Its exact classical modular-form carrier and cusp comparison remain requested. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite.
  TauCeti.Metaplectic.idealClassTheta_modular [target]: θ_A is holomorphic of weight1 on Γ₀(|D|) with Nebentypus ε_D: θ_A(γz)=ε_D(d)(cz+d)θ_A(z), and it is holomorphic at every cusp. This holds for every negative fundamental D; the explicit all-SL₂(Z) transformation node below is restricted to odd D.

MetaplecticAutomorphicForms:MP.5/ideal-class-theta-conjugation — Ideal-class theta conjugation
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For every ideal class A and n≥1, conjugation gives r_A(n)=r_{A⁻¹}(n), hence θ_A=θ_{A⁻¹}. For the ramified ideal d₁ in an odd-discriminant factorization, d₁²=(D₁), so its class D₁ has square1; consequently θ_{A⁻¹D₁⁻¹}=θ_{AD₁}. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite.
  TauCeti.Metaplectic.idealClassTheta_conjugation [target]: For every ideal class A and n≥1, conjugation gives r_A(n)=r_{A⁻¹}(n), hence θ_A=θ_{A⁻¹}. For the ramified ideal d₁ in an odd-discriminant factorization, d₁²=(D₁), so its class D₁ has square1; consequently θ_{A⁻¹D₁⁻¹}=θ_{AD₁}.

MetaplecticAutomorphicForms:MP.6/ideal-lattice-poisson — Ideal-lattice Poisson comparison
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The finite-dimensional complex Gaussian Fourier/covolume comparison is an AL Part-II input; ideal trace-duality belongs to GN.3. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation, AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite.
  TauCeti.Metaplectic.idealLattice_poisson [target]: For an imaginary quadratic K, fractional ideal b, λ∈C and z∈H, Σμ∈b exp(2πiN(λ+μ)z)=i/(sqrt(|D|)N(b)z) Σν∈b⁻¹d⁻¹ exp(−2πiN(ν)/z)exp(2πiTr(λν)). The trace-dual ideal is b⁻¹d⁻¹, and the additive measure is matched to its discriminant covolume. This is an adapter of the supplied finite-dimensional Poisson theorem.

MetaplecticAutomorphicForms:MP.5/ideal-class-theta-general-transform — Ideal-class theta transformation
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The finite Gauss-sum proof needs the exact quadratic-character supplier; the visually read statement and its odd-D hypothesis are retained without claiming the full computation is implemented. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite.
  TauCeti.Metaplectic.idealClassTheta_transform [target]: For odd negative fundamental D=D₁D₂, δ_i=|D_i|, γ=[[a,b],[c,d]]∈SL₂(Z) with gcd(c,|D|)=δ₂, and c* inverse to c modulo δ₁ chosen0 modulo δ₂, (θ_A|₁γ)(z)=ε_{D₁}(c/δ₂)ε_{D₂}(d)κ(D₁)⁻¹δ₁⁻¹/²χ_{D₁,D₂}(A)θ_{A D₁}((z+c*d)/δ₁). Here κ(D₁)=1 or i by its sign, and D₁ also denotes the class of the ideal of normδ₁ only in the last subscript. Use SL₂, correcting the printed PSL₂ because weight1 detects −I.

MetaplecticAutomorphicForms:MP.7/half-weight-fourier-expansion — Whittaker Fourier expansion
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The broad QM.2 imports are replaced by its existing I/J nodes and AS.0/dit-112 for Whittaker M/W. The three fine-node requests retain the missing complex-order uniform differentiated bounds and continued exceptional-parameter domains. Neither a real-order I estimate nor a fixed-parameter Whittaker asymptotic proves these uniform estimates. Supplier categories: AutomorphicSpectralTheory:AS.0/dit-112.
  TauCeti.Metaplectic.halfWeight_fourierExpansion [target]: A cuspidal weight-one-half eigenform has F(z)=Σ_{n≠0}b(n)W_{sgn(n)/4,ir/2}(4π|n|y)e(nx), with convergence and coefficient recovery. The spectral parameter is r/2 here, versus r in weight zero.

MetaplecticAutomorphicForms:MP.7/half-weight-eisenstein — Completed half-weight Eisenstein family
Emitted: the explicitly normalized constant term plus nonzero allowed-index Fourier series, zero/constant-term and index-zero exclusion tests. Missing: actual completed zeta, plus coefficient and Whittaker functions, convergence, automorphy, meromorphic continuation and extraction at the other cusps. Independently chosen functions are only a series adapter.
  TauCeti.Metaplectic.halfWeightEisenstein_constantTerms [api]: Expose both powers y^(s/2+1/4) and y^(3/4−s/2), with 2^s and 2^(1−s).

MetaplecticAutomorphicForms:MP.7/fundamental-eisenstein-coefficient — Fundamental-discriminant Eisenstein coefficient
Emitted: the |d|^(-3/4)(4π)^(-1/4) coefficient prefactor and its product formula, with direct d=1,d=−3 and 2√π product tests. Missing: actual completed Dirichlet L-function, fundamental discriminant and parity Γ-factor identification; the omitted parity API cannot equate independently chosen functions.
  TauCeti.Metaplectic.fundamentalEisensteinCoefficient_parityFactor [api]: The paper completion is |d|^(s/2)π^(α/2) times Mathlib completed L.

MetaplecticAutomorphicForms:MP.7/eisenstein-divisor-coefficients — Half-weight Eisenstein coefficient expansion
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: The nonconstant coefficients of E*_{1/2} are b(n,s), supported on n≡0,1 mod4. For fundamental d and m>0, mΣ_{n|m}n^(−3/2)(d/n)b(m²d/n²,s)=m^(s−1/2)σ_{1−2s}(m)b(d,s).
  TauCeti.Metaplectic.halfWeightEisenstein_coefficients [target]: The nonconstant coefficients of E*_{1/2} are b(n,s), supported on n≡0,1 mod4. For fundamental d and m>0, mΣ_{n|m}n^(−3/2)(d/n)b(m²d/n²,s)=m^(s−1/2)σ_{1−2s}(m)b(d,s).

MetaplecticAutomorphicForms:MP.7/theta-residue-normalization — Theta residue and Petersson normalization
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Res_{s=1}E*_{1/2}(z,s) = ½θ(z) (the pole comes from Λ(2−2s) in the constant term and from Λ(s,χ_1)=Λ(s) in the coefficients b(m²,s); checked). The paper states ⟨½θ,½θ⟩ = 6 citing [7], but with the paper's product ⟨F,F⟩=∫_{Γ_0(4)\H}|F|²dμ one has ⟨θ,θ⟩ = 2π = area(Γ_0(4)\H), hence ⟨½θ,½θ⟩ = π/2. The number 6 = [Γ:Γ_0(4)] is (3/π)⟨θ,θ⟩, i.e. ⟨θ,θ⟩ for the product normalized by area(Γ\H)=π/3. Rescaling F from ⟨F,F⟩=1 to ⟨F,F⟩=6 does turn 12 into 2 on the left of (5.16). The remark is heuristic and used in no proof. Supplier categories: AdelicAlgebraicGroups:AA.1, QSeriesPartitionsAndMockModularForms:QM.1/jacobi-theta-nonvanishing.
  TauCeti.Metaplectic.halfWeightEisenstein_thetaResidue [target]: Res_{s=1}E*_{1/2}(z,s) = ½θ(z) (the pole comes from Λ(2−2s) in the constant term and from Λ(s,χ_1)=Λ(s) in the coefficients b(m²,s); checked). The paper states ⟨½θ,½θ⟩ = 6 citing [7], but with the paper's product ⟨F,F⟩=∫_{Γ_0(4)\H}|F|²dμ one has ⟨θ,θ⟩ = 2π = area(Γ_0(4)\H), hence ⟨½θ,½θ⟩ = π/2. The number 6 = [Γ:Γ_0(4)] is (3/π)⟨θ,θ⟩, i.e. ⟨θ,θ⟩ for the product normalized by area(Γ\H)=π/3. Rescaling F from ⟨F,F⟩=1 to ⟨F,F⟩=6 does turn 12 into 2 on the left of (5.16). The remark is heuristic and used in no proof.

MetaplecticAutomorphicForms:MP.7/plus-projection — Plus projection and old normalization bridge
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.
  TauCeti.Metaplectic.kohnenPlus_projection [target]: Prove pr⁺ is the orthogonal projection onto V_r^+, with the same extension on the relevant Poincaré families. DIT11 (2.19) must read P_d^+=(3/2)pr⁺P_d; DIT16 footnote7 corrects it. The principal term of pr⁺F_{1/2,d} thus has factor2/3.

MetaplecticAutomorphicForms:MP.7/plus-kloosterman — Modified plus Kloosterman sum
Emitted: exact dyadic scalar multiple and concrete c=4 values under the specified κ values. Missing: actual Kronecker data proving reality and symmetry in the source range; those assertions have been omitted for arbitrary κ.
  TauCeti.Metaplectic.plusKloosterman_discriminantSymmetry [api]: For allowed indices, K⁺ is real and symmetric.

MetaplecticAutomorphicForms:MP.7/plus-kloosterman-symmetry — Reality and symmetry of plus sums
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For c>0 with 4|c and all m,n∈ℤ, K⁺(m,n;c)=K⁺(n,m;c)=conj(K⁺(n,m;c)). This is (8.9), stated without any congruence condition on m,n, as in DIT11 (3.5).
  TauCeti.Metaplectic.plusKloosterman_symmetry [target]: For c>0 with 4|c and all m,n∈ℤ, K⁺(m,n;c)=K⁺(n,m;c)=conj(K⁺(n,m;c)). This is (8.9), stated without any congruence condition on m,n, as in DIT11 (3.5).

MetaplecticAutomorphicForms:MP.7/half-weight-resolvent — Half-weight resolvent kernel
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure. Supplier categories: AutomorphicSpectralTheory:AS.0.
  TauCeti.Metaplectic.halfWeightResolvent [target]: Construct the resolvent G_{1/2}(z,z′;s) on the Γ₀(4) unitary-multiplier L² space, with its three-cusp domain, hermitian kernel symmetry and discrete polar projectors. This is a cover-specific adaptation of AS.0, not an ordinary scalar kernel on Γ\H.
  TauCeti.Metaplectic.halfWeightResolvent_weightedDomain [api]: Use functions with J automorphy and all three cusps in the self-adjoint domain.
  TauCeti.Metaplectic.halfWeightResolvent_covariance [api]: Transform each kernel variable with its J or conjugate J factor.
  TauCeti.Metaplectic.halfWeightResolvent_polarProjection [api]: The residue is the orthogonal projector onto the weighted eigenspace, before plus projection.
  TauCeti.Metaplectic.halfWeightResolvent_test1 [tests]: The kernel cannot be an ordinary invariant scalar in both variables.
  TauCeti.Metaplectic.halfWeightResolvent_test2 [tests]: Changing the phase of an orthonormal basis vector leaves its rank-one projector unchanged.
  TauCeti.Metaplectic.halfWeightResolvent_test3 [tests]: Projection to V⁺ changes the basis sum and must precede the coefficient identity 100.

MetaplecticAutomorphicForms:MP.7/half-weight-poincare — Half-weight Poincaré family
Emitted: quotient-indexed sum and source prefactor/Whittaker-parameter arithmetic with Γ cancellation only in Re(s)>1. Missing: actual Whittaker M, well-defined representative-independent seed, convergence, automorphy and residues. The third test checks its 4π|n| factor, not the full residue theorem.
  TauCeti.Metaplectic.halfWeightPoincare_multiplierInverse [api]: J(γ, z)⁻¹ in the coset sum gives the correct automorphy.

MetaplecticAutomorphicForms:MP.7/poincare-residues — Half-weight Poincaré residues
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.
  TauCeti.Metaplectic.halfWeightPoincare_residue [target]: At s₀=1/2+ir/2, r>0, Res[(2s−1)F_{1/2,n}(z,s)]=Σ_ψ conj(b_ψ(n))ψ(z) over an orthonormal cuspidal eigenbasis, in the kernel convention verified from Fay. Preserve conjugation; raw PDF text drops bars.

MetaplecticAutomorphicForms:MP.7/plus-bessel-coefficient — Plus Bessel coefficient family
Emitted: the full two-sign Γ/power/sqrt prefactor and K⁺/c series, with direct coefficient tests supported at c=4 for same/opposite signs and doubled dyadic input. Missing: actual J/I, K⁺ and the projected-resolvent meromorphic continuation; independently chosen continuation is not equated with the initial series.
  TauCeti.Metaplectic.plusBesselCoefficient_continuation [api]: Extend using the projected resolvent coefficient, preserving its initial series.

MetaplecticAutomorphicForms:MP.7/projected-poincare-expansion — Projected Fourier expansion
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Let Re(s)>1 and let d≠0 with d≡0,1 mod 4. Then pr⁺F_{1/2,d}(z,s)=(2/3)Γ(s−sgn(d)/4)/(4π|d|Γ(2s))·M_{sgn(d)/4,s−1/2}(4π|d|y)e(dx)+Σ_{n≡0,1(4),n≠0}Φ⁺(n,d;s)W_{sgn(n)/4,s−1/2}(4π|n|y)e(nx)+(a constant term that the paper does not display). Φ⁺ is given by (8.11). The paper's sum over n≡0,1(4) formally includes n=0, where W(4π|n|y) is meaningless.
  TauCeti.Metaplectic.plusPoincare_expansion [target]: Let Re(s)>1 and let d≠0 with d≡0,1 mod 4. Then pr⁺F_{1/2,d}(z,s)=(2/3)Γ(s−sgn(d)/4)/(4π|d|Γ(2s))·M_{sgn(d)/4,s−1/2}(4π|d|y)e(dx)+Σ_{n≡0,1(4),n≠0}Φ⁺(n,d;s)W_{sgn(n)/4,s−1/2}(4π|n|y)e(nx)+(a constant term that the paper does not display). Φ⁺ is given by (8.11). The paper's sum over n≡0,1(4) formally includes n=0, where W(4π|n|y) is meaningless.

MetaplecticAutomorphicForms:MP.7/plus-coefficient-residue — Plus coefficient residue theorem
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.
  TauCeti.Metaplectic.plusBesselCoefficient_residue [target]: Φ⁺(d′,d;s) continues meromorphically to Re(s)>0 and Res_{s=1/2+ir/2}[(2s−1)Φ⁺(d′,d;s)]=Σ_ψ b_ψ(d′)conj(b_ψ(d)), for an orthonormal basis of V_r^+.

MetaplecticAutomorphicForms:MP.7/quadratic-root-weyl-sum — Quadratic-root Weyl sum
Emitted: root-congruence finite sum, discriminant arithmetic and phase/range tests. Missing: an actual binary genus character with representative, reflection and scaling laws; evenness is not asserted for arbitrary χ. This is an independent GN PartII request, without a GN.2 stage input. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite.
  TauCeti.Metaplectic.quadraticRootWeylSum_evenness [api]: S_{−m}=S_m=conj(S_m) under the stated genus character convention.

MetaplecticAutomorphicForms:MP.7/kohnen-salie-identity — Kohnen–Salié divisor identity
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.
  TauCeti.Metaplectic.kohnenSalie_identity [target]: For c>0 divisible by4, d fundamental, d′≡0,1 mod4 and integer m, S_m(d′,d;c)=Σ_{n|gcd(m,c/4),n>0}(d/n)√(n/c)K⁺(d′,m²d/n²;c/n). Include even-prime factors and the c≡4 mod8 multiplier.

MetaplecticAutomorphicForms:MP.7/weight-two-cycle-unfolding — Weight-two cycle unfolding
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Let d be fundamental, d′,d<0, D=d′d nonsquare, and let φ be as in item 105. Put Φ_m(t)=−it∫_0^π e(mt cosθ)φ(t sinθ)e^{iθ}dθ (9.3). For every m∈ℤ, Σ_{Q∈Γ\Q_D}χ(Q)∫_{C_Q}P_m(τ,φ)dτ=ε·Σ_{0<c≡0(4)}S_m(d′,d;c)Φ_m(2√D/c). With this corrected −it kernel, ε=+1 when C_Q runs from z to γ_Qz (clockwise on S_Q for a>0, the C_A orientation of §2 under which Lemma5 holds), and ε=−1 for z→g_Qz=γ_Q⁻¹z (DIT11's counterclockwise orientation for a>0). The paper's printed +it kernel uses the opposite sign: its Lemma6 needs a leading minus for z→γ_Qz. Correcting the kernel and also inserting that minus would double-correct E28. Work in a proved convergence range (or with the weaker actual decay O(y^ε)); the printed stronger decay hypothesis is not inferred automatically for Re(s)>1. Supplier categories: AutomorphicSpectralTheory:AS.0. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite.
  TauCeti.Metaplectic.halfWeight_cycleUnfolding [target]: Let d be fundamental, d′,d<0, D=d′d nonsquare, and let φ be as in item 105. Put Φ_m(t)=−it∫_0^π e(mt cosθ)φ(t sinθ)e^{iθ}dθ (9.3). For every m∈ℤ, Σ_{Q∈Γ\Q_D}χ(Q)∫_{C_Q}P_m(τ,φ)dτ=ε·Σ_{0<c≡0(4)}S_m(d′,d;c)Φ_m(2√D/c). With this corrected −it kernel, ε=+1 when C_Q runs from z to γ_Qz (clockwise on S_Q for a>0, the C_A orientation of §2 under which Lemma5 holds), and ε=−1 for z→g_Qz=γ_Q⁻¹z (DIT11's counterclockwise orientation for a>0). The paper's printed +it kernel uses the opposite sign: its Lemma6 needs a leading minus for z→γ_Qz. Correcting the kernel and also inserting that minus would double-correct E28. Work in a proved convergence range (or with the weaker actual decay O(y^ε)); the printed stronger decay hypothesis is not inferred automatically for Re(s)>1.

MetaplecticAutomorphicForms:MP.7/cm-poincare-sum — CM Poincaré sum
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For m≠0, Re(s)>1 and d′d=D<0, Σ_Qχ(Q)ω_Q⁻¹F_m(z_Q,s)=2^(−1/2)|D|^(1/4)Σ_{c>0,4|c}S_m(d′,d;c)c^(−1/2)I_{s−1/2}(4π|m|√|D|/c). The square root is of |D|. Supplier categories: AutomorphicSpectralTheory:AS.0. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite.
  TauCeti.Metaplectic.poincare_cmSum [target]: For m≠0, Re(s)>1 and d′d=D<0, Σ_Qχ(Q)ω_Q⁻¹F_m(z_Q,s)=2^(−1/2)|D|^(1/4)Σ_{c>0,4|c}S_m(d′,d;c)c^(−1/2)I_{s−1/2}(4π|m|√|D|/c). The square root is of |D|.

MetaplecticAutomorphicForms:MP.7/positive-cycle-poincare-sum — Positive cycle Poincaré sum
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For m≠0, Re(s)>1 and d,d′>0, D nonsquare, Σ_Qχ(Q)∫_{C_Q}F_m ds=2^(s−1/2)Γ(s/2)²D^(1/4)/Γ(s) times Σ_{c>0,4|c}S_m(d′,d;c)c^(−1/2)J_{s−1/2}(4π|m|√D/c). Supplier categories: AutomorphicSpectralTheory:AS.0. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite.
  TauCeti.Metaplectic.poincare_positiveCycle [target]: For m≠0, Re(s)>1 and d,d′>0, D nonsquare, Σ_Qχ(Q)∫_{C_Q}F_m ds=2^(s−1/2)Γ(s/2)²D^(1/4)/Γ(s) times Σ_{c>0,4|c}S_m(d′,d;c)c^(−1/2)J_{s−1/2}(4π|m|√D/c).

MetaplecticAutomorphicForms:MP.7/negative-cycle-poincare-sum — Negative-factor cycle Poincaré sum
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The broad QM.2 imports are replaced by its existing I/J nodes and AS.0/dit-112 for Whittaker M/W. The three fine-node requests retain the missing complex-order uniform differentiated bounds and continued exceptional-parameter domains. Neither a real-order I estimate nor a fixed-parameter Whittaker asymptotic proves these uniform estimates. Supplier categories: QSeriesPartitionsAndMockModularForms:QM.2/bessel-function-j.
  TauCeti.Metaplectic.poincare_negativeCycle [target]: Let m≠0, Re(s)>1, d fundamental, d′,d<0 and D=d′d nonsquare. Orient C_Q from z to γ_Qz, with γ_Q from (2.11); this is clockwise on S_Q when a>0 and is the orientation of C_A in §2. Then Σ_{Q∈Γ\Q_D}χ(Q)∫_{C_Q}i∂_zF_m(z,s)dz=2^{s−1/2}Γ((s+1)/2)²Γ(s)⁻¹D^{1/4}Σ_{0<c≡0(4)}S_m(d′,d;c)c^{−1/2}J_{s−1/2}(4π|m|√D/c). With DIT11's orientation (z to γ_Q⁻¹z) the right side changes sign.

MetaplecticAutomorphicForms:MP.7/three-case-poincare-identity — Exact three-case Poincaré identity
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Let m≠0 and Re(s)>1, let d be a fundamental discriminant and d′ a discriminant with D=d′d nonsquare. Then 6π^{1/2}|D|^{3/4}|m|Σ_{n|m,n>0}n^{−3/2}(d/n)Φ⁺(d′,m²d/n²;s/2+1/4)=Σ_{Q∈Γ\Q_D}χ(Q)·X_Q, where X_Q=2√πω_Q⁻¹F_m(z_Q,s) if d′d<0, X_Q=∫_{C_Q}F_m(z,s)y⁻¹|dz| if d′,d>0, and X_Q=∫_{C_Q}i∂_zF_m(z,s)dz if d′,d<0. In the third case C_Q runs from z to γ_Qz, as in item 109.
  TauCeti.Metaplectic.halfWeight_threeCasePoincare [target]: Let m≠0 and Re(s)>1, let d be a fundamental discriminant and d′ a discriminant with D=d′d nonsquare. Then 6π^{1/2}|D|^{3/4}|m|Σ_{n|m,n>0}n^{−3/2}(d/n)Φ⁺(d′,m²d/n²;s/2+1/4)=Σ_{Q∈Γ\Q_D}χ(Q)·X_Q, where X_Q=2√πω_Q⁻¹F_m(z_Q,s) if d′d<0, X_Q=∫_{C_Q}F_m(z,s)y⁻¹|dz| if d′,d>0, and X_Q=∫_{C_Q}i∂_zF_m(z,s)dz if d′,d<0. In the third case C_Q runs from z to γ_Qz, as in item 109.

MetaplecticAutomorphicForms:MP.7/plus-hecke-basis — Plus Hecke eigenbasis
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.
  TauCeti.Metaplectic.kohnenPlus_heckeBasis [target]: V_r^+ has an orthonormal basis B_r of simultaneous eigenforms for T_{p²}, p>2. Supply the p=2 plus-space convention needed for the Euler product over all primes; diagonalization away from2 alone does not define that factor. The all-prime version explicitly includes the plus-space p=2 Hecke operator; an odd-prime eigenbasis alone is insufficient.

MetaplecticAutomorphicForms:MP.7/shimura-eigenline-lift — Shimura lift from an eigenline
Emitted: coefficient-ratio Fourier series and nonzero-scalar invariance. Missing: actual all-prime Hecke eigenform data, fundamental nonzero coefficient and recurrence proving independence of that choice, the Bessel kernel and automorphy. The p=2 factor remains explicit.
  TauCeti.Metaplectic.shimuraEigenlineLift_fundamentalChoice [api]: Different nonzero fundamental coefficients produce the same a_ψ(n), using the Hecke relations.

MetaplecticAutomorphicForms:MP.7/shimura-coefficient-relation — Shimura coefficient relation
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For m>0 and fundamental d, mΣ_{n|m}n^(−3/2)(d/n)b_ψ(m²d/n²)=a_ψ(m)b_ψ(d). Prove that some fundamental coefficient is nonzero, so these relations determine the lift and all coefficients from fundamental ones.
  TauCeti.Metaplectic.shimura_coefficientRelation [target]: For m>0 and fundamental d, mΣ_{n|m}n^(−3/2)(d/n)b_ψ(m²d/n²)=a_ψ(m)b_ψ(d). Prove that some fundamental coefficient is nonzero, so these relations determine the lift and all coefficients from fundamental ones.

MetaplecticAutomorphicForms:MP.7/spectral-residue-substitution — Spectral substitution residue factor four
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Set w=s/2+1/4, s₀=1/2+ir and w₀=1/2+ir/2, r>0. Then Res_{s=s₀}[(2s−1)H(s/2+1/4)]=4 Res_{w=w₀}[(2w−1)H(w)] for H with a simple pole at w₀. One factor2 is the derivative of the coordinate change, the other the linear spectral factor.
  TauCeti.Metaplectic.spectralResidue_substitution [target]: Set w=s/2+1/4, s₀=1/2+ir and w₀=1/2+ir/2, r>0. Then Res_{s=s₀}[(2s−1)H(s/2+1/4)]=4 Res_{w=w₀}[(2w−1)H(w)] for H with a simple pole at w₀. One factor2 is the derivative of the coordinate change, the other the linear spectral factor.

MetaplecticAutomorphicForms:MP.7/spectral-trace-identity — Spectral trace identity before multiplicity one
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Taking residues in119 and using93,100,122,123 yields 12√π|D|^(3/4)Σ_ψ b_ψ(d′)conj(b_ψ(d))a_ψ(m)=Σ_φa_φ(m)T(φ,χ), where T is ||φ||⁻² times the appropriate three-case geometric trace. Keep the finite eigenspace sums until the Shimura bijection is proved. Supplier categories: AutomorphicSpectralTheory:AS.0.
  TauCeti.Metaplectic.halfWeight_spectralTrace [target]: Taking residues in119 and using93,100,122,123 yields 12√π|D|^(3/4)Σ_ψ b_ψ(d′)conj(b_ψ(d))a_ψ(m)=Σ_φa_φ(m)T(φ,χ), where T is ||φ||⁻² times the appropriate three-case geometric trace. Keep the finite eigenspace sums until the Shimura bijection is proved.

MetaplecticAutomorphicForms:MP.7/shimura-series-automorphy — Automorphy of the Shimura series
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Use the family of trace identities and the Biró linear-independence argument to prove Shim(ψ) is an even level-one Hecke–Maass cusp form with eigenvalue1/4+r². Formal Fourier series with the right Euler factors alone do not imply automorphy.
  TauCeti.Metaplectic.shimura_automorphy [target]: Use the family of trace identities and the Biró linear-independence argument to prove Shim(ψ) is an even level-one Hecke–Maass cusp form with eigenvalue1/4+r². Formal Fourier series with the right Euler factors alone do not imply automorphy.

MetaplecticAutomorphicForms:MP.7/shimura-eigenline-bijection — Shimura bijection of eigenlines
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.
  TauCeti.Metaplectic.shimura_eigenlineBijection [target]: The weight-one-half Kohnen-plus Hecke eigenlines at parameter r/2 correspond bijectively to normalized even level-one Hecke–Maass forms at parameter r. On a previously chosen orthonormal basis B_r this gives one selected vector for each line; it does not produce a phase-independent unit vector.

MetaplecticAutomorphicForms:MP.7/extended-shimura-trace — Extended trace formula for all discriminants
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For a normalized even φ and a unit ψ on its corresponding plus eigenline, T(φ,χ)=12√π|D|^(3/4)b_ψ(d′)conj(b_ψ(d)) for fundamental d, discriminant d′, D=d′d nonsquare. General negative D requires |D|^(3/4).
  TauCeti.Metaplectic.shimura_extendedTrace [target]: For a normalized even φ and a unit ψ on its corresponding plus eigenline, T(φ,χ)=12√π|D|^(3/4)b_ψ(d′)conj(b_ψ(d)) for fundamental d, discriminant d′, D=d′d nonsquare. General negative D requires |D|^(3/4).

MetaplecticAutomorphicForms:MP.7/negative-factor-trace — Theorem4 negative factors
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Let φ(z)=2y^{1/2}Σ_{n≠0}a(n)K_{ir}(2π|n|y)e(nx) be an even Hecke–Maass cusp form for Γ=PSL(2,Z) with a(1)=1 and Laplace eigenvalue λ=1/4+r², and let F(z)=Σ_{n≡0,1 (mod 4), n≠0} b(n)W_{sgn(n)/4, ir/2}(4π|n|y)e(nx) be the weight-1/2 form for Γ_0(4) of Theorem 4, with ⟨F,F⟩=∫_{Γ_0(4)\H}|F|²dμ=1 and b(dm²) given by m Σ_{n|m} n^{−3/2}(d/n) b(m²d/n²) = a(m)b(d) (F is unique only up to a unimodular constant). For coprime negative fundamental discriminants d′, d, D=d′d>0 and χ the genus character of D=d′d: 12√π D^{3/4} b(d′) conj(b(d)) = ⟨φ,φ⟩^{−1}(λ/2)Σ_{A∈Cl⁺(K)} χ(A)∫_{F_A}φ(z)dμ(z).
  TauCeti.Metaplectic.shimura_negativeTrace [target]: Let φ(z)=2y^{1/2}Σ_{n≠0}a(n)K_{ir}(2π|n|y)e(nx) be an even Hecke–Maass cusp form for Γ=PSL(2,Z) with a(1)=1 and Laplace eigenvalue λ=1/4+r², and let F(z)=Σ_{n≡0,1 (mod 4), n≠0} b(n)W_{sgn(n)/4, ir/2}(4π|n|y)e(nx) be the weight-1/2 form for Γ_0(4) of Theorem 4, with ⟨F,F⟩=∫_{Γ_0(4)\H}|F|²dμ=1 and b(dm²) given by m Σ_{n|m} n^{−3/2}(d/n) b(m²d/n²) = a(m)b(d) (F is unique only up to a unimodular constant). For coprime negative fundamental discriminants d′, d, D=d′d>0 and χ the genus character of D=d′d: 12√π D^{3/4} b(d′) conj(b(d)) = ⟨φ,φ⟩^{−1}(λ/2)Σ_{A∈Cl⁺(K)} χ(A)∫_{F_A}φ(z)dμ(z).

MetaplecticAutomorphicForms:MP.7/positive-factor-trace — Theorem4 positive factors
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For coprime positive fundamental d,d′, 12√πD^(3/4)b(d′)conj(b(d))=||φ||⁻²Σ_Aχ(A)∫_{C_A}φds, with the same normalized φ and unit half-weight eigenline. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite.
  TauCeti.Metaplectic.shimura_positiveTrace [target]: For coprime positive fundamental d,d′, 12√πD^(3/4)b(d′)conj(b(d))=||φ||⁻²Σ_Aχ(A)∫_{C_A}φds, with the same normalized φ and unit half-weight eigenline.

MetaplecticAutomorphicForms:MP.7/cm-trace — Theorem4 CM factors
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For coprime fundamental d,d′ of opposite sign, 12√π|D|^(3/4)b(d′)conj(b(d))=||φ||⁻²(2√π/ω_D)Σ_Aχ(A)φ(z_A). Keep both 2√π and ω_D; the paper explicitly corrects the earlier CM constant. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite.
  TauCeti.Metaplectic.shimura_cmTrace [target]: For coprime fundamental d,d′ of opposite sign, 12√π|D|^(3/4)b(d′)conj(b(d))=||φ||⁻²(2√π/ω_D)Σ_Aχ(A)φ(z_A). Keep both 2√π and ω_D; the paper explicitly corrects the earlier CM constant.

MetaplecticAutomorphicForms:MP.7/duke-coefficient-bound — Duke coefficient estimate with spectral factor
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.
  TauCeti.Metaplectic.halfWeight_dukeBound [target]: For an L²-unit weight k=1/2 spectral cusp form on fixed Γ₀(4), eigenvalue1/4+t², its standard W coefficient at a fundamental discriminant n satisfies |b(n)|≪_ε(1+|t|)^C cosh(πt/2)|n|^(−2/7+ε). Here the half-weight form in Theorem4 has t=r/2. The exponential factor is explicitly present in Duke88 Theorem5. The bound is for unit Petersson norm; translating to the a(1)=1 lift keeps the norm and its spectral factor. No unverified r^ε symmetric-square estimate is imported.

MetaplecticAutomorphicForms:MP.7/plus-normalization-conjugation — Exact conjugation of the two U and W normalizations
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: On functions on H let C f(z)=Im(z)^(1/4)f(z), U₄f(z)=¼Σ_{ν mod4}f((z+ν)/4), W₄f(z)=(2z/i)^(−1/2)f(−1/(4z)) with the principal square root. Then CU₄C⁻¹=U and CW₄C⁻¹=W for the U,W displayed in DIT16 p976, and C(U₄∘W₄)C⁻¹=U∘W. This calculation alone does not identify U∘W with W∘U on the automorphic subspace.
  TauCeti.Metaplectic.plusOperators_conjugation [target]: On functions on H let C f(z)=Im(z)^(1/4)f(z), U₄f(z)=¼Σ_{ν mod4}f((z+ν)/4), W₄f(z)=(2z/i)^(−1/2)f(−1/(4z)) with the principal square root. Then CU₄C⁻¹=U and CW₄C⁻¹=W for the U,W displayed in DIT16 p976, and C(U₄∘W₄)C⁻¹=U∘W. This calculation alone does not identify U∘W with W∘U on the automorphic subspace.

MetaplecticAutomorphicForms:MP.7/finite-fourier-automorphy — Automorphy from finite Fourier separation
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Supply the source Lemma10 and equation(14) (Biró printed128–129, PDF26–27), including the Kuznetsov/special-function convergence argument, actual genus-weighted traces and V*_{1/2}(4N)→Γ₀(N) spaces. Finite coefficient separation proves automorphy only after this identity; an unnamed identity183 or a nonexistent source theta kernel cannot supply it.
  TauCeti.Metaplectic.shimura_finiteFourierAutomorphy [target]: At N=1, assume convergence of the source-defined Biró Fourier series and equation(14) on printed129/PDF27 for every positive admissible n=s/D. This identity states that the conjugated-coefficient linear combination of Sh_D f_j equals the stated finite genus-weighted weight-zero cusp trace combination. Then each Sh_D f is a level-one weight-zero cusp eigenform at parameter r (possibly zero), for every f∈W. If D>0 the coefficient formula is even in the Fourier index, so the lift is even.

MetaplecticAutomorphicForms:MP.7/dit11-eisenstein-comparison — Coefficients of the weight-1/2 plus-space Eisenstein series (black box from [16])
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: In the notation of DIT11 ([16]): for m∈Z⁺ and D a fundamental discriminant, Σ_{n|m}(D/n) b_0(Dm²/n², s) = 2^{2−4s}π^{s+1/4}m^{3/2−2s}|D|^{s−1/4}σ_{4s−2}(m)L_D(2s−1/2)/ζ(4s−1), and b_0(0,s)=π^{1/2}2^{5/2−6s}Γ(2s)ζ(4s−2)/ζ(4s−1), where b_0(n,s) are the Fourier coefficients of P⁺_0(τ,s) in [16, (2.20)–(2.21)]. Consequently E*_{1/2}(z,s) = 2^sΛ(2s) y^{1/4} P⁺_0(z, s/2+1/4) has the expansion displayed on DIT16 p964, with b(d,s)=(4π)^{−1/4}|d|^{−3/4}Λ(s,χ_d) for fundamental d and the stated Shimura relation.
  TauCeti.Metaplectic.halfWeightEisenstein_dit11 [target]: In the notation of DIT11 ([16]): for m∈Z⁺ and D a fundamental discriminant, Σ_{n|m}(D/n) b_0(Dm²/n², s) = 2^{2−4s}π^{s+1/4}m^{3/2−2s}|D|^{s−1/4}σ_{4s−2}(m)L_D(2s−1/2)/ζ(4s−1), and b_0(0,s)=π^{1/2}2^{5/2−6s}Γ(2s)ζ(4s−2)/ζ(4s−1), where b_0(n,s) are the Fourier coefficients of P⁺_0(τ,s) in [16, (2.20)–(2.21)]. Consequently E*_{1/2}(z,s) = 2^sΛ(2s) y^{1/4} P⁺_0(z, s/2+1/4) has the expansion displayed on DIT16 p964, with b(d,s)=(4π)^{−1/4}|d|^{−3/4}Λ(s,χ_d) for fundamental d and the stated Shimura relation.

MetaplecticAutomorphicForms:MP.7/resolvent-fourier-comparison — Fourier expansion and residues of the weight-1/2 resolvent (Fay, cited)
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.
  TauCeti.Metaplectic.halfWeightResolvent_fourier [target]: Let Re(s)>1 and Im z′>Im z, with z in reduced position. Then G_{1/2}(z′,z;s)=Σ_{n≠0}F_{1/2,n}(z,s)W_{sgn(n)/4,s−1/2}(4π|n|y′)e(−nx′) plus the n=0 (Eisenstein) term, with F_{1/2,n} as in (8.6). G_{1/2} continues meromorphically in s, and Res_{s=1/2+ir/2}(2s−1)G_{1/2}(z′,z;s)=Σ_ψ conj(ψ(z′))ψ(z) over an orthonormal basis of V_r. By Fay [20, Cor. 3.6, p.178], Φ⁺(n,d;s) continues meromorphically to all s.

MetaplecticAutomorphicForms:MP.7/shimura-dirichlet-series — Shimura Dirichlet-series identity for ψ∈B_r
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Let ψ∈B_r have coefficients b(n) as in (10.1), and let d be a fundamental discriminant. Then L_d(s+1/2)Σ_{n≥1}b(dn²)n^{1−s}=b(d)Π_p(1−a_ψ(p)p^{−s}+p^{−2s})⁻¹, where L_d(s)=L(s,χ_d)=Σ_{n≥1}(d/n)n^{−s} and a_ψ(p) is the T_{p²}-eigenvalue for odd p and the specified plus-space Hecke eigenvalue at p=2. Comparing coefficients gives mΣ_{n|m}n^{−3/2}(d/n)b(m²d/n²)=a_ψ(m)b(d) (item 122).
  TauCeti.Metaplectic.shimura_dirichletSeries [target]: Let ψ∈B_r have coefficients b(n) as in (10.1), and let d be a fundamental discriminant. Then L_d(s+1/2)Σ_{n≥1}b(dn²)n^{1−s}=b(d)Π_p(1−a_ψ(p)p^{−s}+p^{−2s})⁻¹, where L_d(s)=L(s,χ_d)=Σ_{n≥1}(d/n)n^{−s} and a_ψ(p) is the T_{p²}-eigenvalue for odd p and the specified plus-space Hecke eigenvalue at p=2. Comparing coefficients gives mΣ_{n|m}n^{−3/2}(d/n)b(m²d/n²)=a_ψ(m)b(d) (item 122).

MetaplecticAutomorphicForms:MP.7/biro-shintani-lift — Biró lift
Emitted: the Fourier series over all nonzero positive and negative indices with |Q|^(1/2)/P divisor coefficient and positive-D inputs, complex spectral parameter, kernel/zero and coefficient2=1/2 tests. Missing: actual general-level Maass carrier, Fourier extraction, Whittaker W, eigen-equation, trace identity(14), convergence and corrected analytic proof. The spectral API is omitted instead of replacing a Laplace theorem by an arithmetic equality.
  TauCeti.Metaplectic.biroLift_spectral [api]: Half-weight parameter t gives weight-zero parameter2t in the negative Laplacian convention.

MetaplecticAutomorphicForms:MP.7/adelic-classical-half-weight — Adelic and classical half-weight comparison
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: The full adelization equivalence and metaplectic Hecke comparison need an exact original proof source. QM.3 owns the holomorphic-weight Laplacian; its concrete conjugacy, not an identical formula, supplies this comparison. Supplier categories: AutomorphicFormsOnReductiveGroups:AF.1, AutomorphicFormsOnReductiveGroups:AF.2, QSeriesPartitionsAndMockModularForms:QM.3/weight-k-hyperbolic-laplacian.
  TauCeti.Metaplectic.halfWeight_adelicClassical [target]: For the actual rank-one adelic cover and a specified finite-level genuine vector, evaluate along the real Iwasawa section over H to obtain a classical half-integral-weight form with its theta multiplier. Conversely adelize a classical form with the compatible congruence/character and cusp conditions. The comparison intertwines right Hecke actions and matches the positive Fourier e(nx), chosen Whittaker normalization, and the y^{k/2} holomorphic-to-unitary weight change. At weight1/2 the conjugated Laplacian is Δ_unit,1/2=y^{1/4}Δ_hol,1/2 y^{−1/4}+3/16.

MetaplecticAutomorphicForms:MP.7/bfh-kernel-import — BFH metaplectic kernel interface
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: BFH proofs after printed553 and its local Whittaker/Euler computations have no newly checked proof in this revision. They are supplied as planned MP.8 nodes with their own open proof gates, not promoted to checked results.
  TauCeti.Metaplectic.bfh_halfWeightKernelComparison [target]: Import the genuine genus-two BFH kernel, its theta components, two-cusp Whittaker expansions, actual local test vectors and unramified Euler-factor ratio from MP.8. Its normalized Siegel parameter is s−2 and its original newform conductor is M, while the auxiliary arithmetic level is N. MP.7 supplies the common multiplier/Fourier conventions and compares their restriction with the rank-one half-weight theory; BSD.2 consumes MP.8/bsd2-export and owns the final twist nonvanishing argument.

MetaplecticAutomorphicForms:MP.7/ramified-quadratic-twist-kernel-inputs — Ramified quadratic-twist kernel inputs
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: FH95 full public mathematical text was not obtained: only the publisher metadata was read. Its exact kernel/ramified-local adapter remains to be stated after acquisition. This records the missing MP.7 target explicitly instead of claiming the BFH family proves it.; Removed BSD.2 as a prerequisite and request: RankZeroOneBSD--BSD.0.json, BSD.2/twist-series-residue imports MP.7 and MP.8, so importing the whole BSD.2 stage back into the MP.7 kernel interface creates feedback. The separate original FH95 kernel, level/character restrictions and ramified/dyadic comparison are still unread/unavailable in this packet. Establish that analytic adapter from the original source and route its own independent supplier; BSD.2 remains the owner of continuation/residue/positivity and nonvanishing. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0.
  TauCeti.Metaplectic.quadraticTwist_kernelInputs [target]: For the BFH route, export the supplier’s actual ramified local character/test-vector integrals and nonzero finite K-type tests together with its normalized Euler factors. For the separate Friedberg–Hoffstein route, require the original kernel, its exact level/character restrictions, each ramified and dyadic integral, and its Fourier coefficient comparison before an identification with this common interface is asserted. The unavailable original FH kernel formula is an explicit source gap; no generic formal half-weight symbol is used in its place.

MetaplecticAutomorphicForms:MP.5/genuine-eisenstein-family — Genuine Eisenstein families
Emitted: coset-sum formula, termwise central-sign covariance and zero/one-term tests. Missing: the actual normalized induced representation, verified chamber, convergence, continuation and normalized-cover constant-term intertwiners. The one-term example is not the Siegel evaluation-section parameter theorem.
  TauCeti.Metaplectic.genuineEisenstein_constantTerm [api]: Its constant term is expressed by the specified normalized cover intertwiners.

MetaplecticAutomorphicForms:MP.6/toric-theta-pairing-interface — Toric theta pairing interface
No target theorem is emitted against arbitrary independent data. Required source construction or proof input: YZZ’s 6 November 2011 author draft §§2.2–2.4 pp.48–55 was reported read in the earlier source pass: it gives the nonsplit Shimizu contraction, toric unfolding and normalization, but sends the split quaternion case to Waldspurger’s different argument without Siegel–Weil. The original split proof and its exact normalized local/global contraction are still required. A source-qualified regularized replacement would instead have to identify the GQT quotient terms with the actual cuspidal pairing and justify every residual/projection term. MP.6 supplies that analytic adapter, never the downstream GZ.5 special-value theorem; native carriers and ramified/source-proof closure remain open.; Removed GZ.5 as a prerequisite and request: this node explicitly exports the normalized pairing to the Waldspurger owner, so the consumer period identity cannot justify its input. Supply the precise norm-torus orbit/character dictionary independently (with arithmetic and AA quotient/measure owners), including ramified factors and absolute integrability on both quotients. Do not move the Waldspurger special-value theorem into MP.6. Supplier categories: AdelicAlgebraicGroups:AA.1.
  TauCeti.Metaplectic.toricTheta_pairingComparison [target]: For an anisotropic norm torus T and a compatible quadratic/quaternionic theta kernel, unfold the toric theta pairing into the local oscillator/orbital integrals only after proving the product integrand absolutely integrable on [T] and the companion quotient. Match the torus character, rational splitting, self-dual additive measures and quotient Haar. Export these local factors and the global see-saw to GZ.5; the exact Waldspurger special-value identity and its arithmetic comparisons stay there.
-/

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
-- κ(X) is the unique compact factor in BFH (3.2) of
-- [[0,w],[−w,0]] n(X), w=[[0,−1],[1,0]]; Q' has positive diagonal.
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


-- The homogeneous section defining this Jacquet integral is BFH (3.11).
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

-- The corrected pair follows the evaluated integrals (3.26)–(3.27), p.565.
-- Both integrals contain the inverse of the FIRST gamma argument below.
-- Cancellation leaves the second gamma factor; the negative pair itself is unchanged.
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
-- R=c(s)⁻¹M uses the separately specified scalar factors; it is not the
-- raw standard M in the constant term or the unnormalized Eisenstein Weyl equation.
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
      ∀ s F g, Ec s F g=Ec (4-s) (genuineIntertwiner s F) g := by sorry


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
-- F±,M,Mt,tau must arise from the coefficient phi below and its single fixed
-- BFH finite K-type with proven tail estimates; these comparison maps are untyped.
theorem two_variable_polar_combination (N m k : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N∣m)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (hd : HasBFHDivisor k phi)
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
