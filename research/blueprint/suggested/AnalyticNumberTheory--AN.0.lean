import Mathlib.NumberTheory.ArithmeticFunction.Misc
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.Chebyshev
import Mathlib.NumberTheory.Harmonic.EulerMascheroni
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.NumberTheory.SmoothNumbers
import Mathlib.Analysis.Analytic.Order
import Mathlib.Analysis.SpecialFunctions.Pow.Real
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
import Mathlib.Tactic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers
converge on names and signatures. No implementation is claimed.

Review checkpoint codex-7e92bd (2026-10-05): the full file elaborates in an
existing build using Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, with
158 warnings, all `declaration uses sorry`, and no errors. This file imports
Mathlib only; it does not compile Tau Ceti modules. The mathematical review is
incomplete. At that checkpoint the native-signature gap recorded six definition
blocks whose canonical imported carriers could not yet be stated. Their mathematical specifications and all
API/test names are retained below, rather than introducing substitute Prop fields.
Continuation codex-ws2Gd5: added a conditional positive exceptional-zero test
and corrected the mathematical CM/period specifications; the executable section
was independently read. That continuation’s elaboration had 159 admitted-proof warnings.
Continuation codex-KI4dsy adds medium-prime endpoint and size APIs, the promoted
cardinality signature, and concrete Mertens, Euler-tail and Möbius/totient forms.
The Euler tail uses HasProd, so a divergent totalized product cannot satisfy it.
Exercise5.4(c) in the preliminary Koukoulopoulos source has the reversed
integrand; use κ=∫(1_[0,1](u)−exp(−u))/u du=γ as recorded in source issue E19.
Continuation codex-BdrTzT adds native Landau/support count and prime-divisor
weight signatures, finite representation examples and exact half-cardinality guards.
The full independent mathematical review is still unfinished.
Continuation codex-btapUd supplies the Weil test predicate with pinned BV/one-sided-limit
APIs and every API/test signature, and strict-cutoff squarefree counting forms.
Five canonical-carrier definitions remain omitted.
Continuation codex-45ZB12 expands the Hadamard/xi and explicit-formula signatures,
uses multiplicities and an inclusive positive Riemann–von Mangoldt count, and adds
finite Artin-factor and prescribed-root disc signatures. Canonical Artin carriers
remain explicit omissions. Compilation checks signatures with admitted proofs;
it supplies no mathematical certification. The packet/report give the exact
fresh source, baseline and incomplete-review scopes.
Other statements requiring those carriers or unacquired higher-genus/covering
interfaces are listed mathematically at the end. They are not executable signatures.
-/

noncomputable section
open scoped BigOperators Topology
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

/-- Recursive integral construction on consecutive unit intervals. -/
def dickman_function : ℝ → ℝ := by sorry
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
lemma beurling_prime_system.finite (P : beurling_prime_system) (x : ℝ) :
    Set.Finite {a : ℕ →₀ ℕ | P.norm a ≤ x} := by sorry
lemma beurling_prime_system.unit (P : beurling_prime_system) : P.norm 0 = 1 := by sorry
lemma beurling_prime_system.multiplicity (P : beurling_prime_system)
    (a b : ℕ →₀ ℕ) (hab : a ≠ b) (h : P.norm a = P.norm b)
    (x : ℝ) (hx : P.norm a ≤ x) :
    2 ≤ beurling_integer_count P x := by sorry
lemma beurling_prime_system.ordinary (P : beurling_prime_system)
    (hp : ∀ i, P.prime i = (Nat.nth Nat.Prime i : ℝ)) (x : ℝ) (hx : 1 ≤ x) :
    beurling_integer_count P x = Nat.floor x := by sorry
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
Artin carriers remain omitted under the explicit interface gap. -/

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

end TauCeti.AnalyticNumberTheory

/-!
## Canonical-carrier signature omissions (explicit gap, not native declarations)

AnalyticNumberTheory:AN.4/partial-ideal-zeta
For a number field K, choose its ordinary or narrow ideal class group, and a class A. Let a_A(n) count nonzero integral ideals of norm n in A, with a_A(0)=0. Define ζ_A(s)=LSeries a_A s on Re s>1, using the imported norm-indexed ideal arithmetic function and finite norm fibres. Quadratic period applications use narrow classes for real quadratic K and ordinary classes for imaginary quadratic K. Index ideals, not their generators. The finite class sum agrees with NumberField.dedekindZeta as an LSeries: the latter may have a different zeroth coefficient, which LSeries ignores.

Signature withheld until its recorded canonical supplier interface exists.

API partial_ideal_zeta.coeff: a_A(n) is the finite cardinality of integral ideals of positive norm n in A; a_A(0)=0.

API partial_ideal_zeta.sum_classes: The sum of ζ_A over all ideal classes is the Dedekind series on Re s>1.

API partial_ideal_zeta.character_sum: For a class character χ, Σ_A χ(A)ζ_A(s) is its ideal-character LSeries on Re s>1.

API partial_ideal_zeta.conjugation: In a quadratic field, conjugating ideals takes A to A^−1 and preserves their norms, hence ζ_A=ζ_{A^−1}.

TEST partial_ideal_zeta.q: For K=Q, the unique partial series equals the Riemann series on Re s>1.

TEST partial_ideal_zeta.unit: a_A(1)=1 for the principal class and 0 otherwise.

TEST partial_ideal_zeta.no_generators: The unit ideal contributes once, even when the unit group is infinite.

TEST partial_ideal_zeta.zero: The zero ideal contributes to no coefficient; no norm-zero negative power occurs.

AnalyticNumberTheory:AN.2/exceptional-squareclasses
For 0<c<1/2 let S(c) consist of nonzero squarefree d≠1 such that the primitive quadratic character of Q(√d) has a real zero β∈[1−c/log(|d|+4),1]. The conductor is |d| or 4|d| as dictated by its fundamental discriminant. Enumerate any finite initial segment by nondecreasing |d|; an infinite enumeration requires infinitude, which is not asserted.

Signature withheld until its recorded canonical supplier interface exists.

API exceptional_squareclasses.membership: Membership is the stated near-one zero condition for the primitive field character.

API exceptional_squareclasses.mono: If 0<c≤c′<1/2 then S(c)⊆S(c′).

API exceptional_squareclasses.finite_height: For each B there are finitely many d∈S(c) with |d|≤B.

API exceptional_squareclasses.conductor: Every estimate uses the field’s fundamental discriminant conductor, retaining the possible factor 4.

TEST exceptional_squareclasses.trivial: d=1 is excluded, so a principal pole cannot be called an exceptional zero.

TEST exceptional_squareclasses.minus_one: d=−1 has conductor 4, not conductor 1.

TEST exceptional_squareclasses.two: d=2 has conductor 8, not 2.

TEST exceptional_squareclasses.finite: The definition permits an empty or finite S(c); it does not fabricate an infinite sequence.

AnalyticNumberTheory:AN.4/artin-local-polynomial
For a finite Galois extension L/K, a finite-dimensional complex representation ρ of G=Gal(L/K), and a nonzero prime ideal p of K, choose P above p, its decomposition/inertia groups D_P,I_P and arithmetic Frobenius in D_P/I_P. On V^(I_P), Frobenius acts canonically. Define P_p(T)=det(1−T·Frob_P|V^(I_P)) in C[T]. The determinant is independent of P and of a Frobenius lift.

Signature withheld until its recorded canonical supplier interface exists.

API artin_local_polynomial.independence: Changing P conjugates the invariant-space endomorphism and leaves P_p unchanged.

API artin_local_polynomial.constant: P_p(0)=1.

API artin_local_polynomial.unramified: For unramified p, P_p(T)=det(1−Tρ(Frob_p)) on all of V.

API artin_local_polynomial.degree: natDegree P_p=dim_C(V^I)≤dim_C V; the Frobenius endomorphism on V^I has eigenvalues of modulus1 and every root of P_p has modulus1. The degree-zero polynomial1 has no roots.

API artin_local_polynomial.basis: Changing the finite-dimensional basis does not change the polynomial.

TEST artin_local_polynomial.trivial: For the one-dimensional trivial representation, P_p=1−T at every prime.

TEST artin_local_polynomial.zero: For the zero representation, P_p=1.

TEST artin_local_polynomial.ramified_character: For a one-dimensional character nontrivial on inertia, V^I=0 and P_p=1; using the whole V would give a wrong factor.

AnalyticNumberTheory:AN.4/artin-euler-series
For the preceding data and Re s>1, L_K(s,ρ)=∏_p P_p((Np)^−s)^−1, over all nonzero prime ideals of K, with complex powers using the positive real norm logarithm. Coefficients are the norm-regrouped reciprocal local-polynomial coefficients, not a completely multiplicative degree-one ideal weight.

Signature withheld until its recorded canonical supplier interface exists.

API artin_euler_series.local: Every local factor is the reciprocal of the inertia-invariant polynomial.

API artin_euler_series.series: The absolutely convergent Euler product equals the norm-regrouped coefficient LSeries on Re s>1.

API artin_euler_series.nonzero: The convergent Euler product is nonzero on Re s>1.

API artin_euler_series.direct_sum: The direct-sum identity is exported by the separate lemma below.

API artin_euler_series.deleted: Omitting a finite bad-prime set multiplies L_K by exactly ∏_{p bad}P_p((Np)^−s).

TEST artin_euler_series.trivial: The one-dimensional trivial representation gives the convergent Dedekind series, including ramified primes.

TEST artin_euler_series.zero: The zero representation gives1.

TEST artin_euler_series.ramified: A one-dimensional character ramified at p contributes local factor1 there.

AnalyticNumberTheory:AN.5/halasz-coefficient-class
For κ>0, C(κ) consists of multiplicative arithmetic functions f with f(1)=1 for which F(s)=Σf(n)n^−s, an Euler-compatible logF series and −F′/F(s)=ΣΛ_f(n)n^−s converge absolutely on Re s>1, and |Λ_f(n)|≤κΛ(n). The logarithm is the branch fixed by the Euler expansion and tends to0 as real s→∞.

Signature withheld until its recorded canonical supplier interface exists.

API halasz_coefficient_class.log_coeff: The coefficients Λ_f are uniquely determined by their absolutely convergent Dirichlet series.

API halasz_coefficient_class.majorant: |Λ_f(n)|≤κΛ(n) for every n, hence they vanish away from prime powers.

API halasz_coefficient_class.nonzero: The Euler-compatible exponential identity gives F(s)≠0 on Re s>1.

API halasz_coefficient_class.mono: If κ≤κ′, C(κ)⊆C(κ′).

TEST halasz_coefficient_class.one: f(n)=1 belongs to C(1), with Λ_f=Λ.

TEST halasz_coefficient_class.mobius: μ belongs to C(1), with Λ_f=−Λ.

TEST halasz_coefficient_class.twist: f(n)=n^(it) belongs to C(1), with Λ_f(n)=n^(it)Λ(n).

TEST halasz_coefficient_class.growth: f(n)=n belongs to no fixed C(κ), since |Λ_f(p)|=p log p.


## Named targets still requiring native interface refinement

AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison
Let K be a number field, c a unitary idele-class character unramified outside a finite set S containing every archimedean place, and χ its ideal-character presentation from GlobalNumberFields Layer9. Choose Tate's admissible factorizable f with f_v=1_{O_v} for v∉S. For Re(s)>1, Z(f,c|·|^s)=(∏_{v∈S}Z_v(f_v,c_v|·|_v^s))(∏_{v∉S}N(d_v)^(−1/2))L_S(s,χ), where L_S(s,χ)=∑_{a integral, prime to S}χ(a)N(a)^(−s)=∏_{v∉S}(1−χ(v)N(v)^(−s))⁻¹. d_v is the local different; its product is finite because d_v is a unit at almost all places. Haar and Fourier normalizations are Tate's, not silently normalized unit volumes.

AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy
Let K/ℚ be finite Galois and ρ a finite-dimensional complex representation of Gal(K/ℚ). The incomplete Artin L-function, with precisely the ramified rational primes omitted, has a meromorphic continuation to an open neighbourhood of {Re(s)≥1}; it is holomorphic and nonzero on Re(s)=1 away from s=1, and its pole order at 1 is dim(V^G). This statement asserts neither global Artin holomorphy nor Chebotarev density.

AnalyticNumberTheory:AN.4/landau-nonnegative-logarithm
For a continued Hecke product F meromorphic near Re s≥1, with no poles except a pole of order at most one at 1, nonnegative norm-regrouped logarithmic coefficients on Re s>1 imply: F has no zeros at regular points of Re s≥1, and its meromorphic order at 1 is ≤0. A pole is not a nonzero finite value.

AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one
For every character χ of Cl_𝔪(K): L(s, χ) ≠ 0 for Re s = 1, s ≠ 1; and L(1, χ) ≠ 0 if χ ≠ 1 (for χ = 1, L(s, 1) has a simple pole at s = 1).

AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue
The Dedekind function supplied by the trivial-character Tate continuation agrees with NumberField.dedekindZeta K on Re s>1. Its complex residue at 1 equals NumberField.dedekindZeta_residue K, by agreement with the pinned real one-sided residue limit and uniqueness of a meromorphic residue. This is an agreement theorem on the convergence half-plane, not equality with the totalized LSeries everywhere.

AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation
For a primitive finite-order Hecke character χ with finite conductor f and the imported archimedean parity data, the canonical continued L-function, multiplied by the conductor/discriminant and the real/complex gamma factors in AL.1, satisfies Λ(s,χ)=ε(χ)Λ(1−s,χ̄) as a meromorphic identity. The principal character retains the two completed poles. Imprimitive deleted factors are a separate comparison.

AnalyticNumberTheory:AN.2/exceptional-conductor-repulsion
With c_star from Proposition 7.1, two distinct exceptional quadratic conductors N1<N2 satisfy N2>N1^2.

AnalyticNumberTheory:AN.5/quadratic-conductor-largest-prime
If N>1 is the conductor of a primitive quadratic character, then P(N)>0.94*log(N).

AnalyticNumberTheory:AN.2/schoenfeld-theta-upper
For x>0, theta(x)=sum_{p prime,p<=x}log p < 1.000081*x.

AnalyticNumberTheory:AN.2/mod-eight-interval-mass
With epsilon=0.002811, for a=3 or 5 and k>=2*10^10, theta(k;a,8)-theta(k/2;a,8)>=(1-3*epsilon)*k/8.

AnalyticNumberTheory:AN.2/prime-power-interval-margin
Put ε=0.002811. For real k≥2*10^10, the prime-power mass M=psi(k)−theta(k)−psi(k/2)+theta(k/2) is smaller than (((1−3*ε)/8)−0.1239)*k. For b:ℕ→ℂ with |b(n)|≤1 whenever k/2<n≤k, put P=Σ_{k/2<p≤k, p prime}b(p)log p and V=Σ_{k/2<n≤k}b(n)Λ(n). Then |V−P|≤M, so |P|≥(1−3*ε)*k/8 implies |V|>0.1239*k.

AnalyticNumberTheory:AN.2/two-real-zero-separation
There is an effective absolute c_star>0 such that if distinct real primitive quadratic characters of conductors N1,N2>1 have real zeros beta1,beta2, then min(beta1,beta2)<1-3*c_star/log(N1*N2).

AnalyticNumberTheory:AN.2/exceptional-zero-unique
For that same c_star, a primitive nonprincipal quadratic character of conductor N has at most one real zero in (1-c_star/log N,1), and any such zero is simple.

AnalyticNumberTheory:AN.2/character-weighted-pnt
For a primitive nonprincipal character chi of conductor N>1 and X sufficiently large, sum_{m<=X}chi(m)*Lambda(m)=-X^beta/beta+O(X*exp(-c*log X/(sqrt(log X)+log N))*(log N)^4), with the beta term only when an exceptional zero exists; c>0 and the implied constant are absolute and effective.

AnalyticNumberTheory:AN.2/rosser-schoenfeld-pi
For x>=59, (x/log x)*(1+1/(2 log x))<pi(x)<(x/log x)*(1+3/(2 log x)).

AnalyticNumberTheory:AN.2/explicit-prime-reciprocal
There is the prime Mertens constant B=0.26149... such that for x>=286, |sum_{p<=x}1/p-log log x-B|<1/(2*(log x)^2).

AnalyticNumberTheory:AN.2/landau-page-bounded-height
There is an effective absolute c>0 such that among primitive Dirichlet characters of moduli q<=T, T>=2, there is at most one zero rho=beta+i*t with |t|<=T and beta>1-c/log T. Any exception is a simple real zero of a real character.

AnalyticNumberTheory:AN.3/selberg-zero-density
For epsilon>0, Q>=2, T>=2, and 1/2<=sigma<=1, sum_{q<=Q} sum_{chi primitive mod q} N(sigma,T,chi) <<_epsilon (Q^(5+epsilon)*T^(3+epsilon))^(1-sigma), with effective constants with the right-hand side enlarged by +1, so the count includes the exceptional zero.

AnalyticNumberTheory:AN.2/quadratic-effective-zero-gap
For q>=3 and a quadratic Dirichlet character modulo q, a real zero beta>0 satisfies beta<=1-40/(sqrt(q)*(log q)^2).

AnalyticNumberTheory:AN.2/explicit-weighted-prime-sum
There exists an absolute real constant E such that, for every real x≥319, log x+E−1/(2 log x)<Σ_{p≤x}(log p)/p<log x+E+1/(2 log x). The same E applies at both endpoints of every interval subtraction.

AnalyticNumberTheory:AN.2/explicit-plus-euler-product
For real x>=10^8, product_{p prime,p<=x}(1+1/p)<=2*log x.

AnalyticNumberTheory:AN.4/bounded-degree-brauer-siegel
For number fields of bounded degree and discriminant D tending to infinity, log(h_K R_K)=(1/2+o(1)) log D. Keep fixed-degree uniformity and possible ineffectivity explicit.

AnalyticNumberTheory:AN.5/bounded-norm-ideal-count
For every fixed g≥1 and ε>0 there is C(g,ε)>0 such that for every number field E of degree 2g and every integer n≥1, the number of nonzero integral ideals of norm n is at most C(g,ε)n^ε. Consequently, for every real X≥1 the number of such ideals of norm at most X is O_(g,ε)(X^(1+ε)). Both constants are uniform in E.

AnalyticNumberTheory:AN.4/artin-conductor-bound
For representations occurring in the fixed-degree Colmez expression, establish log f_rho<=C_g(1+log |Disc(E)|). This is sufficient to absorb the conductor term in |Disc(E)|^epsilon.

AnalyticNumberTheory:AN.4/artin-log-functional-equation
For the relevant nontrivial Artin factors with nonzero L(0,rho), the completed functional equation relates L'/L(0,rho) to L'/L(1,conjugate(rho)), a conductor logarithm and fixed-degree archimedean terms. Track conjugation and gamma factors.

AnalyticNumberTheory:AN.4/artin-value-one-subpower
For the relevant nontrivial Artin factors, prove two-sided subpolynomial control of the nonzero values at 1 using Brauer induction and bounded-degree Hecke/Brauer-Siegel inputs, allowing ineffective constants.

AnalyticNumberTheory:AN.4/artin-log-derivative-one
For a nontrivial irreducible Artin factor of the bounded-degree normal closure used in the height formula, with L(1,conjugate(rho)) finite and nonzero, use a Brauer identity L(s,conjugate(rho)) = product_i L(s,chi_i)^n_i. Prove the required subpolynomial bound at s=1 for L_prime/L by summing n_i times the Hecke logarithmic derivatives. If trivial Hecke factors occur, first remove their poles and prove cancellation of their total orders; evaluate the regularized factors, not separate infinite values. Constants depend only on g and epsilon and may be ineffective. This is a missing source obligation, not the printed fixed-radius Cauchy estimate for L_prime.

AnalyticNumberTheory:AN.4/quadratic-zeta-factorization
For a quadratic extension E/F with its canonical nontrivial finite-order Hecke character η, ζ_E(s)=ζ_F(s)L_f(s,η) on Re s>1, including every ramified Euler factor.

AnalyticNumberTheory:AN.4/bounded-degree-residue-bounds
For every n>=1 and epsilon>0 there are c,C>0 depending only on n,epsilon such that c*D_K^(-epsilon)<=kappa_K<=C*D_K^epsilon for every number field of degree at most n. Constants may be ineffective. Derive from bounded-degree Brauer-Siegel, the explicit residue formula, the bounded number of roots of unity, and a finite adjustment for small discriminants. Normality is not added to the bounded-degree contract.

AnalyticNumberTheory:AN.4/quadratic-hecke-value-one
Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For every fixed g and epsilon>0, D_E^(-epsilon) <<_(g,epsilon) L_f(1,eta_E/F) <<_(g,epsilon) D_E^epsilon. Constants may be ineffective. Use kappa_E/kappa_F, the degree bounds 2g and g, and D_F<=D_E^(1/2), choosing each residue exponent at most 2*epsilon/3.

AnalyticNumberTheory:AN.4/primitive-hecke-convexity
Let chi be a primitive finite-order Hecke character over a degree-n number field K, Q=D_K*N(f_chi), 0<r<=1/2, and -r<=sigma<=1+r. For s=sigma+it with chi nontrivial or s≠1, |L_f(s,chi)| << |(1+s)/(1-s)|^delta(chi) * zeta_Q(1+r)^n * (Q*(3+|t|)^n/(2*pi)^n)^((1+r-sigma)/2), with an absolute implied constant. Define the pole factor to be |(1+s)/(1-s)| for the trivial character, and 1 for every nontrivial character (including at s=1); zeta_Q means the Riemann zeta function.

AnalyticNumberTheory:AN.4/quadratic-hecke-cauchy-derivative
Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For fixed g and every epsilon>0, |L_f prime(1,eta_E/F)| <<_(g,epsilon) D_E^epsilon. Set r=min(epsilon,1/4)>0. The closed circle |s-1|=r is in [-r,1+r] in real part, |t|<=r, and the convexity exponent is at most r. Hence its supremum is at most C_(g,r)*Q^r, and Cauchy gives |L_f prime(1)|<=C_(g,r)*Q^r/r. Holomorphy is required on the entire disk; a zero-free disk is unnecessary.

AnalyticNumberTheory:AN.4/quadratic-hecke-log-derivative-one
Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For every fixed g and epsilon>0, |L_f prime(1,eta)/L_f(1,eta)| <<_(g,epsilon) D_E^epsilon. Apply the derivative bound with epsilon/2 and the reciprocal value bound with epsilon/2. The latter, rather than Cauchy, is the possible ineffective input.

AnalyticNumberTheory:AN.4/quadratic-hecke-log-functional-equation
Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For ell_j=L_f prime(j,eta)/L_f(j,eta), both denominators are nonzero and ell_0+ell_1=-log Q+g*(gamma+log(2*pi)), where gamma is Euler constant. Differentiate the completed functional equation; Gamma_R prime/Gamma_R at 1 and 2 sum to -gamma-log(2*pi). Nonvanishing at 0 follows from the functional equation and L_f(1)>0. Each real local component of η is the sign character, so the conductor-normalized completion is Q^(s/2) Γ_R(s+1)^g L_f(s,η), with Γ_R(s)=π^(−s/2)Γ(s/2). This odd archimedean formula is not asserted for a real quadratic extension of a totally real field.

AnalyticNumberTheory:AN.5/ideal-coefficient-divisor-majorant
For a degree-n number field K, n>=1, let a_K(m) count nonzero integral ideals of norm m. For every m>=1, a_K(m)<=d_n(m), where d_n counts ordered n-tuples of positive integers with product m. At each rational prime the Euler factor product over p-adic prime ideals (1-T^f_i)^(-1) is coefficientwise bounded by (1-T)^(-n), since f_i>=1 and the number of factors is <=n; multiply over primes.

AnalyticNumberTheory:AN.5/fixed-order-divisor-subpower
For each integer n>=1 and epsilon>0 there is C_(n,epsilon) with d_n(m)<=C_(n,epsilon)*m^epsilon for every m>=1. Use d_n(p^a)=binomial(a+n-1,n-1). For large p this is <=n^a<=p^(epsilon*a); for the finitely many smaller primes the supremum of the polynomial in a divided by p^(epsilon*a) is finite. The product of those finitely many constants is independent of m.

AnalyticNumberTheory:AN.4/class-character-lseries-comparison
For a finite narrow-class character χ, L(s,χ)=Σ_aχ(a)N(a)^(−s)=∏_p(1−χ(p)N(p)^(−s))⁻¹, Re(s)>1, and L=Σ_Aχ(A)ζ_A. The printed Euler product omits χ(p); use the corrected one.

AnalyticNumberTheory:AN.4/cm-partial-zeta-period
For fundamental D<0, π^(−s)Γ(s)ζ_A(s)=(2^s/ω_D)|D|^(−s/2)E*(z_A,s), initially Re(s)>1 then by continuation. Here K=ℚ(√D), A is an ordinary ideal class, z_A is its associated CM lattice point in the upper half-plane, and ω_D=|O_K^×|/2 (thus ω_−4=2 and ω_−3=3). Here E(z,s)=(1/2)∑_(gcd(c,d)=1) (Im z)^s/|cz+d|^(2s) on Re s>1, and E*(z,s)=π^(−s)Γ(s)ζ(2s)E(z,s).

AnalyticNumberTheory:AN.4/real-even-partial-zeta-period
For fundamental D>1, π^(−s)Γ(s/2)²D^(s/2)(ζ_A+ζ_{JA})=2∫_{C_A}E*(z,s)ds, initially Re(s)>1 and then by continuation. The proof divides by the full norm-one unit action. Here K=ℚ(√D), A∈Cl^+(K), J is the narrow class of a principal ideal generated by an element of negative norm, and C_A is the oriented quadratic geodesic modulo the full norm-one unit group. With ε_D the least norm-one unit greater than 1, its arc length is 2 log ε_D. Here E(z,s)=(1/2)∑_(gcd(c,d)=1) (Im z)^s/|cz+d|^(2s) on Re s>1, and E*(z,s)=π^(−s)Γ(s)ζ(2s)E(z,s). The integration measure denoted ds in the displayed formula is hyperbolic arc length y^(−1)|dz|, not the complex variable s.

AnalyticNumberTheory:AN.4/genus-lseries-factorization
(p.971.) Let D = d'd be a fundamental discriminant, with d' and d fundamental discriminants (hence coprime), K = Q(√D), and χ the associated genus character of Cl^+(K). For D > 0, χ(J) = sign d = sign d'. Kronecker's decomposition holds: L(s,χ) = L(s,χ_{d'})L(s,χ_d). Equivalently Λ(s,χ) = Λ(s,χ_{d'})Λ(s,χ_d), with Λ(s,χ) as in (7.4)–(7.5) and Λ(s,χ_d) as in (5.13).

AnalyticNumberTheory:AN.4/negative-genus-core-period
For s=1/2+it, coprime negative fundamental d,d′ and D=d′d>0, Λ(s,χ_d)Λ(s,χ_{d′})=(s(1−s)/2)Σ_Aχ(A)∫_{F_A}E*(z,s)dμ. First continue the compact boundary Hecke identity from Re(s)>1 to the critical line, then apply Stokes there. The raw core integral diverges when Re(s)>1 and is not its initial definition.

AnalyticNumberTheory:AN.4/positive-genus-geodesic-period
Let D > 1 be a fundamental discriminant and D = d′d a factorization into positive fundamental discriminants (equivalently, d′, d > 0 coprime fundamental discriminants with d′d > 1; then D is fundamental). Let χ be the genus character. Then Λ(s,χ_{d'})Λ(s,χ_d) = Σ_{A∈Cl^+(K)} χ(A)∫_{C_A} E*(z,s)y^{−1}|dz|, as meromorphic functions of s (7.8). On Re(s) = 1/2 this is the second case of Theorem 3, where ∫_{∂F_A} replaces ∫_{C_A}.

AnalyticNumberTheory:AN.4/mixed-genus-cm-period
For coprime fundamental d,d′ of opposite sign, Λ(s,χ_d)Λ(s,χ_{d′})=(2√π/ω_D)Σ_Aχ(A)E*(z_A,s), as a meromorphic identity. Here D=dd′<0, the sum is over ordinary ideal classes of ℚ(√D), χ is the genus character, and ω_D=|O_K^×|/2 as in the CM partial-zeta comparison; use the same E* normalization.

AnalyticNumberTheory:AN.4/real-odd-partial-zeta-period
For fundamental D>1, π^(−s)Γ((s+1)/2)²D^(s/2)(ζ_A−ζ_{JA})=2∫_{C_A}i∂_zE*(z,s)dz, initially Re(s)>1 and then by continuation. This is the odd archimedean branch, with an oriented differential rather than arc length. Here K=ℚ(√D), A∈Cl^+(K), J is the narrow class of a principal ideal generated by an element of negative norm, and C_A is the oriented quadratic geodesic modulo the full norm-one unit group. With ε_D the least norm-one unit greater than 1, its arc length is 2 log ε_D. Here E(z,s)=(1/2)∑_(gcd(c,d)=1) (Im z)^s/|cz+d|^(2s) on Re s>1, and E*(z,s)=π^(−s)Γ(s)ζ(2s)E(z,s). The orientation is the quadratic-class orientation used in DIT §7; reversing it changes the sign of the differential integral.

AnalyticNumberTheory:AN.3/eisenstein-weyl-lvalue-bound
There is an absolute C > 0 such that, for every ε > 0, every fundamental D = d'd with genus character χ, and every s with Re(s) = 1/2: Weyl(E(·,s),χ) ≪_ε |s|^C |L(s,χ_{d'})L(s,χ_d)| |D|^{1/4+ε}. The paper prints the left side as 'Weyl(s,χ)'.

AnalyticNumberTheory:AN.3/critical-line-gamma-quotient
For s=1/2+it, t real and α,β∈{0,1}, |Γ((s+α)/2)Γ((s+β)/2)/Γ(s)|≤C|s|^(1/2), with one absolute C.

AnalyticNumberTheory:AN.3/reciprocal-zeta-line-one
Let Zinv be the meromorphic reciprocal of the continued ζ, extended at s=1 by zero. For all real t, |Zinv(1+2it)|≤C log(2+|t|), and Zinv(1+2it)→0 as t→0.

AnalyticNumberTheory:AN.2/siegel-quadratic-lvalue
For every ε > 0 there is c(ε) > 0, not effectively computable, such that L(1,χ_D) ≥ c(ε)|D|^{−ε} for every fundamental discriminant D ≠ 1.

AnalyticNumberTheory:AN.4/real-quadratic-class-regulator-lower
For every ε>0, h⁺(D)log ε_D≥c_ε D^(1/2−ε) for positive fundamental D, with an ineffective c_ε>0 and the narrow regulator convention of DIT item144.

AnalyticNumberTheory:AN.4/imaginary-quadratic-class-number-lower
For every ε>0, h(D)≥c_ε |D|^(1/2−ε) for negative fundamental D, with an ineffective c_ε>0.

AnalyticNumberTheory:AN.2/mertens-prime-reciprocal
There is a real B such that Σ_{p≤x}1/p=log log x+B+O(1/log x) for real x≥2, with an absolute implied constant.

AnalyticNumberTheory:AN.2/mertens-prime-product
For real x≥2, ∏_{p≤x}(1−1/p)^−1=e^γ log x+O(1), with γ Euler’s constant and an absolute implied constant.

AnalyticNumberTheory:AN.2/prime-interval-three-x
For all sufficiently large x, the number of primes in (x,3x] lies between 4+x/log x and 3x/log x.

AnalyticNumberTheory:AN.5/medium-prime-cardinality
For fixed integer m≥0, #N_m(x)∼(x/log x)^m/(2^m m!) as x→∞; m is fixed, not uniform in m.

AnalyticNumberTheory:AN.5/inverse-totient-count
For real x≥1, #{d∈ℕ_{>0}:φ(d)≤x}=O(x), with an absolute constant.

AnalyticNumberTheory:AN.5/divisor-maximal-order
For every ε>0 there is K_ε>e such that for every integer k≥K_ε, τ(k)≤exp((log 2+ε)log k/log log k).

AnalyticNumberTheory:AN.3/davenport-mobius-cancellation
For every A>0 there is C_A such that for y≥2, sup_{α∈ℝ}|Σ_{1≤r≤y}μ(r)e^{ir α}|≤C_A y(log y)^{−A}. Original proof input [22] or [39,Thm 13.10] still requires full source extraction.

AnalyticNumberTheory:AN.5/coprime-mobius-log-sum
For every A>0, uniformly in positive integers q≤T^4 and real T≥2, Σ_{1≤t≤T,(t,q)=1} μ(t)log t/t=−q/φ(q)+O_A((log T)^−A).

AnalyticNumberTheory:AN.5/prime-divisor-product-mean
For fixed n∈N,c>0 and f on rational primes with |f(p)|≤c/p, set a(t)=∏_{p|t}(1+f(p))^n for t≥1. Then Σ_{1≤t≤x}a(t)=Cx+O_{n,c}(√x), x≥1, where C=∏_p(1+((1+f(p))^n−1)/p); the product is absolutely convergent and f may be complex.

AnalyticNumberTheory:AN.5/gamma-prime-product-tail
For fixed n∈ℕ and real x≥e², define γ_n(p)=1−1/p+(1+1/(p−1))^n/p for each rational prime p. The convergent product over p>log x is 1+O_n(1/log x), uniformly after retaining any subset of those primes. In particular γ_0(p)=1; the equivalent expression p^(n−1)/(p−1)^n uses an integer exponent n−1, never truncated natural subtraction.

AnalyticNumberTheory:AN.2/mertens-product-comparison
For y≥2, ∏_{p≤y}(1−1/p) is comparable to 1/log y, with absolute positive upper and lower constants. The application here needs the lower estimate after removing finitely many fixed primes, not an unsourced precise constant.

AnalyticNumberTheory:AN.5/shifted-coprime-mobius-sum
For every A>0 there are constants C_A>0 and T_A≥2 such that for every real T≥T_A and every positive integer 1≤q≤√T, |Σ_{1≤t≤T/q,(t,q)=1}μ(t)log(qt)/t+q/φ(q)|≤C_A(log T)^(−A). The constants are independent of q.

AnalyticNumberTheory:AN.5/totient-reciprocal-bound
For n≥3, 1/φ(n)≤C log log n/n, with an absolute C>0.

AnalyticNumberTheory:AN.3/positive-truncation-error-cancellation
For A>0 and y,z≥2, sup_{α∈R}|Σ_{1≤r≤y}E_z(r)e^(irα)|≤C_A y(log y)(log z)^−A.

AnalyticNumberTheory:AN.5/coprime-mobius-reciprocal-sum
For every A>0, uniformly in positive integers q≤T^4 and T≥2, Σ_{1≤t≤T,(t,q)=1} μ(t)/t=O_A((log T)^−A).

AnalyticNumberTheory:AN.5/landau-sum-two-squares-count
For K→∞, #{1≤k≤K:k=u²+v² for some integers u,v}∼C_L K/√log K with the positive Landau–Ramanujan constant C_L.

AnalyticNumberTheory:AN.5/landau-three-square-form-count
For real K≥2, the count of positive integers k≤K with 4(k−1)=u²+3v² for some integers u,v is at most C K/√log K for one absolute C>0; the k=1 norm-zero case is counted once.

AnalyticNumberTheory:AN.5/shifted-square-count
#{1≤k≤K:k−4 is an integer square}≤1+√max(K−4,0), for K≥1.

AnalyticNumberTheory:AN.5/landau-exception-union
The union of k=u²+v², 4(k−1)=u²+3v² and k−4=u², with k positive and ≤K, has cardinality ∼C′ K/√log K for a positive C′.

AnalyticNumberTheory:AN.5/half-density-prime-support-count
Fix a positive modulus M and R⊆(ZMod M)^× with 2#R=φ(M); primes dividing M are excluded. Let H be the subgroup generated by R. For each fixed a∈H there are C₁,C₂>0 and X₀≥2, depending only on M,R,a, such that for all X≥X₀ the count of positive ν≤X with every prime factor lying in R modulo M and ν≡a mod M lies between C₁ X/√log X and C₂ X/√log X. If a∉H, that count is0. The empty factorization ofν=1 is included only in the identity class.

AnalyticNumberTheory:AN.4/louboutin-dedekind-residue-upper
For every number field K of degree d>1 and absolute discriminant D_K, the residue κ_K of the continued Dedekind zeta function satisfies κ_K≤(e log D_K/(2(d−1)))^(d−1).

AnalyticNumberTheory:AN.3/ray-class-zero-density
There is c = c([k : ℚ]) > 0 such that for Q, T > 1, 1/2 ≤ σ < 1 and ε > 0, Σ_{Nm 𝔮≤Q}Σ*_{χ mod 𝔮}N_χ(σ, T) ≪_{[k:ℚ],ε} (Disc(k)QT)^{c(1−σ)+ε}, the inner sum over primitive ray class characters of conductor 𝔮 and N_χ(σ, T) counting zeros with ℜρ ∈ (σ, 1), |ℑρ| ≤ T.

AnalyticNumberTheory:AN.4/most-quadratic-many-split-primes
For ε₁ > 0 and X ≥ 2 there is E = E(k, X, ε₁) ⊂ {F/k quadratic, Disc(F/k) ≤ X} with |E| ≪_{[k:ℚ],ε₁} Disc(k)^{ε₁}X^{ε₁}, such that for F ∉ E and 4 ≤ Y ≤ X, π_k(Y; F, e) ≥ (1/8)π_k(Y/2) − C_{[k:ℚ],ε₁}Y^{σ₁}log²(X Disc(k)) with σ₁ = max(1 − ε₁/(4c), 1/2). E consists of the F whose character χ_{F/k} has a zero with ℜρ > σ₁, |ℑρ| ≤ X^{1/2}; the proof is the explicit formula with Lemma 4.1.

AnalyticNumberTheory:AN.4/effective-prime-ideal-lower
For every fixed degree n there is a positive effective c_n and an absolute effective D₀ such that π_k(Y)≥c_n D_k^(−19)Y/log Y whenever [k:Q]=n, D_k≥D₀ and Y≥D_k^35.

AnalyticNumberTheory:AN.2/mertens-first-theorem
For X≥2, Σ_{p<X}(log p)/p=log X+O(1), with an absolute implied constant.

AnalyticNumberTheory:AN.3/mestre-weil-explicit-formula
Let A, B > 0, a_i, a′_i ≥ 0 (1 ≤ i ≤ M) with Σ a_i = Σ a′_i, b_i, b′_i ∈ C with non-negative real parts, and Λ_1, Λ_2 meromorphic on C with (i) Λ_1(1 − s) = wΛ_2(s) for some w ∈ C^×; (ii) finitely many poles; (iii) Λ_i minus its singular parts bounded in every vertical strip of finite width; (iv) for some c ≥ 0 and Re s > 1 + c, Λ_1(s) = A^s Π_{i=1}^M Γ(a_i s + b_i) Π_p Π_{i=1}^{M′} (1 − α_i(p)p^{−s})^{−1} and Λ_2(s) = B^s Π_{i=1}^M Γ(a′_i s + b′_i) Π_p Π_{i=1}^{M′} (1 − β_i(p)p^{−s})^{−1} with |α_i(p)|, |β_i(p)| ≤ p^c. Let F satisfy weil_test_function(c,F). For every zero gamma slope a_i=0 (respectively a′_i=0), assume b_i≠0 (respectively b′_i≠0), so its constant gamma factor is finite and nonzero. Then Σ_ρ Φ(ρ) − Σ_μ Φ(μ) + Σ_{i=1}^M I(a_i, b_i) + Σ_{i=1}^M J(a′_i, b′_i) = F(0) log(AB) − Σ_{p,i,k≥1} (α_i(p)^k F(k log p) + β_i(p)^k F(−k log p)) log p / p^{k/2}, where ρ (resp. μ) runs over the zeros (resp. poles) of Λ_1 with −c ≤ Re ≤ 1 + c, with multiplicity, Σ_ρ Φ(ρ) = lim_{T→∞} Σ_{|Im ρ|<T} Φ(ρ), Φ(s) = ∫_R F(x) e^{(s−1/2)x} dx, I(a, b) = a ∫_0^∞ (F(ax) e^{−(a/2+b)x}/(1 − e^{−x}) − F(0) e^{−x}/x) dx and J(a, b) is the same with F(−ax). For a>0 the displayed I,J are ordinary convergent combined integrals (do not integrate the two individually divergent subtraction terms separately). For a=0 set I(0,b)=J(0,b)=0 after removing its constant gamma factor; this is not0 times an undefined integral.

AnalyticNumberTheory:AN.5/restricted-squarefree-landau-count
For D(X)={n∈N:1≤n<X, n squarefree, every odd prime factor p satisfies p≡1 mod4}, there is a positive absolute C_D such that #D(X)=C_D X/√log X·(1+O(1/log X)) as X→∞. The cutoff is strict, as in KP§1. C_D=(3/(4√2))∏_{p≡1(4)}(1−p^(−2))∏_{p≡3(4)}(1−p^(−2))^(1/2), with positive convergent products.

AnalyticNumberTheory:AN.5/restricted-sathe-selberg-count
Let D_r(N)={n∈D(N):ω(n)=r}, with D(N) the strict-cutoff squarefree family defined in restricted_squarefree_landau_count and ω(n) the number of distinct prime divisors. For every fixed A>0 there are C₁,C₂>0 and N₀≥3, depending only on A, such that for every real N≥N₀ and integer1≤r≤A log log N, C₁(N/log N)(½ log log N)^(r−1)/(r−1)!≤#D_r(N)≤C₂(N/log N)(½ log log N)^(r−1)/(r−1)!. No r=0 or varying-A uniformity is asserted.

AnalyticNumberTheory:AN.2/squareclass-exceptional-repulsion
There is an effective absolute0<c_Landau<1/2 such that distinct d,e∈S(c_Landau) with |d|≤|e| satisfy |d|²≤|e|. This pairwise form applies to every existing finite ordered segment; no infinitude of S(c_Landau) is asserted.

AnalyticNumberTheory:AN.2/quadratic-prime-character-interval
There are positive absolute effective constants c,C such that for every nonzero squarefree integer D≠1, its primitive field character χ_D of conductor Q_D=|Disc(Q(√D))|, and real2≤u<v, |Σ_{u<p<v, p prime, p∤Q_D}χ_D(p)|≤C[E_D(v)+v exp(−c log v/(√log v+log Q_D))(log(vQ_D))⁴]. Here E_D(v)=v^β if the conductor-uniform zero-free region singles out a simple real exceptional zero β∈(1/2,1), and E_D(v)=0 otherwise. Equivalently extend χ_D by0 at ramified primes and sum over all primes. This is an upper bound, not an asymptotic for short intervals.

AnalyticNumberTheory:AN.2/effective-quadratic-zero-separation
For every ε>0 there is an effectively computable c_ε>0, fixed before D and β, such that for every nonzero squarefree integer D≠1 and real zero β∈(1/2,1) of the canonical continued primitive field-character L(s,χ_D), 1−β≥c_ε |D|^(−1/2−ε). The conductor is Q_D=|Disc(Q(√D))|, with |D|≤Q_D≤4|D|; conductor/radicand conversion only changes c_ε effectively.

AnalyticNumberTheory:AN.4/heilbronn-simple-real-zero
If K/Q is finite Galois and the canonical continued ζ_K has a simple real zero β with0<β<1, then a quadratic subfield k⊆K satisfies ζ_k(β)=0. The conclusion uses meromorphic Artin continuation and the Aramata–Brauer entire-quotient theorem, not Artin holomorphy.

AnalyticNumberTheory:AN.4/gross-zagier-cm-eisenstein-comparison
Let D<0 be a fundamental discriminant, K=Q(√D), u=#O_K^×/2 and A an ordinary ideal class. Choose its CM lattice point τ_A in the upper half-plane from a primitive positive-definite binary quadratic form of discriminant D. Let E(z,s)=(1/2)Σ_{gcd(c,d)=1}(Im z)^s/|cz+d|^(2s), the uncompleted level-one Eisenstein series. For Re s>1, E(τ_A,s)=2^(−s)|D|^(s/2)u ζ(2s)^(−1)ζ_K(A,s), equivalently2^s ζ(2s)E(τ_A,s)=u|D|^(s/2)ζ_K(A,s). All positive-base powers use the real logarithm. Changing A to A^(−1) leaves its partial zeta unchanged.

AnalyticNumberTheory:AN.4/imaginary-genus-character-dictionary
For an imaginary quadratic field K of fundamental discriminant D<0, genus characters are homomorphisms Cl_K→{±1}, including the trivial homomorphism. They correspond bijectively to unordered fundamental-discriminant factorizations{D₁,D₂}, D=D₁D₂, one positive and one negative; permit the trivial discriminant1 with ε_1=1. For an integral ideal a prime to D, χ_{D₁,D₂}(a)=ε_{D₁}(N a)=ε_{D₂}(N a). This node is the arithmetic classification/compatibility dictionary. The analytic equality L_K(s,χ)=L(s,ε_{D₁})L(s,ε_{D₂}) is supplied by the existing genus_lseries_factorization node, not proved again here.

AnalyticNumberTheory:AN.4/imaginary-quadratic-root-number-one
For negative fundamental D, put δ=|D| and let ε_D be the canonical primitive odd Dirichlet character of Q(√D), of conductorδ. On Re s>1, Λ(s,ε_D)=(δ/π)^((s+1)/2)Γ((s+1)/2)L(s,ε_D). Its canonical entire continuation is δ^((s+1)/2)·DirichletCharacter.completedLFunction(ε_D,s). The new quadratic normalization assertion is that the root number is+1 and Λ(1−s,ε_D)=Λ(s,ε_D). Entire continuation of a nontrivial Dirichlet completed function is already in Mathlib; no duplicate continuation construction is planned.

AnalyticNumberTheory:AN.4/imaginary-quadratic-lvalue-one
For an imaginary quadratic field of fundamental discriminant D<0, δ=|D|, class number h and w=2u roots of unity, L(1,ε_D)=πh/(u√δ).

AnalyticNumberTheory:AN.4/imaginary-quadratic-lvalue-zero
With the same imaginary quadratic data, the canonical continued primitive Dirichlet function satisfies L(0,ε_D)=h/u.

AnalyticNumberTheory:AN.2/order-one-hadamard
For nonzero entire f of order at most1, f(z)=z^m exp(a+bz)∏_αE₁(z/α), with locally uniform convergence, exact zero multiplicities and finite/empty zero sets permitted.

AnalyticNumberTheory:AN.2/finite-order-hadamard
For nonzero entire f of finite order at most ρ≥0, set n=floor ρ. Its nonzero zeros α with multiplicity satisfy Σ|α|^(−n−1)<∞ and f(z)=z^m exp(h(z))∏E_n(z/α), where E_n(w)=(1−w)exp(Σ_{j=1}^n w^j/j), h is a polynomial of degree≤n and the product converges locally uniformly. Finite/empty zero sets are allowed.

AnalyticNumberTheory:AN.3/character-half-interval-formula
There are absolute C>0 and k₀≥2 such that for every primitive nonprincipal Dirichlet characterχ of conductor q, integer k≥k₀ and real2≤T≤k, Σ_(k/2<m≤k)χ(m)Λ(m)=−Σ_(nontrivial zeros |Imρ|≤T)mρ(k^ρ−(k/2)^ρ)/ρ+E, with |E|≤C[k log²(qk)/T+log²(qk)]. Endpoint sums are over positive integers; powers use exp(ρ log x).

AnalyticNumberTheory:AN.4/brauer-meromorphic-continuation
Every finite-image complex Artin Euler series has a meromorphic continuation to C obtained from an integral Brauer expression as a finite product of integer powers of canonical Hecke continuations. This asserts global meromorphy, not Artin holomorphy.

AnalyticNumberTheory:AN.2/chebyshev-prime-count-transfer
From ψ(x)∼x, obtain θ(x)∼x, π(x)∼Li(x) and π(x)∼x/log x, using the existing ADS transfer and pinned prime-power bound.

AnalyticNumberTheory:AN.2/dirichlet-conductor-zero-free-region
There is an effective absolute c>0 such that a primitive nonprincipal Dirichlet L-function of conductor q≥2 has no zero in Re s≥1−c/log(q(|Im s|+2)), except possibly one simple real zero of a real character.

AnalyticNumberTheory:AN.2/siegel-walfisz
For every A,B>0, uniformly for q≤(log x)^B and gcd(a,q)=1, π(x;a,q)=Li(x)/φ(q)+O_{A,B}(x(log x)^−A) as x→∞. The constant and threshold may be ineffective.

AnalyticNumberTheory:AN.5/halasz-integral-bound
For fixed κ>0, f∈C(κ) and sufficiently large x, |Σ_{n≤x}f(n)|≤C_κ x/log x ·∫_{1/log x}^1 max_{|t|≤(log x)^κ}|F(1+σ+it)/(1+σ+it)| dσ/σ + C_κ x(log log x)^κ/log x. The constant is uniform in f.

AnalyticNumberTheory:AN.5/halasz-classical
For multiplicative |f(n)|≤1, x≥2,T≥1, let M(x,T)=min_{|t|≤2T}D(f,n^(it);x)². Then |Σ_{n≤x}f(n)|/x≤C((1+M)e^−M+T^−1/2), with an absolute C; increasing C handles bounded x.

AnalyticNumberTheory:AN.5/dirichlet-divisor-average
For x≥2, Σ_{1≤n≤x}τ(n)=x log x+(2γ−1)x+O(√x), with an absolute constant and inclusive real cutoff.

AnalyticNumberTheory:AN.5/zeta-second-moment
As T→∞, ∫_0^T|ζ(1/2+it)|²dt=T log(T/(2π))+(2γ−1)T+O(√T log T), with an absolute constant.

AnalyticNumberTheory:AN.5/zeta-fourth-moment
As T→∞, ∫_0^T|ζ(1/2+it)|⁴dt=(1/(2π²))T(log T)^4+O(T(log T)^3), with an absolute constant.

AnalyticNumberTheory:AN.5/moment-model-comparison
For each fixed k>0, the statement ∫_0^T|ζ(1/2+it)|^(2k)dt∼a(k)g(k)T(log T)^(k²) is a conjectural model with the arithmetic Euler factor a(k) and random-matrix factor g(k) supplied by PM.5. No asymptotic for general k is asserted unconditionally; k=1 and2 are checked against the proved moments.

AnalyticNumberTheory:AN.5/beurling-all-log-remainders
For a discrete Beurling system whose ζ converges on Re s>1, π_P(x)=Li(x)+O_m(x/log^m x) for every m≥1 iff N(x)=ax+O_m(x/log^m x) for every m≥1 for some a>0. Each error constant may depend on m and the system.

AnalyticNumberTheory:AN.3/dirichlet-polynomial-mean-square
For N≥1,T≥1 and complex a₁,…,a_N, ∫_{−T}^T|Σ_{n=1}^N a_n n^(−it)|²dt=2TΣ|a_n|²+O(Σn|a_n|²), with an absolute constant.

AnalyticNumberTheory:AN.7/lerch-cover-continuation
The initial Φ germ continues to a single-valued holomorphic function on the universal cover of C_s times (C_z minus {0,1}) times (C_c minus the nonpositive integers), with basepoint (s,z,c)=(1/2,−1,1/2) and the germ continued from the principal domain. The continuation becomes single-valued on a two-step solvable cover; it need not descend to an abelian cover in the z coordinate.

AnalyticNumberTheory:AN.7/lerch-nonpositive-special-values
For m≥0, Φ(z,−m,c)=(z∂_z+c)^m(1/(1−z)), a rational function of z,c with poles only at z=1. It extends in c across all integers and has zero monodromy. For m=1 it equals c/(1−z)+z/(1−z)².

AnalyticNumberTheory:AN.7/circle-hurwitz-import
For real 0<c≤1 and Re s>1, the z=1 Lerch/Hurwitz series Σ_{n≥0}(n+c)^−s agrees with the pinned UnitAddCircle Hurwitz function using c mod1 and its endpoint convention c=1. Its meromorphic continuation has a simple pole at s=1 of residue1.

AnalyticNumberTheory:AN.7/exp-zeta-lerch-comparison
For real a, z=e^(2πia), Re s>1, expZeta(a,s)=zΦ(z,s,1) in the absolutely convergent boundary series. The right side uses that series or its matched boundary continuation. At a=0 it is the Riemann/Hurwitz degeneration, handled separately.

AnalyticNumberTheory:AN.7/dirichlet-hurwitz-finite-sum
For a character χ modulo q≥1 and Re s>1, L(s,χ)=q^−sΣ_{a=1}^q χ(a)ζ_H(s,a/q), using the actual principal/imprimitive character values. Continue with the pinned Dirichlet and circle-Hurwitz functions and keep the principal pole.

AnalyticNumberTheory:AN.7/lerch-even-functional-equation
On the extended polycylinder s∈C,0<Re a<1,0<Re c<1, put L_+=ζ(s,a,c)+e^(−2πia)ζ(s,1−a,1−c) and Λ_+=π^(−s/2)Γ(s/2)L_+. Then Λ_+(s,a,c)=e^(−2πiac)Λ_+(1−s,1−c,a), as matched holomorphic continuations. Apparent gamma poles cancel in the completed combination.

AnalyticNumberTheory:AN.7/lerch-odd-functional-equation
On the same polycylinder, L_−=ζ(s,a,c)−e^(−2πia)ζ(s,1−a,1−c) and Λ_−=π^(−(s+1)/2)Γ((s+1)/2)L_− satisfy Λ_−(s,a,c)=i e^(−2πiac)Λ_−(1−s,1−c,a), with matched continuations and removable gamma poles.

AnalyticNumberTheory:AN.7/complex-hurwitz-continuation
The preceding series extends jointly meromorphically to s∈C, Re c>0, with only a simple pole at s=1 and residue1 independent of c. For fixed c, (s−1)ζ_H(s,c) is entire in s. The c shift identity remains valid there.

AnalyticNumberTheory:AN.7/complex-hurwitz-bernoulli-values
For m≥0 and Re c>0, the canonical continuation has ζ_H(−m,c)=−B_{m+1}(c)/(m+1), with Bernoulli polynomials normalized by te^(ct)/(e^t−1)=ΣB_j(c)t^j/j!. In particular ζ_H(0,c)=1/2−c.

AnalyticNumberTheory:AN.4/quadratic-residue-quotient
For a quadratic extension E/F, L_f(1,η)=κ_E/κ_F>0, where κ_K is the positive residue of the continued Dedekind function. Here η is the canonical nontrivial primitive quadratic Hecke character attached by global Artin reciprocity. Its holomorphy at 1, the continued zeta factorization, and the two simple positive residues give the quotient; general line-one nonvanishing is not needed for this argument.


## Additional lemma specifications exposed by codex-45ZB12

AnalyticNumberTheory:AN.2/zero-reciprocal-truncation-bound
Under the family/count hypotheses there is K>0, depending on α,C,b, such that for R≥2, Σ_{|α_i|<R}|α_i|⁻¹≤K R^(b−1). The sum is finite and counts repeated zeros.

AnalyticNumberTheory:AN.2/zero-reciprocal-square-tail-bound
Under the family/count hypotheses there is K>0, depending only on C,b, such that for R≥1, the reciprocal-square series over |α_i|>R is summable and Σ_{|α_i|>R}|α_i|⁻²≤K R^(b−2).

AnalyticNumberTheory:AN.2/canonical-product-inner-lower-bound
Under the family/count hypotheses there is K>0 such that for R≥2, |z|=R and every finite subset S of indices with |α_i|<R/2, Σ_{i∈S}log|E₁(z/α_i)|≥−K R^b.

AnalyticNumberTheory:AN.2/canonical-product-middle-lower-bound
Under the family/count hypotheses there is K>0 such that for R≥2 satisfying |R−|α_i||>|α_i|⁻² for every index, |z|=R and every finite S with R/2≤|α_i|≤2R, Σ_{i∈S}log|E₁(z/α_i)|≥−K R^b(1+log(2R)).

AnalyticNumberTheory:AN.2/canonical-product-outer-lower-bound
Under the family/count hypotheses there is K>0 such that for R≥2 and |z|=R the unordered outer product P_out(z)=∏_{|α_i|>2R}E₁(z/α_i) is nonzero and log|P_out(z)|≥−K R^b.

AnalyticNumberTheory:AN.2/xi-zero-critical-strip
For every complex ρ with ξ(ρ)=0,0<Re ρ<1.

AnalyticNumberTheory:AN.3/zeta-poisson-zero-weight
There is an absolute C>0 such that for every real t, Σ_(ξ(ρ)=0)mρ/(1+(t−Imρ)²) is summable and at most C log(2+|t|), with mρ=analyticOrderNatAt ξρ.

AnalyticNumberTheory:AN.3/zeta-trivial-zero-simple
For every natural n≥1, analyticOrderNatAt riemannZeta(−2n)=1.

AnalyticNumberTheory:AN.3/primitive-character-unit-height-zero-count
There is an absolute C>0 such that for every primitive nonprincipal Dirichlet character χ of conductor q≥1 and every real u, the nontrivial L-zero occurrences with u≤Imρ≤u+1 number at most C log(q(2+|u|)).

AnalyticNumberTheory:AN.4/artin-local-reciprocal-bound
For d∈N,0≤m≤d,0≤t≤θ<1 and α₁,…,α_m∈C with |α_j|=1, put A(z)=∏_{j=1}^m(1−α_j z). For |z|=t, A(z)≠0, |A(z)^−1|≤(1−θ)^−d and |A(z)^−1−1|≤d t(1−θ)^−d. The assertion includes d=m=0.

AnalyticNumberTheory:AN.4/artin-ramified-induction-polynomial
For L/K finite Galois with group G,H≤G,F=L^H and σ a finite-dimensional complex representation of H, at every nonzero prime p of K, P_{p,Ind_H^Gσ}(T)=∏_{q|p in F}P_{q,σ}(T^{f(q/p)}). The right polynomials are defined from Gal(L/F)=H, their own inertia invariants and arithmetic Frobenius modulo inertia.

-/
