import TauCeti.Analysis.Complex.Conformal.Moebius
import TauCeti.Analysis.Complex.UpperHalfPlane.PSLAction
import Mathlib.GroupTheory.Index
import TauCeti.Analysis.Complex.Conformal.Continuation.Basic
import TauCeti.Analysis.Complex.Conformal.RiemannMapping.Normalization
import Mathlib.Analysis.Asymptotics.Defs
import Mathlib.Topology.Covering.Basic
import Mathlib.FieldTheory.Minpoly.Basic
import Mathlib.RingTheory.Algebraic.Defs
import Mathlib.LinearAlgebra.Basis.Defs
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.Meromorphic.Order
import Mathlib.Analysis.Calculus.IteratedDeriv.Lemmas
import Mathlib.Analysis.Complex.ValueDistribution.CharacteristicFunction
import Mathlib.Analysis.Complex.ValueDistribution.LogCounting.Basic
import Mathlib.Analysis.Meromorphic.Divisor
import Mathlib.Analysis.SpecialFunctions.Gamma.Beta
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Analysis.SpecialFunctions.OrdinaryHypergeometric

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so that contributors and
reviewers converge on names and signatures. Admissions specify the work to do;
elaboration checks types, not the truth of the admitted mathematics.

Use native Mathlib and Tau Ceti carriers. The prose specifications at the end
identify geometric and germ interfaces whose precise signatures depend on the
cited supplier APIs. They contain no proposition-valued stand-ins.
The proved scalar-representative example distinguishes punctured meromorphic
germs from pointwise analytic functions.
-/

open scoped BigOperators Topology
open Complex Metric Set
set_option autoImplicit false
noncomputable section

namespace TauCeti

def schwarzian (f : ℂ → ℂ) (x : ℂ) : ℂ :=
  (2 * iteratedDeriv 3 f x * deriv f x - 3 * iteratedDeriv 2 f x ^ 2) /
    (2 * deriv f x ^ 2)

lemma schwarzian_affine (a b : ℂ) (ha : a ≠ 0) (x : ℂ) :
    schwarzian (fun z ↦ a * z + b) x = 0 := by sorry

lemma schwarzian_expanded {f : ℂ → ℂ} {x : ℂ}
    (hf : AnalyticAt ℂ f x) (hfd : deriv f x ≠ 0) :
    schwarzian f x = deriv (fun z ↦ deriv (deriv f) z / deriv f z) x -
      (1 / 2 : ℂ) * (deriv (deriv f) x / deriv f x) ^ 2 := by sorry

lemma schwarzian_comp_apply {f g : ℂ → ℂ} {x : ℂ}
    (hf : AnalyticAt ℂ f (g x)) (hg : AnalyticAt ℂ g x)
    (hfd : deriv f (g x) ≠ 0) (hgd : deriv g x ≠ 0) :
    schwarzian (f ∘ g) x = schwarzian f (g x) * deriv g x ^ 2 + schwarzian g x := by sorry

lemma schwarzian_moebius {f : ℂ → ℂ} {x a b c d : ℂ}
    (hf : AnalyticAt ℂ f x) (hfd : deriv f x ≠ 0)
    (hdet : a * d - b * c ≠ 0) (hden : c * f x + d ≠ 0) :
    schwarzian (fun z ↦ (a * f z + b) / (c * f z + d)) x = schwarzian f x := by sorry

-- TauCeti.schwarzian_affineZero
example (x : ℂ) : schwarzian (fun z ↦ 2 * z + 1) x = 0 := by sorry
-- TauCeti.schwarzian_square
example {x : ℂ} (hx : x ≠ 0) : schwarzian (fun z ↦ z ^ 2) x = -3 / (2 * x ^ 2) := by sorry
-- TauCeti.schwarzian_inverse
example {x : ℂ} (hx : x ≠ 0) : schwarzian (fun z ↦ 1 / z) x = 0 := by sorry

namespace ConformalPartII

def CayleyCoordinate (z : ℂ) : ℂ := I * (1 + z) / (1 - z)
namespace CayleyCoordinate
lemma apply (z : ℂ) : CayleyCoordinate z = I * (1 + z) / (1 - z) := by sorry
lemma inverse {z τ : ℂ} (hz : ‖z‖ < 1) (hτ : 0 < τ.im) :
    (CayleyCoordinate z - I) / (CayleyCoordinate z + I) = z ∧
      CayleyCoordinate ((τ - I) / (τ + I)) = τ := by sorry
lemma imaginaryPart {z : ℂ} (hz : ‖z‖ < 1) :
    (CayleyCoordinate z).im = (1 - ‖z‖ ^ 2) / ‖1 - z‖ ^ 2 ∧
      0 < (CayleyCoordinate z).im := by sorry
-- TauCeti.ConformalPartII.CayleyCoordinate.zero
example : CayleyCoordinate 0 = I := by sorry
-- TauCeti.ConformalPartII.CayleyCoordinate.half
example : CayleyCoordinate (1 / 2) = 3 * I := by sorry
-- TauCeti.ConformalPartII.CayleyCoordinate.boundaryOne
example : (1 - (1 : ℂ)) = 0 := by sorry
end CayleyCoordinate

def blaschkeFactor (a z : ℂ) : ℂ :=
  if ‖a‖ = 1 then -a else (z - a) / (1 - (starRingEnd ℂ) a * z)
namespace blaschkeFactor
lemma interior {a : ℂ} (ha : ‖a‖ < 1) (z : ℂ) :
    blaschkeFactor a z = (z - a) / (1 - (starRingEnd ℂ) a * z) := by sorry
lemma boundary {a : ℂ} (ha : ‖a‖ = 1) (z : ℂ) : blaschkeFactor a z = -a := by sorry
lemma normOnCircle {a z : ℂ} (ha : ‖a‖ ≤ 1) (hz : ‖z‖ = 1) :
    ‖blaschkeFactor a z‖ = 1 := by sorry
lemma discAutomorphism (a z : Complex.UnitDisc) :
    blaschkeFactor (a : ℂ) (z : ℂ) = (TauCeti.unitDiscMoebius a z : ℂ) := by sorry
-- TauCeti.ConformalPartII.blaschkeFactor.zero
example (z : ℂ) : blaschkeFactor 0 z = z := by sorry
-- TauCeti.ConformalPartII.blaschkeFactor.one
example (z : ℂ) : blaschkeFactor 1 z = -1 := by sorry
-- TauCeti.ConformalPartII.blaschkeFactor.minusOne
example (z : ℂ) : blaschkeFactor (-1) z = 1 := by sorry
end blaschkeFactor

def finiteBlaschke (k : ℕ) (a : Fin k → ℂ) (n : Fin k → ℕ) (z : ℂ) : ℂ :=
  ∏ i, blaschkeFactor (a i) z ^ n i
namespace finiteBlaschke
lemma empty (z : ℂ) : finiteBlaschke 0 (fun i ↦ Fin.elim0 i) (fun i ↦ Fin.elim0 i) z = 1 := by sorry
lemma mul (k l : ℕ) (a : Fin k → ℂ) (b : Fin l → ℂ)
    (n : Fin k → ℕ) (m : Fin l → ℕ) (z : ℂ) :
    finiteBlaschke (k + l) (Fin.addCases a b) (Fin.addCases n m) z =
      finiteBlaschke k a n z * finiteBlaschke l b m z := by sorry
lemma normOnCircle {k : ℕ} {a : Fin k → ℂ} (n : Fin k → ℕ) {z : ℂ}
    (ha : ∀ i, ‖a i‖ ≤ 1) (hz : ‖z‖ = 1) : ‖finiteBlaschke k a n z‖ = 1 := by sorry
lemma strictDisc {k : ℕ} {a : Fin k → ℂ} {n : Fin k → ℕ} {z : ℂ}
    (ha : ∀ i, ‖a i‖ ≤ 1) (hz : ‖z‖ < 1) :
    ((∃ i, ‖a i‖ < 1 ∧ 0 < n i) → ‖finiteBlaschke k a n z‖ < 1) ∧
      ((∀ i, ‖a i‖ = 1 ∨ n i = 0) → ‖finiteBlaschke k a n z‖ = 1) := by sorry
-- TauCeti.ConformalPartII.finiteBlaschke.emptyProduct
example (z : ℂ) : finiteBlaschke 0 (fun i ↦ Fin.elim0 i) (fun i ↦ Fin.elim0 i) z = 1 := by sorry
-- TauCeti.ConformalPartII.finiteBlaschke.doubleZero
example (z : ℂ) : finiteBlaschke 1 (fun _ ↦ 0) (fun _ ↦ 2) z = z ^ 2 := by sorry
-- TauCeti.ConformalPartII.finiteBlaschke.boundaryProduct
example (z : ℂ) : finiteBlaschke 1 (fun _ ↦ 1) (fun _ ↦ 1) z = -1 := by sorry
end finiteBlaschke

def inverseRatio (N : ℕ) (u : ℂ) : ℂ :=
  let aPlus : ℂ := ((N : ℂ) + 1) / (2 * N)
  let aMinus : ℂ := ((N : ℂ) - 1) / (2 * N)
  u * ordinaryHypergeometric aPlus aPlus (2 * aPlus) (u ^ N) /
    ordinaryHypergeometric aMinus aMinus (2 * aMinus) (u ^ N)
namespace inverseRatio
lemma formula (N : ℕ) (u : ℂ) :
    inverseRatio N u = u *
      ordinaryHypergeometric (((N : ℂ) + 1) / (2 * N)) (((N : ℂ) + 1) / (2 * N))
        (2 * (((N : ℂ) + 1) / (2 * N))) (u ^ N) /
      ordinaryHypergeometric (((N : ℂ) - 1) / (2 * N)) (((N : ℂ) - 1) / (2 * N))
        (2 * (((N : ℂ) - 1) / (2 * N))) (u ^ N) := by sorry
lemma mapZero (N : ℕ) (hN : 2 ≤ N) : inverseRatio N 0 = 0 := by sorry
lemma derivativeZero (N : ℕ) (hN : 2 ≤ N) : deriv (inverseRatio N) 0 = 1 := by sorry
lemma equivariant (N : ℕ) (hN : 2 ≤ N) (ζ u : ℂ) (hζ : ζ ^ N = 1) :
    inverseRatio N (ζ * u) = ζ * inverseRatio N u := by sorry
-- TauCeti.ConformalPartII.inverseRatio.zero
example : inverseRatio 2 0 = 0 := by sorry
-- TauCeti.ConformalPartII.inverseRatio.derivative
example : deriv (inverseRatio 2) 0 = 1 := by sorry
-- TauCeti.ConformalPartII.inverseRatio.firstCoefficient
example : iteratedDeriv 3 (inverseRatio 2) 0 = (3 / 2 : ℂ) := by sorry
end inverseRatio

def gammaRadius (N : ℕ) : ℝ :=
  (16 : ℝ) ^ (1 / (N : ℝ)) * Real.Gamma (1 + 1 / (2 * (N : ℝ))) ^ 2 *
    Real.Gamma (1 - 1 / (N : ℝ)) /
    (Real.Gamma (1 - 1 / (2 * (N : ℝ))) ^ 2 * Real.Gamma (1 + 1 / (N : ℝ)))
namespace gammaRadius
lemma formula (N : ℕ) : gammaRadius N =
    (16 : ℝ) ^ (1 / (N : ℝ)) * Real.Gamma (1 + 1 / (2 * (N : ℝ))) ^ 2 *
    Real.Gamma (1 - 1 / (N : ℝ)) /
    (Real.Gamma (1 - 1 / (2 * (N : ℝ))) ^ 2 * Real.Gamma (1 + 1 / (N : ℝ))) := by sorry
lemma positive (N : ℕ) (hN : 2 ≤ N) : 0 < gammaRadius N := by sorry
lemma alternative (N : ℕ) (hN : 2 ≤ N) : gammaRadius N =
    Real.Gamma (((N : ℝ) - 1) / (2 * (N : ℝ))) ^ 2 * Real.Gamma (1 + 1 / (N : ℝ)) /
    (Real.Gamma (((N : ℝ) + 1) / (2 * (N : ℝ))) ^ 2 * Real.Gamma (1 - 1 / (N : ℝ))) := by sorry
lemma tendsto : Filter.Tendsto gammaRadius Filter.atTop (nhds 1) := by sorry
-- TauCeti.ConformalPartII.gammaRadius.two
example : gammaRadius 2 = Real.Gamma (1 / 4) ^ 4 / (4 * Real.pi ^ 2) := by sorry
-- TauCeti.ConformalPartII.gammaRadius.three
example : gammaRadius 3 = Real.Gamma (1 / 6) ^ 3 / (12 * Real.pi ^ (3 / 2 : ℝ)) := by sorry
-- TauCeti.ConformalPartII.gammaRadius.oneOutsideHypothesis
example : gammaRadius 1 = 0 := by sorry
end gammaRadius

def discCounting (f : ℂ → ℂ) (r : ℝ) : ℝ :=
  let D : ℂ → ℝ := fun z ↦ ((max 0 (-MeromorphicOn.divisor f (closedBall 0 r) z) : ℤ) : ℝ)
  (∑ᶠ z, D z * Real.log (r * ‖z‖⁻¹)) + D 0 * Real.log r
namespace discCounting
lemma poleSum (f : ℂ → ℂ) (r : ℝ) : discCounting f r =
    (∑ᶠ z, ((max 0 (-MeromorphicOn.divisor f (closedBall 0 r) z) : ℤ) : ℝ) *
      Real.log (r * ‖z‖⁻¹)) +
      ((max 0 (-MeromorphicOn.divisor f (closedBall 0 r) 0) : ℤ) : ℝ) * Real.log r := by sorry
lemma globalComparison {f : ℂ → ℂ} (hf : Meromorphic f) {r : ℝ}
    (hr : 0 < r) (hr1 : r < 1) :
    discCounting f r = ValueDistribution.logCounting f ⊤ r := by sorry
lemma restriction {f g : ℂ → ℂ} {r : ℝ} (hr : 0 < r) (hr1 : r < 1)
    (hf : MeromorphicOn f (ball 0 1)) (hg : MeromorphicOn g (ball 0 1))
    (hfg : ∀ z ∈ closedBall (0 : ℂ) r, f =ᶠ[nhds z] g) :
    discCounting f r = discCounting g r := by sorry
lemma power {f : ℂ → ℂ} (hf : MeromorphicOn f (ball 0 1)) (n : ℕ)
    {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    discCounting (fun z ↦ f z ^ n) r = n * discCounting f r := by sorry
-- TauCeti.ConformalPartII.discCounting.zeroPole
example {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    discCounting (fun z ↦ 1 / z) r = Real.log r ∧ Real.log r < 0 := by sorry
-- TauCeti.ConformalPartII.discCounting.holomorphic
example {r : ℝ} (hr : 0 < r) (hr1 : r < 1) : discCounting (fun _ ↦ 1) r = 0 := by sorry
-- TauCeti.ConformalPartII.discCounting.boundaryPole
example {a : ℂ} (ha : a ≠ 0) (ha1 : ‖a‖ < 1) :
    discCounting (fun z ↦ 1 / (z - a)) ‖a‖ = 0 := by sorry
end discCounting

def discCharacteristic (f : ℂ → ℂ) (r : ℝ) : ℝ :=
  ValueDistribution.proximity f ⊤ r + discCounting f r
namespace discCharacteristic
lemma eq (f : ℂ → ℂ) (r : ℝ) : discCharacteristic f r =
    ValueDistribution.proximity f ⊤ r + discCounting f r := by sorry
lemma globalComparison {f : ℂ → ℂ} (hf : Meromorphic f) {r : ℝ}
    (hr : 0 < r) (hr1 : r < 1) :
    discCharacteristic f r = ValueDistribution.characteristic f ⊤ r := by sorry
lemma holomorphic {f : ℂ → ℂ} (hf : DifferentiableOn ℂ f (ball 0 1))
    {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    discCharacteristic f r = ValueDistribution.proximity f ⊤ r := by sorry
lemma power {f : ℂ → ℂ} (hf : MeromorphicOn f (ball 0 1)) (n : ℕ)
    {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    discCharacteristic (fun z ↦ f z ^ n) r = n * discCharacteristic f r := by sorry
-- TauCeti.ConformalPartII.discCharacteristic.constant
example {r : ℝ} (hr : 0 < r) (hr1 : r < 1) {c : ℂ} (hc : c ≠ 0) :
    discCharacteristic (fun _ ↦ c) r = Real.posLog ‖c‖ := by sorry
-- TauCeti.ConformalPartII.discCharacteristic.identity
example {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    discCharacteristic (fun z ↦ z) r = 0 := by sorry
-- TauCeti.ConformalPartII.discCharacteristic.centrePole
example {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    discCharacteristic (fun z ↦ 1 / z) r = 0 := by sorry
end discCharacteristic

def pivotMap (N : ℕ) (x : ℂ) : ℂ := x ^ N / (x ^ N - 1)
namespace pivotMap
lemma formula (N : ℕ) {x : ℂ} (hx : x ^ N ≠ 1) :
    pivotMap N x = x ^ N / (x ^ N - 1) := by sorry
lemma companion (N : ℕ) {x : ℂ} (hx : x ^ N ≠ 1) :
    pivotMap N x = 1 + 1 / (x ^ N - 1) := by sorry
lemma poleSet (N : ℕ) (hN : 2 ≤ N) (x : ℂ) :
    meromorphicOrderAt (pivotMap N) x = ((-1 : ℤ) : WithTop ℤ) ↔ x ^ N = 1 := by sorry
lemma coverComposition {N : ℕ} (hN : 2 ≤ N) {F : ℂ → ℂ}
    (hF : DifferentiableOn ℂ F (ball 0 1)) (homit : ∀ z ∈ ball (0 : ℂ) 1, F z ^ N ≠ 1) :
    DifferentiableOn ℂ (fun z ↦ pivotMap N (F z)) (ball 0 1) := by sorry
-- TauCeti.ConformalPartII.pivotMap.zero
example (N : ℕ) (hN : 2 ≤ N) : pivotMap N 0 = 0 := by sorry
-- TauCeti.ConformalPartII.pivotMap.twoAtTwo
example : pivotMap 2 2 = (4 / 3 : ℂ) := by sorry
-- TauCeti.ConformalPartII.pivotMap.rootPole
example : meromorphicOrderAt (pivotMap 2) 1 = ((-1 : ℤ) : WithTop ℤ) := by sorry
end pivotMap

end ConformalPartII
end TauCeti


/-! ## Analytic equations and based covers -/
namespace TauCeti.ConformalPartII

/-- A monic equation of positive order on a connected open complex domain. -/
structure LinearEquation (Ω : Set ℂ) (n : ℕ) where
  positiveOrder : 0 < n
  openDomain : IsOpen Ω
  connectedDomain : IsConnected Ω
  coefficient : Fin n → ℂ → ℂ
  analyticCoefficient : ∀ j, AnalyticOnNhd ℂ (coefficient j) Ω

def LinearEquation.initialJet {Ω : Set ℂ} {n : ℕ}
    (_E : LinearEquation Ω n) (y : ℂ → ℂ) (x : ℂ) : Fin n → ℂ :=
  fun j ↦ iteratedDeriv j.val y x

def LinearEquation.IsSolution {Ω : Set ℂ} {n : ℕ}
    (E : LinearEquation Ω n) (y : ℂ → ℂ) : Prop :=
  AnalyticOnNhd ℂ y Ω ∧ ∀ x ∈ Ω,
    iteratedDeriv n y x + ∑ j, E.coefficient j x * iteratedDeriv j.val y x = 0

/-- The companion matrix acts on the unscaled derivative jet. -/
def LinearEquation.companion {Ω : Set ℂ} {n : ℕ}
    (E : LinearEquation Ω n) (x : ℂ) : Matrix (Fin n) (Fin n) ℂ :=
  fun i j ↦ if i.val + 1 = n then -E.coefficient j x
    else if j.val = i.val + 1 then 1 else 0

lemma LinearEquation.companion_jet {Ω : Set ℂ} {n : ℕ}
    (E : LinearEquation Ω n) {y : ℂ → ℂ} (hy : E.IsSolution y) {x : ℂ} (hx : x ∈ Ω) :
    (fun j : Fin n ↦ deriv (fun z ↦ E.initialJet y z j) x) =
      (E.companion x).mulVec (E.initialJet y x) := by sorry

lemma LinearEquation.companion_equiv {Ω : Set ℂ} {n : ℕ}
    (E : LinearEquation Ω n) (v : ℂ → Fin n → ℂ)
    (hv : ∀ j, AnalyticOnNhd ℂ (fun x ↦ v x j) Ω) :
    (∀ x ∈ Ω, (fun j ↦ deriv (fun z ↦ v z j) x) = (E.companion x).mulVec (v x)) ↔
      E.IsSolution (fun x ↦ v x ⟨0, E.positiveOrder⟩) ∧
        ∀ x ∈ Ω, E.initialJet (fun z ↦ v z ⟨0, E.positiveOrder⟩) x = v x := by sorry

/-- Local existence and uniqueness up to equality of germs, without a fake germ carrier. -/
lemma LinearEquation.initial_value {Ω : Set ℂ} {n : ℕ}
    (E : LinearEquation Ω n) {x : ℂ} (hx : x ∈ Ω) (v : Fin n → ℂ) :
    ∃ y : ℂ → ℂ, AnalyticAt ℂ y x ∧ E.initialJet y x = v ∧
      (∀ᶠ z in nhds x, iteratedDeriv n y z +
        ∑ j, E.coefficient j z * iteratedDeriv j.val y z = 0) ∧
      ∀ w : ℂ → ℂ, AnalyticAt ℂ w x → E.initialJet w x = v →
        (∀ᶠ z in nhds x, iteratedDeriv n w z +
          ∑ j, E.coefficient j z * iteratedDeriv j.val w z = 0) →
        w =ᶠ[nhds x] y := by sorry

lemma LinearEquation.path_continuation {Ω : Set ℂ} {n : ℕ}
    (E : LinearEquation Ω n) (γ : ℝ → ℂ) (hγ : ContinuousOn γ (Icc 0 1))
    (hγΩ : MapsTo γ (Icc 0 1) Ω) (y : ℂ → ℂ) (hy : AnalyticAt ℂ y (γ 0))
    (hyeq : ∀ᶠ z in nhds (γ 0), iteratedDeriv n y z +
      ∑ j, E.coefficient j z * iteratedDeriv j.val y z = 0) :
    ∃ family : ℝ → ℂ → ℂ,
      TauCeti.IsAnalyticContinuationAlong family γ (Icc 0 1) ∧
      family 0 =ᶠ[nhds (γ 0)] y ∧
      ∀ t ∈ Icc (0 : ℝ) 1, ∀ᶠ z in nhds (γ t),
        iteratedDeriv n (family t) z +
          ∑ j, E.coefficient j z * iteratedDeriv j.val (family t) z = 0 := by sorry

-- TauCeti.ConformalPartII.LinearEquation.orderOneZero
example {Ω : Set ℂ} (E : LinearEquation Ω 1)
    (ha : ∀ x ∈ Ω, E.coefficient 0 x = 0) {y : ℂ → ℂ}
    (hy : E.IsSolution y) : ∃ c, ∀ x ∈ Ω, y x = c := by sorry
-- TauCeti.ConformalPartII.LinearEquation.secondOrderZero
example {Ω : Set ℂ} (E : LinearEquation Ω 2)
    (ha : ∀ j x, x ∈ Ω → E.coefficient j x = 0) {y : ℂ → ℂ}
    (hy : E.IsSolution y) : ∃ a b : ℂ, ∀ x ∈ Ω,
      y x = a * x + b ∧ E.initialJet y x 0 = y x ∧ E.initialJet y x 1 = a := by sorry
-- TauCeti.ConformalPartII.LinearEquation.singularCoefficient
example : ¬ AnalyticAt ℂ (fun z : ℂ ↦ 1 / z) 0 := by sorry

/-- A scalar holomorphic realization of a based universal cover from the simply connected
native unit disc. The covering map is between the actual disc and domain subtypes. -/
structure PointedCover (Ω : Set ℂ) (a : ℂ) where
  toFun : ℂ → ℂ
  holomorphic : DifferentiableOn ℂ toFun (ball 0 1)
  mapsTo : MapsTo toFun (ball 0 1) Ω
  based : toFun 0 = a
  covering : IsCoveringMap (fun z : Complex.UnitDisc ↦
    (⟨toFun (z : ℂ), mapsTo (by simpa using z.norm_lt_one)⟩ : Ω))
  surjective : SurjOn toFun (ball 0 1) Ω

lemma PointedCover.deriv_ne_zero {Ω : Set ℂ} {a z : ℂ}
    (F : PointedCover Ω a) (hΩ : IsOpen Ω) (hz : z ∈ ball (0 : ℂ) 1) :
    deriv F.toFun z ≠ 0 := by sorry

lemma PointedCover.rotation_unique {Ω : Set ℂ} {a : ℂ}
    (F G : PointedCover Ω a) (hΩ : IsOpen Ω) :
    ∃! ζ : ℂ, ‖ζ‖ = 1 ∧ ∀ z ∈ ball (0 : ℂ) 1, G.toFun z = F.toFun (ζ * z) := by sorry

/-- The defining set is nonempty on hyperbolic pointed domains and has one element. -/
def conformalRadius (Ω : Set ℂ) (a : ℂ) : ℝ :=
  sInf {r : ℝ | ∃ F : PointedCover Ω a, r = ‖deriv F.toFun 0‖}

lemma conformalRadius.coverDerivative {Ω : Set ℂ} {a : ℂ}
    (F : PointedCover Ω a) (hΩ : IsOpen Ω) :
    conformalRadius Ω a = ‖deriv F.toFun 0‖ := by sorry
lemma conformalRadius.positive {Ω : Set ℂ} {a : ℂ}
    (F : PointedCover Ω a) (hΩ : IsOpen Ω) : 0 < conformalRadius Ω a := by sorry
lemma conformalRadius.riemannMap {Ω : Set ℂ} {a : ℂ} {φ : ℂ → ℂ}
    (hΩ : IsOpen Ω) (hφ : TauCeti.IsNormalizedRiemannMapOn φ Ω a) :
    conformalRadius Ω a = 1 / ‖deriv φ a‖ := by sorry
lemma conformalRadius.affineChange {Ω : Set ℂ} {a b c : ℂ}
    (F : PointedCover Ω a) (hΩ : IsOpen Ω) (hb : b ≠ 0) :
    conformalRadius ((fun z : ℂ ↦ b * z + c) '' Ω) (b * a + c) =
      ‖b‖ * conformalRadius Ω a := by sorry
lemma conformalRadius.monotone {Ω Ω' : Set ℂ} {a : ℂ}
    (F : PointedCover Ω a) (G : PointedCover Ω' a)
    (hΩ : IsOpen Ω) (hΩ' : IsOpen Ω') (hsub : Ω ⊆ Ω') :
    conformalRadius Ω a ≤ conformalRadius Ω' a := by sorry
lemma PointedCover.schwarz {Ω : Set ℂ} {a : ℂ}
    (F : PointedCover Ω a) (hΩ : IsOpen Ω) {f : ℂ → ℂ}
    (hf : DifferentiableOn ℂ f (ball 0 1)) (hmaps : MapsTo f (ball 0 1) Ω) (h0 : f 0 = a) :
    ‖deriv f 0‖ ≤ conformalRadius Ω a := by sorry
-- TauCeti.ConformalPartII.conformalRadius.unitDisc
example : conformalRadius (ball (0 : ℂ) 1) 0 = 1 := by sorry
-- TauCeti.ConformalPartII.conformalRadius.radiusTwo
example : conformalRadius (ball (0 : ℂ) 2) 0 = 2 := by sorry
-- TauCeti.ConformalPartII.conformalRadius.oncePuncturedPlane
example : ¬ ∃ a b : ℂ, a ≠ b ∧ a ∉ {z : ℂ | z ≠ 0} ∧ b ∉ {z : ℂ | z ≠ 0} := by sorry

/-- Use the oriented representative for inverse-germ calculations. Cusp coordinates are
supplied separately by the primitive cusp datum, rather than stored as a desired theorem. -/
structure RootsCover (N : ℕ) extends PointedCover {x : ℂ | x ^ N ≠ 1} 0 where
  level : 2 ≤ N
  oriented : 0 < (deriv toFun 0).re
  realDerivative : (deriv toFun 0).im = 0

namespace RootsCover
lemma mapZero {N : ℕ} (F : RootsCover N) : F.toFun 0 = 0 := by sorry
lemma omitsRoots {N : ℕ} (F : RootsCover N) {z ζ : ℂ}
    (hz : z ∈ ball (0 : ℂ) 1) (hζ : ζ ^ N = 1) : F.toFun z ≠ ζ := by sorry
def halfPlane {N : ℕ} (F : RootsCover N) (τ : ℂ) : ℂ :=
  F.toFun ((τ - I) / (τ + I))
lemma halfPlane_apply {N : ℕ} (F : RootsCover N) {z : ℂ} (hz : ‖z‖ < 1) :
    F.halfPlane (CayleyCoordinate z) = F.toFun z := by sorry
lemma derivativeOrientation {N : ℕ} (F : RootsCover N) :
    0 < (deriv F.toFun 0).re ∧ (deriv F.toFun 0).im = 0 := by sorry
lemma etale {N : ℕ} (F : RootsCover N) {z : ℂ} (hz : z ∈ ball (0 : ℂ) 1) :
    deriv F.toFun z ≠ 0 := by sorry
lemma equivariant {N : ℕ} (F : RootsCover N) {ζ z : ℂ}
    (hζ : ζ ^ N = 1) (hz : z ∈ ball (0 : ℂ) 1) :
    F.toFun (ζ * z) = ζ * F.toFun z := by sorry
lemma exists_cover (N : ℕ) (hN : 2 ≤ N) : Nonempty (RootsCover N) := by sorry
-- TauCeti.ConformalPartII.RootsCover.twoRoots
example : {x : ℂ | x ^ 2 ≠ 1} = {x | x ≠ -1 ∧ x ≠ 1} := by sorry
-- TauCeti.ConformalPartII.RootsCover.zeroNotOmitted
example {N : ℕ} (F : RootsCover N) : (0 : ℂ) ^ N ≠ 1 ∧ F.toFun 0 = 0 := by sorry
-- TauCeti.ConformalPartII.RootsCover.boundaryLimit
example {N : ℕ} (F : RootsCover N) :
    Filter.Tendsto (fun r : ℝ ↦ F.toFun r) (nhdsWithin 1 (Iio 1)) (nhds (1 : ℂ)) ∧
      ∀ z ∈ ball (0 : ℂ) 1, F.toFun z ≠ 1 := by sorry
end RootsCover

/-- Root-independent descent; its values outside the disc are immaterial. -/
def PowerDescent {N : ℕ} (F : RootsCover N) : ℂ → ℂ := by sorry
namespace PowerDescent
lemma holomorphic {N : ℕ} (F : RootsCover N) :
    DifferentiableOn ℂ (PowerDescent F) (ball 0 1) := by sorry
lemma rootEquation {N : ℕ} (F : RootsCover N) {z : ℂ} (hz : ‖z‖ < 1) :
    PowerDescent F (z ^ N) = F.toFun z ^ N := by sorry
lemma mapZero {N : ℕ} (F : RootsCover N) : PowerDescent F 0 = 0 := by sorry
lemma derivative {N : ℕ} (F : RootsCover N) :
    deriv (PowerDescent F) 0 = deriv F.toFun 0 ^ N := by sorry
lemma rootIndependence {N : ℕ} (F : RootsCover N) {z w : ℂ}
    (hz : ‖z‖ < 1) (hw : ‖w‖ < 1) (hpow : z ^ N = w ^ N) :
    F.toFun z ^ N = F.toFun w ^ N := by sorry
-- TauCeti.ConformalPartII.PowerDescent.zero
example {N : ℕ} (F : RootsCover N) :
    deriv (PowerDescent F) 0 ≠ 0 ∧ ∃ ψ : ℂ → ℂ, AnalyticAt ℂ ψ 0 ∧ ψ 0 = 0 ∧
      (PowerDescent F ∘ ψ) =ᶠ[nhds 0] id ∧ (ψ ∘ PowerDescent F) =ᶠ[nhds 0] id := by sorry
-- TauCeti.ConformalPartII.PowerDescent.negativeRoot
example (F : RootsCover 2) {z : ℂ} (hz : ‖z‖ < 1) :
    F.toFun z ^ 2 = F.toFun (-z) ^ 2 := by sorry
-- TauCeti.ConformalPartII.PowerDescent.localCoefficient
example {N : ℕ} (F : RootsCover N) {a : ℂ}
    (hF : Asymptotics.IsBigO (nhds 0) (fun z : ℂ ↦ F.toFun z - a * z)
      (fun z ↦ z ^ (N + 1))) :
    Asymptotics.IsBigO (nhds 0) (fun w : ℂ ↦ PowerDescent F w - a ^ N * w)
      (fun w ↦ w ^ 2) := by sorry
end PowerDescent

lemma roots_inverse_schwarzian {N : ℕ} (F : RootsCover N) {w : ℂ → ℂ} {x : ℂ}
    (hx : x ^ N ≠ 1) (hw : AnalyticAt ℂ w x)
    (hinv : (fun z ↦ F.toFun (w z)) =ᶠ[nhds x] id)
    (hdisc : ‖w x‖ < 1) :
    schwarzian w x = (((N : ℂ) ^ 2 - 1) * x ^ (N - 2) + x ^ (2 * N - 2)) /
      (2 * (x ^ N - 1) ^ 2) := by sorry

lemma gauss_equation (a b c x : ℂ)
    (ha : ∀ k : ℕ, a ≠ -(k : ℂ)) (hb : ∀ k : ℕ, b ≠ -(k : ℂ))
    (hc : ∀ k : ℕ, c ≠ -(k : ℂ)) (hx : ‖x‖ < 1) :
    x * (1 - x) * iteratedDeriv 2 (ordinaryHypergeometric a b c) x +
      (c - (a + b + 1) * x) * deriv (ordinaryHypergeometric a b c) x -
      a * b * ordinaryHypergeometric a b c x = 0 := by sorry
lemma gauss_initial_values (a b c : ℂ) (hc : ∀ k : ℕ, c ≠ -(k : ℂ)) :
    ordinaryHypergeometric a b c (0 : ℂ) = 1 ∧ deriv (ordinaryHypergeometric a b c) 0 = a * b / c := by sorry
lemma inverseRatio.analytic {N : ℕ} (hN : 2 ≤ N) : AnalyticAt ℂ (inverseRatio N) 0 := by sorry
lemma inverseRatio.cover_inverse {N : ℕ} (F : RootsCover N) :
    (fun x ↦ F.toFun ((deriv F.toFun 0)⁻¹ * inverseRatio N x)) =ᶠ[nhds 0] id := by sorry
lemma RootsCover.radius_formula {N : ℕ} (F : RootsCover N) :
    ‖deriv F.toFun 0‖ = gammaRadius N := by sorry

/-! ## Local Jensen and logarithmic integrals -/
lemma discCounting.nonnegative {f : ℂ → ℂ} (hf : MeromorphicOn f (ball 0 1))
    (h0 : 0 ≤ meromorphicOrderAt f 0) {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    0 ≤ discCounting f r := by sorry
lemma discCounting.zero_iff {f : ℂ → ℂ} (hf : MeromorphicOn f (ball 0 1))
    (h0 : 0 ≤ meromorphicOrderAt f 0) {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    discCounting f r = 0 ↔ ∀ z ∈ ball (0 : ℂ) r, 0 ≤ meromorphicOrderAt f z := by sorry
lemma discCounting.zero_iff_analytic {f : ℂ → ℂ} (hf : MeromorphicOn f (ball 0 1))
    (hc : ContinuousOn f (ball 0 1)) (h0 : 0 ≤ meromorphicOrderAt f 0)
    {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    discCounting f r = 0 ↔ AnalyticOnNhd ℂ f (ball 0 r) := by sorry
lemma local_log_integrable {f : ℂ → ℂ} (hf : MeromorphicOn f (ball 0 1))
    (h0 : meromorphicOrderAt f 0 ≠ ⊤) {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    CircleIntegrable (fun z ↦ Real.log ‖f z‖) 0 r := by sorry
lemma local_jensen {f : ℂ → ℂ} (hf : MeromorphicOn f (ball 0 1))
    (h0 : meromorphicOrderAt f 0 ≠ ⊤) {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    Real.circleAverage (fun z ↦ Real.log ‖f z‖) 0 r =
      discCounting (fun z ↦ 1 / f z) r - discCounting f r +
        Real.log ‖meromorphicTrailingCoeffAt f 0‖ := by sorry
lemma local_first_main_inversion {f : ℂ → ℂ} (hf : MeromorphicOn f (ball 0 1))
    (h0 : meromorphicOrderAt f 0 ≠ ⊤) {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    discCharacteristic f r - discCharacteristic (fun z ↦ 1 / f z) r =
      Real.log ‖meromorphicTrailingCoeffAt f 0‖ := by sorry
lemma translation_proximity {f : ℂ → ℂ} (hf : MeromorphicOn f (ball 0 1))
    (a : ℂ) {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    |ValueDistribution.proximity (fun z ↦ f z - a) ⊤ r - ValueDistribution.proximity f ⊤ r| ≤
      Real.posLog ‖a‖ + Real.log 2 := by sorry
lemma local_first_main_translation {f : ℂ → ℂ} (hf : MeromorphicOn f (ball 0 1))
    (a : ℂ) (h0 : meromorphicOrderAt (fun z ↦ f z - a) 0 ≠ ⊤)
    {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    |discCharacteristic f r - discCharacteristic (fun z ↦ 1 / (f z - a)) r -
      Real.log ‖meromorphicTrailingCoeffAt (fun z ↦ f z - a) 0‖| ≤
      Real.posLog ‖a‖ + Real.log 2 := by sorry
lemma holomorphic_proximity_monotone {f : ℂ → ℂ}
    (hf : DifferentiableOn ℂ f (ball 0 1)) {r R : ℝ}
    (hr : 0 < r) (hrR : r ≤ R) (hR : R < 1) :
    ValueDistribution.proximity f ⊤ r ≤ ValueDistribution.proximity f ⊤ R := by sorry

lemma herglotz_log {g : ℂ → ℂ} {R : ℝ} (hR : 0 < R)
    (hg : AnalyticOnNhd ℂ g (closedBall 0 R))
    (hn : ∀ z ∈ closedBall (0 : ℂ) R, g z ≠ 0) (h0 : g 0 = 1) :
    ∃ L : ℂ → ℂ, AnalyticOnNhd ℂ L (closedBall 0 R) ∧ L 0 = 0 ∧
      (∀ z ∈ closedBall (0 : ℂ) R, Complex.exp (L z) = g z) ∧
      ∀ z ∈ ball (0 : ℂ) R, L z = Real.circleAverage
        (fun w ↦ (Real.log ‖g w‖ : ℂ) * (w + z) / (w - z)) 0 R := by sorry
lemma herglotz_derivative {g : ℂ → ℂ} {R : ℝ} (hR : 0 < R)
    (hg : AnalyticOnNhd ℂ g (closedBall 0 R))
    (hn : ∀ z ∈ closedBall (0 : ℂ) R, g z ≠ 0) (h0 : g 0 = 1)
    {z : ℂ} (hz : z ∈ ball (0 : ℂ) R) :
    deriv g z / g z = Real.circleAverage
      (fun w ↦ (Real.log ‖g w‖ : ℂ) * (2 * w) / (w - z) ^ 2) 0 R := by sorry
lemma inverse_square_kernel_mean {r R : ℝ} (hr : 0 < r) (hrR : r < R)
    {w : ℂ} (hw : ‖w‖ = R) :
    Real.circleAverage (fun z ↦ ‖w - z‖⁻¹ ^ 2) 0 r = 1 / (R ^ 2 - r ^ 2) := by sorry
lemma boundary_log_l1 {g : ℂ → ℂ} {R : ℝ} (hR : 0 < R)
    (hg : AnalyticOnNhd ℂ g (closedBall 0 R))
    (hn : ∀ z ∈ closedBall (0 : ℂ) R, g z ≠ 0) (h0 : g 0 = 1) :
    Real.circleAverage (fun z ↦ |Real.log ‖g z‖|) 0 R =
      2 * ValueDistribution.proximity g ⊤ R := by sorry
lemma entropy_log_mean {H : ℂ → ℝ} {r : ℝ}
    (hi : CircleIntegrable H 0 r) (hn : ∀ z ∈ sphere (0 : ℂ) |r|, 0 ≤ H z) :
    CircleIntegrable (fun z ↦ Real.posLog (H z)) 0 r ∧
      Real.circleAverage (fun z ↦ Real.posLog (H z)) 0 r ≤
        Real.posLog (Real.circleAverage H 0 r) + 1 / Real.exp 1 := by sorry
lemma normalized_log_derivative {g : ℂ → ℂ} {r R : ℝ}
    (hr : 0 < r) (hrR : r < R) (hg : AnalyticOnNhd ℂ g (closedBall 0 R))
    (hn : ∀ z ∈ closedBall (0 : ℂ) R, g z ≠ 0) (h0 : g 0 = 1) :
    ValueDistribution.proximity (fun z ↦ deriv g z / g z) ⊤ r ≤
      Real.posLog (ValueDistribution.proximity g ⊤ R / r * (R / (R - r))) +
        Real.log 2 + 1 / Real.exp 1 := by sorry
lemma small_radius_transfer {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    let ρ := max r (1 / 4); let R := (1 + r) / 2
    1 / 4 ≤ ρ ∧ r ≤ ρ ∧ ρ < R ∧ (1 - r) / 4 ≤ R - ρ := by sorry

lemma pivotMap.partial_fractions {N : ℕ} (hN : 2 ≤ N) {x : ℂ} (hx : x ^ N ≠ 1) :
    pivotMap N x = (x / (N : ℂ)) *
      ∑ k : Fin N, 1 / (x - Complex.exp (2 * Real.pi * I * (k.val : ℂ) / (N : ℂ))) := by sorry
lemma pivotMap.chain {N : ℕ} (F : RootsCover N) {z : ℂ} (hz : ‖z‖ < 1) :
    pivotMap N (F.toFun z) = F.toFun z / ((N : ℂ) * deriv F.toFun z) *
      (deriv (fun w ↦ 1 - F.toFun w ^ N) z / (1 - F.toFun z ^ N)) := by sorry
lemma pivotMap.characteristic_lower {N : ℕ} (F : RootsCover N)
    {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    (N : ℝ) * discCharacteristic F.toFun r - Real.log 4 ≤
      discCharacteristic (fun z ↦ pivotMap N (F.toFun z)) r := by sorry
lemma three_map_equivalence {N : ℕ} (F : RootsCover N)
    {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    |discCharacteristic (fun z ↦ F.toFun z ^ N) r -
      discCharacteristic (fun z ↦ pivotMap N (F.toFun z)) r| ≤ Real.log 4 ∧
    |discCharacteristic (fun z ↦ F.toFun z ^ N) r -
      discCharacteristic (fun z ↦ 1 / (F.toFun z ^ N - 1)) r| ≤ Real.log 4 := by sorry
lemma etale_pole_count {N : ℕ} (F : RootsCover N)
    {r : ℝ} (hr : 0 < r) (hr1 : r < 1) :
    discCounting (fun z ↦ deriv F.toFun z / F.toFun z) r =
      discCounting (fun z ↦ 1 / F.toFun z) r ∧
    discCounting (fun z ↦ F.toFun z / deriv F.toFun z) r = 0 := by sorry

/-- Absolute means estimates include every oriented cover and all radii. -/
lemma uniform_mean_growth : ∃ C : ℝ, 0 < C ∧ ∀ N : ℕ, ∀ F : RootsCover N,
    ∀ r : ℝ, 0 < r → r < 1 →
      ValueDistribution.proximity (fun z ↦ F.toFun z ^ N) ⊤ r ≤ C * Real.log (N / (1 - r)) ∧
      ValueDistribution.proximity (fun z ↦ pivotMap N (F.toFun z)) ⊤ r ≤ C * Real.log (N / (1 - r)) ∧
      ValueDistribution.proximity (fun z ↦ 1 / (F.toFun z ^ N - 1)) ⊤ r ≤ C * Real.log (N / (1 - r)) := by sorry

end TauCeti.ConformalPartII
namespace TauCeti.ConformalPartII

/-- Single-valued solution germs on a punctured neighbourhood, using the native germ quotient.
The domain must contain a punctured neighbourhood; otherwise this carrier would not even contain
zero. Membership requires a holomorphic representative satisfying the equation there. -/
def LinearEquation.puncturedSolutionGerms {Ω : Set ℂ} {n : ℕ}
    (E : LinearEquation Ω n) (α : ℂ) (_hΩα : Ω ∈ nhdsWithin α {α}ᶜ) :
    Submodule ℂ (Filter.Germ (nhdsWithin α {α}ᶜ) ℂ) where
  carrier := {f | ∃ y : ℂ → ℂ, Filter.Germ.ofFun y = f ∧
    ∀ᶠ x in nhdsWithin α {α}ᶜ, x ∈ Ω ∧ AnalyticAt ℂ y x ∧
      iteratedDeriv n y x + ∑ j, E.coefficient j x * iteratedDeriv j.val y x = 0}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- A full basis of n solutions meromorphic at the puncture; identity monodromy alone
is weaker because it also permits essential singularities. -/
structure MeromorphicBasisMonodromy {Ω : Set ℂ} {n : ℕ}
    (E : LinearEquation Ω n) (α : ℂ) where
  puncturedDomain : Ω ∈ nhdsWithin α {α}ᶜ
  basis : Module.Basis (Fin n) ℂ (E.puncturedSolutionGerms α puncturedDomain)
  meromorphic : ∀ j, ∃ y : ℂ → ℂ, MeromorphicAt y α ∧
    (Filter.Germ.ofFun y : Filter.Germ (nhdsWithin α {α}ᶜ) ℂ) = (basis j).val

lemma MeromorphicBasisMonodromy.finitePoleBound {Ω : Set ℂ} {n : ℕ}
    {E : LinearEquation Ω n} {α : ℂ} (B : MeromorphicBasisMonodromy E α) :
    ∃ k : ℕ, ∀ f : E.puncturedSolutionGerms α B.puncturedDomain,
      ∃ y : ℂ → ℂ, MeromorphicAt y α ∧
        (Filter.Germ.ofFun y : Filter.Germ (nhdsWithin α {α}ᶜ) ℂ) = f.val ∧
        ((-(k : ℤ)) : WithTop ℤ) ≤ meromorphicOrderAt y α := by sorry

-- TauCeti.ConformalPartII.MeromorphicBasisMonodromy.ordinaryPoint
example {Ω : Set ℂ} {n : ℕ} (E : LinearEquation Ω n) {α : ℂ} (hα : α ∈ Ω) :
    ∃ B : MeromorphicBasisMonodromy E α, ∀ j, ∃ y : ℂ → ℂ,
      AnalyticAt ℂ y α ∧
        (Filter.Germ.ofFun y : Filter.Germ (nhdsWithin α {α}ᶜ) ℂ) = (B.basis j).val := by sorry
-- TauCeti.ConformalPartII.MeromorphicBasisMonodromy.regularPole
example (E : LinearEquation {z : ℂ | z ≠ 0} 1)
    (hE : ∀ z, z ≠ 0 → E.coefficient 0 z = 1 / z) :
    Nonempty (MeromorphicBasisMonodromy E 0) ∧
      meromorphicOrderAt (fun z : ℂ ↦ 1 / z) 0 = ((-1 : ℤ) : WithTop ℤ) := by sorry
-- TauCeti.ConformalPartII.MeromorphicBasisMonodromy.essentialSingularity
example (E : LinearEquation {z : ℂ | z ≠ 0} 1)
    (hE : ∀ z, z ≠ 0 → E.coefficient 0 z = 1 / z ^ 2) :
    ¬ Nonempty (MeromorphicBasisMonodromy E 0) ∧
      ¬ MeromorphicAt (fun z : ℂ ↦ Complex.exp (1 / z)) 0 := by sorry

/-- Clearing all basis poles at once, with a rational polynomial in a holomorphic
local parameter having an algebraic value. Its nonconstant germ supplies a positive vanishing
order; no Galois saturation assumption is needed. -/
lemma simultaneous_pole_clearing {Ω : Set ℂ} {n : ℕ} {E : LinearEquation Ω n}
    (A : Finset ℂ) (B : ∀ α ∈ A, MeromorphicBasisMonodromy E α) (p : ℂ → ℂ)
    (hp : ∀ α ∈ A, AnalyticAt ℂ p α)
    (halg : ∀ α ∈ A, IsAlgebraic ℚ (p α))
    (hnonconst : ∀ α ∈ A, ¬ p =ᶠ[nhds α] (fun _ ↦ p α)) :
    ∃ q : Polynomial ℚ, q ≠ 0 ∧ ∀ α (hα : α ∈ A), ∀ j : Fin n,
      ∃ y : ℂ → ℂ, MeromorphicAt y α ∧
        (Filter.Germ.ofFun y : Filter.Germ (nhdsWithin α {α}ᶜ) ℂ) = ((B α hα).basis j).val ∧
        AnalyticAt ℂ (fun z ↦ (q.map (algebraMap ℚ ℂ)).eval (p z) * y z) α := by sorry

end TauCeti.ConformalPartII
namespace TauCeti.ConformalPartII

/-- The set includes the disc guard, even for the total scalar extension of the cover. -/
def ExceptionalCuspSet {N : ℕ} (F : RootsCover N) (M : ℝ) : Set ℂ :=
  {z | ‖z‖ < 1 ∧ ‖F.toFun z ^ N - 1‖ < Real.exp (-M * N)}
namespace ExceptionalCuspSet
lemma mem {N : ℕ} (F : RootsCover N) (M : ℝ) (z : ℂ) :
    z ∈ ExceptionalCuspSet F M ↔ ‖z‖ < 1 ∧ ‖F.toFun z ^ N - 1‖ < Real.exp (-M * N) := by sorry
lemma radiusInvariant {N : ℕ} (F : RootsCover N) {M r : ℝ} {ζ : ℂ} (hζ : ‖ζ‖ = 1)
    (hdisj : Disjoint (ExceptionalCuspSet F M) (closedBall (0 : ℂ) r)) :
    Disjoint ((fun z : ℂ ↦ ζ * z) '' ExceptionalCuspSet F M) (closedBall (0 : ℂ) r) := by sorry
lemma rotatedLargeValues {N : ℕ} (F : RootsCover N) (M : ℝ) {z : ℂ}
    (hz : ‖z‖ < 1) (hbig : Real.exp M + 1 < ‖F.toFun z‖) :
    z ∈ (fun w : ℂ ↦ Complex.exp (Real.pi * I / (N : ℂ)) * w) ''
      ExceptionalCuspSet F M := by sorry
-- TauCeti.ConformalPartII.ExceptionalCuspSet.origin
example {N : ℕ} (F : RootsCover N) {M : ℝ} (hM : 0 < M) :
    (0 : ℂ) ∉ ExceptionalCuspSet F M := by sorry
-- TauCeti.ConformalPartII.ExceptionalCuspSet.rotationRadius
example {ζ z : ℂ} (hζ : ‖ζ‖ = 1) : ‖ζ * z‖ = ‖z‖ := by sorry
-- TauCeti.ConformalPartII.ExceptionalCuspSet.largeValueThreshold
example {N : ℕ} (F : RootsCover N) {z : ℂ} {M : ℝ}
    (hz : ‖z‖ < 1) (hbig : 1 + Real.exp (M * N) < ‖F.toFun z‖ ^ N) :
    ‖1 - F.toFun (Complex.exp (-Real.pi * I / (N : ℂ)) * z) ^ N‖ <
      Real.exp (-M * N) := by sorry
end ExceptionalCuspSet

/-- The half-rotation identity is stated analytically; its projective realization is F0. -/
lemma half_rotation_involution {N : ℕ} (F : RootsCover N) {z : ℂ} (hz : ‖z‖ < 1) :
    1 - F.toFun (Complex.exp (Real.pi * I / (N : ℂ)) * z) ^ N =
      1 / (1 - F.toFun z ^ N) := by sorry

lemma large_n_maximum_growth : ∃ C : ℝ, ∃ N₀ : ℕ, 0 < C ∧ 2 ≤ N₀ ∧
    ∀ N : ℕ, N₀ ≤ N → ∀ F : RootsCover N, ∀ r : ℝ, 0 < r → r < 1 →
      ∀ z ∈ sphere (0 : ℂ) r, Real.log ‖F.toFun z‖ ≤ C * N / (1 - r) := by sorry

-- The logarithm of the outer-circle supremum used in the mean estimates.
def outerLogMaximum {N : ℕ} (F : RootsCover N) (r : ℝ) : ℝ :=
  Real.log (max 1 (sSup ((fun z : ℂ ↦ Real.posLog ‖F.toFun z‖) ''
    sphere 0 ((1 + r) / 2))))

lemma power_log_derivative : ∃ C : ℝ, 0 < C ∧ ∀ N : ℕ, ∀ F : RootsCover N,
    ∀ r : ℝ, 0 < r → r < 1 →
      ValueDistribution.proximity
        (fun z ↦ deriv (fun w ↦ 1 - F.toFun w ^ N) z / (1 - F.toFun z ^ N)) ⊤ r ≤
      C * (Real.log (N / (1 - r)) + outerLogMaximum F r) := by sorry
lemma inverse_cover_derivative : ∃ C : ℝ, 0 < C ∧ ∀ N : ℕ, ∀ F : RootsCover N,
    ∀ r : ℝ, 0 < r → r < 1 →
      ValueDistribution.proximity (fun z ↦ F.toFun z / deriv F.toFun z) ⊤ r ≤
      discCharacteristic F.toFun r + C * (Real.log (N / (1 - r)) + outerLogMaximum F r) := by sorry
lemma pivot_characteristic_upper : ∃ C : ℝ, 0 < C ∧ ∀ N : ℕ, ∀ F : RootsCover N,
    ∀ r : ℝ, 0 < r → r < 1 →
      discCharacteristic (fun z ↦ pivotMap N (F.toFun z)) r ≤
      discCharacteristic F.toFun r + C * (Real.log (N / (1 - r)) + outerLogMaximum F r) := by sorry
lemma large_n_mean : ∃ C : ℝ, ∃ N₀ : ℕ, 0 < C ∧ 2 ≤ N₀ ∧
    ∀ N : ℕ, N₀ ≤ N → ∀ F : RootsCover N, ∀ r : ℝ, 0 < r → r < 1 →
      discCharacteristic (fun z ↦ F.toFun z ^ N) r ≤ C * Real.log (N / (1 - r)) := by sorry
lemma fixed_level_mean (N : ℕ) (hN : 2 ≤ N) : ∃ C : ℝ, 0 < C ∧
    ∀ F : RootsCover N, ∀ r : ℝ, 0 < r → r < 1 →
      discCharacteristic (fun z ↦ F.toFun z ^ N) r ≤ C * Real.log (N / (1 - r)) := by sorry
lemma omitted_linear_log_derivative : ∃ C : ℝ, 0 < C ∧ ∀ N : ℕ, ∀ F : RootsCover N,
    ∀ r : ℝ, 0 < r → r < 1 →
      ValueDistribution.proximity (fun z ↦ deriv F.toFun z / (1 - F.toFun z)) ⊤ r ≤
      C * (Real.log (N / (1 - r)) + outerLogMaximum F r) := by sorry

/-- The normalized quotient theorem stated as pointwise boundary bounds, avoiding a
private predicate for boundedness and retaining the additive epsilon. -/
lemma quotient_representation {g : ℂ → ℂ} (hg : AnalyticOnNhd ℂ g (closedBall 0 1))
    {ε : ℝ} (hε : 0 < ε) : ∃ h : ℂ → ℂ,
      AnalyticOnNhd ℂ h (closedBall 0 1) ∧ h 0 = 1 ∧
      ∀ z ∈ sphere (0 : ℂ) 1,
        Real.log ‖h z‖ ≤ ValueDistribution.proximity g ⊤ 1 + ε ∧
        Real.log ‖h z * g z‖ ≤ ValueDistribution.proximity g ⊤ 1 + ε := by sorry
lemma quotient_phase {G : ℂ → ℂ} {R : ℝ} (hR : 0 < R)
    (hG : AnalyticOnNhd ℂ G (closedBall 0 R))
    (hn : ∀ w ∈ closedBall (0 : ℂ) R, G w ≠ 0) {z : ℂ} (hz : ‖z‖ < R) :
    Complex.exp (Real.circleAverage
      (fun w ↦ (Real.log ‖G w‖ : ℂ) * (w + z) / (w - z)) 0 R) =
      G z * (‖G 0‖ : ℂ) / G 0 := by sorry

end TauCeti.ConformalPartII
namespace TauCeti.ConformalPartII
open scoped MatrixGroups UpperHalfPlane

-- Matrix lifts are used only for arithmetic; the groups are effective PSL groups.
def rootsRotationLift (N : ℕ) : SL(2, ℝ) :=
  ⟨!![Real.cos (Real.pi / N), -Real.sin (Real.pi / N);
      Real.sin (Real.pi / N), Real.cos (Real.pi / N)], by sorry⟩
def rootsHalfRotationLift (N : ℕ) : SL(2, ℝ) :=
  ⟨!![Real.cos (Real.pi / (2 * N)), -Real.sin (Real.pi / (2 * N));
      Real.sin (Real.pi / (2 * N)), Real.cos (Real.pi / (2 * N))], by sorry⟩
def rootsTranslationLift (N : ℕ) : SL(2, ℝ) :=
  ⟨!![1, 2 / Real.tan (Real.pi / (2 * N)); 0, 1], by sorry⟩
def rootsRotation (N : ℕ) : PSL(2, ℝ) := rootsRotationLift N
def rootsHalfRotation (N : ℕ) : PSL(2, ℝ) := rootsHalfRotationLift N
def rootsTranslation (N : ℕ) : PSL(2, ℝ) := rootsTranslationLift N

/-- The concrete free generators; F0 identifies this subgroup with the actual deck group. -/
def rootsDeckGroup (N : ℕ) : Subgroup PSL(2, ℝ) :=
  Subgroup.closure (Set.range (fun k : Fin N ↦
    rootsRotation N ^ k.val * rootsTranslation N * (rootsRotation N ^ k.val)⁻¹))

/-- The effective orientation-preserving power-map stabilizer. -/
def PowerStabilizer (N : ℕ) : Subgroup PSL(2, ℝ) :=
  Subgroup.closure {rootsRotation N, rootsTranslation N}
namespace PowerStabilizer
lemma containsDeck (N : ℕ) : rootsDeckGroup N ≤ PowerStabilizer N := by sorry
lemma generators (N : ℕ) : PowerStabilizer N =
    Subgroup.closure {rootsRotation N, rootsTranslation N} := by sorry
lemma deckIndex (N : ℕ) (hN : 2 ≤ N) : (rootsDeckGroup N).relIndex (PowerStabilizer N) = N := by sorry
lemma invariant {N : ℕ} (F : RootsCover N) (g : PowerStabilizer N) (τ : ℍ) :
    F.halfPlane ((g.val • τ : ℍ) : ℂ) ^ N = F.halfPlane (τ : ℂ) ^ N := by sorry
lemma largest {N : ℕ} (F : RootsCover N) {g : PSL(2, ℝ)}
    (hg : ∀ τ : ℍ, F.halfPlane ((g • τ : ℍ) : ℂ) ^ N = F.halfPlane (τ : ℂ) ^ N) :
    g ∈ PowerStabilizer N := by sorry
-- TauCeti.ConformalPartII.PowerStabilizer.two
example : (rootsDeckGroup 2).relIndex (PowerStabilizer 2) = 2 := by sorry
-- TauCeti.ConformalPartII.PowerStabilizer.rotationOrder
-- Membership of powers states the exact order modulo the deck subgroup.
example (N : ℕ) (hN : 2 ≤ N) (k : ℕ) :
    rootsRotation N ^ k ∈ rootsDeckGroup N ↔ N ∣ k := by sorry
-- The ambient projective rotation has the same order.
example (N : ℕ) (hN : 2 ≤ N) : orderOf (rootsRotation N) = N := by sorry
-- TauCeti.ConformalPartII.PowerStabilizer.notDeck
example (N : ℕ) (hN : 2 ≤ N) : rootsRotation N ∉ rootsDeckGroup N := by sorry
end PowerStabilizer

/-- The index-two orientation-preserving triangle extension. -/
def TriangleSupergroup (N : ℕ) : Subgroup PSL(2, ℝ) :=
  Subgroup.closure {rootsHalfRotation N, rootsTranslation N}
namespace TriangleSupergroup
lemma generators (N : ℕ) : TriangleSupergroup N =
    Subgroup.closure {rootsHalfRotation N, rootsTranslation N} := by sorry
lemma containsPower (N : ℕ) : PowerStabilizer N ≤ TriangleSupergroup N := by sorry
lemma index (N : ℕ) (hN : 2 ≤ N) : (PowerStabilizer N).relIndex (TriangleSupergroup N) = 2 := by sorry
lemma halfRotation_square (N : ℕ) : rootsHalfRotation N ^ 2 = rootsRotation N := by sorry
example : (PowerStabilizer 2).relIndex (TriangleSupergroup 2) = 2 := by sorry
-- TauCeti.ConformalPartII.TriangleSupergroup.halfRotation
example (N : ℕ) (hN : 2 ≤ N) :
    rootsHalfRotation N ∈ TriangleSupergroup N ∧ rootsHalfRotation N ∉ PowerStabilizer N ∧
      rootsHalfRotation N ^ 2 ∈ PowerStabilizer N := by sorry
-- Hyperbolic area is the generic FuchsianOrbifolds polygon-area API; the numerical test is
-- area(Phi_2) = pi and area(Psi_2) = pi/2. No private area carrier is declared here.

-- TauCeti.ConformalPartII.TriangleSupergroup.reflection
/-- Reflection in the imaginary axis preserves the half-plane and is antiholomorphic. -/
example : ¬ ∃ g : PSL(2, ℝ), ∀ τ : ℍ,
    ((g • τ : ℍ) : ℂ) = -(starRingEnd ℂ) (τ : ℂ) := by sorry
end TriangleSupergroup

lemma roots_shimizu_specialization (N : ℕ) (hN : 2 ≤ N) (g : SL(2, ℝ))
    (hg : (g : PSL(2, ℝ)) ∈ PowerStabilizer N) :
    (2 / Real.tan (Real.pi / (2 * N))) * (|g 0 0| + |g 1 0|) ≥ 1 := by sorry

lemma horoball_diameter {D : ℝ} (hD : 0 < D) (g : SL(2, ℝ)) :
    Metric.diam ((fun τ : ℍ ↦
      (((g • τ : ℍ) : ℂ) - I) / (((g • τ : ℍ) : ℂ) + I)) '' {τ : ℍ | D ≤ τ.im}) =
      2 / (1 + D * ((g 0 0) ^ 2 + (g 1 0) ^ 2)) := by sorry

end TauCeti.ConformalPartII

/- Specification: O0/global-solution-dimension
Declaration: Global solutions on simply connected domains
Statement: For a simply connected open Ω and analytic monic order-n equation, the space of holomorphic solutions on Ω has complex dimension n, and evaluation of the initial jet at any x₀∈Ω is a linear isomorphism.
-/


/- Specification: U0/cayley-coordinate
Define C(z)=i(1+z)/(1−z) on |z|<1 and C⁻¹(τ)=(τ−i)/(τ+i) on Im τ>0. These are inverse holomorphic maps, C(0)=i, and z→1 corresponds to the cusp at infinity; no value at the boundary point 1 is part of the interior map.
-/

/- Specification: U0/cover-complex-structure
Declaration: Complex charts on the topological cover
Statement: Specialize TauCeti.UniversalCover.instChartedSpace, instIsManifold and isLocalDiffeomorph_proj in TauCeti.Geometry.Manifold.Instances.UniversalCover to complex plane domains. The underlying topology is the existing quotient topology. Lifted plane-coordinate transitions are restrictions of the identity. Uniqueness is compatibility of atlases. These current-library suppliers are unavailable at the pinned build; do not duplicate their generic construction here.
API TauCeti.ConformalPartII.CoverComplexStructure.projection: The projection is the existing TauCeti.UniversalCover.proj.
API TauCeti.ConformalPartII.CoverComplexStructure.chart: Each covering sheet gives a holomorphic chart by the base plane coordinate.
API TauCeti.ConformalPartII.CoverComplexStructure.topologyComparison: The manifold topology equals the existing quotient topology of UniversalCover.
Test TauCeti.ConformalPartII.CoverComplexStructure.discCover (compatibility): For Ω=𝔻, the cover projection is a biholomorphism.
Test TauCeti.ConformalPartII.CoverComplexStructure.annulusCover (non-example): For a nontrivial annulus the projection is not injective.
Test TauCeti.ConformalPartII.CoverComplexStructure.sheetTransition (computation): On an overlap of two lifted plane-coordinate charts, the transition is the identity.
-/

/- Specification: U0/hyperbolic-uniformization-input
Declaration: Hyperbolic uniformization of the cover
Statement: For a connected open Ω⊆ℂ whose complement has at least two points, its analytic universal cover is biholomorphic to the unit disc. The plane and sphere alternatives of simply connected Riemann-surface uniformization must be excluded; the simply connected planar Riemann mapping theorem alone does not prove this assertion.
-/


/- Specification: S0/schwarzian
For a holomorphic f with f′≠0 on an open set, define S(f)(x)=f‴(x)/f′(x)−(3/2)(f″(x)/f′(x))². This equals (f″/f′)′−(1/2)(f″/f′)². The totalized native derivative expression carries no Schwarzian claims at points where f′=0.
-/

/- Specification: S0/schwarzian-chain
For holomorphic f,g near x, with g′(x)≠0 and f′(g(x))≠0, S(f∘g)(x)=S(f)(g(x))g′(x)²+S(g)(x).
-/

/- Specification: S0/moebius-invariance
Declaration: Möbius invariance of the Schwarzian
Statement: For ad−bc≠0 and M(w)=(aw+b)/(cw+d), S(M∘f)=S(f) where f is locally univalent and cf+d≠0. A branch change of the inverse of a holomorphic cover is a projective transformation, so its Schwarzian is branch-independent.
-/

/- Specification: S0/quotient-ode
Declaration: The Schwarzian differential equation
Statement: On a sufficiently small simply connected neighbourhood where w′≠0, choose an analytic square root of w′. Then v₁=w/√w′ and v₂=1/√w′ are independent solutions of y″+(1/2)S(w)y=0 and w=v₁/v₂. Conversely a quotient of independent solutions of y″+Qy=0 has Schwarzian 2Q wherever its denominator is nonzero.
-/

/- Specification: S0/hempel-rational
Declaration: Hempel’s accessory-parameter formula
Statement: Let S={p₀,…,p_N}⊂ℂ consist of distinct finite points, |S|≥3; thus infinity is unpunctured in ℙ¹∖S. For a local inverse τ of its holomorphic universal cover, S(τ)(X)=(1/2)Σ_k(X−p_k)⁻²+Σ_k m_k/(X−p_k) for constants m_k. The branch-independent Schwarzian is rational and has the stated principal parts.
-/

/- Specification: S0/accessory-constraints
Declaration: Accessory-parameter constraints at infinity
Statement: With Hempel’s finite set S and infinity unpunctured, Σ m_k=0, Σ(2m_kp_k+1)=0, and Σ(m_kp_k²+p_k)=0. These are exactly cancellation of the X⁻¹, X⁻² and X⁻³ coefficients, so the Schwarzian is O(X⁻⁴) at infinity.
-/

/- Specification: S0/symmetric-accessory
Declaration: Accessory parameters for the symmetric punctures
Statement: For the companion cover 1/F̃_N of ℙ¹∖({0}∪μ_N), in coordinate X its accessory parameters are m₀=0 and m_k=−(1/2+1/(2N))ζ_N^(−k), k=1,…,N. Rotational symmetry and the three infinity constraints determine them.
-/


/- Specification: S0/roots-inverse-ode
Declaration: The linear equation of the inverse covering
Statement: For N≥2 the local inverse ψ_N fixing zero is a quotient η₁/η₂ of independent solutions of 4(x^N−1)²y″+((N²−1)x^(N−2)+x^(2N−2))y=0. Choose the quotient normalization to agree with the actual inverse germ; an arbitrary basis gives it only up to a Möbius map.
-/

/- Specification: L0/blaschke-factor
For |a|≤1 define b_a(z)=(z−a)/(1−āz) if |a|<1, and b_a(z)=−a if |a|=1. The boundary formula is the removable extension of the same rational expression; it has no zero. The interior factor is the existing Tau Ceti unitDiscMoebius after coercion; the new wrapper adds only the removable boundary extension in CDT’s convention.
-/

/- Specification: L0/finite-blaschke-product
For a finite family |a_i|≤1 and multiplicities n_i∈ℕ, set B(z)=∏_i b_(a_i)(z)^n_i, with the empty product equal to 1. It is holomorphic near the closed unit disc and has boundary modulus one. It maps the open disc into the closed disc; strict image in the open disc requires at least one positive multiplicity at an interior zero.
-/

/- Specification: L0/blaschke-zero-removal
Declaration: Removing zeros with a finite Blaschke product
Statement: Let g be holomorphic near the closed unit disc and not identically zero. Form B from all its zeros in the closed disc with their orders. After removal of singularities, G=g/B is holomorphic and zero-free on the open disc and has |G|=|g| on the circle wherever the boundary quotients are interpreted by limits. Boundary zeros of g need not disappear from G, because boundary factors are constants.
-/


/- Specification: L0/radial-smoothing
Declaration: Radial smoothing of the quotient multiplier
Statement: If g is holomorphic near the closed unit disc, the radius-r Blaschke/Herglotz construction for r>1 sufficiently close to 1 gives a multiplier h holomorphic on a neighbourhood of the closed unit disc with h(0)=1. The resulting boundary bounds converge to m(1,g) as r decreases to 1, including boundary zeros by integrable logarithmic control.
-/


/- Specification: L0/quotient-lower-bound
Declaration: Optimality of the quotient bound
Statement: If g,h are holomorphic near the closed unit disc and h(0)=1, then m(1,g)≤max{sup_(|z|=1) log|h(z)|,sup_(|z|=1) log|h(z)g(z)|}. This is the lower bound in Remark 2.3.3; use the a.e. logarithmic identity across isolated zeros.
-/


/- Specification: H0/transformed-equation
Declaration: The descended inverse differential equation
Statement: After x=u^N the two solutions η_i(u) of the roots inverse equation give φ_i(x)=η_i(x^(1/N)) on a compatible punctured branch, satisfying x(x−1)²φ″+(1−1/N)(x−1)²φ′+(1/4+(x−1)/(4N²))φ=0.
-/

/- Specification: H0/special-solutions
Declaration: The two hypergeometric solutions
Statement: Let a_±=(N±1)/(2N). On compatible branches near a punctured zero, √(1−x)x^(1/N)₂F₁(a_+,a_+;2a_+;x) and √(1−x)₂F₁(a_−,a_−;2a_−;x) solve the transformed equation. Their leading terms x^(1/N) and 1 match the normalized η₁,η₂ after substituting x=u^N.
-/

/- Specification: H0/inverse-ratio-germ
For N≥2 set J_N(u)=u·₂F₁(a_+,a_+;2a_+;u^N)/₂F₁(a_−,a_−;2a_−;u^N) near u=0, where a_±=(N±1)/(2N). The denominator is 1 at zero. Thus J_N is holomorphic with J_N(0)=0 and J_N′(0)=1. Its expression is a genuine analytic germ and avoids an unjustified global principal-root identity.
-/


/- Specification: H0/zero-balanced-continuation
Declaration: Zero-balanced hypergeometric continuation
Statement: For positive real a and 0<|x|<1 on a fixed compatible branch of log x, the analytic continuation of ₂F₁(a,a;2a;1−x) equals Γ(2a)/Γ(a)² times Σ_{k≥0}(a)_k² x^k/(k!)²·(−log x+2(ψ(k+1)−ψ(k+a))). This refers to the continued analytic function, not the native series junk value outside its disc. The proof needs only a∈[1/4,3/4]. A more general finite-valued parameter statement must also exclude poles of 2a.
-/

/- Specification: H0/digamma-difference-bound
Declaration: Uniform digamma coefficient control
Statement: For a∈[1/4,3/4] and k≥1, 0≤ψ(k+1)−ψ(k+a)≤ψ(2)−ψ(5/4), and the difference decreases in both k and a. This uses the corrected coefficient ψ(k+1)−ψ(k+a), not ψ(k)−ψ(k+a).
-/

/- Specification: H0/pochhammer-remainder
Declaration: Uniform zero-balanced remainder
Statement: For a∈[1/4,3/4] and 0<|x|≤e^(−M₀N), N≥2, the k≥1 part of the zero-balanced series and its a-derivative have bounds uniform in a,N, with size O_{M₀}(|x|(1+|log x|)). The derivative control is required to gain the factor 1/N when comparing a_+ and a_−.
-/

/- Specification: R0/gamma-radius
For N≥2 define γ_N=16^(1/N)Γ(1+1/(2N))²Γ(1−1/N)/(Γ(1−1/(2N))²Γ(1+1/N)), using the native real Gamma function and positive real power. All Gamma arguments are positive. A totalized arithmetic expression outside N≥2 is not assigned a uniformization interpretation.
-/

/- Specification: R0/gamma-positive
Declaration: Positivity of the Gamma radius
Statement: For every N≥2, γ_N>0 and every Gamma factor in its denominator is nonzero.
-/

/- Specification: R0/gamma-alternative
Declaration: The alternative Gamma expression
Statement: For N≥2, γ_N=Γ((N−1)/(2N))²Γ(1+1/N)/(Γ((N+1)/(2N))²Γ(1−1/N)).
-/

/- Specification: R0/cusp-ratio-limit
Declaration: The boundary limit of the inverse ratio
Statement: Along the compatible real branch x→1 from below, the ratio s_N(x)=x^(1/N)₂F₁(a_+,a_+;2a_+;x)/₂F₁(a_−,a_−;2a_−;x) tends to Γ(1+1/N)Γ(a_−)²/(Γ(1−1/N)Γ(a_+)²). The inverse cover approaches a boundary point of modulus one.
-/


/- Specification: R0/log-gamma-taylor
Declaration: The local log-Gamma Taylor series
Statement: For |z|<1, the analytic branch of log Γ(1+z) vanishing at z=0 is −γz+Σ_{k≥2}(−1)^kζ(k)z^k/k. For real −1<z<1 this is the ordinary log of the positive real Gamma function.
-/

/- Specification: R0/log-radius-series
Declaration: The odd-zeta radius series
Statement: For every integer N≥2, log γ_N=(log 16)/N+Σ_{k≥1}(2^(2k)−1)ζ(2k+1)/(2^(2k−1)(2k+1)N^(2k+1)), with an absolutely convergent series of positive terms.
-/

/- Specification: R0/positive-radius-expansion
Declaration: The positive radius expansion
Statement: For N≥2 write γ_N=16^(1/N)(1+ζ(3)/(2N³)+3ζ(5)/(8N⁵)+E_N). Then E_N>0 and there is an absolute effectively computable C with E_N≤C/N⁶. Consequently this is the positive O(N⁻⁶) remainder of CDT (5.1.6).
-/

/- Specification: F0/ideal-polygon
Declaration: The symmetric ideal polygon
Statement: For N≥2 the deck group Γ_N of F_N has the ideal 2N-gon centred at zero with vertices exp(πik/N), k=0,…,2N−1, as a Dirichlet fundamental domain. Its sides join adjacent vertices by hyperbolic geodesics; the prescribed side pairings recover the roots-of-unity quotient.
-/

/- Specification: F0/primitive-cusp-width
Declaration: The primitive cusp translation
Statement: The full stabilizer of i∞ in Γ̃_N is generated by τ↦τ+h_N where h_N=2cot(π/(2N))>0. This is the primitive positive generator in the chosen normalized cusp datum.
-/

/- Specification: F0/free-deck-presentation
Declaration: The free deck-group presentation
Statement: Γ̃_N is free of rank N on t̃_N and r̃_N^k t̃_N r̃_N^(−k), k=1,…,N−1, where t̃_N is the primitive cusp translation. The projective rotation r̃_N has order N but is not a nontrivial element of the torsion-free deck group.
-/


/- Specification: F0/quadrilateral-domain
Declaration: The fundamental quadrilateral
Statement: The fundamental domain of Φ_N is the hyperbolic quadrilateral with vertices 0,exp(−πi/N),1,exp(πi/N), in that cyclic order. Its half-plane image has vertices i,−cot(π/(2N)),i∞,cot(π/(2N)), up to boundary orientation, and area 2π−2π/N.
-/


/- Specification: V0/disc-counting
For f meromorphic on 𝔻 and 0<r<1 set D_r=−min(divisor(f,closedBall(0,r)),0), the negative part of the native integer local divisor. Define N_D(r,f)=Σᶠ_a D_r(a)log(r·|a|⁻¹)+D_r(0)log r. Native totalized log makes the summand at a=0 zero; the separate centre term restores its pole weight. Poles on |a|=r have weight zero. No extension of the disc divisor to a globally locally finite divisor is required.
-/

/- Specification: V0/disc-characteristic
For f meromorphic on 𝔻 and 0<r<1 define T_D(r,f)=ValueDistribution.proximity f ∞ r+N_D(r,f). Reuse the native proximity function exactly. The local divisor wrapper is the only change from the native global characteristic; do not assert nonnegativity for a general centre pole or manufacture a global meromorphic extension.
-/


/- Specification: V0/power-law
Declaration: The local characteristic power law
Statement: For f meromorphic on 𝔻, n∈ℕ and 0<r<1, T_D(r,f^n)=nT_D(r,f). For n=0 both sides are zero. Pole and zero multiplicities and positive log norms scale by n.
-/


/- Specification: G0/uniform-ratio-asymptotic
Declaration: Uniform cusp asymptotics of the inverse ratio
Statement: For M₀>0 there is C(M₀) such that for all N≥2, M≥M₀ and 0<|x|<e^(−MN), on a compatible logarithmic branch, |s_N(1−x)/γ_N−(1−x)^(1/N)(−log x−2γ−2ψ(a_+))/(−log x−2γ−2ψ(a_−))|≤C(M₀)|x|/N. Here γ is Euler’s constant and a_±=(N±1)/(2N).
-/

/- Specification: G0/cusp-height
Declaration: Height near a small cusp value
Statement: For M₀>0 and 0<ε<1, there is an effective N₀(ε,M₀) such that, for N≥N₀, M≥M₀ and τ in the fundamental quadrilateral Ω̃′_N, |F̃_N(τ)^N−1|<e^(−MN) implies Im τ>2N²M(1−ε)/π².
-/


/- Specification: G0/exceptional-set-exclusion
Declaration: Excluding the cusp horoballs
Statement: There are effective absolute A,N₀ such that for all N≥N₀, 0<r<1 and M=N/(1−r), neither S(M,N) nor sS(M,N) meets the closed radius-r disc. All the translated horoballs have diameter ≤A(1−r)/N<1−r after increasing N₀.
-/


/- Specification: M0/pivot-map
For N≥2 set p_N(x)=x^N/(x^N−1) on ℂ∖μ_N. Its companion maps are q_N(x)=x^N and u_N(x)=1/(x^N−1), with p_N=1+u_N. The native rational expression can be totalized at roots, but all analytic statements retain the omitted-root guard.
-/


/- Specification: M0/finite-level-completion
Declaration: Completing the finitely many small levels
Statement: Given the large-N effective constants C,N₀ and effective fixed-level constants C_N for 2≤N<N₀, the maximum of C and that finite list is an effective absolute constant proving T_D(r,F_N^N)≤C*log(N/(1−r)) for every N≥2 and 0<r<1.
-/


/- Specification: U0/projective-deck-realization
Declaration: Projective realization of analytic deck transformations
Statement: For a connected hyperbolic plane domain Ω and a pointed holomorphic universal cover F:𝔻→Ω, its existing topological deck transformations are holomorphic disc automorphisms. Conjugation through C identifies their action with a discrete subgroup of PSL₂(ℝ), acting freely on ℍ, and the analytic quotient is Ω. For a finite punctured plane this is its Fuchsian covering group.
-/

/- Scalar representative example: zero local pole count alone does not imply
pointwise analyticity of an arbitrary meromorphic scalar representative. -/
open Filter Set Metric
open scoped Topology
noncomputable section
namespace TauCeti.ConformalPartII.ScalarRepresentative
def spike (z : ℂ) : ℂ := if z = 0 then 2 else 1

lemma spike_germ (x : ℂ) : spike =ᶠ[𝓝[≠] x] (fun _ ↦ (1 : ℂ)) := by
  by_cases hx : x = 0
  · subst x
    filter_upwards [self_mem_nhdsWithin] with z hz
    have hz' : z ≠ 0 := by simpa using hz
    simp [spike, hz']
  · have h0 : ({0}ᶜ : Set ℂ) ∈ 𝓝 x := isOpen_compl_singleton.mem_nhds (by simpa)
    filter_upwards [nhdsWithin_le_nhds h0] with z hz
    have hz' : z ≠ 0 := by simpa using hz
    simp [spike, hz']

lemma spike_meromorphic : Meromorphic spike := by
  intro x
  exact (MeromorphicAt.const (1 : ℂ) x).congr (spike_germ x).symm

lemma spike_order (x : ℂ) : meromorphicOrderAt spike x = 0 := by
  rw [meromorphicOrderAt_congr (spike_germ x), meromorphicOrderAt_const]
  simp

lemma spike_divisor (U : Set ℂ) : MeromorphicOn.divisor spike U = 0 := by
  ext z
  simp [MeromorphicOn.divisor_def, spike_order]

lemma spike_counting (r : ℝ) :
    (let D : ℂ → ℝ := fun z ↦
      ((max 0 (-MeromorphicOn.divisor spike (closedBall 0 r) z) : ℤ) : ℝ)
     (∑ᶠ z, D z * Real.log (r * ‖z‖⁻¹)) + D 0 * Real.log r) = 0 := by
  simp [spike_divisor]

lemma spike_not_continuous : ¬ ContinuousAt spike 0 := by
  intro hc
  have h1 : Tendsto spike (𝓝[≠] (0 : ℂ)) (𝓝 (1 : ℂ)) :=
    tendsto_const_nhds.congr' (spike_germ 0).symm
  have h2 : Tendsto spike (𝓝[≠] (0 : ℂ)) (𝓝 (2 : ℂ)) := by
    simpa [spike] using hc.continuousWithinAt.tendsto
  have bad := tendsto_nhds_unique h1 h2
  norm_num at bad

lemma spike_not_analytic : ¬ AnalyticAt ℂ spike 0 :=
  fun h ↦ spike_not_continuous h.continuousAt
end TauCeti.ConformalPartII.ScalarRepresentative
