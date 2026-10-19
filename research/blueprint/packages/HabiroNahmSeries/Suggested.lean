import Mathlib

/-!
# HabiroNahmSeries: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. This file records light definitions and important theorem
signatures statable against the pinned APIs. Analytic data use
positive definite rational matrices; formal data use symmetric integral matrices. The
unsigned real equations and the signed equations have separate predicates. Denominators,
Gaussian normalisations, and the constant quadratic term remain explicit.
-/

namespace TauCetiRoadmap.HabiroNahmSeries

open scoped BigOperators

noncomputable section

/-! ## Layer 1: Nahm equations and their arithmetic -/

/-- The exponent of an analytic Nahm summand, including its constant term. -/
def quadraticExponent {N : ℕ} (A : Matrix (Fin N) (Fin N) ℚ)
    (B : Fin N → ℚ) (C : ℚ) (n : Fin N → ℤ) : ℚ :=
  (∑ i, ∑ j, A i j * (n i : ℚ) * (n j : ℚ)) / 2 +
    (∑ i, B i * (n i : ℚ)) + C

/-- The first Rogers–Ramanujan exponent retains the normalising constant. -/
example (n : ℤ) :
    quadraticExponent (fun _ _ : Fin 1 => 2) (fun _ => 0) (-1 / 60)
      (fun _ => n) = (n : ℚ) ^ 2 - 1 / 60 := by
  simp [quadraticExponent]
  ring

/-- The second Rogers–Ramanujan exponent includes its linear term. -/
example (n : ℤ) :
    quadraticExponent (fun _ _ : Fin 1 => 2) (fun _ => 1) (11 / 60)
      (fun _ => n) = (n : ℚ) ^ 2 + n + 11 / 60 := by
  simp [quadraticExponent]
  ring

/-- Analytic input: positivity is imposed after the rational matrix is cast to the reals. -/
structure NahmDatum (N : ℕ) where
  A : Matrix (Fin N) (Fin N) ℚ
  B : Fin N → ℚ
  C : ℚ
  symmetric : A.IsSymm
  positive : (A.map (fun a => (a : ℝ))).PosDef

/-- A nonintegral positive matrix is analytic input. -/
example : ∃ D : NahmDatum 1, D.A 0 0 = 3 / 2 := by
  refine ⟨⟨Matrix.diagonal (fun _ => 3 / 2), fun _ => 0, 0, ?_, ?_⟩, ?_⟩
  · exact Matrix.isSymm_diagonal _
  · have h : (Matrix.diagonal (fun _ : Fin 1 => (3 / 2 : ℝ))).PosDef :=
      Matrix.PosDef.diagonal (fun _ => by norm_num)
    convert h using 1
    ext i j
    have hij : i = j := Subsingleton.elim _ _
    norm_num [Matrix.diagonal, Matrix.map, hij]
  · norm_num

/-- Formal input has no positivity hypothesis. -/
structure FormalNahmDatum (N : ℕ) where
  A : Matrix (Fin N) (Fin N) ℤ
  symmetric : A.IsSymm

/-- An integral symmetric singular matrix is valid formal input. -/
example : ∃ D : FormalNahmDatum 2, D.A = (fun _ _ => 1) := by
  exact ⟨⟨fun _ _ => 1, rfl⟩, rfl⟩

/-- A nonsymmetric integral matrix is not formal input: its formal exponent would be odd. -/
example : ¬ ∃ D : FormalNahmDatum 2, D.A = !![0, 1; 0, 0] := by
  rintro ⟨D, hD⟩
  have h := D.symmetric.apply 0 1
  rw [hD] at h
  simp at h

/-- A positive integer clearing all values of the rational quadratic function. -/
def IsDenominator {N : ℕ} (A : Matrix (Fin N) (Fin N) ℚ)
    (B : Fin N → ℚ) (C : ℚ) (d : ℕ) : Prop :=
  0 < d ∧ ∀ n : Fin N → ℤ,
    ∃ k : ℤ, (d : ℚ) * quadraticExponent A B C n = k

/-- A positive period of the quadratic function modulo the integers. -/
def IsStrongDenominator {N : ℕ} (A : Matrix (Fin N) (Fin N) ℚ)
    (B : Fin N → ℚ) (C : ℚ) (D : ℕ) : Prop :=
  0 < D ∧ ∀ n k : Fin N → ℤ,
    (∀ i, Int.ModEq (D : ℤ) (n i) (k i)) →
      ∃ l : ℤ, quadraticExponent A B C n - quadraticExponent A B C k = l

/-- In rank zero the denominator must still clear the constant C. -/
example (A : Matrix (Fin 0) (Fin 0) ℚ) (B : Fin 0 → ℚ) :
    IsDenominator A B (3 / 2) 2 := by
  refine ⟨by decide, fun n => ⟨3, ?_⟩⟩
  norm_num [quadraticExponent]

/-- Strong periods ignore C, even when C is not integral. -/
example (A : Matrix (Fin 0) (Fin 0) ℚ) (B : Fin 0 → ℚ) :
    IsStrongDenominator A B (1 / 2) 1 := by
  refine ⟨by decide, fun n k _ => ⟨0, ?_⟩⟩
  simp [quadraticExponent]

/-- Twice a denominator is a period; a period need not clear all values. -/
theorem isStrongDenominator_two_mul {N : ℕ} (A : Matrix (Fin N) (Fin N) ℚ)
    (hA : A.IsSymm) (B : Fin N → ℚ) (C : ℚ) (d : ℕ)
    (hd : IsDenominator A B C d) : IsStrongDenominator A B C (2 * d) := by
  sorry

/-- The unsigned equations use positive real powers and require the open cube. -/
def NahmEq {N : ℕ} (A : Matrix (Fin N) (Fin N) ℝ) (x : Fin N → ℝ) : Prop :=
  (∀ i, 0 < x i ∧ x i < 1) ∧
    ∀ i, 1 - x i = ∏ j, Real.rpow (x j) (A i j)

/-- The empty system has exactly its unique empty tuple as a solution. -/
example (A : Matrix (Fin 0) (Fin 0) ℝ) (x : Fin 0 → ℝ) : NahmEq A x := by
  constructor <;> intro i <;> exact Fin.elim0 i

/-- Boundary coordinates are rejected even if a totalised power happens to exist. -/
example (A : Matrix (Fin 1) (Fin 1) ℝ) : ¬ NahmEq A (fun _ => 1) := by
  intro h
  exact (lt_irrefl (1 : ℝ)) (h.1 0).2

/-- The distinguished solution exists uniquely for every real positive definite matrix.
Vlasenko–Zwegers, Lemma 2.1; the rational case supplies analytic Nahm data. -/
theorem existsUnique_nahmEq {N : ℕ} (A : Matrix (Fin N) (Fin N) ℝ)
    (hA : A.PosDef) : ∃! x : Fin N → ℝ, NahmEq A x := by
  sorry

/-- Laurent equations on units over a commutative ring, with an explicit unit sign vector. -/
def SignedNahmEq {N : ℕ} {R : Type*} [CommRing R]
    (A : Matrix (Fin N) (Fin N) ℤ) (ε z : Fin N → Rˣ) : Prop :=
  ∀ i, (1 : R) - (z i : R) = (ε i : R) * ↑(∏ j, z j ^ A i j)

/-- In characteristic five, the unsigned rank-one quadratic equation has the unit root 2. -/
example : SignedNahmEq (fun _ _ : Fin 1 => 2)
    (fun _ => (1 : (ZMod 5)ˣ))
    (fun _ => (⟨2, 3, by decide, by decide⟩ : (ZMod 5)ˣ)) := by
  unfold SignedNahmEq
  decide

/-- The discriminant of a signed or deformed solution. Nonvanishing is a separate hypothesis. -/
def nahmDiscriminant {N : ℕ} {K : Type*} [Field K]
    (A : Matrix (Fin N) (Fin N) ℤ) (z : Fin N → K) : K :=
  (∏ j, z j ^ (-A j j)) *
    Matrix.det (Matrix.diagonal (fun j => 1 - z j) * A.map (Int.castRingHom K) +
      Matrix.diagonal z)

/-- The empty discriminant is one. -/
example {K : Type*} [Field K] (A : Matrix (Fin 0) (Fin 0) ℤ) (z : Fin 0 → K) :
    nahmDiscriminant A z = 1 := by
  simp [nahmDiscriminant]

/-- The cubic signed datum fixes the determinant sign and the power of z. -/
example {K : Type*} [Field K] (z : K) :
    nahmDiscriminant (fun _ _ : Fin 1 => 3) (fun _ => z) =
      z ^ (-3 : ℤ) * (3 - 2 * z) := by
  simp [nahmDiscriminant, Matrix.mul_apply, Matrix.map]
  ring_nf
  simp

/-- An invertible Jacobian at a zero of a rational polynomial system makes every
coordinate algebraic. The system is square; isolation is derived, not assumed as a label. -/
theorem nondegenerate_zero_isAlgebraic {N : ℕ}
    (P : Fin N → MvPolynomial (Fin N) ℚ) (x : Fin N → ℂ)
    (hzero : ∀ i, MvPolynomial.aeval x (P i) = 0)
    (hjac : Matrix.det (fun i j =>
      MvPolynomial.aeval x (MvPolynomial.pderiv j (P i))) ≠ 0) :
    ∀ i, IsAlgebraic ℚ (x i) := by
  sorry

/-- The field generated by a nondegenerate rational polynomial zero is finite over Q. -/
theorem nondegenerate_coordinateField_finite {N : ℕ}
    (P : Fin N → MvPolynomial (Fin N) ℚ) (x : Fin N → ℂ)
    (hzero : ∀ i, MvPolynomial.aeval x (P i) = 0)
    (hjac : Matrix.det (fun i j =>
      MvPolynomial.aeval x (MvPolynomial.pderiv j (P i))) ≠ 0) :
    FiniteDimensional ℚ (IntermediateField.adjoin ℚ (Set.range x)) := by
  sorry

/-! ## Layer 2: analytic Nahm sums and radial asymptotics -/

/-- The actual analytic summand, with finite Euler factors and the exponential branch in τ. -/
def nahmSummand {N : ℕ} (D : NahmDatum N) (τ : ℂ) (n : Fin N → ℕ) : ℂ :=
  Complex.exp (2 * Real.pi * Complex.I * τ *
    (quadraticExponent D.A D.B D.C (fun i => (n i : ℤ)) : ℂ)) /
    ∏ i, ∏ r ∈ Finset.range (n i),
      (1 - Complex.exp (2 * Real.pi * Complex.I * τ) ^ (r + 1))

/-- Empty Euler factors leave the constant exponent in the actual summand. -/
example (D : NahmDatum 0) (τ : ℂ) (n : Fin 0 → ℕ) :
    nahmSummand D τ n = Complex.exp (2 * Real.pi * Complex.I * τ * (D.C : ℂ)) := by
  simp [nahmSummand, quadraticExponent]

/-- The analytic sum is a totalised sum; summability on the upper half-plane is a theorem. -/
def analyticNahmSum {N : ℕ} (D : NahmDatum N) (τ : ℂ) : ℂ :=
  ∑' n : Fin N → ℕ, nahmSummand D τ n

/-- The empty analytic sum retains its constant exponent; it is not always one. -/
example (D : NahmDatum 0) (τ : ℂ) :
    analyticNahmSum D τ = Complex.exp (2 * Real.pi * Complex.I * τ * (D.C : ℂ)) := by
  simp [analyticNahmSum, nahmSummand, quadraticExponent]

/-- Positive definiteness gives absolute convergence, without requiring integral A. -/
theorem nahmSummand_summable {N : ℕ} (D : NahmDatum N) (τ : ℂ) (hτ : 0 < τ.im) :
    Summable (nahmSummand D τ) := by
  sorry

/-- The τ-branch is holomorphic throughout the upper half-plane. -/
theorem analyticNahmSum_holomorphic {N : ℕ} (D : NahmDatum N) :
    DifferentiableOn ℂ (analyticNahmSum D) {τ : ℂ | 0 < τ.im} := by
  sorry

/-! ## Layer 4: modularity and torsion -/

/-- Unbounded divisibility in a finitely generated abelian group kills its free part.
This is applied to an integral Bloch class before rationalisation. -/
theorem torsion_of_unbounded_divisibility {G : Type*} [AddCommGroup G]
    [Module.Finite ℤ G] (g : G)
    (h : ∀ B : ℕ, ∃ n : ℕ, B < n ∧ ∃ y : G, n • y = g) :
    IsOfFinAddOrder g := by
  sorry

/-! ## Layer 5: formal Nahm series and their difference equations -/

/-- The integer exponent in F_A. Symmetry makes the numerator even. -/
def formalExponent {N : ℕ} (A : Matrix (Fin N) (Fin N) ℤ) (n : Fin N → ℕ) : ℤ :=
  ((∑ i, ∑ j, A i j * (n i : ℤ) * (n j : ℤ)) +
    ∑ i, A i i * (n i : ℤ)) / 2

/-- At A=3 the exponent is 3n(n+1)/2, so the n=2 numerator is q^9. -/
example : formalExponent (fun _ _ : Fin 1 => 3) (fun _ => 2) = 9 := by
  norm_num [formalExponent]

/-- Negative matrices remain valid formal data; the exponent can be negative. -/
example : formalExponent (fun _ _ : Fin 1 => -1) (fun _ => 2) = -3 := by
  norm_num [formalExponent]

/-- The formal Nahm series on the existing multivariate power-series carrier over Q(q). -/
def formalNahmSeries {N : ℕ} (A : Matrix (Fin N) (Fin N) ℤ) :
    MvPowerSeries (Fin N) (RatFunc ℚ) :=
  fun n => (-1 : RatFunc ℚ) ^ (∑ i, A i i * (n i : ℤ)) *
    RatFunc.X ^ formalExponent A n /
    (∏ i, ∏ r ∈ Finset.range (n i), (1 - RatFunc.X ^ (r + 1)))

/-- The formal normalisation has constant coefficient one even for negative A. -/
example {N : ℕ} (A : Matrix (Fin N) (Fin N) ℤ) :
    MvPowerSeries.constantCoeff (formalNahmSeries A) = 1 := by
  change formalNahmSeries A 0 = 1
  simp [formalNahmSeries, formalExponent]

/-- The exact column shift, including all off-diagonal entries, determines F_A. -/
theorem formalNahmSeries_qDifference {N : ℕ}
    (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) (j : Fin N) :
    formalNahmSeries A -
      MvPowerSeries.rescale (fun i => if i = j then RatFunc.X else 1) (formalNahmSeries A) =
    MvPowerSeries.C ((-RatFunc.X) ^ A j j) * MvPowerSeries.X j *
      MvPowerSeries.rescale (fun i => RatFunc.X ^ A i j) (formalNahmSeries A) := by
  sorry

/-- The symmetric numerator is even, including for negative entries of A. -/
theorem formalExponent_two_mul {N : ℕ} (A : Matrix (Fin N) (Fin N) ℤ)
    (hA : A.IsSymm) (n : Fin N → ℕ) :
    2 * formalExponent A n =
      (∑ i, ∑ j, A i j * (n i : ℤ) * (n j : ℤ)) + ∑ i, A i i * (n i : ℤ) := by
  sorry

/-! ## Layer 6: Frobenius, the regulator and Habiro modules -/

/-- The first Wick coefficient for covariance C and scalar, linear, quadratic,
cubic and quartic vertices. The mixed linear-cubic term is retained. -/
def regularisationJet {N : ℕ} {K : Type*} [Field K] [CharZero K]
    (C : Matrix (Fin N) (Fin N) K) (b Q T U : Fin N → K) (c : K) : K :=
  c + (∑ i, Q i * C i i) / 2 +
    (∑ i, ∑ j, b i * b j * C i j) / 2 +
    (∑ i, ∑ j, T i * b j * C i i * C i j) / 2 +
    (∑ i, U i * C i i ^ 2) / 8 +
    (∑ i, ∑ j, T i * T j * C i i * C j j * C i j) / 8 +
    (∑ i, ∑ j, T i * T j * C i j ^ 3) / 12

/-- A pure cubic vertex has coefficient E[X^6]/72 = 5/24. -/
example : regularisationJet (fun _ _ : Fin 1 => (1 : ℚ))
    (fun _ => 0) (fun _ => 0) (fun _ => 1) (fun _ => 0) 0 = 5 / 24 := by
  norm_num [regularisationJet]

/-- The mixed bT contraction contributes 1/2; omitting it gives 17/24. -/
example : regularisationJet (fun _ _ : Fin 1 => (1 : ℚ))
    (fun _ => 1) (fun _ => 0) (fun _ => 1) (fun _ => 0) 0 = 29 / 24 := by
  norm_num [regularisationJet]

/-! ## Layer 7: explicit examples and cohomological exports -/

/-- The scalar value of the constant Taylor family of the rational quadratic Gauss norm. -/
def rationalGaussTaylor (m : ℕ) : ℚ :=
  if 4 ∣ m then 2 else if 2 ∣ m then 0 else 1

/-- Even orders distinguish the two connected components visible after inverting 2. -/
example : rationalGaussTaylor 2 = 0 ∧ rationalGaussTaylor 4 = 2 := by
  norm_num [rationalGaussTaylor]

/-- Odd orders give one; the order-one Taylor series alone misses the even values. -/
example : rationalGaussTaylor 1 = 1 ∧ rationalGaussTaylor 3 = 1 := by
  norm_num [rationalGaussTaylor]

/-- The rational Gauss family is the normalised squared modulus of the quadratic Gauss sum
`∑_{k mod m} e(k²/m)`; the three cases are Gauss's evaluation. -/
theorem rationalGaussTaylor_eq_gaussSum (m : ℕ) (hm : 0 < m) :
    ((rationalGaussTaylor m : ℚ) : ℂ) =
      (∑ k ∈ Finset.range m, Complex.exp (2 * Real.pi * Complex.I * (k : ℂ) ^ 2 / m)) *
        (∑ k ∈ Finset.range m, Complex.exp (-(2 * Real.pi * Complex.I * (k : ℂ) ^ 2 / m))) /
          m := by
  sorry

/-- Odd-prime gluing preserves the entire constant family; the prime 2 is excluded. -/
theorem rationalGaussTaylor_mul_odd (m p : ℕ) (hm : 0 < m) (hp : Odd p) :
    rationalGaussTaylor (p * m) = rationalGaussTaylor m := by
  sorry

/-
The README also constructs NondegenerateNahmSolution and its unit-coordinate ring
version, clearingPolynomial, positiveRootLift, nahmField, coherentNahmField,
unsigned and signed Bloch/K-three classes, nahmIntegralModel,
nahmEmbeddingRegulator, pochhammerRadialPsi, the Dedekind phase, formalGaussian,
radialBaseField, radialKummerField, normalisedCuspOrder, cuspLeadingCoefficient,
residueMajorant, mvLog, mvExp, plethysticCoefficients, IsAdmissible, rootExpansion,
the invariants V, delta and U, deformedNahmSolution, deformedDiscriminant,
shiftRatio, orbitRatio, residuePotential, congruenceNahmSeries,
restrictedAdamsCoefficients, IsLevelAdmissible, weighted Gaussian completions,
the corrected local remainder, Gaussian Nahm collections, S_A and S_A^(m),
the rank-one WKB series, pSaturatedMap, the modified potential,
nahmSpecialisationAtOne, auxiliary product systems, descendantPullback,
the rational residue kernel, nahmSymmetrisation, quarticCoordinates,
quarticNormalisedSum, gaussSquareTaylor and the Rogers--Ramanujan residue kernel.
Their comparison and endpoint targets include arithmetic radial descent,
modularity-implies-torsion, finite support, Gaussian identification,
full-algebra Frobenius congruences, Habiro module membership, product gluing,
small-prime extensions and cohomological exports. These require the constructions
and supplier carriers specified in the corresponding README layers.
-/

end

end TauCetiRoadmap.HabiroNahmSeries
