/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.

This file is not the roadmap and is not exhaustive. The accompanying roadmap
 document is definitive. These statements suggest Lean forms so contributors
 and reviewers converge on names and signatures. All proof placeholders are
 intentional; nothing here is claimed formalised. Elaboration results and the
 precise build commits are recorded in the assembly handoff.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The analytic, twist and point prototypes use actual pinned library carriers.
Conductor, full real period, whole-Sha cardinality, Tamagawa product and the BSD
regulator are explicitly marked data placeholders for their existing owners;
they are not implementations. Their arithmetic properties still require the
supplier interfaces in the packets. The rational prime-certificate core uses
actual rational numbers and finite sets. The joined BSD.8 application below
uses BSD.5's bsdDefect on the same actual curve and these marked invariants.

Arithmetic/Iwasawa conditions that cannot be stated with actual provider APIs
remain explicit omissions, never Prop-valued fields, axioms or predicted Sha
cardinalities. In particular the six signed BSTW API names/four tests and the
Beilinson-Flach API/tests remain comments, not Lean declarations. The first
part's partial/needs_changes status is preserved; assembling it does not resolve
its source and carrier gaps. See research/blueprint/handoff/ASM-RankZeroOneBSD.md.
-/

import Mathlib.AlgebraicGeometry.EllipticCurve.LFunction
import Mathlib.AlgebraicGeometry.EllipticCurve.VariableChange
import Mathlib.Analysis.Analytic.Order
import Mathlib.Analysis.Calculus.IteratedDeriv.Defs
import Mathlib.Analysis.SpecialFunctions.Gamma.Deligne
import Mathlib.NumberTheory.FundamentalDiscriminant
import Mathlib.NumberTheory.LegendreSymbol.JacobiSymbol
import Mathlib.NumberTheory.LegendreSymbol.QuadraticChar.Basic
import Mathlib.NumberTheory.NumberField.Discriminant.Defs
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import TauCeti.NumberTheory.LSeries.EntireExtension
import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist
import TauCeti.AlgebraicGeometry.EllipticCurve.GaloisDescent
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Degree
import Mathlib.Data.Nat.PrimeFin
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Basic.Real.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Fintype.Prod

noncomputable section

open Complex Filter Topology
open scoped ArithmeticFunction TensorProduct

namespace WeierstrassCurve

/-! ## Placeholders for invariants owned by other layers -/

section Placeholders

/-- PLACEHOLDER for the conductor of `E` (EllipticCurveModularity R29.4/exact-conductor,
ArithmeticGaloisRepresentations R01.6). Not in the pinned libraries. -/
def conductor (E : WeierstrassCurve ℚ) : ℕ := sorry

/-- PLACEHOLDER for the full real period `Ω_E` of the global minimal model
(EllipticCurves Layer 7: `2 ∫_{D_W > 0} dx / √D_W`). -/
def realPeriod (E : WeierstrassCurve ℚ) : ℝ := sorry

/-- PLACEHOLDER for `#Ш(E/ℚ)` when finite (EllipticCurves Layer 7). -/
def shaCard (E : WeierstrassCurve ℚ) : ℕ := sorry

/-- PLACEHOLDER for `∏_ℓ c_ℓ(E)` (EllipticCurves Layer 4, Tate's algorithm). -/
def tamagawaProduct (E : WeierstrassCurve ℚ) : ℕ := sorry

/-- PLACEHOLDER for the local epsilon-factor sign at the rational prime `p`
(GL2AutomorphicRepresentationsAndTransfer R16.3). -/
def localRootNumber (E : WeierstrassCurve ℚ) (p : ℕ) : ℤˣ := sorry

/-- PLACEHOLDER for `Reg_BSD(E/ℚ) = 2 ^ rank · regulator` (GrossZagierAndArithmeticHeights GZ.0),
which needs a number-field `AdmissibleAbsValues` instance absent at the pin. -/
def bsdRegulator (E : WeierstrassCurve ℚ) : ℝ := sorry

/-- The order of the rational torsion subgroup. -/
def torsionCard (E : WeierstrassCurve ℚ) : ℕ := Nat.card (AddCommGroup.torsion (E⁄ℚ).toAffine.Point)

end Placeholders

/-! ## BSD.0 — the actual L-function -/

section ActualLFunction

variable (E : WeierstrassCurve ℚ) [E.IsElliptic]

/-- BSD.0/actual-l-function: the coefficient series of Mathlib's Euler product has an entire
extension (through modularity, EllipticCurveModularity R29.6). -/
theorem hasEntireExtension_LFunction :
    LSeries.HasEntireExtension (fun n ↦ (E.LFunction n : ℂ)) := by
  sorry

/-- BSD.0/actual-l-function: the actual L-function of `E`, the unique entire function agreeing
with `E.LSeries` on the half-plane of absolute convergence. -/
def ellipticL : ℂ → ℂ :=
  Classical.choose E.hasEntireExtension_LFunction.exists_extension

theorem ellipticL_eq_LSeries {s : ℂ} (hs : 3 / 2 < s.re) : E.ellipticL s = E.LSeries s := by
  sorry

theorem differentiable_ellipticL : Differentiable ℂ E.ellipticL := by
  sorry

theorem ellipticL_unique {G : ℂ → ℂ} (hG : Differentiable ℂ G) (c : ℝ)
    (hGc : ∀ s : ℂ, c < s.re → G s = E.LSeries s) : G = E.ellipticL := by
  sorry

/-- The Euler product, as a product over primes of the local power series. -/
theorem ellipticL_eq_eulerProduct {s : ℂ} (hs : 3 / 2 < s.re) :
    HasProd (fun p : Nat.Primes ↦
      ∑' k : ℕ, (E.LFunction ((p : ℕ) ^ k) : ℂ) * ((p : ℂ) ^ (k : ℂ)) ^ (-s))
      (E.ellipticL s) := by
  sorry

theorem ellipticL_ne_zero_of_re_gt {s : ℂ} (hs : 3 / 2 < s.re) : E.ellipticL s ≠ 0 := by
  sorry

theorem ellipticL_conj (s : ℂ) :
    E.ellipticL (starRingEnd ℂ s) = starRingEnd ℂ (E.ellipticL s) := by
  sorry

/-- Isogenous curves have the same L-function (EllipticCurves Layer 7). -/
theorem ellipticL_eq_of_isogenous (E' : WeierstrassCurve ℚ) [E'.IsElliptic]
    (φ : TauCeti.Isogeny E.toAffine E'.toAffine) : E.ellipticL = E'.ellipticL := by
  sorry

theorem ellipticL_eq_of_variableChange (C : VariableChange ℚ) :
    (C • E).ellipticL = E.ellipticL := by
  sorry

/-- Test `WeierstrassCurve.ellipticL_two`. -/
example : E.ellipticL 2 = E.LSeries 2 := by
  sorry

/-- The curve 11a3 : `y² + y = x³ − x²`. -/
def e11a3 : WeierstrassCurve ℚ := ⟨0, -1, 1, 0, 0⟩

/-- The curve 11a1 : `y² + y = x³ − x² − 10x − 20`. -/
def e11a1 : WeierstrassCurve ℚ := ⟨0, -1, 1, -10, -20⟩

/-- The curve 37a1 : `y² + y = x³ − x`. -/
def e37a1 : WeierstrassCurve ℚ := ⟨0, 0, 1, -1, 0⟩

instance : e11a3.IsElliptic := ⟨by sorry⟩
instance : e11a1.IsElliptic := ⟨by sorry⟩
instance : e37a1.IsElliptic := ⟨by sorry⟩

/-- Test `WeierstrassCurve.LSeries_one_eq_zero_ne_ellipticL` (non-example): if the coefficient
series is not summable, Mathlib's tsum is `0`; this does not make the continuation zero.
The absolute-convergence bound alone does not prove this nonsummability hypothesis. -/
example (h : ¬ LSeriesSummable (fun n ↦ (e11a3.LFunction n : ℂ)) 1) :
    e11a3.LSeries 1 = 0 ∧ e11a3.ellipticL 1 ≠ 0 := by
  sorry

/-- Test `WeierstrassCurve.ellipticL_eq_newformL`: any entire extension (in particular the one
coming from the newform `F_E` through Mathlib's `ModularForm.L`) is `ellipticL`. -/
example (F : ℂ → ℂ) (hF : Differentiable ℂ F)
    (hFa : ∀ s : ℂ, 2 < s.re → F s = LSeries (fun n ↦ (E.LFunction n : ℂ)) s) :
    F = E.ellipticL := by
  sorry

/-- Test `WeierstrassCurve.ellipticL_isogenous_11`. -/
example : e11a1.ellipticL = e11a3.ellipticL := by
  sorry

end ActualLFunction

/-! ## BSD.0 — completed L-function, root number, analytic rank -/

section Analytic

variable (E : WeierstrassCurve ℚ) [E.IsElliptic]

/-- Existence of the completed entire function, obtained from the newform Mellin transform.
Agreement is asserted away from the Gamma poles. -/
theorem exists_completedEllipticL :
    ∃ F : ℂ → ℂ, Differentiable ℂ F ∧ ∀ s : ℂ, 0 < s.re →
      F s = (E.conductor : ℂ) ^ (s / 2) * Gammaℂ s * E.ellipticL s := by
  sorry

/-- BSD.0/completed-l-function. At a Gamma pole, use entire continuation, rather than the
pointwise product of Lean's total Gamma function and `ellipticL`. -/
def completedEllipticL : ℂ → ℂ := Classical.choose E.exists_completedEllipticL

theorem completedEllipticL_eq_gammaProduct {s : ℂ} (hs : 0 < s.re) :
    E.completedEllipticL s =
      (E.conductor : ℂ) ^ (s / 2) * Gammaℂ s * E.ellipticL s := by
  sorry

theorem completedEllipticL_unique {F : ℂ → ℂ} (hF : Differentiable ℂ F)
    (hprod : ∀ s : ℂ, 0 < s.re →
      F s = (E.conductor : ℂ) ^ (s / 2) * Gammaℂ s * E.ellipticL s) :
    F = E.completedEllipticL := by
  sorry

open Classical in
/-- The root number: the sign `w` with `Λ(E, 2 − s) = w Λ(E, s)`. -/
def rootNumber : ℤˣ :=
  if ∀ s : ℂ, E.completedEllipticL (2 - s) = E.completedEllipticL s then 1 else -1

theorem differentiable_completedEllipticL : Differentiable ℂ E.completedEllipticL := by
  sorry

theorem completedEllipticL_two_sub (s : ℂ) :
    E.completedEllipticL (2 - s) = (E.rootNumber : ℂ) * E.completedEllipticL s := by
  sorry

/-- `w_E = −ε_N(F_E)`: stated with the Fricke eigenvalue as an explicit sign `ε` of the newform
`f` of `E` under Tau Ceti's normalised Fricke operator. -/
theorem rootNumber_eq_neg_fricke (ε : ℤˣ)
    (hε : ∀ s : ℂ, E.completedEllipticL (2 - s) = -(ε : ℂ) * E.completedEllipticL s) :
    E.rootNumber = -ε := by
  sorry

theorem rootNumber_eq_of_isogenous (E' : WeierstrassCurve ℚ) [E'.IsElliptic]
    (φ : TauCeti.Isogeny E.toAffine E'.toAffine) :
    E.rootNumber = E'.rootNumber := by
  sorry

/-- The full local product formula, with `w_∞ = −1` and the good-prime signs equal to one
(GL2AutomorphicRepresentationsAndTransfer R16.3). -/
theorem rootNumber_eq_prod_local :
    E.rootNumber = -∏ p ∈ E.conductor.primeFactors, E.localRootNumber p := by
  sorry

/-- In the semistable case, the local multiplicative sign is `−a_p`. -/
theorem rootNumber_eq_prod_trace (hss : Squarefree E.conductor) :
    (E.rootNumber : ℤ) = -∏ p ∈ E.conductor.primeFactors, -E.LFunction p := by
  sorry

theorem completedEllipticL_one :
    E.completedEllipticL 1 = (E.conductor : ℂ) ^ ((1 : ℂ) / 2) * (π : ℂ)⁻¹ * E.ellipticL 1 := by
  sorry

/-- Test `WeierstrassCurve.rootNumber_37a`. -/
example : e37a1.rootNumber = -1 := by
  sorry

/-- Test `WeierstrassCurve.rootNumber_11a`. -/
example : e11a1.rootNumber = 1 := by
  sorry

/-- Test `WeierstrassCurve.completedEllipticL_one_eq`. -/
example : E.completedEllipticL 1 =
    ((Real.sqrt E.conductor / π : ℝ) : ℂ) * E.ellipticL 1 := by
  sorry

/-- Test `WeierstrassCurve.completedEllipticL_zero`: continuation cancels the Gamma pole,
and the functional equation gives a nonzero value at zero. -/
example : E.completedEllipticL 0 = (E.rootNumber : ℂ) * E.completedEllipticL 2 ∧
    E.completedEllipticL 0 ≠ 0 := by
  sorry

/-- Test `WeierstrassCurve.rootNumber_ne_fricke` (non-example): for 37a1 the Fricke
eigenvalue of the newform is `+1` while the root number is `−1`. -/
example : e37a1.rootNumber ≠ 1 := by
  sorry

/-- BSD.0/analytic-rank. -/
def analyticRank : ℕ := analyticOrderNatAt E.ellipticL 1

/-- The leading coefficient `L*(E, 1) = L^{(r)}(E, 1) / r!`, a real number. -/
def leadingTerm : ℝ :=
  (iteratedDeriv E.analyticRank E.ellipticL 1 / (E.analyticRank.factorial : ℂ)).re

theorem analyticOrderAt_ellipticL_ne_top : analyticOrderAt E.ellipticL 1 ≠ ⊤ := by
  sorry

theorem analyticRank_eq_zero_iff : E.analyticRank = 0 ↔ E.ellipticL 1 ≠ 0 := by
  sorry

theorem analyticRank_eq_one_iff :
    E.analyticRank = 1 ↔ E.ellipticL 1 = 0 ∧ deriv E.ellipticL 1 ≠ 0 := by
  sorry

theorem leadingTerm_ne_zero : E.leadingTerm ≠ 0 := by
  sorry

theorem leadingTerm_of_analyticRank_eq_zero (h : E.analyticRank = 0) :
    (E.leadingTerm : ℂ) = E.ellipticL 1 := by
  sorry

theorem leadingTerm_of_analyticRank_eq_one (h : E.analyticRank = 1) :
    (E.leadingTerm : ℂ) = deriv E.ellipticL 1 := by
  sorry

theorem ellipticL_isBigO_leading :
    (fun s ↦ E.ellipticL s - E.leadingTerm * (s - 1) ^ E.analyticRank) =O[𝓝 1]
      (fun s ↦ (s - 1) ^ (E.analyticRank + 1)) := by
  sorry

theorem analyticRank_eq_of_isogenous (E' : WeierstrassCurve ℚ) [E'.IsElliptic]
    (φ : TauCeti.Isogeny E.toAffine E'.toAffine) :
    E.analyticRank = E'.analyticRank ∧ E.leadingTerm = E'.leadingTerm := by
  sorry

/-- Test `WeierstrassCurve.analyticRank_eq_zero_iff_test`. -/
example (h : E.analyticRank = 0) : E.ellipticL 1 ≠ 0 ∧ (E.leadingTerm : ℂ) = E.ellipticL 1 := by
  sorry

/-- Test `WeierstrassCurve.analyticRank_37a`. -/
example : e37a1.analyticRank = 1 := by
  sorry

/-- Test `WeierstrassCurve.analyticRank_eq_newform`: the order of any entire extension of the
newform's L-series at the centre `k/2 = 1`. -/
example (F : ℂ → ℂ) (hF : Differentiable ℂ F)
    (hFa : ∀ s : ℂ, 2 < s.re → F s = LSeries (fun n ↦ (E.LFunction n : ℂ)) s) :
    analyticOrderNatAt F 1 = E.analyticRank := by
  sorry

/-- Test `WeierstrassCurve.analyticRank_unitary_centre`. -/
example : analyticOrderNatAt (fun s ↦ E.ellipticL (s + 1 / 2)) (1 / 2) = E.analyticRank := by
  sorry

/-- Test `WeierstrassCurve.leadingTerm_not_halved` (non-example). -/
example (h : E.analyticRank = 1) (h' : deriv E.ellipticL 1 ≠ 0) :
    (E.leadingTerm : ℂ) ≠ deriv E.ellipticL 1 / 2 := by
  sorry

/-- BSD.0/root-number-parity (planet: Root-number parity). -/
theorem rootNumber_parity : ((-1 : ℤˣ) ^ E.analyticRank) = E.rootNumber := by
  sorry

end Analytic

/-! ## BSD.0 — quadratic twists and base change -/

section Twists

variable (E : WeierstrassCurve ℚ) [E.IsElliptic]
variable (K : Type*) [Field K] [NumberField K] [Algebra.IsQuadraticExtension ℚ K]
  [Algebra.IsSeparable ℚ K]

/-- BSD.0/finite-field-twist-trace, odd characteristic. -/
theorem trace_quadraticTwistOf_finite {F : Type*} [Field F] [Fintype F] [DecidableEq F]
    (hF : ringChar F ≠ 2) (W : WeierstrassCurve F) [W.IsElliptic] (d : F) (hd : d ≠ 0)
    [(W.quadraticTwistOf 0 (-d / 4)).IsElliptic] :
    ((Fintype.card F : ℤ) + 1 - Nat.card (W.quadraticTwistOf 0 (-d / 4)).toAffine.Point) =
      quadraticChar F d * ((Fintype.card F : ℤ) + 1 - Nat.card W.toAffine.Point) := by
  sorry

/-- BSD.0/twist-local-factors at an odd prime not dividing the discriminant
(planet: Twist Euler factors). -/
theorem LFunction_quadraticTwist_prime {ℓ : ℕ} (hℓ : ℓ.Prime) (hℓ2 : ℓ ≠ 2)
    (hℓD : ¬ (ℓ : ℤ) ∣ NumberField.discr K) :
    (E.quadraticTwist K).LFunction ℓ = jacobiSym (NumberField.discr K) ℓ * E.LFunction ℓ := by
  sorry

/-- BSD.0/twist-l-series for `(D_K, N) = 1`, at integers prime to `2 D_K`. -/
theorem LFunction_quadraticTwist_of_coprime (hN : IsCoprime (NumberField.discr K) E.conductor)
    {n : ℕ} (hn : IsCoprime (2 * NumberField.discr K) n) :
    (E.quadraticTwist K).LFunction n = jacobiSym (NumberField.discr K) n * E.LFunction n := by
  sorry

/-- BSD.0/twist-root-number, under the Heegner hypothesis for an imaginary quadratic field: the
twisted sign is `−w(E)`. -/
theorem rootNumber_quadraticTwist_of_heegner [NumberField.IsTotallyComplex K]
    (hN : IsCoprime (NumberField.discr K) E.conductor)
    (hsplit : ∀ ℓ ∈ E.conductor.primeFactors, ℓ ≠ 2 → jacobiSym (NumberField.discr K) ℓ = 1)
    (h2 : 2 ∣ E.conductor → NumberField.discr K % 8 = 1) :
    (E.quadraticTwist K).rootNumber = -E.rootNumber := by
  sorry

/-- BSD.0/base-change-factorization (planet: Base-change factorisation). -/
theorem LFunction_baseChange_quadratic :
    (E.baseChange K).LFunction = E.LFunction * (E.quadraticTwist K).LFunction := by
  sorry

/-- BSD.0/base-change-central-identities (a). -/
theorem deriv_baseChange_of_analyticRank_eq_one (h : E.analyticRank = 1)
    (hK : (E.quadraticTwist K).ellipticL 1 ≠ 0) :
    analyticOrderNatAt (fun s ↦ E.ellipticL s * (E.quadraticTwist K).ellipticL s) 1 = 1 ∧
      deriv (fun s ↦ E.ellipticL s * (E.quadraticTwist K).ellipticL s) 1 =
        deriv E.ellipticL 1 * (E.quadraticTwist K).ellipticL 1 := by
  sorry

/-- The congruent-number twist `E^(n) : y² = x³ − n²x` of `y² = x³ − x`. -/
def congruentNumberTwist (n : ℕ) : WeierstrassCurve ℚ := ⟨0, 0, 0, -((n : ℚ) ^ 2), 0⟩

instance (n : ℕ) [NeZero n] : (congruentNumberTwist n).IsElliptic := ⟨by sorry⟩

/-- BSD.0/congruent-number-root-numbers. -/
theorem rootNumber_congruentNumberTwist (n : ℕ) [NeZero n] (hn : Squarefree n) :
    (congruentNumberTwist n).rootNumber = 1 ↔ n % 8 = 1 ∨ n % 8 = 2 ∨ n % 8 = 3 := by
  sorry

end Twists

/-! ## BSD.1 — points over a quadratic field -/

section QuadraticPoints

variable (E : WeierstrassCurve ℚ) [E.IsElliptic]
variable (K : Type*) [Field K] [NumberField K] [DecidableEq K] [Algebra.IsQuadraticExtension ℚ K]
  [Algebra.IsSeparable ℚ K]

/-- BSD.1/quadratic-point-maps: restriction `E(ℚ) → E(K)`. -/
def Affine.Point.quadraticRes : (E⁄ℚ).toAffine.Point →+ (E⁄K).toAffine.Point :=
  Affine.Point.map (W' := E.toAffine) (Algebra.ofId ℚ K)

variable {K} in
/-- The action of an automorphism of `K` on `E(K)`. -/
def Affine.Point.quadraticConj (σ : K ≃ₐ[ℚ] K) : (E⁄K).toAffine.Point →+ (E⁄K).toAffine.Point :=
  Affine.Point.map (W' := E.toAffine) σ.toAlgHom

variable {K} in
/-- The trace `E(K) → E(ℚ)`, characterised by `res (tr P) = P + σ P` for the nontrivial `σ`. -/
def Affine.Point.quadraticTrace (σ : K ≃ₐ[ℚ] K) (hσ : σ ≠ 1) :
    (E⁄K).toAffine.Point →+ (E⁄ℚ).toAffine.Point := sorry

/-- The twist embedding `E^K(ℚ) → E(K)`. -/
def Affine.Point.twistEmbed :
    ((E.quadraticTwist K)⁄ℚ).toAffine.Point →+ (E⁄K).toAffine.Point :=
  (E.quadraticTwistPointEquiv K K).toAddMonoidHom.comp
    (Affine.Point.map (W' := (E.quadraticTwist K).toAffine) (Algebra.ofId ℚ K))

variable {K}

theorem Affine.Point.quadraticTrace_res (σ : K ≃ₐ[ℚ] K) (hσ : σ ≠ 1)
    (P : (E⁄ℚ).toAffine.Point) :
    Affine.Point.quadraticTrace E σ hσ (Affine.Point.quadraticRes E K P) = 2 • P := by
  sorry

theorem Affine.Point.res_quadraticTrace (σ : K ≃ₐ[ℚ] K) (hσ : σ ≠ 1)
    (P : (E⁄K).toAffine.Point) :
    Affine.Point.quadraticRes E K (Affine.Point.quadraticTrace E σ hσ P) =
      P + Affine.Point.quadraticConj E σ P := by
  sorry

theorem Affine.Point.range_quadraticRes (σ : K ≃ₐ[ℚ] K) (hσ : σ ≠ 1) :
    (Affine.Point.quadraticRes E K).range =
      AddMonoidHom.eqLocus (Affine.Point.quadraticConj E σ) (AddMonoidHom.id _) := by
  sorry

theorem Affine.Point.range_twistEmbed (σ : K ≃ₐ[ℚ] K) (hσ : σ ≠ 1) :
    (Affine.Point.twistEmbed E K).range =
      AddMonoidHom.eqLocus (Affine.Point.quadraticConj E σ) (-AddMonoidHom.id _) := by
  sorry

theorem Affine.Point.two_smul_mem_sup (P : (E⁄K).toAffine.Point) :
    2 • P ∈ (Affine.Point.quadraticRes E K).range ⊔ (Affine.Point.twistEmbed E K).range := by
  sorry

theorem Affine.Point.quadraticTrace_twistEmbed (σ : K ≃ₐ[ℚ] K) (hσ : σ ≠ 1)
    (Q : ((E.quadraticTwist K)⁄ℚ).toAffine.Point) :
    Affine.Point.quadraticTrace E σ hσ (Affine.Point.twistEmbed E K Q) = 0 := by
  sorry

/-- Test `WeierstrassCurve.Affine.Point.twistEmbed_anti`. -/
example (σ : K ≃ₐ[ℚ] K) (hσ : σ ≠ 1) (Q : ((E.quadraticTwist K)⁄ℚ).toAffine.Point) :
    Affine.Point.quadraticConj E σ (Affine.Point.twistEmbed E K Q) =
      -Affine.Point.twistEmbed E K Q := by
  sorry

/-- Test `WeierstrassCurve.Affine.Point.ker_res_add_twistEmbed`. -/
example (P : (E⁄ℚ).toAffine.Point) (Q : ((E.quadraticTwist K)⁄ℚ).toAffine.Point)
    (h : Affine.Point.quadraticRes E K P + Affine.Point.twistEmbed E K Q = 0) :
    2 • P = 0 ∧ 2 • Q = 0 := by
  sorry

/-- Test `WeierstrassCurve.Affine.Point.quadraticTrace_res_test`: for 37a1 and `P = (0, 0)`. -/
example (σ : K ≃ₐ[ℚ] K) (hσ : σ ≠ 1) (h : (e37a1⁄ℚ).toAffine.Nonsingular 0 0) :
    Affine.Point.quadraticTrace e37a1 σ hσ
        (Affine.Point.quadraticRes e37a1 K (.some 0 0 h)) = 2 • (.some 0 0 h) := by
  sorry

/-- Test `WeierstrassCurve.Affine.Point.quadraticTrace_not_surjective` (non-example): if
`E(K) = res E(ℚ) + torsion` for 37a1, the trace is not surjective. -/
example (σ : K ≃ₐ[ℚ] K) (hσ : σ ≠ 1)
    (h : ∀ P : (e37a1⁄K).toAffine.Point, ∃ Q t, P = Affine.Point.quadraticRes e37a1 K Q + t ∧
      addOrderOf t ≠ 0) :
    ¬ Function.Surjective (Affine.Point.quadraticTrace e37a1 σ hσ) := by
  sorry

/-- BSD.1/rank-splitting (planet: Rank splitting over K). -/
theorem finrank_point_quadratic :
    Module.finrank ℚ (ℚ ⊗[ℤ] (E⁄K).toAffine.Point) =
      Module.finrank ℚ (ℚ ⊗[ℤ] (E⁄ℚ).toAffine.Point) +
        Module.finrank ℚ (ℚ ⊗[ℤ] ((E.quadraticTwist K)⁄ℚ).toAffine.Point) := by
  sorry

/-- PLACEHOLDER for the covolume of the period lattice of the global minimal Néron
differential (GrossZagierAndArithmeticHeights GZ.0). Its geometric carrier/API is still missing. -/
def neronPeriodCovolume (E : WeierstrassCurve ℚ) : ℝ := sorry

/-- PLACEHOLDER for the norm of the Néron differential ideal over `𝓞_K` (NeronModels R11.6).
Its ideal and base-change API are still missing; this real number is not a formalisation. -/
def neronDifferentialIdealNorm (E : WeierstrassCurve ℚ) (K : Type*) [Field K] [NumberField K] : ℝ :=
  sorry

/-- BSD.1/quadratic-period: `Ω_{E/K} = N(𝔞_ω) · 2 ∫_{E(ℂ)} |ω ∧ ω̄|`, hence four times the
period-lattice covolume when the differential ideal has norm one. The imported geometric data
remain explicit placeholders, so this is only a partial prototype. -/
def quadraticPeriod (E : WeierstrassCurve ℚ) (K : Type*) [Field K] [NumberField K] : ℝ :=
  neronDifferentialIdealNorm E K * (4 * neronPeriodCovolume E)

theorem quadraticPeriod_eq_norm_mul_covolume :
    quadraticPeriod E K = neronDifferentialIdealNorm E K * (4 * neronPeriodCovolume E) := by
  sorry

theorem quadraticPeriod_pos [NumberField.IsTotallyComplex K] : 0 < quadraticPeriod E K := by
  sorry

/-- With `𝔞_ω = 𝓞_K`, the period is four times the covolume of the actual Néron period lattice.
Deriving norm one from coprimality needs the requested Néron base-change comparison. -/
theorem quadraticPeriod_eq_covolume [NumberField.IsTotallyComplex K]
    (hnorm : neronDifferentialIdealNorm E K = 1) :
    quadraticPeriod E K = 4 * neronPeriodCovolume E := by
  sorry

theorem realPeriod_mul_twist_eq [NumberField.IsTotallyComplex K]
    (h : IsCoprime (2 * NumberField.discr K) E.conductor) :
    ∃ e : ℤ, E.realPeriod * (E.quadraticTwist K).realPeriod *
      Real.sqrt |(NumberField.discr K : ℝ)| = (2 : ℝ) ^ e * quadraticPeriod E K := by
  sorry

theorem padicValRat_period_ratio [NumberField.IsTotallyComplex K] (p : ℕ) [Fact p.Prime]
    (hp : ¬ (p : ℤ) ∣ 2 * E.conductor * NumberField.discr K) :
    ∃ q : ℚ, E.realPeriod * (E.quadraticTwist K).realPeriod *
      Real.sqrt |(NumberField.discr K : ℝ)| / quadraticPeriod E K = q ∧ padicValRat p q = 0 := by
  sorry

theorem quadraticPeriod_of_isogenous [NumberField.IsTotallyComplex K] (E' : WeierstrassCurve ℚ)
    [E'.IsElliptic] (φ : TauCeti.Isogeny E.toAffine E'.toAffine)
    (p : ℕ) [Fact p.Prime] (hdeg : ¬ p ∣ φ.degree) :
    ∃ q : ℚ, quadraticPeriod E K / quadraticPeriod E' K = q ∧ padicValRat p q = 0 := by
  sorry

/-- Test `WeierstrassCurve.quadraticPeriod_pos_test`. -/
example [NumberField.IsTotallyComplex K] : 0 < quadraticPeriod E K := by
  sorry

/-- Test `WeierstrassCurve.period_ratio_rational`. -/
example [NumberField.IsTotallyComplex K] (h : IsCoprime (2 * NumberField.discr K) E.conductor) :
    ∃ q : ℚ, E.realPeriod * (E.quadraticTwist K).realPeriod *
      Real.sqrt |(NumberField.discr K : ℝ)| / quadraticPeriod E K = q := by
  sorry

/-- Test `WeierstrassCurve.quadraticPeriod_not_half_covolume` (non-example): this detects
the missing outer factor two in `2 ∫ |ω ∧ ω̄|`. It makes no transcendence claim about periods. -/
example [NumberField.IsTotallyComplex K] (hnorm : neronDifferentialIdealNorm E K = 1)
    (hcovol : 0 < neronPeriodCovolume E) : quadraticPeriod E K ≠ 2 * neronPeriodCovolume E := by
  sorry

end QuadraticPoints

/-! ## BSD.3–BSD.4 — rank and finiteness

`Ш(E/ℚ)` is not in the libraries; finiteness of `Ш` is stated in the roadmap document and in
the packet (BSD.3/analytic-rank-one-theorem, BSD.4/analytic-rank-zero-theorem). The rank part is
expressible now. -/

section Rank

variable (E : WeierstrassCurve ℚ) [E.IsElliptic]

/-- BSD.4/analytic-rank-at-most-one-theorem, rank part (planet: Analytic rank at most one
theorem); BSD.3 is the case `analyticRank E = 1` and BSD.4 the case `0`. -/
theorem finrank_eq_analyticRank (h : E.analyticRank ≤ 1) :
    Module.finrank ℚ (ℚ ⊗[ℤ] (E⁄ℚ).toAffine.Point) = E.analyticRank := by
  sorry

end Rank

/-! ## BSD.5 — the rational BSD defect -/

section Defect

variable (E : WeierstrassCurve ℚ) [E.IsElliptic]

/-- BSD.5/rank-zero-rationality. -/
theorem ellipticL_one_div_realPeriod_rat : ∃ q : ℚ, (E.ellipticL 1).re / E.realPeriod = q := by
  sorry

/-- BSD.5/leading-term-positivity. -/
theorem leadingTerm_pos (h : E.analyticRank ≤ 1) : 0 < E.leadingTerm := by
  sorry

/-- BSD.5/rank-one-rationality. -/
theorem leadingTerm_div_period_regulator_rat (h : E.analyticRank = 1) :
    ∃ q : ℚ, 0 < q ∧ E.leadingTerm / (E.realPeriod * E.bsdRegulator) = q := by
  sorry

/-- BSD.5/rational-bsd-defect (planet: Rational BSD defect). -/
def bsdDefect : ℚ :=
  Classical.choose (leadingTerm_div_period_regulator_rat_or_zero E) *
    (E.torsionCard ^ 2 : ℚ) / (E.shaCard * E.tamagawaProduct)
where
  /-- The rational number `L*(E,1) / (Ω_E Reg_BSD)` in analytic rank at most one. -/
  leadingTerm_div_period_regulator_rat_or_zero (E : WeierstrassCurve ℚ) [E.IsElliptic] :
      ∃ q : ℚ, E.analyticRank ≤ 1 → E.leadingTerm / (E.realPeriod * E.bsdRegulator) = q := by
    sorry

theorem bsdDefect_pos (h : E.analyticRank ≤ 1) : 0 < E.bsdDefect := by
  sorry

theorem leadingTerm_eq_bsdDefect_mul (h : E.analyticRank ≤ 1) :
    E.leadingTerm = E.bsdDefect * (E.realPeriod * E.bsdRegulator * E.shaCard *
      E.tamagawaProduct / E.torsionCard ^ 2) := by
  sorry

theorem bsdDefect_eq_one_iff (h : E.analyticRank ≤ 1) :
    E.bsdDefect = 1 ↔ E.leadingTerm = E.realPeriod * E.bsdRegulator * E.shaCard *
      E.tamagawaProduct / E.torsionCard ^ 2 := by
  sorry

theorem padicValRat_bsdDefect (h : E.analyticRank ≤ 1) (p : ℕ) [Fact p.Prime] (q : ℚ)
    (hq : E.leadingTerm / (E.realPeriod * E.bsdRegulator) = q) :
    padicValRat p E.bsdDefect = padicValRat p q + 2 * padicValRat p E.torsionCard -
      padicValRat p E.shaCard - padicValRat p E.tamagawaProduct := by
  sorry

theorem bsdDefect_eq_of_isogenous (E' : WeierstrassCurve ℚ) [E'.IsElliptic]
    (φ : TauCeti.Isogeny E.toAffine E'.toAffine) (hr : E.analyticRank ≤ 1) :
    E.bsdDefect = E'.bsdDefect := by
  sorry

/-- The defect formed with Tau Ceti's halved regulator differs by `2 ^ analyticRank`. -/
theorem bsdDefect_regulator_convention (h : E.analyticRank ≤ 1) (reg : ℝ)
    (hreg : E.bsdRegulator = 2 ^ E.analyticRank * reg) :
    E.leadingTerm / (E.realPeriod * reg) =
      2 ^ E.analyticRank * (E.leadingTerm / (E.realPeriod * E.bsdRegulator)) := by
  sorry

theorem bsdDefect_eq_one_of_forall_padicValRat (h : E.analyticRank ≤ 1)
    (hp : ∀ p : ℕ, p.Prime → padicValRat p E.bsdDefect = 0) : E.bsdDefect = 1 := by
  sorry

/-- Test `WeierstrassCurve.bsdDefect_11a1`. -/
example : e11a1.bsdDefect = 1 := by
  sorry

/-- Test `WeierstrassCurve.bsdDefect_rank_zero_regulator`. -/
example (h : E.analyticRank = 0) : E.bsdRegulator = 1 := by
  sorry

/-- Test `WeierstrassCurve.bsdDefect_tauCeti_regulator` (non-example): for 37a1 the quotient
with the halved regulator is `2`. -/
example (reg : ℝ) (hreg : e37a1.bsdRegulator = 2 * reg) :
    e37a1.leadingTerm / (e37a1.realPeriod * reg) ≠ 1 := by
  sorry

/-- Test `WeierstrassCurve.bsdDefect_11a_isogeny`. -/
example : e11a1.bsdDefect = e11a3.bsdDefect := by
  sorry

/-- BSD.5/p-part-from-two-bounds. -/
theorem padicValRat_bsdDefect_eq_zero_iff (h : E.analyticRank ≤ 1) (p : ℕ) [Fact p.Prime]
    (htors : ¬ p ∣ E.torsionCard) (q : ℚ)
    (hq : E.leadingTerm / (E.realPeriod * E.bsdRegulator) = q) :
    padicValRat p E.bsdDefect = 0 ↔
      padicValRat p E.shaCard = padicValRat p q - padicValRat p E.tamagawaProduct := by
  sorry

end Defect

/-! ## BSD.6 — named prime-part theorems

Each is the statement `padicValRat p (bsdDefect E) = 0` under the source's hypotheses. The
residual and local hypotheses (irreducibility of `E[p]`, reduction types, ramification of
`E[p]` at an auxiliary prime, `E(ℚ_p)[p] = 0`) involve objects not yet in the libraries and are
spelled out in the roadmap document; they are not replaced by `Prop` placeholders here. -/

end WeierstrassCurve

/-! ## BSD.2 and BSD.5 — local prescriptions and the Heegner index -/

namespace TauCeti.BSD

open scoped WeierstrassCurve

/-- The behaviour of a prime in a quadratic field. -/
inductive Splitting
  | split
  | inert
  | ramified
  deriving DecidableEq

/-- BSD.2/heegner-local-conditions (planet: Heegner hypothesis). -/
structure LocalPrescription where
  primes : Finset ℕ
  prime_valid : ∀ ℓ ∈ primes, Nat.Prime ℓ
  behaviour : ℕ → Splitting
  sign : ℤˣ

namespace LocalPrescription

/-- The Kronecker-symbol value a behaviour prescribes. -/
def Splitting.value : Splitting → ℤ
  | .split => 1
  | .inert => -1
  | .ramified => 0

/-- The Kronecker symbol `(D/2)`: `0` for even `D`, `1` for `D ≡ 1,7 (mod 8)`, `−1` otherwise. -/
def kroneckerAtTwo (D : ℤ) : ℤ :=
  if D % 2 = 0 then 0 else if D % 8 = 1 ∨ D % 8 = 7 then 1 else -1

/-- The Kronecker symbol `(D/ℓ)` at a prime `ℓ` (CA.1's `kroneckerCharacter` at primes). -/
def kroneckerAtPrime (D : ℤ) (ℓ : ℕ) : ℤ := if ℓ = 2 then kroneckerAtTwo D else jacobiSym D ℓ

/-- Admissibility of a fundamental discriminant for a local prescription. -/
def Admissible (π : LocalPrescription) (D : ℤ) : Prop :=
  D.IsFundamentalDiscr ∧ D ≠ 1 ∧ (π.sign : ℤ) * D > 0 ∧
    ∀ ℓ ∈ π.primes, kroneckerAtPrime D ℓ = Splitting.value (π.behaviour ℓ)

/-- The Heegner prescription for a level `N`: every prime of `N` splits, negative sign. -/
def heegner (N : ℕ) : LocalPrescription where
  primes := N.primeFactors
  prime_valid := by sorry
  behaviour := fun _ ↦ .split
  sign := -1

/-- The generalized Heegner prescription for `N = N⁺ N⁻`. -/
def generalizedHeegner (Nplus Nminus : ℕ) : LocalPrescription :=
  { primes := Nplus.primeFactors ∪ Nminus.primeFactors
    prime_valid := by sorry
    behaviour := fun ℓ ↦ if ℓ ∈ Nminus.primeFactors then .inert else .split
    sign := -1 }

instance admissible_decidable (π : LocalPrescription) (D : ℤ) : Decidable (π.Admissible D) := by
  classical exact Classical.dec _

theorem infinite_admissible (π : LocalPrescription)
    (h : ∀ ℓ ∈ π.primes, π.behaviour ℓ ≠ .ramified) : {D : ℤ | π.Admissible D}.Infinite := by
  sorry

theorem mono (π π' : LocalPrescription) (h : π.primes ⊆ π'.primes)
    (hb : ∀ ℓ ∈ π.primes, π.behaviour ℓ = π'.behaviour ℓ) (hs : π.sign = π'.sign) (D : ℤ) :
    π'.Admissible D → π.Admissible D := by
  sorry

/-- Behaviour outside the prescribed prime set does not affect admissibility. -/
theorem admissible_congr (π π' : LocalPrescription) (hprimes : π.primes = π'.primes)
    (hb : ∀ ℓ ∈ π.primes, π.behaviour ℓ = π'.behaviour ℓ) (hs : π.sign = π'.sign) (D : ℤ) :
    π.Admissible D ↔ π'.Admissible D := by
  sorry

theorem rootNumber_twist_of_admissible (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (K : Type*) [Field K] [NumberField K] [Algebra.IsQuadraticExtension ℚ K]
    [Algebra.IsSeparable ℚ K] (π : LocalPrescription)
    (hN : IsCoprime (NumberField.discr K) E.conductor)
    (hprimes : E.conductor.primeFactors ⊆ π.primes)
    (hK : π.Admissible (NumberField.discr K)) :
    ((E.quadraticTwist K).rootNumber : ℤ) =
      ((π.sign : ℤ) * ∏ ℓ ∈ E.conductor.primeFactors,
        Splitting.value (π.behaviour ℓ) ^ padicValNat ℓ E.conductor) * (E.rootNumber : ℤ) := by
  sorry

/-- Test `TauCeti.BSD.LocalPrescription.heegner_sign`. -/
example (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (K : Type*) [Field K] [NumberField K] [Algebra.IsQuadraticExtension ℚ K]
    [Algebra.IsSeparable ℚ K] [NumberField.IsTotallyComplex K]
    (hN : IsCoprime (NumberField.discr K) E.conductor)
    (hK : (heegner E.conductor).Admissible (NumberField.discr K)) :
    (E.quadraticTwist K).rootNumber = -E.rootNumber := by
  sorry

/-- Test `TauCeti.BSD.LocalPrescription.heegner_11_neg7`. -/
example : (heegner 11).Admissible (-7) := by
  sorry

/-- Test `TauCeti.BSD.LocalPrescription.heegner_11_neg3` (non-example). -/
example : ¬ (heegner 11).Admissible (-3) := by
  sorry

/-- Test `TauCeti.BSD.LocalPrescription.empty`. -/
example (D : ℤ) (hD : D.IsFundamentalDiscr) (hneg : D < 0) :
    ({ primes := ∅, prime_valid := by simp, behaviour := fun _ ↦ .split, sign := -1 } :
      LocalPrescription).Admissible D := by
  sorry

end LocalPrescription

section HeegnerIndex

variable {K : Type*} [Field K] [NumberField K] [DecidableEq K]
variable (E : WeierstrassCurve ℚ) [E.IsElliptic]

/-- BSD.5/heegner-index (planet: Heegner index), for a point `y` of `E(K)` (the Heegner point
`y_K` of HeegnerPointEulerSystems HE.1, supplied as data) generating a finite-index subgroup. -/
def heegnerIndex (y : (E⁄K).toAffine.Point) : ℕ :=
  (AddSubgroup.zmultiples y).index

/-- The index of `ȳ` in the free quotient. -/
def heegnerIndexFree (y : (E⁄K).toAffine.Point) : ℕ :=
  (AddSubgroup.zmultiples (QuotientAddGroup.mk (s := AddCommGroup.torsion _) y)).index

theorem heegnerIndex_eq_free_mul_torsion (y : (E⁄K).toAffine.Point) (hy : addOrderOf y = 0)
    (hfin : (AddSubgroup.zmultiples y).FiniteIndex) :
    heegnerIndex E y = heegnerIndexFree E y * Nat.card (AddCommGroup.torsion (E⁄K).toAffine.Point) := by
  sorry

theorem heegnerIndex_pos (y : (E⁄K).toAffine.Point)
    (hfin : (AddSubgroup.zmultiples y).FiniteIndex) : 0 < heegnerIndex E y := by
  sorry

/-- Scaling the parametrisation by `m` scales the Heegner point and the Manin constant `c` by `m`,
leaving `I_K / c` unchanged. -/
theorem heegnerIndex_div_maninConstant_invariant (y : (E⁄K).toAffine.Point) (hy : addOrderOf y = 0)
    (hfin : (AddSubgroup.zmultiples y).FiniteIndex) (c m : ℕ) (hm : 0 < m) :
    (heegnerIndex E (m • y) : ℚ) / (m * c) = heegnerIndex E y / c := by
  sorry

theorem torsion_dvd_heegnerIndex (y : (E⁄K).toAffine.Point) (hy : addOrderOf y = 0)
    (hfin : (AddSubgroup.zmultiples y).FiniteIndex) :
    E.torsionCard ∣ heegnerIndex E y := by
  sorry

theorem not_dvd_heegnerIndex_of_large (y : (E⁄K).toAffine.Point) (hy : addOrderOf y = 0)
    (hfin : (AddSubgroup.zmultiples y).FiniteIndex) :
    {p : ℕ | p.Prime ∧ p ∣ heegnerIndex E y}.Finite := by
  sorry

/-- Test `TauCeti.BSD.heegnerIndex_torsion_factor`. -/
example (y : (E⁄K).toAffine.Point) (hy : addOrderOf y = 0)
    (hfin : (AddSubgroup.zmultiples y).FiniteIndex) :
    heegnerIndex E y = heegnerIndexFree E y * Nat.card (AddCommGroup.torsion (E⁄K).toAffine.Point) := by
  sorry

/-- Test `TauCeti.BSD.heegnerIndex_scale` (non-example): doubling the point doubles the index. -/
example (y : (E⁄K).toAffine.Point) (hy : addOrderOf y = 0)
    (hfin : (AddSubgroup.zmultiples y).FiniteIndex) :
    heegnerIndex E (2 • y) = 2 * heegnerIndex E y ∧
      heegnerIndexFree E (2 • y) = 2 * heegnerIndexFree E y := by
  sorry

/-- Test `TauCeti.BSD.heegnerIndex_11a`: for `J₀(11)` (11a1, torsion `ℤ/5`), `5 ∣ I_K`. -/
example (y : (WeierstrassCurve.e11a1⁄K).toAffine.Point) (hy : addOrderOf y = 0)
    (hfin : (AddSubgroup.zmultiples y).FiniteIndex) :
    5 ∣ heegnerIndex WeierstrassCurve.e11a1 y := by
  sorry

/-- Test `TauCeti.BSD.heegnerIndexFree_one_of_generator`. -/
example (y : (E⁄K).toAffine.Point) (hy : addOrderOf y = 0)
    (hgen : heegnerIndexFree E y = 1) (hfin : (AddSubgroup.zmultiples y).FiniteIndex) :
    heegnerIndex E y = Nat.card (AddCommGroup.torsion (E⁄K).toAffine.Point) := by
  sorry

end HeegnerIndex

/-! ## BSD.6a — the supersingular BSTW two-variable zeta element (unresolved prototype)

The carrier of `Z^•(E/L)` — the two-variable Iwasawa cohomology `H¹_{rel,∘}(𝓞_L[1/p], T(1) ⊗̂ Λ_L)`
with signed local conditions (SelmerIwasawaCohomology L3, PadicHodgeRegulators L4) — is not in
the pinned libraries, and an abstract stand-in would make the reciprocity statements false for
arbitrary data. The planned declarations are therefore recorded here by name only, with their
statements in the corrected packet (BSD.6a/bstw-two-variable-zeta-element). BSTW Theorem1.14
uses `Col_v` and `Log_v̄`, with different primes. Ordinary zeta elements are imported from the
Kato supplier, and the CM-family input belongs to PadicFamilies L4.
The six API names and four tests below are comments, not Lean declarations or examples.
PROTOCOL §13 remains unmet for this construction; the review marks BSD.6a partial:

* `TauCeti.BSD.bstwZetaElement`, `TauCeti.BSD.bstwZetaElement_ne_zero`,
  `TauCeti.BSD.bstwZetaElement_col`, `TauCeti.BSD.bstwZetaElement_log`,
  `TauCeti.BSD.bstwZetaElement_cyclotomic`, `TauCeti.BSD.bstwZetaElement_twist`;
* tests `TauCeti.BSD.bstwZetaElement_ne_zero_test`, `TauCeti.BSD.bstwZetaElement_cyclotomic_test`,
  `TauCeti.BSD.bstwZetaElement_requires_split`, `TauCeti.BSD.bstwZetaElement_reciprocity_square`.
-/

end TauCeti.BSD

end

namespace Rat

/-- The canonical finite prime support, with the library's empty zero convention. -/
def primeSupport (q : ℚ) : Finset ℕ :=
  q.num.natAbs.primeFactors ∪ q.den.primeFactors

-- RankZeroOneBSD:BSD.8/support-membership; Rat.mem_primeSupport.
theorem mem_primeSupport {q : ℚ} (hq : q ≠ 0) (p : ℕ) :
    p ∈ primeSupport q ↔ p.Prime ∧ (p ∣ q.num.natAbs ∨ p ∣ q.den) := by
  sorry

-- Rat.primeSupport_zero
@[simp] theorem primeSupport_zero : primeSupport 0 = ∅ := by sorry
-- Rat.primeSupport_one
@[simp] theorem primeSupport_one : primeSupport 1 = ∅ := by sorry
-- Rat.primeSupport_neg
@[simp] theorem primeSupport_neg (q : ℚ) : primeSupport (-q) = primeSupport q := by sorry
-- Rat.primeSupport_inv
@[simp] theorem primeSupport_inv (q : ℚ) : primeSupport q⁻¹ = primeSupport q := by sorry
-- Rat.primeSupport_mul_subset
theorem primeSupport_mul_subset (q r : ℚ) :
    primeSupport (q * r) ⊆ primeSupport q ∪ primeSupport r := by sorry

-- Rat.primeSupport_test_six_thirtyfive
example : primeSupport (6 / 35 : ℚ) = {2, 3, 5, 7} := by sorry
-- Rat.primeSupport_test_zero
example : primeSupport (0 : ℚ) = ∅ ∧ (0 : ℚ) ≠ 1 := by sorry
-- Rat.primeSupport_test_cancellation
example : primeSupport ((2 : ℚ) * (1 / 2)) = ∅ ∧
    primeSupport (2 : ℚ) ∪ primeSupport (1 / 2 : ℚ) = {2} := by sorry
-- Rat.primeSupport_test_negative
example : primeSupport (-6 / 35 : ℚ) = primeSupport (6 / 35 : ℚ) := by sorry

-- RankZeroOneBSD:BSD.8/zero-numerator-denominator
theorem zero_num_den_of_padicValRat_eq_zero {p : ℕ} (hp : p.Prime)
    (q : ℚ) (h : padicValRat p q = 0) :
    padicValNat p q.num.natAbs = 0 ∧ padicValNat p q.den = 0 := by sorry

-- RankZeroOneBSD:BSD.8/zero-iff-outside-support
theorem padicValRat_eq_zero_iff_not_mem_primeSupport {q : ℚ} (hq : q ≠ 0)
    {p : ℕ} (hp : p.Prime) :
    padicValRat p q = 0 ↔ p ∉ primeSupport q := by sorry

-- RankZeroOneBSD:BSD.8/empty-support-units
theorem primeSupport_eq_empty_iff {q : ℚ} (hq : q ≠ 0) :
    primeSupport q = ∅ ↔ q = 1 ∨ q = -1 := by sorry

-- RankZeroOneBSD:BSD.8/positive-rational-reconstruction
theorem eq_one_iff_all_prime_padicValRat_eq_zero {q : ℚ} (hq : 0 < q) :
    q = 1 ↔ ∀ p : ℕ, p.Prime → padicValRat p q = 0 := by sorry

/-- A finite support cover together with proofs at every listed prime.
This structure deliberately does not assert positivity or the output q = 1. -/
structure PrimeValuationCertificate (q : ℚ) where
  -- Rat.PrimeValuationCertificate.primes
  primes : Finset ℕ
  -- Rat.PrimeValuationCertificate.prime_mem
  prime_mem : ∀ p ∈ primes, p.Prime
  -- Rat.PrimeValuationCertificate.covers
  covers : primeSupport q ⊆ primes
  -- Rat.PrimeValuationCertificate.localZero
  localZero : ∀ p ∈ primes, padicValRat p q = 0

namespace PrimeValuationCertificate

-- Rat.PrimeValuationCertificate.ext
@[ext] theorem ext {q : ℚ} (c d : PrimeValuationCertificate q)
    (h : c.primes = d.primes) : c = d := by sorry

-- RankZeroOneBSD:BSD.8/certificate-from-all-primes
-- Rat.PrimeValuationCertificate.ofAllPrimes
def ofAllPrimes (q : ℚ) (h : ∀ p : ℕ, p.Prime → padicValRat p q = 0) :
    PrimeValuationCertificate q := by sorry

-- Rat.PrimeValuationCertificate.ofAllPrimes_primes
@[simp] theorem ofAllPrimes_primes (q : ℚ)
    (h : ∀ p : ℕ, p.Prime → padicValRat p q = 0) :
    (ofAllPrimes q h).primes = primeSupport q := by sorry

-- Rat.PrimeValuationCertificate.ofAllPrimes_proof_independent
theorem ofAllPrimes_proof_independent (q : ℚ)
    (h h' : ∀ p : ℕ, p.Prime → padicValRat p q = 0) :
    ofAllPrimes q h = ofAllPrimes q h' := by sorry

-- RankZeroOneBSD:BSD.8/certificate-all-primes
-- Rat.PrimeValuationCertificate.zeroValuation
theorem zeroValuation {q : ℚ} (c : PrimeValuationCertificate q)
    (p : ℕ) (hp : p.Prime) : padicValRat p q = 0 := by sorry

-- RankZeroOneBSD:BSD.8/certificate-reconstruction
-- Rat.PrimeValuationCertificate.eq_one
theorem eq_one {q : ℚ} (c : PrimeValuationCertificate q) (hq : 0 < q) : q = 1 := by sorry

-- RankZeroOneBSD:BSD.8/certificate-from-exceptions
-- Rat.PrimeValuationCertificate.ofExceptionSet
def ofExceptionSet (q : ℚ) (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime)
    (hin : ∀ p ∈ S, padicValRat p q = 0)
    (hout : ∀ p : ℕ, p.Prime → p ∉ S → padicValRat p q = 0) :
    PrimeValuationCertificate q := by sorry

-- Rat.PrimeValuationCertificate.ofExceptionSet_primes
@[simp] theorem ofExceptionSet_primes (q : ℚ) (S : Finset ℕ)
    (hS : ∀ p ∈ S, p.Prime) (hin : ∀ p ∈ S, padicValRat p q = 0)
    (hout : ∀ p : ℕ, p.Prime → p ∉ S → padicValRat p q = 0) :
    (ofExceptionSet q S hS hin hout).primes = S := by sorry

-- Rat.PrimeValuationCertificate.ofExceptionSet_proof_independent
theorem ofExceptionSet_proof_independent (q : ℚ) (S : Finset ℕ)
    (hS hS' : ∀ p ∈ S, p.Prime)
    (hin hin' : ∀ p ∈ S, padicValRat p q = 0)
    (hout hout' : ∀ p : ℕ, p.Prime → p ∉ S → padicValRat p q = 0) :
    ofExceptionSet q S hS hin hout = ofExceptionSet q S hS' hin' hout' := by sorry

-- Rat.PrimeValuationCertificate.test_one
example : ∃ c : PrimeValuationCertificate (1 : ℚ), c.primes = ∅ := by sorry
-- Rat.PrimeValuationCertificate.test_zero
example : (∃ c : PrimeValuationCertificate (0 : ℚ), c.primes = ∅) ∧
    ¬(0 < (0 : ℚ)) := by sorry
-- Rat.PrimeValuationCertificate.test_negative_one
example : Nonempty (PrimeValuationCertificate (-1 : ℚ)) ∧ (-1 : ℚ) ≠ 1 := by sorry
-- Rat.PrimeValuationCertificate.test_two
example : ¬ Nonempty (PrimeValuationCertificate (2 : ℚ)) := by sorry
-- Rat.PrimeValuationCertificate.test_quarter
example : ¬ Nonempty (PrimeValuationCertificate (1 / 4 : ℚ)) := by sorry

-- Rat.PrimeValuationCertificate.ofAllPrimes_test_one
example (h : ∀ p : ℕ, p.Prime → padicValRat p (1 : ℚ) = 0) :
    (ofAllPrimes 1 h).primes = ∅ := by sorry
-- Rat.PrimeValuationCertificate.ofAllPrimes_test_zero
example (h : ∀ p : ℕ, p.Prime → padicValRat p (0 : ℚ) = 0) :
    (ofAllPrimes 0 h).primes = ∅ := by sorry
-- Rat.PrimeValuationCertificate.ofAllPrimes_test_negative_one
example (h : ∀ p : ℕ, p.Prime → padicValRat p (-1 : ℚ) = 0) :
    (ofAllPrimes (-1) h).primes = ∅ := by sorry

-- Rat.PrimeValuationCertificate.ofExceptionSet_test_empty
example (hS : ∀ p ∈ (∅ : Finset ℕ), p.Prime)
    (hin : ∀ p ∈ (∅ : Finset ℕ), padicValRat p (1 : ℚ) = 0)
    (hout : ∀ p : ℕ, p.Prime → p ∉ (∅ : Finset ℕ) → padicValRat p (1 : ℚ) = 0) :
    (ofExceptionSet 1 ∅ hS hin hout).primes = ∅ := by sorry
-- Rat.PrimeValuationCertificate.ofExceptionSet_test_enlarged
example (hS : ∀ p ∈ ({2, 3} : Finset ℕ), p.Prime)
    (hin : ∀ p ∈ ({2, 3} : Finset ℕ), padicValRat p (1 : ℚ) = 0)
    (hout : ∀ p : ℕ, p.Prime → p ∉ ({2, 3} : Finset ℕ) → padicValRat p (1 : ℚ) = 0) :
    (ofExceptionSet 1 {2, 3} hS hin hout).primes = {2, 3} := by sorry
-- Rat.PrimeValuationCertificate.ofExceptionSet_test_negative_one
example (hS : ∀ p ∈ ({2} : Finset ℕ), p.Prime)
    (hin : ∀ p ∈ ({2} : Finset ℕ), padicValRat p (-1 : ℚ) = 0)
    (hout : ∀ p : ℕ, p.Prime → p ∉ ({2} : Finset ℕ) → padicValRat p (-1 : ℚ) = 0) :
    (ofExceptionSet (-1) {2} hS hin hout).primes = {2} ∧ (-1 : ℚ) ≠ 1 := by sorry

end PrimeValuationCertificate

-- RankZeroOneBSD:BSD.8/real-identity
theorem real_eq_of_primeValuationCertificate {q : ℚ} (hq : 0 < q)
    (c : PrimeValuationCertificate q) {A B : ℝ} (hB : B ≠ 0)
    (hident : (q : ℝ) = A / B) : A = B := by sorry

-- RankZeroOneBSD:BSD.9/away-from-prime
theorem padicValRat_of_distinct_primes {p ell : ℕ}
    (hp : p.Prime) (hell : ell.Prime) (hne : p ≠ ell) :
    padicValRat ell (p : ℚ) = 0 := by sorry

-- RankZeroOneBSD:BSD.9/prime-obstruction
theorem no_primeValuationCertificate_prime {p : ℕ} (hp : p.Prime) :
    ¬ Nonempty (PrimeValuationCertificate (p : ℚ)) := by sorry

-- RankZeroOneBSD:BSD.9/dyadic-gate
theorem eq_one_iff_padicValRat_two_eq_zero {q : ℚ} (hq : 0 < q)
    (hodd : ∀ p : ℕ, p.Prime → Odd p → padicValRat p q = 0) :
    q = 1 ↔ padicValRat 2 q = 0 := by sorry

-- The two counterexamples to omitting positivity.
example : (∀ p : ℕ, padicValRat p (0 : ℚ) = 0) ∧ (0 : ℚ) ≠ 1 := by sorry
example : (∀ p : ℕ, padicValRat p (-1 : ℚ) = 0) ∧ (-1 : ℚ) ≠ 1 := by sorry
-- An omitted dyadic prime can hide either a numerator or a denominator.
example : (∀ p : ℕ, p.Prime → Odd p → padicValRat p (2 : ℚ) = 0) ∧
    padicValRat 2 (2 : ℚ) = 1 ∧ ¬ Nonempty (PrimeValuationCertificate (2 : ℚ)) := by sorry
example : (∀ p : ℕ, p.Prime → Odd p → padicValRat p (1 / 4 : ℚ) = 0) ∧
    padicValRat 2 (1 / 4 : ℚ) = -2 ∧ ¬ Nonempty (PrimeValuationCertificate (1 / 4 : ℚ)) := by sorry

end Rat

-- RankZeroOneBSD:BSD.8/torsion-square-valuation
namespace Rat
theorem padicValRat_torsion_square {p : ℕ} [Fact p.Prime]
    {q a t : ℚ} (hq : q ≠ 0) (ha : a ≠ 0) (ht : t ≠ 0) :
    padicValRat p (q * t ^ 2 / a) =
      padicValRat p q + 2 * padicValRat p t - padicValRat p a := by sorry

example : padicValRat 5 ((1 / 25 : ℚ) * 5 ^ 2) = 0 ∧
    padicValRat 5 (1 / 25 : ℚ) = -2 := by sorry
end Rat

namespace WeierstrassCurve.BSD
noncomputable section

-- These are actual Mathlib models, with fixed invariant differentials.
-- The arithmetic labels are descriptive and do not supply ranks or Sha orders.

-- RankZeroOneBSD:BSD.9/fixture-11
def fixture11 : WeierstrassCurve ℚ := WeierstrassCurve.e11a3

-- WeierstrassCurve.BSD.fixture11_coefficients
theorem fixture11_coefficients :
    fixture11.a₁ = 0 ∧ fixture11.a₂ = -1 ∧ fixture11.a₃ = 1 ∧ fixture11.a₄ = 0 ∧ fixture11.a₆ = 0 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-11-discriminant
-- WeierstrassCurve.BSD.fixture11_discriminant
@[simp] theorem fixture11_discriminant : fixture11.Δ = -11 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-11-elliptic
-- WeierstrassCurve.BSD.fixture11_elliptic
theorem fixture11_elliptic : fixture11.IsElliptic := by sorry
attribute [instance] fixture11_elliptic

-- WeierstrassCurve.BSD.fixture11_origin_nonsingular
theorem fixture11_origin_nonsingular : fixture11.toAffine.Nonsingular 0 0 := by sorry

-- WeierstrassCurve.BSD.fixture11_test_equation
example : fixture11.toAffine.Equation 0 0 := by sorry

-- WeierstrassCurve.BSD.fixture11_test_not_optimal_model
example : fixture11.a₄ = 0 ∧ fixture11.a₆ = 0 := by sorry

-- WeierstrassCurve.BSD.fixture11_test_real_components
example : fixture11.Δ < 0 := by sorry

-- RankZeroOneBSD:BSD.9/point-11
def point11 : fixture11.toAffine.Point :=
  WeierstrassCurve.Affine.Point.some 0 0 fixture11_origin_nonsingular

-- WeierstrassCurve.BSD.point11_coordinates
theorem point11_coordinates : point11 =
    WeierstrassCurve.Affine.Point.some 0 0 fixture11_origin_nonsingular := by sorry

-- WeierstrassCurve.BSD.point11_nonzero
theorem point11_nonzero : point11 ≠ 0 := by sorry

-- RankZeroOneBSD:BSD.9/point-11-order
-- WeierstrassCurve.BSD.point11_order
theorem point11_order : addOrderOf point11 = 5 := by sorry

-- WeierstrassCurve.BSD.point11_test_double
example : ∃ h : fixture11.toAffine.Nonsingular 1 (-1),
    (2 : ℕ) • point11 = WeierstrassCurve.Affine.Point.some 1 (-1) h := by sorry
-- WeierstrassCurve.BSD.point11_test_order_five
example : (5 : ℕ) • point11 = 0 ∧ point11 ≠ 0 := by sorry
-- WeierstrassCurve.BSD.point11_test_not_two_torsion
example : (2 : ℕ) • point11 ≠ 0 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-37
def fixture37 : WeierstrassCurve ℚ := WeierstrassCurve.e37a1

-- WeierstrassCurve.BSD.fixture37_coefficients
theorem fixture37_coefficients :
    fixture37.a₁ = 0 ∧ fixture37.a₂ = 0 ∧ fixture37.a₃ = 1 ∧ fixture37.a₄ = -1 ∧ fixture37.a₆ = 0 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-37-discriminant
-- WeierstrassCurve.BSD.fixture37_discriminant
@[simp] theorem fixture37_discriminant : fixture37.Δ = 37 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-37-elliptic
-- WeierstrassCurve.BSD.fixture37_elliptic
theorem fixture37_elliptic : fixture37.IsElliptic := by sorry
attribute [instance] fixture37_elliptic

-- WeierstrassCurve.BSD.fixture37_origin_nonsingular
theorem fixture37_origin_nonsingular : fixture37.toAffine.Nonsingular 0 0 := by sorry

-- WeierstrassCurve.BSD.fixture37_test_equation
example : fixture37.toAffine.Equation 0 0 := by sorry

-- WeierstrassCurve.BSD.fixture37_test_positive_discriminant
example : 0 < fixture37.Δ := by sorry

-- WeierstrassCurve.BSD.fixture37_test_distinct_from_11
example : fixture37.a₂ = 0 ∧ fixture37.Δ = 37 ∧ fixture37 ≠ fixture11 := by sorry

-- RankZeroOneBSD:BSD.9/point-37
def point37 : fixture37.toAffine.Point :=
  WeierstrassCurve.Affine.Point.some 0 0 fixture37_origin_nonsingular

-- WeierstrassCurve.BSD.point37_coordinates
theorem point37_coordinates : point37 =
    WeierstrassCurve.Affine.Point.some 0 0 fixture37_origin_nonsingular := by sorry

-- WeierstrassCurve.BSD.point37_nonzero
theorem point37_nonzero : point37 ≠ 0 := by sorry

-- RankZeroOneBSD:BSD.9/point-37-order
-- WeierstrassCurve.BSD.point37_order
theorem point37_order : addOrderOf point37 = 0 := by sorry

-- WeierstrassCurve.BSD.point37_test_double
example : ∃ h : fixture37.toAffine.Nonsingular 1 0,
    (2 : ℕ) • point37 = WeierstrassCurve.Affine.Point.some 1 0 h := by sorry
-- WeierstrassCurve.BSD.point37_test_infinite_order
example : ∃ h : fixture37.toAffine.Nonsingular (21 / 25) (-69 / 125),
    (8 : ℕ) • point37 = WeierstrassCurve.Affine.Point.some (21 / 25) (-69 / 125) h := by sorry
-- WeierstrassCurve.BSD.point37_test_not_torsion_generator
example : ∀ m : ℤ, m ≠ 0 → m • point37 ≠ 0 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-32
def fixture32 : WeierstrassCurve ℚ where
  a₁ := 0
  a₂ := 0
  a₃ := 0
  a₄ := -1
  a₆ := 0

-- WeierstrassCurve.BSD.fixture32_coefficients
theorem fixture32_coefficients :
    fixture32.a₁ = 0 ∧ fixture32.a₂ = 0 ∧ fixture32.a₃ = 0 ∧ fixture32.a₄ = -1 ∧ fixture32.a₆ = 0 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-32-discriminant
-- WeierstrassCurve.BSD.fixture32_discriminant
@[simp] theorem fixture32_discriminant : fixture32.Δ = 64 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-32-elliptic
-- WeierstrassCurve.BSD.fixture32_elliptic
theorem fixture32_elliptic : fixture32.IsElliptic := by sorry
attribute [instance] fixture32_elliptic

-- WeierstrassCurve.BSD.fixture32_origin_nonsingular
theorem fixture32_origin_nonsingular : fixture32.toAffine.Nonsingular 0 0 := by sorry

-- WeierstrassCurve.BSD.fixture32_j
@[simp] theorem fixture32_j : fixture32.j = 1728 := by sorry

-- WeierstrassCurve.BSD.fixture32_test_three_two_torsion_roots
example : fixture32.toAffine.Equation (-1) 0 ∧ fixture32.toAffine.Equation 0 0 ∧ fixture32.toAffine.Equation 1 0 := by sorry

-- WeierstrassCurve.BSD.fixture32_test_dyadic_discriminant
example : padicValRat 2 fixture32.Δ = 6 ∧ fixture32.c₄ = 48 := by sorry

-- WeierstrassCurve.BSD.fixture32_test_real_components
example : 0 < fixture32.Δ := by sorry

-- RankZeroOneBSD:BSD.9/point-32
def point32 : fixture32.toAffine.Point :=
  WeierstrassCurve.Affine.Point.some 0 0 fixture32_origin_nonsingular

-- WeierstrassCurve.BSD.point32_coordinates
theorem point32_coordinates : point32 =
    WeierstrassCurve.Affine.Point.some 0 0 fixture32_origin_nonsingular := by sorry

-- WeierstrassCurve.BSD.point32_nonzero
theorem point32_nonzero : point32 ≠ 0 := by sorry

-- RankZeroOneBSD:BSD.9/point-32-order
-- WeierstrassCurve.BSD.point32_order
theorem point32_order : addOrderOf point32 = 2 := by sorry

-- WeierstrassCurve.BSD.point32_test_double_zero
example : (2 : ℕ) • point32 = 0 := by sorry
-- WeierstrassCurve.BSD.point32_test_three_distinct_points
example : ∃ (hq : fixture32.toAffine.Nonsingular 1 0)
    (hr : fixture32.toAffine.Nonsingular (-1) 0),
    let Q : fixture32.toAffine.Point := WeierstrassCurve.Affine.Point.some 1 0 hq
    let R : fixture32.toAffine.Point := WeierstrassCurve.Affine.Point.some (-1) 0 hr
    Q ≠ 0 ∧ R ≠ 0 ∧ Q ≠ R ∧ Q ≠ point32 ∧ R ≠ point32 ∧
      (2 : ℕ) • Q = 0 ∧ (2 : ℕ) • R = 0 := by sorry
-- WeierstrassCurve.BSD.point32_test_sum_two_other_points
example : ∃ (hq : fixture32.toAffine.Nonsingular 1 0)
    (hr : fixture32.toAffine.Nonsingular (-1) 0),
    (WeierstrassCurve.Affine.Point.some 1 0 hq : fixture32.toAffine.Point) +
      WeierstrassCurve.Affine.Point.some (-1) 0 hr = point32 := by sorry

-- RankZeroOneBSD:BSD.9/fixture-11-good-five (finite-field portion).
example : ((Finset.univ : Finset (ZMod 5 × ZMod 5)).filter
    (fun xy => xy.2 ^ 2 + xy.2 = xy.1 ^ 3 - xy.1 ^ 2)).card = 4 := by sorry

end
end WeierstrassCurve.BSD

/-
Arithmetic signature omissions, tracked by node id.
RankZeroOneBSD:BSD.7a/ky-cyclotomic-proof-inputs — Keller–Yin cyclotomic input transfer.
These require actual provider APIs absent at the pinned baseline. This is an
inventory of omitted signatures, not declarations with invented arithmetic
hypotheses. In particular no main-conjecture condition is represented by an
arbitrary Prop and no Sha cardinality by a predicted natural number.
The fixture discriminant-sign examples above are the available portion of the
full real-component tests; cInfinity and source height/period comparisons require GZ.0 and its provider interfaces.
RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion — Ordinarity and local invariants at a good Eisenstein prime
RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization — Ordinary, Greenberg and unramified Eisenstein Selmer comparisons
RankZeroOneBSD:BSD.7a/finite-euler-factor-comparison — Primitive and imprimitive Euler factors
RankZeroOneBSD:BSD.7a/cgls-residual-character-comparison — CGLS residual extension and algebraic Iwasawa invariants
RankZeroOneBSD:BSD.7a/kriz-eisenstein-congruence — Kriz congruence and analytic Iwasawa invariants
RankZeroOneBSD:BSD.7a/cgls-equal-iwasawa-invariants — CGLS equality of anticyclotomic Iwasawa invariants
RankZeroOneBSD:BSD.7a/uniform-near-trivial-kolyvagin-bound — Uniform near-trivial Kolyvagin bound
RankZeroOneBSD:BSD.7a/augmentation-inclusive-heegner-divisibility — Heegner divisibility including augmentation
RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison — Heegner index and BDP ideal comparison
RankZeroOneBSD:BSD.7a/cgs-anticyclotomic-main-conjecture — CGS anticyclotomic Greenberg main conjecture
RankZeroOneBSD:BSD.7a/cgs-heegner-index-square-equality — CGS Heegner index-square equality
RankZeroOneBSD:BSD.7a/ky-local-character-corrections — Keller–Yin local character cohomology
RankZeroOneBSD:BSD.7a/ky-ribet-lattice — Keller–Yin nonsplit residual lattice
RankZeroOneBSD:BSD.7a/ky-trivial-character-main-conjecture — Keller–Yin trivial-character augmentation correction
RankZeroOneBSD:BSD.7a/ky-imprimitive-residual-comparison — Keller–Yin imprimitive residual Selmer comparison
RankZeroOneBSD:BSD.7a/ky-finite-euler-factor-comparison — Keller–Yin finite Euler comparison
RankZeroOneBSD:BSD.7a/ky-residual-extension-lambda — Keller–Yin residual extension and corrected lambda formula
RankZeroOneBSD:BSD.7a/ky-equal-iwasawa-invariants — Keller–Yin equality of analytic and algebraic invariants
RankZeroOneBSD:BSD.7a/ky-integral-kolyvagin-bound — Keller–Yin integral Kolyvagin divisibility and lattice transfer
RankZeroOneBSD:BSD.7a/ky-anticyclotomic-greenberg-equality — Keller–Yin anticyclotomic Greenberg main conjecture
RankZeroOneBSD:BSD.7a/ky-heegner-index-square-equality — Keller–Yin Heegner index-square equality
RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input — Distinguished Wüthrich lattice and integral Kato input adapter
RankZeroOneBSD:BSD.7a/integral-two-variable-functions — Integral Rankin functions and specialization normalization
RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity — Beilinson–Flach class and two integral reciprocity laws
EisensteinBF.class — omitted with its actual arithmetic provider interface.
EisensteinBF.ordinary_local — omitted with its actual arithmetic provider interface.
EisensteinBF.coleman_PR — omitted with its actual arithmetic provider interface.
EisensteinBF.coleman_Gr — omitted with its actual arithmetic provider interface.
EisensteinBF.twist_congruence — omitted with its actual arithmetic provider interface.
EisensteinBF.test_PR_projection — omitted with its actual arithmetic provider interface.
EisensteinBF.test_Gr_projection — omitted with its actual arithmetic provider interface.
EisensteinBF.test_zero_image — omitted with its actual arithmetic provider interface.
EisensteinBF.test_lattice_rescaling — omitted with its actual arithmetic provider interface.
RankZeroOneBSD:BSD.7a/bf-poitou-tate-divisibility-comparison — Beilinson–Flach divisibility comparison
RankZeroOneBSD:BSD.7a/nontrivial-twist-rational-bf-bound — Nontrivial-twist rational Beilinson–Flach bound
RankZeroOneBSD:BSD.7a/congruent-characteristic-series — Congruent twists and integral characteristic series
RankZeroOneBSD:BSD.7a/twisted-control-augmentation-comparison — Twisted control and augmentation comparison
RankZeroOneBSD:BSD.7a/integral-twisted-cyclotomic-equality — Integral twisted cyclotomic equality
RankZeroOneBSD:BSD.7a/cgs-cyclotomic-main-conjecture — CGS integral cyclotomic main conjecture
RankZeroOneBSD:BSD.7a/ky-cyclotomic-main-conjecture — Keller–Yin integral cyclotomic main conjecture
RankZeroOneBSD:BSD.7a/cgls-prototype-main-conjecture — CGLS anticyclotomic prototype
RankZeroOneBSD:BSD.7/cgls-torsion-free-control — CGLS rank-one anticyclotomic control
RankZeroOneBSD:BSD.7/ky-torsion-control — Keller–Yin control with rational torsion
RankZeroOneBSD:BSD.7/greenberg-vatsal-rank-zero-prototype — Greenberg–Vatsal rank-zero prototype
RankZeroOneBSD:BSD.7/cyclotomic-rank-zero-defect — Rank-zero defect from integral cyclotomic equality
RankZeroOneBSD:BSD.7/rank-one-twist-defect-comparison — Rank-one twist comparison with torsion
RankZeroOneBSD:BSD.7/cgls-rank-one-prototype — CGLS rank-one Eisenstein BSD prototype
RankZeroOneBSD:BSD.7/cgs-eisenstein-prime-bsd — CGS good Eisenstein prime-part BSD
RankZeroOneBSD:BSD.7/ky-eisenstein-prime-bsd — Keller–Yin good Eisenstein prime-part BSD
RankZeroOneBSD:BSD.8/selmer-cardinality-adapter — Finite Selmer cardinality and Sha torsion
RankZeroOneBSD:BSD.8/sha-annihilator-adapter — Certified Sha annihilator and finite descent
RankZeroOneBSD:BSD.8/mordell-weil-saturation-adapter — Certified free lattice and saturation index
RankZeroOneBSD:BSD.8/local-tamagawa-certificate-adapter — Local Tamagawa certificate adapter
RankZeroOneBSD:BSD.8/local-isogeny-certificate-adapter — Exact local isogeny comparison
RankZeroOneBSD:BSD.8/exceptional-prime-part-adapter — Exceptional-prime leading-term certificate adapter
RankZeroOneBSD:BSD.8/source-qualified-prime-part-dispatch — Source-qualified fixed-prime dispatch
RankZeroOneBSD:BSD.8/individual-full-bsd-from-exceptions — Individual full BSD from a finite exceptional set
RankZeroOneBSD:BSD.8/family-full-bsd-from-certificates — Full BSD for an explicitly certified family
RankZeroOneBSD:BSD.9/fixture-32-cm-additive — CM and additive dyadic fixture
RankZeroOneBSD:BSD.9/fixture-period-height-comparisons — Fixture periods, heights and regulator conventions
RankZeroOneBSD:BSD.9/mellin-central-tail-bounds — Central Mellin formulas with explicit tails
RankZeroOneBSD:BSD.9/analytic-fixture-enclosures — Certified central values for the three fixtures
RankZeroOneBSD:BSD.9/fixture-finite-arithmetic — Finite descent and saturation for the three fixtures
RankZeroOneBSD:BSD.9/fixture-11-isogeny-period — Five-isogeny and torsion-square comparison
RankZeroOneBSD:BSD.9/rank-equality-example — Rank equality comparison example
RankZeroOneBSD:BSD.9/whole-sha-finiteness-example — Whole Sha finiteness comparison example
RankZeroOneBSD:BSD.9/fixed-prime-example — Fixed prime BSD comparison example
RankZeroOneBSD:BSD.9/full-bsd-example — Full BSD certificate comparison examples
RankZeroOneBSD:BSD.9/missing-exception-fixture — Missing exceptional prime regression
RankZeroOneBSD:BSD.7a/ky-uniform-near-trivial-bound — Keller–Yin uniform near-trivial bound
RankZeroOneBSD:BSD.7a/bf-pr-reciprocity — EisensteinBF.coleman_PR
RankZeroOneBSD:BSD.7a/bf-greenberg-reciprocity — EisensteinBF.coleman_Gr
-/

namespace WeierstrassCurve

variable (E : WeierstrassCurve ℚ) [E.IsElliptic]

/-- BSD.8/elliptic-endpoint: positivity is supplied by BSD.5, not by the certificate. -/
theorem bsdDefect_eq_one_of_primeValuationCertificate (hr : E.analyticRank ≤ 1)
    (c : Rat.PrimeValuationCertificate E.bsdDefect) : E.bsdDefect = 1 := by
  sorry

/-- The full real leading term from a complete certificate for this curve's defect.
The real invariants remain the explicitly marked owner placeholders above. -/
theorem leadingTerm_eq_of_primeValuationCertificate (hr : E.analyticRank ≤ 1)
    (c : Rat.PrimeValuationCertificate E.bsdDefect) :
    E.leadingTerm = E.realPeriod * E.bsdRegulator * E.shaCard *
      E.tamagawaProduct / E.torsionCard ^ 2 := by
  sorry

end WeierstrassCurve
