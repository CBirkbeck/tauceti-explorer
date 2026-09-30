# General algebraic K-theory: K.1–K.5

Checkpoint for FIX-RT-AREA-ktheory-1 by Codex, session codex-5ebb6f, 2026-09-29.

This document renders the companion packet. Its earlier accepted review is retained as history; the revised text awaits independent review. All implementation statuses remain unchecked. Source decompositions and proof obligations are separate from Lean completion.

KSpace(A) is ΩBQ(A), and K_n(A) is π_n KSpace(A) = π_(n+1) BQ(A). The early ring model belongs to K.2:plus. Waldhausen additivity and relative S-fibration precede H.5:S-delooping spectrum assembly. The proposed late K.3:cofinality stage and other stage-graph edits still require maintainer integration.

## Pinned imports

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

- `mathlib:CategoryTheory.Core` — The maximal subgroupoid of a category, the groupoid of isomorphisms that the plus comparison localises. (`Mathlib/CategoryTheory/Core.lean`).
- `mathlib:CategoryTheory.Idempotents.Karoubi` — The idempotent completion, the standard witness that cofinality changes the group in degree zero. (`Mathlib/CategoryTheory/Idempotents/Karoubi.lean`).
- `mathlib:CategoryTheory.Limits.HasFilteredColimits` — Filtered colimits of categories, the input to K.1's colimit statement. (`Mathlib/CategoryTheory/Limits/Filtered.lean`).
- `mathlib:CategoryTheory.Limits.HasPushouts` — Pushouts, which the cofibration axioms of a Waldhausen category require along cofibrations. (`Mathlib/CategoryTheory/Limits/Shapes/Pullback/HasPullback.lean`).
- `mathlib:CategoryTheory.ObjectProperty.IsSerreClass` — Serre classes in an abelian category, the hypothesis of Quillen's localisation theorem; the localisation long exact sequence itself is absent. (`Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean`).
- `mathlib:CategoryTheory.nerve` — The nerve of a category, the first ingredient of the K-theory space. (`Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean`).
- `mathlib:HomotopyGroup` — The homotopy groups of a pointed space, the third; no K-theory space is built from these three at the pins. (`Mathlib/Topology/Homotopy/HomotopyGroup.lean`).
- `mathlib:LinearMap.ker_eq_range_of_comp_eq_id` — The complement is the image of the complementary idempotent, the other half. (`Mathlib/Algebra/Module/Submodule/Range.lean`).
- `mathlib:Module.Finite.base_change` — Base change preserves finite generation, the other half. (`Mathlib/RingTheory/TensorProduct/Finite.lean`).
- `mathlib:Module.Finite.exists_comp_eq_id_of_projective` — A finitely generated projective module is a retract of a finite free module, the module-theoretic half of K.2:plus's cofinality node. (`Mathlib/RingTheory/Finiteness/Projective.lean`).
- `mathlib:Module.Projective.tensorProduct` — Base change preserves projectivity, half of the scalar-extension node of K.2:plus. (`Mathlib/Algebra/Module/Projective.lean`).
- `mathlib:ModuleCat.extendScalars` — Extension of scalars between module categories, pinned between commutative rings; K.2:plus needs it along an arbitrary unital ring map. (`Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean`).
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
- `tauceti:TauCeti.finiteProjectiveModules` — Object property of finitely generated projective R-modules. Its full subcategory has an EssentiallySmall instance in this pinned file. (`TauCeti/Algebra/Category/ModuleCat/CartanMap.lean`).
- `tauceti:TauCeti.finiteProjectiveModulesExactStructure` — Existing exact structure on the full subcategory of finitely generated projectives; import this carrier rather than reconstruct it. (`TauCeti/Algebra/Category/ModuleCat/CartanMap.lean`).
- `tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split` — The induced exact structure is equal to the split structure. This is the input that makes arbitrary scalar extension exact on projectives. (`TauCeti/Algebra/Category/ModuleCat/CartanMap.lean`).
- `tauceti:TauCeti.finiteProjectiveModulesExactStructure_conflation_iff` — Conflations are exactly short exact sequences after inclusion in ModuleCat R. (`TauCeti/Algebra/Category/ModuleCat/CartanMap.lean`).
- `tauceti:TauCeti.ExactK0.of` — Existing object-class map to ExactK0; the π₁ comparison must preserve this map. (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`).
- `tauceti:TauCeti.ExactK0.of_conflation` — Existing conflation-additivity relation for the class map. (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`).
- `tauceti:TauCeti.ExactK0.liftEquiv` — Existing universal property: conflation-additive invariants are additive homomorphisms out of ExactK0. (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`).

## Source provenance

The source entries retain earlier workers’ read-section records. This checkpoint independently read the sections explicitly marked FIX-RT-AREA-ktheory-1 in the packet; it does not claim a fresh reading of every inherited proof.

- [The K-book: An introduction to algebraic K-theory, Chapter II: The Grothendieck group K_0](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf) — Author's online chapter file Kbook.II.pdf, 106 pages; chapter page numbers equal PDF page numbers.; SHA-256 `529ea8a5853e9fa55279e7ad79047155409b10847bd924b56f708f0950ebc607`.
- [The K-book: An introduction to algebraic K-theory, Chapter IV: Definitions of higher K-theory](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf) — Author's online chapter file Kbook.IV.pdf, 93 pages; chapter page numbers equal PDF page numbers.; SHA-256 `9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248`.
- [The K-book: An introduction to algebraic K-theory, Chapter V: The fundamental theorems of higher K-theory](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf) — Author's online chapter file Kbook.V.pdf, 90 pages; chapter page numbers equal PDF page numbers.; SHA-256 `52dcc8ee3a1764e5ea309c59f093ac8e2a1ea64f3b94bacc05e6a2b6125b1da8`.

## Declarations and proof obligations

### Exact categories and Quillen's category Q(A)

`GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction` · construction · parent `GeneralAlgebraicKTheory:K.1` · implementation unchecked

For an exact category A the category Q(A) has the objects of A; a morphism from A to B is an equivalence class of diagrams in which A is received by an admissible epimorphism out of a subobject of B and that subobject is an admissible monomorphism into B, two such diagrams being equivalent when an isomorphism between them is the identity on A and on B. Composition is by pullback of the two middle objects. Equivalently a morphism from A to B is an admissible subobject of B together with an admissible epimorphism from it onto A. Two kinds of morphism are distinguished, the admissible monomorphisms and the oppositely oriented admissible epimorphisms; both are closed under composition, every morphism factors as one of the second kind followed by one of the first, uniquely up to isomorphism, the morphisms from the zero object to B correspond to the admissible subobjects of B, and the isomorphisms of Q(A) correspond to the isomorphisms of A.

**Hypotheses.**

- Import TauCeti.ExactStructure on a preadditive category with a zero object and binary biproducts. Its ConflationClass supplies kernel–cokernel pairs, and its E0/E1/E2 fields and their duals supply exactly the composition and base/cobase-change axioms used by Q. A dictionary to Quillen’s redundant cancellation axiom is a separate proof obligation if that axiom is invoked; it is not an extra exact-structure carrier.
- The equivalence classes of the defining diagrams must form a set; this is guaranteed for a small exact category, and the next node says how a small model is chosen.
- Composition uses the pullback of an admissible epimorphism along an arbitrary map, which exists and is again an admissible epimorphism by the base-change axiom; this is where the exactness axioms are used.

**Proof outline.**

1. Define the morphisms as equivalence classes of the displayed diagrams and check that the relation is an equivalence relation.
2. Define composition by the pullback of the two middle objects and check, from the base-change axiom, that the resulting diagram is again of the required form.
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

**Prerequisites.** `tauceti:TauCeti.ExactStructure`, `tauceti:TauCeti.ExactK0`, `mathlib:CategoryTheory.nerve`

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

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`, `tauceti:TauCeti.ExactStructure.transport`, `tauceti:TauCeti.ExactK0.transportEquiv`, `tauceti:TauCeti.ExactK0.mapEquiv`

**Sources.**

- `Weibel.KBook.IV`: Definition 6.3.1 and the surrounding remark, p. IV.55. Functoriality and the independence of the model up to isomorphic functors, verbatim.

### The fundamental group of the Q-construction is the Grothendieck group

`GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0` · theorem · parent `GeneralAlgebraicKTheory:K.1` · implementation unchecked

For a small exact category the realisation of the nerve of Q(A) is a connected complex whose fundamental group at the zero object is the Grothendieck group of A; the element corresponding to the class of an object A is the based loop made of the two edges from the zero object to A, the admissible monomorphism and the oppositely oriented admissible epimorphism. The proof uses the maximal tree of all monomorphisms out of the zero object, and the inverse map is constructed from the universal property of the Grothendieck group, never by comparing cardinalities.

**Hypotheses.**

- A is a small exact category with a chosen zero object.
- The orientation of the loop is fixed once and for all as in the source, and every later comparison uses that orientation.
- The Grothendieck group is the one generated by the objects with a relation for each conflation, which is the pinned Tau Ceti group.

**Proof outline.**

1. Take the family of all morphisms out of the zero object as a maximal tree of the nerve, which is legitimate because each non-zero vertex occurs exactly once.
2. Read off the presentation of the fundamental group from the maximal tree: it is generated by the morphisms modulo the relation that the composite of two morphisms is the product.
3. Identify the generators with the classes of objects through the two-edge loop, and show that the relation coming from a conflation is exactly the additivity relation of the Grothendieck group.
4. Construct the inverse homomorphism from the universal property of the Grothendieck group, using the functor of the previous node that sends each inflation to the identity and each deflation to translation by the class of its kernel.
5. Check that the two homomorphisms are mutually inverse, which completes the proof without any counting argument.
6. Compare with the pinned Tau Ceti group on objects and on conflations.
7. Use ExactK0.liftEquiv to construct the inverse to the fundamental-group class map. Check both compositions on object classes and use the existing extensionality/universal property; the library has ExactK0 already but does not have this π₁(BQ) comparison.

**Acceptance.**

- The class of an object corresponds to the two-edge loop, with the orientation fixed here.
- The inverse map is built from the universal property, as the stage text demands; equality of cardinalities is not a proof.
- The relation coming from a conflation is the additivity relation, so the comparison is compatible with the pinned Tau Ceti presentation.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/Q-construction-universal-property`, `tauceti:TauCeti.ExactK0`, `mathlib:CategoryTheory.nerve`, `mathlib:SSet.toTop`, `mathlib:HomotopyGroup`, `tauceti:TauCeti.ExactK0.of`, `tauceti:TauCeti.ExactK0.of_conflation`, `tauceti:TauCeti.ExactK0.liftEquiv`

**Sources.**

- `Weibel.KBook.IV`: Proposition 6.2 with its proof, p. IV.54. The theorem, the representative of a class and the maximal-tree proof, verbatim.

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
- K.6 and K.7 — The nonconnective extension takes this connective theory as input, and the invariance and product statements are about it.
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

The K-groups of an exact category and of its opposite agree, since the two Q-categories are isomorphic; the direct sum of two exact categories is exact with Q of the sum the product of the Q-categories, so the K-groups of a finite product are the products of the K-groups; and the K-groups commute with filtered colimits of exact categories, because Q and the realisation both do. The direct sum makes the realisation a homotopy-commutative H-space, and the induced addition is the group operation.

**Hypotheses.**

- The products are finite; the colimits are over small filtering categories.
- For rings the colimit statement is applied to the categories of finitely generated projective modules, which requires the model by idempotent matrices to make the assignment a functor.
- The H-space structure is the one induced by the direct sum, and the identification with the group structure is part of the statement.

**Proof outline.**

1. Prove that Q of the opposite category is isomorphic to Q(A), and read off the first statement.
2. Prove that Q of a direct sum of exact categories is the product of the Q-categories and that the realisation preserves finite products, and read off the second.
3. Prove that Q commutes with filtered colimits and that the realisation does, and read off the third.
4. Record the ring instances of both statements.
5. Prove that the direct sum makes the realisation a homotopy-commutative H-space, and that the addition it induces on the homotopy groups is the group operation, using that the two inclusions are isomorphic to the identity.

**Acceptance.**

- The K-groups of a finite product of rings are the products of the K-groups.
- The K-groups of a filtered colimit of exact categories are the colimit of the K-groups.
- Infinite products are not claimed; only finite ones.
- The H-space addition agrees with the group operation on homotopy groups.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `mathlib:CategoryTheory.Limits.HasFilteredColimits`

**Sources.**

- `Weibel.KBook.IV`: Elementary properties 6.4, pp. IV.55 to IV.56. All three statements with their proofs, verbatim.

### Scalar extension of finitely generated projectives, without a flatness hypothesis

`GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality` · construction · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

For a unital ring homomorphism from A to B the functor sending a module to its extension of scalars carries finitely generated projective A-modules to finitely generated projective B-modules and split exact sequences to split exact sequences, with no flatness hypothesis: projectivity and finite generation are both preserved by base change, and a split exact sequence is carried to a split exact sequence by any additive functor whatever. The resulting exact functor between the categories of finitely generated projectives is what makes the K-theory of a ring a functor. Tau Ceti already has the category of finitely generated projectives with its exact structure, proved to be the split one, and the statement that every additive functor is exact for split structures; Mathlib has the two base-change statements. What is missing, and what this node builds, is the functor itself along an arbitrary unital ring map and the functoriality of K that follows.

**Hypotheses.**

- The ring map is unital and the rings need not be commutative; the extension of scalars is the tensor product over the source, taken on the correct side.
- No flatness is assumed. Flatness would be needed to preserve arbitrary exact sequences, and is not needed here because the exact structure on finitely generated projectives is the split one.
- The pinned Mathlib base-change statements for projectivity and for finite generation are stated for an algebra over a commutative ring; for an arbitrary unital ring map the corresponding statements are part of this node.
- Use the pinned finiteProjectiveModules R full subcategory, its EssentiallySmall instance, and finiteProjectiveModulesExactStructure_eq_split. Mathlib ModuleCat.extendScalars is cited only in its actual commutative scope; tensoring with the (S,R)-bimodule S for arbitrary unital noncommutative maps remains an explicit interface obligation, not a pinned claim.

**Proof outline.**

1. Record the pinned material: the exact category of finitely generated projectives with the proof that its exact structure is the split one, the preservation of projectivity and of finiteness under base change, and the fact that every additive functor is exact for split structures.
2. Construct the functor along an arbitrary unital ring map and prove that it lands in finitely generated projectives.
3. Prove that it is exact, which by the split structure needs only additivity, and record that this is where the absence of a flatness hypothesis comes from.
4. Prove functoriality in the ring map, up to the natural isomorphism of iterated tensor products, and deduce that the K-theory space and groups are functors on rings.
5. Record the extension of the same argument to the categories of all finitely generated modules, where flatness is genuinely needed, so that the contrast is visible.

**Acceptance.**

- Base change along any unital ring map induces an exact functor of the categories of finitely generated projectives, with no flatness hypothesis.
- Base change on all finitely generated modules is exact only under a flatness hypothesis; the two must not be confused.
- The induced maps of K-groups are functorial in the ring map.

**Prerequisites.** `mathlib:Module.Projective.tensorProduct`, `mathlib:Module.Finite.base_change`, `mathlib:ModuleCat.extendScalars`, `tauceti:TauCeti.ExactStructure.isConflationExact_split`, `tauceti:TauCeti.ExactStructure`, `tauceti:TauCeti.finiteProjectiveModules`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure_conflation_iff`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `projBaseChange` | data | The base-change functor on finitely generated projectives. |
| `projBaseChange_exact` | characterisation | It is exact, by additivity alone, for the split structure. |
| `projBaseChange_comp` | functoriality | Compatibility with composition of ring maps. |
| `KGroup.ringMap` | functoriality | The induced map of K-groups. |
| `projBaseChange_no_flat` | relation | No flatness hypothesis is needed here, unlike on all finitely generated modules. |

**Consumers.**

- K.2, the plus comparison — The comparison is asserted to commute with ring maps, which needs this functor.
- K.1, the elementary properties — The filtered-colimit statement for rings is applied to this functor.
- K.5 — Relative K-theory of a ring map is the homotopy fibre of the map this functor induces.

**Unit tests.**

- `no_flatness` (computation) — The functor is exact without any flatness hypothesis.
- `free_case` (computation) — It carries a finite free module to a finite free module of the same rank.
- `composition` (compatibility) — It is compatible with composition of ring maps.
- `modules_need_flat` (non-example) — On all finitely generated modules exactness does need flatness; a formalisation that dropped it there would be wrong.

**Sources.**

- `Weibel.KBook.IV`: Definition 6.3.2, p. IV.55. The definition of the K-theory of a ring and the transfer in the opposite direction, verbatim.
- `Weibel.KBook.IV`: Definition 6.3.3, p. IV.55. The flatness hypothesis where it is genuinely needed, on all finitely generated modules, verbatim; the contrast with finitely generated projectives is the point of this node.

### The extension category and the fibration over Q(A)

`GeneralAlgebraicKTheory:K.2:plus/extension-category-and-the-fibration` · construction · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

For an exact category A the EXTENSION CATEGORY has as objects the admissible exact sequences of A, with morphisms the equivalence classes of the displayed three-row diagrams. The functor to Q(A) sending a sequence to its quotient term is fibred, its fibre over the zero object is the groupoid of isomorphisms of A, and each fibre is symmetric monoidal with a faithful monoidal functor from that groupoid. Localising the fibre at that action and comparing gives a fibration from the localised groupoid through the localised fibre to a contractible category, and the localised extension category is itself contractible; these are the inputs to the plus-equals-Q theorem of the next node.

**Hypotheses.**

- A is a small exact category; for the contractibility statements A is split exact, that is every admissible exact sequence splits.
- The groupoid of isomorphisms acts on each fibre by direct sum on the sub and total terms, leaving the quotient term fixed.
- Split exactness is what makes the relevant category connected; without it the source records that it is not.

**Proof outline.**

1. Define the extension category with the source's morphisms and check that the three functors to A, taking the sub, total and quotient terms, are exact.
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
| `ExtCat.sub` | data | The sub-term functor. |
| `ExtCat.total` | data | The total-term functor. |
| `ExtCat.quot` | data | The quotient-term functor, which is the one fibred over Q(A). |
| `ExtCat.fibre_zero` | characterisation | The fibre over the zero object is the groupoid of isomorphisms. |
| `ExtCat.contractible` | characterisation | The extension category is contractible. |

**Consumers.**

- K.2:plus, the plus-equals-Q theorem — The theorem is proved by applying the fibration criterion to the localised extension category.
- K.3, additivity — Additivity is the statement that the sub-and-quotient functor out of the extension category is a homotopy equivalence, so the two layers share this object.
- K.4, the S-construction — The extension category is the second term of the S-construction, which is how the two constructions are compared.

**Unit tests.**

- `fibre_is_iso_groupoid` (degenerate) — The fibre over the zero object is the groupoid of isomorphisms.
- `split_needed` (non-example) — For a non-split exact category the comparison category is not connected, so the hypothesis cannot be dropped.
- `three_functors_exact` (computation) — The sub, total and quotient functors are exact.
- `not_directly_fibred` (non-example) — The fibration criterion does not apply to the extension category over Q(A) itself unless the category is zero; the localised functor must be used.

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

Every finitely generated projective module over a ring is a direct summand of a finite free module, so it has a complement whose sum with it is free, and that complement is again finitely generated projective. Consequently the category of finite free modules is cofinal in the finitely generated projectives, and the K-theoretic cofinality statement of K.3 applies: the higher K-groups of the two categories agree, while their zeroth groups need not. This is why the stable general linear group, which sees only free modules, detects the higher K-groups of a ring even when projectives are not free. Mathlib has the module-theoretic half and this node adds the K-theoretic consequence.

**Hypotheses.**

- The ring has a unit; the module is finitely generated and projective.
- The complement is the kernel of the surjection from the finite free module, which is finitely generated and projective because the surjection splits.
- The K-theoretic conclusion is only for the groups in positive degrees; in degree zero the free category has a proper subgroup in general.

**Proof outline.**

1. Record Mathlib's statement: a finitely generated projective module is a retract of a finite free module, with the two maps composing to the identity.
2. Deduce that the kernel of the retraction is the image of the complementary idempotent, hence finitely generated and projective, and that the sum of the module with it is free.
3. Conclude that the finite free modules are cofinal in the finitely generated projectives.
4. Apply the cofinality theorem of K.3 to get the agreement of the higher K-groups and the inclusion of the zeroth groups.
5. Record the non-example: the zeroth groups genuinely differ for a ring with a non-free projective, so the agreement may not be extended to degree zero.

**Acceptance.**

- Every finitely generated projective has a complement making the sum free.
- The higher K-groups of the free and of the projective categories agree; the zeroth ones need not.
- For a ring with a non-free finitely generated projective the zeroth groups differ, so the statement has content.

**Prerequisites.** `mathlib:Module.Finite.exists_comp_eq_id_of_projective`, `mathlib:LinearMap.ker_eq_range_of_comp_eq_id`, `GeneralAlgebraicKTheory:K.3/cofinality-degree-zero-correction`

**Sources.**

- `Weibel.KBook.IV`: Cofinality 6.4.1, p. IV.56. The K-theoretic cofinality statement this node applies, verbatim.

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

### Early functorial connective K-theory of unital rings

`GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring` · construction · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

For every unital, possibly noncommutative ring R, import P(R) = (TauCeti.finiteProjectiveModules R).FullSubcategory with its existing split exact structure and essentially small model. Set K(R) = ΩBQ(P(R)). Scalar extension along a unital map R → S induces K(R) → K(S), preserving identities and composition without flatness. In every n ≥ 0 the projection maps induce K_n(R × S) ≅ K_n(R) × K_n(S), and K_n commutes with filtered colimits of unital rings via descent of finite idempotent matrices. This early interface is independent of the plus comparison and nonconnective extension. Late K.7 imports it and proves only the additional enhanced/nonconnective statements.

**Hypotheses.**

- Unital associative rings and unital maps; commutativity is not a general hypothesis.
- Use small-model transport of the existing essentially small projective category.
- Filtered diagrams are small; finite idempotent matrices and their finitely many relations descend to a stage.

**Proof outline.**

1. Import the existing projective exact category and apply K.1 to its small model; construct the maps through scalar extension and prove identity/composition via tensor associativity and unit isomorphisms.
2. For R × S, use its central complementary idempotents to decompose each finitely generated projective module and produce an exact equivalence P(R × S) ≃ P(R) × P(S). Apply the generic category-product theorem from K.1.
3. For filtered colimits, use finite idempotent-matrix objects rather than pretend the literal category P(R) strictly commutes with colimits. Objects, morphisms and equalities use finite data and descend; then import the generic classifying-space/filtered-colimit theorem.
4. Leave the plus-comparison naturality to its comparison node. K.5 relative ring theory uses this already-defined K(R) and the actual map K(f).

**Acceptance.**

- The two projections R × S → R,S give the product isomorphism in degree zero and every higher degree.
- Identity and two composable ring maps give the same K-map as the corresponding tensor unit/associativity isomorphisms.
- ℤ → ℤ/2 induces exact scalar extension on the split projective category although it is not flat on all modules.
- An idempotent matrix over a filtered colimit and an equality between two maps descend at a sufficiently large stage.

**Prerequisites.** `GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality`, `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `KSpace.ofRing` | data | The K-theory space of a ring. |
| `KSpace.ofRing_map` | functoriality | The map induced by a ring homomorphism. |
| `KGroup.ofRing_prod` | compatibility | Compatibility with finite products of rings. |
| `KGroup.ofRing_colimit` | compatibility | Compatibility with filtered colimits of rings. |
| `KSpace.ofRing_map_id` | functoriality | The identity ring homomorphism induces the identity, with the small-model comparison. |
| `KSpace.ofRing_map_comp` | functoriality | Composition of unital ring maps induces composition of K-space maps up to the specified natural homotopy. |

**Consumers.**

- K.5 — Relative K-theory is the homotopy fibre of the map this functor induces.
- K.6 and K.7 — The nonconnective extension and the invariance statements are about this functor.
- The consumer roadmaps — Every roadmap that speaks of the K-theory of a ring imports this functor.

**Unit tests.**

- `product_ring` (computation) — The two projections R × S → R,S give the product isomorphism in degree zero and every higher degree.
- `scalar_identity_composition` (compatibility) — Identity and two composable ring maps give the same K-map as the corresponding tensor unit/associativity isomorphisms.
- `nonflat_projectives` (non-example) — ℤ → ℤ/2 induces exact scalar extension on the split projective category although it is not flat on all modules.
- `filtered_idempotent_descent` (computation) — An idempotent matrix over a filtered colimit and an equality between two maps descend at a sufficiently large stage.

**Sources.**

- `Weibel.KBook.IV`: Definition 6.3.2 and Elementary properties 6.4, pp. IV.55 to IV.56. The functor and the two compatibilities, verbatim.

### What the product description does not say

`GeneralAlgebraicKTheory:K.2/no-natural-product-splitting` · comparison · parent `GeneralAlgebraicKTheory:K.2` · implementation unchecked

The loop space of the realisation of Q of the finitely generated projectives over a ring is homotopy equivalent to the product of the discrete zeroth K-group with the plus construction on the classifying space of the stable general linear group. The equivalence is of spaces and depends on a choice of representative in each component. It is not an equivalence of infinite-loop spaces splitting the K-theory spectrum as a product, and the translations used to move between components are not natural in the ring. This node records the distinction as a non-example, because the product formula is exactly the kind of statement that is easy to over-read, and because the stage text names it.

**Hypotheses.**

- The ring is unital; the zeroth K-group is taken with its discrete topology.
- A choice of a finitely generated projective module in each class is made once and the equivalence depends on it.
- The infinite-loop structure on the left is the one coming from the S-construction of K.4 or from the group completion, and the statement is about that structure.

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

### The Additivity theorem

`GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories` · theorem · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

Let E be the exact category of admissible exact sequences of an exact category, with the three exact functors taking the sub, total and quotient terms. The sub-and-quotient functor from Q(E) to the product of two copies of Q(A) is a homotopy equivalence; equivalently, for a short exact sequence of exact functors the middle one induces the sum of the maps induced by the outer two, as maps of H-spaces and hence on all K-groups. Two corollaries follow at once: for an admissible filtration of an exact functor with exact quotients the induced map is the sum of the maps of the quotients, and for a bounded exact sequence of exact functors the alternating sum of the induced maps is zero. The same statement holds for Waldhausen categories, which is how K.4 uses it.

**Hypotheses.**

- The functors are exact and the sequences of functors are pointwise admissible exact sequences.
- For the filtration corollary the successive quotient functors must themselves be exact.
- The equivalence is of H-spaces, so the conclusion is an equality of maps of K-groups and not merely of their effect on classes.

**Proof outline.**

1. Reduce to the universal case, the extension category itself, and show that the total functor induces the sum of the sub and quotient functors.
2. Prove that the sub-and-quotient functor is a homotopy equivalence, using the comma-category criterion: each comma category has a full subcategory with an initial object which it is equivalent to by a pair of adjoints.
3. Record the two adjunctions explicitly, by pushout along the injective part and by pullback along the surjective part, since they are the content of the proof.
4. Deduce the filtration corollary by induction on the length of the filtration.
5. Deduce the alternating-sum corollary by induction on the length of the sequence.
6. Record the Waldhausen form of the same theorem, which K.4 uses, and that the source states both in one place.

**Acceptance.**

- For the split sequence of functors the theorem gives that the total functor induces the sum, which is the sanity check.
- The alternating sum of a bounded exact sequence of exact functors vanishes.
- A flasque category, one with an endofunctor carrying an object to the sum of itself with that endofunctor's value, has contractible K-theory by additivity; this is the Eilenberg swindle in this layer.
- The hypothesis that the quotient functors are exact cannot be dropped in the filtration corollary.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.2:plus/extension-category-and-the-fibration`

**Sources.**

- `Weibel.KBook.V`: Additivity Theorem 1.2 with its proof, p. V.2. The theorem and the first line of its proof, verbatim, in the form that covers exact and Waldhausen categories at once.
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
2. Prove the length-one case by factoring the inclusion of Q-categories through the full subcategory on the objects of P and applying the comma-category criterion twice, once with a contraction by natural transformations and once dually.
3. Assemble the general case from the filtration and the fact that K-theory commutes with the filtered colimit of the subcategories.
4. Record the instances: the finitely generated projectives inside the modules of finite projective dimension; for a regular noetherian ring the agreement of K and G; for a regular noetherian separated scheme the corresponding agreement.
5. Record the degree-zero comparison with the pinned Tau Ceti resolution theorem, which is proved only under the stronger hypothesis that every resolving object is projective for the exact structure, and say that the general statement here is what is missing.

**Acceptance.**

- For a regular noetherian ring the K-groups and the G-groups agree in every degree.
- The pinned Tau Ceti resolution isomorphism in degree zero is the special case in which every resolving object is projective; the general statement is not pinned.
- For X obtained by gluing two affine planes along the punctured plane, K₀(VB(X)) ≅ ℤ while G₀(X) ≅ K₀(Perf(X)) ≅ ℤ² (II.8.2.4 and II.Ex.9.10(d)). This tests the distinction between vector-bundle and perfect-complex models.
- For the doubled-origin affine line, gluing t^m produces Pic(X) ≅ ℤ, so rank and determinant forbid the assertion K₀(VB(X)) ≅ ℤ. Do not reuse V.3.4.2’s author-copy misprint as an acceptance test.

**Prerequisites.** `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `tauceti:TauCeti.ExactStructure.resolutionEquiv`, `tauceti:TauCeti.moduleResolutionEquiv`

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

**Prerequisites.** `GeneralAlgebraicKTheory:K.3/resolution-theorem`, `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`

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

1. Apply the comma-category criterion: it suffices that the comma category of the inclusion over each object is contractible.
2. Identify the comma category with the ordered set of layers whose quotient lies in the subcategory.
3. Reduce, using the finite filtration, to the case of an object whose quotient by a subobject lies in the subcategory.
4. Define the two maps on layers, intersecting both terms with the subobject and intersecting only the lower term, which are well defined because the subcategory is closed under subobjects and finite products, and use the natural transformations between them to contract.
5. Record the finite-length corollary: for an ambient category in which every object has finite length the K-groups are the direct sum over the simple objects of the K-groups of their endomorphism division rings.
6. Record the two standing instances and the source's statement that the Waldhausen analogue is an open problem.

**Acceptance.**

- For a nilpotent ideal in a noetherian ring the G-groups of the ring and of the quotient agree.
- The G-groups of the modules of finite length over a ring are the sum over the simple modules of the K-groups of the corresponding division rings.
- Additivity for filtrations does not prove this theorem, because the successive-quotient functors need not be exact.
- The source records that the analogue for Waldhausen categories is an open problem, so no such statement may be asserted.

**Prerequisites.** `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `tauceti:TauCeti.simpleClassBasis`

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
2. Apply the fibration criterion: it suffices that the base changes along morphisms of the quotient are homotopy equivalences and that the K-theory of the subcategory maps by a homotopy equivalence to the comma category over the zero object.
3. Reduce the first condition to the morphisms out of the zero object, using the factorisation of morphisms and the symmetry between a category and its opposite.
4. Prove the reduction in five steps, the source's Claims: the comma category is equivalent to the category of pairs whose structure map is an isomorphism; the kernel functor is a homotopy equivalence on the subcategory of epimorphic pairs; the inclusion of that subcategory is a homotopy equivalence; isomorphisms modulo the subcategory induce homotopy equivalences; and the whole is the filtered colimit of the pieces.
5. Read off the long exact sequence and its right-exact end in degree zero.
6. Record the boundary map in degree one and fix its sign convention here, since the later comparisons with tame symbols depend on it.
7. Record the Dedekind-domain corollary, whose proof also uses the resolution theorem and devissage.

**Acceptance.**

- The long exact sequence ends in the right-exact sequence of Grothendieck groups.
- The boundary from the first K-group of the quotient sends the class of an endomorphism invertible modulo the subcategory to the difference of the classes of its cokernel and kernel, with the sign fixed here.
- The statement is for abelian categories; it may not be quoted for an arbitrary exact subcategory.
- For a Dedekind domain the sequence relates the K-groups of the ring, of its fraction field and of its residue fields.

**Prerequisites.** `GeneralAlgebraicKTheory:K.3/devissage-theorem`, `GeneralAlgebraicKTheory:K.3/resolution-theorem`, `mathlib:CategoryTheory.ObjectProperty.IsSerreClass`

**Sources.**

- `Weibel.KBook.V`: Abelian Localization Theorem 5.1 with (5.1.1), p. V.35. The theorem and the sequence, verbatim.
- `Weibel.KBook.V`: Exercise 5.1, pp. V.37–38. The boundary map in degree one, verbatim; the source states it as an exercise and this packet fixes the sign here.

### Cofinality, with the correction in degree zero

`GeneralAlgebraicKTheory:K.3/cofinality-degree-zero-correction` · theorem · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For an exact subcategory closed under extensions and cofinal in an exact category, the realisation of the smaller Q-category is the covering space of the larger corresponding to the subgroup of the Grothendieck group; hence the K-groups agree in every positive degree, while the zeroth group of the subcategory is only a subgroup of that of the category. There is a Waldhausen form with a surjection from the Grothendieck group, giving a homotopy fibration onto the discrete quotient and a short exact sequence in degree zero. The idempotent completion is the standard example where the zeroth group genuinely changes: an exact category is cofinal in its idempotent completion and the positive K-groups agree, so no statement of agreement in degree zero may be made.

**Hypotheses.**

- The subcategory is exact, closed under extensions and cofinal, meaning every object of the ambient category has a complement making the sum lie in the subcategory.
- The Waldhausen form requires a cylinder functor satisfying the cylinder axiom, which K.4 defines.
- The degree-zero group of the subcategory is a subgroup of the ambient one, and the inclusion is generally proper.
- This is late cofinality content, provisionally housed under the existing K.3 id pending the maintainer’s K.3:cofinality split. ExactK0.ofLE_surjective compares exact structures on one category and does not prove cofinal-subcategory K₀ injectivity.

**Proof outline.**

1. State the exact-category form and record that the source proves a special case and reduces the general one to Waldhausen cofinality.
2. State the Waldhausen form with a surjection from the Grothendieck group and the resulting fibration onto the discrete quotient.
3. Read off the agreement of the positive K-groups and the short exact sequence in degree zero.
4. Record the idempotent completion example: the category is cofinal in its completion, the positive groups agree, and the zeroth group can change.
5. Record the free-versus-projective example, in which the free modules are cofinal in the finitely generated projectives but not strictly so, which is the instance the previous layer uses.

**Acceptance.**

- The positive K-groups of a cofinal subcategory closed under extensions agree with those of the ambient category.
- The zeroth group need not agree, and the idempotent completion is the standard witness.
- A statement of agreement in degree zero for a merely cofinal subcategory is false and may not be recorded.

**Prerequisites.** `GeneralAlgebraicKTheory:K.4/fibration-theorem`, `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`, `mathlib:CategoryTheory.Idempotents.Karoubi`

**Sources.**

- `Weibel.KBook.IV`: Cofinality 6.4.1, p. IV.56. The exact-category form, with the source’s own note that its general proof goes through the Waldhausen form, verbatim.
- `Weibel.KBook.V`: Cofinality Theorem 2.3, p. V.14. The Waldhausen form with the degree-zero correction, verbatim.

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
4. Identify the second term with the extension category and its three faces with the quotient, total and sub functors, which is the bridge to K.2 and K.3.
5. Define the subcategories of weak equivalences and check that they are preserved.
6. Record the warning as a non-example: a map that is objectwise a cofibration need not satisfy the latching condition, and a formalisation that defined the cofibrations objectwise would not have a category with cofibrations.

**Acceptance.**

- The zeroth and first terms are trivial and the second is the extension category.
- The three faces from the second term to the first are the quotient, the total and the sub functors.
- The cofibrations of the n-th term are given by the latching condition; the objectwise definition is a non-example.
- For an exact category the second term is the category of admissible exact sequences, which is K.2's extension category.

**Prerequisites.** `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`, `GeneralAlgebraicKTheory:K.2:plus/extension-category-and-the-fibration`

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
- K.4, additivity and the delooping — Both are statements about this simplicial category.
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

The K-theory space of a small Waldhausen category is the loop space of the realisation of the weak-equivalence S-construction, and its K-groups are the homotopy groups of that loop space, so the n-th K-group is the (n+1)-st homotopy group of the realisation. The fundamental group of the realisation is the Grothendieck group of the category, which fixes the indexing; the realisation is an H-space under coproduct, and the whole is in fact an infinite loop space obtained by iterating the construction.

**Hypotheses.**

- The category is small and Waldhausen; no extra axiom is needed for the definition.
- The basepoint is the trivial object of the zeroth term, whose realisation is a point.
- The infinite-loop structure comes from iterating the construction, and the identification of consecutive terms is the delooping theorem of K.4.

**Proof outline.**

1. Define the bisimplicial object and its realisation, and define the K-theory space as its loop space.
2. Prove that the fundamental group of the realisation is the Grothendieck group, by the presentation of the fundamental group of a simplicial space whose zeroth term is a point.
3. Define the K-groups with the stated shift and prove that they are abelian.
4. Record the H-space structure induced by the coproduct.
5. Record the iterated construction and the resulting infinite-loop structure, referring to the delooping theorem for the identification of consecutive terms.
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
| `WaldhausenCategory.infiniteLoop` | compatibility | The infinite-loop structure from the iterated construction. |

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
- `Weibel.KBook.IV`: Infinite Loop Structure 8.5.5, p. IV.69. The infinite-loop structure by iteration, verbatim.

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

**Prerequisites.** `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`, `StableHomotopyKTheory:H.2/quillen-theorem-a`, `StableHomotopyKTheory:H.2/quillen-theorem-b`

**Sources.**

- `Weibel.KBook.V`: Additivity Theorem 1.2 and Example 1.2.3, p. V.2. The theorem in the form that covers Waldhausen categories, and the suspension consequence, verbatim.

### Relative S-construction fibration and iterated delooping

`GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum` · theorem · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

For an exact functor f:B → C of small Waldhausen categories, construct S.f by the simplicial path-object pullback. There is a natural homotopy-fibration sequence Ω|wS.(S.B)| → |wS.C| → |wS.(S.f)| → |wS.(S.B)|. For f = id the relative path object is contractible, giving |wS.C| ≃ Ω|wS.(S.C)|. Iteration supplies these comparison maps and equivalences in every positive S-level. H.5:S-delooping imports these maps and assembles the connective Ω-spectrum; this node does not re-plan spectrum assembly or products. The initial |wC| → Ω|wS.C| is a group completion, not generally an equivalence.

**Hypotheses.**

- The categories are small Waldhausen categories and the functor is exact.
- The proof uses additivity in the cofibration-sequence-of-functors form, and the fibration criterion for simplicial spaces with connected terms.
- The relative K-theory space of the functor is the double loop space of the realisation of the relative construction, which is K.5's definition.
- The passage from termwise split fibrations to realization still requires the precise connected-base simplicial realization criterion. H.2 must provide its model and hypotheses; do not replace it by diagonal realization alone or claim this gap is closed.

**Proof outline.**

1. Define the relative construction as the pullback of the path object, and record that the path object is simplicially contractible.
2. Prove the fibration statement termwise, using additivity applied to the cofibration sequence of endofunctors that splits the relative term, and assemble by the realisation lemma.
3. Specialise to the identity, use the explicit path-object contraction, and iterate the natural equivalence on S.^nC for n ≥ 1. Export the comparison maps to H.5:S-delooping, which alone assembles the spectrum.
4. Record the non-example: the first map, from the realisation of the weak-equivalence subcategory to the loop space, is a group completion and not an equivalence.
5. Record the degree-minus-one consequence the source gives, that the first homotopy group of the relative realisation is the cokernel of the map of Grothendieck groups, which is where negative K-theory first appears.

**Acceptance.**

- For every n ≥ 1 the natural map |wS.^n C| → Ω|wS.^(n+1) C| is an equivalence; these are the maps the spectrum-assembly owner consumes.
- The first structure map is a group completion, not an equivalence.
- The first homotopy group of the relative realisation is the cokernel of the map of Grothendieck groups.

**Prerequisites.** `GeneralAlgebraicKTheory:K.4/waldhausen-additivity`, `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`

**Sources.**

- `Weibel.KBook.V`: Proposition 1.7 with its proof, p. V.8. Displayed sequence in Proposition 1.7, p. V.8. Its first term is looped; the earlier transcription omitted Ω.
- `Weibel.KBook.IV`: Infinite Loop Structure 8.5.5, p. IV.69. Natural delooping equivalence in IV.8.5.5, whose fibration input is V.1.7.

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

- The exact category is closed under kernels of surjections in an ambient abelian category, in the source's sense.
- The weak equivalences are the quasi-isomorphisms computed in the ambient abelian category, not chain homotopy equivalences.
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

**Prerequisites.** `GeneralAlgebraicKTheory:K.4/approximation-theorem`, `GeneralAlgebraicKTheory:K.4/fibration-theorem`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`

**Sources.**

- `Weibel.KBook.V`: Theorem 2.2 (Gillet-Waldhausen) with the opening of its proof, p. V.13. The theorem and the structure of its proof, verbatim.
- `Weibel.KBook.V`: Remark 2.2.1, p. V.14. The repaired statement without the closure hypothesis, verbatim.

### Relative K-theory as a homotopy fibre

`GeneralAlgebraicKTheory:K.5/relative-K-theory` · definition · parent `GeneralAlgebraicKTheory:K.5` · implementation unchecked

For a ring homomorphism the RELATIVE K-THEORY space is the homotopy fibre of the induced map of K-theory spaces, and the relative groups are its homotopy groups; they fit into a long exact sequence with the absolute groups, ending in the zeroth relative group mapping to the zeroth group of the source. All the relative groups, the zeroth one included, are abelian, because the functorial H-space structure on the K-theory space makes the fibre one. A pair consisting of a ring and a two-sided ideal is treated through the quotient map, and then the zeroth relative group is the zeroth K-group of the ideal and the first is the classical relative group. For an exact functor of Waldhausen categories the relative theory is the double loop space of the relative S-construction of K.4, and its sequence ends one step further, with the cokernel of the map of Grothendieck groups appearing as a first negative group.

**Hypotheses.**

- The rings are unital and the map is unital; for a pair the ideal is two-sided.
- The homotopy fibre is taken at the basepoint of the target, and the H-space structure used for the group laws is the functorial one.
- The Waldhausen version needs the relative S-construction and its fibration, which is K.4's theorem.

**Proof outline.**

1. Define the relative space as the homotopy fibre and the relative groups as its homotopy groups.
2. Record the long exact sequence and its end in degree zero.
3. Prove that every relative group is abelian, from the functorial H-space structure.
4. Define the relative theory of a pair through the quotient map and record the identifications in degrees zero and one with the classical relative groups.
5. Record the Waldhausen version, the double loop space of the relative S-construction, and the extra term at the end of its sequence.
6. Record what the pinned libraries have: Mathlib has the homotopy fibre of a map of complexes but no K-theory space, so nothing of this exists at the pins.

**Acceptance.**

- The relative groups are abelian in every degree, including degree zero.
- For a pair the zeroth relative group is the zeroth K-group of the ideal.
- The Waldhausen relative sequence has one more term than the ring one, the cokernel of the map of Grothendieck groups.
- The relative theory of the identity map is trivial.

**Prerequisites.** `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `relativeK` | data | The relative K-theory space of a ring map. |
| `relativeK.group` | data | The relative groups. |
| `relativeK.addCommGroup` | structure | Their abelian group structure, degree zero included. |
| `relativeK.les` | characterisation | The long exact sequence with the absolute groups. |
| `relativeK.ofPair` | example | The relative theory of a ring and an ideal, through the quotient map. |
| `relativeK.waldhausen` | relation | The Waldhausen relative theory and its extra term. |

**Consumers.**

- K.5, excision — Excision is the question of when the relative groups depend only on the ideal.
- K.6 — The extra term at the end of the Waldhausen sequence is the first negative K-group, which is where the nonconnective theory starts.
- K.7 — The products are asserted compatible with the relative groups.

**Unit tests.**

- `identity_map` (degenerate) — The relative theory of the identity is trivial.
- `degree_zero_pair` (computation) — For a pair the zeroth relative group is the zeroth K-group of the ideal.
- `abelian_in_degree_zero` (degenerate) — The zeroth relative group is abelian; it is a homotopy set made a group by the H-space structure, and that structure must be carried.
- `waldhausen_extra_term` (computation) — The Waldhausen relative sequence has the cokernel of the map of Grothendieck groups as an extra term.

**Sources.**

- `Weibel.KBook.IV`: Relative groups 1.11.1, p. IV.8. The definition, the sequence and the abelian-group statement, verbatim.
- `Weibel.KBook.IV`: Exercise 1.15, p. IV.16. The identification of the low relative groups for a pair, verbatim; the source states it as an exercise with hints and this packet records that.

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

### Noncommutative scalar-extension interface

Pinned ModuleCat.extendScalars has commutative hypotheses. For arbitrary unital ring maps R → S, construct the (S,R)-bimodule tensor functor, show it carries retracts of finite free modules to retracts of finite free modules, and transport split conflations. Record its unit and associativity natural isomorphisms before using it to define functorial K(R). The K-book IV.6.3.2 states this arbitrary-ring scope; the commutative pinned declaration alone does not discharge it.

## Requests to existing owners

- `StableHomotopyKTheory:H.4` — Group completion of a symmetric monoidal groupoid, the plus construction, the stable general linear group and the cofinal stabilisation argument. AUDIT-28 records H.4 as owning exactly the comparison K.2:plus needs, so this packet states the plus-equals-Q theorem and cites H.4 for the group-completion side rather than building it.
- `StableHomotopyKTheory:H.1` — The homotopy-theoretic apparatus the K.1 and K.3 proofs use: the classification of coverings by morphism-inverting functors, the comma-category criterion for a functor to be a homotopy equivalence, the fibration criterion, and the fact that a natural transformation gives a homotopy. Every proof step of this packet that invokes one of these names it.
- `StableHomotopyKTheory:H.5:S-delooping` — Assemble the connective spectrum from the relative S-construction maps and all-level delooping equivalences supplied by early K.4:construction. Spectrum assembly consumes that prefix; it is not a prerequisite of additivity or its relative-fibration proof. Generic smash products belong to H.5:spectra; K-theory-specific pairings belong to K.7.
- `KTheoryLowDegrees:U.6` — The identification of the first homotopy group of the plus construction with the quotient of the stable general linear group by its elementary subgroup, compatibly with determinant and transfer. K.2:low-degree-comparisons imports it by name and does not re-plan it.
- `KTheoryLowDegrees:Z.1` — Finitely generated projective modules as summands of finite free modules, with complements, scalar extension and the ring Grothendieck group. AUDIT-28 records Z.1 as owning these, and K.2:plus cites them.
- `K2SymbolsBrauer:T.1:plus` — The identification of the second K-group with the second homology of the stable elementary subgroup and with the second homotopy group of the K-theory space.
- `K2SymbolsBrauer:T.2:symbols` — Matsumoto's presentation of the second K-group of a FIELD by symbols. K.2:low-degree-comparisons states that it is field-specific and imports it from here.
- `K3BlochGroups:V.4` — Suslin's exact sequence relating the third K-group to the Bloch group, which is the explicit degree-three model K.2:low-degree-comparisons registers.
- `GeneralAlgebraicKTheory:K.6` — The nonconnective spectrum and the negative K-groups. K.4's delooping node produces the cokernel of a map of Grothendieck groups as a first negative group, and K.4's fibration theorem and K.5's support node both stop because a map of zeroth groups is not surjective; all three point at K.6, which is decomposed in the companion packet.
- `StableHomotopyKTheory:H.2` — RT-AREA-ktheory-1/15: a precise realization theorem for the simplicial homotopy-fibration diagram in V.1.7, with connected bases and the proper/cofibrant or bisimplicial Kan hypotheses of the chosen model. Prove homotopy fibres agree after realization and verify the hypotheses for nerves of wS.(S_n f). Waldhausen 1978 Lemma 5.2 is a source lead, not read or established by this checkpoint.

## Stage changes for maintainer integration

### K.2:low-degree-comparisons owns nothing and its stage text should say so

Every target this layer lists is owned by another roadmap, and AUDIT-28 names all four owners. The layer's real content is the combination: that the plus comparison of K.2:plus turns those three identifications into statements about the K-groups defined here, and that one of the four, Matsumoto's presentation, is field-specific while the others are not. The stage text should be narrowed to that, with the four owners named in it, so that a reader is not led to plan the identifications here. Nothing is dropped: the layer keeps two nodes and four requests.

### The localisation theorems of K.3 and K.4 are different theorems and should stay apart

K.3's stage text warns against asserting localisation for arbitrary exact subcategories. This packet honours that by keeping Quillen's theorem, which is for a Serre subcategory of an abelian category, in K.3, and the Waldhausen theorem, which needs a cylinder functor with the cylinder axiom and saturation and extension for the larger class, in K.4. The two stage texts should each point at the other, because a reader who finds only one of them will be tempted to use it outside its hypotheses; that is exactly the error the K.3 text names.

### Early exact-category theorems and late cofinality have different prerequisite closures

RT-AREA-ktheory-1/20: K.3 additivity, resolution, dévissage and abelian localisation require K.1 and H.1/H.2, not all of K.4. Keep those in early K.3. Introduce a late K.3:cofinality stage after K.4 for the general cofinality proof via Waldhausen localisation; move the cofinality node there while retaining its stable id. Add K.4 → K.5 and K.2:plus → K.5. RT-AREA-ktheory-1/4: move Waldhausen additivity and relative S-fibration to K.4:construction, followed by H.5:S-delooping assembly and late K.4 localisation/approximation/comparisons. Delete EDS E5:abstract and H.5:spectra as prerequisites of the early S-construction; it only needs the homotopy-realization foundation H.1/H.2. Raw atlas snapshots are immutable; the maintainer must apply these stage changes.

## Scoped source discrepancy

`GeneralAlgebraicKTheory/E-double-origin`: Author chapter Kbook.V.pdf, Remark 3.4.2, p. V.22; version hashed in sourceVersions, read 2026-09-29

Use the affine plane with a double origin: glue two copies of Spec(k[x,y]) along the punctured plane. Then K₀(VB(X)) ≅ ℤ and G₀(X) ≅ K₀(Perf(X)) ≅ ℤ². The cited II.8.2.4 explicitly assumes dimension n ≥ 2, and II.Ex.9.10(d) uses the plane.

The line has a nontrivial Picard group: transition units k[t,t⁻¹]× modulo the two copies of k[t]× give Pic(X) ≅ ℤ. Rank and determinant show that the class of a nontrivial line bundle cannot equal the class of O_X, so K₀(VB(X)) cannot be just the rank group ℤ. The plane is the actual example in both of the cited chapter-II locations. The equivalence of vector-bundle categories for the plane is quoted there from EGA IV(5.9); its proof is not claimed read or formalised here.

Scope/known correction: No correction located in the searches listed; novelty is not established. Scoped to the author chapter copy, not the published edition.
