import Mathlib

/-!
# Arithmetic statistics, Part III: representative target signatures

The accompanying README is the full specification, with source locators and exact
supplier contracts. This file gives light definitions and selected milestones on
the pinned carriers. Counts retain the specified cutoffs and denominators; orbit,
moduli, covering and arithmetic probability constructions remain README targets.
-/

noncomputable section
open scoped BigOperators Topology
open Polynomial Filter
set_option autoImplicit false
set_option linter.unusedVariables false

namespace TauCetiRoadmap.ArithmeticStatisticsPartIII

/-! ## Layer 2: Uniform orbit counts and sieves -/

namespace Counting
/-- Square-divisor tails exclude the singular discriminant-zero locus. -/
def squareDivisorTail {A : Type*} (Delta : A → ℤ) (H : A → ℝ)
    (M : ℕ) (X : ℝ) : Set A :=
  {a | H a < X ∧ Delta a ≠ 0 ∧
    ∃ m : ℕ, M < m ∧ 0 < m ∧ Squarefree m ∧ (m : ℤ) ^ 2 ∣ Delta a}

/-- Count the contributing squarefree moduli; zero discriminant has assigned count zero. -/
def squareDivisorMultiplicity {A : Type*} (Delta : A → ℤ)
    (M : ℕ) (a : A) : ℕ := by
  classical
  exact ((Delta a).natAbs.divisors.filter fun m =>
    M < m ∧ Squarefree m ∧ (m : ℤ) ^ 2 ∣ Delta a).card

/-- A square-divisor tail is detected by positive multiplicity on the nonsingular height box. -/
theorem tail_iff_multiplicity_pos {A : Type*} (Delta : A → ℤ) (H : A → ℝ)
    (M : ℕ) (X : ℝ) (a : A) (hH : H a < X) (hDelta : Delta a ≠ 0) :
    a ∈ squareDivisorTail Delta H M X ↔ 0 < squareDivisorMultiplicity Delta M a := by sorry

example : () ∈ squareDivisorTail (fun _ : Unit => 36) (fun _ => 0) 5 1 ∧
    squareDivisorMultiplicity (fun _ : Unit => 36) 5 () = 1 := by sorry
example (M : ℕ) : squareDivisorTail (fun _ : Unit => 0) (fun _ => 0) M 1 = ∅ ∧
    squareDivisorMultiplicity (fun _ : Unit => 0) M () = 0 := by sorry

/-- The rational-root estimate uses the actual strict weighted coefficient box. -/
theorem monic_rational_root_bound (n : ℕ) (hn : 2 ≤ n) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ X : ℝ, 2 ≤ X →
      ({a : Fin n → ℤ | (∀ i, |(a i : ℝ)| < X ^ (i.val + 1)) ∧ ∃ t : ℚ,
        (Polynomial.X ^ n + ∑ i : Fin n,
          Polynomial.C (a i : ℚ) * Polynomial.X ^ (n - 1 - i.val)).eval t = 0}.ncard : ℝ) ≤
      C * X ^ (n * (n + 1) / 2 - n + 1) * Real.log X := by sorry

/-- Sum over the full transporter of the invariant section, retaining every stabilizer element. -/
def sectionKernel {G U I : Type*} [Group G] [MulAction G U]
    (inv : U → I) (kappa : I → U) (Theta : G → ℝ) (phi : I → ℝ) (u : U) : ℝ := by
  classical
  exact ∑' g : G, if g • kappa (inv u) = u then Theta g * phi (inv u) else 0


/-- Finite transporters retain stabilizer multiplicities when unfolding the kernel. -/
theorem sectionKernel_finite_fibre {G U I : Type*} [Group G] [MulAction G U]
    (inv : U → I) (kappa : I → U) (Theta : G → ℝ) (phi : I → ℝ) (u : U)
    (hf : {g : G | g • kappa (inv u) = u}.Finite) :
    sectionKernel inv kappa Theta phi u =
      ∑ g ∈ hf.toFinset, Theta g * phi (inv u) := by sorry

/-- The trivial two-permutation action keeps both transporter elements. -/
private instance permUnitAction : MulAction (Equiv.Perm (Fin 2)) Unit where
  smul _ u := u
  one_smul _ := rfl
  mul_smul _ _ _ := rfl

example : sectionKernel (fun _ : Unit => ()) (fun _ : Unit => ())
    (fun _ : Equiv.Perm (Fin 2) => (2 : ℝ)) (fun _ => 3) () = 12 := by sorry
example : sectionKernel (fun _ : Unit => ()) (fun _ : Unit => ())
    (fun _ : Equiv.Perm (Fin 2) => (2 : ℝ)) (fun _ => 0) () = 0 := by sorry

/-- A coupled CRT condition occupies two residues, rather than four marginal combinations. -/
example : ({x : ZMod 15 | x = 0 ∨ x = 1}.ncard : ℚ) / 15 = 2 / 15 ∧
    (2 : ℚ) / 15 ≠ (2 / 3) * (2 / 5) := by sorry

/-- The cutoff dictated by the actual tail exponents, without assigning a numerical endpoint. -/
def sieveCutoff (δ η ξ : ℝ) : ℝ := max η ((η + ξ) / δ)

/-- Both strict cutoff inequalities are required for the even-degree fixed-modulus sieve. -/
def EvenTailParameters (n : ℕ) (δ η ξ : ℝ) : Prop :=
  4 ≤ n ∧ Even n ∧ 0 < δ ∧ 0 < η ∧ 0 ≤ ξ ∧
    sieveCutoff δ η ξ < 1 ∧ (2 * (n : ℝ) + 1) * sieveCutoff δ η ξ < n + 1

/-- Slack in all three sieve terms supplies a positive saving at fixed modulus. -/
theorem even_sieve_positive_saving (n : ℕ) (δ η ξ : ℝ)
    (h : EvenTailParameters n δ η ξ) :
    0 < min η (min (1 - sieveCutoff δ η ξ)
      ((n : ℝ) + 1 - (2 * n + 1) * sieveCutoff δ η ξ)) := by sorry

example : sieveCutoff (1/2) (1/100) 0 = (1/50 : ℝ) ∧
    EvenTailParameters 4 (1/2) (1/100) 0 := by sorry
example : ¬ EvenTailParameters 4 (1/2) (9/10) 0 := by sorry
example : sieveCutoff 1 (3/5) 0 < 1 ∧
    ¬ EvenTailParameters 4 1 (3/5) 0 := by sorry
example : ¬ EvenTailParameters 2 (1/2) (1/100) 0 ∧
    ¬ EvenTailParameters 3 (1/2) (1/100) 0 := by sorry
example : sieveCutoff 0 (1/100) 0 = (1/100 : ℝ) ∧
    ¬ EvenTailParameters 4 0 (1/100) 0 := by sorry

/-- These are local mass and integral-representative normalization checks. -/
example : (3 : ℚ) / 3 = 1 ∧ (1 : ℚ) / 3 = 1/3 ∧
    (1 / (1 * (1 + 1)) : ℚ) + 1 / (1 * (1 + 1)) = 1 := by sorry
example : ((1 : ℚ) / (3 * (1/3))) / 3 = 1/3 ∧
    1 + (1 : ℚ) = 2 := by sorry
example : (2 : ℚ) ^ (-4 : ℤ) = (2 : ℚ) ^ (-3 : ℤ) * (2 : ℚ) ^ (-1 : ℤ) ∧
    (2 : ℚ) ^ (-4 : ℤ) = 1/16 := by sorry

example : squareDivisorTail (fun _ : Unit => 36) (fun _ => 0) 6 1 = ∅ ∧
    squareDivisorMultiplicity (fun _ : Unit => 36) 6 () = 0 := by sorry
example : sectionKernel (fun _ : Unit => ()) (fun _ : Unit => ())
    (fun _ : Equiv.Perm (Fin 2) => (0 : ℝ)) (fun _ => 3) () = 0 := by sorry

end Counting

end TauCetiRoadmap.ArithmeticStatisticsPartIII
