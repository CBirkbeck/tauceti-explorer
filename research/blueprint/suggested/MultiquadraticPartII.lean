import Mathlib.GroupTheory.Coset.Card
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.NumberTheory.SumTwoSquares
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import TauCeti.NumberTheory.Multiquadratic.Quadratic.GenusCharacter.OrdinaryTwoRank
import TauCeti.NumberTheory.NumberField.NarrowClassGroup.Finite

/-!
This file is not the roadmap and is not exhaustive. The roadmap and packet
specify the targets and current supplier ownership; the companion reader
`research/blueprint/readmes/MultiquadraticPartII.md` gives detailed conventions. These statements
suggest Lean forms so contributors and reviewers converge on names and signatures.
They are a proposal, not an implementation.

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. The narrow class group, genus quotient,
arithmetic and ideal characters, and quadratic-form carrier already exist there.
No fresh narrow class group, genus, or form carrier is defined.

RQ.3 consumes IntegralLattices Layer B2–B3 for its oriented binary dictionary,
with GlobalNumberFields Layer 11 supplying the order/Picard carriers. GN.3 supplies
only remaining maximal-order/DIT-convention and positive coprime norm-witness
adapters; it must not rebuild that dictionary. At negative leading coefficient,
the supplier’s oriented sign clause is essential. The precise GN.2/GN.3 input
laws remain conditional here. `formChar` is a function on
Mathlib's existing quadratic-form carrier, not a proposition field pretending to
be a form theory. Its represented-value law and a concrete norm ideal are explicit
mathematical hypotheses. The canonical form-character and imported dictionary instantiation and
its imprimitive zero tests cannot be named until those supplier interfaces exist.
-/

open Polynomial NumberField
open scoped NumberField nonZeroDivisors

namespace TauCeti.Multiquadratic.RealSigns

variable {K : Type*} [Field K] [NumberField K] {θ : 𝓞 K} {d : ℤ}

-- RQ.0. The kernel statement actually works for either quadratic signature.
theorem ker_toClassGroup_eq_pair
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (A : NarrowClassGroup K) :
    NarrowClassGroup.toClassGroup A = 1 ↔
      A = 1 ∨ A = NarrowClassGroup.mkPrincipal
        (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin)) := by
  sorry

theorem existsUnique_wideCharacter_iff
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (χ : NarrowClassGroup K →* ℤˣ) :
    (∃! ψ : ClassGroup (𝓞 K) →* ℤˣ,
      ψ.comp (NarrowClassGroup.toClassGroup (K := K)) = χ) ↔
      χ (NarrowClassGroup.mkPrincipal
        (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))) = 1 := by
  sorry

-- RQ.1. Fibres use the existing additive genus quotient.
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

-- RQ.2. The singleton theorem is an import, not repeated here.
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

theorem primeDiscriminants_positive_iff {D : ℤ} {s : Finset ℤ}
    (hD : 0 < D) (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = D) :
    (∀ P ∈ s, 0 < P) ↔
      ∀ p : ℕ, p.Prime → (p : ℤ) ∣ D → p % 4 ≠ 3 := by
  sorry

theorem fundamental_sumTwoSquares_iff {D : ℤ}
    (hD : 0 < D) (hfund : IsFundamentalDiscriminant D) :
    (∃ x y : ℤ, D = x ^ 2 + y ^ 2) ↔
      ∀ p : ℕ, p.Prime → (p : ℤ) ∣ D → p % 4 ≠ 3 := by
  sorry

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

-- RQ.3. An actual form, an actual function, and explicit supplier input laws.
-- The theorem does not take its desired comparison as a hypothesis.
-- `hclass` is the norm-witness adapter after maximal-order identification and
-- proper normalization to positive leading coefficient, not an unoriented ideal.
-- Concrete supplier names are not present at the pinned library baseline.
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

/-! Acceptance examples. These test conventions, not implementation status. -/

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

-- The omitted real qualifier in DIT16 p.971 is detected by D=-4=1*(-4).
example : (1 : ℤ).sign ≠ (-4 : ℤ).sign := by
  sorry

-- A positive imprimitive form in the GN supplier's zero domain: D=48=(-4)*(-12).
-- The zero character itself cannot be tested here before the canonical GN API exists.
example : (0 : ℤ) ^ 2 - 4 * 2 * (-6) = 48 ∧
    Int.gcd 2 (Int.gcd 0 (-6) : ℤ) = 2 ∧
    ¬ IsFundamentalDiscriminant (48 : ℤ) := by
  sorry

end TauCeti.Multiquadratic.RealSigns
