/-
Suggested Lean prototypes for the roadmap "Automorphic Galois Representations PartII"
(AutomorphicGaloisRepresentationsPartII), part AG2.0 (stages AG2.0–AG2.5).

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/AutomorphicGaloisRepresentationsPartII--AG2.0.md` is definitive. The statements below
suggest Lean forms so that contributors and reviewers converge on names and signatures. Every proof of a planned
result that is not a short computation is `sorry`; nothing here is claimed to be formalised (implementationStatus =
unchecked). Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Only
Mathlib is imported.

Names are relative to the namespace `TauCeti.AutomorphicGalois` and agree with the `api` and `tests` names of the packet
`research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.0.json`. Unit tests are `example`s whose docstring
begins "Test `<name>`". Objects of other roadmaps are never invented here: automorphic representations of `GL_n(𝔸_F)`
and their infinitesimal characters (AutomorphicFormsOnReductiveGroups AF.1/AF.4), Satake parameters
(IntegralHeckeAndGaloisDeterminants IHG.3), algebraic Hecke characters and global reciprocity (Tau Ceti GlobalNumberFields
and ClassFieldTheory) and continuous `ℓ`-adic Galois representations (ArithmeticGaloisRepresentations R01) are not
available at the pinned commits, so the statements that need them are comments naming the missing object.

What is prototyped is the combinatorics of the normalisation dictionary: dominant weights and the sets `(ℤⁿ)_w`, their
base change, the Hodge–Tate multiset of a weight with its regularity, polarity and twist rules, the Hecke polynomial
`P_v(X)` with its Satake factorisation in small rank, the parity computation behind the sign of the multiplier
(sourceIssue AutomorphicGaloisRepresentationsPartII/E2), and the complex conjugation of a CM field as it acts on
embeddings.
-/

import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.RingTheory.Polynomial.Vieta
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.FinCases

namespace TauCeti.AutomorphicGalois

open Polynomial

/-! ## AG2.0 — dominant weights (`AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w`)

`DominantWeight.xi` (the representation `Ξ_a`): not stated; it needs the irreducible algebraic representations of `GL_n`
with given highest weight (AutomorphicFormsOnReductiveGroups AF.4). -/

/-- `(ℤⁿ)^{ι,+}`: a dominant weight `a_{τ,1} ≥ ⋯ ≥ a_{τ,n}` at each embedding `τ ∈ ι` (0-indexed in `Fin n`). -/
def DominantWeight (n : ℕ) (ι : Type*) : Type _ := ι → {a : Fin n → ℤ // Antitone a}

namespace DominantWeight

variable {n : ℕ} {ι : Type*}

/-- `a ∈ (ℤⁿ)_w` for the involution `c` of the embeddings: `a_{τ,i} + a_{cτ,n+1−i} = w`. -/
def IsInW (c : ι → ι) (w : ℤ) (a : DominantWeight n ι) : Prop :=
  ∀ τ (i : Fin n), (a τ).1 i + (a (c τ)).1 i.rev = w

/-- `a_{F′}`: the weight at `τ′` is the weight at its restriction `f τ′`. -/
def baseChange {ι' : Type*} (f : ι' → ι) (a : DominantWeight n ι) : DominantWeight n ι' :=
  fun τ => a (f τ)

open scoped Classical in
/-- Extremely regular (BLGGT §2.1): at some `τ`, equal-size sets of the numbers `a_{τ,i} + n − 1 − i` with equal sums
coincide. -/
def IsExtremelyRegular (a : DominantWeight n ι) : Prop :=
  ∃ τ, ∀ H H' : Finset (Fin n), H.card = H'.card →
    (∑ i ∈ H, ((a τ).1 i + ((n - 1 - i : ℕ) : ℤ))) = (∑ i ∈ H', ((a τ).1 i + ((n - 1 - i : ℕ) : ℤ))) → H = H'

/-- `isInW_baseChange`: base change along a restriction compatible with complex conjugation preserves `(ℤⁿ)_w`. -/
theorem isInW_baseChange {ι' : Type*} (c : ι → ι) (c' : ι' → ι') (f : ι' → ι)
    (hf : ∀ τ, f (c' τ) = c (f τ)) {w : ℤ} {a : DominantWeight n ι} (h : a.IsInW c w) :
    (a.baseChange f).IsInW c' w := by
  intro τ i
  simp only [baseChange, hf]
  exact h (f τ) i

end DominantWeight

/-- A dominant weight of rank two, `(x, y)` with `y ≤ x`. -/
def mk2 (x y : ℤ) (h : y ≤ x) : {a : Fin 2 → ℤ // Antitone a} :=
  ⟨![x, y], by intro i j hij; fin_cases i <;> fin_cases j <;> simp_all⟩

/-- Test `DominantWeight.isInW_classical`: the weight `(k − 2, 0)` of a classical weight-`k` form lies in `(ℤ²)_{k−2}`
(one embedding, conjugation trivial). -/
example (k : ℤ) (hk : 2 ≤ k) :
    DominantWeight.IsInW id (k - 2) (fun _ : Unit => mk2 (k - 2) 0 (by omega) : DominantWeight 2 Unit) := by
  intro τ i
  fin_cases i <;> simp [mk2, Fin.rev]

/-- Test `DominantWeight.not_isInW_unpaired`: `a_τ = (1, 0)`, `a_{cτ} = (0, 0)` lies in no `(ℤ²)_w`. -/
example : ¬ ∃ w, DominantWeight.IsInW (fun b => !b) w
    (fun b : Bool => if b then mk2 1 0 (by norm_num) else mk2 0 0 le_rfl : DominantWeight 2 Bool) := by
  rintro ⟨w, h⟩
  have h1 := h true 0
  have h2 := h true 1
  simp [mk2, Fin.rev] at h1 h2
  omega

/-- Test `DominantWeight.not_dominant`: `(0, 1)` is not dominant. -/
example : ¬ Antitone (![0, 1] : Fin 2 → ℤ) := by
  intro h
  have := h (show (0 : Fin 2) ≤ 1 by decide)
  simp at this

-- Test `DominantWeight.isInW_rank_one`: for `n = 1` every `a` is dominant and `IsInW c w a ↔ ∀ τ, a τ + a (c τ) = w`.
example {ι : Type*} (c : ι → ι) (w : ℤ) (a : DominantWeight 1 ι) :
    a.IsInW c w ↔ ∀ τ, (a τ).1 0 + (a (c τ)).1 0 = w :=
  sorry

/-- For a CM field, the conjugate of an embedding is the embedding precomposed with complex conjugation, so the two
forms of the condition defining `(ℤⁿ)_w` agree (`Mathlib`'s `IsCMField.complexEmbedding_complexConj`). -/
theorem conjugate_eq_comp_complexConj {K : Type*} [Field K] [NumberField K] [NumberField.IsCMField K]
    (τ : K →+* ℂ) :
    NumberField.ComplexEmbedding.conjugate τ = τ.comp (NumberField.IsCMField.complexConj K).toRingHom := by
  ext x
  simp [NumberField.ComplexEmbedding.conjugate_coe_eq,
    NumberField.IsCMField.complexEmbedding_complexConj]

/-! ## AG2.0 — regular algebraic, polarized, and the field of rationality
(`…:AG2.0/regular-algebraic-of-weight`, `…:AG2.0/polarized-automorphic-representation`,
`…:AG2.0/polarized-galois-representation`, `…:AG2.0/galois-character-of-an-algebraic-hecke-character`,
`…:AG2.0/galois-representation-attached-at-good-places`, `…:AG2.0/field-of-rationality`)

`IsRegularAlgebraic`, `HasWeight`, `IsConjSelfDual`, `IsEssConjSelfDual`, `PolarizedAutRep`, `PolarizedRep`,
`AlgHeckeChar.galoisChar`, `IsAttached` and `fieldOfRationality`: not stated; they need automorphic representations of
`GL_n(𝔸_F)` with infinitesimal characters (AF.1/AF.4), algebraic Hecke characters with global reciprocity (Tau Ceti
GlobalNumberFields layers 9–10, ClassFieldTheory layer 11), continuous `ℓ`-adic representations (R01.1) and the
group `𝒢_n` (GlobalGaloisDeformations G7). The sign computation they rest on is below. -/

/-- `…:AG2.0/sign-of-the-polarization-multiplier`: with `χ_v(−1) = (−1)^{n+w}` the multiplier
`µ(c_v) = (−1)^{n−1} (−1)^w χ_v(−1)` is `−1`. -/
example (n w : ℕ) (hn : 1 ≤ n) : ((-1 : ℤ)) ^ (n - 1) * (-1) ^ w * (-1) ^ (n + w) = -1 := by
  rw [← pow_add, ← pow_add]
  have : n - 1 + w + (n + w) = 2 * (n + w - 1) + 1 := by omega
  rw [this, pow_succ, pow_mul]
  norm_num

/-- Test `not_totallyOdd_blggt_sign_odd_w` (its arithmetic): with BLGGT's printed `χ_v(−1) = (−1)^n` and `w` odd, the
multiplier is even, `µ(c_v) = +1` (sourceIssue AutomorphicGaloisRepresentationsPartII/E2). -/
example (n w : ℕ) (hn : 1 ≤ n) (hw : Odd w) : ((-1 : ℤ)) ^ (n - 1) * (-1) ^ w * (-1) ^ n = 1 := by
  obtain ⟨k, rfl⟩ := hw
  rw [← pow_add, ← pow_add]
  have : n - 1 + (2 * k + 1) + n = 2 * (n + k) := by omega
  rw [this, pow_mul]
  norm_num

/-! ## AG2.0 — the Hodge–Tate multiset of a weight (`…:AG2.0/expected-hodge-tate-multiset`) -/

/-- `HT_τ(a) = {a_{τ,i} + n − i}` (BLGGT's convention `HT(ε_l) = {−1}`), with `Fin n` 0-indexed. -/
def expectedHodgeTate {n : ℕ} (a : Fin n → ℤ) : Multiset ℤ :=
  Multiset.map (fun i : Fin n => a i + ((n - 1 - i : ℕ) : ℤ)) Finset.univ.val

/-- `expectedHodgeTate_strictAnti`: the shifted weights of a dominant weight are strictly decreasing, so the multiset
has `n` distinct elements (regularity). -/
theorem expectedHodgeTate_strictAnti {n : ℕ} {a : Fin n → ℤ} (ha : Antitone a) :
    StrictAnti fun i : Fin n => a i + ((n - 1 - i : ℕ) : ℤ) := by
  intro i j hij
  have h1 := ha hij.le
  have h2 : (n - 1 - (j : ℕ)) < n - 1 - (i : ℕ) := by
    have := j.isLt
    have : (i : ℕ) < j := hij
    omega
  have : ((n - 1 - (j : ℕ) : ℕ) : ℤ) < ((n - 1 - (i : ℕ) : ℕ) : ℤ) := by exact_mod_cast h2
  linarith

/-- `expectedHodgeTate_conj`: for `a ∈ (ℤⁿ)_w`, the Hodge–Tate numbers at `cτ` are `w + n − 1` minus those at `τ`,
entry by entry. -/
theorem expectedHodgeTate_conj {n : ℕ} {ι : Type*} (c : ι → ι) {w : ℤ} {a : DominantWeight n ι}
    (h : a.IsInW c w) (τ : ι) (i : Fin n) :
    (a (c τ)).1 i + ((n - 1 - i : ℕ) : ℤ) =
      (w + ((n - 1 : ℕ) : ℤ)) - ((a τ).1 i.rev + ((n - 1 - i.rev : ℕ) : ℤ)) := by
  have h1 := h τ i.rev
  rw [Fin.rev_rev] at h1
  have hi := i.isLt
  rw [Fin.val_rev]
  omega

/-- `expectedHodgeTate_twist`: twisting the weight by `−t` (`π ↦ π ⊗ ‖det‖^t`) subtracts `t` from every element. -/
theorem expectedHodgeTate_twist {n : ℕ} (a : Fin n → ℤ) (t : ℤ) :
    expectedHodgeTate (fun i => a i - t) = (expectedHodgeTate a).map (· - t) := by
  simp only [expectedHodgeTate, Multiset.map_map]
  congr 1
  funext i
  simp only [Function.comp_apply]
  ring

/-- Test `expectedHodgeTate_classical`: `n = 2`, `a = (k − 2, 0)` with `k = 12` gives `{11, 0}`. -/
example : expectedHodgeTate ![(10 : ℤ), 0] = {11, 0} := by decide

-- Test `expectedHodgeTate_zero`: `a = 0` gives `{n − 1, …, 1, 0}`.
example (n : ℕ) : expectedHodgeTate (0 : Fin n → ℤ) =
    Multiset.map (fun i : Fin n => ((n - 1 - i : ℕ) : ℤ)) Finset.univ.val :=
  sorry

/-! ## AG2.0 — the Hecke polynomial (`…:AG2.0/frobenius-polynomial-and-conventions`)

`CorrespondsAtGeom`, `correspondsAtGeom_iff_dual` and the unramified-place statements: not stated; they need unramified
representations of `GL_n(F_v)` with their spherical Hecke algebra (IHG.3) and Frobenius elements in `G_F`. -/

/-- `P_v(X) = Σ_{i=0}^{n} (−1)^i q^{i(i−1)/2} t_i X^{n−i}`, where `t_i` is the eigenvalue of `T_{v,i}` (`t_0 = 1`). -/
noncomputable def heckePolynomial {R : Type*} [CommRing R] (n : ℕ) (q : R) (t : ℕ → R) : R[X] :=
  ∑ i ∈ Finset.range (n + 1), C ((-1) ^ i * q ^ (i * (i - 1) / 2) * t i) * X ^ (n - i)

/-- `heckePolynomial_eq_prod`: with the unitary Satake normalisation `t_i = q^{i(n−i)/2} e_i(α)` (`s² = q`),
`P_v = ∏ (X − q^{(n−1)/2} α_j)`. -/
theorem heckePolynomial_eq_prod {R : Type*} [CommRing R] (n : ℕ) (q s : R) (hs : s ^ 2 = q)
    (α : Fin n → R) :
    heckePolynomial n q (fun i => s ^ (i * (n - i)) *
        ∑ S ∈ Finset.univ.powersetCard i, ∏ j ∈ S, α j) =
      ∏ j, (X - C (s ^ (n - 1) * α j)) :=
  sorry

/-- Test `heckePolynomial_eq_prod_two` (evaluated): `x² − s(α + β)x + q·αβ = (x − sα)(x − sβ)` when `q = s²`. -/
example {R : Type*} [CommRing R] (s α β x : R) :
    x ^ 2 - (s * (α + β)) * x + s ^ 2 * (α * β) = (x - s * α) * (x - s * β) := by ring

/-- Acceptance, `n = 3` (evaluated): `x³ − t₁x² + q t₂ x − q³ t₃ = ∏ (x − qα_j)` for `t₁ = q e₁`, `t₂ = q e₂`, `t₃ = e₃`. -/
example {R : Type*} [CommRing R] (q a b c x : R) :
    x ^ 3 - (q * (a + b + c)) * x ^ 2 + q * (q * (a * b + b * c + c * a)) * x - q ^ 3 * (a * b * c) =
      (x - q * a) * (x - q * b) * (x - q * c) := by ring

/-- Test `heckePolynomial_arith_vs_geom` (its arithmetic): if `β₁ + β₂ = −24` and `β₁β₂ = 2¹¹` (Δ at `2`), the
reciprocal roots have sum `−24/2¹¹` and product `2⁻¹¹`, so `ρ_Δ`'s geometric polynomial is `X² + 24·2⁻¹¹X + 2⁻¹¹`. -/
example (b1 b2 : ℚ) (hs : b1 + b2 = -24) (hp : b1 * b2 = 2 ^ 11) :
    1 / b1 + 1 / b2 = -24 / 2 ^ 11 ∧ 1 / b1 * (1 / b2) = 1 / 2 ^ 11 := by
  have h1 : b1 ≠ 0 := by rintro rfl; norm_num at hp
  have h2 : b2 ≠ 0 := by rintro rfl; norm_num at hp
  constructor
  · rw [div_add_div _ _ h1 h2, ← hp]; field_simp; linarith
  · rw [div_mul_div_comm, ← hp]; ring

-- Test `heckePolynomial_rank_one`: `P_v = X − t₁` when `n = 1` and `t₀ = 1`.
example {R : Type*} [CommRing R] (q : R) (t : ℕ → R) (h0 : t 0 = 1) :
    heckePolynomial 1 q t = X - C (t 1) :=
  sorry

-- Test `heckePolynomial_twist` (`n = 2`, evaluated, `u = q^t`): roots `β_j/u` give `u⁻²·P(u x)`.
example (b1 b2 u x : ℚ) (hu : u ≠ 0) :
    (x - b1 / u) * (x - b2 / u) = (u * x - b1) * (u * x - b2) / u ^ 2 := by
  field_simp

/-! ## Theorems needing objects of other roadmaps

* `…:AG2.0/the-normalization-dictionary-fixed-by-the-sources`, `…:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`,
  `…:AG2.4/hltt-construction-of-nonselfdual-systems`, `…:AG2.5/varma-semisimplified-comparison-and-monodromy-bound`,
  `…:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`: not stated; they need cuspidal automorphic representations of
  `GL_n(𝔸_F)`, the local Langlands correspondence `rec` (EndoscopicTransferAndUnitaryTraceComparison ET.6), Weil–Deligne
  representations and continuous `ℓ`-adic representations of `G_F`.
-/

end TauCeti.AutomorphicGalois
