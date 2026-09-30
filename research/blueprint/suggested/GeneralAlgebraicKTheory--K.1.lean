/-!
Signature plan for GeneralAlgebraicKTheory K.1–K.5.
FIX-RT-AREA-ktheory-1: checkpoint by Codex (codex-5ebb6f, 2026-09-29), completed by
Claude Code (cc-c2c06b, 2026-09-30).

This file is not the roadmap and is not exhaustive: the packet and its reader are
definitive, and the statements below only suggest Lean forms so that contributors and
reviewers converge on names and signatures. Every definition, API item and unit test of
the packet appears below under the packet's name. Missing Q, based-loop,
homotopy-fibre, Waldhausen and spectrum interfaces are explicit signature comments; they
must be constructed with the stated data before the signatures can be elaborated. The
file contains no proposition-valued substitutes for them.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Not compiled: no existing build at both pins was identified.
-/
import TauCeti.CategoryTheory.GrothendieckGroup.Exact
import TauCeti.Algebra.Category.ModuleCat.CartanMap

noncomputable section
namespace TauCeti.HigherK
open CategoryTheory CategoryTheory.Limits

universe u v w
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
theorem ExtCat.contractible (split exact) : the localised extension category is contractible
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
end TauCeti.HigherK

/- REV-FIX-RT-AREA-ktheory-1: transfer uses H(R), the modules admitting
finite resolutions by finitely generated projectives. Its source is V.3.3.2,
not the G-theory base-change construction V.3.5. The all-degree projection
formula consumes the requested early K.7 biexact product interface. -/

/- Review: the free/projective K₀ counterexample needs a class outside the
free subgroup (e.g. a nontrivial determinant over a Dedekind domain). Mere
non-freeness, as for a stably free module, does not establish this. -/
