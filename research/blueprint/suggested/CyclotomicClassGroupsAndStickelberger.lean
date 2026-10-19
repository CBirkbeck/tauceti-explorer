/-
This file is not the roadmap and is not exhaustive. The companion roadmap document is
definitive. These suggested Lean forms let contributors and reviewers converge on names
and signatures; the admitted theorem statements claim no implementation.

Only light definitions and milestones over the pinned carriers occur here. The reader
contains the class-module, relative-unit, cohomology, finite-flat and extension-field
constructions, their complete APIs and discriminating tests. Those require development
of their carriers. In particular Vandiver is stated as a conjecture in the reader only.
-/
import Mathlib
import TauCeti.NumberTheory.ClassGroup.Equiv

open scoped BigOperators
open NumberField
set_option autoImplicit false
namespace CyclotomicClassGroupsAndStickelberger

/-! ## C5 and C6: light class-number predicates -/

/-- Regularity includes the rational conductor-two boundary. -/
def IsRegularPrime (p : ℕ) [NeZero p] : Prop :=
  ¬ p ∣ NumberField.classNumber (CyclotomicField p ℚ)

/-- The statement at one prime, with the native maximal real subfield. -/
def VandiverAt (p : ℕ) [NeZero p] : Prop :=
  ¬ p ∣ NumberField.classNumber
    (NumberField.maximalRealSubfield (CyclotomicField p ℚ))

/-! ## C2: light Stickelberger coefficients -/

/-- Rational group-ring convention: the inverse occurs on the basis element. -/
noncomputable def stickelberger (m : ℕ) [NeZero m] : MonoidAlgebra ℚ (ZMod m)ˣ :=
  ∑ a : (ZMod m)ˣ,
    MonoidAlgebra.single a⁻¹ ((a.val.val : ℚ) / m)

/-- Integral coefficients of the positive smoothing (b - σ_b) θ_m. -/
noncomputable def smoothedStickelberger (m b : ℕ) [NeZero m] : MonoidAlgebra ℤ (ZMod m)ˣ :=
  ∑ a : (ZMod m)ˣ,
    MonoidAlgebra.single a⁻¹ (↑(b * a.val.val / m) : ℤ)

example : (stickelberger 5).coeff (show (ZMod 5)ˣ from ⟨3, 2, by decide, by decide⟩) = 2 / 5 := by
  classical
  norm_num [stickelberger, smoothedStickelberger, MonoidAlgebra.coeff_single, Finsupp.single_apply, inv_eq_iff_eq_inv]
  rfl

example : (stickelberger 5).coeff (show (ZMod 5)ˣ from ⟨2, 3, by decide, by decide⟩) = 3 / 5 := by
  classical
  norm_num [stickelberger, smoothedStickelberger, MonoidAlgebra.coeff_single, Finsupp.single_apply, inv_eq_iff_eq_inv]
  rfl

example : (smoothedStickelberger 5 2).coeff (show (ZMod 5)ˣ from ⟨3, 2, by decide, by decide⟩) = 0 := by
  classical
  norm_num [stickelberger, smoothedStickelberger, MonoidAlgebra.coeff_single, Finsupp.single_apply, inv_eq_iff_eq_inv]
  rfl

example : (smoothedStickelberger 5 2).coeff (show (ZMod 5)ˣ from ⟨2, 3, by decide, by decide⟩) = 1 := by
  classical
  norm_num [stickelberger, smoothedStickelberger, MonoidAlgebra.coeff_single, Finsupp.single_apply, inv_eq_iff_eq_inv]
  rfl

/-- Every positive integral smoothing annihilates the full class group, at every conductor.
The inverse on the automorphism matches the coefficient basis in `stickelberger`. -/
theorem stickelberger_smoothing_annihilates (m b : ℕ) [NeZero m]
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {m} ℚ K]
    (hm : 2 ≤ m) (hb : b.Coprime m)
    (x : ClassGroup (𝓞 K)) :
    (∏ a : (ZMod m)ˣ,
      (ClassGroup.mulEquivHom
        (RingOfIntegers.mapRingEquiv
          (((IsCyclotomicExtension.Rat.galEquivZMod m K).symm a⁻¹).toRingEquiv)) x) ^
        (b * a.val.val / m)) = 1 := by
  sorry

/-! ## C5 and C6: arithmetic milestones -/

/-- Kummer's Bernoulli criterion, with B₁ = -1/2. -/
theorem kummer_criterion (p : ℕ) [NeZero p] (hp : p.Prime) (hodd : p ≠ 2) :
    IsRegularPrime p ↔
      ∀ k : ℕ, 2 ≤ k → k ≤ p - 3 → Even k → ¬ (p : ℤ) ∣ (bernoulli k).num := by
  sorry

/-- Kummer's lemma uses congruence modulo p, rather than modulo 1 - ζ_p. -/
theorem kummer_lemma (p : ℕ) [NeZero p] (hp : p.Prime) (hodd : p ≠ 2)
    (hreg : IsRegularPrime p)
    (u : (𝓞 (CyclotomicField p ℚ))ˣ)
    (hprimary : ∃ a : ℤ, ∃ b : 𝓞 (CyclotomicField p ℚ),
      (u : 𝓞 (CyclotomicField p ℚ)) - a = (p : 𝓞 (CyclotomicField p ℚ)) * b) :
    ∃ v : (𝓞 (CyclotomicField p ℚ))ˣ, v ^ p = u := by
  sorry

/-- Odd-prime regularity kills the p-primary class group at every level. -/
theorem regular_prime_power_class_number (p : ℕ) [NeZero p]
    (hp : p.Prime) (hodd : p ≠ 2) (hreg : IsRegularPrime p) (r : ℕ) (hr : 1 ≤ r) :
    ¬ p ∣ NumberField.classNumber (CyclotomicField (p ^ r) ℚ) := by
  sorry

/-- The dyadic tower has odd class number at every level, including Q. -/
theorem dyadic_class_number (r : ℕ) (hr : 1 ≤ r) :
    ¬ 2 ∣ NumberField.classNumber (CyclotomicField (2 ^ r) ℚ) := by
  sorry

/-- Regularity implies the statement of Vandiver at that prime. -/
theorem vandiver_of_regular (p : ℕ) [NeZero p] (hp : p.Prime)
    (hodd : p ≠ 2) (hreg : IsRegularPrime p) : VandiverAt p := by
  sorry

/-! ## C7: eventual growth, with the dyadic base at conductor four -/

/-- The shift gives degree p^n over Q(ζ_p), or over Q(i) at p=2. -/
theorem cyclotomic_class_number_growth (p : ℕ) [NeZero p] (hp : p.Prime) :
    ∃ mu lam : ℕ, ∃ nu : ℤ, ∃ n₀ : ℕ, ∀ n : ℕ, n₀ ≤ n →
      (padicValNat p (NumberField.classNumber
        (CyclotomicField (p ^ (n + (if p = 2 then 2 else 1))) ℚ)) : ℤ) =
        (mu : ℤ) * (p : ℤ) ^ n + (lam : ℤ) * n + nu := by
  sorry

end CyclotomicClassGroupsAndStickelberger
