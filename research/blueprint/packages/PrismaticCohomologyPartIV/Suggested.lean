import Mathlib

/-!
# Prismatic cohomology, Part IV

The logarithmic correction is multiplicative after adding one and scaling by p.
These polynomial witnesses use raw operations on existing rings; geometric delta-log
structures, chart exactification and completed sites have the p-local hypotheses in
README.md. Ordered merge maps use the cochain sign fixed in Part II.
-/

namespace TauCetiRoadmap.PrismaticCohomologyPartIV

namespace Log

variable {R M : Type*} [CommRing R] [CommMonoid M]

/-- The logarithmic Frobenius correction factor. -/
def unitFactor (p : ℕ) (logDelta : M → R) (m : M) : R := 1 + (p : R) * logDelta m

/-- The cross term in logarithmic delta is required for multiplicativity. -/
theorem unitFactor_mul (p : ℕ) (logDelta : M → R)
    (hmul : ∀ m n, logDelta (m * n) =
      logDelta m + logDelta n + (p : R) * logDelta m * logDelta n) (m n : M) :
    unitFactor p logDelta (m * n) = unitFactor p logDelta m * unitFactor p logDelta n := by
  rw [unitFactor, hmul]
  simp only [unitFactor]
  ring

/-- The chart compatibility is an equality without cancellation of the chart section. -/
theorem frobenius_chart (p : ℕ) (alpha : M →* R) (delta : R → R) (logDelta : M → R)
    (hcompat : ∀ m, alpha m ^ p * logDelta m = delta (alpha m)) (m : M) :
    alpha m ^ p + (p : R) * delta (alpha m) = alpha m ^ p * unitFactor p logDelta m := by
  rw [← hcompat]
  simp only [unitFactor]
  ring

/-- The unit section gives correction factor one. -/
example (p : ℕ) (logDelta : M → R) (h : logDelta 1 = 0) :
    unitFactor p logDelta 1 = 1 := by simp [unitFactor, h]

/-- At p = 2 a logarithmic delta value one gives factor three. -/
example (logDelta : M → ℤ) (m : M) (h : logDelta m = 1) :
    unitFactor 2 logDelta m = 3 := by norm_num [unitFactor, h]

/-- The product has value four and correction factor nine, not an additive value two. -/
example (logDelta : M → ℤ)
    (hmul : ∀ m n, logDelta (m * n) = logDelta m + logDelta n + 2 * logDelta m * logDelta n)
    (m : M) (h : logDelta m = 1) :
    logDelta (m * m) = 4 ∧ unitFactor 2 logDelta (m * m) = 9 := by
  have hh : logDelta (m * m) = 4 := by rw [hmul, h]; norm_num
  exact ⟨hh, by norm_num [unitFactor, hh]⟩

/-- For the zero chart section, compatibility does not determine logarithmic delta. -/
example : (0 : ℤ) ^ 2 * unitFactor 2 (fun _ : ℕ ↦ (0 : ℤ)) 2 =
    0 ^ 2 * unitFactor 2 (fun _ : ℕ ↦ (1 : ℤ)) 2 ∧
    unitFactor 2 (fun _ : ℕ ↦ (0 : ℤ)) 2 ≠
      unitFactor 2 (fun _ : ℕ ↦ (1 : ℤ)) 2 := by
  norm_num [unitFactor]

/-- The ordered merge telescopes, retaining its q-dependent coefficient. -/
example (q : R) : (1 + q) + q ^ 2 * (1 + q) = 1 + q + q ^ 2 + q ^ 3 := by ring

/-- For d¹(u,v)=Bu−Av, the swapped merge minus the original is H²d¹,
where H²(w)=(q−1)w. This fixes the homotopy sign without cancelling q−1. -/
example (q A B u v : R) (hA : q ^ 2 - 1 = (q - 1) * A)
    (hB : q - 1 = (q - 1) * B) :
    (q - 1) * u + (1 - q ^ 2) * v = (q - 1) * (B * u - A * v) := by
  calc
    (q - 1) * u + (1 - q ^ 2) * v = (q - 1) * B * u - (q - 1) * A * v := by
      rw [← hA, ← hB]; ring
    _ = (q - 1) * (B * u - A * v) := by ring

/-- The intrinsic generator of 2ℤ is retained at p = 2: its coefficient is one. -/
example : (2 : ℤ) ∈ AddSubgroup.zmultiples (2 : ℤ) ∧
    (1 : ℤ) ∉ AddSubgroup.zmultiples (2 : ℤ) := by
  simp [Int.mem_zmultiples_iff]

/-- The first two dyadic factorial contraction exponents are one and three. -/
example : 2 ∣ Nat.factorial 2 ∧ ¬ 4 ∣ Nat.factorial 2 ∧
    8 ∣ Nat.factorial 4 ∧ ¬ 16 ∣ Nat.factorial 4 := by decide

end Log

end TauCetiRoadmap.PrismaticCohomologyPartIV
