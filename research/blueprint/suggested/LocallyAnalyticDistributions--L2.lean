import Mathlib.NumberTheory.Padics.MahlerBasis
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.NumberTheory.Padics.Measure.Basic
import Mathlib.Topology.LocallyConstant.Algebra
import Mathlib.NumberTheory.LegendreSymbol.AddCharacter
import Mathlib.NumberTheory.DirichletCharacter.Orthogonality
import Mathlib.Topology.ContinuousMap.ZeroAtInfty
import Mathlib.Analysis.Normed.Operator.Banach
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Data.Nat.Digits.Lemmas
import Mathlib.Order.Filter.Cofinite
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Algebra.MvPolynomial.Degrees

/-!
# Locally analytic distributions, Layer 2 (follow-up part): suggested Lean forms

This file is not the roadmap and is not exhaustive. The roadmap document
(`research/blueprint/readmes/LocallyAnalyticDistributions--L2.md`) is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and signatures. Every proof
is `sorry` unless it is a short check against Mathlib; nothing here is claimed to be formalised.

Baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. Only Mathlib is imported.

What is native here. Balls are fibres of `PadicInt.toZModPow`; locally polynomial functions,
Colmez's wavelets, the class `C^r` (Taylor data with uniform `o(|y|^r)` remainder), the Mahler
`C^r` norm, the ball-moment admissibility bound, box indicators, multivariable van der Put
coefficients, and the vector, isotropic and block order predicates all have real bodies. A
continuous linear form on a space of `C^r` functions is written as a linear map bounded by the
Mahler norm (`IsCrBounded`). Loeffler's printed Definition 2.12 is stated literally
(`IsLoefflerLiteralOrder`) so that the source issue E3/E11 is a Lean statement.

What is omitted. The completed projective tensor product of Banach spaces and the strong dual of
the locally analytic functions (Layer 0 of this roadmap) have no carriers at the pins, so the
vector-order space is given through its van der Put characterisation, which this part proves
equivalent to the tensor construction, and `restrictAlg` from `D(ℤ_p, L)` is listed at the end.
-/

noncomputable section

open Filter Topology
open scoped Classical ZeroAtInfty

set_option linter.unusedSectionVars false

namespace TauCeti

namespace LocallyAnalytic

variable (p : ℕ) [hp : Fact p.Prime]

/-! ## Digits, balls and the coefficient map -/

/-- `ℓ(n)`, the number of base-`p` digits of `n` (`ℓ 0 = 0`). -/
def digitLength (n : ℕ) : ℕ := (Nat.digits p n).length

/-- `n⁻`: `n` with its leading base-`p` digit removed, `n mod p^{ℓ(n) - 1}`. -/
def vdpPred (n : ℕ) : ℕ := n % p ^ (digitLength p n - 1)

/-- The ball `a + p^h ℤ_p`, the fibre of reduction modulo `p^h` through `a`. -/
def ball (a : ℤ_[p]) (h : ℕ) : Set ℤ_[p] :=
  {x | PadicInt.toZModPow h x = PadicInt.toZModPow h a}

variable (L : Type*) [NontriviallyNormedField L] [NormedAlgebra ℚ_[p] L]

/-- The coefficient map `ℤ_p → L`. -/
def toL (x : ℤ_[p]) : L := algebraMap ℚ_[p] L (x : ℚ_[p])

/-! ## `L2/locally-polynomial-functions` -/

/-- `φ` agrees on every ball of radius `p^{-h}` with a polynomial of degree `≤ N`. -/
def IsLocallyPolynomial (N h : ℕ) (φ : ℤ_[p] → L) : Prop :=
  ∀ a : ℤ_[p], ∃ P : Polynomial L, P.natDegree ≤ N ∧ ∀ x ∈ ball p a h, φ x = P.eval (toL p L x)

/-- `LP^{[0,N]}_h(ℤ_p, L)`. -/
def LP (N h : ℕ) : Submodule L (ℤ_[p] → L) where
  carrier := {φ | IsLocallyPolynomial p L N h φ}
  zero_mem' := fun _ => ⟨0, by simp, fun _ _ => by simp⟩
  add_mem' := by
    intro φ ψ hφ hψ a
    obtain ⟨P, hP, hPφ⟩ := hφ a
    obtain ⟨Q, hQ, hQψ⟩ := hψ a
    exact ⟨P + Q, (Polynomial.natDegree_add_le _ _).trans (max_le hP hQ),
      fun x hx => by simp [hPφ x hx, hQψ x hx]⟩
  smul_mem' := by
    intro c φ hφ a
    obtain ⟨P, hP, hPφ⟩ := hφ a
    exact ⟨Polynomial.C c * P, (Polynomial.natDegree_C_mul_le _ _).trans hP,
      fun x hx => by simp [hPφ x hx]⟩

/-- `LP^{[0,N]}(ℤ_p, L)`, the union over the radii. -/
def LPAll (N : ℕ) : Submodule L (ℤ_[p] → L) := ⨆ h, LP p L N h

theorem LP_mono {N N' h h' : ℕ} (hN : N ≤ N') (hh : h ≤ h') : LP p L N h ≤ LP p L N' h' := by
  sorry

theorem mem_LP_iff (N h : ℕ) (φ : ℤ_[p] → L) :
    φ ∈ LP p L N h ↔ ∀ a ∈ Finset.range (p ^ h), ∃ P : Polynomial L, P.natDegree ≤ N ∧
      ∀ x ∈ ball p (a : ℤ_[p]) h, φ x = P.eval (toL p L x) := by
  sorry

theorem LP_zero_eq_locallyConstant :
    (LPAll p L 0 : Set (ℤ_[p] → L)) = Set.range (fun f : LocallyConstant ℤ_[p] L => (f : ℤ_[p] → L)) := by
  sorry

theorem LP_basis (N h : ℕ) : Module.finrank L (LP p L N h) = p ^ h * (N + 1) := by
  sorry

theorem LP_mul {N M h : ℕ} {φ ψ : ℤ_[p] → L} (hφ : φ ∈ LP p L N h) (hψ : ψ ∈ LP p L M h) :
    φ * ψ ∈ LP p L (N + M) h := by
  sorry

theorem LP_comp_affine {N h n : ℕ} (b : ℤ_[p]) {φ : ℤ_[p] → L} (hφ : φ ∈ LP p L N (h + n)) :
    (fun x => φ (b + (p : ℤ_[p]) ^ n * x)) ∈ LP p L N h := by
  sorry

-- LocallyAnalyticTests.LP_finrank_two
example [Fact (Nat.Prime 2)] {L : Type*} [NontriviallyNormedField L] [NormedAlgebra ℚ_[2] L] :
    Module.finrank L (LP 2 L 1 1) = 4 := by
  sorry

-- LocallyAnalyticTests.LP_level_zero
example (N : ℕ) : Module.finrank L (LP p L N 0) = N + 1 := by
  sorry

-- LocallyAnalyticTests.LP_zero_locallyConstant
example (f : LocallyConstant ℤ_[p] L) : (f : ℤ_[p] → L) ∈ LPAll p L 0 := by
  sorry

-- LocallyAnalyticTests.LP_square_not_linear
example (h : ℕ) : (fun x : ℤ_[p] => toL p L x ^ 2) ∉ LP p L 1 h := by
  sorry

/-! ## `L2/colmez-wavelets` -/

/-- Colmez's wavelet `e_{i,k,r} = p^{[ℓ(i) r]} 1_{i + p^{ℓ(i)} ℤ_p} ((x - i)/p^{ℓ(i)})^k`. -/
def colmezWavelet (r : ℝ) (i k : ℕ) (x : ℤ_[p]) : L :=
  if x ∈ ball p (i : ℤ_[p]) (digitLength p i) then
    (p : L) ^ ⌊(digitLength p i : ℝ) * r⌋₊ *
      algebraMap ℚ_[p] L (((x : ℚ_[p]) - i) / (p : ℚ_[p]) ^ digitLength p i) ^ k
  else 0

theorem colmezWavelet_apply (r : ℝ) (i k : ℕ) (x : ℤ_[p]) (hx : x ∈ ball p (i : ℤ_[p]) (digitLength p i)) :
    colmezWavelet p L r i k x = (p : L) ^ ⌊(digitLength p i : ℝ) * r⌋₊ *
      algebraMap ℚ_[p] L (((x : ℚ_[p]) - i) / (p : ℚ_[p]) ^ digitLength p i) ^ k := by
  simp [colmezWavelet, hx]

theorem colmezWavelet_mem_LP (r : ℝ) (i k : ℕ) :
    colmezWavelet p L r i k ∈ LP p L k (digitLength p i) := by
  sorry

theorem colmezWavelet_basis (r : ℝ) (h : ℕ) :
    LinearIndependent L (fun ik : Fin (p ^ h) × Fin (⌊r⌋₊ + 1) => colmezWavelet p L r ik.1 ik.2) ∧
    Submodule.span L (Set.range fun ik : Fin (p ^ h) × Fin (⌊r⌋₊ + 1) =>
      colmezWavelet p L r ik.1 ik.2) = LP p L ⌊r⌋₊ h := by
  sorry

/-- The amplitude coefficient `b_{i,k}`, the coordinate in the wavelet basis. -/
def amplitudeCoeff (r : ℝ) (i k : ℕ) : LPAll p L ⌊r⌋₊ →ₗ[L] L := sorry

theorem amplitudeCoeff_colmezWavelet (r : ℝ) (i i' k k' : ℕ) (hk' : k' ≤ ⌊r⌋₊)
    (hmem : colmezWavelet p L r i' k' ∈ LPAll p L ⌊r⌋₊) :
    amplitudeCoeff p L r i k ⟨_, hmem⟩ = if (i, k) = (i', k') then 1 else 0 := by
  sorry

theorem colmezWavelet_zero (r : ℝ) (k : ℕ) (x : ℤ_[p]) :
    colmezWavelet p L r 0 k x = toL p L x ^ k := by
  sorry

-- LocallyAnalyticTests.colmezWavelet_value
example [Fact (Nat.Prime 3)] {L : Type*} [NontriviallyNormedField L] [NormedAlgebra ℚ_[3] L] :
    colmezWavelet 3 L (1 / 2) 4 0 (13 : ℤ_[3]) = 3 ∧ colmezWavelet 3 L (1 / 2) 4 0 (1 : ℤ_[3]) = 0 := by
  sorry

-- LocallyAnalyticTests.colmezWavelet_level_zero
example (r : ℝ) (k : ℕ) : colmezWavelet p L r 0 k = fun x => toL p L x ^ k :=
  funext (colmezWavelet_zero p L r k)

-- LocallyAnalyticTests.colmezWavelet_r_zero
example (i : ℕ) (hU : IsClopen (ball p (i : ℤ_[p]) (digitLength p i))) :
    colmezWavelet p L 0 i 0 = (LocallyConstant.charFn L hU : ℤ_[p] → L) := by
  sorry

-- LocallyAnalyticTests.colmezWavelet_count
example [Fact (Nat.Prime 2)] {L : Type*} [NontriviallyNormedField L] [NormedAlgebra ℚ_[2] L] :
    Module.finrank L (LP 2 L ⌊(1 : ℝ)⌋₊ 2) = Fintype.card (Fin (2 ^ 2) × Fin (⌊(1 : ℝ)⌋₊ + 1)) ∧
      Fintype.card (Fin (2 ^ 2) × Fin (⌊(1 : ℝ)⌋₊ + 1)) = 8 := by
  sorry

/-! ## The class `C^r` (Colmez §I.5) and its Mahler norm -/

/-- Colmez's class `C^r`: Taylor data `D j`, `j ≤ [r]`, with remainder `o(|y|^r)` uniformly in `x`. -/
def IsCr (r : ℝ) (φ : ℤ_[p] → L) : Prop :=
  ∃ D : ℕ → ℤ_[p] → L, D 0 = φ ∧ ∀ ε > 0, ∃ δ > 0, ∀ x y : ℤ_[p], ‖y‖ < δ →
    ‖φ (x + y) - ∑ j ∈ Finset.range (⌊r⌋₊ + 1), D j x * toL p L y ^ j / (j.factorial : L)‖ ≤
      ε * ‖y‖ ^ r

/-- `C^r(ℤ_p, L)` as a subspace of the functions `ℤ_p → L`. -/
def Cr (r : ℝ) : Submodule L (ℤ_[p] → L) where
  carrier := {φ | IsCr p L r φ}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- Colmez's Mahler norm `sup_n |a_n(φ)| p^{r ℓ(n)}`, that is `p^{-v_{C^r}(φ)}`. -/
def mahlerCrNorm (r : ℝ) (φ : ℤ_[p] → L) : ℝ :=
  ⨆ n : ℕ, ‖(fwdDiff 1)^[n] φ 0‖ * (p : ℝ) ^ (r * digitLength p n)

/-- A linear form on `C^r` that is continuous for the Mahler norm: an element of `D_r(ℤ_p, L)`. -/
def IsCrBounded (r : ℝ) (μ : Cr p L r →ₗ[L] L) : Prop :=
  ∃ C : ℝ, ∀ φ : Cr p L r, ‖μ φ‖ ≤ C * mahlerCrNorm p L r φ

variable [CompleteSpace L] [IsUltrametricDist L]

/-! ## `L2/taylor-coefficient-bounds`, `L2/cr-derivatives`, `L2/cr-locally-analytic-bound` -/

/-- Colmez Lemma I.5.3, in norm form: `|a_k| p^{-kh} ≤ p^{C(N)} sup_{p^h ℤ_p} |Σ a_k x^k/k!|`. -/
theorem taylor_coefficient_bound (N h : ℕ) (a : ℕ → L) (k : ℕ) (hk : k ≤ N) :
    ‖a k‖ * (p : ℝ) ^ (-((k : ℝ) * h)) ≤
      (p : ℝ) ^ (∑ n ∈ Finset.range (N + 1), (padicValNat p n.factorial : ℝ)) *
      ⨆ x : {x : ℤ_[p] // ‖x‖ ≤ (p : ℝ) ^ (-(h : ℤ))},
        ‖∑ j ∈ Finset.range (N + 1), a j * toL p L x ^ j / (j.factorial : L)‖ := by
  sorry

/-- Colmez Proposition I.5.4: for `r ≥ 1`, `φ ∈ C^r` is differentiable and `φ' ∈ C^{r-1}`. -/
theorem cr_deriv_mem {r : ℝ} (hr : 1 ≤ r) {φ : ℤ_[p] → L} (hφ : IsCr p L r φ) :
    ∃ φ' : ℤ_[p] → L, IsCr p L (r - 1) φ' ∧
      ∀ x, Tendsto (fun y : ℤ_[p] => (toL p L y)⁻¹ * (φ (x + y) - φ x)) (𝓝[≠] 0) (𝓝 (φ' x)) := by
  sorry

/-- Colmez Proposition I.5.19: `v_{C^r}(φ) ≥ v_{LA_h}(φ) - r h - C₁(r)` on the local monomials. -/
theorem localMonomial_mahlerCrNorm_le (r : ℝ) (hr : 0 ≤ r) :
    ∃ C₁ : ℝ, ∀ (a : ℤ_[p]) (n k : ℕ),
      mahlerCrNorm p L r (fun x => if x ∈ ball p a n then
        algebraMap ℚ_[p] L (((x : ℚ_[p]) - a) / (p : ℚ_[p]) ^ n) ^ k else 0) ≤
        (p : ℝ) ^ (r * n + C₁) := by
  sorry

/-! ## `L2/wavelet-norm-bound`, `L2/amplitude-coefficient-bound`, `L2/taylor-truncation-density`,
`L2/cr-wavelet-basis` -/

/-- Colmez Lemma I.5.10 in the Mahler normalisation (constant absorbed): wavelets are bounded in `C^r`. -/
theorem colmezWavelet_mahlerCrNorm_le (r : ℝ) (hr : 0 ≤ r) :
    ∃ C : ℝ, ∀ i k, k ≤ ⌊r⌋₊ → mahlerCrNorm p L r (colmezWavelet p L r i k) ≤ C := by
  sorry

/-- Colmez Theorem I.5.14: the wavelets form a Banach basis of `C^r`; every `φ ∈ C^r` has a unique
null family of amplitude coefficients, and the expansion converges uniformly. -/
theorem cr_wavelet_basis (r : ℝ) (hr : 0 ≤ r) (φ : ℤ_[p] → L) (hφ : IsCr p L r φ) :
    ∃! b : C₀(ℕ × Fin (⌊r⌋₊ + 1), L), ∀ x : ℤ_[p],
      HasSum (fun ik : ℕ × Fin (⌊r⌋₊ + 1) => b ik * colmezWavelet p L r ik.1 ik.2 x) (φ x) := by
  sorry

/-- Colmez Proposition I.5.13: Taylor truncations are dense; `LP^{[0,[r]]}` is dense in `C^r`. -/
theorem taylor_truncation_dense (r : ℝ) (hr : 0 ≤ r) (φ : ℤ_[p] → L) (hφ : IsCr p L r φ) :
    ∃ φh : ℕ → ℤ_[p] → L, (∀ h, φh h ∈ LP p L ⌊r⌋₊ h) ∧
      Tendsto (fun h => mahlerCrNorm p L r (φ - φh h)) atTop (𝓝 0) := by
  sorry

/-- Colmez Proposition I.5.12: amplitude coefficients are bounded by the `C^r` norm. -/
theorem amplitude_coeff_bound (r : ℝ) (hr : 0 ≤ r) :
    ∃ C : ℝ, ∀ (φ : LPAll p L ⌊r⌋₊) (i k : ℕ),
      ‖amplitudeCoeff p L r i k φ‖ ≤ C * mahlerCrNorm p L r φ := by
  sorry

/-! ## `L2/cr-mahler-criterion` -/

/-- Colmez Theorem I.5.17: `φ ∈ C^r` iff `|a_n(φ)| p^{r ℓ(n)} → 0`. -/
theorem isCr_iff_mahler (r : ℝ) (hr : 0 ≤ r) (φ : C(ℤ_[p], L)) :
    IsCr p L r φ ↔
      Tendsto (fun n : ℕ => ‖(fwdDiff 1)^[n] (φ : ℤ_[p] → L) 0‖ * (p : ℝ) ^ (r * digitLength p n))
        atTop (𝓝 0) := by
  sorry

/-! ## `L2/cr-derivative-surjection`, `L2/cr-banach-algebra`, `L2/cr-composition` -/

/-- Colmez Proposition I.5.16: `d/dx : C^r → C^{r-1}` is onto, with kernel the closure of `LC`. -/
theorem cr_deriv_surjective {r : ℝ} (hr : 1 ≤ r) (ψ : ℤ_[p] → L) (hψ : IsCr p L (r - 1) ψ) :
    ∃ φ : ℤ_[p] → L, IsCr p L r φ ∧
      ∀ x, Tendsto (fun y : ℤ_[p] => (toL p L y)⁻¹ * (φ (x + y) - φ x)) (𝓝[≠] 0) (𝓝 (ψ x)) := by
  sorry

/-- De Ieso Lemma 2.9 with `F = ℚ_p`: `C^r(ℤ_p, L)` is closed under products. -/
theorem isCr_mul {r : ℝ} {φ ψ : ℤ_[p] → L} (hφ : IsCr p L r φ) (hψ : IsCr p L r ψ) :
    IsCr p L r (φ * ψ) := by
  sorry

/-- Corrected Colmez Proposition I.5.6 (see E8/E9): composition with a Lipschitz map preserves
`C^r` for `0 ≤ r < 1`. -/
theorem isCr_comp_lipschitz {r : ℝ} (hr0 : 0 ≤ r) (hr1 : r < 1) {φ₁ : ℤ_[p] → ℤ_[p]}
    (hφ₁ : ∃ c : ℝ, ∀ x y, ‖φ₁ x - φ₁ y‖ ≤ c * ‖x - y‖) {φ₂ : ℤ_[p] → L} (hφ₂ : IsCr p L r φ₂) :
    IsCr p L r (φ₂ ∘ φ₁) := by
  sorry

/-- Composition for `r ≥ 1` (De Ieso Proposition 2.12, the case `[r] ≥ 1`). -/
theorem isCr_comp_of_one_le {r : ℝ} (hr : 1 ≤ r) {φ₁ : ℤ_[p] → ℤ_[p]}
    (hφ₁ : IsCr p L r (fun x => toL p L (φ₁ x))) {φ₂ : ℤ_[p] → L} (hφ₂ : IsCr p L r φ₂) :
    IsCr p L r (φ₂ ∘ φ₁) := by
  sorry

/-- The digit map `x = Σ a_n p^n ↦ Σ a_n p^{⌊2n/3⌋}` of the counterexample to Colmez I.5.6. -/
def digitMap (x : ℤ_[p]) : ℤ_[p] :=
  ∑' n : ℕ, ((PadicInt.toZModPow (n + 1) x).val / p ^ n % p : ℕ) * (p : ℤ_[p]) ^ (2 * n / 3)

/-- E8/E9: the digit map is `C^{1/2}` but its self-composite is not. -/
theorem digitMap_counterexample :
    IsCr p L (1 / 2) (fun x => toL p L (digitMap p x)) ∧
      ¬ IsCr p L (1 / 2) (fun x => toL p L (digitMap p (digitMap p x))) := by
  sorry

/-! ## `L2/order-on-one-dimensional-groups` -/

section Groups

variable {G : Type*} [CommGroup G] [TopologicalSpace G]

/-- `f` is `C^r` on `G` through the chart `κ`: on every coset `a·κ(ℤ_p)` the transported function
is of class `C^r`. -/
def IsCrOn (κ : Multiplicative ℤ_[p] →* G) (r : ℝ) (f : G → L) : Prop :=
  ∀ a : G, IsCr p L r (fun x : ℤ_[p] => f (a * κ (Multiplicative.ofAdd x)))

/-- `C^r(G, L)` through the chart `κ`. -/
def CrOn (κ : Multiplicative ℤ_[p] →* G) (r : ℝ) : Submodule L (G → L) where
  carrier := {f | IsCrOn p L κ r f}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

theorem CrOn_chart_independent [CompactSpace G] (κ κ' : Multiplicative ℤ_[p] →* G)
    (hκ : Topology.IsOpenEmbedding κ) (hκ' : Topology.IsOpenEmbedding κ') (r : ℝ) :
    CrOn p L κ r = CrOn p L κ' r := by
  sorry

theorem CrOn_zero_eq_continuous [CompactSpace G] (κ : Multiplicative ℤ_[p] →* G)
    (hκ : Topology.IsOpenEmbedding κ) (f : G → L) :
    f ∈ CrOn p L κ 0 ↔ Continuous f := by
  sorry

-- LocallyAnalyticTests.CrOn_identity_chart
example (r : ℝ) (f : Multiplicative ℤ_[p] → L) :
    f ∈ CrOn p L (MonoidHom.id _) r ↔ IsCr p L r (fun x => f (Multiplicative.ofAdd x)) := by
  sorry

end Groups

/-! ## `L2/admissible-algebraic-distributions` -/

/-- The normalised local monomial `1_{a + p^n ℤ_p} ((x - a)/p^n)^k`. -/
def localMonomial (a : ℤ_[p]) (n k : ℕ) (x : ℤ_[p]) : L :=
  if x ∈ ball p a n then algebraMap ℚ_[p] L (((x : ℚ_[p]) - a) / (p : ℚ_[p]) ^ n) ^ k else 0

theorem localMonomial_mem (a : ℤ_[p]) (n k N : ℕ) (hk : k ≤ N) :
    localMonomial p L a n k ∈ LPAll p L N := by
  sorry

/-- Algebraic distributions of degree `≤ N`: linear forms on `LP^{[0,N]}`. -/
abbrev AlgDist (N : ℕ) := LPAll p L N →ₗ[L] L

/-- Build an algebraic distribution from ball moments that depend on `a mod p^n` and are additive
under subdivision. -/
def AlgDist.ofBallMoments (N : ℕ) (m : ℤ_[p] → ℕ → ℕ → L)
    (hper : ∀ a b n i, b ∈ ball p a n → m a n i = m b n i)
    (hadd : ∀ a n i, m a n i = ∑ c ∈ Finset.range p, m (a + c * (p : ℤ_[p]) ^ n) (n + 1) i) :
    AlgDist p L N := sorry

/-- `r`-admissibility: the normalised ball moments of degree `≤ N` are `O(p^{r n})`. -/
def IsAdmissible (r : ℝ) (N : ℕ) (μ : AlgDist p L N) : Prop :=
  ∃ C : ℝ, ∀ (a : ℤ_[p]) (n k : ℕ) (hk : k ≤ N),
    ‖μ ⟨localMonomial p L a n k, localMonomial_mem p L a n k N hk⟩‖ ≤ C * (p : ℝ) ^ (r * n)

/-- `p^{-v_{D_r,N}(μ)} = sup_{a,n,k ≤ N} |μ(1_{a+p^nℤ_p}((x-a)/p^n)^k)| p^{-rn}`. -/
def admissibleNorm (r : ℝ) (N : ℕ) (μ : AlgDist p L N) : ℝ :=
  ⨆ (a : ℤ_[p]) (n : ℕ) (k : Fin (N + 1)),
    ‖μ ⟨localMonomial p L a n k, localMonomial_mem p L a n k N (Nat.lt_succ_iff.mp k.2)⟩‖ *
      (p : ℝ) ^ (-(r * n))

/-- `D^{[0,N]}_r(ℤ_p, L)`. -/
def AdmissibleAlgDist (r : ℝ) (N : ℕ) : Submodule L (AlgDist p L N) where
  carrier := {μ | IsAdmissible p L r N μ}
  zero_mem' := ⟨0, fun _ _ _ _ => by simp⟩
  add_mem' := sorry
  smul_mem' := sorry

theorem isAdmissible_mono {r s : ℝ} (hrs : r ≤ s) {N : ℕ} {μ : AlgDist p L N}
    (hμ : IsAdmissible p L r N μ) : IsAdmissible p L s N μ := by
  sorry

theorem isAdmissible_iff_topDegree (r : ℝ) (N : ℕ) (hN : ⌊r⌋₊ ≤ N) (μ : AlgDist p L N) :
    IsAdmissible p L r N μ ↔ ∃ C : ℝ, ∀ (a : ℤ_[p]) (n : ℕ),
      ‖μ ⟨localMonomial p L a n N, localMonomial_mem p L a n N N le_rfl⟩‖ ≤ C * (p : ℝ) ^ (r * n) := by
  sorry

-- LocallyAnalyticTests.admissible_zero
example (r : ℝ) (N : ℕ) : IsAdmissible p L r N 0 := ⟨0, fun _ _ _ _ => by simp⟩

/-! ## `L2/moment-bound-necessity`, `L2/wavelet-value-bound`, `L2/higher-degree-vanishing`,
`L2/order-r-valuations` -/

/-- Colmez Theorem II.3.2(i): an order-`r` distribution satisfies the ball-moment bound. -/
theorem moment_bound_necessity (r : ℝ) (hr : 0 ≤ r) (μ : Cr p L r →ₗ[L] L)
    (hμ : IsCrBounded p L r μ) (hmem : ∀ a n k, localMonomial p L a n k ∈ Cr p L r) :
    ∃ C : ℝ, ∀ a n k, ‖μ ⟨localMonomial p L a n k, hmem a n k⟩‖ ≤ C * (p : ℝ) ^ (r * n) := by
  sorry

/-- The wavelet values of an admissible distribution are bounded (Colmez, proof of II.3.2(ii),
with the integrand corrected as in E7). -/
theorem wavelet_value_bound (r : ℝ) (hr : 0 ≤ r) (N : ℕ) (hN : ⌊r⌋₊ ≤ N) (μ : AlgDist p L N)
    (hμ : IsAdmissible p L r N μ) (hmem : ∀ i k, k ≤ ⌊r⌋₊ → colmezWavelet p L r i k ∈ LPAll p L N) :
    ∃ C : ℝ, ∀ i k (hk : k ≤ ⌊r⌋₊), ‖μ ⟨colmezWavelet p L r i k, hmem i k hk⟩‖ ≤ C := by
  sorry

/-- Colmez, proof of II.3.2(ii): an admissible form vanishing in degree `≤ [r]` vanishes. -/
theorem higher_degree_vanishing (r : ℝ) (hr : 0 ≤ r) (N : ℕ) (hN : ⌊r⌋₊ ≤ N) (lam : AlgDist p L N)
    (hlam : IsAdmissible p L r N lam) (hle : LPAll p L ⌊r⌋₊ ≤ LPAll p L N)
    (hlow : ∀ φ (hφ : φ ∈ LPAll p L ⌊r⌋₊), lam ⟨φ, hle hφ⟩ = 0) : lam = 0 := by
  sorry

/-- Amice–Vélu–Vishik with the equivalence of valuations (Colmez Theorem II.3.2, Proposition II.3.3):
restriction from `D_r` to `D^{[0,N]}_r` is bijective. -/
theorem order_r_restriction_bijective (r : ℝ) (hr : 0 ≤ r) (N : ℕ) (hN : ⌊r⌋₊ ≤ N)
    (hLP : ∀ φ ∈ LPAll p L N, φ ∈ Cr p L r) (μ : AlgDist p L N) (hμ : IsAdmissible p L r N μ) :
    ∃! μ' : Cr p L r →ₗ[L] L, IsCrBounded p L r μ' ∧
      ∀ φ (hφ : φ ∈ LPAll p L N), μ' ⟨φ, hLP φ hφ⟩ = μ ⟨φ, hφ⟩ := by
  sorry

/-! ## `L2/critical-kernel` -/

-- The polynomial input of `L2/critical-kernel`.
example {R : Type*} [CommRing R] (P : Polynomial R) (N : ℕ) (h : P.natDegree ≤ N) :
    Polynomial.derivative^[N + 1] P = 0 :=
  Polynomial.iterate_derivative_eq_zero (by omega)

/-! ## `L2/finite-fourier-inversion` -/

/-- Additive Fourier inversion on `ℤ/p^m`: Mathlib's `AddChar.sum_mulShift` for `zmodChar`. -/
theorem finite_fourier_inversion_add {L' : Type*} [Field L'] (m : ℕ) [NeZero (p ^ m)] {ζ : L'}
    (hζ : IsPrimitiveRoot ζ (p ^ m)) (u : ZMod (p ^ m)) :
    ∑ t : ZMod (p ^ m), AddChar.zmodChar (p ^ m) ((IsPrimitiveRoot.iff_def ζ (p ^ m)).mp hζ).1 (t * u) =
      ((if u = 0 then Fintype.card (ZMod (p ^ m)) else 0 : ℕ) : L') :=
  AddChar.sum_mulShift u (AddChar.zmodChar_primitive_of_primitive_root (p ^ m) hζ)

/-- Multiplicative Fourier inversion on `(ℤ/p^n)ˣ`: Mathlib's Dirichlet-character orthogonality. -/
theorem finite_fourier_inversion_mul {L' : Type*} [CommRing L'] [IsDomain L'] (n : ℕ) [NeZero (p ^ n)]
    [HasEnoughRootsOfUnity L' (Monoid.exponent (ZMod (p ^ n))ˣ)] {a : ZMod (p ^ n)} (ha : IsUnit a)
    (b : ZMod (p ^ n)) :
    ∑ χ : DirichletCharacter L' (p ^ n), χ a⁻¹ * χ b = if a = b then ((p ^ n).totient : L') else 0 :=
  DirichletCharacter.sum_char_inv_mul_char_eq L' ha b

/-! ## `L2/coefficient-extension`, `L2/unit-character-determination` -/

/-- `χ(x) x^j` on `ℤ_p` (zero on `pℤ_p`), for a Dirichlet character modulo `p^n`. -/
def unitCharMonomial (n : ℕ) (χ : DirichletCharacter L (p ^ n)) (j : ℕ) (x : ℤ_[p]) : L :=
  χ (PadicInt.toZModPow n x) * toL p L x ^ j

/-- Uniqueness from locally algebraic characters on `ℤ_p^×`, stated over a coefficient field that
already has the roots of unity (the general case reduces to this by `L2/coefficient-extension`). -/
theorem unit_character_determination (N : ℕ) {r : ℝ} (hr0 : 0 ≤ r) (hr : r < N + 1)
    [∀ n, HasEnoughRootsOfUnity L (Monoid.exponent (ZMod (p ^ n))ˣ)]
    (μ : Cr p L r →ₗ[L] L) (hμ : IsCrBounded p L r μ)
    (hsupp : ∀ φ (hφ : φ ∈ Cr p L r), (∀ x : ℤ_[p], IsUnit x → φ x = 0) → μ ⟨φ, hφ⟩ = 0)
    (hmem : ∀ n χ j, unitCharMonomial p L n χ j ∈ Cr p L r)
    (hvan : ∀ n (χ : DirichletCharacter L (p ^ n)) j, j ≤ N → μ ⟨_, hmem n χ j⟩ = 0) :
    μ = 0 := by
  sorry

end LocallyAnalytic

namespace AnalyticDistributions

open LocallyAnalytic

variable (p : ℕ) [hp : Fact p.Prime] (K : Type*) [NontriviallyNormedField K] [NormedAlgebra ℚ_[p] K]
variable {g : ℕ}

/-! ## `L2/box-indicators` -/

/-- The box `B(a, m) = {x : x_j ≡ a_j mod p^{m_j}}`. -/
def padicBox (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) : Set (Fin g → ℤ_[p]) :=
  {x | ∀ j, PadicInt.toZModPow (m j) (x j) = PadicInt.toZModPow (m j) (a j)}

theorem padicBox_isClopen (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) : IsClopen (padicBox p a m) := by
  sorry

/-- The indicator of a box, as a locally constant function. -/
def boxIndicator (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) : LocallyConstant (Fin g → ℤ_[p]) K :=
  LocallyConstant.charFn K (padicBox_isClopen p a m)

theorem mem_padicBox_iff (a x : Fin g → ℤ_[p]) (m : Fin g → ℕ) :
    x ∈ padicBox p a m ↔ ∀ j, PadicInt.toZModPow (m j) (x j) = PadicInt.toZModPow (m j) (a j) :=
  Iff.rfl

theorem boxIndicator_refine (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) (t : Fin g) :
    boxIndicator p K a m = ∑ c ∈ Finset.range p,
      boxIndicator p K (Function.update a t (a t + c * (p : ℤ_[p]) ^ m t)) (Function.update m t (m t + 1)) := by
  sorry

theorem boxIndicator_mul (a a' : Fin g → ℤ_[p]) (m m' : Fin g → ℕ) :
    (Disjoint (padicBox p a m) (padicBox p a' m') →
      boxIndicator p K a m * boxIndicator p K a' m' = 0) ∧
    ((padicBox p a m ∩ padicBox p a' m').Nonempty →
      ∃ a'', boxIndicator p K a m * boxIndicator p K a' m' = boxIndicator p K a'' (m ⊔ m')) := by
  sorry

theorem locallyConstant_mem_span_boxIndicator (f : LocallyConstant (Fin g → ℤ_[p]) K) :
    ∃ h : ℕ, f ∈ Submodule.span K (Set.range fun a => boxIndicator p K a (fun _ => h)) := by
  sorry

theorem boxIndicator_translate (a b : Fin g → ℤ_[p]) (m : Fin g → ℕ) (x : Fin g → ℤ_[p]) :
    boxIndicator p K (a + b) m (x + b) = boxIndicator p K a m x := by
  sorry

-- AnalyticDistributionTests.boxIndicator_zero_radius
example (a : Fin g → ℤ_[p]) : boxIndicator p K a 0 = 1 := by
  sorry

-- AnalyticDistributionTests.boxIndicator_refine_count
example [Fact (Nat.Prime 2)] {K : Type*} [NontriviallyNormedField K] [NormedAlgebra ℚ_[2] K] :
    (1 : LocallyConstant (Fin 2 → ℤ_[2]) K) =
      ∑ c : Fin 2 × Fin 4, boxIndicator 2 K ![((c.1 : ℕ) : ℤ_[2]), ((c.2 : ℕ) : ℤ_[2])] ![1, 2] := by
  sorry

-- AnalyticDistributionTests.boxIndicator_eq_charFn
example (a : ℤ_[p]) (m : ℕ) (x : Fin 1 → ℤ_[p]) :
    boxIndicator p K (fun _ => a) (fun _ => m) x = Set.indicator (LocallyAnalytic.ball p a m) 1 (x 0) := by
  sorry

-- AnalyticDistributionTests.boxIndicator_radii_not_symmetric
example : boxIndicator p K (g := 2) 0 ![1, 0] ≠ boxIndicator p K 0 ![0, 1] := by
  sorry

/-! ## `L2/multivariable-van-der-put` -/

/-- The mixed van der Put coefficient `c_n(f) = Σ_{T ⊆ J(n)} (-1)^{|T|} f(n^T)`. -/
def vanDerPutCoeff (f : (Fin g → ℤ_[p]) → K) (n : Fin g → ℕ) : K :=
  ∑ T ∈ (Finset.univ.filter fun j => n j ≠ 0).powerset,
    (-1) ^ T.card * f (fun j => ((if j ∈ T then vdpPred p (n j) else n j : ℕ) : ℤ_[p]))

/-- `S(n) = Π_j (n_j + p^{ℓ(n_j)} ℤ_p)`. -/
def wavBox (n : Fin g → ℕ) : Set (Fin g → ℤ_[p]) :=
  padicBox p (fun j => (n j : ℤ_[p])) (fun j => digitLength p (n j))

variable [CompleteSpace K] [IsUltrametricDist K]

theorem vanDerPut_expansion (f : C(Fin g → ℤ_[p], K)) :
    HasSum (fun n : Fin g → ℕ => vanDerPutCoeff p K f n • Set.indicator (wavBox p n) (1 : (Fin g → ℤ_[p]) → K))
      (f : (Fin g → ℤ_[p]) → K) ∧
    ‖f‖ = ⨆ n, ‖vanDerPutCoeff p K f n‖ := by
  sorry

/-! ## `L2/separate-degree-polynomials` -/

/-- Separate degree `≤ N_j` in `x_j` on every box of radius `(h, …, h)`. -/
def IsLocallyPolynomialMulti (N : Fin g → ℕ) (h : ℕ) (f : (Fin g → ℤ_[p]) → K) : Prop :=
  ∀ a : Fin g → ℤ_[p], ∃ P : MvPolynomial (Fin g) K, (∀ j, P.degreeOf j ≤ N j) ∧
    ∀ x ∈ padicBox p a (fun _ => h), f x = MvPolynomial.eval (fun j => toL p K (x j)) P

/-- `LP^N_h(ℤ_p^g, K)`. -/
def LPmulti (N : Fin g → ℕ) (h : ℕ) : Submodule K ((Fin g → ℤ_[p]) → K) where
  carrier := {f | IsLocallyPolynomialMulti p K N h f}
  zero_mem' := fun _ => ⟨0, by simp, fun _ _ => by simp⟩
  add_mem' := sorry
  smul_mem' := sorry

def LPmultiAll (N : Fin g → ℕ) : Submodule K ((Fin g → ℤ_[p]) → K) := ⨆ h, LPmulti p K N h

/-- The tensor wavelet `e_{n,k,r}(x) = Π_j e_{n_j,k_j,r_j}(x_j)`. -/
def tensorWavelet (r : Fin g → ℝ) (n k : Fin g → ℕ) (x : Fin g → ℤ_[p]) : K :=
  ∏ j, colmezWavelet p K (r j) (n j) (k j) (x j)

theorem LPmulti_mono {N N' : Fin g → ℕ} {h h' : ℕ} (hN : N ≤ N') (hh : h ≤ h') :
    LPmulti p K N h ≤ LPmulti p K N' h' := by
  sorry

theorem tensorWavelet_basis (r : Fin g → ℝ) (h : ℕ) :
    LinearIndependent K (fun nk : (Fin g → Fin (p ^ h)) × ((j : Fin g) → Fin (⌊r j⌋₊ + 1)) =>
      tensorWavelet p K r (fun j => nk.1 j) (fun j => nk.2 j)) ∧
    Submodule.span K (Set.range fun nk : (Fin g → Fin (p ^ h)) × ((j : Fin g) → Fin (⌊r j⌋₊ + 1)) =>
      tensorWavelet p K r (fun j => nk.1 j) (fun j => nk.2 j)) =
      LPmulti p K (fun j => ⌊r j⌋₊) h := by
  sorry

theorem LPmulti_zero_eq_locallyConstant :
    (LPmultiAll p K (g := g) 0 : Set _) =
      Set.range (fun f : LocallyConstant (Fin g → ℤ_[p]) K => (f : (Fin g → ℤ_[p]) → K)) := by
  sorry

theorem LPmulti_mul {N M : Fin g → ℕ} {h : ℕ} {f f' : (Fin g → ℤ_[p]) → K}
    (hf : f ∈ LPmulti p K N h) (hf' : f' ∈ LPmulti p K M h) : f * f' ∈ LPmulti p K (N + M) h := by
  sorry

-- AnalyticDistributionTests.LPmulti_separate_not_total
example (h : ℕ) : (fun x : Fin 2 → ℤ_[p] => toL p K (x 0) * toL p K (x 1)) ∈ LPmulti p K ![1, 1] 0 ∧
    (fun x : Fin 2 → ℤ_[p] => toL p K (x 0) * toL p K (x 1)) ∉ LPmulti p K ![2, 0] h := by
  sorry

/-! ## `L2/tensor-function-realization`, `L2/vector-order-mixed-differences` -/

/-- Vector order `r` (all `r_j < 1`): `|c_n(f)| p^{Σ_j r_j ℓ(n_j)} → 0` cofinitely. This is the
corrected form of Loeffler's Definition 2.12. -/
def IsVectorOrder (r : Fin g → ℝ) (f : (Fin g → ℤ_[p]) → K) : Prop :=
  Continuous f ∧ Tendsto (fun n : Fin g → ℕ =>
    ‖vanDerPutCoeff p K f n‖ * (p : ℝ) ^ (∑ j, r j * digitLength p (n j))) cofinite (𝓝 0)

/-- Loeffler's printed Definition 2.12 (arXiv v2 and v3), for the coordinate quasi-factorization:
the simultaneous first-difference norm on `Π p^{m_j} ℤ_p`, times `p^{Σ r_j m_j}`, tends to `0` along
the cofinite filter of `ℕ^g`. -/
def IsLoefflerLiteralOrder (r : Fin g → ℝ) (f : (Fin g → ℤ_[p]) → K) : Prop :=
  Continuous f ∧ Tendsto (fun m : Fin g → ℕ =>
    (⨆ (x : Fin g → ℤ_[p]) (y : padicBox p 0 m), ‖f (x + (y : Fin g → ℤ_[p])) - f x‖) *
      (p : ℝ) ^ (∑ j, r j * m j)) cofinite (𝓝 0)

/-- E3/E11 in Lean: `1_{pℤ_p}(x_2)` has vector order `(1/2, 0)` but fails the literal definition. -/
theorem loeffler_literal_counterexample :
    let f : (Fin 2 → ℤ_[p]) → K := fun x => Set.indicator (LocallyAnalytic.ball p 0 1) 1 (x 1)
    IsVectorOrder p K ![1 / 2, 0] f ∧ ¬ IsLoefflerLiteralOrder p K ![1 / 2, 0] f := by
  sorry

/-- The vector-order space for `r_j < 1`, realized as functions. -/
def vectorOrderSpace (r : Fin g → ℝ) : Submodule K ((Fin g → ℤ_[p]) → K) where
  carrier := {f | IsVectorOrder p K r f}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- Every locally constant function has vector order `r` (finitely many van der Put coefficients). -/
theorem locallyConstant_isVectorOrder (r : Fin g → ℝ) (f : LocallyConstant (Fin g → ℤ_[p]) K) :
    IsVectorOrder p K r f := by
  sorry

/-! ## `L2/isotropic-order-functions`, `L2/isotropic-wavelet-basis`, `L2/isotropic-extension` -/

/-- Loeffler Definition 2.5: `|f(x+y) - f(x)| = o(p^{-rm})` uniformly for `y ∈ p^m ℤ_p^d`. -/
def IsIsotropicCr (r : ℝ) (f : (Fin g → ℤ_[p]) → K) : Prop :=
  ∀ ε > 0, ∃ m₀ : ℕ, ∀ m ≥ m₀, ∀ x y : Fin g → ℤ_[p], (∀ j, ‖y j‖ ≤ (p : ℝ) ^ (-(m : ℤ))) →
    ‖f (x + y) - f x‖ ≤ ε * (p : ℝ) ^ (-(r * m))

/-- `C^r_iso(ℤ_p^d, K)`. -/
def isoCr (r : ℝ) : Submodule K ((Fin g → ℤ_[p]) → K) where
  carrier := {f | Continuous f ∧ IsIsotropicCr p K r f}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

theorem isoCr_aut_invariant (r : ℝ) (A : (Fin g → ℤ_[p]) ≃+ (Fin g → ℤ_[p])) (hA : Continuous A)
    (hA' : Continuous A.symm) (f : (Fin g → ℤ_[p]) → K) (hf : f ∈ isoCr p K r) :
    f ∘ A ∈ isoCr p K r := by
  sorry

theorem isoCr_one_dim (r : ℝ) (hr0 : 0 ≤ r) (hr : r < 1) (φ : ℤ_[p] → K) :
    (fun x : Fin 1 → ℤ_[p] => φ (x 0)) ∈ isoCr p K r ↔ LocallyAnalytic.IsCr p K r φ := by
  sorry

theorem isoCr_mono {r s : ℝ} (hrs : r ≤ s) : isoCr p K (g := g) s ≤ isoCr p K r := by
  sorry

theorem isoCr_mul (r : ℝ) {f f' : (Fin g → ℤ_[p]) → K} (hf : f ∈ isoCr p K r) (hf' : f' ∈ isoCr p K r) :
    f * f' ∈ isoCr p K r := by
  sorry

theorem isoCr_locallyConstant_dense (r : ℝ) (hr : r < 1) (f : (Fin g → ℤ_[p]) → K) (hf : f ∈ isoCr p K r) :
    ∀ ε > 0, ∃ φ : LocallyConstant (Fin g → ℤ_[p]) K, (∀ x, ‖(f - φ) x‖ ≤ ε) ∧
      ∀ m x y, (∀ j, ‖y j‖ ≤ (p : ℝ) ^ (-(m : ℤ))) →
        ‖(f - φ) (x + y) - (f - φ) x‖ ≤ ε * (p : ℝ) ^ (-(r * m)) := by
  sorry

/-- The isotropic wavelet characterisation: `f ∈ C^r_iso` iff `|c_n(f)| p^{r max_j ℓ(n_j)} → 0`. -/
theorem isIsotropicCr_iff_vanDerPut (r : ℝ) (hr0 : 0 ≤ r) (hr : r < 1) (f : C(Fin g → ℤ_[p], K)) :
    IsIsotropicCr p K r f ↔ Tendsto (fun n : Fin g → ℕ =>
      ‖vanDerPutCoeff p K f n‖ * (p : ℝ) ^ (r * (Finset.univ.sup fun j => digitLength p (n j) : ℕ)))
      cofinite (𝓝 0) := by
  sorry

-- AnalyticDistributionTests.isoCr_order_zero
example (f : C(Fin g → ℤ_[p], K)) : (f : (Fin g → ℤ_[p]) → K) ∈ isoCr p K 0 := by
  sorry

/-! ## `L2/block-vector-order`, `L2/block-rectangular-extension` -/

/-- The block weight `Σ_i r_i · max_{j in block i} ℓ(n_j)`, blocks given by `b : Fin D → Fin g`. -/
def blockWeight {D : ℕ} (b : Fin D → Fin g) (r : Fin g → ℝ) (n : Fin D → ℕ) : ℝ :=
  ∑ i, r i * ((Finset.univ.filter fun j => b j = i).sup fun j => digitLength p (n j) : ℕ)

/-- The block vector-order space, through its van der Put characterisation. -/
def blockVectorOrderSpace {D : ℕ} (b : Fin D → Fin g) (r : Fin g → ℝ) :
    Submodule K ((Fin D → ℤ_[p]) → K) where
  carrier := {f | Continuous f ∧ Tendsto (fun n : Fin D → ℕ =>
    ‖vanDerPutCoeff p K f n‖ * (p : ℝ) ^ blockWeight p b r n) cofinite (𝓝 0)}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- The norm `sup_n |c_n(f)| p^{blockWeight(n)}`. -/
def blockNorm {D : ℕ} (b : Fin D → Fin g) (r : Fin g → ℝ) (f : (Fin D → ℤ_[p]) → K) : ℝ :=
  ⨆ n : Fin D → ℕ, ‖vanDerPutCoeff p K f n‖ * (p : ℝ) ^ blockWeight p b r n

theorem mem_blockVectorOrderSpace_iff {D : ℕ} (b : Fin D → Fin g) (r : Fin g → ℝ) (f : (Fin D → ℤ_[p]) → K) :
    f ∈ blockVectorOrderSpace p K b r ↔ Continuous f ∧ Tendsto (fun n : Fin D → ℕ =>
      ‖vanDerPutCoeff p K f n‖ * (p : ℝ) ^ blockWeight p b r n) cofinite (𝓝 0) :=
  Iff.rfl

theorem blockVectorOrderSpace_one_dim_blocks (r : Fin g → ℝ) :
    blockVectorOrderSpace p K (D := g) id r = vectorOrderSpace p K r := by
  sorry

theorem blockVectorOrderSpace_single_block {D : ℕ} (r : ℝ) (hr : r < 1) :
    blockVectorOrderSpace p K (g := 1) (fun _ : Fin D => 0) (fun _ => r) = isoCr p K r := by
  sorry

theorem blockVectorOrderSpace_chart_independent {D : ℕ} (b : Fin D → Fin g) (r : Fin g → ℝ)
    (c : Fin D → ℤ_[p]ˣ) (t : Fin D → ℤ_[p]) (f : (Fin D → ℤ_[p]) → K)
    (hf : f ∈ blockVectorOrderSpace p K b r) :
    (fun x => f (fun j => t j + (c j : ℤ_[p]) * x j)) ∈ blockVectorOrderSpace p K b r := by
  sorry

-- AnalyticDistributionTests.blockVectorOrder_weight
example [Fact (Nat.Prime 2)] : blockWeight 2 (g := 2) ![0, 0, 1] ![1 / 2, 1 / 4] ![4, 1, 32] =
    1 / 2 * 3 + 1 / 4 * 6 := by
  sorry

/-- Loeffler Theorem 2.15 for block quasi-factorizations: a locally constant form with growth
bounded by `(r_1, …, r_g)` on the boxes `a + Π_i p^{m_i} H_i` extends uniquely. -/
theorem block_rectangular_extension {D : ℕ} (b : Fin D → Fin g) (r : Fin g → ℝ)
    (hr0 : ∀ i, 0 ≤ r i) (hr : ∀ i, r i < 1)
    (μ : LocallyConstant (Fin D → ℤ_[p]) K →ₗ[K] K)
    (hμ : ∃ C : ℝ, ∀ (a : Fin D → ℤ_[p]) (m : Fin g → ℕ),
      ‖μ (boxIndicator p K a (fun j => m (b j)))‖ ≤ C * (p : ℝ) ^ (∑ i, r i * m i))
    (hLC : ∀ φ : LocallyConstant (Fin D → ℤ_[p]) K, (φ : (Fin D → ℤ_[p]) → K) ∈ blockVectorOrderSpace p K b r) :
    ∃! μ' : blockVectorOrderSpace p K b r →ₗ[K] K,
      (∃ C : ℝ, ∀ f, ‖μ' f‖ ≤ C * blockNorm p K b r f) ∧
        ∀ φ : LocallyConstant (Fin D → ℤ_[p]) K, μ' ⟨φ, hLC φ⟩ = μ φ := by
  sorry

/-- Loeffler Theorem 2.9 (the single-block case): extension of growth-`r` locally constant forms. -/
theorem isotropic_extension (r : ℝ) (hr0 : 0 ≤ r) (hr : r < 1)
    (μ : LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K)
    (hμ : ∃ C : ℝ, ∀ (a : Fin g → ℤ_[p]) (m : ℕ), ‖μ (boxIndicator p K a (fun _ => m))‖ ≤ C * (p : ℝ) ^ (r * m))
    (hLC : ∀ φ : LocallyConstant (Fin g → ℤ_[p]) K, (φ : (Fin g → ℤ_[p]) → K) ∈ isoCr p K r) :
    ∃! μ' : isoCr p K r →ₗ[K] K,
      (∃ C : ℝ, ∀ f : isoCr p K r, ‖μ' f‖ ≤ C * ⨆ n : Fin g → ℕ,
        ‖vanDerPutCoeff p K (f : (Fin g → ℤ_[p]) → K) n‖ *
        (p : ℝ) ^ (r * (Finset.univ.sup fun j => digitLength p (n j) : ℕ))) ∧
      ∀ φ : LocallyConstant (Fin g → ℤ_[p]) K, μ' ⟨φ, hLC φ⟩ = μ φ := by
  sorry

/-! ## Tensor moment bounds, multidegree uniqueness and chart changes -/

/-- The normalised box monomial `1_{B(a,m)} Π_j ((x_j - a_j)/p^{m_j})^{k_j}`. -/
def boxMonomial (a : Fin g → ℤ_[p]) (m k : Fin g → ℕ) (x : Fin g → ℤ_[p]) : K :=
  if x ∈ padicBox p a m then
    ∏ j, algebraMap ℚ_[p] K (((x j : ℚ_[p]) - a j) / (p : ℚ_[p]) ^ m j) ^ k j else 0

/-- `L2/tensor-higher-degree-vanishing`: an admissible multidegree form vanishing in separate degree
`≤ [r]` vanishes on `LP^N`. -/
theorem tensor_higher_degree_vanishing (r : Fin g → ℝ) (N : Fin g → ℕ) (hN : ∀ j, ⌊r j⌋₊ ≤ N j)
    (lam : LPmultiAll p K N →ₗ[K] K)
    (hmem : ∀ a m k, k ≤ N → boxMonomial p K a m k ∈ LPmultiAll p K N)
    (hbound : ∃ C : ℝ, ∀ (a : Fin g → ℤ_[p]) (m k : Fin g → ℕ) (hk : k ≤ N),
      ‖lam ⟨boxMonomial p K a m k, hmem a m k hk⟩‖ ≤ C * (p : ℝ) ^ (∑ j, r j * m j))
    (hle : LPmultiAll p K (fun j => ⌊r j⌋₊) ≤ LPmultiAll p K N)
    (hlow : ∀ f (hf : f ∈ LPmultiAll p K (fun j => ⌊r j⌋₊)), lam ⟨f, hle hf⟩ = 0) :
    lam = 0 := by
  sorry

/-- `L2/tensor-chart-pullback`, part (i) for affine coordinate maps. -/
theorem vectorOrder_comp_affine (r : Fin g → ℝ) (c b : Fin g → ℤ_[p]) (f : (Fin g → ℤ_[p]) → K)
    (hf : f ∈ vectorOrderSpace p K r) :
    (fun x => f (fun j => b j + c j * x j)) ∈ vectorOrderSpace p K r := by
  sorry

end AnalyticDistributions

end TauCeti

/-
Packet names without a native signature here, with the reason:

`L2/colmez-wavelets`: `TauCeti.LocallyAnalytic.deriv_colmezWavelet` is README-only: the identity
`(d/dx)^j e_{i,k,r} = k!/(k-j)! e_{i,k-j,r-j}` needs the derivative on `ℤ_p`, which Mathlib defines
only through `HasDerivAt` over a normed field, not for the Taylor data of `IsCr`. Test
`LocallyAnalyticTests.colmezWavelet_scaling_needed` needs the `v'_{C^r}` valuation (README).

`L2/cr-wavelet-basis`, `L2/wavelet-norm-bound`, `L2/amplitude-coefficient-bound`: stated with the
Mahler norm `mahlerCrNorm`, equivalent to `v'_{C^r}` by `L2/cr-mahler-criterion`.

`L2/order-on-one-dimensional-groups`: `TauCeti.LocallyAnalytic.DistOrderOn`,
`DistOrderOn_zero_equiv_abstractMeasure` (Mathlib `AbstractMeasure G L L`), `DistOrderOn_restrict`,
`DistOrderOn_translate`, `DistOrderOn_mono`, and the tests
`LocallyAnalyticTests.dirac_one_order_zero_units`, `LocallyAnalyticTests.DistOrderOn_zero_units`,
`LocallyAnalyticTests.chart_scaling_not_isometric`, `LocallyAnalyticTests.digit_chart_rejected`
need the normed space `CrOn κ r` and its dual; the space is typed above as a subspace only.

`L2/admissible-algebraic-distributions`: `TauCeti.LocallyAnalytic.restrictAlg` needs the locally
analytic distributions `D(ℤ_p, L)` of Layer 0, which have no carrier at the pins; tests
`LocallyAnalyticTests.admissible_dirac`, `admissible_haar`, `admissible_restrict_compat`,
`admissible_critical_restriction_zero` use it.

`L2/critical-kernel`: the factorisation `μ = d^{N+1} ν` needs `(d/dx)^{N+1}` as a map
`C^r → C^{r-N-1}`, which is not typed here; only its polynomial input is checked above.

`L2/order-r-operations`, `L2/cr-derivatives` (beyond `cr_deriv_mem`), `L2/coefficient-extension`,
`L2/tensor-function-realization`, `L2/tensor-moment-necessity`, `L2/tensor-wavelet-value-bound`,
`L2/multivariable-van-der-put` (part (i)): need the completed projective tensor product, the
strong dual of `LA`, or coefficient extension of linear forms, none of which has a carrier at the
pins; their statements are in the README.

`L2/separate-degree-polynomials`: `TauCeti.AnalyticDistributions.LPmulti_eq_tensor` (the product
map from the algebraic tensor product) and tests `AnalyticDistributionTests.LPmulti_finrank`,
`LPmulti_one_variable`, `LPmulti_zero_locallyConstant` are README-only.

`L2/isotropic-order-functions`: tests `AnalyticDistributionTests.isoCr_box_value`,
`isoCr_one_dim_compat`, `isoCr_quarter_digit` need the valuation `v_r`; `isoCr_one_dim` above is
the compatibility statement.

`L2/block-vector-order`: `TauCeti.AnalyticDistributions.blockVectorOrderSpace_basis` and tests
`AnalyticDistributionTests.blockVectorOrder_order_zero`, `blockVectorOrder_one_dim_compat`,
`blockVectorOrder_blocks_matter` are README-only.
-/
