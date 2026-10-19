import Mathlib.LinearAlgebra.Matrix.Hermitian
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Data.Matrix.Block
import Mathlib.Algebra.Group.AddChar
import Mathlib.Basic.Complex.Basic

/-!
# Doubling integrals: suggested forms

**This file is not the roadmap and is not exhaustive.** The definitive document is
`research/blueprint/readmes/AutomorphicLFunctionsAndLocalFactorsPartII.md`.
These are suggested forms for milestones whose carriers exist at the library pins.
Discharging them finishes neither a layer nor the roadmap. The theorem proofs are
goals. Heavy representation, induced-family, integral, and automorphic targets are
stated in the reader; this file introduces no substitute carriers for them.

The small definitions below fix the minus sign in the doubled form, the adjacent
block trace in the rectangular character, and the rank-one spherical normalization.
-/

namespace TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactorsPartII

open Matrix

section DoubledForm

variable {n : Type*}

/-- Gram matrix for the orthogonal sum of a form and its negative (D.0). -/
def doubledGram (A : Matrix n n ℂ) : Matrix (n ⊕ n) (n ⊕ n) ℂ :=
  Matrix.fromBlocks A 0 0 (-A)

theorem doubledGram_isHermitian (A : Matrix n n ℂ) (hA : A.IsHermitian) :
    (doubledGram A).IsHermitian := by
  sorry

/-- The diagonal/antidiagonal change of basis has cross-pairing twice the form. -/
theorem doubledGram_polarization [Fintype n] [DecidableEq n] (A : Matrix n n ℂ) :
    let P : Matrix (n ⊕ n) (n ⊕ n) ℂ := Matrix.fromBlocks 1 1 1 (-1)
    P.conjTranspose * doubledGram A * P = Matrix.fromBlocks 0 (A + A) (A + A) 0 := by
  sorry

example : doubledGram (1 : Matrix (Fin 1) (Fin 1) ℂ)
    (Sum.inr 0) (Sum.inr 0) = -1 := by
  sorry

example (A : Matrix (Fin 0) (Fin 0) ℂ) : doubledGram A = 0 := by
  sorry

example (A : Matrix n n ℂ) (i j : n) :
    doubledGram A (Sum.inl i) (Sum.inr j) = 0 := by
  sorry

end DoubledForm

section GodementRow

/-- With the ordered polarization A ⊕ D, the Godement row is (0, X) (D.1).
The upper-right block B does not enter its right action. -/
theorem godementRow_upper {n : Type*} [Fintype n] [DecidableEq n]
    (A B D X : Matrix n n ℂ) :
    Matrix.fromBlocks 0 X 0 0 * Matrix.fromBlocks A B 0 D =
      Matrix.fromBlocks 0 (X * D) 0 0 := by
  sorry

example (a x : ℂ) :
    let R : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) ℂ :=
      Matrix.fromBlocks 0 (fun _ _ => x) 0 0
    let P : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) ℂ :=
      Matrix.fromBlocks (fun _ _ => a) 0 0 1
    R * P = R := by
  sorry

end GodementRow

section RectangularCharacter

/-- Sum of traces immediately above the diagonal of k+1 blocks of size c (D.5). -/
def adjacentBlockTrace {k c : ℕ}
    (A : Matrix (Fin (k + 1) × Fin c) (Fin (k + 1) × Fin c) ℂ) : ℂ :=
  ∑ i : Fin k, ∑ j : Fin c, A (i.castSucc, j) (i.succ, j)

/-- The rectangular character is evaluated only on its block unipotent group. -/
def rectangularCharacter {k c : ℕ} (ψ : AddChar ℂ ℂ)
    (A : Matrix (Fin (k + 1) × Fin c) (Fin (k + 1) × Fin c) ℂ) : ℂ :=
  ψ (adjacentBlockTrace A)

theorem rectangularCharacter_mul {k c : ℕ} (ψ : AddChar ℂ ℂ)
    (A B : Matrix (Fin (k + 1) × Fin c) (Fin (k + 1) × Fin c) ℂ)
    (hA : ∀ i j : Fin (k + 1), j < i → ∀ r s : Fin c, A (i, r) (j, s) = 0)
    (hB : ∀ i j : Fin (k + 1), j < i → ∀ r s : Fin c, B (i, r) (j, s) = 0)
    (dA : ∀ (i : Fin (k + 1)) (r s : Fin c),
      A (i, r) (i, s) = if r = s then 1 else 0)
    (dB : ∀ (i : Fin (k + 1)) (r s : Fin c),
      B (i, r) (i, s) = if r = s then 1 else 0) :
    rectangularCharacter ψ (A * B) = rectangularCharacter ψ A * rectangularCharacter ψ B := by
  sorry

example {c : ℕ} (ψ : AddChar ℂ ℂ)
    (A : Matrix (Fin 1 × Fin c) (Fin 1 × Fin c) ℂ) :
    rectangularCharacter (k := 0) ψ A = 1 := by
  sorry

example {c : ℕ} (A : Matrix (Fin 2 × Fin c) (Fin 2 × Fin c) ℂ) :
    adjacentBlockTrace A = Matrix.trace (fun i j : Fin c => A (0, i) (1, j)) := by
  sorry

example (A : Matrix (Fin 3 × Fin 1) (Fin 3 × Fin 1) ℂ) :
    adjacentBlockTrace A = A (0, 0) (1, 0) + A (1, 0) (2, 0) := by
  sorry

end RectangularCharacter

/-- Spherical U(1) expression after the right-action character conversion (D.2). -/
noncomputable def splitRankOneIntegral (X Y : ℂ) : ℂ := (1 - X * Y) / ((1 - X) * (1 - Y))

theorem splitRankOneIntegral_geometric (X Y : ℂ) (hX : X ≠ 1) (hY : Y ≠ 1) :
    splitRankOneIntegral X Y = 1 / (1 - X) + Y / (1 - Y) := by
  sorry

example (Y : ℂ) : splitRankOneIntegral 0 Y = 1 / (1 - Y) := by
  sorry

example : splitRankOneIntegral 0 0 = 1 := by
  sorry

example (X : ℂ) : splitRankOneIntegral X 0 = 1 / (1 - X) := by
  sorry

end TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactorsPartII
