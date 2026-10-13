import Mathlib.NumberTheory.Padics.MahlerBasis
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.Topology.LocallyConstant.Algebra
import Mathlib.Topology.ContinuousMap.ZeroAtInfty
import Mathlib.Data.Nat.Digits.Lemmas
import Mathlib.Order.Filter.Cofinite
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Algebra.MvPolynomial.Degrees

/-!
# Locally analytic distributions, L2: selected suggested statements

The definitive roadmap is research/blueprint/readmes/LocallyAnalyticDistributions--L2.md.
Baseline: Mathlib 082e2d3, Tau Ceti f790474; this file imports only Mathlib.
These are proposed theorem signatures, not a formalisation. Only proof holes use sorry.

Light predicates and functions below use existing function, polynomial, p-adic and c₀ carriers.
The normed C^r spaces, their duals, locally polynomial submodules and basis-coordinate maps,
admissible distribution constructions, and completed projective tensors remain README targets.
No unbounded supremum on arbitrary functions is used as a proxy norm, and no placeholder data
stands in for a missing carrier. The README gives all APIs and at least three discriminating
tests for every definition/construction; this file selects one or two examples for each group
of retained light definitions and states end theorems that fit the native carriers.

Sources: Colmez I.3.2, I.5.9, I.5.14, I.5.16–I.5.17; De Ieso 2.12 with the corrections E9/E14;
Loeffler 2.5, 2.9, 2.12–2.15 with the corrected tensor interpretation E3/E11.
-/

noncomputable section

open Filter Topology
open scoped Classical ZeroAtInfty

namespace TauCeti.LocallyAnalytic

variable (p : ℕ) [Fact p.Prime]

/-- Base-p digit length, with length zero at zero. -/
def digitLength (n : ℕ) : ℕ := if n = 0 then 0 else Nat.log p n + 1

/-- Remove the leading base-p digit. -/
def vdpPred (n : ℕ) : ℕ := n % p ^ (digitLength p n - 1)

example : digitLength 3 4 = 2 ∧ vdpPred 3 4 = 1 := by decide
example : digitLength p 0 = 0 ∧ vdpPred p 0 = 0 := by simp [digitLength, vdpPred]

/-- The residue fibre through a, equivalently a + p^h ℤ_p. -/
def ball (a : ℤ_[p]) (h : ℕ) : Set ℤ_[p] :=
  {x | PadicInt.toZModPow h x = PadicInt.toZModPow h a}

example (a : ℤ_[p]) : ball p a 0 = Set.univ := by
  have : Subsingleton (ZMod (p ^ 0)) := ZMod.subsingleton_iff.mpr (pow_zero p)
  ext x
  exact iff_true_intro (Subsingleton.elim _ _)

variable (L : Type*) [NontriviallyNormedField L] [NormedAlgebra ℚ_[p] L]

/-- Embed a p-adic integer in the coefficient field. -/
def toL (x : ℤ_[p]) : L := algebraMap ℚ_[p] L (x : ℚ_[p])

example : toL p L 1 = 1 := by simp [toL]

/-- The light predicate underlying README target LP N h. -/
def IsLocallyPolynomial (N h : ℕ) (f : ℤ_[p] → L) : Prop :=
  ∀ a : ℤ_[p], ∃ P : Polynomial L, P.natDegree ≤ N ∧
    ∀ x ∈ ball p a h, f x = P.eval (toL p L x)

-- LocallyAnalyticTests.LP_level_zero
example (P : Polynomial L) :
    IsLocallyPolynomial p L P.natDegree 0 (fun x => P.eval (toL p L x)) := by
  intro a
  exact ⟨P, le_rfl, fun _ _ => rfl⟩

-- LocallyAnalyticTests.LP_square_not_linear
example (h : ℕ) : ¬ IsLocallyPolynomial p L 1 h (fun x => toL p L x ^ 2) := by
  sorry

/-- The actual wavelet function, before bundling its local polynomial or C^r membership. -/
def colmezWavelet (r : ℝ) (i k : ℕ) (x : ℤ_[p]) : L :=
  if x ∈ ball p (i : ℤ_[p]) (digitLength p i) then
    (p : L) ^ ⌊(digitLength p i : ℝ) * r⌋₊ *
      algebraMap ℚ_[p] L (((x : ℚ_[p]) - i) / (p : ℚ_[p]) ^ digitLength p i) ^ k
  else 0

-- LocallyAnalyticTests.colmezWavelet_level_zero
example (r : ℝ) (k : ℕ) : colmezWavelet p L r 0 k = fun x => toL p L x ^ k := by
  have : Subsingleton (ZMod (p ^ 0)) := ZMod.subsingleton_iff.mpr (pow_zero p)
  funext x
  have hx : x ∈ ball p (0 : ℤ_[p]) 0 := Subsingleton.elim _ _
  simp [colmezWavelet, digitLength, hx, toL]

-- LocallyAnalyticTests.colmezWavelet_value
example [Fact (Nat.Prime 3)] {E : Type*} [NontriviallyNormedField E]
    [NormedAlgebra ℚ_[3] E] :
    colmezWavelet 3 E (1 / 2) 4 0 13 = 3 ∧ colmezWavelet 3 E (1 / 2) 4 0 1 = 0 := by
  sorry

/-- The Taylor-remainder predicate underlying the README C^r Banach carrier, for r ≥ 0. -/
def IsCr (r : ℝ) (f : ℤ_[p] → L) : Prop :=
  ∃ D : ℕ → ℤ_[p] → L, D 0 = f ∧
    ∀ ε > 0, ∃ δ > 0, ∀ x y : ℤ_[p], ‖y‖ < δ →
      ‖f (x + y) - ∑ j ∈ Finset.range (⌊r⌋₊ + 1),
        D j x * toL p L y ^ j / (j.factorial : L)‖ ≤ ε * ‖y‖ ^ r

example (f : C(ℤ_[p], L)) : IsCr p L 0 f := by
  sorry

variable [CompleteSpace L] [IsUltrametricDist L]

/-- L2/cr-wavelet-basis: the expansion milestone on native c₀ and function carriers.
The Banach isomorphism and its norm estimates are stated in the README. -/
theorem cr_wavelet_basis (r : ℝ) (hr : 0 ≤ r) (f : ℤ_[p] → L) (hf : IsCr p L r f) :
    ∃! b : C₀(ℕ × Fin (⌊r⌋₊ + 1), L), ∀ x : ℤ_[p],
      HasSum (fun ik : ℕ × Fin (⌊r⌋₊ + 1) => b ik * colmezWavelet p L r ik.1 ik.2 x)
        (f x) := by
  sorry

/-- L2/cr-mahler-criterion: a refinement of native Mahler theory for r ≥ 0. -/
theorem isCr_iff_mahler (r : ℝ) (hr : 0 ≤ r) (f : C(ℤ_[p], L)) :
    IsCr p L r f ↔
      Tendsto (fun n : ℕ => ‖(fwdDiff 1)^[n] (f : ℤ_[p] → L) 0‖ *
        (p : ℝ) ^ (r * digitLength p n)) atTop (𝓝 0) := by
  sorry

/-- L2/cr-derivative-surjection: surjectivity expressed by difference quotients.
Its continuous-linear-map form and locally polynomial kernel are README targets. -/
theorem cr_deriv_surjective {r : ℝ} (hr : 1 ≤ r) (f : ℤ_[p] → L)
    (hf : IsCr p L (r - 1) f) :
    ∃ F : ℤ_[p] → L, IsCr p L r F ∧ ∀ x,
      Tendsto (fun y : ℤ_[p] => (toL p L y)⁻¹ * (F (x + y) - F x))
        (𝓝[≠] 0) (𝓝 (f x)) := by
  sorry

/-- L2/cr-composition: the fractional-order case needs a Lipschitz inner map (E8/E9). -/
theorem isCr_comp_lipschitz {r : ℝ} (hr0 : 0 ≤ r) (hr1 : r < 1)
    {h : ℤ_[p] → ℤ_[p]} (hh : ∃ c : ℝ, ∀ x y, ‖h x - h y‖ ≤ c * ‖x - y‖)
    {f : ℤ_[p] → L} (hf : IsCr p L r f) : IsCr p L r (f ∘ h) := by
  sorry

/-- L2/cr-composition for r ≥ 1, using a full C^1 Lipschitz bound in the proof (E14). -/
theorem isCr_comp_of_one_le {r : ℝ} (hr : 1 ≤ r) {h : ℤ_[p] → ℤ_[p]}
    (hh : IsCr p L r (fun x => toL p L (h x))) {f : ℤ_[p] → L}
    (hf : IsCr p L r f) : IsCr p L r (f ∘ h) := by
  sorry

end TauCeti.LocallyAnalytic

namespace TauCeti.AnalyticDistributions

open TauCeti.LocallyAnalytic

variable (p : ℕ) [Fact p.Prime] (K : Type*) [NontriviallyNormedField K]
  [NormedAlgebra ℚ_[p] K] {g : ℕ}

/-- Rectangular residue fibres. -/
def padicBox (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) : Set (Fin g → ℤ_[p]) :=
  {x | ∀ j, PadicInt.toZModPow (m j) (x j) = PadicInt.toZModPow (m j) (a j)}

/-- The underlying indicator function. Its LocallyConstant bundle is a README target. -/
def boxIndicator (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) : (Fin g → ℤ_[p]) → K :=
  Set.indicator (padicBox p a m) 1

-- AnalyticDistributionTests.boxIndicator_zero_radius
example (a : Fin g → ℤ_[p]) : padicBox p a 0 = Set.univ ∧ boxIndicator p K a 0 = 1 := by
  sorry

-- AnalyticDistributionTests.boxIndicator_radii_not_symmetric
example : boxIndicator p K (g := 2) 0 ![1, 0] ≠ boxIndicator p K 0 ![0, 1] := by
  sorry

/-- Mixed van der Put coefficient, with inactive zero indices omitted. -/
def vanDerPutCoeff (f : (Fin g → ℤ_[p]) → K) (n : Fin g → ℕ) : K :=
  ∑ T ∈ (Finset.univ.filter fun j => n j ≠ 0).powerset,
    (-1) ^ T.card * f (fun j => ((if j ∈ T then vdpPred p (n j) else n j : ℕ) : ℤ_[p]))

/-- The box supporting the van der Put basis vector. -/
def wavBox (n : Fin g → ℕ) : Set (Fin g → ℤ_[p]) :=
  padicBox p (fun j => (n j : ℤ_[p])) (fun j => digitLength p (n j))

example (f : (Fin g → ℤ_[p]) → K) :
    vanDerPutCoeff p K f 0 = f 0 ∧ wavBox p (g := g) 0 = Set.univ := by
  sorry

/-- The light predicate underlying the separate-degree locally polynomial spaces. -/
def IsLocallyPolynomialMulti (N : Fin g → ℕ) (h : ℕ) (f : (Fin g → ℤ_[p]) → K) : Prop :=
  ∀ a : Fin g → ℤ_[p], ∃ P : MvPolynomial (Fin g) K, (∀ j, P.degreeOf j ≤ N j) ∧
    ∀ x ∈ padicBox p a (fun _ => h),
      f x = MvPolynomial.eval (fun j => toL p K (x j)) P

-- AnalyticDistributionTests.LPmulti_separate_not_total
example (h : ℕ) :
    IsLocallyPolynomialMulti p K ![1, 1] 0 (fun x => toL p K (x 0) * toL p K (x 1)) ∧
    ¬ IsLocallyPolynomialMulti p K ![2, 0] h (fun x => toL p K (x 0) * toL p K (x 1)) := by
  sorry

/-- Coefficient predicate equivalent to vector order for 0 ≤ r_j < 1 (E3/E11).
The normed tensor space and its realization are README targets. -/
def IsVectorOrder (r : Fin g → ℝ) (f : (Fin g → ℤ_[p]) → K) : Prop :=
  Continuous f ∧ Tendsto (fun n : Fin g → ℕ => ‖vanDerPutCoeff p K f n‖ *
    (p : ℝ) ^ (∑ j, r j * digitLength p (n j))) cofinite (𝓝 0)

example (f : LocallyConstant (Fin 2 → ℤ_[p]) K) : IsVectorOrder p K ![1 / 2, 0] f := by
  sorry

/-- The first-difference predicate underlying isotropic C^r for 0 ≤ r < 1. -/
def IsIsotropicCr (r : ℝ) (f : (Fin g → ℤ_[p]) → K) : Prop :=
  ∀ ε > 0, ∃ m₀ : ℕ, ∀ m ≥ m₀, ∀ x y : Fin g → ℤ_[p],
    (∀ j, ‖y j‖ ≤ (p : ℝ) ^ (-(m : ℤ))) →
      ‖f (x + y) - f x‖ ≤ ε * (p : ℝ) ^ (-(r * m))

-- AnalyticDistributionTests.isoCr_order_zero
example (f : C(Fin g → ℤ_[p], K)) : IsIsotropicCr p K 0 f := by
  sorry

variable [CompleteSpace K] [IsUltrametricDist K]

/-- L2/multivariable-van-der-put: the expansion and its sup-norm identity. -/
theorem vanDerPut_expansion (f : C(Fin g → ℤ_[p], K)) :
    HasSum (fun n : Fin g → ℕ => vanDerPutCoeff p K f n •
      Set.indicator (wavBox p n) (1 : (Fin g → ℤ_[p]) → K)) (f : (Fin g → ℤ_[p]) → K) ∧
    ‖f‖ = ⨆ n, ‖vanDerPutCoeff p K f n‖ := by
  sorry

/-- L2/isotropic-wavelet-basis: includes the zero index with coefficient f(0). -/
theorem isIsotropicCr_iff_vanDerPut (r : ℝ) (hr0 : 0 ≤ r) (hr1 : r < 1)
    (f : C(Fin g → ℤ_[p], K)) :
    IsIsotropicCr p K r f ↔ Tendsto (fun n : Fin g → ℕ =>
      ‖vanDerPutCoeff p K f n‖ *
        (p : ℝ) ^ (r * (Finset.univ.sup fun j => digitLength p (n j) : ℕ)))
      cofinite (𝓝 0) := by
  sorry

/-- Block weight; the block partition is carried by b. -/
def blockWeight {D : ℕ} (b : Fin D → Fin g) (r : Fin g → ℝ) (n : Fin D → ℕ) : ℝ :=
  ∑ i, r i * ((Finset.univ.filter fun j => b j = i).sup fun j => digitLength p (n j) : ℕ)

-- AnalyticDistributionTests.blockVectorOrder_weight
example [Fact (Nat.Prime 2)] : blockWeight 2 (g := 2) ![0, 0, 1] ![1 / 2, 1 / 4]
    ![2 ^ 2, 1, 2 ^ 5] = 3 := by
  sorry

/- The value 3 above is the real weight 3/2 + 6/4. The actual basis scalar in the
README test is 2^(floor(3/2) + floor(6/4)) = 2²; taking the floor after summing
would instead give 2³, so these conventions must be distinguished. -/

end TauCeti.AnalyticDistributions

/-!
## README-only targets

The following retain their full statements, locators, hypotheses, APIs and tests in the reader.
Implementing their carriers or building chains of auxiliary lemmas belongs to formalisation.

* Locally polynomial submodules and coordinates: LP, LPAll, LPmulti, LPmultiAll, amplitudeCoeff,
  local/tensor basis maps, and finite-dimensional tensor identifications.
* Normed C^r and C^r(G) carriers, Taylor derivatives, Taylor truncation density, Banach algebra
  structure, coefficient estimates and equivalent valuations. IsCr records a membership property.
* AlgDist and compatible-moment construction, admissibility norm, restriction from the locally
  analytic dual, Amice–Vélu–Vishik, critical kernel and distribution operations. Finite-degree norm
  equivalence assumes D_r membership; arbitrary distributions require the all-degree criterion.
* Finite coefficient extension and unit-character determination: extend at each conductor,
  descend the resulting ball moments, then apply uniqueness over L.
* Completed projective tensors, function realization and duals; moment constants use the
  Mahler-induced projective norm with conversion constants for the equivalent coefficient norm.
* Normed isotropic/block spaces, their Banach bases and distribution extension theorems.
  IsVectorOrder and IsIsotropicCr are predicates, not replacement normed carriers.

The following inventory identifies the README APIs and tests by node. Commented names are
targets, not declarations whose implementation is being claimed.
-/

/- LocallyAnalyticDistributions:L2/locally-polynomial-functions
TauCeti.LocallyAnalytic.LP
TauCeti.LocallyAnalytic.LP_mono
TauCeti.LocallyAnalytic.mem_LP_iff
TauCeti.LocallyAnalytic.LP_zero_eq_locallyConstant
TauCeti.LocallyAnalytic.LP_basis
TauCeti.LocallyAnalytic.LP_mul
TauCeti.LocallyAnalytic.LP_comp_affine
LocallyAnalyticTests.LP_finrank_two
LocallyAnalyticTests.LP_level_zero
LocallyAnalyticTests.LP_zero_locallyConstant
LocallyAnalyticTests.LP_square_not_linear
-/

/- LocallyAnalyticDistributions:L2/colmez-wavelets
TauCeti.LocallyAnalytic.colmezWavelet
TauCeti.LocallyAnalytic.colmezWavelet_apply
TauCeti.LocallyAnalytic.colmezWavelet_mem_LP
TauCeti.LocallyAnalytic.colmezWavelet_basis
TauCeti.LocallyAnalytic.amplitudeCoeff
TauCeti.LocallyAnalytic.deriv_colmezWavelet
TauCeti.LocallyAnalytic.colmezWavelet_zero
LocallyAnalyticTests.colmezWavelet_value
LocallyAnalyticTests.colmezWavelet_level_zero
LocallyAnalyticTests.colmezWavelet_r_zero
LocallyAnalyticTests.colmezWavelet_count
LocallyAnalyticTests.colmezWavelet_scaling_needed
-/

/- LocallyAnalyticDistributions:L2/order-on-one-dimensional-groups
TauCeti.LocallyAnalytic.CrOn
TauCeti.LocallyAnalytic.CrOn_chart_independent
TauCeti.LocallyAnalytic.CrOn_zero_eq_continuous
TauCeti.LocallyAnalytic.DistOrderOn
TauCeti.LocallyAnalytic.DistOrderOn_zero_equiv_abstractMeasure
TauCeti.LocallyAnalytic.DistOrderOn_restrict
TauCeti.LocallyAnalytic.DistOrderOn_translate
TauCeti.LocallyAnalytic.DistOrderOn_mono
TauCeti.LocallyAnalytic.DistOrderOn_extLP
LocallyAnalyticTests.dirac_one_order_zero_units
LocallyAnalyticTests.CrOn_identity_chart
LocallyAnalyticTests.DistOrderOn_zero_units
LocallyAnalyticTests.chart_scaling_not_isometric
LocallyAnalyticTests.digit_chart_rejected
-/

/- LocallyAnalyticDistributions:L2/admissible-algebraic-distributions
TauCeti.LocallyAnalytic.AlgDist
TauCeti.LocallyAnalytic.AlgDist.ofBallMoments
TauCeti.LocallyAnalytic.localMonomial
TauCeti.LocallyAnalytic.admissibleNorm
TauCeti.LocallyAnalytic.IsAdmissible
TauCeti.LocallyAnalytic.AdmissibleAlgDist
TauCeti.LocallyAnalytic.isAdmissible_mono
TauCeti.LocallyAnalytic.isAdmissible_iff_topDegree
TauCeti.LocallyAnalytic.restrictAlg
TauCeti.LocallyAnalytic.AlgDist.ext_ballMoments
LocallyAnalyticTests.admissible_dirac
LocallyAnalyticTests.admissible_haar
LocallyAnalyticTests.admissible_zero
LocallyAnalyticTests.admissible_restrict_compat
LocallyAnalyticTests.admissible_critical_restriction_zero
-/

/- LocallyAnalyticDistributions:L2/box-indicators
TauCeti.AnalyticDistributions.padicBox
TauCeti.AnalyticDistributions.padicBox_isClopen
TauCeti.AnalyticDistributions.boxIndicator
TauCeti.AnalyticDistributions.mem_padicBox_iff
TauCeti.AnalyticDistributions.boxIndicator_refine
TauCeti.AnalyticDistributions.boxIndicator_mul
TauCeti.AnalyticDistributions.locallyConstant_mem_span_boxIndicator
TauCeti.AnalyticDistributions.boxIndicator_translate
AnalyticDistributionTests.boxIndicator_zero_radius
AnalyticDistributionTests.boxIndicator_refine_count
AnalyticDistributionTests.boxIndicator_eq_charFn
AnalyticDistributionTests.boxIndicator_radii_not_symmetric
-/

/- LocallyAnalyticDistributions:L2/separate-degree-polynomials
TauCeti.AnalyticDistributions.LPmulti
TauCeti.AnalyticDistributions.LPmulti_eq_tensor
TauCeti.AnalyticDistributions.tensorWavelet
TauCeti.AnalyticDistributions.tensorWavelet_basis
TauCeti.AnalyticDistributions.LPmulti_mono
TauCeti.AnalyticDistributions.LPmulti_zero_eq_locallyConstant
TauCeti.AnalyticDistributions.LPmulti_mul
AnalyticDistributionTests.LPmulti_finrank
AnalyticDistributionTests.LPmulti_one_variable
AnalyticDistributionTests.LPmulti_zero_locallyConstant
AnalyticDistributionTests.LPmulti_separate_not_total
-/

/- LocallyAnalyticDistributions:L2/isotropic-order-functions
TauCeti.AnalyticDistributions.IsIsotropicCr
TauCeti.AnalyticDistributions.isoCr
TauCeti.AnalyticDistributions.isoCr_one_dim
TauCeti.AnalyticDistributions.isoCr_aut_invariant
TauCeti.AnalyticDistributions.isoCr_locallyConstant_dense
TauCeti.AnalyticDistributions.isoCr_mono
TauCeti.AnalyticDistributions.isoCr_mul
AnalyticDistributionTests.isoCr_box_value
AnalyticDistributionTests.isoCr_one_dim_compat
AnalyticDistributionTests.isoCr_order_zero
AnalyticDistributionTests.isoCr_quarter_digit
-/

/- LocallyAnalyticDistributions:L2/block-vector-order
TauCeti.AnalyticDistributions.blockVectorOrderSpace
TauCeti.AnalyticDistributions.blockVectorOrderSpace_basis
TauCeti.AnalyticDistributions.mem_blockVectorOrderSpace_iff
TauCeti.AnalyticDistributions.blockVectorOrderSpace_one_dim_blocks
TauCeti.AnalyticDistributions.blockVectorOrderSpace_single_block
TauCeti.AnalyticDistributions.blockVectorOrderSpace_chart_independent
AnalyticDistributionTests.blockVectorOrder_weight
AnalyticDistributionTests.blockVectorOrder_order_zero
AnalyticDistributionTests.blockVectorOrder_one_dim_compat
AnalyticDistributionTests.blockVectorOrder_blocks_matter
-/
