/-
Suggested Lean prototypes for the roadmap "Automorphic Galois Representations PartII"
(AutomorphicGaloisRepresentationsPartII), part AG2.0 (stages AG2.0–AG2.5).

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/AutomorphicGaloisRepresentationsPartII--AG2.0.md` is definitive. The statements below
suggest Lean forms so that contributors and reviewers converge on names and signatures. Noncomputational planned
results use `sorry`; nothing here is claimed to be formalised (implementationStatus =
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
import Mathlib.Data.Matrix.Mul

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











/-- Test `expectedHodgeTate_regular`: the shifted weight function is injective. -/
example {n : ℕ} {a : Fin n → ℤ} (ha : Antitone a) :
    Function.Injective (fun i : Fin n => a i + ((n - 1 - i : ℕ) : ℤ)) :=
  (expectedHodgeTate_strictAnti ha).injective

/-- Test `not_expectedHodgeTate_unshifted`: rank two weight zero has distinct shifted entries. -/
example : expectedHodgeTate (0 : Fin 2 → ℤ) ≠ ({0, 0} : Multiset ℤ) := by decide

/-! Numerical fragments of the new contracts. The actual geometric and Galois
objects remain omitted, individually, in the declaration ledger below. -/
namespace Fixtures

/-- Central exponent is separate from the sum of highest-weight entries. -/
def coefficientWeight (central highestWeightSum : ℤ) : ℤ :=
  -2 * central - highestWeightSum

/-- Shin's one-indexed labelled integer, with its similitude exponent. -/
def labelledInteger (central highestWeight : ℤ) (k : ℕ) : ℤ :=
  (k : ℤ) - 1 - highestWeight - central

/-- Nontrivial similitude character ν shifts weight and labelled integers. -/
example : coefficientWeight 1 0 = -2 ∧ labelledInteger 1 0 1 = -1 := by decide

/-- A trivial central character does not supply a nonzero shift. -/
example : coefficientWeight 0 0 = 0 ∧ labelledInteger 0 0 1 = 0 := by decide

example (t a : ℤ) (k : ℕ) :
    labelledInteger (a + t) 0 k = labelledInteger a 0 k - t := by
  simp [labelledInteger]
  ring

/-- Scalar factor in TY's relative-degree selector. This is not a global projector. -/
def selectorFactor (N : ℚ) (y : ℕ) (eigenvalue : ℚ) : ℚ :=
  (eigenvalue - N ^ y) / (N - N ^ y)

/-- Test `CoefficientProjector.denominator`, the two denominators. -/
example : (2 : ℚ) - 2 ^ 0 = 1 ∧ (2 : ℚ) - 2 ^ 2 = -2 := by norm_num

/-- Test `CoefficientProjector.degreeSelector`, scalar relative-degree fragment. -/
example : selectorFactor 2 0 1 = 0 ∧ selectorFactor 2 0 2 = 1 ∧
    selectorFactor 2 2 2 = 1 := by norm_num [selectorFactor]

/-- Rank sum in `DiscreteAssembly.rank`. Actual Galois direct sums are not stated. -/
def discreteRank (blocks : List (ℕ × ℕ)) : ℕ :=
  (blocks.map fun b => b.1 * b.2).sum

example : discreteRank [(1, 2)] = 2 ∧ discreteRank [(2, 1)] = 2 := by decide

/-- The normalized parameter exponent minus the constituent exponent is −n−j. -/
example (n ni j : ℚ) :
    (ni - 1) / 2 - j + (1 - 2 * n) / 2 - ni / 2 = -n - j := by ring

/-- Test `DiscreteAssembly.singleBlock`, the two different scalar exponents. -/
example : (-1 - (0 : ℤ), -1 - (1 : ℤ)) = (-1, -2) := by decide

/-- Modulus-M Hasse weight shift; M is positive in the actual theorem. -/
def hasseShift (p M j : ℕ) : ℕ := (p - 1) * p ^ (M - 1) * j

example : hasseShift 3 1 2 = 4 ∧ hasseShift 3 2 2 = 12 := by decide

/- The following are finite computations behind sourceIssue E3. They do not
declare WD purity or prove a theorem about Galois representations. R01.2 owns
those carriers and the full classification. A block of length d has rank
max(d−k,0) in its k-th monodromy power. -/
def blockPowerRank (blocks : List ℕ) (k : ℕ) : ℕ :=
  (blocks.map fun d => d - k).sum

example : blockPowerRank [4, 2] 1 = 4 ∧ blockPowerRank [3, 3] 1 = 4 := by decide

example : blockPowerRank [4, 2] 3 = 1 ∧ blockPowerRank [3, 3] 3 = 0 := by decide

def frobeniusFixture : Matrix (Fin 6) (Fin 6) ℚ :=
  fun i j => if i.val = j.val then
    if i.val = 0 then 8 else if i.val = 1 ∨ i.val = 2 then 2
    else if i.val = 3 ∨ i.val = 4 then 1 / 2 else 1 / 8
    else 0

def pureChainFixture : Matrix (Fin 6) (Fin 6) ℚ :=
  fun i j => if (i.val, j.val) ∈ ([(1, 0), (3, 1), (5, 3), (4, 2)] : List (ℕ × ℕ))
    then 1 else 0

def impureChainFixture : Matrix (Fin 6) (Fin 6) ℚ :=
  fun i j => if (i.val, j.val) ∈ ([(1, 0), (3, 1), (4, 2), (5, 4)] : List (ℕ × ℕ))
    then 1 else 0

set_option maxRecDepth 4096
set_option maxHeartbeats 2000000

/-- Both operators satisfy the geometric Weil relation F N = q⁻¹ N F for q=4. -/
example : frobeniusFixture * pureChainFixture =
    (1 / 4 : ℚ) • (pureChainFixture * frobeniusFixture) := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [Matrix.mul_apply, Fin.sum_univ_succ, Fin.val_succ, frobeniusFixture, pureChainFixture]

example : frobeniusFixture * impureChainFixture =
    (1 / 4 : ℚ) • (impureChainFixture * frobeniusFixture) := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [Matrix.mul_apply, Fin.sum_univ_succ, Fin.val_succ, frobeniusFixture, impureChainFixture]

example : (pureChainFixture ^ 3) 5 0 = 1 := by
  norm_num [pow_succ, Matrix.mul_apply, Fin.sum_univ_succ, Fin.val_succ, pureChainFixture]

example : impureChainFixture ^ 3 = 0 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [pow_succ, Matrix.mul_apply, Fin.sum_univ_succ, Fin.val_succ, impureChainFixture]

end Fixtures

end TauCeti.AutomorphicGalois


/-! ## Complete declaration and omission ledger

The mathematical packet is definitive. Entries below explicitly omit signatures
whose carriers are absent at the pinned baseline. Each API and test keeps its
packet name and statement. An omission is not an axiom or a proposition variable.
The numerical fragments above do not stand in for the omitted geometric objects.
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources` (comparison): Comparison of the early polynomial with normalized local Langlands.
Mathematical signature: For spherical π_v, after ET.6 fixes geometric Artin and the Harris–Taylor normalization, rec(π_v|det|^{(1−n)/2}) is unramified with Frobenius polynomial equal to the AG2.0 integral Hecke polynomial. Shin/Caraiani L_n is this geometric normalization. The square-root Satake extension cancels from the integral coefficients. rec^T is the corresponding arithmetic/rational normalization of the source; geometric-to-arithmetic Frobenius takes the normalized reciprocal polynomial. This is a comparison with the constructed local correspondence, and is not an early prerequisite for raw geometry.
Hypotheses: Use the chosen coefficient embedding and geometric Frobenius on both sides. Import the exact local reciprocity/Satake normalization from ET.6; do not invert roots in just one side.
Signature omitted where not prototyped above. Missing objects: the constructed global representation, genuine local WD parameter with N, local Langlands and the indicated geometric/purity comparison carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions; AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character; EndoscopicTransferAndUnitaryTraceComparison:ET.6; IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w` (definition): Dominant weights (ℤⁿ)^{Hom(F,Ω),+}, the subsets (ℤⁿ)_w for CM fields, base change of weights and the representations Ξ_a.
Mathematical signature: Specialize the imported AF.4 algebraic-weight carrier to Res GL_n; its coordinate notation and Ξ_a are aliases of that owner, not a second highest-weight theory. Let F be a number field, n ≥ 1 and Ω an algebraically closed field of characteristic 0. (ℤⁿ)^{Hom(F,Ω),+} is the set of a = (a_{τ,i}) with τ ∈ Hom(F, Ω), 1 ≤ i ≤ n and a_{τ,1} ≥ ⋯ ≥ a_{τ,n}. If F is totally real or CM, with complex conjugation c, and w ∈ ℤ, then (ℤⁿ)^{Hom(F,Ω)}_w is the set of a with a_{τ,i} + a_{τ∘c,n+1−i} = w for all τ and i (for Ω = ℂ this is the same as a_{τ,i} + a_{c∘τ,n+1−i} = w). For a finite extension F′/F, a_{F′} is given by (a_{F′})_{τ,i} = a_{τ|_F,i}. The weight a is extremely regular if for some τ, any two subsets H, H′ of {a_{τ,i} + n − i} of the same cardinality with equal sums are equal. For a ∈ (ℤⁿ)^{Hom(F,ℂ),+}, Ξ_a is the irreducible algebraic representation of GL_n^{Hom(F,ℂ)} that is the tensor product over τ of the irreducible representations of GL_n with highest weight a_τ.
Hypotheses: Dominance is the ordering a_{τ,1} ≥ ⋯ ≥ a_{τ,n}, with repetitions allowed; regularity of the attached Hodge–Tate numbers comes from the shift by n − i (node expected-hodge-tate-multiset), not from strictness of a. The condition defining (ℤⁿ)_w pairs τ with τ∘c and i with n + 1 − i. It is empty unless F is totally real or CM. Ξ_a is a representation of the complex group GL_n^{Hom(F,ℂ)} = (Res_{F/ℚ} GL_n)_ℂ. Its highest-weight theory is supplied by AutomorphicFormsOnReductiveGroups AF.4 (algebraic highest weights).
Signature omitted where not prototyped above. Missing objects: AF.4 irreducible algebraic GL_n coefficient representations; the weight functions themselves are prototyped above.
Direct owners/contracts: mathlib:NumberField.IsCMField.complexEmbedding_complexConj; AutomorphicFormsOnReductiveGroups:AF.4; AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight
-/
/- API `TauCeti.AutomorphicGalois.DominantWeight` (compatibility): The GL_n coordinate form of AF.4 AlgebraicWeight is ι → {a : Fin n → ℤ // Antitone a}; DominantWeight is this specialization, not a new general carrier.
Missing-object note: AF.4 irreducible algebraic GL_n coefficient representations; the weight functions themselves are prototyped above. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.DominantWeight.IsInW` (data): a.IsInW c w :⇔ ∀ τ i, a τ i + a (c τ) (rev i) = w, for an involution c of ι.
Missing-object note: AF.4 irreducible algebraic GL_n coefficient representations; the weight functions themselves are prototyped above. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.DominantWeight.baseChange` (constructor): (a.baseChange f) τ′ = a (f τ′) for the restriction f: Hom(F′, Ω) → Hom(F, Ω).
Missing-object note: AF.4 irreducible algebraic GL_n coefficient representations; the weight functions themselves are prototyped above. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.DominantWeight.IsExtremelyRegular` (data): Some τ has no two distinct equal-size subsets of {a τ i + n − 1 − i} with equal sums.
Missing-object note: AF.4 irreducible algebraic GL_n coefficient representations; the weight functions themselves are prototyped above. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.DominantWeight.xi` (compatibility): Ξ_a is the imported AF.4 representation V_a, identified with its embedding-wise tensor product; no highest-weight classification is reproved here.
Missing-object note: AF.4 irreducible algebraic GL_n coefficient representations; the weight functions themselves are prototyped above. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.DominantWeight.isInW_baseChange` (compatibility): a ∈ (ℤⁿ)_w implies a_{F′} ∈ (ℤⁿ)_w when F′ ⊇ F is CM or totally real.
Missing-object note: AF.4 irreducible algebraic GL_n coefficient representations; the weight functions themselves are prototyped above. A fragment already declared above is only the stated weight or polynomial computation. -/
/- Test `TauCeti.AutomorphicGalois.DominantWeight.isInW_classical` (value): For F = ℚ, n = 2 and a = (k − 2, 0): a is dominant and lies in (ℤ²)_{k−2}.
An example requiring the full object is omitted because AF.4 irreducible algebraic GL_n coefficient representations; the weight functions themselves are prototyped above. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.DominantWeight.isInW_rank_one` (degenerate): For n = 1 every a ∈ ℤ^{Hom(F,ℂ)} is dominant, and a ∈ (ℤ¹)_w iff a_τ + a_{cτ} = w for all τ.
An example requiring the full object is omitted because AF.4 irreducible algebraic GL_n coefficient representations; the weight functions themselves are prototyped above. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.DominantWeight.not_isInW_unpaired` (non-example): For F imaginary quadratic, n = 2, a_τ = (1, 0) and a_{cτ} = (0, 0): a_{τ,1} + a_{cτ,2} = 1 but a_{τ,2} + a_{cτ,1} = 0, so a lies in no (ℤ²)_w.
An example requiring the full object is omitted because AF.4 irreducible algebraic GL_n coefficient representations; the weight functions themselves are prototyped above. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.DominantWeight.not_dominant` (non-example): (0, 1) is not dominant: a definition with a_{τ,1} ≤ ⋯ ≤ a_{τ,n} would accept it.
An example requiring the full object is omitted because AF.4 irreducible algebraic GL_n coefficient representations; the weight functions themselves are prototyped above. The expressible scalar/weight examples above retain the available fragment only. -/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight` (definition): Regular algebraic automorphic representations of GL_n(𝔸_F) and their weight.
Mathematical signature: Let F be a number field and π an automorphic representation of GL_n(𝔸_F). π is regular algebraic if π_∞ has the same infinitesimal character as an irreducible algebraic representation of Res_{F/ℚ} GL_n. It has weight a ∈ (ℤⁿ)^{Hom(F,ℂ),+} if π_∞ has the same infinitesimal character as Ξ_a^∨. A regular algebraic π has a unique weight. Twisting: if ψ is an algebraic Hecke character of F with ψ|_{(F_∞^×)⁰}(x) = ∏_τ τ(x)^{−b_τ}, then π ⊗ (ψ∘det) has weight (a_{τ,i} + b_τ). In particular π ⊗ ‖det‖^t (t ∈ ℤ) has weight (a_{τ,i} − t).
Hypotheses: The infinitesimal character is compared with that of Ξ_a^∨, not Ξ_a; this is the convention of both BLGGT and ACC+. Regular algebraic is Clozel's C-algebraic for GL_n. It differs from L-algebraic by the twist ‖det‖^{(n−1)/2} when n is even. The C/L distinction is owned by AutomorphicFormsOnReductiveGroups AF.4 and is not re-planned here. No cuspidality, self-duality or unitarity is part of the definition.
Signature omitted where not prototyped above. Missing objects: AF.1 archimedean (g,K)-modules and their infinitesimal characters, AF.4 Ξ_a and adele automorphic representations.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w; AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight; AutomorphicFormsOnReductiveGroups:AF.4/infinitesimal-character-of-weight; AutomorphicFormsOnReductiveGroups:AF.1
-/
/- API `TauCeti.AutomorphicGalois.IsRegularAlgebraic` (data): π.IsRegularAlgebraic :⇔ ∃ a, π.HasWeight a.
Missing-object note: AF.1 archimedean (g,K)-modules and their infinitesimal characters, AF.4 Ξ_a and adele automorphic representations. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.HasWeight` (data): π.HasWeight a :⇔ infChar π_∞ = infChar (Ξ_a)^∨.
Missing-object note: AF.1 archimedean (g,K)-modules and their infinitesimal characters, AF.4 Ξ_a and adele automorphic representations. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.HasWeight.unique` (characterisation): π.HasWeight a → π.HasWeight b → a = b.
Missing-object note: AF.1 archimedean (g,K)-modules and their infinitesimal characters, AF.4 Ξ_a and adele automorphic representations. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.HasWeight.twist` (compatibility): π.HasWeight a → (π ⊗ ψ∘det).HasWeight (a + b) for ψ algebraic of exponents (b_τ).
Missing-object note: AF.1 archimedean (g,K)-modules and their infinitesimal characters, AF.4 Ξ_a and adele automorphic representations. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.HasWeight.twist_norm` (simp): (π ⊗ ‖det‖^t).HasWeight (a − t) ↔ π.HasWeight a.
Missing-object note: AF.1 archimedean (g,K)-modules and their infinitesimal characters, AF.4 Ξ_a and adele automorphic representations. A fragment already declared above is only the stated weight or polynomial computation. -/
/- Test `TauCeti.AutomorphicGalois.hasWeight_heckeCharacter` (value): n = 1: ψ with ψ_∞(x) = ∏ τ(x)^{−a_τ} on (F_∞^×)⁰ has weight (a_τ).
An example requiring the full object is omitted because AF.1 archimedean (g,K)-modules and their infinitesimal characters, AF.4 Ξ_a and adele automorphic representations. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.hasWeight_classical` (value): π_f ⊗ ‖det‖^{1−k/2} has weight (k − 2, 0) for a weight-k newform f.
An example requiring the full object is omitted because AF.1 archimedean (g,K)-modules and their infinitesimal characters, AF.4 Ξ_a and adele automorphic representations. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.not_isRegularAlgebraic_odd_weight_unitary` (non-example): π_f with f of odd weight k is not regular algebraic: its infinitesimal character (±(k − 1)/2) is not a shifted integral weight.
An example requiring the full object is omitted because AF.1 archimedean (g,K)-modules and their infinitesimal characters, AF.4 Ξ_a and adele automorphic representations. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.hasWeight_trivial` (degenerate): The trivial representation of GL_1(𝔸_F) has weight 0.
An example requiring the full object is omitted because AF.1 archimedean (g,K)-modules and their infinitesimal characters, AF.4 Ξ_a and adele automorphic representations. The expressible scalar/weight examples above retain the available fragment only. -/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation` (definition): Conjugate self-dual, essentially conjugate self-dual and polarized automorphic representations, with the multiplier character.
Mathematical signature: Let F be totally real or CM with maximal totally real subfield F⁺ and complex conjugation c, and π an automorphic representation of GL_n(𝔸_F). (i) π is conjugate self-dual if π^c ≅ π^∨. (ii) π is essentially conjugate self-dual with multiplier χ if χ: 𝔸_{F⁺}^×/(F⁺)^× → ℂ^× is continuous and π^c ≅ π^∨ ⊗ (χ ∘ N_{F/F⁺} ∘ det). (iii) (π, χ) is a polarized automorphic representation if moreover χ_v(−1) is independent of v | ∞. (iv) π is polarizable if some (π, χ) is polarized. (v) A regular algebraic polarized (π, χ) of weight a ∈ (ℤⁿ)_w with F imaginary is totally odd if χ_v(−1) = (−1)^{n+w} for all v | ∞. Here π^c = π ∘ c on GL_n(𝔸_F), and π^c = π when F is totally real.
Hypotheses: The multiplier χ is part of the data. It is determined by π only up to δ_{F/F⁺}, since δ_{F/F⁺} ∘ N_{F/F⁺} = 1. BLGGT impose instead χ_v(−1) = (−1)^n for F imaginary (printed with µ in place of χ). That is the correct normalisation only when w is even; with odd w it makes the Galois multiplier even (sourceIssue AutomorphicGaloisRepresentationsPartII/E2; node sign-of-the-polarization-multiplier). Condition (v) is the corrected form, and like BLGGT's it can always be achieved by replacing χ by χδ_{F/F⁺}. For regular algebraic (π, χ) of weight a ∈ (ℤⁿ)_w, χ is algebraic with |χ| = ‖·‖^{−w}. Conjugate self-duality is the case χ = 1, possible only when w = 0. For F totally real, polarized means essentially self-dual with χ_v(−1) independent of v. Patrikis shows the independence is automatic for regular algebraic cuspidal π; this packet does not use that.
Signature omitted where not prototyped above. Missing objects: AF.1 adele automorphic representations with dual/conjugation, global Hecke multiplier characters and their infinity components.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight; AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic
-/
/- API `TauCeti.AutomorphicGalois.IsConjSelfDual` (data): π.IsConjSelfDual :⇔ π^c ≅ π^∨.
Missing-object note: AF.1 adele automorphic representations with dual/conjugation, global Hecke multiplier characters and their infinity components. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.IsEssConjSelfDual` (data): π.IsEssConjSelfDual χ :⇔ π^c ≅ π^∨ ⊗ (χ ∘ N ∘ det).
Missing-object note: AF.1 adele automorphic representations with dual/conjugation, global Hecke multiplier characters and their infinity components. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.PolarizedAutRep` (structure): A pair (π, χ) with IsEssConjSelfDual and v ↦ χ_v(−1) constant on the real places.
Missing-object note: AF.1 adele automorphic representations with dual/conjugation, global Hecke multiplier characters and their infinity components. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.PolarizedAutRep.twistDelta` (constructor): (π, χ) ↦ (π, χ δ_{F/F⁺}), again polarized.
Missing-object note: AF.1 adele automorphic representations with dual/conjugation, global Hecke multiplier characters and their infinity components. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.PolarizedAutRep.IsTotallyOdd` (data): For regular algebraic (π, χ) of weight in (ℤⁿ)_w: χ_v(−1) = (−1)^{n+w} for v | ∞.
Missing-object note: AF.1 adele automorphic representations with dual/conjugation, global Hecke multiplier characters and their infinity components. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.PolarizedAutRep.exists_totallyOdd` (characterisation): Exactly one of (π, χ), (π, χδ_{F/F⁺}) is totally odd when F is imaginary.
Missing-object note: AF.1 adele automorphic representations with dual/conjugation, global Hecke multiplier characters and their infinity components. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.PolarizedAutRep.weight_mem_W` (relation): A regular algebraic polarized pair has weight in (ℤⁿ)_w with |χ| = ‖·‖^{−w}.
Missing-object note: AF.1 adele automorphic representations with dual/conjugation, global Hecke multiplier characters and their infinity components. A fragment already declared above is only the stated weight or polynomial computation. -/
/- Test `TauCeti.AutomorphicGalois.polarized_heckeCharacter_cm` (value): n = 1, ψ of weight (1, 0) over an imaginary quadratic field: (ψ, ψ|_{𝔸_ℚ}δ) is totally odd; (ψ, ψ|_{𝔸_ℚ}) is not.
An example requiring the full object is omitted because AF.1 adele automorphic representations with dual/conjugation, global Hecke multiplier characters and their infinity components. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.isConjSelfDual_iff_multiplier_one` (degenerate): π.IsConjSelfDual ↔ π.IsEssConjSelfDual 1.
An example requiring the full object is omitted because AF.1 adele automorphic representations with dual/conjugation, global Hecke multiplier characters and their infinity components. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.polarized_totallyReal` (compatibility): For F totally real, π^c = π and polarized means essentially self-dual with χ_v(−1) independent of v.
An example requiring the full object is omitted because AF.1 adele automorphic representations with dual/conjugation, global Hecke multiplier characters and their infinity components. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.not_totallyOdd_blggt_sign_odd_w` (non-example): A pair satisfying BLGGT's printed χ_v(−1) = (−1)^n with w odd (the CM elliptic curve character) is not totally odd: its Galois multiplier takes c_v to +1.
An example requiring the full object is omitted because AF.1 adele automorphic representations with dual/conjugation, global Hecke multiplier characters and their infinity components. The expressible scalar/weight examples above retain the available fragment only. -/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation` (comparison): BLGGT pairing conventions for the imported polarized carrier.
Mathematical signature: Use the continuous representation and polarized-extension carriers of R01.1 and G7. For CM F, the BLGGT pairing has symmetry ε_v=−μ(c_v), so total oddness is ε_v=1, equivalently μ(c_v)=−1; this is the convention bridge to the G_n-valued extension with multiplier μ. For totally real F, an invariant alternating (respectively symmetric) pairing has μ(c_v)=−ε_v (respectively ε_v) in the corresponding symplectic (respectively orthogonal) extension convention. Algebraic and regular conditions import the p-adic Hodge carrier, with HT(ε_ℓ)={−1}. This node specializes those carriers and does not construct a second deformation theory.
Hypotheses: The condition at one infinite place implies it at all of them, with ε_{v′} = µ(c_v c_{v′})ε_v and ⟨x, y⟩_{v′} = ⟨x, r(c_v c_{v′}) y⟩_v. For F imaginary, (r, µ) is polarized if and only if r extends to r̃: G_{F⁺} → 𝒢_n(Q̄_l) with multiplier µ, where 𝒢_n is the group of Clozel–Harris–Taylor (GlobalGaloisDeformations:G7/polarized-deformation-problem). For F totally real, (r, µ) is polarized if and only if r factors through GSp_n (µ(c_v) = −ε_v) or GO_n (µ(c_v) = ε_v) with multiplier µ. Hodge–Tate numbers use BLGGT's convention HT_τ(ε_l) = {−1}.
Signature omitted where not prototyped above. Missing objects: R01.1 continuous Galois representations and G7 polarized G_n extensions with multiplier; no replacement carrier is introduced.
Direct owners/contracts: ArithmeticGaloisRepresentations:R01.1/continuous-representation; ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist; GlobalGaloisDeformations:G7/polarized-deformation-problem; PadicHodgeTheory:R06.2
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character` (construction): The l-adic character r_{l,ι}(χ) of an algebraic Hecke character, its Hodge–Tate numbers and its weight.
Mathematical signature: Let F be a number field, l a prime and ι: Q̄_l ≅ ℂ, with Art_F normalised to send uniformisers to geometric Frobenius elements. Let χ: 𝔸_F^×/F^× → ℂ^× be algebraic: χ|_{(F_∞^×)⁰}(x) = ∏_{τ ∈ Hom(F,ℂ)} τ(x)^{−a_τ} with a_τ ∈ ℤ. There is a unique continuous character r_{l,ι}(χ): G_F → Q̄_l^× with ι ∘ r_{l,ι}(χ)|_{W_{F_v}} ∘ Art_{F_v} = χ_v for all v ∤ l; explicitly ι((r_{l,ι}(χ) ∘ Art_F)(x) ∏_τ (ι^{−1}τ)(x_l)^{a_τ}) = χ(x) ∏_τ (τ x_∞)^{a_τ}. It is de Rham above l with HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}}. The weight wt(χ) is the integer with |χ| = ‖·‖^{−wt(χ)/2}. Then a_τ + a_{τ′} = wt(χ) whenever τ|_{F₀} = τ′|_{F₀} ∘ c (F₀ the maximal CM subfield), wt(χ) is even when F₀ is totally real, wt(‖·‖_F) = −2, r_{l,ι}(‖·‖) = ε_l, and r_{l,ι}(χ)(c_v) = χ_v(−1)(−1)^{wt(χ)/2} at every real place v when F is totally real.
Hypotheses: The normalisation of Art_F (uniformisers ↦ geometric Frobenius) fixes r_{l,ι}(‖·‖) = ε_l. With the arithmetic normalisation it would be ε_l^{−1}. HT_τ(ε_l) = {−1} in this convention, consistent with HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}} and a = −1 for ‖·‖ over ℚ. The value at complex conjugation is computed at real places only: at a complex place there is no c_v in G_F.
Signature omitted where not prototyped above. Missing objects: global idele Hecke characters, the geometric Artin map, continuous ℓ-adic characters and R06.2 labelled p-adic Hodge conditions.
Direct owners/contracts: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic; ArithmeticGaloisRepresentations:R01.2/cyclotomic-and-dirichlet-characters; PadicHodgeTheory:R06.2
-/
/- API `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar` (constructor): r_{l,ι}(χ): G_F → Q̄_l^× for an algebraic Hecke character χ.
Missing-object note: global idele Hecke characters, the geometric Artin map, continuous ℓ-adic characters and R06.2 labelled p-adic Hodge conditions. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar_local` (characterisation): ι ∘ r_{l,ι}(χ)|_{W_{F_v}} ∘ Art_{F_v} = χ_v for v ∤ l.
Missing-object note: global idele Hecke characters, the geometric Artin map, continuous ℓ-adic characters and R06.2 labelled p-adic Hodge conditions. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.AlgHeckeChar.hodgeTate_galoisChar` (characterisation): HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}}.
Missing-object note: global idele Hecke characters, the geometric Artin map, continuous ℓ-adic characters and R06.2 labelled p-adic Hodge conditions. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.AlgHeckeChar.wt` (data): wt(χ) ∈ ℤ with |χ| = ‖·‖^{−wt(χ)/2}.
Missing-object note: global idele Hecke characters, the geometric Artin map, continuous ℓ-adic characters and R06.2 labelled p-adic Hodge conditions. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar_mul` (simp): r_{l,ι}(χ₁χ₂) = r_{l,ι}(χ₁) r_{l,ι}(χ₂).
Missing-object note: global idele Hecke characters, the geometric Artin map, continuous ℓ-adic characters and R06.2 labelled p-adic Hodge conditions. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar_norm` (simp): r_{l,ι}(‖·‖_F) = ε_l.
Missing-object note: global idele Hecke characters, the geometric Artin map, continuous ℓ-adic characters and R06.2 labelled p-adic Hodge conditions. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar_complexConj` (relation): For F totally real: r_{l,ι}(χ)(c_v) = χ_v(−1)(−1)^{wt(χ)/2}.
Missing-object note: global idele Hecke characters, the geometric Artin map, continuous ℓ-adic characters and R06.2 labelled p-adic Hodge conditions. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar_restrict` (functoriality): r_{l,ι}(χ|_{𝔸_{F⁺}^×}) = r_{l,ι}(χ) ∘ V, V: G_{F⁺}^{ab} → G_F^{ab} the transfer.
Missing-object note: global idele Hecke characters, the geometric Artin map, continuous ℓ-adic characters and R06.2 labelled p-adic Hodge conditions. A fragment already declared above is only the stated weight or polynomial computation. -/
/- Test `TauCeti.AutomorphicGalois.galoisChar_norm_rat` (value): F = ℚ: r_{l,ι}(‖·‖) = ε_l, with HT {−1} and wt −2.
An example requiring the full object is omitted because global idele Hecke characters, the geometric Artin map, continuous ℓ-adic characters and R06.2 labelled p-adic Hodge conditions. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.galoisChar_trivial` (degenerate): r_{l,ι}(1) = 1, with a = 0 and wt 0.
An example requiring the full object is omitted because global idele Hecke characters, the geometric Artin map, continuous ℓ-adic characters and R06.2 labelled p-adic Hodge conditions. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.galoisChar_finite_order` (compatibility): For ω of finite order unramified at p ∤ l: r_{l,ι}(ω)(Frob_p^{geom}) = ω_p(p), and r_{l,ι}(ω)(Frob_p^{arith}) = ω_p(p)^{−1}.
An example requiring the full object is omitted because global idele Hecke characters, the geometric Artin map, continuous ℓ-adic characters and R06.2 labelled p-adic Hodge conditions. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.galoisChar_restrict_complexConj` (non-example): For F imaginary and ψ algebraic on F, r_{l,ι}(ψ|_{𝔸_{F⁺}})(c_v) = +1 because the transfer sends c_v to c_v² = 1, whatever ψ_v(−1) is: the Galois sign is not χ_v(−1) unless wt/2 is even.
An example requiring the full object is omitted because global idele Hecke characters, the geometric Artin map, continuous ℓ-adic characters and R06.2 labelled p-adic Hodge conditions. The expressible scalar/weight examples above retain the available fragment only. -/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier` (lemma): The parity of the Galois multiplier of a polarized pair: µ(c_v) = (−1)^{n−1+w} χ_v(−1).
Mathematical signature: Let F be imaginary CM and (π, χ) a regular algebraic polarized automorphic representation of GL_n(𝔸_F) of weight a ∈ (ℤⁿ)_w. Put µ = ε_l^{1−n} r_{l,ι}(χ): G_{F⁺} → Q̄_l^×. Then µ(c_v) = (−1)^{n−1+w} χ_v(−1) for every v | ∞. Hence µ is totally odd if and only if χ_v(−1) = (−1)^{n+w}, i.e. (π, χ) is totally odd in the sense of polarized-automorphic-representation (v). Under BLGGT's printed normalisation χ_v(−1) = (−1)^n, µ(c_v) = (−1)^{w+1}: it is −1 exactly when w is even.
Hypotheses: The integer w is the one with a ∈ (ℤⁿ)_w. Theorem 2.1.1 of BLGGT uses a different integer, the purity weight w + n − 1 of r_{l,ι}(π). Only the multiplier's value at complex conjugation is computed. No Galois representation r_{l,ι}(π) is needed for the statement.
Signature omitted where not prototyped above. Missing objects: the named automorphic/Hecke/Galois objects in the prerequisites; the number-field embedding and finite combinatorics fragments are available above.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation; AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character; AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset` (definition): The Hodge–Tate multiset attached to a weight: HT_τ = {a_{ιτ,1} + n − 1, …, a_{ιτ,n}}.
Mathematical signature: For a ∈ (ℤⁿ)^{Hom(F,ℂ),+}, ι: Q̄_l ≅ ℂ and τ: F → Q̄_l, put HT_τ(a) = {a_{ι∘τ,i} + n − i : 1 ≤ i ≤ n}, a multiset of n integers, in BLGGT's convention HT_τ(ε_l) = {−1}. The elements are distinct, so a Galois representation with these Hodge–Tate numbers is regular. If F is CM and a ∈ (ℤⁿ)_w, then HT_{τ∘c}(a) = {w + n − 1 − h : h ∈ HT_τ(a)}. Twisting a by −t (π ↦ π ⊗ ‖det‖^t) subtracts t from every element, matching ⊗ ε_l^t. In the opposite convention (HT(ε_l) = +1) every element is negated.
Hypotheses: This is the target that AG2.6 proves for r_{l,ι}(π) (BLGGT Theorem 2.1.1(3), ACC+ Theorem 2.3.3(b)); here it is only the dictionary from a to a multiset. The integer w + n − 1 is BLGGT's w in Theorem 2.1.1(3). The two integers must not be confused.
Signature omitted where not prototyped above. Missing objects: the named automorphic/Hecke/Galois objects in the prerequisites; the number-field embedding and finite combinatorics fragments are available above.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w
-/
/- API `TauCeti.AutomorphicGalois.expectedHodgeTate` (constructor): expectedHodgeTate a = multiset of a i + (n − 1 − i), i : Fin n (0-indexed).
Missing-object note: the named automorphic/Hecke/Galois objects in the prerequisites; the number-field embedding and finite combinatorics fragments are available above. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.expectedHodgeTate_strictAnti` (characterisation): i ↦ a i + (n − 1 − i) is strictly antitone when a is antitone.
Missing-object note: the named automorphic/Hecke/Galois objects in the prerequisites; the number-field embedding and finite combinatorics fragments are available above. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.expectedHodgeTate_conj` (relation): a ∈ (ℤⁿ)_w ⇒ HT at τc is {w + n − 1 − h : h ∈ HT at τ}.
Missing-object note: the named automorphic/Hecke/Galois objects in the prerequisites; the number-field embedding and finite combinatorics fragments are available above. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.expectedHodgeTate_twist` (simp): expectedHodgeTate (a − t) = (expectedHodgeTate a).map (· − t).
Missing-object note: the named automorphic/Hecke/Galois objects in the prerequisites; the number-field embedding and finite combinatorics fragments are available above. A fragment already declared above is only the stated weight or polynomial computation. -/
/- Test `TauCeti.AutomorphicGalois.expectedHodgeTate_classical` (value): n = 2, a = (k − 2, 0) ↦ {k − 1, 0}; for k = 12, {11, 0}.
An example requiring the full object is omitted because the named automorphic/Hecke/Galois objects in the prerequisites; the number-field embedding and finite combinatorics fragments are available above. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.expectedHodgeTate_zero` (degenerate): a = 0 ↦ {n − 1, …, 1, 0}: parallel weight 0 gives the Hodge–Tate numbers of Symⁿ⁻¹ of the dual Tate module of an elliptic curve.
An example requiring the full object is omitted because the named automorphic/Hecke/Galois objects in the prerequisites; the number-field embedding and finite combinatorics fragments are available above. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.expectedHodgeTate_regular` (compatibility): The elements are pairwise distinct, so the multiset is regular in BLGGT's sense (|HT_τ| = n).
An example requiring the full object is omitted because the named automorphic/Hecke/Galois objects in the prerequisites; the number-field embedding and finite combinatorics fragments are available above. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.not_expectedHodgeTate_unshifted` (non-example): The unshifted multiset {a_{τ,i}} fails regularity for a = 0 and n ≥ 2, so the shift n − i is part of the definition.
An example requiring the full object is omitted because the named automorphic/Hecke/Galois objects in the prerequisites; the number-field embedding and finite combinatorics fragments are available above. The expressible scalar/weight examples above retain the available fragment only. -/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions` (comparison): Automorphic specialization of the integral Hecke polynomial.
Mathematical signature: Let v be a finite place of F with q_v = #k(v), π_v an unramified irreducible representation of GL_n(F_v), and t_{v,i} the eigenvalue on π_v^{GL_n(O_{F_v})} of T_{v,i} = [GL_n(O_{F_v}) diag(ϖ_v, …, ϖ_v, 1, …, 1) GL_n(O_{F_v})] (ϖ_v repeated i times). Define P_v(π_v; X) = Σ_{i=0}^n (−1)^i q_v^{i(i−1)/2} t_{v,i} X^{n−i}. If α₁, …, α_n are the Satake parameters of π_v, with t_{v,i} = q_v^{i(n−i)/2} e_i(α), then P_v(π_v; X) = ∏_j (X − q_v^{(n−1)/2} α_j). Conventions: a Galois representation r corresponds to π at v in the geometric convention (BLGGT, ACC+, HLTT: Frob_v geometric, Art uniformisers ↦ geometric Frobenius) if ι det(X − r(Frob_v)) = P_v(π_v; X). It corresponds in the arithmetic convention (IntegralHeckeAndGaloisDeterminants IHG.3, and R19) if the arithmetic Frobenius has characteristic polynomial P_v(π_v; X). r corresponds in one convention if and only if r^∨ corresponds in the other. Twists: P_v(π_v ⊗ ‖det‖^t; X) = q_v^{−tn} P_v(π_v; q_v^t X), matching r ↦ r ⊗ ε_l^t. The contragredient has roots q_v^{n−1}/β_j, where β_j are the roots for π_v, matching r ↦ r^∨ ⊗ ε_l^{1−n}.
Hypotheses: No local Langlands correspondence is used. For unramified π_v, 'r corresponds at v' is defined by the polynomial identity, which is what AG2.0 requires. Agreement with rec(π_v ⊗ |det|^{(1−n)/2}) for unramified π_v is an AG2.5 comparison. ACC+ say P_v corresponds to Frobenius on rec^T(π_v), their arithmetic normalisation of local Langlands (Clozel–Thorne §2.1), with Frob_v geometric in their notation. That is the geometric convention here.
Signature omitted where not prototyped above. Missing objects: the named automorphic/Hecke/Galois objects in the prerequisites; the number-field embedding and finite combinatorics fragments are available above.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight; IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial; IntegralHeckeAndGaloisDeterminants:IHG.3/gln-satake-coefficients; IntegralHeckeAndGaloisDeterminants:IHG.3/charpoly-scalar-twist; IntegralHeckeAndGaloisDeterminants:IHG.3/reciprocal-charpoly; IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion; AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places` (definition): A Galois representation attached to π at the good places, and its functoriality under twist, dual, conjugation and base change.
Mathematical signature: For regular algebraic cuspidal π, a coefficient isomorphism ι:Q̄_ℓ≅C, and a continuous semisimple rank-n representation r of G_F unramified outside a finite set, IsAttached(ι,r,π) means that outside a finite set of finite places v∤ℓ, π_v is spherical, r is unramified, and ι det(X−r(Frob_v^geom))=P_v(π_v;X). The exceptional set contains the ramification of π, F and r and the coefficient prime. Two such r are isomorphic by Frobenius density. This is a good-place condition; it asserts neither local Langlands compatibility at ramified places nor de Rham admissibility nor global existence.
Hypotheses: This is the property HLTT prove for every regular algebraic cuspidal π over a CM field (ACC+ Theorem 2.3.2). It is the interface that AG2.1–AG2.4 produce and AG2.5 strengthens. Nothing at the places in S, or above l, is asserted. Uniqueness needs semisimplicity. It uses Čebotarev and Brauer–Nesbitt (ArithmeticGaloisRepresentations R01.1/R01.5). The base-change clause needs the Satake parameters of BC(π)_w to be the q-power restrictions of those of π_v (the unramified base-change identity), requested from EndoscopicTransferAndUnitaryTraceComparison ET.7, which exports the Arthur–Clozel base-change steps to this roadmap.
Signature omitted where not prototyped above. Missing objects: AF.1 automorphic representations, IHG.3 spherical Hecke eigencharacters, R01.1 global representations and unramified Frobenius lifts.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions; AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight; ArithmeticGaloisRepresentations:R01.1/continuous-representation; ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent
-/
/- API `TauCeti.AutomorphicGalois.IsAttached` (data): r.IsAttached ι π :⇔ ∃ S finite, ∀ v ∉ S, r unramified at v ∧ ι det(X − r(Frob_v)) = P_v(π_v).
Missing-object note: AF.1 automorphic representations, IHG.3 spherical Hecke eigencharacters, R01.1 global representations and unramified Frobenius lifts. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.IsAttached.unique` (extensionality): r, r′ semisimple and both attached to π ⇒ r ≅ r′.
Missing-object note: AF.1 automorphic representations, IHG.3 spherical Hecke eigencharacters, R01.1 global representations and unramified Frobenius lifts. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.IsAttached.twist` (functoriality): r.IsAttached π → (r ⊗ r_{l,ι}(ψ)).IsAttached (π ⊗ ψ∘det).
Missing-object note: AF.1 automorphic representations, IHG.3 spherical Hecke eigencharacters, R01.1 global representations and unramified Frobenius lifts. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.IsAttached.dual` (functoriality): r.IsAttached π → (r^∨ ⊗ ε_l^{1−n}).IsAttached π^∨.
Missing-object note: AF.1 automorphic representations, IHG.3 spherical Hecke eigencharacters, R01.1 global representations and unramified Frobenius lifts. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TauCeti.AutomorphicGalois.IsAttached.conj` (functoriality): r.IsAttached π → r^c.IsAttached π^c.
Missing-object note: AF.1 automorphic representations, IHG.3 spherical Hecke eigencharacters, R01.1 global representations and unramified Frobenius lifts. A fragment already declared above is only the stated weight or polynomial computation. -/
/- Test `TauCeti.AutomorphicGalois.isAttached_heckeCharacter` (degenerate): n = 1: r_{l,ι}(ψ).IsAttached ι ψ.
An example requiring the full object is omitted because AF.1 automorphic representations, IHG.3 spherical Hecke eigencharacters, R01.1 global representations and unramified Frobenius lifts. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.isAttached_classical` (value): ρ_f^∨ is attached to π_f ⊗ ‖det‖^{1−k/2}; for Δ the polynomial at 2 is X² + 24X + 2^{11}.
An example requiring the full object is omitted because AF.1 automorphic representations, IHG.3 spherical Hecke eigencharacters, R01.1 global representations and unramified Frobenius lifts. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.not_isAttached_classical_rho` (non-example): ρ_f is not attached to π_f ⊗ ‖det‖^{1−k/2} (for Δ its geometric polynomial at 2 is X² + 24·2^{−11}X + 2^{−11}).
An example requiring the full object is omitted because AF.1 automorphic representations, IHG.3 spherical Hecke eigencharacters, R01.1 global representations and unramified Frobenius lifts. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TauCeti.AutomorphicGalois.isAttached_dual_twist` (compatibility): The two rules compose consistently: (r^∨ε^{1−n})^∨ε^{1−n} = r, matching π^∨∨ = π.
An example requiring the full object is omitted because AF.1 automorphic representations, IHG.3 spherical Hecke eigencharacters, R01.1 global representations and unramified Frobenius lifts. The expressible scalar/weight examples above retain the available fragment only. -/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality` (theorem): Rationality of the good Hecke polynomials.
Mathematical signature: Import M_π=C^{Aut(C/π^∞)} and Clozel rationality from AF.4. For regular algebraic cuspidal π on GL_n over a CM or totally real field, every spherical integral Hecke polynomial P_v(π_v;X) has coefficients in M_π. At good places the traces of any attached r therefore lie in ι^(−1)(M_π). This controls traces, not a model of r over (M_π)_λ: the Schur-index obstruction is supplied by R01.5. Coefficient conjugation sends M_π to M_{σπ}=σ(M_π).
Hypotheses: The definition uses π^∞ only. σπ^∞ is π^∞ with scalars extended along σ. M_π controls traces, not realisations. The field over which r can be written may be strictly larger, by a Schur-index obstruction, and AG2.7 states the realisation only after proving a finite coefficient field. Clozel's theorem is used with its exact hypotheses: π regular algebraic (cohomological) and cuspidal. It is not claimed for non-cuspidal or non-algebraic π.
Signature omitted where not prototyped above. Missing objects: the named automorphic/Hecke/Galois objects in the prerequisites; the number-field embedding and finite combinatorics fragments are available above.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions; AutomorphicFormsOnReductiveGroups:AF.4/rationality-field; AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality; ArithmeticGaloisRepresentations:R01.5/descent-obstruction
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris` (theorem): Arbitrary regular conjugate-self-dual existence.
Mathematical signature: For any CM F, regular algebraic conjugate-self-dual cuspidal π on GL_n(A_F), prime ℓ and coefficient isomorphism ι, there is a unique-up-to-isomorphism continuous semisimple rank-n r attached at good places. No odd-rank, slight-regularity, finite-place square-integrability, finite-slope, unramified-field or imaginary-quadratic-subfield hypothesis remains. CH Theorem 3.2.3 also proves domination away from ℓ and the de Rham/crystalline/semistable assertions, but those exports are assigned to AG2.5 and AG2.6. For an essentially polarized form apply the algebraic-character twist and undo it.
Hypotheses: Regular algebraic cuspidal and conjugate self-dual; n=1 comes from class field theory. The GSp₄ case is assigned to the dedicated proposed owner.
Signature omitted where not prototyped above. Missing objects: the definite-unitary automorphic eigenvariety and its continuous determinant, effective base change/patching and constructed Galois representation.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-index-induction; AutomorphicGaloisRepresentationsPartII:AG2.2/algebraic-character-polarization-twist; AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character; AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems` (theorem): HLTT existence over arbitrary CM and totally real fields.
Mathematical signature: For E totally real or CM and π regular algebraic cuspidal on GL_n(A_E), every prime p and coefficient isomorphism ι yield a continuous semisimple rank-n r attached at good places. HLTT Theorem 7.13 constructs it first for F=F₀F⁺ with p split in F₀ and the stated source good primes; Corollary 7.14 removes the auxiliary field restrictions by effective patching and proves unramifiedness and the normalized polynomial at all v|q≠p for rational q where π is unramified above q. No polarization is required; the theorem here asserts neither de Rham admissibility at p nor full monodromy at ramified primes.
Hypotheses: Regular algebraic cuspidal; geometric Artin and the common integral polynomial convention; n=1 supplied by the algebraic-character construction.
Signature omitted where not prototyped above. Missing objects: the ordinary mixed Shimura dagger/boundary cohomology, integral Hecke actions and continuous determinant/representation carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-factor-separation-specialization; AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching; AutomorphicGaloisRepresentationsPartII:AG2.3/s-general-solvable-extension-families; AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change; AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-semisimplified-comparison-and-monodromy-bound` (theorem): Varma’s semisimplified comparison and monodromy bound.
Mathematical signature: For E totally real or CM and regular algebraic cuspidal π on GL_n(A_E), the constructed r_{p,ι}(π) satisfies WD(r|_{G_{E_v}})^ss≅ι^−1rec(π_v|det|^{(1−n)/2})^ss for every v∤p, and WD(r|_{G_{E_v}})^{F-ss}≺ι^−1rec(π_v|det|^{(1−n)/2}). Extract the local bound from the varying-twist 2n family and then remove the split-place and auxiliary-CM restrictions by the source extension/descent argument. The comparison retains no asserted equality of monodromy for arbitrary nonselfdual π.
Hypotheses: Regular algebraic cuspidal; every v∤p; the source parameter convention and the full isotypic dominance relation.
Signature omitted where not prototyped above. Missing objects: the constructed global representation, genuine local WD parameter with N, local Langlands and the indicated geometric/purity comparison carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems; AutomorphicGaloisRepresentationsPartII:AG2.5/varma-monodromy-rank-bound; AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-factor-separation-specialization; AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching; AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness` (theorem): Caraiani’s full away-prime compatibility.
Mathematical signature: For CM L and regular algebraic CSD cuspidal π on GL_n(A_L), every prime ℓ and every v∤ℓ satisfy WD(r_{ℓ,ι}(π)|_{G_{L_v}})^{F-ss}≅ι^−1rec(π_v|det|^{(1−n)/2}) including N. Choose the source solvable extensions and two-signature tensor-square instance, prove its monodromy purity, descend purity to the rank-n representation, and combine with the semisimple local comparison and temperedness. This is full WD compatibility under the polarized source hypotheses, not a conclusion for arbitrary nonselfdual HLTT systems or for v|ℓ.
Hypotheses: Regular algebraic CSD cuspidal; v∤ℓ; source geometric normalization and coefficient embedding.
Signature omitted where not prototyped above. Missing objects: the constructed global representation, genuine local WD parameter with N, local Langlands and the indicated geometric/purity comparison carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris; AutomorphicGaloisRepresentationsPartII:AG2.5/ch-polarized-local-monodromy-bound; AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance; AutomorphicGaloisRepresentationsPartII:AG2.5/tensor-square-weight-spectral-sequence; AutomorphicGaloisRepresentationsPartII:AG2.5/pure-weil-deligne-comparison; AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation` (lemma): Twists, duals and conjugation preserve good-place attachment.
Mathematical signature: If IsAttached(ι,r,π), then IsAttached(ι,r⊗r(ψ),π⊗ψ∘det) for algebraic ψ; in particular norm^t corresponds to ε_ℓ^t. Also r^∨⊗ε_ℓ^(1−n) is attached to π^∨, and for CM F the conjugate r^c is attached to π^c. All conclusions are up to isomorphism and enlarge the finite excluded set by the character ramification.
Hypotheses: r semisimple and continuous; ψ algebraic; fixed geometric Artin/Frobenius normalization.
Signature omitted where not prototyped above. Missing objects: the named automorphic/Hecke/Galois objects in the prerequisites; the number-field embedding and finite combinatorics fragments are available above.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places; AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions; AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character; ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/unitary-similitude-central-character-dictionary` (comparison): The similitude character in a compact coefficient system.
Mathematical signature: For Shin’s compact similitude datum, write an algebraic coefficient ξ by its integral central exponent a₀(ξ) and dominant entries a(ξ)_{σ,1}≥⋯≥a(ξ)_{σ,n} for the chosen CM type. Its purity weight is w(ξ)=−2a₀(ξ)−Σ_{σ,i}a(ξ)_{σ,i}. The normalization of the coefficient sheaf and the extracted Galois constituent retains the GL₁-character ψ: the shifted labelled integers are j_κ(k)=k−1−a(ιξ)_{ικ,k}−a₀(ιξ). For ξ=ν^t, a₀=t and all a_{σ,i}=0, so w(ξ)=−2t and j_κ(k)=k−1−t. This is the required nontrivial central-character acceptance case.
Hypotheses: Use the chosen CM type and positive similitude component, with Shin §3.6 and §6.2 indexing; n≥1, t integral.
Signature omitted where not prototyped above. Missing objects: the named automorphic/Hecke/Galois objects in the prerequisites; the number-field embedding and finite combinatorics fragments are available above.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w; AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight; AutomorphicBundles:B2
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/prescribed-crystalline-twisting-character` (theorem): A crystalline character with prescribed p-adic unit type.
Mathematical signature: Let F be CM, p a prime, E/Q_p sufficiently large, S a finite ramification set containing the p-adic places, and ṽ a p-adic place split over F⁺. For the compatible algebraic local unit characters used in ACC+ §4.5.1, there is a continuous ψ:G_F→O_E^× crystalline at every place above p, unramified at ṽ and at S minus S_p, and with ψ∘Art_{F_{ṽc}} on units equal to ∏_{τ:F_{ṽ}→E}(τc)^(λ_{τ₀,1}+λ_{τ₀c,1}), where τ₀ maximizes that sum. Its labelled HT weights are 0 at ṽ and −λ_{τ₀,1}−λ_{τ₀c,1} at ṽc. Additional finite ramification is allowed outside S.
Hypotheses: The local prescriptions satisfy the global unit and totally real restriction compatibility of HSBT Lemma 2.2. This is the source’s split-place construction; arbitrary inconsistent local characters are excluded.
Signature omitted where not prototyped above. Missing objects: the named automorphic/Hecke/Galois objects in the prerequisites; the number-field embedding and finite combinatorics fragments are available above.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character; AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w; PadicHodgeTheory:R06.2
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance` (construction): The compact unitary PEL instance.
Mathematical signature: Under Shin §5.1, F=EF⁺ is CM, E imaginary quadratic, n≥3 odd, [F⁺:Q]≥2, and all rational primes ramified in F split in F/F⁺. Choose a CM embedding τ and the similitude datum of Lemma 5.1: signature (1,n−1) at τ and (0,n) at the other selected embeddings, quasi-split at all finite places and anisotropic modulo centre over Q. At sufficiently small level U the PEL moduli scheme X_U/F is smooth proper of dimension n−1 with universal abelian scheme A_U. For p split in E choose w|p: G(Q_p) has the GL_n(F_w) factor used for Drinfeld level, including when F_w/Q_p is ramified. The other split factors have the étale level structures of §5.2. Form A_U^m over X_U for m≥0.
Hypotheses: The positivity, determinant, polarization and level conditions are those of the chosen PEL datum, not those of the quasi-split signature (n,n) datum. Choose integral orders and sufficiently small levels as in §5.2; Drinfeld models require the distinguished split factor.
Signature omitted where not prototyped above. Missing objects: the compact PEL moduli scheme, universal polarized O_F-linear abelian scheme, reflex field and ramified Drinfeld integral charts.
Direct owners/contracts: PELModuli:M0; PELModuli:M4; IgusaVarietiesAndTorsionConcentration:IG.0/drinfeld-level-newton-strata
-/
/- API `CompactPEL.dimension` (characterisation): dim X_U=n−1; the universal abelian scheme has the relative dimension prescribed by this PEL representation.
Missing-object note: the compact PEL moduli scheme, universal polarized O_F-linear abelian scheme, reflex field and ramified Drinfeld integral charts. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `CompactPEL.levelPullback` (functoriality): Level inclusions give finite étale maps on generic fibres, with compatible universal abelian schemes.
Missing-object note: the compact PEL moduli scheme, universal polarized O_F-linear abelian scheme, reflex field and ramified Drinfeld integral charts. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `CompactPEL.kugaPower` (constructor): A_U^0=X_U and A_U^(m+1)=A_U^m×_{X_U}A_U.
Missing-object note: the compact PEL moduli scheme, universal polarized O_F-linear abelian scheme, reflex field and ramified Drinfeld integral charts. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `CompactPEL.drinfeldFactor` (compatibility): At w the integral level structure is the Drinfeld structure on the one-dimensional O_{F_w}-Barsotti–Tate factor.
Missing-object note: the compact PEL moduli scheme, universal polarized O_F-linear abelian scheme, reflex field and ramified Drinfeld integral charts. A fragment already declared above is only the stated weight or polynomial computation. -/
/- Test `CompactPEL.zeroPower` (degenerate): m=0 gives X_U, not an empty scheme.
An example requiring the full object is omitted because the compact PEL moduli scheme, universal polarized O_F-linear abelian scheme, reflex field and ramified Drinfeld integral charts. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `CompactPEL.signatureDimension` (small): n=3 gives a proper surface, not the quasi-split six-dimensional local symmetric space.
An example requiring the full object is omitted because the compact PEL moduli scheme, universal polarized O_F-linear abelian scheme, reflex field and ramified Drinfeld integral charts. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `CompactPEL.ramifiedFactor` (non-example): An unramified-only local datum cannot satisfy the API for ramified F_w.
An example requiring the full object is omitted because the compact PEL moduli scheme, universal polarized O_F-linear abelian scheme, reflex field and ramified Drinfeld integral charts. The expressible scalar/weight examples above retain the available fragment only. -/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector` (construction): The corrected Kuga–Sato coefficient projector.
Mathematical signature: For an irreducible algebraic ξ of the compact similitude group choose the TY §2 integers m_ξ,t_ξ and rational algebraic correspondence ε_ξ realizing L_ξ inside R^{m_ξ}(A_U^{m_ξ}/X_U)(t_ξ). For N≥2 let ε(m,N)=∏_{x=1}^m ∏_{0≤y≤2[F⁺:Q]n², y≠1}([N]_x−N^y)/(N−N^y), and set a_ξ=ε_ξ ε(m_ξ,N)^{2n−1}. Its action on global cohomology is idempotent and realizes the coefficient cohomology in the shifted degree. The exponent 2n−1 removes the Leray-filtration error: ε(m,N) alone is only the relative-degree selector.
Hypotheses: Q-coefficients; N≥2; sufficiently small U; the chosen realization of ξ and its central exponent a₀, CM type and Tate twist are retained.
Signature omitted where not prototyped above. Missing objects: algebraic correspondences on the PEL abelian power, étale Leray cohomology and B2/Schur–Weyl graded ξ realization; scalar factors alone are available.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance; AutomorphicGaloisRepresentationsPartII:AG2.0/unitary-similitude-central-character-dictionary; AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight; AutomorphicBundles:B2; tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-2-young-symmetrizers; tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-8-schur-weyl-duality
-/
/- API `CoefficientProjector.idempotent` (characterisation): a_ξ²=a_ξ on each global cohomology group after the 2n−1 correction.
Missing-object note: algebraic correspondences on the PEL abelian power, étale Leray cohomology and B2/Schur–Weyl graded ξ realization; scalar factors alone are available. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `CoefficientProjector.relativeDegree` (characterisation): The multiplier correspondence annihilates relative degrees other than m_ξ.
Missing-object note: algebraic correspondences on the PEL abelian power, étale Leray cohomology and B2/Schur–Weyl graded ξ realization; scalar factors alone are available. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `CoefficientProjector.centralTwist` (compatibility): Replacing ξ by ξ⊗ν^t changes the retained central character and Tate normalization according to the coefficient dictionary.
Missing-object note: algebraic correspondences on the PEL abelian power, étale Leray cohomology and B2/Schur–Weyl graded ξ realization; scalar factors alone are available. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `CoefficientProjector.level` (functoriality): a_ξ commutes with level pullback and the correspondences defining Hecke actions.
Missing-object note: algebraic correspondences on the PEL abelian power, étale Leray cohomology and B2/Schur–Weyl graded ξ realization; scalar factors alone are available. A fragment already declared above is only the stated weight or polynomial computation. -/
/- Test `CoefficientProjector.denominator` (small): For N=2, y=0, the denominator is 1; for y=2 it is −2.
An example requiring the full object is omitted because algebraic correspondences on the PEL abelian power, étale Leray cohomology and B2/Schur–Weyl graded ξ realization; scalar factors alone are available. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `CoefficientProjector.degreeSelector` (non-example): On H⁰ of one abelian factor the y=0 term annihilates the class; on H¹ every term acts as 1.
An example requiring the full object is omitted because algebraic correspondences on the PEL abelian power, étale Leray cohomology and B2/Schur–Weyl graded ξ realization; scalar factors alone are available. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `CoefficientProjector.zeroPower` (degenerate): The empty product m=0 is the identity and gives the trivial coefficient.
An example requiring the full object is omitted because algebraic correspondences on the PEL abelian power, étale Leray cohomology and B2/Schur–Weyl graded ξ realization; scalar factors alone are available. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `CoefficientProjector.lerayCorrection` (compatibility): The global selector uses the power 2n−1 even though its associated-graded selector is idempotent.
An example requiring the full object is omitted because algebraic correspondences on the PEL abelian power, étale Leray cohomology and B2/Schur–Weyl graded ξ realization; scalar factors alone are available. The expressible scalar/weight examples above retain the available fragment only. -/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/coefficient-projector-degree-identity` (lemma): Cohomology of the coefficient projector.
Mathematical signature: For every j, a_ξ H^j(A_U^{m_ξ}×_F F̄,Q̄_ℓ(t_ξ)) is canonically H^{j−m_ξ}(X_U×_F F̄,L_ξ) if j≥m_ξ, and zero otherwise. The identity is equivariant for Gal(F̄/F), level transitions and prime-to-level Hecke correspondences.
Hypotheses: Use the corrected a_ξ and the selected algebraic realization; ℓ invertible on the generic fibre.
Signature omitted where not prototyped above. Missing objects: the compact PEL tower, étale cohomology and algebraic correspondence actions, including its actual integral charts.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector; EtaleDualityAndPerverseSheaves:EDC.2
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology` (construction): Finite-level coefficient cohomology.
Mathematical signature: Define H^k_U(ξ)=H^k_et(X_U×_F F̄,L_ξ) as the corrected Kuga–Sato summand in degree k+m_ξ with twist t_ξ. Set H^k(ξ)=colim_U H^k_U(ξ) under pullback. This is a smooth admissible G(A_f)-representation with commuting continuous Gal(F̄/F)-action on finite-level invariants. Define H(ξ)=Σ_k(−1)^k[H^k(ξ)] only in the Grothendieck group, retaining the graded H^k separately.
Hypotheses: Small levels; ξ irreducible algebraic; Q̄_ℓ coefficients obtained from a finite ℓ-adic coefficient field; the finite-level étale finiteness and descent contracts.
Signature omitted where not prototyped above. Missing objects: étale coefficient cohomology of the compact PEL tower, finite-level descent, correspondence actions and smooth admissible adelic representations.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance; AutomorphicGaloisRepresentationsPartII:AG2.1a/coefficient-projector-degree-identity; EtaleDualityAndPerverseSheaves:EDC.2; SmoothRepresentationsOfLocalGroups:SR.0:abelian-category
-/
/- API `CoefficientCohomology.level` (functoriality): Compatible level pullbacks compose and commute with Galois.
Missing-object note: étale coefficient cohomology of the compact PEL tower, finite-level descent, correspondence actions and smooth admissible adelic representations. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `CoefficientCohomology.hecke` (functoriality): A double-coset correspondence acts by finite pullback followed by proper pushforward.
Missing-object note: étale coefficient cohomology of the compact PEL tower, finite-level descent, correspondence actions and smooth admissible adelic representations. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `CoefficientCohomology.invariants` (compatibility): Small-level invariants identify with the finite-level cohomology in characteristic zero.
Missing-object note: étale coefficient cohomology of the compact PEL tower, finite-level descent, correspondence actions and smooth admissible adelic representations. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `CoefficientCohomology.alternating` (constructor): The alternating sum is a Grothendieck class and is not declared an actual representation.
Missing-object note: étale coefficient cohomology of the compact PEL tower, finite-level descent, correspondence actions and smooth admissible adelic representations. A fragment already declared above is only the stated weight or polynomial computation. -/
/- Test `CoefficientCohomology.outsideRange` (degenerate): Degrees below 0 or above 2(n−1) vanish.
An example requiring the full object is omitted because étale coefficient cohomology of the compact PEL tower, finite-level descent, correspondence actions and smooth admissible adelic representations. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `CoefficientCohomology.trivialCoefficient` (compatibility): ξ=1 gives the usual étale cohomology of X_U.
An example requiring the full object is omitted because étale coefficient cohomology of the compact PEL tower, finite-level descent, correspondence actions and smooth admissible adelic representations. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `CoefficientCohomology.virtualCancellation` (non-example): A nonzero class appearing in two adjacent degrees cancels in H(ξ) but remains in both graded groups.
An example requiring the full object is omitted because étale coefficient cohomology of the compact PEL tower, finite-level descent, correspondence actions and smooth admissible adelic representations. The expressible scalar/weight examples above retain the available fragment only. -/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/hecke-galois-projector-commutation` (lemma): Commutation of the geometric actions.
Mathematical signature: On H^k_U(ξ), the Galois action commutes with every rational Hecke correspondence that is defined over F and with a_ξ. Passage between levels preserves this commutation and the Tate twist. In particular the cohomology is a joint module, not just a list of unrelated eigenvalues.
Hypotheses: Correspondences and the selected coefficient projector are defined over the reflex field.
Signature omitted where not prototyped above. Missing objects: the compact PEL tower, étale cohomology and algebraic correspondence actions, including its actual integral charts.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology; AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector; EtaleDualityAndPerverseSheaves:EDC.2
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-continuous-geometric-galois-action` (theorem): Finite continuous geometric Galois actions.
Mathematical signature: Every H^k_U(ξ) is finite-dimensional over a finite extension of Q_ℓ and has continuous Galois action; after scalar extension it is unramified away from finitely many places. For almost all y∤ℓ its Frobenius eigenvalues are algebraic and pure of weight k+w(ξ). These statements apply to actual finite-level summands, independently of local Langlands.
Hypotheses: Smooth proper X_U and the abelian-power projector; coefficient field of definition fixed.
Signature omitted where not prototyped above. Missing objects: the compact PEL tower, étale cohomology and algebraic correspondence actions, including its actual integral charts.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology; AutomorphicGaloisRepresentationsPartII:AG2.1a/hecke-galois-projector-commutation; EtaleDualityAndPerverseSheaves:EDC.2; DeligneWeightsAndPurity:DWP.7
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/automorphic-multiplicity-spaces` (construction): Automorphic multiplicity spaces in the tower.
Mathematical signature: For π^∞ irreducible admissible occurring in H^k(ξ), let R^k_{ξ,ℓ}(π^∞)=Hom_{G(A_f)}(π^∞,H^k(ξ)), with its commuting Galois action. In the characteristic-zero discrete automorphic decomposition of the compact tower, H^k(ξ)=⊕_{π∞}π^∞⊗R^k_{ξ,ℓ}(π^∞). R^k is finite-dimensional; R_{ξ,ℓ}(π∞)=Σ_k(−1)^k[R^k] remains a virtual representation.
Hypotheses: Compact quotient and the semisimple automorphic decomposition at the chosen central character; π∞ has finite-level invariants.
Signature omitted where not prototyped above. Missing objects: the actual smooth G(A_f) coefficient-cohomology tower and its discrete automorphic decomposition with continuous commuting Galois action.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology; AutomorphicGaloisRepresentationsPartII:AG2.1a/hecke-galois-projector-commutation; AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-continuous-geometric-galois-action; AutomorphicFormsOnReductiveGroups:AF.1; tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-1-simple-modules-schur-and-isotypic-components
-/
/- API `MultiplicitySpace.evaluation` (compatibility): The evaluation map π∞⊗Hom(π∞,H^k)→the π∞-isotypic summand is an isomorphism under the discrete semisimple decomposition.
Missing-object note: the actual smooth G(A_f) coefficient-cohomology tower and its discrete automorphic decomposition with continuous commuting Galois action. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `MultiplicitySpace.galois` (functoriality): Galois acts by postcomposition on Hom and commutes with evaluation.
Missing-object note: the actual smooth G(A_f) coefficient-cohomology tower and its discrete automorphic decomposition with continuous commuting Galois action. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `MultiplicitySpace.finite` (projection): Choose a small level with nonzero π∞ invariants to bound dim R^k by finite-level cohomology.
Missing-object note: the actual smooth G(A_f) coefficient-cohomology tower and its discrete automorphic decomposition with continuous commuting Galois action. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `MultiplicitySpace.virtual` (constructor): The virtual multiplicity is Σ_k(−1)^k[R^k].
Missing-object note: the actual smooth G(A_f) coefficient-cohomology tower and its discrete automorphic decomposition with continuous commuting Galois action. A fragment already declared above is only the stated weight or polynomial computation. -/
/- Test `MultiplicitySpace.absent` (degenerate): If π∞ is absent then every R^k is zero.
An example requiring the full object is omitted because the actual smooth G(A_f) coefficient-cohomology tower and its discrete automorphic decomposition with continuous commuting Galois action. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `MultiplicitySpace.double` (small): Two copies of π∞ give a two-dimensional multiplicity space.
An example requiring the full object is omitted because the actual smooth G(A_f) coefficient-cohomology tower and its discrete automorphic decomposition with continuous commuting Galois action. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `MultiplicitySpace.cancellation` (non-example): Equal multiplicity spaces in adjacent degrees give zero virtual class with nonzero actual spaces.
An example requiring the full object is omitted because the actual smooth G(A_f) coefficient-cohomology tower and its discrete automorphic decomposition with continuous commuting Galois action. The expressible scalar/weight examples above retain the available fragment only. -/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity` (theorem): The raw geometric fixed-point trace identity.
Mathematical signature: For a good reduction prime p≠ℓ and sufficiently large Frobenius power, the alternating trace of a Hecke correspondence times geometric Frobenius on H^k_U(ξ) equals the fixed-point sum with the coefficient trace. When expressed as a sum over admissible Kottwitz triples, the local orbital integrals, volumes and effectivity multiplicities belong to the compact PEL instance. No local Langlands parameter or automorphic Galois representation occurs in this identity.
Hypotheses: Correspondence and Frobenius power satisfy the Fujiwara/Varshavsky fixed-point hypotheses; good integral model and all coefficient factors fixed.
Signature omitted where not prototyped above. Missing objects: the compact PEL tower, étale cohomology and algebraic correspondence actions, including its actual integral charts.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology; AutomorphicGaloisRepresentationsPartII:AG2.1a/hecke-galois-projector-commutation; PELModuli:M4; EtaleDualityAndPerverseSheaves:EDC.8; AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-nearby-cycle-traces` (theorem): Raw nearby-cycle and stratum traces.
Mathematical signature: For the compact Drinfeld model at w|p≠ℓ, identify the generic-fibre alternating trace with the trace on the special fibre with RΨL_ξ. Decompose by Newton/Drinfeld strata and the compatible Igusa level covers before applying any local Langlands correspondence. Retain the nearby-cycle monodromy operator and its filtration rather than replacing it by zero.
Hypotheses: Proper integral model; the actual ramified O_{F_w} charts and coefficient projector; p split in E.
Signature omitted where not prototyped above. Missing objects: the compact PEL tower, étale cohomology and algebraic correspondence actions, including its actual integral charts.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance; AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology; AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity; IgusaVarietiesAndTorsionConcentration:IG.1/harris-taylor-igusa-varieties; LefschetzPencilsAndVanishingCycles:LPV.0; LefschetzPencilsAndVanishingCycles:LPV.1
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula` (theorem): The compact global Mantovan formula.
Mathematical signature: For every Newton class b of the compact datum, define Mant_{b,μ}(ρ) by the colimit over Rapoport–Zink levels of the alternating Ext^i_{J_b(Q_p)}(H^j_c(M_{b,μ}),ρ), with the source’s dimension twist (−D) and sign (−1)^{i+j}. Shin Proposition 5.2 gives [H(Sh,L_ξ)]=Σ_b Mant_{b,μ}([H_c(Ig_b,L_ξ)]) as a class with commuting prime-to-p Hecke and Weil actions. The split local factors tensor as in (5.6).
Hypotheses: Mantovan’s cohomology, smooth derived Ext, towers and actions for the chosen compact Drinfeld model; the dimension twist is included.
Signature omitted where not prototyped above. Missing objects: the compact tower and Mantovan Ext/Igusa functors, local transfer, isotypic cohomology and continuous semisimple Galois multiplicities.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-nearby-cycle-traces; IgusaVarietiesAndTorsionConcentration:IG.1/harris-taylor-igusa-varieties; HeckeStacksAndLocalShtukas:HS3; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1b/shin-st-end-igusa-computation` (theorem): Shin’s stable and endoscopic Igusa computation.
Mathematical signature: Under Shin §6.1, n≥3 is odd, Π=ψ⊗Π₁ is θ-stable, generic Ξ-cohomological, and Ram_Q(Π) lies in Spl_{F/F⁺,Q}; the finite set S also contains the ramification of F and the auxiliary odd character ϖ. In Case ST, Π₁ is cuspidal. In Case END, m₁>m₂>0, m₁+m₂=n, Π is transferred from ψ_H⊗Π₁⊗Π₂, each Π_i is conjugate-self-dual cohomological cuspidal and the central-character condition §6.1(ii) holds. Set C_G=|ker¹(Q,G)|τ(G). Theorem 6.1 computes BC(H_c(Ig_b,L_ξ){Π^S}) as C_G e₀[Π^{∞,p}]Red_n^b(π_p) in ST and (C_G/2)[Π^{∞,p}](e₁Red_n^b(π_p)+e₂Red_{m₁,m₂}^b(π_H,p)) in END, with e_i∈{±1} independent of b and the §3.6 transfer factors.
Hypotheses: All displayed §6.1 datum, ramification, central-character and infinity hypotheses; the END blocks and parity character are fixed.
Signature omitted where not prototyped above. Missing objects: the compact tower and Mantovan Ext/Igusa functors, local transfer, isotypic cohomology and continuous semisimple Galois multiplicities.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula; AutomorphicGaloisRepresentationsPartII:AG2.0/unitary-similitude-central-character-dictionary; EndoscopicTransferAndUnitaryTraceComparison:ET.5; EndoscopicTransferAndUnitaryTraceComparison:ET.7b
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1b/virtual-weil-constituent-comparison` (theorem): The virtual Weil constituent comparison.
Mathematical signature: Under the ST/END hypotheses, Theorem 6.4 identifies the base-changed alternating Π-part with C_G times the selected local Weil constituent, with the GL₁ character. In ST it is e₀ χ₀⊗L_n(Π₁,w). In END it is e₁ χ₀⊗L_{m₁}(Π_{M,1,w})|·|^(−m₂/2) if e₁=e₂, and e₁ χ₀⊗L_{m₂}(Π_{M,2,w})|·|^(−m₁/2) if e₁=−e₂. This equality is in the Weil Grothendieck group and has not yet removed alternating degrees or divided an actual representation by C_G.
Hypotheses: w over a rational prime split in E, w∤ℓ; exact local transfer and the normalized Mantovan formula.
Signature omitted where not prototyped above. Missing objects: the compact tower and Mantovan Ext/Igusa functors, local transfer, isotypic cohomology and continuous semisimple Galois multiplicities.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1b/shin-st-end-igusa-computation; AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula; EndoscopicTransferAndUnitaryTraceComparison:ET.6a; ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1b/weight-separation-middle-degree` (theorem): Weight separation into the middle degree.
Mathematical signature: For π∞ in the ST/END Π-part, R^k_{ξ,ℓ}(π∞)=0 for k≠n−1. Thus the alternating multiplicity is (−1)^(n−1)[R^{n−1}], an actual representation up to the explicit sign. In particular e₀=(−1)^(n−1) in ST and e₁=(−1)^(n−1) in END.
Hypotheses: The virtual Weil formula, geometric purity of every actual degree k, and the selected constituent purity/temperedness argument of Shin Corollary 6.5; no equality of virtual dimensions is used as cancellation.
Signature omitted where not prototyped above. Missing objects: the compact tower and Mantovan Ext/Igusa functors, local transfer, isotypic cohomology and continuous semisimple Galois multiplicities.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1b/virtual-weil-constituent-comparison; AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-continuous-geometric-galois-action; AutomorphicGaloisRepresentationsPartII:AG2.1a/automorphic-multiplicity-spaces; EndoscopicTransferAndUnitaryTraceComparison:ET.6a; DeligneWeightsAndPurity:DWP.0
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1b/archimedean-packet-multiplicity` (theorem): The archimedean packet multiplicity.
Mathematical signature: Under ST/END, the sum of discrete multiplicities at the ith relevant cohomological archimedean packet member is τ(G) for all i in ST; in END it is τ(G) for i≤m₁ if e₁=e₂, or i>m₁ if e₁=−e₂, and zero for the other indices. These are the multiplicities of Shin Corollary 6.5(iv), compatible with the ξ highest-weight partition W^1_κ⊔W^2_κ.
Hypotheses: The exact cohomological packet and signs of §3.6/§6.1, with middle-degree concentration.
Signature omitted where not prototyped above. Missing objects: the compact tower and Mantovan Ext/Igusa functors, local transfer, isotypic cohomology and continuous semisimple Galois multiplicities.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1b/weight-separation-middle-degree; AutomorphicGaloisRepresentationsPartII:AG2.1b/shin-st-end-igusa-computation; AutomorphicGaloisRepresentationsPartII:AG2.1a/automorphic-multiplicity-spaces; EndoscopicTransferAndUnitaryTraceComparison:ET.7b
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.1b/actual-galois-constituent-from-cohomology` (construction): The actual Galois constituent of cohomology.
Mathematical signature: For the selected ST/END Π-part, semisimplify the actual middle-degree Galois multiplicity space to R̃. The source proves that R̃ is C_G copies of a continuous semisimple representation R̃₀, and then removes the GL₁ character ψ by class field theory. The resulting R′_ℓ(Π) has rank n in ST, m₁ in END with e₁=e₂, or m₂ with e₁=−e₂; it is independent, up to isomorphism, of τ and ψ. At the source’s split primes its Weil Grothendieck class is exactly (6.31), with the selected half-dimensional norm twist.
Hypotheses: Middle-degree concentration, packet multiplicity and the actual multiplicity divisibility argument in Shin Corollary 6.8/Remark 6.9; de Rham comparison for the geometric summand is used to obtain the distinct labelled dimensions.
Signature omitted where not prototyped above. Missing objects: actual isotypic middle cohomology, continuous semisimple Galois representations and the irreducible multiplicity-divisibility theorem.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1b/weight-separation-middle-degree; AutomorphicGaloisRepresentationsPartII:AG2.1b/archimedean-packet-multiplicity; AutomorphicGaloisRepresentationsPartII:AG2.1a/automorphic-multiplicity-spaces; AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character; ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent; PadicHodgeTheory:R06.5
-/
/- API `ActualConstituent.rank` (characterisation): dim R′ equals the selected n, m₁ or m₂.
Missing-object note: actual isotypic middle cohomology, continuous semisimple Galois representations and the irreducible multiplicity-divisibility theorem. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `ActualConstituent.copies` (compatibility): Before removing ψ, R̃≅R̃₀^{⊕C_G} as Galois representations.
Missing-object note: actual isotypic middle cohomology, continuous semisimple Galois representations and the irreducible multiplicity-divisibility theorem. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `ActualConstituent.independent` (functoriality): Changing τ or the auxiliary ψ produces an isomorphic corrected constituent.
Missing-object note: actual isotypic middle cohomology, continuous semisimple Galois representations and the irreducible multiplicity-divisibility theorem. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `ActualConstituent.goodWeil` (projection): At source split primes recover the selected class (6.31), including the norm twist.
Missing-object note: actual isotypic middle cohomology, continuous semisimple Galois representations and the irreducible multiplicity-divisibility theorem. A fragment already declared above is only the stated weight or polynomial computation. -/
/- Test `ActualConstituent.stableRank` (small): Case ST n=3 gives rank 3 after removing C_G copies.
An example requiring the full object is omitted because actual isotypic middle cohomology, continuous semisimple Galois representations and the irreducible multiplicity-divisibility theorem. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `ActualConstituent.endRank` (small): For n=5,m₁=3,m₂=2 the two sign cases give rank 3 and 2 respectively.
An example requiring the full object is omitted because actual isotypic middle cohomology, continuous semisimple Galois representations and the irreducible multiplicity-divisibility theorem. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `ActualConstituent.rankOnly` (non-example): A semisimple rank-4 representation with irreducible multiplicities 1 and 3 cannot be divided into two copies merely because 2 divides 4.
An example requiring the full object is omitted because actual isotypic middle cohomology, continuous semisimple Galois representations and the irreducible multiplicity-divisibility theorem. The expressible scalar/weight examples above retain the available fragment only. -/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.2/shin-regular-geometric-existence` (theorem): Geometric existence in the Shin-regular range.
Mathematical signature: For CM F and regular algebraic conjugate-self-dual cuspidal π of GL_m(A_F), m≥2, suppose m is odd, or for even m the algebraic highest weight has a_{σ,k}>a_{σ,k+1} for some embedding σ and odd k. Under the technical §7.1 conditions F=EF⁺, [F⁺:Q]≥2 and all ramification of F and π over rational primes split in F/F⁺, the compact construction gives a continuous semisimple rank-m r attached to π. For odd m use ST with n=m; for even m use END with n=m+1 and an auxiliary character chosen so that e₁=e₂, then remove its parity and norm corrections. This node asserts good-place attachment and rank; the comparison and coefficient-prime conclusions have separate owners.
Hypotheses: Shin §7.1 technical datum; m=1 is supplied by the character dictionary; slight regularity for even m is retained.
Signature omitted where not prototyped above. Missing objects: cuspidal/discrete adele representations, geometric local parameters, algebraic characters and continuous attached Galois representations.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1b/actual-galois-constituent-from-cohomology; AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation; AutomorphicGaloisRepresentationsPartII:AG2.0/unitary-similitude-central-character-dictionary; EndoscopicTransferAndUnitaryTraceComparison:ET.7a; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.2/algebraic-character-polarization-twist` (theorem): Twisting an essentially self-dual form into unitary type.
Mathematical signature: For a CM regular algebraic cuspidal polarized pair (π,χ), choose an algebraic Hecke character ψ with ψψ^c=χ∘N_{F/F⁺} in the source’s compatible infinity-type and parity convention. Then π⊗ψ^−1∘det is conjugate self-dual. Given a good-place attached representation r₀ for the twisted form, r=r₀⊗r(ψ) is attached to π. A change of ψ changes the construction only up to the unique good-place attached isomorphism. The existence of ψ uses the idele-character extension compatibility, not a pointwise square root of χ.
Hypotheses: Compatible algebraic infinity types and finite-order parity, after the parity correction E2 for total oddness; the source extension lemma applies.
Signature omitted where not prototyped above. Missing objects: cuspidal/discrete adele representations, geometric local parameters, algebraic characters and continuous attached Galois representations.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation; AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character; AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly` (construction): Galois assembly for discrete unitary transfer.
Mathematical signature: For cohomological square-integrable Π on HLTT G_n(A), write 2n=Σ_i m_i n_i and BC(Π)_v=⊞_i⊞_{j=0}^{n_i−1} π̃_{i,v}|det|^{(n_i−1)/2−j} at the source’s good places, where π̃_i is conjugate-self-dual cuspidal and π_i=π̃_i||det||^{(m_i+n_i−1)/2} is cohomological. Given normalized rank-m_i attached r_i for π_i, form R(Π)=⊕_i⊕_{j=0}^{n_i−1} r_i⊗ε_ℓ^{−n−j}. Its rank is 2n and its good-place WD semisimplification is rec(BC(Π)_v|det|^{(1−2n)/2}). The input r_i are supplied individually; this assembly does not presume they all lie in the Shin-regular geometric range.
Hypotheses: Discrete transfer/classification in HLTT Proposition 1.2; actual rank-m_i normalized representations supplied; good places q≠ℓ with q split in F₀ or F and Π unramified above q.
Signature omitted where not prototyped above. Missing objects: discrete unitary automorphic transfer, normalized cuspidal block representations and their continuous Galois direct sums and twists.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions; AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation; EndoscopicTransferAndUnitaryTraceComparison:ET.7a; ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist
-/
/- API `DiscreteAssembly.rank` (characterisation): rank R=Σ_i m_i n_i=2n.
Missing-object note: discrete unitary automorphic transfer, normalized cuspidal block representations and their continuous Galois direct sums and twists. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `DiscreteAssembly.goodPolynomial` (projection): The good Frobenius polynomial is the product of the scalar-twisted polynomials of r_i.
Missing-object note: discrete unitary automorphic transfer, normalized cuspidal block representations and their continuous Galois direct sums and twists. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `DiscreteAssembly.continuous` (compatibility): Finite sums of continuous finite-field representations are continuous and semisimple.
Missing-object note: discrete unitary automorphic transfer, normalized cuspidal block representations and their continuous Galois direct sums and twists. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `DiscreteAssembly.choice` (functoriality): Replacing each supplied r_i by an isomorphic attached representative gives an isomorphic R.
Missing-object note: discrete unitary automorphic transfer, normalized cuspidal block representations and their continuous Galois direct sums and twists. A fragment already declared above is only the stated weight or polynomial computation. -/
/- Test `DiscreteAssembly.singleBlock` (small): n=1,m₁=1,n₁=2 gives r₁ε^−1⊕r₁ε^−2.
An example requiring the full object is omitted because discrete unitary automorphic transfer, normalized cuspidal block representations and their continuous Galois direct sums and twists. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `DiscreteAssembly.cuspidal` (degenerate): n₁=1,m₁=2n gives r₁ε^−n, tracking the cohomological twist on π₁.
An example requiring the full object is omitted because discrete unitary automorphic transfer, normalized cuspidal block representations and their continuous Galois direct sums and twists. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `DiscreteAssembly.rank` (non-example): Taking only one copy of each r_i gives the wrong rank when some n_i>1.
An example requiring the full object is omitted because discrete unitary automorphic transfer, normalized cuspidal block representations and their continuous Galois direct sums and twists. The expressible scalar/weight examples above retain the available fragment only. -/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.2/cs-discrete-polarization-normalization` (comparison): The Caraiani–Scholze discrete normalization.
Mathematical signature: For an irreducible admissible Π^S in BC^S[H_c(I_Mant^b,Q̄_ℓ)]_Sur of CS Corollary 5.5.5, Corollary 5.5.2 chooses the specified transfer from G_{n₁,n₂}, with Π⃗=ψ⊗Π₁⊗Π₂ and n₁+n₂=N. Let r_i be the representation for the L-algebraic parameter Π_i|det|^{(1−n_i)/2}. The character |det|^{(n_i−N)/2}(ϖ∘N_{F/K})^{ε(N−n_i)} is L-algebraic, with Galois character ε_i. Then r_{Π^S,ℓ}=⊕_{i=1}^2 r_i⊗ε_i has rank N, is unramified outside the places above S∪{ℓ}, and at v above q∈Spl_{F₀/Q} outside S∪{ℓ} has the displayed integral Hecke polynomial. The parity ε takes values 0 or 1 and ϖ has odd infinity exponent. This is the selected two-block cohomological transfer, not an assertion about every abstract discrete GL_N representation. The full local normalization at the specified split places is the separate Remark 5.5.6 comparison contract.
Hypotheses: The exact cohomological surjection and transferred packet of Corollaries 5.5.2/5.5.5; published numbering; specified imaginary quadratic K, source splitting set, n₁+n₂=N and odd ϖ.
Signature omitted where not prototyped above. Missing objects: cuspidal/discrete adele representations, geometric local parameters, algebraic characters and continuous attached Galois representations.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly; AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation; EndoscopicTransferAndUnitaryTraceComparison:ET.7a
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change` (theorem): Attachment under cuspidal solvable base change.
Mathematical signature: If F′/F is solvable, π′=BC_{F′/F}(π) is cuspidal regular algebraic, and r is attached to π, then (r|_{G_{F′}})^ss is attached to π′. If another semisimple representation is attached to π′, good Frobenius polynomials identify it with this restriction. This is a specialization of automorphic base change and Galois restriction, distinct from the effective descent theorem used to construct r over F.
Hypotheses: Existence and good-place Satake compatibility of the specified solvable base change; cuspidality is assumed or ensured by avoiding finite self-twist fields.
Signature omitted where not prototyped above. Missing objects: cuspidal/discrete adele representations, geometric local parameters, algebraic characters and continuous attached Galois representations.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places; ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist; EndoscopicTransferAndUnitaryTraceComparison:ET.7a
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance` (construction): The definite-unitary eigenvariety instance.
Mathematical signature: Under CH Hypotheses 1.2.1 and 1.2.3, K/F is unramified at finite places and [F:Q] is even. The hermitian V₀ gives a unitary G₀ compact at all real places and quasi-split at finite places. Choose v₀|ℓ split in K and an Iwahori refinement of Π there; fix weights at all other real places, and tame Bernstein components with the prescribed local monodromy bound. Specialize the group-independent finite-slope eigenvariety to overconvergent G₀ forms varying the weights belonging to v₀. The classical Π gives a point x with its good Hecke eigenvalues.
Hypotheses: General Hypothesis 1.1 and Special Hypotheses 1.2 and 2.2; n even in the interpolation step; a genuine finite-slope refinement at v₀.
Signature omitted where not prototyped above. Missing objects: the supplied definite-unitary Banach family and compact operator, L4 finite-slope pieces, L2a eigenvariety points and tame Bernstein types.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation; EndoscopicTransferAndUnitaryTraceComparison:ET.7a; PadicFamilies:L2a/linked-banach-families; PadicFamilies:L2a/eigenpacket-points; LocallyAnalyticDistributions:L4/finite-slope-summands
-/
/- API `DefiniteFamily.classicalPoint` (constructor): A refined classical Π with the fixed tame/infinity data gives x.
Missing-object note: the supplied definite-unitary Banach family and compact operator, L4 finite-slope pieces, L2a eigenvariety points and tame Bernstein types. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `DefiniteFamily.fixedWeights` (characterisation): All labelled weights away from v₀ are fixed in the family.
Missing-object note: the supplied definite-unitary Banach family and compact operator, L4 finite-slope pieces, L2a eigenvariety points and tame Bernstein types. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `DefiniteFamily.goodEigenvalues` (projection): At x, spherical operators specialize to the good Hecke eigenvalues of Π.
Missing-object note: the supplied definite-unitary Banach family and compact operator, L4 finite-slope pieces, L2a eigenvariety points and tame Bernstein types. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `DefiniteFamily.tameType` (compatibility): At tame split places every classical point lies in the prescribed Bernstein component with the source local bound.
Missing-object note: the supplied definite-unitary Banach family and compact operator, L4 finite-slope pieces, L2a eigenvariety points and tame Bernstein types. A fragment already declared above is only the stated weight or polynomial computation. -/
/- Test `DefiniteFamily.fixedWeight` (compatibility): Varying a weight at an embedding not attached to v₀ violates the family contract.
An example requiring the full object is omitted because the supplied definite-unitary Banach family and compact operator, L4 finite-slope pieces, L2a eigenvariety points and tame Bernstein types. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `DefiniteFamily.missingRefinement` (non-example): An infinite-slope eigensystem does not give a point of a finite-slope chart.
An example requiring the full object is omitted because the supplied definite-unitary Banach family and compact operator, L4 finite-slope pieces, L2a eigenvariety points and tame Bernstein types. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `DefiniteFamily.classicalSpecialization` (small): At a classical point the good Hecke polynomial is the integral polynomial specialized to Π.
An example requiring the full object is omitted because the supplied definite-unitary Banach family and compact operator, L4 finite-slope pieces, L2a eigenvariety points and tame Bernstein types. The expressible scalar/weight examples above retain the available fragment only. -/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/strongly-regular-classical-density` (theorem): Density of strongly regular classical points.
Mathematical signature: In the CH definite-unitary family, classical points whose varied algebraic weights lie sufficiently far in the dominant chamber and satisfy slight regularity are Zariski dense in the required finite-slope charts. They retain the fixed other archimedean weights and tame local data. These points have geometric attached representations from AG2.2 and are sufficient to determine analytic good-place trace functions.
Hypotheses: The source’s classicality bounds relative to the chosen finite slope and coefficient family; density is asserted on the relevant charts, not on arbitrary eigenvarieties.
Signature omitted where not prototyped above. Missing objects: the definite-unitary automorphic eigenvariety and its continuous determinant, effective base change/patching and constructed Galois representation.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance; AutomorphicGaloisRepresentationsPartII:AG2.2/shin-regular-geometric-existence; PadicFamilies:L2a/finite-hecke-images; LocallyAnalyticDistributions:L4/summand-fredholm-theory; AutomorphicFormsOnReductiveGroups:AF.4
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-family-determinant-interpolation` (theorem): Determinant interpolation on the definite family.
Mathematical signature: The traces of the rank-n geometric attached representations at the dense strongly regular classical points extend to a continuous degree-n determinant on G_{K,S} with values in the reduced affinoid Hecke algebra of each relevant chart. Its good Frobenius characteristic polynomial is the analytic integral Hecke polynomial. At x, specialization and semisimple reconstruction give a continuous rank-n representation r_x over Q̄_ℓ, without an absolute-irreducibility hypothesis on r_x.
Hypotheses: One common finite ramification set S, reduced affinoid Hecke charts, continuous bounded trace interpolation, characteristic zero so n! is invertible, and finite-field continuity of the specialized semisimple representation.
Signature omitted where not prototyped above. Missing objects: the definite-unitary automorphic eigenvariety and its continuous determinant, effective base change/patching and constructed Galois representation.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.3/strongly-regular-classical-density; AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance; IntegralHeckeAndGaloisDeterminants:IHG.4; IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction; ArithmeticGaloisRepresentations:R01.1/continuous-representation
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/finite-slope-regular-target-existence` (theorem): Existence at the regular finite-slope target.
Mathematical signature: Under CH Hypotheses 1.1, 1.2 and 2.2, a regular CSD cuspidal Π has a unique continuous semisimple rank-n good-place attached r, without Hypothesis 1.3. The assertion includes even rank without slight regularity, because it is obtained by specializing the determinant at x, not by identifying Π itself with a geometric middle-degree constituent.
Hypotheses: A split coefficient place with Iwahori invariants and the technical unramified CM datum of the definite-unitary family.
Signature omitted where not prototyped above. Missing objects: the definite-unitary automorphic eigenvariety and its continuous determinant, effective base change/patching and constructed Galois representation.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.3/definite-family-determinant-interpolation; AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/s-general-solvable-extension-families` (construction): The automorphic S-general extension family.
Mathematical signature: For K/F CM, a finite forbidden set S and auxiliary finite extension M, choose cyclic prime-degree totally real F′/F disjoint from M, splitting the required places outside S and meeting the specified local splitting/ramification conditions. Their composita K′=KF′ give the S-general families used by CH §3.1. Enlarge M to exclude the finitely many self-twist extensions so that BC_{K′/K}(Π) stays cuspidal. S-general means: for every finite M/K and v∉S there is K′ disjoint from M with v split completely.
Hypotheses: Only compatible prime-degree Grunwald–Wang prescriptions, including real places; no special 2-power case is invoked.
Signature omitted where not prototyped above. Missing objects: embedded number-field extensions in a fixed algebraic closure, solvable extension degrees, disjointness and automorphic cuspidal base change.
Direct owners/contracts: tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters; EndoscopicTransferAndUnitaryTraceComparison:ET.7a
-/
/- API `SGeneralFamily.disjoint` (projection): Given every finite M, obtain an extension linearly disjoint from M.
Missing-object note: embedded number-field extensions in a fixed algebraic closure, solvable extension degrees, disjointness and automorphic cuspidal base change. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `SGeneralFamily.splitPlace` (projection): Given v∉S, choose that extension with v split completely.
Missing-object note: embedded number-field extensions in a fixed algebraic closure, solvable extension degrees, disjointness and automorphic cuspidal base change. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `SGeneralFamily.cuspidal` (compatibility): Avoiding the finite self-twist fields preserves cuspidality of base change.
Missing-object note: embedded number-field extensions in a fixed algebraic closure, solvable extension degrees, disjointness and automorphic cuspidal base change. A fragment already declared above is only the stated weight or polynomial computation. -/
/- Test `SGeneralFamily.quantifier` (non-example): An infinite collection all containing one fixed nontrivial extension is not S-general.
An example requiring the full object is omitted because embedded number-field extensions in a fixed algebraic closure, solvable extension degrees, disjointness and automorphic cuspidal base change. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `SGeneralFamily.split` (small): At a prescribed split place the local completion of each branch is the original field.
An example requiring the full object is omitted because embedded number-field extensions in a fixed algebraic closure, solvable extension degrees, disjointness and automorphic cuspidal base change. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `SGeneralFamily.forbidden` (degenerate): No splitting assertion is made for v∈S unless included in the local prescription.
An example requiring the full object is omitted because embedded number-field extensions in a fixed algebraic closure, solvable extension degrees, disjointness and automorphic cuspidal base change. The expressible scalar/weight examples above retain the available fragment only. -/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching` (theorem): Effective Galois patching for automorphic base changes.
Mathematical signature: For an S-general family K_i/K of cyclic extensions of a fixed prime degree, let r_i be continuous semisimple rank-n representations of G_{K_i}, invariant under Gal(K_i/K), with isomorphic restrictions on every compositum K_iK_j. Sorensen’s effective patching theorem yields a unique continuous semisimple rank-n r of G_K restricting to every r_i. For attached base-change r_i, good Frobenius polynomials establish both invariance and pairwise compatibility and then good-place attachment of r.
Hypotheses: All S-general quantifiers and all overlap/invariance conditions; actual representations r_i, not only virtual classes or traces.
Signature omitted where not prototyped above. Missing objects: the definite-unitary automorphic eigenvariety and its continuous determinant, effective base change/patching and constructed Galois representation.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.3/s-general-solvable-extension-families; AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change; AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places; ArithmeticGaloisRepresentations:R01.5
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/removal-of-geometric-field-hypotheses` (theorem): Removal of the geometric field hypotheses.
Mathematical signature: The good-place rank-n representation constructed in the geometric or finite-slope range descends over an arbitrary CM K after choosing S-general base changes that make the real degree even, the CM extension unramified and the necessary coefficient place split while preserving cuspidality. Thus the imaginary-quadratic-subfield, degree and field-ramification assumptions are construction devices rather than final hypotheses.
Hypotheses: CSD regular cuspidal Π; the local finite-slope or slight-regularity hypothesis needed by the chosen construction is retained at this step.
Signature omitted where not prototyped above. Missing objects: the definite-unitary automorphic eigenvariety and its continuous determinant, effective base change/patching and constructed Galois representation.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching; AutomorphicGaloisRepresentationsPartII:AG2.3/finite-slope-regular-target-existence; AutomorphicGaloisRepresentationsPartII:AG2.2/shin-regular-geometric-existence; EndoscopicTransferAndUnitaryTraceComparison:ET.7a
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-local-iwahori-reduction` (theorem): Solvable local reduction to Iwahori level.
Mathematical signature: At a split coefficient place v, choose a finite solvable local extension L/F_v over which the Weil part of rec(Π_u) is unramified; then the automorphic local base change has Iwahori invariants. If Π satisfies P(m+1), CH Corollary 3.2.2 supplies an S-general family of prime-degree global extensions preserving a testing place and cuspidality, on which the local solvable index drops to m.
Hypotheses: Local GL_n Langlands and its compatibility with cyclic base change; coefficient place split in K; finite solvable index as defined in CH p. 10.
Signature omitted where not prototyped above. Missing objects: the definite-unitary automorphic eigenvariety and its continuous determinant, effective base change/patching and constructed Galois representation.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.3/s-general-solvable-extension-families; EndoscopicTransferAndUnitaryTraceComparison:ET.6; EndoscopicTransferAndUnitaryTraceComparison:ET.7a
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-index-induction` (theorem): Induction removing the finite-slope hypothesis.
Mathematical signature: For a regular CSD cuspidal Π, induction on its local solvable index P(m) constructs a continuous semisimple good-place attached representation at every coefficient prime. The base m=0 is finite-slope Iwahori existence, after field hypotheses are removed. The successor step constructs representations after each prime-degree extension lowering m and patches them effectively. No finite-slope hypothesis remains on the original Π.
Hypotheses: Arbitrary coefficient prime; the prime-degree local-global extension family and effective patching.
Signature omitted where not prototyped above. Missing objects: the definite-unitary automorphic eigenvariety and its continuous determinant, effective base change/patching and constructed Galois representation.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-local-iwahori-reduction; AutomorphicGaloisRepresentationsPartII:AG2.3/removal-of-geometric-field-hypotheses; AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance` (construction): HLTT ordinary boundary geometry.
Mathematical signature: Fix F=F₀F⁺ with F₀ imaginary quadratic and p split in F₀. For the quasi-split similitude G_n on F^{2n} of signature (n,n), choose HLTT ordinary levels U^p(N₁,N₂), smooth toroidal cone data Σ and the Kuga family A^(m). The minimal compactification carries canonical and subcanonical E_ρ, the ordinary locus and its Hasse section; the ordinary toroidal Kuga model has SNC boundary ∂. Its formal ordinary tube has the dagger structure used in §6.2. Keep the right G_n action, the left GL_m(F) action and their source commutation conventions.
Hypotheses: The exact integral ordinary/mixed models and toroidal charts of HLTT §§3–5; neat levels and admissible smooth cones; m≥0.
Signature omitted where not prototyped above. Missing objects: the HLTT mixed Shimura/Kuga moduli schemes, toroidal boundary strata, ordinary dagger tube and subcanonical automorphic bundles.
Direct owners/contracts: IgusaVarietiesAndTorsionConcentration:IG.0/quasi-split-unitary-datum; PELModuli:M4; ShimuraCompactifications:C3; ShimuraCompactifications:C5; AutomorphicBundles:B3; AdicSpacesPartII:F1/dagger-snc-divisor
-/
/- API `HLTTModel.genericFibre` (compatibility): Minimal/toroidal/Kuga models identify the stipulated generic fibres and levels.
Missing-object note: the HLTT mixed Shimura/Kuga moduli schemes, toroidal boundary strata, ordinary dagger tube and subcanonical automorphic bundles. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `HLTTModel.ordinaryDagger` (constructor): The ordinary formal tube defines the smooth dagger pair with SNC boundary.
Missing-object note: the HLTT mixed Shimura/Kuga moduli schemes, toroidal boundary strata, ordinary dagger tube and subcanonical automorphic bundles. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `HLTTModel.subcanonical` (characterisation): E_ρ^sub is the boundary-vanishing extension used for cuspidal sections.
Missing-object note: the HLTT mixed Shimura/Kuga moduli schemes, toroidal boundary strata, ordinary dagger tube and subcanonical automorphic bundles. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `HLTTModel.refinement` (functoriality): Admissible cone refinements and level changes give the maps used in the cohomology colimit.
Missing-object note: the HLTT mixed Shimura/Kuga moduli schemes, toroidal boundary strata, ordinary dagger tube and subcanonical automorphic bundles. A fragment already declared above is only the stated weight or polynomial computation. -/
/- Test `HLTTModel.zeroKuga` (degenerate): m=0 has dimension [F⁺:Q]n².
An example requiring the full object is omitted because the HLTT mixed Shimura/Kuga moduli schemes, toroidal boundary strata, ordinary dagger tube and subcanonical automorphic bundles. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `HLTTModel.oneKuga` (small): n=1,m=1 has dimension 3[F⁺:Q].
An example requiring the full object is omitted because the HLTT mixed Shimura/Kuga moduli schemes, toroidal boundary strata, ordinary dagger tube and subcanonical automorphic bundles. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `HLTTModel.boundaryIdeal` (non-example): Canonical sections without the boundary ideal include noncuspidal classes and cannot replace the subcanonical module.
An example requiring the full object is omitted because the HLTT mixed Shimura/Kuga moduli schemes, toroidal boundary strata, ordinary dagger tube and subcanonical automorphic bundles. The expressible scalar/weight examples above retain the available fragment only. -/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-support-dagger-cohomology` (construction): Dagger cohomology with boundary support.
Mathematical signature: For each fixed ordinary toroidal Kuga pair (A_Σ^†,∂), define H^i_{c−∂}(A_Σ^ord)=H^i(A_Σ^†,I_∂Ω^•(log∂)), then form the HLTT colimit over levels and admissible Σ with its transition maps. The complex restricts to the ordinary de Rham complex away from ∂. This definition is relative to the selected compactification; no intrinsic compactification-independent identification is asserted.
Hypotheses: Smooth dagger SNC pair from the exact HLTT model and compatible level/refinement morphisms.
Signature omitted where not prototyped above. Missing objects: dagger analytic spaces with Frobenius, boundary ideal sheaves, derived de Rham complexes and the source transition-map colimit.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance; AdicSpacesPartII:F1/compact-support-log-complex; AdicSpacesPartII:F1/log-de-rham-complex
-/
/- API `BoundaryCohomology.complex` (characterisation): Its complex is I_∂Ω^•(log∂), with the de Rham differential.
Missing-object note: dagger analytic spaces with Frobenius, boundary ideal sheaves, derived de Rham complexes and the source transition-map colimit. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `BoundaryCohomology.emptyBoundary` (compatibility): If ∂ is empty the complex is Ω^•.
Missing-object note: dagger analytic spaces with Frobenius, boundary ideal sheaves, derived de Rham complexes and the source transition-map colimit. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `BoundaryCohomology.transition` (functoriality): Level/refinement morphisms induce compatible maps used by the directed colimit.
Missing-object note: dagger analytic spaces with Frobenius, boundary ideal sheaves, derived de Rham complexes and the source transition-map colimit. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `BoundaryCohomology.groupAction` (functoriality): The source ordinary adelic group acts through these transition correspondences.
Missing-object note: dagger analytic spaces with Frobenius, boundary ideal sheaves, derived de Rham complexes and the source transition-map colimit. A fragment already declared above is only the stated weight or polynomial computation. -/
/- Test `BoundaryCohomology.localIdeal` (small): For ∂=(t=0), the degree-zero term is tO^†, not O^†.
An example requiring the full object is omitted because dagger analytic spaces with Frobenius, boundary ideal sheaves, derived de Rham complexes and the source transition-map colimit. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `BoundaryCohomology.empty` (degenerate): With ∂=∅ recover ordinary dagger de Rham cohomology.
An example requiring the full object is omitted because dagger analytic spaces with Frobenius, boundary ideal sheaves, derived de Rham complexes and the source transition-map colimit. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `BoundaryCohomology.support` (non-example): Dropping I_∂ gives logarithmic cohomology with different boundary classes.
An example requiring the full object is omitted because dagger analytic spaces with Frobenius, boundary ideal sheaves, derived de Rham complexes and the source transition-map colimit. The expressible scalar/weight examples above retain the available fragment only. -/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-functorial-dagger-rigid-comparison` (theorem): Functorial comparison of HLTT tubes with rigid cohomology.
Mathematical signature: For smooth quasi-projective Y/O_K in HLTT Lemma 6.8, H^i_rig(Y_s/K)≅H^i(Y^†,Ω^•). The isomorphism is functorial under the actual morphisms of smooth models used for boundary strata, Hecke maps and Frobenius lifts. In particular the ordinary lift ς_p corresponds to rigid Frobenius because its special-fibre map is Frobenius.
Hypotheses: The proper formal embeddings and strict-neighborhood choices in GK Theorem 5.1 and HLTT Lemma 6.8; this is not an arbitrary rigid-space comparison.
Signature omitted where not prototyped above. Missing objects: the ordinary mixed Shimura dagger/boundary cohomology, integral Hecke actions and continuous determinant/representation carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance; PadicDifferentialEquationsAndRigidCohomology:RD.4; AdicSpacesPartII:F1/log-de-rham-complex
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-frobenius-trace-normalization` (lemma): HLTT Frobenius and trace normalization.
Mathematical signature: On H^i_{c−∂}(A_Σ^ord), the pullback ς_p and trace trF commute with the ordinary adelic action and satisfy trF∘ς_p=p^{n(n+2m)[F⁺:Q]} id. On the ordinary minimal cusp-section module the normalized trace is the source controlling operator, with the explicit coefficient weight factor of Proposition 6.15 retained. This distinguishes geometric Frobenius pullback from its finite-étale trace.
Hypotheses: HLTT ordinary Frobenius quotient, dagger finite-étale trace and its boundary extension; characteristic zero coefficients.
Signature omitted where not prototyped above. Missing objects: the ordinary mixed Shimura dagger/boundary cohomology, integral Hecke actions and continuous determinant/representation carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-support-dagger-cohomology; AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-functorial-dagger-rigid-comparison; AdicSpacesPartII:F1/dagger-finite-etale-trace
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-cusp-finite-slope-pieces` (theorem): Finite slope cusp sections on the ordinary tube.
Mathematical signature: For each algebraic ρ and slope bound a, H⁰(X^ord,min,†,E_ρ^sub)_{≤a} is an admissible ordinary adelic module; at each fixed small level it is finite-dimensional. The completely continuous normalized trF acts on Banach strict neighborhoods and the finite-slope summand is unchanged upon shrinking through the source compatible neighborhoods. Its tower embeds in the ordinary classical-section space.
Hypotheses: HLTT Lemmas 6.6 and 6.10–6.12, compact restriction maps and exact linked neighborhood data; the slope is measured for the normalized source trace.
Signature omitted where not prototyped above. Missing objects: the ordinary mixed Shimura dagger/boundary cohomology, integral Hecke actions and continuous determinant/representation carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance; AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-frobenius-trace-normalization; LocallyAnalyticDistributions:L4/finite-slope-summands; LocallyAnalyticDistributions:L4/summand-fredholm-theory; PadicFamilies:L2a/linked-banach-families
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/hasse-weight-changing-congruence` (theorem): Hasse weight-changing congruences.
Mathematical signature: For M≥1 and any lower bound r, multiplication/division by the lifted Hasse section gives the Hecke-equivariant surjection ⊕_{j≥r} H⁰(X^min,E_ρ^sub⊗ω^{j(p−1)p^{M−1}})→H⁰(X^ord,min,E_ρ^sub⊗Z/p^M), f↦f/Hasse_M^j. Consequently a finite collection of ordinary sections modulo p^M admits lifts in finitely many sufficiently high classical weights; one common weight bound and modulus controls that finite collection.
Hypotheses: Integral E_ρ lattice and HLTT ordinary minimal model; ample ω and the lifted Hasse section; all relevant level/action normalizations.
Signature omitted where not prototyped above. Missing objects: the ordinary mixed Shimura dagger/boundary cohomology, integral Hecke actions and continuous determinant/representation carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance; AutomorphicBundles:B3; ShimuraCompactifications:C5
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/classical-cusp-galois-type` (theorem): Galois type of sufficiently high classical cusp forms.
Mathematical signature: For a fixed algebraic ρ, sufficiently large determinant twists satisfying −2n≥(b_{τ,1}−t)+(b_{τc,1}−t) put the classical cuspidal G_n eigensystems in the discrete cohomological range of HLTT Lemma 6.2. Through constituent existence in AG2.3 and the discrete assembly they have continuous semisimple rank-2n representations with the normalized good polynomials and one fixed tame ramification set determined by the fixed level and p.
Hypotheses: The high-weight inequality and fixed level; all discrete constituent algebraic twists are retained; no torsion Hecke existence is an input.
Signature omitted where not prototyped above. Missing objects: the ordinary mixed Shimura dagger/boundary cohomology, integral Hecke actions and continuous determinant/representation carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.4/hasse-weight-changing-congruence; AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly; AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris; EndoscopicTransferAndUnitaryTraceComparison:ET.7a
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/uniform-integral-hecke-congruence-witnesses` (theorem): Uniform integral Hecke congruence witnesses.
Mathematical signature: For each finite ordinary Hecke module W and each p-adic modulus, the Hasse surjection and sufficiently high classical Galois-type modules give a single finite classical comparison controlling all good Hecke operators on W modulo that modulus. Choose a common finite ramification set, coefficient ring and compatible refinements of these comparison data as the modulus grows. The resulting quotient determinant/trace data obey the IHG.4 uniform-congruence contract; at primes dividing (2n)! use a stronger modulus before converting trace pseudocharacters to determinants in characteristic zero.
Hypotheses: Integral finite Hecke image of W, finite classical comparison module and quotient descent for the continuous determinant identities; denominator control is explicit.
Signature omitted where not prototyped above. Missing objects: the ordinary mixed Shimura dagger/boundary cohomology, integral Hecke actions and continuous determinant/representation carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.4/hasse-weight-changing-congruence; AutomorphicGaloisRepresentationsPartII:AG2.4/classical-cusp-galois-type; IntegralHeckeAndGaloisDeterminants:IHG.4/uniform-congruence-witness; IntegralHeckeAndGaloisDeterminants:IHG.4/finite-quotient-determinant-data
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-hecke-determinant-limit` (theorem): The continuous ordinary Hecke determinant limit.
Mathematical signature: The compatible fixed-S quotient data for the ordinary finite Hecke modules interpolate to a unique continuous degree-2n determinant, with every good Frobenius polynomial equal to the normalized G_n Hecke polynomial. At each characteristic-zero irreducible ordinary eigensystem covered by Proposition 6.5/Corollary 6.13, specialization reconstructs a continuous semisimple rank-2n Galois representation. Coefficient/level changes transport this determinant; the coefficient limit adds no ramification.
Hypotheses: The uniform congruence witnesses and actual quotient-descent contract, separated complete coefficient topology, compatible level maps and characteristic-zero reconstruction continuity; the source Proposition 6.5 initially concerns an irreducible quotient of an admissible submodule.
Signature omitted where not prototyped above. Missing objects: the ordinary mixed Shimura dagger/boundary cohomology, integral Hecke actions and continuous determinant/representation carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.4/uniform-integral-hecke-congruence-witnesses; AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-cusp-finite-slope-pieces; IntegralHeckeAndGaloisDeterminants:IHG.4/inverse-limit-determinant; IntegralHeckeAndGaloisDeterminants:IHG.4/completed-group-algebra-extension; IntegralHeckeAndGaloisDeterminants:IHG.4/interpolation-coefficient-change; IntegralHeckeAndGaloisDeterminants:IHG.4/interpolation-level-change; IntegralHeckeAndGaloisDeterminants:IHG.4/interpolation-ramification; IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/logarithmic-cusp-section-spectral-sequence` (theorem): The logarithmic cusp-section spectral sequence.
Mathematical signature: At each finite slope, the logarithmic de Rham cohomology of the ordinary Kuga model with I_∂ has the coefficient filtration and spectral sequence of HLTT Proposition 6.15/Lemma 6.17: the E₁ terms are finite-slope H⁰(X^ord,min,†,E_{ρ_{m,s}^{i,j}}^sub), with the specified trace and dimension shifts. Combining with Lemma 6.20 gives the spectral sequence to H^*_{c−∂,≤a}. Hence every irreducible constituent appearing in the abutment has the source rank-2n good-place Galois representation.
Hypotheses: Actual algebraic representations ρ_{m,s}^{i,j}, coefficient trace factor and finite filtrations; the higher coherent cohomology vanishing on the ordinary affine locus.
Signature omitted where not prototyped above. Missing objects: the ordinary mixed Shimura dagger/boundary cohomology, integral Hecke actions and continuous determinant/representation carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-support-dagger-cohomology; AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-frobenius-trace-normalization; AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-cusp-finite-slope-pieces; AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-hecke-determinant-limit; AutomorphicBundles:B3
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-stratum-weight-zero-sequence` (theorem): The boundary-stratum and weight-zero spectral sequence.
Mathematical signature: For the fixed HLTT ordinary boundary model, E₁^{i,j}=H^i_rig(∂^(j)A_Σ^ord)⇒H^{i+j}_{c−∂}(A_Σ^ord), compatibly with ς_p. The abutment is finite-dimensional at fixed level and is exhausted by finite trF slopes. Its Frobenius eigenvalues have nonnegative Weil weights; for i>0, the weight-zero part of H^{i+1}_{c−∂} is the cohomology H^i of the boundary dual simplicial complex, and for i=0 the source gives a surjection.
Hypotheses: Smooth quasi-projective strata, functorial rigid/dagger comparison, rigid finiteness and the weight lower bound w≥cohomological degree.
Signature omitted where not prototyped above. Missing objects: the ordinary mixed Shimura dagger/boundary cohomology, integral Hecke actions and continuous determinant/representation carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-support-dagger-cohomology; AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-functorial-dagger-rigid-comparison; AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-frobenius-trace-normalization; PadicDifferentialEquationsAndRigidCohomology:RD.5; PadicDifferentialEquationsAndRigidCohomology:RD.6
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-levi-cohomology-realization` (theorem): The boundary Levi realization.
Mathematical signature: For i>0, the induced interior cohomology of the GL_n Levi locally symmetric space in HLTT Corollary 6.25 occurs as a subquotient of W₀H^{i+1}_{c−∂}. A regular algebraic GL_n cuspidal π, after all sufficiently large norm twists N, occurs in this interior-cohomology input by Corollary 1.9. Corollary 6.27 gives an actual rank-2n R(π,N) whose good-place parameter is rec(π_v|det|^{(1−n)/2})⊕rec(π^c_{cv}|det|^{(1−n)/2})^{∨,c}ε_p^{1−2n−2N}.
Hypotheses: n>1; exact Levi arithmetic quotient, coefficient representation ρ and π∞ with the infinitesimal character of ρ∨; N sufficiently large; good source places q≠p split in F₀ or unramified in F with π spherical above q.
Signature omitted where not prototyped above. Missing objects: the ordinary mixed Shimura dagger/boundary cohomology, integral Hecke actions and continuous determinant/representation carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-stratum-weight-zero-sequence; AutomorphicGaloisRepresentationsPartII:AG2.4/logarithmic-cusp-section-spectral-sequence; AutomorphicFormsOnReductiveGroups:AF.1; EndoscopicTransferAndUnitaryTraceComparison:ET.7a
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-factor-separation-specialization` (theorem): Separating the two HLTT rank-n factors.
Mathematical signature: The representations R(π,N) for all sufficiently large N satisfy HLTT Proposition 7.12 with Γ=G_{F,S}, dense good Frobenius set, µ=ε_p^−2 and two n-element root multisets E₁,E₂ independent of N, the constant ε_p^{1−2n} correction absorbed into E₂. Each µ(Frob_v) has infinite order. The generic factor-separation theorem therefore gives continuous semisimple rank-n representations for each multiset. The first is the good-place attached r(π), uniquely determined by Frobenius polynomials.
Hypotheses: One finite S for all N; Γ topological, algebraically closed characteristic-zero coefficient field; all R(π,N) continuous semisimple; infinitely many exponents and infinite-order µ on the determining dense set.
Signature omitted where not prototyped above. Missing objects: the ordinary mixed Shimura dagger/boundary cohomology, integral Hecke actions and continuous determinant/representation carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-levi-cohomology-realization; AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places; IntegralHeckeAndGaloisDeterminants:IHG.4
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/good-prime-unramified-polynomial` (theorem): Unramifiedness and the good-prime polynomial.
Mathematical signature: For each constructed polarized or nonselfdual rank-n r, outside its specified finite excluded set and v∤ℓ, r is unramified and det(X−r(Frob_v^geom))=ι^−1P_v(π_v;X). HLTT Corollary 7.14 proves this for v|q≠ℓ where π is unramified at every place above q, including field-ramified q after auxiliary descent. The polarized branch has the source’s unramified local-global comparison. The result includes every coefficient prime, while excluding the places above that prime.
Hypotheses: The relevant existence theorem and its actual common ramification set; π cuspidal regular algebraic, polarized only in the corresponding branch.
Signature omitted where not prototyped above. Missing objects: the constructed global representation, genuine local WD parameter with N, local Langlands and the indicated geometric/purity comparison carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris; AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems; AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources; AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/monodromy-order-interface` (comparison): The monodromy dominance interface.
Mathematical signature: Import WD, Frobenius semisimplification, WD semisimplification and monodromy filtration from R01.2. For equal semisimple Weil representations, Varma’s ≺ compares decreasing Sp-block partitions separately in each irreducible Weil unramified-twist class: every initial sum on the first side is ≤ the second. The inertial relation ≺_I compares the corresponding N-block partitions in every irreducible inertia isotype. Lemma 9.2 identifies them when the semisimple Weil parts agree. Equivalently all ranks of positive powers of each isotypic N on the first side are ≤ the second; one rank is insufficient.
Hypotheses: Characteristic zero; finite inertial Weil image; same semisimple Weil part when identifying the two orders.
Signature omitted where not prototyped above. Missing objects: the constructed global representation, genuine local WD parameter with N, local Langlands and the indicated geometric/purity comparison carriers.
Direct owners/contracts: ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation; ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification; ArithmeticGaloisRepresentations:R01.2/monodromy-filtration; ArithmeticGaloisRepresentations:R01.2
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-integral-bernstein-operators` (theorem): Integral Bernstein operators on the ordinary family.
Mathematical signature: At the unitary split places v∤p, the Bernstein centres of the finitely many components permitted by the fixed local level supply operators whose value at a classical or ordinary cusp eigensystem Π is tr rec(BC(Π)_v|det|^{(1−2n)/2})(σ), for every σ∈W_{F_v}. After the source common denominator d(z), these operators preserve the integral cusp-section lattices used in the Hasse congruences. The bound idempotent e_{Π,B} selects points whose local parameter is dominated by that of the target Π.
Hypotheses: Finite union of actual Bernstein components at the split local G_n factor; fixed level; source integral denominator and idempotent.
Signature omitted where not prototyped above. Missing objects: the constructed global representation, genuine local WD parameter with N, local Langlands and the indicated geometric/purity comparison carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance; AutomorphicGaloisRepresentationsPartII:AG2.4/hasse-weight-changing-congruence; SmoothRepresentationsOfLocalGroups:SR.3; SmoothRepresentationsOfLocalGroups:SR.5; EndoscopicTransferAndUnitaryTraceComparison:ET.6
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-local-trace-congruence` (theorem): Local Weil traces through the HLTT congruences.
Mathematical signature: Include the denominator-corrected Bernstein operators in the uniform classical-to-ordinary Hecke congruences. The resulting continuous degree-2n pseudocharacter has T(σ_v)=tr rec(BC(Π)_v|det|^{(1−2n)/2})(σ_v) at every split v∤p and every Weil element σ_v. Semisimple reconstruction therefore identifies the entire semisimple local Weil representation, not just its good unramified Frobenius polynomial.
Hypotheses: The integral operators, arbitrary-modulus congruences, common ramification set and characteristic-zero pseudocharacter continuity.
Signature omitted where not prototyped above. Missing objects: the constructed global representation, genuine local WD parameter with N, local Langlands and the indicated geometric/purity comparison carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.5/varma-integral-bernstein-operators; AutomorphicGaloisRepresentationsPartII:AG2.4/uniform-integral-hecke-congruence-witnesses; AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-hecke-determinant-limit; IntegralHeckeAndGaloisDeterminants:IHG.4; ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification; AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-monodromy-rank-bound` (theorem): Monodromy bounds through exterior trace identities.
Mathematical signature: For the interpolated 2n representation at a split place, WD(r(Π)_v)^{F-ss}≺rec(BC(Π)_v|det|^{(1−2n)/2}). The source detects inertial nilpotent type by all exterior-power vanishing identities for powers of b_{η,ζ}=g_η−ζa_η, and transfers the associated pseudocharacter functions B_{η,ζ}^{k,j} across the integral bound idempotent. This proves rank inequalities for every monodromy power in every inertia isotype, then Lemma 9.2 gives the Weil order.
Hypotheses: Semisimple global representation; nondegenerate trace pairing on its semisimple image algebra; all η, p-power ζ, j,k>0 of Varma Lemma 9.7; the target Bernstein idempotent.
Signature omitted where not prototyped above. Missing objects: the constructed global representation, genuine local WD parameter with N, local Langlands and the indicated geometric/purity comparison carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.5/monodromy-order-interface; AutomorphicGaloisRepresentationsPartII:AG2.5/varma-local-trace-congruence; AutomorphicGaloisRepresentationsPartII:AG2.5/varma-integral-bernstein-operators; IntegralHeckeAndGaloisDeterminants:IHG.4; tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-2-artin-wedderburn-assembled-with-uniqueness
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance` (construction): The tensor-square geometric instance.
Mathematical signature: For the source auxiliary CM extensions F/F′/L and π with local Iwahori invariants, choose the compact unitary datum with signatures (1,n−1) at two distinguished real places and (0,n) at the others. Its dimension is 2n−2. The selected cohomological automorphic packet and corrected coefficient projector realize the tensor square of the already constructed rank-n representation, with the scalar character and multiplicity corrections of Caraiani §7. The integral model is locally étale over a product of two semistable charts at the chosen split prime.
Hypotheses: The solvable extensions and two split distinguished p-adic places of the proof of Theorem 7.4; cuspidality preserved, relevant local components Iwahori fixed and exact source coefficient twists.
Signature omitted where not prototyped above. Missing objects: the two-signature compact PEL variety, product semistable charts, corrected coefficient cohomology and the constructed tensor-square Galois representation.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris; AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector; PELModuli:M4; EndoscopicTransferAndUnitaryTraceComparison:ET.7a; LefschetzPencilsAndVanishingCycles:LPV.6
-/
/- API `TensorSquareInstance.signature` (characterisation): Exactly two nondefinite signatures give dimension 2n−2.
Missing-object note: the two-signature compact PEL variety, product semistable charts, corrected coefficient cohomology and the constructed tensor-square Galois representation. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TensorSquareInstance.charts` (projection): The local model is étale over the product of the two specified semistable charts.
Missing-object note: the two-signature compact PEL variety, product semistable charts, corrected coefficient cohomology and the constructed tensor-square Galois representation. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TensorSquareInstance.constituent` (compatibility): After the source scalar/multiplicity correction the selected middle cohomology realizes r(π)⊗r(π).
Missing-object note: the two-signature compact PEL variety, product semistable charts, corrected coefficient cohomology and the constructed tensor-square Galois representation. A fragment already declared above is only the stated weight or polynomial computation. -/
/- API `TensorSquareInstance.actions` (functoriality): This identification preserves Hecke and Weil actions with N acting as N⊗1+1⊗N.
Missing-object note: the two-signature compact PEL variety, product semistable charts, corrected coefficient cohomology and the constructed tensor-square Galois representation. A fragment already declared above is only the stated weight or polynomial computation. -/
/- Test `TensorSquareInstance.rankTwo` (small): n=2 gives a two-dimensional Shimura variety and a rank-four tensor-square constituent.
An example requiring the full object is omitted because the two-signature compact PEL variety, product semistable charts, corrected coefficient cohomology and the constructed tensor-square Galois representation. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TensorSquareInstance.dimension` (non-example): The single-signature Shin variety cannot replace the dimension-2n−2 model.
An example requiring the full object is omitted because the two-signature compact PEL variety, product semistable charts, corrected coefficient cohomology and the constructed tensor-square Galois representation. The expressible scalar/weight examples above retain the available fragment only. -/
/- Test `TensorSquareInstance.monodromy` (compatibility): If one tensor factor has N=0, the tensor monodromy is the operator on the other factor, not zero.
An example requiring the full object is omitted because the two-signature compact PEL variety, product semistable charts, corrected coefficient cohomology and the constructed tensor-square Galois representation. The expressible scalar/weight examples above retain the available fragment only. -/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/two-chart-nearby-cycle-monodromy` (comparison): Nearby cycles of the two-chart instance.
Mathematical signature: Import the product nearby-cycle theorem of Caraiani Theorems 4.6 and 4.10 from LPV.6. On the tensor-square instance RΨ of the product is the derived tensor product of the two factors, and N=N₁⊗1+1⊗N₂. The two monodromy filtrations yield Corollary 4.29’s double-filtered stratum spectral sequence, compatible with the corrected projector, Hecke and Weil actions.
Hypotheses: The actual étale-local product of semistable charts, all shifts and Tate twists, and coefficient projector equivariance.
Signature omitted where not prototyped above. Missing objects: the constructed global representation, genuine local WD parameter with N, local Langlands and the indicated geometric/purity comparison carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance; LefschetzPencilsAndVanishingCycles:LPV.6; AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-stratum-concentration` (theorem): Cohomology of the two-chart strata.
Mathematical signature: For the source Π^{1,S}-isotypic part, the stratum Y_{S,T} of the two-chart integral model has coefficient cohomology zero outside j=2n−|S|−|T|, as in Caraiani Proposition 5.10. Its surviving graded pieces have the explicit Igusa/Mantovan trace calculation of Proposition 5.8. These are characteristic-zero automorphic stratum calculations under the source §5 datum; torsion concentration is not used.
Hypotheses: The exact two-signature datum, selected packet, local Iwahori levels and source ST/END transfer hypotheses.
Signature omitted where not prototyped above. Missing objects: the constructed global representation, genuine local WD parameter with N, local Langlands and the indicated geometric/purity comparison carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance; AutomorphicGaloisRepresentationsPartII:AG2.1b/shin-st-end-igusa-computation; AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula; IgusaVarietiesAndTorsionConcentration:IG.1; EndoscopicTransferAndUnitaryTraceComparison:ET.7b
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/racsdc-temperedness` (theorem): Temperedness of regular unitary-type cuspidal forms.
Mathematical signature: Every regular algebraic conjugate-self-dual cuspidal π on GL_n over CM L has tempered local components at all finite places. With every coefficient conjugate accounted for, the normalized local parameter is pure of weight n−1 in geometric normalization. This is the automorphic purity input to the monodromy comparison; arbitrary nonselfdual π is outside this theorem.
Hypotheses: Regular algebraic CSD cuspidal, source solvable-base-change descent and all coefficient embeddings.
Signature omitted where not prototyped above. Missing objects: the constructed global representation, genuine local WD parameter with N, local Langlands and the indicated geometric/purity comparison carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-stratum-concentration; AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change; EndoscopicTransferAndUnitaryTraceComparison:ET.6; ArithmeticGaloisRepresentations:R01.2/purity-of-weil-deligne-representations
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/tensor-square-weight-spectral-sequence` (theorem): Purity from the double weight spectral sequence.
Mathematical signature: Caraiani Proposition 7.2 supplies the double-filtered nearby-cycle spectral sequence for the Π^{1,S} part of the corrected Kuga tower, with N taking Gr_l Gr_k to Gr_{l+1} Gr_{k−1}. Its secondary stratum sequence has |S|=j+s, |T|=j+k+l−s+1 and coefficient degree m−2j−k−l+1 with twist −j−k+1. Stratum concentration forces m=2n−2, gives the source degeneration, and proves WD of the selected H^{2n−2} is pure of weight m_ξ−2t_ξ+2n−2.
Hypotheses: Exact stratum purity and the two-chart nearby-cycle comparison, equivariant projector and coefficient twists; no unproved general weight-monodromy conjecture is assumed.
Signature omitted where not prototyped above. Missing objects: the constructed global representation, genuine local WD parameter with N, local Langlands and the indicated geometric/purity comparison carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.5/two-chart-nearby-cycle-monodromy; AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-stratum-concentration; DeligneWeightsAndPurity:DWP.8; ArithmeticGaloisRepresentations:R01.2/monodromy-filtration
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/pure-weil-deligne-comparison` (comparison): Pure Weil–Deligne comparison up to equivalence.
Mathematical signature: For the semisimple Weil representation shared by the Galois and automorphic sides, TY Lemma 1.4(4) determines at most one pure WD extension up to equivalence. Import purity and filtration from R01.2 and request the full primitive-string uniqueness, finite-extension equivalence and tensor-square detection. Apply it only after geometric purity of the Galois side and tempered purity of the automorphic side are proved. Do not replace purity with maximal rank of N: BCGP Lemma 2.5.1’s general maximal-rank uniqueness claim has the counterexample recorded in E3.
Hypotheses: Characteristic-zero algebraically closed field and semisimple Weil part; equivalence means a Weil-equivariant isomorphism carrying one N to the other.
Signature omitted where not prototyped above. Missing objects: the constructed global representation, genuine local WD parameter with N, local Langlands and the indicated geometric/purity comparison carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.5/tensor-square-weight-spectral-sequence; AutomorphicGaloisRepresentationsPartII:AG2.5/racsdc-temperedness; AutomorphicGaloisRepresentationsPartII:AG2.5/monodromy-order-interface; ArithmeticGaloisRepresentations:R01.2/purity-of-weil-deligne-representations; ArithmeticGaloisRepresentations:R01.2/pure-graded-weil-deligne; ArithmeticGaloisRepresentations:R01.2
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/ch-polarized-local-monodromy-bound` (theorem): The polarized local comparison from the definite family.
Mathematical signature: For the arbitrary-regular polarized CH representation, at every v away from the coefficient prime the Frobenius-semisimplified WD parameter is dominated by the normalized local parameter of π. In particular their semisimple Weil parts agree. This is CH Theorem 3.2.3(a′), obtained from the tame Bernstein/monodromy restrictions in Theorem 2.3 and effective patching. It precedes the pure-WD upgrade and supplies that upgrade’s semisimple comparison without using Varma’s general nonselfdual theorem.
Hypotheses: CH General Hypotheses 1.1, the definite-unitary interpolation and source Bernstein restrictions; extend essentially polarized forms by the prescribed character twist.
Signature omitted where not prototyped above. Missing objects: the constructed global representation, genuine local WD parameter with N, local Langlands and the indicated geometric/purity comparison carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris; AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance; AutomorphicGaloisRepresentationsPartII:AG2.3/definite-family-determinant-interpolation; AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching; AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-index-induction; AutomorphicGaloisRepresentationsPartII:AG2.5/monodromy-order-interface; SmoothRepresentationsOfLocalGroups:SR.3; IntegralHeckeAndGaloisDeterminants:IHG.4
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/published-racsdc-comparison-specializations` (comparison): Published RACSDC comparison specializations.
Mathematical signature: For the RACSDC systems, specialize the normalized away-prime compatibility to the relevant weight-zero representations of Liu et al. Proposition 3.2.4 and to BCGP25 RACSDC paragraph following equation (1.8.21). Published CS Theorem 5.5.4 supplies its polarized rank-n system and away-prime comparison; Corollary 5.5.5 treats the discrete sum separately. The p-adic WD comparison, de Rham assertions, coefficient conjugation and strong coefficient field are AG2.6 exports. Liu Hypothesis 3.2.10 is a conditional identification of a Shimura isotypic middle degree, not an unconditional realization for every π; Proposition 3.2.11’s stated range and its unpublished KSZ input are retained.
Hypotheses: Relevant means the CSD cohomological infinity type of Liu Definition 1.1.3; the chosen automorphic coefficient field and embeddings; no universal use of Hypothesis 3.2.10.
Signature omitted where not prototyped above. Missing objects: the constructed global representation, genuine local WD parameter with N, local Langlands and the indicated geometric/purity comparison carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness; AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality; AutomorphicGaloisRepresentationsPartII:AG2.2/cs-discrete-polarization-normalization
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/automorphic-polarization-and-sign` (theorem): The polarization sign of the constructed system.
Mathematical signature: For the constructed regular algebraic polarized cuspidal pair (π,χ), r^c≅r∨⊗ε_ℓ^{1−n}r(χ)|_{G_F}. After the E2 parity normalization every conjugate-self-dual irreducible factor has Bellaïche–Chenevier sign +1, and the representation admits the G7 polarized-extension structure with totally odd multiplier µ=ε_ℓ^{1−n}r(χ). The good-place dual identity alone supplies the self-duality isomorphism; the sign theorem is the independent input needed for the prescribed symmetric polarization.
Hypotheses: The normalized polarized pair and algebraic twisting character; characteristic-zero semisimple r; irreducible factors fixed by the dual-conjugation operation as in BC Theorem 1.2.
Signature omitted where not prototyped above. Missing objects: the definite-unitary automorphic eigenvariety and its continuous determinant, effective base change/patching and constructed Galois representation.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris; AutomorphicGaloisRepresentationsPartII:AG2.2/algebraic-character-polarization-twist; AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation; AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier; GlobalGaloisDeformations:G7/polarized-deformation-problem; GlobalGaloisDeformations:G7
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.3/finite-number-field-of-realization` (theorem): A common finite field of realization in the polarized range.
Mathematical signature: For the CH polarized π, there is a number field E(π) containing its trace field such that every coefficient-prime representation has a model over E(π)_λ. Obtain two auxiliary good Frobenius polynomials with n distinct roots and distinct residue characteristics, adjoin their roots to the trace field, and use R01.5 rational-eigenvalue descent at a place away from each coefficient prime. This is a field of realization, not an assertion that the minimal trace field itself is sufficient.
Hypotheses: CH regular de Rham/Hodge–Tate input used by the Serre Zariski-closure argument; uniform good polynomials and their number field; two auxiliary residue characteristics.
Signature omitted where not prototyped above. Missing objects: the definite-unitary automorphic eigenvariety and its continuous determinant, effective base change/patching and constructed Galois representation.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris; AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality; ArithmeticGaloisRepresentations:R01.5/rational-eigenvalue-descent; PadicHodgeTheory:R06.2
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.5/late-gl2-modular-comparison` (comparison): Comparison with the classical GL₂ constructions.
Mathematical signature: For a classical or Hilbert modular eigenform in the overlap of the source hypotheses, compare the constructed rank-two automorphic r with the classical R19.1/R19.2 representation after the explicit dual/cyclotomic and geometric-versus-arithmetic conversion. Equality of the good polynomials implies semisimple isomorphism. In the local range where R19.4 proves its own comparison, transport that comparison through the isomorphism. R19 is a consumer comparison, not an input to arbitrary-rank existence or raw geometry.
Hypotheses: Both independently constructed representations exist; identical weight, nebentype, embedding and Frobenius convention after conversion; only the actual R19 local range is used.
Signature omitted where not prototyped above. Missing objects: the constructed global representation, genuine local WD parameter with N, local Langlands and the indicated geometric/purity comparison carriers.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.5/good-prime-unramified-polynomial; IntegralHeckeAndGaloisDeterminants:IHG.3/rank-two-modular-normalization; AutomorphicGaloisRepresentations:R19.1; AutomorphicGaloisRepresentations:R19.2; AutomorphicGaloisRepresentations:R19.4
-/
/-
Declaration `AutomorphicGaloisRepresentationsPartII:AG2.0/relevant-automorphic-coefficient-field` (comparison): The coefficient field of a relevant automorphic representation.
Mathematical signature: For relevant π in Liu et al. Definition 1.1.3, import Q(π) as the fixed field of automorphisms preserving π∞. Its local coefficient field is generated by coefficients of ∏_i(T−α_i q_v^{(N−1)/2}) at spherical places. Lemma 3.1.2 identifies Q(π) with the compositum of these local fields, using Clozel rationality and strong multiplicity one. This is an automorphic coefficient-field result; it does not prove Definition 3.2.5 strong Galois realization over each completion.
Hypotheses: Relevant regular algebraic CSD cuspidal π and normalized spherical parameters; all coefficient embeddings tracked.
Signature omitted where not prototyped above. Missing objects: the named automorphic/Hecke/Galois objects in the prerequisites; the number-field embedding and finite combinatorics fragments are available above.
Direct owners/contracts: AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality; AutomorphicFormsOnReductiveGroups:AF.4/rationality-field; AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality; AutomorphicFormsOnReductiveGroups:AF.4
-/
