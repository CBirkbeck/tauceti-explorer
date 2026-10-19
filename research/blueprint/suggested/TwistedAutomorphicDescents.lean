import Mathlib.Combinatorics.Enumerative.Partition.Basic

/-!+# Twisted automorphic descents: suggested arithmetic interface

The reader carries the full eight-layer mathematical plan. At the pinned libraries,
automorphic Fourier images, residual packets and zeta operators lack their required
carriers. They are reader targets, without proxy structures in this file.

These two light definitions use existing natural numbers and `Nat.Partition`.
Theorems are proposed API signatures; examples check concrete computations.
The README is definitive; this file suggests forms rather than an exhaustive
checklist of declarations or a prescribed implementation.
Source: Jiang–Zhang, Annals 191 (2020), (2.9), pp.755–756; (5.8)–(5.9), p.785;
(6.7)–(6.8), pp.800–801. Statements are in our own words.
-/

namespace TauCeti.AutomorphicDescent

/-- The Bessel partition with one odd part and the remaining parts equal to one.
Admissibility of a rational Bessel datum is a separate geometric requirement. -/
def besselPartition (d ell : ℕ) (h : 2 * ell + 1 ≤ d) : Nat.Partition d :=
  Nat.Partition.ofSums d
    ((2 * ell + 1) ::ₘ Multiset.replicate (d - (2 * ell + 1)) 1)
    (by simpa using Nat.add_sub_of_le h)

/-- TAD.0: exact parts, including the repeated-one case at index zero. -/
theorem besselPartition_parts (d ell : ℕ) (h : 2 * ell + 1 ≤ d) :
    (besselPartition d ell h).parts =
      (2 * ell + 1) ::ₘ Multiset.replicate (d - (2 * ell + 1)) 1 := by
  sorry

/-- TAD.0: the sum is the actual form dimension. -/
theorem besselPartition_sum (d ell : ℕ) (h : 2 * ell + 1 ≤ d) :
    (besselPartition d ell h).parts.sum = d := by
  sorry

/-- TAD.0: the number of parts is dimension minus twice the index. -/
theorem besselPartition_card (d ell : ℕ) (h : 2 * ell + 1 ≤ d) :
    (besselPartition d ell h).parts.card = d - 2 * ell := by
  sorry

/-- TAD.0: index zero is the all-ones partition, without an assertion about its group. -/
theorem besselPartition_zero (d : ℕ) (h : 1 ≤ d) :
    (besselPartition d 0 h).parts = Multiset.replicate d 1 := by
  sorry

example : (besselPartition 5 1 (by decide)).parts = ({3, 1, 1} : Multiset ℕ) := by
  decide

example : (besselPartition 3 0 (by decide)).parts = ({1, 1, 1} : Multiset ℕ) := by
  decide

example : ¬ (2 * (2 : ℕ) + 1 ≤ 4) := by
  decide

/-- The arithmetic critical index; the geometric construction requires `j < a`. -/
def criticalIndex (a j : ℕ) : ℕ := a - j - 1

/-- TAD.5: no subtraction is truncated in the valid domain. -/
theorem criticalIndex_add (a j : ℕ) (h : j < a) :
    criticalIndex a j + j + 1 = a := by
  sorry

/-- TAD.5: the smallest valid inducing rank gives index zero. -/
theorem criticalIndex_minimal (j : ℕ) : criticalIndex (j + 1) j = 0 := by
  sorry

/-- TAD.5: increasing the inducing rank increases the critical index. -/
theorem criticalIndex_succ (a j : ℕ) (h : j < a) :
    criticalIndex (a + 1) j = criticalIndex a j + 1 := by
  sorry

/-- TAD.0/TAD.5 dimension milestone: the prescribed stabilizer has dimension `d`. -/
theorem critical_stabilizer_dimension (a j m d : ℕ)
    (h : j < a) (hd : d = m + 2 * j + 1) :
    2 * a + m = 2 * criticalIndex a j + 1 + d := by
  sorry

/-- The critical partition has exactly `d` repeated ones. -/
theorem critical_partition_parts (a j m d : ℕ)
    (h : j < a) (hd : d = m + 2 * j + 1)
    (hp : 2 * criticalIndex a j + 1 ≤ 2 * a + m) :
    (besselPartition (2 * a + m) (criticalIndex a j) hp).parts =
      (2 * criticalIndex a j + 1) ::ₘ Multiset.replicate d 1 := by
  sorry

example : criticalIndex 4 1 = 2 := by decide
example : criticalIndex 6 2 = 3 := by decide
example : criticalIndex 1 2 + 2 + 1 ≠ 1 := by decide

end TauCeti.AutomorphicDescent
