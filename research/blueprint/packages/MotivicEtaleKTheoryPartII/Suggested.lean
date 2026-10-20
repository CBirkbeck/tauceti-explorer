import Mathlib
import TauCeti.Geometry.Hodge.Structure

/-!
# MotivicEtaleKTheoryPartII: representative target signatures

This file is not the roadmap: `README.md` is definitive, and this file is not exhaustive. It
records, in suggested Lean form, the light definitions and the statements of the roadmap whose
carriers already exist in Mathlib and Tau Ceti at the pinned commits, so that contributors and
reviewers converge on names and signatures. Docstrings cite the subsections of the README as §k.n.

Design choices made explicit here:

* Weights and dual twists are integers: a motive `h^i(X)(j)` has weight `i - 2 * j`, and its dual
  datum `M^*(1)` is `h^(2d - i)(X)(d + 1 - j)`, of weight `-2 - (i - 2 * j)` (§1.1).
* For the Artin motive `h⁰(Spec K)(r)` the dimension of the Betti plus part depends only on the
  parity of `r`: it is `r₁ + r₂` for even `r` and `r₂` for odd `r`, because the infinity
  involution acts on `ℚ(r)` by `(-1)^r`. The dimension of the motivic factor `H¹_f` is `r₂`,
  `r₁ + r₂` or `r₁ + r₂ - 1` (Borel and Dirichlet); the identities between them are the
  dimension counts of real exactness for Artin motives (§§1.4, 2.4).
* The kernel and cokernel of the period map `α_M` are controlled by the weight `n` of the Hodge
  structure: `F⁰ ⊓ conj F⁰ = ⊥` for `n < 0` and `F⁰ ⊔ conj F⁰ = ⊤` for `n ≥ -1`, both read off
  from the opposedness of Tau Ceti's `HodgeStructureOn` (§2.1).
* The leading coefficient at `s = 0` of `L(h⁰(Spec K)(1), s) = ζ_K(1 + s)` is the residue of `ζ_K`
  at `s = 1`; the statement is made along the reals, where Mathlib's `dedekindZeta` is the ideal
  `L`-series (§4.4).

The motive datum, the motivic factors, the regulator sequence, the comparisons `ϑ_∞` and `ϑ_p`,
the Selmer complexes and the Tamagawa condition are README targets: their carriers (higher Chow
groups, Deligne and continuous étale cohomology of varieties, Bloch–Kato Selmer complexes,
determinants of perfect complexes) are not in Mathlib or Tau Ceti at the pins.
-/

namespace TauCetiRoadmap.MotivicEtaleKTheoryPartII

open NumberField NumberField.InfinitePlace Filter Topology

/-! ## Layer 1: motivic factors of K-theoretic motives -/

section Weights

/-- The weight `w = i - 2 j` of `h^i(X)(j)` (§1.1, `KTheoreticMotive.weight`). -/
def motiveWeight (i j : ℤ) : ℤ := i - 2 * j

/-- The cohomological degree `2d - i` of the dual datum `M^*(1)` (§1.1). -/
def dualDegree (d i : ℤ) : ℤ := 2 * d - i

/-- The twist `d + 1 - j` of the dual datum `M^*(1)` (§1.1); the untwisted dual would use
`d - j` and have weight `-w` instead of `-2 - w`. -/
def dualTwist (d j : ℤ) : ℤ := d + 1 - j

/-- The dual datum has weight `-2 - w` (§1.1, `motiveWeight_dual`). -/
theorem motiveWeight_dual (d i j : ℤ) :
    motiveWeight (dualDegree d i) (dualTwist d j) = -2 - motiveWeight i j := by
  unfold motiveWeight dualDegree dualTwist
  ring

/-- Dualizing twice returns the degree and the twist (§1.1; the README Check `dualTwist_dualTwist`). -/
theorem dualDegree_dualTwist_involutive (d i j : ℤ) :
    dualDegree d (dualDegree d i) = i ∧ dualTwist d (dualTwist d j) = j := by
  unfold dualDegree dualTwist
  constructor <;> ring

/-- `h¹(E)(1)` has weight `-1` and is its own dual datum (§1.1, `weight_elliptic_center`). -/
example : motiveWeight 1 1 = -1 ∧ dualDegree 1 1 = 1 ∧ dualTwist 1 1 = 1 := by
  refine ⟨?_, ?_, ?_⟩ <;> rfl

/-- `ℚ(2)` has weight `-4`; its dual datum `ℚ(-1)` has weight `2` (§1.1, `weight_tate_two`). -/
example : motiveWeight 0 2 = -4 ∧ motiveWeight (dualDegree 0 0) (dualTwist 0 2) = 2 := by
  refine ⟨?_, ?_⟩ <;> rfl

end Weights

section ArtinRanks

variable (K : Type*) [Field K] [NumberField K]

/-- The dimension of the Betti plus part `B⁺(h⁰(Spec K)(r))`: `r₁ + r₂` for even `r` and `r₂`
for odd `r` (§1.4, `tatePlusDim`; Huber–Kings §1.1). -/
noncomputable def tatePlusDim (r : ℤ) : ℕ :=
  if Even r then nrRealPlaces K + nrComplexPlaces K else nrComplexPlaces K

/-- The dimension of the motivic factor `H¹_f(h⁰(Spec K)(r))` (§1.4, `artinFactorRank`):
Dirichlet's rank in twist one, Borel's ranks in twists at least two, and zero in twists at most
zero. -/
noncomputable def artinFactorRank (r : ℤ) : ℕ :=
  if r = 1 then Units.rank K
  else if 2 ≤ r then (if Even r then nrComplexPlaces K else nrRealPlaces K + nrComplexPlaces K)
  else 0

/-- In twists `r ≥ 2` the factor rank is the dimension `[K:ℚ] - dim B⁺` of the cokernel of the
period map `α`: the dimension count of `realExactness_artin` (§§1.4, 2.4). -/
theorem artinFactorRank_add_tatePlusDim {r : ℤ} (hr : 2 ≤ r) :
    artinFactorRank K r + tatePlusDim K r = Module.finrank ℚ K := by
  have h := card_add_two_mul_card_eq_rank K
  unfold artinFactorRank tatePlusDim
  split_ifs <;> omega

/-- In twist one the sequence `0 → H¹_f ⊗ ℝ → coker α → H⁰_f(h⁰(K))^* ⊗ ℝ → 0` has a
one-dimensional last term (§§1.4, 2.4; Dirichlet). -/
theorem artinFactorRank_one_add :
    artinFactorRank K 1 + 1 + tatePlusDim K 1 = Module.finrank ℚ K := by
  have h := card_add_two_mul_card_eq_rank K
  have hc := card_eq_nrRealPlaces_add_nrComplexPlaces K
  have hpos : 0 < Fintype.card (InfinitePlace K) := Fintype.card_pos
  have hodd : ¬ Even (1 : ℤ) := by decide
  unfold artinFactorRank tatePlusDim Units.rank
  split_ifs <;> omega

/-- For `ℚ` the factor `H¹_f(ℚ(3)) = K₅(ℤ) ⊗ ℚ` is a line, while `H¹_f(ℚ(2)) = K₃(ℤ) ⊗ ℚ` and
`H¹_f(ℚ(1)) = ℤ^× ⊗ ℚ` vanish (§1.4, `artinFactorRank_rat`). -/
theorem artinFactorRank_rat :
    artinFactorRank ℚ 3 = 1 ∧ artinFactorRank ℚ 2 = 0 ∧ artinFactorRank ℚ 1 = 0 := by
  have h1 : Module.finrank ℚ ℚ = 1 := Module.finrank_self ℚ
  have hr : nrRealPlaces ℚ = 1 := nrRealPlaces_eq_one_of_finrank_eq_one h1
  have hc : nrComplexPlaces ℚ = 0 := nrComplexPlaces_eq_zero_of_finrank_eq_one h1
  have h3 : ¬ Even (3 : ℤ) := by decide
  have h2 : Even (2 : ℤ) := by decide
  refine ⟨?_, ?_, ?_⟩
  · unfold artinFactorRank
    simp [h3, hr, hc]
  · unfold artinFactorRank
    simp [h2, hc]
  · unfold artinFactorRank Units.rank
    simp

/-- The infinity involution acts on `ℚ(1)` by `-1` and on `ℚ(2)` by `+1`, so `B⁺(ℚ(1)) = 0` and
`B⁺(ℚ(2)) = ℚ` (§1.4, `tatePlusDim_rat`). -/
example : tatePlusDim ℚ 1 = 0 ∧ tatePlusDim ℚ 2 = 1 := by
  have h1 : Module.finrank ℚ ℚ = 1 := Module.finrank_self ℚ
  have hr : nrRealPlaces ℚ = 1 := nrRealPlaces_eq_one_of_finrank_eq_one h1
  have hc : nrComplexPlaces ℚ = 0 := nrComplexPlaces_eq_zero_of_finrank_eq_one h1
  have h1odd : ¬ Even (1 : ℤ) := by decide
  have h2even : Even (2 : ℤ) := by decide
  refine ⟨?_, ?_⟩
  · unfold tatePlusDim
    simp [h1odd, hc]
  · unfold tatePlusDim
    simp [h2even, hr, hc]

end ArtinRanks

/-! ## Layer 2: real regulators and the fundamental-line real comparison -/

section HodgeWeights

variable {W : Type*} [AddCommGroup W] [Module ℂ W] {ω : TauCeti.Hodge.Conjugation W} {n : ℤ}

/-- In negative weight a class in `F⁰` and in its conjugate is zero: the Hodge-theoretic content
of `delignePeriodMap_injective` (§2.1, `hodge_F_zero_inf_conjF_zero_eq_bot`). -/
theorem hodge_F_zero_inf_conjF_zero_eq_bot (hs : TauCeti.Hodge.HodgeStructureOn W ω n)
    (hn : n < 0) : hs.F 0 ⊓ hs.conjF 0 = ⊥ := by
  have hle : hs.conjF 0 ≤ hs.conjF (n + 1 - 0) := hs.conjF_antitone (by omega)
  exact eq_bot_iff.2 (le_trans (inf_le_inf_left _ hle) (hs.isCompl_F_conjF 0).inf_eq_bot.le)

/-- In weight at least `-1`, `F⁰` and its conjugate span: the Hodge-theoretic content of
`delignePeriodMap_surjective` (§2.1, `hodge_F_zero_sup_conjF_zero_eq_top`). -/
theorem hodge_F_zero_sup_conjF_zero_eq_top (hs : TauCeti.Hodge.HodgeStructureOn W ω n)
    (hn : -1 ≤ n) : hs.F 0 ⊔ hs.conjF 0 = ⊤ := by
  have hle : hs.conjF (n + 1 - 0) ≤ hs.conjF 0 := hs.conjF_antitone (by omega)
  exact eq_top_iff.2 (le_trans (hs.isCompl_F_conjF 0).sup_eq_top.ge (sup_le_sup_left hle _))

end HodgeWeights

/-! ## Layer 4: zeta elements, the Tamagawa condition and its proved cases -/

section ClassNumber

variable (K : Type*) [Field K] [NumberField K]

/-- The leading coefficient at `s = 0` of `L(h⁰(Spec K)(1), s) = ζ_K(s + 1)` is the residue of
`ζ_K` at `s = 1` (§4.4, the analytic input of `tamagawaCondition_classNumber` in twist one; the
reindexing of Mathlib's `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`). -/
theorem tendsto_mul_dedekindZeta_one_add :
    Tendsto (fun s : ℝ ↦ (s : ℂ) * dedekindZeta K (1 + s)) (𝓝[>] 0)
      (𝓝 (dedekindZeta_residue K)) := by
  have hg : Tendsto (fun s : ℝ ↦ 1 + s) (𝓝[>] 0) (𝓝[>] 1) := by
    rw [tendsto_nhdsWithin_iff]
    refine ⟨?_, ?_⟩
    · have h : Tendsto (fun s : ℝ ↦ 1 + s) (𝓝 0) (𝓝 (1 + 0)) :=
        tendsto_const_nhds.add tendsto_id
      rw [add_zero] at h
      exact h.mono_left nhdsWithin_le_nhds
    · filter_upwards [self_mem_nhdsWithin] with s hs
      simp only [Set.mem_Ioi] at hs ⊢
      linarith
  refine ((tendsto_sub_one_mul_dedekindZeta_nhdsGT K).comp hg).congr ?_
  intro s
  simp only [Function.comp_apply]
  push_cast
  ring_nf

end ClassNumber

/-!
## Targets stated in the README only

Layer 1: `KTheoreticMotive` and its API, `motivicFactorZero`, `motivicFactorOne` and their API,
`weight_vanishing`, `artinMotiveFactors`, `ellipticMotiveFactors`.
Layer 2: `delignePeriodMap` and its API, `realDeligneComplex`, `cycleClassReal`,
`beilinsonRegulatorReal`, `heightPairingReal`, `RegulatorsCommuteWithCoefficients`,
`regulatorsCommute_artin`, `regulatorsCommute_elliptic`, `RealExactness` and its API,
`realExactness_artin`, `neronTatePairing_posDef_real`, `realExactness_elliptic`,
`fundamentalLineRealComparison` and its API.
Layer 3: `padicRealizationZero`, `padicRealizationOne` and their API, `PadicRealizationFinite`,
`blochKatoCondition_orthogonal`, `PadicRealizationIso` and its API, `padicRealization_artin`,
`padicRealization_elliptic`, `compactCochainsWithInfinity`, `selmerComplex_artin`,
`fundamentalLinePadicComparison` and its API.
Layer 4: `tamagawaElement`, `TamagawaCondition` and its API, `tamagawaCondition_iff_etnc`,
`tamagawaCondition_alternative_forms`, `dedekindZeta_leadingCoeff_zero`,
`tamagawaCondition_classNumber`, `tamagawaCondition_iff_lichtenbaum`,
`tamagawaCondition_iff_lichtenbaum_motivic`, `tamagawaCondition_iff_lichtenbaum_K`,
`ellipticFundamentalLine_data`.
-/

end TauCetiRoadmap.MotivicEtaleKTheoryPartII
