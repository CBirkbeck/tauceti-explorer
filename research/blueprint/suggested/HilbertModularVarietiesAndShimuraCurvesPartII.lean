/-
Suggested Lean file for the roadmap
`HilbertModularVarietiesAndShimuraCurvesPartII`
(Hilbert modular varieties and Shimura curves, Part II: mod p cohomology of
Shimura curves at infinite level and Gelfand–Kirillov dimension).

This file is a planning aid, not a formalisation. It states, against Mathlib at
the pinned commit 082e2d3 (Tau Ceti f790474), the parts of the roadmap whose
carriers already exist at the pins: the numerical genericity conditions of the
generic global datum, the variable count of the patched ring, the commutative
algebra of freeness over scheme-theoretic supports (BHHMS Lemmas 8.1.2, 8.2.1
and 8.3.8), the Gram determinant behind the doubling at the auxiliary place,
and the arithmetic core of the lower bound for the Gelfand–Kirillov dimension.
Proofs are `sorry` except where a one-line tactic suffices.

Everything else in the roadmap (Shimura curves and their cohomology, patching
functors, the big patched module, Iwasawa algebras, grades and miracle
flatness, the freeness theorems for patched lattices, the Gelfand–Kirillov
dimension theorem, Banach lifts and big R = big T) needs carriers that are not
at the pins (completed group algebras of compact p-adic analytic groups are in
current Tau Ceti but not at f790474); those targets are stated in the README,
research/blueprint/readmes/HilbertModularVarietiesAndShimuraCurvesPartII.md.
-/
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.LocalRing.Defs
import Mathlib.RingTheory.Noetherian.Defs
import Mathlib.LinearAlgebra.Prod
import Mathlib.Algebra.Field.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

namespace TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurvesPartII

/-! ## GK.0 The generic global datum: numerical genericity -/

/-- BHHMS §8.1 (i)(a): the exponents `r_i` of the reducible inertial shape
`ω_f^{Σ p^i (r_i+1)} ⊕ 1` at `v` satisfy `12 ≤ r_i ≤ p − 15`. -/
def IsGenericReducibleExponents (p f : ℕ) (r : Fin f → ℕ) : Prop :=
  ∀ i, 12 ≤ r i ∧ r i + 15 ≤ p

/-- BHHMS §8.1 (i)(b): the exponents of the irreducible inertial shape satisfy
`13 ≤ r_0 ≤ p − 14` and `12 ≤ r_i ≤ p − 15` for `i > 0`. -/
def IsGenericIrreducibleExponents (p f : ℕ) (r : Fin f → ℕ) : Prop :=
  ∀ i : Fin f, (i.val = 0 → 13 ≤ r i ∧ r i + 14 ≤ p) ∧ (i.val ≠ 0 → 12 ≤ r i ∧ r i + 15 ≤ p)

instance (p f : ℕ) (r : Fin f → ℕ) : Decidable (IsGenericReducibleExponents p f r) := by
  unfold IsGenericReducibleExponents; infer_instance

instance (p f : ℕ) (r : Fin f → ℕ) : Decidable (IsGenericIrreducibleExponents p f r) := by
  unfold IsGenericIrreducibleExponents; infer_instance

/-- EGS15 Definition 2.1.1, reducible shape: `0 ≤ r_j ≤ p − 3`, not all `0`,
not all `p − 3`. -/
def IsEGSGenericReducible (p f : ℕ) (r : Fin f → ℕ) : Prop :=
  (∀ j, r j + 3 ≤ p) ∧ (∃ j, r j ≠ 0) ∧ (∃ j, r j + 3 ≠ p)

/-- EGS15 Definition 2.1.1, irreducible shape: `1 ≤ r_0 ≤ p − 2` and
`0 ≤ r_j ≤ p − 3` for `j > 0`. -/
def IsEGSGenericIrreducible (p f : ℕ) (r : Fin f → ℕ) : Prop :=
  ∀ j : Fin f, (j.val = 0 → 1 ≤ r j ∧ r j + 2 ≤ p) ∧ (j.val ≠ 0 → r j + 3 ≤ p)

/-- The exponent bounds force `p ≥ 27` (so `p ≥ 29` for a prime): BHHMS, remark
after the genericity conditions, p. 5. -/
theorem le_of_isGenericReducibleExponents {p f : ℕ} (hf : 0 < f) {r : Fin f → ℕ}
    (h : IsGenericReducibleExponents p f r) : 27 ≤ p := by
  have := h ⟨0, hf⟩
  omega

/-- The same bound in the irreducible shape. -/
theorem le_of_isGenericIrreducibleExponents {p f : ℕ} (hf : 0 < f) {r : Fin f → ℕ}
    (h : IsGenericIrreducibleExponents p f r) : 27 ≤ p := by
  have := (h ⟨0, hf⟩).1 rfl
  omega

/-- BHHMS genericity at `v` implies EGS15 genericity. -/
theorem isEGSGenericReducible_of_isGenericReducibleExponents {p f : ℕ} (hf : 0 < f)
    {r : Fin f → ℕ} (h : IsGenericReducibleExponents p f r) : IsEGSGenericReducible p f r := by
  refine ⟨fun j => ?_, ⟨⟨0, hf⟩, ?_⟩, ⟨⟨0, hf⟩, ?_⟩⟩
  · have := h j; omega
  · have := h ⟨0, hf⟩; omega
  · have := h ⟨0, hf⟩; omega

-- Unit tests (GK.0/generic-global-datum).
example : IsGenericReducibleExponents 29 1 (fun _ => 12) := by decide
example : IsGenericReducibleExponents 29 1 (fun _ => 14) := by decide
example : ¬ IsGenericReducibleExponents 29 1 (fun _ => 11) := by decide
example : ¬ IsGenericReducibleExponents 29 1 (fun _ => 15) := by decide
example : ¬ IsGenericReducibleExponents 23 1 (fun _ => 12) := by decide
example : IsGenericIrreducibleExponents 29 1 (fun _ => 15) := by decide
example : ¬ IsGenericIrreducibleExponents 29 1 (fun _ => 12) := by decide
example : IsGenericIrreducibleExponents 29 2 ![13, 12] := by decide

/-- EGS15 Remark 2.1.3: for `p = 3` and `f = 1` there is no reducible generic
representation. -/
example (r : Fin 1 → ℕ) : ¬ IsEGSGenericReducible 3 1 r := by
  rintro ⟨h1, ⟨j, hj⟩, -⟩
  have := h1 j
  omega

/-! ## GK.1 The patched ring: variable count (BHHMS (63)) -/

/-- Number of power-series variables of `R∞ ≅ W(𝔽)⟦X₁, …⟧`: `4|S| + q − 1 + 2f`. -/
def patchedRingNumVars (s q f : ℕ) : ℕ := 4 * s + q - 1 + 2 * f

/-- Number of variables of `S∞ = W(𝔽)⟦x₁, …, x_{4|S|+q−1}⟧`. -/
def auxiliaryRingNumVars (s q : ℕ) : ℕ := 4 * s + q - 1

/-- `R_{r̄_v}^{ψ_v}` has `3 + 3f` variables and `R∞` has `4(|S| − 1) + q − f` more. -/
theorem patchedRingNumVars_eq (s q f : ℕ) (hs : 1 ≤ s) (hq : f ≤ q) :
    (3 + 3 * f) + (4 * (s - 1) + q - f) = patchedRingNumVars s q f := by
  unfold patchedRingNumVars
  omega

/-- `dim R∞ − dim S∞ = 2f`. -/
theorem patchedRingNumVars_sub (s q f : ℕ) :
    patchedRingNumVars s q f - auxiliaryRingNumVars s q = 2 * f := by
  unfold patchedRingNumVars auxiliaryRingNumVars
  omega

/-- A type quotient `R∞^{(1,0),τ}` has the dimension of `S∞`: the local factor at
`v` has `3 + f` variables (BHHMS (63), EGS15 §6.4). -/
theorem typeQuotient_numVars (s q f : ℕ) (hs : 1 ≤ s) (hq : f ≤ q) :
    (3 + f) + (4 * (s - 1) + q - f) = auxiliaryRingNumVars s q := by
  unfold auxiliaryRingNumVars
  omega

example : patchedRingNumVars 1 1 1 = 6 := rfl
example : auxiliaryRingNumVars 1 1 = 4 := rfl

/-! ## GK.1 Cancellation of a power-series variable (BHHMS Lemma 8.1.2) -/

/-- Hamann's theorem in the form recorded as BHHMS Lemma 8.1.2. -/
theorem powerSeries_cancellation (R S : Type*) [CommRing R] [CommRing S]
    [IsLocalRing R] [IsLocalRing S] (e : PowerSeries R ≃+* PowerSeries S) :
    Nonempty (R ≃+* S) := by
  sorry

/-! ## GK.2 Freeness over the scheme-theoretic support -/

section FreeOverSupport

variable (A : Type*) [CommRing A]

/-- `M` is free of rank `r` over its scheme-theoretic support `A ⧸ Ann_A(M)`. -/
def IsFreeOverSupport (M : Type*) [AddCommGroup M] [Module A M] (r : ℕ) : Prop :=
  Nonempty (M ≃ₗ[A] (Fin r → A ⧸ Module.annihilator A M))

/-- `M` is generated by `r` elements. -/
def IsGeneratedBy (M : Type*) [AddCommGroup M] [Module A M] (r : ℕ) : Prop :=
  ∃ s : Fin r → M, Submodule.span A (Set.range s) = ⊤

variable {A}

/-- BHHMS Lemma 8.2.1. -/
theorem isFreeOverSupport_of_submodule {M : Type*} [AddCommGroup M] [Module A M]
    (N : Submodule A M) (r : ℕ) (hr : 1 ≤ r)
    (hN : IsFreeOverSupport A N r) (hQ : IsFreeOverSupport A (M ⧸ N) r)
    (hgen : IsGeneratedBy A M r)
    (hann : Nonempty ((↥(Module.annihilator A (M ⧸ N) : Submodule A A) ⧸
        Submodule.comap (Submodule.subtype (Module.annihilator A (M ⧸ N) : Submodule A A))
          (Module.annihilator A M : Submodule A A)) ≃ₗ[A]
        (A ⧸ Module.annihilator A N))) :
    IsFreeOverSupport A M r := by
  sorry

/-- The fibre product `M₁ ×_M M₂` as a submodule of `M₁ × M₂`. -/
def fibreProduct {M₁ M₂ M : Type*} [AddCommGroup M₁] [Module A M₁] [AddCommGroup M₂]
    [Module A M₂] [AddCommGroup M] [Module A M] (f₁ : M₁ →ₗ[A] M) (f₂ : M₂ →ₗ[A] M) :
    Submodule A (M₁ × M₂) :=
  LinearMap.ker (f₁.comp (LinearMap.fst A M₁ M₂) - f₂.comp (LinearMap.snd A M₁ M₂))

variable {M₁ M₂ M : Type*} [AddCommGroup M₁] [Module A M₁] [AddCommGroup M₂] [Module A M₂]
  [AddCommGroup M] [Module A M]

theorem mem_fibreProduct (f₁ : M₁ →ₗ[A] M) (f₂ : M₂ →ₗ[A] M) (x : M₁ × M₂) :
    x ∈ fibreProduct f₁ f₂ ↔ f₁ x.1 = f₂ x.2 := by
  simp [fibreProduct, sub_eq_zero]

/-- BHHMS Lemma 8.3.8, first assertion: for surjections onto `M`, the annihilator of
the fibre product is the intersection of the annihilators. -/
theorem annihilator_fibreProduct (f₁ : M₁ →ₗ[A] M) (f₂ : M₂ →ₗ[A] M)
    (h₁ : Function.Surjective f₁) (h₂ : Function.Surjective f₂) :
    Module.annihilator A (fibreProduct f₁ f₂) =
      Module.annihilator A M₁ ⊓ Module.annihilator A M₂ := by
  sorry

/-- BHHMS Lemma 8.3.8, equivalence (i) ⇔ (ii). -/
theorem isFreeOverSupport_fibreProduct_iff [IsLocalRing A] [IsNoetherianRing A]
    [Nontrivial M₁] [Nontrivial M₂] [Nontrivial M] (r : ℕ)
    (f₁ : M₁ →ₗ[A] M) (f₂ : M₂ →ₗ[A] M)
    (h₁ : Function.Surjective f₁) (h₂ : Function.Surjective f₂)
    (hM₁ : IsFreeOverSupport A M₁ r) (hM₂ : IsFreeOverSupport A M₂ r)
    (hM : IsFreeOverSupport A M r) :
    IsFreeOverSupport A (fibreProduct f₁ f₂) r ↔
      Module.annihilator A M = Module.annihilator A M₁ ⊔ Module.annihilator A M₂ := by
  sorry

/-- BHHMS Lemma 8.3.8, equivalence (ii) ⇔ (iii): the inclusion `⊇` always holds. -/
theorem annihilator_sup_le (f₁ : M₁ →ₗ[A] M) (f₂ : M₂ →ₗ[A] M)
    (h₁ : Function.Surjective f₁) (h₂ : Function.Surjective f₂) :
    Module.annihilator A M₁ ⊔ Module.annihilator A M₂ ≤ Module.annihilator A M := by
  sorry

end FreeOverSupport

-- Unit tests (freeness over supports).
example (A : Type*) [CommRing A] (I : Ideal A) : IsFreeOverSupport A (A ⧸ I) 1 := by
  sorry

example (A : Type*) [CommRing A] (I : Ideal A) (r : ℕ) :
    IsFreeOverSupport A (Fin r → A ⧸ I) r := by
  sorry

example (A : Type*) [CommRing A] (M : Type*) [AddCommGroup M] [Module A M] :
    IsGeneratedBy A M 0 ↔ Subsingleton M := by
  sorry

/-! ## GK.0 The doubling at the auxiliary place: the Gram determinant -/

/-- The determinant `(N + 1)² − S⁻¹T²` of the degeneracy Gram operator, evaluated at
the residual eigensystem (`S⁻¹T² = N (α + β)² / (αβ)`), factors as
`(N − α/β)(N − β/α)`; it is a unit exactly when `α/β ∉ {N, N⁻¹}`. -/
theorem gram_det_factor {K : Type*} [Field K] (N α β : K) (hα : α ≠ 0) (hβ : β ≠ 0) :
    (N + 1) ^ 2 - N * (α + β) ^ 2 / (α * β) = (N - α / β) * (N - β / α) := by
  field_simp
  ring

/-! ## GK.5 The arithmetic of the lower bound (BHHMS (80)–(81)) -/

/-- If the grade `3f − dim π` of `π^∨` is at most the grade `2f` of the big patched
module over `R∞⟦K₁/Z₁⟧`, then `dim π ≥ f`. -/
theorem le_gkDim_of_grade_le (f d : ℕ) (hd : d ≤ 3 * f) (hgrade : 3 * f - d ≤ 2 * f) :
    f ≤ d := by
  omega

end TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurvesPartII
