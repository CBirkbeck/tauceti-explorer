import Mathlib

/-!
# NoncommutativeAndEquivariantIwasawa: representative target signatures

The roadmap is `README.md`. This file records light definitions and representative theorem
signatures statable against the pinned APIs; it is not exhaustive. The canonical set uses the
actual quotient by a principal left ideal, and its saturation retains a chosen central element.
The Iwasawa carry cocycle retains reduction modulo its positive modulus. The rational value
`gammaStar` distinguishes positive Gamma values from residues at nonpositive integers.

Perfect-complex K-theory, noncommutative determinant and Bockstein carriers are README targets.
Their normalization computations therefore remain there, without replacing those carriers.
-/

namespace TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa

/-! ## Layer 1: Canonical Ore localization and torsion categories -/

section Canonical

universe u v

variable (A : Type u) (B : Type v) [Ring A] [Ring B] [Module B A] [IsScalarTower B A A]

/-- The canonical set (§1.1): the elements `f` with `A ⧸ A f` finitely generated over `B`.
For `A = Λ(G)` and `B = Λ(H)` this is the canonical Ore set `S` of CFKSV. -/
def canonicalSet : Set A :=
  {f | Module.Finite B (A ⧸ Submodule.span A ({f} : Set A))}

/-- The `π`-saturation `S* = ⋃ₙ πⁿ S` of the canonical set (§1.10), for a central element
`π` (in the Iwasawa case `π = p`). -/
def saturatedSet (π : A) : Set A :=
  {f | ∃ n : ℕ, ∃ s ∈ canonicalSet A B, f = π ^ n * s}

/-- `1` lies in the canonical set: `A ⧸ A·1` is zero. -/
theorem one_mem_canonicalSet : (1 : A) ∈ canonicalSet A B := by
  show Module.Finite B (A ⧸ Submodule.span A ({1} : Set A))
  rw [show Submodule.span A ({1} : Set A) = ⊤ from Ideal.span_singleton_one]
  infer_instance

/-- The canonical set is closed under multiplication (§1.7, first step): `A s t ⊆ A t`, and
`A t ⧸ A s t` is a quotient of `A ⧸ A s`, so `A ⧸ A s t` is an extension of finitely generated
`B`-modules. No noetherian or group hypothesis is needed for this step. -/
theorem mul_mem_canonicalSet {s t : A} (hs : s ∈ canonicalSet A B) (ht : t ∈ canonicalSet A B) :
    s * t ∈ canonicalSet A B := by
  sorry

/-- The degenerate case `B = A`: every element, including `0`, lies in the canonical set; the
statement that `S` consists of nonzero divisors needs the group hypotheses of §1.7. -/
example : (0 : A) ∈ canonicalSet A A := by
  show Module.Finite A (A ⧸ Submodule.span A ({0} : Set A))
  infer_instance

/-- In `ℤ_p[[T]]` the element `p` lies in the saturation `S*`, as `p ^ 1 * 1`; by
`mem_canonicalSet_powerSeries_iff` it does not lie in `S`, so `S* ≠ S` (§1.10). -/
example (p : ℕ) [Fact p.Prime] :
    PowerSeries.C (p : ℤ_[p]) ∈
      saturatedSet (PowerSeries ℤ_[p]) ℤ_[p] (PowerSeries.C (p : ℤ_[p])) := by
  refine ⟨1, 1, ?_, by simp⟩
  show Module.Finite ℤ_[p] (PowerSeries ℤ_[p] ⧸ Submodule.span (PowerSeries ℤ_[p]) ({1} : Set _))
  have h : Submodule.span (PowerSeries ℤ_[p]) ({1} : Set (PowerSeries ℤ_[p])) = ⊤ :=
    Ideal.span_singleton_one
  rw [h]
  infer_instance

/-- The canonical set in the one-variable case `Λ(ℤ_p) ≅ ℤ_p[[T]]`, `H = 1` (§1.1, Worked
examples, example 1): `ℤ_p[[T]] ⧸ (f)` is finitely generated over `ℤ_p` exactly when `p` does not
divide `f`. In particular `T ∈ S` and `p ∉ S`, and `S` is not the set of nonzero elements. -/
theorem mem_canonicalSet_powerSeries_iff (p : ℕ) [Fact p.Prime] (f : PowerSeries ℤ_[p]) :
    f ∈ canonicalSet (PowerSeries ℤ_[p]) ℤ_[p] ↔ ¬ (PowerSeries.C (p : ℤ_[p])) ∣ f := by
  sorry

end Canonical

/-! ## Layer 6: The main theorems for totally real fields -/

section Carry

/-- The carry exponent of the twisted group ring presentation (§6.7): for representatives
`a, b` of `Γ/Γ^q` taken in `[0, q)`, the product of the representatives of `a` and `b` is the
representative of `a + b` times `γ ^ (q * carryExponent q a b)`. -/
def carryExponent (q a b : ℕ) : ℕ :=
  (a % q + b % q) / q

/-- The carry is a normalized symmetric 2-cocycle on `ℤ/q` with values in `ℕ` (§6.7). -/
theorem carryExponent_cocycle (q a b c : ℕ) (hq : 0 < q) :
    carryExponent q a b + carryExponent q (a + b) c =
      carryExponent q b c + carryExponent q a (b + c) := by
  sorry

/-- The inverse pair carries once: `τ(γ̄, γ̄⁻¹) = γ^q ≠ 1` for `q = 9` (Worked examples,
example 4); a basis inverse needs this central factor. -/
example : carryExponent 9 1 8 = 1 := by decide

/-- Normalization at the identity: the representative `0` never carries. -/
example : carryExponent 9 0 8 = 0 := by decide

end Carry

/-! ## Layer 7: Descent, leading terms and Fitting invariants -/

section GammaStar

/-- `Γ*(j)` (§7.15): `(j - 1)!` for `j > 0` and the residue `(-1)^(-j) / (-j)!` of the Gamma
function at `j ≤ 0`. -/
def gammaStar (j : ℤ) : ℚ :=
  if 0 < j then ((j - 1).toNat.factorial : ℚ)
  else (-1 : ℚ) ^ (-j).toNat / ((-j).toNat.factorial : ℚ)

/-- For positive `j`, `Γ*(j)` is the value of the Gamma function. -/
theorem gammaStar_eq_Gamma (j : ℕ) (hj : 0 < j) :
    ((gammaStar j : ℚ) : ℂ) = Complex.Gamma j := by
  sorry

/-- At a nonpositive integer, `gammaStar` is the Gamma residue, with exponent `n` at `-n`
(README §7.15; Burns–Venjakob §6.1, pp. 28–29). -/
theorem gammaStar_eq_residue (n : ℕ) :
    Filter.Tendsto (fun s : ℂ => (s + n) * Complex.Gamma s) (nhdsWithin (-(n : ℂ)) {-(n : ℂ)}ᶜ)
      (nhds ((gammaStar (-(n : ℤ)) : ℚ) : ℂ)) := by
  sorry

example : gammaStar 3 = 2 := by norm_num [gammaStar, Int.toNat, Nat.factorial]

/-- At `j = -2` the value is the residue `1/2`, not a value of `Γ`, which has a pole there. -/
example : gammaStar (-2) = 1 / 2 := by norm_num [gammaStar, Int.toNat, Nat.factorial]

end GammaStar

/-
The remaining definitions and milestones use the README carriers:
Layer 0: IsCompactPAdicAnalytic, UniformCoordinates, PValuation.saturation, IwasawaSeries,
  twist, completedHomology, rationalHomology_eq_Tor and the homological-dimension theorems.
Layer 1: totalAlgebra, canonicalLocalization, MH, SigmaS and the canonical Ore theorem.
Layer 2: noncommutativeDeterminant, LocalizedK1, RelativePerfectClass, boundaryMap,
  IsCharacteristicElement, orePerfectLocalization and boundary surjectivity.
Layer 3: representationRingHom, twistRingHom, twistK1, evaluate, akashiSeries,
  IntegralityConjecture, SK1, K1Prime, IwasawaTotalQuotient and reducedNormCharacter.
Layer 4: trivialisingField, MHConjecture, MazurTorsionConjecture, AdmissibleExtension, MuZero,
  iwasawaComplex, EquivariantCompactSupport, realTateCorrection and the Selmer-control targets.
Layer 5: twistedEllipticL, interpolationFactor, coefficientRingA, PAdicLFunctionConjecture,
  GL2MainConjecture, MainConjecture, IsZetaElement, ZetaContract and abelianDeterminantComparison.
Layer 6: iwasawaCarryCocycle, oreSetT, thetaMap, alphaMap, traceIdeal, Phi, tMap, etaGen, beta,
  Psi, delta, logRel, frobeniusPhi, integralLog, integralLogCompleted, partialZeta, sigmaLValue,
  smoothedValue, deligneRibetPseudomeasure, RWLogarithmicPseudomeasure and the totally real theorem.
Layer 7: thetaClass, cupTheta, bockstein, IsSemisimple, IsSemisimpleAt, IsFiniteAt, orderAt,
  bocksteinTrivialization, leadingTerm, laurentOrder, laurentLeadingCoefficient, fundamentalLine,
  PeriodRegulatorData, FukayaKatoZetaConjecture, globalZetaLeadingTerm, PadicStarkAtOne,
  localEpsilon, gammaL, LocalEpsilonConjecture, IsDabrowskiPanchishkin, selmerComplexU,
  selmerComplex, cyclotomicHeight, archimedeanPeriod, archimedeanRegulator, padicPeriod,
  padicRegulator, FittingOrder, FittingIntegralityRing, GeneralizedAdjoint,
  FittingDenominatorIdeal, NoncommFitting and the interpolation and annihilation theorems.
-/

end TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa
