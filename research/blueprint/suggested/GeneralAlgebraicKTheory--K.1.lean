import TauCeti.CategoryTheory.GrothendieckGroup.Exact
import TauCeti.Algebra.Category.ModuleCat.CartanMap

/-
Current revision: FIX-RT-AREA-ktheory-1~2, issue #5541.
Codex codex-5ebb6f, 2026-10-02; merged by Claude claude-HJaFqR, 2026-10-06. Awaits
independent review. NOT COMPILED: `lean-check` stops at the import
TauCeti.CategoryTheory.GrothendieckGroup.Exact, whose .olean the shared build at the
Mathlib pin does not have; the imports were moved above the module docstring, which Lean
requires, but no declaration below has been elaborated.
Earlier revision/compilation records below belong to their earlier text only.
The reader and JSON packet define the full roadmap. New future-carrier signatures
are comments until their suppliers exist; none asserts a completed Lean proof.
-/
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
end TauCeti.HigherK

/- REV-FIX-RT-AREA-ktheory-1: transfer uses H(R), the modules admitting
finite resolutions by finitely generated projectives. Its source is V.3.3.2,
not the G-theory base-change construction V.3.5. The all-degree projection
formula consumes the requested early K.7 biexact product interface. -/

/- Review: the free/projective K₀ counterexample needs a class outside the
free subgroup (e.g. a nontrivial determinant over a Dedekind domain). Mere
non-freeness, as for a stably free module, does not establish this. -/

/-!
Round2 FIX-RT-AREA-ktheory-1~2 (Codex, codex-5ebb6f).
The following are signatures for the specific future carriers constructed in the packet.
They remain comments until those carriers and their based-space interfaces exist. No
arbitrary Type/Prop variables, dummy Unit models or True theorems stand in for them.
In particular the generic H.2/H.4 supplier conditions are not replaced by a Prop field.
None of this file has been elaborated at the pinned commits.
-/
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


/- Round2 typed future interfaces. Each carrier is the concrete object planned in the packet,
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
def classWeakEquivalences (A : ExtensionClosedCofinalWaldhausenSubcategory W) : MorphismProperty C :=
  fun X Y f => W.weakEquivalences f ∧ classOf X = classOf Y in cokernel (k0Map A.inclusion)
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
  π 0 (relativeK R I) ≃+ π 0 (relativeK S J)
-/

/-!
GeneralAlgebraicKTheory:K.3/finite-field-transfer-base-change
For E/F finite and F′/F any field extension, write B=E⊗F F′=∏B_j, with residue fields E_j and local lengths ℓ_j=length_(B_j)B_j. Then res_(F′/F) Tr_(E/F)=Σ_j ℓ_j Tr_(E_j/F′)res_(E_j/E) on every connective K_n. Multiplicity is local module length, not the nilpotence exponent of the maximal ideal.
-/
/-
theorem finiteFieldTransferBaseChange (E F F') (x : KGroup n E) :
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
theorem localizationBoundaryProduct (x : KGroup n (localizedRing R)) (y : KGroup m R) :
  localizationBoundary (kProduct x (localizationMap y)) = kProduct (localizationBoundary x) y := sorry
theorem localizationBoundaryProduct_left (y : KGroup m R) (x : KGroup n (localizedRing R)) :
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
def projectiveKSpace_pi0 (R : RingCat) : π₀ (projectiveKSpace R) ≃+ RingK0 R
def projectiveKSpace_pi1 (R : RingCat) : π₁ (projectiveKSpace R) ≃+ ClassicalRingK1 R
theorem projectiveKSpace_pi1_automorphism (P : FiniteProjectiveRightModule R)
    (α : P ≅ P) : projectiveKSpace_pi1 R (automorphismLoop α) = stableAutomorphismClass α := sorry
theorem projectiveKSpace_pi1_natural (f : R →+* S) :
  projectiveKSpace_pi1 S ∘ projectiveKSpace_pi1Map f =
    classicalRingK1Map f ∘ projectiveKSpace_pi1 R := sorry
-/
