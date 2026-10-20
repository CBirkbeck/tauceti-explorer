import Mathlib
import TauCeti.FieldTheory.FunctionField.RiemannRoch.ClassNumber

/-!
# FunctionFieldArithmetic: representative target signatures

The roadmap is `README.md`; this file is not the roadmap and is not exhaustive. It records the
definitions and theorem signatures of the roadmap that can be stated against the pinned Mathlib and
Tau Ceti APIs, so that contributors and reviewers converge on names and signatures.

Design choices made explicit here:

* the setting is Tau Ceti's intrinsic `TauCeti.IsFunctionField k F`, passed as an explicit
  hypothesis, with exactness of the constants as the separate hypothesis
  `IsIntegrallyClosedIn k F`;
* the zeta function is defined from effective divisors of the function field (`TauCeti.Divisor`),
  not from points of a scheme; its comparison with the scheme zeta function is a README target;
* `pointCount r` is defined from place degrees, `Σ_{d ∣ r} d · #{places of degree d}`;
* the Artin–Schreier–Witt operator is `Frob − id` on Mathlib's Witt vectors, never a coordinatewise
  map, and the length-`n` group is the quotient of `W(F)` by `℘ W(F)` and the kernel of truncation.
-/

namespace TauCetiRoadmap.FunctionFieldArithmetic

open TauCeti

/-! ## Layer 0: finite constant fields, degrees and normalisations -/

section Constants

variable {k F : Type*} [Field k] [Field F] [Algebra k F]

/-- **Divisors of degree one** (README 0.2): the divisor form of F. K. Schmidt's theorem. No
place of degree one, and no rational point of the model, is asserted. -/
theorem exists_divisor_degree_eq_one [Finite k] (hF : IsFunctionField k F)
    (hk : IsIntegrallyClosedIn k F) : ∃ D : Divisor k F, Divisor.degree D = 1 := by
  sorry

/-- The divisor degree of a function field with finite exact constants is onto `ℤ`
(README 0.2). -/
theorem divisor_degree_surjective [Finite k] (hF : IsFunctionField k F)
    (hk : IsIntegrallyClosedIn k F) :
    Function.Surjective (Divisor.degree : Divisor k F →+ ℤ) := by
  sorry

end Constants

/-! ## Layer 3: Artin–Schreier–Witt theory -/

section ArtinSchreierWitt

variable (p : ℕ) [Fact p.Prime] (F : Type*) [Field F] [CharP F p]

/-- **The Artin–Schreier–Witt operator** `℘ = Frob − id` on the Witt vectors of a field of
characteristic `p` (README 3.1). It is additive for the Witt group law. -/
noncomputable def artinSchreierWitt : WittVector p F →+ WittVector p F :=
  (WittVector.frobenius : WittVector p F →+* WittVector p F).toAddMonoidHom -
    AddMonoidHom.id (WittVector p F)

/-- **The Artin–Schreier–Witt group of length `n`** (README 3.1):
`W_n(F) / ℘ W_n(F) = W(F) / (℘ W(F) + ker (truncate n))`. -/
abbrev aswQuotient (n : ℕ) : Type _ :=
  WittVector p F ⧸ ((artinSchreierWitt p F).range ⊔
    (RingHom.ker (WittVector.truncate (p := p) (R := F) n)).toAddSubgroup)

/-- `℘` kills the unit Witt vector: the trivial class gives the trivial extension. -/
example : artinSchreierWitt p F 1 = 0 := by
  simp [artinSchreierWitt]

/-- On a Teichmüller representative `℘` is `[a] ↦ [a^p] − [a]`: Frobenius is computed by raising
the Witt coordinates to the `p`-th power, not by Witt multiplication. -/
example (a : F) :
    artinSchreierWitt p F (WittVector.teichmuller p a) =
      WittVector.teichmuller p (a ^ p) - WittVector.teichmuller p a := by
  simp only [artinSchreierWitt, AddMonoidHom.sub_apply, RingHom.toAddMonoidHom_eq_coe,
    AddMonoidHom.coe_coe, AddMonoidHom.id_apply, WittVector.frobenius_eq_map_frobenius,
    WittVector.map_teichmuller, frobenius_def]

/-- At length zero the Artin–Schreier–Witt group is trivial. -/
example : Subsingleton (aswQuotient p F 0) := by
  have h : (RingHom.ker (WittVector.truncate (p := p) (R := F) 0)).toAddSubgroup = ⊤ := by
    ext x
    simp only [Submodule.mem_toAddSubgroup, RingHom.mem_ker, AddSubgroup.mem_top, iff_true]
    exact TruncatedWittVector.ext fun i => i.elim0
  rw [aswQuotient, h, sup_top_eq]
  exact QuotientAddGroup.subsingleton_quotient_top

end ArtinSchreierWitt

/-! ## Layer 5: zeta functions and `L`-polynomials -/

section Zeta

variable (k F : Type*) [Field k] [Field F] [Algebra k F]

/-- The number of effective divisors of degree `n` (finite over a finite constant field by
`TauCeti.Divisor.finite_setOf_isEffective_degree_le`). -/
noncomputable def effectiveDivisorCount (n : ℕ) : ℕ :=
  Nat.card {D : Divisor k F // AlgebraicGeometry.WeilDivisor.IsEffective D ∧ Divisor.degree D = n}

/-- **The zeta function of a function field** (README 5.1): `Σ_n A_n T^n`, with `A_n` the number of
effective divisors of degree `n`. -/
noncomputable def zeta : PowerSeries ℤ :=
  PowerSeries.mk fun n => (effectiveDivisorCount k F n : ℤ)

/-- The number of places of degree `d`. -/
noncomputable def placeCount (d : ℕ) : ℕ :=
  Nat.card {P : Place k F // P.degree = d}

/-- The extension-field point count `N_r = Σ_{d ∣ r} d · #{places of degree d}` (README 5.1). -/
noncomputable def pointCount (r : ℕ) : ℕ :=
  ∑ d ∈ r.divisors, d * placeCount k F d

variable {k F}

/-- The zero divisor is the only effective divisor of degree zero (README 5.1,
`zeta_coeff_zero`). -/
theorem effectiveDivisorCount_zero (hF : IsFunctionField k F) :
    effectiveDivisorCount k F 0 = 1 := by
  rw [effectiveDivisorCount, Nat.card_eq_one_iff_exists]
  refine ⟨⟨0, AlgebraicGeometry.WeilDivisor.isEffective_zero, by simp⟩, ?_⟩
  rintro ⟨D, hD, hdeg⟩
  have hle : (0 : Divisor k F) ≤ D := AlgebraicGeometry.WeilDivisor.isEffective_iff_zero_le.mp hD
  refine Subtype.ext (AlgebraicGeometry.WeilDivisor.ext fun P => ?_)
  have h1 := Divisor.coeff_le_degree hF hle P
  have h2 := (AlgebraicGeometry.WeilDivisor.isEffective_iff D).mp hD P
  simp only [hdeg, Nat.cast_zero] at h1
  simp only [AlgebraicGeometry.WeilDivisor.coeff_zero]
  omega

/-- The zeta series has constant term one. -/
example (hF : IsFunctionField k F) : PowerSeries.constantCoeff (zeta k F) = 1 := by
  simp [zeta, effectiveDivisorCount_zero hF]

/-- No place has degree zero. -/
example (hF : IsFunctionField k F) : placeCount k F 0 = 0 := by
  rw [placeCount, Nat.card_eq_zero]
  left
  exact ⟨fun ⟨P, hP⟩ => by have := P.one_le_degree_of_isFunctionField hF; omega⟩

/-- `N₁` counts the places of degree one. -/
example : pointCount k F 1 = placeCount k F 1 := by
  simp [pointCount]

/-- **Logarithmic derivative of the zeta function** (README 5.1):
`r A_r = Σ_{i=1}^{r} N_i A_{r−i}`, equivalently `T Z′/Z = Σ_r N_r T^r`. -/
theorem zeta_logDeriv [Finite k] (hF : IsFunctionField k F) (hk : IsIntegrallyClosedIn k F)
    (r : ℕ) (hr : 0 < r) :
    (r : ℤ) * PowerSeries.coeff r (zeta k F) =
      ∑ i ∈ Finset.range r,
        (pointCount k F (i + 1) : ℤ) * PowerSeries.coeff (r - 1 - i) (zeta k F) := by
  sorry

/-- **Point counts of the rational function field** (README 5.1, Check): `N_r = q^r + 1`. -/
theorem pointCount_ratFunc [Finite k] (r : ℕ) (hr : 0 < r) :
    pointCount k (RatFunc k) r = Nat.card k ^ r + 1 := by
  sorry

/-- **Effective divisors in large degree** (README 5.2): for `n > 2g − 2`,
`(q − 1) A_n = h (q^(n + 1 − g) − 1)`. -/
theorem effectiveDivisorCount_of_large [Finite k] (hF : IsFunctionField k F)
    (hk : IsIntegrallyClosedIn k F) (n : ℕ) (hn : 2 * genus k F ≤ n + 1) :
    ((Nat.card k : ℤ) - 1) * effectiveDivisorCount k F n =
      Divisor.classNumber hF * ((Nat.card k : ℤ) ^ (n + 1 - genus k F) - 1) := by
  sorry

/-- **Rationality, functional equation and the class number** (README 5.3). The `L`-polynomial
`(1 − T)(1 − qT) Z(T)` has degree `2g`, constant term `1`, leading coefficient `q^g`, the
reciprocal symmetry `a_{2g−j} = q^(g−j) a_j`, linear coefficient `N_1 − (q + 1)` and value `h`
at `1`. -/
theorem zeta_rationality [Finite k] (hF : IsFunctionField k F) (hk : IsIntegrallyClosedIn k F) :
    ∃ P : Polynomial ℤ,
      zeta k F * ((1 - PowerSeries.X) * (1 - PowerSeries.C (Nat.card k : ℤ) * PowerSeries.X)) =
        (P : PowerSeries ℤ) ∧
      P.coeff 0 = 1 ∧ P.natDegree = 2 * genus k F ∧
      P.leadingCoeff = (Nat.card k : ℤ) ^ genus k F ∧
      (∀ j ≤ genus k F,
        P.coeff (2 * genus k F - j) = (Nat.card k : ℤ) ^ (genus k F - j) * P.coeff j) ∧
      P.coeff 1 = (pointCount k F 1 : ℤ) - (Nat.card k + 1) ∧
      P.eval 1 = Divisor.classNumber hF := by
  sorry

end Zeta

/-! ## Layer 5.6: recovering the `L`-polynomial from `g` point counts -/

section LPolynomial

open Polynomial

/-- **`L`-polynomial data** (README 5.6) for `q`, `g` and counts `N`: constant term `1`, degree at
most `2g`, the reciprocal symmetry, and the first `g` Newton identities
`r a_r = Σ_{i=1}^{r} (N_i − q^i − 1) a_{r−i}`. -/
def IsLPolynomialData (q g : ℕ) (N : ℕ → ℤ) (P : Polynomial ℤ) : Prop :=
  P.coeff 0 = 1 ∧ P.natDegree ≤ 2 * g ∧
  (∀ j ≤ g, P.coeff (2 * g - j) = (q : ℤ) ^ (g - j) * P.coeff j) ∧
  ∀ r, 0 < r → r ≤ g →
    (r : ℤ) * P.coeff r =
      ∑ i ∈ Finset.range r, (N (i + 1) - (q : ℤ) ^ (i + 1) - 1) * P.coeff (r - 1 - i)

/-- The first `g` counts and the functional equation determine the polynomial (README 5.6). -/
theorem IsLPolynomialData.unique {q g : ℕ} {N : ℕ → ℤ} {P P' : Polynomial ℤ}
    (h : IsLPolynomialData q g N P) (h' : IsLPolynomialData q g N P') : P = P' := by
  sorry

/-- The `L`-polynomial of a function field satisfies the data with `N = pointCount`
(README 5.6). -/
theorem lPolynomial_isLPolynomialData {k F : Type*} [Field k] [Finite k] [Field F] [Algebra k F]
    (hF : IsFunctionField k F) (hk : IsIntegrallyClosedIn k F) (P : Polynomial ℤ)
    (hP : zeta k F * ((1 - PowerSeries.X) *
      (1 - PowerSeries.C (Nat.card k : ℤ) * PowerSeries.X)) = (P : PowerSeries ℤ)) :
    IsLPolynomialData (Nat.card k) (genus k F) (fun r => pointCount k F r) P := by
  sorry

/-- For `y² = x³ + x + 1` over `𝔽₅`, `N₁ = 9` gives `1 + 3T + 5T²` (README worked example 2). -/
example : IsLPolynomialData 5 1 (fun _ => 9) (1 + C 3 * X + C 5 * X ^ 2) := by
  refine ⟨by simp [coeff_X, coeff_X_pow], ?_, ?_, ?_⟩
  · compute_degree!
  · intro j hj
    interval_cases j <;> simp [coeff_X, coeff_X_pow, coeff_one]
  · intro r hr hr'
    obtain rfl : r = 1 := by omega
    simp [coeff_X, coeff_X_pow, coeff_one]

/-- A wrong count `N₁ = 8` is rejected for the same polynomial. -/
example : ¬ IsLPolynomialData 5 1 (fun _ => 8) (1 + C 3 * X + C 5 * X ^ 2) := by
  rintro ⟨-, -, -, h⟩
  have := h 1 one_pos le_rfl
  simp [coeff_X, coeff_X_pow, coeff_one] at this

end LPolynomial

/-!
## Statements not typed at the pins

The following README targets need carriers that the pinned libraries do not provide; they are
stated in the README only.

* Layer 0: `degree_conventions` (needs the idele group of ArithmeticGaloisDuality and the adeles of
  AutomorphicLFunctionsAndLocalFactors), `divisorClass_picardPoints` (Picard schemes).
* Layer 1: `chartIdeals`, `riemannRochSpace_eq_inf_chartIdeals`, `exists_reducedBasis`,
  `riemannRoch_reducedBasis`, `computeRiemannRochBasis`, `computeRiemannRochBasis_cost` and their API (two-chart integral closures and their fractional
  ideals).
* Layer 2: `divisorLattice` and its API, `selfDual_local_volume`, `selfDual_global_volumes`,
  `fourier_indicator_divisorLattice`, `testFunctions_span_translates` (completed adeles and residue
  characters).
* Layer 3: `artinSchreierWitt_galois`, `aswField_eq_iff`, `aswField_degree`,
  `aswReduced_exists_unique` and its API, `artinSchreier_onePole_comparison`.
* Layer 4: `LubinTate.formalGroup`, `LubinTate.smul`, `lubinTate_torsion`, `localKroneckerWeber`,
  `localAbelianExistence_all`, `injective_artinMap_all`, `lubinTate_artin`,
  `conductor_existence_all`, `rayIdeleClassGroup`, `RayCharacterData`, `rayCharacterData_conductor` and their API,
  `schmidWitt_localCoordinates`, `localCoordinates_truncation`, `schmidWitt_changeParameter`,
  `rigidifiedPicardFunctor`, `generalizedPicard`, `generalizedJacobian`, `generalizedPicard_representable`,
  `generalizedJacobian_linearPart`, `rayAbel`, `rayAbel_affineBundle`, `HasRayModulus`, `rayAbel_rosenlicht`,
  `rayPicard_comparison`, `rayPicard_localUnits`, `rayLangCover`, `rayLangCover_frobenius`,
  `ideleClasses_away_dense`, `rayLangCover_artin`, `rayLangCover_geometricallyConnected`,
  `finiteRayLangCover`, `finiteRayLangCover_classifies`, `finiteRayLangCover_normGroup`, `finiteRayLangCover_connected`,
  `finiteRayLangCover_geometricallyConnected`, `rayLangCover_conductor`, `rayLangCover_modulusFactor`,
  `schmidWitt`, `schmidWitt_perfect`, `schmidWitt_characterization`,
  `schmidWitt_formula`, `schmidWitt_normGroup`, `aswConductor_eq`, `aswUpperRamification`.
* Layer 5: `zeta_eulerProduct`, `pointCount_eq`, `effectiveDivisorCount_eq`, `zeta_eq_schemeZeta`,
  `lPolynomial_constantExtension`, `zeta_constantExtension`, `localEulerFactorFinite` and its API,
  `lFunction_cohomological`, `lFunction_cohomological_projective`, `enumeratePlaces_le`, `enumeratePlaces_cost`,
  `computeRayQuotient`, `computeRayQuotient_cost`, `computeRayCharacterData_sound`,
  `computeRayCharacterData_complete`, `frobeniusPlaceCount`,
  `frobeniusPlaceCount_constant_congruence`, `degree_sensitive_chebotarev` and their API.
* Layer 6: `adelicPoints` and its API, `automorphicFunctions`, `constantTerm`, `cuspFunctions`,
  `cuspFunctions_compactSupport`, `cuspFunctions_integralModel`, `heckeEigenvalue_algebraic`,
  `heckeAction_unramified_cusp`, `normalizedConstantTerm` and its API,
  `normalizedConstantTerm_hecke`, `satake_gl1_reciprocity`, `cuspForm_exists_degreeZero_ne_zero`.
* Layer 7: `exists_unramified_inducingCharacter`, `I_n`, `sphericalSection`, `siegelEisenstein`,
  `section_degree`, `leviDetCharacter_discrete`, `siegelEisenstein_converges`,
  `siegelEisenstein_rational`, `fourierExpansion`, `fourierCoefficient_rationalLevi`, `whittaker_levi`,
  `fourierCoefficient_factor`, `hermitianDensity`, `densityPolynomial`, `densityType`,
  `densityHalfLength`, `hermitianDensity_split`, `whittaker_eq_density`,
  `fyz_globalCoefficient`.
-/

end TauCetiRoadmap.FunctionFieldArithmetic
