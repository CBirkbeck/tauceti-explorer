import Mathlib

/-!
# PotentialAutomorphyInfrastructure: representative target signatures

README.md is the roadmap. This file records definitions, theorem signatures and
examples statable against the pinned APIs; it is not exhaustive. The arithmetic
comparisons use their suppliers' spaces, coefficient lattices and Galois carriers.

Chosen local uniformizers give unit/valuation coordinates. Left Levi cosets use
inverse-increasing shuffles; ordinary characters reverse labelled weights and
include the cyclotomic factor. The orientation character uses the rational norm
of a nonzero determinant. Integral duality remains derived; rational degree
reflection and the Hida weight shift are recorded separately.
-/

open CategoryTheory
open scoped BigOperators

namespace TauCetiRoadmap.PotentialAutomorphyInfrastructure

universe u v w

/-! ## Layer 0: Integral coefficients and boundary comparison -/

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

/-- For every r, f_A(r) followed by i equals i followed by f_B(r). -/
theorem inclusion_comm (h : EquivariantRetract A B fA fB) (r : I) :
    fA r ≫ h.i = h.i ≫ fB r := by sorry
/-- For every r, f_B(r) followed by the retraction equals the retraction followed by f_A(r). -/
theorem retraction_comm (h : EquivariantRetract A B fA fB) (r : I) :
    fB r ≫ h.toRetract.r = h.toRetract.r ≫ fA r := by sorry

/-- A functor carries the retract to the image retract, with the image endomorphisms; it preserves both commuting equations. -/
def map {D : Type*} [Category D] (h : EquivariantRetract A B fA fB) (F : C ⥤ D) :
    EquivariantRetract (F.obj A) (F.obj B)
      (fun r => F.map (fA r)) (fun r => F.map (fB r)) := by sorry

/-- The endomorphism of B given by retraction followed by inclusion is an idempotent commuting with every action operator. -/
theorem idempotent (h : EquivariantRetract A B fA fB) :
    (h.toRetract.r ≫ h.i) ≫ (h.toRetract.r ≫ h.i) = h.toRetract.r ≫ h.i ∧
      ∀ r, fB r ≫ (h.toRetract.r ≫ h.i) = (h.toRetract.r ≫ h.i) ≫ fB r := by sorry

/-- Identity inclusion and retraction give an equivariant retract for any indexed action on A; forgetting it gives Retract.refl A. -/
def refl (A : C) (f : I → (A ⟶ A)) : EquivariantRetract A A f f := by sorry

/-- Two equivariant retracts for the same objects and indexed actions are equal if their inclusion and retraction maps are equal. -/
theorem ext (h h' : EquivariantRetract A B fA fB)
    (hi : h.i = h'.i) (hr : h.toRetract.r = h'.toRetract.r) : h = h' := by sorry

/-- EquivariantRetract.identity: Identity maps on A give an equivariant retract of A into itself. -/
example (A : C) (f : I → (A ⟶ A)) :
    ∃ h : EquivariantRetract A A f f, h.i = 𝟙 A ∧ h.toRetract.r = 𝟙 A := by sorry
/-- EquivariantRetract.forget_identity: The forgotten retract of the identity construction is Mathlib Retract.refl. -/
example (A : C) (f : I → (A ⟶ A)) :
    (refl A f).toRetract = Retract.refl A := by sorry
/-- EquivariantRetract.incompatible_actions: Identity inclusion/retraction cannot form an equivariant retract between Z with multiplication-by-1 and multiplication-by-2 as the same indexed operator. -/
example : ¬ ∃ h : EquivariantRetract (C := Type) ℤ ℤ
    (fun _ : Unit => ↾(fun z : ℤ => z)) (fun _ : Unit => ↾(fun z : ℤ => 2 * z)),
      h.i = 𝟙 ℤ ∧ h.toRetract.r = 𝟙 ℤ := by sorry
end EquivariantRetract

/-- The sign and reversal in the unitary/Siegel coefficient dictionary. -/
def UnitaryLeviWeight {n : ℕ} (a b : Fin n → ℤ) : Fin (n + n) → ℤ :=
  Fin.addCases (fun i => -b i.rev) a
namespace UnitaryLeviWeight
variable {n : ℕ} (a b : Fin n → ℤ)
/-- The i-th entry of the first block is −λ_{τc,n−1−i} for 0≤i<n with zero-based indexing. -/
theorem first_block (i : Fin n) : UnitaryLeviWeight a b (Fin.castAdd n i) = -b i.rev := by sorry
/-- The i-th entry of the second block is λ_{τ,i}. -/
theorem second_block (i : Fin n) : UnitaryLeviWeight a b (Fin.natAdd n i) = a i := by sorry
/-- For descending input rows, dominance is equivalent to −λ_{τc,1}≥λ_{τ,1}. -/
theorem dominant_iff (hn : 0 < n) (ha : Antitone a) (hb : Antitone b) :
    Antitone (UnitaryLeviWeight a b) ↔ -b ⟨0, hn⟩ ≥ a ⟨0, hn⟩ := by sorry
/-- Recover λ_τ from the second block and λ_{τc} by negating and reversing the first block. -/
theorem inverse :
    (fun i => UnitaryLeviWeight a b (Fin.natAdd n i)) = a ∧
    (fun i => -UnitaryLeviWeight a b (Fin.castAdd n i.rev)) = b := by sorry
/-- UnitaryLeviWeight.rank_one: For λ_τ=(2), λ_{τc}=(−3), the unitary row is (3,2). -/
example : UnitaryLeviWeight ![(2 : ℤ)] ![(-3 : ℤ)] = ![(3 : ℤ), 2] := by sorry
/-- UnitaryLeviWeight.zero: Zero Levi rows give the zero unitary row. -/
example : UnitaryLeviWeight (0 : Fin n → ℤ) 0 = 0 := by sorry
/-- UnitaryLeviWeight.rank_two: For λ_τ=(2,1), λ_{τc}=(−3,−4), the unitary row is (4,3,2,1). -/
example : UnitaryLeviWeight ![(2 : ℤ), 1] ![(-3 : ℤ), -4] = ![(4 : ℤ), 3, 2, 1] := by sorry
end UnitaryLeviWeight

/-! ## Layer 1: Fontaine–Laffaille compatibility -/

/-- Inverse-increasing shuffles, hence representatives for LEFT Levi cosets. -/
def KostantShuffle (n : ℕ) :=
  {w : Equiv.Perm (Fin (n + n)) //
    StrictMono (fun i : Fin n => w.symm (Fin.castAdd n i)) ∧
    StrictMono (fun i : Fin n => w.symm (Fin.natAdd n i))}

namespace KostantShuffle
variable {n : ℕ}
/-- The underlying permutation lies in S_{2n}. -/
def val (s : KostantShuffle n) : Equiv.Perm (Fin (n + n)) := s.1

/-- Count pairs i < j for which w(j) < w(i); this fixes the permutation length. -/
def inversionCount (w : Equiv.Perm (Fin (n + n))) : ℕ :=
  (Finset.univ.filter fun ij : Fin (n + n) × Fin (n + n) =>
    ij.1 < ij.2 ∧ w ij.2 < w ij.1).card

/-- Length is the cardinality of {(i,j):i<j and w(j)<w(i)}. -/
def length (s : KostantShuffle n) : ℕ := inversionCount s.val

/-- Membership is precisely strict increase of the inverse on each of the two Levi blocks. -/
theorem mem_iff (w : Equiv.Perm (Fin (n + n))) :
    (∃ s : KostantShuffle n, s.val = w) ↔
      StrictMono (fun i : Fin n => w.symm (Fin.castAdd n i)) ∧
      StrictMono (fun i : Fin n => w.symm (Fin.natAdd n i)) := by sorry

/-- The shuffle is the unique minimum-length representative of its left Levi coset. -/
theorem minimal_representative (w : Equiv.Perm (Fin (n + n))) :
    (∃! s : KostantShuffle n, ∃ v : Equiv.Perm (Fin (n + n)),
      (∀ i, (v i).val < n ↔ i.val < n) ∧ w = v * s.val) ∧
    (∀ (s : KostantShuffle n) (v : Equiv.Perm (Fin (n + n))),
      (∀ i, (v i).val < n ↔ i.val < n) → s.length ≤ inversionCount (v * s.val)) := by sorry

/-- KostantShuffle.rank_one: For n=1 the two shuffles have lengths 0 and 1. -/
example : ∃ s₀ s₁ : KostantShuffle 1,
    s₀.length = 0 ∧ s₁.length = 1 ∧ ∀ s, s = s₀ ∨ s = s₁ := by sorry
/-- KostantShuffle.rank_zero: For n=0 the unique shuffle has length 0. -/
example : ∃! s : KostantShuffle 0, s.length = 0 := by sorry
/-- KostantShuffle.block_swap: The permutation exchanging the two blocks, preserving order inside each block, is a shuffle of length n². -/
example (n : ℕ) : ∃ s : KostantShuffle n,
    s.val = (finAddFlip : Fin (n + n) ≃ Fin (n + n)) ∧ s.length = n ^ 2 := by sorry
/-- KostantShuffle.internal_swap: For n=2 the transposition (0 1) is not a shuffle. -/
example : ¬ ∃ s : KostantShuffle 2,
    s.val = Equiv.swap (0 : Fin 4) 1 := by sorry
end KostantShuffle

/-- The CTG predicate on the computed Levi-weight table, testing every shuffle
and every constant conjugate sum. -/
def CTGWeight {W Emb : Type*} {n : ℕ} (c : Emb → Emb)
    (μ : W → Emb → Fin n → ℤ) : Prop :=
  ∀ w a, ∃ τ, (fun i => μ w τ i + μ w (c τ) i.rev) ≠ fun _ => a

namespace CTGWeight
variable {W Emb : Type*} {n : ℕ} {c : Emb → Emb} {μ : W → Emb → Fin n → ℤ}
/-- CTG is equivalent to ∀w,a, ∃τ,i, μ(w,τ,i)+μ(w,τc,n−1−i)≠a. -/
theorem iff_witness : CTGWeight c μ ↔
    ∀ w a, ∃ τ i, μ w τ i + μ w (c τ) i.rev ≠ a := by sorry
/-- Equivariant bijections of embeddings and bijections of W preserve the predicate. -/
theorem reindex {W' Emb' : Type*} (eW : W' ≃ W) (eE : Emb' ≃ Emb)
    (c' : Emb' → Emb') (hc : ∀ τ, eE (c' τ) = c (eE τ)) :
    CTGWeight c' (fun w τ i => μ (eW w) (eE τ) i) ↔ CTGWeight c μ := by sorry
/-- If one w and a give that same constant vector at every τ, the table is not CTG. -/
theorem not_parallel (w : W) (a : ℤ)
    (h : ∀ τ i, μ w τ i + μ w (c τ) i.rev = a) : ¬ CTGWeight c μ := by sorry
/-- CTGWeight.zero: For nonempty W the zero table is not CTG, including rank zero. -/
example [Nonempty W] : ¬ CTGWeight (W := W) (n := n) c (fun _ _ _ => 0) := by sorry
/-- CTGWeight.empty_w: With W empty the predicate is true. -/
example {Emb : Type*} {n : ℕ} (c : Emb → Emb) (μ : Empty → Emb → Fin n → ℤ) :
    CTGWeight c μ := by sorry
/-- CTGWeight.rank_one_pair: For n=1, one w and embeddings a,aᶜ,b,bᶜ, with μ(a)=0, μ(aᶜ)=0, μ(b)=1, μ(bᶜ)=0, the table is CTG: the conjugate sums are 0 and 1. -/
example : CTGWeight (n := 1)
    (fun τ : Bool × Bool => (τ.1, !τ.2))
    (fun (_ : Unit) (τ : Bool × Bool) (_ : Fin 1) =>
      if τ.1 && !τ.2 then 1 else 0) := by sorry
end CTGWeight

/-- Separated integer partitions are recovered from the original and shifted
unions (ACC Lemma 4.5.2, p. 989). -/
theorem shifted_partition_recovery (A B C D : Finset ℤ) (m : ℕ) (hm : 0 < m)
    (hA : A.card = m) (hB : B.card = m) (hC : C.card = m) (hD : D.card = m)
    (hsep : ∀ c ∈ C, ∀ d ∈ D, d < c) (h₀ : A ∪ B = C ∪ D)
    (h₁ : A.image (fun a => a + 1) ∪ B = C.image (fun c => c + 1) ∪ D)
    (hcard₀ : (A ∪ B).card = 2 * m)
    (hcard₁ : (A.image (fun a => a + 1) ∪ B).card = 2 * m) :
    A = C ∧ B = D := by sorry

/-- For n=2 and [F⁺:Q]=2, d=8 and the rational range [2,5] reflects to
[3,6]. The dual lower degree is qGL+1, not qGL. -/
example : (Finset.Icc (2 : ℤ) 5).image (fun i => 8 - i) = Finset.Icc 3 6 := by
  sorry

/-! ## Layer 2: Soluble transport and rank-two compatible systems -/

/-- BCGP's weight-zero condition is a MULTISET equality with {0,1}. -/
def RankTwoWeightZero {Emb : Type*} (H : Emb → Multiset ℤ) : Prop :=
  ∀ τ, H τ = {0, 1}
namespace RankTwoWeightZero
variable {Emb : Type*} {H : Emb → Multiset ℤ}
/-- Weight zero means ∀τ,H_τ={0,1} as multisets. -/
theorem iff : RankTwoWeightZero H ↔ ∀ τ, H τ = {0, 1} := by sorry
/-- Every Hodge multiset has sum 1. -/
theorem sum (h : RankTwoWeightZero H) (τ : Emb) : (H τ).sum = 1 := by sorry
/-- Its two Hodge weights are distinct, so the rank-two system is regular. -/
theorem regular (h : RankTwoWeightZero H) (τ : Emb) : (H τ).Nodup := by sorry
/-- Pulling the Hodge table back along restriction of embeddings preserves weight zero. -/
theorem restriction {Emb' : Type*} (res : Emb' → Emb) (h : RankTwoWeightZero H) :
    RankTwoWeightZero (H ∘ res) := by sorry
/-- RankTwoWeightZero.standard: The constant table {0,1} has weight zero. -/
example : RankTwoWeightZero (fun _ : Unit => ({0, 1} : Multiset ℤ)) := by sorry
/-- RankTwoWeightZero.repeated_zero: The constant table {0,0} does not have weight zero. -/
example : ¬ RankTwoWeightZero (fun _ : Unit => ({0, 0} : Multiset ℤ)) := by sorry
/-- RankTwoWeightZero.reversed: The table presented as {1,0} has weight zero because the weights are a multiset. -/
example : RankTwoWeightZero (fun _ : Unit => ({1, 0} : Multiset ℤ)) := by sorry
end RankTwoWeightZero

/-- The determinant condition for oddness on a supplied family of real-place
complex-conjugation matrices, over characteristic-zero coefficients. -/
def RankTwoOdd {I R : Type*} [CommRing R] [CharZero R] (A : I → Matrix (Fin 2) (Fin 2) R) : Prop :=
  ∀ i, Matrix.det (A i) = -1
namespace RankTwoOdd
variable {I R : Type*} [CommRing R] [CharZero R] {A : I → Matrix (Fin 2) (Fin 2) R}
/-- For every real-place involution and coefficient member the determinant is −1. -/
theorem det_eq (h : RankTwoOdd A) (i : I) : Matrix.det (A i) = -1 := by sorry
/-- Changing the representative complex conjugation by conjugacy preserves the determinant equation. -/
theorem conjugate (P Q : Matrix (Fin 2) (Fin 2) R) (hPQ : P * Q = 1) (hQP : Q * P = 1) :
    RankTwoOdd (fun i => P * A i * Q) ↔ RankTwoOdd A := by sorry
/-- If F has no real places the condition is true. -/
theorem no_real_places (A : Empty → Matrix (Fin 2) (Fin 2) R) : RankTwoOdd A := by sorry
/-- RankTwoOdd.split_involution: diag(1,−1) is odd. -/
example : RankTwoOdd (fun _ : Unit => (!![(1 : ℚ), 0; 0, -1])) := by sorry
/-- RankTwoOdd.identity: The identity matrix over Q is not odd. -/
example : ¬ RankTwoOdd (fun _ : Unit => (1 : Matrix (Fin 2) (Fin 2) ℚ)) := by sorry
/-- RankTwoOdd.empty_real_places: An empty real-place family satisfies the determinant condition. -/
example (A : Empty → Matrix (Fin 2) (Fin 2) ℚ) : RankTwoOdd A := by sorry
end RankTwoOdd

/-- For roots 2 and 3, Sym² has roots 4,6,9 and determinant 216=6³. -/
example : Matrix.det (Matrix.diagonal ![(4 : ℚ), 6, 9]) = (2 * 3 : ℚ) ^ 3 := by sorry

/-- With m=0 and n=3, the symmetric-power Hodge multiset has repeated zero
weights. This example belongs to Layer 2 and excludes an automatic regularity claim. -/
example : ¬ (0 ::ₘ (0 ::ₘ (0 ::ₘ (0 : Multiset ℤ)))).Nodup := by sorry


/-! ## Layer 3: Ordinary cohomology and compatibility -/

/-- Valuation splitting of the diagonal torus after uniformizers are chosen. -/
abbrev SplitTorus (n : ℕ) (U : Type*) := (Fin n → U) × Multiplicative (Fin n → ℤ)

/-- The valuation cone for contraction of the upper unipotent subgroup. This
algebraic monoid in chosen unit/valuation coordinates records the local part of
ACC §5.2.1; topology, adelic factors and derived actions are stated in README.md. -/
def PositiveTorusMonoid (n : ℕ) (U : Type*) [CommGroup U] :
    Submonoid (SplitTorus n U) where
  carrier := {t | ∀ i j, i < j → t.2.toAdd j ≤ t.2.toAdd i}
  one_mem' := by sorry
  mul_mem' := by sorry

namespace PositiveTorusMonoid
variable {n : ℕ} {U : Type*} [CommGroup U]
/-- For a diagonal torus element, contraction of upper unipotents is equivalent to valuation(t_i)≥valuation(t_j) for i<j. -/
theorem mem_iff (t : SplitTorus n U) :
    t ∈ PositiveTorusMonoid n U ↔ ∀ i j, i < j → t.2.toAdd j ≤ t.2.toAdd i := by sorry

/-- The exponent row (n−1,n−2,…,0) gives a contracting element for the chosen
local uniformizer. ACC's rational-p element has this row multiplied by v(p). -/
def contractingElement (n : ℕ) (U : Type*) [CommGroup U] : SplitTorus n U :=
  (1, Multiplicative.ofAdd (fun i => (n : ℤ) - 1 - i.val))

/-- The row (n−1,n−2,…,0) belongs to the positive cone. -/
theorem contractingElement_mem :
    contractingElement n U ∈ PositiveTorusMonoid n U := by sorry
/-- Every diagonal unit belongs to the cone, and zero valuations recover the compact torus. -/
theorem unit_subgroup (u : Fin n → U) :
    (u, Multiplicative.ofAdd (0 : Fin n → ℤ)) ∈ PositiveTorusMonoid n U := by sorry
/-- Componentwise products preserve the valuation cone. -/
theorem mul (a b : SplitTorus n U) (ha : a ∈ PositiveTorusMonoid n U)
    (hb : b ∈ PositiveTorusMonoid n U) : a * b ∈ PositiveTorusMonoid n U := by sorry
/-- PositiveTorusMonoid.rank_one: For n=1 all diagonal torus elements are positive. -/
example (t : SplitTorus 1 U) : t ∈ PositiveTorusMonoid 1 U := by sorry
/-- PositiveTorusMonoid.rank_two_positive: The exponent row (1,0) is positive. -/
example : ((1 : Fin 2 → U), Multiplicative.ofAdd ![(1 : ℤ), 0]) ∈
    PositiveTorusMonoid 2 U := by sorry
/-- PositiveTorusMonoid.rank_two_negative: The exponent row (0,1) is not positive for the upper-triangular Borel. -/
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
/-- On units u its scalar is ∏τ,i τ(u_i)^{λ_{τ,i}}. -/
theorem unit_eval (u : Fin n → U) :
    LowestWeightCharacter n σ lam (u, Multiplicative.ofAdd 0) =
      ∏ τ, ∏ i, σ τ (u i) ^ lam τ i := by sorry
/-- It is 1 on every chosen diagonal uniformizer power. -/
theorem uniformizer_eval (a : Fin n → ℤ) :
    LowestWeightCharacter n σ lam (1, Multiplicative.ofAdd a) = 1 := by sorry
/-- The character for λ+μ is the product of the two characters. -/
theorem add (μ : Emb → Fin n → ℤ) (t : SplitTorus n U) :
    LowestWeightCharacter n σ (lam + μ) t =
      LowestWeightCharacter n σ lam t * LowestWeightCharacter n σ μ t := by sorry
/-- LowestWeightCharacter.zero: The zero weight gives the trivial character. -/
example (t : SplitTorus n U) : LowestWeightCharacter n σ 0 t = 1 := by sorry
/-- LowestWeightCharacter.rank_one_square: For one embedding, rank one and weight 2, a unit u acts by τ(u)². -/
example (σ : Unit → U →* Rˣ) (u : U) :
    LowestWeightCharacter 1 σ (fun _ _ => 2)
      ((fun _ => u), Multiplicative.ofAdd 0) = σ () u ^ (2 : ℤ) := by sorry
/-- LowestWeightCharacter.uniformizer_normalization: Even for nonzero λ, chosen uniformizers act by 1, not by their algebraic λ-power. -/
example (a : Fin n → ℤ) :
    LowestWeightCharacter n σ lam (1, Multiplicative.ofAdd a) = 1 := by sorry
end LowestWeightCharacter

/-- The admissible pairs `(b, c)` of ACC §5.1, `c ≥ b ≥ 0` and `c ≥ 1`, indexing the level
tower `K(b,c) ⊂ K`. Only the local factor `Iw_v(b,c)` at a place `v ∣ p` is typed, over a
commutative ring `O` with an element `ϖ`; the good subgroup `K(b,c)` of `GL_n(𝔸_F^∞)`, equal
to `K` away from `p`, uses Layer 0 for its adelic comparison. -/
structure IwahoriLevelTower where
  b : ℕ
  c : ℕ
  b_le_c : b ≤ c
  one_le_c : 1 ≤ c

namespace IwahoriLevelTower
variable {O : Type*} [CommRing O] (ϖ : O) (n : ℕ)

/-- `Iw_v(b,c)`: matrices in `GL_n(O)` that are upper triangular modulo `ϖ^c` and whose diagonal
entries are congruent to `1` modulo `ϖ^b`. -/
def level (t : IwahoriLevelTower) : Subgroup (GL (Fin n) O) where
  carrier := {g | (∀ i j : Fin n, j < i →
      (g : Matrix (Fin n) (Fin n) O) i j ∈ Ideal.span {ϖ ^ t.c}) ∧
    ∀ i, (g : Matrix (Fin n) (Fin n) O) i i - 1 ∈ Ideal.span {ϖ ^ t.b}}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry


/-- `K(0,c)/K(b,c) ≅ T_n(O/ϖ^b)` for `O` local, as `O_{F_v}` is: reducing the diagonal entries
modulo `ϖ^b` is a surjective homomorphism on `Iw_v(0,c)` with kernel `Iw_v(b,c)`. -/
theorem diamondQuotient [IsLocalRing O] (t : IwahoriLevelTower) :
    ∃ f : level ϖ n ⟨0, t.c, Nat.zero_le _, t.one_le_c⟩ →*
        (Fin n → (O ⧸ Ideal.span {ϖ ^ t.b})ˣ),
      Function.Surjective f ∧
      f.ker = (level ϖ n t).subgroupOf (level ϖ n ⟨0, t.c, Nat.zero_le _, t.one_le_c⟩) ∧
      ∀ g i, ((f g i : (O ⧸ Ideal.span {ϖ ^ t.b})ˣ) : O ⧸ Ideal.span {ϖ ^ t.b}) =
        Ideal.Quotient.mk _ (((g : GL (Fin n) O) : Matrix (Fin n) (Fin n) O) i i) := by sorry


/-- IwahoriLevelTower.base: K(0,1)=K. -/
example : (level ϖ n ⟨0, 1, Nat.zero_le 1, le_rfl⟩ : Set (GL (Fin n) O)) =
    {g | (Matrix.GeneralLinearGroup.map (Ideal.Quotient.mk (Ideal.span {ϖ})) g :
      Matrix (Fin n) (Fin n) (O ⧸ Ideal.span {ϖ})).BlockTriangular id} := by sorry
/-- IwahoriLevelTower.zero_b: For b=0 the diamond quotient is trivial. -/
example (c : ℕ) (hc : 1 ≤ c) :
    Subsingleton (level ϖ n ⟨0, c, Nat.zero_le c, hc⟩ ⧸
      (level ϖ n ⟨0, c, Nat.zero_le c, hc⟩).subgroupOf (level ϖ n ⟨0, c, Nat.zero_le c, hc⟩)) ∧
    Subsingleton (Fin n → (O ⧸ Ideal.span {ϖ ^ 0})ˣ) := by sorry
/-- IwahoriLevelTower.deep_unipotent: For b=1 a diagonal unit not congruent to 1 modulo varpi_v is excluded even though it belongs to K(0,c). -/
example (c : ℕ) (hc : 1 ≤ c) (u : Oˣ) (hu : (u : O) - 1 ∉ Ideal.span {ϖ}) :
    let g : GL (Fin 2) O := Units.map
      (Matrix.diagonalRingHom (Fin 2) O : (Fin 2 → O) →* Matrix (Fin 2) (Fin 2) O)
      (MulEquiv.piUnits.symm ![u, 1])
    g ∈ level ϖ 2 ⟨0, c, Nat.zero_le c, hc⟩ ∧ g ∉ level ϖ 2 ⟨1, c, hc, hc⟩ := by sorry

/-- Over a field, a nonzero congruence parameter generates the unit ideal:
every level is the full matrix group. Arithmetic uniformizers are nonunits. -/
example {K : Type*} [Field K] (ϖ : K) (hϖ : ϖ ≠ 0) (n : ℕ)
    (t : IwahoriLevelTower) : level ϖ n t = ⊤ := by sorry
end IwahoriLevelTower

/-- `ʳW^P = ∏_{v̄ ∈ S̄_p} ʳW^P_v̄`: one Kostant shuffle for each `p`-adic place `v̄` of `F⁺`. -/
def RelativeBruhatCells (P : Type*) (n : ℕ) := P → KostantShuffle n

namespace RelativeBruhatCells
variable {P : Type*} {n : ℕ}

/-- The relative length `l_r`. -/
def relLength [Fintype P] (w : RelativeBruhatCells P n) : ℕ := ∑ v, (w v).length

/-- The absolute length `l`: the image of `w` in `∏_τ S_{2n}`, `τ` running over the `d v`
embeddings above `v`, has the component `w v` at each such `τ`. -/
def absLength [Fintype P] (d : P → ℕ) (w : RelativeBruhatCells P n) : ℕ :=
  ∑ τ : (v : P) × Fin (d v), KostantShuffle.inversionCount (w τ.1).val

/-- `S_w` (`R = ⊤`) and `S_w°` (`R v` the valuation ring) inside `∏_v GL_{2n}(K v)`: at each place
`P w N(R)`, with `P` the Siegel parabolic (lower-left block zero), `w` the permutation matrix
`e_j ↦ e_{w j}` and `N(R)` the upper unitriangular matrices with entries in `R`. -/
def cell {K : P → Type*} [∀ v, Field (K v)] (R : ∀ v, Subring (K v))
    (w : RelativeBruhatCells P n) : Set (∀ v, GL (Fin (n + n)) (K v)) :=
  Set.univ.pi fun v => {g | ∃ p u : GL (Fin (n + n)) (K v),
    (∀ i j : Fin n,
      (p : Matrix (Fin (n + n)) (Fin (n + n)) (K v)) (Fin.natAdd n i) (Fin.castAdd n j) = 0) ∧
    (∀ i j, j < i → (u : Matrix (Fin (n + n)) (Fin (n + n)) (K v)) i j = 0) ∧
    (∀ i, (u : Matrix (Fin (n + n)) (Fin (n + n)) (K v)) i i = 1) ∧
    (∀ i j, (u : Matrix (Fin (n + n)) (Fin (n + n)) (K v)) i j ∈ R v) ∧
    (g : Matrix (Fin (n + n)) (Fin (n + n)) (K v)) =
      (p : Matrix (Fin (n + n)) (Fin (n + n)) (K v)) *
        Matrix.of (fun i j => if i = (w v).val j then 1 else 0) *
        (u : Matrix (Fin (n + n)) (Fin (n + n)) (K v))}

/-- Relative length sums one inversion count per p-adic place; absolute length multiplies each by its local degree. -/
theorem lengths [Fintype P] (d : P → ℕ) (w : RelativeBruhatCells P n) :
    relLength w = ∑ v, KostantShuffle.inversionCount (w v).val ∧
      absLength d w = ∑ v, d v * (w v).length := by sorry

/-- The union of cells of relative length ≥i is open. -/
theorem open_union [Fintype P] {K : P → Type*} [∀ v, NontriviallyNormedField (K v)] (i : ℕ) :
    IsOpen (⋃ (w : RelativeBruhatCells P n) (_ : i ≤ relLength w),
      cell (fun v => (⊤ : Subring (K v))) w) := by sorry

/-- The longest shuffle has absolute length n²[F⁺:Q] and relative length n²#S̄_p. -/
theorem longest [Fintype P] (d : P → ℕ) :
    ∃ w₀ : RelativeBruhatCells P n,
      (∀ v, (w₀ v).val = (finAddFlip : Fin (n + n) ≃ Fin (n + n))) ∧
      relLength w₀ = n ^ 2 * Fintype.card P ∧ absLength d w₀ = n ^ 2 * ∑ v, d v ∧
      ∀ w : RelativeBruhatCells P n, relLength w ≤ relLength w₀ ∧
        absLength d w ≤ absLength d w₀ := by sorry

/-- RelativeBruhatCells.rank_one: A single split GL₂ factor has relative cell lengths 0 and 1. -/
example : Set.range (relLength (P := Unit) (n := 1)) = {0, 1} ∧
    Set.range (absLength (P := Unit) (n := 1) (fun _ => 1)) = {0, 1} := by sorry
/-- RelativeBruhatCells.identity_cell: The identity representative has both lengths zero. -/
example [Fintype P] (d : P → ℕ) : ∃ w : RelativeBruhatCells P n,
    (∀ v, (w v).val = 1) ∧ relLength w = 0 ∧ absLength d w = 0 := by sorry
/-- RelativeBruhatCells.degree_two_place: For one p-adic place of local degree 2 and n=1, longest relative length is 1 but absolute length is 2. -/
example : ∃ w₀ : RelativeBruhatCells Unit 1,
    (∀ w : RelativeBruhatCells Unit 1, relLength w ≤ relLength w₀) ∧
      relLength w₀ = 1 ∧ absLength (fun _ => 2) w₀ = 2 := by sorry
end RelativeBruhatCells

/-- `χ_{λ,v,i} ∘ Art_{F_v}` in the coordinates `F_vˣ ≅ O_{F_v}ˣ × ϖ_v^ℤ` (`Uo × Multiplicative ℤ`),
for `i : Fin n` (ACC's index `i + 1`): `ε` is `ε ∘ Art_{F_v}`, `σ τ` the embeddings on units,
`δ i` the diamond character `u ↦ ⟨diag(1,…,u,…,1)⟩`, and `U j` the operator `U_{v,j}` (`U 0 = 1`).
Continuity and the passage to `G_{F_v}` need local class field theory. -/
noncomputable def OrdinaryGaloisCharacters {Emb Uo T : Type*} [Fintype Emb] [CommGroup Uo]
    [CommRing T] (n : ℕ) (σ : Emb → Uo →* Tˣ) (lam : Emb → Fin n → ℤ)
    (ε : Uo × Multiplicative ℤ →* Tˣ) (δ : Fin n → Uo →* Tˣ) (U : ℕ → Tˣ) (i : Fin n) :
    Uo × Multiplicative ℤ →* Tˣ where
  toFun t := ε t ^ (-(i : ℤ)) * (∏ τ, σ τ t.1 ^ (-lam τ i.rev)) * δ i t.1 *
    (U (i + 1) / U i) ^ Multiplicative.toAdd t.2
  map_one' := by sorry
  map_mul' := by sorry

namespace OrdinaryGaloisCharacters
variable {Emb Uo T : Type*} [Fintype Emb] [CommGroup Uo] [CommRing T] {n : ℕ}
variable (σ : Emb → Uo →* Tˣ) (lam : Emb → Fin n → ℤ) (ε : Uo × Multiplicative ℤ →* Tˣ)
variable (δ : Fin n → Uo →* Tˣ) (U : ℕ → Tˣ)

/-- On Art(u), χ_i=ε^{1−i}∏τ τ(u)^{−λ_{τ,n−i+1}} times the i-th diamond character. -/
theorem on_units (i : Fin n) (u : Uo) :
    OrdinaryGaloisCharacters n σ lam ε δ U i (u, 1) =
      ε (u, 1) ^ (-(i : ℤ)) * (∏ τ, σ τ u ^ (-lam τ i.rev)) * δ i u := by sorry

/-- At `Art(ϖ_v)`: `ε^{1-(i+1)} = ε^{-i}` times `U_{v,i+1}/U_{v,i}`. -/
theorem on_uniformizer (i : Fin n) :
    OrdinaryGaloisCharacters n σ lam ε δ U i (1, Multiplicative.ofAdd 1) =
      ε (1, Multiplicative.ofAdd 1) ^ (-(i : ℤ)) * (U (i + 1) / U i) := by sorry

/-- Unit values and the value at the chosen uniformizer determine a character
in unit/valuation coordinates, before applying local reciprocity. -/
theorem unique_from_units_and_uniformizer
    (χ ψ : Uo × Multiplicative ℤ →* Tˣ)
    (hu : ∀ u, χ (u, 1) = ψ (u, 1))
    (hϖ : χ (1, Multiplicative.ofAdd 1) = ψ (1, Multiplicative.ofAdd 1)) :
    χ = ψ := by sorry

/-- Replacing ϖ by u₀ϖ changes the uniformizer value by its unit-character
factor. The valuation k can be negative, so all character values are units. -/
theorem coordinate_uniformizer_change (i : Fin n) (u u₀ : Uo) (k : ℤ) :
    OrdinaryGaloisCharacters n σ lam ε δ U i (u * u₀ ^ k, Multiplicative.ofAdd k) =
      OrdinaryGaloisCharacters n σ lam ε δ U i (u, 1) *
        (OrdinaryGaloisCharacters n σ lam ε δ U i (u₀, 1) *
          OrdinaryGaloisCharacters n σ lam ε δ U i (1, Multiplicative.ofAdd 1)) ^ k := by
  sorry

/-- With unit character u↦u and uniformizer value 2, the new uniformizer
3ϖ has value 6. Holding the old operator eigenvalue fixed would give 2. -/
example (U : ℕ → ℚˣ) (h₀ : U 0 = 1)
    (h₁ : (U 1 : ℚ) = 2) (u₀ : ℚˣ) (hu₀ : (u₀ : ℚ) = 3) :
    (OrdinaryGaloisCharacters 1 (fun _ : Unit => (1 : ℚˣ →* ℚˣ)) 0 1
      (fun _ => MonoidHom.id ℚˣ) U 0 (u₀, Multiplicative.ofAdd 1) : ℚ) = 6 := by
  sorry


/-- OrdinaryGaloisCharacters.rank_one: For n=1, χ₁(Art(varpi_v))=U_{v,1}. -/
example (σ : Emb → Uo →* Tˣ) (lam : Emb → Fin 1 → ℤ) (δ : Fin 1 → Uo →* Tˣ) (hU : U 0 = 1) :
    OrdinaryGaloisCharacters 1 σ lam ε δ U 0 (1, Multiplicative.ofAdd 1) = U 1 := by sorry
/-- OrdinaryGaloisCharacters.determinant: The product of the n uniformizer values is ε^{n(1−n)/2}U_{v,n}. -/
example (hU : U 0 = 1) :
    ∏ i, OrdinaryGaloisCharacters n σ lam ε δ U i (1, Multiplicative.ofAdd 1) =
      ε (1, Multiplicative.ofAdd 1) ^ ((n : ℤ) * (1 - n) / 2) * U n := by sorry
/-- OrdinaryGaloisCharacters.weight_reversal: For rank 2 with λ=(2,0), the algebraic unit factors are 1 for χ₁ and u^{-2} for χ₂ before ε and diamonds; using λ_i instead of λ_{n−i+1} reverses them. -/
example (σ : Unit → Uo →* Tˣ) (u : Uo) :
    OrdinaryGaloisCharacters 2 σ (fun _ => ![2, 0]) 1 1 U 0 (u, 1) = 1 ∧
    OrdinaryGaloisCharacters 2 σ (fun _ => ![2, 0]) 1 1 U 1 (u, 1) = σ () u ^ (-2 : ℤ) ∧
    OrdinaryGaloisCharacters 2 σ (fun _ => ![0, 2]) 1 1 U 0 (u, 1) = σ () u ^ (-2 : ℤ) ∧
    OrdinaryGaloisCharacters 2 σ (fun _ => ![0, 2]) 1 1 U 1 (u, 1) = 1 := by sorry
end OrdinaryGaloisCharacters

/-- `χ_w(t) = a(t)⁻¹ / |a(t)|_p` for the character `a(t) = N det(Ad(t^w) | Lie U ∩ wNw⁻¹)` of
ACC §5.3, supplied as an actual homomorphism `a : G →* ℚ_[p]ˣ`; `|·|_p` is Mathlib's
`ℚ`-valued `p`-adic norm. Computing `a` from `w` needs the Lie algebra of `Res G̃`. -/
noncomputable def BruhatOrientationCharacter {p : ℕ} [Fact p.Prime] {G : Type*} [Group G]
    (a : G →* ℚ_[p]ˣ) (t : G) : ℚ_[p] :=
  (a t : ℚ_[p])⁻¹ / ((padicNormE (a t : ℚ_[p]) : ℚ) : ℚ_[p])

namespace BruhatOrientationCharacter
variable {p : ℕ} [Fact p.Prime] {G : Type*} [Group G]

/-- For a(t)=N det Ad(t^w) on the indicated unipotent Lie space, χ_w(t)=a(t)^{-1}/|a(t)|_p. -/
theorem formula (a : G →* ℚ_[p]ˣ) (t : G) :
    BruhatOrientationCharacter a t = (a t : ℚ_[p])⁻¹ * (p : ℚ_[p]) ^ (a t : ℚ_[p]).valuation ∧
      ‖BruhatOrientationCharacter a t‖ = 1 := by sorry

/-- The determinant is a unit of Q_p, hence nonzero; its rational p-adic norm
remains nonzero after the injective rational inclusion into Q_p. -/
theorem norm_denominator_ne_zero (a : G →* ℚ_[p]ˣ) (t : G) :
    ((padicNormE (a t : ℚ_[p]) : ℚ) : ℚ_[p]) ≠ 0 := by sorry


/-- BruhatOrientationCharacter.zero_lie: For a zero-dimensional unipotent Lie space, χ_w=1. -/
example (t : G) : BruhatOrientationCharacter (1 : G →* ℚ_[p]ˣ) t = 1 := by sorry
/-- BruhatOrientationCharacter.one_unit: For a one-dimensional rational root with Ad scalar u∈Z_p×, χ_w(u)=u^{-1}. -/
example (u : ℚ_[p]ˣ) (hu : ‖(u : ℚ_[p])‖ = 1) :
    BruhatOrientationCharacter (MonoidHom.id ℚ_[p]ˣ) u = (u : ℚ_[p])⁻¹ := by sorry
/-- BruhatOrientationCharacter.one_uniformizer: For the same rational root with scalar p, χ_w(p)=1 because the p-adic norm factor cancels p^{-1}. -/
example (t : ℚ_[p]ˣ) (ht : (t : ℚ_[p]) = p) :
    BruhatOrientationCharacter (MonoidHom.id ℚ_[p]ˣ) t = 1 := by sorry

/-- At p=2, the rational unit −1 still has orientation value −1; reducing
the sign to the residue-field unit group would lose this information. -/
example (t : ℚ_[2]ˣ) (ht : (t : ℚ_[2]) = -1) :
    BruhatOrientationCharacter (MonoidHom.id ℚ_[2]ˣ) t = -1 := by sorry
end BruhatOrientationCharacter

/-! ## Layer 4: Arithmetic deformation and support inputs -/

namespace WeightIndependentHidaTwist
/-- The row ν_i=i−1 in one-based indexing; it enters the inverse Hida twist. -/
def nu (n : ℕ) : Fin n → ℤ := fun i => i.val
/-- WeightIndependentHidaTwist.rank_one_zero: For n=1, μ=0, ν=0 so the twist is trivial. -/
example : nu 1 + (fun i : Fin 1 => (0 : ℤ)) = 0 := by sorry
/-- WeightIndependentHidaTwist.rank_two_zero: For n=2, μ=0, ν=(0,1) and the twist is O(0,1)^{-1}, not the trivial character. -/
example : nu 2 + (fun i : Fin 2 => (0 : ℤ)) = ![(0 : ℤ), 1] := by sorry
/-- WeightIndependentHidaTwist.rank_two_weight: For μ=(2,0), ν+w₀μ=(0,3), fixing both the reversal and ν shift. -/
example : nu 2 + (fun i : Fin 2 => (![(2 : ℤ), 0]) i.rev) = ![(0 : ℤ), 3] := by sorry
end WeightIndependentHidaTwist

/-! ## Layer 5: Arithmetic patching and automorphy lifting -/

namespace TaylorWilesArithmeticLevels
variable {O : Type*} [CommRing O] (ϖ : O) (n p : ℕ)

/-- `∏_{i=1}^{n} (1 + q + ⋯ + q^{i-1})`, the number of complete flags in `𝔽_q^n`. -/
def flagCount (q n : ℕ) : ℕ := ∏ i ∈ Finset.range n, ∑ j ∈ Finset.range (i + 1), q ^ j

/-- At `v ∈ Q`: the pair `(K₀(Q)_v, K₁(Q)_v)`, with `K₀(Q)_v = Iw_v = Iw_v(0,1)` and `K₁(Q)_v` the
kernel of `Iw_v → T_n(k(v)) → T_n(k(v))(p) = Δ_v`: its reduced diagonal entries are killed by the
prime-to-`p` part of `#k(v)ˣ`. That this is the maximal pro-prime-to-`p` subgroup (residue
characteristic `≠ p`) is profinite group theory and is not stated. -/
def at_auxiliary : Subgroup (GL (Fin n) O) × Subgroup (GL (Fin n) O) :=
  (IwahoriLevelTower.level ϖ n ⟨0, 1, Nat.zero_le 1, le_rfl⟩,
    { carrier := {g | g ∈ IwahoriLevelTower.level ϖ n ⟨0, 1, Nat.zero_le 1, le_rfl⟩ ∧
        ∀ i, Ideal.Quotient.mk (Ideal.span {ϖ}) ((g : Matrix (Fin n) (Fin n) O) i i) ^
          ordCompl[p] (Nat.card (O ⧸ Ideal.span {ϖ})ˣ) = 1}
      one_mem' := by sorry
      mul_mem' := by sorry
      inv_mem' := by sorry })

/-- `K₀(Q)_v / K₁(Q)_v ≅ Δ_v = (k(v)ˣ(p))^n`: a surjection from `Iw_v` with kernel `K₁(Q)_v`. -/
theorem diamond_quotient [IsLocalRing O] [Finite (O ⧸ Ideal.span {ϖ})] [Fact p.Prime] :
    ∃ f : (at_auxiliary ϖ n p).1 →*
        (Fin n → CommGroup.primaryComponent (O ⧸ Ideal.span {ϖ})ˣ p),
      Function.Surjective f ∧
      f.ker = (at_auxiliary ϖ n p).2.subgroupOf (at_auxiliary ϖ n p).1 := by sorry

end TaylorWilesArithmeticLevels

/-- The auxiliary levels `K₀(Q) ⊃ K₁(Q)` as families of local factors over the finite places
`ι`: `K_v` at `v ∉ Q` and `at_auxiliary` at `v ∈ Q`. The restricted product forming the good
subgroups of `GL_n(𝔸_F^∞)` and the Hecke maps (6.5.6), (6.5.7) use the arithmetic comparison of Layer 0. -/
def TaylorWilesArithmeticLevels {ι : Type*} [DecidableEq ι] {O : ι → Type*}
    [∀ v, CommRing (O v)] (ϖ : ∀ v, O v) (n p : ℕ) (K : ∀ v, Subgroup (GL (Fin n) (O v)))
    (Q : Finset ι) :
    (∀ v, Subgroup (GL (Fin n) (O v))) × (∀ v, Subgroup (GL (Fin n) (O v))) :=
  (fun v => if v ∈ Q then (TaylorWilesArithmeticLevels.at_auxiliary (ϖ v) n p).1 else K v,
    fun v => if v ∈ Q then (TaylorWilesArithmeticLevels.at_auxiliary (ϖ v) n p).2 else K v)

namespace TaylorWilesArithmeticLevels
variable {ι : Type*} {O : ι → Type*} [∀ v, CommRing (O v)] (ϖ : ∀ v, O v) (n p : ℕ)

/-- Both auxiliary levels equal K_v at every v∉Q, including v∈S. -/
theorem away [DecidableEq ι] (K : ∀ v, Subgroup (GL (Fin n) (O v))) (Q : Finset ι) (v : ι)
    (hv : v ∉ Q) :
    (TaylorWilesArithmeticLevels ϖ n p K Q).1 v = K v ∧
      (TaylorWilesArithmeticLevels ϖ n p K Q).2 v = K v := by sorry

/-- The scalar `[K : K₀(Q)] = ∏_{v ∈ Q} [GL_n(O_v) : Iw_v]`, each local index being the number of
complete flags over `k(v)`; for Taylor–Wiles places `q_v ≡ 1 mod p` it is `≡ (n!)^{#Q} mod p`.
Pullback followed by trace is multiplication by this scalar in Layer 0's cohomology. -/
theorem trace_scalar [∀ v, IsLocalRing (O v)] (Q : Finset ι)
    (hϖ : ∀ v ∈ Q, IsLocalRing.maximalIdeal (O v) = Ideal.span {ϖ v})
    (hfin : ∀ v ∈ Q, Finite (O v ⧸ Ideal.span {ϖ v}))
    (hq : ∀ v ∈ Q, Nat.card (O v ⧸ Ideal.span {ϖ v}) ≡ 1 [MOD p]) :
    (∀ v ∈ Q, (IwahoriLevelTower.level (ϖ v) n ⟨0, 1, Nat.zero_le 1, le_rfl⟩).index =
      flagCount (Nat.card (O v ⧸ Ideal.span {ϖ v})) n) ∧
    ∏ v ∈ Q, flagCount (Nat.card (O v ⧸ Ideal.span {ϖ v})) n ≡ n.factorial ^ Q.card [MOD p] := by
  sorry

/-- TaylorWilesArithmeticLevels.empty: For Q=∅ both levels equal K and the diamond group is trivial. -/
example [DecidableEq ι] (K : ∀ v, Subgroup (GL (Fin n) (O v))) :
    TaylorWilesArithmeticLevels ϖ n p K ∅ = (K, K) ∧
      Subsingleton ((v : (∅ : Finset ι)) → Fin n →
        CommGroup.primaryComponent (O v ⧸ Ideal.span {ϖ v})ˣ p) := by sorry
/-- TaylorWilesArithmeticLevels.single_prime: For Q={v}, n=2 and p>2 the trace scalar is 2 modulo p, hence a unit. -/
example (q : ℕ) (hp : p.Prime) (hp2 : 2 < p) (hq : q ≡ 1 [MOD p]) :
    flagCount q 2 ≡ 2 [MOD p] ∧ Nat.Coprime (flagCount q 2) p := by sorry
end TaylorWilesArithmeticLevels

/-- With q_v=3 and ordered roots 2,5, the Fontaine–Laffaille second
eigenvalue is 10/3, while the ordinary second eigenvalue is 10. -/
example : (3 : ℚ) ^ (-1 : ℤ) * 2 * 5 = 10 / 3 ∧ (2 : ℚ) * 5 = 10 := by sorry


/-
Arithmetic signatures using supplier carriers:
LocalOrdinaryParts; ArithmeticOrdinarySummand; CompletedArithmeticCohomology;
CompletedOrdinaryCohomology; UnitaryOrdinaryTower; UnitaryCompletedBoundary;
BruhatCellInduction; BruhatUnipotentInvariants; DeterminantTorus; OrdinaryHidaComplex;
TaylorWilesSelectedIdeals; WeightIndependentHidaTwist; OrdinaryTaylorWilesLevels;
IotaOrdinary; OrdinarilyAutomorphic; WeaklyAutomorphicPrimeTo.
The local Iwahori, Taylor–Wiles, weight-table, character and oddness declarations
above also require their arithmetic adapters. coefficient_satake_descent,
fontaine_laffaille_local_global, ordinary_local_global, both patching verifications,
fontaine_laffaille_automorphy_lifting, ordinary_automorphy_lifting,
auxiliary_cm_extension_prescriptions and the soluble
transport and compatible-system theorems are stated in README.md.
-/

end TauCetiRoadmap.PotentialAutomorphyInfrastructure
