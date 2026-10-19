import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Fin.VecNotation
import Mathlib.Basic.Real.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import TauCeti.LinearAlgebra.SymmetricPower.Basis

/-!
# Weight multiplicities: suggested forms

The definitive roadmap is
research/blueprint/readmes/ArithmeticLocallySymmetricSpacesPartII.md.
This file is not exhaustive and does not implement the roadmap. It suggests
forms for light scalar definitions and milestones statable at the pins:
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

The proper-face coefficients have an unused full-subset entry, so ordinary
finite functions suffice; this entry never affects evaluation. Nonnegative
coefficients and positive coordinates are hypotheses of the bounds.

The numeric weight-size function extends the formula to real coordinates.
Only even integral coordinates at least two define the arithmetic coefficient
systems in the README. No arithmetic meaning is assigned to other inputs.

The cyclic estimate, rank theorem, completed-homology descent, automorphic
bounds, cusp complex and base-change count remain full README targets: their
carriers and supplier comparisons are not available at these pins. There are
no replacement module structures, invented proposition fields or sorry'd data
representing them here. The examples below test the scalar conventions and the
existing symmetric-power carrier; the README supplies the heavy-object tests.
All proofs are placeholders, and all packet nodes remain unchecked.
-/

noncomputable section

open scoped BigOperators TensorProduct

namespace TauCetiRoadmap.WeightMultiplicity

/-- The actual coefficient dimension is evaluated at `x i = k i + 1`. -/
def weightProduct {m : ℕ} (x : Fin m → ℝ) : ℝ := ∏ i, x i

/-- Sum over proper coordinate subsets; the full coefficient is ignored. -/
def faceMajorant {m : ℕ} (c : Finset (Fin m) → ℝ) (x : Fin m → ℝ) : ℝ :=
  ∑ s ∈ (Finset.univ.powerset.erase Finset.univ), c s * ∏ i ∈ s, x i

/-- Archimedean size: every complex place contributes a squared factor. -/
def weightSize {r s : ℕ} (kr : Fin r → ℝ) (kc : Fin s → ℝ) : ℝ :=
  (∏ i, kr i) * ∏ j, (kc j) ^ 2

/-- WM.0: one omitted coordinate gives a factor of the minimum weight. -/
theorem minimum_weight_saving {m : ℕ} (hm : 0 < m)
    (c : Finset (Fin m) → ℝ) (x : Fin m → ℝ) (a : ℝ)
    (hc : ∀ t ≠ Finset.univ, 0 ≤ c t) (ha : 1 ≤ a)
    (hx : ∀ i, a ≤ x i) :
    faceMajorant c x ≤
      (∑ t ∈ (Finset.univ.powerset.erase Finset.univ), c t) * weightProduct x / a := by
  sorry

/-- WM.0: the parallel proper-face bound has degree at most `m - 1`. -/
theorem parallel_face_bound {m : ℕ} (hm : 0 < m)
    (c : Finset (Fin m) → ℝ) (hc : ∀ t ≠ Finset.univ, 0 ≤ c t)
    (k : ℝ) (hk : 1 ≤ k) :
    faceMajorant c (fun _ => k) ≤
      (∑ t ∈ (Finset.univ.powerset.erase Finset.univ), c t) * k ^ (m - 1) := by
  sorry

/-- WM.3: retain the number of embeddings, rather than the number of places. -/
theorem weightSize_parallel (r s : ℕ) (k : ℝ) :
    weightSize (fun _ : Fin r => k) (fun _ : Fin s => k) = k ^ (r + 2 * s) := by
  sorry

/-- WM.4: the scalar conversion used after arithmetic descent. -/
theorem global_size_conversion {m : ℕ} (hm : 0 < m)
    (c : Finset (Fin m) → ℝ) (x : Fin m → ℝ) (f delta kappa : ℝ)
    (hc : ∀ t ≠ Finset.univ, 0 ≤ c t) (hk : 2 ≤ kappa)
    (hx : ∀ i, kappa / 2 ≤ x i) (hd : weightProduct x ≤ delta)
    (hf : f ≤ faceMajorant c x) :
    f ≤ (2 * ∑ t ∈ (Finset.univ.powerset.erase Finset.univ), c t) * delta / kappa := by
  sorry

/-- The symmetric-power dimension check uses Tau Ceti's existing carrier. -/
theorem symmetricPower_standard_finrank (n : ℕ) :
    Module.finrank ℚ (Sym[ℚ]^n (Fin 2 → ℚ)) = n + 1 := by
  sorry

-- A product is not the sum; shifting weight zero gives dimension one.
example : weightProduct ![(2 : ℝ), 4] = 8 := by sorry
example : weightProduct (fun _ : Fin 0 => (37 : ℝ)) = 1 := by sorry
example : weightProduct ![(1 : ℝ), 1] = 1 := by sorry

-- Rank one admits only the constant proper-face monomial.
example (x : Fin 1 → ℝ) : faceMajorant (fun _ => 7) x = 7 := by sorry

example : faceMajorant
    (fun t : Finset (Fin 3) => if t = ∅ then 2 else if t = {0, 2} then 3 else 0)
    ![(2 : ℝ), 5, 4] = 26 := by sorry

-- A low-coordinate strip is infinite and its allowed bound can grow.
example (t : ℝ) : faceMajorant
    (fun s : Finset (Fin 2) => if s = {1} then 7 else 0) ![(1 : ℝ), t] = 7 * t := by
  sorry

-- A coefficient at the full subset is ignored.
example (x : Fin 2 → ℝ) : faceMajorant
    (fun s : Finset (Fin 2) => if s = Finset.univ then 99 else 0) x = 0 := by sorry

-- Bianchi weight six has size 36, while its coefficient dimension is nine.
example : weightSize (fun _ : Fin 0 => (0 : ℝ)) ![(6 : ℝ)] = 36 := by sorry
example : Module.finrank ℚ (Sym[ℚ]^2 (Fin 2 → ℚ)) = 3 := by sorry

-- A real weight four and complex weight six give size 4 * 6^2.
example : weightSize ![(4 : ℝ)] ![(6 : ℝ)] = 144 := by sorry

end TauCetiRoadmap.WeightMultiplicity
