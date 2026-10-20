import Mathlib

/-!
# MotivicEtaleKTheoryPartII: representative target signatures

This file is not the roadmap: `README.md` (the reader document of this roadmap) is definitive,
and this file is not exhaustive. It records, in suggested Lean form, the light definitions and
the statements of the roadmap whose carriers already exist in Mathlib at the pinned commit, so
that contributors and reviewers converge on names and signatures. Proofs marked `sorry` are
targets.

Design choices made explicit here:

* Weights and dual twists are integers: a motive `h^i(X)(j)` has weight `i - 2 * j`, and its
  dual `M^*(1)` is `h^(2d - i)(X)(d + 1 - j)`, of weight `-2 - (i - 2 * j)`.
* For the Artin motive `h⁰(Spec F)(r)` the dimension of the Betti plus part depends only on the
  parity of `r`: it is `r₁ + r₂` for even `r` and `r₂` for odd `r`, because the infinity
  involution acts on `ℚ(r)` by `(-1)^r`. The dimension of the motivic factor `H¹_f` is `r₂`,
  `r₁ + r₂` or `r₁ + r₂ - 1` (Borel and Dirichlet). The identity between them is the dimension
  shadow of real exactness for Artin motives.
* The integral clause of the Tamagawa condition is generation of a lattice: an element of a line
  can be a rational basis without generating the integral lattice.

The K-theoretic factors, the regulator sequence, the comparisons `ϑ_∞`, `ϑ_p` and the Tamagawa
condition are README targets: their carriers (higher K-groups of schemes, Deligne cohomology,
Bloch–Kato Selmer complexes, determinant functors of perfect complexes) are not in Mathlib or
Tau Ceti at the pins.
-/

namespace TauCetiRoadmap.MotivicEtaleKTheoryPartII

open NumberField NumberField.InfinitePlace Filter Topology

/-! ## Layer 1: motivic factors of K-theoretic motives -/

section Weights

/-- The weight `w = i - 2 j` of `h^i(X)(j)`. -/
def motiveWeight (i j : ℤ) : ℤ := i - 2 * j

/-- The cohomological degree `2d - i` of the dual datum `M^*(1)`. -/
def dualDegree (d i : ℤ) : ℤ := 2 * d - i

/-- The twist `d + 1 - j` of the dual datum `M^*(1)`. -/
def dualTwist (d j : ℤ) : ℤ := d + 1 - j

/-- The dual datum has weight `-2 - w` (Layer 1.1, `KTheoreticMotive.dualTwist`). -/
theorem motiveWeight_dual (d i j : ℤ) :
    motiveWeight (dualDegree d i) (dualTwist d j) = -2 - motiveWeight i j := by
  unfold motiveWeight dualDegree dualTwist
  ring

/-- Dualizing twice returns the datum (`dualTwist_dualTwist`). -/
theorem dualDegree_dualTwist_involutive (d i j : ℤ) :
    dualDegree d (dualDegree d i) = i ∧ dualTwist d (dualTwist d j) = j := by
  unfold dualDegree dualTwist
  constructor <;> ring

/-- `h¹(E)(1)` has weight `-1` and is its own dual datum (`weight_elliptic_center`). -/
example : motiveWeight 1 1 = -1 ∧ dualDegree 1 1 = 1 ∧ dualTwist 1 1 = 1 := by
  refine ⟨?_, ?_, ?_⟩ <;> rfl

/-- `ℚ(2)` has weight `-4`; its dual datum `ℚ(-1)` has weight `2` (`weight_tate_two`). -/
example : motiveWeight 0 2 = -4 ∧ motiveWeight (dualDegree 0 0) (dualTwist 0 2) = 2 := by
  refine ⟨?_, ?_⟩ <;> rfl

end Weights

section ArtinRanks

variable (K : Type*) [Field K] [NumberField K]

/-- The dimension of the Betti plus part `B⁺(h⁰(Spec K)(r))`: `r₁ + r₂` for even `r` and `r₂`
for odd `r` (Layer 2.1; Huber–Kings §1.1). -/
noncomputable def tatePlusDim (r : ℤ) : ℕ :=
  if Even r then nrRealPlaces K + nrComplexPlaces K else nrComplexPlaces K

/-- The dimension of the motivic factor `H¹_f(h⁰(Spec K)(r))` (Layer 1.4): Dirichlet's rank in
twist one, Borel's ranks in twists at least two, and zero in twists at most zero. -/
noncomputable def artinFactorRank (r : ℤ) : ℕ :=
  if r = 1 then Units.rank K
  else if 2 ≤ r then (if Even r then nrComplexPlaces K else nrRealPlaces K + nrComplexPlaces K)
  else 0

/-- In twists `r ≥ 2` the factor rank is the dimension `[K:ℚ] - dim B⁺` of the cokernel of the
period map `α`: the dimension shadow of `realExactness_artin` (Layer 2.4). -/
theorem artinFactorRank_add_tatePlusDim {r : ℤ} (hr : 2 ≤ r) :
    artinFactorRank K r + tatePlusDim K r = Module.finrank ℚ K := by
  have h := card_add_two_mul_card_eq_rank K
  unfold artinFactorRank tatePlusDim
  split_ifs <;> omega

/-- In twist one the sequence `0 → H¹_f ⊗ ℝ → coker α → H⁰_f(h⁰(K))^* ⊗ ℝ → 0` has a
one-dimensional last term (Layer 2.4, Dirichlet). -/
theorem artinFactorRank_one_add :
    artinFactorRank K 1 + 1 + tatePlusDim K 1 = Module.finrank ℚ K := by
  have h := card_add_two_mul_card_eq_rank K
  have hc := card_eq_nrRealPlaces_add_nrComplexPlaces K
  have hpos : 0 < Fintype.card (InfinitePlace K) := Fintype.card_pos
  have hodd : ¬ Even (1 : ℤ) := by decide
  unfold artinFactorRank tatePlusDim Units.rank
  split_ifs <;> omega

/-- For `ℚ` the factor `H¹_f(ℚ(3)) = K₅(ℤ) ⊗ ℚ` is one-dimensional and `H¹_f(ℚ(2))` vanishes
(`motivicFactorOne_tate`). -/
theorem artinFactorRank_rat :
    artinFactorRank ℚ 3 = 1 ∧ artinFactorRank ℚ 2 = 0 := by
  sorry

end ArtinRanks

/-! ## Layer 2: real regulators and the fundamental-line real comparison

The real Deligne complex, the Beilinson regulator sequence, the predicate `RealExactness` and the
comparison `fundamentalLineRealComparison` are README targets. -/

/-! ## Layer 3: p-adic realizations and the fundamental-line p-adic comparison

The maps `padicRealizationZero`, `padicRealizationOne`, the predicate `PadicRealizationIso`, the
Selmer complexes of Artin motives and `fundamentalLinePadicComparison` are README targets. -/

/-! ## Layer 4: zeta elements, the Tamagawa condition and its proved cases -/

section Generators

/-- An element `x` generates the lattice `L` of a module: the integral clause of
`TamagawaCondition` (Layer 4.1). -/
def IsLatticeGenerator {R V : Type*} [CommRing R] [AddCommGroup V] [Module R V]
    (L : Submodule R V) (x : V) : Prop :=
  Submodule.span R {x} = L

variable (p : ℕ) [Fact p.Prime]

/-- `1` generates the standard lattice `ℤ_p · 1` in `ℚ_p`. -/
example : IsLatticeGenerator (Submodule.span ℤ_[p] {(1 : ℚ_[p])}) 1 := rfl

/-- `p` is a rational basis of `ℚ_p` but does not generate the lattice `ℤ_p · 1`
(`tamagawaCondition_rational_not_integral`). -/
example : ¬ IsLatticeGenerator (Submodule.span ℤ_[p] {(1 : ℚ_[p])}) (p : ℚ_[p]) := by
  intro h
  have h1 : (1 : ℚ_[p]) ∈ Submodule.span ℤ_[p] {(p : ℚ_[p])} := by
    rw [h]; exact Submodule.mem_span_singleton_self 1
  obtain ⟨a, ha⟩ := Submodule.mem_span_singleton.mp h1
  have hnorm : ‖(a : ℚ_[p]) * (p : ℚ_[p])‖ < 1 := by
    rw [norm_mul, Padic.norm_p]
    have ha1 : ‖(a : ℚ_[p])‖ ≤ 1 := a.norm_le_one
    have hp : (1 : ℝ) < p := by exact_mod_cast (Fact.out : p.Prime).one_lt
    have hpinv : (p : ℝ)⁻¹ < 1 := inv_lt_one_of_one_lt₀ hp
    calc ‖(a : ℚ_[p])‖ * (p : ℝ)⁻¹ ≤ 1 * (p : ℝ)⁻¹ := by
          gcongr
      _ < 1 := by simpa using hpinv
  have h2 : (a : ℚ_[p]) * (p : ℚ_[p]) = 1 := by simpa [Algebra.smul_def] using ha
  rw [h2, norm_one] at hnorm
  exact lt_irrefl _ hnorm

end Generators

section ClassNumber

variable (K : Type*) [Field K] [NumberField K]

/-- The leading coefficient at `s = 0` of `L(h⁰(Spec K)(1), s) = ζ_K(s + 1)` is the residue of
`ζ_K` at `s = 1` (Layer 4.4, the analytic input of the class number formula case in twist one;
Mathlib `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`). -/
theorem tendsto_mul_dedekindZeta_one_add :
    Tendsto (fun s : ℝ ↦ (s : ℂ) * dedekindZeta K (1 + s)) (𝓝[>] 0)
      (𝓝 (dedekindZeta_residue K)) := by
  sorry

end ClassNumber

/-!
## Targets stated in the README only

Layer 1: `KTheoreticMotive`, `motivicFactorZero`, `motivicFactorOne` and their API, `weight_vanishing`,
`artinMotiveFactors`, `ellipticMotiveFactors`.
Layer 2: `delignePeriodMap` and its API, `cycleClassReal`, `beilinsonRegulatorReal`,
`heightPairingReal`, `RealExactness`, `realExactness_artin`, `realExactness_elliptic`,
`fundamentalLineRealComparison` and its API.
Layer 3: `padicRealizationZero`, `padicRealizationOne`, `PadicRealizationIso`,
`padicRealization_artin`, `padicRealization_elliptic`, `selmerComplex_artin`,
`fundamentalLinePadicComparison` and its API.
Layer 4: `tamagawaElement`, `TamagawaCondition` and its API, `tamagawaCondition_iff_etnc`,
`tamagawaCondition_alternative_forms`, `tamagawaCondition_classNumber`,
`tamagawaCondition_iff_lichtenbaum`, `ellipticFundamentalLine_data`.
-/

end TauCetiRoadmap.MotivicEtaleKTheoryPartII
