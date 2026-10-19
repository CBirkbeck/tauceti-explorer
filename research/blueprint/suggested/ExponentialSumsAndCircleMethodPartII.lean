import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Algebra.Polynomial.BigOperators
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.NumberTheory.LSeries.PrimesInAP
import Mathlib.NumberTheory.LegendreSymbol.QuadraticReciprocity
import Mathlib.Analysis.SpecialFunctions.Complex.Circle
import Mathlib.Topology.CompactOpen
import TauCeti.AlgebraicTopology.UniversalCover.Circle.FundamentalGroup

/-!
This file is not the roadmap and is not exhaustive. The accompanying README is
definitive. These statements suggest names and signatures for the portion that
can be expressed on carriers present at the atlas pins. The definitions below
have actual bodies; theorem and example proofs are placeholders.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
TauCeti f790474821cf4256814db967cb154e7af3d0c369.

GCM.0 scheme dimension, GCM.3 compact-support Fourier objects, GCM.5--7 derived
arc complexes, and the global germ/trace comparison remain README targets.
This file introduces no substitute cohomology theory, scheme or spectral
sequence carrier. It asserts neither conjecture as an axiom. See the README
for every heavy definition's API and at least three discriminating tests.
-/

noncomputable section

open scoped BigOperators

namespace TauCeti.GeometricCircleMethod

/- GCM.3: light coefficient formulas, not a replacement for the mapping scheme. -/

def mappingPolynomial {K : Type*} [CommRing K] (d : ℕ) (x : K)
    (a : Fin d → K) : Polynomial K :=
  Polynomial.C x * Polynomial.X ^ d +
    ∑ i : Fin d, Polynomial.C (a i) * Polynomial.X ^ i.val

def mappingTuple {K : Type*} [CommRing K] {n : ℕ} (d : ℕ)
    (x : Fin n → K) (a : Fin n → Fin d → K) : Fin n → Polynomial K :=
  fun j => mappingPolynomial d (x j) (a j)

theorem mappingPolynomial_coeff_lt {K : Type*} [CommRing K] (d : ℕ) (x : K)
    (a : Fin d → K) (i : Fin d) :
    (mappingPolynomial d x a).coeff i.val = a i := by
  sorry

theorem mappingPolynomial_coeff_top {K : Type*} [CommRing K] (d : ℕ) (x : K)
    (a : Fin d → K) : (mappingPolynomial d x a).coeff d = x := by
  sorry

theorem mappingPolynomial_coeff_above {K : Type*} [CommRing K] (d r : ℕ) (x : K)
    (a : Fin d → K) (hr : d < r) : (mappingPolynomial d x a).coeff r = 0 := by
  sorry

theorem mappingTuple_ext {K : Type*} [CommRing K] {n d : ℕ}
    (x : Fin n → K) (a b : Fin n → Fin d → K) :
    mappingTuple d x a = mappingTuple d x b ↔ a = b := by
  sorry

example : (mappingPolynomial 3 (7 : ℚ) (fun i => (i.val + 2 : ℚ))).coeff 2 = 4 := by
  sorry

example : (mappingPolynomial 3 (7 : ℚ) (fun i => (i.val + 2 : ℚ))).coeff 3 = 7 := by
  sorry

example : (mappingPolynomial 2 (0 : ℚ) (fun _ => 1)).coeff 2 = 0 := by
  sorry

/-- The zero-based index `r` represents frequency coefficient b_(r+1). -/
def residuePhase {K : Type*} [CommRing K] {n : ℕ} (L d : ℕ)
    (f : MvPolynomial (Fin n) K) (x : Fin n → K)
    (a : Fin n → Fin d → K) (b : Fin L → K) : K :=
  ∑ r : Fin L, b r *
    (MvPolynomial.eval₂Hom Polynomial.C (mappingTuple d x a) f).coeff r.val

theorem residuePhase_zero {K : Type*} [CommRing K] {n : ℕ} (L d : ℕ)
    (f : MvPolynomial (Fin n) K) (x : Fin n → K) (a : Fin n → Fin d → K) :
    residuePhase L d f x a (fun _ => 0) = 0 := by
  sorry

theorem residuePhase_add_frequency {K : Type*} [CommRing K] {n : ℕ} (L d : ℕ)
    (f : MvPolynomial (Fin n) K) (x : Fin n → K) (a : Fin n → Fin d → K)
    (b c : Fin L → K) :
    residuePhase L d f x a (b + c) =
      residuePhase L d f x a b + residuePhase L d f x a c := by
  sorry

theorem residuePhase_add_constant {K : Type*} [CommRing K] {n : ℕ} (L d : ℕ)
    (f : MvPolynomial (Fin n) K) (x : Fin n → K) (a : Fin n → Fin d → K)
    (b : Fin L → K) (hL : 0 < L) (c : K) :
    residuePhase L d (f + MvPolynomial.C c) x a b =
      residuePhase L d f x a b + b ⟨0, hL⟩ * c := by
  sorry

example {K : Type*} [CommRing K] {n : ℕ} (d : ℕ)
    (f : MvPolynomial (Fin n) K) (x : Fin n → K) (a : Fin n → Fin d → K) :
    residuePhase 0 d f x a (fun i => Fin.elim0 i) = 0 := by
  sorry

/- GCM.4: field-point rank sets; the scheme models remain README targets. -/

def hankelMatrix {K : Type*} (L m : ℕ) (b : Fin L → K) :
    Matrix (Fin (L - m)) (Fin (m + 1)) K :=
  fun i j => b ⟨i.val + j.val, by omega⟩

def rankArc {K : Type*} [Field K] (L m : ℕ) : Set (Fin L → K) :=
  {b | (hankelMatrix L m b).rank ≤ m}

def rankArcStage {K : Type*} [Field K] (L : ℕ) (m : ℤ) : Set (Fin L → K) :=
  if m < 0 then ∅ else rankArc L m.toNat

theorem rankArc_zero {K : Type*} [Field K] (L : ℕ) (b : Fin L → K) :
    b ∈ rankArc L 0 ↔ b = 0 := by
  sorry

theorem rankArc_full {K : Type*} [Field K] (L m : ℕ) (hm : L ≤ 2 * m) :
    rankArc (K := K) L m = Set.univ := by
  sorry

theorem rankArc_mono {K : Type*} [Field K] (L m : ℕ) :
    rankArc (K := K) L m ⊆ rankArc L (m + 1) := by
  sorry

example : rankArcStage (K := ℚ) 9 (-1) = ∅ := by
  sorry

example : (hankelMatrix 9 4 (fun i => if i.val = 4 then (1 : ℚ) else 0)).rank = 5 := by
  sorry

example : (fun i : Fin 9 => if i.val = 4 then (1 : ℚ) else 0) ∉ rankArc 9 4 := by
  sorry

example : rankArc (K := ℚ) 9 5 = Set.univ := by
  sorry

/- GCM.2: the two prime quantifiers are deliberately separate. -/

theorem exists_coefficientPrime (p B : ℕ) (hp : p.Prime) (hp2 : 2 < p) :
    ∃ ℓ : ℕ, ℓ.Prime ∧ max B p < ℓ ∧ ℓ ≡ p - 1 [MOD p] ∧
      orderOf (ℓ : ZMod p) = 2 := by
  sorry

theorem exists_goodResiduePrime (ℓ B k : ℕ) (hℓ : ℓ.Prime) (bad : Finset ℕ) :
    ∃ p : ℕ, p.Prime ∧ max (max B k) ℓ < p ∧ p ∉ bad ∧
      ¬ IsSquare (ℓ : ZMod p) ∧ Even (orderOf (ℓ : ZMod p)) := by
  sorry

example : orderOf (4 : ZMod 5) = 2 := by
  sorry

example : ¬ IsSquare (2 : ZMod 5) := by
  sorry

/- GCM.9--10: rational cutoffs retain all floors and the remainder. -/

def delta (k n : ℕ) : ℚ := (n : ℚ) / (2 : ℚ) ^ k - (k : ℚ) + 1

def stratumCutoff (k n d m : ℕ) : ℚ :=
  2 * (d : ℚ) * n - (n : ℚ) * (m / (k - 1) : ℕ) / (2 : ℚ) ^ (k - 2) +
    4 * ((m : ℚ) + 1)

def conservativeMinorCutoff (k n d : ℕ) : ℚ :=
  2 * (d : ℚ) * n + 4 * (k - 1 : ℕ) - 4 * (d / (k - 1) : ℕ) * delta k n

def conservativeComparisonCutoff (k n d : ℕ) : ℚ :=
  -4 * ((d / (k - 1) : ℕ) * delta k n - (k - 1 : ℕ))

def sharpComparisonCutoff (k n d : ℕ) : ℚ :=
  -4 * ((d / (k - 1) : ℕ) * delta k n - 1)

theorem stratumCutoff_quotient_remainder (k n d m : ℕ) (hk : 3 ≤ k) :
    stratumCutoff k n d m = 2 * (d : ℚ) * n -
      4 * (m / (k - 1) : ℕ) * delta k n + 4 * ((m % (k - 1) : ℕ) + (1 : ℚ)) := by
  sorry

theorem stratumCutoff_le_conservative (k n d m : ℕ) (hk : 3 ≤ k)
    (hδ : 0 < delta k n) (hm : d ≤ m) :
    stratumCutoff k n d m ≤ conservativeMinorCutoff k n d := by
  sorry

theorem conservativeComparison_reaches_zero (k n d : ℕ) :
    conservativeComparisonCutoff k n d < 0 ↔
      (k - 1 : ℕ) < (d / (k - 1) : ℕ) * delta k n := by
  sorry

example : stratumCutoff 3 24 4 5 = 192 := by
  sorry

example : 2 * (4 : ℚ) * 24 + 4 - 4 * (4 / (3 - 1) : ℕ) * delta 3 24 = 188 := by
  sorry

example : conservativeComparisonCutoff 3 40 2 = -4 := by
  sorry

example : conservativeComparisonCutoff 3 32 2 = 0 := by
  sorry

example : sharpComparisonCutoff 3 24 2 = 0 := by
  sorry

/- GCM.11: the scalar phase and algebraic nonemptiness witness use existing carriers. -/

def clampedPhaseLift (s r : ℝ) : ℝ := max 0 (min 1 ((s - r) / r))

def shrinkingPhase (s r : ℝ) : ℂ :=
  Complex.exp ((↑(2 * Real.pi * clampedPhaseLift s r) : ℂ) * Complex.I)

theorem shrinkingPhase_continuous :
    ContinuousOn (fun p : ℝ × ℝ => shrinkingPhase p.1 p.2) {p | 0 < p.2} := by
  sorry

theorem shrinkingPhase_endpoints (r : ℝ) (hr : 0 < r) (hr4 : r ≤ 1 / 4) :
    shrinkingPhase 0 r = 1 ∧ shrinkingPhase 1 r = 1 := by
  sorry

theorem shrinkingPhase_pointwise_tail (s : ℝ) (hs : s ∈ Set.Icc 0 1) :
    ∃ r₀ > (0 : ℝ), ∀ r, 0 < r → r < r₀ → shrinkingPhase s r = 1 := by
  sorry

theorem shrinkingPhase_midpoint (r : ℝ) (hr : 0 < r) :
    shrinkingPhase (3 * r / 2) r = -1 := by
  sorry

example (r : ℝ) (hr : 0 < r) : clampedPhaseLift r r = 0 := by
  sorry

example (r : ℝ) (hr : 0 < r) : clampedPhaseLift (3 * r / 2) r = 1 / 2 := by
  sorry

example (r : ℝ) (hr : 0 < r) : clampedPhaseLift (2 * r) r = 1 := by
  sorry

def fermatReferenceTuple (n d : ℕ) (ζ : ℂ) : Fin n → Polynomial ℂ :=
  fun j => if j.val = 0 then Polynomial.X ^ d else
    if j.val = 1 then Polynomial.C ζ * Polynomial.X ^ d else
      if j.val = 2 then 1 else 0

theorem fermatReference_equation (n d k : ℕ) (ζ : ℂ) (hn : 3 ≤ n)
    (hζ : ζ ^ k = -1) :
    ∑ j : Fin n, (fermatReferenceTuple n d ζ j) ^ k = 1 := by
  sorry

example (d : ℕ) (ζ : ℂ) : fermatReferenceTuple 3 d ζ ⟨2, by omega⟩ = 1 := by
  sorry

/- GCM.12: only the scalar part of the fixed-radius collar is stated here. -/

def collarNormalInterpolate (a : ℝ) (w : ℂ) : ℂ :=
  1 + (1 - (a : ℂ)) * (w - 1)

theorem collarNormalInterpolate_bound (a : ℝ) (ha : a ∈ Set.Icc 0 1)
    (w : ℂ) (hw : ‖w - 1‖ < (1 / 2 : ℝ)) :
    ‖collarNormalInterpolate a w - 1‖ < (1 / 2 : ℝ) := by
  sorry

theorem collarNormalInterpolate_ne_zero (a : ℝ) (ha : a ∈ Set.Icc 0 1)
    (w : ℂ) (hw : ‖w - 1‖ < (1 / 2 : ℝ)) :
    collarNormalInterpolate a w ≠ 0 := by
  sorry

example (w : ℂ) : collarNormalInterpolate 0 w = w := by
  sorry

example (w : ℂ) : collarNormalInterpolate 1 w = 1 := by
  sorry

example : collarNormalInterpolate (1 / 2) (-1) = 0 := by
  sorry

end TauCeti.GeometricCircleMethod
