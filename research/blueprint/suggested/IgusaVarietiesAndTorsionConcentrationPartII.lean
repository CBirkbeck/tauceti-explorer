import Mathlib.Algebra.Polynomial.Monic
import Mathlib.Algebra.Polynomial.BigOperators
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.Field.ZMod
import Mathlib.Tactic.NormNum.Prime

/-!
# Igusa varieties, compactified period fibres and torsion concentration, Part II:
# compact unitary Shimura varieties — suggested Lean forms

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/IgusaVarietiesAndTorsionConcentrationPartII.md` is definitive; the
statements below suggest Lean forms for the parts of the roadmap that can already be stated
against the pinned Mathlib and Tau Ceti, so that contributors and reviewers converge on names and
signatures.

The geometric and automorphic objects of the roadmap (compact unitary Shimura varieties and their
integral models, Igusa varieties, the Hodge–Tate period map, alternating Igusa cohomology,
Newton reduction, twisted trace formulas, Galois representations attached to automorphic
representations) have no carrier at the pins. They are README targets and are listed at the end
of this file. What is stated here is the arithmetic shadow that the end theorems are phrased in:
the signature data and the dimension of the Shimura variety (README IG.8.1), the Hecke polynomial
and the effect of the Hecke involution on its roots (README IG.8.4–IG.8.5), and decomposed
genericity and the Caraiani–Scholze auxiliary-pair condition on Frobenius eigenvalues
(README IG.8.7). An unramified residual representation at a place is recorded by the family of
its Frobenius eigenvalues; for invertible Frobenius these are nonzero.
-/

open Polynomial
open scoped BigOperators

namespace TauCetiRoadmap.IgusaVarietiesAndTorsionConcentrationPartII

/-! ## Layer IG.8: signature data and the dimension (README IG.8.1) -/

/-- README IG.8.1 (`CompactUnitaryDatum.signature`): the signatures `(p_τ, q_τ)` of a unitary
similitude group of rank `n` at a finite set `Φ` of complex embeddings of `F`, with
`p_τ + q_τ = n`. For the dimension formula `Φ` is a CM type. -/
structure SignatureData (Φ : Type*) [Fintype Φ] (n : ℕ) where
  /-- The first entry `p_τ` of the signature. -/
  p : Φ → ℕ
  /-- The second entry `q_τ` of the signature. -/
  q : Φ → ℕ
  /-- `p_τ + q_τ = n`. -/
  sum_eq : ∀ τ, p τ + q τ = n

namespace SignatureData

variable {Φ : Type*} [Fintype Φ] {n : ℕ}

/-- README IG.8.1 (`CompactUnitaryDatum.dim`): `d = Σ_{τ ∈ Φ} p_τ q_τ`, the dimension of the
Shimura variety when `Φ` is a CM type. -/
def dim (σ : SignatureData Φ n) : ℕ := ∑ τ, σ.p τ * σ.q τ

/-- The signature is definite at `τ`: `p_τ q_τ = 0`. -/
def IsDefiniteAt (σ : SignatureData Φ n) (τ : Φ) : Prop := σ.p τ * σ.q τ = 0

/-- The signature at the complex-conjugate embeddings: `(p_{τc}, q_{τc}) = (q_τ, p_τ)`
(README IG.8.1, `CompactUnitaryDatum.signature`). -/
def conj (σ : SignatureData Φ n) : SignatureData Φ n where
  p := σ.q
  q := σ.p
  sum_eq τ := by rw [add_comm]; exact σ.sum_eq τ

/-- Conjugation exchanges the two entries (test `CompactUnitaryDatum.signature_conj`). -/
@[simp] theorem conj_p (σ : SignatureData Φ n) (τ : Φ) : σ.conj.p τ = σ.q τ := rfl

/-- The dimension does not depend on the choice of CM type: replacing `Φ` by the conjugate
embeddings swaps `p` and `q` (README IG.8.1, `CompactUnitaryDatum.dim`). -/
theorem dim_conj (σ : SignatureData Φ n) : σ.conj.dim = σ.dim := by
  sorry

/-- The Shimura variety is zero-dimensional exactly when the signature is definite at every
embedding of the CM type. -/
theorem dim_eq_zero_iff (σ : SignatureData Φ n) : σ.dim = 0 ↔ ∀ τ, σ.IsDefiniteAt τ := by
  sorry

/-- The Harris–Taylor signature: `(1, n − 1)` at `τ₀` and `(0, n)` elsewhere. -/
def harrisTaylor [DecidableEq Φ] (τ₀ : Φ) (hn : 1 ≤ n) : SignatureData Φ n where
  p τ := if τ = τ₀ then 1 else 0
  q τ := if τ = τ₀ then n - 1 else n
  sum_eq τ := by split_ifs <;> omega

/-- README IG.8.1, acceptance: the Harris–Taylor signature has `d = n − 1`. -/
theorem harrisTaylor_dim [DecidableEq Φ] (τ₀ : Φ) (hn : 1 ≤ n) :
    (harrisTaylor τ₀ hn).dim = n - 1 := by
  sorry

/-- Test `CompactUnitaryDatum.dim_torus`: for `n = 1` the dimension is `0`. -/
example (σ : SignatureData Φ 1) : σ.dim = 0 := by
  sorry

/-- Test `CompactUnitaryDatum.dim_harris_taylor`: `n = 3`, `[F⁺ : ℚ] = 2`, signatures `(1, 2)`
and `(0, 3)`, so `d = 2`. -/
example : (⟨![1, 0], ![2, 3], by decide⟩ : SignatureData (Fin 2) 3).dim = 2 := by
  decide

end SignatureData

/-! ## Layer IG.8: the Hecke polynomial and the dual ideal (README IG.8.4–IG.8.5) -/

namespace compactUnitaryHecke

variable {R : Type*} [CommRing R]

/-- README IG.8.4 (`compactUnitaryHecke.heckePoly`): the Hecke polynomial
`P_v(X) = Σ_{i=0}^{n} (−1)^i q^{i(i−1)/2} T_i X^{n−i}`, for the images `T i` of the operators
`T_{i,v}` in a commutative ring and `q = q_v`. The operator `T_{0,v}` is the unit. -/
noncomputable def heckePoly (n : ℕ) (q : R) (T : ℕ → R) : R[X] :=
  ∑ i ∈ Finset.range (n + 1), C ((-1) ^ i * q ^ (i * (i - 1) / 2) * T i) * X ^ (n - i)

/-- README IG.8.4 (`compactUnitaryHecke.heckePoly_monic`): `P_v` is monic of degree `n`. -/
theorem heckePoly_monic [Nontrivial R] (n : ℕ) (q : R) (T : ℕ → R) (hT : T 0 = 1) :
    (heckePoly n q T).Monic := by
  sorry

/-- README IG.8.4: the constant term is `(−1)^n q^{n(n−1)/2} T_n`. -/
theorem heckePoly_coeff_zero (n : ℕ) (q : R) (T : ℕ → R) :
    (heckePoly n q T).coeff 0 = (-1) ^ n * q ^ (n * (n - 1) / 2) * T n := by
  sorry

/-- Test `compactUnitaryHecke.heckePoly_n1`: `P_v(X) = X − T_{1,v}` for `n = 1`. -/
example (q : R) (T : ℕ → R) (hT : T 0 = 1) : heckePoly 1 q T = X - C (T 1) := by
  sorry

/-- Test `compactUnitaryHecke.heckePoly_n2`: `P_v(X) = X² − T_{1,v} X + q_v T_{2,v}`. -/
example (q : R) (T : ℕ → R) (hT : T 0 = 1) :
    heckePoly 2 q T = X ^ 2 - C (T 1) * X + C (q * T 2) := by
  sorry

/-- README IG.8.5 (dual ideal, part (2)): the involution `ι(T_{i,v}) = T_{n,v}^{−1} T_{n−i,v}`
replaces the roots `λ_j` of `P_v` by `q^{n−1} λ_j^{−1}`. -/
theorem heckePoly_dual {K : Type*} [Field K] (n : ℕ) (q : K) (T : ℕ → K) (ev : Fin n → K)
    (hq : q ≠ 0) (hT0 : T 0 = 1) (hTn : T n ≠ 0)
    (h : heckePoly n q T = ∏ j, (X - C (ev j))) :
    heckePoly n q (fun i => (T n)⁻¹ * T (n - i)) = ∏ j, (X - C (q ^ (n - 1) / ev j)) := by
  sorry

end compactUnitaryHecke

/-! ## Layer IG.8: decomposed genericity and auxiliary pairs (README IG.8.5, IG.8.7) -/

section Genericity

variable {K : Type*} [Field K] {k : ℕ}

/-- `𝔽₁₁` is a field, for the numerical checks below. -/
local instance fact_prime_eleven : Fact (Nat.Prime 11) := ⟨by norm_num⟩

/-- README IG.8.7: an unramified residual representation with Frobenius eigenvalues `λ` at a place
with residue cardinality `q` is decomposed generic: `λ_a / λ_b ∉ {1, q}` for all `a ≠ b`
(Caraiani–Scholze Definition 1.9 = 6.2.1; AutomorphicGaloisRepresentationsPartII AG2.7). -/
def IsDecomposedGeneric (q : K) (ev : Fin k → K) : Prop :=
  ∀ a b, a ≠ b → ev a / ev b ≠ 1 ∧ ev a / ev b ≠ q

/-- README IG.8.5: the eigenvalues `q^{n−1} λ_j^{−1}` of the dual system. -/
def dualEigen (q : K) (n : ℕ) (ev : Fin k → K) : Fin k → K := fun j => q ^ (n - 1) / ev j

/-- README IG.8.5 (4) (`IsCSAuxiliaryPair.dual_twist`): decomposed genericity is invariant
under passing to the dual system. -/
theorem isDecomposedGeneric_dualEigen (q : K) (n : ℕ) (ev : Fin k → K) (hq : q ≠ 0)
    (hev : ∀ j, ev j ≠ 0) :
    IsDecomposedGeneric q (dualEigen q n ev) ↔ IsDecomposedGeneric q ev := by
  sorry

/-- README IG.8.5, check `(𝔪^∨)^∨ = 𝔪`: dualizing twice returns the eigenvalues. -/
theorem dualEigen_dualEigen (q : K) (n : ℕ) (ev : Fin k → K) (hq : q ≠ 0) :
    dualEigen q n (dualEigen q n ev) = ev := by
  sorry

/-- Test `IsCSAuxiliaryPair.n1`: with one eigenvalue there are no pairs to test. -/
theorem isDecomposedGeneric_of_le_one (q : K) (ev : Fin k → K) (hk : k ≤ 1) :
    IsDecomposedGeneric q ev := by
  sorry

/-- Test `IsCSAuxiliaryPair.generic_pair`: eigenvalues `{1, 2}` at `q = 7` over `𝔽₁₁`. -/
example : IsDecomposedGeneric (7 : ZMod 11) ![1, 2] := by
  sorry

/-- Test `IsCSAuxiliaryPair.repeated_eigenvalue`: a repeated eigenvalue is not decomposed
generic. -/
example : ¬ IsDecomposedGeneric (7 : ZMod 11) ![3, 3] := by
  sorry

/-- Test `IsCSAuxiliaryPair.ratio_q`: eigenvalues `{1, q}` are not decomposed generic. -/
example : ¬ IsDecomposedGeneric (7 : ZMod 11) ![7, 1] := by
  sorry

/-- README IG.8.5, acceptance: the dual of the eigenvalues `{1, 2}` at `q_v = 7`, `n = 2`,
over `𝔽₁₁` is `{7, 9}`. -/
example : dualEigen (7 : ZMod 11) 2 ![1, 2] = ![7, 9] := by
  sorry

/-- README IG.8.7 (`IsCSAuxiliaryPair`), eigenvalue form: `place τ = some i` when
`ι_p^{−1} ∘ τ` induces the prime `𝔭_i` of `F` above `u` (so `S_i = place⁻¹(some i)`), `q i` is
the residue cardinality of `𝔭_i` and `ev i` the Frobenius eigenvalues of the residual
representation at `𝔭_i`. The pair is auxiliary when each `S_i` contains at most one
non-definite embedding, and the representation is decomposed generic at every `𝔭_i` whose
`S_i` contains one. -/
def IsCSAuxiliaryPair {Φ : Type*} [Fintype Φ] {n m : ℕ} (σ : SignatureData Φ n)
    (place : Φ → Option (Fin m)) (q : Fin m → K) (ev : Fin m → Fin n → K) : Prop :=
  (∀ i τ₁ τ₂, place τ₁ = some i → place τ₂ = some i → ¬ σ.IsDefiniteAt τ₁ →
      ¬ σ.IsDefiniteAt τ₂ → τ₁ = τ₂) ∧
    ∀ i, (∃ τ, place τ = some i ∧ ¬ σ.IsDefiniteAt τ) → IsDecomposedGeneric (q i) (ev i)

/-- README IG.8.7 (`IsCSAuxiliaryPair.trivial_if_definite`): for a definite signature every
pair is auxiliary. -/
theorem isCSAuxiliaryPair_of_definite {Φ : Type*} [Fintype Φ] {n m : ℕ} (σ : SignatureData Φ n)
    (place : Φ → Option (Fin m)) (q : Fin m → K) (ev : Fin m → Fin n → K)
    (h : ∀ τ, σ.IsDefiniteAt τ) : IsCSAuxiliaryPair σ place q ev := by
  sorry

/-- README IG.8.7 (`IsCSAuxiliaryPair.of_totally_split`): if every `S_i` has at most one element
(`p` totally split in `F`) and the representation is decomposed generic at every `𝔭_i`, the pair
is auxiliary. -/
theorem isCSAuxiliaryPair_of_injective {Φ : Type*} [Fintype Φ] {n m : ℕ}
    (σ : SignatureData Φ n) (place : Φ → Option (Fin m)) (q : Fin m → K) (ev : Fin m → Fin n → K)
    (hinj : ∀ τ₁ τ₂ i, place τ₁ = some i → place τ₂ = some i → τ₁ = τ₂)
    (hgen : ∀ i, IsDecomposedGeneric (q i) (ev i)) : IsCSAuxiliaryPair σ place q ev := by
  sorry

/-- Test `IsCSAuxiliaryPair.two_nontrivial`: two non-definite embeddings in the same `S_i`
violate the condition, whatever the eigenvalues. -/
example (q : Fin 1 → ZMod 11) (ev : Fin 1 → Fin 2 → ZMod 11) :
    ¬ IsCSAuxiliaryPair (⟨![1, 1], ![1, 1], by decide⟩ : SignatureData (Fin 2) 2)
      (fun _ => some 0) q ev := by
  sorry

end Genericity

end TauCetiRoadmap.IgusaVarietiesAndTorsionConcentrationPartII

/-!
## Statements not typed at the pins

The following definitions, API items and unit tests of the roadmap have no carrier at the pinned
Mathlib and Tau Ceti (compact unitary PEL data and Shimura varieties, their integral models, the
local datum at an auxiliary prime, the spherical Hecke algebras of `G(ℚ_q)` as rings of double
cosets of the actual groups, alternating Igusa cohomology and its Galois parts), so they are
specified in the roadmap document and not stated here.

- README IG.8.1 (Compact unitary PEL data of Caraiani–Scholze (Cases 1 and 2)): `CompactUnitaryDatum`, `CompactUnitaryDatum.case1`, `CompactUnitaryDatum.case2`, `CompactUnitaryDatum.dim_eq_two_rho_mu`, `CompactUnitaryDatum.toPELDatum`, `CompactUnitaryDatum.moduli_eq_ker1_copies`, `CompactUnitaryDatum.case2_not_imaginaryQuadratic`, `CompactUnitaryDatum.case2_indefinite_not_compact`, `CompactUnitaryDatum.toPELDatum_typeA`
- README IG.8.3 (The local datum at an auxiliary prime split in 𝒦 and the sets S_i): `SplitPrimeDatum.places`, `SplitPrimeDatum.embeddingSet`, `SplitPrimeDatum.embeddingSet_disjoint`, `SplitPrimeDatum.groupIso`, `SplitPrimeDatum.kottwitzSet_prod`, `SplitPrimeDatum.kottwitzSet_shapiro`, `SplitPrimeDatum.kottwitzSet_central`, `SplitPrimeDatum.totally_split`, `SplitPrimeDatum.harris_taylor_single`, `SplitPrimeDatum.central_twist`, `SplitPrimeDatum.composite_undefined`
- README IG.8.4 (The Hecke algebra 𝕋^S, the operators T_{i,v} and the Hecke polynomial): `compactUnitaryHecke`, `compactUnitaryHecke.T`, `compactUnitaryHecke.T_top_isUnit`, `compactUnitaryHecke.commutative`, `compactUnitaryHecke.restrict`, `compactUnitaryHecke.satake`, `compactUnitaryHecke.T_zero`, `compactUnitaryHecke.similitude_factor`, `compactUnitaryHecke.satake_compat`
- README IG.8.7 (Caraiani–Scholze auxiliary primes for a residual representation): `IsCSAuxiliaryPair.semisimplification`
- README IG.9.4 (The r-part of the base-changed Igusa class): `igusaGaloisPart`, `igusaGaloisPart_add`, `igusaGaloisPart_eq_zero_of_not_occurs`, `igusaGaloisPart_iso`, `igusaGaloisPart_frobenius`, `igusaGaloisPart_zero_class`, `igusaGaloisPart_sum`, `igusaGaloisPart_not_bcp`, `igusaGaloisPart_n1`
- README IG.10.5 (The r-part of the Igusa class of a simple Shimura variety): `simpleIgusaGaloisPart`, `simpleIgusaGaloisPart_sum`, `simpleIgusaGaloisPart_iso`, `simpleIgusaGaloisPart_eq_zero_iff`, `simpleIgusaGaloisPart_frobenius`, `simpleIgusaGaloisPart_zero`, `simpleIgusaGaloisPart_n1`, `simpleIgusaGaloisPart_red_zero`, `simpleIgusaGaloisPart_not_pointwise`

- Theorems stated in the README only (their carriers are not at the pins): IG.8.2, IG.8.5, IG.8.6, IG.8.8, IG.9.1, IG.9.2, IG.9.3, IG.9.5, IG.9.6, IG.10.1, IG.10.2, IG.10.3, IG.10.4, IG.10.6, IG.11.1, IG.11.2, IG.11.3, IG.11.4, IG.11.5, IG.11.6, IG.11.7, IG.11.8.
  The arithmetic shadows of README IG.8.1, IG.8.4, IG.8.5 and IG.8.7 are stated above.
-/
