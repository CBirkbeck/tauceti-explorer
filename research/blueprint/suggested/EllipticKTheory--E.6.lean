/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/EllipticKTheory--E.6.md is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and
signatures. They claim no implementation.

BP-EllipticKTheory--E.6, Codex — codex-pMKZqt.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The RegularProperModel carrier and genericInclusion below are the exact planned
interface imported from EllipticKTheory:E.6/the-regular-proper-model in the parent
suggested file. They are prerequisite scaffolding, not additional packet nodes.
That carrier is absent at the pinned baseline; TauCeti.Model is a DVR model and
cannot serve as an arithmetic model over the S-integers. We import its real local
interface and the arbitrary-ring scalar-extension API from TauCeti.Fibers.

Missing objects are named in comments, not represented by unconstrained Prop
fields or assumed versions of the conclusions. In particular the elliptic scheme
of E.1, coherent genus and the local relative-minimality predicate are planned
supplier interfaces. The global existence, local-to-global and localization
statements that require them remain comments. The generic marked-model algebra
and the expressible parts of the three tests are signatures below. Elaborating
this file checks those signatures, not the omitted statements or their proofs.

Full-file check: NOT COMPILED; the shared prebuilt environment lacks the
TauCeti Model.Basic and Fibers object files. The separate Mathlib-only fragment
elaborates with only sorry warnings; the handoff gives its exact scope.
-/
import TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic
import TauCeti.AlgebraicGeometry.Fibers
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.RingTheory.RegularLocalRing.Defs

noncomputable section

namespace TauCeti.EllipticK

open AlgebraicGeometry CategoryTheory

universe u

variable (R : Type u) [CommRing R] [IsDedekindDomain R]

/-- Imported parent interface, not a definition owned by this continuation. -/
structure RegularProperModel (E : Scheme.{u})
    (toGen : E ⟶ Spec (.of (FractionRing R))) where
  X : Scheme.{u}
  toBase : X ⟶ Spec (.of R)
  isProper : IsProper toBase
  flat : Flat toBase
  isRegular : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)
  genericFibre : Limits.pullback toBase
    (Spec.map (CommRingCat.ofHom (algebraMap R (FractionRing R)))) ≅ E
  genericFibre_toGen : genericFibre.hom ≫ toGen = Limits.pullback.snd _ _

variable {R} {E : Scheme.{u}} {toGen : E ⟶ Spec (.of (FractionRing R))}

/-- Imported parent generic-fibre projection, using the baseline projection. -/
def RegularProperModel.genericInclusion (M : RegularProperModel R E toGen) : E ⟶ M.X :=
  M.genericFibre.inv ≫ TauCeti.genericFiberι R (FractionRing R) M.toBase

namespace RegularProperModel

/-- E.6/minimal-arithmetic-model, API Hom: both compatibilities are actual
scheme-morphism equalities, including the fixed generic-fibre marking. -/
structure Hom (M N : RegularProperModel R E toGen) where
  /-- API Hom.hom: the underlying morphism. -/
  hom : M.X ⟶ N.X
  overBase : hom ≫ N.toBase = M.toBase
  genericFibre : M.genericInclusion ≫ hom = N.genericInclusion

/-- API Hom.id. -/
def Hom.id (M : RegularProperModel R E toGen) : Hom M M := by
  sorry

/-- API Hom.comp. -/
def Hom.comp {M N P : RegularProperModel R E toGen} (f : Hom M N) (g : Hom N P) :
    Hom M P := by
  sorry

/-- API category: marked models form a category, using the preceding operations. -/
instance category : Category (RegularProperModel R E toGen) where
  Hom := Hom
  id := Hom.id
  comp f g := Hom.comp f g
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

/-- API Hom.ext. -/
theorem Hom.ext {M N : RegularProperModel R E toGen} {f g : Hom M N}
    (h : f.hom = g.hom) : f = g := by
  sorry

/-- API Hom.subsingleton: regularity gives a reduced source, and flatness makes
its generic fibre dense. Apply the baseline separated-target equality theorem. -/
theorem Hom.subsingleton (M N : RegularProperModel R E toGen) :
    Subsingleton (Hom M N) := by
  sorry

/-- E.6/minimal-arithmetic-model: outgoing relative minimality. -/
def IsMinimal (M : RegularProperModel R E toGen) : Prop :=
  ∀ (N : RegularProperModel R E toGen) (f : Hom M N), IsIso f.hom

/-- API isMinimal_iff. -/
theorem isMinimal_iff (M : RegularProperModel R E toGen) :
    M.IsMinimal ↔ ∀ (N : RegularProperModel R E toGen) (f : Hom M N), IsIso f.hom := by
  sorry

/-- API IsMinimal.of_iso: transport along an identity-marked isomorphism. -/
theorem IsMinimal.of_iso {M N : RegularProperModel R E toGen}
    (hM : M.IsMinimal) (f : Hom M N) [IsIso f.hom] : N.IsMinimal := by
  sorry

section LocalComparison

variable (M : RegularProperModel R E toGen)
variable (v : IsDedekindDomain.HeightOneSpectrum R)
variable (A : Type u) [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
variable [Algebra R A] [hLoc : IsLocalization.AtPrime A v.asIdeal]
variable [Algebra A (FractionRing R)] [IsFractionRing A (FractionRing R)]
variable [hTower : IsScalarTower R A (FractionRing R)]

include M v hLoc hTower

/-- API toLocalModel: scalar extension to the specified local DVR and forgetting
properness and regularity to the actual pinned TauCeti.Model. -/
def toLocalModel : TauCeti.Model A (FractionRing R) E toGen := by
  sorry

/-- API toLocalModel_totalIso: comparison over the local base, so this is stronger
than an unmarked isomorphism of total schemes. The constructed toLocalModel also
uses the original marking via iterated scalar extension. -/
def toLocalModel_totalIso :
    { e : Over.mk (toLocalModel M v A).toBase ≅ TauCeti.genericFiber R A M.toBase //
      ((Over.pullback (Spec.map (CommRingCat.ofHom
        (algebraMap A (FractionRing R))))).mapIso e).hom.left ≫
          (TauCeti.genericFiberTowerIso R A (FractionRing R) M.toBase).hom ≫
            M.genericFibre.hom = (toLocalModel M v A).genericFiberIso.hom.left } := by
  sorry

-- The comparison on Hom uses this same inherited iterated scalar-extension
-- comparison in TauCeti.Fibers.
-- The local regularity/minimality assertions are not stated; they need the
-- StableReduction layer 5 regular-model and minimality interface.

end LocalComparison

/-! Tests of minimal-arithmetic-model. Each comment identifies the full packet
check. Where its geometric carrier is missing, the example is explicitly only
an expressible part, rather than a replacement for the stated check. -/

/-- Test smooth_37a1_minimal, expressible smooth-model implication.
The explicit projective scheme y²z + yz² = x³ − xz² over Z[1/37] is not stated;
it needs the E.1/ModularCurves scheme carrier. Its discriminant is 37 and the
full test instantiates this example with its smooth relative-curve model. -/
example (M : RegularProperModel R E toGen) [SmoothOfRelativeDimension 1 M.toBase] :
    M.IsMinimal := by
  sorry

/-- Test nodal_37a1_minimal, expressible arithmetic witness from the parent
regularity test. The full model's irreducible I₁ fibre at 37 has no exceptional
curve, although it is singular. That assertion needs the projective Weierstrass
scheme and the StableReduction fibre/minimality interface and is not stated. -/
example : (18 : ℤ) ^ 2 + 18 - (5 ^ 3 - 5) = 222 ∧ ¬ (37 ^ 2 : ℤ) ∣ 222 := by
  sorry

/-- Test point_blowup_not_minimal, expressible defining obstruction.
The explicit blowup of the preceding smooth model at a closed point over 2 is
not stated; it needs StableReduction layer 4's scheme blowup and exceptional
fibre. Its blowdown instantiates b, and P¹ as exceptional fibre proves hb. -/
example {X M : RegularProperModel R E toGen} (b : Hom X M) (hb : ¬ IsIso b.hom) :
    ¬ X.IsMinimal := by
  sorry

/-! Named arithmetic theorems -/

-- exists_locallyMinimal_arithmetic_model (E.6/exists-locally-minimal-arithmetic-model):
-- not stated; needs the E.1 elliptic scheme and StableReduction's exceptional-
-- curve and local-minimality predicates, and scheme projectivity. Its exact
-- arithmetic hypotheses and finite contraction proof are in the packet/reader.

-- locallyMinimal_terminal (E.6/locally-minimal-terminal-model): not stated;
-- needs the local relative-minimality predicate and the fixed elliptic generic
-- scheme. The conclusion is that Hom X M has exactly one element for every X.

-- isMinimal_iff_locallyMinimal (E.6/minimality-local-criterion): not stated;
-- needs the same local predicate and the positive-genus curve interface.
-- The categorical implication from the terminal property is expressible:
/-- Generic marked-model part of minimality-local-criterion. -/
theorem isMinimal_of_terminal (M : RegularProperModel R E toGen)
    (h : ∀ X : RegularProperModel R E toGen, Nonempty (Unique (Hom X M))) : M.IsMinimal := by
  sorry

-- minimal_arithmetic_model_unique (E.6/unique-minimal-arithmetic-model):
-- not stated with minimality hypotheses alone; needs the positive-genus
-- elliptic curve and the existence/mapping theorems above. The final scheme
-- isomorphism and its generic/base compatibilities are already expressible
-- when the two model maps have been obtained:
/-- Generic marked-model part of unique-minimal-arithmetic-model. -/
def markedIsoOfHomBothWays {M N : RegularProperModel R E toGen}
    (f : Hom M N) (g : Hom N M) :
    { e : M.X ≅ N.X // e.hom = f.hom ∧ e.inv = g.hom ∧
      e.hom ≫ N.toBase = M.toBase ∧ M.genericInclusion ≫ e.hom = N.genericInclusion } := by
  sorry

-- minimal_model_localisation (E.6/minimal-model-localisation): not stated;
-- needs the planned S-integer model's open base-change carrier, the local-
-- minimality criterion and the fixed elliptic generic curve. It asserts only
-- inversion of primes in the same number field, with identity/composition
-- coherence. It does not assert preservation under arbitrary ramified change.

end RegularProperModel
end TauCeti.EllipticK
