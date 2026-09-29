/-
Suggested Lean prototypes for the roadmap "Weights and purity in étale cohomology" (WeightsInEtaleCohomology); this
checkpoints 1–2 plan stages R34.1 and R34.2.

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/WeightsInEtaleCohomology.md` is definitive. The statements below suggest Lean forms so that
contributors and reviewers converge on names and signatures. A planned result whose proof is not short is `sorry`,
and nothing here is claimed to be formalised (implementationStatus = unchecked). Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Only Mathlib is imported.

The weight predicates are DeligneWeightsAndPurity DWP.0's (`IsWeilNumber`, `IsPure`, `iotaWeight`, in that packet's
suggested file). Here they are applied to Frobenius elements of a group acting on a finite-dimensional space. The
absolute Galois group of a number field, its decomposition groups and the continuity of ℓ-adic representations
(ArithmeticGaloisRepresentations R01.1–R01.2) are named in comments only. Names are relative to `TauCeti.Weights` and
agree with the packet's `api` and `tests`.

Suggested signatures on the Galois carrier:

  def GaloisRep.frobCharpoly (ρ : GaloisRep K E V) (v : FinitePlace K) (hv : ρ.IsUnramifiedAt v) : E[X]
  def GaloisRep.IsPureOutside (ρ : GaloisRep K E V) (T : Finset (FinitePlace K)) (w : ℤ) : Prop
  def GaloisRep.HasIntegralFrobOutside (ρ : GaloisRep K E V) (T : Finset (FinitePlace K)) : Prop
  theorem GaloisRep.IsPureOutside.tensor : ρ.IsPureOutside T w → ρ'.IsPureOutside T w' → (ρ ⊗ ρ').IsPureOutside T (w + w')
  theorem GaloisRep.IsPureOutside.induced : ρ.IsPureOutside (T.preimage L) w → (ρ.ind K).IsPureOutside (T ∪ ramified L K) w
-/

import Mathlib.Algebra.Group.Nat.Even
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.RepresentationTheory.Basic

open Polynomial

namespace TauCeti.Weights

/-! ## Frobenius polynomials (`WeightsInEtaleCohomology:R34.1/arithmetic-and-geometric-frobenius`) -/

section Frobenius

variable {E G V : Type*} [Field E] [Group G] [AddCommGroup V] [Module E V] [FiniteDimensional E V]

/-- The characteristic polynomial of a group element acting through `ρ`; for `g = Frob_v^geom` this is `P_v(ρ, T)`. -/
noncomputable def frobCharpoly (ρ : Representation E G V) (g : G) : E[X] := (ρ g).charpoly

/-- Conjugate elements have the same characteristic polynomial: `P_v` does not depend on the choice of Frobenius in its
conjugacy class. -/
theorem frobCharpoly_conj (ρ : Representation E G V) (g h : G) :
    frobCharpoly ρ (h * g * h⁻¹) = frobCharpoly ρ g := by
  sorry

/-- The arithmetic Frobenius is the inverse of the geometric one; its characteristic polynomial has the inverse roots
(`frobCharpoly_roots_inv`). -/
theorem frobCharpoly_inv_roots [IsAlgClosed E] (ρ : Representation E G V) (g : G) :
    (frobCharpoly ρ g⁻¹).roots = (frobCharpoly ρ g).roots.map (·⁻¹) := by
  sorry

end Frobenius

/-! ## The non-examples (`…/frobenius-eigenvalues-need-not-be-algebraic`) -/

/-- The integer core of the non-example `u = 2`: for `q` odd, `q ^ w ≠ 4`, so `|2| = q^{w/2}` has no integer solution. -/
theorem pow_ne_four_of_odd {q : ℕ} (hq : Odd q) (w : ℕ) : q ^ w ≠ 4 := by
  intro h
  have hodd : Odd (q ^ w) := hq.pow
  rw [h] at hodd
  exact absurd hodd (by decide)

/-! ## Induction (`…/purity-under-restriction-and-induction`) -/

/-- Test shape for the induction formula: an inert prime in `ℚ(i)/ℚ` acts on `Ind 1 = 1 ⊕ χ₋₄` by the swap matrix,
whose characteristic polynomial is `T² − 1 = P_u(1, T²)`. -/
theorem charpoly_swap : (!![(0 : ℚ), 1; 1, 0]).charpoly = X ^ 2 - 1 := by
  sorry

/-! ## Good reduction (`WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`,
`…/good-reduction-point-counts-and-traces`)

Suggested signatures on the carriers of ArithmeticGaloisRepresentations R01.6 and NeronModels R11.5:

  theorem AbelianVariety.h1_isPureOutside (A : AbelianVariety K) (T) (hT : A.GoodReductionOutside T) (p : ℕ) :
      (A.h1 p).IsPureOutside (T ∪ placesAbove p) 1 ∧ (A.h1 p).HasIntegralFrobOutside (T ∪ placesAbove p)
  theorem AbelianVariety.frobCharpoly_h1 (hv : v ∉ T ∪ placesAbove p) :
      (A.h1 p).frobCharpoly v = (End.charpoly (A.reduction v).frobenius).map (Int.castRingHom ℚ_[p])
-/

/-- The point count used in the acceptance of `good-reduction-point-counts-and-traces`: `y² = x³ − x` has `8` points
over `𝔽₅` (seven affine points and the point at infinity), so `a₅ = 5 + 1 − 8 = −2`. -/
theorem card_points_y2_eq_x3_sub_x_F5 :
    ((Finset.univ : Finset (ZMod 5 × ZMod 5)).filter (fun P => P.2 ^ 2 = P.1 ^ 3 - P.1)).card + 1 = 8 := by
  decide

end TauCeti.Weights
