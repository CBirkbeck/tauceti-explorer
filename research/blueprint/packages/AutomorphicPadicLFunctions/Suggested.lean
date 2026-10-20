import Mathlib
import TauCeti.NumberTheory.NumberField.Global.RayClass.Exact

/-!
# AutomorphicPadicLFunctions: representative target signatures

The roadmap is README.md. This file records light definitions and milestone
signatures expressible using the pinned APIs; it is not exhaustive. The analytic,
cohomological and moduli constructions remain targets in the roadmap.
-/

namespace TauCetiRoadmap.AutomorphicPadicLFunctions

/-! ## Layer 0: ray-class evaluation and Euler corrections -/

#check TauCeti.GlobalNumberFields.classMap_surjective
#check riemannZeta_zero

/-- The finite weighted Fourier kernel underlying the conductor-normalized ray Gauss sum. -/
def finiteGaussCore {A R : Type*} [Fintype A] [CommRing R]
    (χ e : A → R) : R := ∑ a, χ a * e a

example :
    finiteGaussCore (![0, 1, -1] : Fin 3 → ZMod 7) ![1, 2, 4] = 5 ∧
    finiteGaussCore (![0, 1, -1] : Fin 3 → ZMod 7) ![1, 4, 2] = 2 := by
  norm_num [finiteGaussCore, Fin.sum_univ_succ]
  decide

example :
    finiteGaussCore (fun _ : Unit => (1 : ℚ)) (fun _ => 1) = 1 ∧
    finiteGaussCore (fun _ : Unit => (0 : ℚ)) (fun _ => 1) = 0 := by
  norm_num [finiteGaussCore]

/-- The linear Euler correction in the finite group algebra, before completion. -/
noncomputable def linearEulerCore {R G : Type*} [CommRing R] [Monoid G]
    (a : R) (g : G) : MonoidAlgebra R G :=
  1 - MonoidAlgebra.single g a

/-- Character evaluation preserves the arithmetic subtraction convention of the Euler core. -/
theorem linearEulerCore_eval {R G : Type*} [CommRing R] [Monoid G]
    (a : R) (g : G) (χ : G →* R) :
    MonoidAlgebra.lift R R G χ (linearEulerCore a g) = 1 - a * χ g := by
  sorry

example :
    (linearEulerCore (1 : ZMod 5) (Multiplicative.ofAdd (1 : ZMod 3))).coeff 1 = 1 ∧
    (linearEulerCore (1 : ZMod 5) (Multiplicative.ofAdd (1 : ZMod 3))).coeff
      (Multiplicative.ofAdd (1 : ZMod 3)) = -1 := by
  norm_num [linearEulerCore, MonoidAlgebra.one_def]
  change (Finsupp.single (1 : Multiplicative (ZMod 3)) (1 : ZMod 5))
    (Multiplicative.ofAdd (1 : ZMod 3)) = 0
  simp

example :
    MonoidAlgebra.lift (ZMod 5) (ZMod 5) (Multiplicative (ZMod 3))
      (1 : Multiplicative (ZMod 3) →* ZMod 5)
      (linearEulerCore 1 (Multiplicative.ofAdd (1 : ZMod 3))) = 0 := by
  simp [linearEulerCore, MonoidAlgebra.lift_single]

/-! ## Layer 1: algebraic weights and the oriented evaluation sign -/

/-- The two coordinates of BSW’s homogeneous polynomial action before its determinant twist. -/
def coefficientSubstitution {R : Type*} [CommRing R]
    (a b c d : R) (z : R × R) : R × R :=
  (d * z.1 + b * z.2, c * z.1 + a * z.2)

example :
    coefficientSubstitution (2 : ℤ) 0 0 3 (1, 0) = (3, 0) ∧
    coefficientSubstitution (2 : ℤ) 0 0 3 (0, 1) = (0, 2) := by
  norm_num [coefficientSubstitution]

example :
    coefficientSubstitution (1 : ℤ) 1 0 1 (2, 3) = (5, 3) ∧
    coefficientSubstitution (1 : ℤ) 0 1 1 (2, 3) = (2, 5) := by
  norm_num [coefficientSubstitution]

/-- Conjugation invariance, nonnegativity and purity for an algebraic GL₂ weight. -/
def admissibleWeight {σ : Type*} (c : σ → σ) (k v : σ → ℤ) : Prop :=
  (∀ s, k (c s) = k s ∧ 0 ≤ k s) ∧ ∃ w : ℤ, ∀ s, k s + 2 * v s = w

example : admissibleWeight (id : Fin 2 → Fin 2) ![0, 2] ![1, 0] := by
  constructor
  · simp [Fin.forall_fin_two]
  · exact ⟨2, by simp [Fin.forall_fin_two]⟩

example :
    ¬ admissibleWeight (fun s : Fin 2 => 1 - s) ![2, 3] ![0, 0] ∧
    ¬ admissibleWeight (id : Fin 2 → Fin 2) ![-1, -1] ![0, 0] ∧
    ¬ admissibleWeight (id : Fin 2 → Fin 2) ![0, 0] ![0, 1] := by
  refine ⟨?_, ?_, ?_⟩
  · intro h
    have h0 := (h.1 0).1
    norm_num at h0
  · intro h
    have h0 := (h.1 0).2
    norm_num at h0
  · intro h
    obtain ⟨w, hw⟩ := h.2
    have h0 := hw 0
    have h1 := hw 1
    norm_num at h0 h1
    omega

/-- The polynomial bounds on a critical index; global character compatibility is additional. -/
def criticalBox {σ : Type*} (k j : σ → ℤ) : Prop :=
  ∀ s, 0 ≤ j s ∧ j s ≤ k s

example :
    criticalBox (![2, 3] : Fin 2 → ℤ) ![0, 3] ∧
    criticalBox (![0, 0] : Fin 2 → ℤ) ![0, 0] := by
  simp [criticalBox, Fin.forall_fin_two]

example :
    ¬ criticalBox (![2, 3] : Fin 2 → ℤ) ![0, 4] ∧
    ¬ criticalBox (![2, 3] : Fin 2 → ℤ) ![-1, 0] := by
  simp [criticalBox, Fin.forall_fin_two]

/-- The parity contribution from complex degrees and real critical indices. -/
def orientationSign (complexDegree realDegree : ℕ) : ℤ :=
  (-1) ^ (complexDegree + realDegree)

example : orientationSign 0 0 = 1 ∧ orientationSign 0 2 = 1 ∧
    orientationSign 0 3 = -1 := by
  norm_num [orientationSign]

example : orientationSign 1 2 = -1 ∧ orientationSign 1 3 = 1 := by
  norm_num [orientationSign]

/-! ## Layer 2: the unit-chart inversion and normalised norm relations -/

/-- Unit-chart inversion with the weight character retained. -/
def weightedInversion {G K : Type*} [Group G] [Field K]
    (χ : G →* Kˣ) (f : G → K) (x : G) : K :=
  (χ x : K) * f x⁻¹

/-- Applying the same weighted inversion twice recovers the test function. -/
theorem weightedInversion_involutive {G K : Type*} [Group G] [Field K]
    (χ : G →* Kˣ) (f : G → K) :
    weightedInversion χ (weightedInversion χ f) = f := by
  funext x
  simp [weightedInversion]

example :
    weightedInversion (MonoidHom.id ℚˣ) (fun x => (x : ℚ) + 1)
      (Units.mk0 2 (by norm_num)) = 3 ∧
    weightedInversion (MonoidHom.id ℚˣ) (fun x => (x : ℚ) + 1)
      (Units.mk0 3 (by norm_num)) = 4 := by
  norm_num [weightedInversion]

example :
    weightedInversion (1 : ℚˣ →* ℚˣ)
      (fun x => if (x : ℚ) = 2 then (1 : ℚ) else 0)
      (Units.mk0 (1 / 2) (by norm_num)) = 1 ∧
    weightedInversion (1 : ℚˣ →* ℚˣ)
      (fun x => if (x : ℚ) = 2 then (1 : ℚ) else 0)
      (Units.mk0 2 (by norm_num)) = 0 := by
  norm_num [weightedInversion]

/-- The eigenvalue of the product of commuting prime operators at a conductor multi-index. -/
def refinementEigenvalue {ι K : Type*} [Fintype ι] [Field K]
    (α : ι → Kˣ) (n : ι → ℕ) : Kˣ := ∏ i, α i ^ n i

example :
    ((refinementEigenvalue (fun _ : Unit => Units.mk0 (2 : ℚ) (by norm_num))
      (fun _ => 1) : ℚˣ) : ℚ) = 2 ∧
    ((refinementEigenvalue (fun _ : Unit => Units.mk0 (2 : ℚ) (by norm_num))
      (fun _ => 2) : ℚˣ) : ℚ) = 4 := by
  norm_num [refinementEigenvalue]

example :
    ((refinementEigenvalue
      (![Units.mk0 (2 : ℚ) (by norm_num), Units.mk0 3 (by norm_num)] : Fin 2 → ℚˣ)
      ![1, 2] : ℚˣ) : ℚ) = 18 ∧
    ((refinementEigenvalue
      (![Units.mk0 (2 : ℚ) (by norm_num), Units.mk0 3 (by norm_num)] : Fin 2 → ℚˣ)
      (fun _ => 0) : ℚˣ) : ℚ) = 1 := by
  norm_num [refinementEigenvalue, Fin.prod_univ_succ]

/-- Divide a finite-level evaluation by its nonzero refinement eigenvalue. -/
noncomputable def normalisedLevelValue {ι K M : Type*} [Fintype ι]
    [Field K] [AddCommGroup M] [Module K M]
    (α : ι → Kˣ) (raw : (ι → ℕ) → M) (n : ι → ℕ) : M :=
  ((∏ i, (α i : K) ^ n i)⁻¹) • raw n

/-- The genuine update norm relation makes normalization independent of the level. -/
theorem normalisedLevelValue_independent {ι K M : Type*} [Fintype ι]
    [DecidableEq ι] [Field K] [AddCommGroup M] [Module K M]
    (α : ι → Kˣ) (raw : (ι → ℕ) → M)
    (h : ∀ n i, raw (Function.update n i (n i + 1)) = (α i : K) • raw n)
    (n m : ι → ℕ) :
    normalisedLevelValue α raw n = normalisedLevelValue α raw m := by
  sorry

example :
    normalisedLevelValue (fun _ : Unit => Units.mk0 (2 : ℚ) (by norm_num))
      (fun n => (2 : ℚ) ^ n () * 3) (fun _ => 0) = 3 ∧
    normalisedLevelValue (fun _ : Unit => Units.mk0 (2 : ℚ) (by norm_num))
      (fun n => (2 : ℚ) ^ n () * 3) (fun _ => 2) = 3 := by
  norm_num [normalisedLevelValue]

example :
    normalisedLevelValue (fun _ : Unit => Units.mk0 (2 : ℚ) (by norm_num))
      (fun _ => (3 : ℚ)) (fun _ => 0) = 3 ∧
    normalisedLevelValue (fun _ : Unit => Units.mk0 (2 : ℚ) (by norm_num))
      (fun _ => (3 : ℚ)) (fun _ => 1) = 3 / 2 := by
  norm_num [normalisedLevelValue]

/-! ## Layer 3: comparison of supplied Deligne–Ribet and Katz measures -/
/-! ## Layer 3h: anticyclotomic toric periods and nonvanishing -/

#check NumberField.IsCMField.unitsMulComplexConjInv
#check NumberField.IsCMField.unitsMulComplexConjInv_ker
#check Subgroup.index_ker
#check Subgroup.card_subgroup_dvd_card
#check NumberField.torsionOrder_dvd_absNorm_sub_one'

/-! ## Layer 4: unitary doubling -/
/-! ## Layer 4e: Klingen families -/
/-! ## Layer 5: comparison of evaluation constructions -/

/-
The following README definitions require carriers beyond the pins and therefore
remain README targets: rayClassTower, rayLeopoldtDefect, rayClassAvatar, rayGaussSum,
pDepletedLValue, rayClassDistribution, rayEvaluationMaps, eulerFactorElement,
weightCoefficientSystem, classicalEigenformData, periodNormalisedSymbol,
automorphicCycle, classicalEvaluation, analyticWeightCoefficients,
overconvergentCohomology, partialThetaMap, overconvergentEvaluation,
finiteEvaluation, bswDistribution, hsiehSetting,
toricTestVector, anticyclotomicSquareRoot, localMuDefect, correctedDensityCondition,
localCharacterMuDefect, selfDualHeckeAlgebraicValue,
finisThetaSpace, integralThetaEigenlattice,
finisLocalCorrection, unitaryDoublingDatum, ordinaryUnitaryLattice,
ehlsHypotheses, unitaryDifferentialOperator, ehlsEisensteinMeasure,
hermitianSiegelDatum, bigCellSection, panchishkinUnramified, DL_completedMeasure,
ewSetting, ewSiegelMeasure, klingenFamily, normalisationComparison,
anticyclotomicRayQuotient.

The required PadicFamilies supplier extensions are partialZetaDistribution,
hilbertCuspData, hilbertEisensteinSeries, ordinaryDeligneModule, ordinaryHilbertIgusaTower,
PadicHilbertForm,
deligneRibetMeasure, deligneRibetParityDefect, deligneRibetPseudomeasure, ordinaryCMType,
ordinaryCMPoint, cmPeriodData, katzDifferentialOperator, katzEisensteinMeasure,
katzHidaTilouineMeasure and groupRingEisensteinFamily. Their full signatures,
APIs and Checks are specified in the supplier contracts, rather than reconstructed
as new targets in this roadmap.
-/

end TauCetiRoadmap.AutomorphicPadicLFunctions
