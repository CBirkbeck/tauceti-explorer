/-
Suggested Lean file for the roadmap "Diophantine approximation and transcendence"
(`DiophantineApproximationAndTranscendence`, stages DT.0–DT.5).

This file is not the roadmap and is not exhaustive: the roadmap document
(`research/blueprint/readmes/DiophantineApproximationAndTranscendence.md`) is definitive. The statements
below suggest Lean forms, so that contributors and reviewers converge on names and signatures. Every
definition, API lemma, unit test and named theorem is proved by `sorry`; nothing here is an
implementation claim. It imports only Mathlib (082e2d3); where a Tau Ceti module would be imported,
a comment says so.
-/

import Mathlib.Algebra.Group.UniqueProds.VectorSpace
import Mathlib.Algebra.LinearRecurrence
import Mathlib.Algebra.Module.ZLattice.Basic
import Mathlib.Algebra.MonoidAlgebra.NoZeroDivisors
import Mathlib.Algebra.MvPolynomial.Degrees
import Mathlib.Algebra.MvPolynomial.Equiv
import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.Algebra.MvPolynomial.Rename
import Mathlib.Algebra.MvPolynomial.Variables
import Mathlib.Algebra.Polynomial.HasseDeriv
import Mathlib.Algebra.Polynomial.Homogenize
import Mathlib.Algebra.Polynomial.Taylor
import Mathlib.Analysis.Analytic.Order
import Mathlib.Analysis.Analytic.Uniqueness
import Mathlib.Analysis.Complex.AbsMax
import Mathlib.Analysis.Complex.Liouville
import Mathlib.Analysis.Polynomial.MahlerMeasure
import Mathlib.Analysis.Polynomial.Norm
import Mathlib.Analysis.SpecialFunctions.Complex.LogBounds
import Mathlib.Analysis.SpecialFunctions.Exponential
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Basic.ENNReal.Operations
import Mathlib.FieldTheory.AlgebraicClosure
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.FieldTheory.Minpoly.Basic
import Mathlib.FieldTheory.PolynomialGaloisGroup
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.FieldTheory.SplittingField.Construction
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.LinearAlgebra.LinearIndependent.Defs
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.MeasureTheory.Group.GeometryOfNumbers
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.NumberTheory.DiophantineApproximation.ContinuedFractions
import Mathlib.NumberTheory.Height.MvPolynomial
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.NumberTheory.MahlerMeasure
import Mathlib.NumberTheory.ModularForms.EisensteinSeries.Basic
import Mathlib.NumberTheory.ModularForms.EisensteinSeries.E2.Transform
import Mathlib.NumberTheory.ModularForms.QExpansion
import Mathlib.NumberTheory.Multiplicity
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.Completion.FinitePlace
import Mathlib.NumberTheory.NumberField.Completion.Ramification
import Mathlib.NumberTheory.NumberField.Discriminant.Defs
import Mathlib.NumberTheory.NumberField.House
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.NumberTheory.NumberField.ProductFormula
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.NumberTheory.NumberField.Units.Regulator
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.NumberTheory.Padics.HeightOneSpectrum
import Mathlib.NumberTheory.Padics.PadicNorm
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.NumberTheory.Real.GoldenRatio
import Mathlib.NumberTheory.Real.Irrational
import Mathlib.NumberTheory.SiegelsLemma
import Mathlib.NumberTheory.SmoothNumbers
import Mathlib.NumberTheory.Transcendental.Lindemann.AnalyticalPart
import Mathlib.NumberTheory.Transcendental.Liouville.LiouvilleNumber
import Mathlib.NumberTheory.Transcendental.Liouville.LiouvilleWith
import Mathlib.NumberTheory.Transcendental.Liouville.Measure
import Mathlib.RingTheory.Algebraic.Defs
import Mathlib.RingTheory.Algebraic.Denominator
import Mathlib.RingTheory.AlgebraicIndependent.Basic
import Mathlib.RingTheory.AlgebraicIndependent.TranscendenceBasis
import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.RingTheory.DedekindDomain.GaussLemma
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.RingTheory.EssentialFiniteness
import Mathlib.RingTheory.IntegralClosure.Algebra.Basic
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.MvPolynomial.Basic
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.RingTheory.Norm.Transitivity
import Mathlib.RingTheory.Polynomial.Content
import Mathlib.RingTheory.Polynomial.GaussLemma
import Mathlib.RingTheory.Polynomial.IntegralNormalization
import Mathlib.RingTheory.Polynomial.Wronskian
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.PowerSeries.Exp
import Mathlib.RingTheory.PowerSeries.Substitution


/-! ################################################################
  Stage DT.0
################################################################ -/

/-
Suggested Lean forms for DiophantineApproximationAndTranscendence, stage DT.0
(Heights and approximation constants).

This file is not the roadmap and it is not exhaustive: the roadmap document is definitive.
The statements below suggest Lean forms so that contributors and reviewers converge on names
and signatures. Every proof is `sorry`; nothing here claims an implementation.

Imports are Mathlib only (Mathlib 082e2d3). Nothing from Tau Ceti is imported: no Tau Ceti
declaration at f790474 is used by this stage.

Two inputs come from another roadmap; they are stated here as theorems proved by `sorry`,
clearly marked, so that the fragment elaborates against them:
* Minkowski's linear forms theorem (GeometryOfNumbersAndQuadraticArithmetic:GN.1);
* the polar-lattice covering bound (Evertse, Corollary 2.21), from
  GeometryOfNumbersAndQuadraticArithmetic:GN.4.
They are the supplier's statements, not DT.0 declarations; their names live in the
namespace `DiophantineApproximation.Imported` to make that visible.
-/

open Polynomial NumberField Filter
open scoped ENNReal NNReal Topology

noncomputable section

namespace DiophantineApproximation

/-! ## Imported statements (owned by GeometryOfNumbersAndQuadraticArithmetic) -/

namespace Imported

/-- Minkowski's linear forms theorem (Evertse, Corollary 2.6); owner GN.1. -/
theorem minkowski_linear_forms {n : ℕ} (L : Matrix (Fin n) (Fin n) ℝ) (hL : L.det ≠ 0)
    (A : Fin n → ℝ) (hA : ∀ i, 0 < A i) (hprod : |L.det| ≤ ∏ i, A i) :
    ∃ x : Fin n → ℤ, x ≠ 0 ∧ ∀ i, |∑ j, L i j * x j| ≤ A i := by
  sorry

/-- Evertse, Corollary 2.21 (covering bound from the polar lattice), in the form used by
Kronecker's theorem; owner GN.4. `C n` is a constant depending only on `n`. -/
theorem exists_lattice_point_near_of_polar_long {n : ℕ} :
    ∃ C : ℝ, 0 < C ∧ ∀ (B : Matrix (Fin n) (Fin n) ℝ), B.det ≠ 0 → ∀ R : ℝ, 0 < R →
      (∀ y : Fin n → ℤ, y ≠ 0 → R ≤ ‖(B.transpose)⁻¹.mulVec (fun i => (y i : ℝ))‖) →
      ∀ b : Fin n → ℝ, ∃ z : Fin n → ℤ, ‖B.mulVec (fun i => (z i : ℝ)) - b‖ ≤ C / R := by
  sorry

end Imported

/-! ## Primitive minimal polynomial, naive height, Mahler measure, house -/

section Heights

variable {F : Type*} [Field F] [CharZero F]
variable {F' : Type*} [Field F'] [CharZero F']

open Classical in
/-- The primitive minimal polynomial `F_x ∈ ℤ[X]` of `x` over `ℚ` (Evertse ch. 3, p. 41):
primitive, positive leading coefficient, a `ℚ`-multiple of `minpoly ℚ x`.
Junk value `1` when `x` is transcendental. -/
def primitiveMinpoly (x : F) : ℤ[X] :=
  if IsAlgebraic ℚ x then
    (if 0 < (IsLocalization.integerNormalization (nonZeroDivisors ℤ)
          (minpoly ℚ x)).primPart.leadingCoeff then
        (IsLocalization.integerNormalization (nonZeroDivisors ℤ) (minpoly ℚ x)).primPart
      else -(IsLocalization.integerNormalization (nonZeroDivisors ℤ) (minpoly ℚ x)).primPart)
  else 1

theorem aeval_primitiveMinpoly (x : F) (hx : IsAlgebraic ℚ x) :
    aeval x (primitiveMinpoly x) = 0 := by sorry

theorem isPrimitive_primitiveMinpoly (x : F) : (primitiveMinpoly x).IsPrimitive := by sorry

theorem leadingCoeff_primitiveMinpoly_pos (x : F) : 0 < (primitiveMinpoly x).leadingCoeff := by
  sorry

theorem irreducible_primitiveMinpoly (x : F) (hx : IsAlgebraic ℚ x) :
    Irreducible (primitiveMinpoly x) := by sorry

theorem natDegree_primitiveMinpoly (x : F) :
    (primitiveMinpoly x).natDegree = (minpoly ℚ x).natDegree := by sorry

/-- DT.0/map-primitive-minpoly: `F_x = a₀ · minpoly ℚ x`; its complex roots are the conjugates. -/
theorem map_primitiveMinpoly (x : F) (hx : IsAlgebraic ℚ x) :
    (primitiveMinpoly x).map (Int.castRingHom ℚ) =
      C ((primitiveMinpoly x).leadingCoeff : ℚ) * minpoly ℚ x := by sorry

theorem primitiveMinpoly_dvd_iff (x : F) (hx : IsAlgebraic ℚ x) (P : ℤ[X]) :
    primitiveMinpoly x ∣ P ↔ aeval x P = 0 := by sorry

theorem primitiveMinpoly_eq_of_isPrimitive {x : F} {P : ℤ[X]} (hP : P.IsPrimitive)
    (hlc : 0 < P.leadingCoeff) (hirr : Irreducible P) (hPx : aeval x P = 0) :
    primitiveMinpoly x = P := by sorry

theorem primitiveMinpoly_eq_minpoly_int {x : F} (hx : IsIntegral ℤ x) :
    primitiveMinpoly x = minpoly ℤ x := by sorry

theorem primitiveMinpoly_ratCast (q : ℚ) :
    primitiveMinpoly (q : F) = C (q.den : ℤ) * X - C q.num := by sorry

theorem primitiveMinpoly_map (f : F →+* F') (x : F) :
    primitiveMinpoly (f x) = primitiveMinpoly x := by sorry

theorem primitiveMinpoly_eq_of_minpoly_eq {x : F} {y : F'} (h : minpoly ℚ x = minpoly ℚ y) :
    primitiveMinpoly x = primitiveMinpoly y := by sorry

theorem primitiveMinpoly_of_not_isAlgebraic {x : F} (hx : ¬ IsAlgebraic ℚ x) :
    primitiveMinpoly x = 1 := by sorry

theorem isIntegral_leadingCoeff_primitiveMinpoly_smul (x : F) :
    IsIntegral ℤ ((primitiveMinpoly x).leadingCoeff • x) := by sorry

theorem natDenominator_dvd_leadingCoeff_primitiveMinpoly (x : F) :
    (Algebra.natDenominator x : ℤ) ∣ (primitiveMinpoly x).leadingCoeff := by sorry

/-- Test `test_primitiveMinpoly_twoThirds` (computation). -/
example : primitiveMinpoly (((2 : ℚ) / 3 : ℚ) : ℝ) = C 3 * X - C 2 := by sorry
/-- Test `test_primitiveMinpoly_evertseExample` (computation). -/
example : primitiveMinpoly ((1 + 2 * Real.sqrt 3) / 5) = C 25 * X ^ 2 - C 10 * X - C 11 := by
  sorry
/-- Test `test_primitiveMinpoly_transcendental` (degenerate). -/
example : primitiveMinpoly (liouvilleNumber 10) = 1 := by sorry
/-- Test `test_primitiveMinpoly_half_ne_minpolyInt` (non-example). -/
example : primitiveMinpoly (((1 : ℚ) / 2 : ℚ) : ℝ) ≠ minpoly ℤ (((1 : ℚ) / 2 : ℚ) : ℝ) := by sorry
/-- Test `test_primitiveMinpoly_sqrtTwo` (compatibility). -/
example : primitiveMinpoly (Real.sqrt 2) = minpoly ℤ (Real.sqrt 2) := by sorry

/-- The naive height `H(x)`: the maximum of the absolute values of the coefficients of the
primitive minimal polynomial (Evertse ch. 3, p. 41), as Mathlib's `Polynomial.supNorm`. -/
def naiveHeight (x : F) : ℝ := (primitiveMinpoly x).supNorm

theorem naiveHeight_eq_iSup (x : F) :
    naiveHeight x = ⨆ i, |((primitiveMinpoly x).coeff i : ℝ)| := by sorry

theorem one_le_naiveHeight (x : F) : 1 ≤ naiveHeight x := by sorry

theorem naiveHeight_inv (x : F) : naiveHeight x⁻¹ = naiveHeight x := by sorry

theorem naiveHeight_map (f : F →+* F') (x : F) : naiveHeight (f x) = naiveHeight x := by sorry

theorem naiveHeight_eq_of_minpoly_eq {x : F} {y : F'} (h : minpoly ℚ x = minpoly ℚ y) :
    naiveHeight x = naiveHeight y := by sorry

theorem inv_naiveHeight_add_one_le_norm {x : ℂ} (hx : IsAlgebraic ℚ x) (h0 : x ≠ 0) :
    (naiveHeight x + 1)⁻¹ ≤ ‖x‖ := by sorry

theorem norm_le_naiveHeight_add_one {x : ℂ} (hx : IsAlgebraic ℚ x) :
    ‖x‖ ≤ naiveHeight x + 1 := by sorry

theorem natDenominator_le_naiveHeight (x : F) (hx : IsAlgebraic ℚ x) :
    (Algebra.natDenominator x : ℝ) ≤ naiveHeight x := by sorry

theorem naiveHeight_intCast (n : ℤ) : naiveHeight (n : F) = max |(n : ℝ)| 1 := by sorry

/-- Test `test_naiveHeight_evertseExample` (computation). -/
example : naiveHeight ((1 + 2 * Real.sqrt 3) / 5) = 25 := by sorry
/-- Test `test_naiveHeight_zero` (degenerate). -/
example : naiveHeight (0 : ℝ) = 1 := by sorry
/-- Test `test_naiveHeight_sqrtTwo` (computation). -/
example : naiveHeight (Real.sqrt 2) = 2 := by sorry
/-- Test `test_naiveHeight_sqrtTwo_ne_absHeight` (non-example). -/
example : naiveHeight (Real.sqrt 2) ≠ NumberField.absMulHeight₁ (Real.sqrt 2) := by sorry
/-- Test `test_naiveHeight_twoThirds_eq_mulHeight` (compatibility). -/
example : naiveHeight (((2 : ℚ) / 3 : ℚ) : ℝ) = Height.mulHeight₁ ((2 : ℚ) / 3) := by sorry

/-- DT.0/naive-height-of-rational: `H(p/q) = max(|p|, q)`, equal to Mathlib's height of a
rational number. -/
theorem naiveHeight_ratCast (q : ℚ) :
    naiveHeight (q : F) = max |(q.num : ℝ)| (q.den : ℝ) ∧
      naiveHeight (q : F) = Height.mulHeight₁ q := by sorry

/-- The Mahler measure `M(x) = a₀ ∏ max(1, |x⁽ⁱ⁾|)` of an algebraic number
(Evertse ch. 6, p. 108): Mathlib's Mahler measure of `F_x` mapped to `ℂ`. -/
def mahlerMeasure (x : F) : ℝ := (primitiveMinpoly x).mapMahlerMeasure (Int.castRingHom ℂ)

theorem mahlerMeasure_eq_leadingCoeff_mul_prod (x : F) :
    mahlerMeasure x = ((primitiveMinpoly x).leadingCoeff : ℝ) *
      (((minpoly ℚ x).aroots ℂ).map fun z => max 1 ‖z‖).prod := by sorry

theorem one_le_mahlerMeasure (x : F) : 1 ≤ mahlerMeasure x := by sorry

theorem leadingCoeff_le_mahlerMeasure (x : F) :
    ((primitiveMinpoly x).leadingCoeff : ℝ) ≤ mahlerMeasure x := by sorry

theorem mahlerMeasure_ratCast (q : ℚ) :
    mahlerMeasure (q : F) = max |(q.num : ℝ)| (q.den : ℝ) := by sorry

theorem mahlerMeasure_inv (x : F) : mahlerMeasure x⁻¹ = mahlerMeasure x := by sorry

theorem mahlerMeasure_map (f : F →+* F') (x : F) : mahlerMeasure (f x) = mahlerMeasure x := by
  sorry

theorem mahlerMeasure_eq_of_minpoly_eq {x : F} {y : F'} (h : minpoly ℚ x = minpoly ℚ y) :
    mahlerMeasure x = mahlerMeasure y := by sorry

theorem mahlerMeasure_eq_one_iff {x : F} (hx : IsAlgebraic ℚ x) :
    mahlerMeasure x = 1 ↔ x = 0 ∨ ∃ n : ℕ, 0 < n ∧ x ^ n = 1 := by sorry

theorem finite_setOf_mahlerMeasure_le (d : ℕ) (B : ℝ) :
    {z : ℂ | IsAlgebraic ℚ z ∧ (minpoly ℚ z).natDegree ≤ d ∧ mahlerMeasure z ≤ B}.Finite := by
  sorry

/-- Test `test_mahlerMeasure_half` (computation). -/
example : mahlerMeasure (((1 : ℚ) / 2 : ℚ) : ℝ) = 2 := by sorry
/-- Test `test_mahlerMeasure_sqrtTwo` (computation). -/
example : mahlerMeasure (Real.sqrt 2) = 2 := by sorry
/-- Test `test_mahlerMeasure_goldenRatio` (computation). -/
example : mahlerMeasure Real.goldenRatio = Real.goldenRatio := by sorry
/-- Test `test_mahlerMeasure_I` (degenerate). -/
example : mahlerMeasure Complex.I = 1 := by sorry
/-- Test `test_mahlerMeasure_zero` (degenerate). -/
example : mahlerMeasure (0 : ℝ) = 1 := by sorry
/-- Test `test_mahlerMeasure_half_ne_norm` (non-example). -/
example : mahlerMeasure (((1 : ℚ) / 2 : ℚ) : ℝ) ≠ |Algebra.norm ℚ ((1 : ℚ) / 2)| := by sorry

/-- The house `⌈x⌉`: the largest absolute value of a complex conjugate of `x`
(Evertse ch. 3, p. 52), independent of any number field; junk value `0` for
transcendental `x`. -/
def house (x : F) : ℝ := ⨆ z : (minpoly ℚ x).rootSet ℂ, ‖(z : ℂ)‖

/-- DT.0/house-eq-numberField-house (Evertse (3.2)). -/
theorem house_eq_numberField_house {K : Type*} [Field K] [NumberField K] (x : K) :
    house x = NumberField.house x := by sorry

theorem house_nonneg (x : F) : 0 ≤ house x := by sorry

theorem norm_le_house {x : ℂ} (hx : IsAlgebraic ℚ x) : ‖x‖ ≤ house x := by sorry

theorem house_map (f : F →+* F') (x : F) : house (f x) = house x := by sorry

theorem house_eq_of_minpoly_eq {x : F} {y : F'} (h : minpoly ℚ x = minpoly ℚ y) :
    house x = house y := by sorry

theorem house_mul_le {x y : ℂ} (hx : IsAlgebraic ℚ x) (hy : IsAlgebraic ℚ y) :
    house (x * y) ≤ house x * house y := by sorry

theorem house_add_le {x y : ℂ} (hx : IsAlgebraic ℚ x) (hy : IsAlgebraic ℚ y) :
    house (x + y) ≤ house x + house y := by sorry

theorem house_pow {x : ℂ} (hx : IsAlgebraic ℚ x) (n : ℕ) : house (x ^ n) = house x ^ n := by
  sorry

theorem house_ratCast (q : ℚ) : house (q : F) = |(q : ℝ)| := by sorry

theorem one_le_house {x : F} (hx : IsIntegral ℤ x) (h0 : x ≠ 0) : 1 ≤ house x := by sorry

theorem house_eq_one_iff {x : F} (hx : IsIntegral ℤ x) (h0 : x ≠ 0) :
    house x = 1 ↔ ∃ n : ℕ, 0 < n ∧ x ^ n = 1 := by sorry

theorem house_le_mahlerMeasure {x : F} (hx : IsIntegral ℤ x) : house x ≤ mahlerMeasure x := by
  sorry

theorem mahlerMeasure_le_leadingCoeff_mul_max_one_house_pow (x : F) :
    mahlerMeasure x ≤
      ((primitiveMinpoly x).leadingCoeff : ℝ) * max 1 (house x) ^ (minpoly ℚ x).natDegree := by
  sorry

/-- Test `test_house_sqrtTwo` (computation). -/
example : house (Real.sqrt 2) = Real.sqrt 2 := by sorry
/-- Test `test_house_conjugateGolden` (computation). -/
example : house ((1 - Real.sqrt 5) / 2) = (1 + Real.sqrt 5) / 2 := by sorry
/-- Test `test_house_ne_abs` (non-example). -/
example : |(1 - Real.sqrt 5) / 2| < house ((1 - Real.sqrt 5) / 2) := by sorry
/-- Test `test_house_zero` (degenerate). -/
example : house (0 : ℂ) = 0 := by sorry
/-- Test `test_house_I` (computation). -/
example : house Complex.I = 1 := by sorry
/-- Test `test_house_two_eq_numberFieldHouse` (compatibility). -/
example : house (2 : ℚ) = NumberField.house (2 : ℚ) := by sorry

end Heights

/-! ## Heights under field extension and the comparison `M(α) = H(α)^d` -/

section Comparison

/-- DT.0/infinite-places-over: regrouping a product over the infinite places of `L`
along the places of `K` below them. -/
theorem prod_infinitePlace_comap_pow_mult {K L : Type*} [Field K] [NumberField K] [Field L]
    [NumberField L] [Algebra K L] {M : Type*} [CommMonoid M] (g : InfinitePlace K → M) :
    ∏ w : InfinitePlace L, g (w.comap (algebraMap K L)) ^ w.mult =
      ∏ v : InfinitePlace K, g v ^ (v.mult * Module.finrank K L) := by sorry

-- The restriction of a finite place along `K → L` is Mathlib's
-- `NumberField.FinitePlace.equivHeightOneSpectrum_symm_apply_algebraMap`; it is consumed, not restated.

/-- DT.0/mul-height-algebra-map: the relative multiplicative height of a tuple is multiplied
by the degree under a finite extension. -/
theorem mulHeight_algebraMap {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L]
    [Algebra K L] {ι : Type*} [Finite ι] (x : ι → K) :
    Height.mulHeight (algebraMap K L ∘ x) = Height.mulHeight x ^ Module.finrank K L := by sorry

/-- The scalar case of DT.0/mul-height-algebra-map (via `Height.mulHeight₁_eq_mulHeight`). -/
theorem mulHeight₁_algebraMap {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L]
    [Algebra K L] (x : K) :
    Height.mulHeight₁ (algebraMap K L x) = Height.mulHeight₁ x ^ Module.finrank K L := by sorry

/-- DT.0/mul-height-ring-equiv: heights are invariant under isomorphisms of number fields. -/
theorem mulHeight_ringEquiv {K K' : Type*} [Field K] [NumberField K] [Field K']
    [NumberField K'] (e : K ≃+* K') {ι : Type*} [Finite ι] (x : ι → K) :
    Height.mulHeight (e ∘ x) = Height.mulHeight x := by sorry

/-- DT.0/abs-mul-height-eq-rpow: Mathlib's absolute height computed in any number field. -/
theorem absMulHeight₁_eq_rpow {K : Type*} [Field K] [NumberField K] (x : K) :
    NumberField.absMulHeight₁ x = Height.mulHeight₁ x ^ ((Module.finrank ℚ K : ℝ)⁻¹) := by sorry

/-- DT.0/abs-mul-height-eq-of-minpoly-eq: the absolute height depends only on the minimal
polynomial (conjugates and embeddings do not change it). -/
theorem absMulHeight₁_eq_of_minpoly_eq {F F' : Type*} [Field F] [CharZero F] [Field F']
    [CharZero F'] {x : F} {y : F'} (h : minpoly ℚ x = minpoly ℚ y) :
    NumberField.absMulHeight₁ x = NumberField.absMulHeight₁ y := by sorry

/-- DT.0/gauss-norm-primitive-finite-place. -/
theorem gaussNorm_map_eq_one_of_isPrimitive {L : Type*} [Field L] [NumberField L]
    (w : FinitePlace L) {P : ℤ[X]} (hP : P.IsPrimitive) :
    (P.map (Int.castRingHom L)).gaussNorm w 1 = 1 := by sorry

/-- DT.0/finite-place-gauss-lemma: Gauss's lemma at a finite place for a split primitive
polynomial. -/
theorem finitePlace_leadingCoeff_mul_prod_max_eq_one {L : Type*} [Field L] [NumberField L]
    (w : FinitePlace L) {P : ℤ[X]} (hP : P.IsPrimitive) {a : L} {s : Multiset L}
    (h : P.map (Int.castRingHom L) = C a * (s.map fun b => X - C b).prod) :
    w a * (s.map fun b => max (w b) 1).prod = 1 := by sorry

variable {F : Type*} [Field F] [CharZero F]

/-- DT.0/height-comparisons: `M(x) = H_abs(x)^d` with `d = deg x`
(both sides are `1` for transcendental `x`). -/
theorem mahlerMeasure_eq_absMulHeight₁_pow (x : F) :
    mahlerMeasure x = NumberField.absMulHeight₁ x ^ (minpoly ℚ x).natDegree := by sorry

/-- DT.0/naive-height-le-choose-mul-mahler-measure. -/
theorem naiveHeight_le_choose_mul_mahlerMeasure (x : F) :
    naiveHeight x ≤
      ((minpoly ℚ x).natDegree.choose ((minpoly ℚ x).natDegree / 2) : ℝ) * mahlerMeasure x := by
  sorry

/-- DT.0/mahler-measure-le-sqrt-mul-naive-height (Landau). -/
theorem mahlerMeasure_le_sqrt_mul_naiveHeight (x : F) :
    mahlerMeasure x ≤ Real.sqrt ((minpoly ℚ x).natDegree + 1) * naiveHeight x := by sorry

/-- DT.0/naive-height-abs-height-comparison. -/
theorem naiveHeight_absMulHeight₁_comparison (x : F) :
    (2 : ℝ)⁻¹ ^ (minpoly ℚ x).natDegree * naiveHeight x ≤
        NumberField.absMulHeight₁ x ^ (minpoly ℚ x).natDegree ∧
      NumberField.absMulHeight₁ x ^ (minpoly ℚ x).natDegree ≤
        Real.sqrt ((minpoly ℚ x).natDegree + 1) * naiveHeight x := by sorry

/-- DT.0/northcott-naive-height (with Evertse's count, Theorem 1.7 proof). -/
theorem finite_setOf_naiveHeight_le (d : ℕ) (B : ℝ) :
    {z : ℂ | IsAlgebraic ℚ z ∧ (minpoly ℚ z).natDegree ≤ d ∧ naiveHeight z ≤ B}.Finite ∧
      {z : ℂ | IsAlgebraic ℚ z ∧ (minpoly ℚ z).natDegree ≤ d ∧ naiveHeight z ≤ B}.ncard ≤
        d * (2 * ⌊B⌋₊ + 1) ^ (d + 1) := by sorry

/-- DT.0/northcott-absolute-height: Northcott over `ℚ̄` for Mathlib's absolute height. -/
theorem finite_setOf_absMulHeight₁_le (d : ℕ) (B : ℝ) :
    {z : ℂ | IsAlgebraic ℚ z ∧ (minpoly ℚ z).natDegree ≤ d ∧
      NumberField.absMulHeight₁ z ≤ B}.Finite := by sorry

/-- DT.0/central-binomial-sqrt-bound. -/
theorem choose_half_mul_sqrt_le_two_pow (k : ℕ) :
    (k.choose (k / 2) : ℝ) * Real.sqrt (k + 1) ≤ 2 ^ k := by sorry

/-- DT.0/gelfond-inequality: heights of the factors of a product of complex polynomials. -/
theorem gelfond_inequality (s : Multiset ℂ[X]) :
    (s.map Polynomial.supNorm).prod ≤ 2 ^ s.prod.natDegree * s.prod.supNorm ∧
      s.prod.supNorm ≤ 2 ^ s.prod.natDegree * (s.map Polynomial.supNorm).prod := by sorry

/-- DT.0/naive-height-le-two-mul-house-pow (Evertse, Exercise 3.6(ii)). -/
theorem naiveHeight_le_two_mul_house_pow {x : F} (hx : IsIntegral ℤ x) (h0 : x ≠ 0) :
    naiveHeight x ≤ (2 * house x) ^ (minpoly ℚ x).natDegree := by sorry

/-- DT.0/finite-algebraic-integers-house-le (Evertse, Exercise 3.6(iii)). -/
theorem finite_setOf_isIntegral_house_le (d : ℕ) (C : ℝ) :
    {z : ℂ | IsIntegral ℤ z ∧ (minpoly ℚ z).natDegree ≤ d ∧ house z ≤ C}.Finite ∧
      {z : ℂ | IsIntegral ℤ z ∧ (minpoly ℚ z).natDegree ≤ d ∧ house z ≤ C}.ncard ≤
        ∑ k ∈ Finset.range (d + 1), k * (2 * ⌊(2 * max C 1) ^ k⌋₊ + 1) ^ k := by sorry

/-- DT.0/liouville-size-bound (Evertse, Exercise 3.7(i)). -/
theorem natDenominator_zpow_mul_house_zpow_le_norm {z : ℂ} (hz : IsAlgebraic ℚ z) (h0 : z ≠ 0) :
    (Algebra.natDenominator z : ℝ) ^ (-((minpoly ℚ z).natDegree : ℤ)) *
      house z ^ (1 - ((minpoly ℚ z).natDegree : ℤ)) ≤ ‖z‖ := by sorry

/-- DT.0/liouville-size-bound-embedding: the same bound for the conjugates of an element of a
number field, with the field degree in the exponents. -/
theorem natDenominator_zpow_mul_house_zpow_le_norm_embedding {K : Type*} [Field K]
    [NumberField K] {x : K} (h0 : x ≠ 0) (σ : K →+* ℂ) :
    (Algebra.natDenominator x : ℝ) ^ (-(Module.finrank ℚ K : ℤ)) *
      NumberField.house x ^ (1 - (Module.finrank ℚ K : ℤ)) ≤ ‖σ x‖ := by sorry

end Comparison

/-! ## Siegel's lemma over a number field with rational-integer solutions -/

section Siegel

variable {K : Type*} [Field K] [NumberField K]

/-- DT.0/small-integral-element-eq-zero (Evertse, Lemma 3.19). -/
theorem eq_zero_of_forall_abs_re_im_le (α : 𝓞 K)
    (h : ∀ σ : K →+* ℂ, |(σ α).re| ≤ 2 / 3 ∧ |(σ α).im| ≤ 2 / 3) : α = 0 := by sorry

/-- DT.0/siegel-lemma-number-field (Evertse, Theorem 3.20). -/
theorem exists_ne_zero_int_vec_abs_le_of_house_le {M N : ℕ} (a : Fin M → Fin N → 𝓞 K)
    {A : ℝ} (hA : 1 ≤ A) (hM : 0 < M) (hMN : Module.finrank ℚ K * M < N)
    (ha : ∀ i j, NumberField.house (a i j : K) ≤ A) :
    ∃ x : Fin N → ℤ, x ≠ 0 ∧ (∀ i, ∑ j, (x j : 𝓞 K) * a i j = 0) ∧
      ∀ j, (|x j| : ℝ) ≤ (3 * N * A) ^
        (((Module.finrank ℚ K * M : ℕ) : ℝ) / ((N : ℝ) - (Module.finrank ℚ K * M : ℕ))) := by
  sorry

end Siegel

/-! ## Dirichlet's theorem through Minkowski -/

section Dirichlet

/-- DT.0/dirichlet-approximation-from-minkowski: Dirichlet's theorem for a system of `m`
linear forms in `n` variables, finite-`Q` form (Evertse, Exercise 2.6 / proof of
Corollary 2.7). -/
theorem dirichlet_linearForms {m n : ℕ} (hm : 0 < m) (hn : 0 < n) (A : Matrix (Fin m) (Fin n) ℝ)
    {Q : ℝ} (hQ : 1 < Q) :
    ∃ (y : Fin n → ℤ) (x : Fin m → ℤ), y ≠ 0 ∧ (∀ j, (|y j| : ℝ) ≤ Q) ∧
      ∀ i, |∑ j, A i j * y j - x i| ≤ Q ^ (-(n : ℝ) / m) := by sorry

/-- DT.0/dirichlet-linear-forms-infinitely-many (Evertse, Exercise 2.6). -/
theorem dirichlet_linearForms_infinite {m n : ℕ} (hm : 0 < m) (hn : 0 < n)
    (A : Matrix (Fin m) (Fin n) ℝ)
    (hA : ∀ y : Fin n → ℤ, (∀ i, ∃ k : ℤ, ∑ j, A i j * y j = k) → y = 0) :
    {p : (Fin n → ℤ) × (Fin m → ℤ) | p.1 ≠ 0 ∧
      ∀ i, |∑ j, A i j * p.1 j - p.2 i| ≤ ‖p.1‖ ^ (-(n : ℝ) / m)}.Infinite := by sorry

/-- DT.0/simultaneous-dirichlet-theorem (Evertse, Theorem 1.4(i)). -/
theorem simultaneous_dirichlet {n : ℕ} (hn : 0 < n) (α : Fin n → ℝ) {Q : ℝ} (hQ : 1 < Q) :
    ∃ (x : Fin n → ℤ) (y : ℤ), 0 < y ∧ (y : ℝ) ≤ Q ^ n ∧
      ∀ i, |(x i : ℝ) - α i * y| ≤ Q⁻¹ := by sorry

/-- DT.0/simultaneous-dirichlet-infinitely-many (Evertse, Theorem 1.4(ii), Corollary 2.7(i)). -/
theorem simultaneous_dirichlet_infinite {n : ℕ} (hn : 0 < n) (α : Fin n → ℝ)
    (hα : ∃ i, Irrational (α i)) :
    {p : (Fin n → ℤ) × ℤ | 0 < p.2 ∧ gcd (Finset.univ.gcd p.1) p.2 = 1 ∧
      ∀ i, |α i - p.1 i / p.2| ≤ (p.2 : ℝ) ^ (-1 - 1 / (n : ℝ))}.Infinite := by sorry

/-- DT.0/dirichlet-linear-form-infinitely-many (Evertse, Corollary 2.7(ii); the input of
Lemma 7.6). -/
theorem dirichlet_linearForm_infinite {n : ℕ} (hn : 0 < n) (α : Fin n → ℝ)
    (hα : ∀ y : Fin n → ℤ, (∃ k : ℤ, ∑ j, α j * y j = k) → y = 0) :
    {p : ℤ × (Fin n → ℤ) | p.2 ≠ 0 ∧
      |∑ j, α j * p.2 j - p.1| ≤ ‖p.2‖ ^ (-(n : ℝ))}.Infinite := by sorry

/-- DT.0/irrationality-criterion (Evertse, Lemma 1.9). -/
theorem irrational_of_tendsto_abs_sub {α : ℝ} (x y : ℕ → ℤ) (hy : ∀ k, 0 < y k)
    (hne : ∀ k, (x k : ℝ) / y k ≠ α)
    (h : Tendsto (fun k => |(x k : ℝ) - α * y k|) atTop (𝓝 0)) : Irrational α := by sorry

/-- DT.0/kronecker-approximation-theorem (Evertse, Theorem 2.22). -/
theorem kronecker_approximation {n : ℕ} (α θ : Fin n → ℝ)
    (hα : LinearIndependent ℚ (Fin.cons (1 : ℝ) α : Fin (n + 1) → ℝ)) {ε : ℝ} (hε : 0 < ε) :
    {p : (Fin n → ℤ) × ℤ | ∀ i, |α i * p.2 - p.1 i - θ i| ≤ ε}.Infinite := by sorry

end Dirichlet

/-! ## Approximation constants -/

section Exponents

/-- The irrationality exponent `μ(ξ) ∈ [1, ∞]`: the supremum of the `p` with
`LiouvilleWith p ξ`. -/
def irrationalityExponent (ξ : ℝ) : ℝ≥0∞ :=
  ⨆ (p : ℝ) (_ : LiouvilleWith p ξ), ENNReal.ofReal p

theorem one_le_irrationalityExponent (ξ : ℝ) : 1 ≤ irrationalityExponent ξ := by sorry

theorem le_irrationalityExponent_of_liouvilleWith {p ξ : ℝ} (h : LiouvilleWith p ξ) :
    ENNReal.ofReal p ≤ irrationalityExponent ξ := by sorry

theorem liouvilleWith_of_lt_irrationalityExponent {p ξ : ℝ}
    (h : ENNReal.ofReal p < irrationalityExponent ξ) : LiouvilleWith p ξ := by sorry

theorem irrationalityExponent_eq_iSup_infinite {ξ : ℝ} (hξ : Irrational ξ) :
    irrationalityExponent ξ =
      ⨆ (p : ℝ) (_ : {r : ℚ | |ξ - r| < (r.den : ℝ) ^ (-p)}.Infinite), ENNReal.ofReal p := by
  sorry

theorem irrationalityExponent_eq_top_iff (ξ : ℝ) :
    irrationalityExponent ξ = ⊤ ↔ Liouville ξ := by sorry

theorem irrationalityExponent_ratCast (q : ℚ) : irrationalityExponent q = 1 := by sorry

theorem two_le_irrationalityExponent_iff (ξ : ℝ) :
    2 ≤ irrationalityExponent ξ ↔ Irrational ξ := by sorry

theorem irrationalityExponent_add_ratCast (ξ : ℝ) (r : ℚ) :
    irrationalityExponent (ξ + r) = irrationalityExponent ξ := by sorry

theorem irrationalityExponent_ratCast_mul (ξ : ℝ) {r : ℚ} (hr : r ≠ 0) :
    irrationalityExponent (r * ξ) = irrationalityExponent ξ := by sorry

theorem irrationalityExponent_neg (ξ : ℝ) :
    irrationalityExponent (-ξ) = irrationalityExponent ξ := by sorry

theorem ae_irrationalityExponent_eq_two : ∀ᵐ ξ : ℝ, irrationalityExponent ξ = 2 := by sorry

/-- Test `test_irrationalityExponent_half` (degenerate). -/
example : irrationalityExponent (1 / 2) = 1 := by sorry
/-- Test `test_irrationalityExponent_sqrtTwo` (computation). -/
example : irrationalityExponent (Real.sqrt 2) = 2 := by sorry
/-- Test `test_irrationalityExponent_liouvilleNumber` (computation). -/
example : irrationalityExponent (liouvilleNumber 10) = ⊤ := by sorry
/-- Test `test_irrationalityExponent_zero_ne_top` (non-example). -/
example : irrationalityExponent 0 ≠ ⊤ := by sorry

/-- The exponent `w(θ)` of approximation of zero by the linear form
`x₀ + x₁θ₁ + ⋯ + xₙθₙ` (Bugeaud, Definition 2.1, for a general vector). -/
def linearFormExponent {n : ℕ} (θ : Fin n → ℝ) : ℝ≥0∞ :=
  ⨆ (w : ℝ) (_ : {x : Fin (n + 1) → ℤ |
      0 < |∑ j, (x j : ℝ) * (Fin.cons (1 : ℝ) θ : Fin (n + 1) → ℝ) j| ∧
      |∑ j, (x j : ℝ) * (Fin.cons (1 : ℝ) θ : Fin (n + 1) → ℝ) j| ≤ ‖x‖ ^ (-w)}.Infinite),
    ENNReal.ofReal w

/-- Mahler's exponent `w_n(ξ) = w(ξ, ξ², …, ξⁿ)`. -/
abbrev mahlerExponent (n : ℕ) (ξ : ℝ) : ℝ≥0∞ :=
  linearFormExponent (fun j : Fin n => ξ ^ ((j : ℕ) + 1))

theorem linearFormExponent_one_add {ξ : ℝ} (hξ : Irrational ξ) :
    linearFormExponent ![ξ] + 1 = irrationalityExponent ξ := by sorry

theorem le_linearFormExponent_of_infinite {n : ℕ} (θ : Fin n → ℝ) {w : ℝ}
    (h : {x : Fin (n + 1) → ℤ |
      0 < |∑ j, (x j : ℝ) * (Fin.cons (1 : ℝ) θ : Fin (n + 1) → ℝ) j| ∧
      |∑ j, (x j : ℝ) * (Fin.cons (1 : ℝ) θ : Fin (n + 1) → ℝ) j| ≤ ‖x‖ ^ (-w)}.Infinite) :
    ENNReal.ofReal w ≤ linearFormExponent θ := by sorry

theorem mahlerExponent_mono {m n : ℕ} (h : m ≤ n) (ξ : ℝ) :
    mahlerExponent m ξ ≤ mahlerExponent n ξ := by sorry

/-- Test `test_linearFormExponent_sqrtTwo` (computation). -/
example : linearFormExponent ![Real.sqrt 2] = 1 := by sorry
/-- Test `test_linearFormExponent_half` (non-example). -/
example : linearFormExponent ![(1 / 2 : ℝ)] = 0 := by sorry
/-- Test `test_linearFormExponent_empty` (degenerate). -/
example : linearFormExponent (Fin.elim0 : Fin 0 → ℝ) = 0 := by sorry
/-- Test `test_linearFormExponent_liouvilleNumber` (compatibility). -/
example : linearFormExponent ![liouvilleNumber 10] = ⊤ := by sorry

/-- The exponent `λ(θ)` of simultaneous rational approximation to `θ₁, …, θₙ`
(Bugeaud, Definition 2.2, for a general vector). -/
def simultaneousExponent {n : ℕ} (θ : Fin n → ℝ) : ℝ≥0∞ :=
  ⨆ (l : ℝ) (_ : {x : ℤ × (Fin n → ℤ) | x.1 ≠ 0 ∧
      ∀ j, |(x.1 : ℝ) * θ j - x.2 j| ≤ |(x.1 : ℝ)| ^ (-l)}.Infinite), ENNReal.ofReal l

theorem simultaneousExponent_one_add {ξ : ℝ} (hξ : Irrational ξ) :
    simultaneousExponent ![ξ] + 1 = irrationalityExponent ξ := by sorry

theorem simultaneousExponent_eq_top_of_forall_rat {n : ℕ} (θ : Fin n → ℝ)
    (hθ : ∀ j, ∃ q : ℚ, θ j = q) : simultaneousExponent θ = ⊤ := by sorry

theorem simultaneousExponent_le_comp {m n : ℕ} (θ : Fin n → ℝ) {f : Fin m → Fin n}
    (hf : Function.Injective f) : simultaneousExponent θ ≤ simultaneousExponent (θ ∘ f) := by
  sorry

/-- Test `test_simultaneousExponent_sqrtTwo` (computation). -/
example : simultaneousExponent ![Real.sqrt 2] = 1 := by sorry
/-- Test `test_simultaneousExponent_rationals` (degenerate). -/
example : simultaneousExponent ![(1 / 2 : ℝ), 1 / 3] = ⊤ := by sorry
/-- Test `test_simultaneousExponent_empty` (degenerate). -/
example : simultaneousExponent (Fin.elim0 : Fin 0 → ℝ) = ⊤ := by sorry
/-- Test `test_simultaneousExponent_sqrtTwo_sqrtThree` (computation). -/
example : simultaneousExponent ![Real.sqrt 2, Real.sqrt 3] ≤ 1 := by sorry

/-- The exponent `w*_n(ξ)` of approximation by algebraic numbers of degree at most `n`,
measured with the naive height (Bugeaud, Definition 2.1). -/
def algebraicApproximationExponent (n : ℕ) (ξ : ℝ) : ℝ≥0∞ :=
  ⨆ (w : ℝ) (_ : {α : ℂ | IsAlgebraic ℚ α ∧ (minpoly ℚ α).natDegree ≤ n ∧
      0 < ‖(ξ : ℂ) - α‖ ∧ ‖(ξ : ℂ) - α‖ ≤ naiveHeight α ^ (-w - 1)}.Infinite), ENNReal.ofReal w

theorem algebraicApproximationExponent_one_add {ξ : ℝ} (hξ : Irrational ξ) :
    algebraicApproximationExponent 1 ξ + 1 = irrationalityExponent ξ := by sorry

theorem algebraicApproximationExponent_mono {m n : ℕ} (h : m ≤ n) (ξ : ℝ) :
    algebraicApproximationExponent m ξ ≤ algebraicApproximationExponent n ξ := by sorry

/-- Test `test_algebraicApproximationExponent_sqrtTwo` (computation). -/
example : algebraicApproximationExponent 1 (Real.sqrt 2) = 1 := by sorry
/-- Test `test_algebraicApproximationExponent_zero` (degenerate). -/
example (ξ : ℝ) : algebraicApproximationExponent 0 ξ = 0 := by sorry
/-- Test `test_algebraicApproximationExponent_half` (non-example). -/
example : algebraicApproximationExponent 1 (1 / 2) = 0 := by sorry
/-- Test `test_algebraicApproximationExponent_liouvilleNumber` (compatibility). -/
example : algebraicApproximationExponent 1 (liouvilleNumber 10) = ⊤ := by sorry

/-- DT.0/simultaneous-exponent-dirichlet-bound (Bugeaud, Theorem 2.5, lower bound). -/
theorem inv_le_simultaneousExponent {n : ℕ} (hn : 0 < n) (θ : Fin n → ℝ) :
    ENNReal.ofReal (1 / n) ≤ simultaneousExponent θ := by sorry

/-- DT.0/linear-form-exponent-dirichlet-bound (Bugeaud, Theorem 2.5, lower bound). -/
theorem natCast_le_linearFormExponent {n : ℕ} (hn : 0 < n) (θ : Fin n → ℝ)
    (hθ : LinearIndependent ℚ (Fin.cons (1 : ℝ) θ : Fin (n + 1) → ℝ)) :
    (n : ℝ≥0∞) ≤ linearFormExponent θ := by sorry

/-- DT.0/algebraic-exponent-le-mahler-exponent (Bugeaud, Theorem 2.5, `w*_n ≤ w_n`). -/
theorem algebraicApproximationExponent_le_mahlerExponent {n : ℕ} (hn : 0 < n) {ξ : ℝ}
    (hξ : ¬ (IsAlgebraic ℚ ξ ∧ (minpoly ℚ ξ).natDegree ≤ n)) :
    algebraicApproximationExponent n ξ ≤ mahlerExponent n ξ := by sorry

/-- DT.0/convergent-error-lower-bound (Evertse, Exercise 1.7(iv)–(v); Sondow (5)). -/
theorem one_div_den_mul_add_lt_abs_sub_convergent {ξ : ℝ} (hξ : Irrational ξ) (k : ℕ) :
    1 / (((ξ.convergent k).den : ℝ) * ((ξ.convergent k).den + (ξ.convergent (k + 1)).den)) <
      |ξ - ξ.convergent k| := by sorry

/-- DT.0/irrationality-exponent-continued-fraction (Sondow, Theorem 1). -/
theorem irrationalityExponent_eq_one_add_limsup {ξ : ℝ} (hξ : Irrational ξ) :
    irrationalityExponent ξ = 1 + limsup (fun k : ℕ => ENNReal.ofReal
      (Real.log (ξ.convergent (k + 1)).den / Real.log (ξ.convergent k).den)) atTop := by sorry

/-- An irrational number `ξ` is badly approximable if `q‖qξ‖ ≥ c > 0` for all `q ≥ 1`
(Evertse ch. 2, p. 23). -/
def BadlyApproximable (ξ : ℝ) : Prop :=
  Irrational ξ ∧ ∃ c : ℝ, 0 < c ∧ ∀ q : ℕ, 0 < q → c ≤ q * |q * ξ - round (q * ξ)|

theorem badlyApproximable_of_natDegree_minpoly_eq_two {ξ : ℝ} (hξ : Irrational ξ)
    (halg : IsAlgebraic ℚ ξ) (hdeg : (minpoly ℚ ξ).natDegree = 2) : BadlyApproximable ξ := by
  sorry

namespace BadlyApproximable

/-- `BadlyApproximable.irrationalityExponent_eq`: badly approximable ⇒ `μ(ξ) = 2`. -/
theorem irrationalityExponent_eq {ξ : ℝ} (h : BadlyApproximable ξ) :
    irrationalityExponent ξ = 2 := by sorry

/-- `BadlyApproximable.not_liouville`: badly approximable numbers are not Liouville numbers. -/
theorem not_liouville {ξ : ℝ} (h : BadlyApproximable ξ) : ¬ Liouville ξ := by
  sorry

/-- `BadlyApproximable.add_ratCast`: stable under `ξ ↦ ξ + r`, `r ∈ ℚ`. -/
theorem add_ratCast {ξ : ℝ} (h : BadlyApproximable ξ) (r : ℚ) :
    BadlyApproximable (ξ + r) := by sorry

/-- `BadlyApproximable.ratCast_mul`: stable under `ξ ↦ rξ`, `r ∈ ℚ^×`. -/
theorem ratCast_mul {ξ : ℝ} (h : BadlyApproximable ξ) {r : ℚ} (hr : r ≠ 0) :
    BadlyApproximable (r * ξ) := by sorry

end BadlyApproximable

/-- Test `test_badlyApproximable_sqrtTwo` (computation). -/
example : BadlyApproximable (Real.sqrt 2) := by sorry
/-- Test `test_not_badlyApproximable_rat` (degenerate). -/
example (q : ℚ) : ¬ BadlyApproximable q := by sorry
/-- Test `test_not_badlyApproximable_liouvilleNumber` (non-example). -/
example : ¬ BadlyApproximable (liouvilleNumber 10) := by sorry
/-- Test `test_badlyApproximable_goldenRatio` (computation). -/
example : BadlyApproximable Real.goldenRatio := by sorry

/-- Littlewood's conjecture (Evertse ch. 2, p. 23), as a statement. -/
def LittlewoodConjecture : Prop :=
  ∀ α β : ℝ, ∀ ε > 0, ∃ y : ℕ, 0 < y ∧
    (y : ℝ) * |y * α - round (y * α)| * |y * β - round (y * β)| < ε

theorem littlewood_of_not_badlyApproximable {α : ℝ} (hα : ¬ BadlyApproximable α) (β : ℝ)
    {ε : ℝ} (hε : 0 < ε) :
    ∃ y : ℕ, 0 < y ∧ (y : ℝ) * |y * α - round (y * α)| * |y * β - round (y * β)| < ε := by sorry

theorem infinite_setOf_mul_le_one (α β : ℝ) :
    {y : ℕ | 0 < y ∧ (y : ℝ) * |y * α - round (y * α)| * |y * β - round (y * β)| ≤ 1}.Infinite := by
  sorry

/-- Test `test_littlewood_rat` (degenerate). -/
example (q : ℚ) (β : ℝ) {ε : ℝ} (hε : 0 < ε) :
    ∃ y : ℕ, 0 < y ∧ (y : ℝ) * |y * (q : ℝ) - round (y * (q : ℝ))| * |y * β - round (y * β)| < ε := by
  sorry
/-- Test `test_littlewood_liouvilleNumber` (computation). -/
example (β : ℝ) {ε : ℝ} (hε : 0 < ε) :
    ∃ y : ℕ, 0 < y ∧ (y : ℝ) * |y * liouvilleNumber 10 - round (y * liouvilleNumber 10)| *
      |y * β - round (y * β)| < ε := by sorry
/-- Test `test_littlewood_oneDimensional_false` (non-example). -/
example : ¬ ∀ α : ℝ, ∀ ε > 0, ∃ y : ℕ, 0 < y ∧ (y : ℝ) * |y * α - round (y * α)| < ε := by sorry

end Exponents

end DiophantineApproximation

/-! ################################################################
  Stage DT.1
################################################################ -/

/-
Suggested Lean forms for the roadmap `DiophantineApproximationAndTranscendence`,
stage DT.1 (Liouville and Roth).

This file is not the roadmap and is not exhaustive: the roadmap document is definitive. The
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`; nothing here is an implementation.

Conventions pinned here (see the roadmap document):
* heights are Mathlib's `Height.mulHeight₁` / `Height.logHeight₁` / `Finsupp.logHeight`, relative
  to the field in which they are computed (over `ℚ` they are the classical heights
  `max (|num|, den)`); statements over a number field `K` carry the factor `finrank ℚ K`;
* derivatives of polynomials are *divided* (Hasse) derivatives;
* the index of a polynomial is `ℝ≥0∞`-valued, with value `⊤` at the zero polynomial;
* the Mahler measure of an algebraic number (owned by stage DT.0) is written here as
  `Polynomial.mahlerMeasure` of its primitive minimal polynomial over `ℤ`, mapped to `ℂ`.
Tau Ceti is not imported.
-/

open scoped ENNReal

/-! ## The `ℓ¹`-norm of a one-variable polynomial (Evertse, Ch. 6, (6.13)–(6.16)) -/

namespace Polynomial

section l1Norm

variable {A : Type*} [SeminormedRing A]

/-- The `ℓ¹`-norm `‖p‖ = ∑ᵢ ‖pᵢ‖` of a polynomial (Mahler's *length*). -/
noncomputable def l1Norm (p : A[X]) : ℝ := p.sum fun _ a => ‖a‖

@[simp] theorem l1Norm_zero : l1Norm (0 : A[X]) = 0 := sorry

theorem l1Norm_nonneg (p : A[X]) : 0 ≤ l1Norm p := sorry

theorem l1Norm_eq_sum_range (p : A[X]) :
    l1Norm p = ∑ i ∈ Finset.range (p.natDegree + 1), ‖p.coeff i‖ := sorry

@[simp] theorem l1Norm_C (a : A) : l1Norm (C a) = ‖a‖ := sorry

@[simp] theorem l1Norm_monomial (n : ℕ) (a : A) : l1Norm (monomial n a) = ‖a‖ := sorry

@[simp] theorem l1Norm_neg (p : A[X]) : l1Norm (-p) = l1Norm p := sorry

theorem norm_coeff_le_l1Norm (p : A[X]) (i : ℕ) : ‖p.coeff i‖ ≤ l1Norm p := sorry

theorem supNorm_le_l1Norm (p : A[X]) : p.supNorm ≤ l1Norm p := sorry

theorem l1Norm_le_mul_supNorm (p : A[X]) : l1Norm p ≤ (p.natDegree + 1) * p.supNorm := sorry

theorem l1Norm_eq_zero_iff {B : Type*} [NormedRing B] (p : B[X]) : l1Norm p = 0 ↔ p = 0 := sorry

theorem mahlerMeasure_le_l1Norm (p : ℂ[X]) : p.mahlerMeasure ≤ l1Norm p := sorry

/-- (6.14), additivity. -/
theorem l1Norm_add_le (p q : A[X]) : l1Norm (p + q) ≤ l1Norm p + l1Norm q := sorry

/-- (6.14), submultiplicativity. -/
theorem l1Norm_mul_le (p q : A[X]) : l1Norm (p * q) ≤ l1Norm p * l1Norm q := sorry

end l1Norm

section l1NormField

variable {𝕜 : Type*} [NormedField 𝕜]

/-- (6.13) -/
theorem norm_eval_le_l1Norm_mul (p : 𝕜[X]) (z : 𝕜) :
    ‖p.eval z‖ ≤ l1Norm p * max 1 ‖z‖ ^ p.natDegree := sorry

/-- (6.15): the Taylor shift `P(X + a)`. -/
theorem l1Norm_taylor_le (p : 𝕜[X]) (a : 𝕜) :
    l1Norm (taylor a p) ≤ l1Norm p * (1 + ‖a‖) ^ p.natDegree := sorry

/-- (6.16): divided derivatives. -/
theorem l1Norm_hasseDeriv_le (p : 𝕜[X]) (k : ℕ) :
    l1Norm (hasseDeriv k p) ≤ 2 ^ p.natDegree * l1Norm p := sorry

end l1NormField

/-! Unit tests for `l1Norm`. -/
/-- Unit test `Polynomial.l1Norm.test_X_sub_one_sq`: ‖(X − 1)^2‖ = 4 in ℤ[X]. -/
example : l1Norm ((X - 1) ^ 2 : ℤ[X]) = 4 := sorry
/-- Unit test `Polynomial.l1Norm.test_one`: ‖1‖ = 1 in ℤ[X]. -/
example : l1Norm (1 : ℤ[X]) = 1 := sorry
/-- Unit test `Polynomial.l1Norm.test_supNorm_X_sub_two`: For X − 2 ∈ ℂ[X]: supNorm = 2 and ‖X − 2‖
= 3, so the ℓ¹-norm is not Mathlib's sup norm. -/
example : (X - C (2 : ℂ)).supNorm = 2 ∧ l1Norm (X - C (2 : ℂ)) = 3 := sorry
/-- Unit test `Polynomial.l1Norm.test_not_multiplicative`: ‖(X + 1)(X − 1)‖ = 2 < 4 = ‖X + 1‖ ‖X −
1‖: the norm is only submultiplicative. -/
example : l1Norm ((X + 1) * (X - 1) : ℤ[X]) < l1Norm (X + 1 : ℤ[X]) * l1Norm (X - 1 : ℤ[X]) :=
  sorry

/-! ## Wronskians of one-variable polynomials (Pottmeyer, §3.3) -/

section hasseWronskian

variable {R : Type*} [CommRing R]

/-- The Wronskian of a family of one-variable polynomials, built from divided derivatives:
`det (hasseDeriv k (g l))`. -/
noncomputable def hasseWronskian {m : ℕ} (g : Fin m → R[X]) : R[X] :=
  Matrix.det (Matrix.of fun (k l : Fin m) => hasseDeriv (k : ℕ) (g l))

theorem hasseWronskian_fin_two (a b : R[X]) : hasseWronskian ![a, b] = wronskian a b := sorry

@[simp] theorem hasseWronskian_fin_zero (g : Fin 0 → R[X]) : hasseWronskian g = 1 := sorry

@[simp] theorem hasseWronskian_fin_one (g : Fin 1 → R[X]) : hasseWronskian g = g 0 := sorry

theorem prod_factorial_mul_hasseWronskian {m : ℕ} (g : Fin m → R[X]) :
    C (∏ k : Fin m, ((k : ℕ).factorial : R)) * hasseWronskian g =
      (Matrix.of fun (k l : Fin m) => derivative^[k] (g l)).det := sorry

theorem hasseWronskian_eq_zero_of_not_linearIndependent {K : Type*} [Field K] {m : ℕ}
    (g : Fin m → K[X]) (h : ¬ LinearIndependent K g) : hasseWronskian g = 0 := sorry

theorem hasseWronskian_comp_perm {m : ℕ} (g : Fin m → R[X]) (π : Equiv.Perm (Fin m)) :
    hasseWronskian (g ∘ π) = (Equiv.Perm.sign π : ℤ) • hasseWronskian g := sorry

theorem hasseWronskian_map {S : Type*} [CommRing S] (f : R →+* S) {m : ℕ} (g : Fin m → R[X]) :
    (hasseWronskian g).map f = hasseWronskian fun l => (g l).map f := sorry

end hasseWronskian

/-! Unit tests for `hasseWronskian`. -/
/-- Unit test `Polynomial.hasseWronskian.test_one_X_X_sq`: W(1, X, X^2) = 1 over ℚ. -/
example : hasseWronskian ![1, X, X ^ 2] = (1 : ℚ[X]) := sorry
/-- Unit test `Polynomial.hasseWronskian.test_dependent`: W(X, 2X) = 0. -/
example : hasseWronskian ![X, 2 * X] = (0 : ℚ[X]) := sorry
/-- Unit test `Polynomial.hasseWronskian.test_one_X`: W(1, X) = 1. -/
example : hasseWronskian ![1, X] = (1 : ℚ[X]) := sorry
/-- Unit test `Polynomial.hasseWronskian.test_classical_normalisation`: The classical Wronskian
det(derivative^[k] g_l) of (1, X, X^2) is 2, not 1: the normalisation matters. -/
example : (Matrix.of fun (k l : Fin 3) => derivative^[k] (![1, X, X ^ 2] l)).det = (2 : ℚ[X]) :=
  sorry

/-- The Wronskian criterion (Pottmeyer, Proposition 3.3.3), characteristic zero. -/
theorem linearIndependent_iff_hasseWronskian_ne_zero {K : Type*} [Field K] [CharZero K] {m : ℕ}
    (g : Fin m → K[X]) : LinearIndependent K g ↔ hasseWronskian g ≠ 0 := sorry

/-! ## Heights of one-variable polynomials and Gelfond's lemma -/

section logHeight

variable {K : Type*} [Field K] [Height.AdmissibleAbsValues K]

/-- The (projective, logarithmic) height of a polynomial: the height of its coefficient vector. -/
noncomputable def logHeight (p : K[X]) : ℝ := Finsupp.logHeight p.toFinsupp.coeff

theorem logHeight_nonneg (p : K[X]) : 0 ≤ p.logHeight := sorry

@[simp] theorem logHeight_zero : (0 : K[X]).logHeight = 0 := sorry

theorem logHeight_C_mul (c : K) (hc : c ≠ 0) (p : K[X]) : (C c * p).logHeight = p.logHeight :=
  sorry

theorem logHeight_X_sub_C (β : K) : (X - C β).logHeight = Height.logHeight₁ β := sorry

theorem logHeight_toMvPolynomial {σ : Type*} (i : σ) (p : K[X]) :
    Finsupp.logHeight (p.toMvPolynomial i).coeff = p.logHeight := sorry

end logHeight

/-! Unit tests for `Polynomial.logHeight` (over `ℚ`). -/
/-- Unit test `Polynomial.logHeight.test_X_sub_two`: h(X − 2) = log 2 over ℚ. -/
example : (X - C (2 : ℚ)).logHeight = Real.log 2 := sorry
/-- Unit test `Polynomial.logHeight.test_C_seven`: h(7) = 0. -/
example : (C (7 : ℚ)).logHeight = 0 := sorry
/-- Unit test `Polynomial.logHeight.test_X_sq_sub_quarter`: h(X^2 − 1/4) = log 4 (the primitive
multiple is 4X^2 − 1). -/
example : (X ^ 2 - C (1 / 4 : ℚ)).logHeight = Real.log 4 := sorry
/-- Unit test `Polynomial.logHeight.test_X_sub_half`: h(X − 1/2) = log 2, although every coefficient
has absolute value ≤ 1: the height sees denominators. -/
example : (X - C (1 / 2 : ℚ)).logHeight = Real.log 2 := sorry

/-- Pottmeyer, Lemma 3.2.8. -/
theorem choose_half_mul_choose_half_le (a b : ℕ) :
    a.choose (a / 2) * b.choose (b / 2) ≤ (a + b).choose ((a + b) / 2) := sorry

/-- Pottmeyer, Lemma 3.2.9. -/
theorem choose_half_mul_sqrt_le_two_pow (d : ℕ) :
    (d.choose (d / 2) : ℝ) * Real.sqrt (d + 1) ≤ 2 ^ d := sorry

/-- Pottmeyer, Lemma 3.2.10 for one variable. -/
theorem supNorm_mul_supNorm_le (f g : ℂ[X]) :
    f.supNorm * g.supNorm ≤ 2 ^ (f * g).natDegree * (f * g).supNorm := sorry

/-- Gelfond's lemma in one variable (Pottmeyer, Proposition 3.2.12), relative heights over a
number field `K`. -/
theorem logHeight_add_logHeight_le {K : Type*} [Field K] [NumberField K] (f g : K[X])
    (hf : f ≠ 0) (hg : g ≠ 0) :
    f.logHeight + g.logHeight ≤
      (f * g).logHeight + Module.finrank ℚ K * (f * g).natDegree * Real.log 2 := sorry

/-- Roth's lemma in one variable (Pottmeyer, Lemma 3.4.3). -/
theorem rootMultiplicity_mul_logHeight₁_le {K : Type*} [Field K] [NumberField K] (P : K[X])
    (hP : P ≠ 0) (r : ℕ) (hr : P.natDegree ≤ r) (β : K) :
    (P.rootMultiplicity β : ℝ) * Height.logHeight₁ β ≤
      P.logHeight + Module.finrank ℚ K * r * Real.log 2 := sorry

end Polynomial

/-! ## Divided partial derivatives, the index, heights and generalized Wronskians -/

namespace MvPolynomial

section hasseDeriv

variable {R σ : Type*} [CommSemiring R]

/-- The divided (Hasse) partial derivative `∂^d`, sending `X^m` to
`(∏ⱼ (mⱼ choose dⱼ)) X^(m - d)` (Pottmeyer, (2.34)). -/
noncomputable def hasseDeriv (d : σ →₀ ℕ) : MvPolynomial σ R →ₗ[R] MvPolynomial σ R where
  toFun P := ∑ m ∈ P.support, monomial (m - d) (P.coeff m * d.prod fun j dj => ((m j).choose dj : R))
  map_add' := sorry
  map_smul' := sorry

theorem hasseDeriv_monomial (d m : σ →₀ ℕ) (a : R) :
    hasseDeriv d (monomial m a) =
      monomial (m - d) ((d.prod fun j dj => ((m j).choose dj : R)) * a) := sorry

theorem coeff_hasseDeriv (d m : σ →₀ ℕ) (P : MvPolynomial σ R) :
    (hasseDeriv d P).coeff m = (d.prod fun j dj => ((m j + dj).choose dj : R)) * P.coeff (m + d) :=
  sorry

@[simp] theorem hasseDeriv_zero :
    hasseDeriv (0 : σ →₀ ℕ) = (LinearMap.id : MvPolynomial σ R →ₗ[R] MvPolynomial σ R) := sorry

theorem factorial_smul_hasseDeriv_single (i : σ) (k : ℕ) (P : MvPolynomial σ R) :
    k.factorial • hasseDeriv (Finsupp.single i k) P = (pderiv i)^[k] P := sorry

theorem hasseDeriv_hasseDeriv (a b : σ →₀ ℕ) (P : MvPolynomial σ R) :
    hasseDeriv a (hasseDeriv b P) =
      ((a + b).prod fun j n => (n.choose (a j) : R)) • hasseDeriv (a + b) P := sorry

theorem hasseDeriv_mul [DecidableEq σ] (d : σ →₀ ℕ) (P Q : MvPolynomial σ R) :
    hasseDeriv d (P * Q) = ∑ x ∈ Finset.HasAntidiagonal.antidiagonal d, hasseDeriv x.1 P * hasseDeriv x.2 Q := sorry

theorem hasseDeriv_eq_zero_of_degreeOf_lt {d : σ →₀ ℕ} {P : MvPolynomial σ R} (i : σ)
    (h : P.degreeOf i < d i) : hasseDeriv d P = 0 := sorry

theorem degreeOf_hasseDeriv_le (d : σ →₀ ℕ) (P : MvPolynomial σ R) (i : σ) :
    (hasseDeriv d P).degreeOf i ≤ P.degreeOf i - d i := sorry

theorem map_hasseDeriv {S : Type*} [CommSemiring S] (f : R →+* S) (d : σ →₀ ℕ)
    (P : MvPolynomial σ R) : map f (hasseDeriv d P) = hasseDeriv d (map f P) := sorry

theorem hasseDeriv_single_toMvPolynomial (i : σ) (k : ℕ) (p : Polynomial R) :
    hasseDeriv (Finsupp.single i k) (p.toMvPolynomial i) =
      (Polynomial.hasseDeriv k p).toMvPolynomial i := sorry

/-- Taylor expansion with divided derivatives (Pottmeyer, (3.35)). -/
theorem eval_add_eq_finsum_hasseDeriv (P : MvPolynomial σ R) (a y : σ → R) :
    eval (a + y) P = ∑ᶠ d : σ →₀ ℕ, eval a (hasseDeriv d P) * d.prod fun j k => y j ^ k := sorry

/-- Coefficients of divided derivatives under an arbitrary absolute value. -/
theorem abv_coeff_hasseDeriv_le {K : Type*} [CommRing K] (v : AbsoluteValue K ℝ)
    (d m : σ →₀ ℕ) (P : MvPolynomial σ K) :
    v ((hasseDeriv d P).coeff m) ≤ 2 ^ (m + d).degree * v (P.coeff (m + d)) := sorry

/-- Coefficients of divided derivatives under a nonarchimedean absolute value. -/
theorem abv_coeff_hasseDeriv_le_of_isNonarchimedean {K : Type*} [CommRing K]
    (v : AbsoluteValue K ℝ) (hv : IsNonarchimedean v) (d m : σ →₀ ℕ) (P : MvPolynomial σ K) :
    v ((hasseDeriv d P).coeff m) ≤ v (P.coeff (m + d)) := sorry

end hasseDeriv

/-! Unit tests for `MvPolynomial.hasseDeriv`. -/
/-- Unit test `MvPolynomial.hasseDeriv.test_X0_cube_X1`: ∂^{(2,0)}(x_0^3 x_1) = 3 x_0 x_1 over ℤ. -/
example : hasseDeriv (Finsupp.single 0 2) (X 0 ^ 3 * X 1 : MvPolynomial (Fin 2) ℤ) =
    3 * (X 0 * X 1) := sorry
/-- Unit test `MvPolynomial.hasseDeriv.test_one`: ∂^d 1 = 0 for d ≠ 0. -/
example (d : Fin 2 →₀ ℕ) (hd : d ≠ 0) : hasseDeriv d (1 : MvPolynomial (Fin 2) ℤ) = 0 := sorry
/-- Unit test `MvPolynomial.hasseDeriv.test_divided_not_ordinary`: ∂^{(2)}(x_0^2) = 1 while
(∂/∂x_0)^2 x_0^2 = 2: the divided derivative is not the ordinary one. -/
example : hasseDeriv (Finsupp.single 0 2) (X 0 ^ 2 : MvPolynomial (Fin 1) ℚ) = 1 ∧
    (pderiv 0)^[2] (X 0 ^ 2 : MvPolynomial (Fin 1) ℚ) = 2 := sorry
/-- Unit test `MvPolynomial.hasseDeriv.test_one_variable`: ∂^{e_1}((X^2)(x_1)) = (2X)(x_1):
agreement with Mathlib's univariate Hasse derivative. -/
example : hasseDeriv (Finsupp.single 1 1)
      ((Polynomial.X ^ 2 : Polynomial ℚ).toMvPolynomial 1 : MvPolynomial (Fin 2) ℚ) =
    (2 * Polynomial.X : Polynomial ℚ).toMvPolynomial 1 := sorry

section weightedIndex

variable {R σ : Type*} [CommRing R]

/-- The index of `P` at the point `a` with respect to the weights `r` (Pottmeyer, Definition
2.6.2): the least value of `∑ⱼ iⱼ / rⱼ` over the `i` with `(∂^i P)(a) ≠ 0`; it is `⊤` at `P = 0`. -/
noncomputable def weightedIndex (r : σ → ℕ) (a : σ → R) (P : MvPolynomial σ R) : ℝ≥0∞ :=
  ⨅ (i : σ →₀ ℕ) (_ : eval a (hasseDeriv i P) ≠ 0), ∑ j ∈ i.support, ((i j : ℝ≥0∞) / (r j : ℝ≥0∞))

@[simp] theorem weightedIndex_zero (r : σ → ℕ) (a : σ → R) :
    weightedIndex r a (0 : MvPolynomial σ R) = ⊤ := sorry

theorem le_weightedIndex_iff (r : σ → ℕ) (a : σ → R) (P : MvPolynomial σ R) (t : ℝ≥0∞) :
    t ≤ weightedIndex r a P ↔
      ∀ i : σ →₀ ℕ, (∑ j ∈ i.support, ((i j : ℝ≥0∞) / (r j : ℝ≥0∞))) < t →
        eval a (hasseDeriv i P) = 0 := sorry

theorem weightedIndex_eq_zero_iff (r : σ → ℕ) (hr : ∀ j, r j ≠ 0) (a : σ → R)
    (P : MvPolynomial σ R) : weightedIndex r a P = 0 ↔ eval a P ≠ 0 := sorry

theorem weightedIndex_ne_top (r : σ → ℕ) (hr : ∀ j, r j ≠ 0) (a : σ → R) {P : MvPolynomial σ R}
    (hP : P ≠ 0) : weightedIndex r a P ≠ ⊤ := sorry

theorem weightedIndex_le_sum_degreeOf [Fintype σ] (r : σ → ℕ) (a : σ → R)
    {P : MvPolynomial σ R} (hP : P ≠ 0) :
    weightedIndex r a P ≤ ∑ j, (P.degreeOf j : ℝ≥0∞) / (r j : ℝ≥0∞) := sorry

theorem weightedIndex_map {S : Type*} [CommRing S] (f : R →+* S) (hf : Function.Injective f)
    (r : σ → ℕ) (a : σ → R) (P : MvPolynomial σ R) :
    weightedIndex r (f ∘ a) (map f P) = weightedIndex r a P := sorry

/-- Additivity of the index (Pottmeyer, Exercise 2.19). -/
theorem weightedIndex_mul [IsDomain R] (r : σ → ℕ) (hr : ∀ j, r j ≠ 0) (a : σ → R)
    (P Q : MvPolynomial σ R) :
    weightedIndex r a (P * Q) = weightedIndex r a P + weightedIndex r a Q := sorry

/-- The ultrametric inequality for the index (Pottmeyer, Exercise 3.6). -/
theorem min_weightedIndex_le_weightedIndex_add (r : σ → ℕ) (a : σ → R)
    (P Q : MvPolynomial σ R) :
    min (weightedIndex r a P) (weightedIndex r a Q) ≤ weightedIndex r a (P + Q) := sorry

/-- The index under a divided derivative (Pottmeyer, proof of (3.24) and (3.32)). -/
theorem weightedIndex_le_weightedIndex_hasseDeriv_add [IsDomain R] [CharZero R]
    (r : σ → ℕ) (a : σ → R) (d : σ →₀ ℕ) (P : MvPolynomial σ R) :
    weightedIndex r a P ≤
      weightedIndex r a (hasseDeriv d P) + ∑ j ∈ d.support, ((d j : ℝ≥0∞) / (r j : ℝ≥0∞)) := sorry

/-- The index does not see variables that do not occur. -/
theorem weightedIndex_rename {τ : Type*} (f : τ → σ) (hf : Function.Injective f) (r : σ → ℕ)
    (a : σ → R) (Q : MvPolynomial τ R) :
    weightedIndex r a (rename f Q) = weightedIndex (r ∘ f) (a ∘ f) Q := sorry

/-- Scaling the weights. -/
theorem weightedIndex_smul_weights (c : ℕ) (hc : c ≠ 0) (r : σ → ℕ) (a : σ → R)
    (P : MvPolynomial σ R) :
    weightedIndex (c • r) a P = weightedIndex r a P / (c : ℝ≥0∞) := sorry

/-- One variable: the index is the order of vanishing divided by the weight. -/
theorem weightedIndex_toMvPolynomial (r : σ → ℕ) (a : σ → R) (i : σ) {p : Polynomial R}
    (hp : p ≠ 0) :
    weightedIndex r a (p.toMvPolynomial i) = (p.rootMultiplicity (a i) : ℝ≥0∞) / (r i : ℝ≥0∞) :=
  sorry

end weightedIndex

/-! Unit tests for `MvPolynomial.weightedIndex`. -/
/-- Unit test `MvPolynomial.weightedIndex.test_X0_cube_sub_X1_sq`: Ind_{(0,0),(3,3)}(x_0^3 − x_1^2)
= 2/3 over ℚ. -/
example : weightedIndex ![3, 3] 0 (X 0 ^ 3 - X 1 ^ 2 : MvPolynomial (Fin 2) ℚ) = 2 / 3 := sorry
/-- Unit test `MvPolynomial.weightedIndex.test_one`: Ind_{a,r}(1) = 0 for all a, r. -/
example (r : Fin 2 → ℕ) (a : Fin 2 → ℚ) : weightedIndex r a (1 : MvPolynomial (Fin 2) ℚ) = 0 :=
  sorry
/-- Unit test `MvPolynomial.weightedIndex.test_X0_X1`: Ind_{(0,0),(1,2)}(x_0 x_1) = 3/2, not the
total order of vanishing 2: the index is weighted. -/
example : weightedIndex ![1, 2] 0 (X 0 * X 1 : MvPolynomial (Fin 2) ℚ) = 3 / 2 := sorry
/-- Unit test `MvPolynomial.weightedIndex.test_X_sub_C_pow`: In one variable, Ind_{β,r}((x_0 − β)^m)
= m/r (order of vanishing divided by the weight). -/
example (β : ℚ) (m r : ℕ) (hr : r ≠ 0) :
    weightedIndex ![r] ![β] ((X 0 - C β) ^ m : MvPolynomial (Fin 1) ℚ) =
      (m : ℝ≥0∞) / (r : ℝ≥0∞) := sorry

section logHeight

variable {σ K : Type*} [Field K] [Height.AdmissibleAbsValues K]

/-- The (projective, logarithmic) height of a polynomial in several variables: the height of its
coefficient vector (Pottmeyer, Definition 3.2.1, relative to `K`). -/
noncomputable def logHeight (P : MvPolynomial σ K) : ℝ := Finsupp.logHeight P.coeff

theorem logHeight_nonneg (P : MvPolynomial σ K) : 0 ≤ logHeight P := sorry

@[simp] theorem logHeight_zero : logHeight (0 : MvPolynomial σ K) = 0 := sorry

theorem logHeight_C_mul (c : K) (hc : c ≠ 0) (P : MvPolynomial σ K) :
    logHeight (C c * P) = logHeight P := sorry

@[simp] theorem logHeight_C (c : K) : logHeight (C c : MvPolynomial σ K) = 0 := sorry

theorem logHeight_rename {τ : Type*} (f : σ → τ) (hf : Function.Injective f)
    (P : MvPolynomial σ K) : logHeight (rename f P) = logHeight P := sorry

theorem logHeight_eq_of_numberField {L : Type*} [Field L] [NumberField L] {P : MvPolynomial σ L}
    (hP : P ≠ 0) :
    logHeight P =
      ∑ w : NumberField.InfinitePlace L, w.mult * Real.log (⨆ m : P.support, w (P.coeff m)) +
        ∑ᶠ v : NumberField.FinitePlace L, Real.log (⨆ m : P.support, v (P.coeff m)) := sorry

/-- Heights of products in disjoint sets of variables (Pottmeyer, Exercise 3.3). -/
theorem logHeight_mul_of_disjoint_vars [DecidableEq σ] {P Q : MvPolynomial σ K} (hP : P ≠ 0)
    (hQ : Q ≠ 0) (hPQ : Disjoint P.vars Q.vars) :
    logHeight (P * Q) = logHeight P + logHeight Q := sorry

end logHeight

/-- The height of an integer polynomial is at most the logarithm of its largest coefficient. -/
theorem logHeight_map_intCast_le {σ : Type*} {P : MvPolynomial σ ℤ} (hP : P ≠ 0) :
    logHeight (P.map (Int.castRingHom ℚ)) ≤ Real.log (⨆ m, (|P.coeff m| : ℝ)) := sorry

/-! Unit tests for `MvPolynomial.logHeight` (over `ℚ`). -/
/-- Unit test `MvPolynomial.logHeight.test_two_X_add_four`: h(2x_0 + 4) = log 2 over ℚ. -/
example : logHeight (2 * X 0 + 4 : MvPolynomial (Fin 1) ℚ) = Real.log 2 := sorry
/-- Unit test `MvPolynomial.logHeight.test_C_five`: h(5) = 0. -/
example : logHeight (C 5 : MvPolynomial (Fin 1) ℚ) = 0 := sorry
/-- Unit test `MvPolynomial.logHeight.test_X_sub_C`: h(x_0 − q) = Mathlib's logHeight₁ q for q ∈ ℚ.
-/
example (q : ℚ) : logHeight (X 0 - C q : MvPolynomial (Fin 1) ℚ) = Height.logHeight₁ q := sorry
/-- Unit test `MvPolynomial.logHeight.test_two_X_add_two`: h(2x_0 + 2) = 0, not log 2 = log of the
largest coefficient: the height is projective. -/
example : logHeight (2 * X 0 + 2 : MvPolynomial (Fin 1) ℚ) = 0 := sorry

/-- Pottmeyer, Remark 3.2.11: coefficients of a product, for an arbitrary absolute value. -/
theorem abv_coeff_prod_le {R ι σ : Type*} [CommRing R] [IsDomain R] [Fintype σ]
    (v : AbsoluteValue R ℝ)
    (s : Finset ι) (f : ι → MvPolynomial σ R) (m : σ →₀ ℕ) :
    v ((∏ k ∈ s, f k).coeff m) ≤
      2 ^ (∑ j, (∏ k ∈ s, f k).degreeOf j) * ∏ k ∈ s, ⨆ n, v ((f k).coeff n) := sorry

section genWronskian

variable {R σ : Type*} [CommRing R]

/-- A generalized Wronskian `W_D(f) = det (∂^{D k} (f l))` (Pottmeyer, Definition 3.3.5); the
admissibility condition `(D k).degree ≤ k` is a hypothesis of the theorems, not of the
definition. -/
noncomputable def genWronskian {m : ℕ} (D : Fin m → σ →₀ ℕ) (f : Fin m → MvPolynomial σ R) :
    MvPolynomial σ R :=
  Matrix.det (Matrix.of fun k l => hasseDeriv (D k) (f l))

theorem genWronskian_eq_zero_of_not_linearIndependent {K : Type*} [Field K] {m : ℕ}
    (D : Fin m → σ →₀ ℕ) (f : Fin m → MvPolynomial σ K) (h : ¬ LinearIndependent K f) :
    genWronskian D f = 0 := sorry

@[simp] theorem genWronskian_fin_zero (D : Fin 0 → σ →₀ ℕ) (f : Fin 0 → MvPolynomial σ R) :
    genWronskian D f = 1 := sorry

theorem genWronskian_fin_one (D : Fin 1 → σ →₀ ℕ) (hD : D 0 = 0) (f : Fin 1 → MvPolynomial σ R) :
    genWronskian D f = f 0 := sorry

theorem degreeOf_genWronskian_le {m : ℕ} (D : Fin m → σ →₀ ℕ) (f : Fin m → MvPolynomial σ R)
    (i : σ) (N : ℕ) (hN : ∀ l, (f l).degreeOf i ≤ N) : (genWronskian D f).degreeOf i ≤ m * N :=
  sorry

theorem map_genWronskian {S : Type*} [CommRing S] (φ : R →+* S) {m : ℕ} (D : Fin m → σ →₀ ℕ)
    (f : Fin m → MvPolynomial σ R) :
    map φ (genWronskian D f) = genWronskian D fun l => map φ (f l) := sorry

theorem genWronskian_single_toMvPolynomial (i : σ) {m : ℕ} (g : Fin m → Polynomial R) :
    genWronskian (fun k => Finsupp.single i (k : ℕ)) (fun l => (g l).toMvPolynomial i) =
      (Polynomial.hasseWronskian g).toMvPolynomial i := sorry

end genWronskian

/-! Unit tests for `MvPolynomial.genWronskian`. -/
/-- Unit test `MvPolynomial.genWronskian.test_X0_X1`: W_{(0, e_0)}(x_0, x_1) = −x_1. -/
example : genWronskian ![0, Finsupp.single 0 1] ![X 0, X 1] = -(X 1 : MvPolynomial (Fin 2) ℚ) :=
  sorry
/-- Unit test `MvPolynomial.genWronskian.test_empty`: For m = 0 the generalized Wronskian is 1. -/
example (D : Fin 0 → Fin 2 →₀ ℕ) (f : Fin 0 → MvPolynomial (Fin 2) ℚ) : genWronskian D f = 1 :=
  sorry
/-- Unit test `MvPolynomial.genWronskian.test_dependent`: W_D(x_0, x_0) = 0 for every D. -/
example (D : Fin 2 → Fin 2 →₀ ℕ) : genWronskian D ![X 0, X 0] = (0 : MvPolynomial (Fin 2) ℚ) :=
  sorry
/-- Unit test `MvPolynomial.genWronskian.test_one_X0`: W_{(0, e_0)}(1, x_0) = 1, the one-variable
Wronskian W(1, X). -/
example : genWronskian ![0, Finsupp.single 0 1] ![1, X 0] = (1 : MvPolynomial (Fin 1) ℚ) := sorry

/-- Kronecker substitution preserves linear (in)dependence (Pottmeyer, Exercise 3.5(a)). -/
theorem linearIndependent_aeval_kronecker_iff {K : Type*} [Field K] {n m B : ℕ}
    (f : Fin m → MvPolynomial (Fin n) K) (hB : ∀ l i, (f l).degreeOf i < B) :
    LinearIndependent K
        (fun l => aeval (fun i : Fin n => (Polynomial.X : Polynomial K) ^ (B ^ (i : ℕ))) (f l)) ↔
      LinearIndependent K f := sorry

/-- Derivatives of a Kronecker substitution (Pottmeyer, Exercise 3.5(b)). -/
theorem exists_iterate_derivative_aeval_kronecker {K : Type*} [Field K] (n B k : ℕ) :
    ∃ a : (Fin n →₀ ℕ) → Polynomial K, (∀ d, k < d.degree → a d = 0) ∧
      ∀ f : MvPolynomial (Fin n) K,
        Polynomial.derivative^[k]
            (aeval (fun i : Fin n => (Polynomial.X : Polynomial K) ^ (B ^ (i : ℕ))) f) =
          ∑ᶠ d, a d *
            aeval (fun i : Fin n => (Polynomial.X : Polynomial K) ^ (B ^ (i : ℕ)))
              (hasseDeriv d f) := sorry

/-- The generalized Wronskian criterion (Pottmeyer, Theorem 3.3.7). -/
theorem linearIndependent_iff_exists_genWronskian_ne_zero {K : Type*} [Field K] [CharZero K]
    {n m : ℕ} (f : Fin m → MvPolynomial (Fin n) K) :
    LinearIndependent K f ↔
      ∃ D : Fin m → Fin n →₀ ℕ, (∀ k, (D k).degree ≤ k) ∧ genWronskian D f ≠ 0 := sorry

/-- Separation of one variable (Pottmeyer, Lemma 3.3.8). -/
theorem exists_sum_mul_linearIndependent {K σ : Type*} [Field K] [DecidableEq σ]
    {P : MvPolynomial σ K} (hP : P ≠ 0) (i₀ : σ) :
    ∃ s : ℕ, s ≤ P.degreeOf i₀ ∧ ∃ f g : Fin (s + 1) → MvPolynomial σ K,
      (∀ k, i₀ ∉ (f k).vars) ∧ (∀ k, (g k).vars ⊆ {i₀}) ∧ LinearIndependent K f ∧
        LinearIndependent K g ∧ P = ∑ k, f k * g k := sorry

/-- The Wronskian factorisation for separated variables (Pottmeyer, Lemma 3.3.9). -/
theorem genWronskian_mul_genWronskian {R σ : Type*} [CommRing R] [DecidableEq σ] {m : ℕ}
    (i₀ : σ) (f g : Fin m → MvPolynomial σ R) (hf : ∀ k, i₀ ∉ (f k).vars)
    (hg : ∀ k, (g k).vars ⊆ {i₀}) (D : Fin m → σ →₀ ℕ) (hD : ∀ k, D k i₀ = 0) :
    genWronskian D f * genWronskian (fun k => Finsupp.single i₀ (k : ℕ)) g =
      (Matrix.of fun k l : Fin m =>
        hasseDeriv (D k + Finsupp.single i₀ (l : ℕ)) (∑ j, f j * g j)).det := sorry

/-- Height of a determinant of divided derivatives of one polynomial (Pottmeyer, §3.4.6,
(3.21) with the corrected archimedean factor). -/
theorem logHeight_det_hasseDeriv_le {K σ : Type*} [Field K] [NumberField K] [Fintype σ] {m : ℕ}
    (P : MvPolynomial σ K) (E : Fin m → Fin m → σ →₀ ℕ) :
    logHeight (Matrix.of fun k l => hasseDeriv (E k l) P).det ≤
      m * logHeight P +
        Module.finrank ℚ K *
          (2 * m * (∑ j, (P.degreeOf j : ℝ)) * Real.log 2 + Real.log (m.factorial)) := sorry

end MvPolynomial

/-! ## Liouville, Thue and Roth -/

namespace DiophantineApproximation

open Polynomial

/-- Pottmeyer, Lemma 3.4.8. -/
theorem sum_max_sub_div_ge (k : ℕ) (δ : ℝ) :
    (k + 1 : ℝ) * min (δ / 2) (δ ^ 2 / 2) ≤ ∑ i ∈ Finset.range (k + 1), max (δ - i / k) 0 := sorry

/-- **Roth's lemma** (Pottmeyer, Theorem 3.4.1), relative heights over a number field `K`. -/
theorem roth_lemma {K : Type*} [Field K] [NumberField K] {n : ℕ} (hn : 0 < n)
    (P : MvPolynomial (Fin n) K) (hP : P ≠ 0) (β : Fin n → K) (σ : ℝ) (hσ₀ : 0 < σ)
    (hσ : σ ≤ 1 / 2) (r : Fin n → ℕ) (hr : ∀ i, 0 < r i)
    (h₁ : ∀ i, P.degreeOf i ≤ r i)
    (h₂ : ∀ i j : Fin n, (j : ℕ) = i + 1 → (r j : ℝ) ≤ σ * r i)
    (h₃ : ∀ i, σ⁻¹ * (P.logHeight + 4 * n * r ⟨0, hn⟩ * Module.finrank ℚ K) ≤
      r i * Height.logHeight₁ (β i)) :
    MvPolynomial.weightedIndex r β P ≤ ENNReal.ofReal (2 * n * σ ^ ((1 : ℝ) / 2 ^ (n - 1))) :=
  sorry

/-! Siegel's lemma with algebraic-integer coefficients and rational-integer unknowns (Evertse, Theorem 3.20)
and its input Lemma 3.19 are DT.0's declarations `exists_ne_zero_int_vec_abs_le_of_house_le` and
`eq_zero_of_forall_abs_re_im_le`, consumed here. -/

/-- The bound (6.2): a homogenized integer polynomial at an integer point `(x, y)`, `y > 0`,
controls the distance from `x / y` to a root (for coprime `x, y` the maximum is `H(x / y)`). -/
theorem abs_eval_homogenize_le (f : ℤ[X]) (hf : 1 ≤ f.natDegree) (α : ℂ) (hα : aeval α f = 0)
    (x : ℤ) (y : ℕ) (hy : 0 < y) :
    |(MvPolynomial.eval ![x, (y : ℤ)] (f.homogenize f.natDegree) : ℝ)| ≤
      2 ^ (f.natDegree - 1) * (f.map (Int.castRingHom ℂ)).mahlerMeasure *
        max |(x : ℝ)| (y : ℝ) ^ f.natDegree * ‖α - (x : ℂ) / (y : ℂ)‖ := sorry

/-- **Liouville's inequality** with the explicit constant `2^(1-d) M(α)⁻¹` (Evertse,
Theorem 6.1); `f` is the primitive minimal polynomial of `α`, so `M(f) = M(α)`. -/
theorem liouville_explicit (f : ℤ[X]) (hprim : f.IsPrimitive) (hirr : Irreducible f)
    (hlead : 0 < f.leadingCoeff) (α : ℂ) (hα : aeval α f = 0) (ξ : ℚ) (hξ : (ξ : ℂ) ≠ α) :
    (2 : ℝ) ^ (1 - (f.natDegree : ℤ)) * ((f.map (Int.castRingHom ℂ)).mahlerMeasure)⁻¹ *
        Height.mulHeight₁ ξ ^ (-(f.natDegree : ℤ)) ≤ ‖(ξ : ℂ) - α‖ := sorry

/-- Evertse, Lemma 6.10: Thue's auxiliary polynomials. The constant can be taken to be
`C₁ = (12 b max(1, house α))^(d (1 + 1/ε))`, `b` a denominator of `α`. -/
theorem exists_thue_auxiliary_polynomials (α : ℂ) (hα : IsAlgebraic ℚ α) (ε : ℝ) (hε₀ : 0 < ε)
    (hε : ε < 1 / 2) :
    ∃ C₁ : ℝ, 0 < C₁ ∧ ∀ r : ℕ, 0 < r → ∃ P Q : ℤ[X], (P ≠ 0 ∨ Q ≠ 0) ∧
      (P.natDegree : ℝ) ≤ ⌊(1 / 2 + ε) * (minpoly ℚ α).natDegree * r⌋₊ ∧
      (Q.natDegree : ℝ) ≤ ⌊(1 / 2 + ε) * (minpoly ℚ α).natDegree * r⌋₊ ∧
      (X - C α) ^ r ∣ P.map (Int.castRingHom ℂ) - C α * Q.map (Int.castRingHom ℂ) ∧
      l1Norm P ≤ C₁ ^ r ∧ l1Norm Q ≤ C₁ ^ r := sorry

/-- Evertse, Lemma 6.11. -/
theorem minpoly_pow_dvd_of_X_sub_C_pow_dvd {F : ℚ[X]} {β : ℂ} (hβ : IsIntegral ℚ β) {m : ℕ}
    (h : (X - C β) ^ m ∣ F.map (algebraMap ℚ ℂ)) : minpoly ℚ β ^ m ∣ F := sorry

/-- Evertse, Lemma 6.12 (non-vanishing of a divided derivative of bounded order). -/
theorem exists_hasseDeriv_eval_ne (α : ℂ) (hα : IsAlgebraic ℚ α)
    (hd : 2 ≤ (minpoly ℚ α).natDegree) (ε : ℝ) (hε₀ : 0 < ε) (hε : ε < 1 / 2) (r : ℕ) (hr : 0 < r)
    (P Q : ℤ[X]) (hPQ : P ≠ 0 ∨ Q ≠ 0)
    (hP : (P.natDegree : ℝ) ≤ (1 / 2 + ε) * (minpoly ℚ α).natDegree * r)
    (hQ : (Q.natDegree : ℝ) ≤ (1 / 2 + ε) * (minpoly ℚ α).natDegree * r)
    (hdvd : (X - C α) ^ r ∣ P.map (Int.castRingHom ℂ) - C α * Q.map (Int.castRingHom ℂ))
    (ξ₁ ξ₂ : ℚ) :
    ∃ k : ℕ, (k : ℝ) ≤ (minpoly ℚ α).natDegree * (2 * ε * r + 1) ∧
      (hasseDeriv k (P.map (Int.castRingHom ℚ))).eval ξ₁ ≠
        ξ₂ * (hasseDeriv k (Q.map (Int.castRingHom ℚ))).eval ξ₁ := sorry

/-- Evertse, Lemma 6.13, with `C₂ = 2^((1/2+ε)d) (1+|α|)^(1+(1/2+ε)d) C₁`. -/
theorem thue_remainder_bounds (α : ℂ) (d : ℕ) (ε C₁ : ℝ) (hC₁ : 0 ≤ C₁) (r k : ℕ) (hk : k ≤ r)
    (P Q : ℤ[X]) (hP : (P.natDegree : ℝ) ≤ (1 / 2 + ε) * d * r)
    (hQ : (Q.natDegree : ℝ) ≤ (1 / 2 + ε) * d * r) (hP₁ : l1Norm P ≤ C₁ ^ r)
    (hQ₁ : l1Norm Q ≤ C₁ ^ r) (V : ℂ[X])
    (hV : hasseDeriv k (P.map (Int.castRingHom ℂ)) - C α * hasseDeriv k (Q.map (Int.castRingHom ℂ)) =
      V * (X - C α) ^ (r - k))
    (z : ℂ) (hz : ‖z - α‖ ≤ 1) :
    ‖V.eval z‖ ≤ (2 ^ ((1 / 2 + ε) * d) * (1 + ‖α‖) ^ (1 + (1 / 2 + ε) * d) * C₁) ^ r ∧
      ‖(hasseDeriv k (Q.map (Int.castRingHom ℂ))).eval z‖ ≤
        (2 ^ ((1 / 2 + ε) * d) * (1 + ‖α‖) ^ (1 + (1 / 2 + ε) * d) * C₁) ^ r := sorry

/-- Evertse, Theorem 6.14: an effective gap principle for the solutions of `|ξ - α| ≤ H(ξ)^(-κ)`,
for `κ > d/2 + 1`. -/
theorem thue_gap_principle (α : ℂ) (hα : IsAlgebraic ℚ α) (hd : 2 ≤ (minpoly ℚ α).natDegree)
    (κ : ℝ) (hκ : (minpoly ℚ α).natDegree / 2 + 1 < κ) :
    ∃ C lam : ℝ, 1 ≤ C ∧ 1 ≤ lam ∧ ∀ ξ₁ ξ : ℚ,
      ‖(ξ₁ : ℂ) - α‖ ≤ Height.mulHeight₁ ξ₁ ^ (-κ) → C ≤ Height.mulHeight₁ ξ₁ →
      ‖(ξ : ℂ) - α‖ ≤ Height.mulHeight₁ ξ ^ (-κ) → ξ ≠ ξ₁ →
      Height.mulHeight₁ ξ ≤ Height.mulHeight₁ ξ₁ ^ lam := sorry

/-- **Thue's approximation theorem** (Evertse, Theorem 6.9). -/
theorem thue_approximation (α : ℝ) (hα : IsAlgebraic ℚ α) (hd : 3 ≤ (minpoly ℚ α).natDegree)
    (κ : ℝ) (hκ : (minpoly ℚ α).natDegree / 2 + 1 < κ) :
    {ξ : ℚ | |(ξ : ℝ) - α| ≤ Height.mulHeight₁ ξ ^ (-κ)}.Finite := sorry

/-- Pottmeyer, Lemma 2.6.4: few lattice points of small weighted size. -/
theorem card_filter_sum_div_le {n : ℕ} (r : Fin n → ℕ) (hr : ∀ i, 0 < r i) (ε : ℝ) (hε₀ : 0 < ε)
    (hε : ε < 1) :
    (((Fintype.piFinset fun i => Finset.range (r i + 1)).filter
        fun d => ∑ i, (d i : ℝ) / r i ≤ n / 2 * (1 - ε)).card : ℝ) ≤
      (∏ i, ((r i : ℝ) + 1)) * Real.exp (-(ε ^ 2 * n / 4)) := sorry

/-- Roth's auxiliary polynomial (Pottmeyer, Theorem 2.6.5, with Siegel's lemma in Evertse's form):
`C` depends only on `α` (one may take `C = 12 b max(1, house α)`, `b` a denominator of `α`). -/
theorem exists_roth_auxiliary_polynomial (α : ℝ) (hα : IsAlgebraic ℚ α) (ε : ℝ) (hε₀ : 0 < ε)
    (hε : ε < 1) (n : ℕ) (hn : 2 * ((minpoly ℚ α).natDegree : ℝ) ≤ Real.exp (ε ^ 2 * n / 4)) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ r : Fin n → ℕ, (∀ i, 0 < r i) →
      ∃ P : MvPolynomial (Fin n) ℤ, P ≠ 0 ∧ (∀ i, P.degreeOf i ≤ r i) ∧
        ENNReal.ofReal (n / 2 * (1 - ε)) ≤
          MvPolynomial.weightedIndex r (fun _ => α) (P.map (Int.castRingHom ℝ)) ∧
        ∀ m, (|P.coeff m| : ℝ) ≤ C ^ (∑ i, r i) := sorry

/-- Pottmeyer, §3.5.6 over `ℚ`: an infinite set of rationals contains rapidly increasing
chains of heights (Northcott). -/
theorem exists_rapidly_increasing_heights {S : Set ℚ} (hS : S.Infinite) (n : ℕ) (L M : ℝ) :
    ∃ β : Fin n → ℚ, (∀ i, β i ∈ S) ∧ (∀ i, L ≤ Height.logHeight₁ (β i)) ∧
      ∀ i j : Fin n, (j : ℕ) = i + 1 → M * Height.logHeight₁ (β i) ≤ Height.logHeight₁ (β j) :=
  sorry

/-- Pottmeyer, §3.5.2: the weights `rᵢ = ⌊D / h(βᵢ)⌋` satisfy the hypotheses of Roth's lemma. -/
theorem roth_weights_spec {n : ℕ} (hn : 0 < n) (ε : ℝ) (hε₀ : 0 < ε) (hε : ε < 1 / 12)
    (C₁ L M D : ℝ) (hC₁ : 0 ≤ C₁) (hM : 2 * ((5 / 4 * ε) ^ (2 ^ (n - 1)))⁻¹ ≤ M)
    (hL : ((5 / 4 * ε) ^ (2 ^ (n - 1)))⁻¹ * (5 / 2 * C₁ + 5 * n) ≤ L) (hL₀ : 0 < L)
    (β : Fin n → ℚ) (h₁ : ∀ i, L ≤ Height.logHeight₁ (β i))
    (h₂ : ∀ i j : Fin n, (j : ℕ) = i + 1 → M * Height.logHeight₁ (β i) ≤ Height.logHeight₁ (β j))
    (hD : ∀ i, 5 * Height.logHeight₁ (β i) ≤ D) :
    let r : Fin n → ℕ := fun i => ⌊D / Height.logHeight₁ (β i)⌋₊
    let σ : ℝ := (5 / 4 * ε) ^ (2 ^ (n - 1))
    (∀ i, 0 < r i) ∧ (∑ i, (r i : ℝ)) ≤ 2 * D / L ∧
      (∀ i j : Fin n, (j : ℕ) = i + 1 → (r j : ℝ) ≤ σ * r i) ∧
      ∀ H : ℝ, H ≤ C₁ * ∑ i, (r i : ℝ) →
        ∀ i, σ⁻¹ * (H + 4 * n * r ⟨0, hn⟩) ≤ r i * Height.logHeight₁ (β i) := sorry

/-- Pottmeyer, Lemma 3.5.7 (a derivative of the auxiliary polynomial that does not vanish at the
approximations). -/
theorem exists_hasseDeriv_eval_ne_zero {n : ℕ} (α : ℝ) (β : Fin n → ℚ) (ε C₁ D L : ℝ)
    (hC₁ : Real.log 2 ≤ C₁) (P : MvPolynomial (Fin n) ℤ) (r : Fin n → ℕ) (hr : ∀ i, 0 < r i)
    (hdeg : ∀ i, P.degreeOf i ≤ r i) (hsum : (∑ i, (r i : ℝ)) ≤ 2 * D / L)
    (hcoeff : ∀ m, Real.log (|P.coeff m| : ℝ) ≤ C₁ * ∑ i, (r i : ℝ))
    (hα : ENNReal.ofReal (n / 2 * (1 - ε)) ≤
      MvPolynomial.weightedIndex r (fun _ => α) (P.map (Int.castRingHom ℝ)))
    (hβ : MvPolynomial.weightedIndex r β (P.map (Int.castRingHom ℚ)) ≤
      ENNReal.ofReal (5 / 2 * n * ε)) :
    ∃ Q : MvPolynomial (Fin n) ℤ, (∀ i, Q.degreeOf i ≤ r i) ∧
      ENNReal.ofReal ((1 / 2 - 3 * ε) * n) ≤
        MvPolynomial.weightedIndex r (fun _ => α) (Q.map (Int.castRingHom ℝ)) ∧
      MvPolynomial.eval β (Q.map (Int.castRingHom ℚ)) ≠ 0 ∧
      ∀ m, Real.log (|Q.coeff m| : ℝ) ≤ 4 * C₁ * D / L := sorry

/-- Pottmeyer, (3.35)–(3.39) and Exercise 3.10 at the archimedean place of `ℚ`: the Taylor
expansion at `α` bounds a polynomial of large index at good approximations. -/
theorem log_abs_eval_le {n : ℕ} (α : ℝ) (Q : MvPolynomial (Fin n) ℤ) (r : Fin n → ℕ)
    (hr : ∀ i, 0 < r i) (hdeg : ∀ i, Q.degreeOf i ≤ r i) (t : ℝ) (ht : 0 ≤ t)
    (hind : ENNReal.ofReal t ≤
      MvPolynomial.weightedIndex r (fun _ => α) (Q.map (Int.castRingHom ℝ)))
    (β : Fin n → ℚ) (κ D' : ℝ) (hκ : 0 ≤ κ) (hD' : 0 ≤ D')
    (hβ : ∀ i, |(β i : ℝ) - α| ≤ Height.mulHeight₁ (β i) ^ (-κ))
    (hD : ∀ i, D' ≤ r i * Height.logHeight₁ (β i))
    (hne : MvPolynomial.eval (fun i => (β i : ℝ)) (Q.map (Int.castRingHom ℝ)) ≠ 0) :
    Real.log |MvPolynomial.eval (fun i => (β i : ℝ)) (Q.map (Int.castRingHom ℝ))| ≤
      Real.log (⨆ m, (|Q.coeff m| : ℝ)) +
        (∑ i, (r i : ℝ)) * (Real.log 2 + Real.log (max 1 |α|)) +
        2 * ∑ i, Real.log (r i + 1) - κ * D' * t := sorry

/-- The value of an integer polynomial at a rational point is either zero or at least the inverse
of the product of the denominators (the product formula over `ℚ`). -/
theorem neg_sum_log_den_le_log_abs_eval {n : ℕ} (Q : MvPolynomial (Fin n) ℤ) (r : Fin n → ℕ)
    (hdeg : ∀ i, Q.degreeOf i ≤ r i) (β : Fin n → ℚ)
    (hne : MvPolynomial.eval β (Q.map (Int.castRingHom ℚ)) ≠ 0) :
    -∑ i, (r i : ℝ) * Real.log (β i).den ≤
      Real.log |(MvPolynomial.eval β (Q.map (Int.castRingHom ℚ)) : ℝ)| := sorry

/-- **Roth's theorem** (Roth 1955): for a real algebraic irrational `α` and `κ > 2`, only finitely
many rationals satisfy `|α - ξ| ≤ H(ξ)^(-κ)`. The proof gives no way to list them. -/
theorem roth (α : ℝ) (hα : IsAlgebraic ℚ α) (hirr : Irrational α) (κ : ℝ) (hκ : 2 < κ) :
    {ξ : ℚ | |(ξ : ℝ) - α| ≤ Height.mulHeight₁ ξ ^ (-κ)}.Finite := sorry

/-- Roth's theorem in the form of Evertse, Theorem 6.2. -/
theorem roth_lower_bound (α : ℝ) (hα : IsAlgebraic ℚ α) (hirr : Irrational α) (κ : ℝ)
    (hκ : 2 < κ) :
    ∃ c : ℝ, 0 < c ∧ ∀ ξ : ℚ, c * Height.mulHeight₁ ξ ^ (-κ) ≤ |(ξ : ℝ) - α| := sorry

/-- Roth's lower bound for every algebraic number (Evertse, remarks after Theorem 6.2). -/
theorem roth_lower_bound_of_isAlgebraic (α : ℂ) (hα : IsAlgebraic ℚ α) (κ : ℝ) (hκ : 2 < κ) :
    ∃ c : ℝ, 0 < c ∧ ∀ ξ : ℚ, (ξ : ℂ) ≠ α → c * Height.mulHeight₁ ξ ^ (-κ) ≤ ‖(ξ : ℂ) - α‖ :=
  sorry

/-- Roth's theorem in Mathlib's vocabulary: a real algebraic number is not `LiouvilleWith p`
for any `p > 2`. -/
theorem not_liouvilleWith_of_isAlgebraic (α : ℝ) (hα : IsAlgebraic ℚ α) {p : ℝ} (hp : 2 < p) :
    ¬ LiouvilleWith p α := sorry

/-- Evertse, Exercise 6.5: `∑ₖ b^(-3^k)` is transcendental. -/
theorem transcendental_tsum_inv_pow_three_pow (b : ℕ) (hb : 2 ≤ b) :
    Transcendental ℚ (∑' k : ℕ, ((b : ℝ)⁻¹) ^ (3 ^ (k + 1))) := sorry

/-- A binary form over `ℂ` with no repeated linear factor and not divisible by `Y` is a product
of pairwise non-proportional linear forms. -/
theorem exists_linear_factorisation (F : MvPolynomial (Fin 2) ℂ) (d : ℕ) (hF : F.IsHomogeneous d)
    (hsq : ∀ a b : ℂ, (a, b) ≠ (0, 0) →
      ¬ (MvPolynomial.C a * MvPolynomial.X 0 + MvPolynomial.C b * MvPolynomial.X 1) ^ 2 ∣ F)
    (hY : ¬ MvPolynomial.X 1 ∣ F) (hF₀ : F ≠ 0) :
    ∃ (a₀ : ℂ) (α : Fin d → ℂ), a₀ ≠ 0 ∧ Function.Injective α ∧
      F = MvPolynomial.C a₀ * ∏ i, (MvPolynomial.X 0 - MvPolynomial.C (α i) * MvPolynomial.X 1) :=
  sorry

/-- Evertse, Theorem 6.3. -/
theorem binary_form_lower_bound (F : MvPolynomial (Fin 2) ℤ) (d : ℕ) (hF : F.IsHomogeneous d)
    (hd : 3 ≤ d)
    (hsq : ∀ a b : ℂ, (a, b) ≠ (0, 0) →
      ¬ (MvPolynomial.C a * MvPolynomial.X 0 + MvPolynomial.C b * MvPolynomial.X 1) ^ 2 ∣
        MvPolynomial.map (Int.castRingHom ℂ) F)
    (κ : ℝ) (hκ : 2 < κ) :
    ∃ c : ℝ, 0 < c ∧ ∀ x y : ℤ, MvPolynomial.eval ![x, y] F ≠ 0 →
      c * max |(x : ℝ)| |(y : ℝ)| ^ ((d : ℝ) - κ) ≤ |(MvPolynomial.eval ![x, y] F : ℝ)| := sorry

/-- The square-free part of a binary form (the reduction in the proof of Evertse,
Corollary 6.4). -/
theorem exists_squarefree_dvd (F : MvPolynomial (Fin 2) ℤ) (d : ℕ) (hF : F.IsHomogeneous d)
    (hroots : 3 ≤
      ((MvPolynomial.aeval ![Polynomial.X, 1] F : ℤ[X]).map (Int.castRingHom ℂ)).roots.toFinset.card) :
    ∃ (G : MvPolynomial (Fin 2) ℤ) (e : ℕ), 3 ≤ e ∧ G.IsHomogeneous e ∧ G ∣ F ∧
      ∀ a b : ℂ, (a, b) ≠ (0, 0) →
        ¬ (MvPolynomial.C a * MvPolynomial.X 0 + MvPolynomial.C b * MvPolynomial.X 1) ^ 2 ∣
          MvPolynomial.map (Int.castRingHom ℂ) G := sorry

/-- **Thue's theorem on Thue equations** (Evertse, Corollary 6.4); ineffective. -/
theorem thue_equation_finite (F : MvPolynomial (Fin 2) ℤ) (d : ℕ) (hF : F.IsHomogeneous d)
    (hroots : 3 ≤
      ((MvPolynomial.aeval ![Polynomial.X, 1] F : ℤ[X]).map (Int.castRingHom ℂ)).roots.toFinset.card)
    (m : ℤ) (hm : m ≠ 0) :
    {p : ℤ × ℤ | MvPolynomial.eval ![p.1, p.2] F = m}.Finite := sorry

end DiophantineApproximation

/-! ################################################################
  Stage DT.2
################################################################ -/

/-
Suggested Lean fragment for the roadmap `DiophantineApproximationAndTranscendence`,
stage DT.2 (Subspace theorem and S-unit equations).

This file is not the roadmap and is not exhaustive: the roadmap document is definitive.
The statements below suggest Lean forms so that contributors and reviewers converge on
names and signatures. Every proof is `sorry`; nothing here is claimed as formalised.

Conventions pinned here (see the roadmap document for the full list):
* a linear form in `n` variables over a field `F` is its coefficient vector `Fin n → F`,
  evaluated by `dotProduct` (`⬝ᵥ`);
* `‖x‖` for `x : Fin n → ℤ` is Mathlib's sup norm `max |x i|`;
* subspaces of `ℚ^n` are `Submodule ℚ (Fin n → ℚ)`, and an integer point `x` lies in `V`
  when `(fun j ↦ (x j : ℚ)) ∈ V`;
* the height of a rational number is Mathlib's `Height.mulHeight₁`, which is
  `max |num| den` by `Rat.mulHeight₁_eq_max`;
* the normalised absolute values of a number field `K` (Evertse–Ferretti §1.1) are
  `‖x‖_w = w x ^ (mult w / [K : ℚ])` at infinite places and `‖x‖_v = v x ^ (1 / [K : ℚ])`
  at finite places (Mathlib's `FinitePlace` is normalised by the absolute norm).

Omitted on purpose (their conditions cannot be stated with the definitions below, which are
`K`-rational): the absolute statements of Evertse–Ferretti over `Q̄` that are not implied by
their `K`-rational restrictions, namely Proposition 9.2 (`absolute-minkowski-for-twisted-heights`,
whose upper bound fails for `K`-rational minima), Theorem 16.1
(`limit-of-successive-infima`), Lemma 11.3 (`davenport-lemma-for-twisted-heights`),
and Proposition 13.6 (`auxiliary-polynomial-for-twisted-heights`); likewise the effectivity clauses of Vojta's theorem and
of Evertse–Ferretti Theorem 3.3, and the height condition on `z` in
Evertse–Schlickewei–Schmidt Theorem 2.1 (absolute heights of tuples in `Q̄`).
The DT.0 height `naive-height-of-algebraic-number` is not imported: Theorem 7.8 is stated in
the equivalent form counting primitive minimal polynomials.
-/

noncomputable section

open NumberField Matrix

namespace DiophantineApproximation

/-! ## Linear forms in general position
Node `DT.2/linear-forms-in-general-position` (Evertse, Chapter 7, before Theorem 7.4). -/

section GeneralPosition

variable {F : Type*} [Field F] {ι : Type*} {n : ℕ}

/-- A family of linear forms (coefficient vectors) is in general position if every
`n`-element subfamily is linearly independent. -/
def InGeneralPosition (L : ι → Fin n → F) : Prop :=
  ∀ s : Finset ι, s.card = n → LinearIndependent F (fun i : s ↦ L i)

namespace InGeneralPosition

theorem linearIndependent {L : ι → Fin n → F} (h : InGeneralPosition L)
    (s : Finset ι) (hs : s.card = n) : LinearIndependent F (fun i : s ↦ L i) :=
  h s hs

end InGeneralPosition

theorem inGeneralPosition_iff_det_ne_zero (L : ι → Fin n → F) :
    InGeneralPosition L ↔
      ∀ e : Fin n → ι, Function.Injective e → (Matrix.of fun k j ↦ L (e k) j).det ≠ 0 := by
  sorry

theorem inGeneralPosition_iff_linearIndependent [Fintype ι] (hι : Fintype.card ι = n)
    (L : ι → Fin n → F) : InGeneralPosition L ↔ LinearIndependent F L := by
  sorry

theorem inGeneralPosition_two_iff (L : ι → Fin 2 → F) :
    InGeneralPosition L ↔ ∀ i j, i ≠ j → LinearIndependent F ![L i, L j] := by
  sorry

namespace InGeneralPosition

theorem comp_injective {κ : Type*} {L : ι → Fin n → F}
    (h : InGeneralPosition L) {e : κ → ι} (he : Function.Injective e) :
    InGeneralPosition (L ∘ e) := by
  sorry

theorem smul {L : ι → Fin n → F} (h : InGeneralPosition L) (c : ι → F)
    (hc : ∀ i, c i ≠ 0) : InGeneralPosition (fun i ↦ c i • L i) := by
  sorry

theorem map {F' : Type*} [Field F'] {L : ι → Fin n → F}
    (h : InGeneralPosition L) (σ : F →+* F') : InGeneralPosition (fun i ↦ σ ∘ L i) := by
  sorry

/-- General position is preserved by the invertible linear change of variables `x ↦ A x`. -/
theorem comp_matrix {L : ι → Fin n → F} (h : InGeneralPosition L)
    (A : Matrix (Fin n) (Fin n) F) (hA : IsUnit A.det) :
    InGeneralPosition (fun i ↦ Aᵀ *ᵥ L i) := by
  sorry

end InGeneralPosition

/-- The forms `X_1, …, X_n, X_1 + ⋯ + X_n`. -/
theorem inGeneralPosition_coords_add_sum :
    InGeneralPosition (fun i : Option (Fin n) ↦
      (i.elim (fun _ ↦ (1 : F)) (fun k ↦ Pi.single k 1) : Fin n → F)) := by
  sorry

-- unit tests
example : InGeneralPosition (F := ℚ) ![![1, 0], ![0, 1], ![1, 1]] := by sorry -- inGeneralPosition_X_Y_XaddY

example : ¬ InGeneralPosition (F := ℚ) ![![1, 0], ![0, 1], ![1, 0]] := by sorry -- not_inGeneralPosition_repeat

example : ¬ InGeneralPosition (F := ℚ) ![![1, 0, 0], ![0, 1, 0], ![1, 1, 0], ![0, 0, 1]] := by
  sorry -- not_inGeneralPosition_pairwise

example : InGeneralPosition (F := F) (fun k : Fin n ↦ (Pi.single k 1 : Fin n → F)) := by
  sorry -- inGeneralPosition_basis

example : InGeneralPosition (F := ℝ)
    ![![1, √2, √3], ![1, -√2, √3], ![1, -√2, -√3]] := by
  sorry -- inGeneralPosition_iff_det_three

end GeneralPosition

/-! ## Basic lemmas -/

/-- `DT.2/sup-norm-bounded-by-independent-forms` (Evertse Lemmas 7.5, 8.9). -/
theorem exists_abv_le_mul_iSup_of_linearIndependent {F : Type*} [Field F]
    (abv : AbsoluteValue F ℝ) {n : ℕ} (M : Fin n → Fin n → F) (hM : LinearIndependent F M) :
    ∃ C > 0, ∀ x : Fin n → F, ∀ k, abv (x k) ≤ C * ⨆ j, abv (M j ⬝ᵥ x) := by
  sorry

/-- `DT.2/hadamard-inequality`. -/
theorem norm_det_le_prod_sqrt {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ) :
    ‖A.det‖ ≤ ∏ j, Real.sqrt (∑ i, ‖A i j‖ ^ 2) := by
  sorry

/-- `DT.2/absolute-value-continuation-exists`, part (a). -/
theorem exists_absoluteValue_eq_padicNorm (K : Type*) [Field K] [NumberField K]
    (p : ℕ) [Fact p.Prime] : ∃ v : AbsoluteValue K ℝ, ∀ q : ℚ, v (q : K) = padicNorm p q := by
  sorry

/-- `DT.2/absolute-value-continuation-exists`, part (b). -/
theorem exists_absoluteValue_eq_abs (K : Type*) [Field K] [NumberField K] :
    ∃ v : AbsoluteValue K ℝ, ∀ q : ℚ, v (q : K) = |(q : ℝ)| := by
  sorry

/-- `DT.2/absolute-value-extends-to-algebraic-closure`, non-archimedean case. -/
theorem exists_ringHom_padicAlgCl_of_eq_padicNorm (K : Type*) [Field K] [NumberField K]
    (p : ℕ) [Fact p.Prime] (v : AbsoluteValue K ℝ) (hv : ∀ q : ℚ, v (q : K) = padicNorm p q) :
    ∃ τ : AlgebraicClosure K →+* PadicAlgCl p,
      ∀ x : K, v x = ‖τ (algebraMap K (AlgebraicClosure K) x)‖ := by
  sorry

/-- `DT.2/absolute-value-extends-to-algebraic-closure`, archimedean case. -/
theorem exists_ringHom_complex_of_eq_abs (K : Type*) [Field K] [NumberField K]
    (v : AbsoluteValue K ℝ) (hv : ∀ q : ℚ, v (q : K) = |(q : ℝ)|) :
    ∃ τ : AlgebraicClosure K →+* ℂ, ∀ x : K, v x = ‖τ (algebraMap K (AlgebraicClosure K) x)‖ := by
  sorry

/-- `DT.2/rational-s-unit-product-criterion` (Evertse Lemma 8.11). -/
theorem exists_eq_pm_prod_zpow_iff (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) (u : ℚ) :
    (∃ w : S → ℤ, u = ∏ p : S, ((p : ℕ) : ℚ) ^ w p ∨ u = -∏ p : S, ((p : ℕ) : ℚ) ^ w p) ↔
      |u| * ∏ p ∈ S, padicNorm p u = 1 := by
  sorry

/-! ## The Subspace Theorem and its variants -/

/-- `DT.2/subspace-theorem-and-its-exceptional-subspaces` (Schmidt; Evertse Theorem 7.1). -/
theorem subspace_theorem {n : ℕ} (hn : 2 ≤ n) (L : Fin n → Fin n → ℂ)
    (halg : ∀ i j, IsAlgebraic ℚ (L i j)) (hL : LinearIndependent ℂ L) {C δ : ℝ}
    (hC : 0 < C) (hδ : 0 < δ) :
    ∃ T : Finset (Submodule ℚ (Fin n → ℚ)), (∀ V ∈ T, V ≠ ⊤) ∧
      ∀ x : Fin n → ℤ, ‖∏ i, L i ⬝ᵥ (fun j ↦ (x j : ℂ))‖ ≤ C * ‖x‖ ^ (-δ) →
        ∃ V ∈ T, (fun j ↦ (x j : ℚ)) ∈ V := by
  sorry

/-- `DT.2/subspace-theorem-general-position` (Evertse Theorem 7.4). -/
theorem subspace_theorem_general_position {n r : ℕ} (hn : 2 ≤ n) (hr : n ≤ r)
    (L : Fin r → Fin n → ℂ) (halg : ∀ i j, IsAlgebraic ℚ (L i j)) (hL : InGeneralPosition L)
    {C δ : ℝ} (hC : 0 < C) (hδ : 0 < δ) :
    ∃ T : Finset (Submodule ℚ (Fin n → ℚ)), (∀ V ∈ T, V ≠ ⊤) ∧
      ∀ x : Fin n → ℤ, ‖∏ i, L i ⬝ᵥ (fun j ↦ (x j : ℂ))‖ ≤ C * ‖x‖ ^ ((r : ℝ) - n - δ) →
        ∃ V ∈ T, (fun j ↦ (x j : ℚ)) ∈ V := by
  sorry

section PAdic

variable {K : Type*} [Field K] [NumberField K]

/-- `DT.2/p-adic-subspace-theorem` (Schlickewei; Evertse Theorem 8.7). The index `none`
stands for the infinite place, `some p` for the prime `p ∈ S`; `v` are the chosen
continuations (notation (8.4)). -/
theorem padic_subspace_theorem {n : ℕ} (hn : 2 ≤ n) (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime)
    (v : Option S → AbsoluteValue K ℝ) (hvInf : ∀ q : ℚ, v none (q : K) = |(q : ℝ)|)
    (hvp : ∀ (p : S) (q : ℚ), v (some p) (q : K) = padicNorm p q)
    (L : Option S → Fin n → Fin n → K) (hL : ∀ p, LinearIndependent K (L p))
    {C ε : ℝ} (hC : 0 < C) (hε : 0 < ε) :
    ∃ T : Finset (Submodule ℚ (Fin n → ℚ)), (∀ V ∈ T, V ≠ ⊤) ∧
      ∀ x : Fin n → ℤ,
        ∏ p, ∏ i, v p (L p i ⬝ᵥ (fun j ↦ (x j : K))) ≤ C * ‖x‖ ^ (-ε) →
          ∃ V ∈ T, (fun j ↦ (x j : ℚ)) ∈ V := by
  sorry

/-- `DT.2/p-adic-subspace-theorem-general-position` (Evertse Theorem 8.8). -/
theorem padic_subspace_theorem_general_position {n : ℕ} (hn : 2 ≤ n) (S : Finset ℕ)
    (hS : ∀ p ∈ S, p.Prime) (v : Option S → AbsoluteValue K ℝ)
    (hvInf : ∀ q : ℚ, v none (q : K) = |(q : ℝ)|)
    (hvp : ∀ (p : S) (q : ℚ), v (some p) (q : K) = padicNorm p q)
    (r : Option S → ℕ) (hr : ∀ p, n ≤ r p) (L : (p : Option S) → Fin (r p) → Fin n → K)
    (hL : ∀ p, InGeneralPosition (L p)) {C ε : ℝ} (hC : 0 < C) (hε : 0 < ε) :
    ∃ T : Finset (Submodule ℚ (Fin n → ℚ)), (∀ V ∈ T, V ≠ ⊤) ∧
      ∀ x : Fin n → ℤ, Finset.univ.gcd x = 1 →
        ∏ p, ∏ i, v p (L p i ⬝ᵥ (fun j ↦ (x j : K))) ≤ C * ‖x‖ ^ ((r none : ℝ) - n - ε) →
          ∃ V ∈ T, (fun j ↦ (x j : ℚ)) ∈ V := by
  sorry

/-- `DT.2/product-inequality-reduces-to-systems` (Mahler; Evertse–Schlickewei §21). -/
theorem exists_finite_systems_of_product_inequality {n : ℕ} (hn : 2 ≤ n) (S : Finset ℕ)
    (hS : ∀ p ∈ S, p.Prime) (v : Option S → AbsoluteValue K ℝ)
    (hvInf : ∀ q : ℚ, v none (q : K) = |(q : ℝ)|)
    (hvp : ∀ (p : S) (q : ℚ), v (some p) (q : K) = padicNorm p q)
    (L : Option S → Fin n → Fin n → K) (hL : ∀ p, LinearIndependent K (L p))
    {C ε : ℝ} (hC : 0 < C) (hε : 0 < ε) (hε1 : ε ≤ 1) :
    ∃ (B : ℝ) (D : Set (Option S → Fin n → ℝ)), D.Finite ∧
      (∀ d ∈ D, (∀ p i, d p i ≤ 0) ∧ ∑ p, ∑ i, d p i = -(n : ℝ) - ε / 2) ∧
      ∀ x : Fin n → ℤ, Finset.univ.gcd x = 1 → B ≤ ‖x‖ →
        (∀ p i, L p i ⬝ᵥ (fun j ↦ (x j : K)) ≠ 0) →
        ∏ p, ∏ i, v p (L p i ⬝ᵥ (fun j ↦ (x j : K))) ≤ C * ‖x‖ ^ (-ε) →
        ∃ d ∈ D, ∀ p i, v p (L p i ⬝ᵥ (fun j ↦ (x j : K))) ≤
          n * max 1 (⨆ j, v p (L p i j)) * (⨆ j, v p (x j : K)) * ‖x‖ ^ d p i := by
  sorry

/-- `DT.2/p-adic-roth-theorem` (Ridout; Evertse Theorem 8.6). -/
theorem padic_roth (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) (v : Option S → AbsoluteValue K ℝ)
    (hvInf : ∀ q : ℚ, v none (q : K) = |(q : ℝ)|)
    (hvp : ∀ (p : S) (q : ℚ), v (some p) (q : K) = padicNorm p q)
    (α : Option S → K) {C κ : ℝ} (hC : 0 < C) (hκ : 2 < κ) :
    {ξ : ℚ | ∏ p, v p (α p - ξ) ≤ C * Height.mulHeight₁ ξ ^ (-κ)}.Finite := by
  sorry

end PAdic

/-- `DT.2/vojta-effective-exceptional-subspaces` (Evertse Theorem 7.14); the effectivity of
the subspaces is not expressible here and is omitted. -/
theorem exists_exceptional_subspaces_general_position {n r : ℕ} (hn : 2 ≤ n) (hr : n ≤ r)
    (L : Fin r → Fin n → ℂ) (halg : ∀ i j, IsAlgebraic ℚ (L i j)) (hL : InGeneralPosition L) :
    ∃ U : Finset (Submodule ℚ (Fin n → ℚ)), (∀ V ∈ U, V ≠ ⊤) ∧
      ∀ C δ : ℝ, 0 < C → 0 < δ →
        {x : Fin n → ℤ | ‖∏ i, L i ⬝ᵥ (fun j ↦ (x j : ℂ))‖ ≤ C * ‖x‖ ^ ((r : ℝ) - n - δ) ∧
          ∀ V ∈ U, (fun j ↦ (x j : ℚ)) ∉ V}.Finite := by
  sorry

/-! ## Consequences in Evertse, Chapter 7 -/

/-- `DT.2/vanishing-form-gives-infinitely-many-solutions`. -/
theorem infinite_solutions_of_form_vanishes {n : ℕ} (hn : 2 ≤ n) (L : Fin n → Fin n → ℂ)
    {C δ : ℝ} (hC : 0 < C) (hδ : 0 < δ) (i : Fin n) (x₀ : Fin n → ℤ) (hx₀ : x₀ ≠ 0)
    (hLx₀ : L i ⬝ᵥ (fun j ↦ (x₀ j : ℂ)) = 0) :
    {x : Fin n → ℤ | ‖∏ i, L i ⬝ᵥ (fun j ↦ (x j : ℂ))‖ ≤ C * ‖x‖ ^ (-δ)}.Infinite := by
  sorry

/-- The three forms of Evertse (7.5). -/
def formsExample75 : Fin 3 → Fin 3 → ℝ := ![![1, √2, √3], ![1, -√2, √3], ![1, -√2, -√3]]

/-- `DT.2/exceptional-subspace-example-three-forms` (Evertse Example (7.5)). -/
theorem infinite_solutions_example75 {δ : ℝ} (hδ₀ : 0 < δ) (hδ₁ : δ < 1) :
    {x : Fin 3 → ℤ | x 2 = 0 ∧
      0 < |∏ i, formsExample75 i ⬝ᵥ (fun j ↦ (x j : ℝ))| ∧
      |∏ i, formsExample75 i ⬝ᵥ (fun j ↦ (x j : ℝ))| ≤ ‖x‖ ^ (-δ)}.Infinite := by
  sorry

/-- `DT.2/two-form-strict-inequality-finite` (Evertse Lemma 7.3). -/
theorem finite_two_forms_strict (L : Fin 2 → Fin 2 → ℂ) (halg : ∀ i j, IsAlgebraic ℚ (L i j))
    (hL : LinearIndependent ℂ L) {C δ : ℝ} (hC : 0 < C) (hδ : 0 < δ) :
    {x : Fin 2 → ℤ | 0 < ‖∏ i, L i ⬝ᵥ (fun j ↦ (x j : ℂ))‖ ∧
      ‖∏ i, L i ⬝ᵥ (fun j ↦ (x j : ℂ))‖ ≤ C * ‖x‖ ^ (-δ)}.Finite := by
  sorry

/-- `DT.2/roth-from-subspace-theorem` (Evertse Corollary 7.2). -/
theorem roth_of_subspace_theorem (α : ℂ) (hα : IsAlgebraic ℚ α) {C κ : ℝ} (hC : 0 < C)
    (hκ : 2 < κ) : {ξ : ℚ | ‖(ξ : ℂ) - α‖ ≤ C * Height.mulHeight₁ ξ ^ (-κ)}.Finite := by
  sorry

/-- `DT.2/linear-form-dirichlet-exponent` (Evertse Lemma 7.6). -/
theorem exists_infinite_small_linear_form {n : ℕ} (hn : 2 ≤ n) (α : Fin n → ℝ)
    (hα : LinearIndependent ℚ α) :
    ∃ C > 0, {x : Fin n → ℤ | |∑ i, α i * x i| ≤ C * ‖x‖ ^ (1 - (n : ℝ))}.Infinite := by
  sorry

/-- `DT.2/single-linear-form-inequality-finite` (Evertse Theorem 7.7). -/
theorem finite_small_linear_form {n : ℕ} (α : Fin n → ℂ) (hα : ∀ i, IsAlgebraic ℚ (α i))
    {C δ : ℝ} (hC : 0 < C) (hδ : 0 < δ) :
    {x : Fin n → ℤ | 0 < ‖∑ i, α i * x i‖ ∧
      ‖∑ i, α i * x i‖ ≤ C * ‖x‖ ^ (1 - (n : ℝ) - δ)}.Finite := by
  sorry

/-- `DT.2/approximation-by-algebraic-numbers-of-bounded-degree` (Evertse Theorem 7.8), in the
equivalent form counting the primitive minimal polynomials `F` (the height of a root of `F` is
the maximum of the absolute values of the coefficients of `F`). -/
theorem finite_approximation_bounded_degree (α : ℂ) (hα : IsAlgebraic ℚ α) (d : ℕ)
    {C κ : ℝ} (hC : 0 < C) (hκ : (d : ℝ) + 1 < κ) :
    {F : Polynomial ℤ | F.IsPrimitive ∧ Irreducible F ∧ 0 < F.leadingCoeff ∧ F.natDegree ≤ d ∧
      ∃ ξ : ℂ, Polynomial.aeval ξ F = 0 ∧
        ‖ξ - α‖ ≤ C * ((F.support.sup fun i ↦ (F.coeff i).natAbs : ℕ) : ℝ) ^ (-κ)}.Finite := by
  sorry

/-! ## Norm form equations (Evertse §7.2) -/

section NormForm

variable {K : Type*} [Field K] [NumberField K]

/-- `DT.2/embedding-vectors-linearly-independent` (Evertse Lemma 7.10). -/
theorem linearIndependent_embeddingVectors {n : ℕ} (α : Fin n → K)
    (hα : LinearIndependent ℚ α) :
    LinearIndependent ℂ (fun i ↦ fun σ : K →+* ℂ ↦ σ (α i)) := by
  sorry

/-- `DT.2/norm-form-linear-factors-general-position` (Evertse Lemma 7.11). -/
theorem inGeneralPosition_normFormFactors (θ : K) (hθ : IntermediateField.adjoin ℚ {θ} = ⊤)
    [Fact (((minpoly ℚ θ).map (algebraMap ℚ ℂ)).Splits)]
    (hS : Function.Surjective (Polynomial.Gal.galActionHom (minpoly ℚ θ) ℂ)) {n : ℕ}
    (α : Fin n → K) (hα : LinearIndependent ℚ α) :
    InGeneralPosition (fun σ : K →+* ℂ ↦ fun j ↦ σ (α j)) := by
  sorry

/-- `DT.2/norm-form-equation-finite-full-symmetric-group` (Evertse Theorem 7.9). -/
theorem finite_normForm_of_symmetric (θ : K) (hθ : IntermediateField.adjoin ℚ {θ} = ⊤)
    [Fact (((minpoly ℚ θ).map (algebraMap ℚ ℂ)).Splits)]
    (hS : Function.Surjective (Polynomial.Gal.galActionHom (minpoly ℚ θ) ℂ)) {n : ℕ}
    (hn : n < Module.finrank ℚ K) (α : Fin n → K) (hα : LinearIndependent ℚ α) (c : ℚ) :
    {x : Fin n → ℤ | Algebra.norm ℚ (∑ i, (x i : K) * α i) = c}.Finite := by
  sorry

/-- `DT.2/unit-group-infinite-criterion`. -/
theorem infinite_units_iff (L : Type*) [Field L] [NumberField L] :
    Infinite (𝓞 L)ˣ ↔
      ¬ (Module.finrank ℚ L = 1 ∨ (Module.finrank ℚ L = 2 ∧ IsTotallyComplex L)) := by
  sorry

/-- `DT.2/degenerate-module-norm-form-infinitely-many-solutions` (Evertse 7.13, (ii) ⇒ (i)). -/
theorem infinite_normForm_of_containsScaledOrder {n : ℕ} (α : Fin n → K)
    (hα : LinearIndependent ℚ α) (μ : K) (hμ : μ ≠ 0) (L : IntermediateField ℚ K)
    (hL : L ≠ ⊥) (hLq : ¬ (Module.finrank ℚ L = 2 ∧ IsTotallyComplex L))
    (hM : ∀ y : 𝓞 L, μ * ((y : L) : K) ∈ Submodule.span ℤ (Set.range α)) :
    {ξ : K | ξ ∈ Submodule.span ℤ (Set.range α) ∧
      Algebra.norm ℚ ξ = Algebra.norm ℚ μ}.Infinite := by
  sorry

/-- `DT.2/schmidt-norm-form-theorem` (Schmidt 1972; Evertse 7.13, (i) ⇒ (ii)). -/
theorem schmidt_normForm {n : ℕ} (α : Fin n → K) (hα : LinearIndependent ℚ α)
    (h : ¬ ∃ μ : K, μ ≠ 0 ∧ ∃ L : IntermediateField ℚ K, L ≠ ⊥ ∧
      ¬ (Module.finrank ℚ L = 2 ∧ IsTotallyComplex L) ∧
        ∀ y : 𝓞 L, μ * ((y : L) : K) ∈ Submodule.span ℤ (Set.range α))
    (c : ℚ) (hc : c ≠ 0) :
    {ξ : K | ξ ∈ Submodule.span ℤ (Set.range α) ∧ Algebra.norm ℚ ξ = c}.Finite := by
  sorry

end NormForm

/-! ## Thue–Mahler equations and two-term unit equations -/

/-- `DT.2/squarefree-binary-form-linear-factors`. -/
theorem exists_linear_factors_of_squarefree (F : MvPolynomial (Fin 2) ℤ) {n : ℕ}
    (hn : 1 ≤ n) (hF : F.IsHomogeneous n)
    (hsq : Squarefree (MvPolynomial.map (Int.castRingHom ℚ) F)) :
    ∃ β γ : Fin n → ℂ, (∀ i, IsAlgebraic ℚ (β i) ∧ IsAlgebraic ℚ (γ i)) ∧
      (∀ x y : ℤ, ((MvPolynomial.eval ![x, y] F : ℤ) : ℂ) = ∏ i, (β i * x - γ i * y)) ∧
      InGeneralPosition (fun i ↦ ![β i, -γ i]) := by
  sorry

/-- `DT.2/thue-mahler-finiteness` (Mahler; Evertse Theorem 8.10). -/
theorem finite_thueMahler (F : MvPolynomial (Fin 2) ℤ) {n : ℕ} (hn : 3 ≤ n)
    (hF : F.IsHomogeneous n) (hsq : Squarefree (MvPolynomial.map (Int.castRingHom ℚ) F))
    (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) :
    {xz : (ℤ × ℤ) × (S → ℤ) | IsCoprime xz.1.1 xz.1.2 ∧
      ((|MvPolynomial.eval ![xz.1.1, xz.1.2] F| : ℤ) : ℚ) =
        ∏ p : S, ((p : ℕ) : ℚ) ^ xz.2 p}.Finite := by
  sorry

/-- `DT.2/two-term-unit-equation-over-rationals` (Lang; Evertse Theorem 8.12 for `Γ ⊂ ℚ^*`). -/
theorem finite_two_term_unit_equation_rat (a b : ℚ) (ha : a ≠ 0) (hb : b ≠ 0)
    (Γ : Subgroup ℚˣ) (hΓ : Γ.FG) :
    {xy : Γ × Γ | a * ((xy.1 : ℚˣ) : ℚ) + b * ((xy.2 : ℚˣ) : ℚ) = 1}.Finite := by
  sorry

/-! ## Non-degenerate solutions -/

section Nondegenerate

variable {K : Type*} [Field K] {ι : Type*} [Fintype ι]

/-- `DT.2/nondegenerate-solution`: `Σ αᵢ xᵢ = 1` with no vanishing non-empty subsum. -/
def IsNondegenerateSolution (α x : ι → K) : Prop :=
  ∑ i, α i * x i = 1 ∧ ∀ I : Finset ι, I.Nonempty → ∑ i ∈ I, α i * x i ≠ 0

namespace IsNondegenerateSolution

theorem sum_eq_one {α x : ι → K} (h : IsNondegenerateSolution α x) :
    ∑ i, α i * x i = 1 :=
  h.1

theorem subsum_ne_zero {α x : ι → K}
    (h : IsNondegenerateSolution α x) {I : Finset ι} (hI : I.Nonempty) :
    ∑ i ∈ I, α i * x i ≠ 0 :=
  h.2 I hI

/-- The singleton subsums: every term `αᵢ xᵢ` is non-zero. -/
theorem ne_zero {α x : ι → K} (h : IsNondegenerateSolution α x)
    (i : ι) : α i * x i ≠ 0 := by
  sorry

theorem map {K' : Type*} [Field K'] {α x : ι → K}
    (h : IsNondegenerateSolution α x) (φ : K →+* K')
    (hφ : ∀ I : Finset ι, I.Nonempty → φ (∑ i ∈ I, α i * x i) ≠ 0) :
    IsNondegenerateSolution (φ ∘ α) (φ ∘ x) := by
  sorry

/-- If the subsum of a solution over `I` vanishes and no non-empty subsum of the complementary
part does, the complementary part is a non-degenerate solution of `Σ_{i ∉ I} αᵢ xᵢ = 1` (the
decomposition behind the induction in Evertse–Schlickewei–Schmidt §4). -/
theorem restrict [DecidableEq ι] {α x : ι → K} (I : Finset ι)
    (hsum : ∑ i, α i * x i = 1) (hI : ∑ i ∈ I, α i * x i = 0)
    (hnd : ∀ J : Finset ι, J.Nonempty → (J ⊆ Iᶜ) → ∑ i ∈ J, α i * x i ≠ 0) :
    IsNondegenerateSolution (fun i : {i // i ∉ I} ↦ α i) (fun i ↦ x i) := by
  sorry

end IsNondegenerateSolution

theorem isNondegenerateSolution_of_subsingleton [Subsingleton ι] {α x : ι → K}
    (h : ∑ i, α i * x i = 1) : IsNondegenerateSolution α x := by
  sorry

-- unit tests
example : IsNondegenerateSolution (K := ℚ) ![1, 1] ![1 / 2, 1 / 2] := by
  sorry -- isNondegenerateSolution_half_half

example : ¬ IsNondegenerateSolution (K := ℚ) ![1, -1, 1] ![2, 2, 1] := by
  sorry -- not_isNondegenerateSolution_vanishing

example (a : K) (ha : a ≠ 0) : IsNondegenerateSolution ![a] ![a⁻¹] := by
  sorry -- isNondegenerateSolution_single

example (a b x y : K) :
    IsNondegenerateSolution ![a, b] ![x, y] ↔ a * x + b * y = 1 ∧ a * x ≠ 0 ∧ b * y ≠ 0 := by
  sorry -- isNondegenerateSolution_two_iff

/-- `DT.2/nondegenerate-homogeneous-solution`: `Σ αᵢ xᵢ = 0` with no vanishing proper
non-empty subsum. -/
def IsNondegenerateHomogeneousSolution (α x : ι → K) : Prop :=
  ∑ i, α i * x i = 0 ∧
    ∀ I : Finset ι, I.Nonempty → I ≠ Finset.univ → ∑ i ∈ I, α i * x i ≠ 0

namespace IsNondegenerateHomogeneousSolution

theorem sum_eq_zero {α x : ι → K}
    (h : IsNondegenerateHomogeneousSolution α x) : ∑ i, α i * x i = 0 :=
  h.1

theorem smul {α x : ι → K}
    (h : IsNondegenerateHomogeneousSolution α x) {c : K} (hc : c ≠ 0) :
    IsNondegenerateHomogeneousSolution α (c • x) := by
  sorry

end IsNondegenerateHomogeneousSolution

theorem isNondegenerateHomogeneousSolution_iff_cons {κ : Type*} [Fintype κ] (α x : κ → K) :
    IsNondegenerateHomogeneousSolution (fun i : Option κ ↦ i.elim (-1) α)
        (fun i : Option κ ↦ i.elim 1 x) ↔
      IsNondegenerateSolution α x := by
  sorry

namespace IsNondegenerateHomogeneousSolution

/-- If `x_p = β x_q` with `p ≠ q`, dropping `x_p` and replacing `α_q` by `α_q + β α_p` gives a
non-degenerate solution with one unknown fewer (proof of Evertse Theorem 8.14). -/
theorem merge [DecidableEq ι] {α x : ι → K} (h : IsNondegenerateHomogeneousSolution α x)
    {p q : ι} (hpq : p ≠ q) {β : K} (hx : x p = β * x q) :
    IsNondegenerateHomogeneousSolution
      (fun i : {i // i ≠ p} ↦ if (i : ι) = q then α q + β * α p else α i)
      (fun i ↦ x i) := by
  sorry

/-- With at least two unknowns, every `xᵢ` with `αᵢ ≠ 0` is non-zero. -/
theorem ne_zero {α x : ι → K}
    (h : IsNondegenerateHomogeneousSolution α x) (hι : 2 ≤ Fintype.card ι) {i : ι}
    (hα : α i ≠ 0) : x i ≠ 0 := by
  sorry

end IsNondegenerateHomogeneousSolution

-- unit tests
example : IsNondegenerateHomogeneousSolution (K := ℚ) ![1, 1, -1] ![1, 1, 2] := by
  sorry -- isNondegenerateHomogeneousSolution_one_one_two

example : ¬ IsNondegenerateHomogeneousSolution (K := ℚ) ![1, -1, 1, -1] ![1, 1, 1, 1] := by
  sorry -- not_isNondegenerateHomogeneousSolution

example (a b x y : K) (ha : a ≠ 0) (hb : b ≠ 0) (hx : x ≠ 0) (hy : y ≠ 0)
    (h : a * x + b * y = 0) : IsNondegenerateHomogeneousSolution ![a, b] ![x, y] := by
  sorry -- isNondegenerateHomogeneousSolution_two

example : IsNondegenerateHomogeneousSolution (K := ℚ) ![-1, 1, 1] ![1, 1 / 2, 1 / 2] ↔
    IsNondegenerateSolution (K := ℚ) ![1, 1] ![1 / 2, 1 / 2] := by
  sorry -- isNondegenerateHomogeneousSolution_iff_cons_test

end Nondegenerate

/-! ## S-unit equations -/

/-- `DT.2/homogeneous-unit-equation-subspace-cover` (Evertse Lemma 8.15). -/
theorem exists_subspaces_homogeneous_unit_equation {n : ℕ} (hn : 2 ≤ n)
    (α : Fin (n + 1) → ℚ) (hα : ∀ i, α i ≠ 0) (Γ : Subgroup ℚˣ) (hΓ : Γ.FG) :
    ∃ T : Finset (Submodule ℚ (Fin (n + 1) → ℚ)),
      (∀ V ∈ T, V < LinearMap.ker (Fintype.linearCombination ℚ α)) ∧
      ∀ x : Fin (n + 1) → Γ, ∑ i, α i * ((x i : ℚˣ) : ℚ) = 0 →
        ∃ V ∈ T, (fun i ↦ ((x i : ℚˣ) : ℚ)) ∈ V := by
  sorry

/-- `DT.2/homogeneous-unit-equation-ratio-lemma` (Evertse Lemma 8.16). -/
theorem exists_ratio_set {n : ℕ} (hn : 1 ≤ n) (α : Fin (n + 1) → ℚ) (hα : ∀ i, α i ≠ 0)
    (Γ : Subgroup ℚˣ) (hΓ : Γ.FG) :
    ∃ U : Finset ℚ, ∀ x : Fin (n + 1) → Γ, ∑ i, α i * ((x i : ℚˣ) : ℚ) = 0 →
      ∃ i j, i ≠ j ∧ ((x i : ℚˣ) : ℚ) / ((x j : ℚˣ) : ℚ) ∈ U := by
  sorry

/-- `DT.2/nondegenerate-solutions-have-finitely-many-ratios` (Evertse Theorem 8.14). -/
theorem exists_ratio_set_of_nondegenerate {n : ℕ} (hn : 1 ≤ n) (α : Fin (n + 1) → ℚ)
    (hα : ∀ i, α i ≠ 0) (Γ : Subgroup ℚˣ) (hΓ : Γ.FG) :
    ∃ U : Finset ℚ, ∀ x : Fin (n + 1) → Γ,
      IsNondegenerateHomogeneousSolution α (fun i ↦ ((x i : ℚˣ) : ℚ)) →
        ∀ i j, ((x i : ℚˣ) : ℚ) / ((x j : ℚˣ) : ℚ) ∈ U := by
  sorry

/-- `DT.2/s-unit-equation-over-rationals` (Evertse Theorem 8.13 for `Γ ⊂ ℚ^*`). -/
theorem finite_nondegenerate_solutions_rat {n : ℕ} (α : Fin n → ℚ) (hα : ∀ i, α i ≠ 0)
    (Γ : Subgroup ℚˣ) (hΓ : Γ.FG) :
    {x : Fin n → Γ | IsNondegenerateSolution α (fun i ↦ ((x i : ℚˣ) : ℚ))}.Finite := by
  sorry

/-- `DT.2/specialization-to-algebraic-numbers` (Evertse–Schlickewei–Schmidt Lemma 3.1). -/
theorem nonempty_specialization {K : Type*} [Field K] [IsAlgClosed K] [CharZero K]
    [Algebra (AlgebraicClosure ℚ) K] (U : Finset K) :
    Nonempty (Algebra.adjoin (AlgebraicClosure ℚ) (U : Set K) →ₐ[AlgebraicClosure ℚ]
      AlgebraicClosure ℚ) := by
  sorry

/-- `DT.2/unit-equation-subspace-bound-algebraic` (Evertse–Schlickewei–Schmidt Theorem 2.1),
in the case `z = (1, …, 1)` used downstream (the height condition on `z` needs absolute heights
of tuples in `Q̄`, which Mathlib does not yet provide). -/
theorem exists_subspaces_unit_equation_algebraic {n : ℕ} (hn : 2 ≤ n)
    (Γ : Subgroup (Fin n → (AlgebraicClosure ℚ)ˣ)) (r : ℕ)
    (hΓ : Module.rank ℤ (Additive Γ) ≤ r) :
    ∃ T : Finset (Submodule (AlgebraicClosure ℚ) (Fin n → AlgebraicClosure ℚ)),
      (T.card : ℝ) ≤ Real.exp ((5 * n : ℝ) ^ (3 * n) * (r + 1)) ∧ (∀ V ∈ T, V ≠ ⊤) ∧
      ∀ x ∈ Γ, ∑ i, ((x i : (AlgebraicClosure ℚ)ˣ) : AlgebraicClosure ℚ) = 1 →
        ∃ V ∈ T, (fun i ↦ ((x i : (AlgebraicClosure ℚ)ˣ) : AlgebraicClosure ℚ)) ∈ V := by
  sorry

/-- `DT.2/uniform-bound-nondegenerate-solutions` (Evertse–Schlickewei–Schmidt Theorem 1.1). -/
theorem card_nondegenerate_solutions_le {K : Type*} [Field K] [CharZero K] {n : ℕ}
    (Γ : Subgroup (Fin n → Kˣ)) (r : ℕ) (hΓ : Module.rank ℤ (Additive Γ) ≤ r)
    (a : Fin n → Kˣ) (M : Finset (Fin n → Kˣ))
    (hM : ∀ x ∈ M, x ∈ Γ ∧ IsNondegenerateSolution (fun i ↦ (a i : K)) (fun i ↦ (x i : K))) :
    (M.card : ℝ) ≤ Real.exp ((6 * n : ℝ) ^ (3 * n) * (r + 1)) := by
  sorry

/-- `DT.2/s-unit-equation-finiteness` (Evertse Theorem 8.13). -/
theorem finite_nondegenerate_solutions {K : Type*} [Field K] [CharZero K] {n : ℕ}
    (α : Fin n → K) (hα : ∀ i, α i ≠ 0) (Γ : Subgroup Kˣ) (hΓ : Γ.FG) :
    {x : Fin n → Γ | IsNondegenerateSolution α (fun i ↦ ((x i : Kˣ) : K))}.Finite := by
  sorry

/-- `DT.2/s-unit-equation-finiteness`, the case `n = 2` (Lang; Evertse Theorem 8.12). -/
theorem finite_two_term_unit_equation {K : Type*} [Field K] [CharZero K] (a b : K)
    (ha : a ≠ 0) (hb : b ≠ 0) (Γ : Subgroup Kˣ) (hΓ : Γ.FG) :
    {xy : Γ × Γ | a * ((xy.1 : Kˣ) : K) + b * ((xy.2 : Kˣ) : K) = 1}.Finite := by
  sorry

/-! ## Linear recurrences and Skolem–Mahler–Lech -/

namespace LinearRecurrence

/-- `DT.2/nondegenerate-linear-recurrence`. -/
def IsNondegenerate (E : _root_.LinearRecurrence ℂ) : Prop :=
  E.charPoly.coeff 0 ≠ 0 ∧
    ∀ θ ∈ E.charPoly.roots, ∀ θ' ∈ E.charPoly.roots, θ ≠ θ' → ¬ IsOfFinOrder (θ / θ')

namespace IsNondegenerate

theorem root_ne_zero {E : _root_.LinearRecurrence ℂ}
    (h : IsNondegenerate E) {θ : ℂ} (hθ : θ ∈ E.charPoly.roots) : θ ≠ 0 := by
  sorry

theorem not_isOfFinOrder_div {E : _root_.LinearRecurrence ℂ}
    (h : IsNondegenerate E) {θ θ' : ℂ} (hθ : θ ∈ E.charPoly.roots)
    (hθ' : θ' ∈ E.charPoly.roots) (hne : θ ≠ θ') : ¬ IsOfFinOrder (θ / θ') :=
  h.2 θ hθ θ' hθ' hne

/-- Passage to the minimal recurrence. -/
theorem of_dvd {E E' : _root_.LinearRecurrence ℂ}
    (h : IsNondegenerate E) (hdvd : E'.charPoly ∣ E.charPoly)
    (h0 : E'.charPoly.coeff 0 ≠ 0) : IsNondegenerate E' := by
  sorry

end IsNondegenerate

theorem isNondegenerate_iff_pow (E : _root_.LinearRecurrence ℂ) :
    IsNondegenerate E ↔ E.charPoly.coeff 0 ≠ 0 ∧
      ∀ θ ∈ E.charPoly.roots, ∀ θ' ∈ E.charPoly.roots, θ ≠ θ' →
        ∀ N : ℕ, 0 < N → θ ^ N ≠ θ' ^ N := by
  sorry

/-- A recurrence of order `≤ 1` with non-zero constant term is non-degenerate. -/
theorem isNondegenerate_of_order_le_one (E : _root_.LinearRecurrence ℂ)
    (hE : E.order ≤ 1) (h0 : E.charPoly.coeff 0 ≠ 0) : IsNondegenerate E := by
  sorry

end LinearRecurrence

-- unit tests
example : LinearRecurrence.IsNondegenerate ⟨2, ![1, 1]⟩ := by sorry -- isNondegenerate_fibonacci

example : ¬ LinearRecurrence.IsNondegenerate ⟨2, ![-1, 0]⟩ := by
  sorry -- not_isNondegenerate_period_four

example : LinearRecurrence.IsNondegenerate ⟨1, ![2]⟩ := by sorry -- isNondegenerate_geometric

example : LinearRecurrence.IsNondegenerate ⟨2, ![-1, 2]⟩ := by sorry -- isNondegenerate_double_root

/-- `DT.2/skolem-mahler-lech-simple-roots` (Evertse Theorem 8.18, simple roots). -/
theorem finite_zeros_simple_exponential_polynomial {m : ℕ} (g θ : Fin m → ℂ) (hg : g ≠ 0)
    (hθ : ∀ i, θ i ≠ 0) (hnd : ∀ i j, i ≠ j → ¬ IsOfFinOrder (θ i / θ j)) :
    {h : ℕ | ∑ i, g i * θ i ^ h = 0}.Finite := by
  sorry

/-- `DT.2/skolem-mahler-lech-simple-roots`, recurrence form. -/
theorem skolem_mahler_lech_simple (E : _root_.LinearRecurrence ℂ)
    (hE : LinearRecurrence.IsNondegenerate E) (hsep : E.charPoly.Separable) (u : ℕ → ℂ)
    (hu : E.IsSolution u) (hu₀ : u ≠ 0) : {h : ℕ | u h = 0}.Finite := by
  sorry

/-- `DT.2/uniform-bound-zeros-simple-recurrence` (Evertse–Schlickewei–Schmidt Theorem 1.2):
the zero set of a simple recurrence of order `n ≥ 3` is a union of at most `exp((6n)^{3n})`
points and arithmetic progressions. -/
theorem zeros_simple_recurrence_eq_union {K : Type*} [Field K] [IsAlgClosed K] [CharZero K]
    {n : ℕ} (hn : 3 ≤ n) (a α : Fin n → K) (ha : ∀ i, a i ≠ 0) (hα : ∀ i, α i ≠ 0)
    (hinj : Function.Injective α) :
    ∃ (q₁ q₂ : ℕ) (k : Fin q₁ → ℤ) (b v : Fin q₂ → ℤ), (∀ i, v i ≠ 0) ∧
      ((q₁ + q₂ : ℕ) : ℝ) ≤ Real.exp ((6 * n : ℝ) ^ (3 * n)) ∧
      {m : ℤ | ∑ i, a i * α i ^ m = 0} =
        Set.range k ∪ ⋃ i, {m : ℤ | ∃ t : ℤ, m = b i + t * v i} := by
  sorry

/-- `DT.2/uniform-bound-zeros-simple-recurrence`, non-degenerate case. -/
theorem ncard_zeros_simple_recurrence_le {K : Type*} [Field K] [IsAlgClosed K] [CharZero K]
    {n : ℕ} (hn : 3 ≤ n) (a α : Fin n → K) (ha : ∀ i, a i ≠ 0) (hα : ∀ i, α i ≠ 0)
    (hnd : ∀ i j, i ≠ j → ¬ IsOfFinOrder (α i / α j)) :
    {m : ℤ | ∑ i, a i * α i ^ m = 0}.Finite ∧
      ({m : ℤ | ∑ i, a i * α i ^ m = 0}.ncard : ℝ) ≤ Real.exp ((6 * n : ℝ) ^ (3 * n)) := by
  sorry

/-! ## Twisted heights (Evertse–Ferretti) -/

section TwistedHeight

variable {K : Type*} [Field K] [NumberField K]

/-- The places of a number field. -/
abbrev Place (K : Type*) [Field K] [NumberField K] := InfinitePlace K ⊕ FinitePlace K

/-- The normalised absolute value `‖x‖_v` of Evertse–Ferretti §1.1. -/
def normAbs : Place K → K → ℝ
  | .inl w, x => w x ^ ((w.mult : ℝ) / Module.finrank ℚ K)
  | .inr v, x => v x ^ ((1 : ℝ) / Module.finrank ℚ K)

variable {n : ℕ}

open Classical in
/-- `DT.2/twisted-height`: `H_{L,c,Q}(x) = ∏_v max_i ‖L_i^{(v)}(x)‖_v Q^{-c_{iv}}` on `K^n`,
with `H(0) = 0` (Evertse–Ferretti's convention; the `finprod` would give the junk value `1`). -/
def twistedHeight (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) (Q : ℝ)
    (x : Fin n → K) : ℝ :=
  if x = 0 then 0 else ∏ᶠ v, ⨆ i, normAbs v (L v i ⬝ᵥ x) * Q ^ (-(c v i))

/-- The coordinate forms at every place. -/
def coordForms (K : Type*) [Field K] [NumberField K] (n : ℕ) : Place K → Fin n → Fin n → K :=
  fun _ i ↦ Pi.single i 1

theorem twistedHeight_zero [NeZero n] (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (Q : ℝ) : twistedHeight L c Q 0 = 0 := by
  sorry

theorem twistedHeight_pos (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ)
    (hL : ∀ v, LinearIndependent K (L v)) (hfin : (Set.range L).Finite)
    (hc : {v | c v ≠ 0}.Finite) {Q : ℝ} (hQ : 1 ≤ Q) {x : Fin n → K} (hx : x ≠ 0) :
    0 < twistedHeight L c Q x := by
  sorry

theorem twistedHeight_smul (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ)
    (hL : ∀ v, LinearIndependent K (L v)) (hfin : (Set.range L).Finite)
    (hc : {v | c v ≠ 0}.Finite) (Q : ℝ) (x : Fin n → K) {a : K} (ha : a ≠ 0) :
    twistedHeight L c Q (a • x) = twistedHeight L c Q x := by
  sorry

theorem twistedHeight_coords_zero (Q : ℝ) {x : Fin n → K} (hx : x ≠ 0) :
    twistedHeight (coordForms K n) 0 Q x =
      Height.mulHeight x ^ ((1 : ℝ) / Module.finrank ℚ K) := by
  sorry

theorem twistedHeight_shift (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ)
    (hL : ∀ v, LinearIndependent K (L v)) (hfin : (Set.range L).Finite)
    (hc : {v | c v ≠ 0}.Finite) (θ : Place K → ℝ) (hθ : {v | θ v ≠ 0}.Finite) {Q : ℝ}
    (hQ : 0 < Q) (x : Fin n → K) :
    twistedHeight L (fun v i ↦ c v i - θ v) Q x = Q ^ (∑ᶠ v, θ v) * twistedHeight L c Q x := by
  sorry

theorem twistedHeight_comp (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ)
    (hL : ∀ v, LinearIndependent K (L v)) (hfin : (Set.range L).Finite)
    (hc : {v | c v ≠ 0}.Finite) (φ : (Fin n → K) ≃ₗ[K] (Fin n → K)) (Q : ℝ) (x : Fin n → K) :
    twistedHeight (fun v i ↦ fun j ↦ L v i ⬝ᵥ φ (Pi.single j 1)) c Q x =
      twistedHeight L c Q (φ x) := by
  sorry

theorem twistedHeight_one (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ)
    {x : Fin n → K} (hx : x ≠ 0) :
    twistedHeight L c 1 x = ∏ᶠ v, ⨆ i, normAbs v (L v i ⬝ᵥ x) := by
  sorry

-- unit tests
/-- Exponents of the unit tests over `ℚ`: `c_∞ = (1/2, -1/2)`, `0` at the primes. -/
def cExample (a : ℝ) : Place ℚ → Fin 2 → ℝ
  | .inl _, i => if i = 0 then a else -a
  | .inr _, _ => 0

example {Q : ℝ} (hQ : 1 ≤ Q) :
    twistedHeight (coordForms ℚ 2) (cExample (1 / 2)) Q ![1, 0] = Q ^ (-(1 / 2 : ℝ)) := by
  sorry -- twistedHeight_rat_example

example (L : Place K → Fin n → Fin n → K) (c c' : Place K → Fin n → ℝ) (x : Fin n → K) :
    twistedHeight L c 1 x = twistedHeight L c' 1 x := by
  sorry -- twistedHeight_at_one

example (x : Fin n → ℤ) (hx : Finset.univ.gcd x = 1) (Q : ℝ) :
    twistedHeight (coordForms ℚ n) 0 Q (fun j ↦ (x j : ℚ)) = ⨆ i, |(x i : ℝ)| := by
  sorry -- twistedHeight_coords_rat

example (Q : ℝ) :
    twistedHeight (coordForms ℚ 2) 0 Q ((2 : ℚ) • ![1, 0]) =
      twistedHeight (coordForms ℚ 2) 0 Q ![1, 0] := by
  sorry -- twistedHeight_smul_two

/-- `DT.2/successive-infima-of-twisted-height` (`K`-rational prototype of Evertse–Ferretti §9). -/
def successiveInfimum (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) (Q : ℝ)
    (i : ℕ) : ℝ :=
  sInf {t : ℝ | 0 ≤ t ∧
    i ≤ Module.finrank K (Submodule.span K {x | twistedHeight L c Q x ≤ t})}

/-- The space `T_i(Q) = ⋂_{t > λ_i(Q)} span {x | H(x) ≤ t}`. -/
def infimumSpace (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) (Q : ℝ)
    (i : ℕ) : Submodule K (Fin n → K) :=
  ⨅ (t : ℝ) (_ : successiveInfimum L c Q i < t), Submodule.span K {x | twistedHeight L c Q x ≤ t}

theorem successiveInfimum_mono (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ)
    (Q : ℝ) {i j : ℕ} (hij : i ≤ j) (hj : j ≤ n) :
    successiveInfimum L c Q i ≤ successiveInfimum L c Q j := by
  sorry

theorem successiveInfimum_nonneg (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ)
    (Q : ℝ) (i : ℕ) : 0 ≤ successiveInfimum L c Q i := by
  sorry

theorem finrank_infimumSpace_of_lt (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (Q : ℝ) {k : ℕ} (hk : k < n)
    (hlt : successiveInfimum L c Q k < successiveInfimum L c Q (k + 1)) :
    Module.finrank K (infimumSpace L c Q k) = k := by
  sorry

theorem successiveInfimum_coords_zero (Q : ℝ) {i : ℕ} (hi₁ : 1 ≤ i) (hi : i ≤ n) :
    successiveInfimum (coordForms K n) 0 Q i = 1 := by
  sorry

-- unit tests
example (Q : ℝ) {i : ℕ} (hi₁ : 1 ≤ i) (hi : i ≤ n) :
    successiveInfimum (coordForms ℚ n) 0 Q i = 1 := by sorry -- successiveInfimum_coords

example (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) (Q : ℝ) :
    successiveInfimum L c Q 0 = 0 := by sorry -- successiveInfimum_zero_index

example {Q : ℝ} (hQ : 1 ≤ Q) :
    successiveInfimum (coordForms ℚ 2) (cExample (1 / 2)) Q 1 = Q ^ (-(1 / 2 : ℝ)) ∧
      successiveInfimum (coordForms ℚ 2) (cExample (1 / 2)) Q 2 = Q ^ (1 / 2 : ℝ) := by
  sorry -- successiveInfimum_rat_example

example {Q : ℝ} (hQ : 1 < Q) :
    successiveInfimum (coordForms ℚ 2) (cExample (1 / 2)) Q 2 ≠
      successiveInfimum (coordForms ℚ 2) (cExample (1 / 2)) Q 1 := by
  sorry -- successiveInfimum_not_first_only

/-- `DT.2/height-of-linear-subspace`: the height `H_2` of a vector. -/
def height2 {ι : Type*} [Fintype ι] (y : ι → K) : ℝ :=
  (∏ w : InfinitePlace K,
      (∑ i, ‖w.embedding (y i)‖ ^ 2) ^ ((w.mult : ℝ) / (2 * Module.finrank ℚ K))) *
    ∏ᶠ v : FinitePlace K, (⨆ i, v (y i)) ^ ((1 : ℝ) / Module.finrank ℚ K)

/-- Plücker coordinates: the `p × p` minors of the matrix with rows `x i`. -/
def plucker {p : ℕ} (x : Fin p → Fin n → K) : {s : Finset (Fin n) // s.card = p} → K :=
  fun s ↦ Matrix.det (Matrix.of fun i j ↦ x i (s.1.orderEmbOfFin s.2 j))

open Classical in
/-- `DT.2/height-of-linear-subspace`: `H_2(T)`. -/
def subspaceHeight (T : Submodule K (Fin n → K)) : ℝ :=
  if T = ⊥ ∨ T = ⊤ then 1 else
    height2 (plucker fun i : Fin (Module.finrank K T) ↦
      ((Module.finBasis K T i : T) : Fin n → K))

/-- The orthogonal complement for the dot product. -/
def dotOrthogonal (T : Submodule K (Fin n → K)) : Submodule K (Fin n → K) where
  carrier := {y | ∀ x ∈ T, y ⬝ᵥ x = 0}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

theorem subspaceHeight_bot : subspaceHeight (⊥ : Submodule K (Fin n → K)) = 1 := by
  sorry

theorem subspaceHeight_top : subspaceHeight (⊤ : Submodule K (Fin n → K)) = 1 := by
  sorry

theorem subspaceHeight_span_singleton (hn : 2 ≤ n) {x : Fin n → K} (hx : x ≠ 0) :
    subspaceHeight (K ∙ x) = height2 x := by
  sorry

theorem subspaceHeight_le_prod {p : ℕ} (x : Fin p → Fin n → K) (hx : LinearIndependent K x) :
    subspaceHeight (Submodule.span K (Set.range x)) ≤ ∏ i, height2 (x i) := by
  sorry

theorem subspaceHeight_orthogonal (T : Submodule K (Fin n → K)) :
    subspaceHeight (dotOrthogonal T) = subspaceHeight T := by
  sorry

theorem subspaceHeight_inf_mul_sup_le (T₁ T₂ : Submodule K (Fin n → K)) :
    subspaceHeight (T₁ ⊓ T₂) * subspaceHeight (T₁ ⊔ T₂) ≤
      subspaceHeight T₁ * subspaceHeight T₂ := by
  sorry

theorem one_le_subspaceHeight (T : Submodule K (Fin n → K)) : 1 ≤ subspaceHeight T := by
  sorry

theorem finite_subspaceHeight_le (B : ℝ) :
    {T : Submodule K (Fin n → K) | subspaceHeight T ≤ B}.Finite := by
  sorry

/-- For a rational subspace, `H_2(T)` is the Euclidean norm of the wedge of a `ℤ`-basis of
`T ∩ ℤ^n`, i.e. the covolume of that lattice (GeometryOfNumbersAndQuadraticArithmetic:GN.0). -/
theorem subspaceHeight_rat_eq_covolume (T : Submodule ℚ (Fin n → ℚ)) (hT : T ≠ ⊥) (p : ℕ)
    (b : Fin p → Fin n → ℤ) (hb : ∀ y : Fin n → ℤ, (fun j ↦ (y j : ℚ)) ∈ T ↔
      ∃ c : Fin p → ℤ, y = ∑ i, c i • b i) (hbi : LinearIndependent ℤ b) :
    subspaceHeight T =
      Real.sqrt (∑ s, ((plucker fun i j ↦ (b i j : ℚ)) s : ℝ) ^ 2) := by
  sorry

-- unit tests
example : subspaceHeight (ℚ ∙ (![1, 1] : Fin 2 → ℚ)) = √2 := by
  sorry -- subspaceHeight_line_one_one

example : subspaceHeight (⊥ : Submodule K (Fin n → K)) = 1 ∧
    subspaceHeight (⊤ : Submodule K (Fin n → K)) = 1 := by sorry -- subspaceHeight_bot_top

example {p : ℕ} (hp : p ≤ n) :
    subspaceHeight (Submodule.span ℚ
      (Set.range fun i : Fin p ↦ (Pi.single (Fin.castLE hp i) 1 : Fin n → ℚ))) = 1 := by
  sorry -- subspaceHeight_coordinate_plane

example : subspaceHeight (ℚ ∙ (![2, 2] : Fin 2 → ℚ)) = √2 := by
  sorry -- subspaceHeight_line_two_two

example : subspaceHeight (dotOrthogonal (ℚ ∙ (![1, 2, 2] : Fin 3 → ℚ))) = 3 := by
  sorry -- subspaceHeight_hyperplane

/-- `DT.2/weight-and-exceptional-subspace`: the local weight `w_v(U)`. -/
def localWeight (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) (v : Place K)
    (U : Submodule K (Fin n → K)) : ℝ :=
  sInf ((fun s : Finset (Fin n) ↦ ∑ i ∈ s, c v i) ''
    {s | s.card = Module.finrank K U ∧
      LinearIndependent K (fun i : s ↦ (Fintype.linearCombination K (L v i)).domRestrict U)})

/-- The weight `w(U) = Σ_v w_v(U)`. -/
def weight (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ)
    (U : Submodule K (Fin n → K)) : ℝ :=
  ∑ᶠ v, localWeight L c v U

/-- The normalised weight `(w(U) - w(K^n)) / (n - dim U)` maximised by the exceptional
subspace; it is `-µ(K^n, U)` in the notation of Evertse–Ferretti §15 and equals
`w(U) / (n - dim U)` under the normalisation (2.8). -/
def weightRatio (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ)
    (U : Submodule K (Fin n → K)) : ℝ :=
  (weight L c U - weight L c ⊤) / ((n : ℝ) - Module.finrank K U)

theorem exists_exceptionalSubspace [NeZero n] (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) :
    ∃ T : Submodule K (Fin n → K), T ≠ ⊤ ∧
      (∀ U, U ≠ ⊤ → weightRatio L c U ≤ weightRatio L c T) ∧
      ∀ T', T' ≠ ⊤ → (∀ U, U ≠ ⊤ → weightRatio L c U ≤ weightRatio L c T') →
        Module.finrank K T ≤ Module.finrank K T' := by
  sorry

/-- The exceptional subspace `T(L, c)` of Evertse–Ferretti (2.21). -/
def exceptionalSubspace [NeZero n] (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) : Submodule K (Fin n → K) :=
  Classical.choose (exists_exceptionalSubspace L c)

theorem weight_bot (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) :
    weight L c ⊥ = 0 := by
  sorry

theorem weight_top (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ)
    (hL : ∀ v, LinearIndependent K (L v)) :
    weight L c ⊤ = ∑ᶠ v, ∑ i, c v i := by
  sorry

theorem weight_inf_add_weight_sup (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (hL : ∀ v, LinearIndependent K (L v))
    (hc : {v | c v ≠ 0}.Finite) (U₁ U₂ : Submodule K (Fin n → K)) :
    weight L c U₁ + weight L c U₂ ≤ weight L c (U₁ ⊓ U₂) + weight L c (U₁ ⊔ U₂) := by
  sorry

theorem exceptionalSubspace_ne_top [NeZero n] (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) : exceptionalSubspace L c ≠ ⊤ :=
  (Classical.choose_spec (exists_exceptionalSubspace L c)).1

theorem exceptionalSubspace_spec [NeZero n] (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (U : Submodule K (Fin n → K)) (hU : U ≠ ⊤) :
    weightRatio L c U ≤ weightRatio L c (exceptionalSubspace L c) :=
  (Classical.choose_spec (exists_exceptionalSubspace L c)).2.1 U hU

theorem exceptionalSubspace_eq_bot_iff [NeZero n] (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (hL : ∀ v, LinearIndependent K (L v))
    (hc : {v | c v ≠ 0}.Finite) (hsum : ∀ v, ∑ i, c v i = 0) :
    exceptionalSubspace L c = ⊥ ↔ ∀ U, U ≠ ⊤ → weight L c U ≤ 0 := by
  sorry

theorem exceptionalSubspace_shift [NeZero n] (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (θ : Place K → ℝ) (hθ : {v | θ v ≠ 0}.Finite) :
    exceptionalSubspace L (fun v i ↦ c v i - θ v) = exceptionalSubspace L c := by
  sorry

theorem exceptionalSubspace_comp [NeZero n] (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (φ : (Fin n → K) ≃ₗ[K] (Fin n → K)) :
    exceptionalSubspace (fun v i ↦ fun j ↦ L v i ⬝ᵥ φ (Pi.single j 1)) c =
      (exceptionalSubspace L c).comap (φ : (Fin n → K) →ₗ[K] (Fin n → K)) := by
  sorry

theorem exceptionalSubspace_coords_sum [NeZero n] (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (hLi : ∀ v, LinearIndependent K (L v))
    (hc : {v | c v ≠ 0}.Finite) (hsum : ∀ v, ∑ i, c v i = 0)
    (hL : ∀ v i, L v i = (fun _ ↦ 1) ∨ ∃ k, L v i = Pi.single k 1) :
    ∃ (p : ℕ) (I : Fin p → Finset (Fin n)), Pairwise (fun a b ↦ Disjoint (I a) (I b)) ∧
      exceptionalSubspace L c =
        ⨅ a, LinearMap.ker (Fintype.linearCombination K fun j ↦ if j ∈ I a then (1 : K) else 0) := by
  sorry

-- unit tests
example [NeZero n] (L : Place K → Fin n → Fin n → K) (hL : ∀ v, LinearIndependent K (L v)) :
    exceptionalSubspace L 0 = ⊥ := by sorry -- exceptionalSubspace_c_zero

/-- Exponents `c_∞ = (-1, 1)` over `ℚ`. -/
def cExample' : Place ℚ → Fin 2 → ℝ := cExample (-1)

example : exceptionalSubspace (coordForms ℚ 2) cExample' = ℚ ∙ (![0, 1] : Fin 2 → ℚ) := by
  sorry -- exceptionalSubspace_rat_example

example : weight (coordForms ℚ 2) cExample' (ℚ ∙ (![1, 1] : Fin 2 → ℚ)) = -1 ∧
    weight (coordForms ℚ 2) cExample' (ℚ ∙ (![0, 1] : Fin 2 → ℚ)) = 1 := by
  sorry -- weight_rat_example_line

/-- Exponents `c_∞ = (-1, 0, 1)` over `ℚ`. -/
def cExample3 : Place ℚ → Fin 3 → ℝ
  | .inl _, i => (i : ℝ) - 1
  | .inr _, _ => 0

example : exceptionalSubspace (coordForms ℚ 3) cExample3 =
    Submodule.span ℚ {(![0, 1, 0] : Fin 3 → ℚ), ![0, 0, 1]} := by
  sorry -- exceptionalSubspace_not_max_weight

/-- `DT.2/twisted-height-filtration` (Evertse–Ferretti Lemma 15.4). -/
def twistedFiltration (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) :
    List (Submodule K (Fin n → K)) :=
  sorry

theorem twistedFiltration_head (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) :
    (twistedFiltration L c).head? = some ⊥ := by
  sorry

theorem twistedFiltration_last (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) :
    (twistedFiltration L c).getLast? = some ⊤ := by
  sorry

theorem twistedFiltration_chain (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) :
    List.IsChain (· < ·) (twistedFiltration L c) := by
  sorry

theorem twistedFiltration_penultimate [NeZero n] (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) :
    (twistedFiltration L c).dropLast.getLast? = some (exceptionalSubspace L c) := by
  sorry

theorem twistedFiltration_vertices [NeZero n] (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (U : Submodule K (Fin n → K)) :
    ∃ (l : ℕ) (hl : l + 1 < (twistedFiltration L c).length),
      Module.finrank K (twistedFiltration L c)[l] ≤ Module.finrank K U ∧
      Module.finrank K U ≤ Module.finrank K (twistedFiltration L c)[l + 1] ∧
      ((Module.finrank K (twistedFiltration L c)[l + 1] : ℝ) -
          Module.finrank K (twistedFiltration L c)[l]) * weight L c U ≤
        ((Module.finrank K (twistedFiltration L c)[l + 1] : ℝ) - Module.finrank K U) *
            weight L c (twistedFiltration L c)[l] +
          ((Module.finrank K U : ℝ) - Module.finrank K (twistedFiltration L c)[l]) *
            weight L c (twistedFiltration L c)[l + 1] := by
  sorry

theorem twistedFiltration_slope_antitone (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) {i : ℕ} (hi : i + 2 < (twistedFiltration L c).length) :
    (weight L c (twistedFiltration L c)[i + 2] - weight L c (twistedFiltration L c)[i + 1]) /
        ((Module.finrank K (twistedFiltration L c)[i + 2] : ℝ) -
          Module.finrank K (twistedFiltration L c)[i + 1]) <
      (weight L c (twistedFiltration L c)[i + 1] - weight L c (twistedFiltration L c)[i]) /
        ((Module.finrank K (twistedFiltration L c)[i + 1] : ℝ) -
          Module.finrank K (twistedFiltration L c)[i]) := by
  sorry

-- unit tests
example [NeZero n] (L : Place K → Fin n → Fin n → K) (hL : ∀ v, LinearIndependent K (L v)) :
    twistedFiltration L 0 = [⊥, ⊤] := by sorry -- twistedFiltration_c_zero

example : twistedFiltration (coordForms ℚ 2) cExample' = [⊥, ℚ ∙ (![0, 1] : Fin 2 → ℚ), ⊤] := by
  sorry -- twistedFiltration_rat_example

example (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) :
    (twistedFiltration L c).length ≤ n + 1 := by sorry -- twistedFiltration_length_le

example (hn : 2 ≤ n) (L : Place K → Fin n → Fin n → K) (hL : ∀ v, LinearIndependent K (L v)) :
    (twistedFiltration L 0).length ≠ n + 1 := by sorry -- twistedFiltration_not_complete_flag

/-! ### Theorems of Evertse–Ferretti, `K`-rational forms
Standing hypotheses (2.4)–(2.10) are spelled out. `Δ_L` and `H_L` are written explicitly. -/

/-- `Δ_L = ∏_v ‖det(L^{(v)})‖_v`. -/
def deltaL (L : Place K → Fin n → Fin n → K) : ℝ :=
  ∏ᶠ v, normAbs v (Matrix.of fun i j ↦ L v i j).det

/-- The conditions (2.4)–(2.9) on `(L, c)`. -/
structure IsTwistedData (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) : Prop where
  two_le : 2 ≤ n
  linearIndependent : ∀ v, LinearIndependent K (L v)
  finite_forms : (Set.range L).Finite
  finite_support : {v | c v ≠ 0}.Finite
  sum_eq_zero : ∀ v, ∑ i, c v i = 0
  sum_max_le_one : ∑ᶠ v, (⨆ i, c v i) ≤ 1

/-- `DT.2/twisted-height-gap-principle` (Evertse–Ferretti Proposition 4.2), `K`-rational. -/
theorem exists_subspace_gap_principle (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (hLc : IsTwistedData L c) {δ A : ℝ} (hδ : 0 < δ) (hδ1 : δ ≤ 1)
    (hA : (n : ℝ) ^ (1 / δ) ≤ A) :
    ∃ T₀ : Submodule K (Fin n → K), T₀ ≠ ⊤ ∧ ∀ Q, A ≤ Q → Q < A ^ (1 + δ / 2) →
      {x | twistedHeight L c Q x ≤ deltaL L ^ ((1 : ℝ) / n) * Q ^ (-δ)} ⊆ T₀ := by
  sorry

/-- `DT.2/parametric-subspace-theorem` (Evertse–Ferretti Theorem 2.1), `K`-rational and
qualitative in `Q_0`. -/
theorem parametric_subspace_theorem (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (hLc : IsTwistedData L c) {δ : ℝ} (hδ : 0 < δ) (hδ1 : δ ≤ 1)
    (R : ℕ) (hR : Nat.card (Set.range fun p : Place K × Fin n ↦ L p.1 p.2) ≤ R) :
    ∃ (Q₀ : ℝ) (T : Finset (Submodule K (Fin n → K))), (∀ V ∈ T, V ≠ ⊤) ∧
      (T.card : ℝ) ≤ 10 ^ 6 * 2 ^ (2 * n) * (n : ℝ) ^ 10 * δ ^ (-3 : ℝ) *
        Real.log (3 * R / δ) * Real.log (Real.log (3 * R) / δ) ∧
      ∀ Q, Q₀ ≤ Q → ∃ V ∈ T,
        {x | twistedHeight L c Q x ≤ deltaL L ^ ((1 : ℝ) / n) * Q ^ (-δ)} ⊆ V := by
  sorry

/-- `DT.2/interval-result` (Evertse–Ferretti Theorem 2.3), `K`-rational and qualitative. -/
theorem interval_result [NeZero n] (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (hLc : IsTwistedData L c) {δ : ℝ} (hδ : 0 < δ) (hδ1 : δ ≤ 1)
    (R : ℕ) (hR : Nat.card (Set.range fun p : Place K × Fin n ↦ L p.1 p.2) ≤ R) :
    ∃ (C₀ : ℝ) (m : ℕ) (Qs : Fin m → ℝ),
      (m : ℝ) ≤ 10 ^ 5 * 2 ^ (2 * n) * (n : ℝ) ^ 10 * δ ^ (-2 : ℝ) * Real.log (3 * R / δ) ∧
      (∀ h, C₀ ≤ Qs h) ∧
      ∀ Q, 1 ≤ Q →
        ¬ {x | twistedHeight L c Q x ≤ deltaL L ^ ((1 : ℝ) / n) * Q ^ (-δ)} ⊆
            (exceptionalSubspace L c : Set (Fin n → K)) →
          Q < C₀ ∨ ∃ h, Qs h ≤ Q ∧ Q < Qs h ^ (Real.log (3 * R) / δ) := by
  sorry

/-- `DT.2/interval-result-semistable-case` (Evertse–Ferretti Theorem 8.1), `K`-rational,
with `v₀` the non-archimedean place of (8.8). -/
theorem interval_result_semistable [NeZero n] (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (hLc : IsTwistedData L c) {δ : ℝ} (hδ : 0 < δ) (hδ1 : δ ≤ 1)
    (R : ℕ) (hnR : n ≤ R) (hR : Nat.card (Set.range fun p : Place K × Fin n ↦ L p.1 p.2) ≤ R)
    (v₀ : FinitePlace K) (hv₀ : c (.inr v₀) = 0 ∧ L (.inr v₀) = coordForms K n (.inr v₀))
    (hss : exceptionalSubspace L c = ⊥) :
    let m₂ : ℕ := ⌊61 * (n : ℝ) ^ 6 * 2 ^ (2 * n) * δ ^ (-2 : ℝ) *
      Real.log (22 * (n : ℝ) ^ 2 * 2 ^ n * R / δ)⌋₊
    ∃ (C₂ : ℝ) (Qs : Fin m₂ → ℝ), (∀ h, C₂ ≤ Qs h) ∧
      ∀ Q, 1 ≤ Q → {x | twistedHeight L c Q x ≤ Q ^ (-δ)} ≠ {0} →
        Q < C₂ ∨ ∃ h, Qs h ≤ Q ∧ Q < Qs h ^ ((m₂ : ℝ) ^ (5 / 2 : ℝ)) := by
  sorry

/-- `DT.2/height-bound-for-filtration-subspaces` (Evertse–Ferretti Proposition 17.5). -/
theorem subspaceHeight_twistedFiltration_le [NeZero n] (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (hL : ∀ v, LinearIndependent K (L v))
    (hfin : (Set.range L).Finite) (hc : {v | c v ≠ 0}.Finite) (H : ℝ)
    (hH : ∀ v i, height2 (L v i) ≤ H) (T : Submodule K (Fin n → K))
    (hT : T ∈ twistedFiltration L c) : subspaceHeight T ≤ H ^ (4 ^ n) := by
  sorry

/-- `DT.2/sharp-roths-lemma` (Evertse 1995), `K`-rational, with absolute heights
`H = (Height.mulHeight)^{1/[K:ℚ]}`: `F` has index `< mΘ` at `x`, i.e.
some partial derivative `∂^i F` with `Σ_h (i_{h0} + i_{h1}) / d_h < mΘ` does not vanish at `x`
(dividing by factorials does not affect non-vanishing in characteristic zero). -/
theorem sharp_roths_lemma {m : ℕ} (hm : 2 ≤ m) (d : Fin m → ℕ) (hd : ∀ h, 0 < d h) {Θ : ℝ}
    (hΘ : 0 < Θ) (hΘ1 : Θ ≤ 1)
    (hdd : ∀ h h' : Fin m, h'.val = h.val + 1 → 2 * (m : ℝ) ^ 2 / Θ ≤ (d h : ℝ) / d h')
    (F : MvPolynomial (Fin m × Fin 2) K) (hF : F ≠ 0)
    (hFh : ∀ μ ∈ F.support, ∀ h, μ (h, 0) + μ (h, 1) = d h) (x : Fin m → Fin 2 → K)
    (hx : ∀ h, x h ≠ 0)
    (hH : ∀ h, (Real.exp (∑ h, (d h : ℝ)) *
        Height.mulHeight (fun μ : F.support ↦ F.coeff μ) ^ ((1 : ℝ) / Module.finrank ℚ K)) ^
          ((3 * (m : ℝ) ^ 2 / Θ) ^ m) ≤
        (Height.mulHeight (x h) ^ ((1 : ℝ) / Module.finrank ℚ K)) ^ d h) :
    ∃ i : Fin m × Fin 2 → ℕ, ∑ h, ((i (h, 0) + i (h, 1) : ℕ) : ℝ) / d h < m * Θ ∧
      MvPolynomial.eval (fun p ↦ x p.1 p.2)
        (((Finset.univ : Finset (Fin m × Fin 2)).toList.map fun p ↦
          (MvPolynomial.pderiv p).toLinearMap ^ i p).prod F) ≠ 0 := by
  sorry

/-- `DT.2/bombieri-vaaler-siegel-lemma` (Evertse–Ferretti Lemma 13.1). -/
theorem exists_ne_zero_height2_le {U V : ℕ} (hUV : U < V) (hU : 0 < U)
    (L : Fin U → Fin V → K) (hL : ∀ i, L i ≠ 0) :
    ∃ x : Fin V → K, x ≠ 0 ∧ (∀ i, L i ⬝ᵥ x = 0) ∧
      height2 x ≤ Real.sqrt V * |(NumberField.discr K : ℝ)| ^ ((1 : ℝ) / (2 * Module.finrank ℚ K)) *
        (∏ i, height2 (L i)) ^ ((1 : ℝ) / (V - U)) := by
  sorry

/-- `DT.2/nonvanishing-on-grids` (Evertse–Ferretti Proposition 12.1; Evertse 1996 Lemma 26),
`K`-rational: some divided derivative with small weighted order does not vanish at grid points of
the hyperplanes `T_h` (for any choice of bases of the `T_h`). -/
theorem nonvanishing_on_grids {m N : ℕ} (hm : 2 ≤ m) (hN : 2 ≤ N) {ε : ℝ} (hε : 0 < ε)
    (hε1 : ε ≤ 1) (r : Fin m → ℕ) (hr : ∀ h, 0 < r h)
    (hrr : ∀ h h' : Fin m, h'.val = h.val + 1 → 2 * (m : ℝ) ^ 2 / ε ≤ (r h : ℝ) / r h')
    (P : MvPolynomial (Fin m × Fin N) K) (hP : P ≠ 0)
    (hPh : ∀ μ ∈ P.support, ∀ h, ∑ l, μ (h, l) = r h)
    (T : Fin m → Submodule K (Fin N → K)) (hT : ∀ h, Module.finrank K (T h) = N - 1)
    (hH : ∀ h, (Real.exp (∑ h, (r h : ℝ)) * height2 (fun μ : P.support ↦ P.coeff μ)) ^
        ((N - 1 : ℝ) * (3 * (m : ℝ) ^ 2 / ε) ^ m) ≤ subspaceHeight (T h) ^ r h)
    (b : (h : Fin m) → Fin (N - 1) → Fin N → K)
    (hb : ∀ h, LinearIndependent K (b h) ∧ Submodule.span K (Set.range (b h)) = T h) :
    ∃ (z : Fin m → Fin (N - 1) → ℤ) (i : Fin m × Fin N → ℕ),
      (∀ h, z h ≠ 0 ∧ ∀ j, ((z h j).natAbs : ℝ) ≤ N / ε) ∧
      ∑ h, (∑ l, (i (h, l) : ℝ)) / r h ≤ 2 * m * ε ∧
      MvPolynomial.eval (fun p ↦ ∑ j, (z p.1 j : K) * b p.1 j p.2)
        (((Finset.univ : Finset (Fin m × Fin N)).toList.map fun p ↦
          (MvPolynomial.pderiv p).toLinearMap ^ i p).prod P) ≠ 0 := by
  sorry

open Classical in
/-- The exponents `c` of Evertse–Ferretti (5.2) attached to a system with exponents `d` on the
set of places `S` (base field `K' = K`, forms over `K`). -/
def systemExponents (S : Finset (Place K)) (d : Place K → Fin n → ℝ) (ε : ℝ) :
    Place K → Fin n → ℝ :=
  fun v i ↦ if v ∈ S then (n / (n + ε)) * (d v i - (1 / n) * ∑ j, d v j) else 0

open Classical in
/-- The forms of Evertse–Ferretti (5.1): `L` on `S`, the coordinates elsewhere. -/
def systemForms (S : Finset (Place K)) (L : Place K → Fin n → Fin n → K) :
    Place K → Fin n → Fin n → K :=
  fun v ↦ if v ∈ S then L v else coordForms K n v

/-- `DT.2/twisted-height-of-system-solutions` (Evertse–Ferretti Lemma 5.1), for forms and points
over `K`. -/
theorem twistedHeight_le_of_system [NeZero n] (S : Finset (Place K))
    (L : Place K → Fin n → Fin n → K) (hL : ∀ v ∈ S, LinearIndependent K (L v))
    (d : Place K → Fin n → ℝ) {ε : ℝ} (hε : 0 < ε) (hε1 : ε ≤ 1)
    (hd : ∑ v ∈ S, ∑ i, d v i = -(n : ℝ) - ε) (hd0 : ∀ v ∈ S, ∀ i, d v i ≤ 0)
    (x : Fin n → K) (hx : x ≠ 0)
    (hsys : ∀ v ∈ S, ∀ i, normAbs v (L v i ⬝ᵥ x) ≤
      (⨆ j, normAbs v (x j)) * normAbs v (Matrix.of fun i j ↦ L v i j).det ^ ((1 : ℝ) / n) *
        (Height.mulHeight x ^ ((1 : ℝ) / Module.finrank ℚ K)) ^ d v i) :
    twistedHeight (systemForms S L) (systemExponents S d ε)
        ((Height.mulHeight x ^ ((1 : ℝ) / Module.finrank ℚ K)) ^ (1 + ε / n)) x ≤
      deltaL (systemForms S L) ^ ((1 : ℝ) / n) *
        ((Height.mulHeight x ^ ((1 : ℝ) / Module.finrank ℚ K)) ^ (1 + ε / n)) ^ (-(ε / (n + ε))) := by
  sorry

/-- `DT.2/absolute-subspace-theorem-for-systems` (Evertse–Ferretti Theorem 3.1), for forms and
points over `K` (`D = 1`); `H^*` bounds the absolute heights of `(1, α_1, …, α_n)`. -/
theorem subspace_theorem_for_systems [NeZero n] (hn : 2 ≤ n) (S : Finset (Place K))
    (L : Place K → Fin n → Fin n → K) (hL : ∀ v ∈ S, LinearIndependent K (L v))
    (d : Place K → Fin n → ℝ) {ε : ℝ} (hε : 0 < ε) (hε1 : ε ≤ 1)
    (hd : ∑ v ∈ S, ∑ i, d v i = -(n : ℝ) - ε) (hd0 : ∀ v ∈ S, ∀ i, d v i ≤ 0)
    (R : ℕ) (hR : Nat.card (Set.range fun p : S × Fin n ↦ L p.1 p.2) ≤ R) (Hs : ℝ)
    (hHs : ∀ v ∈ S, ∀ i, Height.mulHeight (Fin.cons 1 (L v i) : Fin (n + 1) → K) ^
      ((1 : ℝ) / Module.finrank ℚ K) ≤ Hs) :
    ∃ T : Finset (Submodule K (Fin n → K)), (∀ V ∈ T, V ≠ ⊤) ∧
      (T.card : ℝ) ≤ 10 ^ 9 * 2 ^ (2 * n) * (n : ℝ) ^ 14 * ε ^ (-3 : ℝ) *
        Real.log (3 * R / ε) * Real.log (Real.log (3 * R) / ε) ∧
      ∀ x : Fin n → K, x ≠ 0 →
        max (Hs ^ ((1 : ℝ) / (3 * R))) ((n : ℝ) ^ ((n : ℝ) / ε)) ≤
          Height.mulHeight x ^ ((1 : ℝ) / Module.finrank ℚ K) →
        (∀ v ∈ S, ∀ i, normAbs v (L v i ⬝ᵥ x) ≤
          (⨆ j, normAbs v (x j)) * normAbs v (Matrix.of fun i j ↦ L v i j).det ^ ((1 : ℝ) / n) *
            (Height.mulHeight x ^ ((1 : ℝ) / Module.finrank ℚ K)) ^ d v i) →
        ∃ V ∈ T, x ∈ V := by
  sorry

/-- `DT.2/faltings-wustholz-interval-refinement` (Evertse–Ferretti Theorem 3.3), for forms and
points over `K`; the effective computability of `T` is not expressible here and is omitted. -/
theorem exists_subspace_interval_refinement [NeZero n] (hn : 2 ≤ n) (S : Finset (Place K))
    (L : Place K → Fin n → Fin n → K) (hL : ∀ v ∈ S, LinearIndependent K (L v))
    (d : Place K → Fin n → ℝ) {ε : ℝ} (hε : 0 < ε) (hε1 : ε ≤ 1)
    (hd : ∑ v ∈ S, ∑ i, d v i = -(n : ℝ) - ε) (hd0 : ∀ v ∈ S, ∀ i, d v i ≤ 0) :
    ∃ (T : Submodule K (Fin n → K)) (C₁ : ℝ) (m : ℕ) (Hs : Fin m → ℝ), T ≠ ⊤ ∧
      ∀ x : Fin n → K, x ≠ 0 →
        (∀ v ∈ S, ∀ i, normAbs v (L v i ⬝ᵥ x) ≤
          (⨆ j, normAbs v (x j)) * normAbs v (Matrix.of fun i j ↦ L v i j).det ^ ((1 : ℝ) / n) *
            (Height.mulHeight x ^ ((1 : ℝ) / Module.finrank ℚ K)) ^ d v i) →
        x ∈ T ∨ Height.mulHeight x ^ ((1 : ℝ) / Module.finrank ℚ K) < C₁ ∨
          ∃ h, Hs h ≤ Height.mulHeight x ^ ((1 : ℝ) / Module.finrank ℚ K) ∧
            Height.mulHeight x ^ ((1 : ℝ) / Module.finrank ℚ K) <
              Hs h ^ (3 * n / ε * Real.log (3 * Nat.card (Set.range fun p : S × Fin n ↦ L p.1 p.2))) := by
  sorry

end TwistedHeight

end DiophantineApproximation

/-! ################################################################
  Stage DT.3
################################################################ -/

/-!
# Suggested Lean forms for `DiophantineApproximationAndTranscendence:DT.3`
# (Transcendence and logarithmic forms)

This file is not the roadmap and is not exhaustive: the roadmap document is definitive.
The statements below suggest Lean forms so that contributors and reviewers converge on
names and signatures. Every proof is `sorry`; nothing here claims an implementation.

Namespaces: `Transcendence` (logarithms of algebraic numbers, general tools, Gelfond-Schneider,
Baker), `LindemannWeierstrass` (Evertse's route to the Lindemann-Weierstrass theorem),
the root namespace for the statements whose names and signatures follow the open Mathlib pull
request #28013 and the Karatarakis-Wiedijk formalization, `GelfondSchneider` (the two proofs of
Gelfond-Schneider), `Baker` (the Schneider-Lang criterion for Cartesian products) and
`LogarithmicForms` (the explicit lower bounds).

Conventions: a logarithm of `α` is any `λ` with `exp λ = α`; `Complex.log` is the principal
branch (`arg ∈ (-π, π]`); `ℚ̄` is `integralClosure ℚ ℂ`.
-/

noncomputable section

open Complex Polynomial

/-! ## Logarithms of algebraic numbers and shared tools -/

namespace Transcendence

/-- The `ℚ`-vector space `𝓛 = {λ : exp λ is algebraic}` of logarithms of algebraic numbers
(any branch). -/
def algebraicLogs : Submodule ℚ ℂ where
  carrier := {l | IsAlgebraic ℚ (exp l)}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

theorem mem_algebraicLogs {l : ℂ} : l ∈ algebraicLogs ↔ IsAlgebraic ℚ (exp l) := Iff.rfl

theorem log_mem_algebraicLogs {α : ℂ} (hα : IsAlgebraic ℚ α) (h0 : α ≠ 0) :
    Complex.log α ∈ algebraicLogs := sorry

theorem mem_algebraicLogs_iff_exists_int {l : ℂ} :
    l ∈ algebraicLogs ↔
      ∃ α : ℂ, IsAlgebraic ℚ α ∧ α ≠ 0 ∧ ∃ k : ℤ, l = Complex.log α + k * (2 * Real.pi * I) :=
  sorry

theorem intCast_mul_two_pi_I_mem_algebraicLogs (k : ℤ) :
    (k : ℂ) * (2 * Real.pi * I) ∈ algebraicLogs := sorry

theorem conj_mem_algebraicLogs {l : ℂ} (hl : l ∈ algebraicLogs) :
    (starRingEnd ℂ) l ∈ algebraicLogs := sorry

theorem ofReal_log_mem_algebraicLogs {q : ℚ} (hq : 0 < q) :
    ((Real.log q : ℝ) : ℂ) ∈ algebraicLogs := sorry

/-- Unit test `Transcendence.zero_mem_algebraicLogs`: (degenerate) 0 ∈ algebraicLogs. -/
example : (0 : ℂ) ∈ algebraicLogs := sorry

/-- Unit test `Transcendence.pi_mul_I_mem_algebraicLogs`: (computation) π·i ∈ algebraicLogs, since
exp(πi) = −1. -/
example : (Real.pi : ℂ) * I ∈ algebraicLogs := sorry

/-- Unit test `Transcendence.two_pi_I_mem_algebraicLogs_not_mem_range_log`: (non-example) 2πi ∈
algebraicLogs but 2πi ∉ Set.range Complex.log: a definition by principal logarithms only is
wrong. -/
example : 2 * (Real.pi : ℂ) * I ∈ algebraicLogs ∧ 2 * (Real.pi : ℂ) * I ∉ Set.range Complex.log :=
  sorry

/-- Unit test `Transcendence.ofReal_log_two_mem_algebraicLogs`: (compatibility) ((Real.log 2 : ℝ) :
ℂ) ∈ algebraicLogs, and it equals Complex.log 2. -/
example : ((Real.log 2 : ℝ) : ℂ) ∈ algebraicLogs ∧ ((Real.log 2 : ℝ) : ℂ) = Complex.log 2 := sorry

/-- Unit test `Transcendence.one_not_mem_algebraicLogs`: (non-example) 1 ∉ algebraicLogs (exp 1 = e
is transcendental, DiophantineApproximationAndTranscendence:DT.3/hermite-transcendence-of-e): 𝓛 is
not the set of algebraic numbers. -/
example : (1 : ℂ) ∉ algebraicLogs := sorry

/-- A finite set of algebraic numbers lies in a finite Galois subfield of `ℂ`. -/
theorem exists_isGalois_superset (S : Finset ℂ) (hS : ∀ s ∈ S, IsAlgebraic ℚ s) :
    ∃ L : IntermediateField ℚ ℂ, FiniteDimensional ℚ L ∧ IsGalois ℚ L ∧ ∀ s ∈ S, s ∈ L :=
  sorry

/-- Evertse, Lemma 3.6, inside a Galois subfield of `ℂ`. -/
theorem exists_one_le_norm_algEquiv (L : IntermediateField ℚ ℂ) [FiniteDimensional ℚ L]
    [IsGalois ℚ L] {x : L} (hx : IsIntegral ℤ x) (h0 : x ≠ 0) :
    ∃ τ : L ≃ₐ[ℚ] L, 1 ≤ ‖((τ x : L) : ℂ)‖ := sorry

/-- The size inequality (fundamental inequality of transcendence). -/
theorem one_le_pow_mul_norm_mul_house_pow {K : Type*} [Field K] [NumberField K]
    (σ : K →+* ℂ) {x : K} (hx : x ≠ 0) {m : ℕ} (hm : 0 < m) (hint : IsIntegral ℤ ((m : K) * x)) :
    1 ≤ (m : ℝ) ^ Module.finrank ℚ K * ‖σ x‖ *
      NumberField.house x ^ (Module.finrank ℚ K - 1) := sorry

end Transcendence

/-! ## Hermite and Lindemann-Weierstrass (Evertse §4.1-4.2) -/

/-- Hermite's theorem (Evertse Theorem 4.1); name and form as in Mathlib PR #28013. -/
theorem transcendental_e : Transcendental ℤ (exp 1) := sorry

namespace LindemannWeierstrass

/-- Hermite's integral `F_f(z) = ∫₀^z e^{z-u} f(u) du` along the segment. -/
def hermiteIntegral (f : ℂ[X]) (z : ℂ) : ℂ :=
  z * ∫ t in (0 : ℝ)..1, exp (z * (1 - t)) * f.eval (z * t)

theorem hermiteIntegral_eq_sumIDeriv (f : ℂ[X]) (z : ℂ) :
    hermiteIntegral f z = exp z * (sumIDeriv f).eval 0 - (sumIDeriv f).eval z := sorry

theorem norm_hermiteIntegral_le (f : ℂ[X]) (z : ℂ) {C : ℝ}
    (hC : ∀ u : ℂ, ‖u‖ ≤ ‖z‖ → ‖f.eval u‖ ≤ C) :
    ‖hermiteIntegral f z‖ ≤ ‖z‖ * Real.exp ‖z‖ * C := sorry

theorem hermiteIntegral_add (f g : ℂ[X]) (z : ℂ) :
    hermiteIntegral (f + g) z = hermiteIntegral f z + hermiteIntegral g z := sorry

theorem hermiteIntegral_smul (c : ℂ) (f : ℂ[X]) (z : ℂ) :
    hermiteIntegral (c • f) z = c • hermiteIntegral f z := sorry

theorem hermiteIntegral_zero_right (f : ℂ[X]) : hermiteIntegral f 0 = 0 := sorry

theorem hermiteIntegral_C (c z : ℂ) : hermiteIntegral (C c) z = c * (exp z - 1) := sorry

/-- Unit test `LindemannWeierstrass.hermiteIntegral_one`: (computation) hermiteIntegral 1 z = exp z
− 1. -/
example (z : ℂ) : hermiteIntegral 1 z = exp z - 1 := sorry

/-- Unit test `LindemannWeierstrass.hermiteIntegral_X_one`: (computation) hermiteIntegral X 1 = exp
1 − 2. -/
example : hermiteIntegral X 1 = exp 1 - 2 := sorry

/-- Unit test `LindemannWeierstrass.hermiteIntegral_at_zero`: (degenerate) hermiteIntegral f 0 =
0. -/
example (f : ℂ[X]) : hermiteIntegral f 0 = 0 := sorry

/-- Unit test `LindemannWeierstrass.hermiteIntegral_X_one_ne`: (non-example) hermiteIntegral X 1 ≠ ∫
u in 0..1, exp u * u (= 1): the kernel is e^{z−u}, not e^u. -/
example : hermiteIntegral X 1 ≠ ∫ u in (0 : ℝ)..1, exp (u : ℂ) * u := sorry

/-- Unit test `LindemannWeierstrass.hermiteIntegral_eq_exp_mul`: (compatibility) hermiteIntegral f z
= exp z * (z * ∫ x in 0..1, exp (−(x • z)) * f.eval (x • z)), the expression in
LindemannWeierstrass.integral_exp_mul_eval. -/
example (f : ℂ[X]) (z : ℂ) :
    hermiteIntegral f z = exp z * (z * ∫ x in (0 : ℝ)..1, exp (-(x • z)) * f.eval (x • z)) :=
  sorry

/-- Evertse Corollary 4.3 and Lemma 4.12(i). -/
theorem sum_mul_hermiteIntegral_eq {ι : Type*} (s : Finset ι) (γ δ : ι → ℂ)
    (h : ∑ i ∈ s, δ i * exp (γ i) = 0) (f : ℂ[X]) :
    ∑ i ∈ s, δ i * hermiteIntegral f (γ i) = -∑ i ∈ s, δ i * (sumIDeriv f).eval (γ i) := sorry

variable (L : IntermediateField ℚ ℂ)

/-- Evaluation of formal exponential sums: `[γ] ↦ e^γ`. -/
def expEval : AddMonoidAlgebra L L →ₐ[L] ℂ :=
  AddMonoidAlgebra.lift L ℂ L
    (Complex.expMonoidHom.comp (AddMonoidHom.toMultiplicative (algebraMap L ℂ).toAddMonoidHom))

variable {L}

theorem expEval_single (γ c : L) :
    expEval L (AddMonoidAlgebra.single γ c) = (c : ℂ) * exp (γ : ℂ) := sorry

theorem expEval_apply (x : AddMonoidAlgebra L L) :
    expEval L x = ∑ γ ∈ x.coeff.support, ((x.coeff γ : L) : ℂ) * exp (γ : ℂ) := sorry

theorem expEval_mul (x y : AddMonoidAlgebra L L) :
    expEval L (x * y) = expEval L x * expEval L y := map_mul _ _ _

theorem expEval_algebraMap (c : L) :
    expEval L (algebraMap L (AddMonoidAlgebra L L) c) = (c : ℂ) := sorry

/-- Unit test `LindemannWeierstrass.expEval_single_zero`: (degenerate) expEval L (single 0 c) =
c. -/
example (c : L) : expEval L (AddMonoidAlgebra.single 0 c) = (c : ℂ) := sorry

/-- Unit test `LindemannWeierstrass.expEval_single_mul_single`: (computation) expEval L (single γ 1
* single γ' 1) = exp γ * exp γ' = exp (γ + γ'). -/
example (γ γ' : L) :
    expEval L (AddMonoidAlgebra.single γ 1 * AddMonoidAlgebra.single γ' 1) =
        exp (γ : ℂ) * exp (γ' : ℂ) ∧
      expEval L (AddMonoidAlgebra.single γ 1 * AddMonoidAlgebra.single γ' 1) =
        exp ((γ : ℂ) + γ') := sorry

/-- Unit test `LindemannWeierstrass.expEval_top_single_pi_mul_I`: (computation) expEval ⊤ (single (π
I) 1) = −1. -/
example : expEval (⊤ : IntermediateField ℚ ℂ)
    (AddMonoidAlgebra.single ⟨(Real.pi : ℂ) * I, trivial⟩ 1) = -1 := sorry

/-- Unit test `LindemannWeierstrass.expEval_top_not_injective`: (non-example) For L = ⊤: single 0 1
− single (2π I) 1 ≠ 0 but its image is 0; injectivity of expEval (the Lindemann-Weierstrass theorem)
needs L ⊆ ℚ̄. -/
example :
    (AddMonoidAlgebra.single (0 : (⊤ : IntermediateField ℚ ℂ)) (1 : (⊤ : IntermediateField ℚ ℂ)) -
        AddMonoidAlgebra.single ⟨2 * (Real.pi : ℂ) * I, trivial⟩ 1) ≠ 0 ∧
      expEval ⊤ (AddMonoidAlgebra.single (0 : (⊤ : IntermediateField ℚ ℂ))
        (1 : (⊤ : IntermediateField ℚ ℂ)) -
          AddMonoidAlgebra.single ⟨2 * (Real.pi : ℂ) * I, trivial⟩ 1) = 0 := sorry

/-- Unit test `LindemannWeierstrass.expEval_eq_lift`: (compatibility) expEval L =
AddMonoidAlgebra.lift L ℂ L (expMonoidHom.comp (inclusion as a Multiplicative hom)). -/
example : expEval L = AddMonoidAlgebra.lift L ℂ L
    (Complex.expMonoidHom.comp (AddMonoidHom.toMultiplicative (algebraMap L ℂ).toAddMonoidHom)) :=
  rfl

/-- Galois conjugation `Σ δ_γ [γ] ↦ Σ τ(δ_γ) [τ γ]`. -/
def galConj (τ : L ≃ₐ[ℚ] L) : AddMonoidAlgebra L L ≃+* AddMonoidAlgebra L L :=
  (AddMonoidAlgebra.mapDomainRingEquiv L τ.toRingEquiv.toAddEquiv).trans
    (AddMonoidAlgebra.mapRingEquiv L τ.toRingEquiv)

theorem galConj_single (τ : L ≃ₐ[ℚ] L) (γ δ : L) :
    galConj τ (AddMonoidAlgebra.single γ δ) = AddMonoidAlgebra.single (τ γ) (τ δ) := sorry

theorem coeff_galConj (τ : L ≃ₐ[ℚ] L) (x : AddMonoidAlgebra L L) (γ : L) :
    (galConj τ x).coeff (τ γ) = τ (x.coeff γ) := sorry

theorem galConj_refl : galConj (AlgEquiv.refl : L ≃ₐ[ℚ] L) = RingEquiv.refl _ := sorry

theorem galConj_trans (τ σ : L ≃ₐ[ℚ] L) :
    galConj (τ.trans σ) = (galConj τ).trans (galConj σ) := sorry

theorem support_galConj (τ : L ≃ₐ[ℚ] L) (x : AddMonoidAlgebra L L) :
    (galConj τ x).coeff.support = x.coeff.support.map τ.toEquiv.toEmbedding := sorry

theorem forall_galConj_eq_iff (x : AddMonoidAlgebra L L) :
    (∀ τ : L ≃ₐ[ℚ] L, galConj τ x = x) ↔
      ∀ (τ : L ≃ₐ[ℚ] L) (γ : L), x.coeff (τ γ) = τ (x.coeff γ) := sorry

theorem galConj_prod_galConj [FiniteDimensional ℚ L] (σ : L ≃ₐ[ℚ] L)
    (x : AddMonoidAlgebra L L) :
    galConj σ (∏ τ : L ≃ₐ[ℚ] L, galConj τ x) = ∏ τ : L ≃ₐ[ℚ] L, galConj τ x := sorry

/-- Unit test `LindemannWeierstrass.galConj_single_ratCast`: (degenerate) galConj τ (single 0 (q :
L)) = single 0 (q : L) for q ∈ ℚ. -/
example (τ : L ≃ₐ[ℚ] L) (q : ℚ) :
    galConj τ (AddMonoidAlgebra.single 0 (q : L)) = AddMonoidAlgebra.single 0 (q : L) := sorry

/-- Unit test `LindemannWeierstrass.galConj_single_I`: (computation) If I ∈ L and τ I = −I then
galConj τ (single I I) = single (−I) (−I). -/
example (hI : I ∈ L) (τ : L ≃ₐ[ℚ] L) (hτ : τ ⟨I, hI⟩ = -⟨I, hI⟩) :
    galConj τ (AddMonoidAlgebra.single ⟨I, hI⟩ ⟨I, hI⟩) =
      AddMonoidAlgebra.single (-⟨I, hI⟩) (-⟨I, hI⟩) := sorry

/-- Unit test `LindemannWeierstrass.galConj_fixed_of_quadratic`: (characterisation) If [L : ℚ] = 2,
s ∈ L and τ s = −s for the nontrivial τ, then single s 1 + single (−s) 1 is fixed by every galConj
τ. -/
example (hL : Module.finrank ℚ L = 2) (s : L) (hs : ∀ τ : L ≃ₐ[ℚ] L, τ ≠ AlgEquiv.refl → τ s = -s) :
    ∀ τ : L ≃ₐ[ℚ] L,
      galConj τ (AddMonoidAlgebra.single s 1 + AddMonoidAlgebra.single (-s) 1) =
        AddMonoidAlgebra.single s 1 + AddMonoidAlgebra.single (-s) 1 := sorry

/-- Unit test `LindemannWeierstrass.expEval_galConj_ne`: (non-example) If √2 ∈ L and τ √2 = −√2 then
expEval L (galConj τ (single √2 1)) = e^{−√2} ≠ e^{√2} = expEval L (single √2 1): evaluation is not
Galois-equivariant. -/
example (s : L) (hs : (s : ℂ) = Real.sqrt 2) (τ : L ≃ₐ[ℚ] L) (hτ : τ s = -s) :
    expEval L (galConj τ (AddMonoidAlgebra.single s 1)) = exp (-(Real.sqrt 2 : ℂ)) ∧
      exp (-(Real.sqrt 2 : ℂ)) ≠ exp (Real.sqrt 2 : ℂ) ∧
      exp (Real.sqrt 2 : ℂ) = expEval L (AddMonoidAlgebra.single s 1) := sorry

/-- Evertse's auxiliary polynomial `f_k` (with `γ_k = γ`, `t = |S|`). -/
def auxPoly (S : Finset L) (l p : ℕ) (γ : L) : L[X] :=
  C ((l : L) ^ (S.card * p) / ((p - 1).factorial : L)) * (X - C γ) ^ (p - 1) *
    ∏ γ' ∈ S.erase γ, (X - C γ') ^ p

theorem natDegree_auxPoly {S : Finset L} {γ : L} (hγ : γ ∈ S) {l p : ℕ} (hl : l ≠ 0)
    (hp : 1 ≤ p) : (auxPoly S l p γ).natDegree = S.card * p - 1 := sorry

theorem auxPoly_map (τ : L ≃ₐ[ℚ] L) (S : Finset L) (l p : ℕ) (γ : L) :
    (auxPoly S l p γ).map (τ : L →+* L) = auxPoly (S.map τ.toEquiv.toEmbedding) l p (τ γ) := sorry

/-- Evertse Lemma 4.13: values of the derivatives of `f_γ` at the points of `S`. -/
theorem eval_iterate_derivative_auxPoly {S : Finset L} {γ : L} (hγ : γ ∈ S) {l : ℕ}
    (hl : 1 ≤ l) (hint : ∀ γ' ∈ S, IsIntegral ℤ ((l : L) * γ')) {p : ℕ} (hp : p.Prime) :
    (derivative^[p - 1] (auxPoly S l p γ)).eval γ =
        ((l : L) ^ S.card * ∏ γ' ∈ S.erase γ, (γ - γ')) ^ p ∧
      IsIntegral ℤ ((l : L) ^ S.card * ∏ γ' ∈ S.erase γ, (γ - γ')) ∧
      (∀ γ' ∈ S, ∀ j < p, (γ', j) ≠ (γ, p - 1) → (derivative^[j] (auxPoly S l p γ)).eval γ' = 0) ∧
      (∀ γ' ∈ S, ∀ j, p ≤ j → IsIntegral ℤ ((derivative^[j] (auxPoly S l p γ)).eval γ' / p)) :=
  sorry

/-- Unit test `LindemannWeierstrass.auxPoly_singleton`: (degenerate) auxPoly {γ} l p γ = C
(l^p/(p−1)!) * (X − C γ)^(p−1). -/
example (γ : L) (l p : ℕ) :
    auxPoly {γ} l p γ = C ((l : L) ^ p / ((p - 1).factorial : L)) * (X - C γ) ^ (p - 1) := sorry

/-- Unit test `LindemannWeierstrass.auxPoly_hermite`: (compatibility) For L = ⊥, S = {0,1,…,n}, l =
1, γ = 0: auxPoly S 1 p 0 = C (1/(p−1)!) * X^(p−1) * ∏_{a=1}^n (X − C a)^p (Evertse (4.3)). -/
example (n p : ℕ) :
    auxPoly (L := ⊥) ((Finset.range (n + 1)).image (fun a : ℕ ↦ (a : (⊥ : IntermediateField ℚ ℂ))))
        1 p 0 =
      C (1 / ((p - 1).factorial : (⊥ : IntermediateField ℚ ℂ))) * X ^ (p - 1) *
        ∏ a ∈ Finset.Icc 1 n, (X - C (a : (⊥ : IntermediateField ℚ ℂ))) ^ p := sorry

/-- Unit test `LindemannWeierstrass.auxPoly_zero_one`: (computation) auxPoly {0, 1} 1 2 0 = X^3 −
2X^2 + X. -/
example : auxPoly (L := L) {0, 1} 1 2 0 = X ^ 3 - 2 * X ^ 2 + X := sorry

/-- Unit test `LindemannWeierstrass.auxPoly_not_integral`: (non-example) auxPoly {0} 1 3 0 = C (1/2)
* X^2: the coefficients are not algebraic integers, so the factor 1/(p−1)! must be tracked (Lemma
4.13(iii) divides by (p−1)!, not by p!). -/
example : auxPoly (L := L) {0} 1 3 0 = C (1 / 2 : L) * X ^ 2 := sorry

/-- Evertse's numbers `M_γ`, taken in their algebraic form (Lemma 4.12(i)). -/
def auxValue (x : AddMonoidAlgebra L L) (l p : ℕ) (γ : L) : L :=
  -∑ γ' ∈ x.coeff.support, x.coeff γ' * (sumIDeriv (auxPoly x.coeff.support l p γ)).eval γ'

/-- Evertse Lemma 4.12(i). -/
theorem coe_auxValue_eq_sum_hermiteIntegral {x : AddMonoidAlgebra L L} (hx : expEval L x = 0)
    (l p : ℕ) (γ : L) :
    ((auxValue x l p γ : L) : ℂ) = ∑ γ' ∈ x.coeff.support, ((x.coeff γ' : L) : ℂ) *
      hermiteIntegral ((auxPoly x.coeff.support l p γ).map (algebraMap L ℂ)) (γ' : ℂ) := sorry

/-- Evertse Lemma 4.12(ii). -/
theorem auxValue_galConj {x : AddMonoidAlgebra L L} (hx : ∀ τ : L ≃ₐ[ℚ] L, galConj τ x = x)
    (l p : ℕ) {γ : L} (hγ : γ ∈ x.coeff.support) (τ : L ≃ₐ[ℚ] L) :
    τ (auxValue x l p γ) = auxValue x l p (τ γ) ∧ τ γ ∈ x.coeff.support := sorry

/-- Evertse Lemma 4.14, integrality. -/
theorem isIntegral_auxValue [FiniteDimensional ℚ L] {x : AddMonoidAlgebra L L}
    (hx : ∀ γ, IsIntegral ℤ (x.coeff γ)) {l : ℕ} (hl : 1 ≤ l)
    (hint : ∀ γ ∈ x.coeff.support, IsIntegral ℤ ((l : L) * γ)) {p : ℕ} (hp : p.Prime) (γ : L) :
    IsIntegral ℤ (auxValue x l p γ) := sorry

/-- Evertse Lemma 4.14, nonvanishing for large primes. -/
theorem auxValue_ne_zero [FiniteDimensional ℚ L] {x : AddMonoidAlgebra L L}
    (hx : ∀ γ, IsIntegral ℤ (x.coeff γ)) {l : ℕ} (hl : 1 ≤ l)
    (hint : ∀ γ ∈ x.coeff.support, IsIntegral ℤ ((l : L) * γ)) {γ : L}
    (hγ : γ ∈ x.coeff.support) {p : ℕ} (hp : p.Prime)
    (hpbig : |Algebra.norm ℚ (x.coeff γ) *
      Algebra.norm ℚ ((l : L) ^ x.coeff.support.card * ∏ γ' ∈ x.coeff.support.erase γ, (γ - γ'))|
        < p) :
    auxValue x l p γ ≠ 0 := sorry

/-- Evertse Lemma 4.15 (Exercise 4.3). -/
theorem norm_auxValue_le {x : AddMonoidAlgebra L L} (hx : expEval L x = 0) {l : ℕ} (hl : 1 ≤ l) :
    ∃ C c : ℝ, 0 < C ∧ 0 < c ∧ ∀ p : ℕ, 1 ≤ p → ∀ γ ∈ x.coeff.support,
      ‖((auxValue x l p γ : L) : ℂ)‖ ≤ C * c ^ p / (p - 1).factorial := sorry

/-- Unit test `LindemannWeierstrass.auxValue_single_zero`: (computation) auxValue (single 0 1) l p 0
= −l^p for p ≥ 1. -/
example (l p : ℕ) (hp : 1 ≤ p) :
    auxValue (AddMonoidAlgebra.single (0 : L) 1) l p 0 = -((l : L) ^ p) := sorry

/-- Unit test `LindemannWeierstrass.auxValue_zero`: (degenerate) auxValue 0 l p γ = 0. -/
example (l p : ℕ) (γ : L) : auxValue (0 : AddMonoidAlgebra L L) l p γ = 0 := sorry

/-- Unit test `LindemannWeierstrass.auxValue_single_zero_two`: (non-example) auxValue (single 0 1) 2
p 0 = −2^p ≠ −1 = auxValue (single 0 1) 1 p 0 for p ≥ 1: M depends on the auxiliary integer l and is
not an invariant of x. -/
example (p : ℕ) (hp : 1 ≤ p) :
    auxValue (AddMonoidAlgebra.single (0 : L) 1) 2 p 0 = -((2 : L) ^ p) ∧
      -((2 : L) ^ p) ≠ -1 ∧ -1 = auxValue (AddMonoidAlgebra.single (0 : L) 1) 1 p 0 := sorry

/-- Unit test `LindemannWeierstrass.auxValue_compat_hermiteIntegral`: (compatibility) If expEval L x
= 0 then (auxValue x l p γ : ℂ) = Σ_{γ'} (x.coeff γ' : ℂ) * hermiteIntegral ((auxPoly S l p γ).map
(algebraMap L ℂ)) γ' (Lemma 4.12(i)). -/
example {x : AddMonoidAlgebra L L} (hx : expEval L x = 0) (l p : ℕ) (γ : L) :
    ((auxValue x l p γ : L) : ℂ) = ∑ γ' ∈ x.coeff.support, ((x.coeff γ' : L) : ℂ) *
      hermiteIntegral ((auxPoly x.coeff.support l p γ).map (algebraMap L ℂ)) (γ' : ℂ) :=
  coe_auxValue_eq_sum_hermiteIntegral hx l p γ

/-- The weak Lindemann-Weierstrass theorem (Evertse Theorem 4.11). -/
theorem expEval_ne_zero_of_forall_galConj_eq [FiniteDimensional ℚ L] [IsGalois ℚ L]
    {x : AddMonoidAlgebra L L} (hx : x ≠ 0) (hfix : ∀ τ : L ≃ₐ[ℚ] L, galConj τ x = x) :
    expEval L x ≠ 0 := sorry

end LindemannWeierstrass

/-- The Lindemann-Weierstrass theorem in Baker's form (Evertse Theorem 4.8); name and signature
as in Mathlib PR #28013. -/
theorem linearIndependent_exp {ι : Type*} (u : ι → integralClosure ℚ ℂ) (u_inj : u.Injective) :
    LinearIndependent (integralClosure ℚ ℂ) fun i ↦ exp (u i) := sorry

/-- Hermite-Lindemann (Evertse Corollary 4.9(i)). -/
theorem transcendental_exp {a : ℂ} (a0 : a ≠ 0) (ha : IsAlgebraic ℤ a) :
    Transcendental ℤ (exp a) := sorry

/-- Lindemann (Evertse Corollary 4.9(ii)). -/
theorem transcendental_pi : Transcendental ℤ Real.pi := sorry

/-- Lindemann-Weierstrass, algebraic independence form (Evertse Corollary 4.10). -/
theorem algebraicIndependent_exp {ι : Type*} (u : ι → integralClosure ℚ ℂ)
    (hu : LinearIndependent ℕ u) :
    AlgebraicIndependent (integralClosure ℚ ℂ) fun i ↦ exp (u i) := sorry

namespace Transcendence

/-- Every nonzero logarithm of an algebraic number is transcendental (Evertse Exercise 4.6(ii)). -/
theorem transcendental_of_mem_algebraicLogs {l : ℂ} (hl : l ∈ algebraicLogs) (h0 : l ≠ 0) :
    Transcendental ℚ l := sorry

/-- Schanuel's conjecture, as a proposition (never assumed). -/
def SchanuelConjecture : Prop :=
  ∀ (n : ℕ) (x : Fin n → ℂ), LinearIndependent ℚ x →
    (n : Cardinal) ≤ Algebra.trdeg ℚ
      (IntermediateField.adjoin ℚ (Set.range x ∪ Set.range (fun i ↦ exp (x i))))

namespace SchanuelConjecture

theorem le_trdeg (h : SchanuelConjecture) {n : ℕ} {x : Fin n → ℂ}
    (hx : LinearIndependent ℚ x) :
    (n : Cardinal) ≤ Algebra.trdeg ℚ
      (IntermediateField.adjoin ℚ (Set.range x ∪ Set.range (fun i ↦ exp (x i)))) := h n x hx

end SchanuelConjecture

theorem schanuel_ineq_one {x : ℂ} (hx : x ≠ 0) :
    (1 : Cardinal) ≤ Algebra.trdeg ℚ (IntermediateField.adjoin ℚ ({x, exp x} : Set ℂ)) := sorry

theorem schanuel_ineq_of_isAlgebraic {n : ℕ} {x : Fin n → ℂ} (hx : LinearIndependent ℚ x)
    (halg : ∀ i, IsAlgebraic ℚ (x i)) :
    (n : Cardinal) ≤ Algebra.trdeg ℚ
      (IntermediateField.adjoin ℚ (Set.range x ∪ Set.range (fun i ↦ exp (x i)))) := sorry

/-- Unit test `Transcendence.schanuelConjecture_zero`: (degenerate) The n = 0 instance of the
inequality holds trivially (0 ≤ trdeg). -/
example (x : Fin 0 → ℂ) :
    ((0 : ℕ) : Cardinal) ≤ Algebra.trdeg ℚ
      (IntermediateField.adjoin ℚ (Set.range x ∪ Set.range (fun i ↦ exp (x i)))) := sorry

/-- Unit test `Transcendence.schanuelConjecture_one_variable_unconditional`: (computation)
Unconditionally, for x = 1: 1 ≤ Algebra.trdeg ℚ ℚ(1, e) (e is transcendental). -/
example : (1 : Cardinal) ≤ Algebra.trdeg ℚ
    (IntermediateField.adjoin ℚ ({(1 : ℂ), exp 1} : Set ℂ)) := sorry

/-- Unit test `Transcendence.schanuelConjecture_algebraic_unconditional`: (compatibility)
Unconditionally, for x = (1, √2): 2 ≤ trdeg ℚ ℚ(1, √2, e, e^{√2}) (agreement with
algebraicIndependent_exp). -/
example : ((2 : ℕ) : Cardinal) ≤ Algebra.trdeg ℚ (IntermediateField.adjoin ℚ
    (Set.range ![(1 : ℂ), Real.sqrt 2] ∪ Set.range (fun i ↦ exp (![(1 : ℂ), Real.sqrt 2] i)))) :=
  sorry

/-- Unit test `Transcendence.not_schanuel_of_distinct`: (non-example) The variant with 'pairwise
distinct' instead of 'linearly independent over ℚ' is false: x = (0) gives trdeg ℚ(0, 1) = 0 < 1
(Evertse Exercise 4.4). -/
example :
    ¬ (∀ (n : ℕ) (x : Fin n → ℂ), Function.Injective x →
        (n : Cardinal) ≤ Algebra.trdeg ℚ
          (IntermediateField.adjoin ℚ (Set.range x ∪ Set.range (fun i ↦ exp (x i))))) ∧
      Algebra.trdeg ℚ (IntermediateField.adjoin ℚ
        (Set.range ![(0 : ℂ)] ∪ Set.range (fun i ↦ exp (![(0 : ℂ)] i)))) = 0 := sorry

theorem SchanuelConjecture.algebraicIndependent_exp_one_pi (h : SchanuelConjecture) :
    AlgebraicIndependent ℚ ![exp 1, (Real.pi : ℂ)] := sorry

theorem SchanuelConjecture.algebraicIndependent_of_mem_algebraicLogs (h : SchanuelConjecture)
    {n : ℕ} {l : Fin n → ℂ} (hl : ∀ i, l i ∈ algebraicLogs) (hind : LinearIndependent ℚ l) :
    AlgebraicIndependent ℚ l := sorry

end Transcendence

/-! ## Gelfond-Schneider (Evertse §4.3-4.4; Gelfond's method for the general case) -/

namespace Transcendence

/-- Rolle's theorem, counting form. -/
theorem exists_finset_card_deriv_zeros (f : ℝ → ℝ) (hf : Differentiable ℝ f) (S : Finset ℝ)
    (hS : S.Nonempty) (h0 : ∀ x ∈ S, f x = 0) :
    ∃ T : Finset ℝ, T.card + 1 = S.card ∧ ∀ x ∈ T, deriv f x = 0 := sorry

/-- Evertse Lemma 4.23: a real exponential polynomial `Σ p_k(x) e^{γ_k x}` has at most
`Σ (1 + deg p_k) - 1` real zeros. -/
theorem card_zeros_expPoly_le {r : ℕ} (γ : Fin r → ℝ) (hγ : Function.Injective γ)
    (p : Fin r → ℝ[X]) (hp : ∀ k, p k ≠ 0) (S : Finset ℝ)
    (hS : ∀ x ∈ S, ∑ k, (p k).eval x * Real.exp (γ k * x) = 0) :
    S.card + 1 ≤ ∑ k, ((p k).natDegree + 1) := sorry

/-- Evertse Lemma 4.24 with multiplicities. -/
theorem exists_differentiable_eq_mul_prod_pow (f : ℂ → ℂ) (hf : Differentiable ℂ f)
    (a : Finset ℂ) (k : ℂ → ℕ) (hk : ∀ x ∈ a, ∀ j < k x, iteratedDeriv j f x = 0) :
    ∃ g : ℂ → ℂ, Differentiable ℂ g ∧ ∀ z, f z = g z * ∏ x ∈ a, (z - x) ^ k x := sorry

/-- Evertse Lemma 4.26 with multiplicities. -/
theorem norm_le_of_zeros (f : ℂ → ℂ) (hf : Differentiable ℂ f) (a : Finset ℂ) (k : ℂ → ℕ)
    (hk : ∀ x ∈ a, ∀ j < k x, iteratedDeriv j f x = 0) {R T M : ℝ} (hR : 0 < R)
    (hRT : 3 * R ≤ T) (ha : ∀ x ∈ a, ‖x‖ ≤ R) (hM : ∀ w : ℂ, ‖w‖ = T → ‖f w‖ ≤ M) :
    ∀ z : ℂ, ‖z‖ ≤ R → ‖f z‖ ≤ M * (3 * R / T) ^ (∑ x ∈ a, k x) := sorry

/-- A nontrivial exponential sum with distinct frequencies is not identically zero. -/
theorem sum_mul_exp_ne_zero {N : ℕ} (ρ : Fin N → ℂ) (hρ : Function.Injective ρ)
    (c : Fin N → ℂ) (hc : c ≠ 0) : (fun z : ℂ ↦ ∑ i, c i * exp (ρ i * z)) ≠ 0 := sorry

end Transcendence

namespace GelfondSchneider

open NumberField

variable {K : Type*} [Field K] [NumberField K] (σ : K →+* ℂ)

/-- Evertse Lemma 4.22 (Setting S: `σ α' = e^l`, `σ β' = β`, `σ γ' = e^{βl}`), with Siegel's
lemma over `𝓞 K`. -/
theorem exists_schneider_auxiliary (l : ℂ) (α' β' γ' : K) (hα : σ α' = exp l)
    (hγ : σ γ' = exp (σ β' * l)) :
    ∃ c₁ : ℝ, 0 < c₁ ∧ ∀ L D₁ D₂ : ℕ, 3 ≤ L → 2 * Module.finrank ℚ K * L ^ 2 ≤ D₁ * D₂ →
      ∃ a : Fin D₁ → Fin D₂ → K, a ≠ 0 ∧ (∀ i j, IsIntegral ℤ (a i j)) ∧
        (∀ i j, house (a i j) ≤ Real.exp (c₁ * ((D₁ : ℝ) * Real.log L + (D₂ : ℝ) * L))) ∧
        ∀ u v : ℕ, 1 ≤ u → u ≤ L → 1 ≤ v → v ≤ L →
          ∑ i, ∑ j, σ (a i j) * ((u : ℂ) + v * σ β') ^ (i : ℕ) *
            exp ((j : ℂ) * l * ((u : ℂ) + v * σ β')) = 0 := sorry

/-- Evertse Lemma 4.27(i): extrapolation to the points `a + bβ`, `1 ≤ a, b ≤ cL`. -/
theorem norm_schneider_auxiliary_le (l : ℂ) (α' β' γ' : K) (hα : σ α' = exp l)
    (hγ : σ γ' = exp (σ β' * l)) (hβ : ∀ q : ℚ, σ β' ≠ q) (c₁ : ℝ) (hc₁ : 0 < c₁) :
    ∃ c₄ : ℝ, ∀ M : ℕ, 1 ≤ M →
      let d : ℕ := Module.finrank ℚ K
      let L : ℕ := 2 * d * M ^ 2
      let D₁ : ℕ := (2 * d) ^ 2 * M ^ 3
      let D₂ : ℕ := 2 * d * M
      let c : ℕ := 1 + ⌊Real.sqrt (2 * (d : ℝ))⌋₊
      ∀ a : Fin D₁ → Fin D₂ → K,
        (∀ i j, house (a i j) ≤ Real.exp (c₁ * ((D₁ : ℝ) * Real.log L + (D₂ : ℝ) * L))) →
        (∀ u v : ℕ, 1 ≤ u → u ≤ L → 1 ≤ v → v ≤ L →
          ∑ i, ∑ j, σ (a i j) * ((u : ℂ) + v * σ β') ^ (i : ℕ) *
            exp ((j : ℂ) * l * ((u : ℂ) + v * σ β')) = 0) →
        ∀ u v : ℕ, 1 ≤ u → u ≤ c * L → 1 ≤ v → v ≤ c * L →
          ‖∑ i, ∑ j, σ (a i j) * ((u : ℂ) + v * σ β') ^ (i : ℕ) *
            exp ((j : ℂ) * l * ((u : ℂ) + v * σ β'))‖ ≤
            Real.exp (c₄ * (L : ℝ) ^ (3 / 2 : ℝ) * Real.log L - (L : ℝ) ^ 2) := sorry

/-- Evertse Lemma 4.27(ii): conjugates of the values `y_{ab}`. -/
theorem norm_embedding_schneider_value_le (α' β' γ' : K) (c₁ : ℝ) (hc₁ : 0 < c₁) :
    ∃ c₅ : ℝ, ∀ M : ℕ, 1 ≤ M →
      let d : ℕ := Module.finrank ℚ K
      let L : ℕ := 2 * d * M ^ 2
      let D₁ : ℕ := (2 * d) ^ 2 * M ^ 3
      let D₂ : ℕ := 2 * d * M
      let c : ℕ := 1 + ⌊Real.sqrt (2 * (d : ℝ))⌋₊
      ∀ a : Fin D₁ → Fin D₂ → K,
        (∀ i j, house (a i j) ≤ Real.exp (c₁ * ((D₁ : ℝ) * Real.log L + (D₂ : ℝ) * L))) →
        ∀ (τ : K →+* ℂ) (u v : ℕ), 1 ≤ u → u ≤ c * L → 1 ≤ v → v ≤ c * L →
          ‖τ (∑ i, ∑ j, a i j * ((u : K) + v * β') ^ (i : ℕ) * α' ^ (u * j) * γ' ^ (v * j))‖ ≤
            Real.exp (c₅ * (L : ℝ) ^ (3 / 2 : ℝ) * Real.log L) := sorry

/-- Evertse Lemma 4.27(iii): denominators of the values `y_{ab}`. -/
theorem isIntegral_pow_mul_schneider_value (α' β' γ' : K) {m : ℕ} (hm : 0 < m)
    (hα : IsIntegral ℤ ((m : K) * α')) (hβ : IsIntegral ℤ ((m : K) * β'))
    (hγ : IsIntegral ℤ ((m : K) * γ')) (D₁ D₂ L c : ℕ) (a : Fin D₁ → Fin D₂ → K)
    (ha : ∀ i j, IsIntegral ℤ (a i j)) (u v : ℕ) (hu : u ≤ c * L) (hv : v ≤ c * L) :
    IsIntegral ℤ ((m : K) ^ (D₁ + 2 * c * L * D₂) *
      ∑ i, ∑ j, a i j * ((u : K) + v * β') ^ (i : ℕ) * α' ^ (u * j) * γ' ^ (v * j)) := sorry

/-- Evertse Theorem 4.21 (Schneider's proof in the real case). -/
theorem transcendental_rpow {α β : ℝ} (hα : IsAlgebraic ℚ α) (hβ : IsAlgebraic ℚ β)
    (h0 : 0 < α) (h1 : α ≠ 1) (hirr : Irrational β) : Transcendental ℚ (α ^ β) := sorry

/-- Derivatives of Gelfond's auxiliary function at integers. -/
theorem iteratedDeriv_gelfond (l β : ℂ) {q : ℕ} (η : Fin q → Fin q → ℂ) (k t : ℕ) :
    iteratedDeriv k (fun z : ℂ ↦ ∑ a : Fin q, ∑ b : Fin q,
        η a b * exp (((a : ℂ) + 1 + ((b : ℂ) + 1) * β) * l * z)) t =
      l ^ k * ∑ a : Fin q, ∑ b : Fin q, η a b * ((a : ℂ) + 1 + ((b : ℂ) + 1) * β) ^ k *
        exp l ^ (((a : ℕ) + 1) * t) * exp (β * l) ^ (((b : ℕ) + 1) * t) := sorry

/-- Gelfond's auxiliary function via Siegel's lemma over `𝓞 K` (Setting G, `m = 2h + 2`). -/
theorem exists_gelfond_auxiliary (l : ℂ) (hl : l ≠ 0) (α' β' γ' : K) (hα : σ α' = exp l)
    (hγ : σ γ' = exp (σ β' * l)) (hβ : ∀ q : ℚ, σ β' ≠ q) :
    ∃ c₁ : ℝ, 1 ≤ c₁ ∧ ∀ n q : ℕ, 0 < n → q ^ 2 = 2 * (2 * Module.finrank ℚ K + 2) * n →
      ∃ η : Fin q → Fin q → K, η ≠ 0 ∧ (∀ a b, IsIntegral ℤ (η a b)) ∧
        (∀ a b, house (η a b) ≤ c₁ ^ n * (n : ℝ) ^ (((n : ℝ) + 1) / 2)) ∧
        ∀ k < n, ∀ t : ℕ, 1 ≤ t → t ≤ 2 * Module.finrank ℚ K + 2 →
          iteratedDeriv k (fun z : ℂ ↦ ∑ a : Fin q, ∑ b : Fin q,
            σ (η a b) * exp (((a : ℂ) + 1 + ((b : ℂ) + 1) * σ β') * l * z)) t = 0 := sorry

/-- The first nonvanishing derivative at the points `1, …, m`. -/
theorem exists_first_nonvanishing_derivative (l : ℂ) (hl : l ≠ 0) (β : ℂ)
    (hβ : ∀ q : ℚ, β ≠ q) {q n m : ℕ} (hm : 1 ≤ m) (η : Fin q → Fin q → ℂ) (hη : η ≠ 0)
    (hvan : ∀ k < n, ∀ t : ℕ, 1 ≤ t → t ≤ m → iteratedDeriv k (fun z : ℂ ↦ ∑ a : Fin q,
      ∑ b : Fin q, η a b * exp (((a : ℂ) + 1 + ((b : ℂ) + 1) * β) * l * z)) t = 0) :
    ∃ r : ℕ, n ≤ r ∧ ∃ t₀ : ℕ, 1 ≤ t₀ ∧ t₀ ≤ m ∧
      (∀ k < r, ∀ t : ℕ, 1 ≤ t → t ≤ m → iteratedDeriv k (fun z : ℂ ↦ ∑ a : Fin q,
        ∑ b : Fin q, η a b * exp (((a : ℂ) + 1 + ((b : ℂ) + 1) * β) * l * z)) t = 0) ∧
      iteratedDeriv r (fun z : ℂ ↦ ∑ a : Fin q, ∑ b : Fin q,
        η a b * exp (((a : ℂ) + 1 + ((b : ℂ) + 1) * β) * l * z)) t₀ ≠ 0 := sorry

/-- Liouville lower bound for `ρ = Σ η_{ab} (a + bβ)^r α^{a t₀} γ^{b t₀}`. -/
theorem norm_gelfond_value_ge (α' β' γ' : K) (c₁ : ℝ) :
    ∃ c₂ : ℝ, 1 ≤ c₂ ∧ ∀ (n q r t₀ : ℕ) (η : Fin q → Fin q → K),
      q ^ 2 = 2 * (2 * Module.finrank ℚ K + 2) * n → 1 ≤ n → n ≤ r →
      1 ≤ t₀ → t₀ ≤ 2 * Module.finrank ℚ K + 2 → (∀ a b, IsIntegral ℤ (η a b)) →
      (∀ a b, house (η a b) ≤ c₁ ^ n * (n : ℝ) ^ (((n : ℝ) + 1) / 2)) →
      ∑ a : Fin q, ∑ b : Fin q, η a b * ((a : K) + 1 + ((b : K) + 1) * β') ^ r *
          α' ^ (((a : ℕ) + 1) * t₀) * γ' ^ (((b : ℕ) + 1) * t₀) ≠ 0 →
      c₂⁻¹ ^ r * (r : ℝ)⁻¹ ^ ((Module.finrank ℚ K - 1) * (r + 1) : ℕ) ≤
        ‖σ (∑ a : Fin q, ∑ b : Fin q, η a b * ((a : K) + 1 + ((b : K) + 1) * β') ^ r *
          α' ^ (((a : ℕ) + 1) * t₀) * γ' ^ (((b : ℕ) + 1) * t₀))‖ := sorry

/-- Analytic upper bound for the same number, by the maximum modulus principle. -/
theorem norm_gelfond_value_le (l : ℂ) (hl : l ≠ 0) (α' β' γ' : K) (hα : σ α' = exp l)
    (hγ : σ γ' = exp (σ β' * l)) (c₁ : ℝ) :
    ∃ c₃ : ℝ, 1 ≤ c₃ ∧ ∀ (n q r t₀ : ℕ) (η : Fin q → Fin q → K),
      q ^ 2 = 2 * (2 * Module.finrank ℚ K + 2) * n → 1 ≤ n → n ≤ r →
      1 ≤ t₀ → t₀ ≤ 2 * Module.finrank ℚ K + 2 →
      (∀ a b, house (η a b) ≤ c₁ ^ n * (n : ℝ) ^ (((n : ℝ) + 1) / 2)) →
      (∀ k < r, ∀ t : ℕ, 1 ≤ t → t ≤ 2 * Module.finrank ℚ K + 2 →
        iteratedDeriv k (fun z : ℂ ↦ ∑ a : Fin q, ∑ b : Fin q,
          σ (η a b) * exp (((a : ℂ) + 1 + ((b : ℂ) + 1) * σ β') * l * z)) t = 0) →
      ‖σ (∑ a : Fin q, ∑ b : Fin q, η a b * ((a : K) + 1 + ((b : K) + 1) * β') ^ r *
          α' ^ (((a : ℕ) + 1) * t₀) * γ' ^ (((b : ℕ) + 1) * t₀))‖ ≤
        c₃ ^ r * (r : ℝ) ^ (((3 - (2 * (Module.finrank ℚ K : ℝ) + 2)) * r + 1) / 2) := sorry

end GelfondSchneider

namespace Transcendence

/-- The Gelfond-Schneider theorem for any nonzero logarithm (Evertse Theorem 4.16). -/
theorem transcendental_exp_mul_of_mem_algebraicLogs {l β : ℂ} (hl : l ∈ algebraicLogs)
    (hl0 : l ≠ 0) (hβ : IsAlgebraic ℚ β) (hβq : ∀ q : ℚ, β ≠ q) :
    Transcendental ℚ (exp (β * l)) := sorry

/-- `e^{πα}` is transcendental for algebraic `α ∉ ℚ i` (Evertse Corollary 4.17). -/
theorem transcendental_exp_pi_mul {α : ℂ} (hα : IsAlgebraic ℚ α) (h : ∀ q : ℚ, α ≠ q * I) :
    Transcendental ℚ (exp (Real.pi * α)) := sorry

/-- Two `ℚ`-linearly independent logarithms are `ℚ̄`-linearly independent (Evertse
Corollary 4.18, Waldschmidt Theorem 1.4). -/
theorem linearIndependent_integralClosure_of_two (l : Fin 2 → ℂ) (hl : ∀ i, l i ∈ algebraicLogs)
    (hind : LinearIndependent ℚ l) : LinearIndependent (integralClosure ℚ ℂ) l := sorry

end Transcendence

/-- Gelfond-Schneider for `Complex.cpow` (principal branch); name and signature of the
Karatarakis-Wiedijk formalization. -/
theorem transcendental_cpow_of_isAlgebraic_of_irrational (α β : ℂ) (hα : IsAlgebraic ℚ α)
    (hβ : IsAlgebraic ℚ β) (htriv : α ≠ 0 ∧ α ≠ 1) (hirr : ∀ i j : ℤ, β ≠ i / j) :
    Transcendental ℚ (α ^ β) := sorry

/-! ## Baker's theorem via the Schneider-Lang criterion for Cartesian products
(Waldschmidt, *Diophantine Approximation on Linear Algebraic Groups*, Chapter 4) -/

namespace Baker

open Metric

variable {n : ℕ}

/-- Multi-index partial derivative `D^σ f = ∂₁^{σ₁} ⋯ ∂ₙ^{σₙ} f` on `ℂⁿ = Fin n → ℂ`. -/
def mDeriv (σ : Fin n → ℕ) (f : (Fin n → ℂ) → ℂ) : (Fin n → ℂ) → ℂ :=
  (List.finRange n).foldr
    (fun i g ↦ (fun (g' : (Fin n → ℂ) → ℂ) (z : Fin n → ℂ) ↦ fderiv ℂ g' z (Pi.single i 1))^[σ i] g) f

theorem mDeriv_zero (f : (Fin n → ℂ) → ℂ) : mDeriv 0 f = f := sorry

theorem mDeriv_add_single {f : (Fin n → ℂ) → ℂ} (hf : Differentiable ℂ f) (σ : Fin n → ℕ)
    (i : Fin n) :
    mDeriv (σ + Pi.single i 1) f = fun z ↦ fderiv ℂ (mDeriv σ f) z (Pi.single i 1) := sorry

theorem mDeriv_add {f g : (Fin n → ℂ) → ℂ} (hf : Differentiable ℂ f) (hg : Differentiable ℂ g)
    (σ : Fin n → ℕ) : mDeriv σ (f + g) = mDeriv σ f + mDeriv σ g := sorry

theorem differentiable_mDeriv {f : (Fin n → ℂ) → ℂ} (hf : Differentiable ℂ f)
    (σ : Fin n → ℕ) : Differentiable ℂ (mDeriv σ f) := sorry

theorem mDeriv_exp_dotProduct (w : Fin n → ℂ) (σ : Fin n → ℕ) :
    mDeriv σ (fun z ↦ exp (∑ i, w i * z i)) =
      fun z ↦ (∏ i, w i ^ σ i) * exp (∑ i, w i * z i) := sorry

/-- Unit test `Baker.mDeriv_zero_example`: (degenerate) mDeriv 0 f = f. -/
example (f : (Fin n → ℂ) → ℂ) : mDeriv 0 f = f := mDeriv_zero f

/-- Unit test `Baker.mDeriv_single_mul`: (computation) For f(z) = z_0 z_1 on ℂ^2: mDeriv (Pi.single
0 1) f = fun z ↦ z 1. -/
example : mDeriv (Pi.single 0 1) (fun z : Fin 2 → ℂ ↦ z 0 * z 1) = fun z ↦ z 1 := sorry

/-- Unit test `Baker.mDeriv_one_variable`: (compatibility) For n = 1 and entire g : ℂ → ℂ: mDeriv
(fun _ ↦ k) (fun z ↦ g (z 0)) = fun z ↦ iteratedDeriv k g (z 0). -/
example (g : ℂ → ℂ) (hg : Differentiable ℂ g) (k : ℕ) :
    mDeriv (fun _ : Fin 1 ↦ k) (fun z ↦ g (z 0)) = fun z ↦ iteratedDeriv k g (z 0) := sorry

/-- Unit test `Baker.mDeriv_ne_total_derivative`: (non-example) For f(z) = z_0^2 on ℂ^2, mDeriv ![1,
1] f = 0 while iteratedFDeriv ℂ 2 f z ![e_0, e_0] = 2: D^σ is a mixed partial of multi-order σ, not
the total derivative of order ‖σ‖ along one direction. -/
example : mDeriv ![1, 1] (fun z : Fin 2 → ℂ ↦ z 0 ^ 2) = 0 ∧
    ∀ z : Fin 2 → ℂ, iteratedFDeriv ℂ 2 (fun z : Fin 2 → ℂ ↦ z 0 ^ 2) z
      ![Pi.single 0 1, Pi.single 0 1] = 2 := sorry

/-- Division by `z_k - ζ` with bounds (Waldschmidt, Lemma 4.8, Step 2.4, `p = 1`). -/
theorem exists_div_sub_single (f : (Fin n → ℂ) → ℂ) (hf : Differentiable ℂ f) (k : Fin n)
    (ζ : ℂ) :
    ∃ g : (Fin n → ℂ) → ℂ, Differentiable ℂ g ∧
      (∀ z, f z = f (Function.update z k ζ) + (z k - ζ) * g z) ∧
      (∀ r R M : ℝ, ‖ζ‖ ≤ r → r < R → (∀ z ∈ closedBall (0 : Fin n → ℂ) R, ‖f z‖ ≤ M) →
        ∀ z ∈ closedBall (0 : Fin n → ℂ) R, ‖g z‖ ≤ 2 * M / (R - r)) ∧
      (∀ (j : Fin n) (e : ℕ), (∀ z', ∃ P : ℂ[X], P.natDegree ≤ e ∧
          ∀ w, f (Function.update z' j w) = P.eval w) →
        ∀ z', ∃ P : ℂ[X], P.natDegree ≤ e ∧ ∀ w, g (Function.update z' j w) = P.eval w) := sorry

/-- Division by `P(z_k)` with bounds (Waldschmidt, Lemma 4.8, case `m = n`). -/
theorem exists_div_polynomial (P : ℂ[X]) (hP : P.Monic) {r R : ℝ} (hr : 0 < r)
    (hR : 5 * r ≤ R) (hroots : ∀ ζ ∈ P.roots, ‖ζ‖ ≤ r) (k : Fin n) (f : (Fin n → ℂ) → ℂ)
    (hf : Differentiable ℂ f) :
    ∃ f₀ f₁ : (Fin n → ℂ) → ℂ, Differentiable ℂ f₀ ∧ Differentiable ℂ f₁ ∧
      (∀ z, f z = f₀ z + f₁ z * P.eval (z k)) ∧
      (∀ z', ∃ Q : ℂ[X], Q.degree < P.natDegree ∧ ∀ w, f₀ (Function.update z' k w) = Q.eval w) ∧
      (∀ M : ℝ, (∀ z ∈ closedBall (0 : Fin n → ℂ) R, ‖f z‖ ≤ M) →
        (∀ z ∈ closedBall (0 : Fin n → ℂ) R, ‖f₀ z‖ ≤ 3 ^ P.natDegree * M) ∧
        ∀ z ∈ closedBall (0 : Fin n → ℂ) R, ‖f₁ z‖ ≤ (3 / R) ^ P.natDegree * M) ∧
      ((∀ ζ ∈ P.roots, ∀ κ < P.rootMultiplicity ζ, ∀ z,
          mDeriv (Pi.single k κ) f (Function.update z k ζ) = 0) → f₀ = 0) := sorry

/-- Division by `P₁(z₁), …, Pₙ(zₙ)` with bounds (Waldschmidt, Lemma 4.8, case `m = 1`). -/
theorem exists_div_cartesian (P : Fin n → ℂ[X]) (hP : ∀ i, (P i).Monic) {r R : ℝ} (hr : 0 < r)
    (hR : 5 * r ≤ R) (hroots : ∀ i, ∀ ζ ∈ (P i).roots, ‖ζ‖ ≤ r) (f : (Fin n → ℂ) → ℂ)
    (hf : Differentiable ℂ f) :
    ∃ F : Option (Fin n) → (Fin n → ℂ) → ℂ, (∀ o, Differentiable ℂ (F o)) ∧
      (∀ z, f z = F none z + ∑ i, F (some i) z * (P i).eval (z i)) ∧
      (∀ (j : Fin n) (z' : Fin n → ℂ), ∃ Q : ℂ[X], Q.degree < (P j).natDegree ∧
        ∀ w, F none (Function.update z' j w) = Q.eval w) ∧
      (∀ M : ℝ, (∀ z ∈ closedBall (0 : Fin n → ℂ) R, ‖f z‖ ≤ M) →
        (∀ z ∈ closedBall (0 : Fin n → ℂ) R,
          ‖F none z‖ ≤ 9 ^ (n * Finset.univ.sup (fun i ↦ (P i).natDegree)) * M) ∧
        ∀ i, ∀ z ∈ closedBall (0 : Fin n → ℂ) R, ‖F (some i) z‖ ≤
          9 ^ (n * Finset.univ.sup (fun i ↦ (P i).natDegree)) * M / R ^ (P i).natDegree) ∧
      ((∀ ζ : Fin n → ℂ, (∀ i, ζ i ∈ (P i).roots) → ∀ κ : Fin n → ℕ,
          (∀ i, κ i < (P i).rootMultiplicity (ζ i)) → mDeriv κ f ζ = 0) → F none = 0) := sorry

/-- Schwarz lemma for Cartesian products (Waldschmidt, Proposition 4.7). -/
theorem norm_le_of_vanishing_cartesian (E : Fin n → Finset ℂ) {S₀ S₁ : ℕ}
    (hE : ∀ i, (E i).card = S₁) {r R M : ℝ} (hr : 0 < r) (hEr : ∀ i, ∀ ζ ∈ E i, ‖ζ‖ ≤ r)
    (hR : 18 ^ n * r ≤ R) (f : (Fin n → ℂ) → ℂ) (hf : Differentiable ℂ f)
    (hvan : ∀ ξ : Fin n → ℂ, (∀ i, ξ i ∈ E i) → ∀ σ : Fin n → ℕ, (∀ i, σ i < S₀) →
      mDeriv σ f ξ = 0)
    (hM : ∀ z ∈ closedBall (0 : Fin n → ℂ) R, ‖f z‖ ≤ M) :
    ∀ z ∈ closedBall (0 : Fin n → ℂ) r, ‖f z‖ ≤ M * (18 ^ n * r / R) ^ (S₀ * S₁) := sorry

/-- Derivatives of `z^τ e^{(tx)·z}` at `sy` (Waldschmidt, Lemma 4.9). -/
theorem mDeriv_monomial_mul_exp {d₁ ℓ₁ : ℕ} (x : Fin d₁ → Fin n → ℂ) (y : Fin ℓ₁ → Fin n → ℂ)
    (τ σ : Fin n → ℕ) (t : Fin d₁ → ℤ) (s : Fin ℓ₁ → ℤ) (T S : ℝ)
    (hT : 1 ≤ T) (hTt : ∑ i, (|t i| : ℝ) ≤ T) (hS : 1 ≤ S) (hSs : ∑ j, (|s j| : ℝ) ≤ S) :
    ∃ P : MvPolynomial ((Fin n × Fin d₁) ⊕ (Fin n × Fin ℓ₁)) ℤ,
      mDeriv σ (fun z ↦ (∏ ν, z ν ^ τ ν) * exp (∑ ν, (∑ i, (t i : ℂ) * x i ν) * z ν))
          (fun ν ↦ ∑ j, (s j : ℂ) * y j ν) =
        MvPolynomial.eval₂ (Int.castRingHom ℂ) (Sum.elim (fun p ↦ x p.2 p.1) (fun p ↦ y p.2 p.1)) P *
          ∏ i, ∏ j, exp ((∑ ν, x i ν * y j ν) * ((t i : ℂ) * s j)) ∧
      (∀ m ∈ P.support, ∑ v ∈ m.support.filter (fun v ↦ v.isLeft), m v ≤ ∑ ν, σ ν) ∧
      (∀ m ∈ P.support, ∑ v ∈ m.support.filter (fun v ↦ v.isRight), m v ≤ ∑ ν, τ ν) ∧
      ∑ m ∈ P.support, (|P.coeff m| : ℝ) ≤ T ^ (∑ ν, σ ν) * S ^ (∑ ν, τ ν) *
        min ((1 + ((Finset.univ.sup τ : ℕ) : ℝ) / (T * S)) ^ (∑ ν, σ ν))
          ((1 + ((Finset.univ.sup σ : ℕ) : ℝ) / (T * S)) ^ (∑ ν, τ ν)) := sorry

/-- Thue-Siegel lemma for real linear inequalities (Waldschmidt, Lemma 4.11). -/
theorem exists_int_vec_small_real {ν μ : ℕ} (v : Fin ν → Fin μ → ℝ) (U X ℓ : ℕ) (hU : 0 < U)
    (hUv : ∀ j, ∑ i, |v i j| ≤ U) (hX : 0 < X) (hℓ : 0 < ℓ) (hcard : ℓ ^ μ < (X + 1) ^ ν) :
    ∃ ξ : Fin ν → ℤ, ξ ≠ 0 ∧ (∀ i, |ξ i| ≤ X) ∧
      ∀ j, |∑ i, v i j * ξ i| ≤ (U : ℝ) * X / ℓ := sorry

/-- Small integer combinations of complex vectors (Waldschmidt, Lemma 4.12). -/
theorem exists_int_vec_small_complex {ν μ : ℕ} (u : Fin ν → Fin μ → ℂ) (X : ℕ) (hX : 0 < X)
    (U V : ℝ) (hU : ∀ j, ∑ i, ‖u i j‖ ≤ Real.exp U)
    (h : (Real.sqrt 2 * X * Real.exp (U + V) + 1) ^ (2 * μ) ≤ ((X : ℝ) + 1) ^ ν) :
    ∃ ξ : Fin ν → ℤ, ξ ≠ 0 ∧ (∀ i, |ξ i| ≤ X) ∧
      ∀ j, ‖∑ i, u i j * ξ i‖ ≤ Real.exp (-V) := sorry

/-- Cauchy's inequalities on polydiscs. -/
theorem norm_mDeriv_le (f : (Fin n → ℂ) → ℂ) (hf : Differentiable ℂ f) {r M : ℝ} (hr : 0 < r)
    (hM : ∀ z ∈ closedBall (0 : Fin n → ℂ) r, ‖f z‖ ≤ M) (σ : Fin n → ℕ) :
    ‖mDeriv σ f 0‖ ≤ (∏ i, ((σ i).factorial : ℝ)) * M / r ^ (∑ i, σ i) ∧
      ∀ ζ : Fin n → ℂ, 1 + ‖ζ‖ ≤ r →
        ‖mDeriv σ f ζ‖ ≤ (∏ i, ((σ i).factorial : ℝ)) * M / (r - ‖ζ‖) ^ (∑ i, σ i) := sorry

/-- Interpolation by the truncated Taylor expansion (Waldschmidt, Lemma 4.13, with `1 + T`). -/
theorem norm_le_truncatedTaylor (F : (Fin n → ℂ) → ℂ) (hF : Differentiable ℂ F) {r R M : ℝ}
    (hr : 0 < r) (hrR : r < R) (T : ℕ) (hT : 1 ≤ T)
    (hM : ∀ z ∈ closedBall (0 : Fin n → ℂ) R, ‖F z‖ ≤ M) :
    ∀ z ∈ closedBall (0 : Fin n → ℂ) r, ‖F z‖ ≤ (1 + T) * (r / R) ^ T * M +
      ∑ τ ∈ Finset.univ.filter (fun τ : Fin n → Fin T ↦ ∑ i, (τ i : ℕ) < T),
        ‖mDeriv (fun i ↦ (τ i : ℕ)) F 0‖ * r ^ (∑ i, (τ i : ℕ)) / ∏ i, ((τ i : ℕ).factorial : ℝ) :=
  sorry

/-- An integer combination of entire functions that is small on a polydisc
(Waldschmidt, Proposition 4.10). -/
theorem exists_auxiliary_small {L : ℕ} (hn : 1 ≤ n) (N U V R r : ℝ) (hN : 0 < N) (hU : 0 < U)
    (hV : 0 < V) (hr : 0 < r) (φ : Fin L → (Fin n → ℂ) → ℂ) (hφ : ∀ l, Differentiable ℂ (φ l))
    (hW : 12 * (n : ℝ) ^ 2 ≤ N + U + V) (hRr : Real.exp 1 ≤ R / r)
    (hRr' : R / r ≤ Real.exp ((N + U + V) / 6))
    (hφR : ∃ B : Fin L → ℝ, (∀ l, ∀ z ∈ closedBall (0 : Fin n → ℂ) R, ‖φ l z‖ ≤ B l) ∧
      ∑ l, B l ≤ Real.exp U)
    (hmain : (2 * (N + U + V)) ^ (n + 1) ≤ L * N * Real.log (R / r) ^ n) :
    ∃ p : Fin L → ℤ, p ≠ 0 ∧ (∀ l, |(p l : ℝ)| ≤ Real.exp N) ∧
      ∀ z ∈ closedBall (0 : Fin n → ℂ) r, ‖∑ l, (p l : ℂ) * φ l z‖ ≤ Real.exp (-V) := sorry

/-- An exponential polynomial with distinct frequencies vanishes identically only if all its
coefficients vanish. -/
theorem eq_zero_of_sum_polynomial_mul_exp {r : ℕ} (w : Fin r → ℂ) (hw : Function.Injective w)
    (p : Fin r → ℂ[X]) (h : ∀ s : ℂ, ∑ k, (p k).eval s * exp (w k * s) = 0) : p = 0 := sorry

/-- The functions `z^τ e^{(tx)·z}` are linearly independent. -/
theorem linearIndependent_monomial_exp {d₀ d₁ : ℕ} (hd : d₀ ≤ n) (x : Fin d₁ → Fin n → ℂ)
    (hx : LinearIndependent ℚ x) :
    LinearIndependent ℂ (fun (τt : (Fin d₀ → ℕ) × (Fin d₁ → ℕ)) (z : Fin n → ℂ) ↦
      (∏ h, z (Fin.castLE hd h) ^ τt.1 h) * exp (∑ ν, (∑ i, (τt.2 i : ℂ) * x i ν) * z ν)) := sorry

section SchneiderLang

variable {d₀ d₁ : ℕ} (hd₀ : d₀ ≤ n) (x : Fin d₁ → Fin n → ℂ) (y : Fin n → Fin n → ℂ)
  {K : Type*} [Field K] [NumberField K] (ι : K →+* ℂ)

/-- Liouville lower bound, Waldschmidt §4.6 Step 2, (4.14). -/
theorem schneiderLang_liouville_bound
    (hK : (∀ h j, y j (Fin.castLE hd₀ h) ∈ Set.range ι) ∧
      (∀ i j, exp (∑ ν, x i ν * y j ν) ∈ Set.range ι) ∧ ∀ i ν, x i ν ∈ Set.range ι) :
    ∃ c₁ : ℝ, 1 ≤ c₁ ∧ ∀ (T₀ T₁ S₁ : ℕ) (N : ℝ)
      (p : (Fin d₀ → Fin (T₀ + 1)) × (Fin d₁ → Fin (T₁ + 1)) → ℤ) (σ s : Fin n → ℕ),
      0 < N → (∀ l, |(p l : ℝ)| ≤ Real.exp N) → (∀ j, s j < S₁) →
      mDeriv σ (fun z ↦ ∑ l, (p l : ℂ) * ((∏ h, z (Fin.castLE hd₀ h) ^ (l.1 h : ℕ)) *
          exp (∑ ν, (∑ i, ((l.2 i : ℕ) : ℂ) * x i ν) * z ν))) (∑ j, (s j : ℂ) • y j) ≠ 0 →
      -c₁ * (N + (∑ ν, σ ν) * Real.log T₁ + T₀ * Real.log (S₁ + ∑ ν, σ ν) + T₁ * S₁) ≤
        Real.log ‖mDeriv σ (fun z ↦ ∑ l, (p l : ℂ) * ((∏ h, z (Fin.castLE hd₀ h) ^ (l.1 h : ℕ)) *
          exp (∑ ν, (∑ i, ((l.2 i : ℕ) : ℂ) * x i ν) * z ν))) (∑ j, (s j : ℂ) • y j)‖ := sorry

/-- Construction of the auxiliary function and its vanishing, Waldschmidt §4.6 Steps 3-4. -/
theorem schneiderLang_exists_vanishing
    (hK : (∀ h j, y j (Fin.castLE hd₀ h) ∈ Set.range ι) ∧
      (∀ i j, exp (∑ ν, x i ν * y j ν) ∈ Set.range ι) ∧ ∀ i ν, x i ν ∈ Set.range ι)
    (hx : LinearIndependent ℚ x) (hy : LinearIndependent ℂ y) :
    ∃ c₃ c₄ c₅ c₇ c₈ c₂ : ℝ, 0 < c₃ ∧ 0 < c₄ ∧ 0 < c₅ ∧ 0 < c₇ ∧ 0 < c₈ ∧ 0 < c₂ ∧
      ∀ (T₀ T₁ S₀ S₁ : ℕ) (E : ℝ), 2 ≤ T₀ → 2 ≤ T₁ → 2 ≤ S₀ → 2 ≤ S₁ → Real.exp 1 ≤ E →
        let L : ℝ := ((T₀ + 1 : ℕ) : ℝ) ^ d₀ * ((T₁ + 1 : ℕ) : ℝ) ^ d₁
        T₀ * Real.log (S₁ * E) + T₁ * S₁ * E ≤ c₅ * L ^ (1 / (n : ℝ)) * Real.log E →
        c₇ * (S₀ * Real.log (S₀ * T₁) + T₀ * Real.log (S₀ * S₁ * E) + T₁ * S₁ * E) <
          L ^ (1 / (n : ℝ)) * Real.log E →
        c₈ * L ^ (1 / (n : ℝ)) ≤ S₀ * S₁ →
        ∃ p : (Fin d₀ → Fin (T₀ + 1)) × (Fin d₁ → Fin (T₁ + 1)) → ℤ, p ≠ 0 ∧
          (∀ l, |(p l : ℝ)| ≤ Real.exp (c₄ * c₃ * L ^ (1 / (n : ℝ)) * Real.log E)) ∧
          (fun z : Fin n → ℂ ↦ ∑ l, (p l : ℂ) * ((∏ h, z (Fin.castLE hd₀ h) ^ (l.1 h : ℕ)) *
            exp (∑ ν, (∑ i, ((l.2 i : ℕ) : ℂ) * x i ν) * z ν))) ≠ 0 ∧
          ∀ σ s : Fin n → ℕ, (∀ ν, σ ν < S₀) → (∀ j, s j < S₁) →
            mDeriv σ (fun z ↦ ∑ l, (p l : ℂ) * ((∏ h, z (Fin.castLE hd₀ h) ^ (l.1 h : ℕ)) *
              exp (∑ ν, (∑ i, ((l.2 i : ℕ) : ℂ) * x i ν) * z ν))) (∑ j, (s j : ℂ) • y j) = 0 :=
  sorry

/-- Upper bound for the first nonvanishing derivative, Waldschmidt §4.6 Step 5 (corrected:
vanishing measured by the total order `‖σ‖`, exponent `S₀' S₁ / (2n)`). -/
theorem schneiderLang_upper_bound (hn : 1 ≤ n) (hy : LinearIndependent ℂ y) :
    ∃ c₉ c₁₀ : ℝ, ∀ (T₀ T₁ S₁ S₀' : ℕ) (N E E' : ℝ)
      (p : (Fin d₀ → Fin (T₀ + 1)) × (Fin d₁ → Fin (T₁ + 1)) → ℤ) (σ0 s0 : Fin n → ℕ),
      Real.exp 1 ≤ E' → (∀ l, |(p l : ℝ)| ≤ Real.exp N) →
      N ≤ (S₀' * S₁ / (2 * n)) * Real.log E' →
      (∀ σ s : Fin n → ℕ, ∑ ν, σ ν < S₀' → (∀ j, s j < S₁) →
        mDeriv σ (fun z ↦ ∑ l, (p l : ℂ) * ((∏ h, z (Fin.castLE hd₀ h) ^ (l.1 h : ℕ)) *
          exp (∑ ν, (∑ i, ((l.2 i : ℕ) : ℂ) * x i ν) * z ν))) (∑ j, (s j : ℂ) • y j) = 0) →
      ∑ ν, σ0 ν = S₀' → (∀ j, s0 j < S₁) →
      Real.log ‖mDeriv σ0 (fun z ↦ ∑ l, (p l : ℂ) * ((∏ h, z (Fin.castLE hd₀ h) ^ (l.1 h : ℕ)) *
          exp (∑ ν, (∑ i, ((l.2 i : ℕ) : ℂ) * x i ν) * z ν))) (∑ j, (s0 j : ℂ) • y j)‖ ≤
        -(S₀' * S₁ / (2 * n)) * Real.log E' + c₉ * S₀' * Real.log S₀' +
          c₁₀ * (T₀ * Real.log (S₁ * E') + T₁ * S₁ * E') := sorry

end SchneiderLang

/-- The criterion of Schneider-Lang for `ℂ^{d₀} × (ℂ^×)^{d₁}` (Waldschmidt, Corollary 4.2). -/
theorem schneiderLang_cartesian {d₀ d₁ : ℕ} (hd₀ : d₀ ≤ n) (hn : n < d₀ + d₁)
    (x : Fin d₁ → Fin n → ℂ) (hxalg : ∀ i ν, IsAlgebraic ℚ (x i ν)) (hx : LinearIndependent ℚ x)
    (y : Fin n → Fin n → ℂ) (hy : LinearIndependent ℂ y) :
    ¬ ((∀ (h : Fin d₀) j, IsAlgebraic ℚ (y j (Fin.castLE hd₀ h))) ∧
        ∀ i j, IsAlgebraic ℚ (exp (∑ ν, x i ν * y j ν))) := sorry

/-- Waldschmidt, Corollary 4.3. -/
theorem schneiderLang_homogeneous {d ℓ : ℕ} (x : Fin d → Fin n → ℂ)
    (hxalg : ∀ i ν, IsAlgebraic ℚ (x i ν))
    (hrank : n + 1 ≤ Module.finrank ℚ (Submodule.span ℚ (Set.range x)))
    (y : Fin ℓ → Fin n → ℂ) (hy : Submodule.span ℂ (Set.range y) = ⊤) :
    ∃ i j, (∑ ν, x i ν * y j ν) ∉ Transcendence.algebraicLogs := sorry

/-- Waldschmidt, Corollary 4.4. -/
theorem schneiderLang_inhomogeneous {d : ℕ} (hd : 0 < d) (x : Fin d → Fin d → ℂ)
    (hxalg : ∀ i ν, IsAlgebraic ℚ (x i ν)) (hx : LinearIndependent ℚ x) (y : Fin d → Fin d → ℂ)
    (hy : LinearIndependent ℂ y) (hy₁ : ∀ j, IsAlgebraic ℚ (y j ⟨0, hd⟩)) :
    ∃ i j, (∑ ν, x i ν * y j ν) ∉ Transcendence.algebraicLogs := sorry

/-- Bertrand-Masser (Waldschmidt, Theorem 4.5). -/
theorem eq_zero_of_isAlgebraic_sum_basis_mul (K : IntermediateField ℚ ℂ) [FiniteDimensional ℚ K]
    {d : ℕ} (b : Module.Basis (Fin d) ℚ K) (ℓ : Fin d → ℂ)
    (hℓ : ∀ i, ℓ i ∈ Transcendence.algebraicLogs) (h : IsAlgebraic ℚ (∑ i, (b i : ℂ) * ℓ i)) :
    ℓ = 0 := sorry

end Baker

namespace Transcendence

/-- Baker's theorem (Evertse Theorem 5.1, Waldschmidt Theorem 1.6). -/
theorem linearIndependent_cons_one_of_linearIndependent_rat {m : ℕ} (l : Fin m → ℂ)
    (hl : ∀ i, l i ∈ algebraicLogs) (hind : LinearIndependent ℚ l) :
    LinearIndependent (integralClosure ℚ ℂ) (Fin.cons 1 l : Fin (m + 1) → ℂ) := sorry

/-- Evertse Theorem 4.19. -/
theorem transcendental_sum_mul_of_linearIndependent {m : ℕ} (hm : 0 < m) (l : Fin m → ℂ)
    (hl : ∀ i, l i ∈ algebraicLogs) (hind : LinearIndependent ℚ l) (β : Fin m → ℂ)
    (hβ : ∀ i, IsAlgebraic ℚ (β i)) (hβ0 : ∀ i, β i ≠ 0) :
    Transcendental ℚ (∑ i, β i * l i) := sorry

/-- Evertse Corollary 4.20. -/
theorem transcendental_exp_sum_mul {m : ℕ} (l : Fin m → ℂ) (hl : ∀ i, l i ∈ algebraicLogs)
    (hmul : ∀ k : Fin m → ℤ, ∏ i, exp (l i) ^ k i = 1 → k = 0) (β : Fin m → ℂ)
    (hβ : ∀ i, IsAlgebraic ℚ (β i)) (hβq : ¬ ∀ i, ∃ q : ℚ, β i = q) :
    Transcendental ℚ (exp (∑ i, β i * l i)) := sorry

end Transcendence

/-! ## Explicit lower bounds for linear forms in logarithms (Evertse §5.1, §5.4) -/

namespace LogarithmicForms

open NumberField Transcendence

/-- Waldschmidt's measure (DALAG Theorem 9.1 with `C(m) = 2^{m+25} m^{3m+9}`, Proposition 9.18);
`β₀` is the constant term and `k = m - 1` indexes `λ_m`. -/
theorem waldschmidt_measure {m : ℕ} (hm : 1 ≤ m) (l : Fin m → ℂ) (hl : ∀ j, l j ∈ algebraicLogs)
    (hind : LinearIndependent ℚ l) (β₀ : ℂ) (β : Fin m → ℂ) (hβ₀ : IsAlgebraic ℚ β₀)
    (hβ : ∀ j, IsAlgebraic ℚ (β j)) (hne : β₀ ≠ 0 ∨ β ≠ 0) (D : ℕ)
    (hD : D = Module.finrank ℚ (IntermediateField.adjoin ℚ
      (Set.range (fun j ↦ exp (l j)) ∪ Set.range β ∪ {β₀})))
    (B E Estar : ℝ) (A : Fin m → ℝ) (hB : Real.exp 1 ≤ B) (hE : Real.exp 1 ≤ E)
    (hEstar : Real.exp 1 ≤ Estar)
    (hA : ∀ j, max (absLogHeight₁ (exp (l j))) (max (E * ‖l j‖ / D) (Real.log E / D)) ≤
      Real.log (A j))
    (hEs : max (Real.log E / D) (Real.log (D / Real.log E)) ≤ Real.log Estar) (hBE : Estar ≤ B)
    (hcase : ((∀ j, D * Real.log (A j) / Real.log E ≤ B) ∧ absLogHeight₁ β₀ ≤ Real.log B ∧
        ∀ j, absLogHeight₁ (β j) ≤ Real.log B) ∨
      (β₀ = 0 ∧ (∀ j, ∃ b : ℤ, β j = b) ∧ β ⟨m - 1, by omega⟩ ≠ 0 ∧
        ∀ j : Fin m, (j : ℕ) < m - 1 → (‖β ⟨m - 1, by omega⟩‖ / Real.log (A j) +
          ‖β j‖ / Real.log (A ⟨m - 1, by omega⟩)) * Real.log E / D ≤ B)) :
    β₀ + ∑ j, β j * l j ≠ 0 ∧
      Real.exp (-(2 ^ (m + 25) * (m : ℝ) ^ (3 * m + 9)) * (D : ℝ) ^ (m + 2) * Real.log B *
          (∏ j, Real.log (A j)) * Real.log Estar * Real.log E ^ (-((m : ℤ) + 1))) <
        ‖β₀ + ∑ j, β j * l j‖ := sorry

/-- Baker's lower bound (Evertse Theorem 5.2), with the absolute multiplicative height. -/
theorem baker_lower_bound {m : ℕ} (l : Fin m → ℂ) (hl : ∀ j, l j ∈ algebraicLogs) (D : ℕ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (γ : ℂ) (β : Fin m → ℂ) (B : ℝ), IsAlgebraic ℚ γ →
      (∀ i, IsAlgebraic ℚ (β i)) → (minpoly ℚ γ).natDegree ≤ D →
      (∀ i, (minpoly ℚ (β i)).natDegree ≤ D) → 1 ≤ B → absMulHeight₁ γ ≤ B →
      (∀ i, absMulHeight₁ (β i) ≤ B) → γ + ∑ i, β i * l i ≠ 0 →
      (Real.exp 1 * B) ^ (-C) ≤ ‖γ + ∑ i, β i * l i‖ := sorry

/-- Evertse Corollary 5.3. -/
theorem baker_lower_bound_prod_sub_one {m : ℕ} (α : Fin m → ℂ) (hα : ∀ i, IsAlgebraic ℚ (α i))
    (h0 : ∀ i, α i ≠ 0) :
    ∃ C : ℝ, 0 < C ∧ ∀ b : Fin m → ℤ, ∏ i, α i ^ b i ≠ 1 →
      (Real.exp 1 * ((Finset.univ.sup fun i ↦ (b i).natAbs : ℕ) : ℝ)) ^ (-C) ≤
        ‖∏ i, α i ^ b i - 1‖ := sorry

open Classical in
/-- Matveev's Corollary 2.3 (Izv. Math. 64 (2000)); `κ = 1` for a real field, `2` otherwise. -/
theorem matveev {n : ℕ} (hn : 1 ≤ n) {K : Type*} [Field K] [NumberField K] (ι : K →+* ℂ)
    (α : Fin n → K) (l : Fin n → ℂ) (hl : ∀ j, exp (l j) = ι (α j)) (hl0 : ∀ j, l j ≠ 0)
    (b : Fin n → ℤ) (hΛ : ∑ j, (b j : ℂ) * l j ≠ 0) (A : Fin n → ℝ)
    (hA : ∀ j, max (Module.finrank ℚ K * absLogHeight₁ (α j)) (max ‖l j‖ 0.16) ≤ A j)
    (κ : ℕ) (hκ : κ = if ∀ x : K, (ι x).im = 0 then 1 else 2) :
    -(min ((1 / (κ : ℝ)) * (Real.exp 1 * n / 2) ^ κ * 30 ^ (n + 3) * (n : ℝ) ^ (3.5 : ℝ))
          (2 ^ (6 * n + 20))) * (Module.finrank ℚ K : ℝ) ^ 2 * (∏ j, A j) *
        Real.log (Real.exp 1 * Module.finrank ℚ K) *
        Real.log (Real.exp 1 * ((Finset.univ.sup fun j ↦ (b j).natAbs : ℕ) : ℝ)) <
      Real.log ‖∑ j, (b j : ℂ) * l j‖ := sorry

/-- Evertse Theorem 5.4 (Matveev for rationals), with the factor `2/3` of the derivation. -/
theorem matveev_rat {m : ℕ} (a : Fin m → ℚ) (ha : ∀ i, a i ≠ 0) (b : Fin m → ℤ)
    (h : ∏ i, (a i : ℝ) ^ b i ≠ 1) :
    2 / 3 * (Real.exp 1 * ((Finset.univ.sup fun i ↦ (b i).natAbs : ℕ) : ℝ)) ^
        (-(Real.exp 1 / 2 * (m : ℝ) ^ (4.5 : ℝ) * 30 ^ (m + 3) *
          ∏ i, max 1 (Real.log (max (a i).num.natAbs (a i).den)))) ≤
      |∏ i, (a i : ℝ) ^ b i - 1| := sorry

/-- Matveev for `α₁^{b₁} ⋯ αₙ^{bₙ} - 1` over a number field (Bugeaud-Mignotte-Siksek,
Theorem 9.4); principal logarithms. -/
theorem matveev_prod_sub_one {n : ℕ} (hn : 1 ≤ n) {K : Type*} [Field K] [NumberField K]
    (ι : K →+* ℂ) (α : Fin n → K) (hα : ∀ j, α j ≠ 0) (b : Fin n → ℤ)
    (hΛ : ∏ j, ι (α j) ^ b j ≠ 1) (A : Fin n → ℝ)
    (hA : ∀ j, max (Module.finrank ℚ K * absLogHeight₁ (α j))
      (max ‖Complex.log (ι (α j))‖ 0.16) ≤ A j) :
    let D : ℝ := Module.finrank ℚ K
    let B : ℝ := ((Finset.univ.sup fun j ↦ (b j).natAbs : ℕ) : ℝ)
    (-(3 * 30 ^ (n + 4) * ((n : ℝ) + 1) ^ (5.5 : ℝ)) * D ^ 2 * (1 + Real.log D) *
        (1 + Real.log (n * B)) * ∏ j, A j < Real.log ‖∏ j, ι (α j) ^ b j - 1‖) ∧
      ((∀ x : K, (ι x).im = 0) →
        -(1.4 * 30 ^ (n + 3) * (n : ℝ) ^ (4.5 : ℝ)) * D ^ 2 * (1 + Real.log D) *
          (1 + Real.log B) * ∏ j, A j < Real.log ‖∏ j, ι (α j) ^ b j - 1‖) := sorry

/-- Laurent-Mignotte-Nesterenko (Evertse Exercise 5.4). -/
theorem laurent_mignotte_nesterenko (a₁ a₂ : ℚ) (h₁ : 0 < a₁) (h₂ : 0 < a₂) (h₁' : a₁ ≠ 1)
    (h₂' : a₂ ≠ 1) (b₁ b₂ : ℤ) (hb₁ : b₁ ≠ 0) (hb₂ : b₂ ≠ 0)
    (hΛ : b₁ * Real.log a₁ - b₂ * Real.log a₂ ≠ 0) :
    let H₁ : ℝ := max a₁.num.natAbs a₁.den
    let H₂ : ℝ := max a₂.num.natAbs a₂.den
    (-24.34) * (max (Real.log (abs (b₁ : ℝ) / Real.log H₂ + abs (b₂ : ℝ) / Real.log H₁) + 0.14) 21) ^ 2 *
        Real.log H₁ * Real.log H₂ ≤ Real.log (abs (b₁ * Real.log a₁ - b₂ * Real.log a₂)) := sorry

/-- Yu's explicit `𝔭`-adic bound (Compositio 91 (1994), §0.1), stated through the `𝔭`-adic
absolute value with base `N𝔭 = p^{f_𝔭}`: `ord_𝔭(Λ) < Φ log(dB)`. -/
theorem yu {K : Type*} [Field K] [NumberField K] (ι : K →+* ℂ) {n : ℕ} (hn : 2 ≤ n)
    (α : Fin n → K) (hα : ∀ j, α j ≠ 0) (hgen : IntermediateField.adjoin ℚ (Set.range α) = ⊤)
    (p : ℕ) [Fact p.Prime] (v : IsDedekindDomain.HeightOneSpectrum (𝓞 K))
    (hv : (p : 𝓞 K) ∈ v.asIdeal) (hb1 : 1 < ((Ideal.absNorm v.asIdeal : ℕ) : NNReal))
    (b : Fin n → ℤ) (hΛ : ∏ j, α j ^ b j ≠ 1) (h : Fin n → ℝ)
    (hh : ∀ j, max (absLogHeight₁ (α j))
      (max (‖Complex.log (ι (α j))‖ / (10 * Module.finrank ℚ K)) (Real.log p)) ≤ h j) :
    let d : ℝ := Module.finrank ℚ K
    let B : ℝ := max ((Finset.univ.sup fun j ↦ (b j).natAbs : ℕ) : ℝ) 3
    let h' : ℝ := max (Finset.univ.sup' ⟨⟨0, by omega⟩, Finset.mem_univ _⟩ h) 1
    let Φ : ℝ := 22000 * (9.5 * (n + 1) * d / Real.sqrt (Real.log p)) ^ (2 * (n + 1)) *
      ((Ideal.absNorm v.asIdeal : ℝ) - 1) * (∏ j, h j) * Real.log (10 * n * d * h')
    ((Ideal.absNorm v.asIdeal : ℕ) : ℝ) ^ (-(Φ * Real.log (d * B))) <
      v.adicAbv hb1 (∏ j, α j ^ b j - 1) := sorry

/-- Evertse Exercise 5.9(i): lifting the exponent. -/
theorem padicNorm_one_add_pow_sub_one (p : ℕ) [Fact p.Prime] (a : ℤ) (ha : a ≠ 0)
    (hpa : (Odd p ∧ (p : ℤ) ∣ a) ∨ (p = 2 ∧ 4 ∣ a)) (b : ℕ) (hb : 1 ≤ b) :
    padicNorm p ((1 + a) ^ b - 1) = padicNorm p (a * b) ∧
      1 / |((a * b : ℤ) : ℚ)| ≤ padicNorm p (a * b) := sorry

/-- The case `m = 1` of Yu's theorem for rationals, by lifting the exponent. -/
theorem padicNorm_pow_sub_one_ge (p : ℕ) [Fact p.Prime] (a : ℚ) (ha : padicNorm p a = 1) :
    ∃ c : ℚ, 0 < c ∧ c ≤ 1 ∧ ∀ b : ℤ, a ^ b ≠ 1 → c * padicNorm p b ≤ padicNorm p (a ^ b - 1) :=
  sorry

/-- Yu's `p`-adic lower bound for rationals (Evertse Theorem 5.16). -/
theorem yu_rat (p : ℕ) [Fact p.Prime] {m : ℕ} (a : Fin m → ℚ) (ha : ∀ i, padicNorm p (a i) = 1) :
    ∃ C : ℝ, 0 < C ∧ ∀ b : Fin m → ℤ, ∏ i, a i ^ b i ≠ 1 →
      (Real.exp 1 * ((Finset.univ.sup fun i ↦ (b i).natAbs : ℕ) : ℝ)) ^ (-C) ≤
        (padicNorm p (∏ i, a i ^ b i - 1) : ℝ) := sorry

end LogarithmicForms

/-! ################################################################
  Stage DT.4
################################################################ -/

/-
Suggested Lean for `DiophantineApproximationAndTranscendence:DT.4` (Effective applications).

This file is not the roadmap and is not exhaustive: the roadmap document is definitive.
The statements below suggest Lean forms so that contributors and reviewers converge on
names and signatures. Every proof is `sorry`; nothing here is claimed to be formalised.

Conventions pinned by the roadmap (DT.4):
* `K` is a number field of degree `d = Module.finrank ℚ K`; `house` is Mathlib's
  `NumberField.house`; infinite places, their multiplicities and `logEmbedding` are Mathlib's.
* "Effective" means: the bound is an explicit expression in explicitly given data and in the
  constant of a lower bound for a linear form in logarithms, which enters as a hypothesis
  of multiplicative form `(e * max 1 B) ^ (-C) ≤ ‖γ * ∏ u_j ^ e_j - 1‖`.  The theorems of
  `DiophantineApproximationAndTranscendence:DT.3` (Corollary 5.3, Theorem 5.4, Theorem 5.16 of
  Evertse's notes) discharge that hypothesis.
* Certified enumeration of the resulting finite search regions is
  `EffectiveDiophantineMethods:ED.2`, not this file.
-/

open NumberField NumberField.Units NumberField.InfinitePlace
open NumberField.Units.dirichletUnitTheorem
open scoped NumberField Classical

noncomputable section

namespace DiophantineApproximation

/-! ## The group of rational S-units -/

/-- The group `U_S` of rational `S`-units: nonzero rationals whose `p`-adic valuation vanishes
for every prime `p ∉ S` (Evertse, §5.4). -/
def ratSUnits (S : Finset ℕ) : Subgroup ℚˣ where
  carrier := {x | ∀ p : ℕ, p.Prime → p ∉ S → padicValRat p (x : ℚ) = 0}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

theorem mem_ratSUnits_iff {S : Finset ℕ} {x : ℚˣ} :
    x ∈ ratSUnits S ↔ ∀ p : ℕ, p.Prime → p ∉ S → padicValRat p (x : ℚ) = 0 := sorry

theorem mem_ratSUnits_iff_num_den {S : Finset ℕ} {x : ℚˣ} :
    x ∈ ratSUnits S ↔
      (x : ℚ).num.natAbs ∈ Nat.factoredNumbers S ∧ (x : ℚ).den ∈ Nat.factoredNumbers S := sorry

theorem mem_ratSUnits_iff_eq_sign_mul_prod {S : Finset ℕ} (hS : ∀ p ∈ S, p.Prime) {x : ℚˣ} :
    x ∈ ratSUnits S ↔
      ∃ (ε : ℤˣ) (z : S → ℤ), (x : ℚ) = (ε : ℚ) * ∏ p : S, ((p : ℕ) : ℚ) ^ z p := sorry

theorem ratSUnits_mono {S T : Finset ℕ} (h : S ⊆ T) : ratSUnits S ≤ ratSUnits T := sorry

theorem ratSUnits_empty (x : ℚˣ) : x ∈ ratSUnits ∅ ↔ (x : ℚ) = 1 ∨ (x : ℚ) = -1 := sorry

theorem ratSUnits_mulEquiv (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) :
    Nonempty (ratSUnits S ≃* (ℤˣ × Multiplicative (S → ℤ))) := sorry

theorem ratSUnits_eq_setUnit (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) (x : ℚˣ) :
    x ∈ ratSUnits S ↔
      x ∈ Set.unit ((Rat.HeightOneSpectrum.primesEquiv (R := 𝓞 ℚ)).symm ''
        {p : Nat.Primes | (p : ℕ) ∈ S}) ℚ := sorry

theorem mulHeight₁_ratSUnits (S : Finset ℕ) (x : ℚˣ) (hx : x ∈ ratSUnits S) :
    Height.mulHeight₁ (x : ℚ) =
      max (∏ p ∈ S, (p : ℝ) ^ (padicValRat p (x : ℚ)).toNat)
        (∏ p ∈ S, (p : ℝ) ^ (-padicValRat p (x : ℚ)).toNat) := sorry

/-- Unit test `ratSUnits.test_twelve_fifths`: 12/5 ∈ U_{2,3,5}. -/
example : (Units.mk0 (12 / 5 : ℚ) (by norm_num)) ∈ ratSUnits {2, 3, 5} := sorry

/-- Unit test `ratSUnits.test_seven`: 7 ∉ U_{2,3}; a definition that only asks the primes of S to
divide num·den (and forgets the other primes) accepts it. -/
example : (Units.mk0 (7 : ℚ) (by norm_num)) ∉ ratSUnits {2, 3} := sorry

/-- Unit test `ratSUnits.test_empty`: x ∈ U_∅ ↔ x = 1 ∨ x = −1; a definition as the positive
S-smooth rationals would lose −1. -/
example (x : ℚˣ) : x ∈ ratSUnits ∅ ↔ x = 1 ∨ x = -1 := sorry

/-- Unit test `ratSUnits.test_setUnit`: For S consisting of primes, x ∈ U_S ↔ x ∈ Set.unit S' ℚ
(Mathlib's S-units for 𝓞 ℚ ⊂ ℚ). -/
example (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) :
    ∀ x : ℚˣ, x ∈ ratSUnits S ↔
      x ∈ Set.unit ((Rat.HeightOneSpectrum.primesEquiv (R := 𝓞 ℚ)).symm ''
        {p : Nat.Primes | (p : ℕ) ∈ S}) ℚ :=
  fun x => ratSUnits_eq_setUnit S hS x

/-! ## Height, degree and exponent conversion lemmas -/

/-- If `x ≤ a + b log x` then `x ≤ 2a + 2b (log (2b) - 1)`. -/
theorem le_two_mul_add_of_le_add_mul_log {a b x : ℝ} (hb : 0 < b) (hx : 0 < x)
    (h : x ≤ a + b * Real.log x) : x ≤ 2 * a + 2 * b * (Real.log (2 * b) - 1) := sorry

/-- Conjugates share the minimal polynomial, hence degree, naive height and Mahler measure
(the latter two are the `DT.0` definitions). -/
theorem minpoly_embedding_eq {K : Type*} [Field K] [NumberField K] (σ : K →+* ℂ) (α : K) :
    minpoly ℚ (σ α) = minpoly ℚ α := sorry

theorem abs_log_norm_embedding_unit_le {K : Type*} [Field K] [NumberField K]
    (u : (𝓞 K)ˣ) (σ : K →+* ℂ) :
    |Real.log ‖σ (u : K)‖| ≤ (Module.finrank ℚ K - 1 : ℝ) * Real.log (house (u : K)) := sorry

theorem exists_norm_embedding_le_house_rpow {K : Type*} [Field K] [NumberField K]
    (hd : 2 ≤ Module.finrank ℚ K) (y : (𝓞 K)ˣ) :
    ∃ σ : K →+* ℂ, ‖σ (y : K)‖ ≤
      house (y : K) ^ (-(1 / ((Module.finrank ℚ K : ℝ) - 1))) := sorry

/-- Evertse, Lemma 5.9: the exponents of a unit with respect to a family of maximal rank are
bounded by an explicit multiple of the logarithm of its house. -/
theorem abs_exponent_le_log_house {K : Type*} [Field K] [NumberField K]
    {u : Fin (rank K) → (𝓞 K)ˣ} (hu : IsMaxRank u) (x ζ : (𝓞 K)ˣ) (hζ : ζ ∈ torsion K)
    (e : Fin (rank K) → ℤ) (hx : x = ζ * ∏ j, u j ^ e j) (j : Fin (rank K)) :
    |(e j : ℝ)| ≤ 2 * (Module.finrank ℚ K - 1 : ℝ) *
      ‖((basisOfIsMaxRank hu).equivFunL : logSpace K →L[ℝ] (Fin (rank K) → ℝ))‖ *
        Real.log (house (x : K)) := sorry

theorem exists_zpow_prod_near_logEmbedding {K : Type*} [Field K] [NumberField K]
    {u : Fin (rank K) → (𝓞 K)ˣ} (hu : IsMaxRank u) (v : logSpace K) :
    ∃ n : Fin (rank K) → ℤ,
      ‖v - logEmbedding K (Additive.ofMul (∏ j, u j ^ n j))‖ ≤
        ∑ j, ‖logEmbedding K (Additive.ofMul (u j))‖ := sorry

/-- Evertse, Lemma 5.10, with the explicit constant `rank K * ∑ ‖logEmbedding (u j)‖`. -/
theorem exists_unit_mul_balanced {K : Type*} [Field K] [NumberField K]
    {u : Fin (rank K) → (𝓞 K)ˣ} (hu : IsMaxRank u) {α : 𝓞 K} (hα : α ≠ 0) :
    ∃ n : Fin (rank K) → ℤ, ∀ w : InfinitePlace K,
      |Real.log (w (((∏ j, u j ^ n j : (𝓞 K)ˣ) : K) * (α : K))) -
          Real.log |Algebra.norm ℚ (α : K)| / Module.finrank ℚ K| ≤
        rank K * ∑ j, ‖logEmbedding K (Additive.ofMul (u j))‖ := sorry

/-- The finite set of representatives of the divisors of `α` up to units (Evertse,
Corollary 5.11): divisors whose house is at most `exp c₁ · |N(α)|^{1/d}`. -/
def boundedDivisors {K : Type*} [Field K] [NumberField K]
    (u : Fin (rank K) → (𝓞 K)ˣ) (α : 𝓞 K) : Set (𝓞 K) :=
  {γ | γ ∣ α ∧ house (γ : K) ≤
    Real.exp (rank K * ∑ j, ‖logEmbedding K (Additive.ofMul (u j))‖) *
      |(Algebra.norm ℚ (α : K) : ℝ)| ^ (1 / (Module.finrank ℚ K : ℝ))}

theorem mem_boundedDivisors {K : Type*} [Field K] [NumberField K]
    (u : Fin (rank K) → (𝓞 K)ˣ) (α γ : 𝓞 K) :
    γ ∈ boundedDivisors u α ↔ γ ∣ α ∧ house (γ : K) ≤
      Real.exp (rank K * ∑ j, ‖logEmbedding K (Additive.ofMul (u j))‖) *
        |(Algebra.norm ℚ (α : K) : ℝ)| ^ (1 / (Module.finrank ℚ K : ℝ)) := Iff.rfl

theorem boundedDivisors_finite {K : Type*} [Field K] [NumberField K]
    (u : Fin (rank K) → (𝓞 K)ˣ) {α : 𝓞 K} (hα : α ≠ 0) :
    (boundedDivisors u α).Finite := sorry

theorem exists_mem_boundedDivisors_of_dvd {K : Type*} [Field K] [NumberField K]
    {u : Fin (rank K) → (𝓞 K)ˣ} (hu : IsMaxRank u) {α β : 𝓞 K} (hα : α ≠ 0) (hβ : β ∣ α) :
    ∃ γ ∈ boundedDivisors u α, ∃ ε : (𝓞 K)ˣ, β = ε * γ := sorry

theorem boundedDivisors_subset_dvd {K : Type*} [Field K] [NumberField K]
    (u : Fin (rank K) → (𝓞 K)ˣ) (α : 𝓞 K) : boundedDivisors u α ⊆ {γ | γ ∣ α} := sorry

theorem one_mem_boundedDivisors {K : Type*} [Field K] [NumberField K]
    (u : Fin (rank K) → (𝓞 K)ˣ) {α : 𝓞 K} (hα : α ≠ 0) : 1 ∈ boundedDivisors u α := sorry

theorem boundedDivisors_mul_unit {K : Type*} [Field K] [NumberField K]
    (u : Fin (rank K) → (𝓞 K)ˣ) (α : 𝓞 K) (η : (𝓞 K)ˣ) :
    boundedDivisors u ((η : 𝓞 K) * α) = boundedDivisors u α := sorry

/-- Unit test `boundedDivisors.test_rat`: For K = ℚ and m ≠ 0: D(m) = {γ : γ ∣ m ∧ |γ| ≤ |m|}. -/
example (u : Fin (rank ℚ) → (𝓞 ℚ)ˣ) (m : 𝓞 ℚ) (hm : m ≠ 0) :
    boundedDivisors u m = {γ | γ ∣ m ∧ |((γ : ℚ) : ℝ)| ≤ |((m : ℚ) : ℝ)|} := sorry

/-- Unit test `boundedDivisors.test_six`: For K = ℚ: D(6) = {±1, ±2, ±3, ±6}. -/
example (u : Fin (rank ℚ) → (𝓞 ℚ)ˣ) :
    ((↑) : 𝓞 ℚ → ℚ) '' boundedDivisors u 6 = {1, -1, 2, -2, 3, -3, 6, -6} := sorry

/-- Unit test `boundedDivisors.test_unit`: If α is a unit then every element of D_u(α) is a unit. -/
example {K : Type*} [Field K] [NumberField K] (u : Fin (rank K) → (𝓞 K)ˣ) (α : (𝓞 K)ˣ) :
    ∀ γ ∈ boundedDivisors u (α : 𝓞 K), IsUnit γ := sorry

/-- Unit test `boundedDivisors.test_all_divisors_infinite`: If rank K ≥ 1 then {γ : γ ∣ 1} (all
units) is infinite; a definition without the house bound would not give a finite set. -/
example {K : Type*} [Field K] [NumberField K] (hr : 1 ≤ rank K) :
    {γ : 𝓞 K | γ ∣ 1}.Infinite := sorry

theorem padicValNat_mul_log_le_log {p n : ℕ} (hp : p.Prime) (hn : n ≠ 0) :
    (padicValNat p n : ℝ) * Real.log p ≤ Real.log n := sorry

/-! ## Exponential equations (Evertse, Corollary 5.5 and Theorem 5.6) -/

theorem max_pow_mul_le_abs_pow_sub_pow {a b : ℕ} (ha : 2 ≤ a) (hb : 2 ≤ b) {C₁ : ℝ}
    (hC₁ : 0 < C₁)
    (hLB : ∀ k l : ℤ, (b : ℝ) ^ k * (a : ℝ) ^ (-l) ≠ 1 →
      (Real.exp 1 * max 1 (max |(k : ℝ)| |(l : ℝ)|)) ^ (-C₁) ≤
        |(b : ℝ) ^ k * (a : ℝ) ^ (-l) - 1|)
    {m n : ℕ} (hm : 0 < m) (hn : 0 < n) (hne : a ^ m ≠ b ^ n) :
    max ((a : ℝ) ^ m) ((b : ℝ) ^ n) * (Real.exp 1 * max m n) ^ (-C₁) ≤
      |(a : ℝ) ^ m - (b : ℝ) ^ n| := sorry

theorem max_le_of_pow_sub_pow_eq {a b : ℕ} (ha : 2 ≤ a) (hb : 2 ≤ b) {C₁ : ℝ} (hC₁ : 0 < C₁)
    (hLB : ∀ k l : ℤ, (b : ℝ) ^ k * (a : ℝ) ^ (-l) ≠ 1 →
      (Real.exp 1 * max 1 (max |(k : ℝ)| |(l : ℝ)|)) ^ (-C₁) ≤
        |(b : ℝ) ^ k * (a : ℝ) ^ (-l) - 1|)
    {k : ℤ} (hk : k ≠ 0) {m n : ℕ} (hm : 0 < m) (hn : 0 < n)
    (h : (a : ℤ) ^ m - (b : ℤ) ^ n = k) :
    (max m n : ℝ) ≤ 2 * (Real.log |(k : ℝ)| + C₁) / Real.log 2 +
      2 * (C₁ / Real.log 2) * (Real.log (2 * C₁ / Real.log 2) - 1) := sorry

/-- Evertse, Corollary 5.5, made explicit with Matveev's constant (Theorem 5.4, `m = 2`). -/
theorem pow_sub_pow_eq_finite {a b : ℕ} (ha : 2 ≤ a) (hb : 2 ≤ b) {k : ℤ} (hk : k ≠ 0) :
    {mn : ℕ × ℕ | 0 < mn.1 ∧ 0 < mn.2 ∧ (a : ℤ) ^ mn.1 - (b : ℤ) ^ mn.2 = k}.Finite ∧
      ∀ mn ∈ {mn : ℕ × ℕ | 0 < mn.1 ∧ 0 < mn.2 ∧ (a : ℤ) ^ mn.1 - (b : ℤ) ^ mn.2 = k},
        let C₁ : ℝ := Real.exp 1 / 2 * 2 ^ (4.5 : ℝ) * 30 ^ 5 *
          max 1 (Real.log a) * max 1 (Real.log b)
        (max mn.1 mn.2 : ℝ) ≤ 2 * (Real.log |(k : ℝ)| + C₁) / Real.log 2 +
          2 * (C₁ / Real.log 2) * (Real.log (2 * C₁ / Real.log 2) - 1) := sorry

theorem sub_ge_of_mem_factoredNumbers (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) {C : ℝ}
    (hC : 0 < C)
    (hLB : ∀ b : S → ℤ, (∏ p : S, ((p : ℕ) : ℝ) ^ b p) ≠ 1 →
      (Real.exp 1 * ((Finset.univ.sup fun p => (b p).natAbs : ℕ) : ℝ)) ^ (-C) ≤
        |∏ p : S, ((p : ℕ) : ℝ) ^ b p - 1|)
    {x y : ℕ} (hx : x ∈ Nat.factoredNumbers S) (hy : y ∈ Nat.factoredNumbers S) (hxy : x < y) :
    (y : ℝ) * (Real.exp 1 * Real.log y / Real.log 2) ^ (-C) ≤ y - x := sorry

/-- Evertse, Theorem 5.6 (Tijdeman). -/
theorem tijdeman_gap (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) :
    ∃ c₁ c₂ : ℝ, 0 < c₁ ∧ 0 < c₂ ∧ ∀ x ∈ Nat.factoredNumbers S, ∀ y ∈ Nat.factoredNumbers S,
      x < y → (y : ℝ) / (c₁ * Real.log y ^ c₂) ≤ y - x := sorry

/-! ## Unit equations (Evertse, Theorem 5.12) -/

theorem unitEquation_exponent_bound {K : Type*} [Field K] [NumberField K]
    {u : Fin (rank K) → (𝓞 K)ˣ} (hu : IsMaxRank u) (hr : 1 ≤ rank K)
    {α β : K} (hα : α ≠ 0) (hβ : β ≠ 0) {C' : ℝ} (hC' : 0 < C')
    (hLB : ∀ (σ : K →+* ℂ) (γ : K), (∃ ζ ∈ torsion K, γ = α * (ζ : K) ∨ γ = β * (ζ : K)) →
      ∀ e : Fin (rank K) → ℤ, σ (γ * ∏ j, ((u j : 𝓞 K) : K) ^ e j) ≠ 1 →
        (Real.exp 1 * max 1 ((Finset.univ.sup fun j => (e j).natAbs : ℕ) : ℝ)) ^ (-C') ≤
          ‖σ (γ * ∏ j, ((u j : 𝓞 K) : K) ^ e j) - 1‖)
    (x y : (𝓞 K)ˣ) (hxy : α * (x : K) + β * (y : K) = 1)
    (ζx ζy : (𝓞 K)ˣ) (hζx : ζx ∈ torsion K) (hζy : ζy ∈ torsion K)
    (ex ey : Fin (rank K) → ℤ) (hx : x = ζx * ∏ j, u j ^ ex j) (hy : y = ζy * ∏ j, u j ^ ey j) :
    let d : ℝ := Module.finrank ℚ K
    let κ : ℝ := 2 * (d - 1) *
      ‖((basisOfIsMaxRank hu).equivFunL : logSpace K →L[ℝ] (Fin (rank K) → ℝ))‖
    let A : ℝ := κ * (d - 1) * (Real.log (max (house α) (house β)) + C')
    let B : ℝ := κ * (d - 1) * C'
    ((Finset.univ.sup fun j => max (ex j).natAbs (ey j).natAbs : ℕ) : ℝ) ≤
      max 1 (2 * A + 2 * B * (Real.log (2 * B) - 1)) := sorry

/-- Evertse, Theorem 5.12: the unit equation has finitely many solutions, with exponent vectors
(with respect to `fundSystem K`) bounded by the bound of `unitEquation_exponent_bound` for a
constant supplied by Corollary 5.3. -/
theorem unitEquation_finite {K : Type*} [Field K] [NumberField K] {α β : K}
    (hα : α ≠ 0) (hβ : β ≠ 0) :
    {p : (𝓞 K)ˣ × (𝓞 K)ˣ | α * (p.1 : K) + β * (p.2 : K) = 1}.Finite := sorry

/-! ## Thue equations (Evertse, Theorem 5.13) -/

theorem siegel_identity {R : Type*} [CommRing R] (a₁ a₂ a₃ X Y : R) :
    (a₂ - a₃) * (X - a₁ * Y) + (a₃ - a₁) * (X - a₂ * Y) + (a₁ - a₂) * (X - a₃ * Y) = 0 := by
  ring

theorem thue_integralNormalization_iff {f : Polynomial ℤ} {d : ℕ} (hd : f.natDegree = d)
    (hd1 : 1 ≤ d) (x y m : ℤ) :
    MvPolynomial.eval ![x, y] (f.homogenize d) = m ↔
      MvPolynomial.eval ![f.leadingCoeff * x, y] (f.integralNormalization.homogenize d) =
        f.leadingCoeff ^ (d - 1) * m := sorry

theorem thue_form_eq_prod {K : Type*} [Field K] [NumberField K] {g : Polynomial ℤ}
    (hg : g.Monic) (θ : Fin g.natDegree → 𝓞 K)
    (hθ : g.map (algebraMap ℤ (𝓞 K)) = ∏ i, (Polynomial.X - Polynomial.C (θ i))) (x y : ℤ) :
    ((MvPolynomial.eval ![x, y] (g.homogenize g.natDegree) : ℤ) : 𝓞 K) =
      ∏ i, ((x : 𝓞 K) - θ i * y) := sorry

theorem thue_reduction_to_unitEquation {K : Type*} [Field K] [NumberField K]
    {g : Polynomial ℤ} (hg : g.Monic) (θ : Fin 3 → 𝓞 K) (hθ : Function.Injective θ)
    (hroot : ∀ i, Polynomial.aeval (θ i : K) g = 0) {m : ℤ} (hm : m ≠ 0) {x y : ℤ}
    (hxy : MvPolynomial.eval ![x, y] (g.homogenize g.natDegree) = m) :
    ∃ μ : Fin 3 → 𝓞 K, (∀ i, μ i ∈ boundedDivisors (fundSystem K) (m : 𝓞 K)) ∧
      ∃ ε : Fin 3 → (𝓞 K)ˣ, (∀ i, (x : 𝓞 K) - θ i * y = μ i * ε i) ∧
        ((θ 1 - θ 2 : K) / (θ 1 - θ 0) * ((μ 0 : K) / μ 2)) * (((ε 0 / ε 2 : (𝓞 K)ˣ) : 𝓞 K) : K) +
          ((θ 2 - θ 0 : K) / (θ 1 - θ 0) * ((μ 1 : K) / μ 2)) *
            (((ε 1 / ε 2 : (𝓞 K)ˣ) : 𝓞 K) : K) = 1 := sorry

theorem mulHeight₁_ratCast {K : Type*} [Field K] [NumberField K] (q : ℚ) :
    Height.mulHeight₁ (q : K) = Height.mulHeight₁ q ^ Module.finrank ℚ K := sorry

theorem logHeight₁_le_finrank_mul_log_house {K : Type*} [Field K] [NumberField K]
    (α : 𝓞 K) :
    Height.logHeight₁ (α : K) ≤ Module.finrank ℚ K * max 0 (Real.log (house (α : K))) := sorry

/-- Evertse, Theorem 5.13 (Thue equations; the effective box is assembled from
`thue_reduction_to_unitEquation`, `unitEquation_exponent_bound`, `mulHeight₁_ratCast` and
`logHeight₁_le_finrank_mul_log_house`). -/
theorem thueEquation_finite {f : Polynomial ℤ} {d : ℕ} (hd : f.natDegree = d)
    (h3 : 3 ≤ (f.aroots ℂ).toFinset.card) {m : ℤ} (hm : m ≠ 0) :
    {p : ℤ × ℤ | MvPolynomial.eval ![p.1, p.2] (f.homogenize d) = m}.Finite := sorry

/-- The worked example `y³ = 2x(x − 3)` of Evertse §5.3 reduces to finitely many Thue
equations `a u³ − 2 b v³ = 6`. -/
theorem superelliptic_example_reduction {x y : ℤ} (h : y ^ 3 = 2 * x * (x - 3)) :
    ∃ a b u v : ℤ,
      (∃ k l : ℕ, k ≤ 2 ∧ l ≤ 2 ∧ (a = 2 ^ k * 3 ^ l ∨ a = -(2 ^ k * 3 ^ l))) ∧
      (∃ k l : ℕ, k ≤ 2 ∧ l ≤ 2 ∧ (b = 2 ^ k * 3 ^ l ∨ b = -(2 ^ k * 3 ^ l))) ∧
      2 * x = a * u ^ 3 ∧ x - 3 = b * v ^ 3 ∧ a * u ^ 3 - 2 * b * v ^ 3 = 6 := sorry

/-- Evertse, Theorem 5.14 (Baker, 1968). -/
theorem baker_superelliptic {f : Polynomial ℤ} (hsep : (f.map (Int.castRingHom ℚ)).Separable)
    {n : ℕ} (hn : 2 ≤ n) (hdeg : (3 ≤ n → 2 ≤ f.natDegree) ∧ (n = 2 → 3 ≤ f.natDegree))
    {b : ℤ} (hb : b ≠ 0) :
    {p : ℤ × ℤ | b * p.2 ^ n = f.eval p.1}.Finite := sorry

/-- Evertse, Theorem 5.15 (Schinzel–Tijdeman, 1976). -/
theorem schinzel_tijdeman {f : Polynomial ℤ} (hsep : (f.map (Int.castRingHom ℚ)).Separable)
    (hdeg : 2 ≤ f.natDegree) {b : ℤ} (hb : b ≠ 0) :
    ∃ C : ℕ, ∀ (n : ℕ) (x y : ℤ), b * y ^ n = f.eval x → y ≠ 0 → y ≠ 1 → y ≠ -1 → n ≤ C :=
  sorry

/-- Tijdeman (1976), as reported in Evertse §5.1: Catalan's equation has effectively bounded
solutions. -/
theorem tijdeman_catalan :
    ∃ C : ℕ, ∀ x y m n : ℕ, 2 ≤ x → 2 ≤ y → 2 ≤ m → 2 ≤ n →
      (x : ℤ) ^ m - (y : ℤ) ^ n = 1 → x ^ m ≤ C ∧ y ^ n ≤ C := sorry

/-! ## p-adic analogues and S-unit equations (Evertse §5.4) -/

/-- Evertse, Exercise 5.9 (i): the elementary one-term `p`-adic lower bound. -/
theorem padicValInt_one_add_pow_sub_one {p : ℕ} [Fact p.Prime] {a : ℤ} (ha0 : a ≠ 0)
    (ha : (p : ℤ) ∣ a) (h2 : p = 2 → (4 : ℤ) ∣ a) {b : ℕ} (hb : 0 < b) :
    padicValInt p ((1 + a) ^ b - 1) = padicValInt p a + padicValNat p b := sorry

theorem sUnitEquation_coprime_reduction (S : Finset ℕ) (x y : ℚˣ) (hx : x ∈ ratSUnits S)
    (hy : y ∈ ratSUnits S) (hxy : (x : ℚ) + y = 1) :
    ∃ u v w : ℤ, 0 < w ∧ u + v = w ∧ IsCoprime u v ∧ IsCoprime u w ∧ IsCoprime v w ∧
      (x : ℚ) = u / w ∧ (y : ℚ) = v / w ∧ u.natAbs ∈ Nat.factoredNumbers S ∧
      v.natAbs ∈ Nat.factoredNumbers S ∧ w.natAbs ∈ Nat.factoredNumbers S := sorry

theorem sUnitEquation_exponent_bound (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) {C : ℝ}
    (hC : 0 < C)
    (hLB : ∀ p ∈ S, ∀ (ε : ℤˣ) (b : S → ℤ), (∀ hp : p ∈ S, b ⟨p, hp⟩ = 0) →
      (ε : ℚ) * ∏ q : S, ((q : ℕ) : ℚ) ^ b q ≠ 1 →
      (Real.exp 1 * max 1 ((Finset.univ.sup fun q => (b q).natAbs : ℕ) : ℝ)) ^ (-C) ≤
        ((padicNorm p ((ε : ℚ) * ∏ q : S, ((q : ℕ) : ℚ) ^ b q - 1) : ℚ) : ℝ))
    (x y : ℚˣ) (hx : x ∈ ratSUnits S) (hy : y ∈ ratSUnits S) (hxy : (x : ℚ) + y = 1)
    (p : ℕ) :
    (|padicValRat p (x : ℚ)| : ℝ) ≤ max 1 (2 * C / Real.log 2 * Real.log (2 * C / Real.log 2)) ∧
      (|padicValRat p (y : ℚ)| : ℝ) ≤
        max 1 (2 * C / Real.log 2 * Real.log (2 * C / Real.log 2)) := sorry

/-- Evertse, Theorem 5.17. -/
theorem sUnitEquation_finite (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) :
    {xy : ℚˣ × ℚˣ | xy.1 ∈ ratSUnits S ∧ xy.2 ∈ ratSUnits S ∧ (xy.1 : ℚ) + xy.2 = 1}.Finite :=
  sorry

/-! ## Unit equations in finitely generated groups (Evertse, Theorem 5.18) -/

theorem sum_log_place_eq_zero_of_sUnit {K : Type*} [Field K] [NumberField K]
    (S : Finset (FinitePlace K)) {y : K} (hy : y ≠ 0) (hS : ∀ v : FinitePlace K, v ∉ S → v y = 1) :
    (∑ w : InfinitePlace K, (w.mult : ℝ) * Real.log (w y)) + ∑ v ∈ S, Real.log (v y) = 0 ∧
      Height.logHeight₁ y =
        (∑ w : InfinitePlace K, max 0 ((w.mult : ℝ) * Real.log (w y))) +
          ∑ v ∈ S, max 0 (Real.log (v y)) := sorry

theorem exists_small_place_of_sUnit {K : Type*} [Field K] [NumberField K]
    (S : Finset (FinitePlace K)) {y : K} (hy : y ≠ 0) (hS : ∀ v : FinitePlace K, v ∉ S → v y = 1) :
    (∃ w : InfinitePlace K, (w.mult : ℝ) * Real.log (w y) ≤
        -Height.logHeight₁ y / (S.card + Fintype.card (InfinitePlace K))) ∨
      (∃ v ∈ S, Real.log (v y) ≤
        -Height.logHeight₁ y / (S.card + Fintype.card (InfinitePlace K))) := sorry

theorem exists_exponent_le_logHeight {K : Type*} [Field K] [NumberField K] {t : ℕ}
    (γ : Fin t → K) (hγ0 : ∀ j, γ j ≠ 0)
    (hind : ∀ z : Fin t → ℤ, (∃ n : ℕ, 0 < n ∧ (∏ j, γ j ^ z j) ^ n = 1) → z = 0) :
    ∃ κ : ℝ, 0 < κ ∧ ∀ (ζ : K), (∃ n : ℕ, 0 < n ∧ ζ ^ n = 1) → ∀ (z : Fin t → ℤ) (j : Fin t),
      |(z j : ℝ)| ≤ κ * Height.logHeight₁ (ζ * ∏ i, γ i ^ z i) := sorry

theorem gyoryEquation_exponent_bound {K : Type*} [Field K] [NumberField K] {t : ℕ}
    (γ : Fin t → K) (hγ0 : ∀ j, γ j ≠ 0) (S : Finset (FinitePlace K))
    (hS : ∀ j, ∀ v : FinitePlace K, v ∉ S → v (γ j) = 1) {κ : ℝ} (hκ : 0 < κ)
    (hκbound : ∀ (ζ : K), (∃ n : ℕ, 0 < n ∧ ζ ^ n = 1) → ∀ (z : Fin t → ℤ) (j : Fin t),
      |(z j : ℝ)| ≤ κ * Height.logHeight₁ (ζ * ∏ i, γ i ^ z i))
    {a b : K} (ha : a ≠ 0) (hb : b ≠ 0) {C : ℝ} (hC : 0 < C)
    (hLBinf : ∀ (σ : K →+* ℂ) (c : K), (∃ ζ : K, (∃ n : ℕ, 0 < n ∧ ζ ^ n = 1) ∧
        (c = a * ζ ∨ c = b * ζ)) → ∀ z : Fin t → ℤ, c * ∏ j, γ j ^ z j ≠ 1 →
      (Real.exp 1 * max 1 ((Finset.univ.sup fun j => (z j).natAbs : ℕ) : ℝ)) ^ (-C) ≤
        ‖σ (c * ∏ j, γ j ^ z j) - 1‖)
    (hLBfin : ∀ v ∈ S, ∀ (c : K), (∃ ζ : K, (∃ n : ℕ, 0 < n ∧ ζ ^ n = 1) ∧
        (c = a * ζ ∨ c = b * ζ)) → ∀ z : Fin t → ℤ, c * ∏ j, γ j ^ z j ≠ 1 →
      (Real.exp 1 * max 1 ((Finset.univ.sup fun j => (z j).natAbs : ℕ) : ℝ)) ^ (-C) ≤
        v (c * ∏ j, γ j ^ z j - 1))
    (ζx ζy : K) (hζx : ∃ n : ℕ, 0 < n ∧ ζx ^ n = 1) (hζy : ∃ n : ℕ, 0 < n ∧ ζy ^ n = 1)
    (zx zy : Fin t → ℤ)
    (hxy : a * (ζx * ∏ j, γ j ^ zx j) + b * (ζy * ∏ j, γ j ^ zy j) = 1) :
    let s : ℝ := S.card + Fintype.card (InfinitePlace K)
    let M : ℝ := max (max (house a) (house b)) (⨆ v ∈ S, max (v a) (v b))
    let A : ℝ := 2 * κ * s * (Real.log M + C)
    let B : ℝ := 2 * κ * s * C
    ((Finset.univ.sup fun j => max (zx j).natAbs (zy j).natAbs : ℕ) : ℝ) ≤
      max 1 (2 * A + 2 * B * (Real.log (2 * B) - 1)) := sorry

/-- Evertse, Theorem 5.18 (Győry, 1979). -/
theorem gyoryEquation_finite {K : Type*} [Field K] [NumberField K] (Γ : Subgroup Kˣ)
    (hΓ : Γ.FG) {a b : K} (ha : a ≠ 0) (hb : b ≠ 0) :
    {p : Kˣ × Kˣ | p.1 ∈ Γ ∧ p.2 ∈ Γ ∧ a * (p.1 : K) + b * (p.2 : K) = 1}.Finite := sorry

/-! ## Thue–Mahler equations -/

theorem exists_mem_smul_of_dvd_sUnit {K : Type*} [Field K] [NumberField K]
    (P : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 K))) {m : 𝓞 K} (hm : m ≠ 0) :
    ∃ (M : Finset (𝓞 K)) (Γ : Subgroup Kˣ), Γ.FG ∧
      (∀ ε : (𝓞 K)ˣ, Units.map (algebraMap (𝓞 K) K : 𝓞 K →* K) ε ∈ Γ) ∧
      ∀ β : 𝓞 K, β ≠ 0 →
        (∀ v : IsDedekindDomain.HeightOneSpectrum (𝓞 K), v ∉ P →
          v.intValuation m ≤ v.intValuation β) →
        ∃ μ ∈ M, ∃ g ∈ Γ, (β : K) = μ * (g : K) := sorry

theorem thueMahler_finite {f : Polynomial ℤ} {d : ℕ} (hd : f.natDegree = d)
    (h3 : 3 ≤ (f.aroots ℂ).toFinset.card) {m : ℤ} (hm : m ≠ 0) (S : Finset ℕ)
    (hS : ∀ p ∈ S, p.Prime) :
    {p : ℤ × ℤ × (S → ℕ) | IsCoprime p.1 p.2.1 ∧
      MvPolynomial.eval ![p.1, p.2.1] (f.homogenize d) = m * ∏ q : S, (q : ℤ) ^ p.2.2 q}.Finite :=
  sorry

end DiophantineApproximation

/-! ################################################################
  Stage DT.5
################################################################ -/

/-
Suggested Lean for `DiophantineApproximationAndTranscendence:DT.5`
(Further transcendence and unlikely intersections).

This file is not the roadmap and is not exhaustive: the roadmap document is definitive.
The statements below suggest Lean forms so that contributors and reviewers converge on
names and signatures. Every proof is `sorry`; nothing here is claimed to be formalised.

Conventions pinned by the roadmap (DT.5):
* Power series are Mathlib's `PowerSeries ℂ`; an E-function or G-function is given by its
  coefficient sequence `a : ℕ → ℂ` (`f(z) = ∑ a n zⁿ / n!`, resp. `∑ a n zⁿ`).
* `Q̄` is `algebraicClosure ℚ ℂ`; "algebraic coefficients" means `IsAlgebraic ℚ`.
* Transcendence degrees are Mathlib's `Algebra.trdeg` (a cardinal).  Functional transcendence
  degrees are taken over `ℂ(z) = RatFunc ℂ` inside `LaurentSeries ℂ` (for power series with
  algebraic coefficients this equals the transcendence degree over `Q̄(z)`, see
  `algebraicIndependent_ratFunc_iff_of_isAlgebraic_coeff`).
* Conjectures (Schanuel, algebraic independence of logarithms) are `Prop`-valued definitions with
  complete bodies; theorems that use them take them as hypotheses.
* Statements that need the local solution space of a linear differential equation at a singular
  point (Beukers' Theorem 2.1, Corollary 2.2, Theorem 2.5, apparent singularities) or
  differential Galois groups are not stated here: that API does not exist in the pinned libraries
  (see the packet's gaps; `existsUnique_analytic_solution_linearSystem` is the first piece).
  Shidlovskii's lemma and Chudnovsky's theorem are likewise described only in the roadmap
  document.
-/

open scoped RatFunc LaurentSeries Classical
open PowerSeries

noncomputable section

namespace DiophantineApproximation

/-- The algebraic numbers inside `ℂ`, as a subfield. -/
abbrev Qbar : Subfield ℂ := (algebraicClosure ℚ ℂ).toSubfield

/-! ## Foundations planned in DT.5 -/

/-- Cauchy's theorem for linear systems with holomorphic coefficients on a disc. -/
theorem existsUnique_analytic_solution_linearSystem {n : ℕ} (A : Matrix (Fin n) (Fin n) (ℂ → ℂ))
    (z₀ : ℂ) (r : ℝ) (hA : ∀ i j, AnalyticOnNhd ℂ (A i j) (Metric.ball z₀ r)) (y₀ : Fin n → ℂ) :
    ∃! y : Fin n → ℂ → ℂ, (∀ i, AnalyticOnNhd ℂ (y i) (Metric.ball z₀ r)) ∧ (∀ i, y i z₀ = y₀ i) ∧
      ∀ z ∈ Metric.ball z₀ r, ∀ i, deriv (y i) z = ∑ j, A i j z * y j z := sorry

/-- Kähler differentials of a finitely generated extension in characteristic zero. -/
theorem rank_kaehlerDifferential_eq_trdeg (C E : Type*) [Field C] [Field E] [Algebra C E]
    [CharZero C] [Algebra.EssFiniteType C E] :
    Module.rank E (Ω[E⁄C]) = Algebra.trdeg C E := sorry

/-- Fibres of a torsion-free finitely generated family over the affine line. -/
theorem ringKrullDim_quotient_add_one_eq (K : Type*) [Field K] (A : Type*) [CommRing A] [IsDomain A]
    [Algebra (Polynomial K) A] [Algebra.FiniteType (Polynomial K) A]
    [Module.IsTorsionFree (Polynomial K) A] (ξ : K)
    (h : Ideal.span {algebraMap (Polynomial K) A (Polynomial.X - Polynomial.C ξ)} ≠ ⊤) :
    ringKrullDim (A ⧸ Ideal.span {algebraMap (Polynomial K) A (Polynomial.X - Polynomial.C ξ)}) + 1 =
      ringKrullDim A := sorry

/-! ## D-finite power series and minimal differential equations -/

/-- `f` is D-finite (holonomic) over the subfield `k ⊆ ℂ`: it satisfies a nonzero linear
differential equation with polynomial coefficients in `k[z]`. -/
def IsDFinite (k : Subfield ℂ) (f : PowerSeries ℂ) : Prop :=
  ∃ (n : ℕ) (p : Fin (n + 1) → Polynomial ℂ), (∀ i m, (p i).coeff m ∈ k) ∧
    p (Fin.last n) ≠ 0 ∧ ∑ i, (p i : PowerSeries ℂ) * (⇑(PowerSeries.derivative ℂ))^[i] f = 0

namespace IsDFinite

/-- Sums of D-finite series are D-finite. -/
theorem add {k : Subfield ℂ} {f g : PowerSeries ℂ} (hf : IsDFinite k f)
    (hg : IsDFinite k g) : IsDFinite k (f + g) := sorry

theorem mul {k : Subfield ℂ} {f g : PowerSeries ℂ} (hf : IsDFinite k f)
    (hg : IsDFinite k g) : IsDFinite k (f * g) := sorry

theorem derivative {k : Subfield ℂ} {f : PowerSeries ℂ} (hf : IsDFinite k f) :
    IsDFinite k (PowerSeries.derivative ℂ f) := sorry

/-- D-finiteness over `k` implies D-finiteness over any larger subfield `k′`. -/
theorem mono {k k' : Subfield ℂ} (h : k ≤ k') {f : PowerSeries ℂ}
    (hf : IsDFinite k f) : IsDFinite k' f := sorry

end IsDFinite

theorem isDFinite_polynomial {k : Subfield ℂ} (p : Polynomial ℂ) (hp : ∀ m, p.coeff m ∈ k) :
    IsDFinite k (p : PowerSeries ℂ) := sorry

theorem isDFinite_iff_pRecursive {k : Subfield ℂ} {f : PowerSeries ℂ}
    (hf : ∀ m, coeff m f ∈ k) :
    IsDFinite k f ↔ ∃ (r : ℕ) (q : Fin (r + 1) → Polynomial ℂ), (∀ i m, (q i).coeff m ∈ k) ∧
      q (Fin.last r) ≠ 0 ∧ ∀ n : ℕ, ∑ i : Fin (r + 1), (q i).eval (n : ℂ) * coeff (n + i) f = 0 :=
  sorry

/-- Unit test `IsDFinite.test_exp`: PowerSeries.exp ℂ is D-finite over ℚ (f′ − f = 0). -/
example : IsDFinite ⊥ (PowerSeries.exp ℂ) := sorry

/-- Unit test `IsDFinite.test_polynomial`: Every polynomial with coefficients in Q̄ is D-finite over
Q̄ (p f′ − p′ f = 0). -/
example (p : Polynomial ℂ) (hp : ∀ m, p.coeff m ∈ Qbar) : IsDFinite Qbar (p : PowerSeries ℂ) :=
  isDFinite_polynomial p hp

/-- Unit test `IsDFinite.test_geometric`: Σ zⁿ is D-finite over ℚ ((1 − z) f′ − f = 0). -/
example : IsDFinite ⊥ (PowerSeries.mk fun _ => (1 : ℂ)) := sorry

/-- Unit test `IsDFinite.test_lacunary`: Σ z^{2^n} is not D-finite even over ℂ; a definition
allowing the coefficients p_i to be arbitrary power series (rather than polynomials) would accept
it. -/
example : ¬ IsDFinite ⊤ (PowerSeries.mk fun m => if ∃ k : ℕ, m = 2 ^ k then (1 : ℂ) else 0) :=
  sorry

/-- The order of the minimal differential equation of a D-finite power series. -/
def dfiniteOrder (k : Subfield ℂ) (f : PowerSeries ℂ) (hf : IsDFinite k f) : ℕ := Nat.find hf

/-- A point `ξ` is a singular point of the minimal equation of `f` if the leading coefficient
of every minimal-order equation vanishes at `ξ`. -/
def IsMinimalSingularPoint (k : Subfield ℂ) (f : PowerSeries ℂ) (hf : IsDFinite k f)
    (ξ : ℂ) : Prop :=
  ∀ p : Fin (dfiniteOrder k f hf + 1) → Polynomial ℂ, (∀ i m, (p i).coeff m ∈ k) →
    p (Fin.last _) ≠ 0 → ∑ i, (p i : PowerSeries ℂ) * (⇑(PowerSeries.derivative ℂ))^[i] f = 0 →
      (p (Fin.last _)).eval ξ = 0

theorem exists_minimal_equation (k : Subfield ℂ) (f : PowerSeries ℂ) (hf : IsDFinite k f) :
    ∃ p : Fin (dfiniteOrder k f hf + 1) → Polynomial ℂ, (∀ i m, (p i).coeff m ∈ k) ∧
      p (Fin.last _) ≠ 0 ∧ ∑ i, (p i : PowerSeries ℂ) * (⇑(PowerSeries.derivative ℂ))^[i] f = 0 := sorry

theorem dfiniteOrder_le (k : Subfield ℂ) (f : PowerSeries ℂ) (hf : IsDFinite k f) {n : ℕ}
    (p : Fin (n + 1) → Polynomial ℂ) (hk : ∀ i m, (p i).coeff m ∈ k) (hp : p (Fin.last n) ≠ 0)
    (heq : ∑ i, (p i : PowerSeries ℂ) * (⇑(PowerSeries.derivative ℂ))^[i] f = 0) :
    dfiniteOrder k f hf ≤ n := sorry

theorem minimal_equation_unique (k : Subfield ℂ) (f : PowerSeries ℂ) (hf : IsDFinite k f)
    (p p' : Fin (dfiniteOrder k f hf + 1) → Polynomial ℂ)
    (hp : ∑ i, (p i : PowerSeries ℂ) * (⇑(PowerSeries.derivative ℂ))^[i] f = 0)
    (hp' : ∑ i, (p' i : PowerSeries ℂ) * (⇑(PowerSeries.derivative ℂ))^[i] f = 0) :
    ∀ i, p' (Fin.last _) * p i = p (Fin.last _) * p' i := sorry

theorem dfiniteOrder_eq_zero_iff (k : Subfield ℂ) (f : PowerSeries ℂ) (hf : IsDFinite k f) :
    dfiniteOrder k f hf = 0 ↔ f = 0 := sorry

/-- Unit test `dfiniteOrder.test_exp`: exp has minimal order 1. -/
example (h : IsDFinite ⊥ (PowerSeries.exp ℂ)) : dfiniteOrder ⊥ (PowerSeries.exp ℂ) h = 1 := sorry

/-- Unit test `dfiniteOrder.test_apparent`: (z − 1)eᶻ has order 1 and 1 is a singular point of its
minimal equation (an apparent one). -/
example (h : IsDFinite ⊥ ((Polynomial.X - 1 : Polynomial ℂ) * PowerSeries.exp ℂ)) :
    dfiniteOrder ⊥ _ h = 1 ∧ IsMinimalSingularPoint ⊥ _ h 1 := sorry

/-- Unit test `dfiniteOrder.test_zero`: The zero series has order 0. -/
example (h : IsDFinite ⊥ (0 : PowerSeries ℂ)) : dfiniteOrder ⊥ 0 h = 0 := sorry

/-- Unit test `dfiniteOrder.test_no_singularity_exp`: exp has no finite singular point; a definition
of 'singular point' using an arbitrary (non-minimal) equation such as (z − 1)(f′ − f) = 0 would
wrongly report z = 1. -/
example (h : IsDFinite ⊥ (PowerSeries.exp ℂ)) (ξ : ℂ) :
    ¬ IsMinimalSingularPoint ⊥ (PowerSeries.exp ℂ) h ξ := sorry

/-! ## E-functions and G-functions -/

/-- The power series `∑ a n zⁿ / n!`. -/
def ePowerSeries (a : ℕ → ℂ) : PowerSeries ℂ := PowerSeries.mk fun n => a n / n.factorial

/-- The entire function `z ↦ ∑ a n zⁿ / n!`. -/
def eFun (a : ℕ → ℂ) (z : ℂ) : ℂ := ∑' n, a n * z ^ n / n.factorial

/-- Siegel's E-functions (in the geometric normalisation of Shidlovskii, André and Beukers):
algebraic coefficients, a linear differential equation over `Q̄(z)`, and coefficients whose
conjugates and common denominators grow at most geometrically. -/
structure IsEFunction (a : ℕ → ℂ) : Prop where
  isAlgebraic : ∀ n, IsAlgebraic ℚ (a n)
  isDFinite : IsDFinite Qbar (ePowerSeries a)
  size_le : ∃ C : ℝ, 0 < C ∧ ∀ n, ∀ z ∈ (minpoly ℚ (a n)).aroots ℂ, ‖z‖ ≤ C ^ (n + 1)
  den_le : ∃ D : ℝ, 0 < D ∧ ∃ d : ℕ → ℕ, ∀ n, 1 ≤ d n ∧ (d n : ℝ) ≤ D ^ (n + 1) ∧
    ∀ m ≤ n, IsIntegral ℤ ((d n : ℂ) * a m)

/-- The Hurwitz (binomial) product of coefficient sequences: `ePowerSeries (hurwitzMul a b)` is
the product of the two power series. -/
def hurwitzMul (a b : ℕ → ℂ) (n : ℕ) : ℂ := ∑ k ∈ Finset.range (n + 1), (n.choose k : ℂ) * a k * b (n - k)

theorem ePowerSeries_hurwitzMul (a b : ℕ → ℂ) :
    ePowerSeries (hurwitzMul a b) = ePowerSeries a * ePowerSeries b := sorry

namespace IsEFunction

/-- Sums of E-functions are E-functions. -/
theorem add {a b : ℕ → ℂ} (ha : IsEFunction a) (hb : IsEFunction b) :
    IsEFunction (a + b) := sorry

theorem hurwitzMul {a b : ℕ → ℂ} (ha : IsEFunction a) (hb : IsEFunction b) :
    IsEFunction (DiophantineApproximation.hurwitzMul a b) := sorry

theorem shift {a : ℕ → ℂ} (ha : IsEFunction a) : IsEFunction (fun n => a (n + 1)) :=
  sorry

/-- An E-function is entire. -/
theorem differentiable {a : ℕ → ℂ} (ha : IsEFunction a) :
    Differentiable ℂ (eFun a) := sorry

/-- The series `∑ aₙ zⁿ / n!` converges to `eFun a z` for every `z`. -/
theorem hasSum {a : ℕ → ℂ} (ha : IsEFunction a) (z : ℂ) :
    HasSum (fun n => a n * z ^ n / n.factorial) (eFun a z) := sorry

/-- Applying a ring automorphism `σ` of `ℂ` to the coefficients gives an E-function (the Galois
conjugate `f^σ`). -/
theorem map_ringEquiv {a : ℕ → ℂ} (ha : IsEFunction a) (σ : ℂ ≃+* ℂ) :
    IsEFunction fun n => σ (a n) := sorry

/-- All coefficients of an E-function lie in one number field. -/
theorem exists_numberField {a : ℕ → ℂ} (ha : IsEFunction a) :
    ∃ K : IntermediateField ℚ ℂ, FiniteDimensional ℚ K ∧ ∀ n, a n ∈ K := sorry

end IsEFunction

/-- Unit test `IsEFunction.test_exp`: The constant sequence 1 (the exponential) is an E-function. -/
example : IsEFunction fun _ => 1 := sorry

/-- Unit test `IsEFunction.test_linear_factor`: a_n = n − 1 ((z − 1)eᶻ) is an E-function. -/
example : IsEFunction fun n => (n : ℂ) - 1 := sorry

/-- Unit test `IsEFunction.test_exp_sq`: e^{z²} (a_{2k} = (2k)!/k!, a_{odd} = 0) is not an
E-function in this normalisation; Siegel's (n!)^ε definition would also reject it, but a definition
bounding |a_n/n!| instead of |a_n| would accept it. -/
example : ¬ IsEFunction fun n => if Even n then ((n.factorial : ℂ) / (n / 2).factorial) else 0 :=
  sorry

/-- Unit test `IsEFunction.test_geometric`: a_n = n! (the series 1/(1 − z)) is not an E-function;
forgetting the factorial normalisation would accept it. -/
example : ¬ IsEFunction fun n => (n.factorial : ℂ) := sorry

/-- Siegel's G-functions: `∑ a n zⁿ` with the same arithmetic conditions (no factorials). -/
structure IsGFunction (a : ℕ → ℂ) : Prop where
  isAlgebraic : ∀ n, IsAlgebraic ℚ (a n)
  isDFinite : IsDFinite Qbar (PowerSeries.mk a)
  size_le : ∃ C : ℝ, 0 < C ∧ ∀ n, ∀ z ∈ (minpoly ℚ (a n)).aroots ℂ, ‖z‖ ≤ C ^ (n + 1)
  den_le : ∃ D : ℝ, 0 < D ∧ ∃ d : ℕ → ℕ, ∀ n, 1 ≤ d n ∧ (d n : ℝ) ≤ D ^ (n + 1) ∧
    ∀ m ≤ n, IsIntegral ℤ ((d n : ℂ) * a m)

theorem isGFunction_iff_isEFunction (a : ℕ → ℂ) :
    IsGFunction a ↔ IsEFunction a := sorry

namespace IsGFunction

/-- Sums of G-functions are G-functions. -/
theorem add {a b : ℕ → ℂ} (ha : IsGFunction a) (hb : IsGFunction b) :
    IsGFunction (a + b) := sorry

theorem mul {a b : ℕ → ℂ} (ha : IsGFunction a) (hb : IsGFunction b) :
    IsGFunction (fun n => ∑ k ∈ Finset.range (n + 1), a k * b (n - k)) := sorry

/-- A G-function converges on a disc of positive radius. -/
theorem hasRadius {a : ℕ → ℂ} (ha : IsGFunction a) :
    ∃ ρ : ℝ, 0 < ρ ∧ ∀ z : ℂ, ‖z‖ < ρ → Summable fun n => a n * z ^ n := sorry

end IsGFunction

/-- Unit test `IsGFunction.test_log`: Σ_{n≥1} zⁿ/n = −log(1 − z) is a G-function. -/
example : IsGFunction fun n => if n = 0 then 0 else 1 / (n : ℂ) := sorry

/-- Unit test `IsGFunction.test_geometric`: Σ zⁿ (a_n = 1) is a G-function. -/
example : IsGFunction fun _ => 1 := sorry

/-- Unit test `IsGFunction.test_exp`: a_n = 1/n! is not a G-function (its denominators n! grow
faster than Dⁿ); a definition without the denominator condition would accept exp. -/
example : ¬ IsGFunction fun n => 1 / (n.factorial : ℂ) := sorry

/-- Unit test `IsGFunction.test_borel`: Σ zⁿ is a G-function exactly when Σ zⁿ/n! = eᶻ is an
E-function. -/
example : IsGFunction (fun _ => 1) ↔ IsEFunction (fun _ => 1) := isGFunction_iff_isEFunction _

/-! ## Transcendence degree over `Q̄(z)` and `ℂ(z)` -/

/-- For power series with algebraic coefficients, algebraic independence over `ℂ(z)` is
algebraic independence over `Q̄[z]`. -/
theorem algebraicIndependent_ratFunc_iff_of_isAlgebraic_coeff {n : ℕ}
    (f : Fin n → PowerSeries ℂ) (hf : ∀ i m, IsAlgebraic ℚ (coeff m (f i))) :
    AlgebraicIndependent (RatFunc ℂ) (fun i => ((f i : PowerSeries ℂ) : ℂ⸨X⸩)) ↔
      ∀ P : MvPolynomial (Fin n) (Polynomial ℂ), (∀ e j, IsAlgebraic ℚ ((P.coeff e).coeff j)) →
        MvPolynomial.eval₂ Polynomial.coeToPowerSeries.ringHom f P = 0 → P = 0 := sorry

/-! ## Siegel–Shidlovskii, André and Beukers -/

/-- The vector of power series `F` solves `T F' = M F` with polynomial `T`, `M`. -/
def SolvesSystem {ι : Type*} [Fintype ι] (T : Polynomial ℂ) (M : Matrix ι ι (Polynomial ℂ))
    (F : ι → PowerSeries ℂ) : Prop :=
  ∀ i, (T : PowerSeries ℂ) * PowerSeries.derivative ℂ (F i) =
    ∑ j, (M i j : PowerSeries ℂ) * F j

theorem isEFunction_monomials_solveSystem {n : ℕ} (a : Fin n → ℕ → ℂ) (T : Polynomial ℂ)
    (M : Matrix (Fin n) (Fin n) (Polynomial ℂ))
    (hsys : SolvesSystem T M fun i => ePowerSeries (a i)) (N : ℕ) :
    ∃ M' : Matrix {e : Fin n → Fin (N + 1) // ∑ i, (e i : ℕ) = N}
        {e : Fin n → Fin (N + 1) // ∑ i, (e i : ℕ) = N} (Polynomial ℂ),
      SolvesSystem T M' fun e => ∏ i, ePowerSeries (a i) ^ (e.1 i : ℕ) := sorry

theorem isEFunction_div_one_sub {a : ℕ → ℂ} (ha : IsEFunction a) (hq : ∀ n, ∃ q : ℚ, a n = q)
    (h1 : eFun a 1 = 0) :
    IsEFunction (fun n => (n.factorial : ℂ) * ∑ k ∈ Finset.range (n + 1), a k / k.factorial) :=
  sorry

theorem minimal_equation_regularSingular_of_isGFunction {a : ℕ → ℂ} (ha : IsGFunction a)
    (hf : IsDFinite Qbar (PowerSeries.mk a))
    (p : Fin (dfiniteOrder Qbar _ hf + 1) → Polynomial ℂ)
    (hp : ∑ i, (p i : PowerSeries ℂ) * (⇑(PowerSeries.derivative ℂ))^[i] (PowerSeries.mk a) = 0)
    (hlast : p (Fin.last _) ≠ 0) (i : Fin (dfiniteOrder Qbar _ hf + 1)) (hi : p i ≠ 0) :
    (p (Fin.last _)).natTrailingDegree ≤
      (p i).natTrailingDegree + (dfiniteOrder Qbar _ hf - (i : ℕ)) :=
  sorry

theorem laplace_eFun_eq {a : ℕ → ℂ} (ha : IsEFunction a) :
    ∃ R : ℝ, 0 < R ∧ ∀ x : ℝ, R < x →
      ∫ t in Set.Ioi (0 : ℝ), Complex.exp (-(x : ℂ) * t) * eFun a t =
        (1 / (x : ℂ)) * ∑' n, a n * (1 / (x : ℂ)) ^ n :=
  sorry

/-- André's theorem: an E-function satisfies a differential equation whose only singularities
are `0` and `∞`. -/
theorem andre_eFunction_equation {a : ℕ → ℂ} (ha : IsEFunction a) :
    ∃ (m : ℕ) (q : Fin m → Polynomial ℂ), (∀ k, (q k).natDegree ≤ m - (k : ℕ)) ∧
      (∀ k j, IsAlgebraic ℚ ((q k).coeff j)) ∧
      (PowerSeries.X ^ m * (⇑(PowerSeries.derivative ℂ))^[m] (ePowerSeries a) +
        ∑ k : Fin m, (PowerSeries.X ^ (k : ℕ) * (q k : PowerSeries ℂ)) *
          (⇑(PowerSeries.derivative ℂ))^[k] (ePowerSeries a) = 0) := sorry

theorem exists_relation_basis_full_rank_specialisation {n : ℕ} (f : Fin n → PowerSeries ℂ) :
    ∃ (r : ℕ) (C : Fin r → Fin n → Polynomial ℂ),
      (∀ j, ∑ i, (C j i : PowerSeries ℂ) * f i = 0) ∧
      (∀ c : Fin n → Polynomial ℂ, ∑ i, (c i : PowerSeries ℂ) * f i = 0 →
        c ∈ Submodule.span (Polynomial ℂ) (Set.range C)) ∧
      ∀ ξ : ℂ, LinearIndependent ℂ (fun j => fun i => (C j i).eval ξ) := sorry

/-- Beukers, Theorem 3.2: every linear relation over `Q̄` between values at a regular algebraic
point comes from a functional relation. -/
theorem beukers_linear_relation {n : ℕ} (a : Fin n → ℕ → ℂ) (ha : ∀ i, IsEFunction (a i))
    (T : Polynomial ℂ) (M : Matrix (Fin n) (Fin n) (Polynomial ℂ))
    (hT : ∀ j, IsAlgebraic ℚ (T.coeff j)) (hM : ∀ i k j, IsAlgebraic ℚ ((M i k).coeff j))
    (hsys : SolvesSystem T M fun i => ePowerSeries (a i)) {ξ : ℂ} (hξ : IsAlgebraic ℚ ξ)
    (hξT : ξ * T.eval ξ ≠ 0) (lam : Fin n → ℂ) (hlam : ∀ i, IsAlgebraic ℚ (lam i))
    (hrel : ∑ i, lam i * eFun (a i) ξ = 0) :
    ∃ c : Fin n → Polynomial ℂ, (∀ i j, IsAlgebraic ℚ ((c i).coeff j)) ∧
      ∑ i, (c i : PowerSeries ℂ) * ePowerSeries (a i) = 0 ∧ ∀ i, (c i).eval ξ = lam i := sorry

/-- Beukers' refined Siegel–Shidlovskii theorem (Theorem 1.3). -/
theorem beukers_refined_siegel_shidlovskii {n : ℕ} (a : Fin n → ℕ → ℂ)
    (ha : ∀ i, IsEFunction (a i)) (T : Polynomial ℂ) (M : Matrix (Fin n) (Fin n) (Polynomial ℂ))
    (hT : ∀ j, IsAlgebraic ℚ (T.coeff j)) (hM : ∀ i k j, IsAlgebraic ℚ ((M i k).coeff j))
    (hsys : SolvesSystem T M fun i => ePowerSeries (a i)) {ξ : ℂ} (hξ : IsAlgebraic ℚ ξ)
    (hξT : ξ * T.eval ξ ≠ 0) (P : MvPolynomial (Fin n) ℂ) (hPalg : ∀ e, IsAlgebraic ℚ (P.coeff e))
    {d : ℕ} (hPhom : MvPolynomial.IsHomogeneous P d) (hP : MvPolynomial.eval (fun i => eFun (a i) ξ) P = 0) :
    ∃ Q : MvPolynomial (Fin n) (Polynomial ℂ),
      (∀ e j, IsAlgebraic ℚ ((Q.coeff e).coeff j)) ∧ MvPolynomial.IsHomogeneous Q d ∧
      MvPolynomial.eval₂ Polynomial.coeToPowerSeries.ringHom (fun i => ePowerSeries (a i)) Q = 0 ∧
      MvPolynomial.map (Polynomial.evalRingHom ξ) Q = P := sorry

/-- The Siegel–Shidlovskii theorem. -/
theorem siegel_shidlovskii {n : ℕ} (a : Fin n → ℕ → ℂ) (ha : ∀ i, IsEFunction (a i))
    (T : Polynomial ℂ) (M : Matrix (Fin n) (Fin n) (Polynomial ℂ))
    (hT : ∀ j, IsAlgebraic ℚ (T.coeff j)) (hM : ∀ i k j, IsAlgebraic ℚ ((M i k).coeff j))
    (hsys : SolvesSystem T M fun i => ePowerSeries (a i)) {ξ : ℂ} (hξ : IsAlgebraic ℚ ξ)
    (hξT : ξ * T.eval ξ ≠ 0) :
    Algebra.trdeg ℚ (IntermediateField.adjoin ℚ (Set.range fun i => eFun (a i) ξ)) =
      Algebra.trdeg (RatFunc ℂ) (IntermediateField.adjoin (RatFunc ℂ)
        (Set.range fun i => ((ePowerSeries (a i) : PowerSeries ℂ) : ℂ⸨X⸩))) := sorry

theorem isEFunction_div_linear {a : ℕ → ℂ} (ha : IsEFunction a) {ξ : ℂ} (hξ : IsAlgebraic ℚ ξ)
    (hξ0 : ξ ≠ 0) (h : eFun a ξ = 0) :
    ∃ b : ℕ → ℂ, IsEFunction b ∧ ∀ z, eFun a z = (z - ξ) * eFun b z := sorry

/-- Beukers, Theorem 1.5: removal of the nonzero singularities. -/
theorem beukers_removal_of_singularities {n : ℕ} (a : Fin n → ℕ → ℂ)
    (ha : ∀ i, IsEFunction (a i)) (T : Polynomial ℂ) (M : Matrix (Fin n) (Fin n) (Polynomial ℂ))
    (hsys : SolvesSystem T M fun i => ePowerSeries (a i))
    (hind : LinearIndependent (RatFunc ℂ) fun i => ((ePowerSeries (a i) : PowerSeries ℂ) : ℂ⸨X⸩)) :
    ∃ (e : Fin n → ℕ → ℂ) (B : Matrix (Fin n) (Fin n) (Polynomial ℂ)) (k : ℕ)
      (N : Matrix (Fin n) (Fin n) (Polynomial ℂ)),
      (∀ i, IsEFunction (e i)) ∧ B.det ≠ 0 ∧
      (∀ i, ePowerSeries (a i) = ∑ j, (B i j : PowerSeries ℂ) * ePowerSeries (e j)) ∧
      SolvesSystem (Polynomial.X ^ k) N fun i => ePowerSeries (e i) := sorry

/-- Lindemann–Weierstrass as a special case of Beukers' theorem. -/
theorem linearIndependent_exp_of_isAlgebraic {n : ℕ} (β : Fin n → ℂ)
    (hβ : ∀ i, IsAlgebraic ℚ (β i)) (hinj : Function.Injective β) :
    LinearIndependent (algebraicClosure ℚ ℂ) fun i => Complex.exp (β i) := sorry

/-- Galochkin–Chudnovsky: values of G-functions at rationals very close to `0`. -/
theorem galochkin_chudnovsky {n : ℕ} (a : Fin n → ℕ → ℂ) (ha : ∀ i, IsGFunction (a i))
    (hrat : ∀ i m, ∃ q : ℚ, a i m = q) (T : Polynomial ℂ) (M : Matrix (Fin n) (Fin n) (Polynomial ℂ))
    (hsys : SolvesSystem T M fun i => PowerSeries.mk (a i))
    (hind : LinearIndependent (RatFunc ℂ) fun i => ((PowerSeries.mk (a i) : PowerSeries ℂ) : ℂ⸨X⸩)) :
    ∃ C : ℝ, 0 < C ∧ ∀ p q : ℤ, 0 < q → p ≠ 0 → C * |(p : ℝ)| ^ (n + 1) < q →
      LinearIndependent ℚ fun i => ∑' m, a i m * ((p : ℂ) / q) ^ m := sorry

/-! ## Mahler's method -/

/-- The power series `f(z^r)`. -/
def expandPow (r : ℕ) (f : PowerSeries ℂ) : PowerSeries ℂ :=
  PowerSeries.mk fun m => if r ∣ m then coeff (m / r) f else 0

/-- `f` is a `q`-Mahler function: algebraic coefficients and a nontrivial linear relation
`∑ pᵢ(z) f(z^{qⁱ}) = 0` with polynomial coefficients over `Q̄`. -/
def IsMahlerFunction (q : ℕ) (f : PowerSeries ℂ) : Prop :=
  (∀ m, IsAlgebraic ℚ (coeff m f)) ∧
    ∃ (n : ℕ) (p : Fin (n + 1) → Polynomial ℂ), (∀ i m, IsAlgebraic ℚ ((p i).coeff m)) ∧
      (∃ i, p i ≠ 0) ∧ ∑ i, (p i : PowerSeries ℂ) * expandPow (q ^ (i : ℕ)) f = 0

namespace IsMahlerFunction

/-- Sums of `q`-Mahler functions are `q`-Mahler. -/
theorem add {q : ℕ} {f g : PowerSeries ℂ} (hf : IsMahlerFunction q f)
    (hg : IsMahlerFunction q g) : IsMahlerFunction q (f + g) := sorry

theorem mul {q : ℕ} {f g : PowerSeries ℂ} (hf : IsMahlerFunction q f)
    (hg : IsMahlerFunction q g) : IsMahlerFunction q (f * g) := sorry

theorem expandPow {q : ℕ} {f : PowerSeries ℂ} (hf : IsMahlerFunction q f) :
    IsMahlerFunction q (DiophantineApproximation.expandPow q f) := sorry

end IsMahlerFunction

theorem isMahlerFunction_of_polynomial (q : ℕ) (p : Polynomial ℂ)
    (hp : ∀ m, IsAlgebraic ℚ (p.coeff m)) : IsMahlerFunction q (p : PowerSeries ℂ) := sorry

theorem isMahlerFunction_iff_system (q : ℕ) (f : PowerSeries ℂ) :
    IsMahlerFunction q f ↔ ∃ (n : ℕ) (F : Fin (n + 1) → PowerSeries ℂ)
      (A : Matrix (Fin (n + 1)) (Fin (n + 1)) (RatFunc ℂ)), IsUnit A.det ∧ F 0 = f ∧
        (fun i => ((F i : PowerSeries ℂ) : ℂ⸨X⸩)) =
          (A.map (algebraMap (RatFunc ℂ) ℂ⸨X⸩)).mulVec
            (fun i => ((expandPow q (F i) : PowerSeries ℂ) : ℂ⸨X⸩)) := sorry

/-- Unit test `IsMahlerFunction.test_fredholm`: Σ z^{2^n} is 2-Mahler. -/
example : IsMahlerFunction 2 (PowerSeries.mk fun m => if ∃ k : ℕ, m = 2 ^ k then (1 : ℂ) else 0) :=
  sorry

/-- Unit test `IsMahlerFunction.test_thue_morse`: A series with f = (1 − z)f(z²) and algebraic
coefficients is 2-Mahler. -/
example (f : PowerSeries ℂ) (hf : ∀ m, IsAlgebraic ℚ (coeff m f))
    (h : f = (1 - PowerSeries.X) * expandPow 2 f) : IsMahlerFunction 2 f := sorry

/-- Unit test `IsMahlerFunction.test_exp`: exp is not q-Mahler for any q ≥ 2 (a transcendental
Mahler function has the unit circle as natural boundary); a definition allowing
transcendental-coefficient relations with p_i power series would accept it. -/
example (q : ℕ) (hq : 2 ≤ q) : ¬ IsMahlerFunction q (PowerSeries.exp ℂ) := sorry

/-- Unit test `IsMahlerFunction.test_polynomial`: z is q-Mahler (z^q·z − z·z^q = 0 is trivial; use
p₀ = z^q, p₁ = −z). -/
example (q : ℕ) : IsMahlerFunction q (PowerSeries.X : PowerSeries ℂ) := sorry

/-- A point of the punctured unit disc is regular for the Mahler system `f(z) = A(z) f(z^q)` if no
`α^{q^ℓ}` is a pole of an entry of `A` or of `A⁻¹`. -/
def IsMahlerRegularPoint {n : ℕ} (q : ℕ) (A : Matrix (Fin n) (Fin n) (RatFunc ℂ)) (α : ℂ) : Prop :=
  0 < ‖α‖ ∧ ‖α‖ < 1 ∧ ∀ ℓ : ℕ, ∀ i j,
    (A i j).denom.eval (α ^ q ^ ℓ) ≠ 0 ∧ (A⁻¹ i j).denom.eval (α ^ q ^ ℓ) ≠ 0

theorem isMahlerRegularPoint_iff {n : ℕ} (q : ℕ) (A : Matrix (Fin n) (Fin n) (RatFunc ℂ))
    (α : ℂ) : IsMahlerRegularPoint q A α ↔ 0 < ‖α‖ ∧ ‖α‖ < 1 ∧ ∀ ℓ : ℕ, ∀ i j,
      (A i j).denom.eval (α ^ q ^ ℓ) ≠ 0 ∧ (A⁻¹ i j).denom.eval (α ^ q ^ ℓ) ≠ 0 := Iff.rfl

theorem IsMahlerRegularPoint.pow {n q : ℕ} {A : Matrix (Fin n) (Fin n) (RatFunc ℂ)} {α : ℂ}
    (h : IsMahlerRegularPoint q A α) : IsMahlerRegularPoint q A (α ^ q) := sorry

theorem isMahlerRegularPoint_of_polynomial {n q : ℕ} (A : Matrix (Fin n) (Fin n) (Polynomial ℂ))
    (hdet : IsUnit A.det) {α : ℂ} (h0 : 0 < ‖α‖) (h1 : ‖α‖ < 1) :
    IsMahlerRegularPoint q (A.map (algebraMap (Polynomial ℂ) (RatFunc ℂ))) α := sorry

/-- Unit test `IsMahlerRegularPoint.test_fredholm`: For A = [[1, 0], [z, 1]] every 0 < |α| < 1 is
regular. -/
example (α : ℂ) (h0 : 0 < ‖α‖) (h1 : ‖α‖ < 1) :
    IsMahlerRegularPoint 2 (!![1, 0; RatFunc.X, 1] : Matrix (Fin 2) (Fin 2) (RatFunc ℂ)) α := sorry

/-- Unit test `IsMahlerRegularPoint.test_iterate`: For A = (1 − 2z)⁻¹, α = 2^{−1/2} is not regular;
a definition testing only ℓ = 0 would call it regular. -/
example : ¬ IsMahlerRegularPoint 2 (!![(1 - 2 * RatFunc.X)⁻¹] : Matrix (Fin 1) (Fin 1) (RatFunc ℂ))
    ((Real.sqrt 2)⁻¹ : ℂ) := sorry

/-- Unit test `IsMahlerRegularPoint.test_empty`: For the 0 × 0 system every point of the punctured
disc is regular. -/
example (q : ℕ) (A : Matrix (Fin 0) (Fin 0) (RatFunc ℂ)) (α : ℂ) (h0 : 0 < ‖α‖) (h1 : ‖α‖ < 1) :
    IsMahlerRegularPoint q A α := sorry

/-- Nishioka's theorem (Mahler's method). -/
theorem nishioka {n q : ℕ} (hq : 2 ≤ q) (f : Fin n → PowerSeries ℂ)
    (hf : ∀ i m, IsAlgebraic ℚ (coeff m (f i))) (A : Matrix (Fin n) (Fin n) (RatFunc ℂ))
    (hA : IsUnit A.det)
    (hsys : (fun i => ((f i : PowerSeries ℂ) : ℂ⸨X⸩)) =
      (A.map (algebraMap (RatFunc ℂ) ℂ⸨X⸩)).mulVec fun i => ((expandPow q (f i) : PowerSeries ℂ) : ℂ⸨X⸩))
    (ρ : ℝ) (hρ : 0 < ρ) (hconv : ∀ i (z : ℂ), ‖z‖ < ρ → Summable fun m => coeff m (f i) * z ^ m)
    {α : ℂ} (hα : IsAlgebraic ℚ α) (hαρ : ‖α‖ < ρ) (hreg : IsMahlerRegularPoint q A α) :
    Algebra.trdeg ℚ (IntermediateField.adjoin ℚ (Set.range fun i => ∑' m, coeff m (f i) * α ^ m)) =
      Algebra.trdeg (RatFunc ℂ) (IntermediateField.adjoin (RatFunc ℂ)
        (Set.range fun i => ((f i : PowerSeries ℂ) : ℂ⸨X⸩))) := sorry

/-- Philippon, Adamczewski–Faverjon (Theorem 1.4): homogeneous relations lift. -/
theorem mahler_homogeneous_lifting {n q : ℕ} (hq : 2 ≤ q) (f : Fin n → PowerSeries ℂ)
    (hf : ∀ i m, IsAlgebraic ℚ (coeff m (f i))) (A : Matrix (Fin n) (Fin n) (RatFunc ℂ))
    (hA : IsUnit A.det)
    (hsys : (fun i => ((f i : PowerSeries ℂ) : ℂ⸨X⸩)) =
      (A.map (algebraMap (RatFunc ℂ) ℂ⸨X⸩)).mulVec fun i => ((expandPow q (f i) : PowerSeries ℂ) : ℂ⸨X⸩))
    (hconv : ∀ i (z : ℂ), ‖z‖ < 1 → Summable fun m => coeff m (f i) * z ^ m)
    {α : ℂ} (hα : IsAlgebraic ℚ α) (hreg : IsMahlerRegularPoint q A α)
    (P : MvPolynomial (Fin n) ℂ) (hPalg : ∀ e, IsAlgebraic ℚ (P.coeff e)) {d : ℕ}
    (hPhom : MvPolynomial.IsHomogeneous P d)
    (hP : MvPolynomial.eval (fun i => ∑' m, coeff m (f i) * α ^ m) P = 0) :
    ∃ Q : MvPolynomial (Fin n) (Polynomial ℂ),
      (∀ e j, IsAlgebraic ℚ ((Q.coeff e).coeff j)) ∧ MvPolynomial.IsHomogeneous Q d ∧
      MvPolynomial.eval₂ Polynomial.coeToPowerSeries.ringHom f Q = 0 ∧
      MvPolynomial.map (Polynomial.evalRingHom α) Q = P := sorry

/-- Adamczewski–Faverjon, Corollary 1.5: linear relations between values lift. -/
theorem mahler_linear_relation {n q : ℕ} (hq : 2 ≤ q) (f : Fin n → PowerSeries ℂ)
    (hf : ∀ i m, IsAlgebraic ℚ (coeff m (f i))) (A : Matrix (Fin n) (Fin n) (RatFunc ℂ))
    (hA : IsUnit A.det)
    (hsys : (fun i => ((f i : PowerSeries ℂ) : ℂ⸨X⸩)) =
      (A.map (algebraMap (RatFunc ℂ) ℂ⸨X⸩)).mulVec fun i => ((expandPow q (f i) : PowerSeries ℂ) : ℂ⸨X⸩))
    (hconv : ∀ i (z : ℂ), ‖z‖ < 1 → Summable fun m => coeff m (f i) * z ^ m)
    {α : ℂ} (hα : IsAlgebraic ℚ α) (hreg : IsMahlerRegularPoint q A α) (lam : Fin n → ℂ)
    (hlam : ∀ i, IsAlgebraic ℚ (lam i)) (hrel : ∑ i, lam i * ∑' m, coeff m (f i) * α ^ m = 0) :
    ∃ c : Fin n → Polynomial ℂ, (∀ i j, IsAlgebraic ℚ ((c i).coeff j)) ∧
      ∑ i, (c i : PowerSeries ℂ) * f i = 0 ∧ ∀ i, (c i).eval α = lam i := sorry

/-- Adamczewski–Faverjon, Corollary 1.8: a Mahler value is transcendental or lies in the
number field of the data. -/
theorem mahler_value_transcendental_or_mem {q : ℕ} (hq : 2 ≤ q) {f : PowerSeries ℂ}
    (hf : IsMahlerFunction q f) {α : ℂ} (hα : IsAlgebraic ℚ α) (h0 : 0 < ‖α‖) (h1 : ‖α‖ < 1)
    (hconv : Summable fun m => coeff m f * α ^ m) (K : IntermediateField ℚ ℂ)
    (hK : FiniteDimensional ℚ K) (hαK : α ∈ K) (hfK : ∀ m, coeff m f ∈ K) :
    Transcendental ℚ (∑' m, coeff m f * α ^ m) ∨ (∑' m, coeff m f * α ^ m) ∈ K := sorry

theorem lacunary_not_rational :
    ¬ ∃ p r : Polynomial ℂ, r ≠ 0 ∧
      (r : PowerSeries ℂ) * PowerSeries.mk (fun m => if ∃ k : ℕ, m = 2 ^ k then (1 : ℂ) else 0) =
        (p : PowerSeries ℂ) := sorry

/-- Mahler (1929): `∑ α^{2ⁿ}` is transcendental for algebraic `0 < |α| < 1`. -/
theorem transcendental_fredholm {α : ℂ} (hα : IsAlgebraic ℚ α) (h0 : 0 < ‖α‖) (h1 : ‖α‖ < 1) :
    Transcendental ℚ (∑' n : ℕ, α ^ 2 ^ n) := sorry

/-! ## Algebraic independence: Nesterenko's theorem -/

/-- Nesterenko (1996): for `q = e^{2πiτ}`, three of `q, E₂(τ), E₄(τ), E₆(τ)` are algebraically
independent. -/
theorem nesterenko (τ : UpperHalfPlane) :
    ∃ s : Finset (Fin 4), s.card = 3 ∧ AlgebraicIndependent ℚ fun i : s =>
      (![Function.Periodic.qParam 1 τ, EisensteinSeries.E2 τ, ModularForm.E₄ τ, ModularForm.E₆ τ] :
        Fin 4 → ℂ) i := sorry

theorem eisenstein_values_at_i :
    EisensteinSeries.E2 UpperHalfPlane.I = 3 / Real.pi ∧ ModularForm.E₆ UpperHalfPlane.I = 0 ∧
      Function.Periodic.qParam 1 (UpperHalfPlane.I : ℂ) = (Real.exp (-2 * Real.pi) : ℂ) := sorry

theorem algebraicIndependent_pi_exp_pi :
    AlgebraicIndependent ℚ ![Real.pi, Real.exp Real.pi] := sorry

/-! ## Functional transcendence: Ax–Schanuel and Ax–Lindemann–Weierstrass -/

theorem ax_constant_coefficients {F : Type*} [Field F] [CharZero F] {k : ℕ}
    (D : Fin k → Derivation ℤ F F) (C : Subfield F) (hC : ∀ c, c ∈ C ↔ ∀ j, D j c = 0) {n : ℕ}
    (x y : Fin n → F) (hy : ∀ i, y i ≠ 0) (hxy : ∀ j i, D j (x i) = D j (y i) / y i)
    (c : Fin n → F) (hc : c ≠ 0)
    (hdep : ∑ i, c i • ((y i)⁻¹ • KaehlerDifferential.D C F (y i) -
      KaehlerDifferential.D C F (x i)) = 0) :
    ∃ c' : Fin n → F, c' ≠ 0 ∧ (∀ i, c' i ∈ C) ∧
      ∑ i, c' i • ((y i)⁻¹ • KaehlerDifferential.D C F (y i) - KaehlerDifferential.D C F (x i)) = 0 :=
  sorry

theorem ax_integer_relation_of_constant_relation {F : Type*} [Field F] [CharZero F] {k : ℕ}
    (D : Fin k → Derivation ℤ F F) (C : Subfield F) (hC : ∀ c, c ∈ C ↔ ∀ j, D j c = 0) {n : ℕ}
    (x y : Fin n → F) (hy : ∀ i, y i ≠ 0) (hxy : ∀ j i, D j (x i) = D j (y i) / y i)
    (c : Fin n → F) (hc : c ≠ 0) (hcC : ∀ i, c i ∈ C)
    (hdep : ∑ i, c i • ((y i)⁻¹ • KaehlerDifferential.D C F (y i) -
      KaehlerDifferential.D C F (x i)) = 0) :
    ∃ z : Fin n → ℤ, z ≠ 0 ∧ ∑ i, (z i : F) * x i ∈ C := sorry

/-- Ax's theorem (Ax–Schanuel for the exponential, differential-field form). -/
theorem ax_schanuel {F : Type*} [Field F] [CharZero F] {k : ℕ} (D : Fin k → Derivation ℤ F F)
    (C : Subfield F) (hC : ∀ c, c ∈ C ↔ ∀ j, D j c = 0) {n : ℕ} (x y : Fin n → F)
    (hy : ∀ i, y i ≠ 0) (hxy : ∀ j i, D j (x i) = D j (y i) / y i)
    (hlin : ∀ z : Fin n → ℚ, (∑ i, (z i : F) * x i) ∈ C → z = 0) :
    ((n + (Matrix.of fun j i => D j (x i)).rank : ℕ) : Cardinal) ≤
      Algebra.trdeg C (IntermediateField.adjoin C (Set.range x ∪ Set.range y)) := sorry

/-- Ax–Schanuel for formal power series in one variable. -/
theorem ax_schanuel_powerSeries {n : ℕ} (hn : 1 ≤ n) (f : Fin n → PowerSeries ℂ)
    (hf0 : ∀ i, constantCoeff (f i) = 0) (hlin : LinearIndependent ℚ f) :
    ((n + 1 : ℕ) : Cardinal) ≤
      Algebra.trdeg ℂ (Algebra.adjoin ℂ (Set.range f ∪ Set.range fun i => (exp ℂ).subst (f i))) :=
  sorry

theorem weak_ax_schanuel_powerSeries {n : ℕ} (hn : 1 ≤ n) (f : Fin n → PowerSeries ℂ)
    (hf0 : ∀ i, constantCoeff (f i) = 0) (hlin : LinearIndependent ℚ f) :
    ((n + 1 : ℕ) : Cardinal) ≤ Algebra.trdeg ℂ (Algebra.adjoin ℂ (Set.range f)) +
      Algebra.trdeg ℂ (Algebra.adjoin ℂ (Set.range fun i => (exp ℂ).subst (f i))) := sorry

/-- Ax–Lindemann–Weierstrass: if the `fᵢ` generate a field of transcendence degree one (an
algebraic curve germ) and are `ℚ`-linearly independent, their exponentials are algebraically
independent. -/
theorem ax_lindemann_weierstrass {n : ℕ} (hn : 1 ≤ n) (f : Fin n → PowerSeries ℂ)
    (hf0 : ∀ i, constantCoeff (f i) = 0) (hlin : LinearIndependent ℚ f)
    (hcurve : Algebra.trdeg ℂ (Algebra.adjoin ℂ (Set.range f)) = 1) :
    AlgebraicIndependent ℂ fun i => (exp ℂ).subst (f i) := sorry

/-! ## Conjectures as explicit hypotheses -/

/-- Schanuel's conjecture. -/
def SchanuelConjecture : Prop :=
  ∀ (n : ℕ) (z : Fin n → ℂ), LinearIndependent ℚ z →
    (n : Cardinal) ≤
      Algebra.trdeg ℚ (IntermediateField.adjoin ℚ (Set.range z ∪ Set.range (Complex.exp ∘ z)))

/-- The conjecture on algebraic independence of logarithms of algebraic numbers. -/
def LogarithmsAlgebraicIndependenceConjecture : Prop :=
  ∀ (n : ℕ) (ℓ : Fin n → ℂ), (∀ i, IsAlgebraic ℚ (Complex.exp (ℓ i))) →
    LinearIndependent ℚ ℓ → AlgebraicIndependent ℚ ℓ

theorem schanuel_inequality_of_isAlgebraic (n : ℕ) (z : Fin n → ℂ)
    (hz : ∀ i, IsAlgebraic ℚ (z i)) (hlin : LinearIndependent ℚ z) :
    (n : Cardinal) ≤
      Algebra.trdeg ℚ (IntermediateField.adjoin ℚ (Set.range z ∪ Set.range (Complex.exp ∘ z))) :=
  sorry

namespace SchanuelConjecture

/-- Applying Schanuel's conjecture to a `ℚ`-linearly independent tuple. -/
theorem le_trdeg (h : SchanuelConjecture) (n : ℕ) (z : Fin n → ℂ)
    (hlin : LinearIndependent ℚ z) :
    (n : Cardinal) ≤
      Algebra.trdeg ℚ (IntermediateField.adjoin ℚ (Set.range z ∪ Set.range (Complex.exp ∘ z))) :=
  h n z hlin

end SchanuelConjecture

/-- Unit test `SchanuelConjecture.test_hermite`: For n = 1, z = 1 the inequality says e is
transcendental, which holds unconditionally. -/
example : ((1 : ℕ) : Cardinal) ≤ Algebra.trdeg ℚ (IntermediateField.adjoin ℚ
    (Set.range (fun _ : Fin 1 => (1 : ℂ)) ∪ Set.range (Complex.exp ∘ fun _ : Fin 1 => (1 : ℂ)))) :=
  sorry

/-- Unit test `SchanuelConjecture.test_dependent`: For the ℚ-dependent z = (1, 2): trdeg ℚ(1, 2, e,
e²) = 1 < 2; dropping linear independence makes the statement false. -/
example : Algebra.trdeg ℚ (IntermediateField.adjoin ℚ
    (Set.range ![(1 : ℂ), 2] ∪ Set.range (Complex.exp ∘ ![(1 : ℂ), 2]))) = 1 := sorry

/-- Unit test `SchanuelConjecture.test_zero`: n = 0: the inequality 0 ≤ trdeg is trivial. -/
example : (0 : Cardinal) ≤ Algebra.trdeg ℚ (IntermediateField.adjoin ℚ
    (Set.range (Fin.elim0 : Fin 0 → ℂ) ∪ Set.range (Complex.exp ∘ (Fin.elim0 : Fin 0 → ℂ)))) :=
  zero_le

/-- Unit test `SchanuelConjecture.test_lindemann`: For z = (iπ) the inequality reads trdeg ℚ(iπ, −1)
≥ 1, i.e. π is transcendental (true, Lindemann). -/
example : ((1 : ℕ) : Cardinal) ≤ Algebra.trdeg ℚ (IntermediateField.adjoin ℚ
    (Set.range (fun _ : Fin 1 => Complex.I * Real.pi) ∪
      Set.range (Complex.exp ∘ fun _ : Fin 1 => Complex.I * Real.pi))) := sorry

namespace LogarithmsAlgebraicIndependenceConjecture

/-- Under the conjecture, the quotient of two `ℚ`-linearly independent logarithms of algebraic
numbers is transcendental (unconditionally this is Gelfond–Schneider, DT.3). -/
theorem transcendental_div
    (h : LogarithmsAlgebraicIndependenceConjecture) (ℓ₁ ℓ₂ : ℂ)
    (h₁ : IsAlgebraic ℚ (Complex.exp ℓ₁)) (h₂ : IsAlgebraic ℚ (Complex.exp ℓ₂))
    (hlin : LinearIndependent ℚ ![ℓ₁, ℓ₂]) : Transcendental ℚ (ℓ₁ / ℓ₂) := sorry

end LogarithmsAlgebraicIndependenceConjecture

theorem logarithmsConjecture_one (ℓ : Fin 1 → ℂ) (hℓ : IsAlgebraic ℚ (Complex.exp (ℓ 0)))
    (hlin : LinearIndependent ℚ ℓ) : AlgebraicIndependent ℚ ℓ := sorry

/-- Unit test `LogarithmsAlgebraicIndependenceConjecture.test_one`: A nonzero ℓ with e^ℓ algebraic
is transcendental (Hermite–Lindemann), unconditionally. -/
example (ℓ : ℂ) (h : IsAlgebraic ℚ (Complex.exp ℓ)) (h0 : ℓ ≠ 0) : Transcendental ℚ ℓ := sorry

/-- Unit test `LogarithmsAlgebraicIndependenceConjecture.test_dependent`: log 2 and log 4 are
algebraically dependent, so ℚ-linear independence cannot be dropped. -/
example : ¬ AlgebraicIndependent ℚ ![(Real.log 2 : ℂ), (Real.log 4 : ℂ)] := sorry

/-- Unit test `LogarithmsAlgebraicIndependenceConjecture.test_log2_log3`: The conjecture implies
that log 2 and log 3 are algebraically independent. -/
example (h : LogarithmsAlgebraicIndependenceConjecture) :
    AlgebraicIndependent ℚ ![(Real.log 2 : ℂ), (Real.log 3 : ℂ)] := sorry

theorem algebraicIndependent_e_pi_of_schanuel (h : SchanuelConjecture) :
    AlgebraicIndependent ℚ ![Real.exp 1, Real.pi] := sorry

theorem logarithmsConjecture_of_schanuel (h : SchanuelConjecture) :
    LogarithmsAlgebraicIndependenceConjecture := sorry

end DiophantineApproximation
