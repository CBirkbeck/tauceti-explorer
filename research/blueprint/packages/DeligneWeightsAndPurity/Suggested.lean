/-
Suggested Lean forms for "Deligne weights, purity and the Weil bounds".

This file is not the roadmap and is not exhaustive. README.md in this directory
is definitive. These statements suggest Lean forms so contributors and reviewers
converge on names and signatures. Proofs marked `sorry` are mathematical targets.

Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.

The numerical definitions retain characteristic-root multiplicities, including
Jordan blocks. Geometric signatures require the actual imported scheme, sheaf,
cohomology and analytic interfaces specified in the README. The interface inventories
below name those requirements; their documentary statements are not elaborated
signatures. Missing carriers are never replaced by arbitrary propositions or
fabricated cohomology fields. The Frobenius-module cores use the same conventions
throughout. All existing definitions, API signatures and examples are retained.
-/

import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.FieldTheory.IsAlgClosed.Classification
import Mathlib.Analysis.SpecialFunctions.Log.Base
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.Minpoly.Field
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.Trace
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.Algebra.Group.Subgroup.Ker
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.Data.Multiset.Sort
import Mathlib.RepresentationTheory.Basic
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.LinearAlgebra.BilinearForm.Hom
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.TensorProduct.Map
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.RingTheory.IntegralClosure.IsIntegral.Basic
import Mathlib.Algebra.DirectSum.Module
import Mathlib.Order.SupIndep

open Polynomial

namespace TauCeti.Weights

/-! ## Weil q-numbers (`DeligneWeightsAndPurity:DWP.0/weil-q-number`) -/

section WeilNumber

variable {K : Type*} [Field K] [Algebra ℚ K]

/-- `IsWeilNumber q n α`: `α` is algebraic over `ℚ` and every complex root of its minimal polynomial has absolute value
`q ^ (n / 2)` (Weil II (1.2.1)). Algebraicity is a clause: the minimal polynomial of a transcendental element is `0`. -/
def IsWeilNumber (q : ℝ) (n : ℤ) (α : K) : Prop :=
  1 < q ∧ IsAlgebraic ℚ α ∧ ∀ z ∈ (minpoly ℚ α).aroots ℂ, ‖z‖ = q ^ ((n : ℝ) / 2)

theorem IsWeilNumber.isAlgebraic {q : ℝ} {n : ℤ} {α : K} (h : IsWeilNumber q n α) : IsAlgebraic ℚ α := h.2.1

theorem IsWeilNumber.norm_eq {q : ℝ} {n : ℤ} {α : K} (h : IsWeilNumber q n α) (φ : K →+* ℂ) :
    ‖φ α‖ = q ^ ((n : ℝ) / 2) := by
  sorry

theorem isWeilNumber_iff_forall_embedding [Algebra.IsAlgebraic ℚ K] {q : ℝ} {n : ℤ} {α : K} :
    IsWeilNumber q n α ↔ 1 < q ∧ ∀ φ : K →+* ℂ, ‖φ α‖ = q ^ ((n : ℝ) / 2) := by
  sorry

theorem isWeilNumber_map_iff {K' : Type*} [Field K'] [Algebra ℚ K'] (f : K →+* K') {q : ℝ} {n : ℤ} {α : K} :
    IsWeilNumber q n (f α) ↔ IsWeilNumber q n α := by
  sorry

theorem IsWeilNumber.of_aeval_eq_zero {q : ℝ} {n : ℤ} {α : K} {P : ℚ[X]} (hq : 1 < q) (hP : P ≠ 0) (hα : aeval α P = 0)
    (hroots : ∀ z ∈ P.aroots ℂ, ‖z‖ = q ^ ((n : ℝ) / 2)) : IsWeilNumber q n α := by
  sorry

theorem IsWeilNumber.ne_zero {q : ℝ} {n : ℤ} {α : K} (h : IsWeilNumber q n α) : α ≠ 0 := by
  sorry

theorem IsWeilNumber.weight_unique {q : ℝ} (hq : 1 < q) {n m : ℤ} {α : K} (hn : IsWeilNumber q n α)
    (hm : IsWeilNumber q m α) : n = m := by
  sorry

/-- Test `isWeilNumber_roots_T2_sub_T_add_two`: the roots of `T² − T + 2` are Weil `2`-numbers of weight `1`. -/
example {α : K} (hα : α ^ 2 - α + 2 = 0) : IsWeilNumber 2 1 α := by
  sorry

/-- Test `isWeilNumber_inv_not_isIntegral`: `q⁻¹` has weight `−2` and is not integral over `ℤ` (here `q = 2`). -/
example : IsWeilNumber 2 (-2) (2⁻¹ : ℚ) ∧ ¬ IsIntegral ℤ (2⁻¹ : ℚ) := by
  sorry

/-- Test `isWeilNumber_rootOfUnity`: a root of unity has weight `0` for every `q > 1`. -/
example {q : ℝ} (hq : 1 < q) {ζ : K} {k : ℕ} (hk : 0 < k) (hζ : ζ ^ k = 1) : IsWeilNumber q 0 ζ := by
  sorry

end WeilNumber

/-! ## Products, inverses and base extension (`…/weil-number-arithmetic`, `…/weil-number-base-extension`) -/

section Arithmetic

variable {K : Type*} [Field K] [Algebra ℚ K]

theorem IsWeilNumber.mul {q : ℝ} {n m : ℤ} {α β : K} (hα : IsWeilNumber q n α) (hβ : IsWeilNumber q m β) :
    IsWeilNumber q (n + m) (α * β) := by
  sorry

theorem IsWeilNumber.inv {q : ℝ} {n : ℤ} {α : K} (hα : IsWeilNumber q n α) : IsWeilNumber q (-n) α⁻¹ := by
  sorry

theorem IsWeilNumber.weight_nonneg_of_isIntegral {q : ℝ} (hq : 1 < q) {n : ℤ} {α : K} (hα : IsWeilNumber q n α)
    (hint : IsIntegral ℤ α) : 0 ≤ n := by
  sorry

/-- Weil I (1.7) ⇒ (1.6) style changes of `q`: `α` has weight `n` rel. `q` iff `α ^ r` has weight `n` rel. `q ^ r`. -/
theorem isWeilNumber_pow_iff {q : ℝ} (hq : 1 < q) {n : ℤ} {r : ℕ} (hr : 0 < r) {α : K} :
    IsWeilNumber (q ^ r) n (α ^ r) ↔ IsWeilNumber q n α := by
  sorry

end Arithmetic

/-! ## ι-weights (`DeligneWeightsAndPurity:DWP.0/iota-weight`) -/

section IotaWeight

variable {E : Type*} [Field E]

/-- The ι-weight `2 log_q |ι α|` of `α` relative to `q` (Weil II (1.2.6.1)); `ι` need not be continuous. -/
noncomputable def iotaWeight (ι : E →+* ℂ) (q : ℝ) (α : E) : ℝ :=
  2 * Real.logb q ‖ι α‖

/-- `α` is ι-pure of the real weight `β`. -/
def IsIotaPure (ι : E →+* ℂ) (q β : ℝ) (α : E) : Prop :=
  α ≠ 0 ∧ iotaWeight ι q α = β

theorem iotaWeight_mul (ι : E →+* ℂ) (q : ℝ) {α β : E} (hα : α ≠ 0) (hβ : β ≠ 0) :
    iotaWeight ι q (α * β) = iotaWeight ι q α + iotaWeight ι q β := by
  have hα' : ‖ι α‖ ≠ 0 := norm_ne_zero_iff.mpr ((map_ne_zero ι).mpr hα)
  have hβ' : ‖ι β‖ ≠ 0 := norm_ne_zero_iff.mpr ((map_ne_zero ι).mpr hβ)
  simp only [iotaWeight, map_mul, norm_mul, Real.logb_mul hα' hβ']
  ring

theorem iotaWeight_inv (ι : E →+* ℂ) (q : ℝ) (α : E) : iotaWeight ι q α⁻¹ = -iotaWeight ι q α := by
  simp [iotaWeight, Real.logb_inv]

theorem iotaWeight_pow_base (ι : E →+* ℂ) {q : ℝ} (hq : 1 < q) {r : ℕ} (hr : 0 < r) (α : E) :
    iotaWeight ι (q ^ r) (α ^ r) = iotaWeight ι q α := by
  sorry

theorem iotaWeight_comp {E' : Type*} [Field E'] (ι : E' →+* ℂ) (τ : E →+* E') (q : ℝ) (α : E) :
    iotaWeight (ι.comp τ) q α = iotaWeight ι q (τ α) := rfl

theorem norm_eq_rpow_iotaWeight (ι : E →+* ℂ) {q : ℝ} (hq : 1 < q) {α : E} (hα : α ≠ 0) :
    ‖ι α‖ = q ^ (iotaWeight ι q α / 2) := by
  sorry

theorem IsWeilNumber.isIotaPure [Algebra ℚ E] {q : ℝ} {n : ℤ} {α : E} (h : IsWeilNumber q n α) (ι : E →+* ℂ) :
    IsIotaPure ι q n α := by
  sorry

/-- Test `iotaWeight_rootOfUnity` (degenerate case `ζ = 1`): `1` has ι-weight `0` for every `ι` and `q`. -/
example (ι : E →+* ℂ) (q : ℝ) : iotaWeight ι q 1 = 0 := by
  simp [iotaWeight]

/-- Test `iotaWeight_q` (for `q = 2`): `w_ι(2) = 2` and `w_ι(2⁻¹) = −2` for every `ι`. -/
example [CharZero E] (ι : E →+* ℂ) : iotaWeight ι 2 2 = 2 ∧ iotaWeight ι 2 (2⁻¹) = -2 := by
  sorry

end IotaWeight

/-! ## Weights of an invertible endomorphism (`DeligneWeightsAndPurity:DWP.0/endomorphism-weights`) -/

section Endomorphism

variable {E V : Type*} [Field E] [AddCommGroup V] [Module E V] [FiniteDimensional E V]

/-- The eigenvalues of `F`: the roots of its characteristic polynomial in `AlgebraicClosure E`, with multiplicity. -/
noncomputable def eigenvalues (F : V →ₗ[E] V) : Multiset (AlgebraicClosure E) :=
  (F.charpoly.map (algebraMap E (AlgebraicClosure E))).roots

/-- `(V, F)` is pure of weight `n` relative to `q`: every eigenvalue is a Weil `q`-number of weight `n`. -/
def IsPure [Algebra ℚ E] (q : ℝ) (n : ℤ) (F : V →ₗ[E] V) : Prop :=
  ∀ α ∈ eigenvalues F, IsWeilNumber q n α

/-- `(V, F)` is ι-pure of the real weight `β`. -/
def IsIotaPureEnd (ι : AlgebraicClosure E →+* ℂ) (q β : ℝ) (F : V →ₗ[E] V) : Prop :=
  ∀ α ∈ eigenvalues F, IsIotaPure ι q β α

/-- The ι-weights of `F`, a finite set of reals. -/
noncomputable def iotaWeights (ι : AlgebraicClosure E →+* ℂ) (q : ℝ) (F : V →ₗ[E] V) : Finset ℝ := by
  classical
  exact ((eigenvalues F).map (iotaWeight ι q)).toFinset

theorem card_eigenvalues (F : V →ₗ[E] V) : Multiset.card (eigenvalues F) = Module.finrank E V := by
  sorry

theorem count_eigenvalues [DecidableEq (AlgebraicClosure E)] (F : V →ₗ[E] V) (α : AlgebraicClosure E) :
    (eigenvalues F).count α =
      Module.finrank (AlgebraicClosure E)
        (Module.End.maxGenEigenspace (F.baseChange (AlgebraicClosure E)) α) := by
  sorry

theorem IsPure.isIotaPureEnd [Algebra ℚ E] {q : ℝ} {n : ℤ} {F : V →ₗ[E] V} (h : IsPure q n F)
    (ι : AlgebraicClosure E →+* ℂ) : IsIotaPureEnd ι q n F := by
  sorry

theorem eigenvalues_map_aut (F : V →ₗ[E] V) (τ : AlgebraicClosure E ≃ₐ[E] AlgebraicClosure E) :
    (eigenvalues F).map τ = eigenvalues F := by
  sorry

/-- Test `isPure_jordanBlock`: `[[q, 1], [0, q]]` is pure of weight `2` (here `q = 2`, over `ℚ`). -/
example : IsPure (E := ℚ) 2 2 (Matrix.toLin' !![(2 : ℚ), 1; 0, 2]) := by
  sorry

/-- Test `not_isPure_diag`: `diag(1, 2)` is not pure relative to `2`. -/
example : ∀ n : ℤ, ¬ IsPure (E := ℚ) 2 n (Matrix.toLin' !![(1 : ℚ), 0; 0, 2]) := by
  sorry

end Endomorphism

/-! ## Stability and separation (`…/purity-under-subquotients-and-extensions`, `…/spectra-of-tensor-products-and-duals`,
`…/finite-field-base-extension-of-weights`, `…/disjoint-spectra-no-intertwiner`) -/

section Stability

variable {E V W : Type*} [Field E] [AddCommGroup V] [Module E V] [AddCommGroup W] [Module E W]

/-- Cayley–Hamilton transported along an intertwiner: `u ∘ p(F) = p(G) ∘ u`. -/
theorem comp_aeval_of_comp {F : V →ₗ[E] V} {G : W →ₗ[E] W} {u : V →ₗ[E] W}
    (hu : u ∘ₗ F = G ∘ₗ u) (p : E[X]) : u ∘ₗ aeval F p = aeval G p ∘ₗ u := by
  induction p using Polynomial.induction_on with
  | C a =>
    ext v; simp [Algebra.algebraMap_eq_smul_one]
  | add p q hp hq =>
    simp only [map_add, LinearMap.comp_add, LinearMap.add_comp, hp, hq]
  | monomial n a h =>
    have h' : aeval F (C a * X ^ (n + 1)) = aeval F (C a * X ^ n) * F := by
      simp [pow_succ, mul_assoc]
    have h'' : aeval G (C a * X ^ (n + 1)) = aeval G (C a * X ^ n) * G := by
      simp [pow_succ, mul_assoc]
    rw [h', h'', Module.End.mul_eq_comp, Module.End.mul_eq_comp, ← LinearMap.comp_assoc, h,
      LinearMap.comp_assoc, hu, ← LinearMap.comp_assoc]

variable [FiniteDimensional E V] [FiniteDimensional E W]

/-- Disjoint spectra have no nonzero intertwiner: if the characteristic polynomials are coprime and `u F = G u`,
then `u = 0`. No extension of scalars is needed. -/
theorem eq_zero_of_isCoprime_charpoly {F : V →ₗ[E] V} {G : W →ₗ[E] W}
    (h : IsCoprime F.charpoly G.charpoly) {u : V →ₗ[E] W} (hu : u ∘ₗ F = G ∘ₗ u) : u = 0 := by
  obtain ⟨a, b, hab⟩ := h
  have h1 : aeval G a * aeval G F.charpoly = 1 := by
    have := congrArg (aeval G) hab
    simpa [LinearMap.aeval_self_charpoly] using this
  calc u = (aeval G a * aeval G F.charpoly) ∘ₗ u := by rw [h1]; rfl
    _ = aeval G a ∘ₗ (u ∘ₗ aeval F F.charpoly) := by
        rw [Module.End.mul_eq_comp, LinearMap.comp_assoc, comp_aeval_of_comp hu]
    _ = 0 := by simp [LinearMap.aeval_self_charpoly]

/-- Characteristic polynomial along an invariant subspace (`…/characteristic-polynomial-in-short-exact-sequences`). -/
theorem charpoly_eq_mul_of_mapsTo (F : V →ₗ[E] V) (U : Submodule E V) (hU : ∀ x ∈ U, F x ∈ U) :
    F.charpoly = (F.restrict hU).charpoly * (U.mapQ U F hU).charpoly := by
  sorry

/-- Eigenvalues of `F ^ r` (`…/spectra-of-polynomials-in-an-endomorphism`). -/
theorem eigenvalues_pow (F : V →ₗ[E] V) (r : ℕ) :
    eigenvalues (F ^ r) = (eigenvalues F).map (· ^ r) := by
  sorry

/-- Eigenvalues of a tensor product (`…/spectra-of-tensor-products-and-duals`). -/
theorem eigenvalues_tensor (F : V →ₗ[E] V) (G : W →ₗ[E] W) :
    eigenvalues (TensorProduct.map F G) =
      ((eigenvalues F).product (eigenvalues G)).map fun p => p.1 * p.2 := by
  sorry

/-- The transpose has the eigenvalues of `F` (the contragredient `(F⁻¹)^*` has their inverses). -/
theorem eigenvalues_dualMap (F : V →ₗ[E] V) : eigenvalues F.dualMap = eigenvalues F := by
  sorry

/-- Reciprocal pairing (`…/reciprocal-pairing-of-eigenvalues`): a perfect pairing with `⟨F x, F' y⟩ = c ⟨x, y⟩`. -/
theorem eigenvalues_of_pairing (F : V →ₗ[E] V) (F' : W →ₗ[E] W) (B : V →ₗ[E] W →ₗ[E] E)
    (hB : Function.Bijective B) (c : E) (hc : c ≠ 0) (hF : Function.Bijective F)
    (hFF' : ∀ x y, B (F x) (F' y) = c * B x y) :
    eigenvalues F' = (eigenvalues F).map fun α => algebraMap E (AlgebraicClosure E) c / α := by
  sorry

end Stability

/-! ## Twists (`DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters`) -/

section Twist

variable {E V : Type*} [Field E] [AddCommGroup V] [Module E V]

/-- The twist `V^{(b)} = (V, b F)` of Weil II (1.2.7). -/
def twist (b : Eˣ) (F : V →ₗ[E] V) : V →ₗ[E] V := (b : E) • F

/-- The Tate twist `V(r) = V^{(q^{-r})}`, for the geometric Frobenius convention (`ℚ_ℓ(1)` has eigenvalue `q⁻¹`). -/
def tateTwist (q : Eˣ) (r : ℤ) (F : V →ₗ[E] V) : V →ₗ[E] V := twist (q ^ (-r)) F

theorem twist_twist (b c : Eˣ) (F : V →ₗ[E] V) : twist b (twist c F) = twist (b * c) F := by
  simp [twist, smul_smul]

/-- Test `twist_one`: `twist 1 F = F`. -/
example (F : V →ₗ[E] V) : twist 1 F = F := by
  simp [twist]

/-- Test `twist_one` (Tate form): `V(0) = V`. -/
example (q : Eˣ) (F : V →ₗ[E] V) : tateTwist q 0 F = F := by
  simp [tateTwist, twist]

theorem eigenvalues_twist [FiniteDimensional E V] (b : Eˣ) (F : V →ₗ[E] V) :
    eigenvalues (twist b F) = (eigenvalues F).map (algebraMap E (AlgebraicClosure E) (b : E) * ·) := by
  sorry

theorem IsPure.tateTwist [FiniteDimensional E V] [CharZero E] {q : ℕ} (hq : (q : E) ≠ 0) {n : ℤ}
    {F : V →ₗ[E] V} (h : IsPure (q : ℝ) n F) (r : ℤ) :
    IsPure (q : ℝ) (n - 2 * r) (tateTwist (Units.mk0 (q : E) hq) r F) := by
  sorry

theorem twist_tensor {W : Type*} [AddCommGroup W] [Module E W] (b c : Eˣ) (F : V →ₗ[E] V)
    (G : W →ₗ[E] W) : TensorProduct.map (twist b F) (twist c G) = twist (b * c) (TensorProduct.map F G) := by
  sorry

end Twist

/-! ## Numeric positivity core of Weil I §3. Geometry is listed in the omission ledger. -/

section WeilI3

open PowerSeries

/-- Lemma 3.5 for two factors: when `f` and `g` have nonnegative coefficients and `g(0) = 1`, the coefficients of `f`
are bounded by those of `f * g`. The countable product follows by induction and passage to the limit. -/
theorem coeff_le_coeff_mul_of_nonneg {f g : PowerSeries ℝ} (hf : ∀ n, 0 ≤ coeff n f)
    (hg : ∀ n, 0 ≤ coeff n g) (hg0 : constantCoeff g = 1) (n : ℕ) :
    coeff n f ≤ coeff n (f * g) := by
  rw [PowerSeries.coeff_mul]
  have hmem : ((n, 0) : ℕ × ℕ) ∈ Finset.antidiagonal n := by simp
  have h0 : coeff 0 g = 1 := by simpa using hg0
  calc coeff n f = coeff n f * coeff 0 g := by rw [h0, mul_one]
    _ ≤ ∑ p ∈ Finset.antidiagonal n, coeff p.1 f * coeff p.2 g :=
        Finset.single_le_sum (f := fun p : ℕ × ℕ => coeff p.1 f * coeff p.2 g)
          (fun p _ => mul_nonneg (hf _) (hg _)) hmem

/-- Lemma 3.3, its arithmetic core: `Tr(F_xⁿ, ⊗^{2k} F₀) = Tr(F_xⁿ, F₀)^{2k}` is a nonnegative rational number. -/
theorem even_pow_nonneg (x : ℚ) (k : ℕ) : 0 ≤ x ^ (2 * k) := by
  rw [pow_mul]; exact pow_nonneg (sq_nonneg x) k

/-- Lemma 3.4: the exponential of a power series with nonnegative coefficients and no constant term has nonnegative
coefficients. -/
theorem coeff_exp_nonneg {f : PowerSeries ℚ} (hf : ∀ n, 0 ≤ coeff n f) (hf0 : constantCoeff f = 0) (n : ℕ) :
    0 ≤ coeff n (PowerSeries.mk fun m => ∑ j ∈ Finset.range (m + 1), coeff m (f ^ j) / (j.factorial : ℚ)) := by
  sorry

end WeilI3

/-! ## Numeric Hasse compatibility. The geometric curve/Jacobian supplier is recorded below. -/

section WeilEstimate

/-- The Hasse compatibility (`…/compatibility-with-the-hasse-bound`): if `|α| = √q`, the trace `α + ᾱ` has absolute
value at most `2√q`. -/
theorem norm_add_conj_le {α : ℂ} {q : ℝ} (h : ‖α‖ = Real.sqrt q) :
    ‖α + (starRingEnd ℂ) α‖ ≤ 2 * Real.sqrt q := by
  calc ‖α + (starRingEnd ℂ) α‖ ≤ ‖α‖ + ‖(starRingEnd ℂ) α‖ := norm_add_le _ _
    _ = 2 * Real.sqrt q := by rw [Complex.norm_conj, h]; ring

/-- The point count of `y² = x³ − x` over `𝔽₃` from its characteristic polynomial `X² + 3`: `P(1) = 4`. -/
example : ((X ^ 2 + 3 : ℤ[X]).eval 1) = 4 := by
  norm_num

end WeilEstimate

/-! ## The algebraic power-family input of Weil I §6. -/

section WeilI6

/-- Weil I Lemma 6.7: two finite families of elements of a field whose `n`-th powers agree for every large `n` divisible
by no element of a finite set `K ∌ 1` agree up to order (`powers-of-a-family-determine-the-family`). -/
theorem multiset_eq_of_pow_eq {F : Type*} [Field F] [DecidableEq F] (K : Finset ℕ) (hK : 1 ∉ K)
    (δ ε : Multiset F) (h : ∃ N, ∀ n ≥ N, (∀ k ∈ K, ¬ k ∣ n) → δ.map (· ^ n) = ε.map (· ^ n)) : δ = ε := by
  sorry

end WeilI6


/-! ## Remaining numeric APIs and tests. -/
section NumericAPI
variable {E V : Type*} [Field E] [CharZero E] [Algebra ℚ E]
  [AddCommGroup V] [Module E V] [FiniteDimensional E V]

/-- Compatible algebraically closed coefficient extensions use the same minpoly purity. -/
theorem isPure_baseChange_iff {E' : Type*} [Field E'] [Algebra E E'] [Algebra ℚ E']
    [IsScalarTower ℚ E E'] (F : V →ₗ[E] V) (q : ℝ) (n : ℤ) :
    IsPure q n (F.baseChange E') ↔ IsPure q n F := by sorry

theorem iotaWeights_twist (ι : AlgebraicClosure E →+* ℂ) (q : ℝ) (b : Eˣ)
    (F : V →ₗ[E] V) (hF : Function.Bijective F) :
    iotaWeights ι q (twist b F) =
      (iotaWeights ι q F).image (· + iotaWeight ι q (algebraMap E (AlgebraicClosure E) b)) := by sorry

/-- Exterior roots count subsets of eigenvalue positions, including repeated roots. -/
theorem eigenvalues_exteriorPower (F : V →ₗ[E] V) (k d : ℕ)
    (a : Fin d → AlgebraicClosure E)
    (ha : eigenvalues F = (↑(List.ofFn a) : Multiset (AlgebraicClosure E))) :
    eigenvalues (exteriorPower.map k F) =
      ((Finset.univ : Finset (Fin d)).powersetCard k).val.map
        (fun s => ∏ i ∈ s, a i) := by sorry

theorem IsPure.exteriorPower {q : ℝ} {n : ℤ} {F : V →ₗ[E] V}
    (hF : IsPure q n F) (k : ℕ) :
    IsPure q ((k : ℤ) * n) (exteriorPower.map k F) := by sorry

/-- Test `iotaWeights_singular_twist_rejection`: the total logarithm at zero has no weight shift. -/
example (ι : AlgebraicClosure ℚ →+* ℂ) :
    iotaWeights ι 2 (0 : ℚ →ₗ[ℚ] ℚ) = {0} ∧
    iotaWeights ι 2 ((2 : ℚ) • (0 : ℚ →ₗ[ℚ] ℚ)) ≠ {2} := by sorry

/-- Test `isPure_zero_space`: the zero-dimensional module has no eigenvalues. -/
example (q : ℝ) (n : ℤ) : IsPure q n (LinearMap.id : (Fin 0 → E) →ₗ[E] (Fin 0 → E)) := by sorry

/-- Test `tateTwist_weight`: geometric q⁻¹ on a line has weight −2. -/
example : IsPure 2 (-2) ((2⁻¹ : ℚ) • LinearMap.id : ℚ →ₗ[ℚ] ℚ) := by sorry

/-- Half-weight modulus core: the two square roots differ by a weight-zero sign. -/
example (q : ℝ) (hq : 1 < q) (b : ℂ) (hb : b ^ 2 = (q : ℂ)) :
    IsIotaPure (RingHom.id ℂ) q (-1) b⁻¹ ∧
    IsIotaPure (RingHom.id ℂ) q (-1) (-b)⁻¹ := by sorry

/-- Characteristic roots of the inverse dual, in contrast to the ordinary transpose. -/
theorem eigenvalues_contragredient (F : V ≃ₗ[E] V) :
    eigenvalues F.symm.toLinearMap.dualMap = (eigenvalues F.toLinearMap).map (·⁻¹) := by sorry

/-- Frobenius-stable subquotients require an actual invariant submodule. -/
theorem IsPure.restrict_quotient {q : ℝ} {n : ℤ} (F : V →ₗ[E] V)
    (U : Submodule E V) (hU : ∀ x ∈ U, F x ∈ U) (h : IsPure q n F) :
    IsPure q n (F.restrict hU) ∧ IsPure q n (U.mapQ U F hU) := by sorry

/-- A tensor-power error bound tends to exact purity; no geometric input is hidden. -/
theorem norm_eq_of_half_unit_powers {q a : ℝ} (hq : 1 < q) {w : ℝ}
    (h : ∀ k : ℕ, 0 < k → q ^ (w - 1 / (2 * k)) ≤ a ∧ a ≤ q ^ (w + 1 / (2 * k))) :
    a = q ^ w := by sorry

/-- The square-improvement numeric limit. -/
theorem le_one_of_square_improvement {w : ℝ} (h : ∀ k : ℕ, w ≤ 1 + (2 : ℝ) ^ (-(k : ℤ))) :
    w ≤ 1 := by sorry
end NumericAPI

/-! ## The genuine pullback-group core of the Weil group.

`G` is the supplied arithmetic fundamental group, `A` its constant-field
quotient, `d` its quotient map, and `geo` the geometric-Frobenius powers.
Equip G with the supplied profinite topology and Multiplicative ℤ with its
standard discrete topology; this subgroup inherits the product topology.
The missing scheme/base-point identification is explicitly recorded below.
-/
section WeilGroupCore
variable {G A : Type*} [Group G] [Group A]

def WeilGroup (d : G →* A) (geo : Multiplicative ℤ →* A) : Subgroup (G × Multiplicative ℤ) :=
  (d.comp (MonoidHom.fst G (Multiplicative ℤ))).eqLocus
    (geo.comp (MonoidHom.snd G (Multiplicative ℤ)))

def WeilGroup.degree (d : G →* A) (geo : Multiplicative ℤ →* A) :
    WeilGroup d geo →* Multiplicative ℤ :=
  (MonoidHom.snd G (Multiplicative ℤ)).comp (WeilGroup d geo).subtype

theorem WeilGroup.geometricKernel (d : G →* A) (geo : Multiplicative ℤ →* A)
    (hgeo : Function.Injective geo) (w : WeilGroup d geo) :
    WeilGroup.degree d geo w = 1 ↔ d w.val.1 = 1 := by sorry

theorem WeilGroup.frobenius_degree (d : G →* A) (geo : Multiplicative ℤ →* A)
    (g : G) (e : ℤ) (hg : d g = geo (Multiplicative.ofAdd e)) :
    WeilGroup.degree d geo ⟨(g, Multiplicative.ofAdd e), hg⟩ = Multiplicative.ofAdd e := by sorry

/-- Pull back the degree map along multiplication by a; the new coordinate is relative degree. -/
def WeilGroup.baseExtension (d : G →* A) (geo : Multiplicative ℤ →* A) (a : ℕ) :
    Subgroup (WeilGroup d geo × Multiplicative ℤ) :=
  WeilGroup (WeilGroup.degree d geo)
    { toFun := fun z => z ^ a, map_one' := by simp, map_mul' := by intros; simp [mul_pow] }

/-- Test `weilGroup_point`: the point's Weil group is the graph of the identity of ℤ. -/
example : Function.Bijective (WeilGroup.degree (MonoidHom.id (Multiplicative ℤ))
    (MonoidHom.id (Multiplicative ℤ))) := by sorry

/-- Test `weilGroup_degree_sign`: Weil I uses the negative of geometric degree. -/
example (e : ℤ) : Multiplicative.toAdd ((Multiplicative.ofAdd e)⁻¹) = -e := by sorry

/-- Test `weilGroup_base_extension_two`: original degree is twice relative degree. -/
example (d : G →* A) (geo : Multiplicative ℤ →* A)
    (w : WeilGroup.baseExtension d geo 2) :
    Multiplicative.toAdd (WeilGroup.degree d geo w.val.1) =
      2 * Multiplicative.toAdd w.val.2 := by sorry
end WeilGroupCore

/-! ## Punctual purity as the exact numeric closed-stalk predicate.

`X` must be instantiated by the actual closed-point carrier, `V x` by the
supplied stalk, `q x` by its residue cardinality, and `F x` by geometric
Frobenius. The predicate is polymorphic in this genuine family of modules;
it does not fabricate the missing sheaf category or a global mixed filtration.
-/
section PunctualCore
variable {X E : Type*} [Field E] [Algebra ℚ E]
  {V : X → Type*} [∀ x, AddCommGroup (V x)] [∀ x, Module E (V x)]
  [∀ x, FiniteDimensional E (V x)]

def IsPunctuallyPure (q : X → ℝ) (n : ℤ) (F : ∀ x, V x →ₗ[E] V x) : Prop :=
  ∀ x, IsPure (q x) n (F x)

def IsPunctuallyIotaPure (ι : AlgebraicClosure E →+* ℂ) (q : X → ℝ) (β : ℝ)
    (F : ∀ x, V x →ₗ[E] V x) : Prop := ∀ x, IsIotaPureEnd ι (q x) β (F x)

/-- Actual weights on a point are computed from its genuine characteristic-root set. -/
example : iotaWeights (E := ℚ) (IsAlgClosed.lift : AlgebraicClosure ℚ →ₐ[ℚ] ℂ).toRingHom 2
    (Matrix.toLin' !![(1 : ℚ), 0; 0, 2]) = {0, 2} := by sorry

/-- Test `punctual_tate_line`: one closed stalk with the Tate action. -/
example : IsPunctuallyPure (E := ℚ) (X := Unit) (V := fun _ => ℚ) (fun _ => 2) (-2)
    (fun _ => (2⁻¹ : ℚ) • LinearMap.id) := by sorry

/-- Test `punctual_zero_weights`: every closed stalk is zero. -/
example (q : X → ℝ) (n : ℤ) :
    IsPunctuallyPure (E := E) (V := fun _ => Fin 0 → E) q n (fun _ => LinearMap.id) := by sorry

/-- Test `mixed_two_tate_weights`: the actual root set is {0,2}, never one pure weight. -/
example : ∀ n : ℤ, ¬ IsPunctuallyPure (X := Unit) (V := fun _ => Fin 2 → ℚ)
    (fun _ => 2) n (fun _ => Matrix.toLin' !![(1 : ℚ), 0; 0, 2]) := by sorry

/-- Test `punctual_jordan`: no arithmetic semisimplicity condition is added. -/
example : IsPunctuallyPure (X := Unit) (V := fun _ => Fin 2 → ℚ)
    (fun _ => 2) 0 (fun _ => Matrix.toLin' !![(1 : ℚ), 1; 0, 1]) := by sorry
end PunctualCore

/-! ## The actual additive-valuation core of the stalk Newton polygon.

Its input is the nonzero characteristic-root multiset at one closed stalk.
The supplied q is its residue cardinality in K; v(q) must be finite positive.
The vertices below determine the piecewise-linear polygon. No F-isocrystal
category or specialization theorem is assumed by this numeric construction.
-/
section NewtonCore
variable {K : Type*} [Field K]

noncomputable def stalkNewtonPolygon (v : AddValuation K (WithTop ℚ)) (q : K)
    (s : Multiset K) : List (ℕ × ℚ) := by
  classical
  let slopes := (s.map fun α => (v α).untopD 0 / (v q).untopD 0).sort (· ≤ ·)
  exact (List.range (slopes.length + 1)).map fun k => (k, (slopes.take k).sum)

theorem stalkNewtonPolygon_zero (v : AddValuation K (WithTop ℚ)) (q : K) (s : Multiset K) :
    (stalkNewtonPolygon v q s)[0]? = some (0, 0) := by sorry

theorem stalkNewtonPolygon_endpoint (v : AddValuation K (WithTop ℚ)) (q : K)
    (s : Multiset K) :
    (stalkNewtonPolygon v q s).getLast? =
      some (s.card, (s.map fun α => (v α).untopD 0 / (v q).untopD 0).sum) := by sorry

/-- The kth ordinate is the minimum sum of k normalized slopes. With nonzero
roots and finite valuations, additive multiplicativity identifies these with
valuations of kth exterior-power roots. -/
theorem stalkNewtonPolygon_exterior (v : AddValuation K (WithTop ℚ)) (q : K)
    (s : Multiset K) (k : ℕ) (hk : k ≤ s.card) :
    ∃ y : ℚ, (stalkNewtonPolygon v q s)[k]? = some (k, y) ∧
      (∀ t : Multiset K, t ≤ s → t.card = k →
        y ≤ (t.map fun α => (v α).untopD 0 / (v q).untopD 0).sum) ∧
      (∃ t : Multiset K, t ≤ s ∧ t.card = k ∧
        y = (t.map fun α => (v α).untopD 0 / (v q).untopD 0).sum) := by sorry

theorem stalkNewtonPolygon_baseExtension (v : AddValuation K (WithTop ℚ)) (q : K)
    (s : Multiset K) (n : ℕ) (hn : 0 < n) (hq : q ≠ 0) (hs : ∀ α ∈ s, α ≠ 0) :
    stalkNewtonPolygon v (q ^ n) (s.map (· ^ n)) = stalkNewtonPolygon v q s := by sorry

theorem stalkNewtonPolygon_tateTwist (v : AddValuation K (WithTop ℚ)) (q : K)
    (s : Multiset K) (a : ℤ) (hq : q ≠ 0) (hs : ∀ α ∈ s, α ≠ 0)
    (hv : ∃ b : ℚ, 0 < b ∧ v q = b) :
    stalkNewtonPolygon v q (s.map fun α => α * q ^ (-a)) =
      (stalkNewtonPolygon v q s).map fun p => (p.1, p.2 - (p.1 : ℚ) * (a : ℚ)) := by sorry

/-- Test `newton_two_slopes`: the spectrum of diag(1,2), with v(2)=1. -/
example (v : AddValuation ℚ (WithTop ℚ)) (hv : v 2 = 1) :
    stalkNewtonPolygon v 2 {1, 2} = [(0, 0), (1, 0), (2, 1)] := by sorry

/-- Test `newton_empty`: the polygon of the zero-dimensional stalk. -/
example (v : AddValuation K (WithTop ℚ)) (q : K) :
    stalkNewtonPolygon v q 0 = [(0, 0)] := by sorry

/-- Test `newton_base_extension`: power both q and Frobenius, keeping slopes 0,1. -/
example (v : AddValuation ℚ (WithTop ℚ)) (hv : v 2 = 1) :
    stalkNewtonPolygon v 4 {1, 4} = [(0, 0), (1, 0), (2, 1)] := by sorry
end NewtonCore

/-! ## Counterexamples distinguishing integer and fixed-embedding purity. -/
section NumericCounterexamples
/-- Test `not_isWeilNumber_one_add_sqrt_two`: unequal conjugate moduli. -/
example (q : ℝ) (hq : 1 < q) (n : ℤ) :
    ¬ IsWeilNumber q n ((1 : ℝ) + Real.sqrt 2) := by sorry

/-- Test `iotaWeight_depends_on_iota`: the two embeddings of ℚ(√2). -/
example {E : Type*} [Field E] (s : E) (hs : s ^ 2 = 2)
    (iotaPlus iotaMinus : E →+* ℂ) (hPlus : iotaPlus s = (Real.sqrt 2 : ℂ))
    (hMinus : iotaMinus s = -(Real.sqrt 2 : ℂ)) :
    iotaWeight iotaPlus 2 (1 + s) = 2 * Real.logb 2 (1 + Real.sqrt 2) ∧
    iotaWeight iotaMinus 2 (1 + s) = -2 * Real.logb 2 (1 + Real.sqrt 2) := by sorry

/-- Test `iotaWeight_transcendental`: a supplied transcendental image with this modulus.
This tests the definition; it does not assume a Lindemann–Weierstrass theorem. -/
example {E : Type*} [Field E] [Algebra ℚ E] (t : E) (ht : ¬ IsAlgebraic ℚ t)
    (ι : E →+* ℂ) (hi : ‖ι t‖ = Real.sqrt 2) :
    IsIotaPure ι 2 1 t ∧ ∀ n : ℤ, ¬ IsWeilNumber 2 n t := by sorry

/-- Test `eigenvalues_rotation`: a rational operator need not split over ℚ. -/
example : (Matrix.toLin' !![(0 : ℚ), -2; 1, 0]).charpoly = X ^ 2 + 2 ∧
    IsPure (E := ℚ) 2 1 (Matrix.toLin' !![(0 : ℚ), -2; 1, 0]) := by sorry

/-- Test `halfTwist_depends_on_sqrt`: distinct eigenvalues for the two choices. -/
example (b : ℂ) (hb : b ^ 2 = 2) :
    b⁻¹ ≠ (-b)⁻¹ ∧ IsWeilNumber 2 (-1) b⁻¹ ∧ IsWeilNumber 2 (-1) (-b)⁻¹ := by sorry

/-- Test `twist_nonintegral_weight`: integer Weil purity requires algebraicity. -/
example (b : ℂ) (hb : ¬ IsAlgebraic ℚ b) (hnorm : ‖b‖ = (2 : ℝ) ^ (1 / 4 : ℝ)) :
    IsIotaPure (RingHom.id ℂ) 2 (1 / 2) b ∧ ∀ n : ℤ, ¬ IsWeilNumber 2 n b := by sorry

/-- Test `isWeilNumber_rootOfUnity`, zero non-example. -/
example {q : ℝ} (hq : 1 < q) (n : ℤ) : ¬ IsWeilNumber q n (0 : ℚ) := by sorry
end NumericCounterexamples

/-! ## Stalkwise operations. A mixed subsheaf filtration still requires the genuine category. -/
section PunctualOperations
variable {X E : Type*} [Field E] [Algebra ℚ E]
  {V W : X → Type*}
  [∀ x, AddCommGroup (V x)] [∀ x, Module E (V x)] [∀ x, FiniteDimensional E (V x)]
  [∀ x, AddCommGroup (W x)] [∀ x, Module E (W x)] [∀ x, FiniteDimensional E (W x)]

theorem pure_zero (q : X → ℝ) (n : ℤ) :
    IsPunctuallyPure (E := E) (V := fun _ => Fin 0 → E) q n (fun _ => LinearMap.id) := by sorry

theorem pure_subquotient (q : X → ℝ) (n : ℤ) (F : ∀ x, V x →ₗ[E] V x)
    (U : ∀ x, Submodule E (V x)) (hU : ∀ x v, v ∈ U x → F x v ∈ U x)
    (h : IsPunctuallyPure q n F) :
    IsPunctuallyPure q n (fun x => (F x).restrict (hU x)) ∧
      IsPunctuallyPure q n (fun x => (U x).mapQ (U x) (F x) (hU x)) := by sorry

theorem pure_tensor (q : X → ℝ) (n m : ℤ) (F : ∀ x, V x →ₗ[E] V x)
    (H : ∀ x, W x →ₗ[E] W x) (hF : IsPunctuallyPure q n F) (hH : IsPunctuallyPure q m H) :
    IsPunctuallyPure q (n + m) (fun x => TensorProduct.map (F x) (H x)) := by sorry

theorem pure_tateTwist (q : X → ℕ) (hq : ∀ x, (q x : E) ≠ 0) (n : ℤ)
    (F : ∀ x, V x →ₗ[E] V x) (hF : IsPunctuallyPure (fun x => q x) n F) (r : ℤ) :
    IsPunctuallyPure (fun x => q x) (n - 2 * r)
      (fun x => tateTwist (Units.mk0 (q x : E) (hq x)) r (F x)) := by sorry
end PunctualOperations

/-! ## Reality of local characteristic-polynomial coefficients. -/
section RealityCore
variable {X E : Type*} [Field E] [Algebra ℚ E]
  {V : X → Type*} [∀ x, AddCommGroup (V x)] [∀ x, Module E (V x)]
  [∀ x, FiniteDimensional E (V x)]

def IsTotallyReal (F : ∀ x, V x →ₗ[E] V x) : Prop :=
  ∀ x k, IsAlgebraic ℚ ((F x).charpoly.coeff k) ∧
    ∀ z ∈ (minpoly ℚ ((F x).charpoly.coeff k)).aroots ℂ, z.im = 0

def IsIotaReal (ι : E →+* ℂ) (F : ∀ x, V x →ₗ[E] V x) : Prop :=
  ∀ x k, (ι ((F x).charpoly.coeff k)).im = 0

theorem totallyReal_iotaReal (ι : E →+* ℂ) (F : ∀ x, V x →ₗ[E] V x)
    (h : IsTotallyReal F) : IsIotaReal ι F := by sorry

/-- The real envelope on actual stalks; scalar b has the required positive ι-image. -/
theorem pure_real_envelope (ι : AlgebraicClosure E →+* ℂ) (q : X → ℝ) (β : ℝ)
    (F : ∀ x, V x ≃ₗ[E] V x) (b : X → Eˣ) (hq : ∀ x, 1 < q x)
    (hF : IsPunctuallyIotaPure ι q β (fun x => (F x).toLinearMap))
    (hb : ∀ x, ι (algebraMap E (AlgebraicClosure E) (b x)) = ((q x ^ β : ℝ) : ℂ)) :
    IsIotaReal (ι.comp (algebraMap E (AlgebraicClosure E)))
      (fun x => LinearMap.prodMap (F x).toLinearMap (twist (b x) (F x).symm.toLinearMap.dualMap)) := by sorry

/-- Test `real_nonreal_roots`: a real polynomial may have no real root. -/
example : IsTotallyReal (X := Unit) (E := ℚ) (V := fun _ => Fin 2 → ℚ)
    (fun _ => Matrix.toLin' !![(0 : ℚ), -2; 1, 1]) ∧
    (∀ z : ℂ, z ^ 2 - z + 2 = 0 → z.im ≠ 0) := by sorry

/-- Test `real_zero`: the zero stalk has characteristic polynomial one. -/
example : IsTotallyReal (X := Unit) (E := ℚ) (V := fun _ => Fin 0 → ℚ)
    (fun _ => LinearMap.id) := by sorry

/-- Test `real_envelope_line`: the reciprocal-normalized pair has coefficient 6/5. -/
example : IsIotaReal (X := Unit) (E := ℂ) (V := fun _ => Fin 2 → ℂ) (RingHom.id ℂ)
    (fun _ => Matrix.toLin' !![((3 + 4 * Complex.I) / 5 : ℂ), 0;
      0, (3 - 4 * Complex.I) / 5]) ∧
    (Matrix.toLin' !![((3 + 4 * Complex.I) / 5 : ℂ), 0;
      0, (3 - 4 * Complex.I) / 5]).charpoly = Polynomial.X ^ 2 - C (6 / 5) * Polynomial.X + 1 := by sorry
end RealityCore


/-! ## Further numerical named theorems (DWP.0)
These use existing fields, polynomials and vector spaces, rather than geometric placeholders.
-/
section ComplexEmbeddings
variable {E k : Type} [Field E] [CharZero E] [Field k] [Countable k]

/-- Extend a prescribed embedding of a countable subfield; cardinality alone does
not give compatibility with the prescribed embedding. -/
theorem complex_embedding_extends (j : k →+* E) (σ : k →+* ℂ)
    (hcard : Cardinal.mk E ≤ Cardinal.mk ℂ) :
    ∃ ι : E →+* ℂ, ι.comp j = σ := by sorry

theorem complex_isomorphism_extends [IsAlgClosed E] (j : k →+* E) (σ : k →+* ℂ)
    (hcard : Cardinal.mk E = Cardinal.mk ℂ) :
    ∃ ι : E ≃+* ℂ, ι.toRingHom.comp j = σ := by sorry

theorem isWeilNumber_iff_all_complex_embeddings [Algebra ℚ E]
    (hcard : Cardinal.mk E ≤ Cardinal.mk ℂ) {q : ℝ} (hq : 1 < q) {n : ℤ} {α : E} :
    IsWeilNumber q n α ↔ ∀ ι : E →+* ℂ, ‖ι α‖ = q ^ ((n : ℝ) / 2) := by sorry
end ComplexEmbeddings

section FurtherSpectral
variable {E V : Type*} [Field E] [Algebra ℚ E]
    [AddCommGroup V] [Module E V] [FiniteDimensional E V]

theorem eigenvalues_polynomial (F : V →ₗ[E] V) (p : E[X]) :
    eigenvalues (aeval F p) = (eigenvalues F).map
      (fun α => p.eval₂ (algebraMap E (AlgebraicClosure E)) α) := by sorry

/-- The kernel decomposition specifies both existence and uniqueness of the
summands, with genuine rational-polynomial purity. -/
theorem weight_decomposition (F : V ≃ₗ[E] V) {q : ℝ} (hq : 1 < q)
    (hweights : ∀ α ∈ eigenvalues F.toLinearMap, ∃ n : ℤ, IsWeilNumber q n α) :
    ∃ s : Finset ℤ, ∃ p : ℤ → E[X],
      F.toLinearMap.charpoly = ∏ n ∈ s, p n ∧
      (∀ n ∈ s, (p n).Monic ∧
        ∀ α ∈ (p n).aroots (AlgebraicClosure E), IsWeilNumber q n α) ∧
      ∀ v : V, ∃! pieces : s → V,
        (∀ n : s, aeval F.toLinearMap (p n) (pieces n) = 0) ∧
        (∑ n : s, pieces n) = v := by sorry

/-- Newton identities express all positive-power traces by the root multiset. -/
theorem trace_pow_eq_sum_eigenvalues (F : V →ₗ[E] V) (n : ℕ) :
    algebraMap E (AlgebraicClosure E) (LinearMap.trace E V (F ^ n)) =
      ((eigenvalues F).map fun α => α ^ n).sum := by sorry
end FurtherSpectral


section ArithmeticComplements
variable {K : Type*} [Field K] [Algebra ℚ K]

theorem IsWeilNumber.rootOfUnity_of_integral {q : ℝ} (hq : 1 < q) {α : K}
    (hα : IsWeilNumber q 0 α) (hint : IsIntegral ℤ α) :
    ∃ k : ℕ, 0 < k ∧ α ^ k = 1 := by sorry

theorem rational_pow_weil (q : ℚ) (hq : 1 < q) (k : ℤ) :
    IsWeilNumber (q : ℝ) (2 * k) (q ^ k) := by sorry

theorem IsWeilNumber.conjugate {q : ℚ} (hq : 1 < q) {n : ℤ} {α : K}
    (hα : IsWeilNumber (q : ℝ) n α) (σ : K →+* ℂ) :
    star (σ α) = (q : ℂ) ^ n / σ α := by sorry
end ArithmeticComplements

section CharacteristicSeries
variable {E V : Type*} [Field E] [CharZero E]
    [AddCommGroup V] [Module E V] [FiniteDimensional E V]

/-- The logarithmic derivative of det(1−tF) has coefficients −Tr(F^(n+1)). -/
theorem characteristic_series_log_derivative (F : V →ₗ[E] V) (n : ℕ) :
    let P : PowerSeries E := F.charpoly.reverse
    PowerSeries.coeff n (PowerSeries.derivative E P * P⁻¹) =
      -LinearMap.trace E V (F ^ (n + 1)) := by sorry
end CharacteristicSeries

end TauCeti.Weights


/-! ## Signature coverage ledger

This ledger distinguishes elaborated signatures from names awaiting real owner
interfaces (PROTOCOL section 13). An omitted statement is not replaced by a
proposition-valued field. The corrected packet specifies it mathematically; the reader requires the revision recorded by this review.

The API declarations for WeilGroup are its actual group-theoretic pullback
core, not the arithmetic fundamental group or its topology. The punctual and
real predicates accept genuine closed-stalk data; identifying those data with
constructible sheaves needs SF.2/EDC.0. The Newton core accepts the actual
characteristic-root multiset and a valuation with positive finite value on q.
These are honest abstractions over existing mathematics, not geometric objects.
The exterior-power signatures use the actual Mathlib exterior construction.
The numeric iotaWeights_twist signature requires invertibility; the total
logarithm at zero does not satisfy the weight-translation formula.
The mixed_two_tate_weights example checks the point spectrum {0,2}; its global
mixed-sheaf assertion additionally needs the subsheaf-filtration interface.

The following API/test names have no elaborated signatures at this pin.
Their owner interfaces, full statements and non-examples are kept explicit.
-/
/-
DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field — The q-Frobenius endomorphism of a variety over 𝔽_q
Owner inputs: DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights, SchemeAndStackFoundations:SF.0

OMITTED API TauCeti.Weights.frobeniusEndo
  The supplied scheme q-Frobenius, viewed as an endomorphism over 𝔽_q.
OMITTED API TauCeti.Weights.frobeniusEndo_comp
  The q-Frobenius commutes with every morphism over 𝔽_q.
OMITTED API TauCeti.Weights.fixedPoints_frobeniusEndo_pow
  The fixed points of the mth Frobenius power on geometric points are the points over 𝔽_(q^m), for m≥1.
OMITTED API TauCeti.Weights.frobeniusEndo_baseChange
  Relative Frobenius after degree-m constant extension is the scalar extension of the mth original power.
OMITTED API TauCeti.Weights.AbelianVariety.frobenius
  The group endomorphism on an abelian variety induced by its supplied scheme Frobenius.
OMITTED EXAMPLE TauCeti.Weights.frobeniusEndo_projectiveLine_fixed
  The fixed points of π on ℙ¹(𝔽̄_q) are the q + 1 points of ℙ¹(𝔽_q).
OMITTED EXAMPLE TauCeti.Weights.frobeniusEndo_spec_field
  On Spec 𝔽_q, π is the identity.
OMITTED EXAMPLE TauCeti.Weights.frobeniusEndo_not_absolute
  For q = p², π_V is the square of the absolute Frobenius, not the absolute Frobenius itself; its fixed points on 𝔸¹(𝔽̄_q) are 𝔽_{p²}, not 𝔽_p.
OMITTED EXAMPLE TauCeti.Weights.deg_frobenius_elliptic
  For an elliptic curve over 𝔽_q, deg π_E = q.
-/

/-
DeligneWeightsAndPurity:DWP.5/weil-sheaf — Weil sheaves and étale descent
Owner inputs: DeligneWeightsAndPurity:DWP.5/weil-group, SchemeAndStackFoundations:SF.2, EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change, ArithmeticGaloisRepresentations:R01.6

OMITTED API TauCeti.Weights.WeilSheaf
  A geometric constructible sheaf with Weil descent data.
OMITTED API TauCeti.Weights.WeilSheaf.frobenius
  The invertible action on every closed-point stalk, up to conjugacy.
OMITTED API TauCeti.Weights.WeilSheaf.ofEtale
  Restrict an étale sheaf to Weil descent.
OMITTED API TauCeti.Weights.WeilSheaf.etaleDescent_iff
  For a lisse Weil sheaf, étale descent means extension to a continuous arithmetic fundamental-group representation. Constructible non-lisse sheaves instead use sheaf descent data; a single representation does not describe them.
OMITTED API TauCeti.Weights.WeilSheaf.pullback
  Pull back descent along an 𝔽_q-morphism, preserving identity and composition.
OMITTED EXAMPLE TauCeti.Weights.weilSheaf_nonunit
  On Spec 𝔽_q the scalar ℓ defines a Weil line which has no étale descent.
OMITTED EXAMPLE TauCeti.Weights.weilSheaf_constant
  The constant line with Frobenius 1 descends étale.
OMITTED EXAMPLE TauCeti.Weights.weilSheaf_tate
  For ℓ≠p the Tate line has geometric scalar q⁻¹ and agrees with EDC.0, hence descends étale.
-/

/-
DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness — Punctual purity and finite mixed filtrations
Owner inputs: DeligneWeightsAndPurity:DWP.5/weil-sheaf, DeligneWeightsAndPurity:DWP.0/endomorphism-weights, DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions, DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals, EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change

OMITTED API TauCeti.Weights.IsMixed
  Existence of a finite integer-pure subsheaf filtration.
OMITTED API TauCeti.Weights.IsIotaMixed
  Existence of a finite real-ι-pure subsheaf filtration.
OMITTED API TauCeti.Weights.punctualWeights
  The finite set of actual weights of nonzero graded pieces.
OMITTED API TauCeti.Weights.mixed_extension
  An extension of mixed sheaves is mixed; actual weights form the union.
OMITTED API TauCeti.Weights.pure_pullback_finitePushforward
  Pullback and finite direct image preserve purity, with residue-degree powers of Frobenius included.
OMITTED API TauCeti.Weights.mixed_iff_finite_filtration
  Mixedness is precisely a finite subsheaf filtration with pure quotients, with no strictness or canonical splitting built into the predicate.
-/

/-
DeligneWeightsAndPurity:DWP.5/determinantal-weights — Determinantal weights of irreducible constituents
Owner inputs: DeligneWeightsAndPurity:DWP.5/rank-one-normalization, DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness, DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals, DeligneWeightsAndPurity:DWP.0/eigenvalues-of-exterior-powers, DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights

OMITTED API TauCeti.Weights.determinantalWeight
  For an irreducible of rank r>0, the determinant weight divided by r.
OMITTED API TauCeti.Weights.determinantalWeights
  The multiset of determinantal weights of irreducible constituents.
OMITTED API TauCeti.Weights.determinantalWeight_det
  The determinant is pure of weight r times the determinantal weight.
OMITTED API TauCeti.Weights.determinantalWeights_exact
  The multiset for an extension is the sum of those of its subobject and quotient.
OMITTED API TauCeti.Weights.determinantalWeights_twist
  A rank-one twist of weight c adds c to every determinantal weight.
OMITTED API TauCeti.Weights.determinantalWeight_pure
  For an irreducible punctually pure sheaf of weight β, its determinantal weight is β.
OMITTED EXAMPLE TauCeti.Weights.detWeight_tate
  The Tate line ℚ̄_ℓ(r) has determinantal weight −2r.
OMITTED EXAMPLE TauCeti.Weights.detWeight_zero
  The zero sheaf has empty determinantal-weight multiset.
OMITTED EXAMPLE TauCeti.Weights.detWeight_rank_divisor
  A rank-two pure system of weight 1 has determinant weight 2 and determinantal weight 1, not 2.
-/

/-
DeligneWeightsAndPurity:DWP.5/compact-weil-form — The compact form of Weil monodromy
Owner inputs: DeligneWeightsAndPurity:DWP.5/geometric-monodromy-and-central-degree, DeligneWeightsAndPurity:DWP.5/generalized-majoration, DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness, tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups, tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups

OMITTED API TauCeti.Weights.compactWeilForm
  The inverse image of the chosen maximal compact subgroup of the quotient by the central scalars.
OMITTED API TauCeti.Weights.compactWeilForm.geometricKernel
  The compact degree-zero subgroup and its normalized Haar probability.
OMITTED API TauCeti.Weights.compactWeilForm.degree
  The geometric-degree map to ℤ with central weight action retained.
OMITTED API TauCeti.Weights.compactWeilForm.frobeniusClass
  The compact conjugacy class of the semisimple Frobenius part in its degree fibre.
OMITTED API TauCeti.Weights.compactWeilForm.conjugacy_iff
  Two elements of G_R conjugate in G_ℂ are conjugate in G_R.
OMITTED API TauCeti.Weights.compactWeilForm.representationEquivalence
  Algebraic representations of G correspond to continuous finite-dimensional representations of G_R, respecting tensor and dual operations.
OMITTED EXAMPLE TauCeti.Weights.compact_constant_weight
  For a constant pure line of weight β, degree n acts by q^(nβ/2) times a unit complex scalar; the degree-zero kernel is trivial.
OMITTED EXAMPLE TauCeti.Weights.compact_elliptic
  For full SL₂ geometric monodromy of H¹ of a nonisotrivial elliptic family, G_R is SU(2)×ℤ and (g,n) acts by q^(n/2)g.
OMITTED EXAMPLE TauCeti.Weights.compact_jordan_part
  A unipotent Jordan arithmetic Frobenius of weight zero contributes its semisimple class 1; its unipotent part is not declared unitary.
OMITTED API TauCeti.Weights.compactWeilForm.normExponent_weight
  With ω₁=q^(−deg) as in (2.1.1), an irreducible norm exponent Re(r) gives sheaf weight −2Re(r). In particular ω₁ is the Tate line of weight −2.
OMITTED EXAMPLE TauCeti.Weights.compact_normCharacter_sign
  The norm character ω₁=q^(−deg) has Re(ω₁)=1 but the associated Tate line has weight −2, excluding the printed +2Re formula.
-/

/-!
The remaining geometric/representation declarations have the following exact
specifications. Their formal signatures await the listed real suppliers.
A numerical helper already in the file does not count as the full geometric
theorem. In particular, norm_eq_of_half_unit_powers and
le_one_of_square_improvement are the numerical limits, not the pencil proofs.
The multiset and power-series lemmas are existing-type cores of DWP.2–DWP.3.
-/
/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves
The Weil I curve coefficient interface
On an open U₀⊂ℙ¹ over 𝔽_q, specialize DWP.5’s common punctual purity predicate to a lisse ℚ_ℓ-sheaf ℱ₀: integer weight β means each closed-point stalk is pure β relative to q^(deg x). The local determinant and Euler product are the WC.1/SF.2 coefficient L-function, with local variable t^(deg x). Changing geometric stalk conjugates Frobenius and leaves its determinant unchanged; tensor weights add, dual weights negate, and the Tate line ℚ_ℓ(r) has weight −2r. This comparison fixes the inputs of Weil I §3 without defining a second purity predicate or L-function.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness, DeligneWeightsAndPurity:DWP.0/endomorphism-weights, DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters, WeilConjectures:WC.1, SchemeAndStackFoundations:SF.2
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense
Open subgroups of Sp(V)(ℚ_ℓ) are Zariski-dense
Let V be a finite-dimensional ℚ_ℓ-vector space with a nondegenerate alternating form ψ, and H ⊆ Sp(V, ψ)(ℚ_ℓ) a subgroup open for the ℓ-adic topology. Then H is Zariski-dense in the algebraic group Sp(V, ψ). Consequently, for every algebraic representation W of Sp(V, ψ), such as ⊗^m V, the H-invariants and H-coinvariants of W are the Sp(V, ψ)-invariants and Sp(V, ψ)-coinvariants.
Direct mathematical inputs: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components, tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.2/symplectic-coinvariants-of-even-tensor-powers
Coinvariants of ⊗^{2k}V under the symplectic group, over ℚ_ℓ
Let V be a ℚ_ℓ-vector space of dimension 2r ≥ 2 with a nondegenerate alternating form ψ : V ⊗ V → L, where L is one-dimensional (L = ℚ_ℓ(−β)). For a partition P of {1, …, 2k} into pairs {a_i, b_i} with a_i < b_i, let ψ_P : ⊗^{2k}V → L^{⊗k}, v₁ ⊗ … ⊗ v_{2k} ↦ ∏_i ψ(v_{a_i}, v_{b_i}). The ψ_P span the Sp(V, ψ)-invariant maps ⊗^{2k}V → L^{⊗k}. For a suitable subset 𝒫′ of the pair partitions, depending on dim V and k, the ψ_P with P ∈ 𝒫′ induce an isomorphism (⊗^{2k}V)_{Sp(V, ψ)} ≅ (L^{⊗k})^N with N = #𝒫′ ≥ 1. The isomorphism is compatible with every automorphism of V that multiplies ψ by a scalar, acting on L by that scalar.
Direct mathematical inputs: tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-9-schur-weyl-duality-for-the-orthogonal-and-symplectic-groups-the-brauer-algebra
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.2/compact-cohomology-of-even-tensor-powers
Compact cohomology and the L-function of ⊗^{2k}F
Under the hypotheses of Theorem 3.2, with U affine and F₀ ≠ 0: H⁰_c(U, ⊗^{2k}F) = 0, H²_c(U, ⊗^{2k}F) ≅ ℚ_ℓ(−kβ − 1)^N with N ≥ 1 as Frobenius modules, and Z(U₀, ⊗^{2k}F₀, t) = det(1 − F^*t, H¹_c(U, ⊗^{2k}F)) / (1 − q^{kβ+1}t)^N. So Z(U₀, ⊗^{2k}F₀, t) is the Taylor expansion of a rational function whose only poles are at t = q^{−kβ−1}.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves, DeligneWeightsAndPurity:DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense, DeligneWeightsAndPurity:DWP.2/symplectic-coinvariants-of-even-tensor-powers, SchemeAndStackFoundations:SF.2, EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.2/positivity-of-even-tensor-power-traces
Lemma 3.3: nonnegative rational log-derivatives of even tensor powers
Under hypothesis (iii) of Theorem 3.2, for every even integer 2k and every x ∈ |U₀|, the power series t (d/dt) log det(1 − F_x t, ⊗^{2k}F₀)⁻¹ has nonnegative rational coefficients.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.0/characteristic-power-series-and-traces, mathlib:LinearMap.trace_tensorProduct'
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.2/positive-local-factors
Lemma 3.4: local factors of even tensor powers have nonnegative coefficients
Under hypothesis (iii) of Theorem 3.2, for every even 2k and x ∈ |U₀|, the local factor det(1 − F_x t^{deg x}, ⊗^{2k}F₀)⁻¹ ∈ ℚ[[t]] has constant term 1 and nonnegative coefficients.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.2/positivity-of-even-tensor-power-traces
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.2/radius-of-convergence-of-positive-products
Lemma 3.5: factors of a product of positive power series converge at least as far
Let (f_i) be a countable family of power series f_i = Σ_n a_{i,n} t^n with constant term 1 and nonnegative real coefficients, such that ord(f_i − 1) → ∞, and let f = ∏_i f_i = Σ_n a_n t^n. Then a_{i,n} ≤ a_n for all i and n. Hence the radius of absolute convergence of each f_i is at least that of f.
Direct mathematical inputs:
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.2/poles-of-positive-products
Lemma 3.6: poles of the factors lie no closer than the poles of the product
Under the hypotheses of Lemma 3.5, if f and all the f_i are Taylor expansions at 0 of meromorphic functions on ℂ, then inf{|z| : f_i has a pole at z} ≥ inf{|z| : f has a pole at z}.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.2/radius-of-convergence-of-positive-products
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.2/fundamental-estimate-theorem-3-2
Weil I, Theorem 3.2: the fundamental estimate
Let U₀ ⊆ ℙ¹ over 𝔽_q be open, F₀ a lisse ℚ_ℓ-sheaf on U₀, and β ∈ ℤ. Assume (i) F₀ carries a nondegenerate alternating pairing ψ : F₀ ⊗ F₀ → ℚ_ℓ(−β); (ii) the image of the geometric fundamental group π₁(U, ū) in GL(F_ū) is an open subgroup of Sp(F_ū, ψ); (iii) for every x ∈ |U₀|, det(1 − F_x t, F₀) has rational coefficients. Then F₀ has weight β: every eigenvalue of every F_x is an algebraic number all of whose complex conjugates have absolute value q_x^{β/2}.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves, DeligneWeightsAndPurity:DWP.2/compact-cohomology-of-even-tensor-powers, DeligneWeightsAndPurity:DWP.2/positive-local-factors, DeligneWeightsAndPurity:DWP.2/poles-of-positive-products, DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues, DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals, DeligneWeightsAndPurity:DWP.0/weil-q-number
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.2/coarse-bound-on-compact-cohomology
Corollary 3.8: the coarse bound on H¹_c(U, F)
Under the hypotheses of Theorem 3.2, with U affine, every eigenvalue α of F^* on H¹_c(U, F) is an algebraic number, and every complex conjugate of α satisfies |α| ≤ q^{β/2 + 1}.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.2/fundamental-estimate-theorem-3-2, DeligneWeightsAndPurity:DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves, DeligneWeightsAndPurity:DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense, SchemeAndStackFoundations:SF.2, EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.2/coarse-bound-on-cohomology-of-the-projective-line
Corollary 3.9: the two-sided coarse bound on H¹(ℙ¹, j_*F)
Let j : U → ℙ¹ be the inclusion. Under the hypotheses of Theorem 3.2, every eigenvalue α of F^* on H¹(ℙ¹, j_*F) is an algebraic number, and every complex conjugate of α satisfies q^{β/2} ≤ |α| ≤ q^{β/2 + 1}; in Deligne's notation q^{(β+1)/2 − 1/2} ≤ |α| ≤ q^{(β+1)/2 + 1/2}.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.2/coarse-bound-on-compact-cohomology, DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues, EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field
The q-Frobenius endomorphism of a variety over 𝔽_q
Import scheme Frobenius from SF.0 and instantiate its q-power iterate over 𝔽_q. Let V be a variety (a separated scheme of finite type) over 𝔽_q. The q-Frobenius π_V : V → V is the identity on the underlying space and f ↦ f^q on the structure sheaf. It is an 𝔽_q-morphism. It commutes with every 𝔽_q-morphism φ : W → V, that is φ ∘ π_W = π_V ∘ φ, and on V(𝔽̄_q) it acts by raising coordinates to the q-th power, so V(𝔽_{q^m}) is the fixed-point set of π_V^m. Its differential is 0. For an abelian variety A over 𝔽_q, π_A fixes 0 and is an endomorphism of A, of degree q^g. After extending scalars to 𝔽_{q^m}, the Frobenius is π_A^m.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights, SchemeAndStackFoundations:SF.0
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.1/rosati-of-the-frobenius-endomorphism
Milne II.1.2: π†π = q
Let A be an abelian variety over 𝔽_q, λ a polarization of A defined over 𝔽_q, and † the Rosati involution of λ. Then π_A^† ∘ π_A = q in End⁰(A), that is π_A^∨ ∘ λ ∘ π_A = q·λ.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field, AbelianSchemesAndArithmeticModuli:A2/rosati-involution, AbelianSchemesAndArithmeticModuli:A2
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.1/absolute-values-from-the-rosati-involution
Milne II.1.3: α†α = r forces |a|² = r for the roots of P_α
Let A be an abelian variety over a field k with a polarization and Rosati involution †, and α ∈ End⁰(A) with α†α = r ∈ ℤ_{>0}. Then ℚ[α] is a product of fields, stable under †, and † acts on each real factor of ℚ[α] ⊗ ℝ as the identity and on each complex factor as complex conjugation. Every root a of P_α in ℂ satisfies |a|² = r.
Direct mathematical inputs: AbelianSchemesAndArithmeticModuli:A6/rosati-positivity, AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield, AbelianSchemesAndArithmeticModuli:A2/rosati-involution, AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties
The Weil estimate for abelian varieties over 𝔽_q
Let A be an abelian variety of dimension g over 𝔽_q. Every root of the characteristic polynomial P_{π_A} ∈ ℤ[X] is a Weil q-number of weight 1: all its complex conjugates have absolute value q^{1/2}. Equivalently, for every ℓ ∤ q, the geometric Frobenius on H¹(A_{𝔽̄_q}, ℚ_ℓ) is pure of weight 1, and the geometric Frobenius on V_ℓA is pure of weight −1. The same holds for π_A^m relative to q^m.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.1/rosati-of-the-frobenius-endomorphism, DeligneWeightsAndPurity:DWP.1/absolute-values-from-the-rosati-involution, AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module, DeligneWeightsAndPurity:DWP.0/weil-q-number, DeligneWeightsAndPurity:DWP.0/weil-number-base-extension, ArithmeticGaloisRepresentations:R01.6
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.1/point-counts-of-abelian-varieties
Point counts of abelian varieties over 𝔽_{q^m}, and their bounds
Let A be an abelian variety of dimension g over 𝔽_q with P_{π_A}(X) = ∏_{i=1}^{2g}(X − a_i). Then for all m ≥ 1, N_m = #A(𝔽_{q^m}) = deg(1 − π^m) = P_{π^m}(1) = ∏_i(1 − a_i^m), and |N_m − q^{mg}| ≤ 2g·q^{m(g−1/2)} + (2^{2g} − 2g − 1)·q^{m(g−1)}. The zeta function is Z(A, t) = ∏_{r=0}^{2g} P_r(t)^{(−1)^{r+1}}, where P_r(t) = ∏(1 − a_{i_1}⋯a_{i_r}t) over 1 ≤ i_1 < … < i_r ≤ 2g, the characteristic polynomial of π on ∧^r T_ℓA.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties, DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field, AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism, AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism, DeligneWeightsAndPurity:DWP.0/spectra-of-polynomials-in-an-endomorphism, DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals, DeligneWeightsAndPurity:DWP.0/eigenvalues-of-exterior-powers
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.1/weil-estimate-for-curves
The Weil estimate for curves, through the Jacobian
Let C be a smooth projective geometrically connected curve of genus g over 𝔽_q, J its Jacobian, and P_{π_J}(X) = ∏(X − a_i). Then #C(𝔽_{q^m}) = 1 − Σ_i a_i^m + q^m for all m ≥ 1, the a_i are Weil q-numbers of weight 1, |#C(𝔽_{q^m}) − q^m − 1| ≤ 2g·q^{m/2}, and Z(C, t) = P_{π_J}^{rev}(t)/((1 − t)(1 − qt)) with P^{rev}(t) = ∏(1 − a_i t).
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties, SchemeAndStackFoundations:SF.2, tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property, DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves
The weights of H⁰, H¹ and H² of a curve over 𝔽_q
Let C be a smooth projective geometrically connected curve of genus g over 𝔽_q, and ℓ ∤ q. Then H⁰(C_{𝔽̄_q}, ℚ_ℓ) = ℚ_ℓ is pure of weight 0, H²(C_{𝔽̄_q}, ℚ_ℓ) ≅ ℚ_ℓ(−1) is pure of weight 2, and H¹(C_{𝔽̄_q}, ℚ_ℓ) ≅ H¹(J_{𝔽̄_q}, ℚ_ℓ) ≅ (V_ℓJ)^∨ is pure of weight 1, with the geometric Frobenius having characteristic polynomial P_{π_J}. The same holds after any finite extension of 𝔽_q.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties, DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters, ArithmeticGaloisRepresentations:R01.6, tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property, DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights, EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.1/compatibility-with-the-hasse-bound
Compatibility with the Hasse bound for elliptic curves
For an elliptic curve E over 𝔽_q with a = q + 1 − #E(𝔽_q) (the trace of Frobenius of Tau Ceti EllipticCurves Layer 3), P_{π_E}(X) = X² − aX + q, and the Weil estimate for abelian varieties (g = 1) gives |a| ≤ 2√q. This is the Hasse bound that Tau Ceti EllipticCurves Layer 3 proves independently. The two agree, and this node proves only the identification of the characteristic polynomials.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties, DeligneWeightsAndPurity:DWP.1/point-counts-of-abelian-varieties, tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.1/the-frobenius-and-points-over-extensions
Compatibility of the Weil estimate with finite base extension
For A (resp. C) over 𝔽_q and m ≥ 1, the Frobenius of A ⊗ 𝔽_{q^m} over 𝔽_{q^m} is π_A^m, P_{π^m}(X) = ∏(X − a_i^m), and the Weil estimate over 𝔽_{q^m} (weight 1 relative to q^m) is equivalent to that over 𝔽_q (weight 1 relative to q). The same holds for the weights of H⁰, H¹ and H² of curves.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field, DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights, DeligneWeightsAndPurity:DWP.0/weil-number-base-extension
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system
Arithmetic descent of the pencil radical quotient
For a finite-field Lefschetz pencil on a geometrically connected smooth projective even-dimensional variety, the LPV.4 vanishing system ℰ and its radical quotient ℱ=ℰ/(ℰ∩ℰ⊥) descend to lisse ℚ_ℓ-sheaves ℰ₀ and ℱ₀ over the smooth-parameter open U₀. The supplied perfect alternating pairing on ℱ₀ has values in ℚ_ℓ(−d), with d odd the fixed fibre dimension, so a local geometric Frobenius of degree e acts by a symplectic similitude with multiplier q^(de). The zero quotient is permitted. LPV.4 owns the construction and perfection of the quotient; this node supplies its finite-field descent and arithmetic normalization.
Direct mathematical inputs: LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils, LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing, EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance, InverseGaloisAndArithmeticFundamentalGroups:IG.1
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.3/geometrically-constant-lisse-sheaves
Weil I Lemma 6.4: geometrically constant lisse sheaves come from 𝔽_q
Let U₀ be geometrically connected over 𝔽_q and let 𝒢₀ be a lisse ℚ_ℓ-sheaf on U₀ whose pullback 𝒢 to U is constant. Then there are ℓ-adic units α_i ∈ ℚ̄_ℓ with det(1 − F_x t^{deg x}, 𝒢₀) = ∏_i(1 − α_i^{deg x} t^{deg x}) for every x ∈ |U₀|. In fact 𝒢₀ is the pullback of its direct image to Spec 𝔽_q, a representation G₀ of Gal(𝔽̄_q/𝔽_q), and ∏(1 − α_i t) = det(1 − F t, G₀).
Direct mathematical inputs: LefschetzPencilsAndVanishingCycles:LPV.4, DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights, InverseGaloisAndArithmeticFundamentalGroups:IG.1
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.3/zeta-of-the-fibres-and-the-pencil-factorization
The zeta functions of the fibres, split into a constant part and the ℱ₀ part
In the setting of radical-quotient-of-the-vanishing-system, there are ℓ-adic units α_1, …, α_N and β_1, …, β_M in ℚ̄_ℓ, with α_i ≠ β_j for all i and j, such that for every x ∈ |U₀|, Z(X_x, t) = [∏_i(1 − α_i^{deg x} t) / ∏_j(1 − β_j^{deg x} t)] · det(1 − F_x t, ℱ₀)^{(−1)^{n+1}}, where t is the variable for the residue field k(x). In particular the right-hand side lies in ℚ(t).
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system, DeligneWeightsAndPurity:DWP.3/geometrically-constant-lisse-sheaves, DeligneWeightsAndPurity:DWP.0/characteristic-polynomial-in-short-exact-sequences, WeilConjectures:WC.1, SchemeAndStackFoundations:SF.2
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.3/powers-of-a-family-determine-the-family
Weil I Lemma 6.7: a family is determined by its n-th powers for enough n
Let K be a finite set of nonnegative integers different from 1, and (δ_j)_{j ≤ Q}, (ε_j)_{j ≤ Q} two families of elements of a field. If, for all sufficiently large n divisible by no element of K, the families (δ_j^n) and (ε_j^n) agree up to order, then (δ_j) and (ε_j) agree up to order.
Direct mathematical inputs:
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.3/open-image-in-the-symplectic-similitude-group
Weil I Lemma 6.11: the arithmetic monodromy of ℱ₀ is open in H
Let d be the fixed odd pencil fibre dimension and ℱ₀≠0 its supplied radical quotient with pairing into ℚ_ℓ(−d). Use the arithmetic coordinate a∈ℤ̂, where geometric Frobenius of a degree-e point has a=−e. In a fixed finite ℓ-adic coefficient model define H={(a,g)∈ℤ̂×GSp(ℱ,ψ): μ(g)=q^(−da)}. Then (arithmetic degree,ρ):π₁(U₀)→H has open image H₁, compact because π₁(U₀) is profinite. Its degree-zero image is open in Sp for the ℓ-adic topology.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system, LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image, InverseGaloisAndArithmeticFundamentalGroups:IG.1
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.3/haar-null-exceptional-eigenvalue-locus
Weil I Lemma 6.12: the eigenvalue-δ^a locus is closed and Haar-null
For an ℓ-adic unit δ in the fixed finite coefficient field, the locus Z_δ={(a,g)∈H₁: δ^a is an eigenvalue of g} is closed and null in each arithmetic-degree fibre, hence Haar-null in H₁. For a bad geometric eigenvalue δ₀^e the arithmetic-degree locus uses δ=δ₀⁻¹, since a(F_x)=−e.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.3/open-image-in-the-symplectic-similitude-group
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.3/exceptional-frobenius-set-has-density-zero
The Frobenius elements landing in a Haar-null set have density zero
Let δ_1, …, δ_Q be ℓ-adic units. The set L of x ∈ |U₀| such that some δ_j^{deg x} is an eigenvalue of F_x on ℱ₀ has Dirichlet density 0. More precisely, the proportion of the closed points of degree n that lie in L tends to 0 as n → ∞. In particular, for every sufficiently large n there are closed points of degree n outside L.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.3/haar-null-exceptional-eigenvalue-locus, DeligneWeightsAndPurity:DWP.3/open-image-in-the-symplectic-similitude-group, FunctionFieldArithmetic:FA.5, tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.3/denominators-away-from-the-exceptional-set
Weil I Proposition 6.6: the denominator of (6.6.1) away from K and L
Let (γ_i)_{i ≤ P} and (δ_j)_{j ≤ Q} be families of ℓ-adic units with γ_i ≠ δ_j. There are a finite set K of nonnegative integers different from 1 and a density-zero set L ⊂ |U₀| such that, for x ∉ L with deg x divisible by no element of K, the rational function det(1 − F_x t, ℱ₀)·∏_i(1 − γ_i^{deg x} t) / ∏_j(1 − δ_j^{deg x} t), written in lowest terms, has denominator ∏_j(1 − δ_j^{deg x} t).
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.3/exceptional-frobenius-set-has-density-zero, DeligneWeightsAndPurity:DWP.3/powers-of-a-family-determine-the-family
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.3/divisibility-criterion
Weil I Proposition 6.8: an intrinsic characterisation of the γ-polynomial
Let (γ_i)_{i ≤ P} and (δ_j)_{j ≤ Q} be families of ℓ-adic units, R(t) = ∏(1 − γ_i t) and S(t) = ∏(1 − δ_j t). If, for every x ∈ |U₀|, ∏_j(1 − δ_j^{deg x} t) divides ∏_i(1 − γ_i^{deg x} t)·det(1 − F_x t, ℱ₀), then S(t) divides R(t). Consequently R(t) is the least common multiple of the S(t) satisfying this hypothesis, which characterises the γ-family intrinsically from the polynomials ∏(1 − γ_i^{deg x}t)·det(1 − F_x t, ℱ₀).
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.3/denominators-away-from-the-exceptional-set
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.3/rationality-of-pencil-local-factors
Weil I Theorem 6.2: the local factors of the radical quotient have rational coefficients
In the setting of radical-quotient-of-the-vanishing-system, for every x ∈ |U₀|, det(1 − F_x t, ℱ₀) ∈ ℚ[t].
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.3/zeta-of-the-fibres-and-the-pencil-factorization, DeligneWeightsAndPurity:DWP.3/denominators-away-from-the-exceptional-set, DeligneWeightsAndPurity:DWP.3/divisibility-criterion, DeligneWeightsAndPurity:DWP.3/powers-of-a-family-determine-the-family
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.3/coarse-bound-for-the-pencil
Weil I Corollary 6.3: the coarse bound on H¹(D, j_*ℱ)
Let j : U → D be the inclusion. Every eigenvalue α of F^* on H¹(D, j_*ℱ) is an algebraic number, and every complex conjugate satisfies q^{(n+1)/2 − 1/2} ≤ |α| ≤ q^{(n+1)/2 + 1/2}.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.3/rationality-of-pencil-local-factors, DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system, DeligneWeightsAndPurity:DWP.2/fundamental-estimate-theorem-3-2, DeligneWeightsAndPurity:DWP.2/coarse-bound-on-cohomology-of-the-projective-line, LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.4/middle-cohomology-half-unit-bound
The half-unit bound in even dimension
Let X₀ be smooth projective of pure even dimension d over 𝔽_q, ℓ ≠ char 𝔽_q. Every eigenvalue α of geometric Frobenius on Hᵈ(X,ℚ_ℓ) is algebraic; every complex conjugate satisfies q^(d/2−1/2) ≤ |α| ≤ q^(d/2+1/2). No semisimplicity or degeneration of Leray is required. The induction retains E∩E⊥ and covers zero vanishing cycles, a zero radical quotient, and a nonzero quotient.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.3/coarse-bound-for-the-pencil, DeligneWeightsAndPurity:DWP.3/geometrically-constant-lisse-sheaves, DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights, LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil, LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils, EtaleDualityAndPerverseSheaves:EDC.4, SchemeAndStackFoundations:SF.2
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.4/middle-cohomology-purity
Purity in the middle degree
For smooth projective X₀ of any pure dimension d over 𝔽_q, every geometric-Frobenius eigenvalue on Hᵈ(X,ℚ_ℓ) is a Weil q-number of weight d.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.4/middle-cohomology-half-unit-bound, DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals, SchemeAndStackFoundations:SF.2
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.4/smooth-projective-purity
The Weil theorem for smooth projective varieties
For every smooth projective X₀ over 𝔽_q and every i≥0, each eigenvalue of geometric Frobenius on Hⁱ(X,ℚ_ℓ) is a Weil q-number of weight i. This is Weil I Lemma 1.7; integral cohomological factors and their ℓ-independence are exported to WC.3 rather than proved again here.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.4/middle-cohomology-purity, DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions, DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights, EtaleDualityAndPerverseSheaves:EDC.4, EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/weil-group
The Weil group of a finite-field scheme
For connected X₀/𝔽_q with geometric point x, let W(X₀,x)=π₁(X₀,x)×_{Gal(𝔽̄_q/𝔽_q)}ℤ, where 1∈ℤ maps to geometric Frobenius. Its topology makes the geometric kernel open with its profinite topology and the degree quotient discrete. For geometrically connected X₀ the sequence 1→π₁(X,x)→W(X₀,x)→ℤ→0 is exact. A closed-point geometric Frobenius has degree +deg(x). This degree is the negative of the arithmetic coordinate in Weil I §6.
Direct mathematical inputs: InverseGaloisAndArithmeticFundamentalGroups:IG.1, mathlib:MonoidHom.eqLocus
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/weil-sheaf
Weil sheaves and étale descent
A constructible Weil sheaf on X₀/𝔽_q is a constructible ℚ̄_ℓ-sheaf on X=X₀×𝔽̄_q together with compatible Weil descent isomorphisms; equivalently an isomorphism F*ℱ≅ℱ for the chosen geometric-Frobenius descent action. For a lisse sheaf on connected X this is a continuous finite-coefficient-model representation of W(X₀,x). An ordinary étale sheaf requires extension of that representation to continuous π₁(X₀,x); a Frobenius isomorphism alone does not ensure it. On a point a rank-one Weil action with scalar b descends étale exactly when b is an ℓ-adic unit.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/weil-group, SchemeAndStackFoundations:SF.2, EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change, ArithmeticGaloisRepresentations:R01.6
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness
Punctual purity and finite mixed filtrations
Let ℓ be prime and X be of finite type over ℤ[1/ℓ]; use constructible ℚ̄_ℓ-sheaves, or Weil sheaves when X is over a finite field. Punctual purity of integer weight n requires every geometric-Frobenius eigenvalue at each closed point x to be a Weil N(x)-number of weight n. Fixed-ι punctual purity of real weight β uses |ια|=N(x)^(β/2). Mixedness, respectively ι-mixedness, means existence of a finite filtration by subsheaves with pure, respectively ι-pure, successive quotients. Actual weights are the weights of nonzero quotients; the zero sheaf has no actual weights. Bounds ≤b or ≥b apply to these actual weights. Weight classes modulo ℤ are real weights in ℝ/ℤ; the canonical decomposition into those classes belongs to DWP.8.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/weil-sheaf, DeligneWeightsAndPurity:DWP.0/endomorphism-weights, DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions, DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals, EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/real-sheaves
Totally real and ι-real sheaves
A sheaf is totally real when every closed-point local characteristic polynomial has algebraic totally real coefficients; it is ι-real when those coefficients map into ℝ under the fixed ι. These are coefficient conditions, not assertions that every eigenvalue is real. A pure sheaf of integer weight n is a direct summand of the totally real sheaf ℱ⊕ℱ∨(−n); for real ι-weight β use a rank-one Weil twist of weight 2β in place of the integer Tate normalization.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness, DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters, DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/rank-one-normalization
Finite geometric monodromy and rank-one normalization
For normal geometrically connected X₀/𝔽_q, the image of π₁(X) in the abelianization of W(X₀) is an extension of a finite prime-to-p group by a pro-p group. Consequently every rank-one ℓ-adic Weil representation (ℓ≠p, finite coefficient model) has finite geometric image and is a constant Weil character times a finite-order character; it is punctually ι-pure. An irreducible rank-r system becomes finite-determinant after a rank-one Weil twist. Choosing a twist of arbitrary real weight uses Weil lines and does not assert that it is a motivic Tate twist.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/weil-group, DeligneWeightsAndPurity:DWP.5/weil-sheaf, DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters, FunctionFieldArithmetic:FA.4, InverseGaloisAndArithmeticFundamentalGroups:IG.1, LefschetzPencilsAndVanishingCycles:LPV.5, DeligneWeightsAndPurity:DWP.5/specialization-of-monodromy
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/determinantal-weights
Determinantal weights of irreducible constituents
For a lisse Weil sheaf on normal connected X₀, an irreducible constituent ℱ of rank r has determinantal ι-weight β when det ℱ is punctually ι-pure of weight rβ. The determinantal-weight multiset of any lisse sheaf lists these β with constituent multiplicities. It is independent of a Jordan–Hölder filtration. It is not the multiset of all stalk weights until purity of constituents has been proved.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/rank-one-normalization, DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness, DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals, DeligneWeightsAndPurity:DWP.0/eigenvalues-of-exterior-powers, DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/geometric-monodromy-and-central-degree
Unipotent radical and central degree in Weil monodromy
For a lisse finite-model Weil system on normal geometrically connected X₀, let G_geom be the Zariski closure of geometric monodromy and G the algebraic-by-discrete extension G_geom⋊ℤ induced by a degree-one lift. The radical of G_geom° is unipotent. If the system is semisimple as a Weil representation, its geometric restriction is semisimple and G_geom° is semisimple. Then degree on Z(G) has finite kernel and image of finite index in ℤ. For a central g of degree m≠0, the spectrum on the determinantal-weight-β constituent has |ια|=q^(mβ/2). Every irreducible Weil system becomes an étale system after a rank-one Weil twist.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/rank-one-normalization, DeligneWeightsAndPurity:DWP.5/determinantal-weights, tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups, ArithmeticGaloisRepresentations:R01.6
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/determinantal-weight-functoriality
Functoriality of determinantal weights
For a dominant morphism f:X′₀→X₀ of normal connected finite-type schemes over 𝔽_q, a lisse Weil sheaf has only determinantal ι-weight β if and only if its pullback does. Tensor products of sheaves having only determinantal weights β and γ have only weight β+γ. If n(β) is the sum of ranks of constituents of weight β, the determinantal weights occurring in ∧^aℱ are exactly Σ_β a(β)β with Σ a(β)=a and 0≤a(β)≤n(β), as a set of occurring weights (not constituent multiplicities).
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/determinantal-weights, DeligneWeightsAndPurity:DWP.5/geometric-monodromy-and-central-degree, DeligneWeightsAndPurity:DWP.0/eigenvalues-of-exterior-powers, DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals, InverseGaloisAndArithmeticFundamentalGroups:IG.1
The full geometric/representation signature awaits the real owner carriers;
the packet retains its hypotheses, proof and tests.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/generalized-majoration
Deligne’s generalized majoration theorem
For a normal connected X₀ of finite type over 𝔽_q, the irreducible constituents of a lisse ι-real sheaf are punctually ι-pure. More precisely, on a smooth curve let r be its maximal determinantal weight; every stalk eigenvalue has ι-weight ≤r, and each irreducible constituent of determinantal weight β is punctually pure of weight β. No open symplectic-image or rational-coefficient hypothesis is imposed.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/real-sheaves, DeligneWeightsAndPurity:DWP.5/determinantal-weights, DeligneWeightsAndPurity:DWP.5/geometric-monodromy-and-central-degree, DeligneWeightsAndPurity:DWP.2/positive-local-factors, DeligneWeightsAndPurity:DWP.2/poles-of-positive-products, DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals, LefschetzPencilsAndVanishingCycles:LPV.5, DeligneWeightsAndPurity:DWP.0/eigenvalues-of-exterior-powers, DeligneWeightsAndPurity:DWP.5/determinantal-weight-functoriality, EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/initial-curve-and-boundary-bounds
Initial cohomological and boundary weight bounds
For j:U₀→C₀ with C₀ smooth projective over 𝔽_q and ℱ lisse punctually ι-pure of real weight β, boundary eigenvalues of j_*ℱ have ι-weight ≤β, and those on H¹_c(U,ℱ) have weight ≤β+2. These initial non-strict bounds precede the strict analytic bound and the sharp curve theorem.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness, DeligneWeightsAndPurity:DWP.5/real-sheaves, DeligneWeightsAndPurity:DWP.5/generalized-majoration, DeligneWeightsAndPurity:DWP.2/radius-of-convergence-of-positive-products, SchemeAndStackFoundations:SF.2, EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/local-monodromy-purity
The local weight–monodromy theorem on a curve
Let U₀ be a smooth curve over 𝔽_q and ℱ lisse punctually ι-pure of real weight β. At a missing point of its smooth completion take the local Weil representation V and the monodromy filtration M centered at zero after the quasi-unipotent inertia reduction. Then GrᵢᴹV is pure of weight β+i relative to the residue cardinality. With N:V→V(−1), geometric F satisfies FNF⁻¹=q_x⁻¹N in untwisted coordinates. The inertia invariants have only weights ≤β. This is an equal-characteristic curve theorem.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/initial-curve-and-boundary-bounds, DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters, LefschetzPencilsAndVanishingCycles:LPV.1, LefschetzPencilsAndVanishingCycles:LPV.0
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/local-weight-corollaries
Boundary mixedness and extension of purity
For an ι-mixed local system on a smooth curve, the relative monodromy filtration exists and agrees with the local weight filtration on pure graded pieces. Along a smooth divisor, the relative construction is lisse and compatible with transverse curves and fibres under the tame hypotheses of (1.8.6)–(1.8.7). For an open immersion of finite-type 𝔽_q schemes, underived j_* takes ι-mixed sheaves with weights ≤β to ι-mixed sheaves with weights ≤β. A lisse sheaf pure on a dense open is pure everywhere; on normal X a lisse ι-mixed sheaf has a finite filtration by lisse pure sheaves. On connected X an ι-mixed lisse sheaf pure of weight β at one closed point is pure of weight β everywhere.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/local-monodromy-purity, DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness, LefschetzPencilsAndVanishingCycles:LPV.1, EtaleDualityAndPerverseSheaves:EDC.0, SchemeAndStackFoundations:SF.2, EtaleDualityAndPerverseSheaves:EDC.0/tate-twist
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/stalk-newton-polygon
Newton polygons of Frobenius stalks
Fix a rational-valued additive nonarchimedean valuation v on the coefficient algebraic closure normalized by v(p)=1. For a rank-r closed stalk at x with geometric Frobenius eigenvalues α₁,…,αᵣ, let s₁≤…≤sᵣ be v(αᵢ)/v(N(x)), counted with multiplicity. Its Newton polygon has vertices (k,Σ_{i≤k}sᵢ), k=0,…,r, and linear interpolation. Equivalently the kth ordinate is the minimum normalized valuation of products of k distinct eigenvalue positions, the spectrum of the kth exterior power. This is the stalk specialization of the general Newton-polygon convention, not a new p-adic cohomology theory.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals, mathlib:AddValuation, mathlib:Multiset.sort, DeligneWeightsAndPurity:DWP.0/eigenvalues-of-exterior-powers
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/nonarchimedean-boundary-bounds
Nonarchimedean bounds at the boundary
Fix an embedding ι of the coefficient field into an algebraically closed nonarchimedean valued field of characteristic zero. For a lisse Weil sheaf on a smooth curve, a normalized nonarchimedean bound b^(deg x)≤|ια|≤c^(deg x) at closed points extends to every eigenvalue of its local boundary Weil representations. Generic ℓ′-adic units remain units at the boundary. For valuations with v(p)>0, if almost all stalk Newton polygons agree, the boundary polygon lies on or above that polygon with the same endpoint. If local normalized slopes lie in [β,γ], N^(⌊γ−β⌋+1)=0.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/stalk-newton-polygon, DeligneWeightsAndPurity:DWP.5/local-monodromy-purity, DeligneWeightsAndPurity:DWP.5/rank-one-normalization, DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals, DeligneWeightsAndPurity:DWP.0/eigenvalues-of-exterior-powers
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/specialization-of-monodromy
Specialization of geometric monodromy
Let f:X→S be smooth with geometrically connected curve fibres, S reduced irreducible with generic point η, and g:S→X a section. For a lisse ℤ_ℓ-sheaf ℱ, after shrinking S to a nonempty open there is, simultaneously for every n, a lisse subgroup of Aut(g*ℱ/ℓⁿ) whose stalk is the image of the geometric fibre fundamental group. If f has a smooth proper curve compactification with boundary finite étale over S, the image is locally constant without further shrinking under the stated tame conditions; the inertia images at sections of the boundary specialize compatibly. The extension (1.11.5) covers finite-type families after stratification and dévissage, with the model and the locally constant image conditions kept explicit.
Direct mathematical inputs: ArithmeticGaloisRepresentations:R01.6, InverseGaloisAndArithmeticFundamentalGroups:IG.1, SchemeAndStackFoundations:SF.2, LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/hadamard-de-la-vallee-poussin
The abstract Hadamard–de la Vallée-Poussin theorem
Let G be a locally compact extension of Γ=ℤ or ℝ by a compact group G⁰; in the ℤ case the center maps onto a finite-index subgroup of Γ, and in the ℝ case the extension is a product. Fix the norm character ω₁, a countable family of conjugacy classes with norms N_v>1, and absolute convergence of the trivial Euler product for real part >1. Regard L as a function on the representation Riemann surfaces r=ρ⊗ω_s. If it continues meromorphically to real part ≥1 and is holomorphic there except a simple pole at r=ω₁, then it has no zeros on real part 1 except possibly at one representation r=ω₁ε with ε a one-dimensional order-two character. The curve application excludes this exception by the connected double-cover zeta comparison. The norm-character translation is part of the statement, so imaginary twists are not incorrectly assigned separate pole conditions.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.1/weil-estimate-for-curves, tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity, tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem, tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups, FunctionFieldArithmetic:FA.5
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/compact-weil-form
The compact form of Weil monodromy
Let X₀ be a normal geometrically connected scheme over 𝔽_q and G an algebraic-by-ℤ group satisfying Weil II (2.2.4): (a) its algebraic degree-zero kernel G⁰ is an extension of a finite group by a semisimple group; (b) a finite coefficient field E/ℚ_ℓ models G⁰ and the geometric Weil-group homomorphism is continuous and Zariski dense; (c) an algebraic representation gives an ι-mixed Weil sheaf and its restriction to G⁰ has finite kernel. Fix ι. Write Z_c for the center and choose a maximal compact subgroup U of the complex algebraic quotient G/Z_c. Define G_R as its inverse image in G_ℂ, with discrete degree; its degree-zero kernel is compact. Every local ιF_x has semisimple part conjugate to an element of G_R, uniquely up to G_R conjugacy. Restriction gives an equivalence between algebraic finite-dimensional representations of G and continuous finite-dimensional complex representations of G_R. For an irreducible representation r, use the source’s convention ω₁(g)=q^(−deg g) and |r(z)|=ω₁(z)^Re(r) for positive-degree central z. Its associated sheaf is ι-pure of weight −2Re(r), correcting the printed sign in (2.2.8)(i) and (3.5.1). Thus the scalar q^(τ deg) has Re(r)=−τ and weight 2τ.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/geometric-monodromy-and-central-degree, DeligneWeightsAndPurity:DWP.5/generalized-majoration, DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness, tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups, tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/strict-initial-h1-bound
The strict initial H¹ bound
For a smooth curve U₀/𝔽_q and a lisse sheaf punctually ι-pure of real weight β, every eigenvalue on H¹_c(U,ℱ) has ι-weight strictly less than β+2. This bound does not assert β+1; it is the analytic input to the square-improvement argument.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/initial-curve-and-boundary-bounds, DeligneWeightsAndPurity:DWP.5/hadamard-de-la-vallee-poussin, DeligneWeightsAndPurity:DWP.5/compact-weil-form, DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves, SchemeAndStackFoundations:SF.2, EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.5/abstract-degree-equidistribution
Character decay and degree-fibre equidistribution
In the abstract compact-by-ℤ setting, add hypotheses (C) of (2.1.10): all irreducible Euler products are nonvanishing and holomorphic on Re(s)≥1 except the simple trivial norm-character pole; and (D): norms are powers of q. Fix a positive-degree central element z of degree d. The translated, normalized prime-power Dirac measures on degree nd+i conjugacy fibres converge weakly to the pushforward of normalized Haar on the corresponding degree-i fibre. The measures count powers with their degree weights; replacing them with rational-point Frobenius classes requires the actual identity (3.5.2.1).
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/hadamard-de-la-vallee-poussin, tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.6/coefficient-specific-vanishing-cycles
Vanishing cycles with unipotent boundary coefficients
Let S₀ be a smooth projective surface, D₀ a strict normal-crossings divisor, V₀=S₀−D₀, and ℱ₀ a lisse sheaf on V₀ with unipotent local monodromy along D₀. Choose a pencil satisfying Weil II (3.1.1)(A)–(D), with each exceptional fibre having just one of the three indicated singularities. For j_!ℱ on the blown-up pencil, Φ^a vanishes for a≠1. At an ordinary node outside D, Φ¹=ℱ_x(−1)⊗ε(B), where ε(B) is the sign line on the two branches. At a tangency with D, or a transverse intersection of two branches of D, a locally constant graded boundary filtration gives Gr Φ¹=Gr ℱ_x⊗ε(B), with no Tate twist in these two cases.
Direct mathematical inputs: LefschetzPencilsAndVanishingCycles:LPV.2, LefschetzPencilsAndVanishingCycles:LPV.3, LefschetzPencilsAndVanishingCycles:LPV.4, EtaleDualityAndPerverseSheaves:EDC.4, DeligneWeightsAndPurity:DWP.5/local-monodromy-purity
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.6/real-cohomological-factors
Reality of curve cohomological factors
If U₀ is a smooth finite-field curve and ℱ₀ is lisse, punctually ι-pure of real weight β and ι-real, then each polynomial ι det(1−tF,Hⁱ_c(U,ℱ)) has real coefficients. Geometric connectedness is unnecessary after component and finite-extension descent.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/strict-initial-h1-bound, DeligneWeightsAndPurity:DWP.5/real-sheaves, DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves, SchemeAndStackFoundations:SF.2, EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology, EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.6/square-improvement
Square improvement on the product of a curve
For a smooth finite-field curve U₀ and lisse punctually ι-pure weight-zero ℱ₀, every eigenvalue α of H¹_c(U,ℱ) satisfies w_ι(α)≤1+2^(−k), for every integer k≥0. The step k→k+1 is proved on a pencil in the compactified surface U₀×U₀ and uses the three coefficient-specific vanishing-cycle cases; it is not a direct application of the general direct-image theorem.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.6/coefficient-specific-vanishing-cycles, DeligneWeightsAndPurity:DWP.6/real-cohomological-factors, DeligneWeightsAndPurity:DWP.5/generalized-majoration, DeligneWeightsAndPurity:DWP.5/local-monodromy-purity, DeligneWeightsAndPurity:DWP.5/strict-initial-h1-bound, DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals, DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights, LefschetzPencilsAndVanishingCycles:LPV.3, SchemeAndStackFoundations:SF.2, EtaleDualityAndPerverseSheaves:EDC.4, EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology, EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.6/sharp-curve-purity
Purity of parabolic curve cohomology
Let C₀ be a smooth projective finite-field curve, j:U₀→C₀ a dense open, and ℱ₀ lisse and punctually ι-pure of real weight β. For i=0,1,2, every eigenvalue on Hⁱ(C,j_*ℱ) has ι-weight exactly β+i. In degree one this group is the image of H¹_c(U,ℱ)→H¹(U,ℱ). If ℱ is integer-pure for every embedding, the eigenvalues are algebraic Weil q-numbers of weight β+i.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.6/square-improvement, DeligneWeightsAndPurity:DWP.5/local-monodromy-purity, DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness, EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement, DeligneWeightsAndPurity:DWP.0/embeddings-into-the-complex-numbers, DeligneWeightsAndPurity:DWP.0/weil-number-iff-iota-pure-for-every-iota
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.6/compact-support-curve-bound
Compact-support bounds for pure curve coefficients
For a smooth finite-field curve U₀ and lisse punctually ι-pure real-weight-β ℱ₀, Hⁱ_c(U,ℱ) has only ι-weights ≤β+i, for i=0,1,2. For integer purity, these are algebraic integer-weight bounds for every complex conjugate. The parabolic image in degree one is pure β+1, while the extra boundary contribution has weights ≤β.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.6/sharp-curve-purity, DeligneWeightsAndPurity:DWP.5/local-weight-corollaries, EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology, DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.10/weight-transport-to-stable-subquotients
Weights on stable arithmetic subquotients
Let (V,F) be a finite-dimensional invertible Frobenius module and let a commuting algebra of correspondences act on V. Every Frobenius-stable correspondence-stable subquotient of a pure weight-w module is pure of weight w; for a mixed module its actual weights are a subset of those of V. Scalar extension preserves and reflects purity, tensor products add pure weights, duals negate them and an integer Tate twist subtracts 2r. A Hecke eigenspace inherits the conclusion only when it is actually Frobenius-stable. This statement does not imply ℓ-independence of a chosen eigenspace.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions, DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals, DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters, DeligneWeightsAndPurity:DWP.0/weight-decomposition
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.10/compatible-realization-export
Compatible degree factors and point counts
For smooth projective X₀/𝔽_q, the WC.3 integral factors Π_i identify the Weil weight-i root multisets across every ℓ≠p, and WC.5 supplies the all-extension point-count estimate. The endpoint for a pure-dimensional scheme with geometric-component permutation σ is c_n(1+q^(nd)), with c_n=#Fix(σⁿ), rather than a universal single q^(nd). To export a compatible stable arithmetic subquotient, supply a normalized rational factor Q(T), independent of ℓ, whose image is exactly its Frobenius factor in every realization. Under that additional hypothesis its roots and weights agree across realizations; purity of the ambient space alone does not construct Q.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.4/smooth-projective-purity, DeligneWeightsAndPurity:DWP.10/weight-transport-to-stable-subquotients, WeilConjectures:WC.3/degreewise-pure-factor-extraction, WeilConjectures:WC.3/integral-factors-and-ell-independence-from-purity, WeilConjectures:WC.5/all-extension-point-count-bound, WeilConjectures:WC.5/components-and-dimension-zero
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.10/finite-residue-semistable-curve-weights
Weights in the semistable curve filtration
For a proper semistable curve over a trait with finite residue field, import LPV.7’s Frobenius-equivariant normalization sequence and monodromy filtration of generic H¹ centered at 1. Its graded pieces H¹(Γ), ⊕H¹(Ỹ_v), H₁(Γ)(−1) have weights respectively 0,1,2. The graph may have a Frobenius permutation, and the normalized components may need finite residue-field extension; these change no weight. This is the finite-residue-field curve consequence, not a general mixed-characteristic weight–monodromy theorem.
Direct mathematical inputs: LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-monodromy-filtration, LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-normalization-cohomology, DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves, DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights, DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.10/mixed-nearby-and-newton-exports
Mixed nearby cycles and Newton restrictions
The arithmetic consumers use the already planned DWP.8 theorem that nearby-cycle cohomology sheaves of a mixed sheaf remain mixed, and its proper direct-image purity over ℤ[1/ℓ]. For an integral weight-w eigenvalue, DWP.7’s Newton couple (r,s) satisfies r+s=w and r,s≥0; its cohomological valuation triangles retain the separate compact-support/proper and smooth ordinary hypotheses. DWP.0 supplies the shared numeric Weil/ι-weight predicates to RD.6; RD.6 supplies its own F-isocrystal fibres and defines pointwise purity and mixedness there.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.8/nearby-cycles-preserve-mixedness-6-1-13, DeligneWeightsAndPurity:DWP.8/variant-over-z-one-over-ell-6-2-7, DeligneWeightsAndPurity:DWP.7/newton-couples-3-3-7, DeligneWeightsAndPurity:DWP.7/valuation-triangles-3-3-8, DeligneWeightsAndPurity:DWP.0/weil-q-number, DeligneWeightsAndPurity:DWP.0/iota-weight
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.10/frobenius-equidistribution
Deligne’s Frobenius equidistribution theorem
In Weil II §2.2’s algebraic-by-ℤ monodromy setting, let X₀/𝔽_q be normal and geometrically connected of dimension N≥1, with the hypotheses (a)–(c) and compact form G_R of DWP.5 (finite kernel is required on the geometric subgroup). Let G_R^i denote degree-i conjugacy classes with the pushforward of normalized compact Haar. For a central z of positive degree d and fixed i, translate by z^(−n) the measure q^(−(nd+i)N) Σ_(x∈X₀(𝔽_(q^(nd+i)))) δ_[ιF_x,ss]. As n→∞ it converges weakly to Haar on the degree-i conjugacy fibre. The sum is over rational points with Frobenius powers, and normalization uses the base dimension N. This is Weil II (3.5.3), not Weil I’s estimate or density of individual Weil numbers.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.5/compact-weil-form, DeligneWeightsAndPurity:DWP.5/abstract-degree-equidistribution, DeligneWeightsAndPurity:DWP.7/cohomological-bounds-3-3-2-3-3-6, DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity-theorem-3-4-1-iii, SchemeAndStackFoundations:SF.2
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.10/finite-field-sato-tate
Finite-field Sato–Tate for elliptic families
Let E₀→C₀ be a smooth elliptic family over a smooth geometrically connected finite-field curve, with nonconstant j-invariant. Import the full SL₂ geometric monodromy theorem of Weil II (3.5.5) from its universal elliptic-family/modular-curve supplier. Then the normalized H¹ Frobenius classes lie in SU(2). Define θ_x∈[0,π] by eigenvalues q^(m/2)e^(±iθ_x) at x∈C₀(𝔽_(q^m)); #E_x(𝔽_(q^m))=1+q^m−2q^(m/2)cos θ_x. The measures q^(−m) Σ_x δ_(θ_x) converge to (2/π)sin²θ dθ. The printed density and point-count sign in (3.5.6)–(3.5.7) are corrected as the confirmed source issues record.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.10/frobenius-equidistribution, DeligneWeightsAndPurity:DWP.5/compact-weil-form, DeligneWeightsAndPurity:DWP.1/compatibility-with-the-hasse-bound, tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing, tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/

/-
UNINSTANTIATED DeligneWeightsAndPurity:DWP.10/weight-acceptance-suite
The weight-facing acceptance suite
The common predicates and transports must reproduce: H^(2r)(ℙᴺ)=ℚ_ℓ(−r) of weight 2r and vanishing odd cohomology; H⁰(𝔾_m)=ℚ_ℓ of weight 0, H¹(𝔾_m)=ℚ_ℓ(−1) of weight 2, H¹_c(𝔾_m)=ℚ_ℓ of weight 0 and H²_c(𝔾_m)=ℚ_ℓ(−1) of weight 2; H¹ of a smooth projective genus-g curve of weight 1 with reciprocal pairs α_iα_(i+g)=q; the finite-residue-field semistable graded weights 0,1,2; and the component-aware all-extension point count. In Yu’s unitary Rankin–Selberg use, supplied Lafforgue correspondences make ℱ₁⊗ℱ₂∨ pure of weight zero; its proper curve cohomological factors have distinct weights 0,1,2 and cannot cancel. Correspondence construction, automorphic poles and functional equations remain with their existing owners.
Direct mathematical inputs: DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves, DeligneWeightsAndPurity:DWP.6/sharp-curve-purity, DeligneWeightsAndPurity:DWP.10/weight-transport-to-stable-subquotients, DeligneWeightsAndPurity:DWP.10/finite-residue-semistable-curve-weights, DeligneWeightsAndPurity:DWP.10/compatible-realization-export, EtaleDualityAndPerverseSheaves:EDC.3, WeilConjectures:WC.7, WeilConjectures:WC.1, EtaleDualityAndPerverseSheaves:EDC.2:pairings/lisse-tensor-hom-duality-on-curves, DeligneWeightsAndPurity:DWP.0/disjoint-spectra-no-intertwiner
The schema awaits the geometric/representation carriers from the owners above;
all hypotheses remain in the packet instead of fabricated Lean parameters.
-/


/-
Companion signature coverage ledger

What is typed here. The pinned libraries have no constructible ℓ-adic sheaves, no Weil sheaves,
no bounded constructible derived category with Rf_!, f^! and Verdier duality, and no étale
cohomology with Frobenius action (EtaleDualityAndPerverseSheaves EDC.0–EDC.4 and
SchemeAndStackFoundations SF.2 plan them). So the file types only the parts whose carriers
exist: the Frobenius-module (stalk, or Spec 𝔽_q) form of integral sheaves; the p-adic couples of
Weil II (3.3.7) on Mathlib's additive valuations; geometric semisimplicity of a representation
of a Weil group restricted to a subgroup; Lemma (4.1.4) on invariant forms; evenness of the rank
of a nondegenerate alternating form; and the primitive decomposition of a graded operator with
the hard Lefschetz property. No sheaf, complex or cohomology group is replaced by a stand-in.

The following packet declarations need those carriers and are therefore not typed here; their
mathematical statements are in the packet and the reader.

DWP.7 (namespace TauCeti.Weights):
  IsIntegralSheaf, IsIntegralSheaf.comap, IsIntegralSheaf.finite_pushforward,
  IsIntegralSheaf.twist_neg, IsIntegralSheaf.weights_nonneg, IsIntegralSheaf.constant;
  the theorem nodes weights-mixed-sheaves-definitions, devissage-in-the-sheaf-and-the-source,
  devissage-in-the-target, tame-cover-of-a-lisse-sheaf-on-a-curve,
  spreading-out-to-a-tame-relative-curve, purity-of-the-relative-curve-case,
  fundamental-direct-image-theorem-3-3-1, iota-mixed-direct-image-3-3-10,
  deligne-integrality-theorem-sga7-xxi, integral-weight-bounds-3-3-3,
  cohomological-bounds-3-3-2-3-3-6, valuation-triangles-3-3-8,
  hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11.
DWP.8 (namespace TauCeti.Weights):
  IsMixedComplex, HasWeightsLE, HasIotaWeightsLE, isMixedComplex_triangle,
  HasWeightsLE.of_triangle, hasWeightsLE_shift, hasWeightsLE_twist, HasWeightsLE.mono,
  hasWeightsLE_sheaf_iff, hasWeightsLE_iff_eigenvalues, hasWeightsLE_baseExtension,
  HasWeightsLE.isIotaWeightsLE and the tests hasWeightsLE_const_shift_neg,
  hasWeightsLE_const_shift_pos, hasWeightsLE_tate_shift, hasWeightsLE_zero,
  not_isMixedComplex_transcendental, hasWeightsLE_point_iff;
  HasWeightsGE, IsPureComplex, hasWeightsGE_dual, IsPureComplex.dual, HasWeightsGE.of_triangle,
  IsPureComplex.of_triangle, hasWeightsGE_shift_twist, hasWeightsGE_iff_rhom_smooth,
  isPureComplex_iff_lisse, IsPureComplex.directSum and the tests isPureComplex_const_smooth,
  isPureComplex_point_iff, not_isPureComplex_nodal, not_isPureComplex_extensionByZero,
  isPureComplex_zero;
  IsMixedGalois, isMixedGalois_of_unramified, isMixedGalois_iff_filtration,
  isMixedGalois_changeOfTrait, IsMixedGalois.subquotient, IsMixedGalois.tensor,
  IsMixedGalois.invariants and the tests isMixedGalois_trivial, isMixedGalois_tate_curve,
  isMixedGalois_quadratic_twist, isMixedGalois_zero, not_isMixedGalois_transcendental;
  weightClass, weightClass_isInternal, weightClass_stalk, weightClass_map, weightClass_unique,
  weightClass_eq_twist, weightClass_of_integer, weightClass_tensor and the tests
  weightClass_fractional, weightClass_integral, weightClass_depends_on_iota, weightClass_zero,
  weightClass_point;
  weightFiltration, weightFiltration_gr_pure, weightFiltration_unique, weightFiltration_stalk,
  weightFiltration_map, weightFiltration_strict, weightFiltration_tensor, weightFiltration_dual,
  weightFiltration_pullback, weightFiltration_twist, weightFiltration_indep_iota and the tests
  weightFiltration_kummer, weightFiltration_pure, weightFiltration_not_split,
  weightFiltration_point, weightFiltration_strict_example;
  isGeometricallySemisimple_iff_restrict_open, isGeometricallySemisimple_baseExtension,
  IsGeometricallySemisimple.subquotient, IsGeometricallySemisimple.dual,
  maximalGeometricallySemisimpleSubsheaf, isGeometricallySemisimple_iff_reductive,
  geometricMonodromyGroup_conjugate (sheaf level);
  ArithmeticModel, PotentiallyHas, PotentiallyHas.mono, ArithmeticModel.restrict,
  PotentiallyHas.pullback, PotentiallyHas.directSum, PotentiallyHas.of_iso,
  potentially_baseChange_algClosed and the
  tests potentiallyPure_const_smooth, potentially_of_finite_field, not_potentiallyPure_kummer,
  potentially_zero;
  and every DWP.8 theorem node.
DWP.9 (namespace TauCeti.HardLefschetz):
  lefschetzOperator, lefschetzOperator_pow, lefschetzOperator_smul,
  lefschetzOperator_comm_pullback, lefschetzOperator_galois,
  lefschetzOperator_eq_gysin_restrict, lefschetzOperator_selfAdjoint, lefschetzOperator_pow_top,
  primitivePart, lefschetzPairing, lefschetzPairing_symm and the tests
  lefschetzOperator_projectiveSpace, lefschetzOperator_trivial_bundle,
  lefschetzOperator_degree_zero, lefschetzOperator_point, lefschetzPairing_curve;
  and the theorem nodes hyperplane-factorisation-4-1-2,
  arithmetic-model-of-a-polarised-smooth-projective-variety,
  global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3, hard-lefschetz-4-1-1,
  primitive-decomposition-and-lefschetz-pairings, odd-betti-numbers-are-even-4-1-5,
  hard-lefschetz-for-potentially-pure-complexes-6-2-13, hard-lefschetz-for-pure-lisse-sheaves,
  orthogonal-decomposition-of-a-hyperplane-section-4-3-9.
-/

open Polynomial

noncomputable section

namespace TauCeti.Weights

/-! ## Integral Frobenius modules (`DeligneWeightsAndPurity:DWP.7/integral-sheaf`)

A sheaf on a scheme of finite type over `ℤ[1/ℓ]` is integral when every Frobenius element at
every closed point acts on the stalk with algebraic-integer eigenvalues; on `Spec 𝔽_q` a sheaf is
a Frobenius module and the predicate is `IsIntegralEnd` of the geometric Frobenius. The tests are
stated on rational models of the Frobenius modules. -/

section IntegralEnd

variable {E V : Type*} [Field E] [AddCommGroup V] [Module E V] [FiniteDimensional E V]

/-- `IsIntegralEnd F`: every root of the characteristic polynomial of `F` in an algebraic
closure is integral over `ℤ` (Weil II (3.3.2)). The roots are DWP.0's eigenvalue multiset. -/
def IsIntegralEnd (F : V →ₗ[E] V) : Prop :=
  ∀ α ∈ (F.charpoly.map (algebraMap E (AlgebraicClosure E))).roots, IsIntegral ℤ α

/-- For a rational Frobenius module, integrality is integrality of the characteristic
polynomial's coefficients. -/
theorem isIntegralEnd_iff_charpoly {W : Type*} [AddCommGroup W] [Module ℚ W]
    [FiniteDimensional ℚ W] (F : W →ₗ[ℚ] W) :
    IsIntegralEnd F ↔ ∀ n, ∃ m : ℤ, F.charpoly.coeff n = m := by
  sorry

/-- Integrality is detected on an invariant subspace and the quotient. -/
theorem IsIntegralEnd.of_extension (F : V →ₗ[E] V) (U : Submodule E V)
    (hU : U ≤ U.comap F) :
    IsIntegralEnd F ↔
      IsIntegralEnd (F.restrict (p := U) (q := U) (fun _ hx => hU hx)) ∧
        IsIntegralEnd (U.mapQ U F hU) := by
  sorry

/-- An algebraic number with an integral power is integral, and conversely. -/
theorem IsIntegralEnd.pow (F : V →ₗ[E] V) {r : ℕ} (hr : 0 < r) :
    IsIntegralEnd (F ^ r) ↔ IsIntegralEnd F := by
  sorry

/-- Eigenvalues of a tensor product are products of eigenvalues. -/
theorem IsIntegralEnd.tensor {W : Type*} [AddCommGroup W] [Module E W] [FiniteDimensional E W]
    {F : V →ₗ[E] V} {G : W →ₗ[E] W} (hF : IsIntegralEnd F) (hG : IsIntegralEnd G) :
    IsIntegralEnd (TensorProduct.map F G) := by
  sorry

end IntegralEnd

/-- Test `isIntegralEnd_tate_neg_one`: `ℚ̄_ℓ(−1)` on `Spec 𝔽_q` (here `q = 2`), where `F` acts
by `q`, is integral. -/
example : IsIntegralEnd ((2 : ℚ) • LinearMap.id : ℚ →ₗ[ℚ] ℚ) := by
  sorry

/-- Test `not_isIntegralEnd_tate_one`: `ℚ̄_ℓ(1)` (`F` acts by `q⁻¹`, `q = 2`) is pure of weight
`−2` but not integral. -/
example : ¬ IsIntegralEnd ((2 : ℚ)⁻¹ • LinearMap.id : ℚ →ₗ[ℚ] ℚ) := by
  sorry

/-- Test `not_isIntegralEnd_weight_zero`: the rotation with eigenvalues `(3 ± 4i)/5` (all
complex absolute values `1`, weight `0`) is not integral. -/
example : ¬ IsIntegralEnd (Matrix.toLin' !![(3 / 5 : ℚ), -4 / 5; 4 / 5, 3 / 5]) := by
  sorry

/-- Test `isIntegralEnd_zero`: the zero Frobenius module is integral. -/
example : IsIntegralEnd (0 : (Fin 0 → ℚ) →ₗ[ℚ] (Fin 0 → ℚ)) := by
  sorry

/-- Test `isIntegralEnd_jordan`: the Jordan block `[[2, 1], [0, 2]]` is integral; integrality
reads the characteristic polynomial `(T − 2)²`. -/
example : IsIntegralEnd (Matrix.toLin' !![(2 : ℚ), 1; 0, 2]) := by
  sorry

/-! ## The p-adic couple of a pure number (`DeligneWeightsAndPurity:DWP.7/newton-couples-3-3-7`) -/

section NewtonCouple

variable {K : Type*} [Field K]

/-- The couple `(v(α), v(q^n α⁻¹))` of Weil II (3.3.7), for an additive valuation `v` normalised
by `v q = 1`. -/
def newtonCouple (v : AddValuation K (WithTop ℚ)) (q : K) (n : ℤ) (α : K) :
    WithTop ℚ × WithTop ℚ :=
  (v α, v (q ^ n * α⁻¹))

theorem newtonCouple_fst_add_snd (v : AddValuation K (WithTop ℚ)) {q : K} (hq : v q = 1)
    (n : ℤ) {α : K} (hα : α ≠ 0) :
    (newtonCouple v q n α).1 + (newtonCouple v q n α).2 = ((n : ℚ) : WithTop ℚ) := by
  sorry

theorem newtonCouple_nonneg (v : AddValuation K (WithTop ℚ))
    (hv : ∀ x : K, IsIntegral ℤ x → 0 ≤ v x) (q : K) (n : ℤ) {α : K} (hα : IsIntegral ℤ α)
    (hα' : IsIntegral ℤ (q ^ n * α⁻¹)) :
    0 ≤ (newtonCouple v q n α).1 ∧ 0 ≤ (newtonCouple v q n α).2 := by
  sorry

theorem newtonCouple_swap_conj (v : AddValuation K (WithTop ℚ)) {q : K} (hq : q ≠ 0) (n : ℤ)
    {α : K} (hα : α ≠ 0) :
    newtonCouple v q n (q ^ n * α⁻¹) = (newtonCouple v q n α).swap := by
  sorry

theorem newtonCouple_galois (v : AddValuation K (WithTop ℚ)) (τ : K ≃+* K) {q : K}
    (hq : τ q = q) (n : ℤ) (α : K) :
    newtonCouple (v.comap (τ : K →+* K)) q n α = newtonCouple v q n (τ α) := by
  sorry

theorem newtonCouple_mul (v : AddValuation K (WithTop ℚ)) {q : K} (hq : q ≠ 0)
    (n m : ℤ) (α β : K) :
    newtonCouple v q (n + m) (α * β) = newtonCouple v q n α + newtonCouple v q m β := by
  sorry

theorem newtonCouple_div_pow (v : AddValuation K (WithTop ℚ)) {q : K} (hq : v q = 1)
    (hq0 : q ≠ 0) (n m : ℤ) (α : K) :
    newtonCouple v q n α =
      newtonCouple v q (n - 2 * m) (α * (q ^ m)⁻¹) + (((m : ℚ) : WithTop ℚ), ((m : ℚ) : WithTop ℚ)) := by
  sorry

end NewtonCouple

/-- Test `newtonCouple_fst_add_snd`: for `v q = 1` and `α ≠ 0`, `r + s = n`. -/
example {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (q α : K) (hq : v q = 1)
    (hα : α ≠ 0) :
    (newtonCouple v q 1 α).1 + (newtonCouple v q 1 α).2 = ((1 : ℚ) : WithTop ℚ) := by
  sorry

/-- Test `newtonCouple_supersingular`: if `α² = −p` and `v p = 1`, the couple of `α` (weight
`1`, `q = p`) is `(1/2, 1/2)`. -/
example {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (p α : K) (hp : v p = 1)
    (hα : α ^ 2 = -p) :
    newtonCouple v p 1 α = (((1 / 2 : ℚ) : WithTop ℚ), ((1 / 2 : ℚ) : WithTop ℚ)) := by
  sorry

/-- Test `newtonCouple_ordinary`: `q = 5`, `α = 1 + 2i` with `v α = 1` at the place over `5`
dividing it: the couple is `(1, 0)`. -/
example {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (α : K) (h5 : v 5 = 1)
    (hα : v α = 1) (hα0 : α ≠ 0) :
    newtonCouple v 5 1 α = (((1 : ℚ) : WithTop ℚ), ((0 : ℚ) : WithTop ℚ)) := by
  sorry

/-- Test `newtonCouple_tate`: `α = q^m` (weight `2m`) has couple `(m, m)`. -/
example {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (q : K) (hq : v q = 1)
    (hq0 : q ≠ 0) (m : ℕ) :
    newtonCouple v q (2 * m) (q ^ m) = (((m : ℚ) : WithTop ℚ), ((m : ℚ) : WithTop ℚ)) := by
  sorry

/-- Test `newtonCouple_nonintegral`: `α = q⁻¹` (weight `−2`) has couple `(−1, −1)`. -/
example {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (q : K) (hq : v q = 1)
    (hq0 : q ≠ 0) :
    newtonCouple v q (-2) q⁻¹ = (((-1 : ℚ) : WithTop ℚ), ((-1 : ℚ) : WithTop ℚ)) := by
  sorry

/-- Test `newtonCouple_zero_base`: the multiplication formula fails for a zero base and
integer weights `1` and `−1`. This catches the missing `q ≠ 0` hypothesis. -/
example {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) :
    newtonCouple v 0 (1 + (-1)) (1 * 1) ≠
      newtonCouple v 0 1 1 + newtonCouple v 0 (-1) 1 := by
  sorry

/-! ## Geometric semisimplicity (`DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity`)

A lisse sheaf on a normal connected `X₀` over `𝔽_q` is a representation `ρ` of the Weil group
`W(X₀, x̄)`; geometric semisimplicity is semisimplicity of its restriction to the geometric
fundamental group `π₁(X, x̄)`. -/

section GeometricSemisimplicity

variable {E W V : Type*} [Field E] [Group W] [AddCommGroup V] [Module E V]

/-- `ρ` restricted to the subgroup `G` (the geometric fundamental group) is semisimple. -/
def IsGeometricallySemisimple (ρ : Representation E W V) (G : Subgroup W) : Prop :=
  IsSemisimpleModule (MonoidAlgebra E G) (Representation.asModule (ρ.comp G.subtype))

/-- The geometric monodromy group `ρ(G)` (Weil II (1.1.15)). -/
def geometricMonodromyGroup (ρ : Representation E W V) (G : Subgroup W) :
    Submonoid (V →ₗ[E] V) :=
  MonoidHom.mrange (ρ.comp G.subtype)

/-- A finite-dimensional semisimple representation restricts semisimply to a normal subgroup.
The irreducible case already exists at the Tau Ceti pin as
`TauCeti.Representation.isSemisimpleRepresentation_comp_subtype` in
`TauCeti/RepresentationTheory/Induction/Clifford/Basic.lean`; apply it to each irreducible summand.
This Mathlib-only file gives the wrapper's signature, without redeveloping Clifford theory. -/
theorem IsGeometricallySemisimple.of_isSemisimple [FiniteDimensional E V] (ρ : Representation E W V)
    (G : Subgroup W) [G.Normal] (h : IsSemisimpleModule (MonoidAlgebra E W) ρ.asModule) :
    IsGeometricallySemisimple ρ G := by
  sorry

/-- Membership in the image submonoid; each represented endomorphism is invertible. -/
theorem mem_geometricMonodromyGroup (ρ : Representation E W V) (G : Subgroup W)
    (a : V →ₗ[E] V) :
    a ∈ geometricMonodromyGroup ρ G ↔ ∃ g : G, ρ g = a := by
  sorry

end GeometricSemisimplicity

/-- Test `isGeometricallySemisimple_jordan`: on `Spec 𝔽_q` (trivial geometric group) the Weil
sheaf on which `F` acts by `[[1, 1], [0, 1]]` is geometrically semisimple but not arithmetically
semisimple. -/
example (ρ : Representation ℚ (Multiplicative ℤ) (Fin 2 → ℚ))
    (hρ : ρ (Multiplicative.ofAdd 1) = Matrix.toLin' !![(1 : ℚ), 1; 0, 1]) :
    IsGeometricallySemisimple ρ ⊥ ∧
      ¬ IsSemisimpleModule (MonoidAlgebra ℚ (Multiplicative ℤ)) ρ.asModule := by
  sorry

/-- Test `not_isGeometricallySemisimple_kummer`: a geometric monodromy group generated by a
nontrivial unipotent element (the Kummer extension of `ℚ̄_ℓ` by `ℚ̄_ℓ(1)` on `𝔾_m`) is not
semisimple. -/
example (ρ : Representation ℚ (Multiplicative ℤ) (Fin 2 → ℚ))
    (hρ : ρ (Multiplicative.ofAdd 1) = Matrix.toLin' !![(1 : ℚ), 1; 0, 1]) :
    ¬ IsGeometricallySemisimple ρ ⊤ := by
  sorry

/-- Test `isGeometricallySemisimple_point`: with trivial geometric group every representation is
geometrically semisimple. -/
example {W V : Type*} [Group W] [AddCommGroup V] [Module ℚ V] (ρ : Representation ℚ W V) :
    IsGeometricallySemisimple ρ ⊥ := by
  sorry

/-- Test `isGeometricallySemisimple_of_semisimple`: semisimple implies semisimple on a normal
subgroup. -/
example {W V : Type*} [Group W] [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]
    (ρ : Representation ℚ W V) (G : Subgroup W) [G.Normal]
    (h : IsSemisimpleModule (MonoidAlgebra ℚ W) ρ.asModule) : IsGeometricallySemisimple ρ G := by
  sorry

end TauCeti.Weights

namespace TauCeti.HardLefschetz

/-! ## Linear algebra of hard Lefschetz (`DWP.9/invariant-form-on-invariants-4-1-4`,
`DWP.9/alternating-forms-have-even-rank`, `DWP.9/lefschetz-decomposition-of-a-graded-operator`) -/

section InvariantForm

variable {K G V : Type*} [Field K] [Group G] [AddCommGroup V] [Module K V] [FiniteDimensional K V]

/-- Weil II (4.1.4): an invariant nondegenerate bilinear form on a completely reducible
representation is nondegenerate on the invariants. -/
theorem restrict_invariants_nondegenerate (ρ : Representation K G V)
    [IsSemisimpleModule (MonoidAlgebra K G) ρ.asModule] (B : LinearMap.BilinForm K V)
    (hB : ∀ g x y, B (ρ g x) (ρ g y) = B x y) (hnd : B.Nondegenerate) :
    (B.restrict ρ.invariants).Nondegenerate := by
  sorry

end InvariantForm

/-- Acceptance of (4.1.4): without complete reducibility the conclusion fails; for the unipotent
action of `ℤ` on `ℚ²` and `B = det`, the invariant line is isotropic. -/
example (ρ : Representation ℚ (Multiplicative ℤ) (Fin 2 → ℚ))
    (hρ : ρ (Multiplicative.ofAdd 1) = Matrix.toLin' !![(1 : ℚ), 1; 0, 1])
    (B : LinearMap.BilinForm ℚ (Fin 2 → ℚ)) (hB : ∀ x y, B x y = x 0 * y 1 - x 1 * y 0) :
    ¬ (B.restrict ρ.invariants).Nondegenerate := by
  sorry

section EvenRank

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]

/-- A finite-dimensional space with a nondegenerate alternating form has even dimension. -/
theorem even_finrank_of_isAlt_of_nondegenerate (B : LinearMap.BilinForm K V) (hA : B.IsAlt)
    (hN : B.Nondegenerate) : Even (Module.finrank K V) := by
  sorry

end EvenRank

section LefschetzDecomposition

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]

/-- The primitive part `P^{n−r} = V^{n−r} ∩ ker λ^{r+1}` of a graded operator, indexed by `ℤ`. -/
def primitivePiece (𝒱 : ℤ → Submodule K V) (lam : V →ₗ[K] V) (n : ℤ) (r : ℕ) :
    Submodule K V :=
  𝒱 (n - r) ⊓ LinearMap.ker (lam ^ (r + 1))

/-- Deligne (1968) (1.5)–(1.6): for a grading `V = ⊕ V^j` (`V^j = 0` outside `[0, 2n]`) and a
degree-2 operator `λ` with `λ^r : V^{n−r} ≅ V^{n+r}` for `0 ≤ r ≤ n`, each `V^{n−r}` is the
internal direct sum of the `λ^k P^{n−r−2k}`. -/
theorem iSupIndep_lefschetzDecomposition (𝒱 : ℤ → Submodule K V) (h𝒱 : DirectSum.IsInternal 𝒱)
    (n : ℕ) (hout : ∀ j : ℤ, (j < 0 ∨ 2 * (n : ℤ) < j) → 𝒱 j = ⊥) (lam : V →ₗ[K] V)
    (hlam : ∀ j : ℤ, ∀ x ∈ 𝒱 j, lam x ∈ 𝒱 (j + 2))
    (hHL : ∀ r : ℕ, r ≤ n → Set.BijOn (lam ^ r) (𝒱 ((n : ℤ) - r)) (𝒱 ((n : ℤ) + r)))
    (r : ℕ) (hr : r ≤ n) :
    iSupIndep (fun k : ℕ => (primitivePiece 𝒱 lam n (r + 2 * k)).map (lam ^ k)) ∧
      (⨆ k : ℕ, (primitivePiece 𝒱 lam n (r + 2 * k)).map (lam ^ k)) = 𝒱 ((n : ℤ) - r) := by
  sorry

/-- The dimension count `dim P^{n−r} = dim V^{n−r} − dim V^{n−r−2}`. -/
theorem finrank_primitivePiece (𝒱 : ℤ → Submodule K V) (h𝒱 : DirectSum.IsInternal 𝒱) (n : ℕ)
    (hout : ∀ j : ℤ, (j < 0 ∨ 2 * (n : ℤ) < j) → 𝒱 j = ⊥) (lam : V →ₗ[K] V)
    (hlam : ∀ j : ℤ, ∀ x ∈ 𝒱 j, lam x ∈ 𝒱 (j + 2))
    (hHL : ∀ r : ℕ, r ≤ n → Set.BijOn (lam ^ r) (𝒱 ((n : ℤ) - r)) (𝒱 ((n : ℤ) + r)))
    (r : ℕ) (hr : r ≤ n) :
    (Module.finrank K (primitivePiece 𝒱 lam n r) : ℤ) =
      Module.finrank K (𝒱 ((n : ℤ) - r)) - Module.finrank K (𝒱 ((n : ℤ) - r - 2)) := by
  sorry

/-- The Lefschetz pairings `ψ_r(x, y) = B(λ^r x, y)` are nondegenerate on `V^{n−r}` when `B` is a
nondegenerate form pairing `V^a` with `V^{2n−a}` for which `λ` is self-adjoint. -/
theorem lefschetzPairing_nondegenerate (𝒱 : ℤ → Submodule K V) (h𝒱 : DirectSum.IsInternal 𝒱)
    (n : ℕ) (hout : ∀ j : ℤ, (j < 0 ∨ 2 * (n : ℤ) < j) → 𝒱 j = ⊥) (lam : V →ₗ[K] V)
    (hlam : ∀ j : ℤ, ∀ x ∈ 𝒱 j, lam x ∈ 𝒱 (j + 2))
    (hHL : ∀ r : ℕ, r ≤ n → Set.BijOn (lam ^ r) (𝒱 ((n : ℤ) - r)) (𝒱 ((n : ℤ) + r)))
    (B : LinearMap.BilinForm K V) (hB : B.Nondegenerate)
    (hdeg : ∀ a b : ℤ, a + b ≠ 2 * n → ∀ x ∈ 𝒱 a, ∀ y ∈ 𝒱 b, B x y = 0)
    (hadj : ∀ x y, B (lam x) y = B x (lam y)) (r : ℕ) (hr : r ≤ n) :
    ((B.comp (lam ^ r) LinearMap.id).restrict (𝒱 ((n : ℤ) - r))).Nondegenerate ∧
      ((B.comp (lam ^ r) LinearMap.id).restrict (primitivePiece 𝒱 lam n r)).Nondegenerate := by
  sorry

end LefschetzDecomposition

end TauCeti.HardLefschetz
