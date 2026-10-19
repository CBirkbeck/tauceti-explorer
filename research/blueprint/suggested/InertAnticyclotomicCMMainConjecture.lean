import Mathlib.LinearAlgebra.Basis.Defs
import Mathlib.RingTheory.Ideal.Span
import Mathlib.RingTheory.Polynomial.Cyclotomic.Roots
import Mathlib.RingTheory.LocalRing.Length

/-!
# Inert anticyclotomic CM main conjecture: the facets statable at the pins

Pins: Tau Ceti f790474821cf4256814db967cb154e7af3d0c369;
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

This file is not the roadmap and is not exhaustive: the roadmap document is definitive, and these
statements only suggest Lean forms so that contributors and reviewers converge on names and
signatures. The full arithmetic targets and their hypotheses are in the companion reader:
IC.0--IC.1, Gross datum, towers and signed Selmer conditions;
IC.2, primitive class and Rubin's integral coordinate;
IC.3--IC.4, elliptic units, global duality and the integral main conjecture;
IC.5--IC.6, finite control and CM rank bounds.

The pins do not supply the carriers for those arithmetic endpoints. They remain reader targets,
with explicit proof/source gaps. Nothing here assumes a characteristic-ideal equality or represents
a heavy arithmetic construction by an unimplemented definition. The file states only facets whose
carriers exist at the pins:

* IC.0/character-dictionary: conductor exponents and the BKO and Agboola--Howard sign labels of an
  anticyclotomic character of exact order `p ^ r`;
* IC.2/rubin-lfunction: the coordinate of a vector in an already based rank-one module (a future
  specialization takes `A = Λ_R` and `M` the actual free signed line);
* IC.5/control-polynomials: the signed control elements `ω_n^±` evaluated at an element `γ`;
* IC.5/specialization-length-bound: the dimension of a specialization is at most the length;
* IC.6/strict-divisor: the direction of the ideal containment.
-/

noncomputable section

open Module

namespace TauCeti.InertAnticyclotomicCM

/-! ### IC.0: conductor and sign dictionary -/

/-- The two labels of the plus/minus theory. -/
inductive Sign
  | plus
  | minus
  deriving DecidableEq

/-- Swapping the two labels. -/
def Sign.neg : Sign → Sign
  | .plus => .minus
  | .minus => .plus

/-- Conductor exponent of an anticyclotomic character of exact order `p ^ r` (BKO §2, p.948):
`0` for the trivial character and `r + 1` otherwise. -/
def conductorExponent (r : ℕ) : ℕ := if r = 0 then 0 else r + 1

/-- BKO's label: `Ξ⁺` for even conductor exponent, `Ξ⁻` for odd. -/
def bkoSign (r : ℕ) : Sign := if Even (conductorExponent r) then .plus else .minus

/-- Agboola--Howard's label (AHII §2, p.613): `Ξ⁻` holds the trivial character and the characters
of exact order `p ^ r` with `r` odd. -/
def ahSign (r : ℕ) : Sign := if r = 0 ∨ Odd r then .minus else .plus

/-- The character-set labels swap between the two papers (IC.0/character-dictionary). -/
theorem ahSign_eq_neg_bkoSign (r : ℕ) : ahSign r = (bkoSign r).neg := by
  simp only [ahSign, bkoSign, conductorExponent, Nat.even_iff, Nat.odd_iff]
  split_ifs <;> first | rfl | omega

-- Exponents of the trivial character and of characters of order `p` and `p²`.
example : conductorExponent 0 = 0 ∧ conductorExponent 1 = 2 ∧ conductorExponent 2 = 3 := by
  decide

-- `1 ∈ Ξ⁺`, order `p` in `Ξ⁺`, order `p²` in `Ξ⁻` (BKO labels).
example : bkoSign 0 = .plus ∧ bkoSign 1 = .plus ∧ bkoSign 2 = .minus := by
  decide

-- The trivial character lies in Agboola--Howard's `Ξ⁻`.
example : ahSign 0 = .minus := by
  decide

/-! ### IC.2: the coordinate in a based rank-one module -/

section Coordinate

variable {A M : Type*} [CommRing A] [AddCommGroup M] [Module A M]

/-- Coordinate in an existing rank-one based module; the IC.2 light facet. -/
def rankOneCoordinate (b : Basis Unit A M) (x : M) : A := b.repr x ()

/-- The actual vector, rather than a prescribed scalar, determines the coordinate. -/
theorem coordinate_reconstruct (b : Basis Unit A M) (x : M) :
    x = rankOneCoordinate b x • b () := by
  sorry

/-- Exact change of coordinate when the integral basis is multiplied by a unit. -/
theorem coordinate_basisChange (b b' : Basis Unit A M) (u : Aˣ)
    (hb : b' () = (u : A) • b ()) (x : M) :
    rankOneCoordinate b' x = (↑(u⁻¹) : A) * rankOneCoordinate b x := by
  sorry

/-- The integral principal ideal is independent of the signed basis. -/
theorem coordinate_ideal_basisChange (b b' : Basis Unit A M) (u : Aˣ)
    (hb : b' () = (u : A) • b ()) (x : M) :
    Ideal.span ({rankOneCoordinate b' x} : Set A) =
      Ideal.span ({rankOneCoordinate b x} : Set A) := by
  sorry

/-- Rescaling a normalized class by an integral unit preserves its coordinate ideal. -/
theorem coordinate_ideal_unit_smul (b : Basis Unit A M) (u : Aˣ) (x : M) :
    Ideal.span ({rankOneCoordinate b ((u : A) • x)} : Set A) =
      Ideal.span ({rankOneCoordinate b x} : Set A) := by
  sorry

-- Zero vector: no nonvanishing is built into the definition.
example (b : Basis Unit A M) : rankOneCoordinate b 0 = 0 := by
  simp [rankOneCoordinate]

-- A genuine basis vector has unit coordinate.
example (b : Basis Unit A M) : rankOneCoordinate b (b ()) = 1 := by
  simp [rankOneCoordinate]

-- A nonunit scalar survives in the integral coordinate, rather than being inverted.
example (b : Basis Unit A M) (a : A) :
    rankOneCoordinate b (a • b ()) = a := by
  simp [rankOneCoordinate]

end Coordinate

/-! ### IC.5: signed control elements (AHII §5, p.618) -/

namespace InertCM

open Polynomial

/-- `ω_n⁺ = ∏_{1 ≤ k ≤ n, k even} Φ_{p^k}(γ)` and `ω_n⁻ = (γ - 1) ∏_{1 ≤ k ≤ n, k odd} Φ_{p^k}(γ)`,
evaluated at an element `γ` of a commutative ring (in the roadmap, a generator of `Γ⁻` in `Λ_R`). -/
def controlPolynomial {A : Type*} [CommRing A] (p n : ℕ) (γ : A) : Sign → A
  | .plus => ∏ k ∈ (Finset.Icc 1 n).filter (fun k => Even k), (cyclotomic (p ^ k) A).eval γ
  | .minus => (γ - 1) * ∏ k ∈ (Finset.Icc 1 n).filter (fun k => Odd k), (cyclotomic (p ^ k) A).eval γ

/-- `ω_n⁺ ω_n⁻ = γ^{p^n} - 1`. -/
theorem controlPolynomial_product {A : Type*} [CommRing A] (p n : ℕ) [Fact p.Prime] (γ : A) :
    controlPolynomial p n γ .plus * controlPolynomial p n γ .minus = γ ^ (p ^ n) - 1 := by
  sorry

/-- Evaluating at a character is a ring homomorphism, so it commutes with `ω_n^s`. -/
theorem controlPolynomial_map {A B : Type*} [CommRing A] [CommRing B] (f : A →+* B) (p n : ℕ)
    (γ : A) (s : Sign) : f (controlPolynomial p n γ s) = controlPolynomial p n (f γ) s := by
  sorry

/-- At a character of exact order `p ^ r` with `r ≤ n`, `ω_n^s` vanishes exactly on BKO's
`Ξ^{-s}`, that is on Agboola--Howard's `Ξ^s`. -/
theorem controlPolynomial_eval {L : Type*} [Field L] [CharZero L] (p n r : ℕ) [Fact p.Prime]
    {ζ : L} (hζ : IsPrimitiveRoot ζ (p ^ r)) (hr : r ≤ n) (s : Sign) :
    controlPolynomial p n ζ s = 0 ↔ bkoSign r = s.neg := by
  sorry

-- Level zero: `ω_0⁺ = 1` and `ω_0⁻ = γ - 1`.
example {A : Type*} [CommRing A] (p : ℕ) (γ : A) :
    controlPolynomial p 0 γ .plus = 1 ∧ controlPolynomial p 0 γ .minus = γ - 1 := by
  simp [controlPolynomial]

-- Order `p`, `n ≥ 1`: only the minus element vanishes.
example {L : Type*} [Field L] [CharZero L] (p n : ℕ) [Fact p.Prime] {ζ : L}
    (hζ : IsPrimitiveRoot ζ p) (hn : 1 ≤ n) :
    controlPolynomial p n ζ .minus = 0 ∧ controlPolynomial p n ζ .plus ≠ 0 := by
  sorry

-- Order `p²`, `n ≥ 2`: only the plus element vanishes.
example {L : Type*} [Field L] [CharZero L] (p n : ℕ) [Fact p.Prime] {ζ : L}
    (hζ : IsPrimitiveRoot ζ (p ^ 2)) (hn : 2 ≤ n) :
    controlPolynomial p n ζ .plus = 0 ∧ controlPolynomial p n ζ .minus ≠ 0 := by
  sorry

/-! ### IC.5: the dimension of a specialization is at most the length -/

open TensorProduct in
/-- IC.5/specialization-length-bound: over a local ring, the residue-field dimension of
`κ ⊗ M` is at most the length of `M`. With `A = (Λ_R)_P` at the prime of a finite character this
bounds the dimension of a specialization by the multiplicity of that prime in the characteristic
ideal. -/
theorem finrank_residueField_tensor_le_length (A M : Type*) [CommRing A] [IsLocalRing A]
    [AddCommGroup M] [Module A M] :
    (finrank (IsLocalRing.ResidueField A) (IsLocalRing.ResidueField A ⊗[A] M) : ℕ∞) ≤
      Module.length A M := by
  sorry

/-! ### IC.6: the direction of the strict divisor containment -/

-- `char(X_{-ε}) = (f g)` and `char(X_str) = (f)` give `(f g) ⊆ (f)`, not the reverse.
example {A : Type*} [CommRing A] (f g : A) :
    Ideal.span ({f * g} : Set A) ≤ Ideal.span ({f} : Set A) :=
  Ideal.span_singleton_le_span_singleton.mpr (dvd_mul_right f g)

end InertCM

end TauCeti.InertAnticyclotomicCM
