import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.RingTheory.Ideal.Span
import Mathlib.RingTheory.Ideal.Quotient.Defs
import Mathlib.RingTheory.KrullDimension.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ModpRepresentationsOfGL2OverLocalFields.md` is definitive.
These statements suggest Lean names and signatures for contributors and reviewers.

Following WORKERS.md (2026-10-12), only light definitions on existing carriers,
milestones statable at the pins, and a few examples appear here. Smooth categories,
ordinary parts, tame weights, filtered Iwahori rings and integral representation
lattices need carriers not supplied at the pins; their complete targets, APIs,
tests and hypotheses are in the document. No substitute axiomatic carriers occur.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174,
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Source locators refer to the specific editions recorded in the document.
-/

namespace ModpGL2

namespace Weight

/-- MP.3/weight-coordinates: strict alcove depth, BHHMS §2, pp. 11–14. -/
def IsDeep {J : Type*} (p N : ℤ) (lam : J → ℤ × ℤ) : Prop :=
  ∀ i, N < (lam i).1 - (lam i).2 + 1 ∧
    (lam i).1 - (lam i).2 + 1 < p - N

theorem deep_iff {J : Type*} (p N : ℤ) (lam : J → ℤ × ℤ) :
    IsDeep p N lam ↔
      ∀ i, N ≤ (lam i).1 - (lam i).2 ∧ (lam i).1 - (lam i).2 ≤ p - N - 2 := by
  sorry

theorem centralTwist {J : Type*} (p N : ℤ) (lam : J → ℤ × ℤ) (c : J → ℤ) :
    IsDeep p N (fun i => ((lam i).1 + c i, (lam i).2 + c i)) ↔ IsDeep p N lam := by
  sorry

-- depth_three
example : IsDeep 17 3 (fun _ : Unit => ((3 : ℤ), (0 : ℤ))) := by
  sorry

-- depth_boundary
example : ¬ IsDeep 17 3 (fun _ : Unit => ((2 : ℤ), (0 : ℤ))) := by
  sorry

-- central_twist: equality of depths does not identify the weight labels.
example (p N : ℤ) :
    IsDeep p N (fun _ : Unit => ((5 : ℤ), (0 : ℤ))) ↔
      IsDeep p N (fun _ : Unit => ((8 : ℤ), (3 : ℤ))) := by
  sorry

end Weight

/-- MP.3/translation-map: a representative before taking the central quotient.
`next` is the cyclic successor in applications. BHHMS (14), p. 16. -/
def weightTranslation {J : Type*} (p : ℤ) (next : J → J)
    (lam : J → ℤ × ℤ) (omega : J → ℤ) : J → ℤ × ℤ := fun i =>
  let n := omega i / 2
  let delta := omega i % 2
  if omega (next i) % 2 = 0 then
    ((lam i).1 + n + delta, (lam i).2 - n)
  else
    ((lam i).2 - 1 - n, (lam i).1 + n + delta - p + 1)

namespace weightTranslation

theorem zero {J : Type*} (p : ℤ) (next : J → J) (lam : J → ℤ × ℤ) :
    weightTranslation p next lam (fun _ => 0) = lam := by
  sorry

theorem regular {J : Type*} (p : ℤ) (next : J → J)
    (lam : J → ℤ × ℤ) (omega : J → ℤ) :
    (∀ i, 0 ≤ (weightTranslation p next lam omega i).1 -
        (weightTranslation p next lam omega i).2 ∧
      (weightTranslation p next lam omega i).1 -
        (weightTranslation p next lam omega i).2 ≤ p - 2) ↔
      ∀ i, 0 ≤ (lam i).1 - (lam i).2 + omega i ∧
        (lam i).1 - (lam i).2 + omega i ≤ p - 2 := by
  sorry

-- At the level of these representatives the root-shift identity is exact.
theorem rootShift {J : Type*} (p : ℤ) (next : J → J)
    (lam : J → ℤ × ℤ) (omega n : J → ℤ) :
    weightTranslation p next (fun i => ((lam i).1 + n i, (lam i).2 - n i)) omega =
      weightTranslation p next lam (fun i => omega i + 2 * n i) := by
  sorry

-- negative_parity: Euclidean division gives -1 = 2 * (-1) + 1.
example : weightTranslation 17 id (fun _ : Unit => ((5 : ℤ), (0 : ℤ)))
    (fun _ => -1) () = (0, -11) := by
  sorry

-- positive_parity
example : weightTranslation 17 id (fun _ : Unit => ((5 : ℤ), (0 : ℤ)))
    (fun _ => 1) () = (-1, -10) := by
  sorry

-- cyclic_branch: the branch reads the parity at the successor index.
example : weightTranslation 17 Bool.not
    (fun i => if i then ((6 : ℤ), (0 : ℤ)) else (5, 0))
    (fun i => if i then 0 else 1) false = (6, 0) ∧
    weightTranslation 17 Bool.not
      (fun i => if i then ((6 : ℤ), (0 : ℤ)) else (5, 0))
      (fun i => if i then 0 else 1) true = (-1, -10) := by
  sorry

-- origin_test
example (lam : Bool → ℤ × ℤ) : weightTranslation 17 Bool.not lam (fun _ => 0) = lam := by
  sorry

end weightTranslation

/-- The adjacency predicate on the integer coordinate lattice in MP.3. -/
def weightAdjacent {J : Type*} (omega omega' : J → ℤ) : Prop :=
  ∃ i, |omega' i - omega i| = 1 ∧ ∀ j, j ≠ i → omega' j = omega j

theorem weightAdjacent_iff {J : Type*} (omega omega' : J → ℤ) :
    (weightAdjacent omega omega' ↔ weightAdjacent omega' omega) ∧
      (weightAdjacent omega omega' → omega ≠ omega') := by
  sorry

-- adjacency_not_distance_two
example : ¬ weightAdjacent (fun _ : Unit => (0 : ℤ)) (fun _ => 2) ∧
    weightAdjacent (fun _ : Unit => (0 : ℤ)) (fun _ => -1) := by
  sorry

/-- MP.4/crossing-algebra: only the two variables at the same index multiply to zero.
BHHMS Theorem 5.3.4(ii), p. 54. -/
noncomputable def crossingIdeal (J : Type*) (k : Type*) [CommRing k] :
    Ideal (MvPolynomial (J × Bool) k) :=
  Ideal.span {z | ∃ i : J, z = MvPolynomial.X (i, false) * MvPolynomial.X (i, true)}

abbrev crossingAlgebra (J : Type*) (k : Type*) [CommRing k] :=
  MvPolynomial (J × Bool) k ⧸ crossingIdeal J k

namespace crossingAlgebra

theorem mk (J : Type*) (k : Type*) [CommRing k] :
    (∀ i : J, Ideal.Quotient.mk (crossingIdeal J k)
      (MvPolynomial.X (i, false) * MvPolynomial.X (i, true)) = 0) ∧
    Function.Surjective (Ideal.Quotient.mk (crossingIdeal J k)) := by
  sorry

/-- The commutative dimension component of MP.4/crossing-algebra.
The Cohen–Macaulay assertion and Iwahori comparison are document targets. -/
theorem dimension (J : Type*) [Fintype J] (k : Type*) [Field k] :
    ringKrullDim (crossingAlgebra J k) = (Fintype.card J : WithBot ℕ∞) := by
  sorry

-- no_indices
example (k : Type*) [Field k] : Nonempty (crossingAlgebra Empty k ≃+* k) := by
  sorry

-- one_crossing: neither variable vanishes, although their product does.
example (k : Type*) [Field k] :
    Ideal.Quotient.mk (crossingIdeal Unit k) (MvPolynomial.X ((), false)) ≠ 0 ∧
    Ideal.Quotient.mk (crossingIdeal Unit k) (MvPolynomial.X ((), true)) ≠ 0 ∧
    Ideal.Quotient.mk (crossingIdeal Unit k)
      (MvPolynomial.X ((), false) * MvPolynomial.X ((), true)) = 0 := by
  sorry

-- different_indices
example (J : Type*) (k : Type*) [Field k] (i j : J) (h : i ≠ j) :
    Ideal.Quotient.mk (crossingIdeal J k)
      (MvPolynomial.X (i, false) * MvPolynomial.X (j, true)) ≠ 0 := by
  sorry

-- one_dimensional
example (k : Type*) [Field k] : ringKrullDim (crossingAlgebra Unit k) = 1 := by
  sorry

end crossingAlgebra

end ModpGL2
