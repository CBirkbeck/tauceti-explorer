/-
Independent review REV-K2SymbolsBrauer--T.1, 2026-09-24.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

This is a PARTIAL suggested file, not an implementation or a compiled result.
The packet and campaign document are the specification. Proofs marked `sorry`
are unproved. In particular, no result below is claimed to have been formalised.

The original self-target comparison maps and theorem statements `True` have
been removed. Relations and central-extension predicates below have actual
bodies. Missing supplier interfaces are listed at the end, not replaced by
unconstrained types or propositions. The central-extension predicates use
surjective group homomorphisms and reuse the existing group/kernel interfaces;
they do not replace Mathlib's GroupExtension, Section, Splitting or Equiv.
-/
import Mathlib.Algebra.Group.Commutator
import Mathlib.Algebra.Group.TypeTags.Basic
import Mathlib.Algebra.RingQuot
import Mathlib.GroupTheory.GroupExtension.Defs
import Mathlib.GroupTheory.IsPerfect
import Mathlib.GroupTheory.PresentedGroup
import Mathlib.GroupTheory.Subgroup.Center
import Mathlib.LinearAlgebra.TensorAlgebra.Basic

noncomputable section
universe u

namespace TauCeti.Steinberg

/-- An actual root generator, including the distinct-index condition. -/
structure Gen (n : ℕ) (R : Type u) where
  i : Fin n
  j : Fin n
  hij : i ≠ j
  val : R

def word {n : ℕ} {R : Type u} (i j : Fin n) (hij : i ≠ j) (r : R) :
    FreeGroup (Gen n R) := FreeGroup.of ⟨i, j, hij, r⟩

/-- Relator words. Opposite roots are deliberately NOT a commutator case.
In the last constructor the coefficient order is -s*r, not -r*s. -/
inductive Relator (n : ℕ) (R : Type u) [Ring R] : FreeGroup (Gen n R) → Prop
  | add (i j : Fin n) (hij : i ≠ j) (r s : R) :
      Relator n R (word i j hij r * word i j hij s * (word i j hij (r + s))⁻¹)
  | disjoint (i j k l : Fin n) (hij : i ≠ j) (hkl : k ≠ l)
      (hjk : j ≠ k) (hil : i ≠ l) (r s : R) :
      Relator n R ⁅word i j hij r, word k l hkl s⁆
  | chain (i j k : Fin n) (hij : i ≠ j) (hjk : j ≠ k) (hik : i ≠ k) (r s : R) :
      Relator n R (⁅word i j hij r, word j k hjk s⁆ * (word i k hik (r * s))⁻¹)
  | reverse (i j k : Fin n) (hij : i ≠ j) (hki : k ≠ i) (hkj : k ≠ j) (r s : R) :
      Relator n R (⁅word i j hij r, word k i hki s⁆ * (word k j hkj (-s * r))⁻¹)

/-- The presented group is exposed as St_n only in the stated rank range. -/
abbrev Steinberg (n : ℕ) (_hn : 3 ≤ n) (R : Type u) [Ring R] :=
  PresentedGroup {w : FreeGroup (Gen n R) | Relator n R w}

def x {R : Type u} [Ring R] {n : ℕ} (hn : 3 ≤ n)
    {i j : Fin n} (hij : i ≠ j) (r : R) : Steinberg n hn R :=
  PresentedGroup.of ⟨i, j, hij, r⟩

@[simp] theorem x_zero {R : Type u} [Ring R] {n : ℕ} (hn : 3 ≤ n)
    {i j : Fin n} (hij : i ≠ j) : x hn hij (0 : R) = 1 := by sorry

theorem x_add {R : Type u} [Ring R] {n : ℕ} (hn : 3 ≤ n)
    {i j : Fin n} (hij : i ≠ j) (r s : R) :
    x hn hij r * x hn hij s = x hn hij (r + s) := by sorry

theorem commutator_chain {R : Type u} [Ring R] {n : ℕ} (hn : 3 ≤ n)
    {i j k : Fin n} (hij : i ≠ j) (hjk : j ≠ k) (hik : i ≠ k) (r s : R) :
    ⁅x hn hij r, x hn hjk s⁆ = x hn hik (r * s) := by sorry

theorem commutator_reverse {R : Type u} [Ring R] {n : ℕ} (hn : 3 ≤ n)
    {i j k : Fin n} (hij : i ≠ j) (hki : k ≠ i) (hkj : k ≠ j) (r s : R) :
    ⁅x hn hij r, x hn hki s⁆ = x hn hkj (-s * r) := by sorry

/-- This is a theorem target, not an instance asserting a finished proof. -/
theorem finite_rank_perfect {R : Type u} [Ring R] {n : ℕ} (hn : 3 ≤ n) :
    Group.IsPerfect (Steinberg n hn R) := by sorry

-- Tests for the actual presentation. These are obligations, not checked proofs.
example {R : Type u} [Ring R] {n : ℕ} (hn : 3 ≤ n)
    {i j : Fin n} (hij : i ≠ j) (r : R) :
    (x hn hij r)⁻¹ = x hn hij (-r) := by sorry

example {R : Type u} [Ring R] {n : ℕ} (hn : 3 ≤ n)
    {i j k l : Fin n} (hij : i ≠ j) (hkl : k ≠ l)
    (hjk : j ≠ k) (hil : i ≠ l) (r s : R) :
    ⁅x hn hij r, x hn hkl s⁆ = 1 := by sorry

example {R : Type u} [Ring R] {n : ℕ} (hn : 3 ≤ n)
    {i j k : Fin n} (hij : i ≠ j) (hjk : j ≠ k) (hik : i ≠ k) (r : R) :
    ⁅x hn hij r, x hn hjk (1 : R)⁆ = x hn hik r := by sorry

section CentralExtensions
variable {G X : Type u} [Group G] [Group X]

/-- Centrality alone does not assert surjectivity. -/
def IsCentral (f : X →* G) : Prop := f.ker ≤ Subgroup.center X

def IsCentralExtension (f : X →* G) : Prop :=
  Function.Surjective f ∧ IsCentral f

/-- Initiality among central extensions, in a fixed universe. The commuting
triangle is part of the type, not an extra promised assertion. -/
def IsUniversalCentralExtension (f : X →* G) : Prop :=
  IsCentralExtension f ∧
    ∀ (Y : Type u) [Group Y] (g : Y →* G), IsCentralExtension g →
      ∃! h : X →* Y, g.comp h = f

theorem hom_unique_of_perfect [Group.IsPerfect X] {Y : Type u} [Group Y]
    (f : X →* G) (g : Y →* G) (hg : IsCentralExtension g)
    (a b : X →* Y) (ha : g.comp a = f) (hb : g.comp b = f) : a = b := by sorry

theorem uce_source_perfect (f : X →* G) (hf : IsUniversalCentralExtension f) :
    Group.IsPerfect X := by sorry

theorem uce_target_perfect (f : X →* G) (hf : IsUniversalCentralExtension f) :
    Group.IsPerfect G := by sorry

/-- The splitting criterion includes centrality of f as a hypothesis. -/
theorem uce_of_splitting [Group.IsPerfect X] (f : X →* G)
    (hf : IsCentralExtension f)
    (hs : ∀ (Y : Type u) [Group Y] (g : Y →* X), IsCentralExtension g →
      ∃ s : X →* Y, g.comp s = MonoidHom.id X) :
    IsUniversalCentralExtension f := by sorry

-- Three central-extension tests.
example : IsCentralExtension (MonoidHom.id G) := by sorry
example (A : Type u) [CommGroup A] :
    IsCentralExtension
      ({ toFun := Prod.fst, map_one' := rfl, map_mul' := fun _ _ => rfl } :
        G × A →* G) := by sorry
example (f : X →* G) (hf : IsCentralExtension f) (a b : f.ker) : a * b = b * a := by sorry

-- Universal-property tests include a positive example, so an always-false
-- predicate cannot pass merely by making all hypotheses impossible.
example [Subsingleton G] : IsUniversalCentralExtension (MonoidHom.id G) := by sorry
example (f : X →* G) (hf : IsUniversalCentralExtension f) :
    ∃! h : X →* X, f.comp h = f := by sorry
example (f : X →* G) (hf : IsUniversalCentralExtension f)
    {Y : Type u} [Group Y] (g : Y →* G) (hg : IsCentralExtension g) :
    ∃ h : X →* Y, g.comp h = f := by sorry
example (h : ¬ Group.IsPerfect G) :
    ¬ IsUniversalCentralExtension (MonoidHom.id G) := by sorry
end CentralExtensions

/-- The safe finite-rank statement: a central extension OF St_n splits.
This alone does not assert centrality of St_n -> E_n. -/
theorem finite_rank_splitting {R : Type u} [Ring R] {n : ℕ}
    (hn : 3 ≤ n) (hn5 : 5 ≤ n) {Y : Type u} [Group Y]
    (f : Y →* Steinberg n hn R) (hf : IsCentralExtension f) :
    ∃ s : Steinberg n hn R →* Y, f.comp s = MonoidHom.id _ := by sorry

/-- A genuine prototype of the commutator-lifting construction. On the canonical
extension St(R) -> E(R), this is the star product. No self-map substitutes for
that extension. -/
def starProduct {X G : Type u} [Group X] [Group G]
    (f : X →* G) (hf : IsCentralExtension f) (a b : G) (hab : Commute a b) : f.ker :=
  ⟨⁅Classical.choose (hf.1 a), Classical.choose (hf.1 b)⁆, by sorry⟩

example {X G : Type u} [Group X] [Group G]
    (f : X →* G) (hf : IsCentralExtension f) (a : G) :
    starProduct f hf a a (Commute.refl a) = 1 := by sorry
example {X G : Type u} [Group X] [Group G]
    (f : X →* G) (hf : IsCentralExtension f) (a b : G) (hab : Commute a b) :
    starProduct f hf a b hab = (starProduct f hf b a hab.symm)⁻¹ := by sorry
example {X G : Type u} [Group X] [Group G]
    (f : X →* G) (hf : IsCentralExtension f) (a b : G) (hab : Commute a b)
    (a' b' : X) (ha : f a' = a) (hb : f b' = b) :
    (starProduct f hf a b hab : X) = ⁅a', b'⁆ := by sorry
end TauCeti.Steinberg

namespace TauCeti.MilnorK
variable (F : Type u) [Field F]

/-- The full tensor algebra; its generators are the units written additively. -/
abbrev Tensor := TensorAlgebra ℤ (Additive Fˣ)

def tensorSymbol (a b : Fˣ) : Tensor F :=
  TensorAlgebra.ι ℤ (Additive.ofMul a) * TensorAlgebra.ι ℤ (Additive.ofMul b)

/-- The actual Steinberg relation, before taking its two-sided ring-congruence
closure. Using units a,b with a+b=1 also excludes zero and one correctly. -/
def steinbergRel (x y : Tensor F) : Prop :=
  ∃ a b : Fˣ, (a : F) + (b : F) = 1 ∧ x = tensorSymbol F a b ∧ y = 0

/-- The ungraded carrier of Milnor K-theory. The homogeneous grading and its
comparison with degree-wise tensor quotients remain explicit obligations. -/
abbrev Ring := RingQuot (steinbergRel F)

-- Relation tests pin down the inputs and the zero target, not only ring axioms.
example (a b : Fˣ) (h : (a : F) + (b : F) = 1) :
    steinbergRel F (tensorSymbol F a b) 0 := by sorry
example (x y : Tensor F) (h : steinbergRel F x y) : y = 0 := by sorry
example (x y : Tensor F) (h : steinbergRel F x y) :
    ∃ a b : Fˣ, (a : F) + (b : F) = 1 ∧ x = tensorSymbol F a b := by sorry

def symbol (a b : Fˣ) : Ring F :=
  RingQuot.mkRingHom (steinbergRel F) (tensorSymbol F a b)

example (a b : Fˣ) (h : (a : F) + (b : F) = 1) : symbol F a b = 0 := by sorry
example (a b c : Fˣ) : symbol F (a * b) c = symbol F a c + symbol F b c := by sorry
example (a b : Fˣ) : symbol F a b = -symbol F b a := by sorry
example (a : Fˣ) : symbol F a a = symbol F a (-1) := by sorry

/- The remaining required examples need the homogeneous grading:
K0^M(F)=Z, K1^M(F)=F^x, and repeated symbols vanish in characteristic two.
They are recorded in the packet; this file does NOT replace them by propositions True.
The integral statement 'sqrt(-1) implies {a,a}=0' has been removed: C(t) is a
counterexample, since the t-adic residue of {t,t} is -1.
-/
end TauCeti.MilnorK

/-!
## Explicitly omitted interfaces and tests

* Stable St and its group-colimit API, canonical St -> E, K2 as THAT kernel,
  the centre theorem and the Steinberg symbol: require the actual stable
  GL/E interface of KTheoryLowDegrees U.1, not arbitrary substitute carriers.
* The Hopf formula and K2 -> H2(E,Z) require the presentation-to-bar comparison.
  The target must be groupHomology.H2 (Rep.trivial Z E Z), with the additive/
  multiplicative convention handled explicitly, not K2 again.
* K2 -> pi2 requires GeneralAlgebraicKTheory K.2:plus and the classifying-space,
  covering and Hurewicz interfaces of StableHomotopyKTheory H.1/H.3.
* Milnor homogeneous quotients, Matsumoto, the finite-field and arithmetic
  calculations, and their nontrivial tests are not expressed in this partial
  file. The packet keeps them as targets with the missing proof work recorded.
* The graded map targets the actual Quillen K-groups supplied by K.7. It is not
  a Milnor-to-itself map. Its degree-three image and cokernel belong to
  K3BlochGroups V.2; that roadmap does not supply universal injectivity.

This omission list means the suggested file is not yet a complete signature
realisation of the packet. Elaboration at the pinned baseline has NOT run.
-/
