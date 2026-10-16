import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.Analysis.SpecialFunctions.Gamma.Deligne
import Mathlib.Analysis.SpecialFunctions.Pow.Complex
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.LinearDisjoint
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.RingTheory.MvPowerSeries.Inverse
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.Tactic.NormNum.Prime

/-!
# Potential modularity and compatible systems: suggested statements

The roadmap is `README.md`; this file states the light definitions and the milestones whose carriers
exist at the pinned Mathlib and Tau Ceti. The compatible-system carriers, Skolem data, rigidified Picard
functors, moduli applications, deformation rings, Hecke algebras and modularity theorems are README
targets. Archimedean expressions distinguish meromorphic cancellation from pointwise division in the
total Gamma functions; lift parameters encode only the numerical restrictions of the four
Khare–Wintenberger lift types.
-/

set_option autoImplicit false

universe u
noncomputable section
namespace TauCetiRoadmap.PotentialModularityAndCompatibleSystems

/-! ## Layer 1: Compatible-family infrastructure -/

namespace Factors

/-- The normalized reciprocal polynomial, for a monic characteristic polynomial whose
constant coefficient is nonzero. In rank zero the polynomial is `1`. -/
def dualPolynomial {M : Type u} [Field M] (Q : Polynomial M) : Polynomial M :=
  Polynomial.C ((Q.coeff 0)⁻¹) * Q.reverse

/-- Reciprocal roots in rank one: the root `2` becomes `1/2`. -/
example : dualPolynomial (Polynomial.X - Polynomial.C (2 : ℚ)) =
    Polynomial.X - Polynomial.C (1 / 2 : ℚ) := by sorry

/-- The zero-dimensional characteristic polynomial is preserved. -/
example : dualPolynomial (1 : Polynomial ℚ) = 1 := by sorry

/-- A noninvertible operator is outside the domain of the characteristic-polynomial rule. -/
example : dualPolynomial (Polynomial.X : Polynomial ℚ) = 0 := by sorry

/-- Integer real-place multiplicities (BLGGT v4 §5.1, pp. 63–64); interpreting these as
nonnegative multiplicities requires determinant ±1 and, in odd rank, even weight.
Integer real-place multiplicities `d^±`: `n/2` for `n` even, `(n ± (−1)^{w/2} det ℛ(c_v))/2`
for `n` odd. -/
def archimedeanD (n : ℕ) (w detc : ℤ) : ℤ × ℤ :=
  if Even n then ((n : ℤ) / 2, (n : ℤ) / 2)
  else (((n : ℤ) + (if Even (w / 2) then (1 : ℤ) else -1) * detc) / 2,
    ((n : ℤ) - (if Even (w / 2) then (1 : ℤ) else -1) * detc) / 2)

/-- The pointwise archimedean quotient expression of BLGGT v4 §5.1, pp. 63–64.
It agrees with the meromorphic expression where `Gammaℂ (s - w/2)` is nonzero;
elsewhere removable singularities must be cancelled before evaluation. -/
def archimedeanGammaFactor (realPlace : Bool) (H Hbar : Multiset ℤ) (w : ℤ)
    (dplus dminus : ℕ) (s : ℂ) : ℂ := by
  classical
  let central := Complex.Gammaℂ (s - (w : ℂ) / 2)
  let shifts := fun (A : Multiset ℤ) =>
    ((A.filter (fun h => 2 * h < w)).map
      (fun (h : ℤ) => Complex.Gammaℂ (s - (h : ℂ)) / central)).prod
  exact if realPlace then
    Complex.Gammaℝ (s - (w : ℂ) / 2) ^ dplus *
      Complex.Gammaℝ (s + 1 - (w : ℂ) / 2) ^ dminus * shifts H
    else central ^ H.card * shifts H * shifts Hbar

/-- The archimedean root number `ε_v = i^{d^− + Σ |h − w/2|}` (real) or
`i^{Σ_{H_τ} |h − w/2| + Σ_{H_{τ'}} |h − w/2|}` (complex). -/
def archimedeanEpsilon (realPlace : Bool) (H Hbar : Multiset ℤ) (w : ℤ) (dminus : ℕ) : ℂ := by
  classical
  let magnitude := fun (A : Multiset ℤ) =>
    (A.map (fun (h : ℤ) => |(h : ℝ) - (w : ℝ) / 2|)).sum
  exact Complex.I ^ ((if realPlace then (dminus : ℝ) + magnitude H
    else magnitude H + magnitude Hbar) : ℂ)

/-- Rank zero, even rank, and the real odd sign distinguish the multiplicity rule. -/
example : archimedeanD 0 0 1 = (0, 0) ∧ archimedeanD 2 1 (-1) = (1, 1) ∧
    archimedeanD 1 0 (-1) = (0, 1) := by sorry

/-- The geometric cyclotomic character has weight `-2` and odd determinant. -/
example : archimedeanD 1 (-2) (-1) = (1, 0) := by sorry

/-- The trivial real character fixes the Gamma and epsilon normalizations. -/
example (s : ℂ) :
    archimedeanGammaFactor true {0} {0} 0 1 0 s = Complex.Gammaℝ s ∧
    archimedeanEpsilon true {0} {0} 0 0 = 1 := by sorry

/-- The sign character instead has real factor `Gammaℝ (s+1)` and epsilon `i`. -/
example (s : ℂ) :
    archimedeanGammaFactor true {0} {0} 0 0 1 s = Complex.Gammaℝ (s + 1) ∧
    archimedeanEpsilon true {0} {0} 0 1 = Complex.I := by sorry

/-- At a complex place the two embeddings give the single complex factor in rank one. -/
example (s : ℂ) :
    archimedeanGammaFactor false {0} {0} 0 0 0 s = Complex.Gammaℂ s ∧
    archimedeanEpsilon false {0} {0} 0 0 = 1 := by sorry

/-- The empty product in rank zero is one, even at a pole of the auxiliary Gamma factor. -/
example (s : ℂ) :
    archimedeanGammaFactor false 0 0 0 0 0 s = 1 ∧
    archimedeanEpsilon false 0 0 0 0 = 1 := by sorry

/-- The geometric cyclotomic Hodge weight is `-1`. -/
example (s : ℂ) :
    archimedeanGammaFactor true {-1} {-1} (-2) 1 0 s = Complex.Gammaℝ (s + 1) ∧
    archimedeanEpsilon true {-1} {-1} (-2) 0 = 1 := by sorry

/-- Elliptic-curve cancellation is pointwise valid away from the denominator's poles. -/
example (s : ℂ) (hs : ∀ n : ℕ, s - 1 / 2 ≠ -(n : ℂ)) :
    archimedeanGammaFactor true {0, 1} {0, 1} 1 1 1 s = Complex.Gammaℂ s ∧
    archimedeanEpsilon true {0, 1} {0, 1} 1 1 = -1 := by sorry

/-- The raw quotient is zero at `s=1/2`, while its meromorphic continuation is nonzero. -/
example : archimedeanGammaFactor true {0, 1} {0, 1} 1 1 1 (1 / 2) = 0 ∧
    Complex.Gammaℂ (1 / 2) ≠ 0 := by sorry

end Factors

namespace RepRing

/-- The genuineness criterion behind the Brauer construction of Layer 12, in coordinates: a virtual
class `Σ nᵢ [Vᵢ]` in the basis of irreducibles has norm `Σ nᵢ²`; norm one and positive dimension
force it to be the class of a single irreducible (BLGGT v1 §5.4, item (9), p. 63). -/
theorem eq_single_one_of_norm_one {ι : Type*} (n : ι →₀ ℤ) (d : ι → ℤ) (hd : ∀ i, 0 < d i)
    (hnorm : (n.sum fun _ a => a ^ 2) = 1) (hdim : 0 < n.sum fun i a => a * d i) :
    ∃ i, n = Finsupp.single i 1 := by
  sorry

/-- For the cyclic group of order two, `3·1 − ε` has degree two but norm ten, so degree alone does not
make a virtual class genuine. -/
example : ((Finsupp.single (0 : Fin 2) (3 : ℤ) + Finsupp.single 1 (-1)).sum fun _ a => a ^ 2) = 10 := by
  sorry

/-- The class `2[V₁] − [V₂]` has norm five. -/
example : ((Finsupp.single (0 : Fin 2) (2 : ℤ) + Finsupp.single 1 (-1)).sum fun _ a => a ^ 2) = 5 := by
  sorry

end RepRing

/-! ## Layer 2: Integral points and controlled fields -/

namespace Fields

/-- Disjointness through towers (Qian §2, opening facts, p. 5): if `A` and `D` are linearly disjoint
over `C`, `D` is finite over `C` and `B ≤ A`, then `A ∩ BD = B`. -/
theorem towerLinearDisjoint {C Ω : Type*} [Field C] [Field Ω] [Algebra C Ω]
    (A B D : IntermediateField C Ω) [FiniteDimensional C D] (hBA : B ≤ A)
    (h : A.LinearDisjoint D) : A ⊓ (B ⊔ D) = B := by
  sorry

/-- The Galois-theoretic core of avoidance by extra split places (§2.13): if elements fixing every
point of `E` generate `Gal(D/K)`, then `E = K`. -/
theorem eq_bot_of_fixed_by_generators {K D : Type*} [Field K] [Field D] [Algebra K D]
    [FiniteDimensional K D] [IsGalois K D] (E : IntermediateField K D) (S : Set (D ≃ₐ[K] D))
    (hS : Subgroup.closure S = ⊤) (hfix : ∀ σ ∈ S, ∀ x ∈ E, σ x = x) : E = ⊥ := by
  sorry

/-- Linear disjointness from the base field is automatic. -/
example {C Ω : Type*} [Field C] [Field Ω] [Algebra C Ω] (A : IntermediateField C Ω) :
    A.LinearDisjoint (⊥ : IntermediateField C Ω) :=
  IntermediateField.LinearDisjoint.bot_right A

end Fields


/-! ## Layer 3: Auxiliary characters and moduli -/

namespace Auxiliary

/-- For `l = 5`, the discriminant `1 − 4l = −19` of Taylor's Weil number is prime to `5`, so `5` is
unramified in `ℚ(√(1 − 4l))` (Taylor, Fontaine–Mazur, p. 7). -/
example : ¬ (5 : ℤ) ∣ 1 - 4 * 5 := by decide

/-- The auxiliary prime is taken larger than `3`: the index-two subgroup of the inertia of `ℚ_p` sees
the mod-`p` cyclotomic character with order `(p − 1)/2`, which is `1` exactly for `p = 3`. -/
theorem half_order_gt_one {p : ℕ} (hp : 3 < p) (hodd : Odd p) : 1 < (p - 1) / 2 := by
  sorry

example : (3 - 1) / 2 = 1 := by decide

end Auxiliary

/-! ## Layer 4: Residual potential modularity -/
/-! ## Layer 5: Potential modularity of a given lift -/
/-! ## Layer 6: Control of extensions -/
/-! ## Layer 7: Exports and their direction of use -/
/-! ## Layer 8: Finiteness of global rings -/
/-! ## Layer 9: Characteristic-zero points -/
/-! ## Layer 10: Prescribed lifts -/

namespace Presentations

/-- `R` has a presentation `𝒪⟦x₁, …, x_r⟧/(f₁, …, f_s)` as an `𝒪`-algebra. -/
def HasPresentation (O R : Type) [CommRing O] [CommRing R] [Algebra O R] (r s : ℕ) : Prop :=
  ∃ f : Fin s → MvPowerSeries (Fin r) O,
    Nonempty (R ≃ₐ[O] (MvPowerSeries (Fin r) O ⧸ Ideal.span (Set.range f)))

/-- `R` is flat over `𝒪` and a complete intersection of relative dimension `d`: a presentation
`𝒪⟦x₁, …, x_{s+d}⟧/(f₁, …, f_s)` by a regular sequence. -/
def IsFlatCompleteIntersection (O R : Type) [CommRing O] [CommRing R] [Algebra O R] (d : ℕ) :
    Prop :=
  Module.Flat O R ∧ ∃ (s : ℕ) (f : Fin s → MvPowerSeries (Fin (s + d)) O),
    RingTheory.Sequence.IsRegular (MvPowerSeries (Fin (s + d)) O) (List.ofFn f) ∧
    Nonempty (R ≃ₐ[O] (MvPowerSeries (Fin (s + d)) O ⧸ Ideal.span (Set.range f)))

/-- A nonzero finite algebra over a complete DVR with at most as many proper equations
as formal variables has equal counts and a regular sequence starting with a uniformizer
(Böckle’s appendix, Lemma 2, p. 5). The uniformizer is arbitrary, including for ramified DVRs. -/
theorem finite_presentation_complete_intersection
    {O R : Type} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [CommRing R] [Nontrivial R] [Algebra O R] [Module.Finite O R]
    {n m : ℕ} (hmn : m ≤ n) (π : O)
    (hπ : Ideal.span ({π} : Set O) = IsLocalRing.maximalIdeal O)
    (f : Fin m → MvPowerSeries (Fin n) O)
    (hf : ∀ i, f i ∈ IsLocalRing.maximalIdeal (MvPowerSeries (Fin n) O))
    (e : R ≃ₐ[O] (MvPowerSeries (Fin n) O ⧸ Ideal.span (Set.range f))) :
    m = n ∧ Module.Flat O R ∧ RingTheory.Sequence.IsRegular (MvPowerSeries (Fin n) O)
      (algebraMap O (MvPowerSeries (Fin n) O) π :: List.ofFn f) := by
  sorry

/-- The zero-variable presentation recovers the coefficient ring. -/
example (O : Type) [CommRing O] : HasPresentation O O 0 0 := by sorry

/-- Quotienting one variable by that variable gives the coefficient ring. -/
example (O : Type) [CommRing O] : HasPresentation O O 1 1 := by sorry

/-- A unit equation is permitted as a presentation but gives the zero algebra. -/
example : HasPresentation ℚ
    (MvPowerSeries (Fin 1) ℚ ⧸ Ideal.span ({1} : Set (MvPowerSeries (Fin 1) ℚ))) 1 1 := by sorry

/-- A nonzero coefficient ring is flat over itself with the empty regular sequence. -/
example (O : Type) [CommRing O] [Nontrivial O] : IsFlatCompleteIntersection O O 0 := by sorry

/-- Over a nonzero noetherian coefficient ring, formal power series are flat and
the one-variable ring has relative dimension one. -/
example (O : Type) [CommRing O] [Nontrivial O] [IsNoetherianRing O] :
    IsFlatCompleteIntersection O (MvPowerSeries (Fin 1) O) 1 := by sorry

/-- The zero algebra fails the nonzero-quotient condition for a regular sequence. -/
example : ¬ IsFlatCompleteIntersection ℚ
    (MvPowerSeries (Fin 1) ℚ ⧸ Ideal.span ({1} : Set (MvPowerSeries (Fin 1) ℚ))) 0 := by sorry

/-- Torsion over the coefficient ring is incompatible with flatness. -/
example : ¬ IsFlatCompleteIntersection ℤ (ZMod 2) 0 := by sorry

end Presentations

namespace LiftParameters

/-- Numerical part of the four KW lift prescriptions (KW I Theorem 5.1, pp. 9–10).
The arithmetic `RequiredLiftType` additionally records its representation, determinant,
residual local shape and deformation conditions; this parameter type does not replace it. -/
inductive RequiredLiftParameters (p k : ℕ) where
  | minimalCrystalline (dyadic : p = 2 → k = 2)
  | weightTwo
  | levelOne (q i : ℕ) (prime : q.Prime) (odd : q ≠ 2) (divides : p ∣ q - 1)
      (range : 0 < i ∧ i ≤ q - 2) (dyadic : p = 2 → Even i)
  | levelTwo (q i j : ℕ) (prime : q.Prime) (ne : q ≠ p) (divides : p ∣ q + 1)
      (range : j < i ∧ i ≤ q - 1)
      (order : ∃ r : ℕ, (q ^ 2 - 1) / Nat.gcd (q ^ 2 - 1) (i + q * j) = p ^ r)
      (dyadic : p = 2 → Even (i + j))

namespace RequiredLiftParameters
variable {p k : ℕ}

/-- The auxiliary prime is present only for the last two prescriptions. -/
def auxiliaryPrime : RequiredLiftParameters p k → Option ℕ
  | levelOne q .. => some q
  | levelTwo q .. => some q
  | _ => none

/-- In the weight-two prescription, `k=p+1` requires nonzero monodromy. -/
def requiresSteinberg : RequiredLiftParameters p k → Prop
  | minimalCrystalline _ => False
  | _ => k = p + 1

/-- The dyadic level-one character at `q=5` must have even exponent. -/
example (k : ℕ) : ¬ (2 = 2 → Even 1) ∧
    (RequiredLiftParameters.levelOne (p := 2) (k := k) 5 2 (by norm_num) (by norm_num)
      (by norm_num) (by norm_num) (fun _ => even_two)).auxiliaryPrime = some 5 := by sorry

/-- At `q=7`, the exponent `6` gives order `8` and genuine level two. -/
example (k : ℕ) :
    (RequiredLiftParameters.levelTwo (p := 2) (k := k) 7 6 0 (by norm_num) (by norm_num)
      (by norm_num) (by norm_num) ⟨3, by norm_num⟩ (fun _ => by decide)).auxiliaryPrime = some 7 := by
  sorry

/-- At `q=5` no exponents satisfy all the dyadic level-two restrictions simultaneously. -/
example : ¬ ∃ (i j r : ℕ), j < i ∧ i ≤ 4 ∧ Even (i + j) ∧
    24 / Nat.gcd 24 (i + 5 * j) = 2 ^ r := by sorry

/-- The level-one prescription at `p=3,q=5` fails its divisibility condition. -/
example : ¬ 3 ∣ 5 - 1 := by sorry

/-- The weight-two prescription has no auxiliary prime. -/
example (p k : ℕ) :
    (RequiredLiftParameters.weightTwo (p := p) (k := k)).auxiliaryPrime = none := by sorry

/-- The exceptional weight requires Steinberg monodromy; weight two at `p=3` does not. -/
example : (RequiredLiftParameters.weightTwo (p := 3) (k := 4)).requiresSteinberg ∧
    ¬ (RequiredLiftParameters.weightTwo (p := 3) (k := 2)).requiresSteinberg := by sorry

end RequiredLiftParameters
end LiftParameters

/-! ## Layer 11: Rational-field modularity lifting -/
/-! ## Layer 12: Families through potentially modular lifts -/
/-! ## Layer 13: Residual members and linked systems -/

namespace ResidualMembers

/-- The weight argument of §13.1: outside the small primes, the normalized weight `a − b + 1` of a
regular member is neither of the two weights `(l + 1)/2`, `(l + 3)/2` forced by a reducible
restriction to `ℚ(ζ_l)` (KW I, proof of Theorem 10.1, p. 20). -/
theorem weight_ne_half_weights {l a b : ℕ} (hodd : Odd l) (hab : b < a) (hl : 2 * (a - b) + 1 < l) :
    a - b + 1 ≠ (l + 1) / 2 ∧ a - b + 1 ≠ (l + 3) / 2 := by
  sorry

/-- For `a − b = 1` and `l = 3` the inequality fails and the weights collide: `2 = (3 + 1)/2`; for even
`l = 2(a − b) + 2` they would collide as well, which is why `l` is odd. -/
example : (1 : ℕ) + 1 = (3 + 1) / 2 := by decide

end ResidualMembers


/-! The other definitions and theorems are README targets: their carriers (compatible-system data,
Skolem data, relative Picard functors, twisted Hilbert moduli, deformation rings, quaternionic and
definite-unitary Hecke algebras, automorphic representations) are not available at the pinned
libraries. -/

end TauCetiRoadmap.PotentialModularityAndCompatibleSystems
