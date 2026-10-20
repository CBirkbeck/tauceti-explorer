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
  sorry

/-- Dualizing twice returns the degree and the twist (§1.1; the README Check `dualTwist_dualTwist`). -/
theorem dualDegree_dualTwist_involutive (d i j : ℤ) :
    dualDegree d (dualDegree d i) = i ∧ dualTwist d (dualTwist d j) = j := by
  sorry

/-- `h¹(E)(1)` has weight `-1` and is its own dual datum (§1.1, `weight_elliptic_center`). -/
example : motiveWeight 1 1 = -1 ∧ dualDegree 1 1 = 1 ∧ dualTwist 1 1 = 1 := by
  refine ⟨?_, ?_, ?_⟩ <;> rfl

/-- `ℚ(2)` has weight `-4`; its dual datum `ℚ(-1)` has weight `2` (§1.1, `weight_tate_two`). -/
example : motiveWeight 0 2 = -4 ∧ motiveWeight (dualDegree 0 0) (dualTwist 0 2) = 2 := by
  refine ⟨?_, ?_⟩ <;> rfl

/-- The point in twist zero and its dual in twist one give weights `0` and `-2` (§§1.1–1.3). -/
example : motiveWeight 0 0 = 0 ∧ motiveWeight (dualDegree 0 0) (dualTwist 0 0) = -2 := by
  decide

/-- Duality also returns negative twists, with no truncation to natural numbers (§1.1). -/
example : dualDegree 2 (dualDegree 2 3) = 3 ∧ dualTwist 2 (dualTwist 2 (-2)) = -2 := by
  decide

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
  sorry

/-- In twist one the sequence `0 → H¹_f ⊗ ℝ → coker α → H⁰_f(h⁰(K))^* ⊗ ℝ → 0` has a
one-dimensional last term (§§1.4, 2.4; Dirichlet). -/
theorem artinFactorRank_one_add :
    artinFactorRank K 1 + 1 + tatePlusDim K 1 = Module.finrank ℚ K := by
  sorry

/-- For `ℚ` the factor `H¹_f(ℚ(3)) = K₅(ℤ) ⊗ ℚ` is a line, while `H¹_f(ℚ(2)) = K₃(ℤ) ⊗ ℚ` and
`H¹_f(ℚ(1)) = ℤ^× ⊗ ℚ` vanish (§1.4, `artinFactorRank_rat`). -/
theorem artinFactorRank_rat :
    artinFactorRank ℚ 3 = 1 ∧ artinFactorRank ℚ 2 = 0 ∧ artinFactorRank ℚ 1 = 0 := by
  sorry

/-- Parity separates the nonzero rational factor in twist three from twist two (§1.4). -/
example : artinFactorRank ℚ 3 = 1 ∧ artinFactorRank ℚ 2 = 0 := by
  have h1 : Module.finrank ℚ ℚ = 1 := Module.finrank_self ℚ
  have hr : nrRealPlaces ℚ = 1 := nrRealPlaces_eq_one_of_finrank_eq_one h1
  have hc : nrComplexPlaces ℚ = 0 := nrComplexPlaces_eq_zero_of_finrank_eq_one h1
  norm_num [artinFactorRank, hr, hc, show ¬ Even (3 : ℤ) by decide,
    show Even (2 : ℤ) by decide]

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

/-- Nonpositive twists have no degree-one motivic factor (§1.4). -/
example : artinFactorRank K 0 = 0 ∧ artinFactorRank K (-1) = 0 := by
  norm_num [artinFactorRank]

/-- Twist zero has the even Betti part, while a negative odd twist has the odd part (§1.4). -/
example : tatePlusDim K 0 = nrRealPlaces K + nrComplexPlaces K ∧
    tatePlusDim K (-1) = nrComplexPlaces K := by
  norm_num [tatePlusDim, show ¬ Even (-1 : ℤ) by decide]

end ArtinRanks

/-! ## Layer 2: real regulators and the fundamental-line real comparison -/

section HodgeWeights

variable {W : Type*} [AddCommGroup W] [Module ℂ W] {ω : TauCeti.Hodge.Conjugation W} {n : ℤ}

/-- In negative weight a class in `F⁰` and in its conjugate is zero: the Hodge-theoretic content
of `delignePeriodMap_injective` (§2.1, `hodge_F_zero_inf_conjF_zero_eq_bot`). -/
theorem hodge_F_zero_inf_conjF_zero_eq_bot (hs : TauCeti.Hodge.HodgeStructureOn W ω n)
    (hn : n < 0) : hs.F 0 ⊓ hs.conjF 0 = ⊥ := by
  sorry

/-- In weight at least `-1`, `F⁰` and its conjugate span: the Hodge-theoretic content of
`delignePeriodMap_surjective` (§2.1, `hodge_F_zero_sup_conjF_zero_eq_top`). -/
theorem hodge_F_zero_sup_conjF_zero_eq_top (hs : TauCeti.Hodge.HodgeStructureOn W ω n)
    (hn : -1 ≤ n) : hs.F 0 ⊔ hs.conjF 0 = ⊤ := by
  sorry

end HodgeWeights

section DeterminantCoordinates

/-- The two-term differential `3` gives coordinate `3` in degrees `0,1`, and the shifted
coordinate is its inverse (`perfectDeterminant_twoTerm`, §4.1). The complexes themselves are
README targets; these are their scalar coordinates. -/
example : Matrix.det (!![3] : Matrix (Fin 1) (Fin 1) ℚ) = 3 ∧
    (Matrix.det (!![3] : Matrix (Fin 1) (Fin 1) ℚ))⁻¹ = 1 / 3 := by
  norm_num [Matrix.det_fin_one_of]

/-- Swapping two rank-one odd factors has sign `-1` (§2.6). -/
example : Matrix.det (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℚ) = -1 := by
  norm_num [Matrix.det_fin_two]

/-- Under Morita equivalence the simple column's scalar `3` has coordinate `3`; forgetting
the matrix action gives coordinate `9` (`virtualDeterminant_Morita`). -/
example : Matrix.det (!![3] : Matrix (Fin 1) (Fin 1) ℚ) = 3 ∧
    Matrix.det (!![3, 0; 0, 3] : Matrix (Fin 2) (Fin 2) ℚ) = 9 := by
  norm_num [Matrix.det_fin_one_of, Matrix.det_fin_two]

/-- A rank-one regulator `3` contributes its inverse; replacing it by twice the regulator
halves the coordinate (`fundamentalLineRealComparison_borel_factor`, §2.6). -/
example : (3 : ℚ)⁻¹ = 1 / 3 ∧ (2 * 3 : ℚ)⁻¹ = (3 : ℚ)⁻¹ / 2 := by
  norm_num

end DeterminantCoordinates

/-! ## Layer 3: the geometric local regulator -/

/-- The monodromy relation needed for the syntomic differential to square to zero (§3.1).
For `j = 1` this also checks its second Frobenius factor `1 - 3φ/3`. -/
example : let n : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 0, 0]
    let f : Matrix (Fin 2) (Fin 2) ℚ := !![1, 0; 0, 3]
    n * f = 3 • (f * n) ∧
      (1 - f) * n - n * (1 - (1 / 3 : ℚ) • f) = 0 := by
  dsimp
  constructor <;> ext i j <;> fin_cases i <;> fin_cases j <;>
    norm_num [Matrix.mul_apply, Matrix.vecMul, dotProduct, Fin.sum_univ_two]

/-! ## Layer 4: zeta elements, the Tamagawa condition and its proved cases -/

section IntegralCoordinates

/-- A rational nonzero element can fail to generate an integral lattice (§4.1). -/
example : (1 : ℤ) ∉ Submodule.span ℤ {(3 : ℤ)} := by
  rw [Submodule.mem_span_singleton]
  rintro ⟨a, ha⟩
  simp only [smul_eq_mul] at ha
  omega

/-- In the rank-one `k = 5`, `p = 3` check, the ordinary Chern factor has precisely one
factor of `3`; the normalized character keeps the full lattice (§4.5). -/
example : (4 : ℕ).factorial = 24 ∧ 3 ∣ (4 : ℕ).factorial ∧
    ¬ 9 ∣ (4 : ℕ).factorial := by
  decide

/-- The `k = 2`, `p = 3` Euler correction is `-2`, a unit even modulo `9` (§3.6). -/
example : (1 - 3 : ℤ) = -2 ∧ IsUnit (1 - 3 : ZMod 9) := by
  decide

end IntegralCoordinates

section ClassNumber

variable (K : Type*) [Field K] [NumberField K]

/-- The leading coefficient at `s = 0` of `L(h⁰(Spec K)(1), s) = ζ_K(s + 1)` is the residue of
`ζ_K` at `s = 1` (§4.4, the analytic input of `tamagawaCondition_classNumber` in twist one; the
reindexing of Mathlib's `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`). -/
theorem tendsto_mul_dedekindZeta_one_add :
    Tendsto (fun s : ℝ ↦ (s : ℂ) * dedekindZeta K (1 + s)) (𝓝[>] 0)
      (𝓝 (dedekindZeta_residue K)) := by
  sorry

end ClassNumber

/-!
## Targets stated in the README only

Layer 1: `KTheoreticMotive`, `coefficientCopower` and their API, `regularModelCharacter`,
`modelImage_eq_KIntegralPart`, `modelImage_genericCorrespondence`, `modelImage_changeModel`, `motivicFactorZero`,
`motivicFactorOne` and their API,
`weight_vanishing`, `artinMotiveFactors`, `ellipticMotiveFactors`.
Layer 2: `delignePeriodMap` and its API, `realDeligneComplex`, `cycleClassReal`,
`beilinsonRegulatorReal`, `heightPairingReal`, `RegulatorsCommuteWithCoefficients`,
`regulatorsCommute_artin`, `regulatorsCommute_elliptic`, `RealExactness` and its API,
`realExactness_artin`, `neronTatePairing_posDef_real`, `realExactness_elliptic`,
`fundamentalLineRealComparison`, `fundamentalLinePoincareDuality`, `localRealComparison` and their API.
Layer 3: `padicRealizationZero`, `padicRealizationOne` and their API,
`geometricSyntomicComplex`, `geometricSyntomicPeriod`, `geometricSyntomicDescent`,
`geometricSyntomicCharacter`, `numberRingStableEdge`,
`padicRealizationOne_mem_g`, `padicRealizationOne_mem_f_goodReduction`, `PadicRealizationFinite`,
`padicRealizationOne_unramified_away_p`, `blochKatoCondition_orthogonal`,
`blochKatoLocalComplex_duality`, `PadicRealizationIso` and its API, `padicRealization_artin`,
`padicRealization_elliptic`, `compactCochainsWithInfinity`, `selmerComplex_artin`,
`fundamentalLinePadicComparison`, `localPadicComparison` and their API.
Layer 4: `tamagawaElement`, `TamagawaCondition` and its API, `tamagawaCondition_iff_etnc`,
`tamagawaCondition_alternative_forms`, `dedekindZeta_leadingCoeff_zero`,
`tamagawaCondition_classNumber`, `tamagawaCondition_iff_lichtenbaum`,
`tamagawaCondition_iff_lichtenbaum_motivic`, `tamagawaCondition_iff_lichtenbaum_K`,
`ellipticFundamentalLine_data`.
-/

end TauCetiRoadmap.MotivicEtaleKTheoryPartII
