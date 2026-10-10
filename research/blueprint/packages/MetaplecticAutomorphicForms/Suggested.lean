import Mathlib
import TauCeti.RepresentationTheory.ProjectiveRepresentation.Extension
import TauCeti.LinearAlgebra.BilinearForm.Isometry

/-!
# MetaplecticAutomorphicForms: representative target signatures

The roadmap is README.md. This file records definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. It makes explicit the
coefficient-first Heisenberg convention, the distinction between circle and double
covers, Fourier signs, genuine central actions and genus-two Gaussian measures.
Algebraic function operators and real-line analytic specializations have their
displayed domains; full smooth local-field and adelic comparisons require the
corresponding supplier carriers.
-/

set_option linter.unusedVariables false

namespace TauCetiRoadmap.MetaplecticAutomorphicForms

/-! ## Layer 0: Symplectic and Heisenberg groups with topology -/

namespace Heisenberg

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

/-- Bilinear Factor Set apply, with the hypotheses and domain displayed below. -/
theorem bilinearFactorSet_apply (B : LinearMap.BilinMap R W C) (x y : W) :
    (bilinearFactorSet B (ofAdd x, ofAdd y)).toAdd = B x y := by sorry

/-- Bilinear Factor Set mul left, with the hypotheses and domain displayed below. -/
theorem bilinearFactorSet_mul_left (B : LinearMap.BilinMap R W C)
    (p q : (bilinearFactorSet B).Extension) :
    (p * q).left.toAdd = p.left.toAdd + q.left.toAdd +
      B p.right.toAdd q.right.toAdd := by sorry

/-- Bilinear Factor Set mul right, with the hypotheses and domain displayed below. -/
theorem bilinearFactorSet_mul_right (B : LinearMap.BilinMap R W C)
    (p q : (bilinearFactorSet B).Extension) :
    (p * q).right.toAdd = p.right.toAdd + q.right.toAdd := by sorry

/-- Bilinear Factor Set inv, with the hypotheses and domain displayed below. -/
theorem bilinearFactorSet_inv (B : LinearMap.BilinMap R W C)
    (p : (bilinearFactorSet B).Extension) :
    p⁻¹ = ⟨ofAdd (-p.left.toAdd + B p.right.toAdd p.right.toAdd),
      ofAdd (-p.right.toAdd)⟩ := by sorry

/-- Bilinear Factor Set commutator, with the hypotheses and domain displayed below. -/
theorem bilinearFactorSet_commutator (B : LinearMap.BilinMap R W C)
    (p q : (bilinearFactorSet B).Extension) :
    p * q * p⁻¹ * q⁻¹ = (bilinearFactorSet B).inl
      (ofAdd (B p.right.toAdd q.right.toAdd - B q.right.toAdd p.right.toAdd)) := by sorry

/-- Bilinear Factor Set mem center iff, with the hypotheses and domain displayed below. -/
theorem bilinearFactorSet_mem_center_iff (B : LinearMap.BilinMap R W C)
    (p : (bilinearFactorSet B).Extension) :
    p ∈ Subgroup.center (bilinearFactorSet B).Extension ↔
      ∀ y : W, B p.right.toAdd y = B y p.right.toAdd := by sorry

/-- Half Form commutator, with the hypotheses and domain displayed below. -/
theorem halfForm_commutator (B : BilinForm R W) (hB : B.IsAlt) [Invertible (2 : R)]
    (p q : (bilinearFactorSet ((⅟ (2 : R)) • B)).Extension) :
    p * q * p⁻¹ * q⁻¹ = (bilinearFactorSet ((⅟ (2 : R)) • B)).inl
      (ofAdd (B p.right.toAdd q.right.toAdd)) := by sorry

/-- Half Form center, with the hypotheses and domain displayed below. -/
theorem halfForm_center (B : BilinForm R W) (hB : B.IsAlt) (hn : B.Nondegenerate)
    [Invertible (2 : R)] :
    Subgroup.center (bilinearFactorSet ((⅟ (2 : R)) • B)).Extension =
      ((bilinearFactorSet ((⅟ (2 : R)) • B)).inl).range := by sorry

/-- Native bilinear isometries act on the already constructed extensions. -/
def extensionIsometry {B : BilinForm R W} {C : BilinForm R W'}
    (e : B.IsometryEquiv C) :
    (bilinearFactorSet B).Extension ≃* (bilinearFactorSet C).Extension := by sorry

/-- Extension Isometry apply, with the hypotheses and domain displayed below. -/
theorem extensionIsometry_apply {B : BilinForm R W} {C : BilinForm R W'}
    (e : B.IsometryEquiv C) (p : (bilinearFactorSet B).Extension) :
    extensionIsometry e p = ⟨p.left, ofAdd (e p.right.toAdd)⟩ := by sorry

/-- Extension Isometry refl, with the hypotheses and domain displayed below. -/
theorem extensionIsometry_refl (B : BilinForm R W) :
    extensionIsometry (LinearMap.BilinForm.IsometryEquiv.refl B) = MulEquiv.refl _ := by sorry

/-- Extension Isometry trans, with the hypotheses and domain displayed below. -/
theorem extensionIsometry_trans {B : BilinForm R W} {C : BilinForm R W'}
    {D : BilinForm R W''} (e : B.IsometryEquiv C) (f : C.IsometryEquiv D) :
    extensionIsometry (e.trans f) = (extensionIsometry e).trans (extensionIsometry f) := by sorry

/-- Extension Isometry inl, with the hypotheses and domain displayed below. -/
theorem extensionIsometry_inl {B : BilinForm R W} {C : BilinForm R W'}
    (e : B.IsometryEquiv C) (t : R) :
    extensionIsometry e ((bilinearFactorSet B).inl (ofAdd t)) =
      (bilinearFactorSet C).inl (ofAdd t) := by sorry

/-- Action homomorphism from the native bilinear isometry group. -/
def extensionIsometryAction (B : BilinForm R W) :
    TauCeti.BilinForm.isometryGroup B →* MulAut (bilinearFactorSet B).Extension := by sorry

/-- Extension Isometry Action apply, with the hypotheses and domain displayed below. -/
theorem extensionIsometryAction_apply (B : BilinForm R W)
    (e : TauCeti.BilinForm.isometryGroup B) (p : (bilinearFactorSet B).Extension) :
    extensionIsometryAction B e p =
      ⟨p.left, ofAdd ((e : W ≃ₗ[R] W) p.right.toAdd)⟩ := by sorry

#check TauCeti.FactorSet.groupExtension
#check TauCeti.FactorSet.rescaleEquiv
#check TauCeti.BilinForm.isometryGroup

/-- Polarization cocycle, with the hypotheses and domain displayed below. -/
theorem polarization_cocycle (B : BilinForm R W) [Invertible (2 : R)] (x y : W) :
    (⅟ (2 : R)) * (B x y - B y x) + (⅟ (2 : R)) * B (x+y) (x+y) =
      B x y + (⅟ (2 : R)) * B x x + (⅟ (2 : R)) * B y y := by sorry

/-- Change from half the alternating form to the polarized bilinear cocycle. -/
def polarizationEquiv (B : BilinForm R W) [Invertible (2 : R)] :
    (bilinearFactorSet ((⅟ (2 : R)) • (B - B.flip))).Extension ≃*
      (bilinearFactorSet B).Extension := by sorry

/-- Polarization Equiv apply, with the hypotheses and domain displayed below. -/
theorem polarizationEquiv_apply (B : BilinForm R W) [Invertible (2 : R)]
    (p : (bilinearFactorSet ((⅟ (2 : R)) • (B - B.flip))).Extension) :
    polarizationEquiv B p =
      ⟨ofAdd (p.left.toAdd + (⅟ (2 : R)) * B p.right.toAdd p.right.toAdd), p.right⟩ := by sorry

/-- Polarization Equiv symm apply, with the hypotheses and domain displayed below. -/
theorem polarizationEquiv_symm_apply (B : BilinForm R W) [Invertible (2 : R)]
    (p : (bilinearFactorSet B).Extension) :
    (polarizationEquiv B).symm p =
      ⟨ofAdd (p.left.toAdd - (⅟ (2 : R)) * B p.right.toAdd p.right.toAdd), p.right⟩ := by sorry

/-- Polarization Equiv inl, with the hypotheses and domain displayed below. -/
theorem polarizationEquiv_inl (B : BilinForm R W) [Invertible (2 : R)] (t : R) :
    polarizationEquiv B ((bilinearFactorSet ((⅟ (2 : R)) • (B - B.flip))).inl (ofAdd t)) =
      (bilinearFactorSet B).inl (ofAdd t) := by sorry

/-- Central Character multiplicative iff, with the hypotheses and domain displayed below. -/
theorem centralCharacter_multiplicative_iff {A : Type*} [Group A]
    (B : LinearMap.BilinMap R W C) (chi : Multiplicative C →* A) :
    (∀ p q : (bilinearFactorSet B).Extension, chi (p*q).left = chi p.left * chi q.left) ↔
      ∀ x y : W, chi (ofAdd (B x y)) = 1 := by sorry

/-- The character (t,w) ↦ chi(t), with its necessary cocycle condition explicit. -/
def centralCharacter {A : Type*} [Group A] (B : LinearMap.BilinMap R W C)
    (chi : Multiplicative C →* A) (hchi : ∀ x y : W, chi (ofAdd (B x y)) = 1) :
    (bilinearFactorSet B).Extension →* A := by sorry

/-- Central Character apply, with the hypotheses and domain displayed below. -/
theorem centralCharacter_apply {A : Type*} [Group A] (B : LinearMap.BilinMap R W C)
    (chi : Multiplicative C →* A) (hchi : ∀ x y : W, chi (ofAdd (B x y)) = 1)
    (p : (bilinearFactorSet B).Extension) : centralCharacter B chi hchi p = chi p.left := by sorry

/-- Central Character inl, with the hypotheses and domain displayed below. -/
theorem centralCharacter_inl {A : Type*} [Group A] (B : LinearMap.BilinMap R W C)
    (chi : Multiplicative C →* A) (hchi : ∀ x y : W, chi (ofAdd (B x y)) = 1) (t : C) :
    centralCharacter B chi hchi ((bilinearFactorSet B).inl (ofAdd t)) = chi (ofAdd t) := by sorry

/-- Central Character canonical Section, with the hypotheses and domain displayed below. -/
theorem centralCharacter_canonicalSection {A : Type*} [Group A] (B : LinearMap.BilinMap R W C)
    (chi : Multiplicative C →* A) (hchi : ∀ x y : W, chi (ofAdd (B x y)) = 1) (x : W) :
    centralCharacter B chi hchi ((bilinearFactorSet B).canonicalSection (ofAdd x)) = 1 := by sorry

/-- Extension Isometry Action inl, with the hypotheses and domain displayed below. -/
theorem extensionIsometryAction_inl (B : BilinForm R W)
    (e : TauCeti.BilinForm.isometryGroup B) (t : R) :
    extensionIsometryAction B e ((bilinearFactorSet B).inl (ofAdd t)) =
      (bilinearFactorSet B).inl (ofAdd t) := by sorry

/-- Extension Isometry Action injective, with the hypotheses and domain displayed below. -/
theorem extensionIsometryAction_injective (B : BilinForm R W) :
    Function.Injective (extensionIsometryAction B) := by sorry

/-- Central Character unique, with the hypotheses and domain displayed below. -/
theorem centralCharacter_unique {A : Type*} [Group A] (B : LinearMap.BilinMap R W C)
    (chi : Multiplicative C →* A) (hchi : ∀ x y : W, chi (ofAdd (B x y)) = 1)
    (rho : (bilinearFactorSet B).Extension →* A)
    (hc : ∀ t : C, rho ((bilinearFactorSet B).inl (ofAdd t)) = chi (ofAdd t))
    (hs : ∀ x : W, rho ((bilinearFactorSet B).canonicalSection (ofAdd x)) = 1) :
    rho = centralCharacter B chi hchi := by sorry

example (p q : (bilinearFactorSet (0 : BilinForm ℤ ℤ)).Extension) :
    (p*q).left.toAdd = p.left.toAdd + q.left.toAdd := by sorry

example : (bilinearFactorSet (Matrix.toBilin' (!![0,1;0,0] : Matrix (Fin 2) (Fin 2) ℤ))
    (ofAdd ![1,0],ofAdd ![0,1])).toAdd = 1 := by sorry

example : (bilinearFactorSet (Matrix.toBilin' (!![0,1;0,0] : Matrix (Fin 2) (Fin 2) ℤ))
    (ofAdd ![0,1],ofAdd ![1,0])).toAdd = 0 := by sorry

example : extensionIsometry (LinearMap.BilinForm.IsometryEquiv.refl (0 : BilinForm ℤ ℤ))
    ⟨ofAdd 3,ofAdd 4⟩ = ⟨ofAdd 3,ofAdd 4⟩ := by sorry

example (B : BilinForm ℤ ℤ) :
    let e : B.IsometryEquiv B :=
      { LinearEquiv.neg ℤ with map_app' := by intros; simp }
    extensionIsometry e ⟨ofAdd 3,ofAdd 4⟩ = ⟨ofAdd 3,ofAdd (-4)⟩ := by sorry

example {B : BilinForm R W} {D : BilinForm R W'}
    (e : B.IsometryEquiv D) (p : (bilinearFactorSet B).Extension) :
    extensionIsometry e.symm (extensionIsometry e p) = p := by sorry

example : extensionIsometryAction (0 : BilinForm ℤ ℤ) 1
    ⟨ofAdd 3,ofAdd 4⟩ = ⟨ofAdd 3,ofAdd 4⟩ := by sorry

example :
    let e : TauCeti.BilinForm.isometryGroup (0 : BilinForm ℤ ℤ) :=
      ⟨LinearEquiv.neg ℤ, by intro x y; simp⟩
    extensionIsometryAction (0 : BilinForm ℤ ℤ) e
      ⟨ofAdd 3,ofAdd 4⟩ = ⟨ofAdd 3,ofAdd (-4)⟩ := by sorry

example (B : BilinForm R W) (e : TauCeti.BilinForm.isometryGroup B) (t : R) :
    extensionIsometryAction B e ((bilinearFactorSet B).inl (ofAdd t)) =
      (bilinearFactorSet B).inl (ofAdd t) := by sorry

example [Invertible (2 : ℚ)] :
    polarizationEquiv (0 : BilinForm ℚ ℚ) ⟨ofAdd 3,ofAdd 4⟩ =
      ⟨ofAdd 3,ofAdd 4⟩ := by sorry

example [Invertible (2 : ℚ)] :
    polarizationEquiv (Matrix.toBilin' (!![0,1;0,0] : Matrix (Fin 2) (Fin 2) ℚ))
      ⟨ofAdd 0,ofAdd ![2,3]⟩ = ⟨ofAdd 3,ofAdd ![2,3]⟩ := by sorry

example [Invertible (2 : ℚ)] :
    (polarizationEquiv (Matrix.toBilin' (!![0,1;0,0] : Matrix (Fin 2) (Fin 2) ℚ))).symm
      ⟨ofAdd 0,ofAdd ![2,3]⟩ = ⟨ofAdd (-3),ofAdd ![2,3]⟩ := by sorry

example : centralCharacter (0 : BilinForm ℤ ℤ) (MonoidHom.id _) (by intros; rfl)
    ⟨ofAdd 3,ofAdd 4⟩ = ofAdd 3 := by sorry

example (B : LinearMap.BilinMap R W C) :
    centralCharacter B (1 : Multiplicative C →* Multiplicative ℤ) (by intros; rfl) = 1 := by sorry

example : centralCharacter (0 : BilinForm ℤ ℤ) (MonoidHom.id _) (by intros; rfl)
    (1 : (bilinearFactorSet (0 : BilinForm ℤ ℤ)).Extension) = 1 := by sorry

example [Invertible (2 : ℚ)] :
    let B := Matrix.toBilin' (!![0,1;-1,0] : Matrix (Fin 2) (Fin 2) ℚ)
    let p : (bilinearFactorSet ((⅟ (2 : ℚ)) • B)).Extension := ⟨ofAdd 0,ofAdd ![1,0]⟩
    let q : (bilinearFactorSet ((⅟ (2 : ℚ)) • B)).Extension := ⟨ofAdd 0,ofAdd ![0,1]⟩
    (p*q*p⁻¹*q⁻¹).left.toAdd = 1 := by sorry

example :
    let B := Matrix.toBilin' (!![0,1;0,0] : Matrix (Fin 2) (Fin 2) (ZMod 2))
    let p : (bilinearFactorSet B).Extension := ⟨ofAdd 0,ofAdd ![1,0]⟩
    let q : (bilinearFactorSet B).Extension := ⟨ofAdd 0,ofAdd ![0,1]⟩
    p*q ≠ q*p := by sorry

example :
    let B := Matrix.toBilin' (!![0,1;0,0] : Matrix (Fin 2) (Fin 2) ℤ)
    ¬ (∀ p q : (bilinearFactorSet B).Extension,
      (p*q).left = p.left*q.left) := by sorry

example : Subgroup.center (bilinearFactorSet (0 : BilinForm ℤ ℤ)).Extension ≠
    ((bilinearFactorSet (0 : BilinForm ℤ ℤ)).inl).range := by sorry

/-- Applying negation twice restores the coefficient-first point. -/
example :
    let e : TauCeti.BilinForm.isometryGroup (0 : BilinForm ℤ ℤ) :=
      ⟨LinearEquiv.neg ℤ, by intro x y; simp⟩
    extensionIsometryAction (0 : BilinForm ℤ ℤ) e
      (extensionIsometryAction (0 : BilinForm ℤ ℤ) e ⟨ofAdd 3,ofAdd 4⟩) =
        ⟨ofAdd 3,ofAdd 4⟩ := by sorry

end Heisenberg
noncomputable section
open MeasureTheory Module Representation
open scoped TensorProduct SchwartzMap UpperHalfPlane NNReal
attribute [local instance] Classical.propDecidable
attribute [local instance] TauCeti.trivialMulDistribMulAction

section Algebra
variable {F V W G N : Type*} [Field F] [AddCommGroup V] [Module F V]
 [AddCommGroup W] [Module F W] [Group G] [Group N]
open Heisenberg

/-- Heisenberg haar, with the hypotheses and domain displayed below. -/
theorem heisenberg_haar (B : LinearMap.BilinForm F V)
    [TopologicalSpace F] [TopologicalSpace V] [IsTopologicalAddGroup F]
    [IsTopologicalAddGroup V] [MeasurableSpace F] [MeasurableSpace V]
    [BorelSpace F] [BorelSpace V] [SecondCountableTopology F] [SecondCountableTopology V]
    (μ : Measure F) (ν : Measure V) [SFinite μ] [SFinite ν]
    [μ.IsAddLeftInvariant] [ν.IsAddLeftInvariant]
    (hB : Continuous (fun q : V × V => B q.1 q.2)) (p : F × V) :
    Measure.map (fun q : F × V => (p.1+q.1+B p.2 q.2, p.2+q.2)) (μ.prod ν) =
      μ.prod ν := by sorry
/-- Schroedinger Formula in the specified native carrier. -/
def schroedingerFormula (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F)
    (t : F) (x : V) (y : W) (φ : V → ℂ) (u : V) : ℂ :=
  (ψ (Multiplicative.ofAdd (t+B u y+(2:F)⁻¹*B x y)) : ℂ)* φ (u+x)

/-- Schroedinger in the specified native carrier. -/
def schroedinger (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (t : F) (x : V) (y : W) : (V → ℂ) →ₗ[ℂ] (V → ℂ) := by sorry
/-- Schroedinger apply, with the hypotheses and domain displayed below. -/
theorem schroedinger_apply (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (t : F) (x : V) (y : W) (φ : V → ℂ) (u : V) : schroedinger ψ B t x y φ u = schroedingerFormula ψ B t x y φ u := by sorry
/-- Schroedinger center, with the hypotheses and domain displayed below. -/
theorem schroedinger_center (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (t : F) (φ : V → ℂ) : schroedinger ψ B t 0 0 φ = (ψ (Multiplicative.ofAdd t) : ℂ) • φ := by sorry
/-- Schroedinger mul, with the hypotheses and domain displayed below. -/
theorem schroedinger_mul (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (t s : F) (x a : V) (y b : W) (h2 : (2:F) ≠ 0) : (schroedinger ψ B t x y).comp (schroedinger ψ B s a b) = schroedinger ψ B (t+s+(2:F)⁻¹*(B x b-B a y)) (x+a) (y+b) := by sorry
/-- Schroedinger is Unitary, with the hypotheses and domain displayed below. -/
theorem schroedinger_isUnitary (ψ : Multiplicative F →* ℂˣ)
    (B : V →ₗ[F] W →ₗ[F] F) [TopologicalSpace V] [IsTopologicalAddGroup V]
    [MeasurableSpace V] [BorelSpace V] (μ : Measure V) [μ.IsAddLeftInvariant]
    (hψ : ∀ s, ‖(ψ (Multiplicative.ofAdd s) : ℂ)‖ = 1)
    (t : F) (x : V) (y : W) (φ : V → ℂ) :
    (∫ u, ‖schroedinger ψ B t x y φ u‖^2 ∂μ) = ∫ u, ‖φ u‖^2 ∂μ := by sorry

example (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (t : F) (φ : V → ℂ) : schroedinger ψ B t 0 0 φ = (ψ (Multiplicative.ofAdd t) : ℂ) • φ := by sorry

example (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (x u : V) (φ : V → ℂ) : schroedinger ψ B 0 x 0 φ u = φ (u+x) := by sorry

example (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (y : W) (u : V) (φ : V → ℂ) : schroedinger ψ B 0 0 y φ u = (ψ (Multiplicative.ofAdd (B u y)) : ℂ)*φ u := by sorry

example (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (x : V) (y : W) (h2 : (2:F) ≠ 0) : (schroedinger ψ B 0 x 0).comp (schroedinger ψ B 0 0 y) = (ψ (Multiplicative.ofAdd (B x y)) : ℂ) • ((schroedinger ψ B 0 0 y).comp (schroedinger ψ B 0 x 0)) := by sorry

/-- Induced Schroedinger Equiv in the specified native carrier. -/
def inducedSchroedingerEquiv (ψ : Multiplicative F →* ℂˣ) : {f : F × V → ℂ // ∀ t u, f (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*f (0,u)} ≃ (V → ℂ) := by sorry
/-- Induced Schroedinger Equiv apply, with the hypotheses and domain displayed below. -/
theorem inducedSchroedingerEquiv_apply (ψ : Multiplicative F →* ℂˣ) (f : {f : F × V → ℂ // ∀ t u, f (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*f (0,u)}) (u : V) : inducedSchroedingerEquiv ψ f u = f.val (0,u) := by sorry
/-- Induced Schroedinger Equiv covariance, with the hypotheses and domain displayed below. -/
theorem inducedSchroedingerEquiv_covariance (ψ : Multiplicative F →* ℂˣ) (φ : V → ℂ) (t : F) (u : V) : ((inducedSchroedingerEquiv ψ).symm φ).val (t,u) = (ψ (Multiplicative.ofAdd t) : ℂ)*φ u := by sorry
/-- Induced Schroedinger Translation in the specified native carrier. -/
def inducedSchroedingerTranslation (ψ : Multiplicative F →* ℂˣ)
    (B : V →ₗ[F] W →ₗ[F] F) (t : F) (x : V) (y : W)
    (f : {f : F × V → ℂ // ∀ s u, f (s,u) = (ψ (Multiplicative.ofAdd s) : ℂ)*f (0,u)}) :
    {f : F × V → ℂ // ∀ s u, f (s,u) = (ψ (Multiplicative.ofAdd s) : ℂ)*f (0,u)} :=
  ⟨fun q => f.val (q.1+t+B q.2 y+(2:F)⁻¹*B x y, q.2+x), by sorry⟩
/-- Induced Schroedinger Equiv intertwines, with the hypotheses and domain displayed below. -/
theorem inducedSchroedingerEquiv_intertwines (ψ : Multiplicative F →* ℂˣ)
    (B : V →ₗ[F] W →ₗ[F] F) (t : F) (x : V) (y : W)
    (f : {f : F × V → ℂ // ∀ s u, f (s,u) = (ψ (Multiplicative.ofAdd s) : ℂ)*f (0,u)}) :
    inducedSchroedingerEquiv ψ (inducedSchroedingerTranslation ψ B t x y f) =
      schroedinger ψ B t x y (inducedSchroedingerEquiv ψ f) := by sorry

example (ψ : Multiplicative F →* ℂˣ) (φ : V → ℂ) : ((inducedSchroedingerEquiv ψ).symm φ).val (0,0) = φ 0 := by sorry

example (ψ : Multiplicative F →* ℂˣ) (L : Set V) [DecidablePred (· ∈ L)] : inducedSchroedingerEquiv ψ ((inducedSchroedingerEquiv ψ).symm (L.indicator (fun _ => 1))) = L.indicator (fun _ => 1) := by sorry

example (ψ : Multiplicative ℚ →* ℂˣ) (h : ψ (Multiplicative.ofAdd (1/2)) = -1) : ψ (Multiplicative.ofAdd (1/2)) ≠ 1 := by sorry
end Algebra

section RealHilbert
open scoped ContDiff
variable (ψ : Multiplicative ℝ →* ℂˣ)
    (hψ : Continuous (fun s : ℝ => (ψ (Multiplicative.ofAdd s) : ℂ)))
    (hunit : ∀ s : ℝ, ‖(ψ (Multiplicative.ofAdd s) : ℂ)‖ = 1)

/-- Hilbert Schroedinger in the specified native carrier. -/
def hilbertSchroedinger (ψ : Multiplicative ℝ →* ℂˣ)
    (hψ : Continuous (fun s : ℝ => (ψ (Multiplicative.ofAdd s) : ℂ)))
    (hunit : ∀ s : ℝ, ‖(ψ (Multiplicative.ofAdd s) : ℂ)‖ = 1) (t x y : ℝ) :
    Lp ℂ 2 (volume : Measure ℝ) ≃ₗᵢ[ℂ] Lp ℂ 2 (volume : Measure ℝ) := by sorry
/-- Hilbert Schroedinger ae Formula, with the hypotheses and domain displayed below. -/
theorem hilbertSchroedinger_aeFormula (t x y : ℝ) (v : Lp ℂ 2 (volume : Measure ℝ)) :
    ⇑(hilbertSchroedinger ψ hψ hunit t x y v) =ᵐ[volume]
      (fun u => (ψ (Multiplicative.ofAdd (t+u*y+x*y/2)) : ℂ)*v (u+x)) := by sorry
/-- Hilbert Schroedinger norm, with the hypotheses and domain displayed below. -/
theorem hilbertSchroedinger_norm (t x y : ℝ) (v : Lp ℂ 2 (volume : Measure ℝ)) :
    ‖hilbertSchroedinger ψ hψ hunit t x y v‖ = ‖v‖ := by sorry
/-- Hilbert Schroedinger real Schwartz in the specified native carrier. -/
def hilbertSchroedinger_realSchwartz (ψ : Multiplicative ℝ →* ℂˣ)
    (hψ : Continuous (fun s : ℝ => (ψ (Multiplicative.ofAdd s) : ℂ)))
    (hunit : ∀ s : ℝ, ‖(ψ (Multiplicative.ofAdd s) : ℂ)‖ = 1) (t x y : ℝ) :
    SchwartzMap ℝ ℂ →ₗ[ℂ] SchwartzMap ℝ ℂ := by sorry
/-- Hilbert Schroedinger real Schwartz apply, with the hypotheses and domain displayed below. -/
theorem hilbertSchroedinger_realSchwartz_apply (t x y u : ℝ) (φ : SchwartzMap ℝ ℂ) :
    hilbertSchroedinger_realSchwartz ψ hψ hunit t x y φ u =
      (ψ (Multiplicative.ofAdd (t+u*y+x*y/2)) : ℂ)*φ (u+x) := by sorry
/-- Hilbert Schroedinger schwartz, with the hypotheses and domain displayed below. -/
theorem hilbertSchroedinger_schwartz (t x y : ℝ) (φ : SchwartzMap ℝ ℂ) :
    (hilbertSchroedinger_realSchwartz ψ hψ hunit t x y φ).toLp 2 volume =
      hilbertSchroedinger ψ hψ hunit t x y (φ.toLp 2 volume) := by sorry
/-- Hilbert Schroedinger strongly Continuous, with the hypotheses and domain displayed below. -/
theorem hilbertSchroedinger_stronglyContinuous (v : Lp ℂ 2 (volume : Measure ℝ)) :
    Continuous (fun p : ℝ × ℝ × ℝ =>
      hilbertSchroedinger ψ hψ hunit p.1 p.2.1 p.2.2 v) := by sorry

example (t : ℝ) (v : Lp ℂ 2 (volume : Measure ℝ)) :
    hilbertSchroedinger ψ hψ hunit t 0 0 v = (ψ (Multiplicative.ofAdd t) : ℂ) • v := by sorry

example (x : ℝ) : (∫ u : ℝ, ‖Complex.exp (-Real.pi * ((u+x)^2 : ℝ))‖^2) =
    ∫ u : ℝ, ‖Complex.exp (-Real.pi * (u^2 : ℝ))‖^2 := by sorry

example (t x y : ℝ) (f g : ℝ → ℂ) (hf : MemLp f 2 volume) (hg : MemLp g 2 volume)
    (hfg : f =ᵐ[volume] g) :
    hilbertSchroedinger ψ hψ hunit t x y (hf.toLp f) =
      hilbertSchroedinger ψ hψ hunit t x y (hg.toLp g) := by sorry

/-- Translation by one sends the Gaussian to its translate by +1 in the coordinate argument. -/
example (hg : MemLp (fun u : ℝ => Complex.exp (-Real.pi * (u^2 : ℝ))) 2 volume) :
    ⇑(hilbertSchroedinger ψ hψ hunit 0 1 0 (hg.toLp _)) =ᵐ[volume]
      (fun u : ℝ => Complex.exp (-Real.pi * ((u+1)^2 : ℝ))) := by sorry

/-- Modulation uses ψ(u), retaining the positive sign of the displayed Schrödinger model. -/
example (hg : MemLp (fun u : ℝ => Complex.exp (-Real.pi * (u^2 : ℝ))) 2 volume) :
    ⇑(hilbertSchroedinger ψ hψ hunit 0 0 1 (hg.toLp _)) =ᵐ[volume]
      (fun u : ℝ => (ψ (Multiplicative.ofAdd u) : ℂ) *
        Complex.exp (-Real.pi * (u^2 : ℝ))) := by sorry

/-- Oscillator smooth Vectors, with the hypotheses and domain displayed below. -/
theorem oscillator_smoothVectors (hne : ∃ s, ψ (Multiplicative.ofAdd s) ≠ 1)
    (v : Lp ℂ 2 (volume : Measure ℝ)) :
    (∃ φ : SchwartzMap ℝ ℂ, φ.toLp 2 volume = v) ↔
      ContDiff ℝ ∞ (fun p : ℝ × ℝ × ℝ =>
        hilbertSchroedinger ψ hψ hunit p.1 p.2.1 p.2.2 v) := by sorry
end RealHilbert

/-! ## Layer 1: Stone–von Neumann and the metaplectic extension -/

section Hilbert
variable {G N H K : Type*} [Group G] [Group N]
 [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
 [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]

/-- Unitary covariance subgroup for the displayed action and representation; no irreducibility is inferred. -/
def scalarNormalizer (act : G →* MulAut N) (ρ : ContRepresentation ℂ N H) : Subgroup (G × ↥(unitary (H →L[ℂ] H))) := by sorry
/-- Scalar Normalizer projection in the specified native carrier. -/
def scalarNormalizer_projection (act : G →* MulAut N) (ρ : ContRepresentation ℂ N H) : scalarNormalizer act ρ →* G := by sorry
/-- Scalar Normalizer covariance, with the hypotheses and domain displayed below. -/
theorem scalarNormalizer_covariance (act : G →* MulAut N) (ρ : ContRepresentation ℂ N H) (p : scalarNormalizer act ρ) (n : N) (v : H) : p.val.2.val (ρ n v) = ρ (act p.val.1 n) (p.val.2.val v) := by sorry
/-- Scalar Normalizer oscillator in the specified native carrier. -/
def scalarNormalizer_oscillator (act : G →* MulAut N) (ρ : ContRepresentation ℂ N H) : scalarNormalizer act ρ →* ↥(unitary (H →L[ℂ] H)) := by sorry

example [Subsingleton G] (act : G →* MulAut N)
    (ρ : ContRepresentation ℂ N ℂ) (p : scalarNormalizer act ρ) :
    ∃! z : ℂ, ‖z‖ = 1 ∧ ∀ v, p.val.2.val v = z • v := by sorry

example (z : ℂˣ) : z ∈ (show ℂˣ →* ℂˣ from {toFun := fun z => z^2,map_one' := by sorry,map_mul' := by sorry}).ker ↔ z^2 = 1 := by sorry

example (z : ℂˣ)
    (square : ℂˣ →* ℂˣ) (hsquare : ∀ w, square w = w^2) :
    z ∈ square.ker ↔ z ∈ rootsOfUnity 2 ℂ := by sorry

example (square : ℂˣ →* ℂˣ)
    (hsquare : ∀ w, square w = w^2) : (-1 : ℂˣ) ∈ square.ker := by sorry

example (S : Type*) [Group S] (lambda2 : S →* ℂˣ) (ω : S →* ↥(unitary (H →L[ℂ] H))) : (ω.comp lambda2.ker.subtype) 1 = 1 := by sorry
end Hilbert

/-! ## Layer 2: Weil index and explicit operators -/

section Leray
variable {F V W G H : Type*} [Field F] [AddCommGroup V] [Module F V]
 [AddCommGroup W] [Module F W] [Group G] [Group H]

/-- The graph quadratic expression ω(y,Ty)/2; the full reduced triple of Lagrangians is a separate target. -/
def lerayGraphForm (ω : LinearMap.BilinForm F V) (T : V →ₗ[F] V) : QuadraticMap F V F := by sorry
/-- Leray Graph Form graph, with the hypotheses and domain displayed below. -/
theorem lerayGraphForm_graph (ω : LinearMap.BilinForm F V) (T : V →ₗ[F] V) (y : V) : lerayGraphForm ω T y = (2:F)⁻¹ * ω y (T y) := by sorry
/-- Leray Graph Form isometry, with the hypotheses and domain displayed below. -/
theorem lerayGraphForm_isometry (ω ω' : LinearMap.BilinForm F V) (T T' : V →ₗ[F] V) (e : V ≃ₗ[F] V) (hω : ∀ x y, ω' x y = ω (e x) (e y)) (hT : ∀ y, e (T' y) = T (e y)) (y : V) : lerayGraphForm ω' T' y = lerayGraphForm ω T (e y) := by sorry

example (ω : LinearMap.BilinForm F V) : lerayGraphForm ω (0 : V →ₗ[F] V) = 0 := by sorry

example (ω : LinearMap.BilinForm F F) (h : ∀ x y, ω x y = -x*y) (x : F) : lerayGraphForm ω LinearMap.id x = -(2:F)⁻¹*x^2 := by sorry

example (L R : Submodule F V) : Submodule.map R.mkQ (L ⊓ R) = ⊥ := by sorry
end Leray

section CharacterChange
/-- Weil character Change, with the hypotheses and domain displayed below. -/
theorem weil_characterChange (z : ℂˣ) : z*z*(z^2)⁻¹ = 1 ∧ z⁻¹*z^2 = z := by sorry
end CharacterChange

/-! ## Layer 3: Dual pairs and local theta modules -/

section LocalTheta
variable {F V W G H : Type*} [Field F] [AddCommGroup V] [Module F V]
 [AddCommGroup W] [Module F W] [Group G] [Group H]

/-- Orthogonal Symplectic Embedding in the specified native carrier. -/
def orthogonalSymplecticEmbedding (b : LinearMap.BilinForm F V) (ω : LinearMap.BilinForm F W) : (TauCeti.BilinForm.isometryGroup b × TauCeti.BilinForm.isometryGroup ω) →* (V ⊗[F] W ≃ₗ[F] V ⊗[F] W) := by sorry
/-- Tensor Symplectic Form in the specified native carrier. -/
def tensorSymplecticForm (b : LinearMap.BilinForm F V) (ω : LinearMap.BilinForm F W) : LinearMap.BilinForm F (V ⊗[F] W) := by sorry
/-- Dual Pair commute, with the hypotheses and domain displayed below. -/
theorem dualPair_commute (b : LinearMap.BilinForm F V) (ω : LinearMap.BilinForm F W) (g : TauCeti.BilinForm.isometryGroup b) (h : TauCeti.BilinForm.isometryGroup ω) : orthogonalSymplecticEmbedding b ω (g,1) * orthogonalSymplecticEmbedding b ω (1,h) = orthogonalSymplecticEmbedding b ω (1,h) * orthogonalSymplecticEmbedding b ω (g,1) := by sorry
/-- Dual Pair kernel, with the hypotheses and domain displayed below. -/
theorem dualPair_kernel [Nontrivial V] [Nontrivial W]
    (b : LinearMap.BilinForm F V) (ω : LinearMap.BilinForm F W)
    (g : TauCeti.BilinForm.isometryGroup b) (h : TauCeti.BilinForm.isometryGroup ω) :
    orthogonalSymplecticEmbedding b ω (g,h) = 1 ↔
      ∃ a : Fˣ, (∀ v, (g : V ≃ₗ[F] V) v = (a:F) • v) ∧
        ∀ w, (h : W ≃ₗ[F] W) w = (a⁻¹:Fˣ) • w := by sorry

example (b : LinearMap.BilinForm F F) (ω : LinearMap.BilinForm F W) (h : TauCeti.BilinForm.isometryGroup ω) (w : W) : orthogonalSymplecticEmbedding b ω (1,h) (1 ⊗ₜ[F] w) = 1 ⊗ₜ[F] ((h : W ≃ₗ[F] W) w) := by sorry

example (b : LinearMap.BilinForm F V) (ω : LinearMap.BilinForm F W) [Subsingleton V] : ∀ g, orthogonalSymplecticEmbedding b ω g = 1 := by sorry

example (v : V) (w : W) : (-v) ⊗ₜ[F] (-w) = v ⊗ₜ[F] w := by sorry
end LocalTheta

section ComplexTheta
variable {G H V W U : Type*} [Group G] [Group H]
 [AddCommGroup V] [Module ℂ V] [AddCommGroup W] [Module ℂ W] [AddCommGroup U] [Module ℂ U]

/-- A commuting second group preserves the tensor-coinvariant relations. -/
theorem thetaCoinvariantRelation_eq_zero (ρ : Representation ℂ G V)
    (πdual : Representation ℂ G W) (σ : Representation ℂ H (V ⊗[ℂ] W))
    (hcomm : ∀ h g x, σ h ((ρ.tprod πdual) g x) = (ρ.tprod πdual) g (σ h x))
    (h : H) (g : G) (x : V ⊗[ℂ] W) :
    Representation.Coinvariants.mk (ρ.tprod πdual)
      (σ h ((ρ.tprod πdual) g x-x)) = 0 := by sorry

example (ρ : Representation ℂ G V) (πdual : Representation ℂ G W) (g : G) (a : ℂ) (ha : a ≠ 1) (hact : ∀ x, (ρ.tprod πdual) g x = a • x) : Subsingleton (Representation.Coinvariants (ρ.tprod πdual)) := by sorry

example (ρ : Representation ℂ G V) (πdual : Representation ℂ G ℂ) [Subsingleton G] : Representation.Coinvariants (ρ.tprod πdual) ≃ₗ[ℂ] V := by sorry

example (ρ : Representation ℂ G V) (πdual : Representation ℂ G W) (f : V ⊗[ℂ] W →ₗ[ℂ] U) (hf : ∀ g x, f ((ρ.tprod πdual) g x) = f x) : ∃! q : Representation.Coinvariants (ρ.tprod πdual) →ₗ[ℂ] U, q.comp (Representation.Coinvariants.mk (ρ.tprod πdual)) = f := by sorry

example (T : Type*) [AddCommGroup T] [Module ℂ T] [Subsingleton T] (radical : Submodule ℂ T) : Subsingleton (T ⧸ radical) := by sorry

example (T : Type*) [AddCommGroup T] [Module ℂ T] : (T ⧸ (⊥ : Submodule ℂ T)) ≃ₗ[ℂ] T := by sorry

example (T : Type*) [AddCommGroup T] [Module ℂ T] (radical : Submodule ℂ T) (g : T →ₗ[ℂ] U) (hg : Function.Surjective g) (hker : LinearMap.ker g = radical) : (T ⧸ radical) ≃ₗ[ℂ] U := by sorry

/-- Least rank with a nonzero vector in the supplied family, or infinity when all members vanish. -/
def firstOccurrence (Θ : ℕ → Type*) [∀ r, Zero (Θ r)] : WithTop ℕ := by sorry
/-- First Occurrence nonzero, with the hypotheses and domain displayed below. -/
theorem firstOccurrence_nonzero (Θ : ℕ → Type*) [∀ r, Zero (Θ r)] (r : ℕ) (h : firstOccurrence Θ = r) : ∃ x : Θ r, x ≠ 0 := by sorry
/-- First Occurrence vanishing, with the hypotheses and domain displayed below. -/
theorem firstOccurrence_vanishing (Θ : ℕ → Type*) [∀ r, Zero (Θ r)] (r : ℕ) (h : (r : WithTop ℕ) < firstOccurrence Θ) : ∀ x : Θ r, x = 0 := by sorry
/-- First Occurrence dimension, with the hypotheses and domain displayed below. -/
theorem firstOccurrence_dimension (Θ : ℕ → Type*) [∀ r, Zero (Θ r)] (m₀ r : ℕ) (h : firstOccurrence Θ = r) : (m₀ : WithTop ℕ)+2*firstOccurrence Θ = (m₀+2*r : ℕ) := by sorry

example (Θ : ℕ → Type*) [∀ r, Zero (Θ r)] (h : ∃ x : Θ 0, x ≠ 0) : firstOccurrence Θ = 0 := by sorry

example (Θ : ℕ → Type*) [∀ r, Zero (Θ r)] (h : ∀ r x, x = (0 : Θ r)) : firstOccurrence Θ = ⊤ := by sorry

example (m₀ m₁ r : ℕ) (h : m₀ ≠ m₁) : m₀+2*r ≠ m₁+2*r := by sorry
end ComplexTheta

/-! ## Layer 4: Adelic metaplectic covers and finite Weil representations -/

section GlobalCover
variable {G R Z : Type*} [Group G] [Group R] [CommGroup Z]

example (K : Subgroup R) [K.Normal] (z₁ z₂ : R) (h : z₁*z₂ ∈ K) : (QuotientGroup.mk (z₁*z₂) : R ⧸ K) = 1 := by sorry

example (K : Subgroup R) [K.Normal] (z : R) (h : z ∉ K) : (QuotientGroup.mk z : R ⧸ K) ≠ 1 := by sorry

example (K : Subgroup R) [K.Normal] (z z₀ : R) (h : z*z₀⁻¹ ∈ K) : (QuotientGroup.mk z : R ⧸ K) = QuotientGroup.mk z₀ := by sorry
end GlobalCover

section FiniteOscillator
variable {D : Type*} [Fintype D] [DecidableEq D]

/-- Finite Weil TOperator in the specified native carrier. -/
def finiteWeil_TOperator (q : D → ℝ) : (D → ℂ) →ₗ[ℂ] (D → ℂ) := by sorry
/-- Finite Weil SOperator in the specified native carrier. -/
def finiteWeil_SOperator (pairing : D → D → ℝ) (phase : ℂ) :
    (D → ℂ) →ₗ[ℂ] (D → ℂ) := by sorry
/-- Finite Weil T, with the hypotheses and domain displayed below. -/
theorem finiteWeil_T (q : D → ℝ) (μ ν : D) :
    finiteWeil_TOperator q (Pi.single μ 1) ν =
      Complex.exp (-2*Real.pi*Complex.I*q μ) * ((Pi.single μ (1:ℂ) : D → ℂ) ν) := by sorry
/-- Finite Weil S, with the hypotheses and domain displayed below. -/
theorem finiteWeil_S (pairing : D → D → ℝ) (phase : ℂ) (φ : D → ℂ) (ν : D) :
    finiteWeil_SOperator pairing phase φ ν = phase/(Real.sqrt (Fintype.card D) : ℂ) *
      ∑ μ, Complex.exp (2*Real.pi*Complex.I*pairing μ ν)*φ μ := by sorry
/-- Finite Weil conjugate, with the hypotheses and domain displayed below. -/
theorem finiteWeil_conjugate (q : D → ℝ) (μ ν : D) :
    star (finiteWeil_TOperator q (Pi.single μ 1) ν) =
      Complex.exp (2*Real.pi*Complex.I*q μ) * ((Pi.single μ (1:ℂ) : D → ℂ) ν) := by sorry

example [Unique D] : finiteWeil_TOperator (fun _ : D => 0) = LinearMap.id := by sorry

example (q : D → ℝ) (μ : D) (hq : q μ = 1/4) :
    finiteWeil_TOperator q (Pi.single μ 1) μ = -Complex.I ∧
      star (finiteWeil_TOperator q (Pi.single μ 1) μ) = Complex.I := by sorry

example (φ : Unit → ℂ) : finiteWeil_SOperator (fun _ _ : Unit => 0) 1 φ = φ := by sorry
end FiniteOscillator

/-! ## Layer 5: Global theta kernels and genuine automorphic forms -/

section ThetaFunctions
variable {G H X Y : Type*} [Group G] [Group H]

/-- Theta Kernel in the specified native carrier. -/
def thetaKernel (ω : Representation ℂ G (X → ℂ)) (g : G) (φ : X → ℂ) : ℂ := ∑' x, ω g φ x
/-- Theta Kernel apply, with the hypotheses and domain displayed below. -/
theorem thetaKernel_apply (ω : Representation ℂ G (X → ℂ)) (g : G) (φ : X → ℂ) : thetaKernel ω g φ = ∑' x, ω g φ x := by sorry
/-- Theta Kernel rational, with the hypotheses and domain displayed below. -/
theorem thetaKernel_rational (ω : Representation ℂ G (X → ℂ))
    (γ g : G) (e : X ≃ X) (φ : X → ℂ)
    (hreindex : ∀ f x, ω γ f x = f (e x)) :
    thetaKernel ω (γ*g) φ = thetaKernel ω g φ := by sorry
/-- Theta Kernel central, with the hypotheses and domain displayed below. -/
theorem thetaKernel_central (ω : Representation ℂ G (X → ℂ))
    (z g : G) (φ : X → ℂ) (hz : ∀ f, ω z f = -f) :
    thetaKernel ω (z*g) φ = -thetaKernel ω g φ := by sorry

example (ω : Representation ℂ G (Unit → ℂ)) (g : G) (φ : Unit → ℂ) : thetaKernel ω g φ = ω g φ () := by sorry

example (f : G → ℂ) (z g : G) (hf : f (z*g) = -f g) (hfg : f g ≠ 0) : f (z*g) ≠ f g := by sorry

/-- Functions with the stipulated central sign; smooth automorphy and growth are additional conditions. -/
def centralSignFunctions (z : G) : Submodule ℂ (G → ℂ) := by sorry
/-- Central Sign Functions eval, with the hypotheses and domain displayed below. -/
theorem centralSignFunctions_eval (z : G) (f : centralSignFunctions z) (g : G) : f.val (z*g) = -f.val g := by sorry
/-- Central Sign Functions right, with the hypotheses and domain displayed below. -/
theorem centralSignFunctions_right (z : G) (h : G) (f : centralSignFunctions z) : (fun g => f.val (g*h)) ∈ centralSignFunctions z := by sorry
/-- Genuine Cusp iff, with the hypotheses and domain displayed below. -/
theorem genuineCusp_iff (Parabolic : Type*) (constantTerm : Parabolic → (G → ℂ) →ₗ[ℂ] ℂ) (f : G → ℂ) : (∀ P, constantTerm P f = 0) ↔ f ∈ ⨅ P, LinearMap.ker (constantTerm P) := by sorry

example (z : G) : (0 : G → ℂ) ∈ centralSignFunctions z := by sorry

example (z : G) (f : centralSignFunctions z) (h : ∀ g, f.val (z*g) = f.val g) : f.val = 0 := by sorry

example (z h : G) (f : centralSignFunctions z) (g : G) : f.val (z*(g*h)) = -f.val (g*h) := by sorry

/-- Metaplectic Whittaker in the specified native carrier. -/
def metaplecticWhittaker [MeasurableSpace H] (μ : Measure H) (ι : H → G) (η : H → ℂ) (f : G → ℂ) (g : G) : ℂ := ∫ u, f (ι u*g)*star (η u) ∂μ
/-- Metaplectic Whittaker trivial, with the hypotheses and domain displayed below. -/
theorem metaplecticWhittaker_trivial [MeasurableSpace H] (μ : Measure H) (ι : H → G) (f : G → ℂ) (g : G) : metaplecticWhittaker μ ι (fun _ => 1) f g = ∫ u, f (ι u*g) ∂μ := by sorry
/-- Metaplectic Whittaker right, with the hypotheses and domain displayed below. -/
theorem metaplecticWhittaker_right [MeasurableSpace H] (μ : Measure H) (ι : H → G) (η : H → ℂ) (f : G → ℂ) (g h : G) : metaplecticWhittaker μ ι η (fun x => f (x*h)) g = metaplecticWhittaker μ ι η f (g*h) := by sorry
/-- Metaplectic Whittaker central, with the hypotheses and domain displayed below. -/
theorem metaplecticWhittaker_central [MeasurableSpace H]
    (μ : Measure H) (ι : H → G) (η : H → ℂ) (f : G → ℂ) (z g : G)
    (hz : ∀ a, f (z*a) = -f a) (hcomm : ∀ u, ι u*z = z*ι u) :
    metaplecticWhittaker μ ι η f (z*g) = -metaplecticWhittaker μ ι η f g := by sorry

example (f : G → ℂ) (g : G) : metaplecticWhittaker (Measure.dirac ()) (fun _ : Unit => (1:G)) (fun _ => 1) f g = f g := by sorry

example [MeasurableSpace H] (μ : Measure H) (η : H → ℂ)
    (hμ : μ Set.univ = 1) (hηm : AEStronglyMeasurable η μ) (hη : ∀ u, ‖η u‖ = 1) :
    (∫ u, η u * star (η u) ∂μ) = 1 := by sorry

example [Fintype H] [MeasurableSpace H] [MeasurableSingletonClass H]
    (η ζ : H →* ℂˣ) (h : η ≠ ζ) :
    (∫ u, (ζ u : ℂ)*star (η u : ℂ) ∂(Measure.count : Measure H)) = 0 := by sorry

/-- Global Theta Lift in the specified native carrier. -/
def globalThetaLift [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (f : H → ℂ) (g : G) : ℂ := ∫ h, θ g h*star (f h) ∂μ
/-- Global Theta Lift apply, with the hypotheses and domain displayed below. -/
theorem globalThetaLift_apply [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (f : H → ℂ) (g : G) : globalThetaLift μ θ f g = ∫ h, θ g h*star (f h) ∂μ := by sorry
/-- Global Theta Lift equivariant, with the hypotheses and domain displayed below. -/
theorem globalThetaLift_equivariant [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (f : H → ℂ) (g a : G) : globalThetaLift μ θ f (g*a) = globalThetaLift μ (fun x h => θ (x*a) h) f g := by sorry
/-- Global Theta Lift central, with the hypotheses and domain displayed below. -/
theorem globalThetaLift_central [MeasurableSpace H] (μ : Measure H)
    (θ : G → H → ℂ) (f : H → ℂ) (z g : G) (χ : ℂ)
    (hz : ∀ a h, θ (z*a) h = χ*θ a h) :
    globalThetaLift μ θ f (z*g) = χ*globalThetaLift μ θ f g := by sorry

example [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (g : G) : globalThetaLift μ θ 0 g = 0 := by sorry

example (θ : G → Unit → ℂ) (f : Unit → ℂ) (g : G) :
    globalThetaLift (Measure.dirac ()) θ f g = θ g ()*star (f ()) := by sorry

example [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (f : H → ℂ) (g : G) (h : ¬Integrable (fun x => θ g x*star (f x)) μ) : globalThetaLift μ θ f g = 0 := by sorry

/-- Regularized Theta in the specified native carrier. -/
def regularizedTheta [MeasurableSpace H] (μ : Measure H) (τ κ : ℂ) (P : ℂ → ℂ) (θ : G → H → ℂ) (E : ℂ → H → ℂ) (s : ℂ) (g : G) : ℂ := (τ*κ*P s)⁻¹ * ∫ h, θ g h*E s h ∂μ

/-- Regularized Theta convergent, with the hypotheses and domain displayed below. -/
theorem regularizedTheta_convergent [MeasurableSpace H] (μ : Measure H) (θ : G → H → ℂ) (g : G) : regularizedTheta μ 1 1 (fun _ => 1) θ (fun _ _ => 1) 0 g = ∫ h, θ g h ∂μ := by sorry

example [MeasurableSpace H] (μ : Measure H) (τ κ : ℂ) (P : ℂ → ℂ) (E : ℂ → H → ℂ) (s : ℂ) (g : G) : regularizedTheta μ τ κ P (fun _ _ => 0) E s g = 0 := by sorry

example [MeasurableSpace H] (μ : Measure H) (τ κ a : ℂ) (ha : a ≠ 0) (P : ℂ → ℂ) (θ : G → H → ℂ) (E : ℂ → H → ℂ) (s : ℂ) (g : G) : regularizedTheta μ τ κ (fun s => a*P s) (fun g h => a*θ g h) E s g = regularizedTheta μ τ κ P θ E s g := by sorry

example [MeasurableSpace H] (μ : Measure H) (P : ℂ → ℂ) (θ : G → H → ℂ) (E : ℂ → H → ℂ) (s : ℂ) (g : G) : regularizedTheta μ (1/2) 2 P θ E s g = (P s)⁻¹*(∫ h, θ g h*E s h ∂μ) := by sorry

/-- Extended Schwartz Weil in the specified native carrier. -/
def extendedSchwartzWeil (q : X → ℝ) (P₁ P₂ : ℝ → ℂ) (x : X) (u : ℝ) : ℂ := (P₁ (u*q x)+(SignType.sign u : ℂ)*P₂ (u*q x))*Real.exp (-2*Real.pi*abs u*q x)

/-- Extended Schwartz Weil real, with the hypotheses and domain displayed below. -/
theorem extendedSchwartzWeil_real (q : X → ℝ) (P₁ P₂ : ℝ → ℂ) (x : X) (u : ℝ) : extendedSchwartzWeil q P₁ P₂ x u = (P₁ (u*q x)+(SignType.sign u : ℂ)*P₂ (u*q x))*Real.exp (-2*Real.pi*abs u*q x) := by sorry

example (q : X → ℝ) (x : X) (u : ℝ) : extendedSchwartzWeil q (fun _ => 0) (fun _ => 0) x u = 0 := by sorry

example (q : X → ℝ) (P₁ P₂ : ℝ → ℂ) (x : X) (u : ℝ) (hu : u < 0) : extendedSchwartzWeil q P₁ P₂ x u = (P₁ (u*q x)-P₂ (u*q x))*Real.exp (-2*Real.pi*abs u*q x) := by sorry

example (q : X → ℝ) (x : X) : extendedSchwartzWeil q (fun _ => 1) (fun _ => 0) x 1 = Real.exp (-2*Real.pi*q x) := by sorry

/-- Unit Theta in the specified native carrier. -/
def unitTheta (terms : Y → X → ℂ) : ℂ := ∑' y, ∑' x, terms y x
/-- Unit Theta representative, with the hypotheses and domain displayed below. -/
theorem unitTheta_representative (terms : Y → X → ℂ) (e : Y ≃ Y) (change : Y → X ≃ X) : unitTheta (fun y x => terms (e y) (change y x)) = unitTheta terms := by sorry

/-- Unit Theta multiplicity, with the hypotheses and domain displayed below. -/
theorem unitTheta_multiplicity (K : Subgroup G) (minusOne : G) (hneg : minusOne ≠ 1) : Finset.card (Finset.filter (fun b : Bool => (if b then minusOne else 1) ∈ K) Finset.univ) = if minusOne ∈ K then 2 else 1 := by sorry

example : unitTheta (fun _ : Y => fun _ : X => (0:ℂ)) = 0 := by sorry

example (K : Subgroup G) (minusOne : G) (h : minusOne ∈ K) : Finset.card (Finset.filter (fun b : Bool => (if b then minusOne else 1) ∈ K) Finset.univ) = 2 := by sorry

example : ¬ Summable (fun _ : ℤ => (1 : ℂ)) := by sorry

/-- Genuine Eisenstein in the specified native carrier. -/
def genuineEisenstein (terms : X → ℂ → G → ℂ) (s : ℂ) (g : G) : ℂ := ∑' x, terms x s g
/-- Genuine Eisenstein sum, with the hypotheses and domain displayed below. -/
theorem genuineEisenstein_sum (terms : X → ℂ → G → ℂ) (s : ℂ) (g : G) : genuineEisenstein terms s g = ∑' γ, terms γ s g := by sorry
/-- Genuine Eisenstein central, with the hypotheses and domain displayed below. -/
theorem genuineEisenstein_central (terms : X → ℂ → G → ℂ)
    (s : ℂ) (z g : G) (hz : ∀ x, terms x s (z*g) = -terms x s g) :
    genuineEisenstein terms s (z*g) = -genuineEisenstein terms s g := by sorry

example (s : ℂ) (g : G) : genuineEisenstein (fun _ : X => fun _ _ => 0) s g = 0 := by sorry

example (terms : X → ℂ → G → ℂ) (s : ℂ) (z g : G) (hgenuine : ∀ x, terms x s (z*g) = -terms x s g) (hEis : genuineEisenstein terms s g ≠ 0) : genuineEisenstein terms s (z*g) ≠ genuineEisenstein terms s g := by sorry

example (s : ℂ) (g : G) :
    genuineEisenstein (fun _ : Unit => fun _ _ => (3:ℂ)) s g = 3 := by sorry
end ThetaFunctions

section IdealTheta
/-- Ideal Class Theta in the specified native carrier. -/
def idealClassTheta (w : ℕ) (r : ℕ → ℂ) (z : ℍ) : ℂ := (w:ℂ)⁻¹ + ∑' n : ℕ, r (n+1)*Complex.exp (2*Real.pi*Complex.I*(n+1)*(z:ℂ))
/-- Ideal Class Theta coeff, with the hypotheses and domain displayed below. -/
theorem idealClassTheta_coeff (w : ℕ) (r : ℕ → ℂ) (z : ℍ) : idealClassTheta w r z = (w:ℂ)⁻¹ + ∑' n : ℕ, r (n+1)*Complex.exp (2*Real.pi*Complex.I*(n+1)*(z:ℂ)) := by sorry

example (z : ℍ) : idealClassTheta 4 (fun _ => 0) z = 1/4 := by sorry

/-- A single positive coefficient at one contributes exp(−2π) at z=i, in addition to the constant 1/4. -/
example : idealClassTheta 4 (fun n => if n = 1 then 1 else 0) ⟨Complex.I, by simp⟩ =
    1/4 + Complex.exp (-2*Real.pi) := by sorry

example (w : ℕ) (r : ℕ → ℂ) (z : ℍ) :
    idealClassTheta w (fun n => if n = 0 then 42 else r n) z = idealClassTheta w r z := by sorry
end IdealTheta

/-! ## Layer 6: Siegel–Weil, Rallis, see-saw and Jacobi interfaces -/

section ThetaIntegrals
variable {G H X Y Z V : Type*} [Group G] [Group H] [Zero X] [Zero Y] [Zero Z]
 [MeasurableSpace X] [MeasurableSpace H] [AddCommGroup V] [Module ℂ V]

/-- Theta measure Comparison, with the hypotheses and domain displayed below. -/
theorem theta_measureComparison (τ : ℝ) (μ : Measure H) (f : H → ℂ) : (τ : ℂ)⁻¹ * (∫ h, f h ∂μ) = (∫ h, (τ : ℂ)⁻¹*f h ∂μ) := by sorry

/-- Siegel Weil Section in the specified native carrier. -/
def siegelWeilSection (ω : Representation ℂ G (X → ℂ)) (φ : X → ℂ) : G → ℂ := fun g => ω g φ 0
/-- Siegel Weil Section apply, with the hypotheses and domain displayed below. -/
theorem siegelWeilSection_apply (ω : Representation ℂ G (X → ℂ)) (φ : X → ℂ) (g : G) : siegelWeilSection ω φ g = ω g φ 0 := by sorry
/-- Siegel Weil Section covariance, with the hypotheses and domain displayed below. -/
theorem siegelWeilSection_covariance (ω : Representation ℂ G (X → ℂ))
    (φ : X → ℂ) (p g : G) (χ : ℂ) (hp : ∀ f, ω p f 0 = χ*f 0) :
    siegelWeilSection ω φ (p*g) = χ*siegelWeilSection ω φ g := by sorry

example (ω : Representation ℂ G (X → ℂ)) : siegelWeilSection ω 0 = 0 := by sorry

example (ω : Representation ℂ G (X → ℂ)) (φ : X → ℂ) : siegelWeilSection ω φ 1 = φ 0 := by sorry

example : ((2:ℂ) - (1+1))/2 = 0 ∧ ((2:ℂ)/2) ≠ 0 := by sorry

/-- Ikeda Map in the specified native carrier. -/
def ikedaMap (μ : Measure X) (φ : X → Y → Z → ℂ) (a : Y) : ℂ := ∫ x, φ x a 0 ∂μ
/-- Ikeda Map apply, with the hypotheses and domain displayed below. -/
theorem ikedaMap_apply (μ : Measure X) (φ : X → Y → Z → ℂ) (a : Y) : ikedaMap μ φ a = ∫ x, φ x a 0 ∂μ := by sorry
/-- Ikeda Map comp, with the hypotheses and domain displayed below. -/
theorem ikedaMap_comp [MeasurableSpace Y] (μ : Measure X) (ν : Measure Y)
    [SFinite μ] [SFinite ν] (φ : X → Y → Z → ℂ)
    (hφ : Integrable (fun q : X × Y => φ q.1 q.2 0) (μ.prod ν)) :
    (∫ a, ikedaMap μ φ a ∂ν) = ∫ x, ∫ a, φ x a 0 ∂ν ∂μ := by sorry

example (φ : Unit → Y → Z → ℂ) (a : Y) : ikedaMap (Measure.dirac ()) φ a = φ () a 0 := by sorry

example (μ : Measure X) (f : X → ℂ) (g : Y → ℂ) (h : Z → ℂ) (a : Y) : ikedaMap μ (fun x a z => f x*g a*h z) a = (∫ x, f x ∂μ)*g a*h 0 := by sorry

example (μ : Measure X) (c : ℝ≥0) (φ : X → Y → Z → ℂ) (a : Y) : ikedaMap (c • μ) φ a = (c:ℂ)*ikedaMap μ φ a := by sorry

/-- Theta Section Collection in the specified native carrier. -/
def thetaSectionCollection (places : Type*) (sections : places → G → ℂ) : G → ℂ := fun g => ∏' v, sections v g
/-- Theta Section Collection tensor, with the hypotheses and domain displayed below. -/
theorem thetaSectionCollection_tensor (places : Type*) (sections : places → G → ℂ) (g : G) : thetaSectionCollection places sections g = ∏' v, sections v g := by sorry

/-- Theta Section Collection incoherent, with the hypotheses and domain displayed below. -/
theorem thetaSectionCollection_incoherent (places globalSpaces : Type*) (inv : places → ℂˣ) (localization : globalSpaces → places → ℂˣ) (S : Finset places) (hglobal : ∀ V, ∏ v ∈ S, localization V v = 1) (hincoherent : ∏ v ∈ S, inv v ≠ 1) : ¬ ∃ V, ∀ v, localization V v = inv v := by sorry

example (places : Type*) (inv : places → ℂˣ) (S : Finset places)
    (h : ∀ v ∈ S, inv v = 1) : ∏ v ∈ S, inv v = 1 := by sorry

example (places : Type*) [DecidableEq places] (inv : places → ℂˣ) (S : Finset places) (v : places) (hv : v ∈ S) (h : ∏ w ∈ S, inv w = 1) : ∏ w ∈ S, (if w = v then -inv w else inv w) = -1 := by sorry

example (places : Type*) (sections : places → G → ℂ) (h : ∀ v, sections v 1 = 1) : thetaSectionCollection places sections 1 = 1 := by sorry
end ThetaIntegrals

section Doubling
variable {G X H : Type*} [Group G] [MeasurableSpace G] [Zero X]
 [NormedAddCommGroup H] [InnerProductSpace ℂ H]
open scoped InnerProductSpace

/-- Local Doubling Zeta in the specified native carrier. -/
def localDoublingZeta (μ : Measure G) (ρ : ContRepresentation ℂ G H) (sectionFn : ℂ → G → ℂ) (s : ℂ) (φ ψ : H) : ℂ := ∫ g, sectionFn s g*⟪ψ,ρ g φ⟫_ℂ ∂μ
/-- Local Doubling Zeta integral, with the hypotheses and domain displayed below. -/
theorem localDoublingZeta_integral (μ : Measure G) (ρ : ContRepresentation ℂ G H) (sectionFn : ℂ → G → ℂ) (s : ℂ) (φ ψ : H) : localDoublingZeta μ ρ sectionFn s φ ψ = ∫ g, sectionFn s g*⟪ψ,ρ g φ⟫_ℂ ∂μ := by sorry

/-- Local Doubling Zeta normalized, with the hypotheses and domain displayed below. -/
theorem localDoublingZeta_normalized (μ : Measure G) (ρ : ContRepresentation ℂ G H) (sectionFn : ℂ → G → ℂ) (s L : ℂ) (φ ψ : H) : localDoublingZeta μ ρ sectionFn s φ ψ / L = L⁻¹ * localDoublingZeta μ ρ sectionFn s φ ψ := by sorry

example (μ : Measure G) (ρ : ContRepresentation ℂ G H) (sectionFn : ℂ → G → ℂ) (s : ℂ) (ψ : H) : localDoublingZeta μ ρ sectionFn s 0 ψ = 0 := by sorry

example (ρ : ContRepresentation ℂ Unit ℂ) (s : ℂ) :
    localDoublingZeta (Measure.dirac ()) ρ (fun _ _ => 1) s 1 1 = 1 := by sorry

example (μ : Measure G) (c : ℝ≥0) (ρ : ContRepresentation ℂ G H) (sectionFn : ℂ → G → ℂ) (s : ℂ) (φ ψ : H) : localDoublingZeta (c • μ) ρ sectionFn s φ ψ = (c:ℂ)*localDoublingZeta μ ρ sectionFn s φ ψ := by sorry

/-- Global Theta see Saw, with the hypotheses and domain displayed below. -/
theorem globalTheta_seeSaw [MeasurableSpace H]
    (μ : Measure G) (ν : Measure H) [SFinite μ] [SFinite ν]
    (theta : G → H → ℂ) (f : G → ℂ) (h : H → ℂ)
    (hint : Integrable (fun q : G × H => theta q.1 q.2*star (f q.1)*star (h q.2))
      (μ.prod ν)) :
    (∫ g, ∫ x, theta g x*star (f g)*star (h x) ∂ν ∂μ) =
      ∫ x, ∫ g, theta g x*star (f g)*star (h x) ∂μ ∂ν := by sorry

/-- Norm Theta integral Range, with the hypotheses and domain displayed below. -/
theorem normTheta_integralRange (m r n : ℤ) (hn : n = 1)
    (hm : m = 2 ∨ m = 3) (hr : r = 0 ∨ r = 1) :
    (r = 0 ∨ n+1 < m-r) ∨ (m = n+1 ∧ r = 1) ∨ n+1 < m := by sorry
end Doubling

section Jacobi
variable {G N Z X : Type*} [Group G] [Group N] [Group Z] [Zero X]
/-- The semidirect representation obtained from Heisenberg and Weil representations satisfying the displayed covariance relation. -/
def schroedingerWeil (act : G →* MulAut N) (rho : Representation ℂ N (X → ℂ))
    (omega : Representation ℂ G (X → ℂ))
    (hcov : ∀ g n, (omega g).comp (rho n) = (rho (act g n)).comp (omega g)) : Representation ℂ (N ⋊[act] G) (X → ℂ) where
  toFun p := (rho p.left).comp (omega p.right)
  map_one' := by sorry
  map_mul' := by sorry

/-- Schroedinger Weil apply, with the hypotheses and domain displayed below. -/
theorem schroedingerWeil_apply (act : G →* MulAut N) (ρ : Representation ℂ N (X → ℂ)) (ω : Representation ℂ G (X → ℂ)) (hcov : ∀ g n, (ω g).comp (ρ n) = (ρ (act g n)).comp (ω g)) (p : N ⋊[act] G) (φ : X → ℂ) : schroedingerWeil act ρ ω hcov p φ = ρ p.left (ω p.right φ) := by sorry
example (act : ↥(rootsOfUnity 2 ℂ) →* MulAut (Multiplicative ℝ)) (hact : act = 1) : (Multiplicative ℝ) ⋊[act] ↥(rootsOfUnity 2 ℂ) ≃* (Multiplicative ℝ) × ↥(rootsOfUnity 2 ℂ) := by sorry

example (act : G →* MulAut N) (ρ : Representation ℂ N (X → ℂ)) (ω : Representation ℂ G (X → ℂ)) (hcov : ∀ g n, (ω g).comp (ρ n) = (ρ (act g n)).comp (ω g)) (n : N) (φ : X → ℂ) : schroedingerWeil act ρ ω hcov (SemidirectProduct.inl n) φ = ρ n φ := by sorry

example (act : G →* MulAut N) (g : G) (n : N) : (SemidirectProduct.inr g : N ⋊[act] G) * SemidirectProduct.inl n = SemidirectProduct.inl (act g n) * SemidirectProduct.inr g := by sorry

/-- Jacobi Space in the specified native carrier. -/
def jacobiSpace (center : Z → X → X) (ψ : Z →* ℂˣ) : Submodule ℂ (X → ℂ) := by sorry
/-- Jacobi Space central, with the hypotheses and domain displayed below. -/
theorem jacobiSpace_central (center : Z → X → X) (ψ : Z →* ℂˣ) (f : jacobiSpace center ψ) (z : Z) (x : X) : f.val (center z x) = (ψ z : ℂ)*f.val x := by sorry

example (center : Z → X → X) (ψ : Z →* ℂˣ) : (0 : X → ℂ) ∈ jacobiSpace center ψ := by sorry

example (center : Z → X → X) (ψ χ : Z →* ℂˣ) (f : jacobiSpace center ψ) (z : Z) (x : X) (hψ : ψ z ≠ χ z) (hf : f.val x ≠ 0) : f.val (center z x) ≠ (χ z : ℂ)*f.val x := by sorry

example (n N : ℕ) : (fun a : Fin n → ℤ => fun i => (a i : ℚ)/N) = (fun a => fun i => (a i : ℚ)*(N:ℚ)⁻¹) := by sorry

/-- Fourier Jacobi in the specified native carrier. -/
def fourierJacobi [MeasurableSpace Z] (μ : Measure Z) (center : Z → X → X) (ψ : Z →* ℂˣ) (f : X → ℂ) (x : X) : ℂ := ∫ z, f (center z x)*star (ψ z : ℂ) ∂μ

/-- Fourier Jacobi equivariant, with the hypotheses and domain displayed below. -/
theorem fourierJacobi_equivariant [MeasurableSpace Z] (μ : Measure Z)
    (center : Z → X → X) (ψ : Z →* ℂˣ) (f : X → ℂ) (act : G → X → X)
    (hcomm : ∀ z g x, act g (center z x) = center z (act g x)) (g : G) (x : X) :
    fourierJacobi μ center ψ (fun x => f (act g x)) x =
      fourierJacobi μ center ψ f (act g x) := by sorry
/-- Fourier Jacobi coefficient, with the hypotheses and domain displayed below. -/
theorem fourierJacobi_coefficient [MeasurableSpace Z] (μ : Measure Z)
    (ψ : Z →* ℂˣ) (hμ : μ Set.univ = 1)
    (hψm : AEStronglyMeasurable (fun z => (ψ z : ℂ)) μ)
    (hψ : ∀ z, ‖(ψ z : ℂ)‖ = 1) :
    (∫ z, (ψ z : ℂ)*star (ψ z : ℂ) ∂μ) = 1 := by sorry

example [MeasurableSpace Z] (μ : Measure Z) (center : Z → X → X) (ψ : Z →* ℂˣ) (x : X) : fourierJacobi μ center ψ 0 x = 0 := by sorry

example [MeasurableSpace Z] (μ : Measure Z) (ψ : Z →* ℂˣ)
    (hμ : μ Set.univ = 1) (hψm : AEStronglyMeasurable (fun z => (ψ z : ℂ)) μ)
    (hψ : ∀ z, ‖(ψ z : ℂ)‖ = 1) :
    (∫ z, (ψ z : ℂ)*star (ψ z : ℂ) ∂μ) = 1 := by sorry

example [Fintype Z] [MeasurableSpace Z] [MeasurableSingletonClass Z]
    (ψ χ : Z →* ℂˣ) (h : ψ ≠ χ) :
    (∫ z, (χ z : ℂ)*star (ψ z : ℂ) ∂(Measure.count : Measure Z)) = 0 := by sorry
end Jacobi

/-! ## Layer 7: Half-integral weight, plus spaces and Shimura lifting -/

section HalfWeight
open scoped Real
/-- Gamma Four in the specified native carrier. -/
abbrev GammaFour := CongruenceSubgroup.Gamma0 4
/-- Infinity Stabilizer in the specified native carrier. -/
def infinityStabilizer : Subgroup GammaFour where
 carrier := {gamma | gamma.val 1 0 = 0}
 one_mem' := by sorry
 mul_mem' := by sorry
 inv_mem' := by sorry
/-- Infinity Cosets in the specified native carrier. -/
abbrev InfinityCosets := Quotient (QuotientGroup.rightRel infinityStabilizer)
/-- Coset Representative in the specified native carrier. -/
def cosetRepresentative (c : InfinityCosets) : GammaFour := c.out

/-- Unitary Theta Seed in the specified native carrier. -/
def unitaryThetaSeed (z : ℍ) : ℂ := (Real.rpow z.im (1/4) : ℂ) * jacobiTheta (2*(z:ℂ))
/-- Weight Half Eigenvalue in the specified native carrier. -/
def weightHalfEigenvalue (r : ℝ) : ℂ := 1/4 + ((r:ℂ)/2)^2

/-- Shift Four in the specified native carrier. -/
def shiftFour (ν : Fin 4) (z : ℍ) : ℍ := ⟨((z:ℂ)+(ν:ℕ))/4,by sorry⟩
/-- Invert Four in the specified native carrier. -/
def invertFour (z : ℍ) : ℍ := ⟨-1/(4*(z:ℂ)),by sorry⟩
/-- Phase W in the specified native carrier. -/
def phaseW (z : ℍ) : ℂ := Complex.exp (Complex.I*Real.pi/4) *
 ((z:ℂ)/(‖(z:ℂ)‖:ℂ))^(-1/2 : ℂ)

/-- Plus U in the specified native carrier. -/
def plusU (F : ℍ → ℂ) (z : ℍ) : ℂ := (Real.sqrt 2 : ℂ)/4 * ∑ ν : Fin 4, F (shiftFour ν z)
/-- Plus W in the specified native carrier. -/
def plusW (F : ℍ → ℂ) (z : ℍ) : ℂ := phaseW z * F (invertFour z)
/-- Plus Pr in the specified native carrier. -/
def plusPr (F : ℍ → ℂ) : ℍ → ℂ := (2/3:ℂ) • plusW (plusU F) + (1/3:ℂ) • F
/-- Half Weight Eis Constant in the specified native carrier. -/
def halfWeightEisConstant (Λ : ℂ → ℂ) (s : ℂ) (y : ℝ) : ℂ :=
 Λ (2*s)*(2:ℂ)^s*(y:ℂ)^(s/2+1/4) + Λ (2-2*s)*(2:ℂ)^(1-s)*(y:ℂ)^(3/4-s/2)
/-- Half Weight Eis Fourier in the specified native carrier. -/
def halfWeightEisFourier (b : ℤ → ℂ → ℂ) (W : ℝ → ℂ → ℝ → ℂ) (s : ℂ) (z : ℍ) : ℂ :=
 ∑' n : ℤ, if n = 0 then 0 else b n s*W (if 0 < n then 1/4 else -1/4) (s/2-1/4) (4*Real.pi*abs (n:ℝ)*z.im)*Complex.exp (2*Real.pi*Complex.I*n*z.re)

/-- Epsilon Half in the specified native carrier. -/
def epsilonHalf (a : ℕ) : ℂ := if a % 4 = 1 then 1 else Complex.I
/-- Poincare Prefactor in the specified native carrier. -/
def poincarePrefactor (n : ℤ) (s : ℂ) : ℂ :=
 Complex.Gamma (s-(if 0 < n then 1/4 else -1/4))/(4*Real.pi*abs (n:ℝ)*Complex.Gamma (2*s))
/-- Shimura Series in the specified native carrier. -/
def shimuraSeries (K : ℂ → ℝ → ℂ) (a : ℕ → ℂ) (r : ℝ) (z : ℍ) : ℂ :=
 2*(Real.sqrt z.im : ℂ)*∑' n : ℤ, if n = 0 then 0 else a n.natAbs * K (Complex.I*r) (2*Real.pi*abs (n:ℝ)*z.im)*Complex.exp (2*Real.pi*Complex.I*n*z.re)
/-- Shimura Coefficient Sequence in the specified native carrier. -/
def shimuraCoefficientSequence (b : ℤ → ℂ) (χ : ℤ → ℕ → ℂ) (d : ℤ) (m : ℕ) : ℂ :=
  (m:ℂ)*(∑ n ∈ m.divisors, (n:ℂ)^(-3/2:ℂ)*χ d n*b ((m:ℤ)^2*d/(n:ℤ)^2))/b d

/-- Theta Multiplier in the specified native carrier. -/
def thetaMultiplier (γ : GammaFour) (z : ℍ) : ℂ := unitaryThetaSeed (γ • z)/unitaryThetaSeed z
/-- Theta Multiplier theta Ratio, with the hypotheses and domain displayed below. -/
theorem thetaMultiplier_thetaRatio (γ : GammaFour) (z : ℍ) : thetaMultiplier γ z = unitaryThetaSeed (γ • z)/unitaryThetaSeed z := by sorry
/-- Theta Multiplier cocycle, with the hypotheses and domain displayed below. -/
theorem thetaMultiplier_cocycle (γ δ : GammaFour) (z : ℍ) : thetaMultiplier (γ*δ) z = thetaMultiplier γ (δ • z)*thetaMultiplier δ z := by sorry
/-- Theta Multiplier unitary, with the hypotheses and domain displayed below. -/
theorem thetaMultiplier_unitary (γ : GammaFour) (z : ℍ) : ‖thetaMultiplier γ z‖ = 1 := by sorry

example (z : ℍ) : thetaMultiplier 1 z = 1 := by sorry

example (a : ℂ) (ha : a ≠ 0) (γ : GammaFour) (z : ℍ) : (a*unitaryThetaSeed (γ • z))/(a*unitaryThetaSeed z) = thetaMultiplier γ z := by sorry

example (γ δ : GammaFour) (z : ℍ) : (-thetaMultiplier (γ*δ) z) ≠ (-thetaMultiplier γ (δ • z))*(-thetaMultiplier δ z) := by sorry

/-- Multiplier-covariant eigenfunctions of the supplied linear operator, before smooth cusp and L² conditions. -/
def halfWeightEigenfunctions (Δ : (ℍ → ℂ) →ₗ[ℂ] (ℍ → ℂ)) (r : ℝ) : Submodule ℂ (ℍ → ℂ) := by sorry
/-- Half Weight Eigenfunctions automorphy, with the hypotheses and domain displayed below. -/
theorem halfWeightEigenfunctions_automorphy (Δ : (ℍ → ℂ) →ₗ[ℂ] (ℍ → ℂ)) (r : ℝ) (F : halfWeightEigenfunctions Δ r) (γ : GammaFour) (z : ℍ) : F.val (γ • z) = thetaMultiplier γ z*F.val z := by sorry
/-- Half Weight Eigenfunctions all Cusps, with the hypotheses and domain displayed below. -/
theorem halfWeightEigenfunctions_allCusps (constant : Fin 3 → (ℍ → ℂ) →ₗ[ℂ] ℂ) (F : ℍ → ℂ) : (∀ c, constant c F = 0) ↔ F ∈ ⨅ c, LinearMap.ker (constant c) := by sorry
/-- Half Weight Eigenfunctions eigen Parameter, with the hypotheses and domain displayed below. -/
theorem halfWeightEigenfunctions_eigenParameter (Δ : (ℍ → ℂ) →ₗ[ℂ] (ℍ → ℂ)) (r : ℝ) (F : halfWeightEigenfunctions Δ r) : Δ F.val = weightHalfEigenvalue r • F.val := by sorry

example (constant : Fin 3 → (ℍ → ℂ) →ₗ[ℂ] ℂ) (F : ℍ → ℂ) (h : constant 0 F = 0) (h₁ : constant 1 F ≠ 0) : ¬ ∀ c, constant c F = 0 := by sorry

example (F : ℍ → ℂ) (γ : GammaFour) (z : ℍ) (hJ : thetaMultiplier γ z ≠ 1) (hF : F z ≠ 0) (hi : F (γ • z) = F z) : F (γ • z) ≠ thetaMultiplier γ z*F z := by sorry

example (r : ℝ) (hr : r ≠ 0) : weightHalfEigenvalue r ≠ 1/4+(r:ℂ)^2 := by sorry

/-- Half Weight Eisenstein in the specified native carrier. -/
def halfWeightEisenstein (Λ : ℂ → ℂ) (b : ℤ → ℂ → ℂ) (W : ℝ → ℂ → ℝ → ℂ) (s : ℂ) (z : ℍ) : ℂ := halfWeightEisConstant Λ s z.im + halfWeightEisFourier b W s z
/-- Half Weight Eisenstein initial Series, with the hypotheses and domain displayed below. -/
theorem halfWeightEisenstein_initialSeries (Λ : ℂ → ℂ) (b : ℤ → ℂ → ℂ) (W : ℝ → ℂ → ℝ → ℂ) (s : ℂ) (z : ℍ) : halfWeightEisenstein Λ b W s z = halfWeightEisConstant Λ s z.im + halfWeightEisFourier b W s z := by sorry

/-- Half Weight Eisenstein fourier Transport, with the hypotheses and domain displayed below. -/
theorem halfWeightEisenstein_fourierTransport (s : ℂ) : s/2-1/4 = (s/2+1/4)-1/2 := by sorry

example (W : ℝ → ℂ → ℝ → ℂ) (s : ℂ) (z : ℍ) :
    halfWeightEisenstein (fun _ => 0) (fun _ _ => 0) W s z = 0 := by sorry

example (Λ : ℂ → ℂ) (W : ℝ → ℂ → ℝ → ℂ) (s : ℂ) (z : ℍ) :
    halfWeightEisenstein Λ (fun _ _ => 0) W s z = halfWeightEisConstant Λ s z.im := by sorry

example (Λ : ℂ → ℂ) (b : ℤ → ℂ → ℂ)
    (W : ℝ → ℂ → ℝ → ℂ) (s : ℂ) (z : ℍ) :
    halfWeightEisenstein Λ (fun n t => if n = 0 then 42 else b n t) W s z =
      halfWeightEisenstein Λ b W s z := by sorry

/-- Fundamental Eisenstein Coefficient in the specified native carrier. -/
def fundamentalEisensteinCoefficient (Λ : ℤ → ℂ → ℂ) (d : ℤ) (s : ℂ) : ℂ := (Real.rpow (4*Real.pi) (-1/4) * Real.rpow (abs (d:ℝ)) (-3/4) : ℝ) * Λ d s
/-- Fundamental Eisenstein Coefficient fundamental Value, with the hypotheses and domain displayed below. -/
theorem fundamentalEisensteinCoefficient_fundamentalValue (Λ : ℤ → ℂ → ℂ) (d : ℤ) (s : ℂ) : fundamentalEisensteinCoefficient Λ d s = (Real.rpow (4*Real.pi) (-1/4) * Real.rpow (abs (d:ℝ)) (-3/4) : ℝ) * Λ d s := by sorry

/-- Fundamental Eisenstein Coefficient product, with the hypotheses and domain displayed below. -/
theorem fundamentalEisensteinCoefficient_product (Λ : ℤ → ℂ → ℂ) (d d' : ℤ) (s : ℂ) : fundamentalEisensteinCoefficient Λ d s*fundamentalEisensteinCoefficient Λ d' s = (Real.rpow (4*Real.pi) (-1/2) * Real.rpow (abs (d*d':ℝ)) (-3/4) : ℝ) * (Λ d s*Λ d' s) := by sorry

example (Λ : ℤ → ℂ → ℂ) (s : ℂ) : fundamentalEisensteinCoefficient Λ 1 s = (Real.rpow (4*Real.pi) (-1/4):ℂ)*Λ 1 s := by sorry

example (Λ : ℤ → ℂ → ℂ) (s : ℂ) :
    fundamentalEisensteinCoefficient Λ (-3) s =
      (Real.rpow (4*Real.pi) (-1/4)*Real.rpow 3 (-3/4):ℂ)*Λ (-3) s := by sorry

example (Λ : ℤ → ℂ → ℂ) (s : ℂ) :
    (2*Real.sqrt Real.pi:ℂ)*fundamentalEisensteinCoefficient Λ 1 s*
      fundamentalEisensteinCoefficient Λ 1 s = Λ 1 s*Λ 1 s := by sorry

/-- Half Weight Eisenstein product, with the hypotheses and domain displayed below. -/
theorem halfWeightEisenstein_product (Λ : ℤ → ℂ → ℂ)
    (d d' : ℤ) (hd : d ≠ 0) (hd' : d' ≠ 0) (s : ℂ) :
    Λ d s*Λ d' s = (2*Real.sqrt Real.pi : ℂ)*((abs (d*d':ℝ):ℝ):ℂ)^(3/4:ℂ)*
      fundamentalEisensteinCoefficient Λ d s*fundamentalEisensteinCoefficient Λ d' s := by sorry

/-- Kohnen Plus in the specified native carrier. -/
def kohnenPlus (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ) : Submodule ℂ (ℍ → ℂ) := by sorry
/-- Kohnen Plus coefficient Kernels, with the hypotheses and domain displayed below. -/
theorem kohnenPlus_coefficientKernels (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ) (n : ℤ) (hn : n % 4 = 2 ∨ n % 4 = 3) : kohnenPlus coeff ≤ LinearMap.ker (coeff n) := by sorry
/-- Kohnen Plus membership, with the hypotheses and domain displayed below. -/
theorem kohnenPlus_membership (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ) (F : ℍ → ℂ) : F ∈ kohnenPlus coeff ↔ ∀ n, n % 4 = 2 ∨ n % 4 = 3 → coeff n F = 0 := by sorry
/-- Kohnen Plus linear Structure, with the hypotheses and domain displayed below. -/
theorem kohnenPlus_linearStructure (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ)
    (a : ℂ) (F H : kohnenPlus coeff) : a • F.val + H.val ∈ kohnenPlus coeff := by sorry

example (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ) (F : ℍ → ℂ)
    (h : coeff (-1) F ≠ 0) : F ∉ kohnenPlus coeff := by sorry

example (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ)
    (h : ∀ n, n % 4 = 2 ∨ n % 4 = 3 → coeff n = 0) : kohnenPlus coeff = ⊤ := by sorry

example (coeff : ℤ → (ℍ → ℂ) →ₗ[ℂ] ℂ) (constant : (ℍ → ℂ) →ₗ[ℂ] ℂ) (F : ℍ → ℂ) (h : F ∈ kohnenPlus coeff) (hc : constant F ≠ 0) : F ∉ LinearMap.ker constant := by sorry

/-- Plus Operators in the specified native carrier. -/
def plusOperators : ((ℍ → ℂ) →ₗ[ℂ] (ℍ → ℂ)) × ((ℍ → ℂ) →ₗ[ℂ] (ℍ → ℂ)) := by sorry
/-- Plus Operators u Formula, with the hypotheses and domain displayed below. -/
theorem plusOperators_uFormula (F : ℍ → ℂ) : plusOperators.1 F = plusU F := by sorry
/-- Plus Operators w Formula, with the hypotheses and domain displayed below. -/
theorem plusOperators_wFormula (F : ℍ → ℂ) : plusOperators.2 F = plusW F := by sorry
/-- Plus Operators projection Comparison, with the hypotheses and domain displayed below. -/
theorem plusOperators_projectionComparison (F : ℍ → ℂ) : plusPr F = (2/3:ℂ) • plusOperators.2 (plusOperators.1 F)+(1/3:ℂ) • F := by sorry

example (F : ℍ → ℂ) (z : ℍ) : plusU F z = (Real.sqrt 2 : ℂ)/4*∑ ν : Fin 4, F (shiftFour ν z) := by sorry

example (z : ℍ) :
    plusPr (fun _ => 1) z = (2/3:ℂ)*phaseW z*(Real.sqrt 2:ℂ)+(1/3:ℂ) := by sorry

example (F : ℍ → ℂ) (z : ℍ) : plusW (plusU F) z = phaseW z*((Real.sqrt 2 : ℂ)/4)*∑ ν : Fin 4, F (shiftFour ν (invertFour z)) := by sorry

/-- Half Weight Kloosterman in the specified native carrier. -/
def halfWeightKloosterman (κ : ℤ → ℤ → ℤ) (m n : ℤ) (c : ℕ) [NeZero c] : ℂ := ∑ a : (ZMod c)ˣ, (κ c a.val.val : ℂ)*epsilonHalf a.val.val*Complex.exp (2*Real.pi*Complex.I*((m:ℂ)*a.val.val+(n:ℂ)*a⁻¹.val.val)/c)
/-- Half Weight Kloosterman unit Sum, with the hypotheses and domain displayed below. -/
theorem halfWeightKloosterman_unitSum (κ : ℤ → ℤ → ℤ) (m n : ℤ) (c : ℕ) [NeZero c] : halfWeightKloosterman κ m n c = ∑ a : (ZMod c)ˣ, (κ c a.val.val : ℂ)*epsilonHalf a.val.val*Complex.exp (2*Real.pi*Complex.I*((m:ℂ)*a.val.val+(n:ℂ)*a⁻¹.val.val)/c) := by sorry
/-- Half Weight Kloosterman inverse Independence, with the hypotheses and domain displayed below. -/
theorem halfWeightKloosterman_inverseIndependence (m n c a ainv : ℤ) (k : ℤ) (hc : c ≠ 0) : Complex.exp (2*Real.pi*Complex.I*((m:ℂ)*a+(n:ℂ)*(ainv+k*c))/c) = Complex.exp (2*Real.pi*Complex.I*((m:ℂ)*a+(n:ℂ)*ainv)/c) := by sorry
/-- Half Weight Kloosterman modulus Data, with the hypotheses and domain displayed below. -/
theorem halfWeightKloosterman_modulusData : epsilonHalf 1 = 1 ∧ epsilonHalf 3 = Complex.I := by sorry

example (κ : ℤ → ℤ → ℤ) (h₁ : κ 4 1 = 1) (h₃ : κ 4 3 = 1) : halfWeightKloosterman κ 0 0 4 = 1+Complex.I := by sorry

example (κ : ℤ → ℤ → ℤ) (m n : ℤ) (c : ℕ) [NeZero c] : halfWeightKloosterman κ (m+c) n c = halfWeightKloosterman κ m n c := by sorry

example : (1+Complex.I : ℂ) ≠ 2 := by sorry

/-- Plus Kloosterman in the specified native carrier. -/
def plusKloosterman (κ : ℤ → ℤ → ℤ) (m n : ℤ) (c : ℕ) [NeZero c] : ℂ := (1-Complex.I)*(if 8 ∣ c then 1 else 2)*halfWeightKloosterman κ m n c
/-- Plus Kloosterman dyadic Factor, with the hypotheses and domain displayed below. -/
theorem plusKloosterman_dyadicFactor (κ : ℤ → ℤ → ℤ) (m n : ℤ) (c : ℕ) [NeZero c] : plusKloosterman κ m n c = (1-Complex.I)*(if 8 ∣ c then 1 else 2)*halfWeightKloosterman κ m n c := by sorry
/-- Plus Kloosterman weight Half Comparison, with the hypotheses and domain displayed below. -/
theorem plusKloosterman_weightHalfComparison (κ : ℤ → ℤ → ℤ) (m n : ℤ) (c : ℕ) [NeZero c] : plusKloosterman κ m n c/(1-Complex.I) = (if 8 ∣ c then 1 else 2)*halfWeightKloosterman κ m n c := by sorry

example (κ : ℤ → ℤ → ℤ) (h₁ : κ 4 1 = 1) (h₃ : κ 4 3 = 1) : plusKloosterman κ 0 0 4 = 4 := by sorry

example (κ : ℤ → ℤ → ℤ) (h₁ : κ 4 1 = 1) (h₃ : κ 4 3 = 1) : plusKloosterman κ 1 1 4 = -4 := by sorry

example : (1-Complex.I)*(1+Complex.I) = (2:ℂ) ∧ (1-Complex.I)*2*(1+Complex.I) = (4:ℂ) := by sorry

/-- Half Weight Poincare in the specified native carrier. -/
def halfWeightPoincare (M : ℝ → ℂ → ℝ → ℂ) (n : ℤ) (s : ℂ) (z : ℍ) : ℂ := by sorry
/-- Half Weight Poincare seed Normalization, with the hypotheses and domain displayed below. -/
theorem halfWeightPoincare_seedNormalization (M : ℝ → ℂ → ℝ → ℂ) (n : ℤ) (s : ℂ) (z : ℍ) : halfWeightPoincare M n s z = poincarePrefactor n s * ∑' c : InfinityCosets, let γ := cosetRepresentative c; (thetaMultiplier γ z)⁻¹ * M (if 0 < n then 1/4 else -1/4) (s-1/2) (4*Real.pi*abs (n:ℝ)*(γ • z).im) * Complex.exp (2*Real.pi*Complex.I*n*(γ • z).re) := by sorry

/-- Half Weight Poincare parameter, with the hypotheses and domain displayed below. -/
theorem halfWeightPoincare_parameter (s : ℂ) : s/2+1/4-1/2 = s/2-1/4 := by sorry

example (s : ℂ) : poincarePrefactor 1 s = Complex.Gamma (s-1/4)/(4*Real.pi*Complex.Gamma (2*s)) ∧ poincarePrefactor (-3) s = Complex.Gamma (s+1/4)/(12*Real.pi*Complex.Gamma (2*s)) := by sorry

example (s : ℂ) : (4*Real.pi*abs (0:ℝ)*Complex.Gamma (2*s):ℂ) = 0 := by sorry

example (s : ℂ) (hs : 1 < s.re) : poincarePrefactor 1 s*(4*Real.pi*Complex.Gamma (2*s)) = Complex.Gamma (s-1/4) := by sorry

/-- Plus Bessel Coefficient in the specified native carrier. -/
def plusBesselCoefficient (K : ℤ → ℤ → ℕ → ℂ) (BesselJ BesselI : ℂ → ℝ → ℂ) (m n : ℤ) (s : ℂ) : ℂ := by sorry
/-- Plus Bessel Coefficient bessel Series, with the hypotheses and domain displayed below. -/
theorem plusBesselCoefficient_besselSeries (K : ℤ → ℤ → ℕ → ℂ) (BesselJ BesselI : ℂ → ℝ → ℂ) (m n : ℤ) (s : ℂ) : plusBesselCoefficient K BesselJ BesselI m n s = (Complex.Gamma (s-(if 0 < m then 1/4 else -1/4))*Complex.Gamma (s-(if 0 < n then 1/4 else -1/4))/(3*(Real.sqrt Real.pi:ℂ)*(2:ℂ)^(2-2*s)*Complex.Gamma (2*s-1/2)*(Real.sqrt (abs (m*n:ℝ)):ℂ))) * ∑' c : ℕ, if 0 < c ∧ 4 ∣ c then K m n c/c*(if 0 < m*n then BesselJ (2*s-1) (4*Real.pi*Real.sqrt (abs (m*n:ℝ))/c) else BesselI (2*s-1) (4*Real.pi*Real.sqrt (abs (m*n:ℝ))/c)) else 0 := by sorry
/-- Plus Bessel Coefficient signs, with the hypotheses and domain displayed below. -/
theorem plusBesselCoefficient_signs (J I : ℂ → ℝ → ℂ) (m n : ℤ) (hm : 0 < m) (hn : n < 0) (s : ℂ) (x : ℝ) : (Complex.Gamma (s-(if 0 < m then 1/4 else -1/4))*Complex.Gamma (s-(if 0 < n then 1/4 else -1/4)), if 0 < m*n then J (2*s-1) x else I (2*s-1) x) = (Complex.Gamma (s-1/4)*Complex.Gamma (s+1/4), I (2*s-1) x) := by sorry

example (J I : ℂ → ℝ → ℂ) (s : ℂ) :
    plusBesselCoefficient (fun _ _ c => if c = 4 then 1 else 0) J I (-3) (-4) s =
      (Complex.Gamma (s+1/4)^2 /
        (3*(Real.sqrt Real.pi:ℂ)*(2:ℂ)^(2-2*s)*Complex.Gamma (2*s-1/2)*
          (Real.sqrt 12:ℂ))) * (J (2*s-1) (Real.pi*Real.sqrt 12)/4) := by sorry

example (J I : ℂ → ℝ → ℂ) (s : ℂ) :
    plusBesselCoefficient (fun _ _ c => if c = 4 then 1 else 0) J I 1 (-3) s =
      (Complex.Gamma (s-1/4)*Complex.Gamma (s+1/4) /
        (3*(Real.sqrt Real.pi:ℂ)*(2:ℂ)^(2-2*s)*Complex.Gamma (2*s-1/2)*
          (Real.sqrt 3:ℂ))) * (I (2*s-1) (Real.pi*Real.sqrt 3)/4) := by sorry

example (J I : ℂ → ℝ → ℂ) (s : ℂ) :
    plusBesselCoefficient (fun _ _ c => if c = 4 then 2 else 0) J I 1 1 s =
      2*plusBesselCoefficient (fun _ _ c => if c = 4 then 1 else 0) J I 1 1 s := by sorry

/-- Quadratic Root Weyl Sum in the specified native carrier. -/
def quadraticRootWeylSum (χ : ℤ → ℤ → ℤ → ℂ) (d d' m c : ℤ) : ℂ := ∑ b ∈ Finset.Ico 0 c, if c ∣ b^2-d*d' then χ (c/4) b ((b^2-d*d')/c) * Complex.exp (2*Real.pi*Complex.I*(2*m*b)/c) else 0
/-- Quadratic Root Weyl Sum root Index, with the hypotheses and domain displayed below. -/
theorem quadraticRootWeylSum_rootIndex (χ : ℤ → ℤ → ℤ → ℂ) (d d' m c : ℤ) : quadraticRootWeylSum χ d d' m c = ∑ b ∈ Finset.Ico 0 c, if c ∣ b^2-d*d' then χ (c/4) b ((b^2-d*d')/c) * Complex.exp (2*Real.pi*Complex.I*(2*m*b)/c) else 0 := by sorry
/-- Quadratic Root Weyl Sum form Evaluation, with the hypotheses and domain displayed below. -/
theorem quadraticRootWeylSum_formEvaluation (a b D : ℤ) (h : 4*a ∣ b^2-D) (ha : a ≠ 0) : b^2-4*a*((b^2-D)/(4*a)) = D := by sorry

example (a b D : ℤ) (h : 4*a ∣ b^2-D) (ha : a ≠ 0) : b^2-4*a*((b^2-D)/(4*a)) = D := by sorry

example : Complex.exp (2*Real.pi*Complex.I*(2:ℂ)/4) ≠ Complex.exp (2*Real.pi*Complex.I/4) := by sorry

example (a : ℤ) (ha : 0 < a) : (Finset.Ico 0 (4*a)).card = 2*(Finset.Ico 0 (2*a)).card := by sorry

/-- Shimura Eigenline Lift in the specified native carrier. -/
def shimuraEigenlineLift (K : ℂ → ℝ → ℂ) (a : ℕ → ℂ) (r : ℝ) : ℍ → ℂ := shimuraSeries K a r
/-- Shimura Eigenline Lift hecke Series, with the hypotheses and domain displayed below. -/
theorem shimuraEigenlineLift_heckeSeries (K : ℂ → ℝ → ℂ) (a : ℕ → ℂ) (r : ℝ) (z : ℍ) : shimuraEigenlineLift K a r z = shimuraSeries K a r z := by sorry
/-- Shimura Eigenline Lift scale Independence, with the hypotheses and domain displayed below. -/
theorem shimuraEigenlineLift_scaleIndependence (A B scale : ℂ) (h : scale ≠ 0) : (scale*A)/(scale*B) = A/B := by sorry

example (A B : ℂ) : (-A)/(-B) = A/B := by sorry

example (b : ℤ → ℂ) (d : ℤ) (h : b d = 0) : ¬ b d ≠ 0 := by sorry

example (a₂ a₂' : ℂ) (h : a₂ ≠ a₂') : (1-a₂/2+(1/4:ℂ)) ≠ (1-a₂'/2+(1/4:ℂ)) := by sorry
end HalfWeight

section FiniteFourier
variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V]

/-- Positive Fourier Kernel in the specified native carrier. -/
def positiveFourierKernel (b : ℤ → V →ₗ[ℂ] ℂ) : Submodule ℂ V := by sorry
/-- Positive Fourier Kernel mem Kernel, with the hypotheses and domain displayed below. -/
theorem positiveFourierKernel_memKernel (b : ℤ → V →ₗ[ℂ] ℂ) (v : V) : v ∈ positiveFourierKernel b ↔ ∀ n, 0 < n → n % 4 = 0 ∨ n % 4 = 1 → b n v = 0 := by sorry
/-- Positive Fourier Kernel orthogonal Split, with the hypotheses and domain displayed below. -/
theorem positiveFourierKernel_orthogonalSplit [FiniteDimensional ℂ V] (b : ℤ → V →ₗ[ℂ] ℂ) : positiveFourierKernel b ⊔ (positiveFourierKernel b).orthogonal = ⊤ := by sorry
/-- Positive Fourier Kernel lift Zero, with the hypotheses and domain displayed below. -/
theorem positiveFourierKernel_liftZero (b : ℤ → V →ₗ[ℂ] ℂ) (D Q : ℤ) (hD : 0 < D) (hQ : Q ≠ 0) (hDQ : (D*Q^2) % 4 = 0 ∨ (D*Q^2) % 4 = 1) (v : positiveFourierKernel b) : b (D*Q^2) v.val = 0 := by sorry

example (z : ℂ) (hz : z ≠ 0) :
    z ∉ positiveFourierKernel (fun _ : ℤ => (LinearMap.id : ℂ →ₗ[ℂ] ℂ)) := by sorry

example (b : ℤ → V →ₗ[ℂ] ℂ) (h : positiveFourierKernel b = ⊤) (n : ℤ) (hn : 0 < n) (hnm : n % 4 = 0 ∨ n % 4 = 1) (v : V) : b n v = 0 := by sorry

example :
    positiveFourierKernel (fun n : ℤ => if n = -3 then (LinearMap.id : ℂ →ₗ[ℂ] ℂ) else 0) = ⊤ := by sorry

/-- Positive Fourier finite Certificate, with the hypotheses and domain displayed below. -/
theorem positiveFourier_finiteCertificate [FiniteDimensional ℂ V] (b : ℤ → V →ₗ[ℂ] ℂ) (h : positiveFourierKernel b = ⊥) : ∃ n : Fin (Module.finrank ℂ V) → ℤ, (∀ i, 0 < n i ∧ (n i % 4 = 0 ∨ n i % 4 = 1)) ∧ Function.Injective (fun v : V => fun i => b (n i) v) := by sorry
end FiniteFourier

section TraceInterfaces
/-- Geometric Trace in the specified native carrier. -/
def geometricTrace (measure : Measure ℍ) (φ : ℍ → ℂ) (rawTrace : ℂ) : ℂ := ((∫ z, ‖φ z‖^2 ∂measure : ℝ):ℂ)⁻¹*rawTrace
/-- Geometric Trace cm, with the hypotheses and domain displayed below. -/
theorem geometricTrace_cm (I : Type*) [Fintype I] (measure : Measure ℍ) (φ : ℍ → ℂ) (points : I → ℍ) (weights : I → ℂ) : geometricTrace measure φ ((2*Real.sqrt Real.pi : ℂ)*∑ i, weights i*φ (points i)) = ((∫ z, ‖φ z‖^2 ∂measure : ℝ):ℂ)⁻¹*(2*Real.sqrt Real.pi : ℂ)*∑ i, weights i*φ (points i) := by sorry
/-- Geometric Trace cycle, with the hypotheses and domain displayed below. -/
theorem geometricTrace_cycle (I : Type*) [Fintype I] (measure : Measure ℍ) (φ : ℍ → ℂ) (genusWeight cycleIntegral : I → ℂ) : geometricTrace measure φ (∑ i, genusWeight i*cycleIntegral i) = ((∫ z, ‖φ z‖^2 ∂measure : ℝ):ℂ)⁻¹*∑ i, genusWeight i*cycleIntegral i := by sorry
/-- Geometric Trace odd, with the hypotheses and domain displayed below. -/
theorem geometricTrace_odd (I : Type*) [Fintype I]
    (measure : Measure ℍ) (φ : ℍ → ℂ) (points : I → ℍ) (weights : I → ℂ)
    (reflection : I ≃ I) (hweight : ∀ i, weights (reflection i) = weights i)
    (hodd : ∀ i, φ (points (reflection i)) = -φ (points i)) :
    geometricTrace measure φ (∑ i, weights i*φ (points i)) = 0 := by sorry

example (measure : Measure ℍ) (φ : ℍ → ℂ) (rawTrace : ℂ) (a : ℂ) (ha : a ≠ 0) : geometricTrace measure (a • φ) (a*rawTrace) = geometricTrace measure φ rawTrace/star a := by sorry

example (measure : Measure ℍ) (φ : ℍ → ℂ) (p q : ℍ) (a : ℂ)
    (hodd : φ q = -φ p) : geometricTrace measure φ (a*φ p+a*φ q) = 0 := by sorry

example (measure : Measure ℍ) (φ : ℍ → ℂ) (rawTrace : ℂ) (h : (∫ z, ‖φ z‖^2 ∂measure : ℝ) = 1) : geometricTrace measure φ rawTrace = rawTrace := by sorry

/-- Biro Coefficient Sequence in the specified native carrier. -/
def biroCoefficientSequence (b : ℤ → ℂ) (χ : ℕ → ℂ) (N : ℕ) (D : ℤ) (k : ℕ) : ℂ :=
 ∑ P ∈ k.divisors, if Nat.Coprime N P then
   (Real.sqrt (k/P : ℕ) : ℂ)/(P:ℂ)*χ P*b (D*((k/P):ℤ)^2) else 0
/-- Biro Lift in the specified native carrier. -/
def biroLift (W : ℂ → ℂ → ℂ) (b : ℤ → ℂ) (χ : ℕ → ℂ) (N : ℕ) (D : ℤ) (t : ℂ) (z : ℍ) : ℂ :=
 ∑' k : ℤ, if k = 0 then 0 else
   biroCoefficientSequence b χ N D k.natAbs * W (1/2+2*Complex.I*t) (k*(z:ℂ))
/-- Biro Lift coeff, with the hypotheses and domain displayed below. -/
theorem biroLift_coeff (W : ℂ → ℂ → ℂ) (b : ℤ → ℂ) (χ : ℕ → ℂ) (N : ℕ) (D : ℤ) (t : ℂ) (z : ℍ) :
 biroLift W b χ N D t z = ∑' k : ℤ, if k = 0 then 0 else
   biroCoefficientSequence b χ N D k.natAbs * W (1/2+2*Complex.I*t) (k*(z:ℂ)) := by sorry

/-- Biro Lift kernel, with the hypotheses and domain displayed below. -/
theorem biroLift_kernel (W : ℂ → ℂ → ℂ) (b : ℤ → ℂ) (χ : ℕ → ℂ) (N : ℕ) (D : ℤ) (t : ℂ) (z : ℍ)
 (hb : ∀ k : ℕ, b (D*(k:ℤ)^2) = 0) : biroLift W b χ N D t z = 0 := by sorry

example (W : ℂ → ℂ → ℂ) (χ : ℕ → ℂ) (N : ℕ) (D : ℤ) (t : ℂ) (z : ℍ) :
 biroLift W 0 χ N D t z = 0 := by sorry

example (W : ℂ → ℂ → ℂ) (b : ℤ → ℂ) (χ : ℕ → ℂ) (N : ℕ) (D : ℤ) (t : ℂ) (z : ℍ)
 (hb : ∀ k : ℕ, b (D*(k:ℤ)^2) = 0) : biroLift W b χ N D t z = 0 := by sorry

example (t : ℂ) (h : t ≠ 0) : (2*t)^2 ≠ t^2 := by sorry

example (b : ℤ → ℂ) (χ : ℕ → ℂ) (D : ℤ) (hb : b D = 1) (hb4 : b (D*4) = 0)
 (hχ1 : χ 1 = 1) (hχ2 : χ 2 = 1) : biroCoefficientSequence b χ 1 D 2 = 1/2 := by sorry
end TraceInterfaces

/-! ## Layer 8: Genus-two Jacobi and Eisenstein analysis -/

end

namespace GenusTwo

local notation "V" => Fin 2 → ℤ
local notation "FData" => QuadraticForm ℤ V × V

/-- Integral shift from BFH (2.9), with a=m/N and c=N^(1-j). -/
def fourierShift (a c : ℤ) (l : V) (p : FData) : FData :=
  (p.1 + c • (a • QuadraticMap.linMulLin (dotProductBilin ℤ ℤ l)
      (dotProductBilin ℤ ℤ l) -
    QuadraticMap.linMulLin (dotProductBilin ℤ ℤ p.2)
      (dotProductBilin ℤ ℤ l)),
   p.2 - (2 * a) • l)

/-- Fourier Shift fst apply, with the hypotheses and domain displayed below. -/
theorem fourierShift_fst_apply (a c : ℤ) (l : V) (p : FData) (x : V) :
    (fourierShift a c l p).1 x =
      p.1 x + c * (a * (l ⬝ᵥ x)^2 - (p.2 ⬝ᵥ x) * (l ⬝ᵥ x)) := by sorry

/-- Fourier Shift snd, with the hypotheses and domain displayed below. -/
theorem fourierShift_snd (a c : ℤ) (l : V) (p : FData) :
    (fourierShift a c l p).2 = p.2 - (2 * a) • l := by sorry

/-- Fourier Shift zero, with the hypotheses and domain displayed below. -/
theorem fourierShift_zero (a c : ℤ) (p : FData) :
    fourierShift a c 0 p = p := by sorry

/-- Fourier Shift add, with the hypotheses and domain displayed below. -/
theorem fourierShift_add (a c : ℤ) (l k : V) (p : FData) :
    fourierShift a c (l + k) p = fourierShift a c k (fourierShift a c l p) := by sorry

/-- Fourier Shift neg, with the hypotheses and domain displayed below. -/
theorem fourierShift_neg (a c : ℤ) (l : V) (p : FData) :
    fourierShift a c (-l) (fourierShift a c l p) = p := by sorry

example : fourierShift 1 8 ![1,0] (0,0) =
    (8 • QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, ![-2,0]) := by sorry

example : fourierShift 1 1 ![1,0] (0,0) =
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, ![-2,0]) := by sorry

example : fourierShift 1 1 ![0,1]
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 1, ![1,0]) =
    (QuadraticMap.proj (R := ℤ) (1 : Fin 2) 1, ![1,-2]) := by sorry

/-- The quadratic form represented by BFH's matrix U divided by N. -/
def fourierDiscriminant (a c : ℤ) (p : FData) : QuadraticForm ℤ V :=
  (4 * a) • p.1 - c • QuadraticMap.linMulLin
    (dotProductBilin ℤ ℤ p.2) (dotProductBilin ℤ ℤ p.2)

/-- Fourier Discriminant apply, with the hypotheses and domain displayed below. -/
theorem fourierDiscriminant_apply (a c : ℤ) (p : FData) (x : V) :
    fourierDiscriminant a c p x = 4 * a * p.1 x - c * (p.2 ⬝ᵥ x)^2 := by sorry

/-- Fourier Discriminant zero, with the hypotheses and domain displayed below. -/
theorem fourierDiscriminant_zero (a c : ℤ) :
    fourierDiscriminant a c (0,0) = 0 := by sorry

/-- Fourier Discriminant zero vector, with the hypotheses and domain displayed below. -/
theorem fourierDiscriminant_zero_vector (a c : ℤ) (Q : QuadraticForm ℤ V) :
    fourierDiscriminant a c (Q,0) = (4 * a) • Q := by sorry

example : fourierDiscriminant 1 1
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 1, 0) ![1,1] = 4 := by sorry

example : fourierDiscriminant 1 8 (0, ![1,0]) ![1,0] = -8 := by sorry

example : fourierDiscriminant 0 1
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, 0) =
    fourierDiscriminant 0 1 (0,0) := by sorry

/-- Fourier Discriminant shift, with the hypotheses and domain displayed below. -/
theorem fourierDiscriminant_shift (a c : ℤ) (l : V) (p : FData) :
    fourierDiscriminant a c (fourierShift a c l p) =
      fourierDiscriminant a c p := by sorry

/-- Fourier Shift mod Eq, with the hypotheses and domain displayed below. -/
theorem fourierShift_modEq (a c : ℤ) (l : V) (p : FData) (i : Fin 2) :
    Int.ModEq (2 * a) ((fourierShift a c l p).2 i) (p.2 i) := by sorry

/-- Eq of fourier Discriminant eq, with the hypotheses and domain displayed below. -/
theorem eq_of_fourierDiscriminant_eq (a c : ℤ) (ha : a ≠ 0)
    (p q : FData) (hR : p.2 = q.2)
    (hD : fourierDiscriminant a c p = fourierDiscriminant a c q) :
    p = q := by sorry

/-- Fourier Shift injective, with the hypotheses and domain displayed below. -/
theorem fourierShift_injective (a c : ℤ) (ha : a ≠ 0) (p : FData) :
    Function.Injective (fun l : V => fourierShift a c l p) := by sorry

/-- Exists fourier Shift iff, with the hypotheses and domain displayed below. -/
theorem exists_fourierShift_iff (a c : ℤ) (ha : a ≠ 0) (p q : FData) :
    (∃ l : V, fourierShift a c l p = q) ↔
    fourierDiscriminant a c p = fourierDiscriminant a c q ∧
      ∀ i, Int.ModEq (2 * a) (p.2 i) (q.2 i) := by sorry

/-- Exists Unique fourier Representative, with the hypotheses and domain displayed below. -/
theorem existsUnique_fourierRepresentative (a c : ℤ) (ha : a ≠ 0)
    (p : FData) (nu : V) (hnu : ∀ i, Int.ModEq (2 * a) (p.2 i) (nu i)) :
    ∃! Q : QuadraticForm ℤ V,
      fourierDiscriminant a c (Q,nu) = fourierDiscriminant a c p := by sorry

/-- Coefficient eq of fourier Invariants, with the hypotheses and domain displayed below. -/
theorem coefficient_eq_of_fourierInvariants {A : Type*} (a c : ℤ) (ha : a ≠ 0)
    (B : FData → A) (hB : ∀ (l : V) (p : FData), B (fourierShift a c l p) = B p)
    (p q : FData) (hD : fourierDiscriminant a c p = fourierDiscriminant a c q)
    (hR : ∀ i, Int.ModEq (2 * a) (p.2 i) (q.2 i)) : B p = B q := by sorry

example (p : FData) (l : V) :
    fourierDiscriminant (-1) 0 (fourierShift (-1) 0 l p) =
      fourierDiscriminant (-1) 0 p := by sorry

example : ¬ ∃ l : V, fourierShift 1 1 l (0,0) =
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, 0) := by sorry

example : ¬ ∃ l : V, fourierShift 0 1 l (0,0) =
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, 0) := by sorry

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
/-- IVec in the specified native carrier. -/
abbrev IVec := Fin 2 → ℤ
/-- CVec in the specified native carrier. -/
abbrev CVec := Fin 2 → ℂ
/-- RVec in the specified native carrier. -/
abbrev RVec := Fin 2 → ℝ
/-- M2 in the specified native carrier. -/
abbrev M2 (R : Type*) := Matrix (Fin 2) (Fin 2) R
/-- I4 in the specified native carrier. -/
abbrev I4 := Fin 2 ⊕ Fin 2
/-- M4 in the specified native carrier. -/
abbrev M4 (R : Type*) := Matrix I4 I4 R

/-- Exp Two Pi in the specified native carrier. -/
def expTwoPi (z : ℂ) : ℂ := Complex.exp (2 * Real.pi * Complex.I * z)
/-- Quad in the specified native carrier. -/
def quad (Z : M2 ℂ) (w : CVec) : ℂ := w ⬝ᵥ (Z *ᵥ w)
/-- Block A in the specified native carrier. -/
def blockA (g : M4 ℝ) : M2 ℂ := fun i j => g (.inl i) (.inl j)
/-- Block B in the specified native carrier. -/
def blockB (g : M4 ℝ) : M2 ℂ := fun i j => g (.inl i) (.inr j)
/-- Block C in the specified native carrier. -/
def blockC (g : M4 ℝ) : M2 ℂ := fun i j => g (.inr i) (.inl j)
/-- Block D in the specified native carrier. -/
def blockD (g : M4 ℝ) : M2 ℂ := fun i j => g (.inr i) (.inr j)
/-- Fractional in the specified native carrier. -/
def fractional (g : M4 ℝ) (Z : M2 ℂ) : M2 ℂ :=
  (blockA g * Z + blockB g) * (blockC g * Z + blockD g)⁻¹
/-- Base Matrix in the specified native carrier. -/
def baseMatrix : M2 ℂ := Complex.I • (1 : M2 ℂ)
/-- Base Image in the specified native carrier. -/
def baseImage (g : M4 ℝ) : M2 ℂ := fractional g baseMatrix
/-- Sym Coords in the specified native carrier. -/
def symCoords (x : Fin 3 → ℝ) : M2 ℝ := !![x 2, x 1; x 1, x 0]
/-- Unipotent in the specified native carrier. -/
def unipotent (X : M2 ℝ) : M4 ℝ := Matrix.fromBlocks 1 X 0 1
/-- Iv Cast in the specified native carrier. -/
def ivCast (v : IVec) : CVec := fun i => v i

/-- Siegel Space in the specified native carrier. -/
abbrev SiegelSpace : Type := {Z : M2 ℂ // Zᵀ = Z ∧ (Z.map Complex.im).PosDef}
/-- Siegel Space mem, with the hypotheses and domain displayed below. -/
theorem siegelSpace_mem (Z : M2 ℂ) : (Zᵀ = Z ∧ (Z.map Complex.im).PosDef) ↔
    ∃ z : SiegelSpace, z.val = Z := by sorry
/-- Siegel Space im pos, with the hypotheses and domain displayed below. -/
theorem siegelSpace_im_pos (z : SiegelSpace) : (z.val.map Complex.im).PosDef := by sorry
/-- Siegel Space base in the specified native carrier. -/
def siegelSpace_base : SiegelSpace := ⟨baseMatrix, by sorry⟩

example : ∃ z : SiegelSpace, z.val = !![Complex.I,0;0,2*Complex.I] := by sorry

example : ¬ ∃ z : SiegelSpace, z.val = (1 : M2 ℂ) := by sorry

example : ¬ ∃ z : SiegelSpace, z.val = !![Complex.I,1;0,Complex.I] := by sorry

/-- Positive Similitudes in the specified native carrier. -/
def positiveSimilitudes : Subgroup ((M4 ℝ)ˣ × ℝˣ) := by sorry
/-- Positive Similitudes mem, with the hypotheses and domain displayed below. -/
theorem positiveSimilitudes_mem (g : (M4 ℝ)ˣ) (mu : ℝˣ) :
    (g,mu) ∈ positiveSimilitudes ↔ 0 < (mu : ℝ) ∧
      (g : M4 ℝ)ᵀ * Matrix.J (Fin 2) ℝ * (g : M4 ℝ) =
        (mu : ℝ) • Matrix.J (Fin 2) ℝ := by sorry
/-- Positive Similitudes multiplier mul, with the hypotheses and domain displayed below. -/
theorem positiveSimilitudes_multiplier_mul (g h : positiveSimilitudes) :
    ((g*h).val.2 : ℝ) = (g.val.2 : ℝ)*(h.val.2 : ℝ) := by sorry
/-- Positive Similitudes symplectic, with the hypotheses and domain displayed below. -/
theorem positiveSimilitudes_symplectic (g : M4 ℝ) :
    gᵀ * Matrix.J (Fin 2) ℝ * g = Matrix.J (Fin 2) ℝ ↔
      g ∈ Matrix.symplecticGroup (Fin 2) ℝ := by sorry

example : (2 • (1 : M4 ℝ))ᵀ * Matrix.J (Fin 2) ℝ * (2 • (1 : M4 ℝ)) =
    4 • Matrix.J (Fin 2) ℝ := by sorry

example : ¬ ∃ mu : ℝ, 0 < mu ∧
    (Matrix.fromBlocks (1 : M2 ℝ) 0 0 (-1))ᵀ * Matrix.J (Fin 2) ℝ *
      (Matrix.fromBlocks (1 : M2 ℝ) 0 0 (-1)) = mu • Matrix.J (Fin 2) ℝ := by sorry

example : fractional (2 • (1 : M4 ℝ)) baseMatrix = baseMatrix := by sorry

/-- Siegel Action in the specified native carrier. -/
def siegelAction (g : positiveSimilitudes) (z : SiegelSpace) : SiegelSpace := by sorry
/-- Siegel Action apply, with the hypotheses and domain displayed below. -/
theorem siegelAction_apply (g : positiveSimilitudes) (z : SiegelSpace) :
    (siegelAction g z).val = fractional (g.val.1 : M4 ℝ) z.val := by sorry
/-- Siegel Factor in the specified native carrier. -/
def siegelFactor (g : positiveSimilitudes) (z : SiegelSpace) : ℂ :=
  (blockC (g.val.1 : M4 ℝ) * z.val + blockD (g.val.1 : M4 ℝ)).det / (g.val.2 : ℝ)
/-- Siegel Action one, with the hypotheses and domain displayed below. -/
theorem siegelAction_one (z : SiegelSpace) : siegelAction 1 z = z := by sorry
/-- Siegel Action mul, with the hypotheses and domain displayed below. -/
theorem siegelAction_mul (g h : positiveSimilitudes) (z : SiegelSpace) :
    siegelAction (g*h) z = siegelAction g (siegelAction h z) := by sorry
/-- Siegel Factor cocycle, with the hypotheses and domain displayed below. -/
theorem siegelFactor_cocycle (g h : positiveSimilitudes) (z : SiegelSpace) :
    siegelFactor (g*h) z = siegelFactor g (siegelAction h z)*siegelFactor h z := by sorry

example : fractional (2 • (1 : M4 ℝ)) baseMatrix = baseMatrix := by sorry

example : fractional (unipotent (1 : M2 ℝ)) baseMatrix = (1+Complex.I) • (1 : M2 ℂ) := by sorry

example : fractional (Matrix.J (Fin 2) ℝ) baseMatrix = baseMatrix := by sorry

/-- Similitude Cover in the specified native carrier. -/
structure similitudeCover where
  base : positiveSimilitudes
  root : SiegelSpace → ℂ
  continuous_root : Continuous root
  square_root : ∀ z, root z ^ 2 = siegelFactor base z
instance : Group similitudeCover := by sorry
/-- Similitude Cover square, with the hypotheses and domain displayed below. -/
theorem similitudeCover_square (g : similitudeCover) (z : SiegelSpace) :
    g.root z ^ 2 = siegelFactor g.base z := by sorry
/-- Similitude Cover mul root, with the hypotheses and domain displayed below. -/
theorem similitudeCover_mul_root (g h : similitudeCover) (z : SiegelSpace) :
    (g*h).root z = g.root (siegelAction h.base z)*h.root z := by sorry
/-- Similitude Cover kernel, with the hypotheses and domain displayed below. -/
theorem similitudeCover_kernel (g : similitudeCover) (h : g.base = 1) :
    (∀ z, g.root z = 1) ∨ (∀ z, g.root z = -1) := by sorry

example : (fun _ : SiegelSpace => (1 : ℂ)) ≠ (fun _ : SiegelSpace => (-1 : ℂ)) := by sorry

example : Complex.sqrt (-baseMatrix.det) = 1 := by sorry

example : Complex.sqrt (-(2 • baseMatrix).det) = 2 := by sorry

/-- Compact stabilizer, with the hypotheses and domain displayed below. -/
theorem compact_stabilizer (g : M4 ℝ) (h : g ∈ Matrix.symplecticGroup (Fin 2) ℝ) :
    fractional g baseMatrix = baseMatrix ↔ gᵀ * g = 1 := by sorry

/-- Arithmetic Gamma in the specified native carrier. -/
def arithmeticGamma (N : ℕ) : Subgroup (Matrix.symplecticGroup (Fin 2) ℤ) := by sorry
/-- Arithmetic Gamma mem, with the hypotheses and domain displayed below. -/
theorem arithmeticGamma_mem (N : ℕ) (g : Matrix.symplecticGroup (Fin 2) ℤ) :
    g ∈ arithmeticGamma N ↔
    (∀ i j : Fin 2, (N : ℤ) ∣ (g : M4 ℤ) (.inr i) (.inl j)) ∧
      (N : ℤ) ∣ (g : M4 ℤ) (.inl 1) (.inl 0) ∧
      (N : ℤ) ∣ (g : M4 ℤ) (.inr 0) (.inr 1) := by sorry
/-- Arithmetic Gamma one, with the hypotheses and domain displayed below. -/
theorem arithmeticGamma_one (N : ℕ) : (1 : Matrix.symplecticGroup (Fin 2) ℤ) ∈ arithmeticGamma N := by sorry
/-- Arithmetic Gamma upper, with the hypotheses and domain displayed below. -/
theorem arithmeticGamma_upper (N : ℕ) (X : M2 ℤ) (h : Xᵀ=X) :
    ∃ g : arithmeticGamma N, (g.val : M4 ℤ) = Matrix.fromBlocks 1 X 0 1 := by sorry

example : ∃ g : arithmeticGamma 8, (g.val : M4 ℤ) =
    Matrix.fromBlocks 1 (!![0,1;1,0] : M2 ℤ) 0 1 := by sorry

example : ¬ ∃ g : arithmeticGamma 8, (g.val : M4 ℤ) =
    Matrix.fromBlocks (1 : M2 ℤ) 0 1 1 := by sorry

example : arithmeticGamma 1 = ⊤ := by sorry

/-- Bfh Slash in the specified native carrier. -/
def bfhSlash (m : ℤ) (gamma : M4 ℝ) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (W : CVec) : ℂ :=
  let E := blockC gamma * baseImage g + blockD gamma
  expTwoPi (-m * quad (E⁻¹ * blockC gamma) W) * phi (gamma*g) (E⁻¹ᵀ *ᵥ W)
/-- Bfh Slash one, with the hypotheses and domain displayed below. -/
theorem bfhSlash_one (m : ℤ) (phi : M4 ℝ → CVec → ℂ) (g : positiveSimilitudes) (W : CVec) :
    bfhSlash m 1 phi (g.val.1 : M4 ℝ) W = phi (g.val.1 : M4 ℝ) W := by sorry
/-- Bfh Slash mul, with the hypotheses and domain displayed below. -/
theorem bfhSlash_mul (m : ℤ) (phi : M4 ℝ → CVec → ℂ)
    (a b : Matrix.symplecticGroup (Fin 2) ℝ) (g : positiveSimilitudes) (W : CVec) :
    bfhSlash m (b : M4 ℝ) (bfhSlash m (a : M4 ℝ) phi) (g.val.1 : M4 ℝ) W =
      bfhSlash m ((a : M4 ℝ)*(b : M4 ℝ)) phi (g.val.1 : M4 ℝ) W := by sorry
/-- Bfh Slash fourier, with the hypotheses and domain displayed below. -/
theorem bfhSlash_fourier (m : ℤ) (phi : M4 ℝ → CVec → ℂ) (g : positiveSimilitudes) (W : CVec) :
    bfhSlash m (Matrix.J (Fin 2) ℝ) phi (g.val.1 : M4 ℝ) W =
      expTwoPi (-m * quad (baseImage (g.val.1 : M4 ℝ))⁻¹ W) *
        phi (Matrix.J (Fin 2) ℝ * (g.val.1 : M4 ℝ)) ((baseImage (g.val.1 : M4 ℝ))⁻¹ *ᵥ W) := by sorry

example (m : ℤ) (gamma g : M4 ℝ) (W : CVec) : bfhSlash m gamma (fun _ _ => 0) g W = 0 := by sorry

example (m : ℤ) (B : M2 ℝ) (h : Bᵀ=B) (phi : M4 ℝ → CVec → ℂ) (g : positiveSimilitudes) (W : CVec) :
    bfhSlash m (unipotent B) phi (g.val.1 : M4 ℝ) W = phi (unipotent B*(g.val.1 : M4 ℝ)) W := by sorry

example (m : ℤ) (phi : M4 ℝ → CVec → ℂ) (W : CVec) :
    bfhSlash m (Matrix.J (Fin 2) ℝ) phi 1 W =
      expTwoPi (m * Complex.I * (W ⬝ᵥ W)) * phi (Matrix.J (Fin 2) ℝ) (-Complex.I • W) := by sorry

/-- Bfh Translate in the specified native carrier. -/
def bfhTranslate (m : ℤ) (l r : CVec) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (W : CVec) : ℂ :=
  expTwoPi (m * (quad (baseImage g) l + 2 * (W ⬝ᵥ l))) * phi g (W+baseImage g*ᵥl+r)
/-- Bfh Translate zero, with the hypotheses and domain displayed below. -/
theorem bfhTranslate_zero (m : ℤ) (phi : M4 ℝ → CVec → ℂ) : bfhTranslate m 0 0 phi = phi := by sorry
/-- Bfh Translate comp, with the hypotheses and domain displayed below. -/
theorem bfhTranslate_comp (m : ℤ) (l r k t : CVec) (phi : M4 ℝ → CVec → ℂ)
    (g : positiveSimilitudes) (W : CVec) :
    bfhTranslate m k t (bfhTranslate m l r phi) (g.val.1 : M4 ℝ) W =
      expTwoPi (2*m*(t ⬝ᵥ l)) * bfhTranslate m (l+k) (r+t) phi (g.val.1 : M4 ℝ) W := by sorry
/-- Bfh Translate linear, with the hypotheses and domain displayed below. -/
theorem bfhTranslate_linear (m : ℤ) (l r : CVec) (phi psi : M4 ℝ → CVec → ℂ) :
    bfhTranslate m l r (phi+psi) = bfhTranslate m l r phi + bfhTranslate m l r psi := by sorry

example : expTwoPi (2*(8 : ℂ)*((![1/8,0] : CVec) ⬝ᵥ ![1,0])) = 1 := by sorry

example : expTwoPi (2*((![1/4,0] : CVec) ⬝ᵥ ![1,0])) = -1 := by sorry

example : bfhTranslate 1 ![1,0] 0 (fun _ _ => 1) 1 0 = Complex.exp (-2*Real.pi) := by sorry

/-- Genus Two Theta in the specified native carrier. -/
def genusTwoTheta (a : ℕ) (nu : IVec) (Z : M2 ℂ) (W : CVec) : ℂ :=
  ∑' R : IVec, if ∀ i, Int.ModEq (2*(a : ℤ)) (R i) (nu i) then
    expTwoPi (quad Z (ivCast R)/(4*a) + (ivCast R ⬝ᵥ W)) else 0
/-- Genus Two Theta residue, with the hypotheses and domain displayed below. -/
theorem genusTwoTheta_residue (a : ℕ) (nu l : IVec) (Z : M2 ℂ) (W : CVec) :
    genusTwoTheta a (nu+(2*(a : ℤ))•l) Z W = genusTwoTheta a nu Z W := by sorry
/-- Genus Two Theta elliptic, with the hypotheses and domain displayed below. -/
theorem genusTwoTheta_elliptic (a : ℕ) (ha : 0<a) (nu l r : IVec) (z : SiegelSpace) (W : CVec) :
    genusTwoTheta a nu z.val W = expTwoPi (a*(quad z.val (ivCast l)+2*(W ⬝ᵥ ivCast l))) *
      genusTwoTheta a nu z.val (W+z.val*ᵥivCast l+ivCast r) := by sorry
/-- Genus Two Theta diagonal, with the hypotheses and domain displayed below. -/
theorem genusTwoTheta_diagonal (a : ℕ) (ha : 0<a) (z : CVec) (hz : ∀ i, 0<(z i).im) (W : CVec) :
    genusTwoTheta a 0 (Matrix.diagonal z) W = ∏ i, jacobiTheta₂ (2*a*W i) (2*a*z i) := by sorry

example (a : ℕ) (nu : IVec) (Z : M2 ℂ) (W : CVec) :
    genusTwoTheta a (-nu) Z (-W) = genusTwoTheta a nu Z W := by sorry

example (Z : M2 ℂ) (W : CVec) : genusTwoTheta 1 ![2,0] Z W = genusTwoTheta 1 0 Z W := by sorry

example : genusTwoTheta 1 0 baseMatrix 0 = jacobiTheta₂ 0 (2*Complex.I)^2 := by sorry

/-- Quadratic Matrix in the specified native carrier. -/
def quadraticMatrix (Q : QuadraticForm ℤ IVec) : M2 ℚ :=
  let b : ℚ := Q ![1,1] - Q ![1,0] - Q ![0,1]
  !![(Q ![1,0] : ℚ), b/2; b/2, (Q ![0,1] : ℚ)]
/-- Quadratic Matrix symmetric, with the hypotheses and domain displayed below. -/
theorem quadraticMatrix_symmetric (Q : QuadraticForm ℤ IVec) : (quadraticMatrix Q)ᵀ = quadraticMatrix Q := by sorry
/-- Quadratic Matrix eval, with the hypotheses and domain displayed below. -/
theorem quadraticMatrix_eval (Q : QuadraticForm ℤ IVec) (x : IVec) :
    (fun i => (x i : ℚ)) ⬝ᵥ (quadraticMatrix Q *ᵥ (fun i => (x i : ℚ))) = (Q x : ℚ) := by sorry
/-- Quadratic Matrix injective, with the hypotheses and domain displayed below. -/
theorem quadraticMatrix_injective : Function.Injective quadraticMatrix := by sorry

example : quadraticMatrix (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 1) = !![0,1/2;1/2,0] := by sorry

example : quadraticMatrix (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0) = !![1,0;0,0] := by sorry

example : quadraticMatrix (-QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0) = !![-1,0;0,0] := by sorry

/-- Fourier Coefficient in the specified native carrier. -/
def fourierCoefficient (N : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (Q : QuadraticForm ℤ IVec) (R : IVec) : ℂ :=
  let T : M2 ℂ := (quadraticMatrix Q).map (fun q : ℚ => (q : ℂ))
  (N : ℂ)^(-3*(j.val : ℤ)) *
    ∫ X : Fin 3 → ℝ in Set.pi Set.univ (fun _ => Set.Ico 0 ((N : ℝ)^j.val)),
      ∫ W : RVec in Set.pi Set.univ (fun _ => Set.Ico 0 1),
        phi (unipotent (symCoords X)*g) (fun i => W i) *
          expTwoPi (-((N : ℂ)^(-(j.val : ℤ)))*(T*(baseImage g+(symCoords X).map (fun x : ℝ => (x : ℂ)))).trace -
            (N : ℂ)^(1-j.val)*(ivCast R ⬝ᵥ (fun i => (W i : ℂ))))
/-- Fourier Coefficient zero, with the hypotheses and domain displayed below. -/
theorem fourierCoefficient_zero (N : ℕ) (j : Fin 2) (g : M4 ℝ) (Q : QuadraticForm ℤ IVec) (R : IVec) :
    fourierCoefficient N j (fun _ _ => 0) g Q R = 0 := by sorry

/-- Fourier Coefficient add, with the hypotheses and domain displayed below. -/
theorem fourierCoefficient_add (N : ℕ) (j : Fin 2) (phi psi : M4 ℝ → CVec → ℂ)
    (hp : Continuous (Function.uncurry phi)) (hq : Continuous (Function.uncurry psi))
    (g : positiveSimilitudes) (Q : QuadraticForm ℤ IVec) (R : IVec) :
    fourierCoefficient N j (phi+psi) (g.val.1 : M4 ℝ) Q R =
      fourierCoefficient N j phi (g.val.1 : M4 ℝ) Q R + fourierCoefficient N j psi (g.val.1 : M4 ℝ) Q R := by sorry
/-- Fourier Coefficient scalar, with the hypotheses and domain displayed below. -/
theorem fourierCoefficient_scalar (N : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (c : ℂ) (g : M4 ℝ) (Q : QuadraticForm ℤ IVec) (R : IVec) :
    fourierCoefficient N j (c • phi) g Q R = c*fourierCoefficient N j phi g Q R := by sorry

example (N : ℕ) (hN : 0 < N) (j : Fin 2) (g : M4 ℝ) :
    fourierCoefficient N j (fun _ _ => 1) g 0 0 = 1 := by sorry

example (N : ℕ) (hN : 0 < N) (j : Fin 2) (g : M4 ℝ) (R : IVec) :
    fourierCoefficient N j (fun _ W => expTwoPi ((N : ℂ)^(1-j.val)*(ivCast R ⬝ᵥ W))) g 0 R = 1 := by sorry

example (N : ℕ) (hN : 0 < N) (j : Fin 2) (g : M4 ℝ) (R : IVec) (hR : R≠0) :
    fourierCoefficient N j (fun _ _ => 1) g 0 R = 0 := by sorry

/-- Is Positive Matrix in the specified native carrier. -/
def isPositiveMatrix (g : M4 ℝ) : Prop :=
  ∃ mu : ℝ, 0 < mu ∧ gᵀ * Matrix.J (Fin 2) ℝ * g = mu • Matrix.J (Fin 2) ℝ
/-- Cusp Gamma in the specified native carrier. -/
def cuspGamma (j : Fin 2) (g : M4 ℤ) : M4 ℝ :=
  let h := g.map (fun x : ℤ => (x : ℝ))
  if j.val=0 then h else -(Matrix.J (Fin 2) ℝ)*h*Matrix.J (Fin 2) ℝ
/-- Bfh Jacobi Functions in the specified native carrier. -/
structure bfhJacobiFunctions (N : ℕ) (m : ℤ) (j : Fin 2) where
  toFun : M4 ℝ → CVec → ℂ
  smooth : ∀ g W, isPositiveMatrix g → ContDiffAt ℝ ⊤ (Function.uncurry toFun) (g,W)
  holomorphic : ∀ g, isPositiveMatrix g → Differentiable ℂ (toFun g)
  gamma_invariant : ∀ gamma : arithmeticGamma N, ∀ g W, isPositiveMatrix g →
    bfhSlash m (cuspGamma j (gamma.val : M4 ℤ)) toFun g W = toFun g W
  translation_invariant : ∀ l r : IVec, ∀ g W, isPositiveMatrix g →
    bfhTranslate m ((N : ℂ)^(-(j.val : ℤ)) • ivCast l)
      ((N : ℂ)^((j.val : ℤ)-1) • ivCast r) toFun g W = toFun g W
/-- Bfh Jacobi Functions zero in the specified native carrier. -/
def bfhJacobiFunctions_zero (N : ℕ) (m : ℤ) (j : Fin 2) : bfhJacobiFunctions N m j := by sorry
/-- Bfh Jacobi Functions translation, with the hypotheses and domain displayed below. -/
theorem bfhJacobiFunctions_translation (N : ℕ) (m : ℤ) (j : Fin 2) (phi : bfhJacobiFunctions N m j)
    (l r : IVec) (g : M4 ℝ) (W : CVec) (hg : isPositiveMatrix g) :
    bfhTranslate m ((N : ℂ)^(-(j.val : ℤ)) • ivCast l)
      ((N : ℂ)^((j.val : ℤ)-1) • ivCast r) phi.toFun g W = phi.toFun g W := by sorry
/-- Bfh Jacobi Functions fourier cusp in the specified native carrier. -/
def bfhJacobiFunctions_fourier_cusp (N : ℕ) (hN : 0 < N) (m : ℤ)
    (phi : bfhJacobiFunctions N m 0) : bfhJacobiFunctions N m 1 := by sorry

example (j : Fin 2) : ∃ phi : bfhJacobiFunctions 8 16 j, phi.toFun = fun _ _ => 0 := by sorry

example (N : ℕ) (hN : 0 < N) (j : Fin 2) :
    ∃ phi : bfhJacobiFunctions N 0 j, phi.toFun = fun _ _ => 1 := by sorry

example : ¬ ∃ phi : bfhJacobiFunctions 8 16 0, phi.toFun = fun _ _ => 1 := by sorry

/-- Gaussian projection divided by the Lebesgue theta norm √det(Im Z)/(4a). -/
def thetaComponent (N a : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (nu : IVec) : ℂ :=
  let Z := (N : ℂ) ^ (1 - 2 * (j.val : ℤ)) • baseImage g
  let Y := Z.map Complex.im
  (4 * a : ℂ) / (Real.sqrt Y.det : ℂ) *
    ∫ l : RVec in Set.pi Set.univ (fun _ => Set.Ico 0 1),
      ∫ r : RVec in Set.pi Set.univ (fun _ => Set.Ico 0 1),
        let W := Z *ᵥ (fun i => (l i : ℂ)) + (fun i => (r i : ℂ))
        phi g ((N : ℂ) ^ ((j.val : ℤ) - 1) • W) *
          conj (genusTwoTheta a nu Z W) *
          Complex.exp (-4 * Real.pi * a *
            quad ((Y⁻¹).map (fun x : ℝ => (x : ℂ))) (fun i => (W i).im)) * Y.det
/-- Theta Component zero, with the hypotheses and domain displayed below. -/
theorem thetaComponent_zero (N a : ℕ) (j : Fin 2) (g : M4 ℝ) (nu : IVec) :
    thetaComponent N a j (fun _ _ => 0) g nu = 0 := by sorry
/-- Theta Component residue, with the hypotheses and domain displayed below. -/
theorem thetaComponent_residue (N a : ℕ) (ha : 0<a) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (nu l : IVec) :
    thetaComponent N a j phi g (nu+(2*(a : ℤ))•l) = thetaComponent N a j phi g nu := by sorry

example (a : ℕ) (ha : 0<a) (mu nu : IVec) :
    thetaComponent 1 a 0 (fun g W => genusTwoTheta a mu (baseImage g) W) 1 nu =
      if (∀ i, Int.ModEq (2*(a : ℤ)) (mu i) (nu i)) then 1 else 0 := by sorry
/-- Theta Component scalar, with the hypotheses and domain displayed below. -/
theorem thetaComponent_scalar (N a : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (nu : IVec) (c : ℂ) : thetaComponent N a j (c • phi) g nu=c*thetaComponent N a j phi g nu := by sorry

example (N a : ℕ) (j : Fin 2) (g : M4 ℝ) (nu : IVec) : thetaComponent N a j (fun _ _ => 0) g nu=0 := by sorry

example (phi : M4 ℝ → CVec → ℂ) (g : M4 ℝ) : thetaComponent 8 2 1 phi g ![0,5]=thetaComponent 8 2 1 phi g ![0,1] := by sorry

/-- The Lebesgue Gaussian in two coordinates fixes the degree-two theta norm. -/
def thetaGaussianNorm (a : ℕ) : ℝ :=
  ∫ x : RVec, Real.exp (-4 * Real.pi * a * (x 0 ^ 2 + x 1 ^ 2))

/-- At index one the diagonal theta norm is one quarter. -/
example : thetaGaussianNorm 1 = 1 / 4 := by sorry

/-- Doubling the index halves this two-dimensional Gaussian norm. -/
example : thetaGaussianNorm 2 = 1 / 8 := by sorry

/-- Distinct residue classes are orthogonal with the stated Lebesgue measure. -/
example : ¬ (∀ i : Fin 2, Int.ModEq 2 (![0, 0] i) (![1, 0] i)) := by sorry

/-- Gaussian orthogonality with ordinary Lebesgue measure and diagonal norm √det(Y)/(4a). -/
theorem theta_pairing (a : ℕ) (ha : 0<a) (z : SiegelSpace) (mu nu : IVec) :
    (∫ l : RVec in Set.pi Set.univ (fun _ => Set.Ico 0 1),
      ∫ r : RVec in Set.pi Set.univ (fun _ => Set.Ico 0 1),
        let W := z.val *ᵥ (fun i => (l i : ℂ)) + (fun i => (r i : ℂ))
        genusTwoTheta a mu z.val W * conj (genusTwoTheta a nu z.val W) *
          Complex.exp (-4*Real.pi*a*quad (((z.val.map Complex.im)⁻¹).map (fun x : ℝ => (x : ℂ)))
            (fun i => (W i).im)) * (z.val.map Complex.im).det) =
      if (∀ i, Int.ModEq (2*(a : ℤ)) (mu i) (nu i)) then
        (Real.sqrt (z.val.map Complex.im).det : ℂ)/(4*a) else 0 := by sorry
/-- Coefficient shift analytic, with the hypotheses and domain displayed below. -/
theorem coefficient_shift_analytic (N m : ℕ) (hN : 0 < N) (hm : 0 < m) (hNm : N ∣ m)
    (j : Fin 2) (phi : bfhJacobiFunctions N m j) (g : positiveSimilitudes)
    (l : IVec) (p : QuadraticForm ℤ IVec × IVec) :
    let q := fourierShift (m/N) ((N : ℤ)^(1-j.val)) l p
    fourierCoefficient N j phi.toFun (g.val.1 : M4 ℝ) q.1 q.2 =
      fourierCoefficient N j phi.toFun (g.val.1 : M4 ℝ) p.1 p.2 := by sorry
/-- Theta decomposition, with the hypotheses and domain displayed below. -/
theorem theta_decomposition (N m : ℕ) (hN : 0 < N) (hm : 0 < m) (hNm : N ∣ m)
    (j : Fin 2) (phi : bfhJacobiFunctions N m j) (g : positiveSimilitudes) (W : CVec) :
    phi.toFun (g.val.1 : M4 ℝ) W =
      ∑ nu : Fin 2 → Fin (2*(m/N)),
        thetaComponent N (m/N) j phi.toFun (g.val.1 : M4 ℝ) (fun i => nu i) *
          genusTwoTheta (m/N) (fun i => nu i)
            ((N : ℂ)^(1-2*(j.val : ℤ)) • baseImage (g.val.1 : M4 ℝ))
            ((N : ℂ)^(1-j.val) • W) := by sorry
/-- Theta fourier transform, with the hypotheses and domain displayed below. -/
theorem theta_fourier_transform (a : ℕ) (ha : 0<a) (z : SiegelSpace) (W : CVec) (nu : IVec) :
    genusTwoTheta a nu (-z.val⁻¹) (z.val⁻¹ *ᵥ W) =
      expTwoPi (a*quad z.val⁻¹ W) * Complex.sqrt (-z.val.det)/(2*a) *
        ∑ mu : Fin 2 → Fin (2*a), expTwoPi (-(ivCast nu ⬝ᵥ (fun i => (mu i : ℂ)))/(2*a)) *
          genusTwoTheta a (fun i => mu i) z.val W := by sorry
/-- Theta component fourier law, with the hypotheses and domain displayed below. -/
theorem theta_component_fourier_law (N m : ℕ) (hN : 0 < N) (hm : 0 < m) (hNm : N ∣ m)
    (phi : bfhJacobiFunctions N m 0) (g : positiveSimilitudes) (nu : IVec) :
    thetaComponent N (m/N) 1 (bfhSlash m (Matrix.J (Fin 2) ℝ) phi.toFun) (g.val.1 : M4 ℝ) nu =
      Complex.sqrt (-(baseImage (g.val.1 : M4 ℝ)).det)/(2*m) *
        ∑ mu : Fin 2 → Fin (2*(m/N)),
          expTwoPi (-(N : ℂ)*(ivCast nu ⬝ᵥ (fun i => (mu i : ℂ)))/(2*m)) *
            thetaComponent N (m/N) 0 phi.toFun (Matrix.J (Fin 2) ℝ *(g.val.1 : M4 ℝ)) (fun i => mu i) := by sorry

/-- Theta Coefficient in the specified native carrier. -/
def thetaCoefficient (N m : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (U : M2 ℤ) (nu : IVec) : ℂ := by sorry
/-- Theta Coefficient recovered, with the hypotheses and domain displayed below. -/
theorem thetaCoefficient_recovered (N m : ℕ) (hN : 0 < N) (hm : 0 < m) (j : Fin 2)
    (phi : M4 ℝ → CVec → ℂ) (g : M4 ℝ) (Q : QuadraticForm ℤ IVec) (nu : IVec)
    (U : M2 ℤ) (hU : U.map (fun x : ℤ => (x : ℚ)) =
      (4*(m : ℚ)) • quadraticMatrix Q - (N : ℚ)^(2-j.val) •
        Matrix.vecMulVec (fun i => (nu i : ℚ)) (fun i => (nu i : ℚ))) :
    thetaCoefficient N m j phi g U nu = fourierCoefficient N j phi g Q nu := by sorry
/-- Theta Coefficient zero, with the hypotheses and domain displayed below. -/
theorem thetaCoefficient_zero (N m : ℕ) (j : Fin 2) (g : M4 ℝ) (U : M2 ℤ) (nu : IVec) :
    thetaCoefficient N m j (fun _ _ => 0) g U nu=0 := by sorry
/-- Theta Coefficient scalar, with the hypotheses and domain displayed below. -/
theorem thetaCoefficient_scalar (N m : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ) (g : M4 ℝ) (U : M2 ℤ) (nu : IVec) (c : ℂ) :
    thetaCoefficient N m j (c • phi) g U nu=c*thetaCoefficient N m j phi g U nu := by sorry

example (N m : ℕ) (j : Fin 2) (g : M4 ℝ) (U : M2 ℤ) (nu : IVec) :
    thetaCoefficient N m j (fun _ _ => 0) g U nu = 0 := by sorry

example (phi : M4 ℝ → CVec → ℂ) (g : M4 ℝ) : thetaCoefficient 8 16 1 phi g 1 0 = 0 := by sorry

example (phi : M4 ℝ → CVec → ℂ) (g : M4 ℝ) :
    thetaCoefficient 8 16 1 phi g !![0,0;0,56] ![0,1]=fourierCoefficient 8 1 phi g (QuadraticMap.proj 1 1) ![0,1] := by sorry

/-- KTwo in the specified native carrier. -/
abbrev KTwo := Matrix.unitaryGroup (Fin 2) ℂ
/-- Rotation K in the specified native carrier. -/
def rotationK (t : ℝ) : KTwo := ⟨(!![Real.cos t,Real.sin t;-Real.sin t,Real.cos t] : M2 ℂ), by sorry⟩

/-- BFHTest Vector in the specified native carrier. -/
structure BFHTestVector (k : ℕ) (d : ℕ) where
  sigma : KTwo →* (Matrix (Fin d) (Fin d) ℂ)ˣ
  continuous_sigma : Continuous (fun g => (sigma g : Matrix (Fin d) (Fin d) ℂ))
  v : Fin d → ℂ
  weight : ∀ t : ℝ, v ᵥ* (sigma (rotationK t) : Matrix (Fin d) (Fin d) ℂ) =
    Complex.exp (Complex.I*k*t) • v
  central : sigma ⟨(-1 : M2 ℂ), by sorry⟩ = 1
/-- Bfh Seed in the specified native carrier. -/
def bfhSeed (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) (g : M4 ℝ) : Fin d → ℂ := by sorry
/-- Bfh Seed identity, with the hypotheses and domain displayed below. -/
theorem bfhSeed_identity (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) :
    bfhSeed k d data F 1 = F 1 • data.v := by sorry
/-- Bfh Seed zero, with the hypotheses and domain displayed below. -/
theorem bfhSeed_zero (k d : ℕ) (data : BFHTestVector k d) : bfhSeed k d data (fun _ => 0) = 0 := by sorry
/-- Bfh Seed scalar, with the hypotheses and domain displayed below. -/
theorem bfhSeed_scalar (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) (c : ℂ) :
    bfhSeed k d data (c • F) = c • bfhSeed k d data F := by sorry

example (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) (h : F 1=1) :
    bfhSeed k d data F 1 = data.v := by sorry

example (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) (h : data.v=0) :
    bfhSeed k d data F = 0 := by sorry

example (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) :
    bfhSeed k d data F (2 • (1 : M4 ℝ)) = bfhSeed k d data F 1 := by sorry

/-- Induced Seed Family in the specified native carrier. -/
def inducedSeedFamily (I : M4 ℝ → ℂ) (s : ℂ) (g : M4 ℝ) : ℂ :=
  Complex.exp (s/2 * Real.log (baseImage g |>.map Complex.im |>.det)) * I g
/-- Induced Seed Family zero, with the hypotheses and domain displayed below. -/
theorem inducedSeedFamily_zero (I : M4 ℝ → ℂ) (g : positiveSimilitudes) :
    inducedSeedFamily I 0 (g.val.1 : M4 ℝ) = I (g.val.1 : M4 ℝ) := by sorry
/-- Induced Seed Family add, with the hypotheses and domain displayed below. -/
theorem inducedSeedFamily_add (I : M4 ℝ → ℂ) (s t : ℂ) (g : positiveSimilitudes) :
    inducedSeedFamily I (s+t) (g.val.1 : M4 ℝ) =
      Complex.exp (t/2*Real.log (baseImage (g.val.1 : M4 ℝ) |>.map Complex.im |>.det)) *
        inducedSeedFamily I s (g.val.1 : M4 ℝ) := by sorry
/-- Induced Seed Family holomorphic, with the hypotheses and domain displayed below. -/
theorem inducedSeedFamily_holomorphic (I : M4 ℝ → ℂ) (g : positiveSimilitudes) :
    Differentiable ℂ (fun s => inducedSeedFamily I s (g.val.1 : M4 ℝ)) := by sorry

example (I : M4 ℝ → ℂ) (s : ℂ) : inducedSeedFamily I s 1 = I 1 := by sorry

example (s : ℂ) : inducedSeedFamily (fun _ => 1) s
    (Matrix.fromBlocks (2 • (1 : M2 ℝ)) 0 0 ((1/2 : ℝ) • (1 : M2 ℝ))) = (4 : ℂ)^s := by sorry

example (s : ℂ) (g : M4 ℝ) : inducedSeedFamily (fun _ => 0) s g = 0 := by sorry

/-- Bfh Parabolic in the specified native carrier. -/
def bfhParabolic (N : ℕ) : Subgroup (arithmeticGamma N) := by sorry
/-- BFHCosets in the specified native carrier. -/
abbrev BFHCosets (N : ℕ) := (arithmeticGamma N) ⧸ bfhParabolic N

/-- Coset Matrix in the specified native carrier. -/
def cosetMatrix (N : ℕ) (c : BFHCosets N) : M4 ℝ := by sorry
/-- Jacobi Summand in the specified native carrier. -/
def jacobiSummand (_N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (s : ℂ)
    (gamma : M4 ℝ) (l : IVec) (g : M4 ℝ) (W : CVec) : ℂ :=
  bfhSlash m gamma (bfhTranslate m (ivCast l) 0 (fun h _ => inducedSeedFamily I s h)) g W
/-- Jacobi Eisenstein in the specified native carrier. -/
def jacobiEisenstein (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (s : ℂ) (g : M4 ℝ) (W : CVec) : ℂ :=
  ∑' c : BFHCosets N, ∑' l : IVec, jacobiSummand N m I s (cosetMatrix N c) l g W
/-- Jacobi Eisenstein zero, with the hypotheses and domain displayed below. -/
theorem jacobiEisenstein_zero (N : ℕ) (m : ℤ) (s : ℂ) : jacobiEisenstein N m (fun _ => 0) s = 0 := by sorry
/-- Jacobi Eisenstein scalar, with the hypotheses and domain displayed below. -/
theorem jacobiEisenstein_scalar (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (s c : ℂ) :
    jacobiEisenstein N m (c • I) s = c • jacobiEisenstein N m I s := by sorry
/-- Jacobi Eisenstein summand, with the hypotheses and domain displayed below. -/
theorem jacobiEisenstein_summand (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (s : ℂ) (g : positiveSimilitudes) (W : CVec) :
    jacobiSummand N m I s 1 0 (g.val.1 : M4 ℝ) W = inducedSeedFamily I s (g.val.1 : M4 ℝ) := by sorry

example (N : ℕ) (m : ℤ) (s : ℂ) (g : M4 ℝ) (Q : QuadraticForm ℤ IVec) (R : IVec) :
    fourierCoefficient N 0 (jacobiEisenstein N m (fun _ => 0) s) g Q R = 0 := by sorry

example (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (s : ℂ) : jacobiSummand N m I s 1 0 1 0 = I 1 := by sorry

example (N : ℕ) (I : M4 ℝ → ℂ) (s : ℂ) :
    jacobiSummand N 1 I s 1 ![1,0] 1 0 = Complex.exp (-2*Real.pi)*I 1 := by sorry

/-- Kappa X in the specified native carrier. -/
def kappaX (x : Fin 3 → ℝ) : KTwo := by sorry
/-- Transformed X in the specified native carrier. -/
def transformedX (x : Fin 3 → ℝ) : ℝ := -x 1*(x 0+x 2)/(1+(x 0)^2+(x 1)^2)
/-- Transformed Y in the specified native carrier. -/
def transformedY (x : Fin 3 → ℝ) : ℝ :=
  Real.sqrt (1+(x 0)^2+2*(x 1)^2+(x 2)^2+(x 0*x 2-(x 1)^2)^2)/(1+(x 0)^2+(x 1)^2)
/-- Whittaker Kernel in the specified native carrier. -/
def whittakerKernel (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s : ℂ) (x : Fin 3 → ℝ) : ℂ :=
  let Z := (symCoords x).map (fun a : ℝ => (a : ℂ)) + baseMatrix
  Complex.sqrt (-Z.det) / ((‖Z.det‖ : ℂ)^s) * expTwoPi (eps*y1*x 0) *
    expTwoPi (y2*((transformedX x : ℂ)+Complex.I*transformedY x)) *
    ((transformedY x : ℂ)^((k : ℂ)/2)) * phi (kappaX x)
/-- Whittaker Function in the specified native carrier. -/
def whittakerFunction (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s : ℂ) : ℂ :=
  ((y1*y2 : ℝ) : ℂ)^(4-s) * (y2 : ℂ)^((k : ℂ)/2) * ∫ x : Fin 3 → ℝ, whittakerKernel k phi eps y1 y2 s x
/-- Whittaker Function zero, with the hypotheses and domain displayed below. -/
theorem whittakerFunction_zero (k : ℕ) (eps : ℤ) (y1 y2 : ℝ) (s : ℂ) :
    whittakerFunction k (fun _ => 0) eps y1 y2 s = 0 := by sorry
/-- Whittaker Function scalar, with the hypotheses and domain displayed below. -/
theorem whittakerFunction_scalar (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s c : ℂ) :
    whittakerFunction k (c • phi) eps y1 y2 s = c*whittakerFunction k phi eps y1 y2 s := by sorry
/-- Whittaker Function degenerate scale, with the hypotheses and domain displayed below. -/
theorem whittakerFunction_degenerate_scale (k : ℕ) (phi : KTwo → ℂ) (y1 y2 : ℝ) (hy : 0<y1) (s : ℂ) :
    whittakerFunction k phi 0 y1 y2 s = (y1 : ℂ)^(4-s)*whittakerFunction k phi 0 1 y2 s := by sorry

example (k : ℕ) (y1 y2 : ℝ) (s : ℂ) : whittakerFunction k (fun _ => 0) 1 y1 y2 s = 0 := by sorry

example (k : ℕ) (eps : ℤ) (y1 y2 : ℝ) (s : ℂ) :
    whittakerKernel k (fun _ => 1) eps y1 y2 s 0 = Complex.exp (-2*Real.pi*y2) := by sorry

example (k : ℕ) (phi : KTwo → ℂ) (y2 : ℝ) (s : ℂ) :
    whittakerFunction k phi 0 2 y2 s = (2 : ℂ)^(4-s)*whittakerFunction k phi 0 1 y2 s := by sorry

/-- Whittaker majorant, with the hypotheses and domain displayed below. -/
theorem whittaker_majorant (a b c : ℝ) (ha : 1/2<a) (hab : 3/2<2*a+b) (habc : 1<a+b+c) :
    Integrable (fun x : Fin 3 → ℝ =>
      (1+(x 0)^2+2*(x 1)^2+(x 2)^2+(x 0*x 2-(x 1)^2)^2)^(-a) *
      (1+(x 0)^2+(x 1)^2)^(-b) * (1+(x 0)^2)^(-c)) := by sorry

/-- Is BFHMatrix Coefficient in the specified native carrier. -/
def IsBFHMatrixCoefficient (k : ℕ) (phi : KTwo → ℂ) : Prop :=
  ∃ d : ℕ, ∃ data : BFHTestVector k d, ∃ T : (Fin d → ℂ) →ₗ[ℂ] ℂ,
    ∀ q, phi q = T (data.v ᵥ* (data.sigma q : Matrix (Fin d) (Fin d) ℂ))

/-- Whittaker initial convergence, with the hypotheses and domain displayed below. -/
theorem whittaker_initial_convergence (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (eps : ℤ)
    (heps : eps ∈ ({-1,0,1} : Set ℤ)) (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2)
    (s : ℂ) (hs : 2<s.re) : Integrable (whittakerKernel k phi eps y1 y2 s) := by sorry

/-- Jacquet Two Parameter in the specified native carrier. -/
def jacquetTwoParameter (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s r : ℂ) : ℂ := by sorry
/-- Auxiliary Whittaker in the specified native carrier. -/
def auxiliaryWhittaker (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s r : ℂ) : ℂ :=
  (Real.pi : ℂ)^(-r)*Complex.Gamma (r+(k : ℂ)/2)*jacquetTwoParameter k phi eps y1 y2 s r
/-- Jacquet Two Parameter linear, with the hypotheses and domain displayed below. -/
theorem jacquetTwoParameter_linear (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s r c : ℂ) :
    jacquetTwoParameter k (c • phi) eps y1 y2 s r = c*jacquetTwoParameter k phi eps y1 y2 s r := by sorry
/-- Jacquet Two Parameter normalization, with the hypotheses and domain displayed below. -/
theorem jacquetTwoParameter_normalization (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s r : ℂ) :
    auxiliaryWhittaker k phi eps y1 y2 s r =
      (Real.pi : ℂ)^(-r)*Complex.Gamma (r+(k : ℂ)/2)*jacquetTwoParameter k phi eps y1 y2 s r := by sorry
/-- Jacquet Two Parameter specialize, with the hypotheses and domain displayed below. -/
theorem jacquetTwoParameter_specialize (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (eps : ℤ) (heps : eps=1 ∨ eps=-1)
    (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2) (s : ℂ) (hs : (3+(k : ℝ))/2<s.re) :
    auxiliaryWhittaker k phi eps y1 y2 s ((k : ℂ)/2) = whittakerFunction k phi eps y1 y2 s := by sorry

example (k : ℕ) (eps : ℤ) (y1 y2 : ℝ) (s r : ℂ) : jacquetTwoParameter k (fun _ => 0) eps y1 y2 s r=0 := by sorry

example : (Real.pi : ℂ)^(-(1 : ℂ))*Complex.Gamma (1+(2 : ℂ)/2) = (Real.pi : ℂ)⁻¹ := by sorry

example (y : ℝ) (hy : 0<y) : (y : ℂ)^((2 : ℂ)/2)*Complex.exp (-y/2) = y*Complex.exp (-y/2) := by sorry

/-- Jacquet r reflection, with the hypotheses and domain displayed below. -/
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

/-- Torus K in the specified native carrier. -/
def torusK (t : ℝ) : KTwo := ⟨Matrix.diagonal ![1,Complex.exp (Complex.I*t)], by sorry⟩

/-- Is Finite KMatrix Coefficient in the specified native carrier. -/
def IsFiniteKMatrixCoefficient (phi : KTwo → ℂ) : Prop :=
  ∃ d : ℕ, ∃ sigma : KTwo →* (Matrix (Fin d) (Fin d) ℂ)ˣ,
    Continuous (fun q => (sigma q : Matrix (Fin d) (Fin d) ℂ)) ∧
    sigma ⟨(-1 : M2 ℂ), by sorry⟩ = 1 ∧
    ∃ v : Fin d → ℂ, ∃ T : (Fin d → ℂ) →ₗ[ℂ] ℂ,
      ∀ q, phi q = T (v ᵥ* (sigma q : Matrix (Fin d) (Fin d) ℂ))

/-- Jacquet Gamma Arguments in the specified native carrier. -/
def jacquetGammaArguments (eps n : ℤ) (s r : ℂ) : ℂ × ℂ :=
  let e : ℂ := eps
  let t : ℂ := n
  ((s-r+e*t+(e-1)/2)/2, (s+r+e*t+(e+1)/2)/2)
/-- Normalized Jacquet in the specified native carrier. -/
def normalizedJacquet (k : ℕ) (phi : KTwo → ℂ) (eps n : ℤ) (y1 y2 : ℝ) (s r : ℂ) : ℂ :=
  (2 : ℂ)^(-s)*(Real.pi : ℂ)^(-s)*Complex.Gamma (jacquetGammaArguments eps n s r).1*
    Complex.Gamma (jacquetGammaArguments eps n s r).2*jacquetTwoParameter k phi eps y1 y2 s r
example (n : ℤ) (s r : ℂ) :
    jacquetGammaArguments 1 n s r = ((s-r+n)/2,(s+r+n+1)/2) := by sorry
example (n : ℤ) (s r : ℂ) :
    jacquetGammaArguments (-1) n s r = ((s-r-n-1)/2,(s+r-n)/2) := by sorry

/-- Jacquet weyl reflection, with the hypotheses and domain displayed below. -/
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

/-- Whittaker continuation, with the hypotheses and domain displayed below. -/
theorem whittaker_continuation (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (eps : ℤ) (heps : eps=1 ∨ eps=-1)
    (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2) :
    ∃ W : ℂ → ℂ, DifferentiableOn ℂ W {s | 3/2<s.re} ∧
      ∀ s, 2<s.re → W s = whittakerFunction k phi eps y1 y2 s := by sorry

/-- Whittaker rapid decay, with the hypotheses and domain displayed below. -/
theorem whittaker_rapid_decay (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (eps : ℤ) (heps : eps=1 ∨ eps=-1) :
    ∃ W : ℝ → ℝ → ℂ → ℂ,
      (∀ y1 y2, 0<y1 → 0<y2 → DifferentiableOn ℂ (W y1 y2) {s | 3/2<s.re}) ∧
      (∀ y1 y2 s, 0<y1 → 0<y2 → 2<s.re → W y1 y2 s=whittakerFunction k phi eps y1 y2 s) ∧
      ∀ S : Set ℂ, IsCompact S → S⊆{s | 3/2<s.re} →
        ∃ C : ℝ, ∃ xi : SchwartzMap (ℝ × ℝ) ℝ,
          ∀ s∈S, ∀ y1 y2 : ℝ, 0<y1 → 0<y2 →
            ‖W y1 y2 s‖≤Real.rpow (y1*y2) (-C)*xi (y1,y2) := by sorry

/-- Degenerate whittaker continuation, with the hypotheses and domain displayed below. -/
theorem degenerate_whittaker_continuation (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2) :
    ∃ W : ℂ → ℂ, DifferentiableOn ℂ W {s | 3/2<s.re} ∧
      ∀ s, 2<s.re → W s = whittakerFunction k phi 0 y1 y2 s := by sorry

/-- Test Phi1 in the specified native carrier. -/
def testPhi1 (x : Fin 3 → ℝ) : ℝ :=
  1 / Real.sqrt (1+(x 0)^2+2*(x 1)^2+(x 2)^2+(x 0*x 2-(x 1)^2)^2)
/-- Test Phi2 in the specified native carrier. -/
def testPhi2 (x : Fin 3 → ℝ) : ℝ :=
  (((symCoords x).det)^2-1)*x 0 /
    (1+(x 0)^2+2*(x 1)^2+(x 2)^2+(x 0*x 2-(x 1)^2)^2)^2
/-- Test Phi3 in the specified native carrier. -/
def testPhi3 (x : Fin 3 → ℝ) : ℝ :=
  x 1*(1-(symCoords x).det)/(1+(x 0)^2+2*(x 1)^2+(x 2)^2+(x 0*x 2-(x 1)^2)^2)

/-- Test Phi1 det, with the hypotheses and domain displayed below. -/
theorem testPhi1_det (x : Fin 3 → ℝ) :
    testPhi1 x = 1 / ‖((symCoords x).map (fun a : ℝ => (a : ℂ))+baseMatrix).det‖ := by sorry

example : (testPhi1 0,testPhi2 0,testPhi3 0) = (1,0,0) := by sorry

example : testPhi2 ![1,0,0] = -1/4 := by sorry

example : testPhi3 ![0,1,0] = 1/2 := by sorry

/-- Global Test Phi1 in the specified native carrier. -/
def globalTestPhi1 (q : KTwo) : ℂ := (((q : M2 ℂ).map Complex.im).det : ℝ)
/-- Global Test Phi1 chart, with the hypotheses and domain displayed below. -/
theorem globalTestPhi1_chart (x : Fin 3 → ℝ) :
    globalTestPhi1 (kappaX x) = (testPhi1 x : ℂ) := by sorry
/-- Delta Z in the specified native carrier. -/
def deltaZ (z : ℝ) : ℝ := Real.sqrt (1+z^2)
/-- Kappa Z in the specified native carrier. -/
def kappaZ (z : ℝ) : KTwo :=
  ⟨Matrix.diagonal ![1,(1-Complex.I*z)/(deltaZ z : ℂ)], by sorry⟩
/-- Global Test Phi1 rotated, with the hypotheses and domain displayed below. -/
theorem globalTestPhi1_rotated (x : Fin 3 → ℝ) (z : ℝ) :
    globalTestPhi1 (kappaX x*kappaZ z) =
      (((1+z*x 0)/deltaZ z*testPhi1 x : ℝ) : ℂ) := by sorry

example : globalTestPhi1 (kappaX ![-2,0,0]*kappaZ 1) =
    ((-1/(Real.sqrt 2*Real.sqrt 5) : ℝ) : ℂ) := by sorry

/-- Test Coefficient Algebra in the specified native carrier. -/
def testCoefficientAlgebra (k : ℕ) : Submodule ℂ (KTwo → ℂ) := by sorry
/-- Test Coefficient Algebra mul, with the hypotheses and domain displayed below. -/
theorem testCoefficientAlgebra_mul (k : ℕ) (f g : KTwo → ℂ)
    (hf : f ∈ testCoefficientAlgebra 0) (hg : g ∈ testCoefficientAlgebra k) :
    f*g ∈ testCoefficientAlgebra k := by sorry
/-- Test Coefficient Algebra dense, with the hypotheses and domain displayed below. -/
theorem testCoefficientAlgebra_dense (k : ℕ) (he : Even k) (f : KTwo → ℂ) (hf : Continuous f)
    (hw : ∀ t : ℝ, ∀ q : KTwo, f (rotationK t*q)=expTwoPi ((k : ℂ)*t/(2*Real.pi))*f q)
    (eps : ℝ) (heps : 0<eps) : ∃ g ∈ testCoefficientAlgebra k, ∀ q, ‖g q-f q‖<eps := by sorry
/-- Test Coefficient Algebra chart, with the hypotheses and domain displayed below. -/
theorem testCoefficientAlgebra_chart :
    globalTestPhi1 ∈ testCoefficientAlgebra 0 ∧
    ∃ f2 ∈ testCoefficientAlgebra 0, ∃ f3 ∈ testCoefficientAlgebra 0,
      ∀ x, globalTestPhi1 (kappaX x)=(testPhi1 x : ℂ) ∧
        f2 (kappaX x)=(testPhi2 x : ℂ) ∧ f3 (kappaX x)=(testPhi3 x : ℂ) := by sorry

/-- Has BFHDivisor in the specified native carrier. -/
def HasBFHDivisor (k : ℕ) (phi : KTwo → ℂ) : Prop :=
  ∃ psi ∈ testCoefficientAlgebra k, ∀ q : KTwo, phi q = globalTestPhi1 q*psi q

/-- Test coefficient strip, with the hypotheses and domain displayed below. -/
theorem test_coefficient_strip (k : ℕ) (phi : KTwo → ℂ) (hp : phi∈testCoefficientAlgebra k)
    (eps : ℝ) (he : 0<eps) (he1 : eps<1) :
    ∃ F : KTwo → ℝ → ℝ → ℂ → ℂ, ∃ B : ℝ, 0≤B ∧
      (∀ q x3 x4, DifferentiableOn ℂ (F q x3 x4) {z | |z.im|<1}) ∧
      (∀ q (x1 x3 x4 : ℝ), F q x3 x4 (x1 : ℂ)=phi (kappaX ![x1,x3,x4]*q)) ∧
      (∀ q x3 x4 z, |z.im|≤eps → ‖F q x3 x4 z‖≤B) := by sorry

/-- Rotated Whittaker Kernel in the specified native carrier. -/
def rotatedWhittakerKernel (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ)
    (y1 y2 : ℝ) (s : ℂ) (z : ℝ) (x : Fin 3 → ℝ) : ℂ :=
  ((y1*y2 : ℝ) : ℂ)^(4-s)*(y2 : ℂ)^((k : ℂ)/2)*
    whittakerKernel k (fun q => phi (q*kappaZ z)) eps y1 y2 s x
/-- Rotated whittaker bound, with the hypotheses and domain displayed below. -/
theorem rotated_whittaker_bound (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (hd : HasBFHDivisor k phi)
    (eps : ℤ) (heps : eps=1 ∨ eps=-1) (S : Set ℂ) (hS : IsCompact S) (hs : S⊆{s | 3/2<s.re}) :
    ∃ C B : ℝ, 0<C ∧ 0≤B ∧ ∀ s∈S, ∀ y1 y2 z : ℝ, 0<y1 → C<y2 →
      Integrable (rotatedWhittakerKernel k phi eps y1 y2 s z) ∧
      ‖∫ x : Fin 3 → ℝ, rotatedWhittakerKernel k phi eps y1 y2 s z x‖≤B*Real.rpow y1 (4-s.re) := by sorry

/-- Novodvorsky Kernel in the specified native carrier. -/
def novodvorskyKernel (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (u s : ℂ) (y1 y2 z : ℝ) : ℂ :=
  whittakerFunction k (fun q => phi (q*kappaZ z)) eps (y1/(1+z^2)) (deltaZ z*y2) s *
    expTwoPi (-eps*y1*z/(1+z^2)) * (y1 : ℂ)^(u-3/2) * Complex.sqrt (1+Complex.I*z)
/-- Novodvorsky Transform in the specified native carrier. -/
def novodvorskyTransform (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (u s : ℂ) (y2 : ℝ) : ℂ :=
  ∫ y1 in Set.Ioi (0 : ℝ), (∫ z : ℝ, novodvorskyKernel k phi eps u s y1 y2 z) / y1
/-- Novodvorsky Transform zero, with the hypotheses and domain displayed below. -/
theorem novodvorskyTransform_zero (k : ℕ) (eps : ℤ) (u s : ℂ) (y2 : ℝ) :
    novodvorskyTransform k (fun _ => 0) eps u s y2 = 0 := by sorry
/-- Novodvorsky Transform scalar, with the hypotheses and domain displayed below. -/
theorem novodvorskyTransform_scalar (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (u s c : ℂ) (y2 : ℝ) :
    novodvorskyTransform k (c • phi) eps u s y2 = c*novodvorskyTransform k phi eps u s y2 := by sorry
/-- Novodvorsky Transform sign, with the hypotheses and domain displayed below. -/
theorem novodvorskyTransform_sign (y1 z : ℝ) :
    expTwoPi (-y1*z/(1+z^2)) * expTwoPi (y1*z/(1+z^2)) = 1 := by sorry

example (k : ℕ) (u s : ℂ) (y2 : ℝ) : novodvorskyTransform k (fun _ => 0) 1 u s y2 = 0 := by sorry

example : Complex.sqrt (1+Complex.I*(0 : ℝ)) = 1 := by sorry

example : expTwoPi ((-1 : ℂ)/2) = -1 := by sorry

/-- Novodvorsky continuation, with the hypotheses and domain displayed below. -/
theorem novodvorsky_continuation (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (hd : HasBFHDivisor k phi)
    (eps : ℤ) (heps : eps=1 ∨ eps=-1) (y2 : ℝ) (h2 : 0<y2) :
    ∃ F : (ℂ × ℂ) → ℂ,
      DifferentiableOn ℂ F {z | 3/2<z.2.re ∧ 0<(z.1-z.2+5/2).re} ∧
      ∀ s, 2<s.re → ∃ U : ℝ, ∀ u, U<u.re → F (u,s)=novodvorskyTransform k phi eps u s y2 := by sorry

/-- Tau Compact Argument in the specified native carrier. -/
def tauCompactArgument (z : ℝ) : KTwo := by sorry
/-- Tau Kernel in the specified native carrier. -/
def tauKernel (k : ℕ) (phi : KTwo → ℂ) (s : ℂ) (y2 z : ℝ) : ℂ :=
  (deltaZ z : ℂ)^(-s+(k : ℂ)/2)*Complex.exp (-2*Real.pi*y2*deltaZ z)*
    Complex.sqrt (1+Complex.I*z)*phi (tauCompactArgument z)
/-- Tau Transform in the specified native carrier. -/
def tauTransform (k : ℕ) (phi : KTwo → ℂ) (s : ℂ) (y2 : ℝ) : ℂ := ∫ z : ℝ, tauKernel k phi s y2 z
/-- Tau Transform zero, with the hypotheses and domain displayed below. -/
theorem tauTransform_zero (k : ℕ) (s : ℂ) (y2 : ℝ) : tauTransform k (fun _ => 0) s y2=0 := by sorry
/-- Tau Transform scalar, with the hypotheses and domain displayed below. -/
theorem tauTransform_scalar (k : ℕ) (phi : KTwo → ℂ) (s c : ℂ) (y2 : ℝ) :
    tauTransform k (c • phi) s y2=c*tauTransform k phi s y2 := by sorry
/-- Tau Transform holomorphic, with the hypotheses and domain displayed below. -/
theorem tauTransform_holomorphic (k : ℕ) (phi : KTwo → ℂ) (hp : Continuous phi) (y2 : ℝ) (h2 : 0<y2) :
    Differentiable ℂ (fun s => tauTransform k phi s y2) := by sorry

example (k : ℕ) (s : ℂ) (y2 : ℝ) : tauTransform k (fun _ => 0) s y2=0 := by sorry

example (k : ℕ) (s : ℂ) (y2 : ℝ) : tauKernel k (fun _ => 1) s y2 0=Complex.exp (-2*Real.pi*y2) := by sorry

example (z : ℝ) : (deltaZ z : ℂ)^(-(1 : ℂ)+(2 : ℂ)/2)=1 := by sorry

/-- Degenerate Mellin Coefficients in the specified native carrier. -/
def degenerateMellinCoefficients (Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ)
    (phi : KTwo → ℂ) (s : ℂ) (y2 : ℝ) : ℂ :=
  ∫ z : ℝ, (deltaZ z : ℂ)^(2*s-8)*Wc (fun q => phi (q*kappaZ z)) (deltaZ z*y2) s*Complex.sqrt (1+Complex.I*z)
/-- Degenerate Mellin Opposite in the specified native carrier. -/
def degenerateMellinOpposite (Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ)
    (phi : KTwo → ℂ) (s : ℂ) (y2 : ℝ) : ℂ := by sorry

/-- Degenerate Mellin Coefficients kernel, with the hypotheses and domain displayed below. -/
theorem degenerateMellinCoefficients_kernel (s : ℂ) (z : ℝ) :
    (deltaZ z : ℂ)^(2*s-8)*Complex.sqrt (1+Complex.I*z) =
    ((Real.sqrt (1+z^2) : ℝ) : ℂ)^(2*s-8)*Complex.sqrt (1+Complex.I*z) := by sorry

example (Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ) (hz : ∀ y s, Wc (fun _ => 0) y s=0) (s : ℂ) (y2 : ℝ) :
    degenerateMellinCoefficients Wc (fun _ => 0) s y2=0 := by sorry

example (z : ℝ) : (deltaZ z : ℂ)^(2*(2 : ℂ)-8)=(1+(z : ℂ)^2)^(-2 : ℂ) := by sorry

example (s : ℂ) : (deltaZ 0 : ℂ)^(2*s-8)*Complex.sqrt (1+Complex.I*(0 : ℝ))=1 := by sorry

/-- Degenerate Mellin Coefficients linear, with the hypotheses and domain displayed below. -/
theorem degenerateMellinCoefficients_linear (Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ)
    (hl : ∀ c phi y s, Wc (c • phi) y s=c*Wc phi y s)
    (phi : KTwo → ℂ) (s c : ℂ) (y2 : ℝ) :
    degenerateMellinCoefficients Wc (c • phi) s y2=c*degenerateMellinCoefficients Wc phi s y2 := by sorry

/-- Degenerate Mellin Coefficients holomorphic, with the hypotheses and domain displayed below. -/
theorem degenerateMellinCoefficients_holomorphic (Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ)
    (phi : KTwo → ℂ) (y2 : ℝ) (h2 : 0<y2)
    (hw : ∀ z : ℝ, DifferentiableOn ℂ (fun s =>
      (deltaZ z : ℂ)^(2*s-8)*Wc (fun q => phi (q*kappaZ z)) (deltaZ z*y2) s*Complex.sqrt (1+Complex.I*z)) {s | 3/2<s.re})
    (hmeas : ∀ s : ℂ, AEStronglyMeasurable (fun z : ℝ =>
      (deltaZ z : ℂ)^(2*s-8)*Wc (fun q => phi (q*kappaZ z)) (deltaZ z*y2) s*Complex.sqrt (1+Complex.I*z)))
    (hdom : ∀ s : ℂ, 3/2<s.re → ∃ U : Set ℂ, IsOpen U ∧ s∈U ∧ U⊆{t | 3/2<t.re} ∧
      ∃ B : ℝ → ℝ, Integrable B ∧ ∀ t∈U, ∀ z : ℝ,
        ‖(deltaZ z : ℂ)^(2*t-8)*Wc (fun q => phi (q*kappaZ z)) (deltaZ z*y2) t*Complex.sqrt (1+Complex.I*z)‖≤B z) :
    DifferentiableOn ℂ (fun s => degenerateMellinCoefficients Wc phi s y2) {s | 3/2<s.re} := by sorry

/-- Local test nonzero f, with the hypotheses and domain displayed below. -/
theorem local_test_nonzero_f (k : ℕ) (hk : 2≤k) (he : Even k)
    (u s : ℂ) (hs : 3/2<s.re) (hu : 0<(u-s+5/2).re) :
    ∃ phi : KTwo → ℂ, IsBFHMatrixCoefficient k phi ∧ HasBFHDivisor k phi ∧
      (∀ t y2, 0<y2 → tauTransform k phi t y2=0) ∧
      ∀ eps : ℤ, eps=1 ∨ eps=-1 → ∃ y2 : ℝ, 0<y2 ∧ ∃ F : (ℂ × ℂ) → ℂ,
        DifferentiableOn ℂ F {z | 3/2<z.2.re ∧ 0<(z.1-z.2+5/2).re} ∧ F (u,s)≠0 ∧
        ∀ t, 2<t.re → ∃ U : ℝ, ∀ v, U<v.re → F (v,t)=novodvorskyTransform k phi eps v t y2 := by sorry

/-- Local test nonzero tau, with the hypotheses and domain displayed below. -/
theorem local_test_nonzero_tau (k : ℕ) (hk : 2≤k) (he : Even k) (s : ℂ) (hs : 3/2<s.re) :
    ∃ phi : KTwo → ℂ, IsBFHMatrixCoefficient k phi ∧ HasBFHDivisor k phi ∧
      ∃ y2 : ℝ, 0<y2 ∧ tauTransform k phi s y2≠0 := by sorry

/-- Local test nonzero m, with the hypotheses and domain displayed below. -/
theorem local_test_nonzero_m (k : ℕ) (hk : 2≤k) (he : Even k) :
    ∃ Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ,
      (∀ psi, IsBFHMatrixCoefficient k psi → ∀ y, 0<y → DifferentiableOn ℂ (Wc psi y) {s | 3/2<s.re}) ∧
      (∀ psi, IsBFHMatrixCoefficient k psi → ∀ y s, 0<y → 2<s.re → Wc psi y s=whittakerFunction k psi 0 1 y s) ∧
      ∃ phi : KTwo → ℂ, IsBFHMatrixCoefficient k phi ∧ HasBFHDivisor k phi ∧
        (∀ s y, 0<y → tauTransform k phi s y=0) ∧
        ∃ y : ℝ, 0<y ∧ degenerateMellinCoefficients Wc phi 2 y≠0 := by sorry

/-- Symplectic Pairing in the specified native carrier. -/
def symplecticPairing (w v : I4 → ℝ) : ℝ := w ⬝ᵥ (Matrix.J (Fin 2) ℝ *ᵥ v)
/-- Heisenberg Coordinates Mul in the specified native carrier. -/
def heisenbergCoordinatesMul (x y : (I4 → ℝ) × ℝ) : (I4 → ℝ) × ℝ :=
  (x.1+y.1,x.2+y.2+symplecticPairing x.1 y.1/2)
/-- Similitude Coordinates Action in the specified native carrier. -/
def similitudeCoordinatesAction (g : positiveSimilitudes) (x : (I4 → ℝ) × ℝ) : (I4 → ℝ) × ℝ :=
  ((g.val.1 : M4 ℝ) *ᵥ x.1,(g.val.2 : ℝ)*x.2)

/-- Similitude heisenberg comparison, with the hypotheses and domain displayed below. -/
theorem similitude_heisenberg_comparison (g : positiveSimilitudes) (x y : (I4 → ℝ) × ℝ) :
    similitudeCoordinatesAction g (heisenbergCoordinatesMul x y)=
      heisenbergCoordinatesMul (similitudeCoordinatesAction g x) (similitudeCoordinatesAction g y) := by sorry

/-- Cover Conjugation in the specified native carrier. -/
def coverConjugation : MulAut similitudeCover := by sorry
/-- Cover Reflection Action in the specified native carrier. -/
def coverReflectionAction : Multiplicative (ZMod 2) →* MulAut similitudeCover := by sorry
/-- Full Real Cover in the specified native carrier. -/
abbrev fullRealCover := SemidirectProduct similitudeCover (Multiplicative (ZMod 2)) coverReflectionAction
/-- Full Real Projection in the specified native carrier. -/
def fullRealProjection : fullRealCover →* (M4 ℝ)ˣ := by sorry
/-- Full Real Cover positive, with the hypotheses and domain displayed below. -/
theorem fullRealCover_positive (g : similitudeCover) :
    fullRealProjection ⟨g,1⟩ = g.base.val.1 := by sorry
/-- Full Real Cover kernel, with the hypotheses and domain displayed below. -/
theorem fullRealCover_kernel (g : fullRealCover) (h : fullRealProjection g=1) :
    g.right=1 ∧ ((∀ z, g.left.root z=1) ∨ (∀ z, g.left.root z=-1)) := by sorry
/-- Full Real Cover reflection, with the hypotheses and domain displayed below. -/
theorem fullRealCover_reflection :
    (⟨1,Multiplicative.ofAdd (1 : ZMod 2)⟩ : fullRealCover)^2=1 := by sorry

example : (Matrix.fromBlocks (1 : M2 ℝ) 0 0 (-1))^2=(1 : M4 ℝ) := by sorry

example : -(baseMatrix.map star)=baseMatrix := by sorry

example (g : similitudeCover) (h : g.base=1) (hroot : ∀ z, g.root z=-1) :
    ∀ z, (coverConjugation g).root z=-1 := by sorry

/-- Bfh Levi in the specified native carrier. -/
def bfhLevi (Q : M2 ℝ) : M4 ℝ := Matrix.fromBlocks Q 0 0 Q⁻¹ᵀ
/-- Theta levi transform, with the hypotheses and domain displayed below. -/
theorem theta_levi_transform (N m : ℕ) (hN : 0 < N) (hm : 0 < m) (hNm : N∣m)
    (n : ℤ) (hn : (N : ℤ)∣n) (phi : bfhJacobiFunctions N m 1) (g : positiveSimilitudes) (nu : IVec) :
    thetaComponent N (m/N) 1 phi.toFun (bfhLevi !![1,(n : ℝ);0,1]*(g.val.1 : M4 ℝ)) nu=
      thetaComponent N (m/N) 1 phi.toFun (g.val.1 : M4 ℝ) ((!![1,n;0,1] : M2 ℤ)ᵀ *ᵥ nu) := by sorry

/-- Theta unipotent transforms, with the hypotheses and domain displayed below. -/
theorem theta_unipotent_transforms (N m : ℕ) (hN : 0 < N) (hm : 0 < m) (hNm : N∣m)
    (phi : bfhJacobiFunctions N m 1) (g : positiveSimilitudes) (r : ℤ)
    (Vv : M2 ℤ) (hv : Vvᵀ=Vv) (h00 : (N : ℤ)∣Vv 0 0) (h01 : (N : ℤ)∣Vv 0 1)
    (h11 : (4*(m : ℤ))∣Vv 1 1) :
    thetaComponent N (m/N) 1 phi.toFun (unipotent (Vv.map (fun z => (z : ℝ)))*(g.val.1 : M4 ℝ)) ![0,r]=
      thetaComponent N (m/N) 1 phi.toFun (g.val.1 : M4 ℝ) ![0,r] := by sorry

/-- Coefficient levi transform, with the hypotheses and domain displayed below. -/
theorem coefficient_levi_transform (Q : QuadraticForm ℤ IVec) (y : M2 ℤ) :
    quadraticMatrix (Q.comp (Matrix.toLin' y))=
      (y.map (fun z : ℤ => (z : ℚ)))ᵀ*quadraticMatrix Q*(y.map (fun z : ℤ => (z : ℚ))) := by sorry

/-- Matrix Mobius in the specified native carrier. -/
def matrixMobius (H : M2 ℤ) : ℤ := by sorry
/-- Matrix Mobius unimodular, with the hypotheses and domain displayed below. -/
theorem matrixMobius_unimodular (H : (M2 ℤ)ˣ) : matrixMobius H = 1 := by sorry
/-- Matrix Mobius smith, with the hypotheses and domain displayed below. -/
theorem matrixMobius_smith (a b : ℕ) (ha : 0<a) (hb : 0<b) (hab : a∣b) :
    matrixMobius !![(a : ℤ),0;0,(b : ℤ)] =
      (Nat.gcd a b : ℤ)*ArithmeticFunction.moebius a*ArithmeticFunction.moebius b := by sorry
/-- Matrix Mobius equiv, with the hypotheses and domain displayed below. -/
theorem matrixMobius_equiv (H : M2 ℤ) (U Vv : (M2 ℤ)ˣ) :
    matrixMobius ((U : M2 ℤ)*H*(Vv : M2 ℤ)) = matrixMobius H := by sorry

example : matrixMobius (1 : M2 ℤ) = 1 := by sorry

example (p : ℕ) (hp : p.Prime) : matrixMobius ((p : ℤ) • (1 : M2 ℤ)) = p := by sorry

example (p : ℕ) (hp : p.Prime) : matrixMobius !![((p : ℤ)^2),0;0,1] = 0 := by sorry

/-- Primitive Pair in the specified native carrier. -/
def primitivePair (C D : M2 ℤ) : Prop :=
  ∀ G : M2 ℚ, (∀ i j, ∃ z : ℤ, (G*C.map (fun z => (z : ℚ))) i j = z) →
    (∀ i j, ∃ z : ℤ, (G*D.map (fun z => (z : ℚ))) i j = z) →
    ∀ i j, ∃ z : ℤ, G i j = z
/-- Primitive symplectic pairs, with the hypotheses and domain displayed below. -/
theorem primitive_symplectic_pairs (C D : M2 ℤ) (hs : C*Dᵀ=D*Cᵀ)
    (hr : ∀ v : Fin 2 → ℚ, v ᵥ* C.map (fun z => (z : ℚ)) = 0 → v ᵥ* D.map (fun z => (z : ℚ)) = 0 → v = 0) :
    primitivePair C D ↔ ∃ g : Matrix.symplecticGroup (Fin 2) ℤ,
      (∀ i j, (g : M4 ℤ) (.inr i) (.inl j)=C i j) ∧
      (∀ i j, (g : M4 ℤ) (.inr i) (.inr j)=D i j) := by sorry

/-- Matrix Divisors in the specified native carrier. -/
abbrev MatrixDivisors (C : M2 ℤ) := {L : Submodule ℤ IVec // LinearMap.range (Matrix.toLin' C) ≤ L}

/-- Matrix Divisor Representative in the specified native carrier. -/
def matrixDivisorRepresentative (C : M2 ℤ) (L : MatrixDivisors C) : M2 ℤ := by sorry
/-- Matrix mobius divisor identity, with the hypotheses and domain displayed below. -/
theorem matrix_mobius_divisor_identity (C : M2 ℤ) (hc : C.det≠0) :
    (∑' L : MatrixDivisors C, (matrixMobius (matrixDivisorRepresentative C L) : ℂ))=
      if IsUnit C.det then 1 else 0 := by sorry

/-- Symmetric Pair Sum in the specified native carrier. -/
def symmetricPairSum (N : ℕ) (restricted primitive : Bool) (C : M2 ℤ) (h : M2 ℚ → ℂ) : ℂ := by sorry
/-- Matrix Divisor Quotient in the specified native carrier. -/
def matrixDivisorQuotient (C : M2 ℤ) (L : MatrixDivisors C) : M2 ℤ := by sorry
/-- Matrix mobius inversion, with the hypotheses and domain displayed below. -/
theorem matrix_mobius_inversion (C : M2 ℤ) (hc : C.det≠0) (h : M2 ℚ → ℂ)
    (hp : ∀ X : M2 ℚ, Xᵀ=X → ∀ S : M2 ℤ, Sᵀ=S → h (X+S.map (fun z => (z : ℚ)))=h X) :
    symmetricPairSum 1 false true C h=
      ∑' L : MatrixDivisors C, (matrixMobius (matrixDivisorRepresentative C L) : ℂ)*
        symmetricPairSum 1 false false (matrixDivisorQuotient C L) h := by sorry

/-- Finite Exponential Sums in the specified native carrier. -/
def finiteExponentialSums (j : Fin 2) (N : ℕ) (m : ℤ) (C : M2 ℤ)
    (T : QuadraticForm ℤ IVec) (R : IVec) : ℂ := by sorry

/-- First Cusp Phase in the specified native carrier. -/
def firstCuspPhase (N : ℕ) (m : ℤ) (C D : M2 ℤ) (T : QuadraticForm ℤ IVec) (R l : IVec) : ℂ :=
  let A := (C.map (fun z => (z : ℚ)))⁻¹ * D.map (fun z => (z : ℚ))
  expTwoPi (-(ivCast R ⬝ᵥ (A.map (fun q => (q : ℂ)) *ᵥ ivCast l)) +
    m*quad (A.map (fun q => (q : ℂ))) (ivCast l) +
    (1/(N : ℂ))*((quadraticMatrix T * A).trace : ℚ))
/-- Finite Exponential Sums well defined, with the hypotheses and domain displayed below. -/
theorem finiteExponentialSums_well_defined (N : ℕ) (m : ℤ) (C D S : M2 ℤ)
    (hc : C.det≠0) (hd : C*Dᵀ=D*Cᵀ) (hs : Sᵀ=S) (T : QuadraticForm ℤ IVec) (R l h : IVec) :
    firstCuspPhase N m C (D+(N : ℤ) • (C*S)) T R (l+Cᵀ *ᵥ h)=firstCuspPhase N m C D T R l := by sorry
/-- Finite Exponential Sums identity, with the hypotheses and domain displayed below. -/
theorem finiteExponentialSums_identity (N : ℕ) (hN : 0 < N) (m : ℤ)
    (T : QuadraticForm ℤ IVec) (R : IVec) : finiteExponentialSums 1 N m 1 T R=1 := by sorry
/-- Finite Exponential Sums bad determinant, with the hypotheses and domain displayed below. -/
theorem finiteExponentialSums_bad_determinant (N : ℕ) (hN : 0 < N) (m : ℤ) (C : M2 ℤ)
    (hc : C.det≠0) (hbad : 1<Int.gcd C.det N) (T : QuadraticForm ℤ IVec) (R : IVec) :
    finiteExponentialSums 1 N m C T R=0 := by sorry

example : finiteExponentialSums 1 1 1 1 0 0=1 := by sorry

example (p N : ℕ) (hp : p.Prime) (hN : 0 < N) (hd : p∣N) (T : QuadraticForm ℤ IVec) (R : IVec) :
    finiteExponentialSums 1 N 1 ((p : ℤ) • (1 : M2 ℤ)) T R=0 := by sorry

example : finiteExponentialSums 1 1 1 (!![1,0;0,3] : M2 ℤ) 0 0=0 := by sorry

/-- Fourier Unfolding Kernel in the specified native carrier. -/
def fourierUnfoldingKernel (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (Q : M2 ℝ) (s : ℂ)
    (C : M2 ℤ) (T : M2 ℚ) (R : IVec) : ℂ :=
  (1/(2*m*(N : ℂ)^3)) * ∫ x : Fin 3 → ℝ,
    let Y := Q*Qᵀ
    let Z := (symCoords x).map (fun a : ℝ => (a : ℂ)) + Complex.I • Y.map (fun a : ℝ => (a : ℂ))
    Complex.sqrt (-Z.det) * Complex.exp (s/2*Real.log (Y.det/‖Z.det‖^2)) *
      I (Matrix.fromBlocks (0 : M2 ℝ) (-(C.map (fun z => (z : ℝ)))⁻¹ᵀ) (C.map (fun z => (z : ℝ))) 0 *
        Matrix.fromBlocks Q ((symCoords x)*Q⁻¹ᵀ) 0 Q⁻¹ᵀ) *
      expTwoPi (quad Z (ivCast R)/(4*m) - (1/(N : ℂ))*((T.map (fun q => (q : ℂ))*Z).trace))
/-- Fourier Unfolding Kernel zero, with the hypotheses and domain displayed below. -/
theorem fourierUnfoldingKernel_zero (N : ℕ) (m : ℤ) (Q : M2 ℝ) (s : ℂ) (C : M2 ℤ) (T : M2 ℚ) (R : IVec) :
    fourierUnfoldingKernel N m (fun _ => 0) Q s C T R=0 := by sorry
/-- Fourier Unfolding Kernel linear, with the hypotheses and domain displayed below. -/
theorem fourierUnfoldingKernel_linear (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (Q : M2 ℝ) (s c : ℂ)
    (C : M2 ℤ) (T : M2 ℚ) (R : IVec) :
    fourierUnfoldingKernel N m (c • I) Q s C T R=c*fourierUnfoldingKernel N m I Q s C T R := by sorry
/-- Fourier Unfolding Kernel discriminant, with the hypotheses and domain displayed below. -/
theorem fourierUnfoldingKernel_discriminant (N : ℕ) (hN : 0 < N) (m : ℤ) (hm : m≠0)
    (I : M4 ℝ → ℂ) (Q : M2 ℝ) (s : ℂ) (C : M2 ℤ) (Uq : M2 ℚ) (R : IVec) :
    fourierUnfoldingKernel N m I Q s C ((1/(4*m : ℚ)) • (Uq+(N : ℚ) • Matrix.vecMulVec (fun i => (R i : ℚ)) (fun i => (R i : ℚ)))) R =
      fourierUnfoldingKernel N m I Q s C ((1/(4*m : ℚ)) • Uq) 0 := by sorry

example (N : ℕ) (m : ℤ) (Q : M2 ℝ) (s : ℂ) (C : M2 ℤ) (T : M2 ℚ) (R : IVec) :
    fourierUnfoldingKernel N m (fun _ => 0) Q s C T R=0 := by sorry

example : Complex.sqrt (-baseMatrix.det)=1 := by sorry

example (Z : M2 ℂ) : quad Z ![0,1]/(4*(16 : ℂ)) - (1/(8 : ℂ))*((!![0,0;0,(1/8 : ℂ)]*Z).trace)=0 := by sorry

/-- First Cusp Setoid in the specified native carrier. -/
def firstCuspSetoid (N : ℕ) : Setoid {C : M2 ℤ // C.det≠0 ∧ (N : ℤ)∣C 0 1} := by sorry
/-- First Cusp Classes in the specified native carrier. -/
abbrev FirstCuspClasses (N : ℕ) := Quotient (firstCuspSetoid N)
/-- First Cusp Representative in the specified native carrier. -/
def firstCuspRepresentative (N : ℕ) (c : FirstCuspClasses N) : M2 ℤ := by sorry

/-- Zero Cusp Setoid in the specified native carrier. -/
def zeroCuspSetoid (N : ℕ) : Setoid {C : M2 ℤ // C.det≠0 ∧ ∀ i j, (N : ℤ)∣C i j} := by sorry
/-- Zero Cusp Classes in the specified native carrier. -/
abbrev ZeroCuspClasses (N : ℕ) := Quotient (zeroCuspSetoid N)
/-- Zero Cusp Representative in the specified native carrier. -/
def zeroCuspRepresentative (N : ℕ) (c : ZeroCuspClasses N) : M2 ℤ := by sorry

/-- Rank One Coefficient in the specified native carrier. -/
def rankOneCoefficient (N m : ℕ) (I : M4 ℝ → ℂ) (s : ℂ) (g : M4 ℝ) (T : QuadraticForm ℤ IVec) (R : IVec) : ℂ := by sorry
/-- Rank Zero Coefficient in the specified native carrier. -/
def rankZeroCoefficient (N m : ℕ) (I : M4 ℝ → ℂ) (s : ℂ) (g : M4 ℝ) (T : QuadraticForm ℤ IVec) (R : IVec) : ℂ := by sorry

/-- Whittaker Coefficient Extraction in the specified native carrier. -/
def whittakerCoefficientExtraction (j : Fin 2) (N : ℕ) (m : ℤ)
    (C : M4 ℝ → M2 ℚ → IVec → ℂ) (D r : ℤ) (q : ℕ) (y1 y2 : ℝ) : ℂ := by sorry
/-- Whittaker Coefficient Extraction linear, with the hypotheses and domain displayed below. -/
theorem whittakerCoefficientExtraction_linear (j : Fin 2) (N : ℕ) (m : ℤ)
    (C : M4 ℝ → M2 ℚ → IVec → ℂ) (D r : ℤ) (q : ℕ) (y1 y2 : ℝ) (c : ℂ) :
    whittakerCoefficientExtraction j N m (c • C) D r q y1 y2=c*whittakerCoefficientExtraction j N m C D r q y1 y2 := by sorry

/-- Period Coefficient in the specified native carrier. -/
def periodCoefficient (N : ℕ) (q : ℤ) (f : ℝ → ℂ) (a : ℝ) : ℂ :=
  (1/(N : ℂ))*∫ x in Set.Icc a (a+N), f x*expTwoPi (-(q : ℂ)*x/N)
/-- Whittaker Coefficient Extraction period, with the hypotheses and domain displayed below. -/
theorem whittakerCoefficientExtraction_period (N : ℕ) (hN : 0 < N) (q : ℤ) (f : ℝ → ℂ)
    (hf : Continuous f) (hp : ∀ x, f (x+N)=f x) (a : ℝ) : periodCoefficient N q f a=periodCoefficient N q f 0 := by sorry

/-- Whittaker Coefficient Extraction parity, with the hypotheses and domain displayed below. -/
theorem whittakerCoefficientExtraction_parity (N : ℕ) (m : ℤ)
    (C : M4 ℝ → M2 ℚ → IVec → ℂ) (D r : ℤ) (q : ℕ) (y1 y2 : ℝ) (h : ¬4*m∣D) :
    whittakerCoefficientExtraction 0 N m C D r q y1 y2=0 := by sorry

example (j : Fin 2) (N : ℕ) (m D r : ℤ) (q : ℕ) (y1 y2 : ℝ) :
    whittakerCoefficientExtraction j N m (fun _ _ _ => 0) D r q y1 y2=0 := by sorry

example (N : ℕ) (hN : 0 < N) (q : ℤ) (c : ℂ) : periodCoefficient N q (fun x => expTwoPi ((q : ℂ)*x/N)*c) 0=c := by sorry

example (N : ℕ) (hN : 0 < N) (q r : ℤ) (h : q≠r) (c : ℂ) :
    periodCoefficient N r (fun x => expTwoPi ((q : ℂ)*x/N)*c) 0=0 := by sorry

/-- Bfh LTerm in the specified native carrier. -/
def bfhLTerm (N k : ℕ) (m r n1 : ℤ) (q : ℕ) (a : ℕ → ℂ) (s : ℂ) (alpha beta delta : ℕ) : ℂ :=
  if 0<alpha ∧ 0<delta ∧ beta<N*delta ∧ N∣beta ∧ alpha∣q*delta then
    finiteExponentialSums 1 N m (!![(alpha : ℤ),(beta : ℤ);0,(delta : ℤ)])
      (n1 • QuadraticMap.proj 1 1) ![0,r] * ((alpha*delta : ℕ) : ℂ)^(-s) *
      ((alpha : ℂ)/delta)^((k : ℂ)/2) * a (q*delta/alpha) * expTwoPi ((q : ℂ)*beta/(N*alpha))
  else 0
/-- Bfh LDirichlet Series in the specified native carrier. -/
def bfhLDirichletSeries (N k : ℕ) (m r n1 : ℤ) (q : ℕ) (a : ℕ → ℂ) (s : ℂ) : ℂ :=
  ∑' t : ℕ × ℕ × ℕ, bfhLTerm N k m r n1 q a s t.1 t.2.1 t.2.2
/-- Bfh LDirichlet Series scalar, with the hypotheses and domain displayed below. -/
theorem bfhLDirichletSeries_scalar (N k : ℕ) (m r n1 : ℤ) (q : ℕ) (a : ℕ → ℂ) (s c : ℂ) :
    bfhLDirichletSeries N k m r n1 q (c • a) s=c*bfhLDirichletSeries N k m r n1 q a s := by sorry
/-- Bfh LDirichlet Series identity term, with the hypotheses and domain displayed below. -/
theorem bfhLDirichletSeries_identity_term (N k : ℕ) (hN : 0 < N) (m r n1 : ℤ) (q : ℕ) (a : ℕ → ℂ) (s : ℂ) :
    bfhLTerm N k m r n1 q a s 1 0 1=a q := by sorry
/-- Bfh LDirichlet Series specialize, with the hypotheses and domain displayed below. -/
theorem bfhLDirichletSeries_specialize (N k : ℕ) (m r n1 : ℤ) (a : ℕ → ℂ) (s : ℂ) :
    bfhLDirichletSeries N k m r n1 1 a s=∑' t : ℕ × ℕ × ℕ, bfhLTerm N k m r n1 1 a s t.1 t.2.1 t.2.2 := by sorry

example (N k : ℕ) (m r n1 : ℤ) (q : ℕ) (s : ℂ) : bfhLDirichletSeries N k m r n1 q (fun _ => 0) s=0 := by sorry

example (N k : ℕ) (hN : 0 < N) (m r n1 : ℤ) (a : ℕ → ℂ) (ha : a 1=1) (s : ℂ) : bfhLTerm N k m r n1 1 a s 1 0 1=1 := by sorry

example (N k : ℕ) (m r n1 : ℤ) (a : ℕ → ℂ) (s : ℂ) : bfhLTerm N k m r n1 1 a s 2 0 1=0 := by sorry

/-- Bfh PDirichlet Series in the specified native carrier. -/
def bfhPDirichletSeries (N k : ℕ) (m D r : ℤ) (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s : ℂ) : ℂ := by sorry
/-- Bfh PDirichlet Series scalar, with the hypotheses and domain displayed below. -/
theorem bfhPDirichletSeries_scalar (N k : ℕ) (m D r : ℤ) (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s c : ℂ) :
    bfhPDirichletSeries N k m D r q (c • aCusp) s=c*bfhPDirichletSeries N k m D r q aCusp s := by sorry
/-- Bfh PDirichlet Series residue, with the hypotheses and domain displayed below. -/
theorem bfhPDirichletSeries_residue (N k : ℕ) (hN : 0 < N) (m D r : ℤ) (hm : (N : ℤ)∣m)
    (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s : ℂ) :
    bfhPDirichletSeries N k m D (r+2*m/N) q aCusp s=bfhPDirichletSeries N k m D r q aCusp s := by sorry
/-- Bfh PDirichlet Series parity, with the hypotheses and domain displayed below. -/
theorem bfhPDirichletSeries_parity (N k : ℕ) (m D r : ℤ) (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s : ℂ)
    (h : ¬4*m∣D) : bfhPDirichletSeries N k m D r q aCusp s=0 := by sorry

example (N k : ℕ) (m D r : ℤ) (q : ℕ) (s : ℂ) : bfhPDirichletSeries N k m D r q (fun _ _ => 0) s=0 := by sorry

example (k : ℕ) (D r : ℤ) (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s : ℂ) :
    bfhPDirichletSeries 8 k 16 D (r+4) q aCusp s=bfhPDirichletSeries 8 k 16 D r q aCusp s := by sorry

example (k : ℕ) (r : ℤ) (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s : ℂ) :
    bfhPDirichletSeries 8 k 16 1 r q aCusp s=0 := by sorry

/-- Local Prime Root Counts in the specified native carrier. -/
def localPrimeRootCounts (p a _b d : ℕ) (m r n0 : ℤ) : ℕ :=
  Nat.card {v : Fin (p^a) × Fin (p^d) //
    Int.ModEq (p^a) (m*(v.1.val : ℤ)^2) 0 ∧
    Int.ModEq (p^(min a d)) (2*m*v.1.val*v.2.val-r*v.1.val) 0 ∧
    Int.ModEq (p^d) (m*(v.2.val : ℤ)^2-r*v.2.val+n0) 0}
/-- Third Prime Root Counts in the specified native carrier. -/
def thirdPrimeRootCounts (p a b d : ℕ) (m r n0 : ℤ) : ℕ :=
  Nat.card {v : Fin (p^b) × Fin (p^(a+d-b)) //
    Int.ModEq (p^b) (m*(v.1.val : ℤ)^2+r*v.1.val+n0) 0 ∧
    Int.ModEq (p^b) (2*m*v.1.val*v.2.val+r*v.2.val-r*(p : ℤ)^(a-b)*v.1.val-2*(p : ℤ)^(a-b)*n0) 0 ∧
    Int.ModEq (p^(a+d-b)) (m*(v.2.val : ℤ)^2-r*(p : ℤ)^(a-b)*v.2.val+(p : ℤ)^(2*(a-b))*n0) 0}
/-- Local Prime Root Counts zero exponents, with the hypotheses and domain displayed below. -/
theorem localPrimeRootCounts_zero_exponents (p b : ℕ) (m r n0 : ℤ) : localPrimeRootCounts p 0 b 0 m r n0=1 := by sorry
/-- Local Prime Root Counts finite, with the hypotheses and domain displayed below. -/
theorem localPrimeRootCounts_finite (p a b d : ℕ) (m r n0 : ℤ) : localPrimeRootCounts p a b d m r n0≤p^a*p^d := by sorry
/-- Local Prime Root Counts quadratic, with the hypotheses and domain displayed below. -/
theorem localPrimeRootCounts_quadratic (p b d : ℕ) (m r n0 : ℤ) :
    localPrimeRootCounts p 0 b d m r n0=Nat.card {v : Fin (p^d) // Int.ModEq (p^d) (m*(v.val : ℤ)^2-r*v.val+n0) 0} := by sorry

example : localPrimeRootCounts 3 0 0 0 1 0 0=1 := by sorry

example : localPrimeRootCounts 3 0 0 1 1 0 (-1)=2 := by sorry

example : localPrimeRootCounts 3 0 0 1 1 0 1=0 := by sorry

example : localPrimeRootCounts 3 2 2 1 16 1 0=6 := by sorry

/-- Local root count table, with the hypotheses and domain displayed below. -/
theorem local_root_count_table (p d : ℕ) (hp : p.Prime) (hp2 : p≠2) (hd : 0<d)
    (m r n0 : ℤ) (hm : ¬(p : ℤ)∣m)
    (hD : ¬(p : ℤ)∣(r^2-4*m*n0)) :
    localPrimeRootCounts p 0 0 d m r n0=
      if ∃ x : Fin p, Int.ModEq p ((x.val : ℤ)^2) (r^2-4*m*n0) then 2 else 0 := by sorry

/-- Inverted Local Sum in the specified native carrier. -/
def invertedLocalSum (p a b d : ℕ) (S : ℕ → ℕ → ℕ → ℂ) : ℂ := by sorry
/-- Local mobius factors, with the hypotheses and domain displayed below. -/
theorem local_mobius_factors (p a b d : ℕ) (hp : p.Prime) (hd : 0<d) (S : ℕ → ℕ → ℕ → ℂ) :
    invertedLocalSum p a b d S=
      if a=0 ∨ b=0 then S a b d-(p : ℂ)*S a b (d-1)
      else S a b d-(p : ℂ)^2*S (a-1) (b-1) d-(p : ℂ)*S a b (d-1)+
        (p : ℂ)^3*S (a-1) (b-1) (d-1) := by sorry

/-- Formal local series from supplied coefficients and exponential factors; source Euler identities require their arithmetic construction. -/
def unramifiedLocalSeries (p k : ℕ) (a : ℕ → ℂ) (Sp : ℕ → ℕ → ℕ → ℂ) (s : ℂ) : ℂ :=
  1 + ∑' d : ℕ, if 0<d then ∑ aa∈Finset.range (d+1),
    (p : ℂ)^(d-aa)*(Sp aa aa d-(if aa=0 then 0 else Sp aa (aa-1) d))*
      (p : ℂ)^(-((aa+d : ℕ) : ℂ)*s-((d-aa : ℕ) : ℂ)*k/2)*a (d-aa) else 0

/-- Independent zero exponential factors force the totalized local series to one. -/
example (p k : ℕ) (a : ℕ → ℂ) (s : ℂ) :
    unramifiedLocalSeries p k a (fun _ _ _ => 0) s = 1 := by sorry

/-- The proposed fundamental-discriminant rational factor is not one at p=3,k=2,s=3. -/
example :
    ((1-(3:ℚ)^2*(3:ℚ)^(-4:ℤ)) * (1-(3:ℚ)^(-4:ℤ)) * (1-(3:ℚ)^(-3:ℤ))) /
      ((1-3*(3:ℚ)^(-2:ℤ)) * (1-(3:ℚ)^(-2:ℤ))) = 1040/729 := by norm_num

/-- An independent coefficient b(s,1)=s has no uniform bound on s≥2. -/
example : ¬ ∃ C : ℝ, 0 ≤ C ∧ ∀ s : ℝ, 2 ≤ s → ‖(s : ℂ)‖ ≤ C := by sorry

/-- Two order-two matrices fail covariance for the trivial semidirect action. -/
example :
    (((!![1,0;0,-1] * !![0,1;1,0] : Matrix (Fin 2) (Fin 2) ℚ)) 0 1,
     ((!![0,1;1,0] * !![1,0;0,-1] : Matrix (Fin 2) (Fin 2) ℚ)) 0 1) = (1,-1) := by
  norm_num [Matrix.mul_apply, Fin.sum_univ_two]

/-- Scaling after exchange differs from exchange after scaling, fixing action order. -/
example :
    ((!![2,0;0,1] : Matrix (Fin 2) (Fin 2) ℚ) *ᵥ
        ((!![0,1;1,0] : Matrix (Fin 2) (Fin 2) ℚ) *ᵥ ![1,1]),
     (!![0,1;1,0] : Matrix (Fin 2) (Fin 2) ℚ) *ᵥ
        ((!![2,0;0,1] : Matrix (Fin 2) (Fin 2) ℚ) *ᵥ ![1,1])) =
      (![2,1], ![1,2]) := by
  ext i <;> fin_cases i <;> norm_num [Matrix.mulVec, dotProduct, Fin.sum_univ_two]

/-- Theta normal convergence, with the hypotheses and domain displayed below. -/
theorem theta_normal_convergence (a : ℕ) (ha : 0<a) (nu : IVec)
    (S : Set (SiegelSpace × CVec)) (hS : IsCompact S) :
    ∃ B : IVec → ℝ, Summable B ∧ ∀ p∈S, ∀ R : IVec,
      (∀ i, Int.ModEq (2*(a : ℤ)) (R i) (nu i)) →
        ‖expTwoPi (quad p.1.val (ivCast R)/(4*a) + ivCast R ⬝ᵥ p.2)‖≤B R := by sorry

/-- Genuine Theta Lift in the specified native carrier. -/
def genuineThetaLift (E : M4 ℝ → ℂ) (g : similitudeCover) : ℂ := g.root siegelSpace_base*E g.base.val.1

/-- Genuine Theta Lift central, with the hypotheses and domain displayed below. -/
theorem genuineThetaLift_central (E : M4 ℝ → ℂ) (g z : similitudeCover)
    (hz : z.base=1) (hr : ∀ q, z.root q=-1) :
    genuineThetaLift E (g*z)=-genuineThetaLift E g := by sorry

/-- Cover Unipotent in the specified native carrier. -/
def coverUnipotent (x : Fin 3 → ℝ) : similitudeCover := by sorry
/-- Cover Fourier in the specified native carrier. -/
def coverFourier : similitudeCover := by sorry

/-- Real root-group integral with the chosen cover lifts; induced-space covariance is a separate target. -/
def genuineIntertwiner (_s : ℂ) (F : similitudeCover → ℂ) (g : similitudeCover) : ℂ :=
  ∫ x : Fin 3 → ℝ, F (coverFourier⁻¹*coverUnipotent x*g)

/-- Genuine Intertwiner equivariant, with the hypotheses and domain displayed below. -/
theorem genuineIntertwiner_equivariant (s : ℂ) (F : similitudeCover → ℂ) (g h : similitudeCover) :
    genuineIntertwiner s (fun q => F (q*h)) g=genuineIntertwiner s F (g*h) := by sorry
/-- Genuine Intertwiner integral, with the hypotheses and domain displayed below. -/
theorem genuineIntertwiner_integral (s : ℂ) (F : similitudeCover → ℂ) (g : similitudeCover) :
    genuineIntertwiner s F g=∫ x : Fin 3 → ℝ, F (coverFourier⁻¹*coverUnipotent x*g) := by sorry

example (s : ℂ) : genuineIntertwiner s (fun _ => 0)=0 := by sorry

example (s : ℂ) (F : similitudeCover → ℂ) (z : similitudeCover) (hz : ∀ g, F (g*z)=-F g) :
    ∀ g, genuineIntertwiner s F (g*z)=-genuineIntertwiner s F g := by sorry

example (s : ℂ) : 4-(4-s)=s := by sorry

/-- Integral over the real unit unipotent box; no independent inducing section is identified with this function. -/
def genuineConstantTerm (E : similitudeCover → ℂ) (g : similitudeCover) : ℂ :=
  ∫ x in Set.pi Set.univ (fun _ : Fin 3 => Set.Icc (0 : ℝ) 1), E (coverUnipotent x*g)

/-- The zero function has zero real-box constant term. -/
example (g : similitudeCover) : genuineConstantTerm (fun _ => 0) g = 0 := by sorry

/-- Lebesgue integration totalizes a nonintegrable constant to zero. -/
example (s : ℂ) (g : similitudeCover) : genuineIntertwiner s (fun _ => 1) g = 0 := by sorry

/-- Independent E=0 and F=1 cannot satisfy the source constant-term identity. -/
example : (0 : ℂ) ≠ 1 + 0 := by norm_num

/-- Fourier residue interchanges, with the hypotheses and domain displayed below. -/
theorem fourier_residue_interchanges (f : ℂ → (Fin 3 → ℝ) → ℂ) (U : Set ℂ) (hU : IsOpen U)
    (hf : ∀ x, DifferentiableOn ℂ (fun s => f s x) U)
    (hm : ∀ s, AEStronglyMeasurable (f s))
    (hdom : ∀ s∈U, ∃ Vv : Set ℂ, IsOpen Vv ∧ s∈Vv ∧ Vv⊆U ∧
      ∃ B : (Fin 3 → ℝ) → ℝ, Integrable B ∧ ∀ t∈Vv, ∀ x, ‖f t x‖≤B x) :
    DifferentiableOn ℂ (fun s => ∫ x, f s x) U := by sorry

/-- Two Variable Twist Series in the specified native carrier. -/
def twoVariableTwistSeries (eps : ℤ) (N : ℕ) (m r : ℤ) (L : ℂ → ℤ → ℂ) (u s : ℂ) : ℂ :=
  ∑' D : ℤ, if 0<eps*D ∧ Int.ModEq (4*m/N) D (r^2) then
    L s D*(D.natAbs : ℂ)^(s-u-5/2) else 0
/-- Two Variable Twist Series scalar, with the hypotheses and domain displayed below. -/
theorem twoVariableTwistSeries_scalar (eps : ℤ) (N : ℕ) (m r : ℤ) (L : ℂ → ℤ → ℂ) (u s c : ℂ) :
    twoVariableTwistSeries eps N m r (c • L) u s=c*twoVariableTwistSeries eps N m r L u s := by sorry
/-- Two Variable Twist Series congruence, with the hypotheses and domain displayed below. -/
theorem twoVariableTwistSeries_congruence (eps : ℤ) (N : ℕ) (m r : ℤ) (L : ℂ → ℤ → ℂ) (u s : ℂ) :
    twoVariableTwistSeries eps N m r L u s=
      ∑' D : ℤ, if 0<eps*D ∧ Int.ModEq (4*m/N) D (r^2) then L s D*(D.natAbs : ℂ)^(s-u-5/2) else 0 := by sorry
/-- Two Variable Twist Series sign, with the hypotheses and domain displayed below. -/
theorem twoVariableTwistSeries_sign (D : ℤ) : ¬(0<D ∧ 0< -D) ∧ ¬0<(1 : ℤ)*0 := by sorry

example (eps : ℤ) (N : ℕ) (m r : ℤ) (u s : ℂ) : twoVariableTwistSeries eps N m r (fun _ _ => 0) u s=0 := by sorry

example (u s : ℂ) : twoVariableTwistSeries 1 8 16 1 (fun _ D => if D=1 then 1 else 0) u s=1 := by sorry

example : ¬Int.ModEq 8 (2 : ℤ) (1^2) ∧ ¬Int.ModEq 8 (-1 : ℤ) (1^2) ∧ ¬Int.ModEq 8 (0 : ℤ) (1^2) := by sorry

/-- Bfh Polar Term in the specified native carrier. -/
def bfhPolarTerm (N k : ℕ) (_r : ℤ) (L0 P0 : ℂ → ℂ)
    (M Mt tau : ℂ → ℝ → ℂ) (y2 : ℝ) (u s : ℂ) : ℂ :=
  -(N : ℂ)^(-s+4+(k : ℂ)/2)*L0 s*M s ((N : ℝ)⁻¹*y2)/(u-s+5/2) +
  (N : ℂ)^(7-s-(k : ℂ)/2)*P0 s*(y2 : ℂ)^(2*s-5)*Mt s ((N : ℝ)⁻¹*y2)/(u+s-5/2) +
  (N : ℂ)^(-s)*(y2 : ℂ)^(3-s+(k : ℂ)/2)*tau s ((N : ℝ)⁻¹*y2)/(u-s+3/2)

/-- Bsd2 export, with the hypotheses and domain displayed below. -/
theorem bsd2_export (s : ℂ) : (s-1/2)-3/2=s-2 ∧ -(s-2)+2=4-s := by sorry

end
end GenusTwo

/-!
The full normalized cover and its genuine oscillator, smooth local theta lifts,
rational adelic splitting and representation, regularized Siegel–Weil families,
toric Shimizu comparison and classical spectral/Hecke comparisons use supplier
carriers not represented by the algebraic fragments here. The arithmetic
BFH unfolding, newform Whittaker identities, Euler factors, polynomial growth,
genuine Eisenstein continuation, normalized intertwiner composition and
two-variable polar subtraction require the actual induced arithmetic families.

The following full object signatures require these carriers:
Layer 0: heisenberg_continuous_action.
Layer 1: raoFactorSet, metaplecticCover, weilRepresentation.
Layer 2: weilIndex, lerayForm.
Layer 3: unitaryWeilRepresentation, bigTheta, smallTheta,
quaternionSimilitudeEmbedding, quaternionSplitting.
Layer 4: adelicMetaplectic, rationalMetaplecticSplitting, adelicWeil, finiteWeil.
Layer 5: genuineAutomorphic.
Layer 6: doublingSchwartz, jacobiGroup.
Layer 7: halfWeightMaass, halfWeightResolvent.
-/

end TauCetiRoadmap.MetaplecticAutomorphicForms
