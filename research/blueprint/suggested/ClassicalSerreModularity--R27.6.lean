import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Data.Matrix.Mul
import TauCeti.NumberTheory.ModularForms.Newforms.Newform

/-!
# Suggested Lean forms: Classical Serre Modularity, part R27.6

This file is not the roadmap and is not exhaustive. The reader document
`ClassicalSerreModularity--R27.6.md` is definitive. These statements suggest Lean forms so that
contributors and reviewers can converge on names and signatures.

Baseline: Mathlib 082e2d3 and Tau Ceti f790474. The compact shape follows WORKERS.md
(2026-10-12): only light definitions over existing carriers, statable milestones and a few examples.
The full residual Galois witness, Serre invariants, coefficient-place comparisons and compatible
system interfaces are README targets supplied by R01, R15, R19 and R24. They are not replaced by
empty predicates or invented structures here. The existing bundled Newform is used directly.

The matrices are the two lattices in the local order-three representation used at R33.3.
They are formulas over a commutative ring, not a construction of the local Galois representation.
The basis-change determinant becomes zero on reduction: residual representations on the two
lattices need not be isomorphic. All arithmetic targets remain unchecked.
-/

namespace TauCeti.SerreConjecture.Suggested

open _root_.Matrix

variable {R : Type*} [CommRing R]

/-- Inertia on the standard lattice, with z a primitive cube root at the arithmetic use. -/
def standardInertia (z : R) : Matrix (Fin 2) (Fin 2) R := !![z, 0; 0, z ^ 2]

/-- Arithmetic Frobenius on the standard induced lattice. -/
def standardFrobenius (R : Type*) [CommRing R] : Matrix (Fin 2) (Fin 2) R :=
  !![0, 1; 1, 0]

/-- Columns are e₁+e₂ and (z−1)e₂. This is invertible over the fraction field at the use. -/
def cubicBasisChange (z : R) : Matrix (Fin 2) (Fin 2) R := !![1, 0; 1, z - 1]

/-- Inertia on the adapted stable lattice. -/
def adaptedInertia (z : R) : Matrix (Fin 2) (Fin 2) R := !![z, 0; z, z ^ 2]

/-- Arithmetic Frobenius on the adapted stable lattice. -/
def adaptedFrobenius (z : R) : Matrix (Fin 2) (Fin 2) R := !![1, z - 1; 0, -1]

/-- R33.3: the integral intertwining identity, before any reduction. -/
theorem inertia_basis_change (z : R) :
    standardInertia z * cubicBasisChange z = cubicBasisChange z * adaptedInertia z := by
  sorry

/-- R33.3: Frobenius preserves the adapted lattice as well. -/
theorem frobenius_basis_change (z : R) :
    standardFrobenius R * cubicBasisChange z = cubicBasisChange z * adaptedFrobenius z := by
  sorry

/-- R33.3: the basis-change determinant records the lattice index. -/
theorem cubicBasisChange_det (z : R) : (cubicBasisChange z).det = z - 1 := by
  sorry

/-- R33.3: order-three inertia, including its nonsplit residual specialization. -/
theorem adaptedInertia_cube (z : R) (hz : z ^ 2 + z + 1 = 0) :
    adaptedInertia z ^ 3 = 1 := by
  sorry

/-- R33.3: Frobenius acts through the order-two quotient. -/
theorem adaptedFrobenius_square (z : R) : adaptedFrobenius z ^ 2 = 1 := by
  sorry

/-- R33.3: arithmetic Frobenius at 2 squares tame inertia. -/
theorem adapted_tame_relation (z : R) (hz : z ^ 2 + z + 1 = 0) :
    adaptedFrobenius z * adaptedInertia z * adaptedFrobenius z = adaptedInertia z ^ 2 := by
  sorry

-- The reduced standard lattice has trivial inertia; the adapted one does not.
example : standardInertia (1 : ZMod 3) = 1 ∧ adaptedInertia (1 : ZMod 3) ≠ 1 := by
  decide

-- One-dimensional inertia invariants on the adapted reduction, tested using the pinned mulVec.
example (v : Fin 2 → ZMod 3) : _root_.Matrix.mulVec (adaptedInertia (1 : ZMod 3)) v = v ↔ v 0 = 0 := by
  revert v
  decide

-- The two residual Frobenius actions have the same trace, despite different inertia modules.
example : (standardFrobenius (ZMod 3)).trace = (adaptedFrobenius (1 : ZMod 3)).trace := by
  decide

-- Integral basis change is not an isomorphism of the reduced two-dimensional spaces.
example : (cubicBasisChange (1 : ZMod 3)).det = 0 := by
  decide

-- R33.2: the auxiliary congruences; primality and the Galois Frobenius condition are separate inputs.
example : 406561 % 8 = 1 ∧ 406561 % 3 = 1 ∧ 406561 % 5 = 1 ∧
    406561 % 7 = 1 ∧ 406561 % 11 = 1 ∧ 406561 % 13 = 12 := by
  decide

-- R27.6/R33.6: reuse the actual normalized form and its first coefficient, without a new carrier.
open scoped _root_.ModularForm

example {N : ℕ} [NeZero N] {k : ℤ} (f : HeckeRing.GL2.Newform N k) :
    (_root_.UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff 1 = 1 := by
  exact f.qExpansion_coeff_one

end TauCeti.SerreConjecture.Suggested
