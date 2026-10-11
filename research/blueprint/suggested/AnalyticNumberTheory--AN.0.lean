import Mathlib.Analysis.Meromorphic.Basic
import Mathlib.FieldTheory.Normal.Closure
import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.GroupTheory.Solvable
import TauCeti.AlgebraicTopology.UniversalCover.Classification.SubgroupQuotient
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.NumberTheory.LegendreSymbol.JacobiSymbol
import Mathlib.LinearAlgebra.Charpoly.ToMatrix
import Mathlib.RepresentationTheory.Invariants
import TauCeti.NumberTheory.NumberField.Frobenius
import TauCeti.NumberTheory.NumberField.Quadratic.Conjugation.Ambiguous.Narrow
import TauCeti.NumberTheory.NumberField.NarrowClassGroup.Finite
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Estimates
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.Chebyshev
import Mathlib.NumberTheory.Harmonic.EulerMascheroni
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.NumberTheory.SmoothNumbers
import Mathlib.NumberTheory.PrimeCounting
import Mathlib.Analysis.Analytic.Order
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics
import Mathlib.Analysis.SpecialFunctions.Pow.Complex
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.Data.Finsupp.Basic
import Mathlib.Data.Nat.Prime.Nth
import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Nat.Squarefree
import Mathlib.Data.Nat.Totient
import Mathlib.Analysis.SpecialFunctions.Choose
import Mathlib.NumberTheory.SumTwoSquares
import Mathlib.Order.Interval.Set.Nat
import Mathlib.Data.Set.Card
import Mathlib.Topology.EMetricSpace.BoundedVariation
import Mathlib.Topology.Order.LeftRightLim
import Mathlib.Analysis.Complex.LocallyUniformLimit
import Mathlib.Analysis.Complex.BorelCaratheodory
import Mathlib.Analysis.Complex.JensenFormula
import Mathlib.Analysis.Complex.Liouville
import Mathlib.Analysis.Complex.BranchLogRoot
import Mathlib.Analysis.SpecialFunctions.Complex.Analytic
import Mathlib.Analysis.SpecialFunctions.Complex.LogBounds
import Mathlib.Analysis.SpecialFunctions.Gamma.Digamma
import Mathlib.NumberTheory.LSeries.Dirichlet
import Mathlib.NumberTheory.DirichletCharacter.Orthogonality
import Mathlib.NumberTheory.BernoulliPolynomials
import Mathlib.Analysis.Calculus.ContDiff.FTaylorSeries
import Mathlib.Tactic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers
converge on names and signatures. No implementation is claimed.

The signatures use the pinned Mathlib and Tau Ceti carriers. Admitted proofs
are specifications, including constructions not implemented by either library.
The final mathematical-interface notes identify targets requiring supplier
exports; elaboration of the native portion does not certify those omissions.

Three cutoff lemmas and the maximal-order divisor upper bound repair the
leading-log-2 outline; no matching lower bound is asserted. The preliminary
Koukoulopoulos Exercise5.4(c) has its integrand reversed: use
κ=∫(1_[0,1](u)−exp(−u))/u du=γ, as source issue E19 records. Published LerchIII
Theorem6.1(2) must exclude order zero; E26 records the surviving n=0 term.
-/

noncomputable section
open scoped BigOperators Topology nonZeroDivisors NumberField Pointwise
open IsDedekindDomain (HeightOneSpectrum)
open Module (Basis)
open Classical
attribute [local instance] propDecidable
open Filter

namespace TauCeti.AnalyticNumberTheory

/-- AN.5/prime-power-log-bound: the local small-prime bound. -/
lemma prime_power_log_bound (ε : ℝ) (hε : 0 < ε) (p a : ℕ) (hp : 2 ≤ p) :
    (a : ℝ) + 1 ≤ max 1 (ε * Real.log 2)⁻¹ *
      (p : ℝ) ^ ((a : ℝ) * ε) := by sorry

/-- AN.5/large-prime-power-bound: no constant is charged above the cutoff. -/
lemma large_prime_power_bound (ε : ℝ) (hε : 0 < ε) (p a : ℕ)
    (hp : 0 < p) (hcut : Real.exp (1 / ε) ≤ (p : ℝ)) :
    (a : ℝ) + 1 ≤ (p : ℝ) ^ ((a : ℝ) * ε) := by sorry

/-- AN.5/divisor-bound-from-local-bounds: the finite-product assembly. -/
lemma divisor_bound_from_local_bounds (ε D : ℝ) (B : ℕ) (hD : 1 ≤ D)
    (hsmall : ∀ p : ℕ, p.Prime → p ≤ B → ∀ a : ℕ,
      (a : ℝ) + 1 ≤ D * (p : ℝ) ^ ((a : ℝ) * ε))
    (hlarge : ∀ p : ℕ, p.Prime → B < p → ∀ a : ℕ,
      (a : ℝ) + 1 ≤ (p : ℝ) ^ ((a : ℝ) * ε))
    (n : ℕ) (hn : 0 < n) :
    (n.divisors.card : ℝ) ≤ D ^ B * (n : ℝ) ^ ε := by sorry

/-- AN.5/explicit-divisor-subpower-bound: explicit uniform constant. -/
theorem explicit_divisor_subpower_bound (ε : ℝ) (hε : 0 < ε) (B : ℕ)
    (hB : Real.exp (1 / ε) ≤ (B : ℝ)) (n : ℕ) (hn : 0 < n) :
    (n.divisors.card : ℝ) ≤ (max 1 (ε * Real.log 2)⁻¹) ^ B *
      (n : ℝ) ^ ε := by sorry

/-- AN.5/uniform-divisor-subpower-bound: the interface requested by ES.0. -/
theorem uniform_divisor_subpower_bound (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ n : ℕ, 0 < n →
      (n.divisors.card : ℝ) ≤ C * (n : ℝ) ^ ε := by sorry

/-- AN.5/absorb-divisor-bound-constant: keep the size threshold explicit. -/
lemma absorb_divisor_bound_constant (ε δ C : ℝ) (n : ℕ) (hn : 0 < n)
    (hbound : (n.divisors.card : ℝ) ≤ C * (n : ℝ) ^ ε)
    (hthreshold : C ≤ (n : ℝ) ^ (δ - ε)) :
    (n.divisors.card : ℝ) ≤ (n : ℝ) ^ δ := by sorry

/-- AN.5/eventual-divisor-subpower-bound: unit constant after a threshold. -/
theorem eventual_divisor_subpower_bound (δ : ℝ) (hδ : 0 < δ) :
    ∃ N : ℕ, 1 ≤ N ∧ ∀ n : ℕ, N ≤ n →
      (n.divisors.card : ℝ) ≤ (n : ℝ) ^ δ := by sorry

/-- AN.5/divisor-small-prime-log-bound: the inclusive small-prime part. -/
lemma divisor_small_prime_log_bound (n : ℕ) (hn : 2 ≤ n)
    (y : ℝ) (hy : 2 ≤ y) :
    (∑ p ∈ n.primeFactors.filter (fun p : ℕ => (p : ℝ) ≤ y),
      Real.log ((n.factorization p : ℝ) + 1)) ≤
        y * Real.log (1 + Real.log n / Real.log 2) := by sorry

/-- AN.5/divisor-large-prime-log-bound: the strict large-prime part. -/
lemma divisor_large_prime_log_bound (n : ℕ) (hn : 2 ≤ n)
    (y : ℝ) (hy : 1 < y) :
    (∑ p ∈ n.primeFactors.filter (fun p : ℕ => y < (p : ℝ)),
      Real.log ((n.factorization p : ℝ) + 1)) ≤
        Real.log 2 * Real.log n / Real.log y := by sorry

/-- AN.5/divisor-small-prime-loss: a fixed positive exponent beats logarithms. -/
lemma divisor_small_prime_loss (δ η : ℝ) (hδ : 0 < δ) (hδ1 : δ < 1)
    (hη : 0 < η) :
    ∃ L₀ : ℝ, Real.exp 1 ≤ L₀ ∧ ∀ L : ℝ, L₀ ≤ L →
      L ^ (1 - δ) * Real.log (1 + L / Real.log 2) ≤
        η * L / Real.log L := by sorry

/-- AN.5/divisor-maximal-order: only the maximal-order upper bound. -/
theorem divisor_maximal_order (ε : ℝ) (hε : 0 < ε) :
    ∃ K : ℕ, Real.exp 1 < (K : ℝ) ∧ ∀ n : ℕ, K ≤ n →
      (n.divisors.card : ℝ) ≤ Real.exp
        ((Real.log 2 + ε) * Real.log n / Real.log (Real.log n)) := by sorry

/-- AN.2/classical-zero-free-region, retaining the inherited id but only the
high positive-height conclusion justified by the source's proof. -/
theorem classical_zero_free_region :
    ∃ c t₀ : ℝ, 0 < c ∧ 1 < t₀ ∧ ∀ s : ℂ, t₀ ≤ s.im →
      1 - c / Real.log s.im ≤ s.re → riemannZeta s ≠ 0 := by sorry

-- Existing divisor carrier checks; no duplicate definition is introduced.
example : Nat.divisors 0 = ∅ := by sorry
example : (Nat.divisors 1).card = 1 := by sorry
example : (Nat.divisors 12).card = 6 := by sorry
example : (Nat.divisors 64).card = 7 := by sorry

-- The local inequalities include exponent zero and the cutoff endpoint.
example (ε : ℝ) (hε : 0 < ε) (p : ℕ) (hp : 2 ≤ p) :
    1 ≤ max 1 (ε * Real.log 2)⁻¹ * (p : ℝ) ^ ((0 : ℝ) * ε) := by sorry
example (ε : ℝ) (hε : 0 < ε) (p : ℕ) (hp : 0 < p)
    (hpε : Real.exp (1 / ε) = p) (a : ℕ) :
    (a : ℝ) + 1 ≤ (p : ℝ) ^ ((a : ℝ) * ε) := by sorry

-- Uniform is not the same as unit constant for every positive input.
example : ¬ ∀ n : ℕ, 0 < n →
    (n.divisors.card : ℝ) ≤ (n : ℝ) ^ (1 / 2 : ℝ) := by sorry
example (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 1 ≤ C ∧ (Nat.divisors 1).card ≤ C * (1 : ℝ) ^ ε := by sorry
example (c : ℝ) (hc : 0 < c) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ M : ℕ, 0 < M →
      (M.divisors.card : ℝ) ≤ C * (M : ℝ) ^ (1 / (64 * c)) := by sorry
example (δ : ℝ) (hδ : 0 < δ) :
    ∃ N : ℕ, 1 ≤ N ∧ ∀ n : ℕ, N ≤ n →
      (n.divisors.card : ℝ) ≤ (n : ℝ) ^ δ := by sorry
example (ε : ℝ) (hε : 0 < ε) (B : ℕ)
    (hB : Real.exp (1 / ε) ≤ (B : ℝ)) :
    1 ≤ (max 1 (ε * Real.log 2)⁻¹) ^ B := by sorry
example (ε δ C : ℝ) (n : ℕ) (hn : 0 < n)
    (hb : (n.divisors.card : ℝ) ≤ C * (n : ℝ) ^ ε)
    (hc : C = (n : ℝ) ^ (δ - ε)) :
    (n.divisors.card : ℝ) ≤ (n : ℝ) ^ δ := by sorry


/-! AN.2: finite character sums, growth conventions and canonical factors. -/

def exceptional_real_zero {N : ℕ} [NeZero N]
    (c : ℝ) (χ : DirichletCharacter ℂ N) (β : ℝ) : Prop :=
  0 < c ∧ 1 < N ∧ χ.IsPrimitive ∧ χ ≠ 1 ∧ χ ^ 2 = 1 ∧
    χ.LFunction (β : ℂ) = 0 ∧ 1 - c / Real.log N < β ∧ β < 1

lemma ExceptionalRealZero.iff {N : ℕ} [NeZero N] (c : ℝ)
    (χ : DirichletCharacter ℂ N) (β : ℝ) :
    exceptional_real_zero c χ β ↔
      0 < c ∧ 1 < N ∧ χ.IsPrimitive ∧ χ ≠ 1 ∧ χ ^ 2 = 1 ∧
        χ.LFunction (β : ℂ) = 0 ∧ 1 - c / Real.log N < β ∧ β < 1 := by sorry
lemma ExceptionalRealZero.bounds {N : ℕ} [NeZero N] {c β : ℝ}
    {χ : DirichletCharacter ℂ N} (h : exceptional_real_zero c χ β) :
    1 - c / Real.log N < β ∧ β < 1 := by sorry
lemma ExceptionalRealZero.mono {N : ℕ} [NeZero N] {c c' β : ℝ}
    {χ : DirichletCharacter ℂ N} (h : exceptional_real_zero c χ β)
    (hcc : c ≤ c') : exceptional_real_zero c' χ β := by sorry
-- ExceptionalRealZero.one
example {N : ℕ} [NeZero N] (c : ℝ) (χ : DirichletCharacter ℂ N) :
    ¬ exceptional_real_zero c χ 1 := by sorry
-- ExceptionalRealZero.lower_endpoint
example {N : ℕ} [NeZero N] (c : ℝ) (χ : DirichletCharacter ℂ N) :
    ¬ exceptional_real_zero c χ (1 - c / Real.log N) := by sorry
-- ExceptionalRealZero.principal
example {N : ℕ} [NeZero N] (c β : ℝ) :
    ¬ exceptional_real_zero c (1 : DirichletCharacter ℂ N) β := by sorry
example (c β : ℝ) (χ : DirichletCharacter ℂ 1) :
    ¬ exceptional_real_zero c χ β := by sorry

-- ExceptionalRealZero.supplied_zero: a conditional positive test, not existence.
example {N : ℕ} [NeZero N] (c β : ℝ) (χ : DirichletCharacter ℂ N)
    (hc : 0 < c) (hN : 1 < N) (hprim : χ.IsPrimitive) (hne : χ ≠ 1)
    (hquad : χ ^ 2 = 1) (hzero : χ.LFunction (β : ℂ) = 0)
    (hlower : 1 - c / Real.log N < β) (hupper : β < 1) :
    exceptional_real_zero c χ β := by sorry

def theta_ap (x : ℝ) (q : ℕ) (a : ZMod q) : ℝ :=
  ∑ p ∈ (Finset.range (Nat.floor x + 1)).filter
    (fun p : ℕ => p.Prime ∧ (p : ZMod q) = a), Real.log p
lemma theta_ap.sum (x : ℝ) (q : ℕ) (a : ZMod q) :
    theta_ap x q a = ∑ p ∈ (Finset.range (Nat.floor x + 1)).filter
      (fun p : ℕ => p.Prime ∧ (p : ZMod q) = a), Real.log p := by sorry
lemma theta_ap.level_one (x : ℝ) : theta_ap x 1 0 = Chebyshev.theta x := by sorry
lemma theta_ap.sum_classes (x : ℝ) (q : ℕ) [NeZero q] :
    ∑ a : ZMod q, theta_ap x q a = Chebyshev.theta x := by sorry
-- theta_ap.below_two
example (q : ℕ) (a : ZMod q) : theta_ap 1 q a = 0 := by sorry
-- theta_ap.mod_eight
example : theta_ap 5 8 3 = Real.log 3 ∧ theta_ap 5 8 5 = Real.log 5 := by sorry
-- theta_ap.noncoprime
example (x : ℝ) (hx : 2 ≤ x) : theta_ap x 2 0 = Real.log 2 := by sorry

def entire_order_at_most (f : ℂ → ℂ) (ρ : ℝ) : Prop :=
  0 ≤ ρ ∧ Differentiable ℂ f ∧ ∀ b : ℝ, ρ < b →
    ∃ C : ℝ, 0 < C ∧ ∀ z : ℂ, ‖f z‖ ≤ C * Real.exp (‖z‖ ^ b)
lemma entire_order_at_most.bound {f : ℂ → ℂ} {ρ b : ℝ}
    (h : entire_order_at_most f ρ) (hb : ρ < b) :
    ∃ C : ℝ, 0 < C ∧ ∀ z : ℂ, ‖f z‖ ≤ C * Real.exp (‖z‖ ^ b) := by sorry
lemma entire_order_at_most.mono {f : ℂ → ℂ} {ρ ρ' : ℝ}
    (h : entire_order_at_most f ρ) (hρ : ρ ≤ ρ') :
    entire_order_at_most f ρ' := by sorry
lemma entire_order_at_most.polynomial (P : Polynomial ℂ) :
    entire_order_at_most (fun z => P.eval z) 0 := by sorry
lemma entire_order_at_most.product {f g : ℂ → ℂ} {ρ : ℝ}
    (hf : entire_order_at_most f ρ) (hg : entire_order_at_most g ρ) :
    entire_order_at_most (fun z => f z * g z) ρ := by sorry
-- entire_order_at_most.exp
example : entire_order_at_most Complex.exp 1 := by sorry
-- entire_order_at_most.exp_square
example : ¬ entire_order_at_most (fun z : ℂ => Complex.exp (z ^ 2)) 1 := by sorry
-- entire_order_at_most.polynomial
example : entire_order_at_most (fun z : ℂ => 1 - z ^ 2) 0 := by sorry
-- entire_order_at_most.xi: implication from gamma-size growth, not fixed type.
example (f : ℂ → ℂ) (hf : Differentiable ℂ f) (C : ℝ)
    (h : ∀ z : ℂ, ‖f z‖ ≤ Real.exp (C * ‖z‖ * Real.log (2 + ‖z‖))) :
    entire_order_at_most f 1 := by sorry
-- entire_order_at_most.zero: an upper bound does not assert exact order.
example : entire_order_at_most (fun _ : ℂ => 0) 0 := by sorry

def genus_one_factor (w : ℂ) : ℂ := (1 - w) * Complex.exp w
lemma genus_one_factor.value (w : ℂ) :
    genus_one_factor w = (1 - w) * Complex.exp w := by sorry
lemma genus_one_factor.entire : Differentiable ℂ genus_one_factor := by sorry
lemma genus_one_factor.zeros (w : ℂ) :
    (genus_one_factor w = 0 ↔ w = 1) ∧ analyticOrderNatAt genus_one_factor 1 = 1 := by sorry
lemma genus_one_factor.pair (w : ℂ) :
    genus_one_factor w * genus_one_factor (-w) = 1 - w ^ 2 := by sorry
-- genus_one_factor.origin
example : genus_one_factor 0 = 1 := by sorry
-- genus_one_factor.root
example : genus_one_factor 1 = 0 := by sorry
-- genus_one_factor.derivative
example : deriv genus_one_factor 0 = 0 := by sorry

def riemann_xi (s : ℂ) : ℂ :=
  1 / 2 + (1 / 2) * s * (s - 1) * completedRiemannZeta₀ s
lemma riemann_xi.entire : Differentiable ℂ riemann_xi := by sorry
lemma riemann_xi.reflection (s : ℂ) : riemann_xi (1 - s) = riemann_xi s := by sorry
lemma riemann_xi.comparison (s : ℂ) (h0 : s ≠ 0) (h1 : s ≠ 1) :
    riemann_xi s = (1 / 2) * s * (s - 1) * completedRiemannZeta s := by sorry
lemma riemann_xi.endpoints : riemann_xi 0 = 1 / 2 ∧ riemann_xi 1 = 1 / 2 := by sorry
-- riemann_xi.zero
example : riemann_xi 0 = 1 / 2 := by sorry
-- riemann_xi.one
example : riemann_xi 1 = 1 / 2 := by sorry
-- riemann_xi.reflection
example : riemann_xi 2 = riemann_xi (-1) := by sorry

/-! AN.3: analytic multiplicities and the half-weighted explicit formula. -/

/-- Construction uses the finite zero set in a compact rectangle; see the reader. -/
def zeta_zero_multiset (T : ℝ) : Multiset ℂ := by sorry
lemma zeta_zero_multiset.multiplicity (T : ℝ) (hT : 0 ≤ T) (ρ : ℂ) :
    (zeta_zero_multiset T).count ρ =
      if 0 ≤ ρ.re ∧ ρ.re ≤ 1 ∧ |ρ.im| < T then analyticOrderNatAt riemann_xi ρ else 0 := by sorry
lemma zeta_zero_multiset.mono {T U : ℝ} (hT : 0 ≤ T) (h : T ≤ U) :
    zeta_zero_multiset T ≤ zeta_zero_multiset U := by sorry
lemma zeta_zero_multiset.conjugation (T : ℝ) (hT : 0 ≤ T) :
    (zeta_zero_multiset T).map star = zeta_zero_multiset T := by sorry
lemma zeta_zero_multiset.xi_zeta (ρ : ℂ) (h0 : 0 < ρ.re) (h1 : ρ.re < 1) :
    (riemann_xi ρ = 0 ↔ riemannZeta ρ = 0) ∧
      analyticOrderNatAt riemann_xi ρ = analyticOrderNatAt riemannZeta ρ := by sorry
-- zeta_zero_multiset.zero_height
example : zeta_zero_multiset 0 = 0 := by sorry
-- zeta_zero_multiset.double: hypothetical multiplicity, no unproved double zero.
example (ρ : ℂ) (T : ℝ) (hT : 0 ≤ T) (h0 : 0 ≤ ρ.re) (h1 : ρ.re ≤ 1)
    (hρ : |ρ.im| < T) (hm : analyticOrderNatAt riemann_xi ρ = 2) :
    (zeta_zero_multiset T).count ρ = 2 := by sorry
-- zeta_zero_multiset.endpoint
example (ρ : ℂ) (T : ℝ) (hT : 0 ≤ T) (h : |ρ.im| = T) :
    (zeta_zero_multiset T).count ρ = 0 := by sorry
-- zeta_zero_multiset.poles
example (T : ℝ) (hT : 0 ≤ T) :
    (zeta_zero_multiset T).count 0 = 0 ∧ (zeta_zero_multiset T).count 1 = 0 := by sorry

/-- Helper notation for the existing finite psi sum, not a new roadmap carrier. -/
private def psi_half (x : ℝ) : ℝ :=
  ∑ n ∈ Finset.range (Nat.floor x + 1),
    if (n : ℝ) < x then ArithmeticFunction.vonMangoldt n
    else if (n : ℝ) = x then ArithmeticFunction.vonMangoldt n / 2 else 0
private def nearest_distinct_prime_power (x : ℝ) : ℝ :=
  sInf {r : ℝ | ∃ p k : ℕ, p.Prime ∧ 0 < k ∧ ((p ^ k : ℕ) : ℝ) ≠ x ∧
    r = |x - ((p ^ k : ℕ) : ℝ)|}

theorem von_mangoldt_explicit_formula_and_pnt_error :
    ∃ C : ℝ, 0 < C ∧ ∀ x T : ℝ, 2 ≤ x → 2 ≤ T →
      ∃ R : ℝ, ((psi_half x - x : ℝ) : ℂ) =
        -((zeta_zero_multiset T).map
          (fun ρ => Complex.exp (ρ * Real.log x) / ρ)).sum
        - deriv riemannZeta 0 / riemannZeta 0
        - ((1 / 2) * Real.log (1 - x⁻¹ ^ 2) : ℝ) + R ∧
      |R| ≤ C * (x * (Real.log (x * T)) ^ 2 / T + Real.log x *
        min 1 (x / (T * nearest_distinct_prime_power x))) := by sorry

theorem rational_prime_number_theorem :
    Tendsto (fun x : ℝ => Chebyshev.psi x / x) atTop (𝓝 1) := by sorry
theorem rational_pnt_error :
    ∃ c C x₀ : ℝ, 0 < c ∧ 0 < C ∧ 2 ≤ x₀ ∧ ∀ x : ℝ, x₀ ≤ x →
      |Chebyshev.psi x - x| ≤ C * x * Real.exp (-c * Real.sqrt (Real.log x)) := by sorry
theorem fixed_progression_prime_number_theorem (q : ℕ) [NeZero q]
    (a : ℕ) (h : Nat.Coprime a q) :
    Tendsto (fun x : ℝ => theta_ap x q (a : ZMod q) / x)
      atTop (𝓝 ((Nat.totient q : ℝ)⁻¹)) := by sorry
theorem riemann_von_mangoldt_count :
    ∃ C : ℝ, 0 < C ∧ ∀ T : ℝ, 2 ≤ T →
      |(((zeta_zero_multiset (T + 1)).filter
          (fun ρ => 0 < ρ.im ∧ ρ.im ≤ T)).card : ℝ) -
        (T / (2 * Real.pi) * Real.log (T / (2 * Real.pi)) - T / (2 * Real.pi))| ≤
        C * Real.log (T + 2) := by sorry

/-! AN.5: explicit finite cutoffs and multiplicative means. -/

private def medium_prime_set (x : ℝ) : Finset ℕ :=
  (Finset.range (Nat.floor x + 1)).filter (fun p : ℕ => p.Prime ∧ x / 2 ≤ p)
def medium_prime_products (x : ℝ) (m : ℕ) : Finset ℕ :=
  ((medium_prime_set x).powersetCard m).image (fun t => ∏ p ∈ t, p)
lemma medium_prime_products.membership (x : ℝ) (m n : ℕ) :
    n ∈ medium_prime_products x m ↔
      ∃ t ∈ (medium_prime_set x).powersetCard m, n = ∏ p ∈ t, p := by sorry
lemma medium_prime_products.card (x : ℝ) (m : ℕ) :
    (medium_prime_products x m).card = Nat.choose (medium_prime_set x).card m := by sorry
/-- The promoted cardinality node uses the existing prime-factor recovery API. -/
lemma medium_prime_product_card (x : ℝ) (m : ℕ) :
    (medium_prime_products x m).card = Nat.choose (medium_prime_set x).card m := by sorry
lemma medium_prime_products.zero (x : ℝ) :
    medium_prime_products x 0 = {1} := by sorry
lemma medium_prime_products.size_bounds (x : ℝ) (hx : 2 ≤ x) (m n : ℕ)
    (hn : n ∈ medium_prime_products x m) :
    (x / 2) ^ m ≤ (n : ℝ) ∧ (n : ℝ) ≤ x ^ m := by sorry
lemma medium_prime_products.squarefree (x : ℝ) (m n : ℕ)
    (h : n ∈ medium_prime_products x m) : Squarefree n ∧ n.primeFactors.card = m := by sorry
lemma medium_prime_products.support (x : ℝ) (m n p : ℕ)
    (hn : n ∈ medium_prime_products x m) (hp : p.Prime) (hpn : p ∣ n) :
    x / 2 ≤ (p : ℝ) ∧ (p : ℝ) ≤ x := by sorry
-- medium_prime_products.zero
example : medium_prime_products 10 0 = {1} := by sorry
-- medium_prime_products.one
example : medium_prime_products 10 1 = {5, 7} := by sorry
-- medium_prime_products.two
example : medium_prime_products 10 2 = {35} ∧ medium_prime_products 10 3 = ∅ := by sorry
-- medium_prime_products.distinct
example : 25 ∉ medium_prime_products 10 2 := by sorry
-- medium_prime_products.closed_lower_endpoint
example : medium_prime_products 4 1 = {2, 3} := by sorry

def even_von_mangoldt (n : ℤ) : ℝ := ArithmeticFunction.vonMangoldt n.natAbs
lemma even_von_mangoldt.nat (n : ℕ) :
    even_von_mangoldt (n : ℤ) = ArithmeticFunction.vonMangoldt n := by sorry
lemma even_von_mangoldt.neg (n : ℤ) : even_von_mangoldt (-n) = even_von_mangoldt n := by sorry
lemma even_von_mangoldt.zero : even_von_mangoldt 0 = 0 := by sorry
-- even_von_mangoldt.zero
example : even_von_mangoldt 0 = 0 := by sorry
-- even_von_mangoldt.negative_prime
example : even_von_mangoldt (-2) = Real.log 2 := by sorry
-- even_von_mangoldt.power
example : even_von_mangoldt (-8) = Real.log 2 ∧ even_von_mangoldt (-6) = 0 := by sorry

def truncated_von_mangoldt (z : ℝ) (n : ℤ) : ℝ :=
  -(∑ d ∈ (Finset.Icc 1 (Nat.floor z)).filter (fun d : ℕ => (d : ℤ) ∣ n),
    (ArithmeticFunction.moebius d : ℝ) * Real.log d)
lemma truncated_von_mangoldt.sum (z : ℝ) (n : ℤ) :
    truncated_von_mangoldt z n =
      -(∑ d ∈ (Finset.Icc 1 (Nat.floor z)).filter (fun d : ℕ => (d : ℤ) ∣ n),
        (ArithmeticFunction.moebius d : ℝ) * Real.log d) := by sorry
lemma truncated_von_mangoldt.neg (z : ℝ) (n : ℤ) :
    truncated_von_mangoldt z (-n) = truncated_von_mangoldt z n := by sorry
lemma truncated_von_mangoldt.zero (z : ℝ) :
    truncated_von_mangoldt z 0 =
      -(∑ d ∈ Finset.Icc 1 (Nat.floor z), (ArithmeticFunction.moebius d : ℝ) * Real.log d) := by sorry
lemma truncated_von_mangoldt.large_cutoff (z : ℝ) (n : ℤ)
    (hn : n ≠ 0) (hz : (n.natAbs : ℝ) ≤ z) :
    truncated_von_mangoldt z n = even_von_mangoldt n := by sorry
-- truncated_von_mangoldt.zero_two
example : truncated_von_mangoldt 2 0 = Real.log 2 := by sorry
-- truncated_von_mangoldt.prime_cutoff
example (p : ℕ) (hp : p.Prime) (z : ℝ) (hz : 1 ≤ z) :
    truncated_von_mangoldt z (p : ℤ) = if (p : ℝ) ≤ z then Real.log p else 0 := by sorry
-- truncated_von_mangoldt.one
example (n : ℤ) : truncated_von_mangoldt 1 n = 0 := by sorry

def mangoldt_truncation_error (z : ℝ) (n : ℤ) : ℝ :=
  even_von_mangoldt n - truncated_von_mangoldt z n
lemma mangoldt_truncation_error.sub (z : ℝ) (n : ℤ) :
    mangoldt_truncation_error z n = even_von_mangoldt n - truncated_von_mangoldt z n := by sorry
lemma mangoldt_truncation_error.neg (z : ℝ) (n : ℤ) :
    mangoldt_truncation_error z (-n) = mangoldt_truncation_error z n := by sorry
lemma mangoldt_truncation_error.zero (z : ℝ) :
    mangoldt_truncation_error z 0 =
      ∑ d ∈ Finset.Icc 1 (Nat.floor z), (ArithmeticFunction.moebius d : ℝ) * Real.log d := by sorry
-- mangoldt_truncation_error.zero_two
example : mangoldt_truncation_error 2 0 = -Real.log 2 := by sorry
-- mangoldt_truncation_error.prime
example (p : ℕ) (hp : p.Prime) (z : ℝ) (hz : z < p) :
    mangoldt_truncation_error z (p : ℤ) = Real.log p := by sorry
-- mangoldt_truncation_error.large_cutoff
example (n : ℤ) (hn : n ≠ 0) (z : ℝ) (hz : (n.natAbs : ℝ) ≤ z) :
    mangoldt_truncation_error z n = 0 := by sorry

def pretentious_distance (f g : ℕ → ℂ) (x : ℝ) : ℝ :=
  Real.sqrt (∑ p ∈ (Finset.range (Nat.floor x + 1)).filter Nat.Prime,
    (1 - (f p * star (g p)).re) / p)
lemma pretentious_distance.square (f g : ℕ → ℂ) (x : ℝ)
    (hf : ∀ p : ℕ, p.Prime → (p : ℝ) ≤ x → ‖f p‖ ≤ 1)
    (hg : ∀ p : ℕ, p.Prime → (p : ℝ) ≤ x → ‖g p‖ ≤ 1) :
    pretentious_distance f g x ^ 2 =
      ∑ p ∈ (Finset.range (Nat.floor x + 1)).filter Nat.Prime,
        (1 - (f p * star (g p)).re) / p := by sorry
lemma pretentious_distance.symmetric (f g : ℕ → ℂ) (x : ℝ) :
    pretentious_distance f g x = pretentious_distance g f x := by sorry
lemma pretentious_distance.cutoff (f g : ℕ → ℂ) (x y : ℝ) (hxy : x ≤ y)
    (hf : ∀ p : ℕ, p.Prime → (p : ℝ) ≤ y → ‖f p‖ ≤ 1)
    (hg : ∀ p : ℕ, p.Prime → (p : ℝ) ≤ y → ‖g p‖ ≤ 1) :
    pretentious_distance f g x ^ 2 ≤ pretentious_distance f g y ^ 2 := by sorry
lemma pretentious_distance.unit_diagonal (f : ℕ → ℂ) (x : ℝ)
    (hf : ∀ p : ℕ, p.Prime → (p : ℝ) ≤ x → ‖f p‖ = 1) :
    pretentious_distance f f x = 0 := by sorry
lemma pretentious_distance.prime_data (f g f' g' : ℕ → ℂ) (x : ℝ)
    (hf : ∀ p : ℕ, p.Prime → (p : ℝ) ≤ x → f p = f' p)
    (hg : ∀ p : ℕ, p.Prime → (p : ℝ) ≤ x → g p = g' p) :
    pretentious_distance f g x = pretentious_distance f' g' x := by sorry
-- pretentious_distance.unit
example (x : ℝ) : pretentious_distance (fun _ => 1) (fun _ => 1) x = 0 := by sorry
-- pretentious_distance.minus
example (x : ℝ) : pretentious_distance (fun _ => 1) (fun _ => -1) x ^ 2 =
    2 * ∑ p ∈ (Finset.range (Nat.floor x + 1)).filter Nat.Prime, (p : ℝ)⁻¹ := by sorry
-- pretentious_distance.disc
example : pretentious_distance (fun _ => 0) (fun _ => 0) 2 ^ 2 = 1 / 2 := by sorry
-- pretentious_distance.empty
example (f g : ℕ → ℂ) : pretentious_distance f g 1 = 0 := by sorry

def smooth_count (x y : ℝ) : ℕ :=
  (Nat.smoothNumbersUpTo (Nat.floor x) (Nat.floor y + 1)).card
lemma smooth_count.floor (x y : ℝ) :
    smooth_count x y = (Nat.smoothNumbersUpTo (Nat.floor x) (Nat.floor y + 1)).card := by sorry
lemma smooth_count.mono (x x' y y' : ℝ) (hx : x ≤ x') (hy : y ≤ y') :
    smooth_count x y ≤ smooth_count x' y' := by sorry
lemma smooth_count.large_y (x y : ℝ) (hx : 2 ≤ x) (hy : x ≤ y) :
    smooth_count x y = Nat.floor x := by sorry
lemma smooth_count.unit (x y : ℝ) (hx : 1 ≤ x) (hy : 2 ≤ y) :
    1 ∈ Nat.smoothNumbersUpTo (Nat.floor x) (Nat.floor y + 1) := by sorry
-- smooth_count.two
example : smooth_count 8 2 = 4 := by sorry
-- smooth_count.inclusive
example : smooth_count 6 3 = 5 := by sorry
-- smooth_count.zero
example (x y : ℝ) : 0 ∉ Nat.smoothNumbersUpTo (Nat.floor x) (Nat.floor y + 1) := by sorry
-- smooth_count.empty
example : smooth_count 0 2 = 0 := by sorry

lemma smooth_largest_prime_decomposition (x y : ℝ) (hx : 1 ≤ x) (hy : 2 ≤ y) :
    smooth_count x y +
      ∑ p ∈ (Finset.Icc 1 (Nat.floor x)).filter (fun p : ℕ => p.Prime ∧ y < p),
        smooth_count (x / p) p = Nat.floor x := by sorry

lemma smooth_finite_euler_series (y σ : ℝ) (hy : 2 ≤ y) (hσ : 0 < σ) :
    Summable (fun n : ℕ =>
      if n ∈ Nat.smoothNumbers (Nat.floor y + 1) then (n : ℝ) ^ (-σ) else 0) ∧
    (∑' n : ℕ,
      if n ∈ Nat.smoothNumbers (Nat.floor y + 1) then (n : ℝ) ^ (-σ) else 0) =
      ∏ p ∈ (Finset.range (Nat.floor y + 1)).filter Nat.Prime,
        (1 - (p : ℝ) ^ (-σ))⁻¹ := by sorry

/-- Recursive integral construction on consecutive unit intervals. -/
def dickman_function : ℝ → ℝ := by sorry
lemma dickman_function.negative (u : ℝ) (hu : u < 0) :
    dickman_function u = 0 := by sorry
lemma dickman_function.continuous :
    ContinuousOn dickman_function (Set.Ici 0) := by sorry
lemma dickman_function.delay (u : ℝ) (hu : 1 < u) :
    HasDerivAt dickman_function (-dickman_function (u - 1) / u) u := by sorry
lemma dickman_function.interval_identity (u : ℝ) :
    u * dickman_function u = ∫ v in (u - 1)..u, dickman_function v := by sorry
lemma dickman_function.initial (u : ℝ) (hu : u ∈ Set.Icc 0 1) :
    dickman_function u = 1 := by sorry
lemma dickman_function.recursion (u : ℝ) (hu : 1 ≤ u) :
    dickman_function u = 1 - ∫ t in (1 : ℝ)..u, dickman_function (t - 1) / t := by sorry
lemma dickman_function.unique (f : ℝ → ℝ) (hf : ContinuousOn f (Set.Ici 0))
    (hinit : ∀ u ∈ Set.Icc (0 : ℝ) 1, f u = 1)
    (hrec : ∀ u : ℝ, 1 ≤ u → f u = 1 - ∫ t in (1 : ℝ)..u, f (t - 1) / t) :
    ∀ u : ℝ, 0 ≤ u → f u = dickman_function u := by sorry
lemma dickman_function.positive :
    (∀ u : ℝ, 0 ≤ u → 0 < dickman_function u) ∧
      AntitoneOn dickman_function (Set.Ici 0) := by sorry
-- dickman_function.zero
example : dickman_function 0 = 1 ∧ dickman_function 1 = 1 := by sorry
-- dickman_function.two
example : dickman_function 2 = 1 - Real.log 2 := by sorry
-- dickman_function.negative
example : dickman_function (-1) = 0 := by sorry
theorem dickman_fixed_u (u : ℝ) (hu : 0 < u) :
    Tendsto (fun x : ℝ => (smooth_count x (x ^ u⁻¹) : ℝ) / x)
      atTop (𝓝 (dickman_function u)) := by sorry
theorem smooth_rankin_bound (x y σ : ℝ) (hx : 1 ≤ x) (hy : 2 ≤ y) (hσ : 0 < σ) :
    (smooth_count x y : ℝ) ≤ x ^ σ *
      ∏ p ∈ (Finset.range (Nat.floor y + 1)).filter Nat.Prime,
        (1 - (p : ℝ) ^ (-σ))⁻¹ := by sorry

structure beurling_prime_system where
  prime : ℕ → ℝ
  one_lt : ∀ i, 1 < prime i
  monotone : Monotone prime
  unbounded : Tendsto prime atTop atTop

def beurling_prime_system.norm (P : beurling_prime_system) (a : ℕ →₀ ℕ) : ℝ :=
  a.prod (fun i e => P.prime i ^ e)
def beurling_integer_count (P : beurling_prime_system) (x : ℝ) : ℕ :=
  Nat.card {a : ℕ →₀ ℕ // P.norm a ≤ x}
def beurling_prime_count (P : beurling_prime_system) (x : ℝ) : ℕ :=
  Nat.card {i : ℕ // P.prime i ≤ x}
lemma beurling_prime_system.ext (P Q : beurling_prime_system)
    (h : ∀ i, P.prime i = Q.prime i) : P = Q := by sorry
lemma beurling_prime_system.norm_pos (P : beurling_prime_system) (a : ℕ →₀ ℕ) :
    1 ≤ P.norm a ∧ 0 < P.norm a := by sorry
lemma beurling_prime_system.norm_add (P : beurling_prime_system) (a b : ℕ →₀ ℕ) :
    P.norm (a + b) = P.norm a * P.norm b := by sorry
lemma beurling_prime_system.prime_finite (P : beurling_prime_system) (x : ℝ) :
    Set.Finite {i : ℕ | P.prime i ≤ x} := by sorry
lemma beurling_prime_system.finite (P : beurling_prime_system) (x : ℝ) :
    Set.Finite {a : ℕ →₀ ℕ | P.norm a ≤ x} := by sorry
lemma beurling_prime_system.unit (P : beurling_prime_system) : P.norm 0 = 1 := by sorry
lemma beurling_prime_system.multiplicity (P : beurling_prime_system)
    (a b : ℕ →₀ ℕ) (hab : a ≠ b) (h : P.norm a = P.norm b)
    (x : ℝ) (hx : P.norm a ≤ x) :
    2 ≤ beurling_integer_count P x := by sorry
lemma beurling_prime_system.ordinary (P : beurling_prime_system)
    (hp : ∀ i, P.prime i = (Nat.nth Nat.Prime i : ℝ)) (x : ℝ) (hx : 1 ≤ x) :
    beurling_integer_count P x = Nat.floor x ∧
      beurling_prime_count P x = Nat.primeCounting (Nat.floor x) := by sorry
-- beurling_prime_system.ordinary
example (P : beurling_prime_system) (hp : ∀ i, P.prime i = (Nat.nth Nat.Prime i : ℝ)) :
    beurling_integer_count P 10 = 10 := by sorry
-- beurling_prime_system.repeated: exactly two indices of value 2.
example (P : beurling_prime_system) (h0 : P.prime 0 = 2) (h1 : P.prime 1 = 2)
    (h2 : 2 < P.prime 2) : beurling_integer_count P 2 = 3 := by sorry
-- beurling_prime_system.unit
example (P : beurling_prime_system) (x : ℝ) (hx : 1 ≤ x) (hp : x < P.prime 0) :
    beurling_integer_count P x = 1 ∧ beurling_prime_count P x = 0 := by sorry
-- beurling_prime_system.invalid
example (P : beurling_prime_system) : P.prime 0 ≠ 1 := by sorry

-- beurling_prime_system.empty: the zero exponent vector is the empty product.
example (P : beurling_prime_system) (x : ℝ) (hx : x < 1) :
    beurling_integer_count P x = 0 ∧ beurling_prime_count P x = 0 ∧
      P.norm 0 = 1 := by sorry

lemma beurling_count_growth (P : beurling_prime_system) (σ x : ℝ)
    (hσ : 0 < σ) (hx : 1 ≤ x)
    (hsum : Summable (fun a : ℕ →₀ ℕ => P.norm a ^ (-σ))) :
    (beurling_integer_count P x : ℝ) ≤
        (∑' a : ℕ →₀ ℕ, P.norm a ^ (-σ)) * x ^ σ ∧
      beurling_prime_count P x ≤ beurling_integer_count P x := by sorry

lemma beurling_prime_power_correction (P : beurling_prime_system) :
    let primePowerCount : ℝ → ℝ := fun x =>
      ∑ j ∈ Finset.Icc 1 (Nat.floor (Real.log x / Real.log (P.prime 0))),
        (beurling_prime_count P (x ^ (1 / (j : ℝ))) : ℝ) / j
    (∀ x : ℝ, 1 ≤ x → ∀ j : ℕ,
        Nat.floor (Real.log x / Real.log (P.prime 0)) < j →
        beurling_prime_count P (x ^ (1 / (j : ℝ))) = 0) ∧
      (∀ x : ℝ, P.prime 0 ≤ x →
        0 ≤ primePowerCount x - beurling_prime_count P x ∧
        primePowerCount x - beurling_prime_count P x ≤
          beurling_prime_count P (Real.sqrt x) +
          beurling_prime_count P (x ^ (1 / (3 : ℝ))) *
            Real.log x / Real.log (P.prime 0)) ∧
      ((∀ σ : ℝ, 1 < σ → Summable (fun a : ℕ →₀ ℕ => P.norm a ^ (-σ))) →
        ∀ ε : ℝ, 0 < ε →
          (fun x : ℝ => primePowerCount x - beurling_prime_count P x) =O[atTop]
            (fun x : ℝ => x ^ ((1 / 2 : ℝ) + ε))) := by sorry

/-! Explicit C(κ) uses the pinned zero-extended arithmetic-function carrier. -/
def halasz_coefficient_class (f : ArithmeticFunction ℂ) (κ : ℝ) : Prop :=
  0 < κ ∧ f.IsMultiplicative ∧ ∃ b : ArithmeticFunction ℂ,
    (∀ n : ℕ, ‖b n‖ ≤ κ * ArithmeticFunction.vonMangoldt n) ∧
    ∀ s : ℂ, 1 < s.re →
      LSeriesSummable (f : ℕ → ℂ) s ∧
      LSeriesSummable (b : ℕ → ℂ) s ∧
      LSeriesSummable (fun n => b n / (Real.log n : ℂ)) s ∧
      LSeries (f : ℕ → ℂ) s =
        Complex.exp (LSeries (fun n => b n / (Real.log n : ℂ)) s) ∧
      -deriv (LSeries (f : ℕ → ℂ)) s / LSeries (f : ℕ → ℂ) s =
        LSeries (b : ℕ → ℂ) s

def halasz_coefficient_class.log_coeff (f : ArithmeticFunction ℂ) (κ : ℝ)
    (h : halasz_coefficient_class f κ) : ArithmeticFunction ℂ :=
  Classical.choose h.2.2

lemma halasz_coefficient_class.constructor (f b : ArithmeticFunction ℂ) (κ : ℝ)
    (hκ : 0 < κ) (hf : f.IsMultiplicative)
    (hb : ∀ n : ℕ, ‖b n‖ ≤ κ * ArithmeticFunction.vonMangoldt n)
    (hseries : ∀ s : ℂ, 1 < s.re →
      LSeriesSummable (f : ℕ → ℂ) s ∧
      LSeriesSummable (b : ℕ → ℂ) s ∧
      LSeriesSummable (fun n => b n / (Real.log n : ℂ)) s ∧
      LSeries (f : ℕ → ℂ) s =
        Complex.exp (LSeries (fun n => b n / (Real.log n : ℂ)) s) ∧
      -deriv (LSeries (f : ℕ → ℂ)) s / LSeries (f : ℕ → ℂ) s =
        LSeries (b : ℕ → ℂ) s) : halasz_coefficient_class f κ := by sorry

lemma halasz_coefficient_class.log_coeff_unique (f : ArithmeticFunction ℂ) (κ : ℝ)
    (h : halasz_coefficient_class f κ) (b : ArithmeticFunction ℂ)
    (hb : ∀ s : ℂ, 1 < s.re → LSeriesSummable (b : ℕ → ℂ) s ∧
      -deriv (LSeries (f : ℕ → ℂ)) s / LSeries (f : ℕ → ℂ) s =
        LSeries (b : ℕ → ℂ) s) :
    halasz_coefficient_class.log_coeff f κ h = b := by sorry

lemma halasz_coefficient_class.majorant (f : ArithmeticFunction ℂ) (κ : ℝ)
    (h : halasz_coefficient_class f κ) (n : ℕ) :
    ‖halasz_coefficient_class.log_coeff f κ h n‖ ≤
      κ * ArithmeticFunction.vonMangoldt n := by sorry
lemma halasz_coefficient_class.nonzero (f : ArithmeticFunction ℂ) (κ : ℝ)
    (h : halasz_coefficient_class f κ) (s : ℂ) (hs : 1 < s.re) :
    LSeries (f : ℕ → ℂ) s ≠ 0 := by sorry
lemma halasz_coefficient_class.mono (f : ArithmeticFunction ℂ) (κ κ' : ℝ)
    (h : halasz_coefficient_class f κ) (hκ : κ ≤ κ') :
    halasz_coefficient_class f κ' := by sorry

-- halasz_coefficient_class.one: f is the complex cast of the native arithmetic zeta.
example (f : ArithmeticFunction ℂ)
    (hf : ∀ n, f n = (ArithmeticFunction.zeta n : ℂ)) :
    ∃ h : halasz_coefficient_class f 1,
      ∀ n, halasz_coefficient_class.log_coeff f 1 h n =
        (ArithmeticFunction.vonMangoldt n : ℂ) := by sorry
-- halasz_coefficient_class.mobius
example (f : ArithmeticFunction ℂ)
    (hf : ∀ n, f n = (ArithmeticFunction.moebius n : ℂ)) :
    ∃ h : halasz_coefficient_class f 1,
      ∀ n, halasz_coefficient_class.log_coeff f 1 h n =
        -(ArithmeticFunction.vonMangoldt n : ℂ) := by sorry
-- halasz_coefficient_class.twist: zero extension is carried by ArithmeticFunction.
example (t : ℝ) (f : ArithmeticFunction ℂ)
    (hf : ∀ n : ℕ, 0 < n → f n = Complex.exp (Complex.I * t * Real.log n)) :
    ∃ h : halasz_coefficient_class f 1,
      ∀ n, halasz_coefficient_class.log_coeff f 1 h n =
        f n * (ArithmeticFunction.vonMangoldt n : ℂ) := by sorry
-- halasz_coefficient_class.growth
example (f : ArithmeticFunction ℂ) (hf : ∀ n : ℕ, f n = (n : ℂ)) :
    ∀ κ : ℝ, ¬halasz_coefficient_class f κ := by sorry

theorem halasz_integral_bound (κ : ℝ) (hκ : 0 < κ) :
    ∃ C x₀ : ℝ, 0 < C ∧ 3 ≤ x₀ ∧ ∀ f : ArithmeticFunction ℂ,
      halasz_coefficient_class f κ → ∀ x : ℝ, x₀ ≤ x →
      ‖∑ n ∈ Finset.Icc 1 (Nat.floor x), f n‖ ≤
        C * x / Real.log x *
          (∫ σ in (1 / Real.log x)..1,
            sSup {r : ℝ | ∃ t : ℝ, |t| ≤ (Real.log x) ^ κ ∧
              r = ‖LSeries (f : ℕ → ℂ) ((1 + σ : ℝ) + t * Complex.I) /
                ((1 + σ : ℝ) + t * Complex.I)‖} / σ) +
        C * x * (Real.log (Real.log x)) ^ κ / Real.log x := by sorry

lemma unit_disc_product_distance (z w : ℂ) (hz : ‖z‖ ≤ 1) (hw : ‖w‖ ≤ 1) :
    Real.sqrt (1 - (z * w).re) ≤
      Real.sqrt (1 - z.re) + Real.sqrt (1 - w.re) := by sorry
lemma pretentious_product_triangle (f₁ f₂ g₁ g₂ : ℕ → ℂ) (x : ℝ)
    (hf₁ : ∀ p : ℕ, p.Prime → (p : ℝ) ≤ x → ‖f₁ p‖ ≤ 1)
    (hf₂ : ∀ p : ℕ, p.Prime → (p : ℝ) ≤ x → ‖f₂ p‖ ≤ 1)
    (hg₁ : ∀ p : ℕ, p.Prime → (p : ℝ) ≤ x → ‖g₁ p‖ ≤ 1)
    (hg₂ : ∀ p : ℕ, p.Prime → (p : ℝ) ≤ x → ‖g₂ p‖ ≤ 1) :
    pretentious_distance (fun n => f₁ n * f₂ n) (fun n => g₁ n * g₂ n) x ≤
      pretentious_distance f₁ g₁ x + pretentious_distance f₂ g₂ x := by sorry
lemma mangoldt_polynomial_mean_square :
    ∃ C : ℝ, 0 < C ∧ ∀ T x : ℝ, 1 ≤ T → 1 ≤ x → ∀ a : ℕ → ℂ,
      (∫ t in -T..T,
        ‖∑ n ∈ (Finset.Icc 1 (Nat.floor x)).filter (fun n : ℕ => T ^ 2 ≤ (n : ℝ)),
          a n * (ArithmeticFunction.vonMangoldt n : ℂ) *
            Complex.exp (-Complex.I * t * Real.log n)‖ ^ 2) ≤
        C * ∑ n ∈ (Finset.Icc 1 (Nat.floor x)).filter (fun n : ℕ => T ^ 2 ≤ (n : ℝ)),
          (n : ℝ) * ‖a n‖ ^ 2 * ArithmeticFunction.vonMangoldt n := by sorry

lemma rational_mangoldt_boundary :
    ∃ G : ℂ → ℂ, ContinuousOn G {s : ℂ | 1 ≤ s.re} ∧
      ∀ s : ℂ, 1 < s.re →
        G s = -deriv riemannZeta s / riemannZeta s - 1 / (s - 1) := by sorry
lemma progression_mangoldt_boundary (q : ℕ) [NeZero q] (a : ZMod q) (ha : IsUnit a) :
    ∃ G : ℂ → ℂ, ContinuousOn G {s : ℂ | 1 ≤ s.re} ∧
      ∀ s : ℂ, 1 < s.re →
        LSeriesSummable
          (fun n => if (n : ZMod q) = a then (ArithmeticFunction.vonMangoldt n : ℂ) else 0) s ∧
        LSeries
          (fun n => if (n : ZMod q) = a then (ArithmeticFunction.vonMangoldt n : ℂ) else 0) s =
          (Nat.totient q : ℂ)⁻¹ *
            ∑ χ : DirichletCharacter ℂ q,
              (χ a)⁻¹ * (-deriv χ.LFunction s / χ.LFunction s) ∧
        G s = LSeries
          (fun n => if (n : ZMod q) = a then (ArithmeticFunction.vonMangoldt n : ℂ) else 0) s -
          (Nat.totient q : ℂ)⁻¹ / (s - 1) := by sorry

/-! AN.7: initial series on the actual complex domain. -/

def lerch_transcendent (z s c : ℂ) : ℂ :=
  ∑' n : ℕ, z ^ n * Complex.exp (-s * Complex.log ((n : ℂ) + c))
lemma lerch_transcendent.series (z s c : ℂ) (hz : ‖z‖ < 1) (hc : 0 < c.re) :
    Summable (fun n : ℕ => z ^ n * Complex.exp (-s * Complex.log ((n : ℂ) + c))) := by sorry
lemma lerch_transcendent.zero (s c : ℂ) (hc : 0 < c.re) :
    lerch_transcendent 0 s c = Complex.exp (-s * Complex.log c) := by sorry
lemma lerch_transcendent.shift (z s c : ℂ) (hz : ‖z‖ < 1) (hc : 0 < c.re) :
    lerch_transcendent z s c = Complex.exp (-s * Complex.log c) +
      z * lerch_transcendent z s (c + 1) := by sorry
/-- The comparison RHS is the additive-parameter series, not a second definition. -/
lemma lerch_transcendent.exp_change (a s c : ℂ) (ha : 0 < a.im) (hc : 0 < c.re) :
    lerch_transcendent (Complex.exp (2 * Real.pi * Complex.I * a)) s c =
      ∑' n : ℕ, Complex.exp (2 * Real.pi * Complex.I * a * n) *
        Complex.exp (-s * Complex.log ((n : ℂ) + c)) := by sorry
lemma lerch_transcendent.polylog (z s : ℂ) (hz : ‖z‖ < 1) :
    z * lerch_transcendent z s 1 =
      ∑' n : ℕ, z ^ (n + 1) * Complex.exp (-s * Complex.log ((n + 1 : ℕ) : ℂ)) := by sorry
lemma lerch_compact_series_bound (K : Set (ℂ × ℂ × ℂ)) (hK : IsCompact K)
    (hdom : K ⊆ {q | ‖q.2.1‖ < 1 ∧ 0 < q.2.2.re}) (m : ℕ) :
    ∃ g : ℕ → ℝ, Summable g ∧ (∀ n, 0 ≤ g n) ∧
      ∀ n : ℕ, ∀ q ∈ K,
        ‖iteratedFDeriv ℂ m (fun q : ℂ × ℂ × ℂ =>
          q.2.1 ^ n * Complex.exp (-q.1 * Complex.log ((n : ℂ) + q.2.2))) q‖ ≤ g n :=
  by sorry
lemma lerch_transcendent.holomorphic :
    DifferentiableOn ℂ (fun q : ℂ × ℂ × ℂ => lerch_transcendent q.2.1 q.1 q.2.2)
      {q | ‖q.2.1‖ < 1 ∧ 0 < q.2.2.re} := by sorry
lemma lerch_transcendent.deriv_s (z s c : ℂ) (hz : ‖z‖ < 1) (hc : 0 < c.re) :
    deriv (fun s => lerch_transcendent z s c) s =
      -∑' n : ℕ, z ^ n * Complex.log ((n : ℂ) + c) *
        Complex.exp (-s * Complex.log ((n : ℂ) + c)) := by sorry
-- lerch_transcendent.zero
example : lerch_transcendent 0 2 1 = 1 := by sorry
-- lerch_transcendent.s_zero
example (z c : ℂ) (hz : ‖z‖ < 1) (hc : 0 < c.re) :
    lerch_transcendent z 0 c = (1 - z)⁻¹ := by sorry
-- lerch_transcendent.s_minus_one
example (z c : ℂ) (hz : ‖z‖ < 1) (hc : 0 < c.re) :
    lerch_transcendent z (-1) c = c / (1 - z) + z / (1 - z) ^ 2 := by sorry
-- lerch_transcendent.normalization
example : lerch_transcendent (1 / 2) 0 1 = 2 ∧
    (1 / 2 : ℂ) * lerch_transcendent (1 / 2) 0 1 = 1 := by sorry

def complex_hurwitz_series (s c : ℂ) : ℂ :=
  ∑' n : ℕ, Complex.exp (-s * Complex.log ((n : ℂ) + c))
lemma complex_hurwitz_series.series (s c : ℂ) (hs : 1 < s.re) (hc : 0 < c.re) :
    Summable (fun n : ℕ => Complex.exp (-s * Complex.log ((n : ℂ) + c))) := by sorry
lemma complex_hurwitz_series.shift (s c : ℂ) (hs : 1 < s.re) (hc : 0 < c.re) :
    complex_hurwitz_series s (c + 1) = complex_hurwitz_series s c -
      Complex.exp (-s * Complex.log c) := by sorry
/-- Use the pinned circle Hurwitz function and the positive endpoint representative. -/
lemma complex_hurwitz_series.real_circle (s : ℂ) (c : ℝ)
    (hs : 1 < s.re) (hc : 0 < c) (hc1 : c ≤ 1) :
    complex_hurwitz_series s (c : ℂ) = HurwitzZeta.hurwitzZeta (c : UnitAddCircle) s := by sorry
lemma complex_hurwitz_series.c_one (s : ℂ) (hs : 1 < s.re) :
    complex_hurwitz_series s 1 = riemannZeta s := by sorry
-- complex_hurwitz_series.one
example : complex_hurwitz_series 2 1 = (Real.pi : ℂ) ^ 2 / 6 := by sorry
-- complex_hurwitz_series.half
example (s : ℂ) (hs : 1 < s.re) :
    complex_hurwitz_series s (1 / 2) = ((2 : ℂ) ^ s - 1) * riemannZeta s := by sorry
-- complex_hurwitz_series.excluded
example : ¬ (0 < (0 : ℂ).re) := by sorry

-- complex_hurwitz_series.nonreal_shift
example : complex_hurwitz_series 2 (1 + Complex.I) -
    complex_hurwitz_series 2 (2 + Complex.I) = -Complex.I / 2 := by sorry

lemma lerch_parameter_shift (z s c : ℂ) (hz : ‖z‖ < 1) (hc : 0 < c.re) :
    lerch_transcendent z s c = Complex.exp (-s * Complex.log c) +
      z * lerch_transcendent z s (c + 1) := by sorry
lemma lerch_z_derivative (z s c : ℂ) (hz : ‖z‖ < 1) (hc : 0 < c.re) :
    z * deriv (fun z => lerch_transcendent z s c) z +
      c * lerch_transcendent z s c = lerch_transcendent z (s - 1) c := by sorry
lemma lerch_c_derivative (z s c : ℂ) (hz : ‖z‖ < 1) (hc : 0 < c.re) :
    deriv (fun c => lerch_transcendent z s c) c =
      -s * lerch_transcendent z (s + 1) c := by sorry

/-- F is the principal-sheet extension, not the totalized series off its disc. -/
lemma lerch_integral_representation :
    ∃ F : (ℂ × ℂ × ℂ) → ℂ,
      DifferentiableOn ℂ F {q | 0 < q.1.re ∧ 0 < q.2.2.re ∧
        q.2.1 ∉ (fun t : ℝ => (t : ℂ)) '' Set.Ici 1} ∧
      (∀ s z c : ℂ, 0 < s.re → 0 < c.re → ‖z‖ < 1 →
        F (s, z, c) = lerch_transcendent z s c) ∧
      ∀ s z c : ℂ, 0 < s.re → 0 < c.re →
        z ∉ (fun t : ℝ => (t : ℂ)) '' Set.Ici 1 →
        MeasureTheory.IntegrableOn
          (fun t : ℝ => Complex.exp ((s - 1) * (Real.log t : ℂ)) *
            Complex.exp (-c * t) / (1 - z * Complex.exp (-t))) (Set.Ioi 0) ∧
        F (s, z, c) = (Complex.Gamma s)⁻¹ * ∫ t : ℝ in Set.Ioi 0,
          Complex.exp ((s - 1) * (Real.log t : ℂ)) *
            Complex.exp (-c * t) / (1 - z * Complex.exp (-t)) := by sorry

/-- H's value at the pole is unspecified; R is the genuine removable extension. -/
theorem complex_hurwitz_continuation :
    ∃ H R : (ℂ × ℂ) → ℂ,
      DifferentiableOn ℂ H {q | q.1 ≠ 1 ∧ 0 < q.2.re} ∧
      DifferentiableOn ℂ R {q | 0 < q.2.re} ∧
      (∀ c : ℂ, 0 < c.re → R (1, c) = 1) ∧
      (∀ s c : ℂ, s ≠ 1 → 0 < c.re → R (s, c) = (s - 1) * H (s, c)) ∧
      (∀ s c : ℂ, 1 < s.re → 0 < c.re → H (s, c) = complex_hurwitz_series s c) ∧
      (∀ s c : ℂ, s ≠ 1 → 0 < c.re →
        H (s, c + 1) = H (s, c) - Complex.exp (-s * Complex.log c)) := by sorry

/-- Any continuation matching the convergent series has these off-pole values. -/
theorem complex_hurwitz_bernoulli_values (H : (ℂ × ℂ) → ℂ)
    (hH : DifferentiableOn ℂ H {q | q.1 ≠ 1 ∧ 0 < q.2.re})
    (hseries : ∀ s c : ℂ, 1 < s.re → 0 < c.re →
      H (s, c) = complex_hurwitz_series s c) (m : ℕ) (c : ℂ) (hc : 0 < c.re) :
    H (-(m : ℂ), c) =
      -(Polynomial.bernoulli (m + 1)).eval₂ (algebraMap ℚ ℂ) c / (m + 1 : ℕ) := by sorry

/-- Initial boundary series: the prefactor is essential. -/
lemma exp_zeta_lerch_comparison (a : ℝ) (s : ℂ) (hs : 1 < s.re) :
    HurwitzZeta.expZeta (a : UnitAddCircle) s =
      Complex.exp (2 * Real.pi * Complex.I * a) *
        lerch_transcendent (Complex.exp (2 * Real.pi * Complex.I * a)) s 1 := by sorry
-- Theorem6.1(2) order-zero exception: q₀ differs from the periodic value by1.
example : riemannZeta 0 = -(1 / 2 : ℂ) := by sorry
example (z : ℂ) (hz : z ≠ 1) : z / (1 - z) = (1 - z)⁻¹ - 1 := by sorry

lemma lerch_zero_order_value (z c : ℂ) (hz : ‖z‖ < 1) (hc : 0 < c.re) :
    lerch_transcendent z 0 c = (1 - z)⁻¹ := by sorry
lemma lerch_nonpositive_special_values (m : ℕ) (z c : ℂ)
    (hz : ‖z‖ < 1) (hc : 0 < c.re) :
    let D : (ℂ → ℂ) → (ℂ → ℂ) := fun f z => z * deriv f z + c * f z
    lerch_transcendent z (-(m : ℂ)) c = (D^[m]) (fun z => (1 - z)⁻¹) z := by sorry
lemma circle_hurwitz_import (s : ℂ) (c : ℝ)
    (hs : 1 < s.re) (hc : 0 < c) (hc1 : c ≤ 1) :
    complex_hurwitz_series s (c : ℂ) = HurwitzZeta.hurwitzZeta (c : UnitAddCircle) s := by sorry
lemma dirichlet_hurwitz_finite_sum (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q)
    (s : ℂ) (hs : 1 < s.re) :
    DirichletCharacter.LFunction χ s = (q : ℂ) ^ (-s) *
      ∑ a ∈ Finset.Icc 1 q, χ (a : ZMod q) *
        complex_hurwitz_series s ((a : ℂ) / q) := by sorry
lemma lerch_boundary_degeneration (s c : ℂ) (hs : 1 < s.re) (hc : 0 < c.re) :
    Tendsto (fun r : ℝ => lerch_transcendent (r : ℂ) s c) (𝓝[<] (1 : ℝ))
      (𝓝 (complex_hurwitz_series s c)) := by sorry
-- E26: an absolutely convergent counterexample inside the z disc.
example : lerch_transcendent (-(1 / 2 : ℂ)) 0 1 = 2 / 3 ∧
    (-(1 / 2 : ℂ)) * lerch_transcendent (-(1 / 2 : ℂ)) 0 1 = -(1 / 3) := by sorry

lemma lerch_parameter_derivatives (z s c : ℂ) (hz : ‖z‖ < 1) (hc : 0 < c.re) :
    deriv (fun c => lerch_transcendent z s c) c = -s * lerch_transcendent z (s + 1) c ∧
      z * deriv (fun z => lerch_transcendent z (s + 1) c) z +
        c * lerch_transcendent z (s + 1) c = lerch_transcendent z s c := by sorry
lemma lerch_pde (z s c : ℂ) (hz : ‖z‖ < 1) (hc : 0 < c.re) :
    z * deriv (fun z => deriv (fun c => lerch_transcendent z s c) c) z +
      c * deriv (fun c => lerch_transcendent z s c) c = -s * lerch_transcendent z s c := by sorry

/-! Further theorem forms with concrete baseline carriers. -/

theorem mertens_prime_reciprocal :
    ∃ B C : ℝ, 0 < C ∧ ∀ x : ℝ, 2 ≤ x →
      |(∑ p ∈ (Finset.range (Nat.floor x + 1)).filter Nat.Prime, (p : ℝ)⁻¹) -
        Real.log (Real.log x) - B| ≤ C / Real.log x := by sorry

theorem mertens_first_theorem :
    ∃ C : ℝ, 0 < C ∧ ∀ x : ℝ, 2 ≤ x →
      |(∑ p ∈ (Finset.range (Nat.floor x + 1)).filter
          (fun p : ℕ => p.Prime ∧ (p : ℝ) < x), Real.log p / p) - Real.log x| ≤ C := by sorry

theorem mertens_prime_product :
    ∃ C : ℝ, 0 < C ∧ ∀ x : ℝ, 2 ≤ x →
      |(∏ p ∈ (Finset.range (Nat.floor x + 1)).filter Nat.Prime,
          (1 - (p : ℝ)⁻¹)⁻¹) - Real.exp Real.eulerMascheroniConstant * Real.log x| ≤ C := by sorry

/-- The local expression is defined at n = 0 without truncated natural subtraction. -/
theorem gamma_prime_product_tail (n : ℕ) :
    ∃ C : ℝ, 0 < C ∧ ∀ x : ℝ, Real.exp 2 ≤ x → ∀ S : Set ℕ,
      ∃ P : ℝ,
        HasProd
          (fun p : {p : ℕ // p.Prime ∧ Real.log x < p ∧ p ∈ S} =>
            1 - (p.val : ℝ)⁻¹ +
              (1 + ((p.val : ℝ) - 1)⁻¹) ^ n / (p.val : ℝ)) P ∧
        |P - 1| ≤ C / Real.log x := by sorry

-- Acceptance check for AN.5/gamma-prime-product-tail at n = 0.
example (p : ℕ) (hp : p.Prime) :
    1 - (p : ℝ)⁻¹ + (1 + ((p : ℝ) - 1)⁻¹) ^ (0 : ℕ) / (p : ℝ) = 1 := by sorry

theorem mertens_product_comparison :
    ∃ c C : ℝ, 0 < c ∧ 0 < C ∧ ∀ y : ℝ, 2 ≤ y →
      c / Real.log y ≤
        ∏ p ∈ (Finset.range (Nat.floor y + 1)).filter Nat.Prime, (1 - (p : ℝ)⁻¹) ∧
      (∏ p ∈ (Finset.range (Nat.floor y + 1)).filter Nat.Prime,
        (1 - (p : ℝ)⁻¹)) ≤ C / Real.log y := by sorry

theorem shifted_coprime_mobius_sum (A : ℝ) (hA : 0 < A) :
    ∃ C T₀ : ℝ, 0 < C ∧ 2 ≤ T₀ ∧ ∀ T : ℝ, T₀ ≤ T →
      ∀ q : ℕ, 1 ≤ q → (q : ℝ) ≤ Real.sqrt T →
        |(∑ t ∈ (Finset.Icc 1 (Nat.floor (T / q))).filter (fun t => Nat.Coprime t q),
            (ArithmeticFunction.moebius t : ℝ) * Real.log ((q : ℝ) * t) / t) +
          (q : ℝ) / q.totient| ≤ C * (Real.log T) ^ (-A) := by sorry

theorem totient_reciprocal_bound :
    ∃ C : ℝ, 0 < C ∧ ∀ n : ℕ, 3 ≤ n →
      ((n.totient : ℝ)⁻¹) ≤ C * Real.log (Real.log n) / n := by sorry

lemma harmonic_euler_remainder (N : ℕ) (hN : 1 ≤ N) :
    let E := (∑ n ∈ Finset.Icc 1 N, (n : ℝ)⁻¹) -
      Real.log N - Real.eulerMascheroniConstant
    0 < E ∧ E < Real.log (1 + (N : ℝ)⁻¹) ∧
      Real.log (1 + (N : ℝ)⁻¹) ≤ (N : ℝ)⁻¹ := by sorry
lemma divisor_hyperbola_identity (x : ℝ) (hx : 1 ≤ x) :
    let M := Nat.floor (Real.sqrt x)
    (∑ n ∈ Finset.Icc 1 (Nat.floor x), n.divisors.card) + M ^ 2 =
      2 * ∑ a ∈ Finset.Icc 1 M, Nat.floor (x / a) := by sorry
-- The inclusive hyperbola identity at its smallest and square cutoffs.
example : (∑ n ∈ Finset.Icc 1 4, n.divisors.card) + 2 ^ 2 = 2 * (4 + 2) := by sorry
example : (∑ n ∈ Finset.Icc 1 1, n.divisors.card) + 1 ^ 2 = 2 * 1 := by sorry

theorem dirichlet_divisor_average :
    ∃ C : ℝ, 0 < C ∧ ∀ x : ℝ, 2 ≤ x →
      |(∑ n ∈ Finset.Icc 1 (Nat.floor x), (n.divisors.card : ℝ)) -
          (x * Real.log x + (2 * Real.eulerMascheroniConstant - 1) * x)| ≤
        C * Real.sqrt x := by sorry

theorem zeta_second_moment :
    ∃ C T₀ : ℝ, 0 < C ∧ 2 ≤ T₀ ∧ ∀ T : ℝ, T₀ ≤ T →
      |(∫ t in (0 : ℝ)..T, ‖riemannZeta ((1 / 2 : ℂ) + t * Complex.I)‖ ^ 2) -
        (T * Real.log (T / (2 * Real.pi)) + (2 * Real.eulerMascheroniConstant - 1) * T)| ≤
      C * Real.sqrt T * Real.log T := by sorry

theorem zeta_fourth_moment :
    ∃ C T₀ : ℝ, 0 < C ∧ 2 ≤ T₀ ∧ ∀ T : ℝ, T₀ ≤ T →
      |(∫ t in (0 : ℝ)..T, ‖riemannZeta ((1 / 2 : ℂ) + t * Complex.I)‖ ^ 4) -
        (1 / (2 * Real.pi ^ 2)) * T * (Real.log T) ^ 4| ≤
      C * T * (Real.log T) ^ 3 := by sorry

theorem medium_prime_cardinality (m : ℕ) :
    Tendsto (fun x : ℝ => (medium_prime_products x m).card /
      (x ^ m / (2 ^ m * (m.factorial : ℝ) * (Real.log x) ^ m)))
      atTop (𝓝 1) := by sorry

theorem halasz_classical :
    ∃ C : ℝ, 0 < C ∧ ∀ f : ℕ → ℂ,
      f 1 = 1 → (∀ a b : ℕ, Nat.Coprime a b → f (a * b) = f a * f b) →
      (∀ n : ℕ, ‖f n‖ ≤ 1) → ∀ x T : ℝ, 2 ≤ x → 1 ≤ T →
      let M := sInf {r : ℝ | ∃ t : ℝ, t ∈ Set.Icc (-2 * T) (2 * T) ∧
        r = pretentious_distance f
          (fun n => Complex.exp (Complex.I * t * Real.log n)) x ^ 2}
      ‖∑ n ∈ Finset.Icc 1 (Nat.floor x), f n‖ / x ≤
        C * ((1 + M) * Real.exp (-M) + T ^ (-1 / 2 : ℝ)) := by sorry

theorem dirichlet_conductor_zero_free_region :
    ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q], 2 ≤ q →
      ∀ χ : DirichletCharacter ℂ q, χ.IsPrimitive → χ ≠ 1 →
      (∀ s : ℂ, 1 - c / Real.log ((q : ℝ) * (|s.im| + 2)) ≤ s.re →
          χ.LFunction s ≠ 0) ∨
      (∃ β : ℝ, χ ^ 2 = 1 ∧ β < 1 ∧
        1 - c / Real.log ((q : ℝ) * 2) ≤ β ∧ χ.LFunction (β : ℂ) = 0 ∧
        analyticOrderNatAt χ.LFunction (β : ℂ) = 1 ∧
        ∀ s : ℂ, 1 - c / Real.log ((q : ℝ) * (|s.im| + 2)) ≤ s.re →
          s ≠ (β : ℂ) → χ.LFunction s ≠ 0) := by sorry

theorem order_one_hadamard (f : ℂ → ℂ) (hf : entire_order_at_most f 1)
    (hnonzero : ∃ z : ℂ, f z ≠ 0) :
    ∃ a b : ℂ, ∃ u : ℕ → Option ℂ,
      (∀ n α, u n = some α → α ≠ 0 ∧ f α = 0) ∧
      (∀ α : ℂ, Set.Finite {n : ℕ | u n = some α}) ∧
      (∀ α : ℂ, α ≠ 0 →
        Nat.card {n : ℕ // u n = some α} = analyticOrderNatAt f α) ∧
      TendstoLocallyUniformlyOn
        (fun S : Finset ℕ => fun z : ℂ => ∏ n ∈ S, match u n with
          | none => (1 : ℂ)
          | some α => genus_one_factor (z / α))
        (fun z : ℂ => ∏' n : ℕ, match u n with
          | none => (1 : ℂ)
          | some α => genus_one_factor (z / α)) atTop Set.univ ∧
      ∀ z : ℂ,
        Multipliable (fun n => match u n with
          | none => (1 : ℂ)
          | some α => genus_one_factor (z / α)) ∧
        f z = z ^ analyticOrderNatAt f 0 * Complex.exp (a + b * z) *
          ∏' n : ℕ, match u n with
            | none => (1 : ℂ)
            | some α => genus_one_factor (z / α) := by sorry

/-! Hadamard review interfaces: indexed occurrences retain multiplicity.
All signatures below are suggestions with admitted proofs. The original source
leaves the three factor estimates as Exercise 8.4.10; the packet gives their
mathematical derivations and records the remaining generic limit adapters. -/

lemma origin_zero_factor (f : ℂ → ℂ) (hf : Differentiable ℂ f)
    (hnonzero : ∃ z : ℂ, f z ≠ 0) :
    ∃ g : ℂ → ℂ, Differentiable ℂ g ∧ g 0 ≠ 0 ∧
      (∀ z, f z = z ^ analyticOrderNatAt f 0 * g z) ∧
      (∀ ρ : ℝ, entire_order_at_most f ρ → entire_order_at_most g ρ) := by sorry

lemma compact_zero_count (f : ℂ → ℂ) (hf : Differentiable ℂ f)
    (hnonzero : ∃ z : ℂ, f z ≠ 0) :
    (∀ R : ℝ, Set.Finite {z : ℂ | ‖z‖ ≤ R ∧ f z = 0}) ∧
      ∀ z : ℂ, analyticOrderAt f z ≠ ⊤ := by sorry

lemma continuous_log_analytic_upgrade (U : Set ℂ) (hU : IsOpen U)
    (g L : ℂ → ℂ) (hg : AnalyticOnNhd ℂ g U)
    (hgne : ∀ z ∈ U, g z ≠ 0) (hL : ContinuousOn L U)
    (hexp : ∀ z ∈ U, Complex.exp (L z) = g z) :
    AnalyticOnNhd ℂ L U := by sorry

lemma borel_cauchy_affine_log (h : ℂ → ℂ) (hh : Differentiable ℂ h)
    (hgrowth : ∀ ε : ℝ, 0 < ε → ∃ C : ℝ, 0 < C ∧
      ∀ z : ℂ, (h z).re ≤ C * (1 + ‖z‖ ^ (1 + ε))) :
    ∃ a b : ℂ, ∀ z : ℂ, h z = a + b * z := by sorry

lemma canonical_factor_log_tail (w : ℂ) (hw : ‖w‖ ≤ 1 / 2) :
    Complex.exp (Complex.log (1 - w) + w) = genus_one_factor w ∧
      HasSum (fun n : ℕ => -(w ^ (n + 2) / (n + 2)))
        (Complex.log (1 - w) + w) ∧
      ‖Complex.log (1 - w) + w‖ ≤ ‖w‖ ^ 2 := by sorry

section IndexedCanonicalProducts

variable {ι : Type*} [DecidableEq ι]

lemma zero_reciprocal_truncation_bound (α : ι → ℂ)
    (hα : ∀ i, α i ≠ 0)
    (hfinite : ∀ R : ℝ, Set.Finite {i | ‖α i‖ ≤ R})
    (b C : ℝ) (hb : 1 < b) (hb2 : b < 2) (hC : 0 < C)
    (hcount : ∀ R : ℝ, 1 ≤ R →
      (Set.ncard {i | ‖α i‖ ≤ R} : ℝ) ≤ C * R ^ b) :
    ∃ K : ℝ, 0 < K ∧ ∀ R : ℝ, 2 ≤ R → ∀ S : Finset ι,
      (∀ i ∈ S, ‖α i‖ < R) →
      ∑ i ∈ S, ‖α i‖⁻¹ ≤ K * R ^ (b - 1) := by sorry

lemma zero_reciprocal_square_tail_bound (α : ι → ℂ)
    (hα : ∀ i, α i ≠ 0)
    (hfinite : ∀ R : ℝ, Set.Finite {i | ‖α i‖ ≤ R})
    (b C : ℝ) (hb : 1 < b) (hb2 : b < 2) (hC : 0 < C)
    (hcount : ∀ R : ℝ, 1 ≤ R →
      (Set.ncard {i | ‖α i‖ ≤ R} : ℝ) ≤ C * R ^ b) :
    ∃ K : ℝ, 0 < K ∧ ∀ R : ℝ, 1 ≤ R →
      Summable (fun i : {i // R < ‖α i‖} => ‖α i‖ ^ (-2 : ℝ)) ∧
      (∑' i : {i // R < ‖α i‖}, ‖α i‖ ^ (-2 : ℝ)) ≤
        K * R ^ (b - 2) := by sorry

lemma canonical_product_inner_lower_bound (α : ι → ℂ)
    (hα : ∀ i, α i ≠ 0)
    (hfinite : ∀ R : ℝ, Set.Finite {i | ‖α i‖ ≤ R})
    (b C : ℝ) (hb : 1 < b) (hb2 : b < 2) (hC : 0 < C)
    (hcount : ∀ R : ℝ, 1 ≤ R →
      (Set.ncard {i | ‖α i‖ ≤ R} : ℝ) ≤ C * R ^ b) :
    ∃ K : ℝ, 0 < K ∧ ∀ R : ℝ, 2 ≤ R → ∀ z : ℂ, ‖z‖ = R →
      ∀ S : Finset ι, (∀ i ∈ S, ‖α i‖ < R / 2) →
      -K * R ^ b ≤ ∑ i ∈ S, Real.log ‖genus_one_factor (z / α i)‖ := by sorry

lemma canonical_product_middle_lower_bound (α : ι → ℂ)
    (hα : ∀ i, α i ≠ 0)
    (hfinite : ∀ R : ℝ, Set.Finite {i | ‖α i‖ ≤ R})
    (b C : ℝ) (hb : 1 < b) (hb2 : b < 2) (hC : 0 < C)
    (hcount : ∀ R : ℝ, 1 ≤ R →
      (Set.ncard {i | ‖α i‖ ≤ R} : ℝ) ≤ C * R ^ b) :
    ∃ K : ℝ, 0 < K ∧ ∀ R : ℝ, 2 ≤ R →
      (∀ i, ‖α i‖ ^ (-2 : ℝ) < |R - ‖α i‖|) →
      ∀ z : ℂ, ‖z‖ = R → ∀ S : Finset ι,
      (∀ i ∈ S, R / 2 ≤ ‖α i‖ ∧ ‖α i‖ ≤ 2 * R) →
      -K * R ^ b * (1 + Real.log (2 * R)) ≤
        ∑ i ∈ S, Real.log ‖genus_one_factor (z / α i)‖ := by sorry

lemma canonical_product_outer_lower_bound (α : ι → ℂ)
    (hα : ∀ i, α i ≠ 0)
    (hfinite : ∀ R : ℝ, Set.Finite {i | ‖α i‖ ≤ R})
    (b C : ℝ) (hb : 1 < b) (hb2 : b < 2) (hC : 0 < C)
    (hcount : ∀ R : ℝ, 1 ≤ R →
      (Set.ncard {i | ‖α i‖ ≤ R} : ℝ) ≤ C * R ^ b) :
    ∃ K : ℝ, 0 < K ∧ ∀ R : ℝ, 2 ≤ R → ∀ z : ℂ, ‖z‖ = R →
      let P := ∏' i : {i // 2 * R < ‖α i‖}, genus_one_factor (z / α i)
      P ≠ 0 ∧ -K * R ^ b ≤ Real.log ‖P‖ := by sorry

lemma canonical_product_lower_good_circles (α : ι → ℂ)
    (hα : ∀ i, α i ≠ 0)
    (hfinite : ∀ R : ℝ, Set.Finite {i | ‖α i‖ ≤ R})
    (hcount : ∀ b : ℝ, 1 < b → ∃ C : ℝ, 0 < C ∧
      ∀ R : ℝ, 1 ≤ R → (Set.ncard {i | ‖α i‖ ≤ R} : ℝ) ≤ C * R ^ b)
    (ε : ℝ) (hε : 0 < ε) (hε1 : ε < 1) :
    ∃ C : ℝ, 0 < C ∧ ∀ R : ℝ, 2 ≤ R →
      (∀ i, ‖α i‖ ^ (-2 : ℝ) < |R - ‖α i‖|) →
      ∀ z : ℂ, ‖z‖ = R →
        -C * R ^ (1 + ε) ≤ Real.log ‖∏' i, genus_one_factor (z / α i)‖ := by sorry

end IndexedCanonicalProducts

-- Empty products and origin multiplicity remain visible in the prototype.
example (z : ℂ) : z ^ 2 * Complex.exp z =
    z ^ 2 * Complex.exp (0 + 1 * z) *
      ∏' _i : Fin 0, genus_one_factor z := by sorry
example (z : ℂ) : genus_one_factor z * genus_one_factor (-z) =
    1 - z ^ 2 := by sorry


/-- AN.2/theta-tail-decay: the kernel is already in Mathlib. -/
lemma theta_tail_decay (x : ℝ) (hx : 1 ≤ x) :
    0 ≤ (HurwitzZeta.evenKernel 0 x - 1) / 2 ∧
    (HurwitzZeta.evenKernel 0 x - 1) / 2 ≤
      Real.exp (-Real.pi * x) / (1 - Real.exp (-Real.pi)) := by sorry

/-- AN.2/xi-integral-comparison: the finite-integral limit is local in s. -/
lemma xi_integral_comparison :
    let integrand := fun (s : ℂ) (x : ℝ) =>
      ((x : ℂ) ^ (s / 2 - 1) + (x : ℂ) ^ ((1 - s) / 2 - 1)) *
        (((HurwitzZeta.evenKernel 0 x - 1) / 2 : ℝ) : ℂ)
    (∀ s : ℂ, MeasureTheory.IntegrableOn (integrand s) (Set.Ioi 1)) ∧
    (∀ s : ℂ, riemann_xi s = 1 / 2 + (s * (s - 1) / 2) *
      ∫ x in Set.Ioi (1 : ℝ), integrand s x) ∧
    TendstoLocallyUniformlyOn
      (fun (R : ℝ) (s : ℂ) => ∫ x in Set.Icc (1 : ℝ) R, integrand s x)
      (fun s : ℂ => ∫ x in Set.Ioi (1 : ℝ), integrand s x)
      atTop Set.univ := by sorry

/-- AN.2/gamma-integral-growth-majorant: the constant can be explicit. -/
lemma gamma_integral_growth_majorant (r : ℝ) (hr : 2 ≤ r) :
    MeasureTheory.IntegrableOn
      (fun x : ℝ => (x ^ (r / 2 + 1) + 1) * Real.exp (-Real.pi * x)) (Set.Ioi 1) ∧
    (∫ x in Set.Ioi (1 : ℝ), (x ^ (r / 2 + 1) + 1) * Real.exp (-Real.pi * x)) ≤
      Real.exp (2 * r * Real.log (2 + r)) := by sorry

/-- AN.2/xi-order-one-growth: this is an upper-order statement. -/
lemma xi_order_one_growth :
    (∃ C R : ℝ, 0 < C ∧ 0 < R ∧ ∀ s : ℂ, R ≤ ‖s‖ →
      ‖riemann_xi s‖ ≤ Real.exp (C * ‖s‖ * Real.log (2 + ‖s‖))) ∧
    entire_order_at_most riemann_xi 1 := by sorry

/-- AN.2/xi-entire-and-endpoints. -/
lemma xi_entire_and_endpoints :
    Differentiable ℂ riemann_xi ∧ riemann_xi 0 = 1 / 2 ∧ riemann_xi 1 = 1 / 2 := by sorry

/-- AN.2/xi-zero-critical-strip: neither boundary line contains a xi zero. -/
lemma xi_zero_critical_strip (ρ : ℂ) (hρ : riemann_xi ρ = 0) :
    0 < ρ.re ∧ ρ.re < 1 := by sorry

/-- AN.2/zeta-hadamard-log-derivative: analytic-order weights express the
same multiplicities as the repeated-zero family in the mathematical statement. -/
lemma zeta_hadamard_log_derivative :
    ∃ B : ℂ, ∀ s : ℂ, s ≠ 0 → s ≠ 1 → riemannZeta s ≠ 0 →
      (∀ n : ℕ, s / 2 ≠ -(n : ℂ)) →
      let summand := fun ρ : {z : ℂ // riemann_xi z = 0} =>
        (analyticOrderNatAt riemann_xi ρ.1 : ℂ) * (1 / (s - ρ.1) + 1 / ρ.1)
      Summable summand ∧
      deriv riemannZeta s / riemannZeta s = B - 1 / s - 1 / (s - 1) +
        (Real.log Real.pi : ℂ) / 2 - Complex.digamma (s / 2) / 2 + ∑' ρ, summand ρ := by sorry

/-- AN.2/digamma-right-half-plane: one constant works on the whole half-plane. -/
lemma digamma_right_half_plane :
    ∃ C : ℝ, 0 < C ∧ ∀ z : ℂ, (1 / 2 : ℝ) ≤ z.re → 2 ≤ ‖z‖ →
      ‖Complex.digamma z - Complex.log z‖ ≤ C / ‖z‖ := by sorry

/-- AN.2/zeta-log-derivative-right: the n=0 term is totalized to zero. -/
lemma zeta_log_derivative_right :
    Summable (fun n : ℕ => ArithmeticFunction.vonMangoldt n / (n : ℝ) ^ 2) ∧
    ∀ s : ℂ, 2 ≤ s.re → ‖deriv riemannZeta s / riemannZeta s‖ ≤
      ∑' n : ℕ, ArithmeticFunction.vonMangoldt n / (n : ℝ) ^ 2 := by sorry

/-- AN.2/zeta-pole-log-derivative: constants precede the real argument. -/
lemma zeta_pole_log_derivative :
    ∃ δ K : ℝ, 0 < δ ∧ 0 < K ∧ ∀ σ : ℝ, 1 < σ → σ < 1 + δ →
      ‖-deriv riemannZeta (σ : ℂ) / riemannZeta (σ : ℂ) - 1 / ((σ : ℂ) - 1)‖ ≤ K := by sorry

/-- AN.2/zeta-three-four-one-derivative: the generic positivity remains ADS8. -/
lemma zeta_three_four_one_derivative (σ t : ℝ) (hσ : 1 < σ) :
    0 ≤ 3 * (-deriv riemannZeta (σ : ℂ) / riemannZeta (σ : ℂ)).re +
      4 * (-deriv riemannZeta ((σ : ℂ) + t * Complex.I) /
        riemannZeta ((σ : ℂ) + t * Complex.I)).re +
      (-deriv riemannZeta ((σ : ℂ) + (2 * t : ℝ) * Complex.I) /
        riemannZeta ((σ : ℂ) + (2 * t : ℝ) * Complex.I)).re := by sorry

/-- AN.2/single-zero-positive-term: both parts of the corrected summand matter. -/
lemma single_zero_positive_term (ρ : ℂ) (hρ : riemann_xi ρ = 0)
    (σ : ℝ) (hσ : 1 < σ) :
    (1 / ((σ : ℂ) + ρ.im * Complex.I - ρ)).re = 1 / (σ - ρ.re) ∧
    0 < (1 / ρ).re ∧
    ∀ τ : {z : ℂ // riemann_xi z = 0},
      0 ≤ (1 / ((σ : ℂ) + ρ.im * Complex.I - τ.1) + 1 / τ.1).re := by sorry

/-- AN.2/zero-free-region-constant-selection: only high positive heights. -/
lemma zero_free_region_constant_selection :
    ∃ c t₀ : ℝ, 0 < c ∧ 1 < t₀ ∧ ∀ ρ : ℂ, riemann_xi ρ = 0 →
      t₀ ≤ ρ.im → ρ.re < 1 - c / Real.log ρ.im := by sorry


/-- AN.3/zeta-poisson-zero-weight: a positive series, with analytic-order weights. -/
lemma zeta_poisson_zero_weight :
    ∃ C : ℝ, 0 < C ∧ ∀ t : ℝ,
      let weight := fun ρ : {z : ℂ // riemann_xi z = 0} =>
        (analyticOrderNatAt riemann_xi ρ.1 : ℝ) / (1 + (t - ρ.1.im) ^ 2)
      Summable weight ∧ ∑' ρ, weight ρ ≤ C * Real.log (2 + |t|) := by sorry

/-- AN.3/zeta-unit-height-zero-count: a closed band inside a strict larger cutoff. -/
lemma zeta_unit_height_zero_count :
    ∃ C : ℝ, 0 < C ∧ ∀ T : ℝ, 2 ≤ T →
      (((zeta_zero_multiset (T + 2)).filter
        (fun ρ => T ≤ ρ.im ∧ ρ.im ≤ T + 1)).card : ℝ) ≤ C * Real.log (T + 2) := by sorry

/-- AN.3/good-height-selection: every zero ordinate, including nearby outside bands. -/
lemma good_height_selection :
    ∃ c : ℝ, 0 < c ∧ ∀ T : ℝ, 2 ≤ T → ∃ T' : ℝ,
      T' ∈ Set.Icc T (T + 1) ∧ ∀ ρ : ℂ, riemann_xi ρ = 0 →
        c / Real.log (T + 2) ≤ |T' - ρ.im| := by sorry

/-- AN.3/zeta-local-log-derivative: actual evaluation points must be nonzeros. -/
lemma zeta_local_log_derivative :
    ∃ C : ℝ, 0 < C ∧ ∀ σ t : ℝ, -1 ≤ σ → σ ≤ 2 → 2 ≤ |t| →
      riemannZeta ((σ : ℂ) + t * Complex.I) ≠ 0 →
      ‖deriv riemannZeta ((σ : ℂ) + t * Complex.I) /
        riemannZeta ((σ : ℂ) + t * Complex.I) -
        (((zeta_zero_multiset (|t| + 2)).filter (fun ρ => |t - ρ.im| < 1)).map
          (fun ρ => 1 / ((σ : ℂ) + t * Complex.I - ρ))).sum‖ ≤
      C * Real.log (2 + |t|) := by sorry

/-- AN.3/zeta-left-log-derivative: the excluded zeros are negative even integers. -/
lemma zeta_left_log_derivative (c : ℝ) (hc : 0 < c) :
    ∃ C : ℝ, 0 < C ∧ ∀ w : ℂ, w.re ≤ -1 →
      (∀ n : ℕ, 1 ≤ n → c ≤ ‖w + 2 * (n : ℂ)‖) →
      riemannZeta w ≠ 0 ∧ ‖deriv riemannZeta w / riemannZeta w‖ ≤
        C * Real.log (2 + ‖w‖) := by sorry

/-- AN.3/zeta-trivial-zero-simple: a zero-value theorem alone is weaker. -/
lemma zeta_trivial_zero_simple (n : ℕ) (hn : 1 ≤ n) :
    analyticOrderNatAt riemannZeta (-2 * (n : ℂ)) = 1 := by sorry

/-- AN.3/low-zero-safe-interval-kernel: subtract before bounding reciprocals. -/
lemma low_zero_safe_interval_kernel (x : ℝ) (hx : 2 ≤ x)
    (ρ : ℂ) (h0 : 0 < ρ.re) (h1 : ρ.re < 1) :
    ‖((x : ℂ) ^ ρ - ((x / 2 : ℝ) : ℂ) ^ ρ) / ρ‖ ≤
      2 * x ^ ρ.re * min 1 (1 / ‖ρ‖) := by sorry

/-- AN.3/primitive-character-unit-height-zero-count: existing Dirichlet carrier. -/
lemma primitive_character_unit_height_zero_count :
    ∃ C : ℝ, 0 < C ∧ ∀ (q : ℕ) [NeZero q], 1 ≤ q →
      ∀ χ : DirichletCharacter ℂ q, χ.IsPrimitive → χ ≠ 1 → ∀ u : ℝ,
      Finite {p : ℂ × ℕ //
        DirichletCharacter.LFunction χ p.1 = 0 ∧ 0 < p.1.re ∧ p.1.re < 1 ∧
        u ≤ p.1.im ∧ p.1.im ≤ u + 1 ∧
        p.2 < analyticOrderNatAt (DirichletCharacter.LFunction χ) p.1} ∧
      (Nat.card {p : ℂ × ℕ //
        DirichletCharacter.LFunction χ p.1 = 0 ∧ 0 < p.1.re ∧ p.1.re < 1 ∧
        u ≤ p.1.im ∧ p.1.im ≤ u + 1 ∧
        p.2 < analyticOrderNatAt (DirichletCharacter.LFunction χ) p.1} : ℝ) ≤
          C * Real.log ((q : ℝ) * (2 + |u|)) := by sorry

/-- AN.3/zero-weight-sum: an actual finite set of occurrences is exhibited. -/
lemma zero_weight_sum :
    ∃ C : ℝ, 0 < C ∧ ∀ (q : ℕ) [NeZero q], 1 ≤ q →
      ∀ χ : DirichletCharacter ℂ q, χ.IsPrimitive → ∀ T : ℝ, 2 ≤ T →
      ∃ Z : Finset (ℂ × ℕ),
        (∀ p : ℂ × ℕ, p ∈ Z ↔
          DirichletCharacter.LFunction χ p.1 = 0 ∧ 0 < p.1.re ∧ p.1.re < 1 ∧
          |p.1.im| ≤ T ∧ p.2 < analyticOrderNatAt (DirichletCharacter.LFunction χ) p.1) ∧
        (∑ p ∈ Z, min 1 (1 / ‖p.1‖)) ≤ C * Real.log ((q : ℝ) * (T + 2)) ^ 2 := by sorry

/-- AN.3/character-half-interval-formula: all constants precede conductor,
character, interval length and height; the zero sum has a finite occurrence carrier. -/
theorem character_half_interval_formula :
    ∃ C : ℝ, 0 < C ∧ ∃ k₀ : ℕ, 2 ≤ k₀ ∧
      ∀ (q : ℕ) [NeZero q], 1 ≤ q → ∀ χ : DirichletCharacter ℂ q,
      χ.IsPrimitive → χ ≠ 1 → ∀ k : ℕ, k₀ ≤ k →
      ∀ T : ℝ, 2 ≤ T → T ≤ (k : ℝ) →
      ∃ Z : Finset (ℂ × ℕ),
        (∀ p : ℂ × ℕ, p ∈ Z ↔
          DirichletCharacter.LFunction χ p.1 = 0 ∧ 0 < p.1.re ∧ p.1.re < 1 ∧
          |p.1.im| ≤ T ∧ p.2 < analyticOrderNatAt (DirichletCharacter.LFunction χ) p.1) ∧
        ‖(∑ m ∈ (Finset.range (k + 1)).filter
            (fun m : ℕ => (k : ℝ) / 2 < (m : ℝ)),
            χ (m : ZMod q) * (ArithmeticFunction.vonMangoldt m : ℂ)) +
          ∑ p ∈ Z, ((k : ℂ) ^ p.1 - (((k : ℝ) / 2 : ℝ) : ℂ) ^ p.1) / p.1‖ ≤
          C * ((k : ℝ) * Real.log ((q : ℝ) * k) ^ 2 / T +
            Real.log ((q : ℝ) * k) ^ 2) := by sorry

theorem dirichlet_polynomial_mean_square :
    ∃ C : ℝ, 0 < C ∧ ∀ N : ℕ, 1 ≤ N → ∀ a : ℕ → ℂ,
      ∀ T : ℝ, 1 ≤ T → ∃ R : ℝ,
        (∫ t in (-T)..T,
          ‖∑ n ∈ Finset.Icc 1 N, a n * Complex.exp (-Complex.I * t * Real.log n)‖ ^ 2) =
            2 * T * ∑ n ∈ Finset.Icc 1 N, ‖a n‖ ^ 2 + R ∧
        |R| ≤ C * ∑ n ∈ Finset.Icc 1 N, (n : ℝ) * ‖a n‖ ^ 2 := by sorry

/-! Scoped review additions: Landau counts and the distinct-prime logarithmic weight.
The arithmetic predicates use existing natural/integer, primeFactors and ZMod carriers.
The source-proof gaps in the packet remain open. -/

theorem landau_sum_two_squares_count :
    ∃ P C_L : ℝ,
      HasProd (fun p : {p : ℕ // p.Prime ∧ p % 4 = 3} =>
        (1 - ((p.val : ℝ) ^ 2)⁻¹) ^ (-(1 / 2 : ℝ))) P ∧
      0 < P ∧ C_L = P / Real.sqrt 2 ∧
      Tendsto (fun K : ℕ =>
        (Set.ncard {k : ℕ | 1 ≤ k ∧ k ≤ K ∧
          ∃ u v : ℤ, (k : ℤ) = u ^ 2 + v ^ 2} : ℝ) /
          (C_L * (K : ℝ) / Real.sqrt (Real.log K))) atTop (nhds 1) := by sorry

-- Represented integers, rather than their representation multiplicities, are counted.
example : Set.ncard {k : ℕ | 1 ≤ k ∧ k ≤ 5 ∧
    ∃ u v : ℤ, (k : ℤ) = u ^ 2 + v ^ 2} = 4 := by sorry
example : (∃ u v : ℤ, (9 : ℤ) = u ^ 2 + v ^ 2) := by sorry
example : ¬ (∃ u v : ℤ, (3 : ℤ) = u ^ 2 + v ^ 2) := by sorry

theorem landau_three_square_form_count :
    ∃ C : ℝ, 0 < C ∧ ∀ K : ℝ, 2 ≤ K →
      (Set.ncard {k : ℕ | 1 ≤ k ∧ (k : ℝ) ≤ K ∧
        ∃ u v : ℤ, 4 * ((k : ℤ) - 1) = u ^ 2 + 3 * v ^ 2} : ℝ) ≤
        C * K / Real.sqrt (Real.log K) := by sorry

example : (∃ u v : ℤ, 4 * ((1 : ℤ) - 1) = u ^ 2 + 3 * v ^ 2) := by sorry
example : ¬ (∃ u v : ℤ, 4 * ((3 : ℤ) - 1) = u ^ 2 + 3 * v ^ 2) := by sorry
example : (∃ u v : ℤ, 4 * ((4 : ℤ) - 1) = u ^ 2 + 3 * v ^ 2) := by sorry

theorem shifted_square_count (K : ℝ) (hK : 1 ≤ K) :
    (Set.ncard {k : ℕ | 1 ≤ k ∧ (k : ℝ) ≤ K ∧
      ∃ u : ℤ, (k : ℤ) - 4 = u ^ 2} : ℝ) ≤
      1 + Real.sqrt (max (K - 4) 0) := by sorry

-- The exact finite formula distinguishes the empty small-cutoff range from k = 4.
example (N : ℕ) :
    Set.ncard {k : ℕ | 1 ≤ k ∧ k ≤ N ∧
      ∃ u : ℤ, (k : ℤ) - 4 = u ^ 2} =
        if 4 ≤ N then Nat.sqrt (N - 4) + 1 else 0 := by sorry
example : Set.ncard {k : ℕ | 1 ≤ k ∧ k ≤ 3 ∧
    ∃ u : ℤ, (k : ℤ) - 4 = u ^ 2} = 0 := by sorry
example : Set.ncard {k : ℕ | 1 ≤ k ∧ k ≤ 4 ∧
    ∃ u : ℤ, (k : ℤ) - 4 = u ^ 2} = 1 := by sorry
example : Set.ncard {k : ℕ | 1 ≤ k ∧ k ≤ 13 ∧
    ∃ u : ℤ, (k : ℤ) - 4 = u ^ 2} = 4 := by sorry

theorem landau_exception_union :
    ∃ C : ℝ, 0 < C ∧
      Tendsto (fun K : ℕ =>
        (Set.ncard {k : ℕ | 1 ≤ k ∧ k ≤ K ∧
          ((∃ u v : ℤ, (k : ℤ) = u ^ 2 + v ^ 2) ∨
           (∃ u v : ℤ, 4 * ((k : ℤ) - 1) = u ^ 2 + 3 * v ^ 2) ∨
           (∃ u : ℤ, (k : ℤ) - 4 = u ^ 2))} : ℝ) /
          (C * (K : ℝ) / Real.sqrt (Real.log K))) atTop (nhds 1) := by sorry

example : Set.ncard {k : ℕ | 1 ≤ k ∧ k ≤ 13 ∧
    ((∃ u v : ℤ, (k : ℤ) = u ^ 2 + v ^ 2) ∨
     (∃ u v : ℤ, 4 * ((k : ℤ) - 1) = u ^ 2 + 3 * v ^ 2) ∨
     (∃ u : ℤ, (k : ℤ) - 4 = u ^ 2))} = 8 := by sorry

/-- Each unit class in R may occur repeatedly. Primes dividing M are excluded
because their image cannot equal an element of R, which consists of units. -/
theorem half_density_prime_support_count (M : ℕ) [NeZero M]
    (R : Finset (ZMod M)ˣ) (hhalf : 2 * R.card = M.totient)
    (a : (ZMod M)ˣ) (ha : a ∈ Subgroup.closure (R : Set (ZMod M)ˣ)) :
    ∃ C₁ C₂ : ℝ, 0 < C₁ ∧ 0 < C₂ ∧ ∃ X₀ : ℕ, 2 ≤ X₀ ∧
      ∀ X : ℕ, X₀ ≤ X →
        C₁ * (X : ℝ) / Real.sqrt (Real.log X) ≤
          (Set.ncard {ν : ℕ | 1 ≤ ν ∧ ν ≤ X ∧ (ν : ZMod M) = a ∧
            ∀ p ∈ ν.primeFactors, ∃ r ∈ R, (r : ZMod M) = (p : ZMod M)} : ℝ) ∧
        (Set.ncard {ν : ℕ | 1 ≤ ν ∧ ν ≤ X ∧ (ν : ZMod M) = a ∧
            ∀ p ∈ ν.primeFactors, ∃ r ∈ R, (r : ZMod M) = (p : ZMod M)} : ℝ) ≤
          C₂ * (X : ℝ) / Real.sqrt (Real.log X) := by sorry

-- Algebraic support restriction: the empty factorization gives the identity class.
example (M : ℕ) [NeZero M] (R : Finset (ZMod M)ˣ) (a : (ZMod M)ˣ)
    (ha : a ∉ Subgroup.closure (R : Set (ZMod M)ˣ)) (X : ℕ) :
    Set.ncard {ν : ℕ | 1 ≤ ν ∧ ν ≤ X ∧ (ν : ZMod M) = a ∧
      ∀ p ∈ ν.primeFactors, ∃ r ∈ R, (r : ZMod M) = (p : ZMod M)} = 0 := by sorry
example : ∀ p ∈ (9 : ℕ).primeFactors, (p : ZMod 4) = 3 := by sorry
example : ¬ (∀ p ∈ (3 : ℕ).primeFactors, (p : ZMod 4) = 1) := by sorry
example : ¬ ∃ R : Finset (ZMod 2)ˣ, 2 * R.card = (2 : ℕ).totient := by sorry

theorem prime_divisor_log_weight :
    ∃ C : ℝ, ∀ N : ℕ, 2 ≤ N →
      (∑ p ∈ N.primeFactors, Real.log p / p) ≤ Real.log (Real.log N) + C := by sorry

example (a : ℕ) (ha : 1 ≤ a) :
    (∑ p ∈ ((2 : ℕ) ^ a).primeFactors, Real.log (p : ℝ) / (p : ℝ)) = Real.log 2 / 2 := by sorry
example : Real.log (Real.log 2) < 0 := by sorry

/-! AN.3: two-sided Weil tests, using the pinned variation and one-sided limits. -/

def weil_test_function (c : ℝ) (F : ℝ → ℝ) : Prop :=
  0 ≤ c ∧
    (∃ ε : ℝ, 0 < ε ∧
      MeasureTheory.Integrable (fun x : ℝ => F x * Real.exp ((1 / 2 + c + ε) * |x|)) ∧
      BoundedVariationOn (fun x : ℝ => F x * Real.exp ((1 / 2 + c + ε) * |x|)) Set.univ) ∧
    (∀ x : ℝ, F x = (Function.leftLim F x + Function.rightLim F x) / 2) ∧
    BoundedVariationOn (fun x : ℝ => (F x - F 0) / x) Set.univ

-- weil_test_function.transform
-- This totalized value is accompanied by a separate integrability signature.
def weil_test_function.transform (F : ℝ → ℝ) (s : ℂ) : ℂ :=
  ∫ x : ℝ, (F x : ℂ) * Complex.exp ((s - 1 / 2) * (x : ℂ))
lemma weil_test_function.transform_integrable (c : ℝ) (F : ℝ → ℝ)
    (hF : weil_test_function c F) (s : ℂ) (hl : -c ≤ s.re) (hr : s.re ≤ 1 + c) :
    MeasureTheory.Integrable (fun x : ℝ =>
      (F x : ℂ) * Complex.exp ((s - 1 / 2) * (x : ℂ))) := by sorry
lemma weil_test_function.reflection (c : ℝ) (F : ℝ → ℝ)
    (hF : weil_test_function c F) :
    weil_test_function c (fun x => F (-x)) := by sorry
lemma weil_test_function.add (c : ℝ) (F G : ℝ → ℝ) (a b : ℝ)
    (hF : weil_test_function c F) (hG : weil_test_function c G) :
    weil_test_function c (fun x => a * F x + b * G x) := by sorry
lemma weil_test_function.normalization (c : ℝ) (F : ℝ → ℝ)
    (hF : weil_test_function c F) (x : ℝ) :
    F x = (Function.leftLim F x + Function.rightLim F x) / 2 := by sorry
lemma weil_test_function.mono (c c' : ℝ) (F : ℝ → ℝ)
    (hF : weil_test_function c F) (hc' : 0 ≤ c') (hcc : c' ≤ c) :
    weil_test_function c' F := by sorry
lemma weil_test_function.continuous_at_zero (c : ℝ) (F : ℝ → ℝ)
    (hF : weil_test_function c F) :
    ContinuousAt F 0 ∧ ∃ C : ℝ, 0 ≤ C ∧
      ∀ x : ℝ, |F x - F 0| ≤ C * |x| := by sorry

-- weil_test_function.zero
example (c : ℝ) (hc : 0 ≤ c) :
    weil_test_function c (fun _ => 0) ∧
      ∀ s : ℂ, weil_test_function.transform (fun _ => 0) s = 0 := by sorry
-- weil_test_function.gaussian
example (c : ℝ) (hc : 0 ≤ c) :
    weil_test_function c (fun x => Real.exp (-(x ^ 2))) ∧
      weil_test_function.transform (fun x => Real.exp (-(x ^ 2))) (1 / 2) =
        (Real.sqrt Real.pi : ℂ) := by sorry
-- weil_test_function.one_tail
example (c : ℝ) (hc : 0 ≤ c) :
    ¬ weil_test_function c (fun x => Real.exp (-2 * x)) := by sorry
-- weil_test_function.kink
example : weil_test_function 0 (fun x => Real.exp (-|x|)) ∧
    Function.leftLim (fun x : ℝ => (Real.exp (-|x|) - 1) / x) 0 = 1 ∧
    Function.rightLim (fun x : ℝ => (Real.exp (-|x|) - 1) / x) 0 = -1 := by sorry
-- weil_test_function.asymmetric_tail
-- Ordinary nonintegrability, not an asserted value of a divergent totalized integral.
example : let F : ℝ → ℝ := fun x => if x < 0 then Real.exp (x / 4) else Real.exp (-2 * x)
    MeasureTheory.Integrable (fun x : ℝ => F x * Real.exp ((3 / 4 : ℝ) * x)) ∧
    BoundedVariationOn (fun x : ℝ => F x * Real.exp ((3 / 4 : ℝ) * x)) Set.univ ∧
    (∀ x : ℝ, F x = (Function.leftLim F x + Function.rightLim F x) / 2) ∧
    BoundedVariationOn (fun x : ℝ => (F x - F 0) / x) Set.univ ∧
    ¬ weil_test_function 0 F ∧
    ¬ MeasureTheory.Integrable (fun x : ℝ =>
      (F x : ℂ) * Complex.exp ((0 - 1 / 2 : ℂ) * (x : ℂ))) := by sorry

/-! AN.5: squarefree half-prime counts with the original strict cutoff. -/

theorem restricted_squarefree_landau_count :
    ∃ C : ℝ, 0 < C ∧ Asymptotics.IsBigO Filter.atTop
      (fun X : ℝ =>
        ((((Finset.range (Nat.ceil X)).filter (fun n : ℕ =>
          0 < n ∧ Squarefree n ∧ ∀ p ∈ n.primeFactors, p = 2 ∨ (p : ZMod 4) = 1)).card : ℕ) : ℝ)
          - C * X / Real.sqrt (Real.log X))
      (fun X : ℝ => X / (Real.log X) ^ (3 / 2 : ℝ)) := by sorry

theorem restricted_sathe_selberg_count :
    ∀ A : ℝ, 0 < A → ∃ C₁ C₂ N₀ : ℝ, 0 < C₁ ∧ 0 < C₂ ∧ 3 ≤ N₀ ∧
      ∀ (N : ℝ) (r : ℕ), N₀ ≤ N → 1 ≤ r → (r : ℝ) ≤ A * Real.log (Real.log N) →
        let count : ℝ :=
          (((Finset.range (Nat.ceil N)).filter (fun n : ℕ =>
            0 < n ∧ Squarefree n ∧ (∀ p ∈ n.primeFactors, p = 2 ∨ (p : ZMod 4) = 1) ∧
            n.primeFactors.card = r)).card : ℕ)
        let main := N / Real.log N * (Real.log (Real.log N) / 2) ^ (r - 1) / (r - 1).factorial
        C₁ * main ≤ count ∧ count ≤ C₂ * main := by sorry

example : ((Finset.range 14).filter (fun n : ℕ =>
    0 < n ∧ Squarefree n ∧ ∀ p ∈ n.primeFactors, p = 2 ∨ (p : ZMod 4) = 1)) =
      {1, 2, 5, 10, 13} := by sorry
example : ((Finset.range 14).filter (fun n : ℕ =>
    0 < n ∧ Squarefree n ∧ (∀ p ∈ n.primeFactors, p = 2 ∨ (p : ZMod 4) = 1) ∧
    n.primeFactors.card = 1)).card = 3 := by sorry
example : ((Finset.range 14).filter (fun n : ℕ =>
    0 < n ∧ Squarefree n ∧ (∀ p ∈ n.primeFactors, p = 2 ∨ (p : ZMod 4) = 1) ∧
    n.primeFactors.card = 2)).card = 1 := by sorry

/-! AN.4: concrete finite-factor and disc signatures. The canonical number-field
Canonical number-field Artin carriers and their Euler-series interfaces are stated below. -/

lemma artin_local_reciprocal_bound (d m : ℕ) (hm : m ≤ d)
    (θ : ℝ) (hθ0 : 0 ≤ θ) (hθ1 : θ < 1)
    (α : Fin m → ℂ) (hα : ∀ j, ‖α j‖ = 1) (z : ℂ) (hz : ‖z‖ ≤ θ) :
    (∏ j, (1 - α j * z)) ≠ 0 ∧
      ‖(∏ j, (1 - α j * z))⁻¹‖ ≤ ((1 - θ) ^ d)⁻¹ ∧
      ‖(∏ j, (1 - α j * z))⁻¹ - 1‖ ≤
        (d : ℝ) * ‖z‖ * ((1 - θ) ^ d)⁻¹ := by sorry

lemma analytic_root_on_disc (a z₀ w₀ : ℂ) (r : ℝ) (hr : 0 < r)
    (F : ℂ → ℂ) (hF : AnalyticOnNhd ℂ F (Metric.ball a r))
    (hF0 : ∀ z ∈ Metric.ball a r, F z ≠ 0) (m : ℕ) (hm : 0 < m)
    (hz₀ : z₀ ∈ Metric.ball a r) (hw₀ : w₀ ^ m = F z₀) :
    ∃ R : ℂ → ℂ, AnalyticOnNhd ℂ R (Metric.ball a r) ∧
      (∀ z ∈ Metric.ball a r, R z ^ m = F z) ∧ R z₀ = w₀ ∧
      ∀ S : ℂ → ℂ, AnalyticOnNhd ℂ S (Metric.ball a r) →
        (∀ z ∈ Metric.ball a r, S z ^ m = F z) → S z₀ = w₀ →
        Set.EqOn S R (Metric.ball a r) := by sorry

lemma boundary_disc_overlap (a b : ℂ) (ha : a.re = 1) (hb : b.re = 1)
    (r q : ℝ) (h : (Metric.ball a r ∩ Metric.ball b q).Nonempty) :
    IsPreconnected (Metric.ball a r ∩ Metric.ball b q) ∧
      ∃ z ∈ Metric.ball a r ∩ Metric.ball b q, 1 < z.re := by sorry



/-- Select the existing class group, including positivity in the narrow case. -/
abbrev IdealZetaClass (K : Type*) [Field K] [NumberField K] (narrow : Bool) : Type _ :=
  match narrow with
  | false => ClassGroup (𝓞 K)
  | true => NumberField.NarrowClassGroup K
instance (K : Type*) [Field K] [NumberField K] (narrow : Bool) : CommGroup (IdealZetaClass K narrow) := by
  cases narrow <;> infer_instance
instance (K : Type*) [Field K] [NumberField K] (narrow : Bool) :
    Fintype (IdealZetaClass K narrow) := by
  cases narrow <;> exact Fintype.ofFinite _

def idealZetaClassMap (K : Type*) [Field K] [NumberField K] (narrow : Bool) :
    (Ideal (𝓞 K))⁰ →* IdealZetaClass K narrow := by
  cases narrow
  · exact ClassGroup.mk0
  · exact NumberField.NarrowClassGroup.mk0

def partialIdealWeight (K : Type*) [Field K] [NumberField K] (narrow : Bool)
    (A : IdealZetaClass K narrow) : TauCeti.IdealArithmeticFunction K :=
  fun I => if idealZetaClassMap K narrow I = A then 1 else 0

def partialIdealCoeff (K : Type*) [Field K] [NumberField K] (narrow : Bool)
    (A : IdealZetaClass K narrow) : ArithmeticFunction ℂ :=
  TauCeti.normCoeff K (partialIdealWeight K narrow A)

/-- AN.4/partial-ideal-zeta. The zero ideal is excluded by the carrier. -/
def partial_ideal_zeta (K : Type*) [Field K] [NumberField K] (narrow : Bool)
    (A : IdealZetaClass K narrow) (s : ℂ) : ℂ :=
  LSeries (partialIdealCoeff K narrow A) s

namespace partial_ideal_zeta
variable (K : Type*) [Field K] [NumberField K] (narrow : Bool)
lemma coeff (A : IdealZetaClass K narrow) (n : ℕ) :
    partialIdealCoeff K narrow A n =
      (Nat.card {I : (Ideal (𝓞 K))⁰ //
        Ideal.absNorm (I : Ideal (𝓞 K)) = n ∧ idealZetaClassMap K narrow I = A} : ℂ) := by sorry
lemma sum_classes (s : ℂ) (hs : 1 < s.re) :
    ∑ A : IdealZetaClass K narrow, partial_ideal_zeta K narrow A s =
      NumberField.dedekindZeta K s := by sorry
lemma character_sum (χ : IdealZetaClass K narrow →* ℂˣ) (s : ℂ) (hs : 1 < s.re) :
    (∑ A : IdealZetaClass K narrow, (χ A : ℂ) * partial_ideal_zeta K narrow A s) =
      LSeries (TauCeti.normCoeff K (fun I => (χ (idealZetaClassMap K narrow I) : ℂ))) s := by sorry
/-- Conjugation is expressed on the actual ring of integers and class map. -/
lemma conjugation (A : IdealZetaClass K narrow) (s : ℂ) (hs : 1 < s.re)
    (τ : 𝓞 K ≃+* 𝓞 K)
    (hclass : ∀ I J : (Ideal (𝓞 K))⁰,
      (J : Ideal (𝓞 K)) = Ideal.map τ (I : Ideal (𝓞 K)) →
      idealZetaClassMap K narrow J = (idealZetaClassMap K narrow I)⁻¹) :
    partial_ideal_zeta K narrow A s = partial_ideal_zeta K narrow A⁻¹ s := by sorry
-- TEST partial_ideal_zeta.q
example (s : ℂ) (hs : 1 < s.re) :
    partial_ideal_zeta ℚ false 1 s = riemannZeta s := by sorry
-- TEST partial_ideal_zeta.unit
example (A : IdealZetaClass K narrow) :
    partialIdealCoeff K narrow A 1 = if A = 1 then 1 else 0 := by sorry
-- TEST partial_ideal_zeta.no_generators
example : partialIdealCoeff K narrow 1 1 = 1 := by sorry
-- TEST partial_ideal_zeta.zero
example (A : IdealZetaClass K narrow) : partialIdealCoeff K narrow A 0 = 0 := by sorry
end partial_ideal_zeta

end TauCeti.AnalyticNumberTheory

/-! Requested GlobalNumberFields Layer 10 exports. These are prototypes of
supplier constructions, not existing library declarations or AN-owned targets. -/
namespace TauCeti.GlobalNumberFields
/-- The signed fundamental discriminant for a squarefree quadratic radicand. -/
def quadraticDiscriminant (d : ℤ) : ℤ := if d % 4 = 1 then d else 4 * d
/-- Kronecker value at the prime 2, including the ramified value zero. -/
def quadraticAtTwo (D : ℤ) : ℤ :=
  if D % 2 = 0 then 0 else if D % 8 = 1 ∨ D % 8 = 7 then 1 else -1
/-- Positive-denominator Kronecker symbol; the Jacobi symbol alone mishandles even n. -/
def quadraticCoeff (d : ℤ) (n : ℕ) : ℂ :=
  if n = 0 then 0 else
    ((quadraticAtTwo (quadraticDiscriminant d)) ^ (n.factorization 2) *
      jacobiSym (quadraticDiscriminant d) (n / 2 ^ (n.factorization 2)) : ℤ)
/-- Canonical quadratic character: its value is fixed by the preceding formula.
Its periodicity, multiplicativity and primitivity are supplier obligations. -/
def quadraticDirichletCharacter (d : ℤ) (hd : d ≠ 0) (hsq : Squarefree d) (htriv : d ≠ 1) :
    DirichletCharacter ℂ (quadraticDiscriminant d).natAbs := by sorry
lemma quadraticDirichletCharacter_apply (d : ℤ) (hd : d ≠ 0) (hsq : Squarefree d)
    (htriv : d ≠ 1) (n : ℕ) :
    quadraticDirichletCharacter d hd hsq htriv n = quadraticCoeff d n := by sorry
lemma quadraticDirichletCharacter_primitive (d : ℤ) (hd : d ≠ 0) (hsq : Squarefree d)
    (htriv : d ≠ 1) : (quadraticDirichletCharacter d hd hsq htriv).IsPrimitive := by sorry

def quadraticLFunction (d : ℤ) (hd : d ≠ 0) (hsq : Squarefree d) (htriv : d ≠ 1)
    (s : ℂ) : ℂ := by
  letI : NeZero (quadraticDiscriminant d).natAbs := ⟨by sorry⟩
  exact DirichletCharacter.LFunction (quadraticDirichletCharacter d hd hsq htriv) s

end TauCeti.GlobalNumberFields
namespace TauCeti.AnalyticNumberTheory
open TauCeti.GlobalNumberFields

/-- AN.2/exceptional-squareclasses; no infinite enumeration is built into this set. -/
def exceptional_squareclasses (c : ℝ) : Set ℤ :=
  {d | ∃ (hd : d ≠ 0) (hsq : Squarefree d) (htriv : d ≠ 1) (β : ℝ),
    1 - c / Real.log ((d.natAbs : ℝ) + 4) ≤ β ∧ β ≤ 1 ∧
    quadraticLFunction d hd hsq htriv β = 0}
lemma exceptional_squareclasses.membership (c : ℝ) (d : ℤ) :
    d ∈ exceptional_squareclasses c ↔
      ∃ (hd : d ≠ 0) (hsq : Squarefree d) (htriv : d ≠ 1) (β : ℝ),
        1 - c / Real.log ((d.natAbs : ℝ) + 4) ≤ β ∧ β ≤ 1 ∧
        quadraticLFunction d hd hsq htriv β = 0 := by sorry
lemma exceptional_squareclasses.mono (c c' : ℝ) (hc : 0 < c) (hcc : c ≤ c')
    (hc' : c' < 1/2) : exceptional_squareclasses c ⊆ exceptional_squareclasses c' := by sorry
lemma exceptional_squareclasses.finite_height (c : ℝ) (B : ℕ) :
    {d : ℤ | d ∈ exceptional_squareclasses c ∧ d.natAbs ≤ B}.Finite := by sorry
lemma exceptional_squareclasses.conductor (d : ℤ) (hd : d ≠ 0) (hsq : Squarefree d)
    (htriv : d ≠ 1) : (quadraticDirichletCharacter d hd hsq htriv).conductor =
      if d % 4 = 1 then d.natAbs else 4 * d.natAbs := by sorry
-- TEST exceptional_squareclasses.trivial
example (c : ℝ) : (1 : ℤ) ∉ exceptional_squareclasses c := by sorry
-- TEST exceptional_squareclasses.minus_one
example : quadraticDiscriminant (-1) = -4 := by sorry
-- TEST exceptional_squareclasses.two
example : quadraticDiscriminant 2 = 8 := by sorry
-- TEST exceptional_squareclasses.finite: finite selection is bounded without an infinitude assumption.
example (c : ℝ) (B : ℕ) :
    {d : ℤ | d ∈ exceptional_squareclasses c ∧ d.natAbs ≤ B}.Finite := by sorry

section Artin
variable {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L]
  [Algebra K L] [IsGalois K L]
variable {V W : Type*} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
  [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ W]
variable (ρ : Representation ℂ (L ≃ₐ[K] L) V)

abbrev artinInvariants (P : Ideal (𝓞 L)) :=
  Representation.invariants (ρ.comp (P.inertia (L ≃ₐ[K] L)).subtype)
/-- Restrict a Frobenius lift to the actual inertia-invariant submodule. -/
def artinFrobeniusEnd (P : Ideal (𝓞 L)) (σ : L ≃ₐ[K] L)
    (hσ : IsArithFrobAt (𝓞 K) σ P) : Module.End ℂ (artinInvariants ρ P) := by
  refine (ρ σ).restrict ?_
  sorry

def artinPolynomialAt (P : Ideal (𝓞 L)) (σ : L ≃ₐ[K] L)
    (hσ : IsArithFrobAt (𝓞 K) σ P) : Polynomial ℂ :=
  (artinFrobeniusEnd ρ P σ hσ).charpoly.reverse

/-- One prime above p; all dependence on this choice is removed by independence. -/
def artinPrimeAbove (p : HeightOneSpectrum (𝓞 K)) : HeightOneSpectrum (𝓞 L) := by sorry
lemma artinPrimeAbove_liesOver (p : HeightOneSpectrum (𝓞 K)) :
    (artinPrimeAbove (L := L) p).asIdeal.LiesOver p.asIdeal := by sorry

def artinFrobenius (P : HeightOneSpectrum (𝓞 L)) : L ≃ₐ[K] L :=
  (NumberField.exists_isArithFrobAt K P.asIdeal P.ne_bot).choose
lemma artinFrobenius_spec (P : HeightOneSpectrum (𝓞 L)) :
    IsArithFrobAt (𝓞 K) (artinFrobenius (K := K) P) P.asIdeal :=
  (NumberField.exists_isArithFrobAt K P.asIdeal P.ne_bot).choose_spec
/-- AN.4/artin-local-polynomial. Ramified primes use invariants as well. -/
def artin_local_polynomial (p : HeightOneSpectrum (𝓞 K)) : Polynomial ℂ :=
  artinPolynomialAt ρ (artinPrimeAbove (L := L) p).asIdeal
    (artinFrobenius (K := K) (artinPrimeAbove (L := L) p))
    (artinFrobenius_spec (K := K) (artinPrimeAbove (L := L) p))

lemma artin_local_polynomial.independence (p : HeightOneSpectrum (𝓞 K))
    (P : HeightOneSpectrum (𝓞 L)) (hP : P.asIdeal.LiesOver p.asIdeal)
    (σ : L ≃ₐ[K] L) (hσ : IsArithFrobAt (𝓞 K) σ P.asIdeal) :
    artin_local_polynomial ρ p = artinPolynomialAt ρ P.asIdeal σ hσ := by sorry
lemma artin_local_polynomial.constant (p : HeightOneSpectrum (𝓞 K)) :
    (artin_local_polynomial ρ p).eval 0 = 1 := by sorry
lemma artin_local_polynomial.unramified (p : HeightOneSpectrum (𝓞 K))
    (P : HeightOneSpectrum (𝓞 L)) (hP : P.asIdeal.LiesOver p.asIdeal)
    (hI : P.asIdeal.inertia (L ≃ₐ[K] L) = ⊥)
    (σ : L ≃ₐ[K] L) (hσ : IsArithFrobAt (𝓞 K) σ P.asIdeal) :
    artin_local_polynomial ρ p = (ρ σ).charpoly.reverse := by sorry
lemma artin_local_polynomial.degree (p : HeightOneSpectrum (𝓞 K)) :
    (artin_local_polynomial ρ p).natDegree =
      Module.finrank ℂ (artinInvariants ρ (artinPrimeAbove (L := L) p).asIdeal) ∧
    (artin_local_polynomial ρ p).natDegree ≤ Module.finrank ℂ V ∧
    ∀ z : ℂ, (artin_local_polynomial ρ p).eval z = 0 → ‖z‖ = 1 := by sorry
lemma artin_local_polynomial.basis (p : HeightOneSpectrum (𝓞 K))
    (ι : Type*) [Fintype ι] [DecidableEq ι]
    (b : Basis ι ℂ (artinInvariants ρ (artinPrimeAbove (L := L) p).asIdeal)) :
    artin_local_polynomial ρ p =
      (LinearMap.toMatrix b b (artinFrobeniusEnd ρ (artinPrimeAbove (L := L) p).asIdeal
        (artinFrobenius (K := K) (artinPrimeAbove (L := L) p))
        (artinFrobenius_spec (K := K) (artinPrimeAbove (L := L) p)))).charpoly.reverse := by sorry
-- TEST artin_local_polynomial.trivial
example (p : HeightOneSpectrum (𝓞 K)) :
    artin_local_polynomial (L := L) (Representation.trivial ℂ (L ≃ₐ[K] L) ℂ) p =
      1 - Polynomial.X := by sorry
-- TEST artin_local_polynomial.zero
example (p : HeightOneSpectrum (𝓞 K)) (hV : Module.finrank ℂ V = 0) :
    artin_local_polynomial ρ p = 1 := by sorry
-- TEST artin_local_polynomial.ramified_character
example (p : HeightOneSpectrum (𝓞 K)) (hV : Module.finrank ℂ V = 1)
    (hinertia : ∃ σ : (artinPrimeAbove (L := L) p).asIdeal.inertia (L ≃ₐ[K] L),
      ρ σ ≠ 1) : artin_local_polynomial ρ p = 1 := by sorry

/-- Reciprocal-polynomial coefficients, determined recursively by P(T)A(T)=1. -/
def artinReciprocalCoeff (p : HeightOneSpectrum (𝓞 K)) : ℕ → ℂ
  | 0 => 1
  | n + 1 => - ∑ j ∈ Finset.range (n + 1),
      (artin_local_polynomial ρ p).coeff (j + 1) * artinReciprocalCoeff p (n - j)
/-- The multiplicative ideal coefficient is fixed by these prime-power values. -/
def artinIdealCoeff (ρ : Representation ℂ (L ≃ₐ[K] L) V) : TauCeti.IdealArithmeticFunction K := by sorry
lemma artinIdealCoeff_prime_pow (p : HeightOneSpectrum (𝓞 K)) (n : ℕ)
    (I : (Ideal (𝓞 K))⁰) (hI : (I : Ideal (𝓞 K)) = p.asIdeal ^ n) :
    artinIdealCoeff ρ I = artinReciprocalCoeff ρ p n := by sorry
lemma artinIdealCoeff_multiplicative : (artinIdealCoeff ρ).IsMultiplicative := by sorry

def artinLocalFactor (p : HeightOneSpectrum (𝓞 K)) (s : ℂ) : ℂ :=
  ((artin_local_polynomial ρ p).eval
    (Complex.exp (-s * Real.log (Ideal.absNorm p.asIdeal))))⁻¹
/-- AN.4/artin-euler-series; right-half-plane product with all finite primes. -/
def artin_euler_series (s : ℂ) : ℂ := ∏' p : HeightOneSpectrum (𝓞 K), artinLocalFactor ρ p s
lemma artin_euler_series.local (p : HeightOneSpectrum (𝓞 K)) (s : ℂ) :
    artinLocalFactor ρ p s = ((artin_local_polynomial ρ p).eval
      (Complex.exp (-s * Real.log (Ideal.absNorm p.asIdeal))))⁻¹ := by sorry
lemma artin_euler_series.series (s : ℂ) (hs : 1 < s.re) :
    artin_euler_series ρ s = LSeries (TauCeti.normCoeff K (artinIdealCoeff ρ)) s := by sorry
lemma artin_euler_series.nonzero (s : ℂ) (hs : 1 < s.re) : artin_euler_series ρ s ≠ 0 := by sorry
lemma artin_euler_series.direct_sum (σ : Representation ℂ (L ≃ₐ[K] L) W)
    (s : ℂ) (hs : 1 < s.re) :
    artin_euler_series (ρ.prod σ) s = artin_euler_series ρ s * artin_euler_series σ s := by sorry
lemma artin_euler_series.deleted (bad : Finset (HeightOneSpectrum (𝓞 K)))
    (s : ℂ) (hs : 1 < s.re) :
    (∏' p : {p : HeightOneSpectrum (𝓞 K) // p ∉ bad}, artinLocalFactor ρ p.val s) =
      artin_euler_series ρ s * ∏ p ∈ bad,
        (artin_local_polynomial ρ p).eval
          (Complex.exp (-s * Real.log (Ideal.absNorm p.asIdeal))) := by sorry
-- TEST artin_euler_series.trivial
example (s : ℂ) (hs : 1 < s.re) :
    artin_euler_series (L := L) (Representation.trivial ℂ (L ≃ₐ[K] L) ℂ) s =
      NumberField.dedekindZeta K s := by sorry
-- TEST artin_euler_series.zero
example (s : ℂ) (hs : 1 < s.re) (hV : Module.finrank ℂ V = 0) :
    artin_euler_series ρ s = 1 := by sorry
-- TEST artin_euler_series.ramified
example (p : HeightOneSpectrum (𝓞 K)) (s : ℂ) (hV : Module.finrank ℂ V = 1)
    (hinertia : ∃ σ : (artinPrimeAbove (L := L) p).asIdeal.inertia (L ≃ₐ[K] L),
      ρ σ ≠ 1) : artinLocalFactor ρ p s = 1 := by sorry
end Artin

/-- The genus-n elementary factor used in finite-order Hadamard products. -/
def canonical_factor (n : ℕ) (w : ℂ) : ℂ :=
  (1 - w) * Complex.exp (∑ j ∈ Finset.Icc 1 n, w ^ j / (j : ℂ))
lemma canonical_factor.zero_genus (w : ℂ) : canonical_factor 0 w = 1 - w := by sorry
lemma canonical_factor.one_genus (w : ℂ) : canonical_factor 1 w = genus_one_factor w := by sorry
lemma canonical_factor.entire (n : ℕ) : Differentiable ℂ (canonical_factor n) := by sorry
lemma canonical_factor.zeros (n : ℕ) (w : ℂ) :
    (canonical_factor n w = 0 ↔ w = 1) ∧ analyticOrderNatAt (canonical_factor n) 1 = 1 := by sorry
lemma canonical_factor.log_tail (n : ℕ) : ∃ C : ℝ, 0 < C ∧ ∀ w : ℂ, ‖w‖ ≤ 1/2 →
    ‖Complex.log (1 - w) + ∑ j ∈ Finset.Icc 1 n, w ^ j / (j : ℂ)‖ ≤ C * ‖w‖ ^ (n + 1) := by sorry
-- TEST canonical_factor.origin
example (n : ℕ) : canonical_factor n 0 = 1 := by sorry
-- TEST canonical_factor.root
example (n : ℕ) : canonical_factor n 1 = 0 := by sorry
-- TEST canonical_factor.genus_zero
example (w : ℂ) : canonical_factor 0 w = 1 - w := by sorry
-- TEST canonical_factor.genus_one
example (w : ℂ) : canonical_factor 1 w * canonical_factor 1 (-w) = 1 - w ^ 2 := by sorry

/-- Finite and empty zero families use `none`, preserving multiplicities. -/
theorem finite_order_hadamard (f : ℂ → ℂ) (ρ : ℝ) (hf : entire_order_at_most f ρ)
    (hnonzero : ∃ z : ℂ, f z ≠ 0) :
    ∃ h : Polynomial ℂ, ∃ u : ℕ → Option ℂ,
      h.natDegree ≤ Nat.floor ρ ∧
      (∀ n α, u n = some α → α ≠ 0 ∧ f α = 0) ∧
      (∀ α : ℂ, Set.Finite {n : ℕ | u n = some α}) ∧
      (∀ α : ℂ, α ≠ 0 → Nat.card {n : ℕ // u n = some α} = analyticOrderNatAt f α) ∧
      Summable (fun n => match u n with
        | none => (0 : ℝ)
        | some α => ‖α‖ ^ (-(Nat.floor ρ + 1 : ℝ))) ∧
      TendstoLocallyUniformlyOn
        (fun S : Finset ℕ => fun z : ℂ => ∏ n ∈ S, match u n with
          | none => (1 : ℂ)
          | some α => canonical_factor (Nat.floor ρ) (z / α))
        (fun z : ℂ => ∏' n : ℕ, match u n with
          | none => (1 : ℂ)
          | some α => canonical_factor (Nat.floor ρ) (z / α)) atTop Set.univ ∧
      ∀ z : ℂ, Multipliable (fun n => match u n with
          | none => (1 : ℂ)
          | some α => canonical_factor (Nat.floor ρ) (z / α)) ∧
        f z = z ^ analyticOrderNatAt f 0 * Complex.exp (h.eval z) *
          ∏' n : ℕ, match u n with
            | none => (1 : ℂ)
            | some α => canonical_factor (Nat.floor ρ) (z / α) := by sorry

/-- Indexed exponent vectors distinguish repeated generalized primes. -/
def beurling_zeta (P : beurling_prime_system) (s : ℂ) : ℂ :=
  ∑' a : ℕ →₀ ℕ, Complex.exp (-s * Real.log (P.norm a))
lemma beurling_zeta.summable (P : beurling_prime_system) (s : ℂ) (hs : 1 < s.re)
    (hP : ∀ σ : ℝ, 1 < σ → Summable (fun a : ℕ →₀ ℕ => P.norm a ^ (-σ))) :
    Summable (fun a : ℕ →₀ ℕ => Complex.exp (-s * Real.log (P.norm a))) := by sorry
lemma beurling_zeta.nonzero (P : beurling_prime_system) (s : ℂ) (hs : 1 < s.re)
    (hP : ∀ σ : ℝ, 1 < σ → Summable (fun a : ℕ →₀ ℕ => P.norm a ^ (-σ))) :
    beurling_zeta P s ≠ 0 := by sorry
lemma beurling_zeta.analytic (P : beurling_prime_system)
    (hP : ∀ σ : ℝ, 1 < σ → Summable (fun a : ℕ →₀ ℕ => P.norm a ^ (-σ))) :
    AnalyticOnNhd ℂ (beurling_zeta P) {s | 1 < s.re} := by sorry
-- TEST beurling_zeta.ordinary
example (P : beurling_prime_system) (hp : ∀ i, P.prime i = (Nat.nth Nat.Prime i : ℝ))
    (s : ℂ) (hs : 1 < s.re) : beurling_zeta P s = riemannZeta s := by sorry
-- TEST beurling_zeta.doubled
example (P : beurling_prime_system)
    (hp : ∀ i, P.prime i = (Nat.nth Nat.Prime (i / 2) : ℝ))
    (s : ℂ) (hs : 1 < s.re) : beurling_zeta P s = riemannZeta s ^ 2 := by sorry
-- TEST beurling_zeta.unit_term
example (P : beurling_prime_system) (s : ℂ) :
    Complex.exp (-s * Real.log (P.norm 0)) = 1 := by sorry

lemma beurling_zeta_product (P : beurling_prime_system)
    (hP : ∀ σ : ℝ, 1 < σ → Summable (fun a : ℕ →₀ ℕ => P.norm a ^ (-σ))) :
    (∀ s : ℂ, 1 < s.re →
      Multipliable (fun j => (1 - Complex.exp (-s * Real.log (P.prime j)))⁻¹) ∧
      beurling_zeta P s = ∏' j : ℕ, (1 - Complex.exp (-s * Real.log (P.prime j)))⁻¹) ∧
    TendstoLocallyUniformlyOn
      (fun S : Finset ℕ => fun s : ℂ => ∏ j ∈ S,
        (1 - Complex.exp (-s * Real.log (P.prime j)))⁻¹)
      (beurling_zeta P) atTop {s | 1 < s.re} := by sorry

/-- Each logarithmic error has its own constant and threshold; density is chosen once. -/
theorem beurling_all_log_remainders (P : beurling_prime_system)
    (hP : ∀ σ : ℝ, 1 < σ → Summable (fun a : ℕ →₀ ℕ => P.norm a ^ (-σ))) :
    (∀ m : ℕ, 1 ≤ m → ∃ C X : ℝ, 0 < C ∧ 2 ≤ X ∧ ∀ x : ℝ, X ≤ x →
      |(beurling_prime_count P x : ℝ) - ∫ t : ℝ in (2 : ℝ)..x, (Real.log t)⁻¹| ≤
        C * x / Real.log x ^ m) ↔
    (∃ a : ℝ, 0 < a ∧ ∀ m : ℕ, 1 ≤ m → ∃ C X : ℝ, 0 < C ∧ 2 ≤ X ∧
      ∀ x : ℝ, X ≤ x → |(beurling_integer_count P x : ℝ) - a * x| ≤
        C * x / Real.log x ^ m) := by sorry

/-- Green--Tao, Lemma A.1, p.541. G and R are removable extensions at the pole. -/
theorem green_tao_zeta_strip : ∃ β C : ℝ, 0 < β ∧ β < 1 ∧ 0 < C ∧
    ∃ G R : ℂ → ℂ,
      let Z : Set ℂ := {s | 1 - β / Real.log (|s.im| + 2) ≤ s.re ∧ s.re ≤ 10}
      AnalyticOnNhd ℂ G Z ∧ AnalyticOnNhd ℂ R Z ∧ R 1 = 0 ∧
      Tendsto (fun s : ℂ => (s - 1) * riemannZeta s) (𝓝[≠] 1) (𝓝 1) ∧
      (∀ s ∈ Z, s ≠ 1 → riemannZeta s ≠ 0 ∧
        G s = riemannZeta s - (s - 1)⁻¹ ∧ R s = (riemannZeta s)⁻¹) ∧
      ∀ s ∈ Z, ‖G s‖ ≤ C * Real.log (|s.im| + 2) ∧
        ‖R s‖ ≤ C * Real.log (|s.im| + 2) := by sorry

/-- The weak convexity input actually used in Green--Tao (A.5), p.544. -/
theorem riemann_zeta_weak_convexity (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ σ t : ℝ, 1/2 ≤ σ → σ ≤ 1 → 1/100 ≤ |t| →
      ‖riemannZeta ((σ : ℂ) + t * Complex.I)‖ ≤ C * |t| ^ (1 - σ + ε) := by sorry

/-- This is the actual open punctured-product space, not a substitute cover carrier. -/
abbrev LerchDomain := {q : ℂ × ℂ × ℂ // q.2.1 ≠ 0 ∧ q.2.1 ≠ 1 ∧
  ∀ n : ℕ, q.2.2 ≠ -(n : ℂ)}
def lerchBasepoint : LerchDomain := ⟨(1/2, -1, 1/2), by
  constructor
  · norm_num
  constructor
  · norm_num
  · intro n hn
    have h := congrArg Complex.re hn
    simp only [Complex.neg_re, Complex.natCast_re] at h
    have hnonneg : (0 : ℝ) ≤ n := Nat.cast_nonneg n
    norm_num at h
    linarith⟩
abbrev LerchCover := TauCeti.UniversalCover lerchBasepoint
abbrev LerchGroup := FundamentalGroup LerchDomain lerchBasepoint

/-- Local analytic representatives define holomorphy on the canonical topological cover.
The initial germ comes from the principal integral, including at z=-1. -/
theorem lerch_cover_continuation : ∃ F : LerchCover → ℂ,
    (∀ u : LerchCover, ∃ g : (ℂ × ℂ × ℂ) → ℂ,
      AnalyticAt ℂ g u.proj.val ∧ F =ᶠ[𝓝 u] fun v => g v.proj.val) ∧
    F =ᶠ[𝓝 (TauCeti.UniversalCover.basepointLift lerchBasepoint : LerchCover)]
      fun v => lerch_integral_representation.choose v.proj.val := by sorry

/-- In this library a positive loop γ acts by γ⁻¹; invariance has either formulation. -/
theorem lerch_solvable_descent (F : LerchCover → ℂ)
    (hhol : ∀ u : LerchCover, ∃ g : (ℂ × ℂ × ℂ) → ℂ,
      AnalyticAt ℂ g u.proj.val ∧ F =ᶠ[𝓝 u] fun v => g v.proj.val)
    (hbase : F =ᶠ[𝓝 (TauCeti.UniversalCover.basepointLift lerchBasepoint : LerchCover)]
      fun v => lerch_integral_representation.choose v.proj.val) :
    (∀ γ : LerchGroup, γ ∈ derivedSeries LerchGroup 2 → ∀ u : LerchCover, F (γ • u) = F u) ∧
    ∃ Fbar : TauCeti.UniversalCover.SubgroupQuotient lerchBasepoint (derivedSeries LerchGroup 2) → ℂ,
      ∀ u : LerchCover,
        Fbar (TauCeti.UniversalCover.subgroupQuotientMap lerchBasepoint
          (derivedSeries LerchGroup 2) u) = F u := by sorry

/-! Artin factors below are fixed by equality with the genuine all-prime Euler
series. Analyticity and nonvanishing at 1 are qualitative supplier inputs.
No arbitrary function family is substituted for the Galois representations.
The canonical conductor object remains the explicit ArtinRepresentations request. -/
section Colmez
/-- Uniform over every odd irreducible of each degree-2g CM normal closure.
The CM coefficient supplier restricts the height expression to this family. -/
theorem artin_value_one_subpower (g : ℕ) (hg : 1 ≤ g) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧
    ∀ (E L : Type) [Field E] [NumberField E] [NumberField.IsCMField E]
      [Field L] [NumberField L] [Algebra E L] [IsNormalClosure ℚ E L]
      [IsGalois ℚ L], Module.finrank ℚ E = 2 * g →
    ∀ (c : L ≃ₐ[ℚ] L), (∀ (φ : L →+* ℂ) (x : L), φ (c x) = star (φ x)) →
    ∀ (V : Type) [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
      (ρ : Representation ℂ (L ≃ₐ[ℚ] L) V), Representation.IsIrreducible ρ → ρ c = -1 →
    ∀ (A : ℂ → ℂ), MeromorphicOn A Set.univ →
      (∀ s : ℂ, 1 < s.re → A s = artin_euler_series ρ s) →
      AnalyticAt ℂ A 1 → A 1 ≠ 0 →
      ‖A 1‖ ≤ C * (Int.natAbs (NumberField.discr E) : ℝ) ^ ε ∧
        ‖(A 1)⁻¹‖ ≤ C * (Int.natAbs (NumberField.discr E) : ℝ) ^ ε := by sorry

/-- This is L'/L, requiring the regularized Brauer logarithmic-derivative input. -/
theorem artin_log_derivative_one (g : ℕ) (hg : 1 ≤ g) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧
    ∀ (E L : Type) [Field E] [NumberField E] [NumberField.IsCMField E]
      [Field L] [NumberField L] [Algebra E L] [IsNormalClosure ℚ E L]
      [IsGalois ℚ L], Module.finrank ℚ E = 2 * g →
    ∀ (c : L ≃ₐ[ℚ] L), (∀ (φ : L →+* ℂ) (x : L), φ (c x) = star (φ x)) →
    ∀ (V : Type) [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
      (ρ : Representation ℂ (L ≃ₐ[ℚ] L) V), Representation.IsIrreducible ρ → ρ c = -1 →
    ∀ (A : ℂ → ℂ), MeromorphicOn A Set.univ →
      (∀ s : ℂ, 1 < s.re → A s = artin_euler_series ρ s) →
      AnalyticAt ℂ A 1 → A 1 ≠ 0 →
      ‖deriv A 1 / A 1‖ ≤ C * (Int.natAbs (NumberField.discr E) : ℝ) ^ ε := by sorry

/-- Analytic adapter for the odd completion. The supplied f is the conductor
only after the arithmetic comparison; this lemma itself is a calculus statement. -/
lemma artin_log_functional_equation_of_completion (A B : ℂ → ℂ) (f : ℝ) (hf : 0 < f)
    (d : ℕ) (w : ℂ) (hw : w ≠ 0) (hA : AnalyticAt ℂ A 0) (hB : AnalyticAt ℂ B 1)
    (hneA : A 0 ≠ 0) (hneB : B 1 ≠ 0)
    (hFE : (fun s : ℂ => Complex.exp (s * (Real.log f : ℂ) / 2) *
        Complex.Gammaℝ (s + 1) ^ d * A s) =ᶠ[𝓝 0]
      fun s => w * Complex.exp ((1 - s) * (Real.log f : ℂ) / 2) *
        Complex.Gammaℝ (2 - s) ^ d * B (1 - s)) :
    deriv A 0 / A 0 + deriv B 1 / B 1 = -(Real.log f : ℂ) -
      (d : ℂ) * (deriv Complex.Gammaℝ 1 / Complex.Gammaℝ 1 +
        deriv Complex.Gammaℝ 2 / Complex.Gammaℝ 2) := by sorry

/-- No evaluation of a trivial Hecke pole precedes regularization. -/
lemma regularized_brauer_log_derivative {ι : Type*} [Fintype ι] (n : ι → ℤ)
    (δ : ι → ℕ) (H : ι → ℂ → ℂ) (A : ℂ → ℂ)
    (hcancel : ∑ i, n i * (δ i : ℤ) = 0)
    (hH : ∀ i, AnalyticAt ℂ (H i) 1 ∧ H i 1 ≠ 0)
    (hA : AnalyticAt ℂ A 1) (hprod : A =ᶠ[𝓝 1] fun s => ∏ i, H i s ^ n i) :
    A 1 ≠ 0 ∧ deriv A 1 / A 1 = ∑ i, (n i : ℂ) * (deriv (H i) 1 / H i 1) := by sorry
end Colmez

lemma canonical_factor_pair (w : ℂ) :
    genus_one_factor w * genus_one_factor (-w) = 1 - w ^ 2 := by sorry

section ArtinContinuation
variable {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L]
  [Algebra K L] [IsGalois K L]
variable {V : Type*} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
variable (ρ : Representation ℂ (L ≃ₐ[K] L) V)

/-- Meromorphic continuation fixed by the complete finite-prime Euler series. -/
theorem brauer_meromorphic_continuation : ∃ A : ℂ → ℂ,
    MeromorphicOn A Set.univ ∧ ∀ s : ℂ, 1 < s.re → A s = artin_euler_series ρ s := by sorry

/-- The incomplete series deletes precisely primes with nontrivial inertia.
B is the pole-cleared germ, so no finite value is assigned to a pole. -/
theorem artin_induction_versus_artin_holomorphy : ∃ A B : ℂ → ℂ,
    MeromorphicOn A Set.univ ∧
    (∀ s : ℂ, 1 < s.re → A s = ∏' p : HeightOneSpectrum (𝓞 K),
      if (artinPrimeAbove (L := L) p).asIdeal.inertia (L ≃ₐ[K] L) = ⊥ then
        artinLocalFactor ρ p s else 1) ∧
    (∀ s : ℂ, s.re = 1 → s ≠ 1 → AnalyticAt ℂ A s ∧ A s ≠ 0) ∧
    AnalyticAt ℂ B 1 ∧ B 1 ≠ 0 ∧
    B =ᶠ[𝓝[≠] 1] fun s => (s - 1) ^ Module.finrank ℂ (Representation.invariants ρ) * A s := by sorry
end ArtinContinuation

/-! The following loops are concrete paths in the punctured product. The upper
connector fixes conjugacy, and a quarter-unit circle is traversed positively.
These expressions are path notation; their continuity and endpoint proofs are
admitted, rather than choosing an unspecified homotopy-class generator. -/
def lerchUpperLasso (n : ℤ) (t : ℝ) : ℂ :=
  if t ≤ 1/3 then (1 - 3 * t) * (1/2 : ℂ) + 3 * t * ((n : ℂ) + Complex.I / 4)
  else if t ≤ 2/3 then (n : ℂ) + Complex.I / 4 *
    Complex.exp (2 * Real.pi * Complex.I * (3 * t - 1))
  else (3 - 3 * t) * ((n : ℂ) + Complex.I / 4) + (3 * t - 2) * (1/2 : ℂ)

def lerchCPath (n : ℤ) : Path lerchBasepoint lerchBasepoint where
  toFun t := ⟨(1/2, -1, lerchUpperLasso n t), by sorry⟩
  continuous_toFun := by sorry
  source' := by sorry
  target' := by sorry

def lerchAPath (n : ℤ) : Path lerchBasepoint lerchBasepoint where
  toFun t := ⟨(1/2, Complex.exp (2 * Real.pi * Complex.I * lerchUpperLasso n t), 1/2), by sorry⟩
  continuous_toFun := by sorry
  source' := by sorry
  target' := by sorry

/-- A connector on the negative axis, one positive circle of radius 1/2, then return. -/
def lerchZZero (t : ℝ) : ℂ :=
  if t ≤ 1/3 then -1 + 3 * t / 2
  else if t ≤ 2/3 then -(1/2 : ℂ) * Complex.exp (2 * Real.pi * Complex.I * (3 * t - 1))
  else -(1/2 : ℂ) - (3 * t - 2) / 2

def lerchZZeroPath : Path lerchBasepoint lerchBasepoint where
  toFun t := ⟨(1/2, lerchZZero t, 1/2), by sorry⟩
  continuous_toFun := by sorry
  source' := by sorry
  target' := by sorry

abbrev lerchCLoop (n : ℤ) : LerchGroup := .fromPath (.mk (lerchCPath n))
abbrev lerchALoop (n : ℤ) : LerchGroup := .fromPath (.mk (lerchAPath n))
abbrev lerchZZeroLoop : LerchGroup := .fromPath (.mk lerchZZeroPath)

/-- On the positive-axis cut, this logarithm has imaginary part in (0,2π). -/
def lerchCutLog (z : ℂ) : ℂ := Complex.log (-z) + Real.pi * Complex.I
/-- The factor exp(2πipc) is essential for the p↦p-k continuation rule. -/
def lerchResidueGerm (p : ℤ) (q : ℂ × ℂ × ℂ) : ℂ :=
  let s := q.1
  let c := q.2.2
  let a := lerchCutLog q.2.1 / (2 * Real.pi * Complex.I)
  Complex.exp (2 * Real.pi * Complex.I * p * c - c * lerchCutLog q.2.1) *
    Complex.exp ((s - 1) *
      (if p ≤ 0 then Complex.log (a - p) else Real.pi * Complex.I + Complex.log (p - a)))

def lerchResidueScalar (s : ℂ) : ℂ :=
  -Complex.exp (s * ((Real.log (2 * Real.pi) : ℂ) + Real.pi * Complex.I / 2)) /
    Complex.Gamma s

/-- Globally continued residue germs, zero monodromy of Φ around zero on its
initial germ, and the nontrivial shift of the residue functions. The assertions
about Φ are germs at the principal lift; Φ is not invariant on every sheet.
The index-zero z=1 residue phase corrects LerchIII(3.28); see source finding E29. -/
theorem lerch_z_monodromy_shift (F : LerchCover → ℂ)
    (hhol : ∀ u : LerchCover, ∃ g : (ℂ × ℂ × ℂ) → ℂ,
      AnalyticAt ℂ g u.proj.val ∧ F =ᶠ[𝓝 u] fun v => g v.proj.val)
    (hbase : F =ᶠ[𝓝 (TauCeti.UniversalCover.basepointLift lerchBasepoint : LerchCover)]
      fun v => lerch_integral_representation.choose v.proj.val) :
    ∃ R : ℤ → LerchCover → ℂ,
      (∀ p u, ∃ g : (ℂ × ℂ × ℂ) → ℂ,
        AnalyticAt ℂ g u.proj.val ∧ R p =ᶠ[𝓝 u] fun v => g v.proj.val) ∧
      (∀ p, R p =ᶠ[𝓝 (TauCeti.UniversalCover.basepointLift lerchBasepoint : LerchCover)]
        fun v => lerchResidueGerm p v.proj.val) ∧
      ((fun u => F (lerchZZeroLoop⁻¹ • u)) =ᶠ[
          𝓝 (TauCeti.UniversalCover.basepointLift lerchBasepoint : LerchCover)] F) ∧
      (∀ p (k : ℤ) u, R p ((lerchZZeroLoop ^ (-k)) • u) = R (p - k) u) ∧
      (∀ p (k : ℤ) u, R p (((lerchALoop 0) ^ (-k)) • u) =
        (if p = 0 then Complex.exp (2 * Real.pi * Complex.I * (k : ℂ) * u.proj.val.1)
          else 1) * R p u) ∧
      (∀ p n u, R p (lerchCLoop n • u) = R p u) ∧
      (∀ u, F ((lerchALoop 0)⁻¹ • u) - F u = lerchResidueScalar u.proj.val.1 * R 0 u) := by sorry

/-- Each R is the analytic continuation of the specified principal residue
function, so it cannot be replaced by an arbitrary function on the cover. -/
theorem lerch_a_monodromy (F : LerchCover → ℂ) (R : ℤ → LerchCover → ℂ)
    (hhol : ∀ u : LerchCover, ∃ g : (ℂ × ℂ × ℂ) → ℂ,
      AnalyticAt ℂ g u.proj.val ∧ F =ᶠ[𝓝 u] fun v => g v.proj.val)
    (hbase : F =ᶠ[𝓝 (TauCeti.UniversalCover.basepointLift lerchBasepoint : LerchCover)]
      fun v => lerch_integral_representation.choose v.proj.val)
    (hR : ∀ p u, ∃ g : (ℂ × ℂ × ℂ) → ℂ,
      AnalyticAt ℂ g u.proj.val ∧ R p =ᶠ[𝓝 u] fun v => g v.proj.val)
    (hRbase : ∀ p, R p =ᶠ[𝓝 (TauCeti.UniversalCover.basepointLift lerchBasepoint : LerchCover)]
      fun v => lerchResidueGerm p v.proj.val) :
    ∀ n u, F ((lerchALoop n)⁻¹ • u) - F u =
      lerchResidueScalar u.proj.val.1 * R n u := by sorry

/-- The c-loop formula is a principal germ identity, followed by unique
analytic continuation; positive integer c punctures have zero monodromy. -/
theorem lerch_c_monodromy (F : LerchCover → ℂ)
    (hhol : ∀ u : LerchCover, ∃ g : (ℂ × ℂ × ℂ) → ℂ,
      AnalyticAt ℂ g u.proj.val ∧ F =ᶠ[𝓝 u] fun v => g v.proj.val)
    (hbase : F =ᶠ[𝓝 (TauCeti.UniversalCover.basepointLift lerchBasepoint : LerchCover)]
      fun v => lerch_integral_representation.choose v.proj.val) :
    (∀ n : ℕ, (fun u => F ((lerchCLoop (-(n : ℤ)))⁻¹ • u) - F u) =ᶠ[
        𝓝 (TauCeti.UniversalCover.basepointLift lerchBasepoint : LerchCover)]
      fun u => (Complex.exp (-2 * Real.pi * Complex.I * u.proj.val.1) - 1) *
        u.proj.val.2.1 ^ n * Complex.exp (-u.proj.val.1 * Complex.log (u.proj.val.2.2 + n))) ∧
    (∀ n : ℤ, 1 ≤ n → ∀ u, F ((lerchCLoop n)⁻¹ • u) = F u) := by sorry

/-- Constants and thresholds are literal parts of the numerical specifications. -/
theorem schoenfeld_theta_upper (x : ℝ) (hx : 0 < x) :
    Chebyshev.theta x < 1.000081 * x := by sorry

theorem mod_eight_interval_mass (a : ZMod 8) (ha : a = 3 ∨ a = 5)
    (k : ℝ) (hk : 2 * 10 ^ 10 ≤ k) :
    (1 - 3 * 0.002811) * k / 8 ≤ theta_ap k 8 a - theta_ap (k / 2) 8 a := by sorry

theorem rosser_schoenfeld_pi (x : ℝ) (hx : 59 ≤ x) :
    (x / Real.log x) * (1 + 1 / (2 * Real.log x)) < (Nat.primeCounting ⌊x⌋₊ : ℝ) ∧
    (Nat.primeCounting ⌊x⌋₊ : ℝ) < (x / Real.log x) * (1 + 3 / (2 * Real.log x)) := by sorry

theorem explicit_prime_reciprocal : ∃ B : ℝ,
    Tendsto (fun x : ℝ => (∑ p ∈ (Finset.range (⌊x⌋₊ + 1)).filter Nat.Prime,
      (p : ℝ)⁻¹) - Real.log (Real.log x)) atTop (𝓝 B) ∧
    ∀ x : ℝ, 286 ≤ x →
      |(∑ p ∈ (Finset.range (⌊x⌋₊ + 1)).filter Nat.Prime, (p : ℝ)⁻¹) -
        Real.log (Real.log x) - B| < 1 / (2 * Real.log x ^ 2) := by sorry

theorem explicit_weighted_prime_sum : ∃ E : ℝ, ∀ x : ℝ, 319 ≤ x →
    Real.log x + E - 1 / (2 * Real.log x) <
      ∑ p ∈ (Finset.range (⌊x⌋₊ + 1)).filter Nat.Prime, Real.log p / p ∧
    (∑ p ∈ (Finset.range (⌊x⌋₊ + 1)).filter Nat.Prime, Real.log p / p) <
      Real.log x + E + 1 / (2 * Real.log x) := by sorry

theorem explicit_plus_euler_product (x : ℝ) (hx : 10 ^ 8 ≤ x) :
    (∏ p ∈ (Finset.range (⌊x⌋₊ + 1)).filter Nat.Prime, (1 + (p : ℝ)⁻¹)) ≤
      2 * Real.log x := by sorry

theorem prime_interval_three_x : ∃ X : ℝ, 2 ≤ X ∧ ∀ x : ℝ, X ≤ x →
    4 + x / Real.log x ≤ ((Nat.primeCounting ⌊3 * x⌋₊ - Nat.primeCounting ⌊x⌋₊ : ℕ) : ℝ) ∧
    ((Nat.primeCounting ⌊3 * x⌋₊ - Nat.primeCounting ⌊x⌋₊ : ℕ) : ℝ) ≤ 3 * x / Real.log x := by sorry

theorem inverse_totient_count : ∃ C : ℝ, 0 < C ∧ ∀ x : ℝ, 1 ≤ x →
    {d : ℕ | 0 < d ∧ (Nat.totient d : ℝ) ≤ x}.Finite ∧
    (Nat.card {d : ℕ // 0 < d ∧ (Nat.totient d : ℝ) ≤ x} : ℝ) ≤ C * x := by sorry

theorem davenport_mobius_cancellation (A : ℝ) (hA : 0 < A) :
    ∃ C : ℝ, 0 < C ∧ ∀ y α : ℝ, 2 ≤ y →
      ‖∑ r ∈ Finset.Icc 1 ⌊y⌋₊, (ArithmeticFunction.moebius r : ℂ) *
        Complex.exp (Complex.I * r * α)‖ ≤ C * y * Real.log y ^ (-A) := by sorry

theorem coprime_mobius_log_sum (A : ℝ) (hA : 0 < A) :
    ∃ C : ℝ, 0 < C ∧ ∀ (q : ℕ) (T : ℝ), 0 < q → 2 ≤ T → (q : ℝ) ≤ T ^ 4 →
      |(∑ t ∈ (Finset.Icc 1 ⌊T⌋₊).filter (fun t => t.Coprime q),
        (ArithmeticFunction.moebius t : ℝ) * Real.log t / t) + q / (Nat.totient q : ℝ)| ≤
          C * Real.log T ^ (-A) := by sorry

theorem coprime_mobius_reciprocal_sum (A : ℝ) (hA : 0 < A) :
    ∃ C : ℝ, 0 < C ∧ ∀ (q : ℕ) (T : ℝ), 0 < q → 2 ≤ T → (q : ℝ) ≤ T ^ 4 →
      |∑ t ∈ (Finset.Icc 1 ⌊T⌋₊).filter (fun t => t.Coprime q),
        (ArithmeticFunction.moebius t : ℝ) / t| ≤ C * Real.log T ^ (-A) := by sorry

theorem positive_truncation_error_cancellation (A : ℝ) (hA : 0 < A) :
    ∃ C : ℝ, 0 < C ∧ ∀ y z α : ℝ, 2 ≤ y → 2 ≤ z →
      ‖∑ r ∈ Finset.Icc 1 ⌊y⌋₊, (mangoldt_truncation_error z r : ℂ) *
        Complex.exp (Complex.I * r * α)‖ ≤
          C * y * Real.log y * Real.log z ^ (-A) := by sorry

theorem critical_line_gamma_quotient : ∃ C : ℝ, 0 < C ∧ ∀ (t : ℝ) (α β : ℕ),
    α ≤ 1 → β ≤ 1 →
    let s : ℂ := 1/2 + t * Complex.I
    ‖Complex.Gamma ((s + α) / 2) * Complex.Gamma ((s + β) / 2) / Complex.Gamma s‖ ≤
      C * ‖s‖ ^ (1/2 : ℝ) := by sorry

/-- The reciprocal has its removable zero at the zeta pole. -/
theorem reciprocal_zeta_line_one : ∃ R : ℂ → ℂ,
    MeromorphicOn R Set.univ ∧ (∀ s : ℂ, 1 < s.re → R s = (riemannZeta s)⁻¹) ∧
    AnalyticOnNhd ℂ R {s | s.re = 1} ∧ R 1 = 0 ∧
    (∃ C : ℝ, 0 < C ∧ ∀ t : ℝ, ‖R (1 + 2 * t * Complex.I)‖ ≤ C * Real.log (2 + |t|)) ∧
    Tendsto (fun t : ℝ => R (1 + 2 * t * Complex.I)) (𝓝 0) (𝓝 0) := by sorry

/-- Counts are of integral ideals, using the genuine nonzero-ideal subtype. -/
theorem bounded_norm_ideal_count (g : ℕ) (hg : 1 ≤ g) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ (E : Type) [Field E] [NumberField E],
      Module.finrank ℚ E = 2 * g →
      (∀ n : ℕ, 1 ≤ n →
        (Nat.card {I : (Ideal (𝓞 E))⁰ // Ideal.absNorm (I : Ideal (𝓞 E)) = n} : ℝ) ≤
          C * (n : ℝ) ^ ε) ∧
      ∀ X : ℝ, 1 ≤ X →
        (Nat.card {I : (Ideal (𝓞 E))⁰ // (Ideal.absNorm (I : Ideal (𝓞 E)) : ℝ) ≤ X} : ℝ) ≤
          C * X ^ (1 + ε) := by sorry

/-- The tuple count d_n is notation, rather than a second divisor-function API. -/
theorem ideal_coefficient_divisor_majorant (K : Type*) [Field K] [NumberField K]
    (n m : ℕ) (hn : 1 ≤ n) (hdegree : Module.finrank ℚ K = n) (hm : 1 ≤ m) :
    Nat.card {I : (Ideal (𝓞 K))⁰ // Ideal.absNorm (I : Ideal (𝓞 K)) = m} ≤
      Nat.card {a : Fin n → ℕ // (∀ i, 0 < a i) ∧ ∏ i, a i = m} := by sorry

theorem fixed_order_divisor_subpower (n : ℕ) (hn : 1 ≤ n) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ m : ℕ, 1 ≤ m →
      (Nat.card {a : Fin n → ℕ // (∀ i, 0 < a i) ∧ ∏ i, a i = m} : ℝ) ≤
        C * (m : ℝ) ^ ε := by sorry

end TauCeti.AnalyticNumberTheory

/-!
Mathematical-interface notes for the non-exhaustive suggested file.

All AN-owned definitions, APIs and tests above have native forms. The following
auxiliary targets remain mathematical specifications, rather than executable
declarations. Canonical Hecke/geometric/conductor targets need the supplier
exports named in the packet. Other auxiliary analytic or numerical estimates
are stated in the roadmap; the forms above focus on the target interfaces.
No omitted signature is replaced by an empty proposition field.

AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison
Proposed name: TauCeti.AnalyticNumberTheory.hecke_L_function_euler_product_comparison.
Let K be a number field, c a unitary idele-class character unramified outside a finite set S containing every archimedean place, and χ its ideal-character presentation from GlobalNumberFields Layer9. Choose Tate's admissible factorizable f with f_v=1_{O_v} for v∉S. For Re(s)>1, Z(f,c|·|^s)=(∏_{v∈S}Z_v(f_v,c_v|·|_v^s))(∏_{v∉S}N(d_v)^(−1/2))L_S(s,χ), where L_S(s,χ)=∑_{a integral, prime to S}χ(a)N(a)^(−s)=∏_{v∉S}(1−χ(v)N(v)^(−s))⁻¹. d_v is the local different; its product is finite because d_v is a unit at almost all places. Haar and Fourier normalizations are Tate's, not silently normalized unit volumes.
Sources: tate-thesis-1950, §4.5, thesis p.(4.23), scan p.57; comparison and continuation discussion scan pp.58–59.

AnalyticNumberTheory:AN.4/landau-nonnegative-logarithm
Proposed name: TauCeti.AnalyticNumberTheory.ne_zero_of_log_nonneg_coeff.
For a continued Hecke product F meromorphic near Re s≥1, with no poles except a pole of order at most one at 1, nonnegative norm-regrouped logarithmic coefficients on Re s>1 imply: F has no zeros at regular points of Re s≥1, and its meromorphic order at 1 is ≤0. A pole is not a nonzero finite value.
Sources: kedlaya-ant-2025, §3.3, Lemma 3.6 and Exercise 3.6.1, printed pp. 19 and 21.

AnalyticNumberTheory:AN.4/ray-class-product-nonvanishing
Proposed name: TauCeti.AnalyticNumberTheory.rayClassProduct_ne_zero.
For the finite character group of a ray class quotient, the product of the continued Hecke L-functions has no zeros at regular points of Re s≥1. At s=1 it has meromorphic order ≤0, permitting the principal-character pole. Each Euler logarithmic coefficient is nonnegative by finite-character orthogonality, with bad-prime factors treated separately.
Sources: kedlaya-ant-2025, §3.3, Theorem 3.7 and (3.3.1), printed p. 19.

AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one
Proposed name: TauCeti.AnalyticNumberTheory.heckeL_ne_zero_of_re_eq_one.
For every character χ of Cl_𝔪(K): L(s, χ) ≠ 0 for Re s = 1, s ≠ 1; and L(1, χ) ≠ 0 if χ ≠ 1 (for χ = 1, L(s, 1) has a simple pole at s = 1).
Sources: kedlaya-ant-2025, §3.3–§3.4, Theorems 3.8, 3.10 and 3.11, printed pp. 19–20; kedlaya-ant-2025, §22.5, Theorem 22.4, printed p. 129.

AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue
Proposed name: TauCeti.AnalyticNumberTheory.dedekindZeta_meromorphic.
The Dedekind function supplied by the trivial-character Tate continuation agrees with NumberField.dedekindZeta K on Re s>1. Its complex residue at 1 equals NumberField.dedekindZeta_residue K, by agreement with the pinned real one-sided residue limit and uniqueness of a meromorphic residue. This is an agreement theorem on the convergence half-plane, not equality with the totalized LSeries everywhere.
Sources: tate-thesis-1950, §4.4 Main Theorem 4.4.1 and §4.5, physical pp. 50–58 (read on page images, cc-39fac3).

AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation
Proposed name: TauCeti.AnalyticNumberTheory.heckeL_functional_equation.
For a primitive finite-order Hecke character χ with finite conductor f and the imported archimedean parity data, the canonical continued L-function, multiplied by the conductor/discriminant and the real/complex gamma factors in AL.1, satisfies Λ(s,χ)=ε(χ)Λ(1−s,χ̄) as a meromorphic identity. The principal character retains the two completed poles. Imprimitive deleted factors are a separate comparison.
Sources: tate-thesis-1950, §4.5, physical pp. 57–59 (read on page images, cc-39fac3).

AnalyticNumberTheory:AN.4/mth-root-gluing
Proposed name: TauCeti.AnalyticNumberTheory.extend_of_pow_eq.
Let f be holomorphic and zero-free on {Re s > 1}, m ≥ 1, and U an open set containing {Re s = 1} ∖ {1} on which a holomorphic, zero-free g is given with g = f^m on U ∩ {Re s > 1}. Then f extends holomorphically (and zero-free) to {Re s > 1} ∪ U′ for an open U′ ⊇ {Re s = 1} ∖ {1}: on each disc D ⊆ U centred on the line there is a unique holomorphic h_D with h_D^m = g agreeing with f on the connected set D ∩ {Re s > 1}, and the h_D agree on overlaps.
Sources: kedlaya-ant-2025, §22.5, proof of Theorem 22.4, printed p. 129.

AnalyticNumberTheory:AN.2/exceptional-conductor-repulsion
Proposed name: TauCeti.AnalyticNumberTheory.exceptional_conductor_repulsion.
With c_star from Proposition 7.1, two distinct exceptional quadratic conductors N1<N2 satisfy N2>N1^2.
Sources: reviewed-paper-bennett-siksek-20, Proposition 7.1 and equation (25), pp. 373-374.

AnalyticNumberTheory:AN.5/quadratic-conductor-largest-prime
Proposed name: TauCeti.AnalyticNumberTheory.quadratic_conductor_largest_prime.
If N>1 is the conductor of a primitive quadratic character, then P(N)>0.94*log(N).
Sources: reviewed-paper-bennett-siksek-20, Lemma 7.3, p. 375.

AnalyticNumberTheory:AN.2/prime-power-interval-margin
Proposed name: TauCeti.AnalyticNumberTheory.prime_power_interval_margin.
Put ε=0.002811. For real k≥2*10^10, the prime-power mass M=psi(k)−theta(k)−psi(k/2)+theta(k/2) is smaller than (((1−3*ε)/8)−0.1239)*k. For b:ℕ→ℂ with |b(n)|≤1 whenever k/2<n≤k, put P=Σ_{k/2<p≤k, p prime}b(p)log p and V=Σ_{k/2<n≤k}b(n)Λ(n). Then |V−P|≤M, so |P|≥(1−3*ε)*k/8 implies |V|>0.1239*k.
Sources: reviewed-paper-bennett-siksek-20, §6 end of Case I, pp. 369–370; Schoenfeld Theorem 6*, (5.3*)–(5.4*).

AnalyticNumberTheory:AN.2/two-real-zero-separation
Proposed name: TauCeti.AnalyticNumberTheory.two_real_zero_separation.
There is an effective absolute c_star>0 such that if distinct real primitive quadratic characters of conductors N1,N2>1 have real zeros beta1,beta2, then min(beta1,beta2)<1-3*c_star/log(N1*N2).
Sources: reviewed-paper-bennett-siksek-20, Proposition 7.1(i), (23), p. 373.

AnalyticNumberTheory:AN.2/exceptional-zero-unique
Proposed name: TauCeti.AnalyticNumberTheory.exceptional_zero_unique.
For that same c_star, a primitive nonprincipal quadratic character of conductor N has at most one real zero in (1-c_star/log N,1), and any such zero is simple.
Sources: reviewed-paper-bennett-siksek-20, Proposition 7.1(ii), (24), pp. 373–374.

AnalyticNumberTheory:AN.2/character-weighted-pnt
Proposed name: TauCeti.AnalyticNumberTheory.character_weighted_pnt.
For a primitive nonprincipal character chi of conductor N>1 and X sufficiently large, sum_{m<=X}chi(m)*Lambda(m)=-X^beta/beta+O(X*exp(-c*log X/(sqrt(log X)+log N))*(log N)^4), with the beta term only when an exceptional zero exists; c>0 and the implied constant are absolute and effective.
Sources: reviewed-paper-bennett-siksek-20, Theorem 5, (26), p. 374; Iwaniec–Kowalski Theorem 5.27.

AnalyticNumberTheory:AN.2/landau-page-bounded-height
Proposed name: TauCeti.AnalyticNumberTheory.landau_page_bounded_height.
There is an effective absolute c>0 such that among primitive Dirichlet characters of moduli q<=T, T>=2, there is at most one zero rho=beta+i*t with |t|<=T and beta>1-c/log T. Any exception is a simple real zero of a real character.
Sources: reviewed-paper-bennett-siksek-20, §12 opening, p. 386; Bombieri §5 p.39; Iwaniec–Kowalski Theorem 5.26.

AnalyticNumberTheory:AN.3/selberg-zero-density
Proposed name: TauCeti.AnalyticNumberTheory.selberg_zero_density.
For epsilon>0, Q>=2, T>=2, and 1/2<=sigma<=1, sum_{q<=Q} sum_{chi primitive mod q} N(sigma,T,chi) <<_epsilon (Q^(5+epsilon)*T^(3+epsilon))^(1-sigma), with effective constants with the right-hand side enlarged by +1, so the count includes the exceptional zero.
Sources: reviewed-paper-bennett-siksek-20, §12 proof of Proposition 12.1, p. 386; Bombieri §5 remark after Theorem 14, p.40.

AnalyticNumberTheory:AN.2/quadratic-effective-zero-gap
Proposed name: TauCeti.AnalyticNumberTheory.quadratic_effective_zero_gap.
For q>=3 and a quadratic Dirichlet character modulo q, a real zero beta>0 satisfies beta<=1-40/(sqrt(q)*(log q)^2).
Sources: reviewed-paper-bennett-siksek-20, §12 p.387; Bennett–Martin–O'Bryant–Rechnitzer Proposition 1.11.

AnalyticNumberTheory:AN.2/weighted-prime-interval
Proposed name: TauCeti.AnalyticNumberTheory.weighted_prime_interval.
For x≥y≥319, Σ_{y<p≤x}(log p)/p>log(x/y)−1/(2 log x)−1/(2 log y).
Sources: reviewed-paper-bennett-siksek-20, §9 p.384; Rosser–Schoenfeld Theorem 6, p.70.

AnalyticNumberTheory:AN.4/bounded-degree-brauer-siegel
Proposed name: TauCeti.AnalyticNumberTheory.bounded_degree_brauer_siegel.
For number fields of bounded degree and discriminant D tending to infinity, log(h_K R_K)=(1/2+o(1)) log D. Keep fixed-degree uniformity and possible ineffectivity explicit.
Sources: reviewed-paper-tsimerman-18, 2.2, p. 382; proof of Corollary 3.3, p. 384; [4].

AnalyticNumberTheory:AN.4/artin-conductor-bound
Proposed name: TauCeti.AnalyticNumberTheory.artin_conductor_bound.
Fix g≥1. Let E be any degree2g CM field, L its normal closure over Q (not an arbitrary Galois overfield), G=Gal(L/Q), and c the central complex conjugation. Let F(E) be the finite set of isomorphism classes of nontrivial irreducible complex G-representations ρ satisfying ρ(c)=−Id. Then |G|≤M_g=(2g)!, |F(E)|≤M_g and dim ρ≤M_g. All constants below are uniform in E and ρ∈F(E). The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value≤B_g; the trivial factor is separated before evaluation at1. Use the canonical positive Artin conductor f_ρ, formed from the lower-ramification codimensions of inertia invariants; it is not a ray modulus or an arbitrary positive parameter. There exists C_g>0 such that log f_ρ≤C_g(1+log D_E).
Sources: reviewed-paper-tsimerman-18, Proof of Corollary 3.3, p. 384; tsimerman-primary-published, Theorem3.2 and proof of Corollary3.3, printed pp.383–384.

AnalyticNumberTheory:AN.4/artin-log-functional-equation
Proposed name: TauCeti.AnalyticNumberTheory.artin_log_functional_equation.
Fix g≥1. Let E be any degree2g CM field, L its normal closure over Q (not an arbitrary Galois overfield), G=Gal(L/Q), and c the central complex conjugation. Let F(E) be the finite set of isomorphism classes of nontrivial irreducible complex G-representations ρ satisfying ρ(c)=−Id. Then |G|≤M_g=(2g)!, |F(E)|≤M_g and dim ρ≤M_g. All constants below are uniform in E and ρ∈F(E). The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value≤B_g; the trivial factor is separated before evaluation at1. Use the canonical positive Artin conductor f_ρ, formed from the lower-ramification codimensions of inertia invariants; it is not a ray modulus or an arbitrary positive parameter. Write Γ_R(s)=π^(−s/2)Γ(s/2), d=dimρ and Λ_ρ(s)=f_ρ^(s/2)Γ_R(s+1)^d L(s,ρ). Import Λ_ρ(s)=w_ρΛ_(ρ̄)(1−s), |w_ρ|=1. Odd parity makes the gamma factors finite and nonzero at0 and1; boundary nonvanishing and the equation make L_ρ(0), L_(ρ̄)(1) finite and nonzero. Then L′_ρ(0)/L_ρ(0)+L′_(ρ̄)(1)/L_(ρ̄)(1)=−log f_ρ−d((Γ_R′/Γ_R)(1)+(Γ_R′/Γ_R)(2)). A general even factor would instead require a regularized derivative at0.
Sources: reviewed-paper-tsimerman-18, Proof of Corollary 3.3, p. 384; tsimerman-primary-published, Theorem3.2 and proof of Corollary3.3, printed pp.383–384.

AnalyticNumberTheory:AN.4/quadratic-zeta-factorization
Proposed name: TauCeti.AnalyticNumberTheory.quadratic_zeta_factorization.
For a quadratic extension E/F with its canonical nontrivial finite-order Hecke character η, ζ_E(s)=ζ_F(s)L_f(s,η) on Re s>1, including every ramified Euler factor.
Sources: reviewed-paper-tsimerman-18, Quadratic Euler-factor calculation; Thorner-Zaman 2017 equations (2-1)-(2-7); main Corollary 3.3 adapter.

AnalyticNumberTheory:AN.4/bounded-degree-residue-bounds
Proposed name: TauCeti.AnalyticNumberTheory.bounded_degree_residue_bounds.
For every n>=1 and epsilon>0 there are c,C>0 depending only on n,epsilon such that c*D_K^(-epsilon)<=kappa_K<=C*D_K^epsilon for every number field of degree at most n. Constants may be ineffective. Derive from bounded-degree Brauer-Siegel, the explicit residue formula, the bounded number of roots of unity, and a finite adjustment for small discriminants. Normality is not added to the bounded-degree contract.
Sources: reviewed-paper-tsimerman-18, Brauer 1947 input as used in main sections 2-3; Tsimerman arXiv:1103.5619v3 Lemma 4.1 for comparison.

AnalyticNumberTheory:AN.4/quadratic-hecke-value-one
Proposed name: TauCeti.AnalyticNumberTheory.quadratic_hecke_value_one.
Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For every fixed g and epsilon>0, D_E^(-epsilon) <<_(g,epsilon) L_f(1,eta_E/F) <<_(g,epsilon) D_E^epsilon. Constants may be ineffective. Use kappa_E/kappa_F, the degree bounds 2g and g, and D_F<=D_E^(1/2), choosing each residue exponent at most 2*epsilon/3.
Sources: reviewed-paper-tsimerman-18, Derived adapter for main Corollary 3.3.

AnalyticNumberTheory:AN.4/primitive-hecke-convexity
Proposed name: TauCeti.AnalyticNumberTheory.primitive_hecke_convexity.
Let chi be a primitive finite-order Hecke character over a degree-n number field K, Q=D_K*N(f_chi), 0<r<=1/2, and -r<=sigma<=1+r. For s=sigma+it with chi nontrivial or s≠1, |L_f(s,chi)| << |(1+s)/(1-s)|^delta(chi) * zeta_Q(1+r)^n * (Q*(3+|t|)^n/(2*pi)^n)^((1+r-sigma)/2), with an absolute implied constant. Define the pole factor to be |(1+s)/(1-s)| for the trivial character, and 1 for every nontrivial character (including at s=1); zeta_Q means the Riemann zeta function.
Sources: reviewed-paper-tsimerman-18, Thorner-Zaman 2017, Lemma 2.3, printed p. 1142; credits Rademacher 1959; thorner-zaman-2017, Lemma2.3 [Rademacher 1959], unnumbered bound, printed p.1142.

AnalyticNumberTheory:AN.4/quadratic-hecke-cauchy-derivative
Proposed name: TauCeti.AnalyticNumberTheory.quadratic_hecke_cauchy_derivative.
Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For fixed g and every epsilon>0, |L_f prime(1,eta_E/F)| <<_(g,epsilon) D_E^epsilon. Set r=min(epsilon,1/4)>0. The closed circle |s-1|=r is in [-r,1+r] in real part, |t|<=r, and the convexity exponent is at most r. Hence its supremum is at most C_(g,r)*Q^r, and Cauchy gives |L_f prime(1)|<=C_(g,r)*Q^r/r. Holomorphy is required on the entire disk; a zero-free disk is unnecessary.
Sources: reviewed-paper-tsimerman-18, Derived from Thorner-Zaman Lemma 2.3 and Cauchy derivative estimate.

AnalyticNumberTheory:AN.4/quadratic-hecke-log-derivative-one
Proposed name: TauCeti.AnalyticNumberTheory.quadratic_hecke_log_derivative_one.
Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For every fixed g and epsilon>0, |L_f prime(1,eta)/L_f(1,eta)| <<_(g,epsilon) D_E^epsilon. Apply the derivative bound with epsilon/2 and the reciprocal value bound with epsilon/2. The latter, rather than Cauchy, is the possible ineffective input.
Sources: reviewed-paper-tsimerman-18, Derived adapter for main Corollary 3.3.

AnalyticNumberTheory:AN.4/quadratic-hecke-log-functional-equation
Proposed name: TauCeti.AnalyticNumberTheory.quadratic_hecke_log_functional_equation.
Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For ell_j=L_f prime(j,eta)/L_f(j,eta), both denominators are nonzero and ell_0+ell_1=-log Q+g*(gamma+log(2*pi)), where gamma is Euler constant. Differentiate the completed functional equation; Gamma_R prime/Gamma_R at 1 and 2 sum to -gamma-log(2*pi). Nonvanishing at 0 follows from the functional equation and L_f(1)>0. Each real local component of η is the sign character, so the conductor-normalized completion is Q^(s/2) Γ_R(s+1)^g L_f(s,η), with Γ_R(s)=π^(−s/2)Γ(s/2). This odd archimedean formula is not asserted for a real quadratic extension of a totally real field.
Sources: reviewed-paper-tsimerman-18, Derived from Thorner-Zaman (2-3)-(2-6), odd gamma factors; thorner-zaman-2017, (2-3)–(2-7), printed pp.1140–1141; specialized using CM sign characters.

AnalyticNumberTheory:AN.4/quadratic-residue-quotient
Proposed name: TauCeti.AnalyticNumberTheory.quadratic_residue_quotient.
For a quadratic extension E/F, L_f(1,η)=κ_E/κ_F>0, where κ_K is the positive residue of the continued Dedekind function. Here η is the canonical nontrivial primitive quadratic Hecke character attached by global Artin reciprocity. Its holomorphy at 1, the continued zeta factorization, and the two simple positive residues give the quotient; general line-one nonvanishing is not needed for this argument.
Sources: reviewed-paper-tsimerman-18, Quadratic Euler-factor calculation; Thorner-Zaman 2017 equations (2-1)-(2-7); main Corollary 3.3 adapter.

AnalyticNumberTheory:AN.4/class-character-lseries-comparison
Proposed name: TauCeti.AnalyticNumberTheory.class_character_lseries_comparison.
For a finite narrow-class character χ, L(s,χ)=Σ_aχ(a)N(a)^(−s)=∏_p(1−χ(p)N(p)^(−s))⁻¹, Re(s)>1, and L=Σ_Aχ(A)ζ_A. The printed Euler product omits χ(p); use the corrected one.
Sources: reviewed-paper-duke-imamoglu-toth-16, §7, p970; dit-published-2016, §7, p970.

AnalyticNumberTheory:AN.4/cm-partial-zeta-period
Proposed name: TauCeti.AnalyticNumberTheory.cm_partial_zeta_period.
For fundamental D<0, π^(−s)Γ(s)ζ_A(s)=(2^s/ω_D)|D|^(−s/2)E*(z_A,s), initially Re(s)>1 then by continuation. Here K=ℚ(√D), A is an ordinary ideal class, z_A is its associated CM lattice point in the upper half-plane, and ω_D=|O_K^×|/2 (thus ω_−4=2 and ω_−3=3). Here E(z,s)=(1/2)∑_(gcd(c,d)=1) (Im z)^s/|cz+d|^(2s) on Re s>1, and E*(z,s)=π^(−s)Γ(s)ζ(2s)E(z,s).
Sources: reviewed-paper-duke-imamoglu-toth-16, (7.1); dit-published-2016, (7.1).

AnalyticNumberTheory:AN.4/real-even-partial-zeta-period
Proposed name: TauCeti.AnalyticNumberTheory.real_even_partial_zeta_period.
For fundamental D>1, π^(−s)Γ(s/2)²D^(s/2)(ζ_A+ζ_{JA})=2∫_{C_A}E*(z,s)ds, initially Re(s)>1 and then by continuation. The proof divides by the full norm-one unit action. Here K=ℚ(√D), A∈Cl^+(K), J is the narrow class of a principal ideal generated by an element of negative norm, and C_A is the oriented quadratic geodesic modulo the full norm-one unit group. With ε_D the least norm-one unit greater than 1, its arc length is 2 log ε_D. Here E(z,s)=(1/2)∑_(gcd(c,d)=1) (Im z)^s/|cz+d|^(2s) on Re s>1, and E*(z,s)=π^(−s)Γ(s)ζ(2s)E(z,s). The integration measure denoted ds in the displayed formula is hyperbolic arc length y^(−1)|dz|, not the complex variable s.
Sources: reviewed-paper-duke-imamoglu-toth-16, (7.2), p.970 (Hecke; a cited result, 'He showed'); dit-published-2016, (7.2), p.970 (Hecke; a cited result, 'He showed').

AnalyticNumberTheory:AN.4/genus-lseries-factorization
Proposed name: TauCeti.AnalyticNumberTheory.genus_lseries_factorization.
(p.971.) Let D = d'd ≠ 1 be a fundamental discriminant, with d' and d fundamental discriminants (hence coprime), K = Q(√D), and χ the associated genus character of Cl^+(K). Either factor may be the trivial discriminant 1. For D > 0, χ(J) = sign d = sign d'. Kronecker's decomposition holds: L(s,χ) = L(s,χ_{d'})L(s,χ_d). Equivalently Λ(s,χ) = Λ(s,χ_{d'})Λ(s,χ_d), with Λ(s,χ) as in (7.4)–(7.5) and Λ(s,χ_d) as in (5.13).
Sources: reviewed-paper-duke-imamoglu-toth-16, §7, 'Genus characters', p.971, the unnumbered sentence between (7.7) and (7.8); dit-published-2016, §7, 'Genus characters', p.971, the unnumbered sentence between (7.7) and (7.8).

AnalyticNumberTheory:AN.4/negative-genus-core-period
Proposed name: TauCeti.AnalyticNumberTheory.negative_genus_core_period.
For s=1/2+it, coprime negative fundamental d,d′ and D=d′d>0, Λ(s,χ_d)Λ(s,χ_{d′})=(s(1−s)/2)Σ_Aχ(A)∫_{F_A}E*(z,s)dμ. First continue the compact boundary Hecke identity from Re(s)>1 to the critical line, then apply Stokes there. The raw core integral diverges when Re(s)>1 and is not its initial definition.
Sources: reviewed-paper-duke-imamoglu-toth-16, Theorem3 first branch; dit-published-2016, Theorem3 first branch.

AnalyticNumberTheory:AN.4/positive-genus-geodesic-period
Proposed name: TauCeti.AnalyticNumberTheory.positive_genus_geodesic_period.
Let D > 1 be a fundamental discriminant and D = d′d a factorization into positive fundamental discriminants (equivalently, d′, d > 0 coprime fundamental discriminants with d′d > 1; then D is fundamental). Let χ be the genus character. Then Λ(s,χ_{d'})Λ(s,χ_d) = Σ_{A∈Cl^+(K)} χ(A)∫_{C_A} E*(z,s)y^{−1}|dz|, as meromorphic functions of s (7.8). On Re(s) = 1/2 this is the second case of Theorem 3, where ∫_{∂F_A} replaces ∫_{C_A}.
Sources: reviewed-paper-duke-imamoglu-toth-16, Theorem 3, second case, p.964; for all s by (7.8), p.972; dit-published-2016, Theorem 3, second case, p.964; for all s by (7.8), p.972.

AnalyticNumberTheory:AN.4/mixed-genus-cm-period
Proposed name: TauCeti.AnalyticNumberTheory.mixed_genus_cm_period.
For coprime fundamental d,d′ of opposite sign, Λ(s,χ_d)Λ(s,χ_{d′})=(2√π/ω_D)Σ_Aχ(A)E*(z_A,s), as a meromorphic identity. Here D=dd′<0, the sum is over ordinary ideal classes of ℚ(√D), χ is the genus character, and ω_D=|O_K^×|/2 as in the CM partial-zeta comparison; use the same E* normalization.
Sources: reviewed-paper-duke-imamoglu-toth-16, Theorem 3, third case, p.964 (Re(s) = 1/2); for all s by the display after 'By (7.6) we have when D < 0', p.971; dit-published-2016, Theorem 3, third case, p.964 (Re(s) = 1/2); for all s by the display after 'By (7.6) we have when D < 0', p.971.

AnalyticNumberTheory:AN.4/real-odd-partial-zeta-period
Proposed name: TauCeti.AnalyticNumberTheory.real_odd_partial_zeta_period.
For fundamental D>1, π^(−s)Γ((s+1)/2)²D^(s/2)(ζ_A−ζ_{JA})=2∫_{C_A}i∂_zE*(z,s)dz, initially Re(s)>1 and then by continuation. This is the odd archimedean branch, with an oriented differential rather than arc length. Here K=ℚ(√D), A∈Cl^+(K), J is the narrow class of a principal ideal generated by an element of negative norm, and C_A is the oriented quadratic geodesic modulo the full norm-one unit group. With ε_D the least norm-one unit greater than 1, its arc length is 2 log ε_D. Here E(z,s)=(1/2)∑_(gcd(c,d)=1) (Im z)^s/|cz+d|^(2s) on Re s>1, and E*(z,s)=π^(−s)Γ(s)ζ(2s)E(z,s). The orientation is the quadratic-class orientation used in DIT §7; reversing it changes the sign of the differential integral.
Sources: reviewed-paper-duke-imamoglu-toth-16, (7.3); dit-published-2016, (7.3).

AnalyticNumberTheory:AN.3/eisenstein-weyl-lvalue-bound
Proposed name: TauCeti.AnalyticNumberTheory.eisenstein_weyl_lvalue_bound.
There is an absolute C > 0 such that, for every ε > 0, every fundamental D = d'd ≠ 1 with genus character χ, and every s with Re(s) = 1/2: Weyl(E(·,s),χ) ≪_ε |s|^C |L(s,χ_{d'})L(s,χ_d)| |D|^{1/4+ε}. The paper prints the left side as 'Weyl(s,χ)'.
Sources: reviewed-paper-duke-imamoglu-toth-16, (6.7), proof of Proposition 2, p.969; dit-published-2016, (6.7), proof of Proposition 2, p.969.

AnalyticNumberTheory:AN.2/siegel-quadratic-lvalue
Proposed name: TauCeti.AnalyticNumberTheory.siegel_quadratic_lvalue.
For every ε > 0 there is c(ε) > 0, not effectively computable, such that L(1,χ_D) ≥ c(ε)|D|^{−ε} for every fundamental discriminant D ≠ 1.
Sources: reviewed-paper-duke-imamoglu-toth-16, §6, p.968 ('By Siegel's theorem'); proof of Proposition 1, p.968 ('Siegel's theorem (see [11])'); dit-published-2016, §6, p.968 ('By Siegel's theorem'); proof of Proposition 1, p.968 ('Siegel's theorem (see [11])').

AnalyticNumberTheory:AN.4/real-quadratic-class-regulator-lower
Proposed name: TauCeti.AnalyticNumberTheory.real_quadratic_class_regulator_lower.
For every ε>0, h⁺(D)log ε_D≥c_ε D^(1/2−ε) for fundamental D>1, with an ineffective c_ε>0 and the narrow regulator convention of DIT item144.
Sources: reviewed-paper-duke-imamoglu-toth-16, §6, pp967–968; dit-published-2016, §6, pp967–968.

AnalyticNumberTheory:AN.4/imaginary-quadratic-class-number-lower
Proposed name: TauCeti.AnalyticNumberTheory.imaginary_quadratic_class_number_lower.
For every ε>0, h(D)≥c_ε |D|^(1/2−ε) for negative fundamental D, with an ineffective c_ε>0.
Sources: reviewed-paper-duke-imamoglu-toth-16, §6, pp967–968; dit-published-2016, §6, pp967–968.

AnalyticNumberTheory:AN.5/prime-divisor-product-mean
Proposed name: TauCeti.AnalyticNumberTheory.prime_divisor_product_mean.
For fixed n∈N,c>0 and f on rational primes with |f(p)|≤c/p, set a(t)=∏_{p|t}(1+f(p))^n for t≥1. Then Σ_{1≤t≤x}a(t)=Cx+O_{n,c}(√x), x≥1, where C=∏_p(1+((1+f(p))^n−1)/p); the product is absolutely convergent and f may be complex.
Sources: ss-primary-published, Lemma4.3 and full proof, published pp.705–706, equations(4.2)–(4.3).

AnalyticNumberTheory:AN.5/prime-divisor-integrated-mean
Proposed name: TauCeti.AnalyticNumberTheory.prime_divisor_integrated_mean.
With a,C as in the prime-divisor mean lemma, ∫_0^T Σ_{1≤t≤x}a(t)dx=Σ_{1≤t≤T}(T−t)a(t)=CT²/2+O_{n,c}(T^(3/2)), T≥1.
Sources: ss-primary-published, Lemma4.3, published pp.705–706.

AnalyticNumberTheory:AN.3/two-sided-truncation-error
Proposed name: TauCeti.AnalyticNumberTheory.two_sided_truncation_error.
For y,z≥2 and A>0 the two-sided sum Σ_{|r|≤y}E_z(r)e^(irα) has absolute value ≤2C_A y(log y)(log z)^−A+|E_z(0)|. The zero term is bounded separately by O_A(z(log z)^−A).
Sources: ss-primary-published, §3.1 definitions and Corollary3.3, published p.691.

AnalyticNumberTheory:AN.4/louboutin-dedekind-residue-upper
Proposed name: TauCeti.AnalyticNumberTheory.louboutin_dedekind_residue_upper.
For every number field K of degree d>1 and absolute discriminant D_K, the residue κ_K of the continued Dedekind zeta function satisfies κ_K≤(e log D_K/(2(d−1)))^(d−1).
Sources: reviewed-paper-lipnowski-tsimerman-18, §3.2.2 (24), [18]; used again in §5.4.2 (49); lt-primary-v1-residue, §3.2.2, (24), printed p.14; reference[18].

AnalyticNumberTheory:AN.3/ray-class-zero-density
Proposed name: TauCeti.AnalyticNumberTheory.ray_class_zero_density.
There is c = c([k : ℚ]) > 0 such that for Q, T > 1, 1/2 ≤ σ < 1 and ε > 0, Σ_{Nm 𝔮≤Q}Σ*_{χ mod 𝔮}N_χ(σ, T) ≪_{[k:ℚ],ε} (Disc(k)QT)^{c(1−σ)+ε}, the inner sum over primitive ray class characters of conductor 𝔮 and N_χ(σ, T) counting zeros with ℜρ ∈ (σ, 1), |ℑρ| ≤ T.
Sources: reviewed-paper-lemkeoliver-wang-wood-25, Theorem 4.2, p.20, citing Lemke Oliver–Thorner [Pas17, Proposition A.2] and Thorner–Zaman [TZ21, Theorem 1.2], Forum Math. Pi 13 (2025), e19; low-primary-published, §4, Theorem4.2, printed p.20.

AnalyticNumberTheory:AN.4/most-quadratic-many-split-primes
Proposed name: TauCeti.AnalyticNumberTheory.most_quadratic_many_split_primes.
For ε₁ > 0 and X ≥ 2 there is E = E(k, X, ε₁) ⊂ {F/k quadratic, Disc(F/k) ≤ X} with |E| ≪_{[k:ℚ],ε₁} Disc(k)^{ε₁}X^{ε₁}, such that for F ∉ E and 4 ≤ Y ≤ X, π_k(Y; F, e) ≥ (1/8)π_k(Y/2) − C_{[k:ℚ],ε₁}Y^{σ₁}log²(X Disc(k)) with σ₁ = max(1 − ε₁/(4c), 1/2). E consists of the F whose character χ_{F/k} has a zero with ℜρ > σ₁, |ℑρ| ≤ X^{1/2}; the proof is the explicit formula with Lemma 4.1.
Sources: reviewed-paper-lemkeoliver-wang-wood-25, Lemma 4.3 and proof, pp.20–22, Forum Math. Pi 13 (2025), e19; low-primary-published, §4, Lemma4.3 and full proof, printed pp.20–22.

AnalyticNumberTheory:AN.4/effective-prime-ideal-lower
Proposed name: TauCeti.AnalyticNumberTheory.effective_prime_ideal_lower.
For every fixed degree n there is a positive effective c_n and an absolute effective D₀ such that π_k(Y)≥c_n D_k^(−19)Y/log Y whenever [k:Q]=n, D_k≥D₀ and Y≥D_k^35.
Sources: reviewed-paper-lemkeoliver-wang-wood-25, Lemma 4.4, p.22, citing [Zam17], Forum Math. Pi 13 (2025), e19; low-primary-published, §4, Lemma4.4 and ensuing discussion, printed p.22; zaman-primary-thesis, Theorem1.3.1, pp.11–12; conventions §1.5 p.26; selected §7.2.1 pp.159–160 and §7.2.4 pp.166–169.

AnalyticNumberTheory:AN.3/mestre-weil-explicit-formula
Proposed name: TauCeti.AnalyticNumberTheory.mestre_weil_explicit_formula.
Let A, B > 0, a_i, a′_i ≥ 0 (1 ≤ i ≤ M) with Σ a_i = Σ a′_i, b_i, b′_i ∈ C with non-negative real parts, and Λ_1, Λ_2 meromorphic on C with (i) Λ_1(1 − s) = wΛ_2(s) for some w ∈ C^×; (ii) finitely many poles; (iii) Λ_i minus its singular parts bounded in every vertical strip of finite width; (iv) for some c ≥ 0 and Re s > 1 + c, Λ_1(s) = A^s Π_{i=1}^M Γ(a_i s + b_i) Π_p Π_{i=1}^{M′} (1 − α_i(p)p^{−s})^{−1} and Λ_2(s) = B^s Π_{i=1}^M Γ(a′_i s + b′_i) Π_p Π_{i=1}^{M′} (1 − β_i(p)p^{−s})^{−1} with |α_i(p)|, |β_i(p)| ≤ p^c. Let F satisfy weil_test_function(c,F). For every zero gamma slope a_i=0 (respectively a′_i=0), assume b_i≠0 (respectively b′_i≠0), so its constant gamma factor is finite and nonzero. Then Σ_ρ Φ(ρ) − Σ_μ Φ(μ) + Σ_{i=1}^M I(a_i, b_i) + Σ_{i=1}^M J(a′_i, b′_i) = F(0) log(AB) − Σ_{p,i,k≥1} (α_i(p)^k F(k log p) + β_i(p)^k F(−k log p)) log p / p^{k/2}, where ρ (resp. μ) runs over the zeros (resp. poles) of Λ_1 with −c ≤ Re ≤ 1 + c, with multiplicity, Σ_ρ Φ(ρ) = lim_{T→∞} Σ_{|Im ρ|<T} Φ(ρ), Φ(s) = ∫_R F(x) e^{(s−1/2)x} dx, I(a, b) = a ∫_0^∞ (F(ax) e^{−(a/2+b)x}/(1 − e^{−x}) − F(0) e^{−x}/x) dx and J(a, b) is the same with F(−ax). For a>0 the displayed I,J are ordinary convergent combined integrals (do not integrate the two individually divergent subtraction terms separately). For a=0 set I(0,b)=J(0,b)=0 after removing its constant gamma factor; this is not0 times an undefined integral.
Sources: mestre-primary-published, §I.1–I.2, pp.211–215; Remark1.1.3, Lemmas1.2.1–1.2.2; ct-primary-published, §2.3 pp.275–276, (2.3.5).

AnalyticNumberTheory:AN.2/squareclass-exceptional-repulsion
Proposed name: TauCeti.AnalyticNumberTheory.squareclass_exceptional_repulsion.
There is an effective absolute0<c_Landau<1/2 such that distinct d,e∈S(c_Landau) with |d|≤|e| satisfy |d|²≤|e|. This pairwise form applies to every existing finite ordered segment; no infinitude of S(c_Landau) is asserted.
Sources: kp-primary-v1, §7.2 Definition7.5 and following paragraph, p.61.

AnalyticNumberTheory:AN.2/quadratic-prime-character-interval
Proposed name: TauCeti.AnalyticNumberTheory.quadratic_prime_character_interval.
There are positive absolute effective constants c,C such that for every nonzero squarefree integer D≠1, its primitive field character χ_D of conductor Q_D=|Disc(Q(√D))|, and real2≤u<v, |Σ_{u<p<v, p prime, p∤Q_D}χ_D(p)|≤C[E_D(v)+v exp(−c log v/(√log v+log Q_D))(log(vQ_D))⁴]. Here E_D(v)=v^β if the conductor-uniform zero-free region singles out a simple real exceptional zero β∈(1/2,1), and E_D(v)=0 otherwise. Equivalently extend χ_D by0 at ramified primes and sum over all primes. This is an upper bound, not an asymptotic for short intervals.
Sources: kp-primary-v1, §7.2 proof of Proposition7.6, (7.7), p.62.

AnalyticNumberTheory:AN.2/effective-quadratic-zero-separation
Proposed name: TauCeti.AnalyticNumberTheory.effective_quadratic_zero_separation.
For every ε>0 there is an effectively computable c_ε>0, fixed before D and β, such that for every nonzero squarefree integer D≠1 and real zero β∈(1/2,1) of the canonical continued primitive field-character L(s,χ_D), 1−β≥c_ε |D|^(−1/2−ε). The conductor is Q_D=|Disc(Q(√D))|, with |D|≤Q_D≤4|D|; conductor/radicand conversion only changes c_ε effectively.
Sources: kp-primary-v1, §7.2 proof of Proposition7.6, p.62, immediately after(7.7).

AnalyticNumberTheory:AN.4/heilbronn-simple-real-zero
Proposed name: TauCeti.AnalyticNumberTheory.heilbronn_simple_real_zero.
If K/Q is finite Galois and the canonical continued ζ_K has a simple real zero β with0<β<1, then a quadratic subfield k⊆K satisfies ζ_k(β)=0. The conclusion uses meromorphic Artin continuation and the Aramata–Brauer entire-quotient theorem, not Artin holomorphy.
Sources: heilbronn-primary-published, Theorem1 p.870; complete proof pp.871–873; postscript p.873; kp-primary-v1, §8.3 p.92, proof following Theorem8.13.

AnalyticNumberTheory:AN.4/gross-zagier-cm-eisenstein-comparison
Proposed name: TauCeti.AnalyticNumberTheory.gross_zagier_cm_eisenstein_comparison.
Let D<0 be a fundamental discriminant, K=Q(√D), u=#O_K^×/2 and A an ordinary ideal class. Choose its CM lattice point τ_A in the upper half-plane from a primitive positive-definite binary quadratic form of discriminant D. Let E(z,s)=(1/2)Σ_{gcd(c,d)=1}(Im z)^s/|cz+d|^(2s), the uncompleted level-one Eisenstein series. For Re s>1, E(τ_A,s)=2^(−s)|D|^(s/2)u ζ(2s)^(−1)ζ_K(A,s), equivalently2^s ζ(2s)E(τ_A,s)=u|D|^(s/2)ζ_K(A,s). All positive-base powers use the real logarithm. Changing A to A^(−1) leaves its partial zeta unchanged.
Sources: gz-primary-published-bu, ChapterII§4, p.248, immediately after(4.1).

AnalyticNumberTheory:AN.4/imaginary-genus-character-dictionary
Proposed name: TauCeti.AnalyticNumberTheory.imaginary_genus_character_dictionary.
For an imaginary quadratic field K of fundamental discriminant D<0, genus characters are homomorphisms Cl_K→{±1}, including the trivial homomorphism. They correspond bijectively to unordered fundamental-discriminant factorizations{D₁,D₂}, D=D₁D₂, one positive and one negative; permit the trivial discriminant1 with ε_1=1. For an integral ideal a prime to D, χ_{D₁,D₂}(a)=ε_{D₁}(N a)=ε_{D₂}(N a). This node is the arithmetic classification/compatibility dictionary. The analytic equality L_K(s,χ)=L(s,ε_{D₁})L(s,ε_{D₂}) is supplied by the existing genus_lseries_factorization node, not proved again here.
Sources: gz-primary-published-bu, ChapterIV introduction after(0.3), p.268.

AnalyticNumberTheory:AN.4/imaginary-quadratic-root-number-one
Proposed name: TauCeti.AnalyticNumberTheory.imaginary_quadratic_root_number_one.
For negative fundamental D, put δ=|D| and let ε_D be the canonical primitive odd Dirichlet character of Q(√D), of conductorδ. On Re s>1, Λ(s,ε_D)=(δ/π)^((s+1)/2)Γ((s+1)/2)L(s,ε_D). Its canonical entire continuation is δ^((s+1)/2)·DirichletCharacter.completedLFunction(ε_D,s). The new quadratic normalization assertion is that the root number is+1 and Λ(1−s,ε_D)=Λ(s,ε_D). Entire continuation of a nontrivial Dirichlet completed function is already in Mathlib; no duplicate continuation construction is planned.
Sources: gz-primary-published-bu, ChapterIV§4, p.282, proof of(4.1), and§5 p.290 after(5.4).

AnalyticNumberTheory:AN.4/imaginary-quadratic-lvalue-one
Proposed name: TauCeti.AnalyticNumberTheory.imaginary_quadratic_lvalue_one.
For an imaginary quadratic field of fundamental discriminant D<0, δ=|D|, class number h and w=2u roots of unity, L(1,ε_D)=πh/(u√δ).
Sources: gz-primary-published-bu, ChapterIV§4 pp.283–284, Propositions(4.4)–(4.5), implicit class-number substitution.

AnalyticNumberTheory:AN.4/imaginary-quadratic-lvalue-zero
Proposed name: TauCeti.AnalyticNumberTheory.imaginary_quadratic_lvalue_zero.
With the same imaginary quadratic data, the canonical continued primitive Dirichlet function satisfies L(0,ε_D)=h/u.
Sources: gz-primary-published-bu, ChapterIV§4 pp.283–284, implicit special-value substitution.

AnalyticNumberTheory:AN.2/jensen-growth-zero-count
Proposed name: TauCeti.AnalyticNumberTheory.jensen_growth_zero_count.
If g is entire, g(0)≠0 and has order at most ρ, then for every b>ρ the number n_g(r) of zeros with multiplicity in |z|≤r is O_b(r^b) for r≥1.
Sources: kedlaya-ant-2025, Theorem 8.4 and Remark 8.6, printed p.48; Theorem 8.7 proof, printed p.49.

AnalyticNumberTheory:AN.2/dyadic-zero-reciprocal-square
Proposed name: TauCeti.AnalyticNumberTheory.dyadic_zero_reciprocal_square.
For a nonzero entire g with g(0)≠0 and order at most one, its nonzero zero family α_i, with every index carrying one occurrence of analytic multiplicity, satisfies Σ_i|α_i|⁻²<∞. Finite and empty index sets are included.
Sources: kedlaya-ant-2025, Theorem 8.4 and Remark 8.6, printed p.48; Theorem 8.7 proof, printed p.49.

AnalyticNumberTheory:AN.2/canonical-product-compact-tail
Proposed name: TauCeti.AnalyticNumberTheory.canonical_product_compact_tail.
Under the stated family hypotheses, for R>0 the log-factor tails Σ_{i in S, |α_i|>2R}(Log(1−z/α_i)+z/α_i), directed by finite subsets S, converge uniformly for |z|≤R. Every omitted-tail norm is at most R² times the corresponding reciprocal-square tail.
Sources: kedlaya-ant-2025, Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

AnalyticNumberTheory:AN.2/canonical-product-entire
Proposed name: TauCeti.AnalyticNumberTheory.canonical_product_entire.
Under the stated family hypotheses, finite-subset products ∏_{i∈S}E₁(z/α_i), directed by inclusion of finite subsets, converge locally uniformly on C to the unordered product P(z). P is entire and P(0)=1. Enumeration changes preserve this product; finite and empty families are included.
Sources: kedlaya-ant-2025, Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

AnalyticNumberTheory:AN.2/canonical-product-zero-orders
Proposed name: TauCeti.AnalyticNumberTheory.canonical_product_zero_orders.
For the preceding P, its zeros are exactly the α, with the listed multiplicities, and P is nonzero elsewhere.
Sources: kedlaya-ant-2025, Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

AnalyticNumberTheory:AN.2/zero-free-entire-log
Proposed name: TauCeti.AnalyticNumberTheory.zero_free_entire_log.
For nonzero entire f and its origin factor z^m P with the same zero divisor, the quotient extends to a nonvanishing entire q and q=exp(h) for an entire h.
Sources: kedlaya-ant-2025, Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

AnalyticNumberTheory:AN.2/summable-excluded-radii
Proposed name: TauCeti.AnalyticNumberTheory.summable_excluded_radii.
If forbidden intervals around |α| have total length at most M<∞, then every [r,r+M+1] contains a radius not in their union.
Sources: kedlaya-ant-2025, Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

AnalyticNumberTheory:AN.2/hadamard-log-growth
Proposed name: TauCeti.AnalyticNumberTheory.hadamard_log_growth.
For nonzero entire f of order at most1 and q=f/(z^mP)=exp h, for every ε>0, Re h(z)≤C_ε(1+|z|^(1+ε)) on C.
Sources: kedlaya-ant-2025, Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

AnalyticNumberTheory:AN.2/canonical-product-log-derivative
Proposed name: TauCeti.AnalyticNumberTheory.canonical_product_log_derivative.
For the order-one factorization of nonzero entire f, away from zero and its zeros, f′(z)/f(z)=m/z+b+Σ_α(1/(z−α)+1/α). The corrected summands, indexed with analytic multiplicity, converge locally uniformly there. The correction equals z/(α(z−α)); at z=0 it vanishes, and the term m/z is omitted there when m=0.
Sources: kedlaya-ant-2025, Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

AnalyticNumberTheory:AN.2/paired-imaginary-factors
Proposed name: TauCeti.AnalyticNumberTheory.paired_imaginary_factors.
Under these hypotheses, there is c>0 and a locally finite positive-real family λ_j, with one index per positive-imaginary zero occurrence, such that f(z)=c z^m∏_j(1+z²/λ_j²). The products converge locally uniformly over finite subsets; finite and empty families are included.
Sources: yun-zhang-primary-published, Appendix B.1, Proposition B.1 and its proof, printed pp.902–903.

AnalyticNumberTheory:AN.2/paired-product-nonnegative-coefficients
Proposed name: TauCeti.AnalyticNumberTheory.paired_product_nonnegative_coefficients.
For the preceding paired product, every Taylor coefficient of parity m is nonnegative, and all coefficients of the other parity are zero.
Sources: yun-zhang-primary-published, Appendix B.1, Proposition B.1 and its proof, printed pp.902–903.

AnalyticNumberTheory:AN.2/paired-product-strict-derivatives
Proposed name: TauCeti.AnalyticNumberTheory.paired_product_strict_derivatives.
If the preceding f is not a polynomial, every derivative f^(k)(x) with k≡m mod2 is strictly positive for x>0, and the same-parity Taylor coefficients from degree m onward are positive.
Sources: yun-zhang-primary-published, Appendix B.1, Proposition B.1 and its proof, printed pp.902–903.

AnalyticNumberTheory:AN.3/explicit-formula-residues
Proposed name: TauCeti.AnalyticNumberTheory.explicit_formula_residues.
For x>1, the integrand −(ζ′/ζ)(s)x^s/s has residue x at1, −m_ρx^ρ/ρ at a nontrivial zeroρ, x^(−2n)/(2n) at−2n, and −ζ′(0)/ζ(0) at0. Summing the trivial zeros gives −(1/2)log(1−x^−2).
Sources: kedlaya-ant-2025, §9.2 Lemma9.2 p.54, proof omitted; local analytic-order factorization.

AnalyticNumberTheory:AN.3/perron-nearest-prime-power-error
Proposed name: TauCeti.AnalyticNumberTheory.perron_nearest_prime_power_error.
For real x≥2,T≥2,c=1+1/log x, put δ(x)=infDist(x,{m∈ℝ:m is a natural prime power and m≠x})>0. The Perron remainder for ψ₀(x), after retaining the exact endpoint kernel, is bounded by C[x log²(xT)/T+(log x)min(1,x/(Tδ(x)))], with one absolute C. A prime-power endpoint has half weight only in the infinite-height limit.
Sources: kedlaya-ant-2025, Lemma9.5 p.55; full Theorem9.9 proof pp.57–58; ADS6 endpoint contract.

AnalyticNumberTheory:AN.3/explicit-formula-horizontal-bound
Proposed name: TauCeti.AnalyticNumberTheory.explicit_formula_horizontal_bound.
For x≥2, c=1+1/log x and a height T′≥2 separated from every ξ-zero ordinate by at least c₀/log(T′+2), the two horizontal Perron integrals from Re s=−1 to c have norm at most C_(c₀) x log²(T′+2)/(T′log x).
Sources: kedlaya-ant-2025, Theorem9.9 proof, horizontal segments p.57.

AnalyticNumberTheory:AN.3/explicit-formula-left-contour
Proposed name: TauCeti.AnalyticNumberTheory.explicit_formula_left_contour.
For every fixed x≥2,T≥2, the Perron vertical integral at Re s=−U tends to0 as U→∞ through positive odd integers. Uniformly in x,T, the two horizontal tails Re s≤−1 have norm O(log(T+2)/(Tx log x)+1/(Tx(log x)²)), with an absolute constant.
Sources: kedlaya-ant-2025, Theorem9.9 proof, remaining segments p.57.

AnalyticNumberTheory:AN.4/artin-direct-sum-factor
Proposed name: TauCeti.AnalyticNumberTheory.artin_direct_sum_factor.
For ρ₁,ρ₂, P_p(ρ₁⊕ρ₂,T)=P_p(ρ₁,T)P_p(ρ₂,T) at every prime, including ramified primes. Hence L(ρ₁⊕ρ₂)=L(ρ₁)L(ρ₂) on Re s>1.
Sources: kedlaya-ant-2025, §22.2 p.128 displayed direct-sum identity.

AnalyticNumberTheory:AN.4/artin-absolute-convergence
Proposed name: TauCeti.AnalyticNumberTheory.artin_absolute_convergence.
For fixed dimension d and ε>0, uniformly on Re s≥1+ε, the local factors satisfy |P_p((Np)^−s)^−1−1|≤C_{d,ε}(Np)^−Re s. Their product converges absolutely and locally uniformly and is nonzero there.
Sources: kedlaya-ant-2025, §22.2 p.128 absolute convergence paragraph.

AnalyticNumberTheory:AN.4/artin-induction-factor
Proposed name: TauCeti.AnalyticNumberTheory.artin_induction_factor.
For H⊆G and a complex finite-dimensional representation σ of H, with F=L^H, L_K(s,Ind_H^G σ)=L_F(s,σ) on Re s>1, including all ramified local factors.
Sources: kedlaya-ant-2025, §22.5 Theorem22.4 sketch p.129.

AnalyticNumberTheory:AN.4/artin-linear-hecke-comparison
Proposed name: TauCeti.AnalyticNumberTheory.artin_linear_hecke_comparison.
For L/K finite Galois and a one-dimensional finite-order character χ:Gal(L/K)→C×, composition with the arithmetic global Artin map gives the canonical primitive finite-order Hecke character η. On Re s>1, the full Artin Euler series equals its full Hecke L-function. At p where χ is trivial on inertia both factors are (1−χ(Frob_p)(Np)^−s)^−1; otherwise both are1. The conductor and archimedean signs come from the same local/global reciprocity dictionary.
Sources: kedlaya-ant-2025, §22.5 Theorem22.4 sketch p.129.

AnalyticNumberTheory:AN.4/ray-character-log-coefficients
Proposed name: TauCeti.AnalyticNumberTheory.ray_character_log_coefficients.
For a finite abelian ray-class quotient H and its full complex character group Ĥ, for h∈H and an integer k≥1, Σ_{χ∈Ĥ}χ(h^k) is #H if h^k=1 and 0 otherwise. On Re s>1 the contribution of an allowed prime ideal 𝔭 to log ∏_χL(s,χ) is Σ_{k≥1}(Σ_χχ([𝔭]^k))/k · N𝔭^(−ks). Thus these logarithmic coefficients are nonnegative after norm regrouping, with bad primes omitted consistently.
Sources: kedlaya-ant-2025, §3.3 Theorem3.7 p.19 equation(3.3.1), corrected by E18.

AnalyticNumberTheory:AN.4/nonreal-hecke-at-one
Proposed name: TauCeti.AnalyticNumberTheory.nonreal_hecke_at_one.
For a finite-order ray character χ with χ≠χ̄, its canonical L(1,χ) is nonzero.
Sources: kedlaya-ant-2025, §3.4 Theorem3.10 p.19 full proof.

AnalyticNumberTheory:AN.4/quadratic-auxiliary-positive-factors
Proposed name: TauCeti.AnalyticNumberTheory.quadratic_auxiliary_positive_factors.
For a nonprincipal quadratic Hecke character χ, Ψ(s)=L(s,χ)ζ_K(s)/ζ_K(2s) has, on Re s>1, local factors (1+x)/(1−x) when χ(p)=1, 1 when χ(p)=−1, and1+x at omitted character primes, x=(Np)^−s. Hence its norm-regrouped Dirichlet coefficients are nonnegative.
Sources: kedlaya-ant-2025, §3.4 Theorem3.11 p.20 displayed quadratic auxiliary product.

AnalyticNumberTheory:AN.4/quadratic-auxiliary-holomorphy
Proposed name: TauCeti.AnalyticNumberTheory.quadratic_auxiliary_holomorphy.
If L(1,χ)=0 for the preceding quadratic character, Ψ extends holomorphically to Re s>1/2. Indeed ζ_K(2s) is nonzero there because Re(2s)>1, and the numerator’s zero cancels ζ_K’s pole at1. At s=1/2, Ψ extends with a zero of order at least1.
Sources: kedlaya-ant-2025, §3.4 Theorem3.11 p.20 pole-cancellation paragraph.

AnalyticNumberTheory:AN.4/quadratic-landau-contradiction
Proposed name: TauCeti.AnalyticNumberTheory.quadratic_landau_contradiction.
For a nonprincipal quadratic Hecke character χ, L(1,χ)≠0. If it vanished, the nonnegative Dirichlet series of Ψ from node168 would have abscissa≤1/2 by ADS8 Landau and node169 holomorphy. For every real σ>1/2 its value would then satisfy Ψ(σ)≥1, while node169 gives lim_{σ↓1/2}Ψ(σ)=0, a contradiction. No convergence or sum identity at σ=1/2 is required.
Sources: kedlaya-ant-2025, §3.4 Theorem3.11 p.20 complete proof and §2.1 Theorem2.4 p.12 proof.

AnalyticNumberTheory:AN.4/dedekind-completed-functional-equation
Proposed name: TauCeti.AnalyticNumberTheory.dedekind_completed_functional_equation.
For a number field K with absolute discriminant D_K, r₁ real places and r₂ conjugate pairs of complex places, let Γ_R(s)=π^(−s/2)Γ(s/2) and Γ_C(s)=2(2π)^(−s)Γ(s), the pinned Complex.Gammaℝ and Complex.Gammaℂ. The canonical continuation supplied by Tate has Λ_K(s)=|D_K|^(s/2)Γ_R(s)^r₁Γ_C(s)^r₂ζ_K^cont(s), and Λ_K(1−s)=Λ_K(s) as meromorphic functions. No equality of totalized values at poles is asserted.
Sources: tate-thesis-1950, §4.5, scan pp.56–59, especially (4.24) on scan p.58; local factors tabulated in §2.5.

AnalyticNumberTheory:AN.4/dedekind-negative-even-zero
Proposed name: TauCeti.AnalyticNumberTheory.dedekind_negative_even_zero.
For a number field K and every integer n≥1, the canonical holomorphic Dedekind continuation at −2n has a zero of exact order r₁+r₂, where r₁ and r₂ are its real-place and complex-pair counts. In particular ζ_K^cont(−2n)=0, since r₁+r₂≥1. This evaluates the continuation, not the pinned totalized ideal LSeries.
Sources: tate-thesis-1950, §4.5 equation on scan p.58, with §2.5 archimedean factors; derived negative-even specialization.

AnalyticNumberTheory:AN.4/imprimitive-hecke-factors
Proposed name: TauCeti.AnalyticNumberTheory.imprimitive_hecke_factors.
Let χ be the ray ideal character modulo a modulus m induced from a primitive finite-order Hecke character χ₀ of conductor f₀ dividing m. If m_fin is the finite part, then L_m^cont(s,χ)=L^cont(s,χ₀)∏_{p|m_fin, p∤f₀_fin}(1−χ₀(p)exp(−s log Np)). Each prime occurs once even if its exponent in m grows; real-place conditions enter the conductor dictionary but do not delete finite Euler factors. Equality is meromorphic.
Sources: tate-thesis-1950, §4.5, scan p.57, Euler product over finite primes outside S.

AnalyticNumberTheory:AN.2/chebyshev-prime-count-transfer
Proposed name: TauCeti.AnalyticNumberTheory.chebyshev_prime_count_transfer.
From ψ(x)∼x, obtain θ(x)∼x, π(x)∼Li(x) and π(x)∼x/log x, using the existing ADS transfer and pinned prime-power bound.
Sources: kedlaya-ant-2025, §1.3 partial summation, §1.4 PNT equivalences and Exercise1.6.7; §7.1 p.43.

AnalyticNumberTheory:AN.2/siegel-walfisz
Proposed name: TauCeti.AnalyticNumberTheory.siegel_walfisz.
For every A,B>0, uniformly for q≤(log x)^B and gcd(a,q)=1, π(x;a,q)=Li(x)/φ(q)+O_{A,B}(x(log x)^−A) as x→∞. The constant and threshold may be ineffective.
Sources: kedlaya-ant-2025, §10.5 Theorem10.9 pp.62–63 and Theorem10.11 p.63; corrected coprimality, range and ineffectivity.

AnalyticNumberTheory:AN.5/moment-model-comparison
Proposed name: TauCeti.AnalyticNumberTheory.moment_model_comparison.
For each fixed k>0, the statement ∫_0^T|ζ(1/2+it)|^(2k)dt∼a(k)g(k)T(log T)^(k²) is a conjectural model with the arithmetic Euler factor a(k) and random-matrix factor g(k) supplied by PM.5. No asymptotic for general k is asserted unconditionally; k=1 and2 are checked against the proved moments.
Sources: atlas-an-brief, AN.5 target specification.

AnalyticNumberTheory:AN.7/lerch-even-functional-equation
Proposed name: TauCeti.AnalyticNumberTheory.lerch_even_functional_equation.
On the extended polycylinder s∈C,0<Re a<1,0<Re c<1, put L_+=ζ(s,a,c)+e^(−2πia)ζ(s,1−a,1−c) and Λ_+=π^(−s/2)Γ(s/2)L_+. Then Λ_+(s,a,c)=e^(−2πiac)Λ_+(1−s,1−c,a), as matched holomorphic continuations. At a gamma pole, Λ denotes the removable holomorphic extension of the product, not its pointwise totalized Gamma value.
Sources: lerch-II, Theorem2.1 (2.7)–(2.10) p.5; complete §3 pp.8–10, Lemma3.1 and Theorem2.1 proof.

AnalyticNumberTheory:AN.7/lerch-odd-functional-equation
Proposed name: TauCeti.AnalyticNumberTheory.lerch_odd_functional_equation.
On the same polycylinder, L_−=ζ(s,a,c)−e^(−2πia)ζ(s,1−a,1−c) and Λ_−=π^(−(s+1)/2)Γ((s+1)/2)L_− satisfy Λ_−(s,a,c)=i e^(−2πiac)Λ_−(1−s,1−c,a), with matched continuations; at gamma poles Λ denotes the removable holomorphic extension rather than a pointwise totalized Gamma product.
Sources: lerch-II, Theorem2.1 (2.7)–(2.10) p.5; complete §3 pp.8–10, Lemma3.1 and Theorem2.1 proof.

AnalyticNumberTheory:AN.5/pretentious-square-nonnegative
Proposed name: TauCeti.AnalyticNumberTheory.pretentious_square_nonnegative.
Under the prime unit-disc hypotheses, D(f,g;x)²=Σ_{p≤x}(1−Re(f(p)conj(g(p))))/p≥0.
Sources: pretentious-gs, Weighted norm discussion pp3–4.

AnalyticNumberTheory:AN.4/artin-ramified-induction-polynomial
Proposed name: TauCeti.AnalyticNumberTheory.artin_ramified_induction_polynomial.
For L/K finite Galois with group G,H≤G,F=L^H and σ a finite-dimensional complex representation of H, at every nonzero prime p of K, P_{p,Ind_H^Gσ}(T)=∏_{q|p in F}P_{q,σ}(T^{f(q/p)}). The right polynomials are defined from Gal(L/F)=H, their own inertia invariants and arithmetic Frobenius modulo inertia.
Sources: kedlaya-ant-2025, §22.5 Theorem22.4 sketch p.129; full ramified local identity is a required expansion.

-/
