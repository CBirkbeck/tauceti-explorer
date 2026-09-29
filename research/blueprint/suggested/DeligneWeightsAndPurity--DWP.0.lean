/-
Suggested Lean prototypes for the roadmap "Deligne weights, purity and the Weil bounds" (DeligneWeightsAndPurity),
part DWP.0 (stages DWP.0–DWP.6 and DWP.10); checkpoints 1–4 plan stages DWP.0–DWP.3.

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/DeligneWeightsAndPurity--DWP.0.md` is definitive. The statements below suggest Lean forms so
that contributors and reviewers converge on names and signatures. A planned result whose proof is not short is `sorry`,
and nothing here is claimed to be formalised (implementationStatus = unchecked). The short proofs that are given
(`iotaWeight_mul`, `iotaWeight_inv`, `twist_twist`, `comp_aeval_of_comp` and `eq_zero_of_isCoprime_charpoly`, the last
saying that disjoint spectra have no nonzero intertwiner) are complete. Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Only Mathlib is imported.

Names are relative to the namespace `TauCeti.Weights` and agree with the `api` and `tests` names of the packet
`research/blueprint/packets/DeligneWeightsAndPurity--DWP.0.json`. Unit tests are `example`s whose docstring begins
"Test `<name>`". Weights are read off characteristic polynomials: no eigenbasis and no semisimplicity is assumed.
-/

import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Base
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.Minpoly.Field
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.RingTheory.PowerSeries.Basic

open Polynomial

namespace TauCeti.Weights

/-! ## Weil q-numbers (`DeligneWeightsAndPurity:DWP.0/weil-q-number`) -/

section WeilNumber

variable {K : Type*} [Field K] [Algebra ℚ K]

/-- `IsWeilNumber q n α`: `α` is algebraic over `ℚ` and every complex root of its minimal polynomial has absolute value
`q ^ (n / 2)` (Weil II (1.2.1)). Algebraicity is a clause: the minimal polynomial of a transcendental element is `0`. -/
def IsWeilNumber (q : ℝ) (n : ℤ) (α : K) : Prop :=
  IsAlgebraic ℚ α ∧ ∀ z ∈ (minpoly ℚ α).aroots ℂ, ‖z‖ = q ^ ((n : ℝ) / 2)

theorem IsWeilNumber.isAlgebraic {q : ℝ} {n : ℤ} {α : K} (h : IsWeilNumber q n α) : IsAlgebraic ℚ α := h.1

theorem IsWeilNumber.norm_eq {q : ℝ} {n : ℤ} {α : K} (h : IsWeilNumber q n α) (φ : K →+* ℂ) :
    ‖φ α‖ = q ^ ((n : ℝ) / 2) := by
  sorry

theorem isWeilNumber_iff_forall_embedding [Algebra.IsAlgebraic ℚ K] {q : ℝ} {n : ℤ} {α : K} :
    IsWeilNumber q n α ↔ ∀ φ : K →+* ℂ, ‖φ α‖ = q ^ ((n : ℝ) / 2) := by
  sorry

theorem isWeilNumber_map_iff {K' : Type*} [Field K'] [Algebra ℚ K'] (f : K →+* K') {q : ℝ} {n : ℤ} {α : K} :
    IsWeilNumber q n (f α) ↔ IsWeilNumber q n α := by
  sorry

theorem IsWeilNumber.of_aeval_eq_zero {q : ℝ} {n : ℤ} {α : K} {P : ℚ[X]} (hP : P ≠ 0) (hα : aeval α P = 0)
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

/-! ## Weil I §3 (`DeligneWeightsAndPurity:DWP.2/…`)

The sheaf-level statements need lisse ℓ-adic sheaves on curves and their compact cohomology, which neither pinned
library has. They are the node `weights-and-l-functions-of-lisse-sheaves-on-curves` (`LisseSheaf.HasWeight`,
`LisseSheaf.lFunction`), Theorem 3.2, `compact-cohomology-of-even-tensor-powers` and Corollaries 3.8–3.9. Their
suggested signatures are:

  def LisseSheaf.HasWeight (F₀ : LisseSheaf U₀ ℚ_ℓ) (β : ℤ) : Prop :=
    ∀ x : ClosedPoint U₀, IsPure ((q : ℝ) ^ x.deg) β (F₀.frob x)
  theorem fundamental_estimate (F₀ : LisseSheaf U₀ ℚ_ℓ) (β : ℤ) (ψ : F₀ ⊗ F₀ ⟶ ℚ_ℓ(-β))
      (hψ : ψ.Nondegenerate ∧ ψ.IsAlt) (hmono : IsOpen (F₀.geometricMonodromy : Set (Sp F₀.stalk ψ)))
      (hrat : ∀ x, ∀ i, (F₀.frobCharpoly x).coeff i ∈ Set.range (algebraMap ℚ ℚ_ℓ)) : F₀.HasWeight β

The power-series lemmas 3.3–3.5 are prototyped below. -/

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

/-! ## Weil estimate for abelian varieties and curves (`DeligneWeightsAndPurity:DWP.1/…`)

The objects are Tau Ceti's `AbelianVariety K` with the A6 characteristic polynomial and Rosati involution of
AbelianSchemesAndArithmeticModuli, which this environment cannot import. Suggested signatures:

  def frobeniusEndo (V : Over (Spec 𝔽_q)) : V ⟶ V
  theorem rosati_frobenius_mul (λ : Polarization A) : (π_A)† * π_A = (q : End⁰ A)
  theorem isWeilNumber_of_charpoly_frobenius (A : AbelianVariety (GaloisField p a)) :
      ∀ z ∈ (End.charpoly π_A).aroots ℂ, ‖z‖ = (q : ℝ) ^ (1 / 2 : ℝ)
  theorem card_points (A : AbelianVariety (GaloisField p a)) (m : ℕ) :
      Nat.card (A.points (GaloisField p (a * m))) = ((End.charpoly (π_A ^ m)).eval 1).natAbs

The complex-number core of the Hasse compatibility is proved below. -/

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

/-! ## Weil I §6: the rationality theorem (`DeligneWeightsAndPurity:DWP.3/…`)

The pencil, its vanishing system and the monodromy (LefschetzPencilsAndVanishingCycles LPV.3–LPV.5) are not available.
Suggested signatures:

  def Pencil.radicalQuotient (P : LefschetzPencil X₀) : LisseSheaf P.U₀ ℚ_ℓ
  theorem rationality_of_pencil_local_factors (P : LefschetzPencil X₀) (x : ClosedPoint P.U₀) (i : ℕ) :
      ((P.radicalQuotient.frobCharpoly x).coeff i) ∈ Set.range (algebraMap ℚ ℚ_ℓ)

The purely algebraic Lemma 6.7 is stated below. -/

section WeilI6

/-- Weil I Lemma 6.7: two finite families of elements of a field whose `n`-th powers agree for every large `n` divisible
by no element of a finite set `K ∌ 1` agree up to order (`powers-of-a-family-determine-the-family`). -/
theorem multiset_eq_of_pow_eq {F : Type*} [Field F] [DecidableEq F] (K : Finset ℕ) (hK : 1 ∉ K)
    (δ ε : Multiset F) (h : ∃ N, ∀ n ≥ N, (∀ k ∈ K, ¬ k ∣ n) → δ.map (· ^ n) = ε.map (· ^ n)) : δ = ε := by
  sorry

end WeilI6

end TauCeti.Weights
