import Mathlib

/-!
# p-adic Hodge parameters in locally analytic representations

Target signatures, not an implementation. The companion reader contains every target,
hypothesis, API and test. The genuine locally analytic Ext category and the noncritical
Robba deformation spaces are not present at the pinned libraries. In particular this
file does not replace them by arbitrary vector spaces or an axiomatic structure.

Only the endpoint permutations, the corrected character-spanning identity and the
numerical kernel calculation have carriers at the pins. The last theorem is the
linear-algebra consequence of the two dimension inputs, not Ding's comparison theorem.
Source: Ding, Publ. Math. IHÉS 142 (2025), Theorem 3.21 and Remark 3.22, pp. 48–50.
-/

namespace TauCetiRoadmap.PadicHodgeParameters

open scoped BigOperators

/-- PH.0: permutations placing the final parameter last. Here n = m + 1. -/
def endRefinements (m : ℕ) : Set (Equiv.Perm (Fin (m + 1))) :=
  {w | w (Fin.last m) = Fin.last m}

/-- PH.0: permutations placing the final parameter first; the image, not inverse image. -/
def startRefinements (m : ℕ) : Set (Equiv.Perm (Fin (m + 1))) :=
  {w | w (Fin.last m) = 0}

theorem endpoint_card (m : ℕ) :
    Nat.card {w : Equiv.Perm (Fin (m + 1)) // w ∈ endRefinements m} = m.factorial ∧
    Nat.card {w : Equiv.Perm (Fin (m + 1)) // w ∈ startRefinements m} = m.factorial := by
  sorry

example : Equiv.refl (Fin 1) ∈ endRefinements 0 ∧
    Equiv.refl (Fin 1) ∈ startRefinements 0 := by
  sorry

example : Equiv.refl (Fin 2) ∈ endRefinements 1 ∧
    Equiv.refl (Fin 2) ∉ startRefinements 1 := by
  sorry

example : Nat.card {w : Equiv.Perm (Fin 3) // w ∈ startRefinements 2} = 2 := by
  sorry

/-- PH.0: the tuple pulled back from two block determinants. -/
def blockTuple {H : Type*} (n j : ℕ) (a b : H) : Fin n → H :=
  fun i => if i.val < j then a else b

example {H : Type*} (n : ℕ) (a b : H) :
    blockTuple n 0 a b = fun _ => b := by
  sorry

example {H : Type*} (n : ℕ) (a b : H) :
    blockTuple n n a b = fun _ => a := by
  sorry

example {H : Type*} (a b : H) : blockTuple 3 1 a b 0 = a ∧
    blockTuple 3 1 a b 1 = b ∧ blockTuple 3 1 a b 2 = b := by
  sorry

/-- PH.0: telescoping supplies the spanning consequence needed in place of (3.43).
The overlapping block subspaces are not asserted to form a direct sum. -/
theorem character_spanning {H : Type*} [AddCommGroup H] (m : ℕ)
    (v : Fin (m + 1) → H) :
    v = fun i => v (Fin.last m) +
      ∑ j : Fin m, blockTuple (m + 1) (j.val + 1) (v j.castSucc - v j.succ) 0 i := by
  sorry

/-- PH.1: the coefficient c_n, using natural subtraction only after the stated bound. -/
def kernelMultiplicity (n : ℕ) : ℕ :=
  2 ^ n - (n * (n + 1) / 2 + 1)

theorem kernelMultiplicity_bound (n : ℕ) (hn : 1 ≤ n) :
    n * (n + 1) / 2 + 1 ≤ 2 ^ n := by
  sorry

example : kernelMultiplicity 1 = 0 ∧ kernelMultiplicity 2 = 0 := by
  sorry

example : kernelMultiplicity 3 = 1 ∧ kernelMultiplicity 4 = 5 := by
  sorry

example : kernelMultiplicity 5 = 16 := by
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
