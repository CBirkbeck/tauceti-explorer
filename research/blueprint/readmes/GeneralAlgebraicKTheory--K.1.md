# GeneralAlgebraicKTheory — K.1 to K.5

The blueprint for the first six layers of the roadmap: the Q-construction (K.1),
rings and the plus comparison with its two parts (K.2), the fundamental theorems
for exact categories (K.3), Waldhausen's S-construction with its construction
part (K.4) and the relative and nonunital theories (K.5). This document is
definitive; the packet `research/blueprint/packets/GeneralAlgebraicKTheory--K.1.json`
is its machine form and the suggested Lean file is a naming proposal, not an
implementation. The nonconnective extension (K.6) and the invariance and product
interfaces (K.7) are the companion packet `GeneralAlgebraicKTheory--K.6`.

Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## The sources

Three chapters of one book, all freely available and all hash-verified against
the reviewed integrated decomposition of this roadmap:

> Charles A. Weibel, *The K-book: An introduction to algebraic K-theory, Chapter II: The Grothendieck group K_0*. Author's online chapter file Kbook.II.pdf, 106 pages; chapter page numbers equal PDF page numbers.
> <https://www.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf>,
> SHA-256 `529ea8a5853e9fa55279e7ad79047155409b10847bd924b56f708f0950ebc607`, accessed 2026-09-24.

> Charles A. Weibel, *The K-book: An introduction to algebraic K-theory, Chapter IV: Definitions of higher K-theory*. Author's online chapter file Kbook.IV.pdf, 93 pages; chapter page numbers equal PDF page numbers.
> <https://www.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf>,
> SHA-256 `9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248`, accessed 2026-09-24.

> Charles A. Weibel, *The K-book: An introduction to algebraic K-theory, Chapter V: The fundamental theorems of higher K-theory*. Author's online chapter file Kbook.V.pdf, 90 pages; chapter page numbers equal PDF page numbers.
> <https://www.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf>,
> SHA-256 `52dcc8ee3a1764e5ea309c59f093ac8e2a1ea64f3b94bacc05e6a2b6125b1da8`, accessed 2026-09-24.

### Chapter II: what was read

- §9.1, 9.1.1, 9.1.2, 9.1.3 and 9.1.8, pp. II.87 to II.88: categories with cofibrations (W0 to W2), Waldhausen categories with the gluing axiom, the saturation axiom, the Grothendieck group of a Waldhausen category, an exact category as a Waldhausen category, and exact functors.
- §9.2 and 9.3, pp. II.89 to II.92, read for the complex and extension examples that K.4 uses.
- NOT read: the rest of the chapter, in particular §§1 to 8 on the Grothendieck group itself, which the other roadmaps and Tau Ceti's pinned ExactK0 own.

### Chapter IV: what was read

- §1.11.1 to 1.11.3 and Exercises 1.15 to 1.17, pp. IV.8 to IV.9 and IV.16: relative groups as homotopy fibres with their long exact sequence and abelian structure, absolute excision with the criteria of Suslin and Suslin-Wodzicki, suspension rings, and the identification of the low relative groups.
- §6, pp. IV.53 to IV.61: Definition 6.1 with 6.1.1, subobjects 6.1.2, Proposition 6.2 with its proof and 6.2.1, Definition 6.3 and 6.3.1 to 6.3.5, Elementary properties 6.4 and Cofinality 6.4.1.
- §7, pp. IV.61 to IV.65: Theorem 7.1, Corollary 7.2, Definition 7.3 with (7.3.1), and the exercises 7.6 to 7.10 that record the low-degree consequences. The proofs of Lemma 7.5, Proposition 7.6, Lemma 7.7 and Theorem 7.8 were read only in outline.
- §8, pp. IV.66 to IV.75: Definitions 8.1, 8.2 with the extension axiom 8.2.1, 8.3 with (8.3.0) and 8.3.1, Proposition 8.4 with its proof, Definition 8.5 with 8.5.1, the infinite loop structure 8.5.5, the cylinder functors 8.8, Waldhausen Cofinality 8.9 with 8.9.1, and the exercises 8.5 to 8.15.
- §10.1 to 10.4, pp. IV.79 to IV.80, read for the boundary with K.6 and not decomposed here.
- NOT read: §§2 to 5, 9, 11 and 12.

### Chapter V: what was read

- §1, pp. V.2 to V.10: the Additivity Theorem 1.2 with the opening of its proof, Corollary 1.2.1, Remark 1.2.2, Example 1.2.3, Proposition 1.7 with its proof, Proposition 1.8 with its proof, and 1.9 on flasque categories.
- §2, pp. V.12 to V.19: the Waldhausen Localization Theorem 2.1, the Gillet-Waldhausen Theorem 2.2 with the opening of its proof and Remark 2.2.1, the Cofinality Theorem 2.3 with its proof, the Approximation Theorem 2.4 with the opening of its proof, Remark 2.4.2, Changing cofibrations 2.5.1, the localisation sequences 2.6.1 to 2.6.3, the models 2.7.1 to 2.7.4 and Exercise 2.9.
- §3, pp. V.20 to V.30: the Resolution Theorem 3.1 with the opening of its proof, the transfer maps and base-change maps of 3.2 to 3.5, Example 3.5.3 on the projection formula, and Exercises 3.1 to 3.2.
- §4, pp. V.33 to V.34: the Devissage Theorem 4.1 with the opening of its proof, Open Problem 4.1.1, Corollary 4.2 and Applications 4.3 to 4.4.
- §5, pp. V.35 to V.38: the Abelian Localization Theorem 5.1 with (5.1.1) and the shape of its proof, Corollary 5.2, Open Problem 5.3 and Exercise 5.1.
- §7.1.1, p. V.52, for the caveat that the map of Grothendieck groups is not onto.
- NOT read: §§6, 8, 9 and 10, and the detailed proofs of 2.1, 2.4 and 5.1, which the source itself in part refers to Waldhausen for.

**Two originals could not be read here, and neither is cited.** Quillen's paper
and Waldhausen's were both downloaded and both hashes reproduce the values the
reviewed decomposition records, so they are the right files; but Quillen's text
layer drops every inter-word space and mangles the displayed formulas, and
Waldhausen's scan has no text layer at all — the whole 101-page file yields
three kilobytes, and none of it from the sections needed. This environment has
no renderer. So every locator in this packet is to a chapter of the K-book,
which proves the same theorems, and attributions to Quillen and to Waldhausen
are made as the K-book makes them. Two gaps record this with the exact pages to
read.

## Built on the reviewed decomposition

`data/decompositions/GeneralAlgebraicKTheory.json` carries an accepted
independent review of 15 September 2026. Twelve of its nodes cover these eight
stages, and every one is kept — refined to declaration granularity, given the
API outlines, unit tests and planets the protocol asks for, and with its
verified locators reused. Where this packet splits one of its nodes, the split
is along a declaration boundary: its Q-construction node becomes the
construction and its universal property; its resolution node becomes the theorem
and the transfers; its Waldhausen node becomes the categories, the
S-construction and the K-theory space.

## What the pinned libraries already have

`AUDIT-28` records K.1 and K.2 as *partly built* and the rest as *not built*.
Every claim was checked against the declaration index. Cited, never re-planned:

- `mathlib:CategoryTheory.Core` (`Mathlib/CategoryTheory/Core.lean`) — The maximal subgroupoid of a category, the groupoid of isomorphisms that the plus comparison localises.
- `mathlib:CategoryTheory.Idempotents.Karoubi` (`Mathlib/CategoryTheory/Idempotents/Karoubi.lean`) — The idempotent completion, the standard witness that cofinality changes the group in degree zero.
- `mathlib:CategoryTheory.Limits.HasFilteredColimits` (`Mathlib/CategoryTheory/Limits/Filtered.lean`) — Filtered colimits of categories, the input to K.1's colimit statement.
- `mathlib:CategoryTheory.Limits.HasPushouts` (`Mathlib/CategoryTheory/Limits/Shapes/Pullback/HasPullback.lean`) — Pushouts, which the cofibration axioms of a Waldhausen category require along cofibrations.
- `mathlib:CategoryTheory.ObjectProperty.IsSerreClass` (`Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean`) — Serre classes in an abelian category, the hypothesis of Quillen's localisation theorem; the localisation long exact sequence itself is absent.
- `mathlib:CategoryTheory.nerve` (`Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean`) — The nerve of a category, the first ingredient of the K-theory space.
- `mathlib:HomotopyGroup` (`Mathlib/Topology/Homotopy/HomotopyGroup.lean`) — The homotopy groups of a pointed space, the third; no K-theory space is built from these three at the pins.
- `mathlib:LinearMap.ker_eq_range_of_comp_eq_id` (`Mathlib/Algebra/Module/Submodule/Range.lean`) — The complement is the image of the complementary idempotent, the other half.
- `mathlib:Module.Finite.base_change` (`Mathlib/RingTheory/TensorProduct/Finite.lean`) — Base change preserves finite generation, the other half.
- `mathlib:Module.Finite.exists_comp_eq_id_of_projective` (`Mathlib/RingTheory/Finiteness/Projective.lean`) — A finitely generated projective module is a retract of a finite free module, the module-theoretic half of K.2:plus's cofinality node.
- `mathlib:Module.Projective.tensorProduct` (`Mathlib/Algebra/Module/Projective.lean`) — Base change preserves projectivity, half of the scalar-extension node of K.2:plus.
- `mathlib:ModuleCat.extendScalars` (`Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean`) — Extension of scalars between module categories, pinned between commutative rings; K.2:plus needs it along an arbitrary unital ring map.
- `mathlib:SSet.toTop` (`Mathlib/AlgebraicTopology/SingularSet.lean`) — The realisation of a simplicial set, the second ingredient.
- `mathlib:Unitization` (`Mathlib/Algebra/Algebra/Unitization.lean`) — The canonical unitisation of a nonunital ring with its universal property, exactly the unitisation K.5 specifies; nothing K-theoretic is built on it at the pins.
- `tauceti:TauCeti.ExactK0` (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`) — The Grothendieck group of an exact category, which the fundamental-group theorem of K.1 identifies with the first homotopy group of the Q-construction.
- `tauceti:TauCeti.ExactK0.mapEquiv` (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`) — Invariance of that group under an exact equivalence, likewise.
- `tauceti:TauCeti.ExactK0.ofLE_surjective` (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`) — The comparison of the Grothendieck groups of two exact structures on one category, which the audit records is NOT cofinality; K.3's cofinality node says so.
- `tauceti:TauCeti.ExactK0.transportEquiv` (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`) — Invariance of that group under the transport, the degree-zero form of the independence K.1 states in every degree.
- `tauceti:TauCeti.ExactStructure` (`TauCeti/CategoryTheory/Exact/ExactStructure.lean`) — Quillen exact structures on an additive category, with conflations and admissible monomorphisms and epimorphisms. This is the stated input of K.1 and it is fully built; the Q-construction is built ON it, not instead of it.
- `tauceti:TauCeti.ExactStructure.isConflationExact_split` (`TauCeti/CategoryTheory/Exact/Functor.lean`) — Every additive functor is conflation-exact for split exact structures. This is why scalar extension on finitely generated projectives needs no flatness hypothesis, which is what K.2:plus asks for.
- `tauceti:TauCeti.ExactStructure.resolutionEquiv` (`TauCeti/CategoryTheory/GrothendieckGroup/ProjectiveResolution.lean`) — The degree-zero resolution isomorphism, proved under the stronger hypothesis that every resolving object is projective; K.3 states the general theorem in every degree and cites this as the pinned special case.
- `tauceti:TauCeti.ExactStructure.transport` (`TauCeti/CategoryTheory/Exact/Equivalence.lean`) — Transport of an exact structure along an additive equivalence, the pinned half of K.1's small-model target.
- `tauceti:TauCeti.moduleResolutionEquiv` (`TauCeti/Algebra/Category/ModuleCat/CartanMap.lean`) — The instance of that isomorphism for modules with finite projective resolutions.
- `tauceti:TauCeti.simpleClassBasis` (`TauCeti/RepresentationTheory/GrothendieckGroup/SimpleBasis.lean`) — The Grothendieck group of finitely generated modules over an artinian ring is free on the simple classes, which is devissage in degree zero; K.3 states the theorem in every degree.

Absent at both pins, and therefore this blueprint's own work: `Q(A)` itself and
any K-theory space or K-group; the plus construction, `BGL(A)`, the stable
general linear group and its elementary subgroup; `K₁`, `K₂`, `K₃`, the
Steinberg group and the Bloch group; Waldhausen categories, the gluing axiom,
the S-construction and spectra; the localisation long exact sequence in any
degree; and relative K-theory.

## K.1 — The Q-construction and its smallness

Quillen's construction, the identification of its fundamental group with the
Grothendieck group, and the definition of the higher K-groups.

The exact-category input is **not** built here: Tau Ceti's `ExactStructure` is
complete and sorry-free, with conflations, admissible monomorphisms and
epimorphisms, transport along equivalences and worked instances. This layer
builds `Q(A)` on top of it.

**What the stage text insists on.** The inverse map in the fundamental-group
theorem must come from the universal property of the Grothendieck group.
Equality of the two groups' cardinalities is not a comparison, and the node
constructs the inverse from the universal property of `Q(A)` instead.

Coverage: **source_decomposed**.

Six nodes. The Q-construction with its morphisms as equivalence classes of spans, composition by pullback, representative independence, associativity and identities, the subobject description and the factorisation of every morphism; the universal property, which the source does not state as a numbered result and which this packet assembles from the factorisation and from the functor built in the proof of Proposition 6.2, saying so in the node; the small-model target, with Tau Ceti's pinned transport and degree-zero invariance cited and the higher-degree independence stated, natural in exact functors; the identification of the fundamental group with the Grothendieck group, with the inverse built from the universal property of that group as the stage text requires and with the loop orientation fixed once; the definition of the K-groups with the stage text's indexing, their abelian structure in every degree including zero, the independence of the zero object and the three standing instances; and the elementary properties, opposites, finite products and filtered colimits, with the H-space structure identified with the group law. Every target of the stage text has a node. The pinned exact-structure input is cited, never re-planned.

### Exact categories and Quillen's category Q(A)

`GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction` · *construction* · planet **The Q-construction**

For an exact category A the category Q(A) has the objects of A; a morphism from A to B is an equivalence class of diagrams in which A is received by an admissible epimorphism out of a subobject of B and that subobject is an admissible monomorphism into B, two such diagrams being equivalent when an isomorphism between them is the identity on A and on B. Composition is by pullback of the two middle objects. Equivalently a morphism from A to B is an admissible subobject of B together with an admissible epimorphism from it onto A. Two kinds of morphism are distinguished, the admissible monomorphisms and the oppositely oriented admissible epimorphisms; both are closed under composition, every morphism factors as one of the second kind followed by one of the first, uniquely up to isomorphism, the morphisms from the zero object to B correspond to the admissible subobjects of B, and the isomorphisms of Q(A) correspond to the isomorphisms of A.

**Hypotheses.**

- A is an exact category in the sense of Quillen: an additive category with a class of conflations satisfying the usual axioms, which is what the pinned TauCeti.ExactStructure records.
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

**API.**

| name | role | statement |
| --- | --- | --- |
| `QCat` | data | The category Q(A) attached to an exact structure. |
| `QCat.hom_equiv_subobject` | characterisation | A morphism is an admissible subobject together with an admissible epimorphism onto the source. |
| `QCat.inflation` | data | The morphism attached to an admissible monomorphism. |
| `QCat.deflation` | data | The oppositely oriented morphism attached to an admissible epimorphism. |
| `QCat.factor` | characterisation | Every morphism factors as a deflation followed by an inflation, uniquely up to isomorphism. |
| `QCat.hom_zero` | characterisation | Morphisms out of the zero object are the admissible subobjects. |
| `QCat.isoQ_equiv_iso` | relation | The isomorphisms of Q(A) are those of A. |
| `QCat.op` | compatibility | Q of the opposite exact category is isomorphic to Q(A). |

**Used by.**

- *K.1, the universal property* — The factorisation is exactly what makes a functor out of Q(A) determined by its values on the two kinds of morphism.
- *K.1, the K-groups* — The K-groups are the homotopy groups of the realisation of the nerve of this category.
- *K.3, all four fundamental theorems* — Each is proved by showing that a functor between Q-categories is a homotopy equivalence.
- *K.4, the comparison with the S-construction* — The comparison is a statement about this category.

**Unit tests.**

- `hom_from_zero` — Morphisms from the zero object to B are the admissible subobjects of B.
- `split_case` — For the split exact structure the admissible epimorphisms are the split surjections; the construction must not use arbitrary epimorphisms.
- `iso_correspondence` — The isomorphisms of Q(A) are those of A.
- `op_iso` — Q of the opposite category is isomorphic to Q(A), exchanging the two kinds of morphism.

**Sources.**

- Definition 6.1 with 6.1.1, p. IV.53, The construction with its composition, verbatim.

  > Definition 6.1. Let A be an exact category. A morphism from A to B in Q A is an equivalence class of diagrams A <<- B_2 >-> B where j is an admissible epimorphism and i is an admissible monomorphism in A. Two such diagrams are equivalent if there is an isomorphism between them which is the identity on A and B. The composition of the above morphism with a morphism B <<- C_2 >-> C is A <<- ...

- 6.1.2 (Subobjects) and the paragraph after it, p. IV.53, The subobject description and the two consequences, verbatim.

  > By definition, every morphism from A to B in Q A determines a unique admissible subobject of B in A. If we fix a representative for each subobject in A, then a morphism in Q A from A to B is a pair consisting of an admissible subobject B_2 of B and an admissible epi from B_2 onto A. In particular, this shows that morphisms from 0 to B in Q A are in 1-1 correspondence with admissible ...

- 6.1, the paragraph on the two distinguished kinds of morphism, p. IV.53, The factorisation, verbatim; it is what the universal property of the next node rests on.

  > Two distinguished types of morphisms play a special role in Q A: the admissible monics A >-> B (take B_2 = A) and the oppositely oriented admissible epis A <<- B (take B_2 = B). Both types are closed under composition, and the composition of A <<- B_2 with B_2 >-> B is the morphism (6.1.1). In fact, every morphism in Q A factors as such a composition in a way that is unique up to isomorphism.

### The universal property of Q(A)

`GeneralAlgebraicKTheory:K.1/Q-construction-universal-property` · *lemma*

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

**API.**

| name | role | statement |
| --- | --- | --- |
| `QCat.lift` | data | The functor out of Q(A) determined by the data. |
| `QCat.lift_inflation` | compatibility | Its value on an inflation. |
| `QCat.lift_deflation` | compatibility | Its value on a deflation. |
| `QCat.lift_unique` | characterisation | Uniqueness of the functor. |
| `QCat.map` | functoriality | The functor induced by an exact functor. |

**Used by.**

- *K.1, the fundamental group* — The comparison with the Grothendieck group is built with this property, not by counting.
- *K.1, functoriality of the K-groups* — Every map of K-groups in this roadmap comes from an exact functor through this lemma.

**Unit tests.**

- `exact_functor_induces` — An exact functor induces a functor of Q-categories.
- `determined_by_two_classes` — Two functors agreeing on inflations and deflations are equal.
- `bicartesian_needed` — Without the bicartesian condition the assignment is not functorial; the condition is not decorative.

**Sources.**

- 6.1, the factorisation, and 6.2, the proof, pp. IV.53 to IV.54, The factorisation this lemma turns into a universal property, and the use Weibel makes of it in the next node. Weibel does not state the universal property as a numbered result; the statement here is assembled from the factorisation and from the construction of the functor in the proof of Proposition 6.2, and the packet says so rather than attributing a numbered theorem to the source.

  > In fact, every morphism in Q A factors as such a composition in a way that is unique up to isomorphism. ... Let T denote the family of all morphisms 0 >-> A in Q A. Since each nonzero vertex occurs exactly once, T is a maximal tree.

### Small models, transport of the exact structure and independence

`GeneralAlgebraicKTheory:K.1/small-models-and-transport` · *comparison*

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

- Definition 6.3.1 and the surrounding remark, p. IV.55, Functoriality and the independence of the model up to isomorphic functors, verbatim.

  > Note that any exact functor F : A -> B induces a functor Q A -> Q B, hence maps BQ A -> BQ B and K_n(A) -> K_n(B). Thus the space K A = BQ A and all the groups K_n(A) are functors from exact categories and exact functors to spaces and abelian groups, respectively. Moreover, isomorphic functors induce the same map on K-groups, because they induce isomorphic functors Q A -> Q A'.

### The fundamental group of the Q-construction is the Grothendieck group

`GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0` · *theorem* · planet **The fundamental group of the Q-construction**

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

**Acceptance.**

- The class of an object corresponds to the two-edge loop, with the orientation fixed here.
- The inverse map is built from the universal property, as the stage text demands; equality of cardinalities is not a proof.
- The relation coming from a conflation is the additivity relation, so the comparison is compatible with the pinned Tau Ceti presentation.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/Q-construction-universal-property`, `tauceti:TauCeti.ExactK0`, `mathlib:CategoryTheory.nerve`, `mathlib:SSet.toTop`, `mathlib:HomotopyGroup`

**Sources.**

- Proposition 6.2 with its proof, p. IV.54, The theorem, the representative of a class and the maximal-tree proof, verbatim.

  > Proposition 6.2. The geometric realization BQ A is a connected CW complex with pi_1(BQ A) = K_0(A). The element of pi_1(BQ A) corresponding to A in K_0(A) is represented by the based loop composed of the two edges from 0 to A: (6.2.1) 0 >-> A ->> 0. Proof. Let T denote the family of all morphisms 0 >-> A in Q A. Since each nonzero vertex occurs exactly once, T is a maximal tree. By Lemma ...

### The K-groups of an exact category

`GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories` · *definition* · planet **The K-groups of an exact category**

For a small exact category the K-theory space is the realisation of the nerve of Q(A) and the K-groups are its homotopy groups shifted by one: the n-th K-group is the (n+1)-st homotopy group of that space at the zero object, for every non-negative n. The groups are abelian, including in degree zero, where the definition agrees with the Grothendieck group by the previous node. The space and the groups are functors from exact categories and exact functors to spaces and to abelian groups, and isomorphic exact functors induce the same maps. For a ring the K-groups are those of the exact category of finitely generated projective modules; for a noetherian ring the G-groups are those of the finitely generated modules; for a quasi-projective scheme the K-groups are those of the vector bundles.

**Hypotheses.**

- A is small, or has a set of isomorphism classes and is replaced by a small model as in the earlier node.
- The basepoint is a zero object, and the choice does not matter.
- The indexing is the one fixed here: the n-th K-group is the (n+1)-st homotopy group, so that degree zero is the fundamental group.

**Proof outline.**

1. Define the space as the realisation of the nerve and the groups as its homotopy groups with the stated shift.
2. Prove that the groups are abelian in every degree, in degree zero by the previous node and above by the standard argument for homotopy groups in degree at least two.
3. Prove functoriality from the universal property, and that isomorphic exact functors give the same maps.
4. Record the three standing instances: the finitely generated projective modules over a ring, the finitely generated modules over a noetherian ring, and the vector bundles on a quasi-projective scheme.
5. Record the two transfer maps the source attaches to these instances, for a ring map making the target finitely generated projective and for a finite ring map, and note that they are not part of this node's construction but of K.3's.
6. Record what is pinned: the nerve of a category, the realisation of a simplicial set and the homotopy groups of a pointed space all exist in Mathlib, and no K-theory space is built from them.

**Acceptance.**

- In degree zero the definition agrees with the Grothendieck group.
- The zero exact category has contractible K-theory, so all its groups vanish.
- For a ring the groups are those of the category of finitely generated projective modules, which is the definition every later layer uses.
- The groups of a category and of its opposite agree.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0`, `GeneralAlgebraicKTheory:K.1/small-models-and-transport`, `mathlib:CategoryTheory.nerve`, `mathlib:SSet.toTop`, `mathlib:HomotopyGroup`

**API.**

| name | role | statement |
| --- | --- | --- |
| `KSpace` | data | The K-theory space of a small exact category. |
| `KGroup` | data | The n-th K-group, the (n+1)-st homotopy group of that space. |
| `KGroup.addCommGroup` | structure | The abelian group structure, in every degree including zero. |
| `KGroup.map` | functoriality | The map induced by an exact functor. |
| `KGroup.map_of_natIso` | compatibility | Isomorphic exact functors induce the same map. |
| `KGroup.zero_eq_exactK0` | relation | In degree zero the group is the pinned Grothendieck group. |
| `KGroup.ofRing` | example | The K-groups of a ring, through the finitely generated projective modules. |

**Used by.**

- *Every later layer of this roadmap* — K.2 compares these groups with the plus construction, K.3 proves the fundamental theorems about them, K.4 compares them with the Waldhausen construction and K.5 makes them relative.
- *K.6 and K.7* — The nonconnective extension takes this connective theory as input, and the invariance and product statements are about it.
- *The consumer roadmaps* — ArithmeticKTheory, K2SymbolsBrauer, K3BlochGroups and the rest import these groups by name.

**Unit tests.**

- `degree_zero` — The zeroth group is the Grothendieck group.
- `zero_category` — The zero exact category has vanishing K-groups.
- `ring_case` — For a ring the groups are those of the finitely generated projective modules.
- `opposite` — The groups of a category and of its opposite agree.

**Sources.**

- Definition 6.3, p. IV.54, The definition and the agreement in degree zero, verbatim.

  > Definition 6.3. Let A be a small exact category. Then K A denotes the space BQ A, and we set K_n(A) = pi_n K A = pi_{n+1}(BQ A) for n >= 0. Proposition 6.2 shows that this definition of K_0(A) agrees with the one given in chapter II.

- Definitions 6.3.2 to 6.3.4, p. IV.55, The three standing instances, verbatim.

  > Definition 6.3.2. Let R be a ring with unit, and let P(R) denote the exact category of finitely generated projective R-modules. We set K(R) = K P(R) and define the K-groups of R by K_n(R) = K_n P(R). ... Definition 6.3.3. If R is noetherian, let M(R) denote the category of finitely generated R-modules. ... We set G(R) = K M(R). ... Definition 6.3.4. Similarly, if X is a scheme which is ...

### Elementary properties: opposites, finite products and filtered colimits

`GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups` · *theorem*

The K-groups of an exact category and of its opposite agree, since the two Q-categories are isomorphic; the direct sum of two exact categories is exact with Q of the sum the product of the Q-categories, so the K-groups of a finite product are the products of the K-groups, and in particular those of a finite product of rings are the products of theirs; and the K-groups commute with filtered colimits of exact categories, because Q and the realisation both do. The direct sum makes the realisation a homotopy-commutative H-space, and the induced addition is the group operation.

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

- Elementary properties 6.4, pp. IV.55 to IV.56, All three statements with their proofs, verbatim.

  > If A^op denotes the opposite category of A, then Q(A^op) is isomorphic to Q A, so we have K_n(A^op) = K_n(A). ... The product or direct sum of two exact categories is exact, and Q(A + A') = QA x QA'. Since the geometric realization preserves products, we have BQ(A + A') = BQA x BQA' and hence K_n(A + A') = K_n(A) + K_n(A'). For example, if R_1 and R_2 are rings then P(R_1 x R_2) = P(R_1) ...

## K.2 — Rings and the plus comparison (the aggregate)

The layer aggregates its two parts. Its own two nodes assemble the functor on
rings and fix the limits of the naturality claim.

**What the product description does not say.** `BQ P(R) ≃ K₀(R) × BGL(R)⁺` is a
homotopy equivalence of spaces, after choosing a representative in each
component. It is not a splitting of infinite-loop spaces, and the translations
between components are not natural in the ring — so a statement proved in the
zero component does not transport to the others for free.

Coverage: **source_decomposed**.

Two nodes of its own, aggregating its two parts. The first assembles the functor on rings from the scalar-extension node, records the finite-product and filtered-colimit statements in their ring form, and states exactly what the plus comparison is natural in: ring maps and block sum. The second is the non-example the stage text asks for by name: the product description of the K-theory space holds after a choice of component representatives, is not a splitting of infinite-loop spaces, and the translations between components are not natural, so a result proved in the zero component does not transport for free. The mathematical content of the layer is in its two parts, which are separately decomposed.

### The K-theory of a ring as a functor, and what the comparisons are natural in

`GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring` · *construction*

Putting the previous nodes together: the assignment of the K-theory space to a ring is a functor on unital rings and ring homomorphisms, through the base-change functor on finitely generated projectives; it carries finite products of rings to products and commutes with filtered colimits; and the plus comparison is natural for ring maps and for block sum. This node is the aggregate the stage text asks for, and it is also where the limits of the naturality claim are fixed: the space-level product description depends on a choice of component representatives, and the translations between components are not natural, so no naturality is asserted for them.

**Hypotheses.**

- The rings are unital and the maps are unital.
- Naturality is asserted for ring maps and for the block-sum operation, and for nothing else.
- The product description is at the level of spaces after a choice; the infinite-loop structure is not claimed to split.

**Proof outline.**

1. Assemble the functor from the base-change node and record its compatibility with composition.
2. Record the finite-product and filtered-colimit statements from the elementary properties of K.1, in their ring form.
3. State the naturality of the plus comparison in ring maps and in block sum.
4. State explicitly what is not claimed: naturality of the translations between components, and any product splitting of the infinite-loop structure.
5. Record the consequence for the low-degree comparisons: they are natural for ring maps because both sides are.

**Acceptance.**

- The K-theory of a finite product of rings is the product of the K-theories.
- The K-theory of a filtered colimit of rings is the colimit of the K-theories.
- The plus comparison commutes with ring maps and with block sum.
- Nothing is asserted about noncanonical translations between components.

**Prerequisites.** `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality`, `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`

**API.**

| name | role | statement |
| --- | --- | --- |
| `KSpace.ofRing` | data | The K-theory space of a ring. |
| `KSpace.ofRing_map` | functoriality | The map induced by a ring homomorphism. |
| `KGroup.ofRing_prod` | compatibility | Compatibility with finite products of rings. |
| `KGroup.ofRing_colimit` | compatibility | Compatibility with filtered colimits of rings. |
| `plusComparison_natural` | compatibility | Naturality of the plus comparison in ring maps and block sum. |

**Used by.**

- *K.5* — Relative K-theory is the homotopy fibre of the map this functor induces.
- *K.6 and K.7* — The nonconnective extension and the invariance statements are about this functor.
- *The consumer roadmaps* — Every roadmap that speaks of the K-theory of a ring imports this functor.

**Unit tests.**

- `product_ring` — The K-groups of a product of two rings are the product of the K-groups.
- `colimit_ring` — The K-groups of a filtered colimit are the colimit of the K-groups.
- `natural_in_ring_maps` — The plus comparison commutes with ring maps.
- `no_component_naturality` — No naturality is claimed for translations between components; a formalisation that asserted it would be claiming more than the source.

**Sources.**

- Definition 6.3.2 and Elementary properties 6.4, pp. IV.55 to IV.56, The functor and the two compatibilities, verbatim.

  > Definition 6.3.2. Let R be a ring with unit, and let P(R) denote the exact category of finitely generated projective R-modules. We set K(R) = K P(R). ... if R_1 and R_2 are rings then P(R_1 x R_2) = P(R_1) + P(R_2) and we have K_n(R_1 x R_2) = K_n(R_1) + K_n(R_2). ... Since geometric realization preserves filtered colimits, we have BQA = colim BQA_i and hence K_n(A) = colim K_n(A_i).

### What the product description does not say

`GeneralAlgebraicKTheory:K.2/no-natural-product-splitting` · *comparison*

The realisation of Q of the finitely generated projectives over a ring is homotopy equivalent to the product of the discrete zeroth K-group with the plus construction on the classifying space of the stable general linear group. The equivalence is of spaces and depends on a choice of representative in each component. It is not an equivalence of infinite-loop spaces splitting the K-theory spectrum as a product, and the translations used to move between components are not natural in the ring. This node records the distinction as a non-example, because the product formula is exactly the kind of statement that is easy to over-read, and because the stage text names it.

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

- Corollary 7.2, p. IV.62, The product description, verbatim. The source states a homotopy equivalence of spaces and nothing stronger; the warning of this node is that the stronger reading is not the source’s.

  > Corollary 7.2 (+ = Q). For every ring R, BQ P(R) is homotopy equivalent to K_0(R) x BGL(R)^+. Hence K_n(R) = K_n P(R) for all n >= 0.

## K.2:plus — The early ring/plus model

Scalar extension, the extension category, the plus-equals-Q theorem and
cofinality.

**Why no flatness hypothesis is needed.** The exact structure on `Proj_fg(A)` is
the split one — Tau Ceti proves this — and every additive functor is exact for
split structures, which Tau Ceti also proves. So base change is exact on
finitely generated projectives for any unital ring map. On *all* finitely
generated modules flatness is genuinely needed, and that contrast is a unit
test of the scalar-extension node.

Coverage: **source_decomposed**.

Four nodes. Scalar extension along an ARBITRARY unital ring map, with the absence of a flatness hypothesis explained rather than merely asserted: the exact structure on finitely generated projectives is the split one and Tau Ceti's pinned lemma says every additive functor is exact for split structures, while Mathlib's two base-change statements give that the functor lands in finitely generated projectives. The contrast with all finitely generated modules, where flatness is genuinely needed, is a unit test. Then the extension category with its fibred functor to the Q-construction and the contractibility statements, with split exactness as an explicit hypothesis and the source's own note that the fibration criterion does not apply to the extension category directly; the plus-equals-Q theorem with its ring corollary; and cofinality, with Mathlib's retract statement cited and the K-theoretic consequence stated in positive degrees only. The pinned category of finitely generated projectives is cited, never re-planned.

### Scalar extension of finitely generated projectives, without a flatness hypothesis

`GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality` · *construction*

For a unital ring homomorphism from A to B the functor sending a module to its extension of scalars carries finitely generated projective A-modules to finitely generated projective B-modules and split exact sequences to split exact sequences, with no flatness hypothesis: projectivity and finite generation are both preserved by base change, and a split exact sequence is carried to a split exact sequence by any additive functor whatever. The resulting exact functor between the categories of finitely generated projectives is what makes the K-theory of a ring a functor. Tau Ceti already has the category of finitely generated projectives with its exact structure, proved to be the split one, and the statement that every additive functor is exact for split structures; Mathlib has the two base-change statements. What is missing, and what this node builds, is the functor itself along an arbitrary unital ring map and the functoriality of K that follows.

**Hypotheses.**

- The ring map is unital and the rings need not be commutative; the extension of scalars is the tensor product over the source, taken on the correct side.
- No flatness is assumed. Flatness would be needed to preserve arbitrary exact sequences, and is not needed here because the exact structure on finitely generated projectives is the split one.
- The pinned Mathlib base-change statements for projectivity and for finite generation are stated for an algebra over a commutative ring; for an arbitrary unital ring map the corresponding statements are part of this node.

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

**Prerequisites.** `mathlib:Module.Projective.tensorProduct`, `mathlib:Module.Finite.base_change`, `mathlib:ModuleCat.extendScalars`, `tauceti:TauCeti.ExactStructure.isConflationExact_split`, `tauceti:TauCeti.ExactStructure`

**API.**

| name | role | statement |
| --- | --- | --- |
| `projBaseChange` | data | The base-change functor on finitely generated projectives. |
| `projBaseChange_exact` | characterisation | It is exact, by additivity alone, for the split structure. |
| `projBaseChange_comp` | functoriality | Compatibility with composition of ring maps. |
| `KGroup.ringMap` | functoriality | The induced map of K-groups. |
| `projBaseChange_no_flat` | relation | No flatness hypothesis is needed here, unlike on all finitely generated modules. |

**Used by.**

- *K.2, the plus comparison* — The comparison is asserted to commute with ring maps, which needs this functor.
- *K.1, the elementary properties* — The filtered-colimit statement for rings is applied to this functor.
- *K.5* — Relative K-theory of a ring map is the homotopy fibre of the map this functor induces.

**Unit tests.**

- `no_flatness` — The functor is exact without any flatness hypothesis.
- `free_case` — It carries a finite free module to a finite free module of the same rank.
- `composition` — It is compatible with composition of ring maps.
- `modules_need_flat` — On all finitely generated modules exactness does need flatness; a formalisation that dropped it there would be wrong.

**Sources.**

- Definition 6.3.2, p. IV.55, The definition of the K-theory of a ring and the transfer in the opposite direction, verbatim.

  > Definition 6.3.2. Let R be a ring with unit, and let P(R) denote the exact category of finitely generated projective R-modules. We set K(R) = K P(R) and define the K-groups of R by K_n(R) = K_n P(R). ... Let f : R -> S be a ring homomorphism such that S is finitely generated and projective as an R-module. Then there is a forgetful functor P(S) -> P(R) and hence a transfer functor.

- Definition 6.3.3, p. IV.55, The flatness hypothesis where it is genuinely needed, on all finitely generated modules, verbatim; the contrast with finitely generated projectives is the point of this node.

  > On the other hand, if S is flat as an R-module, the exact base change functor from M(R) to M(S) induces a covariant map.

### The extension category and the fibration over Q(A)

`GeneralAlgebraicKTheory:K.2:plus/extension-category-and-the-fibration` · *construction*

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

**API.**

| name | role | statement |
| --- | --- | --- |
| `ExtCat` | data | The extension category of an exact category. |
| `ExtCat.sub` | data | The sub-term functor. |
| `ExtCat.total` | data | The total-term functor. |
| `ExtCat.quot` | data | The quotient-term functor, which is the one fibred over Q(A). |
| `ExtCat.fibre_zero` | characterisation | The fibre over the zero object is the groupoid of isomorphisms. |
| `ExtCat.contractible` | characterisation | The extension category is contractible. |

**Used by.**

- *K.2:plus, the plus-equals-Q theorem* — The theorem is proved by applying the fibration criterion to the localised extension category.
- *K.3, additivity* — Additivity is the statement that the sub-and-quotient functor out of the extension category is a homotopy equivalence, so the two layers share this object.
- *K.4, the S-construction* — The extension category is the second term of the S-construction, which is how the two constructions are compared.

**Unit tests.**

- `fibre_is_iso_groupoid` — The fibre over the zero object is the groupoid of isomorphisms.
- `split_needed` — For a non-split exact category the comparison category is not connected, so the hypothesis cannot be dropped.
- `three_functors_exact` — The sub, total and quotient functors are exact.
- `not_directly_fibred` — The fibration criterion does not apply to the extension category over Q(A) itself unless the category is zero; the localised functor must be used.

**Sources.**

- Definition 7.3 with (7.3.1), p. IV.62, The extension category, verbatim.

  > Definition 7.3. Given an exact category A, we define the category EA as follows. The objects of EA are admissible exact sequences in A. A morphism from E' to E is an equivalence class of diagrams of the following form, where the rows are exact sequences in A. Two such diagrams are equivalent if there is an isomorphism between them.

- §7, the opening of the section, p. IV.61, The place where the source fixes the split-exactness hypothesis of this construction, verbatim.

  > unless A is a split exact category in the sense of II.7.1.2. Here is the main theorem of this section.

### The plus-equals-Q theorem

`GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q` · *theorem* · planet **The plus-equals-Q theorem**

For a split exact category with isomorphism groupoid S, the realisation of Q(A) is the realisation of the localisation of S at itself, so the K-groups of A are those of the symmetric monoidal groupoid S in every non-negative degree. For the finitely generated projective modules over a ring this gives that the realisation of Q is the product of the zeroth K-group with the plus construction on the classifying space of the stable general linear group, and hence that the K-groups defined from the Q-construction agree with those defined from the plus construction in every degree. The product description is a description of the space after choosing representatives of the components; it is not a claim that the infinite-loop structure splits as a product, and the translations between components are not natural.

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

- For every ring the realisation of Q of the finitely generated projectives is the product of the zeroth K-group and the plus construction, and the two definitions of the K-groups agree in every degree.
- The product description holds after choosing component representatives; no natural product splitting of infinite-loop spaces is claimed.
- The identification in degree one carries the class of an automorphism to its class in the first K-group of the isomorphism groupoid.

**Prerequisites.** `GeneralAlgebraicKTheory:K.2:plus/extension-category-and-the-fibration`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `StableHomotopyKTheory:H.4`

**Sources.**

- Theorem 7.1 and Corollary 7.2, pp. IV.61 to IV.62, The theorem and its ring corollary, verbatim.

  > Theorem 7.1 (Quillen). If A is a split exact category and S = iso A, then BQ A is homotopy equivalent to B(S^{-1}S). Hence K_n(A) = K_n(S) for all n >= 0. In fact, B(S^{-1}S) is the group completion of BS. ... Corollary 7.2 (+ = Q). For every ring R, BQ P(R) is homotopy equivalent to K_0(R) x BGL(R)^+. Hence K_n(R) = K_n P(R) for all n >= 0.

### Cofinality: a finitely generated projective has a complement making the sum free

`GeneralAlgebraicKTheory:K.2:plus/cofinality-of-projective-modules` · *lemma*

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

- Cofinality 6.4.1, p. IV.56, The K-theoretic cofinality statement this node applies, verbatim.

  > Cofinality 6.4.1. Let B be an exact subcategory of A which is closed under extensions in A, and which is cofinal in the sense that for every A in A there is an A' in A so that A + A' is in B. Then BQ B is homotopy equivalent to the covering space of BQ A corresponding to the subgroup K_0(B) of K_0(A) = pi_1(BQ A). In particular, K_n(B) = K_n(A) for all n > 0.

## K.2:low-degree-comparisons — The late low-degree comparison

A register, and deliberately nothing more. Every target of this layer is owned
by another roadmap:

| degree | model | owner |
| --- | --- | --- |
| 1 | `GL(A)/E(A)` | `KTheoryLowDegrees:U.6` |
| 2 | `H₂(E(A), ℤ)`, Steinberg | `K2SymbolsBrauer:T.1:plus` |
| 3 | Suslin's sequence, Bloch group | `K3BlochGroups:V.4` |
| — | Matsumoto's presentation | `K2SymbolsBrauer:T.2:symbols` |

What this layer owns is the *combination* — that the plus comparison turns the
three identifications into statements about the K-groups defined in K.1 — and
the rule that Matsumoto's presentation is **field-specific** while the other
three are unconditional for their stated ring class.

Coverage: **source_decomposed**.

Two nodes, and deliberately no more. AUDIT-28 records that every target of this layer is owned elsewhere: the first K-group by KTheoryLowDegrees U.6, the second by K2SymbolsBrauer T.1:plus, the third by K3BlochGroups V.4 and Matsumoto's presentation by K2SymbolsBrauer T.2:symbols. So the layer is a register: one node states the combination of the three identifications with the plus comparison and names the owner of each, and one node states the distinction the stage text makes, that the general identifications are unconditional for their ring class while Matsumoto's presentation is a theorem about fields. Each owner is filed as a request. Planning any of the four here would duplicate another roadmap, which the protocol forbids; the structural proposal asks that the stage text say so.

### The explicit models in degrees one, two and three

`GeneralAlgebraicKTheory:K.2:low-degree-comparisons/explicit-low-degree-models` · *comparison*

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

- Corollary 7.2 and Definition 6.3.2, pp. IV.55 and IV.62, The bridge this register rests on, verbatim; the low-degree identifications themselves are the other roadmaps’ statements and are not quoted from this source.

  > Corollary 7.2 (+ = Q). For every ring R, BQ P(R) is homotopy equivalent to K_0(R) x BGL(R)^+. Hence K_n(R) = K_n P(R) for all n >= 0. ... For n >= 1, agreement with the (nonfunctorial) +-construction definition 1.1.1 of K(R) will have to wait until section 7.

### Matsumoto's presentation is field-specific, and the other identifications are not

`GeneralAlgebraicKTheory:K.2:low-degree-comparisons/matsumoto-is-field-specific` · *comparison*

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

- §7, the opening and Corollary 7.2, pp. IV.61 to IV.62, The unconditional half, verbatim. Matsumoto’s theorem is in chapter III of the same book, which was not read for this job; it is imported from K2SymbolsBrauer and the packet does not quote it.

  > Theorem 7.1 (Quillen). If A is a split exact category and S = iso A, then BQ A is homotopy equivalent to B(S^{-1}S). ... Corollary 7.2 (+ = Q). For every ring R, BQ P(R) is homotopy equivalent to K_0(R) x BGL(R)^+.

## K.3 — Fundamental theorems for exact categories

Additivity, resolution with transfers, dévissage, Quillen's localisation and
cofinality.

**Two hypothesis boundaries the stage text names.** Localisation here is for a
Serre subcategory of an *abelian* category; the version for Waldhausen
categories, with its cylinder functor and its saturation and extension axioms,
is in K.4 and is a different theorem. And cofinality corrects only the positive
degrees: idempotent completion changes `K₀` while leaving `Kₙ` alone for
`n > 0`, so no agreement in degree zero may be stated.

Coverage: **source_decomposed**.

Six nodes, one per theorem the stage text lists, plus the transfers that the resolution theorem produces. Additivity in the form that covers exact and Waldhausen categories at once, with the two corollaries; the resolution theorem with the filtration reduction and the standing instances, citing Tau Ceti's pinned degree-zero version and saying exactly how its hypothesis is stronger; transfers with the projection formula and the source's own vanishing example as a test; devissage, with the reason additivity does not prove it and with the source's open problem for Waldhausen categories recorded so that no such statement is asserted; Quillen's localisation theorem for a Serre subcategory of an ABELIAN category, with the boundary in degree one and its sign fixed here, and with the stage text's warning honoured by keeping localisation for exact and Waldhausen categories in K.4 where the hypotheses are stated; and cofinality with the degree-zero correction, with the idempotent completion as the witness that the zeroth group changes.

### The Additivity theorem

`GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories` · *theorem* · planet **The Additivity theorem**

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

- Additivity Theorem 1.2 with its proof, p. V.2, The theorem and the first line of its proof, verbatim, in the form that covers exact and Waldhausen categories at once.

  > Additivity Theorem 1.2. Let F' >-> F ->> F'' be a short exact sequence of exact functors from B to C, either between exact categories or between Waldhausen categories. Then F_* is homotopic to F'_* + F''_* as H-space maps K(B) -> K(C), and therefore on the homotopy groups we have F_* = F'_* + F''_* : K_i(B) -> K_i(C). Proof of the Additivity Theorem. By universality of E, we may assume ...

- Corollary 1.2.1 and Proposition 1.8, pp. V.2 and V.9, The two corollaries with their proofs, verbatim.

  > then the alternating sum of the induced maps is 0 as maps from K_i(B) to K_i(C). Proof. This follows from the Additivity Theorem 1.2 by induction on n. ... In particular, F_* = sum of the (F_i/F_{i-1})_* : K_*(A) -> K_*(B). Proof. Apply the Additivity Theorem 1.2 to F_{i-1} >-> F_i ->> F_i/F_{i-1}, and use induction on n.

### The Resolution theorem

`GeneralAlgebraicKTheory:K.3/resolution-theorem` · *theorem* · planet **The Resolution theorem**

Let P be a full exact subcategory of an exact category H, closed under extensions and under kernels of admissible surjections in H, and suppose every object of H has a finite resolution by objects of P. Then the inclusion induces a homotopy equivalence of K-theory spaces and isomorphisms of all K-groups. The proof reduces to resolutions of length one by filtering H by the subcategories of objects with resolutions of bounded length, and the length-one case is handled by a comma-category argument. The standing instances are the finitely generated projectives inside the modules of finite projective dimension, and, for a regular noetherian ring, the finitely generated projectives inside all finitely generated modules, which gives the agreement of K-theory and G-theory.

**Hypotheses.**

- P is full in H, closed under extensions and under kernels of admissible surjections in H; finite resolutions exist for every object of H.
- Regular means noetherian with every finitely generated module of finite projective dimension; for the scheme statement separatedness is required and the source gives a non-separated counterexample in degree zero.
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
- For a non-separated scheme the scheme statement fails already in degree zero, so separatedness is not decorative.

**Prerequisites.** `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `tauceti:TauCeti.ExactStructure.resolutionEquiv`, `tauceti:TauCeti.moduleResolutionEquiv`

**Sources.**

- Resolution Theorem 3.1 with the opening of its proof, p. V.20, The theorem and the structure of its proof, verbatim.

  > Resolution Theorem 3.1. Let P be a full exact subcategory of an exact category H, such that P is closed under extensions and under kernels of admissible surjections in H. Suppose in addition that every object M of H has a finite P-resolution. Then K(P) is homotopy equivalent to K(H), and thus K_i(P) = K_i(H) for all i. The proof will reduce the theorem to the special case in which objects ...

### Transfer maps and the projection formula

`GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula` · *lemma*

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

- §3.5 and Example 3.5.3, pp. V.22 to V.23, The construction of the transfer and its functoriality, verbatim.

  > Note that if the ring S is finite over R then the forgetful functor M(S) -> M(R) is exact and induces a contravariant finite transfer map. ... By the Resolution Theorem 3.1, there is a natural map G(R) <- K(F) -> G(S), giving maps f_* : G_*(R) -> G_*(S). If g : S -> T is another map, and T has finite flat dimension over S, then the natural isomorphism shows that g_* f_* is homotopic to (gf)_*.

- §3.5, the projection formula, p. V.25, The proof of the projection formula, verbatim.

  > Thus it suffices to show that the projection formula holds when x is the class of E in P(f). ... The functor given by tensoring with the pullback is exact, and induces the map in question. Similarly, the exact functors sending F to its pushforward and to the tensor product with the pullback induce the other two maps.

### The Devissage theorem

`GeneralAlgebraicKTheory:K.3/devissage-theorem` · *theorem* · planet **The Devissage theorem**

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

- Devissage Theorem 4.1 with the opening of its proof, p. V.33, The theorem and the criterion its proof uses, verbatim.

  > Devissage Theorem 4.1. Let i : A in B be an inclusion of abelian categories such that A is an exact abelian subcategory of B and A is closed in B under subobjects and quotients. Suppose that every object B of B has a finite filtration by objects in B such that every subquotient lies in A. Then K(A) is homotopy equivalent to K(B) and K_*(A) = K_*(B). Proof. By Quillen's Theorem A, it ...

- Open Problem 4.1.1, p. V.33, The open problem, verbatim; it is why no Waldhausen form of this node exists in K.4.

  > Open Problem 4.1.1. Generalize the Devissage Theorem 4.1 to Waldhausen categories. Such a result should yield the above Devissage Theorem when applied to Ch^b(A).

### Quillen's localisation theorem for a Serre subcategory

`GeneralAlgebraicKTheory:K.3/abelian-localization-theorem` · *theorem* · planet **Quillen's localisation theorem**

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

- Abelian Localization Theorem 5.1 with (5.1.1), p. V.35, The theorem and the sequence, verbatim.

  > Abelian Localization Theorem 5.1. Let B be a Serre subcategory of a (small) abelian category A. Then K(B) -> K(A) -> K(A/B) is a homotopy fibration sequence. Thus there is a long exact sequence of homotopy groups (5.1.1) ... ending in K_0(B) -> K_0(A) -> K_0(A/B) -> 0, the exact sequence of II.6.4.

- Exercise 5.1, p. V.37, The boundary map in degree one, verbatim; the source states it as an exercise and this packet fixes the sign here.

  > 5.1 Suppose that alpha : A -> A is a morphism in A which is an isomorphism in A/B, giving a class in K_1(A/B). Show that the boundary map to K_0(B) is given by the difference of the classes of the cokernel and the kernel.

### Cofinality, with the correction in degree zero

`GeneralAlgebraicKTheory:K.3/cofinality-degree-zero-correction` · *theorem*

For an exact subcategory closed under extensions and cofinal in an exact category, the realisation of the smaller Q-category is the covering space of the larger corresponding to the subgroup of the Grothendieck group; hence the K-groups agree in every positive degree, while the zeroth group of the subcategory is only a subgroup of that of the category. There is a Waldhausen form with a surjection from the Grothendieck group, giving a homotopy fibration onto the discrete quotient and a short exact sequence in degree zero. The idempotent completion is the standard example where the zeroth group genuinely changes: an exact category is cofinal in its idempotent completion and the positive K-groups agree, so no statement of agreement in degree zero may be made.

**Hypotheses.**

- The subcategory is exact, closed under extensions and cofinal, meaning every object of the ambient category has a complement making the sum lie in the subcategory.
- The Waldhausen form requires a cylinder functor satisfying the cylinder axiom, which K.4 defines.
- The degree-zero group of the subcategory is a subgroup of the ambient one, and the inclusion is generally proper.

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

**Prerequisites.** `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `tauceti:TauCeti.ExactK0.ofLE_surjective`

**Sources.**

- Cofinality 6.4.1, p. IV.56, The exact-category form, with the source’s own note that its general proof goes through the Waldhausen form, verbatim.

  > Cofinality 6.4.1. Let B be an exact subcategory of A which is closed under extensions in A, and which is cofinal in the sense that for every A in A there is an A' in A so that A + A' is in B. Then BQ B is homotopy equivalent to the covering space of BQ A corresponding to the subgroup K_0(B) of K_0(A) = pi_1(BQ A). In particular, K_n(B) = K_n(A) for all n > 0. A special case of this is ...

- Cofinality Theorem 2.3, p. V.14, The Waldhausen form with the degree-zero correction, verbatim.

  > Cofinality Theorem 2.3. Let (A, v) be a Waldhausen category with a cylinder functor satisfying the cylinder axiom. Suppose that we are given a surjective homomorphism pi : K_0(A) -> G, and let B denote the full Waldhausen subcategory of all B in A with pi[B] = 0 in G. Then vS.B -> vS.A -> BG and its delooping K(B) -> K(A) -> G are homotopy fibrations. In particular, K_n(B) = K_n(A) for ...

## K.4:construction — The early S-construction

Waldhausen categories, `S₀C`, the K-theory space and the comparison with `Q`.

**The trap the stage text names.** The cofibrations of `SₙC` are *not* the
objectwise ones. A map is a cofibration when, for every `i < j < k`, the induced
map of cofibration sequences is a cofibration of `S₂C` — a latching condition on
the canonical maps out of the pushouts. Objectwise cofibrations do not in
general give the required pushouts, and the node carries that as a non-example.

Saturation, the extension axiom and the cylinder axiom are kept **outside** the
definition of a Waldhausen category, each named by the theorem that needs it.

Coverage: **source_decomposed**.

Four nodes. Waldhausen categories, with the three cofibration axioms and the gluing axiom in the definition and with saturation, the extension axiom and the cylinder axiom kept OUTSIDE it, each named by the theorem that uses it; the S-construction, with the faces, the degeneracies and the simplicial identities, the identification of the second term with the extension category, and the latching condition on its cofibrations stated as a hypothesis with the objectwise definition given as a non-example, which is exactly the stage text's warning; the K-theory space with the identification of the fundamental group that fixes the indexing, the H-space structure and the infinite-loop structure; and the comparison with the Q-construction, which records precisely which of its steps the source leaves as exercises and which it attributes to Waldhausen, whose paper the gaps record as unread.

### Categories with cofibrations, Waldhausen categories and their extra axioms

`GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories` · *definition* · planet **Waldhausen category**

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

**API.**

| name | role | statement |
| --- | --- | --- |
| `CategoryWithCofibrations` | structure | The three cofibration axioms. |
| `WaldhausenCategory` | structure | Cofibrations together with weak equivalences and the gluing axiom. |
| `WaldhausenCategory.IsSaturated` | data | The saturation axiom, as a separate hypothesis. |
| `WaldhausenCategory.HasExtensionAxiom` | data | The extension axiom, as a separate hypothesis. |
| `WaldhausenCategory.CylinderFunctor` | structure | A cylinder functor and its axiom. |
| `WaldhausenCategory.K0` | data | The Grothendieck group. |
| `WaldhausenCategory.ofExact` | example | An exact category as a Waldhausen category. |
| `WaldhausenCategory.exactFunctor` | data | Exact functors between Waldhausen categories. |

**Used by.**

- *K.4:construction, the S-construction* — The construction consumes exactly this data.
- *K.4, the fibration and approximation theorems* — Each names which of the three extra axioms it uses.
- *K.6 and K.7* — The nonconnective spectrum and the derived invariance statement are about the K-theory of a Waldhausen category.

**Unit tests.**

- `exact_is_waldhausen` — An exact category is a Waldhausen category with the stated structure.
- `K0_agrees` — Its Grothendieck group is that of the exact category.
- `unbounded_complexes_vanish` — The Grothendieck group of the unbounded complexes vanishes, so a definition that forgot boundedness would be wrong.
- `axioms_separate` — Saturation, extension and the cylinder axiom are independent extra hypotheses, not part of the definition.

**Sources.**

- Definition 9.1 with (W0) to (W2), p. II.87, The cofibration axioms, verbatim.

  > Definition 9.1. Let C be a category equipped with a subcategory co(C) of morphisms in a category C, called cofibrations. The pair (C, co) is called a category with cofibrations if the following axioms are satisfied: (W0) Every isomorphism in C is a cofibration; (W1) There is a distinguished zero object 0 in C, and the unique map 0 >-> A in C is a cofibration for every A in C; (W2) If A ...

- Definition 9.1.1 and Definition 9.1.2, pp. II.87 to II.88, The definition and the degree-zero invariant, verbatim.

  > Definition 9.1.1. A Waldhausen category C is a category with cofibrations, together with a family w(C) of morphisms in C called weak equivalences. Every isomorphism in C is to be a weak equivalence, and weak equivalences are to be closed under composition. In addition, the following Glueing axiom must be satisfied. ... Definition 9.1.2 (K_0 C). Let C be a Waldhausen category. K_0(C) is ...

- Extension axiom 8.2.1, p. IV.67, The extension axiom, verbatim.

  > Extension axiom 8.2.1. Suppose that f : E -> E' is a map between cofibration sequences. If the source and quotient maps of f are weak equivalences, so is the total map of f.

### Waldhausen's S-construction and the induced cofibrations

`GeneralAlgebraicKTheory:K.4:construction/S-construction` · *construction* · planet **Waldhausen's S-construction**

For a category with cofibrations, the n-th term of the S-construction is the category whose objects are sequences of n cofibrations together with a compatible choice of all subquotients, with morphisms the natural transformations of such diagrams; the zeroth and first terms are trivial and the second is the extension category, whose three face maps are the quotient, total and sub functors. The faces delete a row and a column and the degeneracies duplicate, and they are exact, so the terms form a simplicial category with cofibrations; taking the subcategories of weak equivalences gives a simplicial category whose realisation is the object of the next node. The cofibrations of the n-th term are NOT the objectwise ones: a map is a cofibration when for every triple of indices the induced map of cofibration sequences is a cofibration of the second term, which is a condition on the canonical maps out of the pushouts. The stage text's warning is exactly this, and this node states it as a hypothesis rather than a remark.

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

**API.**

| name | role | statement |
| --- | --- | --- |
| `SConstruction` | data | The n-th term of the S-construction. |
| `SConstruction.cofibration` | characterisation | The latching condition defining its cofibrations. |
| `SConstruction.face` | data | The face functors. |
| `SConstruction.degeneracy` | data | The degeneracy functors. |
| `SConstruction.simplicial` | compatibility | The simplicial identities. |
| `SConstruction.two_eq_ext` | relation | The second term is the extension category. |

**Used by.**

- *K.4:construction, the K-theory space* — The space is built from the weak-equivalence subcategories of these terms.
- *K.4, additivity and the delooping* — Both are statements about this simplicial category.
- *K.6* — The nonconnective spectrum applies this construction to a Frobenius pair.

**Unit tests.**

- `S2_is_extension` — The second term is the extension category of the ambient category.
- `faces_exact` — The faces and degeneracies are exact.
- `latching_not_objectwise` — A map that is objectwise a cofibration need not be a cofibration of the n-th term.
- `S1_trivial` — The first term is the ambient category and the zeroth is trivial.

**Sources.**

- Definition 8.3 with (8.3.0), p. IV.67, The construction, verbatim.

  > Definition 8.3. (S.C) If C is a category with cofibrations, let S_n C be the category whose objects A. are sequences of n cofibrations in C: 0 = A_0 >-> A_1 >-> A_2 >-> ... >-> A_n together with a choice of every subquotient A_ij = A_j/A_i. These choices are to be compatible in the sense that there is a commutative diagram. ... A morphism A. -> B. in S_n C is a natural transformation of sequences.

- Definition 8.3.1, p. IV.67, The faces and degeneracies, verbatim.

  > Definition 8.3.1. For each n >= 0, the exact functor from S_n C to S_{n-1} C is defined by deletion of the bottom row. ... For 0 < i <= n we define the exact functors by omitting the row and the column containing A_i and reindexing. Similarly, we define the exact functors from S_n C to S_{n+1} C by duplicating A_i.

- §8.3, the identification of the low terms, p. IV.67, The identification of the second term and its faces, verbatim.

  > S_0 C is trivial; the maps from S_2 C to C are the quotient, total and sub functors, respectively.

### The K-theory space of a Waldhausen category

`GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category` · *definition*

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

**API.**

| name | role | statement |
| --- | --- | --- |
| `WaldhausenCategory.KSpace` | data | The K-theory space. |
| `WaldhausenCategory.KGroup` | data | Its K-groups, with the stated shift. |
| `WaldhausenCategory.pi1_eq_K0` | characterisation | The fundamental group of the realisation is the Grothendieck group. |
| `WaldhausenCategory.KSpace_map` | functoriality | The map induced by an exact functor. |
| `WaldhausenCategory.hSpace` | structure | The H-space structure from the coproduct. |
| `WaldhausenCategory.infiniteLoop` | compatibility | The infinite-loop structure from the iterated construction. |

**Used by.**

- *K.4, every theorem of the layer* — Additivity, delooping, fibration and approximation are all statements about this space.
- *K.5* — The relative theory is the homotopy fibre of a map of these spaces.
- *K.6* — The nonconnective spectrum is built from this space applied to the iterated suspension of a Frobenius pair.

**Unit tests.**

- `pi1_is_K0` — The fundamental group of the realisation is the Grothendieck group.
- `exact_category_case` — For an exact category the groups agree with the Q-construction groups.
- `not_group_completion` — The map from the weak-equivalence subcategory is not a homotopy equivalence in general.
- `trivial_category` — The K-theory space of the zero Waldhausen category is contractible.

**Sources.**

- Proposition 8.4 and Definition 8.5, p. IV.68, The degree-zero identification and the definition, verbatim.

  > Proposition 8.4. If C is a Waldhausen category then pi_1 |wS.C| = K_0(C). ... Definition 8.5. If C is a small Waldhausen category, its algebraic K-theory space K(C) = K(C, w) is the loop space of |wS.C|. The K-groups of C are defined to be its homotopy groups: K_i(C) = pi_i K(C) = pi_{i+1} |wS.C| if i >= 0.

- Infinite Loop Structure 8.5.5, p. IV.69, The infinite-loop structure by iteration, verbatim.

  > Infinite Loop Structure 8.5.5. Lemma 8.5.4 implies that there are natural homotopy equivalences |wS.C| to |wS.S.C|, and of course K(C) is the double loop space of |wS.S.C|. In fact K(C) is an infinite loop space. To see this we just iterate the construction, forming the multisimplicial Waldhausen categories and the multisimplicial categories of their weak equivalences.

### Comparison of the S-construction with the Q-construction

`GeneralAlgebraicKTheory:K.4:construction/iS-versus-Q` · *comparison*

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

- §8.6 Exact Categories and Exercises 8.5 to 8.7, pp. IV.69 to IV.70 and IV.74, The comparison and the route, as the source gives them; the two middle steps are stated there as exercises, which this packet records rather than presenting them as proved.

  > Let A be an exact category, regarded as a Waldhausen category with isomorphisms as weak equivalences. ... Show that the Segal subdivision of the object simplicial set maps to the nerve of Q A, and that this map is a homotopy equivalence, so that |iS.A| is homotopy equivalent to BQ A.

## K.4 — Waldhausen's S-construction: the theorems

Additivity, the delooping, fibration, approximation and Gillet–Waldhausen.

**Where the connective theory runs out.** The delooping produces the cokernel of
`K₀(B) → K₀(C)` as `π₁` of the relative realisation — a first negative group —
and the fibration theorem's sequence stops because `K₀(R) → K₀(S⁻¹R)` is not
onto. Both point at K.6, which the companion packet decomposes.

**Quasi-isomorphisms are not chain homotopy equivalences.** Gillet–Waldhausen is
stated with quasi-isomorphisms computed in the ambient abelian category, and the
node says so in its hypotheses and again in its acceptance list.

Coverage: **source_decomposed**.

Five nodes. Additivity for Waldhausen categories, with the suspension consequence under the cylinder axiom; the relative construction, the delooping and the resulting spectrum, with the non-example that the FIRST structure map is a group completion and not an equivalence, and with the cokernel of the map of Grothendieck groups appearing as the first negative group, which is the bridge to K.6; the fibration theorem with all four of its hypotheses named as hypotheses and with the source's caveat that the sequence stops because the map of Grothendieck groups is not onto; the approximation theorem with the source's own counterexample showing the cylinder hypothesis necessary, and with the standard models it produces; and Gillet-Waldhausen, with the closure hypothesis, the repaired statement without it, and the warning that quasi-isomorphisms are not chain homotopy equivalences. The comparison with the Q-construction is in the construction part.

### Additivity for Waldhausen categories

`GeneralAlgebraicKTheory:K.4/waldhausen-additivity` · *theorem* · planet **Additivity for Waldhausen categories**

For a Waldhausen category the map from the weak-equivalence S-construction of the extension category to the product of two copies of that of the category, taking a cofibration sequence to its sub and quotient terms, is a homotopy equivalence. Equivalently, for a cofibration sequence of exact functors the middle induces the sum of the outer two. No saturation, extension or cylinder axiom is needed. This is the same theorem as K.3's additivity, stated for the larger class of categories, and the source proves both at once; with a cylinder functor satisfying the cylinder axiom it gives that the cone is null-homotopic and hence that suspension is a homotopy inverse on K-theory.

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

**Prerequisites.** `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`, `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`

**Sources.**

- Additivity Theorem 1.2 and Example 1.2.3, p. V.2, The theorem in the form that covers Waldhausen categories, and the suspension consequence, verbatim.

  > Additivity Theorem 1.2. Let F' >-> F ->> F'' be a short exact sequence of exact functors from B to C, either between exact categories or between Waldhausen categories. Then F_* is homotopic to F'_* + F''_* as H-space maps K(B) -> K(C). ... Example 1.2.3. Let C be a Waldhausen category with a cylinder functor. Then the definition of cone and suspension imply that the identity, the cone and ...

### The relative S-construction, the delooping and the spectrum

`GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum` · *theorem* · planet **The delooping theorem**

For an exact functor of Waldhausen categories the relative construction gives a homotopy fibration from the realisation of the target's S-construction through that of the source to that of the relative one; in the case of the identity functor this is the delooping: the realisation of the S-construction is the loop space of the realisation of the iterated one, so the iterated realisations form a spectrum, and the K-theory space is its zeroth space. The delooping is proved from additivity, and the resulting spectrum is the connective K-theory spectrum that K.6 takes as input. The first structure map, from the realisation of the weak-equivalence subcategory, is a group completion and is NOT an equivalence; only the later ones are.

**Hypotheses.**

- The categories are small Waldhausen categories and the functor is exact.
- The proof uses additivity in the cofibration-sequence-of-functors form, and the fibration criterion for simplicial spaces with connected terms.
- The relative K-theory space of the functor is the double loop space of the realisation of the relative construction, which is K.5's definition.

**Proof outline.**

1. Define the relative construction as the pullback of the path object, and record that the path object is simplicially contractible.
2. Prove the fibration statement termwise, using additivity applied to the cofibration sequence of endofunctors that splits the relative term, and assemble by the realisation lemma.
3. Specialise to the identity functor to obtain the delooping, and iterate to obtain the spectrum.
4. Record that the K-theory space is the zeroth space of that spectrum and that this is the infinite-loop structure of the previous layer.
5. Record the non-example: the first map, from the realisation of the weak-equivalence subcategory to the loop space, is a group completion and not an equivalence.
6. Record the degree-minus-one consequence the source gives, that the first homotopy group of the relative realisation is the cokernel of the map of Grothendieck groups, which is where negative K-theory first appears.

**Acceptance.**

- The realisation of the S-construction is the loop space of the iterated one, so the iterated realisations form a spectrum.
- The first structure map is a group completion, not an equivalence.
- The first homotopy group of the relative realisation is the cokernel of the map of Grothendieck groups.

**Prerequisites.** `GeneralAlgebraicKTheory:K.4/waldhausen-additivity`, `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`

**Sources.**

- Proposition 1.7 with its proof, p. V.8, The relative fibration with its proof from additivity, verbatim.

  > Proposition 1.7. If f : B -> C is an exact functor, the following sequence is a homotopy fibration: |wS.(S.B)| -> |wS.C| -> |wS.(S.f)| -> |wS.(S.B)|. Proof. Each category S_n f is equivalent to the extension category of B by S_n C. By 1.3.1, the map (s, q) is a homotopy equivalence. That is, the sequence is the product fibration termwise.

- Infinite Loop Structure 8.5.5, p. IV.69, The delooping and the spectrum, verbatim.

  > Lemma 8.5.4 implies that there are natural homotopy equivalences |wS.C| to |wS.S.C| ... In fact K(C) is an infinite loop space. To see this we just iterate the construction.

### The Waldhausen localisation (fibration) theorem

`GeneralAlgebraicKTheory:K.4/fibration-theorem` · *theorem* · planet **The fibration theorem**

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

- Waldhausen Localization Theorem 2.1, p. V.12, The theorem with all four hypotheses, verbatim.

  > Waldhausen Localization Theorem 2.1. Let A be a category with cofibrations, equipped with two categories of weak equivalences, v(A) inside w(A), such that (A, v) and (A, w) are both Waldhausen categories. In addition, we suppose that (A, w) has a cylinder functor satisfying the Cylinder Axiom, and that w(A) satisfies the Saturation and Extension Axioms. Then K(A^w) -> K(A, v) -> K(A, w) ...

- Theorem 2.6.3 and Caveat 7.1.1, pp. V.17 and V.52, The standing instance and the warning that motivates K.6, verbatim.

  > Theorem 2.6.3. If S is a central multiplicatively closed set in a ring R, there is a homotopy fibration K(R on S) -> K(R) -> K(S^{-1}R), and hence a long exact sequence ending in the exact sequence of II.9.8. ... Caveat 7.1.1. The map K_0(R) -> K_0(S^{-1}R) is not onto. Instead, the sequence continues with negative K-groups. In order to get a spectrum-level fibration, therefore, one needs ...

### The Approximation theorem

`GeneralAlgebraicKTheory:K.4/approximation-theorem` · *theorem* · planet **The Approximation theorem**

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

- Waldhausen Approximation Theorem 2.4 with its proof, p. V.15, The theorem with its three conditions and the first step of the proof, verbatim.

  > Waldhausen Approximation Theorem 2.4. Suppose that F : A -> B is an exact functor between saturated Waldhausen categories, satisfying the conditions: (a) A morphism f in A is a weak equivalence if and only if F(f) is a w.e. in B. (b) A has a cylinder functor satisfying the cylinder axiom. (c) The approximate lifting property (App) is satisfied. Then wS.A -> wS.B and K(A) -> K(B) are ...

- Changing cofibrations 2.5.1, p. V.16, The consequence about changing cofibrations, verbatim.

  > Changing cofibrations 2.5.1. (Hinich-Shektman). Let A be a saturated Waldhausen category with a cylinder functor, satisfying the cylinder axiom. Suppose that the cofibrations are enlarged so that the result is also a Waldhausen category. Then the two K-theories agree, by Waldhausen Approximation.

### The Gillet-Waldhausen comparison

`GeneralAlgebraicKTheory:K.4/gillet-waldhausen` · *theorem* · planet **The Gillet-Waldhausen comparison**

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

- Theorem 2.2 (Gillet-Waldhausen) with the opening of its proof, p. V.13, The theorem and the structure of its proof, verbatim.

  > Theorem 2.2 (Gillet-Waldhausen). Let A be an exact category, closed under kernels of surjections in an abelian category. Then the exact inclusion A in Ch^b(A) induces a homotopy equivalence K(A) -> K Ch^b(A). In particular, K_n(A) = K_n Ch^b(A) for all n. Proof. We will apply Waldhausen's Localization Theorem 2.1 to the following situation. For a <= b, let Ch^{a,b} denote the full ...

- Remark 2.2.1, p. V.14, The repaired statement without the closure hypothesis, verbatim.

  > by cofinality (IV.8.9), K(A) is homotopy equivalent to K(A') and K Ch^b(A) to K Ch^b(A'). Hence K(A) is homotopy equivalent to K Ch^b(A).

## K.5 — Relative and nonunital theories

The homotopy fibre, the distinction from support K-theory, the unitisation and
excision.

**Excision is conditional, and the counterexample is explicit.** Every nonunital
ring satisfies absolute excision for `K₀`. For `K₁` it holds exactly when
`I = I²`, so a square-zero ring fails it — that is the explanatory test the
stage text asks for. In general the criterion is the vanishing of the first `n`
Tor groups over the unitisation. No unconditional excision instance is created
anywhere in this packet.

Coverage: **source_decomposed**.

Four nodes. Relative K-theory as the homotopy fibre with its long exact sequence, the abelian structure of every relative group including the zeroth, the treatment of a pair through the quotient map, and the Waldhausen version with its extra term; the distinction from support K-theory, with both of the source's failure modes recorded, the non-surjectivity of the map of zeroth groups and the failure for a multiplicative set with zero divisors; the unitisation, which is Mathlib's pinned Unitization, with the comparison map to the relative theory of a pair; and excision, stated with the criteria the source quotes from Suslin and Suslin-Wodzicki, the degree-zero statement that holds always, the degree-one criterion that the ring equal its square, and the counterexample the stage text asks for, a square-zero ring, which fails excision for the first K-group. No unconditional excision instance is created anywhere in the packet.

### Relative K-theory as a homotopy fibre

`GeneralAlgebraicKTheory:K.5/relative-K-theory` · *definition* · planet **Relative K-theory**

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

**API.**

| name | role | statement |
| --- | --- | --- |
| `relativeK` | data | The relative K-theory space of a ring map. |
| `relativeK.group` | data | The relative groups. |
| `relativeK.addCommGroup` | structure | Their abelian group structure, degree zero included. |
| `relativeK.les` | characterisation | The long exact sequence with the absolute groups. |
| `relativeK.ofPair` | example | The relative theory of a ring and an ideal, through the quotient map. |
| `relativeK.waldhausen` | relation | The Waldhausen relative theory and its extra term. |

**Used by.**

- *K.5, excision* — Excision is the question of when the relative groups depend only on the ideal.
- *K.6* — The extra term at the end of the Waldhausen sequence is the first negative K-group, which is where the nonconnective theory starts.
- *K.7* — The products are asserted compatible with the relative groups.

**Unit tests.**

- `identity_map` — The relative theory of the identity is trivial.
- `degree_zero_pair` — For a pair the zeroth relative group is the zeroth K-group of the ideal.
- `abelian_in_degree_zero` — The zeroth relative group is abelian; it is a homotopy set made a group by the H-space structure, and that structure must be carried.
- `waldhausen_extra_term` — The Waldhausen relative sequence has the cokernel of the map of Grothendieck groups as an extra term.

**Sources.**

- Relative groups 1.11.1, p. IV.8, The definition, the sequence and the abelian-group statement, verbatim.

  > Relative groups 1.11.1. Given a ring homomorphism f : R -> R', let K(f) be the homotopy fiber of K(R) -> K(R'), and set K_n(f) = pi_n K(f). This construction is designed so that these relative groups fit into a long exact sequence. ... Using the functorial homotopy-commutative H-space structure on K(R), it follows that each K_n(f), including K_0(f), is an abelian group.

- Exercise 1.15, p. IV.16, The identification of the low relative groups for a pair, verbatim; the source states it as an exercise with hints and this packet records that.

  > 1.15 Let I be an ideal in R. Show that the group pi_0 K(R, I) of 1.11.1 is isomorphic to the group K_0(I), and that the maps agree with the maps of 1.11.1. ... Use Ex. III.2.7 to show that pi_1 K(R -> R/I) is isomorphic to the group K_1(R, I).

### Relative K-theory is not support K-theory

`GeneralAlgebraicKTheory:K.5/relative-versus-support` · *comparison*

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

- Theorem 2.6.3, p. V.17, The support fibration, verbatim.

  > Theorem 2.6.3. If S is a central multiplicatively closed set in a ring R, there is a homotopy fibration K(R on S) -> K(R) -> K(S^{-1}R), and hence a long exact sequence ending in the exact sequence K_0(R on S) -> K_0(R) -> K_0(S^{-1}R) of II.9.8.

- Caveat 7.1.1, p. V.52, Both failure modes, verbatim.

  > Caveat 7.1.1. The map K_0(R) -> K_0(S^{-1}R) is not onto. Instead, the sequence continues with negative K-groups. In order to get a spectrum-level fibration, therefore, one needs to use the nonconnective spectra K^B(R) of IV.10.4 to get nontrivial negative homotopy groups, or else replace K(S^{-1}R) with K(P), as we shall now do. ... we saw in Ex. 2.9 that the nonzerodivisor hypothesis is ...

### Nonunital rings, the unitisation and the comparison with the unital theory

`GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation` · *construction*

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

**API.**

| name | role | statement |
| --- | --- | --- |
| `nonunitalK` | data | The K-theory of a nonunital ring through its unitisation. |
| `nonunitalK.map` | functoriality | Functoriality in maps of nonunital rings. |
| `nonunitalK.compare` | data | The comparison map to the relative theory of a pair. |
| `nonunitalK.of_unital` | compatibility | Agreement with the usual theory for a unital ring. |
| `nonunitalK.unitization_pinned` | relation | The unitisation is Mathlib’s, with its universal property. |

**Used by.**

- *K.5, excision* — Excision is the statement that the comparison map is an isomorphism.
- *K.6* — The four axioms for negative K-theory are stated for nonunital rings, and the ideal axiom uses this construction.

**Unit tests.**

- `unital_case` — For a unital ring the construction agrees with the usual theory.
- `functorial` — It is functorial for maps of nonunital rings.
- `comparison_exists` — The comparison map exists for every unital ring containing the ring as an ideal.
- `no_excision_claimed` — The comparison map is not asserted to be an isomorphism; that is the next node’s hypothesis-laden statement.

**Sources.**

- Absolute Excision 1.11.2, p. IV.9, The unitisation and the comparison map, verbatim; the excision question itself is the next node.

  > A non-unital ring I is said to satisfy absolute excision for K_n if K_n(Z + I, I) -> K_n(R, I) is an isomorphism for every unital ring R containing I as an ideal; Z + I is the canonical augmented ring.

### Excision holds under hypotheses, and fails without them

`GeneralAlgebraicKTheory:K.5/excision-and-its-failure` · *theorem*

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

- Absolute Excision 1.11.2, p. IV.9, The definition, the degree-zero statement, the degree-one criterion, the general criterion and the notion of an H-unital ring, verbatim.

  > A non-unital ring I is said to satisfy absolute excision for K_n if K_n(Z + I, I) -> K_n(R, I) is an isomorphism for every unital ring R containing I as an ideal. By II, Ex. 2.3, every I satisfies absolute excision for K_0. By III, Remark 2.2.1, I satisfies absolute excision for K_1 if and only if I = I^2. I satisfies absolute excision for K_n if and only if the groups Tor_i^{Z+I}(Z, Z) ...

## Gaps

### Quillen's original paper could not be read in this environment

Needed by: `GeneralAlgebraicKTheory:K.1`, `GeneralAlgebraicKTheory:K.3`.

The scan at the address the reviewed decomposition records was downloaded and its SHA-256 reproduces that record, so it is the right file; but its text layer is an old optical recognition that drops every inter-word space and mangles the displayed formulas, and this environment has no renderer to read the pages as images. The paper was therefore NOT read and is NOT cited: every locator in this packet is to a chapter of the K-book, which proves all the same theorems, and attributions to Quillen are made as the K-book makes them. NEXT SOURCE ACTION: read Quillen, 'Higher algebraic K-theory: I', sections 2 to 5 (LNM 341, printed pp. 99 to 116), from page images or from a cleaner scan, and add its statements of Theorems 1 to 5 as second sources on the K.1 and K.3 nodes, where the K-book's proofs already stand.

### Waldhausen's original paper has no text layer at all

Needed by: `GeneralAlgebraicKTheory:K.4`, `GeneralAlgebraicKTheory:K.4:construction`.

The scan the reviewed decomposition records was downloaded and its SHA-256 reproduces that record. It is a pure image scan: the whole 101-page file yields three kilobytes of text, and no page of sections 1.3 to 1.5 yields any. It was therefore NOT read and is NOT cited. Everything K.4 states is decomposed from the K-book, which proves additivity, the delooping, the fibration theorem, approximation and cofinality in full or refers to Waldhausen for a step, and the nodes say which. The steps for which the K-book itself refers to Waldhausen are: the five-page simplicial proof of additivity, the identification of the subdivision of the S-construction with the Q-construction, and the details of the approximation theorem. NEXT SOURCE ACTION: read Waldhausen, 'Algebraic K-theory of spaces', sections 1.3 to 1.6 (printed pp. 328 to 350), from page images, and decompose those three arguments.

### Four steps of the plus-equals-Q proof were read only in outline

Needed by: `GeneralAlgebraicKTheory:K.2:plus`.

Theorem 7.1 and Corollary 7.2 were read in full, as were Definition 7.3 and the exercises that record the low-degree consequences. The proofs of Lemma 7.5, Proposition 7.6, Lemma 7.7 and Theorem 7.8, which occupy pp. IV.62 to IV.65 and contain the fibration argument itself, were read in outline only, so the proof steps of the extension-category node record the shape of the argument and not its details. NEXT SOURCE ACTION: read pp. IV.62 to IV.65 in full and decompose the four results, which will also settle how much of the argument needs the group-completion machinery that StableHomotopyKTheory H.4 owns.

### The detailed proofs of the fibration, approximation and abelian localisation theorems were not read

Needed by: `GeneralAlgebraicKTheory:K.4`, `GeneralAlgebraicKTheory:K.3`.

Theorem 2.1, Theorem 2.4 and Theorem 5.1 of chapter V were read as statements, with the opening of each proof and, for 5.1, the shape of the five-claim argument. Their full proofs, which occupy several pages each and which the source itself in part refers to Waldhausen for, were not read. The proof steps of those three nodes therefore record the strategy rather than the argument. NEXT SOURCE ACTION: read V.12 to V.17 and V.35 to V.37 in full.

### The excision criteria are quoted, not proved

Needed by: `GeneralAlgebraicKTheory:K.5`.

The criteria that excision in degree one is equivalent to the ring being idempotent, and that excision in degrees up to n is equivalent to the vanishing of the first n torsion groups over the unitisation, are quoted by the source from Suslin and from Suslin and Wodzicki without proof, and this packet quotes them the same way. The counterexample they yield, a square-zero ring, is therefore also conditional on them. NEXT SOURCE ACTION: read Suslin and Wodzicki, 'Excision in algebraic K-theory' (Annals 136, 1992), and Suslin's 1995 sequel, and decompose the proof of the criterion in degree one at least, which is the one the counterexample uses.

## Requests

- **`StableHomotopyKTheory:H.4`** — Group completion of a symmetric monoidal groupoid, the plus construction, the stable general linear group and the cofinal stabilisation argument. AUDIT-28 records H.4 as owning exactly the comparison K.2:plus needs, so this packet states the plus-equals-Q theorem and cites H.4 for the group-completion side rather than building it.

- **`StableHomotopyKTheory:H.1`** — The homotopy-theoretic apparatus the K.1 and K.3 proofs use: the classification of coverings by morphism-inverting functors, the comma-category criterion for a functor to be a homotopy equivalence, the fibration criterion, and the fact that a natural transformation gives a homotopy. Every proof step of this packet that invokes one of these names it.

- **`StableHomotopyKTheory:H.5:S-delooping`** — The statement that the iterated S-construction gives a connective spectrum after the delooping theorem. AUDIT-28 records this as duplicating K.4's delooping target; this packet proves the delooping and imports the spectrum-level statement.

- **`KTheoryLowDegrees:U.6`** — The identification of the first homotopy group of the plus construction with the quotient of the stable general linear group by its elementary subgroup, compatibly with determinant and transfer. K.2:low-degree-comparisons imports it by name and does not re-plan it.

- **`KTheoryLowDegrees:Z.1`** — Finitely generated projective modules as summands of finite free modules, with complements, scalar extension and the ring Grothendieck group. AUDIT-28 records Z.1 as owning these, and K.2:plus cites them.

- **`K2SymbolsBrauer:T.1:plus`** — The identification of the second K-group with the second homology of the stable elementary subgroup and with the second homotopy group of the K-theory space.

- **`K2SymbolsBrauer:T.2:symbols`** — Matsumoto's presentation of the second K-group of a FIELD by symbols. K.2:low-degree-comparisons states that it is field-specific and imports it from here.

- **`K3BlochGroups:V.4`** — Suslin's exact sequence relating the third K-group to the Bloch group, which is the explicit degree-three model K.2:low-degree-comparisons registers.

- **`GeneralAlgebraicKTheory:K.6`** — The nonconnective spectrum and the negative K-groups. K.4's delooping node produces the cokernel of a map of Grothendieck groups as a first negative group, and K.4's fibration theorem and K.5's support node both stop because a map of zeroth groups is not surjective; all three point at K.6, which is decomposed in the companion packet.

## Structural proposals

### K.2:low-degree-comparisons owns nothing and its stage text should say so

*note-duplicate-boundary*

Every target this layer lists is owned by another roadmap, and AUDIT-28 names all four owners. The layer's real content is the combination: that the plus comparison of K.2:plus turns those three identifications into statements about the K-groups defined here, and that one of the four, Matsumoto's presentation, is field-specific while the others are not. The stage text should be narrowed to that, with the four owners named in it, so that a reader is not led to plan the identifications here. Nothing is dropped: the layer keeps two nodes and four requests.

### K.3 mixes two kinds of theorem and could be divided

*propose-split*

Additivity, resolution and devissage are theorems about a single K-theory space and its comparison with another; localisation and cofinality produce exact sequences relating three of them, and both of those have Waldhausen counterparts in K.4 that this packet keeps there. As one layer, K.3 cannot record that its first three results are available for exact categories with no extra hypotheses while its last two need either abelianness or a cylinder functor. A division into a comparison-theorems layer and a localisation-and-cofinality layer would make the hypothesis boundary visible; the six nodes divide three to three along that line.

### The localisation theorems of K.3 and K.4 are different theorems and should stay apart

*note-hypothesis-boundary*

K.3's stage text warns against asserting localisation for arbitrary exact subcategories. This packet honours that by keeping Quillen's theorem, which is for a Serre subcategory of an abelian category, in K.3, and the Waldhausen theorem, which needs a cylinder functor with the cylinder axiom and saturation and extension for the larger class, in K.4. The two stage texts should each point at the other, because a reader who finds only one of them will be tempted to use it outside its hypotheses; that is exactly the error the K.3 text names.

## What this blueprint does not claim

No Lean was compiled. The Mathlib build on this machine is a shared cache that
must not be rebuilt, and this working tree has no elaborated dependency modules.
Every `implementationStatus` is `unchecked`, the suggested Lean file is a naming
proposal whose proofs are all `sorry`, and nothing here is claimed to be
formalised.

Nineteen excerpts ran past four hundred characters and were elided at a word
boundary, marked with an ellipsis; the locators name the pages so the full text
can be read in the source.
