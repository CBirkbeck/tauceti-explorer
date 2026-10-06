/-
This file is not the roadmap and is not exhaustive. The definitive specification
is research/blueprint/readmes/ArithmeticKTheory--N.2.md. These suggested Lean
forms let contributors and reviewers converge on names and signatures; they
claim no implementation.

The pinned libraries contain DirectSum and arithmetic ramification, but no
higher Quillen K-group functor or its localisation boundary. The construction
below is the group-theoretic part of ramifiedResiduePullback: P indexes source
primes and Q p is the finite fibre of primes above p. Its groups and maps are
actual AddCommGroups and AddMonoidHoms, supplied as parameters. Instantiating
them with K_n(k(p)), K_n(k(q)) and residue-field restriction requires the
supplier K-theory. This file does not replace those suppliers by axioms.
-/

import Mathlib.Algebra.DirectSum.Basic
import Mathlib.Algebra.Group.TypeTags.Basic
import Mathlib.Algebra.Field.ZMod
import Mathlib.RingTheory.RamificationInertia.Ramification

open scoped DirectSum BigOperators

namespace TauCeti.ArithmeticKTheory

section FiniteFibres

variable {P : Type*} {Q : P → Type*} [DecidableEq P]
  [DecidableEq (Sigma Q)] [∀ p, Fintype (Q p)]
  {G : P → Type*} {H : (s : Sigma Q) → Type*}
  [∀ p, AddCommGroup (G p)] [∀ s, AddCommGroup (H s)]

/-- N.2/ramified-residue-pullback, underlying finite-fibre construction.
In the arithmetic instance e p q = q.asIdeal.ramificationIdx A. -/
noncomputable def ramifiedResiduePullback
    (e : ∀ p, Q p → ℕ) (r : ∀ p q, G p →+ H ⟨p, q⟩) :
    (⨁ p, G p) →+ ⨁ s, H s := sorry

lemma ramifiedResiduePullback_of
    (e : ∀ p, Q p → ℕ) (r : ∀ p q, G p →+ H ⟨p, q⟩)
    (p : P) (x : G p) :
    ramifiedResiduePullback e r (DirectSum.of G p x) =
      ∑ q : Q p, DirectSum.of H ⟨p, q⟩ (e p q • r p q x) := by sorry

lemma ramifiedResiduePullback_apply
    (e : ∀ p, Q p → ℕ) (r : ∀ p q, G p →+ H ⟨p, q⟩)
    (x : ⨁ p, G p) (p : P) (q : Q p) :
    ramifiedResiduePullback e r x ⟨p, q⟩ = e p q • r p q (x p) := by sorry

lemma ramifiedResiduePullback_unique
    (e : ∀ p, Q p → ℕ) (r : ∀ p q, G p →+ H ⟨p, q⟩)
    (f : (⨁ p, G p) →+ ⨁ s, H s)
    (hf : ∀ p (x : G p), f (DirectSum.of G p x) =
      ∑ q : Q p, DirectSum.of H ⟨p, q⟩ (e p q • r p q x)) :
    f = ramifiedResiduePullback e r := by sorry

/-- Coordinate form of support containment; finite Q p then bounds the support
by the finite union of fibres over the input support. -/
lemma ramifiedResiduePullback_support
    (e : ∀ p, Q p → ℕ) (r : ∀ p q, G p →+ H ⟨p, q⟩)
    (x : ⨁ p, G p) (p : P) (q : Q p)
    (h : ramifiedResiduePullback e r x ⟨p, q⟩ ≠ 0) : x p ≠ 0 := by sorry

lemma ramifiedResiduePullback_zero
    (e : ∀ p, Q p → ℕ) (r : ∀ p q, G p →+ H ⟨p, q⟩) :
    ramifiedResiduePullback e r 0 = 0 := by sorry

lemma ramifiedResiduePullback_add
    (e : ∀ p, Q p → ℕ) (r : ∀ p q, G p →+ H ⟨p, q⟩)
    (x y : ⨁ p, G p) :
    ramifiedResiduePullback e r (x + y) =
      ramifiedResiduePullback e r x + ramifiedResiduePullback e r y := by sorry

end FiniteFibres

section Identity

variable {P : Type*} [DecidableEq P] [DecidableEq (Sigma (fun _ : P => Unit))]
  {G : P → Type*} [∀ p, AddCommGroup (G p)]

/-- Identity after the canonical reindexing (p, ()) ↦ p. -/
lemma ramifiedResiduePullback_id (x : ⨁ p, G p) (p : P) :
    ramifiedResiduePullback (Q := fun _ : P => Unit)
      (H := fun s => G s.1) (fun _ _ => 1)
      (fun p _ => AddMonoidHom.id (G p)) x ⟨p, ()⟩ = x p := by sorry

end Identity

section Towers

variable {P : Type*} {Q : P → Type*} {R : Sigma Q → Type*}
  [DecidableEq P] [DecidableEq (Sigma Q)] [DecidableEq (Sigma R)]
  [∀ p, Fintype (Q p)] [∀ s, Fintype (R s)]
  {G : P → Type*} {H : Sigma Q → Type*} {J : Sigma R → Type*}
  [∀ p, AddCommGroup (G p)] [∀ s, AddCommGroup (H s)]
  [∀ t, AddCommGroup (J t)]

/-- The composition law in coordinates. Reindex ((p,q),t) as (p,(q,t));
the direct one-step weight is e(p,q)*d((p,q),t). -/
lemma ramifiedResiduePullback_tower_apply
    (e : ∀ p, Q p → ℕ) (d : ∀ s, R s → ℕ)
    (r : ∀ p q, G p →+ H ⟨p,q⟩) (s : ∀ q t, H q →+ J ⟨q,t⟩)
    (x : ⨁ p, G p) (p : P) (q : Q p) (t : R ⟨p,q⟩) :
    ramifiedResiduePullback d s (ramifiedResiduePullback e r x) ⟨⟨p,q⟩,t⟩ =
      (e p q * d ⟨p,q⟩ t) • s ⟨p,q⟩ t (r p q (x p)) := by sorry

end Towers

section Tests

local instance : Fact (Nat.Prime 5) := ⟨by decide⟩

-- ramifiedResiduePullback.test_zero: zero input, independent of the weight.
example : ramifiedResiduePullback (P := Unit) (Q := fun _ => Unit)
    (G := fun _ => ℤ) (H := fun _ => ℤ) (fun _ _ => 2)
    (fun _ _ => AddMonoidHom.id ℤ) 0 = 0 := by sorry

-- ramifiedResiduePullback.test_identity: identity extension.
example (x : ℤ) :
    ramifiedResiduePullback (P := Unit) (Q := fun _ => Unit)
      (G := fun _ => ℤ) (H := fun _ => ℤ) (fun _ _ => 1)
      (fun _ _ => AddMonoidHom.id ℤ)
      (DirectSum.of (fun _ : Unit => ℤ) () x) ⟨(),()⟩ = x := by sorry

-- ramifiedResiduePullback.test_ramified: e=2 on K_0(k)=ℤ.
example : ramifiedResiduePullback (P := Unit) (Q := fun _ => Unit)
    (G := fun _ => ℤ) (H := fun _ => ℤ) (fun _ _ => 2)
    (fun _ _ => AddMonoidHom.id ℤ)
    (DirectSum.of (fun _ : Unit => ℤ) () 1) ⟨(),()⟩ = 2 := by sorry

-- ramifiedResiduePullback.test_split: both primes above p receive x.
example (x : ℤ) : ∀ q : Fin 2,
    ramifiedResiduePullback (P := Unit) (Q := fun _ => Fin 2)
      (G := fun _ => ℤ) (H := fun _ => ℤ) (fun _ _ => 1)
      (fun _ _ => AddMonoidHom.id ℤ)
      (DirectSum.of (fun _ : Unit => ℤ) () x) ⟨(),q⟩ = x := by sorry

-- ramifiedResiduePullback.test_inert: e=1, even when residue degree is 2.
-- Rank extension k → k' is the identity ℤ → ℤ; multiplication by 2 is wrong.
example : ramifiedResiduePullback (P := Unit) (Q := fun _ => Unit)
    (G := fun _ => ℤ) (H := fun _ => ℤ) (fun _ _ => 1)
    (fun _ _ => AddMonoidHom.id ℤ)
    (DirectSum.of (fun _ : Unit => ℤ) () 3) ⟨(),()⟩ ≠ 6 := by sorry

-- ramifiedResiduePullback.test_units: e=3, identity residue extension of F_5.
-- Additive.ofMul changes notation, so 3 • [2] is [2^3]=[3].
example : ramifiedResiduePullback (P := Unit) (Q := fun _ => Unit)
    (G := fun _ => Additive (ZMod 5)ˣ) (H := fun _ => Additive (ZMod 5)ˣ)
    (fun _ _ => 3) (fun _ _ => AddMonoidHom.id _)
    (DirectSum.of (fun _ : Unit => Additive (ZMod 5)ˣ) ()
      (Additive.ofMul (Units.mk0 (2 : ZMod 5) (by decide)))) ⟨(),()⟩ =
    Additive.ofMul (Units.mk0 (3 : ZMod 5) (by decide)) := by sorry

end Tests

/-!
Named higher-K targets, deliberately not given stand-in signatures:

* ramificationWeightedDevissage (N.2/ramification-weighted-devissage):
  under torsion-category devissage, tensoring A → B induces e(q/p) times
  residue-field restriction on the q component in every nonnegative degree.
* finiteExtensionRestrictionCompatibility
  (N.2/finite-extension-restriction-compatibility): the full localisation
  sequences commute with A → B and F → L; the residue arrows are the map above.
* lowDegreeRamifiedRestriction (N.2/low-degree-ramified-restriction):
  K_0 residue arrows multiply by e, K_1 arrows send u to res(u)^e, and the
  imported tame boundaries satisfy beta_q(res z)=res(beta_p z)^e.
* sIntegerRestrictionCompatibility (N.2/s-integer-restriction-compatibility):
  specialise to O_{F,S} → O_{L,T}, T the full inverse image of S; extension
  towers and enlargement of S commute under the stated reindexings.

Each needs actual K-group, exact-functor, devissage and boundary types supplied
by GeneralAlgebraicKTheory and SchemeKTheoryOperations. Those types are absent
from the pinned baseline. No assertion here encodes their conclusions as an
input hypothesis. The packet and reader give the complete mathematical forms.
-/

end TauCeti.ArithmeticKTheory
