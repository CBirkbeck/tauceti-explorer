import Mathlib
import TauCeti.NumberTheory.Multiquadratic.Quadratic.GenusCharacter.OrdinaryTwoRank
import TauCeti.NumberTheory.NumberField.NarrowClassGroup.Finite

/-!
# MultiquadraticPartII: representative target signatures

The roadmap is README.md. This file records theorem signatures statable
against the pinned Mathlib and Tau Ceti APIs and is not exhaustive. It uses
the existing narrow class group, additive genus quotient and binary quadratic
form carrier. The last theorem gives an explicit norm-witness comparison;
the canonical form character, oriented dictionary specialization and its zero
test are specified by the supplier contracts in the README.

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

/-! ## Layer 3: fundamental form and ideal characters -/

/-- The witness form of the fundamental form/ideal character comparison.
The form function has the positive represented-value law; the nonzero integral
ideal has that norm and the inverse narrow class. These are explicit supplier
laws, not the comparison conclusion. The canonical character and oriented
dictionary instantiation are the README target.
(Duke–Imamoḡlu–Tóth, §2, p.952; §9, p.978, before Proposition 5.) -/
theorem formCharacter_eq_idealCharacter {s t : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d)
    (hd : 0 < d) (hts : t ⊆ s)
    (Q : QuadraticForm ℤ (Fin 2 → ℤ)) (a b c : ℤ)
    (hQ : ∀ v, Q v = a * (v 0) ^ 2 + b * v 0 * v 1 + c * (v 1) ^ 2)
    (hdisc : b ^ 2 - 4 * a * c = fundamentalDiscriminant d)
    (hprim : Int.gcd a (Int.gcd b c : ℤ) = 1)
    (formChar : QuadraticForm ℤ (Fin 2 → ℤ) → ℤ)
    (hform : ∀ v, 0 < Q v → IsCoprime (Q v) (∏ P ∈ t, P) →
      formChar Q = genusCharFun t (Q v))
    (A : NarrowClassGroup K) (m : ℕ) (hm : 0 < m)
    (v : Fin 2 → ℤ) (hrep : Q v = (m : ℤ))
    (I : Ideal (𝓞 K)) (hI : I ∈ (Ideal (𝓞 K))⁰)
    (hnorm : Ideal.absNorm I = m)
    (hclass : NarrowClassGroup.mk0 ⟨I, hI⟩ = A⁻¹)
    (hcop : IsCoprime (m : ℤ) (∏ P ∈ t, P)) :
    formChar Q =
      ((genusCharFunNarrowClassGroupHom hs heven hprod hmin hgen hsf hts A) : ℤ) := by
  sorry

/-! ## Examples and negative controls -/

-- The trivial real character has a unique wide descent.
example : ∃! ψ : ClassGroup (𝓞 K) →* ℤˣ,
    ψ.comp (NarrowClassGroup.toClassGroup (K := K)) = 1 := by
  sorry

-- A character odd on J cannot descend.
example (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (χ : NarrowClassGroup K →* ℤˣ)
    (hodd : χ (NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))) = -1) :
    ¬ ∃ ψ : ClassGroup (𝓞 K) →* ℤˣ,
      ψ.comp (NarrowClassGroup.toClassGroup (K := K)) = χ := by
  sorry

-- The quotient and two-torsion subgroup must not be substituted for each other.
example : Nat.card {x : Multiplicative (ZMod 8) //
    TauCeti.elementaryTwoQuotientMk x = 0} = 4 := by
  sorry

example : Nat.card {x : Multiplicative (ZMod 8) // x ^ 2 = 1} = 2 := by
  sorry

-- The D=1 arithmetic boundary is allowed, although it is not a quadratic field.
example : (∃ x y : ℤ, (1 : ℤ) = x ^ 2 + y ^ 2) ∧
    (∀ p : ℕ, p.Prime → (p : ℤ) ∣ (1 : ℤ) → p % 4 ≠ 3) := by
  sorry

example : (5 : ℤ) = 1 ^ 2 + 2 ^ 2 := by
  sorry

example : (8 : ℤ) = 2 ^ 2 + 2 ^ 2 := by
  sorry

example : (136 : ℤ) = 6 ^ 2 + 10 ^ 2 := by
  sorry

example : ¬ ∃ x y : ℤ, (12 : ℤ) = x ^ 2 + y ^ 2 := by
  sorry

-- Nonfundamental 9 demonstrates why odd prime valuations matter.
example : (∃ x y : ℤ, (9 : ℤ) = x ^ 2 + y ^ 2) ∧
    (3 : ℤ) ∣ (9 : ℤ) ∧ (3 : ℕ) % 4 = 3 := by
  sorry

-- Arithmetic dyadic signs agree with the singleton J formula at the pin.
example : genusCharFun ({-4} : Finset ℤ) (-1) = -1 := by
  sorry

example : genusCharFun ({-8} : Finset ℤ) (-1) = -1 := by
  sorry

example : genusCharFun ({8} : Finset ℤ) (-1) = 1 := by
  sorry

example : genusCharFun (∅ : Finset ℤ) (-1) = 1 := by
  sorry

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
example : (1 : ℤ).sign ≠ (-4 : ℤ).sign := by
  sorry

-- A positive imprimitive form in the GN supplier's zero domain: D=48=(-4)*(-12).
-- The zero character itself cannot be tested here before the canonical GN API exists.
example : (0 : ℤ) ^ 2 - 4 * 2 * (-6) = 48 ∧
    Int.gcd 2 (Int.gcd 0 (-6) : ℤ) = 2 ∧
    ¬ IsFundamentalDiscriminant (48 : ℤ) := by
  sorry

end TauCetiRoadmap.MultiquadraticPartII
