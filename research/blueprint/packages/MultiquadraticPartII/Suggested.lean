import Mathlib
import TauCeti.NumberTheory.Multiquadratic.Quadratic.GenusCharacter.OrdinaryTwoRank
import TauCeti.NumberTheory.NumberField.NarrowClassGroup.Finite

/-!
# MultiquadraticPartII: representative target signatures

The roadmap is README.md. This file records definitions and theorem signatures
statable against the pinned Mathlib and Tau Ceti APIs and is not exhaustive.
It uses the existing narrow class group, the additive genus quotient, the
prime-discriminant genus characters and fractional ideals. Binary quadratic
forms are integer coefficient triples `(a, b, c)`, standing for
`a x² + b x y + c y²`; Mathlib's `QuadraticForm ℤ (Fin 2 → ℤ)` is not used
because its discriminant needs `2` to be invertible. The genus character of a
form is a real-bodied definition that evaluates the Kronecker character at a
represented integer chosen by choice; its independence of that choice is the
evaluation law below. The form/ideal comparison is stated with the explicit
coefficient ideal of the form, so it does not depend on an oriented
form–ideal bijection.

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/

open Polynomial NumberField TauCeti.Multiquadratic
open scoped NumberField nonZeroDivisors

namespace TauCetiRoadmap.MultiquadraticPartII

variable {K : Type*} [Field K] [NumberField K] {θ : 𝓞 K} {d : ℤ}

/-! ## Layer 0: the quadratic narrow defect -/

/-- The quadratic narrow-to-wide kernel is the displayed pair, with coincident
entries allowed. The quadratic presentation suffices for either signature.
(Duke–Imamoḡlu–Tóth, §2, pp.950–951.) -/
theorem ker_toClassGroup_eq_pair
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (A : NarrowClassGroup K) :
    NarrowClassGroup.toClassGroup A = 1 ↔
      A = 1 ∨ A = NarrowClassGroup.mkPrincipal
        (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin)) := by
  sorry

/-- A real class character has a unique wide descent exactly when it kills
the distinguished principal class. Both quantified maps are homomorphisms.
(Duke–Imamoḡlu–Tóth, §7, p.971, after (7.7).) -/
theorem existsUnique_wideCharacter_iff
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (χ : NarrowClassGroup K →* ℤˣ) :
    (∃! ψ : ClassGroup (𝓞 K) →* ℤˣ,
      ψ.comp (NarrowClassGroup.toClassGroup (K := K)) = χ) ↔
      χ (NarrowClassGroup.mkPrincipal
        (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))) = 1 := by
  sorry

/-! ## Layer 1: the number of classes in a narrow genus -/

/-- Every narrow genus has the narrow class number divided by the genus
quotient cardinality. The integral identity avoids negative natural exponents
and also holds for imaginary quadratic presentations.
(Duke–Imamoḡlu–Tóth, §4, p.959, (4.1)–(4.2).) -/
theorem card_genusFiber_mul_twoPow {s : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d)
    (g : NarrowClassGroup.ElementaryTwoQuotient K) :
    2 ^ (s.card - 1) *
      Nat.card {A : NarrowClassGroup K // TauCeti.elementaryTwoQuotientMk A = g} =
        Nat.card (NarrowClassGroup K) := by
  sorry

/-! ## Layer 2: signs, principal genera and arithmetic criteria -/

/-- The composite genus character on the different class is the sign of
either complementary factor. Positivity of the discriminant is essential.
(Duke–Imamoḡlu–Tóth, §7, p.971, before (7.8), in the real case.) -/
theorem genusCharacter_J_eq_sign_prod {s t : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d)
    (hd : 0 < d) (hts : t ⊆ s) :
    ((genusCharFunNarrowClassGroupHom hs heven hprod hmin hgen hsf hts
      (NarrowClassGroup.mkPrincipal
        (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin)))) : ℤ) =
          (∏ P ∈ t, P).sign ∧
      (∏ P ∈ t, P).sign = (∏ P ∈ s \ t, P).sign := by
  sorry

/-- A positive signed prime-discriminant product has all factors positive
exactly when no prime of residue three modulo four divides it. This includes
the empty factorization of one. (Duke–Imamoḡlu–Tóth, §4, p.960.) -/
theorem primeDiscriminants_positive_iff {D : ℤ} {s : Finset ℤ}
    (hD : 0 < D) (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = D) :
    (∀ P ∈ s, 0 < P) ↔
      ∀ p : ℕ, p.Prime → (p : ℤ) ∣ D → p % 4 ≠ 3 := by
  sorry

/-- For a positive fundamental discriminant, the general two-square
valuation criterion becomes a no-prime-divisor criterion. Zero coordinates and
nonprimitive representations are allowed. (Duke–Imamoḡlu–Tóth, §4, p.960.) -/
theorem fundamental_sumTwoSquares_iff {D : ℤ}
    (hD : 0 < D) (hfund : IsFundamentalDiscriminant D) :
    (∃ x y : ℤ, D = x ^ 2 + y ^ 2) ↔
      ∀ p : ℕ, p.Prime → (p : ℤ) ∣ D → p % 4 ≠ 3 := by
  sorry

/-- The different class is square exactly when the positive fundamental
discriminant has no prime divisor of residue three, or is a sum of two squares.
This does not assert that the class is trivial.
(Duke–Imamoḡlu–Tóth, §4, p.960; §7, p.971.) -/
theorem J_square_iff_sumTwoSquares {s : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d)
    (hd : 0 < d) :
    (IsSquare (NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))) ↔
        ∀ p : ℕ, p.Prime → (p : ℤ) ∣ fundamentalDiscriminant d → p % 4 ≠ 3) ∧
    (IsSquare (NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))) ↔
        ∃ x y : ℤ, fundamentalDiscriminant d = x ^ 2 + y ^ 2) := by
  sorry

/-- A prime divisor of residue three obstructs a trivial different class
and a norm minus one integral unit, and forces the narrow/wide class-number
ratio to be two. (Duke–Imamoḡlu–Tóth, §2, p.951.) -/
theorem J_ne_one_of_prime_threeModFour {s : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d)
    (hd : 0 < d) {p : ℕ} (hp : p.Prime)
    (hpD : (p : ℤ) ∣ fundamentalDiscriminant d) (hp4 : p % 4 = 3) :
    NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin)) ≠ 1 ∧
    ¬ (∃ u : (𝓞 K)ˣ, Algebra.norm ℚ (((u : 𝓞 K) : K)) = -1) ∧
    Nat.card (NarrowClassGroup K) = 2 * Nat.card (ClassGroup (𝓞 K)) := by
  sorry

/-! ## Layer 3: genus characters of binary forms -/

/-- The genus character `χ_δ([a, b, c])`, `δ = ∏ P ∈ t, P`: the value of `genusCharFun t` at an
integer represented by `a x² + b x y + c y²` and coprime to `δ`, and `0` if there is none. The
represented integer is chosen by choice; when `δ` is a fundamental divisor of the discriminant the
value does not depend on the choice (`binaryFormGenusChar_eq_of_represents`). This is the genus
character of Duke–Imamoḡlu–Tóth, §9, p.978, and Gross–Kohnen–Zagier, Ch. I §2, p.508, including
its zero value on forms whose content meets `δ`. -/
noncomputable def binaryFormGenusChar (t : Finset ℤ) (a b c : ℤ) : ℤ := by
  classical
  exact if h : ∃ m : ℤ, IsCoprime m (∏ P ∈ t, P) ∧
      ∃ x y : ℤ, a * x ^ 2 + b * x * y + c * y ^ 2 = m then
    genusCharFun t h.choose
  else 0

/-- Evaluation law: if `δ = ∏ P ∈ t, P` is a fundamental divisor of `b² - 4ac`, the form
character is the Kronecker character at any represented integer coprime to `δ`, of either sign.
The congruence condition on the cofactor cannot be dropped: `x² + 2y²` has discriminant
`(-4) · 2` and represents `1` and `3`. (Gross–Kohnen–Zagier, Ch. I §2, pp.508–509.) -/
theorem binaryFormGenusChar_eq_of_represents {t : Finset ℤ}
    (ht : ∀ P ∈ t, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ t, ∀ P' ∈ t,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    {a b c δ' : ℤ} (hδ' : δ' % 4 = 0 ∨ δ' % 4 = 1)
    (hdisc : b ^ 2 - 4 * a * c = (∏ P ∈ t, P) * δ') {x y : ℤ}
    (hcop : IsCoprime (a * x ^ 2 + b * x * y + c * y ^ 2) (∏ P ∈ t, P)) :
    binaryFormGenusChar t a b c = genusCharFun t (a * x ^ 2 + b * x * y + c * y ^ 2) := by
  sorry

/-- Zero law: the form character vanishes exactly when the content of the form is not coprime
to `δ`. A form whose content is coprime to `δ` represents an integer coprime to `δ`.
(Gross–Kohnen–Zagier, Ch. I §2, pp.508–509.) -/
theorem binaryFormGenusChar_eq_zero_iff {t : Finset ℤ}
    (ht : ∀ P ∈ t, IsPrimeDiscriminant P) (a b c : ℤ) :
    binaryFormGenusChar t a b c = 0 ↔
      ¬ IsCoprime (Int.gcd a (Int.gcd b c) : ℤ) (∏ P ∈ t, P) := by
  sorry

/-- The form character at a positive fundamental discriminant is the narrow ideal genus
character of the oriented class of the form's coefficient ideal `a ℤ + ((-b + ω) / 2) ℤ`,
`ω² = D`: the class of that ideal when `a > 0`, and `J` times it when `a < 0`. Either square
root `ω` may be used. (Duke–Imamoḡlu–Tóth, §2, p.952, and §9, p.978, before Proposition 5.) -/
theorem formCharacter_eq_idealCharacter {s t : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d)
    (hd : 0 < d) (hts : t ⊆ s)
    (ω : K) (hω : ω ^ 2 = (fundamentalDiscriminant d : K))
    (a b c : ℤ) (hdisc : b ^ 2 - 4 * a * c = fundamentalDiscriminant d)
    (𝔞 : (FractionalIdeal (𝓞 K)⁰ K)ˣ)
    (h𝔞 : ∀ z : K, z ∈ (𝔞 : FractionalIdeal (𝓞 K)⁰ K) ↔
      ∃ u v : ℤ, z = u * a + v * ((-b + ω) / 2)) :
    binaryFormGenusChar t a b c =
      ((genusCharFunNarrowClassGroupHom hs heven hprod hmin hgen hsf hts
        (if 0 < a then NarrowClassGroup.mk 𝔞
          else NarrowClassGroup.mkPrincipal
              (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin)) *
            NarrowClassGroup.mk 𝔞) : ℤˣ) : ℤ) := by
  sorry

/-! ## Examples and negative controls -/

-- The trivial real character has a unique wide descent.
example : ∃! ψ : ClassGroup (𝓞 K) →* ℤˣ,
    ψ.comp (NarrowClassGroup.toClassGroup (K := K)) = 1 := by
  refine ⟨1, MonoidHom.one_comp _, fun ψ hψ => MonoidHom.ext fun x => ?_⟩
  obtain ⟨y, rfl⟩ := NarrowClassGroup.toClassGroup_surjective x
  simpa using DFunLike.congr_fun hψ y

-- A character odd on J cannot descend.
example (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (χ : NarrowClassGroup K →* ℤˣ)
    (hodd : χ (NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))) = -1) :
    ¬ ∃ ψ : ClassGroup (𝓞 K) →* ℤˣ,
      ψ.comp (NarrowClassGroup.toClassGroup (K := K)) = χ := by
  rintro ⟨ψ, hψ⟩
  have h := DFunLike.congr_fun hψ (NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin)))
  simp only [MonoidHom.coe_comp, Function.comp_apply, NarrowClassGroup.toClassGroup_mkPrincipal,
    map_one] at h
  rw [hodd] at h
  exact absurd h (by decide)

-- The quotient and two-torsion subgroup must not be substituted for each other.
example : Nat.card {x : Multiplicative (ZMod 8) //
    TauCeti.elementaryTwoQuotientMk x = 0} = 4 := by
  sorry

example : Nat.card {x : Multiplicative (ZMod 8) // x ^ 2 = 1} = 2 := by
  rw [Nat.card_eq_fintype_card]
  decide

-- The D=1 arithmetic boundary is allowed, although it is not a quadratic field.
example : (∃ x y : ℤ, (1 : ℤ) = x ^ 2 + y ^ 2) ∧
    (∀ p : ℕ, p.Prime → (p : ℤ) ∣ (1 : ℤ) → p % 4 ≠ 3) := by
  refine ⟨⟨1, 0, by norm_num⟩, fun p hp h => ?_⟩
  have : p ∣ 1 := by exact_mod_cast h
  exact absurd (Nat.dvd_one.mp this) hp.ne_one

example : (5 : ℤ) = 1 ^ 2 + 2 ^ 2 := by norm_num

example : (8 : ℤ) = 2 ^ 2 + 2 ^ 2 := by norm_num

example : (136 : ℤ) = 6 ^ 2 + 10 ^ 2 := by norm_num

example : ¬ ∃ x y : ℤ, (12 : ℤ) = x ^ 2 + y ^ 2 := by
  rintro ⟨x, y, h⟩
  have hx1 : x ≤ 3 := by nlinarith [sq_nonneg y, sq_nonneg (x - 4)]
  have hx2 : -3 ≤ x := by nlinarith [sq_nonneg y, sq_nonneg (x + 4)]
  have hy1 : y ≤ 3 := by nlinarith [sq_nonneg x, sq_nonneg (y - 4)]
  have hy2 : -3 ≤ y := by nlinarith [sq_nonneg x, sq_nonneg (y + 4)]
  interval_cases x <;> interval_cases y <;> omega

-- Nonfundamental 9 demonstrates why odd prime valuations matter.
example : (∃ x y : ℤ, (9 : ℤ) = x ^ 2 + y ^ 2) ∧
    (3 : ℤ) ∣ (9 : ℤ) ∧ (3 : ℕ) % 4 = 3 :=
  ⟨⟨0, 3, by norm_num⟩, by norm_num, by norm_num⟩

-- Arithmetic dyadic signs agree with the singleton J formula at the pin.
example : genusCharFun ({-4} : Finset ℤ) (-1) = -1 := by
  simp [genusCharFun, primeDiscriminantCharFun]
  decide

example : genusCharFun ({-8} : Finset ℤ) (-1) = -1 := by
  simp [genusCharFun, primeDiscriminantCharFun]
  decide

example : genusCharFun ({8} : Finset ℤ) (-1) = 1 := by
  simp [genusCharFun, primeDiscriminantCharFun]
  decide

example : genusCharFun (∅ : Finset ℤ) (-1) = 1 := by
  simp

example (hmin : minpoly ℤ θ = X ^ 2 - C (3 : ℤ))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    ¬ IsSquare (NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))) := by
  sorry

example (hmin : minpoly ℤ θ = X ^ 2 - C (34 : ℤ))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    IsSquare (NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))) := by
  sorry

-- Complementary factor signs differ at negative discriminant.
example : (1 : ℤ).sign ≠ (-4 : ℤ).sign := by decide

-- The form character is 1 for the empty factor, on every form.
example (a b c : ℤ) : binaryFormGenusChar ∅ a b c = 1 := by
  unfold binaryFormGenusChar
  split_ifs with h
  · simp
  · exact absurd ⟨a, by simpa using isCoprime_one_right, 1, 0, by ring⟩ h

-- The imprimitive form [2, 0, -6] of discriminant 48 = (-4)(-12) has character 0 for δ = -4.
example : binaryFormGenusChar {-4} 2 0 (-6) = 0 := by
  unfold binaryFormGenusChar
  split_ifs with h
  · obtain ⟨m, hm, x, y, rfl⟩ := h
    have h2 : (2 : ℤ) ∣ 2 * x ^ 2 + 0 * x * y + -6 * y ^ 2 := ⟨x ^ 2 - 3 * y ^ 2, by ring⟩
    have h4 : (2 : ℤ) ∣ ∏ P ∈ ({-4} : Finset ℤ), P := by simp
    have := IsCoprime.isUnit_of_dvd' hm h2 h4
    norm_num [Int.isUnit_iff] at this
  · rfl

-- D = 12, δ = -4: x² - 3y² has character 1 and -x² + 3y² has character -1.
example : binaryFormGenusChar {-4} 1 0 (-3) = 1 := by
  sorry

example : binaryFormGenusChar {-4} (-1) 0 3 = -1 := by
  sorry

-- The values 1 = Q(1, 0) and -3 = Q(0, 1) of x² - 3y² give the same character value:
-- evaluation at |m| would be wrong.
example : genusCharFun ({-4} : Finset ℤ) 1 = 1 ∧ genusCharFun ({-4} : Finset ℤ) (-3) = 1 ∧
    genusCharFun ({-4} : Finset ℤ) 3 = -1 := by
  simp [genusCharFun, primeDiscriminantCharFun]
  decide

-- x² + 2y² (discriminant (-4) · 2, cofactor 2 not 0 or 1 mod 4) represents 1 and 3, where the
-- character of -4 differs: the evaluation law needs its congruence hypothesis.
example : (1 : ℤ) = 1 ^ 2 + 2 * 0 ^ 2 ∧ (3 : ℤ) = 1 ^ 2 + 2 * 1 ^ 2 ∧
    genusCharFun ({-4} : Finset ℤ) 1 ≠ genusCharFun ({-4} : Finset ℤ) 3 := by
  refine ⟨by norm_num, by norm_num, ?_⟩
  simp [genusCharFun, primeDiscriminantCharFun]

-- Discriminant -15 = 5 · (-3): [2, 1, 2] represents 2 and (5/2) = -1.
example : genusCharFun ({5} : Finset ℤ) 2 = -1 := by
  simp [genusCharFun, primeDiscriminantCharFun]
  norm_num

-- 48 is not fundamental, so [2, 0, -6] lies outside the comparison of 3.2.
example : ¬ IsFundamentalDiscriminant (48 : ℤ) := by
  rintro (⟨h, -⟩ | ⟨m, hm, h, -⟩)
  · norm_num at h
  · omega

end TauCetiRoadmap.MultiquadraticPartII
