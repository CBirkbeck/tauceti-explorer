# General algebraic K-theory: K.1–K.5

Revision for FIX-RT-AREA-ktheory-1 by Claude Code, session cc-c2c06b, 2026-09-30, completing the checkpoint by Codex, session codex-5ebb6f, 2026-09-29.

This document renders the companion packet. Its earlier accepted review is retained as history; the revised text awaits independent review. All implementation statuses remain unchecked. Source decompositions and proof obligations are separate from Lean completion.

KSpace(A) is ΩBQ(A), and K_n(A) is π_n KSpace(A) = π_(n+1) BQ(A). The pinned exact-category carriers are imported and never redefined; no node uses Quillen's axiom (c). The ring model is one early node of K.2:plus, and the noncommutative scalar extension it uses is KTheoryLowDegrees Z.1's. Early K.3 rests only on K.1 and StableHomotopyKTheory H.1–H.2; general cofinality keeps its K.3 id but belongs to a proposed late K.3:cofinality. Waldhausen additivity and the relative S-fibration with its deloopings are in K.4:construction and precede H.5:S-delooping's spectrum assembly; the realisation theorem they need is requested from H.2 with its hypotheses checked. K.5 imports the ring model and KTheoryLowDegrees Z.1's Milnor patching and adds Milnor's K₁–K₀ Mayer–Vietoris sequence. The stage-graph changes these moves require are listed at the end for the maintainer.

## Pinned imports

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

- `mathlib:CategoryTheory.Core` — The maximal subgroupoid of a category, the groupoid of isomorphisms that the plus comparison localises. (`Mathlib/CategoryTheory/Core.lean`).
- `mathlib:CategoryTheory.Idempotents.Karoubi` — The idempotent completion, the standard witness that cofinality changes the group in degree zero. (`Mathlib/CategoryTheory/Idempotents/Karoubi.lean`).
- `mathlib:CategoryTheory.Limits.HasFilteredColimits` — Filtered colimits of categories, the input to K.1's generic colimit statement. (`Mathlib/CategoryTheory/Limits/Filtered.lean`).
- `mathlib:CategoryTheory.Limits.HasPushouts` — Pushouts, which the cofibration axioms of a Waldhausen category require along cofibrations. (`Mathlib/CategoryTheory/Limits/Shapes/Pullback/HasPullback.lean`).
- `mathlib:CategoryTheory.ObjectProperty.IsSerreClass` — Serre classes in an abelian category, the hypothesis of Quillen's localisation theorem; the localisation long exact sequence itself is absent. (`Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean`).
- `mathlib:CategoryTheory.nerve` — The nerve of a category, the first ingredient of the K-theory space. (`Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean`).
- `mathlib:HomotopyGroup` — The homotopy groups of a pointed space, the third; no K-theory space is built from these three at the pins. (`Mathlib/Topology/Homotopy/HomotopyGroup.lean`).
- `mathlib:LinearMap.ker_eq_range_of_comp_eq_id` — The complement is the image of the complementary idempotent, the other half. (`Mathlib/Algebra/Module/Submodule/Range.lean`).
- `mathlib:Module.Finite.exists_comp_eq_id_of_projective` — A finitely generated projective module is a retract of a finite free module, the module-theoretic half of K.2:plus's cofinality node. (`Mathlib/RingTheory/Finiteness/Projective.lean`).
- `mathlib:ModuleCat.extendScalars` — Extension of scalars between module categories, pinned between commutative rings only. The functor along an arbitrary unital ring map is KTheoryLowDegrees:Z.1/extend-scalars, which agrees with this one for commutative rings; K.2:plus cites this declaration only for that comparison. (`Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean`).
- `mathlib:SSet.toTop` — The realisation of a simplicial set, the second ingredient. (`Mathlib/AlgebraicTopology/SingularSet.lean`).
- `mathlib:Unitization` — The canonical unitisation of a nonunital ring with its universal property, exactly the unitisation K.5 specifies; nothing K-theoretic is built on it at the pins. (`Mathlib/Algebra/Algebra/Unitization.lean`).
- `tauceti:TauCeti.ExactK0` — The Grothendieck group of an exact category, which the fundamental-group theorem of K.1 identifies with the first homotopy group of the Q-construction. (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`).
- `tauceti:TauCeti.ExactK0.mapEquiv` — Invariance of that group under an exact equivalence, likewise. (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`).
- `tauceti:TauCeti.ExactK0.ofLE_surjective` — The comparison of the Grothendieck groups of two exact structures on one category, which the audit records is NOT cofinality; K.3's cofinality node says so. (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`).
- `tauceti:TauCeti.ExactK0.transportEquiv` — Invariance of that group under the transport, the degree-zero form of the independence K.1 states in every degree. (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`).
- `tauceti:TauCeti.ExactStructure` — Quillen exact structures on an additive category, with conflations and admissible monomorphisms and epimorphisms. This is the stated input of K.1 and it is fully built; the Q-construction is built ON it, not instead of it. (`TauCeti/CategoryTheory/Exact/ExactStructure.lean`).
- `tauceti:TauCeti.ExactStructure.isConflationExact_split` — Every additive functor is conflation-exact for split exact structures. This is why scalar extension on finitely generated projectives needs no flatness hypothesis, which is what K.2:plus asks for. (`TauCeti/CategoryTheory/Exact/Functor.lean`).
- `tauceti:TauCeti.ExactStructure.resolutionEquiv` — The degree-zero resolution isomorphism, proved under the stronger hypothesis that every resolving object is projective; K.3 states the general theorem in every degree and cites this as the pinned special case. (`TauCeti/CategoryTheory/GrothendieckGroup/ProjectiveResolution.lean`).
- `tauceti:TauCeti.ExactStructure.transport` — Transport of an exact structure along an additive equivalence, the pinned half of K.1's small-model target. (`TauCeti/CategoryTheory/Exact/Equivalence.lean`).
- `tauceti:TauCeti.moduleResolutionEquiv` — The instance of that isomorphism for modules with finite projective resolutions. (`TauCeti/Algebra/Category/ModuleCat/CartanMap.lean`).
- `tauceti:TauCeti.simpleClassBasis` — The Grothendieck group of finitely generated modules over an artinian ring is free on the simple classes, which is devissage in degree zero; K.3 states the theorem in every degree. (`TauCeti/RepresentationTheory/GrothendieckGroup/SimpleBasis.lean`).
- `tauceti:TauCeti.finiteProjectiveModules` — Object property of finitely generated projective R-modules, R : Type u. Its full subcategory has an anonymous EssentiallySmall.{u} instance in this pinned file (CartanMap.lean, section 'Essential smallness'; not indexed by name), which fixes the universe of ExactK0 and of K(R) at u. (`TauCeti/Algebra/Category/ModuleCat/CartanMap.lean`).
- `tauceti:TauCeti.finiteProjectiveModulesExactStructure` — Existing exact structure on the full subcategory of finitely generated projectives; import this carrier rather than reconstruct it. (`TauCeti/Algebra/Category/ModuleCat/CartanMap.lean`).
- `tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split` — The induced exact structure is equal to the split structure. This is the input that makes arbitrary scalar extension exact on projectives. (`TauCeti/Algebra/Category/ModuleCat/CartanMap.lean`).
- `tauceti:TauCeti.finiteProjectiveModulesExactStructure_conflation_iff` — Conflations are exactly short exact sequences after inclusion in ModuleCat R. (`TauCeti/Algebra/Category/ModuleCat/CartanMap.lean`).
- `tauceti:TauCeti.ExactK0.of` — Existing object-class map to ExactK0; the π₁ comparison must preserve this map. (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`).
- `tauceti:TauCeti.ExactK0.of_conflation` — Existing conflation-additivity relation for the class map. (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`).
- `tauceti:TauCeti.ExactK0.liftEquiv` — Existing universal property: conflation-additive invariants are additive homomorphisms out of ExactK0. (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`).
- `tauceti:TauCeti.ExactK0.lift` — The homomorphism out of ExactK0 induced by a conflation-additive invariant; the map from ExactK0 to the fundamental group of the Q-construction is this lift of the two-edge loops. (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`).
- `tauceti:TauCeti.ExactK0.hom_ext` — Two homomorphisms out of ExactK0 agreeing on object classes are equal; it checks one composite of the fundamental-group comparison. (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`).
- `tauceti:TauCeti.ExactK0.AdditiveInvariant` — An isomorphism-invariant, conflation-additive function on objects with values in an abelian group: the datum ExactK0.lift consumes. Its values must lie in a commutative group, which is why the fundamental-group node proves commutativity before lifting. (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`).
- `tauceti:TauCeti.ExactStructure.conflation_baseChange` — Base change of a conflation along any morphism is a conflation with the same kernel: the admissible-epimorphism half of composition in Q, and the dual step of the exact category of conflations. (`TauCeti/CategoryTheory/Exact/BaseChange.lean`).
- `tauceti:TauCeti.ExactStructure.conflation_cobaseChange` — Cobase change of a conflation along any morphism is a conflation with the same cokernel (Bühler, Proposition 2.12); an input of the 3×3 lemma and of the exact category of conflations. (`TauCeti/CategoryTheory/Exact/BaseChange.lean`).
- `tauceti:TauCeti.ExactStructure.conflation_comp_of_isPullback` — The pullback of a deflation along an inflation is a kernel of the composite deflation, so the pullback of an admissible monomorphism along an admissible epimorphism is an admissible monomorphism (Bühler, Proposition 2.15). It is the admissible-monomorphism half of composition in Q and is proved from E1op and the kernel property alone, without Quillen's axiom (c). (`TauCeti/CategoryTheory/Exact/BaseChange.lean`).
- `tauceti:TauCeti.ExactStructure.exists_conflation_comp` — The Noether isomorphism for a composite of two inflations (Bühler, Lemma 3.5), the last step of the 3×3 lemma. (`TauCeti/CategoryTheory/Exact/BaseChange.lean`).
- `tauceti:TauCeti.ExactStructure.bicartesianSq_of_isPushout_of_isInflation` — A pushout of an inflation is a bicartesian square (Bühler, Proposition 2.12), used in the 3×3 lemma. (`TauCeti/CategoryTheory/Exact/Bicartesian.lean`).
- `tauceti:TauCeti.ExactStructure.conflation_biprod` — A biproduct of two conflations is a conflation; it makes the coproduct functor into the exact category of conflations exact. (`TauCeti/CategoryTheory/Exact/Biproduct.lean`).
- `tauceti:TauCeti.ExactStructure.ConflationCategory` — The category of conflations of an exact structure: the full subcategory of short complexes on the conflations, with its three projection functors and functoriality in conflation-exact functors. It is the carrier of the extension category E(A) that K.3 makes exact; the pinned file puts no exact structure on it. (`TauCeti/CategoryTheory/Exact/Conflation.lean`).
- `mathlib:RingHom.pullback` — The pullback of two ring maps as a subring of the product, for arbitrary (noncommutative) rings: the ring B of a Milnor square. (`Mathlib/RingTheory/LocalRing/Pullback.lean`).
- `mathlib:RingHom.pullback_comm_sq` — The pullback square of rings commutes, which makes the composite of the first two maps of the Milnor sequence vanish. (`Mathlib/RingTheory/LocalRing/Pullback.lean`).
- `mathlib:Ideal.Quotient.ring` — The quotient of a possibly noncommutative ring by a two-sided ideal ([I.IsTwoSided]) is a ring; it is the quotient map through which K.5 treats a pair (A, I) without narrowing to commutative rings. (`Mathlib/RingTheory/Ideal/Quotient/Defs.lean`).
- `tauceti:TauCeti.ExactStructure.abelian` — The canonical exact structure of all short exact sequences on an abelian category: the ambient structure of Gillet–Waldhausen's closure hypothesis, where the ambient abelian category is data. (`TauCeti/CategoryTheory/Exact/Abelian.lean`).
- `tauceti:TauCeti.ExactStructure.fullSubcategory` — The exact structure induced on an extension-closed full subcategory; with ExactStructure.abelian it presents an exact category inside a given abelian category, the form in which the K-book's Definition II.7.0 is used here. (`TauCeti/CategoryTheory/Exact/ExtensionClosed.lean`).

## Source provenance

The source entries retain earlier workers’ read-section records. The two FIX-RT-AREA-ktheory-1 passes independently read the sections marked with that job in the packet; they do not claim a fresh reading of every inherited proof. Chapter III of the K-book and Bühler's survey are new sources of this revision.

- [The K-book: An introduction to algebraic K-theory, Chapter II: The Grothendieck group K_0](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf) — Author's online chapter file Kbook.II.pdf, 106 pages; chapter page numbers equal PDF page numbers.; SHA-256 `529ea8a5853e9fa55279e7ad79047155409b10847bd924b56f708f0950ebc607`.
- [The K-book: An introduction to algebraic K-theory, Chapter III: K_1 and K_2 of a ring](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf) — Author's online chapter file Kbook.III.pdf, 73 pages; chapter page numbers equal PDF page numbers.; SHA-256 `ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307`.
- [The K-book: An introduction to algebraic K-theory, Chapter IV: Definitions of higher K-theory](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf) — Author's online chapter file Kbook.IV.pdf, 93 pages; chapter page numbers equal PDF page numbers.; SHA-256 `9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248`.
- [The K-book: An introduction to algebraic K-theory, Chapter V: The fundamental theorems of higher K-theory](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf) — Author's online chapter file Kbook.V.pdf, 90 pages; chapter page numbers equal PDF page numbers.; SHA-256 `52dcc8ee3a1764e5ea309c59f093ac8e2a1ea64f3b94bacc05e6a2b6125b1da8`.
- [Exact categories](https://arxiv.org/pdf/0811.1480v2) — arXiv:0811.1480v2 (22 April 2009), 67 pages, the preprint of Expositiones Mathematicae 28 (2010), 1–69; printed page numbers equal PDF page numbers of the arXiv file. The journal version was not read.; SHA-256 `b7eaa8df7b6e572e2615776be4ab1930907f6c64b6a6610286d9ea5abc51d295`.

## Declarations and proof obligations

### Exact categories and Quillen's category Q(A)

`GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction` · construction · parent `GeneralAlgebraicKTheory:K.1` · implementation unchecked

For an exact category A the category Q(A) has the objects of A; a morphism from A to B is an equivalence class of diagrams in which A is received by an admissible epimorphism out of a subobject of B and that subobject is an admissible monomorphism into B, two such diagrams being equivalent when an isomorphism between them is the identity on A and on B. Composition is by pullback of the two middle objects. Equivalently a morphism from A to B is an admissible subobject of B together with an admissible epimorphism from it onto A. Two kinds of morphism are distinguished, the admissible monomorphisms and the oppositely oriented admissible epimorphisms; both are closed under composition, every morphism factors as one of the second kind followed by one of the first, uniquely up to isomorphism, the morphisms from the zero object to B correspond to the admissible subobjects of B, and the isomorphisms of Q(A) correspond to the isomorphisms of A.

**Hypotheses.**

- Import TauCeti.ExactStructure on a preadditive category with a zero object and binary biproducts: its ConflationClass supplies the kernel–cokernel pairs and its E0/E1/E2 fields with their duals the composition and base/cobase-change axioms. No competing exact-category carrier is defined. Composition in Q needs exactly two pinned facts: base change of a conflation along any map is a conflation with the same kernel (ExactStructure.conflation_baseChange), and the pullback of an admissible monomorphism along an admissible epimorphism is an admissible monomorphism, being a kernel of the composite deflation (ExactStructure.conflation_comp_of_isPullback; Bühler, Proposition 2.15). Both are proved from E1op, E2op and the kernel–cokernel property.
- Quillen's axiom (c) (Weibel, Exercise II.7.8(3); Bühler's 'obscure axiom', Proposition 2.16) is used by no node of this packet: every proof step is phrased in E0–E2, their duals and the kernel–cokernel property, as the composition step above shows. For the pinned carrier that axiom holds only for a morphism that has a cokernel (dually, a kernel), which is the hypothesis of Bühler's Proposition 2.16. The K-book defines exact categories inside an ambient abelian category (Definition II.7.0), which the pinned carrier does not have; the proofs here are intrinsic, and where a statement needs an ambient abelian category (the closure hypothesis of Gillet–Waldhausen) that category is part of the data, with the pinned induced structure.
- The equivalence classes of the defining diagrams must form a set; this is guaranteed for a small exact category, and the next node says how a small model is chosen.
- Composition uses the pullback of an admissible epimorphism along an arbitrary map, which exists and is again an admissible epimorphism by the base-change axiom; this is where the exactness axioms are used.

**Proof outline.**

1. Define the morphisms as equivalence classes of the displayed diagrams and check that the relation is an equivalence relation.
2. Define composition: for A ↞ B₂ ↣ B and B ↞ C₂ ↣ C form the pullback B₂ ×_B C₂ of the admissible epimorphism C₂ ↠ B along B₂ ↣ B (E2op). Its map to C₂ is an admissible monomorphism by ExactStructure.conflation_comp_of_isPullback and its map to B₂ an admissible epimorphism by ExactStructure.conflation_baseChange, so the composite A ↞ B₂ ×_B C₂ ↣ C is again of the required form by E1 and E1op.
3. Prove associativity and the identity laws from the universal property of the pullback, which is the representative-independence the stage text asks for.
4. Prove the subobject description: a morphism determines and is determined by an admissible subobject of the target together with an admissible epimorphism from it, so that morphisms out of the zero object are the admissible subobjects.
5. Prove the factorisation of every morphism into an oppositely oriented admissible epimorphism followed by an admissible monomorphism, unique up to isomorphism.
6. Prove that the isomorphisms of Q(A) are exactly those of A, and that Q of the opposite category is isomorphic to Q(A) with the two kinds of morphism exchanged.
7. Record the instance: the split exact structure on an additive category, where the admissible epimorphisms are the split surjections, and check that the construction does not silently identify it with a non-split one.

**Acceptance.**

- Morphisms from the zero object to B correspond to the admissible subobjects of B.
- Isomorphisms of Q(A) correspond to isomorphisms of A, so the construction does not collapse the automorphism groups.
- Q of the opposite exact category is isomorphic to Q(A), which is the symmetry the later comparisons use.
- For the split exact structure the admissible epimorphisms are the split surjections; a definition that used all epimorphisms would fail this.

**Prerequisites.** `tauceti:TauCeti.ExactStructure`, `tauceti:TauCeti.ExactStructure.conflation_baseChange`, `tauceti:TauCeti.ExactStructure.conflation_comp_of_isPullback`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `QCat` | data | The category Q(A) attached to an exact structure. |
| `QCat.hom_equiv_subobject` | characterisation | A morphism is an admissible subobject together with an admissible epimorphism onto the source. |
| `QCat.inflation` | data | The morphism attached to an admissible monomorphism. |
| `QCat.deflation` | data | The oppositely oriented morphism attached to an admissible epimorphism. |
| `QCat.factor` | characterisation | Every morphism factors as a deflation followed by an inflation, uniquely up to isomorphism. |
| `QCat.hom_zero` | characterisation | Morphisms out of the zero object are the admissible subobjects. |
| `QCat.isoQ_equiv_iso` | relation | The isomorphisms of Q(A) are those of A. |
| `QCat.op` | compatibility | Q of the opposite exact category is isomorphic to Q(A). |

**Consumers.**

- K.1, the universal property — The factorisation is exactly what makes a functor out of Q(A) determined by its values on the two kinds of morphism.
- K.1, the K-groups — The K-groups are the homotopy groups of the realisation of the nerve of this category.
- K.3, all four fundamental theorems — Each is proved by showing that a functor between Q-categories is a homotopy equivalence.
- K.4, the comparison with the S-construction — The comparison is a statement about this category.

**Unit tests.**

- `hom_from_zero` (degenerate) — Morphisms from the zero object to B are the admissible subobjects of B.
- `split_case` (non-example) — For the split exact structure the admissible epimorphisms are the split surjections; the construction must not use arbitrary epimorphisms.
- `iso_correspondence` (computation) — The isomorphisms of Q(A) are those of A.
- `op_iso` (computation) — Q of the opposite category is isomorphic to Q(A), exchanging the two kinds of morphism.

**Sources.**

- `Weibel.KBook.IV`: Definition 6.1 with 6.1.1, p. IV.53. The construction with its composition, verbatim.
- `Weibel.KBook.IV`: 6.1.2 (Subobjects) and the paragraph after it, p. IV.53. The subobject description and the two consequences, verbatim.
- `Weibel.KBook.IV`: 6.1, the paragraph on the two distinguished kinds of morphism, p. IV.53. The factorisation, verbatim; it is what the universal property of the next node rests on.
- `Buhler.ExactCategories`: Proposition 2.15, p. 10, and Proposition 2.16 with Remark 2.17, pp. 10–11 (arXiv v2). Proposition 2.15 is the composition step, proved from E1op and the kernel property; Proposition 2.16 is Quillen's axiom (c), valid only under its cokernel hypothesis and used by no node here.
- `Weibel.KBook.II`: Exercise 7.8, pp. II.70–71. Quillen's axiom (c) in the source's numbering, with its kernel and cokernel hypotheses.

### The universal property of Q(A)

`GeneralAlgebraicKTheory:K.1/Q-construction-universal-property` · lemma · parent `GeneralAlgebraicKTheory:K.1` · implementation unchecked

To give a functor out of Q(A) it is enough to give an object for each object of A, a map for each admissible monomorphism and a map for each admissible epimorphism, such that each of the two assignments is functorial and such that for every bicartesian square with admissible monomorphisms horizontally and admissible epimorphisms vertically the two composites agree; the functor is then unique. In particular an exact functor of exact categories induces a functor of the Q-categories, and hence a map of K-groups. The proof is the factorisation of the previous node together with the rewriting of a deflation followed by an inflation into the normal form, which is what the bicartesian condition supplies.

**Hypotheses.**

- A is an exact category and the target is any category.
- The bicartesian squares in question are those coming from an admissible layer, that is from a pair of composable admissible monomorphisms.
- Uniqueness is up to equality of functors, not merely up to isomorphism, because the factorisation is unique up to unique isomorphism.

**Proof outline.**

1. Observe that every morphism of Q(A) is a deflation followed by an inflation, so a functor is determined by its values on those two classes.
2. Check that the two functoriality conditions make the assignment well defined on each class separately.
3. Check that a composite of two morphisms in normal form is again put in normal form by the bicartesian condition, which is what gives functoriality of the whole assignment.
4. Deduce that an exact functor induces a functor of Q-categories, since it carries admissible monomorphisms, admissible epimorphisms and bicartesian squares to the same.
5. Record the two uses the layer makes of it: the functor to the Grothendieck group used in the next node, and the functoriality of the K-groups.

**Acceptance.**

- An exact functor induces a functor of Q-categories and hence maps of all K-groups.
- The functor sending every inflation to the identity and every deflation to translation by the class of its kernel exists, by this property; it is what proves the fundamental-group theorem.
- The bicartesian condition cannot be dropped: without it the assignment is not functorial on composites.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `QCat.lift` | data | The functor out of Q(A) determined by the data. |
| `QCat.lift_inflation` | compatibility | Its value on an inflation. |
| `QCat.lift_deflation` | compatibility | Its value on a deflation. |
| `QCat.lift_unique` | characterisation | Uniqueness of the functor. |
| `QCat.map` | functoriality | The functor induced by an exact functor. |

**Consumers.**

- K.1, the fundamental group — The comparison with the Grothendieck group is built with this property, not by counting.
- K.1, functoriality of the K-groups — Every map of K-groups in this roadmap comes from an exact functor through this lemma.

**Unit tests.**

- `exact_functor_induces` (computation) — An exact functor induces a functor of Q-categories.
- `determined_by_two_classes` (compatibility) — Two functors agreeing on inflations and deflations are equal.
- `bicartesian_needed` (non-example) — Without the bicartesian condition the assignment is not functorial; the condition is not decorative.

**Sources.**

- `Weibel.KBook.IV`: 6.1, the factorisation, and 6.2, the proof, pp. IV.53 to IV.54. The factorisation this lemma turns into a universal property, and the use Weibel makes of it in the next node. Weibel does not state the universal property as a numbered result; the statement here is assembled from the factorisation and from the construction of the functor in the proof of Proposition 6.2, and the packet says so rather than attributing a numbered theorem to the source.

### Small models, transport of the exact structure and independence

`GeneralAlgebraicKTheory:K.1/small-models-and-transport` · comparison · parent `GeneralAlgebraicKTheory:K.1` · implementation unchecked

The K-groups are defined for a small exact category. An exact category with only a set of isomorphism classes is replaced by an equivalent small subcategory, and the choice is irrelevant because an equivalence of exact categories induces a homotopy equivalence of the realisations; the comparison is natural in exact functors. Tau Ceti already has the algebraic half of this: it transports an exact structure along an additive equivalence and proves that the Grothendieck group is invariant under that transport and under exact equivalences, with the small-model choice fixed once. What is missing is the same statement for Q(A) and for the higher groups, and this node states it.

**Hypotheses.**

- The exact category has a set of isomorphism classes; the small subcategory is equivalent to it as an exact category, that is by an equivalence carrying conflations to conflations in both directions.
- Naturality is in exact functors: a square of exact functors and equivalences commutes up to a natural isomorphism, and isomorphic exact functors induce the same map.
- The pinned Tau Ceti transport is along an additive equivalence with the exact structure carried across; that is the hypothesis this node reuses.
- Universe discipline: the pinned ExactK0 E lives in Type w for [EssentiallySmall.{w} C], so the small model, its Q-category, nerve and realisation are taken w-small and every K-group lives in universe w. For a ring R : Type u the pinned EssentiallySmall.{u} instance of the finitely generated projectives fixes w = u. No universe is raised silently when passing to the model.

**Proof outline.**

1. Record the pinned statements: transport of an exact structure along an equivalence, invariance of the Grothendieck group under that transport, and invariance under an exact equivalence.
2. Prove that an exact equivalence induces an isomorphism of Q-categories and hence a homotopy equivalence of realisations.
3. Prove that isomorphic exact functors induce isomorphic functors of Q-categories and therefore the same maps of K-groups.
4. Deduce independence of the small model, and state the naturality in exact functors, which is the part the audit records as missing above degree zero.
5. Record that the basepoint may be taken to be any zero object, since there is a unique map between two zero objects in Q(A) and hence a canonical path.

**Acceptance.**

- The K-groups do not depend on the choice of small model, and the isomorphism is natural in exact functors.
- In degree zero the statement is Tau Ceti's pinned invariance of the Grothendieck group, and the two must agree.
- The choice of zero object does not matter.
- The comparison of the fundamental group with ExactK0 E : Type w is made on a w-small model, so the two groups live in the same universe.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`, `tauceti:TauCeti.ExactStructure.transport`, `tauceti:TauCeti.ExactK0.transportEquiv`, `tauceti:TauCeti.ExactK0.mapEquiv`

**Sources.**

- `Weibel.KBook.IV`: Definition 6.3.1 and the surrounding remark, p. IV.55. Functoriality and the independence of the model up to isomorphic functors, verbatim.

### The fundamental group of the Q-construction is the Grothendieck group

`GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0` · theorem · parent `GeneralAlgebraicKTheory:K.1` · implementation unchecked

For an exact structure E on an essentially w-small category, with the pinned ExactK0 E : Type w, the realisation of the nerve of Q(E) on the w-small model of the previous nodes is a connected complex whose fundamental group at the zero object is ExactK0 E; the element corresponding to ExactK0.of A is the based loop made of the two edges from the zero object to A, the admissible monomorphism and the oppositely oriented admissible epimorphism. Both directions of the isomorphism come from universal properties: ExactK0.lift of the two-edge loops in one direction, and in the other the map on fundamental groups induced, through the classification of coverings, by the functor from Q(E) to ExactK0 E that the universal property of Q provides. No counting argument is used.

**Hypotheses.**

- C is preadditive with a zero object and binary biproducts and [EssentiallySmall.{w} C], as the pinned ExactK0 E : Type w requires. The realisation is formed on a w-small model and transported by K.1/small-models-and-transport, whose degree-zero part is ExactK0.transportEquiv.
- The orientation of the loop is fixed once and for all as in the source, and every later comparison uses that orientation.
- The Grothendieck group is the pinned ExactK0 E, generated by the objects with a relation for each conflation; its class map is ExactK0.of, its universal property ExactK0.lift (with liftEquiv) out of an ExactK0.AdditiveInvariant with values in a commutative group, and its extensionality ExactK0.hom_ext.

**Proof outline.**

1. Take the family of all morphisms out of the zero object as a maximal tree of the nerve, which is legitimate because each non-zero vertex occurs exactly once.
2. Read off the presentation of the fundamental group from the maximal tree (StableHomotopyKTheory:H.1/coverings-fundamental-group-local-coefficients): it is generated by the morphisms of Q(E), modulo [t] = 1 for t in the tree and [f][g] = [f ∘ g] for composable pairs.
3. Reduce the generators: [B₂ ↣ B] = 1, so [A ↞ B₂ ↣ B] = [A ↞ B₂], and [A ↞ B][0 ↞ A] = [0 ↞ B]; hence the fundamental group is generated by the classes ℓ(A) = [0 ↞ A], represented by the two-edge loops of the statement.
4. For a conflation A ↣ B ↠ C the composite 0 ↣ C ↞ B equals 0 ↞ A ↣ B in Q(E), which gives ℓ(B) = ℓ(A)ℓ(C). Applied to the two split conflations with middle term A ⊞ C it gives ℓ(A)ℓ(C) = ℓ(C)ℓ(A), so the group, being generated by the ℓ(A), is commutative; isomorphic objects give equal ℓ. Hence ℓ is an ExactK0.AdditiveInvariant with values in the fundamental group written additively, and φ := ExactK0.lift ℓ : ExactK0 E → π₁ sends ExactK0.of A to ℓ(A).
5. Construct ψ : π₁ → ExactK0 E from the functor from Q(E) to ExactK0 E, regarded as a one-object groupoid, that K.1/Q-construction-universal-property gives: every inflation goes to 0 and every deflation, as a morphism of Q(E), to the class of its kernel (Weibel, Example 6.2.3). A morphism-inverting functor to a groupoid induces a homomorphism on fundamental groups by the covering classification of H.1.
6. Prove ψ ∘ φ = id by ExactK0.hom_ext, since ψ(ℓ(A)) is the class of the kernel of A ↠ 0, which is ExactK0.of A; prove φ ∘ ψ = id on the generators ℓ(A). No comparison of cardinalities enters.
7. Transport to an essentially small category through K.1/small-models-and-transport and ExactK0.transportEquiv, and check that the resulting isomorphism still sends ExactK0.of A to ℓ(A) and each conflation relation (ExactK0.of_conflation) to the relation ℓ(B) = ℓ(A)ℓ(C). The library has ExactK0 but not this comparison.

**Acceptance.**

- The class ExactK0.of A corresponds to the two-edge loop, with the orientation fixed here.
- The isomorphism is built from ExactK0.lift and the covering classification, as the stage text demands; equality of cardinalities is not a proof.
- The relation coming from a conflation is the additivity relation ExactK0.of_conflation, so the comparison is compatible with the pinned Tau Ceti presentation.
- The fundamental group and ExactK0 E live in the same universe w.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/Q-construction-universal-property`, `GeneralAlgebraicKTheory:K.1/small-models-and-transport`, `StableHomotopyKTheory:H.1/coverings-fundamental-group-local-coefficients`, `tauceti:TauCeti.ExactK0`, `tauceti:TauCeti.ExactK0.of`, `tauceti:TauCeti.ExactK0.of_conflation`, `tauceti:TauCeti.ExactK0.AdditiveInvariant`, `tauceti:TauCeti.ExactK0.lift`, `tauceti:TauCeti.ExactK0.liftEquiv`, `tauceti:TauCeti.ExactK0.hom_ext`, `tauceti:TauCeti.ExactK0.transportEquiv`, `mathlib:CategoryTheory.nerve`, `mathlib:SSet.toTop`, `mathlib:HomotopyGroup`

**Sources.**

- `Weibel.KBook.IV`: Proposition 6.2 with its proof, p. IV.54. The theorem, the representative of a class and the maximal-tree proof, verbatim.
- `Weibel.KBook.IV`: Proof of Proposition 6.2 and Example 6.2.3, p. IV.54. The generators, the additivity relation and the functor to the Grothendieck group from which the inverse map is built.

### The K-groups of an exact category

`GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories` · definition · parent `GeneralAlgebraicKTheory:K.1` · implementation unchecked

For a small exact category A, define BQ(A) as the realisation of the nerve of Q(A), and KSpace(A) = ΩBQ(A) based at the zero object. Define K_n(A) = π_n KSpace(A) = π_(n+1) BQ(A), for n ≥ 0. The groups are abelian, including degree zero by the preceding ExactK0 comparison. Exact functors give maps and naturally isomorphic exact functors give homotopic maps. Essentially small inputs use the preceding small-model transport. The ring specialisation and its scalar-extension functor belong to the early K.2:plus ring node; scheme specialisations belong to SchemeKTheoryOperations:S.2.

**Hypotheses.**

- A is small, or has a set of isomorphism classes and is replaced by a small model as in the earlier node.
- The basepoint is a zero object, and the choice does not matter.
- Indexing: K_n(A) = π_n KSpace(A) = π_(n+1) BQ(A). Degree zero is π₀ of the loop space and π₁ of BQ, compared with ExactK0.

**Proof outline.**

1. Construct BQ(A), then its based loop space KSpace(A); define KGroup(A,n) as π_n of that loop space, equivalently π_(n+1) of BQ(A).
2. Prove that the groups are abelian in every degree, in degree zero by the previous node and above by the standard argument for homotopy groups in degree at least two.
3. Prove functoriality from the universal property, and that isomorphic exact functors give the same maps.
4. Keep this node generic in exact categories; import the early ring specialisation in its consumers and leave scheme specialisations to S.2.
5. Record what is pinned: the nerve of a category, the realisation of a simplicial set and the homotopy groups of a pointed space all exist in Mathlib, and no K-theory space is built from them.

**Acceptance.**

- In degree zero the definition agrees with the Grothendieck group.
- The zero exact category has contractible K-theory, so all its groups vanish.
- BQ(A) is connected even when ExactK0(A) is nonzero; KSpace(A) has π₀ = ExactK0(A). Confusing BQ with its loop space fails this test.
- The groups of a category and of its opposite agree.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0`, `GeneralAlgebraicKTheory:K.1/small-models-and-transport`, `mathlib:CategoryTheory.nerve`, `mathlib:SSet.toTop`, `mathlib:HomotopyGroup`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `KSpace` | data | The based loop space ΩBQ(A), whose π₀ is ExactK0(A). |
| `KGroup` | data | π_n KSpace(A), equivalently π_(n+1) BQ(A). |
| `KGroup.addCommGroup` | structure | The abelian group structure, in every degree including zero. |
| `KGroup.map` | functoriality | The map induced by an exact functor. |
| `KGroup.map_of_natIso` | compatibility | Isomorphic exact functors induce the same map. |
| `KGroup.zero_eq_exactK0` | relation | In degree zero the group is the pinned Grothendieck group. |

**Consumers.**

- Every later layer of this roadmap — K.2 compares these groups with the plus construction, K.3 proves the fundamental theorems about them, K.4 compares them with the Waldhausen construction and K.5 makes them relative.
- K.6 and K.7 — The nonconnective extension takes this connective theory as input, and the invariance and product statements are about it; their ring forms go through the early ring model of K.2:plus.
- The consumer roadmaps — ArithmeticKTheory, K2SymbolsBrauer, K3BlochGroups and the rest import these groups by name.

**Unit tests.**

- `degree_zero` (degenerate) — The zeroth group is the Grothendieck group.
- `zero_category` (degenerate) — The zero exact category has vanishing K-groups.
- `loop_indexing` (non-example) — BQ(A) is connected but π₀ KSpace(A) = ExactK0(A); the two spaces must not be identified.
- `opposite` (compatibility) — The groups of a category and of its opposite agree.

**Sources.**

- `Weibel.KBook.IV`: Definition 6.3, p. IV.54. Formula in Definition 6.3; the preceding sentence defines KA as ΩBQA. The former packet transcription omitted Ω.

### Elementary properties: opposites, finite products and filtered colimits

`GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups` · theorem · parent `GeneralAlgebraicKTheory:K.1` · implementation unchecked

The K-groups of an exact category and of its opposite agree, since the two Q-categories are isomorphic; the direct sum of two exact categories is exact with Q of the sum the product of the Q-categories, so the K-groups of a finite direct sum are the products of the K-groups; and the K-groups commute with filtered colimits of exact categories, because the filtered colimit carries an exact structure, Q commutes with it and so do the classifying space and its homotopy groups. The direct sum makes the realisation a homotopy-commutative H-space, and the induced addition is the group operation. These are statements about exact categories only; their ring forms (finite products of rings, filtered colimits of rings through idempotent matrices, opposite rings) belong to the early ring model K.2/functorial-K-theory-of-a-ring.

**Hypotheses.**

- The products are finite; the colimits are over small filtering categories of exact categories and exact functors, and the colimit carries the exact structure whose conflations are the images of conflations at some stage (Weibel, Exercise II.7.9, through the axioms of Exercise II.7.8(1)–(2)).
- The H-space structure is the one induced by the direct sum, and the identification with the group structure is part of the statement.

**Proof outline.**

1. Prove that Q of the opposite category is isomorphic to Q(A), exchanging the two kinds of morphism, and read off the first statement.
2. Prove that Q of a direct sum of exact categories is the product of the Q-categories and that the realisation preserves finite products, and read off the second.
3. Equip a filtered colimit of exact categories with its exact structure, prove that Q commutes with the filtered colimit, and read off the third from the commutation of classifying spaces and homotopy groups with filtered colimits of small categories (StableHomotopyKTheory:H.1/filtered-colimits-of-categories).
4. Prove that the direct sum makes the realisation a homotopy-commutative H-space, and that the addition it induces on the homotopy groups is the group operation, using that the two inclusions are isomorphic to the identity.
5. Leave the ring instances to K.2/functorial-K-theory-of-a-ring, which needs the idempotent-matrix model to make the filtered colimit a functor of rings.

**Acceptance.**

- The K-groups of a direct sum of two exact categories are the products of the K-groups.
- The K-groups of a filtered colimit of exact categories are the colimit of the K-groups.
- Infinite products are not claimed; only finite ones.
- The H-space addition agrees with the group operation on homotopy groups.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `StableHomotopyKTheory:H.1/filtered-colimits-of-categories`, `mathlib:CategoryTheory.Limits.HasFilteredColimits`

**Sources.**

- `Weibel.KBook.IV`: Elementary properties 6.4, pp. IV.55 to IV.56. All three statements with their proofs, verbatim; the ring examples in the same passage are the ring model's (K.2/functorial-K-theory-of-a-ring).

### Scalar extension as an exact functor of finitely generated projectives, without a flatness hypothesis

`GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality` · construction · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

For a unital ring homomorphism f from A to B, possibly noncommutative, the scalar-extension functor f_! = B ⊗_A − of KTheoryLowDegrees Z.1 (Z.1/extend-scalars, the left adjoint of restriction of scalars, for arbitrary unital rings) restricts to an additive functor from the finitely generated projective A-modules to the finitely generated projective B-modules (Z.1/extend-scalars-finite-projective). This node makes it an exact functor of the pinned exact categories: the exact structure on finitely generated projectives is the split one (finiteProjectiveModulesExactStructure_eq_split), and every additive functor is exact for split structures (ExactStructure.isConflationExact_split), so no flatness hypothesis is needed. The identity and composition natural isomorphisms of Z.1/extend-scalars make f ↦ f_! a pseudofunctor into exact functors, which is what makes the K-theory of a ring functorial in K.2/functorial-K-theory-of-a-ring. Neither the arbitrary-ring functor nor its preservation of finitely generated projectives is in the pinned libraries; they are Z.1's, and this node does not rebuild them.

**Hypotheses.**

- The ring map is unital and the rings need not be commutative; the extension of scalars is Z.1's ExtendScalars (in the K-book's right-module notation P ↦ P ⊗_A B), not Mathlib's ModuleCat.extendScalars, which is stated for commutative rings and is used only for the comparison in the commutative case.
- No flatness is assumed. Flatness would be needed to preserve arbitrary exact sequences, and is not needed here because the exact structure on finitely generated projectives is the split one.
- The categories are the pinned full subcategories (finiteProjectiveModules R).FullSubcategory with finiteProjectiveModulesExactStructure R, each with the pinned EssentiallySmall.{u} instance, for rings in one universe u.

**Proof outline.**

1. Import from KTheoryLowDegrees Z.1 the functor ExtendScalars f with its unit and composition natural isomorphisms, and its restriction to an additive functor between the finitely generated projectives (Z.1/extend-scalars-finite-projective (b) and (d)).
2. Prove that the restriction is conflation-exact for the pinned structures: rewrite both with finiteProjectiveModulesExactStructure_eq_split and apply ExactStructure.isConflationExact_split; record that this is where the absence of a flatness hypothesis comes from.
3. Transport the unit and composition isomorphisms of Z.1/extend-scalars to natural isomorphisms of exact functors, so that f ↦ f_! respects identities and composites up to the specified isomorphisms.
4. For commutative rings, compare f_! with Mathlib's ModuleCat.extendScalars through Z.1's natural isomorphism.
5. Record the contrast on all finitely generated modules, where exactness of base change genuinely needs flatness.

**Acceptance.**

- Base change along any unital ring map, including noncommutative ones, induces an exact functor of the categories of finitely generated projectives, with no flatness hypothesis.
- Base change on all finitely generated modules is exact only under a flatness hypothesis; the two must not be confused.
- The exact functors attached to an identity and to a composite of ring maps are the identity and the composite, up to the natural isomorphisms of Z.1/extend-scalars.

**Prerequisites.** `KTheoryLowDegrees:Z.1/extend-scalars`, `KTheoryLowDegrees:Z.1/extend-scalars-finite-projective`, `mathlib:ModuleCat.extendScalars`, `tauceti:TauCeti.ExactStructure.isConflationExact_split`, `tauceti:TauCeti.ExactStructure`, `tauceti:TauCeti.finiteProjectiveModules`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure_conflation_iff`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `projBaseChange` | data | The exact functor f_! between the pinned exact categories of finitely generated projectives, for a unital ring map f. |
| `projBaseChange_exact` | characterisation | It is conflation-exact, by additivity alone, for the split structure. |
| `projBaseChange_id` | functoriality | The exact functor of the identity ring map is naturally isomorphic to the identity. |
| `projBaseChange_comp` | functoriality | Compatibility with composition of ring maps, through Z.1's composition isomorphism. |
| `projBaseChange_no_flat` | relation | No flatness hypothesis is needed here, unlike on all finitely generated modules. |
| `projBaseChange_comm` | compatibility | For commutative rings it is naturally isomorphic to the restriction of Mathlib's ModuleCat.extendScalars. |

**Consumers.**

- K.2:plus, the ring model — K.2/functorial-K-theory-of-a-ring defines the map of K-theory spaces of a ring map as K of this exact functor.
- K.2:plus, the plus comparison — The comparison is asserted to commute with ring maps, which needs this functor.
- K.5 — Relative K-theory of a ring map is the homotopy fibre of the map this functor induces.

**Unit tests.**

- `no_flatness` (computation) — The functor is exact without any flatness hypothesis.
- `free_case` (computation) — It carries a finite free module to a finite free module of the same rank.
- `composition` (compatibility) — It is compatible with composition of ring maps.
- `modules_need_flat` (non-example) — On all finitely generated modules exactness does need flatness; a formalisation that dropped it there would be wrong.
- `noncommutative_map` (computation) — For the inclusion of a field k into the matrix ring M₂(k), neither ring being commutative in the second case, the functor sends k to M₂(k), free of rank one over M₂(k); in K₀(M₂(k)) ≅ ℤ, generated by the simple module k², the class of M₂(k) is twice that generator, so the induced map ℤ = K₀(k) → K₀(M₂(k)) = ℤ is multiplication by 2.

**Sources.**

- `Weibel.KBook.IV`: Definition 6.3.2, p. IV.55. The definition of the K-theory of a ring for an arbitrary ring with unit, and the transfer in the opposite direction, verbatim; the arbitrary-ring scope is why the noncommutative functor of Z.1 is used.
- `Weibel.KBook.IV`: Definition 6.3.3, p. IV.55. The flatness hypothesis where it is genuinely needed, on all finitely generated modules, verbatim; the contrast with finitely generated projectives is the point of this node.

### The extension category and the fibration over Q(A)

`GeneralAlgebraicKTheory:K.2:plus/extension-category-and-the-fibration` · construction · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

For an exact category A the EXTENSION CATEGORY has as objects the admissible exact sequences of A, with morphisms the equivalence classes of the displayed three-row diagrams. The functor to Q(A) sending a sequence to its quotient term is fibred, its fibre over the zero object is the groupoid of isomorphisms of A, and each fibre is symmetric monoidal with a faithful monoidal functor from that groupoid. Localising the fibre at that action and comparing gives a fibration from the localised groupoid through the localised fibre to a contractible category, and the localised extension category is itself contractible; these are the inputs to the plus-equals-Q theorem of the next node. This category EA of Weibel IV.7.3, whose morphisms are the Q-type diagrams (7.3.1), is not the exact category E(A) of conflations with ordinary morphisms that the Additivity Theorem and the S-construction use (Weibel V.1.1.1 and II.9.3), which K.3 constructs: EA is not an exact category, and its only functor to Q(A) is the quotient-term functor.

**Hypotheses.**

- A is a small exact category; for the contractibility statements A is split exact, that is every admissible exact sequence splits.
- The groupoid of isomorphisms acts on each fibre by direct sum on the sub and total terms, leaving the quotient term fixed.
- Split exactness is what makes the relevant category connected; without it the source records that it is not.

**Proof outline.**

1. Define the extension category with the source's morphisms (7.3.1) and the functor t to Q(A) taking a sequence to its quotient term, the right column of (7.3.1) being a morphism of Q(A). Record that the left column is an admissible monomorphism from the sub term of the target into that of the source and the middle column an admissible monomorphism from the total term of the source into that of the target, so that EA carries no exact sub- or total-term functors to A.
2. Prove that the quotient functor to Q(A) is fibred and identify the fibre over the zero object with the groupoid of isomorphisms.
3. Give each fibre its symmetric monoidal structure and the faithful monoidal functor from the groupoid of isomorphisms.
4. Prove that the localisation of the groupoid through the localisation of a fibre to the associated category is a fibration, and that the last is contractible when A is split exact, being a connected group-like H-space on which the diagonal gives a homotopy between the identity and multiplication by two.
5. Prove that the extension category is contractible and deduce that its localisation is, using that an action on a contractible category is invertible.

**Acceptance.**

- The fibre over the zero object is the groupoid of isomorphisms of A.
- For a split exact category the relevant comparison category is contractible; for a category with a non-split exact sequence the source records that it is not even connected.
- The theorem of the next node cannot be obtained by applying the fibration criterion directly to the extension category, which is why the localised functor is used.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`, `mathlib:CategoryTheory.Core`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `ExtCat` | data | The extension category of an exact category. |
| `ExtCat.quot` | data | The quotient-term functor, which is the one fibred over Q(A). |
| `ExtCat.fibre_zero` | characterisation | The fibre over the zero object is the groupoid of isomorphisms. |
| `ExtCat.contractible` | characterisation | The extension category is contractible. |

**Consumers.**

- K.2:plus, the plus-equals-Q theorem — The theorem is proved by applying the fibration criterion to the localised extension category.
- Weibel IV.7.3 to 7.5, as distinct from V.1.1.1 — The category of conflations with ordinary morphisms, not this one, is the extension category of the Additivity Theorem and the second term of the S-construction; the two are kept apart.

**Unit tests.**

- `fibre_is_iso_groupoid` (degenerate) — The fibre over the zero object is the groupoid of isomorphisms.
- `split_needed` (non-example) — For a non-split exact category the comparison category is not connected, so the hypothesis cannot be dropped.
- `quotient_functor_to_Q` (computation) — The right column of every morphism (7.3.1) is a morphism of Q(A), and composing morphisms of EA composes these columns, so taking the quotient term is a functor t from EA to Q(A).
- `not_directly_fibred` (non-example) — The fibration criterion does not apply to the extension category over Q(A) itself unless the category is zero; the localised functor must be used.
- `not_the_conflation_category` (non-example) — EA is not the category of conflations: its morphisms over an identity of Q(A) are pairs of isomorphisms (Weibel 7.4), whereas a conflation X ↣ X ↠ 0 with X nonzero has the zero endomorphism in the category of conflations; a formalisation that reused the category of conflations here would lose the identification of the fibre over 0 with the groupoid of isomorphisms.

**Sources.**

- `Weibel.KBook.IV`: Definition 7.3 with (7.3.1), p. IV.62. The extension category, verbatim.
- `Weibel.KBook.IV`: §7, the opening of the section, p. IV.61. The place where the source fixes the split-exactness hypothesis of this construction, verbatim.

### The plus-equals-Q theorem

`GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q` · theorem · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

For a split exact category with isomorphism groupoid S, the LOOP SPACE of the realisation of Q(A) is the realisation of the localisation of S at itself, so the K-groups of A are those of the symmetric monoidal groupoid S in every non-negative degree. For the finitely generated projective modules over a ring this gives that the loop space of the realisation of Q is the product of the zeroth K-group with the plus construction on the classifying space of the stable general linear group, and hence that the K-groups defined from the Q-construction agree with those defined from the plus construction in every degree. The product description is a description of the space after choosing representatives of the components; it is not a claim that the infinite-loop structure splits as a product, and the translations between components are not natural.

**Hypotheses.**

- A is split exact and S is its groupoid of isomorphisms; the localisation is the one at the translation action, which is faithful.
- The identification with the product is at the level of spaces, after a choice of component representatives, exactly as the stage text demands.
- The comparison commutes with ring maps and with block sum; it is not asserted to commute with the noncanonical translations between components.

**Proof outline.**

1. State the theorem for a split exact category and record that the localised groupoid is the group completion of the groupoid.
2. Apply the fibration criterion to the localised extension category over Q(A), using that the two base changes attached to the two morphisms out of an object compose with the equivalence of the localised fibre to the identity and to the direct sum with that object, both homotopy equivalences.
3. Use the contractibility of the localised extension category to conclude that the loop space of the realisation of Q is the realisation of the localised groupoid.
4. Specialise to the finitely generated projectives over a ring, where the localised groupoid is the product of the zeroth K-group with the plus construction, and read off the comparison of the two definitions.
5. State the naturality: the comparison commutes with maps induced by ring homomorphisms and with block sum, and say explicitly that nothing is claimed about translations between components.
6. Record the degree-one and degree-two consequences the source gives as exercises, namely that the fundamental group is the zeroth group of the groupoid and that the second homotopy group carries the class of an automorphism to its class in the first K-group of the groupoid.

**Acceptance.**

- For every ring the loop space of the realisation of Q of the finitely generated projectives is the product of the zeroth K-group and the plus construction, and the two definitions of the K-groups agree in every degree.
- The product description holds after choosing component representatives; no natural product splitting of infinite-loop spaces is claimed.
- The identification in degree one carries the class of an automorphism to its class in the first K-group of the isomorphism groupoid.

**Prerequisites.** `GeneralAlgebraicKTheory:K.2:plus/extension-category-and-the-fibration`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `StableHomotopyKTheory:H.4`

**Sources.**

- `Weibel.KBook.IV`: Theorem 7.1 and Corollary 7.2, pp. IV.61 to IV.62. The theorem, verbatim: it is the LOOP SPACE ΩBQA that is B(S⁻¹S); the previous excerpt had dropped the Ω. Prose verbatim from the text layer of the author's chapter file; formulas transcribed.

### Cofinality: a finitely generated projective has a complement making the sum free

`GeneralAlgebraicKTheory:K.2:plus/cofinality-of-projective-modules` · lemma · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

Every finitely generated projective module over a ring is a direct summand of a finite free module, so it has a complement whose sum with it is free, and that complement is again finitely generated projective. Consequently the monoidal inclusion of the finite free modules into the groupoid of finitely generated projectives is cofinal, and the group-completion cofinality theorem (Weibel, Cofinality Theorem IV.4.11, owned by StableHomotopyKTheory H.4) gives, through the plus-equals-Q theorem, that the K-groups of the split exact category of finite free modules and of the finitely generated projectives agree in every positive degree, while their zeroth groups need not. This is why the stable general linear group, which sees only free modules, detects the higher K-groups of a ring even when projectives are not free. Mathlib has the module-theoretic half; this node adds the K-theoretic consequence without using the late exact-category cofinality theorem of K.3, which comes after K.4.

**Hypotheses.**

- The ring has a unit; the module is finitely generated and projective.
- The complement is the kernel of the surjection from the finite free module, which is finitely generated and projective because the surjection splits.
- The finite free modules form a full subcategory of the finitely generated projectives closed under extensions (an extension of free modules splits), so it is a split exact category, and its automorphism groups are those computed in the projectives; these are the hypotheses of Cofinality Theorem IV.4.11(b).
- The K-theoretic conclusion is only for the groups in positive degrees; in degree zero the free category has a proper subgroup in general.

**Proof outline.**

1. Record Mathlib's statement: a finitely generated projective module is a retract of a finite free module, with the two maps composing to the identity.
2. Deduce that the kernel of the retraction is the image of the complementary idempotent, hence finitely generated and projective, and that the sum of the module with it is free.
3. Conclude that the inclusion of the groupoid of finite free modules into the groupoid of finitely generated projectives is a cofinal monoidal functor with the same automorphism groups.
4. Apply the group-completion cofinality theorem (H.4) to identify the basepoint components of the two group completions, and transport through the plus-equals-Q theorem for the two split exact categories to get the agreement of the positive K-groups.
5. Record the non-example: the zeroth groups genuinely differ for a ring with a non-free projective, so the agreement may not be extended to degree zero. The general exact-category cofinality theorem, K.3/cofinality-degree-zero-correction, recovers the same statement after K.4 and is not needed here.

**Acceptance.**

- Every finitely generated projective has a complement making the sum free.
- The higher K-groups of the free and of the projective categories agree; the zeroth ones need not.
- For a ring with a non-free finitely generated projective the zeroth groups differ, so the statement has content.
- The proof uses only group completion and the plus comparison, not Waldhausen K-theory.

**Prerequisites.** `mathlib:Module.Finite.exists_comp_eq_id_of_projective`, `mathlib:LinearMap.ker_eq_range_of_comp_eq_id`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `StableHomotopyKTheory:H.4`

**Sources.**

- `Weibel.KBook.IV`: Cofinality Theorem 4.11 with its proof, and the paragraph before Corollary 4.11.1, pp. IV.44–45. The cofinality this node proves and the group-completion theorem it applies, verbatim; Corollary 4.11.1 is the resulting product description.

### The explicit models in degrees one, two and three

`GeneralAlgebraicKTheory:K.2:low-degree-comparisons/explicit-low-degree-models` · comparison · parent `GeneralAlgebraicKTheory:K.2:low-degree-comparisons` · implementation unchecked

Combining the plus-equals-Q theorem with the low-degree roadmaps identifies the first three K-groups of a ring with their classical models: the first is the quotient of the stable general linear group by its elementary subgroup, the second is the second homology of that elementary subgroup, equivalently the kernel of the Steinberg group over it, and the third is described by Suslin's sequence relating it to the Bloch group. None of the three is proved here: each is owned by another roadmap, and this node is the register that records which, states the combination, and fixes what the combination does and does not assert. The identifications are unconditional for the class of rings the owning statements are proved for; they are not field-specific.

**Hypotheses.**

- The ring has a unit; the stable general linear group and its elementary subgroup are the colimits of the finite ones.
- The identification in degree one is the statement of KTheoryLowDegrees, in degree two that of K2SymbolsBrauer and in degree three that of K3BlochGroups; this node only combines them with the plus comparison.
- Neither pinned library has the stable elementary subgroup, the stable general linear group, the Steinberg group, the Bloch group or any of the three K-groups, which is what makes this a register rather than a construction.

**Proof outline.**

1. Record the plus comparison of the previous layer as the bridge: the homotopy groups of the plus construction are the K-groups of the ring.
2. Record the degree-one identification with its owner, and state the compatibility with determinant and transfer that the owner proves.
3. Record the degree-two identification with its owner, and that it is the one compatible with the symbol description.
4. Record the degree-three identification with its owner, and that it goes through Suslin's exact sequence rather than being an isomorphism onto the Bloch group.
5. State the combination as a single statement and record that it is what the low-degree comparisons of the atlas consume.
6. Record what is absent from the pinned libraries, so that a reader does not look for these groups there.

**Acceptance.**

- The three identifications hold for the ring classes their owners state them for, and are not restricted to fields.
- The degree-three statement is an exact sequence, not an isomorphism with the Bloch group.
- None of the three is proved in this roadmap; each is imported by name.

**Prerequisites.** `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `KTheoryLowDegrees:U.6`, `K2SymbolsBrauer:T.1:plus`, `K3BlochGroups:V.4`

**Sources.**

- `Weibel.KBook.IV`: Corollary 7.2 and Definition 6.3.2, pp. IV.55 and IV.62. The bridge this register rests on, verbatim; the low-degree identifications themselves are the other roadmaps’ statements and are not quoted from this source.

### Matsumoto's presentation is field-specific, and the other identifications are not

`GeneralAlgebraicKTheory:K.2:low-degree-comparisons/matsumoto-is-field-specific` · comparison · parent `GeneralAlgebraicKTheory:K.2:low-degree-comparisons` · implementation unchecked

The identifications of the first three K-groups with their classical models hold for the stated class of rings. Matsumoto's presentation of the second K-group by symbols subject to the Steinberg relation is a different kind of statement: it is a theorem about FIELDS and does not extend to general rings. This node states the distinction, names the owner of each half, and records the error it exists to prevent, namely quoting the symbol presentation as though it were part of the general low-degree comparison.

**Hypotheses.**

- Matsumoto's theorem is for a field; the second K-group of a general commutative ring is not presented by symbols in this way.
- The general identification of the second K-group with the second homology of the stable elementary subgroup is unconditional for rings with a unit and is a different statement.
- Neither statement exists in the pinned libraries, which have no symbol presentation of any K-group.

**Proof outline.**

1. State the general identification and its owner.
2. State Matsumoto's presentation and its owner, with the field hypothesis explicit.
3. Record that the first is used unconditionally in the atlas and the second only over a field.
4. Record the non-example: for a general commutative ring the symbol map from the tensor square of the units need be neither injective nor surjective onto the second K-group, so the presentation fails.
5. Record that the Dennis-Stein symbols, which do present the second K-group of a suitable local ring, are the other roadmap's answer to the general case.

**Acceptance.**

- The general low-degree identifications are unconditional for their stated ring class.
- Matsumoto's presentation is a theorem about fields and is quoted as such wherever it is used.
- The symbol map for a general commutative ring is not an isomorphism onto the second K-group.

**Prerequisites.** `GeneralAlgebraicKTheory:K.2:low-degree-comparisons/explicit-low-degree-models`, `K2SymbolsBrauer:T.2:symbols`

**Sources.**

- `Weibel.KBook.IV`: §7, the opening and Corollary 7.2, pp. IV.61 to IV.62. The unconditional half, verbatim. Matsumoto’s theorem is in chapter III of the same book, which was not read for this job; it is imported from K2SymbolsBrauer and the packet does not quote it.

### The early ring model: functorial connective K-theory of unital rings

`GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring` · construction · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

For every unital, possibly noncommutative ring R : Type u, let P(R) be the pinned full subcategory (TauCeti.finiteProjectiveModules R).FullSubcategory with the pinned exact structure finiteProjectiveModulesExactStructure R, which is the split one (finiteProjectiveModulesExactStructure_eq_split), and the pinned EssentiallySmall.{u} instance. Set K(R) := KSpace(P(R)) = ΩBQ(P(R)) on the K.1 small model and K_n(R) := KGroup(P(R), n), in universe u. A unital ring map f : R → S induces K(f) := K(f_!) through the exact scalar-extension functor of K.2:plus/scalar-extension-and-functoriality, with K(id) ≃ id and K(g ∘ f) ≃ K(g) ∘ K(f) through its unit and composition isomorphisms. The model has four further properties, each the ring form of a generic K.1 statement: (i) π₀ K(R) ≅ RingK0 R ≅ ExactK0(P(R)), sending [P] to the class of P, naturally in R; (ii) the projections induce K_n(R × S) ≅ K_n(R) × K_n(S) for every n ≥ 0; (iii) for a small filtered diagram of unital rings with colimit R, colim K_n(R_i) ≅ K_n(R), computed on the equivalent categories of idempotent matrices, which are strictly functorial; (iv) Hom_R(−, R) is an exact equivalence P(R)^op ≃ P(R^op), so K_n(R^op) ≅ K_n(R). This one node owns the ring model: it depends neither on the plus comparison nor on the nonconnective theory, K.5 imports it, and the late K.6 and K.7 import it rather than rebuilding it.

**Hypotheses.**

- Unital associative rings and unital maps in one universe u; no commutativity, noetherian, flatness or invariant-basis-number hypothesis. The noncommutative scalar extension is KTheoryLowDegrees:Z.1/extend-scalars and is not in the pinned libraries.
- Universe and smallness: P(R) is essentially u-small by the pinned instance, K(R) is formed on its K.1 small model, and K(R), K_n(R) and ExactK0(P(R)) live in universe u; the choice of model is irrelevant by K.1/small-models-and-transport.
- Filtered diagrams are small; finite idempotent matrices, the matrices between them and the finitely many equations among these descend to a stage. The transition maps of the diagram need not be injective; the source's instance is a filtered union of subrings.
- Duality: for P in P(R), Hom_R(P, R) is a finitely generated projective right R-module, that is a left R^op-module, and P → Hom_{R^op}(Hom_R(P, R), R) is an isomorphism; the functor is contravariant.

**Proof outline.**

1. Import the pinned exact category P(R) with its essentially small instance and apply K.1 to its small model. Construct K(f) from the exact functor f_! of K.2:plus through K.1's functoriality, and obtain K(id) ≃ id and K(g ∘ f) ≃ K(g) ∘ K(f) from the natural isomorphisms of f_!, since isomorphic exact functors induce homotopic maps (K.1).
2. Degree zero: K.1/pi1-BQ-equals-K0 gives π₀ K(R) ≅ ExactK0(P(R)), and KTheoryLowDegrees:Z.1/ring-k0-exact gives RingK0 R ≃ ExactK0(P(R)); both send [P] to the class of P, and naturality in f holds because RingK0.map f (Z.1/ring-k0-map) and the map of f_! agree on classes (ExactK0.hom_ext).
3. Products: the central idempotents (1, 0) and (0, 1) of R × S split each finitely generated projective module as the sum of its two parts; scalar extension along the two projections is an exact equivalence P(R × S) ≃ P(R) × P(S), and K.1/elementary-properties-of-K-groups for direct sums gives the product formula in every degree.
4. Filtered colimits: replace P(R) by the equivalent idempotent-matrix category, the idempotent completion of the finite free modules (KTheoryLowDegrees:Z.1/projective-karoubi), which is strictly functorial in ring maps by applying them to matrix entries and is compatible with f_! because the scalar extension of the idempotent module P(e) is P(f(e)) (KTheoryLowDegrees:Z.1/extend-scalars-finite-projective (c)); objects, morphisms and equations descend to a stage, so it commutes with filtered colimits of rings as an exact category, and K.1's filtered-colimit statement with the small-model independence gives colim K_n(R_i) ≅ K_n(R).
5. Opposite ring: Hom_R(−, R) is additive, sends R to R^op and hence finite free modules to finite free modules and summands to summands, and the evaluation map to the double dual is an isomorphism (checked on R and extended to summands), so it is an equivalence P(R)^op ≃ P(R^op), exact for the split structures. K.1's statement for opposite categories then gives K_n(R^op) ≅ K_n(R).
6. Leave the naturality of the plus comparison to its own node, and record that K.5's relative ring theory uses this K(R) and the actual map K(f).

**Acceptance.**

- The two projections R × S → R, S give the product isomorphism in degree zero and every higher degree.
- Identity and two composable ring maps give the same K-map as the corresponding tensor unit and associativity isomorphisms.
- In degree zero the model is RingK0 R, with K₀(f) = RingK0.map f.
- An idempotent matrix over a filtered colimit, and an equality between two maps, descend at a sufficiently large stage.
- The isomorphism K_n(R^op) ≅ K_n(R) is induced by the contravariant duality, not by an identification of the two categories.

**Prerequisites.** `GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`, `GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0`, `GeneralAlgebraicKTheory:K.1/small-models-and-transport`, `KTheoryLowDegrees:Z.1/projective-karoubi`, `KTheoryLowDegrees:Z.1/extend-scalars-finite-projective`, `KTheoryLowDegrees:Z.1/ring-k0-exact`, `KTheoryLowDegrees:Z.1/ring-k0-map`, `tauceti:TauCeti.finiteProjectiveModules`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split`, `tauceti:TauCeti.ExactK0.hom_ext`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `KSpace.ofRing` | data | The K-theory space K(R) = ΩBQ(P(R)) of a unital ring, in the ring's universe. |
| `KSpace.ofRing_map` | functoriality | The map K(f) induced by a unital ring homomorphism through projBaseChange. |
| `KSpace.ofRing_map_id` | functoriality | The identity ring homomorphism induces the identity, with the small-model comparison. |
| `KSpace.ofRing_map_comp` | functoriality | Composition of unital ring maps induces composition of K-space maps up to the specified natural homotopy. |
| `KGroup.ofRing_zero_equiv` | compatibility | π₀ K(R) ≅ RingK0 R ≅ ExactK0(P(R)), natural in R, sending [P] to its class. |
| `KGroup.ofRing_prod` | compatibility | Compatibility with finite products of rings. |
| `KGroup.ofRing_colimit` | compatibility | Compatibility with filtered colimits of rings, through the idempotent-matrix model. |
| `KGroup.ofRing_op` | equivalence | K_n(R^op) ≅ K_n(R), induced by the exact duality P(R)^op ≃ P(R^op). |

**Consumers.**

- K.5 — Relative K-theory is the homotopy fibre of the map this functor induces, and the Milnor-square sequence identifies its K₀ end through the degree-zero comparison.
- K.6 and K.7 — The nonconnective extension, Morita invariance and the product and colimit statements for rings import this functor instead of redefining it.
- The consumer roadmaps — Every roadmap that speaks of the K-theory of a ring imports this functor.

**Unit tests.**

- `product_ring` (computation) — The two projections R × S → R,S give the product isomorphism in degree zero and every higher degree.
- `scalar_identity_composition` (compatibility) — Identity and two composable ring maps give the same K-map as the corresponding tensor unit/associativity isomorphisms.
- `nonflat_projectives` (non-example) — ℤ → ℤ/2 induces exact scalar extension on the split projective category although it is not flat on all modules.
- `filtered_idempotent_descent` (computation) — An idempotent matrix over a filtered colimit and an equality between two maps descend at a sufficiently large stage.
- `degree_zero_ring` (compatibility) — The degree-zero group of K(R) is RingK0 R, and K₀(f) is RingK0.map f; for R = ℤ it is ℤ generated by [ℤ].
- `duality_not_identity` (non-example) — For a commutative ring the isomorphism K₀(R^op) ≅ K₀(R) induced by duality, composed with R^op = R, sends [P] to [Hom_R(P, R)]; for a Dedekind domain it inverts the ideal class of an invertible ideal, so it is not the identity when the class group has an element of order greater than two.

**Sources.**

- `Weibel.KBook.IV`: Definition 6.3.2 and Elementary properties 6.4, pp. IV.55 to IV.56. The functor and the two compatibilities, verbatim.
- `Weibel.KBook.IV`: Elementary Properties 6.4, the ring instances, pp. IV.55–56. The opposite-ring statement and the idempotent-matrix model, verbatim (formulas transcribed from the text layer); the source states the colimit for a filtered union of subrings, and the node proves it for filtered colimits by the same descent.

### What the product description does not say

`GeneralAlgebraicKTheory:K.2/no-natural-product-splitting` · comparison · parent `GeneralAlgebraicKTheory:K.2` · implementation unchecked

The loop space of the realisation of Q of the finitely generated projectives over a ring is homotopy equivalent to the product of the discrete zeroth K-group with the plus construction on the classifying space of the stable general linear group. The equivalence is of spaces and depends on a choice of representative in each component. It is not an equivalence of infinite-loop spaces splitting the K-theory spectrum as a product, and the translations used to move between components are not natural in the ring. This node records the distinction as a non-example, because the product formula is exactly the kind of statement that is easy to over-read, and because the stage text names it.

**Hypotheses.**

- The ring is unital; the zeroth K-group is taken with its discrete topology.
- A choice of a finitely generated projective module in each class is made once and the equivalence depends on it.
- The infinite-loop structure on the left is that of the connective Ω-spectrum that StableHomotopyKTheory:H.5:S-delooping assembles from the K.4:construction deloopings, or that of the group completion (H.4); the statement is about that structure.

**Proof outline.**

1. State the product description with the choice made explicit.
2. State what is natural: the comparison commutes with ring maps and with block sum.
3. State the non-example: the splitting is not one of infinite-loop spaces, and no natural choice of component representatives exists in general.
4. Record the consequence for computations: a class in a non-zero component is compared with one in the zero component only after a translation, and the translation must be carried along in any argument.

**Acceptance.**

- The description is of spaces after a choice, not of infinite-loop spaces.
- The translations between components are not natural in the ring.
- Statements proved in the zero component do not transport to the other components for free.

**Prerequisites.** `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`

**Sources.**

- `Weibel.KBook.IV`: Corollary 7.2, p. IV.62. The product description, verbatim, with the Ω the previous excerpt had dropped. Prose verbatim from the text layer of the author's chapter file; formulas transcribed.

### The 3×3 lemma for exact categories

`GeneralAlgebraicKTheory:K.3/three-by-three-lemma` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For the pinned exact structure, consider a commutative 3×3 diagram whose three columns are conflations. If either (i) the middle row and one of the outer rows are conflations, or (ii) the two outer rows are conflations and the composite of the two maps of the middle row is zero, then the remaining row is a conflation.

**Hypotheses.**

- E is the pinned TauCeti.ExactStructure; no ambient abelian category, no weak idempotent completeness and no form of Quillen's axiom (c) is assumed.
- In case (ii) the vanishing of the middle composite is a hypothesis: it is what identifies the first map of the middle row as a kernel, and without it the middle row need not be a complex.

**Proof outline.**

1. Case (i) with the first two rows conflations (the other case is dual): push out the first row along A′ → A (E2) to factor the morphism of the first two rows through a conflation A ↣ D ↠ C′ with the same quotient (ExactStructure.conflation_cobaseChange; Bühler, Proposition 3.1); both squares of the factorisation are bicartesian (ExactStructure.bicartesianSq_of_isPushout_of_isInflation and its dual).
2. Identify the cokernels of B′ ↣ D and of D ↣ B through the maps induced out of the pushout, and prove the one commutativity not given by construction from the pushout property of the square on A′, B′, A and D.
3. Conclude with the Noether isomorphism for exact categories (ExactStructure.exists_conflation_comp; Bühler, Lemma 3.5) that the third row is a conflation.
4. Case (ii): push out under the second map of the first row and the middle column, obtain a map to the third term of the middle row and show, by the pullback characterisation (Bühler, Proposition 2.12), that it is a deflation and that the middle row's second map is one; then use the vanishing composite and the dual characterisation with the kernel of a composite deflation (ExactStructure.conflation_comp_of_isPullback; Bühler, Proposition 2.15) to show that the first map of the middle row is its kernel.

**Acceptance.**

- Both cases hold in every exact category, with no abelian embedding.
- In case (ii) the hypothesis that the middle composite vanishes cannot be dropped.
- For the canonical exact structure of an abelian category the statement is the classical nine lemma.

**Prerequisites.** `tauceti:TauCeti.ExactStructure`, `tauceti:TauCeti.ExactStructure.conflation_cobaseChange`, `tauceti:TauCeti.ExactStructure.conflation_baseChange`, `tauceti:TauCeti.ExactStructure.bicartesianSq_of_isPushout_of_isInflation`, `tauceti:TauCeti.ExactStructure.exists_conflation_comp`, `tauceti:TauCeti.ExactStructure.conflation_comp_of_isPullback`

**Sources.**

- `Buhler.ExactCategories`: Corollary 3.6 (3 × 3-Lemma) with its proof, pp. 13–14 (arXiv v2). The statement, verbatim; the proof steps follow Bühler's two cases.
- `Buhler.ExactCategories`: Proposition 3.1 and Lemma 3.5, pp. 12–13 (arXiv v2). The factorisation of case (i); Lemma 3.5 is the Noether isomorphism that Tau Ceti already has.

### The exact category of conflations

`GeneralAlgebraicKTheory:K.3/exact-category-of-conflations` · construction · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For an exact structure E on a preadditive category A with a zero object and binary biproducts, the pinned category of conflations (TauCeti.ExactStructure.ConflationCategory: the full subcategory of short complexes on the conflations, with all morphisms of short complexes) carries an exact structure whose conflations are the sequences σ′ → σ → σ″ of conflations whose sub-term, total-term and quotient-term components are E-conflations. With it, written E(A), the three projection functors s, t, q to A are exact, the coproduct functor ∐ : A × A → E(A), (X, Z) ↦ (X ↣ X ⊞ Z ↠ Z), is exact, s ↣ t ↠ q is a short exact sequence of exact functors, and it is universal: exact functors B → E(A) correspond to short exact sequences of exact functors B → A. This is the extension category of Weibel V.1.1.1 and II.9.3, on which the Additivity Theorem is proved; it is not the category EA of IV.7.3 that K.2:plus uses for the plus comparison.

**Hypotheses.**

- E is the pinned TauCeti.ExactStructure; the construction is intrinsic in E0–E2, with no ambient abelian category and no form of Quillen's axiom (c).
- A conflation of E(A) is a sequence σ′ → σ → σ″ of objects and morphisms of the pinned category of conflations whose three columns are E-conflations; its rows are conflations because they are objects of that category.
- For K-theory, A is essentially small; then so is E(A).

**Proof outline.**

1. Kernel–cokernel pairs: a morphism of conflations whose composite into σ″ vanishes factors uniquely through σ′ componentwise, because each column is a kernel–cokernel pair, and the components commute with the row maps because the column inflations are monomorphisms; dually for cokernels. Closure under isomorphism is componentwise.
2. E0 and E0op: the identity of a conflation is componentwise the identity, whose columns are conflations.
3. E1: a composite of two inflations of E(A) is componentwise a composite of inflations (E1), and its componentwise cokernels form a conflation by the 3×3 lemma (i) applied to the first two rows (K.3/three-by-three-lemma). E1op is dual.
4. E2: for an inflation σ′ ↣ σ with cokernel σ″ and any morphism σ′ → ρ take componentwise pushouts, which exist by E2 in A. Each new column is a conflation with the old cokernel (ExactStructure.conflation_cobaseChange), the two maps of the pushout row compose to zero by the pushout property, and the pushout row is a conflation by the 3×3 lemma (ii), its outer rows ρ and σ″ being conflations. The componentwise pushout is a pushout in E(A) because morphisms of conflations are determined componentwise. E2op is dual, with componentwise pullbacks (ExactStructure.conflation_baseChange).
5. Exactness of s, t and q is the definition of the conflations of E(A); ∐ is exact because a biproduct of conflations is a conflation (ExactStructure.conflation_biprod).
6. Universal property: an exact functor F : B → E(A) gives the short exact sequence s∘F ↣ t∘F ↠ q∘F of exact functors, and a short exact sequence F′ ↣ F ↠ F″ gives B ↦ (F′B ↣ FB ↠ F″B), exact because the conflations of E(A) are componentwise (Weibel, Definition V.1.1(a)).
7. Essential smallness: a conflation is determined up to isomorphism by three objects of a small skeleton of A and two morphisms between them.

**Acceptance.**

- The conflations of E(A) are exactly the componentwise ones.
- (s, q) ∘ ∐ is the identity of A × A and t ∘ ∐ is the biproduct functor.
- ExactK0 of E(A) is ExactK0 A × ExactK0 A through (s, q), with inverse induced by ∐: the degree-zero shadow of the Extension Theorem (Weibel, Proposition II.9.3.1).
- For the canonical structure of an abelian category, E(A) is not abelian (Bühler, Remark 3.10), so no abelian-category argument may be applied to it.

**Prerequisites.** `tauceti:TauCeti.ExactStructure`, `tauceti:TauCeti.ExactStructure.ConflationCategory`, `tauceti:TauCeti.ExactStructure.conflation_cobaseChange`, `tauceti:TauCeti.ExactStructure.conflation_baseChange`, `tauceti:TauCeti.ExactStructure.conflation_biprod`, `GeneralAlgebraicKTheory:K.3/three-by-three-lemma`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `ConflationCategory.exactStructure` | structure | The exact structure on E.ConflationCategory whose conflations are the componentwise ones. |
| `ConflationCategory.conflation_iff` | characterisation | A sequence of conflations is a conflation of E(A) exactly when its three columns are E-conflations. |
| `ConflationCategory.isConflationExact_sub` | functoriality | The sub-term functor s : E(A) → A is exact. |
| `ConflationCategory.isConflationExact_total` | functoriality | The total-term functor t : E(A) → A is exact. |
| `ConflationCategory.isConflationExact_quot` | functoriality | The quotient-term functor q : E(A) → A is exact. |
| `ConflationCategory.coprod` | constructor | The exact functor ∐ : A × A → E(A), (X, Z) ↦ (X ↣ X ⊞ Z ↠ Z). |
| `ConflationCategory.sub_quot_coprod` | simp | (s, q) ∘ ∐ = id and t ∘ ∐ ≅ ⊞. |
| `ConflationCategory.exactFunctorEquiv` | universal-property | Exact functors B → E(A) correspond to short exact sequences of exact functors B → A. |
| `ConflationCategory.essentiallySmall` | instance | E(A) is essentially small when A is. |

**Consumers.**

- K.3/additivity-for-exact-categories (Weibel V.1.1.1 and the proof of V.1.2) — Additivity is proved in this universal case: t is homotopic to s ∐ q on K(E(A)), by the Extension Theorem V.1.3 for this category.
- Weibel V.1.4 and Exercises V.1.5–1.6 — The categories of admissibly exact sequences of length n are iterated extension categories of this kind.
- Weibel II.9.3 and IV.8.3 — For an exact category regarded as a Waldhausen category, the second term of the S-construction is this category with the cofibrations of II.9.3.

**Unit tests.**

- `componentwise_conflations` (characterisation) — A sequence of conflations is a conflation of E(A) if and only if its three columns are E-conflations; a sequence that is a kernel–cokernel pair of short complexes but has a column that is not an E-conflation is not one.
- `coprod_section` (computation) — (s, q) ∘ ∐ is the identity of A × A, and t ∘ ∐ is naturally isomorphic to the biproduct functor.
- `k0_of_extension_category` (compatibility) — (s, q) induces ExactK0 (E(A)) ≃ ExactK0 A × ExactK0 A, with inverse induced by ∐ (Weibel, Proposition II.9.3.1).
- `not_abelian` (non-example) — For the category of abelian groups with its canonical exact structure, E(Ab) is not an abelian category (Bühler, Remark 3.10), so its exact structure is not the canonical structure of an abelian category.

**Sources.**

- `Weibel.KBook.V`: Universal Example 1.1.1, p. V.1. The object and the claim that it is exact, which the source does not prove.
- `Buhler.ExactCategories`: Exercise 3.9 (Heller) and Remark 3.10, p. 16 (arXiv v2). The componentwise exact structure, stated as an exercise; the proof steps are this packet's, from Bühler's Corollary 3.6 and Proposition 2.12.
- `Weibel.KBook.II`: Extension Categories 9.3 and Proposition 9.3.1, pp. II.92–93. The three functors and the degree-zero test.

### The Additivity theorem

`GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories` · theorem · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

Let E(A) be the exact category of conflations of an exact category A (K.3/exact-category-of-conflations), with the exact functors s, t and q taking the sub, total and quotient terms. The functor (s, q) from Q(E(A)) to the product of two copies of Q(A) is a homotopy equivalence (the Extension Theorem); equivalently, for a short exact sequence of exact functors the middle one induces the sum of the maps induced by the outer two, as maps of H-spaces and hence on all K-groups. Two corollaries follow at once: for an admissible filtration of an exact functor with exact quotients the induced map is the sum of the maps of the quotients, and for a bounded admissibly exact sequence of exact functors the alternating sum of the induced maps is zero. This node is the exact-category theorem, proved by Quillen's Theorem A; the Waldhausen form is K.4/waldhausen-additivity, proved separately in K.4:construction.

**Hypotheses.**

- The functors are exact and the sequences of functors are pointwise conflations; A is essentially small, and so is E(A).
- For the filtration corollary the successive quotient functors must themselves be exact.
- The equivalence is of H-spaces, so the conclusion is an equality of maps of K-groups and not merely of their effect on classes.

**Proof outline.**

1. Reduce to the universal case: a short exact sequence of exact functors from B to A is an exact functor from B to E(A), so it suffices to show that t is homotopic to s ∐ q on K(E(A)); since t and s ∐ q agree after composing with the coproduct functor ∐, this follows once (s, q) is a homotopy equivalence with homotopy inverse ∐.
2. Prove that (s, q) induces a homotopy equivalence of Q-categories by Quillen's Theorem A (StableHomotopyKTheory:H.2/quillen-theorem-a): for objects A and C the comma category T of triples (u, E, v), with E an extension A₀ ↣ B₀ ↠ C₀ and u : A₀ → A, v : C₀ → C morphisms of Q(A), is contractible.
3. Contract T: pushing E out along the admissible-monomorphism part of u (ExactStructure.conflation_cobaseChange, the source's II Exercise 7.8(2)) is a functor p to the subcategory where u is an admissible epimorphism, left adjoint to its inclusion; pulling back along the admissible-epimorphism part of v (ExactStructure.conflation_baseChange) is a functor q to the subcategory where v is an admissible monomorphism, right adjoint to its inclusion (Weibel, Exercise V.1.1). Natural transformations give homotopies (StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility), and the intersection of the two subcategories has an initial object, so T is contractible.
4. Deduce the filtration corollary by induction on the length of the filtration.
5. Deduce the alternating-sum corollary by induction on the length of the sequence.
6. Record that the source states the exact and Waldhausen forms together; the Waldhausen form, with its simplicial proof, is K.4/waldhausen-additivity and is not deduced from this node.

**Acceptance.**

- For the split sequence of functors the theorem gives that the total functor induces the sum, which is the sanity check.
- The alternating sum of a bounded exact sequence of exact functors vanishes.
- A flasque category, one with an endofunctor carrying an object to the sum of itself with that endofunctor's value, has contractible K-theory by additivity; this is the Eilenberg swindle in this layer.
- The hypothesis that the quotient functors are exact cannot be dropped in the filtration corollary.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.3/exact-category-of-conflations`, `StableHomotopyKTheory:H.2/quillen-theorem-a`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`, `tauceti:TauCeti.ExactStructure.conflation_cobaseChange`, `tauceti:TauCeti.ExactStructure.conflation_baseChange`

**Sources.**

- `Weibel.KBook.V`: Additivity Theorem 1.2 with its proof, p. V.2. The theorem and the first line of its proof, verbatim, in the form that covers exact and Waldhausen categories at once.
- `Weibel.KBook.V`: Extension Theorem 1.3 and its proof for exact categories, pp. V.2–4. The theorem and the Theorem A argument the proof steps follow.
- `Weibel.KBook.V`: Corollary 1.2.1 and Proposition 1.8, pp. V.2 and V.9. The two corollaries with their proofs, verbatim.

### The Resolution theorem

`GeneralAlgebraicKTheory:K.3/resolution-theorem` · theorem · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

Let P be a full exact subcategory of an exact category H, closed under extensions and under kernels of admissible surjections in H, and suppose every object of H has a finite resolution by objects of P. Then the inclusion induces a homotopy equivalence of K-theory spaces and isomorphisms of all K-groups. The proof reduces to resolutions of length one by filtering H by the subcategories of objects with resolutions of bounded length, and the length-one case is handled by a comma-category argument. The standing instances are the finitely generated projectives inside the modules of finite projective dimension, and, for a regular noetherian ring, the finitely generated projectives inside all finitely generated modules, which gives the agreement of K-theory and G-theory.

**Hypotheses.**

- P is full in H, closed under extensions and under kernels of admissible surjections in H; finite resolutions exist for every object of H.
- For the ring instance, use the finite-projective-resolution hypotheses of the adopted regular noetherian theorem. The vector-bundle scheme comparison needs the global-resolution hypotheses of V.3.4; separatedness is part of that stated sufficient scope. The failure example is the doubled-origin affine plane, not the line.
- The closure under kernels of admissible surjections is essential and is what makes the filtration argument work.

**Proof outline.**

1. Filter H by the full subcategories of objects admitting a resolution of length at most n, and prove that each successive inclusion satisfies the hypotheses in the length-one form.
2. Prove the length-one case by factoring the inclusion of Q-categories through the full subcategory on the objects of P and applying Quillen's Theorem A (StableHomotopyKTheory:H.2/quillen-theorem-a) twice, once with a contraction by natural transformations and once dually, the dual step using a right adjoint (StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility).
3. Assemble the general case from the filtration and the fact that K-theory commutes with the filtered union of the subcategories (K.1/elementary-properties-of-K-groups).
4. Record the instances: the finitely generated projectives inside the modules of finite projective dimension; for a regular noetherian ring the agreement of K and G; for a regular noetherian separated scheme the corresponding agreement.
5. Record the degree-zero comparison with the pinned Tau Ceti resolution theorem, which is proved only under the stronger hypothesis that every resolving object is projective for the exact structure, and say that the general statement here is what is missing.

**Acceptance.**

- For a regular noetherian ring the K-groups and the G-groups agree in every degree.
- The pinned Tau Ceti resolution isomorphism in degree zero is the special case in which every resolving object is projective; the general statement is not pinned.
- For X obtained by gluing two affine planes along the punctured plane, K₀(VB(X)) ≅ ℤ while G₀(X) ≅ K₀(Perf(X)) ≅ ℤ² (II.8.2.4 and II.Ex.9.10(d)). This tests the distinction between vector-bundle and perfect-complex models.
- For the doubled-origin affine line, gluing t^m produces Pic(X) ≅ ℤ, so rank and determinant forbid the assertion K₀(VB(X)) ≅ ℤ. Do not reuse V.3.4.2’s author-copy misprint as an acceptance test.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`, `StableHomotopyKTheory:H.2/quillen-theorem-a`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`, `tauceti:TauCeti.ExactStructure.resolutionEquiv`, `tauceti:TauCeti.moduleResolutionEquiv`

**Sources.**

- `Weibel.KBook.V`: Resolution Theorem 3.1 with the opening of its proof, p. V.20. The theorem and the structure of its proof, verbatim.
- `Weibel.KBook.II`: Example 8.2.4, p. II.77; Exercise 9.10(d), p. II.100. The exercise and dimension n ≥ 2 in Example 8.2.4 identify the intended scheme; see the scoped sourceIssues entry.

Source discrepancy: `GeneralAlgebraicKTheory/E-double-origin`.

### Transfer maps and the projection formula

`GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

If a ring map makes the target a module admitting a finite resolution by finitely generated projectives over the source, then restriction of scalars gives an exact functor between the categories of modules of finite projective dimension, and through the resolution isomorphisms a transfer map of K-groups in the direction opposite to the ring map. Transfers compose when both maps satisfy the hypothesis. For commutative rings the projection formula holds: the transfer of the product of a pulled-back class with a class upstairs is the product of the class with the transfer. The hypothesis is finite projective dimension WITH finitely generated resolving modules; finite projective dimension alone is not the source's hypothesis.

**Hypotheses.**

- The target ring is, as a module over the source, of finite projective dimension with finitely generated resolving projectives.
- For the projection formula the rings are commutative, and the source states it for a class in the zeroth K-group of the base.
- Composition of transfers requires the same hypothesis for the second map.

**Proof outline.**

1. Construct the restriction-of-scalars functor between the categories of modules of finite projective dimension and check that it is exact.
2. Compose with the two resolution isomorphisms of the previous node to obtain the transfer.
3. Prove functoriality of the transfer under composition, using the resolution isomorphisms again.
4. Prove the projection formula from the natural isomorphism of exact functors expressing the tensor product over the target of a pulled-back module with a module upstairs.
5. Record the module form of the same statement, which makes the K-groups upstairs a module over those downstairs.
6. Record the source's worked example in which a transfer vanishes, obtained from additivity applied to multiplication by the variable on a polynomial ring, so that the formalisation has a non-trivial test.

**Acceptance.**

- Transfers compose when both ring maps satisfy the hypothesis.
- The projection formula holds for commutative rings.
- The transfer along the evaluation of a polynomial ring at zero is the zero map, by additivity; this is the source's own test.
- Finite projective dimension without finite generation is not enough.

**Prerequisites.** `GeneralAlgebraicKTheory:K.3/resolution-theorem`, `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`

**Sources.**

- `Weibel.KBook.V`: §3.5 and Example 3.5.3, pp. V.22 to V.23. The construction of the transfer and its functoriality, verbatim.
- `Weibel.KBook.V`: Corollary 3.7.3, the proof of the projection formula, p. V.25. The proof of the projection formula, verbatim.

### The Devissage theorem

`GeneralAlgebraicKTheory:K.3/devissage-theorem` · theorem · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

Let an exact abelian subcategory of an abelian category be closed under subobjects and quotients, and suppose every object of the ambient category has a finite filtration whose successive quotients lie in the subcategory. Then the inclusion induces a homotopy equivalence of K-theory spaces and isomorphisms of all K-groups. The proof is again by the comma-category criterion, the comma category being equivalent to the ordered set of layers with quotient in the subcategory, contracted by two explicit intersections. The standing instances are the identification of the G-theory of a ring modulo a nilpotent ideal with that of the quotient, and the G-theory of the torsion modules for an element as a colimit.

**Hypotheses.**

- The subcategory is abelian, exact in the ambient category, and closed under subobjects and quotients; both categories have a set of isomorphism classes.
- Every object of the ambient category has a finite filtration with successive quotients in the subcategory.
- The successive-quotient functors attached to the filtration are NOT assumed exact, which is exactly why additivity for filtrations does not prove this theorem; the source gives an example.

**Proof outline.**

1. Apply Quillen's Theorem A (StableHomotopyKTheory:H.2/quillen-theorem-a): it suffices that the comma category of the inclusion over each object is contractible.
2. Identify the comma category with the ordered set of layers whose quotient lies in the subcategory.
3. Reduce, using the finite filtration, to the case of an object whose quotient by a subobject lies in the subcategory.
4. Define the two maps on layers, intersecting both terms with the subobject and intersecting only the lower term, which are well defined because the subcategory is closed under subobjects and finite products, and use the natural transformations between them to contract. The contraction is by natural transformations (StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility).
5. Record the finite-length corollary: for an ambient category in which every object has finite length the K-groups are the direct sum over the simple objects of the K-groups of their endomorphism division rings.
6. Record the two standing instances and the source's statement that the Waldhausen analogue is an open problem.

**Acceptance.**

- For a nilpotent ideal in a noetherian ring the G-groups of the ring and of the quotient agree.
- The G-groups of the modules of finite length over a ring are the sum over the simple modules of the K-groups of the corresponding division rings.
- Additivity for filtrations does not prove this theorem, because the successive-quotient functors need not be exact.
- The source records that the analogue for Waldhausen categories is an open problem, so no such statement may be asserted.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `StableHomotopyKTheory:H.2/quillen-theorem-a`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`, `tauceti:TauCeti.simpleClassBasis`

**Sources.**

- `Weibel.KBook.V`: Devissage Theorem 4.1 with the opening of its proof, p. V.33. The theorem and the criterion its proof uses, verbatim.
- `Weibel.KBook.V`: Open Problem 4.1.1, p. V.33. The open problem, verbatim; it is why no Waldhausen form of this node exists in K.4.

### Quillen's localisation theorem for a Serre subcategory

`GeneralAlgebraicKTheory:K.3/abelian-localization-theorem` · theorem · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For a Serre subcategory of a small abelian category, the sequence of K-theory spaces of the subcategory, of the category and of the quotient is a homotopy fibration, so there is a long exact sequence of K-groups ending in the right-exact sequence of Grothendieck groups. It is natural for exact functors of pairs. The theorem is asserted for ABELIAN categories: the stage text's warning is that it may not be asserted for an arbitrary exact subcategory of an exact category without the extra hypotheses the chosen exact-category localisation theorem requires, and this packet keeps localisation for exact and Waldhausen categories in K.4, where those hypotheses are stated.

**Hypotheses.**

- The ambient category is small abelian and the subcategory is Serre, that is closed under subobjects, quotients and extensions.
- The quotient is the abelian quotient category, whose construction Mathlib supports through Serre classes and the localisation of a category.
- The theorem is not asserted for exact categories that are not abelian; the corresponding statements are the Waldhausen localisation theorem of K.4 and the nonconnective localisation of K.6.

**Proof outline.**

1. Observe that the composite of the two functors is constant at the zero object, so the map factors through the comma category over the zero object.
2. Apply the fibration criterion, Quillen's Theorem B (StableHomotopyKTheory:H.2/quillen-theorem-b): it suffices that the base changes along morphisms of the quotient are homotopy equivalences and that the K-theory of the subcategory maps by a homotopy equivalence to the comma category over the zero object.
3. Reduce the first condition to the morphisms out of the zero object, using the factorisation of morphisms and the symmetry between a category and its opposite.
4. Prove the reduction in five steps, the source's Claims: the comma category is equivalent to the category of pairs whose structure map is an isomorphism; the kernel functor is a homotopy equivalence on the subcategory of epimorphic pairs; the inclusion of that subcategory is a homotopy equivalence; isomorphisms modulo the subcategory induce homotopy equivalences; and the whole is the filtered colimit of the pieces. The last claim uses that classifying spaces commute with filtered colimits (StableHomotopyKTheory:H.1/filtered-colimits-of-categories).
5. Read off the long exact sequence and its right-exact end in degree zero.
6. Record the boundary map in degree one and fix its sign convention here, since the later comparisons with tame symbols depend on it.
7. Record the Dedekind-domain corollary, whose proof also uses the resolution theorem and devissage.

**Acceptance.**

- The long exact sequence ends in the right-exact sequence of Grothendieck groups.
- The boundary from the first K-group of the quotient sends the class of an endomorphism invertible modulo the subcategory to the difference of the classes of its cokernel and kernel, with the sign fixed here.
- The statement is for abelian categories; it may not be quoted for an arbitrary exact subcategory.
- For a Dedekind domain the sequence relates the K-groups of the ring, of its fraction field and of its residue fields.

**Prerequisites.** `GeneralAlgebraicKTheory:K.3/devissage-theorem`, `GeneralAlgebraicKTheory:K.3/resolution-theorem`, `GeneralAlgebraicKTheory:K.1/Q-construction-universal-property`, `StableHomotopyKTheory:H.2/quillen-theorem-b`, `StableHomotopyKTheory:H.1/filtered-colimits-of-categories`, `mathlib:CategoryTheory.ObjectProperty.IsSerreClass`

**Sources.**

- `Weibel.KBook.V`: Abelian Localization Theorem 5.1 with (5.1.1), p. V.35. The theorem and the sequence, verbatim.
- `Weibel.KBook.V`: Exercise 5.1, pp. V.37–38. The boundary map in degree one, verbatim; the source states it as an exercise and this packet fixes the sign here.

### Cofinality, with the correction in degree zero

`GeneralAlgebraicKTheory:K.3/cofinality-degree-zero-correction` · theorem · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For an exact subcategory closed under extensions and cofinal in an exact category, the realisation of the smaller Q-category is the covering space of the larger corresponding to the subgroup of the Grothendieck group; hence the K-groups agree in every positive degree, while the zeroth group of the subcategory is only a subgroup of that of the category. There is a Waldhausen form with a surjection from the Grothendieck group, giving a homotopy fibration onto the discrete quotient and a short exact sequence in degree zero. The idempotent completion is the standard example where the zeroth group genuinely changes: an exact category is cofinal in its idempotent completion and the positive K-groups agree, so no statement of agreement in degree zero may be made.

**Hypotheses.**

- The subcategory is exact, closed under extensions and cofinal, meaning every object of the ambient category has a complement making the sum lie in the subcategory.
- The Waldhausen form requires a cylinder functor satisfying the cylinder axiom, which K.4 defines. The route of the general exact-category form through Waldhausen Cofinality IV.8.9 needs the subcategory to be saturated as well as cofinal (the author's correction, recorded as GeneralAlgebraicKTheory/E-cofinality-saturated); for an exact category the weak equivalences are the isomorphisms, which are saturated, so the exact-category statement is unaffected.
- The degree-zero group of the subcategory is a subgroup of the ambient one, and the inclusion is generally proper.
- The general proof needs the late K.4 fibration theorem and the comparison of the S- and Q-constructions, so this node belongs after K.4. It keeps its id and the parent K.3 because no stage K.3:cofinality exists yet, and records the proposed late parent in proposedParentStageId. The special case of Weibel's Exercise IV.6.6, the subcategory cut out by a surjection from K₀ to a group, needs only Theorems A and B. ExactK0.ofLE_surjective compares exact structures on one category and does not prove cofinal-subcategory K₀ injectivity.

**Proof outline.**

1. Prove the special case of Exercise IV.6.6 with Theorems A and B (StableHomotopyKTheory:H.2): for a surjection φ from K₀ of the ambient category onto a group G, the functor from Q of the ambient category to G sending a deflation to φ of the class of its kernel has homotopy fibre Q of the subcategory cut out by φ.
2. State the Waldhausen form (Weibel V.2.3) with a surjection from the Grothendieck group and the resulting fibration onto the discrete quotient, proved from the fibration theorem.
3. Deduce the general exact-category form from the Waldhausen form and Waldhausen Cofinality IV.8.9 for a saturated subcategory, transporting to Q-groups through K.4:construction/iS-versus-Q.
4. Read off the agreement of the positive K-groups and the short exact sequence in degree zero.
5. Record the idempotent completion example: the category is cofinal in its completion, the positive groups agree, and the zeroth group can change.
6. Record the free-versus-projective example, in which the free modules are cofinal in the finitely generated projectives but not strictly so; K.2:plus obtains its positive-degree agreement earlier from the group-completion cofinality theorem, so it does not depend on this late node.

**Acceptance.**

- The positive K-groups of a cofinal subcategory closed under extensions agree with those of the ambient category.
- The zeroth group need not agree, and the idempotent completion is the standard witness.
- A statement of agreement in degree zero for a merely cofinal subcategory is false and may not be recorded.

**Prerequisites.** `GeneralAlgebraicKTheory:K.4/fibration-theorem`, `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`, `GeneralAlgebraicKTheory:K.4:construction/iS-versus-Q`, `StableHomotopyKTheory:H.2/quillen-theorem-a`, `StableHomotopyKTheory:H.2/quillen-theorem-b`, `mathlib:CategoryTheory.Idempotents.Karoubi`

**Sources.**

- `Weibel.KBook.IV`: Cofinality 6.4.1, p. IV.56. The exact-category form, with the source’s own note that its general proof goes through the Waldhausen form, verbatim.
- `Weibel.KBook.V`: Cofinality Theorem 2.3, p. V.14. The Waldhausen form with the degree-zero correction, verbatim.
- `Weibel.KBook.IV`: Exercise 6.6 (Gersten), p. IV.60, and Waldhausen Cofinality 8.9, p. IV.72. The Theorem A and B special case, and the Waldhausen cofinality theorem through which the source proves the general case; the missing saturation hypothesis of 8.9 is recorded under sourceIssues.

Source discrepancy: `GeneralAlgebraicKTheory/E-cofinality-saturated`.

### Categories with cofibrations, Waldhausen categories and their extra axioms

`GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories` · definition · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

A CATEGORY WITH COFIBRATIONS is a category with a subcategory of cofibrations such that every isomorphism is a cofibration, there is a distinguished zero object whose map to every object is a cofibration, and pushouts along cofibrations exist with cofibrations stable under cobase change. A WALDHAUSEN CATEGORY adds a subcategory of weak equivalences containing the isomorphisms, closed under composition and satisfying the gluing axiom, that the pushout of a map of cofibration squares whose components are weak equivalences is a weak equivalence. Three further axioms are used only by later theorems and are stated separately: SATURATION, that in a composable pair whose composite is a weak equivalence one factor is a weak equivalence exactly when the other is; the EXTENSION axiom, that a map of cofibration sequences whose sub and quotient maps are weak equivalences has total map a weak equivalence; and the CYLINDER axiom for a cylinder functor. An exact category is a Waldhausen category with the admissible monomorphisms as cofibrations and the isomorphisms as weak equivalences.

**Hypotheses.**

- The categories are small, so that the weak-equivalence classes form a set and the Grothendieck group is defined.
- An exact functor preserves the zero object, cofibrations, weak equivalences and the pushouts along cofibrations.
- Saturation, extension and the cylinder axiom are NOT part of the definition; each theorem of K.4 names the ones it uses.

**Proof outline.**

1. State the three cofibration axioms and the gluing axiom, in the source's order.
2. Define exact functors and Waldhausen subcategories.
3. Define the Grothendieck group of a Waldhausen category by generators the weak-equivalence classes and relations from the cofibration sequences, which is the degree-zero invariant the whole layer refines.
4. State saturation, the extension axiom and the cylinder axiom separately, each with the theorem that uses it.
5. Record the two standing examples: an exact category with admissible monomorphisms and isomorphisms, whose cofibration sequences are the admissible exact sequences; and bounded complexes over an exact category with degreewise admissible monomorphisms and quasi-isomorphisms.
6. Record the warning the source attaches to the second example: the Grothendieck group of the unbounded complexes vanishes by the Eilenberg swindle, so boundedness is not decorative.
7. Record what the pinned libraries have: Mathlib's model categories have cofibrations, fibrations and weak equivalences but are not Waldhausen categories, and the gluing axiom is not isolated anywhere.

**Acceptance.**

- An exact category is a Waldhausen category, and its cofibration sequences are the admissible exact sequences.
- The Grothendieck group of a Waldhausen category specialises to that of an exact category in the first example.
- The Grothendieck group of the unbounded complexes over an exact category vanishes; the bounded ones give the group of the category.
- Saturation, extension and the cylinder axiom are separate hypotheses and no theorem here may assume them silently.

**Prerequisites.** `mathlib:CategoryTheory.Limits.HasPushouts`, `tauceti:TauCeti.ExactStructure`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `CategoryWithCofibrations` | structure | The three cofibration axioms. |
| `WaldhausenCategory` | structure | Cofibrations together with weak equivalences and the gluing axiom. |
| `WaldhausenCategory.IsSaturated` | data | The saturation axiom, as a separate hypothesis. |
| `WaldhausenCategory.HasExtensionAxiom` | data | The extension axiom, as a separate hypothesis. |
| `WaldhausenCategory.CylinderFunctor` | structure | A cylinder functor and its axiom. |
| `WaldhausenCategory.K0` | data | The Grothendieck group. |
| `WaldhausenCategory.ofExact` | example | An exact category as a Waldhausen category. |
| `WaldhausenCategory.exactFunctor` | data | Exact functors between Waldhausen categories. |

**Consumers.**

- K.4:construction, the S-construction — The construction consumes exactly this data.
- K.4, the fibration and approximation theorems — Each names which of the three extra axioms it uses.
- K.6 and K.7 — The nonconnective spectrum and the derived invariance statement are about the K-theory of a Waldhausen category.

**Unit tests.**

- `exact_is_waldhausen` (computation) — An exact category is a Waldhausen category with the stated structure.
- `K0_agrees` (compatibility) — Its Grothendieck group is that of the exact category.
- `unbounded_complexes_vanish` (non-example) — The Grothendieck group of the unbounded complexes vanishes, so a definition that forgot boundedness would be wrong.
- `axioms_separate` (non-example) — Saturation, extension and the cylinder axiom are independent extra hypotheses, not part of the definition.

**Sources.**

- `Weibel.KBook.II`: Definition 9.1 with (W0) to (W2), p. II.87. The cofibration axioms, verbatim.
- `Weibel.KBook.II`: Definition 9.1.1 and Definition 9.1.2, pp. II.87 to II.88. The definition and the degree-zero invariant, verbatim.
- `Weibel.KBook.IV`: Extension axiom 8.2.1, p. IV.67. The extension axiom, verbatim.

### Waldhausen's S-construction and the induced cofibrations

`GeneralAlgebraicKTheory:K.4:construction/S-construction` · construction · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

For a category with cofibrations, the n-th term of the S-construction is the category whose objects are sequences of n cofibrations together with a compatible choice of all subquotients, with morphisms the natural transformations of such diagrams; the zeroth term is trivial, the first is the category itself, and the second is the extension category, whose three face maps are the quotient, total and sub functors. The faces delete a row and a column and the degeneracies duplicate, and they are exact, so the terms form a simplicial category with cofibrations; taking the subcategories of weak equivalences gives a simplicial category whose realisation is the object of the next node. The cofibrations of the n-th term are NOT the objectwise ones: a map is a cofibration when for every triple of indices the induced map of cofibration sequences is a cofibration of the second term, which is a condition on the canonical maps out of the pushouts. The stage text's warning is exactly this, and this node states it as a hypothesis rather than a remark.

**Hypotheses.**

- The ambient category is a small category with cofibrations; for the weak-equivalence subcategories it is a Waldhausen category.
- The choices of subquotients are part of the data of an object and must be compatible with the displayed staircase diagram.
- The cofibrations of the n-th term are defined by the latching condition stated above; objectwise cofibrations do not in general satisfy the pushout conditions required.

**Proof outline.**

1. Define the objects of the n-th term with their compatible choices of subquotients.
2. Define the morphisms and the latching condition that makes a morphism a cofibration, and prove that the resulting structure is a category with cofibrations.
3. Define the faces and degeneracies by deleting and duplicating rows and columns and prove that they are exact and satisfy the simplicial identities.
4. Identify the second term with the extension category E(C) of Weibel II.9.3, the category of cofibration sequences with the cofibrations of II.9.3, and its three faces with the quotient, total and sub functors. For an exact category regarded as a Waldhausen category this is the pinned category of conflations, TauCeti.ExactStructure.ConflationCategory, not the category EA of IV.7.3 with its Q-type morphisms. It is the category Waldhausen additivity is about.
5. Define the subcategories of weak equivalences and check that they are preserved.
6. Record the warning as a non-example: a map that is objectwise a cofibration need not satisfy the latching condition, and a formalisation that defined the cofibrations objectwise would not have a category with cofibrations.

**Acceptance.**

- The zeroth term is trivial, the first is the category itself and the second is the extension category.
- The three faces from the second term to the first are the quotient, the total and the sub functors.
- The cofibrations of the n-th term are given by the latching condition; the objectwise definition is a non-example.
- For an exact category the second term is the pinned category of conflations with the cofibrations of II.9.3, not the category EA of K.2:plus.

**Prerequisites.** `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`, `tauceti:TauCeti.ExactStructure.ConflationCategory`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `SConstruction` | data | The n-th term of the S-construction. |
| `SConstruction.cofibration` | characterisation | The latching condition defining its cofibrations. |
| `SConstruction.face` | data | The face functors. |
| `SConstruction.degeneracy` | data | The degeneracy functors. |
| `SConstruction.simplicial` | compatibility | The simplicial identities. |
| `SConstruction.two_eq_ext` | relation | The second term is the extension category. |

**Consumers.**

- K.4:construction, the K-theory space — The space is built from the weak-equivalence subcategories of these terms.
- K.4:construction, additivity and the relative S-construction — Both are statements about this simplicial category and its relative version S.f.
- K.6 — The nonconnective spectrum applies this construction to a Frobenius pair.

**Unit tests.**

- `S2_is_extension` (computation) — The second term is the extension category of the ambient category.
- `faces_exact` (computation) — The faces and degeneracies are exact.
- `latching_not_objectwise` (non-example) — A map that is objectwise a cofibration need not be a cofibration of the n-th term.
- `S1_trivial` (degenerate) — The first term is the ambient category and the zeroth is trivial.

**Sources.**

- `Weibel.KBook.IV`: Definition 8.3 with (8.3.0), p. IV.67. The construction, verbatim.
- `Weibel.KBook.IV`: Definition 8.3.1, p. IV.67. The faces and degeneracies. Prose verbatim from the text layer of the author's chapter file; formulas transcribed.
- `Weibel.KBook.IV`: §8.3, the low terms, p. IV.67. The low terms: S0C = 0 and S1C = C. Prose verbatim from the text layer of the author's chapter file; formulas transcribed.

### The K-theory space of a Waldhausen category

`GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category` · definition · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

The K-theory space of a small Waldhausen category is the loop space of the realisation of the weak-equivalence S-construction, and its K-groups are the homotopy groups of that loop space, so the n-th K-group is the (n+1)-st homotopy group of the realisation. The fundamental group of the realisation is the Grothendieck group of the category, which fixes the indexing; the realisation is an H-space under coproduct. Applying the S-construction degreewise gives the iterated multisimplicial categories S.ⁿC; the equivalences between the realisations of consecutive ones are K.4/delooping-and-the-spectrum, and their assembly into the connective Ω-spectrum is StableHomotopyKTheory:H.5:S-delooping.

**Hypotheses.**

- The category is small and Waldhausen; no extra axiom is needed for the definition.
- The basepoint is the trivial object of the zeroth term, whose realisation is a point.
- The iterated construction S.ⁿC is formed here, as the stage text's 'iterate S'; the identification of consecutive realisations is K.4/delooping-and-the-spectrum, and the Ω-spectrum is assembled by StableHomotopyKTheory:H.5:S-delooping. Neither is claimed by this node, which precedes both.

**Proof outline.**

1. Define the bisimplicial object and its realisation, and define the K-theory space as its loop space.
2. Prove that the fundamental group of the realisation is the Grothendieck group, by the presentation of the fundamental group of a simplicial space whose zeroth term is a point.
3. Define the K-groups with the stated shift and prove that they are abelian.
4. Record the H-space structure induced by the coproduct.
5. Construct the iterated S-construction S.ⁿC degreewise, as multisimplicial Waldhausen categories with their weak-equivalence nerves; the equivalences |wS.ⁿC| ≃ Ω|wS.ⁿ⁺¹C| are proved in K.4/delooping-and-the-spectrum and the spectrum is assembled in H.5:S-delooping.
6. Record the canonical map from the realisation of the weak-equivalence subcategory to the K-theory space, and that it is not a homotopy equivalence in general.

**Acceptance.**

- The fundamental group of the realisation is the Grothendieck group, which is what fixes the indexing.
- For an exact category the groups agree with those of K.1, by the comparison of the next node.
- The canonical map from the weak-equivalence subcategory is a group completion, not an equivalence.

**Prerequisites.** `GeneralAlgebraicKTheory:K.4:construction/S-construction`, `mathlib:CategoryTheory.nerve`, `mathlib:SSet.toTop`, `mathlib:HomotopyGroup`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `WaldhausenCategory.KSpace` | data | The K-theory space. |
| `WaldhausenCategory.KGroup` | data | Its K-groups, with the stated shift. |
| `WaldhausenCategory.pi1_eq_K0` | characterisation | The fundamental group of the realisation is the Grothendieck group. |
| `WaldhausenCategory.KSpace_map` | functoriality | The map induced by an exact functor. |
| `WaldhausenCategory.hSpace` | structure | The H-space structure from the coproduct. |
| `WaldhausenCategory.iteratedS` | data | The multisimplicial Waldhausen categories S.ⁿC obtained by applying the S-construction degreewise n times, with their weak-equivalence nerves; the deloopings between them are K.4/delooping-and-the-spectrum's. |

**Consumers.**

- K.4, every theorem of the layer — Additivity, delooping, fibration and approximation are all statements about this space.
- K.5 — The relative theory is the homotopy fibre of a map of these spaces.
- K.6 — The nonconnective spectrum is built from this space applied to the iterated suspension of a Frobenius pair.

**Unit tests.**

- `pi1_is_K0` (computation) — The fundamental group of the realisation is the Grothendieck group.
- `exact_category_case` (compatibility) — For an exact category the groups agree with the Q-construction groups.
- `not_group_completion` (non-example) — The map from the weak-equivalence subcategory is not a homotopy equivalence in general.
- `trivial_category` (degenerate) — The K-theory space of the zero Waldhausen category is contractible.

**Sources.**

- `Weibel.KBook.IV`: Proposition 8.4 and Definition 8.5, p. IV.68. The degree-zero identification and the definition, verbatim.
- `Weibel.KBook.IV`: Infinite Loop Structure 8.5.5, p. IV.69. The iteration of the construction, verbatim; the delooping equivalences it invokes are K.4/delooping-and-the-spectrum's and the spectrum is H.5:S-delooping's.

### Comparison of the S-construction with the Q-construction

`GeneralAlgebraicKTheory:K.4:construction/iS-versus-Q` · comparison · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

For a small exact category regarded as a Waldhausen category with the isomorphisms as weak equivalences, the realisation of the isomorphism S-construction is homotopy equivalent to the realisation of the Q-construction, so the two definitions of the K-groups agree. The route is the equivalence of the object simplicial set with the isomorphism S-construction, then the subdivision of the first, which maps to the nerve of the Q-category and is degreewise an equivalence. This packet states the comparison and records that the source presents its two middle steps as exercises and attributes the underlying identification to Waldhausen, whose paper was not read for this job.

**Hypotheses.**

- A is a small exact category; the weak equivalences are the isomorphisms.
- The comparison is of spaces, and it is natural in exact functors.
- The two middle steps are exercises in the source, and the identification of the subdivision with the Q-construction is Waldhausen's; the gap records this.

**Proof outline.**

1. Record the equivalence between the object simplicial set and the isomorphism S-construction.
2. Record the subdivision and the functor to the nerve of the Q-category.
3. Record the degreewise identification and conclude the comparison.
4. Record the two consequences the source gives: the class of an automorphism in the second homotopy group corresponds on both sides, and the same route computes the K-theory of finite pointed sets.
5. Record precisely which steps are exercises in the source and which are attributed elsewhere, so that the state of the proof is visible.

**Acceptance.**

- For an exact category the Waldhausen and Quillen K-groups agree in every degree.
- The class of an automorphism corresponds under the comparison.
- The comparison is natural in exact functors.

**Prerequisites.** `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`

**Sources.**

- `Weibel.KBook.IV`: §8.6, p. IV.69. The comparison and its attribution. Prose verbatim from the text layer of the author's chapter file; formulas transcribed.
- `Weibel.KBook.IV`: Exercise 8.5(c) and the opening of Exercise 8.6, p. IV.74. The two middle steps, which the source leaves as exercises. Prose verbatim from the text layer of the author's chapter file; formulas transcribed.

### Additivity for Waldhausen categories

`GeneralAlgebraicKTheory:K.4/waldhausen-additivity` · theorem · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

For a Waldhausen category the map from the weak-equivalence S-construction of the extension category to the product of two copies of that of the category, taking a cofibration sequence to its sub and quotient terms, is a homotopy equivalence. Equivalently, for a cofibration sequence of exact functors the middle induces the sum of the outer two. No saturation, extension or cylinder axiom is needed. This is the Waldhausen form; its simplicial proof is required here and is not deduced merely from the exact-category theorem; with a cylinder functor satisfying the cylinder axiom it gives that the cone is null-homotopic and hence that suspension is a homotopy inverse on K-theory.

**Hypotheses.**

- The category is a small Waldhausen category; the theorem needs none of the three extra axioms.
- The extension category is the second term S₂C of the S-construction, the category of cofibration sequences with the cofibrations of Weibel II.9.3; for an exact category it is the pinned category of conflations.
- A cofibration sequence of functors requires the canonical map out of the pushout to be a cofibration for every cofibration of the source, which is a condition on the functors, not only on their values.
- The suspension consequence does need a cylinder functor satisfying the cylinder axiom.

**Proof outline.**

1. State the theorem in both forms and record that they are equivalent.
2. Record the proof strategy: reduce to the universal case, the extension category, and prove the homotopy equivalence there.
3. Deduce the filtration and alternating-sum corollaries as in K.3.
4. Record the suspension consequence under the cylinder axiom, namely that the cone functor induces the zero map and therefore that suspension induces minus the identity.
5. Record what this packet does not decompose: Waldhausen's own five-page simplicial proof, which is in a paper whose scan has no text layer in this environment; the source's proof is the one recorded, and the gap says so.

**Acceptance.**

- A cofibration sequence of exact functors gives the additivity relation on all K-groups.
- Under the cylinder axiom the cone is null-homotopic and suspension induces minus the identity.
- The theorem needs none of the three extra axioms; the corollaries about the cone do need the cylinder axiom.

**Prerequisites.** `GeneralAlgebraicKTheory:K.4:construction/S-construction`, `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`, `StableHomotopyKTheory:H.2/quillen-theorem-a`, `StableHomotopyKTheory:H.2/quillen-theorem-b`

**Sources.**

- `Weibel.KBook.V`: Additivity Theorem 1.2 and Example 1.2.3, p. V.2. The theorem in the form that covers Waldhausen categories, and the suspension consequence, verbatim.

### Relative S-construction fibration and iterated delooping

`GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum` · theorem · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

For an exact functor f : B → C of small Waldhausen categories let S.f be the simplicial Waldhausen category with Sₙf = SₙB ×_{SₙC} Sₙ₊₁C (Weibel IV.8.5.3): its objects are pairs (B∗, C∗) with f(B∗) = ∂₀C∗, C sits inside it as the objects (0, C = ⋯ = C), and the projection Sₙf → SₙB is exact. Realising the wS.-direction first, the levelwise sequences |wS.C| → |wS.(Sₙf)| → |wS.(SₙB)| realise to a homotopy fibration sequence Ω|wS.(S.B)| → |wS.C| → |wS.(S.f)| → |wS.(S.B)| based at the zero objects (Weibel V.1.7), whose first map, composed with the equivalence |wS.B| ≃ Ω|wS.(S.B)| of the case f = id_B, is homotopic to the map induced by f (Weibel, Exercise V.1.7). For f = id the relative term is the simplicial path object of wS.S.C and is contractible (IV.8.5.4), so |wS.C| ≃ Ω|wS.(S.C)| naturally in exact functors; applied to S.ⁿC this gives natural equivalences |wS.ⁿC| ≃ Ω|wS.ⁿ⁺¹C| for every n ≥ 1. StableHomotopyKTheory:H.5:S-delooping imports these maps and assembles the connective Ω-spectrum; this node does not re-plan spectrum assembly or products. The initial map |wC| → Ω|wS.C| is a group completion, not in general an equivalence.

**Hypotheses.**

- B and C are small Waldhausen categories and f is exact; no saturation, extension or cylinder axiom is needed.
- Degreewise input: Sₙf is equivalent to the extension category E(C, Sₙf, SₙB) of SₙB by C (Weibel II.9.3), so Waldhausen additivity in the form of Corollary V.1.3.1 (K.4/waldhausen-additivity) makes (sub, quotient) : wS.(Sₙf) → wS.C × wS.(SₙB) a homotopy equivalence. Hence each |wS.C| → |wS.(Sₙf)| → |wS.(SₙB)| is a split homotopy fibration sequence over the zero object, its fibre inclusion induced by C ↦ (0, C = ⋯ = C), naturally in n.
- Realisation input: the realisation theorem for levelwise homotopy fibration sequences of simplicial spaces, requested from StableHomotopyKTheory:H.2 (Waldhausen 1978, Lemma 5.2, as the K-book quotes it; Bousfield–Friedlander 1978, Theorem B.4). Its hypotheses hold here: (a) the levelwise sequences are homotopy fibration sequences, by the previous hypothesis; (b) every base term |wS.(SₙB)|, and every total term |wS.(Sₙf)|, is connected, because the zeroth term of an S-construction is the zero category (Weibel IV.8.4), which gives the connectivity form of the theorem and makes the π∗-Kan and π₀ conditions of the bisimplicial form automatic; (c) every space is the realisation of a multisimplicial set, so the simplicial spaces n ↦ |wS.(Sₙ−)| have cellular degeneracies and are good and proper, and realising in the wS.-direction first is legitimate by the bisimplicial realisation lemma (StableHomotopyKTheory:H.2/bisimplicial-realization-lemma).
- The relative K-theory space of f is Ω²|wS.(S.f)|, K.5's Waldhausen relative theory (Weibel IV.8.5.3).
- In the proof of V.1.7 the source exchanges the roles of B and C; the roles above follow IV.8.5.3 and the statement, and the misprint is recorded as GeneralAlgebraicKTheory/E-relative-S-proof-roles.

**Proof outline.**

1. Define S.f by the pullback SₙB ×_{SₙC} Sₙ₊₁C with the Waldhausen structure of IV.8.5.3, with the exact maps C → S.f → S.B, and record that for f = id it is the simplicial path object of S.C, contractible because S₀f = 0 (IV.8.5.4).
2. Prove the equivalence Sₙf ≃ E(C, Sₙf, SₙB), natural in n, and apply K.4/waldhausen-additivity to obtain the split fibration sequences |wS.C| → |wS.(Sₙf)| → |wS.(SₙB)|.
3. Check the hypotheses of the H.2 realisation theorem as listed (levelwise fibration sequences, connected base and total terms, realisations of multisimplicial sets, basepoints at the zero objects), realise in the wS.-direction first, and conclude that Ω|wS.(S.B)| → |wS.C| → |wS.(S.f)| → |wS.(S.B)| is a homotopy fibration sequence, the fibre of |wS.(S.f)| → |wS.(S.B)| over the zero object being identified with |wS.C| by the canonical map from the levelwise fibres (StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence).
4. Identify the first map: the map of sequences S.id_B → S.f given by id_B on B and f on the second factor is compatible with the two fibration sequences, so the first map is the equivalence |wS.B| ≃ Ω|wS.(S.B)| of the case f = id followed by the map induced by f (Weibel, Exercise V.1.7, whose hint is this naturality).
5. Specialise to f = id to get |wS.C| ≃ Ω|wS.(S.C)|, natural in exact functors; iterate on S.ⁿC for n ≥ 1 and export these maps to H.5:S-delooping, which alone assembles the spectrum.
6. Record the non-example: the first map, from the realisation of the weak-equivalence subcategory to the loop space, is a group completion and not an equivalence.
7. Record the degree-minus-one consequence the source gives, that the first homotopy group of the relative realisation is the cokernel of the map of Grothendieck groups, which is where negative K-theory first appears.

**Acceptance.**

- For every n ≥ 1 the natural map |wS.ⁿC| → Ω|wS.ⁿ⁺¹C| is an equivalence; these are the maps the spectrum-assembly owner consumes.
- After the identification |wS.B| ≃ Ω|wS.(S.B)|, the first map of the fibration sequence is the map induced by f.
- The first structure map is a group completion, not an equivalence.
- The first homotopy group of the relative realisation is the cokernel of the map of Grothendieck groups.
- The realisation step is not asserted for arbitrary levelwise fibrations of simplicial spaces: the connectivity and goodness hypotheses are checked here.

**Prerequisites.** `GeneralAlgebraicKTheory:K.4/waldhausen-additivity`, `GeneralAlgebraicKTheory:K.4:construction/S-construction`, `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`, `StableHomotopyKTheory:H.2`, `StableHomotopyKTheory:H.2/bisimplicial-realization-lemma`, `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`

**Sources.**

- `Weibel.KBook.V`: Proposition 1.7 with its proof, p. V.8. The displayed sequence (its first term looped; the earlier transcription omitted Ω) and the realisation lemma the proof invokes, verbatim; the proof's exchange of B and C is recorded under sourceIssues.
- `Weibel.KBook.IV`: Relative K-theory spaces 8.5.3 and Lemma 8.5.4, p. IV.69. The relative construction and the roles of B and C used here, verbatim.
- `Weibel.KBook.IV`: Infinite Loop Structure 8.5.5, p. IV.69. Natural delooping equivalence in IV.8.5.5, whose fibration input is V.1.7.
- `Weibel.KBook.V`: Exercise 1.7, p. V.10. The identification of the first map, verbatim; the source leaves it as an exercise and the proof steps carry it out.

Source discrepancy: `GeneralAlgebraicKTheory/E-relative-S-proof-roles`.

### The Waldhausen localisation (fibration) theorem

`GeneralAlgebraicKTheory:K.4/fibration-theorem` · theorem · parent `GeneralAlgebraicKTheory:K.4` · implementation unchecked

Let a category with cofibrations carry two classes of weak equivalences, the smaller inside the larger, each making it a Waldhausen category, and let the subcategory of objects that are trivial for the larger class carry the smaller class. If the larger structure has a cylinder functor satisfying the cylinder axiom and the larger class satisfies saturation and the extension axiom, then the three K-theory spaces form a homotopy fibration, with the expected long exact sequence ending in the right-exact sequence of Grothendieck groups. Every hypothesis is used, and this node lists them as hypotheses rather than as background.

**Hypotheses.**

- Two classes of weak equivalences on the same category with cofibrations, the smaller contained in the larger.
- The larger structure has a cylinder functor satisfying the cylinder axiom; the larger class satisfies saturation and the extension axiom.
- The subcategory is the full Waldhausen subcategory of objects whose map from the zero object lies in the larger class, with the smaller class of weak equivalences.

**Proof outline.**

1. State the theorem with its four hypotheses named.
2. Record the shape of the proof: form the bicategory of squares with the two classes in the two directions, show that it is homotopy equivalent to the larger structure's construction, cut down to the sub-bicategory whose horizontal maps are also cofibrations using saturation and the cylinder axiom, and identify the resulting row with the relative construction of the previous node.
3. Read off the long exact sequence and its right-exact end.
4. Record the two standing instances the source derives: the localisation sequence of a central multiplicative set, with the support term, and the corresponding sequence in G-theory for a noetherian scheme with a closed subscheme.
5. Record Thomason's cofinality theorem as the special case in which the larger class is the maps that are equal on Grothendieck classes.
6. Record the source's warning that the map of Grothendieck groups at the end need not be surjective, so the connective sequence stops, which is what K.6 exists to repair.

**Acceptance.**

- The localisation sequence for a central multiplicative set of non-zero-divisors holds with the support term.
- Thomason's cofinality theorem is the special case with the Grothendieck-class weak equivalences.
- The map of Grothendieck groups at the end of the sequence need not be surjective; the sequence continues only in the nonconnective theory.
- None of the four hypotheses may be dropped; the source's counterexamples show the statement fails without them.

**Prerequisites.** `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`, `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`

**Sources.**

- `Weibel.KBook.V`: Waldhausen Localization Theorem 2.1, p. V.12. The theorem with all four hypotheses, verbatim.
- `Weibel.KBook.V`: Theorem 2.6.3 and Caveat 7.1.1, pp. V.17 and V.52. The standing instance and the warning that motivates K.6, verbatim.

### The Approximation theorem

`GeneralAlgebraicKTheory:K.4/approximation-theorem` · theorem · parent `GeneralAlgebraicKTheory:K.4` · implementation unchecked

Let an exact functor of saturated Waldhausen categories detect weak equivalences, and suppose the approximate lifting property holds: every map out of the image of an object factors as the image of a map followed by a weak equivalence. If the source has a cylinder functor satisfying the cylinder axiom, then the functor induces homotopy equivalences of the weak-equivalence S-constructions and of the K-theory spaces. The theorem is what produces the standard models of K-theory by complexes, and the source records that it fails without the cylinder hypothesis, with an explicit pair of categories whose Grothendieck groups differ.

**Hypotheses.**

- Both categories are saturated; the functor detects weak equivalences in both directions.
- The approximate lifting property holds, and the factoring map may be taken to be a cofibration.
- The source has a cylinder functor satisfying the cylinder axiom. The source records that without it the conclusion fails.

**Proof outline.**

1. State the three hypotheses and the conclusion.
2. Record the proof strategy: the lifting property passes to each term of the S-construction, so it suffices to prove that the map of weak-equivalence subcategories is a homotopy equivalence, and then to realise.
3. Record the counterexample the source gives, a subcategory satisfying the lifting property whose Grothendieck group differs, so that the cylinder hypothesis is seen to be necessary.
4. Record the standing consequences: the K-theory of an abelian category is that of its bounded complexes and of its homologically bounded complexes; the K-theory of a ring is that of the bounded complexes of finitely generated projectives and of the perfect complexes.
5. Record the Hinich and Shektman consequence, that enlarging the cofibrations while keeping the weak equivalences does not change K-theory.

**Acceptance.**

- The K-theory of a ring is that of its perfect complexes.
- The K-theory of an abelian category is that of its bounded complexes.
- Without the cylinder hypothesis the theorem is false, and the source's counterexample witnesses it.
- Enlarging the cofibrations with the same weak equivalences does not change K-theory.

**Prerequisites.** `GeneralAlgebraicKTheory:K.4/fibration-theorem`, `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`

**Sources.**

- `Weibel.KBook.V`: Waldhausen Approximation Theorem 2.4 with its proof, p. V.15. The theorem with its three conditions and the first step of the proof, verbatim.
- `Weibel.KBook.V`: Changing cofibrations 2.5.1, p. V.16. The consequence about changing cofibrations, verbatim.

### The Gillet-Waldhausen comparison

`GeneralAlgebraicKTheory:K.4/gillet-waldhausen` · theorem · parent `GeneralAlgebraicKTheory:K.4` · implementation unchecked

For an exact category closed under kernels of surjections in an ambient abelian category, the inclusion into the bounded complexes, with degreewise admissible monomorphisms as cofibrations and QUASI-ISOMORPHISMS as weak equivalences, induces a homotopy equivalence of K-theory spaces. The closure hypothesis is what makes the acyclic objects the admissibly exact complexes; without it the source gives a repaired statement in which quasi-isomorphisms are computed in the category of left exact functors and cofinality is used. Quasi-isomorphisms may not be replaced by chain homotopy equivalences in categories where the two differ.

**Hypotheses.**

- The exact category is given as a full subcategory of an abelian category M, closed under extensions and carrying the pinned induced structure (ExactStructure.fullSubcategory of ExactStructure.abelian M), and closed under kernels of surjections in M, in the source's sense (Weibel II.7.0.1). The ambient M is part of the data, since the pinned carrier has no Gabriel–Quillen embedding.
- The weak equivalences are the quasi-isomorphisms computed in M, not chain homotopy equivalences. The repaired statement without the closure hypothesis computes them in the category of left exact functors (the Gabriel–Quillen embedding of Weibel's Exercise II.7.8), which neither library has; that statement is recorded, not decomposed.
- The proof uses the fibration theorem and a cylinder functor on the complexes, namely the mapping cylinder.

**Proof outline.**

1. Record the Waldhausen structure on the bounded complexes and the mapping cylinder that makes the fibration theorem applicable.
2. Prove that for a bounded range the acyclic objects are the admissibly exact complexes, using the closure hypothesis.
3. Compute the K-theory of the categories of complexes concentrated in a bounded range by additivity, and identify the cofibre of the comparison map with the K-theory of the category through the Euler characteristic.
4. Pass to the colimit over the range and apply the fibration theorem to the inclusion of the isomorphisms in the quasi-isomorphisms.
5. Record the repaired statement without the closure hypothesis and what it costs: the quasi-isomorphisms must be computed in the left exact functors and cofinality must be invoked.
6. Record the degree-zero shadow, that the Grothendieck group of the bounded complexes is that of the category with the alternating-sum formula, and the non-example about chain homotopy equivalences.

**Acceptance.**

- The K-theory of an exact category is that of its bounded complexes with quasi-isomorphisms.
- In degree zero the comparison is the alternating-sum formula for the class of a complex.
- Replacing quasi-isomorphisms by chain homotopy equivalences changes the statement and needs its own argument.
- Without the closure hypothesis the naive statement can fail in degree zero; the repaired form is the one to use.

**Prerequisites.** `GeneralAlgebraicKTheory:K.4/approximation-theorem`, `GeneralAlgebraicKTheory:K.4/fibration-theorem`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `tauceti:TauCeti.ExactStructure.abelian`, `tauceti:TauCeti.ExactStructure.fullSubcategory`

**Sources.**

- `Weibel.KBook.V`: Theorem 2.2 (Gillet-Waldhausen) with the opening of its proof, p. V.13. The theorem and the structure of its proof, verbatim.
- `Weibel.KBook.V`: Remark 2.2.1, p. V.14. The repaired statement without the closure hypothesis, verbatim.

### Relative K-theory as a homotopy fibre

`GeneralAlgebraicKTheory:K.5/relative-K-theory` · definition · parent `GeneralAlgebraicKTheory:K.5` · implementation unchecked

For a unital ring homomorphism f the RELATIVE K-THEORY space K(f) is the homotopy fibre, at the basepoint of the target, of the induced map K(f) of the ring model (K.2/functorial-K-theory-of-a-ring), and the relative groups are its homotopy groups; they fit into a long exact sequence with the absolute groups, ending in the zeroth relative group mapping to the zeroth group of the source. All the relative groups, the zeroth one included, are abelian, because the functorial H-space structure on the K-theory space makes the fibre one. A pair consisting of a possibly noncommutative ring and a two-sided ideal is treated through the quotient map A → A/I. For an exact functor of Waldhausen categories the relative theory is the double loop space of the relative S-construction of K.4:construction, and its sequence ends one step further, with the cokernel of the map of Grothendieck groups appearing as a first negative group. The identification of the relative groups of a pair in degrees zero and one with the classical groups K₀(I) and K₁(A, I) = GL(I)/E(A, I) is KTheoryLowDegrees:U.6/relative-K1-homotopy-comparison, which imports this node; it is not asserted here.

**Hypotheses.**

- The rings are unital and the map is unital; for a pair the ideal is two-sided (Mathlib's Ideal with [I.IsTwoSided], whose quotient ring is Ideal.Quotient.ring), and no commutativity is assumed.
- The homotopy fibre is taken at the basepoint of the target, and the H-space structure used for the group laws is the functorial one.
- The Waldhausen version needs the relative S-construction and its fibration, which is K.4:construction's theorem K.4/delooping-and-the-spectrum.
- The classical relative groups are KTheoryLowDegrees U.5's, and their comparison with this fibre is U.6's; both lie downstream of this node, so no statement of this node uses them.

**Proof outline.**

1. Define the relative space as the homotopy fibre (StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence) and the relative groups as its homotopy groups.
2. Record the long exact sequence and its end in degree zero.
3. Prove that every relative group is abelian, from the functorial H-space structure.
4. Define the relative theory of a pair through the quotient map by a two-sided ideal. When the quotient map has a ring section, the fibre sequence splits and the relative groups are the kernels of K_n(A) → K_n(A/I).
5. Record the Waldhausen version, the double loop space of the relative S-construction, and the extra term at the end of its sequence.
6. Record what the pinned libraries have: Mathlib has the homotopy fibre of a map of complexes but no K-theory space, so nothing of this exists at the pins.

**Acceptance.**

- The relative groups are abelian in every degree, including degree zero.
- For a pair whose quotient map has a ring section the relative groups are the kernels of K_n(A) → K_n(A/I).
- The Waldhausen relative sequence has one more term than the ring one, the cokernel of the map of Grothendieck groups.
- The relative theory of the identity map is trivial.
- No identification of the relative groups of a pair with K₀(I) or K₁(A, I) is asserted here; that comparison is KTheoryLowDegrees U.6's.

**Prerequisites.** `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`, `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`, `mathlib:Ideal.Quotient.ring`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `relativeK` | data | The relative K-theory space of a ring map. |
| `relativeK.group` | data | The relative groups. |
| `relativeK.addCommGroup` | structure | Their abelian group structure, degree zero included. |
| `relativeK.les` | characterisation | The long exact sequence with the absolute groups. |
| `relativeK.ofPair` | example | The relative theory of a ring and a two-sided ideal, through the quotient map; its identification in degrees zero and one with K₀(I) and K₁(A, I) is KTheoryLowDegrees U.6's. |
| `relativeK.waldhausen` | relation | The Waldhausen relative theory and its extra term. |

**Consumers.**

- K.5, excision — Excision is the question of when the relative groups depend only on the ideal.
- K.6 — The extra term at the end of the Waldhausen sequence is the first negative K-group, which is where the nonconnective theory starts.
- K.7 — The products are asserted compatible with the relative groups.
- KTheoryLowDegrees:U.6/relative-K1-homotopy-comparison — Identifies π₀ and π₁ of the fibre for a pair with the classical K₀(I) and K₁(A, I).

**Unit tests.**

- `identity_map` (degenerate) — The relative theory of the identity is trivial.
- `split_pair` (computation) — When the quotient map A → A/I has a ring section, the fibre sequence splits: π_n K(A, I) is the kernel of K_n(A) → K_n(A/I) and K_n(A) ≅ K_n(A/I) ⊕ π_n K(A, I) naturally; for the double ring A ⊕ I with its projection to A this gives π₀ K(A ⊕ I, 0 ⊕ I) = ker(K₀(A ⊕ I) → K₀(A)).
- `abelian_in_degree_zero` (degenerate) — The zeroth relative group is abelian; it is a homotopy set made a group by the H-space structure, and that structure must be carried.
- `waldhausen_extra_term` (computation) — The Waldhausen relative sequence has the cokernel of the map of Grothendieck groups as an extra term.

**Sources.**

- `Weibel.KBook.IV`: Relative groups 1.11.1, p. IV.8. The definition, the sequence and the abelian-group statement, verbatim.
- `Weibel.KBook.IV`: Exercise 1.15, p. IV.16. The identification of the low relative groups for a pair, stated by the source as an exercise with hints; KTheoryLowDegrees:U.6/relative-K1-homotopy-comparison owns it and imports this node, which does not assert it.

### Relative K-theory is not support K-theory

`GeneralAlgebraicKTheory:K.5/relative-versus-support` · comparison · parent `GeneralAlgebraicKTheory:K.5` · implementation unchecked

For a central multiplicative set the SUPPORT theory is the K-theory of the bounded complexes of finitely generated projectives that become exact after localising. It sits in a homotopy fibration with the K-theory of the ring and of the localisation, which looks like the relative sequence but is a different construction: the support theory is defined from a Waldhausen category, not as a homotopy fibre, and the map of zeroth K-groups at the end is not surjective, so the connective fibre does not see the cokernel. The source also records that when the multiplicative set contains zero divisors the category of torsion perfect modules does not model the fibre. This node states the distinction the stage text asks for and records both failure modes.

**Hypotheses.**

- The multiplicative set is central; for the identification with the torsion modules its elements are non-zero-divisors.
- The support category is the bounded complexes of finitely generated projectives whose localisation is exact.
- The fibration is the one the fibration theorem of K.4 produces, with the approximation theorem used to identify the third term.

**Proof outline.**

1. Define the support category and record the fibration the fibration theorem gives.
2. Compare the sequence with the relative sequence of the localisation map and record where they differ: the third term is the K-theory of a category of modules over the localisation that is only cofinal in all finitely generated projectives.
3. Record the source's caveat that the map of zeroth groups is not onto and that continuing the sequence needs the nonconnective spectra of K.6.
4. Record the second failure mode: for a multiplicative set with zero divisors the category of torsion perfect modules is not the fibre, which the source gives as an exercise.
5. State the resulting rule: support theory is used where the stage text says support, relative theory where it says relative, and neither is substituted for the other.

**Acceptance.**

- For a central set of non-zero-divisors there is a homotopy fibration with the support term.
- The map of zeroth K-groups is not surjective in general, so the connective sequence stops.
- For a set containing zero divisors the torsion perfect modules do not model the fibre.
- Support theory and relative theory are different constructions and are not interchangeable.

**Prerequisites.** `GeneralAlgebraicKTheory:K.5/relative-K-theory`, `GeneralAlgebraicKTheory:K.4/fibration-theorem`, `GeneralAlgebraicKTheory:K.4/approximation-theorem`

**Sources.**

- `Weibel.KBook.V`: Theorem 2.6.3, p. V.17. The support fibration, verbatim.
- `Weibel.KBook.V`: Caveat 7.1.1, p. V.52. Both failure modes, verbatim.

### Nonunital rings, the unitisation and the comparison with the unital theory

`GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation` · construction · parent `GeneralAlgebraicKTheory:K.5` · implementation unchecked

A ring without unit is treated through a specified unitisation, the canonical augmented ring obtained by adjoining the integers, and its K-theory is defined as the relative theory of the augmentation. The unitisation is pinned in Mathlib with its universal property, and nothing K-theoretic is built on it there. The comparison with the usual theory is the statement that for a nonunital ring contained as a two-sided ideal in a unital ring there is a map from the theory defined this way to the relative theory of the pair, and the question of when it is an isomorphism is exactly excision, which is the next node's subject.

**Hypotheses.**

- The nonunital ring is an associative ring without unit; the unitisation is the canonical one over the integers, which is the pinned construction.
- The augmentation is the ring map to the integers and the relative theory is that of the augmentation.
- The comparison map exists for any unital ring containing the nonunital one as a two-sided ideal, and no claim is made about its being an isomorphism here.

**Proof outline.**

1. Record the pinned unitisation with its universal property and record that nothing K-theoretic is built on it at the pins.
2. Define the K-theory of a nonunital ring as the relative theory of the augmentation.
3. Construct the comparison map to the relative theory of a pair, using functoriality of the relative theory in maps of pairs.
4. Prove the elementary properties: the construction agrees with the usual one when the ring happens to be unital and the inclusion is split, and it is functorial for maps of nonunital rings.
5. Record that the question of when the comparison is an isomorphism is excision, and hand it to the next node.

**Acceptance.**

- For a unital ring the construction agrees with the usual theory.
- The comparison map to the relative theory of a pair exists for every unital ring containing the nonunital one as an ideal.
- The construction is functorial for maps of nonunital rings.
- No excision statement is made here.

**Prerequisites.** `GeneralAlgebraicKTheory:K.5/relative-K-theory`, `mathlib:Unitization`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `nonunitalK` | data | The K-theory of a nonunital ring through its unitisation. |
| `nonunitalK.map` | functoriality | Functoriality in maps of nonunital rings. |
| `nonunitalK.compare` | data | The comparison map to the relative theory of a pair. |
| `nonunitalK.of_unital` | compatibility | Agreement with the usual theory for a unital ring. |
| `nonunitalK.unitization_pinned` | relation | The unitisation is Mathlib’s, with its universal property. |

**Consumers.**

- K.5, excision — Excision is the statement that the comparison map is an isomorphism.
- K.6 — The four axioms for negative K-theory are stated for nonunital rings, and the ideal axiom uses this construction.

**Unit tests.**

- `unital_case` (compatibility) — For a unital ring the construction agrees with the usual theory.
- `functorial` (computation) — It is functorial for maps of nonunital rings.
- `comparison_exists` (computation) — The comparison map exists for every unital ring containing the ring as an ideal.
- `no_excision_claimed` (non-example) — The comparison map is not asserted to be an isomorphism; that is the next node’s hypothesis-laden statement.

**Sources.**

- `Weibel.KBook.IV`: Absolute Excision 1.11.2, p. IV.9. The unitisation and the comparison map, verbatim; the excision question itself is the next node.

### Excision holds under hypotheses, and fails without them

`GeneralAlgebraicKTheory:K.5/excision-and-its-failure` · theorem · parent `GeneralAlgebraicKTheory:K.5` · implementation unchecked

A nonunital ring satisfies absolute excision in degree n when the comparison map of the previous node is an isomorphism for every unital ring containing it as an ideal. Every nonunital ring satisfies it in degree zero. In degree one it holds exactly when the ring is idempotent, that is equal to its own square, which is both the criterion and the counterexample: a nonunital ring with a proper square fails excision for the first K-group. In general it holds in degrees one to n exactly when the first n torsion groups of the integers over the unitisation vanish, and a ring for which all of them vanish, called homologically unital, satisfies excision in all degrees. The criteria are quoted from Suslin and Suslin-Wodzicki as the source quotes them, with their proofs outside what was read.

**Hypotheses.**

- The nonunital ring is associative; the unitisation is the canonical one and the torsion groups are taken over it.
- Absolute excision is quantified over ALL unital rings containing the ring as a two-sided ideal, which is what makes it a property of the ring alone.
- The criteria are quoted, not proved: the source attributes them to Suslin and to Suslin and Wodzicki and does not prove them, and neither does this packet.

**Proof outline.**

1. Define absolute excision in each degree, quantified over all ambient unital rings.
2. Record that every nonunital ring satisfies it in degree zero.
3. Record the criterion in degree one: excision holds exactly when the ring equals its square, and note that the first torsion group is the quotient of the ring by its square, so the general criterion contains this one.
4. Record the general criterion and the notion of a homologically unital ring, with excision in all degrees.
5. Give the counterexample the criterion yields: a nonunital ring with a proper square, for instance a square-zero ring, fails excision for the first K-group, which is the explanatory test the stage text asks for.
6. State the rule this layer exports: no unconditional excision instance may be created, and every use must name the hypothesis it relies on.

**Acceptance.**

- Excision holds in degree zero for every nonunital ring.
- Excision in degree one holds exactly when the ring is idempotent; a square-zero ring is the counterexample.
- A homologically unital ring satisfies excision in all degrees.
- No unconditional excision statement may be asserted; the stage text forbids it and the criterion shows why.

**Prerequisites.** `GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation`, `GeneralAlgebraicKTheory:K.5/relative-K-theory`

**Sources.**

- `Weibel.KBook.IV`: Absolute Excision 1.11.2, p. IV.9. The definition, the degree-zero statement, the degree-one criterion, the general criterion and the notion of an H-unital ring, verbatim.

### Milnor's sequence is exact at the pair of K₁-groups

`GeneralAlgebraicKTheory:K.5/milnor-square-K1-exactness` · lemma · parent `GeneralAlgebraicKTheory:K.5` · implementation unchecked

For a Milnor square, the sequence K₁(B) → K₁(S) × K₁(T) → K₁(C) of classical K₁-groups, with first map (K₁(p), K₁(q)) and second map (x, y) ↦ K₁(φ)(x) · K₁(ψ)(y)⁻¹, is exact at K₁(S) × K₁(T). This is the one exactness position of Milnor's K₁–K₀ sequence that KTheoryLowDegrees Z.1 does not decompose.

**Hypotheses.**

- A Milnor square: unital, possibly noncommutative rings S, T and C in one universe, a surjective unital map φ : S → C, a unital map ψ : T → C, and B = RingHom.pullback φ ψ with its projections p : B → S and q : B → T, the convention of KTheoryLowDegrees Z.1. Equivalently (Weibel III.2.6), a unital map f : R → S carrying a two-sided ideal I of R isomorphically onto a two-sided ideal of S, with T = R/I and C = S/I; then B ≅ R.
- Surjectivity of φ is essential: it is what makes the patched modules finitely generated projective and what lets elementary matrices over C lift to S.
- K₁ is the classical GL/E of KTheoryLowDegrees U.2, written multiplicatively; its identification with π₁ of the ring model is KTheoryLowDegrees U.6's and is not used.

**Proof outline.**

1. The composite is trivial: φ ∘ p = ψ ∘ q (RingHom.pullback_comm_sq) and K₁ is functorial (KTheoryLowDegrees:U.2/K1-map).
2. Let x = [g] and y = [h] with K₁(φ)(x) = K₁(ψ)(y). Represent g and h in one GL_n (KTheoryLowDegrees:U.1/finite-representatives) and enlarge n until φ(g) = ψ(h) · ē with ē in E_n(C) (the stable elementary subgroup, KTheoryLowDegrees:U.1/stable-elementary-subgroup).
3. Lift ē to e in E_n(S), which is possible because φ is surjective (KTheoryLowDegrees:U.1/elementary-surjective-map); then φ(g e⁻¹) = ψ(h).
4. A pair of invertible matrices over S and T with equal images in C is an invertible matrix over the pullback B, its inverse being the pair of inverses; so (g e⁻¹, h) lies in GL_n(B), and its class in K₁(B) maps to ([g], [h]) because e is elementary.

**Acceptance.**

- Every pair of classes with the same image in K₁(C) comes from K₁(B).
- The lemma uses the surjectivity of φ only through the lifting of elementary matrices; the lifting of invertible matrices is neither needed nor true in general.
- No exactness at K₁(B) is asserted: the sequence starts there.

**Prerequisites.** `KTheoryLowDegrees:U.2/K1`, `KTheoryLowDegrees:U.2/K1-map`, `KTheoryLowDegrees:U.1/finite-representatives`, `KTheoryLowDegrees:U.1/stable-elementary-subgroup`, `KTheoryLowDegrees:U.1/elementary-surjective-map`, `mathlib:RingHom.pullback`, `mathlib:RingHom.pullback_comm_sq`

**Sources.**

- `Weibel.KBook.III`: Proof of Theorem 2.6, the last step, p. III.15. The argument of the proof steps, verbatim (formulas transcribed); in the notation here S is S, T is R/I and C is S/I.

### Milnor's K₁–K₀ Mayer–Vietoris sequence for a Milnor square

`GeneralAlgebraicKTheory:K.5/milnor-square-mayer-vietoris` · theorem · parent `GeneralAlgebraicKTheory:K.5` · implementation unchecked

For a Milnor square the sequence K₁(B) → K₁(S) × K₁(T) → K₁(C) → K₀(B) → K₀(S) × K₀(T) → K₀(C) is exact at each of its four interior terms. Its maps are (K(p), K(q)), then (x, y) ↦ K(φ)x − K(ψ)y (written multiplicatively on K₁), then the Milnor boundary ∂ of KTheoryLowDegrees:Z.1/milnor-boundary, which sends a gluing matrix a ∈ GL_n(C) to [FreePatch(a)] − n[B] with the gluing orientation fixed there, then (K₀(p), K₀(q)), then the difference of K₀(φ) and K₀(ψ). The K₀-groups are RingK0, which is the degree-zero group of the ring model (K.2/functorial-K-theory-of-a-ring), and the K₁-groups are the classical GL/E. The sequence is natural in morphisms of Milnor squares. It is the low-degree excision statement for a Milnor square: in the ideal form f : R → S, exactness at K₀(R) and at K₀(S) × K₀(R/I) carries the classical excision for K₀, and exactness at K₁(S) × K₁(R/I) the degree-one surjectivity of K₁(R, I) → K₁(S, I) (Weibel, Remark III.2.2.1); nothing further is asserted. Bass's continuation into negative degrees (Weibel III.4.3) is K.6's.

**Hypotheses.**

- A Milnor square: unital, possibly noncommutative rings S, T and C in one universe, a surjective unital map φ : S → C, a unital map ψ : T → C, and B = RingHom.pullback φ ψ with its projections p : B → S and q : B → T, the convention of KTheoryLowDegrees Z.1. Equivalently (Weibel III.2.6), a unital map f : R → S carrying a two-sided ideal I of R isomorphically onto a two-sided ideal of S, with T = R/I and C = S/I; then B ≅ R.
- Surjectivity of φ is essential: it is what makes the patched modules finitely generated projective and what lets elementary matrices over C lift to S.
- The K₀-groups are Z.1's RingK0 and are identified with π₀ of the ring model by K.2/functorial-K-theory-of-a-ring; the K₁-groups are KTheoryLowDegrees U.2's GL/E. The identification of the latter with π₁ of the ring model (KTheoryLowDegrees U.6 with the plus comparison) lies downstream of K.5 and is not used, so the sequence is not stated for the homotopy groups of the ring model in degree one.
- No surjectivity onto K₀(C) is asserted, and no term to the left of K₁(B).

**Proof outline.**

1. Pass between the two forms of the hypothesis: in the pullback form q is surjective, its kernel is carried isomorphically by p onto the kernel of φ, and B → S is the ideal form; conversely the ideal form is the pullback of S → S/I and R/I → S/I.
2. Exactness at K₀(S) × K₀(T) is KTheoryLowDegrees:Z.1/milnor-exact-at-pair, which rests on Milnor patching (Z.1/milnor-finite-projective); exactness at K₀(B) is Z.1/milnor-exact-at-k0; exactness at K₁(C) is Z.1/milnor-boundary-kernel, since ∂ is additive and kills the image of K₁(S) × K₁(T).
3. Exactness at K₁(S) × K₁(T) is K.5/milnor-square-K1-exactness.
4. Identify the K₀-terms with the degree-zero groups of the ring model and K₀(p), K₀(q), K₀(φ), K₀(ψ) with its maps, through the degree-zero comparison of K.2/functorial-K-theory-of-a-ring.
5. Naturality: a morphism of Milnor squares induces maps of all six terms commuting with the first, second, fourth and fifth maps by functoriality, and with ∂ because a morphism of squares carries FreePatch(a) to FreePatch of the image of a after scalar extension (Z.1/milnor-boundary).
6. Record what is not asserted: exactness does not extend to a K₂-term in general (the continuation to K₂ of Weibel III.5.8 needs two ideals with I ∩ J = 0), and in the ideal form the classical K₁(R, I) → K₁(S, I) is onto but need not be injective (Swan's example, Weibel Exercise III.2.3), so no excision in degree one beyond surjectivity, and none in higher degrees, may be derived; the conditions under which excision holds are K.5/excision-and-its-failure's.

**Acceptance.**

- The six-term sequence is exact at K₁(S) × K₁(T), K₁(C), K₀(B) and K₀(S) × K₀(T).
- For two-sided ideals I and J of R with I ∩ J = 0 the square R → R/J, R/I → R/(I + J) is a Milnor square, and the sequence is the K₁–K₀ part of Weibel's Theorem III.5.8.
- For the rim square ℤC_p → ℤ[ζ_p], ℤ → 𝔽_p (Weibel Exercise III.2.2) it gives an exact sequence K₁(ℤC_p) → K₁(ℤ[ζ_p]) × K₁(ℤ) → K₁(𝔽_p) → K₀(ℤC_p) → K₀(ℤ[ζ_p]) × K₀(ℤ) → K₀(𝔽_p).
- Nothing asserts excision for K₁ or higher K-groups; Swan's example (Weibel Exercise III.2.3) shows the classical relative K₁ depends on the ambient ring.

**Prerequisites.** `GeneralAlgebraicKTheory:K.5/milnor-square-K1-exactness`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `KTheoryLowDegrees:Z.1/milnor-finite-projective`, `KTheoryLowDegrees:Z.1/milnor-boundary`, `KTheoryLowDegrees:Z.1/milnor-boundary-kernel`, `KTheoryLowDegrees:Z.1/milnor-exact-at-k0`, `KTheoryLowDegrees:Z.1/milnor-exact-at-pair`, `mathlib:RingHom.pullback`

**Sources.**

- `Weibel.KBook.III`: Theorem 2.6 (Mayer–Vietoris) with its proof, p. III.15. The theorem, verbatim with the arrows' labels dropped; its proof derives the K₀ positions from II.2.9 (Milnor patching, owned by KTheoryLowDegrees Z.1) and the K₁ positions from the lifting of elementary matrices.
- `Weibel.KBook.III`: Remark 2.2.1 and Exercise 2.3, pp. III.13 and III.16. The degree-one surjectivity and the failure of degree-one excision that bound what this node asserts.
- `Weibel.KBook.III`: Theorem 5.8, p. III.41. The only extension to K₂ the source gives, under its hypothesis.

## Remaining gaps

### Quillen's original paper could not be read in this environment

The scan at the address the reviewed decomposition records was downloaded and its SHA-256 reproduces that record, so it is the right file; but its text layer is an old optical recognition that drops every inter-word space and mangles the displayed formulas, and this environment has no renderer to read the pages as images. The paper was therefore NOT read and is NOT cited: every locator in this packet is to a chapter of the K-book, which proves all the same theorems, and attributions to Quillen are made as the K-book makes them. NEXT SOURCE ACTION: read Quillen, 'Higher algebraic K-theory: I', sections 2 to 5 (LNM 341, printed pp. 99 to 116), from page images or from a cleaner scan, and add its statements of Theorems 1 to 5 as second sources on the K.1 and K.3 nodes, where the K-book's proofs already stand.

### Waldhausen's original paper has no text layer at all

The scan the reviewed decomposition records was downloaded and its SHA-256 reproduces that record. It is a pure image scan: the whole 101-page file yields three kilobytes of text, and no page of sections 1.3 to 1.5 yields any. It was therefore NOT read and is NOT cited. Everything K.4 states is decomposed from the K-book, which proves additivity, the delooping, the fibration theorem, approximation and cofinality in full or refers to Waldhausen for a step, and the nodes say which. The steps for which the K-book itself refers to Waldhausen are: the five-page simplicial proof of additivity, the identification of the subdivision of the S-construction with the Q-construction, and the details of the approximation theorem. NEXT SOURCE ACTION: read Waldhausen, 'Algebraic K-theory of spaces', sections 1.3 to 1.6 (printed pp. 328 to 350), from page images, and decompose those three arguments.

### Four steps of the plus-equals-Q proof were read only in outline

Theorem 7.1 and Corollary 7.2 were read in full, as were Definition 7.3 and the exercises that record the low-degree consequences. The proofs of Lemma 7.5, Proposition 7.6, Lemma 7.7 and Theorem 7.8, which occupy pp. IV.62 to IV.65 and contain the fibration argument itself, were read in outline only, so the proof steps of the extension-category node record the shape of the argument and not its details. NEXT SOURCE ACTION: read pp. IV.62 to IV.65 in full and decompose the four results, which will also settle how much of the argument needs the group-completion machinery that StableHomotopyKTheory H.4 owns.

### The detailed proofs of the fibration, approximation and abelian localisation theorems were not read

Theorem 2.1, Theorem 2.4 and Theorem 5.1 of chapter V were read as statements, with the opening of each proof and, for 5.1, the shape of the five-claim argument. Their full proofs, which occupy several pages each and which the source itself in part refers to Waldhausen for, were not read. The proof steps of those three nodes therefore record the strategy rather than the argument. NEXT SOURCE ACTION: read V.12 to V.17 and V.35 to V.37 in full.

### The excision criteria are quoted, not proved

The criteria that excision in degree one is equivalent to the ring being idempotent, and that excision in degrees up to n is equivalent to the vanishing of the first n torsion groups over the unitisation, are quoted by the source from Suslin and from Suslin and Wodzicki without proof, and this packet quotes them the same way. The counterexample they yield, a square-zero ring, is therefore also conditional on them. NEXT SOURCE ACTION: read Suslin and Wodzicki, 'Excision in algebraic K-theory' (Annals 136, 1992), and Suslin's 1995 sequel, and decompose the proof of the criterion in degree one at least, which is the one the counterexample uses.

## Requests to existing owners

- `StableHomotopyKTheory:H.4` — Group completion of a symmetric monoidal groupoid, the plus construction, the stable general linear group and the cofinal stabilisation argument, including the Cofinality Theorem for a cofinal monoidal functor with the same automorphism groups (Weibel IV.4.11(b)), which K.2:plus/cofinality-of-projective-modules now uses instead of the late exact-category cofinality. AUDIT-28 records H.4 as owning exactly the comparison K.2:plus needs, so this packet states the plus-equals-Q theorem and cites H.4 for the group-completion side rather than building it.
- `StableHomotopyKTheory:H.1` — The homotopy-theoretic apparatus the K.1 and K.3 proofs use: the classification of coverings by morphism-inverting functors with the maximal-tree presentation of π₁, the fact that a natural transformation gives a homotopy (so adjoints are homotopy equivalences and categories with an initial object are contractible), and the commutation of classifying spaces with filtered colimits. The nodes cite the integrated H.1 nodes coverings-fundamental-group-local-coefficients, natural-transformations-adjoints-contractibility and filtered-colimits-of-categories by id.
- `StableHomotopyKTheory:H.5:S-delooping` — Assemble the connective Ω-spectrum from the iterated S-construction and the natural deloopings |wS.ⁿC| ≃ Ω|wS.ⁿ⁺¹C| supplied by K.4:construction (K.4/delooping-and-the-spectrum), with its indexing π_i = K_i for i ≥ 0. Spectrum assembly consumes that prefix; it is not a prerequisite of additivity or of the relative S-fibration. Generic smash products belong to H.5:spectra, and the K-theory-specific biexact pairings and their coherence to K.7, so the pairing clause of the integrated H.5:S-delooping node should move to K.7.
- `KTheoryLowDegrees:U.6` — The identification of the first homotopy group of the plus construction with the quotient of the stable general linear group by its elementary subgroup, compatibly with determinant and transfer. K.2:low-degree-comparisons imports it by name and does not re-plan it. U.6 also owns the comparison of π₀ and π₁ of K.5's relative fibre for a pair with K₀(I) and K₁(A, I) (U.6/relative-K1-homotopy-comparison); K.5 does not assert it, and U.6 should cite this packet's node GeneralAlgebraicKTheory:K.5/relative-K-theory rather than the integrated decomposition id.
- `KTheoryLowDegrees:Z.1` — Finitely generated projective modules as summands of finite free modules, with complements, scalar extension along arbitrary (noncommutative) unital ring maps and the ring Grothendieck group, and Milnor patching with the K₀ end of the Mayer–Vietoris sequence. These are planned in the KTheoryLowDegrees--U.1 packet and cited here by node id: Z.1/extend-scalars and Z.1/extend-scalars-finite-projective (K.2:plus scalar extension), Z.1/projective-karoubi, Z.1/ring-k0-exact and Z.1/ring-k0-map (the ring model), and Z.1/milnor-finite-projective, Z.1/milnor-boundary, Z.1/milnor-boundary-kernel, Z.1/milnor-exact-at-k0 and Z.1/milnor-exact-at-pair (K.5's Mayer–Vietoris node). The one missing position of Milnor's sequence, exactness at K₁(S) × K₁(T), is planned in K.5 because KTheoryLowDegrees U.5, its natural owner, lies downstream of K.5 (through SchemeKTheoryOperations S.3).
- `K2SymbolsBrauer:T.1:plus` — The identification of the second K-group with the second homology of the stable elementary subgroup and with the second homotopy group of the K-theory space.
- `K2SymbolsBrauer:T.2:symbols` — Matsumoto's presentation of the second K-group of a FIELD by symbols. K.2:low-degree-comparisons states that it is field-specific and imports it from here.
- `K3BlochGroups:V.4` — Suslin's exact sequence relating the third K-group to the Bloch group, which is the explicit degree-three model K.2:low-degree-comparisons registers.
- `GeneralAlgebraicKTheory:K.6` — The nonconnective spectrum and the negative K-groups. K.4's delooping node produces the cokernel of a map of Grothendieck groups as a first negative group, and K.4's fibration theorem and K.5's support node both stop because a map of zeroth groups is not surjective; all three point at K.6, which is decomposed in the companion packet.
- `StableHomotopyKTheory:H.2` — RT-AREA-ktheory-1/15. The realisation theorem for levelwise homotopy fibration sequences of simplicial spaces, stated and proved in a model the relative S.-construction satisfies: for maps V. → W. → X. of simplicial spaces with compatible basepoints such that each Vₙ → Wₙ → Xₙ is a homotopy fibration sequence (Vₙ → hofib(Wₙ → Xₙ) over the basepoint is a weak equivalence), every Xₙ is connected, and the simplicial spaces are good (degeneracies closed cofibrations, automatic for realisations of multisimplicial sets), the sequence |V.| → |W.| → |X.| is a homotopy fibration sequence, the fibre identification being the canonical map into the homotopy fibre over the realised basepoint, so Ω|X.| → |V.| → |W.| → |X.| is one with the canonical connecting map. Either standard form may be adopted: Waldhausen 1978 (Algebraic K-theory of generalized free products, Lemma 5.2, as quoted in Weibel V.1.7) or Bousfield–Friedlander 1978 (Theorem B.4, for bisimplicial sets, with the π∗-Kan condition and the π₀ fibration condition, both implied when every Xₙ and Wₙ is connected); the locators are the red team's and verifier's and were not re-read here. This is neither the diagonal lemma nor the levelwise-equivalence theorem H.2 already plans, and it must not be stated for arbitrary levelwise fibrations without the connectivity (or π∗-Kan) hypothesis. Consumer: K.4/delooping-and-the-spectrum, which verifies the hypotheses for n ↦ (|wS.C| → |wS.(Sₙf)| → |wS.(SₙB)|).

## Stage changes for maintainer integration

### K.2:low-degree-comparisons owns nothing and its stage text should say so

Every target this layer lists is owned by another roadmap, and AUDIT-28 names all four owners. The layer's real content is the combination: that the plus comparison of K.2:plus turns those three identifications into statements about the K-groups defined here, and that one of the four, Matsumoto's presentation, is field-specific while the others are not. The stage text should be narrowed to that, with the four owners named in it, so that a reader is not led to plan the identifications here. Nothing is dropped: the layer keeps two nodes and four requests.

### The localisation theorems of K.3 and K.4 are different theorems and should stay apart

K.3's stage text warns against asserting localisation for arbitrary exact subcategories. This packet honours that by keeping Quillen's theorem, which is for a Serre subcategory of an abelian category, in K.3, and the Waldhausen theorem, which needs a cylinder functor with the cylinder axiom and saturation and extension for the larger class, in K.4. The two stage texts should each point at the other, because a reader who finds only one of them will be tempted to use it outside its hypotheses; that is exactly the error the K.3 text names.

### RT-AREA-ktheory-1/4: Waldhausen additivity and the relative S-fibration belong to K.4:construction

The atlas orders K.4:construction → H.5:S-delooping → K.4 but put Waldhausen additivity and the relative S-fibration in late K.4, although H.5:S-delooping's Ω-spectrum needs the deloopings they prove; K.4 also claimed 'the delooping theorem' that H.5:S-delooping proves, and the biexact K-pairing was planned both in H.5:S-delooping and in K.7. This packet now parents K.4/waldhausen-additivity and K.4/delooping-and-the-spectrum to K.4:construction and gives them the realisation input they need from H.2. The comparison with Q needs neither additivity nor the delooping, and the verifier's narrowing keeps late only the comparison results that need them, so the packet keeps K.4:construction/iS-versus-Q in the early part although the stage text lists the comparison among the late theorems.

Proposal: K.4:construction's text owns Waldhausen categories, the S-construction and its iteration, the K-theory space, the comparison with Q, Waldhausen additivity and the relative S-fibration with the iterated deloopings, and its handoff row matches. H.5:S-delooping imports K.4:construction and H.5:spectra and only assembles the connective Ω-spectrum; its integrated node's biexact-pairing clause moves to K.7, the single owner of K-theory products, while generic smash products stay in H.5:spectra. Late K.4 keeps the fibration and approximation theorems and Gillet–Waldhausen, and its text drops 'and the delooping theorem'. Edges: keep K.1 → K.4:construction and K.4:construction → H.5:S-delooping → K.4, now acyclic; add StableHomotopyKTheory:H.2 → K.4:construction; drop EnhancedDerivedSheaves:E5:abstract → K.4:construction and StableHomotopyKTheory:H.5:spectra → K.4:construction, which no K.4:construction node uses (enhanced and derived invariance keeps its own prerequisites in K.6 and K.7).

### RT-AREA-ktheory-1/20: early K.3 and a late K.3:cofinality

K.3 required all of K.4 although only its cofinality theorem uses Waldhausen theory, so every consumer of Quillen's 1973 theorems (K2SymbolsBrauer T.3:localization-comparison and T.5, ArithmeticKTheory N.2, SchemeKTheoryOperations S.3, KTheoryFiniteLocalFields L.1) inherited K.4, H.5 and the enhanced-category stages. In this packet early K.3 (the 3×3 lemma, the exact category of conflations, additivity, resolution with transfers and the degree-zero comparison with Tau Ceti's resolutionEquiv, dévissage and Serre-subcategory localisation) cites only K.1, StableHomotopyKTheory H.1 and H.2 and the pinned exact-category API; the general cofinality theorem needs the late fibration theorem and the S-versus-Q comparison.

Proposal: Drop the edge K.4 → K.3. Create K.3:cofinality after K.4, requiring K.4 and K.4:construction, and move K.3/cofinality-degree-zero-correction there with its id unchanged (the node records proposedParentStageId). Keep K.3 → T.3:localization-comparison, T.5, N.2, S.3 and L.1. Retain the dependency of K.5 on K.4 explicitly: add K.4:construction → K.5 and K.4 → K.5 (K.5/relative-K-theory uses the relative S-fibration, K.5/relative-versus-support the fibration and approximation theorems). The edges K.3 → K.5 and StableHomotopyKTheory:H.5:spectra → K.5 are used by no K.5 node.

### RT-AREA-ktheory-1/19 and 18: the early ring model and Milnor squares feed K.5

The ring model is one node, K.2/functorial-K-theory-of-a-ring, in K.2:plus, and K.5, K.6 and K.7 import it; K.2:plus no longer depends on the late exact-category cofinality, since its cofinality node uses group-completion cofinality from StableHomotopyKTheory H.4. K.5's Milnor-square nodes import KTheoryLowDegrees Z.1 (patching, boundary, K₀ exactness), U.1 and U.2 (elementary lifting and classical K₁), all upstream of K.5. They cannot import U.5 or U.6: U.5 cites SchemeKTheoryOperations S.3, which follows S.2 and K.6, and U.6 imports K.5's relative fibre, so either import would close a cycle.

Proposal: Add K.2:plus → K.5, KTheoryLowDegrees:Z.1 → K.5, KTheoryLowDegrees:U.1 → K.5 and KTheoryLowDegrees:U.2 → K.5; K.6 and K.7 require K.2:plus as well. The spectrum-level form of degree-one surjectivity for a Milnor square (Clausen–Mathew–Morrow, Proposition 4.34), which needs π₁ of the ring model to be GL/E (KTheoryLowDegrees U.6), must be placed after U.6, not in K.5 or K.6.

## Source discrepancies

`GeneralAlgebraicKTheory/E-double-origin`: Author chapter Kbook.V.pdf, Remark 3.4.2, p. V.22; version hashed in sourceVersions, read 2026-09-29

Use the affine plane with a double origin: glue two copies of Spec(k[x,y]) along the punctured plane. Then K₀(VB(X)) ≅ ℤ and G₀(X) ≅ K₀(Perf(X)) ≅ ℤ². The cited II.8.2.4 explicitly assumes dimension n ≥ 2, and II.Ex.9.10(d) uses the plane.

The line has a nontrivial Picard group: transition units k[t,t⁻¹]× modulo the two copies of k[t]× give Pic(X) ≅ ℤ. Rank and determinant show that the class of a nontrivial line bundle cannot equal the class of O_X, so K₀(VB(X)) cannot be just the rank group ℤ. The plane is the actual example in both of the cited chapter-II locations. The equivalence of vector-bundle categories for the plane is quoted there from EGA IV(5.9); its proof is not claimed read or formalised here.

Scope/known correction: No correction located in the searches listed; novelty is not established. Scoped to the author chapter copy, not the published edition.

`GeneralAlgebraicKTheory/E-relative-S-proof-roles`: Author chapter Kbook.V.pdf, proof of Proposition 1.7, p. V.8; version hashed in sourceVersions, read 2026-09-30

For f : B → C with Sn f = Sn B ×_{Sn C} Sn+1 C as in IV.8.5.3, Sn f is equivalent to the extension category E(C, Sn f, Sn B) of Sn B by C; (s, q) : wS.(Sn f) → wS.C × wS.(Sn B) is a homotopy equivalence; the degreewise fibration sequences are |wS.C| → |wS.(Sn f)| → |wS.(Sn B)|, with Xn = |wS.C| for all n. Realising these gives the sequence Ω|wS.(S.B)| → |wS.C| → |wS.(S.f)| → |wS.(S.B)| that the proposition states.

In IV.8.5.3 an object of Sn f is a pair (B∗, C∗) with f(B∗) = ∂0 C∗, the subcategory C sits inside Sn f as the objects (0, C = ··· = C), and the exact projection is Sn f → Sn B; so the sub term of the extension is C and the quotient term Sn B. With the roles as printed the realisation would be Ω|wS.(S.C)| → |wS.B| → |wS.(S.f)| → |wS.(S.C)|, contradicting the displayed statement and Exercise V.1.7, which identifies the first map as the one induced by f : B → C.

Scope/known correction: No correction located in the searches listed; novelty is not established. Scoped to the author chapter copy, not the published edition.

`GeneralAlgebraicKTheory/E-cofinality-saturated`: Author chapter Kbook.IV.pdf, Waldhausen Cofinality 8.9, p. IV.72, and Kbook.V.pdf, Corollary 2.3.1, p. V.15; versions hashed in sourceVersions, read 2026-09-30

Both statements need B to be saturated as well as cofinal: 'If B is a saturated, cofinal Waldhausen subcategory' and 'Let B be a saturated, cofinal Waldhausen subcategory'.

Taken from the author's own correction list, which amends GSM 145 p.372 (IV.8.9), p.417 (V.2.3.1), p.180 (II.9.4) and p.189 (Ex. II.9.14) in this way; the packet did not re-derive the necessity of the hypothesis. The packet uses 8.9 only through the proof of Cofinality 6.4.1 for exact categories, whose weak equivalences are the isomorphisms and hence saturated, so no statement of the packet is affected.

Scope/known correction: Corrected in the author's errata list for The K-book (AMS Graduate Studies in Mathematics 145, 2013), as preserved in the Wayback Machine capture of 2 December 2014 of Kbook.errata.pdf; the corrections are given against the published pagination and the author chapter files read here still carry the uncorrected text.
