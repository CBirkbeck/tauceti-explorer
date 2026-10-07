import TauCeti.CategoryTheory.GrothendieckGroup.Exact
import TauCeti.Algebra.Category.ModuleCat.CartanMap
import Mathlib.LinearAlgebra.Matrix.Defs
import Mathlib.CategoryTheory.Idempotents.Karoubi
import Mathlib.RingTheory.Morita.Matrix
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Homology.Homotopy
import Mathlib.Algebra.Module.Projective
import Mathlib.RingTheory.Finiteness.Defs
import Mathlib.RingTheory.Nilpotent.Defs

/-!
Suggested Lean forms for General algebraic K-theory, K.1–K.7.

This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/GeneralAlgebraicKTheory.md is definitive; these statements suggest
Lean forms so contributors and reviewers converge on names and signatures. No implementation
or completed proof is claimed. Every packet API and test name remains represented.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Declarations whose carriers already exist use those pinned carriers, with sorry for planned
proofs. Missing Q/loop/fibre/Waldhausen/spectrum/Frobenius interfaces are explicit signature
comments, carrying their mathematical contracts and suppliers from the roadmap. Prose and
ellipsis inside those comments are deliberate unfinished syntax; they were not elaborated.
No arbitrary Prop field, dummy Unit model or True theorem substitutes for a missing condition.
Tests that recur by name in different nodes are scoped to their node's eventual test namespace.

The executable Mathlib-backed data are IsFlasqueRing, coneRing, NilCat and finite chain
Domination; the initial three examples use existing Tau Ceti declarations. Right R-modules
use Rᵐᵒᵖ. Exact-category KGroup has arguments (E,n), and its ring adapter uses (R,n).
KSpace.ofRing is the single early ring model. Bass K-theory is unital; NonunitalBass is the
unitization augmentation fibre. The class-weak, Laurent, Nil, chart, Frobenius and Artin
sketches were reconciled with the packet statements during assembly; see the handoff.

Compilation status: the full assembled file was not elaborated. lean-check stops at the
TauCeti.CategoryTheory.GrothendieckGroup.Exact import because its object file is absent
from the shared pinned build. This does not establish that later declarations elaborate.
-/

noncomputable section

universe u v w

open CategoryTheory CategoryTheory.Limits

namespace TauCeti.HigherK

-- Part I: Q, connective ring theory, exact-category and Waldhausen theorems, relatives.
section ExactCategoryBaseline
variable {C : Type u} [Category.{v} C] [Preadditive C]
  [HasZeroObject C] [HasBinaryBiproducts C] [EssentiallySmall.{w} C]

-- These examples use existing declarations only; they are not higher K proofs.
example (E : ExactStructure C) (S : ShortComplex C) (hS : E.Conflation S) :
    (ExactK0.of S.X₂ : ExactK0 E) = ExactK0.of S.X₁ + ExactK0.of S.X₃ :=
  ExactK0.of_conflation hS

example (R : Type u) [Ring R] :
    finiteProjectiveModulesExactStructure R =
      ExactStructure.split (finiteProjectiveModules R).FullSubcategory :=
  finiteProjectiveModulesExactStructure_eq_split R

example (R : Type u) [Ring R]
    (S : ShortComplex (finiteProjectiveModules R).FullSubcategory) :
    (finiteProjectiveModulesExactStructure R).Conflation S ↔
      (S.map (finiteProjectiveModules R).ι).ShortExact :=
  finiteProjectiveModulesExactStructure_conflation_iff R S

/-
K.1. Planned interfaces: BasedSpace, BasedMap, BasedHomotopyEquiv, LoopSpace, PiGroup
(homotopy groups of a based space), realisation of the nerve. They are not variables
whose arbitrary values could satisfy the theorems below.

-- K.1/exact-categories-and-Q-construction. Composition uses only
-- ExactStructure.conflation_baseChange and ExactStructure.conflation_comp_of_isPullback;
-- no node uses Quillen's axiom (c) (Bühler 2.16 needs a cokernel).
noncomputable def QCat (E : ExactStructure C) : Type u
instance (E : ExactStructure C) : Category (QCat E)
def QCat.hom_equiv_subobject : (A ⟶ B in QCat E) ≃ admissible subobject B₂ ↣ B with B₂ ↠ A
def QCat.inflation (i : X ⟶ Y) (hi : E.IsInflation i) : QCat.mk X ⟶ QCat.mk Y
def QCat.deflation (p : Y ⟶ X) (hp : E.IsDeflation p) : QCat.mk X ⟶ QCat.mk Y
theorem QCat.factor (f : A ⟶ B) : f = deflation … ≫ inflation …, unique up to isomorphism
def QCat.hom_zero : (0 ⟶ B in QCat E) ≃ admissible subobjects of B
def QCat.isoQ_equiv_iso : (A ≅ B in QCat E) ≃ (A ≅ B in C)
def QCat.op : QCat E.op ≌ QCat E        -- exchanges inflations and deflations
example hom_from_zero : QCat.hom_zero … := sorry
example split_case : for ExactStructure.split, deflations are the split epimorphisms := sorry
example iso_correspondence : QCat.isoQ_equiv_iso … := sorry
example op_iso : QCat.op exchanges the two kinds of morphism := sorry

-- K.1/Q-construction-universal-property
def QCat.lift (obj, onInflation, onDeflation, bicartesian compatibility) : QCat E ⥤ D
theorem QCat.lift_inflation / QCat.lift_deflation / QCat.lift_unique
def QCat.map (hF : E.IsConflationExact E' F) [F.Additive] : QCat E ⥤ QCat E'
example exact_functor_induces : QCat.map hF exists for every conflation-exact F := sorry
example determined_by_two_classes : functors agreeing on inflations and deflations are equal := sorry
example bicartesian_needed : without the bicartesian condition the lift is not functorial := sorry

-- K.1/small-models-and-transport: on a w-small model, natural in exact functors;
-- degree zero is ExactStructure.transport with ExactK0.transportEquiv and mapEquiv.
theorem KSpace.transportEquiv (e : C ≌ D) [e.functor.Additive] :
  BasedHomotopyEquiv (KSpace E) (KSpace (E.transport e))

-- K.1/pi1-BQ-equals-K0: the forward map is ExactK0.lift of the two-edge loops (after
-- commutativity is proved); the inverse comes from the functor QCat E → ExactK0 E given by
-- QCat.lift and the covering classification; both composites checked on generators,
-- ExactK0.hom_ext on one side.
noncomputable def QBasedSpace (E : ExactStructure C) : BasedSpace
noncomputable def pi1QEquivExactK0 (E : ExactStructure C) :
  PiGroup 1 (QBasedSpace E) ≃+ ExactK0 E     -- both in universe w
theorem pi1QEquivExactK0_of (A : C) : pi1QEquivExactK0 E (twoEdgeLoop A) = ExactK0.of A

-- K.1/K-groups-of-exact-categories
noncomputable def KSpace (E : ExactStructure C) : BasedSpace := LoopSpace (QBasedSpace E)
noncomputable def KGroup (E : ExactStructure C) (n : ℕ) : Type w := PiGroup n (KSpace E)
instance KGroup.addCommGroup (n : ℕ) : AddCommGroup (KGroup E n)
def KGroup.map (hF : E.IsConflationExact E' F) (n : ℕ) : KGroup E n →+ KGroup E' n
theorem KGroup.map_of_natIso (e : F ≅ G) : KGroup.map hF n = KGroup.map hG n
def KGroup.zero_eq_exactK0 : KGroup E 0 ≃+ ExactK0 E
example degree_zero : KGroup.zero_eq_exactK0 sends the class of A to ExactK0.of A := sorry
example zero_category : KGroup E n = 0 for the zero exact category := sorry
example loop_indexing : QBasedSpace E is connected but π₀ (KSpace E) ≃ ExactK0 E := sorry
example opposite : KGroup E.op n ≃+ KGroup E n := sorry

-- K.1/elementary-properties-of-K-groups (generic in exact categories; ring forms are
-- K.2/functorial-K-theory-of-a-ring's)
theorem KGroup.opEquiv, KGroup.prodEquiv (finite direct sums),
  KGroup.colimitEquiv (filtered colimits of exact categories), hSpace addition = group law

K.2:plus. The noncommutative scalar extension ExtendScalars is KTheoryLowDegrees Z.1's
(Z.1/extend-scalars, Z.1/extend-scalars-finite-projective); Mathlib's
ModuleCat.extendScalars is used only for the commutative comparison.

-- K.2:plus/scalar-extension-and-functoriality
def projBaseChange (f : R →+* S) :
  (finiteProjectiveModules R).FullSubcategory ⥤ (finiteProjectiveModules S).FullSubcategory
theorem projBaseChange_exact (f : R →+* S) :
  (finiteProjectiveModulesExactStructure R).IsConflationExact
    (finiteProjectiveModulesExactStructure S) (projBaseChange f)
-- via finiteProjectiveModulesExactStructure_eq_split and ExactStructure.isConflationExact_split
def projBaseChange_id : projBaseChange (RingHom.id R) ≅ 𝟭 _
def projBaseChange_comp (f : R →+* S) (g : S →+* T) :
  projBaseChange (g.comp f) ≅ projBaseChange f ⋙ projBaseChange g
theorem projBaseChange_no_flat : no Module.Flat hypothesis appears in projBaseChange_exact
def projBaseChange_comm [CommRing R] [CommRing S] (f : R →+* S) :
  projBaseChange f ≅ restriction of ModuleCat.extendScalars f
example no_flatness : projBaseChange_exact holds for ℤ → ℤ/2 := sorry
example free_case : projBaseChange f (R^n) ≅ S^n := sorry
example composition : projBaseChange_comp … := sorry
example modules_need_flat : base change on all finitely generated modules is not exact
  for ℤ → ℤ/2 := sorry
example noncommutative_map : for k → M₂(k) the induced map ℤ = K₀(k) → K₀(M₂(k)) = ℤ is
  multiplication by 2 := sorry

-- K.2/functorial-K-theory-of-a-ring (parent K.2:plus): the one ring-model node
noncomputable def KSpace.ofRing (R : Type u) [Ring R] : BasedSpace :=
  KSpace (finiteProjectiveModulesExactStructure R)     -- universe u, pinned EssentiallySmall.{u}
noncomputable def KSpace.ofRing_map (f : R →+* S) : BasedMap (KSpace.ofRing R) (KSpace.ofRing S)
theorem KSpace.ofRing_map_id : KSpace.ofRing_map (RingHom.id R) ≃ id
theorem KSpace.ofRing_map_comp : KSpace.ofRing_map (g.comp f) ≃ KSpace.ofRing_map g ∘ KSpace.ofRing_map f
def KGroup.ofRing_zero_equiv (R : Type u) [Ring R] : PiGroup 0 (KSpace.ofRing R) ≃+ RingK0 R
  -- RingK0 is KTheoryLowDegrees Z.1's; ≃+ ExactK0 (finiteProjectiveModulesExactStructure R)
def KGroup.ofRing_prod (R S : Type u) [Ring R] [Ring S] (n : ℕ) :
  PiGroup n (KSpace.ofRing (R × S)) ≃+ PiGroup n (KSpace.ofRing R) × PiGroup n (KSpace.ofRing S)
def KGroup.ofRing_colimit (filtered diagram of unital rings) :
  colim PiGroup n (KSpace.ofRing Rᵢ) ≃+ PiGroup n (KSpace.ofRing (colim Rᵢ))
  -- through the idempotent-matrix model KTheoryLowDegrees:Z.1/projective-karoubi
def KGroup.ofRing_op (R : Type u) [Ring R] (n : ℕ) :
  PiGroup n (KSpace.ofRing Rᵐᵒᵖ) ≃+ PiGroup n (KSpace.ofRing R)   -- via Hom_R(−, R)
example product_ring : KGroup.ofRing_prod is induced by the two projections := sorry
example scalar_identity_composition : KSpace.ofRing_map_id and KSpace.ofRing_map_comp
  come from projBaseChange_id and projBaseChange_comp := sorry
example nonflat_projectives : KSpace.ofRing_map (Int.castRingHom (ZMod 2)) is defined := sorry
example filtered_idempotent_descent : idempotent matrices and equalities descend := sorry
example degree_zero_ring : KGroup.ofRing_zero_equiv ℤ identifies π₀ with ℤ·[ℤ] := sorry
example duality_not_identity : for a Dedekind domain the duality inverts ideal classes := sorry

-- K.2:plus/extension-category-and-the-fibration: the category EA of Weibel IV.7.3 with
-- Q-type morphisms; not the exact category of conflations of K.3.
def ExtCat (E : ExactStructure C) : Type u
def ExtCat.quot : ExtCat E ⥤ QCat E        -- fibred
def ExtCat.fibre_zero : fibre over 0 ≌ Core C
theorem ExtCat.contractible : BasedHomotopyEquiv |nerve (ExtCat E)| PointSpace
-- This contraction holds for every exact category; localisation is a separate theorem.
example fibre_is_iso_groupoid : ExtCat.fibre_zero := sorry
example split_needed : for a non-split exact category the comparison category is disconnected := sorry
example quotient_functor_to_Q : ExtCat.quot is a functor := sorry
example not_directly_fibred : the fibration criterion fails for ExtCat.quot itself := sorry
example not_the_conflation_category : morphisms of EA over an identity are isomorphisms,
  unlike those of E.ConflationCategory := sorry

-- K.2:plus/plus-equals-Q (split exact): ΩBQ ≃ B(S⁻¹S); for rings K₀ × BGL⁺ after a choice
theorem plusEqualsQ (E : ExactStructure C) (hE : E = ExactStructure.split C) :
  BasedHomotopyEquiv (KSpace E) (GroupCompletion (Core C))     -- group completion is H.4's
-- K.2:plus/cofinality-of-projective-modules: positive-degree agreement for free modules by
-- group-completion cofinality (Weibel IV.4.11(b), H.4), not by K.3's late cofinality.

K.2 and K.2:low-degree-comparisons: no new data. The product description K₀ × BGL⁺ holds
after a choice of component representatives; no infinite-loop splitting is asserted. The
explicit K₁, K₂, K₃ models are imported from KTheoryLowDegrees U.6, K2SymbolsBrauer T.1:plus
and T.2:symbols, and K3BlochGroups V.4.

Early K.3 (K.1 and StableHomotopyKTheory H.1–H.2 only).

-- K.3/three-by-three-lemma (Bühler, Corollary 3.6)
theorem ExactStructure.conflation_of_threeByThree (E : ExactStructure C)
  (columns conflations) (h : middle row and one outer row conflations ∨
    (outer rows conflations ∧ middle composite = 0)) : remaining row is a conflation

-- K.3/exact-category-of-conflations
def ConflationCategory.exactStructure (E : ExactStructure C) :
  ExactStructure E.ConflationCategory      -- componentwise conflations (Bühler, Ex. 3.9)
theorem ConflationCategory.conflation_iff (T : ShortComplex E.ConflationCategory) :
  (ConflationCategory.exactStructure E).Conflation T ↔ the three columns are E-conflations
theorem ConflationCategory.isConflationExact_sub : the projection π₁ (sub term) is conflation-exact
theorem ConflationCategory.isConflationExact_total : the projection π₂ (total term) is conflation-exact
theorem ConflationCategory.isConflationExact_quot : the projection π₃ (quotient term) is conflation-exact
def ConflationCategory.coprod : C × C ⥤ E.ConflationCategory      -- (X, Z) ↦ X ↣ X ⊞ Z ↠ Z
theorem ConflationCategory.sub_quot_coprod : (s, q) ∘ coprod = 𝟭 and t ∘ coprod ≅ biprod
def ConflationCategory.exactFunctorEquiv :
  exact functors B ⥤ E.ConflationCategory ≃ short exact sequences of exact functors B ⥤ C
instance ConflationCategory.essentiallySmall [EssentiallySmall.{w} C] :
  EssentiallySmall.{w} E.ConflationCategory
example componentwise_conflations : ConflationCategory.conflation_iff := sorry
example coprod_section : ConflationCategory.sub_quot_coprod := sorry
example k0_of_extension_category :
  ExactK0 (ConflationCategory.exactStructure E) ≃+ ExactK0 E × ExactK0 E := sorry
example not_abelian : the category of conflations of AddCommGrp is not abelian := sorry

-- K.3/additivity-for-exact-categories (Extension Theorem via Theorem A)
theorem additivity (hF' hF hF'' : exact functors) (short exact sequence F' ↣ F ↠ F'') (n : ℕ) :
  KGroup.map hF n = KGroup.map hF' n + KGroup.map hF'' n
-- K.3/resolution-theorem: degree zero is ExactStructure.resolutionEquiv (projective case).
-- The affine-plane doubled-origin test uses K₀(VB) = ℤ and G₀ = K₀(Perf) = ℤ²; the
-- doubled-origin line is excluded by its Picard group (sourceIssues E-double-origin).
theorem resolution (P ⊆ H closed under extensions and kernels of deflations,
  finite P-resolutions) (n : ℕ) : KGroup (P-structure) n ≃+ KGroup (H-structure) n
-- K.3/transfer-maps-and-projection-formula, K.3/devissage-theorem,
-- K.3/abelian-localization-theorem (Serre subcategory of a small abelian category):
-- theorem signatures await KGroup; hypotheses as in the packet.
-- K.3/cofinality-degree-zero-correction: late (proposed K.3:cofinality after K.4).

K.4:construction: genuine Waldhausen and exact-functor records supply zero object,
cofibrations, weak equivalences, pushouts, gluing and admissible squares.

-- K.4:construction/waldhausen-categories
structure CategoryWithCofibrations (C : Type u) [Category C]
structure WaldhausenCategory (C : Type u) [Category C] extends CategoryWithCofibrations C
class WaldhausenCategory.IsSaturated (W : WaldhausenCategory C) : Prop   -- two-out-of-three
class WaldhausenCategory.HasExtensionAxiom (W : WaldhausenCategory C) : Prop
structure WaldhausenCategory.CylinderFunctor (W : WaldhausenCategory C)
def WaldhausenCategory.K0 (W : WaldhausenCategory C) : Type w
def WaldhausenCategory.ofExact (E : ExactStructure C) : WaldhausenCategory C
structure WaldhausenCategory.exactFunctor (W : WaldhausenCategory C) (W' : WaldhausenCategory D)
example exact_is_waldhausen : WaldhausenCategory.ofExact E := sorry
example K0_agrees : (WaldhausenCategory.ofExact E).K0 ≃+ ExactK0 E := sorry
example unbounded_complexes_vanish : K0 of unbounded complexes = 0 := sorry
example axioms_separate : saturation, extension and cylinder are not fields of
  WaldhausenCategory := sorry

-- K.4:construction/S-construction
def SConstruction (W : WaldhausenCategory C) (n : ℕ) : WaldhausenCategory (Sₙ C)
def SConstruction.cofibration : the latching condition
def SConstruction.face / SConstruction.degeneracy : exact functors
theorem SConstruction.simplicial : simplicial identities
def SConstruction.two_eq_ext : S₂ C ≌ category of cofibration sequences
  -- for WaldhausenCategory.ofExact E, the pinned E.ConflationCategory
example S2_is_extension : SConstruction.two_eq_ext := sorry
example faces_exact : faces and degeneracies are exact := sorry
example latching_not_objectwise : an objectwise cofibration need not be one of S₂ := sorry
example S1_trivial : S₀ C is trivial and S₁ C ≌ C := sorry

-- K.4:construction/K-theory-space-of-a-waldhausen-category
def WaldhausenCategory.KSpace (W : WaldhausenCategory C) : BasedSpace := LoopSpace |wS.C|
def WaldhausenCategory.KGroup (W) (n : ℕ) : Type w := PiGroup (n + 1) |wS.C|
def WaldhausenCategory.pi1_eq_K0 : PiGroup 1 |wS.C| ≃+ W.K0
def WaldhausenCategory.KSpace_map (F : W.exactFunctor W') : BasedMap W.KSpace W'.KSpace
def WaldhausenCategory.hSpace : H-space structure from the coproduct
def WaldhausenCategory.iteratedS (W) (n : ℕ) : multisimplicial Waldhausen category S.ⁿ C
example pi1_is_K0 : WaldhausenCategory.pi1_eq_K0 := sorry
example exact_category_case : groups of ofExact E agree with KGroup E (iS-versus-Q) := sorry
example not_group_completion : |wC| → KSpace is not an equivalence in general := sorry
example trivial_category : KSpace of the zero Waldhausen category is contractible := sorry

-- K.4:construction/iS-versus-Q
theorem iSEquivQ (E : ExactStructure C) :
  BasedHomotopyEquiv |iS.(WaldhausenCategory.ofExact E)| (QBasedSpace E)

-- K.4/waldhausen-additivity (parent K.4:construction)
theorem waldhausenAdditivity (W : WaldhausenCategory C) :
  BasedHomotopyEquiv |wS.(S₂ C)| (BasedProduct |wS.C| |wS.C|)

-- K.4/delooping-and-the-spectrum (parent K.4:construction). Needs the H.2 realisation
-- theorem for levelwise fibration sequences (connected bases, good simplicial spaces).
noncomputable def relativeSFibration (f : W.exactFunctor W') :
  HomotopyFibrationSequence (Ω|wS.(S.W)| → |wS.W'| → |wS.(S.f)| → |wS.(S.W)|)
theorem relativeSFibration_first (f) : first map ≃ |wS.f| after |wS.W| ≃ Ω|wS.(S.W)|
noncomputable def iteratedSDeloopingEquiv (W : WaldhausenCategory C) (n : ℕ) (hn : 1 ≤ n) :
  BasedHomotopyEquiv |wS.ⁿ C| (LoopSpace |wS.ⁿ⁺¹ C|)
-- H.5:S-delooping alone assembles the Ω-spectrum; generic smash is H.5:spectra's and
-- biexact K-pairings are K.7's. The first map |wC| → Ω|wS.C| is canonical;
-- it is not a group completion for arbitrary Waldhausen categories. For finite abelian p-groups,
-- exact K₀ imposes [ℤ/p²] = 2[ℤ/p], unlike the group completion of the direct-sum monoid.
-- For f = id_C, S₀f ≃ C; the path contraction uses its augmentation to S₀C = 0.

Late K.4: fibration (cylinder, saturation, extension named), approximation (its two
approximation conditions and the cylinder axiom), Gillet–Waldhausen (an exact category
inside a given abelian category M, closed under kernels of surjections in M;
quasi-isomorphisms computed in M). Their signatures await the structures above.

K.5.

-- K.5/relative-K-theory
noncomputable def relativeK {R S : Type u} [Ring R] [Ring S] (f : R →+* S) : BasedSpace :=
  HomotopyFibre (KSpace.ofRing_map f)
def relativeK.group (f) (n : ℕ) := PiGroup n (relativeK f)
instance relativeK.addCommGroup (f) (n : ℕ) : AddCommGroup (relativeK.group f n)
theorem relativeK.les (f) : long exact sequence with KSpace.ofRing, ending at π₀ of the source
noncomputable def relativeK.ofPair {R : Type u} [Ring R] (I : Ideal R) [I.IsTwoSided] :
  BasedSpace := relativeK (Ideal.Quotient.mk I)
-- its identification with K₀(I), K₁(R, I) is KTheoryLowDegrees U.6's, not asserted here
noncomputable def relativeK.waldhausen (F : W.exactFunctor W') : BasedSpace :=
  LoopSpace (LoopSpace |wS.(S.F)|)
example identity_map : relativeK (RingHom.id R) is contractible := sorry
example split_pair : with a ring section, relativeK.group (Ideal.Quotient.mk I) n
  ≃+ ker (K_n R → K_n (R ⧸ I)) := sorry
example abelian_in_degree_zero : relativeK.addCommGroup f 0 := sorry
example waldhausen_extra_term : the Waldhausen sequence ends in coker (K₀ W → K₀ W') := sorry

-- K.5/nonunital-rings-and-unitisation (Mathlib's Unitization ℤ I)
noncomputable def nonunitalK (I : Type u) [NonUnitalRing I] : BasedSpace
def nonunitalK.map / nonunitalK.compare (to relativeK.ofPair) / nonunitalK.of_unital /
  nonunitalK.unitization_pinned
example unital_case : nonunitalK.of_unital := sorry
example functorial : nonunitalK.map respects composition := sorry
example comparison_exists : nonunitalK.compare := sorry
example no_excision_claimed : nonunitalK.compare is not asserted to be an equivalence := sorry

-- K.5/excision-and-its-failure: degree 0 always; degree 1 iff I = I²; H-unital rings.

-- K.5/milnor-square-K1-exactness and K.5/milnor-square-mayer-vietoris. A Milnor square is
-- φ : S →+* C surjective, ψ : T →+* C, B = RingHom.pullback φ ψ (KTheoryLowDegrees Z.1's
-- convention). K₀ is RingK0 (≃ π₀ of KSpace.ofRing); K₁ is U.2's classical GL/E.
theorem milnor_exact_K1_pair (hφ : Function.Surjective φ) :
  exactness of K₁(B) → K₁(S) × K₁(T) → K₁(C) at K₁(S) × K₁(T)
theorem milnor_mayerVietoris (hφ : Function.Surjective φ) :
  K₁(B) → K₁(S) × K₁(T) → K₁(C) →∂ RingK0 B → RingK0 S × RingK0 T → RingK0 C
  exact at the four interior terms, ∂ = Z.1/milnor-boundary; no K₂ term, no higher excision.
-/
end ExactCategoryBaseline

/- Transfer uses H(R), the modules admitting
finite resolutions by finitely generated projectives. Its source is V.3.3.2,
not the G-theory base-change construction V.3.5. The all-degree projection
formula consumes the requested early K.7 biexact product interface. -/

/- Review: the free/projective K₀ counterexample needs a class outside the
free subgroup (e.g. a nontrivial determinant over a Dedekind domain). Mere
non-freeness, as for a stably free module, does not establish this. -/

/- Future proof-input signatures below use the specific constructions of the packets.
Their based-space, Waldhausen and spectrum suppliers must exist before elaboration. -/
/-
-- K.2:plus/extension-fibre-product
def ExtFibre (E : ExactStructure C) (X : C) : Type u
instance : Groupoid (ExtFibre E X)
def ExtFibre.tensor (e₁ e₂ : ExtFibre E X) : ExtFibre E X
  -- kernel A₁⊞A₂, middle pullback B₁×_X B₂, quotient X
def ExtFibre.unit (E : ExactStructure C) (X : C) : ExtFibre E X
  -- 0 ↣ X = X
def ExtFibre.split (E : ExactStructure C) (X : C) : Core C ⥤ ExtFibre E X
  -- A ↦ A ↣ A⊞X ↠ X; strong symmetric monoidal and faithful
theorem ExtFibre.splitEssentiallySurjective (hE : E = ExactStructure.split C) :
  (ExtFibre.split E X).EssSurj := sorry
example fibre_product_zero (e₁ e₂ : ExtFibre E 0) :
  fibreZeroEquiv.obj (ExtFibre.tensor e₁ e₂) ≅
    fibreZeroEquiv.obj e₁ ⊞ fibreZeroEquiv.obj e₂ := sorry
example fibre_product_split (A B : Core C) :
  ExtFibre.tensor ((ExtFibre.split E X).obj A) ((ExtFibre.split E X).obj B) ≅
    (ExtFibre.split E X).obj (A ⊞ B) := sorry
example nonsplit_fibre (e : ExtFibre E X) (h : ¬ e.sequence.Splitting.Nonempty) :
  ¬ Nonempty (e ≅ (ExtFibre.split E X).obj (Core.mk e.kernel)) := sorry

-- K.2:plus/extension-cartesian-lifts
def ExtCat.baseChange (φ : QCat.mk X' ⟶ QCat.mk X) : ExtFibre E X ⥤ ExtFibre E X'
def ExtCat.cartesianArrow (φ : QCat.mk X' ⟶ QCat.mk X) (e : ExtFibre E X) :
  fibreInclusion.obj ((ExtCat.baseChange φ).obj e) ⟶ fibreInclusion.obj e
def ExtCat.baseChange_comp (ψ : QCat.mk X'' ⟶ QCat.mk X') (φ : QCat.mk X' ⟶ QCat.mk X) :
  ExtCat.baseChange (ψ ≫ φ) ≅ ExtCat.baseChange φ ⋙ ExtCat.baseChange ψ
def ExtCat.baseChange_zero_inflation (e : ExtFibre E X) :
  fibreZeroEquiv.obj ((ExtCat.baseChange (QCat.inflation (0 ⟶ X) zeroInflation)).obj e) ≅
    Core.mk e.kernel
def ExtCat.baseChange_zero_deflation (e : ExtFibre E X) :
  fibreZeroEquiv.obj ((ExtCat.baseChange (QCat.deflation (X ⟶ 0) zeroDeflation)).obj e) ≅
    Core.mk e.middle
example cartesian_identity (e : ExtFibre E X) :
  (ExtCat.baseChange (𝟙 (QCat.mk X))).obj e ≅ e := sorry
example cartesian_direction (e : ExtFibre E X) :
  ExtCat.quot.map (ExtCat.cartesianArrow φ e) = φ := sorry
example zero_lifts (A : Core C) :
  the two zero-lift isomorphisms for (ExtFibre.split E X).obj A have
  targets A and A⊞X respectively := sorry

-- K.2:plus/localised-extension-fibre-equivalence, localised-extension-fibration,
-- extension-category-contractibility. Monoidal localization and action category are H.4's.
def extFibreLocalizedEquiv (hE : E = ExactStructure.split C) (X : C) :
  BasedHomotopyEquiv |nerve (monoidalLocalization (Core C) (Core C))|
    |nerve (monoidalLocalization (Core C) (ExtFibre E X))| := sorry
theorem extLocalizedFibration (hE : E = ExactStructure.split C) :
  IsHomotopyFibration fibreZeroInclusion (localizedQuotient E) := sorry
def extCategoryContractible (E : ExactStructure C) :
  BasedHomotopyEquiv |nerve (ExtCat E)| PointSpace := sorry
def extLocalizedContractible (hE : E = ExactStructure.split C) :
  BasedHomotopyEquiv |nerve (monoidalLocalization (Core C) (ExtCat E))| PointSpace := sorry

-- K.4:construction/object-S-isomorphism-homotopy
def objectSFunctorIsoHomotopy (e : F ≅ G) :
  SSet.Homotopy (objectSMap F) (objectSMap G) := sorry
def objectSToIsoSEquiv : BasedHomotopyEquiv |objectS W| |nerve (isoS W)| := sorry

-- K.4:construction/additivity-simplex-fibre
def AdditivityFibre (W : WaldhausenStructure C) (y : (objectS W).obj ⟨n⟩) : SSet
  -- Δ[n] ×_{objectS W} objectS (extensionStructure W)
def AdditivityFibre.quotient : AdditivityFibre W y ⟶ objectS W
def AdditivityFibre.lastVertexSection : objectS W ⟶ AdditivityFibre W y
theorem AdditivityFibre.quotient_section :
  AdditivityFibre.lastVertexSection ≫ AdditivityFibre.quotient = 𝟙 (objectS W) := sorry
example additivity_fibre_zero :
  BasedHomotopyEquiv |AdditivityFibre W zeroSimplex| |objectS W| := sorry
example additivity_quotient_section :
  AdditivityFibre.lastVertexSection ≫ AdditivityFibre.quotient = 𝟙 (objectS W) := sorry
example additivity_fibre_not_point (p : ℕ) [Fact p.Prime] :
  π₁ |objectS (finiteAbelianPGroupExactStructure p)| ≃+ ℤ := sorry

-- K.4:construction/additivity-pushout-homotopy, object-S-additivity
def additivityPushoutHomotopy :
  SSet.Homotopy (𝟙 (AdditivityFibre W y))
    (AdditivityFibre.quotient ≫ AdditivityFibre.lastVertexSection) := sorry
def objectSAdditivityEquiv :
  BasedHomotopyEquiv |objectS (extensionStructure W)| (|objectS W| × |objectS W|) := sorry

-- K.4/trivial-cofibration-nerve and localization-relative-S-comparison
def trivialCofibrationNerveEquiv (W : WaldhausenStructure C)
    (cyl : WaldhausenCylinder W) (saturation : W.Saturated) :
  BasedHomotopyEquiv |nerve (trivialCofibrations W)| |nerve (weakEquivalences W)| := sorry
def relativeSTrivialCofibrationEquiv (v w : WaldhausenStructure C)
    (hvw : v.weakEquivalences ≤ w.weakEquivalences) (extension : w.Extensional) (n : ℕ) :
  S_n (relativeS (trivialObjectInclusion v w)) ≌ trivialCofibrationChains w n := sorry
-- The same-object change of weak equivalences has a surjective K₀ map.
theorem changeWeakEquivalencesK0_surjective :
  Function.Surjective (changeWeakEquivalencesMap v w hvw 0) := sorry

-- K.4/approximation-lifts-S-filtrations
theorem approximation_S (F : ExactWaldhausenFunctor W W')
    (hF : ApproximationProperty F) (n : ℕ) :
  ApproximationProperty (S_nMap F n) := sorry

-- K.4/iterated-mapping-cylinder
def IteratedCylinder (cyl : WaldhausenCylinder W) (a : ComposableString C n) : C
def IteratedCylinder.projection (a : ComposableString C n) : IteratedCylinder cyl a ⟶ a.last
def IteratedCylinder.face (i : Fin (n+1)) :
  IteratedCylinder cyl (a.face i) ⟶ IteratedCylinder cyl a
theorem IteratedCylinder.face_comp : the two codimension-two face maps agree := sorry
def Approximation.cylinderDiagram (q : X ⟶ nerve (weakComma F B)) :
  nondegenerateSimplexCategory X ⥤ weakComma F B
example iterated_cylinder_vertex (A : C) : IteratedCylinder cyl (singletonString A) = A := sorry
example iterated_cylinder_edge (f : A ⟶ B) :
  IteratedCylinder cyl (edgeString f) = cyl.obj f := sorry
example iterated_cylinder_faces : IteratedCylinder.face_comp := sorry
example iterated_cylinder_weak (a : WeakEquivalenceString W n) :
  W.weakEquivalences (IteratedCylinder.projection a) := sorry
-- K.4/approximation-cylinder-boundary: actual latching map, not a placeholder condition.
theorem approximationCylinderBoundary (x : NondegenerateSimplex X n) :
  W.cofibrations (cylinderDiagramExtension.map (boundaryInclusion x)) := sorry
-- K.4/approximation-comma-contractibility
def approximationCommaContractible (hF : ApproximationProperty F)
    (cyl : WaldhausenCylinder W) (sat : W.Saturated) (sat' : W'.Saturated) (B : C') :
  BasedHomotopyEquiv |nerve (weakComma F B)| PointSpace := sorry

-- K.4:construction/edgewise-S-Q-diagrams
def SConstruction.edgewiseQ (E : ExactStructure C) :
  edgewiseSubdivision (isoS E) ⟶ isoQNerve E
def SConstruction.edgewiseQ_degreeEquiv (n : ℕ) : isoS_n E (2*n+1) ≌ isoQ_n E n
theorem SConstruction.edgewiseQ_faces : edgewise faces agree with Q-span composition := sorry
theorem SConstruction.edgewiseQ_degeneracies : duplication inserts identity Q-spans := sorry
example edgewise_Q_zero : SConstruction.edgewiseQ_degreeEquiv E 0 is identity on Core C := sorry
example edgewise_Q_span (q : AdmissibleQSpan E X Y) :
  the inverse flag is q.kernel ↣ q.middle ↣ Y := sorry
example edgewise_Q_composition : SConstruction.edgewiseQ_faces := sorry

-- K.3/localization-isomorphic-comma-subcategory
def localizationIsoCommaEquiv (S : SerreClass A) (L : SerreQuotient S) :
  BasedHomotopyEquiv |nerve (quotientIsoComma S L)| |nerve (quotientQComma S L)| := sorry

-- K.3/localization-model-category
def LocalizationModel (S : SerreClass A) (N : A) : Type u
instance : Category (LocalizationModel S N)
def LocalizationModel.kernel : LocalizationModel S N ⥤ QCat (SerreExactStructure S)
def LocalizationModel.epimorphic : ObjectProperty (LocalizationModel S N)
def LocalizationModel.postcompose (g : N ⟶ N') (hg : IsIso (quotientFunctor S |>.map g)) :
  LocalizationModel S N ⥤ LocalizationModel S N'
theorem LocalizationModel.postcompose_id : postcompose (𝟙 N) _ = 𝟭 _ := sorry
theorem LocalizationModel.postcompose_comp : postcompose (g ≫ g') _ = postcompose g _ ⋙ postcompose g' _ := sorry
def LocalizationModel.kernel_postcompose :
  LocalizationModel.kernel ⟶ LocalizationModel.postcompose g hg ⋙ LocalizationModel.kernel
example localization_identity_model : kernelObject (identityModel S N) ≅ 0 := sorry
example localization_model_epic (e : LocalizationModel S N) [Epi e.map] :
  ShortExact (ShortComplex.mk (kernel.ι e.map) e.map (kernel.condition e.map)) := sorry
example localization_model_postcomposition :
  (LocalizationModel.kernel_postcompose g hg).naturality f := sorry

-- K.3/localization-epimorphic-kernel-equivalence, localization-epimorphic-models,
-- localization-filtered-models
def localizationEpicKernelEquiv :
  BasedHomotopyEquiv |nerve (LocalizationModel.epimorphic S N).FullSubcategory|
    |nerve (QCat (SerreExactStructure S))| := sorry
def localizationEpicModelEquiv :
  BasedHomotopyEquiv |nerve (LocalizationModel.epimorphic S N).FullSubcategory|
    |nerve (LocalizationModel S N)| := sorry
def localizationModelColimitEquiv :
  (filteredModelColimit S L) ≌ quotientIsoComma S L := sorry
def localizationZeroInflationBaseChangeEquiv :
  BasedHomotopyEquiv |nerve (quotientQComma S L)| |nerve (quotientQComma S 0)| := sorry
-/


/- Typed future interfaces. Each carrier is the concrete object planned in the packet,
not an arbitrary Type parameter that could make a meaningless theorem elaborate. -/

/-!
GeneralAlgebraicKTheory:K.4:construction/waldhausen-factorization
A Waldhausen category has factorization if every morphism f:A→B is a composite A↣Z→B of a cofibration and a weak equivalence. This is an existence property; no functorial assignment of Z is part of it.
-/
/-
def WaldhausenFactorization (W : WaldhausenStructure C) : Prop :=
  ∀ {A B : C} (f : A ⟶ B), ∃ (Z : C) (i : A ⟶ Z) (q : Z ⟶ B),
    W.cofibrations i ∧ W.weakEquivalences q ∧ i ≫ q = f
-/

/- Planning API:
Waldhausen.HasFactorization: Every map admits the specified cofibration–weak-equivalence composite.
Waldhausen.HasFactorization.factor: For a given map, obtain an existential intermediate object and the two arrows.
Waldhausen.HasFactorization.ofCylinder: A cylinder satisfying its axiom supplies this existence property.
-/

/- Unit-test obligations:
factor_cofibration: For a cofibration f, factor it as f followed by identity.
factor_identity: The identity map factors through its own source, with both arrows identity.
factor_not_automatic: Finite pointed sets with monomorphism cofibrations and isomorphism weak equivalences fail the property: the collapse from a two-element pointed set to a point cannot be a monomorphism followed by an isomorphism.
-/

/-!
GeneralAlgebraicKTheory:K.4:construction/cofibrant-poset-diagrams
For a finite poset P, define the cofibrations in C^P by the latching condition: X→Y is cofibrant at p if the colimit over ({0}×{p})∪([1]×P_{<p}) exists and its map to Y(p) is a cofibration. Weak equivalences are pointwise. Cofibrant diagrams have colimits, assembled by finitely many pushouts along cofibrations.
-/
/-
def CofibrantPosetDiagram (W : WaldhausenStructure C) (P : FiniteDirectPoset) :
  ObjectProperty (P ⥤ C) := fun D => ∀ p, W.cofibrations (latchingMap D p)
-/

/- Planning API:
CofibrantPosetDiagram: The finite-poset diagram with the specified latching cofibrations.
CofibrantPosetDiagram.latching: The relative colimit at each vertex.
CofibrantPosetDiagram.colimit: The colimit exists and is built by cofibration pushouts.
CofibrantPosetDiagram.structural_cof: The target’s structural arrows are cofibrations if those of the source are.
CofibrantPosetDiagram.map: Natural transformations satisfying the latching condition are its cofibrations.
-/

/- Unit-test obligations:
poset_diagram_empty: For empty P the colimit is the zero object.
poset_diagram_singleton: For singleton P the latching condition is exactly the original cofibration condition.
poset_diagram_objectwise_not_enough: In finite pointed sets on [1], take X constant at a point and Y(0) a two-element pointed set, Y(1) a point, with collapse structural map. The map X→Y is objectwise injective, but its latching map is the collapse Y(0)→Y(1), hence is not a cofibration.
-/

/-!
GeneralAlgebraicKTheory:K.4/finite-poset-factorization
If C has factorization, every map X→Y of finite-poset diagrams factors X↣Z→Y into a latching cofibration and a pointwise weak equivalence.
-/
/-
def factorFinitePosetDiagram (h : WaldhausenFactorization W) (P : FiniteDirectPoset)
    (f : D ⟶ E) : DiagramCofibrationWeakFactorization W P f
-/

/-!
GeneralAlgebraicKTheory:K.4/approximation-factorization-comma
Suppose F:A→B satisfies approximation, A has factorization, and both weak-equivalence classes are saturated. Then every comma category (wF↓B) is contractible.
-/
/-
def finiteApproximationCone (F : ExactWaldhausenFunctor W W') (h : ApproximationProperty F)
    (D : FiniteDirectDiagram (weakComma F B)) : ∃ X, Nonempty (WeakDiagramCone D X)
-/

/-!
GeneralAlgebraicKTheory:K.4/approximation-with-factorizations
Under the preceding saturation, factorization and App1/App2 hypotheses, F:wA→wB and wS.F:wS.A→wS.B induce equivalences on nerve realizations and hence on K-theory.
-/
/-
def approximationFactorizationEquiv (F : ExactWaldhausenFunctor W W')
    (hF : ApproximationProperty F) (h : WaldhausenFactorization W) : KSpace W ≃ₕ* KSpace W'
-/

/-!
GeneralAlgebraicKTheory:K.4/acyclic-cofibrations-with-factorizations
For a saturated Waldhausen category with factorization, the inclusion wC∩cofC→wC induces a nerve equivalence.
-/
/-
def acyclicCofibrationSComparison (h : WaldhausenFactorization W) :
  |nerve (acyclicCofibrations (SConstruction W))| ≃ₕ* |nerve (weakEquivalences (SConstruction W))|
-/

/-!
GeneralAlgebraicKTheory:K.4/fibration-with-factorizations
Let v⊂w be weak equivalences on the same cofibration category, with both Waldhausen structures. If the w structure has factorization and w satisfies saturation and extension, K(C^w,v)→K(C,v)→K(C,w) is a homotopy fibration. The K₀ map of the last two terms is surjective.
-/
/-
def factorizationFibration (v w : WaldhausenWeakClass C) (hvw : v ≤ w)
    (hfact : WaldhausenFactorization (waldhausenWithWeak w)) (hw : SaturatedExtensionClass w) :
  KSpace (wAcyclicWithWeak v w) ≃ₕ* homotopyFiber (KWeakMap hvw)
-/

/-!
GeneralAlgebraicKTheory:K.3/grothendieck-class-weak-equivalences
For p:K₀(C,v)↠G define w_p by f:A→B ∈w_p iff p[B]=p[A]. For a cofibration this is equivalent to p[B/A]=0. Then v⊂w_p, the new structure has factorization, and w_p is saturated and satisfies extension. Its acyclic objects form C₀={A | p[A]=0}.
-/
/-
def KTheory.classWeakEquivalences (p : W.K0 →+ G) (hp : Function.Surjective p) :
    MorphismProperty C :=
  fun X Y _ => p (classOf X) = p (classOf Y)
-- The old weak equivalences are contained in this class; they are not a conjunct.
-- In particular, p=0 makes every morphism class-weak.
-/

/- Planning API:
KTheory.classWeakEquivalences: A map lies in w_p exactly when p[B]=p[A].
KTheory.classWeakEquivalences_cof: On cofibrations it is the zero class of the quotient.
KTheory.classWeakEquivalences_contains: The original weak equivalences are contained in w_p.
KTheory.classWeakEquivalences_saturated: The new structure satisfies saturation, extension and the Waldhausen gluing axiom.
KTheory.classAcyclic: The acyclic objects are exactly the kernel-class objects.
-/

/- Unit-test obligations:
class_weak_zero: For p=0, every map is class-weak.
class_weak_identity: Identity maps always preserve p-class.
class_weak_cof_quotient: A cofibration with quotient D is class-weak exactly when p[D]=0.
class_weak_not_all: For bounded complexes of finite-dimensional k-vector spaces with quasi-isomorphisms and p=Euler characteristic:K₀≅Z, the map0→k concentrated in degree0 is not class-weak.
-/

/-!
GeneralAlgebraicKTheory:K.3/grothendieck-class-fibre-nerve
For each n, w_pS_nC→G^n sends a filtration to its successive p-class increments and induces a nerve equivalence. These equivalences are compatible with simplicial faces and degeneracies, and identify |w_pS.C| with BG.
-/
/-
def classWeakSLoopEquiv (A : ExtensionClosedCofinalWaldhausenSubcategory W) :
  loops |nerve (classWeakSConstruction A)| ≃ₕ* discreteBasedSpace (cokernel (k0Map A.inclusion))
-/

/-!
GeneralAlgebraicKTheory:K.3/cofinality-with-factorizations
For C₀={A | p[A]=0}, K(C₀,v)→K(C,v)→G_discrete is a homotopy fibration. Hence K_i(C₀,v)≅K_i(C,v) for i>0 and K₀(C₀,v) identifies with ker(p)⊂K₀(C,v).
-/
/-
def cofinalityFactorizationFibre (A : SaturatedExtensionClosedCofinalWaldhausenSubcategory W) :
  KSpace A ≃ₕ* homotopyFiber (classComponentMap A)
-/

/-!
GeneralAlgebraicKTheory:K.4:construction/weak-double-nerve-swallow
If A⊂B is a wide subcategory, the double category AB of commuting squares with vertical arrows in A and horizontal arrows in B has nerve realization equivalent to NB via constant vertical strings. Applied to wS_nC it removes the extra weak-map nerve direction in the pairing.
-/
/-
def weakDoubleSwallowEquiv (W : WaldhausenStructure C) :
  |doubleNerve (weakDoubleCategory (SConstruction (SConstruction W)))| ≃ₕ*
  |nerve (weakEquivalences (SConstruction (SConstruction W)))|
-/

/-!
GeneralAlgebraicKTheory:K.3/additive-functor-relative-K0
For an additive functor T:C→D between small additive categories, define K₀^cl(T) by triples(P,α,Q), α:TP≅TQ, modulo isomorphism, direct-sum additivity and [(P,α,Q)]+[(Q,β,R)]=[(P,βα,R)]. Its difference map sends the triple to[P]−[Q] in split K₀(C). The convention for idempotent completions is stated with each application.
-/
/-
def ClassicalRelativeK0 (T : AdditiveFunctor C D) : AddCommGrp :=
  quotientByTripleRelations (freeTripleGroup T)
def ClassicalRelativeK0.triple (P Q : C) (α : T.obj P ≅ T.obj Q) : ClassicalRelativeK0 T
-/

/- Planning API:
RelativeAdditiveTriple: Objects P,Q of C and an isomorphism TP≅TQ.
ClassicalRelativeK0: The abelian group presented by triple sum and composition relations.
ClassicalRelativeK0.difference: The map to split K0(C),[(P,α,Q)]↦[P]−[Q].
ClassicalRelativeK0.map: Maps from additive commuting squares with a specified comparison isomorphism.
-/

/- Unit-test obligations:
relative_identity: For T=id, every triple is induced by an isomorphism in C and its class is zero.
relative_zero_functor: For C→0, the difference map identifies this group with split K0(C).
relative_not_nonsplit: On finite abelian p-groups the split group remembers cyclic-length summands; do not impose all short exact sequences unless using the exact version.
-/

/-!
GeneralAlgebraicKTheory:K.3/additive-functor-stable-boundary
If every object of D is a direct summand of some TP, there is a natural boundary δ:K₁^cl(D)→K₀^cl(T). Choose X⊕Y≅TP and extend α∈Aut(X) by id_Y; send it to[(P,α⊕id_Y,P)]. The result is independent of complements and transports.
-/
/-
def stableClassicalBoundary (T : AdditiveFunctor C D) (hT : DirectSummandCofinal T) :
  ClassicalK1 D →+ ClassicalRelativeK0 T
-/

/-!
GeneralAlgebraicKTheory:K.3/additive-functor-five-term
For a cofinal additive T:C→D, K₁^cl(C)→K₁^cl(D)→K₀^cl(T)→K₀^split(C)→K₀^split(D) is natural and exact at its three interior terms. No surjectivity onto the last K0(D) is asserted.
-/
/-
def additiveFunctorFiveTerm (T : AdditiveFunctor C D) (hT : DirectSummandCofinal T) :
  ExactFiveTerm (ClassicalK1 C) (ClassicalK1 D) (ClassicalRelativeK0 T) (SplitK0 C) (SplitK0 D)
-/

/-!
GeneralAlgebraicKTheory:K.5/relative-triples-to-components
For f:R→S, the natural triple/path comparison K₀^cl(f*)→π₀fib(K(R)→K(S)) is an isomorphism. It takes(P,α,Q) to the virtual difference[P]−[Q] with the path to zero supplied by α:f*P≅f*Q. It respects the K1(S) boundary.
-/
/-
def relativeTripleComponentEquiv (f : R →+* S) : ClassicalRelativeK0 (extendScalars f) ≃+
  π 0 (homotopyFiber (KMap f))
-/

/-!
GeneralAlgebraicKTheory:K.5/ideal-zero-patching
For I⊂R, the classical triple group K0^cl(R→R/I) is naturally ker(K0(R⋉I)→K0(R)), where(R⋉I) has multiplication(r,i)(s,j)=(rs,rj+is+ij). The two projections are r and r+i. The comparison respects the automorphism boundary and the map to K0(R).
-/
/-
def idealRelativeZeroEquiv (I : TwoSidedIdeal R) : ClassicalRelativeK0 (extendScalars (quotientMap I)) ≃+
  ker (ringK0Map (splitAugmentation I))
-/

/-!
GeneralAlgebraicKTheory:K.5/ideal-degree-zero-excision
If f:R→S identifies I with an ideal J of S, then π0K(R,I)→π0K(S,J) is an isomorphism. Its proof is early K5 and does not depend on late U6 relative π1.
-/
/-
def idealK0Excision (f : IdealIsomorphism R I S J) :
  π 0 (relativeK.ofPair I) ≃+ π 0 (relativeK.ofPair J)
-/

/-!
GeneralAlgebraicKTheory:K.3/finite-field-transfer-base-change
For E/F finite and F′/F any field extension, write B=E⊗F F′=∏B_j, with residue fields E_j and local lengths ℓ_j=length_(B_j)B_j. Then res_(F′/F) Tr_(E/F)=Σ_j ℓ_j Tr_(E_j/F′)res_(E_j/E) on every connective K_n. Multiplicity is local module length, not the nilpotence exponent of the maximal ideal.
-/
/-
theorem finiteFieldTransferBaseChange (E F F') (x : KGroup.ofRing E n) :
  restrict (transfer x) = ∑ j, (artinCompositionLength j : ℤ) • transfer (restrictToResidue j x) := sorry
-/

/-!
GeneralAlgebraicKTheory:K.3/localization-degree-one-index
For a Serre subcategory B⊂A and α:X→X becoming invertible in A/B, the boundary of its K1 class is[cokerα]−[kerα] in K0(B). For a central element s inverted in a noetherian ring, this gives ∂[s]=[R/sR]−[ann_R(s)] in the torsion Grothendieck group.
-/
/-
theorem quotientAutomorphismBoundary (α : X ⟶ X)
    (hα : IsIso ((serreQuotientFunctor B).map α)) :
  localizationBoundary (automorphismK1 hα) = classOf (cokernel α) - classOf (kernel α) := sorry
-/

/-!
GeneralAlgebraicKTheory:K.3/dvr-degree-one-boundary
For a DVR R with fraction field F, residue field k and uniformizer π, the K1(F)=F×→K0(k)=Z boundary sends π to1 and a to v(a). This is the ring-level supplier of the tame-symbol comparison; S3 imports its scheme version.
-/
/-
theorem dvrBoundaryOne (A : DiscreteValuationRing) (x : A.fractionFieldˣ) :
  localizationBoundary (unitK1 x) = normalizedValuation x := sorry
-/

/-!
GeneralAlgebraicKTheory:K.3/localization-product-boundary
A biexact pairing A×C→A′ preserving the Serre subcategories induces ∂(x·y)=∂x·y on the right for x in K(A/B) and y in K(C). On the left the graded formula is ∂(y·x)=(−1)^deg(y)y·∂x. Thus δ_n=(−1)^(n−1)∂_n is the uniformizer-last Milnor boundary normalization in degree n.
-/
/-
theorem localizationBoundaryProduct (x : KGroup.ofRing (localizedRing R) n) (y : KGroup.ofRing R m) :
  localizationBoundary (kProduct x (localizationMap y)) = kProduct (localizationBoundary x) y := sorry
theorem localizationBoundaryProduct_left (y : KGroup.ofRing R m) (x : KGroup.ofRing (localizedRing R) n) :
  localizationBoundary (kProduct (localizationMap y) x) = (-1 : ℤ)^m • kProduct y (localizationBoundary x) := sorry
-/

/-!
GeneralAlgebraicKTheory:K.3/one-step-resolution-comma
For a resolving full exact P⊂H, closed under extensions and kernels of admissible epimorphisms, and with P-epimorphisms onto every H-object, QP→QH is a homotopy equivalence.
-/
/-
def oneStepResolutionQEquiv (h : OneStepResolvingSubcategory P H) : |nerve (QCat P)| ≃ₕ* |nerve (QCat H)|
-/

/-!
GeneralAlgebraicKTheory:K.3/bounded-resolution-filtration
Under the resolving hypotheses, H_n={M:resolution length≤n by P} is extension closed, H_n⊂H_(n+1) satisfies the one-step theorem, and K(P)≃K(H) if every H-object has finite P-resolution.
-/
/-
def finiteResolutionKEquiv (h : ResolvingSubcategory P H)
    (hfinite : ∀ M : H, ∃ n, Nonempty (AdmissiblePResolution P M n)) : KSpace P ≃ₕ* KSpace H
-/

/-!
GeneralAlgebraicKTheory:K.3/devissage-intersection-contraction
For B⊂A closed under subobjects, quotients and finite sums, with a finite B-filtration of each A-object, the layer comma category J(M) is contractible and QB→QA is a homotopy equivalence.
-/
/-
def devissageLayerContraction (h : DevissageSubcategory B A) (M : A) :
  |nerve (admissibleLayerPoset B M)| ≃ₕ* PointSpace
-/

/- K.2:plus/zero-one-ring-comparison — typed future interface, not elaborated.
Classical K0 and stable GL/E retain their U.1/U.2 owners.
def projectiveKSpace_pi0 (R : RingCat) : π₀ (KSpace.ofRing R) ≃+ RingK0 R
def projectiveKSpace_pi1 (R : RingCat) : π₁ (KSpace.ofRing R) ≃+ ClassicalRingK1 R
theorem projectiveKSpace_pi1_automorphism (P : FiniteProjectiveRightModule R)
    (α : P ≅ P) : projectiveKSpace_pi1 R (automorphismLoop α) = stableAutomorphismClass α := sorry
theorem projectiveKSpace_pi1_natural (f : R →+* S) :
  projectiveKSpace_pi1 S ∘ projectiveKSpace_pi1Map f =
    classicalRingK1Map f ∘ projectiveKSpace_pi1 R := sorry
-/

-- Part II: Bass and Frobenius nonconnective theory; products and invariance.

/- Future adapters used consistently throughout Part II; these are signature sketches,
not opaque variables or implementations. KGroup and KSpace take an exact structure first.
noncomputable def KGroup.ofRing (R : Type u) [Ring R] (n : ℕ) : Type u :=
  KGroup (finiteProjectiveModulesExactStructure R) n
noncomputable def NilCat.exactStructure (R : Type u) [Ring R] : ExactStructure (NilCat R)
-- It is the componentwise exact structure; NilCat.forget and NilCat.zero are exact.
def NilCat.forgetToProjectives (R : Type u) [Ring R] :
  NilCat R ⥤ (finiteProjectiveModules Rᵐᵒᵖ).FullSubcategory
-- Restricts the codomain of the executable NilCat.forget using each object's finite/projective fields.
noncomputable def ProjectiveLine.exactStructure (R : Type u) [Ring R] :
  ExactStructure (RingProjectiveLine.vectorBundles R)
-- It is induced from the abelian gluing-module category.
-- connectiveK is the spectrum of a specified Waldhausen structure; connectiveK.ofRing
-- applies it to finite projectives, while A.waldhausen gives a Frobenius pair's model.
-- Based-space homotopies are not equalities of point-set maps. Spectrum equivalences and
-- homotopies need the genuine H.5 interfaces; the spectral smash is never a product.
-/

/-!
GeneralAlgebraicKTheory:K.6/flasque-rings-and-the-swindle
A ring is FLASQUE, in Karoubi's sense, when there is a bimodule M, finitely generated projective as a right module, together with a bimodule isomorphism from the direct sum of the ring with M onto M. For a flasque ring the zeroth K-group vanishes, because for every finitely generated projective P the natural isomorphism from the direct sum of P with its tensor product against M onto that tensor product makes the class of P equal to zero; this is the Eilenberg swindle. When the underlying right module structure on M is the ring itself the ring is called an INFINITE SUM RING, and the cone rings are examples, hence flasque. The notion has nothing to do with the flasque sheaves that both pinned libraries call by that name, and a formalisation must not reuse the name.
-/
/-- Karoubi's flasqueness data: a bimodule `M`, finitely generated projective as a right module,
with a bimodule isomorphism `R ⊕ M ≃ M`. Right modules are modules over `Rᵐᵒᵖ`. -/
structure IsFlasqueRing (R : Type u) [Ring R] : Type (u + 1) where
  M : Type u
  [instAddCommGroup : AddCommGroup M]
  [instLeft : Module R M]
  [instRight : Module Rᵐᵒᵖ M]
  [instComm : SMulCommClass R Rᵐᵒᵖ M]
  [instFinite : Module.Finite Rᵐᵒᵖ M]
  [instProjective : Module.Projective Rᵐᵒᵖ M]
  absorb : (R × M) ≃+ M
  absorb_smul_left : ∀ (r : R) (x : R × M), absorb (r • x) = r • absorb x
  absorb_smul_right : ∀ (r : Rᵐᵒᵖ) (x : R × M), absorb (r • x) = r • absorb x

/-- The cone ring: `ℕ × ℕ` matrices with finitely many nonzero entries in each row and column. -/
def coneRing (R : Type u) [Ring R] : Type u :=
  {A : ℕ → ℕ → R // (∀ i, {j | A i j ≠ 0}.Finite) ∧ (∀ j, {i | A i j ≠ 0}.Finite)}

instance (R : Type u) [Ring R] : Ring (coneRing R) := sorry

-- Test cone_ring_flasque
example (R : Type u) [Ring R] : Nonempty (IsFlasqueRing (coneRing R)) := sorry

/- Not stated here: `IsFlasqueRing.K0_eq_zero` (and test `K0_vanishes`) needs the early ring
K₀ of GeneralAlgebraicKTheory K.2, absent from Mathlib; its form is
`theorem IsFlasqueRing.K0_eq_zero (h : IsFlasqueRing R) : Subsingleton (RingK0 R)`.
`IsInfiniteSumRing`, `coneRing_isInfiniteSumRing` and test `infinite_sum_is_flasque` wait for the
choice of the left action on the regular right module (a ring endomorphism of `R`) recorded in
the packet; `IsFlasqueRing.not_sheaf_flasque` is a naming rule, not a Lean statement. -/

/- Planning API:
IsFlasqueRing (structure): The bimodule and the isomorphism witnessing flasqueness.
IsFlasqueRing.K0_eq_zero (characterisation): The zeroth K-group of a flasque ring vanishes.
IsInfiniteSumRing (structure): A flasque ring whose bimodule is the ring as a right module.
coneRing (data): The cone ring of a ring, the row-and-column finite infinite matrices.
coneRing_isInfiniteSumRing (example): The cone ring is an infinite sum ring, hence flasque.
IsFlasqueRing.not_sheaf_flasque (relation): The notion is unrelated to the sheaf-theoretic predicate the libraries call flasque.
-/

/- Unit-test obligations:
cone_ring_flasque: The cone ring of any ring is flasque.
K0_vanishes: The zeroth K-group of a flasque ring is trivial.
not_sheaf_notion: The predicate is about bimodules, not about sheaves; the pinned IsFlasque is a different statement.
infinite_sum_is_flasque: Every infinite sum ring is flasque, by taking the bimodule to be the ring.
-/

/-!
GeneralAlgebraicKTheory:K.6/contracted-functors
For a functor F from rings to abelian groups define LF(R) to be the cokernel of the difference map from the direct sum of F of the polynomial ring in t and of the polynomial ring in t inverse into F of the Laurent polynomial ring. Call F ACYCLIC when the four-term sequence, from F of the ring through those two, to the Laurent ring and onto LF, is exact for every ring; call it CONTRACTED when it is acyclic and the defining surjection onto LF admits a splitting natural in both the ring and the variable. Iterating gives the functors NLF and L-squared F. This is the machine that produces the negative K-groups, and the naturality of the splitting is the part that does the work.
-/
/-
def contraction (F : RingCat ⥤ AddCommGrp) : RingCat ⥤ AddCommGrp :=
  cokernel (polynomialDifference F)
structure ContractedRingFunctor (F : RingCat ⥤ AddCommGrp) where
  exact : RingFunctorFourTermExact F
  section : contraction F ⟶ laurentFunctor F
  section_rightInverse : section ≫ contractionProjection F = 𝟙 _
  variableNaturality : LaurentVariableNatural section
-/

/- Planning API:
contraction (data): The functor LF.
IsAcyclic (data): The acyclicity predicate.
IsContracted (structure): Acyclicity together with the natural splitting.
IsContracted.splitting (projection): The splitting, natural in the ring and the variable.
contraction_iterate (data): The iterates NLF and L-squared F.
IsContracted.sum (compatibility): A direct sum of contracted functors is contracted.
-/

/- Unit-test obligations:
K0_contracted: The zeroth K-group is a contracted functor.
iterate_agrees: The iterated contraction of the special first K-group is the first negative K-group.
naturality_in_t: The splitting is natural in the variable; a splitting natural only in the ring does not make the functor contracted.
retract_closed: A natural retract of a contracted functor is contracted.
-/

/-!
GeneralAlgebraicKTheory:K.6/negative-k-groups
For n positive define the n-th negative K-group of a ring inductively as the cokernel of the difference map from the direct sum of the (n-1)-st negative group of the two polynomial rings into that of the Laurent ring; the case n = 1 starts from the zeroth K-group of the early ring functor (K.2:plus). In the notation of the contraction this says K_{−n} = Lⁿ K_0 (Definition III.4.1.1). Each is a functor from rings to abelian groups. The first negative group is what the Fundamental Theorem for the zeroth K-group produces: that theorem gives a split exact sequence exhibiting the zeroth K-group of the Laurent ring as the direct sum of the zeroth group, the first negative group and two copies of the N-term, which is the obstruction to homotopy invariance. That K_0 and every K_{−n} are contracted functors, with that decomposition, is K.6/negative-k-groups-are-contracted; this node is the definition, and its identification with the negative homotopy of the Bass spectrum is K.6/bass-spectrum-homotopy-groups.
-/
/-
def negativeK (n : ℕ) : RingCat ⥤ AddCommGrp := (contractionIterate n ringK0Functor)
def negativeK_functor (f : R →+* S) (n : ℕ) : negativeK n R →+ negativeK n S
-/

/- Planning API:
negativeK (data): The n-th negative K-group.
negativeK_functor (functoriality): Functoriality in the ring.
negativeK_one (characterisation): The first negative group is the contraction of the zeroth K-group.
negativeK_eq_contraction_iterate (characterisation): K_{−n} = Lⁿ K_0: the n-th negative group is the n-fold contraction of the zeroth K-group.
negativeK_flasque (example): The negative groups of a flasque ring vanish.
negativeK_prod (compatibility): Compatibility with finite products of rings.
-/

/- Unit-test obligations:
regular_vanishes: For a regular noetherian ring the negative groups vanish.
flasque_vanishes: For a flasque ring they vanish.
laurent_four_pieces: The zeroth group of the Laurent ring decomposes into four named pieces.
not_from_connective: The groups are not the negative homotopy of the connective spectrum, which is zero; a formalisation that identified them would be wrong.
-/

/-!
GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring
Let R be a unital associative ring, not necessarily commutative. The category mod-P¹_R has as objects the triples F = (M₊, M₋, α) in which M₊ is a right R[t]-module, M₋ a right R[t⁻¹]-module and α : M₊ ⊗_{R[t]} R[t,t⁻¹] → M₋ ⊗_{R[t⁻¹]} R[t,t⁻¹] an isomorphism of R[t,t⁻¹]-modules; a morphism is a pair of module maps compatible with the gluing isomorphisms. It is abelian, with kernels and cokernels taken componentwise, because inverting the central element t is exact. VB(P¹_R) is the full exact subcategory of triples whose components M₊ and M₋ are finitely generated projective, and K(P¹_R) := K(VB(P¹_R)), the K-theory of that exact category (K.1, on a small model). The twist is F(n) = (M₊, M₋, t⁻ⁿα), with the two maps X₀ = (1, 1/t) and X₁ = (t, 1) from F(n−1) to F(n); the exact functors u_i : P(R) → VB(P¹_R) send P to (P[t], P[t⁻¹], tⁱ), so that u_i(P)(n) = u_{i−n}(P); and π_* and R¹π_* : mod-P¹_R → mod-R are the kernel and the cokernel of d : M₊ × M₋ → M₋ ⊗_{R[t⁻¹]} R[t,t⁻¹], d(x, y) = α(x) − y. This is NOT the scheme P¹ over an affine scheme Spec R: for noncommutative R there is no such scheme, and nothing here uses one. For commutative R the source records that mod-P¹_R and VB(P¹_R) are equivalent to the quasi-coherent sheaves and the vector bundles on the scheme P¹_R; that comparison belongs to SchemeKTheoryOperations S.5, which imports this node, and no node of this packet uses it.
-/
/-
structure RingProjectiveLineObject (R : Type u) [Ring R] where
  plus : ModuleCat (Polynomial R)ᵐᵒᵖ
  minus : ModuleCat (Polynomial R)ᵐᵒᵖ
  glue : LaurentExtend plus ≅ LaurentExtendMinus minus
def RingProjectiveLine.vectorBundles (R) : ObjectProperty (RingProjectiveLineObject R)
def RingProjectiveLine.O (n : ℤ) : vectorBundles R
-/

/- Planning API:
ProjectiveLine.Module (data): The abelian category mod-P¹_R of glued triples (M₊, M₋, α), with morphisms compatible with the gluing.
ProjectiveLine.VectorBundle (data): The full exact subcategory VB(P¹_R) of triples with finitely generated projective components.
ProjectiveLine.KSpace (data): K(P¹_R) := K(VB(P¹_R)), by K.1 on a small model.
ProjectiveLine.twist (data): The twist F(n) = (M₊, M₋, t⁻ⁿα), with the maps X₀ = (1, 1/t) and X₁ = (t, 1) : F(n−1) → F(n).
ProjectiveLine.u (constructor): The exact functor u_i : P(R) → VB(P¹_R), P ↦ (P[t], P[t⁻¹], tⁱ).
ProjectiveLine.u_twist (simp): u_i(P)(n) ≅ u_{i−n}(P), naturally in P.
ProjectiveLine.koszul (characterisation): The Koszul sequence 0 → F(−2) → F(−1)² → F → 0 is exact for every F.
ProjectiveLine.directImage (data): π_* and R¹π_* : mod-P¹_R → mod-R, the kernel and the cokernel of d(x, y) = α(x) − y.
ProjectiveLine.map (functoriality): Base change along a unital ring map R → R′, exact on VB and compatible with the twists, with the u_i, with identities and with composition.
-/

/- Unit-test obligations:
pi_u0: π_*(u_0(R)) ≅ R and R¹π_*(u_0(R)) = 0.
pi_u1: π_*(u_1(R)) = 0 and R¹π_*(u_1(R)) = 0, so, if R is nonzero, u_1(R) is not isomorphic to u_0(R) although both have components R[t] and R[t⁻¹]; a definition that forgot the gluing would identify them.
R1pi_u2: R¹π_*(u_2(R)) ≅ R and π_*(u_2(R)) = 0.
zero_ring: For R = 0 the category VB(P¹_0) is zero, so K(P¹_0) is contractible.
u_twist_shift: u_i(P)(n) ≅ u_{i−n}(P) for all integers i and n, naturally in P.
-/

/-!
GeneralAlgebraicKTheory:K.6/projective-line-splitting
For every unital associative ring R the exact functors u_0 and u_1 induce a homotopy equivalence (u_0, u_1) : K(R) × K(R) → K(P¹_R), so that K_n(P¹_R) ≅ K_n(R) ⊕ K_n(R) for every n ≥ 0, naturally in R; and (u_{i+1})_* + (u_{i+1})_* ≃ (u_i)_* + (u_{i+2})_* for every integer i. Equivalently (u_0, u_0 − u_1) is a homotopy equivalence, which is the form the proof of V.8.1 uses. No commutativity is assumed. For commutative R and the scheme P¹_R this is the case of a trivial bundle of rank two in the projective bundle theorem V.1.5, which SchemeKTheoryOperations S.5 owns and which imports this ring statement.
-/
/-
def projectiveLineKEquiv : KSpace (ProjectiveLine.exactStructure R) ≃ₕ* (KSpace.ofRing R × KSpace.ofRing R)
theorem projectiveLineKEquiv_inverse : projectiveLineKEquiv.symm = KMap O₀ × KMap O₋₁ := sorry
-/

/-!
GeneralAlgebraicKTheory:K.6/nil-category-and-nil-groups
For a unital ring R, Nil(R) is the category of pairs (P, ν) in which P is a finitely generated projective R-module and ν is a nilpotent endomorphism of P, with morphisms the module maps commuting with the endomorphisms; it is an exact category, an exact subcategory of the endomorphism category, whose conflations are the sequences of pairs that are exact on the underlying modules. The forgetful functor Nil(R) → P(R), (P, ν) ↦ P, is exact and is split by the exact functor P ↦ (P, 0). The Nil spectrum Nil(R) is the homotopy fibre of the forgetful map K(Nil(R)) → K(R), and Nil_n(R) := π_n Nil(R), the kernel of K_n Nil(R) → K_n(R); because of the splitting, K(Nil(R)) ≃ K(R) × Nil(R) and K_n Nil(R) ≅ K_n(R) ⊕ Nil_n(R) for n ≥ 0. Nil(R) is equivalent to the category H_{1,T}(R[t]) of t-torsion R[t]-modules with a resolution of length at most one by finitely generated projective R[t]-modules: (P, ν) goes to P_ν, the module P on which t acts by ν, resolved by the characteristic sequence 0 → P[t] → P[t] → P_ν → 0 whose first map is t − ν.
-/
/-- An object of `Nil(R)`: a finitely generated projective right `R`-module with a nilpotent
endomorphism. -/
structure NilCat (R : Type u) [Ring R] where
  P : ModuleCat.{u} Rᵐᵒᵖ
  [instFinite : Module.Finite Rᵐᵒᵖ P]
  [instProjective : Module.Projective Rᵐᵒᵖ P]
  ν : P ⟶ P
  nilpotent : IsNilpotent ν.hom

namespace NilCat

variable {R : Type u} [Ring R]

/-- Morphisms of `Nil(R)`: module maps commuting with the endomorphisms. -/
@[ext]
structure Hom (X Y : NilCat R) where
  f : X.P ⟶ Y.P
  comm : X.ν ≫ f = f ≫ Y.ν

instance : Category (NilCat R) where
  Hom := Hom
  id X := ⟨𝟙 X.P, by simp⟩
  comp a b := ⟨a.f ≫ b.f, by rw [← Category.assoc, a.comm, Category.assoc, b.comm,
    Category.assoc]⟩
  id_comp a := Hom.ext (Category.id_comp a.f)
  comp_id a := Hom.ext (Category.comp_id a.f)
  assoc a b c := Hom.ext (Category.assoc a.f b.f c.f)

/-- The forgetful functor `(P, ν) ↦ P`. -/
def forget : NilCat R ⥤ ModuleCat.{u} Rᵐᵒᵖ where
  obj X := X.P
  map a := a.f

/-- The zero section `P ↦ (P, 0)`. -/
def zero (P : ModuleCat.{u} Rᵐᵒᵖ) [Module.Finite Rᵐᵒᵖ P] [Module.Projective Rᵐᵒᵖ P] :
    NilCat R where
  P := P
  ν := 0
  nilpotent := by simp

/-- The zero section is a section of the forgetful functor on objects. -/
theorem forget_obj_zero (P : ModuleCat.{u} Rᵐᵒᵖ) [Module.Finite Rᵐᵒᵖ P]
    [Module.Projective Rᵐᵒᵖ P] : forget.obj (zero (R := R) P) = P := rfl

end NilCat

-- Test nilpotent_required (the endomorphism half): 2 is not nilpotent on ℤ.
example : ¬ IsNilpotent (2 : Module.End ℤ ℤ) := by
  sorry

/- Not stated here: the exact structure of `NilCat`, `nilGroup`, `KGroup.nilCat_decomposition`,
`NilCat.equivTorsion`, `nilGroup_map` and tests `nil0_field`, `nil0_dual_numbers`,
`K0_nil_split` need the exact-category K-theory of K.1–K.2 and the torsion category
`H_{1,T}(R[t])`; their forms are
`def nilGroup (R) (n : ℕ) := PiGroup n (HomotopyFibre (KMap (NilCat.forgetToProjectives R)))
-- NilCat.forget lands in P(Rᵐᵒᵖ); compare with K(R) using the early opposite-ring equivalence.`
and the decomposition `KGroup (NilCat.exactStructure R) n ≃+ KGroup.ofRing Rᵐᵒᵖ n × nilGroup R n`. -/

/- Planning API:
NilCat (data): Nil(R), with its exact structure.
NilCat.forget (projection): The exact forgetful functor (P, ν) ↦ P.
NilCat.zero (constructor): The exact zero section P ↦ (P, 0), a section of the forgetful functor.
nilGroup (data): Nil_n(R) := π_n of the homotopy fibre of K(Nil(R)) → K(R), for n ≥ 0.
KGroup.nilCat_decomposition (characterisation): K_n Nil(R) ≅ K_n(R) ⊕ Nil_n(R), naturally in R.
NilCat.equivTorsion (equivalence): Nil(R) ≃ H_{1,T}(R[t]), (P, ν) ↦ P_ν.
nilGroup_map (functoriality): Base change along unital ring maps.
-/

/- Unit-test obligations:
nil0_field: For a field F, Nil_0(F) = 0.
nil0_dual_numbers: For A = k[ε]/(ε²) over a field k, Nil_0(A) ≅ (1 + εt·k[t])^× ≠ 0.
K0_nil_split: K_0 Nil(R) ≅ K_0(R) ⊕ Nil_0(R) through the zero section and the forgetful functor.
nilpotent_required: Dropping nilpotence changes the object: (ℤ, 2) is an endomorphism of ℤ that is not nilpotent, and its class 1 − 2t in the endomorphism group of ℤ (Almkvist) is non-zero, while Nil_0(ℤ) = 0.
-/

/-!
GeneralAlgebraicKTheory:K.6/t-torsion-localisation-sequences
Let R be a unital ring and T = {tⁿ} ⊂ R[t], a set of central nonzerodivisors. (a) The inclusion of H_{1,T}(R[t]) and the localisation R[t] → R[t,t⁻¹] give a homotopy fibration K(H_{1,T}(R[t])) → K(R[t]) → K(R[t,t⁻¹]) of connective K-theory spaces, whose long exact sequence ends with K_0(H_{1,T}(R[t])) → K_0(R[t]) → K_0(R[t,t⁻¹]), a map that need not be onto (Caveat V.7.1.1). (b) Write H_1 for the objects of mod-P¹_R with a length-one resolution by objects of VB(P¹_R) and H_{1,t} ⊂ H_1 for those of the form (M, 0, 0). Then M ↦ (M, 0, 0) is an equivalence H_{1,T}(R[t]) ≃ H_{1,t}, the restriction j^* : VB(P¹_R) → P(R[t⁻¹]), j^*F = M₋, is exact, and K(H_{1,T}(R[t])) → K(P¹_R) → K(R[t⁻¹]) is a homotopy fibration. (c) Restriction to the chart R[t], F ↦ M₊, maps the sequence of (b) to that of (a), identically on the fibre. Through Nil(R) ≃ H_{1,T}(R[t]) the fibre of both is K(Nil(R)) ≃ K(R) × Nil(R).
-/
/-
def nilPolynomialFibre : KSpace (NilCat.exactStructure R) ≃ₕ* homotopyFiber (KMap (invertCentralVariable R))
def polynomialLaurentKSequence : KLocalizationSequence (NilCat R) (Polynomial R) (LaurentPolynomial R)
-/

/-!
GeneralAlgebraicKTheory:K.6/nil-inclusion-is-forgetful
Let R be a unital associative ring and I : Nil(R) → H_1(P¹_R) send (P, ν) to (P_ν, 0, 0). Under the resolution equivalence K(H_1(P¹_R)) ≃ K(P¹_R), the induced map is homotopic to ((u_0)_* − (u_1)_*) ∘ forget_*. In particular it vanishes on the reduced Nil homotopy fibre in every nonnegative degree.
-/
/-
def nilInclusion_eq_forgetful : BasedHomotopy
  (projectiveLineResolutionKEquiv ∘ KMap nilProjectiveLineInclusion)
  ((KMap (ProjectiveLine.u R 0) - KMap (ProjectiveLine.u R 1)) ∘ KMap (NilCat.forgetToProjectives R))
-- Both maps have source K(Nil(R)) and target K(VB(P¹_R)); the reduced Nil fibre maps to zero.
-/

/-!
GeneralAlgebraicKTheory:K.6/nil-groups-are-NK
For every unital ring R and every n ≥ 0 there is a natural isomorphism NK_{n+1}(R) ≅ Nil_n(R), where NK_{n+1}(R) is the cokernel of the split injection K_{n+1}(R) → K_{n+1}(R[t]) (equivalently of K_{n+1}(R) → K_{n+1}(R[t⁻¹])). It comes from the localisation sequence (b) of K.6/t-torsion-localisation-sequences, K_{n+1}(R[t⁻¹]) → K_n(R) ⊕ Nil_n(R) → K_n(P¹_R) → K_n(R[t⁻¹]) (the source's (8.1.1)), in which the summand K_n(R) maps to K_n(P¹_R) by u_0 − u_1 and Nil_n(R) maps to zero; the sequence therefore splits into 0 → K_n(R) → K_n(P¹_R) → K_n(R) → 0 and the isomorphism K_{n+1}(R[t⁻¹])/K_{n+1}(R) ≅ Nil_n(R).
-/
/-
def nilNKEquiv (n : ℕ) : nilGroup R n ≃+ NK (n+1) R
-/

/-!
GeneralAlgebraicKTheory:K.6/fundamental-theorem-positive-degrees
For every unital ring R and every n ≥ 1 the sequence 0 → K_n(R) → K_n(R[t]) ⊕ K_n(R[t⁻¹]) → K_n(R[t,t⁻¹]) → K_{n−1}(R) → 0 is exact. The first map is the pair of base changes, the second their difference, and the last, ∂, is the boundary of the t-localisation sequence (a) of K.6/t-torsion-localisation-sequences followed by the forgetful retraction K_{n−1} Nil(R) = K_{n−1}(R) ⊕ Nil_{n−1}(R) → K_{n−1}(R). The splitting of ∂ is K.6/multiplication-by-t-splits-the-boundary; with the maps t ↦ 1 it makes the sequence naturally split.
-/
/-
def bassPositiveEquiv (n : ℕ) (hn : 1 ≤ n) :
  KGroup.ofRing (LaurentPolynomial R) n ≃+ (KGroup.ofRing R n × KGroup.ofRing R (n-1) × NK n R × NK n R)
-/

/-!
GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary
Let [t] ∈ K_1(ℤ[t,t⁻¹]) be the class of the unit t, and for a unital ring R and x ∈ K_n(R), n ≥ 0, let {t, x} ∈ K_{n+1}(R[t,t⁻¹]) be the external product of [t] with x for the pairing induced by the biexact functor ⊗_ℤ : P(ℤ[t,t⁻¹]) × P(R) → P(R[t,t⁻¹]) (K.7/products-from-biexact-functors). Then the boundary ∂ of the t-localisation sequence satisfies ∂({t, x}) = x̄, where x̄ is the image of x under K_n(R) → K_n(R[t]/tR[t]) = K_n(R) → K_n(H_{1,T}(R[t])), that is the class (x, 0) in K_n(R) ⊕ Nil_n(R). Consequently x ↦ {t, x} is a right inverse of the boundary of the Fundamental Theorem, natural in R, and with the maps t ↦ 1 it splits the sequence of K.6/fundamental-theorem-positive-degrees. The sign is the one the source's conventions give, ∂[t] = [ℤ[t]/tℤ[t]]; with another sign convention for ∂ a universal sign ±1 appears and must be carried.
-/
/-
def laurentBoundarySection (n : ℕ) (hn : 1 ≤ n) : KGroup.ofRing R (n-1) →+ KGroup.ofRing (LaurentPolynomial R) n
theorem laurentBoundarySection_rightInverse : LaurentBoundary n R ∘ laurentBoundarySection n hn = id := sorry
-/

/-!
GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted
The functors K_1 and K_0 on unital rings are contracted in the sense of Definition III.4.1.1, with LK_1 = K_0 and LK_0 = K_{−1}: for every R the sequences 0 → K_i(R) → K_i(R[t]) ⊕ K_i(R[t⁻¹]) → K_i(R[t,t⁻¹]) → K_{i−1}(R) → 0, for i = 1 and i = 0, are exact with splittings natural in R and in t, and K_0(R[t,t⁻¹]) ≅ K_0(R) ⊕ K_{−1}(R) ⊕ NK_0(R) ⊕ NK_0(R). Consequently every K_{−n}, n ≥ 0, is a contracted functor with L K_{−n} = K_{−n−1}, that is K_{−n} = Lⁿ K_0, with naturally split exact sequences 0 → K_{−n}(R) → K_{−n}(R[t]) ⊕ K_{−n}(R[t⁻¹]) → K_{−n}(R[t,t⁻¹]) → K_{−n−1}(R) → 0, and NL K_{−n} ≅ LN K_{−n}.
-/
/-
def negativeKContracted (n : ℕ) : ContractedRingFunctor (negativeK n)
def negativeLaurentEquiv (n : ℕ) : negativeK n (LaurentPolynomial R) ≃+
  (negativeK n R × negativeK (n+1) R × BassNK (-(n : ℤ)) R × BassNK (-(n : ℤ)) R)
-/

/-!
GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms
For every unital ring R and every integer n there is a canonically split exact sequence 0 → K_n(R) → K_n(R[t]) ⊕ K_n(R[t⁻¹]) → K_n(R[t,t⁻¹]) → K_{n−1}(R) → 0, natural in R, in which the splitting of the boundary is multiplication by the class of the variable t in K_1(ℤ[t,t⁻¹]) and the maps t ↦ 1 give the rest of the splitting; for n ≤ 0 the groups are Bass's and the sequence is the one that makes K_n a contracted functor. Writing NK_n(R) for the cokernel of K_n(R) → K_n(R[t]), this gives K_n(R[t,t⁻¹]) ≅ K_n(R) ⊕ K_{n−1}(R) ⊕ NK_n(R) ⊕ NK_n(R), and for n ≥ 0 the N-terms are Nil groups: NK_{n+1}(R) ≅ Nil_n(R). When the N-terms vanish the decomposition has the two terms K_n(R) ⊕ K_{n−1}(R). The scheme form (V.8.3) is not part of this node: SchemeKTheoryOperations S.5 owns it and imports this ring theorem, and no prerequisite of this node lies in that roadmap.
-/
/-
def bassFundamentalEquiv (n : ℤ) : BassKGroup.ofRing (LaurentPolynomial R) n ≃+
  (BassKGroup.ofRing R n × BassKGroup.ofRing R (n-1) × BassNK n R × BassNK n R)
-/

/-!
GeneralAlgebraicKTheory:K.6/axioms-for-negative-k-theory
A theory of negative K-theory for possibly non-unital rings is a sequence of functors in degrees at most zero together with natural boundary maps from the K-group of a quotient to the next group down of the ideal, satisfying four axioms: in degree zero the functor is the Grothendieck group; for every two-sided ideal the five-term sequence through the ideal, the ring and the quotient is exact; every flasque ring has vanishing groups in all degrees at most zero; and the inclusion of a ring in its infinite matrix ring induces isomorphisms in all those degrees. Bass's groups form such a theory. The axioms are what a second construction must be checked against, and they are the interface through which this layer's nonconnective spectrum is compared with the Bass groups.
-/
/-
structure NegativeRingTheory where
  group : ℕ → NonunitalRingCat ⥤ AddCommGrp
  zeroEquiv : group 0 ≅ nonunitalK0Functor
  boundary : NegativeIdealBoundary group
  fiveTermExact : NegativeIdealFiveTermExact group boundary
  flasqueVanishing : ∀ n R, IsFlasqueRing R → Subsingleton (group n R)
  matrixInvariant : ∀ n R, IsIso ((group n).map (matrixCorner R))
-/

/- Planning API:
NegativeKTheory (structure): The functors in degrees at most zero together with the boundary maps.
NegativeKTheory.k0 (characterisation): Axiom one: in degree zero the functor is the Grothendieck group.
NegativeKTheory.exact_ideal (characterisation): Axiom two: the five-term sequence of an ideal is exact.
NegativeKTheory.flasque (characterisation): Axiom three: a flasque ring has vanishing groups.
NegativeKTheory.matrix (characterisation): Axiom four: the inclusion in the infinite matrix ring is an isomorphism.
bassTheory (example): Bass’s negative groups form such a theory.
-/

/- Unit-test obligations:
bass_satisfies: Bass’s groups satisfy all four axioms.
nonunital: The second axiom is stated for non-unital rings; restricting to unital rings weakens it.
infinite_matrices: The fourth axiom is about the infinite matrix ring, not the finite ones.
degree_zero: In degree zero the theory is the Grothendieck group, so the axioms extend the existing definition rather than replacing it.
-/

/-!
GeneralAlgebraicKTheory:K.6/mayer-vietoris-for-negative-k
Let f : R → S be a homomorphism of unital rings and I ⊂ R an ideal that f maps isomorphically onto an ideal J of S, so that R → S, R/I → S/J is a Milnor square. The Mayer–Vietoris sequence of Theorem III.2.6, K_1(R) → K_1(S) ⊕ K_1(R/I) → K_1(S/J) → K_0(R) → K_0(S) ⊕ K_0(R/I) → K_0(S/J), continues as a long exact sequence of Bass's negative K-groups: … → K_{1−n}(S/J) → K_{−n}(R) → K_{−n}(S) ⊕ K_{−n}(R/I) → K_{−n}(S/J) → K_{−n−1}(R) → … for every n ≥ 0, each negative boundary being the contraction of the one above it. The sequence starts at K_1(R): no exactness is asserted at K_n for n ≥ 2, where excision fails in general. The K_1–K_0 part is imported from K.5 (K.5/milnor-square-mayer-vietoris); the spectrum form in degrees ≤ 0 is K.6/milnor-square-excision-in-nonpositive-degrees. This is the form of excision available in negative degrees, and one of the two reasons the negative groups are useful.
-/
/-
def bassMilnorSquareSequence (sq : SurjectiveMilnorSquare) : NonpositiveExactKSequence sq
-/

/-!
GeneralAlgebraicKTheory:K.6/nonconnective-spectrum
For a functor E from rings to spectra, let LE be the homotopy cofiber of the map from the homotopy pushout of the two polynomial spectra over the spectrum of the ring into the spectrum of the Laurent ring, and let the desuspended functor be its loop space; there is a cofibration sequence natural in both arguments. Multiplication by the class of the variable, the external product with [x] ∈ K_1(ℤ[x,x⁻¹]) (K.7/products-from-biexact-functors), gives a natural map from the K-theory spectrum to its desuspension, which the Fundamental Theorem shows is the inclusion of the minus-one-connective cover; iterating gives maps of the k-fold desuspensions, each the inclusion of a deeper connective cover, and the nonconnective Bass spectrum is the homotopy colimit of that diagram. Its homotopy groups, the K-groups in non-negative degrees and Bass's negative groups below, are computed in K.6/bass-spectrum-homotopy-groups.
-/
/-
def bassSpectrum (R : RingCat) : Spectrum := telescope (bassDeloopingSystem R)
-/

/- Planning API:
deloop (data): The functor LE and its desuspension.
deloop_cofibration (characterisation): The natural cofibration sequence.
bassSpectrum (data): The nonconnective Bass K-theory spectrum.
bassSpectrum_natural (functoriality): Naturality in the ring and in the model of connective K-theory.
bassSpectrum_independent (compatibility): Two naturally equivalent models of connective K-theory give equivalent nonconnective spectra.
-/

/- Unit-test obligations:
agrees_above_zero: In non-negative degrees the homotopy groups are the K-groups of the connective spectrum.
degree_minus_one: In degree minus one the homotopy group is the first negative K-group.
regular_case: For a regular noetherian ring the negative homotopy vanishes.
model_independence: Two models of connective K-theory related by a natural equivalence give equivalent nonconnective spectra.
-/

/-!
GeneralAlgebraicKTheory:K.6/bass-spectrum-homotopy-groups
For every unital ring R the canonical map K(R) → K^B(R) induces isomorphisms K_n(R) ≅ π_n K^B(R) for all n ≥ 0, and for every n ≥ 1 there is an isomorphism π_{−n} K^B(R) ≅ K_{−n}(R) = Lⁿ K_0(R) with Bass's negative group; both are natural in unital ring maps. The isomorphism in degree −k is the one Corollary IV.10.3 constructs: the composite of multiplication by x, K_{−k}(R) → K_{1−k}(R[x,x⁻¹]), with K_{1−k}(R[x,x⁻¹]) ≅ π_{1−k}Λ^{k−1}K(R[x,x⁻¹]) → π_{−k}Λ^kK(R), so the contraction splittings of Bass's groups are realised by multiplication by x on spectra. This is the identification of the negative groups of rings with Bass's construction that the stage text asks for; for Schlichting's IK(R) the same groups are obtained by the ring clause of K.6/agreement-and-vanishing-of-negative-K, which proves that comparison.
-/
/-
def bassSpectrum_pi_nonnegative (n : ℕ) : π n (bassSpectrum R) ≃+ KGroup.ofRing R n
def bassSpectrum_pi_negative (n : ℕ) : π (-(n+1 : ℤ)) (bassSpectrum R) ≃+ negativeK (n+1) R
-/

/-!
GeneralAlgebraicKTheory:K.6/milnor-square-excision-in-nonpositive-degrees
Let f : R → S be a homomorphism of unital associative rings and I ⊂ R a two-sided ideal that f maps bijectively onto a two-sided ideal J = f(I) of S, so that R → S, R/I → S/J is a Milnor square: R is the pullback of S and R/I over S/J, and S → S/J is onto. Write 𝕂 = K^B for the Bass spectrum and 𝕂(R, I) for the homotopy fibre of 𝕂(R) → 𝕂(R/I), and similarly 𝕂(S, J). Then the induced map 𝕂(R, I) → 𝕂(S, J) is an isomorphism on π_n for every n ≤ 0. In particular its homotopy fibre, the birelative term, is concentrated in degrees ≥ 0 (its π_n vanishes for n ≤ −1, and its π_0 is the cokernel of the map on π_1), and, applied to ℤ ⋉ I → R, π_n 𝕂(R, I) depends only on the nonunital ring I for n ≤ 0. In degree one this node records only the classical statement: the classical relative groups K_1(R, I) = GL(I)/E(R, I) → K_1(S, J) form a surjection, because both are quotients of GL(I) = GL(J) (Remark III.2.2.1, the exactness at K_1(S) ⊕ K_1(R/I) of K.5/milnor-square-mayer-vietoris). The spectrum form of that surjection — π_1 𝕂(R, I) → π_1 𝕂(S, J) onto, equivalently the birelative term concentrated in degrees ≥ 1 — needs the identification of π_1 of K.5's relative fibre with GL(I)/E(R, I), which is KTheoryLowDegrees U.6's and lies downstream of K.6; it is handed to U.6 by request and is not asserted here. Nothing is claimed in degrees ≥ 2, and the degree-one map is not claimed injective: excision for K_1 already fails (Swan's example, Ex. III.2.3), and the general criteria are K.5/excision-and-its-failure's. This is the non-positive part of Bass's excision theorem (Bass, Algebraic K-theory, Theorem XII.8.3, as Clausen–Mathew–Morrow cite it). The proof of Clausen–Mathew–Morrow's Proposition 4.34 uses only that the birelative term is concentrated in degrees ≥ 0, which this node proves; their parenthesis 'even ≥ 1' is U.6's.
-/
/-
def relativeBassExcision (f : IdealIsomorphism R I S J) (n : ℤ) (hn : n ≤ 0) :
  π n (homotopyFiber (bassSpectrumMap (quotientMap I))) ≃+
  π n (homotopyFiber (bassSpectrumMap (quotientMap J)))
-/

/-!
GeneralAlgebraicKTheory:K.6/vanishing-for-regular-noetherian-rings
For a regular noetherian ring the N-groups vanish in every degree, so the Fundamental Theorem degenerates and every negative K-group vanishes. In the intended finite-dimensional applications this is what makes the nonconnective and the connective theories agree. The converse is emphatically not available: the connective model has no homotopy in negative degrees for any ring whatever, and inferring from that absence that a singular ring has vanishing negative K-groups is a mistake the stage text names and this node records as a non-example.
-/
/-
theorem regularNegativeK_trivial (R) [Ring R] [IsNoetherianRing R]
    (hreg : FiniteProjectiveResolutionProperty R) (n : ℕ) :
    Subsingleton (negativeK (n+1) R) := sorry
-/

/-!
GeneralAlgebraicKTheory:K.7/morita-invariance
Two rings are Morita equivalent when their module categories are equivalent; the structure theorem says that this happens exactly when there is a finitely generated projective generator of one whose endomorphism ring is the other, and that the equivalence is then given by tensoring against a bimodule. Since K-theory is defined from the category of finitely generated projective modules, and an equivalence of module categories restricts to an equivalence of those subcategories, Morita equivalent rings have isomorphic K-groups in every degree, connective and negative alike. The standard instance is the matrix ring: the ring and its ring of n by n matrices for n ≥ 1 are Morita equivalent, so their K-theories agree. The comparison is additive and natural for the chosen equivalence. Compatibility with an external product requires a commuting diagram of the relevant biexact functors. An internal unital ring comparison additionally requires compatible unit-preserving monoidal data; an arbitrary Morita equivalence does not supply those data.
-/
/-
def matrixKEquiv (n : ℕ) (hn : 0 < n) : bassSpectrum (Matrix (Fin n) (Fin n) R) ≃ₛ bassSpectrum R
-/

/- Planning API:
KTheory.moritaEquiv (data): The induced isomorphism of K-groups from a Morita equivalence.
KTheory.moritaEquiv_matrix (example): The instance for the matrix ring.
KTheory.moritaEquiv_mul (compatibility): Given Morita equivalences of both input categories and the target, and a compatible natural isomorphism of their external-product biexact functors, the induced K-group isomorphisms commute with that external product.
moritaStructure (characterisation): The structure theorem: the equivalence is tensoring against a projective generator.
KTheory.moritaEquiv_negative (compatibility): The isomorphism holds in negative degrees as well.
-/

/- Unit-test obligations:
matrix_invariance: For n ≥ 1, K_*(M_n(R)) ≅ K_*(R); the n = 0 case over a field fails.
not_isomorphism: Morita equivalent rings need not be isomorphic, so the statement is not vacuous.
respects_product: For a commutative ring with an invertible module L whose class differs from [R] in K₀, the Morita autoequivalence L ⊗_R − sends [R] to [L]. Thus it is not a unital K₀-ring automorphism. A product comparison must carry additional monoidal/biexact compatibility data.
negative_degrees: The isomorphism holds in negative degrees.
-/

/-!
GeneralAlgebraicKTheory:K.7/derived-morita-and-enhancements
At the derived level the invariance statement is about enhanced categories: K-theory is invariant under an equivalence of the underlying differential graded or stable categories of perfect complexes, and the enhancement is part of the hypothesis. A bare equivalence of triangulated categories is not enough, because the K-theory of a Waldhausen category is built from the category with its cofibrations and weak equivalences, not from the homotopy category alone, and mapping cones in a triangulated category are not functorial. This node states what the correct hypothesis is, records the failure of the naked form as a non-example, and says exactly which data a formalisation must carry. The stage text names this as the trap of the layer.
-/
/-
def enhancedMoritaKEquiv (F : ExactFunctor C D) (hF : DerivedMoritaEquivalence F) :
  IK C ≃ₛ IK D
-/

/-!
GeneralAlgebraicKTheory:K.7/invariance-under-filtered-colimits-and-products
The connective statements — K_n(R × R′) ≅ K_n(R) × K_n(R′) for a finite product of unital rings and colim_i K_n(R_i) ≅ K_n(colim_i R_i) for a filtered colimit, n ≥ 0 — belong to the early ring node (K.2/functorial-K-theory-of-a-ring, from K.1/elementary-properties-of-K-groups) and are imported, not re-proved here. This node adds their nonconnective refinements. (a) For every n ≥ 1, Bass's K_{−n} takes finite products of rings to products (K.6/negative-k-groups) and commutes with filtered colimits of rings, because R ↦ R[t], R[t⁻¹], R[t,t⁻¹] commute with filtered colimits and so do cokernels. (b) Hence the Bass spectrum satisfies K^B(R × R′) ≃ K^B(R) × K^B(R′) and hocolim_i K^B(R_i) ≃ K^B(colim_i R_i), the maps being isomorphisms on π_n for every integer n by (a), the connective statements and K.6/bass-spectrum-homotopy-groups. (c) For Frobenius pairs and exact categories the non-positive filtered-colimit statement is K.6/additivity-and-colimits-for-negative-K's (Schlichting's Lemma 6.3 and Corollary 6.4), cited here, not restated. (d) The infinite matrix ring M(R) = colim_n M_n(R) uses corner embeddings, which are nonunital. Its continuity statement is supplied by nonunital-filtered-continuity, using unitization fibres and matrix-corner-morita-naturality. The target is the nonunital spectrum K^B_nu(M(R)); the actual corner inclusion induces the comparison. Infinite products are not claimed.
-/
/-
def bassFilteredEquiv (D : J ⥤ RingCat) [IsFiltered J] :
  homotopyColimit (D ⋙ bassSpectrumFunctor) ≃ₛ bassSpectrum (colimit D)
def bassFiniteProductEquiv (R S) : bassSpectrum (R × S) ≃ₛ (bassSpectrum R × bassSpectrum S)
-/

/-!
GeneralAlgebraicKTheory:K.7/products-from-biexact-functors
A biexact functor induces a pairing of K-theory. For exact categories A, B, C and a functor F : A × B → C exact in each variable with F(A, 0) = F(0, B) = 0, the induced map on Q-constructions gives a pairing K(A) ∧ K(B) → K(C) and bilinear products K_i(A) ⊗ K_j(B) → K_{i+j}(C), which in degree zero send [A] ⊗ [B] to [F(A, B)]. For Waldhausen categories the same holds for a biexact functor satisfying Waldhausen's condition that F(A′, B) ∪_{F(A,B)} F(A, B′) → F(A′, B′) is a cofibration for all cofibrations A ↣ A′ and B ↣ B′: the induced map wS.A × wS.B → wwS.S.C gives a pairing K(A) ∧ K(B) → K(C) of spectra, natural in exact functors and natural transformations of each variable. If F is associative, unital or symmetric up to coherent natural isomorphism, the pairing is associative, unital or symmetric up to homotopies transported from those isomorphisms; the homotopies are data. For algebras A and B over a commutative ring k, ⊗_k : P(A) × P(B) → P(A ⊗_k B) gives the external product K(A) ∧ K(B) → K(A ⊗_k B), and for a commutative ring R the internal product that makes K(R) a commutative ring spectrum and K_*(R) a graded ring with unit [R]. This node is the only owner of the K-theoretic pairing K(A) ∧ K(B) → K(C) and its coherence: the smash product of spectra, its own coherence and the sign of the twist on spheres are imported from StableHomotopyKTheory H.5:spectra, the connective K-theory spectrum from K.4:construction and H.5:S-delooping, and the assembly of that spectrum requires no product.
-/
/-
def KTheory.biexactPairing (F : BiexactFunctor A B C) :
  connectiveK A ∧ connectiveK B ⟶ connectiveK C
-/

/- Planning API:
KTheory.biexactPairing (data): The pairing induced by a biexact functor.
KTheory.biexactPairing_natural (functoriality): The pairing is natural in exact functors and natural transformations of each variable, and so maps fibration sequences in one variable to fibration sequences.
KTheory.biexactPairing_K0 (characterisation): In degree zero the pairing sends [A] ⊗ [B] to [F(A, B)].
KTheory.externalProduct (data): The external product of the K-groups of two algebras.
KTheory.mul (data): The internal product for a commutative ring.
KTheory.mul_assoc (compatibility): The associativity homotopy.
KTheory.mul_one (compatibility): The unit homotopy, with unit the class of the ring.
KTheory.mul_comm_graded (compatibility): The symmetry homotopy, giving graded commutativity.
-/

/- Unit-test obligations:
K0_is_a_ring: The zeroth K-group of a commutative ring is a commutative ring.
unit_is_the_class_of_R: The unit of the product is the class of the ring as a module over itself.
tensor_of_classes: The product of the classes of two modules is the class of their tensor product; this is the pinned Tau Ceti statement.
homotopies_are_data: The associativity and symmetry are given by transported coherence isomorphisms, not asserted.
-/

/-!
GeneralAlgebraicKTheory:K.7/graded-commutativity
For a commutative ring the internal product makes the direct sum of the K-groups a graded ring, and the symmetry homotopy makes it graded commutative: the product of a class in degree p and one in degree q equals minus one to the power p times q times the product in the other order. In degree one the statement specialises to the anticommutativity of the symbol of two units, and the product of a class in degree zero with one in degree one is given by the action of the zeroth K-group. The sign is a consequence of the symmetry of the tensor product together with the sign rule of the smash product of spheres, and it is not a convention that can be chosen.
-/
/-
theorem kProduct_flip (x : KGroup.ofRing R i) (y : KGroup.ofRing R j) [CommRing R] :
  kProduct x y = (-1 : ℤ)^(i*j) • kProduct y x := sorry
-/

/-!
GeneralAlgebraicKTheory:K.7/compatibility-with-relative-groups-and-transfers
The external product is compatible with the other structure of the theory. It descends to relative groups, so that the product of an absolute class and a relative class is relative; it commutes with the boundary maps of the localisation sequences up to the expected sign, that is, the boundary is K_*(R)-linear up to sign (a module map, not a derivation of a ring); and it satisfies the projection formula for a transfer, namely that the transfer of a product of a class pulled back along the map with a class upstairs equals the product of the first with the transfer of the second. Each is a separate assertion with its own proof and none follows from the construction of the product alone.
-/
/-
def relativeKPairing (I : TwoSidedIdeal R) : relativeK.ofPair I ∧ connectiveK.ofRing R ⟶ relativeK.ofPair I
theorem transfer_projectionFormula (E F) (x : KGroup.ofRing F i) (y : KGroup.ofRing E j) :
  transfer (kProduct (restrict x) y) = kProduct x (transfer y) := sorry
-/

/-!
GeneralAlgebraicKTheory:K.7/unit-multiplication-and-K0-tensor-comparison
Two concrete consequences of the product structure serve as the unit tests of the layer. First, the comparison in degree zero: the product of the classes of two finitely generated projective modules is the class of their tensor product, so that the map from the tensor square of the zeroth K-group to itself is determined on classes; Tau Ceti has exactly this statement for the split model and it is cited as baseline. Second, multiplication in degree one: the product of the class of a unit in the first K-group with a class in the zeroth K-group is computed by the action, and multiplication by the class [u] of a unit in the first K-group raises degree by one; since [u⁻¹] = −[u] in the first K-group, multiplication by [u⁻¹] is the negative of multiplication by [u] (it is not an inverse, and neither map is an automorphism of a K-group). The second cannot be stated against the pinned libraries, which have no first K-group.
-/
/-
theorem k0Product_eq_tensor (P Q : FiniteProjectiveModule R) [CommRing R] :
  kProduct (classOf P) (classOf Q) = classOf (tensor P Q) := sorry
-/

/-!
GeneralAlgebraicKTheory:K.6/frobenius-pairs
A Frobenius category is an exact category with enough projective and enough injective objects in which the projectives and the injectives coincide; its stable category, obtained by killing the maps that factor through a projective-injective, is triangulated. A FROBENIUS PAIR is a fully faithful inclusion of one small Frobenius category in another carrying projective-injectives into projective-injectives, and its DERIVED CATEGORY is the Verdier quotient of the two stable categories. This is the category of models on which the whole nonconnective construction of this layer runs: the bounded complexes over an exact category, with degreewise split conflations and the homotopy-acyclic complexes as the subcategory, form a Frobenius pair whose derived category is the bounded derived category, and that is how an exact category enters the machine.
-/
/-
structure FrobeniusPair where
  ambient : SmallFrobeniusCategory
  null : SmallFrobeniusCategory
  inclusion : null ⥤ ambient
  fullyFaithful : inclusion.FullyFaithful
  preservesProjectiveInjective : PreservesProjectiveInjective inclusion
def FrobeniusPair.derived (A : FrobeniusPair) : SmallTriangulatedCategory :=
  VerdierQuotient A.ambient.stable A.null.stable
-/

/- Planning API:
FrobeniusCategory (structure): Enough projectives and injectives, which coincide; Tau Ceti’s pinned IsFrobenius is the coincidence, and this adds the enough-objects data.
FrobeniusCategory.stable (data): The stable category, with its triangulated structure.
FrobeniusPair (structure): A fully faithful inclusion of small Frobenius categories preserving projective-injectives.
FrobeniusPair.derived (data): The derived category, the Verdier quotient of the stable categories.
FrobeniusPair.map (functoriality): A map of pairs induces a triangle functor of derived categories.
FrobeniusPair.ofExact (example): The bounded complexes over an exact category, with the homotopy-acyclic ones.
-/

/- Unit-test obligations:
split_is_frobenius: The split exact structure is Frobenius; this is Tau Ceti’s pinned instance and the definition here must agree with it.
complexes_are_a_pair: The bounded complexes over an exact category form a Frobenius pair.
derived_is_bounded_derived: Its derived category is the bounded derived category of the exact category.
projinj_coincide: Dropping the coincidence of projectives and injectives breaks the triangulation; an exact category with enough projectives only is not a Frobenius category.
-/

/-!
GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension
The COUNTABLE ENVELOPE of a small exact category has as objects the sequences of inflations, with morphism groups the limit over the source index of the colimit over the target index; it is exact, has exact countable coproducts, and is FLASQUE: the functor sending a sequence to the countable sum of its shifts satisfies the direct sum of the identity with it being naturally isomorphic to it, which is the Eilenberg swindle in functorial form. Applied to a Frobenius pair this gives an endofunctor F of Frobenius pairs whose derived category has countable coproducts and is c-compactly generated by the original, so that the idempotent completion of the original derived category is the c-compact part of the enlarged one. The SUSPENSION S of a pair is the enlarged Frobenius category together with the objects that vanish in the quotient of the enlarged derived category by the original, so that the derived category of the suspension is exactly that quotient. The natural transformations from the identity through F to S then satisfy the axioms of the model set-up, and this is the flasque enlargement and suspension the stage text asks for.
-/
/-
def frobeniusEnvelope (A : FrobeniusPair) : FrobeniusPair
def frobeniusSuspension (A : FrobeniusPair) : FrobeniusPair
def frobeniusEnvelopeSwindle : identityExactFunctor (frobeniusEnvelope A) ⊕ shiftSum A ≅ shiftSum A
-/

/- Planning API:
countableEnvelope (data): The countable envelope of a small exact category.
countableEnvelope_isFlasque (characterisation): The envelope is flasque, with the shift functor as witness.
FrobeniusPair.enlarge (data): The endofunctor F of Frobenius pairs.
FrobeniusPair.enlarge_generates (characterisation): The enlarged derived category is c-compactly generated by the original.
FrobeniusPair.suspension (data): The suspension endofunctor S.
FrobeniusPair.setup (compatibility): The identity, F and S satisfy the three conditions of the model set-up.
-/

/- Unit-test obligations:
envelope_flasque: The countable envelope is flasque.
IK0_of_enlargement_vanishes: The zeroth group of an enlarged pair is zero.
suspension_derived: The derived category of the suspension is the quotient of the enlarged derived category by the original.
not_sheaf_flasque: Flasque here is the swindle condition on a functor, not the sheaf-theoretic predicate of the pinned libraries.
-/

/-!
GeneralAlgebraicKTheory:K.6/schlichting-set-up
For a small triangulated category the zeroth invariant is the zeroth K-group of its idempotent completion. A SET-UP consists of a category of models with a functor to small triangulated categories, together with endofunctors F and S and natural transformations from the identity through F to S, such that both preserve exact sequences, the zeroth invariant of an enlargement vanishes, and the sequence from a model through its enlargement to its suspension is exact; a sequence of small triangulated categories is EXACT when the composite is zero, the first functor is fully faithful and the induced functor from the Verdier quotient to the third is cofinal. The negative groups of a model are then the zeroth invariant of its iterated suspension. Taking the models to be Frobenius pairs and the functors of the previous node gives the negative K-groups of an exact category, of a ring, of a scheme and of a differential graded algebra.
-/
/-
structure SchlichtingSetup (Models : Category u) where
  derived : Models ⥤ SmallTriangulatedCat
  envelope : Models ⥤ Models
  suspension : Models ⥤ Models
  inclusion : 𝟭 Models ⟶ envelope
  projection : envelope ⟶ suspension
  exact : ∀ A, ExactTriangulatedSequence (derived.map (inclusion.app A)) (derived.map (projection.app A))
  envelopeK0 : ∀ A, Subsingleton (TriangulatedK0 (idempotentCompletion (derived.obj (envelope.obj A))))
-/

/- Planning API:
IsExactSequence (structure): An exact sequence of small triangulated categories, with the cofinality condition.
IK0 (data): The zeroth invariant, the K-group of the idempotent completion.
NegativeKSetup (structure): A category of models with F, S and the three conditions.
negativeIK (data): The negative groups of a model.
negativeIK_frobenius (example): The instance at Frobenius pairs.
IK0_eq_K0_of_idempotentComplete (compatibility): For an idempotent complete exact category the zeroth invariant is the usual zeroth K-group.
-/

/- Unit-test obligations:
idempotent_complete_case: For an idempotent complete exact category the zeroth invariant is the usual zeroth K-group.
frobenius_instance: Frobenius pairs with the envelope and the suspension satisfy the set-up.
quasi_iso_invariance: A quasi-isomorphism of differential graded algebras induces isomorphisms of all the groups.
cofinal_not_equivalence: The third functor of an exact sequence is required to be cofinal, not an equivalence; requiring an equivalence would exclude the intended examples.
-/

/-!
GeneralAlgebraicKTheory:K.6/schlichting-set-up-and-negative-localization
An exact sequence of models induces a long exact sequence of the negative groups in every non-positive degree, with a connecting map constructed by lifting an object through the enlargement; a map whose derived functor is cofinal, in particular an equivalence, induces isomorphisms in all those degrees. The first negative group has an exact meaning: it vanishes for a model exactly when, for every exact sequence out of that model, the Verdier quotient of the idempotent completions is again idempotent complete. So the negative groups are the obstruction to the classical five-term sequence continuing, and the first of them is the obstruction to idempotent completeness of quotients. This is the localisation clause of the stage text in the nonconnective formulation.
-/
/-
def negativeFrobeniusK (n : ℕ) (A : FrobeniusPair) : AddCommGrp :=
  TriangulatedK0 (idempotentCompletion (((frobeniusSuspensionIterate n).obj A).derived))
def negativeLocalization (s : ExactFrobeniusSequence A B C) : NonpositiveExactSequence (negativeFrobeniusK · A) (negativeFrobeniusK · B) (negativeFrobeniusK · C)
-/

/-!
GeneralAlgebraicKTheory:K.6/additivity-and-colimits-for-negative-K
If a natural transformation of maps of models is objectwise an inflation then the quotient is again a map of models and the induced maps in every non-positive degree add: the middle one is the sum of the outer two. For exact categories this gives the usual additivity of a short exact sequence of exact functors. The negative groups also commute with filtered colimits of models, and hence with filtered colimits of exact categories, because the colimit of the enlargements is again flasque and additivity makes its groups vanish. Both statements are proved directly from the axioms of the set-up, and both are needed by the vanishing theorem.
-/
/-
theorem negativeExactFunctorAdditivity (s : ExactFunctorSequence F G H) (n : ℕ) :
  negativeKMap n G = negativeKMap n F + negativeKMap n H := sorry
-/

/-!
GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance
A Frobenius pair is a Waldhausen category with the inflations as cofibrations and the maps inverted in the derived category as weak equivalences, so it has a K-theory space. The enlargement has a contractible K-theory space, functorially, because the flasqueness of the envelope gives a functorial homotopy from the identity to a self-map; the square built from the pair, its enlargement and its suspension then yields a natural map from the K-theory space to the loop space of the suspension's, and the sequence of these spaces is the IK-THEORY SPECTRUM. Its loop spectrum is an omega-spectrum; its homotopy groups are the Quillen K-groups in positive degrees, the zeroth K-group of the idempotent completion of the derived category in degree zero, and the negative groups of the earlier nodes below. An exact sequence of pairs gives a homotopy cartesian square and a long exact sequence in ALL degrees, and a map inducing an equivalence of derived categories induces a homotopy equivalence of K-theory spaces. This is the nonconnective spectrum of the stage text, built by flasque enlargement and suspension.
-/
/-
def IK (A : FrobeniusPair) : Spectrum := telescope (frobeniusCompletionSystem A)
def derivedEquivalenceIK (F : FrobeniusPairFunctor A B) (hF : IsDerivedEquivalence F) : IK A ≃ₛ IK B
-/

/-!
GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K
The groups the Frobenius-pair route constructs are the classical ones for rings and additive categories: for a ring R, not necessarily commutative, IK_i(R) is naturally isomorphic to Bass's and Pedersen's K_i(R) for every i ≤ 0, and for an additive category A, IK_i(A) is naturally isomorphic to Karoubi's and Pedersen and Weibel's K_i(A) for every i ≤ 0. The first negative group of an exact category has a presentation: it is the monoid of isomorphism classes of idempotents of the unbounded derived category under direct sum, modulo those that split, so it vanishes exactly when that category is idempotent complete. It vanishes for every small abelian category, and every negative group vanishes for a small noetherian abelian category; the vanishing for a regular ring follows, because the inclusion of the finitely generated projectives into the finitely generated modules is then a derived equivalence and the latter category is abelian. The2003 source states the all-negative vanishing for arbitrary small abelian categories as Conjecture9.7. This is a historical source statement, not a claim that it remains open today; later work of Neeman gives counterexamples (Neeman, arXiv:2006.16536v2, introduction pp1–2: an abelian heart with nonzero K−2). The scheme clauses of the source — agreement with Thomason's K^B_i(X) for a quasi-compact quasi-separated scheme, which the source proves from Thomason's projective line theorem and Thomason–Trobaugh 6.6(b), and the vanishing of negative G-theory of a noetherian scheme — are not part of this node: they need Perf(X), K(X) and G(X), which SchemeKTheoryOperations S.1 and S.2 define after this layer, and they are handed to S.5 and S.2 by request.
-/
/-
def additiveBassAgreement (R) (n : ℕ) : π (-(n+1 : ℤ)) (IK (boundedProjectives R)) ≃+ negativeK (n+1) R
-/

/-!
GeneralAlgebraicKTheory:K.6/projective-line-koszul
For every gluing module F and integer n, 0→F(n−2)→F(n−1)²→F(n)→0 is exact, with maps (X₁,−X₀) and (X₀,X₁). It is a conflation of vector bundles when F is a vector bundle, and is natural in F.
-/
/-
def projectiveLineKoszul (M : RingProjectiveLineObject R) (n : ℤ) :
  ShortExact (M.twist n ⟶ M.twist (n+1) ⊕ M.twist (n+1) ⟶ M.twist (n+2))
-/

/-!
GeneralAlgebraicKTheory:K.6/projective-line-eventual-regularity
For every vector bundle F in the ring gluing category there is n₀ such that for all n≥n₀ and every left R-module N, H¹(F(n)⊗_R N)=0 and H⁰(F(n))⊗_R N≅H⁰(F(n)⊗_R N). Moreover H⁰(F(n)) is a finitely generated projective right R-module.
-/
/-
theorem projectiveLineEventualRegular (V : RingProjectiveLine.vectorBundles R) :
  ∃ N : ℤ, ∀ n ≥ N, IsRegularProjectiveLineObject (V.twist n) := sorry
-/

/-!
GeneralAlgebraicKTheory:K.6/projective-line-regularity-lemmas
Call F regular when H¹(F(−1))=0. If F is regular, H¹(F(k))=0 for all k≥−1 and evaluation u_0(H⁰F)→F is onto. H⁰ is exact on regular vector-bundle conflations; for a regular vector bundle F, H⁰(F(k)) is finitely generated projective for every k≥−1.
-/
/-
def regularGlobalSectionProjective (V : RingProjectiveLine.vectorBundles R)
    (h : IsRegularProjectiveLineObject V) : FiniteProjectiveRightModule R
-/

/-!
GeneralAlgebraicKTheory:K.6/projective-line-canonical-resolution
Let MR be the exact subcategory of regular vector bundles. Define T₀F=H⁰F, Z₀F=ker(u_0(T₀F)→F), and T₁F=H⁰(Z₀F(1)). These are exact functors T₀,T₁:MR→P(Rᵐᵒᵖ), and evaluation gives a natural conflation 0→u_1(T₁F)→u_0(T₀F)→F→0 in VB(P¹_R). The first term need not lie in MR.
-/
/-
def P1.canonicalResolution (V : RingProjectiveLine.vectorBundles R)
    (h : IsRegularProjectiveLineObject V) :
  Conflation (ProjectiveLine.exactStructure R)
    (ProjectiveLine.u R 1 (P1.T1 V h)) (ProjectiveLine.u R 0 (P1.T0 V h)) V
-- T0=H⁰(V), Z0=ker(evaluation), T1=H⁰(Z0(1)); the first term need not be regular.
-/

/- Planning API:
P1.T0 (data): H⁰ on MR, as a finite projective right module.
P1.Z0 (data): The kernel of evaluation.
P1.T1 (data): H⁰(Z₀(1)), as a finite projective right module.
P1.canonicalResolution (constructor): The specified three-term conflation in VB.
P1.canonicalResolution_natural (functoriality): Bundle morphisms induce commuting maps of the resolution.
P1.T0_T1_exact (characterisation): Both coefficient functors preserve conflations of MR.
-/

/- Unit-test obligations:
p1_resolution_trivial: For F=u_0(0), both coefficient modules and all resolution terms are zero.
p1_resolution_O: For u_0(P), T₀=P and T₁=0.
p1_resolution_O1: For u_{−1}(P), T₀=P² and T₁=P.
p1_resolution_not_MR: For nonzero P, the first term u_1(P) of the O(1) resolution is not regular.
-/

/-!
GeneralAlgebraicKTheory:K.6/projective-line-regular-filtration
For MR(n)={F | F(−n) is regular}, the inclusions MR(n)→MR(n−1) and MR→VB(P¹_R) induce K-equivalences.
-/
/-
def regularProjectiveLineFiltration :
  IsFilteredUnion (fun n : ℕ => regularTwistedBundleCategory R n) (RingProjectiveLine.vectorBundles R)
-/

/-!
GeneralAlgebraicKTheory:K.6/projective-line-localisation-models
Let H₁ be the gluing modules with a length-one VB resolution and H₁,t those whose minus chart is zero. Let P be the split exact category of minus-chart projectives that extend from VB. Define F=QVB×_{QP}E(P), where E(P) is the exact-sequence category with target in QP. Define G with objects K↣V↠M⊕Q, where K,V,Q∈VB and M∈H₁,t, with the admissible span diagrams of V.7.3. The maps h:G→QH₁,t and f:G→F send this data respectively to M and (Q,j*K↣j*V↠j*Q). T=isoVB acts by adding a bundle to K and V, and the maps are equivariant.
-/
/-
structure BundleLocalizationModel (R : Type u) [Ring R] where
  K V Q : RingProjectiveLine.vectorBundles R
  M : ProjectiveLine.torsionLengthOneObjects R
  extension : Conflation (ProjectiveLine.lengthOneExactStructure R) K V (M ⊞ Q)
-- Its category has the Q-type admissible span diagrams of V.7.3, not arbitrary module maps.
-- h remembers M; f remembers Q and the split minus-chart extension.
-/

/- Planning API:
P1.localisationModels (constructor): The equivariant diagram QH₁,t←G→F over QVB→QP.
P1.localisationModels_h (projection): h sends a resolution to its torsion quotient M.
P1.localisationModels_f (projection): f remembers Q and the split extension with quotient j*Q.
P1.localisationModels_action (structure): isoVB adds to kernel and middle object, equivariantly.
P1.torsionChartEquiv (equivalence): H₁,t≃H₁,T(R[t]), retaining the exact structures.
-/

/- Unit-test obligations:
p1_torsion_zero: The zero gluing module corresponds to the zero torsion module.
p1_torsion_nil_resolution: For ν=0 on P, the chart pair (t,1) gives u_1(P)↣u_0(P) with quotient (P,0).
p1_chart_not_essentially_surjective: Cofinality via free summands is sufficient; the construction does not assert that every chart projective extends individually.
-/

/-!
GeneralAlgebraicKTheory:K.6/projective-line-resolution-fibres
For M∈H₁,t, the category G_M of VB epimorphisms V↠M with admissible monomorphisms over M is contractible. The Segal subdivision identifies it with the fibre of h up to nerve equivalence; consequently h and T⁻¹h are homotopy equivalences.
-/
/-
def projectiveLineResolutionFibreEquiv (M : ProjectiveLine.torsionLengthOneObjects R) :
  |nerve (projectiveLineResolutionComma M)| ≃ₕ PointSpace
-- The comma category consists of VB epimorphisms onto M with inflations over M.
-/

/-!
GeneralAlgebraicKTheory:K.6/projective-line-directed-lattices
For a split extension A₋↣V₋↠Q₋ in P, the poset of vector-bundle lattices V⊂j_*V₋ with j*V=V₋ and image equal to a fixed vector bundle Q is nonempty and directed. It is the comma model needed for f’s fibre over Q.
-/
/-
def ProjectiveLine.ChartLattice (s : ProjectiveLine.SplitMinusChartExtension R)
    (Q : RingProjectiveLine.vectorBundles R) : Type u
-- Lattices V⊂j_*V_- with j*V=V_- and prescribed image Q.
theorem ProjectiveLine.ChartLattice.commonEnlargement (L L' : ProjectiveLine.ChartLattice s Q) :
  ∃ L'', L ≤ L'' ∧ L' ≤ L'' := sorry
-/

/-!
GeneralAlgebraicKTheory:K.6/projective-line-localisation-comparison
The maps T⁻¹h:T⁻¹G→QH₁,t and T⁻¹f:T⁻¹G→T⁻¹F are nerve equivalences. The induced fibre map QH₁,t→QVB agrees, up to additive inverse, with the canonical inclusion into QH₁ and the resolution equivalence. Hence K(H₁,t)→K(VB)→K(P) is a homotopy fibration.
-/
/-
def projectiveLineChartFibreEquiv :
  KSpace (ProjectiveLine.torsionLengthOneExactStructure R) ≃ₕ*
    HomotopyFibre (KMap (ProjectiveLine.minusChart R))
-- Target of minusChart is the split exact category of extendable R[t⁻¹]-projectives.
-- The fibre map agrees up to additive inverse with inclusion through the resolution equivalence.
-/

/-!
GeneralAlgebraicKTheory:K.6/frobenius-pair-factorization
The Waldhausen category of a Frobenius pair has the factorization property of K.4:construction/waldhausen-factorization. This holds in its opposite too and requires no functorial choice of injectives.
-/
/-
def frobeniusGraphFactorization (f : X ⟶ Y) (i : X ⟶ I)
    (hi : E.IsInflation i) (hI : E.IsProjectiveInjective I) : CofibrationWeakFactorization f
theorem frobeniusGraph_middle :
  (frobeniusGraphFactorization f i hi hI).middle = Y ⊞ I := sorry
-/

/-!
GeneralAlgebraicKTheory:K.6/dense-triangulated-stable-classes
For an essentially small triangulated category T and strictly full dense triangulated A⊂T, define X∼Y when X⊕A₁≅Y⊕A₂ for A₁,A₂∈A. The quotient is an abelian group G_A under ⊕, with Euler relations; X∈A iff its quotient class is zero, and G_A≅K₀(T)/im K₀(A).
-/
/-
def DenseStableClass (A : StrictlyFullDenseTriangulatedSubcategory T) : AddCommGrp :=
  stableDirectSumQuotient A
def denseStableClassMap (A) : TriangulatedK0 T →+ DenseStableClass A
-/

/- Planning API:
DenseClasses (constructor): Stable direct-sum quotient of T by A.
DenseClasses.zero_iff (characterisation): class(X)=0 iff X∈A.
DenseClasses.euler (compatibility): A distinguished triangle gives class(Y)=class(X)+class(Z).
DenseClasses.quotientEquiv (compatibility): G_A≃K₀(T)/im K₀(A).
-/

/- Unit-test obligations:
all_objects: If A=T the quotient is zero.
euler_parity: For bounded complexes of finite-dimensional k-spaces, A={Euler characteristic even}; G_A≅ℤ/2 and k[0] has nonzero class.
stable_zero_not_ordinary_zero: A nonzero A-object has zero quotient class, so ordinary object isomorphism classes are the wrong quotient.
-/

/-!
GeneralAlgebraicKTheory:K.6/dense-triangulated-class-criterion
For a strictly full dense triangulated A⊂T, X∈A iff [X] lies in im K₀(A)→K₀(T). Dense subcategories correspond to subgroups of K₀(T), and K₀(A)→K₀(T) is injective.
-/
/-
theorem denseClass_zero_iff (A : StrictlyFullDenseTriangulatedSubcategory T) (X : T) :
  denseStableClassMap A (classOf X) = 0 ↔ X ∈ A := sorry
-/

/-!
GeneralAlgebraicKTheory:K.6/frobenius-replacement-category
For F:A→B inducing a derived equivalence, form C_F with objects (a,i:F(a)↣b), and componentwise maps commuting with i. Conflations are evaluated at a,b and b/F(a). Its full subcategory C of weak inflations is Frobenius; with C₀=C_{F₀} it is a Frobenius pair. The embedding a↦(a,id) and projection (a,i,b)↦a are inverse K-equivalences.
-/
/-
def FrobeniusReplacement (F : FrobeniusPairFunctor A B) : FrobeniusPair
def FrobeniusReplacement.toSource : FrobeniusPairFunctor (FrobeniusReplacement F) A
def FrobeniusReplacement.toTarget : FrobeniusPairFunctor (FrobeniusReplacement F) B
-/

/- Planning API:
FrobeniusReplacement (constructor): Objects (a,i:F(a)↣b) with i weak.
FrobeniusReplacement.exactStructure (structure): Conflations on a,b,coker(i).
FrobeniusReplacement.toSource (functoriality): Projection to a.
FrobeniusReplacement.toTarget (functoriality): Projection to b.
FrobeniusReplacement.sourceKEquiv (compatibility): The source embedding and retraction induce inverse K-equivalences.
-/

/- Unit-test obligations:
identity_embedding: For F=id, a↦(a,id) retracts onto a.
zero_to_injective: (0,0↣I) is allowed for projective-injective I and is weakly zero.
nonweak_cokernel: For F=id on bounded complexes over k, 0↣k[0] has nonzero derived cokernel and is excluded.
-/

/-!
GeneralAlgebraicKTheory:K.6/frobenius-roof-strictification
If F induces a derived equivalence, the target projection C→B from the weak-inflation replacement satisfies dual App2: for c=(a,F(a)↣b) and b′→b, there are a deflation c₃↠c in C and a weak map b′→pr_B(c₃) commuting over b. It also reflects weak equivalences.
-/
/-
def strictifyStableRoof (roof : StableRoof F X Y) : SourceReplacementRoof F X Y
theorem strictifyStableRoof_image : derivedMap F (strictifyStableRoof roof) = roof.class := sorry
-/

/-!
GeneralAlgebraicKTheory:K.6/frobenius-derived-invariance
A map of Frobenius pairs inducing an equivalence of derived categories induces K(A)≃K(B), and hence IK(A)≃IK(B).
-/
/-
def frobeniusDerivedKEquiv (F : FrobeniusPairFunctor A B) (hF : IsDerivedEquivalence F) :
  connectiveK A ≃ₛ connectiveK B
-/

/-!
GeneralAlgebraicKTheory:K.6/frobenius-model-cofinality
If a map of Frobenius pairs induces a cofinal derived functor, K(A)→K(B) is an isomorphism on positive homotopy groups and an injection on π₀.
-/
/-
def frobeniusCofinalPositiveEquiv (F : FrobeniusPairFunctor A B)
    (hF : IsCofinalDerivedFunctor F) (n : ℕ) (hn : 0 < n) :
  PiGroup n (A.waldhausen.KSpace) ≃+ PiGroup n (B.waldhausen.KSpace)
theorem frobeniusCofinalK0_injective (F : FrobeniusPairFunctor A B)
    (hF : IsCofinalDerivedFunctor F) : Function.Injective (PiMap 0 (KMap F)) := sorry
-/

/-!
GeneralAlgebraicKTheory:K.6/frobenius-nested-weak-fibration
For full thick stable-triangulated subcategories D₀⊂D₁⊂stable(B), let B_i consist of objects representing them. Then K(B₁,B₀)→K(B,B₀)→K(B,B₁) is a homotopy-fibre sequence.
-/
/-
def nestedWeakKFiber (v w : FrobeniusWeakClass A) (h : v ≤ w) :
  homotopyFiber (KWeakMap h) ≃ₛ connectiveK (weakAcyclicPair A v w)
-/

/-!
GeneralAlgebraicKTheory:K.6/frobenius-completion-spectrum
Let Â=(B,FA₀), where B⊂FA consists of objects zero in D(SA). Then D(Â) is the idempotent completion of D(A). The maps K(Â)≃ΩK(SA) make the completed-level spectrum an Ω-spectrum, and IK(A)→ÎK(A) is a stable equivalence. Thus π_iIK(A)=π_iK(A) for i>0, K₀(D(A)῀) for i=0, and K₀(D(S^{−i}A)῀) for i<0.
-/
/-
def completionStructureEquiv (A : FrobeniusPair) :
  BasedHomotopyEquiv (FrobeniusPair.completion A).waldhausen.KSpace
    (LoopSpace (FrobeniusPair.suspension A).waldhausen.KSpace)
-- D(completion A) is D(A)^♮; completion is the specified Frobenius model, not Karoubi of a pair.
-/

/-!
GeneralAlgebraicKTheory:K.6/frobenius-spectrum-localization
An exact sequence of Frobenius pairs A→B→C gives a natural homotopy-fibre sequence IK(A)→IK(B)→IK(C), and a long exact sequence in every integer degree.
-/
/-
def frobeniusSpectrumFiber (s : ExactFrobeniusSequence A B C) : IK A ≃ₛ homotopyFiber (IKMap s.second)
-/

/-!
GeneralAlgebraicKTheory:K.7/nonunital-bass-fibre
For A define K^B_nu(A)=fib(K^B(ℤ⋉A)→K^B(ℤ)) using the canonical augmentation. This is functorial for nonunital homomorphisms. When A is unital, (z,a)↦(z,z·1_A+a) identifies ℤ⋉A with ℤ×A as augmented unital rings and gives a natural equivalence K^B_nu(A)≃K^B(A) for unital maps.
-/
/-
def NonunitalBass (I : NonunitalRingCat) : Spectrum :=
  homotopyFiber (bassSpectrumMap (augmentation (unitization I)))
-/

/- Planning API:
NonunitalBass (constructor): The fibre of K^B of the unitization augmentation.
NonunitalBass.map (functoriality): A nonunital ring map induces the fibre map.
NonunitalBass.unitalEquiv (equivalence): For unital A, K^B_nu(A)≃K^B(A).
-/

/- Unit-test obligations:
zero_ring: A=0 gives fib(id:K^B(ℤ)→K^B(ℤ)), hence zero spectrum.
unital_integer_ring: For A=ℤ the unitization is ℤ×ℤ and the fibre is the second K^B(ℤ).
corner_not_product_map: For the corner ℤ→M₂(ℤ), the second component sends (z,c) to diag(c,z), not diag(c,0); ignoring z breaks unitality.
-/

/-!
GeneralAlgebraicKTheory:K.7/nonunital-map-idempotent-extension
For a possibly nonunital homomorphism h:A→B between unital rings, put e=h(1_A). Under K^B_nu(A)≃K^B(A) and K^B_nu(B)≃K^B(B), its map is induced by the exact functor P(A)→P(B), P↦P⊗_A eB for right modules. This functor preserves finite projectives.
-/
/-
def extendNonunitalProjective (f : R →ₙ+* S) :
  FiniteProjectiveRightModule R ⥤ FiniteProjectiveRightModule S
-- P ↦ P⊗_R eS, where e=f(1_R); eS is an (R,S)-bimodule with unital R-action.
def extendNonunitalProjective_apply (P : FiniteProjectiveRightModule R) :
  (extendNonunitalProjective f).obj P ≅ P ⊗_R (f 1)S
-/

/-!
GeneralAlgebraicKTheory:K.7/matrix-corner-morita-naturality
Let n≥1, A_n=M_n(R), and h_n:A_n→A_{n+1} the upper-left corner map. The standard right-module Morita functors Φ_n(P)=P⊗_{A_n}R^n identify K^B_nu(h_n) with id on K^B(R), coherently under iterated corner embeddings.
-/
/-
def matrixCornerMoritaIso (n : ℕ) (hn : 0 < n) : SpectrumHomotopy
  (matrixMoritaEquiv (n+1) (by omega) R ∘ NonunitalBass.map (matrixCorner n R))
  (matrixMoritaEquiv n hn R)
-- Both maps have source K^B_nu(M_n(R)) and target K^B(R), via the unital comparisons.
-/

/-!
GeneralAlgebraicKTheory:K.7/nonunital-filtered-continuity
For a small filtered diagram of nonunital rings A_i, hocolim_i K^B_nu(A_i)≃K^B_nu(colim_i A_i). In particular the corner inclusion R=M₁(R)→M_∞(R) induces K^B(R)≃K^B_nu(M_∞(R)).
-/
/-
def nonunitalFilteredKEquiv (D : J ⥤ NonunitalRingCat) [IsFiltered J] :
  homotopyColimit (D ⋙ NonunitalBass.functor) ≃ₛ NonunitalBass (colimit D)
-/

/-!
GeneralAlgebraicKTheory:K.7/biexact-S-grid
For filtrations A∈S_mA and B∈S_nB, the grid ((i,j),(k,l))↦F(A_{ij},B_{kl}) gives an object of S_mS_nC, naturally in both simplex variables. Weak maps in each argument give the two weak-map nerve directions of wwS_mS_nC.
-/
/-
def biexactSGrid (F : BiexactFunctor A B C) (m n : ℕ) :
  SObject A m × SObject B n → DoubleSObject C m n
theorem biexactSGrid_latching : Cofibration (pushoutCornerMap (biexactSGrid F m n)) := sorry
-/

/- Planning API:
BiexactSGrid (constructor): F:S_mA×S_nB→S_mS_nC with the joint latching condition.
BiexactSGrid.simplex_natural (functoriality): Compatibility with both simplicial directions.
BiexactSGrid.zero_left (simp): A zero input gives a zero grid.
BiexactSGrid.pushoutProduct (compatibility): The grid latching map is the displayed pushout product.
-/

/- Unit-test obligations:
zero_flag: If one input flag is zero all F(A_ij,B_kl) are zero.
vector_tensor_grid: For finite-dimensional k-spaces, a grid of flags has quotient (A_j/A_i)⊗(B_l/B_k); dimensions multiply.
sum_functor_excluded: F(A,B)=A⊕B on vector spaces is not a pairing input: F(A,0)=A rather than0.
-/

/-!
GeneralAlgebraicKTheory:K.7/biexact-stabilized-pairing
The S-grid yields a natural pairing K(A)∧K(B)→K(C), inducing K_i(A)⊗K_j(B)→K_{i+j}(C), with degree-zero formula [a]·[b]=[F(a,b)].
-/
/-
def stabilizedBiexactPairing (F : BiexactFunctor A B C) :
  connectiveK A ∧ connectiveK B ⟶ connectiveK C
-/

/-!
GeneralAlgebraicKTheory:K.7/biexact-pairing-coherence
Natural exact-functor isomorphisms between iterated biexact composites give homotopies between the induced K-pairings. Associator, unit and symmetry diagrams yield the corresponding coherent pairing diagrams. For symmetric tensor product the sphere twist gives (−1)^{ij} on K_i⊗K_j.
-/
/-
def kPairingAssociativityHomotopy (a : BiexactAssociator F G F' G') :
  Homotopy (leftIteratedKPairing F G) (rightIteratedKPairing F' G')
def kPairingUnitHomotopy : Homotopy (kPairingWithUnit R) (𝟙 (connectiveK R))
-/

/-!
GeneralAlgebraicKTheory:K.6/karoubi-direct-filtration
An A-filtration of an additive category C gives each X a directed family of split decompositions X=A_i⊕X_i with A_i∈A. Every map A→X factors through some A_i and every map X→A factors through some projection X→A_i; filtrations are compatible with⊕. The maps factoring through A form a two-sided additive ideal. Define C/A with the same objects and morphisms modulo that ideal.
-/
/-
structure DirectFiltration (A C : SmallAdditiveCategory) where
  inclusion : A ⥤ C
  fullyFaithful : inclusion.FullyFaithful
  factorizations : DirectSumFactorizationSystem inclusion
  closedFiniteSums : ClosedUnderFiniteBiproducts inclusion
def DirectFiltration.quotient (h : DirectFiltration A C) : SmallAdditiveCategory
-/

/- Planning API:
KaroubiFiltration (constructor): Actual split directed decompositions and the F1–F4 conditions.
KaroubiFiltration.finiteIdeal (constructor): Morphisms factoring through an A-object.
KaroubiFiltration.quotient (constructor): Same objects and quotient Hom groups.
KaroubiFiltration.zeroObjects (characterisation): An object becomes zero exactly when it belongs toA.
-/

/- Unit-test obligations:
finite_vectors: Truncations of a countable sequence of finite projectives give the finite-support ideal.
identity_of_old: If X∈A, id_X factors through X and vanishes in the quotient.
one_sided_insufficient: Maps out of finite objects alone do not prove the factorization ideal is compatible with maps into them.
-/

/-!
GeneralAlgebraicKTheory:K.6/karoubi-index-and-cone-boundary
For A⊂C a direct filtration, the relative index group K₀(C→C/A) is K₀(A^♮). The exact sequence K₁^cl(C)→K₁^cl(C/A)→K₀(A^♮)→K₀(C^♮)→K₀((C/A)^♮) is natural. If C is flasque, its two middle absolute groups vanish, so the index boundary K₁^cl(C/A)→K₀(A^♮) is an isomorphism.
-/
/-
def karoubiIndexEquiv (h : DirectFiltration A C) :
  ClassicalRelativeK0 h.quotientFunctor ≃+ SplitK0 (Karoubi A)
theorem karoubiIndex_gradedTriple (α : StableQuotientAutomorphism h) :
  karoubiIndexEquiv h (stableBoundary α) = gradedDifferenceTriple (cutoffE α) (cutoffF α) (cutoffAlpha α) := sorry
-/

/-!
GeneralAlgebraicKTheory:K.6/karoubi-flasque-derived-groups
For a small additive category A, the source’s cone CA has objects countable sequences drawn from finitely many A-object types and controlled matrix morphisms (finite sums of permutant matrices in the discrete case). Finite sequences identifyA as a filtered subcategory. Put SA=CA/A and Kar_{−n}(A)=K₀((SⁿA)^♮), n≥0. These derived groups have the natural localization boundary for direct filtrations.
-/
/-
structure ControlledConeObject (A : SmallAdditiveCategory) where
  family : ℕ → A
  finiteObjectTypes : (Set.range family).Finite
structure ControlledConeMorphism (X Y : ControlledConeObject A) where
  entry : ∀ i j : ℕ, X.family i ⟶ Y.family j
  finiteEntryPalette : Finset (Σ P Q : A, P ⟶ Q)
  entryInPalette : ∀ i j, ⟨X.family i, Y.family j, entry i j⟩ ∈ finiteEntryPalette
  rowSupport : ℕ → Finset ℕ
  columnSupport : ℕ → Finset ℕ
  row_mem : ∀ i j, j ∈ rowSupport i ↔ entry i j ≠ 0
  column_mem : ∀ i j, i ∈ columnSupport j ↔ entry i j ≠ 0
  bound : ℕ
  row_bound : ∀ i, (rowSupport i).card ≤ bound
  column_bound : ∀ j, (columnSupport j).card ≤ bound
def finiteMatrixIdeal (X Y) : AddSubgroup (ControlledConeMorphism X Y)
theorem finiteMatrixIdeal_mem (f : ControlledConeMorphism X Y) :
  f ∈ finiteMatrixIdeal X Y ↔ ∃ N : ℕ, ∀ i j, N ≤ i ∨ N ≤ j → f.entry i j = 0 := sorry
def additiveSuspension (A : SmallAdditiveCategory) : SmallAdditiveCategory
def karoubiNegativeK (n : ℕ) (A : SmallAdditiveCategory) : AddCommGrp :=
  SplitK0 (Karoubi (additiveSuspensionIterate n A))
-/

/- Planning API:
KaroubiCone (constructor): Finite-type countable sequences and the controlled matrix Hom groups.
KaroubiCone.swindle (structure): The repeated-sequence functor and natural id⊕T≅T.
KaroubiSuspension (constructor): The direct-filtered quotient CA/A.
KaroubiNegative (constructor): K0 of the idempotent completion of each iterated suspension.
KaroubiNegative.boundary (compatibility): Natural direct-filtration localization boundaries.
-/

/- Unit-test obligations:
finite_sequence: An old finite sequence becomes zero in the suspension.
countable_reindexing: Adding the initial column to ℕ×ℕ is absorbed by a bijection.
uncontrolled_maps: Arbitrary column-finite matrices without the source’s row/control condition are not silently admitted as morphisms.
-/

/-!
GeneralAlgebraicKTheory:K.6/bass-cone-uniqueness
Every theory satisfying axioms-for-negative-k-theory is canonically naturally isomorphic to Bass’s. For the cone ring C(R) and suspension S(R)=C(R)/M∞R, its boundary identifies E_n(S(R)) with E_(n−1)(R), n≤0. Starting with the degree0 identification determines every negative comparison and its boundary compatibility.
-/
/-
def negativeTheoryUniqueEquiv (F G : NegativeRingTheory) (n : ℕ) : F.group n ≅ G.group n
theorem negativeTheoryUniqueEquiv_boundary : naturalNegativeEquivCommutesWithBoundary F G := sorry
-/

/-!
GeneralAlgebraicKTheory:K.6/karoubi-bass-contraction-comparison
For any unital associative ring R and n≥0, Kar_{−n}(R)≅LⁿK₀(R)=K^Bass_(−n)(R), naturally in ring maps and the polynomial/Laurent maps. In1971 the source denotes Kar_{−n} by K^n. The discrete0/1 norm turns its summable series into finite polynomials.
-/
/-
def karoubiBassEquiv (n : ℕ) (R : RingCat) : karoubiNegativeK n (finiteProjectives R) ≃+ negativeK n R
-/

/-!
GeneralAlgebraicKTheory:K.7/stable-artin-module-models
For an odd primep, the finite-module categories over R₁=ℤ/p² and R₂=𝔽_p[ε]/ε² are Frobenius. With monomorphisms as cofibrations and stable isomorphisms as weak equivalences, their stable categories are both equivalent to finite-dimensional 𝔽_p vector spaces with suspension id and split distinguished triangles.
-/
/-
def stableArtinPair (R : FiniteFrobeniusRing) : FrobeniusPair
def stableArtinTriangulatedEquiv (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
  (stableArtinPair (ZMod (p*p))).derived ≌ₜ (stableArtinPair (DualNumber (ZMod p))).derived
-/

/- Planning API:
ArtinStableModel (constructor): Finite modules with monic cofibrations and stable-isomorphism weak equivalences.
ArtinStableModel.projectiveInjective (characterisation): The free modules are the projective-injective objects.
ArtinStableModel.simpleEquivalence (equivalence): Stable category≃finite𝔽_p vector spaces.
ArtinStableModel.suspension (compatibility): Multiplication byp orε identifies suspension with identity.
-/

/- Unit-test obligations:
p_three: The two rings areℤ/9 and𝔽₃[ε]/ε²; their free modules disappear stably.
simple_survives: The simple module𝔽_p has nonzero stable identity.
enhancement_absent: A triangulated equivalence alone supplies no exact map between the two Waldhausen models.
-/

/-!
GeneralAlgebraicKTheory:K.7/stable-artin-k-fibration
For either R₁ orR₂ there is a natural homotopy fibration K(R)→K(𝔽_p)→K(mM(R)), where mM(R) is the stable-weak-equivalence module model. Consequently K₄(mM(R)) injects intoK₃(R), with image the kernel ofK₃(R)→K₃(𝔽_p).
-/
/-
def stableArtinKFiber (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    (R : ArtinCounterexampleRing p) :
  BasedHomotopyEquiv (KSpace.ofRing R)
    (HomotopyFibre (KMap (ArtinStableModel.changeWeakEquivalences R)))
-- The middle space is K of finite R-modules, identified by dévissage with K(𝔽_p).
-- The last space is the connective Waldhausen K-space of the stable-weak module model.
-/

/-!
GeneralAlgebraicKTheory:K.7/naked-triangulated-invariance-counterexample
For an odd primep, despite the triangulated equivalence above, K₄(mM(ℤ/p²)) has p-primary subgroupC_(p²), while K₄(mM(𝔽_p[ε]/ε²)) has p-primary subgroupC_p⊕C_p. Their Waldhausen K-theories are therefore inequivalent.
-/
/-
theorem stableArtinK4_not_isomorphic (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    (hK3 : ArtinK3Calculations p) :
  ¬ Nonempty (PiGroup 4 ((ArtinStableModel (ZMod (p*p))).KSpace) ≃+
    PiGroup 4 ((ArtinStableModel (DualNumber (ZMod p))).KSpace)) := sorry
-/

/-!
GeneralAlgebraicKTheory:K.6/finite-chain-domination
For A fully embedded in an additive U, a bounded complex V in U is A-dominated if a finite complex D in A admits chain maps f:V→D,g:D→V and h:gf≃id_V. The homotopy idempotent fg is not assumed to be an actual degreewise idempotent.
-/
section FiniteDomination

variable {U : Type v} [Category.{w} U] [Preadditive U]

/-- A finite domination of `V` by a bounded complex with terms in the full subcategory `A`:
chain maps `f : V ⟶ D`, `g : D ⟶ V` and a homotopy `g ∘ f ≃ id_V`. -/
structure FiniteChainDomination (A : ObjectProperty U) (V : ChainComplex U ℤ) where
  D : ChainComplex U ℤ
  mem : ∀ i, A (D.X i)
  bounded : ∃ a b : ℤ, ∀ i, (i < a ∨ b < i) → Limits.IsZero (D.X i)
  forward : V ⟶ D
  backward : D ⟶ V
  homotopy : Homotopy (forward ≫ backward) (𝟙 V)

namespace FiniteChainDomination

variable {A : ObjectProperty U} {V W : ChainComplex U ℤ}

/-- Transport along a chain homotopy equivalence. -/
def transport (d : FiniteChainDomination A V) (e : HomotopyEquiv V W) :
    FiniteChainDomination A W := sorry

/-- `f ∘ g` is idempotent up to the homotopy induced by `d.homotopy`. -/
def fg (d : FiniteChainDomination A V) :
    Homotopy ((d.backward ≫ d.forward) ≫ (d.backward ≫ d.forward)) (d.backward ≫ d.forward) :=
  sorry

/-- Test self_domination: a bounded complex in `A` dominates itself, with `f = g = id`. -/
def self (hA : ∀ i, A (V.X i))
    (hb : ∃ a b : ℤ, ∀ i, (i < a ∨ b < i) → Limits.IsZero (V.X i)) :
    FiniteChainDomination A V :=
  ⟨V, hA, hb, 𝟙 V, 𝟙 V, Homotopy.ofEq (by simp)⟩

end FiniteChainDomination

-- Test contractible_domination
example (A : ObjectProperty U) (Z : U) (hZ : Limits.IsZero Z) (hA : A Z) (V : ChainComplex U ℤ)
    (h : Homotopy (𝟙 V) 0) : Nonempty (FiniteChainDomination A V) := sorry

/- Not stated here: `FiniteChainDomination.sum` needs `A` closed under biproducts and the
biproduct of chain complexes; test `homotopy_not_idempotent` is a rule against reading the
homotopy idempotent `fg` as an object of the idempotent completion. -/

end FiniteDomination

/- Planning API:
FiniteChainDomination (data): A finite A-complex D, chain maps f,g and homotopy gf≃id.
FiniteChainDomination.transport (functoriality): Transport along a chain homotopy equivalence.
FiniteChainDomination.fg (characterisation): fg is idempotent up to the induced homotopy.
FiniteChainDomination.sum (compatibility): Direct sums of the given finite dominations.
-/

/- Unit-test obligations:
self_domination: A finite A-complex has f=g=id,h=0.
contractible_domination: A contractible complex is dominated by the zero complex.
homotopy_not_idempotent: A supplied homotopy (fg)²≃fg does not justify an idempotent-completion object (D,fg).
-/

/-!
GeneralAlgebraicKTheory:K.6/finite-domination-idempotent-model
Every A-dominated complex in U is chain homotopy equivalent in U^♮ to a finite complex in A^♮. There is an explicit idempotent p on F=⊕D_i, with [V]=[F,p]−[D_odd] in K0(A^♮). Its image class in K0(U^♮) is the Euler class of V.
-/
/-
def finiteDominationIdempotent (d : FiniteChainDomination A V) : IdempotentEndomorphism (finiteTotalModule d.D)
def finiteDominationModel (d) : BoundedChainComplex (Karoubi A)
theorem finiteDominationEuler (d) : eulerClass (finiteDominationModel d) =
  classOf (karoubiImage (finiteDominationIdempotent d)) - classOf (oddTotalModule d.finite) := sorry
-/

/- Planning API:
FiniteDomination.idempotent (constructor): The actual finite block idempotent p on ⊕D_i.
FiniteDomination.finiteModel (constructor): The truncated complex E in A^♮ with the parity-dependent top idempotent.
FiniteDomination.modelEquivalence (equivalence): Chain homotopy equivalence V≃E in U^♮.
FiniteDomination.euler (compatibility): [V]=[F,p]−[D_odd], including its image in U^♮.
-/

/- Unit-test obligations:
domination_degree_zero: If f,g split strictly and D has only degree0, p=fg is the usual projector.
domination_identity: For identity domination the Euler class is the usual alternating sum of D_i.
parity_matters: For odd top degree use1−p; replacing it by p changes the Euler formula.
-/

/-!
GeneralAlgebraicKTheory:K.6/restricted-completion-complex-return
A finite complex E in A^♮ is homotopy equivalent to a finite A-complex exactly when its Euler class belongs to im(K0(A)→K0(A^♮)). More generally an A-dominated V in U has a finite A^K-model, where K is the preimage of imK0(U) under K0(A^♮)→K0(U^♮).
-/
/-
def restrictedCompletionReturn (V : BoundedChainComplex (Karoubi A))
    (h : eulerClass V ∈ range (splitK0Map (karoubiEmbedding A))) :
  ∃ W : BoundedChainComplex A, Nonempty (ChainHomotopyEquiv (karoubiEmbedding.mapComplex W) V)
-/

/-!
GeneralAlgebraicKTheory:K.6/karoubi-quotient-complex-lifting
Every bounded complex over U/A is isomorphic in the quotient to the image of a bounded complex over U. A bounded U-complex becomes contractible over U/A exactly when it is A-dominated.
-/
/-
def liftQuotientComplex (h : DirectFiltration A C) (V : BoundedChainComplex h.quotient) :
  ∃ W : BoundedChainComplex C, Nonempty (ChainHomotopyEquiv (h.quotientFunctor.mapComplex W) V)
theorem quotientContractible_iff_dominated (V) :
  IsContractible (h.quotientFunctor.mapComplex V) ↔ Nonempty (FiniteChainDominationIn A V) := sorry
-/

/-!
GeneralAlgebraicKTheory:K.6/karoubi-complex-approximation
Let C(U) have degreewise split-monic cofibrations and chain-homotopy weak equivalences; let w be the maps becoming homotopy equivalences in C(U/A). Then K(C(U),w)≃K(C(U/A)), and K(C(U)^w)≃K(C(A^K)). The same strictification gives the Verdier quotient equivalence after the indicated restricted completion.
-/
/-
def boundedQuotientKEquiv (h : DirectFiltration A C) :
  KWeakSpace (boundedComplexes C) (quotientChainEquivalences h) ≃ₕ* WaldhausenCategory.KSpace (boundedComplexWaldhausen h.quotient)
def boundedAcyclicKEquiv (h) : WaldhausenCategory.KSpace (quotientContractibleWaldhausen h) ≃ₕ* WaldhausenCategory.KSpace (boundedComplexWaldhausen h.restrictedCompletion)
-/

/-!
GeneralAlgebraicKTheory:K.6/additive-cone-frobenius-comparison
For a small idempotent-complete additive A, A→CA→SA gives the exact sequence of bounded-complex Frobenius models required for IK localization. Hence IK_(−n)(A)≅K0((SⁿA)^♮), naturally with the cone boundary. For projectives over an arbitrary associative ring, the Karoubi–Bass comparison identifies this with Bass K_(−n)(R).
-/
/-
def additiveConeIKAgreement (A : SmallIdempotentCompleteAdditiveCategory) (n : ℕ) :
  π (-(n+1 : ℤ)) (IK (boundedComplexPair A)) ≃+ SplitK0 (Karoubi (additiveSuspensionIterate (n+1) A))
-/

/- Remaining source inputs:
The exact-versus-additive comparison still needs Keller’s derived criterion: Section10 and AppendixA have now been read. The existential Frobenius factorization, generic approximation/fibration and spectrum comparisons are decomposed in K.4/K.6. Section10’s finitely presented effaceable functors and the auxiliary exact category are understood, but its invocation of Keller96 §§11.7,12.1 for full faithfulness and its dual has not been independently read. This remaining exact-versus-additive comparison is not required for the spectrum-localization proof; the source’s conditional consequence from Conjecture9.7 must be treated historically rather than as a current vanishing theorem.
The finite Artin K-three calculations underlying the read counterexample remain inputs: Schlichting2002 §§0–2 were read and the stable-model, triangulated equivalence, fibration and p-primary K4 distinction are now separate nodes. His input K3(ℤ/p²) and K3(𝔽_p[ε]/ε²) calculations cite EF82 and ALPS85; neither calculation paper was independently read. The precise numerical contracts are listed in the application and requested from the relative ring K-theory owner K.5. Next source action: read the cited odd-prime K3 computations, not search again for a triangulated counterexample.
-/


end TauCeti.HigherK
