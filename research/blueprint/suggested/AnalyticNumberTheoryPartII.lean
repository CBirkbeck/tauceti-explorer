/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive: research/blueprint/readmes/AnalyticNumberTheoryPartII.md.
These suggested Lean forms help contributors and reviewers converge on names
and signatures. Every proof below is a planning placeholder; no implementation
is claimed. Future supplier objects are not replaced by empty proposition fields.
-/

import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.MellinInversion
import Mathlib.Analysis.Analytic.Order
import Mathlib.NumberTheory.PrimeCounting
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.Discriminant.Basic
import Mathlib.NumberTheory.NumberField.DedekindZeta
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.NumberTheory.LegendreSymbol.JacobiSymbol
import Mathlib.NumberTheory.LegendreSymbol.ZModChar
import Mathlib.MeasureTheory.Measure.Prod
import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist
import Mathlib.NumberTheory.ArithmeticFunction.Liouville
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.LFunction
import TauCeti.NumberTheory.LSeries.EntireExtension
import TauCeti.NumberTheory.Multiquadratic.FundamentalDiscriminant.Basic
import TauCeti.NumberTheory.Multiquadratic.Quadratic.RamifiedPrime.Independence
import TauCeti.NumberTheory.NumberField.ClassGroupElementaryTwoQuotient
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.PointModTorsion
import TauCeti.Analysis.Contour.Cycle.Residue

open Filter MeasureTheory
open scoped BigOperators Topology NumberField

namespace TauCeti.EffectiveClassNumber

noncomputable section

/- AnalyticNumberTheoryPartII:ECN.0/ramified-weight -/
/-- Product over distinct discriminant primes with the largest erased. -/
noncomputable def ramifiedWeight (d : ℕ) : ℝ :=
  ∏ p ∈ d.primeFactors.erase (d.primeFactors.sup id),
    (1 - (⌊2 * Real.sqrt p⌋₊ : ℝ) / (p + 1))

theorem ramifiedWeight_pos (d : ℕ) : 0 < ramifiedWeight d := by sorry
theorem ramifiedWeight_le_one (d : ℕ) : ramifiedWeight d ≤ 1 := by sorry
theorem ramifiedWeight_prime (p k : ℕ) (hp : p.Prime) (hk : 1 ≤ k) :
    ramifiedWeight (p ^ k) = 1 := by sorry
theorem ramifiedWeight_support (d e : ℕ) (h : d.primeFactors = e.primeFactors) :
    ramifiedWeight d = ramifiedWeight e := by sorry
theorem ramifiedWeight_odd_class_number (K : Type) [Field K] [NumberField K]
    (hdegree : Module.finrank ℚ K = 2) (him : NumberField.discr K < 0)
    (hodd : Odd (NumberField.classNumber K)) :
    ramifiedWeight (NumberField.discr K).natAbs = 1 := by sorry

-- TauCeti.EffectiveClassNumber.ramifiedWeight_zero_test
example : ramifiedWeight 0 = 1 := by sorry
-- TauCeti.EffectiveClassNumber.ramifiedWeight_prime_test
example : ramifiedWeight 907 = 1 := by sorry
-- TauCeti.EffectiveClassNumber.ramifiedWeight_15_test
example : ramifiedWeight 15 = 1 / 4 := by sorry
-- TauCeti.EffectiveClassNumber.ramifiedWeight_84_test
example : ramifiedWeight 84 = 1 / 12 := by sorry

/- AnalyticNumberTheoryPartII:ECN.1/degree-four-completion -/
/-- d^(s-1) M^s Γ(s)^2 Ψ(s) G(s), center 1. -/
noncomputable def goldfeldCompletion (d : ℕ) (M : ℝ) (Ψ G : ℂ → ℂ) : ℂ → ℂ :=
  fun s ↦ (d : ℂ) ^ (s - 1) * (M : ℂ) ^ s * Complex.Gamma s ^ 2 * Ψ s * G s

theorem goldfeldCompletion_one (d : ℕ) (hd : 0 < d) (M : ℝ) (Ψ G : ℂ → ℂ) :
    goldfeldCompletion d M Ψ G 1 = (M : ℂ) * Ψ 1 * G 1 := by sorry
theorem goldfeldCompletion_two (d : ℕ) (hd : 0 < d) (M : ℝ) (Ψ G : ℂ → ℂ) :
    goldfeldCompletion d M Ψ G 2 = (d : ℂ) * (M : ℂ) ^ 2 * Ψ 2 * G 2 := by sorry
theorem goldfeldCompletion_congr (d : ℕ) (M : ℝ) (Ψ Ψ' G G' : ℂ → ℂ)
    (hΨ : Ψ = Ψ') (hG : G = G') :
    goldfeldCompletion d M Ψ G = goldfeldCompletion d M Ψ' G' := by sorry
theorem goldfeldCompletion_product (d N Nχ : ℕ) (hd : 0 < d) (hN : 0 < N)
    (hNχ : 0 < Nχ) (Ψ G L Lχ : ℂ → ℂ) (hprod : ∀ s, Ψ s * G s = L s * Lχ s)
    (s : ℂ) :
    goldfeldCompletion d (Real.sqrt ((N : ℝ) * Nχ) / (4 * Real.pi ^ 2 * d)) Ψ G s =
      ((N : ℂ) ^ (s / 2) * (2 * Real.pi : ℂ) ^ (-s) * Complex.Gamma s * L s) *
      ((Nχ : ℂ) ^ (s / 2) * (2 * Real.pi : ℂ) ^ (-s) * Complex.Gamma s * Lχ s) /
      (d : ℂ) := by sorry
theorem goldfeldCompletion_order (d : ℕ) (hd : 0 < d) (M : ℝ) (hM : 0 < M)
    (Ψ G : ℂ → ℂ) (hprod : AnalyticAt ℂ (fun s ↦ Ψ s * G s) 1)
    (hfinite : analyticOrderAt (fun s ↦ Ψ s * G s) 1 ≠ ⊤) :
    analyticOrderNatAt (goldfeldCompletion d M Ψ G) 1 =
      analyticOrderNatAt (fun s ↦ Ψ s * G s) 1 := by sorry

-- TauCeti.EffectiveClassNumber.goldfeldCompletion_center_test
example : goldfeldCompletion 2 3 (fun _ ↦ 2) (fun _ ↦ 5) 1 = 30 := by sorry
-- TauCeti.EffectiveClassNumber.goldfeldCompletion_two_test
example : goldfeldCompletion 2 3 (fun _ ↦ 1) (fun _ ↦ 1) 2 = 18 := by sorry
-- TauCeti.EffectiveClassNumber.goldfeldCompletion_zero_test
example (d : ℕ) (M : ℝ) (G : ℂ → ℂ) :
    goldfeldCompletion d M (fun _ ↦ 0) G = (fun _ ↦ 0) := by sorry

/- AnalyticNumberTheoryPartII:ECN.1/inverse-mellin-kernel -/
/-- The positive inverse transform of (s-a)^(-m), zero off (0,1]. -/
noncomputable def inverseMellinKernel (a : ℝ) (m : ℕ) : ℝ → ℝ :=
  fun x ↦ if 0 < x ∧ x ≤ 1 then
    x ^ (-a) * Real.log (1 / x) ^ (m - 1) / ((m - 1).factorial : ℝ) else 0

theorem inverseMellinKernel_of_pos_le_one (a x : ℝ) (m : ℕ) (hm : 2 ≤ m)
    (hx : 0 < x) (hx1 : x ≤ 1) :
    inverseMellinKernel a m x =
      x ^ (-a) * Real.log (1 / x) ^ (m - 1) / ((m - 1).factorial : ℝ) := by sorry
theorem inverseMellinKernel_eq_zero (a x : ℝ) (m : ℕ) (hm : 2 ≤ m)
    (hx : x ≤ 0 ∨ 1 ≤ x) : inverseMellinKernel a m x = 0 := by sorry
theorem inverseMellinKernel_nonneg (a x : ℝ) (m : ℕ) (hm : 2 ≤ m) :
    0 ≤ inverseMellinKernel a m x := by sorry
theorem inverseMellinKernel_antitone (a : ℝ) (m : ℕ) (ha : 0 ≤ a) (hm : 2 ≤ m) :
    AntitoneOn (inverseMellinKernel a m) (Set.Ioi 0) := by sorry
theorem inverseMellinKernel_convex (a : ℝ) (m : ℕ) (ha : 0 ≤ a) (hm : 2 ≤ m) :
    ConvexOn ℝ (Set.Ioi 0) (inverseMellinKernel a m) := by sorry
theorem inverseMellinKernel_transform (a : ℝ) (m : ℕ) (hm : 2 ≤ m)
    (s : ℂ) (hs : a < s.re) :
    mellin (fun x ↦ (inverseMellinKernel a m x : ℂ)) s =
      (s - (a : ℂ)) ^ (-(m : ℤ)) := by sorry

-- TauCeti.EffectiveClassNumber.inverseMellinKernel_half_test
example : inverseMellinKernel 0 2 (1 / 2) = Real.log 2 := by sorry
-- TauCeti.EffectiveClassNumber.inverseMellinKernel_one_test
example : inverseMellinKernel 0 3 1 = 0 := by sorry
-- TauCeti.EffectiveClassNumber.inverseMellinKernel_two_test
example : inverseMellinKernel 0 2 2 = 0 := by sorry
-- TauCeti.EffectiveClassNumber.inverseMellinKernel_twisted_half_test
example : inverseMellinKernel 1 2 (1 / 2) = 2 * Real.log 2 := by sorry

/- AnalyticNumberTheoryPartII:ECN.2/curve-139 -/
/-- Y²+Y=X³-X²-64403X-6220110, isomorphic to GZ86 I (7.4). -/
def curve139 : WeierstrassCurve ℚ :=
  ⟨0, -1, 1, -64403, -6220110⟩

theorem curve139_coefficients :
    curve139.a₁ = 0 ∧ curve139.a₂ = -1 ∧ curve139.a₃ = 1 ∧
      curve139.a₄ = -64403 ∧ curve139.a₆ = -6220110 := by sorry
theorem curve139_discriminant : curve139.Δ = 37 * 139 ^ 6 := by sorry
instance curve139_isElliptic : curve139.IsElliptic := by sorry
theorem curve139_source_equation (X Y : ℚ) :
    curve139.toAffine.Equation X Y ↔
      (-139 : ℚ) * ((8 * Y + 4) / 139 ^ 2) ^ 2 =
        ((4 * X + 462) / (-139)) ^ 3 + 10 * ((4 * X + 462) / (-139)) ^ 2 -
          20 * ((4 * X + 462) / (-139)) + 8 := by sorry
-- The full projective extension preserves infinity; this signature pins its affine inverse.
theorem curve139_coordinate_inverse (X Y : ℚ) :
    ((-139) * ((4 * X + 462) / (-139)) - 462) / 4 = X ∧
      (139 ^ 2 * ((8 * Y + 4) / 139 ^ 2) - 4) / 8 = Y := by sorry

-- TauCeti.EffectiveClassNumber.curve139_a2_test
example : curve139.a₂ = -1 := by sorry
-- TauCeti.EffectiveClassNumber.curve139_a4_test
example : curve139.a₄ = -64403 := by sorry
-- TauCeti.EffectiveClassNumber.curve139_a6_test
example : curve139.a₆ = -6220110 := by sorry
-- TauCeti.EffectiveClassNumber.curve139_origin_test
example : ¬ curve139.toAffine.Equation 0 0 := by sorry

/- AnalyticNumberTheoryPartII:ECN.2/curve-5077 -/
/-- y²+y=x³-7x+6; y↦-y gives GZ86's minus-y model. -/
def curve5077 : WeierstrassCurve ℚ := ⟨0, 0, 1, -7, 6⟩

theorem curve5077_coefficients :
    curve5077.a₁ = 0 ∧ curve5077.a₂ = 0 ∧ curve5077.a₃ = 1 ∧
      curve5077.a₄ = -7 ∧ curve5077.a₆ = 6 := by sorry
theorem curve5077_discriminant : curve5077.Δ = 5077 := by sorry
instance curve5077_isElliptic : curve5077.IsElliptic := by sorry
theorem curve5077_equation (x y : ℚ) :
    curve5077.toAffine.Equation x y ↔ y ^ 2 + y = x ^ 3 - 7 * x + 6 := by sorry
theorem curve5077_minus_y_equation (x y : ℚ) :
    curve5077.toAffine.Equation x y ↔ (-y) ^ 2 - (-y) = x ^ 3 - 7 * x + 6 := by sorry
theorem curve5077_generator_coordinates :
    curve5077.toAffine.Equation 0 2 ∧ curve5077.toAffine.Equation 1 0 ∧
      curve5077.toAffine.Equation 2 0 := by sorry

-- TauCeti.EffectiveClassNumber.curve5077_P0_test
example : curve5077.toAffine.Equation 0 2 := by sorry
-- TauCeti.EffectiveClassNumber.curve5077_P1_test
example : curve5077.toAffine.Equation 1 0 := by sorry
-- TauCeti.EffectiveClassNumber.curve5077_P2_test
example : curve5077.toAffine.Equation 2 0 := by sorry
-- TauCeti.EffectiveClassNumber.curve5077_wrong_sign_test
example : ¬ curve5077.toAffine.Equation 0 (-2) := by sorry

/- AnalyticNumberTheoryPartII:ECN.2/bgz-kernel -/
/-- G₀=exp(-x), Gᵣ(x)=(r-1)!⁻¹∫₁∞exp(-xy)(log y)^(r-1)dy/y for x>0. -/
noncomputable def bgzKernel (r : ℕ) : ℝ → ℝ :=
  fun x ↦ if x ≤ 0 then 0 else if r = 0 then Real.exp (-x) else
    (∫ y in Set.Ioi (1 : ℝ), Real.exp (-x * y) * Real.log y ^ (r - 1) / y) /
      ((r - 1).factorial : ℝ)

theorem bgzKernel_zero (x : ℝ) (hx : 0 < x) :
    bgzKernel 0 x = Real.exp (-x) := by sorry
theorem bgzKernel_nonpositive (r : ℕ) (x : ℝ) (hx : x ≤ 0) :
    bgzKernel r x = 0 := by sorry
theorem bgzKernel_pos (r : ℕ) (x : ℝ) (hx : 0 < x) : 0 < bgzKernel r x := by sorry
theorem bgzKernel_derivative (r : ℕ) (hr : 1 ≤ r) (x : ℝ) (hx : 0 < x) :
    HasDerivAt (bgzKernel r) (-bgzKernel (r - 1) x / x) x := by sorry
theorem bgzKernel_exp_bound (r : ℕ) (x : ℝ) (hx : 0 < x) :
    bgzKernel r x ≤ Real.exp (-x) / x ^ r := by sorry
theorem bgzKernel_mellin (r : ℕ) (hr : 1 ≤ r) (x σ : ℝ) (hx : 0 < x) (hσ : 0 < σ) :
    mellinInv σ (fun s ↦ Complex.Gamma s / s ^ r) x = (bgzKernel r x : ℂ) := by sorry

-- TauCeti.EffectiveClassNumber.bgzKernel_zero_at_one_test
example : bgzKernel 0 1 = Real.exp (-1) := by sorry
-- TauCeti.EffectiveClassNumber.bgzKernel_boundary_test
example : bgzKernel 3 0 = 0 := by sorry
-- TauCeti.EffectiveClassNumber.bgzKernel_one_positive_test
example : 0 < bgzKernel 1 1 ∧ bgzKernel 1 1 < Real.exp (-1) := by sorry
-- TauCeti.EffectiveClassNumber.bgzKernel_three_tail_test
example : bgzKernel 3 2 ≤ Real.exp (-2) / 8 := by sorry

/- AnalyticNumberTheoryPartII:ECN.4/prime-majorant -/
/-- c times the smooth reciprocal Hasse factors for the first t-1 primes. -/
noncomputable def primeMajorant (c : ℝ) (t : ℕ) : ℝ :=
  c * ∏ j ∈ Finset.range (t - 1),
    ((Nat.nth Nat.Prime j : ℝ) + 1) /
      ((Nat.nth Nat.Prime j : ℝ) + 1 - 2 * Real.sqrt (Nat.nth Nat.Prime j))

theorem primeMajorant_zero (c : ℝ) : primeMajorant c 0 = c := by sorry
theorem primeMajorant_one (c : ℝ) : primeMajorant c 1 = c := by sorry
theorem primeMajorant_succ (c : ℝ) (t : ℕ) (ht : 1 ≤ t) :
    primeMajorant c (t + 1) = primeMajorant c t *
      ((Nat.nth Nat.Prime (t - 1) : ℝ) + 1) /
      ((Nat.nth Nat.Prime (t - 1) : ℝ) + 1 - 2 * Real.sqrt (Nat.nth Nat.Prime (t - 1))) :=
  by sorry
theorem primeMajorant_pos (c : ℝ) (hc : 0 < c) (t : ℕ) :
    0 < primeMajorant c t := by sorry
theorem primeMajorant_monotone (c : ℝ) (hc : 0 ≤ c) : Monotone (primeMajorant c) := by sorry
theorem primeMajorant_weight (d : ℕ) (hd : 1 < d) (c : ℝ) (hc : 0 ≤ c) :
    c ≤ ramifiedWeight d * primeMajorant c d.primeFactors.card := by sorry

-- TauCeti.EffectiveClassNumber.primeMajorant_zero_test
example : primeMajorant 7000 0 = 7000 := by sorry
-- TauCeti.EffectiveClassNumber.primeMajorant_one_test
example : primeMajorant 55 1 = 55 := by sorry
-- TauCeti.EffectiveClassNumber.primeMajorant_two_test
example : primeMajorant 55 2 = 165 / (3 - 2 * Real.sqrt 2) := by sorry
-- TauCeti.EffectiveClassNumber.primeMajorant_three_test
example : primeMajorant 55 3 = 660 / ((3 - 2 * Real.sqrt 2) * (4 - 2 * Real.sqrt 3)) := by sorry

/- AnalyticNumberTheoryPartII:ECN.4/effective-kappa -/
/-- Exact rational witness: 0, 1/2, or 2^(-(46+ceil(256(1-q)/q))). -/
def effectiveKappa (q : ℚ) : ℚ :=
  if q ≤ 0 then 0 else if 1 ≤ q then 1 / 2
  else 1 / (2 : ℚ) ^ (46 + (Int.ceil (256 * (1 - q) / q)).toNat)

theorem effectiveKappa_nonpositive (q : ℚ) (hq : q ≤ 0) : effectiveKappa q = 0 := by sorry
theorem effectiveKappa_ge_one (q : ℚ) (hq : 1 ≤ q) : effectiveKappa q = 1 / 2 := by sorry
theorem effectiveKappa_pos (q : ℚ) (hq : 0 < q) : 0 < effectiveKappa q := by sorry
theorem effectiveKappa_small (q : ℚ) (hq : 0 < q) (hq1 : q < 1) :
    effectiveKappa q = 1 / (2 : ℚ) ^ (46 + (Int.ceil (256 * (1 - q) / q)).toNat) := by sorry
-- Equality to a rational-only program exposes the computational procedure.
theorem effectiveKappa_computable (q : ℚ) : effectiveKappa q =
    if q ≤ 0 then 0 else if 1 ≤ q then 1 / 2
    else 1 / (2 : ℚ) ^ (46 + (Int.ceil (256 * (1 - q) / q)).toNat) := by sorry
theorem effectiveKappa_lower_bound (K : Type) [Field K] [NumberField K]
    (hdegree : Module.finrank ℚ K = 2) (him : NumberField.discr K < 0)
    (q : ℚ) (hq : 0 < q) :
    (effectiveKappa q : ℝ) * Real.log ((NumberField.discr K).natAbs : ℝ) ^ (1 - (q : ℝ)) <
      NumberField.classNumber K := by sorry

-- TauCeti.EffectiveClassNumber.effectiveKappa_zero_test
example : effectiveKappa 0 = 0 := by sorry
-- TauCeti.EffectiveClassNumber.effectiveKappa_one_test
example : effectiveKappa 1 = 1 / 2 := by sorry
-- TauCeti.EffectiveClassNumber.effectiveKappa_half_test
example : effectiveKappa (1 / 2) = 1 / 2 ^ 302 := by sorry
-- TauCeti.EffectiveClassNumber.effectiveKappa_quarter_test
example : effectiveKappa (1 / 4) = 1 / 2 ^ 814 := by sorry

/- AnalyticNumberTheoryPartII:ECN.0/split-prime-size -/
/-- An unramified norm-p prime ideal expresses the quadratic splitting condition. -/
theorem splitPrime_size (K : Type) [Field K] [NumberField K]
    (hdegree : Module.finrank ℚ K = 2) (him : NumberField.discr K < -4)
    (p : ℕ) (hp : p.Prime) (hunram : ¬ (p : ℤ) ∣ NumberField.discr K)
    (hsplit : ∃ P : Ideal (𝓞 K), P.IsPrime ∧ P.absNorm = p) :
    (NumberField.discr K).natAbs ≤ 4 * p ^ NumberField.classNumber K := by sorry

/- AnalyticNumberTheoryPartII:ECN.0/liouville-agreement -/
/-- The supplier identifies χ with the primitive quadratic character of K.
The explicit hypotheses here isolate precisely the inert-small-prime consequence. -/
theorem liouville_agreement (χ : ArithmeticFunction ℤ) (n : ℕ)
    (hone : χ 1 = 1) (hmul : ∀ m n : ℕ, χ (m * n) = χ m * χ n) (hn : 0 < n)
    (hinert : ∀ p ∈ n.primeFactors, χ p = -1) :
    χ n = ArithmeticFunction.liouville n := by sorry

/- AnalyticNumberTheoryPartII:ECN.1/positive-mellin-comparison -/
/-- Single-measure kernel form with O85 Lemma 3's integrated counting hypothesis;
finite multiplicative convolutions iterate it. Mellin inversion additionally
requires the line/Fubini hypotheses recorded in the packet. -/
theorem positiveMellin_comparison (a x : ℝ) (m : ℕ) (ha : 0 ≤ a) (hx : 0 < x)
    (hm : 2 ≤ m) (μ ν : Measure ℝ)
    (hμ : μ (Set.Iic 0) = 0) (hν : ν (Set.Iic 0) = 0)
    (hlocalμ : ∀ t : ℝ, μ (Set.Ioc 0 t) ≠ ⊤)
    (hlocalν : ∀ t : ℝ, ν (Set.Ioc 0 t) ≠ ⊤)
    (hdom : ∀ T : ℝ, 0 ≤ T →
      (∫ t in Set.Icc 0 T, (μ (Set.Ioc 0 t)).toReal) ≤
        ∫ t in Set.Icc 0 T, (ν (Set.Ioc 0 t)).toReal)
    (hintμ : Integrable (fun t ↦ inverseMellinKernel a m (x * t)) μ)
    (hintν : Integrable (fun t ↦ inverseMellinKernel a m (x * t)) ν) :
    0 ≤ ∫ t, inverseMellinKernel a m (x * t) ∂μ ∧
      (∫ t, inverseMellinKernel a m (x * t) ∂μ) ≤
        ∫ t, inverseMellinKernel a m (x * t) ∂ν := by sorry

/-- Pointwise cumulative domination implies the integrated hypothesis above. -/
theorem positiveMellin_comparison_of_cumulative (a x : ℝ) (m : ℕ)
    (ha : 0 ≤ a) (hx : 0 < x) (hm : 2 ≤ m) (μ ν : Measure ℝ)
    (hμ : μ (Set.Iic 0) = 0) (hν : ν (Set.Iic 0) = 0)
    (hlocalμ : ∀ t : ℝ, μ (Set.Ioc 0 t) ≠ ⊤)
    (hlocalν : ∀ t : ℝ, ν (Set.Ioc 0 t) ≠ ⊤)
    (hdom : ∀ t : ℝ, 0 < t → μ (Set.Ioc 0 t) ≤ ν (Set.Ioc 0 t))
    (hintμ : Integrable (fun t ↦ inverseMellinKernel a m (x * t)) μ)
    (hintν : Integrable (fun t ↦ inverseMellinKernel a m (x * t)) ν) :
    0 ≤ ∫ t, inverseMellinKernel a m (x * t) ∂μ ∧
      (∫ t, inverseMellinKernel a m (x * t) ∂μ) ≤
        ∫ t, inverseMellinKernel a m (x * t) ∂ν := by sorry

/- AnalyticNumberTheoryPartII:ECN.1/fundamental-contour -/
theorem fundamentalContour (F : ℂ → ℂ) (hentire : Differentiable ℂ F)
    (hFE : ∀ s, F s = F (2 - s))
    (hzero : ∀ j : ℕ, j < 3 → iteratedDeriv j F 1 = 0)
    (hdecay : ∀ A B : ℝ, ∀ r : ℕ, ∃ C : ℝ, 0 < C ∧ ∀ s : ℂ,
      A ≤ s.re → s.re ≤ B → 1 ≤ |s.im| → ‖F s‖ ≤ C / |s.im| ^ r)
    (σ : ℝ) (hσ : 3 / 2 < σ) :
    (1 / (2 * Real.pi : ℂ)) *
      (∫ t : ℝ, F ((σ : ℂ) + t * Complex.I) /
        (((σ : ℂ) + t * Complex.I) - 1) ^ 3) = 0 := by sorry

/- AnalyticNumberTheoryPartII:ECN.1/truncated-residue -/
/-- H is the analytic removable extension of γΨ/(s-1); this is the local
residue part, before the indented-contour bound in the definitive reader. -/
theorem truncatedResidue (d : ℕ) (hd : 0 < d) (H G : ℂ → ℂ)
    (hH : AnalyticAt ℂ H 1) (hG : AnalyticAt ℂ G 1) :
    TauCeti.Contour.residue
      (fun s ↦ (d : ℂ) ^ (s - 1) * H s * G s / (s - 1) ^ 2) 1 =
      H 1 * G 1 * (Real.log d : ℂ) + H 1 * deriv G 1 + deriv H 1 * G 1 := by sorry

/- AnalyticNumberTheoryPartII:ECN.1/tail-three-pieces -/
/-- Quantitative assembly after the positive comparison supplies J₁,J₂,J₃.
Their defining contour and reduced-form measures require the GN.3/AN.4 exports. -/
theorem tailThreePieces (d : ℕ) (h M U A J₁ J₂ J₃ : ℝ) (Jstar : ℂ)
    (hmajorant : ‖Jstar‖ ≤ J₁ + J₂ + J₃)
    (h₁ : J₁ ≤ (M / 96) * h ^ 2 / Real.sqrt U *
      (|Real.log ((d : ℝ) * M / U)| + 3) ^ 4)
    (h₂ : J₂ ≤ (2 * Real.pi ^ 4 / 3) * M ^ (3 / 2 : ℝ) * h * A)
    (h₃ : J₃ ≤ 4 * Real.pi ^ 2 * Real.exp 1 * M ^ (3 / 2 : ℝ) *
      max 2 (Real.log (4 * M)) * h ^ 2 / Real.sqrt d) :
    ‖Jstar‖ ≤ (M / 96) * h ^ 2 / Real.sqrt U *
      (|Real.log ((d : ℝ) * M / U)| + 3) ^ 4 +
      (2 * Real.pi ^ 4 / 3) * M ^ (3 / 2 : ℝ) * h * A +
      4 * Real.pi ^ 2 * Real.exp 1 * M ^ (3 / 2 : ℝ) *
        max 2 (Real.log (4 * M)) * h ^ 2 / Real.sqrt d := by sorry

/- AnalyticNumberTheoryPartII:ECN.1/oesterle-technical-bound -/
/-- Mathematical C1--C4 theorem. Effectivity also requires the quantitative
presentations and moduli listed in the reader, rather than an arbitrary oracle. -/
theorem oesterleTechnical (M : ℝ) (hM : 0 < M) (Ψ : ℂ → ℂ) (a : ℕ → ℂ)
    (ha0 : a 0 = 0)
    (hΨseries : ∀ s : ℂ, 1 < s.re → Ψ s = LSeries a s)
    (hΨabs : ∀ σ : ℝ, 1 < σ → Summable (fun n : ℕ ↦ ‖a n‖ / (n : ℝ) ^ σ))
    (hΨcoeff : ∀ n : ℕ, 0 < n → ‖a n‖ ≤
      if (Nat.sqrt n) ^ 2 = n then (Nat.sqrt n : ℝ) * (Nat.divisors (Nat.sqrt n)).card
      else 0)
    (hΨan : AnalyticOnNhd ℂ Ψ {s : ℂ | 1 ≤ s.re})
    (hΨzero : Ψ 1 = 0) (hΨsimple : deriv Ψ 1 ≠ 0)
    (hΨdecay : ∀ A B : ℝ, 1 ≤ A → ∀ r : ℕ, ∃ C : ℝ, 0 < C ∧ ∀ s : ℂ,
      A ≤ s.re → s.re ≤ B → 1 ≤ |s.im| →
        ‖(M : ℂ) ^ s * Complex.Gamma s ^ 2 * Ψ s‖ ≤ C / |s.im| ^ r) :
    ∃ C : ℝ, 0 < C ∧ ∀ (K : Type) [Field K] [NumberField K],
      Module.finrank ℚ K = 2 → NumberField.discr K < -4 →
      ∀ (G : ℂ → ℂ) (b : ℕ → ℂ) (ν : ℕ → ℝ) (Gp : ℕ → ℂ → ℂ)
        (α β α' β' : ℕ → ℂ),
      b 0 = 0 → ν 0 = 0 → (∀ n, 0 ≤ ν n) →
      (∀ s : ℂ, 1 < s.re → LSeries (fun n ↦ (ν n : ℂ)) s =
        NumberField.dedekindZeta K s / riemannZeta (2 * s)) →
      (∀ σ : ℝ, 1 < σ → Summable (fun n : ℕ ↦ ν n / (n : ℝ) ^ σ)) →
      (∀ s : ℂ, 3 / 2 < s.re → G s = LSeries b s) →
      (∀ σ : ℝ, 3 / 2 < σ → Summable (fun n : ℕ ↦ ‖b n‖ / (n : ℝ) ^ σ)) →
      (∀ n : ℕ, 0 < n → ‖b n‖ ≤ Real.sqrt n *
        ∑ q ∈ n.divisors, ν q * ν (n / q)) →
      (∀ p : ℕ, p.Prime → ‖α p‖ ≤ Real.sqrt p ∧ ‖β p‖ ≤ Real.sqrt p ∧
        ‖α' p‖ ≤ Real.sqrt p ∧ ‖β' p‖ ≤ Real.sqrt p) →
      (∀ p : ℕ, p.Prime → ∀ s : ℂ, Gp p s =
        ((1 + α p * (p : ℂ) ^ (-s)) * (1 + β p * (p : ℂ) ^ (-s))) /
          ((1 + α' p * (p : ℂ) ^ (-s)) * (1 + β' p * (p : ℂ) ^ (-s)))) →
      (∀ s : ℂ, 3 / 2 < s.re → Tendsto
        (fun B : ℕ ↦ ∏ p ∈ (Finset.range B).filter Nat.Prime, Gp p s)
          atTop (nhds (G s))) →
      Differentiable ℂ (goldfeldCompletion (NumberField.discr K).natAbs M Ψ G) →
      (∀ s, goldfeldCompletion (NumberField.discr K).natAbs M Ψ G s =
        goldfeldCompletion (NumberField.discr K).natAbs M Ψ G (2 - s)) →
      (∀ j : ℕ, j < 3 →
        iteratedDeriv j (goldfeldCompletion (NumberField.discr K).natAbs M Ψ G) 1 = 0) →
      (∀ A B : ℝ, ∀ r : ℕ, ∃ T : ℝ, 0 < T ∧ ∀ s : ℂ,
        A ≤ s.re → s.re ≤ B → 1 ≤ |s.im| →
          ‖goldfeldCompletion (NumberField.discr K).natAbs M Ψ G s‖ ≤ T / |s.im| ^ r) →
      min 1 (∏ p ∈ (NumberField.discr K).natAbs.primeFactors.erase
        ((NumberField.discr K).natAbs.primeFactors.max' (by sorry)),
          ‖Gp p 1‖ / (1 + 1 / (p : ℝ))) * Real.log (NumberField.discr K).natAbs ≤
        C * NumberField.classNumber K := by sorry

/- AnalyticNumberTheoryPartII:ECN.2/curve-local-data -/
/-- The conductor and root-number types await R29.4/5; native bad coefficients
already pin two local factors. The full intrinsic statement is in the reader. -/
theorem curveLocalData : curve139.LFunction 139 = 0 ∧ curve5077.LFunction 5077 = -1 :=
  by sorry

/- AnalyticNumberTheoryPartII:ECN.2/arithmetic-rank-certificates -/
/-- Basis coordinates are in curve5077_generator_coordinates; completeness,
saturation and the full native basis are part of the definitive target. -/
theorem arithmeticRank_certificates :
    Module.finrank ℤ curve139.toAffine.PointModTorsion = 3 ∧
      Module.finrank ℤ curve5077.toAffine.PointModTorsion = 3 ∧
      Submodule.torsion ℤ curve5077.toAffine.Point = ⊥ := by sorry

/- AnalyticNumberTheoryPartII:ECN.2/central-derivative-enclosures -/
/-- Fricke transformation is stated directly until the newform supplier is present. -/
theorem centralDerivative_series (N r : ℕ) (hN : 0 < N) (hr : Odd r)
    (a : ℕ → ℝ) (L : ℂ → ℂ) (ha0 : a 0 = 0)
    (hcoeff : ∀ n : ℕ, |a n| ≤ (n.divisors.card : ℝ) * Real.sqrt n)
    (hentire : Differentiable ℂ L)
    (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = LSeries (fun n ↦ (a n : ℂ)) s)
    (hFricke : ∀ y : ℝ, 0 < y →
      (∑' n : ℕ, a n * Real.exp (-2 * Real.pi * n * y / Real.sqrt N)) =
        -y ^ (-2 : ℤ) * ∑' n : ℕ, a n * Real.exp (-2 * Real.pi * n / (y * Real.sqrt N)))
    (hzero : ∀ j : ℕ, j < r → iteratedDeriv j L 1 = 0) :
    iteratedDeriv r L 1 =
      (2 * (r.factorial : ℂ)) * ∑' n : ℕ,
        ((a n / n * bgzKernel r (2 * Real.pi * n / Real.sqrt N) : ℝ) : ℂ) := by sorry

/- AnalyticNumberTheoryPartII:ECN.2/heegner-height-gap -/
/-- Numeric core after GZ.8 supplies the height equality. -/
theorem heegnerHeight_gap (a b : ℂ) (c δ height : ℝ)
    (hc : 0 < c) (hδ : 0 < δ) (hb : b ≠ 0)
    (hformula : a * b = (c * height : ℝ))
    (hgap : height = 0 ∨ δ ≤ height) (hsmall : ‖a * b‖ < c * δ) :
    height = 0 ∧ a = 0 := by sorry


/-- The auxiliary twist is the existing trace/norm construction with D=1-8=-7. -/
theorem curve5077_auxiliary_twist (Lχ : ℂ → ℂ) (hentire : Differentiable ℂ Lχ)
    (hseries : ∀ s : ℂ, 3 / 2 < s.re →
      Lχ s = (curve5077.quadraticTwistOf 1 2).LSeries s) :
    (4 : ℝ) < (Lχ 1).re ∧ (Lχ 1).re < 5 ∧ (Lχ 1).im = 0 := by sorry

theorem curve5077_height_gap (P : curve5077.toAffine.Point) (hP : P ≠ 0) :
    (1 / 4 : ℝ) ≤ P.canonicalHeight := by sorry

/- AnalyticNumberTheoryPartII:ECN.2/heegner-trace-139 -/
/-- The modular-unit divisor and isotypic trace are not yet native supplier types;
this is their analytic consequence for the actual intrinsic Euler coefficients.
The packet requires the CM twelfth-power relation in H and excludes order-3/4
roots of unity there using [H:K]=3, before descending the common value to K. -/
theorem heegnerTrace_139 (L : ℂ → ℂ) (hentire : Differentiable ℂ L)
    (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = curve139.LSeries s) :
    deriv L 1 = 0 := by sorry

/- AnalyticNumberTheoryPartII:ECN.2/rank-three-139 -/
theorem rankThree_139 (L : ℂ → ℂ) (hentire : Differentiable ℂ L)
    (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = curve139.LSeries s) :
    analyticOrderAt L 1 ≠ ⊤ ∧ analyticOrderNatAt L 1 = 3 ∧
      Module.finrank ℤ curve139.toAffine.PointModTorsion = 3 := by sorry

/- AnalyticNumberTheoryPartII:ECN.2/rank-three-5077 -/
theorem rankThree_5077 (L : ℂ → ℂ) (hentire : Differentiable ℂ L)
    (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = curve5077.LSeries s) :
    analyticOrderAt L 1 ≠ ⊤ ∧ analyticOrderNatAt L 1 = 3 ∧
      Module.finrank ℤ curve5077.toAffine.PointModTorsion = 3 ∧ deriv L 1 = 0 ∧
      (173 / 100 : ℝ) < (iteratedDeriv 3 L 1).re / 6 ∧
      (iteratedDeriv 3 L 1).re / 6 < (174 / 100 : ℝ) := by sorry

/- AnalyticNumberTheoryPartII:ECN.3/liouville-system -/
/-- Local symmetric-square factors and C1/C2 require AL.3. This prototypes
C3 after the native elliptic completion and plus reflection are supplied. -/
theorem liouvilleSystem (d : ℕ) (M : ℝ) (L Lχ Ψ G : ℂ → ℂ)
    (hprod : ∀ s, Ψ s * G s = L s * Lχ s)
    (hentire : Differentiable ℂ (goldfeldCompletion d M Ψ G))
    (hFE : ∀ s, goldfeldCompletion d M Ψ G s = goldfeldCompletion d M Ψ G (2 - s))
    (hzero : ∀ j : ℕ, j < 3 → iteratedDeriv j L 1 = 0)
    (hχan : AnalyticAt ℂ Lχ 1) (hLan : AnalyticAt ℂ L 1)
    (hd : 0 < d) (hM : 0 < M) :
    ∀ j : ℕ, j < 4 → iteratedDeriv j (goldfeldCompletion d M Ψ G) 1 = 0 := by sorry

/- AnalyticNumberTheoryPartII:ECN.3/ramified-twist-systems -/
/-- The exact finite bad-prime list is in the reader; this is the scale identity
used with the intrinsic twist conductor, including overlapping ramified primes. -/
theorem ramifiedTwist_scale (d N Nχ : ℕ) (hd : 0 < d) (hN : 0 < N) (hNχ : 0 < Nχ)
    (L Lχ Ψ G : ℂ → ℂ) (hprod : ∀ s, Ψ s * G s = L s * Lχ s) (s : ℂ) :
    goldfeldCompletion d (Real.sqrt ((N : ℝ) * Nχ) / (4 * Real.pi ^ 2 * d)) Ψ G s =
      ((N : ℂ) ^ (s / 2) * (2 * Real.pi : ℂ) ^ (-s) * Complex.Gamma s * L s) *
      ((Nχ : ℂ) ^ (s / 2) * (2 * Real.pi : ℂ) ^ (-s) * Complex.Gamma s * Lχ s) /
      (d : ℂ) := by sorry

/- AnalyticNumberTheoryPartII:ECN.3/global-7000 -/
theorem global_7000 (K : Type) [Field K] [NumberField K]
    (hdegree : Module.finrank ℚ K = 2) (him : NumberField.discr K < 0) :
    ramifiedWeight (NumberField.discr K).natAbs * Real.log (NumberField.discr K).natAbs ≤
      7000 * NumberField.classNumber K := by sorry

/- AnalyticNumberTheoryPartII:ECN.3/coprime-55 -/
theorem coprime_55 (K : Type) [Field K] [NumberField K]
    (hdegree : Module.finrank ℚ K = 2) (him : NumberField.discr K < 0)
    (hcoprime : (NumberField.discr K).natAbs.Coprime 5077) :
    ramifiedWeight (NumberField.discr K).natAbs * Real.log (NumberField.discr K).natAbs ≤
      55 * NumberField.classNumber K := by sorry

theorem primeDiscriminant_55_strict (K : Type) [Field K] [NumberField K]
    (hdegree : Module.finrank ℚ K = 2) (him : NumberField.discr K < 0)
    (hprime : (NumberField.discr K).natAbs.Prime)
    (hcoprime : (NumberField.discr K).natAbs.Coprime 5077) :
    Real.log (NumberField.discr K).natAbs < 55 * NumberField.classNumber K := by sorry

/- AnalyticNumberTheoryPartII:ECN.3/exceptional-5077 -/
theorem exceptional_5077 (K : Type) [Field K] [NumberField K]
    (hdegree : Module.finrank ℚ K = 2) (him : NumberField.discr K < 0) :
    (NumberField.discr K).natAbs ≠ 5077 := by sorry

-- The fundamental-discriminant filter excludes the integer before character use.
example : ¬ TauCeti.Multiquadratic.IsFundamentalDiscriminant (-5077) := by sorry

/- AnalyticNumberTheoryPartII:ECN.4/prime-product-bound -/
theorem primeProduct_bound (c : ℝ) (hc : 0 < c) (t : ℕ) :
    Real.log (primeMajorant c t) ≤ Real.log c + 16 * Real.sqrt t := by sorry

/- AnalyticNumberTheoryPartII:ECN.4/explicit-t-bound -/
theorem explicitT_bound (K : Type) [Field K] [NumberField K]
    (hdegree : Module.finrank ℚ K = 2) (him : NumberField.discr K < 0) :
    Real.log (NumberField.discr K).natAbs ≤
      primeMajorant 7000 (NumberField.discr K).natAbs.primeFactors.card *
        NumberField.classNumber K ∧
      ((NumberField.discr K).natAbs.Coprime 5077 →
        Real.log (NumberField.discr K).natAbs ≤
          primeMajorant 55 (NumberField.discr K).natAbs.primeFactors.card *
            NumberField.classNumber K) := by sorry

/- AnalyticNumberTheoryPartII:ECN.4/asymptotic-constant -/
theorem asymptotic_constant (c : ℝ) (hc : 0 < c) :
    Tendsto (fun t : ℕ ↦ Real.log (primeMajorant c t) /
      (4 * Real.sqrt ((t : ℝ) / Real.log t))) atTop (nhds 1) := by sorry

/- AnalyticNumberTheoryPartII:ECN.4/effective-logarithmic-bound -/
/-- Rational q is the supplied lower information about a real exponent loss. -/
theorem effectiveLogarithmic_bound (ε : ℝ) (q : ℚ) (hq : 0 < q) (hqε : (q : ℝ) ≤ ε)
    (K : Type) [Field K] [NumberField K] (hdegree : Module.finrank ℚ K = 2)
    (him : NumberField.discr K < 0) :
    0 < effectiveKappa q ∧
      (effectiveKappa q : ℝ) * (Real.log (NumberField.discr K).natAbs) ^ (1 - ε) <
        NumberField.classNumber K := by sorry

/- AnalyticNumberTheoryPartII:ECN.4/effective-cutoff -/
theorem effective_cutoff (H : ℕ) (hH : 1 ≤ H) (K : Type) [Field K] [NumberField K]
    (hdegree : Module.finrank ℚ K = 2) (him : NumberField.discr K < 0)
    (hclass : NumberField.classNumber K = H) :
    ((NumberField.discr K).natAbs : ℝ) < Real.exp (2 ^ 604 * (H : ℝ) ^ 2) ∧
      (NumberField.discr K).natAbs < 2 ^ (2 ^ 605 * H ^ 2) := by sorry

/- AnalyticNumberTheoryPartII:ECN.4/siegel-comparison -/
/-- Imported existential comparison; no computable c is claimed by this signature. -/
theorem siegel_comparison (η : ℝ) (hη : 0 < η) :
    ∃ c : ℝ, 0 < c ∧ ∀ (K : Type) [Field K] [NumberField K],
      Module.finrank ℚ K = 2 → NumberField.discr K < 0 →
      c * ((NumberField.discr K).natAbs : ℝ) ^ (1 / 2 - η) ≤
        NumberField.classNumber K := by sorry

/- AnalyticNumberTheoryPartII:ECN.5/class-three-prime -/
theorem classThree_prime (K : Type) [Field K] [NumberField K]
    (hdegree : Module.finrank ℚ K = 2) (him : NumberField.discr K < 0)
    (hthree : NumberField.classNumber K = 3) :
    ∃ p : ℕ, p.Prime ∧ p % 4 = 3 ∧ NumberField.discr K = -(p : ℤ) := by sorry

/- AnalyticNumberTheoryPartII:ECN.5/mw-zero-brackets -/
/-- The primitive real odd character has negative discriminant D=-k and positive
conductor k. Its Hardy function uses Γ((s+1)/2). Character normalization is
explicit at 2 and all odd primes; χ₈ handles the 2-adic evaluation. -/
theorem mwZero_brackets (k : ℕ) [NeZero k] (hk : k = 17923 ∨ k = 115147 ∨ k = 123204)
    (χ : DirichletCharacter ℂ k) (hprimitive : χ.IsPrimitive)
    (hparity : χ (-1) = -1)
    (hoddPrimes : ∀ p : ℕ, (hp : p.Prime) → p ≠ 2 →
      χ p = (@legendreSym p ⟨hp⟩ (-(k : ℤ)) : ℂ))
    (htwo : χ 2 = (ZMod.χ₈ (-(k : ZMod 8)) : ℂ)) :
    ∃ γ : ℝ,
      (if k = 17923 then (30985 / 10 ^ 6 : ℝ)
        else if k = 115147 then 3157 / 10 ^ 6 else 10649 / 10 ^ 6) ≤ γ ∧
      γ ≤ (if k = 17923 then (30987 / 10 ^ 6 : ℝ)
        else if k = 115147 then 3159 / 10 ^ 6 else 10651 / 10 ^ 6) ∧
      χ.LFunction ((1 / 2 : ℂ) + γ * Complex.I) = 0 := by sorry

/- AnalyticNumberTheoryPartII:ECN.5/mw-phase-exclusion -/
theorem montgomeryWeinberger (K : Type) [Field K] [NumberField K]
    (hdegree : Module.finrank ℚ K = 2) (him : NumberField.discr K < 0)
    (hlo : 10 ^ 12 ≤ (NumberField.discr K).natAbs)
    (hhi : (NumberField.discr K).natAbs ≤ 10 ^ 2500) :
    NumberField.classNumber K ≠ 3 := by sorry

/- AnalyticNumberTheoryPartII:ECN.5/small-range-sieve -/
theorem smallRange_sieve (K : Type) [Field K] [NumberField K]
    (hdegree : Module.finrank ℚ K = 2) (him : NumberField.discr K < 0)
    (hlo : 907 < (NumberField.discr K).natAbs)
    (hhi : (NumberField.discr K).natAbs < 10 ^ 12) :
    NumberField.classNumber K ≠ 3 := by sorry

/- AnalyticNumberTheoryPartII:ECN.5/class-three-cutoff -/
theorem classThree_cutoff (K : Type) [Field K] [NumberField K]
    (hdegree : Module.finrank ℚ K = 2) (him : NumberField.discr K < 0)
    (hthree : NumberField.classNumber K = 3) :
    (NumberField.discr K).natAbs ≤ 907 := by sorry

/- AnalyticNumberTheoryPartII:ECN.5/class-three-enumeration -/
theorem classThree_enumeration (K : Type) [Field K] [NumberField K]
    (hdegree : Module.finrank ℚ K = 2) (him : NumberField.discr K < 0) :
    NumberField.classNumber K = 3 ↔ NumberField.discr K ∈
      ({-23, -31, -59, -83, -107, -139, -211, -283, -307, -331, -379,
        -499, -547, -643, -883, -907} : Finset ℤ) := by sorry

end

end TauCeti.EffectiveClassNumber
