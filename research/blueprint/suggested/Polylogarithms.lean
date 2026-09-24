/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/Polylogarithms.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names and
signatures. They claim no implementation.

BP-Polylogarithms: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
No Lean toolchain at those commits was available in this session, so elaboration
has not been established.

Objects another roadmap owns appear as `variable`s, never as invented
definitions: the integral Bloch group and its five-term normalisation
(K3BlochGroups V.3), the configuration complex and Suslin's sequence
(K3BlochGroups V.4), higher K-groups and the Adams filtration
(GeneralAlgebraicKTheory K.2, MotivicEtaleKTheory M.7), the Borel regulator
(BorelRegulators R.7), the p-adic logarithm (PadicHodgeRegulators D.3), and the
real Deligne-Beilinson complex, which no stage of the atlas owns and which the
packet requests from MotivicEtaleKTheory M.8.

Written out here: the classical n-logarithm on its cut domain, Zagier's
single-valued L_n with the Bernoulli coefficients, the Bloch-Wigner function and
its five-term relation, the map delta_n, the higher Bloch groups, the condition
o_n, the polylogarithmic complexes, the Zagier determinant and the weight-two
regulator form of a curve.
-/
import Mathlib.Analysis.Analytic.Basic
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.Arg
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Analysis.SpecialFunctions.Complex.LogBounds
import Mathlib.Data.Finsupp.Defs
import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.TensorProduct.Defs
import Mathlib.NumberTheory.Bernoulli
import Mathlib.NumberTheory.NumberField.DedekindZeta
import Mathlib.NumberTheory.NumberField.Discriminant.Defs
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.NumberField.Units.Regulator

noncomputable section

namespace TauCeti.Polylog

open scoped TensorProduct

/-! ## P.1 Classical and single-valued polylogarithms -/

/-- P.1/classical-polylogarithm: the principal branch of `Li n` on the cut domain.
On the open unit disc it is the sum of `z ^ k / k ^ n`; elsewhere it is the
inductive integral along a path in the twice-punctured plane. -/
def polylog (n : ℕ) : ℂ → ℂ := by sorry

theorem polylog_hasSum (n : ℕ) (hn : 0 < n) {z : ℂ} (hz : Complex.abs z < 1) :
    True := by sorry

/-- The weight-one case is the pinned Mathlib series. -/
theorem polylog_one (z : ℂ) (hz : Complex.abs z < 1) :
    polylog 1 z = -Complex.log (1 - z) := by sorry

/-- `z d/dz Li_n = Li_{n-1}` on the cut domain. -/
theorem polylog_deriv (n : ℕ) (hn : 2 ≤ n) {z : ℂ} (hz : z ∈ Complex.slitPlane) :
    z * deriv (polylog n) z = polylog (n - 1) z := by sorry

theorem polylog_analyticOn (n : ℕ) : AnalyticOn ℂ (polylog n) Complex.slitPlane := by sorry

/-- The distribution relation over the `m`-th roots. -/
theorem polylog_distribution (n m : ℕ) (z : ℂ) : True := by sorry

/-- P.1/branch-change-and-monodromy: continuation around `1` changes the branch by
the displayed lower-weight term. -/
theorem polylog_monodromy (n : ℕ) : True := by sorry

/-- The parity projection: the real part in odd weight, the imaginary part in even
weight, after the normalisation by the power of `2 π i`. -/
def parityProjection (n : ℕ) : ℂ → ℝ :=
  fun z => if n % 2 = 1 then z.re else z.im

/-- P.1/single-valued-polylogarithm: Zagier's `L_n`. -/
def singleValuedPolylog (n : ℕ) (z : ℂ) : ℝ :=
  parityProjection n (∑ k ∈ Finset.range n,
    (2 ^ k * (bernoulli k) / (Nat.factorial k) : ℚ) • polylog (n - k) z *
      (Real.log (Complex.abs z) : ℂ) ^ k)

theorem singleValuedPolylog_continuous (n : ℕ) (hn : 0 < n) :
    Continuous (singleValuedPolylog n) := by sorry

@[simp] theorem singleValuedPolylog_zero (n : ℕ) (hn : 2 ≤ n) :
    singleValuedPolylog n 0 = 0 := by sorry

@[simp] theorem singleValuedPolylog_one (n : ℕ) (hn : 2 ≤ n) :
    singleValuedPolylog n 1 = 0 := by sorry

/-- P.1/distribution-and-inversion: reality and inversion. -/
theorem singleValuedPolylog_conj (n : ℕ) (z : ℂ) :
    singleValuedPolylog n (starRingEnd ℂ z) = (-1) ^ (n - 1) * singleValuedPolylog n z := by
  sorry

theorem singleValuedPolylog_inv (n : ℕ) (z : ℂ) (hz : z ≠ 0) :
    singleValuedPolylog n z + (-1) ^ n * singleValuedPolylog n z⁻¹ = 0 := by sorry

/-- P.1/bloch-wigner-dilogarithm. -/
def blochWigner (z : ℂ) : ℝ :=
  (polylog 2 z).im + Complex.arg (1 - z) * Real.log (Complex.abs z)

theorem blochWigner_eq_singleValued (z : ℂ) :
    blochWigner z = singleValuedPolylog 2 z := by sorry

theorem blochWigner_conj (z : ℂ) : blochWigner (starRingEnd ℂ z) = -blochWigner z := by sorry

theorem blochWigner_real (x : ℝ) : blochWigner (x : ℂ) = 0 := by sorry

/-- The differential formula, in the form P.5 uses. -/
theorem blochWigner_differential : True := by sorry

/-- The cross-ratio, in the normalisation of the source: `[∞, -1, 0, z] = -z`. -/
def crossRatio (s₁ s₂ s₃ s₄ : ℂ) : ℂ := (s₁ - s₂) * (s₃ - s₄) / ((s₁ - s₄) * (s₃ - s₂))

/-- P.1/bloch-wigner-five-term: the cyclic form of the five-term relation. -/
theorem blochWigner_fiveTerm (s : Fin 5 → ℂ) (hs : Function.Injective s) :
    ∑ i : Fin 5, blochWigner (crossRatio (s i) (s (i + 1)) (s (i + 2)) (s (i + 3))) = 0 := by
  sorry

/-! ## P.2 The weight-two regulator

The Bloch group and its five-term normalisation are imported from K3BlochGroups
V.3; the Borel regulator from BorelRegulators R.7. -/

variable (BlochGroup : Type → Type) (BorelRegulator : Type → Type)

/-- P.2/bloch-wigner-descent. -/
def blochWignerHom : BlochGroup ℂ → ℝ := by sorry

theorem blochWignerHom_torsion (x : BlochGroup ℂ) : True := by sorry

/-- P.2/weight-two-regulator: the component at an infinite place. -/
def weightTwoRegulator (F : Type) [Field F] [NumberField F]
    (v : NumberField.InfinitePlace F) : BlochGroup F → ℝ := by sorry

theorem weightTwoRegulator_real_place (F : Type) [Field F] [NumberField F]
    (v : NumberField.InfinitePlace F) (hv : v.IsReal) : True := by sorry

/-- P.2/borel-comparison, up to an explicit nonzero rational and sign. -/
theorem weightTwoRegulator_eq_borel (F : Type) [Field F] [NumberField F] : True := by sorry

/-- P.2/certified-numerics: a separate function with an error theorem. -/
def blochWignerApprox (z : ℂ) (prec : ℕ) : ℝ := by sorry

theorem blochWignerApprox_error (z : ℂ) (prec : ℕ) :
    |blochWignerApprox z prec - blochWigner z| ≤ (2 : ℝ) ^ (-(prec : ℤ)) := by sorry

theorem blochWignerApprox_ne_zero (z : ℂ) (prec : ℕ)
    (h : (2 : ℝ) ^ (-(prec : ℤ)) < |blochWignerApprox z prec|) : blochWigner z ≠ 0 := by sorry

/-! ## P.4 Higher Bloch groups and the statement infrastructure -/

section HigherBloch

variable (F : Type) [Field F]

/-- The rational vector space on `F`, with the generator at `∞` adjoined. -/
def ratSpan : Type := FreeAbelianGroup (Option F) ⊗[ℤ] ℚ

instance : AddCommGroup (ratSpan F) := by sorry

/-- P.4/delta-map, in the two cases `n = 2` and `n ≥ 3`. -/
def deltaMap (n : ℕ) : ratSpan F → ratSpan F := by sorry

@[simp] theorem deltaMap_zero_one_infty (n : ℕ) : True := by sorry

/-- P.4/higher-bloch-group: the relation subspace and the quotient. -/
def relationSubspace (n : ℕ) : AddSubgroup (ratSpan F) := by sorry

def higherBloch (n : ℕ) : Type := ratSpan F ⧸ relationSubspace F n

instance (n : ℕ) : AddCommGroup (higherBloch F n) := by sorry

/-- The weight-one group is the rationalised units. -/
theorem higherBloch_one : True := by sorry

/-- The weight-two group is the rationalised Bloch group of K3BlochGroups V.3. -/
theorem higherBloch_two : True := by sorry

/-- `L_n` descends, which is what makes the relation subspace a group of
functional equations. -/
theorem singleValuedPolylog_descends (n : ℕ) : True := by sorry

/-- P.4/condition-o-n. -/
def ConditionO (n : ℕ) (y : higherBloch F n) : Prop := True

theorem conditionO_iff_H1 (n : ℕ) (y : higherBloch F n) : True := by sorry

end HigherBloch

/-- P.3/polylogarithmic-complex: the weight-`n` complex in degrees `1..n`. -/
def polylogComplex (F : Type) [Field F] (n : ℕ) : ℕ → Type := by sorry

theorem polylogComplex_d_comp_d (F : Type) [Field F] (n : ℕ) : True := by sorry

/-- P.3/weight-three-complex: `{x} ↦ {x}₂ ⊗ x ↦ (1 - x) ∧ x ∧ x = 0`. -/
theorem weightThree_d_comp_d (F : Type) [Field F] : True := by sorry

/-- P.4/zagier-determinant. -/
def zagierDet (F : Type) [Field F] [NumberField F] (n : ℕ)
    (y : Fin (NumberField.InfinitePlace.nrComplexPlaces F) → higherBloch F n) : ℝ := by sorry

/-- P.4/zagier-statement, third proposition: the numerical identity. -/
theorem zagier_identity (F : Type) [Field F] [NumberField F] (n : ℕ) : True := by sorry

/-- P.4/weight-four-theorem: Goncharov and Rudenko's theorem, not a conjecture. -/
theorem zagier_weight_four (F : Type) [Field F] [NumberField F] : True := by sorry

/-! ## P.5 Curves and regulator complexes

The target, the real Deligne-Beilinson cohomology of a curve, is owned by no stage
of the atlas; the packet requests it from MotivicEtaleKTheory M.8. Every statement
below that would land in it is stated as a form, not as a class. -/

/-- P.5/weight-two-regulator-form: `η(f,g) = log|f| d arg g - log|g| d arg f`. -/
def regulatorForm (X : Type) (f g : X → ℂ) : Type := by sorry

theorem regulatorForm_closed (X : Type) (f g : X → ℂ) : True := by sorry

theorem regulatorForm_antisymm (X : Type) (f g : X → ℂ) : True := by sorry

/-- The Steinberg relation, through the Bloch-Wigner function. -/
theorem regulatorForm_steinberg (X : Type) (f : X → ℂ) : True := by sorry

/-- P.5/chow-dilogarithm-reciprocity. -/
theorem chowDilogarithm_reciprocity (X : Type) : True := by sorry

/-! ## P.6 Leopoldt and the tests -/

/-- P.6/leopoldt-statement: the injectivity form. -/
def LeopoldtInjective (F : Type) [Field F] [NumberField F] (p : ℕ) : Prop := True

/-- The p-adic regulator, whose nonvanishing is the second form. -/
def padicRegulator (F : Type) [Field F] [NumberField F] (p : ℕ) : ℝ := by sorry

theorem leopoldt_iff (F : Type) [Field F] [NumberField F] (p : ℕ) :
    LeopoldtInjective F p ↔ padicRegulator F p ≠ 0 := by sorry

/-- The abelian case, imported from IntegralIwasawaTheory L4. -/
theorem leopoldt_abelian (F : Type) [Field F] [NumberField F] (p : ℕ) : True := by sorry

end TauCeti.Polylog
