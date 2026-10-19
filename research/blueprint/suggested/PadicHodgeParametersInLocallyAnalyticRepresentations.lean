import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.Logic.Equiv.Basic
import Mathlib.Logic.Equiv.Fin.Rotate
import Mathlib.SetTheory.Cardinal.Finite

/-!
# p-adic Hodge parameters in locally analytic representations

This file is not the roadmap and is not exhaustive: the roadmap document is definitive. Its
statements suggest Lean forms, so that contributors and reviewers converge on names and
signatures. The genuine locally analytic Ext category and the noncritical Robba deformation
spaces are not present at the pinned libraries, and this file does not replace them by arbitrary
vector spaces or an axiomatic structure; they stay targets of the roadmap document.

Only the endpoint permutations, the corrected character-spanning identity and the numerical
kernel calculation have carriers at the pins. The last theorem is the linear-algebra consequence
of the two dimension inputs, not Ding's comparison theorem.
Source: Ding, Publ. Math. IHÉS 142 (2025), Theorem 3.21 and Remark 3.22, pp. 48–50.
-/

namespace TauCetiRoadmap.PadicHodgeParameters

open scoped BigOperators

/-! ## PH.0: endpoint refinement families -/

/-- PH.0: permutations placing the final parameter last. Here n = m + 1. -/
def endRefinements (m : ℕ) : Set (Equiv.Perm (Fin (m + 1))) :=
  {w | w (Fin.last m) = Fin.last m}

/-- PH.0: permutations placing the final parameter first; the image, not inverse image. -/
def startRefinements (m : ℕ) : Set (Equiv.Perm (Fin (m + 1))) :=
  {w | w (Fin.last m) = 0}

/-- `endpoint_membership`: membership is the stated image equation, with no inverse. -/
theorem endpoint_membership (m : ℕ) (w : Equiv.Perm (Fin (m + 1))) :
    (w ∈ endRefinements m ↔ w (Fin.last m) = Fin.last m) ∧
      (w ∈ startRefinements m ↔ w (Fin.last m) = 0) := by
  sorry

/-- `endpoint_card`: each family has m! elements. -/
theorem endpoint_card (m : ℕ) :
    Nat.card {w : Equiv.Perm (Fin (m + 1)) // w ∈ endRefinements m} = m.factorial ∧
    Nat.card {w : Equiv.Perm (Fin (m + 1)) // w ∈ startRefinements m} = m.factorial := by
  sorry

/-- `rank_one_endpoints`: at n = 1 both families contain the unique permutation. -/
example : Equiv.refl (Fin 1) ∈ endRefinements 0 ∧
    Equiv.refl (Fin 1) ∈ startRefinements 0 := by
  sorry

/-- `rank_two_distinction`: at n = 2 the identity is an end refinement and not a start
refinement, while the transposition is a start refinement. -/
example : Equiv.refl (Fin 2) ∈ endRefinements 1 ∧
    Equiv.refl (Fin 2) ∉ startRefinements 1 ∧
    Equiv.swap (0 : Fin 2) 1 ∈ startRefinements 1 := by
  sorry

/-- `rank_three_endpoint_count`: at n = 3 the start family has two elements, and the 3-cycle
sending the last index to the middle one lies in neither family. -/
example : Nat.card {w : Equiv.Perm (Fin 3) // w ∈ startRefinements 2} = 2 ∧
    (finRotate 3).symm ∉ endRefinements 2 ∧ (finRotate 3).symm ∉ startRefinements 2 := by
  sorry

/-! ## PH.0: block characters and the corrected spanning identity -/

/-- PH.0: the tuple pulled back from two block determinants. -/
def blockTuple {H : Type*} (n j : ℕ) (a b : H) : Fin n → H :=
  fun i => if i.val < j then a else b

/-- `blockTuple_apply`: the i-th coordinate is a if i < j and b otherwise. -/
theorem blockTuple_apply {H : Type*} (n j : ℕ) (a b : H) (i : Fin n) :
    blockTuple n j a b i = if i.val < j then a else b := by
  sorry

/-- `diagonal_in_block`: equal block values give the diagonal tuple. -/
theorem diagonal_in_block {H : Type*} (n j : ℕ) (a : H) :
    blockTuple n j a a = fun _ => a := by
  sorry

/-- `empty_first_block`. -/
example {H : Type*} (n : ℕ) (a b : H) :
    blockTuple n 0 a b = fun _ => b := by
  sorry

/-- `full_first_block`. -/
example {H : Type*} (n : ℕ) (a b : H) :
    blockTuple n n a b = fun _ => a := by
  sorry

/-- `rank_three_block`: blockTuple(3,1,a,b) = (a,b,b). -/
example {H : Type*} (a b : H) : blockTuple 3 1 a b 0 = a ∧
    blockTuple 3 1 a b 1 = b ∧ blockTuple 3 1 a b 2 = b := by
  sorry

/-- `center_overlap`: the diagonal tuple lies in both rank-three block families, so their sum
is not direct. -/
example {H : Type*} (a : H) :
    blockTuple 3 1 a a = blockTuple 3 2 a a := by
  sorry

/-- PH.0: telescoping supplies the spanning consequence needed in place of (3.43).
The overlapping block subspaces are not asserted to form a direct sum. -/
theorem character_spanning {H : Type*} [AddCommGroup H] (m : ℕ)
    (v : Fin (m + 1) → H) :
    v = fun i => v (Fin.last m) +
      ∑ j : Fin m, blockTuple (m + 1) (j.val + 1) (v j.castSucc - v j.succ) 0 i := by
  sorry

/-! ## PH.1: the kernel multiplicity and the rank-nullity consequence -/

/-- PH.1: the coefficient c_n, using natural subtraction only after the stated bound. -/
def kernelMultiplicity (n : ℕ) : ℕ :=
  2 ^ n - (n * (n + 1) / 2 + 1)

/-- `kernelMultiplicity_bound`. -/
theorem kernelMultiplicity_bound (n : ℕ) (hn : 1 ≤ n) :
    n * (n + 1) / 2 + 1 ≤ 2 ^ n := by
  sorry

/-- `low_rank_zero`. -/
example : kernelMultiplicity 1 = 0 ∧ kernelMultiplicity 2 = 0 := by
  sorry

/-- `first_parameter`: c_3 = 1 and c_4 = 5 (the replacement 2n for 2^n would give 0 and 0). -/
example : kernelMultiplicity 3 = 1 ∧ kernelMultiplicity 4 = 5 := by
  sorry

/-- `rank_five_value`. -/
example : kernelMultiplicity 5 = 16 := by
  sorry

/-- `nonnegative_bound`: the bound is an equality at n = 1, with excess exactly one at n = 3. -/
example : 1 * (1 + 1) / 2 + 1 = 2 ^ 1 ∧ 3 * (3 + 1) / 2 + 1 + 1 = 2 ^ 3 := by
  sorry

/-- PH.1: rank-nullity once the actual comparison and its dimensions are supplied.
The spaces in this statement are ordinary Mathlib vector spaces, not stand-ins
defining the absent locally analytic or Robba categories. -/
theorem finrank_kernel_of_comparison_dimensions
    {E B Q : Type*} [Field E] [AddCommGroup B] [Module E B]
    [AddCommGroup Q] [Module E Q] [FiniteDimensional E B] [FiniteDimensional E Q]
    (n d : ℕ) (hn : 1 ≤ n) (t : B →ₗ[E] Q) (ht : Function.Surjective t)
    (hB : Module.finrank E B = n + (2 ^ n - 1) * d)
    (hQ : Module.finrank E Q = n + (n * (n + 1) / 2) * d) :
    Module.finrank E (LinearMap.ker t) = kernelMultiplicity n * d := by
  sorry

end TauCetiRoadmap.PadicHodgeParameters
