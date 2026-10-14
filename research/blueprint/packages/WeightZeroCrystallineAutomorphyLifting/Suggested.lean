import Mathlib.RepresentationTheory.Basic
import Mathlib.Algebra.Module.LinearMap.End
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Group.Pi.Lemmas
import Mathlib.RingTheory.Ideal.MinimalPrime.Basic
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic.NormNum

/-!
# Weight-zero crystalline automorphy lifting with p arbitrarily ramified: suggested forms

This file is not the roadmap and is not an exhaustive checklist: the README is the specification,
and the declarations here are suggested forms for the parts that the pinned Mathlib and Tau Ceti can
already express. It contains the light definitions of Layers WZ.0 and WZ.3 with real bodies, the
general commutative-algebra milestone of Layer WZ.2 and the integer core of the dimension balance of
Layer WZ.3, each with discriminating examples. Locally symmetric spaces, Hecke-valued Galois
representations, local lifting rings, patched complexes and automorphic representations are not
available at the pins; every statement about them is a README target only.

Proofs are `sorry`. Names follow the README, with `WeightZero.X` for README target `WeightZero.X`.
-/

noncomputable section

open scoped BigOperators

namespace TauCetiRoadmap.WeightZeroCrystallineAutomorphyLifting

namespace WeightZero

/-! ## Layer WZ.0 -/

/-- README 0.1, certificate 2: for every place `v` among the places `P` of `F⁺` above `p`, with
local degrees `deg`, some other place `v'` leaves a complementary local degree strictly larger than
half of the total. -/
def complementaryDegreeCondition {ι : Type*} [DecidableEq ι] (P : Finset ι) (deg : ι → ℕ) : Prop :=
  ∀ v ∈ P, ∃ v' ∈ P, v' ≠ v ∧ ∑ w ∈ P, deg w < 2 * ∑ w ∈ (P.erase v).erase v', deg w

-- README 0.1, `test_profile_degree_boundary`: four places of equal degree fail.
example : ¬ complementaryDegreeCondition (Finset.univ : Finset (Fin 4)) (fun _ => 1) := by
  sorry

-- README 0.1, `test_profile_degree_boundary`: five places of equal degree pass.
example : complementaryDegreeCondition (Finset.univ : Finset (Fin 5)) (fun _ => 1) := by
  sorry

/-- README 0.2: the local factor of the prepared level. The hyperspecial factor `K₀ v` is used
outside `S` and at `Sp`; then the Iwahori factor `KI v` at `R`; the pro-`v` Iwahori factor `KP v`
at the remaining places of `S`. -/
def LevelFactors {V : Type*} {G : V → Type*} [∀ v, Group (G v)]
    (S Sp R : Set V) (K₀ KI KP : (v : V) → Subgroup (G v)) (v : V) : Subgroup (G v) :=
  open Classical in
  if v ∉ S ∨ v ∈ Sp then K₀ v else if v ∈ R then KI v else KP v

-- README 0.2, `test_level_hyperspecial` and `test_level_iwahori`.
example {H : Type*} [Group H] (K₀ KI KP : Subgroup H) :
    LevelFactors ({1, 2, 3} : Set (Fin 4)) {1} {2} (fun _ => K₀) (fun _ => KI) (fun _ => KP) 0 = K₀ ∧
    LevelFactors ({1, 2, 3} : Set (Fin 4)) {1} {2} (fun _ => K₀) (fun _ => KI) (fun _ => KP) 1 = K₀ ∧
    LevelFactors ({1, 2, 3} : Set (Fin 4)) {1} {2} (fun _ => K₀) (fun _ => KI) (fun _ => KP) 2 = KI := by
  sorry

-- README 0.2, `test_level_distinguishes_pro`: the auxiliary place carries the pro-`v` factor.
example {H : Type*} [Group H] (K₀ KI KP : Subgroup H) (h : KP ≠ KI) :
    LevelFactors ({1, 2, 3} : Set (Fin 4)) {1} {2} (fun _ => K₀) (fun _ => KI) (fun _ => KP) 3 ≠ KI := by
  sorry

/-- README 0.3: the representation of `H` on the scalar module `O` in which `h` acts by
multiplication by `(∏ i, χ i (θ h i))⁻¹`. -/
def AuxiliaryCoefficient {I : Type*} [Fintype I] {G : I → Type*} [∀ i, Group (G i)]
    {H O : Type*} [Group H] [CommRing O]
    (χ : (i : I) → G i →* Oˣ) (θ : H →* ((i : I) → G i)) : Representation O H O :=
  (DistribMulAction.toModuleEnd O O).comp
    (∏ i, (χ i).comp ((Pi.evalMonoidHom G i).comp θ))⁻¹

-- README 0.3, `test_coefficient_inverse`: the unit `2` acts on `1` by `1/2`, not by `2`.
example :
    AuxiliaryCoefficient (I := Fin 1) (G := fun _ => ℚˣ) (fun _ => MonoidHom.id ℚˣ)
      (MonoidHom.pi fun _ => MonoidHom.id ℚˣ) (Units.mk0 (2 : ℚ) (by norm_num)) 1 = (1 / 2 : ℚ) := by
  sorry

-- README 0.3, `test_coefficient_trivial`: the all-trivial tuple is `Representation.trivial`.
example {I : Type*} [Fintype I] {G : I → Type*} [∀ i, Group (G i)] {H O : Type*} [Group H]
    [CommRing O] (θ : H →* ((i : I) → G i)) :
    AuxiliaryCoefficient (fun i => (1 : G i →* Oˣ)) θ = Representation.trivial O H O := by
  sorry

/-! ## Layer WZ.2 -/

/-- README 2.1: if `ϖ` is a nonzerodivisor of a Noetherian ring `A`, `q` is a prime minimal over
`ϖ`, and the special fibre `A/ϖ` is reduced at `q`, then `q` contains exactly one minimal prime of
`A`. -/
theorem existsUnique_minimalPrime_le_of_isReduced {A : Type*} [CommRing A] [IsNoetherianRing A]
    (ϖ : A) (hϖ : IsSMulRegular A ϖ) (q : Ideal A) [q.IsPrime]
    (hq : q ∈ (Ideal.span {ϖ}).minimalPrimes)
    (hred : IsReduced (Localization.AtPrime q ⧸
      Ideal.span {algebraMap A (Localization.AtPrime q) ϖ})) :
    ∃! P : Ideal A, P ∈ minimalPrimes A ∧ P ≤ q := by
  sorry

/-- README 2.1: under the same hypotheses the localization at `q` is a discrete valuation ring. -/
theorem isDiscreteValuationRing_localization_of_isReduced {A : Type*} [CommRing A]
    [IsNoetherianRing A] (ϖ : A) (hϖ : IsSMulRegular A ϖ) (q : Ideal A) [q.IsPrime]
    (hq : q ∈ (Ideal.span {ϖ}).minimalPrimes)
    (hred : IsReduced (Localization.AtPrime q ⧸
      Ideal.span {algebraMap A (Localization.AtPrime q) ϖ})) :
    ∃ _ : IsDomain (Localization.AtPrime q), IsDiscreteValuationRing (Localization.AtPrime q) := by
  sorry

-- README 2.1, first check: `ℤ` with `ϖ = 5`; the unique minimal prime below `(5)` is `⊥`.
example : ∃! P : Ideal ℤ, P ∈ minimalPrimes ℤ ∧ P ≤ Ideal.span {(5 : ℤ)} := by
  sorry

/-! ## Layer WZ.3 -/

/-- README 3.1: membership of a matrix in the selected-block parahoric of type `(n - d, d)` with
respect to an ideal `I`: the entries in the rows of the last (selected) block and the columns of the
first block lie in `I`. For `I` the maximal ideal of `O_{F_v}` this is the preimage of the block upper
triangular parabolic. -/
def IsSelectedBlockParahoric {n : ℕ} (d : ℕ) {O : Type*} [CommRing O] (I : Ideal O)
    (g : Matrix (Fin n) (Fin n) O) : Prop :=
  ∀ i j : Fin n, n - d ≤ (i : ℕ) → (j : ℕ) < n - d → g i j ∈ I

-- README 3.1, `test_selectedBlock_rank_two`: for `n = 2`, `d = 1` the condition is on the
-- lower-left entry only.
example : IsSelectedBlockParahoric (n := 2) 1 (Ideal.span {(5 : ℤ)}) !![1, 3; 5, 1] ∧
    ¬ IsSelectedBlockParahoric (n := 2) 1 (Ideal.span {(5 : ℤ)}) !![1, 0; 1, 1] := by
  sorry

-- README 3.1, `test_selectedBlock_full`: for `d = n` there is no condition.
example {n : ℕ} {O : Type*} [CommRing O] (I : Ideal O) (g : Matrix (Fin n) (Fin n) O) :
    IsSelectedBlockParahoric n I g := by
  sorry

/-- README 3.8: the integer identities behind the adequate dimension balance, with `j = n²s - 1`
framing variables, `q` diamond variables and `g = q - n²f` presentation variables. -/
theorem adequateDimensionBalance_counts (n f s q : ℤ) :
    1 + (n ^ 2 * s - 1) + q = n ^ 2 * s + q ∧
      (1 + n ^ 2 * s + n * (n - 1) * f + (q - n ^ 2 * f)) + (n * f - 1) = n ^ 2 * s + q := by
  sorry

-- README 3.8, first check: `n = 2`, `f = 1`, `s = 1`, `q = 4` gives `dim S∞ = 8`, `dim R∞ = 7`.
example : (1 + (2 ^ 2 * 1 - 1) + 4 : ℤ) = 8 ∧
    (1 + 2 ^ 2 * 1 + 2 * (2 - 1) * 1 + (4 - 2 ^ 2 * 1) : ℤ) = 7 := by
  sorry

-- README 3.9, `test_patched_codimension`: the enormous count `qn - n²f` breaks the balance.
example : (1 + 2 ^ 2 * 1 + 2 * (2 - 1) * 1 + (4 * 2 - 2 ^ 2 * 1)) + (2 * 1 - 1) ≠
    (2 ^ 2 * 1 + 4 : ℤ) := by
  sorry

end WeightZero

end TauCetiRoadmap.WeightZeroCrystallineAutomorphyLifting
