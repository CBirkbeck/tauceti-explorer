import Mathlib.Basic.Real.Basic
import Mathlib.LinearAlgebra.RootSystem.Hom
import Mathlib.LinearAlgebra.RootSystem.Finite.Lemmas
import TauCeti.LinearAlgebra.RootSystem.Positive
import TauCeti.LinearAlgebra.RootSystem.Chamber
import TauCeti.LinearAlgebra.RootSystem.DynkinType

/-!
# Integral dominance and finite folding: suggested target statements

This file is not the roadmap and is not exhaustive. The definitive document is
`research/blueprint/readmes/RootSystemsPartII.md`. These are proposed signatures,
not implemented mathematics. Discharging them finishes neither a layer nor the roadmap.

The compact shape prescribed by WORKERS.md keeps light definitions with real bodies,
endpoint theorems over existing carriers, and a few examples. The folded root-system
constructions, their full APIs, the fixed-Weyl-group comparison and lattice-transport
proofs are targets in the reader. They are not replaced by placeholder data here.
All theorem proofs and examples are goals; `sorry` is intentional.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/

namespace TauCetiRoadmap.RepresentationTheory.RootSystemsPartII

open scoped BigOperators

noncomputable section

variable {ι M N : Type*}
  [AddCommGroup M] [Module ℝ M] [AddCommGroup N] [Module ℝ N]
  (P : RootPairing ι ℝ M N) (b : P.Base)

/-! ## RS2.1: integral dominance on the existing cone -/

/-- Integral root dominance, as an explicit relation on the existing carrier.
For coroot dominance use the flipped pairing and flipped base. -/
def RootLE (x y : M) : Prop := y - x ∈ TauCeti.posRootCone P b

/-- The ordinary Stembridge step (Rapoport, Lemma 2.3, pp. 157–158).
Pointwise natural coroot values express dominant integrality without a new lattice. -/
theorem exists_dominant_root_step [Fintype ι] [P.IsCrystallographic] [P.IsReduced]
    {lam mu : M}
    (hlam : ∀ j ∈ b.support, ∃ n : ℕ, P.coroot' j lam = (n : ℝ))
    (hmu : ∀ j ∈ b.support, ∃ n : ℕ, P.coroot' j mu = (n : ℝ))
    (hle : RootLE P b lam mu) (hne : lam ≠ mu) :
    ∃ i : ι, b.IsPos i ∧
      (∀ j ∈ b.support, ∃ n : ℕ, P.coroot' j (lam + P.root i) = (n : ℝ)) ∧
      RootLE P b (lam + P.root i) mu ∧ lam ≠ lam + P.root i := by
  sorry

-- Empty bases give equality, including on carriers with extra central directions.
example (hempty : b.support = ∅) (x y : M) : RootLE P b x y ↔ x = y := by
  sorry

-- Literal compatibility with the pinned integral cone.
example (x y : M) :
    RootLE P b x y ↔ y - x ∈ TauCeti.posRootCone P b := by
  sorry

-- Translation preserves the relation; no global order instance is imposed on M.
example (x y z : M) : RootLE P b (x + z) (y + z) ↔ RootLE P b x y := by
  sorry

-- A rank-one coroot 2a retains its parity inside the ambient lattice.
example (i : ι) (a : M) (ha : a ≠ 0)
    (hsupport : b.support = {i}) (hroot : P.root i = (2 : ℕ) • a) :
    RootLE P b 0 ((2 : ℕ) • a) ∧ ¬ RootLE P b 0 a := by
  sorry

/-! ## RS2.2: one sum per distinct root orbit -/

/-- Sum over the finite SET of distinct iterates, rather than over a padded period.
This expression uses only the existing root-index permutation and root vectors. -/
def orbitSum [Fintype ι] (sig : P.Aut) (i : ι) : M := by
  classical
  exact ∑ j ∈ Finset.univ.filter
    (fun j => ∃ n : ℕ, ((sig.indexEquiv : ι → ι)^[n]) i = j), P.root j

example [Fintype ι] (i : ι) : orbitSum P (1 : P.Aut) i = P.root i := by
  sorry

example [Fintype ι] (sig : P.Aut) (i : ι) (hi : sig.indexEquiv i = i) :
    orbitSum P sig i = P.root i := by
  sorry

example [Fintype ι] (sig : P.Aut) (i : ι) :
    orbitSum P sig (sig.indexEquiv i) = orbitSum P sig i := by
  sorry

-- A genuine two-member orbit sums both members once (the A2 normalization test).
example [Fintype ι] (sig : P.Aut) (i : ι)
    (hperiod : sig.indexEquiv (sig.indexEquiv i) = i)
    (hne : sig.indexEquiv i ≠ i) :
    orbitSum P sig i = P.root i + P.root (sig.indexEquiv i) := by
  sorry

-- Exact period three, padded to six, doubles the distinct orbit sum (D4 triality).
example [Fintype ι] (sig : P.Aut) (i : ι)
    (hperiod : ((sig.indexEquiv : ι → ι)^[3]) i = i)
    (hne_one : sig.indexEquiv i ≠ i)
    (hne_two : ((sig.indexEquiv : ι → ι)^[2]) i ≠ i) :
    (∑ k ∈ Finset.range 6, P.root (((sig.indexEquiv : ι → ι)^[k]) i)) =
      (2 : ℕ) • orbitSum P sig i := by
  sorry

/-! ## RS2.3: the case split for based automorphisms

The folds themselves (orthogonal folds, adjacent A_(2n) -> B_n orbit-sum coordinates,
component-cycle return maps) are heavy constructions specified in the reader, so no
data definitions for them appear here. The case lemma that chooses between them is
statable on the existing carriers.
-/

/-- Simple orbits of a based automorphism of an irreducible system are orthogonal,
unless the type is `A_(2n)` (where the automorphism is then the reversal; see the reader). -/
theorem simpleOrbit_pairing_eq_zero_or_typeA_even [Fintype ι] [Nonempty ι]
    [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced] [P.IsIrreducible]
    (sig : P.Aut)
    (hbase : ∀ j, j ∈ b.support ↔ sig.indexEquiv j ∈ b.support) :
    (∀ i ∈ b.support, ∀ k : ℕ, ((sig.indexEquiv : ι → ι)^[k]) i ≠ i →
        P.pairing (((sig.indexEquiv : ι → ι)^[k]) i) i = 0) ∨
      ∃ n : ℕ, 1 ≤ n ∧ TauCeti.HasCartanType P b (.A (2 * n)) := by
  sorry

/-- A based automorphism of an irreducible system with a multiple edge is the identity. -/
theorem indexEquiv_eq_self_of_multiple_edge [Fintype ι] [Nonempty ι]
    [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced] [P.IsIrreducible]
    (sig : P.Aut)
    (hbase : ∀ j, j ∈ b.support ↔ sig.indexEquiv j ∈ b.support)
    (hmult : ∃ i ∈ b.support, ∃ j ∈ b.support,
      2 ≤ P.pairingIn ℤ i j * P.pairingIn ℤ j i ∧ i ≠ j) :
    ∀ i, sig.indexEquiv i = i := by
  sorry

/-! ## RS2.4: finite fold endpoint on its original carrier

The endpoint can already be stated without introducing a folded carrier.
-/

/-- The suitable orbit is existential. Its proof applies the ordinary step to the
folded system AFTER checking integral cone/chamber transport, including adjacent A.
The spanning hypothesis is kept in this first endpoint. -/
theorem exists_dominant_orbit_step [Fintype ι]
    [P.IsRootSystem] [P.IsCrystallographic] [P.IsReduced]
    (sig : P.Aut)
    (hbase : ∀ j, j ∈ b.support ↔ sig.indexEquiv j ∈ b.support)
    {lam mu : M}
    (hfix_lam : sig.weightMap lam = lam) (hfix_mu : sig.weightMap mu = mu)
    (hlam : ∀ j ∈ b.support, ∃ n : ℕ, P.coroot' j lam = (n : ℝ))
    (hmu : ∀ j ∈ b.support, ∃ n : ℕ, P.coroot' j mu = (n : ℝ))
    (hle : RootLE P b lam mu) (hne : lam ≠ mu) :
    ∃ i : ι, b.IsPos i ∧
      orbitSum P sig i ≠ 0 ∧
      sig.weightMap (lam + orbitSum P sig i) = lam + orbitSum P sig i ∧
      (∀ j ∈ b.support, ∃ n : ℕ,
        P.coroot' j (lam + orbitSum P sig i) = (n : ℝ)) ∧
      RootLE P b (lam + orbitSum P sig i) mu ∧
      RootLE P b lam (lam + orbitSum P sig i) := by
  sorry

/-- Ambient export: retains a specified lattice L and all central directions.
The proof projects to the real root span only internally and adds the actual
root-orbit increment back to lam. For cocharacters instantiate with P.flip. -/
theorem exists_dominant_orbit_step_in_lattice [Fintype ι]
    [FiniteDimensional ℝ M] [FiniteDimensional ℝ N]
    [P.IsCrystallographic] [P.IsReduced]
    (sig : P.Aut)
    (hbase : ∀ j, j ∈ b.support ↔ sig.indexEquiv j ∈ b.support)
    (L : AddSubgroup M) (hroots : ∀ i, P.root i ∈ L)
    (hstable : ∀ x ∈ L, sig.weightMap x ∈ L)
    {lam mu : M} (hlamL : lam ∈ L) (hmuL : mu ∈ L)
    (hfix_lam : sig.weightMap lam = lam) (hfix_mu : sig.weightMap mu = mu)
    (hlam : ∀ j ∈ b.support, ∃ n : ℕ, P.coroot' j lam = (n : ℝ))
    (hmu : ∀ j ∈ b.support, ∃ n : ℕ, P.coroot' j mu = (n : ℝ))
    (hle : RootLE P b lam mu) (hne : lam ≠ mu) :
    ∃ i : ι, b.IsPos i ∧
      orbitSum P sig i ≠ 0 ∧ lam + orbitSum P sig i ∈ L ∧
      sig.weightMap (lam + orbitSum P sig i) = lam + orbitSum P sig i ∧
      (∀ j ∈ b.support, ∃ n : ℕ,
        P.coroot' j (lam + orbitSum P sig i) = (n : ℝ)) ∧
      RootLE P b (lam + orbitSum P sig i) mu ∧
      RootLE P b lam (lam + orbitSum P sig i) := by
  sorry

end

end TauCetiRoadmap.RepresentationTheory.RootSystemsPartII
