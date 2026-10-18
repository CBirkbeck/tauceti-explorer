import Mathlib.GroupTheory.Commutator.Basic
import Mathlib.GroupTheory.Subgroup.Centralizer
import Mathlib.GroupTheory.SpecificGroups.Cyclic.Basic
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.RingTheory.Adjoin.Basic
import Mathlib.Dynamics.PeriodicPts.Defs

/-!
This file is not the roadmap and is not exhaustive. The companion reader
NonabelianLevelStructures.md is definitive. These statements suggest Lean forms
so contributors and reviewers can converge on names and signatures.

This is a compact statement file at Mathlib 082e2d3 / Tau Ceti f790474.
Only light definitions on existing carriers and selected mathematical milestones
appear here. The admissible-cover stacks, their ramification divisor, the
character scheme and the cusp quotient are reader targets: their carriers do
not exist at these pins. In particular no substitute stack, abstract degree
axiom or proposition-valued stand-in is introduced here.

Primary source: W. Y. Chen, Annals of Mathematics 199 (2024), 301–443.
Locators use that published numbering. All declarations remain unchecked roadmap
suggestions; the admitted proofs do not establish the mathematical results.
-/

namespace TauCeti.NonabelianLevel

open scoped commutatorElement

section CuspData

variable {G : Type*} [Group G]

/-- The normalization monodromy subgroup; Chen §4.8, p. 378. -/
def cuspMonodromy (u h : G) : Subgroup G :=
  Subgroup.closure ({u, h⁻¹ * u⁻¹ * h} : Set G)

/-- Membership in the cusp automorphism group; Proposition 4.10.1, p. 383.
The actual subgroup and its geometric comparison are reader targets. -/
def IsCuspAutomorphism (u h a : G) : Prop :=
  a ∈ Subgroup.centralizer (cuspMonodromy u h : Set G) ∧
    ⁅a, h⁆ ∈ Subgroup.zpowers u

/-- Kernel milestone for the cusp commutator map. -/
theorem cusp_automorphism_kernel (u h : G)
    (hgen : Subgroup.closure ({u, h} : Set G) = ⊤) (a : G)
    (ha : IsCuspAutomorphism u h a) :
    ⁅a, h⁆ = 1 ↔ a ∈ Subgroup.center G := by
  sorry

/-- The period and cardinality assertion of Proposition 4.10.1.
The period is characterized on exterior generating pairs, using conjugation. -/
theorem cusp_automorphism_period [Finite G] (u h : G)
    (hgen : Subgroup.closure ({u, h} : Set G) = ⊤) :
    ∃ k : ℕ, 0 < k ∧ k ∣ orderOf u ∧
      (∀ n : ℤ,
        (∃ g : G, g * u * g⁻¹ = u ∧
          g * h * g⁻¹ = u ^ n * h) ↔ (k : ℤ) ∣ n) ∧
      Nat.card {a : G // IsCuspAutomorphism u h a} =
        Nat.card (Subgroup.center G) * (orderOf u / k) := by
  sorry

/-- The justified j=0 group-bound milestone, Lemma 4.12.2, pp. 389–390.
No general-j direct-product claim is made. -/
theorem cusp_primary_square_bound [Finite G] (ell : ℕ) (hell : ell.Prime)
    (u h z : G) (hgen : Subgroup.closure ({u, h} : Set G) = ⊤)
    (hnonabelian : ∃ a b : G, a * b ≠ b * a)
    (hnormal : ∀ H : Subgroup G, H.Normal → H ≠ ⊤ → ¬ ell ∣ Nat.card H)
    (hz : IsCuspAutomorphism u h z)
    (hzc : z ∈ Subgroup.zpowers ⁅u⁻¹, h⁻¹⁆) :
    2 * (orderOf z).factorization ell ≤ (Nat.card G).factorization ell := by
  sorry

/-- Conditional simple-group obstruction estimate. The cube bound is an
explicit mathematical input, not an unproved classification axiom. -/
theorem cusp_cube_bound [Finite G] (ell r : ℕ) (hell : ell.Prime)
    (u h z : G) (hgen : Subgroup.closure ({u, h} : Set G) = ⊤)
    (hnonabelian : ∃ a b : G, a * b ≠ b * a)
    (hnormal : ∀ H : Subgroup G, H.Normal → H ≠ ⊤ → ¬ ell ∣ Nat.card H)
    (hcube : ∀ H : Subgroup G,
      (∀ a b : H, a * b = b * a) → (Nat.card H) ^ 3 < Nat.card G)
    (hsize : Nat.card G ≤ ell ^ (3 * (r + 1)))
    (hz : IsCuspAutomorphism u h z)
    (hzc : z ∈ Subgroup.zpowers ⁅u⁻¹, h⁻¹⁆) :
    2 * (orderOf z).factorization ell ≤ r := by
  sorry

example (u h : G) : IsCuspAutomorphism u h 1 := by
  sorry

example {H : Type*} [CommGroup H] (u h a : H) : IsCuspAutomorphism u h a := by
  sorry

example : cuspMonodromy (1 : Unit) 1 = ⊤ := by
  sorry

end CuspData

section TraceCoordinates

variable {R : Type*} [CommRing R]

/-- Trace coordinates of a pair, before forming any character quotient;
Definitions 5.2.2–5.2.3, p. 396. -/
def traceCoordinates (A B : Matrix.SpecialLinearGroup (Fin 2) R) : R × R × R :=
  (Matrix.trace (A : Matrix (Fin 2) (Fin 2) R),
    Matrix.trace (B : Matrix (Fin 2) (Fin 2) R),
    Matrix.trace ((A * B : Matrix.SpecialLinearGroup (Fin 2) R) :
      Matrix (Fin 2) (Fin 2) R))

/-- The integral Fricke identity; Lemma 5.2.4, p. 396. -/
theorem fricke_trace (A B : Matrix.SpecialLinearGroup (Fin 2) R) :
    let P := traceCoordinates A B
    Matrix.trace ((⁅A, B⁆ : Matrix.SpecialLinearGroup (Fin 2) R) : Matrix (Fin 2) (Fin 2) R) =
      P.1 ^ 2 + P.2.1 ^ 2 + P.2.2 ^ 2 - P.1 * P.2.1 * P.2.2 - 2 := by
  sorry

/-- The matrix-algebra condition over an arbitrary ring; Lemma 5.2.9, p. 398. -/
theorem matrix_algebra_criterion (A B : Matrix.SpecialLinearGroup (Fin 2) R) :
    Algebra.adjoin R ({(A : Matrix (Fin 2) (Fin 2) R),
      (B : Matrix (Fin 2) (Fin 2) R)} : Set (Matrix (Fin 2) (Fin 2) R)) = ⊤ ↔
      IsUnit (let P := traceCoordinates A B
        P.1 ^ 2 + P.2.1 ^ 2 + P.2.2 ^ 2 - P.1 * P.2.1 * P.2.2 - 4) := by
  sorry

/-- Central inversion is in the kernel of the action on trace coordinates.
This does not assert a kernel for the induced PGL2(Z) action. -/
theorem traceCoordinates_inversion (A B : Matrix.SpecialLinearGroup (Fin 2) R) :
    traceCoordinates A⁻¹ B⁻¹ = traceCoordinates A B := by
  sorry

example : traceCoordinates
    (1 : Matrix.SpecialLinearGroup (Fin 2) ℤ) 1 = (2, 2, 2) := by
  sorry

example : traceCoordinates
    (1 : Matrix.SpecialLinearGroup (Fin 2) (ZMod 2)) 1 = (0, 0, 0) := by
  sorry

example (A : Matrix.SpecialLinearGroup (Fin 2) R) :
    traceCoordinates A 1 =
      (Matrix.trace (A : Matrix (Fin 2) (Fin 2) R), 2,
        Matrix.trace (A : Matrix (Fin 2) (Fin 2) R)) := by
  sorry

end TraceCoordinates

/-- Finite-field surjectivity, without an incorrect assertion that every pair
is a generating pair; Theorem 5.2.10, pp. 398–400. -/
theorem finite_field_trace_surjective (k : Type*) [Field k] [Fintype k] :
    Function.Surjective (fun P :
      Matrix.SpecialLinearGroup (Fin 2) k × Matrix.SpecialLinearGroup (Fin 2) k =>
        traceCoordinates P.1 P.2) := by
  sorry

section RotationConics

variable {R : Type*} [CommRing R]

/-- The linear operator on the y,z-plane of the conic slice, not a second
Markoff-surface or Vieta-action construction; proof of Lemma 5.3.1, p. 406. -/
def rotationMatrix (a : R) : Matrix (Fin 2) (Fin 2) R :=
  !![0, 1; -1, a]

/-- The same operator on an existing product carrier. -/
def rotationLinearStep (a : R) (v : R × R) : R × R :=
  (v.2, a * v.2 - v.1)

/-- Exact period on a nonzero vector of a trace conic; pp. 406–409.
The characteristic polynomial, rather than a square-discriminant condition,
handles characteristic 2 as well. -/
theorem rotation_exact_period (k : Type*) [Field k] [Fintype k]
    (a t y z : k) (ht : t ≠ 2)
    (hconic : y ^ 2 + z ^ 2 - a * y * z + (a ^ 2 - 2 - t) = 0)
    (hv : (y, z) ≠ (0, 0)) :
    Function.minimalPeriod (rotationLinearStep a) (y, z) = orderOf (rotationMatrix a) := by
  sorry

/-- Corrected nonsplit degenerate conic; the full fibre is a singleton. -/
theorem nonsplit_degenerate_conic (k : Type*) [Field k] [Fintype k]
    (a : k) (hnoroot : ∀ w : k, w ^ 2 - a * w + 1 ≠ 0) (y z : k) :
    y ^ 2 + z ^ 2 - a * y * z = 0 ↔ y = 0 ∧ z = 0 := by
  sorry

example : rotationMatrix (2 : ℤ) = !![0, 1; -1, 2] := by
  sorry

example : rotationLinearStep (2 : ℤ) (1, 3) = (3, 5) := by
  sorry

example : rotationLinearStep (0 : ZMod 2) (0, 1) = (1, 0) := by
  sorry

end RotationConics

end TauCeti.NonabelianLevel
