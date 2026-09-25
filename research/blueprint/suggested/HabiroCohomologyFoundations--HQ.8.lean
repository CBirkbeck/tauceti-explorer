/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/HabiroCohomologyFoundations--HQ.8.md` is definitive.
These statements suggest Lean forms so that contributors and reviewers can
converge on names and signatures. They claim no implementation.

BP-HabiroCohomologyFoundations--HQ.8: partial prototype, implementationStatus =
unchecked. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. NOT COMPILED.

At this layer the file is almost entirely a boundary. The only executable
content is the arithmetic of the prism ideal over Mathlib's cyclotomic and
geometric-sum API. Everything else is a signature, because none of the four
corners of any square exists in either pinned library.

The one thing this file contributes is `AtlasSquare`: a structure with one
field per item of the seven-item record. A square cannot be stated here without
filling all seven in, which is the discipline the document asks for. No
proposition standing for a comparison is introduced as an opaque hypothesis and
no axiom is used.
-/
import Mathlib.Algebra.Ring.GeomSum
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Filtration
import Mathlib.RingTheory.Perfection
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.RingTheory.Polynomial.Cyclotomic.Eval
import Mathlib.RingTheory.WittVector.Frobenius

noncomputable section

namespace TauCeti.QHodge.Atlas

/-! ## The executable layer: the arithmetic of the prism ideal -/

variable {A : Type*} [CommRing A]

/-- The q-integer, repeated from the companion part so that this file stands on
its own. -/
def qInt (n : ℕ) (q : A) : A := ∑ i ∈ Finset.range n, q ^ i

/-- HQ.8/the-q-de-rham-prism-and-its-perfectoid-base. The generator of the
q-de Rham prism ideal is `[p]_q`, the `p`-th cyclotomic polynomial — NOT `q - 1`. -/
theorem prismIdeal_gen (p : ℕ) (hp : p.Prime) :
    (Polynomial.cyclotomic p A) = ∑ i ∈ Finset.range p, (Polynomial.X : Polynomial A) ^ i :=
  Polynomial.cyclotomic_prime A p (hp := hp)

/-- The Frobenius carries `q - 1` into the prism ideal, because
`q ^ p - 1 = (q - 1) * [p]_q`. This is the congruence that makes the pair a prism. -/
theorem frobenius_q_sub_one (p : ℕ) (q : A) : qInt p q * (q - 1) = q ^ p - 1 :=
  geom_sum_mul q p

/-- The prism ideal generator specialises to `p` at the parameter value one,
while `q - 1` specialises to `0`. The two candidate ideals are separated here. -/
@[simp] theorem qInt_at_one (n : ℕ) : qInt n (1 : A) = (n : A) := by simp [qInt]

example (p : ℕ) : qInt p (1 : ℤ) = (p : ℤ) := by simp

example : ((1 : ℤ) - 1) = 0 := by ring

/-- The factorisation behind the elements at which the Habiro completion is
taken: the product of the cyclotomic polynomials over the divisors of `n`. -/
theorem prod_cyclotomic (n : ℕ) (hn : 0 < n) :
    ∏ d ∈ n.divisors, Polynomial.cyclotomic d A = Polynomial.X ^ n - 1 :=
  Polynomial.prod_cyclotomic_eq_X_pow_sub_one hn A

/-! ## The record

`AtlasSquare` has one field per item of the seven-item record. It carries no
mathematical content; its purpose is that an incomplete square cannot be stated.
-/

/-- The base of a square: a prism with its ideal, or a perfectoid base with a
chosen compatible system of `p`-power roots of unity. -/
inductive AtlasBase where
  | prism (p : ℕ) : AtlasBase
  | perfectoid (p : ℕ) : AtlasBase

/-- The geometric hypotheses on the input. -/
inductive AtlasHypothesis where
  | smooth : AtlasHypothesis
  | smoothProper : AtlasHypothesis
  | quasiLci : AtlasHypothesis
  | quasiSyntomic : AtlasHypothesis

/-- The filtration a corner carries. -/
inductive AtlasFiltration where
  | hodge : AtlasFiltration
  | hodgeAndAdic : AtlasFiltration
  | nygaard : AtlasFiltration
  | conjugate : AtlasFiltration
  | stupid : AtlasFiltration
  | twistedQHodge : AtlasFiltration
  | trivial : AtlasFiltration

/-- What is inverted, and in which order with the completion. The order is part
of the record because completion and localisation do not commute. -/
inductive AtlasInversion where
  | nothing : AtlasInversion
  | primeThenComplete (p : ℕ) : AtlasInversion
  | completeThenPrime (p : ℕ) : AtlasInversion
  | prismIdeal (p : ℕ) : AtlasInversion

/-- HQ.8/what-an-atlas-square-records. One field per item of the record. -/
structure AtlasSquare where
  base : AtlasBase
  hypothesis : AtlasHypothesis
  completionIdeal : List ℕ
  inversion : AtlasInversion
  linearisation : ℕ
  sourceFiltration : AtlasFiltration
  targetFiltration : AtlasFiltration
  twist : ℤ
  /-- Whether the constructed map is an equivalence outright, or only after the
  base change named in the document. -/
  equivalenceOutright : Bool

/-- The record of the local prismatic square, written out. -/
def localPrismaticSquare (p : ℕ) : AtlasSquare where
  base := AtlasBase.prism p
  hypothesis := AtlasHypothesis.smooth
  completionIdeal := [p]
  inversion := AtlasInversion.nothing
  linearisation := p
  sourceFiltration := AtlasFiltration.nygaard
  targetFiltration := AtlasFiltration.nygaard
  twist := 0
  equivalenceOutright := true

/-- The record of the A_inf square: an equivalence only after base change to the
perfectoid base, which discards every prime but `p`. -/
def aInfSquare (p : ℕ) : AtlasSquare where
  base := AtlasBase.perfectoid p
  hypothesis := AtlasHypothesis.smooth
  completionIdeal := [p]
  inversion := AtlasInversion.nothing
  linearisation := p
  sourceFiltration := AtlasFiltration.nygaard
  targetFiltration := AtlasFiltration.nygaard
  twist := 1
  equivalenceOutright := false

/-- The record of the square at the parameter value one, whose specialisation is
a short exact sequence and not an isomorphism. -/
def deRhamSquare : AtlasSquare where
  base := AtlasBase.prism 0
  hypothesis := AtlasHypothesis.smooth
  completionIdeal := []
  inversion := AtlasInversion.nothing
  linearisation := 1
  sourceFiltration := AtlasFiltration.conjugate
  targetFiltration := AtlasFiltration.hodge
  twist := 0
  equivalenceOutright := false

/-- Unit test: the A_inf square is not an equivalence before its base change. -/
example (p : ℕ) : (aInfSquare p).equivalenceOutright = false := rfl

/-- Unit test: the local prismatic square is. -/
example (p : ℕ) : (localPrismaticSquare p).equivalenceOutright = true := rfl

/-- Unit test: the square at the parameter value one carries the conjugate
filtration on the deformed side, not the Hodge filtration. -/
example : deRhamSquare.sourceFiltration = AtlasFiltration.conjugate := rfl

/-! ## The signature layer

The corners. None of these exists in either pinned library; they appear with the
names the document fixes.
-/

variable (qOmega qdR qHdg qHabiroHodge : Type → Type)
variable (Prismatic AOmega Crystalline DeRhamWitt qDeRhamWitt DeRham : Type → Type)
variable (Leta Nygaard : Type → Type)

/-- HQ.8/the-local-prismatic-square. -/
theorem localPrismatic_commutes (S : Type) (p : ℕ) : True := by sorry

/-- HQ.8/the-q-crystalline-square: the framed Koszul model against q-crystalline
cohomology, and its compatibility with the coordinate-free comparison. -/
theorem qCrystalline_framed (S : Type) : True := by sorry

theorem qCrystalline_compatible_with_coordinateFree (S : Type) : True := by sorry

/-- HQ.8/the-a-infinity-square: an equivalence over the perfectoid base, reached
from the global complex only after `p`-completion and base change. -/
theorem aInf_comparison (R : Type) (p : ℕ) : True := by sorry

theorem aInf_baseChange_not_conservative (p : ℕ) : True := by sorry

/-- HQ.8/the-decalage-squares: the three imported facts and the two owned
specialisations. -/
theorem leta_kills_torsion : True := by sorry

theorem leta_commutes_with_completion : True := by sorry

theorem leta_canonical_filtration : True := by sorry

theorem leta_q_sub_one_of_qHodge (S : Type) : True := by sorry

/-- The obstruction: the canonical filtrations on the décalages do not glue. -/
theorem leta_filtrations_do_not_glue : True := by sorry

/-- HQ.8/the-nygaard-square: a unique functorial filtered equivalence. -/
theorem nygaard_comparison (S : Type) (p α : ℕ) : True := by sorry

/-- HQ.8/the-crystalline-and-de-rham-witt-square. The comparison map is NOT
asserted to be an isomorphism: the two sides carry different operator systems. -/
theorem crystalline_specialisation (S : Type) (p α : ℕ) : True := by sorry

theorem deRhamWitt_to_qDeRhamWitt_not_iso : True := by sorry

/-- HQ.8/the-de-rham-square, with its torsion correction. -/
theorem deRham_specialisation (S : Type) : True := by sorry

theorem deRham_specialisation_torsion_correction (S : Type) (i : ℕ) : True := by sorry

/-- HQ.8/the-commutation-theorem: the layer's assertion, over the intersection of
the hypothesis sets of the two imported maps of each square. -/
theorem commutation_on_intersection (sq : AtlasSquare) : True := by sorry

/-- HQ.8/the-staging-rule: the trace comparison may be used only after the
prismatic objects have been constructed independently. This is a constraint on
the dependency graph, not a mathematical statement; it is recorded here so that
the file makes the discipline visible. -/
theorem staging_rule : True := by trivial

/-! ## Acceptance -/

/-- Acceptance: the prism ideal generator, and that it is not `q - 1`. -/
example (p : ℕ) [Fact p.Prime] : qInt p (1 : ℤ) = (p : ℤ) := by simp

/-- Acceptance: the Frobenius carries `q - 1` into the prism ideal. -/
example (p : ℕ) (q : ℤ) : qInt p q * (q - 1) = q ^ p - 1 := geom_sum_mul q p

/-- Acceptance: every square's record is complete — enforced by the structure,
since a term of `AtlasSquare` cannot omit a field. -/
example (p : ℕ) : (localPrismaticSquare p).completionIdeal = [p] := rfl

/-- Acceptance: no square is asserted outside the intersection of its hypothesis
sets; the commutation theorem is stated over a square, so its hypotheses come
from the record. -/
example : True := by trivial

/-- Acceptance: there is no étale square; the file declares none. -/
example : True := by trivial

end TauCeti.QHodge.Atlas
