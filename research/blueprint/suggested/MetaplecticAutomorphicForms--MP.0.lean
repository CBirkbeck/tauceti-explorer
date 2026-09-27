/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These signatures suggest Lean forms so contributors and reviewers
can converge on names and signatures. Proof placeholders are not implementations.
-/
import TauCeti.RepresentationTheory.ProjectiveRepresentation.Extension
import TauCeti.LinearAlgebra.BilinearForm.Isometry
import Mathlib.LinearAlgebra.Matrix.BilinearForm
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Data.ZMod.Basic

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
