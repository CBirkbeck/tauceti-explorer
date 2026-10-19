/-
Independent fix review REV-FIX-RT-AREA-ktheory-1~2, Codex codex-WBAmLh, 2026-10-19.
This companion states a small selection of targets over pinned library carriers.
The full roadmap, API obligations, source locators and worked checks remain in
`research/blueprint/readmes/K3BlochGroups.md` and its packet. Unsupported carriers and
constructions are reader targets; none is replaced here by admitted data.
Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.
Theorem proofs marked `sorry` are proposed work, not a formalization.
-/

import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.TensorProduct.Map

open scoped TensorProduct

namespace TauCeti.Blueprint.K3BlochV6

variable {P W : Type*} [AddCommGroup P] [AddCommGroup W]

/-- V.6/integral-root-multiple. For fields h is supplied by
V.6/root-of-unity-symbol, using IsPrimitiveRoot ζ m, m≥2 and x=[ζ]. -/
def rootMultiple (δ : P →+ W) (x : P) (m : ℕ) (h : δ (m • x) = 0) : δ.ker :=
  ⟨m • x, h⟩

-- rootMultiple_mod_two
example (h : (Int.castAddHom (ZMod 2)) (2 • (1 : ℤ)) = 0) :
    (rootMultiple (Int.castAddHom (ZMod 2)) 1 2 h : ℤ) = 2 := by
  sorry

-- rootMultiple_zero_multiplier
example (δ : P →+ W) (x : P) (h : δ (0 • x) = 0) :
    rootMultiple δ x 0 h = 0 := by
  sorry

-- rootMultiple_kernel_compat
example (δ : P →+ W) (b : δ.ker) (h : δ (3 • (b : P)) = 0) :
    rootMultiple δ b 3 h = 3 • b := by
  sorry

-- rootMultiple_raw_rejected
example : (1 : ℤ) ∉ (Int.castAddHom (ZMod 2)).ker ∧
    (2 : ℤ) ∈ (Int.castAddHom (ZMod 2)).ker := by
  sorry

variable {R : Type*} [CommRing R]

/-- V.6/root-coefficient-class. hu is retained to forbid division by a
noninvertible root order. No flatness is assumed. -/
def rootCoefficient (δ : P →+ W) (x : P) (m : ℕ) (h : δ (m • x) = 0)
    (u : Rˣ) (_hu : (u : R) = (m : R)) : δ.ker ⊗[ℤ] R :=
  rootMultiple δ x m h ⊗ₜ[ℤ] ((u⁻¹ : Rˣ) : R)

lemma rootCoefficient_toPre (δ : P →+ W) (x : P) (m : ℕ) (h : δ (m • x) = 0)
    (u : Rˣ) (hu : (u : R) = (m : R)) :
    TensorProduct.map δ.ker.subtype.toIntLinearMap (LinearMap.id : R →ₗ[ℤ] R)
      (rootCoefficient δ x m h u hu) = x ⊗ₜ[ℤ] (1 : R) := by
  sorry

lemma rootCoefficient_denominator_independent (δ : P →+ W) (x : P) (m l : ℕ)
    (h : δ (m • x) = 0) (h' : δ (l • x) = 0)
    (u v : Rˣ) (hu : (u : R) = (m : R)) (hv : (v : R) = (l : R)) :
    rootCoefficient δ x m h u hu = rootCoefficient δ x l h' v hv := by
  sorry

-- rootCoefficient_mod_five
example (h : (Int.castAddHom (ZMod 2)) (2 • (1 : ℤ)) = 0)
    (u : (ZMod 5)ˣ) (hu : (u : ZMod 5) = 2) :
    rootCoefficient (Int.castAddHom (ZMod 2)) 1 2 h u hu =
      rootMultiple (Int.castAddHom (ZMod 2)) 1 2 h ⊗ₜ[ℤ] (3 : ZMod 5) ∧
    TensorProduct.map (Int.castAddHom (ZMod 2)).ker.subtype.toIntLinearMap
      (LinearMap.id : ZMod 5 →ₗ[ℤ] ZMod 5)
      (rootCoefficient (Int.castAddHom (ZMod 2)) 1 2 h u hu) =
        (1 : ℤ) ⊗ₜ[ℤ] (1 : ZMod 5) := by
  sorry

-- rootCoefficient_zero_test
example (δ : P →+ W) (m : ℕ) (h : δ (m • (0 : P)) = 0)
    (u : Rˣ) (hu : (u : R) = (m : R)) : rootCoefficient δ 0 m h u hu = 0 := by
  sorry

-- rootCoefficient_two_denominators
example (h : (Int.castAddHom (ZMod 2)) (2 • (1 : ℤ)) = 0)
    (h' : (Int.castAddHom (ZMod 2)) (4 • (1 : ℤ)) = 0)
    (u v : (ZMod 5)ˣ) (hu : (u : ZMod 5) = 2) (hv : (v : ZMod 5) = 4) :
    rootCoefficient (Int.castAddHom (ZMod 2)) 1 2 h u hu =
      rootCoefficient (Int.castAddHom (ZMod 2)) 1 4 h' v hv := by
  sorry

-- rootCoefficient_nonflat
example : (∃ t : (Int.castAddHom (ZMod 2)).ker ⊗[ℤ] ZMod 2,
    t ≠ 0 ∧ TensorProduct.map (Int.castAddHom (ZMod 2)).ker.subtype.toIntLinearMap
      (LinearMap.id : ZMod 2 →ₗ[ℤ] ZMod 2) t = 0) ∧
    ¬ IsUnit (2 : ZMod 2) := by
  sorry

-- The field pre-Bloch group, its boundary and Suslin comparison are reader
-- targets. These generic kernel/tensor statements do not identify arbitrary
-- additive groups with those missing field objects.
end TauCeti.Blueprint.K3BlochV6
