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
reviewers converge on names and signatures. Every proof below is admitted;
successful elaboration certifies types, not mathematical correctness.

The native prototypes use the recorded Mathlib pin. The exact Tau Ceti source
pin has no matching compiled build here. Each omitted declaration, API and test
is recorded individually with its full mathematical specification. No missing
analytic or geometric carrier is replaced by proposition-valued data.

The Schwarzian follows the iterated-derivative expression of the open Mathlib
proposal #24161, independently stated here at the pinned baseline.
-/

open scoped BigOperators
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
/- Individually omitted API TauCeti.ConformalPartII.blaschkeFactor.discAutomorphism:
For a,z in Complex.UnitDisc, the scalar factor equals the coercion of
TauCeti.unitDiscMoebius a z. The new wrapper extends only boundary parameters.
The exact pinned Tau Ceti carrier comparison has no matching compiled build.
-/
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

/- Omitted ConformalMappingPartII:O0/linear-equation
The complex analytic ODE and germ/basis interfaces are unresolved; their full mathematical statements are recorded without fabricated carriers.
Declaration: Analytic complex linear differential equations
Statement: For a connected open Ω⊆ℂ and n≥1, an analytic monic linear equation is y^(n)+Σ_{j<n} a_j y^(j)=0 with each a_j holomorphic on Ω; its initial-value map at x₀∈Ω records the n derivatives 0 through n−1. The corresponding companion first-order system is over ℂ, with complex-analytic coefficients.
API TauCeti.ConformalPartII.LinearEquation.mk: An analytic family a_j on Ω constructs the monic order-n equation.
API TauCeti.ConformalPartII.LinearEquation.initialJet: At x₀∈Ω a solution has jet (y(x₀),…,y^(n−1)(x₀))∈ℂ^n.
API TauCeti.ConformalPartII.LinearEquation.companion: Solutions correspond to analytic solutions of the companion first-order system, preserving the initial jet.
Test TauCeti.ConformalPartII.LinearEquation.orderOneZero (computation): For n=1 and a₀=0, solutions on a connected Ω are constants.
Test TauCeti.ConformalPartII.LinearEquation.secondOrderZero (compatibility): For n=2 with zero coefficients, solutions are affine functions and their initial jet is (y(x₀),y′(x₀)).
Test TauCeti.ConformalPartII.LinearEquation.singularCoefficient (non-example): a₀(x)=1/x is not an analytic coefficient on a domain containing 0.
-/

/- Omitted ConformalMappingPartII:O0/initial-value-basis
The complex analytic ODE and germ/basis interfaces are unresolved; their full mathematical statements are recorded without fabricated carriers.
Declaration: Analytic linear initial-value theorem
Statement: For the equation above and x₀∈Ω, every complex initial jet has a unique holomorphic solution germ at x₀; the solution-germ space is linearly isomorphic to ℂ^n.
-/

/- Omitted ConformalMappingPartII:O0/path-continuation
The complex analytic ODE and germ/basis interfaces are unresolved; their full mathematical statements are recorded without fabricated carriers.
Declaration: Continuation of linear ODE solutions
Statement: On a connected open Ω, each local solution germ of an analytic monic order-n equation continues along every continuous path in Ω; continuation is in TauCeti.IsAnalyticContinuationAlong and preserves the differential equation.
-/

/- Omitted ConformalMappingPartII:O0/global-solution-dimension
The complex analytic ODE and germ/basis interfaces are unresolved; their full mathematical statements are recorded without fabricated carriers.
Declaration: Global solutions on simply connected domains
Statement: For a simply connected open Ω and analytic monic order-n equation, the space of holomorphic solutions on Ω has complex dimension n, and evaluation of the initial jet at any x₀∈Ω is a linear isomorphism.
-/

/- Omitted ConformalMappingPartII:O0/meromorphic-basis-monodromy
The complex analytic ODE and germ/basis interfaces are unresolved; their full mathematical statements are recorded without fabricated carriers.
Declaration: Meromorphic trivial local monodromy
Statement: At an isolated singular point α, the source phrase trivial local monodromy means that the full n-dimensional local solution space has a basis of single-valued functions meromorphic on a full neighbourhood of α. This includes finite pole orders; it is stronger than identity of the analytic continuation representation alone.
API TauCeti.ConformalPartII.MeromorphicBasisMonodromy.basis: The witness is a basis of the local solution space consisting of meromorphic germs at α.
API TauCeti.ConformalPartII.MeromorphicBasisMonodromy.finitePoleBound: A maximum of the finitely many pole orders bounds the pole order of every solution.
API TauCeti.ConformalPartII.MeromorphicBasisMonodromy.identityMonodromy: These meromorphic germs give identity analytic continuation around the puncture; the converse needs an additional regularity hypothesis.
Test TauCeti.ConformalPartII.MeromorphicBasisMonodromy.ordinaryPoint (degenerate): At an ordinary point an analytic basis satisfies the condition with pole bound zero.
Test TauCeti.ConformalPartII.MeromorphicBasisMonodromy.regularPole (computation): The order-one equation xy′+y=0 on a punctured disc has basis x⁻¹ and pole bound one.
Test TauCeti.ConformalPartII.MeromorphicBasisMonodromy.essentialSingularity (non-example): The equation x²y′+y=0 has the single-valued solution e^(1/x); identity topological monodromy does not give a meromorphic basis.
-/

/- Omitted ConformalMappingPartII:O0/simultaneous-pole-clearing
The complex analytic ODE and germ/basis interfaces are unresolved; their full mathematical statements are recorded without fabricated carriers.
Declaration: Simultaneous algebraic pole clearing
Statement: Let L have coefficients in ℚ̄(x), let α be an algebraic singular point with the meromorphic-basis condition, and let p∈ℚ̄(x) be nonconstant and regular at α. There is a nonzero q∈ℚ̄[t] such that q(p(x)) times every local solution is holomorphic at α. One can clear finitely many such singularities simultaneously. A rational polynomial requires a Galois-saturated set of algebraic images.
-/

/- Native ConformalMappingPartII:U0/cayley-coordinate
Define C(z)=i(1+z)/(1−z) on |z|<1 and C⁻¹(τ)=(τ−i)/(τ+i) on Im τ>0. These are inverse holomorphic maps, C(0)=i, and z→1 corresponds to the cusp at infinity; no value at the boundary point 1 is part of the interior map.
-/

/- Omitted ConformalMappingPartII:U0/cover-complex-structure
The exact Tau Ceti cover carrier needs its complex charts, hyperbolic uniformization and cusp normalization; the available compiled Tau Ceti tree has a different source commit.
Declaration: Complex charts on the topological cover
Statement: For a connected open Ω⊆ℂ and a base point a∈Ω, put the unique complex one-dimensional manifold structure on the existing TauCeti.UniversalCover a for which its projection to Ω is a local biholomorphism. Use inverse covering sheets as charts, so transition functions are restrictions of the identity on Ω.
API TauCeti.ConformalPartII.CoverComplexStructure.projection: The projection is the existing TauCeti.UniversalCover.proj.
API TauCeti.ConformalPartII.CoverComplexStructure.chart: Each covering sheet gives a holomorphic chart by the base plane coordinate.
API TauCeti.ConformalPartII.CoverComplexStructure.topologyComparison: The manifold topology equals the existing quotient topology of UniversalCover.
Test TauCeti.ConformalPartII.CoverComplexStructure.discCover (compatibility): For Ω=𝔻, the cover projection is a biholomorphism.
Test TauCeti.ConformalPartII.CoverComplexStructure.annulusCover (non-example): For a nontrivial annulus the projection is not injective.
Test TauCeti.ConformalPartII.CoverComplexStructure.sheetTransition (computation): On an overlap of two lifted plane-coordinate charts, the transition is the identity.
-/

/- Omitted ConformalMappingPartII:U0/hyperbolic-uniformization-input
The exact Tau Ceti cover carrier needs its complex charts, hyperbolic uniformization and cusp normalization; the available compiled Tau Ceti tree has a different source commit.
Declaration: Hyperbolic uniformization of the cover
Statement: For a connected open Ω⊆ℂ whose complement has at least two points, its analytic universal cover is biholomorphic to the unit disc. The plane and sphere alternatives of simply connected Riemann-surface uniformization must be excluded; the simply connected planar Riemann mapping theorem alone does not prove this assertion.
-/

/- Omitted ConformalMappingPartII:U0/pointed-cover-uniqueness
The exact Tau Ceti cover carrier needs its complex charts, hyperbolic uniformization and cusp normalization; the available compiled Tau Ceti tree has a different source commit.
Declaration: Pointed analytic cover uniqueness
Statement: Two holomorphic universal covers F,G:𝔻→Ω with F(0)=G(0)=a are related by a unique disc automorphism fixing 0, hence by a rotation. Their derivatives at 0 have equal norms. A disc map into Ω fixing a lifts uniquely through F after choosing its lift at 0.
-/

/- Omitted ConformalMappingPartII:U0/conformal-radius
The exact Tau Ceti cover carrier needs its complex charts, hyperbolic uniformization and cusp normalization; the available compiled Tau Ceti tree has a different source commit.
Declaration: The pointed conformal radius
Statement: For a connected hyperbolic plane domain Ω and a∈Ω, define R(Ω,a)=|F′(0)| for any holomorphic universal cover F:𝔻→Ω with F(0)=a. The positive real number is independent of the cover. If an open set is disconnected, apply this construction to the connected component containing a, never to a nonsurjective cover of the whole set.
API TauCeti.ConformalPartII.conformalRadius.coverDerivative: R(Ω,a)=|F′(0)| for every pointed holomorphic universal cover.
API TauCeti.ConformalPartII.conformalRadius.positive: R(Ω,a)>0.
API TauCeti.ConformalPartII.conformalRadius.riemannMap: If Ω is simply connected and φ is the normalized Tau Ceti map Ω→𝔻 at a, then R(Ω,a)=1/|φ′(a)|.
API TauCeti.ConformalPartII.conformalRadius.affineChange: For b≠0, R(bΩ+c,ba+c)=|b|R(Ω,a).
Test TauCeti.ConformalPartII.conformalRadius.unitDisc (computation): R(𝔻,0)=1.
Test TauCeti.ConformalPartII.conformalRadius.radiusTwo (computation): R(D(0,2),0)=2.
Test TauCeti.ConformalPartII.conformalRadius.oncePuncturedPlane (non-example): ℂ∖{0} does not satisfy the two-omitted-point hyperbolic-domain hypothesis.
-/

/- Omitted ConformalMappingPartII:U0/radius-schwarz
The exact Tau Ceti cover carrier needs its complex charts, hyperbolic uniformization and cusp normalization; the available compiled Tau Ceti tree has a different source commit.
Declaration: Extremality of the pointed cover
Statement: For a pointed holomorphic universal cover F:𝔻→Ω and a holomorphic φ:𝔻→Ω with φ(0)=F(0)=a, |φ′(0)|≤R(Ω,a). Equality holds exactly when the based lift of φ is a rotation, equivalently when φ is a holomorphic universal cover.
-/

/- Omitted ConformalMappingPartII:U0/radius-monotone
The exact Tau Ceti cover carrier needs its complex charts, hyperbolic uniformization and cusp normalization; the available compiled Tau Ceti tree has a different source commit.
Declaration: Monotonicity of conformal radius
Statement: For connected hyperbolic domains Ω⊆Ω′ and a∈Ω, R(Ω,a)≤R(Ω′,a). Apply the preceding extremal inequality to the pointed covering of Ω followed by inclusion.
-/

/- Omitted ConformalMappingPartII:U0/roots-cover
The exact Tau Ceti cover carrier needs its complex charts, hyperbolic uniformization and cusp normalization; the available compiled Tau Ceti tree has a different source commit.
Declaration: The normalized roots-of-unity covering
Statement: For an integer N≥2 choose a holomorphic universal cover F_N:𝔻→ℂ∖μ_N with F_N(0)=0. For the explicit inverse-germ calculations orient it with F_N′(0)>0 real. Its half-plane form is F̃_N=F_N∘C⁻¹; the standard cusp chart is chosen so that its limit at i∞ is 1. The notation F_N(1)=1 denotes that cusp limit, not evaluation in the disc.
API TauCeti.ConformalPartII.RootsCover.mapZero: F_N(0)=0.
API TauCeti.ConformalPartII.RootsCover.omitsRoots: For |z|<1 and ζ^N=1, F_N(z)≠ζ.
API TauCeti.ConformalPartII.RootsCover.halfPlane: F̃_N(C(z))=F_N(z) on the disc.
API TauCeti.ConformalPartII.RootsCover.derivativeOrientation: The oriented cover has F_N′(0)>0 real; changes of source rotation preserve its norm.
Test TauCeti.ConformalPartII.RootsCover.twoRoots (computation): For N=2 the target is ℂ∖{−1,1}.
Test TauCeti.ConformalPartII.RootsCover.zeroNotOmitted (degenerate): 0 is in the target and its chosen preimage is 0.
Test TauCeti.ConformalPartII.RootsCover.boundaryLimit (non-example): F_N(1)=1 is a cusp limit and 1 is omitted from all interior values.
-/

/- Omitted ConformalMappingPartII:U0/cover-etale
The exact Tau Ceti cover carrier needs its complex charts, hyperbolic uniformization and cusp normalization; the available compiled Tau Ceti tree has a different source commit.
Declaration: Nonvanishing derivative of the cover
Statement: For every N≥2 and |z|<1, F_N′(z)≠0. A holomorphic covering between one-dimensional complex manifolds is a local biholomorphism, hence has nonzero complex derivative.
-/

/- Omitted ConformalMappingPartII:U0/rotation-equivariance
The exact Tau Ceti cover carrier needs its complex charts, hyperbolic uniformization and cusp normalization; the available compiled Tau Ceti tree has a different source commit.
Declaration: Rotation equivariance of the covering
Statement: For N≥2 and ζ^N=1, F_N(ζz)=ζF_N(z) for |z|<1. In the half-plane, multiplication by ζ_N corresponds to r̃_N=[cos(π/N),−sin(π/N);sin(π/N),cos(π/N)] in the projective group, of order N.
-/

/- Omitted ConformalMappingPartII:U0/power-descent
The exact Tau Ceti cover carrier needs its complex charts, hyperbolic uniformization and cusp normalization; the available compiled Tau Ceti tree has a different source commit.
Declaration: The descended power map
Statement: For N≥2 there is a unique holomorphic G_N:𝔻→ℂ∖{1} with G_N(z^N)=F_N(z)^N. Define it by root descent and remove the apparent root ambiguity using equivariance; G_N(0)=0. It is ramified at the lifts of zero other than the chosen local branch and is not asserted to be a universal covering.
API TauCeti.ConformalPartII.PowerDescent.rootEquation: G_N(z^N)=F_N(z)^N for |z|<1.
API TauCeti.ConformalPartII.PowerDescent.mapZero: G_N(0)=0.
API TauCeti.ConformalPartII.PowerDescent.derivative: G_N′(0)=F_N′(0)^N; consequently |G_N′(0)|=R(ℂ∖μ_N,0)^N.
API TauCeti.ConformalPartII.PowerDescent.rootIndependence: Any two Nth roots of an input give identical defining values.
Test TauCeti.ConformalPartII.PowerDescent.localCoefficient (computation): If F_N(z)=az+O(z^(N+1)), then G_N(w)=a^Nw+O(w²).
Test TauCeti.ConformalPartII.PowerDescent.zero (degenerate): The local inverse exists at 0 because a≠0.
Test TauCeti.ConformalPartII.PowerDescent.negativeRoot (compatibility): For N=2, choosing z or −z gives the same G_2(z²).
-/

/- Omitted ConformalMappingPartII:U0/descent-derivative
The exact Tau Ceti cover carrier needs its complex charts, hyperbolic uniformization and cusp normalization; the available compiled Tau Ceti tree has a different source commit.
Declaration: Derivative of the descended power map
Statement: G_N′(0)=F_N′(0)^N and |G_N′(0)|=|F_N′(0)|^N for N≥2.
-/

/- Native ConformalMappingPartII:S0/schwarzian
For a holomorphic f with f′≠0 on an open set, define S(f)(x)=f‴(x)/f′(x)−(3/2)(f″(x)/f′(x))². This equals (f″/f′)′−(1/2)(f″/f′)². The totalized native derivative expression carries no Schwarzian claims at points where f′=0.
-/

/- Native ConformalMappingPartII:S0/schwarzian-chain
For holomorphic f,g near x, with g′(x)≠0 and f′(g(x))≠0, S(f∘g)(x)=S(f)(g(x))g′(x)²+S(g)(x).
-/

/- Omitted ConformalMappingPartII:S0/moebius-invariance
The analytic inverse-cover/branch and Hempel interfaces are unresolved; the native Schwarzian expression alone does not state those geometric results.
Declaration: Möbius invariance of the Schwarzian
Statement: For ad−bc≠0 and M(w)=(aw+b)/(cw+d), S(M∘f)=S(f) where f is locally univalent and cf+d≠0. A branch change of the inverse of a holomorphic cover is a projective transformation, so its Schwarzian is branch-independent.
-/

/- Omitted ConformalMappingPartII:S0/quotient-ode
The analytic inverse-cover/branch and Hempel interfaces are unresolved; the native Schwarzian expression alone does not state those geometric results.
Declaration: The Schwarzian differential equation
Statement: On a sufficiently small simply connected neighbourhood where w′≠0, choose an analytic square root of w′. Then v₁=w/√w′ and v₂=1/√w′ are independent solutions of y″+(1/2)S(w)y=0 and w=v₁/v₂. Conversely a quotient of independent solutions of y″+Qy=0 has Schwarzian 2Q wherever its denominator is nonzero.
-/

/- Omitted ConformalMappingPartII:S0/hempel-rational
The analytic inverse-cover/branch and Hempel interfaces are unresolved; the native Schwarzian expression alone does not state those geometric results.
Declaration: Hempel’s accessory-parameter formula
Statement: Let S={p₀,…,p_N}⊂ℂ consist of distinct finite points, |S|≥3; thus infinity is unpunctured in ℙ¹∖S. For a local inverse τ of its holomorphic universal cover, S(τ)(X)=(1/2)Σ_k(X−p_k)⁻²+Σ_k m_k/(X−p_k) for constants m_k. The branch-independent Schwarzian is rational and has the stated principal parts.
-/

/- Omitted ConformalMappingPartII:S0/accessory-constraints
The analytic inverse-cover/branch and Hempel interfaces are unresolved; the native Schwarzian expression alone does not state those geometric results.
Declaration: Accessory-parameter constraints at infinity
Statement: With Hempel’s finite set S and infinity unpunctured, Σ m_k=0, Σ(2m_kp_k+1)=0, and Σ(m_kp_k²+p_k)=0. These are exactly cancellation of the X⁻¹, X⁻² and X⁻³ coefficients, so the Schwarzian is O(X⁻⁴) at infinity.
-/

/- Omitted ConformalMappingPartII:S0/symmetric-accessory
The analytic inverse-cover/branch and Hempel interfaces are unresolved; the native Schwarzian expression alone does not state those geometric results.
Declaration: Accessory parameters for the symmetric punctures
Statement: For the companion cover 1/F̃_N of ℙ¹∖({0}∪μ_N), in coordinate X its accessory parameters are m₀=0 and m_k=−(1/2+1/(2N))ζ_N^(−k), k=1,…,N. Rotational symmetry and the three infinity constraints determine them.
-/

/- Omitted ConformalMappingPartII:S0/roots-schwarzian
The analytic inverse-cover/branch and Hempel interfaces are unresolved; the native Schwarzian expression alone does not state those geometric results.
Declaration: The rational Schwarzian for the roots cover
Statement: For the local inverse ψ_N of F_N, S(ψ_N)(x)=((N²−1)x^(N−2)+x^(2N−2))/(2(x^N−1)²) near zero. Obtain this by changing the companion coordinate X=1/x; S(1/x)=0 and the squared derivative factor is essential.
-/

/- Omitted ConformalMappingPartII:S0/roots-inverse-ode
The analytic inverse-cover/branch and Hempel interfaces are unresolved; the native Schwarzian expression alone does not state those geometric results.
Declaration: The linear equation of the inverse covering
Statement: For N≥2 the local inverse ψ_N fixing zero is a quotient η₁/η₂ of independent solutions of 4(x^N−1)²y″+((N²−1)x^(N−2)+x^(2N−2))y=0. Choose the quotient normalization to agree with the actual inverse germ; an arbitrary basis gives it only up to a Möbius map.
-/

/- Native ConformalMappingPartII:L0/blaschke-factor
For |a|≤1 define b_a(z)=(z−a)/(1−āz) if |a|<1, and b_a(z)=−a if |a|=1. The boundary formula is the removable extension of the same rational expression; it has no zero. The interior factor is the existing Tau Ceti unitDiscMoebius after coercion; the new wrapper adds only the removable boundary extension in CDT’s convention.
-/

/- Native ConformalMappingPartII:L0/finite-blaschke-product
For a finite family |a_i|≤1 and multiplicities n_i∈ℕ, set B(z)=∏_i b_(a_i)(z)^n_i, with the empty product equal to 1. It is holomorphic near the closed unit disc and has boundary modulus one. It maps the open disc into the closed disc; strict image in the open disc requires at least one positive multiplicity at an interior zero.
-/

/- Omitted ConformalMappingPartII:L0/blaschke-zero-removal
The actual analytic zero-removal, normalized logarithm and radial-smoothing interfaces remain to be established against the source and native API.
Declaration: Removing zeros with a finite Blaschke product
Statement: Let g be holomorphic near the closed unit disc and not identically zero. Form B from all its zeros in the closed disc with their orders. After removal of singularities, G=g/B is holomorphic and zero-free on the open disc and has |G|=|g| on the circle wherever the boundary quotients are interpreted by limits. Boundary zeros of g need not disappear from G, because boundary factors are constants.
-/

/- Omitted ConformalMappingPartII:L0/herglotz-log
The actual analytic zero-removal, normalized logarithm and radial-smoothing interfaces remain to be established against the source and native API.
Declaration: Herglotz representation of a normalized logarithm
Statement: For R>0 and g holomorphic and zero-free on a neighbourhood of the closed disc |z|≤R, with g(0)=1, choose the unique analytic log L with L(0)=0. For |z|<R, L(z)=∫_(|w|=R) log|g(w)|(w+z)/(w−z) dμ_Haar(w).
-/

/- Omitted ConformalMappingPartII:L0/herglotz-derivative
The actual analytic zero-removal, normalized logarithm and radial-smoothing interfaces remain to be established against the source and native API.
Declaration: The derivative Herglotz formula
Statement: Under the preceding normalized zero-free hypotheses, for |z|<R, g′(z)/g(z)=∫_(|w|=R) 2w log|g(w)|/(w−z)² dμ_Haar(w). The differentiated identity also holds without g(0)=1 after normalizing by g(0).
-/

/- Omitted ConformalMappingPartII:L0/quotient-phase
The actual analytic zero-removal, normalized logarithm and radial-smoothing interfaces remain to be established against the source and native API.
Declaration: The phase in the complex quotient identity
Statement: For a zero-free holomorphic G near the closed disc of radius r>0, exp(∫ log|G(w)|(w+z)/(w−z)dμ)=G(z)|G(0)|/G(0) for |z|<r. Thus a complex quotient formula reconstructing G requires the constant phase G(0)/|G(0)|; a formula of absolute values does not.
-/

/- Omitted ConformalMappingPartII:L0/radial-smoothing
The actual analytic zero-removal, normalized logarithm and radial-smoothing interfaces remain to be established against the source and native API.
Declaration: Radial smoothing of the quotient multiplier
Statement: If g is holomorphic near the closed unit disc, the radius-r Blaschke/Herglotz construction for r>1 sufficiently close to 1 gives a multiplier h holomorphic on a neighbourhood of the closed unit disc with h(0)=1. The resulting boundary bounds converge to m(1,g) as r decreases to 1, including boundary zeros by integrable logarithmic control.
-/

/- Omitted ConformalMappingPartII:L0/quotient-representation
The actual analytic zero-removal, normalized logarithm and radial-smoothing interfaces remain to be established against the source and native API.
Declaration: Nevanlinna’s quotient representation
Statement: For ε>0 and g holomorphic near the closed unit disc, there is h holomorphic near that disc with h(0)=1 and max{sup_(|z|=1) log|h(z)|,sup_(|z|=1) log|h(z)g(z)|}≤m(1,g)+ε. The zero function g is handled separately. Use logarithmic suprema, not suprema of |h|.
-/

/- Omitted ConformalMappingPartII:L0/quotient-lower-bound
The actual analytic zero-removal, normalized logarithm and radial-smoothing interfaces remain to be established against the source and native API.
Declaration: Optimality of the quotient bound
Statement: If g,h are holomorphic near the closed unit disc and h(0)=1, then m(1,g)≤max{sup_(|z|=1) log|h(z)|,sup_(|z|=1) log|h(z)g(z)|}. This is the lower bound in Remark 2.3.3; use the a.e. logarithmic identity across isolated zeros.
-/

/- Omitted ConformalMappingPartII:H0/gauss-equation
The continued hypergeometric branches and uniform parameter estimates are not supplied by the native totalized power-series function.
Declaration: The Gauss hypergeometric equation
Statement: For parameters a,b,c with none of a,b,c a nonpositive integer and |x|<1, the native ₂F₁(a,b;c;x) satisfies x(1−x)y″+(c−(a+b+1)x)y′−aby=0. The value and first Taylor coefficient at 0 are 1 and ab/c. Use analytic differentiation of the convergent native series, not its junk values outside radius one.
-/

/- Omitted ConformalMappingPartII:H0/transformed-equation
The continued hypergeometric branches and uniform parameter estimates are not supplied by the native totalized power-series function.
Declaration: The descended inverse differential equation
Statement: After x=u^N the two solutions η_i(u) of the roots inverse equation give φ_i(x)=η_i(x^(1/N)) on a compatible punctured branch, satisfying x(x−1)²φ″+(1−1/N)(x−1)²φ′+(1/4+(x−1)/(4N²))φ=0.
-/

/- Omitted ConformalMappingPartII:H0/special-solutions
The continued hypergeometric branches and uniform parameter estimates are not supplied by the native totalized power-series function.
Declaration: The two hypergeometric solutions
Statement: Let a_±=(N±1)/(2N). On compatible branches near a punctured zero, √(1−x)x^(1/N)₂F₁(a_+,a_+;2a_+;x) and √(1−x)₂F₁(a_−,a_−;2a_−;x) solve the transformed equation. Their leading terms x^(1/N) and 1 match the normalized η₁,η₂ after substituting x=u^N.
-/

/- Native ConformalMappingPartII:H0/inverse-ratio-germ
For N≥2 set J_N(u)=u·₂F₁(a_+,a_+;2a_+;u^N)/₂F₁(a_−,a_−;2a_−;u^N) near u=0, where a_±=(N±1)/(2N). The denominator is 1 at zero. Thus J_N is holomorphic with J_N(0)=0 and J_N′(0)=1. Its expression is a genuine analytic germ and avoids an unjustified global principal-root identity.
-/

/- Omitted ConformalMappingPartII:H0/inverse-germ-match
The continued hypergeometric branches and uniform parameter estimates are not supplied by the native totalized power-series function.
Declaration: Matching the actual covering inverse
Statement: For the oriented cover with F_N′(0)>0, ψ_N(u)=|F_N′(0)|⁻¹J_N(u) as germs at zero. The inverse of G_N is φ_N(x)=|F_N′(0)|^(−N)x(₂F₁(a_+,a_+;2a_+;x)/₂F₁(a_−,a_−;2a_−;x))^N. For an unoriented cover replace the real prefactor by F_N′(0)⁻¹ and its Nth power.
-/

/- Omitted ConformalMappingPartII:H0/zero-balanced-continuation
The continued hypergeometric branches and uniform parameter estimates are not supplied by the native totalized power-series function.
Declaration: Zero-balanced hypergeometric continuation
Statement: For positive real a and 0<|x|<1 on a fixed compatible branch of log x, the analytic continuation of ₂F₁(a,a;2a;1−x) equals Γ(2a)/Γ(a)² times Σ_{k≥0}(a)_k² x^k/(k!)²·(−log x+2(ψ(k+1)−ψ(k+a))). This refers to the continued analytic function, not the native series junk value outside its disc. The proof needs only a∈[1/4,3/4]. A more general finite-valued parameter statement must also exclude poles of 2a.
-/

/- Omitted ConformalMappingPartII:H0/digamma-difference-bound
The continued hypergeometric branches and uniform parameter estimates are not supplied by the native totalized power-series function.
Declaration: Uniform digamma coefficient control
Statement: For a∈[1/4,3/4] and k≥1, 0≤ψ(k+1)−ψ(k+a)≤ψ(2)−ψ(5/4), and the difference decreases in both k and a. This uses the corrected coefficient ψ(k+1)−ψ(k+a), not ψ(k)−ψ(k+a).
-/

/- Omitted ConformalMappingPartII:H0/pochhammer-remainder
The continued hypergeometric branches and uniform parameter estimates are not supplied by the native totalized power-series function.
Declaration: Uniform zero-balanced remainder
Statement: For a∈[1/4,3/4] and 0<|x|≤e^(−M₀N), N≥2, the k≥1 part of the zero-balanced series and its a-derivative have bounds uniform in a,N, with size O_{M₀}(|x|(1+|log x|)). The derivative control is required to gain the factor 1/N when comparing a_+ and a_−.
-/

/- Native ConformalMappingPartII:R0/gamma-radius
For N≥2 define γ_N=16^(1/N)Γ(1+1/(2N))²Γ(1−1/N)/(Γ(1−1/(2N))²Γ(1+1/N)), using the native real Gamma function and positive real power. All Gamma arguments are positive. A totalized arithmetic expression outside N≥2 is not assigned a uniformization interpretation.
-/

/- Omitted ConformalMappingPartII:R0/gamma-positive
The continued inverse-germ limit, log-Gamma branch and zeta-series remainder are unresolved; the native Gamma arithmetic expression does not prove them.
Declaration: Positivity of the Gamma radius
Statement: For every N≥2, γ_N>0 and every Gamma factor in its denominator is nonzero.
-/

/- Omitted ConformalMappingPartII:R0/gamma-alternative
The continued inverse-germ limit, log-Gamma branch and zeta-series remainder are unresolved; the native Gamma arithmetic expression does not prove them.
Declaration: The alternative Gamma expression
Statement: For N≥2, γ_N=Γ((N−1)/(2N))²Γ(1+1/N)/(Γ((N+1)/(2N))²Γ(1−1/N)).
-/

/- Omitted ConformalMappingPartII:R0/cusp-ratio-limit
The continued inverse-germ limit, log-Gamma branch and zeta-series remainder are unresolved; the native Gamma arithmetic expression does not prove them.
Declaration: The boundary limit of the inverse ratio
Statement: Along the compatible real branch x→1 from below, the ratio s_N(x)=x^(1/N)₂F₁(a_+,a_+;2a_+;x)/₂F₁(a_−,a_−;2a_−;x) tends to Γ(1+1/N)Γ(a_−)²/(Γ(1−1/N)Γ(a_+)²). The inverse cover approaches a boundary point of modulus one.
-/

/- Omitted ConformalMappingPartII:R0/conformal-radius-formula
The continued inverse-germ limit, log-Gamma branch and zeta-series remainder are unresolved; the native Gamma arithmetic expression does not prove them.
Declaration: The conformal radius of the punctured plane
Statement: For N≥2 and every holomorphic universal cover F_N:𝔻→ℂ∖μ_N with F_N(0)=0, |F_N′(0)|=R(ℂ∖μ_N,0)=γ_N. In particular |F_2′(0)|=Γ(1/4)^4/(4π²) and |F_3′(0)|=Γ(1/6)^3/(12π^(3/2)).
-/

/- Omitted ConformalMappingPartII:R0/log-gamma-taylor
The continued inverse-germ limit, log-Gamma branch and zeta-series remainder are unresolved; the native Gamma arithmetic expression does not prove them.
Declaration: The local log-Gamma Taylor series
Statement: For |z|<1, the analytic branch of log Γ(1+z) vanishing at z=0 is −γz+Σ_{k≥2}(−1)^kζ(k)z^k/k. For real −1<z<1 this is the ordinary log of the positive real Gamma function.
-/

/- Omitted ConformalMappingPartII:R0/log-radius-series
The continued inverse-germ limit, log-Gamma branch and zeta-series remainder are unresolved; the native Gamma arithmetic expression does not prove them.
Declaration: The odd-zeta radius series
Statement: For every integer N≥2, log γ_N=(log 16)/N+Σ_{k≥1}(2^(2k)−1)ζ(2k+1)/(2^(2k−1)(2k+1)N^(2k+1)), with an absolutely convergent series of positive terms.
-/

/- Omitted ConformalMappingPartII:R0/positive-radius-expansion
The continued inverse-germ limit, log-Gamma branch and zeta-series remainder are unresolved; the native Gamma arithmetic expression does not prove them.
Declaration: The positive radius expansion
Statement: For N≥2 write γ_N=16^(1/N)(1+ζ(3)/(2N³)+3ζ(5)/(8N⁵)+E_N). Then E_N>0 and there is an absolute effectively computable C with E_N≤C/N⁶. Consequently this is the positive O(N⁻⁶) remainder of CDT (5.1.6).
-/

/- Omitted ConformalMappingPartII:F0/ideal-polygon
The supplier’s actual projective action, polygons, cusp data and subgroup presentation must be used; no synthetic group carrier replaces them.
Declaration: The symmetric ideal polygon
Statement: For N≥2 the deck group Γ_N of F_N has the ideal 2N-gon centred at zero with vertices exp(πik/N), k=0,…,2N−1, as a Dirichlet fundamental domain. Its sides join adjacent vertices by hyperbolic geodesics; the prescribed side pairings recover the roots-of-unity quotient.
-/

/- Omitted ConformalMappingPartII:F0/primitive-cusp-width
The supplier’s actual projective action, polygons, cusp data and subgroup presentation must be used; no synthetic group carrier replaces them.
Declaration: The primitive cusp translation
Statement: The full stabilizer of i∞ in Γ̃_N is generated by τ↦τ+h_N where h_N=2cot(π/(2N))>0. This is the primitive positive generator in the chosen normalized cusp datum.
-/

/- Omitted ConformalMappingPartII:F0/free-deck-presentation
The supplier’s actual projective action, polygons, cusp data and subgroup presentation must be used; no synthetic group carrier replaces them.
Declaration: The free deck-group presentation
Statement: Γ̃_N is free of rank N on t̃_N and r̃_N^k t̃_N r̃_N^(−k), k=1,…,N−1, where t̃_N is the primitive cusp translation. The projective rotation r̃_N has order N but is not a nontrivial element of the torsion-free deck group.
-/

/- Omitted ConformalMappingPartII:F0/power-stabilizer-group
The supplier’s actual projective action, polygons, cusp data and subgroup presentation must be used; no synthetic group carrier replaces them.
Declaration: The power-map stabilizer group
Statement: Let Φ̃_N=⟨Γ̃_N,r̃_N⟩≤PSL₂(ℝ); by the deck presentation it equals ⟨r̃_N,t̃_N⟩. Its disc conjugate is Φ_N. The definition uses the existing projective action and subgroup closure; it is the paper-specific orientation-preserving (N,∞,∞) group, not a newly defined generic triangle-group theory.
API TauCeti.ConformalPartII.PowerStabilizer.containsDeck: Γ̃_N≤Φ̃_N.
API TauCeti.ConformalPartII.PowerStabilizer.generators: Φ̃_N=⟨r̃_N,t̃_N⟩.
API TauCeti.ConformalPartII.PowerStabilizer.discConjugate: Conjugation through C identifies the half-plane and disc actions.
API TauCeti.ConformalPartII.PowerStabilizer.deckIndex: [Φ̃_N:Γ̃_N]=N.
Test TauCeti.ConformalPartII.PowerStabilizer.two (computation): For N=2 the quotient Φ̃_2/Γ̃_2 has order two.
Test TauCeti.ConformalPartII.PowerStabilizer.rotationOrder (characterisation): The image of r̃_N in the quotient has exact order N.
Test TauCeti.ConformalPartII.PowerStabilizer.notDeck (non-example): For N≥2, r̃_N fixes i and is not a nontrivial deck transformation of the unramified cover.
-/

/- Omitted ConformalMappingPartII:F0/largest-power-stabilizer
The supplier’s actual projective action, polygons, cusp data and subgroup presentation must be used; no synthetic group carrier replaces them.
Declaration: The largest invariance group of the power cover
Statement: F̃_N^N is invariant under Φ̃_N, and any g∈PSL₂(ℝ) satisfying F̃_N(gτ)^N=F̃_N(τ)^N for all τ∈ℍ lies in Φ̃_N. Hence Φ̃_N is exactly its full orientation-preserving invariance group and is discrete.
-/

/- Omitted ConformalMappingPartII:F0/quadrilateral-domain
The supplier’s actual projective action, polygons, cusp data and subgroup presentation must be used; no synthetic group carrier replaces them.
Declaration: The fundamental quadrilateral
Statement: The fundamental domain of Φ_N is the hyperbolic quadrilateral with vertices 0,exp(−πi/N),1,exp(πi/N), in that cyclic order. Its half-plane image has vertices i,−cot(π/(2N)),i∞,cot(π/(2N)), up to boundary orientation, and area 2π−2π/N.
-/

/- Omitted ConformalMappingPartII:F0/half-rotation-involution
The supplier’s actual projective action, polygons, cusp data and subgroup presentation must be used; no synthetic group carrier replaces them.
Declaration: The half-rotation involution
Statement: Let s̃ be the rotation about i of projective order 2N satisfying s̃²=r̃_N, and let s be its disc conjugate. Then 1−F̃_N(s̃τ)^N=1/(1−F̃_N(τ)^N) for τ∈ℍ. All denominators are nonzero because the covering omits μ_N.
-/

/- Omitted ConformalMappingPartII:F0/index-two-supergroup
The supplier’s actual projective action, polygons, cusp data and subgroup presentation must be used; no synthetic group carrier replaces them.
Declaration: The index-two triangle supergroup
Statement: Set Ψ̃_N=⟨s̃,t̃_N⟩. Then Φ̃_N is normal of index two in Ψ̃_N, and a fundamental domain for the disc action is the geometric triangle with vertices 0,1,exp(πi/N) and angles π/N,0,0. Distinguish this geometric triangle from Φ̃_N’s (N,∞,∞) orbifold signature; the full reflection group is not a subgroup of PSL₂(ℝ).
API TauCeti.ConformalPartII.TriangleSupergroup.generators: Ψ̃_N is generated by s̃ and t̃_N.
API TauCeti.ConformalPartII.TriangleSupergroup.index: [Ψ̃_N:Φ̃_N]=2.
API TauCeti.ConformalPartII.TriangleSupergroup.triangle: The specified triangle is a measurable fundamental domain.
API TauCeti.ConformalPartII.TriangleSupergroup.orientation: This is the orientation-preserving projective action; reflection constructions are consumed through the existing triangle theory.
Test TauCeti.ConformalPartII.TriangleSupergroup.twoAreas (computation): For N=2 the Φ area is π and the Ψ area is π/2.
Test TauCeti.ConformalPartII.TriangleSupergroup.halfRotation (characterisation): The nontrivial coset is represented by s̃, whose square lies in Φ̃_N.
Test TauCeti.ConformalPartII.TriangleSupergroup.reflection (non-example): An antiholomorphic reflection is not an element of PSL₂(ℝ).
-/

/- Native ConformalMappingPartII:V0/disc-counting
For f meromorphic on 𝔻 and 0<r<1 set D_r=−min(divisor(f,closedBall(0,r)),0), the negative part of the native integer local divisor. Define N_D(r,f)=Σᶠ_a D_r(a)log(r·|a|⁻¹)+D_r(0)log r. Native totalized log makes the summand at a=0 zero; the separate centre term restores its pole weight. Poles on |a|=r have weight zero. No extension of the disc divisor to a globally locally finite divisor is required.
-/

/- Native ConformalMappingPartII:V0/disc-characteristic
For f meromorphic on 𝔻 and 0<r<1 define T_D(r,f)=ValueDistribution.proximity f ∞ r+N_D(r,f). Reuse the native proximity function exactly. The local divisor wrapper is the only change from the native global characteristic; do not assert nonnegativity for a general centre pole or manufacture a global meromorphic extension.
-/

/- Omitted ConformalMappingPartII:V0/counting-nonnegative
The actual localized divisor, boundary integration and trailing-coefficient proof interfaces remain open; native scalar definitions alone do not establish them.
Declaration: Pole-counting positivity at a regular centre
Statement: For f meromorphic on 𝔻 and regular at 0, N_D(r,f)≥0 whenever 0<r<1.
-/

/- Omitted ConformalMappingPartII:V0/zero-counting-criterion
The actual localized divisor, boundary integration and trailing-coefficient proof interfaces remain open; native scalar definitions alone do not establish them.
Declaration: Vanishing of the local pole count
Statement: For f meromorphic on 𝔻 and regular at 0, N_D(r,f)=0 iff f is holomorphic on the open disc |z|<r. A pole on |z|=r has zero weight and is permitted; no closed-disc holomorphicity is inferred.
-/

/- Omitted ConformalMappingPartII:V0/local-log-integrability
The actual localized divisor, boundary integration and trailing-coefficient proof interfaces remain open; native scalar definitions alone do not establish them.
Declaration: Local logarithmic circle integrability
Statement: For f meromorphic on a neighbourhood of the closed radius-r disc with a nonzero meromorphic germ, log|f| and log⁺|f| are circle-integrable. Isolated zeros and poles on the circle are interpreted almost everywhere; changes at their finite point set do not alter circle averages.
-/

/- Omitted ConformalMappingPartII:V0/local-jensen
The actual localized divisor, boundary integration and trailing-coefficient proof interfaces remain open; native scalar definitions alone do not establish them.
Declaration: The disc-local Jensen identity
Statement: For f meromorphic on 𝔻, with nonzero meromorphic germ at 0, and 0<r<1, ∫ log|f|dμ=N_D(r,1/f)−N_D(r,f)+log|c(f,0)|, where c(f,0) is the native nonzero meromorphic trailing coefficient at 0.
-/

/- Omitted ConformalMappingPartII:V0/local-first-main-inversion
The actual localized divisor, boundary integration and trailing-coefficient proof interfaces remain open; native scalar definitions alone do not establish them.
Declaration: The local first main inversion identity
Statement: For f meromorphic on 𝔻 with nonzero germ at 0 and 0<r<1, T_D(r,f)−T_D(r,1/f)=log|c(f,0)|. Neither global meromorphicity nor a regular centre is required; the trailing coefficient must be finite and nonzero.
-/

/- Omitted ConformalMappingPartII:V0/translation-proximity
The actual localized divisor, boundary integration and trailing-coefficient proof interfaces remain open; native scalar definitions alone do not establish them.
Declaration: Translation bound for proximity
Statement: For a∈ℂ and circle-integrable local meromorphic f, |m(r,f−a)−m(r,f)|≤log⁺|a|+log 2. This follows from the pointwise positive-log triangle bound, including zeros via totalized log⁺.
-/

/- Omitted ConformalMappingPartII:V0/local-first-main-translation
The actual localized divisor, boundary integration and trailing-coefficient proof interfaces remain open; native scalar definitions alone do not establish them.
Declaration: The translated local first main theorem
Statement: For f meromorphic on 𝔻 with f−a having a nonzero germ at 0, and 0<r<1, |T_D(r,f)−T_D(r,1/(f−a))−log|c(f,a)||≤log⁺|a|+log 2. The coefficient is the nonzero leading meromorphic coefficient of f−a; the identically constant f=a case is excluded.
-/

/- Omitted ConformalMappingPartII:V0/power-law
The actual localized divisor, boundary integration and trailing-coefficient proof interfaces remain open; native scalar definitions alone do not establish them.
Declaration: The local characteristic power law
Statement: For f meromorphic on 𝔻, n∈ℕ and 0<r<1, T_D(r,f^n)=nT_D(r,f). For n=0 both sides are zero. Pole and zero multiplicities and positive log norms scale by n.
-/

/- Omitted ConformalMappingPartII:V0/holomorphic-proximity-monotone
The actual localized divisor, boundary integration and trailing-coefficient proof interfaces remain open; native scalar definitions alone do not establish them.
Declaration: Radial monotonicity of holomorphic proximity
Statement: For holomorphic h on 𝔻 and 0<r≤ρ<1, m(r,h)≤m(ρ,h). The positive log norm is subharmonic; this supplies the small-radius transfer used to remove 1/r from the logarithmic derivative estimate.
-/

/- Omitted ConformalMappingPartII:G0/uniform-ratio-asymptotic
The actual Φ group, quantitative Shimizu extension, cusp constants and horoball transport remain unresolved.
Declaration: Uniform cusp asymptotics of the inverse ratio
Statement: For M₀>0 there is C(M₀) such that for all N≥2, M≥M₀ and 0<|x|<e^(−MN), on a compatible logarithmic branch, |s_N(1−x)/γ_N−(1−x)^(1/N)(−log x−2γ−2ψ(a_+))/(−log x−2γ−2ψ(a_−))|≤C(M₀)|x|/N. Here γ is Euler’s constant and a_±=(N±1)/(2N).
-/

/- Omitted ConformalMappingPartII:G0/cusp-height
The actual Φ group, quantitative Shimizu extension, cusp constants and horoball transport remain unresolved.
Declaration: Height near a small cusp value
Statement: For M₀>0 and 0<ε<1, there is an effective N₀(ε,M₀) such that, for N≥N₀, M≥M₀ and τ in the fundamental quadrilateral Ω̃′_N, |F̃_N(τ)^N−1|<e^(−MN) implies Im τ>2N²M(1−ε)/π².
-/

/- Omitted ConformalMappingPartII:G0/horoball-diameter
The actual Φ group, quantitative Shimizu extension, cusp constants and horoball transport remain unresolved.
Declaration: Disc diameter of a transformed horoball
Statement: For D>0 and a projective real determinant-one matrix g=[a b;c d], C⁻¹(g{Im τ≥D}) is a disc tangent to the unit circle at (a−ic)/(a+ic), with Euclidean diameter E(g,D)=2/(1+D(a²+c²)). In particular E≤2/(D(a²+c²)).
-/

/- Omitted ConformalMappingPartII:G0/shimizu-specialization
The actual Φ group, quantitative Shimizu extension, cusp constants and horoball transport remain unresolved.
Declaration: Shimizu for the power-map group
Statement: For N≥2 and every determinant-one representative [a b;c d] of an element of the discrete group Φ̃_N, h_N(|a|+|c|)≥1, where h_N=2cot(π/(2N)). The generic supplier input is: in a discrete PSL₂(ℝ) group containing translation by h>0, every c≠0 satisfies |c|≥1/h.
-/

/- Omitted ConformalMappingPartII:G0/exceptional-cusp-set
The actual Φ group, quantitative Shimizu extension, cusp constants and horoball transport remain unresolved.
Declaration: The paper-specific exceptional cusp set
Statement: For N,M define S(M,N)={z∈𝔻:|F_N(z)^N−1|<e^(−MN)}. For sufficiently large N it is contained in the union of the Φ_N-translates of the cusp horoball with D comparable to N²M. Large values |F_N(z)|>e^M+1 lie in the rotated set sS(M,N), by the half-rotation involution.
API TauCeti.ConformalPartII.ExceptionalCuspSet.mem: z∈S(M,N) iff |F_N(z)^N−1|<e^(−MN).
API TauCeti.ConformalPartII.ExceptionalCuspSet.horoballContainment: For the source large-N threshold, S is contained in the specified Φ-translated cusp horoballs.
API TauCeti.ConformalPartII.ExceptionalCuspSet.rotatedLargeValues: |F_N(z)|>e^M+1 implies z∈sS(M,N).
API TauCeti.ConformalPartII.ExceptionalCuspSet.radiusInvariant: The source rotation s preserves |z|, so exclusion of S from |z|≤r also excludes sS.
Test TauCeti.ConformalPartII.ExceptionalCuspSet.origin (non-example): For M>0, 0∉S(M,N), since |F_N(0)^N−1|=1>e^(−MN).
Test TauCeti.ConformalPartII.ExceptionalCuspSet.rotationRadius (computation): For any z, |sz|=|z|.
Test TauCeti.ConformalPartII.ExceptionalCuspSet.largeValueThreshold (characterisation): If |F_N(z)|^N>1+e^(MN), then |1−F_N(s⁻¹z)^N|<e^(−MN).
-/

/- Omitted ConformalMappingPartII:G0/exceptional-set-exclusion
The actual Φ group, quantitative Shimizu extension, cusp constants and horoball transport remain unresolved.
Declaration: Excluding the cusp horoballs
Statement: There are effective absolute A,N₀ such that for all N≥N₀, 0<r<1 and M=N/(1−r), neither S(M,N) nor sS(M,N) meets the closed radius-r disc. All the translated horoballs have diameter ≤A(1−r)/N<1−r after increasing N₀.
-/

/- Omitted ConformalMappingPartII:G0/large-n-maximum-growth
The actual Φ group, quantitative Shimizu extension, cusp constants and horoball transport remain unresolved.
Declaration: The large-N maximum growth bound
Statement: There exist effectively computable absolute C,N₀ such that for all integers N≥N₀ and 0<r<1, sup_(|z|=r)log|F_N(z)|≤CN/(1−r). This is the large-N statement of Lemma 5.2.18; the proof does not establish it for every N≥2.
-/

/- Omitted ConformalMappingPartII:M0/inverse-square-kernel-mean
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: The inverse-square kernel mean
Statement: For 0<r<R and |w|=R, the normalized circle mean ∫_(|z|=r)|z−w|^(−2)dμ(z)=1/(R²−r²). This is the exact kernel integral used in the logarithmic-derivative proof.
-/

/- Omitted ConformalMappingPartII:M0/boundary-log-l1
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: Boundary L1 control of the logarithm
Statement: For g holomorphic and zero-free near the closed radius-R disc with g(0)=1, ∫_(|w|=R)|log|g(w)||dμ(w)=2m(R,g). The mean of log|g| is zero, so its positive and negative parts have equal means.
-/

/- Omitted ConformalMappingPartII:M0/entropy-log-mean
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: The logarithmic mean estimate
Statement: For nonnegative circle-integrable H and normalized Haar measure, ∫log⁺H≤log⁺(∫H)+1/e. Equivalently control the entropy of the region H≥1 before applying Jensen there; retain a harmless absolute constant if the measure-zero region occurs.
-/

/- Omitted ConformalMappingPartII:M0/normalized-log-derivative
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: The zero-free logarithmic derivative estimate
Statement: For g holomorphic and zero-free near the closed radius-R disc, g(0)=1 and 0<r<R, m(r,g′/g)≤log⁺((m(R,g)/r)·R/(R−r))+log 2+1/e. Use ≤ in the reusable signature; the source states the corresponding strict bound.
-/

/- Omitted ConformalMappingPartII:M0/small-radius-transfer
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: Uniform transfer from small radii
Statement: For 0<r<1 put ρ=max(r,1/4) and R=(1+r)/2. Then ρ≥1/4, ρ<R and R−ρ≥(1−r)/4. If h is holomorphic on 𝔻, m(r,h)≤m(ρ,h), allowing the log-derivative bound at ρ to remove its 1/r factor uniformly.
-/

/- Omitted ConformalMappingPartII:M0/power-log-derivative
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: The logarithmic derivative of the omitted-value function
Statement: Let f=1−F_N^N, N≥2, and 0<r<1. Set R=(1+r)/2 and L_N(r)=log(max(1,sup_(|z|=R)log⁺|F_N(z)|)). Then m(r,f′/f)≤C(log(N/(1−r))+L_N(r)) for an absolute effective C. f is zero-free and f(0)=1.
-/

/- Omitted ConformalMappingPartII:M0/inverse-cover-derivative
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: The covering derivative reciprocal bound
Statement: For N≥2 and 0<r<1, m(r,F_N/F_N′)≤T_D(r,F_N)+C(log(N/(1−r))+L_N(r)), where the outer radius in L_N is (1+r)/2. The ratio is holomorphic since F_N′ never vanishes.
-/

/- Native ConformalMappingPartII:M0/pivot-map
For N≥2 set p_N(x)=x^N/(x^N−1) on ℂ∖μ_N. Its companion maps are q_N(x)=x^N and u_N(x)=1/(x^N−1), with p_N=1+u_N. The native rational expression can be totalized at roots, but all analytic statements retain the omitted-root guard.
-/

/- Omitted ConformalMappingPartII:M0/pivot-partial-fractions
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: The pivot partial-fraction identity
Statement: For N≥2 and x^N≠1, p_N(x)=(x/N)Σ_(ζ∈μ_N)1/(x−ζ). The roots are distinct over ℂ and the sum is finite.
-/

/- Omitted ConformalMappingPartII:M0/pivot-chain-identity
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: The pivot chain identity
Statement: For f=1−F_N^N and |z|<1, p_N(F_N(z))=(F_N(z)/(NF_N′(z)))·(f′(z)/f(z)). The denominators f,F_N′ and N are nonzero; both sides are zero at z=0.
-/

/- Omitted ConformalMappingPartII:M0/pivot-characteristic-lower
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: The pivot characteristic lower bound
Statement: For N≥2 and 0<r<1, T_D(r,p_N∘F_N)≥N T_D(r,F_N)−log 4.
-/

/- Omitted ConformalMappingPartII:M0/pivot-characteristic-upper
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: The pivot characteristic upper bound
Statement: For N≥2 and 0<r<1, T_D(r,p_N∘F_N)≤T_D(r,F_N)+C(log(N/(1−r))+L_N(r)). All three composed factors are holomorphic, so their characteristics are proximity means.
-/

/- Omitted ConformalMappingPartII:M0/large-n-mean
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: The large-N mean-growth estimate
Statement: For N≥N₀ of the maximum-growth theorem and 0<r<1, T_D(r,F_N^N)≤C log(N/(1−r)), with an effective absolute C. The large-N maximum bound on the outer circle gives L_N(r)≤C′log(N/(1−r)).
-/

/- Omitted ConformalMappingPartII:M0/fixed-level-mean-input
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: Effective mean growth at fixed omitted sets
Statement: For each fixed N≥2 there is an effectively computable C_N such that T_D(r,F_N^N)≤C_N log(N/(1−r)) for all 0<r<1. This is the fixed-puncture Tsuji/Kraus–Roth input; its original proof must be supplied with an effective constant and the small-radius range, not inferred from the large-N lemma.
-/

/- Omitted ConformalMappingPartII:M0/finite-level-completion
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: Completing the finitely many small levels
Statement: Given the large-N effective constants C,N₀ and effective fixed-level constants C_N for 2≤N<N₀, the maximum of C and that finite list is an effective absolute constant proving T_D(r,F_N^N)≤C*log(N/(1−r)) for every N≥2 and 0<r<1.
-/

/- Omitted ConformalMappingPartII:M0/three-map-equivalence
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: Equivalence of the three mean estimates
Statement: For N≥2 and each 0<r<1, the characteristics of F_N^N, F_N^N/(F_N^N−1), and 1/(F_N^N−1) differ by an absolute additive constant at most log 4. The translated first main theorem uses c(F_N^N,1)=−1, of modulus one.
-/

/- Omitted ConformalMappingPartII:M0/uniform-mean-growth
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: Uniform mean growth of the covering powers
Statement: There is an effectively computable absolute C such that for every integer N≥2, 0<r<1 and p∈{x↦x^N,x↦x^N/(x^N−1),x↦1/(x^N−1)}, the normalized circle mean ∫_(|z|=r)log⁺|p(F_N(z))|dμ_Haar(z)≤C log(N/(1−r)). The cover is normalized at zero; the bound is independent of its source rotation.
-/

/- Omitted ConformalMappingPartII:M0/omitted-linear-log-derivative
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: The logarithmic derivative at the omitted value one
Statement: For N≥2, g=1−F_N is holomorphic and zero-free on 𝔻 with g(0)=1. For 0<r<1, m(r,F_N′/(1−F_N))≤C(log(N/(1−r))+L_N(r)), using R=(1+r)/2 in L_N.
-/

/- Omitted ConformalMappingPartII:M0/etale-pole-count
The analytic covering and circle-integral supplier interfaces and the effective finite-level completion remain open; no proposition-valued stand-ins are used.
Declaration: The pole divisor of the covering logarithmic derivative
Statement: For N≥2 and 0<r<1, N_D(r,F_N′/F_N)=N_D(r,1/F_N). All zeros of F_N are simple because F_N′ is nonzero; their poles in the logarithmic derivative have order one. The reciprocal F_N/F_N′ is holomorphic and has zero pole count.
-/

/- Omitted ConformalMappingPartII:U0/projective-deck-realization
The exact Tau Ceti cover carrier needs its complex charts, hyperbolic uniformization and cusp normalization; the available compiled Tau Ceti tree has a different source commit.
Declaration: Projective realization of analytic deck transformations
Statement: For a connected hyperbolic plane domain Ω and a pointed holomorphic universal cover F:𝔻→Ω, its existing topological deck transformations are holomorphic disc automorphisms. Conjugation through C identifies their action with a discrete subgroup of PSL₂(ℝ), acting freely on ℍ, and the analytic quotient is Ω. For a finite punctured plane this is its Fuchsian covering group.
-/
