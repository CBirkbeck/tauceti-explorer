import Mathlib

/-!
# FreeGroupsFirstOrderTheory: representative target signatures

This file is not the roadmap. The roadmap is `FreeGroupsFirstOrderTheory.md` (the reader
document), which is definitive; this file is not exhaustive. It records light definitions with
real bodies over carriers that exist in Mathlib, and theorem signatures statable against the
pinned APIs, so that contributors and reviewers converge on names and signatures. Every proof is
`sorry`.

Design choices made explicit here:
* the language of groups is `groupLang` of FreeGroupsAndLimitGroups (Layer FG3), restated
  verbatim below so that this file elaborates on its own; coefficients from `A` are carried by
  free variables `A ⊕ P` interpreted through `Sum.elim c v`, with `c = FreeGroup.of` over `F(A)`;
* the quantifier classes are syntactic predicates on Mathlib's `BoundedFormula`, built from
  Mathlib's `IsExistential` and `IsUniversal`;
* equivalence over a structure is equality of realizations at all valuations;
* elementary equivalence and elementary embeddings are Mathlib's `ElementarilyEquivalent` and
  `ElementaryEmbedding`;
* decidability statements need `Primcodable` codes of formulas, which Mathlib lacks at the pin
  (FreeGroupsAndLimitGroups FG3 plans them); they, and every heavy construction (fundamental
  sequences, NTQ systems and their correcting extensions, induced and tight enveloping NTQ
  groups, configuration groups, MAX-equivalence, the decision trees, hyperbolic towers), are
  README targets and do not appear here.
-/

namespace TauCetiRoadmap.FreeGroupsFirstOrderTheory

open FirstOrder FirstOrder.Language

universe u v w

/-! ## The language of groups (FreeGroupsAndLimitGroups, Layer FG3) -/

/-- Function symbols of the language of groups (FreeGroupsAndLimitGroups FG3). -/
inductive GroupFunc : ℕ → Type
  | one : GroupFunc 0
  | inv : GroupFunc 1
  | mul : GroupFunc 2

/-- The first-order language of groups of FreeGroupsAndLimitGroups FG3. Coefficients are carried
by free variables interpreted through a map `c : A → G`. -/
def groupLang : FirstOrder.Language where
  Functions := GroupFunc
  Relations := fun _ => Empty

/-- Interpretation of a group symbol in a group. -/
def GroupFunc.eval {G : Type*} [Group G] : {n : ℕ} → GroupFunc n → (Fin n → G) → G
  | _, .one, _ => 1
  | _, .inv, x => (x 0)⁻¹
  | _, .mul, x => x 0 * x 1

/-- Every group is a structure for the language of groups. -/
instance groupStructure (G : Type*) [Group G] : groupLang.Structure G where
  funMap f x := GroupFunc.eval f x
  RelMap r _ := Empty.elim r

/-- The product of two terms of the language of groups. -/
def mulTerm {β : Type*} (t s : groupLang.Term β) : groupLang.Term β :=
  Term.func (L := groupLang) GroupFunc.mul ![t, s]

/-- The constant `1` as a term of the language of groups. -/
def oneTerm {β : Type*} : groupLang.Term β :=
  Term.func (L := groupLang) GroupFunc.one ![]

/-! ## Layer FO1: formulas over free groups and the two-block normal form -/

section FO1

variable {L : FirstOrder.Language.{u, v}} {α : Type w}

/-- `∀∃`-formulas: a block of universal quantifiers over an existential formula (FO1.1). -/
inductive IsForallExists : ∀ {n : ℕ}, L.BoundedFormula α n → Prop
  | of_isExistential {n : ℕ} {φ : L.BoundedFormula α n} (h : φ.IsExistential) :
      IsForallExists φ
  | all {n : ℕ} {φ : L.BoundedFormula α (n + 1)} (h : IsForallExists φ) :
      IsForallExists φ.all

/-- `∃∀`-formulas: a block of existential quantifiers over a universal formula (FO1.1). -/
inductive IsExistsForall : ∀ {n : ℕ}, L.BoundedFormula α n → Prop
  | of_isUniversal {n : ℕ} {φ : L.BoundedFormula α n} (h : φ.IsUniversal) :
      IsExistsForall φ
  | ex {n : ℕ} {φ : L.BoundedFormula α (n + 1)} (h : IsExistsForall φ) :
      IsExistsForall φ.ex

/-- Boolean combinations of `∀∃`-formulas (FO1.1). -/
inductive IsBoolCombAE : ∀ {n : ℕ}, L.BoundedFormula α n → Prop
  | falsum {n : ℕ} : IsBoolCombAE (⊥ : L.BoundedFormula α n)
  | of_isForallExists {n : ℕ} {φ : L.BoundedFormula α n} (h : IsForallExists φ) :
      IsBoolCombAE φ
  | not {n : ℕ} {φ : L.BoundedFormula α n} (h : IsBoolCombAE φ) : IsBoolCombAE φ.not
  | inf {n : ℕ} {φ ψ : L.BoundedFormula α n} (h₁ : IsBoolCombAE φ) (h₂ : IsBoolCombAE ψ) :
      IsBoolCombAE (φ ⊓ ψ)
  | sup {n : ℕ} {φ ψ : L.BoundedFormula α n} (h₁ : IsBoolCombAE φ) (h₂ : IsBoolCombAE ψ) :
      IsBoolCombAE (φ ⊔ ψ)

/-- `∃∀∃`-formulas: a block of existential quantifiers over a `∀∃`-formula (FO6.6). -/
inductive IsExistsForallExists : ∀ {n : ℕ}, L.BoundedFormula α n → Prop
  | of_isForallExists {n : ℕ} {φ : L.BoundedFormula α n} (h : IsForallExists φ) :
      IsExistsForallExists φ
  | ex {n : ℕ} {φ : L.BoundedFormula α (n + 1)} (h : IsExistsForallExists φ) :
      IsExistsForallExists φ.ex

theorem IsForallExists.isPrenex {n : ℕ} {φ : L.BoundedFormula α n} (h : IsForallExists φ) :
    φ.IsPrenex := by
  sorry

theorem IsExistsForall.isPrenex {n : ℕ} {φ : L.BoundedFormula α n} (h : IsExistsForall φ) :
    φ.IsPrenex := by
  sorry

theorem isForallExists_of_isQF {n : ℕ} {φ : L.BoundedFormula α n} (h : φ.IsQF) :
    IsForallExists φ :=
  IsForallExists.of_isExistential h.isExistential

theorem isExistsForall_of_isQF {n : ℕ} {φ : L.BoundedFormula α n} (h : φ.IsQF) :
    IsExistsForall φ :=
  IsExistsForall.of_isUniversal h.isUniversal

/-- Every `∃∀`-formula is equivalent, in every structure, to a Boolean combination of
`∀∃`-formulas (FO1.1, `IsExistsForall.exists_isBoolCombAE`). -/
theorem IsExistsForall.exists_isBoolCombAE {n : ℕ} {φ : L.BoundedFormula α n}
    (h : IsExistsForall φ) :
    ∃ ψ : L.BoundedFormula α n, IsBoolCombAE ψ ∧
      ∀ (M : Type w) [L.Structure M] (v : α → M) (xs : Fin n → M),
        φ.Realize v xs ↔ ψ.Realize v xs := by
  sorry

/-- Equivalence of formulas over a structure (FO1.2). -/
def EquivOver (M : Type*) [L.Structure M] {n : ℕ} (φ ψ : L.BoundedFormula α n) : Prop :=
  ∀ (v : α → M) (xs : Fin n → M), φ.Realize v xs ↔ ψ.Realize v xs

theorem EquivOver.refl (M : Type*) [L.Structure M] {n : ℕ} (φ : L.BoundedFormula α n) :
    EquivOver M φ φ :=
  fun _ _ => Iff.rfl

theorem EquivOver.symm {M : Type*} [L.Structure M] {n : ℕ} {φ ψ : L.BoundedFormula α n}
    (h : EquivOver M φ ψ) : EquivOver M ψ φ :=
  fun v xs => (h v xs).symm

theorem EquivOver.trans {M : Type*} [L.Structure M] {n : ℕ} {φ ψ χ : L.BoundedFormula α n}
    (h₁ : EquivOver M φ ψ) (h₂ : EquivOver M ψ χ) : EquivOver M φ χ :=
  fun v xs => (h₁ v xs).trans (h₂ v xs)

/-- Prenex normal form preserves equivalence over a nonempty structure (Mathlib's
`realize_toPrenex`). -/
theorem equivOver_toPrenex (M : Type*) [L.Structure M] [Nonempty M] {n : ℕ}
    (φ : L.BoundedFormula α n) : EquivOver M φ φ.toPrenex := by
  sorry

/-- `∀∃`-quantifier elimination for a structure (FO1.7, `HasAEQE`). -/
def HasAEQE (L : FirstOrder.Language.{u, v}) (M : Type*) [L.Structure M] : Prop :=
  ∀ (β : Type) (n : ℕ) (φ : L.BoundedFormula β n),
    ∃ ψ : L.BoundedFormula β n, IsBoolCombAE ψ ∧ EquivOver M φ ψ

/-- `∀∃`-quantifier elimination over a group with coefficients `c : A → G`: formulas with
parameters `P` and constants carried by the free variables `A` (FO1.7). -/
def HasAEQEOver {A : Type} (G : Type*) [Group G] (c : A → G) : Prop :=
  ∀ (P : Type) (n : ℕ) (φ : groupLang.BoundedFormula (A ⊕ P) n),
    ∃ ψ : groupLang.BoundedFormula (A ⊕ P) n, IsBoolCombAE ψ ∧
      ∀ (v : P → G) (xs : Fin n → G),
        φ.Realize (Sum.elim c v) xs ↔ ψ.Realize (Sum.elim c v) xs

/-- `HasAEQE` is invariant under elementary equivalence (FO1.7). -/
theorem HasAEQE.of_elementarilyEquivalent {M N : Type*} [L.Structure M] [L.Structure N]
    (h : HasAEQE L M) (hMN : L.ElementarilyEquivalent M N) : HasAEQE L N := by
  sorry

end FO1

section FO1Examples

variable {L : FirstOrder.Language.{u, v}} {α : Type w}

example (t s : L.Term (α ⊕ Fin 2)) : IsForallExists (t.bdEqual s).ex.all := by
  sorry

example (t s : L.Term (α ⊕ Fin 2)) : IsExistsForall (t.bdEqual s).all.ex := by
  sorry

/-- A non-example: `∃x∀y θ` is not a `∀∃`-formula. -/
example (t s : L.Term (α ⊕ Fin 2)) : ¬ IsForallExists (t.bdEqual s).all.ex := by
  sorry

/-- A non-example: `∀∃∀` is neither `∀∃` nor `∃∀`. -/
example (t s : L.Term (α ⊕ Fin 3)) :
    ¬ IsForallExists (t.bdEqual s).all.ex.all ∧ ¬ IsExistsForall (t.bdEqual s).all.ex.all := by
  sorry

/-- Over a nonabelian free group, `∀y (x y = y x)` is equivalent to `x = 1`. -/
example :
    EquivOver (FreeGroup (Fin 2))
      (BoundedFormula.all
        ((mulTerm (Term.var (Sum.inl 0)) (Term.var (Sum.inr 0))).bdEqual
          (mulTerm (Term.var (Sum.inr 0)) (Term.var (Sum.inl 0)))) :
        groupLang.BoundedFormula (Fin 1) 0)
      ((Term.var (Sum.inl 0)).bdEqual oneTerm) := by
  sorry

/-- The same formula over `ℤ` is equivalent to `⊤`, not to `x = 1`. -/
example :
    ¬ EquivOver (Multiplicative ℤ)
      (BoundedFormula.all
        ((mulTerm (Term.var (Sum.inl 0)) (Term.var (Sum.inr 0))).bdEqual
          (mulTerm (Term.var (Sum.inr 0)) (Term.var (Sum.inl 0)))) :
        groupLang.BoundedFormula (Fin 1) 0)
      ((Term.var (Sum.inl 0)).bdEqual oneTerm) := by
  sorry

/-- The trivial group has `∀∃`-quantifier elimination. -/
example : HasAEQE groupLang Unit := by
  sorry

end FO1Examples

/-! ## Layer FO6: the outer quantifier-elimination procedure

The parametric tree, the sets `True(Θ)_m` and the elimination of `∃∀∃`-formulas over `F(A)` are
README targets. The logical part of the outer procedure is statable for every structure. -/

section FO6

variable {L : FirstOrder.Language.{u, v}}

/-- Outer induction (FO6.8–FO6.10, non-effective form): in a nonempty structure, if every
`∃∀∃`-formula is equivalent to a Boolean combination of `∀∃`-formulas, then every formula is. -/
theorem hasAEQE_of_existsForallExists (M : Type*) [L.Structure M] [Nonempty M]
    (h : ∀ (β : Type) (n : ℕ) (φ : L.BoundedFormula β n), IsExistsForallExists φ →
      ∃ ψ : L.BoundedFormula β n, IsBoolCombAE ψ ∧ EquivOver M φ ψ) :
    HasAEQE L M := by
  sorry

end FO6

/-! ## Layer FO7: Tarski's theorems -/

section FO7

open scoped commutatorElement

/-- `∀∃`-quantifier elimination over a nonabelian free group of finite rank, with constants
(FO6.10 and FO7; the effective form is a README target). -/
theorem hasAEQEOver_freeGroup (A : Type) [Finite A] (hA : 1 < Nat.card A) :
    HasAEQEOver (FreeGroup A) (FreeGroup.of : A → FreeGroup A) := by
  sorry

/-- Tarski's problem: nonabelian free groups of finite rank are elementarily equivalent (FO7.4). -/
theorem elementarilyEquivalent_freeGroup (k l : ℕ) (hk : 2 ≤ k) (hl : 2 ≤ l) :
    groupLang.ElementarilyEquivalent (FreeGroup (Fin k)) (FreeGroup (Fin l)) := by
  sorry

/-- The standard embedding `F_k → F_ℓ` is elementary (FO7.5). -/
theorem exists_elementaryEmbedding_freeGroup (k l : ℕ) (hk : 2 ≤ k) (hkl : k ≤ l) :
    ∃ f : groupLang.ElementaryEmbedding (FreeGroup (Fin k)) (FreeGroup (Fin l)),
      ∀ x, f x = FreeGroup.map (Fin.castLE hkl) x := by
  sorry

/-- The relator `[a₁, b₁] ⋯ [a_g, b_g]` of the closed orientable surface of genus `g`. -/
def orientableRelator (g : ℕ) : FreeGroup (Fin g × Bool) :=
  ((List.finRange g).map fun i =>
    ⁅FreeGroup.of (i, false), FreeGroup.of (i, true)⁆).prod

/-- The fundamental group of the closed orientable surface of genus `g`. -/
abbrev ClosedOrientableSurfaceGroup (g : ℕ) : Type :=
  PresentedGroup {orientableRelator g}

/-- The relator `c₁² ⋯ c_g²` of the closed non-orientable surface of genus `g`. -/
def nonorientableRelator (g : ℕ) : FreeGroup (Fin g) :=
  ((List.finRange g).map fun i => FreeGroup.of i ^ 2).prod

/-- The fundamental group of the closed non-orientable surface of genus `g`. -/
abbrev ClosedNonorientableSurfaceGroup (g : ℕ) : Type :=
  PresentedGroup {nonorientableRelator g}

/-- Closed orientable surface groups of genus `≥ 2` are elementarily equivalent to `F₂`
(FO7.8). -/
theorem elementarilyEquivalent_orientableSurface (g : ℕ) (hg : 2 ≤ g) :
    groupLang.ElementarilyEquivalent (ClosedOrientableSurfaceGroup g) (FreeGroup (Fin 2)) := by
  sorry

/-- Closed non-orientable surface groups of genus `≥ 4` are elementarily equivalent to `F₂`
(FO7.8). -/
theorem elementarilyEquivalent_nonorientableSurface (g : ℕ) (hg : 4 ≤ g) :
    groupLang.ElementarilyEquivalent (ClosedNonorientableSurfaceGroup g) (FreeGroup (Fin 2)) := by
  sorry

/-- Negative control: the non-orientable surface group of genus 3 fails Vaught's sentence
(FO7.10). -/
theorem not_elementarilyEquivalent_nonorientableSurface_three :
    ¬ groupLang.ElementarilyEquivalent (ClosedNonorientableSurfaceGroup 3) (FreeGroup (Fin 2)) := by
  sorry

/-- Negative control: `ℤ` is not elementarily equivalent to `F₂` (FO7.10). -/
theorem not_elementarilyEquivalent_int :
    ¬ groupLang.ElementarilyEquivalent (Multiplicative ℤ) (FreeGroup (Fin 2)) := by
  sorry

/-- Negative control: `ℤ²` is not elementarily equivalent to `F₂` (FO7.9–FO7.10). -/
theorem not_elementarilyEquivalent_int_prod :
    ¬ groupLang.ElementarilyEquivalent (Multiplicative (ℤ × ℤ)) (FreeGroup (Fin 2)) := by
  sorry

/-- Lyndon's theorem in the form used by the negative control: in a free group, solutions of
`x² y² z² = 1` commute pairwise. -/
theorem commute_of_sq_mul_sq_mul_sq_eq_one {α : Type*} (x y z : FreeGroup α)
    (h : x ^ 2 * y ^ 2 * z ^ 2 = 1) : Commute x y ∧ Commute x z ∧ Commute y z := by
  sorry

example : ClosedOrientableSurfaceGroup 0 = PresentedGroup {(1 : FreeGroup (Fin 0 × Bool))} := by
  sorry

example (g : ℕ) (hg : 2 ≤ g) :
    groupLang.ElementarilyEquivalent (ClosedOrientableSurfaceGroup g)
      (ClosedOrientableSurfaceGroup 2) := by
  sorry

end FO7

/-!
## Targets stated in the README and absent here

The following are README targets whose carriers are not at the pins and so are not declared:
free lifts and the free lifting theorem (FO1); strict and well-aligned fundamental sequences,
canonical NTQ systems, the canonical embedding tree, generic families of NTQ systems,
normalization, correcting extensions, the parametrization theorem and its effective forms,
sufficient splittings and fundamental sequences modulo subgroups (FO2); reducing quotients,
MAX-equivalence, complete reducing systems, algebraic solutions and the bound `N(K, H)` (FO4);
complexity, induced NTQ systems, projective images, tight enveloping NTQ groups and configuration
groups (FO3); the `∀∃`-decision tree, its finiteness and correctness, the `∀∃` decider and the
decidability of the `∀∃`-theory, Sacerdote's theorem and the computable bound (FO5); the
parametric tree, `True(Θ)_m`, the elimination of `∃∀∃`-formulas, the block measure and the
effective outer procedure (FO6); the decision procedure, the decidability of `Th(F(A))`, uniform
coefficient-free elimination, extended hyperbolic towers and the classification of finitely
generated models, the necessary conditions and the double `F ∗_⟨w⟩ F` (FO7).
-/

end TauCetiRoadmap.FreeGroupsFirstOrderTheory
