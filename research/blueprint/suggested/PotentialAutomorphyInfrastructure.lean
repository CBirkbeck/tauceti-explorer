/-
This file is not the roadmap and is not exhaustive. The roadmap document is
 definitive. These statements suggest Lean forms so contributors and reviewers
 converge on names and signatures. No implementation is claimed.

The pinned Mathlib supplies the concrete carriers below. The arithmetic carrier
 gaps in the packet prevent dependent declarations from being stated faithfully;
 those declarations are listed with their names and mathematical obligations in
 the final comment. No missing arithmetic notion is represented by a Prop field.

Chosen uniformizers split each diagonal local torus into its units and integer
 valuations. SplitTorus below prototypes exactly that algebraic presentation.
 Topological and arithmetic adapters belong to the named supplier requests.
-/
import Mathlib.CategoryTheory.Retract
import Mathlib.CategoryTheory.Types.Basic
import Mathlib.Logic.Equiv.Fin.Basic
import Mathlib.GroupTheory.Perm.Basic
import Mathlib.Data.Fin.Rev
import Mathlib.Data.Finset.Card
import Mathlib.Data.Multiset.Sum
import Mathlib.Algebra.Group.Submonoid.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Group.Units.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Notation

open CategoryTheory
open scoped BigOperators

namespace TauCeti.PotentialAutomorphy

universe u v w

/-- The extra datum over Mathlib's retract consists only of explicit equations
for actual indexed endomorphisms. In applications these come from ring actions. -/
structure EquivariantRetract {C : Type u} [Category.{v} C] {I : Type w}
    (A B : C) (fA : I → (A ⟶ A)) (fB : I → (B ⟶ B))
    extends Retract A B where
  inclusion_comm_eq : ∀ r, fA r ≫ i = i ≫ fB r
  retraction_comm_eq : ∀ r, fB r ≫ toRetract.r = toRetract.r ≫ fA r

namespace EquivariantRetract
variable {C : Type u} [Category.{v} C] {I : Type w}
variable {A B : C} {fA : I → (A ⟶ A)} {fB : I → (B ⟶ B)}

lemma inclusion_comm (h : EquivariantRetract A B fA fB) (r : I) :
    fA r ≫ h.i = h.i ≫ fB r := by sorry
lemma retraction_comm (h : EquivariantRetract A B fA fB) (r : I) :
    fB r ≫ h.toRetract.r = h.toRetract.r ≫ fA r := by sorry

def map {D : Type*} [Category D] (h : EquivariantRetract A B fA fB) (F : C ⥤ D) :
    EquivariantRetract (F.obj A) (F.obj B)
      (fun r => F.map (fA r)) (fun r => F.map (fB r)) := by sorry

lemma idempotent (h : EquivariantRetract A B fA fB) :
    (h.toRetract.r ≫ h.i) ≫ (h.toRetract.r ≫ h.i) = h.toRetract.r ≫ h.i ∧
      ∀ r, fB r ≫ (h.toRetract.r ≫ h.i) = (h.toRetract.r ≫ h.i) ≫ fB r := by sorry

def refl (A : C) (f : I → (A ⟶ A)) : EquivariantRetract A A f f := by sorry

-- EquivariantRetract.identity
example (A : C) (f : I → (A ⟶ A)) :
    ∃ h : EquivariantRetract A A f f, h.i = 𝟙 A ∧ h.toRetract.r = 𝟙 A := by sorry
-- EquivariantRetract.forget_identity
example (A : C) (f : I → (A ⟶ A)) :
    (refl A f).toRetract = Retract.refl A := by sorry
-- EquivariantRetract.incompatible_actions
example : ¬ ∃ h : EquivariantRetract (C := Type) ℤ ℤ
    (fun _ : Unit => ↾(fun z : ℤ => z)) (fun _ : Unit => ↾(fun z : ℤ => 2 * z)),
      h.i = 𝟙 ℤ ∧ h.toRetract.r = 𝟙 ℤ := by sorry
end EquivariantRetract

/-- Inverse-increasing shuffles, hence representatives for LEFT Levi cosets. -/
def KostantShuffle (n : ℕ) :=
  {w : Equiv.Perm (Fin (n + n)) //
    StrictMono (fun i : Fin n => w.symm (Fin.castAdd n i)) ∧
    StrictMono (fun i : Fin n => w.symm (Fin.natAdd n i))}

namespace KostantShuffle
variable {n : ℕ}
def val (s : KostantShuffle n) : Equiv.Perm (Fin (n + n)) := s.1

def inversionCount (w : Equiv.Perm (Fin (n + n))) : ℕ :=
  (Finset.univ.filter fun ij : Fin (n + n) × Fin (n + n) =>
    ij.1 < ij.2 ∧ w ij.2 < w ij.1).card

def length (s : KostantShuffle n) : ℕ := inversionCount s.val

lemma mem_iff (w : Equiv.Perm (Fin (n + n))) :
    (∃ s : KostantShuffle n, s.val = w) ↔
      StrictMono (fun i : Fin n => w.symm (Fin.castAdd n i)) ∧
      StrictMono (fun i : Fin n => w.symm (Fin.natAdd n i)) := by sorry

lemma minimal_representative (w : Equiv.Perm (Fin (n + n))) :
    (∃! s : KostantShuffle n, ∃ v : Equiv.Perm (Fin (n + n)),
      (∀ i, (v i).val < n ↔ i.val < n) ∧ w = v * s.val) ∧
    (∀ (s : KostantShuffle n) (v : Equiv.Perm (Fin (n + n))),
      (∀ i, (v i).val < n ↔ i.val < n) → s.length ≤ inversionCount (v * s.val)) := by sorry

-- KostantShuffle.rank_one
example : ∃ s₀ s₁ : KostantShuffle 1,
    s₀.length = 0 ∧ s₁.length = 1 ∧ ∀ s, s = s₀ ∨ s = s₁ := by sorry
-- KostantShuffle.rank_zero
example : ∃! s : KostantShuffle 0, s.length = 0 := by sorry
-- KostantShuffle.block_swap
example (n : ℕ) : ∃ s : KostantShuffle n,
    s.val = (finAddFlip : Fin (n + n) ≃ Fin (n + n)) ∧ s.length = n ^ 2 := by sorry
-- KostantShuffle.internal_swap
example : ¬ ∃ s : KostantShuffle 2,
    s.val = Equiv.swap (0 : Fin 4) 1 := by sorry
end KostantShuffle

/-- This is a predicate on the COMPUTED Levi-weight table. It is not a dummy
highest-weight module or an assumed automorphy obstruction. -/
def CTGWeight {W Emb : Type*} {n : ℕ} (c : Emb → Emb)
    (μ : W → Emb → Fin n → ℤ) : Prop :=
  ∀ w a, ∃ τ, (fun i => μ w τ i + μ w (c τ) i.rev) ≠ fun _ => a

namespace CTGWeight
variable {W Emb : Type*} {n : ℕ} {c : Emb → Emb} {μ : W → Emb → Fin n → ℤ}
lemma iff_witness : CTGWeight c μ ↔
    ∀ w a, ∃ τ i, μ w τ i + μ w (c τ) i.rev ≠ a := by sorry
lemma reindex {W' Emb' : Type*} (eW : W' ≃ W) (eE : Emb' ≃ Emb)
    (c' : Emb' → Emb') (hc : ∀ τ, eE (c' τ) = c (eE τ)) :
    CTGWeight c' (fun w τ i => μ (eW w) (eE τ) i) ↔ CTGWeight c μ := by sorry
lemma not_parallel (w : W) (a : ℤ)
    (h : ∀ τ i, μ w τ i + μ w (c τ) i.rev = a) : ¬ CTGWeight c μ := by sorry
-- CTGWeight.no_cuspidal_levi_weight requires the RG2.6 and AG2 purity interfaces.
-- CTGWeight.zero
example [Nonempty W] : ¬ CTGWeight (W := W) (n := n) c (fun _ _ _ => 0) := by sorry
-- CTGWeight.empty_w
example {Emb : Type*} {n : ℕ} (c : Emb → Emb) (μ : Empty → Emb → Fin n → ℤ) :
    CTGWeight c μ := by sorry
-- CTGWeight.rank_one_pair; first coordinate labels the two conjugate pairs.
example : CTGWeight (n := 1)
    (fun τ : Bool × Bool => (τ.1, !τ.2))
    (fun (_ : Unit) (τ : Bool × Bool) (_ : Fin 1) =>
      if τ.1 && !τ.2 then 1 else 0) := by sorry
end CTGWeight

/-- Valuation splitting of the diagonal torus after uniformizers are chosen. -/
abbrev SplitTorus (n : ℕ) (U : Type*) := (Fin n → U) × Multiplicative (Fin n → ℤ)

def PositiveTorusMonoid (n : ℕ) (U : Type*) [CommGroup U] :
    Submonoid (SplitTorus n U) where
  carrier := {t | ∀ i j, i < j → t.2.toAdd j ≤ t.2.toAdd i}
  one_mem' := by sorry
  mul_mem' := by sorry

namespace PositiveTorusMonoid
variable {n : ℕ} {U : Type*} [CommGroup U]
lemma mem_iff (t : SplitTorus n U) :
    t ∈ PositiveTorusMonoid n U ↔ ∀ i j, i < j → t.2.toAdd j ≤ t.2.toAdd i := by sorry

def contractingElement (n : ℕ) (U : Type*) [CommGroup U] : SplitTorus n U :=
  (1, Multiplicative.ofAdd (fun i => (n : ℤ) - 1 - i.val))

lemma contractingElement_mem :
    contractingElement n U ∈ PositiveTorusMonoid n U := by sorry
lemma unit_subgroup (u : Fin n → U) :
    (u, Multiplicative.ofAdd (0 : Fin n → ℤ)) ∈ PositiveTorusMonoid n U := by sorry
lemma mul (a b : SplitTorus n U) (ha : a ∈ PositiveTorusMonoid n U)
    (hb : b ∈ PositiveTorusMonoid n U) : a * b ∈ PositiveTorusMonoid n U := by sorry
-- PositiveTorusMonoid.rank_one
example (t : SplitTorus 1 U) : t ∈ PositiveTorusMonoid 1 U := by sorry
-- PositiveTorusMonoid.rank_two_positive
example : ((1 : Fin 2 → U), Multiplicative.ofAdd ![(1 : ℤ), 0]) ∈
    PositiveTorusMonoid 2 U := by sorry
-- PositiveTorusMonoid.rank_two_negative
example : ((1 : Fin 2 → U), Multiplicative.ofAdd ![(0 : ℤ), 1]) ∉
    PositiveTorusMonoid 2 U := by sorry
end PositiveTorusMonoid

/-- Unit-group embeddings are supplied as actual characters. Uniformizer powers
have value one, in accordance with ACC §5.2.1 rather than algebraic evaluation. -/
noncomputable def LowestWeightCharacter {Emb U R : Type*} [Fintype Emb]
    [CommGroup U] [CommRing R] (n : ℕ) (σ : Emb → U →* Rˣ)
    (lam : Emb → Fin n → ℤ) : SplitTorus n U →* Rˣ where
  toFun t := ∏ τ, ∏ i, σ τ (t.1 i) ^ lam τ i
  map_one' := by sorry
  map_mul' := by sorry

namespace LowestWeightCharacter
variable {Emb U R : Type*} [Fintype Emb] [CommGroup U] [CommRing R]
variable {n : ℕ} (σ : Emb → U →* Rˣ) (lam : Emb → Fin n → ℤ)
lemma unit_eval (u : Fin n → U) :
    LowestWeightCharacter n σ lam (u, Multiplicative.ofAdd 0) =
      ∏ τ, ∏ i, σ τ (u i) ^ lam τ i := by sorry
lemma uniformizer_eval (a : Fin n → ℤ) :
    LowestWeightCharacter n σ lam (1, Multiplicative.ofAdd a) = 1 := by sorry
lemma add (μ : Emb → Fin n → ℤ) (t : SplitTorus n U) :
    LowestWeightCharacter n σ (lam + μ) t =
      LowestWeightCharacter n σ lam t * LowestWeightCharacter n σ μ t := by sorry
-- LowestWeightCharacter.projection needs the actual integral RG2.6 lattice.
-- LowestWeightCharacter.zero
example (t : SplitTorus n U) : LowestWeightCharacter n σ 0 t = 1 := by sorry
-- LowestWeightCharacter.rank_one_square
example (σ : Unit → U →* Rˣ) (u : U) :
    LowestWeightCharacter 1 σ (fun _ _ => 2)
      ((fun _ => u), Multiplicative.ofAdd 0) = σ () u ^ (2 : ℤ) := by sorry
-- LowestWeightCharacter.uniformizer_normalization
example (a : Fin n → ℤ) :
    LowestWeightCharacter n σ lam (1, Multiplicative.ofAdd a) = 1 := by sorry
end LowestWeightCharacter

/-- The sign and reversal in the unitary/Siegel coefficient dictionary. -/
def UnitaryLeviWeight {n : ℕ} (a b : Fin n → ℤ) : Fin (n + n) → ℤ :=
  Fin.addCases (fun i => -b i.rev) a
namespace UnitaryLeviWeight
variable {n : ℕ} (a b : Fin n → ℤ)
lemma first_block (i : Fin n) : UnitaryLeviWeight a b (Fin.castAdd n i) = -b i.rev := by sorry
lemma second_block (i : Fin n) : UnitaryLeviWeight a b (Fin.natAdd n i) = a i := by sorry
lemma dominant_iff (hn : 0 < n) (ha : Antitone a) (hb : Antitone b) :
    Antitone (UnitaryLeviWeight a b) ↔ -b ⟨0, hn⟩ ≥ a ⟨0, hn⟩ := by sorry
lemma inverse :
    (fun i => UnitaryLeviWeight a b (Fin.natAdd n i)) = a ∧
    (fun i => -UnitaryLeviWeight a b (Fin.castAdd n i.rev)) = b := by sorry
-- UnitaryLeviWeight.rank_one
example : UnitaryLeviWeight ![(2 : ℤ)] ![(-3 : ℤ)] = ![(3 : ℤ), 2] := by sorry
-- UnitaryLeviWeight.zero
example : UnitaryLeviWeight (0 : Fin n → ℤ) 0 = 0 := by sorry
-- UnitaryLeviWeight.rank_two
example : UnitaryLeviWeight ![(2 : ℤ), 1] ![(-3 : ℤ), -4] = ![(4 : ℤ), 3, 2, 1] := by sorry
end UnitaryLeviWeight

/-- BCGP's weight-zero condition is a MULTISET equality with {0,1}. -/
def RankTwoWeightZero {Emb : Type*} (H : Emb → Multiset ℤ) : Prop :=
  ∀ τ, H τ = {0, 1}
namespace RankTwoWeightZero
variable {Emb : Type*} {H : Emb → Multiset ℤ}
lemma iff : RankTwoWeightZero H ↔ ∀ τ, H τ = {0, 1} := by sorry
lemma sum (h : RankTwoWeightZero H) (τ : Emb) : (H τ).sum = 1 := by sorry
lemma regular (h : RankTwoWeightZero H) (τ : Emb) : (H τ).Nodup := by sorry
lemma restriction {Emb' : Type*} (res : Emb' → Emb) (h : RankTwoWeightZero H) :
    RankTwoWeightZero (H ∘ res) := by sorry
-- RankTwoWeightZero.standard
example : RankTwoWeightZero (fun _ : Unit => ({0, 1} : Multiset ℤ)) := by sorry
-- RankTwoWeightZero.repeated_zero
example : ¬ RankTwoWeightZero (fun _ : Unit => ({0, 0} : Multiset ℤ)) := by sorry
-- RankTwoWeightZero.reversed
example : RankTwoWeightZero (fun _ : Unit => ({1, 0} : Multiset ℤ)) := by sorry
end RankTwoWeightZero

/-- The determinant core of oddness, indexed by the actual member/real-place
pairs once those arithmetic indices are available. No Galois group is faked. -/
def RankTwoOdd {I R : Type*} [CommRing R] (A : I → Matrix (Fin 2) (Fin 2) R) : Prop :=
  ∀ i, Matrix.det (A i) = -1
namespace RankTwoOdd
variable {I R : Type*} [CommRing R] {A : I → Matrix (Fin 2) (Fin 2) R}
lemma det_eq (h : RankTwoOdd A) (i : I) : Matrix.det (A i) = -1 := by sorry
lemma conjugate (P Q : Matrix (Fin 2) (Fin 2) R) (hPQ : P * Q = 1) (hQP : Q * P = 1) :
    RankTwoOdd (fun i => P * A i * Q) ↔ RankTwoOdd A := by sorry
lemma no_real_places (A : Empty → Matrix (Fin 2) (Fin 2) R) : RankTwoOdd A := by sorry
-- RankTwoOdd.automorphic_weight_zero needs the actual AG2.6 automorphic system.
-- RankTwoOdd.split_involution
example : RankTwoOdd (fun _ : Unit => (!![(1 : ℚ), 0; 0, -1])) := by sorry
-- RankTwoOdd.identity
example : ¬ RankTwoOdd (fun _ : Unit => (1 : Matrix (Fin 2) (Fin 2) ℚ)) := by sorry
-- RankTwoOdd.empty_real_places
example (A : Empty → Matrix (Fin 2) (Fin 2) ℚ) : RankTwoOdd A := by sorry
end RankTwoOdd

namespace WeightIndependentHidaTwist
/-- Available numeric part of the Hida twist; the actual B complex needs P7/ALS. -/
def nu (n : ℕ) : Fin n → ℤ := fun i => i.val
-- WeightIndependentHidaTwist.rank_one_zero
example : nu 1 + (fun i : Fin 1 => (0 : ℤ)) = 0 := by sorry
-- WeightIndependentHidaTwist.rank_two_zero
example : nu 2 + (fun i : Fin 2 => (0 : ℤ)) = ![(0 : ℤ), 1] := by sorry
-- WeightIndependentHidaTwist.rank_two_weight
example : nu 2 + (fun i : Fin 2 => (![(2 : ℤ), 0]) i.rev) = ![(0 : ℤ), 3] := by sorry
end WeightIndependentHidaTwist

/-- ACC Lemma 4.5.2; this finite combinatorial statement needs no arithmetic stub. -/
theorem shifted_partition_recovery (A B C D : Finset ℤ) (m : ℕ) (hm : 0 < m)
    (hA : A.card = m) (hB : B.card = m) (hC : C.card = m) (hD : D.card = m)
    (hsep : ∀ c ∈ C, ∀ d ∈ D, d < c) (h₀ : A ∪ B = C ∪ D)
    (h₁ : A.image (fun a => a + 1) ∪ B = C.image (fun c => c + 1) ∪ D)
    (hcard₀ : (A ∪ B).card = 2 * m)
    (hcard₁ : (A.image (fun a => a + 1) ∪ B).card = 2 * m) :
    A = C ∧ B = D := by sorry

end TauCeti.PotentialAutomorphy

/- BEGIN NAMED MATHEMATICAL OBLIGATIONS
These are mathematical obligations, NOT elaborated signatures. The full
arithmetic signatures need the actual owner interfaces in the prerequisites.
PROTOCOL section 13 forbids proposition-valued stand-ins for missing types.
The eight typed cores, numeric nu part and shifted_partition_recovery above
are the entire compiled prototype. Names below are retained exactly for
packet/reader agreement; their presence in this comment does not discharge
the arithmetic-signature gap. The reviewed packet and review report govern the corrections; the reader needs the coordinated revision listed in that report.

PotentialAutomorphyInfrastructure:PA.0/coefficient-satake-descent
THEOREM TauCeti.PotentialAutomorphy.coefficient_satake_descent
Let K̃ be as in §2.4.1 (good, decomposed with respect to P = GU; K = K̃ ∩ G(A^∞_{F⁺})), let λ ∈ (Z^n_+)^{Hom(F,E)} be dominant with image λ̃ ∈ (Z^{2n})^{Hom(F⁺,E)} (under (2.2.2)) G̃-dominant, let 𝔪 ⊂ T^S(K, λ) be non-Eisenstein and 𝔪̃ = 𝒮*(𝔪) ⊂ T̃^S. Then 𝒮 : T̃^S → T^S descends to a homomorphism T̃^S(RΓ(∂X̃_K̃, 𝒱_λ̃)_𝔪̃) → T^S(RΓ(X_K, 𝒱_λ)_𝔪).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.0/boundary-level-coefficient-comparison; PotentialAutomorphyInfrastructure:PA.0/siegel-coefficient-retract; SmoothRepresentationsOfLocalGroups:SR.1

PotentialAutomorphyInfrastructure:PA.0/siegel-coefficient-retract
THEOREM TauCeti.PotentialAutomorphy.siegel_coefficient_retract
With K̃ decomposed (so K̃_P = K̃_U ⋊ K) and λ, λ̃ as in Theorem 2.4.4, for each m ≥ 1: (i) arguing as in [NT16 p. 58], RΓ(X^P_{K̃_P}, 𝒱_λ̃/ϖ^m) ≅ RΓ(K̃^S_P × K_S, RΓ(Inf^{P^S×K_S}_{G^S×K_S} 𝔛_G, R1_*^{K̃_{U,S}} 𝒱_λ̃/ϖ^m)), where R1_*^{K̃_{U,S}} sends P^S × K̃_{P,S}-equivariant complexes of sheaves on 𝔛_G to P^S × K_S-equivariant ones; (ii) the K̃_P-equivariant embedding 𝒱_λ → 𝒱_λ̃^{K̃_{U,S}} ⊂ 𝒱_λ̃, which splits K-equivariantly [NT16 Cor. 2.11], makes 𝒱_λ/ϖ^m a direct summand of R1_*^{K̃_{U,S}}(𝒱_λ̃/ϖ^m): the inclusion is 𝒱_λ/ϖ^m → (𝒱_λ̃/ϖ^m)^{K̃_{U,S}} → R1_*^{K̃_{U,S}}𝒱_λ̃/ϖ^m and the retraction is R1_*^{K̃_{U,S}}𝒱_λ̃/ϖ^m → 𝒱_λ̃/ϖ^m (restriction to the trivial subgroup) followed by the splitting 𝒱_λ̃ → 𝒱_λ mod ϖ^m; (iii) hence r_G^* RΓ(X_K, 𝒱_λ/ϖ^m) is a direct summand of RΓ(X^P_{K̃_P}, 𝒱_λ̃/ϖ^m) in D(H(P^S × K̃_{P,S}, K̃_P) ⊗_Z O/ϖ^m), and 𝒮 = r_G ∘ r_P descends to (2.4.7) T̃^S(RΓ(X^P_{K̃_P}, 𝒱_λ̃/ϖ^m)) → T̃^S(RΓ(X_K, 𝒱_λ/ϖ^m)).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.0/boundary-level-coefficient-comparison; ArithmeticLocallySymmetricSpaces:ALS.4; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ; PotentialAutomorphyInfrastructure:PA.0/unitary-levi-weight-dictionary
Recorded gap: Single integral highest-weight owner RG2.6 requires atlas creation

PotentialAutomorphyInfrastructure:PA.0/ramified-satake-descent
THEOREM TauCeti.PotentialAutomorphy.ramified_satake_descent
Let K̃ be as in §2.4.1, let 𝔪 ⊂ T^S(K, 0) be a non-Eisenstein maximal ideal and 𝔪̃ = 𝒮*(𝔪) ⊂ T̃^S. Suppose R ⊂ S satisfies: each v ∈ R is prime to p and split over F⁺; for each v ∈ R − R^c above v̄, K̃_v̄ = q̃_v with p̃_{v,1} ⊂ q̃_v ⊂ p̃_v; for each v ∈ R ∩ R^c above v̄, K̃_v̄ = Ĩ_v̄ with Iw̃_{v̄,1} ⊂ Ĩ_v̄ ⊂ Iw̃_v̄. Let T = S − (R^c − R); let T̃^T_R ⊂ H(G̃(A^∞_{F⁺}), K̃) ⊗_Z O be the (commutative) O-subalgebra generated by T̃^S, all t_{v,i}(σ) (v ∈ R, σ ∈ W_{F_v}) and all e_{v,i}(σ) (v ∈ R^c − R, σ ∈ W_{F_v}), and T^T_R ⊂ H(GL_n(A_F^∞), K) ⊗_Z O the (commutative) O-subalgebra generated by T^T and all t_{v,i}(σ) (v ∈ R, σ ∈ W_{F_v}) (item 82). Then there is a map 𝒮 : T̃^T_R → T^T_R, which descends to an O-algebra homomorphism T̃^T_R(RΓ(∂X̃_K̃, O)_𝔪̃) → T^T_R(RΓ(X_K, O)_𝔪).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.0/coefficient-satake-descent; SmoothRepresentationsOfLocalGroups:SR.1

PotentialAutomorphyInfrastructure:PA.1/kostant-shuffles
DEFINITION KostantShuffle
For the Siegel Levi GL_n×GL_n in GL_{2n}, define KostantShuffle(n) as permutations w of {0,…,2n−1} whose inverse is increasing on each block {0,…,n−1} and {n,…,2n−1}. These are the minimal representatives for (S_n×S_n)\S_{2n}; length is the number of inversions of w. For Res_{F⁺/Q} use one shuffle per embedding and sum lengths. General Weyl groups, roots, dominant weights and highest-weight modules are imported, not defined here.
Direct dependencies: tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; mathlib:Equiv.Perm.permGroup; mathlib:finAddFlip
API KostantShuffle.val (coercion)
The underlying permutation lies in S_{2n}.
API KostantShuffle.mem_iff (characterisation)
Membership is precisely strict increase of the inverse on each of the two Levi blocks.
API KostantShuffle.length (data)
Length is the cardinality of {(i,j):i<j and w(j)<w(i)}.
API KostantShuffle.minimal_representative (compatibility)
The shuffle is the unique minimum-length representative of its left Levi coset.
EXAMPLE KostantShuffle.rank_one (computation)
For n=1 the two shuffles have lengths 0 and 1.
EXAMPLE KostantShuffle.rank_zero (degenerate)
For n=0 the unique shuffle has length 0.
EXAMPLE KostantShuffle.block_swap (computation)
The permutation exchanging the two blocks, preserving order inside each block, is a shuffle of length n².
EXAMPLE KostantShuffle.internal_swap (non-example)
For n=2 the transposition (0 1) is not a shuffle.

PotentialAutomorphyInfrastructure:PA.0/equivariant-retract
DEFINITION EquivariantRetract
For a category C, objects A,B and an indexed family of endomorphisms f_A(r), f_B(r), an EquivariantRetract is a Mathlib Retract A B with f_A(r) followed by i = i followed by f_B(r), and f_B(r) followed by the retraction = the retraction followed by f_A(r), for every r. For C=D(S) and S-algebra actions of R this is the source’s R-equivariant direct summand: the complementary idempotent splits in D(S). The general categorical carrier records no additional ring laws; actual arithmetic applications pass S-algebra homomorphisms.
Direct dependencies: mathlib:CategoryTheory.Retract; mathlib:CategoryTheory.Retract.map; DeformationAndDerivedPatchingAlgebra:P7
API EquivariantRetract.toRetract (compatibility)
Forgetting the commuting equations gives CategoryTheory.Retract A B.
API EquivariantRetract.inclusion_comm (relation)
For every r, f_A(r) followed by i equals i followed by f_B(r).
API EquivariantRetract.retraction_comm (relation)
For every r, f_B(r) followed by the retraction equals the retraction followed by f_A(r).
API EquivariantRetract.map (functoriality)
A functor carries the retract to the image retract, with the image endomorphisms; it preserves both commuting equations.
API EquivariantRetract.idempotent (relation)
The endomorphism of B given by retraction followed by inclusion is an idempotent commuting with every action operator.
EXAMPLE EquivariantRetract.identity (degenerate)
Identity maps on A give an equivariant retract of A into itself.
EXAMPLE EquivariantRetract.forget_identity (compatibility)
The forgotten retract of the identity construction is Mathlib Retract.refl.
EXAMPLE EquivariantRetract.incompatible_actions (non-example)
Identity inclusion/retraction cannot form an equivariant retract between Z with multiplication-by-1 and multiplication-by-2 as the same indexed operator.

PotentialAutomorphyInfrastructure:PA.0/unipotent-exterior-cohomology
THEOREM TauCeti.PotentialAutomorphy.unipotent_exterior_cohomology
Let v̄ ∈ S̄_p, K = F^+_v̄ (a local field here), m ≥ 1. For each i ≥ 0 there is a G(O_K)-equivariant isomorphism H^i(U(O_K), O/ϖ^m) ≅ Hom_{Z_p}(∧^i_{Z_p} U(O_K), O/ϖ^m) = Hom_O(∧^i_O(U(O_K) ⊗_{Z_p} O), O/ϖ^m), with G(O_K) acting on the right through its conjugation action on U(O_K) ≅ Z_p^{n²[K:Q_p]} (continuous group cohomology; the map is the cup-product extension of H^1 = Hom).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.0/integral-model-comparison

PotentialAutomorphyInfrastructure:PA.1/boundary-degree-retract
THEOREM TauCeti.PotentialAutomorphy.boundary_degree_retract
Notation (§4.2): for τ: F^+ ↪ E, W_τ = W(G̃⊗_{F^+,τ}E, T⊗_{F^+,τ}E) ≅ W(GL_{2n}), W_{P,τ} = W(G⊗E, T⊗E) ≅ W(GL_n×GL_n), W^P_τ ⊂ W_τ the representatives of W_{P,τ}\W_τ of §1.2, ρ_τ the half-sum of B⊗E-positive roots; W_v̄, W_{P,v̄}, W^P_v̄ the products over τ ∈ I_v̄ (embeddings inducing v̄), ρ_v̄ = Σ_{τ ∈ Hom(F^+_v̄,E)} ρ_τ; W_T̄, W^P_T̄ for T̄ ⊂ S̄_p, W = W_{S̄_p} with length l and ρ = Σ_v̄ ρ_v̄; λ̃_v̄ = (λ̃_τ)_{τ ∈ Hom(F^+_v̄,E)} and λ_v̄ = (λ_τ)_{τ inducing ṽ or ṽ^c}. Statement: let K̃ ⊂ G̃(A^∞_{F^+}) be a good subgroup decomposed with respect to P with K̃_{U,v̄} = U(O_{F^+_v̄}) for every v̄ ∈ S̄_p, and K = K̃ ∩ G(A^∞_{F^+}); let m ⊂ T^S be non-Eisenstein and m̃ = S^*(m) ⊂ T̃^S. Let S̄_p = S̄_1 ⊔ S̄_2 and let λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}, λ ∈ (Z^n_+)^{Hom(F,E)} be dominant with (1) λ̃_v̄ = λ_v̄ (via (2.2.2)) for v̄ ∈ S̄_1; (2) λ̃_v̄ = 0 for v̄ ∈ S̄_2; (3) for each v̄ ∈ S̄_2 some w_v̄ ∈ W^P_v̄ with λ_v̄ = w_v̄(ρ_v̄) − ρ_v̄; (4) p > n² (p unramified in F throughout §4). Put w_v̄ = 1 for v̄ ∈ S̄_1 and w = (w_v̄). Then for every m ≥ 1, R Γ(X_K, V_λ/ϖ^m)_m[−l(w)] is a T̃^S-equivariant direct summand (T̃^S acting through S) of R Γ(∂X̃_K̃, V_λ̃/ϖ^m)_m̃.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.0/siegel-coefficient-retract; PotentialAutomorphyInfrastructure:PA.0/equivariant-retract; PotentialAutomorphyInfrastructure:PA.1/integral-kostant-decomposition; PotentialAutomorphyInfrastructure:PA.1/unipotent-derived-formality; mathlib:DerivedCategory; PotentialAutomorphyInfrastructure:PA.0/unitary-levi-weight-dictionary

PotentialAutomorphyInfrastructure:PA.1/integral-kostant-decomposition
THEOREM TauCeti.PotentialAutomorphy.integral_kostant_decomposition
Let v̄ ∈ S̄_p, K = F^+_v̄ and assume p ≥ 2n − 1. For w ∈ W^P_v̄ put λ_w = w(ρ_v̄) − ρ_v̄ ∈ (Z^n_+)^{Hom_{Q_p}(F⊗_{F^+}F^+_v̄, E)} (via (2.2.2)). For each i ≥ 0 there is a G(O_K)-equivariant isomorphism Hom_O(∧^i_O(U(O_K) ⊗_{Z_p} O), O) ≅ ⊕_{w ∈ W^P_v̄, l(w) = i} V_{λ_w} (V_{λ_w} the integral dual Weyl module lattice).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.1/kostant-shuffles; PotentialAutomorphyInfrastructure:PA.0/unipotent-exterior-cohomology; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ
Recorded gap: Single integral highest-weight owner RG2.6 requires atlas creation

PotentialAutomorphyInfrastructure:PA.1/unipotent-derived-formality
THEOREM TauCeti.PotentialAutomorphy.unipotent_derived_formality
Let v̄ ∈ S̄_p, K = F^+_v̄, m ≥ 1 and p > n². There is a natural isomorphism, inducing the identity on cohomology, R Γ(U(O_K), O/ϖ^m) ≅ ⊕_{i=0}^{n²[K:Q_p]} H^i(U(O_K), O/ϖ^m)[−i] in D(O/ϖ^m[G(O_K)]).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.0/unipotent-exterior-cohomology

PotentialAutomorphyInfrastructure:PA.1/middle-degree-satake
THEOREM TauCeti.PotentialAutomorphy.middle_degree_satake
Assume [F^+:Q] > 1. Let K̃ ⊂ G̃(A^∞_{F^+}) be good and decomposed with respect to P (K = K̃ ∩ G), with K̃_{U,v̄} = U(O_{F^+_v̄}) for each v̄ ∈ S̄_p (a hypothesis of Theorem 4.2.1 that the proof needs and the statement omits), λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)} and S̄_p = S̄_1 ⊔ S̄_2 with (1) λ̃_v̄ = 0 for v̄ ∈ S̄_2; (2) for every finite place w ∉ S of F with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic field F_0 ⊂ F; (3) p > n² (p unramified in F). Let w ∈ W^P_{S̄_2}, λ_w = w(λ̃+ρ) − ρ ∈ (Z^n_+)^{Hom(F,E)}, m ⊂ T^S non-Eisenstein in the support of H^*(X_K, V_{λ_w}), m̃ = S^*(m), and assume ρ̄_m̃ decomposed generic. Then S: T̃^S → T^S descends to a homomorphism T̃^S(H^d(X̃_K̃, V_λ̃))_m̃ → T^S(H^{d−l(w)}(X_K, V_{λ_w}))_m.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.1/boundary-degree-retract; IgusaVarietiesAndTorsionConcentration:IG.7; AutomorphicGaloisRepresentationsPartII:AG2.0; ArithmeticLocallySymmetricSpaces:ALS.5

PotentialAutomorphyInfrastructure:PA.1/ctg-weight
DEFINITION CTGWeight
Given the actual finite set W^P of Siegel shuffles, the embedding involution τ↦τc and the Levi weight table μ(w,τ,i)=λ_{w,τ,i}, define CTGWeight(μ) by: for every w∈W^P and a∈Z there exists τ for which the vector (μ(w,τ,i)+μ(w,τc,n−1−i))_i is not the constant a vector. Here λ_w=w(λ̃+ρ)−ρ and the conjugate dual row is −reverse(λ_{w,τc}). This predicate on the computed table is Definition 4.3.5; the packet does not replace the weight calculation by arbitrary parallel-trace inequalities.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.1/kostant-shuffles; PotentialAutomorphyInfrastructure:PA.0/unitary-levi-weight-dictionary
API CTGWeight.iff_witness (characterisation)
CTG is equivalent to ∀w,a, ∃τ,i, μ(w,τ,i)+μ(w,τc,n−1−i)≠a.
API CTGWeight.reindex (functoriality)
Equivariant bijections of embeddings and bijections of W preserve the predicate.
API CTGWeight.not_parallel (relation)
If one w and a give that same constant vector at every τ, the table is not CTG.
API CTGWeight.no_cuspidal_levi_weight (compatibility)
For the weight table calculated from λ̃, CTG excludes a regular algebraic cuspidal GL_n representation of any weight λ_w, by the imported purity lemma.
EXAMPLE CTGWeight.zero (non-example)
For nonempty W and n>0 the zero table is not CTG.
EXAMPLE CTGWeight.empty_w (degenerate)
With W empty the predicate is true.
EXAMPLE CTGWeight.rank_one_pair (computation)
For n=1, one w and embeddings a,aᶜ,b,bᶜ, with μ(a)=0, μ(aᶜ)=0, μ(b)=1, μ(bᶜ)=0, the table is CTG: the conjugate sums are 0 and 1.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.1/ctg-one-embedding-perturbation
THEOREM TauCeti.PotentialAutomorphy.ctg_one_embedding_perturbation
Assume [F^+:Q] > 1. Let λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)} and τ_0: F^+ ↪ E. There is λ̃' ∈ (Z^{2n}_+)^{Hom(F^+,E)} with λ̃'_τ = λ̃_τ for all τ ≠ τ_0 and λ̃' CTG; one may take λ̃'_{τ_0} = λ̃_{τ_0} + (a, 0, …, 0) with a ∈ Z_{≥0} sufficiently large (depending on λ̃).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.1/ctg-weight

PotentialAutomorphyInfrastructure:PA.1/fontaine-laffaille-degree-shifting
THEOREM TauCeti.PotentialAutomorphy.fontaine_laffaille_degree_shifting
Let λ ∈ (Z^n_+)^{Hom(F,E)} and let v̄ ≠ v̄' be p-adic places of F^+ (so F^+ ≠ Q). Fix m ≥ 1 and a good K̃ ⊂ G̃(A^∞_{F^+}) (K = K̃ ∩ G). Assume: (1) −λ_{τc,1} − λ_{τ,1} ≥ 0 for every τ: F ↪ E inducing v̄; (2) Σ_{v̄'' ∈ S̄_p, v̄'' ≠ v̄, v̄'} [F^+_{v̄''}:Q_p] > ½[F^+:Q]; (3) U(O_{F^+_{v̄''}}) ⊂ K̃_{v̄''} ⊂ {g ≡ (1_n *; 0 1_n) mod ϖ^m_{v̄''}} for every p-adic v̄'' ≠ v̄, and K̃_v̄ = G̃(O_{F^+_v̄}); (4) p > n²; (5) for every finite place w ∉ S of F with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic field F_0 ⊂ F; (6) m ⊂ T^S is non-Eisenstein and ρ̄_m̃ is decomposed generic. Define λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)} by λ̃_τ = 0 if τ induces neither v̄ nor v̄', λ̃_τ = (−λ_{τ̃c,n}, …, −λ_{τ̃c,1}, λ_{τ̃,1}, …, λ_{τ̃,n}) if τ induces v̄ (dominant by (1)), and λ̃_τ ∈ Z^{2n}_+ arbitrary if τ induces v̄'. For m' ≥ m let K̃(m')_{v̄''} = K̃_{v̄''} ∩ {g ≡ (1_n *; 0 1_n) mod ϖ^{m'}_{v̄''}} for p-adic v̄'' ≠ v̄ and K̃(m')_{v̄''} = K̃_{v̄''} otherwise (K̃ = K̃(m)). Let q ∈ [⌊d/2⌋, d−1]. Then there are m' ≥ m, N ≥ 1 depending only on n and [F^+:Q], a nilpotent ideal J ⊂ A(K,λ,q,m) with J^N = 0, and a commutative square T̃^S → Ã(K̃(m'), λ̃) → A(K,λ,q,m)/J, T̃^S →^S T^S → A(K,λ,q,m)/J.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.1/boundary-degree-retract; PotentialAutomorphyInfrastructure:PA.1/middle-degree-satake; IgusaVarietiesAndTorsionConcentration:IG.7

PotentialAutomorphyInfrastructure:PA.1/middle-range-fontaine-laffaille
THEOREM TauCeti.PotentialAutomorphy.middle_range_fontaine_laffaille
Let λ, v̄ ≠ v̄', m ≥ 1 and a good K̃ satisfy (1) −λ_{τc,1} − λ_{τ,1} ≥ 0 and −λ_{τc,n} − λ_{τ,n} ≤ p − 2n − 1 for every τ inducing v̄, and (2)–(6) of Proposition 4.4.1. Let q ∈ [⌊d/2⌋, d−1], and (for (c), which the statement gives without it) assume A(K,λ,q,m) ≠ 0. Then there are N ≥ 1 depending only on [F:Q] and n, an ideal J ⊂ A(K,λ,q,m) with J^N = 0 and a continuous ρ_m: G_{F,S} → GL_n(A(K,λ,q,m)/J) with (a) char(ρ_m(Frob_v)) = image of P_v(X) for v ∉ S; (b) for each v | v̄, ρ_m|_{G_{F_v}} is in the essential image of G^a, a = (λ_{τ,n})_{τ ∈ Hom_{Q_p}(F_v,E)}; (c) for each v | v̄ there is N̄ ∈ MF_k with ρ̄_m̃|_{G_{F_v}} ≅ G(N̄) and FL_τ(N̄) = {−λ_{τc,n}+2n−1, …, −λ_{τc,1}+n, λ_{τ,1}+n−1, …, λ_{τ,n}} for every τ ∈ Hom_{Q_p}(F_v,E), where ρ̄_m̃ = ρ̄_m ⊕ ρ̄_m^{c,∨}ε^{1−2n}.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.1/fontaine-laffaille-degree-shifting; PotentialAutomorphyInfrastructure:PA.1/ctg-weight; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-essential-image-subquotients; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence; IgusaVarietiesAndTorsionConcentration:IG.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3; PadicHodgeTheory:R06.4; AutomorphicGaloisRepresentationsPartII:AG2.0; PotentialAutomorphyInfrastructure:PA.1/nilpotent-fontaine-laffaille-transfer; AutomorphicGaloisRepresentationsPartII:AG2.2; AutomorphicGaloisRepresentationsPartII:AG2.3; AutomorphicGaloisRepresentationsPartII:AG2.6

PotentialAutomorphyInfrastructure:PA.1/nilpotent-fontaine-laffaille-transfer
THEOREM TauCeti.PotentialAutomorphy.nilpotent_fontaine_laffaille_transfer
Let Ã be a finite flat O-algebra, D̃ a continuous 2n-dimensional determinant of G_{F,S} valued in Ã, and M = Ã[G_{F,S}]/ker D̃. Assume the finite O-module M, restricted to each G_{F_v} with v | v̄, lies in the essential image of the integral Fontaine–Laffaille functor G^a in the stated interval. Let Ã → B be an O-algebra homomorphism, where B is a finite Artinian local O-algebra killed by ϖ^m for some m ≥ 1. Suppose D̃_B = det(ρ ⊕ ρ′) for continuous ρ, ρ′: G_{F,S} → GL_n(B), whose residual representations over the residue field of B are absolutely irreducible and non-isomorphic. Then there is a surjection B ⊗_Ã M ↠ B[G_{F,S}]/ker D̃_B, and the latter algebra is isomorphic to M_n(B) × M_n(B). Consequently ρ|_{G_{F_v}} belongs to the essential image of G^a. The coefficient map Ã → B need not be surjective. Kernel inclusion under arbitrary scalar extension, rather than equality under flat scalar extension, gives the displayed surjection; the split matrix-algebra identification requires the residually multiplicity-free reconstruction and faithful determinant argument.
Direct dependencies: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-essential-image-subquotients; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3; IntegralHeckeAndGaloisDeterminants:IHG.0; IntegralHeckeAndGaloisDeterminants:IHG.1

PotentialAutomorphyInfrastructure:PA.1/all-degree-fontaine-laffaille
THEOREM TauCeti.PotentialAutomorphy.all_degree_fontaine_laffaille
Let v̄ ∈ S̄_p (printed S_p), K ⊂ GL_n(A_F^∞) good, λ ∈ (Z^n_+)^{Hom(F,E)}, m ⊂ T^S(K,λ) non-Eisenstein. Assume: (1) K_v = GL_n(O_{F_v}) for v | v̄; (2) there is v̄' ∈ S̄_p, v̄' ≠ v̄, with Σ_{v̄'' ∈ S̄_p, v̄'' ≠ v̄, v̄'} [F^+_{v̄''}:Q_p] > ½[F^+:Q]; (3) −λ_{τc,1} − λ_{τ,1} ≥ 0 and −λ_{τc,n} − λ_{τ,n} ≤ p − 1 − 2n for every τ inducing v̄; (4) p > n²; (5) for every finite place w ∉ S of F with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic field F_0 ⊂ F; (6) ρ̄_m is decomposed generic. Then for all integers q ∈ [0, d−1] and m ≥ 1 there are N ≥ 1 depending only on [F:Q] and n, J ⊂ A(K,λ,q,m) with J^N = 0, and a continuous ρ_m: G_{F,S} → GL_n(A(K,λ,q,m)/J) satisfying (a), (b), (c) of Proposition 4.4.6.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.1/middle-range-fontaine-laffaille; PotentialAutomorphyInfrastructure:PA.1/nilpotent-fontaine-laffaille-transfer; PotentialAutomorphyInfrastructure:PA.1/degree-reflection-duality; PotentialAutomorphyInfrastructure:PA.1/genericity-making-character-twist; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-essential-image-subquotients; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3

PotentialAutomorphyInfrastructure:PA.1/degree-reflection-duality
THEOREM TauCeti.PotentialAutomorphy.degree_reflection_duality
Assume K is principal-congruence of level ϖ^m at the p-adic places ≠ v̄, λ_{v̄''} = 0 for p-adic v̄'' ≠ v̄, and λ satisfies (3) of Cor. 4.4.8. Then V_{λ^∨} ≅ V_λ^∨ ([Jan03, Cor. II.5.6]). With n_0 = (2n+1−p)/2 and μ_{0,τ} = (n_0, …, n_0), the maximal ideal m^∨(ε^{−n_0}) lies in the support of H^*(X_K, V_{λ^∨+μ_0}), λ^∨+μ_0 again satisfies (3), and [K^S g K^S] ↦ ε(Art_F(det g))^{−n_0}[K^S g^{−1} K^S] (printed Art_K) descends to an isomorphism f: T^S(H^{d−1−q'}(X_K, V_{λ^∨+μ_0}/ϖ^m))_{m^∨(ε^{−n_0})} ≅ A(K,λ,q',m); a representation ρ' for the left side gives ρ = (f∘ρ')^∨ ⊗ ε^{1−2n+(p−1)/2} for the right side, with the same properties (a)–(c).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.0/integral-model-comparison; ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality

PotentialAutomorphyInfrastructure:PA.1/genericity-making-character-twist
THEOREM TauCeti.PotentialAutomorphy.genericity_making_character_twist
(Asserted without proof.) If ρ̄_m is decomposed generic then, after enlarging k, there is a character ψ̄: G_F → k^× with ψ̄|_{G_{F_v}} trivial for every v ∈ S such that (ρ̄_m ⊗ ψ̄) ⊕ ((ρ̄_m ⊗ ψ̄)^{c,∨} ⊗ ε^{1−2n}) is decomposed generic.
Direct dependencies: AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity; AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime
Recorded gap: Global finite character with prescribed triviality and generic ratios

PotentialAutomorphyInfrastructure:PA.1/shifted-partition-recovery
THEOREM TauCeti.PotentialAutomorphy.shifted_partition_recovery
Let m ≥ 1 and let A, B, C, D be sets of integers, each of size m, with c > d for all c ∈ C and d ∈ D. If A ∪ B = C ∪ D and (A+1) ∪ B = (C+1) ∪ D, and both sets have 2m elements, then A = C and B = D.
Direct dependencies: Concrete categorical/finite data only.

PotentialAutomorphyInfrastructure:PA.1/fontaine-laffaille-local-global
THEOREM TauCeti.PotentialAutomorphy.fontaine_laffaille_local_global
Let K ⊂ GL_n(A_F^∞) be a good subgroup, λ ∈ (Z^n_+)^{Hom(F,E)}, S a finite set of finite places of F containing the p-adic places with S = S^c, and m ⊂ T^S(K,λ) a non-Eisenstein maximal ideal with T^S(K,λ)/m = k of characteristic p. Let v̄ be a p-adic place of F^+ and assume: (1) p is unramified in F and F contains an imaginary quadratic field in which p splits; (2) for every finite place w ∉ S of F with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic field F_0 ⊂ F; (3) K_v = GL_n(O_{F_v}) for every v | v̄; (4) λ_{τ,1} + λ_{τc,1} − λ_{τ,n} − λ_{τc,n} ≤ p − 2n − 1 for every τ: F ↪ E inducing v̄; (5) p > n²; (6) there is a p-adic place v̄' ≠ v̄ of F^+ with Σ_{v̄'' ∈ S̄_p, v̄'' ≠ v̄, v̄'} [F^+_{v̄''}:Q_p] > ½[F^+:Q]; (7) ρ̄_m is decomposed generic; (8) either (a) H^*(X_K, V_λ)_m[1/p] ≠ 0, or (b) for every τ inducing v̄, −λ_{τc,n} − λ_{τ,n} ≤ p − 2n − 2 and −λ_{τc,1} − λ_{τ,1} ≥ 0. Then there are an integer N ≥ 1 depending only on [F^+:Q] and n, an ideal J (of T^S(K,λ)_m; printed 'J ⊂ T^S(K,λ)') with J^N = 0, and a continuous ρ_m: G_{F,S} → GL_n(T^S(K,λ)_m/J) such that: (a) for each finite v ∉ S, the characteristic polynomial of ρ_m(Frob_v) is the image of P_v(X); (b) for each v | v̄, ρ_m|_{G_{F_v}} lies in the essential image of G^a with a = (λ_{τ,n})_{τ ∈ Hom(F_v,E)}; (c) for each v | v̄ there is M̄ ∈ MF_k with ρ̄_m|_{G_{F_v}} ≅ G(M̄) and FL_τ(M̄) = {λ_{τ,1}+n−1, λ_{τ,2}+n−2, …, λ_{τ,n}} for every τ: F_v ↪ E.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.1/all-degree-fontaine-laffaille; PotentialAutomorphyInfrastructure:PA.1/shifted-partition-recovery; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-essential-image-subquotients; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3; PadicHodgeTheory:R06.4; AutomorphicGaloisRepresentationsPartII:AG2.0; PotentialModularityAndCompatibleSystems:R24.5/character-system
Recorded gap: Prescribed global crystalline character for the Fontaine–Laffaille weight comparison

PotentialAutomorphyInfrastructure:PA.2/iwahori-level-tower
DEFINITION IwahoriLevelTower
Standing data: F a CM field, n ≥ 1, p a prime, E/Q_p finite containing the images of all embeddings F ↪ Q̄_p; standing hypothesis for all of §5: F contains an imaginary quadratic field in which p splits (p may ramify in F). Let K ⊂ GL_n(A_F^∞) be a good subgroup, λ ∈ (Z^n_+)^{Hom(F,E)}, S a finite set of finite places of F containing S_p and stable under c, such that (i) for every finite v ∉ S with residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in some imaginary quadratic subfield of F; (ii) K_v = Iw_v for v | p and K_v = GL_n(O_{F_v}) for finite v ∉ S. For integers c ≥ b ≥ 0 with c ≥ 1, K(b,c) ⊂ K is the good subgroup with K(b,c)_v = K_v for v ∤ p and K(b,c)_v = Iw_v(b,c) for v | p; K(0,1) = K and K(0,c)/K(b,c) ≅ ∏_{v|p} T_n(O_{F_v}/ϖ_v^b). Define T^{S,ord} = T^S ⊗_O O⟦T_n(O_{F,p})⟧[{U_{v,1},…,U_{v,n},U_{v,n}^{-1}}_{v|p}] (U_{v,i} formal variables), U_v = U_{v,1}U_{v,2}⋯U_{v,n−1}, U_p = ∏_{v|p} U_v. The canonical surjection O⟦T_n(O_{F,p})⟧ → O[K(0,c)/K(b,c)] extends to T^{S,ord} → End_{D(O[K(0,c)/K(b,c)])}(RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ)), U_{v,i} acting by the double coset operator [Iw_v(b,c) diag(ϖ_v,…,ϖ_v,1,…,1) Iw_v(b,c)] (i entries ϖ_v). Additional standing hypothesis for §§5.2–5.5: ϖ_{v^c} = ϖ_v^c for every v | p; the U_{v,i} depend on ϖ_v but RΓ^ord, T^S(K(b,c),λ)^ord and the truth of Theorem 5.5.1 do not.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.0/integral-model-comparison; SmoothRepresentationsOfLocalGroups:SR.1
API IwahoriLevelTower.level (data)
The (b,c)-level equals K away from p and matrices upper triangular modulo varpi_v^c with diagonal congruent to 1 modulo varpi_v^b at p.
API IwahoriLevelTower.transition (functoriality)
For b′≥b,c′≥c, inclusion of levels gives compatible pullback and trace on integral cohomology.
API IwahoriLevelTower.diamondQuotient (compatibility)
K(0,c)/K(b,c) is the product of diagonal unit groups modulo varpi_v^b.
API IwahoriLevelTower.ordinaryOperator (data)
U_p is the product over v|p and 1≤i<n of the normalized double-coset operators; U_{v,n} is already invertible.
EXAMPLE IwahoriLevelTower.base (computation)
K(0,1)=K.
EXAMPLE IwahoriLevelTower.zero_b (degenerate)
For b=0 the diamond quotient is trivial.
EXAMPLE IwahoriLevelTower.deep_unipotent (non-example)
For b=1 a diagonal unit not congruent to 1 modulo varpi_v is excluded even though it belongs to K(0,c).
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.2/arithmetic-ordinary-summand
DEFINITION ArithmeticOrdinarySummand
In the setting of the previous item, there is a well-defined direct summand RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ)^ord of RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ) in D(O[K(0,c)/K(b,c)]) on which U_p acts invertibly (theory of ordinary parts, [KT17 §2.4]). T^S(K(b,c),λ)^ord is the image of T^{S,ord} → End_{D(O[K(0,c)/K(b,c)])}(RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ)^ord), i.e. T^S(K(b,c),λ)^ord = T^{S,ord}(RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ)^ord). There is a canonical homomorphism T^S(K(0,c)/K(b,c), V_λ) → T^S(K(b,c),λ)^ord (in general neither injective nor surjective); consequently every maximal ideal 𝔪 of T^S(K(b,c),λ)^ord has an associated ρ̄_𝔪: G_{F,S} → GL_n(T^S(K(b,c),λ)^ord/𝔪). A maximal ideal of T^{S,ord} with residue field finite over k is of Galois type (resp. non-Eisenstein) if its pullback to T^S is so in the sense of Definition 2.3.6.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/iwahori-level-tower; PadicFamilies:L0a/finite-quotient-system; PadicFamilies:L0a/profinite-ordinary-projector; PadicFamilies:L0a/ordinary-part-complexes
API ArithmeticOrdinarySummand.complex (data)
The image of PadicFamilies:L0a’s derived ordinary idempotent on the tower’s finite perfect complex.
API ArithmeticOrdinarySummand.operator_bijective (relation)
U_p acts invertibly on that image.
API ArithmeticOrdinarySummand.finite_quotient_comparison (compatibility)
Modulo varpi^m the image is the stabilized factorial-power summand, and equals the localization of the finite module at U_p.
API ArithmeticOrdinarySummand.base_change (functoriality)
Coefficient quotient and equivariant tower maps commute with the projector after the finite-quotient/continuity hypotheses are verified.
EXAMPLE ArithmeticOrdinarySummand.zero_complex (degenerate)
The ordinary summand of the zero complex is zero.
EXAMPLE ArithmeticOrdinarySummand.unit_operator (computation)
With U_p the identity, the summand is the whole complex.
EXAMPLE ArithmeticOrdinarySummand.nilpotent_operator (non-example)
A finite complex with nilpotent U_p has zero ordinary summand.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.2/ordinary-galois-characters
DEFINITION OrdinaryGaloisCharacters
The operators U_{v,i} are invertible in T^S(K(b,c),λ)^ord (because U_p is). For each v | p and i = 1,…,n, χ_{λ,v,i}: G_{F_v} → (T^S(K(b,c),λ)^ord)^× is the unique continuous character with χ_{λ,v,i}(Art_{F_v}(u)) = ε^{1−i}(Art_{F_v}(u)) · ∏_{τ∈Hom_{Q_p}(F_v,E)} τ(u)^{−(w_0^G λ)_{τ,i}} · ⟨diag(1,…,u,…,1)⟩ for u ∈ O_{F_v}^× (u in the i-th diagonal entry), and χ_{λ,v,i}(Art_{F_v}(ϖ_v)) = ε^{1−i}(Art_{F_v}(ϖ_v)) · U_{v,i}/U_{v,i−1} (with U_{v,0} = 1).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/iwahori-level-tower; PotentialAutomorphyInfrastructure:PA.2/arithmetic-ordinary-summand; mathlib:Matrix.charpoly
API OrdinaryGaloisCharacters.on_units (simp)
On Art(u), χ_i=ε^{1−i}∏τ τ(u)^{−λ_{τ,n−i+1}} times the i-th diamond character.
API OrdinaryGaloisCharacters.on_uniformizer (simp)
On Art(varpi_v), χ_i=ε^{1−i} U_{v,i}/U_{v,i−1}, with U_{v,0}=1.
API OrdinaryGaloisCharacters.unique (extensionality)
The unit formula and chosen uniformizer value determine the continuous character by local class field theory.
API OrdinaryGaloisCharacters.change_uniformizer (compatibility)
Changing the uniformizer changes the U-ratio by the corresponding unit/diamond factor and leaves the Galois character unchanged.
EXAMPLE OrdinaryGaloisCharacters.rank_one (computation)
For n=1, χ₁(Art(varpi_v))=U_{v,1}.
EXAMPLE OrdinaryGaloisCharacters.determinant (characterisation)
The product of the n uniformizer values is ε^{n(1−n)/2}U_{v,n}.
EXAMPLE OrdinaryGaloisCharacters.weight_reversal (non-example)
For rank 2 with λ=(2,0), the algebraic unit factors are 1 for χ₁ and u^{-2} for χ₂ before ε and diamonds; using λ_i instead of λ_{n−i+1} reverses them.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.2/positive-torus-monoid
DEFINITION PositiveTorusMonoid
T_n(F_p)^+ ⊂ T_n(F_p) is the open submonoid of t with t N_n(O_{F,p}) t^{-1} ⊂ N_n(O_{F,p}); T_n(F_v)^+ = T_n(F_v) ∩ T_n(F_p)^+; Δ_p = ∏_{v|p} Iw_v T_n(F_v)^+ Iw_v (§2.2.5). For b ≥ 0: T_n(O_{F,p})(b) = ∏_{v∈S_p} ker(T_n(O_{F_v}) → T_n(O_{F_v}/ϖ_v^b)), T_n(O_{F,p})_b = T_n(O_{F,p})/T_n(O_{F,p})(b), T_n(F_p)^+_b = T_n(F_p)^+/T_n(O_{F,p})(b), T_n(F_p)_b = T_n(F_p)/T_n(O_{F,p})(b). u_p = (p^{n−1}, p^{n−2}, …, 1) ∈ T_n(Q_p) ⊂ T_n(F_p) lies in T_n(F_p)^+. B_n(F_p)^+ = N_n(O_{F,p})·T_n(F_p)^+ ⊂ Δ_p; B_n(O_{F,p})(b) is the preimage of T_n(O_{F,p})(b) in B_n(O_{F,p}). Every C ∈ D_sm(O/ϖ^m[T_n(F_p)^+_b]) carries a functorial homomorphism O⟦T_n(O_{F,p})⟧[{U_{v,1},…,U_{v,n},U_{v,n}^{-1}}_{v∈S_p}] → End(C), via O⟦T_n(O_{F,p})⟧ → O/ϖ^m[T_n(O_{F,p})_b] and U_{v,i} ↦ diag(ϖ_v,…,ϖ_v,1,…,1) ∈ T_n(F_v) (i entries ϖ_v); hence a T^S-action on C extends to a T^{S,ord}-action.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/iwahori-level-tower; SmoothRepresentationsOfLocalGroups:SR.1
API PositiveTorusMonoid.mem_iff (characterisation)
For a diagonal torus element, contraction of upper unipotents is equivalent to valuation(t_i)≥valuation(t_j) for i<j.
API PositiveTorusMonoid.contractingElement (data)
The exponent row (n−1,n−2,…,0) defines u_p and belongs to the positive cone.
API PositiveTorusMonoid.unit_subgroup (compatibility)
Every diagonal unit belongs to the cone, and zero valuations recover the compact torus.
API PositiveTorusMonoid.mul (structure)
Componentwise products preserve the cone, so it is an open submonoid of the diagonal torus.
EXAMPLE PositiveTorusMonoid.rank_one (degenerate)
For n=1 all diagonal torus elements are positive.
EXAMPLE PositiveTorusMonoid.rank_two_positive (computation)
The exponent row (1,0) is positive.
EXAMPLE PositiveTorusMonoid.rank_two_negative (non-example)
The exponent row (0,1) is not positive for the upper-triangular Borel.

PotentialAutomorphyInfrastructure:PA.2/lowest-weight-character
DEFINITION LowestWeightCharacter
For λ ∈ X^*((Res_{F/Q}T_n)_E) = (Z^n)^{Hom(F,E)}, O(λ) is the free rank-one O-module on which u ∈ T_n(O_{F,p}) acts by ∏_{τ∈Hom(F,E)} ∏_{i=1}^n τ(u_i)^{λ_{τ,i}} and every diag(ϖ_v^{a_1},…,ϖ_v^{a_n}) (a_i ∈ Z) acts trivially. For dominant λ, projection to the lowest weight space gives an O-linear map V_λ → O(w_0^G λ) which is B_n(F_p)^+-equivariant (·_p-action of §2.2.5 on the source, action through the projection to T_n(F_p) on the target); K_λ := ker(V_λ → O(w_0^G λ)) is an O[B_n(F_p)^+]-module, finite free over O.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/positive-torus-monoid; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ
API LowestWeightCharacter.unit_eval (simp)
On units u its scalar is ∏τ,i τ(u_i)^{λ_{τ,i}}.
API LowestWeightCharacter.uniformizer_eval (simp)
It is 1 on every chosen diagonal uniformizer power.
API LowestWeightCharacter.add (relation)
The character for λ+μ is the product of the two characters.
API LowestWeightCharacter.projection (compatibility)
For dominant λ the integral dual-Weyl lattice has a B⁺-equivariant lowest-weight quotient O(w₀λ) with finite free kernel killed by a power of u_p modulo varpi^m.
EXAMPLE LowestWeightCharacter.zero (degenerate)
The zero weight gives the trivial character.
EXAMPLE LowestWeightCharacter.rank_one_square (computation)
For one embedding, rank one and weight 2, a unit u acts by τ(u)².
EXAMPLE LowestWeightCharacter.uniformizer_normalization (non-example)
Even for nonzero λ, chosen uniformizers act by 1, not by their algebraic λ-power.
Recorded gap: Single integral highest-weight owner RG2.6 requires atlas creation
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.2/local-ordinary-parts
DEFINITION LocalOrdinaryParts
Γ(N_n(O_{F,p}),−): Mod_sm(O/ϖ^m[Δ_p]) → Mod_sm(O/ϖ^m[T_n(F_p)^+]) is N_n(O_{F,p})-invariants with t ∈ T_n(F_p)^+ acting by t·v = Σ_{n∈N_n(O_{F,p})/tN_n(O_{F,p})t^{-1}} n t v (5.2.5), i.e. by the double coset operator [N_n(O_{F,p}) t N_n(O_{F,p})]. Γ(B_n(O_{F,p})(b),−): Mod_sm(O/ϖ^m[Δ_p]) → Mod(O/ϖ^m[T_n(F_p)^+_b]) is B_n(O_{F,p})(b)-invariants with the same formula. For c ≥ b ≥ 0, c ≥ 1, Iw_p(b,c) = ∏_{v∈S_p} Iw_v(b,c) and Γ(Iw_p(b,c),−): Mod_sm(O/ϖ^m[Δ_p]) → Mod(O/ϖ^m[T_n(F_p)^+_b]), t acting by [Iw_p(b,c) t Iw_p(b,c)]. Γ(T_n(O_{F,p})(b),−) maps Mod_sm(O/ϖ^m[T_n(F_p)^+]) → Mod(O/ϖ^m[T_n(F_p)^+_b]) and Mod_sm(O/ϖ^m[T_n(F_p)]) → Mod(O/ϖ^m[T_n(F_p)_b]). ord = − ⊗_{O/ϖ^m[T_n(F_p)^+]} O/ϖ^m[T_n(F_p)]: Mod_sm(O/ϖ^m[T_n(F_p)^+]) → Mod_sm(O/ϖ^m[T_n(F_p)]) and ord_b = − ⊗_{O/ϖ^m[T_n(F_p)^+_b]} O/ϖ^m[T_n(F_p)_b]: Mod(O/ϖ^m[T_n(F_p)^+_b]) → Mod(O/ϖ^m[T_n(F_p)_b]) (localizations; on modules finite over O/ϖ^m they agree with the maximal summand on which the torus acts invertibly, [Eme10b, Lem. 3.2.1]).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/positive-torus-monoid; PadicFamilies:L0a/ordinary-part-localization; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension
API LocalOrdinaryParts.transfer_action (data)
The action on N(O)-invariants is t·v=Σ_{n∈N(O)/tN(O)t^{-1}} ntv.
API LocalOrdinaryParts.localization (characterisation)
Ordinary parts are the localization from the positive-torus monoid algebra to the group algebra after N-invariants.
API LocalOrdinaryParts.finite_comparison (compatibility)
On finite O/varpi^m-modules this localization is the PadicFamilies:L0a ordinary summand.
API LocalOrdinaryParts.map (functoriality)
Equivariant module maps induce ordinary maps and preserve identity/composition.
API LocalOrdinaryParts.derived (data)
Derive N-invariants in the smooth monoid category, then apply exact localization.
EXAMPLE LocalOrdinaryParts.zero (degenerate)
The ordinary parts of the zero representation are zero.
EXAMPLE LocalOrdinaryParts.trivial_unipotent (compatibility)
For N={1}, the functor is precisely torus localization.
EXAMPLE LocalOrdinaryParts.transfer_not_naive (non-example)
For a trivial F_p-representation of N=Z_p and tNt^{-1}=pN, transfer acts by p=0; ordinary localization is zero although the naive t action would be the identity.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.2/ordinary-torus-invariants
THEOREM TauCeti.PotentialAutomorphy.ordinary_torus_invariants
For b ≥ 0 the square Γ(T_n(O_{F,p})(b),−) ∘ ord ≅ ord_b ∘ Γ(T_n(O_{F,p})(b),−) of functors Mod_sm(O/ϖ^m[T_n(F_p)^+]) → Mod(O/ϖ^m[T_n(F_p)_b]) commutes up to natural isomorphism; i.e. the natural map M^{T_n(O_{F,p})(b)} ⊗_{O/ϖ^m[T_n(F_p)^+_b]} O/ϖ^m[T_n(F_p)_b] → (M ⊗_{O/ϖ^m[T_n(F_p)^+]} O/ϖ^m[T_n(F_p)])^{T_n(O_{F,p})(b)} is an isomorphism for every smooth M.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/local-ordinary-parts

PotentialAutomorphyInfrastructure:PA.2/unipotent-invariants-acyclicity
THEOREM TauCeti.PotentialAutomorphy.unipotent_invariants_acyclicity
The functors Γ(N_n(O_{F,p}),−), Γ(B_n(O_{F,p})(b),−) and Γ(Iw_p(b,c),−) on Mod_sm(O/ϖ^m[Δ_p]) are left exact, and for every b ≥ 0 the functor Γ(N_n(O_{F,p}),−) sends injective objects of Mod_sm(O/ϖ^m[Δ_p]) to Γ(T_n(O_{F,p})(b),−)-acyclic objects of Mod_sm(O/ϖ^m[T_n(F_p)^+]).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/local-ordinary-parts; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension

PotentialAutomorphyInfrastructure:PA.2/ordinary-exact-injective
THEOREM TauCeti.PotentialAutomorphy.ordinary_exact_injective
The localization functors ord: Mod_sm(O/ϖ^m[T_n(F_p)^+]) → Mod_sm(O/ϖ^m[T_n(F_p)]) and ord_b: Mod(O/ϖ^m[T_n(F_p)^+_b]) → Mod(O/ϖ^m[T_n(F_p)_b]) are exact and preserve injectives.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/local-ordinary-parts; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension

PotentialAutomorphyInfrastructure:PA.2/iwahori-borel-ordinary-comparison
THEOREM TauCeti.PotentialAutomorphy.iwahori_borel_ordinary_comparison
For c ≥ b ≥ 0 with c ≥ 1 there is a natural isomorphism ord_b ∘ Γ(Iw_p(b,c),−) ≅ ord_b ∘ Γ(B_n(O_{F,p})(b),−) of functors Mod_sm(O/ϖ^m[Δ_p]) → Mod(O/ϖ^m[T_n(F_p)_b]), induced by the inclusion V^{Iw_p(b,c)} ⊂ V^{B_n(O_{F,p})(b)} (which is T_n(F_p)^+_b-equivariant because Iw_p(b,c) has an Iwahori decomposition).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/ordinary-torus-invariants; PotentialAutomorphyInfrastructure:PA.2/ordinary-exact-injective

PotentialAutomorphyInfrastructure:PA.2/derived-ordinary-comparison
THEOREM TauCeti.PotentialAutomorphy.derived_ordinary_comparison
Let π ∈ D_sm(O/ϖ^m[Δ_p]) be bounded below. For c ≥ b ≥ 0 with c ≥ 1 there is a natural isomorphism RΓ(T_n(O_{F,p})(b), ord RΓ(N_n(O_{F,p}), π)) ≅ ord_b RΓ(Iw_p(b,c), π) in D(O/ϖ^m[T_n(F_p)_b]).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/unipotent-invariants-acyclicity; PotentialAutomorphyInfrastructure:PA.2/ordinary-exact-injective; PotentialAutomorphyInfrastructure:PA.2/iwahori-borel-ordinary-comparison; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension

PotentialAutomorphyInfrastructure:PA.2/completed-arithmetic-cohomology
DEFINITION CompletedArithmeticCohomology
For K ⊂ GL_n(A_F^∞) good there are functors Γ_{K^p,sm}: Mod(O/ϖ^m[G^∞]) → Mod_sm(O/ϖ^m[G(F_p^+)]) and Mod(O/ϖ^m[G^{p,∞}×Δ_p]) → Mod_sm(O/ϖ^m[Δ_p]), M ↦ Γ(K^p,M)^sm. For λ ∈ (Z^n_+)^{Hom(F,E)}, π(K^p,λ,m) := RΓ_{K^p,sm} RΓ(𝔛_G, V_λ/ϖ^m) ∈ D_sm(O/ϖ^m[Δ_p]). If K^S = ∏_{v∉S} GL_n(O_{F_v}) it carries T^S → End_{D_sm(O/ϖ^m[Δ_p])}(π(K^p,λ,m)) (5.2.11), and for K_p ⊂ Δ_p a canonical T^S-equivariant isomorphism RΓ(K_p, π(K^p,λ,m)) ≅ RΓ(X_K, V_λ/ϖ^m) in D(O/ϖ^m) (5.2.12). π(K^p,m) := RΓ_{K^p,sm} RΓ(𝔛_G, O/ϖ^m) ∈ D_sm(O/ϖ^m[G(F_p^+)]) carries T^S → End_{D_sm(O/ϖ^m[G(F_p^+)])}(π(K^p,m)) (5.2.13), recovering (5.2.11) for λ = 0; T^S(K^p,m) := image of (5.2.13).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.0/integral-model-comparison; mathlib:DerivedCategory; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension
API CompletedArithmeticCohomology.finite_level (compatibility)
RΓ(K_p,π(K^p,λ,m))≅RΓ(X_K,V_λ/varpi^m), Hecke-equivariantly.
API CompletedArithmeticCohomology.hecke_action (data)
Unramified double cosets away from S give T^S → End of the smooth derived complex.
API CompletedArithmeticCohomology.coefficient_reduction (functoriality)
Derived coefficient reduction m′→m commutes with completed cohomology on the imported finite-projective models.
API CompletedArithmeticCohomology.weight_zero (compatibility)
At λ=0 this is the weight-zero completed complex with the full local group action.
EXAMPLE CompletedArithmeticCohomology.zero_coefficients (degenerate)
The zero coefficient local system gives the zero completed complex.
EXAMPLE CompletedArithmeticCohomology.finite_level_identity (compatibility)
Taking the specified K_p derived invariants recovers the ALS finite-level complex, rather than its degree-zero invariants only.
EXAMPLE CompletedArithmeticCohomology.higher_group_cohomology (non-example)
For the trivial F_p-module of a pro-p group Z_p, replacing derived invariants by fixed vectors loses the nonzero H¹.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.2/completed-ordinary-cohomology
DEFINITION CompletedOrdinaryCohomology
π^ord(K^p,λ,m) := ord RΓ(N_n(O_{F,p}), π(K^p,λ,m)) ∈ D_sm(O/ϖ^m[T_n(F_p)]); for λ = 0 it is written π^ord(K^p,m).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/local-ordinary-parts; PotentialAutomorphyInfrastructure:PA.2/derived-ordinary-comparison; PotentialAutomorphyInfrastructure:PA.2/completed-arithmetic-cohomology
API CompletedOrdinaryCohomology.formula (characterisation)
π^ord=ord RΓ(N_n(O),π), in the smooth torus derived category.
API CompletedOrdinaryCohomology.torus_action (data)
The torus group acts after localization; Hecke away from S acts commuting with it.
API CompletedOrdinaryCohomology.weight_zero (compatibility)
At λ=0 the formula agrees with ordinary parts of weight-zero completed arithmetic cohomology.
API CompletedOrdinaryCohomology.change_coefficients (functoriality)
Derived reduction modulo a smaller coefficient power commutes under the tower’s finite-quotient hypotheses.
EXAMPLE CompletedOrdinaryCohomology.zero (degenerate)
Zero completed cohomology has zero ordinary part.
EXAMPLE CompletedOrdinaryCohomology.invertible_contractor (compatibility)
If N={1} and all positive torus operators are invertible, ordinary localization recovers the original complex.
EXAMPLE CompletedOrdinaryCohomology.nilpotent_contractor (non-example)
A nilpotent contracting action gives zero ordinary part, even with nonzero completed cohomology.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.2/completed-classical-ordinary-control
THEOREM TauCeti.PotentialAutomorphy.completed_classical_ordinary_control
Let K ⊂ G^∞ be a good subgroup with K_v = Iw_v for each v | p and K^S = ∏_{v∉S} GL_n(O_{F_v}), and let c ≥ b ≥ 0 be integers with c ≥ 1. For every λ ∈ (Z^n_+)^{Hom(F,E)} there is a T^{S,ord}-equivariant isomorphism RΓ(T_n(O_{F,p})(b), π^ord(K^p,λ,m)) ≅ RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ/ϖ^m)^ord in D(O/ϖ^m[K(0,c)/K(b,c)]) (K(0,c)/K(b,c) ≅ T_n(O_{F,p})_b).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/completed-ordinary-cohomology; PotentialAutomorphyInfrastructure:PA.2/iwahori-borel-ordinary-comparison

PotentialAutomorphyInfrastructure:PA.2/ordinary-level-control
THEOREM TauCeti.PotentialAutomorphy.ordinary_level_control
Let K ⊂ GL_n(A_F^∞) be good with K_v = Iw_v for v | p and K^S = ∏_{v∉S} GL_n(O_{F_v}); let c ≥ b ≥ 0 with c ≥ 1 and λ ∈ (Z^n_+)^{Hom(F,E)}. The natural morphism RΓ_{K(0,max(1,b))/K(b,max(1,b))}(X_{K(b,max(1,b))}, V_λ/ϖ^m)^ord → RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ/ϖ^m)^ord in D(O/ϖ^m[T_n(O_{F,p})_b]) is an isomorphism.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/completed-classical-ordinary-control

PotentialAutomorphyInfrastructure:PA.2/completed-ordinary-weight-control
THEOREM TauCeti.PotentialAutomorphy.completed_ordinary_weight_control
Let K ⊂ GL_n(A_F^∞) be good with K^S = ∏_{v∉S} GL_n(O_{F,v}) and λ ∈ (Z^n_+)^{Hom(F,E)}. There are T^S-equivariant isomorphisms in D(O/ϖ^m[T_n(F_p)]): π^ord(K^p,λ,m) ≅ ord RΓ(N_n(O_{F,p}), RΓ_{K^p,sm} RΓ(𝔛_G, O(w_0^G λ)/ϖ^m)) ≅ π^ord(K^p,m) ⊗_O O(w_0^G λ).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/completed-ordinary-cohomology; PotentialAutomorphyInfrastructure:PA.2/lowest-weight-character

PotentialAutomorphyInfrastructure:PA.2/finite-ordinary-weight-control
THEOREM TauCeti.PotentialAutomorphy.finite_ordinary_weight_control
Let K be good with K_v = Iw_v for v | p and K^S = ∏_{v∉S} GL_n(O_{F_v}); c ≥ b ≥ 0 with c ≥ 1. For λ, λ' ∈ (Z^n_+)^{Hom(F,E)} with O(w_0^G λ)/ϖ^m ≅ O(w_0^G λ')/ϖ^m as O/ϖ^m[T_n(O_{F,p})(b)]-modules there is a T^{S,ord}-equivariant isomorphism RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ/ϖ^m)^ord ≅ RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_{λ'}/ϖ^m)^ord ⊗_O O(w_0^G λ) ⊗_O O((w_0^G λ')^{-1}) in D(O/ϖ^m[T_n(F_p)_b]).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/completed-ordinary-weight-control; PotentialAutomorphyInfrastructure:PA.2/completed-classical-ordinary-control

PotentialAutomorphyInfrastructure:PA.2/unitary-ordinary-tower
DEFINITION UnitaryOrdinaryTower
Every p-adic place of F^+ splits in F; the fixed lifts ṽ ∈ S̃_p give ∏_{v̄∈S̄_p} ι_ṽ: G̃(F_p^+) ≅ ∏_{v̄∈S̄_p} GL_{2n}(F_ṽ), with T ⊂ B ⊂ G̃ corresponding to T_{2n} ⊂ B_{2n}. T̃^{S,ord} = T̃^S ⊗_O O⟦T(O_{F^+,p})⟧[{Ũ_{v,1},…,Ũ_{v,2n},Ũ_{v,2n}^{-1}}_{v∈S_p}] / (Ũ_{v^c,i} − Ũ_{v,2n−i} Ũ_{v,2n}^{-1})_{v∈S_p, i=1,…,2n}; Ũ_v = [Iw diag(ϖ^{2n−1},…,ϖ,1) Iw] (equivalently the product of the 2n−1 simple ordinary operators with the source normalization) and Ũ_p = ∏_{v∈S_p} Ũ_v. For K̃ good with K̃_v̄ = Ĩw_v̄ (v̄ ∈ S̄_p) and c ≥ b ≥ 0, c ≥ 1: K̃(b,c)_v̄ = K̃_v̄ (v̄ ∉ S̄_p), Ĩw_v̄(b,c) (v̄ ∈ S̄_p). For λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)} there is a well-defined direct summand RΓ_{K̃(0,c)/K̃(b,c)}(X̃_{K̃(b,c)}, V_λ̃)^ord on which Ũ_p acts invertibly, and T̃(K̃(b,c),λ̃)^ord := T̃^{S,ord}(RΓ_{K̃(0,c)/K̃(b,c)}(X̃_{K̃(b,c)}, V_λ̃)^ord). Monoids: T(F_p^+)^+ ⊂ T(F_p^+) = elements contracting N(O_{F^+,p}); under T(F_p^+) = T_n(F_p), T(F_p^+)^+ ⊂ T_n(F_p)^+ (strictly for n ≥ 2); Ĩw_p(b,c) = ∏_{v̄} Ĩw_v̄(b,c); Δ̃_p = Ĩw_p(b,c) T(F_p^+)^+ Ĩw_p(b,c) with its ·_p-action on V_λ̃; T(O_{F^+,p})(b) = T_n(O_{F,p})(b); B(O_{F^+,p})(b) = preimage of T(O_{F^+,p})(b) in B(O_{F^+,p}); B(F_p^+)^+ = N(O_{F^+,p})·T(F_p^+)^+.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.0/integral-model-comparison; PotentialAutomorphyInfrastructure:PA.2/positive-torus-monoid; PadicFamilies:L0a/finite-quotient-system; PadicFamilies:L0a/profinite-ordinary-projector; PadicFamilies:L0a/ordinary-part-complexes; SmoothRepresentationsOfLocalGroups:SR.1; PotentialAutomorphyInfrastructure:PA.0/unitary-levi-weight-dictionary
API UnitaryOrdinaryTower.split_local_factor (compatibility)
The chosen lift of v̄ identifies its factor with GL_{2n}(F_v).
API UnitaryOrdinaryTower.conjugate_operator (relation)
Ũ_{vᶜ,i}=Ũ_{v,2n−i}Ũ_{v,2n}^{−1}.
API UnitaryOrdinaryTower.ordinary_operator (data)
The full contracting double coset is diag(varpi^{2n−1},…,varpi,1).
API UnitaryOrdinaryTower.coefficient_control (functoriality)
Boundary and interior tower maps commute with the finite-quotient ordinary projector.
EXAMPLE UnitaryOrdinaryTower.zero_b (degenerate)
The diamond quotient at b=0 is trivial.
EXAMPLE UnitaryOrdinaryTower.rank_one_contraction (computation)
For n=1 the unitary rank-2 contracting exponents are (1,0), so the ordinary operator is not an empty product.
EXAMPLE UnitaryOrdinaryTower.proper_cone (non-example)
For n≥2 the unitary positive monoid in the Levi torus is strictly smaller than the GL_n positive monoid; the Satake map cannot equate the cones.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.2/ordinary-satake-homomorphism
THEOREM TauCeti.PotentialAutomorphy.ordinary_satake_homomorphism
With the Siegel Levi G ≅ Res_{O_F/O_{F^+}} GL_n (so T ≅ Res_{O_F/O_{F^+}} T_n), the unnormalized Satake homomorphism S: T̃^S → T^S of (2.1.8) extends to S: T̃^{S,ord} → T^{S,ord} using O⟦T(O_{F^+,p})⟧ ≅ O⟦T_n(O_{F,p})⟧ and Ũ_{v,i} ↦ U_{v^c,n−i} U_{v^c,n}^{-1} (1 ≤ i ≤ n), Ũ_{v,i} ↦ U_{v^c,n}^{-1} U_{v,i−n} (n+1 ≤ i ≤ 2n); these are double coset operators of elements of T(F_p^+) and T_n(F_p) that match under T(F_p^+) = T_n(F_p). (The assignment respects the relations Ũ_{v^c,i} = Ũ_{v,2n−i}Ũ_{v,2n}^{-1}.)
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/unitary-ordinary-tower; PotentialAutomorphyInfrastructure:PA.0/ramified-satake-descent; SmoothRepresentationsOfLocalGroups:SR.1

PotentialAutomorphyInfrastructure:PA.2/unitary-completed-boundary
DEFINITION UnitaryCompletedBoundary
Fix m ≥ 1; K̃ ⊂ G̃(A^∞_{F^+}) good with K̃_v̄ = Ĩw_v̄ (v̄ ∈ S̄_p), λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}. π̃(K̃^p,λ̃,m) := RΓ_{K̃^p,sm} RΓ(𝔛_G̃, V_λ̃/ϖ^m) ∈ D_sm(O/ϖ^m[Δ̃_p]) (5.2.20), with T̃^S → End (5.2.21) if K̃^S = G̃(Ô^S_{F^+}); π̃(K̃^p,m) := RΓ_{K̃^p,sm} RΓ(𝔛_G̃, O/ϖ^m) ∈ D_sm(O/ϖ^m[G̃(F_p^+)]) with (5.2.22); boundary versions π̃_∂(K̃^p,λ̃,m) := RΓ_{K̃^p,sm} RΓ(∂𝔛_G̃, V_λ̃/ϖ^m) (5.2.23)–(5.2.24) and π̃_∂(K̃^p,m) (5.2.25). For c ≥ b ≥ 0, c ≥ 1, canonical T̃^{S,ord}-equivariant isomorphisms RΓ(Ĩw_p(b,c), π̃(K̃^p,λ̃,m)) ≅ RΓ(X̃_{K̃(b,c)}, V_λ̃/ϖ^m) (5.2.26) and RΓ(Ĩw_p(b,c), π̃_∂(K̃^p,λ̃,m)) ≅ RΓ(∂X̃_{K̃(b,c)}, V_λ̃/ϖ^m) (5.2.27) in D(O/ϖ^m). Ordinary parts: π̃^ord(K̃^p,λ̃,m) = ord RΓ(N(O_{F^+,p}), π̃(K̃^p,λ̃,m)) and π̃^ord_∂(K̃^p,λ̃,m) = ord RΓ(N(O_{F^+,p}), π̃_∂(K̃^p,λ̃,m)) in D_sm(O/ϖ^m[T(F_p^+)]); λ̃ = 0 is omitted from the notation.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/unitary-ordinary-tower; PotentialAutomorphyInfrastructure:PA.0/boundary-level-coefficient-comparison; mathlib:DerivedCategory
API UnitaryCompletedBoundary.interior (data)
The interior complex is RΓ_{K̃^p,sm}RΓ of the unitary arithmetic groupoid.
API UnitaryCompletedBoundary.boundary (data)
Replace that groupoid by its Borel–Serre boundary to obtain π̃_∂.
API UnitaryCompletedBoundary.finite_level (compatibility)
Iwahori derived invariants recover the corresponding finite interior and boundary complexes.
API UnitaryCompletedBoundary.triangle (relation)
The imported compact-support/interior/boundary triangle carries the same commuting Hecke and ordinary actions.
EXAMPLE UnitaryCompletedBoundary.zero_coefficients (degenerate)
All three complexes vanish for the zero coefficient local system.
EXAMPLE UnitaryCompletedBoundary.boundary_recovery (compatibility)
Finite Iwahori derived invariants of π̃_∂ give the ALS boundary complex.
EXAMPLE UnitaryCompletedBoundary.compact_case (degenerate)
When the boundary is empty its completed complex is zero and compact-support equals interior cohomology.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.2/unitary-ordinary-control
THEOREM TauCeti.PotentialAutomorphy.unitary_ordinary_control
Let K̃ ⊂ G̃(A^∞_{F^+}) be good with K̃_v̄ = Ĩw_v̄ for v̄ ∈ S̄_p and K̃^S = G̃(Ô^S_{F^+}); c ≥ b ≥ 0 with c ≥ 1. For every λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)} there are T̃^{S,ord}-equivariant isomorphisms RΓ(T(O_{F^+,p})(b), π̃^ord(K̃^p,λ̃,m)) ≅ RΓ(T(O_{F^+,p})(b), O(w_0^G̃ λ̃) ⊗_O π̃^ord(K̃^p,m)) ≅ RΓ_{K̃(0,c)/K̃(b,c)}(X̃_{K̃(b,c)}, V_λ̃/ϖ^m)^ord, and likewise RΓ(T(O_{F^+,p})(b), π̃^ord_∂(K̃^p,λ̃,m)) ≅ RΓ(T(O_{F^+,p})(b), O(w_0^G̃ λ̃) ⊗_O π̃^ord_∂(K̃^p,m)) ≅ RΓ_{K̃(0,c)/K̃(b,c)}(∂X̃_{K̃(b,c)}, V_λ̃/ϖ^m)^ord, in D_sm(O/ϖ^m[K̃(0,c)/K̃(b,c)]).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/unitary-completed-boundary; PotentialAutomorphyInfrastructure:PA.2/derived-ordinary-comparison; PotentialAutomorphyInfrastructure:PA.2/completed-ordinary-weight-control

PotentialAutomorphyInfrastructure:PA.2/relative-bruhat-cells
DEFINITION RelativeBruhatCells
For a p-adic place v̄ of F^+: ^rW_v̄ = W(G̃_{F^+_v̄}, T_{F^+_v̄}) (≅ S_{2n}), ^rW_{P,v̄} = W(G_{F^+_v̄}, T_{F^+_v̄}) (≅ S_n × S_n), ^rW^P_v̄ ⊂ ^rW_v̄ the representatives of ^rW_{P,v̄}\^rW_v̄ attached to B_{F^+_v̄}; ^rW, ^rW_P, ^rW^P are the products over v̄ ∈ S̄_p; ^rW ⊂ W (absolute Weyl group), l_r = relative length, l = absolute length; w_0^P = w_0^G w_0^G̃, the longest element of W^P (equivalently of ^rW^P), has l(w_0^P) = [F^+:Q]n^2 (printed l_r(w_0^P) = |S_p|n^2; correct value |S̄_p|n^2); ρ = half-sum of (Res_{F^+/Q}B)_E-positive roots. ^rW is identified with permutation matrices in G̃(F_p^+) = ∏_{ṽ∈S̃_p} GL_{2n}(F_ṽ); G̃(F_p^+) = ⊔_{w∈^rW^P} P(F_p^+) w B(F_p^+) [BT65, Cor. 5.20]. For w ∈ ^rW^P: S_w = P(F_p^+) w N(F_p^+), S_w° = P(F_p^+) w N(O_{F^+,p}) ⊂ S_w; the closure of S_w is ⊔_{w'≤w} S_{w'} (Bruhat order on ^rW^P), and w' < w ⇒ l_r(w') < l_r(w). For i ≥ 0, G̃_{≥i} = ⊔_{w∈^rW^P, l_r(w)≥i} S_w is open in G̃(F_p^+), left P(F_p^+)- and right B(F_p^+)-invariant.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.1/kostant-shuffles; PotentialAutomorphyInfrastructure:PA.2/unitary-ordinary-tower; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory
API RelativeBruhatCells.cell (data)
S_w=P(F_p⁺)wN(F_p⁺), and S_w° uses N(O_{F⁺,p}).
API RelativeBruhatCells.lengths (compatibility)
Relative length sums one inversion count per p-adic place; absolute length multiplies each by its local degree.
API RelativeBruhatCells.open_union (relation)
The union of cells of relative length ≥i is open.
API RelativeBruhatCells.longest (simp)
The longest shuffle has absolute length n²[F⁺:Q] and relative length n²#S̄_p.
EXAMPLE RelativeBruhatCells.rank_one (computation)
A single split GL₂ factor has relative cell lengths 0 and 1.
EXAMPLE RelativeBruhatCells.identity_cell (degenerate)
The identity representative has both lengths zero.
EXAMPLE RelativeBruhatCells.degree_two_place (non-example)
For one p-adic place of local degree 2 and n=1, longest relative length is 1 but absolute length is 2.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.2/bruhat-cell-induction
DEFINITION BruhatCellInduction
Ind_{P(F_p^+)}^{G̃(F_p^+)}: Mod_sm(O/ϖ^m[P(F_p^+)]) → Mod_sm(O/ϖ^m[G̃(F_p^+)]) is exact and preserves injectives (right adjoint of the exact restriction). For i ≥ 0, I_{≥i}: Mod_sm(O/ϖ^m[P(F_p^+)]) → Mod_sm(O/ϖ^m[B(F_p^+)]), I_{≥i}(π) = {f: G̃_{≥i} → π locally constant, compactly supported modulo P(F_p^+), f(pg) = p f(g) for p ∈ P(F_p^+), g ∈ G̃_{≥i}} with B(F_p^+) acting by right translation; for w ∈ ^rW^P, I_w(π) is defined the same way with S_w in place of G̃_{≥i}; I_w°: Mod_sm(O/ϖ^m[P(F_p^+)]) → Mod_sm(O/ϖ^m[B(F_p^+)^+]) sends π to the subspace of I_w(π) of functions supported in S_w°.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/relative-bruhat-cells; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension; SmoothRepresentationsOfLocalGroups:SR.2
API BruhatCellInduction.section (data)
Sections are locally constant P-equivariant functions with compact support modulo P on the specified cell or open union.
API BruhatCellInduction.right_action (structure)
B acts by right translation; on the compact chart use B⁺.
API BruhatCellInduction.restriction (functoriality)
Restriction to a length-i layer induces the maps in the exact Bruhat-filtration sequence.
API BruhatCellInduction.compact_inclusion (data)
Extension by zero includes functions supported in S_w° into those on S_w.
EXAMPLE BruhatCellInduction.zero_module (degenerate)
Inducing the zero coefficient module gives zero in each chart.
EXAMPLE BruhatCellInduction.outside_support (computation)
The extension-by-zero compact-chart section evaluates to zero outside S_w°.
EXAMPLE BruhatCellInduction.equivariance (non-example)
A locally constant function violating f(pg)=p f(g) is not a section, even if its support is compact modulo P.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.2/bruhat-filtration
THEOREM TauCeti.PotentialAutomorphy.bruhat_filtration
(1) I_{≥0} = Res^{G̃(F_p^+)}_{B(F_p^+)} ∘ Ind^{G̃(F_p^+)}_{P(F_p^+)}. (2) Each of I_{≥i}, I_w, I_w° is exact. (3) For every i ≥ 0 and π ∈ Mod_sm(O/ϖ^m[P(F_p^+)]) there is a functorial exact sequence 0 → I_{≥i+1}(π) → I_{≥i}(π) → ⊕_{w∈^rW^P, l_r(w)=i} I_w(π) → 0. Hence for π ∈ D_sm(O/ϖ^m[P(F_p^+)]) there is a functorial distinguished triangle I_{≥i+1}(π) → I_{≥i}(π) → ⊕_{l_r(w)=i} I_w(π) → I_{≥i+1}(π)[1] (5.3.2) in D_sm(O/ϖ^m[B(F_p^+)]).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/bruhat-cell-induction

PotentialAutomorphyInfrastructure:PA.2/bruhat-invariant-filtration
THEOREM TauCeti.PotentialAutomorphy.bruhat_invariant_filtration
Let π ∈ D_sm(O/ϖ^m[P(F_p^+)]) be bounded below, b ≥ 0 and λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}. For every i ≥ 0 and j ∈ Z the sequence 0 → R^jΓ(B(O_{F^+,p})(b), O(w_0^G̃ λ̃) ⊗_O I_{≥i+1}(π)) → R^jΓ(B(O_{F^+,p})(b), O(w_0^G̃ λ̃) ⊗_O I_{≥i}(π)) → R^jΓ(B(O_{F^+,p})(b), ⊕_{w∈^rW^P, l_r(w)=i} O(w_0^G̃ λ̃) ⊗_O I_w(π)) → 0 in Mod(O/ϖ^m[T(F_p^+)^+_b]) associated with (5.3.2) is (short) exact.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/bruhat-filtration

PotentialAutomorphyInfrastructure:PA.2/bruhat-unipotent-acyclicity
THEOREM TauCeti.PotentialAutomorphy.bruhat_unipotent_acyclicity
For w ∈ ^rW^P, the functor I_w° takes injective objects of Mod_sm(O/ϖ^m[P(F_p^+)]) to Γ(N(O_{F^+,p}),−)-acyclic objects.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/bruhat-cell-induction; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension

PotentialAutomorphyInfrastructure:PA.2/ordinary-compact-cell-comparison
THEOREM TauCeti.PotentialAutomorphy.ordinary_compact_cell_comparison
For w ∈ ^rW^P and π ∈ D_sm(O/ϖ^m[P(F_p^+)]) bounded below there is a natural isomorphism ord RΓ(N(O_{F^+,p}), I_w°(π)) ≅ ord RΓ(N(O_{F^+,p}), I_w(π)); equivalently ord RΓ(N(O_{F^+,p}), J_w(π)) = 0 for J_w = I_w/I_w°.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/bruhat-cell-induction; PotentialAutomorphyInfrastructure:PA.2/local-ordinary-parts

PotentialAutomorphyInfrastructure:PA.2/bruhat-unipotent-invariants
DEFINITION BruhatUnipotentInvariants
For w ∈ ^rW^P, N_w := P(F_p^+) ∩ w N(O_{F^+,p}) w^{-1}, a compact subgroup of P(F_p^+) containing N_n(O_{F,p}). Γ(N_w,−): Mod_sm(O/ϖ^m[P(F_p^+)]) → Mod_sm(O/ϖ^m[T(F_p^+)^+]), with t ∈ T(F_p^+)^+ acting by t·v = tr_{t^w N_w (t^w)^{-1} / N_w}(t^w v), where t^w = w t w^{-1} (this makes sense since t^w N_w (t^w)^{-1} = P(F_p^+) ∩ w t N(O_{F^+,p}) t^{-1} w^{-1} ⊂ N_w); moreover w T(F_p^+)^+ w^{-1} ⊂ T_n(F_p)^+.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/relative-bruhat-cells; PotentialAutomorphyInfrastructure:PA.2/positive-torus-monoid
API BruhatUnipotentInvariants.subgroup (data)
N_w=P∩wN(O)w^{-1}.
API BruhatUnipotentInvariants.transfer (data)
For t the transfer uses t^w=wtw^{-1} and the finite-index subgroup t^wN_w(t^w)^{-1}.
API BruhatUnipotentInvariants.evaluation (compatibility)
Evaluation at w identifies the derived compact-cell N-invariants with RΓ(N_w,π).
API BruhatUnipotentInvariants.map (functoriality)
A smooth P-map induces the corresponding invariant and derived invariant maps.
EXAMPLE BruhatUnipotentInvariants.zero (degenerate)
The invariant functor sends the zero module to zero.
EXAMPLE BruhatUnipotentInvariants.identity_w (computation)
For w=1 the subgroup is P∩N(O).
EXAMPLE BruhatUnipotentInvariants.index_p_transfer (non-example)
On a trivial F_p-module a transfer over index p is zero, not the naive identity torus action.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.2/bruhat-evaluation-comparison
THEOREM TauCeti.PotentialAutomorphy.bruhat_evaluation_comparison
For w ∈ ^rW^P and π ∈ D_sm(O/ϖ^m[P(F_p^+)]) bounded below there is a natural isomorphism RΓ(N(O_{F^+,p}), I_w°(π)) ≅ RΓ(N_w, π) (compatible with the T(F_p^+)^+-actions), induced by f ↦ f(w).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/bruhat-unipotent-invariants; PotentialAutomorphyInfrastructure:PA.2/bruhat-unipotent-acyclicity

PotentialAutomorphyInfrastructure:PA.2/bruhat-orientation-character
DEFINITION BruhatOrientationCharacter
For w ∈ ^rW^P, χ_w: T(F_p^+) → O^× is χ_w(t) = N_{F_p^+/Q_p} det_{F_p^+}(Ad(t^w)|_{Lie U(F_p^+) ∩ w N(F_p^+) w^{-1}})^{-1} / |N_{F_p^+/Q_p} det_{F_p^+}(Ad(t^w)|_{Lie U(F_p^+) ∩ w N(F_p^+) w^{-1}})|_p. There is an isomorphism O(χ_w) ≅ O(−ρ + w^{-1} w_0^P(ρ)) ⊗_O O(α_w) of O[T(F_p^+)]-modules, where w_0^P = w_0^G w_0^G̃ is the longest element of ^rW^P and α_w: T(F_p^+) → O^× is trivial on T(O_{F^+,p}) and agrees with χ_w on every ι_v^{-1}(diag(ϖ_v^{a_1},…,ϖ_v^{a_{2n}})) (a_i ∈ Z). τ_w: Mod_sm(O/ϖ^m[T_n(F_p)]) → Mod_sm(O/ϖ^m[T_n(F_p)]) sends π to π with t acting as π(t^{w^{-1}}).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/relative-bruhat-cells; PotentialAutomorphyInfrastructure:PA.2/lowest-weight-character
API BruhatOrientationCharacter.formula (characterisation)
For a(t)=N det Ad(t^w) on the indicated unipotent Lie space, χ_w(t)=a(t)^{-1}/|a(t)|_p.
API BruhatOrientationCharacter.unit_part (compatibility)
Its algebraic character is −ρ+w^{-1}w₀^Pρ; α_w is the residual unramified character.
API BruhatOrientationCharacter.uniformizer_part (simp)
α_w is trivial on units and agrees with χ_w on chosen diagonal uniformizer powers.
API BruhatOrientationCharacter.twist (functoriality)
τ_w precomposes the torus action with t↦t^{w^{-1}}.
EXAMPLE BruhatOrientationCharacter.zero_lie (degenerate)
For a zero-dimensional unipotent Lie space, χ_w=1.
EXAMPLE BruhatOrientationCharacter.one_unit (computation)
For a one-dimensional rational root with Ad scalar u∈Z_p×, χ_w(u)=u^{-1}.
EXAMPLE BruhatOrientationCharacter.one_uniformizer (computation)
For the same rational root with scalar p, χ_w(p)=1 because the p-adic norm factor cancels p^{-1}.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.2/ordinary-unipotent-degree-shift
THEOREM TauCeti.PotentialAutomorphy.ordinary_unipotent_degree_shift
Let w ∈ ^rW^P and π ∈ D_sm(O/ϖ^m[G(F_p^+)]) bounded below. There is a natural isomorphism in D_sm(O/ϖ^m[T_n(F_p)]) ord RΓ(N_w, Inf_{G(F_p^+)}^{P(F_p^+)} π) ≅ O/ϖ^m(χ_w) ⊗_{O/ϖ^m} τ_w^{-1} ord RΓ(N_n(O_{F,p}), π)[−[F^+:Q]n^2 + l(w)].
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/bruhat-unipotent-invariants; PotentialAutomorphyInfrastructure:PA.2/bruhat-evaluation-comparison; PotentialAutomorphyInfrastructure:PA.2/bruhat-orientation-character; PotentialAutomorphyInfrastructure:PA.0/unipotent-exterior-cohomology

PotentialAutomorphyInfrastructure:PA.2/ordinary-bruhat-piece
THEOREM TauCeti.PotentialAutomorphy.ordinary_bruhat_piece
Let w ∈ ^rW^P and π ∈ D_sm(O/ϖ^m[G(F_p^+)]) bounded below. There is a natural isomorphism in D_sm(O/ϖ^m[T_n(F_p)]) ord RΓ(N(O_{F^+,p}), I_w(Inf_{G(F_p^+)}^{P(F_p^+)} π)) ≅ O/ϖ^m(χ_w) ⊗_{O/ϖ^m} τ_{w^{-1}} ord RΓ(N_n(O_{F,p}), π)[−[F^+:Q]n^2 + l(w)] (τ_{w^{-1}} = τ_w^{-1}).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/ordinary-compact-cell-comparison; PotentialAutomorphyInfrastructure:PA.2/bruhat-evaluation-comparison; PotentialAutomorphyInfrastructure:PA.2/ordinary-unipotent-degree-shift

PotentialAutomorphyInfrastructure:PA.2/completed-boundary-induction-retract
THEOREM TauCeti.PotentialAutomorphy.completed_boundary_induction_retract
Let K̃ ⊂ G̃(A^∞_{F^+}) be a good subgroup decomposed with respect to P (K = K̃ ∩ G(A^∞_{F^+})); let 𝔪 ⊂ T^S be a non-Eisenstein maximal ideal and 𝔪̃ = S^*(𝔪) ⊂ T̃^S. Then Ind_{P(F_p^+)}^{G̃(F_p^+)} (Inf_{G(F_p^+)}^{P(F_p^+)} π(K^p,m)_𝔪) is a T̃^S-equivariant direct summand (T̃^S acting through S) of π̃_∂(K̃^p,m)_{𝔪̃} in D_sm(O/ϖ^m[G̃(F_p^+)]).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/unitary-completed-boundary; PotentialAutomorphyInfrastructure:PA.0/siegel-coefficient-retract; PotentialAutomorphyInfrastructure:PA.2/completed-arithmetic-cohomology; SmoothRepresentationsOfLocalGroups:SR.2

PotentialAutomorphyInfrastructure:PA.2/ordinary-boundary-degree-shifting
THEOREM TauCeti.PotentialAutomorphy.ordinary_boundary_degree_shifting
Let K̃ be good, decomposed with respect to P, with K̃_v̄ = Ĩw_v̄ for v̄ ∈ S̄_p (printed Iw_v̄). Let λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}, w ∈ ^rW^P, λ_w = w(λ̃+ρ) − ρ ∈ (Z^n_+)^{Hom(F,E)}; 𝔪 ⊂ T^S non-Eisenstein, 𝔪̃ = S^*(𝔪); c ≥ b ≥ 0 with c ≥ 1. Then for every j ∈ Z, S descends to a homomorphism, surjective onto the image of T̃^{S,ord} acting through S (printed: 'a surjective homomorphism' onto the whole algebra, which the proof does not establish), T̃^{S,ord}(H^j(∂X̃_{K̃(b,c)}, V_λ̃)^ord_{𝔪̃}) → T^{S,ord}(O(α_{w_0^G w w_0^G̃}) ⊗_O τ^{-1}_{w_0^G w w_0^G̃} H^{j−l(w)}(X_{K(b,c)}, V_{λ_w})^ord_𝔪).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/ordinary-bruhat-piece; PotentialAutomorphyInfrastructure:PA.2/completed-boundary-induction-retract; PotentialAutomorphyInfrastructure:PA.2/unitary-ordinary-control

PotentialAutomorphyInfrastructure:PA.2/ordinary-ctg-weight-choice
THEOREM TauCeti.PotentialAutomorphy.ordinary_ctg_weight_choice
Notation: for λ ∈ (Z^n_+)^{Hom(F,E)} and a ∈ Z, λ(a)_{τ,i} = λ_{τ,i} + a. Assume n ≥ 2 (the statement is printed for n ≥ 1 and fails for n = 1). Fix m ≥ 1. There is λ ∈ (Z^n_+)^{Hom(F,E)} such that (1) O(λ)/ϖ^m ≅ O/ϖ^m as T_n(F_p)-modules; (2) Σ_{i=1}^n (λ_{τ,i} + λ_{τc,i}) is independent of τ ∈ Hom(F,E); (3) for each i = 0,…,n^2 there are w_i = (w_{i,v̄})_{v̄∈S̄_p} ∈ ^rW^P, a_i ∈ (p−1)Z and a dominant λ̃_i ∈ (Z^{2n}_+)^{Hom(F^+,E)} with (a) λ̃_i CTG (Definition 4.3.5); (b) l_r(w_{i,v̄}) = n^2 − i for every v̄ ∈ S̄_p, hence l(w_i) = [F^+:Q](n^2 − i); (c) w_i(λ̃_i + ρ) − ρ = λ(a_i). Construction: M > 16n divisible by 8(p−1)·#(O/ϖ^m)^×; λ_τ = (−nM, −2nM, …, −n^2M) if τ ∈ Ĩ_p and (0, −M, …, (1−n)M) if τc ∈ Ĩ_p, so λ̃(a) = ((n−1)M − a, …, −a, −nM + a, …, −n^2M + a); for i > 0, w_{i,v̄} = σ_{X_i}, X_i = {x+1,…,x+r, x+r+2,…,x+n+1} with nx + n − r = n^2 − i, 1 ≤ r ≤ n; a_i = the unique integer in [(nx+2n−r−1)M/2, (nx+2n−r)M/2] congruent to M/8 mod M/2; λ̃_i = w_i^{-1}(λ̃(a_i) + ρ) − ρ. At i = 0 take the block-exchange shuffle (n+1, …, 2n, 1, …, n), with x = r = n; omit the nonexistent entry n+x+1 in the printed expanded tuple. Its dominance check uses only the actual boundary between the two nonempty blocks, not all four displayed inequalities.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.1/kostant-shuffles; PotentialAutomorphyInfrastructure:PA.1/ctg-weight; PotentialAutomorphyInfrastructure:PA.2/lowest-weight-character
Recorded gap: Single integral highest-weight owner RG2.6 requires atlas creation

PotentialAutomorphyInfrastructure:PA.2/ordinary-middle-degree-quotient
THEOREM TauCeti.PotentialAutomorphy.ordinary_middle_degree_quotient
Suppose [F^+:Q] > 1 and n ≥ 2 (printed without n ≥ 2), and fix m ≥ 1. There exist a dominant λ ∈ (Z^n_+)^{Hom(F,E)} on whose V_λ a finite-index subgroup of O_F^× acts trivially and, for each i = 0,…,n^2−1, a CTG dominant weight λ̃_i ∈ (Z^{2n}_+)^{Hom(F^+,E)}, an integer a_i divisible by p−1 and w_i ∈ ^rW^P, such that for every good K̃ ⊂ G̃(A^∞_{F^+}) decomposed with respect to P with K̃_v̄ = Ĩw_v̄ (v̄ ∈ S̄_p), all integers c ≥ b ≥ 0 with c ≥ 1, and every non-Eisenstein 𝔪 ⊂ T^S with ρ̄_{𝔪̃} decomposed generic (𝔪̃ = S^*(𝔪)): (1) O(λ)/ϖ^m ≅ O/ϖ^m as O[T(F_p^+)]-modules; (2) for each i = 0,…,n^2−1, S descends to an algebra homomorphism T̃^{S,ord}(H^d(X̃_{K̃(b,c)}, V_{λ̃_i})^ord_{𝔪̃}) → T^{S,ord}(O(α_{w_i}) ⊗_O τ_{w_i}^{-1} H^{i[F^+:Q]}(X_{K(b,c)}, V_{λ(a_i)})^ord_𝔪), where d = [F^+:Q]n^2.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/ordinary-boundary-degree-shifting; PotentialAutomorphyInfrastructure:PA.2/ordinary-ctg-weight-choice; IgusaVarietiesAndTorsionConcentration:IG.7

PotentialAutomorphyInfrastructure:PA.2/determinant-torus
DEFINITION DeterminantTorus
For K ⊂ GL_n(A_F^∞) good, A_K := F^×\A_F^×/det(K) det(K_∞) R_{>0}. The quotient map A_K → F^×\A_F^×/det(K) F_∞^× identifies A_K with an extension of a ray class group by a real torus of dimension [F^+:Q] − 1 with cocharacter lattice F^× ∩ det(K) (a torsion-free congruence subgroup of O_F^×). A_K° is the identity component. For g ∈ GL_n(A_F^∞), Γ_{g,K} = GL_n(F) ∩ gKg^{-1} (written Γ_g). One has dim X_K = d − 1 = [F^+:Q]n^2 − 1 and dim A_K = [F^+:Q] − 1.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.0/integral-model-comparison
API DeterminantTorus.quotient (data)
The quotient is F×\A_F×/(det K·det K∞·R_{>0}).
API DeterminantTorus.component (data)
The identity component A_K° is the real torus of dimension [F⁺:Q]−1.
API DeterminantTorus.determinant_map (compatibility)
Determinant X_K→A_K induces the ray-class identification of connected components.
API DeterminantTorus.level_change (functoriality)
Inclusion K′⊂K induces the quotient map A_{K′}→A_K and commutes with determinant.
EXAMPLE DeterminantTorus.imaginary_quadratic (computation)
For [F⁺:Q]=1 the identity component has dimension zero.
EXAMPLE DeterminantTorus.degree_two (computation)
For [F⁺:Q]=2 the identity component has dimension one.
EXAMPLE DeterminantTorus.not_whole_class_group (non-example)
For [F⁺:Q]>1 the quotient has a positive-dimensional torus; replacing it by the finite ray-class group loses that component.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.2/determinant-component-product
THEOREM TauCeti.PotentialAutomorphy.determinant_component_product
(2) det: X_K → A_K is continuous and induces a bijection on sets of connected components (equivalently det: G(F^+)\G(A^∞_{F^+})/K → F^×\(A_F^∞)^×/det(K) is bijective, by strong approximation for Res_{F/F^+} SL_n). (3) If g ∈ GL_n(A_F^∞) satisfies det(Γ_g) = det(F^× ∩ K) and Γ_g^1 = SL_n(F) ∩ Γ_g, then the product map Γ_g^1 × (F^× ∩ K) → Γ_g is a group isomorphism; writing X = X^1 × (∏_{v|∞} R_{>0})/R_{>0} with X^1 = SL_n(F_∞)/∏_{v|∞} SU(n), one gets Γ_g\X = (Γ_g^1\X^1) × (F^× ∩ K)\(∏_{v|∞} R_{>0})/R_{>0}. (4) Under the same hypothesis det: F^× ∩ K → F^× ∩ det(K) is an isomorphism, the composite Γ_g\X ↪ X_K → A_K is (x,z) ↦ det(g) z^n, and z ↦ det(g) z^n is an isomorphism from (F^× ∩ K)\(∏_{v|∞} R_{>0})/R_{>0} onto the connected component A_K^{[det(g)]} of A_K containing [det(g)]. (K is neat.)
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/determinant-torus; ArithmeticLocallySymmetricSpaces:ALS.4; ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality

PotentialAutomorphyInfrastructure:PA.2/determinant-neat-level-shrinking
THEOREM TauCeti.PotentialAutomorphy.determinant_neat_level_shrinking
Let K be a good subgroup of G(A^∞_{F^+}) = GL_n(A_F^∞) and T a finite set of finite places of F. There is a good normal subgroup K' ⊂ K with K'_T = K_T such that det(Γ_{g,K'}) = det(F^× ∩ K') for all g ∈ GL_n(A_F^∞). Construction: an ideal 𝔞 of O_F prime to T with ker(O_F^× → (O_F/𝔞)^×) torsion-free and contained in F^× ∩ K (Chevalley [Che51, Th. 1]); an ideal 𝔟 prime to 𝔞 and T with ker(O_F^× → (O_F/𝔞𝔟)^×) ⊂ (ker(O_F^× → (O_F/𝔞)^×))^n; K' = ker(O_F^× → (O_F/𝔞)^×)·K(𝔞𝔟), K(𝔞𝔟) = K ∩ (principal congruence subgroup of level 𝔞𝔟).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/determinant-torus

PotentialAutomorphyInfrastructure:PA.2/central-torus-cohomology-shifting
THEOREM TauCeti.PotentialAutomorphy.central_torus_cohomology_shifting
Let K = K(b, c) ⊂ GL_n(A_F^∞) be good with K_v = Iw_v(b, c) for v | p (needed for T^{S,ord} to act; the statement omits it) and λ ∈ (Z^n_+)^{Hom(F,E)}, and suppose (1) det(Γ_g) = det(F^× ∩ K) for all g ∈ GL_n(A_F^∞) and (2) F^× ∩ K acts trivially on V_λ. Then R det_*(V_λ) is constant on each connected component of A_K and R det_*(V_λ) = ⊕_{i=0}^{dim X^1} R^i det_*(V_λ)[−i]; there is a T^{S,ord}-equivariant isomorphism of graded O-modules ⊕_{i=0}^{dim X_K} H^i(X_K, V_λ) ≅ (⊕_{j=0}^{dim A_K°} H^j(A_K°, O)) ⊗_O (⊕_{k=0}^{dim X^1} H^0(A_K, R^k det_*(V_λ))) (5.4.17), with trivial Hecke action on the first factor. Consequently the image of T^{S,ord} in End_O(⊕_{i=0}^{dim X_K} H^i(X_K, V_λ)) equals its image in End_O(⊕_{i=0}^{n^2−1} H^{i[F^+:Q]}(X_K, V_λ)).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/determinant-component-product; PotentialAutomorphyInfrastructure:PA.2/determinant-neat-level-shrinking; PotentialAutomorphyInfrastructure:PA.2/arithmetic-ordinary-summand; ArithmeticLocallySymmetricSpaces:ALS.4; ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality

PotentialAutomorphyInfrastructure:PA.2/all-degree-ordinary-characteristic-data
THEOREM TauCeti.PotentialAutomorphy.all_degree_ordinary_characteristic_data
Suppose [F^+:Q] > 1. Let K ⊂ GL_n(A_F^∞) be good with K_v = Iw_v for v ∈ S_p; c ≥ b ≥ 0 with c ≥ 1; m ≥ 1; 𝔪 ⊂ T^S non-Eisenstein, 𝔪̃ = S^*(𝔪). Suppose (1) ρ̄_𝔪 is decomposed generic; (2) for every finite v ∉ S with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic F_0 ⊂ F. Then there are λ ∈ (Z^n_+)^{Hom(F,E)} and N ≥ 1 depending only on [F^+:Q] and n such that (1) O(λ)/ϖ^m ≅ O/ϖ^m as O[T(F_p^+)]-modules; (2) for each i = 0,…,d−1 there are a nilpotent ideal J_i ⊂ T^{S,ord}(H^i(X_{K(b,c)}, V_λ)^ord_𝔪) with J_i^N = 0 and a continuous ρ_𝔪: G_{F,S} → GL_n(T^{S,ord}(H^i(X_{K(b,c)}, V_λ)^ord_𝔪)/J_i) with (a) det(X − ρ_𝔪(Frob_v)) = image of P_v(X) for v ∉ S; (b) for v | p and g ∈ G_{F_v}, det(X − ρ_𝔪(g)) = ∏_{j=1}^n (X − χ_{λ,v,j}(g)); (c) for v | p and g_1,…,g_n ∈ G_{F_v}, ρ_𝔪 maps (g_1 − χ_{λ,v,1}(g_1))⋯(g_n − χ_{λ,v,n}(g_n)) to 0 in M_n(…/J_i).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/ordinary-middle-degree-quotient; PotentialAutomorphyInfrastructure:PA.2/central-torus-cohomology-shifting; PotentialAutomorphyInfrastructure:PA.2/ordinary-galois-characters; mathlib:Matrix.charpoly; PotentialAutomorphyInfrastructurePartII:PL.0
Recorded gap: Ordinary Satake-image polynomial-law transfer

PotentialAutomorphyInfrastructure:PA.2/ordinary-automorphic-galois-flag
THEOREM TauCeti.PotentialAutomorphy.ordinary_automorphic_galois_flag
Let F be an imaginary CM field (the §5 standing hypotheses are dropped), ι: Q̄_p ≅ C, and π a cuspidal automorphic representation of GL_n(A_F), regular algebraic of weight ιλ with λ ∈ (Z^n_+)^{Hom(F,Q̄_p)}. Suppose (1) π is ι-ordinary at every v ∈ S_p ([Ger19, Def. 5.3]); (2) r̄_ι(π) is decomposed generic and irreducible. Then for every v ∈ S_p, r_ι(π)|_{G_{F_v}} is ordinary of weight λ ([Ger19, §5.2]): r_ι(π)|_{G_{F_v}} is conjugate to an upper-triangular representation with diagonal characters ψ_{v,1},…,ψ_{v,n}, where ψ_{v,i}(Art_{F_v}(u)) = ε^{1−i}(Art_{F_v}(u)) ∏_{τ∈Hom_{Q_p}(F_v,Q̄_p)} τ(u)^{−(w_0^G λ)_{τ,i}} ⟨u⟩_{ι,i} (u ∈ O_{F_v}^×) and ψ_{v,i}(Art_{F_v}(ϖ_v)) = ε^{1−i}(Art_{F_v}(ϖ_v)) u^{(i)}_{λ,ϖ_v}/u^{(i−1)}_{λ,ϖ_v}, with ⟨u⟩_{ι,i}, u^{(i)}_{λ,ϖ_v} the Hecke eigenvalues on (ι^{-1}π_v)^ord of [Ger19, Def. 5.5].
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/ordinary-local-global; PotentialAutomorphyInfrastructure:PA.5/residual-lifting-hypothesis-restriction; mathlib:Matrix.charpoly; LocalGaloisDeformationRings:L7; PotentialAutomorphyInfrastructurePartII:PL.0; PotentialAutomorphyInfrastructure:PA.5/genericity-normal-closure-restriction
Recorded gap: Geraghty primary-source normalization check

PotentialAutomorphyInfrastructure:PA.3/fontaine-laffaille-deformation-hecke-map
THEOREM TauCeti.PotentialAutomorphy.fontaine_laffaille_deformation_hecke_map
Under §6.5.1, for each χ as above there are an integer δ ≥ 1 depending only on n and [F:ℚ], an ideal J ⊂ T^S(RΓ(X_K, 𝒱_λ(χ^{-1})))_𝔪 with J^δ = 0, and a continuous surjection f_{𝒮_χ}: R_{𝒮_χ} → T^S(RΓ(X_K, 𝒱_λ(χ^{-1})))_𝔪/J such that for every finite place v ∉ S the characteristic polynomial of f_{𝒮_χ} ∘ ρ_{𝒮_χ}(Frob_v) is the image of P_v(X). (Proof: the representation ρ_𝔪: G_{F,S∪S^c} → GL_n(T^S(…)_𝔪/J) of Theorem 2.3.7, conjugated so that ρ_𝔪 mod 𝔪 = ρ̄_𝔪; Theorem 4.5.1 gives the Fontaine–Laffaille condition at v | p; Theorem 3.1.1, applied with its S equal to S ∪ S^c and its R equal to S − S_p, gives the inertial characteristic-polynomial condition at v ∈ R and unramifiedness with the right Frobenius polynomial at v ∈ S^c − S.)
Hypothesis: FL-good-level: every one of the seventeen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.1/fontaine-laffaille-local-global; PotentialAutomorphyInfrastructure:PA.3/local-condition-mod-varpi-comparison; AutomorphicGaloisRepresentationsPartII:AG2.5; GlobalGaloisDeformations:G8

PotentialAutomorphyInfrastructure:PA.3/ordinary-deformation-hecke-map
THEOREM TauCeti.PotentialAutomorphy.ordinary_deformation_hecke_map
Let T^{S,Λ_1} = T^S ⊗_𝒪 Λ_1 ⊂ T^{S,ord}. There are δ ≥ 1 depending only on n and [F:ℚ], an ideal J ⊂ T^{S,Λ_1}(A(μ,χ)_𝔪 ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1}) with J^δ = 0, and a continuous surjective Λ-algebra homomorphism f_{𝒮_χ}: R_{𝒮_χ} → T^{S,Λ_1}(A(μ,χ)_𝔪 ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1})/J such that for every finite v ∉ S the characteristic polynomial of f_{𝒮_χ} ∘ ρ_{𝒮_χ}(Frob_v) is the image of P_v(X). (Proof: build compatible maps R_{𝒮_χ} → T^{S,ord}(RΓ(X_{K(c,c)}, 𝒱_μ(χ^{-1}))^{ord})_𝔪/J_c as in Prop. 6.5.3 with Theorem 5.5.1 in place of Theorem 4.5.1 (using the description of 𝒟^{det,ord} in §6.2.6); Carayol's lemma [CHT08, Lem. 2.1.10] puts the image in a nilpotent quotient of T^{S,Λ_1}(…); the Hecke algebras agree by transpose and twist; pass to the limit in c as in the proof of Theorem 4.5.1.)
Hypothesis: ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/ordinary-local-global; PotentialAutomorphyInfrastructure:PA.4/ordinary-hida-complex; PotentialAutomorphyInfrastructure:PA.3/local-condition-mod-varpi-comparison; AutomorphicGaloisRepresentationsPartII:AG2.5; LocalGaloisDeformationRings:L8; GlobalGaloisDeformations:G8

PotentialAutomorphyInfrastructure:PA.4/patched-arithmetic-mod-varpi-comparison
THEOREM TauCeti.PotentialAutomorphy.patched_arithmetic_mod_varpi_comparison
(1) The quasi-isomorphisms 𝒞_N/ϖ ≅ 𝒞′_N/ϖ induce a quasi-isomorphism 𝒞_∞/ϖ ≅ 𝒞′_∞/ϖ. (2) Via this identification T_∞ and T′_∞ have the same image T̄_∞ in the endomorphism algebras of 𝒞_∞/ϖ and 𝒞′_∞/ϖ (in D(S_∞/ϖ), as established by the proof; the printed statement in D(S_∞) is also valid by restriction of scalars). (3) With Ī_∞, Ī′_∞ the images of I_∞, I′_∞ in T̄_∞, the actions of R_∞/ϖ ≅ R′_∞/ϖ (through T_∞ and T′_∞) on H^*(𝒞_∞/ϖ)/(Ī_∞ + Ī′_∞) and H^*(𝒞′_∞/ϖ)/(Ī_∞ + Ī′_∞) are identified via 𝒞_∞/ϖ ≅ 𝒞′_∞/ϖ.
Hypothesis: One of the two arithmetic towers satisfies every imported P8 datum condition; the branch-specific verification is respectively PA.4/fontaine-laffaille-patching-verification or PA.4/ordinary-patching-verification.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.3/local-condition-mod-varpi-comparison; mathlib:DerivedCategory; DeformationAndDerivedPatchingAlgebra:P8

PotentialAutomorphyInfrastructure:PA.4/taylor-wiles-arithmetic-levels
DEFINITION TaylorWilesArithmeticLevels
Let (Q, (α_{v,1},…,α_{v,n})_{v∈Q}) be a Taylor–Wiles datum for 𝒮_1 (§6.2.28) such that for each v ∈ Q the residue characteristic l_v splits in an imaginary quadratic subfield of F. It is a Taylor–Wiles datum for every 𝒮_χ, and R_{𝒮_{χ,Q}} is an 𝒪[Δ_Q]-algebra, Δ_Q = ∏_{v∈Q} Δ_v = ∏_{v∈Q} k(v)^×(p)^n. Good subgroups K_1(Q) ⊂ K_0(Q) ⊂ K: K_1(Q)_v = K_0(Q)_v = K_v for v ∉ Q (printed: v ∉ S ∪ Q); for v ∈ Q, K_0(Q)_v = Iw_v and K_1(Q)_v is the maximal pro-prime-to-p subgroup of Iw_v. Then K_0(Q)/K_1(Q) ≅ Δ_Q, and (6.5.6) there are surjective T^{S∪Q}-algebra maps _{K_0(Q)/K_1(Q)}T^{S∪Q}(K_0(Q)/K_1(Q), 𝒱) → T^{S∪Q}(K_0(Q), 𝒱) → T^{S∪Q}(K, 𝒱) (𝒱 = 𝒱_λ(χ^{-1})): the first from K_0(Q)-invariants (𝒪[Δ_Q] acting trivially on invariants), the second t ↦ [K:K_0(Q)]^{-1} π_{Q,*} ∘ t ∘ π_Q^* for the projection π_Q: X_{K_0(Q)} → X_K, where [K:K_0(Q)] ≡ (n!)^{|Q|} mod p is a unit since p > n. T^{S∪Q}_Q(K_0(Q), 𝒱) ⊂ End_{D(𝒪)}(RΓ(X_{K_0(Q)}, 𝒱)) is the commutative T^{S∪Q}(K_0(Q),𝒱)-subalgebra generated by the U_{v,i} (v ∈ Q, 1 ≤ i ≤ n), equivalently the image of T^{S∪Q}_Q (§3.1); T^{S∪Q}_Q(K_0(Q)/K_1(Q), 𝒱) ⊂ End_{D(𝒪[Δ_Q])}(RΓ_{K_0(Q)/K_1(Q)}(X_{K_1(Q)}, 𝒱)) likewise (an 𝒪[Δ_Q]-algebra). (6.5.7): the first map of (6.5.6) extends to a surjection T^{S∪Q}_Q(K_0(Q)/K_1(Q), 𝒱) → T^{S∪Q}_Q(K_0(Q), 𝒱) sending U_{v,i} to U_{v,i}.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.0/integral-model-comparison; GlobalGaloisDeformations:G7/taylor-wiles-local-diamond; GlobalGaloisDeformations:G7/enormous-taylor-wiles-primes; GlobalGaloisDeformations:G7/enormous-taylor-wiles-presentation; GlobalGaloisDeformations:G7
API TaylorWilesArithmeticLevels.away (simp)
Both auxiliary levels equal K_v at every v∉Q, including v∈S.
API TaylorWilesArithmeticLevels.at_auxiliary (data)
At v∈Q use Iw_v and its maximal pro-prime-to-p subgroup.
API TaylorWilesArithmeticLevels.diamond_quotient (compatibility)
The quotient K₀(Q)/K₁(Q) is the imported Δ_Q.
API TaylorWilesArithmeticLevels.trace_scalar (relation)
Pullback followed by trace has scalar [K:K₀(Q)]≡(n!)^{#Q} mod p.
EXAMPLE TaylorWilesArithmeticLevels.empty (degenerate)
For Q=∅ both levels equal K and the diamond group is trivial.
EXAMPLE TaylorWilesArithmeticLevels.single_prime (computation)
For Q={v}, n=2 and p>2 the trace scalar is 2 modulo p, hence a unit.
EXAMPLE TaylorWilesArithmeticLevels.old_bad_place (non-example)
At v∈S outside Q the original local factor must be retained; leaving it unspecified does not define a level.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.4/taylor-wiles-selected-ideals
DEFINITION TaylorWilesSelectedIdeals
With 𝒱 = 𝒱_λ(χ^{-1}): 𝔪^Q ⊂ T^{S∪Q}(K, 𝒱) is the pullback of 𝔪 under T^{S∪Q}(K,𝒱) ⊂ T^S(K,𝒱); 𝔪_0^Q ⊂ T^{S∪Q}(K_0(Q),𝒱) is the pullback of 𝔪^Q and 𝔪_1^Q ⊂ _{K_0(Q)/K_1(Q)}T^{S∪Q}(K_0(Q)/K_1(Q),𝒱) the pullback of 𝔪_0^Q under the maps (6.5.6); 𝔫_0^Q ⊂ T^{S∪Q}_Q(K_0(Q),𝒱) is the ideal generated by 𝔪_0^Q and the elements U_{v,i} − q_v^{i(1−i)/2} α_{v,1}⋯α_{v,i} (v ∈ Q, 1 ≤ i ≤ n); 𝔫_1^Q ⊂ T^{S∪Q}_Q(K_0(Q)/K_1(Q),𝒱) is the preimage of 𝔫_0^Q under (6.5.7).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/taylor-wiles-arithmetic-levels
API TaylorWilesSelectedIdeals.unramified_contraction (data)
m^Q is the contraction of m to the away-from-S∪Q Hecke image.
API TaylorWilesSelectedIdeals.selected_generator (simp)
n₀^Q adds U_{v,i}−q_v^{i(1−i)/2}∏_{j≤i}α_{v,j}.
API TaylorWilesSelectedIdeals.diamond_pullback (functoriality)
n₁^Q is the preimage of n₀^Q under the auxiliary diamond-forgetting Hecke map.
API TaylorWilesSelectedIdeals.ordering (relation)
The chosen ordering of residual eigenvalues fixes the selected Iwahori constituent.
EXAMPLE TaylorWilesSelectedIdeals.empty (degenerate)
For Q=∅ the selected ideal is just the original localized maximal ideal.
EXAMPLE TaylorWilesSelectedIdeals.rank_two_second (computation)
For n=2 the i=2 generator is U_{v,2}−q_v^{-1}α_{v,1}α_{v,2}.
EXAMPLE TaylorWilesSelectedIdeals.order_sensitive (non-example)
For distinct α₁,α₂, interchanging them changes the i=1 generator U_{v,1}−α₁.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.4/selected-ideal-properness
THEOREM TauCeti.PotentialAutomorphy.selected_ideal_properness
Each of 𝔪^Q, 𝔪_0^Q, 𝔪_1^Q, 𝔫_0^Q, 𝔫_1^Q is a (proper) maximal ideal. The content is that 𝔫_0^Q is proper, i.e. H^*(X_{K_0(Q)}, 𝒱_λ(χ^{-1})/ϖ)[𝔪_0^Q] contains a nonzero vector on which every U_{v,i} (v ∈ Q) acts by α_{v,1}⋯α_{v,i}; this follows from (the proof of) [KT17, Lem. 5.3] once H^*(X_K, 𝒱_λ(χ^{-1}))[𝔪^Q] is killed by a power of 𝔪, which follows from the existence of ρ̄_𝔪 and its local–global compatibility at v ∈ Q.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/taylor-wiles-selected-ideals

PotentialAutomorphyInfrastructure:PA.4/diamond-derived-augmentation
THEOREM TauCeti.PotentialAutomorphy.diamond_derived_augmentation
The natural morphisms RΓ(X_K, 𝒱)_{𝔪^Q} → RΓ(X_K, 𝒱)_𝔪, RΓ(X_{K_0(Q)}, 𝒱)_{𝔫_0^Q} → RΓ(X_K, 𝒱)_{𝔪^Q} (trace), and RΓ(Δ_Q, RΓ_{K_0(Q)/K_1(Q)}(X_{K_1(Q)}, 𝒱)_{𝔫_1^Q}) → RΓ(X_{K_0(Q)}, 𝒱)_{𝔫_0^Q} are isomorphisms in D(𝒪) (𝒱 = 𝒱_λ(χ^{-1})). (Proof: the first because 𝔪 is the unique maximal ideal of T^S(K, 𝒱) above 𝔪^Q (printed: of T^{S∪Q}(K_0(Q), 𝒱)), shown in the proof of Lemma 6.5.8; the second reduces after ⊗^L_𝒪 k to tr_{K/K_0(Q)}: H^*(X_{K_0(Q)}, 𝒱/ϖ)_{𝔫_0^Q} ≅ H^*(X_K, 𝒱/ϖ)_{𝔪^Q}, which is [KT17, Lem. 5.4]; the third is clear from the definitions.)
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/selected-ideal-properness; PotentialAutomorphyInfrastructure:PA.0/integral-model-comparison

PotentialAutomorphyInfrastructure:PA.4/taylor-wiles-hecke-locality
THEOREM TauCeti.PotentialAutomorphy.taylor_wiles_hecke_locality
There is a surjection _{K_0(Q)/K_1(Q)}T^{S∪Q}(RΓ_{K_0(Q)/K_1(Q)}(X_{K_1(Q)}, 𝒱)_{𝔫_1^Q}) → T^{S∪Q}(RΓ(X_K, 𝒱)_{𝔪^Q}) = T^{S∪Q}(K, 𝒱)_{𝔪^Q}; its source is a local 𝒪[Δ_Q]-algebra whose maximal ideal is the preimage of 𝔪^Q, because it acts nearly faithfully on H^*(X_{K_1(Q)}, 𝒱)_{𝔫_1^Q}. Definition ([Tay08, Def. 2.1]): a finitely generated module over a Noetherian local ring is nearly faithful if its annihilator is a nilpotent ideal.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/diamond-derived-augmentation

PotentialAutomorphyInfrastructure:PA.4/diamond-linear-deformation-hecke-map
THEOREM TauCeti.PotentialAutomorphy.diamond_linear_deformation_hecke_map
Let 𝕋 = _{K_0(Q)/K_1(Q)}T^{S∪Q}(RΓ_{K_0(Q)/K_1(Q)}(X_{K_1(Q)}, 𝒱_λ(χ^{-1}))_{𝔫_1^Q}). There are δ ≥ 1 depending only on n and [F:ℚ], an ideal J ⊂ 𝕋 with J^δ = 0, and a continuous surjective 𝒪[Δ_Q]-algebra homomorphism f_{𝒮_{χ,Q}}: R_{𝒮_{χ,Q}} → 𝕋/J such that for every finite v ∉ S ∪ Q the characteristic polynomial of f_{𝒮_{χ,Q}} ∘ ρ_{𝒮_{χ,Q}}(Frob_v) is the image of P_v(X). (Proof: with T′ = T^{S∪Q}_Q(K_0(Q)/K_1(Q), 𝒱)_{𝔫_1^Q} ⊃ 𝕋 (a local inclusion of finite 𝒪[Δ_Q]-algebras), Theorem 2.3.7 gives ρ_{𝔫_1^Q}: G_{F,S∪Q} → GL_n(T′/J′) lifting ρ̄_𝔪; the conditions at S are as in Prop. 6.5.3 and there is none at Q. For v ∈ Q define ψ_{v,i}: W_{F_v} → (T′)^× by ψ_{v,i}(Art_{F_v}(α)) = t_{v,i}(α); Theorem 3.1.1 gives det(X − ρ_{𝔫_1^Q}(σ)) = ∏_i (X − ψ_{v,i}(σ)) for σ ∈ W_{F_v} (after enlarging J′); the ψ_{v,i} mod 𝔫_1^Q send Frobenius to the pairwise distinct α_{v,i}, so [BC09, Prop. 1.5.1] gives ρ_{𝔫_1^Q}|_{W_{F_v}} ≅ ⊕_i ψ_{v,i}, whence 𝒪[Δ_v]-linearity (§6.2.18); take J = ker(𝕋 → T′/J′).)
Hypothesis: FL-good-level: every one of the seventeen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/taylor-wiles-arithmetic-levels; PotentialAutomorphyInfrastructure:PA.4/taylor-wiles-selected-ideals; PotentialAutomorphyInfrastructure:PA.3/fontaine-laffaille-deformation-hecke-map; AutomorphicGaloisRepresentationsPartII:AG2.5; GlobalGaloisDeformations:G8

PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-patching-verification
THEOREM TauCeti.PotentialAutomorphy.fontaine_laffaille_patching_verification
Set q = h¹(F_S/F, ad ρ̄_𝔪(1)), g = qn − n²[F⁺:ℚ], Δ_∞ = ℤ_p^{nq}, 𝒯 = a power series ring over 𝒪 in n²|S| − 1 variables, S_∞ = 𝒯⟦Δ_∞⟧ with augmentation ideal 𝔞_∞ (Λ = 𝒪). Enlarge E to contain ζ_p and choose, for each v ∈ R, pairwise distinct χ_{v,1},…,χ_{v,n}: 𝒪_{F_v}^× → 𝒪^× trivial mod ϖ (possible as p > n, q_v ≡ 1 mod p); χ = ∏_{v∈R} χ_v on ∏_{v∈R} I_v. For N ≥ 1 choose Taylor–Wiles data (Q_N, (α_{v,i})_{v∈Q_N}) as in Proposition 6.2.33 (possible as r̄_ι(π)(G_{F(ζ_p)}) is enormous; any imaginary quadratic subfield of F), Q_0 = ∅, Δ_N = Δ_{Q_N} with a surjection Δ_∞ ↠ Δ_N whose kernel lies in (p^N ℤ_p)^{nq} (as q_v ≡ 1 mod p^N for v ∈ Q_N). R_N = R_{𝒮_{1,Q_N}}, R′_N = R_{𝒮_{χ,Q_N}} (R_0 = R_{𝒮_1}, R′_0 = R_{𝒮_χ}); R^loc = R^{S,loc}_{𝒮_1}, R′^loc = R^{S,loc}_{𝒮_χ} (§6.2.22), also the local rings of 𝒮_{·,Q_N}; canonical isomorphisms R^loc/ϖ ≅ R′^loc/ϖ, R_N/ϖ ≅ R′_N/ϖ, R_N ⊗_{𝒪[Δ_N]} 𝒪 ≅ R_0, R′_N ⊗ 𝒪 ≅ R′_0, compatible mod ϖ; R^loc-algebra structures on R_N ⊗̂_𝒪 𝒯 (Lemma 6.2.4); R_∞, R′_∞ = power series rings in g variables over R^loc, R′^loc with surjections onto the framed rings R_N ⊗̂ 𝒯, R′_N ⊗̂ 𝒯 (Prop. 6.2.25 for N = 0, using H⁰(F_S/F, ad ρ̄_𝔪(1)) = 0 because r̄_ι(π)|_{G_{F(ζ_p)}} is irreducible and ζ_p ∉ F; Prop. 6.2.33(3) for N ≥ 1 — printed 'Proposition 6.2.32' and 'R_∞ → R_N'), compatible mod ϖ and with R_N ⊗ 𝒪 ≅ R_0. Complexes: 𝒞_0 = RHom_𝒪(RΓ(X_K, 𝒱_λ(1))_𝔪, 𝒪)[−d], T_0 = T^S(K, 𝒱_λ(1))_𝔪, with H^i(𝒞_0)[1/p] ≅ Hom_E(H^{d−i}(X_K, 𝒱_λ(1))_𝔪[1/p], E) as T_0-modules; 𝒞′_0, T′_0 likewise with 𝒱_λ(χ^{-1}); for N ≥ 1, 𝒞_N = RHom_{𝒪[Δ_N]}(RΓ_{K_0(Q_N)/K_1(Q_N)}(X_{K_1(Q_N)}, 𝒱_λ(1))_{𝔫_1^{Q_N}}, 𝒪[Δ_N])[−d], T_N = _{K_0/K_1}T^{S∪Q_N}(RΓ_{K_0(Q_N)/K_1(Q_N)}(X_{K_1(Q_N)}, 𝒱_λ(1))_{𝔫_1^{Q_N}}), and 𝒞′_N, T′_N with 𝒱_λ(χ^{-1}). Claim: with I_N, I′_N from Props. 6.5.3/6.5.11 these data satisfy the set-up of §6.4.1: canonical 𝒞_N ⊗^L k[Δ_N] ≅ 𝒞′_N ⊗^L k[Δ_N] with T_N, T′_N having the same image T̄_N; 𝒞_N ⊗^L_{𝒪[Δ_N]} 𝒪 ≅ 𝒞_0 (Lemma 6.5.9), compatible mod ϖ; local 𝒪[Δ_N]-algebra surjections R_N → T_N/I_N, R′_N → T′_N/I′_N compatible mod ϖ and agreeing into T̄_N/(Ī_N + Ī′_N); T_N ⊗_{𝒪[Δ_N]} 𝒪 → T_0 surjective onto T_0/I_0 (Chebotarev and the Galois representation over T_0/I_0), and likewise primed.
Hypothesis: FL-good-level: every one of the seventeen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/diamond-derived-augmentation; PotentialAutomorphyInfrastructure:PA.4/diamond-linear-deformation-hecke-map; mathlib:DerivedCategory; DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-model; GlobalGaloisDeformations:G7/taylor-wiles-local-diamond; GlobalGaloisDeformations:G7/enormous-taylor-wiles-primes; GlobalGaloisDeformations:G7/enormous-taylor-wiles-presentation; ArithmeticLocallySymmetricSpaces:ALS.1; GlobalGaloisDeformations:G7; DeformationAndDerivedPatchingAlgebra:P8; DeformationAndDerivedPatchingAlgebra:P7
Recorded gap: Uniform arithmetic tower freeness and reconstruction

PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-dimension-amplitude
THEOREM TauCeti.PotentialAutomorphy.fontaine_laffaille_dimension_amplitude
Applying §6.4.2 to the data of the previous item gives: bounded complexes 𝒞_∞, 𝒞′_∞ of free S_∞-modules, T_∞ ⊂ End_{D(S_∞)}(𝒞_∞), T′_∞ ⊂ End_{D(S_∞)}(𝒞′_∞), ideals with I_∞^δ = I′_∞^δ = 0, S_∞-algebra structures on R_∞, R′_∞ and S_∞-algebra surjections R_∞ → T_∞/I_∞, R′_∞ → T′_∞/I′_∞; surjections R_∞/𝔞_∞ ↠ R_0, R′_∞/𝔞_∞ ↠ R′_0; 𝒞_∞ ⊗^L S_∞/𝔞_∞ ≅ 𝒞_0 and 𝒞′_∞ ⊗^L S_∞/𝔞_∞ ≅ 𝒞′_0 with T_∞ → T_0 surjective onto T_0/I_0 and R_∞/𝔞_∞ → (T_0/I_0)/I_{∞,0} factoring through R_0; 𝒞_∞ ⊗^L S_∞/ϖ ≅ 𝒞′_∞ ⊗^L S_∞/ϖ with a common image T̄_∞ of T_∞ and T′_∞ and identified actions of R_∞/ϖ ≅ R′_∞/ϖ on H^*(𝒞_∞ ⊗^L S_∞/ϖ)/(Ī_∞ + Ī′_∞). By Lemma 6.2.26: every generic point of Spec R_∞/ϖ specializes from a unique generic point of Spec R_∞, all generic points of Spec R_∞ have characteristic 0, Spec R′_∞ is irreducible with characteristic-0 generic point, R_∞ is equidimensional, and dim R_∞ = dim R′_∞ = 1 + g + n²|S| + ½n(n−1)[F:ℚ]. For X_K with F CM, ℓ_0 = n[F⁺:ℚ] − 1; since dim S_∞ = n²|S| + qn and g = qn − n²[F⁺:ℚ] (printed twice as qn − n[F⁺:ℚ]), dim R_∞ = dim R′_∞ = dim S_∞ − ℓ_0. H^*(𝒞_∞ ⊗^L S_∞/𝔞_∞)[1/p] ≅ Hom_E(H^{d−*}(X_K, 𝒱_λ(1))_𝔪[1/p], E) is nonzero and concentrated in [q_patch, q_patch + ℓ_0] by Theorem 2.4.10. Hence Assumption 6.3.6 holds, Proposition 6.3.8 gives full support of H^*(𝒞_∞) over R_∞, hence of H^*(𝒞_∞ ⊗^L S_∞/𝔞_∞) = H^*(𝒞_0) over R_∞/𝔞_∞ and so over R_{𝒮_1}.
Hypothesis: FL-good-level: every one of the seventeen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.
Hypothesis: Here q_patch=n(n−1)[F⁺:Q]/2+1 for the shifted dual complex; the rational GL_n cohomology lower degree is q_GL=q_patch−1. The abstract P9 parameter q₀ is q_patch in this application.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.3/arithmetic-component-dimension-input; LocalGaloisDeformationRings:L7; LocalGaloisDeformationRings:R08.2; ArithmeticLocallySymmetricSpaces:ALS.5; PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-patching-verification; DeformationAndDerivedPatchingAlgebra:P9

PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-full-support
THEOREM TauCeti.PotentialAutomorphy.fontaine_laffaille_full_support
Under assumptions (1)–(17) of §6.5.1, H^*(X_K, 𝒱_λ(1))_𝔪 has full support over R_{𝒮_1}, i.e. its support in Spec R_{𝒮_1}, defined through f_{𝒮_1}: R_{𝒮_1} → T^S(RΓ(X_K, 𝒱_λ(1)))_𝔪/J (Prop. 6.5.3) as in §6.3.5, is all of Spec R_{𝒮_1} (although H^* is not literally an R_{𝒮_1}-module).
Hypothesis: FL-good-level: every one of the seventeen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-patching-verification; PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-dimension-amplitude; PotentialAutomorphyInfrastructure:PA.4/patched-arithmetic-mod-varpi-comparison; PotentialAutomorphyInfrastructure:PA.3/arithmetic-derived-support-contract; DeformationAndDerivedPatchingAlgebra:P9

PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-lifting-at-good-level
THEOREM TauCeti.PotentialAutomorphy.fontaine_laffaille_lifting_at_good_level
Under (1)–(17) of §6.5.1, let ρ: G_F → GL_n(Q̄_p) be continuous with: (1) ρ̄ ≅ r̄_ι(π); (2) ρ|_{G_{F_v}} crystalline for every v | p, with HT_τ(ρ) = {λ_{ιτ,1} + n − 1, …, λ_{ιτ,n}} (the j-th entry λ_{ιτ,j} + n − j) for every τ: F ↪ Q̄_p; (3) ρ unramified at every finite v ∉ S; (4) ρ|_{G_{F_v}} unipotently ramified for v ∈ R. Then ρ is automorphic: there is a cuspidal regular algebraic automorphic representation Π of GL_n(𝔸_F) of weight λ with ρ ≅ r_ι(Π), and Π_v is unramified at every finite v with v | p or v ∉ S. (Proof: conjugate ρ into GL_n(𝒪) with ρ mod ϖ = ρ̄_𝔪; it is of type 𝒮_1, giving f: R_{𝒮_1} → E; by Theorem 6.5.4, ker f ∈ Supp H^*(X_K, 𝒱_λ(1))_𝔪[1/p]; Theorem 2.4.10 gives Π with (Π^∞)^K ≠ 0.)
Hypothesis: FL-good-level: every one of the seventeen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-full-support; ArithmeticLocallySymmetricSpaces:ALS.5

PotentialAutomorphyInfrastructure:PA.4/neatness-auxiliary-places
THEOREM TauCeti.PotentialAutomorphy.neatness_auxiliary_places
By the Chebotarev density theorem there are infinitely many places v_0 of E of degree 1 over ℚ with odd residue characteristic, ρ̄(Frob_{v_0}) scalar, q_{v_0} ≢ 1 mod p and v_0 ∉ S′ ∪ R^c; for them H²(E_{v_0}, ad ρ̄) = H⁰(E_{v_0}, ad ρ̄(1))^∨ = 0. Choosing two such places v_0, v′_0 with distinct residue characteristics l_0 ≠ l′_0 and S = S′ ∪ {v_0, v′_0}, l_0 and l′_0 split in every imaginary quadratic subfield of E, and hypotheses (1)–(17) of §6.5.1 hold for E, π_E and S (resp. (1)–(15) of §6.6.1 in the ordinary case, §6.6.10).
Direct dependencies: Concrete categorical/finite data only.

PotentialAutomorphyInfrastructure:PA.4/ordinary-hida-complex
DEFINITION OrdinaryHidaComplex
For c ≥ 1, Λ_{1,c} = 𝒪[∏_{v∈S_p} ker(T_n(𝒪_{F_v}/ϖ_v^c) → T_n(𝒪_{F_v}/ϖ_v))], a quotient of Λ_1, and A_1(μ,χ,c) = RHom_{Λ_{1,c}}(RΓ(X_{K(c,c)}, 𝒱_μ(χ^{-1}))^{ord}, Λ_{1,c})[−d], a perfect complex in D(Λ_{1,c}) on which T^{S,ord} acts by transpose. (6.6.3): for c′ ≥ c there are T^{S,ord}-equivariant isomorphisms A_1(μ,χ,c′) ⊗^L_{Λ_{1,c′}} Λ_{1,c} ≅ A_1(μ,χ,c) in D(Λ_{1,c}) (Corollary 5.2.16). (6.6.4): canonical T^{S,ord}-equivariant isomorphisms A_1(μ,χ,c) ⊗^L_{Λ_{1,c}} Λ_{1,c}/ϖ ≅ A_1(μ,1,c) ⊗^L_{Λ_{1,c}} Λ_{1,c}/ϖ. By [KT17, Lem. 2.13] there is a perfect A_1(μ,χ) ∈ D(Λ_1) with T^{S,ord}-action and equivariant isomorphisms A_1(μ,χ) ⊗^L_{Λ_1} Λ_{1,c} ≅ A_1(μ,χ,c) (all c ≥ 1) and A_1(μ,χ) ⊗^L_{Λ_1} Λ_1/ϖ ≅ A_1(μ,1) ⊗^L_{Λ_1} Λ_1/ϖ, compatible with (6.6.3) and with (6.6.4) for varying χ; A(μ,χ) = A_1(μ,χ) ⊗^L_{Λ_1} Λ ∈ D(Λ).
Hypothesis: ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/arithmetic-ordinary-summand; PotentialAutomorphyInfrastructure:PA.2/ordinary-level-control; mathlib:DerivedCategory; PadicFamilies:L0a/finite-quotient-system; PadicFamilies:L0a/profinite-ordinary-projector; PadicFamilies:L0a/ordinary-part-complexes; DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-model; DeformationAndDerivedPatchingAlgebra:P8; DeformationAndDerivedPatchingAlgebra:P7
API OrdinaryHidaComplex.finite (data)
A₁(μ,χ,c)=RHom_{Λ₁,c}(RΓ(X_{K(c,c)},V_μ(χ^{-1}))^ord,Λ₁,c)[−d].
API OrdinaryHidaComplex.transition (functoriality)
Derived tensor from Λ₁,c′ to Λ₁,c gives the finite c complex for c′≥c.
API OrdinaryHidaComplex.mod_varpi (compatibility)
For χ congruent to 1 modulo varpi, the χ and 1 complexes agree after derived reduction.
API OrdinaryHidaComplex.perfect_limit (data)
The P7 reconstruction supplies a perfect Λ₁-complex with all these compatible finite specializations.
EXAMPLE OrdinaryHidaComplex.zero (degenerate)
The dual of the zero ordinary complex is zero.
EXAMPLE OrdinaryHidaComplex.single_free_term (computation)
For the free module Λ₁,c in degree 0 the dual shifted by −d has its sole cohomology in degree d.
EXAMPLE OrdinaryHidaComplex.derived_reduction (compatibility)
For a perfect finite complex, specializing the dual equals the dual of the specialized complex; underived reduction of cohomology is not substituted.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline
Recorded gap: Uniform arithmetic tower freeness and reconstruction

PotentialAutomorphyInfrastructure:PA.4/weight-independent-hida-twist
DEFINITION WeightIndependentHidaTwist
ν ∈ X^*((Res_{F/ℚ} T)_E) = (ℤ^n)^{Hom(F,E)} is ν_τ = (0, 1, …, n−1) for all τ. B_1(μ,χ) = A_1(μ,χ) ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1}, where 𝒪(ν + w_0^G μ)^{-1} is the 𝒪[T_n(F_p)]-module of §5.2.1 (the action of T_n(𝒪_{F,p}) extending uniquely to 𝒪⟦T_n(𝒪_{F,p})⟧); it is a perfect complex in D(Λ_1) with T^{S,ord}-action. B(μ,χ) = B_1(μ,χ) ⊗^L_{Λ_1} Λ.
Hypothesis: ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/ordinary-hida-complex; PotentialAutomorphyInfrastructure:PA.2/lowest-weight-character
API WeightIndependentHidaTwist.nu (data)
ν_{τ,i}=i−1 for one-based i.
API WeightIndependentHidaTwist.formula (characterisation)
B₁=A₁⊗O(ν+w₀μ)^{-1}, and B=B₁⊗^L_{Λ₁}Λ.
API WeightIndependentHidaTwist.hecke (compatibility)
Transpose Hecke away from S is preserved under the tensor twist.
API WeightIndependentHidaTwist.weight_compare (relation)
For all dominant μ,μ′ the complexes B₁(μ,χ),B₁(μ′,χ) are equivariantly isomorphic by Lemma 6.6.5.
EXAMPLE WeightIndependentHidaTwist.rank_one_zero (degenerate)
For n=1, μ=0, ν=0 so the twist is trivial.
EXAMPLE WeightIndependentHidaTwist.rank_two_zero (computation)
For n=2, μ=0, ν=(0,1) and the twist is O(0,1)^{-1}, not the trivial character.
EXAMPLE WeightIndependentHidaTwist.rank_two_weight (computation)
For μ=(2,0), ν+w₀μ=(0,3), fixing both the reversal and ν shift.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.4/hida-weight-independence
THEOREM TauCeti.PotentialAutomorphy.hida_weight_independence
For every μ′ ∈ (ℤ^n_+)^{Hom(F,E)} there is a T^{S,ord}-equivariant isomorphism B_1(μ,χ) ≅ B_1(μ′,χ) in D(Λ_1). (Proof: Proposition 5.2.17 and [KT17, Lem. 2.13].)
Hypothesis: ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/weight-independent-hida-twist; PotentialAutomorphyInfrastructure:PA.2/completed-ordinary-weight-control

PotentialAutomorphyInfrastructure:PA.4/hida-weight-specialization
THEOREM TauCeti.PotentialAutomorphy.hida_weight_specialization
For μ′ ∈ (ℤ^n_+)^{Hom(F,E)} there is a T^{S,ord}-equivariant isomorphism in D(𝒪): B_1(μ,χ) ⊗^L_{Λ_1} 𝒪(ν + w_0^G μ′)^{-1} ≅ A_1(μ′,χ,1) ⊗_𝒪 𝒪(ν + w_0^G μ′)^{-1}. (By Lemma 6.6.5 reduce to μ′ = μ, where the left side is A_1(μ,χ) ⊗^L_{Λ_1} 𝒪 ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1}.)
Hypothesis: ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/hida-weight-independence

PotentialAutomorphyInfrastructure:PA.4/ordinary-taylor-wiles-levels
DEFINITION OrdinaryTaylorWilesLevels
For a Taylor–Wiles datum (Q, (α_{v,i})) for 𝒮_1 whose places have residue characteristic split in an imaginary quadratic subfield of F (a TW datum for all 𝒮_χ; R_{𝒮_{χ,Q}} an 𝒪[Δ_Q]-algebra, Δ_Q = ∏_{v∈Q} k(v)^×(p)^n) and c ≥ 1: good subgroups K(c,c)_1(Q) ⊂ K(c,c)_0(Q) ⊂ K(c,c), equal to K(c,c)_v away from Q (printed: for v ∉ S ∪ Q), with K(c,c)_0(Q)_v = Iw_v and K(c,c)_1(Q)_v the maximal pro-prime-to-p subgroup of Iw_v for v ∈ Q, so K(c,c)_0(Q)/K(c,c)_1(Q) ≅ Δ_Q. A_1(μ,χ,Q,c) = RHom_{Λ_{1,c}[Δ_Q]}(RΓ_{K(c,c)_0(Q)/K(c,c)_1(Q)}(X_{K(c,c)_1(Q)}, 𝒱_μ(χ^{-1}))^{ord}, Λ_{1,c}[Δ_Q])[−d] ∈ D(Λ_{1,c}[Δ_Q]), with transpose action of T^{S∪Q,ord}_Q = T^{S∪Q,ord} ⊗_{T^{S∪Q}} T^{S∪Q}_Q. Passing to the limit in c gives A_1(μ,χ,Q) ∈ D(Λ_1[Δ_Q]) with T^{S∪Q,ord}_Q-action and equivariant isomorphisms A_1(μ,χ,Q) ⊗^L_{Λ_1} Λ_{1,c} ≅ A_1(μ,χ,Q,c) and A_1(μ,χ,Q) ⊗^L_{Λ_1} Λ_1/ϖ ≅ A_1(μ,1,Q) ⊗^L_{Λ_1} Λ_1/ϖ, compatible with the level-c data. 𝔪^Q = the contraction of 𝔪 to T^{S∪Q,ord}; 𝔫^Q = the ideal of T^{S∪Q,ord}_Q generated by 𝔪^Q and U_{v,i} − α_{v,1}⋯α_{v,i} (v ∈ Q, 1 ≤ i ≤ n).
Hypothesis: ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/taylor-wiles-arithmetic-levels; PotentialAutomorphyInfrastructure:PA.4/ordinary-hida-complex; PadicFamilies:L0a/finite-quotient-system; PadicFamilies:L0a/profinite-ordinary-projector; PadicFamilies:L0a/ordinary-part-complexes; GlobalGaloisDeformations:G7/taylor-wiles-local-diamond; GlobalGaloisDeformations:G7/enormous-taylor-wiles-primes; GlobalGaloisDeformations:G7/enormous-taylor-wiles-presentation; GlobalGaloisDeformations:G7; DeformationAndDerivedPatchingAlgebra:P8; DeformationAndDerivedPatchingAlgebra:P7
API OrdinaryTaylorWilesLevels.levels (compatibility)
For every c the two auxiliary levels agree with K(c,c) away from Q and use the same imported diamonds at Q.
API OrdinaryTaylorWilesLevels.dual (data)
The finite ordinary dual complex is formed over Λ₁,c[Δ_Q], with transpose Hecke.
API OrdinaryTaylorWilesLevels.selected_generator (simp)
The ordinary auxiliary ideal has generators U_{v,i}−∏_{j≤i}α_{v,j}, using the ordinary normalization.
API OrdinaryTaylorWilesLevels.limit (functoriality)
Perfect reconstruction in c commutes with mod-varpi comparison and carries the diamond action.
EXAMPLE OrdinaryTaylorWilesLevels.empty (degenerate)
For Q=∅ the complex is A₁(μ,χ,c).
EXAMPLE OrdinaryTaylorWilesLevels.single_rank_two (computation)
For n=2 and Q={v}, the ordinary i=2 generator is U_{v,2}−α₁α₂; the FL factor q_v^{-1} is absent.
EXAMPLE OrdinaryTaylorWilesLevels.old_level (compatibility)
All places in S outside Q retain K(c,c)_v; the auxiliary modification does not change their levels.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.4/ordinary-diamond-augmentation
THEOREM TauCeti.PotentialAutomorphy.ordinary_diamond_augmentation
𝔫^Q lies in the support of H^*(A_1(μ,χ,Q)), and there are T^{S∪Q,ord}-equivariant isomorphisms A_1(μ,χ,Q)_{𝔫^Q} ⊗^L_{Λ_1[Δ_Q]} Λ_1 ≅ A_1(μ,χ)_{𝔪^Q} ≅ A_1(μ,χ)_𝔪. (Proof 'as in the Fontaine–Laffaille case', details omitted.)
Hypothesis: ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/ordinary-taylor-wiles-levels; PotentialAutomorphyInfrastructure:PA.4/selected-ideal-properness; PotentialAutomorphyInfrastructure:PA.4/diamond-derived-augmentation

PotentialAutomorphyInfrastructure:PA.4/ordinary-diamond-linear-hecke-map
THEOREM TauCeti.PotentialAutomorphy.ordinary_diamond_linear_hecke_map
Let A(μ,χ,Q) = A_1(μ,χ,Q) ⊗^L_{Λ_1} Λ and _{Δ_Q}T^{S∪Q,Λ_1} = T^{S∪Q,Λ_1} ⊗_𝒪 𝒪[Δ_Q], acting on A(μ,χ,Q)_{𝔫^Q} via K(c,c)_0(Q)/K(c,c)_1(Q) ≅ Δ_Q and passage to the limit; _{Δ_Q}T^{S∪Q,Λ_1}(A(μ,χ,Q)_{𝔫^Q}) is a local Λ[Δ_Q]-algebra (printed with A(Λ,χ,Q)). Then there are δ ≥ 1 depending only on n and [F:ℚ], an ideal J ⊂ 𝕋 := _{Δ_Q}T^{S∪Q,Λ_1}(A(μ,χ,Q)_{𝔫^Q} ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1}) with J^δ = 0, and a continuous surjective Λ[Δ_Q]-algebra homomorphism f_{𝒮_{χ,Q}}: R_{𝒮_{χ,Q}} → 𝕋/J such that for every finite v ∉ S ∪ Q the characteristic polynomial of f_{𝒮_{χ,Q}} ∘ ρ_{𝒮_{χ,Q}}(Frob_v) is the image of P_v(X) (printed: v ∉ S and f_{𝒮_χ} ∘ ρ_{𝒮_χ}). (Proof: the Λ-algebra map as in Prop. 6.6.7; Λ[Δ_Q]-linearity as in Prop. 6.5.11 via T^{S∪Q,ord}_Q(A(μ,χ,Q) ⊗ 𝒪(ν + w_0^G μ)^{-1})_{𝔫^Q}.)
Hypothesis: ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.3/ordinary-deformation-hecke-map; PotentialAutomorphyInfrastructure:PA.4/ordinary-taylor-wiles-levels; AutomorphicGaloisRepresentationsPartII:AG2.5; LocalGaloisDeformationRings:L8; GlobalGaloisDeformations:G8

PotentialAutomorphyInfrastructure:PA.4/ordinary-patching-verification
THEOREM TauCeti.PotentialAutomorphy.ordinary_patching_verification
Let f: R_{𝒮_1} → 𝒪 classify ρ. Set q = h¹(F_S/F, ad ρ̄_𝔪(1)), g = qn − n²[F⁺:ℚ], Δ_∞ = ℤ_p^{nq}, 𝒯 = a power series ring over Λ (the weight algebra) in n²|S| − 1 variables, S_∞ = 𝒯⟦Δ_∞⟧, augmented over Λ with ideal 𝔞_∞. Choose χ = ∏_{v∈R} χ_v: ∏_{v∈R} Iw_v → 𝒪^× with χ_{v,1},…,χ_{v,n}: k(v)^× → 𝒪^× trivial mod ϖ and pairwise distinct. R^loc = R^{S,loc}_{𝒮_1}, R′^loc = R^{S,loc}_{𝒮_χ} (§6.2.22; printed with 𝒮_1^{ord}, 𝒮_χ^{ord}); R_∞, R′_∞ = power series rings in g variables over them. Applying §6.4.2 to the complexes A(μ,χ,Q_N)_{𝔫^{Q_N}} ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1} (and χ = 1), for Taylor–Wiles data from Proposition 6.2.33, gives: bounded complexes 𝒞_∞, 𝒞′_∞ of free S_∞-modules, T_∞, T′_∞ with nilpotent I_∞, I′_∞ (I^δ = 0), S_∞-algebra structures on R_∞, R′_∞ and surjections R_∞ → T_∞/I_∞, R′_∞ → T′_∞/I′_∞; surjections of local Λ-algebras R_∞/𝔞_∞ ↠ R_{𝒮_1}, R′_∞/𝔞_∞ ↠ R_{𝒮_χ}; and isomorphisms 𝒞_∞ ⊗^L_{S_∞} S_∞/𝔞_∞ ≅ A(μ,1)_𝔪 ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1} = B(μ,1)_𝔪 and 𝒞′_∞ ⊗^L S_∞/𝔞_∞ ≅ B(μ,χ)_𝔪 in D(Λ).
Hypothesis: ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/ordinary-diamond-augmentation; PotentialAutomorphyInfrastructure:PA.4/ordinary-diamond-linear-hecke-map; PotentialAutomorphyInfrastructure:PA.4/weight-independent-hida-twist; mathlib:DerivedCategory; DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-model; GlobalGaloisDeformations:G7/taylor-wiles-local-diamond; GlobalGaloisDeformations:G7/enormous-taylor-wiles-primes; GlobalGaloisDeformations:G7/enormous-taylor-wiles-presentation; ArithmeticLocallySymmetricSpaces:ALS.1; GlobalGaloisDeformations:G7; DeformationAndDerivedPatchingAlgebra:P8; DeformationAndDerivedPatchingAlgebra:P7
Recorded gap: Uniform arithmetic tower freeness and reconstruction

PotentialAutomorphyInfrastructure:PA.4/ordinary-support-at-lifting-point
THEOREM TauCeti.PotentialAutomorphy.ordinary_support_at_lifting_point
In the situation of the previous item: Lemma 6.2.27(1),(2) give Assumption 6.3.6(1),(2) for R_∞, R′_∞ (the dimension equality dim R_∞ = dim S_∞ − ℓ_0 needs g = qn − n²[F⁺:ℚ]; printed g = qn − n[F⁺:ℚ]). For 𝔭 = the preimage in S_∞ of Ann_Λ(𝒪(ν + w_0^G μ)^{-1}), Corollary 6.6.6 gives (𝒞_∞ ⊗^L S_∞/𝔭)[1/p] ≅ (B(μ,1)_𝔪 ⊗^L_Λ 𝒪(ν + w_0^G μ)^{-1})[1/p], whose cohomology is a quotient of Hom_E(H^{d−*}(X_{K(1,1)}, 𝒱_μ)_𝔪[1/p], E); π contributes, so by Theorem 2.4.10 it is nonzero and concentrated in [q_0, q_0 + ℓ_0] (Assumption 6.3.6(3)). Let x ∈ Spec R_∞ be the preimage of ker f and y its contraction to S_∞ (the preimage of Ann_Λ(𝒪(ν + w_0^G λ)^{-1})). The inertial characters on the diagonal of ρ|_{G_{F_v}} are pairwise distinct for v ∈ S_p, so x lies on a maximal-dimensional component of Spec R_∞ (Lemma 6.2.27(3)), and Corollary 6.3.9 gives ker f ∈ Supp H^*(B(μ,1)_𝔪 ⊗^L_Λ 𝒪(ν + w_0^G λ)^{-1})[1/p]; by Corollary 6.6.6, ker f ∈ Supp H^*(A_1(λ,1,1)_𝔪 ⊗_𝒪 𝒪(ν + w_0^G λ)^{-1})[1/p] (printed A(λ,1,1)), a quotient of Hom_E(H^{d−*}(X_{K(1,1)}, 𝒱_λ)_𝔪, 𝒪(ν + w_0^G λ)^{-1}[1/p]).
Hypothesis: ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/ordinary-patching-verification; PotentialAutomorphyInfrastructure:PA.4/patched-arithmetic-mod-varpi-comparison; PotentialAutomorphyInfrastructure:PA.3/arithmetic-derived-support-contract; PotentialAutomorphyInfrastructure:PA.4/hida-weight-specialization; LocalGaloisDeformationRings:L7; LocalGaloisDeformationRings:L8; LocalGaloisDeformationRings:R08.2; DeformationAndDerivedPatchingAlgebra:P9

PotentialAutomorphyInfrastructure:PA.4/ordinary-lifting-at-good-level
THEOREM TauCeti.PotentialAutomorphy.ordinary_lifting_at_good_level
Under (1)–(15) of §6.6.1, let ρ: G_F → GL_n(Q̄_p) be continuous and λ ∈ (ℤ^n_+)^{Hom(F,Q̄_p)} such that: (1) ρ̄ ≅ r̄_ι(π); (2) for each v | p, ρ|_{G_{F_v}} is conjugate to an upper-triangular representation with diagonal characters ψ_{v,1}, …, ψ_{v,n}, where ψ_{v,i} agrees on the whole inertia group I_{F_v} with σ ↦ ∏_{τ∈Hom(F_v,Q̄_p)} τ(Art_{F_v}^{-1}(σ))^{−(λ_{τ,n−i+1} + i − 1)}; (3) for each v | p, each i and each p-power root of unity x ∈ 𝒪_{F_v}: ∏_{τ∈Hom(F_v,Q̄_p)} τ(x)^{λ_{τ,n+1−i} − μ_{ιτ,n+1−i}} = 1; (4) ρ unramified at finite v ∉ S; (5) ρ|_{G_{F_v}} unipotently ramified for v ∈ R. Then ρ is ordinarily automorphic of weight ιλ: there is an ι-ordinary cuspidal automorphic Π of GL_n(𝔸_F) of weight ιλ with ρ ≅ r_ι(Π), and Π_v is unramified for every finite v ∉ S. (No analogue of Theorem 6.5.4 is proved, because the irreducible components of the 𝒟^{det,ord} lifting rings are not understood well enough.)
Hypothesis: ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/ordinary-support-at-lifting-point; ArithmeticLocallySymmetricSpaces:ALS.5

PotentialAutomorphyInfrastructure:PA.5/split-test-prime-image-preservation
THEOREM TauCeti.PotentialAutomorphy.split_test_prime_image_preservation
Let F be imaginary CM, ρ̄ absolutely irreducible with ρ̄(G_{F(ζ_p)}) enormous and some σ ∈ G_F − G_{F(ζ_p)} with ρ̄(σ) scalar, and K/F(ζ_p) the extension cut out by ρ̄|_{G_{F(ζ_p)}}. Choose finite sets of finite places: V_0, all split in F(ζ_p), such that for each subfield F(ζ_p) ⊊ K′ ⊆ K some v ∈ V_0 splits in F(ζ_p) but not in K′; V_1 such that for each subfield F ⊊ K′ ⊆ K some v ∈ V_1 does not split in K′ (printed 'proper subfield K/K′/…'); V_2 = the p_0-adic places for a rational prime p_0 ≠ p that is decomposed generic for ρ̄; and v ∤ 2p with ρ, π unramified at every v ∈ V_0 ∪ V_1 ∪ V_2. Then for every finite Galois E/F in which all places of V_0 ∪ V_1 ∪ V_2 split: ρ̄(G_E) = ρ̄(G_F) and ρ̄(G_{E(ζ_p)}) = ρ̄(G_{F(ζ_p)}); hence ρ̄|_{G_{E(ζ_p)}} has enormous image, some σ ∈ G_E − G_{E(ζ_p)} has ρ̄(σ) scalar, and ρ̄|_{G_E} is decomposed generic (p_0 splits in E). (Used verbatim in §6.6.10.)
Direct dependencies: PotentialAutomorphyInfrastructure:PA.5/genericity-normal-closure-restriction; PotentialAutomorphyInfrastructure:PA.5/residual-lifting-hypothesis-restriction; AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity; AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime

PotentialAutomorphyInfrastructure:PA.5/fontaine-laffaille-base-change-fields
THEOREM TauCeti.PotentialAutomorphy.fontaine_laffaille_base_change_fields
Let E_0/F be a soluble CM extension such that: all places of V_0 ∪ V_1 ∪ V_2 split and p is unramified in E_0; π_{E_0,w}^{Iw_w} ≠ 0 for every finite w; at every finite prime-to-p w, either π_{E_0,w} and ρ|_{G_{E_0,w}} are both unramified, or ρ|_{G_{E_0,w}} is unipotently ramified, q_w ≡ 1 mod p and ρ̄|_{G_{E_0,w}} is trivial; every w̄ | p of E_0⁺ splits in E_0 and admits w̄′ ≠ w̄, w̄′ | p, with Σ_{w̄″≠w̄,w̄′} [E⁺_{0,w̄″}:ℚ_p] > ½[E_0⁺:ℚ]. Choose imaginary quadratic E_a, E_b, E_c with: every rational prime below V_0 ∪ V_1 ∪ V_2 splits in E_aE_bE_c and p is unramified in E_aE_bE_c; 2 and p split in E_a; every l ∉ {2,p} below a place of E_0 where π_{E_0} or ρ ramifies, or ramified in E_0E_aE_c, splits in E_b; every l ∉ {2,p} ramified in E_b splits in E_c (e.g. E_b = ℚ(√−p_b) with p_b ≡ 1 mod 4 and p_b ≡ −1 mod each such l, E_c = ℚ(√−p_c) with p_c ≡ 1 mod 4p_b, p_c ≠ p and p_b ≠ p; also impose p_b ≡ p_c ≡ −1 mod each rational prime below V_0∪V_1∪V_2; quadratic reciprocity shows p_c splits in E_b). Then E = E_0E_aE_bE_c is a soluble CM extension of F, split at V_0 ∪ V_1 ∪ V_2, with: p unramified in E; for R = {prime-to-p w: π_{E,w} or ρ|_{G_{E_w}} ramified}, S_p the p-adic places and S′ = S_p ∪ R, every prime below S′ or ramified in E splits in an imaginary quadratic subfield of E; ρ̄|_{G_{E_w}} trivial and q_w ≡ 1 mod p for w ∈ R; ρ̄|_{G_{E(ζ_p)}} enormous, ρ̄|_{G_E} decomposed generic, some σ ∈ G_E − G_{E(ζ_p)} with ρ̄(σ) scalar; and the E⁺-analogue of the p-adic degree condition.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.5/split-test-prime-image-preservation; PotentialAutomorphyInfrastructurePartII:PL.0

PotentialAutomorphyInfrastructure:PA.5/ordinary-base-change-fields
THEOREM TauCeti.PotentialAutomorphy.ordinary_base_change_fields
Let E_0/F be a soluble CM extension such that: all places of V_0 ∪ V_1 ∪ V_2 split in E_0; π_{E_0,w}^{Iw_w} ≠ 0 for every finite w; at each finite prime-to-p w, either π_{E_0,w} and ρ|_{G_{E_0,w}} are unramified, or ρ|_{G_{E_0,w}} is unipotently ramified, q_w ≡ 1 mod p and ρ̄|_{G_{E_0,w}} trivial; for w | p, ρ̄|_{G_{E_0,w}} is trivial and [E_{0,w}:ℚ_p] > n(n+1)/2 + 1; for v | p, w | v and each i, ψ_{v,i} agrees with σ ↦ ∏_{τ∈Hom(F_v,Q̄_p)} τ(Art_{F_v}^{-1}(σ))^{−(λ_{τ,n−i+1}+i−1)} on all of I_{E_0,w}; and, with μ the weight of π_{E_0}, ψ_{v,i}(Art_{E_0,w}(x)) · ∏_{τ∈Hom(E_{0,w},Q̄_p)} τ(x)^{μ_{ιτ,n−i+1}+i−1} = 1 for every w | p and every p-power root of unity x ∈ E_{0,w}. Choose imaginary quadratic E_a, E_b, E_c as in the FL case but without requiring p unramified (p_c ≡ 1 mod 4p_b and p_b ≡ p_c ≡ −1 mod every rational prime below V_0∪V_1∪V_2). Then E = E_0E_aE_bE_c is soluble CM, V-split, and: every prime below S′ = S_p ∪ R or ramified in E splits in an imaginary quadratic subfield of E; ρ̄|_{G_{E_w}} trivial and q_w ≡ 1 mod p for w ∈ R; ρ̄|_{G_{E(ζ_p)}} enormous, ρ̄|_{G_E} decomposed generic, some σ ∈ G_E − G_{E(ζ_p)} with ρ̄(σ) scalar; ρ̄|_{G_{E_w}} trivial and [E_w:ℚ_p] > n(n+1)/2 + 1 for w | p; and the base change π_E (Prop. 6.5.13) is ι-ordinary by [Ger19, Lem. 5.7].
Direct dependencies: PotentialAutomorphyInfrastructure:PA.5/split-test-prime-image-preservation; PotentialAutomorphyInfrastructurePartII:PL.0
Recorded gap: Geraghty primary-source normalization check

PotentialAutomorphyInfrastructure:PA.5/rank-two-reducibility-dichotomy
THEOREM TauCeti.PotentialAutomorphy.rank_two_reducibility_dichotomy
If R is an extremely weakly compatible system of rank 2, then either r_λ is irreducible for every λ, or there are weakly compatible systems (in the sense of BLGGT) 𝒳_1, 𝒳_2 of rank 1 with r_λ ≅ χ_{1,λ} ⊕ χ_{2,λ} for every λ.
Direct dependencies: PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data; PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates; PotentialModularityAndCompatibleSystems:R24.5/character-system; PotentialModularityAndCompatibleSystems:R24.5/artin-system; PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems; PotentialModularityAndCompatibleSystems:R24.5:operations
Recorded gap: Extremely weak monodromy and rank-one source leaves

PotentialAutomorphyInfrastructure:PA.5/rank-two-system-trichotomy
THEOREM TauCeti.PotentialAutomorphy.rank_two_system_trichotomy
Let R be an irreducible extremely weakly compatible system of rank 2. Then either (1) R is strongly irreducible; or (2) R is Artin up to twist; or (3) there are a quadratic extension F'/F and a weakly compatible system 𝒳 of characters of G_{F'} with R ≅ Ind_{G_{F'}}^{G_F} 𝒳 (R is then called induced).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.5/rank-two-reducibility-dichotomy; PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data; PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates; PotentialModularityAndCompatibleSystems:R24.5/character-system; PotentialModularityAndCompatibleSystems:R24.5/artin-system; PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems; PotentialModularityAndCompatibleSystems:R24.5:operations

PotentialAutomorphyInfrastructure:PA.5/rank-two-adjoint-monodromy
THEOREM TauCeti.PotentialAutomorphy.rank_two_adjoint_monodromy
Over Q̄_l: (1) every morphism PGL_2 → PGL_2 is trivial or conjugation by an element of PGL_2(Q̄_l); (2) every morphism PGL_2^r → PGL_2 is trivial or a projection followed by a conjugation; (3) up to PGL_2(Q̄_l)^J-conjugacy, morphisms PGL_2^I → PGL_2^J are induced by pairs (J_0 ⊂ J, φ : J_0 → I); (4) Aut(PGL_2^I) = PGL_2^I ⋊ S_I; (5) a connected algebraic subgroup G ⊂ PGL_2^J surjecting onto PGL_2 under every projection is ≅ PGL_2^I, embedded (up to conjugacy) through a surjection φ : J ↠ I (induction on #J and Goursat); (6) for M/Q_l finite, (Res^M_{Q_l} PGL_2)_{Q̄_l} ≅ PGL_2^{Hom_{Q_l}(M,Q̄_l)} with G_{Q_l} acting through its left action on Hom_{Q_l}(M, Q̄_l); (7) forms of PGL_2^r are classified by the middle term of H^1(Q_l, PGL_2^r) → H^1(Q_l, Aut PGL_2^r) → H^1(Q_l, S_r), and the unramified ones (quasi-split and split over an unramified extension) are exactly ∏_i Res^{N_i}_{Q_l} PGL_2 with N_i/Q_l unramified; (8) hence, if G ⊂ ∏_{j∈J} Res^{M_j}_{Q_l} PGL_2 is an unramified connected subgroup whose base change to Q̄_l surjects onto every factor of PGL_2^{⊔_j Hom(M_j,Q̄_l)}, then G ≅ ∏_{i∈I} Res^{N_i}_{Q_l} PGL_2 with N_i/Q_l unramified, and each (j, τ)-projection of G_{Q̄_l} is PGL_2(Q̄_l)-conjugate to the projection onto one factor of ∏_i (Res^{N_i}_{Q_l} PGL_2)_{Q̄_l}.
Direct dependencies: tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; ReductiveGroupsPartII:RG2.0a
Recorded gap: Unramified forms of products of adjoint PGL₂

PotentialAutomorphyInfrastructure:PA.5/rank-two-large-residual-image
THEOREM TauCeti.PotentialAutomorphy.rank_two_large_residual_image
Let R be an irreducible extremely weakly compatible system of rank 2. Then for all rational primes l in a set of Dirichlet density 1 and all λ | l, r̄_λ is absolutely irreducible. If moreover R is neither induced nor Artin up to twist, and F̃ is the normal closure of F/Q, then l can in addition be taken so that r̄_λ(G_{F̃}) ⊇ SL_2(F_l) for all λ | l.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.5/rank-two-system-trichotomy; PotentialAutomorphyInfrastructure:PA.5/rank-two-adjoint-monodromy; PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data; PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates; PotentialModularityAndCompatibleSystems:R24.5:operations
Recorded gap: Extremely weak monodromy and rank-one source leaves
Recorded gap: Unramified forms of products of adjoint PGL₂

PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-lifting-descent
THEOREM TauCeti.PotentialAutomorphy.fontaine_laffaille_lifting_descent
Let F, ρ, π, λ, ι satisfy the hypotheses of Theorem 6.1.1 ((1) ρ unramified almost everywhere; (2) ρ|_{G_{F_v}} crystalline for v | p, p unramified in F; (3) ρ̄ absolutely irreducible and decomposed generic, ρ̄(G_{F(ζ_p)}) enormous; (4) some σ ∈ G_F − G_{F(ζ_p)} with ρ̄(σ) scalar, p > n²; (5) π cuspidal regular algebraic of weight λ with λ_{τ,1} + λ_{τc,1} − λ_{τ,n} − λ_{τc,n} < p − 2n, ρ̄ ≅ r̄_ι(π), HT_τ(ρ) = {λ_{ιτ,1} + n − 1, …, λ_{ιτ,n}}, π_v unramified for v | p). The totally real case reduces to the imaginary CM case by base change (no details given). For imaginary F: choose V_0, V_1, V_2 and a soluble CM E/F as in the next two items and auxiliary places v_0, v′_0 so that §6.5.1 (1)–(17) hold for E, π_E and S = S′ ∪ {v_0, v′_0}; Corollary 6.5.5 for ρ|_{G_E} and Proposition 6.5.13(2) give a cuspidal regular algebraic Π of GL_n(𝔸_F) of weight λ with ρ ≅ r_ι(Π), with Π_{E,w} unramified for w ∉ S; unramifiedness of Π_v at finite v ∤ p where ρ and π are unramified follows from the Varma argument (item 274). (The claim Π_v unramified for v | p in Theorem 6.1.1 is not addressed explicitly; it follows from Π_{E,w} unramified for w | p and p unramified in E.)
Direct dependencies: PotentialAutomorphyInfrastructure:PA.5/fontaine-laffaille-base-change-fields; PotentialAutomorphyInfrastructure:PA.4/neatness-auxiliary-places; PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-lifting-at-good-level; PotentialAutomorphyInfrastructurePartII:PL.0; ModularityAndLanglandsExtensions:ML.1
Recorded gap: Rational unpolarized base-change and local compatibility source leaves
Recorded gap: Owner contract for general unpolarized soluble automorphic descent

PotentialAutomorphyInfrastructure:PA.4/ordinary-lifting-descent
THEOREM TauCeti.PotentialAutomorphy.ordinary_lifting_descent
Let F, ρ, λ, π, ι satisfy Theorem 6.1.2 ((1) ρ unramified almost everywhere; (2) for v | p, ρ|_{G_{F_v}} potentially semistable and ordinary of regular weight λ ∈ (ℤ^n_+)^{Hom(F,Q̄_p)}: upper triangular with diagonal ψ_{v,i} agreeing with σ ↦ ∏_τ τ(Art_{F_v}^{-1}(σ))^{−(λ_{τ,n−i+1}+i−1)} on an open subgroup of I_{F_v}; (3) ρ̄ absolutely irreducible and decomposed generic, ρ̄(G_{F(ζ_p)}) enormous, some σ ∈ G_F − G_{F(ζ_p)} with ρ̄(σ) scalar, p > n; (4) π regular algebraic cuspidal and ι-ordinary with r̄_ι(π) ≅ ρ̄). The totally real case reduces to the imaginary CM case by base change (no details given). For imaginary F choose V_0, V_1, V_2, the ordinary-variant extension E (next item) and auxiliary places v_0, v′_0 so that (1)–(15) of §6.6.1 hold for E, π_E, S; Theorem 6.6.2 applied to ρ|_{G_E} gives an ι-ordinary cuspidal Π_E of weight λ_E with r_ι(Π_E) ≅ ρ|_{G_E}; Proposition 6.5.13(2) and [Ger19, Lem. 5.7] descend it to an ι-ordinary cuspidal regular algebraic Π of GL_n(𝔸_F) of weight λ with r_ι(Π) ≅ ρ; Π_{E,w} is unramified for w ∉ S, and Π_v is unramified at finite v ∤ p where ρ and π are unramified (Varma argument, item 274).
Direct dependencies: PotentialAutomorphyInfrastructure:PA.5/ordinary-base-change-fields; PotentialAutomorphyInfrastructure:PA.4/neatness-auxiliary-places; PotentialAutomorphyInfrastructure:PA.4/ordinary-lifting-at-good-level; PotentialAutomorphyInfrastructurePartII:PL.0; ModularityAndLanglandsExtensions:ML.1
Recorded gap: Geraghty primary-source normalization check
Recorded gap: Rational unpolarized base-change and local compatibility source leaves
Recorded gap: Owner contract for general unpolarized soluble automorphic descent

PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-automorphy-lifting
THEOREM TauCeti.PotentialAutomorphy.fontaine_laffaille_automorphy_lifting
Let F be an imaginary CM or totally real field, c ∈ Aut(F) complex conjugation, p a prime, and ρ : G_F → GL_n(ℚ̄_p) continuous with: (1) ρ unramified almost everywhere; (2) ρ|_{G_{F_v}} crystalline for every v | p, and p unramified in F; (3) ρ̄ absolutely irreducible and decomposed generic (Definition 4.3.1), and ρ̄(G_{F(ζ_p)}) enormous (Definition 6.2.29); (4) there is σ ∈ G_F − G_{F(ζ_p)} with ρ̄(σ) scalar, and p > n²; (5) there is a cuspidal automorphic π of GL_n(𝔸_F) with (a) π regular algebraic of weight λ satisfying λ_{τ,1} + λ_{τc,1} − λ_{τ,n} − λ_{τc,n} < p − 2n for all τ; (b) an isomorphism ι : ℚ̄_p → ℂ with ρ̄ ≅ r̄_ι(π) and HT_τ(ρ) = {λ_{ιτ,1} + n − 1, λ_{ιτ,2} + n − 2, …, λ_{ιτ,n}} for every τ : F ↪ ℚ̄_p; (c) π_v unramified for every v | p. Then ρ is automorphic: ρ ≅ r_ι(Π) for a cuspidal automorphic Π of GL_n(𝔸_F) of weight λ; moreover Π_v is unramified at every finite v with v | p or with ρ and π both unramified at v. (Remark 6.1.4, folded here: the image of Pρ̄ equals that of ad ρ̄, so the first half of (4) is equivalent to ζ_p ∉ F̄^{ker ad ρ̄}; when p is unramified in F it follows from the non-existence of a surjection (ad ρ̄)(G_F) ↠ (ℤ/pℤ)^×.)
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-lifting-descent; AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity; AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime; AutomorphicGaloisRepresentationsPartII:AG2.5; GlobalGaloisDeformations:G7; ModularityAndLanglandsExtensions:ML.1; PotentialAutomorphyInfrastructurePartII:PL.0; ArithmeticLocallySymmetricSpaces:ALS.5
Recorded gap: Owner contract for general unpolarized soluble automorphic descent

PotentialAutomorphyInfrastructure:PA.4/ordinary-automorphy-lifting
THEOREM TauCeti.PotentialAutomorphy.ordinary_automorphy_lifting
Let F be an imaginary CM or totally real field, c complex conjugation, p a prime, and ρ : G_F → GL_n(ℚ̄_p) continuous with: (1) ρ unramified almost everywhere; (2) for every v | p, ρ|_{G_{F_v}} is potentially semistable and ordinary with regular Hodge–Tate weights: there is λ ∈ (ℤ^n_+)^{Hom(F,ℚ̄_p)} such that for each v | p, ρ|_{G_{F_v}} ∼ an upper-triangular representation with diagonal characters ψ_{v,1}, …, ψ_{v,n} : G_{F_v} → ℚ̄_p^×, where ψ_{v,i} agrees on an open subgroup of I_{F_v} with σ ↦ ∏_{τ ∈ Hom(F_v, ℚ̄_p)} τ(Art_{F_v}^{-1}(σ))^{−(λ_{τ,n−i+1} + i − 1)}; (3) ρ̄ absolutely irreducible and decomposed generic, and ρ̄(G_{F(ζ_p)}) enormous; (4) there is σ ∈ G_F − G_{F(ζ_p)} with ρ̄(σ) scalar, and p > n; (5) there are a regular algebraic cuspidal automorphic π of GL_n(𝔸_F) and ι : ℚ̄_p → ℂ with π ι-ordinary and r̄_ι(π) ≅ ρ̄. Then ρ is ordinarily automorphic of weight ιλ: ρ ≅ r_ι(Π) for an ι-ordinary cuspidal automorphic Π of GL_n(𝔸_F) of weight ιλ; for finite v ∤ p with ρ and π unramified at v, Π_v is unramified. (Remark 6.1.3, folded here: the existence of Π forces λ to be conjugate self-dual up to twist, λ_{τ,i} + λ_{τc,n+1−i} = w for some w ∈ ℤ, by Clozel's purity lemma [Clo90, Lem. 4.9]; this is not assumed. The proof shows ρ contributes to the ordinary part of completed cohomology and gets Π by 'independence of weight'.)
Direct dependencies: PotentialAutomorphyInfrastructure:PA.4/ordinary-lifting-descent; AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity; AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime; AutomorphicGaloisRepresentationsPartII:AG2.5; GlobalGaloisDeformations:G7; PotentialAutomorphyInfrastructurePartII:PL.0; ModularityAndLanglandsExtensions:ML.1; ArithmeticLocallySymmetricSpaces:ALS.5
Recorded gap: Geraghty primary-source normalization check
Recorded gap: Owner contract for general unpolarized soluble automorphic descent

PotentialAutomorphyInfrastructure:PA.2/ordinary-local-global
THEOREM TauCeti.PotentialAutomorphy.ordinary_local_global
Assume the §5 standing hypotheses (F contains an imaginary quadratic field in which p splits; ϖ_{v^c} = ϖ_v^c) and [F^+:Q] > 1. Let K ⊂ GL_n(A_F^∞) be a good subgroup with K_v = Iw_v for each v ∈ S_p (and K_v = GL_n(O_{F_v}) for v ∉ S), let c ≥ b ≥ 0 be integers with c ≥ 1, let λ be a weight (printed λ ∈ (Z^n)^{Hom(F,E)}; the objects require λ ∈ (Z^n_+)^{Hom(F,E)}), and let 𝔪 ⊂ T^S(K(b,c),λ)^ord be a non-Eisenstein maximal ideal. Suppose (1) for every finite place v ∉ S with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or there is an imaginary quadratic F_0 ⊂ F in which l splits; (2) ρ̄_𝔪 is decomposed generic. Then there exist an integer N ≥ 1 depending only on [F^+:Q] and n, an ideal J ⊂ T^S(K(b,c),λ)^ord_𝔪 with J^N = 0, and a continuous ρ_𝔪: G_{F,S} → GL_n(T^S(K(b,c),λ)^ord_𝔪/J) such that: (a) for every finite v ∉ S, det(X − ρ_𝔪(Frob_v)) is the image of P_v(X); (b) for every v ∈ S_p and g ∈ G_{F_v}, det(X − ρ_𝔪(g)) = ∏_{i=1}^n (X − χ_{λ,v,i}(g)); (c) for every v ∈ S_p and g_1,…,g_n ∈ G_{F_v}, (ρ_𝔪(g_1) − χ_{λ,v,1}(g_1))(ρ_𝔪(g_2) − χ_{λ,v,2}(g_2))⋯(ρ_𝔪(g_n) − χ_{λ,v,n}(g_n)) = 0.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.2/all-degree-ordinary-characteristic-data; PotentialAutomorphyInfrastructure:PA.2/ordinary-level-control; PotentialAutomorphyInfrastructure:PA.2/finite-ordinary-weight-control; mathlib:Matrix.charpoly; PotentialAutomorphyInfrastructurePartII:PL.0
Recorded gap: Ordinary Satake-image polynomial-law transfer

PotentialAutomorphyInfrastructure:PA.0/integral-model-comparison
THEOREM TauCeti.PotentialAutomorphy.integral_model_comparison
For F CM, the GL_n space and the split-at-p unitary space with their arithmetic coefficient local systems, the groupoid derived-invariants, sheaf-cohomology and sufficiently-neat finite cellular models represent the same RΓ object. On a finite projective O coefficient lattice V, their derived reductions to O/varpi^m, pullback/trace at finite normal levels and Hecke away from S commute with these identifications. For a normal good neat level with finite quotient Δ and free cell action the cellular complex is finite free over O[Δ]. Before freeness is proved retain the groupoid model; no finite free assertion is made with nontrivial p-stabilizers.
Direct dependencies: ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model; ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change; ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action; mathlib:DerivedCategory.Q; ArithmeticLocallySymmetricSpaces:ALS.1
Recorded gap: Uniform arithmetic tower freeness and reconstruction

PotentialAutomorphyInfrastructure:PA.0/boundary-level-coefficient-comparison
THEOREM TauCeti.PotentialAutomorphy.boundary_level_coefficient_comparison
For the same finite-projective coefficient lattice and good compact levels, the compact-support → interior → Borel–Serre-boundary triangle commutes with derived reduction O→O/varpi^m and finite-level pullback/trace. Localizing at the paired GL_n/unitary non-Eisenstein ideals isolates the Siegel stratum, with the Satake action on each triangle map. Maps are constructed using the arithmetic correspondences and stratum comparison, not assumed merely because a retract exists.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.0/integral-model-comparison; ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle; ArithmeticLocallySymmetricSpaces:ALS.4/siegel-stratum-localization; ArithmeticLocallySymmetricSpaces:ALS.3/hecke-support-boundary-compatibility; ArithmeticLocallySymmetricSpaces:ALS.4

PotentialAutomorphyInfrastructure:PA.3/local-condition-mod-varpi-comparison
THEOREM TauCeti.PotentialAutomorphy.local_condition_mod_varpi_comparison
Under either full good-level hypothesis profile, choose pairwise distinct characters χ_{v,i}:k(v)×→O× at every v∈R, all congruent to 1 modulo varpi. The untwisted and χ-twisted coefficient complexes have a Hecke-equivariant derived isomorphism modulo varpi, and their finite local/global deformation rings reduce to the same deformation problem. At p the FL condition or the ordinary flag/determinant condition is identical on the two sides; away from p the R08.2 unipotent/inertial-type reductions supply the comparison. Framing conventions and coefficient maps are the same on both sides. The global determinant varies, as in the source deformation problems; the ordinary local determinant condition is retained. A separate globally fixed-determinant variant requires its own presentation and dimension counts.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.0/boundary-level-coefficient-comparison; LocalGaloisDeformationRings:R08.2/ihara-avoidance-components; LocalGaloisDeformationRings:L8/determinant-ordinary-ring; LocalGaloisDeformationRings:L7; LocalGaloisDeformationRings:L8; LocalGaloisDeformationRings:R08.2; GlobalGaloisDeformations:G8

PotentialAutomorphyInfrastructure:PA.3/arithmetic-component-dimension-input
THEOREM TauCeti.PotentialAutomorphy.arithmetic_component_dimension_input
For the FL or ordinary framed global problem and its χ-twist, tensor the local rings with the common framing/patching power-series variables. With q Taylor–Wiles places and g=qn−n²[F⁺:Q]≥0, the FL rings satisfy dim R∞=dim S∞−ℓ₀ and dim(R∞/varpi)=dim R∞−1, ℓ₀=n[F⁺:Q]−1. The maximal-dimensional mod-varpi generic points lift uniquely to maximal-dimensional characteristic-zero components as required by P9; the χ-twisted generic lifts are unique, and lower components satisfy the strict dimension bound in Assumption 6.3.6. In the ordinary case the same P9 comparisons apply after choosing the specified minimal prime of the torus Iwasawa algebra and using the L7 trivial-residual degree bound; this is not a classification of every ordinary component.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.3/local-condition-mod-varpi-comparison; LocalGaloisDeformationRings:R08.2/ihara-avoidance-components; LocalGaloisDeformationRings:R08.2/unrestricted-away-from-p; GlobalGaloisDeformations:G7/enormous-taylor-wiles-presentation; LocalGaloisDeformationRings:L7; LocalGaloisDeformationRings:L8; LocalGaloisDeformationRings:R08.2; GlobalGaloisDeformations:G7; GlobalGaloisDeformations:G8; DeformationAndDerivedPatchingAlgebra:P9

PotentialAutomorphyInfrastructure:PA.3/arithmetic-derived-support-contract
THEOREM TauCeti.PotentialAutomorphy.arithmetic_derived_support_contract
Given the imported P8 patched perfect complexes C∞,C∞′ for these two arithmetic towers, their common mod-varpi Hecke image and quotient deformation actions, and rational amplitude [q_patch,q_patch+ℓ₀] at every characteristic-zero augmentation point, the component input implies P9 Assumption 6.3.6. Consequently support of H*(C∞) contains each maximal-dimensional component, and an augmentation characteristic-zero point x is in the support of H*(C∞⊗^L_{S∞}S∞/(x∩S∞))[1/p] whenever its generic component is one of those components. This statement is conditional on the patching input; PA.4 constructs and verifies that input. The conclusion is reduced support, not an integral R=T isomorphism.
Hypothesis: Here q_patch=n(n−1)[F⁺:Q]/2+1 for the shifted dual complex; the rational GL_n cohomology lower degree is q_GL=q_patch−1. The abstract P9 parameter q₀ is q_patch in this application.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.3/arithmetic-component-dimension-input; mathlib:Module.support; DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-iff-support-eq-univ; DeformationAndDerivedPatchingAlgebra:P9

PotentialAutomorphyInfrastructure:PA.5/simple-galois-composita
THEOREM TauCeti.PotentialAutomorphy.simple_galois_composita
Let k be a field, Δ a finite simple group, and K_1, …, K_s finite Galois extensions of k inside a common field, each equal to k or with Galois group isomorphic to Δ. Then there is a subset J ⊂ {1, …, s} such that the compositum K = K_1⋯K_s is the compositum of the K_j with j ∈ J, and restriction identifies Gal(K/k) with ∏_{j∈J} Gal(K_j/k) ≅ Δ^{|J|}. In particular, for disjoint subsets I, I′ of J, the composita of the K_j over j ∈ I and over j ∈ I′ are linearly disjoint over k.
Direct dependencies: mathlib:Subgroup.goursat_surjective

PotentialAutomorphyInfrastructure:PA.5/symmetric-power-adjoint-genericity
THEOREM TauCeti.PotentialAutomorphy.symmetric_power_adjoint_genericity
Let F/Q be finite with normal closure F̃, m a positive integer, l > 2m + 3 a prime, and r̄: G_F → GL_2(F̄_l) continuous with r̄(G_{F̃}) ⊃ SL_2(F_l). Let F′/F be a finite extension linearly disjoint from F̄^{ker r̄} over F, with normal closure F̃′ over Q. If ad r̄(G_{F̃′}) ⊃ PSL_2(F_l), then Sym^m r̄|_{G_{F′}} is decomposed generic.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.5/simple-galois-composita; AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity; AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime; GlobalGaloisDeformations:G7
Recorded gap: Rank-two projective-group classification inputs

PotentialAutomorphyInfrastructure:PA.5/qian-symmetric-power-avoidance
THEOREM TauCeti.PotentialAutomorphy.qian_symmetric_power_avoidance
Let F/Q be a finite extension with normal closure F̃, n a positive integer, l > 2n + 5 a prime, and r̄: G_F → GL_2(F̄_l) a continuous representation with r̄(G_{F̃}) ⊃ SL_2(F_l). Put H = F̃ · F̄^{ker ad r̄}, and let H′ be the normal closure of H over Q. Let F_1/F be a finite Galois extension that is linearly disjoint from F̄^{ker r̄} over F and linearly disjoint from H′ over F. Then Sym^{n−1} r̄|_{G_{F_1}} is decomposed generic. For n = 1 this is immediate, since Sym^0 r̄ is the trivial character; for n ≥ 2 the proof rests on ACC+ Lemma 7.1.6(3) with m = n − 1.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.5/simple-galois-composita; PotentialAutomorphyInfrastructure:PA.5/symmetric-power-adjoint-genericity; AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity; AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime
Recorded gap: Rank-two projective-group classification inputs

PotentialAutomorphyInfrastructure:PA.5/genericity-normal-closure-restriction
THEOREM TauCeti.PotentialAutomorphy.genericity_normal_closure_restriction
Let F be a number field and r̄: G_F → GL_n(F̄_l) continuous, absolutely irreducible and decomposed generic. Let K/Q be a Galois extension linearly disjoint over Q from the Galois closure over Q of F̄^{ker r̄}(ζ_l). Then r̄|G_{FK} is absolutely irreducible and decomposed generic. In the proof of Theorem 1.4 this is applied with K = L′LF^suff(ζ_N), which is Galois over Q with K ∩ F^avoid = Q, and FK = F′. The paper asserts the disjointness for F′ itself, which is impossible because both fields contain F (correction E3).
Direct dependencies: AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity; AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime

PotentialAutomorphyInfrastructure:PA.5/residual-lifting-hypothesis-restriction
THEOREM TauCeti.PotentialAutomorphy.residual_lifting_hypothesis_restriction
Let F be a number field, l a prime, r: G_F → GL_n(Q̄_l) continuous with residual representation r̄, and M = F^{ker r̄}(ζ_l). Let F'/F be a finite extension linearly disjoint from M over F. Then G_{F'} surjects onto Gal(M/F), so r̄(G_{F'}) = r̄(G_F) and r̄(G_{F'(ζ_l)}) = r̄(G_{F(ζ_l)}). Consequently: r̄|G_{F'} is absolutely irreducible if r̄ is; r̄(G_{F'(ζ_l)}) is enormous if r̄(G_{F(ζ_l)}) is; and if σ ∈ G_F − G_{F(ζ_l)} has r̄(σ) scalar, then some σ' ∈ G_{F'} − G_{F'(ζ_l)} has r̄(σ') = r̄(σ). If r is unramified almost everywhere, so is r|G_{F'}. Suppose r|G_{F_v} is potentially semistable and ordinary of weight λ_v (Definition 1.2). Then for each place w | v of F', r|G_{F'_w} is potentially semistable and ordinary of weight (λ_{v,τ'|F_v})_{τ'}, by the compatibility Art_{F_v} ∘ N_{F'_w/F_v} = (restriction) ∘ Art_{F'_w}. Decomposed genericity is not covered here; it needs ACC+ Lemma 7.1.7.
Direct dependencies: AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity; AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime; PotentialModularityAndCompatibleSystems:R24.5:operations

PotentialAutomorphyInfrastructure:PA.5/weak-automorphy-prime-to-set
DEFINITION WeaklyAutomorphicPrimeTo
For T a finite set of finite places disjoint from S, R is weakly automorphic of level prime to T if there are a regular algebraic cuspidal π of GL_n(𝔸_F) and ι : M ↪ ℂ such that for all but finitely many v ∉ S and for every v ∈ T, π_v is unramified and rec^T_{F_v}(π_v)(Frob_v) has characteristic polynomial ι(Q_v(X)); weakly automorphic means T = ∅.
Direct dependencies: PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data; PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates; AutomorphicGaloisRepresentationsPartII:AG2.6; PotentialModularityAndCompatibleSystems:R24.5:operations
API WeaklyAutomorphicPrimeTo.empty (characterisation)
At T=∅ this is weak automorphy.
API WeaklyAutomorphicPrimeTo.mono (relation)
For T′⊂T disjoint from S, a witness at T is a witness at T′.
API WeaklyAutomorphicPrimeTo.witness_at (projection)
Every v∈T is unramified for the witnessing π and has precisely the specified polynomial.
API WeaklyAutomorphicPrimeTo.automorphic_implies (compatibility)
An automorphic system is weakly automorphic prime to any finite T disjoint from S.
EXAMPLE WeaklyAutomorphicPrimeTo.empty_set (degenerate)
An automorphic system is weakly automorphic prime to ∅.
EXAMPLE WeaklyAutomorphicPrimeTo.singleton (characterisation)
At T={v₀}, a witness must match at v₀ even if v₀ lies in its finite almost-everywhere exception list.
EXAMPLE WeaklyAutomorphicPrimeTo.bad_set (non-example)
T∩S≠∅ is inadmissible; no unspecified Q_v at a bad place can witness the predicate.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.5/pure-weak-automorphy-upgrade
THEOREM TauCeti.PotentialAutomorphy.pure_weak_automorphy_upgrade
Let F be CM and R a very weakly compatible system of rank n that is weakly automorphic, via π, and pure of weight m. Then R is automorphic.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.5/weak-automorphy-prime-to-set; PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data; PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates; AutomorphicGaloisRepresentationsPartII:AG2.5; AutomorphicGaloisRepresentationsPartII:AG2.6; SmoothRepresentationsOfLocalGroups:SR.3
Recorded gap: Rational unpolarized base-change and local compatibility source leaves

PotentialAutomorphyInfrastructure:PA.5/density-one-crystalline-large-image
THEOREM TauCeti.PotentialAutomorphy.density_one_crystalline_large_image
Let R be a strongly irreducible very weakly compatible system of rank 2 over a number field F. The set L(R) of primes l not lying below any place of S such that r_λ is crystalline with Hodge–Tate weights H_τ and r̄_λ(G_{F̃}) contains a conjugate of SL_2(𝔽_l) for every λ | l (F̃ the Galois closure of F/ℚ) has Dirichlet density 1.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.5/rank-two-large-residual-image; PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data; PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates

PotentialAutomorphyInfrastructure:PA.5/rank-two-symmetric-power-transport
THEOREM TauCeti.PotentialAutomorphy.rank_two_symmetric_power_transport
For a very weakly compatible system R of rank 2 with H_τ = {0, m}, Sym^{n−1}R has representations Sym^{n−1}r_λ, weights {0, m, …, (n − 1)m} and determinant det^{n(n−1)/2}. Here n≥1. Regularity follows when m≠0; for m=0 and n>1 the Hodge multiset has repetitions. No automorphy or purity is inferred from the operation alone.
Direct dependencies: mathlib:Matrix.charpoly; PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data; PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates; PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems; PotentialModularityAndCompatibleSystems:R24.5:operations

PotentialAutomorphyInfrastructure:PA.5/rank-two-weight-zero
DEFINITION RankTwoWeightZero
For a rank-two compatible system with Hodge table H_τ, WeightZero means H_τ is the multiset {0,1} at every embedding τ. This is the BCGP automorphic-weight convention and differs from saying that the system is pure of weight 0. General system purity, regularity and strong irreducibility are imported from R24.5.
Direct dependencies: PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data; PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates
API RankTwoWeightZero.iff (characterisation)
Weight zero means ∀τ,H_τ={0,1} as multisets.
API RankTwoWeightZero.sum (relation)
Every Hodge multiset has sum 1.
API RankTwoWeightZero.regular (compatibility)
Its two Hodge weights are distinct, so the rank-two system is regular.
API RankTwoWeightZero.restriction (functoriality)
Pulling the Hodge table back along restriction of embeddings preserves weight zero.
EXAMPLE RankTwoWeightZero.standard (computation)
The constant table {0,1} has weight zero.
EXAMPLE RankTwoWeightZero.repeated_zero (non-example)
The constant table {0,0} does not have weight zero.
EXAMPLE RankTwoWeightZero.reversed (compatibility)
The table presented as {1,0} has weight zero because the weights are a multiset.

PotentialAutomorphyInfrastructure:PA.5/rank-two-odd
DEFINITION RankTwoOdd
For a rank-two system over a number field F, Odd means det r_λ(c_v)=−1 for every real place v and every coefficient place λ, where c_v is the complex-conjugation involution. At a field with no real places the condition is vacuous. With the actual involutions supplied, it is the determinant condition on the corresponding matrices; it is not trace zero without a coefficient-characteristic restriction.
Direct dependencies: mathlib:Matrix.charpoly; PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data; PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates; AutomorphicGaloisRepresentationsPartII:AG2.6; PotentialModularityAndCompatibleSystems:R24.5:operations
API RankTwoOdd.det_eq (projection)
For every real-place involution and coefficient member the determinant is −1.
API RankTwoOdd.conjugate (functoriality)
Changing the representative complex conjugation by conjugacy preserves the determinant equation.
API RankTwoOdd.no_real_places (simp)
If F has no real places the condition is true.
API RankTwoOdd.automorphic_weight_zero (compatibility)
The weight-zero cuspidal GL₂ system in BCGP’s setting is odd by the automorphic-system supplier.
EXAMPLE RankTwoOdd.split_involution (computation)
diag(1,−1) is odd.
EXAMPLE RankTwoOdd.identity (non-example)
The identity matrix over Q is not odd.
EXAMPLE RankTwoOdd.empty_real_places (degenerate)
An empty real-place family satisfies the determinant condition.
Recorded gap: Arithmetic signatures unavailable at the pinned baseline

PotentialAutomorphyInfrastructure:PA.5/rank-two-member-irreducibility-equivalence
THEOREM TauCeti.PotentialAutomorphy.rank_two_member_irreducibility_equivalence
For a rank-two weakly compatible system R, the following are equivalent: R is irreducible on a density-one set of rational primes; every r_λ is irreducible; at least one r_λ is irreducible. The assertion follows from the stronger extremely weak rank-two reducibility dichotomy over the same F, not from the existing R24.5 result restricted to Q.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.5/rank-two-reducibility-dichotomy; PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data; PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates

PotentialAutomorphyInfrastructure:PA.5/strong-irreducibility-symmetric-square
THEOREM TauCeti.PotentialAutomorphy.strong_irreducibility_symmetric_square
For an irreducible regular rank-two weakly compatible system R, strong irreducibility of R, irreducibility of Sym²R as a system, irreducibility of every Sym²r_λ, and irreducibility of some Sym²r_λ are equivalent. If they fail, R is induced from a compatible system of characters of a quadratic extension F′/F. Regularity excludes the Artin-up-to-twist case. The rank-three symmetric-square implication uses rank-two representation theory, not an assertion of general lambda-independence of rank-three systems.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.5/rank-two-system-trichotomy; PotentialAutomorphyInfrastructure:PA.5/rank-two-symmetric-power-transport; PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data; PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates

PotentialAutomorphyInfrastructure:PA.5/corrected-rank-two-large-image
THEOREM TauCeti.PotentialAutomorphy.corrected_rank_two_large_image
For a strongly irreducible rank-two weakly compatible system over F, there is a density-one set of rational primes l such that for every coefficient place λ|l, bar r_λ(G_{F̃}) contains a conjugate of SL₂(F_l). No regularity hypothesis is needed. This does not assert SL₂(O_M/λ). In the real-multiplication use of BCGP Lemma 9.2.2, a separate large-image argument is required from AbelianSurfacesPotentialModularity.
Direct dependencies: PotentialAutomorphyInfrastructure:PA.5/rank-two-large-residual-image; PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data; PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates
Recorded gap: Unramified forms of products of adjoint PGL₂

PotentialAutomorphyInfrastructure:PA.0/unitary-levi-weight-dictionary
DEFINITION UnitaryLeviWeight
For descending Levi rows λ_τ and λ_{τc} of length n and a chosen lift τ above an embedding of F⁺, define the unitary row by concatenating −reverse(λ_{τc}) with λ_τ. It is descending exactly when −λ_{τc,1}≥λ_{τ,1}. This is the character-lattice identification (2.2.2); it does not assert that the integral dual-Weyl lattice is the dual of the integral lattice of the dual weight.
Direct dependencies: Concrete categorical/finite data only.
API UnitaryLeviWeight.first_block (simp)
The i-th entry of the first block is −λ_{τc,n−i} with zero-based indexing.
API UnitaryLeviWeight.second_block (simp)
The i-th entry of the second block is λ_{τ,i}.
API UnitaryLeviWeight.dominant_iff (characterisation)
For descending input rows, dominance is equivalent to −λ_{τc,1}≥λ_{τ,1}.
API UnitaryLeviWeight.inverse (equivalence)
Recover λ_τ from the second block and λ_{τc} by negating and reversing the first block.
EXAMPLE UnitaryLeviWeight.rank_one (computation)
For λ_τ=(2), λ_{τc}=(−3), the unitary row is (3,2).
EXAMPLE UnitaryLeviWeight.zero (degenerate)
Zero Levi rows give the zero unitary row.
EXAMPLE UnitaryLeviWeight.rank_two (computation)
For λ_τ=(2,1), λ_{τc}=(−3,−4), the unitary row is (4,3,2,1).

END NAMED MATHEMATICAL OBLIGATIONS -/
