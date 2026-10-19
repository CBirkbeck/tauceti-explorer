import Mathlib.GroupTheory.Perm.Cycle.Type
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.Topology.Instances.Complex
import Mathlib.RepresentationTheory.Homological.GroupCohomology.FiniteCyclic
import Mathlib.Tactic
import TauCeti.Topology.Homotopy.HomotopyGroup.LoopSpace

/-!
# Algebraic topology, Part II: selected signatures

This file is not the roadmap and is not exhaustive.
The reader AlgebraicTopologyPartII.md is authoritative for all 75 targets.
These suggested forms help contributors and reviewers converge on names and signatures.
This file contains light definitions on existing carriers, a few milestones
statable at the pins, and discriminating examples. It does not construct
semialgebraic sites, equivariant supported cohomology, rational minimal models,
Gysin maps or ramified-cover derived objects. Their full contracts and proof
obligations are in the reader and packet. No assertion below encodes a missing
construction as an assumption that already states its conclusion.

Sources: Browning–Sawin, Definition 7.3 and Lemmas 7.4–7.6, pp.941–945;
Benoist, (2.6), p.73, corrected Lemma 7.3, pp.98–99, and
(7.7)–(7.9), pp.99–100. Independent design review: REV-DESIGN-AlgebraicTopologyPartII. The pinned cyclic
resolution and Tau Ceti's loop-space shifts are reused.
-/

noncomputable section
open scoped BigOperators

namespace AlgebraicTopologyPartII

/-! ## AT2.1: native topological configuration carrier -/

/-- Ordered configurations, before the permutation quotient. -/
def OrderedConfiguration (m : ℕ) (X : Type*) :=
  {x : Fin m → X // Function.Injective x}

/-- The convention is the left action by inverse reindexing. -/
def reindex {m : ℕ} {X : Type*} (σ : Equiv.Perm (Fin m))
    (x : OrderedConfiguration m X) : OrderedConfiguration m X :=
  ⟨x.1 ∘ σ.symm, x.2.comp σ.symm.injective⟩

/-- A layer milestone over the existing finite-product topology. -/
theorem orderedConfiguration_isOpen (m : ℕ) (X : Type*)
    [TopologicalSpace X] [T2Space X] :
    IsOpen {x : Fin m → X | Function.Injective x} := by sorry

/-- Finite Hausdorff configurations have free reindexing action. -/
theorem reindex_eq_self_iff {m : ℕ} {X : Type*}
    (σ : Equiv.Perm (Fin m)) (x : OrderedConfiguration m X) :
    reindex σ x = x ↔ σ = 1 := by sorry

example (X : Type*) : Nonempty (OrderedConfiguration 0 X) :=
  ⟨⟨Fin.elim0, fun i => Fin.elim0 i⟩⟩

example (X : Type*) (x : OrderedConfiguration 1 X) : reindex 1 x = x := by
  cases x
  rfl

example : IsEmpty (OrderedConfiguration 2 (Fin 1)) := by
  refine ⟨fun x => ?_⟩
  have h : (0 : Fin 2) = 1 := x.2 (Subsingleton.elim _ _)
  exact (by decide : (0 : Fin 2) ≠ 1) h

/-! ## AT2.2: full cycle counts include fixed points -/

/-- Mathlib's `cycleType` omits length-one cycles; add the fixed points. -/
def fullCycleCount {α : Type*} [Fintype α] [DecidableEq α]
    (σ : Equiv.Perm α) : ℕ :=
  σ.cycleType.card + Fintype.card {a : α // σ a = a}

example (m : ℕ) : fullCycleCount (1 : Equiv.Perm (Fin m)) = m := by
  simp [fullCycleCount]

example : fullCycleCount (Equiv.swap (0 : Fin 3) 1) = 2 := by sorry

example : fullCycleCount (1 : Equiv.Perm (Fin 0)) = 0 := by
  simp [fullCycleCount]

/-! ## AT2.3: integer numerator and rational Euler coefficient

These are arithmetic helpers on native carriers. The integer Euler-exponent
construction, formal product, integrality proof and its API remain README
targets; the rational helper is not a substitute for that construction.
-/

/-- The signed Möbius sum for positive r. The value at zero is unused. -/
def signedWittNumerator (n N r : ℕ) : ℤ :=
  ∑ a ∈ r.divisors, ArithmeticFunction.moebius a *
    (((-1 : ℤ) ^ n * (N : ℤ)) ^ (r / a))

/-- The rational expression in BS (7.2), with its leading minus sign. -/
def eulerCoefficient (n N r : ℕ) : ℚ :=
  -(signedWittNumerator n N r : ℚ) / (r : ℚ)

/-- Integrality is a theorem, not a field inserted into a data structure. -/
theorem signedWittNumerator_dvd (n N r : ℕ) (hr : 0 < r) :
    (r : ℤ) ∣ signedWittNumerator n N r := by sorry

example : eulerCoefficient 4 2 1 = -2 := by
  norm_num [eulerCoefficient, signedWittNumerator]

example : eulerCoefficient 4 2 2 = -1 := by
  have hd : (2 : ℕ).divisors = {1, 2} := by decide
  norm_num [eulerCoefficient, signedWittNumerator, hd,
    ArithmeticFunction.moebius_apply_prime Nat.prime_two]

example : eulerCoefficient 3 1 1 = 1 := by
  norm_num [eulerCoefficient, signedWittNumerator]

example : eulerCoefficient 3 1 2 = -1 := by
  have hd : (2 : ℕ).divisors = {1, 2} := by decide
  norm_num [eulerCoefficient, signedWittNumerator, hd,
    ArithmeticFunction.moebius_apply_prime Nat.prime_two]

/-! ## AT2.7: comparison with the pinned periodic resolution -/

/-- Pinned cyclic differential scalar for sign coefficients. -/
def cyclicSignDifferential (j q : ℕ) : ℤ :=
  if Even q then (-1 : ℤ) ^ j - 1 else 1 + (-1 : ℤ) ^ j

/-- The 1−σ convention of Benoist (2.6). -/
def paperSignDifferential (j q : ℕ) : ℤ :=
  if Even q then 1 - (-1 : ℤ) ^ j else 1 + (-1 : ℤ) ^ j

/-- A genuine degreewise scalar, not a new projective resolution. -/
def conventionScalar (q : ℕ) : ℤ := (-1) ^ (q * (q + 1) / 2)

theorem periodic_convention (j q : ℕ) :
    conventionScalar (q + 1) * cyclicSignDifferential j q =
      paperSignDifferential j q * conventionScalar q := by sorry

example : (conventionScalar 0, conventionScalar 1,
    conventionScalar 2, conventionScalar 3) = (1, -1, -1, 1) := by
  norm_num [conventionScalar]

example : cyclicSignDifferential 1 0 = -2 ∧
    paperSignDifferential 1 0 = 2 := by
  norm_num [cyclicSignDifferential, paperSignDifferential]

example : cyclicSignDifferential 1 1 = 0 := by
  norm_num [cyclicSignDifferential]

/-! ## AT2.15: two arithmetic checks of the trace and cyclic conventions -/

/-- Trace-zero operator on the native permutation module, before descent. -/
def traceZeroVector {n : ℕ} (a : Fin n → ℤ) : Fin n → ℤ :=
  fun i => (∑ j, a j) - (n : ℤ) * a i

theorem trace_traceZeroVector {n : ℕ} (a : Fin n → ℤ) :
    ∑ i, traceZeroVector a i = 0 := by sorry

/-- The scalar on H² under reduction, when n is even. H¹ has scalar one. -/
def degreeTwoReductionScalar (n : ℕ) : ZMod 2 := (n / 2 : ℕ)

example : degreeTwoReductionScalar 2 = 1 := by decide
example : degreeTwoReductionScalar 4 = 0 := by decide
example : degreeTwoReductionScalar 6 = 1 := by decide

example : traceZeroVector (![1, 0, 0, 0] : Fin 4 → ℤ) = ![-3, 1, 1, 1] := by
  ext i
  fin_cases i <;> norm_num [traceZeroVector, Fin.sum_univ_succ]

/-- Degree-four regression for B19 Lemma 7.3: with η=0 and φζ=1,
`a=−1` reduces to 3. The negative trace-zero lift has this reduction;
the printed positive lift has reduction 1. -/
example :
    ((-(traceZeroVector (![1, 0, 0, 0] : Fin 4 → ℤ) 0) : ℤ) : ZMod 4) = 3 ∧
    ((traceZeroVector (![1, 0, 0, 0] : Fin 4 → ℤ) 0 : ℤ) : ZMod 4) ≠ 3 := by
  norm_num [traceZeroVector, Fin.sum_univ_succ]; decide

/-! ## AT2.4–AT2.5: reuse of the existing homotopy shift

These are checks of imported interfaces, not newly planned shift theorems.
The tame-fibre, join, rational-rank and full Betti-series statements require
the README carriers and cannot honestly be stated here by postulating them.
-/

open scoped Topology.Homotopy

example (X : Type*) [TopologicalSpace X] (x : X) :
    Nonempty (ZerothHomotopy (GenLoop (Fin 2) X x) ≃
      HomotopyGroup (Fin 2) X x) :=
  ⟨HomotopyGroup.zerothHomotopyEquiv⟩

example (X : Type*) [TopologicalSpace X] (x : X) :
    Nonempty (HomotopyGroup.Pi 1 (GenLoop (Fin 2) X x) GenLoop.const ≃*
      HomotopyGroup.Pi 3 X x) :=
  ⟨HomotopyGroup.piLoopSpaceMulEquiv 0 2⟩

end AlgebraicTopologyPartII
