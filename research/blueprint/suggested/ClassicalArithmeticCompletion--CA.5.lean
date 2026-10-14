/-
This file is not the roadmap and is not exhaustive. The accompanying roadmap document
is definitive. These statements suggest Lean forms so that contributors and reviewers
can converge on names and signatures. Proofs are admitted; this is planning, not implementation.
-/

import Mathlib.NumberTheory.NumberField.Discriminant.Defs
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.Units.Regulator
import Mathlib.LinearAlgebra.FreeModule.Finite.CardQuotient
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.GroupTheory.Torsion
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic
import TauCeti.NumberTheory.NumberField.Quadratic.Conjugation.NarrowClassGroup
import TauCeti.NumberTheory.NumberField.NarrowClassGroup.Finite
import TauCeti.NumberTheory.NumberField.Units.Dirichlet

set_option autoImplicit false

open NumberField Polynomial Module
open scoped NumberField

namespace TauCeti.ClassicalArithmetic.CA5

/- New target: quadratic-unit-action-model. The additive carrier already exists. -/
def quadraticUnitAction (s : ZMod 2) (x : ℤ × ZMod 2) : ℤ × ZMod 2 :=
  (-x.1, x.2 + s * (x.1 : ZMod 2))

theorem quadraticUnitAction_add (s : ZMod 2) (x y : ℤ × ZMod 2) :
    quadraticUnitAction s (x + y) = quadraticUnitAction s x + quadraticUnitAction s y := by
  sorry

theorem quadraticUnitAction_involutive (s : ZMod 2) :
    Function.Involutive (quadraticUnitAction s) := by
  sorry

theorem quadraticUnitAction_free_generator (s : ZMod 2) :
    quadraticUnitAction s (1, 0) = (-1, s) := by
  sorry

theorem quadraticUnitAction_torsion_generator (s : ZMod 2) :
    quadraticUnitAction s (0, 1) = (0, 1) := by
  sorry

theorem quadraticUnitAction_parameter (s t : ZMod 2) :
    quadraticUnitAction s = quadraticUnitAction t ↔ s = t := by
  sorry

theorem quadraticUnitAction_norm (s : ZMod 2) (x : ℤ × ZMod 2) :
    x + quadraticUnitAction s x = (0, s * (x.1 : ZMod 2)) := by
  sorry

-- quadraticUnitAction_normMinusOne
example : quadraticUnitAction 1 (1, 0) = (-1, 1) := by sorry
-- quadraticUnitAction_normPlusOne
example : quadraticUnitAction 0 (1, 0) = (-1, 0) := by sorry
-- quadraticUnitAction_torsion
example : quadraticUnitAction 1 (0, 1) = (0, 1) := by sorry
-- quadraticUnitAction_evenExponent
example : quadraticUnitAction 1 (2, 1) = (-2, 1) := by sorry

/- New target: detection on the canonical two-primary subgroups. No finiteness needed. -/
theorem bijective_iff_bijOn_twoPrimary
    {G H : Type*} [CommGroup G] [CommGroup H] (q : G →* H)
    (hq : Function.Surjective q) (hker : ∀ x ∈ q.ker, x ^ 2 = 1) :
    Function.Bijective q ↔
      Set.BijOn q (CommGroup.primaryComponent G 2) (CommGroup.primaryComponent H 2) := by
  sorry

section Quadratic

variable {K : Type*} [Field K] [NumberField K]
variable {d : ℤ} {θ : 𝓞 K}

/- New target: one interface joining the two parent order-to-unit comparisons. -/
theorem negativePell_iff_norm_neg_one
    (hd : 1 < d) (hsq : Squarefree d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    (∃ x y : ℤ, x ^ 2 - d * y ^ 2 = -1) ↔
      ∃ u : (𝓞 K)ˣ, Algebra.norm ℚ ((u : 𝓞 K) : K) = -1 := by
  sorry

/- New target: the narrow principal class of the chosen square root. The pinned
`exists_unit_isTotallyPositive_smul_of_norm_eq_neg_one` and
`norm_eq_neg_one_of_isTotallyPositive_smul_gen` are its two unit-level halves. -/
theorem negativePell_iff_narrowPrincipal
    (hd : 1 < d) (hsq : Squarefree d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    (∃ x y : ℤ, x ^ 2 - d * y ^ 2 = -1) ↔
      NarrowClassGroup.mkPrincipal (Units.mk0 (θ : K) (coe_gen_ne_zero hmin)) = 1 := by
  sorry

/- New target: the natural restriction, rather than an abstract group isomorphism. -/
theorem negativePell_iff_twoPrimary
    (hd : 1 < d) (hsq : Squarefree d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    (∃ x y : ℤ, x ^ 2 - d * y ^ 2 = -1) ↔
      Set.BijOn (NarrowClassGroup.toClassGroup (K := K))
        (CommGroup.primaryComponent (NarrowClassGroup K) 2)
        (CommGroup.primaryComponent (ClassGroup (𝓞 K)) 2) := by
  sorry

/- New target: Galois action in Dirichlet coordinates, including both norm types. -/
theorem quadratic_units_action_normal_form
    (hd : 1 < d) (hsq : Squarefree d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    ∃ (s : ZMod 2) (F : Additive ((𝓞 K)ˣ) ≃+ (ℤ × ZMod 2)),
      F (Additive.ofMul (-1 : (𝓞 K)ˣ)) = (0, 1) ∧
      (∀ u : (𝓞 K)ˣ,
        F (Additive.ofMul (Units.map
          (ringOfIntegersQuadraticConj hmin hgen).toMonoidHom u)) =
        quadraticUnitAction s (F (Additive.ofMul u))) ∧
      (s = 1 ↔ ∃ x y : ℤ, x ^ 2 - d * y ^ 2 = -1) := by
  sorry

theorem negativePell_iff_quadraticUnitAction_one
    (hd : 1 < d) (hsq : Squarefree d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    (∃ x y : ℤ, x ^ 2 - d * y ^ 2 = -1) ↔
    ∃ F : Additive ((𝓞 K)ˣ) ≃+ (ℤ × ZMod 2),
      F (Additive.ofMul (-1 : (𝓞 K)ˣ)) = (0, 1) ∧
      ∀ u : (𝓞 K)ˣ,
        F (Additive.ofMul (Units.map
          (ringOfIntegersQuadraticConj hmin hgen).toMonoidHom u)) =
        quadraticUnitAction 1 (F (Additive.ofMul u)) := by
  sorry

end Quadratic

/- New target: entrywise determinant enclosure. The exponent uses natural subtraction;
the dimension-zero coefficient is zero and the two empty determinants are one. -/
theorem determinant_entrywise_error {r : ℕ} (E Ê : Matrix (Fin r) (Fin r) ℝ)
    (B δ : ℝ) (hB : 0 ≤ B) (hδ : 0 ≤ δ)
    (hsize : ∀ i j, |E i j| ≤ B) (herr : ∀ i j, |Ê i j - E i j| ≤ δ) :
    |Ê.det - E.det| ≤ (r.factorial : ℝ) * r * δ * (B + δ) ^ (r - 1) := by
  sorry

example (E Ê : Matrix (Fin 0) (Fin 0) ℝ) : |Ê.det - E.det| = 0 := by sorry
example (E Ê : Matrix (Fin 1) (Fin 1) ℝ) (δ : ℝ)
    (h : |Ê 0 0 - E 0 0| ≤ δ) : |Ê.det - E.det| ≤ δ := by sorry
-- The Hadamard check: B = 1, δ = 1/2, difference 65 ≤ 162, while the printed bound of
-- Biasse–Fieker Lemma 4.4 would be 64 (ClassicalArithmeticCompletion/E1501).
example :
    let E : Matrix (Fin 4) (Fin 4) ℝ :=
      !![1, 1, 1, 1; 1, -1, 1, -1; 1, 1, -1, -1; 1, -1, -1, 1]
    |((3 / 2 : ℝ) • E).det - E.det| = 65 := by sorry

section Certificates

variable {K : Type*} [Field K] [NumberField K]

/- The following four endpoints refine the interfaces of the EXISTING parent targets.
They do not introduce another basis, ideal, presentation or regulator construction. -/

-- Parent: discriminant-of-a-sublattice-basis; dependent families are also rejected.
theorem integralBasis_iff_discr_eq {n : ℕ} (ω : Basis (Fin n) ℤ (𝓞 K))
    (b : Fin n → 𝓞 K) :
    (∃ β : Basis (Fin n) ℤ (𝓞 K), ∀ i, β i = b i) ↔
      Algebra.discr ℤ b = NumberField.discr K := by
  sorry

theorem integralBasis_of_squarefree_discr {n : ℕ}
    (ω : Basis (Fin n) ℤ (𝓞 K)) (b : Fin n → 𝓞 K)
    (hb : Squarefree (Algebra.discr ℤ b)) :
    ∃ β : Basis (Fin n) ℤ (𝓞 K), ∀ i, β i = b i := by
  sorry

-- Parent: hermite-matrix-of-an-ideal-criterion and ideal-norm-eq-prod-hermite-diagonal.
-- General square matrices are permitted; HNF is only a canonical output convention.
theorem multiplication_witnesses_iff_ideal {n : ℕ}
    (ω : Basis (Fin n) ℤ (𝓞 K)) (H : Matrix (Fin n) (Fin n) ℤ)
    (hH : H.det ≠ 0) :
    let L := (LinearMap.range H.mulVecLin).map ω.equivFun.symm.toLinearMap
    (∀ k, ∃ X : Matrix (Fin n) (Fin n) ℤ,
      Algebra.leftMulMatrix ω (ω k) * H = H * X) ↔
    ∃ I : Ideal (𝓞 K), I ≠ ⊥ ∧ I.restrictScalars ℤ = L ∧
      Ideal.absNorm I = H.det.natAbs := by
  sorry

-- Parent: class-number-divides-relation-determinant and its equality corollary, for any
-- surjection φ; the parent file's `natAbs_det_eq_classNumber_iff` is the case of the
-- presentation map of an ideal family, so a package keeps one of the two forms.
theorem relationDet_eq_classNumber_iff {N : ℕ}
    (φ : (Fin N → ℤ) →+ Additive (ClassGroup (𝓞 K)))
    (hφ : Function.Surjective φ) (A : Matrix (Fin N) (Fin N) ℤ)
    (hA : A.det ≠ 0) (hrel : ∀ j, φ (fun i => A i j) = 0) :
    A.det.natAbs = NumberField.classNumber K ↔
      LinearMap.range A.mulVecLin = φ.ker.toIntSubmodule := by
  sorry

/- New target: a rigorous interval refinement of the parent's joint certificate. -/
theorem relations_units_complete_of_intervals {N : ℕ}
    (φ : (Fin N → ℤ) →+ Additive (ClassGroup (𝓞 K)))
    (hφ : Function.Surjective φ) (A : Matrix (Fin N) (Fin N) ℤ)
    (hA : A.det ≠ 0) (hrel : ∀ j, φ (fun i => A i j) = 0)
    (u : Fin (NumberField.Units.rank K) → (𝓞 K)ˣ)
    (hu : NumberField.Units.IsMaxRank u) (Rhat ε a η : ℝ)
    (hε : 0 ≤ ε) (hη : 0 ≤ η)
    (hRu : |Rhat - NumberField.Units.regOfFamily u| ≤ ε)
    (hprod : |a - (NumberField.classNumber K : ℝ) *
      NumberField.Units.regulator K| ≤ η)
    (hcert : (A.det.natAbs : ℝ) * (Rhat + ε) < 2 * (a - η)) :
    LinearMap.range A.mulVecLin = φ.ker.toIntSubmodule ∧
    (Subgroup.closure (Set.range u) ⊔ NumberField.Units.torsion K = ⊤) ∧
    A.det.natAbs = NumberField.classNumber K ∧
    NumberField.Units.regOfFamily u = NumberField.Units.regulator K := by
  sorry

end Certificates

-- Concrete checks of the order-to-unit bridge and certificate boundary.
example : (2 : ℤ) ^ 2 - 5 * 1 ^ 2 = -1 := by sorry
example : (18 : ℤ) ^ 2 - 13 * 5 ^ 2 = -1 := by sorry
example : (4 : ℤ) ^ 2 - 17 * 1 ^ 2 = -1 := by sorry
example : ¬ ∃ x y : ℤ, x ^ 2 - 3 * y ^ 2 = -1 := by sorry
example : (Matrix.of ![![2, 1], ![0, 2]] : Matrix (Fin 2) (Fin 2) ℤ).det.natAbs = 4 := by
  sorry
example : (Matrix.of ![![2, 0], ![0, 4]] : Matrix (Fin 2) (Fin 2) ℤ).det.natAbs = 8 := by
  sorry
example : ¬ (2 : ℝ) * 1 < 2 * 1 := by sorry

end TauCeti.ClassicalArithmetic.CA5
