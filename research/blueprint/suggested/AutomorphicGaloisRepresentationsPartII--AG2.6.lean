/-
Suggested Lean forms for “Galois representations attached to regular algebraic
 automorphic representations of GL_n”, stages AG2.6 and AG2.7.

This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/AutomorphicGaloisRepresentationsPartII--AG2.6.md is
 definitive. These statements suggest Lean forms so contributors and reviewers
 converge on names and signatures. All planned declarations remain unchecked.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. Only individual Mathlib modules are
 imported. No supplier's compatible-system carrier is redefined.

Section 13 fragments: mathematical statements and missing conditions are
catalogued in the reader's “Prototype boundaries” table and in each packet node's
suggestedCoverage. Parameters named System and its projections stand for the
single external R24.5 data carrier, not an AG2 definition of that carrier.
There is no invented automorphic representation or period-module type. Local
matrices, actual Mathlib representations, filtrations and coefficient maps are
used where those suppliers are unavailable. Consequently a theorem with omitted
automorphic/geometric hypotheses is a proposed signature, not a theorem about
arbitrary input matrices. Even an elaborated signature is implementation unchecked.
Definitions below have concrete bodies; only proofs and constructions use sorry.
-/

import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Algebra.Field.ZMod
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RepresentationTheory.Semisimple
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.Topology.Algebra.Module.FiniteDimension
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.Analysis.Complex.Basic
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

namespace TauCeti.AutomorphicGalois

set_option linter.unusedVariables false

open scoped BigOperators
open Polynomial

/-- The ACC+ ordered ratio condition on nonzero eigenvalues, with multiplicity. -/
def IsGenericEigenvalues {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) : Prop :=
  ∀ i j, i ≠ j → (α i : K) / (α j : K) ≠ q

/-- The Caraiani–Scholze stronger eigenvalue predicate. -/
def IsStrongGenericEigenvalues {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) : Prop :=
  IsGenericEigenvalues α q ∧ Function.Injective α

/-- Algebraic local prototype of ACC+ genericity. Supply actual local inertia
and Frobenius in the full signature. Coefficients are extended to the algebraic
closure, so this does not require Frobenius to split over the residue field. -/
def IsGeneric {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob : G) (q : k) : Prop :=
  (∀ g ∈ I, r g = 1) ∧
  ∃ α : Fin n → (AlgebraicClosure k)ˣ,
    ((((r frob).val).map (algebraMap k (AlgebraicClosure k))).charpoly =
      ∏ i, (X - C (α i : AlgebraicClosure k))) ∧
    IsGenericEigenvalues α (algebraMap k (AlgebraicClosure k) q)

/-- Algebraic local prototype of the stronger predicate over any local field. -/
def IsStrongGeneric {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob : G) (q : k) : Prop :=
  (∀ g ∈ I, r g = 1) ∧
  ∃ α : Fin n → (AlgebraicClosure k)ˣ,
    ((((r frob).val).map (algebraMap k (AlgebraicClosure k))).charpoly =
      ∏ i, (X - C (α i : AlgebraicClosure k))) ∧
    IsStrongGenericEigenvalues α (algebraMap k (AlgebraicClosure k) q)

lemma isGeneric_unramified {G k : Type*} [Group G] [Field k] {n : ℕ}
    {I : Subgroup G} {r : G →* Matrix.GeneralLinearGroup (Fin n) k}
    {frob : G} {q : k} (h : IsGeneric I r frob q) :
    ∀ g ∈ I, r g = 1 := h.1

/-- Two lifts with the same image give the same predicate. Killing inertia
 supplies this equality in the complete local signature. -/
lemma isGeneric_frobenius_independent {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob₁ frob₂ : G) (q : k) (h : r frob₁ = r frob₂) :
    IsGeneric I r frob₁ q ↔ IsGeneric I r frob₂ q := by
  unfold IsGeneric
  rw [h]

lemma isGenericEigenvalues_smul {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) (c : Kˣ) :
    IsGenericEigenvalues (fun i => c * α i) q ↔ IsGenericEigenvalues α q := by
  unfold IsGenericEigenvalues
  refine forall_congr' fun i => forall_congr' fun j => imp_congr_right fun _ => ?_
  simp only [Units.val_mul, mul_div_mul_left _ _ c.ne_zero]

lemma isGenericEigenvalues_reindex {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) (e : Fin n ≃ Fin n) :
    IsGenericEigenvalues (α ∘ e) q ↔ IsGenericEigenvalues α q :=
  sorry

lemma isGenericEigenvalues_inverse {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) :
    IsGenericEigenvalues (fun i => (α i)⁻¹) q ↔ IsGenericEigenvalues α q :=
  sorry

lemma strongGeneric_generic {G k : Type*} [Group G] [Field k] {n : ℕ}
    {I : Subgroup G} {r : G →* Matrix.GeneralLinearGroup (Fin n) k}
    {frob : G} {q : k} (h : IsStrongGeneric I r frob q) : IsGeneric I r frob q := by
  obtain ⟨hu, α, hc, hg, _⟩ := h
  exact ⟨hu, α, hc, hg⟩

/-- Distinct eigenvalues; a full representation signature also returns
squarefreeness of the split characteristic polynomial. -/
lemma strongGeneric_distinct {K : Type*} [Field K] {n : ℕ}
    {α : Fin n → Kˣ} {q : K} (h : IsStrongGenericEigenvalues α q) :
    Function.Injective α := h.2

/-- On a diagonal matrix the eigenvalue product is Mathlib's charpoly. -/
lemma diagonal_charpoly {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) :
    (Matrix.diagonal (fun i => (α i : K))).charpoly = ∏ i, (X - C (α i : K)) :=
  Matrix.charpoly_diagonal _

/-- Algebraic part of the integral/residual polynomial comparison. The full
statement adds the stable lattice, good place and semisimplification. -/
lemma goodPolynomialReduction {O k : Type*} [CommRing O] [CommRing k] {n : ℕ}
    (A : Matrix (Fin n) (Fin n) O) (red : O →+* k) :
    (A.map red).charpoly = A.charpoly.map red := Matrix.charpoly_map A red

/-- Test TauCeti.AutomorphicGalois.isGeneric_repeated_eigenvalue. -/
example : IsGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 2 := by
  intro i j _
  simp
  decide

instance prime_five : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩
instance prime_seven : Fact (Nat.Prime 7) := ⟨by decide⟩

def twoModFive : (ZMod 5)ˣ := Units.mk0 2 (by decide)
def threeModSeven : (ZMod 7)ˣ := Units.mk0 3 (by decide)

/-- Test TauCeti.AutomorphicGalois.not_isGeneric_distinct_ratio_q. -/
example : ¬ IsGenericEigenvalues ![twoModFive, 1] (2 : ZMod 5) := by
  intro h
  exact h 0 1 (by decide) (by simp [twoModFive])

/-- Test TauCeti.AutomorphicGalois.isGeneric_rank_one. -/
example {K : Type*} [Field K] (a : Kˣ) (q : K) :
    IsGenericEigenvalues (fun _ : Fin 1 => a) q := by
  intro i j hij
  exact (hij (Subsingleton.elim i j)).elim

/-- Test TauCeti.AutomorphicGalois.not_isGeneric_repeated_q_one. -/
example : ¬ IsGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 1 := by
  intro h
  exact h 0 1 (by decide) (by simp)

/-- Test TauCeti.AutomorphicGalois.strongGeneric_not_repeated. -/
example : IsGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 2 ∧
    ¬ IsStrongGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 2 := by
  constructor
  · intro i j _
    simp
    decide
  · intro h
    have hh := h.2 (a₁ := 0) (a₂ := 1) rfl
    exact (by decide : (0 : Fin 2) ≠ 1) hh

/-- Test TauCeti.AutomorphicGalois.strongGeneric_distinct_nonratio. -/
example : IsStrongGenericEigenvalues ![1, threeModSeven] (2 : ZMod 7) :=
  sorry

/-- Test TauCeti.AutomorphicGalois.strongGeneric_rank_one. -/
example {K : Type*} [Field K] (a : Kˣ) (q : K) :
    IsStrongGenericEigenvalues (fun _ : Fin 1 => a) q := by
  constructor
  · intro i j hij
    exact (hij (Subsingleton.elim i j)).elim
  · intro i j _
    exact Subsingleton.elim i j

/-- Test TauCeti.AutomorphicGalois.strongGeneric_non_Qp: the arithmetic part
of q=4 for an unramified quadratic extension of Q_2. -/
example : (4 : ZMod 3) = 1 ∧
    ¬ IsStrongGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 4 := by
  constructor
  · decide
  · intro h
    have hh := h.2 (a₁ := 0) (a₂ := 1) rfl
    exact (by decide : (0 : Fin 2) ≠ 1) hh

/-- Test TauCeti.AutomorphicGalois.residualRep_diagonal_reduction: matrix part. -/
example : (Matrix.diagonal ![(1 : ZMod 3), 2]).charpoly = X ^ 2 + C 2 :=
  sorry

/-- Test TauCeti.AutomorphicGalois.galoisType_charpoly_map. -/
example {O k : Type*} [CommRing O] [CommRing k] {n : ℕ}
    (A : Matrix (Fin n) (Fin n) O) (red : O →+* k) :
    (A.map red).charpoly = A.charpoly.map red := Matrix.charpoly_map A red

/-- Test TauCeti.AutomorphicGalois.galoisType_rank_one_polynomial: E3. -/
example (q T : ℤ) : (-1 : ℤ) ^ 1 * q ^ (1 * (1 - 1) / 2) * T = -T := by
  norm_num


/-- The determinant Hodge sum, an acceptance check on the labelled recipe. -/
theorem sum_expectedHodgeTate {n : ℕ} (a : Fin n → ℤ) :
    ∑ i : Fin n, (a i + ((n - 1 - i : ℕ) : ℤ)) =
    ∑ i : Fin n, a i + ((n * (n - 1) / 2 : ℕ) : ℤ) :=
  sorry

/-- A determinant Hodge sum cannot recover the rank-two multiset. -/
example : ({(0 : ℤ), 3} : Multiset ℤ).sum = ({(1 : ℤ), 2} : Multiset ℤ).sum ∧
    ({(0 : ℤ), 3} : Multiset ℤ) ≠ {(1 : ℤ), 2} := by decide

/-- CG and Pilloni's Hodge recipes agree under this parameter substitution.
Equality of automorphic representations additionally needs ML.4. -/
example (a b : ℤ) :
    ![0, -(2 - b), -(1 - a), -(1 - a) - (2 - b)] = ![0, b - 2, a - 1, a + b - 3] := by
  ext i
  fin_cases i <;> simp
  ring

/-- CG's ordinary roots have different valuation exponents in the regular range. -/
example (a b : ℤ) (hab : b ≤ a) (hb : 3 ≤ b) :
    0 < b - 2 ∧ b - 2 < a - 1 ∧ a - 1 < a + b - 3 := by
  omega

/-! Algebraic adapters use Mathlib's representation carrier and predicates.
They are local notation for checking the interfaces, not new roadmap owners. -/
abbrev GLn (n : ℕ) (K : Type*) [CommRing K] := Matrix.GeneralLinearGroup (Fin n) K

abbrev coeffChange {G K L : Type*} [Group G] [CommRing K] [CommRing L] {n : ℕ}
    (f : K →+* L) (r : G →* GLn n K) : G →* GLn n L :=
  (Matrix.GeneralLinearGroup.map f).comp r

def matrixRepresentation {G K : Type*} [Group G] [Field K] {n : ℕ}
    (r : G →* GLn n K) : Representation K G (Fin n → K) :=
  (Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp r)

abbrev Semisimple {G K : Type*} [Group G] [Field K] {n : ℕ} (r : G →* GLn n K) :=
  Representation.IsSemisimpleRepresentation (matrixRepresentation r)

abbrev AbsolutelyIrreducible {G k : Type*} [Group G] [Field k] {n : ℕ}
    (r : G →* GLn n k) :=
  Representation.IsIrreducible
    (matrixRepresentation (coeffChange (algebraMap k (AlgebraicClosure k)) r))

/-- Based expression of isomorphism; uniqueness never means equality of matrices. -/
def Conjugate {G K : Type*} [Group G] [Field K] {n : ℕ}
    (r s : G →* GLn n K) : Prop := ∃ b : GLn n K, ∀ g, s g = b * r g * b⁻¹

abbrev expectedHodgeTate {n : ℕ} (a : Fin n → ℤ) : Multiset ℤ :=
  (List.ofFn (fun i => a i + ((n - 1 - i.val : ℕ) : ℤ)) : Multiset ℤ)

section Assembly
variable {System Λ V T G K : Type*} [Group G] [Field K] {n : ℕ}

/-- Import the R24.5 assembly operation. No compatible-system carrier is declared
here. Its continuity, finite exceptional set and weak predicate are omitted. -/
def compatibleSystem
    (assemble : (Λ → (G →* GLn n K)) → (V → K[X]) → (T → Multiset ℤ) → System)
    (r : Λ → (G →* GLn n K)) (P : V → K[X]) (H : T → Multiset ℤ) : System :=
  assemble r P H

lemma compatibleSystem_member
    (assemble : (Λ → (G →* GLn n K)) → (V → K[X]) → (T → Multiset ℤ) → System)
    (member : System → Λ → (G →* GLn n K))
    (h : ∀ r P H, ∀ lam, Conjugate (member (assemble r P H) lam) (r lam))
    (r : Λ → (G →* GLn n K)) (P : V → K[X]) (H : T → Multiset ℤ) (lam : Λ) :
    Conjugate (member (compatibleSystem assemble r P H) lam) (r lam) := by
  exact h r P H lam

lemma compatibleSystem_goodPolynomial
    (assemble : (Λ → (G →* GLn n K)) → (V → K[X]) → (T → Multiset ℤ) → System)
    (polynomial : System → V → K[X]) (h : ∀ r P H, polynomial (assemble r P H) = P)
    (r : Λ → (G →* GLn n K)) (P : V → K[X]) (H : T → Multiset ℤ) (v : V) :
    polynomial (compatibleSystem assemble r P H) v = P v := by
  exact congrFun (h r P H) v

lemma compatibleSystem_hodgeTate
    (assemble : (Λ → (G →* GLn n K)) → (V → K[X]) → (T → Multiset ℤ) → System)
    (hodge : System → T → Multiset ℤ) (h : ∀ r P H, hodge (assemble r P H) = H)
    (r : Λ → (G →* GLn n K)) (P : V → K[X]) (a : T → Fin n → ℤ) (τ : T) :
    hodge (compatibleSystem assemble r P (fun τ => expectedHodgeTate (a τ))) τ =
      expectedHodgeTate (a τ) := by
  exact congrFun (h r P _) τ

/-- Only the good-polynomial component of Weak: the supplier's period predicates
cannot be stated at this baseline. The actual packet assertion is stronger. -/
lemma compatibleSystem_weak
    (assemble : (Λ → (G →* GLn n K)) → (V → K[X]) → (T → Multiset ℤ) → System)
    (member : System → Λ → (G →* GLn n K))
    (hm : ∀ r P H lam, Conjugate (member (assemble r P H) lam) (r lam))
    (r : Λ → (G →* GLn n K)) (P : V → K[X]) (H : T → Multiset ℤ) (frob : V → G)
    (hp : ∀ lam v, ((r lam (frob v)).val).charpoly = P v) :
    ∀ lam v, ((member (compatibleSystem assemble r P H) lam (frob v)).val).charpoly = P v :=
  sorry

lemma compatibleSystem_embedding [CharZero K] (r s : G →* GLn n K)
    (hr : Semisimple r) (hs : Semisimple s)
    (h : ∀ g, (r g).val.charpoly = (s g).val.charpoly) :
    Conjugate (coeffChange (algebraMap K (AlgebraicClosure K)) r)
      (coeffChange (algebraMap K (AlgebraicClosure K)) s) := sorry

/-- Test TauCeti.AutomorphicGalois.compatibleSystem_rank_one: the assembly
preserves a supplied algebraic-character member; class-field construction omitted. -/
example (assemble : (Λ → (G →* GLn 1 K)) → (V → K[X]) → (T → Multiset ℤ) → System)
    (member : System → Λ → (G →* GLn 1 K))
    (hm : ∀ r P H, member (assemble r P H) = r)
    (ψ : Λ → (G →* GLn 1 K)) (P : V → K[X]) (H : T → Multiset ℤ) :
    member (compatibleSystem assemble ψ P H) = ψ := sorry

/-- Test TauCeti.AutomorphicGalois.compatibleSystem_weight_k. -/
example (k : ℤ) : expectedHodgeTate ![k - 2, 0] = ({k - 1, 0} : Multiset ℤ) ∧
    (expectedHodgeTate ![k - 2, 0]).sum = k - 1 := sorry

/-- Test TauCeti.AutomorphicGalois.compatibleSystem_R19: attachment uniqueness
after the supplier's dual/twist dictionary; that dictionary's construction omitted. -/
example [CharZero K] (ag2 r19Dual : G →* GLn 2 K) (h₁ : Semisimple ag2) (h₂ : Semisimple r19Dual)
    (hp : ∀ g, (ag2 g).val.charpoly = (r19Dual g).val.charpoly) :
    Conjugate (coeffChange (algebraMap K (AlgebraicClosure K)) ag2)
      (coeffChange (algebraMap K (AlgebraicClosure K)) r19Dual) := sorry

/-- Test TauCeti.AutomorphicGalois.compatibleSystem_no_automatic_strictness:
N=0 and N≠0 have the same semisimplified Weil action. -/
example : (0 : Matrix (Fin 2) (Fin 2) ℚ) ≠ !![0, 1; 0, 0] ∧
    (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ) ^ 2 = 0 := sorry
end Assembly

section StrongField
variable {Λ G : Type*} [Group G] {n : ℕ}
variable {E K : Λ → Type*} [∀ lam, Field (E lam)] [∀ lam, Field (K lam)]

/-- The simultaneous based descent component. Λ is the actual coefficient-place
index supplied externally; number-field finiteness/completions and continuity
are omitted, rather than encoded as free proposition fields. -/
def IsStrongCoefficientField (ι : ∀ lam, E lam →+* K lam) (r : ∀ lam, G →* GLn n (K lam)) : Prop :=
  ∀ lam, ∃ s : G →* GLn n (E lam), Conjugate (coeffChange (ι lam) s) (r lam)

noncomputable def strongCoefficientField_member
    (ι : ∀ lam, E lam →+* K lam) (r : ∀ lam, G →* GLn n (K lam))
    (h : IsStrongCoefficientField ι r) (lam : Λ) :
    {s : G →* GLn n (E lam) // Conjugate (coeffChange (ι lam) s) (r lam)} :=
  ⟨Classical.choose (h lam), Classical.choose_spec (h lam)⟩

lemma strongCoefficientField_baseChange
    {E' : Λ → Type*} [∀ lam, Field (E' lam)]
    (ι : ∀ lam, E lam →+* K lam) (ι' : ∀ lam, E' lam →+* K lam)
    (f : ∀ lam, E lam →+* E' lam) (hf : ∀ lam, (ι' lam).comp (f lam) = ι lam)
    (r : ∀ lam, G →* GLn n (K lam)) (h : IsStrongCoefficientField ι r) :
    IsStrongCoefficientField ι' r := sorry

lemma strongCoefficientField_unique
    (ι : ∀ lam, E lam →+* K lam) (r : ∀ lam, G →* GLn n (K lam))
    (h : IsStrongCoefficientField ι r) (lam : Λ) (s t : G →* GLn n (E lam))
    (hs : Conjugate (coeffChange (ι lam) s) (r lam))
    (ht : Conjugate (coeffChange (ι lam) t) (r lam)) :
    Conjugate s t := sorry

/-- Test TauCeti.AutomorphicGalois.strongCoefficientField_character. -/
example (ι : ∀ lam, E lam →+* K lam) (ψ : ∀ lam, G →* GLn 1 (E lam)) :
    IsStrongCoefficientField ι (fun lam => coeffChange (ι lam) (ψ lam)) := sorry

/-- Test TauCeti.AutomorphicGalois.strongCoefficientField_extension:
the scalar-extension tower is tested on actual group homomorphisms. -/
example {L M N : Type*} [Field L] [Field M] [Field N]
    (f : L →+* M) (g : M →+* N) (r : G →* GLn n L) :
    coeffChange g (coeffChange f r) = coeffChange (g.comp f) r := sorry

/-- Test TauCeti.AutomorphicGalois.strongCoefficientField_not_rationality:
the quaternionic two-dimensional character has rational traces but no Q model.
The actual group representation is supplied, with its two quaternion generators;
no invented automorphic carrier or assertion about a particular pi is used. -/
example (r : G →* GLn 2 ℂ) (x y : G)
    (hx : (r x).val = !![Complex.I, 0; 0, -Complex.I])
    (hy : (r y).val = !![0, 1; -1, 0])
    (ht : ∀ g, ∃ t : ℚ, Matrix.trace (r g).val = (t : ℂ)) :
    ¬ ∃ s : G →* GLn 2 ℚ, Conjugate (coeffChange (Rat.castHom ℂ) s) r := sorry

/-- Test TauCeti.AutomorphicGalois.strongCoefficientField_scalar_intertwiner. -/
example {L : Type*} [Field L] (r s : G →* GLn n L)
    (b : GLn n L) (hb : ∀ g, s g * b = b * r g) (c : Lˣ) :
    ∀ g, s g * (Matrix.GeneralLinearGroup.scalar (Fin n) c * b) =
      (Matrix.GeneralLinearGroup.scalar (Fin n) c * b) * r g := sorry
end StrongField

section Residual
variable {G O k : Type*} [Group G] [CommRing O] [Field k] {n : ℕ}

/-- Semisimplify the reduction in a basis of the supplied stable lattice.
Finiteness of the residue field, continuity and construction of that lattice
are omitted; the integral model is an actual homomorphism into GL_n(O). -/
noncomputable def residualRep (rO : G →* GLn n O) (red : O →+* k) : G →* GLn n k := sorry

lemma residualRep_semisimple (rO : G →* GLn n O) (red : O →+* k) :
    Semisimple (residualRep rO red) := sorry

lemma residualRep_goodPolynomial (rO : G →* GLn n O) (red : O →+* k) (g : G) :
    (residualRep rO red g).val.charpoly = ((rO g).val.charpoly).map red := sorry

/-- The common integral characteristic polynomials are the algebraic input of
lattice independence. The actual lattice/spanning comparison is supplied by R01.1. -/
lemma residualRep_indep_lattice [Finite k] (r₁ r₂ : G →* GLn n O) (red : O →+* k)
    (h : ∀ g, (r₁ g).val.charpoly = (r₂ g).val.charpoly) :
    Conjugate (coeffChange (algebraMap k (AlgebraicClosure k)) (residualRep r₁ red))
      (coeffChange (algebraMap k (AlgebraicClosure k)) (residualRep r₂ red)) := sorry

lemma residualRep_coeffExtension {k' : Type*} [Field k'] [Fintype k]
    (rO : G →* GLn n O) (red : O →+* k) (f : k →+* k') :
    Conjugate (coeffChange (algebraMap k' (AlgebraicClosure k'))
      (coeffChange f (residualRep rO red)))
      (coeffChange (algebraMap k' (AlgebraicClosure k')) (residualRep rO (f.comp red))) := sorry

/-- Polarization-equation fragment: G_n, total oddness, CM conjugation and the
extension across G_F⊂G_F+ are unavailable. This proves only coefficient transport
of the actual matrix pairing, not construction of the missing group.
The full reduction/semisimplification and G_n-extension interface is requested
from ArithmeticGaloisRepresentations G7. The polarized deformation problem
assumes that extension as input and cannot supply it. -/
lemma residualRep_extendGn {k' : Type*} [Field k']
    (f : k →+* k') (A Ac J : Matrix (Fin n) (Fin n) k) (μ : k)
    (h : Ac.transpose * J * A = μ • J) :
    (Ac.map f).transpose * J.map f * A.map f = f μ • J.map f := sorry

/-- Test TauCeti.AutomorphicGalois.residualRep_rank_one. -/
example (rO : G →* GLn 1 O) (red : O →+* k) :
    Conjugate (residualRep rO red) (coeffChange red rO) := sorry

/-- Test TauCeti.AutomorphicGalois.residualRep_R19_dual:
the already-normalized integral dual member is supplied, not rebuilt. -/
example [Finite k] (ag2 r19Dual : G →* GLn 2 O) (red : O →+* k)
    (h : ∀ g, (ag2 g).val.charpoly = (r19Dual g).val.charpoly) :
    Conjugate (coeffChange (algebraMap k (AlgebraicClosure k)) (residualRep ag2 red))
      (coeffChange (algebraMap k (AlgebraicClosure k)) (residualRep r19Dual red)) := sorry

/-- Test TauCeti.AutomorphicGalois.residualRep_noncanonical_lattice:
the two reductions of the stated Z_5 lattices at t=1 are unequal, with the
same polynomial as their semisimple identity. The p-adic lattice is omitted. -/
example : (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod 5)) ≠ 1 ∧
    (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod 5)).charpoly =
      (1 : Matrix (Fin 2) (Fin 2) (ZMod 5)).charpoly := sorry
end Residual

section Hecke
variable {G V k : Type*} [Group G] [Field k] {n : ℕ}

/-- Algebraic part of ACC+ Definition 2.3.6. P is the residue eigencharacter's
actual normalized Hecke polynomial; its integral algebra/maximal ideal and
continuity of G_F are omitted. Semisimplicity is Mathlib's predicate. -/
def IsGaloisType (frob : V → G) (P : V → k[X]) : Prop :=
  ∃ r : G →* GLn n k, Semisimple r ∧ ∀ v, (r (frob v)).val.charpoly = P v

noncomputable def galoisType_rep (frob : V → G) (P : V → k[X])
    (h : IsGaloisType (n := n) frob P) :
    {r : G →* GLn n k // Semisimple r ∧ ∀ v, (r (frob v)).val.charpoly = P v} :=
  ⟨Classical.choose h, Classical.choose_spec h⟩

/-- Chebotarev supplies the upgrade from good Frobenius equality to every g.
The fragment states that latter algebraic recognition input explicitly. -/
lemma galoisType_rep_unique [Finite k] (frob : V → G) (P : V → k[X])
    (r s : G →* GLn n k) (hr : Semisimple r) (hs : Semisimple s)
    (hp : ∀ g, (r g).val.charpoly = (s g).val.charpoly) :
    Conjugate (coeffChange (algebraMap k (AlgebraicClosure k)) r)
      (coeffChange (algebraMap k (AlgebraicClosure k)) s) := sorry

lemma galoisType_coeffExtension {k' : Type*} [Field k'] [Fintype k]
    (f : k →+* k') (frob : V → G) (P : V → k[X])
    (h : IsGaloisType (n := n) frob P) :
    IsGaloisType (n := n) frob (fun v => (P v).map f) := sorry

/-- The chosen Galois-type witness must remain irreducible over k-bar. -/
def IsNonEisenstein (frob : V → G) (P : V → k[X]) : Prop :=
  ∃ r : G →* GLn n k, Semisimple r ∧ AbsolutelyIrreducible r ∧
    ∀ v, (r (frob v)).val.charpoly = P v

lemma nonEisenstein_galoisType (frob : V → G) (P : V → k[X])
    (h : IsNonEisenstein (n := n) frob P) : IsGaloisType (n := n) frob P := sorry

lemma nonEisenstein_coeffExtension {k' : Type*} [Field k'] [Fintype k]
    (f : k →+* k') (frob : V → G) (P : V → k[X])
    (h : IsNonEisenstein (n := n) frob P) :
    IsNonEisenstein (n := n) frob (fun v => (P v).map f) := sorry

/-- Test TauCeti.AutomorphicGalois.galoisType_reducible. -/
example (frob : V → G) : IsGaloisType (n := 2) frob
    (fun _ => (X - 1) ^ 2 : V → k[X]) := sorry

/-- Test TauCeti.AutomorphicGalois.galoisType_not_nonEisenstein:
all group elements occur, so no different irreducible witness is possible. -/
example : ¬ IsNonEisenstein (n := 2) (id : G → G)
    (fun _ => (X - 1) ^ 2 : G → k[X]) := sorry

/-- Test TauCeti.AutomorphicGalois.nonEisenstein_rank_one. -/
example (frob : V → G) (P : V → k[X]) (h : IsGaloisType (n := 1) frob P) :
    IsNonEisenstein (n := 1) frob P := sorry

/-- Test TauCeti.AutomorphicGalois.nonEisenstein_not_trivial_rank_two. -/
example : ¬ AbsolutelyIrreducible (1 : G →* GLn 2 k) := sorry

/-- Test TauCeti.AutomorphicGalois.nonEisenstein_absolute_not_relative:
rotation of order four over R is irreducible over R, and splits over C-bar. -/
example (r : Multiplicative (ZMod 4) →* GLn 2 ℝ)
    (hr : (r (Multiplicative.ofAdd 1)).val = !![0, -1; 1, 0]) :
    Representation.IsIrreducible (matrixRepresentation r) ∧ ¬ AbsolutelyIrreducible r := sorry

lemma residualHeckeIdealIndependence {T k' : Type*} [CommRing T] [Field k']
    (θ : T →+* k) (f : k →+* k') : RingHom.ker (f.comp θ) = RingHom.ker θ := sorry

/-- The Hecke-algebra involution and cyclotomic realization are omitted; this
checks its reciprocal geometric eigenvalue formula and ordered ratio invariant. -/
theorem dualAndTwistHeckeComparison (α : Fin n → kˣ) (q : kˣ) :
    IsGenericEigenvalues (fun i => q ^ (n - 1) * (α i)⁻¹) (q : k) ↔
      IsGenericEigenvalues α (q : k) := sorry
end Hecke

/-! Complete-splitting fragments use the externally supplied entire place fiber
V p, inertia, Frobenius, ramification index and residue degree. No number-field
place carrier is declared. Their identification with genuine places is omitted.
Nonempty fibers prevent a vacuous all-place condition. -/
section Decomposed
variable {G k : Type*} [Group G] [Field k] {n ℓ : ℕ} [CharP k ℓ]
variable (V : ℕ → Type*) [∀ p, Nonempty (V p)]
variable (e f : ∀ p, V p → ℕ) (I : ∀ p, V p → Subgroup G) (frob : ∀ p, V p → G)

def IsDecomposedGenericPrime (r : G →* GLn n k) (p : ℕ) : Prop :=
  Nat.Prime p ∧ p ≠ ℓ ∧ ∀ v : V p,
    e p v = 1 ∧ f p v = 1 ∧ IsGeneric (I p v) r (frob p v) (p : k)

lemma decomposedGenericPrime_local (r : G →* GLn n k) (p : ℕ)
    (h : IsDecomposedGenericPrime (ℓ := ℓ) V e f I frob r p) (v : V p) :
    IsGeneric (I p v) r (frob p v) (p : k) := sorry

lemma decomposedGenericPrime_coeffExtension {k' : Type*} [Field k'] [CharP k' ℓ]
    (j : k →+* k') (r : G →* GLn n k) (p : ℕ) :
    IsDecomposedGenericPrime (ℓ := ℓ) V e f I frob (coeffChange j r) p ↔
      IsDecomposedGenericPrime (ℓ := ℓ) V e f I frob r p := sorry

def IsDecomposedGeneric (r : G →* GLn n k) : Prop :=
  ∃ p, IsDecomposedGenericPrime (ℓ := ℓ) V e f I frob r p

lemma decomposedGeneric_witness (r : G →* GLn n k)
    (h : IsDecomposedGeneric (ℓ := ℓ) V e f I frob r) :
    ∃ p, Nat.Prime p ∧ p ≠ ℓ ∧ ∀ v : V p,
      e p v = 1 ∧ f p v = 1 ∧ IsGeneric (I p v) r (frob p v) (p : k) := sorry

lemma decomposedGeneric_coeffExtension {k' : Type*} [Field k'] [CharP k' ℓ]
    (j : k →+* k') (r : G →* GLn n k) :
    IsDecomposedGeneric (ℓ := ℓ) V e f I frob (coeffChange j r) ↔
      IsDecomposedGeneric (ℓ := ℓ) V e f I frob r := sorry

/-- Test TauCeti.AutomorphicGalois.decomposedGenericPrime_Q. -/
example (r : G →* GLn n k) (p : ℕ) (hp : Nat.Prime p) (hℓ : p ≠ ℓ)
    (J : Subgroup G) (g : G) (hg : IsGeneric J r g (p : k)) :
    IsDecomposedGenericPrime (ℓ := ℓ) (fun _ => PUnit) (fun _ _ => 1)
      (fun _ _ => 1) (fun _ _ => J) (fun _ _ => g) r p := sorry

/-- Test TauCeti.AutomorphicGalois.decomposedGenericPrime_not_inert. -/
example (r : G →* GLn n k) (p : ℕ) :
    ¬ IsDecomposedGenericPrime (ℓ := ℓ) (fun _ => PUnit) (fun _ _ => 1)
      (fun _ _ => 2) (fun _ _ => (⊥ : Subgroup G)) (fun _ _ => 1) r p := sorry

/-- Test TauCeti.AutomorphicGalois.decomposedGenericPrime_not_ell. -/
example (r : G →* GLn n k) :
    ¬ IsDecomposedGenericPrime (ℓ := ℓ) V e f I frob r ℓ := sorry

/-- Chebotarev's positive-density witness set is supplied by the owner.
This fragment transports it and gives avoidance of any finite exceptional set;
it does not prove Chebotarev for arbitrary fiber parameters. -/
theorem infinitelyManyDecomposedGenericPrimes (r : G →* GLn n k)
    (C : Set ℕ) (hC : C.Infinite)
    (h : ∀ p ∈ C, IsDecomposedGenericPrime (ℓ := ℓ) V e f I frob r p) :
    {p | IsDecomposedGenericPrime (ℓ := ℓ) V e f I frob r p}.Infinite ∧
    ∀ S : Finset ℕ, ∃ p, p ∉ S ∧
      IsDecomposedGenericPrime (ℓ := ℓ) V e f I frob r p := sorry
end Decomposed

/-- Test TauCeti.AutomorphicGalois.decomposedGeneric_trivial_F3. -/
example : IsDecomposedGeneric (ℓ := 3) (fun _ => PUnit) (fun _ _ => 1)
    (fun _ _ => 1) (fun _ _ => (⊥ : Subgroup PUnit)) (fun _ _ => 1)
    (1 : PUnit →* GLn 2 (ZMod 3)) := sorry

/-- Test TauCeti.AutomorphicGalois.decomposedGeneric_not_irreducible. -/
example : IsDecomposedGeneric (ℓ := 3) (fun _ => PUnit) (fun _ _ => 1)
    (fun _ _ => 1) (fun _ _ => (⊥ : Subgroup PUnit)) (fun _ _ => 1)
    (1 : PUnit →* GLn 2 (ZMod 3)) ∧
    ¬ AbsolutelyIrreducible (1 : PUnit →* GLn 2 (ZMod 3)) := sorry

/-- Test TauCeti.AutomorphicGalois.decomposedGeneric_not_every_prime. -/
example : ¬ IsDecomposedGenericPrime (ℓ := 3) (fun _ => PUnit) (fun _ _ => 1)
    (fun _ _ => 1) (fun _ _ => (⊥ : Subgroup PUnit)) (fun _ _ => 1)
    (1 : PUnit →* GLn 2 (ZMod 3)) 7 := sorry

/-- Test TauCeti.AutomorphicGalois.isGeneric_matrix_diagonal. -/
example {K : Type*} [Field K] {n : ℕ} (α : Fin n → Kˣ) :
    (Matrix.diagonal (fun i => (α i : K))).charpoly = ∏ i, (X - C (α i : K)) := sorry

/-- Dependence on the actual residue cardinality p^f, not just p.
The local-field identification is omitted. -/
lemma strongGeneric_arbitrary_local_field {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* GLn n k) (frob : G) (p f : ℕ) :
    IsStrongGeneric I r frob (p ^ f : k) ↔
      (∀ g ∈ I, r g = 1) ∧ ∃ α : Fin n → (AlgebraicClosure k)ˣ,
      ((r frob).val.map (algebraMap k (AlgebraicClosure k))).charpoly =
        ∏ i, (X - C (α i : AlgebraicClosure k)) ∧
      IsGenericEigenvalues α (algebraMap k (AlgebraicClosure k) (p ^ f : k)) ∧
      Function.Injective α := sorry

/-- Only an unramified scalar twist is a local invariance operation. -/
theorem genericityTransfer {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r s : G →* GLn n k) (χ : G →* kˣ)
    (hs : ∀ g, s g = Matrix.GeneralLinearGroup.scalar (Fin n) (χ g) * r g)
    (hχ : ∀ g ∈ I, χ g = 1) (frob : G) (q : k) :
    IsGeneric I s frob q ↔ IsGeneric I r frob q := sorry

/-- The algebraic exclusion step; finiteness of bad coefficient places and the
subsequent local split-place Chebotarev theorem need the number-field supplier.
This is not the stronger all-place rational-prime conclusion. -/
theorem residualGenericityOutsideFiniteSet {O k : Type*} [CommRing O] [Field k]
    {n : ℕ} (red : O →+* k) (α : Fin n → Oˣ) (q : O)
    (h : ∀ i j, i ≠ j → red ((α i : O) - (α j : O)) ≠ 0 ∧
      red ((α i : O) - q * (α j : O)) ≠ 0) :
    IsStrongGenericEigenvalues (fun i => Units.map red.toMonoidHom (α i)) (red q) := sorry

/-! Export fragments. System is universally quantified external R24.5 data.
Members, Hodge multisets, Weil actions, monodromy and block lists below are
projections of that supplier's realizations. Their geometric provenance, the
period functors and complete WD/purity predicates are omitted. Proof fields
are concrete equalities/inequalities about the data; no field has type Prop. -/
section Exports
variable {System Λ V T Ω G K : Type*} [Group G] [Field K] {n : ℕ}

structure GoodPrimeExport (member : System → Λ → (G →* GLn n K))
    (frob : V → G) (P : V → K[X]) (s : System) : Type _ where
  goodPolynomial : ∀ lam v, (member s lam (frob v)).val.charpoly = P v

lemma goodPrimeExport_member (member : System → Λ → (G →* GLn n K))
    (frob : V → G) (P : V → K[X]) (s : System)
    (x : GoodPrimeExport member frob P s) (lam : Λ) (v : V) :
    (member s lam (frob v)).val.charpoly = P v := x.goodPolynomial lam v

noncomputable def goodPrimeExport_coeffChange {System' L : Type*} [Field L]
    (member : System → Λ → (G →* GLn n K))
    (member' : System' → Λ → (G →* GLn n L)) (change : System → System')
    (j : K →+* L) (hm : ∀ s lam, member' (change s) lam = coeffChange j (member s lam))
    (frob : V → G) (P : V → K[X]) (s : System)
    (x : GoodPrimeExport member frob P s) :
    GoodPrimeExport member' frob (fun v => (P v).map j) (change s) := sorry

structure NonselfdualComparisonExport
    (member : System → Λ → (G →* GLn n K)) (frob : V → G) (P : V → K[X]) (s : System)
    (HT : Λ → T → Multiset ℤ) (H : T → Multiset ℤ)
    (wdWeil recWeil : Λ → V → (G →* GLn n K))
    (wdBlocks recBlocks : Λ → V → Ω → List ℕ) where
  good : GoodPrimeExport member frob P s
  hodge : ∀ lam τ, HT lam τ = H τ
  semisimplified : ∀ lam v, Conjugate (wdWeil lam v) (recWeil lam v)
  monodromyBound : ∀ lam v ω t,
    ((wdBlocks lam v ω).take t).sum ≤ ((recBlocks lam v ω).take t).sum

abbrev nonselfdualExport_goodPrime
    {member : System → Λ → (G →* GLn n K)} {frob : V → G} {P : V → K[X]} {s : System}
    {HT : Λ → T → Multiset ℤ} {H : T → Multiset ℤ}
    {wd rec : Λ → V → (G →* GLn n K)} {b c : Λ → V → Ω → List ℕ}
    (x : NonselfdualComparisonExport member frob P s HT H wd rec b c) := x.good

lemma nonselfdualExport_hodge
    {member : System → Λ → (G →* GLn n K)} {frob : V → G} {P : V → K[X]} {s : System}
    {HT : Λ → T → Multiset ℤ} {H : T → Multiset ℤ}
    {wd rec : Λ → V → (G →* GLn n K)} {b c : Λ → V → Ω → List ℕ}
    (x : NonselfdualComparisonExport member frob P s HT H wd rec b c) (lam : Λ) (τ : T) :
    HT lam τ = H τ := x.hodge lam τ

lemma nonselfdualExport_wdBound
    {member : System → Λ → (G →* GLn n K)} {frob : V → G} {P : V → K[X]} {s : System}
    {HT : Λ → T → Multiset ℤ} {H : T → Multiset ℤ}
    {wd rec : Λ → V → (G →* GLn n K)} {b c : Λ → V → Ω → List ℕ}
    (x : NonselfdualComparisonExport member frob P s HT H wd rec b c) (lam : Λ) (v : V) :
    Conjugate (wd lam v) (rec lam v) ∧
      ∀ ω t, ((b lam v ω).take t).sum ≤ ((c lam v ω).take t).sum := sorry

/-- A full local map must intertwine both the Weil action and N with the SAME
invertible matrix. The good-prime purity equation is included; monodromy-graded
strict purity and total oddness are omitted pending the suppliers. -/
structure PolarizedComparisonExport
    (member : System → Λ → (G →* GLn n K)) (frob : V → G) (P : V → K[X]) (s : System)
    (HT : Λ → T → Multiset ℤ) (H : T → Multiset ℤ)
    (wdWeil recWeil : Λ → V → (G →* GLn n K))
    (wdN recN : Λ → V → Matrix (Fin n) (Fin n) K)
    (c : G ≃* G) (μ : Λ → (G →* Kˣ)) (j : K →+* ℂ) (q : V → ℕ) (W : ℤ) where
  good : GoodPrimeExport member frob P s
  hodge : ∀ lam τ, HT lam τ = H τ
  pairing : Λ → GLn n K
  polarized : ∀ lam g, (member s lam (c g)).val.transpose * (pairing lam).val *
    (member s lam g).val = (μ lam g : K) • (pairing lam).val
  localComparison : ∀ lam v, {u : GLn n K //
    (∀ g, recWeil lam v g * u = u * wdWeil lam v g) ∧
    recN lam v * u.val = u.val * wdN lam v}
  goodPure : ∀ (v : V) (α : ℂ), ((P v).map j).IsRoot α → ‖α‖ ^ 2 = (q v : ℝ) ^ W

abbrev polarizedExport_goodPrime
    {member : System → Λ → (G →* GLn n K)} {frob : V → G} {P : V → K[X]} {s : System}
    {HT : Λ → T → Multiset ℤ} {H : T → Multiset ℤ}
    {wd rec : Λ → V → (G →* GLn n K)} {N M : Λ → V → Matrix (Fin n) (Fin n) K}
    {c : G ≃* G} {μ : Λ → (G →* Kˣ)} {j : K →+* ℂ} {q : V → ℕ} {W : ℤ}
    (x : PolarizedComparisonExport member frob P s HT H wd rec N M c μ j q W) := x.good

lemma polarizedExport_local
    {member : System → Λ → (G →* GLn n K)} {frob : V → G} {P : V → K[X]} {s : System}
    {HT : Λ → T → Multiset ℤ} {H : T → Multiset ℤ}
    {wd rec : Λ → V → (G →* GLn n K)} {N M : Λ → V → Matrix (Fin n) (Fin n) K}
    {c : G ≃* G} {μ : Λ → (G →* Kˣ)} {j : K →+* ℂ} {q : V → ℕ} {W : ℤ}
    (x : PolarizedComparisonExport member frob P s HT H wd rec N M c μ j q W)
    (lam : Λ) (v : V) :
    (∀ τ, HT lam τ = H τ) ∧ ∃ u : GLn n K,
      (∀ g, rec lam v g * u = u * wd lam v g) ∧ M lam v * u.val = u.val * N lam v := sorry

/-- Concrete pairing/purity projection of the future R24.5 predicate export;
the unavailable full supplier predicates are not replaced by arbitrary Prop. -/
lemma polarizedExport_supplier
    {member : System → Λ → (G →* GLn n K)} {frob : V → G} {P : V → K[X]} {s : System}
    {HT : Λ → T → Multiset ℤ} {H : T → Multiset ℤ}
    {wd rec : Λ → V → (G →* GLn n K)} {N M : Λ → V → Matrix (Fin n) (Fin n) K}
    {c : G ≃* G} {μ : Λ → (G →* Kˣ)} {j : K →+* ℂ} {q : V → ℕ} {W : ℤ}
    (x : PolarizedComparisonExport member frob P s HT H wd rec N M c μ j q W) :
    (∀ lam g, (member s lam (c g)).val.transpose * (x.pairing lam).val *
      (member s lam g).val = (μ lam g : K) • (x.pairing lam).val) ∧
    ∀ v α, ((P v).map j).IsRoot α → ‖α‖ ^ 2 = (q v : ℝ) ^ W := sorry

/-- Test TauCeti.AutomorphicGalois.goodPrimeExport_character:
a nonzero export inhabitant with rank-one trivial algebraic character. -/
example (frob : V → G) (s : System) :
    Nonempty (GoodPrimeExport (fun _ (_ : Λ) => (1 : G →* GLn 1 K))
      frob (fun _ => X - 1) s) := sorry

/-- Test TauCeti.AutomorphicGalois.goodPrimeExport_polynomial:
actual exported polynomial; the modular-form normalization dictionary is omitted. -/
example (member : System → Λ → (G →* GLn 2 K)) (frob : V → G) (s : System)
    (a d : V → K) (x : GoodPrimeExport member frob
      (fun v => X ^ 2 - C (a v) * X + C (d v)) s) (lam : Λ) (v : V) :
    (member s lam (frob v)).val.charpoly = X ^ 2 - C (a v) * X + C (d v) := sorry

/-- Test TauCeti.AutomorphicGalois.goodPrimeExport_not_fullWD:
two genuine WD matrix pairs: F=diag(1,2), N=0 and N=E12;
F N F^-1=(1/2)N holds in both, but no full intertwiner exists. -/
example (F : GLn 2 ℚ) (hF : F.val = !![1, 0; 0, 2]) :
    F.val * (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ) =
      (1 / 2 : ℚ) • (!![0, 1; 0, 0] * F.val) ∧
    ¬ ∃ u : GLn 2 ℚ, (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ) * u.val = u.val * 0 := sorry

/-- Test TauCeti.AutomorphicGalois.nonselfdualExport_rank_one:
inhabit the actual wrapper for a trivial rank-one member, its supplied Hodge
weight and its size-one Weil block. Class-field and period realizations omitted. -/
example (frob : V → G) (s : System) (h : T → ℤ) :
    Nonempty (NonselfdualComparisonExport
      (fun _ (_ : Λ) => (1 : G →* GLn 1 K)) frob (fun _ => X - 1) s
      (fun _ τ => {h τ}) (fun τ => {h τ}) (fun _ _ => 1) (fun _ _ => 1)
      (fun _ _ (_ : PUnit) => [1]) (fun _ _ (_ : PUnit) => [1])) := sorry

/-- The rank-one monodromy component of the preceding test. -/
example (N : Matrix (Fin 1) (Fin 1) K) (h : IsNilpotent N) : N = 0 := sorry

/-- Test TauCeti.AutomorphicGalois.nonselfdualExport_good_crystalline:
zero upper monodromy forces zero below; the period criterion is omitted. -/
example (N : Matrix (Fin n) (Fin n) K)
    (h : N.rank ≤ (0 : Matrix (Fin n) (Fin n) K).rank) : N = 0 := sorry

/-- Test TauCeti.AutomorphicGalois.nonselfdualExport_not_polarized_fullWD:
strict block dominance [1,1]≺[2] does not identify monodromy. -/
example : (∀ t, (([1, 1] : List ℕ).take t).sum ≤ (([2] : List ℕ).take t).sum) ∧
    ([1, 1] : List ℕ) ≠ [2] := sorry

/-- Test TauCeti.AutomorphicGalois.polarizedExport_weight_k:
the actual rank-two wrapper exposes the full Hodge multiset and its sum. -/
example {member : System → Λ → (G →* GLn 2 K)} {frob : V → G} {P : V → K[X]} {s : System}
    {HT : Λ → T → Multiset ℤ} {wd rec : Λ → V → (G →* GLn 2 K)}
    {N M : Λ → V → Matrix (Fin 2) (Fin 2) K}
    {c : G ≃* G} {μ : Λ → (G →* Kˣ)} {j : K →+* ℂ} {q : V → ℕ} {W : ℤ}
    (k : ℤ) (x : PolarizedComparisonExport member frob P s HT
      (fun _ => expectedHodgeTate ![k - 2, 0]) wd rec N M c μ j q W)
    (lam : Λ) (τ : T) :
    HT lam τ = ({k - 1, 0} : Multiset ℤ) ∧ (HT lam τ).sum = k - 1 := sorry

/-- Test TauCeti.AutomorphicGalois.polarizedExport_forget:
exercise the actual wrapper and keep the same carrier reference. -/
example {member : System → Λ → (G →* GLn n K)} {frob : V → G} {P : V → K[X]} {s : System}
    {HT : Λ → T → Multiset ℤ} {H : T → Multiset ℤ}
    {wd rec : Λ → V → (G →* GLn n K)} {N M : Λ → V → Matrix (Fin n) (Fin n) K}
    {c : G ≃* G} {μ : Λ → (G →* Kˣ)} {j : K →+* ℂ} {q : V → ℕ} {W : ℤ}
    (x : PolarizedComparisonExport member frob P s HT H wd rec N M c μ j q W)
    (lam : Λ) (v : V) :
    (member s lam (frob v)).val.charpoly = P v := sorry

/-- Test TauCeti.AutomorphicGalois.polarizedExport_nonselfdual_rejected:
no invertible map can turn the zero operator into nonzero monodromy. -/
example : ¬ ∃ u : GLn 2 ℚ,
    (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ) * u.val = u.val * 0 := sorry
end Exports

section Unitary
variable {G K : Type*} [Group G] [Field K] {n₁ n₂ : ℕ}

/-- Direct-sum algebraic fragment. The two actual transferred constituents and
parity characters are supplied. CS occurrence/parameter identification, good
places and the away-ell local correspondence are omitted, never inferred. -/
structure UnitaryDiscreteExport (r₁ : G →* GLn n₁ K) (r₂ : G →* GLn n₂ K)
    (ε₁ ε₂ : G →* Kˣ) where
  rep : G →* Matrix.GeneralLinearGroup (Fin n₁ ⊕ Fin n₂) K
  block : ∀ g, (rep g).val = Matrix.fromBlocks
    ((ε₁ g : K) • (r₁ g).val) 0 0 ((ε₂ g : K) • (r₂ g).val)

lemma unitaryDiscreteExport_constituent (r₁ : G →* GLn n₁ K) (r₂ : G →* GLn n₂ K)
    (ε₁ ε₂ : G →* Kˣ) (x : UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) (g : G)
    (v : Fin n₁ → K) :
    (x.rep g).val.mulVec (Sum.elim v 0) =
      Sum.elim (((ε₁ g : K) • (r₁ g).val).mulVec v) 0 := sorry

lemma unitaryDiscreteExport_goodPolynomial (r₁ : G →* GLn n₁ K) (r₂ : G →* GLn n₂ K)
    (ε₁ ε₂ : G →* Kˣ) (x : UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) (g : G) :
    (x.rep g).val.charpoly = (((ε₁ g : K) • (r₁ g).val).charpoly) *
      (((ε₂ g : K) • (r₂ g).val).charpoly) := sorry

/-- Test TauCeti.AutomorphicGalois.unitaryDiscreteExport_two_characters. -/
example (r₁ r₂ : G →* GLn 1 K) (ε₁ ε₂ : G →* Kˣ)
    (x : UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) (g : G) :
    (x.rep g).val.charpoly = (X - C ((ε₁ g : K) * (r₁ g).val 0 0)) *
      (X - C ((ε₂ g : K) * (r₂ g).val 0 0)) := sorry

/-- Test TauCeti.AutomorphicGalois.unitaryDiscreteExport_rank_additivity. -/
example : Module.finrank K ((Fin n₁ ⊕ Fin n₂) → K) = n₁ + n₂ := sorry

/-- Test TauCeti.AutomorphicGalois.unitaryDiscreteExport_not_cuspidal_irreducibility:
an explicit invariant proper first summand is retained. -/
example (r₁ r₂ : G →* GLn 1 K) (ε₁ ε₂ : G →* Kˣ)
    (x : UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) (g : G) (a : K) :
    ((x.rep g).val.mulVec (Sum.elim (fun _ => a) (fun _ => 0))) (Sum.inr 0) = 0 ∧
    ¬ Representation.IsIrreducible
      (((Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp x.rep)) :
        Representation K G ((Fin 1 ⊕ Fin 1) → K)) := sorry
end Unitary

section ResidualExport
variable {G O k T V : Type*} [Group G] [CommRing O] [Field k] [CommRing T] {n : ℕ}

/-- The chosen integral model records the stable-lattice basis supplied by R01.1.
The local field/lattice carrier and topological comparison are omitted.
Both the raw reduction and the semisimple member remain visible. -/
structure ResidualPolynomialExport (rO : G →* GLn n O) (red : O →+* k)
    (θ : T →+* O) (frob : V → G) (P : V → k[X]) where
  semisimpleRep : G →* GLn n k
  semisimple : Semisimple semisimpleRep
  reduction : ∀ g, (semisimpleRep g).val.charpoly = ((rO g).val.charpoly).map red
  heckePolynomial : ∀ v, (semisimpleRep (frob v)).val.charpoly = P v

lemma residualExport_compareLattice [Finite k] (r₁ r₂ : G →* GLn n O) (red : O →+* k)
    (θ : T →+* O) (frob : V → G) (P : V → k[X])
    (x : ResidualPolynomialExport r₁ red θ frob P)
    (y : ResidualPolynomialExport r₂ red θ frob P)
    (h : ∀ g, (r₁ g).val.charpoly = (r₂ g).val.charpoly) :
    Conjugate (coeffChange (algebraMap k (AlgebraicClosure k)) x.semisimpleRep)
      (coeffChange (algebraMap k (AlgebraicClosure k)) y.semisimpleRep) := sorry

/-- Kernel is the actual reduced eigencharacter. Maximality needs the omitted
surjectivity/finite-residue-field supplier, not just the polynomial comparison. -/
lemma residualExport_maxIdeal (rO : G →* GLn n O) (red : O →+* k)
    (θ : T →+* O) (frob : V → G) (P : V → k[X])
    (x : ResidualPolynomialExport rO red θ frob P) :
    IsGaloisType (n := n) frob P ∧
    RingHom.ker (red.comp θ) = Ideal.comap θ (RingHom.ker red) := sorry

lemma residualExport_charpoly (rO : G →* GLn n O) (red : O →+* k)
    (θ : T →+* O) (frob : V → G) (P : V → k[X])
    (x : ResidualPolynomialExport rO red θ frob P) (g : G) :
    (coeffChange red rO g).val.charpoly = (x.semisimpleRep g).val.charpoly := sorry

/-- Test TauCeti.AutomorphicGalois.residualExport_rank_one. -/
example (rO : G →* GLn 1 O) (red : O →+* k) (θ : T →+* O)
    (frob : V → G) (P : V → k[X]) (x : ResidualPolynomialExport rO red θ frob P) :
    Conjugate x.semisimpleRep (coeffChange red rO) := sorry

/-- Test TauCeti.AutomorphicGalois.residualExport_diagonal_mod3. -/
example : ((Matrix.diagonal ![(1 : ℤ), 2]).charpoly).map (Int.castRingHom (ZMod 3)) =
    X ^ 2 + C (2 : ZMod 3) := sorry

/-- Test TauCeti.AutomorphicGalois.residualExport_unipotent_lattices:
the raw reductions differ; the comparison uses semisimple identity instead. -/
example : (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod 5)) ≠ 1 ∧
    (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod 5)).charpoly =
      (1 : Matrix (Fin 2) (Fin 2) (ZMod 5)).charpoly := sorry
end ResidualExport

/-! Named comparison signatures. Raw geometry and the automorphic representation
carrier are not available at the pinned baseline. The missing hypotheses are
listed per node in suggestedCoverage and in the reader; they have NOT been
replaced by arbitrary predicates. In particular, signatures whose automorphic
hypotheses are omitted are not valid assertions for arbitrary matrices.
All actual geometric and arithmetic statements remain in the packet. -/

/-- Restriction of a genuine supplied geometric comparison to the images of the
raw projectors. AG2.1a supplies those projectors before period comparison. -/
theorem geometricCoefficientPrimeComparison {K V W : Type*} [Field K]
    [AddCommGroup V] [Module K V] [AddCommGroup W] [Module K W]
    (u : V ≃ₗ[K] W) (e : Module.End K V) (f : Module.End K W)
    (he : e.comp e = e) (hf : f.comp f = f)
    (hu : u.toLinearMap.comp e = f.comp u.toLinearMap) :
    Nonempty (LinearMap.range e ≃ₗ[K] LinearMap.range f) := sorry

/-- Numeric descent part of the family/patching comparison; the bounded-family
and cyclic descent constructors are omitted, not presumed for arbitrary limits. -/
theorem coefficientHodgeComparisonThroughDescent {T T' : Type*}
    (restrict : T' → T) (hs : Function.Surjective restrict)
    (HT H : T → Multiset ℤ) (h : ∀ τ', HT (restrict τ') = H (restrict τ')) :
    HT = H := sorry

/-- Labelled weights component; polarized automorphic/geometric hypotheses and
de Rham/crystalline/semistable predicates are omitted. -/
theorem polarizedCoefficientPrimeAdmissibility {G K T : Type*}
    [Group G] [Field K] {n : ℕ} (r : G →* GLn n K)
    (HT : (G →* GLn n K) → T → Multiset ℤ) (a : T → Fin n → ℤ) :
    ∀ τ, HT r τ = expectedHodgeTate (a τ) := sorry

/-- Pure monodromy-graded eigenvalue output. The two-boundary sequence,
projected closed strata and their diagonal concentration are omitted.
Graded Frobenius matrices are supplied, not a new spectral-sequence carrier. -/
theorem logCrystallineAutomorphicPurity {d : ℕ}
    (gradedFrob : ℤ → Matrix (Fin d) (Fin d) ℂ) (q : ℕ) (W : ℤ) :
    ∀ i α, (gradedFrob i).charpoly.IsRoot α → ‖α‖ ^ 2 = (q : ℝ) ^ (W + i) := sorry

/-- Full map output, including N. Polarized automorphic and geometric/purity
hypotheses and the actual WD construction are omitted. -/
theorem fullPolarizedCoefficientPrimeComparison {G K : Type*} [Group G] [Field K]
    {n : ℕ} (wd rec : G →* GLn n K) (N M : Matrix (Fin n) (Fin n) K) :
    ∃ u : GLn n K, (∀ g, rec g * u = u * wd g) ∧ M * u.val = u.val * N := sorry

/-- AHTW output components. The supplied wd/rec projections are semisimplified
Weil actions. CM regular algebraic cuspidality, actual periods and the bounded
cohomology/pseudodeformation hypotheses are omitted. No N intertwiner appears. -/
theorem allCMCoefficientPrimeComparison {G W K T V : Type*}
    [Group G] [Group W] [Field K] {n : ℕ} (r : G →* GLn n K)
    (HT : (G →* GLn n K) → T → Multiset ℤ) (a : T → Fin n → ℤ)
    (wd : (G →* GLn n K) → V → (W →* GLn n K)) (rec : V → (W →* GLn n K)) :
    (∀ τ, HT r τ = expectedHodgeTate (a τ)) ∧ ∀ v, Conjugate (wd r v) (rec v) := sorry

/-- AHTW's order component, indexed by irreducible Weil type modulo unramified
twist. Actual Frobenius-semisimple WD→block extraction and automorphy are omitted.
Equality of semisimplifications is separate and not part of this order. -/
theorem nonselfdualCoefficientPrimeMonodromyBound {Ω : Type*}
    (wdBlocks recBlocks : Ω → List ℕ) :
    ∀ ω t, ((wdBlocks ω).take t).sum ≤ ((recBlocks ω).take t).sum := sorry

/-- Algebraic zero-N inference in the spherical corollary. The actual WD inertia
and period criteria, and the Iwahori semistability output, are omitted. -/
theorem allCMCrystallineIwahoriAdmissibility {K : Type*} [Field K] {n : ℕ}
    (N : Matrix (Fin n) (Fin n) K)
    (h : N.rank ≤ (0 : Matrix (Fin n) (Fin n) K).rank) : N = 0 := sorry

/-- Local completion is unchanged under a split CM extension. The base-change
construction and totally-real polarized automorphic hypotheses are omitted. -/
theorem totallyRealPolarizedCoefficientPrimeComparison {G K : Type*} [Group G]
    [Field K] {n : ℕ} (r rec : G →* GLn n K)
    (u : G ≃* G) (h : Conjugate (r.comp u.toMonoidHom) (rec.comp u.toMonoidHom)) :
    Conjugate r rec := sorry

/-- Chebotarev's density upgrade is omitted. The all-element algebraic
recognition statement is typed against Mathlib's semisimplicity predicate. -/
theorem coefficientEmbeddingIndependence {G K : Type*} [Group G] [Field K] [CharZero K]
    {n : ℕ} (r s : G →* GLn n K) (hr : Semisimple r) (hs : Semisimple s)
    (h : ∀ g, (r g).val.charpoly = (s g).val.charpoly) :
    Conjugate (coeffChange (algebraMap K (AlgebraicClosure K)) r)
      (coeffChange (algebraMap K (AlgebraicClosure K)) s) := sorry

/-- Entrywise coefficient conjugation and inverse orientation. The automorphic
σπ constructor is omitted. Neither coefficient change acts on G. -/
theorem coefficientConjugation {G K : Type*} [Group G] [Field K] {n : ℕ}
    (σ : K ≃+* K) (r : G →* GLn n K) :
    coeffChange σ.symm.toRingHom (coeffChange σ.toRingHom r) = r := sorry

/-- Algebraic CH descent component over one algebraically closed ambient field.
The simultaneous number-field/completion construction at different ell is omitted.
Two regular good polynomials are retained; each member uses one of them. -/
theorem existsUniformStrongCoefficientField {Λ G E₀ K : Type*}
    [Group G] [Field E₀] [CharZero E₀] [Field K] [Algebra E₀ K] [IsAlgClosed K]
    {n : ℕ} (r : Λ → (G →* GLn n K)) (hs : ∀ lam, Semisimple (r lam))
    (ht : ∀ lam g, ∃ t : E₀, Matrix.trace (r lam g).val = algebraMap E₀ K t)
    (P₁ P₂ : E₀[X]) (h₁ : P₁.Monic ∧ P₁.natDegree = n ∧ P₁.Separable)
    (h₂ : P₂.Monic ∧ P₂.natDegree = n ∧ P₂.Separable)
    (hp : ∀ lam, ∃ g, (r lam g).val.charpoly = P₁.map (algebraMap E₀ K) ∨
      (r lam g).val.charpoly = P₂.map (algebraMap E₀ K)) :
    ∃ E : IntermediateField E₀ K, FiniteDimensional E₀ E ∧
      IsStrongCoefficientField (E := fun _ : Λ => E) (K := fun _ : Λ => K)
        (fun _ : Λ => E.subtype) r := sorry

/-- Good-prime purity component; the polarized automorphic hypotheses and the
full graded-WD strict-purity predicate are omitted. -/
theorem polarizedSystemPurity {V K : Type*} [Field K] (P : V → K[X])
    (j : K →+* ℂ) (q : V → ℕ) (w : ℤ) (n : ℕ) :
    ∀ v α, ((P v).map j).IsRoot α → ‖α‖ ^ 2 = (q v : ℝ) ^ (w + n - 1) := sorry

/-- Restriction to the density-one coefficient subset after the full Hodge
comparison. Density and the unavailable weakening predicates are omitted. -/
theorem veryWeakCompatibilityUnderDGI {Λ T : Type*} (D : Set Λ)
    (HT : Λ → T → Multiset ℤ) (H : T → Multiset ℤ)
    (h : ∀ lam τ, HT lam τ = H τ) : ∀ lam ∈ D, ∀ τ, HT lam τ = H τ := sorry

/-- Identification component of tensor automorphy. Both tensor and automorphic
realizations are supplied; their construction, initial automorphy/irreducibility
and the good-prime Chebotarev upgrade are omitted. -/
theorem tensorAutomorphyIndependentOfIota {G K : Type*} [Group G] [Field K] [CharZero K] {n : ℕ}
    (tensorMember automorphicMember : G →* GLn n K)
    (ht : Semisimple tensorMember) (ha : Semisimple automorphicMember)
    (hp : ∀ g, (tensorMember g).val.charpoly = (automorphicMember g).val.charpoly) :
    Conjugate (coeffChange (algebraMap K (AlgebraicClosure K)) tensorMember)
      (coeffChange (algebraMap K (AlgebraicClosure K)) automorphicMember) := sorry

/-- CG's Hodge and Frobenius polynomial components; the regular good-level
GSp4 eigenform, crystalline periods and p-Hecke eigenform hypotheses are omitted. -/
theorem gsp4CrystallineHodgeComparison {G K : Type*} [Group G] [Field K]
    (r : G →* GLn 4 K) (HT : (G →* GLn 4 K) → Multiset ℤ)
    (φ : Matrix (Fin 4) (Fin 4) K) (Qp : K[X]) (a b : ℤ)
    (hab : b ≤ a) (hb : 3 ≤ b) :
    HT r = ({0, b - 2, a - 1, a + b - 3} : Multiset ℤ) ∧ φ.charpoly = Qp := sorry

/-- Upper-triangular output with the actual four diagonal characters supplied.
Their cyclotomic/unramified realization, regular ordinary GSp4 form and unit
Hecke eigenvalue hypotheses are omitted. -/
theorem ordinaryGsp4CoefficientPrimeShape {G K : Type*} [Group G] [Field K]
    (r : G →* GLn 4 K) (χ : Fin 4 → (G →* Kˣ)) :
    ∃ u : GLn 4 K, ∀ g,
      (∀ i j : Fin 4, j < i → (u⁻¹ * r g * u).val i j = 0) ∧
      ∀ i, (u⁻¹ * r g * u).val i i = (χ i g : K) := sorry

/-- Finite algebraic enlargement part of the Baire proof: finitely many coset
representative entries generate a finite extension. The compact p-adic image,
closed intersections and Baire open subgroup are omitted. F plays Q_ell here. -/
theorem existsFinitePadicRealization {F K : Type*} [Field F] [Field K] [Algebra F K]
    (entries : Finset K) (ha : ∀ x ∈ entries, IsAlgebraic F x) :
    ∃ E : IntermediateField F K, FiniteDimensional F E ∧ ∀ x ∈ entries, x ∈ E := sorry

end TauCeti.AutomorphicGalois
