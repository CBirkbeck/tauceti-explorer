import Mathlib.LinearAlgebra.QuadraticForm.IsometryEquiv
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic

/-!
# Quadratic and symmetric arithmetic at dyadic primes

This file is not the roadmap and is not exhaustive. The reader document is
 definitive; these statements suggest Lean forms for selected targets and checks.
They make no implementation claim. The pins and exact source locators are in
 the companion packet and reader.

Only light real-bodied expressions over existing carriers appear here. The
missing integral Witt carriers, Poincaré categories, flavor functors, periodic
L spectra, controlled Verdier subcategories and completion comparisons remain
README targets with explicit supplier contracts. No data definition stands in
for them. The two-image quotient below is the native additive quotient formula,
not an implementation of the arithmetic Witt correction before its carriers exist.

The finite-field example checks the new source finding in Example 2.3.14:
quadratic base change from F₂ to F₄ is zero on Arf invariants. The symmetric
rank-parity map is instead the identity. The resulting corrected Eisenstein
quadratic table is a README target, not an assertion about a placeholder group.
-/

noncomputable section

namespace TauCeti.DyadicQuadraticArithmetic

/-- Native binary form a*x² + x*y + b*y²; DA.0/finite-arf. -/
def binaryPlane {K : Type*} [CommRing K] (a b : K) :
    QuadraticForm K (Fin 2 → K) :=
  a • QuadraticMap.proj 0 0 + QuadraticMap.proj 0 1 + b • QuadraticMap.proj 1 1

/-- The absolute Arf-one plane is anisotropic over the prime field. -/
theorem binaryPlane_f2_anisotropic :
    (binaryPlane (1 : ZMod 2) 1).Anisotropic := by
  sorry

/-- The same plane becomes hyperbolic over the degree-two constant extension. -/
theorem binaryPlane_f4_not_anisotropic :
    ¬ (binaryPlane (1 : GaloisField 2 2) 1).Anisotropic := by
  sorry

/-- A root of the cube-root polynomial gives a nonzero isotropic vector. -/
theorem binaryPlane_isotropic_of_root {K : Type*} [Field K] (z : K)
    (hz : z * z + z + 1 = 0) :
    ∃ v : Fin 2 → K, v ≠ 0 ∧ binaryPlane (1 : K) 1 v = 0 := by
  sorry

/-- The polar is the full cross term, also when 2 vanishes. -/
example {K : Type*} [CommRing K] [CharP K 2] (a b : K) (x y : Fin 2 → K) :
    (binaryPlane a b).polarBilin x y = x 0 * y 1 + x 1 * y 0 := by
  sorry

/-- A nonzero quadratic map with zero polar is excluded from the Arf carrier. -/
example : (QuadraticMap.proj (R := ZMod 2) (n := Fin 1) (A := ZMod 2) 0 0).polarBilin = 0 := by
  sorry

/-- A computed check of the anisotropic F₂ plane. -/
example : binaryPlane (1 : ZMod 2) 1 ![1, 1] = 1 := by
  sorry

/-- The exact native quotient expression in DA.3/correction-term. -/
def comparisonDefect {B C D : Type*} [AddCommGroup B] [AddCommGroup C]
    [AddCommGroup D] (s : B →+ D) (q : C →+ D) : Type _ :=
  D ⧸ (s.range ⊔ q.range)

/-- The two-image quotient vanishes precisely when the images span. -/
theorem comparisonDefect_subsingleton_iff {B C D : Type*}
    [AddCommGroup B] [AddCommGroup C] [AddCommGroup D]
    (s : B →+ D) (q : C →+ D) :
    Subsingleton (comparisonDefect s q) ↔ s.range ⊔ q.range = ⊤ := by
  sorry

/-- The global rank parity is constant at the dyadic primes. -/
def diagonalParity (d : ℕ) : ZMod 2 →+ (Fin d → ZMod 2) where
  toFun a := fun _ => a
  map_zero' := rfl
  map_add' _ _ := rfl

/-- The parity obstruction's finite quotient; DA.3/parity-obstruction. -/
theorem parityQuotient_card (d : ℕ) (hd : 0 < d) :
    Nat.card ((Fin d → ZMod 2) ⧸ (diagonalParity d).range) = 2 ^ (d - 1) := by
  sorry

/-- One dyadic prime has no parity obstruction; this does not compute A(R). -/
example : Subsingleton ((Fin 1 → ZMod 2) ⧸ (diagonalParity 1).range) := by
  sorry

/-- DA.4/q2-coordinates: the printed annihilator generator fails. -/
theorem printedTensor_anisotropic :
    (QuadraticMap.weightedSumSquares ℚ_[2]
      (![1, 3, -2, -6] : Fin 4 → ℚ_[2])).Anisotropic := by
  sorry

/-- The corrected generator tensors to two hyperbolic pairs. -/
theorem correctedTensor_equivalent :
    (QuadraticMap.weightedSumSquares ℚ_[2]
      (![1, 3, -3, -9] : Fin 4 → ℚ_[2])).Equivalent
    (QuadraticMap.weightedSumSquares ℚ_[2]
      (![1, -1, 3, -3] : Fin 4 → ℚ_[2])) := by
  sorry

/-- Norm of the new local quadratic generator's signed determinant. -/
example {K : Type*} [CommRing K] (z : K) (hz : z * z + z + 1 = 0) :
    (1 - 4 * z) * (1 - 4 * (-1 - z)) = 21 := by
  sorry

/-- A square-norm test distinguishing that generator from the global class 2u. -/
theorem twentyOne_not_square_padicTwo : ¬ IsSquare (21 : ℚ_[2]) := by
  sorry

/-- Transfer with λ(1)=0 and λ(√−3)=1: the signed determinant is 21. -/
example : Matrix.det
    (!![0, 2, 0, 1; 2, 0, 1, 0; 0, 1, 1, -1; 1, 0, -1, -3] :
      Matrix (Fin 4) (Fin 4) ℤ) = 21 := by
  sorry

end TauCeti.DyadicQuadraticArithmetic
